Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70BEC43458
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 17:36:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A49110E225;
	Tue, 30 Jun 2026 17:36:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KIo1CvoO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D43610E225
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 17:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782840963; x=1814376963;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BPx6h4HqYd4kfrvCfDrUpdRuMPm0pUQNmo0HU4jAD7Y=;
 b=KIo1CvoOkYLBKu0lN9/exWC4DCCZM469qPWmWu1n493C0Nfajv7gnjGf
 uo/bZrNhaChb3/3TGtGTNUbqfM+glU9p7XJf/0aB8MaL1APUjvZP3mJz3
 N3MejK2JyMGZhwZ76gZjgbwvqTFMfByF8yPDBHMX+1gTWL5Iv8Gz+4Xz1
 pOwKZ/vBCmPiSQaw/812J2lBFo9t3tsR5lpg2fLWWpqr4Gd2rDy05Nww/
 HgkgqD6YkPhxVv60ndAF3tCHePyRyKjJMq2W0rDcWM8qCNMqahtJB65BJ
 uiyxIEGQsCcJbLtAK0dvyt48oVT8PONHfSXyhcQ0TXTjXJ6qD0Gm+o0o/ Q==;
X-CSE-ConnectionGUID: AuxUBKy2TnO3Oh4lie2CCQ==
X-CSE-MsgGUID: keDsUOmeRpuIp8sxAeuowQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="87398702"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="87398702"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 10:36:03 -0700
X-CSE-ConnectionGUID: iFrdJg0GQFe3apaSiKxL+A==
X-CSE-MsgGUID: 41ZgJglbQRyBldLvTkoeKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="252978883"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 10:36:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 30 Jun 2026 10:36:02 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 30 Jun 2026 10:36:02 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.68) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 30 Jun 2026 10:36:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I7Xvn3mqIW7v1+nMi45/WtMb19Cjc5Ux/rAk/k5MUaY79M/p4qKUHlARleyOBFpmH5GR3i9nIM/Z9tk5OFa1XFtcMZMGUaAqY6nK4adVmjgGPTnZqtlzKieIIl+a0HN6O4ffr9fep4T9AuYZRqs7ir2xR5V97gc9SbdvM8lpz+8Zp8+IeE+i0zORCkrYVLL7564goa+G553kogG/tq3hYZPO9ckpd2ncwm9Fn1TGVDY7JitfIBfZxxUsbHKnRvfUGQa34F8b5yWBWTZq7EJCIRr8QxG6zUHYEklljdhXBWEyoTR8fuLAyJL0IlHcNAHezYlJ65s+0klegcfM/RPCbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1d9Xu407CqL7flrrz+KUtUpF9IrNejxxd+TA3UkRrIc=;
 b=k0ytWymARsyAGLvjwA/RLyIsV3ooUN1wTkCJXDlmveDf3LQKrv8XAexATTVoTfCOBLv8KRaEpIWsf+5nWwGskFnQcbeVheV4uwQVpAvmAiuNqUwDkYfAPo0ivdlTMl/CHtScx333ZMHIJMQSl3g4CBB5y9ZL4fD9o5dFKtDEBckKhiWkhv+r6WBMqDFE1A2uP/LwjB07KpCjPnNBn8+LPDZsAU7RDSykRMmi0VGj09kPP6WonsHKdkjSUpw74jHn/35/Sxi6ViKY8aH7QuFuGfbBbRwEAnFMTOMUHOZbvNwBlR+vnAFJ7S66R0xTnrFtPdTd/I7C0K7ulE3TMxbADQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by PH3PPF76AA2D882.namprd11.prod.outlook.com (2603:10b6:518:1::d30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 17:35:59 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::e0e6:a2f:a53b:4414]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::e0e6:a2f:a53b:4414%4]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 17:35:59 +0000
Message-ID: <81ecaed7-47cf-4b13-9c0a-31e7bf189a54@intel.com>
Date: Tue, 30 Jun 2026 13:35:57 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/guc: Compress GuC log and CTB dump with zstd
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260629172239.2377117-1-zhanjun.dong@intel.com>
 <20260629172239.2377117-3-zhanjun.dong@intel.com>
 <akNG5Nv/dp6+m4mP@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <akNG5Nv/dp6+m4mP@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0057.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::32) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|PH3PPF76AA2D882:EE_
