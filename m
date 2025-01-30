Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02702C0218D
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 00:06:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C05F10E1CF;
	Thu, 30 Jan 2025 00:06:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MZsYMgC4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF3E910E1CF
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 00:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738195595; x=1769731595;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CRUhJL4nKpmziRacO2pmqhzeU9QFakLPTOI+QU/560M=;
 b=MZsYMgC4el+ud0lWuSEYjnT0KPJEjv/jd8IbpRNMhJSC6dHzgg0VFwV5
 TFtQ5zPKQrJ5WjxCxyPQwUog/89pwy0THNmvPwBZPV2LCim8SYJyOry3R
 D134OxzicZmoEmYQ4YvxviFmZEIApD1snQzjnV6PWXzBHFcQ/zctrqKeJ
 WAsQohtHVcgOmjHfqAz/3GqQ3kwGM8L9DrOP4noKukYeHW4dZZytX7fHC
 IWbUev9huuC625wn0ksREnPMOY5k3DBkq7gW+VuDc0FvSCJS2W20DO3q5
 IpJTamMiLyQONoxVcZkpfonHWvRI/gbhVTK2H3DihIBAwd2Tv3XF5Ikdf w==;
X-CSE-ConnectionGUID: EVnWyAPaQTiw9qDbIh9uPQ==
X-CSE-MsgGUID: IkLZFAdAROSiuVgRJhiHyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="61205201"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="61205201"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 16:06:35 -0800
X-CSE-ConnectionGUID: ohOCxchvTKSq06NGujurQA==
X-CSE-MsgGUID: 7L1o11+6TKe4o/GJ9GdoEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="114213081"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2025 16:06:34 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 16:06:33 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 16:06:33 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 16:06:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tRmiJxoYlPuAddCwnQ++8rWSAyzRmI3qQGVX+bkCfUWi6VTKkEpm9Ky/2PIFX4FwegEaKm8W+VN5EbqZgLXvE8wzcp1hrnAVxzYwQSYwEtAh10aCCTa1B7ezEx2jgm5bVcIUrZl1dCfBxE0mafPe51uRQdn891+ZLkN1MDA2VV2tEDmljQeUse0IUfvWSMELffGbpkL3Z1yKcRDSQ3HxJAObpNMGlaBWQONzPoYlqAd+0et+7cA7x8Wev6W5eCWboNjGDGtH2qsj5gY3u0G/4cB90BvHAfu1stD5GzibIjRqIYl3oRlXo/eVhzNVadr0icPar5JfxalKlKC18T7KSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXcWYFqgHjB8J1LHt1ubSNqAYLZXhWmg0s8hSUUYAX4=;
 b=xoHLzOZr7t7vhkhm+s5Mwkphwfgm3GLSIM2YdFbv3NKUWvifux53tvcxdkvl3flttyd1qazbUE60psa88P/SRHfuCYBDIoAoTKTul3tgMJTY+uqIuQkt+Lbet5UFquAMTeF+LEf5WycyES6c42AQnwDxeyuwGTEydhjnzrJEQyEoZBGcF9Km5lVfS6tyD38hbM7OF7p9YMFqqCZpFA8/3tVm6FnqkAahTKMUSe91L7ZTYlskeFpURFBN+xh7Kv+UboTo0qa+xfI09wXxX7YnFF5EdQvGE0X+/dAjMtSpJfXad3dEqkNe1PCLirag4iC1tgQmE4+k/Lu8ldixrRazeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CO1PR11MB4852.namprd11.prod.outlook.com (2603:10b6:303:9f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Thu, 30 Jan
 2025 00:06:30 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%3]) with mapi id 15.20.8398.014; Thu, 30 Jan 2025
 00:06:29 +0000
Date: Wed, 29 Jan 2025 16:06:27 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v4 0/8] PMU Support for per-engine-class activity
Message-ID: <Z5rCg8PdSjySrZ/j@orsosgc001>
References: <20250129101653.1976699-1-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250129101653.1976699-1-riana.tauro@intel.com>
X-ClientProxiedBy: MW2PR16CA0069.namprd16.prod.outlook.com
 (2603:10b6:907:1::46) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CO1PR11MB4852:EE_
