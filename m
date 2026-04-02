Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E655D6AB14
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 20:50:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB4110E0FB;
	Thu,  2 Apr 2026 20:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XDe82Iti";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA9A10F358
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 20:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775163016; x=1806699016;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sbcy1PHVAQdSURKEocSb2TyuGsLbMy0DpI1smjUb5ZQ=;
 b=XDe82ItiuW0L4AU8kOwbjmHr51jSS8o4ZJW1kpjfu6BDyFlHBTq0zK+T
 D7nslCyNcx9sjGTN5eIA2Ln8MsiZ05OuIpyxk+zT1xPBY3KR+fL+km6G1
 yGmIxWOcIUeeDTWUbEtF3nDQiGvdAz6iKF/1bbhiJy/ua6r0lnWsLwgCk
 FjZWBUlnCRMKpkjdBK8dOarhN/gDF4y971FkI1+XiIsOMdJ2jWnwJiiNq
 zZmI45q8n5fn9oTd6ovVy3yGOuEFHHyq0cmiT8hQkcxQZVu5pwXdFnyVS
 SoZOkPkim1Z9hhPfXg/pEwdYxJ13OKFSBpP6YR3SwBoV5GGuj0+aGPNaY Q==;
X-CSE-ConnectionGUID: N1bXwyuURviIVyy0H6cKWg==
X-CSE-MsgGUID: gegoWRKJTy2GsUfcYm2aGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="87303707"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="87303707"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 13:50:16 -0700
X-CSE-ConnectionGUID: QaeDZafNSMCYN8fToJolag==
X-CSE-MsgGUID: Z/PGhByXRkijmGFfP1U4xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="227019934"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 13:50:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 13:50:14 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 13:50:14 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.52) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 13:50:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NZ/zlPozbyUvOtMmTJSt2Fo4FdOlyIuqHrps6TzAwZRrrqi/QYNLQPVJmSoMCwOYd4skUclsqVXsnqCDQ8nfYKkbayXcq5HSlSL3AB0sr5V3B6HwsGYZdt/1uVE1RlGqnKqRj2OwW011W8+xVeKecwmBMJ3c9W1QBc5hrm53C11Vzv9quVZSiiHBPc91vjC8t33dDUqOwRBrQuWVNjlAF6JOy3H05RueRU00HKWHm+baTJmP+p/EMnGT+fzlartBVFOwANCwoW66urZo8DLMSWGu6fit+ggc8ysR917M9EoJT+QKJ8zMUHcUU2Lg4k0/XAX21Y/zLp8ROwV2RLoRhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4s871iE4XZri6tVuHwA+b5beABNBSnkDxagg1g3hmdQ=;
 b=mg/7WzpFDWhonO5SK4xmETTwHHMrQEEsUe8jmdsqgkil4oofHRovm0kJeEhppv5KM0cu8Vr6++a7OFv6ayFd2QXPrrJCIn8OE2MpFsQWUc4H3goyo2AaCqBSZPc/iOrYRiw3ULAQ4YcgybnuXvDX3zOHSmeURIZAGFFVZjARHkGdJQgYBggones2k9riH/BuvZTO19wPPFfJftV/4Vrv0kJ1QfGAkTniXgfEwJlVdfCH1VGbZYje2DLMBZdN9D4zgtCzQDSZ/LzAG6y511Zx8+L5QZlWGLN7g9VPK5zVSq5EhTlUJ/tt4u6vfpiVVWwFBE+nPxAbkruuK3hGl+p5fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM4PR11MB7301.namprd11.prod.outlook.com (2603:10b6:8:10a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Thu, 2 Apr
 2026 20:50:12 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 20:50:12 +0000
Date: Thu, 2 Apr 2026 13:50:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [RFC PATCH V6 1/7] drm/xe: Link VRAM object with gpu buddy
Message-ID: <ac7WgTPbXAwAPibW@gsse-cloud1.jf.intel.com>
References: <20260327114829.2678240-9-tejas.upadhyay@intel.com>
 <20260327114829.2678240-10-tejas.upadhyay@intel.com>
 <ac2wu2u5wNhkmzx9@gsse-cloud1.jf.intel.com>
 <SJ1PR11MB6204361A01C00EABBEB1986D8151A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6204361A01C00EABBEB1986D8151A@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0251.namprd04.prod.outlook.com
 (2603:10b6:303:88::16) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM4PR11MB7301:EE_
X-MS-Office365-Filtering-Correlation-Id: 63a880e7-c060-4e13-f7e9-08de90f96f78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: HASIdvW9isQQ8/9GDBFQBgSEGO4Ko4BNjD1vQ6YAemrAbqG8jt/ol/LAAD/Gauzp5iCUlyIZ7dciWWwwyAue2ORMZbj/zDWs3nsFjJi9lDyQn+nadRza1kTxrwcIcmOyugYxSjcpjBgALh8arBN3SfSXnXubwWK0N1KQUjWrqd0C+yDCHX6bpYcZyNypm3/bD0qu0Nb3c74WIXiGZWr8m9nFFcQmum5YnRz0OoMZQsjlFU20z8ZzOANCifMfRc7Qn3IS715MR8YShRS8kahXyqXzdbjLhM4VaQPLLln4IB6TTbQIhXb561BoPagXi6kdV1ZmBikPbhwsuZLa9JIFaC6LmOMDznm6hhufLikQWP+oZrdcUlTDlVFexr8SjTr7QvqE2oR05FVpx72Zd8pcwdhf2JG3BLdRxgx2a6fxyAY6P4j76U9s5Pi7LLD6K1x7XhGREnBHENJ5XXkluFDKJlZpPVefXQW8A+2IPvxbl2KOuLdAXYN1tl0LJsitcUj83I5S6LSsgpyIyx4zKlx31xAcZ/LdtOp/892E/srXoihG5PDUzvjLkQpIk5cYTQYpxHd1yEtnzr4uRdZRL+eQaHupXj/5Stk9+Uz0+nCYZzD3n3HcmXoCnZpL/nJxIH6vjNaC2YOjD104BgBHd8yL3gt0t0cBmH/eve/2WJ5KPP12zbz5w/+fvi+ty50m0/D3/m3fwMMrMTvAKJacIBSqsqz4jEdOo2i+tHc2dLeIg68=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZyvvIlslyjXtykOFMsBcDet4ELtdAncIAncGG8S2Qb6XjXGyUoJckqi97Yi5?=
 =?us-ascii?Q?7l0UdzHMueppLuX1sSvIss/vcy9rm3kS7DSykG5ZYomuMgNaWVujSN16i85W?=
 =?us-ascii?Q?+5BaW6xNp5iw262vQlbvgZAihufWwqknFldeRGy3r3Ri8yxMOGjEXUuJMOD/?=
 =?us-ascii?Q?IV7W/E8OLB3uh1juDLCaA59OPXwjj1oISz1ffz422T4nWEC2u/67sJpqydB6?=
 =?us-ascii?Q?3hZEaWnU9gO/U/MA+okn+0JF892H/2/ospvO/7lty+Ae0inf97E2uJvrzJcG?=
 =?us-ascii?Q?NFSKJ3gvoV8bn9XZv5gJbyOlfM+L7kDtB6hqaclbxemK4kux2hiHA9gsNfz3?=
 =?us-ascii?Q?FeSG8UNcImcexB9mZBXL5uEwcQpv6Z9RsDaK0z3vN7sk0Y6vhi+VJqf9Tv7J?=
 =?us-ascii?Q?VprGxoKVRnT+hq0T3i51Ul0KrneNoYDT1w5KT56kTkPoMGb6d8T8TiI3ArVT?=
 =?us-ascii?Q?HHJeX3YtIC2BWX5j3vJBuToRPnbYQaVX3bdEakvza0GxiqOttVEDMlwoATkK?=
 =?us-ascii?Q?eKgAk3C1aZn9sRuiFAouShKJbsgMpILcTCpjmWHO0f0v5n+2EoP+O3sRSnut?=
 =?us-ascii?Q?UsbKoW6YTTP5vY0Qvma1m46uQJvMMsTlmrwNoWIUs+UDPd89HBF/N2aW5RDB?=
 =?us-ascii?Q?cCoveGiM9UuZC5huQZGI+WjmotSgCG7mAxU+rWcZpmjjqiRLvD3UCY9nQkWY?=
 =?us-ascii?Q?vaeRUK50UBYXBt8NKCxOWxUuLXkHZHK9jPs2cG2dnLK32kMvA9qBGcaTWjBa?=
 =?us-ascii?Q?HtR4ts0hiMBbIgV+z2rxNs+nvdGsi4LGT40ftFtPHYK0EkStavhVTxuMYMiV?=
 =?us-ascii?Q?BqIvlcCNM4WOvcTZq7ycMZ9gWwJfKmkG+3JHtINFIB1RALE0Y4iwReJ9DkmF?=
 =?us-ascii?Q?tWHgKzeMchbhL+wUGDvldXsb+8q64NlqvSmHbVqMpWmODbvMua7QG7r4hs+F?=
 =?us-ascii?Q?zN7FysEe1xiVidDl5NgH1F/32iVC4B2D8JDx4IDo+9a7MT6PsDanyN1404Aa?=
 =?us-ascii?Q?kpHL2VcWM6gfDG259vS8vbQaiE5qM+O/HmarRgyIopCyZl2a6sOxgQm7FOYJ?=
 =?us-ascii?Q?2Ok7J++lQFK+TEth59mrfu8iiWudOZ8WOcbArsyV5eVsWVP+3HD11XDGkXs/?=
 =?us-ascii?Q?J9kLfkhF76jtpw2ilBNqcUkqmrT2tndwPxKdkCRzIMAyr2RFxpPRyI7GhWLz?=
 =?us-ascii?Q?Lf964Hah4u1e0dtciozmhi0GyTsRqSeIY0JRRvawqAZwLaCgjNY2Vv8DiXba?=
 =?us-ascii?Q?jAxharG3fJf9PLcLMvA8CGk3A9HGnzg4bSx9XsIGhcV0DwvTvFA+4Ypx/tRH?=
 =?us-ascii?Q?ngTYYiOKGXCfDqYBCELRJUo0SOjJK+RYzgX7tWavDTTxFzA3J4LmB9TItDjy?=
 =?us-ascii?Q?2DRPOyh4gtf3wFnbRV46VzaixkXJwhAxecn8bSHBeF60hZvq83y6xDb+jmPZ?=
 =?us-ascii?Q?1gCDd7n3efQY0gXDkqiXTK+JEBKKHyXXIQ2mLCSbBxFtWzOeXkwp3Q79CERE?=
 =?us-ascii?Q?a1cu/3l/XA6dlcWhvORRPIozd1j0fAJ6UJOsjs0CgE/HFGj6i9yphazcB9Py?=
 =?us-ascii?Q?WfuU/9Szceivyn+UxDtVy3egc2ioMQzQyyls1bD1HFGmOspzvfTbQgDtRpWP?=
 =?us-ascii?Q?gmSsLRcn9ps59w2/jzktjexFciZOIEP40OKej9JR8B6ynKRNrbos5KO2wcR8?=
 =?us-ascii?Q?CkRmffI4jjfisb5NUwPI1+4HI7EzzJ/dOcEsEN3crToJpaROXpOFHdAe7lop?=
 =?us-ascii?Q?JuLbURpefNAjqn/EhbZZU/uJkqwl+/U=3D?=
X-Exchange-RoutingPolicyChecked: IIofRLyc3nbpANUayJseyuK7KjDcamhjwoiB3NQqYpUDcoMy+uxo+rlZuajQHWuGFhW+mZxn8rgUAr6jTRPOJmXQcmv6wp1PSoMOX4K/tQPz28VAMSkwIfubckUm2IYTp+ZYCVXEaL8h5DW8p+70nhPnKXfPMCsnh/wlm+fxJoZAwNem1ojl9c/f4XL/u6dAt+5EI7YGIH8kPhw5q3VBWUbZHHyAPMcdpvJn57uz8Sgu/nBZYtIJXbkpv0GQpZdbPpPAkO7avp0mwqCYgdUO4XIt6sQmxQ4NMZtQDVU/Jo2JSeTpI4+ZjZhgFRi9uVIrMrlknJwV+rgLGoNoN2sHCw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 63a880e7-c060-4e13-f7e9-08de90f96f78
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 20:50:12.6426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TruWuCWrOvYYhO09J9iWklqEuE4McRmWWZeGXcLshQKU1jFqE5E4eHNA+9lIU5XuAR0Fj9x4+x2gLCmemf6RfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7301
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

On Thu, Apr 02, 2026 at 03:10:02AM -0600, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: 02 April 2026 05:27
> > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Auld, Matthew
> > <matthew.auld@intel.com>; thomas.hellstrom@linux.intel.com; Ghimiray,
> > Himal Prasad <himal.prasad.ghimiray@intel.com>
> > Subject: Re: [RFC PATCH V6 1/7] drm/xe: Link VRAM object with gpu buddy
> > 
> > On Fri, Mar 27, 2026 at 05:18:14PM +0530, Tejas Upadhyay wrote:
> > > Setup to link TTM buffer object inside gpu buddy. This functionality
> > > is critical for supporting the memory page offline feature on CRI,
> > > where identified faulty pages must be traced back to their originating
> > > buffer for safe removal.
> > >
> > 
> > I just checked the SVM code is still setting 'block->private'.
> > 
> > I thought we had patch for that but I don't see it in this series.
> 
> Yeah, you are right, it was there when I sent earlier revision, I somehow missed adding that patch in this series. I will add it back in next revision. Sorry for confusion here.
> 

Also free to send that as indepent patch as we should be able to merge
that one whenever.

Another comment.

> Tejas
> > 
> > Matt
> > 
> > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > index 5fd0d5506a7e..c627dbf94552 100644
> > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > @@ -54,6 +54,7 @@ static int xe_ttm_vram_mgr_new(struct
> > ttm_resource_manager *man,
> > >  	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
> > >  	struct xe_ttm_vram_mgr_resource *vres;
> > >  	struct gpu_buddy *mm = &mgr->mm;
> > > +	struct gpu_buddy_block *block;
> > >  	u64 size, min_page_size;
> > >  	unsigned long lpfn;
> > >  	int err;
> > > @@ -138,6 +139,8 @@ static int xe_ttm_vram_mgr_new(struct
> > ttm_resource_manager *man,
> > >  	}
> > >
> > >  	mgr->visible_avail -= vres->used_visible_size;
> > > +	list_for_each_entry(block, &vres->blocks, link)
> > > +		block->private = tbo;

Should we clear block->private in xe_ttm_vram_mgr_del() to avoid blocks
having stale references to BOs? Or are there guarantees elsewhere in the
code that a free block cannot reference block->private as a BO if it
encounters an error while in a free state? For safety and clarity, even
if such guarantees exist, it may still make sense to clear
block->private in xe_ttm_vram_mgr_del().

Matt

> > >  	mutex_unlock(&mgr->lock);
> > >
> > >  	if (!(vres->base.placement & TTM_PL_FLAG_CONTIGUOUS) &&
> > > --
> > > 2.52.0
> > >
