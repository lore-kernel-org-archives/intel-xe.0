Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6682E606A31E
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 04:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mxnAT9kv;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=B9Xic344
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2800E10E105;
	Mon, 23 Nov 2026 04:46:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 576A410E105
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 04:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795409153; x=1826945153;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AoKB/CPm4Hnmmf4AeGVvNMeJR4HS+43E+NOnGw37OIU=;
 b=mxnAT9kvWx9Rp5GslvDWfHtYt/hGaDHONfwT1azjHHTv6knrbacJ4MY4
 5rMQfUyqRbhtfPTUZeqL8nG7h0bLLEcQr6+xl7ELXgd1USg518Op9BDJu
 cxUZv4dpYFVRHLD63Tl8IRoTgrfkXYuq4ZUe2BNAzUGzOPLByOnYd6qwI
 J6Jb5pnWdYfS7FEKB8veBnEpwIkiBxndbPNvH+jcg2xwliJTBUK0H8Qt/
 uW4YfVZGFJ/6b89SRRXbaOdH8jazPz0gZRWRUzj1RfHoPow5PrltHMq5t
 6fadDyTGVtlqqG/cwA68YbrkHny9TCd0euVssa170AmTvzDxSUhKZYhr2 g==;
X-CSE-ConnectionGUID: UtilBt4MTh2BTpXXhMIVYw==
X-CSE-MsgGUID: V0z1/GsUR4mTOnftXNhswA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4092649"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4092649"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 20:45:52 -0800
X-CSE-ConnectionGUID: iSXjOqXlRIKOvQnmDFTuPA==
X-CSE-MsgGUID: 4oijPN7USMytxpxTQnQA+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11081107"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 20:45:51 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Sun, 22 Nov 2026 20:45:51 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Sun, 22 Nov 2026 20:45:51 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.7) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 20:45:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r8KEf0kmPrPp98Ndug91Vs5XVgUU80/z72NbOEIQ3hxhPTGlhEdIFFtEDSTFMfSQaO1nkmJ0owod5IcLA9DP29KFZoFwYF51UhhCN9VrbCS2IWC9CJcy34oc0aroa+gSypQpNo1dS2engbBY5SFjb2NGkZEG6AHB1n64gUnlmUb4VQrOzo5B8RwaGRoN6F+jBMqfCeqji+bZu3pkKzWBj9dM/0k5lDJ4oQ6LRnls3ol/IQ5Z+kEaYjrPYN51AXvlXetdixHznK1Yjbo5TOGshbghYVGuAt4O1fZYaC7DiL1/TYTm9GfX/XH7vAcDguw1yTuour2w22aovaA6I/KalQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FFpk5tbimi0V4MJYummu4PoItBqpR+3/nI/m5YKEsuY=;
 b=yThazEb4Z7PRqhc5oiGudryYaJWSAtg6Jmx3urqLYI4WI0r//4EBQDtayW1uQ7Hs0fDDuYt19ZJUf7T5oa+TxesDMywfvMIcCG36leC8Y53r0KHaKqvOqM8dStbxqEvpAGv+BVgHrzm1rzWkd6emYaUvObRiWW3HBcwnzsUz9De1yt0uX/t7adltcdlOMtupk8tjkvt7ZGv9xDFdj1QdAw0JTnX6G7NmjzM8NvzOG2+QB3dpAOrla/Wjh11vzxfw1gloPwwytXEsqsb0PWbd70+HyFGF73jrfuzmhHa3MChExpgvM47VJQk2WZhp0kWwFUzrlxYse0dFCt1BoNaJzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFpk5tbimi0V4MJYummu4PoItBqpR+3/nI/m5YKEsuY=;
 b=B9Xic344xzJNUW8C+3HnjCdc+Z8DJqHoc+fy5ipR+SEF4cBf++mEacS9qysSCqB+dJNrjdzmYbHq5JrCh0TAMo3G7TCDviBVhAbZeN3f5q90TxqO71M+c10avL0U+vx8Ep7k78vtZbpzNIfBmNgLQn1l/WgUJYx6ciyg7EOi8VU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS0PR11MB8070.namprd11.prod.outlook.com (2603:10b6:8:12d::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.14; Mon, 23 Nov 2026 04:45:44 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 04:45:43 +0000
Message-ID: <7c6a255a-6e1b-4fc0-a952-3526783abf80@intel.com>
Date: Mon, 23 Nov 2026 10:15:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] drm/xe/xe_ras: Skip gpu_health sysfs commands
 during reset or wedged
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <soham.purkait@intel.com>, <raag.jadav@intel.com>,
 <anshuman.gupta@intel.com>, <mallesh.koujalagi@intel.com>
