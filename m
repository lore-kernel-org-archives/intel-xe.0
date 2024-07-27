Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4D5C3DA4A
	for <intel-xe@archiver.kernel.org>; Sat, 27 Jul 2024 05:09:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B69610E07A;
	Sat, 27 Jul 2024 05:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jlt5LUd2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A61B210E07A
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Jul 2024 05:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722056959; x=1753592959;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Kb9jx+oebAbH0KJ5hvApEVuZEEbQc5pu/ewCqd0QOfA=;
 b=jlt5LUd21mUTrhOXl/21hiizcQFcKI7UOlTeJ0cjGMshFleq1pxCxVeZ
 ou2c18fHfckLZuup4Nk4CvuzNgWiK475cwOI2AqpbWK1MeSzfga0p1YGK
 W+xZhf7r1WA7J4eYnyjUwqnX7zLllmU3Iaxnpw3t7ls+rJ9sG9VwHXgWW
 F1Cst8qw2pohmow4nghSHFCRscze6ShPiK/nGlsLtMXQklS0n6CWd/CNO
 g5Zh56bN7zG/cRfozzhehtir9W375sRoHAW2/WSgyxBLBFmPpx2clWpde
 onHvx5cPNP1FD/lEJp7FzeoJr7TME3MJiCuYUccCHc8XqE2R1s/m0ePjA Q==;