X-MS-Office365-Filtering-Correlation-Id: f3359793-bcf9-4804-48b6-08dd40c1f20e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWFISHNSU0JQUll1TFF2WjRNUWd0bzUxc2s4di8raGVzL2RIU2RSdDZRL045?=
 =?utf-8?B?aU0vaWhZdWtObEdmVko2WTg5QWU5T2owa2xzMG5VYldMaWtHZ0ZZMExGdUVt?=
 =?utf-8?B?YkVUUnFBUWlzVDJrTHl2QzFIMVdiNVN6Q090dUYrOGlKaksvOTF5U2FibkYv?=
 =?utf-8?B?L1dxOUxGTThjYlk2ZnZvczFOTmk1VUQxdUtkNVhnZmhqLzdKdDE2VjEzeFox?=
 =?utf-8?B?NXlleHRpNFhzK2NQdFJmbXkzcFFxd1R3cWQyV3hMNnltRlJwVzhySFNORWM1?=
 =?utf-8?B?cTN3VDcxcDZ4U2VtSktWU3c1U0dXbURoT0JoVTNleWI3OEVJRE51M2FQdDlj?=
 =?utf-8?B?TGJtQ24rTWMyMk5UNUxiVUgvL0NvS3ZPS29jc1F3Q1dtL1ZKb2t0enluVGNM?=
 =?utf-8?B?NklsVFErNlN1REY2S3pjSjJvOXk3RkY0SVl1ZkNtTjNMZU56RmxKZlpQMkd6?=
 =?utf-8?B?YzI5VkVSOVBzRjQ1VjkyLzZCelJuTU9Ba0piN05OMy9uSDdnQmloRTNxNnFO?=
 =?utf-8?B?Vm9TSzBPWWpjZjJYVm9pM0t5d3FvQWNEOE44TktXZ2lCRGI2TE5lQXZOZGpx?=
 =?utf-8?B?d2ZYdjVQVWhjTzVwQnpSYjJiUjZOb3U0UGZYeVRGY2NrREFuQkplK05wbVdK?=
 =?utf-8?B?YjlZOUl2ZllXaCtWVXg4TkVGL0N5MmdMTjVFZkM5c0UrcjZmbVNJcmlDdHVN?=
 =?utf-8?B?OERPNkNLMnQ0OThzY0FlSFdraUhja3k1SlU0Rjl2eTFhK0oxREpoajBSdlNP?=
 =?utf-8?B?MUw3QlpUNzNrTWRPck8rOXlpYlg4U2ZOZm9UWm5DLy95dVNITEFjN093ZjRO?=
 =?utf-8?B?UDhldWg1dGZKSHh1YW82UStZbzlTTHpaWm5XSHpkQWc5eGEyVU04RWtseWdS?=
 =?utf-8?B?eWI0cDBCYnZsekNJYkVvTmpmWVQ1Nm9vS3d0bTBRWG8yMXFuZHBvK0RBTWV0?=
 =?utf-8?B?dHU1YmNBYUExajRRNVUyU0RDa2tRSE82RDJFQmNqdXBUZ3luWkNnUGhMclcy?=
 =?utf-8?B?dDNDeitvU3luR0RIZ2RGVjhuVzJLNEJMaWtqVjg3ZHVyTXJQVHNRcGZYdmZn?=
 =?utf-8?B?UXN0RmgrbWtNdjYyZVV3ZDBiWEkrdjM1bk02YndpeU9qVG5EUnpZdFRobXVl?=
 =?utf-8?B?ejVGeGwyMnk5eTZjVS9sbFViRHN3Ykk3QjZWaDFlM0R0bXBta3ZqTWZaME82?=
 =?utf-8?B?UWI2TTMxamNLTDFKSnpUS1FibGlxbmNYV0V4YTArVmxiTDlDemVvYnpObjhY?=
 =?utf-8?B?Z2pQMXVuN1U1VkFBbTk2bWpFUnd6SHdFaGJRSFpCVDFVWFQrOGxIWmVkOHhF?=
 =?utf-8?B?SVcwakszWjErNllQeEFPdU52Y0dicllieGN4UTJXOStmc0NMTUVkTUxMSXRk?=
 =?utf-8?B?akU4VVppT1J6K3BlUzRDRjVKT2xQVzRYeTg4Y25YeWVhSkFqR2pWdHVwRUdB?=
 =?utf-8?B?ajFkY0EvakR3Y3V5cTZDUDRXSlZPT3VxTXA1bWFSZzY2UmRuZ1BpTkJrVE8v?=
 =?utf-8?B?OXJmUUVUcUdiZDBSSmZqMzh0U3FVVHpRMzh1SEU2bDAyKzE4V0p0Sk9aM2ZN?=
 =?utf-8?B?ZVdXSTMyRWx3THQ3eEJKNXZzcGNOU205SWpUbks5UDUvbFhTUVkvSWp2WUVz?=
 =?utf-8?B?Z3N4Z2haWDBuU2tnMnRPc1FxaVY0U0c3S0pRTE9CZGV3cEY3aVlzTHpqSjlQ?=
 =?utf-8?B?ZjVaaHdIQjc4QlFqd0JjVTliU3F4aVQzeVVXWGN4dUg4SDdxQlpRVWxKVXln?=
 =?utf-8?B?c0haTTd5cC9VL3MvOG9qNDdzcmczOTVMYmJqMXByQ29RbXdYQXZ2MkZmem5i?=
 =?utf-8?B?QTJQOFplUDJIMnlISE4wUitIbnpxK2pxdGNIMVpKMGwxWTE4ZlY1cVl0N2Jt?=
 =?utf-8?Q?KmL3P4sM8a4J1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFpFNDhMN05XTWtnSkE4RCtZc3RWMlo4UjgzRHp1MmRvRXJLSG1kU2wzZndF?=
 =?utf-8?B?cjhxS1FBeWxCZ2ZHVTNtZ09RVHQrbEFZSFJSUm9McWZNVXVCZ0VDMjR4U3dM?=
 =?utf-8?B?ZnVkazBFSE5pTldjY0QzZERROUlicDEwcklBMDg4NUZUekxST2pmYmdGQWxL?=
 =?utf-8?B?SWJXNDRSU1VWemVkbTRzcTd4QWUyZEV3Q21oaEN2MGljb3NLcFNsWGRsWVd0?=
 =?utf-8?B?U1hueXFWUkZaWWpzalU1dDA0NjJRN2JEZUczNGtxdnFxL2hiTUxqUmFRaGRv?=
 =?utf-8?B?UTYrdkxoQytsSXROcktsYW5HdW9vRVAyWGxDZFZ5ZHF3L0haOEUybHhWUkNv?=
 =?utf-8?B?NGxYejRQbVFzZ2hJak9NeUpCSGRjRi9Ub3NJSWxTQjlMYzZKY1pNdEJiMHhx?=
 =?utf-8?B?eUNVQ0IvM3ZzdUpiejNrWVJ0YXVLUkFHanBIUzNSL042NUVLWWdsYVF2OGtC?=
 =?utf-8?B?NGRQQUZ3RjJQVjZ3SlJheThCcjExc2hkemkzekNjVVZDeHZTK1ozNVRCbVoy?=
 =?utf-8?B?bC9CWjFzdEFlTWNabEhEbFZEeTU0VDJHZ3A5UU1POTJ2WkRFYzRlZk5DZ3ow?=
 =?utf-8?B?WWp2aDZCSHFJNDAzL3ZyWEt0NXZGR2VVUlJvN0pOUzRXcUlXZGpjSTNnZW5C?=
 =?utf-8?B?eVphV1d5OGtFZXcxVTFEME1FN01ablFxamVqNmlKWVI2dUlXdkFYRjQwSU10?=
 =?utf-8?B?REYyWjNpbzZRaEdzV2g0ZHMwa01ES3RDak50Y0hmckpSdXZmWTNsVUliUkNE?=
 =?utf-8?B?a1N0NzlUeG44MDRRbFRHTG5RZlIxcWhseDJnaDBESEw0cTVkei8vV1R4eWpK?=
 =?utf-8?B?Q0diNWltV3czeEZSa08zVk9mMXJqQjFFK2FBZFoxL2dCU0xiMW8zWmJ6dUMr?=
 =?utf-8?B?Mll2WGNGandFdG93cXFsS3Y3U01WQXpCeFViK1Zid29ma2VRREE3L1hnVW01?=
 =?utf-8?B?ZmpYTFVNQzlQSUt5WUhzOGtzbnp6ZVlOMzlqSVRDWktYcnV3K3VCTnpEOFBQ?=
 =?utf-8?B?NUp0ZC9LMW9jNy92NzR0bmlTSzAwTUlxVFlUbHZ6VkdOZWpCTGR3WkFCQkxq?=
 =?utf-8?B?QmRCTW52OFJYSVg5OHpvS0FjYnNnblRBQmMrUVZPT0RFK0VuZ1JTUVpZWjNh?=
 =?utf-8?B?QVRKQzZTcnRqSTg2SGNlVDFCT1ZvZlpDU1BEcld5OHpFRGRGY1ZLZiswWU9L?=
 =?utf-8?B?T04zZUdISDI2SU9yejF4OENUemNFSFRic2VFcWlTeHBDanBKREhBOEo2ZWFy?=
 =?utf-8?B?WlRLQU44MVl2WStwMDUrNCs3K21wSTF4WDBhOFlIb3crVzZHRUlGRVc5K3FV?=
 =?utf-8?B?N0U5YkFlb0J0SXhhVkJTVU1Qb1lLTFQyNFRZMUh0NjhiUzhGUGpKbXBJcE5V?=
 =?utf-8?B?bFdMVzJBNWhPRWVqa0NUMXZ4TTJaSzNQclBMcmZ2L0h4TUdVRmlLWThZVnpK?=
 =?utf-8?B?QU9oNHhOd3ZtWUxmODJQSHlLN1FTL1dEMXZxYW10dEtEMGVpTmhiVzZyTkU5?=
 =?utf-8?B?Qzk1Q05SV251VDVXZnVTSE13UUtuejd4SzltU3VucTBnWjBaMTBTemN2V1VV?=
 =?utf-8?B?TUF6K3J3TjRQV0VWWFRiV1ptbEpTZnJMbmtza3BnRk5CTDhLLzZ4bm12S2Qw?=
 =?utf-8?B?b3lCTVd0aWJ3UmdKSzRsN3FvRVZwWGVMR3NOQ25LSXF5RUxuSGFrSkhiYzhw?=
 =?utf-8?B?d3BiWVgxYjVKTjRKTHNmLzQ4YTJibGF2Y0tnVkdnV1lvbzRzZXBRM0hHOXNS?=
 =?utf-8?B?M0kxK1RXWmt3R0I0MlhleHFmN2l3T0RVMDV2V3QvMjlBVnRSYytCUnNCT1pT?=
 =?utf-8?B?OUJXT3NnY0thd0NKYlZYdkYzMmI2ektoNVovNmV3a011ay9LTGdldzU3ajFT?=
 =?utf-8?B?TlFKcHo0MWxPTFBTSlVzanNIazZPZWR1SzRzLzVvdE0ySUV0TXIxNE9HdVN2?=
 =?utf-8?B?dGttRVZuUjhqdnJWK3R6cTF2ZWVxbGRHY1d6L2NJTHVReVVXUUo2OUF2N1dy?=
 =?utf-8?B?QmZhR255M005NmtzVGVUYU50SktHTmFJSFZ4UkYrbzBIcjdkWEkwaVJlT1c3?=
 =?utf-8?B?Y1BjcFByU1BVMHRpOTBYcUhMY0dYZnhlU2hKZGwyNjJwT1NpaTVuVTN1bEE0?=
 =?utf-8?B?SVFtcWNSMFQ4ZnRPckNGZG9PeHh6U3RpYjdRTHo5ZFhUVVM3VGdkOXRRZ01Q?=
 =?utf-8?Q?QajAMHfVdc6vw+2viYtlpZA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3359793-bcf9-4804-48b6-08dd40c1f20e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 00:06:29.2783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4TPw1u+7R+YKlzrXaU/RBwWoU4YAqa92dQlaFlPPBlPEU5ep8e+7i8407uZJWdTP+GF284acRgoZUsdVUYZHwrWWuDX1SeORG/k+nZle8Jw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4852
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