References: <20261119163913.1760721-1-ravi.kishore.koppuravuri@intel.com>
 <20261119163913.1760721-2-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20261119163913.1760721-2-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0252.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS0PR11MB8070:EE_
X-MS-Office365-Filtering-Correlation-Id: ddfe089e-8fd4-480e-dbd3-08df491ca217
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|20046099003|261009223027099003|4143699003|10067099003|11063799006|56012099006|261102123227099003|261028144727099003|261026140227099003|261021121427099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: K1+pAGzVJkytFc70aC2Gv8bjXGLFGZwla4kIlofR2/36EfhG/VC9TdJSFsMVUWva+2MFK6TZGDkyPZozFcsUfxmj1PbWIVhUC2JpiExU8APg4pbuwq8MBZDKyGgvN2QRgE9S2GrnzpECp7R9FSIN7cqEddhVy3DaQCKkPq3L9ozds7/jmNCA3JQd/3CGtDiftjH83bRbdP7ljXaCZW12jquD/j8S7vefx+e+lkCLGw+j2n6NVnrYVwkPt8FgCCcIHwXZCsV6g737h+SA6/URE4/xq/8jK+iSYgGZYNDgtsfLunxEjgR+HIEhUMuHA+3XJPUNwcOmGex3e50vj6m5GD0tEhyK7ocolpTr9DObKFqLkLzKxPhOOSeBqFWRMKAU+40MqFTE5C+ZZxyCs84cNmbe77TNRNFZvHrkC0Esnc+M5KfTtRcXN/D05hD3Gj9XCJDXBl5jg7d8jbmXEQSxTVInJVbCyioyeKlEyBa7YVbgcUUeuktxQI0+p8aRyI+4E9J1a6P2i2+lKydtcNvz5wWFN2b0X88AEKSiJbuoqLT22E9i5qULdj/cP1IV46DlstO/OFPq42tBoGyh2g4Ej17W4KvpiUhfFk5f7zLQULT5x0GzY/sAFs3yY9fRu82j
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(20046099003)(261009223027099003)(4143699003)(10067099003)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022105027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGhaTnd4dXk2UUtBd1VMTTFXOXNsOEFUZm1LWnRxU3cvM01GNDE3cW9BZDJ2?=
 =?utf-8?B?bm55MDI4cHl4aHVQQzBVZ0ZOM2trWlN0dGlvNUJINXZqQXZCUGd5eElOVmR1?=
 =?utf-8?B?ZUtHUXF0REhwa25IZjRIK3daVnlZbklhdGFSbTNzcGhLU1p6elp4VEd6UnJi?=
 =?utf-8?B?ZUx2TVFJZXo1OHVUSzRwaFpRVHR4R3VBWm5hMGtyRUVXbHBBUnNTVUZQR2hC?=
 =?utf-8?B?TFVlOEVNQ3h1M3RybW9OWjBwemo1WVFvOStMZDRsd2dLN3ZxNS9weUYvMEo3?=
 =?utf-8?B?Y1Q2MS9mMmhFRXZKenE3OTBLRllyY0FSdmlRRzlnSHdYaStzRHVlRU5lZTZU?=
 =?utf-8?B?SEtnZEpsSEtHMDdHL29rUUV6azdvYVRCN2MrcFN0QS9iRkMzVmtNTDVCd1ov?=
 =?utf-8?B?RHlGQU9oeWljSHZIeVVqTTc4dU9yTXdaaVg4VkJNZlBsRGMzaitPaHJTRHV2?=
 =?utf-8?B?WGxnUjN2SEV1TUErdThqcDBGSEFVMHBMVEFlL0NPMHVWdmtGdWtVa3VXaCs1?=
 =?utf-8?B?YVkrVHZrRVJmeHBTdkJHQjRCdTBWdE9EMFZhbXRqdTYyZHpNS1RLYzdhNEhZ?=
 =?utf-8?B?YjlZajh2MTh6WXVHbWFhVFFLS0dHb0M3bmxSWktpQ2VlT3NYb3R3RVBaNnNB?=
 =?utf-8?B?cFZtdGdZYWd3UDBYS0hEYUYyMkdDS3V0Ujhud0RNREMycEh4YXVhVVBMcmow?=
 =?utf-8?B?em1SdTV0TUhwdi9EelZwekdKRVBsM05mQTFRMVE1RzNCZXphcVlDZFBkUS8r?=
 =?utf-8?B?V0VPb2VnMzdnakhwSmxQWjV0ZGFoeml6U00vREcyeXpTTFU4eTQzU1Npc0Zx?=
 =?utf-8?B?K2ZsSHRweFJ4ZVZnQ2JHREthd0RzQ0hMM0xJNmxYZ1FBaERiekF6UWl4QzRJ?=
 =?utf-8?B?Uk85ZGVxRldaVGd3UENLOVZnbC9VRjFqOU9yTGVDUHVJK3dXWCt0MzRUV3pN?=
 =?utf-8?B?V0E4cE4yRnhURmFSVUhkWkYyRCtHRW1qUUNiZ3l4eXJIejFHWklRNGJ2WGov?=
 =?utf-8?B?RDVyK1hTMFFmOXRLQkhPY3ZhcFNlcXQ1UTVqM1lyNCtBNkdPUldKSjBPU21J?=
 =?utf-8?B?RitIbTk2UlMwdlRYemNVQ1l6d3FWS1lqb1A5S3Y2UmZpN2QrR0hHVFhPSlBF?=
 =?utf-8?B?Wi9rNU5nRm14MUxsZmlQMVFHSGVvQTQrcGtvY2JHc2lJRDBBVDd6Q2JnYlFK?=
 =?utf-8?B?dFp5TEM4eTJJaTRzTm1yaVFOWUlveWpJelFORFpWcFdCNmk2UVdobCtjanRx?=
 =?utf-8?B?ajFzeHdTQnEyVXZ5TUlzRkdNcUtvS0hJRFY3eWN6Q0VZNGg0aWlEU2R4TGpr?=
 =?utf-8?B?NmI4U1ovdWlyeWgwRFlIVyt6NFRyRUNZSldGRTZhMThucXE3bjNvZTBiUnkx?=
 =?utf-8?B?VW5YaG5EaE1NU05WUEU5a1NLVnNVMTlKc01TTFRtSnBWRGZpUnFZbEIxOGZp?=
 =?utf-8?B?RjRzZ2hwdGp1aS9CbVVLc2RxRS83anZySDV6REpubUx1NUpDK09mZlFGVXdJ?=
 =?utf-8?B?My9FVXAvZURYbUp4eFQzNFVUclJMalpnWjVtUVpwdUlDRVVXbzlyUFp1YnRz?=
 =?utf-8?B?WlhaV2Nkc1hDOVE1RmZlOWRTZmhqWTY2cGROY1JHdlJYU3VBdGYwQlpIZFZB?=
 =?utf-8?B?N3k3cXRCa2UweWlwY0xiWXpaVGowUUNBNnZDMDlKR29sR2t1RFdxY1d6Rnk1?=
 =?utf-8?B?MU5XellFL2NFQnJ2Y2N0OGxFSDlYQlZkU1NNUVNrcnpvYnQvL2tYYnZ0cHY4?=
 =?utf-8?B?Yk54ZUpVeEZ1TnBHa0ZGSldrdFYvRmd0OFNJdDYwejg0NlZzaEJRWjFIclcx?=
 =?utf-8?B?aVYwK1Bpcms5N3R3L0xHUmRwODd6bmpuNWdPbUFjdHdDbXVGU3lXVEdVMHgw?=
 =?utf-8?B?bTFJOXVsRllxRjhPOU9memdaUjNwT2tXWmN2bGNKTE1YanlvZDExRmlLSXRQ?=
 =?utf-8?B?dmgyUGYrVjQxUU1QZ0dhWlRRUUxnTmtCdnVldUtMVlFaR2NRUDdBUVlrNjRm?=
 =?utf-8?B?RC9mVFdpc1E0NnQyRnZlZ1grb0I2eHkvRzR2TTJSRVk0c0dYVGFPYlUrcjRw?=
 =?utf-8?B?a0dvZEU4REc4UGp1ZWVrQnhmQUR2R0ErYUNwUGxPbEpnTURONE9FMnJyWG9O?=
 =?utf-8?B?a2lNcmJpTW94Z2RFaWl0M0dqMnQ4ZWljSGxabE9vc3Evcm1ZemJYK1JsU1Q2?=
 =?utf-8?B?QlU0alNLclEzSEhNdFlOSXdFOWRuUHdMNTV1RzlnYXZzayt2d1c3bjQ1ZVI2?=
 =?utf-8?B?OTE5MkJEdkpVaWVmbGhYcjJiU1NHbytYVWJkWFA2MGJwTkNaRERFbnBjVUFH?=
 =?utf-8?B?OUdKcVFoUkJ6MURsWWxWcmNqeUwvZ21TZVhrTE1ETitrSEtkdUJtQT09?=
