Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA03CA0EDC
	for <intel-xe@archiver.kernel.org>; Fri, 15 Aug 2025 00:48:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0CB10E33E;
	Fri, 15 Aug 2025 00:48:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EX4+50BT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48AA10E33E
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 00:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755218917; x=1786754917;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iOMptZifVpcOFDoolyFr2FqRdCvUXxgSoJxKu4Gpmas=;
 b=EX4+50BTG0e/05p9REjuJeP82RCiyKHZhxzpWaploGRAJYjCeLZiykXV
 Q4Jwc+jouZ5aRuqBBEoU0DwhX7+xEiDOigKrW1DVhY8Hq8XVf3fQOlJti
 9olrhBTo+zo21yk6IQp6fqV4jrTLF6MlbgyhwKiqbSSp6r5WvOoSQe4HH
 K9LSXY8zz7OCXrek/qHYBWZlLdr65SuD9FuXoO1gbCRfNnwYPmySTEwOY
 TTi2EQ1u3HD2wA0+Ff5S7CgUUjw6SeAmWh7s/m4Fqm4EZRb4Rhgsn/FyA
 oI9dx28mfzZeFxVgKmGaKoPpWz7JfAUQ9rBBxR4vNhC+ivk4/k+eiW643 g==;
X-CSE-ConnectionGUID: 6L8QwRfjTMua8eAMpqy4CQ==
X-CSE-MsgGUID: XqNELPmpQWSil2PhXsdu2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="60174235"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="60174235"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 17:48:36 -0700
X-CSE-ConnectionGUID: 13BvnSiiQk6NQmPd4efP9A==
X-CSE-MsgGUID: pPzRexL8RpGoWpMm8mOKvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="167706504"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 17:48:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 17:48:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 14 Aug 2025 17:48:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.80)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 17:48:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HmSUx1hVIh+f9wo71DNsCXFd50Bb3XzCxaket/sG+0VzwQANxZF9x63bCoDIQg4yBXv+p8+SEQ7yqSZQLcwuWPhDpCFnYNXr1wQM7NIX7gGoWMrcGPOVGVml2uBgSjVyWUowXLbf4mgOlv/z2puJ8IkoYE5XiKT8nByak+tbB8dQEykX4mkVoxvr9Q2YS37vZx+xG685tvwwnEzAU/OZKoFnOZc3TFvZqofjBCr+AJkPoHvdZFY/fYSLeH3YDaubxlhfSN8j+AEs1DEQnV8+uNxhyFA2nEUPjXoEIF5yIpifxYrkYt0KyLPeXWJq72HdbsOW0Wk7tA9vPT4XPztsOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=syTm3D/Hq0+EMdcjwFD8b1SRk8IntT9uZemoHlxd/K0=;
 b=ToNQz1/lVez8ty9hHEJih5tGcMeqYN4gJx1Gg37vH1oQpq2Zo9AMioQ0jDUso6aQEL8jCrJVlzIPylrfrA6EOo9ucKxRfEUa/fBFONuCmvPD8Hon4s8DMDkvaVZ++v/aKHoNWcSznRAOr5hPdZ7yG/9wOXCUhhVsgPpirsLpbKwMjPrBY+Z1mNzpPDCUTtU1RyPl2G6yDNZlSgHKZhFeNU9KGJ8kjzMJPik0MyeBB8IhjnTm2woLS0zSWc3pf66/+JD+JFsNq6KJmzb99xbgcDWS3fKvDkg7UMhoSp7nHWrm2c5p6/LOmb/JPT/fvN+6XVd4Vp0Mop3zJCGifUK+2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7746.namprd11.prod.outlook.com (2603:10b6:930:86::22)
 by MN0PR11MB6088.namprd11.prod.outlook.com (2603:10b6:208:3cc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Fri, 15 Aug
 2025 00:48:28 +0000
Received: from CY8PR11MB7746.namprd11.prod.outlook.com
 ([fe80::7b1c:6219:1dca:3f8f]) by CY8PR11MB7746.namprd11.prod.outlook.com
 ([fe80::7b1c:6219:1dca:3f8f%7]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 00:48:28 +0000
Message-ID: <9a3a4f35-51f4-42dd-bd4b-3b46e50de170@intel.com>
Date: Thu, 14 Aug 2025 17:48:25 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/13] drm/xe/configfs: Dump custom settings when
 binding
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <prashanth.kumar@intel.com>, <dnyaneshwar.bhadane@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, John Harrison
 <John.C.Harrison@Intel.com>
References: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
 <20250808-psmi-v3-13-a111e9f1e4b7@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20250808-psmi-v3-13-a111e9f1e4b7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0221.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::16) To CY8PR11MB7746.namprd11.prod.outlook.com
 (2603:10b6:930:86::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7746:EE_|MN0PR11MB6088:EE_
X-MS-Office365-Filtering-Correlation-Id: 49739d24-ff31-404d-5879-08dddb9572a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?KzAwbmZsOE1jVEhWaWJESGg1d3RwVDgvOVVRSG1hQ1ExRnFhS3d2UXM2MlJs?=
 =?utf-8?B?bTRLcldGMlJrWGZ3aUJmRDNWcEI3bERHM3NPTmZnc0c2Yk5PZGJzaEpRc3hw?=
 =?utf-8?B?NE02VWJXeTNCS0szRExXMitSSEh6b3RnM1MzOTBSRXpvd1BIbEpldGNvM3FR?=
 =?utf-8?B?NGsyekZlNTZReE0zR25sS1k1aVhSeTYzcWZ6WFl4Z214dDE4S2VjelhMNTdK?=
 =?utf-8?B?SXptVXlNekNsdC9kVUZFYmZ6QWRyaVdVdG5HSjF2WXJTRE9OY1BZWnIxOU5X?=
 =?utf-8?B?ek1kUWNuemNWZ2lHNmlhRE9KR2ZYZGg3dGNFREpwYVRmaEtSU2Q2L3FNbzhG?=
 =?utf-8?B?eWJOWklxSWdHUHY2ZElTUVZBelFDNFgyUGRjaUg0V0xRSzlsMWxaUVg2TlVZ?=
 =?utf-8?B?WExiVStQS0owblZtaUFuTzRBb2dBSmtNSXlxVTlIRkFseVREb2dvOTNOOHda?=
 =?utf-8?B?a0IwWUUyTFBwYXN0OWRjb2NRT1RkT2E2SldRTENiVWFSNWVXRXFuamI5WW5v?=
 =?utf-8?B?YlRNNlRmMmZ4WTRzdW5GRWJBYVFBalRNM0Z2YUt2WWFUczdJaHlSbENwSnJ4?=
 =?utf-8?B?MkkwdkRmUUdqZU9XbEk1WXJMVlNmZndjMGhOWGs1TXI4bHQzb3dXb2VoUTVo?=
 =?utf-8?B?TThHZ2MvOW9GbkE0Y1ZTbHlmZElpMW1IU2QrTGN0UjJzUHBBdk9uT00zR01C?=
 =?utf-8?B?V1MxSllBNE5Pc2VGRm1rRENDWFZKSEdsRy9DZzB6c3NDNHNGUEczSjdaTmlj?=
 =?utf-8?B?WlVjY3VZQW5GbjZNb0NCRTNCZllSNHNVVXNJNHBmNDNjWkhtRzZRaFdUY3JI?=
 =?utf-8?B?ZzhROU0vSDBUVjJBQ1pRcmhOYzJNYW1JM2tCZkJmM2t5SzFsOHRxL0pQbWRs?=
 =?utf-8?B?Mk9zVE1FVEVUQXNGWnFZN0ZPZ1NkUHR5Q0cxR0d0YUp4SEtCYnhSRVU1ZHFK?=
 =?utf-8?B?TkNtTkdNb3h5WHJtWlFmdTNKUUttSHd2Y1BkUVZ2cURBZlN5dVdGRFU1aUc2?=
 =?utf-8?B?VHFtVXZXVE9GbW81Rmw4MEZPR3NjVUxaaFo5QXFyWXZ1QTNpMlY5eFVROXFj?=
 =?utf-8?B?TWI2WVc3S05WdmJRQUt2WVl2N2lJVlpZbGZOcHVUNzk2TVhXK2lZY0ZtcVlQ?=
 =?utf-8?B?eHBLdW01OFRJc2ZJMG9uSXg4SXhtU2lIZzV5TnlYcUt6b2tiZXRDcUVGMW1N?=
 =?utf-8?B?N0ltV0lCb3VTaVZucmFKNi9oSjBGQnpJM3VNbFRRT1NIQk9MalZZeTE2UXFl?=
 =?utf-8?B?T055UXg1c1lWQ1h5M2J0TnJwc1Q3TkNhWjZId2JidGxrQ2g1OXpQM3E3YUVh?=
 =?utf-8?B?Q25rN0N0UTVJeDBjQjRneFpZNXVKWnhycG9kc1lqS21CbjNxNUJSWGtzTkFX?=
 =?utf-8?B?d2ZGbGI5b2FubXZpVVhtVS9xRnBGTnJxb0V1MzkzZXF0QllYdENnM21RMGcw?=
 =?utf-8?B?MTZJbkR1L2Z0Z25LaTdYQ3U1c25UUExNeTYvUnVlZFYvWmRudUhVWFpRVE95?=
 =?utf-8?B?VDRMQTFxTkVoU1hGNmU3WUMvVzY3TjgzMkdwS09OSlZsamRLT0pCVW9aYkx2?=
 =?utf-8?B?WkordWVaa3NqYWpvMnhCajg1Ry8xcmF5czJqUUhGbTNzSDluTWhlVWlJV1Ro?=
 =?utf-8?B?TTRsWGhJNXlpMXFuNmRpZkhVdElvZkpOVGE5MEV0RTAvYy9PRVFJWkZ5OXZl?=
 =?utf-8?B?UGEyL0RsRExmZ3JLUWtLVGUyUktFQXp5RWVWOUxKUjh2L3ZqU2graWE4d09N?=
 =?utf-8?B?YXRVOHh0UHBUZ0hZR1RCL0M0aHBoVzdKZHVZN1hUOU1LUGpSTWh6anhydDQ5?=
 =?utf-8?B?MVE1b1lCWnQvQjFPVE9jT0dFN2k1RVhXSUw3cVNrb1R5WFR2QXFObzl0a29T?=
 =?utf-8?B?eWpSQWlEdUs0VkZmYWcyMlpDTXE0eCtqL1pFY1NUOWU2RVZTZnZNbnhkN3cx?=
 =?utf-8?Q?30DauBWHgCA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7746.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1VqQkUwK0RnNndsbWJJSmNpTS9kUnZ1cXNjQjFqNFhKUlNJYndEM3pIZU1o?=
 =?utf-8?B?Lzk0MkNES0JRem9IQllJMkNZNlNlbGpyZDczcHQ3ZkFnb3l4U1Z0R2g0NThH?=
 =?utf-8?B?SVhzMTIrNmlUQmlCWmgzaGNqaXQ2bzExM3BmcUVRdHRQSWNFS0M4OGJIQlFy?=
 =?utf-8?B?MXlhQkZYTUVkS1NTald3S3R2THh3SWFJRnE5VnRldmxPQnZPQnpQYXdmQkcy?=
 =?utf-8?B?a2NmNkU5ZW5jQVhsNzlDSjFIM29GaWdhSzdheVpkRTUydnhlaSt4NFVrNDg3?=
 =?utf-8?B?eEp2bUhTUlVDMVFUWHYyWWtlZ3VVV082YWs3NXl2b0dOcGVBNGp0KzFaZzdo?=
 =?utf-8?B?TkNVWVNhUGNmbDZaQnBOTGVBUFl4Y20zaFpLMzNIMGxTdWpkclBLYTR6b01U?=
 =?utf-8?B?M1ZRdjdRQ0E1N0hjYkllQTVxcFliRzBWSVl0bmZXcWlIeDVqK3kxRWtSUWpL?=
 =?utf-8?B?Q0ZSbnJUdmVNT2RqSHY0Rk9ZSVhUWHJReGhMdkQ1SE9WVHhzZXdsOVJZaWNx?=
 =?utf-8?B?RzdseFRCb0tRbUd1K2JrT0lHREJTcHVRVktCVExXVVdNM3RES1h5RmNrc3Qr?=
 =?utf-8?B?RHkvRDFzd1BCUmY4OWVGSVQxWWtUajU1MHFRd0tNTEFOaWtPTkc3aU93VTVH?=
 =?utf-8?B?bm1WOTAxUUZINUtWVGdGdDJBaHdNUWc5eUJwb0MwbWd0YVNoVm9OZEFSQ1c0?=
 =?utf-8?B?eldmY1Vxa2w1dVlHK0VLZVNObkozUkJ2UGFucElCa3ByRHdUNUVuODluWERJ?=
 =?utf-8?B?TjNCT2t0OHFTSG5UZ3A4a0M3UGdRNkJ4bnNoaEsxL2poQ0N1UklQR1ZHRXdG?=
 =?utf-8?B?L1hTRU0rRktrZk1pdEpyaHpnRmcydDN5UHBKeVRkdFNsSzdKVjRpUjQrRUg4?=
 =?utf-8?B?NEJoRFFyMFJjMDB3YzFtNTk3Sm0xVjZLZ0ZINjJUZkRLMmVDaGJ4aUFkWVdo?=
 =?utf-8?B?cEN5QUtSZ1BvSlRucWFSYUJ4MTF5SFNubU5EZ1c3dncrU1VkdlVnbVZEaVpH?=
 =?utf-8?B?RVhMTi9BWnAyVmlqMnNnam9VM2hrcWsyWEFKQlpmVll6SmpzNCtEbGwxc1Z0?=
 =?utf-8?B?UzlOUUZIcHM5R1FOblNaVnd0dy8zN3hhcTR3N3Mvb3ZOaTEyeEJsbTVmUUN4?=
 =?utf-8?B?K2w4RG1RSUdSdmUvMFNibnhkUXVzMjh1ODBVY0dhajBPQ3RJUURaTlFxR29X?=
 =?utf-8?B?SEFVWHIvMUxUQW9Ub0VleXA3bEsvQzNpd3MrQldzYUFZblRtcmhwaDY5a2xp?=
 =?utf-8?B?Rnh5cGwzVzg1bDdGNjhGUDV3V1VCejdsVUYvT2ovUEcyaytpNnNmYmt6MlRx?=
 =?utf-8?B?UVdIN2Rid2VNbmZ5Vlp6aU1vcW11TmFZZ05jTStvU0FlcnBDRy9XS2h2Z3U5?=
 =?utf-8?B?MnpkUVlYV1dGc3BDY2NUSUdqbVkwU1RualBMSFhDMlNHR3QwMUppTGVEbm05?=
 =?utf-8?B?dHNuYUdqM3NQTHdDeWpFUHVYRGFmNXFLZStBeWdoVUpOY05xTUlMODN3Nm5v?=
 =?utf-8?B?UVRxbjVPckphYlFsekdlamNwL3k1dUUrb0poTEh5YzVFQTZVZUxuTm5YenRv?=
 =?utf-8?B?U2FYWHl6UWhzcmNoajBKcEJhUFV1NlpBZEUzWld5ZFd6M1NlUGtBZHJMd2xo?=
 =?utf-8?B?TFg1NloyNFE4VXE1czMvVFFlSnoyRy9OMDlzcDh5WGNIaHpnN3g2YzVxNVdC?=
 =?utf-8?B?S1htSWZHaXgwODlFWGE2ZFdha05oMkFXSWZhblZBTTNGUkJVWm1yRmV3cWJY?=
 =?utf-8?B?bEhpdWZjS0RKcTBkdjYwZHZOVDdNUEtZK2dOaStXei9UUEdzR0cxUmMvRU1F?=
 =?utf-8?B?Mys1RkhtOU0vK3hSOWlKQlVKaEZTdXhsZHZ3Y1poT0tVajQ1aVZwNXNnZnJa?=
 =?utf-8?B?M1BFa1VadXZJMVdKR25sUkM0NUt0MjRQUVdQWjRIa3J6eFE1TGJYS1FPZDdP?=
 =?utf-8?B?cXpFSmlIQmN3V1Q0ajhCKzEwMTNwZ3QwU2RYTFBWa0ZNTEliTjQzRlkwN1lu?=
 =?utf-8?B?aTMrblkxUWhHelFyUExrbjBLc21SSkROOGFieXk3YWFkOVZHTG8vd0lmMnNU?=
 =?utf-8?B?eWZrOXZvTnZCSzBkM0xOTkdlTWxRU3Z1aW9Yckx0SWZReGIydmwvYVhSdXNx?=
 =?utf-8?B?a01OejIwTXZOZVpnUXhIam5oL2MvNTZrSDE4MHhvSXZ5bmVhdjk2aW5JTnhT?=
 =?utf-8?B?L3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49739d24-ff31-404d-5879-08dddb9572a2
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7746.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 00:48:28.4637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TRagbtGJIclwGnMt7rnKDaH+Rt6af095PqNe8q8lB99tjHs1gNZtENu5zkUIGw8xsZt2tOZcx0ePGqZSl2ULZb/NOaqnwhuMwxE9OZGSCUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6088
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


On 8/8/2025 10:29 AM, Lucas De Marchi wrote:
> Device configuration using configfs could be prepared long time prior
> the driver load. Currently all the xe configfs entries are for things
> that are important to have in the log if a non-default value is being
> used. Add a info-level message about that with the individual entries
> that are different than the default.
>
> Based on previous patch by Michal Wajdeczko.
>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_configfs.c | 39 +++++++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_configfs.h |  2 ++
>   drivers/gpu/drm/xe/xe_pci.c      |  3 +++
>   3 files changed, 44 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 3b9d24c0bb588..9a283b713ff9d 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -480,6 +480,45 @@ static struct xe_config_group_device *find_xe_config_group_device(struct pci_dev
>   	return to_xe_config_group_device(item);
>   }
>   
> +static void dump_custom_dev_config(struct pci_dev *pdev,
> +				   struct xe_config_group_device *dev)
> +{
> +#define PRI_CUSTOM_ATTR(fmt_, attr_) do { \
> +		if (dev->config.attr_ != device_defaults.attr_) \
> +			pci_info(pdev, "configfs: " __stringify(attr_) " = " fmt_ "\n", \
> +				 dev->config.attr_); \
> +	} while (0)
> +
> +	PRI_CUSTOM_ATTR("%llx", engines_allowed);
> +	PRI_CUSTOM_ATTR("%d", enable_psmi);
> +	PRI_CUSTOM_ATTR("%d", survivability_mode);
> +
> +#undef PRI_CUSTOM_ATTR
> +}
> +
> +/**
> + * xe_configfs_check_device() - Test if device was configured by configfs
> + * @pdev: the &pci_dev device to test
> + *
> + * Try to find the configfs group that belongs to the specified pci device
> + * and print a diagnostic message if found.
We print only if custom ones are found right? Not otherwise.
> + */
> +void xe_configfs_check_device(struct pci_dev *pdev)
> +{
> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> +
> +	if (!dev)
> +		return;
> +
> +	/* memcmp here is safe as both as zero-initialized */

s/as/are?

With the above nits resolved,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

> +	if (memcmp(&dev->config, &device_defaults, sizeof(dev->config))) {
> +		pci_info(pdev, "Found custom settings in configfs\n");
> +		dump_custom_dev_config(pdev, dev);
> +	}
> +
> +	config_group_put(&dev->group);
> +}
> +
>   /**
>    * xe_configfs_get_survivability_mode - get configfs survivability mode attribute
>    * @pdev: pci device
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index 603dd7796c8b2..58c8c31640008 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -13,6 +13,7 @@ struct pci_dev;
>   #if IS_ENABLED(CONFIG_CONFIGFS_FS)
>   int xe_configfs_init(void);
>   void xe_configfs_exit(void);
> +void xe_configfs_check_device(struct pci_dev *pdev);
>   bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>   void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
>   u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
> @@ -20,6 +21,7 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
>   #else
>   static inline int xe_configfs_init(void) { return 0; }
>   static inline void xe_configfs_exit(void) { }
> +static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
>   static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
>   static inline void xe_configfs_clear_survivability_mode(struct pci_dev *pdev) { }
>   static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 52d46c66ae1eb..9ce6e6dca5bc7 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -17,6 +17,7 @@
>   
>   #include "display/xe_display.h"
>   #include "regs/xe_gt_regs.h"
> +#include "xe_configfs.h"
>   #include "xe_device.h"
>   #include "xe_drv.h"
>   #include "xe_gt.h"
> @@ -771,6 +772,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   	struct xe_device *xe;
>   	int err;
>   
> +	xe_configfs_check_device(pdev);
> +
>   	if (desc->require_force_probe && !id_forced(pdev->device)) {
>   		dev_info(&pdev->dev,
>   			 "Your graphics device %04x is not officially supported\n"
>
