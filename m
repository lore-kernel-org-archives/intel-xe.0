Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E850FF8855
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 13:59:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF40810EDB9;
	Wed,  6 May 2026 13:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IOt9bt1k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88DBC10EDB9
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 13:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778075979; x=1809611979;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H6irTe0rFUHH++DCm2OGXgzVzSmF/n9PYMweaR8P19w=;
 b=IOt9bt1kBIWgxRKy31CvzQ746SH9NR2zOJlU5HAqWsRXf9qhVebMzlKZ
 br8nFcExUATU0O83X84ehr3oXilHX7r2oxL6I/IsbacxizAw9nJdcIFYN
 2/TVKxWy6QSlcm+B1iueaLtGYpGNfPbPIJT4HTIcvA03HTIpqI3W2bc3J
 vGBsNVmW/Bdz1G/RcTsl3a2JoG06YDS0ZTpuU5jnBG2QcKn9JSZXg+6Ob
 YacHQJOTsILKvfPKw2LwH3h/IZUhOa98ijxfKkyq3eWoU3x589OCPyaVQ
 5JPUoyFABSD7hj98KwXT/XCwH8tAGHgBBipgaDvcL/+YzgX02RY3QC+NM Q==;
X-CSE-ConnectionGUID: ZzAS7vbZTeS4rTlGSopetA==
X-CSE-MsgGUID: eIVWJ0D3REeelIw2VegFfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78154152"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="78154152"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 06:59:38 -0700
X-CSE-ConnectionGUID: A/UBjpMCSgWbWVTctekxyg==
X-CSE-MsgGUID: JV267/2DSaqWCBOQWVb8qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="235139694"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 06:59:38 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 06:59:37 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 06:59:37 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 06:59:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eo7AE3QGnfPyRupld3v1aYsXeNmm+u+ANbA6+ughc49ADZaa18kvPPkb9mv39KPkfXCmnCfQfOLSqwruU3yXtZFAXa0X+NsUDXs4a3ynZMDbSqs1VuGd+ohcMrKnn14tIE4XKdMKpOCb3lkhKXQDbuGIfyMP/7ak3A1w/jOebb2M1yg0jt7Elghl40UDo2XbDavvhWCdi+VWMXR01us4iT+3YT4Ha+pomRXR75/AsmlcEvo9FcCSH1IRr1nUOCI8v4ZDU87HkyB9qwnzLrocQRDCD0X6rLAJlJxnZkO38yp9Kx4QoAn4Tdyl1axukAd3DmxA0jx6TFlUhvar/2HgIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NV3/MOcJSY+o9TQzX0GuZ8GjtTe4TN0cKyDRJstwOF0=;
 b=FhvtXeg53hcYJp4O/KZM0TebkhehlzZSdXg3G+qqUp2GehB6NDgGDJJhKkHL1Nbj2JtMHYwrwhrF5vovCB+vhwFn16/UacjYvTikreR/Jt3PxOBf25lqmCADPuGgVQeoQfx10BO51H3d6tv8NHM6Di7SbOk3tSa/iQcxwr6X12WG8Ik1/iRKDnA6DhESGUDMRZyf+PSBelkD2h0lWNJJIi9QlOsreSn7uKVjK8Q50k6TvFk5DuJ7cFOQ0DQmIlu1gUpKJ+6s9olZO2LFQQkrRCOoyTxdQDyIC0ntZ5NI4G/noebFx1ylA2hbAhuH/sFdUYCU8Lq/sRcGkvXqnDdDog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH3PPF018EB8BEC.namprd11.prod.outlook.com (2603:10b6:518:1::d04) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 13:59:32 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 13:59:32 +0000
Message-ID: <8d9e7fd1-c305-4cfb-8ca2-f8caa16610d8@intel.com>
Date: Wed, 6 May 2026 19:29:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/13] drm/xe/xe_pci_error: Implement PCI error
 recovery callbacks
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Matt
 Roper" <matthew.d.roper@intel.com>
