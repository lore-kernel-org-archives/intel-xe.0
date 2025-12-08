Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47140D3ABEF
	for <intel-xe@archiver.kernel.org>; Mon,  8 Dec 2025 08:45:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F8EB10E111;
	Mon,  8 Dec 2025 08:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MGG3q+vL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 283BA10E105
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Dec 2025 08:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765183523; x=1796719523;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=Fr9A+w/rCtK3fbWb+glzgbYYrQWdP4kna/jIjFx1VDo=;
 b=MGG3q+vLmc+1Lly5GnZjFVjALMY5jfZh0qG4N9pYzvwC4ZWwfpo91IYM
 OH2v+T59J/4/nrwrdESV++4ZhxBNnGr1zlxmF5REs0sqrSp8aoFBv/3gd
 nx6s8V2OPTP2Wk/2m0i9fbro3WPQA/uqjp/0FzxdudoWPANtp5ZhtV6i8
 MftbIjf4w8X8ptdjFX9nuJtiMnjSVA4gpqQuha/ulMtBhN89jAIQt9GOA
 AoHzQCN60sYxhCCEun8ajvPz5ZGRqstWLqnNoLMRMYiXefYSkhzoJFQEH
 qZjgA2PgaAJwlnLjUPhAVvSx65QivjiOoRc9nkoNHEMRp6fftxYSdYUu0 Q==;
X-CSE-ConnectionGUID: 8kjqHedwTeC3bGWgG55SpA==
X-CSE-MsgGUID: gC6/F14xQYuMvuk5nOoNhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="66843655"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="66843655"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 00:45:23 -0800
X-CSE-ConnectionGUID: JxmKUpXZTQmdzVa9UUj6Qg==
X-CSE-MsgGUID: NTEIThzxSMuW+vYywlcWyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="200349420"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.6])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 00:45:20 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <874iq7gbyi.fsf@mkuoppal-desk>
References: <20250808104356.3294210-1-mika.kuoppala@linux.intel.com>
 <49a1024b-a318-446f-8c97-4076fc647fdd@amd.com> <874iq7gbyi.fsf@mkuoppal-desk>
Subject: Re: [PATCH 00/15] Intel Xe GPU Debug Support (eudebug) v4
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, christoph.manszewski@intel.com,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com, andrzej.hajda@intel.com,
 matthew.auld@intel.com, maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>, intel-xe@lists.freedesktop.org
To: Christian =?utf-8?q?K=C3=B6nig?= <christian.koenig@amd.com>
Date: Mon, 08 Dec 2025 10:45:16 +0200
Message-ID: <176518351640.16441.6158110220097232872@jlahtine-mobl>
User-Agent: alot/0.12.dev7+g16b50e5f
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

Quoting Mika Kuoppala (2025-12-03 11:18:45)
> Christian K=C3=B6nig <christian.koenig@amd.com> writes:
> > On 08.08.25 12:43, Mika Kuoppala wrote:

<SNIP>

> >> #### 2. ELF binaries not held in kernel memory
> >>=20
> >> In v4, debug data is delivered as a VM bind 'OP_ADD_DEBUG_DATA' extens=
ion.
> >> The ELF binaries are no longer stored within the Xe KMD but are instead
> >> kept in a file. The file path is passed as part of an extension in
> >> the newly introduced 'OP_ADD_DEBUG_DATA' VM bind operation. Alternativ=
ely
> >> pseudo-paths can be used to annotate special address ranges similar to
> >> /proc/<pid>/maps.
> >>=20
> >> #### 3. Debug metadata not carried in VMA struct
> >>=20
> >> Instead of attaching debug data to vma created by 'OP_MAP',
> >> we introduce separate ops for managing the metadata.
> >> Debug data is no longer held in the VMA struct. xe_vm contains a
> >> list of all associated debug data.
> >
> > I need to take a closer look but that sounds like it takes a big step i=
nto the right direction.
>=20
> Encouraged by this positive feedback, we iterated the series further. VM
> binds state handling has reworked on top of vm_ops, metada and ufence
> handling improved and we added pagefaults on top.
>=20
> v6 series can be found here:
> https://lists.freedesktop.org/archives/intel-xe/2025-December/106405.html

Christian, would it be possible for you to take a quick look before the
holiday season? Would be very much appreciated.

That way we could start polishing the documentation etc. assuming we
still agree on the direction. At least from our viewpoint, we're running
short of ideas where to simplify or improve on the implementation.

The page-faults are the freshest piece of the code, however it is rather
well separated patches, so would be great if as a minimum the foundational
patches before them could be agreed upon initially.

Best Regards, Joonas

> Thanks,
> -Mika
