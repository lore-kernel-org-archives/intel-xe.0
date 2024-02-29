Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA1CC48BF6
	for <intel-xe@archiver.kernel.org>; Thu, 29 Feb 2024 22:14:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E8310E605;
	Thu, 29 Feb 2024 22:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bOlfy3cQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A867A10E605
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Feb 2024 22:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709244856; x=1740780856;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dSgstBe/XKwuyT0ftsUOLSh1jFOyAZfGOrS6bo3kGlk=;
 b=bOlfy3cQNeKSw+S6fuTYxtDgSilQOQ9ohxHt6ecqnI7kjX+3fZLH200w
 AzpIPFDQgjl8DcyB0dbgFMp6/lhQZdCLB/PrKnvvH7Zauj7Zmyy7SGRni
 HTxvm3STjUJvF0Hu5ItqgUkLyK8S/bCnNO5IMnSM/WHNtLqsWl3uAyqVe
 D94Rv1tJL7J1JrIz3v1o6rD01qiMKzURksAyvn+AyG4F9HRHOddqkwPfs
 LopRdhPceQCAP4ZtVvAFTaPNeSqVm56zMzYnpwvQDYxjrUCFUaR1iAPZx
 qczGEm6cXWkkD+Cn7yXldC1PKaG5uxsKIcUEDvlSqgQ4p+Z3k4ZF/cxEm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="4335072"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="4335072"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 14:14:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="38983770"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Feb 2024 14:14:15 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 14:14:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 14:14:14 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 14:14:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJFFD2yMr/iSYvbNQ12JAoWfLWgWONQl+Uv0LAAz4oKzPq3dQSytjBsZuuckzQf0SQUFK0fx0m//8EUNNpvi8IMz5Y7qHeiyIB66gXi9l9AWesyfa3LH8K6KJfb7zP920uoPIqNb67kmUy4e5AeHKiqtViwQFRx/AiIFG4MmemIrxok1vtoBD9HIUQFPexTkQm39T/4QP7eWzTwbsM1SkjWhMxuqpA5v7UC7rmkoR+muy3eMyZFbq6VdetqAxCSghyXu3rMjNYmGBE0EFfwcE3za43JLeAZiyyeGC3h/Mpgs74zOocupZ84mC/R+pfja4GaChFOqBLkhj2Sv4WoVJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzJVmVnRomHOOkv2Wl7Wd8pTGbEUQA6TW/JspAe9XI0=;
 b=G9RtTvGEk96TCSRphnv34GWSziZIUcakxHP1AnTSd6yd+K0CTOilRsqeQgIGM+Ge+mLjDFx8gyJFAg1HJFujiQrBPAXOoeYfFUYiTZQY9RIHug0y2DYZEGOUj+l69ys3TFK13eId+PRqnJNcJyOg3Wj5PJL7Co48AhSj4TzDI9jGpiIwZZGJ2wjiyCurlkEnn047ZM7iZs4gtjGQ8OlZZZDTmoIAWo7FTZp/rzMG1nGEQiP7F56LFBHo5phgaK6XnHZrIVzfyqkPhzY3uWutVJGeIqPbVeUnu3ypPeswW+kcg3e+fy1neH7XIjVfHV9+4qywlupFPAyuzeudq4wLGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB8294.namprd11.prod.outlook.com (2603:10b6:a03:478::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.16; Thu, 29 Feb
 2024 22:14:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01%7]) with mapi id 15.20.7339.024; Thu, 29 Feb 2024
 22:14:11 +0000
Date: Thu, 29 Feb 2024 16:14:09 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Ruthuvikas Ravikumar
 <ruthuvikas.ravikumar@intel.com>
Subject: Re: [PATCH 2/5] drm/xe/mocs: Be explicit when logging number of
 entries
