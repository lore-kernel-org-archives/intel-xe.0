Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD73C27C5F
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 18:20:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40D410E1D3;
	Fri,  7 Jun 2024 18:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eSY4LTrE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6489610E1D3
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 18:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717784401; x=1749320401;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BOo/Jf26m+04xKWGi//LF2AnrvbMWZWXLJ/UcHtdTUw=;
 b=eSY4LTrESUJOxrjbFcuQP3nTXAqqEmwyIJARKE81RtROlkxuPnSIP/Y7
 683kGCvytce9ySfM8/Ae0PxbCA9SB8FZA78FY7u9S5QNwKvuDH9sU78Ro
 /yN24vMJzwjslW/1GbQh7NeC4/1KdS1sj7HZw75GfVOJIAYmdKNw9YCI+
 HxEUTtqwc/edX+TiOWe6TI24kNJympB7Xx2TwhTMzsqKJBRcoljI3A5so
 ThEH0HZITNqqRrLTbJinqz5eEM0Hk6I0lBrbdr4f50/Sb4Y1QervBycJU
 ch9uJvhjYuaOqDWx0XhXcnV4W+3lh0x0HYQ0IoOGHdUfp84p4Tw5uBpx/ Q==;
X-CSE-ConnectionGUID: oZWmFsepQMaMwHr8p+yGLw==
X-CSE-MsgGUID: RmUVXSeuSTW8eh53Cek0HQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14701951"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14701951"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 11:19:59 -0700
X-CSE-ConnectionGUID: /0F5MOFoRuqRu9q3sEC9oQ==
X-CSE-MsgGUID: UGdU5Y7OSkiYTKxqLRqQ/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="69574040"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jun 2024 11:19:59 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 11:19:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 11:19:58 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 11:19:58 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 11:19:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZjfn9c9yiZZBkiWvxocAb1oHoY35AqFqJFTrWq3LEc5lT9/TQbukPDyMak6+oAr9FmDtFNW9MS1o1gfSLhsOofsfhD5wL90cjjyqZ6MRx697bXN1REwXiZZBqqeyZPXql+QipTwlXNElpSHL5d3wz9Pn9I4FRVaCdFFFZ8LvT3sbPPwCl0SRfgpg+s00eR3fKgZ5f+4UaJbRmvHQnr5CBFwHb5ptIv5JEvssyBcJ7jac4YSy4WX9Bhqg0dq3x0ho8x9GxB2XzNcr4Hv5fCsoLseuX5piXDfT6y+PiIvUoDpE3LLPuCoEflISuAk5s89igv3v0bZ8CUabJ69fEMklw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Th4J1s6bHhVwse+6tKLk2J9U5+1OSkSeErGDdhczY3Q=;
 b=Rl4arnqQA+YZZ87pfBG6lLkhI+umwCWfjpPMrJZxKCOVJkh0Tmedqed7CYewW1aRGPlUVIf1GuyTjBqfDH85YFf8V4YqdofVqXPcLrM5s/MZgKl/4GXbY/e02t5Mjkj9RF1BsAZsPlr6ggif7iE9vwH9PP+3R4UTZ9pgbcPcXadt9Q8exCzDvZj4X7HbMaS8ldr7J0pys4iiRho40Lo8L1xIqV8MClbEva+eYtMERw0YqmSb1pnp19WhhYXdVwpFvqqAsx3i35bI/OBLZDdGLUbYl03QqI4rkClM5ud7xRppJlC/1ri1M2vBzz4tzMRm0zaE49w0vl5bWYLDooEb6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0092.namprd11.prod.outlook.com (2603:10b6:510:2b1::6)
 by SA3PR11MB7555.namprd11.prod.outlook.com (2603:10b6:806:311::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Fri, 7 Jun
 2024 18:19:55 +0000
Received: from PH7SPRMB0092.namprd11.prod.outlook.com
 ([fe80::2ad4:4a5:b333:6ff7]) by PH7SPRMB0092.namprd11.prod.outlook.com
 ([fe80::2ad4:4a5:b333:6ff7%3]) with mapi id 15.20.7633.021; Fri, 7 Jun 2024
 18:19:55 +0000
Date: Fri, 7 Jun 2024 18:18:57 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Thomas.Hellstrom@linux.intel.com"
 <Thomas.Hellstrom@linux.intel.com>, "Welty, Brian" <brian.welty@intel.com>
Subject: Re: [v2 31/31] drm/xe/svm: Migration from sram to vram for system
 allocator
Message-ID: <ZmNPEW4hD32E0E/1@DUT025-TGLU.fm.intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-32-oak.zeng@intel.com>
 <ZhdREN0UWjNV0TXG@DUT025-TGLU.fm.intel.com>
 <SA1PR11MB6991A1D7325C383EB37EE4E992FB2@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB6991A1D7325C383EB37EE4E992FB2@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR05CA0182.namprd05.prod.outlook.com
 (2603:10b6:a03:330::7) To PH7SPRMB0092.namprd11.prod.outlook.com
 (2603:10b6:510:2b1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0092:EE_|SA3PR11MB7555:EE_
X-MS-Office365-Filtering-Correlation-Id: 235f9080-79cb-47ac-e24c-08dc871e6e91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fSDAKzDwGB3Hw6snJ9SCcz756MNLHPFZDN8Aa2amGf7XoKDwIovhbdJb3x9H?=
 =?us-ascii?Q?4SKSDT9HMAnimBMjh9JJAqmcSgIMCTcn5ccjsFXtPUFxWO0WVC4AYwKOtPuD?=
 =?us-ascii?Q?01JR0JBoNiJ9PxoJf3Ml27LsecE/iJkCabtLOPDnQe23IfoaF6b6TpJwTVSL?=
 =?us-ascii?Q?4wwRrhXhzqvwJagRypsoqK4bv1qe+MmAA1DK7UPngCCYwS+SjsWYM5oLnGWT?=
 =?us-ascii?Q?8zTQl2dVwgvcekoDOhyYtYfYxmVn6k/NyCBqee2ISrUYwL2xw6U/j4L17CFF?=
 =?us-ascii?Q?mAbpg/Gc4D9c+tk9b7btq738lE9hERDyacTNjQj8p8hUSEuW7r9t90gYj/25?=
 =?us-ascii?Q?cr6OkJTBazDyuJcMk2qJldQR3v38n7kbD8qCs5/foPxk7Qkb7bl2x0SBVCD0?=
 =?us-ascii?Q?zHyfSB+c98bGo0H2MzTNz0iL7gH3gDCDF8NSmXsPu8bXjKZCcQ3Bh+UuWj9K?=
 =?us-ascii?Q?WdIS22Ap1omTjBDIlAf3+uISZyyMNqjlch7tDfYhRQGt9LpI8wiBL8fEmFEL?=
 =?us-ascii?Q?PzCwsqoR5jyHDkS6Er6Qtd1QEod1peJaumqiMMvXnSo8ffIfJzpRgMCGiEOZ?=
 =?us-ascii?Q?E2hUEnXCcRDKqofymS6xv/M6iL+EbEFnkkJTaYauRYn/U7SVRufsWVUbZRYN?=
 =?us-ascii?Q?ORZWvjizgsfdNPGqWqnF/ZK5iStP22vVBPKHVcIr/OV1UmETXKmTyCanyus1?=
 =?us-ascii?Q?RXKSIa46Lx7HHsbmMXSsxiqij7Av7BUljygjHdI2+oGOFxwBA9k0VHwEPFLJ?=
 =?us-ascii?Q?YCmYar68QEFIQ1yPCDLXsbIFEPwLRrOvDwfnGOhfM5BH5LrWYcmmKKJjhsJg?=
 =?us-ascii?Q?IuyDIlg3KFeHNxwLDUSkTjMYXJmcg7m8CWzzzjsGbVvl3GWNaIDLvtHi0Oc4?=
 =?us-ascii?Q?/duFE7vl4rZnQESFXZaWLZAsMbQtZLW9Az5YOFHSFK+Hzqr9BJp2vHWiozzv?=
 =?us-ascii?Q?sJ/nMCiAZh2YQrMO8c6C0QZ6O3CtyEOIhXoxbAWGWAfl55isoqNq2auigZo2?=
 =?us-ascii?Q?rvdiJRPUOeT8O7Z7CpWTBYJXGQWqU2peMN6I4eDgBD1R8by/HguMLZxwOwl7?=
 =?us-ascii?Q?0PBIWK0HHpp/hHVJfaPviBC4wW48tsH37oTjxKps3KRyGfaRVqvr4wIi7sRW?=
 =?us-ascii?Q?wvQ8yckmCau8FjJmNhIftbPUZP48qTU9CZhfl2BJAwMpPJ3pvASk05UQ/d/C?=
 =?us-ascii?Q?CIGyPuMVprslZt0ynf1BwL4MWKddKvAVZYxNkfH6Bo5Py4WHSP1TlnnDVKEz?=
 =?us-ascii?Q?4ldlXeIhqOpSNNeDOrgh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0092.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vVlI3BAeiOF1eeJfpA960g3zq2N+3TY9fUNQhQVRZjEvwBzpaObBSv0TsihZ?=
 =?us-ascii?Q?OwXEhsnCueUhOj/19g0fXUGfIo0iSBLzStojgLnBycx39pKLMqrU6394cRuw?=
 =?us-ascii?Q?WsS9NI9jPfwe4Ivul1kQJdkPHNEs9UdVtKFrmRuqlc1IMvvlMq9t8fXxhuke?=
 =?us-ascii?Q?zIqA4F2TVfk0XHshpopYApLTXedclkOdYt9viom4/LPRTnrZmAScfCH2nN50?=
 =?us-ascii?Q?Y7rmQ39rrZtSfB5B3mZoEh8k9tefTc9i1OKh++M4eTvjrJQad3Y1pyTY73wC?=
 =?us-ascii?Q?P5UsqOIsE8ydTC7BkpXgIouj7fOhw7SL2aKmAVqqN/XPAXd1pAvL4dFDtsOA?=
 =?us-ascii?Q?soCG3Wh0N/D3DOITfREDmHAeQHU1a+QrCgqQ2NQrm6jwHceoDZRRQNA1Ez6c?=
 =?us-ascii?Q?ucQqPYZSJV8GGboxT0emaCSjt0E4EEM56V/EEHUCntH0luR0Gy+RV5HZ2C/d?=
 =?us-ascii?Q?BW4Ra2cEvtnvFcI2HhlI/+ceOqZPAyTF31QGnCj6lOmTfcdyvTjYezPpoQAW?=
 =?us-ascii?Q?p35HZOpXF6p6fYkfOPVW1ve1tZhxMQnwur2jlgiCh96nLaUz1h04TmK81Lgt?=
 =?us-ascii?Q?hjh6pdDdqZ/C/9vpcek49HbE35lmJRH6peNfjlNbyeCJEZxza8KCkgX7qhG5?=
 =?us-ascii?Q?m4JZptFHnRnHKNTh0Fya8ZvS/DFiyISuH99ZMekpwnICfg3q91mQlmsT78t5?=
 =?us-ascii?Q?X4zvLpDVLbLsgJHmLz7Kp0fCG9uFHM4vEdlMLMd5Xt0m1Mp5MQ1JNdjJB6rk?=
 =?us-ascii?Q?NXl1vSt7npQ8AhwTFqWvpARrNgybWq1VPzVGQg0l2eez4Iu5CX2VpeAc2sGy?=
 =?us-ascii?Q?agFK01edT8TrRzgvYNI9Deyv3ViD6us3/nj1Q8ou8yYvByfZgzB1FMfV5iFu?=
 =?us-ascii?Q?DnePJBBl1jLJyyUEqiXF48GvuDXSpTF8t9xDKmuuXtHGilNxMRTOWicGpKUf?=
 =?us-ascii?Q?SVMptFNwMhTS68OpxxUPuZAjc/WO37K/B+J7o9kRqLnL0cDDCPUlhhelcuL2?=
 =?us-ascii?Q?yrk4jmoS6CGgSsqqanwdkPZh/nUl2+NhD9XeA7jVczyMd6RL+GPD9h5tvreO?=
 =?us-ascii?Q?/Q0EybqMWLJP41aX8a+3nxbCfBmuRNK45zgKVxrs07KYWzk4D3xf58qf4YUX?=
 =?us-ascii?Q?ZU2Wgcfk4Le2MMztERfxJdf5bZfsHdBhtyTyvoQpN4Nf10bRUuAnOTnoKXh2?=
 =?us-ascii?Q?PcEsK6F9aiUNr4uGw4nhAmfLgJNluvAzcx4KK7hCp6qNIlAXn3/fHW8KAFn3?=
 =?us-ascii?Q?KFCwZhIYTX+YgsnpkwNNCa8A6OQhPxde3LIa2ZHagfDQrs3Pjk27B7pR/oce?=
 =?us-ascii?Q?HCXS/VceIrbF+TEA5EouYppyBICNKLInMPn2Z3EDxPWpj2vy1sOJc623du25?=
 =?us-ascii?Q?gfjdbVCxQSxGp5EAEFd4Al5wokRk2NJlC9Pn9NeSV+TVKzH/PEhR8rOMv9bv?=
 =?us-ascii?Q?mJFU27HNz9IQoBm3+wUZO8XG/RLW4DkRe+LMXIhkbaShW+G2AZhjD3MLExwq?=
 =?us-ascii?Q?I4zaLCsaKuVlmGsBNDOYsj+XR938D1FxW5OdjBCZnfv7vYNXyRiqQmg1MI9h?=
 =?us-ascii?Q?rZO1EacrVnt9IKqXvVdtGElS7el8BULuoNcKryBe3ovqLmjhIVu5g/fHtRpo?=
 =?us-ascii?Q?HA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 235f9080-79cb-47ac-e24c-08dc871e6e91
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0092.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 18:19:55.5185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y3+JVrxb26D1LiEt1w4xi7Nh3jusWdarJlQOkrEIQY+xEPekjg+7TR4fl50KC8hNevSgJtuOUKZyFacGPcp8cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7555
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

On Fri, Jun 07, 2024 at 11:22:42AM -0600, Zeng, Oak wrote:
> Hi Matt,
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Wednesday, April 10, 2024 10:55 PM
> > To: Zeng, Oak <oak.zeng@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> > <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
> > <krishnaiah.bommu@intel.com>; Thomas.Hellstrom@linux.intel.com; Welty,
> > Brian <brian.welty@intel.com>
> > Subject: Re: [v2 31/31] drm/xe/svm: Migration from sram to vram for system
> > allocator
> > 
> > On Tue, Apr 09, 2024 at 04:17:42PM -0400, Oak Zeng wrote:
> > > If applicable, migrate a vma from sram to vram for system allocator.
> > > Traditional userptr is not migrated. Only userptr created during
> > > fault (aka userptr splitted from system allocator vma) can be
> > > migrated.
> > >
> > > FIXME: The migration should be conditional on user memory attributes
> > > setting. Add this logic when memory attributes are supported
> > >
> > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_gt_pagefault.c | 9 ++++++++-
> > >  drivers/gpu/drm/xe/xe_vm.c           | 4 ----
> > >  2 files changed, 8 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > index 668984f0769e..c6ba00049964 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > @@ -20,6 +20,7 @@
> > >  #include "xe_guc_ct.h"
> > >  #include "xe_migrate.h"
> > >  #include "xe_trace.h"
> > > +#include "xe_svm.h"
> > >  #include "xe_vm.h"
> > >
> > >  struct pagefault {
> > > @@ -209,12 +210,18 @@ static int handle_pagefault(struct xe_gt *gt,
> > struct pagefault *pf)
> > >
> > >  	if (xe_vma_is_userptr(vma) && write_locked) {
> > >  		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
> > > +		struct xe_userptr *userptr = &uvma->userptr;
> > >
> > >  		spin_lock(&vm->userptr.invalidated_lock);
> > > -		list_del_init(&uvma->userptr.invalidate_link);
> > > +		list_del_init(&userptr->invalidate_link);
> > >  		spin_unlock(&vm->userptr.invalidated_lock);
> > >
> > > +		mmap_read_lock(userptr->notifier.mm);
> > > +		/**FIXME: Add migration policy here*/
> > > +		if (xe_vma_is_fault_userptr(vma))
> > > +			xe_svm_migrate_vma_to_vram(vm, vma, tile);
> > 
> > Agree we need a policy here...
> > 
> > See my comments about locking in [1] thinking if we migrate we likely
> > want to hold the mmap lock until at least the bind being issued to
> > prevent races with the CPU fault handler, at least initially.
> 
> As explained in [1], I will continue to use mmap read lock for now. And the read lock only covers migration and userptr-pin-pages but not the bind. The bind correctness is guaranteed by a retry mechanism and a userptr's notifier_lock.
> 

See my reply, I think to avoid races VRAM migration and grabbing VRAM
pages via hmm_range_fault either need the write lock or a some core
refactoring needs to be done to avoid races.

One more possibly wrt to these races, maybe we simply don't care and
racing access between the CPU and GPU of shared memory and this is akin
to a user fault (i.e. the user must synchronize access or the behavior
is undefined possibly resulting in a segfault). If I recall correctly,
my tests showed when these races occured either a memory corruption
happened or the user got a segfault. 

FWIW, Cuda seems to have synchronize calls in their SVM documentation
(e.g. pass a malloc address to a shader, execute shader, call
synchronize, then access malloc address in user program). I can dig up
this documentation if you like.

Agree binds certainly do not need the mmap lock.

Matt

> > 
> > [1] https://patchwork.freedesktop.org/patch/588542/?series=132229&rev=1
> > 
> > >  		ret = xe_vma_userptr_pin_pages(uvma);
> > > +		mmap_read_unlock(userptr->notifier.mm);
> > >  		if (ret)
> > >  			goto unlock_vm;
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 498b36469d00..8a58fe144a02 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -71,16 +71,12 @@ int xe_vma_userptr_pin_pages(struct
> > xe_userptr_vma *uvma)
> > >  	struct xe_vma *vma = &uvma->vma;
> > >  	struct xe_vm *vm = xe_vma_vm(vma);
> > >  	struct xe_device *xe = vm->xe;
> > > -	struct xe_userptr *userptr;
> > >  	int ret;
> > >
> > >  	lockdep_assert_held(&vm->lock);
> > >  	xe_assert(xe, xe_vma_is_userptr(vma));
> > >
> > > -	userptr = &uvma->userptr;
> > > -	mmap_read_lock(userptr->notifier.mm);
> > >  	ret = xe_userptr_populate_range(uvma);
> > > -	mmap_read_unlock(userptr->notifier.mm);
> > 
> > Now you won't have the lock here other callers of this function...
> > Probably need to have locked / unlocked version or arguments here.
> 
> This is addressed in v3.
> 
> Oak
> 
> > 
> > Matt
> > 
> > >
> > >  	return ret;
> > >  }
> > > --
> > > 2.26.3
> > >
