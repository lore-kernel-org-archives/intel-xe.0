Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9817D606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 04:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=luzrWN9M
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E0D510E351;
	Wed, 11 Nov 2026 04:59:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CC110E351
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 04:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794373174; x=1825909174;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PeRGVcbj0dxnrdy6Guw4bb5dYKweBZpFeGJrZKP/f6I=;
 b=luzrWN9M1CHvglKoVKS0xfYKUdagXhBCdEYyX/dZrTgxe3O10J+SUNHm
 UgDwfuwEqMmBT8xGWfY29C++QX7AHKzuAZoqBbhUWWbHU2En/eJNQnDXH
 K45Stz4h+7uuFpkIyoGiops5ZvSrjAq10xo2/b+psBRld7MG8wAzsCa4g
 oRNsumSEZtMWzxJ3mBc5D5SK0kD+4d76MLK7df8RNmfiatyxDop5o0/Hg
 FqVWuOE4hwMMF1ly/8TqGYg9cASa5m+8T8b9xIyZm75NZ7+7SsrONZbsv
 kQQrETFnWl6Umz/xXOI2vp7J3QzvgmjqXn5PaCnPKW3/+EH1et7brdpFm Q==;
X-CSE-ConnectionGUID: Y3T7/g6sTgu2iUMXlI4Njg==
X-CSE-MsgGUID: deSjxlk9QRe1NG16H6z96Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3143621"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3143621"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 20:59:34 -0800
X-CSE-ConnectionGUID: laAutMmeSJCIOfySu7CEiA==
X-CSE-MsgGUID: F2iJQma8TS+BcPHXFQt1Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8901881"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 20:59:34 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 20:59:33 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 20:59:33 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 20:59:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aYgjVuye49bB5c4rO13o3d5oUTJl9PYucJgrU/lOsOI37H+v0tZNCqJv0P54AOFDvwvd8no2Y6qv1DD6dwgXQ8kEVUABA5q5t9oUd02iBfZWEWrUGtybbz780Gt53hAkiDpzJRiWZzomzaiVEjp5xYygEf8p5XD9osfwPxmrsNGiZe1Rfss8WGupirYTryn/crkfW81wnhX39NNnr881I/n2ORmFhfsj57ok0dO9KBSII896PBvXkAE/8QD0bEX8gk8LFrdhsuI5Dk+LBj0xTmo5Lf0GcUSSKkkiqBF80rHweJX91ABlQrQByyWPa97KsXXZDDpDEPzduq7OJAbDuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6WeEfDYitSy0m4sbtLyc9WPIlam6JiuMT/T5wmtLHI=;
 b=ujh4YqBsotWaoC8Br2UcXjO1DPgw2PreBwq5/cfeqk88g0lbiN/HS524gh6AYcbIrOSiBxecDZl2qMIgP+eTIxZZy0m8YOWUUp1mIj4wuomUWTypWiLxMU+1eaqj5Na3BZbYIenVZJGfimnSdv7ozHUpxElVWBucRUytCI5rNBXkv+RlmejXV+yEqdO4R2A7iDBazyq2cmxpjivBaXcyURDriInzQ9qEWOxl0+3H7jTyx8tj7ZZsVcC8l+mgnSvHDC4w9GrjrBYx8oododRB+34jfk3onvUg805twuaFxwuVyueFW8yPuCHNvyhzU8QoKgnDkOTrIcdEnATTcwX0vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by SJ5PPFBBB839A03.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::84d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Wed, 11 Nov
 2026 04:59:24 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 04:59:22 +0000
Message-ID: <67e73d89-4476-4ecc-a9f8-4d434fada796@intel.com>
Date: Wed, 11 Nov 2026 10:29:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] drm/xe/cper: Make software CPER emission
 atomic-safe
To: "Nilawar, Badal" <badal.nilawar@intel.com>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <jani.nikula@linux.intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20261105085348.1467925-8-mallesh.koujalagi@intel.com>
 <20261105085348.1467925-12-mallesh.koujalagi@intel.com>
 <de3b077f-49d4-4c5e-b3fb-dc95279e85a4@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <de3b077f-49d4-4c5e-b3fb-dc95279e85a4@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0241.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::6) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|SJ5PPFBBB839A03:EE_
