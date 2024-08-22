Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABC1C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 22 Aug 2024 10:52:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3393E10E84D;
	Thu, 22 Aug 2024 10:52:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jaN5aOVF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FBED10E84D
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Aug 2024 10:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724323935; x=1755859935;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=UwiyseufG13qrOv8DRJQntF2A23D8xSqvgOuWQDqQA0=;
 b=jaN5aOVFJrDsSMUd9rMuFfKpaFX2hOn/sIcXJRcg8sWeFhTytU/a3PfP
 TrYvIbKEQYQknFFVaySFOJgZzw+wQ4PPClgpEX4eHdLJLF8ntXYo6fosT
 RXH97zo3k4JPJTX5mjBxvxk4tB/O14JX7iQsABtqbu0oiPJ0mpB7igeSS
 JDsIlLPf/bm+dBymAzEdKWz3Mo23tzlOXtvmFRgLys6wGhmGbFwZCmBL4
 nmU1DQ1KqHpyzaF4uR29dssdQqL2b4sufe6RbJwdCswp5/x1K2GA3FPBk
 2fAONrn2yajRBO+YAO/4D9isMaikWj9/GdVNZS1hYuAUjwtHMrRk7+fWL w==;
X-CSE-ConnectionGUID: Cx5FUGBPRiW1Ll3H2U5Xog==
X-CSE-MsgGUID: 5OqTE8QSRYKpwWWBsv1Nbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="25624798"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="25624798"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 03:51:59 -0700
X-CSE-ConnectionGUID: nl9Rv/qVQtqV63SQs2be8g==
X-CSE-MsgGUID: +MCBMUTTTbmE3MDy0zhOxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="61937632"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Aug 2024 03:51:59 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 03:51:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 03:51:57 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 22 Aug 2024 03:51:57 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 03:51:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bk5acqsJq9dsaSOfVuAIHldXFz1Zz2HUc/rzOcNfUG+ePCkVh9aXxIKdxGNECYnJWtiuKRtoTD2ea+/cnQz6kWJ7JTl8G2dRWmXK1Yj1Rq+6sLPqhF0DENFVL/EmsEnRzw0SW/w1VD6dcuBdESTCkNpYUH/45NqnUk2DT7wgQpTf3XL86SeDoAEUJArpn9K1LGX8zuth2MQRg1L3I5i9pCUrQCIxM94/lck2kKLoTc1wF7zwRWyr2K6Yzk11wRe5I+nQ90ekiJSH/VIViKqcNIZiju8D4O/iaDMGnrigyhnaPyHlYKUJOumc1qLCVxMWrfj2kIVJwmPGC6XXKYkKUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZ2S6IDP7vhYvElwRMndUribCSAFlcx1PXHTYl1lOZ8=;
 b=b465A3MntArmSTqKYpWRgQ38epc7Jct+vg60nGtP+fyHzODE0P90wLTYHxxEb+pvcokV2rN3Rr1wOvwMuvbBXqE+xzlfdfu9T9wJJazUFSXjRY/JMo42DFnyDzP8fnp1X/FU62gzY3OY5PZoLWuk4UOoBt+EN0i1Dtd+QEmSMwXeBuYBkyX8J5Cdyf6IHCA2WZv4RFOsPCGPhWjMFjw1nw2iaX7vHmiw+Ayfyv2fK59uUvhynPhGN9SNlhYpOmDWjz/uUIgzNJulXY/Llnv41AGDHAh56NFjCoNYSJWKHLIi8P3aGvnMHCRqI8qreeL9NCulkyTENtRR/xOssY/UEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CH0PR11MB8165.namprd11.prod.outlook.com (2603:10b6:610:18e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Thu, 22 Aug
 2024 10:51:48 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%3]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 10:51:48 +0000
Date: Thu, 22 Aug 2024 12:51:46 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 11/12] drm/xe/tests: Add KUnit tests for VF control
 state machines
Message-ID: <20240822105146.bys7w5dvheprtiq5@intel.com>
References: <20240809165159.662-12-michal.wajdeczko@intel.com>
 <20240809172315.749-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240809172315.749-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DB9PR05CA0008.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::13) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CH0PR11MB8165:EE_
