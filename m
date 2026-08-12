Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95A4C5CFDB
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 10:20:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63ADD10E35B;
	Wed, 12 Aug 2026 10:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NyLDSA3L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951D810E35B
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 10:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786530008; x=1818066008;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LcPRIpMVWJAbxkqd5Smfr75OVTyxXXdpb35jp6JB05w=;
 b=NyLDSA3LYMxmurdqWCHLqP0Kk670BBNo70UVlo+rSYPCSL4Uc1ne21vR
 EeQeq1MHA/CwZdpxaRSSGlXVihkouyT1PvjN1dJZzJw80Ua/aKnJmlSjg
 6s1O4ou/t2cFvfezYund4B7X7ViaGjaqIHngoPZk96aJNNCam+ayzFgdx
 gLFXzpbzXgFfi0liiJl/WkEpJ1yDEGGEWZQf7+e2iZ7iOwTQ7UbBnr1g2
 ve9kkMrv1LQua6JirbpGhxHkykNX3LQ61m3bSf0Zko215h94BVUg8Oz3t
 /PYrrT+F9wCbsByYer4PkILnJtf6eqqxFu/BReN4gUvaxMxeCxA9f+vYR Q==;
X-CSE-ConnectionGUID: ghWxeYaCS9K+6hMXTSkdkA==
X-CSE-MsgGUID: 3qyVoEr5SQWK4iTy4cPQzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="87090275"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="87090275"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 03:20:08 -0700
X-CSE-ConnectionGUID: GfYtCfusRPWmXQgPiZzFiw==
X-CSE-MsgGUID: jDSRAl/3QUOhi4CcEB0PaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="268750643"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 03:20:08 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 03:20:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 03:20:07 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.44) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 03:20:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tM2okszSr6kBhVodxYd29JclcdGTe9QBOEBt8fO0y3dIeUrkFMD9X5zV+OxVwhWDcmmCrzwM2lZdmyKFFy0fulXGR01ToPCrkSyopFaqWx4XJnvIXQcuAnCmmZkyvLn1moaAuVA22Sr7ep364dyQWrPs49mD9hLNNQ5AxEN1tXKZ+bSD/By6maY0hlWDp4RT2X63qixeLq2Rp5q+o0Jg8hQg+L8099fSofSRoh5qnKjTCVYNRMhucYQzhdqAHmtQUp3H/bwJE/l1Pqhq6MLZZToOU0oTyIcAvfkRpGDzPIkR/3xQKiu7TBCzP8LiRKWfcVzi+uY4g8h/YS8c6oCxAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/nCWzIXK6PD3bAq+jrDZqaUvduYeyj6IxqbzaBg2ThM=;
 b=K5Y4gDQU+xv8C1c9zVz5moNZyvg0qJ1bZR4pNtko0RKjdR6bG8HMuNgoda0qn2KKbshEIynIHCsKfOI1XHBhZ1YVV7zrfaZI/43avFd62kwlRzUidUGEfXTuHO5w7bWySMyYLUvrfl7hhEAy6Q0NzN25AofKv9TUpNGvg4Lj9KvHuPv5dVMR06lIsCazwKSsu7Yh0uHD8HWmDIsHLBwiwYHyN9dh0mC9j7b7unL5tmHm+Ho+0+HH2xuKc83MZ9jD81d171xENeI2CHeyJyDxjcsmUiQQ/7tx97RPBTVvCQ+b0jL8aDRhS/fqT+6CdGxINtd1HDqp6cVMTlHd+sLEmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW4PR11MB5912.namprd11.prod.outlook.com (2603:10b6:303:18a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Wed, 12 Aug
 2026 10:20:02 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.011; Wed, 12 Aug 2026
 10:20:01 +0000
Message-ID: <548baab0-0e80-473d-8911-22024cd4bbbd@intel.com>
Date: Wed, 12 Aug 2026 12:19:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/23] drm/xe/log: Add hardware error signatures
To: "Tauro, Riana" <riana.tauro@intel.com>, "Mallesh, Koujalagi"
 <mallesh.koujalagi@intel.com>, <intel-xe@lists.freedesktop.org>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
