Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24F7FEE4CA
	for <intel-xe@archiver.kernel.org>; Sat, 28 Feb 2026 06:43:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88AEA10E20C;
	Sat, 28 Feb 2026 06:43:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DA3kNCfP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0FDC10E20C
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Feb 2026 06:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772261006; x=1803797006;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=G84V+q5VADsajoh6REYt5Fg/jpDzxGv8LYJkcBAxwxU=;
 b=DA3kNCfPkdGvZ0xyRo5tlPkZ1YHS94mXaKqr0W5SAuOrWIGHEbcZXdHB
 T6Pjb8MUMnyjq3kw5ZDJkRurFCovaH76H7jAHiXe+CIP18ux+z6mqPdR2
 GoSAQAXQHSTHSeL1o1sMnnMxBWZS5y9TC8CYR117dM/Gw6Comct0tbkud
 +2IPMZ6TOhHh+X5XDqk82jimIA0VaTqFjNIwcO2eMdSOYZGs3n0dGU1Cw
 3LYShwX7g9zwOGHrRiSN2Aa/dwIRrKv7jfmcWpzr7JIOngs1O3d4udC2/
 dtD7yc2wpvgqz6v9UbqePwplTkeafNdjl6Sw/8W3Pb45hjx0/85NH5H0s g==;
X-CSE-ConnectionGUID: e52GIQyZQViRZwTBay25EA==
X-CSE-MsgGUID: diFybIc8Qle7UOhhxKARdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="77209985"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="77209985"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 22:43:24 -0800
X-CSE-ConnectionGUID: yBWFXDKrQ9Wor1deRUfXQQ==
X-CSE-MsgGUID: TJCfMQlBQkemtth25l427g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="254932619"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 22:43:24 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 22:43:22 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 22:43:22 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.60) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 22:43:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YmLZ7P+oo6SjJNpjHtZDSG1iq+tkvw+z9dalRGadBIzkheG6u5PpggstZNxGj19kfRAVZ2JqT4evmIVYDYriNs3CTFo0B1641Cl7d6xj3XCeCEg1uxK5PTHzd5Fzc48syyRKS7qvT8RHnYD+ew11q2uklrPtcKQUJQQ6qEuVwhXK8SjxHe4zZSHsZofHpEtKgb78g3ESDVV4tPJudSBVVYodiy0AnG+xIL+9DtPOP8OmN6wA6I8wUIYOqoBti1SWpwKIg/ri9+QuQ4wSNJaokLm/4dM9DYTd0pTHeuXucMpCDvD8QLRBNe2fzIS5PslZWsdfFn2d/37qQdBUQ54SFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYudcamVtz2fvEcVFsU+G1mL8HLnLI/fEnxSpafgMcY=;
 b=XblERDEO6Y3GcxN/n+CI85tG39T/i42voEi4W3wEQsfwPtUcEM7DI7Brx6DHVvxEJXC2COBzRR3lkCopt0qzddBQ/Qx7HMrOk/ZgbEki0+qqEU/9U5rknmcehq87TUSLfheemQrTnmYCVfhex0JBfHP3mGA68Q+D1TB1Gp5+cHls1Qd8nwCyR5Jk89GUbCBqmx8coRhMclpeAYxOkEhoxbsiY1oDwa6Sq/SSDXP3caP4H62iuWo1BxIvmtnwb45/r0gPZ66h+ZcNZZFHqog5+IJEpLx37p9p/er32HGLYPhW5Yok0BBMWTd2o9pISaVx50VhLesk3Y3Cx3/zO4egIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL4PR11MB8846.namprd11.prod.outlook.com (2603:10b6:208:5aa::22)
 by PH3PPFC852EF225.namprd11.prod.outlook.com (2603:10b6:518:1::d4c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Sat, 28 Feb
 2026 06:43:20 +0000
Received: from BL4PR11MB8846.namprd11.prod.outlook.com
 ([fe80::24bd:20df:a6bc:2b5]) by BL4PR11MB8846.namprd11.prod.outlook.com
 ([fe80::24bd:20df:a6bc:2b5%4]) with mapi id 15.20.9654.015; Sat, 28 Feb 2026
 06:43:20 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH v2 1/2] drm/xe: Skip over non leaf pte for PRL generation
Thread-Topic: [PATCH v2 1/2] drm/xe: Skip over non leaf pte for PRL generation
Thread-Index: AQHcp4pS3fn7cph1bkuE3E87cBO0YbWW+oIAgAAAySA=
Date: Sat, 28 Feb 2026 06:43:20 +0000
Message-ID: <BL4PR11MB8846C9AEBB3FC441428FEE43AA70A@BL4PR11MB8846.namprd11.prod.outlook.com>
References: <20260227014212.992363-4-brian3.nguyen@intel.com>
 <20260227014212.992363-5-brian3.nguyen@intel.com>
 <aaH5qkyzaD8CCl0i@lstrano-desk.jf.intel.com>
