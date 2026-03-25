Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD27EFEA806
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 06:20:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7114210E1EB;
	Wed, 25 Mar 2026 06:20:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PyR9r6z+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB1110E1EB
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Mar 2026 06:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774419644; x=1805955644;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iQp0tWBEILk2AnFo6Fqrd6wruDN/AFhh2cnEjUxfSFc=;
 b=PyR9r6z+QhA9vTVvHR3FnsFTGrTyxKc3H8ON6XzZSvLLxgpzQlChVIsK
 U6ciRkzr960DrYDTZDQy2amfK7160GWKfuX96Q8zusrh9MIIYqI2MqcFd
 4ooFk+GVrr6e5Ely4y2gl4iK+dLb1m0oxI6H6imBhj9hi3QspKjGuT7FH
 V2WesnPv2T8twnE0imaTX7Bq4hivktQAAASUc1lZRl8v/sjF5MHfETG8W
 StvdbkBMSZKrz8H3BV4HUMFcYZ7kOkNQJA4e8l15GfauuhP87qZoQ8JbR
 dSQz+0Z2LtpLhun4dGmanvYpcPW0FK3p28qenzfFQXti14oBGF0rPF+nU g==;
X-CSE-ConnectionGUID: yFBOqSCPTqeVx8zuefJe2w==
X-CSE-MsgGUID: 7/1BYA4HRc6mX+xJQFZuEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75338246"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="75338246"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 23:20:44 -0700
X-CSE-ConnectionGUID: yqIViDoGTWW0pn7i92unSQ==
X-CSE-MsgGUID: YPvUeIjmScOdREI+ZGbU4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="224596418"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 23:20:44 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 23:20:42 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 24 Mar 2026 23:20:42 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.30) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 23:20:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SsFbO0vFbhc2yhNH1GWvVm8Tjb4ABCqmMzFmp/KQ496TfaUvWQlsLD74s6Vy3WI2qoRX0hyFB8C+F2vItuzC6Y1A/WOK2N5v/XIzoM/G1KJP6AzsuhTR6QclHpM3TQ7ivwS6lNy8j/g0IYYk0ZGpglc7rO2PCXo4EmA6PWCcee3JxNuiyfLS8hC7/bssT10ENf86uvisMCAPyx/xUFzpKBw1Cyaf3ZYjMcRB4U8eKijCGHs3/rEwtt/vv9WmwWNIX/CkLlE1hpCeqr2sohGX6rMDffazvMmmigIHpKIzVX61qhUh/AhXYoLlrBpeeHMeu7jJbXVldELpkETD6zqwNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Zeh4J+trh1ep1n/DnfWgNnLHDi1Y4FUnIcKW1N4PGc=;
 b=KrBcxeodxqosS5eR+/TeCSvAF8m5ohaHD4KQB15D4ub+Lvqdrm8io4fxF3WmFxhz4BWxnJAO29QK/aNpTc140kjKycg7+WKPo++3ki6AR2nGLbCWoH0Od580i+o/xqhhKq5klBImNckAbdFfUU1bMAgwePkHiFjBPlnqLLSZxcagRwF9zHmPKxWmXON2vDAJ1Np3lKLxzFwo31R9mlqqWVUB956v4GxWVlMBGwi/ZYYL2+uvIrcILjSPM30v/qmzg9e5rd0Br8nwS/wXMWuYquFSC34xfZmNZfCJz05aFKfSx8T93aeHR68x98NzOOtDwxI9FW1v0ZoUxcq2Cauf5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7145.namprd11.prod.outlook.com (2603:10b6:510:1ec::17)
 by CO1PR11MB4769.namprd11.prod.outlook.com (2603:10b6:303:95::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.6; Wed, 25 Mar
 2026 06:20:37 +0000
Received: from PH7PR11MB7145.namprd11.prod.outlook.com
 ([fe80::341e:838e:e911:f62b]) by PH7PR11MB7145.namprd11.prod.outlook.com
 ([fe80::341e:838e:e911:f62b%6]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 06:20:37 +0000
Message-ID: <ebf0564f-410f-4968-b554-8b03c2463402@intel.com>
Date: Wed, 25 Mar 2026 11:50:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] drm/xe: Set GT rp min frequency as 1.2GHz default
 for BMG/CRI
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
References: <20260324182136.709386-3-naresh.kumar.g@intel.com>
 <20260324182136.709386-4-naresh.kumar.g@intel.com>
 <41a25e7636ae6262818c51974cd2e602178cdb21.camel@intel.com>
Content-Language: en-US
From: "Kumar G, Naresh" <naresh.kumar.g@intel.com>
In-Reply-To: <41a25e7636ae6262818c51974cd2e602178cdb21.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0053.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::8) To PH7PR11MB7145.namprd11.prod.outlook.com
 (2603:10b6:510:1ec::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7145:EE_|CO1PR11MB4769:EE_
X-MS-Office365-Filtering-Correlation-Id: 73166411-8e33-4c78-fe7d-08de8a36a14f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: 7Lc0EE4kNzYrYhdk4wS9gL7FjuuwWiY1fiPPZS/JRhbwe6kgYOkZq3MqBXpFjp8d8s/QmGpS9eMKLXyAPxGNcD0nMqEq5BtEG0tz9kJG8g0RLMccRyeq5nInkwjpGrTNmFbSrk45lnbhRXA8CAuTm7uSZbWv2M47kdtbxHnVwbZbCCmxbnBfHOxBMmLOsrHhIXK3D/DrJKiq82XNBZtZq9/tzfQqJPIYbFLiJ42hgHCgaHAAmKj5AMMrhZ7WTAuyhu8Tuv4uWMrUHTEJXoWUqeUlR6ftAkTUuaI8Tky4Mg+vPQgPpMBqmhSbuJ0kDuwup+O2uOjR0XBSKktnZtSAN2uUKt54w1xMVF+Gj2PIAi1lb7v8+w6I1szQ+HNs55pcF3mxYiUIyscCOtJRqaPK1XOsE2OqOZnmPwrDRkh/B3lZS7XnFSOzB2tQ0nUgR7SwkuL5Zrs3jz8cnTS4SzQek1HbJO2klYsJGi4EaepSSQq2n7/zBEbUk/1ShBAZmCJerpFtQXdEcqDLQiKPnlcdd0k3USE2gwkq4Lj954DR+x26M1715B2lkf2A9Ch4WNUe24m5AOZMBfxM/y44PqI0l+maEsY9gkDFoYBJE1PHJT4TZ7CZL4S4h0jgmm1wy1E8iVHNPTVnQB8gDmRal/dNJynWgih73yt4Kg73P+aZufDOpCgCxvFjz4t7V1vcsj8h//Uwy2L3lpetePMzkzyvzDcgeurriUAq5V9PjQ/22ag=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7145.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGpmczdpVzRBMy9HS3orMUlwc3FuUTJ1MWNZN2czOUJmMlgyWnFMb3ZNT2Qv?=
 =?utf-8?B?UHlEUk9MUU9leHJyU2tpYi9MM3ZadjR2TWZ5RlFrWE1kYXNzZWEvckEvTkQ3?=
 =?utf-8?B?YTdWUzVTZzY1QUxQY25JK2lkdkJCM2tBY05XMVdEbHMvNmpFZmdGODRrVVVE?=
 =?utf-8?B?ME1kVWRsK1dBbmJUbVUwT0hIWm5KcVVGSkN4UUtGdVAyWWljbFRaMGJRWWd6?=
 =?utf-8?B?emhSSDNrb0doUmVIRDd5c0FLTGJMSjJKYWxHTzBqV3UvcXU0RjM0ei9xNllP?=
 =?utf-8?B?UkRJTGlaNE81RG5Ecys4eFNKWHZVUkk3NFZPcS9lU0tBRHJ0TnZlN0w2RWFi?=
 =?utf-8?B?LzVrRzBWQnpZdlRuQ1BUSmlZcUNVVHpvcnVBbnJIRFV6K1hkTXBZb1RUME8r?=
 =?utf-8?B?RHF5S3RraHB6TUVTaVU1OGh0SEVpaTVHcUhvd1kyOUJsSW1SUHRJYzRjd2po?=
 =?utf-8?B?K2lBZ0RWM3ZvMG1uYVNjeUxya0N4R3JTbm1pbllFZWF6Zy84V0ZWSjlDMjRQ?=
 =?utf-8?B?NGZpS2NKemJIZGRrWUh6c1d6d0ZTTWhGN3JPR0RlUjNQWTlDeU1hN1J5ZXVq?=
 =?utf-8?B?anVaMnk5ckkycE1EQWw3emRJS2hoTjlYTit5Y2NvbFpuaVhVL2g0OHZacXZU?=
 =?utf-8?B?cVlLZmF6ZXI5R0c1OEJVWGw0UEVxblptU0U4WUt4RGF4MmNvRW5MRGs1eHhh?=
 =?utf-8?B?d0RpU1RXN0JRblFwRm1SSnBWVUM2TVNyWmR5RWkyWjlSQXJGL1l6bTNnQzVW?=
 =?utf-8?B?MllNWVovalVhYURPclQ1SjNDS3BmWnh1c3NHbkdqRlJJc2RvbmhZTWl2cVow?=
 =?utf-8?B?WHMwem9HQndYMDJ0REZSS1R1NjJXYVlVYWQ1YUk0MmlZTkV2aXlFK20vY3hu?=
 =?utf-8?B?NFdrMit0OWZIS3BTTmRKS0xXck9FaWNEUzUzMGlnaFl1eXVJR21td2M0Zk5L?=
 =?utf-8?B?RVJPT0hwQ3ozVlFXKzNET1ZtczQ4TmIvVTJWT3Bnd2JTYjBlWTBocjJQZ1c5?=
 =?utf-8?B?UWJuQjd6eDBiQTI0OWh6Z01YUFJVOFIvaWpkUE91TVFoZkd4UXFSVmtlQ1Nv?=
 =?utf-8?B?SWgvZnRuVCtKZ21NdlNYSy9DbjhkM3Q4aTlEaVFJdzJneWVGYUJoeDNJVlBx?=
 =?utf-8?B?ZWdEeXhuZmFvNi9iTDV4ZDk3ZkI0NjFCMFpoYnJ6ak51WkUrVkVYNHBYTlYv?=
 =?utf-8?B?VnFpUkNOcDVhSThzV1loNjNtMWgxd1gwb1dJYnk3UUlEcFRQUGw3ekh0c2dG?=
 =?utf-8?B?d0dPYU00NWJLTTUxTGNpTGx5UitkMEI4amxRWDlMekZCWnVYR1NpOXdiYVd0?=
 =?utf-8?B?YkpRakNlTUpNZTA3QjYraldRWk5kZUIrWWpIZHUxeFdZWTFvTkNqUFFBTEpI?=
 =?utf-8?B?N0xvdFdFdnNobFZ2YlZtNUw5RlpkS0pzT0JWaDRCM1RMcXQ4NjJsQ3ZsN3V2?=
 =?utf-8?B?b2p0Y0llUXZkdjFhbTc4VnBuM1lzTFlPbDJEMzNDUHRBeFBaMWxOT1NYY0o3?=
 =?utf-8?B?SGIydzY0bGt5K0IyMWtWNkoxMEJtbEFwdGdOeWg3NHUrU09lL2FFS3JwUjRr?=
 =?utf-8?B?Q0FuU01kUFpxbGZEMGdWd2E3V1IvRkpqVkRpMFRnaExlU1J1anFQeWlFaGZB?=
 =?utf-8?B?TXFhM1RBclR0WlFGVHNzMkFWZ0FrdElPSzgvbFhyRzJmR09KUGU2Mzl1R2dS?=
 =?utf-8?B?OTIvREVaUlFPcVl3V3VMRVhlOHJDZS9CbWRWRktOcGtXMUxyWEZ0cmd3bjYw?=
 =?utf-8?B?dSt3Z25uZGVwSU4wdmV1N2JYWFBTM3pDRHpUYmVCOFVqQnJJWHg3S3lkNHJG?=
 =?utf-8?B?MnlycURuRytQNlRjditWN0lHUENZb00xMG9EQ21EaWt3UitjRTBtbnZIeGln?=
 =?utf-8?B?Nm5xSHBDdis2a1JIZmh4czh6ZStNMGh3RXB2azhhVU9zQVVGblFseWRGbUpH?=
 =?utf-8?B?Y0lMbEJaWHhYeGNMUnl2Ujgwd3kvclFyN21pd0dHOVZJVjJwNENNUlhtVUs5?=
 =?utf-8?B?dS9tNGU4K1pWSi85UjIvTm43OTE3cjdWaFhyQjF1MmpaNGdGRFU2TVNwaTNX?=
 =?utf-8?B?aE1oaUY0QnlTYmRUWjVHOFVRMDZodXF5SlhQMlJweTVmUVpHOWphcnZOWEsw?=
 =?utf-8?B?ZnNaL01SaU51a2FZQzFVYTBwQnFGaXdJaXJNQ216NXRjTlk2ZStMc3hWUUJs?=
 =?utf-8?B?QnY4U2svbjNyc1VObG1jMUxhK3BETFJyWUFUUU9yaWdNaTBCUVM5VEl3Nzg5?=
 =?utf-8?B?TlFMamFYd2pTbFMwTTVVMEFKNUZTc2NqUFIxRlRsa3puYTFMcWJpOFZCb0d0?=
 =?utf-8?B?d0MvQ3RRUE1NOHptaEVSNXRIL3VkWlBjNFpVMXU1cVMrbDZ2ajZnZz09?=
X-Exchange-RoutingPolicyChecked: X+I5U93zdnNexoy+/f/Mqc2JLtyRRbumwK57fKez0GcI3iwRNnDAwj42VY78Th/MRjHvEGqclpqTAf23t59DlW7noXNhOv5YHjo//xxNzXH6aIH+mRVHZtHgCH2LYlHktKUKQuMas9oR6OGzyD7xdhWlFcnoXQn+4poyCmoKkuA4SMlKc0njPtTA2u7aQGWVt+MXGtPZ9m/bAWBMeW5D7KS+hO51uYPjF+EqJOSAWpS5ejxXXY7DhxNh/bkRkE3KQjWB3tm0cKjj45quHtZvB4uAObFAG6zHO7yVgL62cMZSdGiGEWAX+UtImXUX4UmqcFy7OHzWzrul2xVhST3XsA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 73166411-8e33-4c78-fe7d-08de8a36a14f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7145.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 06:20:37.5484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1eQ30cW6KBcWklIriK2GQm8dRZXzX1Z9304g3p7XEOsLG3CG9j9DubdOlcs1MI/42RX7L5eM1XmLoQdyA6NWtkZqUGET2V+k+URQsTGz3Tw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4769
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



On 25-03-2026 02:45, Summers, Stuart wrote:
> On Tue, 2026-03-24 at 23:51 +0530, Nareshkumar Gollakoti wrote:
>>   While previously applied only to both tiles GT0(Graphics) and
>> Media(GT1)
>>   the BMG G21(Battle image) platform via workaround Wa_14022085890,
>>   this 1.2 GHz minimum is now the default for GT0(Graphics) tile
>>   of BMG and CRI platforms.
>>
>>   Setting this frequency floor(1.2GHz) default is critical in multi
>> GPU
>>   environment for supporting effective Peer-to-Peer(P2P) transactions.
>>
>> v2:
>> - Fix Indentation(Thomas)
>> - Add comment about power impact(Stuart)
>>
>> v3:(Thomas/Ankur/Matt Roper)
>> - Add setting frequency to only GT0(Graphics) Tile of BMG/CRI
>>
>> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_pc.c | 29 ++++++++++++++++++++++++++++-
>>   1 file changed, 28 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 5e5495a39a3c..2abfc2fff083 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -856,6 +856,21 @@ void xe_guc_pc_init_early(struct xe_guc_pc *pc)
>>          pc_init_fused_rp_values(pc);
>>   }
>>   
>> +static bool pc_needs_min_freq_change(struct xe_guc_pc *pc)
>> +{
>> +       struct xe_device *xe = pc_to_xe(pc);
>> +       struct xe_gt *gt = pc_to_gt(pc);
>> +
>> +       if (xe_gt_is_media_type(gt))
>> +               return false;
>> +
>> +       if (xe->info.platform == XE_BATTLEMAGE ||
>> +           xe->info.platform == XE_CRESCENTISLAND)
>> +               return true;
>> +
>> +       return false;
>> +}
>> +
>>   static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
>>   {
>>          struct xe_tile *tile = gt_to_tile(pc_to_gt(pc));
>> @@ -885,7 +900,19 @@ static int pc_adjust_freq_bounds(struct
>> xe_guc_pc *pc)
>>          if (pc_get_min_freq(pc) > pc->rp0_freq)
>>                  ret = pc_set_min_freq(pc, pc->rp0_freq);
>>   
>> -       if (XE_DEVICE_WA(tile_to_xe(tile), 14022085890))
>> +       /*
>> +        * Setting GT RP min frequency to 1.2GHz by default for
>> +        * GT0(Graphics) Tile of BMG and CRI.
>> +        *
>> +        * While BMG G21 WA will apply min freqeuncy for
> 
> /s/freqeuncy/frequency/

Noted

> 
>> +        * both GT0(Graphics) and GT1(Media) Tile.
>> +        *
>> +        * This is an active frequency, so if the device is idle
>> +        * we aren't expecting high power output across board
> 
> If you post another series, you might add this last sentance also to
> the cover letter. I think it's important for customers to know that it
> only applies while they are running workloads.

Noted

> 
>> +        *
>> +        */
>> +       if (XE_DEVICE_WA(tile_to_xe(tile), 14022085890) ||
> 
> Is there a reason not to move this bug ID check up to
> pc_needs_min_freq_change() also so we just check everything in one
> place?
> 

There wont be any problem, can be moved inside the function and
just return true at first if WA is applicable otherwise only go further.

Thanks,
Naresh

> Thanks,
> Stuart
> 
>> +           pc_needs_min_freq_change(pc))
>>                  ret = pc_set_min_freq(pc, max(BMG_MIN_FREQ,
>> pc_get_min_freq(pc)));
>>   
>>   out:
> 

