Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DD0CC6B2D
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 03:33:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E6910E3F9;
	Fri, 16 Oct 2026 03:32:56 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601B210E3F9
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 03:32:50 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8CB00600D4;
 Fri, 16 Oct 2026 03:32:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AA271F000C4;
 Fri, 16 Oct 2026 03:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792121569;
 bh=7tlgf7MU8Sa+cCzlHHXeNo0DB+ordFB0Am6vZzscO9A=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=hGTre7vpcmtn6qdL7nPo0wdXv49Cajtb8CCBwNELrTAG2/nxwsw0eESV4tPdk3JQO
 zn2jvJCHHcuxaH267PwLC2kaNFb0HkuCnlxzrGpvfXl+MfFjtd1Cr6r710AmoE1uMb
 /JjW4Dc+E0lI1JFuyAJydSlJMPkyT9/3sfv2UNXRTEPsZhwzMmLWUleDLHqst2CfaU
 YGwBoxhVJzqGNJXTyn9K3Denpn+HTny1kYCzKBgc+HYosJ6BxDkIH+QfQO7rDmOwFU
 dg4qrlM2Xw5ayXMlDTB5eNnGMdXkOZN9ii6pi4Luw2TvX2/oyAkSg6adZ5BAK1Dztm
 HZR5ev1Je1AOQ==
Message-ID: <sashiko-outbox-173672@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 1/7] drm/xe/gt: Use GT ordered workqueue for wedging
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261016031559.427941-2-raag.jadav@intel.com>
References: <20261016031559.427941-1-raag.jadav@intel.com>
 <20261016031559.427941-2-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 03:32:48 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/xe: gt_wedge_worker memory access assertion fails when device =
is suspended
--

commit 375de707bf2e4590076210ea91f9aecb2bcce131
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/gt: Use GT ordered workqueue for wedging

This commit introduces a GT ordered workqueue for wedging to avoid tearing
down exec queues synchronously and disrupting the scheduler while jobs are
in-flight. It also uses the for_each_initialized_gt() macro to help avoid
races if the device is declared wedged in the probe sequence.

> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index bc9bf6f0b5a79..27f32627a1f9b 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
[ ... ]
> @@ -1204,6 +1209,15 @@ struct xe_hw_engine *xe_gt_any_hw_engine(struct xe=
_gt *gt)
>  	return NULL;
>  }
> =20
> +static void gt_wedge_worker(struct work_struct *w)
> +{
> +	struct xe_gt *gt =3D container_of(w, typeof(*gt), wedge.worker);
> +
> +	xe_device_assert_mem_access(gt_to_xe(gt));

[Severity: High]
Does this assertion safely hold in all contexts? The changelog mentions that
v9 drops the runtime PM guard because callers already hold a reference.
However, looking at the async callers that eventually invoke this worker,
they don't seem to actively hold a runtime PM reference that guarantees the
device is awake.

For example, when an AMC alert is handled:

drivers/gpu/drm/xe/xe_amc.c:xe_amc_work() {
    ...
    case AMC_ALERT_CATERR:
        dev_warn(amc->i2c->drm_dev, "AMC Alert: %s\n",
                 amc_alert[alert_reason]);
        xe_device_declare_wedged(i2c_client_to_xe_device(client));
        break;
    ...
}

Inside xe_device_declare_wedged(), the code uses xe_pm_runtime_get_noresume=
()
and then loops over GTs to call xe_gt_declare_wedged(), which queues this
worker. Since xe_pm_runtime_get_noresume() does not wake up a suspended
device, couldn't this result in gt_wedge_worker() executing while the device
is suspended, failing the xe_device_assert_mem_access() assertion and crash=
ing
the kernel?

A similar pattern appears in
drivers/gpu/drm/xe/xe_pci_error.c:prepare_device_for_reset(), which also us=
es
xe_pm_runtime_get_noresume() before invoking the wedge path.

> +	xe_uc_declare_wedged(&gt->uc);
> +	xe_tlb_inval_reset(&gt->tlb_inval);
> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016031559.4279=
41-1-raag.jadav@intel.com?part=3D1
