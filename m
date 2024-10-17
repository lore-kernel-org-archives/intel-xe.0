Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28134D374AD
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 15:31:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E93FA10E053;
	Thu, 17 Oct 2024 15:31:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dA+HpDWD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC7A10E053
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Oct 2024 15:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729179063; x=1760715063;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1XMSQF8qy57Kb+kOKaMAMsuBnvVGzlLt5ilEVUjgupU=;
 b=dA+HpDWDwwItg8QCE4kg8q7FRjUDoF+OEAbsWh78POuSLpHBn9cA1a4l
 /AV1D7yEflpOP/J4rId8SOp+UJ5USpEeLI/7Aj0+/JJ9mAVhLCzVyw9MC
 oeye1AeRarcOa2hz2mPjQEn9IRjfutUK8/TkG/YlMQb88GpKn43tXufyP
 DVEFkiYlyYCsGdsefRV3C8ggflZ58njoFcniTNzjKD478VxLD53q7Y5n9
 PiOkoQ1lxqnHhDMJDdHHLOb+7cqgBssM0rHZjSnAAEqR0p4OUD0UYNOR2
 1BqgPadrelkt9mZJWpKdsz9KZh+G27H9zGfGcpDUyxH846X8iVG/XvBMd g==;
X-CSE-ConnectionGUID: jmHlkZO+Qxas7dBAWSbeyQ==
X-CSE-MsgGUID: d/XiWCW4RCiU5UZQ/anijA==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="39259801"
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="39259801"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 08:31:02 -0700
X-CSE-ConnectionGUID: oEYcop2hS/uJhGhlmGdTVw==
X-CSE-MsgGUID: wnWXNmXETua5gSNtH3ZICg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="79015733"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2024 08:31:02 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 08:31:01 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 08:31:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 08:31:00 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 08:31:00 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 08:30:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zCtb2c8xIOV9mg8B0vaYEdRC9Y9r/QdkncvPWKk1lEP9r57nS4IXVlrKInc+EkJgWnWx4CDq/SjjN3vWktDJK4Pp4I4U+s4+sOgMSqrCyeIAanxqTaTLEkLqz2svpvIARoPwsnjcfUtv072zxkfSieyfeLgEmrKbHZ8XCsAJ139oqLiK+F7F29TaHFllQKDFKIAmrcd0OrQi8P6rtjun/S30jD4rn1coK05ETUf+1eqAzSp7OZptYo2hlWWkzylb+w64D5uf+CucHWRrIDCXCYoS3vFLizF2oRGfWIcdyctqlkUcm+x7yft4TWrTJMZMAQYurZKs7YKkaSCA8UkLqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26dN2SFfmMzUQmN7jW2rxWmytb1GRhAI7mdF8VyEyFk=;
 b=KaKXbjkNvjD4Y4HlOyx589U0EZlQDsrCcBxZ5e175mWtRMIGGa06w5Gu8bORYoE+PSLecBGndDgsBCskke0Byw6g6z8Bu2hi3SJghWD7+M7sVhWyts17UeCa0hDxrGHkuayJXCwNmpBdhcgn0dJWIRLyj2C9fX96YTREzjuvmS2IM79TXGVr51AYb7GbbMX3BoNlQlu++TtjTEP0GPZcIlAQWQhw/fnbAIb8oUOuAKg6+NiP9pZASIzKHfvCq2DR6v4AHjv0fgNk9v6IAMi0rkZ9W+BN/YVDfFtseSHALJU6kkx5SO24zxKny/OHRo/1f2M++BmYcna5aPZVmKdj5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SJ0PR11MB6669.namprd11.prod.outlook.com (2603:10b6:a03:449::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Thu, 17 Oct
 2024 15:30:53 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%7]) with mapi id 15.20.8069.019; Thu, 17 Oct 2024
 15:30:52 +0000
Message-ID: <8875582e-5e7a-4c10-9c69-23c7b892f745@intel.com>
Date: Thu, 17 Oct 2024 21:00:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Log unreliable MMIO reads during forcewake
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Alex Zuo <alex.zuo@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Anshuman Gupta
 <Anshuman.Gupta@intel.com>
