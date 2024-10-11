Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7863FD0EE38
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 21:18:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 480C010E09F;
	Fri, 11 Oct 2024 21:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mPwhsURr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A09E10E09F
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Oct 2024 21:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728681485; x=1760217485;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dR9oEVyZR0VRboSZprO0xgM5nYVVsXTqqgWN1gtibYU=;
 b=mPwhsURrjs+KtGTzxMTpVtqXv/qDvNRgXZxjyTwKahQ/M6FFiuLSK5JA
 pPX/9qZiGZn1gyt9Zl2q5OUp/K0hEw7yIDv8pCkIl0qLFq6bgBfSJBcYj
 HE3NqILiMwxweOkQ9kJRuF56fuUy574sBd2tDIgBx+ORiqxA7K7SGB4PI
 HVcZ0IWGhueYyePJLkxAlqOtJHG32/kRH3wJSCdb2naGTXADsGPsrjE14
 6x2dysg4AoQC1V6shotwi5Wlh7RRV0KBUgUJWNiahz27NqwLsXzo8MBOx
 pk8gh6ZYN//F+0FLtRvs610bP0PoprOydJhXUC7qD+0XsR1k0gP/xXrtf A==;
X-CSE-ConnectionGUID: VQrcpEsBQuqsBNtDvq/WpA==
X-CSE-MsgGUID: RJ6EQD71TPSbB1Xu4mjesQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32000890"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="32000890"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 14:18:05 -0700
X-CSE-ConnectionGUID: DYbG3kTtRx6gHwUzn/3I1g==
X-CSE-MsgGUID: +rOpqUrfSgykI5+9gImlqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="76901655"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2024 14:18:05 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 14:18:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 14:18:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 11 Oct 2024 14:18:04 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 11 Oct 2024 14:18:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i2TKsdgnp4s/sPd5DVwswq/HYGreL2XaXT7UrMkMtX3TzfMgQbZO77XUDGRLBODlxcXN3bqGKcxulj+9pWUPEiSspYpKgVTZmsRLWGdBxfpW5sMRG9uuXu/S6rUmkZg2HteL8kRyxB3aNhactYPrnKofuBpLr2uZQRaZeQgFaEiMMH+Fxi548x07BFG85nHNewPWFu/a1PP208AIlkDIkvhkC6n3Yyt4N+Ac2sATJ2d1SFoQTxAmGTHGKtNCDmVhmNrtEpo5nXgtcailDJcUKUapwX+PjOrGeoE9eEpaeAhfoRVUUC1W/VrkaLUrydksKnL+h9l9kpugBcaVGWxsYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sADKwJ62gk1kH7quL+/TnEW0G2Wp/GiZumjDR9mvDHs=;
 b=kSpk5Ck24mEf5cFA+jLlU8tVyR5hLbxwhL0IUfGb3j7x20oicGUjAORfM8rduOJuMXfhmU+5n1Rgz7g2r1UTsN4fqoF+bwAIpAcqNEZOlrM76qzthhqiO0YFdtJudZohSpovFuUt/lj9fRfRxCvEVobNIbRbCRRKENU9j9wbv3pSoqNTYpZ4SXyCNiu/Yk84XqXDffPFrFpcOg4mqCmRrp5uHpC9FCOmsaRwJXUJwlOESZL5ECO9Xmfs7ER9j8Q3eFzbw/f8lRaTqw7s5QF7f44de3mxZN64TZw1Zc4hp0dUqTY1r8lK/w708NNZRChg4D0kAAXuT3N/bWoJ6gtvIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB7591.namprd11.prod.outlook.com (2603:10b6:806:32b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.21; Fri, 11 Oct
 2024 21:18:01 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 21:18:01 +0000
Date: Fri, 11 Oct 2024 14:17:58 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Sai Teja Pottumuttu
 <sai.teja.pottumuttu@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Szymon Morek <szymon.morek@intel.com>
Subject: Re: [PATCH v2 3/3] drm/xe/query: Tidy up error EFAULT returns
Message-ID: <20241011211758.GC5725@mdroper-desk1.amr.corp.intel.com>
References: <20241011035618.1057602-1-lucas.demarchi@intel.com>
 <20241011035618.1057602-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241011035618.1057602-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR17CA0015.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::28) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: 42f8ce6a-db24-4b93-c641-08dcea3a2fd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WRc/NMG73ES2rIYTRqcW6BNyAOklclE7+hNh6hLlNSIcsuproiCBrmwAQRGz?=
 =?us-ascii?Q?FMDPPtRf/shivj+HVv6cCQIETnhQWEG+RKZ9BC2pffOgFojj+V+xDt9fQzCh?=
 =?us-ascii?Q?16uNx96S86ibOWE8Q/sehhdxWDZiLAIVZj1123zdY7LV+Ik+2mBK9t3lM7/J?=
 =?us-ascii?Q?27kjJBceGgK6/FsFxoI5C2E/ZanECMVnlcEgCFVNt/3iTD3OVGOUZrWR3GM/?=
 =?us-ascii?Q?AqQCEHa39kcf5yISVUP8OyNAYDpr1zXdbF8Qxijqj30JueIrKSJ64N5PbVb8?=
 =?us-ascii?Q?BfvRHmuHAdnDD2Q6Ex0ympkfXgGzxtU2q1Pn0/yM+VL66B71It9cOY9e4kfL?=
 =?us-ascii?Q?XQ8buhknP8JuDzXUsgwzPTVTK/fez1d72nU1B/2lsyTI1sHdBbkE7HwTpXOE?=
 =?us-ascii?Q?rTdrBtYtQJlrzm+96xgPeyp4yfQFqBCb2e7Ia5lfylrakYdV/98N4nfXTCBm?=
 =?us-ascii?Q?4U9GpPsJ/Yy4MoGe4r0bVtutA/DwX5Rbo9iwb9CeBeGpZpXnbmFD/xao5Quy?=
 =?us-ascii?Q?q9f2IsFR5t7HdE5ycMPQyvw5TYzMRH8fhmPCwI9LOQXAXKotj9jkOJ3OFJPi?=
 =?us-ascii?Q?2jF+edibiZd7bWsVmkZhBQj0ygYihBcYDoE347KXYxK/LcXLuEsJBx9D5pFj?=
 =?us-ascii?Q?8xutzgJNyjUg3YL8gFnaaAEcoK032a5HUmFyRbu5d1tdcK51mSj5pUDmW+/s?=
 =?us-ascii?Q?vnGjeJWD6wngdKDyVHYo5M91BtakE3v+EgLuaBtOl2k8hvdxLWt24h293bw0?=
 =?us-ascii?Q?E5LLW5kgNz9gdF8LmUmt39UKWUvSq8LDbgsTqDMZVSNQM1MhKyeNZT+yKQFs?=
 =?us-ascii?Q?+NOqoBHD1JKbLJRdceeV6DPofqamPgeDz2Tt/kOgBCii+Dpg0U6rD9Kb5OB2?=
 =?us-ascii?Q?xL8P6rr8ZqSRmaojwYOr9hRFg6Gn0Xl2PY3NW1ET3MWMIUvm4YzIAFONLNjm?=
 =?us-ascii?Q?5lyPqIviBfePs4j92AOVsBusgRGOz5W3pdr6w0k8CciAShY6T4e3Ou1AVC4G?=
 =?us-ascii?Q?xc1c+nhJd0ORiLD3sdv4fkm5M64MGALgOBoihBbQ5uQPjscKrMrpk3ZilQ+S?=
 =?us-ascii?Q?eLhykBtr//zbg8YlgTya/Y71v+1Z92pCdaCRBHmMV5/WivQ1agGypF2absQ5?=
 =?us-ascii?Q?zqyBO3hjBCz6N/u2uqRcFc2i10QVSnbzmrukTLRKTo5cBx+bDytZcoxmns/8?=
 =?us-ascii?Q?e5XPjd89OsjiYN76zKmDVo5wCQUft19b0LTONBxQBSA9T5smBU3vKuW5XjRP?=
 =?us-ascii?Q?XA0SZsLlyYcO1lixYF6pgh/lypMLHVAIw8Zxs7ZCJg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oluNQbweHQy0ELRJUVzvWUjSQFhJW6EeEWuwDmW4frUDWIwOLRgg59coUdpF?=
 =?us-ascii?Q?fizOQP7fL7y35FizTs043nqSpcTdnCfHsohy9mrgY02d4Z8AR0Y5Q2MukcAP?=
 =?us-ascii?Q?KZlJVLDlgrTDCs/22gtnnJl3WEW+Rpx07uSLHOHnAPjo3Tlozlr9tWWPBq/c?=
 =?us-ascii?Q?6GM0g9zEFKI2+WbcCpdovCUb1iCtn9wOtDWzXuZDcYCatimxPz2QSYSy2pO/?=
 =?us-ascii?Q?de8hu5iCu0ko/brbk+GN0C5Ubb2OCUOcEVs+bEO+BxJy1NntqFNWcgheV12J?=
 =?us-ascii?Q?s5LDze1tESG0DyNhahC3fnvi7TTw/jRH3gXaD2yCcp7YbtHe0WGXJbRs7+GC?=
 =?us-ascii?Q?zjZcv/X1qG62+6Yi9NCydBK5KfdioOw17FSRDhw4jLaxkwAb4BGKdBs1Li/m?=
 =?us-ascii?Q?4MVdGYDsXBvHuKo/p8Bl64F3TlFqS+MTN6XDjz3Pj5hRCMLS1IpM5aIxT9K2?=
 =?us-ascii?Q?TOv1vC/Xavj+jJtoK9Y8lHTAVMcTtAuebBFlCK8ffWfFGo0lFAlWEDk5Qotc?=
 =?us-ascii?Q?c02WJEDfJpPuIcYQq0SAww4lM/vCB9mKg+cG+oUzV81/8JlEtZOtJdOVytp+?=
 =?us-ascii?Q?HcGzipfYa/U2ad0eh316JotaAipztiNsk3fQrBpT/btpXCRKK+mJ/lfHpfG5?=
 =?us-ascii?Q?88lYwFc5314nhzm7o8SXzb/qi0IfG1S1UiOVhBxhNuL5G0wVIpE0xRHgPAUW?=
 =?us-ascii?Q?DPvuXLocq6jg7HlX+ZTixfAa23Fb4RWDz7oqG7kM4DY3EguH+tMjP1am/DjI?=
 =?us-ascii?Q?zzBcUjtz0xYpF9VXQos2otFh92pcvdYNc2DX2T/fH4AFL3fP6faXLBSl+eMO?=
 =?us-ascii?Q?JIrX+laqdiIW91v7Cz1Q1vXDlNSmbYZBrx5srW/WVZHVU3GdgzimNMvGOj8q?=
 =?us-ascii?Q?Z5txe1cTJUUEewRjr2LlAg084Big2tOE1tntWb/KEkJ2XEysT5cgUVmUWZJF?=
 =?us-ascii?Q?oqQJ9+8Y2HbUQQuNQESa8Vo3T9gHMPxeXtnH/AIpbe4L9H25gYPRGojcm3tx?=
 =?us-ascii?Q?4ESq+hZpfXRwL/98TQlyuhukZ20+/CDZXMytI3sSjIHsej+wqGfcFWGIPoKA?=
 =?us-ascii?Q?VYn/ZMaW/Cef0t+KrZfgoFpSIqN8OWkDbYeJnd1h46/E/ufXo+3SrttHK0gv?=
 =?us-ascii?Q?OR9wPcQyTzXIWpqVZFlhbdSSocUvsBuZj/8Q/c6J8nA4k1XwXM6UtdAPZKvY?=
 =?us-ascii?Q?q15t7XEYN9npRbPZgswvKeHb35cBaA1prvLm+CrmcHW/XuHzXFwh6WH5LO9H?=
 =?us-ascii?Q?B8xb56CXEIlRjcDj6aR51kSTUSIctqnur0a9WIJoZI1TDazoDNNLce+abczj?=
 =?us-ascii?Q?cqx0/vIEliiEfOq2eRC+F55bISBYCRLc+g56yNMU51qYjZanFNDd5N4fYxjy?=
 =?us-ascii?Q?4/ovz2dBLQs1WdaHGCa7Hp3GaeEJ3ug65cSKFb5Rpz5cIgmv5gzqi2kwYcla?=
 =?us-ascii?Q?ZrtOEfQQNyI5I2Sxn+cNAS3DRjMgXTbeDiO9F9KAzrT6YahoVriCUJFD5v0g?=
 =?us-ascii?Q?zUNfiufHRMURi4HMDE/mMVDUkonyFUhyts2zDAf9Fw/7MdrQpuqxyI9Sm6KL?=
 =?us-ascii?Q?ZmmeQ4uY38wxKiABsOy9W2Qxe3ZGIVM3CY0YfxqSmBPFLDL1ObzcPFCA2n5x?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f8ce6a-db24-4b93-c641-08dcea3a2fd8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 21:18:01.2544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hIX+IIrYRHhL35Xb+nXitE4Z3fmWPwjujyW0HOhDnMZeYRTSsjD/WzNm60mUeuDPikzeQ4+YBmT46uWwMzrPS1mi+kqVyouEuilUycuHPmk=
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

