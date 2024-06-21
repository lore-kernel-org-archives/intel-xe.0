Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75DCC27C4F
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jun 2024 22:44:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D9B510E091;
	Fri, 21 Jun 2024 22:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fmZ8UUjq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A27B10E091
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jun 2024 22:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719009894; x=1750545894;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DkPyFOBQg8A/jJ9BxNMiHEoGwPX5rIrQ/8erw/csArY=;
 b=fmZ8UUjqyNT5BoQsBHlaM6mwIg4A7vV9uTK2+crOqZWhPXe/zigx2GEa
 gLHBAhSDarEjHZXyh0fV2GA6AYqMKOujbxhJm/g4gdAiHle5QgN5auqFi
 HZxH3/86EOD4BlI1YzXhVXQaPbTUQnxXcCFG9RacvzbceBIiIHJz5hAXr
 1qG3cUMKq0UGLKJdc2ZyobKZhvcwJfXsQL4odypT3JMVqd3SPYGvQoAwm
 B9gQ4MylR6zXRA6zkdxD4ImeCYFAng3gUDMQNT/kjVB0lY6FCSOz/Yh2a
 7mVxHcRg4kYR/GHiSD93MSYCY8fzckPb6oV9ClLMRROZA4Mn5YXQKa69Q A==;
X-CSE-ConnectionGUID: DjsKWxarSdiKG0JGAWnZKg==
X-CSE-MsgGUID: twQ2RB/WQDuLIGTKLUQ9ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="27476775"
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; d="scan'208";a="27476775"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 15:44:53 -0700
X-CSE-ConnectionGUID: xlfTIutbTRewcav2HBEe/g==
X-CSE-MsgGUID: CbqcCszKRuO+ASy4zMGmBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; d="scan'208";a="47085259"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jun 2024 15:44:54 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Jun 2024 15:44:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Jun 2024 15:44:52 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 21 Jun 2024 15:44:52 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 21 Jun 2024 15:44:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mP80Rf/yLcj3wG+jn6Nm9YLPWOR4XMAyDg2RanNycTWZFE81AWJr21XIiv9ft51zIvVAfjI+qmyyZB3c3baX1o/urbdaaewrqSjnzyVK2NDWwPBNvINIpuwayzZE8x3+Klx7e+87n4os9tvtMEgTV3Ruz/Qnkc9mNVqgJ/Yr/5ZIv7JqbaUvZqCPcAgqujiggu8xFeNbzOLgXLMsEQM/9gvWS3YknKrqegW8p6DXlwQtvYUQBu8fGAaSAFJ9nPHn/ea2YVuuoYJThFdVCbMbCah4kT3R9rs+T2aWBEKqAzZRk3/1c1HcJbUgPHW25a3Zpo3c4dRdcZaRs6/TjXP55w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=phg8psCBuncKW0UNXCNmqfGVaJ02db0v9cl8kSWxhbM=;
 b=LCCI9P1VcbkzK/GqXUOGfBdyH+6bt1vAXjTqaU5o9uM65V5Jo6dDDzyKt2TIRODxzr7ObTYa/Bmn/WIFOZvbXj1fxnlYU+pP6i+1xhRFh02ESHuazZTnSX5foL+N2gtIAwUVMcl4NcG6xl69+xUXo9gThghP9x46g1Sf4zO8b15b5e8rk2b2CJE3KINO+AZBE2U+3bxaXihRC8siraD4RbNsVDAWghai0ZveH42ElbUwS3AvxTsLE0Fta4u7/9Wpl5SVZ40o/eGeZE5sWQwTfbdCeln3qnAE7dW34xt551Qx/+/8Jx8rdZInbdkkbPIO+CxAp1CgLGzi36BpfYD3hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Fri, 21 Jun
 2024 22:44:50 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%5]) with mapi id 15.20.7698.020; Fri, 21 Jun 2024
 22:44:50 +0000
