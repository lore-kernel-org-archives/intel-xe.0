Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5635FC02193
	for <intel-xe@archiver.kernel.org>; Wed,  5 Feb 2025 01:16:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A22C10E023;
	Wed,  5 Feb 2025 01:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OhSByWDM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D5FC10E023
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Feb 2025 01:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738718171; x=1770254171;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QP1tGeisEopxZIXxiy8AhBEoOz5v0dlKuDhI+1V1Cds=;
 b=OhSByWDM6QPwhsCFJI7Prcx8pQdTS1swKjjr8YJVz7vLOmdqHJoHWmft
 5teH7G/Ux0C246Dqa25QT+JE6pmPkAvfrzsMvH1x+0sYOEsXWCziUDfRH
 b9vbaj61MPZgWoDyGYgwkzNu+PuJUtoPyTbmaQC3vWxW8NUDO9fRvQabr
 zyEQxBrqrwvEvx8lyFknKKIe2C25Cxkj14PrkJlzaiQgQ39b4SSMmm3dc
 oDtiJp5HhRjJTm0F1V62zAe1fTioTMvdQ07mFVxNRzkXLiLltdA9JYsJF
 v351HOuJEb4f509XiQGRdy+ttnYPhGvY1hRtXwBoubaR1rZ0+NgKAl0DA g==;
X-CSE-ConnectionGUID: wZ68QY3lTSyCU/GaXWovGA==
X-CSE-MsgGUID: Qc4z+fyvSxuemX0/0f+L1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50659454"
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; d="scan'208";a="50659454"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 17:16:11 -0800
X-CSE-ConnectionGUID: +qoCf4e/Tuu/U3ZCpM9TDw==
X-CSE-MsgGUID: 39HNAK5NQWioisG97NGdUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; d="scan'208";a="110609914"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2025 17:16:11 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 17:16:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 17:16:09 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 17:16:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jtfQYtGT52i7M89TZ7H6W4libbvDqVxYr9lbJm3a+j4TFQEUj9ZfPuv17Je2W51dfER9HTrCrygWcJC07KTfJ+MMzh4i+6z3bc8X/8o5yJufGXlu3Cy1p+i+4xSN0w2fjPNJvg4kItd7kIOft/fZcToEG+zSivAXzQnbmvdYOeH58h8DGbZvITi+uNmWpTqOOLbePVWL9BHOta9rBBiBz8jrDX/jZpFjGPlZ46aSf2ddjogOzny1FLaAx94jYcD7W75KxyVRqKcJgX5ftSEnow1UQwcECNxv76fcKnTLhixaEQUgM/u1Dopb7F2Ww8tT4wafj3LiAs+fetPZrre+cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jFTwvMcKRXNqXfxAiV2h1Cpb1ppBljqYNCBveQKm1Y=;
 b=OfsaKWZcn+DbABjXYbQ+Vb/55l0kDTye6MIXL1fjgzHqwl/kLdiuEiU+BK7/7hASBrW48yrGmpWuz4gg3GQeSSeaMNd9J0PCHeSZRmK/xFD7QVQOqVyAr+CHh6VtTHn/jXi2MVFN+DrCOYSRWUUb9kM57QiKMvGFFWjNjtso+dKSk4t7MXtWHbRethMWEu9IUbWtuXouhJBKPyYYuIA6cmrdsCKNwWoEN2eemN2ZhUmKgePGkae7G+wN/Kt6cQm6+pr0OTVvpR2MPwx1Ap2OpWxtl9gF/VYj4qkRpe51xx/YB9YRdJhPb3wh2x3rimCPJ7l4TvZY6zX0n2lDUi3lyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7444.namprd11.prod.outlook.com (2603:10b6:8:146::11)
 by CY8PR11MB7033.namprd11.prod.outlook.com (2603:10b6:930:53::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Wed, 5 Feb
 2025 01:16:06 +0000
Received: from DS0PR11MB7444.namprd11.prod.outlook.com
 ([fe80::fea8:e53a:7a96:7fe3]) by DS0PR11MB7444.namprd11.prod.outlook.com
 ([fe80::fea8:e53a:7a96:7fe3%6]) with mapi id 15.20.8377.009; Wed, 5 Feb 2025
 01:16:06 +0000
Date: Tue, 4 Feb 2025 19:16:00 -0600
From: "Olson, Matthew" <matthew.olson@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: Harish Chegondi <harish.chegondi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v8 5/7] drm/xe/eustall: Add EU stall sampling support for
 Xe2
