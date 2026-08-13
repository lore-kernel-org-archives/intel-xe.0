Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68AFC5CFEB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 13:29:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60AD10F332;
	Thu, 13 Aug 2026 13:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nO7TPsZM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25FFE10F332
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 13:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786627762; x=1818163762;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oprxgdsfLUfkSdAAeiheAQubmWDZ2Xuy+oa9iRtvdyM=;
 b=nO7TPsZMfcsQfoXeKWzZbZoiccCgk5RbOWD9lXfkqQk+MxK1TbTAhbzx
 vngN3454k6yf6rwbjPuKP6mqb7f1zNdYS377hLaCubxHcR1XCmC/Ob0Ne
 VkX3oaAepFhnIqG0l4ul1SmUXMXZsrglU0gIV3tlAPDAY+fF8P766rd8d
 BezRRh6AgCZ2ID/VFfgNhWD94l+Au5Q/x7wYSysfjnxZ6396gE2RIwz3i
 v2HvAmucH8EGp2AI7F/PhyYGqN+FT4k3AcFIk8zA3UhoXwF1t93xJoA9e
 QqCSOknM0hhs4JXhzAkljBzcLvXw71Pruh+2iHf57SOn4ZeRWZZJNsGzM w==;
X-CSE-ConnectionGUID: soGng+YLQHK+euikkGrKpw==
X-CSE-MsgGUID: ifkRaeIQR2mneP/DeFVa4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="97787693"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="97787693"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 06:29:21 -0700
X-CSE-ConnectionGUID: Xos5AUtTT4+zVpGlrgFEJg==
X-CSE-MsgGUID: 1bVDN3CjRaKhKGhuzKMzhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="263485454"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 06:29:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 06:29:21 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 06:29:21 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.50) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 06:29:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uW002dkXfQpkPPG2egzwzGGfdDcAm4rKlfAM9+1zTnOqy1QXPFtOWQmSHXdgrqzrYUyZ6lBHHYLgNdfzZJxQjzScDZCy9UHnusuHT5BqDXyeTJliqWcAKseRMezbMF00xg600g6YrsTqjHbO0LmbCFRrqIS0ZJkIsMvMagpK9eu9ukmfihng5SxsICzOCROC+YF3DDQ7FcXnQytXD/tqptvTyclOZXHVO4A2nH9uUrpAYBIA/HtlPSj5oSj71n4a2dBu5wsIPhj9FgNEsc2VaYm0FVBtc1mTRJ2WeI4kPH4MzGp+uaw1Hg5NW+sUecsIUMyjFzBWI4TSyYtEgLOKhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=karIEK38f0KFCICdtViGg5PQrmLB41pQhfnfl91tPWQ=;
 b=joDCSbRN/ThdmNYqiVwXwn25jbJLUrCpExTWwXEyFui1w+skdyhOhVKUOn5or9OM3YKmoCM18/GyGtWvXt08r2I+JPIbAn8zQ8QS0V+NbN0qdNMXuvYexipwPyzZxfIqzJU5K2Q+twjR6/GsOrjuZW9TI6hKPeDKyHSPQffalm0DLD+n8Gm9fcydjhbkmucwhOt4A5pSm4VjRQibxT2ClB4JpA9iz+9rXkj7eVSm80QhUHGgzxZ/cGeZYh+5oii82gaTexONghcClRD/FmstSFyYk/DMaQxIJlykFgBchWC2FP3TZ1D708QpINqepQaxHyrR4B4jEnaj+9M57uss7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ5PPF82E3BEA84.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Thu, 13 Aug
 2026 13:29:18 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.011; Thu, 13 Aug 2026
 13:29:18 +0000
Message-ID: <c6ff4f5f-359f-4eec-9e60-f4953ece94a2@intel.com>
Date: Thu, 13 Aug 2026 15:29:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/32] drm/xe/log: Index all SIGID printk messages
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, Jani Nikula <jani.nikula@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-12-michal.wajdeczko@intel.com>
 <5f61f3de-357c-489a-9bb2-f3874a98573e@intel.com>
 <e91dfe34-1e98-4f53-967b-a853a88427fb@intel.com>