In-Reply-To: <aaH5qkyzaD8CCl0i@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL4PR11MB8846:EE_|PH3PPFC852EF225:EE_
x-ms-office365-filtering-correlation-id: 4a042219-4ebb-4b92-014f-08de7694a9a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: nW/AYr11gT0heuI/IpvH94+AGAGkuppDZiDaNMEBV7l866GIwGNqq085mUhhSm2l1QSjR5O/DNlQ9CxkpA0LkMotDQtk7bdr5WT8MknYv7niRl6n8Al8ofROtbTrAPZ03wT1ddQ0uDhzNnN2mvTPgfT4dnC+HQig1N6Yq08iYIS8cCWXEroMXPKNS/Fr04F8HFi213N0/JWr7efLIxXean0jgGg19WXdUBYCXL0xyHCR5I8Obvpi35POMQTYX+4TJeRzD9Je3XVsKPAi6pBNMMUWU4bKH+D3cq+qYnTQbu4xd2fyK26RCHfbcj3KL9u9fpcqaVRK28QxwEKHRjTJ9qHRq/EKDBuZ14f3B9qeFCq1fyBk0sdOfVmN6mV6CwI6tSXWZN33gg82vaysD3StLRuzp2ApfhGnafDZWBkmKEnyYaS9Ya5ohGMXLpn0oVLgwKd+0f+94qmCurZBikmP9t+BUq1+Z4CtHepI8gcsKRXrJRyYCFojAMDNFiacDZwk6rAJm1SbmHpbE1+MiY/r7Vy08JCeI6Q5TejGbyOtsMMI5k7UHX768nIk0iteR8Tq1JMJRDTZfI11lVwuqrCZEPFMLdNcQZU+opv9LognGGilzXyiH8gOxH1M2YCGf/U0x+KXYOu34iniOLLzK0UzDZr2reZ2fc0v+iu8ng/srATDD8SqLOBO7OTj0tGFVLMHFoDpsyyJKw8YrJr6kiSbTupBSYarVpAI5/wzD1gYfFGRjMYsaLSeUmdKaUOI+pyEDwW7JAwboZFz4Z1QFpCYsimS/z8gyqYHa6o7lHTWrYs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL4PR11MB8846.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lzNTCXTlfi+qEECJhb2Q/X11sZBA4NOWLhhpOE5WQsTAY3MVs4d3z4/SW7gt?=
 =?us-ascii?Q?uS+ofM6ZUEGRi8CbSFNopnAVpycQmKpIECZqqnqPGVDmboGreJGd2NR1u0zG?=
 =?us-ascii?Q?QLKLU1fUI5Ynd5vnBtFHqZ982c5yce/g8LAlwXQ4ROCjeGVG63BPikeJbzmi?=
 =?us-ascii?Q?4LkU3RS6Jhb0eSNBZm5FT5hqyx+zINPas4WX95tVEnJJGfsSAjGoSyUrEyQ+?=
 =?us-ascii?Q?mHR9sVNeAGOpJ1yFbrC9RvZFjHcku5+jn6z3nUHR7oAAjMJJn5ANXzAHhPYz?=
 =?us-ascii?Q?GZ7O2LyxUv/ZRfSwgVYJ/jFyxCMSpBtw2BkmlU1092Kcg45iUIFN2OdXLt+5?=
 =?us-ascii?Q?beJO3MUsETtuvlyReD9tZhVi6yWkWbHWcPseOvg74F3OFSAbNxu5oMwiRSon?=
 =?us-ascii?Q?aINAjEwpk3CaKXsKyMFJKs60n76aT1AtpICNakOQzwomETxotwlIBOR+P5mW?=
 =?us-ascii?Q?oQ5t98AcZM9qmLhQvtTL8qnUApWFQ+2vXyqUFkscykLcPj3+plB6WUpa73S6?=
 =?us-ascii?Q?u++PIl1Q2R3v5lWfG0fJJRSQio+UX92uGjSgNUB+l6ELftrZb4fuTAKmfgo6?=
 =?us-ascii?Q?UuOFhwwdWbTNGRtY2x4KysPpmpdNN4IocNXadGlYf1ReYz2wE51+OQYNbhx6?=
 =?us-ascii?Q?FNmma4Kwz09NqAJ1RH6Fe0hAMbugOgkMCqcjOYpBHciOFBEH3sZYdBFQhIWw?=
 =?us-ascii?Q?CS7XfGZFllIb6O0L0CPLY1LX2xIss6pkPzal7IMBEDC+KOIKL9/IGPxj09Xc?=
 =?us-ascii?Q?t0SSSLV6Tkan1iklihTh6OomoQLQS7mxb0E7QatHnLdRTKjwkYO8OUzg1lkO?=
 =?us-ascii?Q?pPDc0bjde8adwydr+edD7JLKbNRLUJkeLxaIZcsnIkxh9sORzN9eEV8vxbdV?=
 =?us-ascii?Q?97B6hBXejy0JMWFhjkDl8VIS1UFndTPpHbcobPs/m1RWRBpG/j+a2hek4CcS?=
 =?us-ascii?Q?pOmujmWw6u6+auiIFeuHKntV9KB0cS9CFQTjatb60I3688pMlopbmB2CPyOR?=
 =?us-ascii?Q?0zw8ZPRhEnZ2t/r/y0VMYD04PoJyJylaKn952LWlFMlKsMSqHq0PpnBBYLEH?=
 =?us-ascii?Q?/3RHeMh8AtF71AYR3iaZv6p/tTUF+/gBL37C0xkenoTt8BF7GL00rZa6jm1r?=
 =?us-ascii?Q?DyETVN46kE4rS6aWG1KutMzPURsavHV+C1y/N6OdTMpRPQQfM4+PnE8QNTRA?=
 =?us-ascii?Q?ATPabknhBG1B9CzOOVnEpTWbIKxdOkWQ9ylDPUPwPRiLbdU0IKQAzd07CsTY?=
 =?us-ascii?Q?sjX2+xlGExxku5X+zP1Np+Lb+bXufseQLNMtJ5yWBwdxSaDz/Fstk7vnH3//?=
 =?us-ascii?Q?rSerTce5WRjpBVFA5ao0ayip57iacgE4OJTIPnEnw86UA0GhDo3+QDur4mhe?=
 =?us-ascii?Q?zX1a9p07BcR3q8qDHNdAMW6VYUVmt52NvW9Xmz3RueJBb7rGrcThJUasQNmv?=
 =?us-ascii?Q?WfR9CwBKfY4P8IwWXJYghAiYNcl2CjUlaYkNXu4dmkM4nQFIAsGgEbR4IMDm?=
 =?us-ascii?Q?j5PrcS8w+13T7mWIlrbh2UfTGW04grbO9iusJqPmCA0Z97rFe6qV1+wl3Ftd?=
 =?us-ascii?Q?5SdxIPHrcV377h+qDNjAdBaBNW2WXl8oaShWa6kyNOcnvG9B91w/3SpIF6Eh?=
 =?us-ascii?Q?aw9SuzLnWE1Dl3eGw/SxlVb4ZYI8hasKltV6pAZ5aw4cCOB/S0Fhp5/yEL/O?=
 =?us-ascii?Q?IMswZBYQVYhaTEAI3Eh5GVE0zq7nCE1qRhBj28usg37SrxWl5d+JkAQFWZv9?=
 =?us-ascii?Q?AqMckNAVkg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL4PR11MB8846.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a042219-4ebb-4b92-014f-08de7694a9a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2026 06:43:20.5784 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3eBpKxAWgxJLh3yi7gthfNCMh0+d4/l+c6tWF+RyXhrLxHUMo4q4m9JIeIofLVDKmqzYDVM+2SzyalQUpz2eBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFC852EF225
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

