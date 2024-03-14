Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AADC5475B
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 08:57:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9FF10EE30;
	Thu, 14 Mar 2024 08:57:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z4+LizSV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DB810E82D
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 08:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710406648; x=1741942648;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=AMEsc5b7Y5o6d6HeejGqi0yZGWqtiMggUOb8MW945vY=;
 b=Z4+LizSVWqp4WbN/sMVVi3Z8KjWA08lBVqm5SCvU3iq2hph6siiilMZZ
 S/SxTvPwuaUMVG4lXKyP7T2kGU0/mC4SUxwA/WbKwPGZs5Xy6VumrCMSM
 dFXYef6sggN0K43BXKoEerOL1RTyVFpI4UsNDQ2/eQIOOlIPbJ6BcX4cC
 pPAWR3sKLlio1WRC/dgNUzZdeOSftsayeyk7VPcWuCaqCTaOMtZVSJSeh
 TjMTFngKVBOVz2ZVdzxZqAPPeoco4FdHZwvN99wxM2ohdBF10UcXnKzQh
 CaJpJ/2o9SatPaiSYeDLqwNMyeJMb+ONCpnslqul7NK72LVq+T/jH/+WC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="16608561"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; d="scan'208";a="16608561"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 01:57:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; d="scan'208";a="16816459"
Received: from mstribae-mobl.ger.corp.intel.com (HELO [10.249.254.78])
 ([10.249.254.78])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 01:57:15 -0700
Message-ID: <af5a8b6434fad3c8e2647bfc914c954da5edc40c.camel@linux.intel.com>
Subject: Re: Separating xe_vma- and page-table state
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: "Zeng, Oak" <oak.zeng@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Date: Thu, 14 Mar 2024 09:57:12 +0100
In-Reply-To: <ZfIB41awiIoMvotS@DUT025-TGLU.fm.intel.com>
References: <72ea6bc36260bcc2eaeb97d1abcb8bebf69f3f53.camel@linux.intel.com>
 <SA1PR11MB699139B15B97B2B056312F41922B2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZfEA5ieJ+M9rttI3@DUT025-TGLU.fm.intel.com>
 <a8c507084e016186e0fb75c45b826f612ddc6c40.camel@linux.intel.com>
 <ZfIB41awiIoMvotS@DUT025-TGLU.fm.intel.com>
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

Hi, Matt,


 Wed, 2024-03-13 at 19:43 +0000, Matthew Brost wrote:
