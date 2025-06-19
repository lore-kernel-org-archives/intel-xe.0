Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F4EC71136
	for <intel-xe@archiver.kernel.org>; Thu, 19 Jun 2025 05:46:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3145210E1FB;
	Thu, 19 Jun 2025 05:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hp9IEVfE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2DF10E1FB
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Jun 2025 05:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750311625; x=1781847625;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NjAKS1Z7qYFJu9/F5S8QTAai2s7x0elyiweg1jSoj4I=;
 b=Hp9IEVfEPhzEer9DoUlb7c9CMzKBrOtR0tBuDJPINfKbVumnF13KP45o
 Opj/UuE44CddyvPt/3c5wWoHSrUOxqFGYq/QJP2PLTySTSYRvM5l2Jetq
 txUU1tTE9Xrvkq6BAjIzMjEXx/V/H+G4+97Z2UOtYiD6fSkM0vTQN/yDC
 j8jcgxXo8zbnsFHMqwsZW3Yb8d849zf1vKqkv+mFIV/0ygVI4t6KtF3St
 MlEUx9NRTQobEQyILLWtzENz3Jai/oV0mUyjtM+E3misvVsdO7vfG3zBU
 9hcmfMzBD4JAbThiRQg8HHBg5zsHaEwNa1LIhIwVGzPVEAb1INMLPNRO6 Q==;
X-CSE-ConnectionGUID: 2g51UhKQT16SdzkDs0TDNQ==
X-CSE-MsgGUID: 6pbf4SZaRv2oufMHp+Vokg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63982864"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="63982864"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 22:39:00 -0700
X-CSE-ConnectionGUID: 9ApPL5gjQ4CBDOMNhFp6FQ==
X-CSE-MsgGUID: SWkv6WaPTK2NXRhhk7UuWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="149990129"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 22:39:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 22:38:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 22:38:59 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.71)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 22:38:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uu0udDZmnQT8I1uUrSIGjBe2LPq4XmIWDChXJ6gWFH4YuGt7G19cs8FuLIdRU8UkmLneoc0BaRPm/I3MEDsU+QdcLRJokd0qmFfkSRHuzHDXAHQv4C9vveeWRj+m9LSZNyaQJNZwgr12M6wIG8LuJWZyrRYfnKIRvZA+4I1/Auk7MwEeVTnkhTufHjkdcqoRqwAtlM7bWp8JGgpXe2PWFB4A8tL/u3IedNGskzraUngd8uMRg3XEEQPZmVpeHyryVSq4/CtaEravN3UB18ABIbmfdU+O5yU5WoTV5RSZGCg9FF5OF7UchLglSkl1T2ItT4AeBl98Pui2hq6OFmaUWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOC/lNATjsJorKPQMfSzxQMBU23A6cWnbdye033uAJM=;
 b=MvcLsNh7Q+yfWAlyati5RhiHDBtGCXgdemLHcLe0Qo3AjwHkiUkWiJwMzuQ8uZn5QZspVo7jW/BFSLA5OhtBJif7mdn6qfjRFtIuu6kb6TUpE5ICnp2g5RlQ/M+0GYft6HTbIzCspvN9xKzN7hAW2xgl0IxRXZbryEvMJiSVG04lJ+5MZOTKrw2EMNp6JAQvJxEaM2dnbZjqf0q7RXyxNJfoXg+t8f3POAt16rHLN6TjTbjLrQTRjdK5aEix54rSGOYT7dOM+Fb3WXFMLib7PO5tuAxbHkmnyddbIMHxZhc4ShwVCqBB/6lndQY5eekjkqUgSr8uBvAIAijOk4U28g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by SN7PR11MB6826.namprd11.prod.outlook.com (2603:10b6:806:2a1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Thu, 19 Jun
 2025 05:38:29 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad%6]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 05:38:29 +0000
Message-ID: <f79aace3-f454-44c4-b566-7bf8d8aecb69@intel.com>
Date: Thu, 19 Jun 2025 11:08:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/ptl: Apply Wa_16026007364
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <karthik.poosa@intel.com>,
 <riana.tauro@intel.com>
