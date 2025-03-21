Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6E6C28B30
	for <intel-xe@archiver.kernel.org>; Fri, 21 Mar 2025 00:22:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2F710E04C;
	Fri, 21 Mar 2025 00:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AUan87u9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD1CC10E04C
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Mar 2025 00:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742516566; x=1774052566;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cic8rZ0jjGluHMk7jtyhfoo4coJRKvMLdxU4/kkIe0M=;
 b=AUan87u9gqVMRszbihQHI9WWkcEUIuN8CZnRnik7DTqakR+Zlv/EuGbd
 7mqe5UjnedyBF5vcx5lv8Y79DjN3B4jnIY6I6pdNyfvrpbT1pB3dkC957
 2B9OkA1S9CwqiHyKmwGYyBJd6wT6SXpyhAy6erT9caCIOE2LjfAVAvWpk
 D5EeJw15yBRJBsZGUyW2pMr8AOANy3fsQ0NVuHbAnKhfqakNsuRD4/Vhp
 FepSlsXjF0MQnUmWXjUnbZvuyLlGHFea+oo93KllnzmzxE9GdE1ZBqBq/
 kfLqhJ6Cm2W2sRniuEEEf82KLFwaJIeFCE6hNJSUAlLviTE0FahAN2B7A A==;
X-CSE-ConnectionGUID: C8Z54GDwQx60Qch7JxZdlg==
X-CSE-MsgGUID: /MlVwE+IS/K/v2oOxYyl9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="61172511"
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; d="scan'208";a="61172511"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 17:22:45 -0700
X-CSE-ConnectionGUID: D7VJ8aQIQAuBnBNyiYv7Ig==
X-CSE-MsgGUID: 4owY/aXKQYerHEaMK+d8ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; d="scan'208";a="128081998"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 17:22:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Mar 2025 17:22:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Mar 2025 17:22:44 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Mar 2025 17:22:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Atu5I/u/+it1NpzQXPEh48+VbNBU8/Kqv2mIj2W6rkZx88j5cEYsHsQry5Ff4hgBemjsLOndzPkXHO+chLIVVSy3waHs85pu4UM+vYavNC6RxajuNant+v65bbmj4UpnSBScV6Yf+Ea2XoekzxhQqdV0aVeCBRd9ylXmYnmv1vkxXO9/ADpqk4xanCtGkJmEwgFEPapXfF44dx8e+7f/24jxkl5wh69hl2JzUlhKwTpBEN7G7/Q//oC9LTj86FHnZf2AnB9NZ0Ty0RCaXym/xintLANJWad2yTR6Ns1tnySbs/aoKeuDYDH5dVgWPOrf1zWjDJloaFAYW4EmDLpzmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPgsFEWLWwZPPMIY6KPZS4zKdMK4BY7fSvEuMbJAzCg=;
 b=KJ6gBIznr/mwDpOf1B86Mduc47QLWZAR5ySve4I+wkVFvyQtzO324/a7/jrpIPAjLtQxkXgthOt0UFB9RLBIrC1FSAxHRq+b1nADkaR+i3i8/2LLtLZviUIlOehymIVh9wpRmJe9cnVmKuopprenZNOd/WCsEllwqe26zVUHNt8H2NtQulbknNu95l6UqOu5H4RdMG2cFng1sqkw9Pod9Na4xrNjpKVgoz+waMAIPVrqZktBxy+tRM5ED3b2vGMRMfK/umBO8XbR2EkBNICRyexhbUQI8e91Xnb8YBLoJIfMdQg4+uYg//6MaAetKjTVTxeaWdzBnmaBd2zvOD8fvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4605.namprd11.prod.outlook.com (2603:10b6:806:95::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Fri, 21 Mar
 2025 00:22:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 00:22:00 +0000
Date: Thu, 20 Mar 2025 17:23:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe: Copy cpu_caching when importing DMA-BUF.
Message-ID: <Z9yxb4APx5W/eu0e@lstrano-desk.jf.intel.com>
References: <20250320211519.632432-1-dev@lankhorst.se>
 <20250320211519.632432-2-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250320211519.632432-2-dev@lankhorst.se>
