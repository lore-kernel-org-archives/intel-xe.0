Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9088ECCFA1A
	for <intel-xe@archiver.kernel.org>; Tue, 11 Nov 2025 15:07:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BAE710E5F9;
	Tue, 11 Nov 2025 15:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c5WUMhEX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B1E10E5F3
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Nov 2025 15:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762873629; x=1794409629;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=x60Wpc/7W/Fn5ASpjRd8zLLFo9aTT2rkIOuM2mx6S08=;
 b=c5WUMhEXpZr9Iw/N/9dHp3hHeskX1NdAwEMdfLaCZO/STz2lfQHGcFAW
 SzCc9zWKJ3RwTriwLKNvoSH+r0QCCEBuYZwek2Huxr6FWV1W82EA8Ix02
 JnmV00vVvUSgpue4KvYX4dmJof3cDgS7+40xucQoSXnY2cnIpHYLaZd9o
 QOvQv5+NEYIe/KJYIW2ptlm95SXhnz6RF5WjXY944v7/MQv6+a6eJFQEF
 wpC8DdxWqJgPktXVb5n+TFdT3kyM2GixT/iOyhAH3wsFh2+3La02zX3LP
 ak88N1hzRTMc29dxnk5w13ozPECDoHW++ATdfa8e34274bxmDavW0B/K/ Q==;
X-CSE-ConnectionGUID: en3ygw/ASiOQHwDPqA8Wpw==
X-CSE-MsgGUID: K/M5C6ghQfWcT055PImM3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="76038415"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="76038415"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 07:07:09 -0800
X-CSE-ConnectionGUID: Qms6K593S8yC79bgQXoQIg==
X-CSE-MsgGUID: nWVtOYWBQwqUDGyPoYsLyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="188296783"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 07:07:09 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 07:07:08 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 11 Nov 2025 07:07:08 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.38) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 07:07:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fvkbCE+Ve8uO8YSuTO2XrzfYcwWgF+vrnLtdHKD2/tze01wZpeHCsH7EV93yKTXIaBE+/WlXGtELtGmQWR7+lRt8Pe9An0CNgptHA0BBqSxxO6l3Ekv3qkgVuEOV6GMUHIQ/kimgI+mjVihYqZ7mw1Lglybu73NbbtN/8Xw8X/A10g4NDqoBz5w8+Qb0xyyo9UKCxQUSrNhGuOKOJRtFN77br7EmiHkbImnDuVuFgiXU9Ygt4NBOurcilxvBpZ6BwXK+o+KmsO1+SvoO4QJqRn4tJAst0uPRZgq/kSirI6CMWZAHnBrXYcdDitHSX0xtFRbHlDPPUYkAoXGP1kQ+Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5i9YSnr33i26H7g4T9dyzCEy0DGiRB/SDE+J+msjrs=;
 b=qqJDYJE7gt57Qvf53Ml1bErVNQVJ1IiXgbuZQ21Lw10Yns3vhV7CUwhVqlOPozT8+up/o/ZFgTjZPctL7C9ElM1D4wroD6bmuwXNXOfSknDcAWs+YLVSS8aGvgVxxqUinXA2UMUIu5K4hReWAIdQX0ZOr8RWvp0WfIfcGS44AmX/W+xzGXWr4n9VCD0kMWNjLxkmfbLtiZlmGCGbeSjacRocydsuduKUpagDaMmmnpQSu3rbfEej9XFfffVXcKrWJJfR0gCuSH2RFEcVQmp+lruVuMk5qNBbm9EUm6C16R9wXlVXoodekBXn5vkPyAzsbnGLA5CGofQBzPirAPHPEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CY8PR11MB7010.namprd11.prod.outlook.com (2603:10b6:930:56::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 15:06:58 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 15:06:58 +0000
Message-ID: <bf4d6547-2d53-4bf6-af94-6ed5cf74f311@intel.com>
Date: Tue, 11 Nov 2025 16:06:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/xe/vf: Introduce RESFIX start marker support
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
References: <20251107141015.29051-4-satyanarayana.k.v.p@intel.com>
 <20251107141015.29051-5-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251107141015.29051-5-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::18) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CY8PR11MB7010:EE_