On Thu, Oct 10, 2024 at 08:56:18PM -0700, Lucas De Marchi wrote:
> Move the error handling together in a single branch since all of them
> are doing similar thing and return the same error.
> 
> Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_query.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 69307ff4146a1..5093a243e9fe1 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -163,16 +163,10 @@ query_engine_cycles(struct xe_device *xe,
>  		resp.width = 36;
>  
>  	/* Only write to the output fields of user query */
> -	if (put_user(resp.cpu_timestamp, &query_ptr->cpu_timestamp))
> -		return -EFAULT;
> -
> -	if (put_user(resp.cpu_delta, &query_ptr->cpu_delta))
> -		return -EFAULT;
> -
> -	if (put_user(resp.engine_cycles, &query_ptr->engine_cycles))
> -		return -EFAULT;
> -
> -	if (put_user(resp.width, &query_ptr->width))
> +	if (put_user(resp.cpu_timestamp, &query_ptr->cpu_timestamp) ||
> +	    put_user(resp.cpu_delta, &query_ptr->cpu_delta) ||
> +	    put_user(resp.engine_cycles, &query_ptr->engine_cycles) ||
> +	    put_user(resp.width, &query_ptr->width))
>  		return -EFAULT;
>  
>  	return 0;
> -- 
> 2.46.2
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
