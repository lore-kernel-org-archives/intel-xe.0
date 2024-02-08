Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A53C4828F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Feb 2024 21:34:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9E010EE58;
	Thu,  8 Feb 2024 21:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mBJ0L7Dz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8DB10EE58
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Feb 2024 21:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707428044; x=1738964044;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=3xX9s+2UFntoE2Td2stzmdshme+97peoOBEkT7cmGlQ=;
 b=mBJ0L7Dz8gm85GU7NRnpgyyhsKH8SJuOaU58uDH0pPi4qbSYVP86BfQe
 NNQGN1gR06DWFEfLi7ov4xICVXJmhFu1v/IkGJGZqgBqGi3UdB/2B8mab
 mrsONdVyCp6NPd7TzjqDviJLXgy/sniu1MFJFhE8fZEicqrh84md0Q7TM
 XOicroF2FZHX8Bo7ZP2DA9FqvTbAp4C6X5EAj2f0JqkXu+bZ+rH5tJXZu
 jlDxL9QWF/iTZD1yomXy8SFeYs/KZB+IGFYoTfB7pTtwGupsXfsAGGDLo
 X7eayIyGcA7BETk9eU4JksoWeXarsNjlrD7OhpTp+cQdYuAhOt5BiiqK6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1619836"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1619836"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 13:33:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="6387160"
Received: from pplotits-mobl2.ccr.corp.intel.com (HELO [10.249.254.149])
 ([10.249.254.149])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 13:33:56 -0800
Message-ID: <3b158fb0e8c006660d7e336d982574be8eaab7f9.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe/vm: Avoid reserving zero fences
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Date: Thu, 08 Feb 2024 22:33:55 +0100
In-Reply-To: <db8e0317-a13b-4ca9-b352-55223df9ed3b@intel.com>
References: <20240208132115.3132-1-thomas.hellstrom@linux.intel.com>
 <4d058e2e-dd9b-4765-b579-c1cdca71ca41@intel.com>
 <f7638e75a7cc0c1d289875e81cde4d8772f197e7.camel@linux.intel.com>
 <db8e0317-a13b-4ca9-b352-55223df9ed3b@intel.com>
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

On Thu, 2024-02-08 at 18:19 +0000, Matthew Auld wrote:
> On 08/02/2024 15:19, Thomas Hellstr=C3=B6m wrote:
> > On Thu, 2024-02-08 at 15:05 +0000, Matthew Auld wrote:
> > > On 08/02/2024 13:21, Thomas Hellstr=C3=B6m wrote:
> > > > The function xe_vm_prepare_vma was blindly accepting zero as
> > > > the
> > > > number of fences and forwarded that to drm_exec_prepare_obj.
> > > >=20
> > > > However, that leads to an out-of-bounds shift in the
> > > > dma_resv_reserve_fences() and while one could argue that the
> > > > dma_resv code should be robust against that, avoid attempting
> > > > to reserve zero fences.
> > > >=20
> > > > Relevant stack trace:
> > > >=20
> > > > [773.183188] ------------[ cut here ]------------
> > > > [773.183199] UBSAN: shift-out-of-bounds in
> > > > ../include/linux/log2.h:57:13
> > > > [773.183241] shift exponent 64 is too large for 64-bit type
> > > > 'long
> > > > unsigned int'
> > > > [773.183254] CPU: 2 PID: 1816 Comm: xe_evict Tainted: G
> > > > U=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 6.8.0-rc3-xe #1
> > > > [773.183256] Hardware name: ASUS System Product Name/PRIME
> > > > Z690-P
> > > > D4, BIOS 2014 10/14/2022
> > > > [773.183257] Call Trace:
> > > > [773.183258]=C2=A0 <TASK>
> > > > [773.183260]=C2=A0 dump_stack_lvl+0xaf/0xd0
> > > > [773.183266]=C2=A0 dump_stack+0x10/0x20
> > > > [773.183283]=C2=A0 ubsan_epilogue+0x9/0x40
> > > > [773.183286]=C2=A0 __ubsan_handle_shift_out_of_bounds+0x10f/0x170
> > > > [773.183293]=C2=A0 dma_resv_reserve_fences.cold+0x2b/0x48
> > > > [773.183295]=C2=A0 ? ww_mutex_lock+0x3c/0x110
> > > > [773.183301]=C2=A0 drm_exec_prepare_obj+0x45/0x60 [drm_exec]
> > > > [773.183313]=C2=A0 xe_vm_prepare_vma+0x33/0x70 [xe]
> > > > [773.183375]=C2=A0 xe_vma_destroy_unlocked+0x55/0xa0 [xe]
> > > > [773.183427]=C2=A0 xe_vm_close_and_put+0x526/0x940 [xe]
> > > >=20
> > > > Fixes: 2714d5093620 ("drm/xe: Convert pagefaulting code to use
> > > > drm_exec")
> > > > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > > <thomas.hellstrom@linux.intel.com>
> > > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> >=20
> > Thanks, Matthew
> > What happened to your dma-resv patch you had for this?
>=20
> I don't recall any dma-resv patch, or am I misremembering?=C2=A0 :)

No, it was me misremembering. It was Mika's patch. Sorry about that :)

/Thomas


>=20
> >=20
> >=20
> > /Thomas