X-MS-Office365-Filtering-Correlation-Id: fe8cab8c-f5cc-4acd-7ea4-08de2133f5b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGNvNlZqK1l6eWt5KzhMa1ZZSGp1M3IxaThQazNKNUttTmNmVU1sLzRxU0lU?=
 =?utf-8?B?MHk4RXRzRWtLVXlOK2I5ZmZ6UmJWOXdxU2E5QUUvUHpQcEhuSWdlZVl4MEha?=
 =?utf-8?B?MEZVYTZ3VmUxZ25BVGdiNHdSSVlDVUI4K3VUMTMzUThOT0R2TXVWMWRzNHQv?=
 =?utf-8?B?NlJxa29Gd2NGa21KNnJXZnVuYzhjbEl2NW9RTXh0dU9SMzlOSTIxek8zWnFU?=
 =?utf-8?B?aklXc0Y1LzE4NnA0V3N2MVhEQW1sWjZCSVl1UDF6TzV5QzlyK0NCelIyaWJh?=
 =?utf-8?B?NVdydlRseHF3czJVY29FUkNSUDJCUGFJUDBYRm1rcnQrSlkyWk1NejlMdTdI?=
 =?utf-8?B?UHVsMkJ4K3lQZ1gvOXNGWFlWTlNCOEl5bEJndWY0SHEyTUZ0bXZsZmkyVlZI?=
 =?utf-8?B?NUJUb0N2QkZ3Q0hZdXlUa1gvL210M1MwcU40NXVsZ2hLVkFodmw1NnFNOHBT?=
 =?utf-8?B?V01MdzdHZnBMQ0hwTzR5RlJvMkEvWjBCTmV2elNuZTdQMXJTdmE4blhGcEwx?=
 =?utf-8?B?cFFBY3o4V1lPMnJSN3hvVmpLelFULzVuTXVtUUxwNDA1ZXovcTVXUk5ldklI?=
 =?utf-8?B?TVRnazExMUwwaTJZaTg5a0VBbWgwQmVkUDNQcEw3bWdGdzcrTklPbnRwbjhN?=
 =?utf-8?B?Tkt5cThDeDZEZnYrd1puSlM1Y3ppNUtaMzg3eFV3OUNxT2szR3dqL0RGbzRW?=
 =?utf-8?B?RFJHRWthUWVDRldtZXg1UmJvMVhCbXFZU3hNeHd1bThlK3FlZlVrcTBIZXhX?=
 =?utf-8?B?UlFqbmVZTWVLOFVxUmFiNDBLUVlYOEVYdTVKSXgwb3V6dk42SkVFcFlRYm52?=
 =?utf-8?B?UzkzRko4Z05LUWVlZnpkaVQ0SXlxY2lqNE12dWdTUkZraEtqMENNT0o2R2lF?=
 =?utf-8?B?MEwwb1d0ejJyOGEvZnQ2S0svK0l2MTBPYXRYYlVLd0orLy9uZnR6YUpoUjZt?=
 =?utf-8?B?UXhHRkRMS3ltWDVNWnFSaUJCTjZGZ0RIZXJjOTd6eGNjUndjdTYwUWtZNity?=
 =?utf-8?B?K0xZYnU2UTJzOUt5RlkwQlIxRHRHb25aTXJkK3A1akNzN2QxaVVYM1d3Vmtu?=
 =?utf-8?B?K1BYUlE0N1JMY01JY1preGdpOS9HUTl2LzNjTVpPcHd5OFZPejhwUkVCdWxl?=
 =?utf-8?B?aVNkODJKREp5bTI0akNVRzY5L1Q0cVZSMjJMM1BjVnc4QjRpa0pwQW9HcnJ4?=
 =?utf-8?B?OUFrTWxGNEhhTnZrWlM4dUt2QVE4Ym9zNWgzSW9HdnJhOUFkZVRXd3FIbllo?=
 =?utf-8?B?UDVvdzRnc1c1aXFNQXIySm90MGkvMW1RalNIaW04bEdqTUViRGxLY3JrS25x?=
 =?utf-8?B?YkpmTkhFNkVHMEFZbVdTVnVxOGw5cWFmazE2SXVQRU8vSEFvUXdmRms0ZUgv?=
 =?utf-8?B?V3dmamJPakJpelNWUTA5dWlIRTB3Y1Z5aTZYUSs4aEo0OWJYODhwejRIMFp3?=
 =?utf-8?B?NVlNVk9IWHVHL1FCdWE2NWEyWFBkQ2JDMER2WDFZQm8wam93QnNwTEhkUURG?=
 =?utf-8?B?eXh0SXE3ZWlMNUFlOVF6cjVqNXFqTjZ6Y0lETjhyZGpuVlJxMCtpU3RTVDZ6?=
 =?utf-8?B?dkZXa3pTZFRWR2U0UEp4Y2xjUnAxSFFqc2FSejZ3d2pBeC9mSGFmS3pBd0VI?=
 =?utf-8?B?a2cyRjNQSVdqQ0JCSUJPSm8vUXVpeFVOeFhtT2U0aHp2NHFWN0FoZDJXV0xC?=
 =?utf-8?B?YUgrN1pMbjFpMmpwU1oyaVRERHRKU3FhQmxCZHhkL2w5R0pab0dRYitCV3Er?=
 =?utf-8?B?Uk5tRGpkUzRTSXB4eks2dG12SGxhWWI1ZU9CcnlKM0ljaXQ0eHJWdE15SUtt?=
 =?utf-8?B?U0lOTjRtVnhaVXBLY1JPS3ZjV3dEYkJZcjVUblJ6V05LdlErdnFJcmVtZWs2?=
 =?utf-8?B?OWlRWFVGQWllWDB2NWlUTWc4c1J3NkRMZko1bXlvaDZyRlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEtTZTNtV05oVTd2Y2VFTTlYUy9kWXJuMDdrR1dQWkpHazhRM3NnRy9wMEIz?=
 =?utf-8?B?dEVOTWQyc0ZnTWVzMnJONHNYU2V3c2FHV1FCSGFVbHY0QlVwZmM4bzNUOG9N?=
 =?utf-8?B?RW94SUpYazBmTzcrN3ZyUG9uOVNlWkg0SC9LVlBlc0tyYU1idHJWUm4wb1Ay?=
 =?utf-8?B?ODhwckxXUnBWb3Bid1F5blUyT1piWlY2T2I5MW9pY3Q4RlE0THpFRXY4T1BU?=
 =?utf-8?B?WXlYUTVxeTdXT3NDN1RsZ0s1Ris4RUE2eWs3WlphV0pCTXJVRjFMSS9YQzFL?=
 =?utf-8?B?ZXlMcWQ2bXZoMlo1RFB0dzduY2pVeHNUSG1oVm5TSHluNC9vYnFaZFpzNE1C?=
 =?utf-8?B?c0dpTm1jRWNnWG9Ncjg1Ym9rbHF1NktEemQ4b3JSeDJXSGNqeDR5RUo4cTZS?=
 =?utf-8?B?NysyR2J5VUhVSU5zK1d3YTdkTnB1UUNsWmxGQVJxTzFxdGNUZU1QbXpaY3hl?=
 =?utf-8?B?ZVh5RVhISjVHamhucEVLWXIyUy9kNGZKWXp2WjdBVGlPR2dQOTBXRGtUMDFr?=
 =?utf-8?B?MWJabWpVSXFWaVFacVZJczB0UWlLcWFIT0lacm5SQzQrVWo2aUt5cm1hT0RB?=
 =?utf-8?B?anBTclBibW1VcThlS2pJYlpmNi8rVVVHK1ZhK0ZZVWZJYS95dUFEakdCeEt6?=
 =?utf-8?B?b3U4a3AwcHZUNmpGcnZpQnJreVhadTBTUTcxam50c1RSTUJqSmlOV3RGeHdm?=
 =?utf-8?B?WEFGZVZNclBwZzNEMm80Mkp6Wkwvc3pXNko3RVM5eFBjTXZxVTh5cFFZVTZ2?=
 =?utf-8?B?T2pObDM4WEk5UHNsU3A0S1MxNWZlcVFKS0x0dmxJdWkwWERlb0U3TmU3MGZy?=
 =?utf-8?B?bFRIbVhYYWx0S3lybFdGSTFQRTRvQ0xMR2VhZnJER2tBRHFYeTdzTVkraXVv?=
 =?utf-8?B?Qy8veVV4NlVmMDd0RnZMdUo5dlJrd2pWN0lobDYzdG5FQkRTcXM0REtUdkpI?=
 =?utf-8?B?ZVpvMWpWdnVDalhwYWNFeFArSCt6TXUzbENzM0lxMzJDeU5pa0lPZVhLdVpO?=
 =?utf-8?B?N3JNTFZlNDZMQ0EwWjBBQ0hUOU54bEp1NUMxSm5MckVEc1RNYTFKc2lETWRm?=
 =?utf-8?B?d2xMQTJEbVBXSG9oL044cUN1bVNSanJXWW9GNFgyZUJ1UC8xMXYzWDhUSVg5?=
 =?utf-8?B?Qy9GdThIaDN2anV4VTU1blUyc1ErTC9NSFRTNTRITllmakcyZHdJNFJLaWt2?=
 =?utf-8?B?eWJseUlvS2tPenJ3N1dDOCthaWF1NnczaE5FZEF0WDZBTm5wNnBpaENxY0d5?=
 =?utf-8?B?ZUpMQVNFZzhCcHJQOVRpMjNib0s4L2NqeS9oVEJLTXFPQjNLeVVKQTB3S29j?=
 =?utf-8?B?YUsySWM1eGxWQ2hHK3pUU1NVZEsyT0xMSVhuY1FPNURjWndHSnJmQ3RQU2xE?=
 =?utf-8?B?Q2xHR1hpUU5YRUxvK3UzSWUwbmp1S0ZkOElZTksvN0MrS0haanFYYmRQUXlK?=
 =?utf-8?B?UERkSVhnZUZnaUkyekZ0aXIyRHo4WVpYYi85WGYrMWlVQUszRzdNRDhkMzkz?=
 =?utf-8?B?a29XMzlXL2xNNVN5bWhJb3FhQlhILzNwSTc1USt0ZnhZczRuN3p5NXFhNjIx?=
 =?utf-8?B?dTJtMDN5cCtOckhpM29lSmZMcUdhVG5QK2o1MEUvTFBnNmR1VUxRV3QwaUFT?=
 =?utf-8?B?MGk2YzRaSTFTVFBJNmtYc3Nhbmxua0JtS2Qvbk9UZnlUNlFXRmx6TytKMy9I?=
 =?utf-8?B?cldSZFVsZXA1c0FpSzNCd2JCQkdnQThsQmtyNnRDeTVxOVRXelZnYzRZaTFB?=
 =?utf-8?B?bm96WjBnSWNEaW9ld0NveE1vTldlWUh4bjlQV3VDNHJlbXN5Z3BobTVxKzBI?=
 =?utf-8?B?dks2V1h0TjRqODhnZXQ0N2hrT0FsY1JZZFlXTzhGVVZNTW1mNzhzVEM1MG5s?=
 =?utf-8?B?eExXalljR0pMSEJvQmQvOXNPMHNJZWwyUmN0SklMb2R6SERCTU9WNnBoenVm?=
 =?utf-8?B?R3lWTXJEMjFtNXJnMU9sSkxuTDgwMjYrQ3NscW5reExQSDc0L0hYYmZRT2hJ?=
 =?utf-8?B?cThOYTZMbzA4Sm1PdzA3S3dmQWlTVkRSRXJnQytCaFZHSkVxOFhrWWpneHdJ?=
 =?utf-8?B?am14K29jYWRnblJ0ekhMZ29JbjVManNMYnl4SkZOVUNRN0JRbVMwRDRNeEpY?=
 =?utf-8?B?aWZLcDNFTms1R3Q2cUQvaGdzN0I0UndQRFU5UFhXQU1QenpCdmhZWlhjVUlQ?=
 =?utf-8?B?WFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe8cab8c-f5cc-4acd-7ea4-08de2133f5b2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 15:06:58.3937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LEt9Gh2WOMLn9zdQUip9xjXDAq/0opVRgY6pCdJIjXc1bLGT/nlfP+doeTqEd3n6Nmg8VXJhGwlXbBxXRF85VQp7CRPdhsrg4xyzFnOGeK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7010
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