References: <20241017034026.1525693-1-shuicheng.lin@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20241017034026.1525693-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::19) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SJ0PR11MB6669:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c4a6ba9-de50-4bd3-25c1-08dceec0af7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0R6ZSttYTk1cVhQdk9PeXNYMS9YenVuMGZ6Z25SN2FVdmUxRWxVdE03RTF1?=
 =?utf-8?B?WWFoaXdKZTBDUXp2QWtzUTZTdXQ4K3A3UDBkbGppM3ovTnpnZ2Z5bFZUamt5?=
 =?utf-8?B?YU0zRllNQ0tzS1hkVklVRUs4ZTF6dnRHY0pJYzFNS2thbXcybmYxNm9DbWhJ?=
 =?utf-8?B?RFNCdVMxb3ZiNldmYmxPRXNxTEcvem5lSlVHVWU5OTFleFV0bERBVWFHZlRl?=
 =?utf-8?B?S0huMzRQK1k2M0doL0lNcjhvT3Y5bzcvNXVqS3d0dVlUSDlSeGxGNUpBZmJS?=
 =?utf-8?B?eTVSSkRzWmpNMTBLUWh1MWcyMFpnN3NMQTZ0bDlkSXM5a3l1RWdtTWsrRVBw?=
 =?utf-8?B?SzkxN0VZNFBIMGt0WjFkNERVMk05Slg3d1hYdHRVVnB1VG1IRHJobWN4eGFW?=
 =?utf-8?B?UmRhT0MvdW9CMGY2N0FBZG15OXdhWUwyZnZjZlNOM0p5YTg5NkRoOFpzMjcv?=
 =?utf-8?B?NTZYenptR1lPSkE2bFg4YWZERzlsTVYrSjR6WTNCVVNlMCt4bk5IN2hEY3d0?=
 =?utf-8?B?dzdMdFJIcmNMVi81Q2lYMElCQjhkQkwzUEJQT2JGdnRtZGxRajF2YVlsYTJV?=
 =?utf-8?B?ZllvdnIyd1JyS3JoTFpqSmRKZjlRaHNCVFoySTNCZXczbXBXSnFzVXpiUnFL?=
 =?utf-8?B?RXh0Z3ZKZzVic0l0UVJTMnBpNnF3d0doMTRBQUFLWG1xU243c1ZDVEhuVkVr?=
 =?utf-8?B?QktickJmL1loOWpBeXd2b2lON3JkZE5OL0VpVDZod3hNSlJxVTlrTENob2I3?=
 =?utf-8?B?L3NuYmRMdlFUbVM1T2g3eUhkeTRYS3JsOHgxUUV3eXRhQ1hUM1hNMElGYlZU?=
 =?utf-8?B?U1h6Umdka0hVNm5ldURPcVlhU2tMUUlDWHlBTFlLSGpiSTZwS1VkVjVqRUJu?=
 =?utf-8?B?em9nQ2ZEaExtS29yb3ZOUGViRkZlVnpGa3QvZXNFSDBKbm9vMysxTm1nZnpm?=
 =?utf-8?B?U0xSTWdjaXFHbkdyTktpdkNyWEhROEJpSENhSmRnWGd1anpkNXFYTjM0OW1o?=
 =?utf-8?B?dUlJeVZyVkM4NTEvRkg4UVBjR0xBbVVSdjhHUjVVdTNWbG0vWDdYRXRWaUlN?=
 =?utf-8?B?NmZFOFZwcUthOGJVN3BGK3JIVUlRdFE0S2t6R2F0NHNNZExiSFFrN1IxZVRL?=
 =?utf-8?B?ZFVMUndkdkxNY2h2R1gvQWtJVlVKVXdpWnRvUEZ6MlV0ckZsanBMM0U1TU5D?=
 =?utf-8?B?ZUk1OWR0RmtRcWNKVW1Jb2dyNlVOYWQzZmZWY2FNYm5WRFZkcVlmSitmaEx5?=
 =?utf-8?B?YWRUOWFrTzBpRk5vanQxV3NsSGEzdSs5UktsQjhURUdBOCtsZFVEWm1ydHZ5?=
 =?utf-8?B?YWVyRXVKdGZBWjF2Mi91OFpKMncyTXhGd3dKckJLaStGSkZPcTlRTHFzVXVL?=
 =?utf-8?B?QzRIcGtreG85WXZIUE5rREpDanNJMkppemJVSmNKbFF3T2dOMTMxUEdTYWo4?=
 =?utf-8?B?Z0lMNHpUQmNFbWFYM0JPUEhxUkRLR002WGxDeXp4akl3N0U5RXlTbGNOZy9U?=
 =?utf-8?B?Y2p6aGNGZ1Urc3N3ajd4ZUI1MmF5Vm8rRGltL2FZT29haElDU0FWc0dMRzhZ?=
 =?utf-8?B?NDdjb1NIUWdQTXlxMWtIaFBySTB2TnIrcG5QZzdUOHZUSEVlK3RUVVc4Y3VW?=
 =?utf-8?B?bGZoUFhLUXRHczVMTUdKNmRjaXdFVjltUUs3MmVURDh5ZkxYN2srRjhNcWg3?=
 =?utf-8?B?Y2JKZ2N4SXExdWI1cWxHU0s4SWdyQjdFejBMWDUvQnVOSkYvRjhaT0xMcTkx?=
 =?utf-8?Q?RmRPuigePkJQdTNIgWceh8ACbdDC+RiBbtcpUIG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2xQUEUwZU1iVnlvQ2FsRWp1RCtYNzVPc2lSWGZWbmprZzB2SnZPbEV1aU1Q?=
 =?utf-8?B?OXRhRlN3NlYrTGtWZHRZL2VaL2wrb0p1bFVEMmFIWmY0YWR0RGJHOG9hR1NI?=
 =?utf-8?B?MXNaUksycE9zalhFQmhBWlRHWklYbytoQUZIcGNCZEVEbmpUTEtJcmcwNmYv?=
 =?utf-8?B?Y3JMVjhHYWtCdldDMHFybExkeVlqUnpKT2xOZ0Z1b2dFdU9DZ2Y4YkltZ2RE?=
 =?utf-8?B?ZUJrV21oWXNxUEZGTUdkdG9jWWNmOW9PVU5qWkdvZXltWE5FRi9NenR2WGMw?=
 =?utf-8?B?UklDRW51ekxqTmNpMjhGNjNGOFM1cE13VDBWMTliakZWd0lvVHgxN3hPS1VR?=
 =?utf-8?B?amRKQk9zdnBaREJsVnVBc0tYa0dXWDBrNERmZi9IMUNFSEhYaXowUjNMUHZh?=
 =?utf-8?B?OUtPdlh3eS8yN0Q2d3VoMEVhazc2ZjBsc1Y0ZWFXZG4wcGhiUFJSbFAxSVpj?=
 =?utf-8?B?d2ZhTmhKWXNtVU9nYkVvRmVEb2NhR1pOOVY2NjdwMFFjTjI2RkxLd1ZZTG5M?=
 =?utf-8?B?dGVWWGdBTkkvSXB5Rm1DTVJnN2FHYnlSMStIYUpLZ2R1cTFYMEpBaFk2RTdU?=
 =?utf-8?B?c1RVYm1BL2JHaXZmRTJsb3NsaVc4amdRa2krTXNJNjcxVjZpcFJ5amp4RWcw?=
 =?utf-8?B?ZURlNnlUcFduaFN4NVBpWXJkck51a1NZUXp3ZXBobFBMVmV5dEI2MWR6cVEw?=
 =?utf-8?B?YWI3azFqWlFQS2I4U2c5NndNUDRmbzRndlFMb0tNMDM5UXNyZ0R5K3oyck1y?=
 =?utf-8?B?d3ZGdWxpYzc2L0VRdGxid3E2ZW80WUczWGcxbzFFSTZ6QnNFSXNUN2tMbHMz?=
 =?utf-8?B?OHA1d3BEWFVRbzRVKzBVdzZWWWFzWERIYTVmQUQ2SFNHNkxoZTVMNDVmSkcw?=
 =?utf-8?B?Uk03T1FQLzd6WDNDeSs5cjd3ejExQXRwWS9sV1BVOFlzRCtiSUFBZzhWRm12?=
 =?utf-8?B?eHNtYXlZOTlTampTc1VSVTVyelgzQkhvb0gwVFljS3BndVgzUFhqb3hRSDU1?=
 =?utf-8?B?bW5PcjVBNEt6cDlBYTdYSlkrNG9PRWNwK09IajYrUkZJcTRtdGxBbmZxbGlF?=
 =?utf-8?B?a1pQRWcremlsQ3BneFdBK2x3bHRVVXN2RnphRHR0K2JuNGw0cXNodkt1M1NG?=
 =?utf-8?B?dE5VenZJRG1CeHk0Y3RtZ2lUa0RCVzJMQjBXeFhjSnQ3QmRrYTZCTjJKNGVZ?=
 =?utf-8?B?V1ZIbGZhYmhNSDRTcnM4MjJTalNYamRRTUhKaHlqUXhqM2VneEZJVkJWSytk?=
 =?utf-8?B?a081SjdIU3ZvMUFqN0tNWEFOWEZyaWhkNHg5TkYyMlpiT2dIWWY3TFdBcUNG?=
 =?utf-8?B?U0VhZm1mT3dLUTN2LzBkUWxvRmR6V0VKOXd2OXNJRmdlUnRqM2k0b1ZMY1V3?=
 =?utf-8?B?emM3UGhJREprL3NvSE5Jdm9zTTJSVHkxVDJ4dWVUcG0yb250VkxXMTJvSTE2?=
 =?utf-8?B?OThaSHF1NmQyMVI2TDNHcXBVMTFpOEMvNjdmcVdOT2xZOWpxRGZHdTNMWFpm?=
 =?utf-8?B?bElOZDBnQmxzOXdwc216SHNKQWt0NHd2YWJJMXNPRFZTN0hYYnkra1FCVjZ5?=
 =?utf-8?B?Ujl5MTBzVk1aZWk4ZElvUFd3UlZuNkNMUFFiNzZ4OXF1SEtETTFJSlNadDdD?=
 =?utf-8?B?a1VYUHo3RFVNWmN1ancveE44ZHU1bjlaalRmcEpaVmhBU3BWS2h6dC9EL09Y?=
 =?utf-8?B?RDc0a3k1eWl6eTNFdmpVcGZuaE9QTWdGVUFHQkFQc3RaUHFvQXdXK3BhRjBo?=
 =?utf-8?B?NnVBTm9Cd1VVa1Z1OHRwczJ1a3Q1clhBNHNxWjFkVnFHVmd5K3Zrc3VuQ1p1?=
 =?utf-8?B?MXFHcjFrOEV0TkRRSWFCY0NRbHRXZDZtMGxDV2lDWjRBajh6MjJlOUFPQ1Zu?=
 =?utf-8?B?R3p1enhXSXpTMFpCU25Za01SZUhIb1RwTUswdnhwVWdtdEtTZFdkT2tTMGEz?=
 =?utf-8?B?dVZWMmpRNVUrTE9wVGFFWjM3aHllZW1McnlONG5aK1paTEtmNm5qUlIwcVJp?=
 =?utf-8?B?UDBZYkVua051V1Q3YlhWZFgvVkIzSUpDdjkyKzVYd1crQ2t0cCtRV0hLdmVW?=
 =?utf-8?B?bE5RQVp2Zkd0OVRlbjVyMkxoaG5IcXQrVjAzZy9zWXA2RnhtZWhEbW5UT3Ry?=
 =?utf-8?B?MDQ1Z1VmdzM0Rm9BSU1rNFRkdWZzenFMS2crRHcyOHNseWxvNU9tV0xTakc5?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c4a6ba9-de50-4bd3-25c1-08dceec0af7f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 15:30:52.8364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8pRmF0Ptk72pkiKVSdWzf4l/evUy41jCyjckQFsRumdPsO6825DlQ/6oxjqIZiB+/79EvX/x54YPvYfr53HGXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6669
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