X-CSE-ConnectionGUID: IHjhupW7QB6t/PRhawFGcw==
X-CSE-MsgGUID: bg8lE66nTpGZA5v8HdOGbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="30518240"
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="30518240"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 22:09:18 -0700
X-CSE-ConnectionGUID: 6iulETTPTaeamzkPFqBHtQ==
X-CSE-MsgGUID: KpHvkvZpQQe+gyJfdGPnlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="53119248"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 22:09:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 22:09:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 22:09:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 22:09:17 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 22:09:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CllMcA57sUFIKMIY40UaSITEwoxyRLsE4vDsYbrB0bYigmD65fO94aEYWn5nz3lZj75yZkjfv+2FLurtPcPz8zC4eXK8wTCIKmKnanL8AyoWFI3N9npboLIsl7pbDuS6rWfI4+1/Cc6c2orK0AtRHu3loO/DgMHs2V9K6Amlq97M+E75Md/LPRuJuNkFd9tTHoTmraP5ho3CzHQ3BPwTCfXRwGVoCHBO70GVjITDaG6YOOfdjRVzFS1ss280Q3eYJAde4bH0y07eDcYHx6C9YL/T0Brm94ykZdQEBDftT1tAD84vCfiZI8pAw6onYYuQ7UcI6A+tzsEOPMOL288KJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QnC6ZUGQTMnv9IWwIS+HP2rxCiy31mC3/PwC4SnYhHM=;
 b=IZEBzZX7eMk8OOYbaD2s9+QdauSL9xGp/8pzl+7oRT3sHli/RkVXtsK/D2ifQdtLkFICwNPoQCehRwr+XSNvQngrOdddnprrydaP7JIu4+qkVcT524q6usI7+dTq7s8iWy6nljsHk44fHGAE/L70aDA+PKFDiyWFTgYxROXMI34X5O8Vy7cv1e8wNIw+jm1oFitbtdxlp3b0Nf9IlLLoa3bIFyzD67AfAAy39ZYB9u4jnDBLeRbQKoCCgfL7ScFwMsjCMGul1Bme8gF6g6YGtH67K8Atc8MQCBrth2lgmvCL3SIpOkAioBQlLKYXUlUbQOIud2Idadi4jGhf07jBDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB7519.namprd11.prod.outlook.com (2603:10b6:a03:4c0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.32; Sat, 27 Jul
 2024 05:09:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7784.020; Sat, 27 Jul 2024
 05:09:13 +0000
Date: Sat, 27 Jul 2024 05:08:02 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Dominik Grzegorzek
 <dominik.grzegorzek@intel.com>, Christoph Manszewski
 <christoph.manszewski@intel.com>, Maciej Patelczyk
 <maciej.patelczyk@intel.com>
Subject: Re: [PATCH 10/21] drm/xe/eudebug: Introduce per device attention
 scan worker
Message-ID: <ZqSAsu1LYQkD/+TC@DUT025-TGLU.fm.intel.com>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
 <20240726140818.54304-11-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240726140818.54304-11-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: BYAPR11CA0089.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB7519:EE_
X-MS-Office365-Filtering-Correlation-Id: d4da7640-64c4-4d3b-46c9-08dcadfa41b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?RF5WA8eTAzMs/UwG9WCWpQhg2JLTf8tf8HWcQkImsedteBNK0TWYUJ/PFU?=
 =?iso-8859-1?Q?OG8ujia4OwqOsXttGIgxOvvD7sPWVrU1OQhGPg9QpJoPwBHdS4jD8zsgb/?=
 =?iso-8859-1?Q?qGHPEQBpAjqDK0J9ny0ZvrdUBVEmpY5APtX6QtVshh6D7BOqri6LK/7Fs5?=
 =?iso-8859-1?Q?B71W5vJsxkMWpS24zwztWc8uRopkNhAbugsrf/UMU7bEJI0O6T0eo0z2KZ?=
 =?iso-8859-1?Q?YFH74YgBQIuMcnVz95I3eaE81WXXjNO7GrnVcUiG5xGWAEbmv8qDdCTP9d?=
 =?iso-8859-1?Q?wiAO7mTaRlJFk9GiUH7DynmLJIlpsqzM9M75Bmp8uBbUulgZm9Qp2cong0?=
 =?iso-8859-1?Q?ZB3dP7SSamtJwjqx38183RH0S+Nd+7QQ6KU5S8TFcrCVZxFg+ysbnDsiIU?=
 =?iso-8859-1?Q?yH6WNE+12j4ljgVIm8bdsDIfeWTs5RL8C/EWExUCzMl+h3zehS/R0xfSX7?=
 =?iso-8859-1?Q?QcxipzJEH7S04h5B1o5vgFbVUZ8LPHm60VnrrhsiID5ZUGASSOJ28Hz2FP?=
 =?iso-8859-1?Q?eonL0VtV1x/0ZgCtxCZybR6HtLHWzZ84X2WO/TU12loWqxxjVl7lnTPcRS?=
 =?iso-8859-1?Q?OJUc1SNycaluyugDsGZUn4HB5QZmbZBICLLpd/NkM9T8//2iaL5kKXta7s?=
 =?iso-8859-1?Q?v/Kj/JyzVD2xmLYAYlwFnqp07dG7U+87/XhEKLParJZzuQbWCXgIKLPQXK?=
 =?iso-8859-1?Q?4DSlAIJkxbm6//qjF8f0IuYDiYG3oSDeUl/dyMZlk2b7vpCyKjIH+ugAhJ?=
 =?iso-8859-1?Q?yeUk07mopgUmKAHhXxscMWdjDvbmenduT9rzl7FtJQLh3TghPNZrUop1+G?=
 =?iso-8859-1?Q?aW2wVVJjWt6ra6TtzWWb7VsLPWWMBW+kUyc9ot+cKVuhS+HflxCYxsAzHm?=
 =?iso-8859-1?Q?qEf0Kh9iTxYpcKBcJp1fDzBjxRTzeV3CqfU5icHwRc0MTK7r2NmgwjhRtw?=
 =?iso-8859-1?Q?wVMxy2scEANx6X3GLK3LKpnW1v2dO1nAFpdUVICks2Hzl8OxG7iQmuR+XI?=
 =?iso-8859-1?Q?OOkYzr38y4NdU9lYiZg89k0ghJs0jOcHJx2OYgwsl/MeGt2tLxDgXhFkts?=
 =?iso-8859-1?Q?UM8HbCPxPUeVdkhDJRD16L8qDLx6oyHLWCvK08107eK5/3MCm5hQsd9eDv?=
 =?iso-8859-1?Q?GAM8DlUaSnv67PZU9HZMydOy/ENhl4qvpKBKZfmRjxenl7qBxDEf3T5vsK?=
 =?iso-8859-1?Q?4io5FbwKqPUfkhYUvFx3Cj2ST0UZnPOJjjpz+N/bnA7ClTR0vbaYOm7Vtq?=
 =?iso-8859-1?Q?bGUj8Pw4fC9TO3k+HNHxpe4WVEktuUw3fG/ZHr666VgGYhW3EYGJrg5TAt?=
 =?iso-8859-1?Q?5LaLHLrvfRBl2mYGWIETErLmcNQ27uwTDygJmLX7cARv+34=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?XeIg55MEvs9lCNEui2FxjDTXs9RmFU034JN0QInNOnwEQgLHhprWC4dGuo?=
 =?iso-8859-1?Q?Kxun8fLql4NN6OM6ZVjFTr44A6JycmkSZzXbrCAMbXoFe5j6Yf8EVk+dcM?=
 =?iso-8859-1?Q?sqhdYYtswFo+YYd80AjQ0vkhV3Vu/BmtvjafEOxNRQ060EAnef/WtXCO+1?=
 =?iso-8859-1?Q?z5Qs85cN4Es9Irb9cl+1YTFNzMzUE/xKa9aRTJkZ94Yr/KvsxYdBaECqtK?=
 =?iso-8859-1?Q?IysyjzY4czkzAN2cOuHaUpeuCzOwkgT6ZyJxUUq02n3tbKb+XkV5ojfSPS?=
 =?iso-8859-1?Q?WX0BA5J4peiPLo/BXcRl59Vd1m6VDcxhicJMYPpdkVy70majWp4k36k7ed?=
 =?iso-8859-1?Q?0QjoJxCLGOgAdOjbs2IyAoF9C0scrbgwL0sU910RipRFh8yYXDSYz/6saC?=
 =?iso-8859-1?Q?rrSrxHQ/+xHz5jvahQg6ox74gVPnS27xNOZrdzvR9ynolunWaXpcu9ky/L?=
 =?iso-8859-1?Q?Au7FvRT0WVG5ChHC4wNm0CtI98I5gMN3JRilWdx+hfDSingUMuwKKBhG4Y?=
 =?iso-8859-1?Q?14eZ1eYzZhmoa1GkTt4iPjIWtzcM0fz1bsmAOmQFllnt4XuOrYzvwrXten?=
 =?iso-8859-1?Q?LMx19YWWz92ODZmsjfhjroRIiryplR7e6sSFOURO6KRGoXk1oDBtMvIiNQ?=
 =?iso-8859-1?Q?FRgubkjB9PnRLxK5MY1/W6zlsvIURo3hfeqDunn2CLsg7vjcxBesilFtot?=
 =?iso-8859-1?Q?XJRczrrnTQmNWRWsImGUoxxsdHK4ZLrVPiGxGA98pshaa0hLxtmcgqvJDw?=
 =?iso-8859-1?Q?X/A4ZBkWsGOO/QNAXdezl9sShsY7XBD0yVQplN1nH2fAxHtjIo0nVozkoN?=
 =?iso-8859-1?Q?ge1vGDJlZI6o/8ZOEtbExgDgquaxGYYT82lqYjUsgEUDKCvNnzsOzVXU6n?=
 =?iso-8859-1?Q?6UF2+AM7cZU/IQC2FbwnjGTids7DlbHJ+K8Rh+HESIHlfVYjbaC0JjdbBT?=
 =?iso-8859-1?Q?QHrMb5UUV8ITbxmCQ4f3VVMayww/GxvPJKy3G5nqAK6AfYsnyQnNNQSYYJ?=
 =?iso-8859-1?Q?3MFNeMKhojRLe907WEWqx42ukyiNmTzVRSsMlkSaaGCgR/Csx+e7yvc8bk?=
 =?iso-8859-1?Q?axcsG9Rw6d1T/ld+2oaLNlsdFooOd4UVcg9Fm9eq7H0ORhqyn6bkbiHac0?=
 =?iso-8859-1?Q?SwNT5LbA3Qcp0KoVH7AjHFqtskIWJy62NAUP8pm39Xgw0QN7xFEk6PZdqm?=
 =?iso-8859-1?Q?scoB1lksdicqsil5YOWs6rK8OhqH7CqFYl3WxUJ3w8NT2hHto9ik67VGsD?=
 =?iso-8859-1?Q?HYUfhMbTQXfjhXLXoFpHu+tl7YUlnaRVUmhzMH99FWePhKW7XxUSAASqNF?=
 =?iso-8859-1?Q?0KoAqQoV+pie39rDwlwkUnRAsbYPowGdOIldpcSA3x9SSVu5C6WI3btHY2?=
 =?iso-8859-1?Q?h1qqdAp9xX9X8KhtOMM84rTJNrXTfePrsx1ASnMubtTJBByIiOcda5x8PB?=
 =?iso-8859-1?Q?9ydHP8rff+P/m5G54/qEUSmbuRWucETduZaKnEQOCcWYfsPeJu70KOqWuo?=
 =?iso-8859-1?Q?KaMNeUdoIqVpiGaE8VDAUWlPpcr6WvDHE6HzIxErAZvTra2SEFtyWiXqar?=
 =?iso-8859-1?Q?VYAxgKQ/+I3ncgXGioHG4ZSI+4/ADVrS6kCR3bZpudGFCV6tsQH6UbjdVG?=
 =?iso-8859-1?Q?nWcbdbRms1EdGogK+BRkOqhUecDmBPrsdaCmCagE5ZcwDlb6c85pBUwA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4da7640-64c4-4d3b-46c9-08dcadfa41b3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2024 05:09:13.7099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKOjYbJwclfG9A72Lj1WQWjY2DWiosr1/84kJAF4sBEzu+te7ke8giFCDR6Q4xlG6Y1f6aCEIMnIb/tnMlxcZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7519
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

On Fri, Jul 26, 2024 at 05:08:07PM +0300, Mika Kuoppala wrote:
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> 
> Scan for EU debugging attention bits periodically to detect if some EU
> thread has entered the system routine (SIP) due to EU thread exception.
> 
> Make the scanning interval 10 times slower when there is no debugger
> connection open. Send attention event whenever we see attention with
> debugger presence. If there is no debugger connection active - reset.
> 
> Based on work by authors and other folks who were part of attentions in
> i915.
> 
> - v2 Do not validate potentially active hwe against engine->hwe.
>   Whenever the engine has width > 1, this field contains only the first
>   hwe of the class.
> - squash dss walking and semaphore to mutex
> - v3 error path fix in xe_send_gt_attention (Christoph)
> - v4 runalone active fix (Mika)
> - v5 q->lrc changes (Mika)
> - v6 Use C99 flexible arrays (Maciej, checkpatch)
>      function with 'for_each' in name (Maciej, checkpatch)
> - v7 long running active fix (Dominik)
> - v8 resource handling errors rebase (Mika)
> - v9 find out lrc handles first before sending event (Mika)
> - v10 adjust runalone shift according to hw
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile              |   1 +
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |   3 +
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h     |   7 +
>  drivers/gpu/drm/xe/xe_device.c           |   2 +
>  drivers/gpu/drm/xe/xe_device_types.h     |   3 +
>  drivers/gpu/drm/xe/xe_eudebug.c          | 389 ++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_eudebug.h          |   1 +
>  drivers/gpu/drm/xe/xe_eudebug_types.h    |  32 ++
>  drivers/gpu/drm/xe/xe_gt_debug.c         | 152 +++++++++
>  drivers/gpu/drm/xe/xe_gt_debug.h         |  21 ++
>  include/uapi/drm/xe_drm_eudebug.h        |  15 +-
>  11 files changed, 624 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_debug.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_debug.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 06badc5f99af..b7b6b047c02c 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -49,6 +49,7 @@ xe-y += xe_bb.o \
>  	xe_gt_debugfs.o \
>  	xe_gt_freq.o \
>  	xe_gt_idle.o \
> +	xe_gt_debug.o \
>  	xe_gt_mcr.o \
>  	xe_gt_pagefault.o \
>  	xe_gt_sysfs.o \
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 764c270599d0..b9d713a2061d 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -132,6 +132,9 @@
>  #define RING_EXECLIST_STATUS_LO(base)		XE_REG((base) + 0x234)
>  #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) + 0x234 + 4)
>  
> +#define RING_CURRENT_LRCA(base)			XE_REG((base) + 0x240)
> +#define   CURRENT_LRCA_VALID			REG_BIT(0)
> +
>  #define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244, XE_REG_OPTION_MASKED)
>  #define	  CTX_CTRL_OAC_CONTEXT_ENABLE		REG_BIT(8)
>  #define	  CTX_CTRL_RUN_ALONE			REG_BIT(7)
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 96a59a96dd4c..03e83ce3e35d 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -437,6 +437,8 @@
>  #define   DISABLE_ECC				REG_BIT(5)
>  #define   ENABLE_PREFETCH_INTO_IC		REG_BIT(3)
>  
> +#define TD_ATT(x)				XE_REG_MCR(0xe470 + (x) * 4)
> +
>  #define ROW_CHICKEN4				XE_REG_MCR(0xe48c, XE_REG_OPTION_MASKED)
>  #define   DISABLE_GRF_CLEAR			REG_BIT(13)
>  #define   XEHP_DIS_BBL_SYSPIPE			REG_BIT(11)
> @@ -516,6 +518,11 @@
>  #define   CCS_MODE_CSLICE(cslice, ccs) \
>  	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
>  
> +#define RCU_DEBUG_1				XE_REG(0x14a00)
> +#define   RCU_DEBUG_1_ENGINE_STATUS		REG_GENMASK(2, 0)
> +#define   RCU_DEBUG_1_RUNALONE_ACTIVE		REG_BIT(2)
> +#define   RCU_DEBUG_1_CONTEXT_ACTIVE		REG_BIT(0)
> +
>  #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
>  
>  /* Applicable for all FORCEWAKE_DOMAIN and FORCEWAKE_ACK_DOMAIN regs */
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 90bb0a8b1881..ba1c80089906 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -768,6 +768,8 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_debugfs_register(xe);
>  
> +	xe_eudebug_init_late(xe);
> +
>  	xe_hwmon_register(xe);
>  
>  	for_each_gt(gt, xe, id)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 4dcfd39cb909..3b33add576be 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -516,6 +516,9 @@ struct xe_device {
>  
>  		/** @ordered_wq: used to discovery */
>  		struct workqueue_struct *ordered_wq;
> +
> +		/** @attention_scan: attention scan worker */
> +		struct delayed_work attention_scan;
>  	} eudebug;
>  
>  	/* private: */
> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
> index 9611acedeee9..c2de001cc33a 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug.c
> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
> @@ -11,19 +11,29 @@
>  
>  #include <drm/drm_managed.h>
>  
> -#include "regs/xe_gt_regs.h"
>  #include "regs/xe_engine_regs.h"
> +#include "regs/xe_gt_regs.h"
>  #include "xe_device.h"
>  #include "xe_assert.h"
>  #include "xe_macros.h"
>  #include "xe_gt.h"
> +#include "xe_gt_debug.h"
> +#include "xe_lrc.h"
> +#include "xe_hw_engine.h"
> +#include "xe_exec_queue.h"
>  #include "xe_eudebug_types.h"
>  #include "xe_eudebug.h"
>  #include "xe_exec_queue_types.h"
> +#include "xe_guc_exec_queue_types.h"
> +#include "xe_execlist_types.h"
> +#include "xe_mmio.h"
>  #include "xe_module.h"
> +#include "xe_pm.h"
>  #include "xe_rtp.h"
> +#include "xe_sched_job.h"
>  #include "xe_vm.h"
>  #include "xe_wa.h"
> +#include "xe_force_wake.h"
>  
>  /*
>   * If there is no detected event read by userspace, during this period, assume
> @@ -843,6 +853,371 @@ static const struct file_operations fops = {
>  	.unlocked_ioctl	= xe_eudebug_ioctl,
>  };
>  
> +static bool queue_has_active_job(struct xe_exec_queue *q)

This should probably be a generic function in xe_exec_queue.c. We seemly
already have one - xe_exec_queue_is_idle.

> +{
> +
> +	struct drm_gpu_scheduler *sched;
> +	struct drm_sched_job *drm_job;
> +
> +	if (xe_device_uc_enabled(gt_to_xe(q->gt)))

General comment, we likely don't want to the EU debugger enabled unless
GuC submission is enabled as the execlist backend really doesn't work. 

> +		sched = &q->guc->sched.base;
> +	else
> +		sched = &q->execlist->sched;
> +
> +	drm_job = list_first_entry_or_null(&sched->pending_list, struct drm_sched_job, list);

Random musing that don't apply as we have xe_exec_queue_is_idle but...

You need a scheduler lock here which is missing. If you wanted to see
the scheduler pending list was not empty, we'd call into the drm
scheduler layer.

That being said, I think the EU debugger only support LR VMs? If so,
then this always going to be empty.

> +
> +	if (drm_job) {
> +		struct xe_sched_job *job = to_xe_sched_job(drm_job);
> +
> +		return xe_sched_job_started(job) && !xe_sched_job_completed(job);
> +	} else if (xe_exec_queue_is_lr(q) &&
> +		   (xe_lrc_ring_head(q->lrc[0]) != xe_lrc_ring_tail(q->lrc[0]))) {
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +static int current_lrc(struct xe_hw_engine *hwe, u32 *lrc_hw)
> +{
> +	u32 lrc_reg;
> +	int err;
> +
> +	err = xe_force_wake_get(gt_to_fw(hwe->gt), hwe->domain);
> +	if (err)
> +		return err;
> +
> +	lrc_reg = hw_engine_mmio_read32(hwe, RING_CURRENT_LRCA(0));
> +
> +	xe_force_wake_put(gt_to_fw(hwe->gt), hwe->domain);
> +
> +	if (!(lrc_reg & CURRENT_LRCA_VALID))
> +		return -ENOENT;
> +
> +	*lrc_hw = lrc_reg & GENMASK(31, 12);
> +
> +	return 0;
> +}
> +
> +static int match_engine_lrc(struct xe_exec_queue *q, u32 lrc_hw)
> +{
> +	int i;
> +	u32 lrc_ggtt;
> +
> +	for (i = 0; i < q->width; i++) {
> +		lrc_ggtt = lower_32_bits(xe_lrc_descriptor(q->lrc[i]));
> +		lrc_ggtt &= GENMASK(31, 12);
> +		if (lrc_ggtt == lrc_hw)
> +			return i;
> +	}
> +
> +	return -1;
> +}
> +
> +static u32 engine_status(const struct xe_hw_engine * const hwe,
> +			 u32 rcu_debug1)
> +{
> +	const bool xe1 = GRAPHICS_VER(gt_to_xe(hwe->gt)) < 20;
> +	unsigned int shift;
> +
> +	if (hwe->class == XE_ENGINE_CLASS_RENDER) {
> +		shift = 7;
> +		XE_WARN_ON(hwe->instance != 0);
> +	} else if (hwe->class == XE_ENGINE_CLASS_COMPUTE) {
> +		XE_WARN_ON(hwe->instance > 3);
> +
> +		if (xe1)
> +			shift = 10 + (hwe->instance * 3);
> +		else
> +			shift = 11 + (hwe->instance * 4);
> +	} else {
> +		XE_WARN_ON(hwe->class);
> +		return 0;
> +	}
> +
> +	return (rcu_debug1 >> shift) & RCU_DEBUG_1_ENGINE_STATUS;
> +}
> +
> +static bool engine_runalone_set(const struct xe_hw_engine * const hwe,
> +				   u32 rcu_debug1)
> +{
> +	return engine_status(hwe, rcu_debug1) & RCU_DEBUG_1_RUNALONE_ACTIVE;
> +}
> +
> +static bool engine_context_set(const struct xe_hw_engine * const hwe,
> +			       u32 rcu_debug1)
> +{
> +	return engine_status(hwe, rcu_debug1) & RCU_DEBUG_1_CONTEXT_ACTIVE;
> +}
> +
> +static bool engine_has_runalone(const struct xe_hw_engine * const hwe)
> +{
> +	return hwe->class == XE_ENGINE_CLASS_RENDER ||
> +		hwe->class == XE_ENGINE_CLASS_COMPUTE;
> +}
> +
> +static struct xe_hw_engine *get_runalone_active_hw_engine(struct xe_gt *gt)
> +{
> +	struct xe_hw_engine *hwe, *first = NULL;
> +	unsigned int num_active, id;
> +	u32 val;
> +
> +	if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT)) {
> +		drm_dbg(&gt_to_xe(gt)->drm, "eudbg: runalone failed to get force wake\n");
> +		return NULL;
> +	}
> +
> +	val = xe_mmio_read32(gt, RCU_DEBUG_1);
> +	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +
> +	drm_dbg(&gt_to_xe(gt)->drm, "eudbg: runalone RCU_DEBUG_1 = 0x%08x\n", val);
> +
> +	num_active = 0;
> +	for_each_hw_engine(hwe, gt, id) {
> +		bool runalone, ctx;
> +
> +		if (!engine_has_runalone(hwe))
> +			continue;
> +
> +		runalone = engine_runalone_set(hwe, val);
> +		ctx = engine_context_set(hwe, val);
> +
> +		drm_dbg(&gt_to_xe(gt)->drm, "eudbg: engine %s: runalone=%s, context=%s",
> +			hwe->name, runalone ? "active" : "inactive",
> +			ctx ? "active" : "inactive");
> +
> +		/*
> +		 * On earlier gen12 the context status seems to be idle when
> +		 * it has raised attention. We have to omit the active bit.
> +		 */
> +		if (IS_DGFX(gt_to_xe(gt)))
> +			ctx = true;
> +
> +		if (runalone && ctx) {
> +			num_active++;
> +
> +			drm_dbg(&gt_to_xe(gt)->drm, "eudbg: runalone engine %s %s",
> +				hwe->name, first ? "selected" : "found");
> +			if (!first)
> +				first = hwe;
> +		}
> +	}
> +
> +	if (num_active > 1)
> +		drm_err(&gt_to_xe(gt)->drm, "eudbg: %d runalone engines active!",
> +			num_active);
> +
> +	return first;
> +}
> +
> +static struct xe_exec_queue *runalone_active_queue_get(struct xe_gt *gt, int *lrc_idx)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_exec_queue *q, *found = NULL;
> +	struct xe_hw_engine *active;
> +	struct xe_file *xef, *tmp;
> +	unsigned long i;
> +	int idx, err;
> +	u32 lrc_hw;
> +
> +	active = get_runalone_active_hw_engine(gt);
> +	if (!active) {
> +		drm_dbg(&gt_to_xe(gt)->drm, "Runalone engine not found!");
> +		return ERR_PTR(-ENOENT);
> +	}
> +
> +	err = current_lrc(active, &lrc_hw);
> +	if (err)
> +		return ERR_PTR(err);
> +
> +	mutex_lock(&xe->files.lock);
> +	list_for_each_entry_safe(xef, tmp, &xe->files.list, link) {
> +		mutex_lock(&xef->exec_queue.lock);
> +		xa_for_each(&xef->exec_queue.xa, i, q) {

Same comment here as [1]. Don't hold xe->files.lock or
xef->exec_queue.lock for anything but the lookup. Holding locks longer
than needed creates unwanted lock dep chains which creates all sorts of
problems. The only time chains should exist is when we have well defined
locking chain like we have for a VM (vm->lock -> dma-resv -> notifier
lock).

So this should look something like this:

mutex_lock(&xe->files.lock);
xa_for_each(.., xef) {
	xe_file_get(xef);
	mutex_unlock(&xe->files.lock);

	mutex_lock(&xef->exec_queue.lock);
	xa_for_each(&xef->exec_queue.xa, i, q) {
		xe_exec_queue_get(q);
		mutex_unlock(&xef->exec_queue.lock);

		/* Do something */
	
		xe_exec_queue_put(q);
		mutex_lock(&xef->exec_queue.lock);
	}
	mutex_unlock(&xef->exec_queue.lock);
	
	xe_file_put(xef);
	mutex_lock(&xe->files.lock);
}
mutex_unlock(&xe->files.lock);

Note you will need to change xe->files.list to an xarray to make this
safe too.

Matt

[1] https://patchwork.freedesktop.org/patch/606052/?series=136572&rev=1

> +			if (q->gt != gt)
> +				continue;
> +
> +			if (q->class != active->class)
> +				continue;
> +
> +			if (!queue_has_active_job(q))
> +				continue;
> +
> +			idx = match_engine_lrc(q, lrc_hw);
> +			if (idx < 0)
> +				continue;
> +
> +			xe_exec_queue_get(q);
> +			found = q;
> +
> +			if (lrc_idx)
> +				*lrc_idx = idx;
> +
> +			break;
> +		}
> +		mutex_unlock(&xef->exec_queue.lock);
> +
> +		if (found)
> +			break;
> +	}
> +	mutex_unlock(&xe->files.lock);
> +
> +	if (!found)
> +		return ERR_PTR(-ENOENT);
> +
> +	if (XE_WARN_ON(current_lrc(active, &lrc_hw)) &&
> +	    XE_WARN_ON(match_engine_lrc(found, lrc_hw) < 0)) {
> +		xe_exec_queue_put(found);
> +		return ERR_PTR(-ENOENT);
> +	}
> +
> +	return found;
> +}
> +
> +static int send_attention_event(struct xe_eudebug *d, struct xe_exec_queue *q, int lrc_idx)
> +{
> +	struct xe_eudebug_event_eu_attention *ea;
> +	struct xe_eudebug_event *event;
> +	int h_c, h_queue, h_lrc;
> +	u32 size = xe_gt_eu_attention_bitmap_size(q->gt);
> +	u32 sz = struct_size(ea, bitmask, size);
> +	int ret;
> +
> +	XE_WARN_ON(lrc_idx < 0 || lrc_idx >= q->width);
> +
> +	h_c = find_handle(d->res, XE_EUDEBUG_RES_TYPE_CLIENT, q->vm->xef);
> +	if (h_c < 0)
> +		return h_c;
> +
> +	h_queue = find_handle(d->res, XE_EUDEBUG_RES_TYPE_EXEC_QUEUE, q);
> +	if (h_queue < 0)
> +		return h_queue;
> +
> +	h_lrc = find_handle(d->res, XE_EUDEBUG_RES_TYPE_LRC, q->lrc[lrc_idx]);
> +	if (h_lrc < 0)
> +		return h_lrc;
> +
> +	event = __xe_eudebug_create_event(d, 0, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
> +					  DRM_XE_EUDEBUG_EVENT_STATE_CHANGE, sz, GFP_KERNEL);
> +
> +	if (!event)
> +		return -ENOSPC;
> +
> +	ea = cast_event(ea, event);
> +	write_member(struct drm_xe_eudebug_event_eu_attention, ea, client_handle, (u64)h_c);
> +	write_member(struct drm_xe_eudebug_event_eu_attention, ea, exec_queue_handle, (u64)h_queue);
> +	write_member(struct drm_xe_eudebug_event_eu_attention, ea, lrc_handle, (u64)h_lrc);
> +	write_member(struct drm_xe_eudebug_event_eu_attention, ea, bitmask_size, size);
> +
> +	mutex_lock(&d->eu_lock);
> +	event->seqno = atomic_long_inc_return(&d->events.seqno);
> +	ret = xe_gt_eu_attention_bitmap(q->gt, &ea->bitmask[0], ea->bitmask_size);
> +	mutex_unlock(&d->eu_lock);
> +
> +	if (ret)
> +		return ret;
> +
> +	return xe_eudebug_queue_event(d, event);
> +}
> +
> +
> +static int xe_send_gt_attention(struct xe_gt *gt)
> +{
> +	struct xe_eudebug *d;
> +	struct xe_exec_queue *q;
> +	int ret, lrc_idx;
> +
> +	if (list_empty_careful(&gt_to_xe(gt)->eudebug.list))
> +		return -ENOTCONN;
> +
> +	q = runalone_active_queue_get(gt, &lrc_idx);
> +	if (IS_ERR(q))
> +		return PTR_ERR(q);
> +
> +	d = xe_eudebug_get(q->vm->xef);
> +	if (!d) {
> +		ret = -ENOTCONN;
> +		goto err_exec_queue_put;
> +	}
> +
> +	if (!completion_done(&d->discovery)) {
> +		eu_dbg(d, "discovery not yet done\n");
> +		ret = -EBUSY;
> +		goto err_eudebug_put;
> +	}
> +
> +	ret = send_attention_event(d, q, lrc_idx);
> +	if (ret)
> +		xe_eudebug_disconnect(d, ret);
> +
> +err_eudebug_put:
> +	xe_eudebug_put(d);
> +err_exec_queue_put:
> +	xe_exec_queue_put(q);
> +
> +	return ret;
> +}
> +
> +static int xe_eudebug_handle_gt_attention(struct xe_gt *gt)
> +{
> +	int ret;
> +
> +	ret = xe_gt_eu_threads_needing_attention(gt);
> +	if (ret <= 0)
> +		return ret;
> +
> +	ret = xe_send_gt_attention(gt);
> +
> +	/* Discovery in progress, fake it */
> +	if (ret == -EBUSY)
> +		return 0;
> +
> +	return ret;
> +}
> +
> +#define XE_EUDEBUG_ATTENTION_INTERVAL 100
> +static void attention_scan_fn(struct work_struct *work)
> +{
> +	struct xe_device *xe = container_of(work, typeof(*xe), eudebug.attention_scan.work);
> +	long delay = msecs_to_jiffies(XE_EUDEBUG_ATTENTION_INTERVAL);
> +	struct xe_gt *gt;
> +	u8 gt_id;
> +
> +	if (list_empty_careful(&xe->eudebug.list))
> +		delay *= 10;
> +
> +	if (delay >= HZ)
> +		delay = round_jiffies_up_relative(delay);
> +
> +	if (pm_runtime_active(xe->drm.dev)) {
> +		for_each_gt(gt, xe, gt_id) {
> +			int ret;
> +
> +			ret = xe_eudebug_handle_gt_attention(gt);
> +			if (ret) {
> +				// TODO: error capture
> +				drm_info(&gt_to_xe(gt)->drm,
> +					 "gt:%d unable to handle eu attention ret=%d\n",
> +					 gt_id, ret);
> +
> +				xe_gt_reset_async(gt);
> +			}
> +		}
> +	}
> +
> +	schedule_delayed_work(&xe->eudebug.attention_scan, delay);
> +}
> +
> +static void attention_scan_cancel(struct xe_device *xe)
> +{
> +	cancel_delayed_work_sync(&xe->eudebug.attention_scan);
> +}
> +
> +static void attention_scan_flush(struct xe_device *xe)
> +{
> +	mod_delayed_work(system_wq, &xe->eudebug.attention_scan, 0);
> +}
> +
>  static void discovery_work_fn(struct work_struct *work);
>  
>  static int
> @@ -877,6 +1252,7 @@ xe_eudebug_connect(struct xe_device *xe,
>  
>  	kref_init(&d->ref);
>  	spin_lock_init(&d->connection.lock);
> +	mutex_init(&d->eu_lock);
>  	init_waitqueue_head(&d->events.write_done);
>  	init_waitqueue_head(&d->events.read_done);
>  	init_completion(&d->discovery);
> @@ -903,6 +1279,7 @@ xe_eudebug_connect(struct xe_device *xe,
>  
>  	kref_get(&d->ref);
>  	queue_work(xe->eudebug.ordered_wq, &d->discovery_work);
> +	attention_scan_flush(xe);
>  
>  	eu_dbg(d, "connected session %lld", d->session);
>  
> @@ -979,12 +1356,22 @@ void xe_eudebug_init(struct xe_device *xe)
>  {
>  	spin_lock_init(&xe->eudebug.lock);
>  	INIT_LIST_HEAD(&xe->eudebug.list);
> +	INIT_DELAYED_WORK(&xe->eudebug.attention_scan, attention_scan_fn);
>  
>  	xe->eudebug.available = true;
>  }
>  
> +void xe_eudebug_init_late(struct xe_device *xe)
> +{
> +	if (!xe->eudebug.available)
> +		return;
> +
> +	attention_scan_flush(xe);
> +}
> +
>  void xe_eudebug_fini(struct xe_device *xe)
>  {
> +	attention_scan_cancel(xe);
>  	xe_assert(xe, list_empty_careful(&xe->eudebug.list));
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
> index ac89a3d1ee1d..1e233c4683d6 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug.h
> +++ b/drivers/gpu/drm/xe/xe_eudebug.h
> @@ -18,6 +18,7 @@ int xe_eudebug_connect_ioctl(struct drm_device *dev,
>  			     struct drm_file *file);
>  
>  void xe_eudebug_init(struct xe_device *xe);
> +void xe_eudebug_init_late(struct xe_device *xe);
>  void xe_eudebug_fini(struct xe_device *xe);
>  void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe);
>  
> diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
> index 6e3c23023933..16667b4dfe45 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug_types.h
> +++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
> @@ -105,6 +105,9 @@ struct xe_eudebug {
>  	/** @discovery_work: worker to discover resources for target_task */
>  	struct work_struct discovery_work;
>  
> +	/** eu_lock: guards operations on eus (eu thread control and attention) */
> +	struct mutex eu_lock;
> +
>  	/** @events: kfifo queue of to-be-delivered events */
>  	struct {
>  		/** @lock: guards access to fifo */
> @@ -202,4 +205,33 @@ struct xe_eudebug_event_exec_queue {
>  	u64 lrc_handle[];
>  };
>  
> +/**
> + * struct xe_eudebug_event_eu_attention - Internal event for EU attention
> + */
> +struct xe_eudebug_event_eu_attention {
> +	/** @base: base event */
> +	struct xe_eudebug_event base;
> +
> +	/** @client_handle: client for the attention */
> +	u64 client_handle;
> +
> +	/** @exec_queue_handle: handle of exec_queue which raised attention */
> +	u64 exec_queue_handle;
> +
> +	/** @lrc_handle: lrc handle of the workload which raised attention */
> +	u64 lrc_handle;
> +
> +	/** @flags: eu attention event flags, currently MBZ */
> +	u32 flags;
> +
> +	/** @bitmask_size: size of the bitmask, specific to device */
> +	u32 bitmask_size;
> +
> +	/**
> +	 * @bitmask: reflects threads currently signalling attention,
> +	 * starting from natural hardware order of DSS=0, eu=0
> +	 */
> +	u8 bitmask[];
> +};
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_debug.c b/drivers/gpu/drm/xe/xe_gt_debug.c
> new file mode 100644
> index 000000000000..04d2d43ce249
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_debug.c
> @@ -0,0 +1,152 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include "regs/xe_gt_regs.h"
> +#include "xe_device.h"
> +#include "xe_force_wake.h"
> +#include "xe_gt.h"
> +#include "xe_gt_topology.h"
> +#include "xe_gt_debug.h"
> +#include "xe_gt_mcr.h"
> +#include "xe_pm.h"
> +#include "xe_macros.h"
> +
> +static int xe_gt_foreach_dss_group_instance(struct xe_gt *gt,
> +					    int (*fn)(struct xe_gt *gt,
> +						      void *data,
> +						      u16 group,
> +						      u16 instance),
> +					    void *data)
> +{
> +	const enum xe_force_wake_domains fw_domains = XE_FW_GT | XE_FW_RENDER;
> +	unsigned int dss;
> +	u16 group, instance;
> +	int ret;
> +
> +	xe_pm_runtime_get(gt_to_xe(gt));
> +	ret = xe_force_wake_get(gt_to_fw(gt), fw_domains);
> +	if (ret)
> +		goto pm_runtime_put;
> +
> +	for_each_dss_steering(dss, gt, group, instance) {
> +		ret = fn(gt, data, group, instance);
> +		if (ret)
> +			break;
> +	}
> +
> +	xe_force_wake_put(gt_to_fw(gt), fw_domains);
> +pm_runtime_put:
> +	xe_pm_runtime_put(gt_to_xe(gt));
> +
> +	return ret;
> +}
> +
> +static int read_first_attention_mcr(struct xe_gt *gt, void *data,
> +				    u16 group, u16 instance)
> +{
> +	unsigned int row;
> +
> +	for (row = 0; row < 2; row++) {
> +		u32 val;
> +
> +		val = xe_gt_mcr_unicast_read(gt, TD_ATT(row), group, instance);
> +
> +		if (val)
> +			return 1;
> +	}
> +
> +	return 0;
> +}
> +
> +#define MAX_EUS_PER_ROW 4u
> +#define MAX_THREADS 8u
> +
> +/**
> + * xe_gt_eu_attention_bitmap_size - query size of the attention bitmask
> + *
> + * @gt: pointer to struct xe_gt
> + *
> + * Return: size in bytes.
> + */
> +int xe_gt_eu_attention_bitmap_size(struct xe_gt *gt)
> +{
> +	xe_dss_mask_t dss_mask;
> +
> +	bitmap_or(dss_mask, gt->fuse_topo.c_dss_mask,
> +		  gt->fuse_topo.g_dss_mask, XE_MAX_DSS_FUSE_BITS);
> +
> +	return  bitmap_weight(dss_mask, XE_MAX_DSS_FUSE_BITS) *
> +		TD_EU_ATTENTION_MAX_ROWS * MAX_THREADS *
> +		MAX_EUS_PER_ROW / 8;
> +}
> +
> +struct attn_read_iter {
> +	struct xe_gt *gt;
> +	unsigned int i;
> +	unsigned int size;
> +	u8 *bits;
> +};
> +
> +static int read_eu_attentions_mcr(struct xe_gt *gt, void *data,
> +				  u16 group, u16 instance)
> +{
> +	struct attn_read_iter * const iter = data;
> +	unsigned int row;
> +
> +	for (row = 0; row < TD_EU_ATTENTION_MAX_ROWS; row++) {
> +		u32 val;
> +
> +		if (iter->i >= iter->size)
> +			return 0;
> +
> +		XE_WARN_ON(iter->i + sizeof(val) > xe_gt_eu_attention_bitmap_size(gt));
> +
> +		val = xe_gt_mcr_unicast_read(gt, TD_ATT(row), group, instance);
> +
> +
> +		memcpy(&iter->bits[iter->i], &val, sizeof(val));
> +		iter->i += sizeof(val);
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_gt_eu_attention_bitmap - query host attention
> + *
> + * @gt: pointer to struct xe_gt
> + *
> + * Return: 0 on success, negative otherwise.
> + */
> +int xe_gt_eu_attention_bitmap(struct xe_gt *gt, u8 *bits,
> +			      unsigned int bitmap_size)
> +{
> +	struct attn_read_iter iter = {
> +		.gt = gt,
> +		.i = 0,
> +		.size = bitmap_size,
> +		.bits = bits
> +	};
> +
> +	return xe_gt_foreach_dss_group_instance(gt, read_eu_attentions_mcr, &iter);
> +}
> +
> +/**
> + * xe_gt_eu_threads_needing_attention - Query host attention
> + *
> + * @gt: pointer to struct xe_gt
> + *
> + * Return: 1 if threads waiting host attention, 0 otherwise.
> + */
> +int xe_gt_eu_threads_needing_attention(struct xe_gt *gt)
> +{
> +	int err;
> +
> +	err = xe_gt_foreach_dss_group_instance(gt, read_first_attention_mcr, NULL);
> +
> +	XE_WARN_ON(err < 0);
> +
> +	return err < 0 ? 0 : err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_debug.h b/drivers/gpu/drm/xe/xe_gt_debug.h
> new file mode 100644
> index 000000000000..3f13dbb17a5f
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_debug.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef __XE_GT_DEBUG_
> +#define __XE_GT_DEBUG_
> +
> +#define TD_EU_ATTENTION_MAX_ROWS 2u
> +
> +#include "xe_gt_types.h"
> +
> +#define XE_GT_ATTENTION_TIMEOUT_MS 100
> +
> +int xe_gt_eu_threads_needing_attention(struct xe_gt *gt);
> +
> +int xe_gt_eu_attention_bitmap_size(struct xe_gt *gt);
> +int xe_gt_eu_attention_bitmap(struct xe_gt *gt, u8 *bits,
> +			      unsigned int bitmap_size);
> +
> +#endif
> diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
> index 25dddb8b22f4..453269ac8307 100644
> --- a/include/uapi/drm/xe_drm_eudebug.h
> +++ b/include/uapi/drm/xe_drm_eudebug.h
> @@ -27,13 +27,15 @@ struct drm_xe_eudebug_event {
>  #define DRM_XE_EUDEBUG_EVENT_OPEN		2
>  #define DRM_XE_EUDEBUG_EVENT_VM			3
>  #define DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE		4
> -#define DRM_XE_EUDEBUG_EVENT_MAX_EVENT		DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE
> +#define DRM_XE_EUDEBUG_EVENT_EU_ATTENTION	5
> +#define DRM_XE_EUDEBUG_EVENT_MAX_EVENT		DRM_XE_EUDEBUG_EVENT_EU_ATTENTION
>  
>  	__u16 flags;
>  #define DRM_XE_EUDEBUG_EVENT_CREATE		(1 << 0)
>  #define DRM_XE_EUDEBUG_EVENT_DESTROY		(1 << 1)
>  #define DRM_XE_EUDEBUG_EVENT_STATE_CHANGE	(1 << 2)
>  #define DRM_XE_EUDEBUG_EVENT_NEED_ACK		(1 << 3)
> +
>  	__u64 seqno;
>  	__u64 reserved;
>  };
> @@ -62,6 +64,17 @@ struct drm_xe_eudebug_event_exec_queue {
>  	__u64 lrc_handle[];
>  };
>  
> +struct drm_xe_eudebug_event_eu_attention {
> +	struct drm_xe_eudebug_event base;
> +
> +	__u64 client_handle;
> +	__u64 exec_queue_handle;
> +	__u64 lrc_handle;
> +	__u32 flags;
> +	__u32 bitmask_size;
> +	__u8 bitmask[];
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.34.1
> 
