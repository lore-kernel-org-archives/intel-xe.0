Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C187C8303C
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 05:35:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1091A10E9AB;
	Fri, 11 Jul 2025 05:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CN4d8E/e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1282710E9AB
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 05:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752212116; x=1783748116;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Z7dxbXL5yOa3CE7MdTGZuOUC6B8JCxWIqdHTrbZfI3w=;
 b=CN4d8E/e4LqkUxkR5StK5TWU3cvhI47cIHlypDB9FcfIJ/VKhR/e9Zd7
 iIJ0Zffe0T0eVP9WDYpATMQATtOPC6HUW2ARZiPPNDPN7luhmhNDvyfIB
 MAKv5jxwhBm4mbo6leZziHTfd/QNbF+6jaeJ+S0j9g+qKKkwoSS47veGp
 ocGGLApD8B7FlRFof8EQpnBRjluLd6qU4rYLIUCafRcfG/6sPbdiJW8zB
 qu2dWPRRQrZ7O2ey0OM/3gaccfSEuOTdHvfc63plZq+4vmmS84VlQINyE
 JPPDLWGAtesPOs7/1As9w8kEwnvCThN83m1J1Y8UZDDL5nh5PCa6ABvwm g==;
X-CSE-ConnectionGUID: IBTsfLwDTPKWj0oULNuN9Q==
X-CSE-MsgGUID: t3nZ24qyQset9twNhAv3dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="79937473"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; d="scan'208";a="79937473"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 22:35:15 -0700
X-CSE-ConnectionGUID: cNjQNI/hQ1y6xq5SexunPg==
X-CSE-MsgGUID: s1ZF/onMQ6ikurjhJN1L9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; d="scan'208";a="179980158"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 22:35:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 22:35:14 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 22:35:14 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.76)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 22:35:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ia439wDpaKr8ugUz9n//o6SEGKZOPNqfuRaXh+5uGQDJABcUvsb2SY8FqDzRexSMJvdpZ8F30fQwAvkDF5Ejz0e8Et5OZg7K4fSwaBCSoJEcd/1ItvyIsoZERCgbVxDkuCOdYs5BgErAtLazrvn87ys7VEtj5TtWokw9T1E5lsuUudRaYroLuCbjNqf4UPqE9TbU+Ihf+XU7TOF8SPvi9My36LgiAhfH9WUswyUf/8hVf4dcsvQM/QkOklnBBCM39wDq5cIFtZpoW3DwIbnKZIPv1bjoepeTpZil8QnhHLpmQjbyeNg0uLwfdLoWmXeY3j8qmaSYsXLOSfsNeUE0PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5S4/UMgK74y2/qWWOmsUGBB+YWKIV2hOATIIfoVeJk=;
 b=OOX4XZs59h+WfeJjLfmkjXnlThZ0t9i5Sgsck1AMv0A/U9Fq2uh0Cghoe4lg6gUmYhEs0B7myQojmkSkdcQ9r+GWpjKqzqvz0URJCpI+FH+uEp5zAdPzC17nrLxhC8K8zwu5d4/Amgze5YTwxbvpnN7Kj+WI10b0XxBiCUwjONUlxm4DKADd8uoGi7yyUd1NcVg/jWfMfXJGs+nxvm/hnqwuewA9gdFu0aATOx0chZhPBWtI9CSyOJxAsPaigXJ03Dj+qCrz93t9CPe865EKlCdPB39142nA49VvDJCQRffOvIf8SIFUauy1LUs6XjWfasVRvUmyHe790j396suY5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW3PR11MB4697.namprd11.prod.outlook.com (2603:10b6:303:2c::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.27; Fri, 11 Jul 2025 05:35:13 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 05:35:13 +0000
Message-ID: <31500245-25e8-4f98-89a6-c321b56271cf@intel.com>
Date: Fri, 11 Jul 2025 11:05:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/9] drm/xe: Add support to handle hardware errors
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <lucas.demarchi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <frank.scarbrough@intel.com>, <sk.anirban@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
References: <20250709112024.1053710-1-riana.tauro@intel.com>
 <20250709112024.1053710-8-riana.tauro@intel.com>
 <aHAsEY6SY6O3DnMM@unerlige-desk.amr.corp.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aHAsEY6SY6O3DnMM@unerlige-desk.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0088.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW3PR11MB4697:EE_
