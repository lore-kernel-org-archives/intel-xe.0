Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEDAC87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 16:31:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF5310E372;
	Wed, 30 Jul 2025 16:31:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HmRverhR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E8510E372
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 16:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753893068; x=1785429068;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5FOy6wtsMqLadq1zCk4Y+E/yWvnNdFsit56HsLO1XMo=;
 b=HmRverhRISsaolqSBxXjlnsHtOJhTS9zEgs24cuWohSUpaOA5bIynf9j
 c6SVkBluScItOQlI9bsNHZkeqtMOAEHAC5qaUdyd9UjmbWdxXU69QP8ts
 1zBjXFWR07t5ggoDUhQNSfYabantrv8QcILH1gvW6ZA8yd6XAyWezlhtx
 vguZV8f97VD30WrMxY7fosF4b1Z6kDDa3B/m//vCN+s7KBfdIaEM/s4KM
 s0fApg7UxBTT4nKkXfwr+dryMI9QuH+RCTjoXJWq388rYbzOcDtarFhRS
 p5SnH9Bt+4ewVIm2XYq7dYQmDVXWCrJY+q6aIWwDU0dW9lXcPswaJpsiH g==;
X-CSE-ConnectionGUID: YT9BvbHESgOpDRBsgMvejw==
X-CSE-MsgGUID: eu3lE4vRRWC8B/4bCheV/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="73790548"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="73790548"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 09:31:07 -0700
X-CSE-ConnectionGUID: ZCaTfnwGR5qvaYIQ0iOaGw==
X-CSE-MsgGUID: mdndW8R4SQOCnWSvL24E/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="167206633"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 09:31:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 09:31:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 09:31:06 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.59) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 09:31:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xzOpTvsbFs/TrRKWfzoB92SqC2JrHuiFo20b1ivnkcYc0wkjv/pEZmkZd/3bKqpjnT5vY5k7uxXQmpKsa3Vkb1Earo9CXZkZtW7fcUcjp27PDniJdm4Emcjo3PYmJVqxV3UF4fvUmaDc885s5FDeE6K9a7rqAFDk4V45Q0maztOXeVxqdp3uAEPbx/h31t5eczn5TvSepGzPTkzIsQpvmbj4BFgBA+A+syMv3PZotlBkSuuogMtwgq0/1gbOQbu5uILv4KR+ByzSOVB4eI/+QE1/LzoU2kLDwYhPY5v/IQjeeT3YB0DHoCX9ST3JblK0JguY5Zv6aiZtGQ57OpDjqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6CFox+f8MTBRdMCK5Bs/1cVgGs7wfIGRKa0Ym1UbTo=;
 b=p+EFitozaBjY75qlrotVd7042PWZg9iKYR6vZLWxmGwTh15UmxE9WyezR+wfqZyj1Lh7p2QAtcXKwot5SQremQqZ9P7nApS9osLXumOVjvGgo5L7/urev0ezNBBj2INKvW8utmOR1Pc9PZKQixIBke0ylnqSo+nmBiaZMMsAtIDVjTEYZbw8VVl1OTvW07dGagkWKcQInlww+IhsTu2LcTTD7zc9H85W6+5zeyLwXNAPWV0PJACPW1UxYhqpQP3pWKY552BTGyXYqJLADLW0xWmFD8l/KdieC1KK7j7fsKXGyVoDqepu17vpcFaIpbxXIg38e2Q+yo5yyBh/2SkwTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB6193.namprd11.prod.outlook.com (2603:10b6:208:3eb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Wed, 30 Jul
 2025 16:31:01 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.011; Wed, 30 Jul 2025
 16:30:55 +0000
Date: Wed, 30 Jul 2025 12:30:51 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: John Harrison <john.c.harrison@intel.com>,
 <intel-xe@lists.freedesktop.org>, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v5 10/11] drm/xe/configfs: Only allow configurations for
 supported devices
Message-ID: <aIpIu4UdcmVDCzur@intel.com>
References: <20250729114215.177586-1-michal.wajdeczko@intel.com>
 <20250729114215.177586-11-michal.wajdeczko@intel.com>
 <aIk_4BBGSuIp19WQ@intel.com>
 <311dc290-d5fe-4214-b332-96337f3c80a8@intel.com>
 <91cb7b75-3fbb-4749-b048-de55a9599ada@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91cb7b75-3fbb-4749-b048-de55a9599ada@intel.com>
X-ClientProxiedBy: BYAPR21CA0026.namprd21.prod.outlook.com
 (2603:10b6:a03:114::36) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB6193:EE_
