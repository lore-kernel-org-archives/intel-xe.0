Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B1BC5DF8C
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 22:26:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC35910E625;
	Thu, 20 Aug 2026 22:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SQWx1zyp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6BF10E625
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 22:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787264808; x=1818800808;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aRm5xg3IHC7gJ9GZMvvT/CNBNE4UMOJXSvIT27kIFnQ=;
 b=SQWx1zypqJtOVmW1I6oApMeyF8wz8rP6YkaJx9l5J6Ib1Rgdhyc0GKn2
 9Od7YPhf0qUjigdIDby7NUzxnAwpkBKjnmMW0RLhfznhXAMJP+Sk2ImvH
 dHhKmtwB+WOAkop206ckOgydO9+JvFyCZAEmNzQd5TB3aByWGy1JKe0Db
 3YrRwlY7e89dy+5VjAp8p1H6IKUjcVIPiIDlvNhETZ0/9A1XS9ni9/Oqr
 IUJpmWi/soUU304o3/6Pv6tmeH12BTpUw2AEJf5xFOUbSi0Ez5in+bgNA
 gCLLwd7Lcfe8D6ob9UDH/kkwcGKOLqQWhZnaoKUKBQrsfjDTcBSxQu3px A==;
X-CSE-ConnectionGUID: DUDFfN+QTSm9rqF8qE9C9w==
X-CSE-MsgGUID: ekQXnRTfRxCqtgbEW1M3ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="98405405"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="98405405"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 15:26:47 -0700
X-CSE-ConnectionGUID: Z/3zpyQJRICNcBo55UslJQ==
X-CSE-MsgGUID: 6Vd2wpZFSyeUZdnzFlPUTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="296087492"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 15:26:47 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 15:26:46 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 20 Aug 2026 15:26:46 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 15:26:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gkpbqBaXPO+a22synsZdNSp5/9cHby1wibXGRfSjQfebtNufvw9yp+POua9leQ9znH0IkaZp1HEbaGqZGLjtUy1T2+RnayzfP6GyXi4X1mOMwgGsFKDwy9RqmOa9uPtC0e+8853XUP3N0RbCHuGagDv4j7RInHhc2YiVqtmQOvXnUc/7OvCatLBAFfw8xnyiu0qyKQSW/xTVMqytYkfGenlJ1MOqFhXTBoPxTWMuwVI1WKzDAAdwoMGQYqgGK8GK5mDUdd60p1qfBNJ2MOSgDQwiQYprgZGf3tK7dCgb+AR8b2V37V4iZuC9IFLaCbjWPdX0hYwejPZXj6EgnD41Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+XWObnJm6QsbmcmHJuDApJt5w7mwSiGNxRrguhonW0=;
 b=k3mUokLpT5J6NC4hKdy3mTcmG3anNRyTpufsJELPKf4eQb68NUaYT5p5aNTmGi6rjDwenQ3vezyU10E1uXAV0mgT6RHqmj1lJ5LSmKD37J3l0S/O7GNpjLID/6LMGg0u+fmt0kx7v9E6zNm+UhJ9QIh0yEJIm1f3U0cp+4hzxr7C9phsQq0GIDFdVAd1Tud4JgIdiADbENUGj4Pc6PxgdygTor0zOttHHKf/rL62rmjFOQLjWmSf7zlsMJ0i6vX1tBUeDds6WDEO9V78y7W8z2Bf62m5UBgUOlbWNLr8uKXOc0HdrLSGyUzLFXQr/P9wcLIU9KlHy21FLaKEhmY/FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA1PR11MB185510.namprd11.prod.outlook.com (2603:10b6:806:51e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 22:26:44 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0339.008; Thu, 20 Aug 2026
 22:26:44 +0000
Message-ID: <0e4c1b8f-c826-459e-8202-04a2c883d213@intel.com>
Date: Fri, 21 Aug 2026 00:26:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] drm/xe/sysctrl: Return error codes from
 sysctrl_wait_bit_set()
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <anoop.c.vijay@intel.com>
References: <20260820101632.527214-9-mallesh.koujalagi@intel.com>
 <20260820101632.527214-11-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260820101632.527214-11-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIYP296CA0012.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::13) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA1PR11MB185510:EE_