Content-Language: en-US
In-Reply-To: <e91dfe34-1e98-4f53-967b-a853a88427fb@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::23) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ5PPF82E3BEA84:EE_
X-MS-Office365-Filtering-Correlation-Id: b6ecd5d6-bf85-4357-832f-08def93ee054
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|5023799004|11063799006|56012099006|3023799007|6133799003|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: F3q/k+o5hhEuSpS7CaJfigeBpr7AljJjY8Q0NMu4IPRwS/53C9LQqEFTD1MxpGFDiZTWVTbWRGo4xAr7WnC93aFhw/cH0htiMRBmtSf/9EtbcOB7jKIXVJ9MDgPK4SslEXZdNPEzw1m4bVm2DAz1IpsCphQh3/tZnBD8TwbhiE2jYqpOmERyuAeE1Qda9MGVasq6BHquYtnp251XmewnAV2RSThGxPsHlPPGKvnBwmKIVs4AiY05BU1fP4b3k2Z8RkiV1ke6TR5c5Gqoibah2XUX7RRL6kRMaQdmcGzBzd05AcSgHcWqqi8Y+yE9V8dmO72MPNM1EB5LvjIIG6STpCI9BsZjOJUQ54/sfGHdptcGDWd2g7JZ1I2nUvjlPwDFkn+w/XAhiKyEzdTMkmSSFMjJyPz639Jzy5bhKAyKJTxtce76XRH0Jrv5bijtU17M451DJmZeL/QlOeiytzHuK1n2BaKup57rTZXBb0xFFNZ4V7VIEYZGACSICdXGTPPr3gCVEbeyxQLv8MbATDuZw1vxLQSeR3oJZNpsXJ/ybpvSodRhLnI9SeLKYpm7N9bZReI6ZYeGlRsj/KPA9Q5dG9VKRUPeDzsTnZfxnL6q1zd/mr0KAq6fl/sWA/vWd64OHG4uztvrw7j4Bgu4/Drn11hHG6liBeJB631yjJDbRkA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(5023799004)(11063799006)(56012099006)(3023799007)(6133799003)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U05kZ1BVWGdaWEFuWlo1NWpzNWJSUDhPck45R09YN1BvSVN0M2tzZ2VVK3N3?=
 =?utf-8?B?Z2EzcS9YZE1neGM5dEdUdGZMN3pqcGdIWWJ5VmVPbXl0Qlg0L2FNV0J3eUlD?=
 =?utf-8?B?RjhDaTdQTVdwVFlqaEcrSDZtd2E2N0k5VVpFNkQ3WVR2N3hJQ2F2Rlc4Qks2?=
 =?utf-8?B?MTdKTzlGbmhYZ1Y0b2VaSVdhK04zc2dpT092VGdKWG02cVFLVlRFbmNwYndH?=
 =?utf-8?B?SEl6Qm11TGFGNzRZbTZuQWpMNlNkc1l0R3VLMnkyVVN5VlhmbU5zcGs5OFc4?=
 =?utf-8?B?di93dm9RL1I0UUZTZFNTRko4ZElWOTFTQVlxcGNNMStHeHJFTWF4cEduQjdQ?=
 =?utf-8?B?NFBMODV2S0hPYnBRTUNiZXdUaXByTHdqblZQVC9sOVcwYm0wRUNyaUpVYUU3?=
 =?utf-8?B?cFgxVUFYU1gwSVhwcHJMeSs0bVJ2N0RHNzlzZnlLZll4c1JXUWFocy9xK3ZU?=
 =?utf-8?B?VGdEM2drNjBjeVBuK0NieU8wSGxmREN4ZTk4Z1QyZS93U25QT2hOenFFS1Mv?=
 =?utf-8?B?dldlV2lQTVlZc0tFdkwxdkFWek1NbWdDQzNlaTZRWFhGRWYwaCtsZjc4QnpM?=
 =?utf-8?B?cm85MW9SY2crRVI4R0FMMDhSblNhQWw0MUN5cHQ2MERub2s3L2hlVDVrQzIx?=
 =?utf-8?B?K01ldWFYVTBYYTNHYUo2cW16UmlTZXJyalFuczFoL2YxaFo0WUFVRDNtejVT?=
 =?utf-8?B?ZTF0Wm1aRjQvTzhrMVN3ZjlGbGdMemExanlsWUJvRmM0N2R2YUQvQTdwbVNG?=
 =?utf-8?B?N1Q4K1NlZkNsTUxER0J1bUo4ZVM3MVo1VlJERjA4V2JockorUW9ya2JPZitT?=
 =?utf-8?B?WmgrQUFDbEErZTlVMGxNRGdkZkJDMUg1RDg2RkJWdnN5ck5ONHVqVEdoSDRX?=
 =?utf-8?B?ODdMNTgzdjR4dDdid2hkZUU1THl0RkdPeXMrc2lYNWVuRFB0M0gxM25wakJN?=
 =?utf-8?B?dXVaMzBrMXhELzd4QndGVGdKRk9NOE5IMXYzSnAzLzVtVlpGNy9ObC9OQVIz?=
 =?utf-8?B?aU9UMW55RGRsVnhMRnRydmlUcmhBWHBJZ0psMkdiS3Z0MlRBOWNXRVMrQWxh?=
 =?utf-8?B?d2JBaWo2WklkQmpWejVsekdyajBOaEZOL0xIcDJ0ck9RU2VBSmxXS2xxREZq?=
 =?utf-8?B?Nm5KUDVLZ0lvUGo5WHF3cmxDSnBwL0JSNlVCUTJNU3NnSTJmMDNvS0JVWG4r?=
 =?utf-8?B?cXJzRm5BcUJJUG5CKzhSSFJPYm5VSVFPSXp1c2FvRnI3czlmQWZZWEpkNC9o?=
 =?utf-8?B?dkRWb25sUGRxVUZyWkNuRGYxK0IydTdIZkozUWovNmplb3Z2SUptTHVLSjdr?=
 =?utf-8?B?ZUhvdzlJV0hZTHFRSUNBa3BqZkVxamo3V0l4M1F5VFkyQVd5QU0zZmk3b2pJ?=
 =?utf-8?B?YWU5b0s1MXp6b1hjNFBhcDVRdDhwUHprbjRxRDg2WlFwZS82NzVuRTc4OTJU?=
 =?utf-8?B?dDdKd3BiMlZMV1RyZzhNb054RHJhZmI0ZFc0VGQ0Vi91b0ExU3JLbWtYMWFP?=
 =?utf-8?B?U1grVzVpZnVqRnlvWktydHNwVmFSMDZrSXR3MFBoWTZCYytaTm1Vc2dmcFhD?=
 =?utf-8?B?NXZjK2xSVTM0SWZjM0xFSFBPOEkxQzNqekRRNHcwYmw0a3hyS21kdTVVZzRK?=
 =?utf-8?B?VVdSVnlaQTlQbHJwMUN6Yk5GWTFPSk9neThSc3ZpTk1iZnRBV3FGUjhjckRq?=
 =?utf-8?B?LzlDVzdyeEJiMVJ0bWRNNjV4cGgxbTBoajNBMm9XQVFuTHBrK1BBc0NsUXBH?=
 =?utf-8?B?STA3SjMrcndUeVlSWVd3bS9mUVRCdlRPQUtML1Q5WCtPa1JLVjk2OCtyMnF6?=
 =?utf-8?B?STNSRkpYWEtES2ZCcnJzOXdUU3d2b1A5WW5wUXhvMjF3blhIK2RyYVl1cnBs?=
 =?utf-8?B?MjFzT05ZVjNHU3Zxd3RJc0NLNk94QUdNWCtHOGdaS3BjYVNZUUlrT1p2NDJE?=
 =?utf-8?B?WFMwa2pnWGFBaXNMMVhFamtHTUMzazUwTGVUMyswZ1p2dEF0dnBNemJBK1lB?=
 =?utf-8?B?SmJNV2RSSWgrQVNGNktVVjBEWi9kWWpITnBDK2V1R0o4aGhTNC9DcHp2Z3lD?=
 =?utf-8?B?V0V4QmRERUhJb2ZBa1JXekcxYmtLRDRHcTNkODBlVzJNVXhDMUhKQXA3NHpj?=
 =?utf-8?B?amplZ3M4citwOVExZDNicSt2am45azZ5R1J3Y2ZsdGhXb2Rydmhvclhuei9R?=
 =?utf-8?B?NmJ4aU82YTJLQVBRTzc0RXhwNnZjTzZ6Nk9lMy8rTjVtV0NKREU0V01aSm42?=
 =?utf-8?B?NTNlNEJlWEJSdVNoUXhKUk5xa1dCSkhhL1BtTFo4OXY1ZWVFQzk1WUJYNXNn?=
 =?utf-8?B?YXlMWVVXQm9PK1hsSjg4YS80QjJ4VjJDNzFWV2MvVCsxbEpvZ0Jnc0pGZWVI?=
 =?utf-8?Q?4sBb/hyik4ZmKkAY=3D?=
