Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B90AC3DA7F
	for <intel-xe@archiver.kernel.org>; Fri,  2 Aug 2024 22:43:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1509010E201;
	Fri,  2 Aug 2024 22:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A3Rj6egZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B86510E201
 for <Intel-Xe@lists.freedesktop.org>; Fri,  2 Aug 2024 22:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722638602; x=1754174602;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lVjnlIId2IQA0967usALUD7a9IUH7mUjCVTlIej4ysc=;
 b=A3Rj6egZWTZToOLoUCCotp9ocNmLlSVgNMCg39b7PoBrhNRl352rtMX/
 GA+FF/1Rhty/K9Q7KNvwFjT5eNPUAV0v8QHu3yFVSCRsHz0nffgZD9ct9
 XC+PZeLhne+xxSeYeyyyqGcTCiQrvVaH0AvVruL3QWs/yl4O8+WUol97Y
 bRica95em8DHWQcTl1er9kAY65vB44JUrLCIO9o62GXZIecMkzBVLfUZR
 cERXk2JvdXEl2pOzgOZ9lgll50FAsLbMe4k4xA1Ggi0AfLdDwuAemUCUl
 PynVdDvV21aHboFEkA2XVfpGPNW6fe1TGjxpZUj/angK9+/LgcHsoyVXA A==;
X-CSE-ConnectionGUID: X23sDGfMT/aw3ChJmYJa5A==
X-CSE-MsgGUID: VXNK7Y4rSFWBGOfaR3/7gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20825827"
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; d="scan'208";a="20825827"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 15:43:21 -0700
X-CSE-ConnectionGUID: EvnAjckIRwidV5W5OsFobw==
X-CSE-MsgGUID: ilgtbJHlTJShDR7ISz2UKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; d="scan'208";a="60551662"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Aug 2024 15:43:20 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 2 Aug 2024 15:43:19 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 2 Aug 2024 15:43:19 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 2 Aug 2024 15:43:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lgEv2zgGPfxgUckKyNDfjN5CG8AsFbmTtEMXRGgY2byedyFDs8WnArxKUY3gfRX+CSQ/5SXDkIr8ZavapndVasz6/+4XbQg4L/QlfRefXzjK5wr/b72mtaS6JqQ3yD7DYsGmthFMhWzR00/A410hh8bb7+2k9We5FHZqBeKzXpJ3jkeCR5De97Zk/EE8SiT5lqQuLVvWp/kXhpKCFDmx0qNTI+yQ9YtDSI6/xUh/PHxIMzKhCjBFwUCWN+xFOC3007KW8J6uU3PbXyhbfIQwbHkK2SFQcQNKByjeh0XZkazfje9xic5cqEOsFtqv5d0lWBk15LzyeHWKxgwVcLZ4GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+DDuNYiuQXzoX313BYer8iezD+TuedY3ndlkHbHXA0=;
 b=BiZbkzub0MJU1Rcu5htPVDUIoHTW0TEz/rQkWFYOwDznPlVVKHdvYqW9DQlj08uYXo2Dc8Djq5uOpsKCqajMGN2G0DUZJOXDFXeVO4dTjGqQgITYKVBXF2HuFmeTuyNUC99VQrIeVLL1rFARJabj4mGhMdUS+XNrb99Y/sJ/DwcGjaSagYC3TqbjyFqEOFI2NPVUWVx+fAHuZgVYjV7x9k0E52UvSDLky0cMcMCf85GLRFIaJlDpm3AtR6ZClLXMWZTCVF/i6oFyuo5G0wfof2BX4GE7US4ffL5L8AD+7b5Huo0/MuzTrtgJBhhIDCc9cIP+i6bTyH/zA+VjQ0n8Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DS7PR11MB6295.namprd11.prod.outlook.com (2603:10b6:8:95::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.20; Fri, 2 Aug
 2024 22:43:16 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.7828.021; Fri, 2 Aug 2024
 22:43:16 +0000
Message-ID: <b7090a37-90ca-453e-98f9-922da6379c6c@intel.com>
Date: Fri, 2 Aug 2024 15:43:14 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] Revert "drm/xe/guc: Pre-release GuC firmware
 v70.24.0 for LNL/BMG/PVC"
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
CC: Julia Filipchuk <julia.filipchuk@intel.com>
References: <20240802222129.3976212-1-John.C.Harrison@Intel.com>
 <20240802222129.3976212-2-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20240802222129.3976212-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0073.namprd03.prod.outlook.com
 (2603:10b6:a03:331::18) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DS7PR11MB6295:EE_
