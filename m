Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6483EC4828F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Feb 2024 15:19:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06CB510E8B8;
	Thu,  8 Feb 2024 15:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DzlMxLQ6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995CF10E886
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Feb 2024 15:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707405553; x=1738941553;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=H3mh6tMjro0Bx4ICLo2EIBSFXeeGLPbqY57Xpe7GS50=;
 b=DzlMxLQ65L18uxQCjIv/9hIQ7TEpbIe9fW4QPIQnVk2y1lKlyxwdamxY
 PDb8w69TDJ0Zdljz/fnZSwN6Qo9R5I2ZkoNtJrAdmF+fBK5R+gTc6jyfN
 7BkFWmLZ8Sl70iS+fL7fbxKc2K0/7sloJSTmJIjZVUY2eVmCjhEDWhG86
 vTOr/X689Ud6qmCkzA+or94OrlVu8FSEXAcw8+57Hz+G+hlGXOuQqVNJR
 qAtH8sFuJUN5keYs9QgF3QEU95o0KBbaqz/iewaghKBIk9UHVQtWDeU4t
 l6Ovbbrdv1WdWFDyzovC9p583/Tm8PhjPbTkVd1KlWXGAanLXFJ0zVvxB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="18657575"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="18657575"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 07:19:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="24915981"
Received: from pplotits-mobl2.ccr.corp.intel.com (HELO [10.249.254.149])
 ([10.249.254.149])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 07:19:10 -0800
Message-ID: <f7638e75a7cc0c1d289875e81cde4d8772f197e7.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe/vm: Avoid reserving zero fences
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Date: Thu, 08 Feb 2024 16:19:08 +0100
In-Reply-To: <4d058e2e-dd9b-4765-b579-c1cdca71ca41@intel.com>
References: <20240208132115.3132-1-thomas.hellstrom@linux.intel.com>
 <4d058e2e-dd9b-4765-b579-c1cdca71ca41@intel.com>
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

On Thu, 2024-02-08 at 15:05 +0000, Matthew Auld wrote:
> On 08/02/2024 13:21, Thomas Hellstr=C3=B6m wrote:
> > The function xe_vm_prepare_vma was blindly accepting zero as the
> > number of fences and forwarded that to drm_exec_prepare_obj.
> >=20
> > However, that leads to an out-of-bounds shift in the
> > dma_resv_reserve_fences() and while one could argue that the
> > dma_resv code should be robust against that, avoid attempting
> > to reserve zero fences.
> >=20
> > Relevant stack trace:
> >=20
> > [773.183188] ------------[ cut here ]------------
> > [773.183199] UBSAN: shift-out-of-bounds in
> > ../include/linux/log2.h:57:13
> > [773.183241] shift exponent 64 is too large for 64-bit type 'long
> > unsigned int'
> > [773.183254] CPU: 2 PID: 1816 Comm: xe_evict Tainted: G=C2=A0=C2=A0=C2=
=A0=C2=A0
> > U=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 6.8.0-rc3-xe #1
> > [773.183256] Hardware name: ASUS System Product Name/PRIME Z690-P
> > D4, BIOS 2014 10/14/2022
> > [773.183257] Call Trace:
> > [773.183258]=C2=A0 <TASK>
> > [773.183260]=C2=A0 dump_stack_lvl+0xaf/0xd0
> > [773.183266]=C2=A0 dump_stack+0x10/0x20
> > [773.183283]=C2=A0 ubsan_epilogue+0x9/0x40
> > [773.183286]=C2=A0 __ubsan_handle_shift_out_of_bounds+0x10f/0x170
> > [773.183293]=C2=A0 dma_resv_reserve_fences.cold+0x2b/0x48
> > [773.183295]=C2=A0 ? ww_mutex_lock+0x3c/0x110
> > [773.183301]=C2=A0 drm_exec_prepare_obj+0x45/0x60 [drm_exec]
> > [773.183313]=C2=A0 xe_vm_prepare_vma+0x33/0x70 [xe]
> > [773.183375]=C2=A0 xe_vma_destroy_unlocked+0x55/0xa0 [xe]
> > [773.183427]=C2=A0 xe_vm_close_and_put+0x526/0x940 [xe]
> >=20
> > Fixes: 2714d5093620 ("drm/xe: Convert pagefaulting code to use
> > drm_exec")
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Thanks, Matthew
What happened to your dma-resv patch you had for this?


/Thomas