> On Wed, Mar 13, 2024 at 11:56:12AM +0100, Thomas Hellstr=C3=B6m wrote:
> > On Wed, 2024-03-13 at 01:27 +0000, Matthew Brost wrote:
> > > On Tue, Mar 12, 2024 at 05:02:20PM -0600, Zeng, Oak wrote:
> > > > Hi Thomas,
> > >=20
> > >=20
> >=20
> > ....
> >=20
> > > Thomas:
> > >=20
> > > I like the idea of VMAs in the PT code function being marked as
> > > const
> > > and having the xe_pt_state as non const. It makes ownership very
> > > clear.
> > >=20
> > > Not sure how that will fit into [1] as that series passes around
> > > a "struct xe_vm_ops" which is a list of "struct xe_vma_op". It
> > > does
> > > this
> > > to make "struct xe_vm_ops" a single atomic operation. The VMAs
> > > are
> > > extracted either the GPUVM base operation or "struct xe_vma_op".
> > > Maybe
> > > these can be const? I'll look into that but this might not work
> > > out
> > > in
> > > practice.
> > >=20
> > > Agree also unsure how 1:N xe_vma <-> xe_pt_state relationship
> > > fits in
> > > hmmptrs. Could you explain your thinking here?
> >=20
> > There is a need for hmmptrs to be sparse. When we fault we create a
> > chunk of PTEs that we populate. This chunk could potentially be
> > large
> > and covering the whole CPU vma or it could be limited to, say 2MiB
> > and
> > aligned to allow for large page-table entries. In Oak's POC these
> > chunks are called "svm ranges"
> >=20
> > So the question arises, how do we map that to the current vma
> > management and page-table code? There are basically two ways:
> >=20
> > 1) Split VMAs so they are either fully populated or unpopulated,
> > each
> > svm_range becomes an xe_vma.
> > 2) Create xe_pt_range / xe_pt_state whatever with an 1:1 mapping
> > with
> > the svm_mange and a 1:N mapping with xe_vmas.
> >=20
> > Initially my thinking was that 1) Would be the simplest approach
> > with
> > the code we have today. I lifted that briefly with Sima and he
> > answered
> > "And why would we want to do that?", and the answer at hand was ofc
> > that the page-table code worked with vmas. Or rather that we mix
> > vma
> > state (the hmmptr range / attributes) and page-table state (the
> > regions
> > of the hmmptr that are actually populated), so it would be a
> > consequence of our current implementation (limitations).
> >=20
> > With the suggestion to separate vma state and pt state, the xe_svm
> > ranges map to pt state and are managed per hmmptr vma. The vmas
> > would
> > then be split mainly as a result of UMD mapping something else (bo)
> > on
> > top, or UMD giving new memory attributes for a range (madvise type
> > of
> > operations).
> >=20
>=20
> Thanks for the explaination.
>=20
> My 2 cents.
>=20
> Do an initial implementation is based on 1) - Split VMAs so they are
> either fully populated or unpopulated, each svm_range becomes an
> xe_vma.
>=20
> This is what I did in a quick PoC [A] and got basic system allocator
> working in ~500 loc. Is it fully baked? No, but also it not all that
> far
> off.
>=20
> We get the uAPI in place, agree on all the semantics, get IGTs in
> place,
> and basic UMD support. We walk before we run...
>=20
> Then transform to code to 2). The real benefit of 2) is going to be
> the
> memory footprint of all the state and the fragmentation of GPUVM RB
> tree
> that comes with spliting VMAs. I'll state one obvious benefit,
> xe_pt_state < xe_vma in size.
>=20
> I'll give a quick example of the fragmentation issue too.
>=20
> User binds 0-2^46 - 1 xe_vma
> Fault - 3 xe_vma (split into 2 unpopulated xe_vma, 1 populated
> xe_vma)
> Free - 3 xe_vma (replace 1 populated xe_vma with 1 unpopulated
> xe_vma)
>=20
> Do this a couple of million times and we will tons of fragmentation
> and
> unnecessary xe_vma floating around. So pursuing 2) is probably worth
> while.
>=20
> Is 2) going to quite a bit more complicated implementation. Let me
> give
> fairly simple example.
>=20
> User binds 0-2^46 - 1 xe_vma
> Tons of occurs - 1 xe_vma, tons of xe_pt_states
> User binds a BO - 3 xe_vma, need to split xe_pt_states between 2 new
> xe_vma, possibly unmap some xe_pt_states, yikes...
>=20
> While 2) is more complicated I don't think it is complete rewrite
> from
> 1) either. [A] is built on top of [B] which introduces the concept of
> PT
> OPs (in addition to existing concepts of GPUVM op / xe_vma_op). With
> a
> bit more of seperation I think getting 2) to work won't be all the
> difficult and the uppers layer (IOCTLs, migrate code, fault handler,
> etc..) should largely be unchanged from 1) -> 2).
>=20
> With a staging plan of 1) -> 2) I think this doable. Thoughts?
>=20
> [A]
> https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-system-allocator/-=
/commits/system_allocator_poc/?ref_type=3Dheads
> [B] https://patchwork.freedesktop.org/series/125608/=C2=A0
>=20
> Matt

Without looking at the code ablve, yes I think this sounds like a good
plan. Oak, it would be good to hear your comments on this as well. I
think, given 1) Implementing 2) as a POC wouldn't be too hard. Then we
also need to figure how both approaches tie into the possibility to
make GPUVM hepers out of this...

/Thomas




>=20
> > /Thomas
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20