X-MS-Office365-Filtering-Correlation-Id: 552972da-5e6d-4730-431b-08dcc2986c29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cG9WMllnZEEveDJwR2VNQ0Q5SE1aQUVPMHN5TXQ1WkJoaERNOEZqWStjalB1?=
 =?utf-8?B?OEJkSHdLd1J4QjVLNzk0Ry8zNXp1NW0wd0Q5Q3lxVlVaTFRWeDdGNmFYWUNx?=
 =?utf-8?B?K0tBRmlsdTlBYWsxVmU5VDk5S0JvamRFK1A0UHJvTDQ3NGxRenN2TUJVQnNF?=
 =?utf-8?B?cjlIa0hoeVdiL29SNHJXZHF0UHFkSEFkekllb21uZGtENHRzWTNqNnE4S0Vs?=
 =?utf-8?B?OG9SbWdiSzd3MmtpUytUc1VXSzYza1dpaHZacVdjbmNObmtPR0hmNUZhS2J2?=
 =?utf-8?B?MTdSTHBySVRxWkdERzllYVhxVFJmK1JDZUZWV0xxM0FrKzdlNHVwejgvNzMv?=
 =?utf-8?B?TTRPNEg4d0JoTlp1MVZRaUFkaXBqOFFWRngwNzgraThVOHhKMEdXNEtjSUIz?=
 =?utf-8?B?cmMxS054NjNZV2JBdHRJOWhRM3JJUWVFN0NjYnNKcmo2bmgrYzhHNjZGYUFK?=
 =?utf-8?B?K3M5c3M2aDN1RDBHcmF4N0syOTBFMXNScElEZWhLVjE1cW9DRXN1RzNTZmlo?=
 =?utf-8?B?VHh1aVFPVG10VzJ0YUExZG1wUEw1MGR6VkQvZk81cXpVaWZFZkxaM1NKVmt0?=
 =?utf-8?B?bmIrd1plNWRqOG12SWltYURBUjF0djV6ampUaE0wQjhHcGR3VTdPK2E5RTEw?=
 =?utf-8?B?TXRkNlI4WkV1VlJuSFdMbllCb0grY2ZoMkhmVFNZUlhhNUVncHVGRlFSZE5X?=
 =?utf-8?B?SDkwVWxHWk1nTEgrTzdxdE9ZMUptck1KeWpsOVZOS0dBM1N1Unc2NGd3RExk?=
 =?utf-8?B?RFpMcllBaEJxcklZWUV2US9TN0dmdDUrdEViVit2Q2pCNUkyajRoK2FsWW80?=
 =?utf-8?B?V0czWFlXdVZuOStwb24xU21ZSGNkUzJFZStRTEw2OVgzTTZjc0U3RVRBaUVR?=
 =?utf-8?B?NXdBKzV0a05xWWtWd0w0aWFzQXRDUXdpekRoQVNCak1xakpkMmo1ZDF4Lzc5?=
 =?utf-8?B?Y0R3MGlhTFkvUkpwMGJxaHVyZitvdVluMFpabUIzLy9LYzZnUVNhYUVrZkZF?=
 =?utf-8?B?S0pBYnVsUkcxcEtNeGZVQURUWnBaNFdBSG5aSWJCYVZUdTE1Nm9ZK3JMZXpi?=
 =?utf-8?B?THRVU0FPU0RnalhaRU1BWHJoT3NUZ3pzTlNrcjZyK1dKWkNrREg0eUp2N0t1?=
 =?utf-8?B?Q3NGR3ZGbS9qTDJSdFJlUWlwUUI4SzBROTFoVVJGOTlhZlZQdmxOb1VyM0tN?=
 =?utf-8?B?emtNMWtzSzd1UGIxbmlSc2lJT09pQU9RQk10MG01T05Tb3NvSWIraGhYK3gw?=
 =?utf-8?B?b1Z6UHdYQnBsRDlWZHZ3S25NcGZnaldNdlRpaml4WXEzallPY1I2ZlpyWEMy?=
 =?utf-8?B?RlU5cUkrc0RRdEVhUUd6SW1MUGhRV21iZ2ZPZG1UTzlreWhISWV4TjZ2TFVV?=
 =?utf-8?B?NDlFOUlKa1RGcE1zdThiREIwb0prb2pXWERrYkpacUNYSjBCb1ltTFBiTy9Q?=
 =?utf-8?B?aEtCc3FuSGZNUU9WU29IQnZ5a1FoMHEwd3NXTGZGeGErbkdkSkd4djB2VlFt?=
 =?utf-8?B?OXU0Wm5HdC9GbUY1K1ViNHZFaWJOaE9iTmQ3SnFDY2o2bFhUKzI0QVlwQXht?=
 =?utf-8?B?WXlYTE8zbko1RURubFBEVUdWNGozcFo0VHdYUlZGREdlbVJtZDZuTFpva2xa?=
 =?utf-8?B?ZlNKUXlVdnl2RmwxUVVxMDBONkhtTzUvMStNYWhLMDVZNERmeFlNYk9NQnMv?=
 =?utf-8?B?UGpRakdKVXFvNlRCa0V4L0RxREwwNmZGZjNEelVyb21Va3NwZy9BaTBDNXIr?=
 =?utf-8?B?UC9Fd1VIcS9hbGxneEgzTE5vbkNaMWREMTdkUUNPb1Uza1kxdm9wYzJoUHhC?=
 =?utf-8?Q?AWLMHebJw+pGLOHOwMWJakwZS+8hAfH1ljaXI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ris0QWZRRkw2V29pQmxxY3hwVkFVMTlZS2YzWFZyT3k1Zi9tQzNQTC83TVZE?=
 =?utf-8?B?SWx1eVBIRFloL2pxVjEwUUpvVmdxZUNQSFZHSndRQlRsNmR1ME53TWJkaW1O?=
 =?utf-8?B?NlRlT2lXUDJTQ0U5RW5UUGJUQW5WWnFlZFZoNnFzR1NQSnpyeitUcmxPUXN5?=
 =?utf-8?B?Y2tvalZxZDh2Sk5ZRmhTMlFEYlBIeVFNU1ZVTUNiYVVKQ045c0FkMnluajVk?=
 =?utf-8?B?NjNmU2x6U2ZvWFN3RjNiWHJ6QWd6N2dsWmNKU1FxY0tMRnlLZmdXMStNUHVz?=
 =?utf-8?B?cWp0MmFKVHVkeGM4SEY4QW8waXFSRWNqdGlJYld2czdya2R5Z1lzWVBnMjhl?=
 =?utf-8?B?clFXZVhMKzNIZkdkbDQ2MXpVMzNYSU9CUE1VTTk5NThYQWNpU2FQU3lZaWhJ?=
 =?utf-8?B?TXE0OE1jb3hlTWZKWXZIeWlkR3BEVXA4VURrMUxIVlRwYnMralNlU0czNGkr?=
 =?utf-8?B?YzhicVN0K2VLRHhQZ1lPcFUzOGhzSnM2UGFLdmpqN0FXOTA0eVd0MW9ncVpN?=
 =?utf-8?B?Z1dLVlJrZHloWGhrNzNFZEpvbmZvbzBmbzhqT2hLSy9FL0xWWlhxUnZZVzd4?=
 =?utf-8?B?LzJaeXlCUldhVUV6YVlzZCt0WmM1WWtLUzhqRHBLUlFKSENsU1FKQ0RVMVJp?=
 =?utf-8?B?WDFFM3kxbUdqd1BVMnk2ZGgwMUtWS1owYm95U09hTkUwZ3dReUgwWTJ4Szhr?=
 =?utf-8?B?MUdXQnFFVHJTeTlvK2JJUmNaQ2M1Si9YdVdYakRieUpORHNOeHJGSVJhKzFz?=
 =?utf-8?B?WlVWMlVXcE1qU2xaSURtVG00R21tcHpzRHJHam5qVWR4UmgvUGw5YTU3Q1JN?=
 =?utf-8?B?MUx4RFptSm1NMUxtNFNEeGh4SHdYa2VIRnMxWExZYndEd3gzMWIxOVh6cENL?=
 =?utf-8?B?dms5cEtyZ2NvN1FZUEdZb1NkVXE1UEZyMUhHSklKYnA2SDdUL0U2M1BDTCtZ?=
 =?utf-8?B?RWVsc3pJQXIwWXVDRnRzZndCb3licG4rR2FSc3pzb0NDdDFDUjdGcWE4VFNz?=
 =?utf-8?B?WVFXeTh4M1VrSDlYWFNWeHNia0oxcWRXYzRHQktldUx6OHk2SGs1VkdndHQv?=
 =?utf-8?B?VVF3MHkxYmFucnFxVjVXRXBJRDI0N1ErNUp0Q0VaZi9kUlRnTTZ6V0txWW4w?=
 =?utf-8?B?RXYwOThhSEVBd1B5TElnV2NKdWhMNll5cjRBbUlmeEorQ3RxNStXVWE3T3Zx?=
 =?utf-8?B?L2R1d0FiUTlqdmU4TS9tMlBZUEpJMHpLNURWWGw1NHE0cmZxRXI4TGlJblhz?=
 =?utf-8?B?TUdrSjZRSG9BRUpUOEcwQUNlTE4rczVWb3NOV3doMStHRHFDMTVlUUg0aUsx?=
 =?utf-8?B?a1ZOUFF5TkhtdmtVemRFc1VXV2FGUUdKRjM0M2ovOWRSMFlRazBiZjVmYi9T?=
 =?utf-8?B?Wk1TLzFSTnhETWFSS1l3TDYrK1RacllQdWRwVnRIMUY2cVBwLy9LVnV4U0ZY?=
 =?utf-8?B?c0tuWmxUVjVod0NYZUNPdElZV2Qvc29oNEQ5TFFpSnJxeUc3SnFWcVBHNnBF?=
 =?utf-8?B?WVJTbnR6R2s3eFdWZlowL3JNZU0rWnFXRUt6NnJyUGxOVVI0YUJtK2publF3?=
 =?utf-8?B?ZmY5eEwyNlBmc2FkcjVrK1pBMCtwWHN3QmRBVnludWtHSGphWUM2cEYrMzZP?=
 =?utf-8?B?aWlVcmxRMi9oU1Z5N0k0VHFJY1Vtb2x1Q1F5T2RKN1VpMVJrODd3TDI3MWlF?=
 =?utf-8?B?TmFrT1RWRWtpQzhvam9hTGVCYXVDTjNjK0hpTEdXTzc0VTdhS09OeDJUeVJS?=
 =?utf-8?B?WFRTWnI0YjZsMXptSHF5bm95M0VSajhKVkJOY2c0OUFWMzMzSzk0SG83TGJY?=
 =?utf-8?B?dHVpSUZZeGJjNE93Ujd3RkVNeWNHUW9yK0E4eWF5YWZQZXFrKzluL2dNSmw0?=
 =?utf-8?B?NTVSNEY5NmloL3ZmMm92eWNIMDhpcC9GRncwR1BNenFuWE94cU0yYnAxaEFh?=
 =?utf-8?B?UzZSME80NVY3ZnpIL0hVb3gxakJSNzR1anNvbkhBQ1JDYVBGZlRNblMrbzdj?=
 =?utf-8?B?K1R6SCtkMFJUUUFpRHZJWHdCV2ZnVEptbzkxYTZFbEdpZjJXSVJkaUVDU2lo?=
 =?utf-8?B?a3B0MXA0QmVGZ1FsSER5T1VxSUtCb0kzUjl4dHNuTi9Vb0xrWGZlSzh2TFJs?=
 =?utf-8?B?d1F5NklWbURodEtxK1VPZlFuY1hZRUowdklyZVJKYUl5SUpLaGxsZlhvV3dn?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 552972da-5e6d-4730-431b-08dcc2986c29
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 10:51:48.7252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ORN0wDDpop9booMp5WpjkOQadzBeCQ7N9rWbJxDdef88PlUsRE/xIJYfdf0NraJVAXOena8Kvp5dHOGHTRAAW2rSmLBsccP5/61NEHAvd5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8165
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2024-sie-09 19:23:15 +0200]:
> Add KUnit tests (~200) for all VF control state machines (FLR,
> PAUSE, STOP and RESUME) to make sure they work as expected and
> will not be broken while extending them with new functionality.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> Test file named according to the new best practices [1]
> [1] https://lore.kernel.org/linux-hardening/20240724201354.make.730-kees@kernel.org/
> ---
> v2: fix kunit build break due last-minute change in .c
> ---
>  .../xe/tests/xe_gt_sriov_pf_control_kunit.c   | 1360 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |    7 +
>  2 files changed, 1367 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c
> new file mode 100644
> index 000000000000..3061099ad35a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c
> @@ -0,0 +1,1360 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <kunit/test.h>
> +#include <kunit/static_stub.h>
> +
> +#include "tests/xe_kunit_helpers.h"
> +#include "tests/xe_pci_test.h"
> +
> +#include "xe_gt_sriov_pf.h"
> +
> +static const unsigned int DUT_NUM_VFS = 2;
> +static const unsigned int VFUT1 = VFID(1);
> +static const unsigned int VFUT2 = VFID(2);
> +
> +static void dump_state(void *arg)
> +{
> +	struct xe_gt *gt = arg;
> +
> +	pf_dump_vf_state(gt, VFUT1);
> +}
> +
> +static unsigned long replacement_timeout(enum xe_gt_sriov_control_bits bit)
> +{
> +	return HZ;
> +}
> +
> +static int pf_control_test_init(struct kunit *test)
> +{
> +	struct xe_pci_fake_data fake = {
> +		.sriov_mode = XE_SRIOV_MODE_PF,
> +		.platform = XE_TIGERLAKE, /* some random platform */
> +		.subplatform = XE_SUBPLATFORM_NONE,
> +	};
> +	struct xe_device *xe;
> +	struct xe_gt *gt;
> +
> +	test->priv = &fake;
> +	xe_kunit_helper_xe_device_test_init(test);
> +
> +	xe = test->priv;
> +	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
> +
> +	xe->sriov.pf.driver_max_vfs = DUT_NUM_VFS;
> +	KUNIT_EXPECT_NE(test, xe_sriov_pf_get_totalvfs(xe), 0);
> +
> +	gt = xe_device_get_gt(xe, 0);
> +	KUNIT_ASSERT_EQ(test, xe_gt_sriov_pf_init_early(gt), 0);
> +
> +	KUNIT_ASSERT_EQ(test, 0ul, *pf_peek_vf_state(gt, VFUT1));
> +	KUNIT_ASSERT_EQ(test, 0ul, *pf_peek_vf_state(gt, VFUT2));
> +
> +	KUNIT_EXPECT_EQ(test, 0, kunit_add_action_or_reset(test, dump_state, gt));
> +
> +	kunit_activate_static_stub(test, pf_get_default_timeout, replacement_timeout);
> +
> +	test->priv = gt;
> +	return 0;
> +}
> +
> +static int sanitize_vf_resources_fail(struct xe_gt *gt, u32 vfid, long timeout)
> +{
> +	return -ETIMEDOUT;
> +}
> +
> +static int send_vf_control_cmd_reject(struct xe_gt *gt, unsigned int vfid, u32 cmd)
> +{
> +	return -EIO;
> +}
> +
> +static int send_vf_control_cmd_fail(struct xe_gt *gt, unsigned int vfid, u32 cmd)
> +{
> +	return -ENODEV;
> +}
> +
> +static int send_vf_control_cmd_pass_no_reply(struct xe_gt *gt, unsigned int vfid, u32 cmd)
> +{
> +	return 0;
> +}
> +
> +static int send_vf_control_cmd_pass_and_reply(struct xe_gt *gt, unsigned int vfid, u32 cmd)
> +{
> +	switch (cmd) {
> +	case GUC_PF_TRIGGER_VF_PAUSE:
> +		pf_handle_vf_event(gt, vfid, GUC_PF_NOTIFY_VF_PAUSE_DONE);
> +		break;
> +	case GUC_PF_TRIGGER_VF_FLR_START:
> +		pf_handle_vf_event(gt, vfid, GUC_PF_NOTIFY_VF_FLR_DONE);
> +		break;
> +	case GUC_PF_TRIGGER_VF_RESUME:
> +	case GUC_PF_TRIGGER_VF_STOP:
> +	case GUC_PF_TRIGGER_VF_FLR_FINISH:
> +		break;
> +	default:
> +		return -EPROTO;
> +	}
> +	return 0;
> +}
> +
> +static int send_vf_control_cmd_busy_wait(struct xe_gt *gt, unsigned int vfid, u32 cmd)
> +{
> +	schedule_timeout_interruptible(HZ / 20);
> +	return -EBUSY;
> +}
> +
> +static int send_vf_control_cmd_pass_but_reply_flr_only(struct xe_gt *gt, unsigned int vfid, u32 cmd)
> +{
> +	return cmd == GUC_PF_TRIGGER_VF_FLR_START ?
> +		send_vf_control_cmd_pass_and_reply(gt, vfid, cmd) :
> +		send_vf_control_cmd_pass_no_reply(gt, vfid, cmd);
> +}
> +
> +static int send_vf_control_cmd_busy_except_flr(struct xe_gt *gt, unsigned int vfid, u32 cmd)
> +{
> +	return cmd == GUC_PF_TRIGGER_VF_FLR_START || cmd == GUC_PF_TRIGGER_VF_FLR_FINISH ?
> +		send_vf_control_cmd_pass_and_reply(gt, vfid, cmd) :
> +		send_vf_control_cmd_busy_wait(gt, vfid, cmd);
> +}
> +
> +static int send_vf_control_cmd_busy_except_stop(struct xe_gt *gt, unsigned int vfid, u32 cmd)
> +{
> +	return cmd == GUC_PF_TRIGGER_VF_STOP ?
> +		send_vf_control_cmd_pass_and_reply(gt, vfid, cmd) :
> +		send_vf_control_cmd_busy_wait(gt, vfid, cmd);
> +}
> +
> +static int BUSY_MAGIC = 3;
> +
> +static int send_vf_control_cmd_busy_no_reply(struct xe_gt *gt, unsigned int vfid, u32 cmd)
> +{
> +	static int counter;
> +
> +	return ++counter % BUSY_MAGIC ? -EBUSY : 0;
> +}
> +
> +static int send_vf_control_cmd_busy_and_reply(struct xe_gt *gt, unsigned int vfid, u32 cmd)
> +{
> +	static int counter;
> +
> +	return ++counter % BUSY_MAGIC ? -EBUSY :
> +		send_vf_control_cmd_pass_and_reply(gt, vfid, cmd);
> +}
> +
> +static const enum xe_gt_sriov_control_bits ready[] = {
> +};
> +
> +static const enum xe_gt_sriov_control_bits flr_starting[] = {
> +	XE_GT_SRIOV_STATE_WIP,
> +	XE_GT_SRIOV_STATE_FLR_WIP,
> +	XE_GT_SRIOV_STATE_FLR_SEND_START,
> +};
> +
> +static const enum xe_gt_sriov_control_bits flr_starting_paused[] = {
> +	XE_GT_SRIOV_STATE_WIP,
> +	XE_GT_SRIOV_STATE_FLR_WIP,
> +	XE_GT_SRIOV_STATE_FLR_SEND_START,
> +	XE_GT_SRIOV_STATE_PAUSED,
> +};
> +
> +static const enum xe_gt_sriov_control_bits flr_starting_stopped[] = {
> +	XE_GT_SRIOV_STATE_WIP,
> +	XE_GT_SRIOV_STATE_FLR_WIP,
> +	XE_GT_SRIOV_STATE_FLR_SEND_START,
> +	XE_GT_SRIOV_STATE_STOPPED,
> +};
> +
> +static const enum xe_gt_sriov_control_bits flr_waiting[] = {
> +	XE_GT_SRIOV_STATE_WIP,
> +	XE_GT_SRIOV_STATE_FLR_WIP,
> +	XE_GT_SRIOV_STATE_FLR_WAIT_GUC,
> +};
> +
> +static const enum xe_gt_sriov_control_bits flr_guc_done[] = {
> +	XE_GT_SRIOV_STATE_WIP,
> +	XE_GT_SRIOV_STATE_FLR_WIP,
> +	XE_GT_SRIOV_STATE_FLR_GUC_DONE,
> +};
> +
> +static const enum xe_gt_sriov_control_bits flr_resetting[] = {
> +	XE_GT_SRIOV_STATE_WIP,
> +	XE_GT_SRIOV_STATE_FLR_WIP,
> +	XE_GT_SRIOV_STATE_FLR_RESET_CONFIG,
> +};
> +
> +static const enum xe_gt_sriov_control_bits flr_finishing[] = {
> +	XE_GT_SRIOV_STATE_WIP,
> +	XE_GT_SRIOV_STATE_FLR_WIP,
> +	XE_GT_SRIOV_STATE_FLR_SEND_FINISH,
> +};
> +
> +static const enum xe_gt_sriov_control_bits flr_failed[] = {
> +	XE_GT_SRIOV_STATE_FLR_FAILED,
> +};
> +
> +static const enum xe_gt_sriov_control_bits stopping[] = {
> +	XE_GT_SRIOV_STATE_WIP,
> +	XE_GT_SRIOV_STATE_STOP_WIP,
> +	XE_GT_SRIOV_STATE_STOP_SEND_STOP,
> +};
> +
> +static const enum xe_gt_sriov_control_bits stopping_paused[] = {
> +	XE_GT_SRIOV_STATE_WIP,
> +	XE_GT_SRIOV_STATE_STOP_WIP,
> +	XE_GT_SRIOV_STATE_STOP_SEND_STOP,
> +	XE_GT_SRIOV_STATE_PAUSED,
> +};
> +
> +static const enum xe_gt_sriov_control_bits stop_failed[] = {
> +	XE_GT_SRIOV_STATE_STOP_FAILED,
> +};
> +
> +static const enum xe_gt_sriov_control_bits stop_rejected[] = {
> +	XE_GT_SRIOV_STATE_STOP_FAILED,
> +	XE_GT_SRIOV_STATE_MISMATCH,
> +};
> +
> +static const enum xe_gt_sriov_control_bits stopped[] = {
> +	XE_GT_SRIOV_STATE_STOPPED,
> +};
> +
> +static const enum xe_gt_sriov_control_bits pausing[] = {
> +	XE_GT_SRIOV_STATE_WIP,
> +	XE_GT_SRIOV_STATE_PAUSE_WIP,
> +	XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE,
> +};
> +
> +static const enum xe_gt_sriov_control_bits pausing_wait_guc[] = {
> +	XE_GT_SRIOV_STATE_WIP,
> +	XE_GT_SRIOV_STATE_PAUSE_WIP,
> +	XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC,
> +};
> +
> +static const enum xe_gt_sriov_control_bits pausing_guc_done[] = {
> +	XE_GT_SRIOV_STATE_WIP,
> +	XE_GT_SRIOV_STATE_PAUSE_WIP,
> +	XE_GT_SRIOV_STATE_PAUSE_GUC_DONE,
> +};
> +
> +static const enum xe_gt_sriov_control_bits pause_failed[] = {
> +	XE_GT_SRIOV_STATE_PAUSE_FAILED,
> +};
> +
> +static const enum xe_gt_sriov_control_bits pause_rejected[] = {
> +	XE_GT_SRIOV_STATE_PAUSE_FAILED,
> +	XE_GT_SRIOV_STATE_MISMATCH,
> +};
> +
> +static const enum xe_gt_sriov_control_bits paused[] = {
> +	XE_GT_SRIOV_STATE_PAUSED,
> +};
> +
> +static const enum xe_gt_sriov_control_bits resuming[] = {
> +	XE_GT_SRIOV_STATE_WIP,
> +	XE_GT_SRIOV_STATE_PAUSED,
> +	XE_GT_SRIOV_STATE_RESUME_WIP,
> +	XE_GT_SRIOV_STATE_RESUME_SEND_RESUME,
> +};
> +
> +static const enum xe_gt_sriov_control_bits resume_failed[] = {
> +	XE_GT_SRIOV_STATE_PAUSED,
> +	XE_GT_SRIOV_STATE_RESUME_FAILED,
> +};
> +
> +static const enum xe_gt_sriov_control_bits resume_rejected[] = {
> +	XE_GT_SRIOV_STATE_PAUSED,
> +	XE_GT_SRIOV_STATE_RESUME_FAILED,
> +	XE_GT_SRIOV_STATE_MISMATCH,
> +};
> +
> +static const enum xe_gt_sriov_control_bits resumed[] = {
> +	XE_GT_SRIOV_STATE_RESUMED,
> +};
> +
> +static const enum xe_gt_sriov_control_bits mismatch[] = {
> +	XE_GT_SRIOV_STATE_MISMATCH,
> +};
> +
> +struct state_param {
> +	const char *name;
> +	const enum xe_gt_sriov_control_bits *bits;
> +	size_t num_bits;
> +};
> +
> +static void state_param_get_desc(struct state_param *p, char *desc)
> +{
> +	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s", p->name);
> +}
> +
> +#define MAKE_STATE_PARAM(X) { .name = #X, .bits = X, .num_bits = ARRAY_SIZE(X) }
> +
> +/*
> + * Due to the test case logic the all "must_pass" params include "_rejected" states
> + * since our "GuC" calls by default will not complain again about the INVALID_STATE
> + * thus our state machine is able to fully recover.
> + */
> +
> +static struct state_param flr_must_pass_from[] = {
> +	MAKE_STATE_PARAM(ready),
> +	MAKE_STATE_PARAM(flr_starting),
> +	MAKE_STATE_PARAM(flr_starting_paused),
> +	MAKE_STATE_PARAM(flr_starting_stopped),
> +	MAKE_STATE_PARAM(flr_waiting),
> +	MAKE_STATE_PARAM(flr_guc_done),
> +	MAKE_STATE_PARAM(flr_resetting),
> +	MAKE_STATE_PARAM(flr_finishing),
> +	MAKE_STATE_PARAM(flr_failed),
> +	MAKE_STATE_PARAM(stopping),
> +	MAKE_STATE_PARAM(stop_failed),
> +	MAKE_STATE_PARAM(stop_rejected),
> +	MAKE_STATE_PARAM(stopped),
> +	MAKE_STATE_PARAM(pausing),
> +	MAKE_STATE_PARAM(pausing_wait_guc),
> +	MAKE_STATE_PARAM(pausing_guc_done),
> +	MAKE_STATE_PARAM(pause_failed),
> +	MAKE_STATE_PARAM(pause_rejected),
> +	MAKE_STATE_PARAM(paused),
> +	MAKE_STATE_PARAM(resuming),
> +	MAKE_STATE_PARAM(resume_failed),
> +	MAKE_STATE_PARAM(resume_rejected),
> +	MAKE_STATE_PARAM(resumed),
> +	MAKE_STATE_PARAM(mismatch),
> +};
> +
> +static struct state_param stop_must_pass_from[] = {
> +	MAKE_STATE_PARAM(ready),
> +	MAKE_STATE_PARAM(stop_failed),
> +	MAKE_STATE_PARAM(stop_rejected),
> +	MAKE_STATE_PARAM(pausing),
> +	MAKE_STATE_PARAM(pausing_wait_guc),
> +	MAKE_STATE_PARAM(pausing_guc_done),
> +	MAKE_STATE_PARAM(pause_failed),
> +	MAKE_STATE_PARAM(pause_rejected),
> +	MAKE_STATE_PARAM(paused),
> +	MAKE_STATE_PARAM(resuming),
> +	MAKE_STATE_PARAM(resume_failed),
> +	MAKE_STATE_PARAM(resume_rejected),
> +	MAKE_STATE_PARAM(resumed),
> +	MAKE_STATE_PARAM(mismatch),
> +	MAKE_STATE_PARAM(flr_failed),
> +};
> +
> +static struct state_param stop_must_cancel_from[] = {
> +	MAKE_STATE_PARAM(flr_starting),
> +	MAKE_STATE_PARAM(flr_starting_paused),
> +	MAKE_STATE_PARAM(flr_waiting),
> +	MAKE_STATE_PARAM(flr_guc_done),
> +	MAKE_STATE_PARAM(flr_resetting),
> +	MAKE_STATE_PARAM(flr_finishing),
> +};
> +
> +static struct state_param stop_must_fail_from[] = {
> +	MAKE_STATE_PARAM(stopping),
> +	MAKE_STATE_PARAM(stopping_paused),
> +	MAKE_STATE_PARAM(stopped),
> +	MAKE_STATE_PARAM(flr_starting_stopped),
> +};
> +
> +static struct state_param pause_must_pass_from[] = {
> +	MAKE_STATE_PARAM(ready),
> +	MAKE_STATE_PARAM(pause_failed),
> +	MAKE_STATE_PARAM(pause_rejected),
> +	MAKE_STATE_PARAM(resumed),
> +	MAKE_STATE_PARAM(mismatch),
> +	MAKE_STATE_PARAM(stop_failed),
> +	MAKE_STATE_PARAM(stop_rejected),
> +	MAKE_STATE_PARAM(flr_failed),
> +};
> +
> +static struct state_param pause_must_cancel_from[] = {
> +	MAKE_STATE_PARAM(flr_starting),
> +	MAKE_STATE_PARAM(flr_waiting),
> +	MAKE_STATE_PARAM(flr_guc_done),
> +	MAKE_STATE_PARAM(flr_resetting),
> +	MAKE_STATE_PARAM(flr_finishing),
> +	MAKE_STATE_PARAM(stopping),
> +};
> +
> +static struct state_param pause_must_fail_from[] = {
> +	MAKE_STATE_PARAM(pausing),
> +	MAKE_STATE_PARAM(pausing_wait_guc),
> +	MAKE_STATE_PARAM(pausing_guc_done),
> +	MAKE_STATE_PARAM(paused),
> +	MAKE_STATE_PARAM(resuming),
> +	MAKE_STATE_PARAM(resume_failed),
> +	MAKE_STATE_PARAM(resume_rejected),
> +	MAKE_STATE_PARAM(stopped),
> +};
> +
> +static struct state_param resume_must_pass_from[] = {
> +	MAKE_STATE_PARAM(paused),
> +	MAKE_STATE_PARAM(resume_failed),
> +	MAKE_STATE_PARAM(resume_rejected),
> +};
> +
> +static struct state_param resume_must_cancel_from[] = {
> +	MAKE_STATE_PARAM(flr_starting_paused),
> +	MAKE_STATE_PARAM(stopping_paused),
> +};
> +
> +static struct state_param resume_must_fail_from[] = {
> +	MAKE_STATE_PARAM(ready),
> +	MAKE_STATE_PARAM(pausing),
> +	MAKE_STATE_PARAM(pausing_wait_guc),
> +	MAKE_STATE_PARAM(pausing_guc_done),
> +	MAKE_STATE_PARAM(pause_failed),
> +	MAKE_STATE_PARAM(pause_rejected),
> +	MAKE_STATE_PARAM(resuming),
> +	MAKE_STATE_PARAM(resumed),
> +	MAKE_STATE_PARAM(stopping),
> +	MAKE_STATE_PARAM(stop_failed),
> +	MAKE_STATE_PARAM(stop_rejected),
> +	MAKE_STATE_PARAM(stopped),
> +	MAKE_STATE_PARAM(flr_starting),
> +	MAKE_STATE_PARAM(flr_waiting),
> +	MAKE_STATE_PARAM(flr_guc_done),
> +	MAKE_STATE_PARAM(flr_resetting),
> +	MAKE_STATE_PARAM(flr_finishing),
> +	MAKE_STATE_PARAM(flr_failed),
> +	MAKE_STATE_PARAM(mismatch),
> +};
> +
> +KUNIT_ARRAY_PARAM(flr_must_pass_from, flr_must_pass_from, state_param_get_desc);
> +KUNIT_ARRAY_PARAM(stop_must_pass_from, stop_must_pass_from, state_param_get_desc);
> +KUNIT_ARRAY_PARAM(stop_must_fail_from, stop_must_fail_from, state_param_get_desc);
> +KUNIT_ARRAY_PARAM(stop_must_cancel_from, stop_must_cancel_from, state_param_get_desc);
> +KUNIT_ARRAY_PARAM(pause_must_pass_from, pause_must_pass_from, state_param_get_desc);
> +KUNIT_ARRAY_PARAM(pause_must_fail_from, pause_must_fail_from, state_param_get_desc);
> +KUNIT_ARRAY_PARAM(pause_must_cancel_from, pause_must_cancel_from, state_param_get_desc);
> +KUNIT_ARRAY_PARAM(resume_must_pass_from, resume_must_pass_from, state_param_get_desc);
> +KUNIT_ARRAY_PARAM(resume_must_fail_from, resume_must_fail_from, state_param_get_desc);
> +KUNIT_ARRAY_PARAM(resume_must_cancel_from, resume_must_cancel_from, state_param_get_desc);
> +
> +static int mimic_pf_handle_vf_flr_done(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_handle_vf_flr_done(gt, vfid);
> +	return 0;
> +}
> +
> +static int mimic_pf_handle_vf_pause_done(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_handle_vf_pause_done(gt, vfid);
> +	return 0;
> +}
> +
> +static void prepare_state(struct kunit *test, unsigned int vfid,
> +			  const enum xe_gt_sriov_control_bits *bits, size_t num_bits)
> +{
> +	struct xe_gt *gt = test->priv;
> +	size_t n;
> +
> +	for (n = 0; n < num_bits; n++) {
> +		enum xe_gt_sriov_control_bits bit = bits[n];
> +
> +		KUNIT_ASSERT_TRUE(test, pf_enter_vf_state(gt, vfid, bit));
> +
> +		if (bit == XE_GT_SRIOV_STATE_WIP) {
> +			pf_queue_vf(gt, vfid);
> +		} else if (bit == XE_GT_SRIOV_STATE_FLR_WAIT_GUC) {
> +			xe_kunit_helper_delayed_call(test, HZ / 100,
> +						     mimic_pf_handle_vf_flr_done, gt, vfid);
> +		} else if (bit == XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC) {
> +			xe_kunit_helper_delayed_call(test, HZ / 100,
> +						     mimic_pf_handle_vf_pause_done, gt, vfid);
> +		}
> +	}
> +}
> +
> +static void prepare_state_from_param(struct kunit *test)
> +{
> +	const struct state_param *p = test->param_value;
> +
> +	prepare_state(test, VFUT1, p->bits, p->num_bits);
> +}
> +
> +static void expect_not_pausing(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_WIP));
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE));
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC));
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_GUC_DONE));
> +}
> +
> +static void expect_not_in_pause(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	expect_not_pausing(test);
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_FAILED));
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSED));
> +}
> +
> +static void expect_not_resuming(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUME_WIP));
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUME_SEND_RESUME));
> +}
> +
> +static void expect_not_in_resume(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	expect_not_resuming(test);
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUME_FAILED));
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUMED));
> +}
> +
> +static void expect_not_stopping(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOP_WIP));
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOP_SEND_STOP));
> +}
> +
> +static void expect_not_in_stop(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	expect_not_stopping(test);
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOP_FAILED));
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOPPED));
> +}
> +
> +static void expect_not_in_flr(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_WIP));
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_SEND_START));
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_WAIT_GUC));
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_GUC_DONE));
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_SEND_FINISH));
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_FAILED));
> +}
> +
> +static void expect_not_in_wip(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
> +}
> +
> +static void expect_not_in_mismatch(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
> +}
> +
> +static void try_flr_vf(struct kunit *test, bool mimic_busy, bool late_reply)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      mimic_busy ? late_reply ? send_vf_control_cmd_busy_no_reply :
> +			      send_vf_control_cmd_busy_and_reply :
> +			      late_reply ? send_vf_control_cmd_pass_no_reply :
> +			      send_vf_control_cmd_pass_and_reply);
> +
> +	if (late_reply)
> +		xe_kunit_helper_delayed_call(test, HZ / 10,
> +					     mimic_pf_handle_vf_flr_done, gt, VFUT1);
> +
> +	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_trigger_flr(gt, VFUT1));
> +
> +	expect_not_in_flr(test);
> +	expect_not_in_pause(test);
> +	expect_not_in_resume(test);
> +	expect_not_in_stop(test);
> +	expect_not_in_mismatch(test);
> +	expect_not_in_wip(test);
> +}
> +
> +static void flr_vf_from(struct kunit *test)
> +{
> +	prepare_state_from_param(test);
> +	try_flr_vf(test, false, false);
> +}
> +
> +static void flr_vf_needs_retry_from(struct kunit *test)
> +{
> +	prepare_state_from_param(test);
> +	try_flr_vf(test, true, false);
> +}
> +
> +static void flr_vf_needs_retry_late_from(struct kunit *test)
> +{
> +	prepare_state_from_param(test);
> +	try_flr_vf(test, true, true);
> +}
> +
> +static void flr_vf_fails_on_send(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	int err;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_fail);
> +
> +	KUNIT_EXPECT_NE(test, 0, err = xe_gt_sriov_pf_control_trigger_flr(gt, VFUT1));
> +	KUNIT_EXPECT_NE(test, err, -ETIMEDOUT);
> +	KUNIT_EXPECT_NE(test, err, -ECANCELED);
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_FAILED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
> +}
> +
> +static void flr_vf_fails_on_reset(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	int err;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_and_reply);
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.vfs[VFUT1].config.sanitize,
> +			      sanitize_vf_resources_fail);
> +
> +	KUNIT_EXPECT_NE(test, 0, err = xe_gt_sriov_pf_control_trigger_flr(gt, VFUT1));
> +	KUNIT_EXPECT_NE(test, err, -ETIMEDOUT);
> +	KUNIT_EXPECT_NE(test, err, -ECANCELED);
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_FAILED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
> +}
> +
> +static void flr_vf_rejected_by_guc(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	int err;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_reject);
> +
> +	KUNIT_EXPECT_NE(test, 0, err = xe_gt_sriov_pf_control_trigger_flr(gt, VFUT1));
> +	KUNIT_EXPECT_NE(test, err, -ETIMEDOUT);
> +	KUNIT_EXPECT_NE(test, err, -ECANCELED);
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_FAILED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
> +}
> +
> +static void flr_vf_unconfirmed_by_guc(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	int err;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_no_reply);
> +
> +	KUNIT_EXPECT_NE(test, 0, err = xe_gt_sriov_pf_control_trigger_flr(gt, VFUT1));
> +	KUNIT_EXPECT_EQ(test, err, -ETIMEDOUT);
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_FAILED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
> +}
> +
> +static void flr_vf_confirmed_early_continue_by_guc(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	prepare_state(test, VFUT1, flr_starting, ARRAY_SIZE(flr_starting));
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_no_reply);
> +
> +	pf_handle_vf_flr_done(gt, VFUT1);
> +
> +	/*
> +	 * make sure SEND_START completes;
> +	 * successful reply from cmd_pass_no_reply should exit mismatch state
> +	 */
> +	flush_work(&gt->sriov.pf.control.worker);
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_FAILED));
> +}
> +
> +static void flr_vf_confirmed_early_reject_by_guc(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	prepare_state(test, VFUT1, flr_starting, ARRAY_SIZE(flr_starting));
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_reject);
> +
> +	pf_handle_vf_flr_done(gt, VFUT1);
> +
> +	/*
> +	 * make sure SEND_START completes;
> +	 * error from send_vf_control_cmd_reject should keep mismatch state
> +	 */
> +	flush_work(&gt->sriov.pf.control.worker);
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_FAILED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
> +}
> +
> +static void flr_vf_confirmed_twice_by_guc(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	prepare_state(test, VFUT1, flr_guc_done, ARRAY_SIZE(flr_guc_done));
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_no_reply);
> +
> +	pf_handle_vf_flr_done(gt, VFUT1);
> +
> +	/* this is fully recoverable */
> +	KUNIT_EXPECT_EQ(test, 0, pf_wait_vf_wip_done(gt, VFUT1, HZ));
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_FAILED));
> +}
> +
> +static void flr_vf_confirmed_too_late_by_guc(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	prepare_state(test, VFUT1, flr_failed, ARRAY_SIZE(flr_failed));
> +
> +	pf_handle_vf_flr_done(gt, VFUT1);
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_FAILED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
> +}
> +
> +static void flr_vf_unsolicited_confirmation_from_guc(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_FAILED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
> +
> +	pf_handle_vf_flr_done(gt, VFUT1);
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_FAILED));
> +}
> +
> +static void flr_vf_wrong_confirmation_from_guc(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	prepare_state(test, VFUT1, flr_waiting, ARRAY_SIZE(flr_waiting));
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_and_reply);
> +
> +	pf_handle_vf_pause_done(gt, VFUT1);
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
> +}
> +
> +static void flr_vf_canceled_by_restart(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_busy_wait);
> +
> +	xe_kunit_helper_delayed_call(test, HZ / 10, xe_gt_sriov_pf_control_restart, gt);
> +
> +	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_trigger_flr(gt, VFUT1));
> +	expect_not_in_flr(test);
> +}
> +
> +static void try_stop_vf(struct kunit *test, bool mimic_busy)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      mimic_busy ? send_vf_control_cmd_busy_and_reply :
> +			      send_vf_control_cmd_pass_and_reply);
> +
> +	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_stop_vf(gt, VFUT1));
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOPPED));
> +	expect_not_stopping(test);
> +	expect_not_in_pause(test);
> +	expect_not_in_resume(test);
> +	expect_not_in_mismatch(test);
> +}
> +
> +static void stop_vf_from(struct kunit *test)
> +{
> +	prepare_state_from_param(test);
> +	try_stop_vf(test, false);
> +}
> +
> +static void stop_vf_needs_retry_from(struct kunit *test)
> +{
> +	prepare_state_from_param(test);
> +	try_stop_vf(test, true);
> +}
> +
> +static void stop_vf_refused_from(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	int err;
> +
> +	prepare_state_from_param(test);
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_and_reply);
> +
> +	KUNIT_EXPECT_NE(test, 0, err = xe_gt_sriov_pf_control_stop_vf(gt, VFUT1));
> +	KUNIT_EXPECT_NE(test, err, -ECANCELED);
> +
> +	KUNIT_EXPECT_TRUE(test, err == -EALREADY ||
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOP_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOP_FAILED));
> +}
> +
> +static void stop_vf_fails_on_send(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	int err;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_fail);
> +
> +	KUNIT_EXPECT_NE(test, 0, err = xe_gt_sriov_pf_control_stop_vf(gt, VFUT1));
> +	KUNIT_EXPECT_NE(test, err, -ETIMEDOUT);
> +	KUNIT_EXPECT_NE(test, err, -ECANCELED);
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOP_FAILED));
> +	expect_not_stopping(test);
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOPPED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
> +}
> +
> +static void stop_vf_rejected_by_guc(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	int err;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_reject);
> +
> +	KUNIT_EXPECT_NE(test, 0, err = xe_gt_sriov_pf_control_stop_vf(gt, VFUT1));
> +	KUNIT_EXPECT_NE(test, err, -ETIMEDOUT);
> +	KUNIT_EXPECT_NE(test, err, -ECANCELED);
> +
> +	expect_not_stopping(test);
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOP_FAILED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOPPED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
> +}
> +
> +static void stop_vf_canceled_from(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	prepare_state_from_param(test);
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_and_reply);
> +
> +	KUNIT_EXPECT_EQ(test, -ECANCELED, xe_gt_sriov_pf_control_stop_vf(gt, VFUT1));
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOP_FAILED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOPPED));
> +}
> +
> +static void stop_vf_canceled_by_restart(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_busy_except_flr);
> +
> +	xe_kunit_helper_delayed_call(test, HZ / 10, xe_gt_sriov_pf_control_restart, gt);
> +
> +	KUNIT_EXPECT_EQ(test, -ECANCELED, xe_gt_sriov_pf_control_stop_vf(gt, VFUT1));
> +	expect_not_in_stop(test);
> +}
> +
> +static void stop_vf_canceled_by_flr(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_busy_except_flr);
> +
> +	xe_kunit_helper_delayed_call(test, HZ / 10,
> +				     xe_gt_sriov_pf_control_trigger_flr, gt, VFUT1);
> +
> +	KUNIT_EXPECT_EQ(test, -ECANCELED, xe_gt_sriov_pf_control_stop_vf(gt, VFUT1));
> +	expect_not_in_stop(test);
> +}
> +
> +static void try_pause_vf(struct kunit *test, bool mimic_busy)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      mimic_busy ? send_vf_control_cmd_busy_and_reply :
> +			      send_vf_control_cmd_pass_and_reply);
> +
> +	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_pause_vf(gt, VFUT1));
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSED));
> +	expect_not_pausing(test);
> +	expect_not_in_mismatch(test);
> +}
> +
> +static void pause_vf_from(struct kunit *test)
> +{
> +	prepare_state_from_param(test);
> +	try_pause_vf(test, false);
> +}
> +
> +static void pause_vf_needs_retry_from(struct kunit *test)
> +{
> +	prepare_state_from_param(test);
> +	try_pause_vf(test, true);
> +}
> +
> +static void pause_vf_canceled_from(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	prepare_state_from_param(test);
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_and_reply);
> +
> +	KUNIT_EXPECT_EQ(test, -ECANCELED, xe_gt_sriov_pf_control_pause_vf(gt, VFUT1));
> +	expect_not_in_pause(test);
> +}
> +
> +static void pause_vf_refused_from(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	int err;
> +
> +	prepare_state_from_param(test);
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_and_reply);
> +
> +	KUNIT_EXPECT_NE(test, 0, err = xe_gt_sriov_pf_control_pause_vf(gt, VFUT1));
> +	KUNIT_EXPECT_NE(test, err, -ECANCELED);
> +
> +	KUNIT_EXPECT_TRUE(test, err == -EALREADY ||
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_FAILED));
> +}
> +
> +static void pause_vf_rejected_by_guc(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_reject);
> +
> +	KUNIT_EXPECT_NE(test, 0, xe_gt_sriov_pf_control_pause_vf(gt, VFUT1));
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_FAILED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
> +}
> +
> +static void pause_vf_fails_on_send(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_fail);
> +
> +	KUNIT_EXPECT_NE(test, 0, xe_gt_sriov_pf_control_pause_vf(gt, VFUT1));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_FAILED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
> +}
> +
> +static void pause_vf_unconfirmed_by_guc(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	int err;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_no_reply);
> +
> +	KUNIT_EXPECT_NE(test, 0, err = xe_gt_sriov_pf_control_pause_vf(gt, VFUT1));
> +	KUNIT_EXPECT_EQ(test, err, -ETIMEDOUT);
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_FAILED));
> +}
> +
> +static void pause_vf_canceled_by_restart(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_no_reply);
> +
> +	xe_kunit_helper_delayed_call(test, HZ / 10, xe_gt_sriov_pf_control_restart, gt);
> +
> +	KUNIT_EXPECT_EQ(test, -ECANCELED, xe_gt_sriov_pf_control_pause_vf(gt, VFUT1));
> +	expect_not_in_pause(test);
> +}
> +
> +static void pause_vf_canceled_by_flr(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_but_reply_flr_only);
> +
> +	xe_kunit_helper_delayed_call(test, HZ / 10,
> +				     xe_gt_sriov_pf_control_trigger_flr, gt, VFUT1);
> +
> +	KUNIT_EXPECT_EQ(test, -ECANCELED, xe_gt_sriov_pf_control_pause_vf(gt, VFUT1));
> +	expect_not_in_pause(test);
> +}
> +
> +static void pause_vf_canceled_by_stop(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_no_reply);
> +
> +	xe_kunit_helper_delayed_call(test, HZ / 10,
> +				     xe_gt_sriov_pf_control_stop_vf, gt, VFUT1);
> +
> +	KUNIT_EXPECT_EQ(test, -ECANCELED, xe_gt_sriov_pf_control_pause_vf(gt, VFUT1));
> +	expect_not_in_pause(test);
> +}
> +
> +static void try_resume_vf(struct kunit *test, bool mimic_busy)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      mimic_busy ? send_vf_control_cmd_busy_and_reply :
> +			      send_vf_control_cmd_pass_and_reply);
> +
> +	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_resume_vf(gt, VFUT1));
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUMED));
> +	expect_not_resuming(test);
> +	expect_not_in_pause(test);
> +	expect_not_in_mismatch(test);
> +	expect_not_in_wip(test);
> +}
> +
> +static void resume_vf_from(struct kunit *test)
> +{
> +	prepare_state_from_param(test);
> +	try_resume_vf(test, false);
> +}
> +
> +static void resume_vf_needs_retry_from(struct kunit *test)
> +{
> +	prepare_state_from_param(test);
> +	try_resume_vf(test, true);
> +}
> +
> +static void resume_vf_fails_on_send(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	prepare_state(test, VFUT1, paused, ARRAY_SIZE(paused));
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_fail);
> +
> +	KUNIT_EXPECT_NE(test, 0, xe_gt_sriov_pf_control_resume_vf(gt, VFUT1));
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUME_FAILED));
> +
> +	expect_not_resuming(test);
> +	expect_not_in_mismatch(test);
> +	expect_not_in_wip(test);
> +}
> +
> +static void resume_vf_rejected_by_guc(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	prepare_state(test, VFUT1, paused, ARRAY_SIZE(paused));
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_reject);
> +
> +	KUNIT_EXPECT_NE(test, 0, xe_gt_sriov_pf_control_resume_vf(gt, VFUT1));
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUME_FAILED));
> +
> +	expect_not_resuming(test);
> +	expect_not_in_wip(test);
> +}
> +
> +static void resume_vf_canceled_from(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	prepare_state_from_param(test);
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_and_reply);
> +
> +	KUNIT_EXPECT_EQ(test, -ECANCELED, xe_gt_sriov_pf_control_resume_vf(gt, VFUT1));
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUMED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUME_FAILED));
> +	expect_not_resuming(test);
> +}
> +
> +static void resume_vf_refused_from(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	int err;
> +
> +	prepare_state_from_param(test);
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_and_reply);
> +
> +	KUNIT_EXPECT_NE(test, 0, err = xe_gt_sriov_pf_control_resume_vf(gt, VFUT1));
> +	KUNIT_EXPECT_NE(test, err, -EIO);
> +
> +	KUNIT_EXPECT_TRUE(test, err == -EALREADY ||
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUME_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUME_FAILED));
> +}
> +
> +static void resume_vf_canceled_by_restart(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	prepare_state(test, VFUT1, paused, ARRAY_SIZE(paused));
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_busy_except_flr);
> +
> +	xe_kunit_helper_delayed_call(test, HZ / 10, xe_gt_sriov_pf_control_restart, gt);
> +
> +	KUNIT_EXPECT_EQ(test, -ECANCELED, xe_gt_sriov_pf_control_resume_vf(gt, VFUT1));
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUMED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUME_WIP));
> +}
> +
> +static void resume_vf_canceled_by_flr(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	prepare_state(test, VFUT1, paused, ARRAY_SIZE(paused));
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_busy_except_flr);
> +
> +	xe_kunit_helper_delayed_call(test, HZ / 10,
> +				     xe_gt_sriov_pf_control_trigger_flr, gt, VFUT1);
> +
> +	KUNIT_EXPECT_EQ(test, -ECANCELED, xe_gt_sriov_pf_control_resume_vf(gt, VFUT1));
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUMED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUME_WIP));
> +}
> +
> +static void resume_vf_canceled_by_stop(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	prepare_state(test, VFUT1, paused, ARRAY_SIZE(paused));
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_busy_except_stop);
> +
> +	xe_kunit_helper_delayed_call(test, HZ / 10,
> +				     xe_gt_sriov_pf_control_stop_vf, gt, VFUT1);
> +
> +	KUNIT_EXPECT_EQ(test, -ECANCELED, xe_gt_sriov_pf_control_resume_vf(gt, VFUT1));
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUMED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUME_WIP));
> +}
> +
> +static void basic_pause_and_resume_vf(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_and_reply);
> +
> +	KUNIT_ASSERT_EQ(test, 0, xe_gt_sriov_pf_control_pause_vf(gt, VFUT1));
> +	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_resume_vf(gt, VFUT1));
> +}
> +
> +static void basic_pause_and_stop_vf(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_and_reply);
> +
> +	KUNIT_ASSERT_EQ(test, 0, xe_gt_sriov_pf_control_pause_vf(gt, VFUT1));
> +	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_stop_vf(gt, VFUT1));
> +}
> +
> +static void basic_stop_and_flr_vf(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_and_reply);
> +
> +	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_stop_vf(gt, VFUT1));
> +	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_trigger_flr(gt, VFUT1));
> +}
> +
> +static void basic_flr_and_flr_vf(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_and_reply);
> +
> +	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_trigger_flr(gt, VFUT1));
> +	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_trigger_flr(gt, VFUT1));
> +}
> +
> +static void basic_flr_vfs(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_and_reply);
> +
> +	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_trigger_flr(gt, VFUT1));
> +	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_trigger_flr(gt, VFUT2));
> +}
> +
> +static struct kunit_case pf_control_test_cases[] = {
> +	KUNIT_CASE(basic_pause_and_resume_vf),
> +	KUNIT_CASE(basic_pause_and_stop_vf),
> +	KUNIT_CASE(basic_stop_and_flr_vf),
> +	KUNIT_CASE(basic_flr_and_flr_vf),
> +	KUNIT_CASE(basic_flr_vfs),
> +
> +	KUNIT_CASE_PARAM(flr_vf_from, flr_must_pass_from_gen_params),
> +	KUNIT_CASE_PARAM(flr_vf_needs_retry_from, flr_must_pass_from_gen_params),
> +	KUNIT_CASE_PARAM(flr_vf_needs_retry_late_from, flr_must_pass_from_gen_params),
> +	KUNIT_CASE(flr_vf_fails_on_send),
> +	KUNIT_CASE(flr_vf_fails_on_reset),
> +	KUNIT_CASE(flr_vf_rejected_by_guc),
> +	KUNIT_CASE_SLOW(flr_vf_unconfirmed_by_guc),
> +	KUNIT_CASE(flr_vf_confirmed_early_continue_by_guc),
> +	KUNIT_CASE(flr_vf_confirmed_early_reject_by_guc),
> +	KUNIT_CASE(flr_vf_confirmed_twice_by_guc),
> +	KUNIT_CASE(flr_vf_confirmed_too_late_by_guc),
> +	KUNIT_CASE(flr_vf_wrong_confirmation_from_guc),
> +	KUNIT_CASE(flr_vf_unsolicited_confirmation_from_guc),
> +	KUNIT_CASE(flr_vf_canceled_by_restart),
> +
> +	KUNIT_CASE_PARAM(stop_vf_from, stop_must_pass_from_gen_params),
> +	KUNIT_CASE_PARAM(stop_vf_needs_retry_from, stop_must_pass_from_gen_params),
> +	KUNIT_CASE_PARAM(stop_vf_refused_from, stop_must_fail_from_gen_params),
> +	KUNIT_CASE_PARAM(stop_vf_canceled_from, stop_must_cancel_from_gen_params),
> +	KUNIT_CASE(stop_vf_fails_on_send),
> +	KUNIT_CASE(stop_vf_rejected_by_guc),
> +	KUNIT_CASE(stop_vf_canceled_by_flr),
> +	KUNIT_CASE(stop_vf_canceled_by_restart),
> +
> +	KUNIT_CASE_PARAM(pause_vf_from, pause_must_pass_from_gen_params),
> +	KUNIT_CASE_PARAM(pause_vf_needs_retry_from, pause_must_pass_from_gen_params),
> +	KUNIT_CASE_PARAM(pause_vf_refused_from, pause_must_fail_from_gen_params),
> +	KUNIT_CASE_PARAM(pause_vf_canceled_from, pause_must_cancel_from_gen_params),
> +	KUNIT_CASE(pause_vf_fails_on_send),
> +	KUNIT_CASE(pause_vf_rejected_by_guc),
> +	KUNIT_CASE_SLOW(pause_vf_unconfirmed_by_guc),
> +	KUNIT_CASE(pause_vf_canceled_by_flr),
> +	KUNIT_CASE(pause_vf_canceled_by_stop),
> +	KUNIT_CASE(pause_vf_canceled_by_restart),
> +
> +	KUNIT_CASE_PARAM(resume_vf_from, resume_must_pass_from_gen_params),
> +	KUNIT_CASE_PARAM(resume_vf_needs_retry_from, resume_must_pass_from_gen_params),
> +	KUNIT_CASE_PARAM(resume_vf_refused_from, resume_must_fail_from_gen_params),
> +	KUNIT_CASE_PARAM(resume_vf_canceled_from, resume_must_cancel_from_gen_params),
> +	KUNIT_CASE(resume_vf_fails_on_send),
> +	KUNIT_CASE(resume_vf_rejected_by_guc),
> +	KUNIT_CASE(resume_vf_canceled_by_flr),
> +	KUNIT_CASE(resume_vf_canceled_by_stop),
> +	KUNIT_CASE(resume_vf_canceled_by_restart),
> +
> +	{}
> +};
> +
> +static struct kunit_suite pf_control_suite = {
> +	.name = "pf_control",
> +	.test_cases = pf_control_test_cases,
> +	.init = pf_control_test_init,
> +};
> +
> +kunit_test_suite(pf_control_suite);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index e91c71d768ff..4863d79f72e0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <drm/drm_managed.h>
> +#include <kunit/static_stub.h>
>  
>  #include "abi/guc_actions_sriov_abi.h"
>  
> @@ -196,6 +197,8 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
>  
>  static unsigned long pf_get_default_timeout(enum xe_gt_sriov_control_bits bit)
>  {
> +	KUNIT_STATIC_STUB_REDIRECT(pf_get_default_timeout, bit);
> +
>  	switch (bit) {
>  	case XE_GT_SRIOV_STATE_FLR_WAIT_GUC:
>  	case XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC:
> @@ -1458,3 +1461,7 @@ void xe_gt_sriov_pf_control_restart(struct xe_gt *gt)
>  	for (n = 1; n <= totalvfs; n++)
>  		pf_enter_vf_ready(gt, n);
>  }
> +
> +#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
> +#include "tests/xe_gt_sriov_pf_control_kunit.c"
> +#endif

I sent a review to the wrong patch revision, I will re-paste and send
again:
The tests look fine. I tried to verify the states according to the available
drawings of the state machine and I did not find any incorrectness.
It seems to me that the tests could be expanded to include an additional
basic test: basic_pause_and_flr_vf
But still:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