X-MS-Office365-Filtering-Correlation-Id: 00bc9d4c-a7b2-4c9f-b3fb-08ddc03cb51c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1VCZHNiUkNJMXoyMEJPaHptVXdEOWpkVWU5UHFGNldvTlFaekFhbzNWWWg0?=
 =?utf-8?B?c2VoSCtjWDVvSDh3Rzc5RzJwS3NxSzA5WjFrNFl6NElsZkFPeEI3RkIrczZx?=
 =?utf-8?B?ZmhDenhMQkNMRUxiL3JJYjhoellRaTRjQ0tjWVVtQk1PT2twOXZWajBGZHBN?=
 =?utf-8?B?eENmSmdlblZ4YVY2cDdpaDI2UUxRV3dHd0lkRXpxYzJJUVZPaGxJcVdVRVAz?=
 =?utf-8?B?b04yWk14VFhCZG1PK3Nwb1NzaWltbkltWHVCb0FRM05nT0xURDh2TkxZdkwx?=
 =?utf-8?B?eDB4UjhIdjRNVmgyVTl2bnFJV0Z5TmlqMTJLVEc4b1RvSnlsSTd0bUpFdVdl?=
 =?utf-8?B?aTNNZVdSRUFzaU9scTVJTVRBa0x6WWRqVFhvSDFhM3BFWkhkd3NlRFB2Qnkr?=
 =?utf-8?B?Y3F4MVZCV0ZiWnJiS2pINVlLc05FOUlkQnduUUhaUWZiSXN1ZmRPa1Mvbkk0?=
 =?utf-8?B?V0k5enladkhIVCtLQVhhUGJxanpRUnFuVmNVRWVFYi9iS3JoRE44dVBoa0Z5?=
 =?utf-8?B?NnIvek1VVlJZUmxSVzJQck9DOWNyTjlvUjR5TTNrM281TmFkdFRqZ1ptWG1J?=
 =?utf-8?B?VGNtc2JiZHJLUFpSa01wZDJ1N1VhZ0ZwSVMwRm50bGVPRHRwVW1EbHBXN2Uw?=
 =?utf-8?B?VHI3R3JaaHc2bytKYmlrY2lQbTZ0ZHNCWlN4QUNNZkxseXJWeGgrM2VBRTFK?=
 =?utf-8?B?N0d2VkloTFhpWXBFVmtGNkVzLzlmUnB5cDFCY3NhM1pTTUltbFNEbzF0OHkz?=
 =?utf-8?B?ZGxsRVdqUDZjNm93ZWNIa3RXTXZmTWRHaVpNU1IzUlpuakQ1aHRtZUFmd085?=
 =?utf-8?B?ZitqdUpNaERCUVVPaUFpL2tqejI5N2NWd0k3VURSMFNDV241QUN4OXVabWRU?=
 =?utf-8?B?ODJYNWJ2NHZmSFYvZm9ydWk4SThnUVdRQ0dnQitrd1FMQjlwU09FVTYvamtx?=
 =?utf-8?B?MXFnam9VMVlwajdPSENQZmF3YUt0eWd1TnE5UENKb0JnRWtTQTd2YmhtdmlU?=
 =?utf-8?B?MkM2Yy82QUZGdXhKWXpYZGd3aG1nWVorT2MxeGpVbmFRNmZwVXB0SS9HUkho?=
 =?utf-8?B?RTM5RTAvWE5nSFpzbjZTckx4Zzh0RGxYeUVBaXdDcEFoN2NtRkc2cXY1ck9M?=
 =?utf-8?B?UG85Ym80aEJ0eWF3WUhNU2hUdEVVV21KSXNPTW5MOGUxQjRTZVpmK1prcFFD?=
 =?utf-8?B?TzVSd2pGL3lXZnJLaFhXdTFjaFZZNUNrckp6WkdIVldMcXpobDUwMmFVVGpi?=
 =?utf-8?B?OVVObXRnWjVWMGVSV3FDUFpFdG1jRkpCb3REb0pQNEp1Q0dmWFdqRHZBajBm?=
 =?utf-8?B?ZWpkQWlnN2lPYkpmWlEvZjdFelpTbUxEaGNjazdBaFU2RldnemIvSEdDNXht?=
 =?utf-8?B?WkhrOXlkWXFSZUk3UGlCZ3l0dXF6dWN6SkZWUk4wcnh2MEZoMng1OFVKRngx?=
 =?utf-8?B?YTE0SzMrTUh1cnpPRDd5KzFrVWoyb1BaaHhYeXpEbDVuWkJrUlVaSTZHcUFk?=
 =?utf-8?B?NExJUFhBUVFwOE9PaUVHbmk3UUMxb2VjL1hCNVNDc2RiZmhHaUZnV2lBYjZ6?=
 =?utf-8?B?a2hWN01MbDFSa01MSkp2b0FQVmtRNWZVTFlxZEw1VWswQnlLbTZzbkhtRkNu?=
 =?utf-8?B?U0Fsa1FXdmlGZUFmZERxb1RSdFZvVWlUL1VEWHRkYkI2ZkkzSHNnTjBMVno2?=
 =?utf-8?B?WUUxZjMzNFdFSmdzS0RQMjlFRDVFNmtZYm96OGpFb2U4cjFvUWZKMk5mNDVv?=
 =?utf-8?B?MkREZ0c4M1daT1huRmljT29vdElXTnY5K053RW1QbE1CVlhMVmhDYmo2dW4z?=
 =?utf-8?B?anh0QUhmRjZObHNveXA0M2VHWlVHYzVpN0M4MzJFZE03MFluR24zaU1nQWFh?=
 =?utf-8?B?K01MNEgwNnBtOTkrYVFqbWgyeEZTbEp3ME1TaWdDdERJcGNuakpPU1RrT3Vm?=
 =?utf-8?Q?rh46y2r0dk0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czQxMzNRTVRkRFVGbFJ3VW1iM0FUUi81ajlHSlBmOFZjZkNhc0VsZEt1WjFY?=
 =?utf-8?B?V0RvZm9BcHB6MzRDS3ZDU1N2UDd4dEwvMGUzaXpLVFpIcTNMM3pVZ20xdnhC?=
 =?utf-8?B?V1BBSWwrejJuN2JVclVVcW5rSytHL3hWTXNHR2JHampibEREV1lGNkhLRnV6?=
 =?utf-8?B?OGNJMmFBVkwvbUZvRlZ2MjBLMmhsU0JNY0srL2hmZVB6Vmh2Y3FtUGppdmFW?=
 =?utf-8?B?dU53M1BJeVd2YUNIMWhyVlNvTzI4K1AvRzBLTHdjaGNKVTA1NEZkZmNFdWpY?=
 =?utf-8?B?OGpmamFTWHVYYVNiMmdlNmgvVmk5cmM5dTVXSDNsWlJxUDl0ODNjVmlNV2lm?=
 =?utf-8?B?Sm5pNm92T3ZYVEhmeUkraG4wdnI4WWJYbGVHV0RQTFF4bHk5NzJIVDBpOTBQ?=
 =?utf-8?B?LzE3ZExiSXFaQ1JKQzl0ajNYRnltZ0diVW43YlE0blhCU0hoNklmUEpiK2di?=
 =?utf-8?B?Q0poL2pycjFNTVJKMnByT09PWGJnMXVmbnNpcUFzQWJGMEtDTVU0Zmp0VXdV?=
 =?utf-8?B?QzhPU21OY2hERlZwN3NDVEdjZEdyV0RRWHFJbVE2clgwMVdIcHRHc1Bja1di?=
 =?utf-8?B?MzRyMGR1T1JtYmpVNEU2RmdheUpKV0Uwa1FBTUltKzJML2hrRHhlQUdzbTQr?=
 =?utf-8?B?TlhxdStpMHllNVlIUnQrblFUTGlvOUwwangxTTBpR2E5UldLRGFRbzhmdVhN?=
 =?utf-8?B?Skx1TEZieXQ2TVRPdStWeVpMdVFMSE10azY5cWxTdVRMWFYrK081S3NhUHo2?=
 =?utf-8?B?RlY0WlIweXU4dnVxZ0p2ZEQ5MDRteHRvZ1BCN0NnT3Q1TlYyOXJ6dG85eElN?=
 =?utf-8?B?SEZnMjZJR1R3YndrUXVwdTdPQnFRV3E5a21yUlZZRzc3Tkw0MjZ0K20xY2lW?=
 =?utf-8?B?YmNzNGw0VGJMa2VGdXh6SHN1S3h2TzR0dU4yVDJHMit4MG50RDZ1cVYxNS9T?=
 =?utf-8?B?VUZGYzBnWkhPUE85UkdCZWpPNVJqRlU5a25zRFNtQkZGMGxIaG1Mb0FjY2JG?=
 =?utf-8?B?NUlrWGZyekxiYnZNMUFXTFR0M0tJMEtGMkU2WDhBNlQwTUR0RkVCSytLcUNv?=
 =?utf-8?B?UUNkSXlqdkh2T2J1enllSnhjNlMwYUJobU05eWZFd2tnbXN0M2xIMERjeUhP?=
 =?utf-8?B?RHZXbXNrVERRWmtySmZkdEpYS0ZqVjhoYm9jVnNHYTBWN254Zm1YV2hXZUxu?=
 =?utf-8?B?NjlkY1NibVRoN1NkQTMycllVMElJVWx0ckNQMEF0ZzIzSHRIc0k5TGI1VWRC?=
 =?utf-8?B?b3RxbmxDTHVQMzZTSnhmMG5BU3M4Q2F3SHdONi9rL0pyRllabmJjazZ5MEJa?=
 =?utf-8?B?a3lld01lZVFjVmxra2s3MWlKV0NsZUNyODhXSTlpQnd1cnUvTlFJOHRoUm4w?=
 =?utf-8?B?M2RoaGR5bU5OM0RjSVc3TDRiV3VGNkJ0T05aSTJEa2FaN2VKb0E2R1hKYmsy?=
 =?utf-8?B?dTFqVUwrWUdTUXBqYm8zQ3NvaGo2QXB3QkVHQXRSaHBFYkxMTUtLSlZBK05X?=
 =?utf-8?B?RjFFcFNKRXBIam5CcCtwR0VlazZxNHdYa0Nha3BtRDZ5anZMOWtoU3Y1TWpz?=
 =?utf-8?B?S1ZWYUtLYlNzQWNYc1dNejNQQnJSd1dUam51VjVBK0I5c0JWbjE3djlXRHlw?=
 =?utf-8?B?WTJRY2lEeUE0aDlRZjRGTXcrUC8rMnVWN1kyVmxBSXM2NnI5c1RablpFQ0dD?=
 =?utf-8?B?Q1pWaWtsMWpWaW1iWkpKNTlnZ2QwREs3OXl1am10dUhDeDBRWUprZVVzRUx2?=
 =?utf-8?B?OFlxZFVidUxRYnJzZ1lhUTY4am9oc2VpWUUvRGdSd2R0UDdCWWhFYXhyQitR?=
 =?utf-8?B?cW1hQWYyalVOT2hFQkthSDY1b1doYUM1Q054V2ZaeUwrL096MCtEZWtUSE81?=
 =?utf-8?B?cmxPN045SzNsWGMxTC9ZTUJjSEl4S1NndDBhdktLa25SNmovaGRCSlYzcnlo?=
 =?utf-8?B?TWZBWkowVFp6R3dqK3ZGWExSeWdzVjQ3VmFpQ3VMd3R5NGg2YUM4Tks3Y0xl?=
 =?utf-8?B?cWlST3NvVnczaFVkT1VaVXlRSzdwaDBIbFc0VEtuaHU2SytrREVLZjhiWU1E?=
 =?utf-8?B?cGJCZTZQZ0pzK0FCOXFPY3Q1S2dGaC9WcmY3bmxWQ2FTUlVwUUk5c1U1MDVX?=
 =?utf-8?Q?aoKNGzVUuYNZCe1TWbZjLZAJ0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00bc9d4c-a7b2-4c9f-b3fb-08ddc03cb51c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 05:35:12.9347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QXy7yzM1ffCcDr/09sqcl6ZYN9C4wOBFkbeLBSa52PInpQJqFrrm54U89gB2H7VxhFQnlfvwYT/GcnTE1+W+Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4697
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