X-MS-Office365-Filtering-Correlation-Id: 187ff5ea-7cbe-4e11-adce-08dcb3447fbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzZ1ck9FMmNIcFFPT3ZQY2VOVHdNQkF3MUpGazdGVDFxMkEzNTN1SkV1dmcx?=
 =?utf-8?B?Q0k5T29MQWw3RHFSQXBiT2tHcnJHcTRJOTQ2dHVJd2M2cnJhWXFNd1B6ckFY?=
 =?utf-8?B?elRBbW9TWTZmRk1FMEFuT2xnZHFQQlNnVEhVSkE0NnErS3VudjF0ZmtpZHM2?=
 =?utf-8?B?QkJaZ3Vram04aVFlN0hpNWJqdW1OOHpyRldKNkYxOVZJbHVQUXpNeTlHZjM2?=
 =?utf-8?B?bi9UR1E1M3Y2Qnl0d0VQL0lIeE9vZG9TMEQraHgzb2FDM2JBejh3Q0ZQWElD?=
 =?utf-8?B?c3FQMmp0Yk5RUVk2K2tEMTNicExlVU9LT0tjYkNucEZxU0FIZnE4Z3FkZHpq?=
 =?utf-8?B?YXlvUEZ6emcvcWd6OW5VMlRJL3N5RC9pMVJjVmtLd2Y5UlltTUtaTGxjN1hF?=
 =?utf-8?B?aUd3TVNhM0UvNE5YZ2dnQkVFU01wR3pENmNEZHgrR1N0eHI2UnFhOWo1RHBs?=
 =?utf-8?B?T014K2pGcjdMZmI1bC96TVlFLzhwYjFSeWdGL3hIWC9kMEtjdjNSQ2hkeGN3?=
 =?utf-8?B?ZEo2SkNWWlAvcUVjMDNkWlBuM3ZpVEZPakk5NFlxandUOXg3YXVXUWVVdnRi?=
 =?utf-8?B?NXFPOTMyVjJ1SjBwcFFXenZQdWZZRStJZWcvN3NvRVB5VEJOd1prWkJpRGpo?=
 =?utf-8?B?U0x6Y01Vd3NiNDRhSkJxSUxSNlRsQVRmNDg0am5CbUJWOTBMMzVURk82WnBE?=
 =?utf-8?B?R2VMeHMyS3RUVTdQUWZNNVlyQU1jOUNhR1NrQkFrZ0tjK3RGd25QbFZCc3pu?=
 =?utf-8?B?djRtOHdxQTdqRi9ocU5ZZnFMSkx1UDFIOVFkWEJEWENqUWhrUHkrZHpnZStV?=
 =?utf-8?B?TVF2UnJpQmFuYWJUQUJITDFoYmI1OHZhU216dUtkV3V6eER0U0dBQ01HYzNq?=
 =?utf-8?B?SzkrUW5VNVRzMUloWWNJTG8rdDRKSUZMd2NtYURFOWpUVy8vaHAzRmJ4RXNl?=
 =?utf-8?B?K0xSWjJ3RTZTWFlFanlGeDlqenh3bmtJTnlyTlM2aW80MEI1TzU0OG96ZjlP?=
 =?utf-8?B?N1ByWk9aelN0aTl2a09lS2d6c21jZkVHTnRPQnZlanU0RjdJbFdQVGVqeXAx?=
 =?utf-8?B?UXEwRFY0Zm1RQjJGZVZoMHVBR1RZbVZvTUg5amdOQ2drTWdML0Y5c2dlRFkz?=
 =?utf-8?B?N3JnMUd3dzc4YzNoYlhiZW9FRGFMNDlTYjhOS0NTS08wNkxjbTljeFE2dUxz?=
 =?utf-8?B?OUhORFAvbFhUaDQ5dndFTDBUSFk3WGpWdjNvZW5XT3NBVjc5T1B0VkR6Zzlp?=
 =?utf-8?B?YjEzT24vWDhiTCtkL2lTS1doM01pMDF5c2N4U0RmblN5UmR6bitaZnJpRXpn?=
 =?utf-8?B?QzZ2Vzg2Ti9xQjlUc29TWWxOSW1NLzNLWVBnSU5QWHN1V0hZTmJsRHdwUzZ5?=
 =?utf-8?B?WkVidnEvSHM4OE9tUk5mSFJJeWtqdGExYUNzWjZhNUU3dy91NUhaL1pxVHZH?=
 =?utf-8?B?SG42aTYzOU9tZHl4bUYrblNCcG9MeUVaYXczRWNkN3lWakEwUFNabWZrblY1?=
 =?utf-8?B?MWVRVUhob3YwYjI2RnozeWRabUtieklDS2F4SE9OU0lSQVdyM1VwTXcxUjVl?=
 =?utf-8?B?ekthU2VmTGJPQkFBcWV0d3VJakpOVzlFT1Q5a0ZYRUE5U1kzRExIZTJOVHVh?=
 =?utf-8?B?Yk5pT0FJbnl4NnUyMjRMYzlVaUM2ZjQ2c0dVYlFjTUt4YXhzOVliMWxFSDZr?=
 =?utf-8?B?R0NpK3VvVXZoNzAzZFU5L3N2WVJnT1ptK0NoTkJGTnJueFdJUGUrM0s3NUU1?=
 =?utf-8?B?dFNoVkt6ZHlxQ214YmVEK3V5WDllZVVZbWpvK0hmMnlzWDN2ZGlHUmtCVEdQ?=
 =?utf-8?B?dnI4aWJ2MzA4TUh0MnNTdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHFoeXB2Qlo1WmwwMkRIcHRtQzVFamtEaVZXMkpkWlVpNE55bVQ1YW5nN1k4?=
 =?utf-8?B?T1hQdFRIV2tuMFh6L3d3ZHYwa1Q4TXZwYkhaQWFFek5hQUo1RmFVMktVcklJ?=
 =?utf-8?B?ODVxOHM4L2xTV2FSNVJ5Sm9WQy9WVHpNeWkybDE3YzM4dEV1NWJva3B5RUQ3?=
 =?utf-8?B?enRwSG5hcy9MdURYaDE4VGRKUmxuTTJ5NkhVbWFuaTJCcTBEamV0WHA0dU1W?=
 =?utf-8?B?b2R2VThoMnJXeFI3U29GN1Jnb0FSeldkL2RvZ0J5MWtCNkIrMHhLRUhIeFl2?=
 =?utf-8?B?dVRlWExlVHVLVnJmeXdJc0YzdmFuNks4dElKOCtYbVJlejlHcDZoRit2RGh4?=
 =?utf-8?B?TzB0b2d2ZU9ENHlZU21hY2xPT3dZNWpmbkxRT2NwdnpzUHNHWWptQzh0TkdK?=
 =?utf-8?B?bW1McjRmcStIVlZmbUcweW9vVHJzSG4vZEh1eHpsNHhjdkcrTlZNblppUG5Z?=
 =?utf-8?B?dFdKekQzQXk1SUlDQmZIcWFVaXhLc2ZmRXVCaVdxNXJ1RHkvQzFCZFBkWFFT?=
 =?utf-8?B?RnhGd1EwOVhuNEtLRjAwSDJYaWV3QnVObHlRSDFjZXNpaFlYSlpoSnJweVl4?=
 =?utf-8?B?UXZKcGorOXB1ZmZCT2JlNWlOd3pRUWtyUFY2anFQakdpQURkQXcrWGpFdGZ5?=
 =?utf-8?B?cHNTSU93Smlncm5GQU1NR1c1d2xFbk5jNUUrZGFGdnJqNjJDZ3VyWXo1bHNY?=
 =?utf-8?B?VnFvNDlkL2pValRjR0JBYWx0L2gxTmg0YW81K2lRRVFHYXlmU3A3U0E4cThJ?=
 =?utf-8?B?Q2hGalQ3MW00Q0dxa1hBY0htODMwajhjeFdoNzNreVdpSlZmSVVQa3MzQlc3?=
 =?utf-8?B?eE1uTVFZWlNBb2hTUTByZFcwbG5IV3VHbnpFQzdqYnJuRUlIa0tTYldGNFBV?=
 =?utf-8?B?OCt3b2ZucDVad1Z0SmM3eFdHN1grKy8xRm81MXN4OElJVWtyNHEvZ1VoaUVJ?=
 =?utf-8?B?dzZ2bm5kVVN3M0pmb2tIWW52QUJKZDVKSFFrWnVQK1UxQU0xMkNlRkx6UTY2?=
 =?utf-8?B?aWZhcVRCT2djWkF0bzBTTndrekVrZk5vTlhySHFIZkdXdUFmcXBSNitvTThU?=
 =?utf-8?B?eDNsWUo2VHNWWWhtZUVKa0JENTFuZ2RER0U1MFk3bXNhb2JvV2I5NHUreXgz?=
 =?utf-8?B?TmRZYTJEWG5PUWh1MzZRczdnMnJ6K2tRU0pDOVhWQWVpcXZxRWpaSE45bEh0?=
 =?utf-8?B?TThxaEZ2YXQ3VDdCT09acmhvQStOSU4wV2RJWkVLT3RxcGVJZVhQb3JXYVZ2?=
 =?utf-8?B?MWd2RzhmZWRDZXRXT1JTNzI1WW10d0RlSURXSkhCSVIrRmw4bUI1VUpUOTBw?=
 =?utf-8?B?ZnlIMnJzUzcxNVRRYzBVRkc1VnorR1F2NFhyNWlMVUNOaVdyUlpTczlLQTNI?=
 =?utf-8?B?VmE4TUh1OU9ZS2dZNnAxYnUybnorTm1MZFgxMDNDcEwxN1lyMnZvN3UrTitS?=
 =?utf-8?B?N1hIdGhFbkRsdFZ4MDBHd293VUJBL29xa2F5aExkSndjTEtIV1U1VE9tUmR0?=
 =?utf-8?B?SnFnalFnR2FoRHg3ZHRuRTNiT3NWMFgxeUZraHRvQmZUcFpFcUFIYW1ZU1lk?=
 =?utf-8?B?cmVObjloYmN3cDMyU2RFODEvcC9Ba05TYWVmNnZ3S1JqamFSV29CU3RLSEth?=
 =?utf-8?B?YUpGZTNXODJzQ2dZZWdpVGplbnJHcWhwQ2sxNUZ4TFhmbzVMcjkybkM1RmQv?=
 =?utf-8?B?K0RxcVZHTlpHY01RWGV2WjB3RWhWalVTRHBacmVxYmZIZGgwZ3hSTnIyWkZk?=
 =?utf-8?B?M3FQbWtxYW1RcUhNaFpZaUtrRGlSTTZUZjNBYVB2bHFQZGo4NHU2SG1CbVlF?=
 =?utf-8?B?Z0M2dUpuVGJNbW1QZ0dTNDY4T1A4d1BoTElybGcvU1pqZ1c5Y0I0NU53QVFj?=
 =?utf-8?B?aXZleXhHY0U2cGYzNjNNeVpjQ3J2UGN4dUJlZ1NRWHZpWE5xTmUzdkRjM2oy?=
 =?utf-8?B?OHJsQk9WVjJROUVxUXJMbklmNW1aZnVTUG1Pakc1V3RNRmpHY2dNT3lOWlcy?=
 =?utf-8?B?UVlEKzJZbFFEZ0dPakgrSTV1VzRwWXZnWVNBa3JNZ0w1S00xWWFkS3hwZldv?=
 =?utf-8?B?UEltbSthK0s1NUpBdnJMSTV5VUEwQ0NWL0YxSUQ2Y1cxakw3ZHRjb0pPSW5o?=
 =?utf-8?B?SXFJeXNKSU1yc1NGZkQ5MHRtUWxMcEI4dUxBVTM3eUdPMS9uUWtMMlhIdEZO?=
 =?utf-8?Q?NI/NQHH6blRXF2pnCfeXOXY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 187ff5ea-7cbe-4e11-adce-08dcb3447fbc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 22:43:16.2925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XZTlXc4aqOzhoL4NJIbPDTt7c32ftuqcIwKebGspt65tsq5REAZcZ6GoiwwoBe57h++lTu6g4hCM4VbfbHTcF/IMCiYuBwdWrP6WaTR5fR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6295
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



On 8/2/2024 3:21 PM, John.C.Harrison@Intel.com wrote:
> From: Julia Filipchuk <julia.filipchuk@intel.com>
>
> This reverts commit dbd3e63b48f43788cb31eac045a848508a5c14df.
>
> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Acked-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 6b92255a769d..5b70d23724c4 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -105,10 +105,8 @@ struct fw_blobs_by_type {
>   };
>   
>   #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
> -	fw_def(BATTLEMAGE,	major_ver(intel-ci/xe,	guc,	bmg,	70, 24, 0))	\
> -	fw_def(LUNARLAKE,	major_ver(intel-ci/xe,	guc,	lnl,	70, 24, 0))	\
> +	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 19, 2))	\
>   	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 2))	\
> -	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 24, 0))	\
>   	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 19, 2))	\
>   	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 19, 2))	\
>   	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 19, 2))	\

