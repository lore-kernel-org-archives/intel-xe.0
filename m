Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4FDC2BBCA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 23:12:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F0D10E296;
	Wed, 19 Jun 2024 23:12:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OV2HaN6J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74BB10E296
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 23:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718838729; x=1750374729;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qTb1x2cIzhex5l2wm6vOVl7pus0bpZUtMjAE/2Kh0qM=;
 b=OV2HaN6JkKEni4n/C2VtCAhGcnhX53Y8lUY5rLmPaaRlcc/CSGzCT1Hd
 USywgr0mbSYZwuOFMsBslC06MRc0J8uL4bzIFNOYRkT7kkTQDumeb8bJm
 r+RFHXrtA6a0bSIeyapK+ixNem9rlsmJTJOPrQ77Mvmb10CjVBp2MUENf
 cP5kSJUNGItCjnk9idAVyC+/b1LPcy/DGNJyecW8N8yJr/nL62kH0ElFE
 EgT3doUtMI5/VrcXyXExhBWQ/jdOPw6UjJ638XXjO4okkbqVpZ7cmXOtW
 vlSQHki9BUGsroXGUvtOe+uY4MNZUxZDRpsd5qKKH0pkD42fta0+sybvP Q==;
X-CSE-ConnectionGUID: rMstn7YPS4WVoPT/zp+bwQ==
X-CSE-MsgGUID: yWa49crLRRukCEDdhMlXpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15936573"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="15936573"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 16:12:09 -0700
X-CSE-ConnectionGUID: 5EXvhpzWTT+MtSJFVfnorQ==
X-CSE-MsgGUID: Ls+9+180TRS8bRChTNbkyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="65298255"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jun 2024 16:12:09 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 16:12:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 19 Jun 2024 16:12:08 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 19 Jun 2024 16:12:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZuaVUsjoAxQyZgX2kESHdRFPGe7l5LSZipBKtkl7LiSj4mZtY6veYUPbFRx7FK6RPsvUjMlv3O4SbQonMy2w0QTmaIH+NlzFSc37IvoEhVUIM3/8UIZv/yjn8LU0pfX+jH69rx8TQMdryZVeGrQlGpBIrYDsgcrCXEAec6uF/QOAPn2QfbDlmPh3Hvq/d38lVrEvjKKsg8MSd3jlyVEZsABZKWQzwZUQLog3+bIBnUD9+k7nMG7saseiXH1NnPafN2kzzM4zCSK11pVJQexEFoFwF4Ind1lVK0opArvJqv4urDgAW31I+q+z97aYXB6KMWWiO8PqYAVYiGRmgjoLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2DVVOR7vMwaC0L7ZK5RvoT0tt9RKM0nVzkKhw6Qv/A=;
 b=B+RZ9zpyyZ97JB0uLYteG9EaBiBMDReWeYgyhDRWRsNERPHbEQkjGPKqeTAg/7mFB7/6W6dmISvONKNclZWRVkcYwEvpV2yY7n5IUaQCS98zAJGkW4mMXCRNofhX6GNCljWurieTzBbnAs7rraw4vtzHlXLlmEfcEHlJ9e6La9+Tp+6FpFfSobmEZqwwv3zWxj0HRigE7V5FFMxzepZYLNu0rnej6ki4jKnqs80oBoZpQ0K0tCeUakkZU3Pb2Y6Y5h1VPVTMu53ERRZ7wXSFeeA7HJ4HiDKvqnnFfGuNG/QPYhBszSIGwkdKL+CALkB/grLuR6btK/aefqSuIQIaxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB6270.namprd11.prod.outlook.com (2603:10b6:8:96::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Wed, 19 Jun
 2024 23:12:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7677.027; Wed, 19 Jun 2024
 23:12:05 +0000
Date: Wed, 19 Jun 2024 23:11:31 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 9/9] drm/xe/vf: Custom HuC initialization if VF
Message-ID: <ZnNloxEj2yHTYahZ@DUT025-TGLU.fm.intel.com>
References: <20240619214557.905-1-michal.wajdeczko@intel.com>
 <20240619214557.905-10-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240619214557.905-10-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR07CA0020.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB6270:EE_
