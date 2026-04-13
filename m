Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C81F531C2
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 18:17:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FAC710E444;
	Mon, 13 Apr 2026 18:17:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CmsJDd5M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B38D10E444
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 18:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776104251; x=1807640251;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uaOREofaCtzm8AxKXMYJw/24thceoqw5OYBW5XaM1KI=;
 b=CmsJDd5MaTORtQsSgHRSQYEEHxbkzVXpCXrDqPSikT7uGFAZ2jAS8Z7+
 icQO2lbasvbySC0qR3NiYdTR6IBNsJNpReMe1qqGUnm2vE3tYzDt578Th
 48X0QePnnWnSnDNRNGhmgohHxU3P/lNwM+9JrJWHgwJo4q3Dmw0/U3Ce+
 wau1RDpTCNLcHIgM7DLioTayh1KTg7gQ7L1enS+vslcrjhXb4EoOR5Aeb
 YKShE11JIzIlsbEHXej6vgNR2IbuCVu0r4tmBPPsNK7TVikyn6CpPM71X
 N4wY5i7hfPfn7u6TGbRkgURreiOs7biQ/sxD+P6QSTbReLAExglGVNKgE g==;
X-CSE-ConnectionGUID: O51Gew47TNiYnNUUp+8RHA==
X-CSE-MsgGUID: xZPErZJmQ0q9jG6JZ4boqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="80639279"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="80639279"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 11:17:31 -0700
X-CSE-ConnectionGUID: 0zuNsUMlSi2Y4xzpb8ov2g==
X-CSE-MsgGUID: sh7D3wXKTlezqZC+QjXt4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="229740734"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 11:17:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 11:17:30 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 11:17:30 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.67) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 11:17:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PqZ2aawD3aXbWS0Pg3kYVzIfP2YP62YJGkoD3DFUhurOSQo8MUl8U8EYOVJCKa2NC4RpriFYWOij1HQJ1qpK9gUznj9zc8Ge8O4qPTFMlfmFo+X83aUh2TTjY9+1SWUL8o5LHu4uzbg2ofnt73wVjO/v0dpoOTU3xLKi3woAsZqldXKqWrabpyu+xZ7Tj4lKRp76B1/PoLHVBF6D7VnXUyXmrdNbduS/G4NVfq51uyvHZLdC4pmzYqtrK0s+j9aTxnxtJfaze7sifMZzF2Nt6A+ki+N2s26O+wn2anOKbkwb3CFhHylFd1KdNnqXTg+SFDQN/bHSz44mQJEh88FrlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YioY4Sy8bIsEklZb8AUKVNT68j88ro8mQ0diIafUdFE=;
 b=XeYyObAqoc6kQJI8RhJOoLRUrXrCzjGOuKkEphVAjtsxHpzrrOZqqtP8dWR6IyBRgex+kjRpbkSdjMlVEqyLmb9VS9RZOo0gWeI6I2MVApNF3v/5BZgiFAkZnEyeWRhDCbKjAPI13IjCZo4loS/DUG4l9xGf9Qkpqusfuho6dTh4RlK0yyEHbu1PPtwXpm8qtThJDe/T1LE5+hCS5a+it92lJR9KbBVjwGYw9nSRukGWt2Cty7gvqhxXZz3pI8fQuCR0yGCV73vnhGXfusHvKnWiZ/3XaMhPxJYfvMUNZCDX5ANoOJffJxANb4WsQVIn1Sk4dz/PVw2XZNev1WVtfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by DS3PR11MB9671.namprd11.prod.outlook.com (2603:10b6:8:38e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 13 Apr
 2026 18:17:29 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9769.018; Mon, 13 Apr 2026
 18:17:29 +0000
Date: Mon, 13 Apr 2026 11:17:26 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: Re: [PATCH 5/5] drm/xe/multi_queue: Whitelist QUEUE_TIMESTAMP register
Message-ID: <ad0zNj3QORegCw05@nvishwa1-desk>
References: <20260409203714.1887402-7-umesh.nerlige.ramappa@intel.com>
 <20260409203714.1887402-12-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260409203714.1887402-12-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: BYAPR21CA0021.namprd21.prod.outlook.com
 (2603:10b6:a03:114::31) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|DS3PR11MB9671:EE_
X-MS-Office365-Filtering-Correlation-Id: 97cd966b-a26e-4d18-19c3-08de9988ec30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: ++0baespQezkLHsCaEQ/xXCw43YKMfNOQJmHaWjkckV7ruVxlSoRWgrnKGJTRGUnCZZf5TPOHtfAN/TL801Du69lyVYabX8/Isy/5eP+EoushSj1WMWoZvHRjkGq2WZqNkLTkAnfb2W6u3bDwjLK85V3j26tA44bkkqe57IvMr7Hkrh9oq/1fdN1SqEz7Z3doJhpGlCScaT4dOycRgH5US67yK2Yi5P3brhiHP8hkWRpTP7EEJLu3h1rEceBHr7sOUm0GOOEJVDSsrJjDC1pJ9ZRWE2aweLv3NUeXSomRU0xZhI8UuUwDA6t5ZH6Aau4JYdhW3VIFoW7pSyJ9QaN4D7rt1boeH2HtDqgRJjgGL+3U0jUubGeUq4IXn9gN70PLsXWJ64SvTF/DILdDV1HhrfReD5h16+7Ru8Qjulu+AbZ9mT8mW8JPJzcnIVsvg/HmSXLFMWmNJLRZQKm9JY3PMEsX+8l6zvmZQxdg0BLBE4l32RdLU+1SD5tIy7o3NSrCW1LR+coPsSkyydc63REjVSodpqwkKpat2Af2EFQiCMIL//FIKeow6HRb9QDTAwYlpbh010weshRJF/STEm+wk2AV7FyrbIm+ppnOTrHnCJxyS2cBxad7XwBIAIED64g9epwOxn5ImDY9tXS1iJmIfFSsHYpPZJKI0mD9omS8iODGjvMCAENmqU5sw3yMXqx7jixB5lus8BkfMqT2b/PKe9vro9uWKWrPf1uI8lOevc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MmpgWEra8xZlgkQ6og8clpJQ6DWrcVCzcq4FhxBXKRuGvpvMxUp1b8H9tIjt?=
 =?us-ascii?Q?XatO7eCvjfuGE1Dee7H4977OM4McSaaAz2259I1R2STiD8NAhm/PeBcMgec1?=
 =?us-ascii?Q?mmEtFzaZgMHHMWGhZgc2RtozPBO3npiYAQFAjdEQL4zbKGEgHaEgmoJX9SxG?=
 =?us-ascii?Q?pM433N7bERAturiuha/aA11csu1MATcHcggXw5hZTaPrKAVTPk8I2xb9Taul?=
 =?us-ascii?Q?twQW4Q2g/naCujhj/CSumaHq6KuG3Pmq0BDLXWT/tfy3Ym/yxzcnTkzmk7fF?=
 =?us-ascii?Q?6VDPoJcJB5CTNJMhXOYuK7T1QCiasbmE4PBwPr2aZIcLVUlpuPKI/3Uu5Abn?=
 =?us-ascii?Q?rEKzBSn1jP4NZ4bRvrw71KaVMT5mn/zrYHtrGDe8g7zFX1A6dNSdUC/6Bd/E?=
 =?us-ascii?Q?0lhve6QNDuFp+FL696Jpkly+HzBWDzpEW/k9olPsg5oSLBiG8AEOJ4cuPseH?=
 =?us-ascii?Q?gcnvj08VtmlCD3rgJ90TwWqkAqKJipo2upqpX5aZ1PckRNfrIhnCIuzAbXJq?=
 =?us-ascii?Q?w0N/FrUB1DxT+WOCdHPWQhB20d62Bj/dyAq6maBlVHX9Z7QgR7naEQfh80hY?=
 =?us-ascii?Q?+ql6iHMD/YPDvUbgo5+pLpfhY7N0kgmgm94NdldA1B9H4tmwJC9GCMuXM00/?=
 =?us-ascii?Q?pbUcoFrSZHi0vvFMm/f5O0T9XzADVfkZYuaWi/tyD+oFHVWskX5Fe6Urt7AU?=
 =?us-ascii?Q?qA4RmV11r/eO1Ijn24YcKv8+kUbYRYw8neq3jL1cjy0XKBT3RCMnClxeDvaP?=
 =?us-ascii?Q?uzuk4nqPQxaU8NVomUa7ZeAz+vKVDZ2SElkcb5M9pKqGRFZsftxZPm7E81y0?=
 =?us-ascii?Q?LIdlWWxlmK+XM6wCrdCVK0kC7u5nzgUkioKwi/N1IUmkRRak1X2I4ruON3Yo?=
 =?us-ascii?Q?zGCzp2YkVWu9fUpMt2LcRHGXGyCopqMluqUnpuaiiZRR4yyPSJL+yUTZMaLQ?=
 =?us-ascii?Q?yoPhxHYflgPRnb4XWhqF0vsf1crIAxyF0o/D+xKYCQy0yfr6uvR+VYmD6bsO?=
 =?us-ascii?Q?NbwF520adotNHD/fzTDjCwOvch+onkYztJM9CU1i/hJ1tun2vrIDmtVSWN74?=
 =?us-ascii?Q?YdzoLnsnydDinI+CD8KW3efIFP6xpNwAIqJ3LEW2tHdSHZh1Wu4FGpsk3Hgc?=
 =?us-ascii?Q?tB00ao0ICCs8zTBdMxoU7T983DbIwCXZIlgblwtbsbkp09yaxoGCe5TbaK9M?=
 =?us-ascii?Q?JqCmnjEgO83w8qP3P5LOnpcjvc1bHCCQ7nS27oxHDByis5PJd3IJS1W5Wx3C?=
 =?us-ascii?Q?17j1gLx1+sAjAURiXBLf6+7w8nVXY2MNtPZHoBA+m3Z0/Q3ceGwXOuT+s0yq?=
 =?us-ascii?Q?u1onizyAkBmXaq/REWk1rN3EyNeGPVMpszcj8kr8LP8T5YIuM8uFmDutA5gW?=
 =?us-ascii?Q?8BmNcduiJrslbJVJDKMQydef9AzmpCcn8ILqOypM/7SpH/NnFKnhFULc7MZA?=
 =?us-ascii?Q?RSJqERrPxwm8eISkbwAUkjAo9I/oXmvbyCDWkg6iKCh8yhja0m/lau0oaEnX?=
 =?us-ascii?Q?MO13QHQicgbpMx7j+Xl7jxCpZo3UIRDbU4ksqOpFRj+qNu4mFf2hHDTXz4RT?=
 =?us-ascii?Q?7qBrn7I3aJmCQm7lza2U79cK0PsHuPSQqdqULkZZgNhgWAdn2ndHdFoF4zeW?=
 =?us-ascii?Q?ph5/TsAzkf9v2uyibqVZRJ9R1bjnLOW0LBsaN2Pb30ZUsuKX7sk4oub8lTB7?=
 =?us-ascii?Q?F1QCcjjffDkfBz/B2B8QQo2PnPordRk5XHKpu/UYn2aWu6BcRdxJLqFRargU?=
 =?us-ascii?Q?t1G2X0x886o9/eeIxG/+652s3YeNBIJA14C6ls2CDNTJiQIyxMcc?=
X-Exchange-RoutingPolicyChecked: wHvJYKleXgYmqD2T/QaD6UHJdf75wLG6EpMAlgEm8RsIMEU2dde0RlAAvzeqP5uw9Pan4ZCmAj3sQDtLOgIzF6eyAv0RrhyzX5s/D1O9v6wg4oTxc1LhceRsmxI8PWGIHoKscAJwt7NaZZgBueVjry1f8Nt/wsQRYAI9u4xmYjW07U0HGi05HrJXZEPMJ5+3YkY3rz6r8N00vXh4K5G9DE+MfOdv34dd1bb1UJUtGnI9ZaJVGykcQWPV0OoeVYYyplQgQ876LhOXLDA3DwyHX69DypgL5s7/PnkTHnb1u+F42PXDlY3DQBCylcm17K8oNboQkNQci4YFEhsW5F+0Pw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 97cd966b-a26e-4d18-19c3-08de9988ec30
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 18:17:29.1439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VwaebCdmUg/WKlfySKRoDODE0MAwabXR5u6nGq1f46aAwysC39yV8kOlBe0yrnw0ZW4rYUozZ3tyWYG9SG1BIZjGlHYHrcRlo/M2PyjirWZBX4x69pidvW05Ymv0+HLb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9671
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

On Thu, Apr 09, 2026 at 01:37:20PM -0700, Umesh Nerlige Ramappa wrote:
>In a multi-queue use case, when a job is running on the secondary queue,
>the CTX_TIMESTAMP does not reflect the queues run ticks. Instead, we use
>the QUEUE TIMESTAMP to check how long the job ran. For user space to see
>the run ticks for a secondary queue, whitelist the QUEUE_TIMESTAMP
>register.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
> drivers/gpu/drm/xe/xe_reg_whitelist.c | 6 ++++++
> 1 file changed, 6 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>index 80577e4b7437..4517465ad423 100644
>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>@@ -54,6 +54,12 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
> 				RING_FORCE_TO_NONPRIV_ACCESS_RD,
> 				XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> 	},
>+	{ XE_RTP_NAME("allow_read_queue_timestamp"),
>+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3500, 3511), FUNC(match_not_render)),
>+	  XE_RTP_ACTIONS(WHITELIST(RING_QUEUE_TIMESTAMP(0),
>+				   RING_FORCE_TO_NONPRIV_ACCESS_RD,
>+				   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>+	},

NIT...We need this for multi-queue case which only applies for BCS and CCS engines.
So, may be we should put that rule instead of match_not_render()?

In either case,
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

> 	{ XE_RTP_NAME("16014440446"),
> 	  XE_RTP_RULES(PLATFORM(PVC)),
> 	  XE_RTP_ACTIONS(WHITELIST(XE_REG(0x4400),
>-- 
>2.43.0
>
