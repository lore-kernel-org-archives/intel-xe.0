Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24834C43458
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 12:28:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E5D10E5D7;
	Fri,  3 Jul 2026 12:28:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NKpZiqEB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B181510E5D7
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 12:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783081728; x=1814617728;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3hkBOvUVCGCpCczPBJVyq0HBjPEQznrezPaM5A/mwQ0=;
 b=NKpZiqEBxDCor766jF0tD5Rx91I5E5igGqK7VUdanu0fVMfc7I9jDLly
 VLuNH8Kp+uDN3GCFbMaBNVSjQuWAqbU7EUFDFpVB20sbfd2Tc+f/CYMBn
 7mUwvFl7XRZl4/c1wx2UJTEK2AMuJRGDO/NY8DGF6gstniMFoVtuN5wdL
 QZxZoQc6KY/ZKZ5XGtX+iKCXWxDn2nJ0mW1cHvH1BALIK6mD5taB+hbUK
 9kYW5DxC7J4rvAzNvqMfvj8WIk58INTvkg3GKzZwpJ8jq54R8tX9Absu/
 qmRxg8Fnl3q4BbKWjXBnetQstQYJzVqvzY0ilpH1B1RnuVscIgdNYTdpN A==;
X-CSE-ConnectionGUID: zk2I9V54QmqL4Fo5Oa94aw==
X-CSE-MsgGUID: pTjlWll9SB6+lSiECriWcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="87663181"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="87663181"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 05:28:47 -0700
X-CSE-ConnectionGUID: m1focxnjQJqFQw6VSPDfTg==
X-CSE-MsgGUID: f49vMicGTC2+k8FAF5tJzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="248657142"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 05:28:47 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 05:28:47 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 05:28:47 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.5) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 05:28:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KLUqlXCeDPJTAXK2NtyhPbnMkhE6sbrX+/0f2QEc4cMVEhuMpFj1IcV12tPAJRZqHCCaAfCwQ9Mip5Nkg1FizMbgnTNQnm4WphvCWLcd1A9Hl2E4mw86ICbjBc4ZMKRWmrC9uX6NSwtwbqIA8wRLMJYHGXNl2tzF16WCjpibXfStma+6cby5i4HfsIt+gWpJH5HuqQbn6V7+bzVdbc/sBLoMD8qpYXqMWYk/uX87Vz1WQ5iYQxZp8dGn6kIfFDixPVnZGZjUYUQffy+gnh+TtYl/yi0vmahLXuSvl5/pPalolSyWJKSZe1iAww/F8LycZbHZj3SfoJogwzHrptaLlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1bPp+nfyfLp9OcqAi2KBGua/abcPwQlxM+S7A0AV8s=;
 b=Hma91c0Y/AMlFo9thrPD1v2N9ErWSy47xSxiRGdEqO22z77CkDYO2nxTqKhivIXx70bTeJnFVIUWwrYHaDvlCr32o8msYrUhQdaQwkM8uY3qVgVZHX4ynza7VPrX2Nnze48Z5294CRtp4CYJeIZpWuLBmSrHGGJS+HPPrH/fWaFzcANjoMJ/0mriZRLO2tz2LENZci4EJt+0LZRjiOnue4b+IpMd7BZP8G56J0aAyB7U02t3gg3YNYR7HQ5KIC+nk+kvXQq07iyAhMvN7IcfN1z1y6G4XnNbkUY5JYdGDq58JfRfgWxFsx2WjGZV1JCU7lSNUJpgrJzyDWaDtENptQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18)
 by DS6PR11MB9920.namprd11.prod.outlook.com (2603:10b6:8:464::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 12:28:44 +0000
Received: from DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c]) by DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c%6]) with mapi id 15.21.0181.008; Fri, 3 Jul 2026
 12:28:43 +0000
Message-ID: <c3784b7c-edd8-4d51-8173-007a750ef4b4@intel.com>
Date: Fri, 3 Jul 2026 17:58:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/xe/migrate: Revamp PAT index selection for migrate
 PTEs
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260702092829.206806-2-sanjay.kumar.yadav@intel.com>
 <c7e4c497-f305-49e4-b8f7-c697d8b13d9f@intel.com>
