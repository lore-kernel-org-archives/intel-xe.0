Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A935DC79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:26:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5936710EB1B;
	Tue,  8 Sep 2026 10:26:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QTeMe9IZ";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED1910EB1E
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:26:22 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 3D9BD601DB;
 Tue,  8 Sep 2026 10:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C95AA1F00A3A;
 Tue,  8 Sep 2026 10:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788863181;
 bh=kReIaNLI0mZLTwEfdEaP9cKIZUczLuFL/boXmTn4mVw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=QTeMe9IZQ3zVa0/AeuO9GHYmiuQMrPD03o5ig3W2T+UIyMSZnF3PCDzzFfOVT4F/3
 QbZrLJmauNv5ZhEw1CKAYV1QxPEkGlW5xNaPT95mIR0jAKKz7P0FKaUYUNWP8QaZ7r
 Smwm0ymHZDWhLh/qFRtTqpYt/QRK/o866oc47mQLQC5ff55QLr48YVIBZWjEH4zgl/
 jMy4CXq/wR5A5LGRWDlk6wNql/kLgk9iT5w3/XGPze14PbFpSB1BZ4bHFjY5rf2Tfp
 PDXIu1NcpRVHZNnXz8vV6UbeZVNQ2SS5GGNcv53MWdrF5amnBsXViPL+dS+jxYkCwm
 VMd7ClWSekS1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/13] drm/xe/pat: Report missing PAT table using
 structured xe_log API
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260908101849.1219614-10-dnyaneshwar.bhadane@intel.com>
References: <20260908101849.1219614-1-dnyaneshwar.bhadane@intel.com>
 <20260908101849.1219614-10-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 10:26:20 +0000
Message-Id: <20260908102620.C95AA1F00A3A@smtp.kernel.org>
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
- [Low] Inconsistent error code between structured log and function return =
value
--

commit 3f9326bca2893681a5346e8107dec4ac43a4112b
Author: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

drm/xe/pat: Report missing PAT table using structured xe_log API

This commit replaces the standard drm_err() logging with the structured
xe_log_err() API using the PAT component tag for platforms that do not
have a matching PAT table entry.

> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 8af92e3c4c17c..f012eaba838a2 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c

[ ... ]

> @@ -678,8 +679,9 @@ int xe_pat_init_early(struct xe_device *xe)
>  		xe->pat.idx[XE_CACHE_WT] =3D 2;
>  		xe->pat.idx[XE_CACHE_WB] =3D 0;
>  	} else {
> -		drm_err(&xe->drm, "Missing PAT table for platform with graphics versio=
n %d.%02d!\n",
> -			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
> +		xe_log_err(xe, PAT, -EINVAL,
> +			   "Missing PAT table for platform with graphics version %d.%02d!\n",
> +			   GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
>  		return -ENODATA;

[Severity: Low]
Does this code intentionally log -EINVAL but return -ENODATA? Reaching the
end of the platform matching chain in xe_pat_init_early() logs one error
code (-EINVAL) to the structured telemetry API but returns a different one
(-ENODATA) to its caller. Would it be better to align these error codes to
prevent confusion during debugging or automated log analysis?

> =20
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908101849.1219=
614-1-dnyaneshwar.bhadane@intel.com?part=3D9