Hi Umesh

On 7/11/2025 2:39 AM, Umesh Nerlige Ramappa wrote:
> Resending since it got lost earlier...
> 
> On Wed, Jul 09, 2025 at 04:50:19PM +0530, Riana Tauro wrote:
>> Gfx device reports two classes of errors: uncorrectable and
>> correctable. Depending on the severity uncorrectable errors are
>> further classified as non fatal and fatal
>>
>> Correctable and non-fatal errors are reported as MSI's and bits in
>> the Master Interrupt Register indicate the class of the error.
>> The source of the error is then read from the Device Error Source
>> Register.
> 
> nit: Since Fatal is a separate category, maybe a split here into a 
> separate paragraph and some formatting would be good.
> 
>> Fatal errors are reported as PCIe errors
>> When a PCIe error is asserted, the OS will perform a device warm reset
>> which causes the driver to reload. The error registers are sticky
>> and the values are maintained through a warm reset
>>
>> Add basic support to handle these errors
>>
>> Bspec: 50875, 53073, 53074, 53075, 53076
>>
>> Co-developed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> drivers/gpu/drm/xe/Makefile                |   1 +
>> drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  15 +++
>> drivers/gpu/drm/xe/regs/xe_irq_regs.h      |   1 +
>> drivers/gpu/drm/xe/xe_hw_error.c           | 108 +++++++++++++++++++++
>> drivers/gpu/drm/xe/xe_hw_error.h           |  15 +++
>> drivers/gpu/drm/xe/xe_irq.c                |   4 +
>> 6 files changed, 144 insertions(+)
>> create mode 100644 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>> create mode 100644 drivers/gpu/drm/xe/xe_hw_error.c
>> create mode 100644 drivers/gpu/drm/xe/xe_hw_error.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 1d97e5b63f4e..fea8ee3b0785 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -73,6 +73,7 @@ xe-y += xe_bb.o \
>>     xe_hw_engine.o \
>>     xe_hw_engine_class_sysfs.o \
>>     xe_hw_engine_group.o \
>> +    xe_hw_error.o \
>>     xe_hw_fence.o \
>>     xe_irq.o \
>>     xe_lrc.o \
>> diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h b/drivers/gpu/ 
>> drm/xe/regs/xe_hw_error_regs.h
>> new file mode 100644
>> index 000000000000..ed9b81fb28a0
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_HW_ERROR_REGS_H_
>> +#define _XE_HW_ERROR_REGS_H_
>> +
>> +#define DEV_ERR_STAT_NONFATAL            0x100178
>> +#define DEV_ERR_STAT_CORRECTABLE        0x10017c
>> +#define DEV_ERR_STAT_REG(x)            XE_REG(_PICK_EVEN((x), \
>> +                                  DEV_ERR_STAT_CORRECTABLE, \
>> +                                  DEV_ERR_STAT_NONFATAL))
> 
 > For x = 1 and x = 2, I don't see the above result in correct values. 
