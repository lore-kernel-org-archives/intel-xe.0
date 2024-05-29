Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA0DC25B75
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 20:49:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EAF510EB34;
	Wed, 29 May 2024 20:49:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y+xkPG2X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5920110EB34
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 20:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717015769; x=1748551769;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bo85H24Z7mGyJuMYKBLP7G1Zrz2KoDVLzyJdHjjVW3k=;
 b=Y+xkPG2XNYxRgCxx064t5wtQz5r+LU06OMUAsokKIiPgfwQS1/Bu465L
 7I50IY+FFeiqGaBE2M49PVgieM+OiSFR7pYTAz/SV0llmRQO/kHsHqNWT
 cPDKZMiTss5rSIvE8oruaIJzFG1u6unAun5Mjsm42P/4sO0rmk35ljfRD
 P9v7V+BuLBE9yc5W/6KHuDtwvX0fDM3HxqD1cGLK2xqC1hmLtIYrW1J/y
 U7kRFlKTzJdL4uqSlN8S5A5Ji5Hh8cdVNuzkGTmEU+N3SosPIRSazaQlv
 hiRm/n9dWkt9Z+nAok71wkxalM9ZnJ34FmlQsTtvZvg8x+01rAfj8jkNl Q==;
X-CSE-ConnectionGUID: A/O2LRkrSWWDra9ZmcMvIg==
X-CSE-MsgGUID: +qV+sopNTleV0XomsFxsrg==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="17238518"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="17238518"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 13:49:28 -0700
X-CSE-ConnectionGUID: 7Tj+b84VR7yqTXjRVcKQww==
X-CSE-MsgGUID: oLxgYj8FQEy7D7OITJ6JmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="40477485"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 May 2024 13:49:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 13:49:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 13:49:27 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 13:49:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hizDBH/HJkT54TpZzCnl/eErU4gzOPLPU1yRADC09bdwRjZs6i8P0M6zY7+UuhZNIyMnB9njMwtO+4MY/V3BD8dRFzkHjS+cVPGDvpF8N1chJkVh7tD6Dx/etBohXQKngSGyoPnRMzfq0R45PhTvSfQ9FA2wEsPkYVtKYAqj8vNxPjjdHFgQ4DmW9Pd/fX8sb6Tqk5sYoPtCLp8W9DL9C0TWr2Av8TARRoLSOS/uhYSLhfxLs7x1upIhBHg5O9Mst92bxBX2a5kE58ybneM7frtH6am6FGqkkBOCzYd2uXoxOqf2Y0qo4/SiqHKDT7DeMWV2rKzrP32G5ygNbPtP2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNoKPI/N0zVmhR5+JlNRY3ZaqdvSmzbtk2li9EdprbY=;
 b=cI8jLz6rTq6qeTFtgOkwCoZt6nYAW18VrAQ+k2qXn9rcXFj/kF0XIz/ownf1pRoV8mWlk5Py8DajUWZwL4PbW5hguadL2ASXyRhD3x1xOjinBT+Yt4ZAq1Rz1KiXEMLhxWKOT8NxhLpNdl1tueRl+9GOmBlxsQuiUYIct3R4eO8CK7ZzicLdEle2uimM7dTxKaaNwyw0/Kpq4nBShFqPeAnLm82DNYU1/g0kqYVySqcO1n7W0/rDj7mqMSal+ga5CzbFhvtPb0yPGFP1AfXSDadVNbIXmItHy0U228KMmUSCOrT6MZXIQsXUfOgkDEb2OmD0Z2LVcyLrC0G3HorgTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7591.namprd11.prod.outlook.com (2603:10b6:806:32b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Wed, 29 May
 2024 20:49:23 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%4]) with mapi id 15.20.7633.018; Wed, 29 May 2024
 20:49:23 +0000
