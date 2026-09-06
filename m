Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D78BC79F8C
	for <intel-xe@archiver.kernel.org>; Sun,  6 Sep 2026 17:21:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B3FC10E0BD;
	Sun,  6 Sep 2026 17:21:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lQ5nLupx";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D924810E0BD
 for <intel-xe@lists.freedesktop.org>; Sun,  6 Sep 2026 17:21:26 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id B9A7541831;
 Sun,  6 Sep 2026 17:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B22D1F00A3A;
 Sun,  6 Sep 2026 17:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788715286;
 bh=N2UmbLkJC9iREpxgkQJpdJ69MTRqdsQXNprFJyIH9f4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=lQ5nLupx4VnVWxNBG23+sLlHOb/Qgc40SH6Mq43MqMWWj0P930h9wzfYDmCkTjdwM
 rAvvvWbetIxhafSUW4dQxomRmAs9fw/Llcr9f4cqgHliR7018JKACjkQ3OrBUZA4UZ
 hGAGwVkr/ObGLxJ29kmJcD/JZiI18Z+FgU13Gl6pBgL2IR3J2GFPAdVRCBFEz6BBD3
 jXrYwKgWBL2VDrV4au96nNR5U6zCI+eHyPyD1/J8V0YxH3a9cl8lqJzihuhYs+K7sA
 xs7O1Noo/WreCiCVQpdG2Vc3qz/d/gAqa2bVe0dRxmn/j310KKhvAi38bMIPBKKBo3
 fdJ+VBEiYyucQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 01/12] drm/xe/cper: Hardware error CPER reporting
 from xe_log
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260906172604.2215987-15-badal.nilawar@intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
 <20260906172604.2215987-15-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 17:21:26 +0000
Message-Id: <20260906172126.7B22D1F00A3A@smtp.kernel.org>
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
- [High] The condition `if ((int)sigid >=3D INTEL_SIGID_GPU_XE_HARDWARE_STA=
RT)` in `xe_emit_hardware_error_cper()` is inverted, causing the function t=
o immediately drop all hardware error signatures.
--

commit 8d5b33ea1e6386b119b58d344413a048df730b76
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe/cper: Hardware error CPER reporting from xe_log

This commit introduces xe_emit_hardware_error_cper() as a public entry
point for CPER reporting. It also wires up xe_log to route hardware
SIGIDs through this new helper.

> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> new file mode 100644
> index 0000000000000..e8017e3ee3a09
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_cper.c

[ ... ]

> +void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev, enu=
m xe_sigid sigid,
> +				 struct xe_ras_error_class *counter,
> +				 struct xe_ras_get_counter_response *response)
> +{
> +	struct xe_device *xe =3D pdev_to_xe_device(pdev);
> +
> +	if (!xe)
> +		return;
> +
> +	if ((int)sigid >=3D INTEL_SIGID_GPU_XE_HARDWARE_START)
> +		return;

[Severity: High]
Is the condition here inverted?

Looking at log_emit_cper() in xe_log.c, it ensures the signature is a
hardware error before calling this helper:

xe_log.c:log_emit_cper() {
    ...
    if (is_hw_sigid(sigid) && !IS_ERR(data))
        xe_emit_hardware_error_cper(pdev, cper_sev, sigid,
                                    (struct xe_ras_error_class *)data, NULL=
);
    ...
}

Where is_hw_sigid() is defined as:

static bool is_hw_sigid(enum xe_sigid sigid)
{
    return (int)sigid >=3D INTEL_SIGID_GPU_XE_HARDWARE_START;
}

Since xe_emit_hardware_error_cper() immediately returns if the signature
meets this exact same condition, doesn't this unintentionally drop all valid
hardware signatures and prevent the records from being emitted?

> +
> +	/* TODO */
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906172604.2215=
987-14-badal.nilawar@intel.com?part=3D1
