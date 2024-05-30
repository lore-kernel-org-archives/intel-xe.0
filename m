Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F7EC25B74
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 16:39:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7361610E1DA;
	Thu, 30 May 2024 16:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AWqPRk9s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C778310E1DA
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 16:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717087181; x=1748623181;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DFXVrcTKiqneKDJvFL0bOUrTBkZjV5G9DXAURBRzqL0=;
 b=AWqPRk9sRaG1SFqT2F0+nY6LfEC9hqI3zeq2JEOEqPhcitKmaJVCk5Lg
 8f1qeM/G08rCgzUQ7kJMyad4zRFtx7SKIghXQ5hfyhG6p+WNxQWXTkYq7
 YE/lo+8glG6Nhk5ext93R5Zg6iBek+RfEg7UGpZLa6TP3QZ6qImKkac7Z
 1tKbgppMMOTqE13TRxbdchSFaQr0+oY1sk2vQ1nO4qIPc08Z2AKS6RAZH
 9EEPr/v6mnUlHSO9FQzUTwc2hviPHlfUjVurSLiqb6IuNzaIwNKjejprn
 cALAq4hPdR7irVH2Co8e3tqHqugvnk+Q1tXQ28wLq/tGbFOBhSkKHizHE A==;
X-CSE-ConnectionGUID: oSx110ozTmu3nTKwGQAuhQ==
X-CSE-MsgGUID: Sle023CkSTS6Ra1x2scWmg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="11818306"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="11818306"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 09:39:40 -0700
X-CSE-ConnectionGUID: BiCk5LCZTxiqEi8Qet3dZg==
X-CSE-MsgGUID: y/DFq/RlTXGOK2wFHNDhIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="40427128"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 May 2024 09:39:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 09:39:39 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 09:39:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 30 May 2024 09:39:39 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 30 May 2024 09:39:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nTntWYiggNBYAHOgRJ0KP7AvZLQJgrByAso3sBuhjXEETX7dxW49yI9mupyFQCUxBz9A34I9nuIyzvA92I5Bg3WU3zfoa+oB1m0/WrezOgVNH+S/za0fSSlilccoMsu7ST4j0GPdH3QnDpsg1q+848YnY2H4qSCdLqiomUwt42f1EI5/CXrc4SzDMmez0f5U9ThGAAvgaXnrta7RGzh9jQ1LwBSqHrYSFpvShQ8rEur01LYOHgcfRKYsGaFUZE038o5ZYBaGlJDkfvvj128T+gf+qFOyIARIarpDXst56NoZxYT2gO1pCPyv/Xu65gHBnm9xQJE3fqszYWgt9xDc4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wV4lrWPSRy+SwEjMkRP2kJCH4HDQL54fA4YJxVLypcQ=;
 b=BqcmHauHYoqe7QOPDlHm2/3nyubs0ykO2o+iOchPkNUMXo0NREObRwMkI3NryE3EpjTB6XVXFLXhKFW8LPo+vwoaY4tlfZsHKivpUOPIPiQBU/qqD0isoHL8iCQ/2y45PWblwH0CmZCVz5UPxsu1vyZmQ8Ie9DGpBFIGMw4hqW3eVuWnLlNpBFWMFYp4e09NP+aZputKktZ8ixs4Tu+8g+VHqsp+WLs8myvDffimTAXUAkcorcb+MYFzEIjx57KmmWf4Zf0Y73OFaG2mGZEVSW3LmmFzwvmyBrtJkYrDn+jJOrqig47ta8N6seCv419BjLPzVJcSvJ1wGeMp+WoqeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.35; Thu, 30 May
 2024 16:39:37 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.7611.030; Thu, 30 May 2024
 16:39:37 +0000
Message-ID: <b75a1731-8286-4a0f-8eed-015364c32052@intel.com>
Date: Thu, 30 May 2024 22:09:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix xe_force_wake_assert_held for enum
 XE_FORCEWAKE_ALL
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240530142533.875437-1-himal.prasad.ghimiray@intel.com>
 <40338a61-40df-4d29-9960-e0f96e9c9e8a@intel.com>
 <00281173-2316-4c6a-b69a-02b6902e08ec@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <00281173-2316-4c6a-b69a-02b6902e08ec@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::18) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|IA1PR11MB7198:EE_