X-MS-Office365-Filtering-Correlation-Id: ab97850b-8ef5-46f9-e375-08deff0a1d79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|4143699003|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: yLZMmUksZaWfVZl5LE1+rzc3x7TvsWEjW1R27xj1BqVyiQfLPLey9jW2ErcwEWl/FP5TSNUgofOgPTbo0eIcEHAP1SYno2LmbIqs5sZfm0JXB1HqaP5+KTUmRRbEH6XcSERtbDnGY7ReNjgFSuE/yT3kn0T8TdSIMH8uGVOVLcrpvoZtDQuC3r2Rp4FyOo5JLyATdoc+u8oJZiYizlsyZVM4+0tfSt4+nKRxaQeSOC7W7VRd9HQa+KyxR75CK/kkoo6IPR3zTx1Q9Clgpdl2hzMFmOGND6vT0bwO9onhY8E9JKJLSloh7DRArwFJpHzFDkfZaLIJUhRlSmfgvRbaONgHbPXnRvidDR2YcpvqHhaAVaCz2LBFv+lHS4a/npFNljiXjBMZ2xDiFS1E8MKq8rjLxLbjLe0haiV8qqQuofxaa6gjTXtbRHg8jdtlmT9L9li+NEfP7DpH0uA85rp2jRwvlO/jLhpZxyId3v4rQZ+H9WtbnotVaM10pmqMapQOvHO25vvzr7mCiDradp4oTQmf1OZIVdCf1siFZ3DsDdz2So9JFGmu+txeE42zBDXvWUorD37vBz6onw2o0BMrs+JEdeEGj07PGx1g8l6Kl6gbQLnCS++z2E5OhkS+Zq5BjG7LAgRhINLd2inaS6Ab87uzOt4MDDxIyVUYumOTAhY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(4143699003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzRoQTNEMXlxcXU5V0x3dVI4eHFscWhjVmpnK2tMNEgzUytnNHExUjh3NWhY?=
 =?utf-8?B?ZVFMUm5vNzZMTGkyajB3V3BWNlBySU1GaCtsZkpYdTdqc1lVWEk0WmFSSnA4?=
 =?utf-8?B?WWU5cXVrTy9uRUZROVVDZ3BDdlBxam85U0JIdGJKQVdIWG5FdEliNXNKUmdT?=
 =?utf-8?B?WllOOEZTWmZsd1o0RXowNWJuRENRdEFDMVhCQ09DVk9idkE1ZWdLT2dlU0Rk?=
 =?utf-8?B?aDFKbUYwTGdraXliT3BEQ3NKS0trUWZDMXRZcmNEVlZrSU5za0xVZTBUeEcy?=
 =?utf-8?B?Z2pzWjJHWU1aV1pTbnh0NjFUSHVVQTZjUEU5dytJYzMwNFI4eXA3Z01TYklJ?=
 =?utf-8?B?cmhiMGY3VGpNY0lCTi91eDJydkFpOEpaLzRNdS81amtZQzU2TnhUbGs3ZXRJ?=
 =?utf-8?B?MDRkMHQ4R2xEWC9wY3RqUVVxYWJsN3JNdjAxNHZWVnpOTmo5Tnl2OFIvTElr?=
 =?utf-8?B?cCtKSHYrUVhMZ2V4SDJ4NjZMZWZGWXFyTXA2WExPdWROVFI5MUtjbXlyTzRH?=
 =?utf-8?B?Y0Npays1eUM0YVZNaWJEaGF1VW4yajk4dk9UQlJjQXNNV0owNUhDc1QrYmV4?=
 =?utf-8?B?R1V4T1lGM0lEME9VYUVFUERYSUZLZXpEdjJBdm04bzdjTTJtbGh5OXBPQUIx?=
 =?utf-8?B?TjREYmRsVzZBaDVJeDEybEtHaXZJUndtaExHNnBjcG5zLzNGdzJXTjZlaUNV?=
 =?utf-8?B?QWU1SlgycTJOM3RjT3RaSVBCTHIyclFmVktzQU5NWVJpTVFhbWE0c1BjSlM5?=
 =?utf-8?B?QXlxcWQ1djg2ZkhHSEpyODdoSFlQN0NxSm43NmpOYmd1NzJYaytsbGVCMTl0?=
 =?utf-8?B?SlMzWjQxR3B4RDBuSjR2VllJemZyZlFJZVREZlhlWEpZTEZpTis4cHVRak1E?=
 =?utf-8?B?YjNWUExiQnMxYlFWUGwwSlVyaEFCeXZzVURjNTNJbTJkZTgwNFg4VnRuZ1ps?=
 =?utf-8?B?Rk1jQy9IOEpuSGQ1OWIzU2tnaHZ0OFZmZnpFaDBqUnhkRHBCM28vNndMUmRR?=
 =?utf-8?B?a1J1OW53UVBTdnZQOUdVMWVlMHlSTWFrMjRaYnpIMmJ1UkFtMVhPbzlhQ0Ri?=
 =?utf-8?B?NCtzMS82S096eFl1OVY1NmtBUDRCM0NnYUFSYWw5UXhGek93U1NTaGFxNXdB?=
 =?utf-8?B?akd2ZG9yZ1FkSHYzSENvbXgxSGdyWGZ5aVJ2TkNyRWJ5cGNVRFpzckVQZlN3?=
 =?utf-8?B?QXYxUUlNZW56dWltZy82cmZEVVpoUFpxd3JTeURxTG5lVzF0R0VtajNIcDBk?=
 =?utf-8?B?YWtPKzMxWkk2eXRKMG1oTEhXNlF2dzlNL3NVNm9UOXMvanllb2xSVXlHMmF5?=
 =?utf-8?B?amhMQktwSzM4VTBYUVl2dm1mTGh4SlovQ0w1ZWtqc2tMMHBLSlQ3OFdDcGVo?=
 =?utf-8?B?a2dsV2ZxMlZpNDhkd0tvZG9YZUR3NDVtR01mTHJIUkd1ekRhazBSbTNnQ3ZY?=
 =?utf-8?B?WXU5cjJidUhJOXBJNExObGN6TzQrQjVwRDRJRnF0cExuTU9nOW1SNHJZczY5?=
 =?utf-8?B?WUFITEgweUhQQ0ZSWWxoSW1Eblk4bUZwM1NDdmhla0JacnZYM2lvVmQ1NmlI?=
 =?utf-8?B?SEpsbnAwdkFTOWcvbkZsWFg2NmEwTUZ1MHZja0xvNVBnN2NhUWx1UlRZRTB5?=
 =?utf-8?B?ZWZLL091UHhpK2ZXR3JYUTZjTkNWUHNKdHBKV2UwN3N1TDB4a2Zsc0Y2Ky9E?=
 =?utf-8?B?UDZNem5LVDI1M25rQnpZdGVhSnZ5SWJ3clZNaTdEN3hnblUzYTlaSjNGNWx6?=
 =?utf-8?B?TTBrK0ZlWWVIZlVvOVBjVUtXR3FHaTk0bjlFUjNPajlpbHZxMkJzdnBXWnVw?=
 =?utf-8?B?ZjdUZDdJT1JNSExkdnFqNjFQRHMrZ3NWcUlXdFhmbVJSOHJjNy8wNDNwN2ZM?=
 =?utf-8?B?Tk5mVytyTkpZTm1sdzhYbW1yRkVMTzk2L1dNSVVqYTRZclIrNlNRR1pMaGpn?=
 =?utf-8?B?Y3ozUThSRWlXWHhRSkE2TjBhOVR4TmNVaHM5ZHZCa3ZSRXUyYzA2UkFMYmpm?=
 =?utf-8?B?U0ZobklQMUVkTWJONWlWS2YwaWhrTitMamlpazBxV3REY2ZhQXdrZmE1TUdJ?=
 =?utf-8?B?K0ZZckxLbWNjNGFSallEV2lhRW0zamJVWlArYXJmRDd2RnJYSG9WRkhDVmZ2?=
 =?utf-8?B?TGU1UitVV3d2SVd6SU9BWTBmQXpZMGNOQUF3R05jVW8ydmYyQVMwYUVqSm9I?=
 =?utf-8?B?YnU5Zmh0Tlo1Lzk5S1BmeXRITjRtR1BxUG9Zdk9Wd3h0c1dlYzU2Q243Ymtq?=
 =?utf-8?B?aTBuTjE4Y0FMWGJCREFJOU9sczFJZlN0VjJwUGJBczk1YVNvVHNFMld5OVJ3?=
 =?utf-8?B?TnhWUmZvR1ZxckRPcGg4T0w1TXZRN0VoMjREek1zeTQ2ZURZY3ZZajRNT3p3?=
 =?utf-8?Q?woYiuYZ3WEhTdtDw=3D?=
X-Exchange-RoutingPolicyChecked: RPFqmfmkxPJWXhUbptOTaaX9xg3j0ryvyl8ibEPECpjXK7A9mRDLNQK6d6wqNboxmW0DOcREKyNaHKzGuhwU1QURRoipJ28FgaLNr56gR7mYne7FUjeEb1iND+eFfVa7oUoqKiRjzjlNl06Puqf0EQMza6FeN26fwKNh36wE9kLmH3H6OxuXqoXGCaJj0YiDLhXGTKbX0YmYqGoe7y1Oo/aUZuD/u69bd5A3lMDvYT+O1tFBUwhTUBzXMnqwBWrRO+2+vbnHFIpZdICa+24JRT4NbKNSymc4WjTNIs+IF4I+s3yHoL4aGRxp8zz+xDGmcnLfJ/gTJAnhghL8THnf6w==
X-MS-Exchange-CrossTenant-Network-Message-Id: ab97850b-8ef5-46f9-e375-08deff0a1d79
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 22:26:44.5056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3+bi4SDouH7EG+MrdylxqM/Mi01JqfmrZlP5KGEdCaJ3xMMc3Anhc5Zhv7aWTAtLrjR16bnL8aIe2AIf/JQ7nh6mESM5mdMTNpzJrJKGRBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB185510
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



On 8/20/2026 12:16 PM, Mallesh Koujalagi wrote:
> Make sysctrl_wait_bit_set() return an error code rather than a bool.
> and update callers to use xe_log_err() with the propagated error code.
> 
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

with nits below fixed,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> index ef847f0a8f2c..3523651b467b 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -42,15 +42,11 @@ static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
>  				 timeout_ms * 1000, NULL, false);
>  }
>  
> -static bool sysctrl_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
> -				 unsigned int timeout_ms)
> +static int sysctrl_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
> +				unsigned int timeout_ms)
>  {
> -	int ret;
> -
> -	ret = xe_mmio_wait32(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
> +	return xe_mmio_wait32(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
>  			     timeout_ms * 1000, NULL, false);

is this correctly aligned?

> -
> -	return ret == 0;
>  }
>  
>  static int sysctrl_write_frame(struct xe_sysctrl *sc, const void *frame,
> @@ -193,9 +189,10 @@ static int sysctrl_process_frame(struct xe_sysctrl *sc, void *out,
>  	struct xe_device *xe = sc_to_xe(sc);
>  	int ret;
>  
> -	if (!sysctrl_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
> -		xe_err(xe, "sysctrl: Response frame timeout\n");
> -		return -ETIMEDOUT;
> +	ret = sysctrl_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms);
> +	if (ret) {
> +		xe_log_err(xe, SYSCTRL, ret,  "Response frame timeout\n");
                                            ^^
double space

> +		return ret;
>  	}
>  
>  	ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);