X-MS-Office365-Filtering-Correlation-Id: 16fff898-9dda-4d3c-6e5f-08dc90b53be3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|376011|366013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RSqN9/lQd7wAwhXV4XaiBFlbYEnqLu6HrQRKqePVLZdYIVH3yk/QMTB4z8jT?=
 =?us-ascii?Q?6SbcYjQ+Aheym7R/7TDtBogR7ULoNUAN4sgAWom6+k3r5d0TT64DMhlWXAY8?=
 =?us-ascii?Q?+AUybVthxGeeTch+VS+pfEH6Kj7FIoV/L8jXQU75hc3cD3TdQ/Tkw/1XmFuE?=
 =?us-ascii?Q?tGYW1QxdAVRfr33jvgNd0Qu+qa6XRA5NJCFJCHBtQg0yu634uJmFXUNNW7kK?=
 =?us-ascii?Q?v/beXkyNzghxWrGKZVoTGjt4mO3U84/4uHjOjK35F4yHArt9pQW+AzrSGPpS?=
 =?us-ascii?Q?m52g1+XmL33ILkrJVkMMrGg5OxPvIx7YZZ5PKJX7+ZUyNZFNTiYupHtYt4rm?=
 =?us-ascii?Q?aLVgjJIdCqb2NyNpH0ZiOKpORvKEfV3CTylxuVgT7ht1a4si7ryrUngOe1pz?=
 =?us-ascii?Q?LVxuC+Cpy07JuBDq7r+ZsoFGZ/YyRj8HrAAxCNIb9Y8JH5NEd/pOZpUArcz9?=
 =?us-ascii?Q?N05gFMgBWkl97rACRI1qAKXavV3B+7wDZ2ajh7OaviAfJm33+aZskYg05jgv?=
 =?us-ascii?Q?C36tUXOTeEoDoJMdGOML0PwZCQQYVlW60EYgnjdFtkV1w7W2evMAh7CI5V3X?=
 =?us-ascii?Q?x4QEmNcpTNCdYPTQ4MjeqltsrV3FriMpsOuRS0vj7P3hPe/Hq+Y1UiYuFeGn?=
 =?us-ascii?Q?hUcCZZpQ2tJZ5FFiVNLq2v1/ggLKGNkW5xlOAg3LPH5JJQjsQktlYW4WUsjB?=
 =?us-ascii?Q?GpeFyaTGNGQJyjwlgNVEvPfFlnk7//+PqT+YSyRo2OsWW9yEo99vS0+Lnx4C?=
 =?us-ascii?Q?sEET/f7PyZT6Ci6PP+zjKOuyoukx1MHP8rUxLDYGFQj1q3jbVuGU1mpYgMV9?=
 =?us-ascii?Q?8yWzvjDOChdZALC9/KNmN/mwyElLgBT5FkxSNqw+uexFfrAxnCrw/TWDoQFM?=
 =?us-ascii?Q?BlwLzQTYBMqRHZK8qpBsi+eMQ6yvHWMyKe3CS1ZIqeG899Nt2ouoPfJi6eV+?=
 =?us-ascii?Q?s8PepYLsyQZFkSd1FjTIsFEuIGo8EQrSg3FO5I6LlacBRGW62tRi76AZgy7Z?=
 =?us-ascii?Q?BfyN1Lxtpzh1elqDWyHahi4CMJ3ZQBI7Ze70iVo2OgsB1xx6fydPPmrEADSc?=
 =?us-ascii?Q?vMeauh9sGNXc0euuGXJIn7/u50PcTQNvcXVDsjl3VK/c7Louylprsm1rO6yR?=
 =?us-ascii?Q?f8gfIsFBNF8mpKWGozlwSULKjH1Y4vdh8ceXGQ3UcRFeBVXbqAKTEFoy/+zb?=
 =?us-ascii?Q?Q0jIo6uCx/HoUXPhQQVyZb3BED9pz8xjrGFPq3XDe8UKhnxYNEMH1wuEsIB9?=
 =?us-ascii?Q?PfcAqVUttaROUe3+xoNqHAgqqyqmxcAISDXdapib4ftrpmBFy3WxKw+SGSJP?=
 =?us-ascii?Q?+t0tRLcyWtbh7iniYOrt0WFb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(376011)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jTzNOYw7EVIPMkIPDguk56UU6bynaGjNA7Nf96kLhBEKkjB4dRINJMYtKb9o?=
 =?us-ascii?Q?jOzBONuTrWfC68V5Kta5Tqc/stS6wbzG8oSJiScwVFW5ZuhGzWaBxJLsxSgE?=
 =?us-ascii?Q?O0TT5AwM5sKfekU8GJEQGTWHHXhIwQ3cpknGPdiQlcAWepx40+hiD6AXXYBU?=
 =?us-ascii?Q?hTwM+jEHmlZraxjg32q5GC2gYVcaD8pDQ+XZFl+M+FUbe7Xx5+VyRtNwHURD?=
 =?us-ascii?Q?0mjtrnW5p6MrdRNB6LeERE1ekWyZmIXrcU0k0+GgsO9ZlovrqkroHbc93B6I?=
 =?us-ascii?Q?kfILcoJANy9WvcFv3IraTqXdbNFzEAXg4okbYRUnZ6bHg/QZvGovAwVKzIjC?=
 =?us-ascii?Q?dXIpThx1SvJlomYzacR1HJzwYVbRVp00OoZN7VtiGGaZ9svGky6PXl58JHHJ?=
 =?us-ascii?Q?fKztY1JtVOTiGbgLvXuV3CVJ19YbzgygMMOHDXq3QH6OR0n0PFYKzN+/D6Hg?=
 =?us-ascii?Q?rz1H/cN4MROkmw9zuJNrf6tzgVXlDYGiy2iMp+/4zyb44AcoKfzcwhXuI18k?=
 =?us-ascii?Q?TlxgfNa6Rw36ekbC3HhiUWHwH6nI7qRn5gUvKyGtNv1VUMPNhQxRcmNqht4h?=
 =?us-ascii?Q?nSO9dMubSUs9X6FE4PSm/t+9NyEwd2NIxXooOgE6Ss4XenH1t4KmyRodqiTz?=
 =?us-ascii?Q?gDdobdBFC6ZzJByuhSK+AwMh5Xv+S5UssNy4yrtzHgBvb3mQVAIlvbjuCUCb?=
 =?us-ascii?Q?Isf8iJdmkHqytzpfVlHq9vaoNiwcKoO/fS1rQFgI0gFT7kpZC3Yhxi4ly38x?=
 =?us-ascii?Q?L5KaHOhCdE4eDuApfT14lXkeSrVCak6gKOgqlvGUrVUU9ZajhY6t8omJd1nQ?=
 =?us-ascii?Q?cVC5gKSlWOj432eup86NpUqZ5lZ1rN/gsS7U7YDXbi6KYeweKC1wGr9Uynzj?=
 =?us-ascii?Q?PSsBTbvcgh+9B49diNH3oJ1KgFELwfSlwOtXpUf3jpLYJYsWKIFjEicoJKaW?=
 =?us-ascii?Q?vnBsyZ44Z2libRhddXXA/YRscTdMmZ7nCW2Os8q2Ur9KMg+oVCS5tDJh0Tpo?=
 =?us-ascii?Q?jOMI5mcWkTuRJCZZDu/4R14MVyxj0ybwuQzwj/Lo8Dwzti+ibnwR1eNYei5g?=
 =?us-ascii?Q?qiBH4bZ4U3fqTu/ckuq3jY2duQO42PWjkIksZvEU8bpRJSQQQjkg9hIrC2mk?=
 =?us-ascii?Q?0KehXk2O4O8LyRYoeyV9nveiH/QeglCQPJfTynSZqBvZ4Hb7cDRnJFj5EA9G?=
 =?us-ascii?Q?FPze2jqabABjChQeOfI8r6x+sigfq0qrO6dVZPa6FJR4eO3m0LWb++JuiQTt?=
 =?us-ascii?Q?TYz4i9sAn943VyNVAyDv+N3FL8IJw2ne0f3jfyjBk5B+Bwcr7IDKQ0p5sHmJ?=
 =?us-ascii?Q?CgflDWknlpXqJtgcj1TKzotp8ZuUqXUl0Whn5ilbEY6TtGhCIvKKsPiFIRFu?=
 =?us-ascii?Q?uA2lCF1VIXE/rD2zcYFgvTjZH1sAehbntrbyJXVbUE7Qdy/l8+asEctJtbMJ?=
 =?us-ascii?Q?luNCIdASGsQ1r2fsXLoY8jg+nwyHaJhpOGFe8gh87kYS6ZaDFeTAmoFbscYz?=
 =?us-ascii?Q?yaSEM8zbftz7pQtIEGgb2uYmXusLUJfQ2ZDzi70BNSqABnyT9PfJNp5YQBRE?=
 =?us-ascii?Q?c+1inJ4OmWdbnFsIJeYrdBtEsWluL9VtCetJPwXn9W+S/+nzRzc0DixKhv23?=
 =?us-ascii?Q?TQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16fff898-9dda-4d3c-6e5f-08dc90b53be3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 23:12:04.9215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E8OKER9BK2iKKeXrHvCHPd2Y7wrucouXW58NwZw5RDzI61I2jk2g71PSUX0M+jNyAHmQoE+fiUzZkywoF39QlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6270
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