CC: Yoni Levitt <yoni.levitt@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-11-michal.wajdeczko@intel.com>
 <9e60e8e5-3942-4537-bb10-ac5a3bc72c69@intel.com>
 <d9b9afb1-7e39-4ad0-9e8a-ad6888238ab6@intel.com>
 <1bce5332-0341-4ecc-839d-bd36df33dff7@intel.com>
 <14bfeeb6-5762-4870-9cae-be827ec26129@intel.com>
 <fd2bf953-4faa-4c29-88bf-e8acc9f11355@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <fd2bf953-4faa-4c29-88bf-e8acc9f11355@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIUP296CA0100.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:351::10) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW4PR11MB5912:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f64b826-a676-4c7c-3e32-08def85b44fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|4143699003|56012099006|11063799006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: sCm4+jisYiOvPGwILcF7yc4PkEmFibZLA30InEZmgOhnMuKteVwuvPPdcA1zJK0KwllvPfTll2yi8u4kdnkNhZlu1rDYL6M7QekDDUNSGT0fZdRGVO6MwaAItBD1IK5MhmgMFNE2IxC6ht2CD2GcqTVoU30+YY57zVDpEyVCwlLpo/c87k9MMaNvCzXXkgqmb7bqkUqyIuzh0qX0V9G1kgS60n7kdAWJd0lxIyOTKNY+qk2eVrf9OfAM9bSDtxQoQmd2da7LTGwnORHeBG5hQEbZSIxwVZHCIUWsX85BxIq2cs1VVSzV+LizawoLqJX7wKTSjVDXlrSYRjZUc5OcxSp4X5W/Xt/xD43W//DCsXCde9HJOpsjO1gFia8w1WFK7QmvJdkOkLKLZN07YbfKFjL9n2qL61TJYHRxE8vC4nTd3ptFxl3kngIU/Kw6eeArgAyRo0ya4hcEkd1XspVwCy3KleRuuCiI8R5hWiWhEt44UbYobUHbRReMyEuxcsEj/bQqhGfufR8oC1bZefUkXTkAaCoXTsbVdW2Hy+ZxouluA1TBnubI8S0YlIKSy/qOqHTrOxEsuzlR4/jpzaALiKiG1cm1JhEjwpbtnQr6ezLDX/K3mg5VSubSXakhEUgMAHeMsNET+qeK6v/X2vf0mgd+Q8qApHn4lWZtWrhuNlc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(4143699003)(56012099006)(11063799006)(5023799004)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzJHYnNUdC9QbTVaZGxKVGV2c05mMTVxTjNJOWZLRTlNa1NhSDNNZTE3SDFt?=
 =?utf-8?B?c0Y4dFFXdUZ6eXNKK2xQNGVybENVbjMrNmtmckNyU2dZTHVTUmZINTVoMXhm?=
 =?utf-8?B?c0tDcHRRYytsQVhqU1NlVlE4cWx2cmJXN09acVROaHlaWWR1L3plenUrV2VF?=
 =?utf-8?B?OVJhWFRlWGFjdVYrbkZBL2tqMkFhUzhpdXFYSHNtYkl0ZHR1cXZVb1pyRGhk?=
 =?utf-8?B?K2tlZSt1SU85YThWVG91RkpFQjZUMXdLYkpLT0IwR0xESWlHMVpFbkw5ODdp?=
 =?utf-8?B?WU9nbUtwRjl4Z09nV3REOG00ZzNteVl1MHZBMUxvUWExS3Y2WS9HUGlvM3JB?=
 =?utf-8?B?TWN3TGNlcDkxTVpaWnFianloNy9GM2IrNEtOTEdCWGxBZEZnR0xVZGQyeTdU?=
 =?utf-8?B?a2V3RWtHUjNJTlQyOVRmZEIyR3ZPNzZMVjFpODZKcVpFYjQ2MWd4UjNnTHRD?=
 =?utf-8?B?N2xMSzFiU1pweDFJakZPU1ZScG5OakVhYm9ZRnZKUWRYWkZJMGtRVFM3OVlu?=
 =?utf-8?B?THdFdlY4RFhmOVRLaS8xRTJEMmZIWUt0N2FNZ2NsWUZjamROZTNnakJVOWZo?=
 =?utf-8?B?M2hGc1NOaDN0QjIvdVhPNmM5dzhTRHI4c0VPdHVXM0FKVEF3ZGpvaTloeGN0?=
 =?utf-8?B?b2dWNCtyVlZERkpyMjZrdjV6NnRKUE5RcEJiazd3RURWUGh1MmRUZmNPOEVa?=
 =?utf-8?B?a1dJTWpMYzNBR1hBN2xqUkR4dmtlV2lEOHZ0eC9iUmhqb2dqQzc3Qy8xR3Ux?=
 =?utf-8?B?V0xzdno4VFV4eVhzNnh2aEdCclQreHo3b2ZJNkxOZEtPNnBrajRMSWVtSHFQ?=
 =?utf-8?B?SGVMbXFVcG9EVVFoc1pHTFFtVytkTEQ0Z0Q2MVI1cm44aXcyeGJKUnNYb2xx?=
 =?utf-8?B?QmE3bXQwdXdQbGd3dnFQMEEvVmQxUy9lYzZsMU9MU3h4UXNtdkFrYU5MdWVI?=
 =?utf-8?B?YlZVNFNMV0Y3Qis4UE5MM05FQ2I5OVJZMXN4R3preUFiMGZjYjE3UEJ4RHJ4?=
 =?utf-8?B?Qk1GUUdEcWh6SFZtM0hCNlNXVitHTHcxOWhPZ2FveS9lZWRlSWpTQ0Y5dExa?=
 =?utf-8?B?SEZkeURSSXRTbm4yYVBOS3lRdVVLRFdLRmE0UmFCRVlFQjdNODB6UGZaOGtq?=
 =?utf-8?B?b0oybFFERU15NWNUenlXMDBNVWN3emtzUmE2UTVvMWN2WDI2MEwxTVkrY0Vk?=
 =?utf-8?B?WTN1d2UwQzVUUFdkUWVHTDVpZ0V2blZEdVlzUmxPL0VYTm1yRzNRZS9INGhj?=
 =?utf-8?B?WEV5bm80dUZxSzM2bGNXOENiWlkwajhyVElONFd5T2hkSmVPNDJPOWFnMTlD?=
 =?utf-8?B?eVd0YjlmYmVBT0RGSHcvZWkzZHhraVZ3VEQyRFlOTjl2TUlkbkVGT3pBT3ho?=
 =?utf-8?B?L3dJRUIxZzM0S3lSbWN2LythRGtsU0F5Y1p2d1IyTVl6Snh2VVlOdEZNYjQy?=
 =?utf-8?B?VnIza1RObVpaUWc3QkJRVVdCTnFBOENqclpiRUlHOHBvQm9pOG9DRzVaOTVH?=
 =?utf-8?B?RFUwelVseUtUeExuM0dtSHJsSXV5Z3lwYktoWDhwYzh6UmxteGd4cWxQMnZm?=
 =?utf-8?B?UXpOUko1YjcyVjFIVXcxYjlIZUFmZTVSb2xwdkgxRkdEK210K2RLMTVuSWs1?=
 =?utf-8?B?clM5NHMwVWMwa2NEOGZERDlYOVg3azJvYXJLY3pKUVR0eEVMUlZNQnZlZUg3?=
 =?utf-8?B?WktZbEtycTJ1UUdCVjVHZnQ1ajRMQWF0Q2lSTFdHMHRTSGJ1ZXEzVHhUTHRY?=
 =?utf-8?B?eFphRjVuMkJyditBWm5xV2F4UTF0ZnZVdW4zenNLNGNEN0pVZjBNek43VXNM?=
 =?utf-8?B?TVZQTlY5MUtoVENEWk81bG9NM3BoOGhpbFlEZmRiY1BNR3VKWGhBa1JFM21p?=
 =?utf-8?B?UjlQL2p6TTUvdUN0TkhYakFpNTFXemh0WnNlZ293bGF3MUtNN0dRYnVpRG1I?=
 =?utf-8?B?UHdpYUhMS1RRS214UXhWZTZBWlc0UEZDbkg1ZTh0R2JOT2F4THY1MGcwNXc5?=
 =?utf-8?B?ZktDeDVQTE5hVGdOeTVBZ3lhQ28yUHBZaVlGMTVDMjd3Z3lyeElkcG5sYTVy?=
 =?utf-8?B?WGFqRWM2N1dHRzVROVVZSjJQbVk2ZlNxOUtRbDlWMWNVVXNvY2xVdit5NVlL?=
 =?utf-8?B?WGdkRHhuSFVzTlA0RGllVHVnRjBmZE9XMzNsejRJT1oyOFZ3Q1Y2WWZabjZZ?=
 =?utf-8?B?d1VUajJTaDNiZGZHMWl0dGNXek11aTdOYi9uK2NtQWtMbGFZbUdsMmEzNWdM?=
 =?utf-8?B?Q0RFT09yUWtPV2IrOXoxcWJlZUJVUUV4YUdpdGVFUHBlbExEcXdiZm50OHF2?=
 =?utf-8?B?MW91TERMV3hlVElTVGVEdDJ5TzEzeTdkZU8xcVRPdGhJa1FTTGpiQVhZMFVQ?=
 =?utf-8?Q?0ZdBv3Bgi6SGgZfY=3D?=
