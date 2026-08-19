Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E158C5DF81
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 19:28:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD37210E02D;
	Wed, 19 Aug 2026 19:28:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ke8/yxtQ";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89BE10E02D
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 19:28:42 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id B21CE401CB;
 Wed, 19 Aug 2026 19:28:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 773EC1F000E9;
 Wed, 19 Aug 2026 19:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787167722;
 bh=/p7f0AMZ1NhEVRN4uNe3eodlprOqq5k8Vb6rZtsN6Eg=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Ke8/yxtQE7dUU3Ef7vYrydruWXkuFBMuP/JqzyIcfh78++GGZDNVfsxMYNc7eAzku
 FLXMd2Rs/ZGrLP2l25/JofsTer43FUl6PoK39LBjCZdnV3o7DmIcwC0gKWR629tzHM
 twX5/ZB/M2SCL1H4o0jyskjv9XslGDiSqIxVZHR7dQMGvU7ZaaJFcS/rXZlhG29gN9
 DclKAl4/rpTTEwWkPTN/LzrzhK08mBRYWjym+3ZbisCSaFr7g1MI5xRDOvAV4XAjg6
 h0ys+zhtPfCIoyCQntr0TChRbA/mt3SNVDDSOZjWFMFiaHjJtMMb5+XSmJDxNnPpwD
 OCTrS0H3Esvuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/12] drm/xe/lmtt: Report invalidation errors using
 structured xe_log API
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260819191442.1957986-12-dnyaneshwar.bhadane@intel.com>
References: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
 <20260819191442.1957986-12-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 19:28:42 +0000
Message-Id: <20260819192842.773EC1F000E9@smtp.kernel.org>
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
- [Medium] Incorrect error code passed to structured logging and redundant =
error formatting.
--

--- Patch [11]: [PATCH 11/12] drm/xe/lmtt: Report invalidation errors using=
 structured xe_log API ---
commit 923aca6a5a5574864c744c6654055fb24cc4ad4d
Author: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

drm/xe/lmtt: Report invalidation errors using structured xe_log API

This commit replaces xe_tile_sriov_err() with xe_log_err() using the LMTT
component tag for LMTT and MERT invalidation failures. It attempts to
preserve the SR-IOV prefix in the log messages.

> diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
> --- a/drivers/gpu/drm/xe/xe_lmtt.c
> +++ b/drivers/gpu/drm/xe/xe_lmtt.c
[ ... ]
> @@ -302,14 +303,16 @@ void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt)
> =20
>  	err =3D lmtt_invalidate_hw(lmtt);
>  	if (err)
> -		xe_tile_sriov_err(tile, "LMTT invalidation failed (%pe)",
> -				  ERR_PTR(err));
> +		xe_log_err(tile, LMTT, -EIO,  "%s invalidation failed (%pe)",
> +			   xe_sriov_printk_prefix(xe),
> +			   ERR_PTR(err));

[Severity: Medium]
Since err holds the actual error code returned by lmtt_invalidate_hw(),
should this pass err to xe_log_err instead of hardcoding -EIO?

Additionally, does explicitly including (%pe) in the format string here
result in redundant and conflicting error codes in the log output, since
xe_log_err() automatically records the passed error code?

> =20
>  	if (xe_device_has_mert(xe) && xe_tile_is_root(tile)) {
>  		err =3D xe_mert_invalidate_lmtt(xe);
>  		if (err)
> -			xe_tile_sriov_err(tile, "MERT LMTT invalidation failed (%pe)",
> -					  ERR_PTR(err));
> +			xe_log_err(tile, LMTT, -EIO,  "%s MERT invalidation failed (%pe)",
> +				   xe_sriov_printk_prefix(xe),
> +				   ERR_PTR(err));

[Severity: Medium]
Similar to the above, xe_mert_invalidate_lmtt() can return -ETIMEDOUT. Does
hardcoding -EIO here result in incorrect structured telemetry logs?

Also, would removing the (%pe) simplify the format string and avoid
redundant logging?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819191442.1957=
986-1-dnyaneshwar.bhadane@intel.com?part=3D11