On Friday, February 27, 2026 12:08 PM, Matthew Brost wrote:
> On Fri, Feb 27, 2026 at 01:42:14AM +0000, Brian Nguyen wrote:
> > The check using xe_child->base.children was insufficient in determining
> > if a pte was a leaf node. So explicitly skip over every non-leaf pt and
> > conditionally abort if there is a scenario where a non-leaf pt is
> > interleaved between leaf pt, which results in the page walker skipping
> > over some leaf pt.
> >
> > Note that the behavior being targeted for abort is
> > PD[0] =3D 2M PTE
> > PD[1] =3D PT -> 512 4K PTEs
> > PD[2] =3D 2M PTE
> >
> > results in abort, page walker won't descend PD[1].
> >
> > With new abort, ensuring valid PRL before handling a second abort.
> >
> > v2:
> >  - Revert to previous assert.
> >  - Revised non-leaf handling for interleaf child pt and leaf pte.
> >  - Update comments to specifications. (Stuart)
> >  - Remove unnecessary XE_PTE_PS64. (Matthew B)
> >
> > Fixes: b912138df299 ("drm/xe: Create page reclaim list on unbind")
> > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Stuart Summers <stuart.summers@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pt.c | 34 +++++++++++++++++++++++++++-------
> >  1 file changed, 27 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 13b355fadd58..6fd5f0c29d44 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -1655,14 +1655,35 @@ static int xe_pt_stage_unbind_entry(struct xe_p=
tw *parent, pgoff_t offset,
> >  	XE_WARN_ON(!level);
> >  	/* Check for leaf node */
> >  	if (xe_walk->prl && xe_page_reclaim_list_valid(xe_walk->prl) &&
> > -	    (!xe_child->base.children || !xe_child->base.children[first])) {
> > +	    xe_child->level <=3D MAX_HUGEPTE_LEVEL) {
> >  		struct iosys_map *leaf_map =3D &xe_child->bo->vmap;
> >  		pgoff_t count =3D xe_pt_num_entries(addr, next, xe_child->level, wal=
k);
> >
> >  		for (pgoff_t i =3D 0; i < count; i++) {
> > -			u64 pte =3D xe_map_rd(xe, leaf_map, (first + i) * sizeof(u64), u64)=
;
> > +			u64 pte;
> >  			int ret;
> >
> > +			/*
> > +			 * If not a leaf pt, skip unless non-leaf pt is interleaved between
> > +			 * leaf ptes which causes the page walk to skip over the child leav=
es
> > +			 */
> > +			if (xe_child->base.children && xe_child->base.children[first + i]) =
{
> > +				u64 pt_size =3D 1ULL << walk->shifts[xe_child->level];
> > +				bool edge_pt =3D (i =3D=3D 0 && !IS_ALIGNED(addr, pt_size)) ||
> > +					       (i =3D=3D count - 1 && !IS_ALIGNED(next, pt_size));
> > +
> > +				if (!edge_pt) {
> > +					xe_page_reclaim_list_abort(xe_walk->tile->primary_gt,
> > +								   xe_walk->prl,
> > +								   "PT is skipped by walk at level=3D%u offset=3D%lu",
> > +								   xe_child->level, first + i);
> > +					break;
> > +				}
> > +				continue;
> > +			}
> > +
> > +			pte =3D xe_map_rd(xe, leaf_map, (first + i) * sizeof(u64), u64);
> > +
> >  			/*
> >  			 * In rare scenarios, pte may not be written yet due to racy condit=
ions.
> >  			 * In such cases, invalidate the PRL and fallback to full PPC inval=
idation.
> > @@ -1674,9 +1695,8 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw=
 *parent, pgoff_t offset,
> >  			}
> >
> >  			/* Ensure it is a defined page */
> > -			xe_tile_assert(xe_walk->tile,
> > -				       xe_child->level =3D=3D 0 ||
> > -				       (pte & (XE_PTE_PS64 | XE_PDE_PS_2M | XE_PDPE_PS_1G)));
> > +			xe_tile_assert(xe_walk->tile, xe_child->level =3D=3D 0 ||
> > +				       (pte & (XE_PDE_PS_2M | XE_PDPE_PS_1G)));
> >
> >  			/* An entry should be added for 64KB but contigious 4K have XE_PTE_=
PS64 */
> >  			if (pte & XE_PTE_PS64)
> > @@ -1704,8 +1724,8 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw=
 *parent, pgoff_t offset,
> >  	 * Verify PRL is active and if entry is not a leaf pte (base.children=
 conditions),
> >  	 * there is a potential need to invalidate the PRL if any PTE (num_li=
ve) are dropped.
> >  	 */
>=20
> Everything above here looks correct.
>=20
> > -	if (xe_walk->prl && level > 1 && xe_child->num_live &&
> > -	    xe_child->base.children && xe_child->base.children[first]) {
> > +	if (xe_walk->prl && xe_page_reclaim_list_valid(xe_walk->prl) && level=
 > 1 &&
> > +	    xe_child->num_live && xe_child->base.children && xe_child->base.c=
hildren[first]) {
>=20
> Is this part correct? In particular the 'xe_child->base.children &&
> xe_child->base.children[first]' part? Wouldn't the above loop catch this
> now and invalidate the PRL?
>=20

Argh sorry, I should've looked at this a little more closely. I was only co=
ncerned about the
potential double abort at the time... Looking at this again, I'll probably =
need to covert this
over to=20

if (xe_walk->prl && xe_page_reclaim_list_valid(xe_walk->prl) && level > 1 &=
&
    xe_child->num_live && xe_child->level > MAX_HUGEPTE_LEVEL)

to handle cases where it doesn't enter the loop/1st if statement. Testing l=
ooks fine so far
for this change.

Brian

> Matt
>=20
> >  		bool covered =3D xe_pt_covers(addr, next, xe_child->level, &xe_walk-=
>base);
> >
> >  		/*
> > --
> > 2.43.0
> >
