Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A62EDE9B0
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 19:44:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4B710E910;
	Tue, 10 Sep 2024 19:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c8iH6jk6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C67510E910
 for <Intel-Xe@lists.freedesktop.org>; Tue, 10 Sep 2024 19:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725997441; x=1757533441;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uJb42B52JNXE+6Uy4tCPTaF36Slz18OtI04EOrW1XGk=;
 b=c8iH6jk6CY3+e66aroKwlb/LlAQujb7/2Sfv8YtjrE7PAwCaJ/pGlnyZ
 3yYo5/J2k6wbPRDdkr9GSJtGECHBSAJwX0Gjx4AZ2V+tcslt2fSQl7E6C
 N+TBecuD2Qk2fprauTSo1VOWFPUKlEVLfA8c/nq4wjtpaJGlE+Jgq9umu
 79IJobNFpXuLhJFnrXaQTrHMY2RTWub5bUSkx3OGeav81MRxwyTY7wS6Y
 PgbMZhC5BQU2vjlNarJkdb0qUDo0C9yXsp/WpDzhBTlt8qlPkicGtb2KC
 zOKMa8g3yV2o54jSmoagR9kBqQIa3UUIFk4HjnaGoLnkKDXaLGpCMtRVj Q==;
X-CSE-ConnectionGUID: ISHvl/dAQVSe2ZbLuNrB8g==
X-CSE-MsgGUID: +CLNH7JTTlupazVBC2bVEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="50183129"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="50183129"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 12:43:55 -0700
X-CSE-ConnectionGUID: s/N28p6PSuCCbLZ1DtCVAQ==
X-CSE-MsgGUID: ru15UUlUQKODA1WZyZt7og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="71901842"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 12:43:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 12:43:54 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 12:43:54 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 12:43:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eXOK5CLn6zNvj+fU2ew4OjloMFP37nwWg61X+y9m2gqrbtRibVDBkd4Ao0JdoJBNiKBYrQoQ83XtzEinZ8YxMqzzRJ6Vwa9q7b90w8LX3NNh9oDuU7XxCSQ+KNFDrfgY7Hr6dM3qfjOUazwLus99oswtL/rxsZRiyOTLiDA+41astv5R9PFsbDtJzFdfEQMtUROAMdPRk0Z+EQmxTgpef68CSDmuzHD7JZzU6FdCpTohqsWQP0pu4RyEPrnpQ3I+S1QJzvGYV/JX9H/G0n7aAEpquJ+S6M9xJbqXSh8BP5r4g3M3HDYYKt/C10PUv/T6R1qByAanNLLFr4jcuVk9Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dTcXvihwcK/0nOxOWEYjXgaNNSlsUNHGtIY13ed4fM8=;
 b=X8cPPmiahIGScJ7rWKq9bfgD5apOZRijEdyRdYfliC3yox2nsVDFzAmHBy6w8FsfBtHa3cP4EfkXNg1/ugfJzcj2NE4XxE6+Hcx787aJ3i03j9sGxEr/OetZ7zmwRPU77XkpWR5JVR8yXSVJaMwq/vTinfntbh91uKIsaSQPRylg8viJ9s6RRMbqtuwwenML28rhkTA0IGjpd1Qykw6EkADhv5e9IhfXcIrBQ76N7KtQYqXt+iT8h+C8i1Zqkl/o8o75K4ir5eY4yAJQF0rEd4IWbbO7dZy3wXhO/nkQ6Ez/w576UDKpy5heAEeqpJ6Px/HHT/lkJyIdNPDufi49Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB5019.namprd11.prod.outlook.com (2603:10b6:806:f8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 19:43:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 19:43:47 +0000
Date: Tue, 10 Sep 2024 14:43:44 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v7 03/10] drm/xe/devcoredump: Add ASCII85 dump helper
 function
