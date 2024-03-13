Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3527BC54E58
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 10:56:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E9AB10F77D;
	Wed, 13 Mar 2024 10:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TaBY/a1F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D4810F3F1
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 10:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710327377; x=1741863377;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=bJ71O+etEvNf0wtTiNs3Y+XLqiBg899NKq5iMNA6ozg=;
 b=TaBY/a1FNUCuIJwBWG4+rBsgKXcuvzPrAp4MJPzUsqQIN8H2YFapmL9N
 gTmlMoePxZbq3/1rPK/QkIpyEsx9sAAEwj/f+peYS+Ki4yJit4GCzR1W/
 SU9/CAE1qkmunOX2YC+lJo5fzj7UI+JM4vrfcO3r/rKixSZz3RrvzrfM8
 SngPr28URNOAjCYBB0ethmd6lKD9gREzgqjb3ms8MimUrGdFS0kJOuKDd
 oiouspVa6fLZlWVdDeUHt/h0DXNE459CBMHdC/Ieg2humMKMYxF/tCaqK
 feYbXC/1FkwTT6teeUfu9Z77y9x4g6wh/XsuyA1MyF9L0TFouLFHxrNH0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="16530815"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="16530815"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 03:56:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="42820813"
Received: from janlundk-mobl.ger.corp.intel.com (HELO [10.249.254.162])
 ([10.249.254.162])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 03:56:14 -0700
Message-ID: <a8c507084e016186e0fb75c45b826f612ddc6c40.camel@linux.intel.com>
Subject: Re: Separating xe_vma- and page-table state
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, "Zeng, Oak" <oak.zeng@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Date: Wed, 13 Mar 2024 11:56:12 +0100
In-Reply-To: <ZfEA5ieJ+M9rttI3@DUT025-TGLU.fm.intel.com>
References: <72ea6bc36260bcc2eaeb97d1abcb8bebf69f3f53.camel@linux.intel.com>
 <SA1PR11MB699139B15B97B2B056312F41922B2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZfEA5ieJ+M9rttI3@DUT025-TGLU.fm.intel.com>
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

On Wed, 2024-03-13 at 01:27 +0000, Matthew Brost wrote:
> On Tue, Mar 12, 2024 at 05:02:20PM -0600, Zeng, Oak wrote:
> > Hi Thomas,
>=20
>=20

....

> Thomas:
>=20
> I like the idea of VMAs in the PT code function being marked as const
> and having the xe_pt_state as non const. It makes ownership very
> clear.
>=20
> Not sure how that will fit into [1] as that series passes around
> a "struct xe_vm_ops" which is a list of "struct xe_vma_op". It does
> this
> to make "struct xe_vm_ops" a single atomic operation. The VMAs are
> extracted either the GPUVM base operation or "struct xe_vma_op".
> Maybe
> these can be const? I'll look into that but this might not work out
> in
> practice.
>=20
> Agree also unsure how 1:N xe_vma <-> xe_pt_state relationship fits in
> hmmptrs. Could you explain your thinking here?

There is a need for hmmptrs to be sparse. When we fault we create a
chunk of PTEs that we populate. This chunk could potentially be large
and covering the whole CPU vma or it could be limited to, say 2MiB and
aligned to allow for large page-table entries. In Oak's POC these
chunks are called "svm ranges"

So the question arises, how do we map that to the current vma
management and page-table code? There are basically two ways:

1) Split VMAs so they are either fully populated or unpopulated, each
svm_range becomes an xe_vma.
2) Create xe_pt_range / xe_pt_state whatever with an 1:1 mapping with
the svm_mange and a 1:N mapping with xe_vmas.

Initially my thinking was that 1) Would be the simplest approach with
the code we have today. I lifted that briefly with Sima and he answered
"And why would we want to do that?", and the answer at hand was ofc
that the page-table code worked with vmas. Or rather that we mix vma
state (the hmmptr range / attributes) and page-table state (the regions
of the hmmptr that are actually populated), so it would be a
consequence of our current implementation (limitations).

With the suggestion to separate vma state and pt state, the xe_svm
ranges map to pt state and are managed per hmmptr vma. The vmas would
then be split mainly as a result of UMD mapping something else (bo) on
top, or UMD giving new memory attributes for a range (madvise type of
operations).

/Thomas