On 11/7/2025 3:10 PM, Satyanarayana K V P wrote:
> In scenarios involving double migration, the VF KMD may encounter
> situations where it is instructed to re-migrate before having the
> opportunity to send RESFIX_DONE for the initial migration. This can occur
> when the fix-up for the prior migration is still underway, but the VF KMD
> is migrated again.
> 
> Consequently, this may lead to the possibility of sending two migration
> notifications (i.e., pending fix-up for the first migration and a second
> notification for the new migration). Upon receiving the first RES_FIX
> notification, the GuC will resume VF submission on the GPU, potentially
> resulting in undefined behavior, such as system hangs or crashes.
> 
> To avoid this, post migration, a marker is sent to the GUC prior to the
> start of resource fixups to indicate start of resource fixups. The same
> marker is sent along with RESFIX_DONE notification so that GUC can avoid
> submitting jobs to HW in case of double migration.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> 
> ---
> V2 -> V3:
> - Fixed review comments (Michal W).
> - Updated commit message.
> - Fixed CI.BAT issues.
> - Added helper function to assert on unsupported GUC versions.
> 
> V1 -> V2:
> - Squashed "Enable RESFIX start marker only on supported GUC
> versions" commit into a single commit. (Matt B)
> ---
>  .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 40 ++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 98 +++++++++++++++++--
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |  5 +
>  drivers/gpu/drm/xe/xe_sriov_vf.c              | 46 ++++++++-
>  drivers/gpu/drm/xe/xe_sriov_vf_types.h        |  5 +
>  5 files changed, 185 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> index 0b28659d94e9..8bc74cbc1c35 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> @@ -656,4 +656,44 @@
>  #define PF2GUC_SAVE_RESTORE_VF_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
>  #define PF2GUC_SAVE_RESTORE_VF_RESPONSE_MSG_0_USED	GUC_HXG_RESPONSE_MSG_0_DATA0
>  
> +/**
> + * DOC: VF2GUC_NOTIFY_RESFIX_START

in the GuC spec there is no "NOTIFY", so this should be just:

	VF2GUC_RESFIX_START

here and in all below defs

> + *
> + * This action is used by VF to notify the GuC that the VF KMD will be starting
> + * post-migration recovery steps.
> + *
> + * This message must be sent as `MMIO HXG Message`_.
> + *
> + * Available since GuC version 70.54.0 (VF 1.27.0)

this is VF only action, only VF ABI version is relevant
we might mention FW version in the commit message

> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 27:16 | DATA0 = MARKER                                               |

we might want to add "MARKER - can't be zero"

btw, we might want to update (in separate patch) the VF2GUC_RESFIX_DONE documentation, with:


  *  |   +-------+--------------------------------------------------------------+
- *  |   | 27:16 | DATA0 = MBZ                                                  |
+ *  |   | 27:16 | DATA0 = MBZ (only for ABI < 1.27.0)                          |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 27:16 | DATA0 = MARKER (for ABI >= 1.27.0) see VF2GUC_RESFIX_START_  |
  *  |   +-------+--------------------------------------------------------------+
- *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE` = 0x5508    |
+ *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_RESFIX_DONE` = 0x5508           |
  *  +---+-------+--------------------------------------------------------------+

> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_NOTIFY_RESFIX_START` = 0x550F   |
> + *  +---+-------+--------------------------------------------------------------+
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  27:0 | DATA0 = MBZ                                                  |
> + *  +---+-------+--------------------------------------------------------------+
> + */
> +#define GUC_ACTION_VF2GUC_NOTIFY_RESFIX_START		0x550Fu
> +> +#define VF2GUC_NOTIFY_RESFIX_START_REQUEST_MSG_LEN	GUC_HXG_REQUEST_MSG_MIN_LEN
> +#define VF2GUC_NOTIFY_RESFIX_START_REQUEST_MSG_0_MARKER	GUC_HXG_REQUEST_MSG_0_DATA0
> +
> +#define VF2GUC_NOTIFY_RESFIX_START_RESPONSE_MSG_LEN	GUC_HXG_RESPONSE_MSG_MIN_LEN
> +#define VF2GUC_NOTIFY_RESFIX_START_RESPONSE_MSG_0_MBZ	GUC_HXG_RESPONSE_MSG_0_DATA0
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index d0b102ab6ce8..17f06cd63527 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -299,15 +299,69 @@ void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
>  		*found = gt->sriov.vf.guc_version;
>  }
>  
> -static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
> +/**
> + * When the marker is non-zero, the GUC compatibility version must be >= 1.27.0.
> + * When the marker is zero, the version must be < 1.27.0 — compatible with
> + * older GUCs that support sending RESFIX_DONE.

I'm not sure we would need this, as in the pending PF patch [1] we will enforce 70.54.0 as a minimum baseline for save/restore

and while there might different PF than our Xe, we might also want to claim readiness for save/restore only for > 1.27 on the VF side

[1] https://patchwork.freedesktop.org/patch/687116/?series=155785&rev=5

> + */
> +static inline void guc_resfix_marker_assert_not_supported(struct xe_gt *gt, u16 marker)
> +{
> +	if (marker)
> +		xe_gt_assert(gt, (GUC_SUBMIT_VER(&gt->uc.guc) >=
> +				  MAKE_GUC_VER(1, 27, 0)));
> +	else
> +		xe_gt_assert(gt, (GUC_SUBMIT_VER(&gt->uc.guc) <
> +				  MAKE_GUC_VER(1, 27, 0)));
> +}
> +
> +static int guc_action_vf_notify_resfix_start(struct xe_guc *guc, u16 marker)
>  {
>  	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
>  		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
>  		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> -		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE),
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION,
> +			   GUC_ACTION_VF2GUC_NOTIFY_RESFIX_START) |
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_DATA0, marker),