Can > you please double check?

I had got confused with the same when i took the patch from the other 
series. But the second part of the macro becomes negative and the 
registers are correct.

Calculations for 1 and 2

#define _PICK_EVEN(__index, __a, __b) ((__a) + (__index) * ((__b) - (__a)))

_PICK_EVEN([HARDWARE_ERROR_NONFATAL = 1]) = DEV_ERR_STAT_CORRECTABLE + 1 
* (DEV_ERR_STAT_NONFATAL - DEV_ERR_STAT_CORRECTABLE)
					    0x10017c + 1 * (0x100178 - 0x10017c)
    					    0x100178

_PICK_EVEN([HARDWARE_ERROR_FATAL = 2]) = DEV_ERR_STAT_CORRECTABLE + 1 * 
(DEV_ERR_STAT_NONFATAL - DEV_ERR_STAT_CORRECTABLE)
					    0x10017c + 2 * (0x100178 - 0x10017c)
    					    0x100174

Thanks
Riana
		

> 
> What about DEV_ERR_STAT_FATAL?
> 
> Rest looks good,
> 
> Umesh
> 
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/ 
>> xe/regs/xe_irq_regs.h
>> index f0ecfcac4003..2758b64cec9e 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
>> @@ -18,6 +18,7 @@
>> #define GFX_MSTR_IRQ                XE_REG(0x190010, XE_REG_OPTION_VF)
>> #define   MASTER_IRQ                REG_BIT(31)
>> #define   GU_MISC_IRQ                REG_BIT(29)
>> +#define   ERROR_IRQ(x)                REG_BIT(26 + (x))
>> #define   DISPLAY_IRQ                REG_BIT(16)
>> #define   GT_DW_IRQ(x)                REG_BIT(x)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/ 
>> xe_hw_error.c
>> new file mode 100644
>> index 000000000000..0f2590839900
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -0,0 +1,108 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#include "regs/xe_hw_error_regs.h"
>> +#include "regs/xe_irq_regs.h"
>> +
>> +#include "xe_device.h"
>> +#include "xe_hw_error.h"
>> +#include "xe_mmio.h"
>> +
>> +/* Error categories reported by hardware */
>> +enum hardware_error {
>> +    HARDWARE_ERROR_CORRECTABLE = 0,
>> +    HARDWARE_ERROR_NONFATAL = 1,
>> +    HARDWARE_ERROR_FATAL = 2,
>> +    HARDWARE_ERROR_MAX,
>> +};
>> +
>> +static const char *hw_error_to_str(const enum hardware_error hw_err)
>> +{
>> +    switch (hw_err) {
>> +    case HARDWARE_ERROR_CORRECTABLE:
>> +        return "CORRECTABLE";
>> +    case HARDWARE_ERROR_NONFATAL:
>> +        return "NONFATAL";
>> +    case HARDWARE_ERROR_FATAL:
>> +        return "FATAL";
>> +    default:
>> +        return "UNKNOWN";
>> +    }
>> +}
>> +
>> +static void hw_error_source_handler(struct xe_tile *tile, const enum 
>> hardware_error hw_err)
>> +{
>> +    const char *hw_err_str = hw_error_to_str(hw_err);
>> +    struct xe_device *xe = tile_to_xe(tile);
>> +    unsigned long flags;
>> +    u32 err_src;
>> +
>> +    if (xe->info.platform != XE_BATTLEMAGE)
>> +        return;
>> +
>> +    spin_lock_irqsave(&xe->irq.lock, flags);
>> +    err_src = xe_mmio_read32(&tile->mmio, DEV_ERR_STAT_REG(hw_err));
>> +    if (!err_src) {
>> +        drm_err_ratelimited(&xe->drm, HW_ERR "Tile%d reported 
>> DEV_ERR_STAT_%s blank!\n",
>> +                    tile->id, hw_err_str);
>> +        goto unlock;
>> +    }
>> +
>> +    /* TODO: Process errrors per source */
>> +
>> +    xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), err_src);
>> +
>> +unlock:
>> +    spin_unlock_irqrestore(&xe->irq.lock, flags);
>> +}
>> +
>> +/**
>> + * xe_hw_error_irq_handler - irq handling for hw errors
>> + * @tile: tile instance
>> + * @master_ctl: value read from master interrupt register
>> + *
>> + * Xe platforms add three error bits to the master interrupt register 
>> to support error handling.
>> + * These three bits are used to convey the class of error FATAL, 
>> NONFATAL, or CORRECTABLE.
>> + * To process the interrupt, determine the source of error by reading 
>> the Device Error Source
>> + * Register that corresponds to the class of error being serviced.
>> + */
>> +void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
>> +{
>> +    enum hardware_error hw_err;
>> +
>> +    for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++)
>> +        if (master_ctl & ERROR_IRQ(hw_err))
>> +            hw_error_source_handler(tile, hw_err);
>> +}
>> +
>> +/*
>> + * Process hardware errors during boot
>> + */
>> +static void process_hw_errors(struct xe_device *xe)
>> +{
>> +    struct xe_tile *tile;
>> +    u32 master_ctl;
>> +    u8 id;
>> +
>> +    for_each_tile(tile, xe, id) {
>> +        master_ctl = xe_mmio_read32(&tile->mmio, GFX_MSTR_IRQ);
>> +        xe_hw_error_irq_handler(tile, master_ctl);
>> +        xe_mmio_write32(&tile->mmio, GFX_MSTR_IRQ, master_ctl);
>> +    }
>> +}
>> +
>> +/**
>> + * xe_hw_error_init - Initialize hw errors
>> + * @xe: xe device instance
>> + *
>> + * Initialize and process hw errors
>> + */
>> +void xe_hw_error_init(struct xe_device *xe)
>> +{
>> +    if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>> +        return;
>> +
>> +    process_hw_errors(xe);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/ 
>> xe_hw_error.h
>> new file mode 100644
>> index 000000000000..d86e28c5180c
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +#ifndef XE_HW_ERROR_H_
>> +#define XE_HW_ERROR_H_
>> +
>> +#include <linux/types.h>
>> +
>> +struct xe_tile;
>> +struct xe_device;
>> +
>> +void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 
>> master_ctl);
>> +void xe_hw_error_init(struct xe_device *xe);
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>> index 5362d3174b06..24ccf3bec52c 100644
>> --- a/drivers/gpu/drm/xe/xe_irq.c
>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>> @@ -18,6 +18,7 @@
>> #include "xe_gt.h"
>> #include "xe_guc.h"
>> #include "xe_hw_engine.h"
>> +#include "xe_hw_error.h"
>> #include "xe_memirq.h"
>> #include "xe_mmio.h"
>> #include "xe_pxp.h"
>> @@ -466,6 +467,7 @@ static irqreturn_t dg1_irq_handler(int irq, void 
>> *arg)
>>         xe_mmio_write32(mmio, GFX_MSTR_IRQ, master_ctl);
>>
>>         gt_irq_handler(tile, master_ctl, intr_dw, identity);
>> +        xe_hw_error_irq_handler(tile, master_ctl);
>>
>>         /*
>>          * Display interrupts (including display backlight operations
>> @@ -753,6 +755,8 @@ int xe_irq_install(struct xe_device *xe)
>>     int nvec = 1;
>>     int err;
>>
>> +    xe_hw_error_init(xe);
>> +
>>     xe_irq_reset(xe);
>>
>>     if (xe_device_has_msix(xe)) {
>> -- 
>> 2.47.1
>>

