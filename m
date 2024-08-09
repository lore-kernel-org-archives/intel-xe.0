Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE6FC49EA1
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 04:51:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FE810E861;
	Fri,  9 Aug 2024 04:51:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nc9ztWAm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6469810E85B
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 04:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723179111; x=1754715111;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WLW/ckWaSCguEFSp1AIZPQmsbfpL2jFylaJtfMuhuYo=;
 b=Nc9ztWAmeVJQWu8n4gCL5INNu7wZhKUWc3WIofCE0lsDthyMVN1I+9je
 m4OHTrdJV5u1UL8v2vowP+sazNeoANhBqqBaAWlnn0r6Rjfgnoq5taPu6
 do5sTzxzSb36dmaCtEafQswD99vKHZ60vXxLhHNFHZjNp7ohurNQhsZDy
 L5Bbi8oSceaxzdDFjmiCkRHlVJ9kb4B2J7ykiRUsyPuxr+21A+KEzDst1
 XQzpFiLXQe2b2fgEfO666OzorVNUpSlyIrDdGp8Wn5oXwy5aLgf2nkTn1
 q3KVFYHqdskkSQITzm9eFHfCucq9ByNxpKYqr+Cy+o7SWoGEBgWnldIW5 Q==;
X-CSE-ConnectionGUID: chGlEFRkTzaBb14daeiqqg==
X-CSE-MsgGUID: /wQXkf1aS5iMuUAD1JrIvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="25134110"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="25134110"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 21:51:50 -0700
X-CSE-ConnectionGUID: 1SG2zXgEQ5amrMjNosu7FQ==
X-CSE-MsgGUID: ViNwDpJ5TxKpObnUKHbTpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="61568163"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Aug 2024 21:51:50 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 21:51:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 21:51:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 21:51:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 21:51:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TxpaQ732Av0hr3nKsIuBbby9dc7QEBOg+7YDGUq/ZAan2+iOti8354q89E69wiJXiOdZbAPcNYBql06qQ9BczeDe2CfQv6jZB4ahbgz73DTWBrPuuSehYAbU8Mf5jMcGe7j/Hi9kfDpIDFjEi+TqhTFqRterpXo1bPHATrAERra5Y3U358AYvVYYdlypNDqHdWbkjZo4fvJqy+leYMEQE1oIz3bNRQNXnnvC99MGTs1Pe3VeJWH6X4EYbNvOg7DL0z1bCgq0TlyIXYdwoeZNIq84M7sio9Hn3JMbC4EbxO7hfvRBTdIRMeD5Nh3X5g77BJzQnaaQRVtAYwRy4vuaRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWt8expNs1uM6ZhoBVIfEMv/7b0ELYMX+4EF9+VkJPk=;
 b=gvp672q13SiMpVrQf0AroNlpnvXYZh5oHPpc9DV+zaRf97K1r4RyErbGGphj9r2+7ui/h3MnrJss0QD1b6nfnjE9ANKzAvQcdjc845OiQscEns3Yl16HWyLuE+MBPHakRVw/NTMt+tMmkdgK9sbnKEG7sdIqbYYiVvH9iUQTtjVsFnVdAtRa/Iim9i32Jo8yDr1kNaHh83Fpj6iX3+TqRod/3WGblPkr3RGBe8YzdzUvltY0T3l3RmbZYkOinjCNW8kYkT0SHRLHP1yL1eJeQJPc2qSDlnyYg9xetG1Bi+Va7234RZCgnpPvBru+YHYn3TxaE+h0EVKH1g6kBoks7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4827.namprd11.prod.outlook.com (2603:10b6:806:11f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Fri, 9 Aug
 2024 04:51:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.031; Fri, 9 Aug 2024
 04:51:46 +0000
Date: Fri, 9 Aug 2024 04:50:23 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Jose Souza <jose.souza@intel.com>, "Lionel
 Landwerlin" <lionel.g.landwerlin@intel.com>
Subject: Re: [PATCH 5/8] drm/xe/oa: Signal output fences
Message-ID: <ZrWgD7cytpu8NIdR@DUT025-TGLU.fm.intel.com>
References: <20240808174139.4027534-1-ashutosh.dixit@intel.com>
 <20240808174139.4027534-6-ashutosh.dixit@intel.com>
 <ZrVSgjTbzPameTeb@DUT025-TGLU.fm.intel.com>
 <87mslmcoxi.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87mslmcoxi.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR03CA0264.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4827:EE_
X-MS-Office365-Filtering-Correlation-Id: e24477f3-562a-41ed-e15e-08dcb82ef904
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XQ23CgYMk5rausstldGIjNzJ9zup729F3U8rs9mZzKoguWyvUzfkdldEvf7O?=
 =?us-ascii?Q?1NVKhRflCQD6pq6h0E8xGF2NMlYjLX4hcjZfH+eBg7TlRU1yuuFTfBeudWhw?=
 =?us-ascii?Q?EWJJDEbVhglA+u9t4mmlg+Hx0Zn8UZt+bhXZAiyNTPClk7W3uqa9hAoFzyiJ?=
 =?us-ascii?Q?Udz5z9bPevUBTPcNxYIdZLDOyyT/jQTmIvfX/pGSTjxsHnGWgU5CxAXA0JY+?=
 =?us-ascii?Q?q2KmOS1PP954CvxEtM6HB9kJSG06WUHMqhI/HceWa/y2WrxrAD13ovWCMivD?=
 =?us-ascii?Q?tXB4w+W0WSkY21w8gMGonulR/T1Iwuu49HKmrNV3XaS8fKGWfIt853LcBzkb?=
 =?us-ascii?Q?Jx/zVFIh8boOa54oNV5TJOyjo6WxKiM3052auLvkN7GSclnkjz8bKeh8FOxV?=
 =?us-ascii?Q?7IcQUCFoSSIomwGnWHi2d8J2LxSyhr+Vf8UQ8/DPVQnjeQt6ca4Dq7mBm9hE?=
 =?us-ascii?Q?d2+YZUnfOPEfI2R6hLlU+gdzsTav6E1p8kH3A/e1A2iLJchYn5yeHX+pY0Fj?=
 =?us-ascii?Q?fJtDPGA3WfU4hzUvX3h5NeBNKG/HxcrMYM29YfO5vf153HXLX6iRHRelvqvD?=
 =?us-ascii?Q?4Y7e//pYCeRDdhj8NICatOdDLohS5gLr0bXgk16+Wh55nlTrHs0GU5f6FHyo?=
 =?us-ascii?Q?fl5JXIwGWTvSHzE5wyBmftaaIhlFC/5v6dy/sIoav/I1WXdEA5/I1aaBghhc?=
 =?us-ascii?Q?JWx5Q+1epJk6ucccteWLKGM/6kZwIlPrL0Hh34N3iUZNJmV9Pl++5DOO/QlD?=
 =?us-ascii?Q?sOYMOZJCnqQ1WTSjZG+F7v/VWjX/8XM1m+K0EAFAr18+GaC3kY8SuJGq6x66?=
 =?us-ascii?Q?yo1zud75ZUXjsUHgDTnuoQrv3/gJ94dL5bjL/GA/bIsvkmSdw6wZBIFoH4Tm?=
 =?us-ascii?Q?l8z28yf10VcPFMky80vEmUatAidMMoFwPXqaOmTIDFsVeswfNSd9N6Exjim3?=
 =?us-ascii?Q?Mvz3miZaSWsOmOtH07KfhWr20u4m3pBEfBFrbaz4pL1r+WVJcKNA2y/QyAzQ?=
 =?us-ascii?Q?2NL7nSxw2/o3/quBgLtk+qlUlEvgcNUtFP8C68mb4HF9pWDV2bi6P/iqlt2k?=
 =?us-ascii?Q?LOpEKIRIpPOz6fYoaRrMyU2YWB4tnCMqVQlFSnpyjKzwBwG17y0n1SIclcBH?=
 =?us-ascii?Q?irxveyPuc/YSoDksnISz1bYiZAuKDsLxJ6yxBjJ0UpPHHuxND7H9wqO9PJ4z?=
 =?us-ascii?Q?XQ6C1/17m3QIDx7NKZJqbWZMlppVwKa2h+Gp6b6cRY5mqQkENAtP1IuRnk+A?=
 =?us-ascii?Q?dUVDZQA420hA958qBf0E3o1CmQcCiJhMeG8JttwPoMAS2zCAB9vWpbyD20pP?=
 =?us-ascii?Q?VyUYngTNpKrCRyEsP1R8qkqNwg6tb/hATeWJj3g+urrnYA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FSEUfde7ZIcwPjAByr1ejBGb9AF2Bdr7+yue2HustpjdOLaNb165GwAdAmS8?=
 =?us-ascii?Q?559tKdmBySb6bqQm+K90MPwMT3AtoN4BQCwIwiobabpzyoXXEVHankENKINF?=
 =?us-ascii?Q?6Fa3PtCLfZ38gDnWSBHx4Dyvivr//wKjezUWlxD4WFuE/NXMq7Aq/4Eik16d?=
 =?us-ascii?Q?/7HdDMpS5nTo2VZLEqHeB9IQ8UWgmVMuxe7nViU2vQWYLdHjlgaIeN72k7/2?=
 =?us-ascii?Q?/5Ce8wyDD9CAzTBgS2EuEDoBLl8699g9PUWn++EE7cIwsoB/Y2CmQ0zMasmX?=
 =?us-ascii?Q?tMVsXWIRPwKKqiIn1tdyheUVOJIDVzPVMGeeSiIqT/61RamLKqyi2yom2Xjw?=
 =?us-ascii?Q?xYE2pgUNZXy8H/elkxqD0++7gbFgU2J6vGcpNkTGOCVWOOk8rrhCSkWwgnpD?=
 =?us-ascii?Q?Jrm2oqULcoBC8OoiVE8nse8V1Xk8IfVMOTzMmJtBoy9+U+01XpPEuayFO5xI?=
 =?us-ascii?Q?yOqUVCHRcmsn9KcEIpBSDmjtFtPcUN/KMfKKc31Ou7JGRyY6JOHRO/Ijc3eS?=
 =?us-ascii?Q?7VDM6fEa4O1JNIDGoBXdVyBzuLW8Q+KhjRRnZflBKv36tad2pM6fXsrGxODe?=
 =?us-ascii?Q?vl0t3yJKmcJRRxEkEd1Cgsj6ubXccCmRvbR487vvWkMsdyGGfSe73wykEz7N?=
 =?us-ascii?Q?lb4Vc+ZygGIlv8mh5OOnsdBnY1YXvwsPK+77d9NaYSrOt+Ui33SXKDMiSnrN?=
 =?us-ascii?Q?egIpVwSSsTRM8dMpiVBxgE6VSbvU53DT9rC9dUgsI+31dEiZvXxPycPmGMWd?=
 =?us-ascii?Q?88R2qDHfdInSWOpq8rtX8geR0r8Y/NN0nihHbkySFFKRVFmG8aAlY+WzkjZ0?=
 =?us-ascii?Q?7oOBvQPuAuYn9PDMA1pYvWJ8FvqK30/CIqmt5wjsqDYfDAAsHPd2mO8HU4yL?=
 =?us-ascii?Q?wwysoybDMnnDRVW996gXWmP2PdEzzHQ1WGLmhX0yOxNxHXHCyeMQQEBSzvP+?=
 =?us-ascii?Q?Dh2rovB4YQjg9nR/V9QKEi+/Sd8bwlxqKFXhv2R3Z7wtpeeK5YNmksIZ6Q3M?=
 =?us-ascii?Q?V6Cfjgs2LKs3mQbCLrUz1WWP1Z/uxiH2f4E7Y6HMHDoMCKKlFsLTWwy9T3Oj?=
 =?us-ascii?Q?GLeqR9RP+5AmK7ydeaKlfp7gFd78pVt54FUS6fTTm584UtpL9s3ytnAFaOep?=
 =?us-ascii?Q?PJW8q7x233Yrzc9LuS6NuxrA7xuDAZNzedJBNJ5ozwIaKLk0pZ54nGO9kIeK?=
 =?us-ascii?Q?OvVmPa82WoDxA5yoeQRhAFxncdYgSRYKJw726hn4OwzT4j0zc/CjIQ8KrxQk?=
 =?us-ascii?Q?bqjYjFbke9J8yxUAjJ0M3z44i3e4UwgvIgLFQy/VIE35v+KXMfMG2ma4U5mX?=
 =?us-ascii?Q?23QwzeitEZKH718IPPYstw6JgEyF7HZpPvMNUixIe8XYj/0YV4JdLz/g2+I8?=
 =?us-ascii?Q?bljIg8ouvKAiaepeovmAoJezbO8tS9heHaBkjRHF+HrR7P9II2MrjlUT8jm7?=
 =?us-ascii?Q?fOLWe/LqOatV0ocdh7ZH1QeCqMBu/WlIrTvCqVjgN9wA8gMP1tRtKA947t0c?=
 =?us-ascii?Q?NDLej0/AGMwegD3nSD7fLrut3Lk5c3fiH6VJvxGsGZq1dQKqovPqDT3z9Fq8?=
 =?us-ascii?Q?a9vhsy5ZJx2A8BdUaGUgdQAIcx9mDYyUITWrq9uP5GvZtAYzpSb5KzRkHADm?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e24477f3-562a-41ed-e15e-08dcb82ef904
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 04:51:46.6644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kpqiRdG26RUklMODLd254+YyRX/+Qdo+DUEotbUt4EktNfkJ0Y/zP+PWQVgz9lJuhzr90kxt6Z5GXh74sb1Rcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4827
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

On Thu, Aug 08, 2024 at 09:15:05PM -0700, Dixit, Ashutosh wrote:
> On Thu, 08 Aug 2024 16:19:30 -0700, Matthew Brost wrote:
> >
> 
> Hi Matt,
> 
> > On Thu, Aug 08, 2024 at 10:41:36AM -0700, Ashutosh Dixit wrote:
> > > Complete 'struct xe_oa_fence' to include the dma_fence used to signal
> > > output fences in the xe_sync array. The fences are signalled
> > > asynchronously. When there are no output fences to signal, the OA
> > > configuration wait is synchronously re-introduced into the ioctl.
> > >
> > > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_oa.c | 46 +++++++++++++++++++++++++++++++++++---
> > >  1 file changed, 43 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> > > index 416e031ac454b..bc421cd0af6ba 100644
> > > --- a/drivers/gpu/drm/xe/xe_oa.c
> > > +++ b/drivers/gpu/drm/xe/xe_oa.c
> > > @@ -96,6 +96,10 @@ struct xe_oa_config_bo {
> > >  };
> > >
> > >  struct xe_oa_fence {
> >
> > I don't think you need this at all.
> >
> > The fence from the job can directly be installed via
> > xe_sync_entry_signal between xe_sched_job_arm and
> > xe_sched_job_push.
> 
> I think I understand what you are saying here, that
> job->drm.s_fence->finished can be used to signal the output fences. But the
> complication in OA is that an additional delay is needed after the register
> programming batch has executed (see below where I point this out) before we
> signal the output fences. So the sequence is:
> 
> * Submit a register programming batch
> * Wait till this completes (signaled by the finished fence)
> * Wait for an additional delay
> * Now signal output fences after this delay (signal ofence->base)
> 
> So 'struct xe_oa_fence' is needed because of this additional
> delay. Otherwise I agree, we could just have used the finished fence.
> 

Thanks, this makes more sense now.

Waiting in system workers has been proven to be a bad idea so let's avoid that.

How about...

struct xe_oa_fence {
	struct dma_fence user_signal;
	/* No per fence spin lock, global OA one for user_signal */
	struct delayed_work worker_to_wait_for_delay;
	struct dma_fence_cb cb;
};

- Install user_signal in syncs
- Attach xe_oa_fence.cb to jobs fence
- xe_oa_fence.cb kicks xe_oa_fence.worker_to_wait_for_delay with required delay
- xe_oa_fence.worker_to_wait_for_delay signals xe_oa_fence.user_signal

> > Then before xe_sync_entry_cleanup check for !num_signal and directly
> > wait on the job's fence.
> 
> Here also, we never want to wait in the direct ioctl call, we always want
> to do the wait in the work item (so it has to be an asychronous wait).
> 

Here wait on xe_oa_fence.user_signal.

Matt

> >
> > Matt
> >
> > > +	/* @base: dma fence base */
> > > +	struct dma_fence base;
> > > +	/* @lock: lock for the fence */
> > > +	spinlock_t lock;
> > >	/* @xe: pointer to xe device */
> > >	struct xe_device *xe;
> > >	/* @work: work to signal that OA configuration is applied */
> > > @@ -953,9 +957,26 @@ static void xe_oa_fence_work_fn(struct work_struct *w)
> > >	/* Additional empirical delay needed for NOA programming after registers are written */
> > >	usleep_range(us, 2 * us);
> 
> This is the additional delay after which we signal output fences.
> 
> Please let me know if you agree with this or if there's another way to do
> this.
> 
> Thanks.
> --
> Ashutosh
> 
> 
> 
> > >
> > > -	kfree(ofence);
> > > +	/* Now signal fence to indicate new OA configuration is active */
> > > +	dma_fence_signal(&ofence->base);
> > > +	dma_fence_put(&ofence->base);
> > >  }
> > >
> > > +static const char *xe_oa_get_driver_name(struct dma_fence *fence)
> > > +{
> > > +	return "xe_oa";
> > > +}
> > > +
> > > +static const char *xe_oa_get_timeline_name(struct dma_fence *fence)
> > > +{
> > > +	return "unbound";
> > > +}
> > > +
> > > +static const struct dma_fence_ops xe_oa_fence_ops = {
> > > +	.get_driver_name = xe_oa_get_driver_name,
> > > +	.get_timeline_name = xe_oa_get_timeline_name,
> > > +};
> > > +
> > >  static struct xe_oa_fence *xe_oa_fence_init(struct xe_device *xe, struct dma_fence *config_fence)
> > >  {
> > >	struct xe_oa_fence *ofence;
> > > @@ -967,6 +988,8 @@ static struct xe_oa_fence *xe_oa_fence_init(struct xe_device *xe, struct dma_fen
> > >	ofence->xe = xe;
> > >	INIT_WORK(&ofence->work, xe_oa_fence_work_fn);
> > >	ofence->config_fence = config_fence;
> > > +	spin_lock_init(&ofence->lock);
> > > +	dma_fence_init(&ofence->base, &xe_oa_fence_ops, &ofence->lock, 0, 0);
> > >
> > >	return ofence;
> > >  }
> > > @@ -975,8 +998,8 @@ static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config
> > >  {
> > >	struct xe_oa_config_bo *oa_bo;
> > >	struct xe_oa_fence *ofence;
> > > +	int i, err, num_signal = 0;
> > >	struct dma_fence *fence;
> > > -	int err;
> > >
> > >	/* Emit OA configuration batch */
> > >	oa_bo = xe_oa_alloc_config_buffer(stream, config);
> > > @@ -989,13 +1012,30 @@ static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config
> > >	if (err)
> > >		goto exit;
> > >
> > > +	/* Initialize and set fence to signal */
> > >	ofence = xe_oa_fence_init(stream->oa->xe, fence);
> > >	if (IS_ERR(ofence)) {
> > >		err = PTR_ERR(ofence);
> > >		goto put_fence;
> > >	}
> > >
> > > -	xe_oa_fence_work_fn(&ofence->work);
> > > +	for (i = 0; i < stream->num_syncs; i++)
> > > +		xe_sync_entry_signal(&stream->syncs[i], &ofence->base);
> > > +
> > > +	/* Schedule work to signal the fence */
> > > +	queue_work(system_unbound_wq, &ofence->work);
> > > +
> > > +	/* If nothing needs to be signaled we wait synchronously */
> > > +	for (i = 0; i < stream->num_syncs; i++)
> > > +		if (stream->syncs[i].flags & DRM_XE_SYNC_FLAG_SIGNAL)
> > > +			num_signal++;
> > > +	if (!num_signal)
> > > +		flush_work(&ofence->work);
> > > +
> > > +	/* Done with syncs */
> > > +	for (i = 0; i < stream->num_syncs; i++)
> > > +		xe_sync_entry_cleanup(&stream->syncs[i]);
> > > +	kfree(stream->syncs);
> > >
> > >	return 0;
> > >  put_fence:
> > > --
> > > 2.41.0
> > >