Date: Wed, 29 May 2024 16:49:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: Re: [PATCH v2] drm/xe: Remove unwanted mutex locking
Message-ID: <ZleUz3Ep14W6LRJs@intel.com>
References: <20240529183319.19731-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240529183319.19731-1-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR03CA0119.namprd03.prod.outlook.com
 (2603:10b6:a03:333::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d6b8047-0310-4ed7-15e6-08dc8020d207
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BhxAILqFXjeBidTjWDsXbtIAQGWKq3HNBuTc/ApIUUL2LH3JMVvTPoUdzXmi?=
 =?us-ascii?Q?xUE0vVCq3Pz3dnO1X4Zc59ZyO0fiC7ox6kKY+1Z/k2UNPYvUkbJWrWHHn64v?=
 =?us-ascii?Q?GFKmSDq9LOCNeDTfCJz2XDTDYBJpvqT/eRujt5vSYkebx9yXk/7QORviPfGT?=
 =?us-ascii?Q?Ci25dajzuMsXpabw+EhuBLZUP/xXDqkM3hvZPiukJq+etrGeS/rBwdJ9IIF/?=
 =?us-ascii?Q?sxSuhcJaapEJP7KLtWfmj8SRj9J2fa7pAXpUuneoKdIM+11L/4Din2XXJJY9?=
 =?us-ascii?Q?iYh/FZ60FDTViGwVn2TalZpyT0ovP7w6L8H/2juHehsQGgVw/AHjPttLAfBZ?=
 =?us-ascii?Q?Shn8EDmKsedtLYwgVoe8d4xXB1sJcWCNm9QqmqV5xJzzhipHETcmDMTwOx7G?=
 =?us-ascii?Q?Tlt56koJPFO2sf21aOXj/2l9sG61Jd9/RNXkMCPg8Rxl1rF8qK8lWVVx/ZGL?=
 =?us-ascii?Q?ttQuaKP38/ggW9L5LXP2xGS8R6h1Xrt7uswPtcSu8ZX/FzeWE3ufWXKyOTqU?=
 =?us-ascii?Q?pPSQiwDUcOAwmdr90tc53kVymK0JrBjTihmjNr2dPAIRsmVGWSybAq69qz2H?=
 =?us-ascii?Q?wliYgNruTkq6AfklVDiCrengq8EZRQ5F7Y6SYO4FpODx4IJ+gLUBKjgt9zXW?=
 =?us-ascii?Q?9N0WbuxJ37fhSJnY3rrCG4PMqyWZ8B1cff/0DWZk/0lO6MJvKgiHdDMleQ2F?=
 =?us-ascii?Q?d5J4j/t7enZEgfIqpv9+sZJ4cLQ8nYKhDqs8abKMk3oEyYA3BuavrDcbN4dC?=
 =?us-ascii?Q?p392ENtGb61YVyMf5R4PjfFiRxm/4xstnots6j8kNMsULpemhg/dOEO3FH5J?=
 =?us-ascii?Q?Ps5aaZwLnjHsmuR4s70BrWs30nYFq6JSYN5SFposH0f6v+ddUQfxp+mrEPE5?=
 =?us-ascii?Q?NWHxbxH9WEIT/4YY5pUPWtHyG3EroKCqcpP1OxqjqLaJQ7FuIBz5azb7b3RA?=
 =?us-ascii?Q?L+YH5oGYIWcWiXSn2hByehplfKeHibfcNax3dWnYBcnVP/w393jfFAvsD7Kd?=
 =?us-ascii?Q?Nvo8yB6trfi6qJ+lCT9oqRJv+Adc2r9BsymqwSoDUDbwFe+LxEPmbTkvI1wx?=
 =?us-ascii?Q?yT4Kg2aT2rDxXW5vavxeBjrEySam1tCNcpCXnXvlBtqWZ5994UzaqhwYuvxg?=
 =?us-ascii?Q?5SK50dhq/v9MXz9trlSc93XDu49Vq28LowjltXrkevwVxZQ1vw0f1yYN2cFa?=
 =?us-ascii?Q?KWuJFGk9UwC00znsVfS3MeS8KdwN2+lgPMAmwLH5qaJ29gn96W5aNzgdcjbD?=
 =?us-ascii?Q?8GjfYYkYuE18369gHtj6YwxiIfmZbi6tjhUveDwP1A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BxNGVaZzGO08Hfo5PC5zZ4SshGWq+O7VMUlBPXLar9Zs9Sd6fQoB9Vi6hlEW?=
 =?us-ascii?Q?qdWevEGvQwZBSh0GVb8O8e1BUHPDYTLYwtJoNHAnoTvuAu5qvViGOCZTddel?=
 =?us-ascii?Q?vk40zzZ/l/0nXxspT/L8ymSHnLpy4jepbvdh3PsVW/aJ86NzsDyzb5OYX6Wk?=
 =?us-ascii?Q?NQI213ZipwV75PZ3kH9UHg/7+CpMq4Dovi1Zl712JceKhqHsl18DSZS9e/Jd?=
 =?us-ascii?Q?0Z5b+4aFsch51rI41P8fvw/Uu9NIHmOb2am3jtZCYILPQGK5Q8/fuBPaaJEP?=
 =?us-ascii?Q?YECLbfWx0SeqUr6htrUIkkktT3TFPHbhE65bVDC35MVrGVUnYLpW5C9BKAQp?=
 =?us-ascii?Q?l/gclV3fjSYwX5J82uxc/tqKERTqCh6iVN/VI6NZVxey3vWO73MNYvnqNxwc?=
 =?us-ascii?Q?LJaTaudEnN6yT2sNVGSSxUwJ1ZETpZqfY+3hfSwxQyrkdA2TS7Azccmjrukd?=
 =?us-ascii?Q?hkQWUGVrhyWKoS177I2wm0ZXUsFOO4c/CU5W9q+ccOjIacbuGBvAoJJJFSfX?=
 =?us-ascii?Q?taySRlYkdAd79OkkSOmwUHiQ8j9yYAuoFbCcfKD7RhvoRA6B0uE04Pxd2xgf?=
 =?us-ascii?Q?EyNeDwwnw4ldU2CAj0GWimAgUHMJcT6mHWw8LcULp8PAhWnwuQ99iH6CFWrY?=
 =?us-ascii?Q?ur1RWpLwPSdAG6cc9jz2S0KfAMmjEzA/3C4g5PHiefHjdqA7hd8QvSpwGbud?=
 =?us-ascii?Q?WF9YLk20BG5edNos861X1PH3PD13tYeVJd0gS8z/IKP9doBh7AIoO8DZi++h?=
 =?us-ascii?Q?8QXrHpWOq7u3ba3KQutYEil7VywxqDIQG6rONix94hpBvRBOhDuP7j8Jtf9+?=
 =?us-ascii?Q?iO23PBuQlRBK7vAu829A+ZqCY18QZnoBqzeGPbJ/05ZRPXxtSUQ1xLlNB7Yl?=
 =?us-ascii?Q?DJfveiOryh4wUqyverWaCrKO+Kfwa+Qq1CtLcVISRMmR50480pvgBkXHdLZd?=
 =?us-ascii?Q?icvY94P+fLbqgVtPgQbAc2B5BYfab+9LSJur3AaiI0xtcIAep3saAkJdJL1B?=
 =?us-ascii?Q?TQkb/bWUo/YTeG+PYFTrg6FVisX03rzMxwsY7YH/eeST9bIwFsAbzA8QQUjf?=
 =?us-ascii?Q?QrwcaH089WwqN3EUQ6ou+TFJD/Y5S3xs2ql254J3GJu+ft3+A3Y2xTa3UgF2?=
 =?us-ascii?Q?4Vn5O9UdRlprCaG/te+xad3GSCb1XZ5IoWlDPnuu/BcNFUWruFcXAGt1rJay?=
 =?us-ascii?Q?rn4AErNV3XFBVmneU566LWASJfELB2EM2sqN/QRuckHu+64Ys4cgNz3k6Pvx?=
 =?us-ascii?Q?BRr4rLWnVpmLdVNWuZXQc03YWlKvv3hD4RO6GYWr5X070s1hSO1b8LBuRTP9?=
 =?us-ascii?Q?Lpkf8h1AY3spFRGK0rk1guiQwiB5OW2NfGZuFwOc22UrxzktpdKxTI98/Pil?=
 =?us-ascii?Q?H2pBwHH64zYlScv7FNGVy/LwfWLltGSyTOeXPtvonjBRRGKUMq7V6U7DKAz+?=
 =?us-ascii?Q?BAs3CxI3WPV2/alx1swZ8wmhJ2jpHqspPFOzqzGMLiLfls3Egcgwc90vN5M1?=
 =?us-ascii?Q?9Igf27NsvLnqI76/65mpuoY5weP5KfOdIGwlqI1gqvoSPQYAnvPxoChHgh8g?=
 =?us-ascii?Q?6OBZUBrz9LkYMVaOyuCAgCXiFft+RyI94dPKl+xP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d6b8047-0310-4ed7-15e6-08dc8020d207
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 20:49:23.3471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7eSo5SI9VMDMLm7aoxp/wuyFsn/qmTxsxn1tSYtcIw/hqn4BBSFlvDS23Jq7bq5O3Qou3cJvlnttXylNQXRrHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7591
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

On Wed, May 29, 2024 at 11:33:19AM -0700, Niranjana Vishwanathapura wrote:
> Do not hold xef->exec_queue.lock mutex while parsing the xarray
> xef->exec_queue.xa in xe_file_close() as it is not needed and
> will cause an unwanted dependency between this lock and the vm->lock.
> 
> This lock protects the exec queue lookup and reference taking which
> doesn't apply to this code path. When FD is closing, IOCTLs presumably
> can't be modifying the xarray.
> 
> v2: Update commit text
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index f04b11e45c2d..4cca16f2d4ed 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -96,12 +96,11 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>  	struct xe_exec_queue *q;
>  	unsigned long idx;
>  
> -	mutex_lock(&xef->exec_queue.lock);
> +	/* No locking needed here */

could you please expand this message here to avoid git-blame+git-show
when trying to understand 'why not?'!?

Thanks,
Rodrigo.

>  	xa_for_each(&xef->exec_queue.xa, idx, q) {
>  		xe_exec_queue_kill(q);
>  		xe_exec_queue_put(q);
>  	}
> -	mutex_unlock(&xef->exec_queue.lock);
>  	xa_destroy(&xef->exec_queue.xa);
>  	mutex_destroy(&xef->exec_queue.lock);
>  	mutex_lock(&xef->vm.lock);
> -- 
> 2.43.0
> 
