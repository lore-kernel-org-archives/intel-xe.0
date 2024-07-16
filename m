Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBC1C3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 20:26:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD5710E89C;
	Tue, 16 Jul 2024 20:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HGRlz42u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1154C10E89C
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 20:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721161560; x=1752697560;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=PYW2l62gYbQkLpMRv89EF7FR66MkUVYdfBCmmAFtVOU=;
 b=HGRlz42uJ+aHlgsoce8kbXDQHvodaUO2Im7nuyUx4wHL5Rm1JoaQWcEA
 JShu4HIWJzjZHuWurZkfZT5Y72WIIXAvSe58zGXkyckarre1iaCL6VpUd
 cuuLHC2l+jmQDcA49vTGjki65W1+8rDqoc5Y+El/tH/BRolZz+4pFbXgl
 i/t7fxkZ0X3Y7EqR5y0WmA3BuB5yKIDbiZIBCfRKESeCUtV3oWSzq4kNR
 skVFGYvsMuEBQx/3BX4V2DR6hDYotMUvcvsplun4Vm4TIYynPYbq2ZStu
 67ALHgU8S2lnC9NV+iub1RzPIJRpd5g1n/ZSXJGluofdpDh9Odk4T6A6T g==;
X-CSE-ConnectionGUID: zERun/7+R5S8pRjbnXgBwA==
X-CSE-MsgGUID: TmMY/r6bQUykfgG4XzbqDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="36070181"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="36070181"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 13:25:58 -0700
X-CSE-ConnectionGUID: eMx7PqWDTfevyehpBYeDrQ==
X-CSE-MsgGUID: +zyMqTRnSTy7NXep+XZR5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="87630884"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jul 2024 13:25:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 13:25:57 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 16 Jul 2024 13:25:57 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 13:25:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G4Pi2+TirYvg8YdoYhqmHWDpoa2Xrbcdb5LkDWy/0yaZy4mv+y69h1vn6EQRFPcvkQ7tnTqQlITy+FxwoqEWEbudTkV/EPN9pZpj0ar5GHR7m1/cB1CUpvYNR5bTMSUi9kuYlhaXRJX1Jke+l2ah4j1tra5e5inCX3YIMkM5YnXrtLDSZSi0h8tUleGshxb5zMs2XxZ9HLUpqSWiL9inZRYgGJwgEntIuEGaS5JInJQLtiZNZ7lWL4D62jM8cl3mhqSrR/9fkiVeu3K+/huz8z9ZLLc/KsroMIyioVaJokqsN4WGkVkTr4YIygxc9/Dk3bBHQk2zDZmySO6IyoP/5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4MTysbBrFj6zfQEcpjdqGEZGAsABbgJ03orpB2qqy4s=;
 b=FLIAwGo+OM5qV3NTXk5fdt1qRe6y5wcEAvSHY1B3l6kLRPbkKg2kvzWJ4k0dfOdhLqOmwrH0BWCHEQoBpfcDYhIAIx+O1NRawKzOjTaP32eG5rGr807l5w8Wnu+Rb9Sb4chmjQj/jFO1Nb+M+GsgC7duQ95rCNZZpK72fVHBmveNvX7l9/IcIIB5KyQ9wQCWtQBXcXIx/lw3o0U4p3cEC1ry03lkrwoX1fv0rDyFtxmOPi//CP5yjKK5bEeM6EQmN+8MceI/6n3+/jzQ7faqLYa2tPwW0M9DN0G/0NVHq5+jIyRNO7JaeNUDRnP62xKwelIP6fCPYA/nInZVfs/y3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by BN9PR11MB5273.namprd11.prod.outlook.com (2603:10b6:408:132::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 16 Jul
 2024 20:25:54 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%2]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 20:25:54 +0000
Message-ID: <622bffd0-4aa4-4103-91af-61e9054e29ca@intel.com>
Date: Tue, 16 Jul 2024 16:25:50 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/5] drm/xe/guc: Add capture size check in GuC log
 buffer
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240712164724.677393-1-zhanjun.dong@intel.com>
 <20240712164724.677393-4-zhanjun.dong@intel.com>
 <f72be13df29b8fb6749c8b4c3165989dc2641bd3.camel@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <f72be13df29b8fb6749c8b4c3165989dc2641bd3.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0053.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::28) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|BN9PR11MB5273:EE_