X-MS-Office365-Filtering-Correlation-Id: c0e0c887-2646-42ac-03c0-08ded6ce0c93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|11063799006|18002099003|4143699003|3023799007|6133799003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 3jHXutRkNS9DXbyH+MlPY4DnPjHlUAQ2clyvFr8mzF7RW/rriCyohItBEe9JsntnL3fAk67x1elvMQGcjZWUyh6/+A+rrj65xj0NiVCR/ElaTkKXL92o3+LI66+MvcV/zkkLXAkgDTNelZf22nrJmvzlRrf9+vLIXlRime/TfUaxwSgcWW7bCENjPPynjv7mdo+Yqa3s13wDU/BHzlJpWkG3Gnma/S7cgjU6Gbt1UsfFkZCTepCB1YtenPUlut0lTFEgGS1CygOozAI6tx1+Z6Y6NjmN9dgu9p1gO4To1gdv3MH4FfS8mVpaRTx3ecIZ647cb1ux/xjuFaLRkl9zRw5a8I/fpFCHumW/7So1lKSXYKVXTNCAHfy5jS0yX0bnKSBtWbgKqObiAVaC9cEn7YyJwVCssaDJZdKrvjt+d6C/DN4qBm+iu27hAAgEQZ3WMfcrFnj9kIyJoSCAL3arVy6wSPJH/k8ZbcLWGHa+6RNhfubrL6/+khM37iso3Ff9lkW7RoWuss2yG1aBIZ8D2QsbZScKP1ifx860OD5feCZm0btWFRUyPTmO75RIApeWIysyXiQs9OA8XMCkD/bVGjELiY11M1aG7JNRz5bTH0vrW9UOz61+dXDeWoM6R4msmwJWwqyY3lI/okSWZchCIIQ/a98oGbe5vTsYsNHL9mw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(11063799006)(18002099003)(4143699003)(3023799007)(6133799003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFpsT0RYVTlVMnFlL3FWT1pBeGxmY0VLMWdXeWViK091dSt3R2JmRnFXS0tx?=
 =?utf-8?B?WFYvNWt6ZmRySmJLZDNNb3NmRVFhaWF4c2dZSTlLeGFiR21vTnhUK1o0S2VW?=
 =?utf-8?B?UmlydlBTOHZESVRzVlRIVThnL3Q5aE9UOGdEVUNXdUoxWXIyZ3VpWHlKVkdq?=
 =?utf-8?B?RFEvN1JqWWhwMXpwSmVBdS9MNzRHWHZibjFlNXgyeEJQdlAzSFJGUFNYMEl4?=
 =?utf-8?B?bjMxL2VnMUFQYzRLM2FBSzNuWGV6RVNmdFFhQkZhMUN5b2NuR3laVkdqb1Ex?=
 =?utf-8?B?dWpMaDFWcmhNcVZieDhZK0dkNGVLN2lDU3dYeHlhamdqYTRoRU4rMkU3OVY4?=
 =?utf-8?B?ZnhUbkIwYjV1Qkl1NStHeWlBdGUzTTRYQUhkU1JTSWkrd01TdFY0b05BaXBV?=
 =?utf-8?B?ZWtEbjRuZyttYkcxeWJWQ09ZUHl1VDlMOWhYbzVTS3pMYWJtNjdSNEpXK25Z?=
 =?utf-8?B?STRmYUhNWFlmMk1jWE5iVkM5ZllJYTJ5N2NvdDMrTHZ3bmQ0dVgwc2ZlSHpz?=
 =?utf-8?B?UkhkczFmbDJFbVVKQk4yZ2NJaVhNK2pLc0VHcVVGR2loUFZJUHZDTmxGcG5p?=
 =?utf-8?B?OUVUU0draitCcVJ6WGUwRVlkNEF1Y2ppd0VnM2hJaERLZkE1ZjNlWmloRUl5?=
 =?utf-8?B?MG5jeG9xWk1BWGlocGNQVzM4RG5vRGNQMWJZZytrZjgxZmI4N2hvSy91eS9a?=
 =?utf-8?B?UE4xTGZwbXR3VG94dnRwVWZxNWpIaWsyUy9sKzkxSmprQnRCSDVUekVQVENw?=
 =?utf-8?B?WVd1UVFHV1N5KzNlUXV1VVVRM3pxK2RwWmJ5c011WExtRy8rTlJoTlFHSUVh?=
 =?utf-8?B?cjN1K01zTmZsdU1oSlJia3M1NllLQjdrdFp5MDlHT0R4MmxpOTQvbkZNTklD?=
 =?utf-8?B?bEs5TEoxenFzZk1LK21nZEZ0bUNWbVE4bjBPT3c1T2g0MlZuODU3cExSRkla?=
 =?utf-8?B?SmxIZlA0NSs4emZNaTkwK0FieTl3a1FNejZOTWJZMi9MSlB3eHllT3lqd0tG?=
 =?utf-8?B?MlVYemxZOTZuZU9RMnZPWmFId2JiUzV3UVlEalRoRnRkakN5SFUvMWEra2I4?=
 =?utf-8?B?UERoblFXbllhdU5ySUhTb1RTUGdDUlFnVzdQenBEb2dFTURJb1NhQzFzNlpS?=
 =?utf-8?B?TDdUZFphQU8vTTZWKytrVjBOMFowZTVKRTM2RStDNisyeTZpZFdFU25CYm9G?=
 =?utf-8?B?dG5pc0s4TGtTcUQ5WGxKR29SWmpuVFh0cFo0V2pWekZ6WWR6VVlXNVZSRnVY?=
 =?utf-8?B?VmtBMkYwVk1uZG01UHZLQXE3RnQ3U2wyY3BhR2wyaTYrQ3pYaERFL0tZK0Nm?=
 =?utf-8?B?SVhGVEd5SXlOQ1g2Snh4UUJnLzZyU2UzYmFnckRWNWhEdGdxb0FVOXdrUDQz?=
 =?utf-8?B?amVWMEVYODdIZ0p4a04rMGkrMmxTSTVOckpLRGhFSXRialJzakt6Y1AwcTg3?=
 =?utf-8?B?b00wZWxVczViaVZyVC8vZXpoTnBoQjg3ZTdicFNONWVMMkxZaHh5OFJKWis0?=
 =?utf-8?B?SGVTN0ZXakNzMVlyZytLb2NhUFpjTkk2bFc1RWJQYnF3S1lIU2ZURkZWdWFP?=
 =?utf-8?B?U1VwOHhSYnFyZ29YSU1iYUFSYjNTeCs1Q3JYMGIra3RQUUtGVkFHUlZvZDA1?=
 =?utf-8?B?cDRlVkFoRXl0eVVLTk5iV3FxN0ZiOEE1cjRjVm44ZlFXR0xXUHVRSloxZ3hL?=
 =?utf-8?B?c1dRcjNuMFl6ZFE0NkFzUjdBcTJYRHlYRTE0c0d2Z000UHFQc1lQcEptNzZr?=
 =?utf-8?B?ZlQ3dUlCYkxqZG1aekMzdHVIRmMxN0NxU0dOOE9oT0NWWGlsUHZFb3k2YUxl?=
 =?utf-8?B?VDBJUHlKVkQraDFpTzVSU3ZrQndJbk9wQ3pWMXRpc0tmVnMrekR5ZlpPeFFH?=
 =?utf-8?B?ZUxzZGZ4UCszVWNCR21YRklOT2lqdkxickgzYUFoUFpiQmExOGdkZ1VaUEVB?=
 =?utf-8?B?Myt0cVRNUkNDQzg3U0pPQlhjV2gwWlIxRzJCSFVyTHF3VndHRWJack9Ma1Az?=
 =?utf-8?B?Y2JQUzdLT3FUcU9sMkVJRFBZODBxMVc4aWpHUnJ0dWprbHBUc3RrTXlXYWtI?=
 =?utf-8?B?K1lDSVhUckRrTnZtZXQ2dlJnZmtZeU9nNmxUdlFSL0laazJoM2czL3N4RGUx?=
 =?utf-8?B?OUp0RmNzaVNhQ1BpbjZxYVlSNWozK09pc1dKZUtVRHVjWjlpRFc5WEYrUGNH?=
 =?utf-8?B?Rm02UHYrVXJLL2ZnWUt2dFQ0VlphOXNTRUhheXljZU1Tc1JYLzl4NmlZZVM2?=
 =?utf-8?B?OW5yUk1BdXcycU9kQkRQSnhvRTE0N0NKalFGNFNpVzhwUGZha21KRE4wMU5w?=
 =?utf-8?B?U2pKQ3ZlSGxSV1FXWTNveml1TU9uNm5mZzBBc3lmL1BBYTNNOVlWaDA1cjBE?=
 =?utf-8?Q?U8i62BfGEfNH/498=3D?=
X-Exchange-RoutingPolicyChecked: YAN6+o4tw3LMpMHT47G+QaluXzU4TsPNNaI2ZanjgrRkukqs4eftLYmn77iqBmJXxypJ8Du3Ome9cggoYATbZ3zWcRG0aV+2LIWSjgpddCzU+Drz3QlYFwaOuyvH2/QX+hpRSF19SSWbBqyNJKnS9C4gbAAZRGlVdz08Z4HssH59Rx2n7g4xKpgrogQuVmBhBTZo8BVR6Diytj5PMFDzOEEPD78EF+h7Q7sU4ktKZNCyhEOkUMQKwQWP2DS8/JvMYf/aL7vmPwBjasIEQLbmRbbo8tSkoFcjbef0JJb73PFRaifa2psQIqkKuqHZw1EauUXS7+xR5I7bZMYOhsNmkQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c0e0c887-2646-42ac-03c0-08ded6ce0c93
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 17:35:59.7463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jprGTCAb+pe0ksHpfg9J7lumuPYaqQR3ynqPZMLXMOQ/BrIn4aqSbM71MG/W+Rf5AXIXOvSg48rDK7lApSwNrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF76AA2D882
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

Please see my inline comments below.

Regards,
Zhanjun Dong

On 2026-06-30 12:32 a.m., Matthew Brost wrote:
> On Mon, Jun 29, 2026 at 01:22:39PM -0400, Zhanjun Dong wrote:
>> Replace the raw ascii85 dumps of GuC log snapshots with a
>> zstd-compressed ascii85 stream and reuse the same helper for CTB
>> snapshot output.
>>
>> Use zstd streaming with default level-3 parameters and an estimated
>> source size of 0 so the compression workspace stays bounded even for
>> multi-megabyte logs.
>>
>> Add a new Kconfig option DRM_XE_COMPRESS_DUMP to control whether
>> GuC log and CTB dumps are compressed with ZSTD. This allows users to
>> choose between reduced dump sizes or lower memory usage.
>>
> 
> What is the advantage of doing this the KMD vs. getting the dump and
> compressing it in user space before sharing it?
1. Timing impact
There are KMD runtime challenges about dump too many data:
a. Skip unused data.
Existing code dumps whole buffer, which also prints out area not used 
(Like lots of lines of "Z"). This patch only print valid range in buffer.
b. Compessed size
Test shown a typical 75% compression ratio about valid GuC log data.

Print out 10MB debug data in ascii85 take quiet a lot of time, 
especially when print out to dmesg. Too long print out might cause 
timing impact to runtime, which is bad for debug purpose.
With fewer data, this relifes KMD pressure when triggered.

2. UMD utility required
Do it in UMD requires an utility running in background and check/receive 
for data. If through debugfs, all above timing impact is not skipped.
This add extra step for CI and user, in case of utility missing/offline, 
the valueable issue data would be lost

Meanwhile, there is discussion to have that kind of utility, will keep 
monitoring it.
> 
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Kconfig          |  16 +++
>>   drivers/gpu/drm/xe/xe_devcoredump.c |   4 +-
>>   drivers/gpu/drm/xe/xe_guc_ct.c      |  19 ++--
>>   drivers/gpu/drm/xe/xe_guc_ct.h      |   4 +-
>>   drivers/gpu/drm/xe/xe_guc_log.c     | 161 +++++++++++++++++++++++++---
>>   drivers/gpu/drm/xe/xe_guc_log.h     |   9 +-
>>   6 files changed, 184 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>> index 4d7dcaff2b91..3af15a0c14f7 100644
>> --- a/drivers/gpu/drm/xe/Kconfig
>> +++ b/drivers/gpu/drm/xe/Kconfig
>> @@ -33,6 +33,8 @@ config DRM_XE
>>   	select ACPI_WMI if X86 && ACPI
>>   	select SYNC_FILE
>>   	select CRC32
>> +	select ZSTD_COMPRESS if DRM_XE_COMPRESS_DUMP
>> +	select ZSTD_DECOMPRESS if DRM_XE_COMPRESS_DUMP
>>   	select SND_HDA_I915 if SND_HDA_CORE
>>   	select CEC_CORE if CEC_NOTIFIER
>>   	select VMAP_PFN
>> @@ -101,6 +103,20 @@ config DRM_XE_PAGEMAP
>>   
>>   	  If in doubt say "Y".
>>   
>> +config DRM_XE_COMPRESS_DUMP
>> +	bool "Enable ZSTD compression for error dumps"
>> +	depends on DRM_XE
>> +	default y
> 
> Are tools to decode GuC logs updated to handle this mode?
Current intel_dump_decode only support i915, we need more Xe debug 
support.>
> Matt
> 
>> +	help
>> +	  Enable this option to compress GuC log and CTB dumps with ZSTD
>> +	  compression. This can significantly reduce the size of error dumps
>> +	  but requires additional memory for compression workspace.
>> +
>> +	  Disable this option if you want to save memory or prefer uncompressed
>> +	  error dumps for debugging.
>> +
>> +	  If in doubt say "Y".
>> +
>>   config DRM_XE_FORCE_PROBE
>>   	string "Force probe xe for selected Intel hardware IDs"
>>   	depends on DRM_XE
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>> index 5f2b90b18f97..27473c25aad2 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>> @@ -115,9 +115,9 @@ static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
>>   	drm_printf(&p, "\tTile: %d\n", ss->gt->tile->id);
>>   
>>   	drm_puts(&p, "\n**** GuC Log ****\n");
>> -	xe_guc_log_snapshot_print(ss->guc.log, &p);
>> +	xe_guc_log_snapshot_print(ss->guc.log, &p, ss->gt);
>>   	drm_puts(&p, "\n**** GuC CT ****\n");
>> -	xe_guc_ct_snapshot_print(ss->guc.ct, &p);
>> +	xe_guc_ct_snapshot_print(ss->guc.ct, &p, ss->gt);
>>   
>>   	drm_puts(&p, "\n**** Contexts ****\n");
>>   	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 21e0dad9a481..4cedbcdb831e 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -2094,11 +2094,12 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct)
>>    * xe_guc_ct_snapshot_print - Print out a given GuC CT snapshot.
>>    * @snapshot: GuC CT snapshot object.
>>    * @p: drm_printer where it will be printed out.
>> + * @gt: GT structure for error reporting
>>    *
>>    * This function prints out a given GuC CT snapshot object.
>>    */
>>   void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
>> -			      struct drm_printer *p)
>> +			      struct drm_printer *p, struct xe_gt *gt)
>>   {
>>   	if (!snapshot)
>>   		return;
>> @@ -2112,11 +2113,10 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
>>   		drm_printf(p, "\tg2h outstanding: %d\n",
>>   			   snapshot->g2h_outstanding);
>>   
>> -		if (snapshot->ctb) {
>> -			drm_printf(p, "[CTB].length: 0x%zx\n", snapshot->ctb_size);
>> -			xe_print_blob_ascii85(p, "[CTB].data", '\n',
>> -					      snapshot->ctb, 0, snapshot->ctb_size);
>> -		}
>> +		if (snapshot->ctb)
>> +			xe_guc_print_blob(gt, p, "[CTB]", "[CTB].data",
>> +					  &snapshot->ctb, 1,
>> +					  snapshot->ctb_size, snapshot->ctb_size);
>>   	} else {
>>   		drm_puts(p, "CT disabled\n");
>>   	}
>> @@ -2150,9 +2150,10 @@ void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot)
>>   void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
>>   {
>>   	struct xe_guc_ct_snapshot *snapshot;
>> +	struct xe_gt *gt = ct_to_gt(ct);
>>   
>>   	snapshot = guc_ct_snapshot_capture(ct, false, want_ctb);
>> -	xe_guc_ct_snapshot_print(snapshot, p);
>> +	xe_guc_ct_snapshot_print(snapshot, p, gt);
>>   	xe_guc_ct_snapshot_free(snapshot);
>>   }
>>   
>> @@ -2250,10 +2251,10 @@ static void ct_dead_print(struct xe_dead_ct *dead)
>>   	drm_printf(&lp, "\tTile: %d\n", gt->tile->id);
>>   
>>   	drm_puts(&lp, "**** GuC Log ****\n");
>> -	xe_guc_log_snapshot_print(dead->snapshot_log, &lp);
>> +	xe_guc_log_snapshot_print(dead->snapshot_log, &lp, gt);
>>   
>>   	drm_puts(&lp, "**** GuC CT ****\n");
>> -	xe_guc_ct_snapshot_print(dead->snapshot_ct, &lp);
>> +	xe_guc_ct_snapshot_print(dead->snapshot_ct, &lp, gt);
>>   
>>   	drm_puts(&lp, "Done.\n");
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>> index 767365a33dee..2005d1a0cd6c 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>> @@ -10,6 +10,7 @@
>>   
>>   struct drm_printer;
>>   struct xe_device;
>> +struct xe_gt;
>>   
>>   int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct);
>>   int xe_guc_ct_init(struct xe_guc_ct *ct);
>> @@ -24,7 +25,8 @@ void xe_guc_ct_flush_and_stop(struct xe_guc_ct *ct);
>>   void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>>   
>>   struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct);
>> -void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_printer *p);
>> +void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_printer *p,
>> +			      struct xe_gt *gt);
>>   void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
>>   void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>> index 538d4df0f7aa..d20be1a064f1 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> @@ -6,6 +6,9 @@
>>   #include "xe_guc_log.h"
>>   
>>   #include <linux/fault-inject.h>
>> +#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
>> +#include <linux/zstd.h>
>> +#endif
>>   
>>   #include <linux/utsname.h>
>>   #include <drm/drm_managed.h>
>> @@ -225,16 +228,148 @@ struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log,
>>   	return snapshot;
>>   }
>>   
>> +#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
>> +static void xe_guc_print_blob_compressed(struct xe_gt *gt, struct drm_printer *p,
>> +					 const char *length_label, const char *data_label,
>> +					 void **chunks, int num_chunks,
>> +					 size_t chunk_size, size_t total_size)
>> +{
>> +	zstd_parameters params;
>> +	zstd_cstream *cstream;
>> +	zstd_out_buffer outbuf;
>> +	size_t wksp_size, dst_size;
>> +	size_t remain, ret;
>> +	void *wksp = NULL;
>> +	char *dst = NULL;
>> +	int i;
>> +
>> +	/*
>> +	 * Pass 0 as estimated_src_size to use zstd level-3 defaults
>> +	 * (windowLog=18, 256KB window). Passing the full total_size would
>> +	 * cause zstd to inflate windowLog proportionally (e.g. windowLog=24
>> +	 * for a 19MB log), making the workspace tens of MB.  With 0, the
>> +	 * workspace stays ~1.5MB, well within kmalloc limits.
>> +	 */
>> +	params = zstd_get_params(3, 0);
>> +
>> +	wksp_size = zstd_cstream_workspace_bound(&params.cParams);
>> +	wksp = kvzalloc(wksp_size, GFP_KERNEL);
>> +	if (!wksp)
>> +		goto err;
>> +
>> +	dst_size = zstd_compress_bound(total_size);
>> +	dst = kvzalloc(dst_size, GFP_KERNEL);
>> +	if (!dst)
>> +		goto err;
>> +
>> +	cstream = zstd_init_cstream(&params, 0, wksp, wksp_size);
>> +	if (!cstream) {
>> +		xe_gt_err(gt, "failed to init zstd cstream\n");
>> +		goto err;
>> +	}
>> +
>> +	outbuf.dst = dst;
>> +	outbuf.size = dst_size;
>> +	outbuf.pos = 0;
>> +
>> +	remain = total_size;
>> +	for (i = 0; i < num_chunks && remain; i++) {
>> +		size_t size = min(chunk_size, remain);
>> +		zstd_in_buffer inbuf = { .src = chunks[i], .size = size, .pos = 0 };
>> +
>> +		while (inbuf.pos < inbuf.size) {
>> +			ret = zstd_compress_stream(cstream, &outbuf, &inbuf);
>> +			if (zstd_is_error(ret)) {
>> +				xe_gt_err(gt, "zstd_compress_stream failed: %s\n",
>> +					  zstd_get_error_name(ret));
>> +				goto err;
>> +			}
>> +		}
>> +		remain -= size;
>> +	}
>> +
>> +	do {
>> +		ret = zstd_end_stream(cstream, &outbuf);
>> +		if (zstd_is_error(ret)) {
>> +			xe_gt_err(gt, "zstd_end_stream failed: %s\n",
>> +				  zstd_get_error_name(ret));
>> +			goto err;
>> +		}
>> +	} while (ret > 0 && outbuf.pos < outbuf.size);
>> +
>> +	drm_printf(p, "%s.length: 0x%zx -> 0x%zx Algo: ZSTD\n",
>> +		   length_label, total_size, outbuf.pos);
>> +	xe_print_blob_ascii85(p, data_label, '\n', dst, 0,
>> +			      DIV_ROUND_UP(outbuf.pos, sizeof(u32)) * sizeof(u32));
>> +	goto out;
>> +
>> +err:
>> +	drm_printf(p, "%s.length: 0x%zx Algo: ERROR (compression failed)\n",
>> +		   length_label, total_size);
>> +out:
>> +	kvfree(dst);
>> +	kvfree(wksp);
>> +}
>> +#endif
>> +
>>   /**
>> - * xe_guc_log_snapshot_print - dump a previously saved copy of the GuC log to some useful location
>> - * @snapshot: a snapshot of the GuC log
>> - * @p: the printer object to output to
>> + * xe_guc_print_blob - Print binary data (compressed or uncompressed) as ascii85
>> + * @gt: GT structure for error reporting
>> + * @p: drm_printer for output
>> + * @length_label: label prefix for the length/metadata line (e.g. "[LOG]" or "[CTB]")
>> + * @data_label: label for the ascii85 blob (e.g. "[LOG].data" or "[CTB].data")
>> + * @chunks: array of pointers to source data chunks
>> + * @num_chunks: number of elements in @chunks
>> + * @chunk_size: nominal size of each chunk; the last chunk may hold fewer valid bytes
>> + * @total_size: total uncompressed byte count across all chunks
>> + *
>> + * If CONFIG_DRM_XE_COMPRESS_DUMP is enabled, compresses @total_size bytes using
>> + * zstd level-3 streaming compression and prints the result via @p using ascii85
>> + * encoding. Otherwise, directly prints the uncompressed data.
>> + * On failure the function returns without printing the data blob.
>>    */
>> -void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p)
>> +void xe_guc_print_blob(struct xe_gt *gt __maybe_unused, struct drm_printer *p,
>> +		       const char *length_label, const char *data_label,
>> +		       void **chunks, int num_chunks,
>> +		       size_t chunk_size, size_t total_size)
>>   {
>> +#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
>> +	xe_guc_print_blob_compressed(gt, p, length_label, data_label,
>> +				     chunks, num_chunks, chunk_size, total_size);
>> +#else
>> +	/* Compression disabled, output uncompressed data directly */
>>   	size_t remain;
>>   	int i;
>>   
>> +	drm_printf(p, "%s.length: 0x%zx Algo: RAW\n", length_label, total_size);
>> +
>> +	/*
>> +	 * Print each chunk directly without merging into a single buffer.
>> +	 * xe_print_blob_ascii85() supports multiple calls - use suffix=0
>> +	 * for all but the last chunk to omit the newline between chunks.
>> +	 */
>> +	remain = total_size;
>> +	for (i = 0; i < num_chunks && remain; i++) {
>> +		size_t size = min(chunk_size, remain);
>> +		const char *prefix = i ? NULL : data_label;
>> +		/* Add suffix only on the last chunk */
>> +		char suffix = (remain == size) ? '\n' : 0;
>> +
>> +		xe_print_blob_ascii85(p, prefix, suffix, chunks[i], 0,
>> +				      DIV_ROUND_UP(size, sizeof(u32)) * sizeof(u32));
>> +		remain -= size;
>> +	}
>> +#endif
>> +}
>> +
>> +/**
>> + * xe_guc_log_snapshot_print - dump a previously saved copy of the GuC log to some useful location
>> + * @snapshot: a snapshot of the GuC log
>> + * @p: the printer object to output to
>> + */
>> +void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p,
>> +			       struct xe_gt *gt)
>> +{
>>   	if (!snapshot) {
>>   		drm_printf(p, "GuC log snapshot not allocated!\n");
>>   		return;
>> @@ -248,16 +383,9 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
>>   	drm_printf(p, "GuC timestamp: 0x%08llX [%llu]\n", snapshot->stamp, snapshot->stamp);
>>   	drm_printf(p, "Log level: %u\n", snapshot->level);
>>   
>> -	drm_printf(p, "[LOG].length: 0x%zx\n", snapshot->size);
>> -	remain = snapshot->size;
>> -	for (i = 0; i < snapshot->num_chunks; i++) {
>> -		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
>> -		const char *prefix = i ? NULL : "[LOG].data";
>> -		char suffix = i == snapshot->num_chunks - 1 ? '\n' : 0;
>> -
>> -		xe_print_blob_ascii85(p, prefix, suffix, snapshot->copy[i], 0, size);
>> -		remain -= size;
>> -	}
>> +	xe_guc_print_blob(gt, p, "[LOG]", "[LOG].data",
>> +			  snapshot->copy, snapshot->num_chunks,
>> +			  GUC_LOG_CHUNK_SIZE, snapshot->size);
>>   }
>>   
>>   static inline void lfd_output_binary(struct drm_printer *p, char *buf, int buf_size)
>> @@ -598,12 +726,13 @@ void xe_guc_log_print_dmesg(struct xe_guc_log *log)
>>   void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
>>   {
>>   	struct xe_guc_log_snapshot *snapshot;
>> +	struct xe_gt *gt = log_to_gt(log);
>>   
>>   	drm_printf(p, "**** GuC Log ****\n");
>>   
>>   	snapshot = xe_guc_log_snapshot_capture(log, false);
>> -	drm_printf(p, "CS reference clock: %u\n", log_to_gt(log)->info.reference_clock);
>> -	xe_guc_log_snapshot_print(snapshot, p);
>> +	drm_printf(p, "CS reference clock: %u\n", gt->info.reference_clock);
>> +	xe_guc_log_snapshot_print(snapshot, p, gt);
>>   	xe_guc_log_snapshot_free(snapshot);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
>> index 4649a260755e..3e97647ee8b5 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
>> @@ -11,6 +11,7 @@
>>   
>>   struct drm_printer;
>>   struct xe_device;
>> +struct xe_gt;
>>   
>>   #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
>>   #define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE	SZ_16M
>> @@ -59,7 +60,13 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p);
>>   void xe_guc_log_print_lfd(struct xe_guc_log *log, struct drm_printer *p);
>>   void xe_guc_log_print_dmesg(struct xe_guc_log *log);
>>   struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log, bool atomic);
>> -void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p);
>> +
>> +void xe_guc_print_blob(struct xe_gt *gt, struct drm_printer *p, const char *length_label,
>> +		       const char *data_label, void **chunks, int num_chunks,
>> +		       size_t chunk_size, size_t total_size);
>> +
>> +void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p,
>> +			       struct xe_gt *gt);
>>   void xe_guc_log_snapshot_free(struct xe_guc_log_snapshot *snapshot);
>>   
>>   static inline u32
>> -- 
>> 2.34.1
>>

