Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A02EE57D0
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 19:55:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2C310E1A3;
	Wed, 11 Sep 2024 19:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YwmkA77k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CEA110E1A3
 for <Intel-Xe@lists.freedesktop.org>; Wed, 11 Sep 2024 19:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726084554; x=1757620554;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=QudAgPvxG82gMtyH4lPEq55eavSYurbqVuxdIAnPvPQ=;
 b=YwmkA77kw3jPAluJt2xzeHHTaBirprMCHFuJwQM6ELn9Wku16mhBXoQu
 5o8uW++4a825G0Zq7ILvvJl+MObvNBIsvMlnAKVTC16reHpqLNHHmn4iO
 i83w2JYnSACS1Fw3+zKqvtNejkqnUd8sNO3PXxBfqXc47UUS/IsQ2LJ5l
 2k2TOOrWh5og4ciTTab7a3YWPnPckyhcYZwJmGpOKf0Hwqynb7KEgadjM
 nJ62lac4YM2OfCylWY7r1R5UXJFLLy1cgmDLRIE780YIRubCjz3HCfUyN
 BwA4YkfQ0EOv+GCcfOHIia0eo2yLI4EPPUOYn+I563Qk1nkIBdbY5HLG8 Q==;
X-CSE-ConnectionGUID: 4sqcbPW/RXSbHNiMnLhU1Q==
X-CSE-MsgGUID: nouMSXx0Tzm0pzitaRcq9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25040578"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="25040578"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 12:55:47 -0700
X-CSE-ConnectionGUID: FqUdc2pKS8u/JWkcSnR0Wg==
X-CSE-MsgGUID: OZD6TRtyRASpMl9L/ZX4oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="71599029"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 12:55:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 12:55:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 12:55:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 12:55:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rV2AH49M1Rh9ghWSNZK62gOF64qPHGC1iCoCsT6gCdHDAybjRufvxmS2b9fwlNjE3vDopFFGU+r4nz7ZDSvh9a01wm68qVIqyFBPKHk8olOYiz51u+cfJkSU+dMmRtJoc6txRLxcc+usgPzcMDlvlHRV+lNyLOOKUBuQDbPRvaYAOpB8nXOjdOp/R/Ot4j/pbRUPgE6Qm2t1Xmn99CpTV5PQANptn5KesKQUOWuTsvkMDApKbPl3KIm/1N8jDAQV4ky8pB5HnoTDwuLkNK4RSD5rvRl2qBTVX5ynoatiNqQqVqo8S9BJHLdyf4IR/zHR6u3gymQ9nSANOm2RE/VACw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GoEqjL9/Wu65zEiFExD5Q1BQdWKxZcaK0UmoOgzLOuE=;
 b=mIrsJG2um62S6reyYpE9GSWj1udEh8Gy6QgJ6i6BzMSz+a27t0XimfQINR9f1VKgyxTuItwTpyV9N5/W4JHbnc/bkTFRbQh4RXqM8w//MIvY4eGb9ThsiQLfvKuCC/Mwbt244LugK0sRlFYqWbVC0bE9WNgHtxUZmhqlNGKdpbGn7iPMnkfP+9evzitGvzTrhqE+qV1+eMfr9+Krw+ychxXQRUx6yAElEyS/e77N1sL8PoQw/jkdkl/kEjE4hwTeLYrlKH4ALM+UflJFNl58vwb+OItmePQhVkYCpRprO+gSzfBGKvljFuLYZlKJLhe+tFjLA+AiMofcWrc1kHEMRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by DS0PR11MB7803.namprd11.prod.outlook.com (2603:10b6:8:f5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 19:55:38 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%3]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 19:55:38 +0000
