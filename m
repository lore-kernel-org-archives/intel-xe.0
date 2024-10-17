Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0D1D2126D
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 09:46:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290AC10E313;
	Thu, 17 Oct 2024 09:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VtTK3wwS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F8B10E313
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Oct 2024 09:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729158403; x=1760694403;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=C3w0IpEp4qDCnhke58CH9w9SwagTBLtOFMS3Pe5/88k=;
 b=VtTK3wwSCNE/oYmGSd5dv+AXS/Bx/1bPKkcvbSfEIVNw5xyE5XaH+C4s
 VB54OdFioi1Nfkil2G6xbvfROrucRLfjmH7zu55/Ki0FWlVgMHRku5XFh
 n18RMJQGDyqhg25rcRc9hgb+1u+Qh6ccOVzyoIj6Alh3I6gEBeYLcGWIb
 4KiiXIR0iPNdabpy9bFWlEXQX9p2Z3WJilo/9tEWOhIHVCewtu9535Z7a
 4mKY0Ch6/HbItfQjZr+rsyE6gzA38A3qtpR6ABrgYAolpZw3V3YqTHZmZ
 S+BesKMyLzgAQ5RznIuoBZ5sGAEZlrMDT3ycl52JPngxWNroqs8597zYI w==;
X-CSE-ConnectionGUID: PPjJxSp4TB2lrTGuUz2wMw==
X-CSE-MsgGUID: ZCkbb98WRs+837o7XL1EIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="16254031"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="16254031"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 02:46:43 -0700
X-CSE-ConnectionGUID: 6jiWDDUnT5GNKERxoFHbjw==
X-CSE-MsgGUID: uRt7dPrySqKLi/POwiUKFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="83566904"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.51])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 02:46:41 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <172915357330.19393.6677527742308895785@jlahtine-mobl.ger.corp.intel.com>
References: <20241009101004.664216-1-tejas.upadhyay@intel.com>
 <SJ1PR11MB6204E78CF08AFA14DA26E2A181442@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <e8f4f5fd-d7a1-4ca9-8a62-543d10c32a15@intel.com>
 <DS7PR11MB6197DD082F407482D23E655281442@DS7PR11MB6197.namprd11.prod.outlook.com>
 <936a6826-cf97-4d77-8175-16b37f422f47@intel.com>
 <SJ1PR11MB62045186FCE678E792358F2E81462@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <041b4973-5453-4897-9969-fcbc6f57b826@intel.com>
 <SJ1PR11MB6204821D9A97E3A286FDECC581462@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <d4932a6e-0b52-4ef4-8c1a-32995e6a3815@intel.com>
 <172915357330.19393.6677527742308895785@jlahtine-mobl.ger.corp.intel.com>
Subject: Re: [PATCH] drm/xe/mmap: Add mmap support for PCI memory barrier
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org,
 Thomas =?utf-8?q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 17 Oct 2024 12:46:36 +0300
Message-ID: <172915839610.27566.16274682495936290104@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.10
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

(+ Thomas and Lucas)

Quoting Joonas Lahtinen (2024-10-17 11:26:13)
> Quoting Matthew Auld (2024-10-16 19:23:30)
> > On 16/10/2024 17:06, Upadhyay, Tejas wrote:
> > >> On 16/10/2024 16:13, Upadhyay, Tejas wrote:
>=20
> <SNIP>
>=20
> > >> IMO we should at least consider not hard coding the offset in the ua=
pi, but
> > >> maybe just return it from mmap_offset when passing a special flag, w=
ith no
> > >> hard guarentee that the offset can't change if kmd so chooses?
> > >> What do you think?
> > >>
> > >> Also if we want to keep the magic 0x50 instead of allocating an actu=
al offset it
> > >> might be good to add a build check against DRM_FILE_PAGE_OFFSET_START
> > >> somewhere?
> > >=20
> > > Build check looks good to me still let me go through both option tomo=
rrow and get
> > > back with V2 on this. I will get this in separate patch.
>=20
> We seem to be looking at the quick'n dirty downstream i915 uAPI being por=
ted
> directly.
>=20
> What was originally planned for proper upstreaming of the uAPI was to hav=
e a
> query interface that would return both the mmap offset and per-client pag=
e offset
> within that page (cacheline per DRM client). This interface would be most=
 future-proof
> for HW changes.

I was friendly reminded that I forgot about the fact that just a single
cacheline per DRM client causes contention for any multi-threaded userspace.
And as this feature in itself is mostly an advanced optimization, it
makes sense to not apply that restriction.

What downstream i915 ended up doing is allowing userspace to randomize
within the page, so that different threads from same process do not land
on same cachelines.

Adding cacheline range per DRM client feels a bit complex just to future-pr=
oof the
uAPI at this point given with query we should be able to add _V2 variant ra=
ther
cheaply if the need to pass more details in the future.

So I guess we could go either go with the more simple option of implicit ra=
ndomization
within the page at this point, or a more complex query API where we return =
[start, end]
cacheline range (which would be full page on current known platforms).

Thomas or Lucas, any preference?

Regards, Joonas
=20
> And if that query returns a failure, userspace would have to revert back =
to alternative
> mechanism (either kernel doesn't support this feature, or it got disabled=
). That
> fallback code should exist and be validated and reviewed in the userspace=
 code
> before merging.
>=20
> Regards, Joonas