On 17-10-2024 09:10, Shuicheng Lin wrote:
> In some cases, when the driver attempts to read an MMIO register,
> the hardware may return 0xFFFFFFFF. The current force wake path
> code treats this as a valid response, as it only checks the BIT.
> However, 0xFFFFFFFF should be considered an invalid value, indicating
> a potential issue. To address this, we should add a log entry to
> highlight this condition.
> 
> v2 (Matt Brost):
>    - set ret value (-EIO) to kick the error to upper layers
> 
> Suggested-by: Alex Zuo <alex.zuo@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_force_wake.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index a64c14757c84..49ceb16e82e4 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -115,10 +115,15 @@ static int __domain_wait(struct xe_gt *gt, struct xe_force_wake_domain *domain,
>   			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
>   			     &value, true);
>   	if (ret)
> -		xe_gt_notice(gt, "Force wake domain %d failed to ack %s (%pe) reg[%#x] = %#x\n",
> -			     domain->id, str_wake_sleep(wake), ERR_PTR(ret),
> -			     domain->reg_ack.addr, value);
> -
> +		xe_gt_err(gt, "Force wake domain %d failed to ack %s (%pe) reg[%#x] = %#x\n",
> +			  domain->id, str_wake_sleep(wake), ERR_PTR(ret),
> +			  domain->reg_ack.addr, value);
> +	if (value == ~0) {
> +		xe_gt_err(gt,
> +			  "Force wake domain %d: %s. MMIO unreliable (forcewake register returns 0xFFFFFFFF)!\n",
> +			  domain->id, str_wake_sleep(wake));

Register value return 0xFFFFFFFF means PCIe accesses are unreliable, 
timed out and device is in bad state. As commented in rev1, accesses are 
recovering after some time, wondering how?

Acked-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal

> +		ret = -EIO;
> +	}
>   	return ret;
>   }
>   

