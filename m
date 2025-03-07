Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4FEC19F32
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 17:41:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6BD10EC0D;
	Fri,  7 Mar 2025 17:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TkeG0j2a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77CB10EC0D
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 17:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741369266; x=1772905266;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+S4ZI1vj64XhnUoRwacacAZmnluCJhVMB8CFj//TqEA=;
 b=TkeG0j2aQaSVtKL+htthGWF/I9a6RmlsrPeRI3ltuVJMB/2CV9MocvRO
 rsZhJGR32hsjP9mrQHsdDWA00rzACvBlmGRzs0RqczpqQ0YhwCf3pDEi3
 VxZydeceEGE4Dlkszd/g4rwj4JiilFWMimEE13EhTRJgw5tjyVtp/wnw3
 e9Y9SGK71GEJb1lhFB3Mc/y5sFZk7DLCfuAppF/duMErNX3e7TqWs6Jlr
 gP3PAosjHS70vpc5IBXqyBFY/V5TNZIANwZ1rury4gTiIcMFOFThcMkoj
 NgjS3DBqxQhi5b1J/YHvj8fSZtmXO4GU0SklFHvG1V5whS1SXCGCc0x2B w==;
X-CSE-ConnectionGUID: 6fS4yDUYTRKaDHBBHTnjCQ==
X-CSE-MsgGUID: ZcmMBhzKQeGayH2YrLbzmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53067268"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="53067268"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 09:40:41 -0800
X-CSE-ConnectionGUID: KjG3dsMoTHWPzH+LD3Kxvg==
X-CSE-MsgGUID: dov1aaAXTxiinVeBgLw75Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="124304842"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 09:40:41 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 7 Mar 2025 09:40:40 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 7 Mar 2025 09:40:40 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 09:40:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WacGooy8e11y5qEkCL6OU7yPzsqAkCdK0kyzYfWuv10dwhkpddKbvYqjvAYpi7xj5HiUXv+LJB6TXrheeWd0JliUViOobPxrIH0heRvGiJkRoqrjxzke+HdndZsGxGnXdZxhtw88OE+Oc9pwtrngKpCwmyqIlAuuMXdomnaI+cC91XR5C7KDPv3EVQSsGeYCRZuBLkNh1Wios46DngXvaVM/hMwPRy1v+/qU59uBXOCHauAF4o5fke2W3Ps2DLdHZPl6qRzxxpiiNK9bMSv7DIQz0eSOEIibwPZx9CPkWYVVNgy1DDCbQTK+vTMoIOKQT3Xz0IF0qmQiiQfTGc3lCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcm/3Ana5mXxzHB1p8p9iyWGlit2nS/R263va47xa9E=;
 b=EyttZnfEPXM8xAGhRXt8Me2tXwPYwGhXsY6QLg9oJH0VYKA9rFX0kq2ZF5T4alve+IH79+wbNlbDjA9CECGsrjX0QFuBpyMosk/LGhAGCetSJBkgeJ9/PH5IbcZkVcx7ktKnM3yrfSctWNEijodF8D4ubEmB1PVzMfT6DCIljU/xFZtzyRVntXfDqojrDxqHvPxIKWm3uoUzIX6pT5fg/GUVFKuTnMLSN08q3S/XwpjLCSNfXE9fHi1MgyQIpOA6aowcjov7lYOE5gB2BdwidLVa9LmIXD+O/5xMuDPBQQuNWVdNqywckzY6ltLoNpNsTddmFndZ2X7jfaA32Ocwyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH0PR11MB5782.namprd11.prod.outlook.com (2603:10b6:510:147::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Fri, 7 Mar
 2025 17:40:37 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8511.020; Fri, 7 Mar 2025
 17:40:37 +0000
Message-ID: <be845e6f-10d1-4bf3-b7cd-332b2556b6c1@intel.com>
Date: Fri, 7 Mar 2025 09:40:37 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Apply Wa_16023105232
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250306231122.3897413-1-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250306231122.3897413-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0099.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::14) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH0PR11MB5782:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fff5ce8-94aa-4380-3b4a-08dd5d9f2b9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a3BBZkwxZ3EvK2JwQVJZUk9acW1OSVdvb3BuQUphUVZ3MmFhT0NsWTkxQ0Fq?=
 =?utf-8?B?Uk9BQzNXMVJBaXd6dEpLby9HTmhrV1lVMjZpVzN6RWwzVllUaGNjM3Z1bFFC?=
 =?utf-8?B?QnFPYnpBV2lkZjR5NHFEcnVDQ1lUaHFjaElSUkV2eHk0YTZiakpmb1pvYnRx?=
 =?utf-8?B?VkdBb3RJc01qanFTdFpnMFVySmtxWTRDdW1LckZDL1pmQVcxeHlzZmtEUGkr?=
 =?utf-8?B?SWMra2FhajN0TW1MQzJTaVBqT3c2V1JQT2ZPMmVBcU1UOEZOVHpVZm5ucElK?=
 =?utf-8?B?TjdHNCsrYVlkUW9QWHpzQ3Nwb0hpOGtLbHNVWUhzb2M3eFE0cmRXTEliYWpR?=
 =?utf-8?B?eWtsQVIzcDhBRVVybFF6Mi9Fb1lxQXZmWkZGUmw3U2hlQ1A1M1YxeWlMSUZx?=
 =?utf-8?B?U3ptZU1icTh2T1JnR2hxV0Z2UFhzTElWQW5PR0JGZ0dFTTgzTUVWU2JTd0cv?=
 =?utf-8?B?R2tjd0RWdkthMFRZS016azVpNTBwSGwvUWxuTU5tMnhBQU5HdWljamUrV2oy?=
 =?utf-8?B?M3h5elFBRUd0aDZWNlV2T1VqS1I4Si84M2J0b21icVloWFpEK0owcUc2UVpT?=
 =?utf-8?B?azBBd0tFVnB6K2QvV2JqbVBodnRlMExGN1VPa2xzVXJUNlFuNUg1RUw2ZDFQ?=
 =?utf-8?B?SXh2cWZGdkxhcjRrUlhsdWZrVzJpV2d4akdFdzBhNjJtcjhxRCt3NGpNV1du?=
 =?utf-8?B?SE0wbUJJNlhkYjlkb3ZGUWRXU1B0djgvOUFNcUErR0gvTHZXY1NBM0RXOXJi?=
 =?utf-8?B?eGtkYllzU2dndk13cVhqbFBmc1RHbk1uSzhWcFJsWW9XL2VnejZGdDJkcEJN?=
 =?utf-8?B?Q0hyQ0w2M0NSMEN4VjVCMElnQWxWQUpwUTBvd3pWZlpkUFVQNUJpY1V1NEFx?=
 =?utf-8?B?d3FMN0QrbGVtdFh3Snd1QU1lR2lPN3liU1lzMjBxUCtIWHRqdlFsY0hwakVN?=
 =?utf-8?B?T2ppUm1RUVl1Z3ZJVWU2dkRJa1owZ2E1Z3ppOFlGNkF4KzIrNlNvZ0hPZVBN?=
 =?utf-8?B?V2UxQjVLYTBVdkxDTDJtRjhIUGEvSVR3TXQvM3lnakVIR1lFRldraWorNmty?=
 =?utf-8?B?M0loWDZCV0grSTZ1eXdIZ2pvUVBEaUI3RVJRMWlhTVhaR2xEc3lVMEJKbk5W?=
 =?utf-8?B?VUdoUTRsVGRMeWNXVGxBVnhpOGRzM1VRSXdkOWp3enFjaHpxSURKdnRzcEtx?=
 =?utf-8?B?V2pNTnM4bUlGYjlKanRCNUlxRGxZU2gxclRxU1ROc3FWSzc3c1NNSmpDcSs3?=
 =?utf-8?B?M2YzTnc3a1BqUHVLSStTaTdlUVorRGNESUZCYjFWSGRBcHZGTEExVzF1L3Jo?=
 =?utf-8?B?OWY5My9GYVZUZXFFSDNNNTlVZFhCM2hpTDNKaTNqT0FBSmtsbFBzWTNXOEMy?=
 =?utf-8?B?eFYvOGtDTzU1VXA2czFPQU14MkxFVk54VVhNTDZUWklsRHVyN2JSRVBya2Ro?=
 =?utf-8?B?M0U0VUcrQmJrYnJkOTRQTVYvVURQMmFML1gyVTJ2cXNhdTNkQ055RHdxaFJ1?=
 =?utf-8?B?Mlp4dGYrWUhVTFQwSnhrd1BXelhBREhoMDdiUG5neWtHdGVaYTlQOUlseUhn?=
 =?utf-8?B?Zk1taStjaGdXWFI4aE1WS28xR05OcEJlZThYaUVBQ0VSb2JmWmliOFJXR2Jv?=
 =?utf-8?B?eXl2aU8rVFhIRDNUZFBXMzNJTWlJaFhzWUEvMFJwdEJLRTd1dERlem92Q2Nn?=
 =?utf-8?B?c1V4RzVzaE9GR0JOTFdaeVhMeG5sWUdkeUNsbWRkemJ4L1YvOWs4cUZTVk9J?=
 =?utf-8?B?TEg5SkJPUFVJRm1oK2FRL0h2ckFWeU9Bc3plWFlwQ0dOUUE1N0k5Wkk4ZERW?=
 =?utf-8?B?THN5cVBxeVRSMndFalBvVGFJNmZST01NeXM2OGRUeXQyZ25nMlhLZmlQeUQr?=
 =?utf-8?Q?6lCcfZUDiAFUL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzZNN3hNQlV3TDZzOVNJYXhJNkJ2QmF0bTAxUVVhSE9VbGFwRm13S3lpYmRM?=
 =?utf-8?B?cG56Z3krd05UeTRZUWRocmxESkZnZER0VU1OenZuYTVwcWtYdytvSENNb2xU?=
 =?utf-8?B?TXNESTJXUTlxWDNoVTZmZGFLWXJoZWsyRmhWNnJnSklNTkxieFd4QlNobUUy?=
 =?utf-8?B?SU1UUkZON1hBYkZ4cDhUZFFicFRWb0FrR0c0VzhlN2w3V2lRWHc5RjRmWFV1?=
 =?utf-8?B?bHVUMnQ0U3pWclRITnhPaUlob0tBVlVPREh1Rm9hRGIvZ3lWNVIrQTVjWnNn?=
 =?utf-8?B?NXNEeWpqcHB5dnc4RGo3NVQ4UHFQMFhYYUttYmlJVjNJaHlMZmxDTmVSUGFy?=
 =?utf-8?B?NitrMkRIMFdWeEcxQ3FlZUdKc1BHWU11MTdrdWoyRVA4cVBNak5RWTlIVlVa?=
 =?utf-8?B?WWZTdmZsTTAzMzJESmxVM1NJT1VUSWRwaW5lMGdWa3IvRjBiUkxIbGlKZGZy?=
 =?utf-8?B?a1hlMTlvKzUwblA2VFNlbG9WY1ZqNVhMc21mVXhzTk41cTF2Z0l0MVZwTmhn?=
 =?utf-8?B?QW1hTHRVNDBLeGZYank5SGJrdi93bnJ4N3ZGSG9zcUZtVC9jdTR6bG9weHF5?=
 =?utf-8?B?NjNyQmVzZG95YWJnNXFrcHVMTU95R25vaWs3ZU1tSFhDMk1CeVlxS3Iyc2V0?=
 =?utf-8?B?OUtNbk5lUjZrQWxpTm5Ndmk0VGVmZllZMlFkZnJ4dVdsaTFiTFd1STlKaDAy?=
 =?utf-8?B?QllmbEJPTXk0ZG5VQU1zMm9IaUxac2dCSVVTZXFKR3NZVUxJa05lYzVSNS9T?=
 =?utf-8?B?QWRlUkxEQUgvVW8yUStTUGozOWlNaWVlOVBiWll5bzVIdUlXYUppMVJkbEJG?=
 =?utf-8?B?U3RybjlOSjJ1ckUwS3puNUxmTW9vNUxDWXE1aUFpZTBIR1B0VkxtUm9HM25G?=
 =?utf-8?B?RDB5QTliOXZ1YW1tbWxWTU1xRTh5ckJwVDM2d0FNZm8rT0V3RjhuZHVXb29N?=
 =?utf-8?B?RW16Z2RwOUlJQWd1TGM3QjVYWlpFNjZHa1RkaWdjR2hidWY5VXNpa2R2TDdM?=
 =?utf-8?B?cmlla1lxTUprclUrV1RnQnMreFRjQlNZK0REWFpqV2E3eUx3c3gzYW1Fb1Bu?=
 =?utf-8?B?MUt1aUh1MEh3QzE4OHV1QlNNQmt4d3dobWl6MlhRSURKRFVhVlVtaEFJcUo1?=
 =?utf-8?B?UFc0NjE1bHlsWmY4VHEyS0psUHdDc2xGS2kyUDBodVNhL3FBSlhkWGNsRmhx?=
 =?utf-8?B?R1ZMaVhmbllTTzM5SkwreWVObTdOZU1aTWZIQXhmOFhmeURPOFR6dStwN01z?=
 =?utf-8?B?Y1oydWJ4Y2RKbHVHRmw4V1RzNytHR3oyTnNuNzdha2pvd09DM3U5OFdZMUUy?=
 =?utf-8?B?MjM4eGFZbFgwV3Vkamg5SnZ0VEUxQytTTVJRV3loYlhDbkh4aWFaenhlUFUx?=
 =?utf-8?B?UTNVclJJUU5hQUZRaXlBTFc5UHA2QTczMUpnV21OM2tYWDhjT09rSzY5OUlE?=
 =?utf-8?B?ekJQSk1EK3ZHcWZFelpXeWVDV3JocUdUZjJlOC9GZkluVW5GbkxDN2ZLeWJD?=
 =?utf-8?B?T3RwZ0RvSDFUU21TVmRXQUNEWGZFRXJDUE5uVEFCTjlRNzE1RjVFbHBCTG8z?=
 =?utf-8?B?UWZiZmFtNlRPcmtvK3B0cVZBSE4ycGd4RFA5TDVRekkybDNJQlhtMVV6bE1k?=
 =?utf-8?B?amFBSStWci9MSFY3NmNLTXl5cFRWbTd1ZXAvcUhpam9BdFlpWEwxSGNqeVZv?=
 =?utf-8?B?WllRMXU2S1UzNEhNSzhVeFlqcFRMdkVJY1c2YVlUWW9UK3F3WUVCYjhZV3hR?=
 =?utf-8?B?ckEvcEtTcW1xay9lQnUxZWlYQXJzQ256andvKzJ4Rm9jUGhYbzRDQVJqQUIv?=
 =?utf-8?B?QUI3NHFNUk83bXBhMnFBNWdlK1VvM2F4ZGNFL1VVaG1RMmJTMjFBT0tvMlNa?=
 =?utf-8?B?eitlcDhML2wrNEFkakNnUTRaWmZHMllkQ3l5TTZLQU9UZVZoLzdLSC80bUVo?=
 =?utf-8?B?V052WjFaR0tjV2s4ajV0Rkd2YkZZN2FjT2RHdHhuU3V6SUloK0FrTzgxYlhh?=
 =?utf-8?B?NEJMaHpzU05lR2dhVUJOS254SFIwWjFOaFdKbG15RHQ4bjIyejFmS2UwWS92?=
 =?utf-8?B?Qi9oanBzMTBUTHc5ZlJWeGQxdCtLTUhOZUIrdDFBUms5QWN4NmNGM2NGMkxt?=
 =?utf-8?B?WXpXbGg3QkRNMVcwVEQ2L080SUp2Vlg0M3BnSzVCOVVtT1kyZGRnMVNpS0dT?=
 =?utf-8?Q?B1pU7BCxg+DzssQ5Mu/9/CY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fff5ce8-94aa-4380-3b4a-08dd5d9f2b9b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 17:40:37.0730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QBI33N8/qQMNyY+xJdCpI6Et4DP5DKp3g/VyzYX7AA3ZJqYFaR3sIyWKYQM9WA61bugeWD55svCQL8BpTbzCCXak0HCJhgyo20yL0UN3/Ek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5782
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



