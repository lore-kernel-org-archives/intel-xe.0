Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3080C2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 21:42:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079BE10E250;
	Tue, 25 Jun 2024 21:42:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VkgMYlZN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC05A10E250
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 21:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719351775; x=1750887775;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JNYCFyyLFfkbLx8mtI9y3qoBgnR8gjd62j25XOq1tR0=;
 b=VkgMYlZNtWKh7skiNVG3jkfZqyyTEBXRLc/uSNuRw9jxTmFWsECWEAzn
 9bP4+UJRxd+jYSLl7+kPxHFmczu+V8ITtAUCGpPTkELXRN53UTMKviUP/
 Pd8Mo9nc5oiUYTSLESqooCYn8d2qgRhau+bi7TUV2xpdrP0mmXTxRLEjk
 Zg82wOBsdA2h5O+JBxCyf68qbcYLtKPBjMjAz91LLzC9i6/DPRWTimoGV
 V2wkZSjuK1rqotqfjYAryKUYD7QeM2sAGZVpbYeclK/vrJLtsYnDSakSA
 51T9jLQWU6FZReXIZUBH8ovu4+OKm+iiH67jz32jLgUagI7BIB8Hvj/JY w==;
X-CSE-ConnectionGUID: bki8A/JoRI6TQf5meO0KzA==
X-CSE-MsgGUID: N+cRM6O+RGiAbexSo1MzFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="27018863"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="27018863"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 14:42:54 -0700
X-CSE-ConnectionGUID: WeL1mtYPQfWaxC/lRaGPaA==
X-CSE-MsgGUID: bsXYMGFvS/Sx80skem7PgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="43879097"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jun 2024 14:42:54 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 14:42:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 14:42:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 14:42:53 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 14:42:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bFGaC6Ar5lUkCys1ioA4S8en2i+6IXkWaT3wuhCdnyGn9QUyGsEd8xlkXnh3UML3NHNlEN/g7PSojKzp0Pra20aB+rtNr5LzBtqoFMKSQ22dHe7jzMgy8TpSVwoVv+cIBOi5edkWQAAdl7MukfSOEmm/dowtWu0FS/76erqFRosJYGbZmqfob97glPIrg5wEDkvaS7epQU3yePAmQo1N9feu8DITHmFAv0Zu5kTzqV/+htR7hR5dKHKwen/oRMBTTYTKBllPql7DwFSnlM9iLTK303S3UspuxPnh0XHJXT+/azWlbrjt1XqFL15+tmptNfO3wd2qGyz+L2vqOCmLvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4pn8PQlK8beeQRb/LdOXPqZhFsdm+T0AHmkCZRCuUcc=;
 b=oGzykL0RZuD8xsROdZywNcdtWhoNkiOU8/zzWFJPlnqCu/GXQEW8fprhaARtj/SLbKpdaE0DeJf7Px/UhqyyNeqUTV7/JQKF2d/NGPScHehv1tughtrdqv4gmIzkZc1khnSdVbbpAFNorKlVSCeBldzzgToyoPkMKYtA9R47rNsvZ1I6yQLLu/26jldcJZUltfyLxyedD1z1AcJMUm1eUdhfkecSM8X9nP9iMDKH1wHp5cgCH0HUOMdX6CgGcnAZ6aFQLNaiWEzwkj8LvF2/elzGH3a87XD7jOaoGUf80gOF0sPERoW+m9NHWMvdMiMOuciGmKOpRFNG8CFn6oYyDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM4PR11MB6501.namprd11.prod.outlook.com (2603:10b6:8:88::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.29; Tue, 25 Jun 2024 21:42:51 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 21:42:51 +0000
Date: Tue, 25 Jun 2024 21:42:11 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/guc: Demote the H2G retry log message to debug
Message-ID: <Zns5s8chPmob9dQe@DUT025-TGLU.fm.intel.com>
References: <20240625141258.1257-1-michal.wajdeczko@intel.com>
 <20240625141258.1257-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240625141258.1257-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::20) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM4PR11MB6501:EE_
