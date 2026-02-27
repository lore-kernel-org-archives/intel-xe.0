Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4389AFD5319
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 09:32:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0996210EACE;
	Fri, 27 Feb 2026 09:32:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mrTZLve1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8EA210EACE
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 09:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772184744; x=1803720744;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nvROcytwJjdCZsV1tsOTl5mAnc1uTW2vNHf06YeDdLg=;
 b=mrTZLve1juozpOivDkt/Lh1UyIMOLNi/7fvQKufPyryG3AkBauS2m6LH
 RxXBYNPUxmdKaBYsUGVAOqpqSY8w6XYCBnDp1U99PCJHZKI7xzEP1UMhi
 WXP3o6IpNrFmVbw6+mJBWKa3F1VLTai3vxgrgfx27540A5R7QX6RRgE7z
 D1mb50PyutvR2wkg0iDuto1oS4yL2ckYsZoEk0Ouf5roWlroea1Q593xw
 URLUvP1oNKnTW0uwQ6pgH/NppK8UyN3T+wRdxsE9/mnlOMxqoz1EUwxWw
 iffKf3a9igUYImfhCKZBz81hz/JBnDqyLAIn8tFjdEeukFBrezmrg9qMZ A==;
X-CSE-ConnectionGUID: ZgPijFtJTXC2ut7GXtEXxg==
X-CSE-MsgGUID: dDPGpyKXRGCNH9hfqG6hcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73309644"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="73309644"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 01:32:22 -0800
X-CSE-ConnectionGUID: 8KXp5Ft7S1qPqL9KfiCm9A==
X-CSE-MsgGUID: TXykb+RDTF2zA8sx2iWiCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="221470906"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 01:32:22 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 01:32:22 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 01:32:22 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.28)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 01:32:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZExfEamBf8W2FmdIKJWS8bjCGv0E3CLBOu9gpwqefw9zQRwlO2m3UupHeBQ3U+TvTlTFN4vIVDOPpTp4Y8Bf5Q988hQ2WpjYRP6cJTh9OYgxvGk/rMop5TwWZbpu5+LFr7czJd3rCkRZgao89nReLFEbbis/gPBYte4+8H4q4Se2bq3T+o8y1bWNez+HkilaHcCQXU5W9P4uSmglKI6rfz3eVWgUmfMLOTWPGiDCtrV9IbGWCdRfto9heYTiMuPBPmVNoDEjw8JmaEdKlh7pwjdP1/Xx0bZYOQulCi4XueJR+TIMrfNgSLAFio6QpS9TxamfzxwaSvJvRgVgPaizw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2UE9Uf4LysyE8fg9WDfwg/xdqT9I2QriG4p5QlsReqc=;
 b=BSx8mTMy2dy0aTnH2rz4B3R5kGdaF/G5S6taKfnSDifv4tbF7kyLOCBGWJGqsXaKRpniR1/0dp9+gcpEVMuIUpmmE5o3HZi4lwrqQc7mf/qIBkwMO6xjYdCvf9dXTDtYz7/ECyaW5nVwb5miYljHdpItXDBeYejcWm1n0F7maACNTYWUkmBBwYBkBcgZjjYRRybSjXgSE81T0ZN/IUY0qV9lPOGKnr9cF3Por8KIcNUBjuYEU0Eg/RUdJtBx5cCcBdVS/dGA8OMtYnELjkvcaB8W846b7ce8PNFnBYzGWoT05PB/7ZkAJfXi11V0VkK/3Bw9T6nowk+E3vYaGy28Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by DS0PR11MB6326.namprd11.prod.outlook.com (2603:10b6:8:ce::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 09:32:18 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9632.017; Fri, 27 Feb 2026
 09:32:18 +0000
Message-ID: <350ad95d-0e88-4207-9f90-0c061ac80363@intel.com>
Date: Fri, 27 Feb 2026 15:02:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/9] drm/xe/uapi: Add UAPI support for purgeable buffer
 objects
To: "Souza, Jose" <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Mishra, Pallavi"
 <pallavi.mishra@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
References: <20260211152644.1661165-1-arvind.yadav@intel.com>
 <20260211152644.1661165-2-arvind.yadav@intel.com>
 <90f98e02221b626eb0eb6fb5fb7986d1c10d1c52.camel@intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <90f98e02221b626eb0eb6fb5fb7986d1c10d1c52.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0167.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::15) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|DS0PR11MB6326:EE_
