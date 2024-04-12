Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C91AC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 21:21:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E0010ED23;
	Fri, 12 Apr 2024 21:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S5+dP3sO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9229910ED23
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 21:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712956867; x=1744492867;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BSzS2ALJKAfZl38jNxF5cyJUzxoR1DN5RBD5ilGXjI8=;
 b=S5+dP3sOKjf32L6Zouh2ZKVHXOPKLd8oY7ErXMF1IkZewO8WhjDil4Ti
 0orl3TzLmoc42+q1Ph9lXQaUmdi16zpaOQQcjV1hpB2mQ0whGKx86p2Rj
 wc5pHNc+eAciWTCls8Z/j3yA1Zco9LCgsg5FN2yTMmzfBHz3B6sLouUJF
 WodcUQQdBrb+TUL4qK9bbVwzOW6pIkcRd0m3yD0w9CHjcbY8CENalMHWz
 Bg8VCLQ11pQwChddXhTdLNYTD/QY7gTD8xaqBdLEwfbzo567ZuK9l/FkQ
 z9baV8am9DH4zCYGdAUTvQbG47W9noYhfl7J4bMw4xMTftfCky32FtfGl A==;
X-CSE-ConnectionGUID: me8TNB6BRaKxFGQntcpNnA==
X-CSE-MsgGUID: kavhXbQzSlyqA+4yTgigqw==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8297834"
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; 
   d="scan'208";a="8297834"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 14:21:06 -0700
