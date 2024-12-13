Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90A3E7717D
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 12:54:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D0B10E261;
	Fri, 13 Dec 2024 12:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YYEVQU8F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED41610E261
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 12:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734094467; x=1765630467;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=oNO3VVTWgW/UAQJ6Dd6WXNPSSRXp/v0hmHM0bYYb9jw=;
 b=YYEVQU8FQLrWNNwCCy3Rj/xBy/RjUoj+xGwuRG1APxmkSekAopHKLNO9
 Ym9/2XG+dtxv+RgwIDoOAOEc0+cM7nREhWRwfUH1Av10UYKDmtN4CAD8y
 j9Aa171DaZo8fwsUKH5BudAfw7fSteSxK3nNP/+hEjlU4aDEdQmGMoFvL
 zPNL0X8WSDpjeaB8DLFh175gx9vfTHNPx/7gjo8l7/VnxHSt5FOZSu3db
 MwkJD+bstN5Ccf4qPoboqip9YRck+1AadBv0W22INJ2MRulOIAlMMlMmT
 1367qsC3esrRBJA+Qr/K1BARTwhq1o3L+N2c6Pl2WsbPNTtORTQoZ9AfY g==;
X-CSE-ConnectionGUID: m9vzB+kKSNKb6eiOIbB9gw==
X-CSE-MsgGUID: 3GmktoY+SAqivxEiZ71jJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="38221818"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="38221818"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 04:54:26 -0800
X-CSE-ConnectionGUID: HIDpES33SY2IN9TXhHsI5g==
X-CSE-MsgGUID: 7x2r2mgURvOSSU+SxPhXcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="127339861"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 04:54:26 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 04:54:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 04:54:25 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 04:54:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HFVrsT3we+vacsSVr5t6edPTwdTNpBPeX0E+/pbn6UbqyqFZA0r98txJAAfb8Jou0MfQlnCKHOCDiXcUNgqipwleBeUPQ1sgstSNf0T/K/dJd+QZsetEP8YkxPTGX8JK0PkF5A2xFkE/J27jGgwWNdd1mCAHu4/bTweRsMoXOsUNMBONK86uWts5316XjlV3BWJSyQ/nwJv847lW3s0cSUO/ekYm3FAulYKkieIYZw/oSLIeBFpSVXVtVftS89jBtQzQYtG9q8tE449lrUlsCpw2ch8VJHVlj2l+W/aV8edYMuKUsLh9+AImhTOQRtmVoo3uAC6ceXVxDV7L37Uawg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/oTGCE9El5iJoMy80oDZVKPsNljQTOsw1GkFyiT+Ho=;
 b=yQGKMInvPo630t4XNbIJPOEw9oa+vJ/BqTeMXWhQxhk3AlSgL8of0gEpEmhP9AZVHq9vDOLTPJ/o1KFR/Bp4+wfjw2iAXMXiWppAqWSC3Rm+dDYIeCdi9XERkHywMlFTPJB3JR666DaqKZt01jxDIkpbJd+R8n7J+J2q//XcOnLCDmZKv7SfBJzenTMk7X1s+D5UY6ZY1FHgrG9/0VWmmSmrMM8uM6aP5gA698lqvmHEzKhk8SosjYf8GgeZpzo9Bkk1Rcv1bnTPn2Gv3XDN4xKReYrolKkUKTm5CqBfF4ffOUyEzLkLXQD4jISUWSaTslRz6nK3Zh8CNpUg4qjWwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SJ0PR11MB5772.namprd11.prod.outlook.com (2603:10b6:a03:422::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.17; Fri, 13 Dec
 2024 12:54:08 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%7]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 12:54:08 +0000
Message-ID: <4109529a-bbf1-407f-8380-f8d0ca443a65@intel.com>
Date: Fri, 13 Dec 2024 18:24:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/i915/dsc: Expose dsc sink max slice count via
 debugfs
To: Jani Nikula <jani.nikula@linux.intel.com>, <intel-xe@lists.freedesktop.org>
References: <20241210164252.2118155-1-swati2.sharma@intel.com>
 <20241210164252.2118155-2-swati2.sharma@intel.com> <87y10my3aa.fsf@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <87y10my3aa.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::13) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SJ0PR11MB5772:EE_
