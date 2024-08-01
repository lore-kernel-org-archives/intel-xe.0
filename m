Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381AFC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 20:50:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0364210E93B;
	Thu,  1 Aug 2024 20:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YUkP6HK8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D3D10E92C
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 20:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722545437; x=1754081437;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=s8iNd8Hxn4btby5V8HoIRwv5WLXZo74SmomEve+/UOg=;
 b=YUkP6HK8JVg4pAOPkIDImRzfTS0Ndh1dcPae0IOJwosK7oUXx59klRXW
 jkf3dreaEZwoyqVw1LTGuRXa1LzYqO1PqmWHsU+3ANw1FwPDgGY9yHnhs
 kgKnj/UXjKhoqAc6YtjZD9IKC841PbMXnteEnAOZbkyLMxSFl28AdmYbq
 8C2eg9ZyalMIO2LvbuL3IvKOJZhLCPPPgFKPhEPuPQKdTmz2ylGk+Z6bj
 jxEUlgun+8VyB6WRCbyU43bU8qwu/XnE17BgnzPfr3HPXeI6XZpe1KNy/
 NNLMawr1K2nC7tuJnDpvbHw2SdRRRKRVX2p7cIuyV3VC8F9xj2851ggCE Q==;
X-CSE-ConnectionGUID: CCTUBsmpQTWmMWKibOzN0g==
X-CSE-MsgGUID: gUvT2FM9T+aoyT3suZWVSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20691748"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="20691748"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 13:50:36 -0700
X-CSE-ConnectionGUID: rWb7DKmVQ2+7pnyfH56TWA==
X-CSE-MsgGUID: Yx72jmdfTBu9lyyzR0ZaJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="59803785"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 13:50:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 13:50:34 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 13:50:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 13:50:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 13:50:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IWyhdWaE4FsbLGIMZcWG/pYV6WOIX7vllMzKEe/5NJMcT4bgxSc11s+k+g6cbg2wWXWDk5xrC7pIIJAL32yupYe/wN7QbEmC1gB5rGjp+udd5DbjsQ9C8Q490OoVyeroRp/PFnP0V3i6d6wm6M7sU/V3GhAm7Ch+F8tJYV3Mb6kZD0u5vkyjCTy2SCWLF20tluP5IE8ay56xY+He9P006dw5vHPP+dPxSFnSlY1WwWaQjmVhHosHv0ALEyfH88k5nx+EpfHF03vrNJW0YPQr5Nt3slWeDn6reBf+rv4Yp2Mnhzb1GyR3ZxzQyC8hAQJnoD1LIXZ8DJwl2r8azCyisA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53l12UDnhlN7pmZQtVtyaVNF3n0jBJO3xc0sUA16YGU=;
 b=c1VDu2VIcx0nG7Udzg3a7Wvzr/Pt9l0Q3mjIdJotz0YumO/5Iw6Ah6W/3PA2jiJTAKKCLiT+YvjkPkvn0hrksRH2oUKr3Vl//4Pt3fMatPP8W+jKRk6GfbZT6+Fiv8cgr5ohrN+icc+Np8LEKBLqmrexPcTZEWSJsotXMiK9pkDUEDkx7vPZsEBTP7giBAxWKT2SLL/VXTNXm55apTh78GPwcs5sN4hsckMjQgFpk85EzLBX3YlDhkE+lng2QGwJYVC2mdXC3o8/mm03FGBLiD9ejSQ7kwTJ3w3cN4+Y+PradkcLyLPLPtYhCVITFtjqu4JezgL6wRVb7OdiwpIVKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV3PR11MB8765.namprd11.prod.outlook.com (2603:10b6:408:21d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Thu, 1 Aug
 2024 20:50:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 20:50:25 +0000
Date: Thu, 1 Aug 2024 20:49:31 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <daniele.ceraolospurio@intel.com>,
 <michal.wajdeczko@intel.com>, <karthik.poosa@intel.com>
