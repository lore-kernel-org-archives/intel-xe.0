Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3686C3ABDA
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 18:45:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B5D10E067;
	Wed, 14 May 2025 18:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mZ6iHfSb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60EC810E067
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 18:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747248351; x=1778784351;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lF1iQjOcas31r1W4g6dq/3UkS2QSBrRSw2fZEjnDCAo=;
 b=mZ6iHfSb0AUEcxh+dloc+MdOB/WMCw+YaYki9dJWyqLJ4OEVYrWebRmc
 jZyyGkkWCDTA5t9acsiI7KCnWJ6Lqu92wi8BNfmZskY29Xz/kPEj620Wv
 jgTyI4IoXNOdZgTV4glzjvbwCp6QbV1yxDtB5jvwUmPlUXS80LGV5+j55
 Hh3awtrJIVe/RJbKd/dHTY6yjsieWUzw2/EPVrgqgBa51Su/MFiK9kVB5
 ZTqctB+hFQlop9ixGtd/izCztFGa/0KStaBWZfYpv+N21P/ai+joV9R/e
 lkX6AjoLVAO/KcR+ULZKjFYAhEpcUaXdGZfbIHT/1EguDs+GiI31ByWwr w==;
X-CSE-ConnectionGUID: bKjtVWl5RaeAQiO2zDhICw==
X-CSE-MsgGUID: h9pZy1JKQ8i84oekgYLJyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="48273722"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="48273722"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 11:45:51 -0700
X-CSE-ConnectionGUID: hVTwk/rLRkWCobrjd/MDvA==
X-CSE-MsgGUID: BC2DmTntQO2sxwgfcYGcmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="142897541"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 11:45:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 11:45:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 11:45:50 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 11:45:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=luQg1Vbx8d/KHIhR/xmGCBqJN6Ia4ZIP1s9UvqVjYA853qOOMd2kQRMlvlaEh9E8hs6OrlvnCiCR8wpZOjSuQFcWBzzPmavuOFTetBEppr2F5pk4e0x5D7MkMYftcO6wYwsci3KGKTtyfxddRRgo33+YbUEXN02h2RNF1vm/b4Ll8ENzAERz1zSZ0AimtUbcbItsPa8ZZQVjSOqw3xicPHHhpscaiayrax0YdcltOE+dlRA8pw35eZMHMlu52nPclVuVqI98GiagSCSdcCOXccfIXn8S7gYIOcMirMLDCPwDxtZICZ4g0A98ri5w0Axuc4AYwD+m2syUkjsZ4NqZJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I8ikqDEYl1WYk9/WFSmNJ80YjJ0CR+pxGZd51xatJ0M=;
 b=MPExcxR8N3lLZQ4Me6XHagMUMFfiCRqFwMEULDCTr49cAUyGPVhzvAi+c7HCuUXWR0eD53I9d/3qq4V7aM97nyCHDxb0YMW2CmCe7wgvjeFNP7JMOZ6XosTuL8eu4iITF8LIgM3zyW6+ieuvvzrXok0I5GrvDz/YzqzqO1JM5Yy9ekjkFpgnderP1ZsJ7hvz3EZbe1aUwfXEh9fiQNHbVqFRTdZb5AztHtNKnzhGmE3K+EJN5t6G+ipwMA5jjao4pnItUV4fK99lNo+0AlZBPZBxEGsLKBzwbEhhJq9+KSnuG/c2nahNRJq7AiJ20zr26Clr4wASrglxylm8+MxDOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7789.namprd11.prod.outlook.com (2603:10b6:208:400::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Wed, 14 May
 2025 18:45:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Wed, 14 May 2025
 18:45:46 +0000
Date: Wed, 14 May 2025 11:47:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 21/32] drm/gpusvm: Make drm_gpusvm_for_each_* macros
 public