use
	VF2GUC_RESFIX_START_REQUEST_MSG_0_MARKER
>  	};
>  	int ret;
>  
> +	guc_resfix_marker_assert_not_supported(guc_to_gt(guc), marker);

START action is only available from 1.27 so it's sufficient to have:

	xe_gt_assert(gt, GUC_SUBMIT_VER(&gt->uc.guc) >= MAKE_GUC_VER(1, 27, 0));

but maybe, since other guc_action() functions are just simple wrappers without any extra enforcement,
move that assert to the caller ? or just drop it completely since we shouldn't be migrated on older GuC?

> +
> +	ret = xe_guc_mmio_send(guc, request, ARRAY_SIZE(request));
> +
> +	return ret > 0 ? -EPROTO : ret;
> +}
> +
> +static int vf_notify_resfix_start(struct xe_gt *gt, u16 marker)
> +{
> +	struct xe_guc *guc = &gt->uc.guc;
> +	int err;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	xe_gt_sriov_dbg(guc_to_gt(guc), "Sending resfix start marker %u\n", marker);
> +
> +	err = guc_action_vf_notify_resfix_start(guc, marker);
> +	if (unlikely(err))
> +		xe_gt_sriov_err(gt, "Failed to notify GuC about resource fixup start (%pe)\n",
> +				ERR_PTR(err));
> +
> +	return err;
> +}
> +
> +static int guc_action_vf_notify_resfix_done(struct xe_guc *guc, u16 marker)
> +{
> +	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
> +		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> +		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION,
> +			   GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE) |
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_DATA0, marker),

