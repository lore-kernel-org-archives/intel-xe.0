Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A100FD1BDE5
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 19:24:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6023610E4B9;
	Mon,  4 Nov 2024 19:24:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MZ1thgFP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF54110E4B9
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Nov 2024 19:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730748261; x=1762284261;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=WnwEtoUfWkaHH1HexU4BDo0DEkwF8+u7M2b23Q1HVPI=;
 b=MZ1thgFPhSKNWjmgfwDZmh0gXf8mswVzN55tTpG/8s0Y32JsDi2Wt5Rv
 sWqFCBaCiINVP+8SyxKKuQS7Dbz8dGRcX9fz8ZiZLIrcvsekxGc2tMlb0
 Z/X+tlQBIXKnQsTPeJHwN9L2uhtyiq4k3H1Y9RtOQmUUKtd7Me069EopM
 fLVsxZBG7JMBlyk4lmQvDdGkQsDd9LRC3HAr1aA3CZHfQMaLY7DpiqAg0
 B0B9HxKjhN53qOxV5HaGjQK4q8LQkVdSJZPi7yNTTV2gFsvldVc2DTEWI
 AMkmmdBBw5ElW3jorHEGQYGZiT7JhDJSkYqCUAEPoVVGy59vOhimx+qz/ A==;
X-CSE-ConnectionGUID: NFtY9vvIQaWgBXe2vmgyiQ==
X-CSE-MsgGUID: X+ledTZ1R6mFd96djlLFdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="30577210"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="30577210"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 11:24:20 -0800
X-CSE-ConnectionGUID: 3Cs7Ru5+S3OZ0gK4FmLrog==
X-CSE-MsgGUID: /zF2j6W+T2q/jH8339f+Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="83426731"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.246.28])
 ([10.245.246.28])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 11:24:19 -0800
Message-ID: <2f2ed0abb1260579d004fa6746a8f4b8e75064db.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Fix drm-next merge
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Mon, 04 Nov 2024 20:24:16 +0100
In-Reply-To: <20241104183104.2265275-1-lucas.demarchi@intel.com>
References: <20241104183104.2265275-1-lucas.demarchi@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 2024-11-04 at 10:31 -0800, Lucas De Marchi wrote:
> Fix merge in commit c787c2901e2c ("Merge drm/drm-next into
> drm-xe-next"). That workaround needs to be done only once.
>=20
> Fixes: c787c2901e2c ("Merge drm/drm-next into drm-xe-next")
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_guc_ct.c | 19 -------------------
> =C2=A01 file changed, 19 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c
> b/drivers/gpu/drm/xe/xe_guc_ct.c
> index a405b9218ad2d..550eeed43903b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1017,7 +1017,6 @@ static int guc_ct_send_recv(struct xe_guc_ct
> *ct, const u32 *action, u32 len,
> =C2=A0	}
> =C2=A0
> =C2=A0	ret =3D wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done,
> HZ);
> -

This looks unrelated.
Otherwise LGTM.
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> =C2=A0	if (!ret) {
> =C2=A0		LNL_FLUSH_WORK(&ct->g2h_worker);
> =C2=A0		if (g2h_fence.done) {
> @@ -1027,24 +1026,6 @@ static int guc_ct_send_recv(struct xe_guc_ct
> *ct, const u32 *action, u32 len,
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> -	/*
> -	 * Occasionally it is seen that the G2H worker starts
> running after a delay of more than
> -	 * a second even after being queued and activated by the
> Linux workqueue subsystem. This
> -	 * leads to G2H timeout error. The root cause of issue lies
> with scheduling latency of
> -	 * Lunarlake Hybrid CPU. Issue dissappears if we disable
> Lunarlake atom cores from BIOS
> -	 * and this is beyond xe kmd.
> -	 *
> -	 * TODO: Drop this change once workqueue scheduling delay
> issue is fixed on LNL Hybrid CPU.
> -	 */
> -	if (!ret) {
> -		flush_work(&ct->g2h_worker);
> -		if (g2h_fence.done) {
> -			xe_gt_warn(gt, "G2H fence %u, action %04x,
> done\n",
> -				=C2=A0=C2=A0 g2h_fence.seqno, action[0]);
> -			ret =3D 1;
> -		}
> -	}
> -
> =C2=A0	/*
> =C2=A0	 * Ensure we serialize with completion side to prevent UAF
> with fence going out of scope on
> =C2=A0	 * the stack, since we have no clue if it will fire after
> the timeout before we can erase