Message-ID: <Z6K70DoXZyfTN_eD@bolson-desk>
References: <cover.1736970203.git.harish.chegondi@intel.com>
 <b192bec80378c3a7532fad983d910b896846fc3a.1736970203.git.harish.chegondi@intel.com>
 <855xlwgasx.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <855xlwgasx.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BN8PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:408:94::40) To DS0PR11MB7444.namprd11.prod.outlook.com
 (2603:10b6:8:146::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7444:EE_|CY8PR11MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: b0ba170d-4467-4950-88f2-08dd4582aa6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yV8UxRo2lQ3tPai/ab49dpJLxOsYrKEFMTvlSc3MpFhLvLzRW6QuFU2ptZa+?=
 =?us-ascii?Q?QbDKM3ZTPFmI+Wa1xmtEwFuUO1YUrQ7VcGpVdXGpoKyKMC+0edL/V2YdOns0?=
 =?us-ascii?Q?b5rNfJWdvdUIhYmHiir4nk6gcQfMspAuDG6xTOm40yzw65nMwwBrvINg2xWw?=
 =?us-ascii?Q?AXRJ3abEbyjYXteJTrUvxL+eksyppWJb1kvmoubBzFLPa47IyWc7ATUcG3j7?=
 =?us-ascii?Q?BqOu02hhSUAekgGpx5lf+e/XCPZdTUITZ74sFdkADoE9Y+xavSuQ2CVNRyVg?=
 =?us-ascii?Q?FAJS9O+AMjK4jN0sGhtE8vfn7xdjm/w0eeEmEKYpBWiDjibpfebHsznH2mm3?=
 =?us-ascii?Q?QIj7lmVNbqyuxS2qZLDygFGiX8PFYmWXuezISdXkNTix7YN1BrXhrkMT4k+8?=
 =?us-ascii?Q?FE+VpkV+BS+5WPP41U+h7fELCbds4BHPdeWQ9mUFv3442F8FgTAL4iGwMNlP?=
 =?us-ascii?Q?QoYxxyNH5DS45LTbkEw7R+r/RoTFghV8asTBhFb+RJtdgsbLyl53pGeqobZ4?=
 =?us-ascii?Q?3JZ6xZHwgWWTXFilVRc2xAnWpDQWGhR7opdmjlqo+206B6vhEWg/Av05CVGl?=
 =?us-ascii?Q?WWn3LMRUSRjg/a9nudWvlPy2rqPEVjU83iEmMFPFrWgPrEG5ZT8gJs2kXgKy?=
 =?us-ascii?Q?502E8mGvQqTR7olmduNdmj30wrzSsHIktDb/mY3DnCQqAevJryerDDtn/a1f?=
 =?us-ascii?Q?Bi3yCBEHHjw1aFbRcCDfqON1BVu6IusTwgLu8hhxqCNvOUFZ7huO0F8hgiZ/?=
 =?us-ascii?Q?Efw0HpXlHkpl2Cod2FHSRh6HKkWy+xvkdWEZbnX901GOxpN4uiGVbK2JeWSq?=
 =?us-ascii?Q?bLRhdhPxvFhk7GXYPgMvdb3sSU2HJi53CTXTZHBsTbVsFaDpfLL4Ok2KJtTK?=
 =?us-ascii?Q?XM0c+68q1hUh1dBO/27+0gX3QzIbuFR8RP2uVtEpMdskS2hUwiYWpd77Z3WP?=
 =?us-ascii?Q?UL+WHfPiODv/pzfmm5LxKPZjIYphznHDQGsljAHWe4FQmbVPXZABffKNj08k?=
 =?us-ascii?Q?6xVFP5n6/Gh2yrnVGya2J/I23ztxdY9IzdoMXtr8otgspDpzTRQsI4Gye20g?=
 =?us-ascii?Q?w//Nj+K3QPogLDMbO7VlBVQENIXUhqpcl/O72QM90enklmsCYWAON55oHN+L?=
 =?us-ascii?Q?axoKOeWfZJKK5Qo/P7a4EGnKWZqkjO9UNjuycHwLkAha/I3+qx4nwDskAXx5?=
 =?us-ascii?Q?4JZ6xi44Y34rwuMEDSVSkI6nsrpfiDLSgrKuXOAmcSA3Tzx1nBMz1fGJebUt?=
 =?us-ascii?Q?DSLe9ay57qvSC+JIYdPKxaySRsTlysj1rB0WAaP/VqphwkaK1iBXxYBVtYdb?=
 =?us-ascii?Q?DIfatfXIM2YQ9hYr73CZ3TsjiCF1BHU574icaDFPIF7S8qC301SJRPEc84u3?=
 =?us-ascii?Q?IBXTZ15LySRhelRcP4Ind0j/sJUz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?319dH1A38PgK2jYVfayGlV/S98eMr2rhEuhK88xDzEcy9P8rfam9ahkiyUN1?=
 =?us-ascii?Q?Cv4D3zkDwkQVDPHCQTSZVWTls2Bp/G1fKB+V9PBRiEcSM0ZUaqEpYELfL/1Q?=
 =?us-ascii?Q?m25eIPopAnojnV3ugE4Ulw/knhxnJ6WXqaH8QN9oVI5UqSqc/6/flSRXTXpo?=
 =?us-ascii?Q?Lijverw5kdb8mYCij71KleYHb40yb2mVvKv56FJrsY9FzKFa4mO5dmX2LUY0?=
 =?us-ascii?Q?nGyRBUBaBJ+4/aeBYrpo3tXO4rxbfp4MQiwetp4/N1iiQwAr70ceJ0+JxhA2?=
 =?us-ascii?Q?w3bIPVdDR+khiXmyWeZqPZPPl7XJ/hLa0vAQlSYsQJOSSlONadhdSYdBavOa?=
 =?us-ascii?Q?qmV5DW/RhxnjmkEg9+OokRJuWzV1j3mZk6BYXlSIWxXbTMSotnHN/ccTAN9J?=
 =?us-ascii?Q?Ten5bL4efjFXt9/XG9by6agCWAsdDtQu66tBSD/H+1Y4Pxw9GUTR2fpk2xpQ?=
 =?us-ascii?Q?EkxSWZBktQBQxoNfjQWXd1uVRcGO7RErZBYjh52Qk7/p/3iNa6nqONXWXsnx?=
 =?us-ascii?Q?2j08E1fV0T847l3YhOEhJMtSndLA7PW04krSjypb/g2ZKlVcqUWqgVAd8+2G?=
 =?us-ascii?Q?jHC7elFKu5fTDGw2Uytzt3E48PNnqgKOozMtQF64v73mkvWGse1MZEPgpInA?=
 =?us-ascii?Q?+WSf8a//dRlVON4DUNMLIbWiMh7OSlauEWDRP6VY8dYlGkf8s2blCKjmzaRM?=
 =?us-ascii?Q?eWrL6IEXcDSykgV29n4U4Vrna3lxo6AQSZAeCaqGOSajfyneC0RobR4knSMk?=
 =?us-ascii?Q?4iRNw6/UtehKUpKHS7O8ZobqvBqrforZRbxb/LcnXCdwbM4Ctc1Tuq/jA+FE?=
 =?us-ascii?Q?v8tavcPfeOdU5yxaT0iw28WLwHjUsuiYQPmZ3I5O3GND81N8tctWVeVGu9Py?=
 =?us-ascii?Q?9d9wCj1VW4svPzBPPnH9tQkZ25yBZUcSmtsvoSOywwsDhpRGv+aF+NPlNUgw?=
 =?us-ascii?Q?CkhDsWp2KVtqSxzzhoGKtGLdf5H8A6g3XXKOg48xoznnjyOM38scS3R/2EHA?=
 =?us-ascii?Q?CDwlQSQjKOO3DMNamaY1zscv0aNsNbHcDtGKbKDMlHkQGMFt//HtFEAIg/m/?=
 =?us-ascii?Q?H/ncclDvAyit4gYWFOK9LnlYXAlGxQHMdz36JmSqtfm+HNtOftYYnuaIue62?=
 =?us-ascii?Q?wVINLJcqhf+8uNIc9SqUwvePVDIF1THW47R5kxCXjCo1HrrH389A5leJ6VKX?=
 =?us-ascii?Q?tvjYqBNUdWPQPZmszXYL4p0T2TnLGMF9BeNhl3QH0jVvcYl3imvPbpCvXYc/?=
 =?us-ascii?Q?q+ZsRJIPoCPAtPpgCace/pPd8AmJ89gb2mdnH1zk55pOFBQ5cKp0db4Gu8pY?=
 =?us-ascii?Q?wNVG+YwAGbYCI7YNm9hLWG+K7I0W//bgiQDqiaw/N/uQU1yY/GL+GwTvSQ/c?=
 =?us-ascii?Q?3+0EG9bvDObmv8aEvhnaOCvOzSYqfRaA6gitBZ+PC48fewZnil1KCkQ+ZhWv?=
 =?us-ascii?Q?KeiLO71sPUFaWlW0UhNP4Aga619weMJ7XAbCbxnNbpk/0CZxa8+ynloaAbj1?=
 =?us-ascii?Q?tmpMTQGJhth16ncHLozHF+V5irMfPP19AJ26AbQmj6uBdM73RaQmafR/luBc?=
 =?us-ascii?Q?swMB9sTRvH0uJZVZG7EdHuiiVqW8YUX46LJM4fu7kkKUjy3yz1p5+C7U0Kza?=
 =?us-ascii?Q?aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0ba170d-4467-4950-88f2-08dd4582aa6f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 01:16:06.6114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: di3gqpmvFCUKEhIgouhwGWK3RoChxGna8iBm/O+ygJseSeEey50oBmH/UMthylAOGNJENw3fv+4+f8sNqZxteQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7033
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

On Wed, Jan 29, 2025 at 08:55:42PM -0800, Dixit, Ashutosh wrote:
> On Wed, 15 Jan 2025 12:02:11 -0800, Harish Chegondi wrote:
> > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> > index 437782f8433c..d72f80a9dfe4 100644
> > --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> > +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> > @@ -73,6 +73,42 @@ struct xe_eu_stall_data_pvc {
> >	__u64 unused[6];
> >  } __packed;
> >
> > +/**
> > + * struct xe_eu_stall_data_xe2 - EU stall data format for LNL, BMG
> > + *
> > + * Bits		Field
> > + * 0  to 28	IP (addr)
> > + * 29 to 36	Tdr count
> > + * 37 to 44	other count
> > + * 45 to 52	control count
> > + * 53 to 60	pipestall count
> > + * 61 to 68	send count
> > + * 69 to 76	dist_acc count
> > + * 77 to 84	sbid count
> > + * 85 to 92	sync count
> > + * 93 to 100	inst_fetch count
> > + * 101 to 108	Active count
> > + * 109 to 111	Exid
> > + * 112		EndFlag (is always 1)
> > + */
> > +struct xe_eu_stall_data_xe2 {
> > +	__u64 ip_addr:29;
> > +	__u64 tdr_count:8;
> > +	__u64 other_count:8;
> > +	__u64 control_count:8;
> > +	__u64 pipestall_count:8;
> > +	__u64 send_count:8;
> > +	__u64 dist_acc_count:8;
> > +	__u64 sbid_count:8;
> > +	__u64 sync_count:8;
> > +	__u64 inst_fetch_count:8;
> > +	__u64 active_count:8;
> > +	__u64 ex_id:3;
> > +	__u64 end_flag:1;
> > +	__u64 unused_bits:15;
> > +	__u64 unused[6];
> > +} __packed;
> 
> Same question about whether or not to retain this struct. Retain it if we
> want to document this information otherwise drop it and just keep sizeof.

I'd prefer to keep them, as I've personally found it convenient to refer
to them while while writing the userspace reader of these samples. I'm not
aware of any other particular place that they can be found, other than
maybe some other public repo that uses the i915 version of this interface
(IGT, maybe?). I'd venture to guess that others trying to call this 
code are also going to be searching for these definitions in
`drivers/gpu/drm/xe` as well.

> 
> > +
> >  static u64 per_xecore_buf_size = SZ_512K;
> >
> >  static unsigned long
> > @@ -83,6 +119,8 @@ xe_eu_stall_data_record_size(struct xe_device *xe)
> >
> >	if (platform == XE_PVC)
> >		record_size = sizeof(struct xe_eu_stall_data_pvc);
> > +	else if ((platform == XE_LUNARLAKE) || (platform == XE_BATTLEMAGE))
> 
> 'else if (GRAPHICS_VER(xe) >= 20)' so that we don't have to keep adding
> each individual platform.
> 
> > +		record_size = sizeof(struct xe_eu_stall_data_xe2);
> >
> >	return record_size;
> >  }
> > @@ -311,10 +349,16 @@ eu_stall_data_buf_check(struct xe_eu_stall_data_stream *stream)
> >  static void
> >  clear_dropped_eviction_line_bit(struct xe_gt *gt, u16 group, u16 instance)
> >  {
> > +	struct xe_device *xe = gt_to_xe(gt);
> >	u32 write_ptr_reg;
> >
> > -	/* On PVC, the overflow bit has to be cleared by writing 1 to it. */
> > -	write_ptr_reg = _MASKED_BIT_ENABLE(XEHPC_EUSTALL_REPORT_OVERFLOW_DROP);
> > +	/* On PVC, the overflow bit has to be cleared by writing 1 to it.
> > +	 * On other GPUs, the bit has to be cleared by writing 0 to it.
> > +	 */
> > +	if (GRAPHICS_VER(xe) >= 20)
> > +		write_ptr_reg = _MASKED_BIT_DISABLE(XEHPC_EUSTALL_REPORT_OVERFLOW_DROP);
> > +	else
> > +		write_ptr_reg = _MASKED_BIT_ENABLE(XEHPC_EUSTALL_REPORT_OVERFLOW_DROP);
> >
> >	xe_gt_mcr_unicast_write(gt, XEHPC_EUSTALL_REPORT, write_ptr_reg, group, instance);
> >  }
> > @@ -882,7 +926,9 @@ static const struct file_operations fops_eu_stall = {
> >
> >  static inline bool has_eu_stall_sampling_support(struct xe_device *xe)
> >  {
> > -	return ((xe->info.platform == XE_PVC) ? true : false);
> > +	return ((xe->info.platform == XE_PVC ||
> > +		 xe->info.platform == XE_LUNARLAKE ||
> > +		 xe->info.platform == XE_BATTLEMAGE) ? true : false);
> 
> Same here, use (GRAPHICS_VER(xe) >= 20).
> 
> >  }
> >
> >  /**
> > --
> > 2.47.1
> >