Message-ID: <96af4bbc-255e-47e2-b038-8c0d4bc21320@intel.com>
Date: Fri, 21 Jun 2024 15:44:38 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/vf: Skip attempt to start GuC PC if VF
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20240621170002.993-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20240621170002.993-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0139.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::14) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|CO1PR11MB5154:EE_
X-MS-Office365-Filtering-Correlation-Id: 39d251a6-d48b-4b49-0c98-08dc9243c253
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWVrSWY3aGxFM01rOVp5a0VHRGx6bXBwN2hLcVlCemNJc0ZyNDhwU2hzNXcx?=
 =?utf-8?B?NHlzbXpPSWdpRjcwM3NTYWx1UlV1b1l1Q1ppWE5lUHhLMlpWTDdtUGsxdHlr?=
 =?utf-8?B?ZHdKd0g2dE03ZlhsMUJmcndadEIwcWNzeXBLNzVCZXdCMFJkZGE4clBndkdW?=
 =?utf-8?B?M2NBN3ArMUZVeVNWcHdWQ0ZXYzJ2QURLVVZ5b3lwUmhNa1Q3VHhGWDd2U21T?=
 =?utf-8?B?b3VseTVnbXE1bFFpY1BOaDFzNG5rVncvdDRYUHpKdmlmK2VZQUFmYnpqVjAw?=
 =?utf-8?B?UDY4S2lHTW8xUkFNMFpobmVmT2o1QkJVNlpKZDQwVmhjL045TnBsQ2N4N1ZH?=
 =?utf-8?B?QXJrTnJRdmJhbGlkZDVsZzhCVityaG9YcEhIbVJDRkl6Q1A4NGJHbGNHTEtL?=
 =?utf-8?B?dlVYeHZicDdOUkhTdWdJaE9Mei9HcXBWd01HSVQzbFUrbi9xTWtoUkdIRE9t?=
 =?utf-8?B?S1dsdEVxemlrUTMyckkvalVDamJQMHhFRElpd1R4YlF6Ukd4NlBqdVkvSEFr?=
 =?utf-8?B?cjlsbjg1eUJWN0hyTm4vbGtXekdBZUtUQmp4anFjTUtYdi9URTdnNUFCb1pD?=
 =?utf-8?B?S1RMN0R5WG51RmVWRk96WG81ZjRsaE9GRm5ndTIxeTNLcmsyaUxraXVHRkV1?=
 =?utf-8?B?RGZ3Uk5DRE1ybHRaQ2cxY2pIMjM3dytac0JUemlHRnVqUlY5NUZpOFZnZytj?=
 =?utf-8?B?UmZkSUpOZXpJYnZuOGdrUVFZeU5rKzhkMWlQTFdqY0RCTEtSZFFaQVl0cFI0?=
 =?utf-8?B?cEo2ZW03bWZGazRwcGN6OU9aVHRBQmtMOGt3MDlrQWhCNU5uODNjVklzRnNQ?=
 =?utf-8?B?WlBFNkdMTllPTE9kTUxBYWJrRlVzUTJSRXhRSC9EakQyd1pXTUxpM0JhS2JE?=
 =?utf-8?B?aTRzcXZnY1BtYmpoeGZ6OGZoa3p0bXphZVh0ajBuNlZEU2hwSkVva2RMQ0cz?=
 =?utf-8?B?cllyRE1NVHhDVW1IVG9ZUjlnUVN5bktmTjVpZC9aQndrSyt4Y0lsZlpvVzBi?=
 =?utf-8?B?Z2huNW1oZmZMemhvS21KUEFQVk5sUHlyajQ3MjRoYWpvWHhCZElQVmovSWwv?=
 =?utf-8?B?TkhXSmxrZlFabXB3YXQ4V0NQMVBWUlkvUk1pZ05zTlFTK014Nnc5Yzdma1Zi?=
 =?utf-8?B?eFZwaHlSMWZtODhUaXY0SThQQ3JFVExGTVYzRGo2TG5lL2tnckhKNU9OQ1pM?=
 =?utf-8?B?ZEZHNEwvRXhHV1daVnQyMlZnWFhla0l3dW0xRkg0QTArV1d6UHVPK2V4TXcv?=
 =?utf-8?B?SU1wQkUzbnZ2SGlWaGdDNHFjVnFFdElJL0N3Q1FvSFRmWlgvblcrQjBORU5r?=
 =?utf-8?B?ME9oK1M3WEEyV2dMZ1dPRGdjY0F4VmE3ZE4yZnFDeFA2TkpzdHE0ci81Tnhq?=
 =?utf-8?B?SGVxQkVYajlySzlkdDlKZXJ5WXRjZDdyMVRlNXVPQTMxWWVYN3JSd2VtbE54?=
 =?utf-8?B?bWZzbC9Weklqd28zd2hudjFGZnBjMi9RZFcrODlZSjc1MU9lZjAxMXlGVkg4?=
 =?utf-8?B?ZHczN0h2UzdTUXo0RUtaNElPOUhVcjNGbUdzUGZvdEpTQVVIaFlBZGsreEpk?=
 =?utf-8?B?UEpFZ3J3cjQzNGtpTHM4bEljdHpFdFFLR09vcE5iaTlFcSsrME9SMFJpbmdX?=
 =?utf-8?B?SFlBYTVDdjREamFTVzNIRUdmZGxCcUZIQXJQVUV3dXBUajdyL3NqUTN4QVR1?=
 =?utf-8?B?akIvR1o4a0FjekNhTTcxcytNRDk2QTFlclZ5VjNSVnB1N1Yzb08vc2VDUDV2?=
 =?utf-8?Q?EweeWVkxt8Md0q65BFNNzjaerHYjT+TIGTCT8Q9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SllOOXhodVVZYWxFaW56VCtDc08xMjR1Y3UxSXVqeFd6cCtLN0V1djcwNGxT?=
 =?utf-8?B?RzV4RFNFbFRpaVpPTlNiclVrZ2wxdnpLQUF1d1o2M1UvRlpQMU5ISFNzSmFI?=
 =?utf-8?B?L0NUdlA5V0daak1BZ3J2d2o1Yy96REZsWEc5ZzhSVkJOQTVYK2Z6K2NKL3gy?=
 =?utf-8?B?M016NGtjc2ZNeFhMejdRQnBSSjNBU3JhZnI3RXRoYW5GOFZVSGVPT1QvbmFJ?=
 =?utf-8?B?YVp4UTVQVjlMMVJLUnBiT0FUay9MdkIxK0wyMGtNUHFST0xmcENHM1RMejRN?=
 =?utf-8?B?ejNXVy9JRFp5VWpQcGxKQzd2dXFGemp4RGMwOUlsdVBwVWhUWXEyT25kcjhT?=
 =?utf-8?B?VmFpY1o2enJMbVppMWxEYWkwcFdGOUpsNkl2akJvNXd5V0NyVHU4c3F0RHhy?=
 =?utf-8?B?SXFET2lrbEVETVBkaVViNTIyKzZXak56RXN4bGY2UlRhVjkzSFMzSWRRYS9P?=
 =?utf-8?B?ZEk4S2RYd09iVXc4U1R4MndjUFdZVXdveFNuSHFvWC9KdXM1MFVCM0dzUWh4?=
 =?utf-8?B?RG5TSVpwei9JOUxDVlJiU3JMNkVjL09uWXhoazdlRUVicTVjZjkveUdvWG1F?=
 =?utf-8?B?UFhvaVlJa3RacDhsMGdjOW1OMUVaWHVZYUtPM2p2d2ZmRUQ5MXRIbHM0aFBE?=
 =?utf-8?B?ZlZyeGFuamdlZmlUb0ZFQXNhRGpNYVZiYTU1QWFoTnZudWU4eFVRZkp6VkFN?=
 =?utf-8?B?bkt6YllNZFJBTk4wRTFSZUp1TENRTVU2YXByRmQ3T3M0YlUxcW8rblkyUzFU?=
 =?utf-8?B?ZVlCSXZobjlIWlJNZVpldVFaMGE4bjB0TjhXbmNVT2hKeTBvUVozcGk1V2g2?=
 =?utf-8?B?bHR0a3pyZFg2K00rR2UyKzlyUjNKUThoQ1Z3Zmp0T0RmWkRQQVRyVmFLaENQ?=
 =?utf-8?B?SkVFYXRDMjVkeC9iMEg2b2JuRGpEZk9GU2plU2JpekQzYXlXZXVHZWc5N0Js?=
 =?utf-8?B?eno5UElIVTVJR2QyWEQvK0pBOGVzWldWam9TS1JRMlV5UEtsL3RVMGg4WHAz?=
 =?utf-8?B?SU1UWWczQ2h6NkN4ZGdKSE8yT3BYY1hBMkdaaTFJYzJCTnl1R3ZmNXRLV1Fx?=
 =?utf-8?B?VWkyZytGNzBUbzBnaWltMHpRNHdpOEcrbk1tYmx4MWpGcTMzNVdVekVDaEVp?=
 =?utf-8?B?WHcyazI0UFNjdXoxTUpmM21tRE4xTjNHL3lWV1k2bkVoRFFrWm1salZWdFFl?=
 =?utf-8?B?UHdyMUt6STJXeGY0MC9PUFRDZ1UzMWJKS2RPV0NlTURyaU96L0h4bnFzU2M4?=
 =?utf-8?B?V2xreUtqS1BQMmxxOWN4THlzRit0ZjFmRkJMcmFTcGdWTlplU2lFV0tlbkk2?=
 =?utf-8?B?ZUliaGowMGM0OU13Z1FIYUFNQXFiTzZMSzQvNjhuOEV5bFFDSzd3Zys2eEJy?=
 =?utf-8?B?Y0tCWThPZXNVUDJCNC9VUDZ5ZkFOaXQ3WVVUTG9oQzhHdm1VTjV0cGZ4YUcy?=
 =?utf-8?B?dTM4SHE0dkQ0MENrcUwzK0Ficy8zTTVySURnUUErQXZ2dWZ1SkRWUUpVWE9B?=
 =?utf-8?B?cVp1T1I0U3BJcVYyZkNWWTA4alF5MkpMdGhZZmV1M2N4NUVSdkdHaWF4N0Rx?=
 =?utf-8?B?UkFmUUtacDBMa2ZiK1JmbVhTTWpoalJSWCtTV2lHWTdaZ3RMVTlKMnZ0cHJF?=
 =?utf-8?B?V2NYeldWV0p6UnBWQWlQVCt2RjdJaDVhTzl6TnZRdEtvZ1ZSZ1ZobG1ZMFJo?=
 =?utf-8?B?UGI2WUk4SzNFc3VlT0F6Mi81ZjNjSWx2VVlwb2I4Y3FtMzhMK0NLOGgwVEEy?=
 =?utf-8?B?U1RaVnVZbjVQT3BGVWVXVGk5U2FMWW9WbVNLV3VVN1VCeEhNY0Zac2t5ZFh0?=
 =?utf-8?B?UUkreWFSQzZOM0lyYUxlTjAxTURkREpMYS8zYk9yQU5rc1hOMWxzanB6cHNj?=
 =?utf-8?B?NFlMOGpFQkNWeXNpUW5XMHI0clJHOGFmYVA3aE11bW1HTG1teHJVYzZXVnBD?=
 =?utf-8?B?RnRjTWMxRHQrYUMydXB6V2dLNXZucFlkN2ZRVXJySnFqUTlVNExLUEJTa0Zu?=
 =?utf-8?B?M3dyeEZERkVUNE5obmRjL1Q2VVBDZE1HSHBVT3daV1JyWEpZU2pkYXdZcHVh?=
 =?utf-8?B?aW9CN3BuU1ArQk5qQWtNYTV2dFhtc0dmWGdoV1FCUzVvV1gxUm04emVIR0Rs?=
 =?utf-8?B?YUVhVGVDSzN1QlZwUnN5QzNpV1F0UHZvK2VsNm9iT09uYmdsZWY1amNMSkNu?=
 =?utf-8?B?Q1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39d251a6-d48b-4b49-0c98-08dc9243c253
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 22:44:50.2896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lrp94Z9yp+Jav3C5fV9klOZbtU8btu+qS35mVoMonakjE4wVEmN1G0r985r8mdVU5nIHSXaJgvoUbdw8zHfd3PbbHc1ptQXbYmUw3b2sU7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5154
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