X-MS-Office365-Filtering-Correlation-Id: 236585ce-2c06-495d-a9c2-08de75e319ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: NnApU3tzQmWFhfE5MqLReCCBvqEhxkpiSCm9EeDKzfRUOx0e842wRGLwfxoIIaHI3vqAHtIgms5xsFazxHWWCdD0Yar6aqv6NE69paLST3gMMRk59EG/c5RW1brRS8PsZhabMlcNbAerxg/1xtZURphitardmPqejnS9/HxbiVeCKI10qm0QoVcuK2SayPOHR9utsxoDb5vMkmQm083Q5qiLI4xXYePYo933dBe02EQkZeeiAlfXj9A09WuMg1KxL9tzSAPKkBu3BlMZlPicF+dt5ZxJYFWs2aKV//eAyTCNNuXlOYObKcUXkyedm5cgbwGKs05LLZ9X4TQxn7zEjwtO7f9PHTivM7mWoGc3YXViJRvabARR/HZhSQYCdo7+Fc6w4gRZzKu6sRpzdUN6AWb7zLhxUi/cGPNyOnCUtehBnyQWhlksnTBQLJ4Mslo2oBXT0l6qd/w35wjheHqOtp2aQ449MkvjmUt5DCxX0fPWCLgh2UtpCsKk/X2EOrBfMVc7JPmUENipTjtP3yI3BPyGy3eEJ0xdSrar9ToEP84Wnm2owPEYtu41wVpkpS7u7V0gT5Xq2XOJoN1O2YHJHXCdfr6KzL4fdqyAsD7b/RhANNBYv6DK7H8hxycgKp+DAWxwgI9ZI0hwOBuGBlzPHm8pu1nEv+Ubxs98eIRkDZAvznGN14fQcXUI/MLj/zOJq/+gq/5uKLkON4jEipac90E7uvg7/i0d36wsMsNn8MQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clhVVTZnZlg4NkJhK2VSMmFXazBFOHFrQWRCRjhXaVpIWElaMiszUlg2Ti96?=
 =?utf-8?B?UTFlWTZmSGoyQUNWaklmaDVDeko4RXBqOFdUd1o4VG8rNERIaSthbnh2d29C?=
 =?utf-8?B?UStDTUNMQXhGa0JZdDFqdEYzTHhTRk9Ici9tYWxETGphMzVPWEpNRjlSVHVP?=
 =?utf-8?B?bUcvbmx5TU9abUp2RE5YeTFqeUlEdU5oMUNBc0xFZC9KZXgzRmIxbE84cnBZ?=
 =?utf-8?B?bHBOWGxoWDRXVjNnMGR2RjhXSHplNXBXc2tiS0dwemIva0hrWXFlNCsvRjJJ?=
 =?utf-8?B?em1jQ2JwMmpXUDRiZ3R1QlJQTm5yWmpMV2FMTjFJZitqQjBDQ09ORVRQUU9m?=
 =?utf-8?B?bzdoUEM2L3ZNYlArRGlXZi9ObDljSUJFZlhnSWprMlNnQkhhb0IzdzBMaEpD?=
 =?utf-8?B?cm56V1I4Z1kyTXUybnVHSUpvSXNRd21vOUNVQUxWWDZqYkxDYXhLTDA2dHVa?=
 =?utf-8?B?N3plcmdjUjdhbi9YQ2JUZ01XQ0dPc1BTdk5oZk8wMGdFcUdtUk5PN01RdVM0?=
 =?utf-8?B?Ukt0a3Npbjk0OEYwZmlvMjlSdXlMRTN1Z2JLTEd3RCtYS1ZGcDVMVENSR3BM?=
 =?utf-8?B?b1lYTk5qUHRuQUpoYUFIbmYwbk9BdXkxZmw4ckZMWHI2V2p1M2owd2RVWDNv?=
 =?utf-8?B?MXpLTVdFZytXalVidURuZXJ2dlBRcmpvY1FvbllyeVpkNktzZThwaUc2cGNt?=
 =?utf-8?B?QUVaNFRCVEdBZnliUVp5eE1neVV4SDhRWlpkbzFLUXVyOW5sTTJtclR3eWZu?=
 =?utf-8?B?dXJtTmEvTnUzL1lCZUxDQjFjQWFxVHZxbEE1ZnFQbUFkMkV1YVFyWUdSZzVr?=
 =?utf-8?B?bm14UWgwTnlsNlVwL3N0QU9oTndnVS84dDJYQnZjY3M3eEFCdXhMNkl2eXZJ?=
 =?utf-8?B?eGlSMmJmcU8zQ3lkQXE5a0w5cWthQTMwNDdzNGZaeVdDcklCdndMYmZEM1F2?=
 =?utf-8?B?ckxFaVVJbzkvWjR3Wi8rdDJHNU51bHQyVHRyclQ1Z2tYTC9sMXNhbzhSVExm?=
 =?utf-8?B?OHRUcDBCdlNzRWppaW80VktENGtoTTZYTkFjb0kycWhMS2NsdFNnQ05aeS9T?=
 =?utf-8?B?L1JCUU53WnVHcnoxSHF1YXRLdzB6cVM2YmxNVUlxUXBZZG1XeXgrdXFjYjBy?=
 =?utf-8?B?eEJVVzY2Nzlwd3NENmdMakE3emxidWJ1bXlxQ0lKanFBLzJPUzlpYm9QNGow?=
 =?utf-8?B?dWJWdlhDZFJmbXFmZUQxR2dyK2FNOVJMU0ZtOElWUWZnRDl6S25xSWlLOVFI?=
 =?utf-8?B?Vms4aHVhakp5RjViNDBGS2VvQmVJNVpVNkppNW0rRy94dlpzRkV5eWYwQ2Fh?=
 =?utf-8?B?RGt4b3FJWTF6OE1VU3dvQ2FEK3dkeitaWjBNcmxNYWhNeStPbW93Q0ZabVVD?=
 =?utf-8?B?ZDNPekpNS2Y5ck93SkdZYSt6cC9aTmZ5aStlVUFqS0FKOE1za3EvaDdTRVpT?=
 =?utf-8?B?QlhacjVSWDJoQlBUWnB1dWkvVENPUVA3SEdmOGxiWlhUcjA1ZkRoeitkVFZj?=
 =?utf-8?B?b21jUFBXZkZGRUJmdDNuQTYxb3B2U1RzVjQ0OW9MNkFCOEVFYVk0d254dGw5?=
 =?utf-8?B?ZlJnVnVZUkNCc1FPUzB5elpoZitEeGZ5WnlDUGFjWG1SNlAzWjI4R0hCRXFt?=
 =?utf-8?B?eExwVEpNNlM2dXpZMUZsSGtwd1R4Rm4yMy9DMXJUQTB3NXhYdkZIVS85U2hs?=
 =?utf-8?B?cHVaNHRhcHNGR0JucFRkTWRpOUtBMlF5Y3VKYUFRZ1BId29XcUVITDBTTWdX?=
 =?utf-8?B?d2g5bzcyWW4vMjNhVlhYRHd5M3VTOTNrdXBqZERydTZsUTA4OTk4dkVqbnh6?=
 =?utf-8?B?Nk5DRktYQTRtNytib0Y2bGxER1FCWDVZNFBxM2dHSEt0UUVRanE1WEh3UkJi?=
 =?utf-8?B?MlhSLytpNEVPT1g1WkxDVXFpU1BiY3hXaldwZkRXQnhOOE02MGdFU2tIWllz?=
 =?utf-8?B?M0VOakhTUjNYS0h2ZnlFV1lpRkJqbU5aKzRBclNyM09rYlNjS09aUjRtemFI?=
 =?utf-8?B?alVvdENBaGFEOW5UOGVLV1h5TU9ESVM0a3FWd0RJVko1R2N0ZWhWY2JxZHUv?=
 =?utf-8?B?YzZ1RDNzVXBMaDhwdTU5ckRsTVdJTHd2Znoxd2szZUUxU2Q3YnBvdmw2QTI4?=
 =?utf-8?B?N2NoSDN0VjVzSjNoaHMvUHlVUUVqbm1zR2RCbjd6TXg1NHdGM2J1MHN3MXQ1?=
 =?utf-8?B?c3BQMDhZWjN1V2RDTm9DVW5pWHJQNHYzWFF5bnhMSGxWcGNRZjY2UXhlOFBB?=
 =?utf-8?B?QnF5Z09TVGFST1l1RFJSZGtENEhmZ3htZGp0T2RKdy92Z1h1YVJIc3V0MzlP?=
 =?utf-8?B?V3UybXRyZG10U1p6SXcxdThtUUVld2RmMkVjTmhITTBJWmJPYTh1Zz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 236585ce-2c06-495d-a9c2-08de75e319ca
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 09:32:18.6472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XpANBAq1/rgW0Ho3AbMAU5aLFn2kU2K0grw/mE1GRuysMUthIwdKr4JrJr/0yERA8g4zj1i3baNk3BSTk7W2Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6326
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


