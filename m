Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CD1C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 18:49:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC71610ED03;
	Fri, 28 Jun 2024 18:49:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dHawAdki";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897FC10ED03
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 18:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719600547; x=1751136547;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mt6cCh0+OwmNfRz8m+Krb/nptT09XcgAoMVTQZUYauA=;
 b=dHawAdkiFKZG7lFMB57tshQ4Io4A8RG9GtR9CBB0Uygds608pE+z0LcR
 5kp8p0S0deTDDu9PoNnZ9AMGqwHL88I/tX7iCA+pMZ/3kyFkKHxFNYDyU
 JuqlStm6xlYeC4mY+g0jTPEFAH7XVWJWaogOMZtfMnPTATcBI5+1jYQ0+
 Bqdcj5JYtQgR4jLtsKlV33dNgNu+HZU7ECFstpdVLm96u6TUZbl0aV605
 YsHS35lAy4r/AX6ZRz/QzkLBhihpZ9N0lshVNWt75kkoKQl+SmqE/9L0r
 9HlGOVDieuTHjMOHJgkMAXHi24z95lNZQYNJeZqtirkxxfQWoA5UHEW4Q w==;
X-CSE-ConnectionGUID: LM8eP8smT2u96CzLkLUi2A==
X-CSE-MsgGUID: gNLP445fSUW6P6F843eo4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16931939"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="16931939"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 11:49:06 -0700
X-CSE-ConnectionGUID: 9AnJWK+1RhyLq7TTpdLldw==
X-CSE-MsgGUID: u3dY6VD2TvmoVPWqRbTpuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="44733336"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 11:49:06 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 11:49:05 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 11:49:05 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 11:49:05 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 11:49:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BikAp0qMTymGNxsnJF9HPyo6kooUqiXF65Zq25af3jbJCHtNk4zDrfizvYJFqnMhvYe9KGxWEK/qQ/EGn+2CbQRRqgpwaWCZzyhpBq2pTQ20bZpFSBfOhieYWA/0qfWmuiQQVK6Q17a6S3BoIg4WI+6HCGnibK0iNm/EahW0ptuMAEB8D+rUmIWRF3E4FKQhwL9S09JryXuJPslN9WXNVBxUcke0XpnGNCbzJc8dSO7fIDe6K8CN/Tu9A9qdzGOj3nonLmA7o/q4BM+uT2EZpZoHoU6GP/qzv4piaqsLIkrYROQFa521IV307Uwelw3zFLelzxatwEsWI07rXVZuAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ZkIlv5fj9AhaZgl7Hi6HGaJM1ttXEEhR6k+zXvDA10=;
 b=YW5Hr2VO33ZoqBqefV51e1/Xgc+HFuNag8+voHdX/u/EzLHVa5lpOkFKuJ+ttES9Td/k+cZpRHt59o+EmdlopfOCMI8SK9iQ1aUJ2l720gypddb8Jc+oEz5LWN58KXe+Yej6kAP6BBxznY1WPsMGrXb+z09zgYdClsywwFJqrxMLo9RcJ0JaX/EyMjNUq07/h/t/cQF7Qu6xogp8vSPaidtkzo3kDU8TfmwBKbrBbrMPG7yQs+SJ/r+tALyBC83X8oNIqtFZ9PaumJIJSKCAFjqjXf0Gxu8fKsZxCGw/PHKFpw1n/1NpkJPvvHRCe+h2F34bIWb2d506t9X6RHMChA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CO1PR11MB5075.namprd11.prod.outlook.com (2603:10b6:303:9e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.34; Fri, 28 Jun
 2024 18:49:02 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7698.033; Fri, 28 Jun 2024
 18:49:02 +0000
Date: Fri, 28 Jun 2024 14:48:59 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/bmg: Apply Wa_22019338487
Message-ID: <Zn8Fm9DT2Qbm9c9-@intel.com>
References: <20240627002743.1334133-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240627002743.1334133-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: SJ0PR13CA0037.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::12) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CO1PR11MB5075:EE_
X-MS-Office365-Filtering-Correlation-Id: f8262074-9816-4fef-7b9f-08dc97a2fa73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f69/qpvv3I0aCT60hL4MbwDjho+Y6E8FK3Jw5Tm+2xqPsksneKwTeO2AhjH6?=
 =?us-ascii?Q?1ueHYDZyA7hKS2YDJa5UpisBw3esCgkVORqe1GRfZuEDIM6VNVdeFezg4Wd3?=
 =?us-ascii?Q?NkWpqJgXhikWIFDgTjHHJvBK7wm7XXglp9gJRX8ToLnZ+Wwca8zx+yPjeksV?=
 =?us-ascii?Q?6ukWP21deGJkDJ1wHBN5JgLl6bdBmRRb4a7+/12aBh0kK0Z1mCVn7RbQH/2R?=
 =?us-ascii?Q?1//Z+wQmmy+0cWgV7cieJVoys3jq+UZS3Mbd8BGG9Ov29ASu80LhfUKOLDNp?=
 =?us-ascii?Q?bTkQ+TO3TGRDoCIWujeS2+z/a+l84zJUZjF3b+z1CVsGDsVvWN1utRV0a2+F?=
 =?us-ascii?Q?OjieWw2ybcorTQ2Ge9t3EqPD+Guhk+qCvX43+gPnAn23hEvkd8+Bub45ynju?=
 =?us-ascii?Q?lcMswz4eOHETcxYKANeom+6mO0pxOJLGJf2hGmHtvKKQJyyBdeDLFEmYKvdp?=
 =?us-ascii?Q?3KMqOJX5/fA19QN7kfS+aNqkGDCXvroyjxBhpORzNSby0BEpctuD6dA/pPy8?=
 =?us-ascii?Q?ARiggrCoTVhxBbXTsfV6aIM4kIuPvhDmOQwZFkiIttG2u5dyxc1vuu6ZF318?=
 =?us-ascii?Q?kUYrIoggUkbRerqNn+FoUYiLENC79fMSt2JLzldOTSTfXcESLPLclQAET9F0?=
 =?us-ascii?Q?yD4fuYMmm4n113T+a/cVGBeTd7/FfvDYTIVoRzzRSLRsS9gDNrNAthOAUf7+?=
 =?us-ascii?Q?sZI9T7cQGfiSTdlgOJR7J4S5nIzpPupqNBOnUyQ89hdblxfcmr8+QNH0M99u?=
 =?us-ascii?Q?dvSM9vLGjpy8EFlQerKjglRKGIWyXSz6JQyj08ClKTA6XbnyFpvivl9/K6iX?=
 =?us-ascii?Q?+tUL50t+XQW5zFGiMncta+8TkIDX7gR216ZWsEcBfHGN6UP7b/qXBttX3irg?=
 =?us-ascii?Q?cryLS9+gQS9j84ScEoees87LCjsDbwaz4W6ouvYOxxlzwHXCoUiYvgxu1+h+?=
 =?us-ascii?Q?QRI1hr2RUALc1mWgpQ548DQFt3TJVMWWkJtEfUpeU/YSGxtXM1q9JFOQQ1Lb?=
 =?us-ascii?Q?KUI/84DSWV2fvhVWV5wkDDZs8uhhreNttTc7NTaviz44OZgsaYHibd0RUnBP?=
 =?us-ascii?Q?J8mAoEAVrWc4rpMiziw8xv4tannXUKcferw8cgF8/iOX6lZNyg6s04wsaauC?=
 =?us-ascii?Q?SFendS1V+I+rafzhhByRaAXxW/cqe/534z67SLrrZwh9zWDH1hIKrSb3IWXf?=
 =?us-ascii?Q?LuusVlxiWooMhaWuoK82KYBKplxSvfgJprEZrmc6FQbis0qUVzyYXpwicfK9?=
 =?us-ascii?Q?vmFDLPjN1WoTDxkvPlEOs5BYgTdu5rkDPHB8ltb3drPiyaJLFPgOPg6Zq8l7?=
 =?us-ascii?Q?4oJW1fsJ9w0cYtyLhpMwzXCuYtConDXWi6LxCHlmc1yYqA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BkRQ5LC/WvyxLmtjK5m52LsITM9S+HtARBfSAZVU59B0saLbASYxvj9vDWeT?=
 =?us-ascii?Q?6U30dlKOraNS9HmeU4F8z9ilTTBOfXDn0E9k4LW4Aqm4fmsFcsQID0WVXv2J?=
 =?us-ascii?Q?w/8wIwZePDwAhPkMbofp+rWFPt7gFjJnuprimQ1UPCmlgpswkcFfkVCGHSLS?=
 =?us-ascii?Q?X/mnGatILcwxxNUq/4UsqxO8yhGPx/01LfYZjyfVOcgnJSjFfokAAX3GndFk?=
 =?us-ascii?Q?3d6fsu3IPpe/VcDtz8HGYbnlS568sTsZ0I/NB27LquIfCuDjltjI4CFqQgCy?=
 =?us-ascii?Q?k7oUkjGEPQcIrIX3UZT9JZEPfMXXCWvdkqgspRZc77YTpKyfepUfT/gmrpu7?=
 =?us-ascii?Q?pN3vC2o76IAHIwmlQLCWe4dhv54G11kQd1XVwkQQtl0DBoihd1ZkKhXJ2n/i?=
 =?us-ascii?Q?h3F18PfZf4xnf/K5oa/Q9eETcmg6QMPRrci3y6FyqvK0iS/ADH5SYG/v3P28?=
 =?us-ascii?Q?XGhUfkgAdA5QBquzlZRnePy5XGDTH7Gvf9pr3CMYoWUXpDvQS4CTfpvGk8py?=
 =?us-ascii?Q?R/VS8dqENcRWMZ8fqQDZUNqqf/Ixm/FqgExoI4GSjAcAtVaJum6vvvBAimT2?=
 =?us-ascii?Q?ESRCWRK7lls/dEMj/wwxzOdmjf+0d4Cccc67+M2K/3SAghiohjFHY2Hlst8P?=
 =?us-ascii?Q?fpOHxqPfV8vhhgzmMA6eKE4m3fQGjMiWs3kl/j1hx5uhM/LG5dM28UtEpW5y?=
 =?us-ascii?Q?HeOYp7Cu049vEiWJgSNJ0dUnN9u9ixrOfX6EsN4bO9/VVeJAIFcv4fGG+8wP?=
 =?us-ascii?Q?goC5ohn6UmBpB2m7w0KK71Iz2HdLzMHIAFRjpbXUEtMkAP0W512Y1xdVKE6z?=
 =?us-ascii?Q?paiAJkzCLNRzslhSKJVX6Tuz9j56Kh03JqHSJNQ+1yrZowWP0JsTW5sOeZQQ?=
 =?us-ascii?Q?m691nsuiKSpfUeXOM76Wr0cUnXACrjlHR0mu5l+02KWJ10qa+kY0SoQbHbq2?=
 =?us-ascii?Q?ozfj1IWPG+wW4fHL8MiCDPyE4i6/FEPdFEXrBvKeNvQ27zkGA4rMQr9bWZqQ?=
 =?us-ascii?Q?83tYx5vdsE0wXdH/EC/WVz+I6npcChEyuT6mxF02C8d3xqaC6GKPFFzfela5?=
 =?us-ascii?Q?RSR/A25oSkaX3wUWCdQIYOyfVijF86vWzUFHSbklweQb6iTNKuPxL9IxpKQV?=
 =?us-ascii?Q?7Gigy7hoT0UIPThUA0LQ1FE0baxx8jpn4diBGk9xmBrUMFORneqAdfFC/S95?=
 =?us-ascii?Q?j+NFIbJ1aWn2ueAk60V8gzjjHaw+C7AeEeZeGDzi7kZH/aDT/MOn0VoXU6XT?=
 =?us-ascii?Q?ip+CW7CzxzgWFf28ks4zaZQBbZuTnPXusUDsg0cL3tAZJIXJEPrsNCKjT9OG?=
 =?us-ascii?Q?olGqNQQjmE3W1HcEUoe/1SumeEgcV8IaQlRCxtqMLoCnMWhW4YmmA+n1S0js?=
 =?us-ascii?Q?/Kzey5VIwfYIqEvogS0e3ndtA7wLlPrHCNgeg7TTzVyVa4DAk8VV+dp6Cksz?=
 =?us-ascii?Q?qQ102OYlgGGZYM+DhPsOzX3cM9Kw6u+W1MDqYaYRqQX1W0D9TPg+dso+e6P4?=
 =?us-ascii?Q?IsKX0TxzOtP9H9+fKtUT3nZeo/WHMUUA6Ub65ZE+/GAUfogEgkqKcOHOuFvA?=
 =?us-ascii?Q?5STRLIkdgGMmZgOI4EE4pKn36i+lj9NXAsozNF57?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8262074-9816-4fef-7b9f-08dc97a2fa73
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 18:49:02.4315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bzGQIdy1Y20GwH+4/NPugDD3G58il3C/L+GQLswHTkNJQHfBANRrLNzOvwL7AvjZ4zvcw1SrgC7tKeLFpTHlVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5075
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