On 6/21/2024 10:00 AM, Michal Wajdeczko wrote:
> We have already marked the GuC PC feature as not applicable for
> VF devices, but we missed the fact that there may be still some
> privileged activities performed by this component, who does much
> more than its name suggests.
>
> Explicitly skip xe_guc_pc_start() if running as a VF driver and
> use a GT oriented message to report any error.

We may need to skip in the xe_guc_stop function as well..

void xe_guc_stop_prepare(struct xe_guc *guc)
{
         XE_WARN_ON(xe_guc_pc_stop(&guc->pc));
}

Thanks,

Vinay.

> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 172b65a50e31..79931466e479 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1125,10 +1125,13 @@ void xe_guc_stop(struct xe_guc *guc)
>   
>   int xe_guc_start(struct xe_guc *guc)
>   {
> -	int ret;
> +	if (!IS_SRIOV_VF(guc_to_xe(guc))) {
> +		int err;
>   
> -	ret = xe_guc_pc_start(&guc->pc);
> -	XE_WARN_ON(ret);
> +		err = xe_guc_pc_start(&guc->pc);
> +		xe_gt_WARN(guc_to_gt(guc), err, "Failed to start GuC PC: %pe\n",
> +			   ERR_PTR(err));
> +	}
>   
>   	return xe_guc_submit_start(guc);
>   }