X-MS-Office365-Filtering-Correlation-Id: 58ad2909-a196-4779-0a13-08dd1b753b5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUNIa1VISUlrdm5WeDJSamUrNXl3bnZWeTlZWjVpblM1eVN6cWMwczVoZ0RI?=
 =?utf-8?B?d3BkMENvWjg2a05zTUN1Y1RWUFpJVEhSRkpuNSthQmc2SWcvNGR6b0xTeW9I?=
 =?utf-8?B?enVKNzZuNER4NExZMXArZXUyY2g0MVA1alJ5VlhnbkpqYzhqQ25ORnpoQmcw?=
 =?utf-8?B?U2lya09hOU54UGZzbWZIY1h3ZS9Tb0tPUlprWThkcEN4TVgvSUp3Y0kza3Rv?=
 =?utf-8?B?QXN1aUoyK0xXbEw5aHA1OTRNdG9DcHNTQVFVY1VhY1ltZ3l4Q1kyYWdrOUVm?=
 =?utf-8?B?QmRkUFFUbG93RkJnVHNDeHRwVUVFREQzb3ByNGZMNEVqQnlaa29ENVZ4YitT?=
 =?utf-8?B?WU5MV0Y0aHAzc05Ra1lWRUErUzd0aUtIYU5qRG9jVEVUUnFBWU5XOG40ZHMv?=
 =?utf-8?B?MkRTVlltdnZRTlV6OHVncnRPZ0VoQUpOYVJPQ2o1Y2NFUGoyMDZ4OFdhV000?=
 =?utf-8?B?RE4yWTl4SGNRQnZtQUN6dzh3WjRUdmFrOElDaHZldzIwSEFKOHZ3U3dCOXFJ?=
 =?utf-8?B?SFZJeDFxZEpYNHF3Q1NyakpvcGdoalVMM2tIMjFHOXc0a1JvbDhLQWdnSVBR?=
 =?utf-8?B?d0h5aWJNZmlUU2t6SlI3R3o4UHRoeGRlcFV6WGJ3RnpyWm02SllDQlV1RjZl?=
 =?utf-8?B?NUJIMnZwYW9Ga214emhIUzJMT09tZFRodUN6OE5UZFdlelMvSFJpdWs4WWxL?=
 =?utf-8?B?QTNQV0kzQWw3UXFkWDdML1czYUphNldMVUtzSmhiRzhXQ2NpSEFCVzV0UzlQ?=
 =?utf-8?B?UXlYS2ZWVTlDK29qVTlXdnE4aDBaUmhrQk16VDZVaktoYVBxalFieFdPZEVj?=
 =?utf-8?B?cDhuUy8wVnREalVvVjFDWHlFL2N0N3VHZWkzaTVxL0dGOHVpOWlDdm1jRXBr?=
 =?utf-8?B?Sm53QSt3RGNCQkJyZm5NL24zdkFDNmdiZXlXYVdQYjg3ME84WVc0SXlCdzVO?=
 =?utf-8?B?MzI4Z0lINFZGdDUvRjRsUVpsaElabFRYQThYMHl0MkNBamZhRExxME9yV09B?=
 =?utf-8?B?STBOLzNmNlI2ZGdpeGVXWkJXK2tiTHN2UEhMbDAzWnpFeENqNThqZmJBc05p?=
 =?utf-8?B?dTVCanFzK25BNGpNYUo1d3gweGxYQWlzWWdDOGpKWDlOUmcwZ1N1WXVMR0RL?=
 =?utf-8?B?cloyNUNrSlJqMkhXdk9yMVpUV3h0YURKZnZvQ2VON2FsOE52WlBYdzIva3ov?=
 =?utf-8?B?N1hHWU5CQ1FHWE40Ry9MaFBpd1MvL2h4N1orM294NFFTdy91dE1qZzYvZTNK?=
 =?utf-8?B?WXpHQ1FvNXM4ZGV4V0o4UjkrdEhVUDFhbDVzQm5yc0VjTTVBUUxPOE9MN0JR?=
 =?utf-8?B?YjZGUUVzMmZSdzl3YXRaRTNURk4vL2thc3BkUi9hNVpwMWZnaloxSzZFQzJ6?=
 =?utf-8?B?d1hGNXlXRTVpM2ZYYlFHbFI2Y3R5aitEUndKN21UcVRsaHY0alJoVDh3Z2ZS?=
 =?utf-8?B?NTh2Z2hiZmxpcjJtOHpNSzRWcklOd3dUQW5hZWh3ZEVSdFNUVjlCUUZCTjRo?=
 =?utf-8?B?MmptOFpHRk8veDAyMW4vMlArVDUxTS9yZHdYN1YwUnJ0cHpPd1RpODl1SmZN?=
 =?utf-8?B?bGVWaWlWUFkyRUZkWE1xdTR2bDFhdG1oVVF4OEd3QkcvVWFYbGxQWDVGVnRt?=
 =?utf-8?B?TXNIRnk4R21TdGxSQkhjMTM5TXZaMHlwL0JzN1YvaDdINlB2bGsrZE42MU1T?=
 =?utf-8?B?bnJOQ3dEZ3FUWkxEV3ZFZ1RpSDU3Nk10UWxNcThSWG1LYTc0WUp5YldRSVNZ?=
 =?utf-8?Q?4MBdh06qoITi0Hqw4I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anRwNER1RjBocituT242OXVleGl3T0NUeks0dkpRdVhSR016d3VXdmhQNFBD?=
 =?utf-8?B?M1haREV2MVVKTE9nU1dVM25vU0x0a3o5RUwrdVR2TkJ5ZFJWRlk0czdMTnR1?=
 =?utf-8?B?VjVsQzl5RWZVUCtqek1od3J1amgvdTBGQk5SZWFVWG1WV3pxb0dlWVJLMnE0?=
 =?utf-8?B?OU5OUUpMQko1UVEvNGc3VjRhMkZyTVQ0TDhodkg3V0dUMVBDeDlneFcxc2Jh?=
 =?utf-8?B?M3Jta0hlcmNFVXZPQU01VXZYYjJRVWZYbDJWMXJGOVpUdmQ5blJRajdsN2E0?=
 =?utf-8?B?cy9mQWRNVmR4WDJvQUliVytsb1NPTy8reVhTNGE3L2lpS2hiTDMvTm4zbVlY?=
 =?utf-8?B?YzRzcEtTZnNpcytzZGJTd0RJS0xsMWM0Q09BN3FrWWUwUlJXNTZYd2lvMGxK?=
 =?utf-8?B?TFhKUk9JWFFZQXhoaVdMZzJ4R2x4OXRZbzBWTVJQWHNWcU1RUEp0aENvUEZS?=
 =?utf-8?B?U2RVei9QcXVTdDdIZDQvT2MxdzM5am14aGlnTTNWbUlTcVlyR1ZtaXk1VEp3?=
 =?utf-8?B?MjQ5Wmc0TytqRzZWNDFVYmdWMjZzOS9YUGhQb1pCTXVqTGZpSjZZQ29ya2JD?=
 =?utf-8?B?bHlrSGl3RCtqMXh4QzRjMXpYc2xjVVM5NkhyVms4WVloUllMUllBM2NobURW?=
 =?utf-8?B?S0tISWhUTzZaSGFDNUUyUlEzemhTRmZOeFBDZUprRGlNQ015SkxIQkN6UXQ5?=
 =?utf-8?B?VVdib0k1eFpUVG1CN0NOS2RoZkFzWDZuNEUycTlBUjMvWmc1NzliakNGQ28v?=
 =?utf-8?B?UEROTDdMWVU4bngxbERhV25MSk5FNGNLV1FxaWloQkhZYXhqaU55NjRLbGFB?=
 =?utf-8?B?ekQxNlZveHBvUXJQczhPWFJWUlZZR2szNWtIam1CalUwTHZRVjJzNjZQbEpu?=
 =?utf-8?B?cWhZSmNralprMW51UStKVWFMNU12VVBOejNwL0Naak5ZUnNwelk0aFBNTmFi?=
 =?utf-8?B?bE53b3N4cnkyNTJzK3JuYjVtOXZteVpBcmpiZG12THRFcVMzZDBOQzZuMU83?=
 =?utf-8?B?eHYyUlFFZzRkZ2x6bllieHRzemRPVHFzYUFQZXRKeWJUOTFzZ3pRbzdEOG1p?=
 =?utf-8?B?RitMOTNvREFwREYyK1craTlnLy9DSkl4b0o4YlR6VVJXSStqZ0JYMERZSTVi?=
 =?utf-8?B?cHppN2szQVlNN3hLTkJvRFVaMW9xYWxLRzk4MTFBTUMxOFVxTTFVMzQ2Nm9z?=
 =?utf-8?B?N0dodks0R3l5dnMzUWNPTUNjN3hkQ0xER3ZFU3lxQmxUY1VaQ1g4VXVJWXFr?=
 =?utf-8?B?aEdaZjhQZUczR0R5SUZzWGowYTV0SW9aamVFRjVac2xOeDFKTEsza1hUVXY1?=
 =?utf-8?B?ZXFrdlpMMGYvM3BueXpOL0pjMkVJeVZYWmhWTGFyR3FiSjBtRmd3VjZMSytx?=
 =?utf-8?B?eFliWHIyaDZGZ25tTG5uUXk0dFB3V3k4RmFuY1d3cnFLWHlyNWJ1WHdRa3hq?=
 =?utf-8?B?RGxRQ3J1Kzh5YWJkMmlOQVlyeFlqVTVzK2U0dFdkbjdqRlpmT21TNlkvVllC?=
 =?utf-8?B?OXhEZURhMlplOU44T290WHZITmxDZE5zbjhYS2hWREJCTG9ZTVJNREw3dTBr?=
 =?utf-8?B?UEUwUGNhM0VnTEZwRU5pTjZkdzNSaE9INlJxVWtyazNqTzAwTHVodDBQU25U?=
 =?utf-8?B?NGZWSnNJMmJ4QXEwNGZqeVUwY1psTjZrangyYVJCdG1vZHVqQUttOFhqWnkz?=
 =?utf-8?B?bzQ4Z0ErbVN2QmJXRUpBZnY4YmFLVDJsQzV2MjNXSGJmOXdoQVpGWVJzT2Yz?=
 =?utf-8?B?dkRXNFZodDN3akpLbU05cVNLRmVIZHFzRVNNME82d0tSM2ZmaEd4SWJHVDh6?=
 =?utf-8?B?aFZReGlmZmVpZ0l3UHdkZ3JSSVJOSEtsNTRmK1JBL2owNFV1UWxheHkxc055?=
 =?utf-8?B?MnhISDJFR1dUS3p3di9LZ0ErZi9HbzJVQ05sTWpFWUQrOHp2TXVWbnBvTkp3?=
 =?utf-8?B?RnVKSmRtZnhFSzFHaVZFcnY0Y1dIcC93bW9qOFRyaWtGWERKYnNFUDdpdXg1?=
 =?utf-8?B?dTZLRTJCVU5kTVhoMmlXQklOOWY4cWNCWjNxeUFKbTRVczNaem50NXlGajMr?=
 =?utf-8?B?S3RITVJZRmtoWW1YMHAyOVI5MmFLbUNVb3B2VjNabmhzcGRLTzRSNFNXd052?=
 =?utf-8?B?c2RmYlhjZDNMVHVtL0V2aHEwV0pmanhDR3ZzV25ieHdGR09RZXJJNHRKTkZH?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ad2909-a196-4779-0a13-08dd1b753b5e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 12:54:08.0800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jnUWtY8foOxOvQqLxY0mtmj/Epm4COAaFNZMhmoOiMS5oT79xJQVmUeD73Dl83sUPzlsXByscv2S6qDqxbTMtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5772
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