Message-ID: <45901fbc-56bf-4f9e-8044-eb83e24f02f4@intel.com>
Date: Wed, 11 Sep 2024 12:55:36 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/10] drm/xe/guc: Dead CT helper
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
 <20240905205106.1063091-8-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20240905205106.1063091-8-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0284.namprd04.prod.outlook.com
 (2603:10b6:303:89::19) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|DS0PR11MB7803:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d204b06-547f-4291-4a58-08dcd29bb57d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVBnd1ZQWVF6NCtLS1NuZDJTSjh4aHlBN01HeElWaE1NOUNxMDRnU3RWS3Fz?=
 =?utf-8?B?cFFEZUVoYVUzekYvVGxjT25nRnJkSVhKS1FGenlsV0R5U3JoTk11WituWm1R?=
 =?utf-8?B?SDJVUkpJQW1GUlV5NkJwYWdraG9OVEtwSTI5U3NsOHJhcHZHWXdwWVV1Rklw?=
 =?utf-8?B?ZUZJZlB4OGdCeWN1UkNFZFVCbEh5bi8xVHJ1dk9nQU5CZ0ZMQjFRblEyekZJ?=
 =?utf-8?B?cWZZcXdJQkZaYmU0NHgzeGxXTVkyUXRnU1UxeTlHbGU4VDZ3eTF4eGM0czgz?=
 =?utf-8?B?ZWFQU1lDNE9XOVovU1BIU0FuU3VQOC9JZGZkWEFPVGpHc0MvWllxWDVyUSt3?=
 =?utf-8?B?SUE1dkxpYUlhOFp4QVV6QWJWRldDQzJPcWJBbDZYQmYrKzdIcUdybXdPTzNK?=
 =?utf-8?B?SlhHZDdmblgwRW8xSnJGUkxyRjV5V2szOEZLTGZYZTZCNGhoRHU2eEVGcnZn?=
 =?utf-8?B?ajBORTNiclNlKy9tNzJrcEFOa3NjSjVaeFVzaWxnaDdya2dlSjdjNUdRb2lR?=
 =?utf-8?B?U3JLL1pUNzhCYUxaaHZSZzFzdERWWG5Ibzg3T21LbkRGdjNKZFR4WUZOWUEy?=
 =?utf-8?B?clBhT1pqcHhRemRyOUtQRnFPREl0OUN6OGhMaS9TOU9QM081dFRUR2c0MTNU?=
 =?utf-8?B?V0dVTGZreWYwTVFJYXhtald5aFpDOWNUeUFFbXZnQnVDWHBRbmFzcTY4MTRI?=
 =?utf-8?B?OVp5c0g0OXV1STBvM3BDY1JFVXd0aGZwUEY0ZWNkR21DVWhWR3VkWDhmdFFs?=
 =?utf-8?B?blY4UG81WW9ZMnhOdFA3RXF6b2RzRmVDNytGdWV4akU1Rkd5MW1JdmRVT1hn?=
 =?utf-8?B?bkltakt4cnlpOTFibGRLMWlBcG14bFlTMHI3akMrb1BuYlNmaDQzTXh3OC9v?=
 =?utf-8?B?cElOUFFpZnp5cTNsQWdYUmRoNks0dFMrVFNLNDVjZGcxbmRKOVIwTkQyNUIr?=
 =?utf-8?B?TzlyZmQ2NFJCQy95TWtCU3ZWMWE2SnpGbzI4N2hlY0xWQzltSlRyVGIvZi9F?=
 =?utf-8?B?Znd5Yyt2L2d6cFZBRm91bk01MXlDVlJaV3d4UHBMTmQrNElQSlMrczB4UGhT?=
 =?utf-8?B?OW5SeEMwUnI4V2lWNWJzSTVRcW5ucDQyMHVEdmZBTnVSbnVCZVpCZW1ieXNF?=
 =?utf-8?B?R0xaU2l6ZGE5NEhibEFBbHgwYTZ0aEQ5UFdBOXExMEY4UkxBVU9aZHF5TXZU?=
 =?utf-8?B?Sld6L0Q0V1EydjlGbUY3cWNpTTI5Z0ZqeVNXRXo1Z3VHdHRKanlxakQvTk5R?=
 =?utf-8?B?QWZqSy9uWnhlQm9zNjQ5QTc4c200YVg2UzFmNkhjeTRpUjFRKzBQYmh3WGZr?=
 =?utf-8?B?cVdHbjBpdkFYczY1ZFF4a0Ywc3hXZ2V2cHI5aVA5Y1lFYThFOXE3TE1kRXpq?=
 =?utf-8?B?VmRKNFhkb3VNbnhPeXZlU1FPZGFQZXBoS2Mzc3U3bUpVSkMzdCtvbk5OdjFD?=
 =?utf-8?B?eEM2Z2pyNytxMFB0czZTUzVrWUxpMmZUdE8zN01Ub3h4T1JJL3RCblNYdEI1?=
 =?utf-8?B?VjNIZlJoN2FGUXNmRDlTQVJOTVR3MXlkRjkvdFZPbUp0enhtdnhwbFFkQUM3?=
 =?utf-8?B?T2x1a3F1OGluQVdIWVN4dzd2bmFVSzV2dE4yMjZDL3d2dnlXRjN3UjcyUlVk?=
 =?utf-8?B?V3pNYmRuRHd5Ky9xa0Y3aEVTV3dhSytHSE5Ec2R3aHRtbkhrMkJhSENBRUx4?=
 =?utf-8?B?dW4zRFZzYnpDQkVpSXdySTRKS3NmVkYwajhmeVJOQUY0dkhsdjVubjkyNmto?=
 =?utf-8?B?MUhtR21LM0RWei9SNytUcVJWL3pTSitiZEo3M2lQRENkdlBpZFVsMmZ1em1H?=
 =?utf-8?B?MlVaRFFWak1KV2pjdVYzQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2g4aTA0ZUMwd1psaS9qeDg3SVF3dDdxejd6UFEzOHlHNWlFdWhURmRuT0hl?=
 =?utf-8?B?UWVSZ2cwZjdKUlBVL0Jnb3lMRnpPM3pXQ1pUTEZ0a2NpNXhUSGo4V0hDcldj?=
 =?utf-8?B?cUl2NVZBaDJHWFFnS2h3bHhtTFBYbkp5VnE4dmU2VW1BL1FIb2ZpejArU0dJ?=
 =?utf-8?B?d3VDaVk4NTRCR3Y2UFg5dStkVnBxSWxpeDR3dHhCT2l2V3BSK0FtR3FIWU1N?=
 =?utf-8?B?VmNqSFpIU0xOWE1xSWNWUmUvM3NGSmVINnBDdDM1YTlzRC83ZmpMaGJjVG16?=
 =?utf-8?B?UkM3SG9tZ3BhS2RFUTd2ZW9VVkFyWmpQdUZBSEFoSVc0KzJxM21YeFFVUzI3?=
 =?utf-8?B?VkdQUHR6cHd1bG1NTkFMaDNiVXNROVlOQWlDT2FKckh6Qm9RV20zbEVYQXdt?=
 =?utf-8?B?cys3S3VCZDdTYkMxKzJiUE5UR0RkeG9nck5WbVN0Q2UwRVJQTWp2RnJHeW96?=
 =?utf-8?B?UU8vdVRtQ1JqT0FGUW92dW45Y3prYVlTd2I0UjFxV3V1eTBRdTNmSXhUcnRm?=
 =?utf-8?B?WVk1K2ZKaUE5T3lYYjJOa3VMOGROeEdMYUoxZFlYb2t6dVpaN3R2ZEYweStm?=
 =?utf-8?B?OHJoWkptMXUrVnlLU3Z5eGxjaHFKOEU3UW4vOWcraEFlNzgyZUpJdDFDcDR0?=
 =?utf-8?B?S05BVUJBV2h4NFozMUJBdGtaTnBTdkZpUEFjUVE5R1B0cTJZdHgwN1VKb05X?=
 =?utf-8?B?WW9JdSt4VHdrY0Rla3ZaTXRDYXlsaWVaNEhBRWVpUmFodWxCWnc1dzAzVUVH?=
 =?utf-8?B?aW9reWx0Rml3Z21IaTJmWDZEakpJRmltbkR5NWJkWTlTU0x0bGZyZDRmenNI?=
 =?utf-8?B?UHlZZ0RERFhadTlPUm5SNzIxUkNPNzlRSU9VS1NSTHBGdmQ1SjVuUmdvQWJS?=
 =?utf-8?B?TUhaa2tjR3UweU5NejJCVHZ6N1ZoVmxmbXpFNXVpOHlZYmxIVnI2NTFmSS9n?=
 =?utf-8?B?TitaREtzLzhRMmxkUFlnRlR1QVFoclBmZ1BkRkNuNzZjU3gzdzNrekRZOVBR?=
 =?utf-8?B?VGNIejFkekhaU0RTZWwrb0NvYnlsS2lZalVZWld2VGRQZ2Z4ZTJ3Z0VNT3FU?=
 =?utf-8?B?RTg3eDhodmlTWUNCMjVEbWY0M210Yi9tOFVwVFFVbW84YU02UFR6MGhZZTBw?=
 =?utf-8?B?R1o2aXR3ejBtNDBiT1RqSEJQSzRSOW80bjJaRkJlOXFLWklaMjd4SkZ3bVpE?=
 =?utf-8?B?MmVOQ0pkZTJvOHlmZG9PTmhhMjFGaUlnaXdxL1JFblg0R2UvUmsySWZHVVBJ?=
 =?utf-8?B?WVB1cHF3eW1VdXBjeUhxTCt2MmhweTl2SmJSNmE4akV0R2FlS0xaT2ZVZVo3?=
 =?utf-8?B?T0c0Qlg1MVUvRHFxTnc5Nk1JTW1HcC96cVE1ZU0vQXNVTitVa2h0eG50N2xT?=
 =?utf-8?B?S3NEMHJSNXhTRXZEVkN2ZGxrQlZGd3JUaVc0TGxFUmF0VzdKN1BpL2VRbkZS?=
 =?utf-8?B?UGJSSUpuZ3hSbmx0RFdxS0dUZGxxbUVQb0FUaHo5NUlzSWFpZ1dReEtsd1Az?=
 =?utf-8?B?OXo5UDQ4dEZFVVJzdFcwVXJ2WjZ5czc0OHBSdG9qRzdFNkV6Q0hwbkwzZDhu?=
 =?utf-8?B?Mm85UGZPYTRkNzdtQVBOVklER1hDTlM3YTJEV25qaTFOZ1p5N3N0VGlVK1dh?=
 =?utf-8?B?UEJ6Z3A2b09wWVZJRGlhc0gvRGlMVW9YSFJDRUM0c2l3dXJpRlp0eGt3TDgw?=
 =?utf-8?B?cGo0dllNQlROdjM0UDNWdGljdmE1TE9aZWhrR0tRcWc1SitBb0NrT25keUY5?=
 =?utf-8?B?L0hrNThybFNSRjJBSWZYaHBweHpVNkhTaW44NmJRSmxtRDE1Qm92M1Q4TnZC?=
 =?utf-8?B?ODJhYlRkcG9ZS25LaVA1Q3VUbGlSandmS2V3c3gwcEd6TkJ5NXNmdzM5Z204?=
 =?utf-8?B?bzNiMlYvYWpwcFcvNzlnQSsvUW1Yanl5ZHRtUUkxZldzSUp6SXM5b2pXUDd0?=
 =?utf-8?B?d3NsZ3NMdnBUL0lNU2xFcmF6K25XNTYzNHJHaXdCRW9iK0VuamlOb1VLVEdi?=
 =?utf-8?B?TW04WkZNSlhveUZHRGZMNjhnRkw3NUJ5SUNDSDQ1M2VVdURqb2E3TXo2TFVh?=
 =?utf-8?B?cmFRMkhPRTFUdXFzcG9iTnZDRldwZk8rMkZVcVpTY2NYZGNuaWt3QitFL1Rr?=
 =?utf-8?B?R3c2Ni9NT3ZsckNkd3hYajg0MVJPelVpd2R1c3hjK0s4MGdCVERJOFNhVmxz?=
 =?utf-8?B?aWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d204b06-547f-4291-4a58-08dcd29bb57d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 19:55:38.7448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XCI8IzTuUBN96QqcMFKGsS8G06JTuG8GB7eFTsIDQaVPR6d6lvtdnyxIxqKcA6ord8sHRvf86bSlcyctyIOuSPJXB01qqzZuf328MQhhlkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7803
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