Subject: Re: [PATCH v5 1/2] drm/xe: modify GuC CTB enable communication
Message-ID: <Zqv023m5YU0O/k/Y@DUT025-TGLU.fm.intel.com>
References: <20240801055941.1187878-1-riana.tauro@intel.com>
 <20240801055941.1187878-2-riana.tauro@intel.com>
 <ZqvxcwxbDdyseSxJ@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZqvxcwxbDdyseSxJ@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR13CA0066.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV3PR11MB8765:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b41e957-8a64-4d14-32a4-08dcb26b91bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?a5ogDV6VtohYnpYIZHxZsgLIdpxoFWOBfH0uWz/shJhgEY991xEb41ec5P09?=
 =?us-ascii?Q?YomtNmG2U0zRjIo2dHU/uXxJesoUpG0ARziZrfpEMe4xPuEvMHqWKZovSobC?=
 =?us-ascii?Q?cub92YIW7Fq3RjE16+V9EZdN1KKUchcmxVxgJsxI6fFbRJmCQP1RWvggf8B7?=
 =?us-ascii?Q?r88zpzalElh43/CWbyfGLRuQhXr6VflbqEyTa4W1CB4c3Q8tubsegSuLMd/c?=
 =?us-ascii?Q?GU9HtsblkXihl00+r4rLqWwxqhcd4UcYt/yxijqyWI/rrTeUhnyozJAVByOh?=
 =?us-ascii?Q?Yuje/ilVrFqN4M8wbVT7t9e5kBUrG4XtrtAGZfUfznxFu8JjS10RHzWLkkzn?=
 =?us-ascii?Q?lzJAt/ovoHaoI+tXsy/UPV0rJ3Q6Tp0pwDmhlL0nk+3aMXFWgd5w36wPuCHh?=
 =?us-ascii?Q?k64Wszy3QupIyUMzYp3UDFggOOJx4EUQoU9QEu2dyOV+CLWDOvD0bZqjogC6?=
 =?us-ascii?Q?r5Csn4Cyf2pY11AFRZqDZ4L0s5WtWNP63obPqcW/gi98Zp3SE7E7/Fid8i3B?=
 =?us-ascii?Q?dF45495Qyme0zBah86u1epECru3JbReXtFOS9Ag0vidnMGXK7ZHkTTTGuR3H?=
 =?us-ascii?Q?N2nUVVluNYL4IDUoV37IxqpjVFIfg/x5PGaUUWhgbgsxaGHGRRPpHTh+ldbQ?=
 =?us-ascii?Q?BlwUrhe4x3Jc6FyPz/skObYip2qfz/t8VzpYrlfaUZG0lkBbotL/wbJbJAq/?=
 =?us-ascii?Q?8umQuYL1q4c9LW1XlZr8HEyS2+U6FbQb44dqDYwa84e7PeVZxHd1q2ZTQj1t?=
 =?us-ascii?Q?KoyQ7AVDcE65/MhiIJ0ent8nZSE1wij0HLfZ43v6IlpZU55E8PoAPP0GsMSa?=
 =?us-ascii?Q?qDXXBakXiSCz+2FtN4K1kD8a5PqGStB/4QrbmacQjab2nj8LDfZM6IlSWgom?=
 =?us-ascii?Q?L5lE4ovN5tLIoEN0aHvWflW4R+HCuXOeaI5YnzUYBBpEjgh47jvpAIAbLnqT?=
 =?us-ascii?Q?mVMFQgm0KO7M/4bAMmXaaX6KKyyEs+WNIzjdyteC2wWSJACgJfbBN34uGAa1?=
 =?us-ascii?Q?j36A8765vto1JlBQi2clTWGBKwHDdSNOBbDVuGwBr2XWSiB4Ab5clEM3S5QE?=
 =?us-ascii?Q?AY6fbMXffeD+DNqk1RqFl1+gYn+HKKrtEK9WOzCXKA8J8BJgrPT0vlRnDWgb?=
 =?us-ascii?Q?Ufd/a0brTUo6Mm7TDjlCf2tdn7EAiEALpUsX2NwhqOlXFKTEqJR543cIlL7p?=
 =?us-ascii?Q?cBn9NvkSjORcvFEvmNq6FbGQwkNpVIuOvvGkiScwZsFQcGuZiGPSSf37HQ40?=
 =?us-ascii?Q?H5RZCYGBfQVDJeAxOAhhnZVJhIeqgUmcQ7emWx+UGoj8O2Yk9+xLbLJ7y412?=
 =?us-ascii?Q?0pPdaw1WegYD8k10NuoQjn3iMGP+fMCpCftH/X3R/skVpQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9WiueMsg+56uPi2mG4eq8KUMPmNjhTCgDTjHRgsZjyX0fkS0b33BVSrnqsQY?=
 =?us-ascii?Q?yKVVizT/W9yTLwVstTtSRFvu96YI6uveYQTfMrqIDfjructLujka/V/a9zjB?=
 =?us-ascii?Q?fen3dlMIxaOksg4MgWRGYANqxUNY0MAiADQkgLZyCj1JMqhJFB+Smw7QpK6A?=
 =?us-ascii?Q?xMLgf6wb106cWyZtB0sx4/P6qDuvBeVc/S3hN45byMyVIDy9alr5+Jqssn5f?=
 =?us-ascii?Q?Y+5WsJ+S1yRgXdzx0Az8nejUsA5g3vg8xkDMvRXkPO6Enc/xyZ0GV5GNsuQL?=
 =?us-ascii?Q?avuiaWAPjKI87YnV683s6BBtx4/B0/jelgXciZiZPlJ2RdZaV638y/51bQeS?=
 =?us-ascii?Q?UeoB8SfF2XFLLxGaE8aifrxRbKcAciNXVdU/kD+uIhiUSzfjpk4/GE03wr7u?=
 =?us-ascii?Q?uUCyrKAS2atMDuY+y7TNCSvjitu7qyFv+WbYyP4b7gSq29u6lL/NZJigbyga?=
 =?us-ascii?Q?39TYXeTGwbL1cVRFOPOsKPIYMOk/RFY8WTeraCLSUzl3dIp1yIbk8k/RS+Li?=
 =?us-ascii?Q?qmHsUm+AyNhKMZSqzWGmeuHhYTJzQrShpKSrdiESYYSeO/goVC7XIjPP5MY7?=
 =?us-ascii?Q?QkG1iCzlggw0Ddg7wIm7u31nmz1SSGEaTlJmZ5xvqK11zTNFxb8OA+UBaAqT?=
 =?us-ascii?Q?MHGAcVcNAE9yqcFmDDBQAIzcO0DeNB00wzBgdV+CDWDV+gaNbTUi6crf4LVi?=
 =?us-ascii?Q?jVaxeawkI4iVSy4wNP3UhQSebs1PrlQTaAZGlBIBmhZepTjK85hInxGdYIdr?=
 =?us-ascii?Q?XhFWjB2NwBhG3Qohh8UFbVf2nlds2bel5BoZot7z/iFwnnoAKLk/enpl5E0P?=
 =?us-ascii?Q?j7SfltKQoFxGYciz5aQa3zyKpLybheI3Ee5XNtf8YNf6g2oBjUOiWaE+zCJa?=
 =?us-ascii?Q?ElsaZ98t4z5gH68m5+A0ILIVZX+HABd39L3lvSID+mfatg4lPXybRRAe1N/L?=
 =?us-ascii?Q?CS3xLvkE5OGPsutUDFJmpCqxqVFg/XnP/j4dVzIV3u7nFFO5brzkJ5kXWhZN?=
 =?us-ascii?Q?U+dyi79ftn6HfHRhujNLDppd7T+2D9ToJ79beHYb/jZG5xy3ThPXp+aPAPv9?=
 =?us-ascii?Q?Yp5DbbKSx+LZRuUaSrn1mbBzce75A/npFKHrLpIRPy9TDs3bzYzdmoOTwc5K?=
 =?us-ascii?Q?r+s8KDs26FX+wSnD5fh/xFXUYLqzkEn5ngKDODoPGBX3Qmxpc7KEQTULxe7a?=
 =?us-ascii?Q?yNUtxue5x9Os7CSATlOn/ZuP2Lp+osXHPu2kaNJtFjm515Zx26JPbz4vY2FC?=
 =?us-ascii?Q?lWfqUrUq7IOmkc4DdcA1AyiixXr98QPnxD956U0PLVh+jAGm5hkyaB8UjQ0T?=
 =?us-ascii?Q?OQvCSCPkCTmw/f3LgXB7QFESN4rUHzOxQ/NRuryQpLr9toZG9fvzcaNiKZeF?=
 =?us-ascii?Q?gb7ka5+YJxv0BATAVfa5DiNS1XxmtS5eehYwFgffrMSmvfY6ti5UTqjDiLqE?=
 =?us-ascii?Q?DiCL5ULjjpJIZuR27Kwdwu+vt2fwTyB1EOXSq990xTEGnBmEg9/mbA6TskG+?=
 =?us-ascii?Q?veSMxiFKNo/dZOWAfeDl428LA4MiNMOSJfU/oNtchamfjhQIzzfK2jHknAwh?=
 =?us-ascii?Q?LyywhT89+D42afHX1l7+/OgxfQYf+2vAJBaJJT8Yol2agefHNnr/BAIZfQIl?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b41e957-8a64-4d14-32a4-08dcb26b91bf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 20:50:25.7475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RhIFZ0NASzebLy+kTahKzHtPnVDF930zClsRr3TnDGDp8YadMY5s13XFw//0B7HT6lrTOcGCC0fNkgkoSHrGgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8765
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