Message-ID: <ciqqtl64gdjspror7aud5cgx6rpvv3pckrfbtcxz4xptpz2oxs@i74m44767kxc>
References: <20240228061048.3661978-1-lucas.demarchi@intel.com>
 <20240228061048.3661978-3-lucas.demarchi@intel.com>
 <20240229212105.GP5347@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240229212105.GP5347@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR13CA0216.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB8294:EE_
X-MS-Office365-Filtering-Correlation-Id: 66563e5d-98b2-4697-8848-08dc3973c199
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vNnFPQyrLwjLBQ3IQtGGPBZL0+ttNJg3s6xr8MEceOgZ2krThealJxYT6VDndrUwU4g3qpDJVrNkckS+KRPom/UOyw297Lq31m/h6x2DX0kGEv3OaxJqErE4i+8fVMkTyVLFp8OnYoVQGB+YLHleqHiUpT27pngVd6B9qpXlBOc1jTn4ArzWnjyUGdzg3MV6jb9X+aoboSVZw5dGxdq5zq7T9ZXBFmDbqq6/Z/Y4BC/UGZ8R58/3eSE0mZ7Xb74jlLvOC7c5MSH6mzKjZ1qz3bPO7LEZBhT5z7m800eNB5Rshxi8zm3C1XXHIDkto5Fj2LRC6w5cbH9LtN2CVFkbZrFnvyuBY3vCoRZzLnzIS/PlpwTrskD6LB8FNJAPafs74CfWE5xnTWjrpt72F/fP0Sbnbjdaf1Q5O8SurMMH8Po+7O8x1Jc3g80EpDksQI8Ud2ShVoNZFncLOzEGmHbnSymEOgBFHrCzl9MpUEOm9pNBFW0fjlQsvrQG1xR4Z6RutOI2CS6FGFYXnOYP0XHhKnGB5ffvlpWhh1sD1ngCxhTy6VXHuX0dGoss5HIlHvJZKEP7KycC6YG+GqlRWMWCLeGVM9rgmRdhH3bGoU3qoFNP3lSrGI7w4PDR1Q8xJpxw6dq2RuRBamzYvsqnStd1CA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?li/j3UxgQNI8Q4Q+coH8p2zu6fOc6k2rUadtU61/19mc4Xlz0ktNLD43PXjj?=
 =?us-ascii?Q?VDHqMYlnFYaAUtRQKAUd+9SJmmDLJxCfxrIX0hIcSb4THuS1k0rj6LhdmpP7?=
 =?us-ascii?Q?cfWVnDGYxOnLgGToA9Ko4Z6uwuSq/p4xp1/Lm6q4ZlN07VgnWvJIMadNPWb3?=
 =?us-ascii?Q?gVV5W8Vkm55wfAt9Jamubyt6BG0xlAl8k5QAIUy1kfgaHAX9yTJPbSP47JW/?=
 =?us-ascii?Q?tNihHMoiUTgeGRIl1o2FE2Mbc4js8W4Y2fS2NSWBv5sVlTyIKdGfrSMfc/S7?=
 =?us-ascii?Q?4DKv8V5fG6bvTjMmbQw9uju8mo6uPX3YuQYRIISJcSXk1g9fMFJADMGuQUSF?=
 =?us-ascii?Q?TnBIO0FeQQHtsgq6g6tXum5YOuissuF+eBVnvmoSOl6Lhu0XRdeoF/7/s+DG?=
 =?us-ascii?Q?fFz+eRGEGRQyzv76/lf2RrWO5mBrUWvAiufBkYiHRezAwWkL/ohaBPeP8YUP?=
 =?us-ascii?Q?1x/Z/UQ1n89lmrEMcBg/EWlAMU+Z0rP28plG5McyFTq4HddTQ2AU39FSiBK3?=
 =?us-ascii?Q?io+geXRB9xQEeoUYR+9BIUYvNgADoif50rfgs6LYnDCxT76GkDioiRJJoYlU?=
 =?us-ascii?Q?aCTHfgzpaGLUnnUuuU4MfGqVXDBPIS0gca6DXNhykiYdmUw7kNTvJMYSTGHN?=
 =?us-ascii?Q?mAes0o1mkH0hqXWTi9EsqDiUOhoL+GeAEJlfhNwwUN5i8oShJfTN9Dz0xsqs?=
 =?us-ascii?Q?o5UBL0MM1OwrONzpc4E9OeZ7yqz3P3KjVmCo2uCzU+eQYIyzR2Rr1u8keWFf?=
 =?us-ascii?Q?Odfp8vrlEHKZjMGbvGmCyQNDaR1gYX0XWNP8is8TRa/CGsya9kamjtT8NxpU?=
 =?us-ascii?Q?3NL5hWH4PysPOeRORyhMQ6QW9BxzXQEm/wU9Xm/gcLk1qVUJRyMeXS+RChkr?=
 =?us-ascii?Q?y31N2U5j/U4aJ8rbKGd9rV/+zUDmAGl2YQ85WoJ66nj1s2v0912E/PKsq9aR?=
 =?us-ascii?Q?1xhHlLgFct1W+3SwDODMe+eihnICHkJ+6eSfG7eT7JYp88ADRWgIiEEoUb2u?=
 =?us-ascii?Q?jcTIT0Sa4wwSfuVuy7ewr0mJGsbjGrHiNvue2gCz+pkZPL7y2rq5PZ6Qa2/A?=
 =?us-ascii?Q?EztqtJEtwMnev/1WX5b+aHsNd6D5wt5Y4yyrw7zs3u+QD8S4xeEk6PRMlf3D?=
 =?us-ascii?Q?LUmh+1kvfVKd559QfG28ooTVCyuKyOAxOqrcBW67Ude+yRpLJrhtYbdxEAYm?=
 =?us-ascii?Q?LNdAKNLqrh5toNA9QYOutdgFubldUAlnj1zQcKQq3NOItp1n7Z9ptbtVZVpo?=
 =?us-ascii?Q?17HfzIMrq6jf1J5gK0zQ/WE7E07l2vTovti8AOks/Zhnhu/1V2w2gRaCK5vP?=
 =?us-ascii?Q?Wjt6PuyYkzQ6cni1V4Kx3qkpCHCBDV+bLZCo7sZeZ1lfQJgd0YtfnWFMe04s?=
 =?us-ascii?Q?yrsn/mFcapvGtnrD4BnBpdfBy0RO567n4Few1LfnbVO7O+fBb0YEB1M9uM3R?=
 =?us-ascii?Q?j4CoSDAVCwKX+sX0GMj9Y7hdy/xqpClwmkSzlx9DlAH01PPDgmiPeGsg7TVd?=
 =?us-ascii?Q?sI16Kmi4MpfJKuPS7okhdeq7ontEpcLqkL5a4MYmyfb9p1KoJpsGxqoXq0f2?=
 =?us-ascii?Q?Ls5I23nQgQ4xMLkSHNJR07BjIwaO/5zrVQEbCEFgu8COfL3l6q8rR2zehALE?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66563e5d-98b2-4697-8848-08dc3973c199
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 22:14:11.7994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CgW4BsBEkL5JFPMSjZ8mkk1man4C99qN+CeZ+31j9WAe4c6uzUeYtMvxx6xbMRHL5CbIbqsDV9/9sEhBvUpVWgXLY9aN9B/xgyokTmy8dFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8294
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

On Thu, Feb 29, 2024 at 01:21:05PM -0800, Matt Roper wrote:
>On Tue, Feb 27, 2024 at 10:10:45PM -0800, Lucas De Marchi wrote:
>> Make sure to log if number of entries are l3cc or mocs so it doesn't
>> depend on the context. Also the warn-once in __init_mocs_table()
>> is more a sanity check that should be done as the first thing in that
>> function, so move it up.
>
>You didn't actually move the warn in the patch below.
>
>With either the move included, or the commit message updated,


I decided to split that part in another patch and forgot to remove this
from the commit message.

>
>        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

thanks
Lucas De Marchi