X-MS-Office365-Filtering-Correlation-Id: 86a6e49e-f8a4-47ad-addc-08ddcf8674f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?sPhFpVIyJFxJ/rqyKqRneD30DQlloaA7uMydaKdJUV1sSIj2LWn7M0EfMb?=
 =?iso-8859-1?Q?SmzonHeQrHe840zpLZarJIrCK5egnshL+DmsIFIYmoDdt3zbsr6ZvrKT72?=
 =?iso-8859-1?Q?JQj4EawqZbhShaYgFr1+mvprQaOMkUhE8zchE8aXws2pImdKtd4BewJ1XA?=
 =?iso-8859-1?Q?rUhyzNMaV68YA2FSJliOymQHeWLCA4/rLq/ZG/4tko80Tji7E4g/MFwPW/?=
 =?iso-8859-1?Q?TY41TU5EXBbwFHrUr65bMIufVIaliVehT1mL7xoNAQX6eGM/ATW+k3WspB?=
 =?iso-8859-1?Q?ZmshCC1hK9aMYXdXm/KwyBlAbxKMdv2c2d5LktJReJfz4OqyszhyDK2b8q?=
 =?iso-8859-1?Q?eqSErJdib9St57Zvt0toJAxyvZm1xvcBS0p3RqKGc3XmOC1aVYuEZVlUSy?=
 =?iso-8859-1?Q?KSc8f9oh7eddjUIKBDuQXV9pC7Hsh4vCEJjIfsu1O4HDQLKFJX/KhGg+Sy?=
 =?iso-8859-1?Q?ksU5SsZE4tAYr9VW6XTgQjorYmaHelPl9/ewcNMH4Dap8dIo2l6Ak1qK+x?=
 =?iso-8859-1?Q?+f+YGZiYXrj08QZcyZ1F47IOS0MAgvNRKACYz1L4SdNvrNxW8e3ca9haqj?=
 =?iso-8859-1?Q?Ubdu/9UU1TUMYTqHUoE7e7ByWWjeBfGa+0vaQ1/QCj1jDDtN+BVl9wd+0e?=
 =?iso-8859-1?Q?3UijPP64158W0nzq7V6F/gMvoehNuZp+M0MuTmSPX7KWrEWeO7EyqZ7d0e?=
 =?iso-8859-1?Q?rR24cRDSbjZYuw9+sCVlhX0VmLrD7iWbrsHhoqXbcqT+sjgAfLCr5ZLjRZ?=
 =?iso-8859-1?Q?aARTaHJyYa4F6RIDI/UniIzrUvD/ZSY/27TrFcfkWzg2KITF6E+bQOKr4S?=
 =?iso-8859-1?Q?Xts0Y1BtrYeb24pjeeqwxrqac8T5mDk7MWynqIHTSw4ovIHxWCI3Jxs1j7?=
 =?iso-8859-1?Q?tLfCJ0abi074EgQgOxyu45Zelbuq9z53KVukbed5KWwU1GmFldIH5mOtRT?=
 =?iso-8859-1?Q?g+VYLAMSn33myrSonpGAnogy/IjszrFIjDv1/ZkcLjMPeIEzxfznRks7pw?=
 =?iso-8859-1?Q?aur7cgSzSHtkdMeHj+xQxpujSVu07DCdCH5dPM0Iq6HzrvSeq1aMtKXv1C?=
 =?iso-8859-1?Q?6LHICMi9BW+jn4eHg60qt1XUubK+6D1ZsYlxrKGRes7/47Nl0uvA4parWw?=
 =?iso-8859-1?Q?AaIGpggnYki3YOuAI1ykxGM9/VjitQdUgm2AXqScaA1WfDexkPT5zRn8rt?=
 =?iso-8859-1?Q?seJGcsFe4BGo59L16YRQv+OW0FczBbz5ny7Z6fw8IlM3wE/e8hlleXZXRE?=
 =?iso-8859-1?Q?H2xK650Obg0eAzveRGVCC1BGR8TINqymTaJGVNcVDtIMZK0KfyUc+ESS1k?=
 =?iso-8859-1?Q?4aCjFVdkO/PQjZYu31dDSghNikn67bJgAXBmJxKdhtxRZLqSsHATQvXKxG?=
 =?iso-8859-1?Q?/ioHbriItmj01dqhUlukW+xmElvL/xlxV11HsaNavlx3HNHPaS6jQ4RMzs?=
 =?iso-8859-1?Q?NLi8xiwhIH8LLKbVETF5vydpNhkWd/rfrW9PGA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Q8N348hbdNYDAj3cVpqS2ljHTxeuLt8E910DfYfx0KO+gvl0/ob2cz+zpA?=
 =?iso-8859-1?Q?GDBnFjkF7bX+4ZiXMj2sITtHxv3V5ngJJH7Z9AxdpMl3T2fcexcAWFhFV7?=
 =?iso-8859-1?Q?yaJXQT3hU/3Kpkha1KOzOwHKLTg+Q2c3q2WId2CbOFsksVYfadJEeloaXJ?=
 =?iso-8859-1?Q?Iddzv4Xm4BWEZqawlF3UCxHXiIPCegfWpVm9W8NrZmESyc70m1UB27tVWi?=
 =?iso-8859-1?Q?AW8e3swVS8mi98JDBKtlj+Nq3ngSpvXX2WQjd5qdZyasGGPsbgqvZ2d3mV?=
 =?iso-8859-1?Q?xzcMvvsbcfup+6DsgoAFvXjD/ubdI+tKlBTpC4iVuK0MTGQn3p/hxkfaMe?=
 =?iso-8859-1?Q?znyPZbeQStei476QyOsw1fd3ter/+pF3IF+HjBoQGlBItbrxrsA//Bu+XI?=
 =?iso-8859-1?Q?VtFTzeRgYPce0e43edIgZuW/Urlb+3vm0hBR/8GZXN3/4uDhM4gIAd0kgW?=
 =?iso-8859-1?Q?WXb/NJY2D3c7df4qP4bgRcktGjg+B15ZbWnurB+abZ+oYH4V9X43urA3iR?=
 =?iso-8859-1?Q?txppXw4Ee9bRJxKTeP+Ry57LYD1bBG1L630/lXEH06xj+pNQx6ShQf2KLm?=
 =?iso-8859-1?Q?TjjTkmhkFA+oSKF6B+5Nm3R4rVojuFMY0RxCruVVRDUnXQBI21EaVjSQ6m?=
 =?iso-8859-1?Q?+d4srJM3DFi5aHHSi93VAi6skFo8tLn3SMdhEcSClmH9Rsd1M2IqdQ9+Xh?=
 =?iso-8859-1?Q?jlsBcF9Gzms99FUzKdDMFbYZ9CEIogUtqrycozo7V9bBG3y8BtXt4P+osI?=
 =?iso-8859-1?Q?osxFBSNtOpWwqJXirQ4jx7+C1D90qZLVRUVSnWJVlxZe+Xw93aExG3SPAJ?=
 =?iso-8859-1?Q?b895sEU3/A7cBQxveaIk/12olTG/VMk3vdiAJvwmMTM9Kn4Y2V/8D0KCbb?=
 =?iso-8859-1?Q?VYetyFCE8aIp0/9te5Iw295QkYhDoiq8lQ6zSUYgHeCwNyavnKiVGn7qQn?=
 =?iso-8859-1?Q?Jh/mlDH6DCt+WVuEPHIjvmlLL+8WYlsSKw9t1BebdJC1mTV8F7HRxblnsD?=
 =?iso-8859-1?Q?wo3MTbYiiJw3KSdxO8ezpyCBbCX0RFvMUvUTZE5aZ29+joBEda3PErRMvK?=
 =?iso-8859-1?Q?cjcKc5c2ueZSWpxe2nEyYF7haLZh9iaRGHv0GBtYCKLpZB4JpZqNegSVSq?=
 =?iso-8859-1?Q?JVlcmoKC3CxYBSOUFGwPIvD6/0jhbmUwxDeEUwoqH6myG0ZfmqHGRQqrmf?=
 =?iso-8859-1?Q?tVJ7Q7kXdOweIslvVcTZhzLiVnQyO6eTpxDsZ0i38btJYousswAUZtQe7Q?=
 =?iso-8859-1?Q?Qf2mN+IcB4aAz5oLHzQFfgbxxI36xhyOKG+3udz4aQVqypPnO4aWCePeqH?=
 =?iso-8859-1?Q?XZqXq5BJITkv0mDUhN1GPeASAswuRVq0lPlwepbjslyDJZcyQ6CONjfHtO?=
 =?iso-8859-1?Q?whWkgY1621ibSHI2cImq3YfZFefsJKirCceHAxXKO4+CxyhmUGK4qEX/ce?=
 =?iso-8859-1?Q?r4bwik+eiG0GKirLR/s2EstwPO2oClP2XRH1vWb4h9r9mTyJFWW4u2B6Rk?=
 =?iso-8859-1?Q?wHIObdCFDVMFXM47EELaERknrVeTOIOs15qlqsbzmtILjlBZqLX6GYKF3B?=
 =?iso-8859-1?Q?ITblJFL+Is/wcvy11Qs50wlr5fe+qRmsXCWT7EW5VkXeantAtgL17X/TaM?=
 =?iso-8859-1?Q?qYpfQnZZ9UF8nJdI0myjSXqfeV+hgiApeMjomu76bucA9YSTSO/oiaOw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a6e49e-f8a4-47ad-addc-08ddcf8674f5
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 16:30:55.4695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T37Rds9fT1Q+Z51NPklt6U+WylWI83jV1H208Ld387BWuqOO7Ae5qbcwaimbtmCWb3tN9j+MUTeLIayYFHoULg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6193
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

