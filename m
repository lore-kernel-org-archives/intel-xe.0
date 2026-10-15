Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E67CCA462
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 23:43:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D21E910E08E;
	Thu, 15 Oct 2026 23:43:12 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FAF910E08E
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 23:43:06 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 538C760A74;
 Thu, 15 Oct 2026 23:43:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDD5E1F000C4;
 Thu, 15 Oct 2026 23:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792107785;
 bh=+mPPc804q+DsPEf/D15eYwS8p3++eZqpS/Woy7BBlLw=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=HL4H3Qno+WC12GLC+6YSzur1zWdJzsXgdc00jc5c647IM1lnuxohyO1KHnN9K7iof
 RIBDvw3gL3xtNymsnyBmDtpEvOQyP74iEzAjoQrJ5nKE25qJrRRMXppLengebd6GAF
 pbGFAR4CgJFr6FXueleE5/L/edgbR4LAyjckIw2/zWpUP89oYyyx8salJmPF43fIdm
 DY6Yw592qh3vCt0dwc6ZkJNzbTs1zI4xvptSMiBd/kkPY+m+DbyddJYz2D2AQSKI5I
 Vdkk9qvRsFKnwhI+y4PBKV7kIdgb7Vuvc1e5sYbyoC7tlQRc+yQhbd7kPR0c/4PIT2
 Sc5rNtCsJ9H6g==
Message-ID: <sashiko-outbox-173473@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] drm/xe: Access MMIO after pcode init
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261015165451.154495-7-vinay.belgaumkar@intel.com>
References: <20261015165451.154495-5-vinay.belgaumkar@intel.com>
 <20261015165451.154495-7-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 23:43:04 +0000
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
- [High] drm/xe: incomplete mmio deferral fix misses xe_wa_apply_tile_worka=
rounds
--

commit a929401ac9f4b4d8f49c85fe7a5336571b384903
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

drm/xe: Access MMIO after pcode init

This commit delays MMIO space accesses during resume until after pcode
initialization is complete. It achieves this by moving xe_gt_idle_disable_c=
6()
after the call to xe_pcode_ready().

> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index daa7ba2df317a..1f5097875bcdf 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -241,9 +241,6 @@ int xe_pm_resume(struct xe_device *xe)
>  	drm_dbg(&xe->drm, "Resuming device\n");
>  	trace_xe_pm_resume(xe, __builtin_return_address(0));
> =20
> -	for_each_gt(gt, xe, id)
> -		xe_gt_idle_disable_c6(gt);
> -
>  	for_each_tile(tile, xe, id)
>  		xe_wa_apply_tile_workarounds(tile);

[Severity: High]
Does this code still access MMIO before pcode initialization completes?

The commit message indicates we shouldn't poke around the MMIO space during
resume before pcode init completes, but xe_wa_apply_tile_workarounds()
performs MMIO accesses via xe_mmio_rmw32() when applying workarounds:

drivers/gpu/drm/xe/xe_wa.c:xe_wa_apply_tile_workarounds() {
	...
	if (XE_DEVICE_WA(tile->xe, 22010954014))
		xe_mmio_rmw32(mmio, XEHP_CLOCK_GATE_DIS, 0, SGSI_SIDECLK_DIS);
}

Should the xe_wa_apply_tile_workarounds() call also be moved after
xe_pcode_ready() to fully prevent MMIO access before the synchronization
barrier?

> =20
> @@ -251,6 +248,9 @@ int xe_pm_resume(struct xe_device *xe)
>  	if (err)
>  		return err;
> =20
> +	for_each_gt(gt, xe, id)
> +		xe_gt_idle_disable_c6(gt);
> +
>  	xe_display_pm_resume_early(xe);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015165451.1544=
95-5-vinay.belgaumkar@intel.com?part=3D2