Message-ID: <eu7zw22lmcvkldfyt66abmi7gutl6eshey2ny4ev24d62jjagq@vm7i5j2s3mjx>
References: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
 <20240905205106.1063091-4-John.C.Harrison@Intel.com>
 <sm6iyfzcaq6vbgytgueqqbjjzjniarulya6xzsuo7gyollceyj@iovrnktwvloq>
 <d80bec85-adfe-4410-ae04-e6bb0f41c764@intel.com>
 <avsxdhqepybtshgp3zfhdtv2beqaub7mg3nvkj7yws7utc5e5p@44uqzzgz6h3m>
 <b2002802-50d5-42bd-abb3-ffdf8ed33e69@Hendrik.org.uk>
 <21bc8c69-3a0f-4c68-99af-63f3f029f37a@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <21bc8c69-3a0f-4c68-99af-63f3f029f37a@intel.com>
X-ClientProxiedBy: MW3PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:303:2b::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB5019:EE_
X-MS-Office365-Filtering-Correlation-Id: 8af27867-7934-4ed0-6c6f-08dcd1d0e2c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SAzU3t+L2Asz0R82IN+tQyCXooAJaSMVEv1SP3HLRJteIFtkdxPH6VKqZcUK?=
 =?us-ascii?Q?MIrWsbz5oasHKnZZeAxIuDqVyDIPexI4eKsKREVkSAZy/XPd0R7cmq1+h4JA?=
 =?us-ascii?Q?aGaFzmDKLa+SgIcBHMttFIT/t0Kl4qVeWxRK/9gDDY+JJkwGs60GwoSKeik7?=
 =?us-ascii?Q?ZwPxjU21zUrU9kWgEtuJMNMpn+U1mwMJbWCehSoCd4BVZOak+a5nByQ86HgX?=
 =?us-ascii?Q?GPiaC/ST8rsZo7W75cSNvVMAv0p/EDyL8mh22zI1PYStcwuExOCmgJuTEDrc?=
 =?us-ascii?Q?izBCmBdY+9TCzAvCPETL0uEF8rV/q/57bzxa0lPxTKzk3aKlVpP+98hvTYf/?=
 =?us-ascii?Q?WQnUy6gG17GkM95fGmMH1ItlqGDVHwAjgAUR2SBX73rXFCOgdTCI5Ys7vKvx?=
 =?us-ascii?Q?dGvQAdN+f+K+TNSBk9yMBjNjPel0SY5o8x0mhRwu5zxWrP33tdaOCTQzNq0p?=
 =?us-ascii?Q?+TjEn/4XBF00blRZqCqzoPEi1cvuOEalY2Jpdal+BSNqspjzx9GIlHSo9jcb?=
 =?us-ascii?Q?x+XGAA3E+9jAArTBAtpu15gYC8AIha//LyPzmwkfAnM7wuMtyQpgfmxp5t3D?=
 =?us-ascii?Q?nRMwjcV42BiH7968euIxRCadQPj5E6rSa50Tx2yGHblp3QjlbdI8GD1O/0b7?=
 =?us-ascii?Q?sBDCicQpLrGMLR+FcIfgWn6gtoGtTssWBB9HH4BDIryL5Ge63p3m2PizsLgh?=
 =?us-ascii?Q?7VEvxth+ePkdfbPuQ5//vbxC3Wxx+dmPOyjWCPcmr5c1opaA2LVTiXHeictC?=
 =?us-ascii?Q?vLHjjuqZ45v8WG6Ued7+8rzeG2PEDjAdplahofFhQ9dXWQ5s80kcV3Szxs3q?=
 =?us-ascii?Q?NNptU6PlRJ3Gx414az3mSm1Qx6Igk7X7b9l+djEdrDQzHl9lVQUuY0VOq5HM?=
 =?us-ascii?Q?cnfYVKlM5SlFUpJVvnllI3lyVyK4d6B8TVMm9zz6aoYvsj+2vDEk926JRM8E?=
 =?us-ascii?Q?wprH5rcqHBWknN1s7yv0kPIOhTR9A+wNoz5a5jrpRsb+fHiXwk1d9DOuYjkL?=
 =?us-ascii?Q?4Ik20O2lG6cQHYqEAaSfHLAZx3iWrTpeWV+KHLbHMi34idfwWW5m0avgPPyu?=
 =?us-ascii?Q?4q28DDyJ4kMacul2jApYZx5Cv4I+U8HKl+fjhQbS/Wn4RdjeV2EnZQSHavDt?=
 =?us-ascii?Q?dtOZPXSrdglLWXdb5anUDNFgqp1nAMTO0HK+2VyYSKNJhXDFXYNQHhLSmuCI?=
 =?us-ascii?Q?JYI/xCUsApbiZC36qiaIOcLNTjRA9uYN11XHrbM8VsixIaOuPy8rkGltPjSP?=
 =?us-ascii?Q?41XxcHCmpfP0DWyLRPtN0ULIyG7OtkYLd0K6oQ8LGITqvShoiZ6SV4X/ddUq?=
 =?us-ascii?Q?omBxlmqLoqbq5xrKwyiZxWX7dq1SOi2DK2qb7k8Fefj+ZQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qebnD+lU1y7REA1e4HSpwsMKezluzxhYPzub+pL+Z3w9eXdMov9sSzULCn0D?=
 =?us-ascii?Q?CjINIIT6088YQDa0gWb/PM87/KF1rcDxuH7aX4trVpRQujoz59oUxzCcZpSv?=
 =?us-ascii?Q?AM46DOaoavCOlMoIjCkytc/OQTu0kAVYckrOlgf5g8LdO2M2+pTNCkwWAfft?=
 =?us-ascii?Q?JR2ZSLCzX22yz2ZwH8LkXuCncmqX/NZpiDk/JTA92zmpGARK+BEJhX6mscpe?=
 =?us-ascii?Q?y74kyVG5pSwIbbCDD20DH4+Q3FmWcevF61BfAJ6uv0HNVqcT8kLhJOF9+4Rb?=
 =?us-ascii?Q?xpBRGtamMLbceLbojwzN2N0U2rNOtRmIno+AqAvw19kqYtwKqqK/bGZJP8lW?=
 =?us-ascii?Q?GPC5H1t+vFpMQadvrjcDTvsSFhVVDkPO1clB9s70EVo+D/QRburCz1Zvd35j?=
 =?us-ascii?Q?6ds4pHy/5SSbAWViiT5ee+Eagr74PRiOP8Rehpo9xFhvmqGaXsxAFjGqqCSn?=
 =?us-ascii?Q?icupZShSy270H77vlM1hPbBYr70qV9k6+aaJmaMLzCNkvc2yi08aDbyPN7zt?=
 =?us-ascii?Q?fElXc5fRTyi/WcnLCfL8eDreKUmoVGyAjydeb/qcO/kSbDL6HpIK1/Z3RdvS?=
 =?us-ascii?Q?xRC1A8wUjNuXCaj5KfNDgmTRpnhG+DJtKnTBjT0Hfxrwpceo/MVyUv9MLetJ?=
 =?us-ascii?Q?EfMYQqkVuw+jCKUdIv9W1DjLIloi7gkmZ34T6eNSzhInHibHawtg3kYuQ5BN?=
 =?us-ascii?Q?uv77sGUDSA9YpTOhls+0YuG4Wl5bopJWfBB75bhR10mOwhgMMy35INrmXs+L?=
 =?us-ascii?Q?phzqzsGOrLk4dKt8VZYg8kwfaltfS88mV157nkXg5C6/RX3sF898Fg+XX4Fo?=
 =?us-ascii?Q?XZbchRaB5MsM8dBHnAFU3n7sQvl+JfsR+d5frG0A/fVZjaQK8sBZnWtiHSjL?=
 =?us-ascii?Q?/Z2y5BEHycxCS5U3IBB0HEX4VVhmh4Yjax2rQZNRPalFPiSscnRFfx6pA3ax?=
 =?us-ascii?Q?5lMv5c1/VTMZaXswPWnsMe2ssZF4kYlCS+YuhAZ83CGOAbubE2vn1OeLSUky?=
 =?us-ascii?Q?lnW0hi5bzYvHQHDwpGgLQdLdaceoQpzLl7j4XAfA09pz3zQBriRSbVOFmU5K?=
 =?us-ascii?Q?aQQ0FIIRS7e2QGUCmON8HMCdrVgupYJY7BO+FgH1zKtLMdEvqFyfIwflAFia?=
 =?us-ascii?Q?ChJoos9O7V5E3glRi9asozQK8201veUPtA9ddQc00a0elHoSIRKeAdqKOBks?=
 =?us-ascii?Q?FDkRn8lufrkScIm+U23uTgHkq5f2jOIKxAPujWqiHsuMdxUiUT9ex0gBfBNj?=
 =?us-ascii?Q?humFAWuVQDhJKwg1QuZ4LOFRGFoC0+7rpE6iVjvrhWE5TUXsHdTjm9hHMP1H?=
 =?us-ascii?Q?0BFJCkey62i5+smveEbAiSTKiYHfLrLidei0YAMHYd0/aRD35dyX25f8wPkj?=
 =?us-ascii?Q?TzNHdpRigsZeKJpqbvOGwCW78vw9Q5KUzzg8HnmeHFbFigoWvR8SdmtDe6+s?=
 =?us-ascii?Q?dco0fC8T4TFvR2Ho5pGIAnHWluIeSV6g3ZA08fSmxf54fyaeOQXN/FZ27dVd?=
 =?us-ascii?Q?h7oP19m6jHgm3DfBvBl4fQeDTvO4cS+ad/oXYq28rD+wBScHLfDVsxI9fnyg?=
 =?us-ascii?Q?OYpm77MHZT+sVOv+N1/jhI6spYmvY6wXcat/LLjtrrIB20F/9fnVJ3FIvkLy?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af27867-7934-4ed0-6c6f-08dcd1d0e2c2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 19:43:46.9706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UXHOvmuD/j8XbrjNXDA4R3ttMwAHMi2VRLz78kWbzdqpU2PPDNeRbo515Fhzn/n0tZZ8gwrQMUgBfaspeo46ShUIT04fAUBa89i+bL7qABk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5019
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