References: <20260417085812.4013309-15-riana.tauro@intel.com>
 <20260417085812.4013309-17-riana.tauro@intel.com>
 <ae8Dxyrmzmic0jaR@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <ae8Dxyrmzmic0jaR@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXP287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::26) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH3PPF018EB8BEC:EE_
X-MS-Office365-Filtering-Correlation-Id: 2de6ecb1-7f9f-44c7-f28d-08deab77b29d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: bHFSpo5JDZ0f+f0HEDyyjlNbvTxSqP2od73qNJO91dvhI54xGJSOBRg1LLtslwPJ9Pzwvdj9C+bUUSqMtYd1+hZRkbgweoI9uFQtv72OLaYbDYeS6TW+koob88EHwzS7d5o9ex1/bESVEVIhkjsmmokgKV3i2KUwGhxIyg29yiWPwg2TM2EhZvMxdpmWLiokQWR5wtEcreCnxPyNn+vVuRaQ6OijgW9MIDRWRbaPD/j/uWCAD68WSdbDKReAIa+kT429xUcbiQj3RsUXZKaZfLbD0m/afMdMAWJ3DGuYaTAPX+yGdxS1OI27K96tX+4iD7jn7NDFDWHZM71KVKJWUehh8mJUk4BCtr+EHCX5Q70AHSX88UD4dVcemRkOYR2VaQOj+6AsPbAVHwE/SBsVZLU8zAGeBvL5s1iE/Wfi9qtP/S80YuETlX1CrGucOeoT3GFisdwPGbRPh89eu1NzpHj5FIbSSe1leTeGYT+Ah8RWQQssxY+3AMOozSFfEer4SbUX0rhKqI0C5na7I5OidfNZiVaUk1PPr0SFUbPbgfCXubgjnTvfDhn4qgeu4VOupEUqCzvQxX5m+CGra0DcjIHIp8d98+mMd14XaFNUHnhO0GcU7YN2je9HUPFntbetcRt1SKivZaauJmiHrmwJLYbfgKvrjs2DHbcr5z7ZIPIv8uUfonkZ4mvPFVfFlNg6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0Z4eExYRnA3M2pmWVZpcDlZdUp2R3ZiTTBud0lsOE8wQlJFaTJ2Z0lFczg3?=
 =?utf-8?B?M0pGN0RFc3dTdGY5bEdNd0t6cjAvd094bjlhU28xQlBYOHdhSHVhSXlMbzFt?=
 =?utf-8?B?YisyN2tScWgvR0ZIenRKd1YxakpYblk0MFM4MzlqcVN3QmRkQkh2VVp6dndS?=
 =?utf-8?B?cGptVVNDMEhKRkxFWmxuK053dWRLL0FXbTB4MUhZQ004QXZOanNXVDFMNU1k?=
 =?utf-8?B?UVR1RDhyYTVud0pUalhaZm1mR2E4M0prV1orMEozZXF3dHdHM2FtcGZsRDBy?=
 =?utf-8?B?dFFZV1RpRU54U3AzcktVeUdONSt0Yi9Cc20zbjcwRHFVT3J5N0FvUnVlVm5u?=
 =?utf-8?B?amJsMnFhYnR5VVRuNXNZWHdCM0VBdEhMR1U0ZEVqNEU4YUFKcENIenNpMTBs?=
 =?utf-8?B?UmRkM1NZUVRQN0tVak1ubkFUMUM5bzFlR2srK29qZnN2c0ppWmVlV0hSMlM2?=
 =?utf-8?B?Wkk1ZXJhWCtRSmQ3Zm9TT0dudHIreHgydE9LcVpRUnNPRzgrRS9XOHNlTm56?=
 =?utf-8?B?TVFGbi92ZEpITXBLL2hyUGRrd1BEa0xwRnN6aXhoVzVYQWhZOUhzcTlycWw2?=
 =?utf-8?B?TEJ0My90dFZCdWJMRUxnUjUrZTgxbXpNaEJJUWcwR0FJTFU1Vlk2MmJGVE8z?=
 =?utf-8?B?cEFNdnB0dWZ4bDVFeURPN2pnWlJPNmhWd29sWFhBaGhtcjVBQUFHWGI5MHA3?=
 =?utf-8?B?S2FqRnNEMGhMamlRU2VhdG1aTVh3ZlZOUjJZVFZUV0cvOEhHZVluR1QwUk9w?=
 =?utf-8?B?YnJJcEtyU2RTeTFNQVl5UEVVSVNRVlNBVWQxYVhlRk9LeklRTXhkRU9mRWZP?=
 =?utf-8?B?S2NhekdkQlpYaXN0Z0Zja0xRajlaZVVraDhxNXJvYXNCbnpjOVB0Lzd6Vjlp?=
 =?utf-8?B?OXl1N1NXQ21qOXF6dUh4RmFSNTJldXJRZ2p0aUg3c01GVGZzaHkwaFUwRUN3?=
 =?utf-8?B?Uy9VaEljdlhNMFh0U1RmTll2Z25uWVBtYWRLQ1F3OVdzbmh0eEF4dUJ2TCs5?=
 =?utf-8?B?RTdNbVJNY2NxU1R0KytlRVNIVHBRNDJGOFRaQXpLeHRub2ZscVM1bzZFcldw?=
 =?utf-8?B?WE5QcHBZbm40TWlaNlZDYXB5RVl4dW9YYzd6dXRHVitqNHc4azlISmNIQ1ND?=
 =?utf-8?B?cXJkdmgrck96ZUlvVWgrME4xSGptaVdjVmFVQjM4U1FYTUZFUEZ1N0h5QUxa?=
 =?utf-8?B?b0kyaG9sR3E5L2hwUWREV0RQVXR4N01HWnJ4YlVRMHU3bThFdUdkdGVlamJm?=
 =?utf-8?B?S1BUQnBpaVNsVWFEckVsbjJsdjZ3MWdEbEszRHN5UE11SUZvVzk1dk5xR1J0?=
 =?utf-8?B?ZGQ0d0JKMmF2VlgvZlhWUkUyZWVPYWlZQ3dzc0tHcHBQbk1qQ0xYcEhPZW1V?=
 =?utf-8?B?eEhDaHR3emk5cnFxMW5LbnkyWlZkOGUzVUhqNWxsOTNBTWY0c0NCbGtnTjN0?=
 =?utf-8?B?NmxZUHZNL1Q5a0dMNEpMd2IrTnVON29wVmJwVDVIL01LYkFWSm5QTWpIcTVz?=
 =?utf-8?B?ekZHc0Y0eEZPNFFNcTA1VU91a043QVIweS9NMXFSeUhSWFRuU2hOMFBLdjc4?=
 =?utf-8?B?MkNVL0FESG1KVklPZk16RTZlS0FlcklxR0VzZFYrbTNkVkJ5YkF5andYaXpj?=
 =?utf-8?B?QjdvMmJSOGRScXlVT1p2Q2xnemFsSjVZNWxWbEE5djhXbFBjclhJeU1VQVU0?=
 =?utf-8?B?UUtNd1Y3ZG53MVNKb2JMUEp1aUFjMHFMQUhZRWtGVk1DZ2xiVjhtZVVkSHB2?=
 =?utf-8?B?QWkxTE5tWWNDSWgvZTBhbWEyT05VNWZrV3FYdHRHZlVqWXZmVGdhRWJ3R1ZI?=
 =?utf-8?B?YnpFMithQnNUa0l6MUxxd0NsSWgvNmFrdUtFUExVSXN5T05oSDhTc0Y2N09Y?=
 =?utf-8?B?M0VlSmR4SVVDL0hDcWJoZ0s4a2hwbUxjL2I1QzNnOVFSTVByVWhMNGxLU2xH?=
 =?utf-8?B?VTJMTGx5aTlPSzYreWs2WC9NdDdlWkNWVS9GbDV0UnlHTmVnZnIyZGFTdWwz?=
 =?utf-8?B?UFFINDhvb2lPV2JIelVIcFpEUFlvYlJrNFI1dU9nSVRsS1lzY1lRRjRSZytH?=
 =?utf-8?B?YS8rMy85c1dqak1RdFpBaFIrcmhIK0dJQ3FNV1UxazlGK3FycE9NUlZkS1d2?=
 =?utf-8?B?aEdRMTJqck1xN20vT0pTT1RRcDFKamJaZmtnM0UvWEwwbmh1d2FRcDVCeE1p?=
 =?utf-8?B?TXVWSUh5SGpzdTE4RHc5WUZ6bGQzSG9YQW1EeU5KVmtzRmNDNWVTeGcrSWEx?=
 =?utf-8?B?Und3SDZnd1N2d3NnN0tacmlBOXZDQ0M5U3lYMXdDUDBwTWgvQWFpUXRaY2Fa?=
 =?utf-8?B?Nml0aTJXOVpHOXErc0RiSEoxam5UR2RWcG5yUC83OEhkNWlnQkdJdz09?=