X-Exchange-RoutingPolicyChecked: AdI7CCIifF/Wq+/cgVIASU+r8oiElHhxvuYmKi4wg5DK8xoxuO4Ws/UEbvFKG5uyiPCb04Fl84+VBENaraG+zE0ki95VqvQDWT4OKcVbN2Q6GvJY4zVDBXDGdNrR/2O6bNfjGD5LIsCbDoRbORQPxRQf5VjObc4QN0xXWCgADz7QiGMSamTaHulXyAj6qTD8BYkJfv8RmE710On9t/4D1ClRR5jEFpUrP54HTp7GqTZwYVGirKVTYnHBSAvE1GAVtZEM4YfnyFlB4aQ+43N9KHuNXJC7KTiNwUPinIAZyQExoIzInENjIPQsjFzXK+eDiJPd3KN+DvjEjjHa1fgxfQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b6ecd5d6-bf85-4357-832f-08def93ee054
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 13:29:18.3128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xhVv34ds7AhbumbbIAEh7fIWuPCpC/x6FAY5dBZ7+oqiHChFgz1dgTmI3cDUYPPJnEkDwR1680miaechBf8KmovC4sYUQgONDf0oHI+c6bw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF82E3BEA84
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



On 8/13/2026 2:54 PM, Michal Wajdeczko wrote:
> 
> 
> On 8/13/2026 2:31 PM, Mallesh, Koujalagi wrote:
>>
>> On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
>>> When CONFIG_PRINTK_INDEX is enabled, it is expected that all device
>>> level printk messages are indexed for audit. While usually this is
>>> done automatically behind the scenes when code is using regular
>>> dev_printk macros, since we are generating different dmesg messages
>>> inside xe_log_emit() based on the severity, component and location,
>>> we only get those entries in /sys/kernel/debug/printk/index/xe:
>>>
>>>    <3> drivers/gpu/drm/xe/xe_log.c:142 log_dmesg_vprintk "%s %s: [drm] *ERROR* %pV"
>>>    <6> drivers/gpu/drm/xe/xe_log.c:140 log_dmesg_vprintk "%s %s: [drm] %pV"
>>>
>>> Explicitly generate printk index using dev_printk_index_emit() with
>>> some generic prefix that includes the SIGID tag.
>>>
>>> Suggested-by: Jani Nikula <jani.nikula@intel.com>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_log.c |  8 ++++----
>>>   drivers/gpu/drm/xe/xe_log.h | 14 +++++++++++---
>>>   2 files changed, 15 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
>>> index 0b423ed121cd..50a9b35e5b3e 100644
>>> --- a/drivers/gpu/drm/xe/xe_log.c
>>> +++ b/drivers/gpu/drm/xe/xe_log.c
>>> @@ -177,7 +177,7 @@ static void log_emit_dmesg(struct pci_dev *pdev, int cper_sev, enum xe_sigid sig
>>>   }
>>>     /**
>>> - * xe_log_emit() - Emit a structured SIGID log entry
>>> + * __xe_log_emit() - Emit a structured SIGID log entry
>>>    * @pdev: the &pci_dev device
>>>    * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, ...)
>>>    * @sigid: signature identifier, see &enum xe_sigid
>>> @@ -206,9 +206,9 @@ static void log_emit_dmesg(struct pci_dev *pdev, int cper_sev, enum xe_sigid sig
>>>    *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=106 (-ETIMEDOUT) Engine 'rcs0' hung
>>>    *   <6> xe 0000:03:00.0: [drm] SIGID=103 In survivability mode
>>>    */
>>> -void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>>> -         u32 component, u32 location, const void *data, size_t len,
>>> -         const char *fmt, ...)
>>> +void __xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>>> +           u32 component, u32 location, const void *data, size_t len,
>>> +           const char *fmt, ...)
>>>   {
>>>       struct va_format vaf;
>>>       va_list args;
>>> diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
>>> index 0928b0866617..53fe2bb7ddd3 100644
>>> --- a/drivers/gpu/drm/xe/xe_log.h
>>> +++ b/drivers/gpu/drm/xe/xe_log.h
>>> @@ -16,9 +16,17 @@
>>>   struct pci_dev;
>>>     __printf(8, 9)
>>> -void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>>> -         u32 component, u32 location, const void *data, size_t len,
>>> -         const char *fmt, ...);
>>> +void __xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>>> +           u32 component, u32 location, const void *data, size_t len,
>>> +           const char *fmt, ...);
>>> +
>>> +#define __xe_log_emit_printk_index(fmt) \
>>> +    dev_printk_index_emit(NULL, "[drm]%s SIGID=%u %s(%s)%s%s%s: " fmt);
>> We need to change format for a. error path b. blob path c. plain or info path right?
> 
> well, that's not doable as final format/output depends on the
> severity and data value, which could be non-const at compile
> time, while printk-index requires this to emit right entry
> 
> I can change that to a something more generic (and unfriendly), like:
> 
>     dev_printk_index_emit(NULL, "%sSIGID=%u %s" fmt);
> 
> but that will catch and match all our outputs.

