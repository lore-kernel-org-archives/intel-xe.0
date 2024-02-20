Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91AEC54764
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 08:43:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6FA10E20E;
	Tue, 20 Feb 2024 08:43:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m/G+1CJR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA2810E220
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 08:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708418608; x=1739954608;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=54KJpmOysBoR7cT7IPV3MpnIErResL2B68FBm3CEFSM=;
 b=m/G+1CJRd8G6MVjY4HjttQzpTaJhGxlVFwgOO3PXX7xDRfq24xlmmb1T
 1BdnDMLX6COSAKLvW2iyxFcWzOsdsLahCyp5YFnUlr9UgacEG1mAIJOXp
 +PPGNfm1w8RZNn1mtwpTPSnq+wexYRFDCvAtzQ25NJNZxZxrCdCAk8oaV
 1ajxcXU4+8zW9HYu850TR8mS63efy7nN1qFW4oEZPzmtT7B7CZ0J1krLM
 xVgo4EneZn1YOvpDF+T9aRlLPLRK6apGs0Nfdbmr01mye6pi/LrD/ZDzG
 5GkG7qIRNEbku2cnk2l22cH55pYviUYvo2eYv5IC0JJq1+eb1E3/ESeth A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2372145"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="2372145"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 00:43:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="4680946"
Received: from ettammin-mobl1.ger.corp.intel.com (HELO [10.249.254.16])
 ([10.249.254.16])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 00:43:27 -0800
Message-ID: <0bbe11b784cf6c4650615fb883c0aee7e10853b1.camel@linux.intel.com>
Subject: Re: [PATCH v2 1/3] drm/xe: Fix xe_vma_set_pte_size
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Date: Tue, 20 Feb 2024 09:43:24 +0100
In-Reply-To: <20240219211942.3633795-2-matthew.brost@intel.com>
References: <20240219211942.3633795-1-matthew.brost@intel.com>
 <20240219211942.3633795-2-matthew.brost@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
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

On Mon, 2024-02-19 at 13:19 -0800, Matthew Brost wrote:
> xe_vma_set_pte_size had a return value and did not set the 4k VMA
> flag.
> Both of these were incorrect. Fix these.
>=20
> Fixes: c47794bdd63d ("drm/xe: Set max pte size when skipping
> rebinds")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_vm.c | 7 ++++---
> =C2=A01 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 836a6e849cda..2b0c76c663e5 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2198,7 +2198,7 @@ static u64 xe_vma_max_pte_size(struct xe_vma
> *vma)
> =C2=A0	return SZ_1G;	/* Uninitialized, used max size */
> =C2=A0}
> =C2=A0
> -static u64 xe_vma_set_pte_size(struct xe_vma *vma, u64 size)
> +static void xe_vma_set_pte_size(struct xe_vma *vma, u64 size)
> =C2=A0{
> =C2=A0	switch (size) {
> =C2=A0	case SZ_1G:
> @@ -2207,9 +2207,10 @@ static u64 xe_vma_set_pte_size(struct xe_vma
> *vma, u64 size)
> =C2=A0	case SZ_2M:
> =C2=A0		vma->gpuva.flags |=3D XE_VMA_PTE_2M;
> =C2=A0		break;
> +	case SZ_4K:
> +		vma->gpuva.flags |=3D XE_VMA_PTE_4K;
> +		break;
> =C2=A0	}
> -
> -	return SZ_4K;
> =C2=A0}
> =C2=A0
> =C2=A0static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)

