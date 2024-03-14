Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE71C54E5D
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 08:52:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8485210E6B1;
	Thu, 14 Mar 2024 08:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M3Z9CL1y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 212B110E6B1
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 08:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710406348; x=1741942348;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=PUs2XT3LY5W3U4MvL+a0NAIDFsEP/IgKTT/Ja8W9yUA=;
 b=M3Z9CL1y8W+hK1x0MkiATIOUkQ5D8tXsVptLexdFJO/goErd23D+/6vk
 tpOGwxk9h7a1G0UfLH1ixXRaknHUlpSy41ucAc3UVUcF/Un8BWC90zDXS
 SfulBouhcaVpJwG1S4vaDukIicjN+Sz+NY/8GyahKH5ZPmtLR83V6C0q7
 rzwu8LHvS+w3Wr3xE8frEW6de9cQIAgPdMoMQZDpXR2fKNrXJNvEe/xmD
 TukoG1ZANJBU1MweY2JtmOBUfepULbLqBSCFY52fRnu0f9ElnEpksG1RC
 YKXvNRFjNrEoEEJFVs0ZD0JzZXPJy2U/ZSS+CGlIVeExVu5FmCsfu27Lp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="16607917"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; d="scan'208";a="16607917"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 01:52:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; d="scan'208";a="16815658"
Received: from mstribae-mobl.ger.corp.intel.com (HELO [10.249.254.78])
 ([10.249.254.78])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 01:52:26 -0700
Message-ID: <5165406f368cc023a5d0fd9879e33b8ac01d8aa7.camel@linux.intel.com>
Subject: Re: Separating xe_vma- and page-table state
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Date: Thu, 14 Mar 2024 09:52:23 +0100
In-Reply-To: <SA1PR11MB69915B6A778A81CD41F6A544922A2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <72ea6bc36260bcc2eaeb97d1abcb8bebf69f3f53.camel@linux.intel.com>
 <SA1PR11MB699139B15B97B2B056312F41922B2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZfEA5ieJ+M9rttI3@DUT025-TGLU.fm.intel.com>
 <a8c507084e016186e0fb75c45b826f612ddc6c40.camel@linux.intel.com>
 <SA1PR11MB69915B6A778A81CD41F6A544922A2@SA1PR11MB6991.namprd11.prod.outlook.com>
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

On Wed, 2024-03-13 at 17:06 +0000, Zeng, Oak wrote:
> Hi Thomas,
>=20
> For simplicity of the discussion, let's forget about BO vm_bind,
> forget about memory attributes for a moment... Only consider system
> allocator. So with the scheme below, we have a gigantic xe_vma in the
> background holding some immutable state, never split. And we have
> mutable page-table state which is created during GPU access and
> destroyed during CPU munmap/invalidation, dynamically
>=20
> For the mutable page-table state, you would maintain another RB-tree
> so you can searching it, as I did=C2=A0 in POC, the tree is in xe_svm. Fo=
r
> BO driver, you don=E2=80=99t need this extra tree, you just need the xe_v=
ma
> tree as xe_vma has 1:1 mapping with page-table-state for BO driver...
>=20
> I saw this scheme can be aligned with my POC....
>=20
> Mapping this scheme to the userptr "free without vm_unbind" thing, I
> can see when user free, we can destroy page-table-state during mmu
> notifier callback, while keep the xe_vma. Is this also how you look
> at it?=20
>=20
> Need to say, the "free without vm_unbind" thing should only affect
> our decision temporarily: once system allocator is ready, UMD
> wouldn't need the userptr vm_bind anymore, so the problem will be
> more perfectly solved with system allocator - umd just remove the
> vm_bind, things would magically work with system allocator. I guess
> what user need is really a system allocator but we don't have it at
> that time, so userptr technology is used. For long term, system
> allocator should eventually replace userptr.

I mostly agree on the above, I think.

>=20
> One thing I can't picture clearly is, how hard is it to change the
> current xekmd to separate xe_vma into mutable and unmutable?

It's not that hard at all, it's mostly changing the xe_pt.c interfaces.
An obstacle, though, is that we don't want to do this before Matt's big
vm_bind refactoring is reviewed and in place.

> =20
>=20
> Is the split scheme with xe_vma maintaining both mutable and
> unmutable simpler? It doesn't have xe_svm concept. No
> xe_svm_range/page_table-state, single RB tree per gpuvm, no need to
> re-construct xe_vma....depending on how we want to solve the multiple
> device problem, the xe_svm concept can come back though...

For the ordinary VMA types we have today, Userptr / Bo /NULL it's
neither simpler nor more complex IMO, but it makes the code clearer and
hopefully easier to maintain.

For hmmptr/SVM system it's too early to answer. Here it depends really
on whether 1) we do an 1:1 mapping between xe_vma and svm_range, or
whether 2) we do an 1:N mapping of xe_vma and svm_range. Probably both
approaches have their benefits so I'd tend to favour Matt's suggestion
there that we start off with 1), make it work and then do a POC with 2)
to see what it looks like.

Comments, suggestions?

/Thomas


>=20
> Oak
>=20
> > -----Original Message-----
> > From: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Sent: Wednesday, March 13, 2024 6:56 AM
> > To: Brost, Matthew <matthew.brost@intel.com>; Zeng, Oak
> > <oak.zeng@intel.com>
> > Cc: intel-xe@lists.freedesktop.org
> > Subject: Re: Separating xe_vma- and page-table state
> >=20
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
> > /Thomas
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
>=20