On 26-02-2026 23:28, Souza, Jose wrote:
> On Wed, 2026-02-11 at 20:56 +0530, Arvind Yadav wrote:
>> From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>
>> Extend the DRM_XE_MADVISE ioctl to support purgeable buffer object
>> management by adding DRM_XE_VMA_ATTR_PURGEABLE_STATE attribute type.
>>
>> This allows userspace applications to provide memory usage hints to
>> the kernel for better memory management under pressure:
>>
>> - WILLNEED: Buffer is needed and should not be purged. If the BO was
>>    previously purged, retained field returns 0 indicating backing
>> store
>>    was lost (once purged, always purged semantics matching i915).
>>
>> - DONTNEED: Buffer is not currently needed and may be purged by the
>>    kernel under memory pressure to free resources. Only applies to
>>    non-shared BOs.
>>
>> The implementation includes a 'retained' output field (matching
>> i915's
>> drm_i915_gem_madvise.retained) that indicates whether the BO's
>> backing
>> store still exists (1) or has been purged (0).
>>
>> v2:
>>    - Add PURGED state for read-only status, change ioctl to DRM_IOWR,
>>      add retained field for i915 compatibility
>>
>> v3:
>>    - UAPI rule should not be changed (Matthew Brost)
>>    - Make 'retained' a userptr (Matthew Brost)
>>
>> v4:
>>    - You cannot make this part of the union (purge_state_val) larger
>>      than the existing union (16 bytes). So just drop the '__u64
>> reserved'
>>      field. (Matt)
>>
>> v5:
>>    - Update UAPI documentation to clarify retained must be initialized
>>      to 0(Thomas)
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Himal Prasad Ghimiray
>> <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   include/uapi/drm/xe_drm.h | 44
>> +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 44 insertions(+)
>>
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 077e66a682e2..3e2f145e7f8f 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -2099,6 +2099,7 @@ struct drm_xe_madvise {
>>   #define DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC	0
>>   #define DRM_XE_MEM_RANGE_ATTR_ATOMIC		1
>>   #define DRM_XE_MEM_RANGE_ATTR_PAT		2
>> +#define DRM_XE_VMA_ATTR_PURGEABLE_STATE		3
>>   	/** @type: type of attribute */
>>   	__u32 type;
>>   
>> @@ -2189,6 +2190,49 @@ struct drm_xe_madvise {
>>   			/** @pat_index.reserved: Reserved */
>>   			__u64 reserved;
>>   		} pat_index;
>> +
>> +		/**
>> +		 * @purge_state_val: Purgeable state configuration
>> +		 *
>> +		 * Used when @type ==
>> DRM_XE_VMA_ATTR_PURGEABLE_STATE.
>> +		 *
>> +		 * Configures the purgeable state of buffer objects
>> in the specified
>> +		 * virtual address range. This allows applications
>> to hint to the kernel
>> +		 * about bo's usage patterns for better memory
>> management.
>> +		 *
>> +		 * Supported values for @purge_state_val.val:
>> +		 *  - DRM_XE_VMA_PURGEABLE_STATE_WILLNEED (0): Marks
>> BO as needed.
>> +		 *    If BO was purged, returns retained=0 (backing
>> store lost).
>> +		 *
>> +		 *  - DRM_XE_VMA_PURGEABLE_STATE_DONTNEED (1): Hints
>> that BO is not
>> +		 *    currently needed. Kernel may purge it under
>> memory pressure.
>> +		 *    Only applies to non-shared BOs. Returns
>> retained=1 if not purged.
>> +		 */
>> +		struct {
>> +#define DRM_XE_VMA_PURGEABLE_STATE_WILLNEED	0
>> +#define DRM_XE_VMA_PURGEABLE_STATE_DONTNEED	1
>> +			/** @purge_state_val.val: value for
>> DRM_XE_VMA_ATTR_PURGEABLE_STATE */
>> +			__u32 val;
>> +
>> +			/* @purge_state_val.pad */
>> +			__u32 pad;
>> +			/**
>> +			 * @purge_state_val.retained: Pointer to
>> output field for backing
>> +			 * store status.
>> +			 *
>> +			 * Userspace must initialize this field to 0
>> before the
>> +			 * ioctl. Kernel writes to it after the
>> operation:
>> +			 * - 1 if backing store exists (not purged)
>> +			 * - 0 if backing store was purged
>> +			 *
>> +			 * If userspace fails to initialize to 0,
>> ioctl returns -EINVAL.
>> +			 * This ensures a safe default (0 = assume
>> purged) if kernel
>> +			 * cannot write the result.
>> +			 *
>> +			 * Similar to i915's
>> drm_i915_gem_madvise.retained field.
>> +			 */
>> +			__u64 retained;
> why do you need a u32 pad and a u64? why not use pad and drop the last
> u64?


The __u64 retained field is a pointer to userspace memory where the 
kernel writes the output, not a direct value. Userspace pointers in uAPI 
must be __u64 to work on both 32-bit and 64-bit systems.

>
>> +		} purge_state_val;
>>   	};
> This is missing a new flag like
> DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT to tell UMDs if
> running Xe KMD has support for purgeable madvise.


I will add DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING for purgeable madivse 
support.

Thanks,
Arvind

>
>>   
>>   	/** @reserved: Reserved */