Content-Language: en-US
From: "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>
In-Reply-To: <c7e4c497-f305-49e4-b8f7-c697d8b13d9f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0028.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::12) To DS0PR11MB8208.namprd11.prod.outlook.com
 (2603:10b6:8:165::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8208:EE_|DS6PR11MB9920:EE_
X-MS-Office365-Filtering-Correlation-Id: 03a76ca9-33d6-4f0f-ff25-08ded8fe9f25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: bdV2QWXuka/6ebt6ng/ErIUkpUfMpWqBMNdqC6ND3mmgGln3JEwxAyu+Va0cfckBjB+3DGykX9cqsNKggkBh0Ye/tUCF7VOtg9clWHHLoAFekT4Zrx2HY4duPvQieeWCp5V7jzxc/vpojophdHReZ1EZKo1bHo9AxytW0x9o0PqF1qh93/m2mjQv4y9htpCjoZekdwBcbOl4oZZmkqi7RheHwcn6h7ZKOAAMmUk42MPBu5vtZkfzHvbfgg1MrbswNFSaaxWvX2Ae+WzFBfTFD+IVNRpqYxfhySgko4nwi015xhbDsmZ/rDCUHhLvwOZ5gMXS4YcLxTnU4nIjXYdhpXkqnHjfOWC6CXoopOrV2gF3zHHJnHi5wzBJtYuKCiAKfgPSAHH0IDDsEn5U2Mlhb1kVrmmElUBEoHZd6gyRBBbe9+/EBbmgru6htcMHYeR1ij2FQzGjIHoJ5e8n/SVnczvBs3dyCNMUrqM50uGNw3kcloSShknn9rQaVNh4+6cgJfTh8ZHPAPuUd7hW3Hi55jJtQBxOxEy08MHe3BUikuN/egyyJ5SufpnRGbUFP5S/sQJLZcXGIFYLKAHiiXoY1ietlFQiRLx7mn/gHsBekyC+I4k0hcnx8OU0lCtZKeyc4iYxo7ltLS53UReL01pRdDG4DVBmL6ZWiJxncpFKFvA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8208.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGJmcGxEM1VaaHdvSlFGcFQ5OW96eGFmazRvaG93Qjl1TUR6eHdtVld5RE16?=
 =?utf-8?B?NStSZFZSWFhKdFZGZWpZUVI0MlFxbzhEaVp1Y0xmeVk3dTVhQlMyazI2dkJy?=
 =?utf-8?B?RGpjZEx0Q21zamQvRmRDUk9pN0M5WTFzdFRtUWxCM1loenA1ZFhsT0dOSm03?=
 =?utf-8?B?d0VUMHhIRGhPTTJrcmFKdzJRNkp6a0ZhRWo0TWZoWHZ2NkhNbHhKT2dsakpu?=
 =?utf-8?B?Q010QkpiN2NsR2JwYk1MalA0TCtGL3E2VzZMVUl2S01EM0VvaWF1U2dPZ2NF?=
 =?utf-8?B?ZFQ2SUwwYVBnYlhEOHV0MFNoTTFrQlZLbVI5cTI5NDQ1RmZtcjdneVVyemhq?=
 =?utf-8?B?NzI1NmNBUWI1M3RPcVg2T0RFanVweUFRU0xMYkd6OE5mMW9WTFBKd0FiTlk3?=
 =?utf-8?B?MzBQVEhoaDV4Z0FVcW5oTHhiN1p3QmNyOG10a3RhczFBL3J3TVFNUXE1MkpO?=
 =?utf-8?B?d3ZQcVhwbmpabGpxV1hGZkh6V1g2YmQ3SHR3aERhbktrcVF0L3lmYzZDa2J3?=
 =?utf-8?B?LzQ5L1IybzF1K3U1cGJwRW5CMXBYbTFXRndsZ04xSzBuTUdXWTZzOUIzb1ky?=
 =?utf-8?B?b2VwbVdyTDEwWnM4K08yS1ZVQW41bnY3QXB1Z293TzBOeXZmQzA5Q3Bsd25K?=
 =?utf-8?B?UVBscTMxbzZoNTlsREhNcGpteU1aSjFMUlNCNHRkVWxHR0FvWEZtU00xWWZX?=
 =?utf-8?B?ZFd1bVdINzRJeG1ZMmtrYzRlOEozWFN5T2R5Tm50MHBMNDh4aTFOU3NBSk5k?=
 =?utf-8?B?OHlNN3JadHQ3VjFxdHhxb013T3JnVmdXL2Jqdzc0amhWS0RKbDRhZmhITVda?=
 =?utf-8?B?L28xaVF4blplblN0aE1hdkhWTTYzVkx0VHlQN2hUTFBjQmxhUUwvMWFzRVRr?=
 =?utf-8?B?NTdBSW9tclFSOXBGOVRlTmtXL0xVRGNRQzAwbDlwaVNXZXUrUy85cVpKdE1s?=
 =?utf-8?B?Z1JkV01kZnI3N2g5R3ZlT05abXllYVJhY0djbGZuMkxHRGV6V21aNXBSVlIv?=
 =?utf-8?B?Y2dkOW5GRU5DZzl4dzFhMVV3djBLN3JLb2V3bWFpNHVlYW02VnBWV3FiSHpo?=
 =?utf-8?B?Zk1iZUhRMUk4VzR3UkdOYVFaT0taTzh5SXU4bTB6SkxqaEJxUmNqL2NiQlgz?=
 =?utf-8?B?YWZveWRvMEJlOFA5TXJCQVJWSG5sZTh2OS9BUlJjZ3hnbWdmdE5oRDhOcWVT?=
 =?utf-8?B?WEJxMjQ3V3FheERsRjROYk03MEwxY2FlQlNJL1ZIMm0vZVgzdzlYY2dNWmlU?=
 =?utf-8?B?cEhEa1RJZXErWUZUYzRkQk56cmpBN2V2RlpFdlcvRmN5M3JjUEhoWTFCSkt5?=
 =?utf-8?B?c0RCU1REWFBHUXFlOVJGWnRBTXJSMXN5R2VpVVM3Tm56NCs3dUFmb0k4R2g4?=
 =?utf-8?B?eVJEQjY5Wnp6UFlaRUNzbHBIYjVrMUNlaDdWWkMzdVB5VG13SE92YkpBalhS?=
 =?utf-8?B?aG8zQU9tNzV0VG8wRFMzcGlpRld0ZXhCWlpIK05tdUJHOG1uTTIzeFJYVElv?=
 =?utf-8?B?aG1GbEZaZDJXcGNYdGw3dHRzZU5tTDdiVXlidWk2dlJUb1o0RVczK041VjdJ?=
 =?utf-8?B?ZUoxQ3FhYXQ4aTZSeWNNakxVUk1qLzFiQmM2bWtPUnpiSDlOenVwTjlwYWV5?=
 =?utf-8?B?WUo2R3YwQk9waVVmb2xJYVh3bEhQV3UzRDVZemI2Nis4RjlxbExNaUxwVU80?=
 =?utf-8?B?UU04R29LRlY0STNseFJHUnVYakpHVkZZWTNCbDZJMnAwNDJVcEY4R3gzVHEv?=
 =?utf-8?B?NkdDbTVxcFZaUnc0UW9ZWDZmZmFXTWR2Tis3b2pscEN1d3RFWmE4Z29GVFFZ?=
 =?utf-8?B?UStxV3R0WWQrNlBiMnNsd2ZYM3pTN1RBRy9wT2xpejQyemRadnJQb1hUbnVE?=
 =?utf-8?B?QXlRSmtDNWhoMzJKOGNTdmtaeE40MlNRYkRWYktEZXloREt0MTdnWGxQa1Z3?=
 =?utf-8?B?Vy82M3ptT3g2V3VWWk04MjAya2dFRlFxM2svNmF0azdSTTlUQmRVRklITEtH?=
 =?utf-8?B?Zml0M3NEeDg0NGVoYTdDNmFiZDJNMjJQMHVqb3h1TFVXOFFCQnNnNEw2UjRM?=
 =?utf-8?B?b21UemtWOGlObXpaK1k3eFZYMXFjVWRMQXZnM1B5MFpyNVRiK3c0VS9ESzFK?=
 =?utf-8?B?RURQNklGNnljdE1zMlBDb3F4bzJYS3NJYTBrWFgyZjBlT0pCODBubndBbHRs?=
 =?utf-8?B?MzVtaEl6T05hZXEwRndXbjFDNFUyYVNTdDF0TUM3ZHdhMmx5THRxZ0ZCM0ZK?=
 =?utf-8?B?Tzl6S0UvYklOU21zTEZFOCtrTXlKbXQ5ZGRyUlhRMnhvQzFNdlc2aG1Cd1Z2?=
 =?utf-8?B?ZTZpVmlRb1RLcHE1Yk5vbDFvb3FGblplQWRReHlNYklscnVDcHMwbi90MWdH?=
 =?utf-8?Q?K1HaccK887yyzOW4=3D?=
X-Exchange-RoutingPolicyChecked: Pe8yjJplazBtWWK3hjoYJxOwmIK/YDcmozIMRj4DMAK5vb5/LrzcaPbPlJ3zrFRuDVkZAT/bD++TyV5KXOpT5/TzfbmUFsdqaoWctJMZsbSgwJX87DC5UrITki88pS02Ky4jNDETXNB08HnK1lKbrBUKOcPgZHJJ1IoUvk46eGZZE5B68b8VzXzGsZT4gN0gFUpQduPth8z7UGKvhifKmkJiInzp6gdc3DbST9cF1EFDN2fkOUOAwtGdgqLrVaBCIWv3kTCizE2zgenyJ5Pp5iZKHofgIiu3UAPIjue8LxiOIEI+flumiOqNxctZsSi7N6PHu9zOy8uJ2KbUrKyrhA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 03a76ca9-33d6-4f0f-ff25-08ded8fe9f25
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8208.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 12:28:43.8229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kECYq+lVTFwuiYBnEsvt8FikFBja9+XAVjtpYhdgOxqNF2ZK5V0EcYtSx8R+uIrirO/w8WgvyhKoJ62JuocPBrtBQ5KQEhsmLa3wI2xLhmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB9920
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


On 02-07-2026 17:08, Matthew Auld wrote:
> Hi,
>
> On 02/07/2026 10:28, Sanjay Yadav wrote:
>> Improve PAT index selection logic in xe_migrate.c to avoid unnecessary
>> coherency overhead when host-side memory is uncached. Previously,
>> we defaulted to XE_CACHE_WB, which enforces 2-way coherency and may
>> trigger cacheline pulls from CPU even when host-side memory is never
>> dirty.
>>
>> This change introduces xe_migrate_pat_index() to choose the appropriate
>> PAT index based on the actual TTM caching mode of the buffer object
>> being mapped. For iGPUs with WC host mappings, we now prefer
>> XE_CACHE_NONE to skip coherency snoops. For compressed PTEs on newer
>> platforms, we select XE_CACHE_NONE_COMPRESSION.
>>
>> This avoids unnecessary cache traffic for uncached host mappings.
>>
>> v4:
>> - Keep xe_migrate_prepare_vm() on XE_CACHE_WB since page tables require
>>    page-walker coherency.
>> - Pass BO into emit_pte() and select PAT attributes from the BO's TTM
>>    caching mode.
>>
>> Assisted-by: GitHub Copilot:claude-sonnet-5
>> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>> ---
>>   drivers/gpu/drm/xe/tests/xe_migrate.c |  6 +--
>>   drivers/gpu/drm/xe/xe_migrate.c       | 66 ++++++++++++++++++++-------
>>   2 files changed, 52 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c 
>> b/drivers/gpu/drm/xe/tests/xe_migrate.c
>> index 3c1be809be82..7bd3c2aaa090 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
>> @@ -256,7 +256,7 @@ static void xe_migrate_sanity_test(struct 
>> xe_migrate *m, struct kunit *test,
>>           xe_res_first_sg(xe_bo_sg(pt), 0, xe_bo_size(pt), &src_it);
>>         emit_pte(m, bb, NUM_KERNEL_PDE - 1, xe_bo_is_vram(pt), false,
>> -         &src_it, XE_PAGE_SIZE, pt->ttm.resource);
>> +         &src_it, XE_PAGE_SIZE, pt->ttm.resource, pt);
>>         run_sanity_job(m, xe, bb, bb->len, "Writing PTE for our fake 
>> PT", test);
>>   @@ -434,13 +434,13 @@ static struct dma_fence *blt_copy(struct 
>> xe_tile *tile,
>>               xe_res_next(&src_it, src_L0);
>>           else
>>               emit_pte(m, bb, src_L0_pt, src_is_vram, false,
>> -                 &src_it, src_L0, src);
>> +                 &src_it, src_L0, src, src_bo);
>>             if (dst_is_vram)
>>               xe_res_next(&dst_it, src_L0);
>>           else
>>               emit_pte(m, bb, dst_L0_pt, dst_is_vram, false,
>> -                 &dst_it, src_L0, dst);
>> +                 &dst_it, src_L0, dst, dst_bo);
>>             bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>>           update_idx = bb->len;
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c 
>> b/drivers/gpu/drm/xe/xe_migrate.c
>> index 9428dd5e7760..c60a16a38518 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -117,6 +117,27 @@ static void xe_migrate_fini(void *arg)
>>       xe_exec_queue_put(m->q);
>>   }
>>   +static inline u16 xe_migrate_pat_index(struct xe_device *xe,
>> +                       enum ttm_caching caching,
>> +                       bool is_comp_pte)
>> +{
>> +    enum xe_cache_level cache_level;
>> +
>> +    /*
>> +     * Select the appropriate PAT index for buffer object PTEs 
>> programmed
>> +     * by emit_pte(). This does NOT apply to xe_migrate_prepare_vm()
>> +     * which must always use XE_CACHE_WB for page-walker coherency.
>
> Why must page-walker use XE_CACHE_WB? I think either we allocate the 
> paging structures as WB, in which case coherency matters, or we 
> allocate with WC, and coherency does not matter (the normal mode). See 
> also cached_pt. Essentially page-walker is often NOT coherent in the 
> first place.
>
> I agree we probably don't want to mess with that here, but comment 
> maybe needs to be tweaked? "We choose not to mess with 
> xe_migrate_prepare_vm() yet, for simplicity", or something.
right, the comment was misleading. The page-walker isn't always coherent.
will reword it.
>
>> +     */
>> +    if (is_comp_pte && GRAPHICS_VERx100(xe) >= 2000)
>> +        cache_level = XE_CACHE_NONE_COMPRESSION;
>> +    else if (caching == ttm_cached)
>> +        cache_level = XE_CACHE_WB;
>> +    else
>> +        cache_level = XE_CACHE_NONE;
>> +
>> +    return xe_cache_pat_idx(xe, cache_level);
>> +}
>> +
>>   static u64 xe_migrate_vm_addr(u64 slot, u32 level)
>>   {
>>       XE_WARN_ON(slot >= NUM_PT_SLOTS);
>> @@ -627,7 +648,8 @@ static void emit_pte(struct xe_migrate *m,
>>                struct xe_bb *bb, u32 at_pt,
>>                bool is_vram, bool is_comp_pte,
>>                struct xe_res_cursor *cur,
>> -             u32 size, struct ttm_resource *res)
>> +             u32 size, struct ttm_resource *res,
>> +             struct xe_bo *bo)
>>   {
>>       struct xe_device *xe = tile_to_xe(m->tile);
>>       struct xe_vm *vm = m->q->vm;
>> @@ -635,13 +657,18 @@ static void emit_pte(struct xe_migrate *m,
>>       u32 ptes;
>>       u64 ofs = (u64)at_pt * XE_PAGE_SIZE;
>>       u64 cur_ofs;
>> +    enum ttm_caching caching = ttm_cached;
>>   -    /* Indirect access needs compression enabled uncached PAT 
>> index */
>> -    if (GRAPHICS_VERx100(xe) >= 2000)
>> -        pat_index = is_comp_pte ? xe_cache_pat_idx(xe, 
>> XE_CACHE_NONE_COMPRESSION) :
>> -                      xe_cache_pat_idx(xe, XE_CACHE_WB);
>> -    else
>> -        pat_index = xe_cache_pat_idx(xe, XE_CACHE_WB);
>> +    if (bo && bo->ttm.ttm) {
>> +        caching = bo->ttm.ttm->caching;
>> +    } else if (res && res->bo) {
>> +        struct xe_bo *res_bo = ttm_to_xe_bo(res->bo);
>
> If we go via res->bo, why not just always do that? I don't think the 
> bo != res->bo. Also I dont think res shuld ever be NULL. 

Good point, thanks. res->bo should always give us the correct BO, and 
res should never be NULL in emit_pte()

>
>> +
>> +        if (res_bo && res_bo->ttm.ttm)
>> +            caching = res_bo->ttm.ttm->caching;
>> +    }
>> +
>> +    pat_index = xe_migrate_pat_index(xe, caching, is_comp_pte);
>>         ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
>>   @@ -1000,16 +1027,16 @@ static struct dma_fence 
>> *__xe_migrate_copy(struct xe_migrate *m,
>>               xe_res_next(&src_it, src_L0);
>>           else
>>               emit_pte(m, bb, src_L0_pt, src_is_vram, copy_system_ccs 
>> || use_comp_pat,
>> -                 &src_it, src_L0, src);
>> +                 &src_it, src_L0, src, src_bo);
>>             if (dst_is_vram && xe_migrate_allow_identity(src_L0, 
>> &dst_it))
>>               xe_res_next(&dst_it, src_L0);
>>           else if (!copy_only_ccs)
>>               emit_pte(m, bb, dst_L0_pt, dst_is_vram, copy_system_ccs,
>> -                 &dst_it, src_L0, dst);
>> +                 &dst_it, src_L0, dst, dst_bo);
>>             if (copy_system_ccs)
>> -            emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, 
>> src);
>> +            emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, 
>> src, src_bo);
>>             bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>>           update_idx = bb->len;
>> @@ -1279,9 +1306,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile 
>> *tile, struct xe_exec_queue *q,
>>               xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
>>               batch_size += EMIT_COPY_CCS_DW;
>>   -            emit_pte(m, &xe_bb_tmp, src_L0_pt, false, true, 
>> &src_it, src_L0, src);
>> +            emit_pte(m, &xe_bb_tmp, src_L0_pt, false, true, &src_it, 
>> src_L0, src,
>> +                 src_bo);
>>   -            emit_pte(m, &xe_bb_tmp, ccs_pt, false, false, &ccs_it, 
>> ccs_size, src);
>> +            emit_pte(m, &xe_bb_tmp, ccs_pt, false, false, &ccs_it, 
>> ccs_size, src,
>> +                 src_bo);
>>                 xe_bb_tmp.len = emit_flush_invalidate(xe_bb_tmp.cs, 
>> xe_bb_tmp.len,
>>                                     flush_flags);
>> @@ -1437,9 +1466,10 @@ struct dma_fence 
>> *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_off
>>           if (xe_migrate_allow_identity(vram_L0, &vram_it))
>>               xe_res_next(&vram_it, vram_L0);
>>           else
>> -            emit_pte(m, bb, vram_L0_pt, true, use_comp_pat, 
>> &vram_it, vram_L0, vram);
>> +            emit_pte(m, bb, vram_L0_pt, true, use_comp_pat, 
>> &vram_it, vram_L0, vram,
>> +                 vram_bo);
>>   -        emit_pte(m, bb, sysmem_L0_pt, false, false, &sysmem_it, 
>> vram_L0, sysmem);
>> +        emit_pte(m, bb, sysmem_L0_pt, false, false, &sysmem_it, 
>> vram_L0, sysmem, sysmem_bo);
>>             bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>>           update_idx = bb->len;
>> @@ -1663,7 +1693,7 @@ struct dma_fence *xe_migrate_clear(struct 
>> xe_migrate *m,
>>               xe_res_next(&src_it, clear_L0);
>>           } else {
>>               emit_pte(m, bb, clear_L0_pt, clear_vram,
>> -                 clear_only_system_ccs, &src_it, clear_L0, dst);
>> +                 clear_only_system_ccs, &src_it, clear_L0, dst, bo);
>>               flush_flags |= MI_INVALIDATE_TLB;
>>           }
>>   @@ -1868,6 +1898,7 @@ __xe_migrate_update_pgtables(struct 
>> xe_migrate *m,
>>       int err = 0;
>>       bool is_migrate = pt_update_ops->q == m->q;
>>       bool usm = is_migrate && xe->info.has_usm;
>> +    enum ttm_caching caching = ttm_cached;
>
> If we don't account for the type of memory in this path, maybe just 
> leave this path as-is for now? 

Agreed. I thought of to drop the changes to both 
__xe_migrate_update_pgtables() and build_pt_update_batch_sram() but 
somehow was kept from v3.

>
>>         for (i = 0; i < pt_update_ops->num_ops; ++i) {
>>           struct xe_vm_pgtable_update_op *pt_op = 
>> &pt_update_ops->ops[i];
>> @@ -1896,7 +1927,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
>>         /* For sysmem PTE's, need to map them in our hole.. */
>>       if (!IS_DGFX(xe)) {
>> -        u16 pat_index = xe_cache_pat_idx(xe, XE_CACHE_WB);
>> +        u16 pat_index = xe_migrate_pat_index(xe, caching, false);
>>           u32 ptes, ofs;
>>             ppgtt_ofs = NUM_KERNEL_PDE - 1;
>> @@ -2118,8 +2149,9 @@ static void build_pt_update_batch_sram(struct 
>> xe_migrate *m,
>>                          struct drm_pagemap_addr *sram_addr,
>>                          u32 size, int level)
>>   {
>> -    u16 pat_index = xe_cache_pat_idx(tile_to_xe(m->tile), XE_CACHE_WB);
>>       u64 gpu_page_size = 0x1ull << xe_pt_shift(level);
>> +    enum ttm_caching caching = ttm_cached;
>> +    u16 pat_index = xe_migrate_pat_index(tile_to_xe(m->tile), 
>> caching, false);
>>       u32 ptes;
>>       int i = 0;
>
