Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A640C3600C
	for <intel-xe@archiver.kernel.org>; Mon, 31 Mar 2025 23:48:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55CF610E071;
	Mon, 31 Mar 2025 23:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lqi+Mt6W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E36110E071
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Mar 2025 23:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743464888; x=1775000888;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XfwBJxohIY3Sbdyhszv5W2HP25WGrWidmMrvX/13T+k=;
 b=lqi+Mt6WMwGhbEgsvOc15HJqsrTKJfjFvx+dQyhyE8CwLNK4J4/orZaE
 PiPuMxwadFdN1M8Vqun6PHwb08enxN0bLwt9i53XaCW7Q9h5TzLZjf6BU
 jsYpNA7nrjiG/tRI1gC0YnL3mfPMxyx73LXcnNNS2CnmBb2C5WJV5E/DZ
 7/PRtEinbLzutw3jQ0bvrC34mK9h82wBKSqO1VK1muC7nskVicNTyYQWT
 Hvq4tuA/eiZA79iPA45zNC0LgLBHYxIj5dYZ87K3bEZWKoiKLQOVc9RCl
 KCmAUjpiJ4SDyOpxqPwGC5gC2eTHsf+YuzGTUbPOqqPe4bHNS26uAmg4s w==;
X-CSE-ConnectionGUID: 91G3gx6sRw+AsA3AxL6+yQ==
X-CSE-MsgGUID: TAYycRbeSqeKREXz0VeS3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="55765734"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="55765734"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 16:48:05 -0700
X-CSE-ConnectionGUID: RrE6WycvSzCCDIie5fRN3Q==
X-CSE-MsgGUID: EVALhkHpQO6pnN4VrhpbSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="125982445"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Mar 2025 16:48:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 16:48:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 16:48:04 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 16:48:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=unEKA1HnVglx7zEVADmhRbeATC5ujTJ+hcYMrlWtVa7kdiPrIV/ohQo0ZBjtdb3G7pYo9ERpdsP5FckPjJyZEe2lL+OeQJTXd19M28IFALPpQ82FqcWIdPmJxXrruJmWFmf+RnxSFNb0j7hcszmvR1qieH0kZeu21usSKrvVFcoy7ekyLlhjve1Cvy/ZEIC5Zg8TmCq4qj3Kvr/e72JGghkrJ0l0Ih35nU7lArk4I3M250qSGHQ8rI16FVe/ZxS4n6E9Pz0HmAK/tZlcqiHL/1QhqRc8tJoThXbTj0JkPwiTEzhTNd17CU0PfMZGMxI8icMjbBG9ucGVCAlJ9Uhl/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24qGW1e/MkyTjiAsLVZGhiUaY8rW5L7Cqiu4PmZtprg=;
 b=H19M+K73viiFU/NWoda9AK4HHXNoJonjwsVAkmSkzcWE5HzZQY5jNw1ZUtSgomumfZDdt+5V8BhRiHIFPPYWJ8xBZ8MaRxqs0GWcah5zjLwuwkJZVGgqfqXOlhJQKj+H/NUIUe6HjhYq6wtuqnMREcbkJFuAs1tRUi1VUKOp1MKAhvDGu6XMcqWe3VYqUU/TcsOmJvX/eFVaQnBkRTZISyXsNLYwFLd7/gOhk7UeRVplFA/M4wSHHxrwc8rq4SBmRzO8wxyVDe8ENogaAacE56nlEsFfWhFhSW7DJLo/YOBTKEzGGDQFdu5qxpAkI9x2pGJKSgw62MkSJdbGikdxKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by CY5PR11MB6440.namprd11.prod.outlook.com (2603:10b6:930:33::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 23:48:02 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 23:48:02 +0000
Message-ID: <b893f6a8-6e74-4a92-bdbb-8dfcbcbdf8c3@intel.com>
Date: Mon, 31 Mar 2025 19:47:59 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe/guc: Add LFD format output for guc log
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250327234028.249314-1-zhanjun.dong@intel.com>
 <20250327234028.249314-2-zhanjun.dong@intel.com>
 <Z+YaCmivtd1Wa9wU@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <Z+YaCmivtd1Wa9wU@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0229.namprd04.prod.outlook.com
 (2603:10b6:303:87::24) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|CY5PR11MB6440:EE_
X-MS-Office365-Filtering-Correlation-Id: 01a015d0-b9e7-42cb-e402-08dd70ae7935
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjllNFF0UTJKWm5TOW5UNjBXM1k4QytvdExCdHJHWnMxM1ZvUzlhOXgrOG5J?=
 =?utf-8?B?Z0FzQTZyaVAzYllXV1QzN25leGJMUlZPREpUVnA2a0FNWGMxUVNBMnBtbkdB?=
 =?utf-8?B?N1gvRlQvRFJNSjVqQkJMZjdaK1BuaVFvZlJjclo0ZjdQZG9mMTE3QjNGMXBG?=
 =?utf-8?B?SmZxeFcyNFdSQld2YW8ydVZLM2lkcGRER2RyWU1mZG5hMHlvaU1vYWk1bm9S?=
 =?utf-8?B?NW1ZT1FtT3pSSWZaT0pFWjc1RjUvWURKK0VNQkd3M0R4YnZYTm9relVyYmVv?=
 =?utf-8?B?ZGsyNDRPVTBMOVpPbkptdElNMFRZa3owb1NhZmhzK1FVV3QyTitVV3kvUS83?=
 =?utf-8?B?WVM4bE41Tmh6ZDMrZm96dE9XS0ZyYWc2clZSd01pdjh4MnZNOG8rUzIraXdq?=
 =?utf-8?B?b1ZaSEhoTXUzZyt0MUVyNzBlT0ZlK0VnbDF0bksxY2VWMy93SVd6bjg4aUhR?=
 =?utf-8?B?djhyN0l4Z2M0eFl4eEFWTlhQZjhlaDBTZjlyTXowZlhEbVZOYTVUM3VCQlIz?=
 =?utf-8?B?Ykx2akNwTU9mMXNRTjFjL0w0MlViOWZqY0wyZW54ZW5DSVFxNDkyM0ZKYTRY?=
 =?utf-8?B?RERBRktMVFNEMFRpQmM0WGdad2hsWGFZVlJseUo2ZlR0d1l2ZXJ6NWNOcVd3?=
 =?utf-8?B?TEV0U2RHWVdPMlFBcnVtL3hwMUIyMmh1MWVQNzNZek1pd3RqTnZNOTVIbFNN?=
 =?utf-8?B?cjRxSWl4NmZKTnY5MDJDcU9xK1dyMjVoYk90bGJ2UGxUZHNuaE9CK2JzUHpN?=
 =?utf-8?B?alliUWV1U3NhaVRvb2RpNU1LdXg5VElXTXlSVmZQdW9ocVlvd1daZHA0Qy9n?=
 =?utf-8?B?TnAyMHd5UW1VVjgyeVI1ZmM3M3YzMUVnNXF4alMvcXEwSDVObW5lakZSOVk0?=
 =?utf-8?B?cHZtVmprQWs3MWJVNjltVzVDT0Z2eXdEdUdlUm45RGZjdE85N04xTTFHZW9u?=
 =?utf-8?B?S0NuY0Z4UUM3aXRUNUZxT09jK0dQYUMyR2FLM3dRNnlqVlVsTXYvb3p3QWZJ?=
 =?utf-8?B?L2xuSnNTMndqYjc3ak0zY0dMZksxRWN5VzdGT3R5M1hTaEFIbk5oWkVib0J5?=
 =?utf-8?B?LzRveFF4QWpRN2RaNU1FckQ2dGJxajJSTjhub0ZSSGNmcVRmdlp1WFJUOGoy?=
 =?utf-8?B?bkdJQ1pkejJ2WGRzeGtrWGNKK3dWS0dKWXdBeGtmN2RaSmxGNkdPSi91ME5H?=
 =?utf-8?B?Z0F0RFhkMEFGVTg5b1ZCUzB5MG8wV1dKT204K2JTQ2dldFpKMDE3ZDFMRVBP?=
 =?utf-8?B?NEpNUE12cWxacHlRMTlhcHgrUG1hTEtVWkJza1FmVllFd2VLdGR2SklKZmgy?=
 =?utf-8?B?ak1nbEg4UGU4bUxWcXlBdlBqUVBPTkZ5VUtEMVJKYWdYa1diS1c4QmdJS2Jm?=
 =?utf-8?B?QUo2N25pZGZYODBHUU9OSjNkOFhhRlBrNFBrbGlmaWpBUGE0bGw1SEwvMXF4?=
 =?utf-8?B?SjNQWnVYTVZ5bEZncldtUXFoY2h3QmkzUGhYb3ZaN1RVUVQ2VUxGSlgvNURo?=
 =?utf-8?B?VW55NUQ1L1FmMjFvYmt5d0NPRmxUbk1Vczd5KzR5ZmMvWS8vNXkvVlBQcmtp?=
 =?utf-8?B?MHhHZFYzQ3VXSDJrdUdMSUdEVFVJOW9Vc3VlVUlmSmZObXJ3dDZkYklpV2l4?=
 =?utf-8?B?TDFpYjdQL1Fma2ZQN2VUWk9uUVRMVHNQNkhpYTRTREF0bDR3azYxYzRVeUk2?=
 =?utf-8?B?ZXBQMnhxVzNXeStIUnVWZEQwcWRRQVh6R3RpaS8rck1BWU1sTUVudENJU3B0?=
 =?utf-8?B?ZmxRTmxUUmMrUm0yWk1NaFZpdVlmVHBZUEtramhjaVVlMXNCUllQVjlybXF1?=
 =?utf-8?Q?0nHXrQHITeLYS1iPjpjiekiYQTbSy9ONlD9fY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzVocWo1ME5UdUJBQTJudDVNcUNvd1Rsd1Q3MmxzS2UzYVpJWEtTSWdCY1ZT?=
 =?utf-8?B?cUp2ekJ4SVhVOUdZNkw0OS9HcWpjUWhidS9DRzUvYnJGNGN4T1VaMTZXbCtD?=
 =?utf-8?B?eHNsQ1JaRnlKemRWOElCcVJyOFlLTjJzWCtSVTBFcFJPekdFajYxbTErZFRF?=
 =?utf-8?B?eVMzMGtTSDE3UTFnUzBOTGxWd1U5cGNXcU10WVIxNFdtbmQ0Ykk0SmJPT3BZ?=
 =?utf-8?B?UlRtSXM2cFlFQlF3VG1PSVJCUzBwNXdxKzBwdkdTbmhra2I1eHJ0bGdCeTA2?=
 =?utf-8?B?bXVpd2pGeVJraHlTTVBJTDQvSUwzV244RVhpMVM3ZlJMRnZhY2krZm1CL1dR?=
 =?utf-8?B?dHZDQ3pyQmpCUkUzZ3lkK0VjRElYNDBtRUpLMEZwRnNYZzc0dTVmNVI5T3BB?=
 =?utf-8?B?b1U1QTQ2eWJMeWRpZzB2bXpXdk5WMzlvTEFOWUptdzkyRFhRNVBYWlVIWWVZ?=
 =?utf-8?B?NVJUTzZEM1lXbEF2L0gvYkVMRDdUZTdLc1phWms1TTlVUEQ1dW9mU2dFNktq?=
 =?utf-8?B?RXJFTUE5RlRsbzZWSGdENFAzZElSZ3pMTUF6UTFzZmlNZkJBNGJIS21JS3Qz?=
 =?utf-8?B?M000SlFZODIvZUhyNWNkcVIwMWw3dk5qeUZ5eW1pdFJsZzhHeUZyVGRybzhI?=
 =?utf-8?B?S2lnNytjQk1qY1ZSQktzSHJSVElVckNPMmNYdDNvSjhsRy9oT2U0U2gxYXFw?=
 =?utf-8?B?WHhRRzBhNVhIakxmNW9tOUJhejJTN3A5L3ZFMlBCakdlRldKZmp6Z2lyb3BD?=
 =?utf-8?B?V1hBMWVBYzJxSDY5RSsrUldFQmVIeWY4UGFCM094WjdHM2tHRkFRNmtyajdV?=
 =?utf-8?B?R1EyN3NjMkV6YkZiMytRRnZxM1A4T0lxNzdyaWhiQnMzSndyRVlYaEZxZlM5?=
 =?utf-8?B?Tno2UCt4NDVrdmlVUEoxdGg1TS91aGJmRlhSZm1jd3BabHUrTGlMQWo5amdn?=
 =?utf-8?B?YlhhZjBFdVdlNE93WWJSRFJMa2dzbnBFb2ZUQXVIYmRXeUpRZ1pxa2JqTGhJ?=
 =?utf-8?B?K0s4b1FJUW1idU8yczNaTlEwOHhkRGhUbktldi9uaTFkOU81b0cyVmNXM0V4?=
 =?utf-8?B?SGVvMUYrSzhRNVJ2NSsxYUozNUxqQ3JGSGdpR0pFZVBrRFZHL29BSnRUekMz?=
 =?utf-8?B?cW9ONk5YSlVKcTZJZTZtZzhWTlRKd2hjUERvZC9JOGNKVlNpOG9hRVYyUTlz?=
 =?utf-8?B?VnM0UEUvU0cwVlZlSEFNYXkwVVRLbG5IaFRlWk0vTmIwZlVLWHZUSytTSjVN?=
 =?utf-8?B?eWhHQTJ6MmxjMnBIbmcyVDFyM3ZWZkJFVExvUGFkL0FCMHR1VzNQTFlLZVk0?=
 =?utf-8?B?aUdWQ1B4T01CZXRXenlRR2VPakMzYjByMGJHYmhIaDdMeVpMQlc3WGdYMjhq?=
 =?utf-8?B?WG05TTVQb3RBeDZvbTkrQUJrcEVwSFFiSzc3enhoTXdVN1VtUUtWazdGb1dE?=
 =?utf-8?B?WlJNbXNXSWM3Zzg5T0hXVnZiWUwvUU9rTC84dVZzSG1zS3NTOHhLWTYzNFJT?=
 =?utf-8?B?TjU4TG5JbEU1eVZSUlBRaFBUMU5GS0dHeloyQXp4cXNlcXFsRCt5MnYvcnZq?=
 =?utf-8?B?dzZLNFltZ3F0VkFKakh0VDAzZ2tiU1NKNHNwaEhVT0lxbUZNbE1VdmRqaDFr?=
 =?utf-8?B?UGVtNW50TWZZQ21Xb1Z3MHdPc3p6NGxWb1JPSkxIWnVFZHVhUzNxMkZUTDEx?=
 =?utf-8?B?SmFRWlhzNFVROGJhMUFtc1ZwMjBSTGhRTStRYUZmQUl0SUZ2N3V2TXN6cG9u?=
 =?utf-8?B?L2FGMmZMdUEzemRVcm9Lc0pXZG9QUm02WWlZMkE0OUt0UGhHZUt0bUpxSnJa?=
 =?utf-8?B?aXhPMWVCY1ZnTlhZa21DUVZZaUl5bWNVWVNDejB3ODUzVXhOUVhFcGNobG96?=
 =?utf-8?B?VlVWbzdLQVdyUGVLMW5KYy9QangyenBNMFd3RzJBb3Uvazd6VzRDRU1ydTZB?=
 =?utf-8?B?NWllVnBHYk9MVU16bmQ1U2Vqb2Zod2laWUNpN2NxUFNGNHVCSFp5OGlLelNB?=
 =?utf-8?B?eHJIZ0NBdUVrb3VIU1l5VUNMcENnK3FwVmRIdnhzUU1obnZJR3dIQ0JZMGl0?=
 =?utf-8?B?MlU0ZVc0UE9XYUJRTEJ1NFVjeW9sUXZYQTVsdFVmVHNKSUd1OERmUlgwVzRi?=
 =?utf-8?B?a1ZFTGh2bkJWc3VaTDhrUkxpSHpHVGUrN09kTG1haUd5MFFnNVAvRHVIbXBD?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a015d0-b9e7-42cb-e402-08dd70ae7935
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 23:48:01.9470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4WwM8fJ7elOsmBSQ3OJDJLt9yFjPJGjq0iRkGoSvKlBwYbGCthm4geJ3nq9cvwEGsDlXci8X2akZaplIQFwtiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6440
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



On 2025-03-27 11:39 p.m., Matthew Brost wrote:
> On Thu, Mar 27, 2025 at 04:40:27PM -0700, Zhanjun Dong wrote:
>> Add new debugfs entry "guc_log_lfd", which supports output guc log
>> in LFD(Log Format Descriptors) format.
>>
> 
> Not a full review - but couple of drive by comments.
> 
> I suggest trying to split this patch into a series of smaller ones if
> possible. 756 loc is lot for a single patch. Off the top of my head...
> 
> - ABI patches
> - New GuC patch
> - New debugfs entry patch
> 
Thanks for review, I will make another rev which split into more smaller 
ones.

Regards,
Zhanjun

>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_log_abi.h     | 112 +++++++
>>   drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h | 261 ++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_debugfs.c      |  14 +
>>   drivers/gpu/drm/xe/xe_guc_log.c          | 368 +++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_log.h          |   1 +
>>   5 files changed, 756 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h