X-MS-Office365-Filtering-Correlation-Id: 39af7257-23d2-44d6-0f86-08dc955fc343
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|1800799022|366014|376012;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7n5tvT73jz9pHF94b1rh7NKKvZyZajJSEflPBXe7HdCGAuUtj8LSDCcxcR3m?=
 =?us-ascii?Q?DhroUWlm4AkKW0rgWdBS94eMEsMmnfRWohFfEWZMCpPAXm/QDa0E1TFUy201?=
 =?us-ascii?Q?J3srQnV23+14IdTwoPTPMqufWOWdYeJuQXy82fukQCdOadzvDmUJKST2PYE/?=
 =?us-ascii?Q?BpQeVmShMD56g//K8m25pUbTNk5cGHChzpPRXYIfIjVVzqUnFE2fvVEPJJsG?=
 =?us-ascii?Q?P4WMCyKNLzJpwPxAiJ5dD026B2aiTLYKYSaUGlL5rPdEP6NDuvJQPKNNqxfn?=
 =?us-ascii?Q?edJs1iQtmS4f/sMx9m6WfdIygIDYjVQG37S3cp9sD0bIXwirWeqAvVdifuZD?=
 =?us-ascii?Q?23HNEVoHEzRzVChegP88KPnJ3zDhIqQPzozyz1+aVShZ5cXysTMqEE+ANvQn?=
 =?us-ascii?Q?3bxSilPeW515n/DGVF+R+vYY58lo+IVEPppqSnEwGEzBwOAsNwuwlnfwd+g6?=
 =?us-ascii?Q?DbxlfZs37TMu/jvBvCTrhxLXyy3dnqD3xXiBCyHSdB+7WFoM+39IMWA5X3Jt?=
 =?us-ascii?Q?SfAC9Hz4ooxB2BUNCiTd+rc1bU5ixEXiPC36V7oneUmkHbjsonNFp+mLkYhH?=
 =?us-ascii?Q?E49asdytThXynYpuIuxCIWHRkj57EF8WxydomWaXCbAIgn+m57qUwnV1tJnI?=
 =?us-ascii?Q?KKDyiFoghCvX5gGvCfd1aLHphQsDcCPY35p4mq2H+J6RHwXqCqJTs4QwtDQT?=
 =?us-ascii?Q?7K6L36rAD8ZUJcb3Seh3D0CiHbyCqLSZl4HynuMsTNVlQXbRK6NS4uk3nelQ?=
 =?us-ascii?Q?t+o+cBiJklNHubpfygVZZKBeHoMbF+oHhoz2YscqiHsjHRCv3ZCQVGrDf4n2?=
 =?us-ascii?Q?3LAD1IFLQdx0+QED4bGwhPewgJJ6DPcUGRNtRYzWj3fckDX3vqVnmWupZYro?=
 =?us-ascii?Q?wa4z1GW+nYFmqkYxo7qqe1Uz6Ido4vIT+0GNgH5fMuHnOvOjtF8xnqnKPrDc?=
 =?us-ascii?Q?SI87b8aYgbm6ZHMN0y5SXyc2xCpuqk5ra+KAzPgUQMw3u0//5s0a0JsWmNWz?=
 =?us-ascii?Q?+cUio+849BqapaxFDC6ItJvGGRNfvah4dypM5Yzg/fGzoGWDnAxfLfNQQOY0?=
 =?us-ascii?Q?9IdnwT5qRfQoZiJI5THleBBTk+ZZDs0Js+V2ixBPDOjNUb2wQZWz3xpfyb6w?=
 =?us-ascii?Q?CzEtPwAgX0IZJrIGCv4HhgHApOR6aOqUcdOOAxfyjNJm6zuM13EkxRM1WRk4?=
 =?us-ascii?Q?3bvdLSA8d/tSCOigcwLh2qPj7uaiJarH+gEfh46Vlz2ODrdVlShLN6x2LkJz?=
 =?us-ascii?Q?Xvu90Af96vwsYQQ5y44NexqywzkP5O5zE57RRMSycI8YJncEEUcMRbWX2+Vc?=
 =?us-ascii?Q?UgqVU8gJY47OFTgPjI2XD7QN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(1800799022)(366014)(376012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xKUnlYkLHKbOYfvsvlM/bD+KxNBKVqFCjpWGS3XXfn6iR9LhBGcXYi5REcnL?=
 =?us-ascii?Q?WHEAFAhCrVhn216v/IU9GScKBYouSfgRKtV//IwJVlOFlevjFLOO/J2uqQ5W?=
 =?us-ascii?Q?lkDjrQSqcpmwDI9+vhPyiwGoBepqZv6YqSpj0GkCqSxYNvThVDu4pD/F+OVM?=
 =?us-ascii?Q?HPWzHLXRzbdpWr3XAjrDw270b1ho9XJZNcNbibAmVudsV2o4wOmfewhEHj/Z?=
 =?us-ascii?Q?Ria3VwmfXP60X9hWOfpXIt646SzemVq96fHh9h1jJMdyQph/TrlAjdVPoBVx?=
 =?us-ascii?Q?wML8Vn8ZqcL07qs3PmYmWTc1ZRdd2TokmKYlNP56xOF+K+gE5yG3Cuf0w+BK?=
 =?us-ascii?Q?VGgSFoBvzoJwDeG2FTwhzCe1JBue0y3nDp6lzhAU/LwIAX1Q7AeRr2N6FblV?=
 =?us-ascii?Q?UOG+ayYolnLkqbRNC0a5PN5LsgjhLz3SUxXiPA+3DM18JQSor1lhXIvNvmtd?=
 =?us-ascii?Q?VkpCLdtcSViyDLRXBAc0zn1tUxhUSVc49/eFxATH5dLCny/tnZKot3it0h8o?=
 =?us-ascii?Q?/NHplSdGfgSKeW+9Mcj7VGQDvueCxzg4hVvOYXoNIXSxisjUOx2C9Cc8R1cO?=
 =?us-ascii?Q?+psyC68aOvALpJpUTF6/p+ZRRDK4jHdxKWlOKxRu3xpZAjvUPSd22vQn1RHs?=
 =?us-ascii?Q?/NRkSIh/56Fi+BZp9WKEnrpZd2GVCk2wxaVvVS07ylhK9GZbTRpKJw7Xi2UH?=
 =?us-ascii?Q?7HKhazfC1MLVExhym44sVVFyuFTpWWtNQm+bTJORh0QId/59YomvDlKrFeGX?=
 =?us-ascii?Q?WPJLUKq5cj6qK9KDJUVmDfQhaZyuLZCQANHtzkwKKtn5W67uVjqN7S+DG+Ui?=
 =?us-ascii?Q?iBxSs4qONvFa0SLkNMtWSXGxw0Tw/6jBv7CbMaUIEzh4B9I5Zn2J+onWYTme?=
 =?us-ascii?Q?TXFDq0f4yYijIcKhruVyXWoQnuEW1yl4mcYsIqhFKPq1en+1UpnMS8gHxNhh?=
 =?us-ascii?Q?eB7iZwOC9C0speTVaq6VWMGv+YqsOCNK+ipHwtyk72kegNQiht247prEhA+O?=
 =?us-ascii?Q?6XHOcAtcBQqoBaz1Pwx2GeQoZopcozjeCR2Wpi4rNA3vaDfPTLd0ro5ICkkI?=
 =?us-ascii?Q?cK/yoM7sl0sFyyoYvvthJDQpQpXAhpk7bSheJ7X9y9hV08cC8zWhy0MIB19R?=
 =?us-ascii?Q?gR8arzR/DX+pWWQ6SgKlomaofjC7MFCfVIvosw+oZKKV0aHxea2GYkvtjkwb?=
 =?us-ascii?Q?rNpGHN0SpWuKy24p54UBzZJojQ5eAHvBZURz7NwB3Pget3zQ4gny9GZQ7OuK?=
 =?us-ascii?Q?C6f+l6X/5o0FjxZ7r/2/xhv1t+BLeQWDp9sRzYuW3uLVjr4oSiGGFvhULKiW?=
 =?us-ascii?Q?D3NufBaMSXAaLJBoukVLDh5C/oR02vFqr+IOukEBtH2eDjhhpx0K0qNBXh+5?=
 =?us-ascii?Q?7gcJodrdJ2xWS7RqG5PpVP3hej9rLbgPC++N7VtM3kewecbTBEIB6YBKMqDq?=
 =?us-ascii?Q?bO5U/fOGE7w9XtXg5fjuE9aqnfraS81i8gfAmmYTPViIiigV1Ww55vpIhcQP?=
 =?us-ascii?Q?1Hy04mG9RDswu6GBxCYeHgE4gAMBcmg3EgIHMLZTSfDI8HVXSiSQkMPuS3yF?=
 =?us-ascii?Q?z0h4ihqU0bj6RwZEgLzG2ZLRgxhDzg32Y4xfodur4B7THAx07wXKPxsWpJH3?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39af7257-23d2-44d6-0f86-08dc955fc343
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 21:42:51.2145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EbsZ+b7AVfoGm+jUsQsnJd/i7Pb/zdiypQAJ0khYCMw2Kv1sYIwQ/jAveepgREdKLgLm27a8nIPX/IK62C2GWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6501
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

On Tue, Jun 25, 2024 at 04:12:56PM +0200, Michal Wajdeczko wrote:
> The G2H RETRY message sent by the GuC does not necessary indicate
> any serious problem and can be a part of the normal communication
> flow. Switch the log level from warning to more appropriate debug.
> This will also let the CI ignore these logs which were seen in few
> SR-IOV scenarios.
> 
> While at it, use hex to print the reason and add missing \n.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index b4137fe195a4..91a8a969a6ad 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -877,8 +877,8 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	}
>  
>  	if (g2h_fence.retry) {
> -		xe_gt_warn(gt, "H2G retry, action 0x%04x, reason %u",
> -			   action[0], g2h_fence.reason);
> +		xe_gt_dbg(gt, "H2G action %#x retrying: reason %#x\n",
> +			  action[0], g2h_fence.reason);
>  		goto retry;
>  	}
>  	if (g2h_fence.fail) {
> -- 
> 2.43.0
> 