X-MS-Office365-Filtering-Correlation-Id: b64fee1f-1d2b-4b1f-5f5e-08dca5d57e30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmUzSSsvTjJ2emo3U094eXRBdkNTTTlCWVVnTTgrL1JFWXdDNCsvbzhTSGVR?=
 =?utf-8?B?S2RJMEZKTnU2ODEzUWlCQ2ROak0zNFM3TWJvNnp0QUNibktiT3MvM3VzWEtM?=
 =?utf-8?B?c1ZyaXY3VDFvbTJaL0szeExvTk9qcWMrdEdXSml1MEE1WWpwMkVzQlU1b2pQ?=
 =?utf-8?B?TkhCc3ZCMFZTd1N4ejBPRzh6N3N3LyswV0JnbUs2d0ZBeHppTWJnV3NHSWpj?=
 =?utf-8?B?Q0NRUUUvZjJ3MVNCNGw0ZWNUdzUxSGRYTUlvQmtCVml6alZkb0ZPZzZoa1cw?=
 =?utf-8?B?TmRoR1V2U1ozMGd6YzhDR3NUVS9yeVc5YzljSlpncDZibnlBOHJrekprbFBi?=
 =?utf-8?B?OVNRcmZoN29rL1hoZCtudkN4bExDWU5EVG92WUhJeGViTVU5eU1Ldkdxb1lJ?=
 =?utf-8?B?cTZnTlhZOWUrNzRFamN0bWZMaTlZWW5SNnM0ZGtXaVNvZE0wMGNJY3pZRnly?=
 =?utf-8?B?QjV3VUxRUEVBRGhWcjg3SzVXaFZMRlYxU2JXQ2UwUlhEWkk4SSticllndzl1?=
 =?utf-8?B?dEk4Ui9zemJialV3L0dpVmN4MmJubmJFdjdNUEh1RlcxelRvLzNBNFEvTjY2?=
 =?utf-8?B?ZHZONUx2Znp4Qis2TUYvbTVFZmY1RVYrMWQzWkp3WkdmMDB5V0hXMlFrZXlq?=
 =?utf-8?B?aW9MYUF2NVNhVlZxSUZDUFdjWEduLzVtTklvcHRFTjYzZTdzc2NxRUVDYVll?=
 =?utf-8?B?bzc3V3pIQ1pvVmNoZWtvUDBIZ240MTM5dkZ3Y2duOWdVUThDb3d6c3NuUklG?=
 =?utf-8?B?NWlIRWJpQWhCY1hGRlkwSHRqQVBGQUkrR01VZDJ6cU1ENy9SMEpwN1o3Y1FM?=
 =?utf-8?B?aHZrQjF6NW1YV2lhOXkrWnU0OXRwVEJSUlVQYjlZdUE4S0Qya2tCV0J2ekVR?=
 =?utf-8?B?OTd4bHVGU3NTZWpyVGRkN2RISmtIaG9LMXhPNHJGTTMxWkQ4K1dNSnE0S3A1?=
 =?utf-8?B?c1B2Z29rN0FQMFdaV3NWV3c3aDdDa3ZNdXMydUJHcXV1T3dFLzVTNi9EcDhz?=
 =?utf-8?B?QjdiUkRWbGNhNlBQOVgxNzdlSVo3ZDlJZGJURjNZNUtMalJJbzByWGV1dlZj?=
 =?utf-8?B?Zkl3K0w4d1lrWU5VRWZFVS9nYnZLaXJNRmtFNkdaUThUQmR0ZEo5MHBieXJi?=
 =?utf-8?B?VUgxbS9QRy9pbUVzSTFKQVpkZ29lcFhQNEFHYktodkJNQjFtb2FNNEk1a00r?=
 =?utf-8?B?MnBnM292Snoxb1kvelM1dnhaYUpzUWlCdWQ1cVQ5Ui9XUDgxT0cwNmdLeWhq?=
 =?utf-8?B?dGlBS1Q2R0sxckVmaFRvN2V1SXptR3pYYTlhcURzWHNwd3lQQThMaGFzdXQr?=
 =?utf-8?B?ZVk3aEF2RGFabXI3UFNCOTdpUmFwYU5WbjFvNklNOHBVa0NzS3c2aVZ4eVlv?=
 =?utf-8?B?T2ZOK2NSMTZzQU95VDNVR29OTXNKNzdWSHo0VVdqUG1aV0Y3NU5DMm56M1hV?=
 =?utf-8?B?aE1rbFNSdmtvYWZ3bXc4cTZQY29Wc0VQbTNWYlBaUFhkMUExVE0rSVk0WnRM?=
 =?utf-8?B?QjdYM3p0MFlmK1lPMXljRW9OUys2UWIyREhUcVV3aEE5QWgzeGpTbXdEQ045?=
 =?utf-8?B?MmFZREtZYVA4NnNtWHZ1bFY2Zjc5bkJlL01zMHl0aHpuZzVrdTQ4VU13OXNH?=
 =?utf-8?B?Wm56ckFRSWFZZXJRa3IvUnJ3WnpiblRUMlJlc0xadWNxK2ZpV3ErL2FhYTdV?=
 =?utf-8?B?YU1BeU1uUnozWEtxbTdFVjI4QVlYWGppaEdNRHVMcjJNSitCY2l4ckxFWlhM?=
 =?utf-8?B?eldhakhIWWhwVy92c2pnOVpLV2ZPZzQyQmNYLzhTYnNKMzNVQUxVaDRWNy8x?=
 =?utf-8?B?Qjhib3RzaitscU1iSGFKUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVJHcDNNSm1HUy9yVkN4SjRMVytqdkhiWDNtZWQ1ZGVOWklYcXd0QmVYem0y?=
 =?utf-8?B?RjZQbFJYRW4rZDdCS0d1b3MwZEFEYVZtK2xEU2NXMXY5eGdwUFdCQ0w1eTNE?=
 =?utf-8?B?UnNyWEFDbDU4VEh4RmtSL1VQdWwwa3NwclZjWWIzWnpBUFBlWmhFVXZIc01P?=
 =?utf-8?B?OFZ4SmozU1BINjN3VDNuQVpZWTlXYzlmaUptZW1HZE5SYm9YSnVVb0oySmgr?=
 =?utf-8?B?K1RDYTQ5R2pleWx0d1BSL1MvZUxmME5Rc21tdGhDK2ZScDljZ2tUaUEyQWdS?=
 =?utf-8?B?T1FxalZGV1U2Ty91cHJlZGtJd25PUGJ2RmMwZnVzZDRvc1V2c0wrMGRycldx?=
 =?utf-8?B?M3ZZcnIrKzRXUVpLTkU1NWhPcnRxU2owdHRiTmNVbUpaeHRNWTlsUW9mL2JZ?=
 =?utf-8?B?eC9PcERtajRVYjgwRnRtU3dRV2FZYzA3R0lNZ0p1ckppUUxlQ3R5YXgxYm1z?=
 =?utf-8?B?emZLYWtIT1VKZUYwamprYTUrWDZlSlJHdkxQM3VYZENEVHcyaWZ3RGZGMUNF?=
 =?utf-8?B?TFRXeXdMUUtHYS9wQ2NUbG9pajhrR21sc1VwcVAzK2dIOCt4M1NMck9LZDRN?=
 =?utf-8?B?cEFXUFFHdTZKNDJxRGxRT0xYOUNEYjE4K3VZOW83ZlBvZG9oY3ZhVzY3U3RZ?=
 =?utf-8?B?eU8xN0ZOMEhqM29VcXg1K29Ka0tPSzU0VncrTGxVYlRoUmFjY1RQS1VDeVJU?=
 =?utf-8?B?L01jS3VaVUJGODB1UUhsMW0zaG9UWS9JbGtweitja0wvYldYVDZrZDhZejBQ?=
 =?utf-8?B?NU55Q2dKbkpCVlErbi9TTDVFdTZhNkxObmFPVWVRU1J5ZXNESkJML1VDOGVM?=
 =?utf-8?B?SXdDVHRTZTdGWjE2SzdHUGpMcFFSNjNoU1FxUnZJR25jSGlKUk9KOUhKN0Y5?=
 =?utf-8?B?Mm5ISGlmdCtpMWVINnpvMlB0eVN6RnV5eGZxcUQ5cFlKbmV2WHp5MjZWVS9n?=
 =?utf-8?B?cXVDWFRTdUNKVlR2WEhpZ0MwZmhwV25PbHZsV0ptd001ZHErS2VYeWRDUHg2?=
 =?utf-8?B?V2lYczFRNmdFSHRzYmZobnRKTC9zaWRMY3BoT1NGZGdqZnpzTXRWTURzcVI1?=
 =?utf-8?B?TTBPcUNzMDNaY1JCMTNDQVQvQUVCbVI0bnNRMTRKRi90Y0ZyU1Q1VkM5SXFS?=
 =?utf-8?B?S2ZUS1dSR2Z1N1hteit6Wm93R1FlUlUxam93NmhGdnVtaXhZM2d4U2pJd2dx?=
 =?utf-8?B?Z1ZJdVFaa29Ja1pVZWIwZUZFdlpSTVZBN2Y5MmZCWEg1MjJDbVJoQ1QrUVVh?=
 =?utf-8?B?dVh0dzZvQlBOVlcrMkM4YjVZRG54elNaVVFMZkNLNFdWek5tSnloRjU3b0Vq?=
 =?utf-8?B?Vnc0MjArUXQvd1ljRXI4MmlabnR2WE5rSlRRRGJOY2hFSURSc0ZVSE9OODJk?=
 =?utf-8?B?REt2MktHZU5jVEZ2blBySUk5UXdmZ1dXWEhLUTRTU2RqSnFYemxwdVBCd3ZS?=
 =?utf-8?B?alZVc3RWeDN4ekRaa3VUK1NqWHlNdDV4MDZCVzl3R0VFbzA4bStWcm04MUV5?=
 =?utf-8?B?NHFuNy9OdUZ4MGJlL1FmTnVyQnZtNTFHbGR0ZVkrSWhaVG13VW8zOGdjK1Nn?=
 =?utf-8?B?eEh1UmZXb1p3QTRCaXIzOXJjWjNPNGppV0tzdloyVDZTd2srUVpWcEFNWksr?=
 =?utf-8?B?UFVyRUp4YTcyWGE5cnliekc5elRaUFY5cFRjRTNtNTV2ak1EOFRhVFQ3MnVN?=
 =?utf-8?B?QWdrQ0RhQ1dmOUhGMkk3MU5ON3o0bGpDZzNvcnIwOFNIMVJMeGoxZE1kci9M?=
 =?utf-8?B?NHRqdng1eHAvV1Z6YjBPMTZxdGFKUElpOVlISERFRWIxdUs1MmhVd3dqamNo?=
 =?utf-8?B?Q2VPek9QTGk0TTZKeTlId1ZMenNLUnkrNnQ4ZVlaWlhOc01mZTJXY2JVQUdZ?=
 =?utf-8?B?N1luQ09VRXBwbGJCd0lPTFJnUllJcVIrWnlxTlVjTkRBQzJsMS9JVmNoVnNm?=
 =?utf-8?B?YnBYMWYyYUpyWXNMaEdBRURqZHNYeEE3MG5sbm1hQ0dqQVI4RWRiaVY4UW5F?=
 =?utf-8?B?MGt3dllqSW53U2cyQ3Vjc0h0Q1J0bjNLRmRWNXAreW1qS3RodnFYTzlGMDBm?=
 =?utf-8?B?RGMzUGFhaU9WTTk5WEM3dWlUUGtLRjVqVGRGTjlzbHlUMGdmV0FkZ3AvbjFi?=
 =?utf-8?Q?9wNVSu7UL4maKcESzQrUWTI6B?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b64fee1f-1d2b-4b1f-5f5e-08dca5d57e30
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 20:25:54.5142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jKFkzgj02niXDO7y2Bo3NFeuhugxrHqg9/RWNFzomx21O84VKVNNg4A6Sd9ZTY7DET88LCCcdl+8O6fUcQtreQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5273
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



