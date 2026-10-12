Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593A3CA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 04:29:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E954410E453;
	Mon, 12 Oct 2026 04:28:57 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC18F10E453;
 Mon, 12 Oct 2026 04:28:51 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 1D58D601FA;
 Mon, 12 Oct 2026 04:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D3DF1F0089B;
 Mon, 12 Oct 2026 04:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791779330;
 bh=d8niCP133bG2qEnZWhnY/r02q9cQz0Yt+h2pFFRBOeo=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=dcuF9ms0nYKh/Op2/64cI2HHv5fPckojF+tKg/CVlYb/gYgBNjZ/+ruyO6XYg/ksC
 UgdPOEm797xm9i0lJFdm+nQOKTcgzH65QXK9FFznN8Z+STmqGGDnfgIVgWPfj7D1WE
 fmulxQMiUGHU7JOI/Rj4dlzdn23XYs5LPCDnecqYt9qdHSbs9BLSDp1aNJrqr0byyM
 xhntmPy7dqflgitZCmRiFpFVa1ZC9DcmNW0p9R3b3dDLfwDbKvp8SkITGpg53slQzh
 0NTDqD3QMSASwdhj5jniRI2GJCUGLmPnsZWkviiu4PWkEWyLUIf03n7EmXVN9ovuh8
 XQyzbgEnlL+ew==
Message-ID: <sashiko-outbox-167596@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] drm/i915/display: Allow port sync on PTL
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20261012040402.3332398-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20261012040402.3332398-1-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 04:28:50 +0000
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] drm/i915/display: platform flag overloading enables port sync on=
 WCL without verification
- [Low] drm/i915: comment contradicts updated code logic for Wa_16024710867=
 on PTL/xe3lpd
--

commit 29ddf626c62c8cb13575a86bd458e68f572eb3fa
Author: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

drm/i915/display: Allow port sync on PTL

This commit enables port sync on PTL to avoid visual corruption on dual-SST
tiled displays. It expands the version check up to display version 30 to by=
pass
a previous hardware workaround.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8991
Fixes: 05cffc074938 ("drm/i915/display: Implement Wa_16024710867")
Cc: stable@vger.kernel.org

> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i=
915/display/intel_ddi.c
> index a46ab5d3d70fc..a0aff087fafa8 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -4629,7 +4629,7 @@ intel_ddi_port_sync_transcoders(const struct intel_=
crtc_state *ref_crtc_state,
>  	 * From, xe3lpd onwards we have defeatured this with reference to
>  	 * Wa_16024710867
>  	 */

[Severity: Low]
Is this comment still accurate? It states that port sync is defeatured from
xe3lpd onwards with reference to Wa_16024710867, but the check immediately
below now enables it for DISPLAY_VER 30 (which includes PTL/xe3lpd), direct=
ly
contradicting the comment.

> -	if (!IS_DISPLAY_VER(display, 9, 20))
> +	if (!IS_DISPLAY_VER(display, 9, 30))

[Severity: Medium]
Does this unconditionally enable port sync for all display version 30 hardw=
are,
including both PTL and WCL?

The commit message justifies enabling port sync specifically for Panther La=
ke
(PTL) to address visual corruption. However, expanding the version check up=
 to
30 covers both PTL and WCL.=20

Without subplatform differentiation, could this inadvertently re-expose WCL=
 to
the display issues that Wa_16024710867 was originally meant to fix? Should
this use subplatform-specific checks to exclude WCL?

>  		return 0;
> =20
>  	if (!intel_crtc_has_type(ref_crtc_state, INTEL_OUTPUT_DP))

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012040402.3332=
398-1-mitulkumar.ajitkumar.golani@intel.com?part=3D1
