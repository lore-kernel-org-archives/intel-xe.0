Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C92CCF9EB
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 19:18:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE93610E567;
	Mon, 27 Oct 2025 19:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FbQ7nAvn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A243910E558
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 19:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761592705; x=1793128705;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uCYQXKpff6tndCKWxFpK8G/naxail25QFuwEfDSLNwg=;
 b=FbQ7nAvnmWgMDUbgiunoYKAMeE147TZ0Qvi/TUFrghIP/6Ud8EGN8ja3
 hFjbWYM8JNxSbch/RftD5NgFbaLrZuX0LGyLo4khJ//PuK4gHF+j8qVYT
 bVw7ZbTfw6yxILkD9yh9qIuxbrtWm9obRPVu7xv0EDyLPpnqUls1S+yyI
 yk+pExge2y+qUMnLG66MjF6LufL6MzwCTE4HYm6naenFAHpDd8l9LBySl
 bBzbiBz0EhfQlicIULGsO6wdCWudfgI+xWlCAjq13PXZLykcqynlTt3EE
 Un5YoklZKFmmCOrLc+RH3Ahq2myKnNeDIb8WCDeuQ2yd/Pjdn4VKeEz7x A==;
X-CSE-ConnectionGUID: jZti3WQVQkap0FQnqXTNAQ==
X-CSE-MsgGUID: hDyPtohISVW0vPHyWRAtyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74358999"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="74358999"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 12:18:25 -0700
X-CSE-ConnectionGUID: rmxQ/AU4QWajRm+wU8UbHg==
X-CSE-MsgGUID: 2knL5gO8RfOXJhOU+u9Flg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="184755866"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 12:18:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 12:18:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 12:18:24 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 12:18:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oM6BgAVpOuZrFS9I149esCOyW0bciBPxrSX0ISTH7wnANSKWrHXmvVq1pgZ7pSJVvEAshxy33PpnOR0w9VXu6yj6tjvhOS2yFTdGNPbFcUB/k2vN1RbiFQqGfP4VPWSUyNUPLMJ+o5pk8LffojFPxbUEWuJepxWLBeeYEp+na9dBbzQ488ONHUJ1KKBHOWp6WDLUG7h3cRtg5xcSyf/opDKk8yIGzh5RCkT22TqPGbkMrSWq9Koj40RR9xA3iN144USqg+EyRWoqe2rs9Y5V5g2cbWWVjbNdo3HVKkU6TervjMPe5hYgUsuWuCv9D0yoyB/j0X6kPbbwWPLbi6LVHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCYQXKpff6tndCKWxFpK8G/naxail25QFuwEfDSLNwg=;
 b=dtl0F2o7wReVmPss0U5yiDkd1nDyq3LEHhkpYzlPKnMn6c75/JDdsrkQdXILrF+6tUljFPMFWghWL4BpaveEHgdKjIglIn/oz+zgTFyMYbLD9KOvVjrszgFrW/oHOfOez2qf+XDMwgVHoXdLhHyOZ8O83wBfUhz9ks0zsNm7mROgfqFDDenE6SrEi7yRHc0VgmwiM54fDK9GeqHRuj4otW7YqKN5kaII9WI5Z0uyRGBbLcfcTx3l0gDCyuk+em6Crj+glYbXorU1coGOYYLUrW32IQjOwcmFWfuqg0sWo5zO67huBYY/Uwx1qDQq3QOws4OniKOydFoK69fqwyoMXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4774.namprd11.prod.outlook.com (2603:10b6:510:40::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 19:18:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 19:18:22 +0000
Date: Mon, 27 Oct 2025 14:18:19 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 06/14] drm/xe/pf: Add functions to bulk provision EQ/PT
Message-ID: <qxdscbtb24fylihpfquro5ucclultonawhzzk7vx4nqyxhxxiz@pkmvqseibitj>
References: <20251020182414.576-1-michal.wajdeczko@intel.com>
 <20251020182414.576-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251020182414.576-7-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY3PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4774:EE_