On Mon, Sep 09, 2024 at 06:31:41PM GMT, John Harrison wrote:
>On 9/6/2024 19:06, John Harrison wrote:
>>On 9/5/2024 20:04, Lucas De Marchi wrote:
>>>On Thu, Sep 05, 2024 at 07:01:33PM GMT, John Harrison wrote:
>>>>On 9/5/2024 18:54, Lucas De Marchi wrote:
>>>>>On Thu, Sep 05, 2024 at 01:50:58PM GMT, 
>>>>>John.C.Harrison@Intel.com wrote:
>>>>>>From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>
>>>>>>There is a need to include the GuC log and other large binary objects
>>>>>>in core dumps and via dmesg. So add a helper for dumping to a printer
>>>>>>function via conversion to ASCII85 encoding.
>>>>>
>>>>>why are we not dumping the binary data directly to devcoredump?
>>>>As per earlier comments, there is a WiFi driver or some such 
>>>>that does exactly that. But all they are dumping is a binary 
>>>>blob.
>>>
>>>In your v5 I see you mentioned
>>>drivers/net/wireless/ath/ath10k/coredump.c, but that is a precedence for
>>>including it as is from the device rather converting it to ASCII85 or
>>>something else. It seems odd to do that type of conversion in kernel
>>>space when it could be perfectly done in userspace.
>>It really can't. An end user could maybe be expected to zip or tar a 
>>coredump file before attaching it to a bug report but they are 
>>certainly not going to try to ASCII85 encode random bits of it. 
>>Whereas, putting that in the kernel means it is just there. It is 
>>done. And it is pretty trivial - just call a helper function and it 
>>does everything for you. Also, I very much doubt you can spew raw 
>>binary data via dmesg. Even if the kernel would print it for you 
>>(which I doubt), the user tools like syslogd and dmesg itself are 
>>going to filter it to make it ASCII safe.
>>
>>The i915 error dumps have been ASCII85 encoded using the kernel's 
>>ASCII85 encoding helper function since forever. This patch is just a 
>>wrapper around the kernel's existing implementation in order to make 
>>it more compatible with printing to dmesg. This is not creating a 
>>new precedent. It already exists.
>>
>>>
>>>$ git grep ascii85.h
>>>drivers/gpu/drm/i915/i915_gpu_error.c:#include <linux/ascii85.h>
>>>drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:#include <linux/ascii85.h>
>>>drivers/gpu/drm/msm/adreno/adreno_gpu.c:#include <linux/ascii85.h>
>>>drivers/gpu/drm/xe/xe_lrc.c:#include <linux/ascii85.h>
>>>drivers/gpu/drm/xe/xe_vm.c:#include <linux/ascii85.h>
>>And the list of drivers which dump raw binary data in a coredump 
>>file is... ath10k. ASCII85 wins 3 to 1.
>>
>>
>>>
>>>>
>>>>We want the devcoredump file to still be human readable. That 
>>>>won't be the case if you stuff binary data in the middle of it. 
>>>>Most obvious problem - the zeros in the data will terminate your 
>>>>text file at that point. Potentially bigger problem for end 
>>>>users - random fake ANSI codes will destroy your terminal window 
>>>>if you try to cat the file to read it.
>>>
>>>Users don't get a coredump and cat it to the terminal.
>>>=(lk%A8`T7AKYH#FD,6++EqOABHUhsG%5H2ARoq#E$/V$Bl7Q+@<5pmBe<q;Bk;0mCj@.3DIal2FD5Q-+E_RBART+X@VfTuGA2/4Dfp.E@3BN0DfB9.+E1b0F(KAV+:8
>>>
>>>
>>>Lucas De Marchi
>>They might. Either intentionally or accidentally. I've certainly 
>>done it myself. And people will certainly want to look at it in any 
>>random choice of text editor, pager, etc. 'cos you know, it is meant 
>>to be read by humans. If it is full of binary data then that becomes 
>>even more difficult than simply being full of ASCII gibberish. No 
>>matter what you are doing, the ASCII version is safer and easier to 
>>look at the rest of the file around it.
>>
>>I don't understand why you are so desperate to have raw binary data 
>>in the middle of a text file. The disadvantages are multiple but the 
>>only advantage is a slightly smaller file. And the true route to 
>>smaller files is to add compression like we have in i915.
>>
>>John.
>>
>PS: Also meant to add that one of the important uses cases for dumping 
>logs to dmesg is for the really hard to repro bugs that show up in CI 
>extremely rarely. We get the driver to dump an error capture to dmesg 
>and pull that out from the CI logs. Even if you could get binary data 
>through dmesg, pretty sure the CI tools would also not be happy with 
>it. Anything non-printable will get munged for sure when turning it 
>into a web page.

I think that's the main source of confusion on what we are discussing.
I was not talking about dmesg at all. I'm only complaining about feeding
ascii85-encoded data into a *devcoredump* when apparently there isn't a
good reason to do so. I'd rather copy the binary data to the
devcoredump.

For dmesg, there's a reason to encode it as you pointed out... but
no users shouldn't actually see it - we should be getting all of those
cases in CI. For the escape scenarios, yeah... better having it
ascii85-encoded.

What you are adding to devcoredump also doesn't even seem to be an
ascii85 representation, but a multiple lines that should be concatenated
to form the ascii85 representation. For dmesg it makes sense. Not for
devcoredump.  We should also probabaly need a length field (correctly
accounting for the additional characters for each line) so we don't
have an implicit dependency on what's the next field to know how much to
parse.

Lucas De Marchi

>
>John.
>