On Thu, Aug 01, 2024 at 08:34:59PM +0000, Matthew Brost wrote:
> On Thu, Aug 01, 2024 at 11:29:40AM +0530, Riana Tauro wrote:
> > Modify GuC CTB enable communication function to only set the
> > CTB state if registration is not required.
> > This will be used while resuming from D3Hot where
> > registration of CTB is not necessary.
> > 
> > v2: split patches (Rodrigo)
> > 
> > v3: do not expose internals of CT layer (Michal)
> > 
> > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc.c | 19 +++++++++++++++----
> >  drivers/gpu/drm/xe/xe_guc.h |  2 +-
> >  drivers/gpu/drm/xe/xe_uc.c  |  4 ++--
> >  3 files changed, 18 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index de0fe9e65746..1ff49318f001 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -755,7 +755,7 @@ static int vf_guc_min_load_for_hwconfig(struct xe_guc *guc)
> >  	if (ret)
> >  		return ret;
> >  
> > -	ret = xe_guc_enable_communication(guc);
> > +	ret = xe_guc_enable_communication(guc, true);
> >  	if (ret)
> >  		return ret;
> >  
> > @@ -800,7 +800,7 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
> >  	if (ret)
> >  		return ret;
> >  
> > -	ret = xe_guc_enable_communication(guc);
> > +	ret = xe_guc_enable_communication(guc, true);
> >  	if (ret)
> >  		return ret;
> >  
> > @@ -854,7 +854,16 @@ static void guc_enable_irq(struct xe_guc *guc)
> >  	xe_mmio_rmw32(gt, GUC_SG_INTR_MASK, events, 0);
> >  }
> >  
> > -int xe_guc_enable_communication(struct xe_guc *guc)
> > +/**
> > + * xe_guc_enable_communication - Enable GuC CTB communication
> > + * @guc: GuC object
> > + * @register_ctb: true to register CTB, false otherwise
> > + *
> > + * Enables GuC CTB Communication and IRQ
> > + *
> > + * Return: 0 on success, negative error code otherwise
> > + */
> > +int xe_guc_enable_communication(struct xe_guc *guc, bool register_ctb)
> >  {
> >  	struct xe_device *xe = guc_to_xe(guc);
> >  	int err;
> > @@ -870,7 +879,9 @@ int xe_guc_enable_communication(struct xe_guc *guc)
> >  		guc_enable_irq(guc);
> >  	}
> >  
> > -	err = xe_guc_ct_enable(&guc->ct);
> > +	if (register_ctb)
> > +		err = xe_guc_ct_enable(&guc->ct);
> > +
> >  	if (err)
> 
> err could be unitialized here and I believe some of kernel test robot
> scripts will likely complain about this even though it is impossible to
> hit in this patch or once the following patch lands.
> 