X-Exchange-RoutingPolicyChecked: LNr1ycnrOjKXtn+Wqa2YfbQg/6pQx8qawNJsEiYJKJe/BlJLN8fA5VGxrPVolXW+O6cyX5bunXE5dtMdW0AydfSOLkaGr39qXpNwUgFocLQU3AN/8BihpIQopM+rEKkxp33Ifa1SBuQeKn87O3R4p8zhgLUd8O0boHiW9ur6GFGpLcauLwQdT/yi3z5wuf9oZDSOKwLet6/ffuBoXYypzcjzvBaRibCICwZWgi+FH4XZNhbrYDYr8k+y7WbR1nn/YyUw4lDQmf416/SRSHEhHtbvTlFAlI9r85JzqxJiTBT+55v/rCUqkqsIm2W2ItQY8cCj2SxSP4fgF/mi9Acb4w==
X-MS-Exchange-CrossTenant-Network-Message-Id: ddfe089e-8fd4-480e-dbd3-08df491ca217
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 04:45:43.8342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hUidy9//jOpofMLWMKQmTwJuuZQ12wusPW5m/27B5vL4WmKL283/gXExaS0Ec3waj3PbcuzerNwIddFisjxSww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8070
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


On 19-11-2026 22:09, Ravi Kishore Koppuravuri wrote:
> Accessing gpu_health sysfs attribute sends a command to the system
> controller. Add a guard to verify and skip if the device is wedged or in
> reset. It protects against touching the fw or device when it is not in
> usable state.
There is no need of a cover letter for a single patch.
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ras.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 0fb891d00b36..47f6b91edd9c 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -1134,6 +1134,12 @@ static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr
>   	size_t rlen;
>   	int ret;
>   
> +	if (xe_wedged(xe) || xe_device_is_in_reset(xe)) {

Lets not use xe_device_is_in_reset . I will be removing 
xe_device_is_in_reset in later patches. Please take a look at this 
series 
https://lore.kernel.org/intel-xe/20261119102344.2053821-1-raag.jadav@intel.com/ 


Also add a skip for no_reset case.


> +		xe_err(xe, "[RAS]: GPU is wedged or in reset\n");

Log is unnecessary. If there is application which keeps reading, this 
will unnecessarily cause
a lot of error logs

Thanks
Riana


> +		return -ECANCELED;
> +	}
> +
> +
>   	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_HEALTH,
>   				  &request, sizeof(request), &response, sizeof(response));
>   	guard(xe_pm_runtime)(xe);
> @@ -1177,6 +1183,11 @@ static ssize_t gpu_health_store(struct device *dev, struct device_attribute *att
>   	if (state < 0)
>   		return -EINVAL;
>   
> +	if (xe_wedged(xe) || xe_device_is_in_reset(xe)) {
> +		xe_err(xe, "[RAS]: GPU is wedged or in reset\n");
> +		return -ECANCELED;
> +	}
> +
>   	request.health = state;
>   
>   	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_SET_HEALTH,