and this is how this will look like for current series:

$ sudo cat /sys/kernel/debug/printk/index/xe | grep SIGID
<3> drivers/gpu/drm/xe/xe_device.c:1481 xe_device_declare_wedged "%s %s: %s SIGID=%u %sDevice declared wedged!\n"
<3> drivers/gpu/drm/xe/xe_gt.c:977 gt_reset_worker "%s %s: %s SIGID=%u %sreset failed\n"
<6> drivers/gpu/drm/xe/xe_gt.c:968 gt_reset_worker "%s %s: %s SIGID=%u %sreset done\n"
<6> drivers/gpu/drm/xe/xe_gt.c:929 gt_reset_worker "%s %s: %s SIGID=%u %sreset started\n"
<3> drivers/gpu/drm/xe/xe_guc.c:1620 xe_guc_mmio_send_recv "%s %s: %s SIGID=%u %sMMIO request %#x: unexpected reply %#x\n"
<3> drivers/gpu/drm/xe/xe_guc.c:1612 xe_guc_mmio_send_recv "%s %s: %s SIGID=%u %sMMIO request %#x: failure %#x hint %#x\n"
<3> drivers/gpu/drm/xe/xe_guc.c:1556 xe_guc_mmio_send_recv "%s %s: %s SIGID=%u %sMMIO request %#x: no reply %#x\n"
<3> drivers/gpu/drm/xe/xe_guc.c:1546 xe_guc_mmio_send_recv "%s %s: %s SIGID=%u %sMMIO request %#x: lost, too many retries %u\n"
<3> drivers/gpu/drm/xe/xe_pagefault.c:631 xe_pagefault_queue_work "%s %s: %s SIGID=%u %sUnsuccessful response\n"
<3> drivers/gpu/drm/xe/xe_pagefault.c:332 xe_pagefault_queue_add "%s %s: %s SIGID=%u %sQueue full!\n"
<3> drivers/gpu/drm/xe/xe_pci.c:1181 xe_pci_probe "%s %s: %s SIGID=%u %sdriver loading failed for device '%04x'\n"
<6> drivers/gpu/drm/xe/xe_pci.c:1171 xe_pci_probe "%s %s: %s SIGID=%u %sdriver loading blocked for device '%04x'\n"
<3> drivers/gpu/drm/xe/xe_pci_error.c:102 xe_pci_error_slot_reset "%s %s: %s SIGID=%u %sCannot re-enable PCI device after reset\n"
<3> drivers/gpu/drm/xe/xe_pcode.c:321 xe_pcode_ready "%s %s: %s SIGID=%u %sinitialization timedout after %ld seconds\n"
<3> drivers/gpu/drm/xe/xe_pcode.c:221 xe_pcode_request "%s %s: %s SIGID=%u %stimeout, retrying with preemption disabled\n"
<3> drivers/gpu/drm/xe/xe_pcode.c:65 pcode_mailbox_status "%s %s: %s SIGID=%u %sMailbox failed: %s\n"
<6> drivers/gpu/drm/xe/xe_survivability_mode.c:440 log_survivability_info "%s %s: %s SIGID=%u %s%s: %#x\n"
<3> drivers/gpu/drm/xe/xe_survivability_mode.c:433 log_survivability_info "%s %s: %s SIGID=%u %sBoot Status: %s (%u)\n"
<6> drivers/gpu/drm/xe/xe_survivability_mode.c:422 xe_survivability_mode_runtime_enable "%s %s: %s SIGID=%u %sFirmware flash required!\n"
<6> drivers/gpu/drm/xe/xe_survivability_mode.c:417 xe_survivability_mode_runtime_enable "%s %s: %s SIGID=%u %sRuntime Mode enabled!\n"
<3> drivers/gpu/drm/xe/xe_survivability_mode.c:409 xe_survivability_mode_runtime_enable "%s %s: %s SIGID=%u %sRuntime Mode not supported!\n"
<3> drivers/gpu/drm/xe/xe_survivability_mode.c:344 enable_boot_survivability_mode "%s %s: %s SIGID=%u %sFailed to enable Boot Mode!\n"
<6> drivers/gpu/drm/xe/xe_survivability_mode.c:339 enable_boot_survivability_mode "%s %s: %s SIGID=%u %sBoot Mode enabled!\n"
<3> drivers/gpu/drm/xe/xe_survivability_mode.c:334 enable_boot_survivability_mode "%s %s: %s SIGID=%u %sBoot Mode enabled!\n"
<3> drivers/gpu/drm/xe/xe_survivability_mode.c:302 create_survivability_sysfs "%s %s: %s SIGID=%u %sFailed to create sysfs files!\n"


> 
> @Jani, are you OK with that?
> 
>>> +
>>> +#define xe_log_emit(pdev, sev, sig, comp, loc, data, len, fmt, args...) ({        \
>>> +    __xe_log_emit_printk_index(fmt);                        \
>>> +    __xe_log_emit((pdev), (sev), (sig), (comp), (loc), (data), (len), fmt, ##args); \
>>> +})
>>
>> nit: use do{} while (0)
>>
>> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>
>>>     #define xe_log_emit_fatal(pdev, sig, comp, loc, data, len, fmt, args...) \
>>>       xe_log_emit((pdev), CPER_SEV_FATAL, (sig), (comp), (loc), \
> 