X-ClientProxiedBy: MW4PR04CA0189.namprd04.prod.outlook.com
 (2603:10b6:303:86::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4605:EE_
X-MS-Office365-Filtering-Correlation-Id: b55da002-77c1-44f1-a420-08dd680e65cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cUPovxlPEMaUyo0AKc1sm9TLozupk8SsKpeG5n/NxrVpBKvyQzADuPFDbSmD?=
 =?us-ascii?Q?+nglxycTFAwO5G8EkTr/zewEpENm/oiXX+hF3y7VfwhVcwcon3VegC/Y0l8i?=
 =?us-ascii?Q?gutLvHFHHzru9xZo/YSc66Pf3ucD3lNi1oEZANVoiu6uUCeSk9ltvTyi4EXi?=
 =?us-ascii?Q?NfXF7cN9++W1GdWMsDbM1eY4A6+ceR/bveACdPpceYvpF8lKQEkMjvVA/fWw?=
 =?us-ascii?Q?Lx0UEsswqtM7G+/FTBI7qdDyRtDUDLgddJVjInr/28pLbUaDCit5FgIhmshW?=
 =?us-ascii?Q?nnMsvh5uIZghvaps0UNjlu9BlWu5Hc487kapxYHSRJSRwmTWy2zMUeJjRfr0?=
 =?us-ascii?Q?URXEvcsQEIbCoj2f7xY9cMXdokPjD42qUIsfu4DJTshnze5vf2nm+y1OUrTe?=
 =?us-ascii?Q?ESKBFGaYerrP1CgrRJJeAUICLcKyWLiKMQ4anHwI/eTymCspi726GOxHSWhI?=
 =?us-ascii?Q?aX/jXh0mBWk8ukUuZf/daZflX2bzu2t4ZNB75AaDCviaXfH/NnAtd4RwvRtk?=
 =?us-ascii?Q?4EbR+S+5l6xCP6aZXBAZ5Lif6kfEM8hh2K6bX4040Qhi/iAOM1c4l9V/gWoO?=
 =?us-ascii?Q?gkDUCEjS6Wbc5ymg9W+AAGZ2Tg+rra0DK4YwP46WfYn3yN3DbvFLss2Apuqa?=
 =?us-ascii?Q?FfuHJPAIpgPsYyEAymYGKBgK4NFMMibHL2LpXEl/mLicX7oSaGyAYR7WhP/d?=
 =?us-ascii?Q?IKhqdNlSOTF2zk2nb8/b1h5/93pQk7Mk6WmEAGurPBvpxbRSMJC96koUL8No?=
 =?us-ascii?Q?xDU75OcTBjcRhTkb1rdgrjA+jiMweGiroA2uyxR7LUs9nBasBpMLTHdi/sXm?=
 =?us-ascii?Q?0CzbxaKKzV8GeQt0ziBdhe6YH+ODwIltZEbLP+WIgokMWicwxRYrDqYimu4e?=
 =?us-ascii?Q?80RQy/t7l5jKq4HMAONI1oBkiTxePu4ydGxRsqjTwDSMD56veVxYOH6wSH0b?=
 =?us-ascii?Q?XaA/PFpHcJMyovO5ioyqVaAuqM4LylH1S33n94DvdPsExRa3VznyR1zHa090?=
 =?us-ascii?Q?vB+vyh3sDprLujz3jfVmhWLG+ngy5fRcLqJim/W76zpQTDbGcFqBqwdWE+HF?=
 =?us-ascii?Q?D9YfB3ERN4sQNuHUhJebwt9gEJHHXseh7loA0zUb6x0UQJgtJolYEGBzHjuj?=
 =?us-ascii?Q?RoNAILJfbOCYgBDAXB4FmY+mvb0cCYxRrWStMBs9d6znxr8HcCDOn0cW7WXp?=
 =?us-ascii?Q?JrR/MhkcudRVNLmS13ElrvbnVkC/BHY4FlRJ76/Qo1Z/x/L6P++G9gWc6MCk?=
 =?us-ascii?Q?+ykzCPg62+13a0y6MhVYJb+CaWt7h9w8+h4qSSvUDz5+yjh6Z/V/j0T53280?=
 =?us-ascii?Q?/W5WYSbUAeLdXJx3vqUGGSJ8KIIQvmXxUNE4QEwAqfNm8rYF8OnYKDCOmXVw?=
 =?us-ascii?Q?wayjXBprp91UHp+FJNoMTYhmqOK9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J8v6IjWNFU146IvH1MHRkSC9Ws0sVpBMroCCkqfLWte4Z3c43rgn/FPhXGd5?=
 =?us-ascii?Q?qnwK57IgY0PuBeFe7XncUNAoIEpiJidgS5st6xntpBXm0lZCOhHf+WiOLode?=
 =?us-ascii?Q?7a08L8W2k1GMz3vOyi5+bypnP/dx9JxKA4vXigyfX/B3ucfUSEj95PMwLwCb?=
 =?us-ascii?Q?8tHQ3IPKvQO6LGGoXbyuOIFHz8PthDlHtfkE5qJZhmYT01AEdnA6A8QycMje?=
 =?us-ascii?Q?NvHx7q7Za9L+UlfEoQvG+Bugy9prveaUM1tWUCbN5xh0tZot5/fHHKHri6sN?=
 =?us-ascii?Q?liDPw1AsT2uitGlBpyy84wiw2Vog42k6u1UfYNa4eSAOC6nH60SnZkcPHcJ7?=
 =?us-ascii?Q?f8A86oV7e/1W1ppalrxXK5/utiDHbJNGLZL22OVvXjAgLhyNDNYhMauzM3WI?=
 =?us-ascii?Q?85S+Zdptj7dK1+hs7uToRl1zouYKME2j4BLNitWKLfqaK9571bz4ykctvoDG?=
 =?us-ascii?Q?09TP+wMJZZVHa26QdyRE0UYUwYkpkMaMidJysddRJ1x6OaxRLoWhFigBXS7R?=
 =?us-ascii?Q?PwNx3dm++2xdZVcbVzg7jrOJunIvfdIQsX2FWDp+CXqzJz6921GQyApsokhP?=
 =?us-ascii?Q?NE6RGXzdE7wmyt6OkrQZdh8su6h9SMqNL7AM1KJEjDvmFYenRE84fS/PaAYa?=
 =?us-ascii?Q?03mkim+Nf/ZX0fxRP6YfoNAh35VNvrLdK6ZT6YAKLp/73K8zu8LFtm8n+x0h?=
 =?us-ascii?Q?u7rfhKH0Shwy73ka4jh2w0fr6JfUPz2HuFVFYG+R4zJDJtuXW9MxMVH8rI9F?=
 =?us-ascii?Q?TdynWJRcKkSM0luV3cNlK2mqwyQvsvGDUZB6zJqYBLy7cVaxXCoVseDyA2ku?=
 =?us-ascii?Q?ErIycbdlaxlbgkLGy3Y9VbuiEX22bo68JU5aYRpTYjYoVJZA6sl80H4l/B3J?=
 =?us-ascii?Q?lkV6caVi2Ju2GjP2pKiA386yg8mzyAmAsVK3WC1Y984JuiL+7TS737AMCthd?=
 =?us-ascii?Q?p3W/WiATLiQoJisolYbW9oPd+hyKWLts+snEkN5LqtXeyR7ap7rty5yc91gA?=
 =?us-ascii?Q?scru8YfTEz8mo6CNfkQME+XxtP1L7rHZ2aHxQh5JAtJAPiV13besigZKVYU1?=
 =?us-ascii?Q?5D9vOp0uc5sZsB9yF4NIAken5bOfMNWvHob6+cTcC02hLnc7WDhmh6OUYpfj?=
 =?us-ascii?Q?GKpSL1wtMPiE9s48ocD1XxSgsGPTCZW1Ubehu5fq4lXT+EdxSzA3LEteXT72?=
 =?us-ascii?Q?qjPxeVuP6aoiBfeefFOU6zh6jIYwyTIw6tLvWdLMKul9c/7587Bt+grnECFS?=
 =?us-ascii?Q?pfHPciLVxeNdQv2mpVXDv73D1fe0UOrBjzoKrPmm7ABGhw2P3VsOXl78xoCj?=
 =?us-ascii?Q?WNaGHQ5ej53MJa6V+TFJvVMigKg7PYu9/i1wDZUQ85Jl9x6uWMm4YgNHposc?=
 =?us-ascii?Q?KG4kL8N1wak8SHdB1mNvaCcXPH6mFfL5ZNQFzaLEQi5g9qZmWvus+unJh3+B?=
 =?us-ascii?Q?B1Lo7MsnudULB0uzOST0HC9ZUNKljtBIBHsv1KZKai0J4Qy4jacn6zjwusL8?=
 =?us-ascii?Q?PQCU0TQayK/a7XnJLPe5MBzhQx4f8GT4SzccGPB11Ya63i7MsG3flnErvq1Q?=
 =?us-ascii?Q?W+wOVtpHyUFfENbhrOmMRn0ZZQ2Mp/4/7DW3cW8vnpzqhhDJ2RSKknftHcSP?=
 =?us-ascii?Q?OQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b55da002-77c1-44f1-a420-08dd680e65cb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 00:22:00.5123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZXIw5xnJs9yOW7uFbPAT1QSVqHtiET/WUr4uEK8wLziKn8Cq0eweuuhIyX9P1Oc74dBxSYnAte6NCn5C3pX4pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4605
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

On Thu, Mar 20, 2025 at 10:15:19PM +0100, Maarten Lankhorst wrote:
> When testing xe with P2PDMA DMA-BUF import,
> VM_BIND was failing because cpu_caching was not set.
> 
> Set cpu_caching if available from another xe driver,
> to allow uncached VM_BIND on imported DMA-BUF.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_dma_buf.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index c5b95470fa324..9b1813e65e0a4 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -266,12 +266,12 @@ struct drm_gem_object *xe_gem_prime_import(struct drm_device *dev,
>  	const struct dma_buf_attach_ops *attach_ops;
>  	struct dma_buf_attachment *attach;
>  	struct drm_gem_object *obj;
> -	struct xe_bo *bo;
> +	struct xe_bo *bo, *foreign_bo = NULL;
>  
> -	if (dma_buf->ops == &xe_dmabuf_ops) {
> +	if (dma_buf->ops == &xe_dmabuf_ops &&
> +	    !XE_TEST_ONLY(test && test->force_different_devices)) {
>  		obj = dma_buf->priv;
> -		if (obj->dev == dev &&
> -		    !XE_TEST_ONLY(test && test->force_different_devices)) {
> +		if (obj->dev == dev) {
>  			/*
>  			 * Importing dmabuf exported from out own gem increases
>  			 * refcount on gem itself instead of f_count of dmabuf.
> @@ -279,6 +279,8 @@ struct drm_gem_object *xe_gem_prime_import(struct drm_device *dev,
>  			drm_gem_object_get(obj);
>  			return obj;
>  		}
> +
> +		foreign_bo = gem_to_xe_bo(obj);
>  	}
>  
>  	/*
> @@ -310,6 +312,9 @@ struct drm_gem_object *xe_gem_prime_import(struct drm_device *dev,
>  
>  	get_dma_buf(dma_buf);
>  	obj->import_attach = attach;
> +	if (foreign_bo)
> +		bo->cpu_caching = foreign_bo->cpu_caching;
> +
>  	return obj;
>  
>  out_err:
> -- 
> 2.45.2
> 
