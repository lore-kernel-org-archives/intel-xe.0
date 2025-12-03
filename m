Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9366DD1CDAA
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 23:07:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E0810E19E;
	Wed,  3 Dec 2025 23:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fIBAOm5f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF79710E163
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 23:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764803225; x=1796339225;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Uv2j+oPtCy1KJAT5xR2cUZssQnmKRhPs8F+QtjT0CAI=;
 b=fIBAOm5fVjtBV9XSY9Iwa/oLQEydWLXw1Ezc5tpgk+ohuukFaeHhkUkX
 Fl4AXo15lcmNfRTh90LGhVxJqajRrARAj9dPtDhgWDV/Hp8B+ljJqK6Fi
 Baz/ZksHI/nnm1AkUM9txnNVkjbkwRDwavXSXYbYTZ3pHb+OHzX1UMocC
 mtkjeaxRqLPzgEZRExGNU4yW4YJ0dQHGiWgcPlvv1v23h2pWWIfqqp/RN
 qQW8JUPJ6qO2l8t/mKM4dbdXb+hqGiIUej8kBzlLji0O5+k8QCEkhomfN
 u0c7yt2iyxQcnqq2gGPHRJHVfhNhpE5pPVuvnWD6jbM5Pz+ayx80D+VRI w==;
X-CSE-ConnectionGUID: FbL8zR8oSMKG1rQ57HbyBQ==
X-CSE-MsgGUID: XSgu0cf0Rd+QQq9nmbuy4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="84414857"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="84414857"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 15:07:05 -0800
X-CSE-ConnectionGUID: RCUZEEg8SAGvX91hqTXFFA==
X-CSE-MsgGUID: 8sWJaazOT9yQJdXCX9GQGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="225760546"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 15:07:04 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 15:07:04 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 15:07:04 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 15:07:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQufriw+NC8NMwilMslTvdH0I+WY4w8a+SrQMvboMI3y02KgvXfSiveKHcjrB2L000DoFUeSkz8bAWTzsbHtG2GbngyY+HwfQy3TyOc6ECm0U4MyYVmzIVLQbkGQh9+VEvoSwVVKh7XGeSQDC3DuOT2M0gzauuSCf+5VEth8pEmH2Js3K3Kb3OQ3xUpRpP9IOHLx5pLO3EM03TDHXYzd9EbasJhexZlso1V92zGShIwwdh7MSqUzhT4Exuc8AYOSOoLa7dqCXTrKMbrFkrF8Q0ZSLW25Y9p1DXo6kDzGLsY+m0+/cGORsjIINRk644QY3wACzvukQjtJootfrVfOuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4cghKSHLZNYhJkJn4lruHP0eO5Fwp0/+EWD4gXUesFI=;
 b=FVvXVxEGlBVDTmA/Ewd8pBPIU87V9hSicrL0NmZNzBz35kCh+2rvStCCpucbnb87NOpu6Klo2XBWx+0HZkZ4WJyg+sMlt67ScbDnfkQPC8m1I5Jx3UtNLYCod0U9hcPKwVzrG/K/CswZ48b2k45r/0Spmy/oUyDmEbWz7PgBo3rr8ljKmY9MbLxxe/e8tmniE0j9mWDrQ5Mx3YqesFVTzKK8NkhKqdLP+pcE823AC2C4DKCxE7S9mKfLUjHGGEKR7U62JIews3/llswN3rUrLbauZwHZo20lnmfYYiWYPzuRWSnZVz4FKvEU3Hk5dFWm7Ixx83SL6YUghSPQawgG2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7496.namprd11.prod.outlook.com (2603:10b6:510:280::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 23:07:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 23:07:01 +0000
Date: Wed, 3 Dec 2025 15:06:59 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Nguyen <brian3.nguyen@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <tejas.upadhyay@intel.com>,
 <shuicheng.lin@intel.com>, <stuart.summers@intel.com>
Subject: Re: [PATCH v2 07/11] drm/xe: Suballocate BO for page reclaim
Message-ID: <aTDCkxzgOUUO3Y4t@lstrano-desk.jf.intel.com>
References: <20251126230201.3782788-13-brian3.nguyen@intel.com>
 <20251126230201.3782788-20-brian3.nguyen@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251126230201.3782788-20-brian3.nguyen@intel.com>
X-ClientProxiedBy: BYAPR11CA0090.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7496:EE_
X-MS-Office365-Filtering-Correlation-Id: cf658e83-58f2-472a-135c-08de32c0aaad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IkVV2+a5dqr94TavvxsmA3eAv2KKAkx4Zp7EnEFbAlqVOhMl/koNMK4pJUtN?=
 =?us-ascii?Q?m1hMUEcNsZessqEFMgsmmfJgrg2JVi2ye5E4RmRJGzaQOMSkThMPGCl4Uj6N?=
 =?us-ascii?Q?lMmGkccDUkbu1AxgThT/y2jhWuvSrwCFw41mKBlYrV9OHPCRa4QYEDXcrDbk?=
 =?us-ascii?Q?Pyfed7PtCIrr8DBfh+EKAFZf4xMibKIZA89fgW/lKGP7lYPqi3rUWilILJQf?=
 =?us-ascii?Q?s3bDTA07z1Re3FonU60xMEEPMDqYOhO06qLlvqyDO35pyprXHW+A4uMxNxEB?=
 =?us-ascii?Q?dYxPDXWZGfZTvZDb4I0wQ16CscOzDB1pAHvA8vC06AdeOoQdrjFWZ7OycOkm?=
 =?us-ascii?Q?UXXiywjnUfxFR6rLiD34sUEurEc/fuXG2+YHc0K1FMvzmHSXCtT7AyXWfJfE?=
 =?us-ascii?Q?cPpLEwVWeJ4FoyrJGhBHpZFU1RbGwqbgB9teX4JbsVYqR6BpH2vcWF9xuQlM?=
 =?us-ascii?Q?Q+2tO4XRC2tbh/V/Iw3crtlBsY44DddfNTKlz2MnaLThXnAjJ21EHCwOIGpy?=
 =?us-ascii?Q?q3Cl4bWzfyYkbkeGjec0v3oRKl2ZBi/eAD3w3gd7X/whljru6WX29+v1Q5wL?=
 =?us-ascii?Q?nSXFL95fZ/X9LVtmehFgQIF/lnu0yd3GsBi/zJd7zWw7pWQvDR2fcW7ZN4x7?=
 =?us-ascii?Q?BfZwWov58vxkhviNrxkQZi9t8hqJRGD/4uKkhWrYvgDFxNbX2EYwQIUqVX1d?=
 =?us-ascii?Q?78geAIWfPfb8DNWQPpi9K6TnN2LNuJVlXyWtDs7kaoz6WwbbrIRN7zOh9d1x?=
 =?us-ascii?Q?6xmndkAqXrC/mhsIITEkoMvIj5hwj0kLpWwgBWeHjtX8ZjCRLsqkoEwaiJLN?=
 =?us-ascii?Q?M5bueVVnnwx/AnQGFYS/ggD8rAxBtROAms123gc+RDwYROufrUsS+ceoBI51?=
 =?us-ascii?Q?ePwDhcfjhu8bWAh4I9vVq5zKaJ8TsUntx+0ugbkBWSSogHTFRxe0wJgsNBIo?=
 =?us-ascii?Q?OtJkATsWr3V+Q3UZHfRlV/xGyyLnAaX4YK9M80Peh12koYcny1OvTFqIvPCz?=
 =?us-ascii?Q?8j5+UkUhJpS7P26NGADb1GvryxWXBHSPLVLsTTm7bI5piRYe5/eKjGw5loZZ?=
 =?us-ascii?Q?XYHjtP/tSLUwMVJIlrkFMgJ6dMHZ93FqzgbrE0j4X2Q2mw0CsqDQp3WnI3ZD?=
 =?us-ascii?Q?hUe7cCxHP1dnkxcU9mP1EB1D8TvzUuDg9nxO8JshYYk9t/azzMAanAST9fCw?=
 =?us-ascii?Q?H+0BuL4fr2fr6Z22ru7ZPL4agxEjNv8XvRSyBfgbMNajws7ALumfU6xyjG25?=
 =?us-ascii?Q?9lpKfQZb6YxrvAPHe8AXDzd0z75S17gqez/6At+HYrKQU6idMk1BohvQxy9W?=
 =?us-ascii?Q?RWeTeIExdeE9hKE/3qbbP0I1o7kTmYdkL1M09hbxrDrg/WvQ5/lAqodn1XpM?=
 =?us-ascii?Q?NX87jGYo7RS804KGwONJLXnu5aOY27x1n6T65mNJAAy/4tgbGALenxIwYIru?=
 =?us-ascii?Q?rruevu2JXlUnT0vpfhT/xpGVTrmqP1ad?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ftqqnnOsBJuA8sD4NxqrYF3sJtYbKJbGnLQORAcxTrzCILidz1nC2AMT+gkJ?=
 =?us-ascii?Q?s+s7bFldYbknIUCrxmc0b2/UbSCp5VqNB760Ng/sRAEteHzvK5xKsqiFrWZW?=
 =?us-ascii?Q?5CwjdltePLBkO0j1rZt4p/GyHvL+nJM8JzOaxG8Fr1+d91JWRMlutDLa7JRO?=
 =?us-ascii?Q?rnRTRF0xFlHwhyXQT/36HQCGC7BwygV/FcB2o27ZB6zOEvD86XYg98f0AoDv?=
 =?us-ascii?Q?JyIpCb5UezUKGZSjlLNfiaM01iUeeDvNbly5139tMJtaiEKi6decDyIkCm2V?=
 =?us-ascii?Q?iJY4Pk25IreKuboHmqdiluDlqCF31wPDzbaCs/CzKTLP8+VXXYsPXA5mrd+Q?=
 =?us-ascii?Q?b41shVHotE4Sz47pL7WmT8g3pwUCubP4DuRfZ+oL/PRUAYU117Lbhh3wT6wD?=
 =?us-ascii?Q?Myq++lOjrCVW0o1tNIqDilG72ethJf1wv9ZSmRoC+XqHx/qjMshbc22ewYhv?=
 =?us-ascii?Q?sAKcdcbEut7i8I8vbVv3/zP0iEkpCLtsDIVJWqOiT2/8QPd7l8BD+eEz/BRJ?=
 =?us-ascii?Q?NkyOoxg8WKU+0RQRrYvQEp3GBLL42weM4OBTrYJJsBBNRa6HRrwk4YtHd2oF?=
 =?us-ascii?Q?ahUW7kbV8Nr4G9R7mpwcj0fGjFXTUDW0wCgdv96FoI9R3/D1Nfn7z1qT236m?=
 =?us-ascii?Q?2THI0XgbUoEgUnTuANL03QS0iYT8KuQdsshtq79i/iAJMPrZeCkmk22U8YvA?=
 =?us-ascii?Q?M0AbDU6672t8PYpWwVLA810fhjAUU2fCN8vj3RKuw1JokDSEKCxz4flyFXBz?=
 =?us-ascii?Q?FI+YxESIbK8K0c7c1bdhelQ+7dVFzyR8BVBhx664WkcSXx9igmiJzAgDrCwm?=
 =?us-ascii?Q?0xo105Ine+E5VhVes7+lJvvf7c8XPBwdv0BnV3JTOXaVEckFq4CSTlLnFOJJ?=
 =?us-ascii?Q?7shXB+2XO6CCiK+jw3uvpUBDIMbG8jwIHIh0LppD9uk1Yd92Gi05R2W9lrpe?=
 =?us-ascii?Q?AO7HTMtdLK5F6fTY2ecQGq6r42Oo1EsFDHVKH8Myf3jQPQyHURIRDkk4sOEi?=
 =?us-ascii?Q?aeVYHZ9vge1qZsRZa2fTN3EL6A7Qi3YfouG8wX/rnuZCtcSlykwp7XVEQo+M?=
 =?us-ascii?Q?/bWjo/rSEHaWvMXTDkhczEOy8Yajmcjfnb8EQTwBI3hyrEJ0qe0bBXuCwD/E?=
 =?us-ascii?Q?aUELoXtsm0OLCpvBpWYweh3hGfE0io4z27tX22cCq3Ru36JHw1xnq11YvJKV?=
 =?us-ascii?Q?wrcNtTxC0gYm1tGSgZYcRq9aQTi19W6ZsPRqMMgCprOmsWN51xrOrSd8hELq?=
 =?us-ascii?Q?7cuRawzIl8Gjn5tr9n9kSGOt6AVRn9Hla4/BEAupE4wnFhNAujvhBXgsLt9Q?=
 =?us-ascii?Q?2kdixaCpl3rJlDUsmvAJD5+N2XQtD5HUabVuNBmlGycLEH9+z0Fk8Xf53yIh?=
 =?us-ascii?Q?J8P307ikNGul4yizBcP9oiIt70SsLWxd30TgBrMWzl0bpcLnMP0Lp5bdxPXb?=
 =?us-ascii?Q?vB/NfNh7Dv6OsDL5S5qgznUgohc0+Sf7Yn8c1AbbfZAMgfqZcstV64YZHPm8?=
 =?us-ascii?Q?u3GXK/SPKL/4qSMPapBtV5Eh4lWejbtLbWemse8hsrv8Ev3FtfcXtsY/UpE2?=
 =?us-ascii?Q?gZGHKPpdM2TmWPVcrfpzzUR6Z41bBczBrVlcDDec5Bdr0hdYeeWGsTFswXf3?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf658e83-58f2-472a-135c-08de32c0aaad
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 23:07:01.3060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pmif6DiU4v8MUNCusgzrB2YcmqSerlN7yf77pnPgSlPdUkn0PI9UgYqttHWqWGyL9nR7u74GzEjbaol9D9ynTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7496
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

On Thu, Nov 27, 2025 at 07:02:08AM +0800, Brian Nguyen wrote:
> Page reclamation feature needs the PRL to be suballocated into a
> GGTT-mapped BO. On allocation failure, fallback to default tlb
> invalidation with full PPC flush.
> 
> PRL's BO allocation is managed in separate pool to ensure 4K alignment
> for proper GGTT address.
> 
> With BO, pass into TLB invalidation backend and modify fence to
> accomadate accordingly.
> 
> v2:
>  - Removed page reclaim related variables from TLB fence. (Matthew B)
>  - Allocate PRL bo size to num_entries. (Matthew B)
>  - Move PRL bo allocation to tlb_inval run_job. (Matthew B)
> 
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device_types.h  |  7 +++++
>  drivers/gpu/drm/xe/xe_page_reclaim.c  | 39 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_page_reclaim.h  |  6 +++++
>  drivers/gpu/drm/xe/xe_tile.c          |  5 ++++
>  drivers/gpu/drm/xe/xe_tlb_inval_job.c |  9 +++++++
>  5 files changed, 66 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 3836c5ed1c72..155ea0800f1b 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -184,6 +184,13 @@ struct xe_tile {
>  		 * Media GT shares a pool with its primary GT.
>  		 */
>  		struct xe_sa_manager *kernel_bb_pool;
> +
> +		/**
> +		 * @mem.reclaim_pool: Pool for PRLs allocated.
> +		 *
> +		 * Only main GT has page reclaim list allocations.
> +		 */
> +		struct xe_sa_manager *reclaim_pool;
>  	} mem;
>  
>  	/** @sriov: tile level virtualization data */
> diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c b/drivers/gpu/drm/xe/xe_page_reclaim.c
> index 63facea28213..740563277872 100644
> --- a/drivers/gpu/drm/xe/xe_page_reclaim.c
> +++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
> @@ -13,6 +13,45 @@
>  #include "regs/xe_gt_regs.h"
>  #include "xe_assert.h"
>  #include "xe_macros.h"
> +#include "xe_sa.h"
> +#include "xe_tlb_inval_types.h"
> +
> +/**
> + * xe_page_reclaim_create_prl_bo() - Back a PRL with a suballocated GGTT BO
> + * @tlb_inval: TLB invalidation frontend associated with the request
> + * @prl: page reclaim list data that bo will copy from
> + * @ifence: tlb invalidation fence that page reclaim action is paired to
> + *
> + * Suballocates a 4K BO out of the tile reclaim pool, copies the PRL CPU
> + * copy into the BO and queues the buffer for release when @fence signals.
> + *
> + * Return: struct drm_suballoc pointer on success or ERR_PTR on failure.
> + */
> +struct drm_suballoc *xe_page_reclaim_create_prl_bo(struct xe_tlb_inval *tlb_inval,
> +						   struct xe_page_reclaim_list *prl,
> +						   struct xe_tlb_inval_fence *fence)
> +{
> +	struct xe_gt *gt = container_of(tlb_inval, struct xe_gt, tlb_inval);
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	/* (+1) for NULL page_reclaim_entry to indicate end of list */
> +	int prl_size = min(prl->num_entries + 1, XE_PAGE_RECLAIM_MAX_ENTRIES) *
> +		sizeof(struct xe_guc_page_reclaim_entry);
> +	struct drm_suballoc *prl_sa;
> +
> +	/* Maximum size of PRL is 1 4K-page */
> +	prl_sa = __xe_sa_bo_new(tile->mem.reclaim_pool,
> +				prl_size, GFP_ATOMIC);
> +	if (IS_ERR(prl_sa))
> +		return prl_sa;
> +
> +	memcpy(xe_sa_bo_cpu_addr(prl_sa), prl->entries,
> +	       prl_size);
> +	xe_sa_bo_flush_write(prl_sa);
> +	/* Queue up sa_bo_free on tlb invalidation fence signal */
> +	xe_sa_bo_free(prl_sa, &fence->base);
> +
> +	return prl_sa;
> +}
>  
>  /**
>   * xe_page_reclaim_list_invalidate() - Mark a PRL as invalid
> diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.h b/drivers/gpu/drm/xe/xe_page_reclaim.h
> index 5ccff46d1b4e..4ecea05b1f2e 100644
> --- a/drivers/gpu/drm/xe/xe_page_reclaim.h
> +++ b/drivers/gpu/drm/xe/xe_page_reclaim.h
> @@ -16,6 +16,9 @@
>  #define XE_PAGE_RECLAIM_MAX_ENTRIES	512
>  #define XE_PAGE_RECLAIM_LIST_MAX_SIZE	SZ_4K
>  
> +struct xe_tlb_inval;
> +struct xe_tlb_inval_fence;
> +
>  struct xe_guc_page_reclaim_entry {
>  	u32 dw0;
>  /* valid reclaim entry bit */
> @@ -42,6 +45,9 @@ struct xe_page_reclaim_list {
>  #define XE_PAGE_RECLAIM_INVALID_LIST	-1
>  };
>  
> +struct drm_suballoc *xe_page_reclaim_create_prl_bo(struct xe_tlb_inval *tlb_inval,
> +						   struct xe_page_reclaim_list *prl,
> +						   struct xe_tlb_inval_fence *fence);
>  void xe_page_reclaim_list_invalidate(struct xe_page_reclaim_list *prl);
>  void xe_page_reclaim_list_init(struct xe_page_reclaim_list *prl);
>  int xe_page_reclaim_list_alloc_entries(struct xe_page_reclaim_list *prl);
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 4f4f9a5c43af..63c060c2ea5c 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -209,6 +209,11 @@ int xe_tile_init(struct xe_tile *tile)
>  	if (IS_ERR(tile->mem.kernel_bb_pool))
>  		return PTR_ERR(tile->mem.kernel_bb_pool);
>  
> +	/* Optimistically anticipate at most 256 TLB fences with PRL */
> +	tile->mem.reclaim_pool = xe_sa_bo_manager_init(tile, SZ_1M, XE_PAGE_RECLAIM_LIST_MAX_SIZE);
> +	if (IS_ERR(tile->mem.reclaim_pool))
> +		return PTR_ERR(tile->mem.reclaim_pool);
> +
>  	return 0;
>  }
>  void xe_tile_migrate_wait(struct xe_tile *tile)
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.c b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> index 1ae0dec2cf31..dbd3171fff12 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> @@ -24,6 +24,8 @@ struct xe_tlb_inval_job {
>  	struct xe_exec_queue *q;
>  	/** @vm: VM which TLB invalidation is being issued for */
>  	struct xe_vm *vm;
> +	/** @prl: Embedded copy of page reclaim list */
> +	struct xe_page_reclaim_list prl;
>  	/** @refcount: ref count of this job */
>  	struct kref refcount;
>  	/**
> @@ -47,6 +49,13 @@ static struct dma_fence *xe_tlb_inval_job_run(struct xe_dep_job *dep_job)
>  		container_of(dep_job, typeof(*job), dep);
>  	struct xe_tlb_inval_fence *ifence =
>  		container_of(job->fence, typeof(*ifence), base);
> +	struct drm_suballoc *prl_sa = NULL;
> +
> +	if (job->prl.entries) {
> +		prl_sa = xe_page_reclaim_create_prl_bo(job->tlb_inval, &job->prl, ifence);
> +		if (IS_ERR(prl_sa))
> +			prl_sa = NULL; /* Indicate fall back PPC flush with NULL */
> +	}
>  
>  	xe_tlb_inval_range(job->tlb_inval, ifence, job->start,
>  			   job->end, job->vm->usm.asid);
> -- 
> 2.52.0
> 