X-Exchange-RoutingPolicyChecked: Gtci6JYd1n1tRfZqJeinLJT1cpA5fdmzfDPSWqOjHKo1KPsoWlkrnYdUJ+1YZjPsWIVTVaSrzCUdIrSyOglXm5b2ZcSuvW/EDuYD7kR0yAFJ87AmlepuBRFaW4QmobNNUjU8AH1bxxtAwk8xUuVEoIwNxBvROgFT2pSxyh5ZaFTM1RiTF52KSHFA9pBJzhm5MBq/fTj3ZxJpMeYJRDZG+LCMXJad046ny2e+IfferPaV4cUYH98Nr7g6J1TeE46U9DY3w5LTSIJQ4PNeBv1T7AIFekC2eN2W3aKfAeJNZUY2Q0EN8zURj8T48O+6k/BgHtT5oMic7kKyoimwKF2TdA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f64b826-a676-4c7c-3e32-08def85b44fa
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 10:20:01.7775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vp0ITCkAwXE7nKWUE056hVIvFJkIyLDyrcXG2kkwAYXR6rmsIEjrd7McZf4yaEriJIRr6AraXd30P4BplFUWt7UUN1W7Eti/uKtaVJFYz7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5912
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



On 8/12/2026 11:29 AM, Tauro, Riana wrote:
> 
> On 12-08-2026 13:54, Michal Wajdeczko wrote:
>>
>> On 8/12/2026 9:00 AM, Tauro, Riana wrote:
>>> On 04-08-2026 21:26, Michal Wajdeczko wrote:
>>>> On 7/31/2026 1:41 PM, Mallesh, Koujalagi wrote:
>>>>> On 30-07-2026 08:51 pm, Michal Wajdeczko wrote:
>>>>>> Extend our error signatures definitions xe_sigid to cover also
>>>>>> hardware-originated errors and make them distinguishable from
>>>>>> initially defined software-initiated errors.
>>>>>>
>>>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>> Cc: Yoni Levitt <yoni.levitt@intel.com>
>>>>>> ---
>>>>>> v2: update comment (Sashiko)
>>>>>> ---
>>>>>>     drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 16 ++++++++++++++--
>>>>>>     1 file changed, 14 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>>>>>> index 99717fdf74a6..69cce4b45635 100644
>>>>>> --- a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>>>>>> +++ b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>>>>>> @@ -159,14 +159,19 @@
>>>>>>      * @XE_SIGID_GT_TDR: Engine hang / timeout detection and recovery (reset). [RETRY]
>>>>>>      * @XE_SIGID_MEM_FAULT: VM bind, page fault or GTT fault. [COLLECT]
>>>>>>      * @XE_SIGID_IO_BUS: Runtime PCIe / IOMMU / MMIO access fault. [RECOVER]
>>>>>> + * @XE_SIGID_HW: Generic hardware failure.
>>>>>> + * @XE_SIGID_PCIE: PCIe interface errors.
>>>>>> + * @XE_SIGID_DEVICE_MEMORY: Device memory errors
>>>>> Add . @ end
>>>>>> + * @XE_SIGID_CORE_COMPUTE: Compute/shader core errors.
>>>>>> + * @XE_SIGID_FABRIC: Fabric errors.
>>>>>> + * @XE_SIGID_SOC_INTERNAL: SoC-internal errors.
>>>>>>      *
>>>>>>      * The situations the driver detects and reports in software. Values are
>>>>>>      * numbered sequentially, are only ever appended, and are never renumbered or
>>>>>>      * reused. The tag in brackets is the default resolution bucket (see the `Xe
>>>>>>      * Error Signatures (SIGID)`_ section).
>>>>>>      *
>>>>>> - * Firmware- and hardware-originated signatures are not listed here; they are
>>>>>> - * logged as reported by those layers.
>>>>>> + * Firmware- and hardware-originated signatures are numbered separately.
>>>>>>      */
>>>>>>     enum xe_sigid {
>>>>>>         XE_SIGID_SW            = INTEL_SIGID_GPU_XE_SOFTWARE_START,
>>>>>> @@ -178,6 +183,13 @@ enum xe_sigid {
>>>>>>         XE_SIGID_GT_TDR            = INTEL_SIGID_GPU_XE_SOFTWARE_START + 6,
>>>>>>         XE_SIGID_MEM_FAULT        = INTEL_SIGID_GPU_XE_SOFTWARE_START + 7,
>>>>>>         XE_SIGID_IO_BUS            = INTEL_SIGID_GPU_XE_SOFTWARE_START + 8,
>>>>>> +
>>>>>> +    XE_SIGID_HW            = INTEL_SIGID_GPU_XE_HARDWARE_START,
> 
> What does XE_SIGID_HW indicate and how will this be used? Why not just start PCIE from the hardware_start?

I just wanted to have something more generic to cover all unnamed HW parts
which can be used if other HW SIGIDs does not fit or we would like to report
HW error from the SW POV

it is similar to SIGID_SW = 100, which we use for general software problems,
within 1xx range of all software signatures

so here whole 2xx range is about hardware signatures,
where 201, 202, .. are just more specific HW areas

something like HTTP codes: 4xx (client errors) vs 5xx (server errors)

in fact, I was wondering whether we should reserve dedicated range
for firmware related codes, like 3xx, not just single 104 or 105

maybe we can return to this idea once there will be a push to
make it more generic across drm/kernel

> 
>>>>>> +    XE_SIGID_PCIE            = INTEL_SIGID_GPU_XE_HARDWARE_START + 1,
>>>>>> +    XE_SIGID_DEVICE_MEMORY        = INTEL_SIGID_GPU_XE_HARDWARE_START + 2,
>>>>>> +    XE_SIGID_CORE_COMPUTE        = INTEL_SIGID_GPU_XE_HARDWARE_START + 3,
>>>>>> +    XE_SIGID_FABRIC            = INTEL_SIGID_GPU_XE_HARDWARE_START + 4,
>>>>>> +    XE_SIGID_SOC_INTERNAL        = INTEL_SIGID_GPU_XE_HARDWARE_START + 5,
>>> Nit: Maybe retain the same order as firmware
>> do you mean the same order as in XE_LOG_LOCATION and XE_RAS_COMP?
>> but there is a gap (no 3) and currently we say SIGIDs are numbered
>> sequentially and only appended ...
> 
> Without adding a gap. It's a nit. so upto you

hidden mismatch due to gap might be error prone as one could
think that there is a full match between SIGID and COMP

so IMO it's better to make them be different ;)

> 
> Thanks
> Riana
> 
> 
>>>>> Since we've resolution bucket for SW sigid so do we need resolution bucket for HW sigid as well? If so how are we going to put HW sigid to resolution bucket?
>>> We shouldn't be having resolution buckets here. This is just the high level class.
>>> For ex: Soc internal has multiple recoveries. I think the decision in 02/23 was drop resolution buckets.
>> that's correct, in v4 there will be no [resolution backet] for any SIGID
>>
>>> Thanks
>>> Riana
>>>
>>>> there was discussion about this already [1]
>>>>
>>>> and I guess we can add [COLLECT] here as an overall recommendation for all HW SIGIDs,
>>>> as likely all such errors will sooner or later be reported as separate SW incidents with its own resolutions
>>>> and official documentation will have more detailed recommendations (out of our scope here)
>>>>
>>>> [1] https://patchwork.freedesktop.org/patch/742246/?series=171022&rev=1#comment_1368419
>>>>
>>>>> Thanks,
>>>>>
>>>>> -/Mallesh
>>>>>
>>>>>>     };
>>>>>>       #endif