On Wed, Jun 19, 2024 at 11:45:57PM +0200, Michal Wajdeczko wrote:
> The HuC firmware is loaded and initialized by the PF driver. Make
> sure VF driver performs only limited data structure initialization.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_huc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
> index 6238fb354914..c88761fe31c9 100644
> --- a/drivers/gpu/drm/xe/xe_huc.c
> +++ b/drivers/gpu/drm/xe/xe_huc.c
> @@ -21,6 +21,7 @@
>  #include "xe_guc.h"
>  #include "xe_map.h"
>  #include "xe_mmio.h"
> +#include "xe_sriov.h"
>  #include "xe_uc_fw.h"
>  
>  static struct xe_gt *
> @@ -92,6 +93,9 @@ int xe_huc_init(struct xe_huc *huc)
>  	if (!xe_uc_fw_is_enabled(&huc->fw))
>  		return 0;
>  
> +	if (IS_SRIOV_VF(xe))
> +		return 0;
> +

With this change I assume the main part of xe_huc_auth is never called
on a VF?

Does xe_uc_fw_is_loadable return false on a VF?

Matt

>  	if (huc->fw.has_gsc_headers) {
>  		ret = huc_alloc_gsc_pkt(huc);
>  		if (ret)
> -- 
> 2.43.0
> 