On 2024-07-15 5:40 p.m., Teres Alexis, Alan Previn wrote:
> On Fri, 2024-07-12 at 09:47 -0700, Zhanjun Dong wrote:
>> The capture-nodes is included in GuC log buffer, add the size check
>> for capture region in the whole GuC log buffer.
>> Add capture output size check before allocating the shared buffer.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_log_abi.h  |  20 ++++
>>
> alan:snip
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>> index a37ee3419428..8fecb528b92c 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> @@ -9,9 +9,64 @@
>>   
>>   #include "xe_bo.h"
>>   #include "xe_gt.h"
>> +#include "xe_gt_printk.h"
>> +#include "xe_guc.h"
>>   #include "xe_map.h"
>>   #include "xe_module.h"
>>   
>> +#define GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE      CRASH_BUFFER_SIZE
>> +#define GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE      DEBUG_BUFFER_SIZE
>> +#define GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE    CAPTURE_BUFFER_SIZE
>> +
>> +#define GUC_LOG_CALC_UNIT(size)                (((size) % SZ_1M) == 0 ? SZ_1M : SZ_4K)
>> +#define GUC_LOG_CALC_FLAG(size)                (((size) % SZ_1M) == 0 ? GUC_LOG_LOG_ALLOC_UNITS : 0)
>> +
>> +/* Size is +1 unit */
>> +#define GUC_LOG_CALC_COUNT(size)       ((size) / GUC_LOG_CALC_UNIT(size) - 1)
>> +
>> +static const struct xe_log_sizes_type log_sizes[GUC_LOG_BUFFER_TYPE_MAX] = {
>> +       {
>> +               GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE,
>> +               GUC_LOG_CALC_UNIT(GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE),
>> +               GUC_LOG_CALC_COUNT(GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE),
>> +               GUC_LOG_CALC_FLAG(GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE)
>> +       },
>> +       {
>> +               GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE,
>> +               GUC_LOG_CALC_UNIT(GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE),
>> +               GUC_LOG_CALC_COUNT(GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE),
>> +               GUC_LOG_CALC_FLAG(GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE)
>> +       },
>> +       {
>> +               GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE,
>> +               GUC_LOG_CALC_UNIT(GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE),
>> +               GUC_LOG_CALC_COUNT(GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE),
>> +               GUC_LOG_CALC_FLAG(GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE)
>> +       }
>> +};
>> +
>> +/* Zero is not allowed for crash/debug/capture size */
>> +static_assert(GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE);
>> +static_assert(GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE);
>> +static_assert(GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE);
>> +
>> +/* crash unit must equal to debug unit */
>> +static_assert(GUC_LOG_CALC_UNIT(GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE) ==
>> +             GUC_LOG_CALC_UNIT(GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE));
>> +
>> +/* crash/debug/capture count must less than mask range */
>> +static_assert(GUC_LOG_CALC_COUNT(GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE) <=
>> +             GUC_LOG_CRASH_MASK >> GUC_LOG_CRASH_SHIFT);
>> +static_assert(GUC_LOG_CALC_COUNT(GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE) <=
>> +             GUC_LOG_DEBUG_MASK >> GUC_LOG_DEBUG_SHIFT);
>> +static_assert(GUC_LOG_CALC_COUNT(GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE) <=
>> +             GUC_LOG_CAPTURE_MASK >> GUC_LOG_CAPTURE_SHIFT);
>> +
> alan: as per offline conversation and in line with my review comments from v11,
> you don't need to add any of these build time checks because guc_ctl_log_params_flags
> already does this - i just wanted you to check that existing code is still
> good for the increased capture region size.
Right, this is duplicated check, will be removed on next rev.

