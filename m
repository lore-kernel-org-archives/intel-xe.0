Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A019606A32D
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 09:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UIiguK1W
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E2910E593;
	Thu, 12 Nov 2026 09:09:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264D910E593
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 09:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794474534; x=1826010534;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tXk9ySLT49nLZ6bN68tcAU8lx7N/c3esYl5PMUkSTSo=;
 b=UIiguK1W7I7LpglQuKFF6hvhZVpmWR0Hy17yPkopX9WTjkx2I4Z/i0kk
 sGb2/c58ZmdpyN9UAKM30+CLjDsCtGAxN0gA/metpoHVg/8+yPXWJ4Pps
 ajMQkwhoTjmaYoLYKHlfJ8f+1GcGb6OzyuRF4b5mhmWDL1GC7fLKk6DB8
 lvX80U/uec03Of/9JPu12HWXOKEuI4LTWzKyHF94jloU8LScu8kq3oRGt
 OeE+ElnqFiXLBsMzOHB6bGF1E+39LDBkZjud2venq/a5X9QP056Fd5TMX
 tx6WbZ0oNUU4KA2vyoh3pj1JRsW7dM+EURt4vfuBOC5Y6ZquuCcddUCrQ Q==;
X-CSE-ConnectionGUID: OCvVwcQVQhm55vi3S50qwQ==
X-CSE-MsgGUID: FvnrFJHeR1+AG8sBd2NpdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3288120"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3288120"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 01:08:54 -0800
X-CSE-ConnectionGUID: W2+Ms+QtTZqKIj1D9SDbKQ==
X-CSE-MsgGUID: 7+qyBNxeRJWGxQs1jPSdjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8952502"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 01:08:53 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 01:08:53 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 12 Nov 2026 01:08:53 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.41) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 01:08:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVwhI8zSQYPV/E1eQRyUNU2E7Wo/ENesqXsL2uVLokGjRCY9gp/36baFDIzesA79BhAEBCFbg0YVCVSUDFmxGrtmmjV2eFWdTwS/XwnEe9a2M8sVhnKgGg8QDoBJBdu6iBq7aq694ncyS95gnZjcRSrfHEgpVLrqMe6OMIoervefWTSL6gN28yVC5S90oflgJEE94TxpHNXrb8DVEbxVliIWzbyj/P9femO0m2/BDUb7NRwbRSntDXq9LqX0wXRWUaePWLgbiVJmw7MVKOT8YY40o2bztIJTAyQgc2Rd48DbuhNLIv0SA7jw/d+xxk3H3DchxNGs6CKWK3V2Rw3f8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEaTR8NnL7a5Xiiv6fyFlWekqVLOM6MOm15ypjyPTnA=;
 b=apPbBcAh6o/ekpPpLOmqpiT/bl80D4236wOgfDbDfY1bQjYI36fXtmaapK/s6JaCRM+CCHLHBiyIP2/pGfI5uk87xHMxfz/51u0e8rGYEDMunOvx0cCBut6X9tDWDBUkhpDQKjjheD9HWVy+E5QrUgcJuyoJcrTxU6XnRfhbHUiTxbMy3/MR+Uzi+vl5hc+/tyNMmNQQlFmk68GolpuSczojAuPOUncuFSTIlSVFVTiOvsU+o3Wq44GPvmvMj09hPSAHmienQyvdlF76Xf5SGda6LLFMSfyDDHAsXBCevGnWwgMUbJg3S2ZFvldCNVix6V1P3Pe4DdZ09vfB86y27w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA2PR11MB5097.namprd11.prod.outlook.com (2603:10b6:806:11a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 09:08:49 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 09:08:49 +0000
Message-ID: <86825b14-9592-44bc-9fe0-f04a29add4aa@intel.com>
Date: Thu, 12 Nov 2026 14:38:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/xe_ras: Add support for PCIe error component
 handling
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>
References: <20261111123021.3253044-2-riana.tauro@intel.com>
 <avVP928MsZSVlFx3@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <avVP928MsZSVlFx3@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA2PR11MB5097:EE_
X-MS-Office365-Filtering-Correlation-Id: 021ea5c9-16b1-4a75-d66d-08df409c9053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|261009223027099003|56012099006|4143699003|11063799006|261028144727099003|261021121427099003|261102123227099003|261026140227099003|261026121527099003|261022113327099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info: Yvc/9FDzQjpgsz3MGE0ZQ6YixS7pf8KXzs8Ov+ARpR2sxeVt3Q4R9eOws57MUiN+ESE87YLflOJAO7g+RQK0vwvLAH7ymRu6Jqu5zFhUwTvMLzU68JOeIUTU7co66KU9qz3ZCz7Ug7sYZ8K8Ri8yylW0j26vguuGRmybwGXfoj1jxCce3NiSgTfhD2T8E4iq74p0R7VV6zrILbiOa8sf3eU/o0MpwTbLAjh7f4nDUoa2Ch9hZQEVREwd5fHKh9mbstbiILJFIADc/Cli4hwkKA9rubj3upjZrzgIbdni4xP5t76iU8npohlCesjmU2cyCe55zwsXi7et4TPTChTfBpWlDA0gDWOyryppcVOLLxmYvFtFTykZVldZGgPutqMpCfKXQYNG59ftzwQKKX9lTK1kqE0055iE6xQoNgBdiBf5xQwI/f/X/i/eW76QZNfbyDA+vXIqZV6fvdPXkFBpaATEjC3xbk441Lkj2HaC3FB9mrqhUEw1796R2PV8qLDSNbzOVkHZvx5zmXvyNNDJWFf6tW2bNHmsyx2tVDqgHv1T7/7vLBEgEkW/lo5JOjcOhpkTo2vJz1up5hsplLedXeWQk7ztztH7JNuy8s/kvbquX2PUeKhhFqiHppw1UJsk0plAnoK1hs1Q9d2S9altBTWqXDyERlNDW3CKZjHNKQk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(261009223027099003)(56012099006)(4143699003)(11063799006)(261028144727099003)(261021121427099003)(261102123227099003)(261026140227099003)(261026121527099003)(261022113327099003)(261022105027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWFXcW9kNDk1VjlQcXcvdkJPRE5nQ2FpamszODBvUnJBWGg3WDBtcUNVbzN6?=
 =?utf-8?B?VTJRT3Z4d2hLYURGTVMwejU1cmJ2YXpMU2dFSm1OQnpwTFRac1JvRElxWCtw?=
 =?utf-8?B?ay9JTWo3cG9PNVVqSG5FNnBsNnlpZVJGSm1DOUtLeVdpZmwrUGhJTFpNQnVT?=
 =?utf-8?B?ZEpzZGk2N0MwOGJMTW1zNlhyakVlT2x6eXllNmVMVEsvWklTbXk5djZvY0N3?=
 =?utf-8?B?QXYveEQ5SzUzdlZ4L05kWXdDcHZ5eVYwR012MEY3T2JHZ0Z4STV3TWFTbEZH?=
 =?utf-8?B?clg5YkJuR29tVWptZXVxSUNkMmlOaFBkOHdnRkZsb09UZlNTei9WbDg4a2E0?=
 =?utf-8?B?UzYrRUtWV3FxTW9yRkV0WVJVRERBWG5GR2dVa3VudlU0WlNkT0VQeExwSFVX?=
 =?utf-8?B?MHMzeC9JcS9Fa1MzRnlOTEhSOWx6d053SUdnNFBTWkhtMXpxR1FVYlo3NG9I?=
 =?utf-8?B?WFpqaFdVOE1vTjlJcEdpRkZYenlHZ3p6L3YyamRWdDNMMFprNEdNNWNZZGx0?=
 =?utf-8?B?MVNKVE5kUE0xYXhiUERtS3V4RFZXbUI3WTlWdUJoQmx0YUpXc2hVYmphcXFF?=
 =?utf-8?B?Rkh4c1dEVnFnSWNSNDZFQ3QwTjBnaTBxQTBGZjZTYXNQMW92NnpxeThlTTZh?=
 =?utf-8?B?eitycEd5RS96TWdIYVA3amJhNzQ5YXNsVFVhSEZPYzArOWRSNVRSN2hoTTl2?=
 =?utf-8?B?ZVFjZS9FZGNHMy9Za0JLUTJ4VEVydTYvOGg3OWhHakF2MHowT29reXN4eTNr?=
 =?utf-8?B?WlN4ZHJpTEpXWUNseHJJOEtVc2Yvd0g3eFMwellac0Rpd2VpemZMUG5nWDlV?=
 =?utf-8?B?RWpPek9ISWdTTGJ3RkxDVmxLVXc5Q2x0cW81dElvVFBDNGh4R05CNGw0TW80?=
 =?utf-8?B?LzJTeW5BcmRBR0tHVmhLeGFiR1B6QldwaVl0cjdNbkZ2ZXNOR01QazhjdkZP?=
 =?utf-8?B?NG1nVzlrQmVRZWMzWDl2bHk4V1NFK2p0TXNhcHIxWHBTL3FDOFFvSnN6aEtF?=
 =?utf-8?B?bkF1MldUTHlTdmtWT1JoY0JNVzZpZFM0cXJJZ1dHSEF0NmhPU083Ynh0OWZz?=
 =?utf-8?B?di8rYVlqQmU2WXdsRXgzYWI5SjhxR3AzT3czaHExdVpFYjdQQmYzLzRZajJn?=
 =?utf-8?B?ZWdTazlFa2xGN2VrMWFZcGU2NW1ONitHOEZIalduSktKM1JVS0duS3Npd0dy?=
 =?utf-8?B?NGg1OGRSMU55Y2F2VDZMRC9GQzlkemZPTTRPVzlnNW54aTF2WGZNa1RGSVcy?=
 =?utf-8?B?eUlZeEYwRHlBazZEWlVBTmRiNko0cCttMzJLaUpLRWo0c0txc01ja1dGTzhO?=
 =?utf-8?B?TjlmL1hCcFZLMFpQeEwyYkRBUkZDVnZFM1lTeFJZSnpCSG0rSjA4RVlLRTNi?=
 =?utf-8?B?RGVjRUR2alMvRWNlTmd3YzROQVEvZksweThPa2kvVVdjeU9YZ2F5Z1hBNEJG?=
 =?utf-8?B?SkFkYU5GNmlQZ0ErUkRtQi9UY3dCejcwK3RkRUhNOTNKS29MZkYvUy9kZExV?=
 =?utf-8?B?YlJLK3ZTUmpSOXZLUHoxZVVHbHVaNk5vdmQ4MDF3ekdxcFNMZnJaTXhoZGk1?=
 =?utf-8?B?VjVQZ3VEOEQ0YUdBMzhSdU5sbnc4emxwRFc5eWJ5RmgyQ2hrM0h4dkE4czFl?=
 =?utf-8?B?S1o2bWxoOWpCdU1tR0NPRW1KWGpKV3U3MFdxcmJpZTU5SWI1TGduQjRPQk13?=
 =?utf-8?B?cmIwbW1HdWJ0Y1FNcnJ5SWFmeUFwZWVES3QzQXlINmpQTkVyK09iSHBoZUpJ?=
 =?utf-8?B?MEV2M2NyalFDMkJyK1V3dzU2b3ZVaTA0ejA4akNwVW00NGtPTE1kL1QxOXJp?=
 =?utf-8?B?MGZqLzVOZWJ3UmUxYkVZU01kcCsyTmlPaWRVc1lucENnMUZEY2xXdkZ0dFlv?=
 =?utf-8?B?ek10OTg0MUJEUDkxNVVyWHQwUFhjUmhsbkVqR2lJZG8xUXJuQldjNUFTVnI2?=
 =?utf-8?B?bEkwY3lVbFB4Y2RSOEZZQ1p4NEtVa2NzUWVLMHZ0UkZ5MXNMTHM4QnlVQVJ3?=
 =?utf-8?B?SFltOVp4U1R1WjBrS3JpamRnV3dYaHhYQnhobVVEWmtCc1JQMzQwWVhGakRP?=
 =?utf-8?B?MCs2MVlBYTB1ZVVpbFNJbE51T0h0bHdmb3lxNUovS3FJcC9wUFBSdnV6cXNZ?=
 =?utf-8?B?bituWlJjNzFwRFhYMDk2ZkR6WGZwM3d3YnkxSzFKcWZpMW00OGI2WUt0dWg3?=
 =?utf-8?B?RnVlTVRCdFZzdTZrZTJKOEEwY3RNL09UOUUxSkI0K3czaVIwZ1hNcWZoQVo4?=
 =?utf-8?B?RVhteXlyNEZDbnI5VTc4Z3k2c3JvMXhVc09jdzhuNzVDT1Y3MVA1dktKODJp?=
 =?utf-8?B?Q1BzRXJ5Rk9waG1LMDdndldSREUxdW9CTGhkcTA3S0VrdWJMTWJ4UT09?=
X-Exchange-RoutingPolicyChecked: bueQIqc76KyzqH/Ni5x6rDmSYfaHrWgyKWqFYDHww+bcdD91lS8m3Pp+/j7mib/WjyxRNd3PKRgvePyy8Fctx7BcPGix8kdECShEDFMI1zKrRmmVFSZt31gLloAy0UaRAAOVc+Q3nwiabmOZTtWpTUeYvol4S3fNOUcrPk5KVG2bkB6CAlHfmzQxpcT7ujlM4fUf0zC7jmNS6ZkaLZCMStc0QT4CwM/N0zcTmrLEGt9Qt1s9FJBSWE8V8qhqcf13Icq6Hvl46WyckYvgI7fmKrKJXokeM64MzEAb/zNWlUe0kHBzGsvrHqx8R9wxDlpSnAX/eGuVswT7mmWltY1zyA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 021ea5c9-16b1-4a75-d66d-08df409c9053
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 09:08:49.4298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N3XoZu9HyjnV+QHocmRQsZypMlRJPUpif0VJI9w+tmKcMcAzJSCPAg8+88Ca3o0Cd3pMSYuakJ3uNbpvcjdgKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5097
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 12-11-2026 11:04, Raag Jadav wrote:
> On Wed, Nov 11, 2026 at 06:00:22PM +0530, Riana Tauro wrote:
>> Add support for handling PCIe subsystem errors. PCIe subsystem power
>> management errors require a Seconday bus reset(SBR) for recovery. Treat all
>> others as recovered and take no further action.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: add mapping to cper severity (Badal, Rodrigo)
>>      add abbreviations
>>      fix punctuations (Raag)
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c       | 16 ++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras_types.h |  2 ++
>>   2 files changed, 18 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index 2c01c183d02b..bd3ad017f013 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -698,6 +698,19 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>>   	return XE_RAS_RECOVERY_ACTION_RECOVERED;
>>   }
>>   
>> +static u8 handle_pcie_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
>> +{
>> +	struct xe_ras_ieh_error *info = (void *)arr->details;
>> +
>> +	xe_log_comp(xe, ras_sev_to_cper_sev(arr->counter.common.severity), PCIE, &arr->counter,
>> +		    sizeof(arr->counter), "error detected\n");
> Worth logging global_error_status as well, so we know what actually
> happened here. Please use full format for registers like we've done
> in other similar cases, i.e. 0x%08x

Sure. Will add this to the log.

Thanks
Riana

>
> Raag
>
>> +	if (info->global_error_status & XE_RAS_PCIE_IEH_GPMA)
>> +		return XE_RAS_RECOVERY_ACTION_RESET;
>> +
>> +	return XE_RAS_RECOVERY_ACTION_RECOVERED;
>> +}
>> +
>>   void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>>   				      struct xe_sysctrl_event_response *response)
>>   {
>> @@ -889,6 +902,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>>   			case XE_RAS_COMP_DEVICE_MEMORY:
>>   				action = handle_device_memory_errors(xe, arr);
>>   				break;
>> +			case XE_RAS_COMP_PCIE:
>> +				action = handle_pcie_errors(xe, arr);
>> +				break;
>>   			default:
>>   				/* For any other component, reset */
>>   				action = XE_RAS_RECOVERY_ACTION_RESET;
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
>> index a86f9d2b8c92..36435a3f52e7 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -14,6 +14,8 @@
>>   #define XE_RAS_NUM_PAGES			25
>>   /* Error bits in IEH global error status register */
>>   #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
>> +#define XE_RAS_PCIE_IEH_GPMA			BIT(5)
>> +
>>   /* Device memory error categories */
>>   #define XE_RAS_MEMORY_DB_ECC			BIT(1)
>>   #define XE_RAS_MEMORY_POISON			BIT(2)
>> -- 
>> 2.47.1
>>