On 9/5/2024 1:51 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Add a worker function helper for asynchronously dumping state when an
> internal/fatal error is detected in CT processing. Being asynchronous
> is required to avoid deadlocks and scheduling-while-atomic or
> process-stalled-for-too-long issues. Also check for a bunch more error
> conditions and improve the handling of some existing checks.
> 
> v2: Use compile time CONFIG check for new (but not directly CT_DEAD
> related) checks and use unsigned int for a bitmask, rename
> CT_DEAD_RESET to CT_DEAD_REARM and add some explaining comments,
> rename 'hxg' macro parameter to 'ctb' - review feedback from Michal W.
> Drop CT_DEAD_ALIVE as no need for a bitfield define to just set the
> entire mask to zero.
> v3: Fix kerneldoc
> v4: Nullify some floating pointers after free.
> v5: Add section headings and device info to make the state dump look
> more like a devcoredump to allow parsing by the same tools (eventual
> aim is to just call the devcoredump code itself, but that currently
> requires an xe_sched_job, which is not available in the CT code).
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  .../drm/xe/abi/guc_communication_ctb_abi.h    |   1 +
>  drivers/gpu/drm/xe/xe_guc.c                   |   2 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c                | 280 ++++++++++++++++--
>  drivers/gpu/drm/xe/xe_guc_ct.h                |   2 +-
>  drivers/gpu/drm/xe/xe_guc_ct_types.h          |  23 ++
>  5 files changed, 280 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h b/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
> index 8f86a16dc577..f58198cf2cf6 100644
> --- a/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
> @@ -52,6 +52,7 @@ struct guc_ct_buffer_desc {
>  #define GUC_CTB_STATUS_OVERFLOW				(1 << 0)
>  #define GUC_CTB_STATUS_UNDERFLOW			(1 << 1)
>  #define GUC_CTB_STATUS_MISMATCH				(1 << 2)
> +#define GUC_CTB_STATUS_DISABLED				(1 << 3)
>  	u32 reserved[13];
>  } __packed;
>  static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 34cdb08b6e27..3fef24c965c4 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1176,7 +1176,7 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
>  
>  	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>  
> -	xe_guc_ct_print(&guc->ct, p, false);
> +	xe_guc_ct_print(&guc->ct, p);
>  	xe_guc_submit_print(guc, p);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index a63fe0a9077a..e31b1f0b855f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -25,12 +25,57 @@
>  #include "xe_gt_sriov_pf_monitor.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_guc.h"
> +#include "xe_guc_log.h"
>  #include "xe_guc_relay.h"
>  #include "xe_guc_submit.h"
>  #include "xe_map.h"
>  #include "xe_pm.h"
>  #include "xe_trace_guc.h"
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +enum {
> +	CT_DEAD_REARM,				/* 0x0001 - not an error condition */
> +	CT_DEAD_SETUP,				/* 0x0002 */
> +	CT_DEAD_H2G_WRITE,			/* 0x0004 */
> +	CT_DEAD_H2G_HAS_ROOM,			/* 0x0008 */
> +	CT_DEAD_G2H_READ,			/* 0x0010 */
> +	CT_DEAD_G2H_RECV,			/* 0x0020 */
> +	CT_DEAD_G2H_RELEASE,			/* 0x0040 */
> +	CT_DEAD_DEADLOCK,			/* 0x0080 */
> +	CT_DEAD_PROCESS_FAILED,			/* 0x0100 */
> +	CT_DEAD_FAST_G2H,			/* 0x0200 */
> +	CT_DEAD_PARSE_G2H_RESPONSE,		/* 0x0400 */
> +	CT_DEAD_PARSE_G2H_UNKNOWN,		/* 0x0800 */
> +	CT_DEAD_PARSE_G2H_ORIGIN,		/* 0x1000 */
> +	CT_DEAD_PARSE_G2H_TYPE,			/* 0x2000 */
> +};
> +
> +static void ct_dead_worker_func(struct work_struct *w);
> +
> +#define CT_DEAD(ct, ctb, reason_code)								\
> +	do {											\
> +		struct guc_ctb *_ctb = (ctb);							\
> +		if (_ctb)									\
> +			_ctb->info.broken = true;						\
> +		if (!(ct)->dead.reported) {							\
Do we need to worry about a second dead ct causing conflict with quick
back-to-back CT_DEAD? Suggest to set reported here and to clear it only
from worker thread. Snapshot can be used instead of reported to
determine if it has been printed (in worker_func).

Should the snapshot be taken in the "CT_DEAD_REARM" case?

> +			struct xe_guc *guc = ct_to_guc(ct);					\
> +			spin_lock_irq(&ct->dead.lock);						\
> +			(ct)->dead.reason |= 1 << CT_DEAD_##reason_code;			\
Does this field need to be cleared or does this accumulate reasons CT died?

> +			(ct)->dead.snapshot_log = xe_guc_log_snapshot_capture(&guc->log, true);	\
> +			(ct)->dead.snapshot_ct = xe_guc_ct_snapshot_capture((ct), true);	\
> +			spin_unlock_irq(&ct->dead.lock);					\
> +			queue_work(system_unbound_wq, &(ct)->dead.worker);			\
> +		}										\
> +	} while (0)
> +#else
> +#define CT_DEAD(ct, ctb, reason)			\
> +	do {						\
> +		struct guc_ctb *_ctb = (ctb);		\
> +		if (_ctb)				\
> +			_ctb->info.broken = true;	\
> +	} while (0)
> +#endif
> +
>  /* Used when a CT send wants to block and / or receive data */
>  struct g2h_fence {
>  	u32 *response_buffer;
> @@ -183,6 +228,10 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>  	xa_init(&ct->fence_lookup);
>  	INIT_WORK(&ct->g2h_worker, g2h_worker_func);
>  	INIT_DELAYED_WORK(&ct->safe_mode_worker, safe_mode_worker_func);
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +	spin_lock_init(&ct->dead.lock);
> +	INIT_WORK(&ct->dead.worker, ct_dead_worker_func);
> +#endif
>  	init_waitqueue_head(&ct->wq);
>  	init_waitqueue_head(&ct->g2h_fence_wq);
>  
> @@ -419,10 +468,22 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  	if (ct_needs_safe_mode(ct))
>  		ct_enter_safe_mode(ct);
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +	/*
> +	 * The CT has now been reset so the dumper can be re-armed
> +	 * after any existing dead state has been dumped.
> +	 */
> +	spin_lock_irq(&ct->dead.lock);
> +	if (ct->dead.reason)
> +		ct->dead.reason |= CT_DEAD_REARM;
> +	spin_unlock_irq(&ct->dead.lock);
> +#endif
> +
>  	return 0;
>  
>  err_out:
>  	xe_gt_err(gt, "Failed to enable GuC CT (%pe)\n", ERR_PTR(err));
> +	CT_DEAD(ct, NULL, SETUP);
>  
>  	return err;
>  } 
> @@ -773,8 +895,13 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  			goto broken;
>  #undef g2h_avail
>  
> -		if (dequeue_one_g2h(ct) < 0)
> +		ret = dequeue_one_g2h(ct);
> +		if (ret < 0) {
> +			if (ret != -ECANCELED)
> +				xe_gt_err(ct_to_gt(ct), "CTB receive failed (%pe)",
> +					  ERR_PTR(ret));
Is it correct there is no success condition here? Would canceled case
need to route to try_again?
>  			goto broken;
> +		}
>  
>  		goto try_again;
>  	}





> +
> +static void ct_dead_worker_func(struct work_struct *w)
> +{
> +	struct xe_guc_ct *ct = container_of(w, struct xe_guc_ct, dead.worker);
> +
> +	if (!ct->dead.reported) {
> +		ct->dead.reported = true;> +		ct_dead_print(&ct->dead);
> +	}
Would this guard work against quick back-to-back CT_DEAD calls? This may
not happen? Suggest to move 'ct->dead.reported = true;' into the CT_DEAD
macro. Relates to CT_DEAD macro above.


Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>

