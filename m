Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 555B5C624A4
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 14:32:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E5510E123;
	Thu,  3 Sep 2026 14:32:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LhCiOCDg";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82D110E123
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 14:32:27 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 66192414B9;
 Thu,  3 Sep 2026 14:32:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28D741F00A3D;
 Thu,  3 Sep 2026 14:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788445947;
 bh=DEQ3rR8VpZuRjab3wJYyoCw/VZU5pVVuTNKbKSUTz4A=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=LhCiOCDgWfRasj6271jjE+MqjYSakfEv8vBGCTeCTsAZ7RO/uLij8n0ltUCdXPZyZ
 o/35g2vS7j4BHJ1s4r+dN/1dl0XSXOVoxs7bm2wZHLRwuk5ofaXoaIotWU6yoj8seG
 ZKxeStUxrgclAF0H2qPgL40RD+VsGyLvOfUM6aS0S/NlkBptC8IlFjEUIGHUQpzEpJ
 DHQoQsH8D+u7wCbHaptpqyha46AJc50t4NIe/5bwbVh+MwQ0IVH1OFFI+upoOGw4fE
 DNjY+2CQZKBrL9LRXNQKSnfS2q3dizawBRMFijROOR5Hi33fMJwylyb77K3E688CkE
 YcbR+XI3bSxoA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/7] drm/xe/devcoredump: Capture GT fuse registers in
 devcoredump
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903141834.1315675-2-naresh.kumar.g@intel.com>
References: <20260903141834.1315675-1-naresh.kumar.g@intel.com>
 <20260903141834.1315675-2-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 14:32:26 +0000
Message-Id: <20260903143227.28D741F00A3D@smtp.kernel.org>
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
- [Low] Hardcoded array index used to check the POWERGATE_ENABLE register i=
s fragile.
--

commit b7d03cc3b56be0544af3370f72a4384e4131de66
Author: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>

    drm/xe/devcoredump: Capture GT fuse registers in devcoredump
   =20
    Capture fuse-related GT register state in the Xe devcoredump to preserve
    additional hardware configuration information for postmortem debugging.

> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_=
devcoredump.c
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c

[ ... ]

> +static const struct xe_reg_desc xe3p_gt_rpm_reglist[] =3D {
> +	XE_REG_DESC(RPM_GCD, "RPM_GCD"),
> +	XE_REG_DESC(POWERGATE_ENABLE, "POWERGATE_ENABLE"),
> +};

[ ... ]

> +static void xe_gt_rpm_snapshot_print(struct drm_printer *p,
> +				     const struct xe_dbg_reg_snapshot *snap)
> +{
> +	xe_dbg_reg_snapshot_print(p, snap);
> +
> +	if (snap && snap->num_regs >=3D 2 &&
> +	    !(snap->regs[1].value & RENDER_POWERGATE_ENABLE))
[Severity: Low]
Is it safe to use a hardcoded array index in xe_gt_rpm_snapshot_print() her=
e?

This check tightly couples the print logic to the exact ordering of element=
s in
the xe3p_gt_rpm_reglist array, relying on POWERGATE_ENABLE remaining at ind=
ex
1. If a future commit inserts or reorders elements in xe3p_gt_rpm_reglist,
it could silently break this print logic by evaluating the wrong register's
value.

Could this be made more robust against future modifications to the underlyi=
ng
static register list?

> +		drm_puts(p, "render powergating appears not enabled\n");
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903141834.1315=
675-1-naresh.kumar.g@intel.com?part=3D1
