Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B14C83F26
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 06:16:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3553310E1D0;
	Tue, 29 Jul 2025 06:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MaZXwi+K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4747810E1D0
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 06:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753769769; x=1785305769;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=S3E1q6inA4KBtEcanfGyKeu0m2bRsYc5huL0bt+DNaU=;
 b=MaZXwi+KNRcrgdmLBlgafPyGJkHOPO/mF/cpeg+vIBRIEtAmSxM2xuHJ
 WgrRU4J/8sDgDkL52NFOzx6Z46Mfwz67tg4/xxe2qDJZ3jjLu596x+xea
 KEr21jOraet99BY2gx8+3buf7kfhOMAAdZ5+YYjFDnjl5z0tLRAcyAXLz
 GJFiy3+Bx6KEmqLbW2cyp0eLObCT/b3wSeD4BcGNUHrddZx/rA11dn9qA
 E5/zz4f9umO4Xm0p7eXmM6ialcseRFQRW3vNlOULPspjqGYnA4g0CBOUC
 f+zyb4TgBetlAD5GAVx2FFSWQQD2B3EsEqhnwwGoOybzFRrtuTai7xeoJ Q==;
X-CSE-ConnectionGUID: B4IBjpAVQ8G7ugM54KpDsg==
X-CSE-MsgGUID: bxTkQ6a0Shy/TsJ4g6kCOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="58652427"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="58652427"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 23:16:04 -0700
X-CSE-ConnectionGUID: l3N8xIVdS2qhkEGwuUh6jw==
X-CSE-MsgGUID: tTxEk+BZRgqu/jucWQtkMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="162331329"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 23:16:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 23:16:03 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 23:16:03 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.79)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 28 Jul 2025 23:16:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iglH2drhAWGCM8fJl0iiS7PUrn2VIrvnIpDUYHtvVBFBDvR5JUs4Qba6vVE8oqiVk1jU5bZE4RdD69VEaQjwH9Ao0+zEYgJN38FqGtPeQmUOIj1TmdBuksJMZgfxwLT6Nbc7rh6PJ4IKxaoRckajL/r18a+/Xlrz7ZCAKX7H1/KDypYjfqmqW1iEJXAbjpA3fvYk9j6xs4pmr/tU8vlLY1T9yj9kuLEw//P8iLPIQnfrpHLiP1bK8eTIrDUWgPf4A+iRm7hbbEH5IZI8YLAUyhcg1Ufu3F/rR5DM/4nUUdwHIXY+H8b2IOQA89t0eL50wDSO2e2ENYG7f+y2M/u/Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G26GwH2gnbtjfXcNWX/jQE+FlRjUrMeNtuGzEeukiaU=;
 b=kuhWB0wpRw0BNvaL7/Da6ivxi4WdIGx/GfjIApR6RM3d8PAYjAZk+O8bXXtozfSYno1YjOqzUEkUzuqp6HpPQBvnyPNKO0kPbYp39Tk+CW9AHQXsPIZqapv2k2oKwWD8uWpZaBDfRlXVELGKDZBN7fYd7Nub1UkdJVhoupMosmphBNkW6eE9BoINi6iDz0GDTSVkBTUVRNjX7CaU7jUXzBHpwIBcyGies5ANvpwPVevdJ5FxYkZXA/t+uAHXFvs/LpKk8C/Bt1Fe29noUYJ5zLqJF2RJ+d1H5kQRTj54ezaTnUHaarV28XbkxHn7e2DG+CVFvJxh79ku3BQqfbkTbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4600.namprd11.prod.outlook.com (2603:10b6:208:26e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Tue, 29 Jul
 2025 06:15:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8964.026; Tue, 29 Jul 2025
 06:15:55 +0000
Date: Mon, 28 Jul 2025 23:15:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 4/6] drm/pagemap: Allocate folios when possible
Message-ID: <aIhnGBzO+RKq5HBj@lstrano-desk.jf.intel.com>
References: <20250725154011.2807655-1-francois.dugast@intel.com>
 <20250725154011.2807655-5-francois.dugast@intel.com>
 <aIP6lPnrsjUOTZe3@lstrano-desk.jf.intel.com>
 <aIdOcjGzp4pDlxQ2@fdugast-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aIdOcjGzp4pDlxQ2@fdugast-desk>