Hi Jani,

On 11-12-2024 03:01 pm, Jani Nikula wrote:
> On Tue, 10 Dec 2024, Swati Sharma <swati2.sharma@intel.com> wrote:
>> Expose dsc sink max slice count via i915_dsc_fec_support debugfs.
>> This debugfs entry is required in cases, where sink doesn't support
>> minimum of 8 slices in case of ultrajoiner and minimum of 4 slices
>> in case of big joiner.
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3387
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_display_debugfs.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
>> index 3eb7565cd83c..4823d27cafb5 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
>> @@ -1013,6 +1013,12 @@ static int i915_dsc_fec_support_show(struct seq_file *m, void *data)
>>   								      DP_DSC_YCbCr444)));
>>   		seq_printf(m, "DSC_Sink_BPP_Precision: %d\n",
>>   			   drm_dp_dsc_sink_bpp_incr(connector->dp.dsc_dpcd));
>> +		if (intel_dp_is_edp(intel_dp))
>> +			seq_printf(m, "DSC_Sink_Max_Slice_Count: %d\n",
>> +				   drm_dp_dsc_sink_max_slice_count((connector->dp.dsc_dpcd), true));
>> +		else
>> +			seq_printf(m, "DSC_Sink_Max_Slice_Count: %d\n",
>> +				   drm_dp_dsc_sink_max_slice_count((connector->dp.dsc_dpcd), false));
> Maybe just use intel_dp_is_edp() as the parameter to
> drm_dp_dsc_sink_max_slice_count() instead of duplicating the whole
> statement?
>
> BR,
> Jani.
Thanks for the review. Change incorporated in rev2.
>>   		seq_printf(m, "Force_DSC_Enable: %s\n",
>>   			   str_yes_no(intel_dp->force_dsc_en));
>>   		if (!intel_dp_is_edp(intel_dp))