On Wed, Jun 26, 2024 at 05:27:43PM -0700, Vinay Belgaumkar wrote:
> Extend this WA to BMG GT as well. In this case media GT is
> not affected. The cap frequencies and max allowed ggtt writes
> are different as well.
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c       | 11 ++++++++---
>  drivers/gpu/drm/xe/xe_guc_pc.c     | 11 ++++++++---
>  drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
>  3 files changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 883cfc7f98a8..0cdbc1296e88 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -74,6 +74,9 @@ static unsigned int probe_gsm_size(struct pci_dev *pdev)
>  
>  static void ggtt_update_access_counter(struct xe_ggtt *ggtt)
>  {
> +	struct xe_gt *gt = XE_WA(ggtt->tile->primary_gt, 22019338487) ? ggtt->tile->primary_gt :
> +			   ggtt->tile->media_gt;
> +	u32 max_gtt_writes = XE_WA(ggtt->tile->primary_gt, 22019338487) ? 1100 : 63;

please explain this threashold difference in the commit message as well.

>  	/*
>  	 * Wa_22019338487: GMD_ID is a RO register, a dummy write forces gunit
>  	 * to wait for completion of prior GTT writes before letting this through.
> @@ -81,8 +84,8 @@ static void ggtt_update_access_counter(struct xe_ggtt *ggtt)
>  	 */
>  	lockdep_assert_held(&ggtt->lock);
>  
> -	if ((++ggtt->access_count % 63) == 0) {
> -		xe_mmio_write32(ggtt->tile->media_gt, GMD_ID, 0x0);
> +	if ((++ggtt->access_count % max_gtt_writes) == 0) {
> +		xe_mmio_write32(gt, GMD_ID, 0x0);
>  		ggtt->access_count = 0;
>  	}
>  }
> @@ -218,7 +221,9 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  		ggtt->size = GUC_GGTT_TOP;
>  
>  	if (GRAPHICS_VERx100(xe) >= 1270)
> -		ggtt->pt_ops = ggtt->tile->media_gt && XE_WA(ggtt->tile->media_gt, 22019338487) ?
> +		ggtt->pt_ops = (ggtt->tile->media_gt &&
> +			       XE_WA(ggtt->tile->media_gt, 22019338487)) ||
> +			       XE_WA(ggtt->tile->primary_gt, 22019338487) ?

it looks that all the decisions of one case or the other is convoluted
but I really don't have a better suggestion, so let's just move on...

with the commit message fixed:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


>  			       &xelpg_pt_wa_ops : &xelpg_pt_ops;
>  	else
>  		ggtt->pt_ops = &xelp_pt_ops;
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index d88f5e960fbd..16c4b3fadd45 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -45,6 +45,7 @@
>  #define GT_FREQUENCY_SCALER	3
>  
>  #define LNL_MERT_FREQ_CAP	800
> +#define BMG_MERT_FREQ_CAP	2133
>  
>  /**
>   * DOC: GuC Power Conservation (PC)
> @@ -703,10 +704,14 @@ static u32 pc_max_freq_cap(struct xe_guc_pc *pc)
>  {
>  	struct xe_gt *gt = pc_to_gt(pc);
>  
> -	if (XE_WA(gt, 22019338487))
> -		return min(LNL_MERT_FREQ_CAP, pc->rp0_freq);
> -	else
> +	if (XE_WA(gt, 22019338487)) {
> +		if (xe_gt_is_media_type(gt))
> +			return min(LNL_MERT_FREQ_CAP, pc->rp0_freq);
> +		else
> +			return min(BMG_MERT_FREQ_CAP, pc->rp0_freq);
> +	} else {
>  		return pc->rp0_freq;
> +	}
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index a6b897030fde..26066beb4f6f 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -28,3 +28,4 @@
>  		GRAPHICS_VERSION(2004)
>  13011645652	GRAPHICS_VERSION(2004)
>  22019338487	MEDIA_VERSION(2000)
> +		GRAPHICS_VERSION(2001)
> -- 
> 2.38.1
> 