On Wed, Jan 29, 2025 at 03:46:43PM +0530, Riana Tauro wrote:
>This series adds support for per-engine-class activity for native
>and PF and VF's

A general comment applicable to entire series:

I am wondering why you are referring to the granularity of engine 
activity as "per-engine-class"? The interface supports per-engine (class 
and instance) level activity.

Maybe you could just use per-engine everywhere instead because 
per-engine-class means something else and that's what we export with the 
fdinfo interface.

Thanks,
Umesh

>
>PMU provides two counters (engine-active-ticks, engine-total-ticks)
>to calculate engine activity. When querying this, user must group
>these 2 counters using the perf_event group mechanism to ensure
>both counters are sampled together.
>
>To list the events
>
>        ./perf list
>                xe_0000_03_00.0/engine-active-ticks/    [Kernel PMU event]
>                xe_0000_03_00.0/engine-total-ticks/     [Kernel PMU event]
>
>The formats to be used with the above are
>
>        function        - config:59-44
>        engine_class    - config:20-27
>        engine_instance - config:12-19
>        gt              - config:60-63
>
>The events can then be read using perf tool
>
>        ./perf stat -e xe_<bdf>/engine-active-ticks,gt=<n>,engine_class=<n>,
>                                engine_instance=<n>,function=<n>/,
>                       xe_<bdf>/engine-total-ticks,gt=<n>,engine_class=<n>,
>                                engine_instance=<n>,function<n>/
>                       -I 1000
>
>Engine activity can then be calculated as below
>engine activity % = (engine active ticks/engine total ticks) * 100
>
>
>Rev2: Add trace functions
>      fix cosmetic review comments
>
>Rev3: add engine class and instance as parameters
>      bump minimum guc to 70.36.0
>      replace busyness with engine activity
>
>Rev4: add per-function per-engine-class activity
>      fix review comments
>
>Riana Tauro (8):
>  drm/xe: Add per-engine-class activity support
>  drm/xe/trace: Add trace for engine activity
>  drm/xe/guc: Expose engine activity only for supported GuC version
>  drm/xe/xe_pmu: Add PMU support for per-engine-class activity
>  drm/xe/guc: Bump minimum required GuC version to v70.36.0
>  drm/xe: Add support for per-function engine activity
>  drm/xe/xe_pmu: Add pmu support for per-function engine activity stats
>  drm/xe/pf: Enable per-function per-engine-class activity stats
>
> drivers/gpu/drm/xe/Makefile                   |   1 +
> drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   2 +
> drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   2 +
> drivers/gpu/drm/xe/xe_guc.c                   |   5 +
> drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 500 ++++++++++++++++++
> drivers/gpu/drm/xe/xe_guc_engine_activity.h   |  20 +
> .../gpu/drm/xe/xe_guc_engine_activity_types.h |  95 ++++
> drivers/gpu/drm/xe/xe_guc_fwif.h              |  19 +
> drivers/gpu/drm/xe/xe_guc_types.h             |   4 +
> drivers/gpu/drm/xe/xe_pci_sriov.c             |  23 +
> drivers/gpu/drm/xe/xe_pmu.c                   | 158 +++++-
> drivers/gpu/drm/xe/xe_trace_guc.h             |  49 ++
> drivers/gpu/drm/xe/xe_uc.c                    |   3 +
> drivers/gpu/drm/xe/xe_uc_fw.c                 |  28 +-
> 14 files changed, 886 insertions(+), 23 deletions(-)
> create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.c
> create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.h
> create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>
>-- 
>2.47.1
>
