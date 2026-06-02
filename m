Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69447CD5BD1
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jun 2026 13:45:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E40A10F13C;
	Tue,  2 Jun 2026 13:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f4NtHBvE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7E810F13C
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jun 2026 13:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780407954; x=1811943954;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=YXsis7LXIWUfsEki6UGvp4xbD5CeNAKkz8S/gsfOpzw=;
 b=f4NtHBvEygeWRUJn9jI9Rxt3FTJydFTggu3jy2btQzgeyUfg7MMqo+oU
 sel9E9ilCE+KnMdwEzqKsFfQkUyYtltNa+vuSf5WGtHusgs6woW9+53F4
 os3vbUoFAM3li9QG8/eEExa+k0foN2zy9G+HcBIgJlr3BJOwVKChlnRb2
 C5fX+H07KwkopC4HisqNwSW+/OAQ0Z3ZcYNHcjiVl0gj6gyWr8HFSSaxl
 72G4ZkugcHyN0qzvlBdeGeb9vt6RmKHI8dH5UBAHB+sMHi/zGuSOhfQsb
 XcBv0sFD3uZemBTKG4X/nteKkd+NCfng/MIcYiTwN0CoDAUU7patIaVGm A==;
X-CSE-ConnectionGUID: Eas5FiZJTKKxTpcKuegvQg==
X-CSE-MsgGUID: wXpPDv9/RoWa3NKwwotsAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92303744"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="92303744"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 06:45:53 -0700
X-CSE-ConnectionGUID: ZjjVaOtBT8eUQHH3XvbGeQ==
X-CSE-MsgGUID: elVeIXP9SJKefvWoseAwgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="242885079"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 06:45:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 06:45:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 2 Jun 2026 06:45:52 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.24) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 06:45:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xehy9dYYWkZgT4q54af6EpDI32s6oTw0DVj81YxBYB0YxypHfwApUJb2Nr/0xTqBT5PLHfXlIOcAWI2XalpfkmNOovvHhdWPa5ZE4p6sy1X9C4E1ygHDiACcpl4ytQKciUlt+0L+0QFkL0kuT4Q6olxwkzFwnfu2LnVVIFCMBi0GOSnUGM/0AVxoo/D4TPiQb/KpndLfPSJQ/rUxYxFt6mlLLv9kCBauwOoo1+bchofRTofoiBTyWtoJtUdUlWjc8D0P5RHM5R0pRd445iF4BJGq0zh4lv6Rlsn6Y41RLEPUWUpKDiUzo9yifU494LCuyMIPT3cFn1FhDB4MMa0s7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5LIPL2fIPgHOXFOpXSigqWRbapWkzAJW1sYgbvMqx0=;
 b=psOijoEoGCchdqhNQbyaExCeE8uhaKauFpgmfePdeOuKQT/vp3gv0/X7bAcydLHSMo+kHLYSaBlNjWznN1dMXka73AgZdkKqpdBs838o+E/1m+prvSyGyuQl9bV7zEJRz6+imCMWi4EZnQvk7LBLyFdTOnN7kmJj7KdXrSEXLQq5JC0+MiUPXAodciI5CIRDcfN5sZQ0YppJ03eIW0EwON9LYPZSI6J06lf3yulQoI6Dcc3aTfk/mkJ+ilkK0V6t6Uzp/0bgFpN8odo+3ImMK7/sS1MspY3HPOcRmhuV/TR219WQN9y/IeTWbpnom4QCfL7fal3shMXVJm0sb7LbfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA1PR11MB9804.namprd11.prod.outlook.com (2603:10b6:806:4d7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 13:45:44 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 13:45:44 +0000
Message-ID: <058112cd-cad3-4cf2-b810-c85308d3a0d2@intel.com>
Date: Tue, 2 Jun 2026 15:45:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/xe/guc: Reduce GuC log size from 8MB to 2MB
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260511194924.2016315-1-zhanjun.dong@intel.com>
 <20260511194924.2016315-4-zhanjun.dong@intel.com>
 <cf526083-efe8-4e99-98a2-7c35206c9d74@intel.com>
 <66dafe9c-fb46-445d-b8ed-f5e9075294c5@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <66dafe9c-fb46-445d-b8ed-f5e9075294c5@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::20) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA1PR11MB9804:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b499bb6-b8fb-4bc7-3cd9-08dec0ad3e73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|3023799007|18002099003|4143699003|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: XbmN6stCqnL81aO+yaExIVLSi3NbbBZW4tNOP1pqeiQF2PQXwF1J38254WxnLmJ3W0NcHhYS2JHORjYH31qDiBrGQoZnozgoUpz4WVmD2ObdBPk7u6RY2IWYFAuoeKoVySuUHMdRl9tIrlmSAd7hTs8TXL9py8AghfTFV25qN/A6zJWrTRRDDRKs1qjyVr+UDxqL2sEOxgpl300xNfV5LLtMJ/U/m63p6UeeHCf7VOZjyRkJ1a8xKjyvRfPDvcVq0pnC/0i+Izg+8sDNUwY0EilJrvXrq4ltSURMx/gQwn6+PTWjxMiIIhkcBNlIfMbEFS1W3NplcdHupBhTfppsxdtwBzQ5BaltZF2lBlTVwWZSXIZz1+HboUhobqaaRD6upyI74+Jx9YM9DEm3QJkN+FDPF5k7f0E9wTgXIILBQLvaJBd9/Wf+AFnvwy2ryr1o5vyL/iBkOFgt/LlEDw8BD4sluf5OqFQM+Pz2fnO7tTPC+1Lks4LMy6YvD55xY6Rjrg6bGizpFubTcwFuyAk7TT9c21wXDcWuimc8+mfTyVyvoHOQkpwuPY9BYomwbl6jgV8G4WIhO6ENpfq8/3cZ1G8iw0CsbZCon9CHuPvJUGYEoiMBTULU9O7WYKSL+gGTH4iNmMbEnloGf/UsmwYk6f0bbM1UcCoWEhZl0kesIeWO4nU4t6tRjdKZYMiiKUh5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(3023799007)(18002099003)(4143699003)(11063799006)(6133799003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azlpemhnU2hpWEZRZnZvOXFRNVVWcUhQdWRXUWxTVTZ5MFVIWkNMaTRnSFNN?=
 =?utf-8?B?Zm5uclM0SUdLcDY2K0oyZGlVVXRYT0ZlSXdhTDhxZ3lmbWJ3dTUxT1FyK3Bh?=
 =?utf-8?B?dWx2eElHakoxdG5QbnFkYWg1bEtnK3N6c0ZrSnhtYnBXT0l6RERlUnZ5YjNr?=
 =?utf-8?B?U2RlajBwWCt3c3diL3ZhOHh2VktDUUYyRFp4c3VvRFNqQ1BraHl0VzFIOENR?=
 =?utf-8?B?L1hGWGx6VXd1WjRJTTNGUXcwY1ZXczJyWjRONVNZdm02UFZsUFZxcXZ5ZHZX?=
 =?utf-8?B?RkFoRmdBSlk1WDFRM2tQWXJsYzV4akRIU1JZb2NsdEJsWDBKTmd0L2ErTGtC?=
 =?utf-8?B?UUVKOTB5NXdlRDZaNjl0NS9kaWdWRVhySmxRQVZqVHhqbU04VFBLV0p1M0Qz?=
 =?utf-8?B?blp4Q0VjOFRpNjJHT0R3R1hoVW9OdFJQNWlQRG9SU0QwNmxGR0h1ekdod2F5?=
 =?utf-8?B?cmprelUyWTdPbnJ1OStwYVVsbW9PYThuY0xyZVdXaGdnWUZheXlkbFBpSDFU?=
 =?utf-8?B?cER1TGJ6SURMMmlUYnE4WTJhM0RTOUZ6VERPakRGTm5LWU4xODFzZ3VaeW1x?=
 =?utf-8?B?NnIyVzZGM1k5aFYyc0UwdjFRaVp3TCtIMW92SjY1Q1h1c3VLRnd4bVh1MHlV?=
 =?utf-8?B?WjdaQUZCY1g5WlpyMkhSQjNCbjNPbUc2SDkvRXdUQldieTFHaDRaTFpwSzhE?=
 =?utf-8?B?VEJtb2crekV3YWovWmR0TG5QTjBCaXZ6c1VNQmh1TFBTS0ZrTms4NHNINCtF?=
 =?utf-8?B?TkFDdFAwcDMrVEZxMW90cVRUeXMzQmY4dXlocG1FZkJ0aElSYUdTQ1I1bU9G?=
 =?utf-8?B?NnRTTzhBYUJjQmlGeXdPRTgxRzJDMklmMWZyVFBKZldId0RrYm4wUEhlSmtP?=
 =?utf-8?B?a1hhcTNZd2tJUVE0SEZLSEdKSDl1eDgzOXpVaUE0STF1UUNIMEduR3Vzb3Rp?=
 =?utf-8?B?eCtmUStKNkpoYlJmRTBKQ3JTVFc2YUhwcThIK1RtNzBFc01SVjl0cGVWL3JK?=
 =?utf-8?B?SER2RHYvalZnRHRsZW1hQlB3V2Ntbld6Qm5aNFdtSUF1TGhlbndHLzJVb1B6?=
 =?utf-8?B?VUFCS2tmc1J6Sjc4T2JhRjNZTndORThaRXR0WlkyUXFrMGNLeTV0UFlNZE1F?=
 =?utf-8?B?dkZNU2JzMExzSHpNVnYvcDJrcGxETlRwUmdHaytLQlFPMEgxTldmTWN3NFpR?=
 =?utf-8?B?ekFjSWpOZExoc01uaVFnWEFOeHQrcVZGQk5JeDhuQ1dzbTVyTDFkeDN3Z1hp?=
 =?utf-8?B?YzcyWDZ2LzE0L004aEY0eVRlRWdRNDBvK2JzZ0pvbWlEWktHSEJOaWYraEY4?=
 =?utf-8?B?TjZVSTlTeExaVWROdktPK3BYSVJSRzlvU3ZuMGFzY1JMcjlvQzFlbU9QOWUv?=
 =?utf-8?B?Z0hobmFmSGwxNGNCenhDa2k2WTBJNTlRcnBIWXBzOG1od0laa0dLczY0NFg0?=
 =?utf-8?B?aGMvOEpqaG4zc1JuaUxzT0hQRmQzL0JwVlE1cHcwcU9XQVU3UDZ3STdoRUo3?=
 =?utf-8?B?eEpRMVI4bVpRT0JxOVhJNmFjUDM3K0pkcDkrVU1QeitqaFZsUFpKQWViUmpq?=
 =?utf-8?B?SG1ZUUxtVHdQb25jMWZWZWUyQmlMbXB2S1c4Y0ZjMVdlRGxxckRMSFRwYmNX?=
 =?utf-8?B?UWE0QkUwRmYyK1RqNTk0K0NOY2U4dHBJYmlUbzIzZmxRdWI3WTJ4TG1Vbk52?=
 =?utf-8?B?U3Y4bTZ4UWRxNU9XUjRPWldRc0U0R1BQY3hxVmdmVEgxRnIzSU1wc3pkaHU4?=
 =?utf-8?B?Z2FJR2hmN1FjeGFxbXRXNHdOQml3OVFkdUpaWWVRZzhpdDJMOFNlQVkxbUkr?=
 =?utf-8?B?bVhibksweFErbXp6NklqaUsvT1FUWnorSWhmTGkzdDVHK3NTRitNbXoyZkNp?=
 =?utf-8?B?bkUyTEVwa2pTRFhSMmRENHBvRlR6MGJBakRaM0dKM1hOdVhjK1BOUi9hY2Fa?=
 =?utf-8?B?dDA5T3R5bFhxSlN1Z2lGckdEK0ZHR2gxa2FBRGg2Q0ZVK3l1NzhLWU5tbVlZ?=
 =?utf-8?B?M0ZFdTFFUWVMYlNITlBVNXAySFExLzlkNGt4MWhtelR5NGlaZUdyemhaSlRx?=
 =?utf-8?B?RlVGK1NrSkM0VjFiR1JUWHZyblFmZmlDQkYvM2RCb0RJVXg1cFFONTZzbndI?=
 =?utf-8?B?RUFVenBIVTZVckVNaU5hNVJUMHRiZUNqbFhzMmlWV3ZzbkE5czdRME5FWVJB?=
 =?utf-8?B?STZKaU1WTmluUHZHdU5OVi9BeXR1b09QR1VHU1pLVW0rb0M0cmIxSWtPN0lx?=
 =?utf-8?B?V1hKcStnQmFURXJ2cUg5Skg5UkNyTEkwL25nS0owclF0WTFOQzNDU0Z5NFVR?=
 =?utf-8?B?MHE3QUFmYkY1bkQ3UE5iU0FjOThHcHNlN216YlVZWitPOU9WdEpRVzlvRkNp?=
 =?utf-8?Q?u6kqyVtfdh2XwTUs=3D?=
X-Exchange-RoutingPolicyChecked: eqM+sro9APKRw4Yf8pd1eKnGbkmTwzKAXQXvxq00p3zhBmXUME4dMdhLh5x9HZwQhW6qEPZlTD7Ng3KCjI+giYNhYTYWQHn8qBVcqWMi2XLlOkM8WY9RY0fT3LpD/XZVFylZJhSmo10E9XhQf7Y6EvaAJZPBoiAwH0QVE4Gg2lfgeYTQ0yY9UDVgumP+3hrVxaZM88K3VjkDmylIvkXzpqLPMGJMoRO8ZcOwjmwgtJahKFwink7hEzW+wKwBnqypWed4EzYPMcgK1AYuvjYDWjzB5zn+Ip/7tMTRSqyyRFlFaDj/FbK05rkINnUOmq+fRyqud3eJpYKWfgzo0yWs9w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b499bb6-b8fb-4bc7-3cd9-08dec0ad3e73
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 13:45:44.4589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7VQxkeGu5J6OgVFhcRwsJFrmkMbGjUbsmYTkb268yWEK3GTmmv8ZNXbYN9H8Q78nTVQ76LINJk6E0+jDvTB76raUKT9tlN8p7F8X8AF4R04=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9804
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



On 6/2/2026 1:20 AM, Dong, Zhanjun wrote:
> 
> 
> On 2026-05-28 3:18 p.m., Michal Wajdeczko wrote:
>>
>>
>> On 5/11/2026 9:49 PM, Zhanjun Dong wrote:
>>> Reduce the default log buffer size to improve system responsiveness and
>>
>> default log size is SZ_64K and is not changed by this patch
> Typo, here the log buffer size is for CONFIG_DRM_XE_DEBUG, to be updated in next rev.
> 
> Meanwhile, you raised a good point, when CONFIG_DRM_XE_DEBUG is off, the log size is only 64K, looks like no need to do compression.>
>>> readability. The previous 8MB threshold caused significant delays during
>>
>> 8MB size was used in CONFIG_DRM_XE_DEBUG
>>
>>> log output and imposed a heavy load when printing to dmesg.
>>
>> hmm, but that was on purpose, as any extra cost caused by such dump, which
>> should be sporadic anyway, we were willing to take just to be sure to do not
>> lost any information from the too small log
> Agree, the heavy load is sporadic and expected.>
>>>
>>> By reducing the size to 2MB, we maintain a sufficient history while
>>> ensuring faster flushing. With a typical 4:1 compression ratio, this 2MB
>>> buffer will result in approximately 512KB of compressed data, providing an
>>> efficient balance between log depth and system performance.
>>
>> hmm, such dumps should be very sporadic, already after HW/FW being broken
>>
>> so what do you mean by the 'system performance' here?
> Sounds like I need to add more description. Looks like the wording "performance" here is not accurate, to be updated in next rev.
>>
>> and maybe it would be sufficient just to introduce compression without
>> reducing the log size?
> When MB data level to be dump to dmesg, it take long time, 

but I assume we're dumping that on purpose, when there was a problem and we want to collect as much data as possible
so even if this takes time it should be ok


> if just add code to print log for debug purpose, test shown when dump > 8MB data, some task/thread timeout triggered, 

but we should dump CTB due to an actual error, and as we already hit that error, some failures are expected, no?
maybe the problem is that we trigger CTB dump too frequently without a good reason, or the timeouts are too short?

> those are noises not expected. 

do you mean errors or dumps are noise?

if the test triggers errors on purpose, then maybe such dumps are indeed unnecessary and could be viewed as noise
but then we should rather introduce some mechanism to block such pointless dumps during tricky tests,
but leave the full dump for other cases where they will be really needed and helpful ?

> By compress and reduce the size, we expect this kind of noise could be reduced.
> If you think 2M is too small under some condition, let me know, now is a good time to change it.
> 
> Regards,
> Zhanjun Dong>
>>>
>>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_guc_log.h | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
>>> index d231def50692..44e81a54681f 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_log.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
>>> @@ -17,7 +17,7 @@ struct xe_device;
>>>   #define XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE    SZ_1M
>>>   #define XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE    SZ_2M
>>>   #elif IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>> -#define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE    SZ_8M
>>> +#define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE    SZ_2M
>>>   #define XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE    SZ_1M
>>>   #define XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE    SZ_1M
>>>   #else
>>
> 