References: <20250619051057.206253-2-sk.anirban@intel.com>
 <5f982dc6-485f-4c84-97fd-c2118284c91a@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <5f982dc6-485f-4c84-97fd-c2118284c91a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::21) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|SN7PR11MB6826:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a1f3d06-7e47-419e-4aa7-08ddaef3854c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VDNXZnNva1VFUXpOWkkxd2RGbVRCSXdLVTZCTWFHV2xZWmNpUnhSYkVFSFA1?=
 =?utf-8?B?c1dSM2Y2cDdQbzVBRmFXYjJCbVlVY2lqMEowVVEwcTBZcGFqdGtreFFQYnR6?=
 =?utf-8?B?Z3A0TGNvODN0bG5NakJGTkJJNzhmcSsyZlMzcDV2RjM4NGllS1FQWWxVQjhp?=
 =?utf-8?B?bE1zMmk4MmlPNUpwSnlpTXVycDZ0d2hydTcveGpncjlwZURhdVd4VUZZT2RD?=
 =?utf-8?B?SHZjT1VvM3ZncVdHTi93bGJuUlVvaWpQOWE4Y3VoWlBBM1hzVVFHamlwdEtN?=
 =?utf-8?B?Ymt4RVBsaHdyRVNieC9wMGhZbzB5Vkx1SWVYNHlVSkFCVXd6ZGRGeVFUNjFE?=
 =?utf-8?B?QmdhTk53RU15WHpaSlFualphUFZ3ZG9kVFhRWE81RGVZOUJvZEhzNG81VThr?=
 =?utf-8?B?ZWZwSWRESGttWThBdm5BL3QvMnRKZXcwUEgvY05iYTRRLzRSVGZEcElRZXhK?=
 =?utf-8?B?bFJNYnVTekZnOFFmSGxldTFLNHowdWI5SEZWRHVqdmdWK3FoNEVQZi9aVDR4?=
 =?utf-8?B?MkV0c04zMUEzTVBqWmd0SzkrMXR6ODVvV2Nuc0lJVUxQY1Azc0Y5ZWR2YkRH?=
 =?utf-8?B?Z0M2T0NibVhBMzlzRE9ITUZ5elJCWUtNMmUwMlhoa3JxaWRSUnMyR1RkUFNC?=
 =?utf-8?B?QTBZajJLczNYTzRVQ1oyQ0lzN3ZrTUcrTkxGWFJTb1JBa3NiNXJRTjhyVmFB?=
 =?utf-8?B?WnlZR1l4MnNZWWJ4MWlDbjNMWWU2dnA4eGh5SExnbkVmTEdVOFNBclk2NStO?=
 =?utf-8?B?U2k2cE5jSTFsdEV4clZYcTRCTmV4ay96WURtQmVYZUZFWnJqaXRDUEErdnBt?=
 =?utf-8?B?NXZKRFFqNzRDTDhsUWk1WWJGQldobnpDQy9nNnI4dmg4MzY3Vk5RSGMzaGJV?=
 =?utf-8?B?S1NPY1hMcThWZStSYmx3VloySzhpRFZqU1NyMXRwcEM3dkN4OUNJYnJyZUlw?=
 =?utf-8?B?Y2tTYUd1WUVld3ppNzRkb2hCTjdJd1NPUEhtcmRRK3JURnZMbXRMaU9zWHBr?=
 =?utf-8?B?ZC9mamZLTlZJb3F3cTlwYzBqNWFQbExzVUdKczM3cW9waFR3YUVOQWJlZGxq?=
 =?utf-8?B?amMzQTV2NVR1eTdhWEVYYlNwY3EzNDZlaXE3d0VxNk9DMUdqUGhWRGJjWCtK?=
 =?utf-8?B?SVYxVHNzdmlKYm43Q2dWWGlrcUdkeE14djZnMlZKcjI0SmdoQ2VGbGpSS2ty?=
 =?utf-8?B?Q2o3VENxcjE4YnVPd2ovN0ZmbHZOUVNkSVRmbUpKSDhnOS9RdnBQcGtLd3M1?=
 =?utf-8?B?N0hnRHVLOStHODBjK3I2bzRub0RwdWN5Rm42K1pLdU15VFBIWUJQOVhLWmFO?=
 =?utf-8?B?ZHhRdWt2L1hSdm9XVXEvL0wvTHJ5UmE0dW5zazhHSkwxQWRxOXRGaXdPK2lD?=
 =?utf-8?B?VWN5OVYwMXhvMGRpMEk0M3N4UzFtQ1h4Z1psbjFIYndGK1AxdzcyYlpTVjU3?=
 =?utf-8?B?UnhxUGFHKzRJWVpQUGVvR05ZTnVVOU84TmVpSDN0MzE0SXVzRW44djZmQUdt?=
 =?utf-8?B?WHphT1BUTmh0dlMrR3lmNmgySm45ZUlNVnNYNUh6RDA0R3ZaS2gvZ3ozR2Ev?=
 =?utf-8?B?cktlSzdRZFVvQTQ4UDd3OGJlSW5aVHkyV3lEaHFxVW04ZDVWbC9pbjcxcVph?=
 =?utf-8?B?d2xjWlc1L0dvbmpLL3RxdUREaHhxdDZYeWlxamNXak9yRThDYVBETkFkL0Vo?=
 =?utf-8?B?TW5VblQvc1RjK3ZxdmFXcUd2S1FZcG9KeWdsMWdEbnY0MXpDMEhpSktXZ1k5?=
 =?utf-8?B?YktBSFNTb0dFeTlrUERwcVVIbWpOSVJmTFFIY095eUt1WTNsVlRXTHFvTk9y?=
 =?utf-8?B?STJGeHRZUytQSG1JNUoxWUlQaFBEbjFqcXhIS245emoveU1GY2VoMUJFYUlv?=
 =?utf-8?B?VE11ek5mZytEbllhMS9UMGo2Tkh5WVMySDBObEhUV1Vocld3WUt2ODVtMHVo?=
 =?utf-8?Q?18YOqlUChjE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REhjTWZlR2MwdVo5ekNUbnRXZ1A3bFNJMG9qL0FQNzl3OXQ1S3k0N1JvQlBZ?=
 =?utf-8?B?WUZpS01ocGRjam1ScnZuN1VIQlBiYTBrWjc4dXJjMjU2QnFQSHlLMzZHdGZC?=
 =?utf-8?B?WlkxdVZzVUlZVnVxeXpGdUtseCt5bzZDRDlicTJWbXVCcFUwMVd2UEFMVkNx?=
 =?utf-8?B?VzJlQUJGWHZRYytnWVNPSllzOEJUeVo2WWEwNzNwVncvS0xUM2NmbmtXWFNG?=
 =?utf-8?B?S3RFVDRDNmlnUlFiUEtqS3dPYzN6STRKT2U4YlhYYU1VQTVFN01LamNENmUy?=
 =?utf-8?B?TzRic2ZJSE5NY1BpSU9xR0d5eHVaME1DejZsOHovY3NmRlVTSUEyQUlsOENq?=
 =?utf-8?B?RnBKaUlzajVQaHNtY1NvV0laRzJtVGUwOFBuenlJU04rRk8xdDYvdXl3SVZz?=
 =?utf-8?B?Z0FoaldSL3VLR0F4QldkTjkzVGs1WlpxS0FHYVNibWpVYWVmZEU3bG11SnRQ?=
 =?utf-8?B?S201V2VRTWQzQUpnQTdoMmxicXlnV2tsV0huMk1GTXJzam5LajNsdFRwR1JV?=
 =?utf-8?B?VTV0L0dLK2crQWkwRVMvanJxZ0FDZEtxNExySzg4aGlFNEs4R2Y4RTJwZ0oz?=
 =?utf-8?B?YWQ2VWxOc0hidEtxTlQzbWZKZy91bktHUlNMTEMyMlhMT0FBaWhCTFdOSFhZ?=
 =?utf-8?B?TkxTOXJSMnJka3M4SkhzSnRHMm84TUhDclhpOTM0akNrbFNWeDNaMkRnRFli?=
 =?utf-8?B?cENWeEF6TTNhUDlGdGNnMWJ2eTBMdFA5aFZ6SkRGTnBYazYzRkppbUV0dU9Q?=
 =?utf-8?B?SU02am5WbjcxZkI3aytPOUE5bUdveTF5bjhMb1JhWm9RQWhKaDdDaFpOdEtu?=
 =?utf-8?B?eFljbnovbWtJNG1lR0VwbzNtWURZc2RNQjBNR2V6bEZaeitSSENyV3RuRVQr?=
 =?utf-8?B?c1NOR3FvUDNIeTZMcllBMDRSamJnaXRBaitIamg4Ym9Hc1JFSTdaZ2RYcjF2?=
 =?utf-8?B?eTB3RHNVa0hTZ1YwWmp0UHR2UE5neWMwZUphUWJpYytlOEV6ejJKVXpRSERI?=
 =?utf-8?B?U3VYVW1JUmFGdVNLdEFzVThqRU5DSG5TTHdKSy9FYXlPa1FtNFZLejYrYTl3?=
 =?utf-8?B?L3Q1dlNCaytmcGxoalNsM2o1Ui90NCtLUW5IQkxDdEFXdkhrNEhDRU16VlVB?=
 =?utf-8?B?dWFzb1VaTEo0czhDc2RaOXRuc2Q2bGt3WG0wcVk2VjdDam90K29XNXNtbGQx?=
 =?utf-8?B?YndRbDdoWjhRYTFMRHNSL1cwWk1QMHJ3QksrWHMzNy9VYUxnUnM1TFFvWkpM?=
 =?utf-8?B?UzZ0RzhWdjNhUjZVNDNyQ1NpcjFRZmU4d1JOMGpoYWUveDN4elFvcGlRcWs2?=
 =?utf-8?B?M08yektOWHRyeHJWeFR6SVJ3U1VVQ3ZuYVIwZG1UaXNZWThsdmxCOTRvUzhF?=
 =?utf-8?B?V2c4WFh3K3J3MTJ3bzczMS9iZ2krRWt5ZmRjSmJnN0VGVVlrS09lSmtDRWRw?=
 =?utf-8?B?M0lVa05ZNFVjNmF1emtHN0RxQ1ZaU3BtZkU3MXNhMlJjaU1JaTJXdk8yVjNm?=
 =?utf-8?B?cGpqWmJqcGFLVXc3WXVPUzBvSm1TaS84L2QxeXhvVXhMM2NsVENXUzBWVEox?=
 =?utf-8?B?QTVoOUorK3lCRVZRM0EzSFdoK3lkZnhNNjRXWDE5TGhRVkNWNjdsMW5tamlN?=
 =?utf-8?B?WHdtT0djZUMvZGNmN2x2RTNNbkxRS1NNb3JXK1NrdHJ4Y0srSjdCUU94aG96?=
 =?utf-8?B?NGhXWUN4bTJKZFZQZVhxOExSQ1ZIaVJIVEx4SWZ0aGVzdUg0dS8ySE4vRkdZ?=
 =?utf-8?B?bmJPaWRqcmtHaktGV0hwTG9NaXk5Q3hXd3FrU1UwS1lFTG5FTkovQ1NZaGFm?=
 =?utf-8?B?ZDBQdnlmKzZZYVlJejFhbjFDN0RBL000Zy9DNExRMVh0ejBCVHZTWDBaWURN?=
 =?utf-8?B?M2cxczFDN2lud2d4RjQwY1JQT3lGcGVlUFhwTlR5cmJXYWJ5RGMzb2pNVjR2?=
 =?utf-8?B?dUY1U2ZGS0EwajhzN21wWFlWSVQxZDRJM0VvWFlJWHBMS1ptUUxOdmx4V0dp?=
 =?utf-8?B?YU9aYW5XeUEwb3U0Zk14KzhPSGpaVXYrRlcybEo3TGkyTlVYY3VJY3RTcmo4?=
 =?utf-8?B?RWNyUnExOFZDaTVHUm1NZHJZTU1DZTErdll3QkpSNFF2MEcva2ZpZXJOQ3Za?=
 =?utf-8?Q?djP45tsGuqhmQpMqvip0HqAvx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a1f3d06-7e47-419e-4aa7-08ddaef3854c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 05:38:29.7011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CF0WMvztfCWlotPqOzdPkcM2CVtcQqTwG/PbRrbAMIyNb9scS1cpoEZJUxxHFgeaUEX09EdJVDCNcDLO8w0yBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6826
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