X-CSE-ConnectionGUID: PUec8VFOQRKSRKsZkd27WA==
X-CSE-MsgGUID: jH0R1k5hSl2B94RU7ANNPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; d="scan'208";a="21913612"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 14:21:07 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 14:21:06 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 14:21:06 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 14:21:06 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 14:21:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jfyoqjni79lS3sOgoXgLYU9N13ha3t7iLnOa9FSiGOYlXy6JZieDvcwaDjDXFkNdY3/GlMBkXFe4WI7zguF265os8ZwDh8vmwr06oKKhpthHlc9nk/txfpvcDloNTJh5aMswro9B8GKBgi0z27trlSe4n0VTV9fLQCiIcp/zvMs+9bAmT2XOc3gINOHzcfoio8UKvwTKSRork6UjT5bYgeycftQUdFYjRSMG7/d50pnwmtIKcAM2Vk7nJkzFUZs6y1aVQ6Eib0Z3WzsAtI6+Hi5+KbZNEToiimYIvFMReB7EObakkzw9rIOlv/wZ5RlV8bA9VegNngSDSABZymZlGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLNqvduiivDRgRpkFsp+PqIeqfMeicbbPfbpG2iLzdQ=;
 b=Q4pDaQcajvAzyvzFryOXav0aM73IYpuGNQPKbjn+uTXxjXUltu3Z5tXPMkwLgSipX6GAoaVQmKiwsa1mkowSUFT+eiQ6+zZoVze5vOLEr1ykHVTfs0IIYFZE91vBjkK4TQzn8lrLsUJMROhZA4oJDgeBL601jz8XetDhKkDZYNzDNILgV4ceZj1W8fyBE5jzP9TtPlMRZW9UQejgVahFTWsk3j9F9tI7sD3B7NnXQ8ysnYaeWVwKRblshoP6cKlnwxQpt6czmYkN4IKscuyM4JCR7+j1D+0V3XlaJ0bZYeeVCNTV9luTRJRo0ujJefX6TG66S4mUOR3joEtJsafvjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SA2PR11MB5083.namprd11.prod.outlook.com (2603:10b6:806:11b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.25; Fri, 12 Apr
 2024 21:21:04 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Fri, 12 Apr 2024
 21:21:04 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Thomas.Hellstrom@linux.intel.com"
 <Thomas.Hellstrom@linux.intel.com>, "Welty, Brian" <brian.welty@intel.com>
Subject: RE: [v2 28/31] drm/xe/svm: Introduce helper to migrate vma to vram
Thread-Topic: [v2 28/31] drm/xe/svm: Introduce helper to migrate vma to vram
Thread-Index: AQHairloFf471qqUJU+z0CvmU05xhbFiYEKAgAKtOCA=
Date: Fri, 12 Apr 2024 21:21:04 +0000
Message-ID: <SA1PR11MB6991AB46782299FA3E2ACE7F92042@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-29-oak.zeng@intel.com>
 <ZhdPsV/ou2DMQe3O@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZhdPsV/ou2DMQe3O@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SA2PR11MB5083:EE_
x-ms-office365-filtering-correlation-id: c4754952-2589-4c54-2f9f-08dc5b3675cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ruEdYAHf4eE8z5lnofbkBdr5QvpTAoZ+Frqy0vkTsoicZjLCwctxKy+3sSHdvgW44NVEYKO8bHbtjWnlur4wY+GznEum4emXVbzHagnrn3FnqFPtl1+oV6EVnwSuB8vNW5BV0r1h+5DGXoZ1Q2wr7Wudm36ouvDISy2Y4ARnSsi3DG1dAQWCQ9pQxUJQ99Y6mk+DCxqz0wscutCpzA01FPeaoNx0sYoBFuNMFYYKZiSSSy4TbQfUr/CZLSezrontoQEq0Vh99/4cXmKnoMfp3Ryf7Xp9jw2RIiykzyf03doWN90mmTuT3dKFCM27PqrCHLJMO9uJHt+vAov4RTKyCPoE/zkhl6hoFxJ+ESjPWnlZiPwsVCXWhvlBxKIsDxKRvzUjoUtOxifF6Qw2dtLUWZiIPZa1bV5wRlZ7ijvGANs7vmEke9dMNE0bWgEFNYLdckr5Ir4XlkmQ/agg5PFxPJvqlN/oMsq/iL/t1UZyF0DD/sWn2JZoDRpu5GgFW6CQWdfshRRHmK23ex9Kq6MmxdQatKoqOpysZ1m4o1lefEccFjvwjQuq15QcbJygGuB0329yA/geBl0enhd3PQMi3DtsvQ3id0lAJOY3MFPu7iwBBoCjMKbNwFqOq79qVfewYwu672aVrzjG6+M3NPITUOyCKaoYrSnPlxvY9MeYwOhoMdgyWwPQHlXJGSJTuK9f
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?eA3auJ6P1lJWN7vwgot/N+PHbpfrmN7MeffgsAny7j0KY2wvYaDXbZcocI?=
 =?iso-8859-1?Q?D/61Tbtl4uA+Ggzu+sUUgarnpBUw522z4Erf1PziipAamCWGWuH7OKMu/h?=
 =?iso-8859-1?Q?GTisrWYmuHOyT2hoD2JD7NRNeViymOazQE9akRVytBUSazaDIHf2lYkpIM?=
 =?iso-8859-1?Q?z1+2KXhBitf6sDKIAkQ96OrnDuxsLRWt29RXf5NjOgKkERc2uS3zdloa2C?=
 =?iso-8859-1?Q?IQL+xJbi8qhhA1h65FQtcgKjsjHDmaCxKcjNym0RCIuDLByIzYNq8Myijq?=
 =?iso-8859-1?Q?dQ+H2Q132kj9srBsho0Xx8yzE3oGaAmjXRmhKJQbiWClBDd9IzT64bY3Dg?=
 =?iso-8859-1?Q?u6lH4nCCsRBWPOMo9XdC6XoeyP2MSs7Y1f+9PdUhyu9Yx3JulUIl+06LsB?=
 =?iso-8859-1?Q?MfqPc3MgH0nENlvc5OFCm8lmnEHMtzcUq0I9w0DV2/2+MkIZBSJMuO4l5U?=
 =?iso-8859-1?Q?+I/tjEKL8oy+1K5B3BAGKgb1dPF8GHGUczqHvCfggAp+xeRM8oH8yStCIh?=
 =?iso-8859-1?Q?LGrwHvH8l9V7iUA4xmvM6X18Rh9U88RrWT5MzrmP9t3L8FtIMM/gElrg0l?=
 =?iso-8859-1?Q?baRjInSH+KgPyJPNJGtmHhJ06HartGkEpEJIDSCWUN8k9jP9f8vXUCDFRw?=
 =?iso-8859-1?Q?b2MpJVqzw5ITnPM3M6c7lt7Jm4M3wRZE0/6z72iJy8eEDl8R0iqUW3DCNX?=
 =?iso-8859-1?Q?MLoLI1bMMJ451k/KNwecrEs4znEMVEKjDHTSw11Cq1lpD0uGbG2MwVSOCp?=
 =?iso-8859-1?Q?g4xJ80R+dDHvOJ9Cp0LBln+TAjHlTrPTLbjHxAAOEPdTSLVJa50w3kvSYn?=
 =?iso-8859-1?Q?pMezaqdy5Y7sZDVDvks2wFDlfZNFZw7ApYx0lVj/4T6rP4GoQw0bc9hOoY?=
 =?iso-8859-1?Q?fDojlhXS7Iof6oy6rKrI7idkcMij4fQbNN4+1qMfVu6rixjjdHOuZUsw59?=
 =?iso-8859-1?Q?EWhN3NYgWFJRnvPDiHf2GVLY80BtQaK0+kHm3NriectcNvdtCRWI4RjOXm?=
 =?iso-8859-1?Q?VBc+tMR8FiuDTJ1o6Wv0ZYCgon1dkFe86roYEH99LA8a5Alxv9Rl9oRVFR?=
 =?iso-8859-1?Q?9/betVkwya1TXQBlrARtxNfeqn9JAshcCc48vDTWalqZHdBJnmlrS3lHtH?=
 =?iso-8859-1?Q?dmRSuFQlGvslbjH34fOMTiAattGAZWAHTLKlMgw5VHWUCDYZrZK5sXME6E?=
 =?iso-8859-1?Q?dnhNc+8IbI1HYXdhg1tMHCnq2nw6oLFghXIlqtSVdbi2MaXdy0TTaYSNaR?=
 =?iso-8859-1?Q?o5rUO7UUT67hxMbtNw4B8Hz4Zd1+7VuXF6gv2ZY1DSeUSFNak2m+FZvvOC?=
 =?iso-8859-1?Q?W8KNAWmpcrNyhaveml0d0JkZrBKf/K/8Yb8Kj2RQjQ63LtpnyRX9Sxio8v?=
 =?iso-8859-1?Q?b+6GiVaJZ4ns6No0SaOWlKkbHFTMPWVXzUyiwsR5zNmplubtt2KphYUz9P?=
 =?iso-8859-1?Q?S9+zWsgvadMKEOOcMOu9xxwAjhfKo/PKz7+4ZcUa7c4Q6YuA4l03++8Vhy?=
 =?iso-8859-1?Q?PYPBi0QKOxUni7KJPupgST2HAXZHxzC4omNcAGlWDWvGgnlyxlIY3+wZ0m?=
 =?iso-8859-1?Q?0iE2phVFPyHQ+I7+pThTBnqsZx3xFDsog2x0Koo6NDwmTTXvSy5UsthaEh?=
 =?iso-8859-1?Q?GLzxh9uP9e2UE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4754952-2589-4c54-2f9f-08dc5b3675cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2024 21:21:04.2303 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KL6MrlXIMKNh9bQ5OXhM+wm7ij6lC0r7ru84xTC+DRUCjoEnTHU9D1JGdisIqlmC9yli4u4pT/ubCKLlrxbdAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5083
X-OriginatorOrg: intel.com
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



> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Wednesday, April 10, 2024 10:49 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
> <krishnaiah.bommu@intel.com>; Thomas.Hellstrom@linux.intel.com; Welty,
> Brian <brian.welty@intel.com>
> Subject: Re: [v2 28/31] drm/xe/svm: Introduce helper to migrate vma to vr=
am
>=20
> On Tue, Apr 09, 2024 at 04:17:39PM -0400, Oak Zeng wrote:
> > Introduce a helper function xe_svm_migrate_vma_to_vram.
> >
> > Since the source pages of the svm range can be physically not
> > contiguous, and the destination vram pages can also be not
> > contiguous, there is no easy way to migrate multiple pages per
> > blitter command. We do page by page migration for now.
> >
> > Migration is best effort. Even if we fail to migrate some pages,
> > we will try to migrate the rest pages.
> >
> > FIXME: Use one blitter command to copy when both src and dst are
> > physically contiguous
> >
>=20
> Yep, touch in this throughout the series. Only vram needs to be
> contiguous though as we dynamically create PT mappings for sram pages in
> the migrate code. Getting this in a must and should be done immediately
> IMO as this a very, very basic perform thing we know needs to be done.
> We will likely have to tune this code quite a bit for performance so
> getting known things done would be helpful.
>=20
> > FIXME: when a vma is partially migrated, split vma as we assume
> > no mixture vma placement.
> >
>=20
> Agree we do not want support partial migrations. We likely want to
> return -EAGAIN for something and fault back to a smaller xe_vma chunk
> size which I discussed in [1] and add comment on in [2].
>=20
> Migration should be best case too if we fail migrate we can always leave
> backing store in sram too.
>=20
> I do have question though, when do we get partial migrations? A user
> having called mlock on some of the pages? I just want to make sure I
> fully understand that case.

Yah, mlock could be one case...

I also looked the hmm code. There are few other cases where MIGRATE_PFN_MIG=
RATE is not set (so we skip migration after), such as pte is NULL and vma i=
s file-backed (not anonymous); entry is swapped out to hard disk etc. see m=
ore details in function migrate_vma_collect_pmd.


>=20
> [1] https://patchwork.freedesktop.org/patch/588526/?series=3D132229&rev=
=3D1
> [2] https://patchwork.freedesktop.org/patch/588528/?series=3D132229&rev=
=3D1
>=20
> > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > Co-developed-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> > Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Thomas Hellstr=F6m <thomas.hellstrom@intel.com>
> > Cc: Brian Welty <brian.welty@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_svm.h         |   2 +
> >  drivers/gpu/drm/xe/xe_svm_migrate.c | 115
> ++++++++++++++++++++++++++++
>=20
> Same comment on file structure throughout the series apply here too.
>=20
> >  2 files changed, 117 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> > index c9e4239c44b4..18ce2e3757c5 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.h
> > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > @@ -83,4 +83,6 @@ int xe_devm_alloc_pages(struct xe_tile *tile,
> >  void xe_devm_free_blocks(struct list_head *blocks);
> >  void xe_devm_page_free(struct page *page);
> >  vm_fault_t xe_svm_migrate_to_sram(struct vm_fault *vmf);
> > +int xe_svm_migrate_vma_to_vram(struct xe_vm *vm, struct xe_vma *vma,
> > +							struct xe_tile *tile);
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_svm_migrate.c
> b/drivers/gpu/drm/xe/xe_svm_migrate.c
> > index 0db831af098e..ab8dd1f58aa4 100644
> > --- a/drivers/gpu/drm/xe/xe_svm_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_svm_migrate.c
> > @@ -220,3 +220,118 @@ vm_fault_t xe_svm_migrate_to_sram(struct
> vm_fault *vmf)
> >  	kvfree(buf);
> >  	return 0;
> >  }
> > +
> > +/**
> > + * xe_svm_migrate_vma_to_vram() - migrate backing store of a vma to
> vram
> > + * Must be called with mmap_read_lock held.
> > + * @vm: the vm that the vma belongs to
> > + * @vma: the vma to migrate.
> > + * @tile: the destination tile which holds the new backing store of th=
e range
> > + *
> > + * Returns: negative errno on faiure, 0 on success
> > + */
> > +int xe_svm_migrate_vma_to_vram(struct xe_vm *vm,
> > +							struct xe_vma *vma,
> > +							struct xe_tile *tile)
> > +{
> > +	struct mm_struct *mm =3D vm->mm;
> > +	unsigned long start =3D xe_vma_start(vma);
> > +	unsigned long end =3D xe_vma_end(vma);
> > +	unsigned long npages =3D (end - start) >> PAGE_SHIFT;
> > +	struct xe_mem_region *mr =3D &tile->mem.vram;
> > +	struct vm_area_struct *vas;
> > +
> > +	struct migrate_vma migrate =3D {
> > +		.start		=3D start,
> > +		.end		=3D end,
> > +		.pgmap_owner	=3D tile->xe,
>=20
> Again helper to assign owner.
>=20
> > +		.flags          =3D MIGRATE_VMA_SELECT_SYSTEM,
> > +	};
> > +	struct device *dev =3D tile->xe->drm.dev;
> > +	dma_addr_t *src_dma_addr;
> > +	struct dma_fence *fence;
> > +	struct page *src_page;
> > +	LIST_HEAD(blocks);
> > +	int ret =3D 0, i;
> > +	u64 dst_dpa;
> > +	void *buf;
> > +
> > +	mmap_assert_locked(mm);
>=20
> This mmap_assert_locked is ambiguous, we should make it clear if this
> read or write locked. Doesn't it have to be write to do the migrate
> pages?

I followed hmm document (Documents/mm/hmm.rst), see section "Migration to a=
nd from device memory". It explicitly write a read_lock in this document.

I believe a read_lock is enough for the migrate_vma_setup/migrate_vma_final=
ize().

As I understand it, the mm.mmap_lock protect the process's address space. W=
hen we modify process's address space such as mmap/munmap, we need to hold =
a write mode lock; if we only read process's address space, such as in the =
migrate_vma_setup/finalize, or in the cpu page fault handler case, we only =
need a read mode lock.=20

I also cross checked amd driver. They also use a read lock.. see function s=
vm_range_restore_pages in kfd_svm.c....


>=20
> A larger question about the locking... The CPU fault handler holds the
> mmap lock in write mode, right?

No. since cpu fault handler doesn't modify process address space, instead i=
t only fill up cpu page table for some valid address range, a read lock is =
enough.=20

>=20
> I'm asking as basically I think at least initially we want to hold the
> mmap lock in a way that the GPU handler and CPU handler do not race.
> i.e. From fault userptr create in GPU fault handler to issuing the bind
> we prevent the CPU fault handler from running.

Yes we hold mmap_read_lock in both cpu and gpu fault handler to avoid that =
race.

In user mmap/munmap (such as kernel function vm_munmap), we hold a mmap_wri=
te_lock which prevent it racing with cpu and gpu fault handler.


>=20
> I'm having issues figuring out how to prevent races between initial
> binds of userptrs and userptr invalidates on faulting VMs. This race is
> seen any xe_exec_fault_mode for example... So preventing races between
> CPU / GPU fault handler with the mmap probably is a good idea initially.
> Likely can make the locking finer grained once this is all working and I
> figure out how to handle this race better.


I don't quite follow here.=20

Initial bind of user ptr... if you meant the bind in gpu page fault handler=
, then the racing with invalidation is roughly like below:
Invalidation is called with mmap_write_lock
In userptr_pin_page, we hold a mmap_read_lock, so we know during pin page, =
invalidation is excluded.
After pin, before programming gpu page table, we check whether there is inv=
alidation happen *after last pin but before programming page table*, if tha=
t happened, we retry



Oak

>=20
> > +
> > +	vas =3D find_vma_intersection(mm, start, start + 4);
>=20
> find_vma should work fine here.
>=20
> > +	if (!vas)
> > +		return -ENOENT;
> > +
> > +	migrate.vma =3D vas;
> > +	buf =3D kvcalloc(npages, 2* sizeof(*migrate.src) + sizeof(*src_dma_ad=
dr),
> > +					GFP_KERNEL);
> > +	if(!buf)
> > +		return -ENOMEM;
> > +	migrate.src =3D buf;
> > +	migrate.dst =3D migrate.src + npages;
> > +	src_dma_addr =3D (dma_addr_t *) (migrate.dst + npages);
> > +	ret =3D xe_devm_alloc_pages(tile, npages, &blocks, migrate.dst);
>=20
> Again as I discussed in [3] I think this should be broken out into a
> different step with the blocks allocated before this, and here just
> populate migrate.dst from the existing blocks.
>=20
> [3] https://patchwork.freedesktop.org/patch/588523/?series=3D132229&rev=
=3D1
>=20
> > +	if (ret)
> > +		goto kfree_buf;
> > +
> > +	ret =3D migrate_vma_setup(&migrate);
> > +	if (ret) {
> > +		drm_err(&tile->xe->drm, "vma setup returned %d for range
> [%lx - %lx]\n",
> > +				ret, start, end);
> > +		goto free_dst_pages;
> > +	}
> > +
> > +	/**FIXME: partial migration of a range print a warning for now.
> > +	 * If this message is printed, we need to split xe_vma as we
> > +	 * don't support a mixture placement of one vma
> > +	 */
> > +	if (migrate.cpages !=3D npages)
> > +		drm_warn(&tile->xe->drm, "Partial migration for range [%lx -
>  %lx], range is %ld pages, migrate only %ld pages\n",
> > +				start, end, npages, migrate.cpages);
>=20
> As discussed above, we shouldn't support this. We should fall back to
> smaller xe_vma chunk size until we find one that works or simply leave
> the pages in sram and map those pages to GPU.
>=20
> > +
> > +	/**Migrate page by page for now.
> > +	 * Both source pages and destination pages can physically not
> contiguous,
> > +	 * there is no good way to migrate multiple pages per blitter command=
.
> > +	 */
>=20
> Touched on this a bunch throughout the series, lets do better than a
> page a time migration.
>=20
> Algorithm should be very similar to what I discussed here [4] but with a
> few key differences.
>=20
> - I think the sram pages can be unpopulated (page =3D=3D NULL) if the use=
r
>   has not yet touched the page
> - Also I think the MIGRATE_PFN_MIGRATE bit being clear is valid
>=20
> In these cases this indicate we have to issue a copy for the pages we
> are accumulating with contigous vram addresses.
>=20
> [4] https://patchwork.freedesktop.org/patch/588526/?series=3D132229&rev=
=3D1
>=20
> > +	for (i =3D 0; i < npages; i++) {
> > +		src_page =3D migrate_pfn_to_page(migrate.src[i]);
> > +		if (unlikely(!src_page || !(migrate.src[i] &
> MIGRATE_PFN_MIGRATE)))
>=20
> Discussed this in the CPU fault patch, once we call migrate_vma_setup,
> on subsequent errors we need to call migrate_vma_finalize to revert the
> pages to the original state. At least I think if I am reading the doc
> after this correctly.
>=20
> Here on error we just free the pages...
>=20
> Matt
>=20
> > +			goto free_dst_page;
> > +
> > +		xe_assert(tile->xe, !is_zone_device_page(src_page));
> > +		src_dma_addr[i] =3D dma_map_page(dev, src_page, 0,
> PAGE_SIZE, DMA_TO_DEVICE);
> > +		if (unlikely(dma_mapping_error(dev, src_dma_addr[i]))) {
> > +			drm_warn(&tile->xe->drm, "dma map error for host
> pfn %lx\n", migrate.src[i]);
> > +			goto free_dst_page;
> > +		}
> > +		dst_dpa =3D xe_mem_region_pfn_to_dpa(mr, migrate.dst[i]);
> > +		fence =3D xe_migrate_pa(tile->migrate, src_dma_addr[i], false,
> > +				dst_dpa, true, PAGE_SIZE);
> > +		if (IS_ERR(fence)) {
> > +			drm_warn(&tile->xe->drm, "migrate host page
> (pfn: %lx) to vram failed\n",
> > +					migrate.src[i]);
> > +			/**Migration is best effort. Even we failed here, we
> continue*/
> > +			goto free_dst_page;
> > +		}
> > +		/**FIXME: Use the first migration's out fence as the second
> migration's input fence,
> > +		 * and so on. Only wait the out fence of last migration?
> > +		 */
> > +		dma_fence_wait(fence, false);
> > +		dma_fence_put(fence);
> > +free_dst_page:
> > +		xe_devm_page_free(pfn_to_page(migrate.dst[i]));
> > +	}
> > +
> > +	for (i =3D 0; i < npages; i++)
> > +		if (!(dma_mapping_error(dev, src_dma_addr[i])))
> > +			dma_unmap_page(dev, src_dma_addr[i], PAGE_SIZE,
> DMA_TO_DEVICE);
> > +
> > +	migrate_vma_pages(&migrate);
> > +	migrate_vma_finalize(&migrate);
> > +free_dst_pages:
> > +	if (ret)
> > +		xe_devm_free_blocks(&blocks);
> > +kfree_buf:
> > +	kfree(buf);
> > +	return ret;
> > +}
> > --
> > 2.26.3
> >
