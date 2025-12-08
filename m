Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BE6D3B7E7
	for <intel-xe@archiver.kernel.org>; Mon,  8 Dec 2025 13:50:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5DC10E158;
	Mon,  8 Dec 2025 13:50:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WP3eXela";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E93C10E158
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Dec 2025 13:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765201859; x=1796737859;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=8TdT7TX1Zj6zwUYtLsQVV6qWDARK3d/SOUXsADP59hs=;
 b=WP3eXela5Ty+9g81d8TZYeZYdi8DkdaJwBEfH11mlZhZRohVf/gTzhnM
 d50TMOB+VcH6alQCEsFpwxp9Ya8ECcF1Yx6//DwN28HxGPD5xyh0pf+35
 zV7zJB1SDZO8s2JpKqG5pZrET9KtfjWGZd6oaJqQdgtRXijx+rjcLZemB
 FMqbuC8M3Cs2h2gxOOKz1wTJ95qu3qClcziG21qUd56BAGc1RS7bkqA5C
 tMrd8/EGDJgIGstur5E6tyDy9vBlK9vQJpacd2QIFe1uWoLhQw0RAWBhL
 a4LofdepC/nPQf7WZjFzXRYMlCqITUn+aj3fJyaE1XG50AZCKjKcQj+P/ A==;
X-CSE-ConnectionGUID: f7PigOqORD+bVvGYG1CpUg==
X-CSE-MsgGUID: EcKaXpOVSiiM3AzdBhZg+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67188913"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="67188913"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 05:50:58 -0800
X-CSE-ConnectionGUID: z9BzcbQCQB2Desng0JFjIA==
X-CSE-MsgGUID: 5THaYNmZQEK1drwE/rkl8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="200857140"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.6])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 05:50:54 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <656acfd8-fef7-483d-999b-78182c43070d@amd.com>
References: <20250808104356.3294210-1-mika.kuoppala@linux.intel.com>
 <49a1024b-a318-446f-8c97-4076fc647fdd@amd.com> <874iq7gbyi.fsf@mkuoppal-desk>
 <176518351640.16441.6158110220097232872@jlahtine-mobl>
 <656acfd8-fef7-483d-999b-78182c43070d@amd.com>
Subject: Re: [PATCH 00/15] Intel Xe GPU Debug Support (eudebug) v4
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, christoph.manszewski@intel.com,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com, andrzej.hajda@intel.com,
 matthew.auld@intel.com, maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>, intel-xe@lists.freedesktop.org
To: Christian =?utf-8?q?K=C3=B6nig?= <christian.koenig@amd.com>
Date: Mon, 08 Dec 2025 15:50:51 +0200
Message-ID: <176520185138.24350.8954844301177099832@jlahtine-mobl>
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

Quoting Christian K=C3=B6nig (2025-12-08 10:49:37)
> On 12/8/25 09:45, Joonas Lahtinen wrote:
> > Quoting Mika Kuoppala (2025-12-03 11:18:45)
> >> Christian K=C3=B6nig <christian.koenig@amd.com> writes:
> >>> On 08.08.25 12:43, Mika Kuoppala wrote:
> >=20
> > <SNIP>
> >=20
> >>>> #### 2. ELF binaries not held in kernel memory
> >>>>
> >>>> In v4, debug data is delivered as a VM bind 'OP_ADD_DEBUG_DATA' exte=
nsion.
> >>>> The ELF binaries are no longer stored within the Xe KMD but are inst=
ead
> >>>> kept in a file. The file path is passed as part of an extension in
> >>>> the newly introduced 'OP_ADD_DEBUG_DATA' VM bind operation. Alternat=
ively
> >>>> pseudo-paths can be used to annotate special address ranges similar =
to
> >>>> /proc/<pid>/maps.
> >>>>
> >>>> #### 3. Debug metadata not carried in VMA struct
> >>>>
> >>>> Instead of attaching debug data to vma created by 'OP_MAP',
> >>>> we introduce separate ops for managing the metadata.
> >>>> Debug data is no longer held in the VMA struct. xe_vm contains a
> >>>> list of all associated debug data.
> >>>
> >>> I need to take a closer look but that sounds like it takes a big step=
 into the right direction.
> >>
> >> Encouraged by this positive feedback, we iterated the series further. =
VM
> >> binds state handling has reworked on top of vm_ops, metada and ufence
> >> handling improved and we added pagefaults on top.
> >>
> >> v6 series can be found here:
> >> https://lists.freedesktop.org/archives/intel-xe/2025-December/106405.h=
tml
> >=20
> > Christian, would it be possible for you to take a quick look before the
> > holiday season? Would be very much appreciated.
>=20
> I'm just back from a week of sick leave today (stupid flu season) and dro=
wning in work.
>=20
> But from a ten mile high view it looks sane to me now.

Understandable and thanks for the high level check, we'll continue with the
current direction then.

> > That way we could start polishing the documentation etc. assuming we
> > still agree on the direction. At least from our viewpoint, we're running
> > short of ideas where to simplify or improve on the implementation.
> >=20
> > The page-faults are the freshest piece of the code, however it is rather
> > well separated patches, so would be great if as a minimum the foundatio=
nal
> > patches before them could be agreed upon initially.
>=20
> The only requirement I have is that you don't mix page faults, single ste=
p debugging and dma_fences for graphics contexts, but you already knew that.
>=20
> In other words as long as you make sure that you can't attach a debugger =
to a process which does graphics rendering and uses dma_fences for that eve=
rything should be fine from my side.

Yeah, it's all already completely detached from dma_fences for now, being
stuck in a breakpoint would otherwise already be problematic given we
currently can't switch a stalled context off the hardware.

Page-faults during debug make no difference in that sense, they just got
freshly reworked on top of the xe refactoring of page-fault infra. This mea=
ns
its more likely something will appear in review of those patches compared to
the rest of the series which have been pretty logically unchanged for a whi=
le.

Regards, Joonas

> Regards,
> Christian.
>=20
> >=20
> > Best Regards, Joonas
> >=20
> >> Thanks,
> >> -Mika
>