X-MS-Office365-Filtering-Correlation-Id: 403fc9f3-5131-45c3-5ecd-08dc80c71803
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Umxuazk3WDdobnhwYytHOVVMRXlyMlVPZVhrT045VWljRjl3NFpUazc5RHhZ?=
 =?utf-8?B?ZFRIQkhRNFlxalpIWXFKWk01ZmhxdWs2N0FLZ0dZakk3Um8yaXhLMTZnYnVm?=
 =?utf-8?B?dE9CbU96MUVhcWtiU1kybmYwbW1qSTZRQTV5dmUwVzBnUGNEYktQWXk5NnJ0?=
 =?utf-8?B?STNxeXAraTEwS0JzK1pUT3dpNzIyTkpvUWpqK29JcHdQeHMxenpOcXA4Vnor?=
 =?utf-8?B?NmVOdHIvNUJ4NnV5L3hvV09aalovNlBEU0N2ajdqdTNFbUYycmNMRitqZDYy?=
 =?utf-8?B?ZEhWaWxNZGlwcU1HbVpxNy9TZHA2ZTltTFNZU2VNeER1S1VFejRERXMwYTMw?=
 =?utf-8?B?ajM3OFpFczNNcGEyZUVmaFgyUDdNcGloWmpsR0o2MWI1SzIyQU5xVTFHRzBo?=
 =?utf-8?B?aXpVTTVqNDlJZGtTVlpmSTdoZG5DM2xPZUlmKzU5Rk1vY0VERndtMVhGRnB6?=
 =?utf-8?B?bVdybXhQV1RlNGpGVjFEcksyVGtYVnBscngrY1Z2elBXbjhEakl4NTZGNm5N?=
 =?utf-8?B?bUkvYkFXWG9YeU5WVmVVQ0dqQnQyVE5OYlFWSSsxT2UwdVAvYmEzc2hDMktt?=
 =?utf-8?B?SnhHbTlrUkgycGMzSFJqVHJsWVNCYXRSeE05Q3ptRDJGeUN1Y2d3SkFHUHh3?=
 =?utf-8?B?SVBvWW5MY215ckM0RFZtSGU0K1N3dnVGSUQ0Ujcwc2RGNkdCanFkRnRqdEpt?=
 =?utf-8?B?WXNxN1NxUjNINUJMVmpFdkowN3VWS3RCb0VhYnI4cDRWanJkdHlaVkZmQlVN?=
 =?utf-8?B?a0JLZ1JYTktDM3RpNWdaV25DUDF1RTJxQ1p6dktubEJPK0lvK0FUbFZIRk1E?=
 =?utf-8?B?QWY5bnkzQUhGd1JBRzJSLytPUmZ1dFVqSldDdjNqcDhmdFdGWExDcUtIcHlx?=
 =?utf-8?B?NlYwOFdXQXRpZ05pMFAzS0FVZTZ1Uy8zWkVhKzlNVzZOMExWZ3lrMVlwOUJY?=
 =?utf-8?B?NjhwR0FwM21USWxrdEZyRUdIUkVMTG50dDVXdlgzbGdicmxDLzRxYURXbWM3?=
 =?utf-8?B?MjdqbXRCaUh0VGE1TCtpdnY2a3d6TE90THg0c1I3dFQ4VmROMHhNUW1rWFVF?=
 =?utf-8?B?K3hxWC90akI4T1dPV0N6Sis5dzVxZEZpbG5CSEhTcFpCdG9PL0lNTWtKV2xW?=
 =?utf-8?B?T3BYNFJjb0tQMEhqeFNGRnNaek1KQmRrMTFRUlJhOWFmOVJaK3ZvakovWVM2?=
 =?utf-8?B?QXVqdS9OZGZxeWlTSEFxb2hDUkZnWXk4NUorMlU5L3VQY3pVd3RPNDkvT2x2?=
 =?utf-8?B?a1N3dkNCLy84NkdnaVcwRjZJNFFwVmxDNWR3dWdiNTN0L1pnTy9wSStoZENR?=
 =?utf-8?B?TTVHK3lhYzNZWkJMTUtrZ2lwVVhBZzdnbFlWbWM4TTZmcGZvYlVWd1VwZTRP?=
 =?utf-8?B?NXgzdmVWRUZ4MUNqUXpGSW8xZnk0akVjc1o5SmhLQ2Q0bDlicVoxaFhLUjR4?=
 =?utf-8?B?bThmYTFHUDROa05BMC9kaXdLNVRFUkJOQktYek9rVVhSNHJUaHo2WW1lc0VS?=
 =?utf-8?B?OW5ObGF5Zlh6T2VIejdBdFVTcGRubWhtTmxIYmZlWG0wTWZPYzR3SmFibUZB?=
 =?utf-8?B?c1ZvYnovRU81aExGY3NjTHNEcURhOGFDbjVCQVhKQW5vak5jOHdoWU1tN2lk?=
 =?utf-8?B?UWgrNFNlSzdxZ2NWalI0OGF0VXRLWGxHMkc0d3NDQ2xOaFdCeURvWWhqcm9z?=
 =?utf-8?B?UHhERDNPaFdUVE91TC85NWR3UjFWcFNUM2hQaWhJVTAwallZRjlqdkxRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2lVaTJGWGE1alorc0hLRGFZdFZDSXZYUE50OHlpZG10M1FSeUFtajBkYng3?=
 =?utf-8?B?UkRuY2h1alVrQXAySENEWndCUDZvME0zWTdLSFVock13bEhGWDBjczJSMHV6?=
 =?utf-8?B?SkFXdGpjdzlmZmVZemhUUUlHK0Z5YzJML0p5dEJPU1M5cERoanJiTExKNkNo?=
 =?utf-8?B?R0RCbnUyTkxjR1MzZGRKakNlcnQzdjJsSkJLek5jM2UxakxnbGg3UTZZNi9C?=
 =?utf-8?B?UzdjWFBhQy82UUdXSWlEU3FuSElWM0ZoOXlaYmhOdEQzS0pHMU5RNW9OSmdV?=
 =?utf-8?B?SzMxeVZvOGdiVGF1TG5vMEhKdjFhQ1RUVnNmZ25hR0F6L2NRTHJZN2FrcmlK?=
 =?utf-8?B?a0tWbmpFWHpZc1g5RGlPcjREU2htR2NaMlgzc21kb2sxWGpuQVFnSCtxdFgr?=
 =?utf-8?B?KzFGeXZYdHdiNGpkZXl6bjlFclN6MTJwb3JoQXRBR2JIWU42bjR0U0lEWVVj?=
 =?utf-8?B?N3VEUkI0YVR6QmRMTDQzeUdqbEorRnJKazA5L1FuWGpBMXJGL1o3U3p3WmU3?=
 =?utf-8?B?bmwyY1lSYXN1V0RvK1U3TWhvSVpkZW1kWTI4S0k0cFlLL2JIbGZEaFdtVnc2?=
 =?utf-8?B?d0NHeDhUcnBPWUVDZjZOeWhxcDFzUG9Tc0dqbnBDbjcrSGZDd0dSOGV5aXVx?=
 =?utf-8?B?cUFmQU14MFlCOXROVHVTeHhvczhseEJiNWhnemUzb3dYRE9TcXRqOGRLVFpX?=
 =?utf-8?B?VExsRWRuOExqa1dhZ0Mrb0RLeGZDMTh4OENkbUJYeVczQjhGd3BrV0trVldo?=
 =?utf-8?B?dEhWVVJSNXhhemJaZU4yL1RHZzM0b1M3NDJLVlVveVVHaEJVaVRGb0lVajM1?=
 =?utf-8?B?MG92c0NnM2t2TmxjTGZ6NW9ZUWRyRUEwM3ZwdzJaVGRyL1ZPaFhqSTJwYkdY?=
 =?utf-8?B?VHlnd3FiSUN5aCtvWERweE9HUCtWMm1YcnZicFQvVWV4Y2h5SzVOMEpubmlK?=
 =?utf-8?B?akRmV2Z0Z1BUN3VNVG9pWjhKRzdua05EQmNXMTdIZDBCN05yT1VLWk96U211?=
 =?utf-8?B?SnRmbzlZUXJWbUxCK3FXak5ibytiMXZDRTdRS05oclFrUFNaK2grYTV3M202?=
 =?utf-8?B?Vmd4OUd4RmhwbFRDRHNrRCthVzdDaXg0d21PN1RhRU5SOXNwTDE2VFB2K1hS?=
 =?utf-8?B?cVlZbUJWZGFyV21lTFJndWpGMGx5NWxpUzZyV2RtVG82SnorNW9JOU5QRjl1?=
 =?utf-8?B?eDZDRGxwOXNTWjE0VlVrQnVQZUlvd0JMMXpvSjVBWTM4K0dna2FiVnVnVTFP?=
 =?utf-8?B?SkVtQ1g4VmM1YXl3M3NaTFgwRFg3ZWRtb0FBTFg2bStPNXdLMXU2M3B6WjdX?=
 =?utf-8?B?UEtuSjhuMzV6SDkvUnZMaUFLMjQ3enNzcC8vbW16eGNnRmlJS0N5NkJlVmRW?=
 =?utf-8?B?dFFDQ3RGdWZENGZVUEpJcVliN2NpQXFEZEs3cmVzLzZKNmxLd1RqZXQxNlRr?=
 =?utf-8?B?dVhSQ0JTQlQ2Mm9zRTZDd2xxZnNPNFFJQ1ZBckZZd2h3TUlWRmdpaHlibnp6?=
 =?utf-8?B?bW5MdDNQaTFVQWZTS1ZCb1JaWUd0TWpUM1VKRDFsRWtJVyswd0JVR0FOSUMx?=
 =?utf-8?B?MzdSb3pnbGpwL0o0WFZMSExNQVpVZ2ZSMmtzY0JQRTB3VTZzK2lvZU9IUFJv?=
 =?utf-8?B?VTZRUHg0MmdWM1lFR2hoTlN2Rmx4UVNxdnhwdk1kelExNE1xK2sycnB2NFhv?=
 =?utf-8?B?UnBwSDNhbElKdlFQVVRHSkJRQUJhSVVDVGd6SWkvSlhkRmxEbkhJRzdZdTRs?=
 =?utf-8?B?elcva09XMmhCNmt5WDJpbmtvOEx1QVpJWktqR3R2aHIyejB5RE9BYkRwRkxa?=
 =?utf-8?B?dWZkWE5XZnRmMkkyaXQ5WkdQU0dOaVREbGYyTi81U2NPaGpmZjlQSEtMR1V3?=
 =?utf-8?B?VWVkSHFRUmh2RU1CNmJIUVpZaUV2b1pYN0dOczFVV3NxYWU0M0h2blVwcGxM?=
 =?utf-8?B?SXRnMDNtcnBZdkxEMWE3UVRjWDVqb0xQV3VHMzkwZStpZkpmWHVYemZpQS83?=
 =?utf-8?B?Y0tGU3MyUHVEM3NINGFSaXFPMmJrZWlJVXdmdW8yY0lveVRyajZCamd3QVJ3?=
 =?utf-8?B?TkFLVjBOY2R2Y1VlUkhRRnhTazAvU25GRWVBaXM0NDRrKzFlU0dONHM2a1Zn?=
 =?utf-8?B?bTM5MWRzOVpaeDFyaDlYcDFKWWphNGZpbzE0MnRvTldvcGZZY2pYMnFKVjNZ?=
 =?utf-8?Q?/6TRiFC8iqZ9uXYQSOLA7gE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 403fc9f3-5131-45c3-5ecd-08dc80c71803
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 16:39:37.2714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RnaB3UiHRxd8dr54y6S4WvJtoHPlRyYU5H9Sag0oIqQbeqZMPqeoY7av1VU+fqUlgLWY+9fm9NRwQk7fcnxkAUrWSJMMlO6n15IojLPTxvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7198
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


