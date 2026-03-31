Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1790FF60CE
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 06:29:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F5ED10E86A;
	Tue, 31 Mar 2026 06:29:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="budNanGa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA87810E86A
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Mar 2026 06:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774938584; x=1806474584;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xQ4s154HQgLRVpzIQTea12faTCqnXtnrRC96yPrsbTs=;
 b=budNanGaEdlI1Dtl3Fec+3o0iEE2ckogIeEngt9VfPcrrFhdR9TUUNyP
 JTDGdtAhn2FIWsMI008BXyYEOaPdkyw3Tbd72PmL6cgwRkoUzbkqXppgW
 MMm6UTnqWALQLJsUEufU6LRJbLN8ZNWwLjumYPFSisynBYwfa2HTGnrxp
 dorCaxUUbaQyDaLnhIk/uLPvrld6UcMFqh4TNMj9/yLBxVA1aalNR6bn3
 rq5AHuJTFIuwwhvaCP+qESwfSAQis3q6paOPcfmeTfCuPQTGpSqxtbtAr
 s1d4rdWtMDRL6MFimD3MWdtlTBPLUKiVsKYUB/tgUKDGzecMUW6FtQkpr g==;
X-CSE-ConnectionGUID: fsRxUXtIRiGfhEKfrKbdeA==
X-CSE-MsgGUID: WywSrCFrRsar4dzEkWAuXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75835613"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="75835613"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 23:29:44 -0700
X-CSE-ConnectionGUID: Sk7racYkS0u+js8cygiuGw==
X-CSE-MsgGUID: LVPyAYEKRZCcfXzd1wBHxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="226151687"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 23:29:44 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 23:29:43 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 30 Mar 2026 23:29:43 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.57) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 23:29:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lmKRnpJcCYPiI6ctJSnVdRMwjLbFCtQCQFqXlwOngiwTPcxmw5ZDGYCa2PQmWG3OYe3q0hycaLnh9iA3oVYMyPWX86mvRKW45C5yTK4Y8A+RgHTKH/nFx+cAJhSvmUYMC8Ro8J3jema+Llv3rHBAtUfDNpvMMRqs90xOYblqnvwK91gJd5UkE5ipzh1Hn1za6p9Z+2qKasieibROjjRC4rDnd7QtdA2MDm9x6V6bDmbYm3Yt34JuhGAW9tq8rPH2+C+NVsyCBm3Ifa+pBFqmYilvcBEIHWwVsbo/uzPZzm2OQakjMFFwMoH0H7snIIjS2+7Rzq1F2IehiZ1MOk98JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iag1DwrdHhZ2DdG6wXQgHhb1M/g9NkKN0nNXt8Pa6Wg=;
 b=TO8jt+CKuw/qKYZt54ZCueTCF58zap09QQRgBfFJA468ULqWquj+1IgxmnqSOnjAu8vYEvRkVoHQDNcwLN6bF0IvrR0qsSOQEus2+nD+n/wqa+sMeTTTjkiwZFROUbhdVmrMVJ0TIawwSQxofY3tSuJPD3n5tI1jxC0h1GinK0shkZHatcEbzs0msd4sOw8t+K+e5ZFQs3GJK2tmz2uZWnxjfQBeblXFaZPl+1te4oCkctVPZnI1KeaVXfbhn95U4oRsWXnhX4DBnknpnRpf8DKQkemDX6tLwjTYVqbWVJkW5rM3GDppJjmTcRtgIYmPF+sYramR4JjNCCQo3l4pPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7175.namprd11.prod.outlook.com (2603:10b6:208:419::5)
 by IA4PR11MB9106.namprd11.prod.outlook.com (2603:10b6:208:55f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 06:29:38 +0000
Received: from IA1PR11MB7175.namprd11.prod.outlook.com
 ([fe80::cc3a:1f73:430f:472]) by IA1PR11MB7175.namprd11.prod.outlook.com
 ([fe80::cc3a:1f73:430f:472%3]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 06:29:38 +0000
Message-ID: <b9fa5d36-0541-4b92-828d-c90c4346051f@intel.com>
Date: Tue, 31 Mar 2026 11:59:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/dmc: RFC: Reduce wakelock hold time
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <luciano.coelho@intel.com>, <cc=uma.shankar@intel.com>,
 <imre.deak@intel.com>
References: <20260313124157.2889931-1-dibin.moolakadan.subrahmanian@intel.com>
Content-Language: en-US
In-Reply-To: <20260313124157.2889931-1-dibin.moolakadan.subrahmanian@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::12) To DM4PR11MB7183.namprd11.prod.outlook.com
 (2603:10b6:8:111::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7175:EE_|IA4PR11MB9106:EE_
X-MS-Office365-Filtering-Correlation-Id: a9b73239-09ca-4ae9-bfe5-08de8eeed9b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: nEjaZVXsjvTfN3j78fXCknbqPryUwSfAWzyjx0a1htLZSOsALiOTl6zSZ1z/F/VW+70DhBD0PBWv93/nYcWItY9G1P5vDs63iOsSFcOg/US3ar7qYSIO8jfb8GYooHEPYYVFO4xIoolURnGa3HkmHl+R62LRQgntPTQwHxpt1m5WNhFpIBvhVXeA/apCPz8IJPqbKi6i+Q5b8T8Ds3H9KnhwN9hmRzeuPbg0VwMpgtT+fA82YhUgUX8KGSFABOl0CUGxrlsfPxnjsrDK52qEqwir/vFt7rJQeRxu6HRDukOp0ckXQTecvy6RXTol0o2d7xNbrDZlVSo2yNDXkgGdZ/YJVfwY9DVjhIyiKvBc1/DjNwNMSoq+kG1B4P2aEZ7aG9Q6o7L3nRrDRjb2aUg8i9i6JDX3FuikGRDdTf9v8kc+pLP24d/3JNC/jTiLbaIb/b4qIodupeQsgJOnFjwT99DMOSGXmaa6Xs/7yVxnlEvS+IQ5WmVlQvD1o1ek4VDM+OQ58HxXJcplnow0vkNpsy0qrNE91oyOCGdhmL/5jihOWCcHI7O/6r/gzAE8iJZjKLAaFqF+R30fT8O+uKKGN2bRQp3rCCVP4sJqJFkHM5cwPQvjSeYuAjVyc0Qy7JGm3ZeCi3yzlnD61Yvq2pofdGygz2IAEW6Ppkmne0qOwy7b0po+gNHi10ARgDSsX/IX0ARposqg8m9hU5CKHRw7lN4QewNRTerdXJ36IznnJO4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7175.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnBjNmRPcHFtWVErV203dXpMcXA3T3FMN2pEMmxJTWdnMzJzSmFVbTI0TndM?=
 =?utf-8?B?WlNOdlBHUDZvcEJjYVdXWFFObU13d1NuQW5QRlRXLzYxd2g2ZzZIdVdyb29J?=
 =?utf-8?B?WFVkcFBuOE5EcTRQSndRMkR3Qi9HNUxLejcvR05TVnJYTlRvdGhSTnF0cGI4?=
 =?utf-8?B?cjQzZitsQ29aTWZJMnVwUi9Nem1jOVNtajN0UDEyaVJXOEx4RytwSlhPRVVM?=
 =?utf-8?B?RkpXTWg5cEkyZmpZdUdveXJydEY4TG1sSWRLcE9hSEFKaWlLL2swNEwyT0Jn?=
 =?utf-8?B?RnhabXlsUUZ5RUkvaUorQVRUVEkwWXVBTGVNT1VxRGVPV3hCVVFPVHdaTEFq?=
 =?utf-8?B?SzREeVo1NUlxVzF2UHVpbDRCeSs2Z28yQ3gzbUc1aFFLaVIySkYxOVA4NlZv?=
 =?utf-8?B?K3FrdG9PNTZZcndrbkc0b2pldnBJbWorTGpBWWZ5WlpwblRLR0RrKytkNHBS?=
 =?utf-8?B?ZGh4YlAyYzFsRmxYQmZLa1RSbENhWFh2MCs3L1RIMEJLVnFqVTF3Z2JnbmZm?=
 =?utf-8?B?WUY2Y3l5b1d6MmV2cE1vNmwvdElCNkFRdWRqQlN1MnIwYWlYUmNQWmNCMWRB?=
 =?utf-8?B?cDF0bVBERUpaUk14NmJpZlJtNzZYb2ZVQml4UGxsWC9IWHJldnR2SkdIYVAr?=
 =?utf-8?B?TUswZEJGQlA0TFJiQ3dpRllnajJQaWdnT3M0TmpuSXo5VWo1WDN6VVBoWi8v?=
 =?utf-8?B?QmVjbC9nMGpZUVNsUDlUa05NczR3MmVBZ0pNMlRaWTBIZlVGU0dzUFQ0VXlt?=
 =?utf-8?B?Ui9xZVdxazhlVEVZbW5telhwRVVxTUhhNk5tOXVsR0U4VXVMQy83VHNwRE5B?=
 =?utf-8?B?MWpLRG1sWWNQSnp0K1FLWDRWVDhCUkgxMlVMUkdKQnFQOHVzS1kzZE1vSURi?=
 =?utf-8?B?VmtoWm1vbjF6cWlpRHgvMjMxMzZmS1BCVys3KzJoU1RmM0ZFNHE0aE9SQ1Bv?=
 =?utf-8?B?aDIrMXA1M09SaGtqNDM5TDBVRlczU1c4ZEVZYWVsTVJneW1hWFZSRzM2eUls?=
 =?utf-8?B?VWNlb3FMSlFzaXMya2FjQVJmMUlWMExlUno1cW40WEwrWk5tZjloNmVENnZZ?=
 =?utf-8?B?Ym1TNHg0Y0pwdk1MbENuRThwSS9NdHAxZG5YQmZzNVF1TUNvK0dJV1FWN0FT?=
 =?utf-8?B?UDUyUm9JdjRjM2xEd3RjYUJVNG85RWlSNTJuYlhiNEcvcmdpSDBZRDUxcGtS?=
 =?utf-8?B?R0pjd0hROHRwM2htbWpTYnRXUmgrVHVtanQ2QWt1U1MxVWtvcHJYUTFFOUlG?=
 =?utf-8?B?ZVFSVlh3dCtDZlBiN3lxY3JhVWVnUVhBNldFeTFzMUJBc2FwM1kvK3B1NzVH?=
 =?utf-8?B?eFQyNDFuYVFDeHg4dmtFTlpXeC9rUm1QbnphcUpLcUZCcndZaGNpdDVBZFFR?=
 =?utf-8?B?Q1dmUFJGa3ZwQkllTUtRNWwyQ3ZQVExOZk1va0lTbnpCRURLcVorY01NRFpI?=
 =?utf-8?B?aHBTcFNvWUhnWVN0UUZBbjg5Z0huL0hVNUcrSFNqMjBxa1dqd1ltUjlpdVNl?=
 =?utf-8?B?SVU2UEdoMldMRHg3SzhsT1FRUE5wZUhrMytEUnpJbHl2OGc1UjVwTkwyOFBU?=
 =?utf-8?B?UTZwMUxPRHZkVlVXS2JvYVdhcTFKVDVjek1vdFFqL1doaFQ5V3Vxd25kNGIy?=
 =?utf-8?B?OUV1SDljUDJyOE9rUVh2Skx3Ykl3MGpRakR3YU9ISFBDQnNzejhuQm5vMkMv?=
 =?utf-8?B?dHFIend5WUxDeUQ3TXFGUHpMSndMQ0J1a05nTnZWd2oyQ1ljZWR0Y09YaW8z?=
 =?utf-8?B?eWw5dWd5RW55VnlWZ3pzbDR6NDVXcERyN2hQTDdaOTB5M0lReUNTNFMxcnZD?=
 =?utf-8?B?aXFPanFwaHZOY1Fwa05tNno0Vm0yYllYU1JUeXBkNSswU1ZDaXYxWTc2byts?=
 =?utf-8?B?MWVzTzdkWVFHR0JIbmVZanRWclhrWTh0cWxReEkzZ0dzY0dHUDNlVWJWUHhm?=
 =?utf-8?B?eWlFUERSTUgwTFQ2S2NXVm8zcGRldjdTRUVLd0NweXZ0MjNuVWpZZFk0QzYr?=
 =?utf-8?B?MXRVVlhleCtGTVM5K1RZeUh2QUdFWG5kOEQ3NGhNb0lPUTJ6RExuOXNnWGo3?=
 =?utf-8?B?VDVKQnFWQ3kwL1I5SThKNGFKV2s4MXUrRktqeml3YVhpK0d2SWh2OXNLSnQ0?=
 =?utf-8?B?QzFCWm9kMWJNbEpYMEM5bkRqVFFaMTRHZWJOczBMb2VwS2pibndiVWNtYVhW?=
 =?utf-8?B?YUdaUW96QjE3d3hwUDNpZUNPMlJRcnd1b3VDT2VFV1VHY0VEQXVZVVplSHpm?=
 =?utf-8?B?M3ZiblBEV2ZCNUNDMmVocjZqRmVLMGxHNGVtMmtTTE9JdFA0NDZGUStwWDBL?=
 =?utf-8?B?UXdxU25SeGpza1ZSVjU1WEl3N1JxZWVFVlBUSytLM215NzMzQUw3aVE4LzN1?=
 =?utf-8?Q?PecMbpsOnew1An7yzItZikAJCwmJJtA8JyNhUf6dILPsc?=
X-MS-Exchange-AntiSpam-MessageData-1: jVTLrV9tJK1aZA==
X-Exchange-RoutingPolicyChecked: CccvG53SfIOgY6sdAl/kAhfvqtuq0jC+FcbJ990kEOlIufCIB2+Uiqgh0bi8Tv97HS+BH15XVqG7NFgh+dMwKBbyiEBf9qPLDHrYOL/Hegs0OnA2XpyjzuVZDy6W0vR34rjtVIfnSAddSrboMTuFm7yezFRQgc5a8XOzZrk+75+op5Fz6kaB0HSS+3d8KzmE6iy2cu8Qt5m7L+YOOnmluo5+5oht4TtiGyzmviAzMhdhxPv0QQXHbw5xD5NrSU/pwOa1ACrzq9AgwSVDxu1rSnhL9jzWuMHFFShIs4R9Zl6VGBd5+qJdkp4HTK3fLfxSb2OVyptQE+GveM2/NVT77A==
X-MS-Exchange-CrossTenant-Network-Message-Id: a9b73239-09ca-4ae9-bfe5-08de8eeed9b4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7183.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 06:29:38.2833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3/ZTrJv6I6D9kaLj4seZSaSW67zxCwsalE/4wYH5TIeTEfR/8K+e5ZVopwuB39kVZU6hebgt+u+foJsix/g5szxnSAMhHv6ltmYLicG8lHLpM6pYJK2PWD1rcf2X8QNw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9106
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


On 13-03-2026 18:11, Dibin Moolakadan Subrahmanian wrote:
> The __intel_dmc_wl_release() schedules a delayed workqueue which
> releases the wakelock after a fixed timeout of 50 ms. Until the
> delayed work runs, the wakelock remains held and prevents entry
> into deeper DC states.
>
> Reduce DMC_WAKELOCK_HOLD_TIME from 50 ms to 5 ms to evaluate
> whether the delay can be shortened and allow earlier DC-state
> entry after wakelock release.
>
> This is an RFC to collect feedback and verify that reducing
> the hold time does not introduce regressions.

 From the code, it looks like the delayed work mechanism
is intended to address two separate concerns:

1.Avoid blocking the MMIO caller context: The actual wakelock release clears
DMC_WAKELOCK_CTL_REQ and then waits for DMC_WAKELOCK_CTL_ACK to deassert,
with a timeout of DMC_WAKELOCK_CTL_TIMEOUT_US (up to 5ms).
Deferring this sequence to a workqueue avoids potentially long polling
from the intel_dmc_wl_put() / intel_de_*() call paths.

2. Provide a debounce/guard window: DMC_WAKELOCK_HOLD_TIME adds a delay before scheduling
the release work, effectively keeping the wakelock held for 50ms after the last MMIO access.
This likely helps avoid unnecessary DC state entry/exit attempts.

With this interpretation, reducing DMC_WAKELOCK_HOLD_TIME from 50ms to 5ms
only shortens the debounce/guard window in (2),while the deferred release
mechanism in (1) remains unchanged.

This should allow the system to enter deeper DC states sooner once the MMIO activity
settles down.

Please correct me if I’m missing any original rationale behind the design.

Regards,
Dibin

>
> Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_dmc_wl.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dmc_wl.c b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
> index 73a3101514f3..ddf1a1f1ebc3 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc_wl.c
> +++ b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
> @@ -46,7 +46,7 @@
>    * atomic variant of waiting MMIO.
>    */
>   #define DMC_WAKELOCK_CTL_TIMEOUT_US 5000
> -#define DMC_WAKELOCK_HOLD_TIME 50
> +#define DMC_WAKELOCK_HOLD_TIME 5
>   
>   /*
>    * Possible non-negative values for the enable_dmc_wl param.