X-MS-Office365-Filtering-Correlation-Id: ac3f15e5-5658-4195-4665-08df3fb08d4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|11063799006|261026140227099003|261009223027099003|261021121427099003|56012099006|4143699003|261102123227099003|261021123027099003|261022113327099003|261022105027099003|261022075727099003|261028144727099003|22082099003|18002099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: Z0YWpIRJaskvzZNCrfu1GdHS197LUJHy6qfjtfhH0DbqsLmzohbwrOokFAIyKrY5LzOMfXw89Eagd/5Q35o9/w8Jge4Se5jxsWAWk53BFxp2KC+FAeoFU/Bfi97ZKBLbm4e4R79CFNVPhiYixC8pEM60dO+BrcSwvwppmlCvw3OvjzdywMxg5ojxP5zj5bkl8k/pcuyHOc+B5AR8gLETBACaEtsi6brOLjCRiRfS4UcqsTtmTnGzvf9+WWdiBH9rbQuqeawLMCadlafGrcwT0vUm/vI5/pcDSI//cVoddNyyCJSzYrQTmvOjXTuSrJxKst4JFcxJQkBNJgCRhtdu2ZgmDWKvftIhy47N/E2UzPqbFj8TW8vAAjsKz9gyP9zCTQyd7u8gXfHn//+ooRMTYhWhpNmEzL0BvE5M/5De4Ke60tWaBIUbRHQYHnqQhahJ/3LIm2HmM9sIYo2ZUFPZtjFMjDv29wnkwnsTVdRX+0AkWNABEVnUtGIoBf/0653X1P+kgQHhjZyC63NvVK+/NWmbt56pdJeu+FGrryhUHGdBQoifbbUJ27ifjTI66oOO5lq75Hwc9RP9NQHGnWRlbxviAugwFY4SPyDviFRDD96YoBto3CnBb7e4ITxAtcVo5gBuk1k4MDNDLgnGypFeuQxD4n57Mt1RMMF82jnrpSI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(11063799006)(261026140227099003)(261009223027099003)(261021121427099003)(56012099006)(4143699003)(261102123227099003)(261021123027099003)(261022113327099003)(261022105027099003)(261022075727099003)(261028144727099003)(22082099003)(18002099003)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3JOcE14U3lGYUpQaFcvUFBOdkRqZUsyd2lQNmhLYXZyNXJVbEtnREgxUmkr?=
 =?utf-8?B?YUNDK2NFekg0MFNCalZhaHRqMnFyWmFjU1VIU0lDSzU0M09McE1pbFVLUkhT?=
 =?utf-8?B?aFRMYm5sZHBrOHBabndyajhGYmpjMjA3eG5Gay9KY2VmVnpqZkVIcFl1eEE3?=
 =?utf-8?B?NUdXWHZjaXRtWVV2MU82T1Axd0FmYTBxY1ovMzRBYlgvbkFtbUZkd1NoWHdZ?=
 =?utf-8?B?MlBNT0YzU3pmQ3BMZHA4RTc0TTEwZUt0UVBqRGxiQkZvbno4eEpDWDVwNUM5?=
 =?utf-8?B?ZjVod3M5U3NCZ3FySjVjbmowRml2MnN6eXFDWW8zcUo1UEVHTHQvY0tpc3BG?=
 =?utf-8?B?amlBa2p4Q3U1TEMrV2ptSDRFQnFrYitYc3VJaVRCTDNPMDRqN1R1RHN2L2dC?=
 =?utf-8?B?M05GekZSZVpaNnJzK3A2WWI2ellGZS9YNTY5bHdXVHN5ek81a21sdjdGYWFR?=
 =?utf-8?B?YWpwV21wNGVCNFRCdE9ZWUJac2tUMmczay8xRUVuN3FZbFQ2T3FwM3IyYXZk?=
 =?utf-8?B?enBPMW9kd0xaSDJQcHdSandaSERXTDBNaXRDVFRXc2JyZ1U0UEZPcmtGK0JO?=
 =?utf-8?B?V3hIbG02b0FsSEU0aEJkcWhERVpsdmNRMGxUbVBHdDVLdEdiUVRHZ21ZTVM0?=
 =?utf-8?B?NERnZGhMb3VDNVR2eDVQZC9nOXZRYk1jeFRrMUlrejVzNUl2QWhmWG11Nzh1?=
 =?utf-8?B?N2xXa2RNTDFDM3kvZEpDcFByT3U4MHhDTU5Gb0IwOVJ0WEdrdDF2UmVnOU12?=
 =?utf-8?B?MVVCbStjcTZwZFpLenVWekhUVW1TMnNiQitWQ3UxYjBjdHNsMjViSmtoZm1z?=
 =?utf-8?B?ak84bkNHVzlzK0RkekNmQ1REb2VTejlLbzF1SldlZEszeGswRU8rL0JETTFK?=
 =?utf-8?B?N3B2eXBTVGdYREVsN1hnRE5lenBaQVFYR2NyV2dTcU93UkZVMXUzR0pSdEtS?=
 =?utf-8?B?S2o1eUp5TUtGWnRnQlZVV3VDdzNZYzhQa1hZOHhyRmJqV0t5VVppUjhiRTFq?=
 =?utf-8?B?UWN2MG1rNGx4a1FWenVoblFDb1JJUTVQNHJrN3Rma1BEWGJUUjQ2amhTYTdB?=
 =?utf-8?B?Q0sza0VPdjFMdTVEUllScEZKU0IvTzBIZkpvOGlEYmtDOFdMQ3JxTXdrWjRr?=
 =?utf-8?B?WmZmdVZYMmVydlptRjBWSlo1NlgvbjJFdzAwcGhtaE9CTmRiUkRxNmtlK21o?=
 =?utf-8?B?YXhiRjdXbXoyNS9vMERFZDVtM2VudlhxYjIzOXMrTU5VMkV1OHRpM1dydDYy?=
 =?utf-8?B?RUhMQTdWWkcyalJoMUMxTnZBT2N2MGllQ1F2SU5EQStaaXRYZ0EwcFpHNlJE?=
 =?utf-8?B?b3VFQnVnMVN6ZTYwc0NMYmd3UFBJalpQTHBMclNDWmtBeUtwNnA5OCtXUk5Q?=
 =?utf-8?B?dGtOZkhHQTJpV0V1Ykg4bDd0YUgvVFdhMEMycThUZHo0WkttbHJjdWlUTG9s?=
 =?utf-8?B?QmdzNzE4YzlDS29JcklJeHFwamNNcGdVeW80ckY1SExFMk9pMVQ4VkM1N3FC?=
 =?utf-8?B?SzBPd2szOURPT3Qzb1VKTm02R0Y1QlJ3RnA2RC9uZytoeE5hVDZQR3UyRjl0?=
 =?utf-8?B?WlhnZUg4WE02VDZzY0lldWRFRXdTcHpzb2hkZkVITldQYkZCcUJHNlZLTGNm?=
 =?utf-8?B?Q2UveS9LVC9jMDJDQjkyMG5XYi84NE13YVdadnQrdTRhWHV1SDlVMmVYQVEx?=
 =?utf-8?B?UVpDeW5DVWl2UEZiN21aR2hURytuMm1nTlQ5UEEwSVhZdnlSVC91ZmJVdSs3?=
 =?utf-8?B?dUFIeWdLY3g4ZkVmWWFjdzVZUEM2UVEwdE9Qdmd2QTJWbGM3blhVRVhxdVRD?=
 =?utf-8?B?azRDYys2d0ExTVNYcnl5S3ZQNWJrQUsxRk5ScDJEcldxTUJsZ2g2TDdsaWQv?=
 =?utf-8?B?aUVmakNqbXRzcHhMMlhqSDlwUm9PaDg1clRreURVeXFULy9HUUxXejByRXZB?=
 =?utf-8?B?K2tMUCtmNGNUV0U4dHgwQTlqNHRPV2lQZkh1TzZvek9pU2xlaSsxaDNCMjRU?=
 =?utf-8?B?WnpPbXlsOVJEZWdtOTBKMms2ZUtLbjNHSDZZeEc0bEVhSmVJSVNXNmNPYURH?=
 =?utf-8?B?SkJ3RlhJUlRTUlFsZ0dNY00rdFpsRnhkWDNIeFdJZU1mcC91OGhZZFBwcDNo?=
 =?utf-8?B?WlNWTUU2cUt1dTRNR1F1TWg3eU1MeEJKNWc3MnJyaUwyRWxucHBFblV0Zjgz?=
 =?utf-8?B?NTNsM2tpUFVrTkdESWZNTEFSZG81UVRkSDUrMXpCc1U1WWM2U1hua3ZCZ0x1?=
 =?utf-8?B?M1p4L0pTSUxOTTdrVDdzQW9zZ1BhanJ1U0RSZXRlcmlualJ1VVNYOFFuaVN1?=
 =?utf-8?B?VnZGTS9LUjVhZ1JGT1JEYnZWVEhzSGFIb0pnSTdpV3UyU2k1SVdkL25oZXZz?=
 =?utf-8?Q?+t8hcOmi0de1wcL4=3D?=