Message-ID: <aCTlMR1L6ickQIQC@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-22-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250407101719.3350996-22-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0136.namprd04.prod.outlook.com
 (2603:10b6:303:84::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7789:EE_
X-MS-Office365-Filtering-Correlation-Id: 594e1314-919f-4efd-0025-08dd931789f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QK0ufyhALSdG9Vy260RuY1v7xsp45Ksa84kOX/vNDeQkK1ruj8V5pvN83hrD?=
 =?us-ascii?Q?Ughb4QjEhGMxsLrI6OYQ50oMcXEpRdEn1oLxvKCXQZ6wkZLAbzWia2nBwR0z?=
 =?us-ascii?Q?8AzEMyBCWjHdsFa27qqARflAabUt6usEo2IYbuMxpMGG+xjfQa3YPrw0UqoR?=
 =?us-ascii?Q?P0Or2nsouW7vDCw3yoPZD+JItTJp+cl9Uy3if7tBndtF3/4gDmBBooHRpEPM?=
 =?us-ascii?Q?C4lDnR8b5vHPmpF1NPaINHkfMKeingnkrhu4lRtdLM13ILMBBzTYJtWWG77O?=
 =?us-ascii?Q?sJ9HLkqbyTJGuRZxdWAOXpHzK9U5asgjeZ71nVOVrmNE3aavHeiY5DhrRNK7?=
 =?us-ascii?Q?o+uHjmwsdEigH3FEAiMbw7Kem3jz3I+Q2SuJIiiUCvD7agTC1Bv7HtUoTV6f?=
 =?us-ascii?Q?OdnTLnblFgYpF3raywVG6cugFgZGi5WOhHCU5pW99L88hZZqCpvferVey9C9?=
 =?us-ascii?Q?A8HWQWAYNxccMWxlowTY56AymSAzfta+VXmEDLhEYzu52gB+FQTt4xXKfwi5?=
 =?us-ascii?Q?2NOt7HceZtWRL59JTNtgTx0pb0M6ThiSJF0NEyu5nBzbjOQulh6FHng6AC1f?=
 =?us-ascii?Q?rbnTMGmXwZ3CxsSqSEpLq0CWTnX02rgmC54BELPefXp1FV4TRBjxK5RzelwN?=
 =?us-ascii?Q?BJTUyT8JjSzHXBbtYCbiGJOgPmfRbgzPEWlBsfYBPkhoF1RbP4cEUpS6VAl2?=
 =?us-ascii?Q?eMDgz4MqvcmCUN89ylNGsgFQeeDwTCmo44Q0BwWDb29EPrqb4q2l4r1dcK3z?=
 =?us-ascii?Q?bx39RHHEi1c0/H69VDyVv92qRlwgbmLfTsuq7Q9e8gkQUWD8Y4W+6CdBJUqz?=
 =?us-ascii?Q?LiEwyGNS2bkCBOi9+Ckw3qf/WV9RxkNlYOMk5TE6dZm7DiFXAtRZ/o6bYeqR?=
 =?us-ascii?Q?M5PONpcg6To8cUN0GBlQeOdUy2JipsiN0DX/rr+LBm23g/MYqmo+WxoRHoYK?=
 =?us-ascii?Q?se6FJ5+yIfPOK15UraixX38zt7c3lcU48vCdRSoSFdQqbgCGB2po3QP6Er43?=
 =?us-ascii?Q?uG8hvx/HftGsOmt4lgHmlqqmM8xpDZMaMbzF75Z0JSQCeHWoCNj8ckj6gply?=
 =?us-ascii?Q?R22GiM84kfiv85n+WEEJAD3KL7sSe4NcfX8dYpM2wjgePscrr1LT0pWX9uv/?=
 =?us-ascii?Q?EkglMY/yTIL8FyKNmmxJOJFg0DCiBE8v4Y6AoAH1MJ/k6mk132GViaco5wad?=
 =?us-ascii?Q?EYyEmzXkp3qpBHq2kkdRnpQycFfUhorzBBXBZGSHOT7JJNFY3MccHp3gRxD6?=
 =?us-ascii?Q?6kYsj59GL/h/a81LjcVQTqgvXkh+sOWaTbuG+Ou6LO2BjUyCdngGq6xR6Hi3?=
 =?us-ascii?Q?YUzSAm0Pb/U6q7lvnyx7DkMOylHIBlmRXYcFsr/ZoNDLhxOzZqtln0eFxhte?=
 =?us-ascii?Q?RFwL4cqFE2sH9fm8AJj+Dzm37FmucLSEklqpZ4KxQjsFPdh80PMfhc84yqDj?=
 =?us-ascii?Q?g69n3GiSYfY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bnb1C67uSzW+Etwue6aD98aoXAeVyVLajezKeVkZLwT72IrzsIMXiV10l0rW?=
 =?us-ascii?Q?W4LTOMPBZ9ITY7T7mZh8TFZjNUpMqxVXt8aZK0TSuQDjrNBTNHOmbpDvn1FQ?=
 =?us-ascii?Q?gkYCmT790d9dPmPJNKTdtPDdRQmydkkF6hkxowHQipmwb1FlA155UzaIxwKh?=
 =?us-ascii?Q?JDPNfqvWI+2IALY741vP3HzyTsbzwukbeaANd81NouMQkXqswU6b8EPQwBp4?=
 =?us-ascii?Q?DqENmv/fKLaUMEezc029DirW2Cjl/vFFGUYR5M2pMxytt4fnqgcOWNsxrwLy?=
 =?us-ascii?Q?eqCW2oWb+qNOqvuXgMSYMXjxRQgyxfT5QZ0VyI0AJo2CWMaEcNQVB3Gxq0t+?=
 =?us-ascii?Q?pRsMU0lmzgrXlOQ/fE4+Hlngv6L6kCpc/awt9ACQXy9QnCepr+4rdKjDYect?=
 =?us-ascii?Q?8En8ezZHl5/Bq8voJgLhQo4CA5qvJtLVQwcFqRFwiFzusKnTgGinvOx68zo4?=
 =?us-ascii?Q?XFFjtYt92I/n1drHd3mkcRuRSY7IVaidKrml767sXQE67mhAQZ1G9qdijvO6?=
 =?us-ascii?Q?LR1Njn4Cacksz0fqAkvgbTWmllrDVzP+US0LGmokjnMid2KuDoiaFuphQQlx?=
 =?us-ascii?Q?+7O3MwPnFVTjmKGKlQwdjHlQWYUF0EMcAkHorpUYEcx31wUUipsntjuK9nNg?=
 =?us-ascii?Q?lP9u3P5MG4qqU7Z+xgrLTB2Ak86K9V3IZeYs8vd46eAw8L4+2yiaeoHCplQQ?=
 =?us-ascii?Q?tfB8isA+BnFiC0Kterglcgs03nH1xg/EMEwVDO2aKVDy0HiymjcTjBouzr68?=
 =?us-ascii?Q?MrGSRJK6Z+Ftj2nsALH40Q+xq8Pzxri2ub5BW6u29IT7Xclz47S9vPe8M9g/?=
 =?us-ascii?Q?RwEpyVVEraBrbqEb5oAlS/kya+12x+3w0vYxzDZy4eL3oDedPDpG00eiJm/B?=
 =?us-ascii?Q?Cf6ymv1LAV3V1Ci6+7o+PPF9hhnE2q9PUEuC5Mluc9aQEORBev0tgVigv4/0?=
 =?us-ascii?Q?59yBixdgsXL4sV3EXSypMeWqzbiSooK+5SMlO21Mmk8CshnfBvoIxDxz+jXa?=
 =?us-ascii?Q?n50ujRsO3plKmSuQYf0rv6Kevjk2rb/lb3XjyJifpeAFZlbn9a2/aJZQcDQm?=
 =?us-ascii?Q?hfls1zAJVvBLyOXDuN/Qf1G3eteQnYlIqC9bM4+xDN5p3SV3iNO/nm3vEsli?=
 =?us-ascii?Q?Q9Qf0Q0MixEPeitp6F+FeG4rbbkBHIa4sBIRt0LIoQqOBxtcMgf82Xd0sJ5P?=
 =?us-ascii?Q?HLDMeS7xihNtyNreFh5boGJjnytcSUwSPMAtrnH04HZ2bEC95LIMXlD7Wx/7?=
 =?us-ascii?Q?STICEfZgmoxX3i5AtrB0mhg1RGAzVbDBHb+Hbebe9f8mif+FESIu49Y6ncCt?=
 =?us-ascii?Q?Vr6aw4/Y8AsEn8RB2Dugf3buobljF4YGBCEzx7IjAhNTDjP9gZXd0ZPcFJnn?=
 =?us-ascii?Q?4z+PfFRcQVADCEu75lNGbFZzmK1/44JOLliOBw20Dfcl06mMsRe9oRfKNQf2?=
 =?us-ascii?Q?Q0qlyBWeG8bovGFdXOpIdLmromo6/2IKK12woTqXfa+q9GToVJk9OjpQuzi4?=
 =?us-ascii?Q?FjWSpS8pHAnqG4xTl9LMnGU0IffDqNAjzgdBNknAWpqSB/HTDWXGPKTai8Yf?=
 =?us-ascii?Q?k35pnLgfLLJg3UTaKM8qLobdyiwI4PKrL6DawswVZ6jbhJCgCroT0UqdDGl4?=
 =?us-ascii?Q?3A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 594e1314-919f-4efd-0025-08dd931789f1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 18:45:46.5753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sSDxfjZmIT2w1v49F5ucoKiWgs9Si/I9ar4YoHF3sSqJ+DmHs48PgjkDJuMOkizlBPeo6LJGFOHNofaTaeV+cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7789
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

On Mon, Apr 07, 2025 at 03:47:08PM +0530, Himal Prasad Ghimiray wrote:
> The drm_gpusvm_for_each_notifier, drm_gpusvm_for_each_notifier_safe and
> drm_gpusvm_for_each_range_safe macros are useful for locating notifiers
> and ranges within a user-specified range. By making these macros public,
> we enable broader access and utility for developers who need to leverage
> them in their implementations.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Assuming you have users of these, makes sense to make these public.

A couple of nits below.

> ---
>  drivers/gpu/drm/drm_gpusvm.c | 89 +--------------------------------
>  include/drm/drm_gpusvm.h     | 96 +++++++++++++++++++++++++++++++++++-
>  2 files changed, 96 insertions(+), 89 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index 149ac56eff70..09708eef1c86 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -391,97 +391,10 @@ struct drm_gpusvm_range *
>  drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, unsigned long start,
>  		      unsigned long end)
>  {
> -	struct interval_tree_node *itree;
> -
> -	itree = interval_tree_iter_first(&notifier->root, start, end - 1);
> -
> -	if (itree)
> -		return container_of(itree, struct drm_gpusvm_range, itree);
> -	else
> -		return NULL;
> +	return __drm_gpusvm_range_find(notifier, start, end);

My do you __drm_gpusvm_range_find as inline? Can't you just call
drm_gpusvm_range_find in public iterators?

Also I think rather than inlines for functions which touch the interval
tree, I'd leave those functions in drm_gpusvm.c - that is what
drm_gpuvm.c does.

>  }
>  EXPORT_SYMBOL_GPL(drm_gpusvm_range_find);
>  
> -/**
> - * drm_gpusvm_for_each_range_safe() - Safely iterate over GPU SVM ranges in a notifier
> - * @range__: Iterator variable for the ranges
> - * @next__: Iterator variable for the ranges temporay storage
> - * @notifier__: Pointer to the GPU SVM notifier
> - * @start__: Start address of the range
> - * @end__: End address of the range
> - *
> - * This macro is used to iterate over GPU SVM ranges in a notifier while
> - * removing ranges from it.
> - */
> -#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
> -	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
> -	     (next__) = __drm_gpusvm_range_next(range__);				\
> -	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
> -	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))
> -
> -/**
> - * __drm_gpusvm_notifier_next() - get the next drm_gpusvm_notifier in the list
> - * @notifier: a pointer to the current drm_gpusvm_notifier
> - *
> - * Return: A pointer to the next drm_gpusvm_notifier if available, or NULL if
> - *         the current notifier is the last one or if the input notifier is
> - *         NULL.
> - */
> -static struct drm_gpusvm_notifier *
> -__drm_gpusvm_notifier_next(struct drm_gpusvm_notifier *notifier)
> -{
> -	if (notifier && !list_is_last(&notifier->entry,
> -				      &notifier->gpusvm->notifier_list))
> -		return list_next_entry(notifier, entry);
> -
> -	return NULL;
> -}
> -
> -static struct drm_gpusvm_notifier *
> -notifier_iter_first(struct rb_root_cached *root, unsigned long start,
> -		    unsigned long last)
> -{

So make this one an exported function I think.

s/notifier_iter_first/drm_gpusvm_notifier_find

And adjust the arguments.

> -	struct interval_tree_node *itree;
> -
> -	itree = interval_tree_iter_first(root, start, last);
> -
> -	if (itree)
> -		return container_of(itree, struct drm_gpusvm_notifier, itree);
> -	else
> -		return NULL;
> -}
> -
> -/**
> - * drm_gpusvm_for_each_notifier() - Iterate over GPU SVM notifiers in a gpusvm
> - * @notifier__: Iterator variable for the notifiers
> - * @notifier__: Pointer to the GPU SVM notifier
> - * @start__: Start address of the notifier
> - * @end__: End address of the notifier
> - *
> - * This macro is used to iterate over GPU SVM notifiers in a gpusvm.
> - */
> -#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
> -	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1);	\
> -	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
> -	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))
> -
> -/**
> - * drm_gpusvm_for_each_notifier_safe() - Safely iterate over GPU SVM notifiers in a gpusvm
> - * @notifier__: Iterator variable for the notifiers
> - * @next__: Iterator variable for the notifiers temporay storage
> - * @notifier__: Pointer to the GPU SVM notifier
> - * @start__: Start address of the notifier
> - * @end__: End address of the notifier
> - *
> - * This macro is used to iterate over GPU SVM notifiers in a gpusvm while
> - * removing notifiers from it.
> - */
> -#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
> -	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
> -	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
> -	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
> -	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))
> -
>  /**
>   * drm_gpusvm_notifier_invalidate() - Invalidate a GPU SVM notifier.
>   * @mni: Pointer to the mmu_interval_notifier structure.
> diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> index 8093cc6ab1f4..8b70361db351 100644
> --- a/include/drm/drm_gpusvm.h
> +++ b/include/drm/drm_gpusvm.h
> @@ -491,6 +491,20 @@ __drm_gpusvm_range_next(struct drm_gpusvm_range *range)
>  	return NULL;
>  }
>  
> +static inline struct drm_gpusvm_range *
> +__drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier,
> +			unsigned long start, unsigned long end)
> +{
> +	struct interval_tree_node *itree;
> +
> +	itree = interval_tree_iter_first(&notifier->root, start, end - 1);
> +
> +	if (itree)
> +		return container_of(itree, struct drm_gpusvm_range, itree);
> +	else
> +		return NULL;
> +}
> +
>  /**
>   * drm_gpusvm_for_each_range() - Iterate over GPU SVM ranges in a notifier
>   * @range__: Iterator variable for the ranges. If set, it indicates the start of
> @@ -504,8 +518,88 @@ __drm_gpusvm_range_next(struct drm_gpusvm_range *range)
>   */
>  #define drm_gpusvm_for_each_range(range__, notifier__, start__, end__)	\
>  	for ((range__) = (range__) ?:					\
> -	     drm_gpusvm_range_find((notifier__), (start__), (end__));	\
> +	     __drm_gpusvm_range_find((notifier__), (start__), (end__));	\
>  	     (range__) && (drm_gpusvm_range_start(range__) < (end__));	\
>  	     (range__) = __drm_gpusvm_range_next(range__))
>  
> +/**
> + * drm_gpusvm_for_each_range_safe() - Safely iterate over GPU SVM ranges in a notifier
> + * @range__: Iterator variable for the ranges
> + * @next__: Iterator variable for the ranges temporay storage
> + * @notifier__: Pointer to the GPU SVM notifier
> + * @start__: Start address of the range
> + * @end__: End address of the range
> + *
> + * This macro is used to iterate over GPU SVM ranges in a notifier while
> + * removing ranges from it.
> + */
> +#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
> +	for ((range__) = __drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
> +	     (next__) = __drm_gpusvm_range_next(range__);				\
> +	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
> +	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))
> +
> +/**
> + * __drm_gpusvm_notifier_next() - get the next drm_gpusvm_notifier in the list
> + * @notifier: a pointer to the current drm_gpusvm_notifier
> + *
> + * Return: A pointer to the next drm_gpusvm_notifier if available, or NULL if
> + *         the current notifier is the last one or if the input notifier is
> + *         NULL.
> + */
> +static inline struct drm_gpusvm_notifier *
> +__drm_gpusvm_notifier_next(struct drm_gpusvm_notifier *notifier)
> +{

This one seems reasonable as an inline.

Matt

> +	if (notifier && !list_is_last(&notifier->entry,
> +				      &notifier->gpusvm->notifier_list))
> +		return list_next_entry(notifier, entry);
> +
> +	return NULL;
> +}
> +
> +static inline struct drm_gpusvm_notifier *
> +notifier_iter_first(struct rb_root_cached *root, unsigned long start,
> +		    unsigned long last)
> +{
> +	struct interval_tree_node *itree;
> +
> +	itree = interval_tree_iter_first(root, start, last);
> +
> +	if (itree)
> +		return container_of(itree, struct drm_gpusvm_notifier, itree);
> +	else
> +		return NULL;
> +}
> +
> +/**
> + * drm_gpusvm_for_each_notifier() - Iterate over GPU SVM notifiers in a gpusvm
> + * @notifier__: Iterator variable for the notifiers
> + * @notifier__: Pointer to the GPU SVM notifier
> + * @start__: Start address of the notifier
> + * @end__: End address of the notifier
> + *
> + * This macro is used to iterate over GPU SVM notifiers in a gpusvm.
> + */
> +#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
> +	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1);	\
> +	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
> +	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))
> +
> +/**
> + * drm_gpusvm_for_each_notifier_safe() - Safely iterate over GPU SVM notifiers in a gpusvm
> + * @notifier__: Iterator variable for the notifiers
> + * @next__: Iterator variable for the notifiers temporay storage
> + * @notifier__: Pointer to the GPU SVM notifier
> + * @start__: Start address of the notifier
> + * @end__: End address of the notifier
> + *
> + * This macro is used to iterate over GPU SVM notifiers in a gpusvm while
> + * removing notifiers from it.
> + */
> +#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
> +	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
> +	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
> +	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
> +	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))
> +
>  #endif /* __DRM_GPUSVM_H__ */
> -- 
> 2.34.1
> 