On Wed, Jul 30, 2025 at 10:23:22AM +0200, Michal Wajdeczko wrote:
> 
> 
> On 7/30/2025 12:20 AM, John Harrison wrote:
> > On 7/29/2025 2:40 PM, Rodrigo Vivi wrote:
> >> On Tue, Jul 29, 2025 at 01:42:14PM +0200, Michal Wajdeczko wrote:
> >>> Since we already lookup for the real PCI device before we allow
> >>> to create its directory config, we might also check if the found
> >>> device matches our driver PCI ID list. This will prevent creation
> >>> of the directory configs for the unsupported devices.
> >>>
> >>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >>> ---
> >>> v2: rebased
> >>> ---
> >>>   drivers/gpu/drm/xe/xe_configfs.c | 17 +++++++++++++++++
> >>>   1 file changed, 17 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> >>> index 5f145ccdf535..766775772eef 100644
> >>> --- a/drivers/gpu/drm/xe/xe_configfs.c
> >>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> >>> @@ -275,11 +275,22 @@ static const struct config_item_type xe_config_device_type = {
> >>>       .ct_owner    = THIS_MODULE,
> >>>   };
> >>>   +static const struct xe_device_desc *xe_match_desc(struct pci_dev *pdev)
> >>> +{
> >>> +    struct device_driver *driver = driver_find("xe", &pci_bus_type);
> >>> +    struct pci_driver *drv = to_pci_driver(driver);
> >>> +    const struct pci_device_id *ids = drv ? drv->id_table : NULL;
> >>> +    const struct pci_device_id *found = pci_match_id(ids, pdev);
> >>> +
> >>> +    return found ? (const void *)found->driver_data : NULL;
> >>> +}
> >>> +
> >>>   static struct config_group *xe_config_make_device_group(struct config_group *group,
> >>>                               const char *name)
> >>>   {
> >>>       unsigned int domain, bus, slot, function;
> >>>       struct xe_config_group_device *dev;
> >>> +    const struct xe_device_desc *match;
> >>>       struct pci_dev *pdev;
> >>>       char canonical[16];
> >>>       int ret;
> >>> @@ -297,8 +308,14 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
> >>>       pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
> >>>       if (!pdev)
> >>>           return ERR_PTR(-ENODEV);
> >>> +
> >>> +    match = xe_match_desc(pdev);
> >>> +
> >>>       pci_dev_put(pdev);
> >>>   +    if (!match)
> >>> +        return ERR_PTR(-ECANCELED);
> >> why ECANCELED instead of ENODEV?
> > Or EINVAL? This is for when a user has created a directory for a PCI device that exists but it is not a Xe device? Seems like ENODEV is not the correct option given that the device does exist. But ECANCELED also seems odd.
> 
> we can always return -EINVAL but user will have no clue what went wrong
> 
> so the idea was:
> 
> -EINVAL     when config directory name is malformed
> -ENODEV     config directory name is correct but
>             there is no such device under such BDF
> -ECANCELED  when device exists but it is not covered by Xe driver
> 
> since you both don't like -ECANCELED for this case, what about:
> 
> -ECONNREFUSED /* Connection refused */
> -EOPNOTSUPP   /* Operation not supported on transport endpoint */
> -ENXIO        /* No such device or address */

What about -ENODEV, but with debug messages to differentiate the cases?

Otherwise -ENXIO seems the best of the alternatives here.

> 
> > 
> > John.
> > 
> >>
> >>> +
> >>>       dev = kzalloc(sizeof(*dev), GFP_KERNEL);
> >>>       if (!dev)
> >>>           return ERR_PTR(-ENOMEM);
> >>> -- 
> >>> 2.47.1
> >>>
> > 
> 