X-ClientProxiedBy: MW4PR03CA0257.namprd03.prod.outlook.com
 (2603:10b6:303:b4::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4600:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ecf480d-d839-4137-4fd3-08ddce6760a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+4VSRa01KOkTbH5WplD9lH9aKPzM9S0pfSVFRbFqgeEgjSF/bdOpptreFCYp?=
 =?us-ascii?Q?wLhbsNOtF9zE3CwCVRmcNOowC1EUAlyK5NO8NCTUbsuCozyQgzwmy2QmkY0a?=
 =?us-ascii?Q?uO+PHgGU1sx9gQILOQJfvidDybrK3z7ZuySqGyoBMzpy9ogv7RnK1WdIP/li?=
 =?us-ascii?Q?eM4277uXETayHfolRiJucj50QGSG9gKxryfkSNfqb6gQS7Vfa8zhxENDLrzD?=
 =?us-ascii?Q?ZoWnk5EGxb19IaTfmY8MfhipYqE26jPgxDBqz8/Kwd5ZpYlL+vS6IwEC4elH?=
 =?us-ascii?Q?1fEnZ+KxdZUxJnLNXgHErJMIhr5cJCHswuQXQa+pMGyPRRIYQkLfsVbwjEWg?=
 =?us-ascii?Q?c1rMaIfyBFwDt2MMq1oNwSRDI9UbwDltnJMaGhYsZasSY3u98AB6BQDarHCf?=
 =?us-ascii?Q?XlhnX+JFHb3z5sporxYR9a5PXi8kX9N93iBFMXMgGVxme5k+yxHMVwr+8WcE?=
 =?us-ascii?Q?cBGvn/MncVnFFM9bx3gf98sgYWWLtAOoBW9Tte78Co/bD3u8z2wJR/y/QcWq?=
 =?us-ascii?Q?yLDotRcsb7gLNvv+HGIUyb68e8OgQtpZ01Pa1vjrf152AYh5fgCtBiGIYobM?=
 =?us-ascii?Q?6tJnAfR9NsV8QceXmy5zx+QBSF800Ly1t4jcRm2+Mvt3bwZEOxd38Q3QtQa6?=
 =?us-ascii?Q?xBBn/EcRdm5oeXvqN6JH5LepBH9/YKEHAh5nUgiYZM7zHvvkBJ5w0e9o/MtC?=
 =?us-ascii?Q?U8iDKkWmkv8OW4O3vkJ4+Q421Smswu/NYYyL4gLeAqny8DRtdfJ1J+f+FOAy?=
 =?us-ascii?Q?p9aSRBg7AUhULWOWniQZbu2RSFcyMnx2RHX7NHgCgZa3LekNQbsoSaTn4TkT?=
 =?us-ascii?Q?cA7d4cVSLDL0ZLbjbS4g/PMZRQw8LppNZASCLRfOpf4BkXH7IhShiJ8Ye9hl?=
 =?us-ascii?Q?9FAuHCvKGpouBw3NjcOFMr+qVW0lvP/KZNlSVkNMGmZLslOMCjHA5/4WnF3A?=
 =?us-ascii?Q?9Hl/7XWE8gPRSqqo5uiddiwTnq/wB0GtRum/5nT9MLDcT0GIATi6rpb/RFJS?=
 =?us-ascii?Q?XcSArkjqAPJSrCdX230f9nhvstx2NNmX3HV8a9fakKBBxBORWM1amYqmB4Oq?=
 =?us-ascii?Q?xv0Tz1KNQ0V1Pk6w1OJ3XHjyo6iflv8+OgmoqXy8G9Ge2WbRo4IQ/EPD+tQ/?=
 =?us-ascii?Q?J0he3U+i5IzQbHytM6PSwnN/mV5a0IL7rkxOCIu3oO3mKKVQIU1a77KoSBZi?=
 =?us-ascii?Q?9m0i9hNq34Fk0Xcp5sSs6sixiOE+Dk2KN23VFhrKl1937hhqqiYHP3xlse9v?=
 =?us-ascii?Q?/V5Nf+0eJmLjeeCj3h40tQAuTKsL9cgD4ITjMkwWzps8NUeOy528CiX/D2or?=
 =?us-ascii?Q?k+jXJbRSsGWSbg3gf6sirYLF/Yz31HKdC1UH30J3PuhPHZi1t54apGmg82Kr?=
 =?us-ascii?Q?HHV6VRqGiFMD9qGhIDkQvOrGlY8NfQspLBZzKTCB+gKf3miblCzP22mCftYD?=
 =?us-ascii?Q?Q9m27rhjP9A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rKPTrRZdDYFysTsaod4sJNYo19W8vuMDR1lOixQMvtf1cmObxHsGvxxp3dUO?=
 =?us-ascii?Q?crg/tiq0jZfgC0w+YtoAaoW2WerTrkmVgB0HjWEyP80lFcoTF9f55Ns0xROh?=
 =?us-ascii?Q?RQ99LJ2Oemm9174brqls2kHTBGoCmhVChCqTvgsEmcbhk8Bi+vqhsqoTz/mv?=
 =?us-ascii?Q?2Ktp36D7LPN9i6S46Y/2M0c4d6TSCea/C/8QS/u8FORWP1T9pPm8iDg1MgkB?=
 =?us-ascii?Q?KuUQuj2G4Iba1T4MOCyn47u0NKqO0jj7VpI7vR6wCMTr1wKzdhpCWdo53/tu?=
 =?us-ascii?Q?YxMwUgdT3VAWnLDtPqjsN/V8cxCJWsjS3M3+TdoK1IksbpLuG7oia05Qez+n?=
 =?us-ascii?Q?KCt/Jsczh2rKCTKzBH3b8yiKxYJr13JVWq+iYVCkQjlMZIW0VCkn5WOVjaS4?=
 =?us-ascii?Q?AljF6Vl9Ie+eSiMCOb/PTWJFm1/Z2TU2+TJr50qrgbpLteCEXVKmiRDSoPFw?=
 =?us-ascii?Q?AfSNeTVDOUYIQM6bvmQTAHPAxBa5FsgxyEKtgOCEv8cOT7xpFFj14YluAuQ1?=
 =?us-ascii?Q?dSelGEvdSV/bUahufITJZAG/h2BrmI7QqiQrh3RpTdRUfXeG5nf1Z907/9Rx?=
 =?us-ascii?Q?sYX9KvRO+6I+nvVC6bn7AUr/4+ccEXUSyyl9nC+YpPpOshkrSmTxSneUd1ji?=
 =?us-ascii?Q?MwPxhM4iAjPOC5mndPYwe2H/26X//82gMPtA+srFD9SsSXFbVuffwWBHw5oT?=
 =?us-ascii?Q?v1s6TF55xA1EtU9uZbUqeR3+6XWNCg9oLbl6lZTbgMxn3/PFJ7ae3CKd6w9y?=
 =?us-ascii?Q?0gmHmi95HWzz2kPCSmvlrue+FRAzAKAPj9DE5DF9AeWt5NSctBEODR8exn3e?=
 =?us-ascii?Q?om7PVz9fkxaZAaWQ2LB5tCu7hE6vDv40I4k4ssDEFh3Sv8xIQePNjzCzTwTJ?=
 =?us-ascii?Q?tN3MMbrjQd7jgx7U4Oe4MxEyYN/jMj4D68RqV4tf0nZkdHsdKa+ojVCSlb35?=
 =?us-ascii?Q?jDXFbrJQ+TKPZPOuevmDCWAHJbqtopCF6LDmjrJ88Qppoy2SZkT6QDf2/+dw?=
 =?us-ascii?Q?UrCOmRXoJIRu0CMGUVDVNslPhNUnNfjjpp9a/aEViiNl54a9YOFVDRtTKrGP?=
 =?us-ascii?Q?BoIPErlBX4+UpUSJVwjaaBHPDN20lcZY+AaL6lP1ccrWvIAXQ4mUyFeNgAm4?=
 =?us-ascii?Q?cavgQObybKJTCoV6xTVNoM/NTTuofwwhagBYJnQxAFoA1P0kiBVbmxTbumRh?=
 =?us-ascii?Q?3+hTNSd+4+8I93peYNaamraoWXo5FVuLakQTAe4S39EUot2wgUFJq1tGiHyN?=
 =?us-ascii?Q?5sRDEl0mg5KIoDwhHA1ERWhQHYmjh9gqqMJarLG+q7zW98dk/WEhuIxy4qEq?=
 =?us-ascii?Q?71vhC+9Cxmm8oNAJTxrvLqOi4D2Dl5anVFTGJpcAdbJLXiaz3yNzV2jJYc/e?=
 =?us-ascii?Q?edCziL7pBiQwJbPIKS84qn+8KzgF8WU8ha8MkQ+f1mEUX4RgaQAxdIuq4odk?=
 =?us-ascii?Q?NSbGXdz8oW5RuPsaL1abjtvLwpo7aBlCAAdkjsqpScoWnitBpE2seduNTAI9?=
 =?us-ascii?Q?zu8sEbc0iQryuhv/+P4TL9I7Plpb60Xm+s0FRA6XQD+IapFlh8HojZOuRAJ+?=
 =?us-ascii?Q?Ln4dwtjgxnxLVIq7gkELDUujzXWKZtaeZ8aNyOYXRY7ihjAq4VpGgo9d8QRg?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ecf480d-d839-4137-4fd3-08ddce6760a6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 06:15:55.6235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WUEuXw2sWilWeS60zMLHCHY0CtVJmfiWFtAcsV3IUiifcJi6cYmv2IPxT8cdKrb/0wstmdx4ARQcbHN9tC2gpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4600
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

On Mon, Jul 28, 2025 at 12:18:26PM +0200, Francois Dugast wrote:
> On Fri, Jul 25, 2025 at 02:43:48PM -0700, Matthew Brost wrote:
> > On Fri, Jul 25, 2025 at 05:39:28PM +0200, Francois Dugast wrote:
> > > If the order is greater than zero, allocate a folio when populating the
> > > RAM PFNs instead of allocating individual pages one after the other. For
> > > example if 2MB folios are used instead of 4KB pages, this reduces the
> > > number of calls to the allocation API by 512.
> > > 
> > > v2:
> > > - Use page order instead of extr argument (Matthew Brost)
> > > - Allocate with folio_alloc() (Matthew Brost)
> > > - Loop for mpages and free_pages based on order (Matthew Brost)
> > > 
> > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_pagemap.c | 38 ++++++++++++++++++++++++++---------
> > >  1 file changed, 28 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> > > index b6f5d3a8e445..38753ce2bca7 100644
> > > --- a/drivers/gpu/drm/drm_pagemap.c
> > > +++ b/drivers/gpu/drm/drm_pagemap.c
> > > @@ -458,54 +458,72 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
> > >  {
> > >  	unsigned long i;
> > >  
> > > -	for (i = 0; i < npages; ++i, addr += PAGE_SIZE) {
> > > +	for (i = 0; i < npages;) {
> > >  		struct page *page, *src_page;
> > > +		unsigned int order;
> > > +		struct folio *folio;
> > >  
> > >  		if (!(src_mpfn[i] & MIGRATE_PFN_MIGRATE))
> > > -			continue;
> > > +			goto next;
> > >  
> > >  		src_page = migrate_pfn_to_page(src_mpfn[i]);
> > >  		if (!src_page)
> > > -			continue;
> > > +			goto next;
> > >  
> > >  		if (fault_page) {
> > >  			if (src_page->zone_device_data !=
> > >  			    fault_page->zone_device_data)
> > > -				continue;
> > > +				goto next;
> > >  		}
> > >  
> > > +		order = folio_order(page_folio(src_page));
> > > +
> > > +		/* TODO: Support fallback to single pages if THP allocation fails */
> > >  		if (vas)
> > > -			page = alloc_page_vma(GFP_HIGHUSER, vas, addr);
> > > +			folio = vma_alloc_folio(GFP_HIGHUSER, order, vas, addr);
> > >  		else
> > > -			page = alloc_page(GFP_HIGHUSER);
> > > +			folio = folio_alloc(GFP_HIGHUSER, order);
> > 
> > I haven't checked but I assume if order == 0, then alloc_page_vma ==
> > vma_alloc_folio? So goes for alloc_page / folio_alloc. If so, then this
> > looks good.
> 
> Yes according to include/linux/gfp.h:
> - alloc_page_vma()->alloc_page_vma_noprof()->vma_alloc_folio_noprof(order=0)
> - vma_alloc_folio()->vma_alloc_folio_noprof(order)
> 
> > 
> > >  
> > > -		if (!page)
> > > +		if (!folio)
> > >  			goto free_pages;
> > >  
> > > +		page = folio_page(folio, 0);
> > >  		mpfn[i] = migrate_pfn(page_to_pfn(page));
> > > +
> > > +next:
> > > +		addr += page_size(page);
> > > +		i += NR_PAGES(order);
> > >  	}
> > >  
> > > -	for (i = 0; i < npages; ++i) {
> > > +	for (i = 0; i < npages;) {
> > >  		struct page *page = migrate_pfn_to_page(mpfn[i]);
> > > +		unsigned int order;
> > 
> > unsigned int order = 0;
> > 
> > >  
> > >  		if (!page)
> > >  			continue;
> > 
> > s/continue/goto next;
> > 
> > 
> > >  
> > >  		WARN_ON_ONCE(!trylock_page(page));
> > > -		++*mpages;
> > > +
> > > +		order = folio_order(page_folio(page));
> > 
> > next:
> > 
> > > +		*mpages += NR_PAGES(order);

Opps, next should only increment the loop variable.

Matt

> > > +		i += NR_PAGES(order);
> > >  	}
> > >  
> > >  	return 0;
> > >  
> > >  free_pages:
> > > -	for (i = 0; i < npages; ++i) {
> > > +	for (i = 0; i < npages;) {
> > 
> > Same logic changes to this loop as the one above.
> 
> Will fix.
> 
> Francois
> 
> > 
> > Matt
> > 
> > >  		struct page *page = migrate_pfn_to_page(mpfn[i]);
> > > +		unsigned int order;
> > >  
> > >  		if (!page)
> > >  			continue;
> > >  
> > >  		put_page(page);
> > >  		mpfn[i] = 0;
> > > +
> > > +		order = folio_order(page_folio(page));
> > > +		i += NR_PAGES(order);
> > >  	}
> > >  	return -ENOMEM;
> > >  }
> > > -- 
> > > 2.43.0
> > > 
