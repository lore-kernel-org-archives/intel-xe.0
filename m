Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D14C54E66
	for <intel-xe@archiver.kernel.org>; Tue, 12 Mar 2024 07:43:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7415710E389;
	Tue, 12 Mar 2024 07:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VDIDRSId";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC4C10E389
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Mar 2024 07:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710229390; x=1741765390;
 h=message-id:subject:from:to:cc:date:
 content-transfer-encoding:mime-version;
 bh=TPyHz0+GJjlr46urBPxjSCH6+0k4ceJCYZsnhZVNcz8=;
 b=VDIDRSIdaZH/+RUzkI0OHv2r7ZqpyXAc0pjpBseD+GA6EKLZ8u+2gaEW
 pj53enBFZFuLUDYf522VdU7L3/023QQ0gHEOgXp3XbWzIX0sCIcSQDQYL
 rHTGC44EDT81kvq1RWM/D8xNuJbbMMg7KOMZpVmsJvIcLGHaWyUfK7nHQ
 YMwl0Ko2GMeEcH+9sV7DesXuqphup+4/ky8QVPmNydpx7sSCxxHdM5Xtt
 c8+xB4Y3e+UX76gxbn7dwZyHzefNWBBVfSIJSuib9jRZ52W6T20fiWqrU
 5RNqL93Zq3FqHPOasIVqQNFNRDcPOoM/h1K8OSa09QstaSTXX5QELxK1X w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="5110955"
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="5110955"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 00:43:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; d="scan'208";a="42371271"
Received: from amirafax-mobl4.gar.corp.intel.com (HELO [10.249.254.59])
 ([10.249.254.59])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 00:43:08 -0700
Message-ID: <72ea6bc36260bcc2eaeb97d1abcb8bebf69f3f53.camel@linux.intel.com>
Subject: Separating xe_vma- and page-table state
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, "Zeng, Oak" <oak.zeng@intel.com>
Date: Tue, 12 Mar 2024 08:43:05 +0100
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

Hi,

It's IMO become apparent both in the system allocator discussion and in
the patch that enables the presence of invalid vmas that we need to be
better at separating xe_vma and page-table state, so that xe_vma state
would contain things that are mostly immutable and that the user
requested: PAT index, memory attributes, requested tile presence etc,
whereas the page-table state would contain mutable state like actual
tile presence, invalidaton state and MMU notifier.=20

So far we have had no reason to separate the two, but with hmmptr we
would likely end up with multiple page-table regions per xe-vma, and
with the patch discussed earlier we could've easily reused
xe_vm_unbind_vma() that only touches the mutable page-table state and
does the correct locking.

The page table could would then typically take a const xe_vma *, and
and xe_pt_state *, or whatever we choose to call it. All xe_vmas except
hmmptr ones would have an 1:1 xe_vma <-> xe_pt_state relationship.

Thoughts, comments?

Thanks,
Thomas