X-Exchange-RoutingPolicyChecked: fYZibJs17+ljnqRIaD5XqBJYt/dxq/2OSBRGBL9T3XIMaGQzO54XDqBsCAioLwjXgq5vtFKuOqqcW0HI+20pLNAEhGrjc/ovxK++/IKmAG+ShOawqIxSclnC/eLVUmiGv0K2Y0V0tdCQXQ0hXPV+M1aXFvKCxE9dyihZvTGVJ1NKlcbEYNG1EQ0sOs/aVx2HqzxxgDgKkD2yKDcXK6JcjwFVmmjCz4R8Rzyw3LVrFavCFdnVA4E9bKdiqeTidQfHuXPLOaTTmh4ER5bbKSbwmd5/FJyoJANyMqzH/XHBkYXEULF48UpzSNetPrHOsqy0MP73rPGN62bY+ieqOJteCw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de6ecb1-7f9f-44c7-f28d-08deab77b29d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 13:59:32.1341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5C8wFXovo4NnruNtrM2RRq4SFCjc8O7dpjvNfl9tSAqUtrbLbW8ZN7hmX2N7PgQdvrW23bo39Obamjwc51DzZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF018EB8BEC
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


On 4/27/2026 12:05 PM, Raag Jadav wrote:
> On Fri, Apr 17, 2026 at 02:28:14PM +0530, Riana Tauro wrote:
>> Add error_detected, mmio_enabled, slot_reset and resume recovery callbacks
>> to handle PCIe Advanced Error Reporting (AER) errors.
>>
>> For fatal errors, the device is wedged and becomes inaccessible. Return
>> PCI_ERS_RESULT_SLOT_RESET from error_detected to request a Secondary
>> Bus Reset (SBR).
>>
>> For non-fatal errors, return PCI_ERS_RESULT_CAN_RECOVER from
>> error_detected to trigger the mmio_enabled callback. In this callback, the
>> device is queried to determine the error cause and attempt recovery based
>> on the error type.
>>
>> Once the secondary bus reset(SBR) is completed the slot_reset callback
>> cleanly removes and reprobe the device to restore functionality.
>>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: re-order linux headers
>>      reword error messages
>>      do not clear in_recovery after remove
>>      return PCI_ERS_RESULT_DISCONNECT if probe fails (Michal)
>>      only wedge device do not send uevent (Raag)
>>      set recovery flag in error_detected and clear on resume
>>      add default switch case (Mallesh)
>>
>> v3: do not set in_recovery for disconnect (Mallesh)
>>      return if already wedged or in survivability mode
>>
>> v4: Add comment (Matthew)
>>      Fix tab (Mallesh)
>> ---
>>   drivers/gpu/drm/xe/Makefile          |   1 +
>>   drivers/gpu/drm/xe/xe_device.h       |  15 ++++
>>   drivers/gpu/drm/xe/xe_device_types.h |   3 +
>>   drivers/gpu/drm/xe/xe_pci.c          |   3 +
>>   drivers/gpu/drm/xe/xe_pci_error.c    | 107 +++++++++++++++++++++++++++
>>   5 files changed, 129 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index e42e582aca5c..69c233d9a488 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -101,6 +101,7 @@ xe-y += xe_bb.o \
>>   	xe_page_reclaim.o \
>>   	xe_pat.o \
>>   	xe_pci.o \
>> +	xe_pci_error.o \
>>   	xe_pci_rebar.o \
>>   	xe_pcode.o \
>>   	xe_pm.o \
>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> index 555c191f7510..6e18a51e0ade 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -43,6 +43,21 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
>>   	return container_of(ttm, struct xe_device, ttm);
>>   }
>>   
>> +static inline bool xe_device_is_in_recovery(struct xe_device *xe)
>> +{
>> +	return atomic_read(&xe->in_recovery);
>> +}
>> +
>> +static inline void xe_device_set_in_recovery(struct xe_device *xe)
>> +{
>> +	atomic_set(&xe->in_recovery, 1);
>> +}
>> +
>> +static inline void xe_device_clear_in_recovery(struct xe_device *xe)
>> +{
>> +	atomic_set(&xe->in_recovery, 0);
>> +}
> Can these be consolidated into xe_device_set_recovery(xe, val)
>
> Also, they are introduced in this patch but not yet used in xe code paths
> which are still open for such failures. So perhaps let's introduce the
> PCI callbacks at later point in the series?
Sure.
>
>>   struct xe_device *xe_device_create(struct pci_dev *pdev,
>>   				   const struct pci_device_id *ent);
>>   int xe_device_probe_early(struct xe_device *xe);
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 150c76b2acaf..c9fe86b670bd 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -494,6 +494,9 @@ struct xe_device {
>>   		bool inconsistent_reset;
>>   	} wedged;
>>   
>> +	/** @in_recovery: Indicates if device is in recovery */
>> +	atomic_t in_recovery;
>> +
>>   	/** @bo_device: Struct to control async free of BOs */
>>   	struct xe_bo_dev {
>>   		/** @bo_device.async_free: Free worker */
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 6e560ef84a97..7ac433742f82 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -1324,6 +1324,8 @@ static const struct dev_pm_ops xe_pm_ops = {
>>   };
>>   #endif
>>   
>> +extern const struct pci_error_handlers xe_pci_error_handlers;
>> +
>>   static struct pci_driver xe_pci_driver = {
>>   	.name = DRIVER_NAME,
>>   	.id_table = pciidlist,
>> @@ -1331,6 +1333,7 @@ static struct pci_driver xe_pci_driver = {
>>   	.remove = xe_pci_remove,
>>   	.shutdown = xe_pci_shutdown,
>>   	.sriov_configure = xe_pci_sriov_configure,
>> +	.err_handler = &xe_pci_error_handlers,
>>   #ifdef CONFIG_PM_SLEEP
>>   	.driver.pm = &xe_pm_ops,
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
>> new file mode 100644
>> index 000000000000..427a8e09408c
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
>> @@ -0,0 +1,107 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +#include <linux/pci.h>
>> +
>> +#include <drm/drm_drv.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_pci.h"
>> +#include "xe_survivability_mode.h"
>> +#include "xe_uc.h"
>> +
>> +static void xe_pci_error_handling(struct pci_dev *pdev)
>> +{
>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +	struct xe_gt *gt;
>> +	u8 id;
>> +
>> +	/* Return if device is wedged or in survivability mode */
>> +	if (xe_survivability_mode_is_boot_enabled(xe) || xe_device_wedged(xe))
> Curious. If the device is already wedged or in survivability, this means
> we're expecting the user to initiate the recovery. So shouldn't we try
> to leave the device as is and let user take care of the recovery instead?
> We'll likely end up with ugly races with userspace since we don't really
> DISCONNECT here.


Survivability mode we don't have system controller so yeah makes sense 
to disconnect
and let userspace take care.
For wedged, if we disconnect we can collect logs on the next load so 
logs won't be lost
unless userspace does  a power-cycle. Let me check.

>
>> +		return;
>> +
>> +	/*
>> +	 * Wedge the device to prevent userspace access but don't send the event yet.
>> +	 * Runtime PM ref is taken by PCI core for the duration of error handling.
>> +	 */
>> +	atomic_set(&xe->wedged.flag, 1);
>> +
>> +	for_each_gt(gt, xe, id)
>> +		xe_gt_declare_wedged(gt);
>> +
>> +	pci_disable_device(pdev);
>> +}
>> +
>> +static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_state_t state)
>> +{
>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +
>> +	dev_err(&pdev->dev, "Xe Pci error recovery: error detected state %d\n", state);
>> +
>> +	if (state == pci_channel_io_perm_failure)
>> +		return PCI_ERS_RESULT_DISCONNECT;
>> +
>> +	xe_device_set_in_recovery(xe);
>> +
>> +	switch (state) {
>> +	case pci_channel_io_normal:
>> +		return PCI_ERS_RESULT_CAN_RECOVER;
>> +	case pci_channel_io_frozen:
>> +		xe_pci_error_handling(pdev);
>> +		return PCI_ERS_RESULT_NEED_RESET;
>> +	default:
>> +		dev_err(&pdev->dev, "Unknown state %d\n", state);
>> +		return PCI_ERS_RESULT_NEED_RESET;
>> +	}
>> +}
>> +
>> +static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
>> +{
>> +	dev_err(&pdev->dev, "Xe Pci error recovery: MMIO enabled\n");
>> +
>> +	return PCI_ERS_RESULT_NEED_RESET;
>> +}
>> +
>> +static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
>> +{
>> +	const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
>> +
>> +	dev_err(&pdev->dev, "Xe Pci error recovery: Slot reset\n");
>> +
>> +	pci_restore_state(pdev);
>> +
>> +	if (pci_enable_device(pdev)) {
>> +		dev_err(&pdev->dev,
>> +			"Cannot re-enable PCI device after reset\n");
>> +		return PCI_ERS_RESULT_DISCONNECT;
>> +	}
>> +
>> +	/*
>> +	 * Secondary Bus Reset wipes out all device memory
>> +	 * requiring XE KMD to perform a device removal and reprobe.
>> +	 */
>> +	pdev->driver->remove(pdev);
>> +
>> +	if (!pdev->driver->probe(pdev, ent))
> Documentation/PCI/pci-error-recovery.rst +316
>
> "Drivers should not restart normal I/O processing operations
> at this point.  If all device drivers report success on this
> callback, the platform will call resume() to complete the sequence,
> and let the driver restart normal I/O processing."
>
> So I'm not sure we're really following the documentation correctly.

Like we discussed offline, adding wedging here for now with a TODO. We
can integrate the FLR series which does a minimal re-initialization once 
it's merged

Thanks
Riana

>
> Raag
>
>> +		return PCI_ERS_RESULT_RECOVERED;
>> +
>> +	return PCI_ERS_RESULT_DISCONNECT;
>> +}
>> +
>> +static void xe_pci_error_resume(struct pci_dev *pdev)
>> +{
>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +
>> +	dev_info(&pdev->dev, "Xe Pci error recovery: Recovered\n");
>> +
>> +	xe_device_clear_in_recovery(xe);
>> +}
>> +
>> +const struct pci_error_handlers xe_pci_error_handlers = {
>> +	.error_detected	= xe_pci_error_detected,
>> +	.mmio_enabled	= xe_pci_error_mmio_enabled,
>> +	.slot_reset	= xe_pci_error_slot_reset,
>> +	.resume		= xe_pci_error_resume,
>> +};
>> -- 
>> 2.47.1
>>
