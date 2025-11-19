Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85C1CF6495
	for <intel-xe@archiver.kernel.org>; Wed, 19 Nov 2025 23:55:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9026210E6AB;
	Wed, 19 Nov 2025 23:55:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WlIawCF+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE92A10E6AB
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Nov 2025 23:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763596542; x=1795132542;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wltdhX2sSUTzuI0NuPwZeXUncdo+yT7IF0sdMx9eRMM=;
 b=WlIawCF+j0IF/C2aIe4zLPvqXR05uwPU6C9fTwxGZcELQHWzctMIaPll
 BqsLBZBDP56kIDs2Goee/2ic9o7WT08Ezw7j0qaJUEJwtLCiCevQgxQ5o
 cKwzdJy2kuW6fhVcO9JKQ6CdsgEB9kWpsStW3uWm8Kwu8+YcxInApzUIM
 NWu2jPyF2WPF4KQuqEf+EBoAllD9fsPcNVV2zPIzc/RyHfsTmWl79MBSY
 ontZYwx1QRmzSVRUhsjBRCTWb/qe5kA6LjR0e4i3+nDNLFJZauZTUlvgz
 7ypgn2vpQQ2nCPnXbosOlyrX8x4QpEk0pnLByVE4KmPJRJAqlHOPLewDY g==;