> 
> 
>> +static inline struct xe_guc *log_to_guc(struct xe_guc_log *log)
>> +{
>> +       return container_of(log, struct xe_guc, log);
>> +}
>> +
>>   static struct xe_gt *
>>   log_to_gt(struct xe_guc_log *log)
>>   {
>> @@ -80,7 +135,8 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
>>   int xe_guc_log_init(struct xe_guc_log *log)
>>   {
>>          struct xe_device *xe = log_to_xe(log);
>> -       struct xe_tile *tile = gt_to_tile(log_to_gt(log));
>> +       struct xe_gt *gt = log_to_gt(log);
>> +       struct xe_tile *tile = gt_to_tile(gt);
>>          struct xe_bo *bo;
>>   
>>          bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
>> @@ -96,3 +152,86 @@ int xe_guc_log_init(struct xe_guc_log *log)
>>   
>>          return 0;
>>   }
>> +
>> +/**
>> + * xe_guc_log_section_size_capture - Get capture buffer size in log sections.
>> + * @log: The log object.
>> + *
>> + * This function will return the capture buffer size in log sections.
>> + *
>> + * Return: capture buffer size.
>> + */
>> +u32 xe_guc_log_section_size_capture(struct xe_guc_log *log)
>> +{
>> +       return log_sizes[GUC_LOG_BUFFER_CAPTURE].bytes;
>> +}
>> +
>> +/**
>> + * xe_guc_check_log_buf_overflow - Check if log buffer overflowed
>> + * @log: The log object.
>> + * @type: The log buffer type
>> + * @full_cnt: The count of buffer full
>> + *
>> + * This function will check count of buffer full against previous, mismatch
>> + * indicate overflowed.
>> + * Update the sampled_overflow counter, if the 4 bit counter overflowed, add
>> + * up 16 to correct the value.
>> + *
>> + * Return: True if overflowed.
>> + */
>> +bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log, enum guc_log_buffer_type type,
>> +                                  unsigned int full_cnt)
>> +{
>> +       unsigned int prev_full_cnt = log->stats[type].sampled_overflow;
>> +       bool overflow = false;
>> +
>> +       if (full_cnt != prev_full_cnt) {
>> +               overflow = true;
>> +
>> +               log->stats[type].overflow = full_cnt;
>> +               log->stats[type].sampled_overflow += full_cnt - prev_full_cnt;
>> +
>> +               if (full_cnt < prev_full_cnt) {
>> +                       /* buffer_full_cnt is a 4 bit counter */
>> +                       log->stats[type].sampled_overflow += 16;
>> +               }
>> +               xe_gt_notice(log_to_gt(log), "log buffer overflow\n");
>> +       }
>> +
>> +       return overflow;
>> +}
>> +
>> +/**
>> + * xe_guc_get_log_buffer_size - Get log buffer size for a type.
>> + * @log: The log object.
>> + * @type: The log buffer type
>> + *
>> + * Return: buffer size.
>> + */
>> +u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type type)
>> +{
>> +       xe_gt_assert(log_to_gt(log), type < GUC_LOG_BUFFER_TYPE_MAX);
>> +       return log_sizes[type].bytes;
>> +}
>> +
>> +/**
>> + * xe_guc_get_log_buffer_offset - Get offset in log buffer for a type.
>> + * @log: The log object.
>> + * @type: The log buffer type
>> + *
>> + * This function will return the offset in the log buffer for a type.
>> + * Return: buffer offset.
>> + */
>> +u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type)
>> +{
>> +       enum guc_log_buffer_type i;
>> +       u32 offset = PAGE_SIZE;/* for the log_buffer_states */
>> +
>> +       for (i = GUC_LOG_BUFFER_CRASH_DUMP; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
>> +               if (i == type)
>> +                       break;
>> +               offset += xe_guc_get_log_buffer_size(log, i);
>> +       }
>> +
>> +       return offset;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
>> index 2d25ab28b4b3..1d3b123cebd3 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
>> @@ -7,6 +7,7 @@
>>   #define _XE_GUC_LOG_H_
>>   
>>   #include "xe_guc_log_types.h"
>> +#include "xe_guc_types.h"
>>   
>>   struct drm_printer;
>>   
>> @@ -17,7 +18,7 @@ struct drm_printer;
>>   #else
>>   #define CRASH_BUFFER_SIZE      SZ_8K
>>   #define DEBUG_BUFFER_SIZE      SZ_64K
>> -#define CAPTURE_BUFFER_SIZE    SZ_16K
>> +#define CAPTURE_BUFFER_SIZE    SZ_1M
>>   #endif
>>   /*
>>    * While we're using plain log level in i915, GuC controls are much more...
>> @@ -45,4 +46,13 @@ xe_guc_log_get_level(struct xe_guc_log *log)
>>          return log->level;
>>   }
>>   
>> +u32 xe_guc_log_section_size_capture(struct xe_guc_log *log);
>> +
>> +bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log,
>> +                                  enum guc_log_buffer_type type,
>> +                                  unsigned int full_cnt);
>> +
>> +u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type type);
>> +u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type);
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log_types.h b/drivers/gpu/drm/xe/xe_guc_log_types.h
>> index 125080d138a7..e0122aa99aa1 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_log_types.h
>> @@ -7,9 +7,18 @@
>>   #define _XE_GUC_LOG_TYPES_H_
>>   
>>   #include <linux/types.h>
>> +#include "abi/guc_log_abi.h"
>>   
>>   struct xe_bo;
>>   
>> +/** @sizes: Allocation settings */
>> +struct xe_log_sizes_type {
>> +       u32 bytes;      /* Size in bytes */
>> +       u32 units;      /* GuC API units - 1MB or 4KB */
>> +       u32 count;      /* Number of API units */
>> +       u32 flag;       /* GuC API units flag */
>> +};
>> +
>>   /**
>>    * struct xe_guc_log - GuC log
>>    */
>> @@ -18,6 +27,14 @@ struct xe_guc_log {
>>          u32 level;
>>          /** @bo: XE BO for GuC log */
>>          struct xe_bo *bo;
>> +       /** @sizes: Allocation settings */
>> +       struct xe_log_sizes_type sizes[GUC_LOG_BUFFER_TYPE_MAX];
>> +       /** @stats: logging related stats */
>> +       struct {
>> +               u32 sampled_overflow;
>> +               u32 overflow;
>> +               u32 flush;
>> +       } stats[GUC_LOG_BUFFER_TYPE_MAX];
>>   };
>>   
>>   #endif
> 