X-MS-Office365-Filtering-Correlation-Id: a6de8255-5b4f-429f-572e-08de158d97f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Wqs2vOZLc0p3pilyxSj5SVU5+x3AUNFsfX5vdA9Nn5HjrwIoYh1myp0MGxQP?=
 =?us-ascii?Q?aZRRKklbUY1CkwRMq9Syk6BQM3IXTR5t6Z2U8n7ek8Yp1e5PFMvhHZuJx1+L?=
 =?us-ascii?Q?9mIGK5l2Rpq2CtwzRXzhjaM85eloN/ojBQTx6oxQCHVvOS0EB4Gr7270PDc8?=
 =?us-ascii?Q?LNr6WxTcxO8rNyjXWKTuVdDKfF4Fah5MRom1QD0G9a8lyMHBi9XXFF2BdJJw?=
 =?us-ascii?Q?R199EHr/tjiREqcxROujkkhw4+9igZBH/zJ0A0ikxFY/9SmnVHfHJ+S2UtEa?=
 =?us-ascii?Q?QSE9z3gdlxhyRCMGxVDFlL0dNOAsWfBD7U8xRuZ0HIgjQ836oOMgK+pcUasD?=
 =?us-ascii?Q?h1Bu89DZfCkpW87K0DJcQ7L8f3h+yH7/r39Q/Fi/nphV9yMAgHM0K76AiYJM?=
 =?us-ascii?Q?qHqsjy8YPIifBJzrMvh0o1z/JJps21aLLTeTh0qxKmRlmh94nUsc3gwgEn9E?=
 =?us-ascii?Q?Hbign55IPiq/PT54wm7z87MBAjm6LtrVvshbhNBqhcHwYyCBlZfl9bsuo9TU?=
 =?us-ascii?Q?tBcEb+Y0OlfZ+H6WYpsnAZnIUKQ4HSioxvver92RddpKai+kbP/MtFyesg4S?=
 =?us-ascii?Q?oUyp4GmnhFXID5zzfBNQnMXadTbXA6P1Lvg6NxagwnrHTsRXgK52+LXjK+ic?=
 =?us-ascii?Q?7WNeGN0ctKuzOaPmoxH/eLsWI5/hIlsiwoVGralCf+8w6k1j6ApRthrnxULP?=
 =?us-ascii?Q?XRxyDcxc4lJsucNOK5BmFErLJpo0phYrzgu5D/g9PUxgj2c4WAc8gqaA1k0m?=
 =?us-ascii?Q?1DMd9qJ+oaMs+bZhAauKrfQTvXpdrFVUQeOEVksrcLN5KrMR8DOxlrxcBLzG?=
 =?us-ascii?Q?mGOHel+RkKz+v4vYIhaXL5FZ0IWnnw5F9jiBnNYishnti/u5SFBVEwRJtldf?=
 =?us-ascii?Q?xHLGiWe+tql0ChrzMSgMoB3Gz0/GaAmWv/Cc/zULJnMUDO1WzHFW2XXe0Kxr?=
 =?us-ascii?Q?6/O/vvFHisgC7OvKbjUfu+ZdiRnNLtFVjxzM4v4JXBhmBKYtO2WPgu9EKQHG?=
 =?us-ascii?Q?cLYtsKiuUEVJQXJDyXAdaU8jphSZxghowV+nodfoaT8y8zFA3jg9SzS0uU9Q?=
 =?us-ascii?Q?RB1J9gSravuGX+tagfslzjb/5k1fwfvGQjq8zfPgT6+L08LB91etcTyaL17j?=
 =?us-ascii?Q?WKHkdxp9NFs+S0lvrIZJKZRZO7QbIvKhvp9/tKVFzLNWEQucz0wou0UI+p08?=
 =?us-ascii?Q?9Qn6i73kO9Bti88KLJuFez6b9FHXNL+CEqFjLeZsoJRb/x8lIjbs0oe1/Sq2?=
 =?us-ascii?Q?wGWOONYsYE47f9H7xhhpiUj2ClSomkhS4TVjSwv1DOHGupV8TtDlCWKVv3Qd?=
 =?us-ascii?Q?B5Z54nq1lFia1UHNK5mVgjYsGW65BkVPrKwiO+370AGJ6U4YZxmmiOnpOGin?=
 =?us-ascii?Q?m3jWuOyQU3VQKV/cvI9ejZxtr5yD/zk4sGXk303/5sd03SMk0KVQEc1zscge?=
 =?us-ascii?Q?nW7qOXPO1fJpg71Pgk7JJr5EkcotQP37klIoJVFm+0QE/jTLV+N4Dn1bpHiO?=
 =?us-ascii?Q?bWc5mP94O6qf4t8/IlCm4MG6tm2ze6sBdZdW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I4NObHIyscM7X11Yyev0cTBOrAPoO5VzpQkU4bVp6kly2nIFI1CWZfD7So0i?=
 =?us-ascii?Q?U4SzY4YwmnXJYer3bUqXyRw/F5SCyPN3Gi1MFAoHBOe5O5FwoLWHUlukFCyX?=
 =?us-ascii?Q?+F18NU+Z4n6s/u1Jtwf/Kwdi3F4qzqNBlaKqgsmUK9tFi+kcJYvoUUT9i7ub?=
 =?us-ascii?Q?2AcgjW6XZIM8axVEt9S3+NtsQC5aGC7iXyK8OMRw9EzLY1nrGfHbvdSYe7Te?=
 =?us-ascii?Q?4h3JvyrTWrlO+BLxW+9qzcMROpN6e//XDnFSs1zpXewAMTlXSoun4lplIlHw?=
 =?us-ascii?Q?DzFAEA0aVQvvJNOxx+BR+46P5IFUMt4WPexWX5IIVbJ1d2zMKL1+TckW8vjD?=
 =?us-ascii?Q?dBP9RHAtOeI/8ORUYc0JtTzJjCNOGR6aPUJJolQrWfb0ZzPJje8T+VPKZVcx?=
 =?us-ascii?Q?PQbv1J1Mxz1MgBVDT9M4zUbI7WHKPrcB4mTa4R/a8WOufPkc7rWPF6wCFgXG?=
 =?us-ascii?Q?M2mNHvMUSqBS7f+JvAVbi7uLdex/Qc6jgWWo9Kw8HieDh4LRzn11eQAc877q?=
 =?us-ascii?Q?lfG/KYeD2BIt3CTlbV3LRho8jVvL5gOMQirW4qysgWmmo0UBm15yzzl7ii0L?=
 =?us-ascii?Q?DDBBpoOX8TiDANrBj2LA6tO/DnN2bx3BOIKTirRctGEMOR3pTcQjehmJUCYG?=
 =?us-ascii?Q?tN7iPdzJss15egAM3DIN6MnAfShLwiC7MeMy/MdymtD89eUl8bPSBJVPaSM8?=
 =?us-ascii?Q?vxo08nXCzJG2iiiJc+bczMR1PTT3TRVrcD5rkffsUYSycGJGFQmhEzreoMda?=
 =?us-ascii?Q?xx5UTjY6D2d5zh4xbsnLXWpeuOvGPcbU7CMf5zKDRSdkr8hlHwOi4bjoypSS?=
 =?us-ascii?Q?irO/kMPCJcuieCVM0Axn8eJ2RS/We+ZCzSjJ/lS8yc5el2ybch9eZC8BnyNG?=
 =?us-ascii?Q?1f5YTlqVm6gJuOmklnNoFcZLLeFp2lT8auZocIRkOYIzSsup47ZwzP4bZksI?=
 =?us-ascii?Q?CnQOJin4u+mcRfeHgl5khfXeBxdoWkpnH9+Caznoo4Gw3YHMDu/Br4yvXCqJ?=
 =?us-ascii?Q?FiqG81zpknleaaSwnaqpYodRxUOBi6WhRIp2LRg7GyVNt/REBttS8cyhrfan?=
 =?us-ascii?Q?yJCfJ+dw/zaSt1/EsuhSajLJuTEq7xiATZGW+AiT4umGFq5YO2I0iuDuQ93a?=
 =?us-ascii?Q?/nuJiHOuN7cV8USFytRQ3+rCH1cLF3FH/lf2F7ZhDgH5fTqS7Gv9s8Dp3kBL?=
 =?us-ascii?Q?uTEbEBMnC0B67Adw0UrO0SkCli9L/6KdgsBl2r6YQSEQibjh4ejlBKY0Sc/b?=
 =?us-ascii?Q?5zOfKfC0LyiainjAmsFch/N5xcPU/fUdrk8wo1jmdkxxobu46uPITLAFbcbF?=
 =?us-ascii?Q?sF8gaBnrn7PL+CcPTTsGcEVD7OrYKZxfsPUrom4VQ/48AxmSFTMuT2ByR10y?=
 =?us-ascii?Q?R3UBeTK5ToDryCYPiuTJPl3ZfldQdmBZFijQDFrPVYz+Yelta9WJjSlY3a36?=
 =?us-ascii?Q?KtOHgxffvEZPlH8qJIWaNxwv01rOgJUiYWgf4Q+yseDrm3cjeCUgkYfK6isa?=
 =?us-ascii?Q?dqTWN5zf0corjRKbt7d0CO9NqazhYCAzUQhPZwCWLWjXZSblGZgVYn674Ugw?=
 =?us-ascii?Q?eqqf3C+p45GLMQYivQT2rzNfZ3FXGG4n4uzJ92iEv2VjzTqmmZOY9/8bqW6N?=
 =?us-ascii?Q?hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6de8255-5b4f-429f-572e-08de158d97f7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 19:18:22.0328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y242x5arR9SYSXxYPMVhXhAXab1NiysvOs04h6GYYPylhLTUi9Zmo4KF09ZeBV8Zj1HkWYGdJhAj2rdjGm1du9zJtVTyv2yZQN1HnHwo288=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4774
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

On Mon, Oct 20, 2025 at 08:24:06PM +0200, Michal Wajdeczko wrote:
>We already have functions to configure EQ/PT for single VF across
>all tiles/GTs. Now add helper functions that will do that for all
>VFs (and the PF) at once.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