X-CSE-ConnectionGUID: rTO+z3L5R3eHD6n1jLgrPg==
X-CSE-MsgGUID: EoijZFVtTqqGhIWmdyKT3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="75981732"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="75981732"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 15:55:42 -0800
X-CSE-ConnectionGUID: 0BEGPsXPQIS81qZWlJo0PA==
X-CSE-MsgGUID: 0bLNvYqFRUuN6wPkQksNQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="228518698"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 15:55:41 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 15:55:40 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 15:55:40 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 15:55:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lPVaqIcFKaWDslIfQ2oQ1vX1tn1DmW9p3jaC/b8ZGskl+dwAi9EysE2LIXVDUSaaP2KcrX3Zos3bK3Wcq1ZHXsPDsDwjuj9dkN2ObpDTLJ0XbrN1i47UN4DXPhtCr+BjfCj/LwAwUc20DLDc7P5D/+jNGM3VdxnCtrFe4hLHnndavZiWli1JCBkCDHLeCqX6qcfJZFkpKPSjLRm20OuM78b7xnUT2GhmtoAu/90BSLm1qPxRsLtMfNNJ1e6ue2Pf1lqQWuv03cKXYATLgufzu0yLiWqkCdwSdIxY6BXHc1LoyKtMDvbJf7UBoIUIHbJmX1N0GW0f+mX9CenLECISfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wltdhX2sSUTzuI0NuPwZeXUncdo+yT7IF0sdMx9eRMM=;
 b=P4J3SC98HEIh/IAqJpqToRGXJ0NZvLXroLaDgpr65bApyMxaZdn+d9riwzaj+MzDTpiWkkrPykGP9XfxEJYl0XHZT/kVNjOK7q6cWW7+dD4A7VmaKByROAawL39jgW55Pl6PgUzJAJvYbdS9aJInd+x2K8wOGdJV8bCheyr4OuPqEOxXkHT0/i088k4g/t3ZfSyuZILM+ZzZw28gTy/sq/+2t421BSDju9FwQkxXsNbK2e4ZRi/m0VR0r0WDZkEXS73i43Y6+QldbxdDY5snEOIpLviuXxokybQshf2D0qiqLnVHx15roFlByp2wFyf+bif6co2barL4GZWQDN1LKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by PH8PR11MB8015.namprd11.prod.outlook.com (2603:10b6:510:23b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 23:55:37 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 23:55:37 +0000
Message-ID: <bee07810-df40-4fd8-9ff2-f52b356be16e@intel.com>
Date: Wed, 19 Nov 2025 15:55:35 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [CI] drm/xe/guc: Test GuC v70.54.0 for BMG, PTL
To: <intel-xe@lists.freedesktop.org>
References: <20251118235218.1788466-2-julia.filipchuk@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20251118235218.1788466-2-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0298.namprd03.prod.outlook.com
 (2603:10b6:303:b5::33) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|PH8PR11MB8015:EE_
X-MS-Office365-Filtering-Correlation-Id: 41423c0a-8022-4297-b778-08de27c722e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjFlZFBISTcvMDkvNUZhM2FQQnJud1BNcHVjeEMzSlFLbXNLUkdTdytaZ3hq?=
 =?utf-8?B?NXRWaWtvT3loV2QxZWxWaFFIVktyYUZIU0d6RkhrQnJ3TG0wa3NpM0VwZ21m?=
 =?utf-8?B?YU5xS2NsTVZkSVRMcTdYOXpOaVNvc2VkZ0s5TURoaDhKYWVtUzJQQXpiZkkr?=
 =?utf-8?B?cGR5U1A1UFlSeXNtRWZmRW4zYXNUU01DREtFcnJuckZPQWhBY1pWNW03UlRk?=
 =?utf-8?B?YmJIeHV3N21TTkYzUzlxa1Q3Yy94SUI3S0NNSngzYzVlODN1dWdvczJaVnBx?=
 =?utf-8?B?QVNxOXUzMGdqbGNMNmswRE9Lckl0ZElueUlCRlFvdVpRMjNKenFLbmtCOHkw?=
 =?utf-8?B?UFZLcWVnNFNVSk1PWkVRRGNZTTVBRTl6MzM0bFdmTXhpQ3J2bEVKVUUvT08y?=
 =?utf-8?B?UFNac2Q4TWl1aEFYR1NaYjJjUmpWYlN2bk5CRytnQTAyQnNnVUdUN1VyaGJh?=
 =?utf-8?B?K2VrYlhMYy9SNGRMSTM5L3pvUlB5WWpBVUVZUFAxRitUMjVTUTg2VW9iV0s2?=
 =?utf-8?B?bVVVUDJtdkhpYlhTdTNvYWpvMDVGZUpGRFVLTStnaXpPbUlMc3VHWFhUaFln?=
 =?utf-8?B?ZW1ITGxxNCtMODBYSkw0NUNpWWVTcFRXR1dHZXFlVzFUTlMrdGo2bUFwSHor?=
 =?utf-8?B?YldJZDk0QkgzWTFXU1VPOENiKy90WHRZOWpaYmt0NnJBTzA1RWw4a1RoTnBm?=
 =?utf-8?B?SGU5d0JRMFc3cGRlNlhXcCt3Wll1RlZGb1lybC91b2xaZCtER3VXRUN1MnBr?=
 =?utf-8?B?YjBCM2hid2t6Q3lWcGoyOHlFZjRkalJwVGMxbDZlRmZJZFo2c2orYi9RR2la?=
 =?utf-8?B?QzZ0QWJwOEJubll0b1NsLzN6Y1I3VGVsUStKMTBNejE3ZkNybUZpZUlIa2c0?=
 =?utf-8?B?Y1J5VWhmNm51VHhVUThJS1hxWjNQNjNOb0ZQNk1NOWlnWlZvRHBVdFlUbHNw?=
 =?utf-8?B?MjVxZmU0OHFCdEZrYkE3L3QzMG9KS2RCTkZwMnorOG1QRG1Ed1J4am5ITmgy?=
 =?utf-8?B?bDFncjJJTjRYQnBJcmlCcmpka0tzaDg0SGRXaTZ5L3BWcndIQzlheVVkNjJo?=
 =?utf-8?B?dWVMcXBHNHI1TytuU040KzRiQSswak5GVTVtRXZJTTRGSXU0LzZjRDgxSlhm?=
 =?utf-8?B?OUJOT2s5QjlveUVOWFUxVUlVajA3b1M1Qlc4TzJFbi9IMU9XRGkvM1ROZUFs?=
 =?utf-8?B?V2ttY251OUg1MHBlNlBrUmNmcGtzTEE3QmYwVEcvdmNlVU5ma2VaWHBXYzc3?=
 =?utf-8?B?a05pOXBIRHZuWTZOUjd2MGNUZ2FmdjlDeS9waVl2aWxwUURRdmFZdHZLSnZu?=
 =?utf-8?B?R3BnZXh4eDNSLzhTa3NNRjBFL2hXdlIxajlseWcycEhGWUo3aFlGZGdNQ0w1?=
 =?utf-8?B?Z255VHpQbEw0OFRvQmVIZ2tLYndYNDJ3cEY0VkpzZnVZVWc4dmxBZjNUbkha?=
 =?utf-8?B?LzQyNTMzMUhsTDN5dTlZZ2lSa00rK3lvcmVVOEgyaVEyUmR1STU5ZWE5eWpa?=
 =?utf-8?B?K0I0NXBIMGcrdll3UlJja1EvTk9QS3k1U1JZa1N1Z05ZdkFjeDkvcHJYQmJn?=
 =?utf-8?B?K1B1ZUt4d2tZZ3hSRExwdk9TelBMOU05aFE3QVVrSmhSUVV3UW1MWlcvVFJv?=
 =?utf-8?B?R0Z4dDBvTWpVSUgwSlRaR2ZyVHl3UlVjdGplY0IxMW5nYmJKMG5iaTBXNjRX?=
 =?utf-8?B?L1YzMHRXeEFra0I1RGJMci9WbW9OWTlTbFhnM1QvL1FiK0tkN3p0N3NDa3hw?=
 =?utf-8?B?ZzMra3dYUFdlZHVHelVjRGtOaFE3VlMvSkZUUnEydG9ENTlJUVZXRnRHYVNU?=
 =?utf-8?B?V2t6bkIzQjg4Q1pMbkozdWVUSWo3RnpGRXR0bGxXdlVUVkkybzcwK2FMbzF3?=
 =?utf-8?B?ckZETm43Znh2MFVLeGdQNytLdHdDdG8xcTUrRDVtK0pIMnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWxZRHJDMng1SnlBZHdjcGRVQW80L0pkaXgwN2tuUDAzZ2FxQ1FmTVdUcTRG?=
 =?utf-8?B?RnJBZWpkL3dGakJOZ3Q5bE1reklMYzFFak91ejhuWlFqSkVuRW1KZEkwN0tz?=
 =?utf-8?B?ejhLbE45UHU0eWRsSDNPU3NjcWk0N2NkMUhaeUVqZHdZRTl3UEFEMGlobmFN?=
 =?utf-8?B?NmIrZmV3M1RjTnhvdVJyR0J2V1U2UEFhUkUzNHU4QTV6ODkyU1hKMlBHckQ4?=
 =?utf-8?B?QU1iSkJDZUdtRktVU2k5SEJMNjBuVllxYmVzclJNSkRTMENXZTV1dnMwcTk5?=
 =?utf-8?B?ck9lNmdkd25TYUVHVjAvTFBwZGM2YlV6TXhmczc1VDhpY3lRVlFvc2ttdTFx?=
 =?utf-8?B?Rm5LeEk0QW5vZjA1Y2J1bUVJR2I5RExOUUhxTENWbXB0YmVWZWMyaWd5TnVQ?=
 =?utf-8?B?WjBzVU5mdHhRdnlBczYvYnVuckhNNHJiV1I4aTg0ckttWGllWmF2anpKcFBn?=
 =?utf-8?B?NzkxQ3FpaUhIRklzYmEzalBiZVFXVWJuRFhQd0dlUzZJclVuQmN0NU5jQXk1?=
 =?utf-8?B?OXQ1bnNCNmhLeWdyYlQ4YUpYSnBoSmRYTXB0SWNGaFJaS0ZrMWFNd2V1ajZ3?=
 =?utf-8?B?NkFNOEIwQnNmbU5yQ2dWSWZLMC9FQzFNR29ubVg0N3VQSDFmZHE0czJoL29I?=
 =?utf-8?B?ejZpaTROcFlqYXNjWU1rVUswMGcxOEdmaUxUYnFDME5FU0N0czVxMEJ1VEI5?=
 =?utf-8?B?Wm5OSEFkNDZzWTVWdmVzZGJWNG82cXBoU0FnTExONGxjcnphL1hOdWgwN2Ni?=
 =?utf-8?B?ekFjZEF2cUFTbXIxVkJKNHhSODRGcVVaaFlLUU0wVCswQktzMGZXUXo5UTFC?=
 =?utf-8?B?S1ZCTE8xV3JTcFdMelAydTMxUFE4Si9lbGIzTGJ5alkvK29CcnlPMnNZWC96?=
 =?utf-8?B?Znd2clM3ZHJxWkRKeUVkNVhuWkZNUE5mRzAyL3o4bHF1T0F5V1ZkWGxJeU9D?=
 =?utf-8?B?R3ByWnZ6VzZhQml2L3hjeG1WVngwOVNtb0xMWnhKTTRhUUl4bDdObEFOK1RV?=
 =?utf-8?B?VmlxMm1mQ3hFUW5rWFpldTRLRUxCSnNHclB2Vm9ydWlRZFpydkI0Z2hRRWxW?=
 =?utf-8?B?eE44cEg0aUtiUVlVVGRMSkFzeGg0bWUrMUFnZDR4RXNNcWlhOFUyQlVST09u?=
 =?utf-8?B?K2twZFBrNDNPdktCdWpreVlMSlEwQldocXFmSzQzTm1FbHE3cnNQMy81WjV3?=
 =?utf-8?B?U28rbjhtMVd0N3JpbzdBUE4vQnZ5UitFcU9ZdnpXS0d0Z3NTczR0d28wSDJ4?=
 =?utf-8?B?Ujg0eVBlUjNab2VCZTJyU05iUWxYaG1pNVIzSGUrNzZPWHNOeVlMZE5mVXJD?=
 =?utf-8?B?amM3QkJDYzhWMXJPYVdkdXJHZEhveDdZRDlIcUVrbWQ2TVlYdmlHYkVrRmpw?=
 =?utf-8?B?L3JoZ0pnYkcxZkN5Zk9nbVVWM2RZUnZwNkpkZGdmbDg5SzJjTmNLTk5zbHR0?=
 =?utf-8?B?NXpybDByenA5ZHhiSlNDMWpDd0VIU3cwUkJpUk8vTk5kdnEzdThxU203c0dj?=
 =?utf-8?B?OTB5N3o5azZHcjRYNUh5MnNhTFlVVzJ3MnQ5a0ZKR2pZNm1ncktZekN4a2ZD?=
 =?utf-8?B?empaNjVkT2pYSW5GQkdSQnJzYWpwazVsR0dLT0N2MmxnbmVDc252YWs3c0RX?=
 =?utf-8?B?WFdOVW9KaXVzYkRHZXBUY3pvY1paZzgrWGc1cUMwOGZCQklydHJsZjhUNS9B?=
 =?utf-8?B?M3k1dFBxNU1HTVdTNmJHNHpqcytpcUpDZGZrMlFabzdWN3VTZTl3M2hDcCtL?=
 =?utf-8?B?ZHh2aEkzUGZxMGhoTlN5c2pWditNdXVkajNTWW1yemRsaEtFcFU5VzJReWJo?=
 =?utf-8?B?WXVnbUovRUNvNmU2cjNWclFYK0EvR2VHMFp3QVlEVkZldUxOWVdqb2U4SVRX?=
 =?utf-8?B?ajNIdWM1VFp2dERxbnNuZUVjMkV4T1IxYTl6NnhqRUZlTXgyMGwzSFRQOEU2?=
 =?utf-8?B?VThHWTVKNkFOdmJ1WE9oZXVRUEVUVWVpcStqZGtOUU11VTE4andSUU0vT28w?=
 =?utf-8?B?bTRZNEc0bUhIemdnYXBJenZnTjlFWHFydXZaT2piVmtaZlRqclR0cVNMU1E5?=
 =?utf-8?B?c0NRWHFkRFpLbEE4WFFXQlYzNWtINCtJakZ5ajhFQlBBeXI1Q0t6MCtTeitr?=
 =?utf-8?B?ZGEvdjRjdWVMZjBJRzVMUmZMV0RTVmloV1NPV285b3k4dkxHVDFHNjcwaVpu?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41423c0a-8022-4297-b778-08de27c722e2
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 23:55:37.3067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /m1G5VbO7I+iEvi92qxLPOROC2VoZFUJ2iIdN5cnMMoszJi/2zOq3F9ldS2+EzRyxqmzXkyPpyjTD+89vIL9VRFlbXfqadHrxjw9kjSm0Ss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8015
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

Rev #1 CI run was missing new firmware files. Rerun-has good results.

https://patchwork.freedesktop.org/series/157751/#rev2