Hi,

On 19-06-2025 11:01, Nilawar, Badal wrote:
>
> On 19-06-2025 10:40, Sk Anirban wrote:
>> As part of this WA GuC will save and restore value of two XE3_Media
>> control registers that were not included in the HW power context.
>>
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
>>   drivers/gpu/drm/xe/xe_guc_ads.c       | 5 +++++
>>   drivers/gpu/drm/xe/xe_wa_oob.rules    | 1 +
>>   3 files changed, 7 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h 
>> b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> index 7de8f827281f..c4aebb7a9dc6 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> @@ -368,6 +368,7 @@ enum xe_guc_klv_ids {
>> GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET = 0x9009,
>> GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO = 0x900a,
>> GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH                    = 0x900b,
>> + GUC_WA_KLV_OAM_CONTEXT_SAVE_AND_RESTORE                        = 
>> 0x900c,
>
> Please change the name of klv to 
> GUC_WA_KLV_RESTORE_REG_FOR_OAM_LATENCY_MEASUREMENTS. Rest of the 
> implementation is fine.
>
> Badal
Sure, I will fix this.

Regards,
Anirban
>
>
>>   };
>>     #endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c 
>> b/drivers/gpu/drm/xe/xe_guc_ads.c
>> index 07a027755627..27668cc25ef9 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> @@ -382,6 +382,11 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>> GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH,
>>                       &offset, &remain);
>>   +    if (XE_WA(gt, 16026007364))
>> +        guc_waklv_enable_simple(ads,
>> +                    GUC_WA_KLV_OAM_CONTEXT_SAVE_AND_RESTORE,
>> +                    &offset, &remain);
>> +
>>       size = guc_ads_waklv_size(ads) - remain;
>>       if (!size)
>>           return;
>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules 
>> b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> index 9efc5accd43d..4bf0df0ed663 100644
>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> @@ -59,3 +59,4 @@ no_media_l3    MEDIA_VERSION(3000)
>>           MEDIA_VERSION_RANGE(1301, 3000)
>>   16026508708    GRAPHICS_VERSION_RANGE(1200, 3001)
>>           MEDIA_VERSION_RANGE(1300, 3000)
>> +16026007364     MEDIA_VERSION(3000)