we need to update/add definition for

	VF2GUC_RESFIX_DONE_REQUEST_MSG_0_MARKER


> +	};
> +	int ret;
> +
> +	guc_resfix_marker_assert_not_supported(guc_to_gt(guc), marker);

maybe move asserts to the caller?

> +
>  	ret = xe_guc_mmio_send(guc, request, ARRAY_SIZE(request));
>  
>  	return ret > 0 ? -EPROTO : ret;
> @@ -316,18 +370,19 @@ static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
>  /**
>   * vf_notify_resfix_done - Notify GuC about resource fixups apply completed.
>   * @gt: the &xe_gt struct instance linked to target GuC
> + * @marker: marker to identify the migration.
>   *
>   * Returns: 0 if the operation completed successfully, or a negative error
>   * code otherwise.
>   */
> -static int vf_notify_resfix_done(struct xe_gt *gt)
> +static int vf_notify_resfix_done(struct xe_gt *gt, u16 marker)
>  {
>  	struct xe_guc *guc = &gt->uc.guc;
>  	int err;
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> -	err = guc_action_vf_notify_resfix_done(guc);
> +	err = guc_action_vf_notify_resfix_done(guc, marker);
>  	if (unlikely(err))
>  		xe_gt_sriov_err(gt, "Failed to notify GuC about resource fixup done (%pe)\n",
>  				ERR_PTR(err));
> @@ -1183,7 +1238,7 @@ static void vf_post_migration_abort(struct xe_gt *gt)
>  	xe_guc_submit_pause_abort(&gt->uc.guc);
>  }
>  
> -static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
> +static int vf_post_migration_notify_resfix_done(struct xe_gt *gt, u16 marker)
>  {
>  	bool skip_resfix = false;
>  
> @@ -1206,12 +1261,27 @@ static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
>  	 */
>  	xe_irq_resume(gt_to_xe(gt));
>  
> -	return vf_notify_resfix_done(gt);
> +	return vf_notify_resfix_done(gt, marker);
> +}
> +
> +static bool vf_resfix_start_marker_supported(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(xe));
> +	return xe->sriov.vf.migration.resfix_marker_enabled;
> +}
> +
> +static u16 vf_post_migration_resfix_start_marker(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +	return ++gt->sriov.vf.migration.resfix_marker;
>  }
>  
>  static void vf_post_migration_recovery(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> +	u16 marker = 0;
>  	int err;
>  	bool retry;
>  
> @@ -1227,13 +1297,27 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>  		goto fail;
>  	}
>  
> +	/*
> +	 * Increment the startup marker again if it overflows, since GUC
> +	 * requires a non-zero marker to be set.
> +	 */
> +	if (vf_resfix_start_marker_supported(gt)) {
> +		marker = vf_post_migration_resfix_start_marker(gt);
> +		if (!marker)
> +			marker = vf_post_migration_resfix_start_marker(gt);
> +
> +		err = vf_notify_resfix_start(gt, marker);
> +		if (err)
> +			goto fail;
> +	}
> +
>  	err = vf_post_migration_fixups(gt);
>  	if (err)
>  		goto fail;
>  
>  	vf_post_migration_rearm(gt);
>  
> -	err = vf_post_migration_notify_resfix_done(gt);
> +	err = vf_post_migration_notify_resfix_done(gt, marker);
>  	if (err && err != -EAGAIN)
>  		goto fail;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 420b0e6089de..5707bb808d80 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -52,6 +52,11 @@ struct xe_gt_sriov_vf_migration {
>  	wait_queue_head_t wq;
>  	/** @scratch: Scratch memory for VF recovery */
>  	void *scratch;
> +	/**
> +	 * @resfix_marker: Marker sent to Guc prior to starting the
> +	 * post‑migration.

... sent on start and on end of post-migration steps

> +	 */
> +	u16 resfix_marker;
>  	/** @recovery_teardown: VF post migration recovery is being torn down */
>  	bool recovery_teardown;
>  	/** @recovery_queued: VF post migration recovery in queued */
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 39c829daa97c..bdde6867dcd9 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -55,7 +55,21 @@
>   * When the VF driver is ready to continue operation on the newly connected
>   * hardware, it sends `VF2GUC_NOTIFY_RESFIX_DONE` which causes it to
>   * enter the long awaited `VF_RUNNING` state, and therefore start handling
> - * CTB messages and scheduling workloads from the VF::
> + * CTB messages and scheduling workloads from the VF.
> + *
> + * In scenarios involving double migration, the VF KMD may encounter situations

... In some scenarios, the VF driver ...

> + * where it is instructed to re-migrate before having the opportunity to send
> + * RESFIX_DONE for the initial migration. This can occur when the fix-up for the
> + * prior migration is still underway, but the VF KMD is migrated again.
> + * Consequently, this may lead to the possibility of sending two migration
> + * notifications (i.e., pending fix-up for the first migration and a second
> + * notification for the new migration). Upon receiving the first RES_FIX
> + * notification, the GuC will resume VF submission on the GPU, potentially
> + * resulting in undefined behavior, such as system hangs or crashes.
> + *
> + * To avoid these hangs, a new VF2GUC action `VF2GUC_NOTIFY_RESFIX_START` is
> + * sent along with marker and when GUC receives the same marker with
> + * `VF2GUC_NOTIFY_RESFIX_DONE`action, it starts scheduling work loads from VF::

hmm, I'm not sure we need to keep the discussion/rationale as part of the kernel-doc of the actual flow.

maybe just document here those new steps, and explain the double-migration problem only in the cover/commit message

>   *
>   *      PF                             GuC                              VF
>   *     [ ]                              |                               |
> @@ -102,6 +116,11 @@
>   *      |                              [ ]        new VF provisioning  [ ]
>   *      |                              [ ]---------------------------> [ ]
>   *      |                               |                              [ ]
> + *      |                               |   VF2GUC_NOTIFY_RESFIX_START [ ]
> + *      |                              [ ] <---------------------------[ ]
> + *      |                              [ ]                             [ ]
> + *      |                              [ ]                     success [ ]
> + *      |                              [ ]---------------------------> [ ]
>   *      |                               |       VF driver applies post [ ]
>   *      |                               |      migration fixups -------[ ]
>   *      |                               |                       |      [ ]
> @@ -114,7 +133,9 @@
>   *      |                              [ ]------- VF_RUNNING           [ ]
>   *      |                              [ ]      |                      [ ]
>   *      |                              [ ] <-----                      [ ]
> - *      |                              [ ]                     success [ ]
> + *      |                              [ ]   success (on marker match) [ ]
> + *      |                              [ ]---------------------------> [ ]
> + *      |                              [ ]  Error (on marker mismatch) [ ]
>   *      |                              [ ]---------------------------> [ ]

note that in case of double-migration we expect dedicated VF_MIGRATED state/error

>   *      |                               |                               |
>   *      |                               |                               |
> @@ -169,6 +190,26 @@ static void vf_migration_init_early(struct xe_device *xe)
>  
>  }
>  
> +static void vf_resfix_start_marker_init(struct xe_device *xe)
> +{
> +	struct xe_gt *gt = xe_root_mmio_gt(xe);
> +	struct xe_uc_fw_version guc_version;
> +
> +	if (xe->sriov.vf.migration.disabled)
> +		return;
> +
> +	xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
> +	if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 27, 0)) {
> +		xe_sriov_notice(xe,
> +				"Resfix start marker requires GUC ABI >= 1.27.0, but only %u.%u.%u found",
> +				guc_version.major, guc_version.minor, guc_version.patch);

shouldn't we call xe_sriov_vf_migration_disable() instead ?

> +		return;
> +	}
> +
> +	xe->sriov.vf.migration.resfix_marker_enabled = true;
> +	xe_sriov_dbg(xe, "migrate: Resfix start marker support is enabled\n");
> +}
> +
>  /**
>   * xe_sriov_vf_init_early - Initialize SR-IOV VF specific data.
>   * @xe: the &xe_device to initialize
> @@ -188,6 +229,7 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
>   */
>  int xe_sriov_vf_init_late(struct xe_device *xe)
>  {
> +	vf_resfix_start_marker_init(xe);
>  	return xe_sriov_vf_ccs_init(xe);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> index d5f72d667817..626c11a6dd1b 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> @@ -38,6 +38,11 @@ struct xe_device_vf {
>  		 * was turned off due to missing prerequisites
>  		 */
>  		bool disabled;
> +		/**
> +		 * @migration.resfix_marker_enabled: flag indicating if resfix marker
> +		 * support was enabled or not due to missing prerequisites.
> +		 */
> +		bool resfix_marker_enabled;
>  	} migration;
>  
>  	/** @ccs: VF CCS state data */