On 3/6/2025 3:11 PM, Vinay Belgaumkar wrote:
> The WA requires KMD to disable DOP clock gating during a semaphore
> wait and also ensure that idle delay for every CS is lower than the
> idle wait time in the PWRCTX_MAXCNT register. Default values for these
> registers already comply with this restriction.
>
> v2: Store timestamp_base in gt info and other comments (Daniele)
>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/xe/regs/xe_engine_regs.h |  2 ++
>   drivers/gpu/drm/xe/xe_gt_clock.c         | 38 +++++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_gt_types.h         |  2 ++
>   drivers/gpu/drm/xe/xe_hw_engine.c        | 30 +++++++++++++++++++
>   drivers/gpu/drm/xe/xe_wa_oob.rules       |  2 ++
>   5 files changed, 70 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 4f372dc2cb89..067468c62adb 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -130,6 +130,8 @@
>   #define RING_EXECLIST_STATUS_LO(base)		XE_REG((base) + 0x234)
>   #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) + 0x234 + 4)
>   
> +#define RING_IDLEDLY(base)			XE_REG((base) + 0x23C)
> +
>   #define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244, XE_REG_OPTION_MASKED)
>   #define	  CTX_CTRL_PXP_ENABLE			REG_BIT(10)
>   #define	  CTX_CTRL_OAC_CONTEXT_ENABLE		REG_BIT(8)
> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
> index 2a958c92d8ea..0394292e777e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_clock.c
> +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
> @@ -16,12 +16,13 @@
>   #include "xe_macros.h"
>   #include "xe_mmio.h"
>   
> +#define f19_2_mhz	19200000
> +#define f24_mhz		24000000
> +#define f25_mhz		25000000
> +#define f38_4_mhz	38400000
> +
>   static u32 get_crystal_clock_freq(u32 rpm_config_reg)
>   {
> -	const u32 f19_2_mhz = 19200000;
> -	const u32 f24_mhz = 24000000;
> -	const u32 f25_mhz = 25000000;
> -	const u32 f38_4_mhz = 38400000;
>   	u32 crystal_clock = REG_FIELD_GET(RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK,
>   					  rpm_config_reg);
>   
> @@ -40,10 +41,37 @@ static u32 get_crystal_clock_freq(u32 rpm_config_reg)
>   	}
>   }
>   
> +/**
> + * xe_gt_timestamp_base - Return the GT timestamp base
> + *
> + * @crystal_clock_freq: clock freq from 0xd00 register
> + * Returns: rounded down time in nsec
> + */
> +static u32 xe_gt_timestamp_base(u32 crystal_clock_freq)
> +{
> +	const u32 ts_base_83 = 83333;
> +	const u32 ts_base_52 = 52083;
> +	const u32 ts_base_80 = 80000;
> +
> +	switch (crystal_clock_freq) {
> +	case f24_mhz:
> +		return DIV_ROUND_CLOSEST(ts_base_83, 1000);
> +	case f19_2_mhz:
> +	case f38_4_mhz:
> +		return DIV_ROUND_CLOSEST(ts_base_52, 1000);
> +	case f25_mhz:
> +		return DIV_ROUND_CLOSEST(ts_base_80, 1000);
> +	default:
> +		XE_WARN_ON("NOT_POSSIBLE");
> +		return 0;
> +	}
> +}
> +
>   int xe_gt_clock_init(struct xe_gt *gt)
>   {
>   	u32 c0 = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
>   	u32 freq = 0;
> +	u32 timestamp_base = 0;
>   
>   	/*
>   	 * CTC_MODE[0] = 1 is definitely not supported for Xe2 and later
> @@ -59,6 +87,7 @@ int xe_gt_clock_init(struct xe_gt *gt)
>   		xe_gt_warn(gt, "CTC_MODE[0] is set; this is unexpected and undocumented\n");
>   
>   	freq = get_crystal_clock_freq(c0);
> +	timestamp_base = xe_gt_timestamp_base(freq);
>   
>   	/*
>   	 * Now figure out how the command stream's timestamp
> @@ -68,6 +97,7 @@ int xe_gt_clock_init(struct xe_gt *gt)
>   	freq >>= 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, c0);
>   
>   	gt->info.reference_clock = freq;
> +	gt->info.timestamp_base = timestamp_base;
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index e3cfb026ac88..7def0959da35 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -121,6 +121,8 @@ struct xe_gt {
>   		enum xe_gt_type type;
>   		/** @info.reference_clock: clock frequency */
>   		u32 reference_clock;
> +		/** @info.timestamp_base: GT timestamp base */
> +		u32 timestamp_base;
>   		/**
>   		 * @info.engine_mask: mask of engines present on GT. Some of
>   		 * them may be reserved in runtime and not available for user.
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index fc447751fe78..870f2a1efb76 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -8,7 +8,9 @@
>   #include <linux/nospec.h>
>   
>   #include <drm/drm_managed.h>
> +#include <drm/drm_print.h>
>   #include <uapi/drm/xe_drm.h>
> +#include <generated/xe_wa_oob.h>
>   
>   #include "regs/xe_engine_regs.h"
>   #include "regs/xe_gt_regs.h"
> @@ -21,6 +23,7 @@
>   #include "xe_gsc.h"
>   #include "xe_gt.h"
>   #include "xe_gt_ccs_mode.h"
> +#include "xe_gt_clock.h"
>   #include "xe_gt_printk.h"
>   #include "xe_gt_mcr.h"
>   #include "xe_gt_topology.h"
> @@ -459,6 +462,12 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
>   		  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0), CS_PRIORITY_MEM_READ,
>   				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>   		},
> +		{ XE_RTP_NAME("Disable DOP clk gating"),
> +		  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 3000), OR,
> +			       GRAPHICS_VERSION_RANGE(2001, 3001)),
> +		  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(0), RC_SEMA_IDLE_MSG_DISABLE,
> +				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> +		},
>   		{}
>   	};
>   
> @@ -566,6 +575,24 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>   	xe_reg_whitelist_process_engine(hwe);
>   }
>   
> +static void check_wa_16023105232(struct xe_gt *gt, struct xe_hw_engine *hwe)
> +{
> +	u32 idledly, maxcnt;
> +	u32 idledly_units_ns = 8 * gt->info.timestamp_base;
> +	u32 maxcnt_units_ns = 640;
> +
> +	if (XE_WA(gt, 16023105232)) {
> +		idledly = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
> +		maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
> +
> +		if (drm_WARN_ON(&gt_to_xe(gt)->drm,
> +				(idledly * idledly_units_ns) >= (maxcnt * maxcnt_units_ns))) {
> +			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base),
> +					((maxcnt - 1) * maxcnt_units_ns) / idledly_units_ns);
> +		}
> +	}
> +}
> +
>   static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>   			  enum xe_hw_engine_id id)
>   {
> @@ -606,6 +633,9 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>   	if (xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY)
>   		gt->usm.reserved_bcs_instance = hwe->instance;
>   
> +	/* Ensure IDLEDLY is lower than MAXCNT */
> +	check_wa_16023105232(gt, hwe);
> +
>   	return devm_add_action_or_reset(xe->drm.dev, hw_engine_fini, hwe);
>   
>   err_hwsp:
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index e0c5fa460487..0c738af24f7c 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -53,3 +53,5 @@ no_media_l3	MEDIA_VERSION(3000)
>   		GRAPHICS_VERSION_RANGE(1270, 1274)
>   1508761755	GRAPHICS_VERSION(1255)
>   		GRAPHICS_VERSION(1260), GRAPHICS_STEP(A0, B0)
> +16023105232	GRAPHICS_VERSION_RANGE(2001, 3001)
> +		MEDIA_VERSION_RANGE(1301, 3000)