On 30-05-2024 20:14, Nilawar, Badal wrote:
>
>
> On 30-05-2024 19:51, Nilawar, Badal wrote:
>>
>>
>> On 30-05-2024 19:55, Himal Prasad Ghimiray wrote:
>>> Make sure that the assertion condition covers the wakefulness of all
>>> domains for XE_FORCEWAKE_ALL.
>>>
>>> Fixes: c73acc1eeba5 ("drm/xe: Use Xe assert macros instead of 
>>> XE_WARN_ON macro")
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_force_wake.h | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h 
>>> b/drivers/gpu/drm/xe/xe_force_wake.h
>>> index 83cb157da7cc..9008928b187f 100644
>>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>>> @@ -32,7 +32,7 @@ static inline void
>>>   xe_force_wake_assert_held(struct xe_force_wake *fw,
>>>                 enum xe_force_wake_domains domain)
>>>   {
>>> -    xe_gt_assert(fw->gt, fw->awake_domains & domain);
>>> +    xe_gt_assert(fw->gt, (fw->awake_domains & domain) == domain);
>> This will always assert for when domain FORCEWAKE_ALL (0xFF).
>> Not all the platforms support all the domains.
>> e.g. MTL GT0 support GT and RENDER domain. So for forcewake all use 
>> case only bits for GT and RENDER will be set.
> I think to handle this correctly in struct xe_force_wake you can add 
> new enum xe_force_wake_domains supported_domains to hold bitmap of 
> supported forcewake domains. Use this bit map to check appropriate 
> domains are set.

Hi Badal,

Thanks for taking time to review this. Agreed the check should be based 
on supported domains.  Will look into this.

BR

Himal


>
> Regards,
> Badal
>>
>> Regards,
>> Badal
>>>   }
>>>   #endif