X-Exchange-RoutingPolicyChecked: OJiyBVjTMvY/EFBcZdU78s+TRk/zAwSVWc2+PcaLJ2eyM3K5XVCYmC9daSxZqIKWaYD+h/jsO7s1Vok5nh7xYq4BT33v6Puq/+346pkl88SqHEutURj5aJWueZwj3VsAwtPqVQ/lSSJscXqpSzOSd/WhaVjK4MtKsVenUQnTABxYceBLZWD3xrvnJOVLtCAdRayAFUE4eSN7piVyPZbbt1tXhaSxK/ieDzQv/fKJzgyRMq6hgJnV1fXPWfQ/0VS58XcK68mzuw1Z3zMB3CcHIqAIq3s5AHm/o3chissjlf1lgwxgx9SUnetJjdah4i8twEJArbRoqQT6bXynZBbPBw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ac3f15e5-5658-4195-4665-08df3fb08d4c
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 04:59:22.9031 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ccl16zzowBV+0hVHbv33ULf2zHM+Jy/6Tilo5zcSYs8WDWaI9R1rHCATQKSzpIkkT8DGhce9QWIg4o1doluonTQwy8Bm1+BHAt23pVumKgA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFBBB839A03
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


On 10-11-2026 08:31 pm, Nilawar, Badal wrote:
>
> On 05-11-2026 14:23, Mallesh Koujalagi wrote:
>> Use GFP_ATOMIC for software CPER records, as software
>> SIGID logging may occur in atomic context.
>>
>> Keep hardware CPER handling unchanged.
>>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>> v3:
>> - Handle atomic context when SIGIDs are logged. (Sashiko)
>> ---
>>   drivers/gpu/drm/xe/xe_cper.c | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
>> index 9510dcd1754c..8c683e320194 100644
>> --- a/drivers/gpu/drm/xe/xe_cper.c
>> +++ b/drivers/gpu/drm/xe/xe_cper.c
>> @@ -173,7 +173,7 @@ static void cper_init_section_desc(struct 
>> xe_device *xe, u8 severity,
>>   static void cper_record_emit(struct xe_device *xe, u8 severity,
>>                    const guid_t *notification_type,
>>                    const struct xe_cper_intel_hdr *ihdr,
>> -                 const void *einfo, u32 einfo_len)
>> +                 const void *einfo, u32 einfo_len, gfp_t gfp)
> May be bool can_sleep or bool atomic?
>>   {
>>       struct cper_section_descriptor *sdesc;
>>       struct xe_cper_nonstd_record *rec;
>> @@ -181,7 +181,7 @@ static void cper_record_emit(struct xe_device 
>> *xe, u8 severity,
>>       u32 total_len;
>>         total_len = sizeof(struct xe_cper_nonstd_record) + einfo_len;
>> -    rec = kzalloc(total_len, GFP_KERNEL);
>> +    rec = kzalloc(total_len, gfp);
>>       if (!rec)
>>           return;
>>   @@ -228,7 +228,8 @@ void xe_cper_emit_counter(struct xe_device *xe, 
>> int cper_sev, enum xe_sigid sigi
>>         cper_init_intel_hdr(xe, &error_class, response->timestamp,
>>                   sigid, response->value, &ihdr);
>> -    cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, 
>> &ihdr, NULL, 0);
>> +    cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, 
>> &ihdr, NULL, 0,
>> +             GFP_KERNEL);
>>   }
>>     static void cper_emit_hw_err(struct xe_device *xe, int cper_sev, 
>> enum xe_sigid sigid,
>> @@ -275,7 +276,8 @@ static void cper_emit_sw_err(struct xe_device 
>> *xe, int cper_sev, enum xe_sigid s
>>       msg_len = cper_format_sw_msg(vaf, msg, sizeof(msg));
>>         cper_init_intel_hdr(xe, &error_class, timestamp, sigid, 1, 
>> &ihdr);
>> -    cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, 
>> &ihdr, msg, msg_len);
>> +    cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, 
>> &ihdr, msg, msg_len,
>> +             GFP_ATOMIC | __GFP_NOWARN);
>
> Why __GFP_NOWARN needed here?

If allocation failed in atomic context, it's going to logged in dmesg. 
__GFP_NOWARN help to avoid

filling dmesg with additional allocator warning (reduce dmesg noise).


Thanks,

-/Mallesh

>
> Thanks,
> Badal
>
>>   }
>>     /**