Scratch it being impossible to hit once the following patch lands, it is
indeed possible as the 'else' clause will call
'xe_guc_ct_runtime_resume' which doesn't set the 'err'.

Matt 

> Matt 
> 
> >  		return err;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> > index e0bbf98f849d..13e75573f7d0 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.h
> > +++ b/drivers/gpu/drm/xe/xe_guc.h
> > @@ -20,7 +20,7 @@ int xe_guc_post_load_init(struct xe_guc *guc);
> >  int xe_guc_reset(struct xe_guc *guc);
> >  int xe_guc_upload(struct xe_guc *guc);
> >  int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
> > -int xe_guc_enable_communication(struct xe_guc *guc);
> > +int xe_guc_enable_communication(struct xe_guc *guc, bool register_ctb);
> >  int xe_guc_suspend(struct xe_guc *guc);
> >  void xe_guc_notify(struct xe_guc *guc);
> >  int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
> > diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> > index 0d073a9987c2..fa98e9f22631 100644
> > --- a/drivers/gpu/drm/xe/xe_uc.c
> > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > @@ -154,7 +154,7 @@ static int vf_uc_init_hw(struct xe_uc *uc)
> >  	if (err)
> >  		return err;
> >  
> > -	err = xe_guc_enable_communication(&uc->guc);
> > +	err = xe_guc_enable_communication(&uc->guc, true);
> >  	if (err)
> >  		return err;
> >  
> > @@ -194,7 +194,7 @@ int xe_uc_init_hw(struct xe_uc *uc)
> >  	if (ret)
> >  		return ret;
> >  
> > -	ret = xe_guc_enable_communication(&uc->guc);
> > +	ret = xe_guc_enable_communication(&uc->guc, true);
> >  	if (ret)
> >  		return ret;
> >  
> > -- 
> > 2.40.0
> > 
