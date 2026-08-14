Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAFFC5DF6A
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 13:33:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A40210E551;
	Fri, 14 Aug 2026 13:33:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="amZw0qtk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B12410E551
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 13:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786714385; x=1818250385;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=wWbhKZs5DPrRnGTjgzUvCSYbVdpWwHDDFqKgecKFl10=;
 b=amZw0qtkfUFTzAlI7FHWuhSNIgw+vrhbK31dAP6HoJKsBYLuRQGPM5vh
 cqA6FRwJhMNLjQvVc2Wa0vmmHPielfxk3TypTBxtEM4UUFJNi8z7DAVEL
 x0qTOzBOknIbOXBxjz40VFiOiSu/vgAeG/aFd4lS/V1BxWI5V54TztXKj
 0iT7x6SsUIcJ8MqxtCNnYXpMvklKW4mbYKut+GarfPOQLoRY7IFOjI2U7
 LDLXIabwBOI2kVvWz6MamhliEBsRZgiGWvuDTTsnLLa62DXFNK6SLUbzD
 J7E3mjjETmJtkOSOQlNb3Rzxdx8H36aWdqWgLYX1tyXA3SDtMMMDa2YDl w==;
X-CSE-ConnectionGUID: +u/Xp5ZwSieAf+41psFoTg==
X-CSE-MsgGUID: an/pqK83QzCUCAe1EJYs7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87421897"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208,217";a="87421897"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 06:33:05 -0700
X-CSE-ConnectionGUID: xklTV3ODQGeu8U+7GB3Z5Q==
X-CSE-MsgGUID: P9XMY+V6T6m4qw1iwy4Mig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
 d="scan'208,217";a="260443904"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 06:33:05 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 06:33:04 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 06:33:04 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.24) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 06:33:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RlOYDU3lizsrIjCPiXR8YCYHeo57XXbx2VbacTecs88Z8KA6FC/n5LyoaY2+BCoAMVMAtL4401st6a/rbKDchRrNj4ewlyZpkbMSKTerngPqFGInQ5dHx1HEsocNDlVk24DXZ/iWT297+IUo9rDz8mFmfcvcdYyJ2MwZJes6iZ0FPEcmUNHb9znD8GadvxGCSokUV3qC36eTl6erOeb/qPnlmI4dtKNyA7Rwaxc75PWu9HA+J16FlyS/Y8rrfXMQoKNI5GUXMfF4SOCSVnLeFt4Pm/JILxF3lC49b4EUyBtSMBMQPsaSuMzE/cbthLi2SZU+TDktRGJ1xuV6bLqssA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UzUd6O6QNkf5aVhaFcWxQ5RGSM7aZXiwSuTo2S5/OrY=;
 b=xghh1OFcvlkJ+IFWRWKCaHE8WC5BPwgNWFtJ65wosVEPHlxvCTwzd2Rg9nKlRH5qkvGkcPGBEcL4dKWHDembNFY7EDU+VXexMCJGvXwyYND93UWAH3XqWnmqYgpUsE3ExaUkwv4KihsPLy/A0J5kel0AeWHm93m4cIiwGlHY705DF9Qu+Wvgp+blClFC9C1PO3Ie0KVmE60yproXQEfGEwmfJrDIJ93sZ+SqMOtPk/iNYqBnbNb+KXszuMrQkXLm0nAhpQmobKiAyG2Vtmwx6UR61dSnsld0omGVTmTBPOWW208Y7m3u77FuismGDssvUIuyysAnMwZszSnEnF0VeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by CH3PR11MB8444.namprd11.prod.outlook.com (2603:10b6:610:1ba::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 13:33:01 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 13:33:01 +0000
Content-Type: multipart/alternative;
 boundary="------------CFLAYzarII07ycZWJ5LS6nLU"
Message-ID: <860e37e3-40b8-4606-a294-0e572812de74@intel.com>
Date: Fri, 14 Aug 2026 19:02:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/32] drm/xe/log: Add structured SIGID error logging
 infrastructure
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Mallesh Koujalagi <mallesh.koujalagi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>, Stuart Summers
 <stuart.summers@intel.com>, Yoni Levitt <yoni.levitt@intel.com>, "Aravind
 Iddamsetty" <aravind.iddamsetty@intel.com>, Raag Jadav <raag.jadav@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-3-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260812191450.11690-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MA5PR01CA0161.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::16) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|CH3PR11MB8444:EE_
X-MS-Office365-Filtering-Correlation-Id: 11ba65f0-dc84-4019-fe2e-08defa088fa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|56012099006|3023799007|8096899003|6133799003|10067099003|5023799004|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: /cFcEDrs4tdNO0pXms8MsL2w/kGcZdX/ljbwx3OGb78iUrjGDV/8A3WnjGil1syhP2nkHAvphlnbcF18UkoEJIP0O4KJDcj81avlehOhc7QTDElyU3DtAXmuPCOSGPQ47Ix5xN5RF9Ztbb+T58QzTeCLrKiTmsMvtq2chha3qNJ4aDjXpzOhe1WuV6QcFcDsi6CvximK2sKQlzEEiDgWsZhSivRR5ULtyqCd58Fl+YpP8cMFnOGmY18VZQPRPJNX17cOSH+MnmeabFiIa2NFSv3h8ts2I92x1yI0JNzoXfPti9hQovBH63S4VbyIfX+TIa1DDBjnY+nwfAQexKU5Lo0FYqE34+2LZ/u9h3YCeNlwerbuK1QM6hNsBbb614trLZibQehi4VJ4KisYNZvvFU8BlA7sW0EXMep8wStGqs34FAYr9XCw9T8yUkUBEEOpqvquamO/Qkm4lUKo1oxXuqwfIsMVU981Q4JXCD0k5aPPJJKYWn1rIYKcquxaEaYu4vSdP17jPOU4mclVKePeQs2gH4sAugNYDIwkbZoFGDGDHKBl89nawDRvtzogGg9Tsc7CerB8J8YoIwxmUXsPRIdfyX1WdFQwQbDwSs4L67o+bTPJ1qmEFnA5b5JgEZHLeFnTRC0wdJ3GTUtC1QKwTt4gBQtOipgKq/H3Q/doQiM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006)(3023799007)(8096899003)(6133799003)(10067099003)(5023799004)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3JXR1hHQnRDRTd3WWl6bHVxWFVXY2VOTmN0NEZqTDVNUUJSc3A4NS8vditQ?=
 =?utf-8?B?U3JJbHFrMmZCQTdrR285UmNzZkhZMTFENy9FY2VDT1NhMnA5K0tySjhGbGxv?=
 =?utf-8?B?V1VjWWpqUXZzV0N5dGp4NHo1TnNVM3BsM2d1Q3pMS3VWSk04U3Y1MDBYdzJy?=
 =?utf-8?B?UG1hQldveFR4U0NoV0NlTkplSkVEUXVEREtZUkFjb0E4c3cybXpxTW42dWVv?=
 =?utf-8?B?NW96UC93TjRyOHN5RjNveExjdVV3dEh6dHhlSUVuc3dvWkdVYVJHNGlSbzkx?=
 =?utf-8?B?SU5MblVHci92VW4yMUpRSjZVVy9qWFhIb2RjQXVhRWJzRE9FemhTVW45bms1?=
 =?utf-8?B?RDNHR2RpMS82U3Y3WnhLbXZpTWNnc05wcmJnMXRwVnA2TXdsRTBSTHVVaDFG?=
 =?utf-8?B?ZHhvQVQ5T0FyUW43QmFqOG96d0k3QXB5ejhnZGtOVi8xTm9seERBdzl3eVkw?=
 =?utf-8?B?WWtEZ0ZoWFJocWJBRk5WME5EcVVkZ3pnWEFZem5BUnpHR3hsM2N2OUpDYVRs?=
 =?utf-8?B?aTJ1VEhRZURFb2NOd2g2dm1PbFZmKzdSQXRPNytmUHp5cVJQdXVhaGRULzBw?=
 =?utf-8?B?cnNKc1BVRWMweHhmT0lmWDRjQ0VlaHlaaXFVdGdENE4rNTRNamRwY0JmNjZq?=
 =?utf-8?B?b0JtcUlqdSs1R3NjSkJWK0JWOXZ6cWwrOXc4YkxxbmFJVzd2S1d1MVlad29u?=
 =?utf-8?B?azF3RnVkSDFCUVJNbXE3YlJYbHROVHBGMlg5MklWcDZjR0FHU1QwdUpUcEVa?=
 =?utf-8?B?NVZaNlN1MmZjUndIQlR2UDlYV1hZd2R5bTI3c3ZUT0t6b1g0QnBoZFBOUDlP?=
 =?utf-8?B?MzJXS054SXRYYXUyYldMdDdhVHRIK2JOMWgyNGtzbndnb1V4VlFUWGxLSmU4?=
 =?utf-8?B?anlmMHduWGFFRFJOa092UjQyRUV5Snk5TTB6MVgvUW1VQTB4bGxSWng0d3Vk?=
 =?utf-8?B?Y0U0bkkvZzlzWGU0Y25sbmlWY2M1ZEl1Y0FJVklBZEc4S0cyN0Q3VmllRlZu?=
 =?utf-8?B?SmtLaENpSldVZGZtTk5kaWpuenZpQmw0MnNRenkvOSt5VGEyTTc1YlZWVzFF?=
 =?utf-8?B?ZVBKTGlYNmNzMUZZOHR5WEJQbWNFc2V5V29OMzlrOTd4VFlOdGMxNWlUQlYv?=
 =?utf-8?B?UzZybVZmMjZ2a25seXJ2Y2dwNGFLVUdqRUdGK3pPNDBKbFNoL3EySGJvNDI1?=
 =?utf-8?B?QVUrd1E0V3NMdWNiRThPSTdEejczcU5GZXl2Z0w0azhJTXlIVVhOSng1a1Qv?=
 =?utf-8?B?ZkFycVVpbk1KZUdCMng2THR6YzYzRTROQ3lSTWtaaEU3a005UE8rdkwwbmI3?=
 =?utf-8?B?NG1weVYyM0NFSWNERFkwVW8yMllkZXJXS0VYQ291bnh2TkFyMlAxUTIzdENU?=
 =?utf-8?B?UlJvV1M0NXFvRVpwclJrMllhaHhIWEtrVmRrSVBKYlF0bjkvTmQvaUsvYkh2?=
 =?utf-8?B?UXFxZ1A5Nnc3WHJnZDl2R2VCc1hkRWNjRTA5RUJlbksyNzYrd0REWkZNS1U2?=
 =?utf-8?B?VjQwM0RqLy9ucU5vZElUZ2w2S1ZOL2F6VzlybFIwVWpUNWEzbUpkZXp5MitE?=
 =?utf-8?B?aE91bExSY3A2QXlWMXJsaC9JOUROeHNvYkpJdnNFME5pUmVCemRHcDhKdTBt?=
 =?utf-8?B?TXphQ2pMVUwvQzVxcUtGK1JSQTRlZTAweUdwVzRrVGlaYm5BcVViOTljMEFW?=
 =?utf-8?B?dEdZMERReGNhZmhrUDI1K3o0cy9FT3BUQnVtbUJBS1ozMDgzendMSnplS3Va?=
 =?utf-8?B?cFdtY2lMYUZpTkU1U3piOWJLY0srL0FtNzZYTWtiaEFkdUtRb3F4dzJUSG1Q?=
 =?utf-8?B?c3NTNVNPZFE4OGRWMjA5eEhPNlZLbVBUR2pLZUlPZXhJQWh6bkt4UHMvQkVq?=
 =?utf-8?B?YmdtUjhENnNkZEdrU2oxY0NJbkFsRmFZVEsxNUZLd2dPdktnTDErY2hPYlBG?=
 =?utf-8?B?cGxXUW5PVzhvUDljbm9GdHV2NGtneUNZVkw1bTMvT0s4YTFLNDdFRGtWZVlW?=
 =?utf-8?B?MHVwZWMzLzhlZmZYWnpHNHU3alRFYTN4TlFIRTYvT3RQUXplOHZkSTdxbzc4?=
 =?utf-8?B?RmRUSTY0UFUwSTdWcFZMOVNRbzBiYk5oeU5OZ0pqWHUzV1ZQVkhFOFpFMEhi?=
 =?utf-8?B?bjJnRCtLZjBDbCs5MHYxWVl2bVVadXB1bXFFdVp6SzNWYmNhMEgrTzNFSmJF?=
 =?utf-8?B?M1hjQ0JlMDdvTmRuN0hVeG1pUlJlZ0h5cEFzOEJVWjBtRHM4N1ZBUUxXaG5Z?=
 =?utf-8?B?Yzc1eDNiQmlmSGhtbUE1OE1Jbm80cGpENTVSb2hIOWlGUG14S0xrK3Rta2Iy?=
 =?utf-8?B?TkxaakU5Q1Q0anRNK2VGU1N0NUJYUUFhVmZxYjVsd3ZzaXhMVVVtdz09?=
X-Exchange-RoutingPolicyChecked: sKUHP7Mhz/b9igYhvlfdsqSWUrYOvuQFlXRt9MhuwWJbU7aQzdkD2+fELk2HReQvBJ6MKRVM01Fg63tJgxEcTVl4V7IP6/Nmw6WDtdbf0yt3+rynEwXwSfRxGiCijxgnx5rRtI/K4soruvJuNmgfC8yhSkg2YiHKdhZO+K4BeyrtC1Y2E7xRSzexQ/VuZhnYUJBp6i/uvEDMGKlA+rGQyoNgl08WVHiMh3EiZxEKaAfPJ3Lz/EjHoEVGhH1omX0ugG40uCFOzn9NG24NktmPHcUa2h/4u24a7e4XtvmElX9EV1XhvZLaWfD+nl5TSOCRHMjuZxHqpY0MOd9yA49duw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 11ba65f0-dc84-4019-fe2e-08defa088fa1
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 13:33:01.2438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: THDHHONxXmrWvGatZC+vNeZuGz0jykQ2b2/qIcNC0Kf/J3RHhHMIK7bM3fROVvrcQCHM6WYIt7UKklKtqOL79Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8444
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

--------------CFLAYzarII07ycZWJ5LS6nLU
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Adding a few more review comments.

On 13-08-2026 00:44, Michal Wajdeczko wrote:
> From: Mallesh Koujalagi<mallesh.koujalagi@intel.com>
>
> Today the driver reports faults with ad-hoc drm_err()/xe_gt_err()
> strings that have no stable shape. That is readable for a human, but it
> gives fleet tooling nothing durable to match on: the wording changes
> between releases, lines can be rate-limited or dropped under an error
> storm, and there is no consistent way to ask "which recognised fault
> just happened?".
>
> Introduce a signature identifier (SIGID): a small, stable integer that
> names one recognised Xe fault site and serves as the primary handle for
> triage. A SIGID maps, through published end-user documentation, to a
> description and a recommended action; the driver only has to emit the
> right SIGID next to the usual human-readable text.
>
> Signed-off-by: Mallesh Koujalagi<mallesh.koujalagi@intel.com>
> Assisted-by: Copilot:Opus-4.8
> Signed-off-by: Rodrigo Vivi<rodrigo.vivi@intel.com>
> Co-developed-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
> Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
> Cc: Riana Tauro<riana.tauro@intel.com>
> Cc: Stuart Summers<stuart.summers@intel.com>
> ---
> Cc: Yoni Levitt<yoni.levitt@intel.com>
> Cc: Aravind Iddamsetty<aravind.iddamsetty@intel.com>
> Cc: Raag Jadav<raag.jadav@intel.com>
> ---
> v2: CORRECTED is still an error (Michal)
>      prepare to decorate dmesg with comp/loc (Michal)
> v3: update SIGID DOC section (Riana/Aravind)
>      warn about unknown severity (Mallesh)
> ---
>   Documentation/gpu/xe/index.rst        |   1 +
>   Documentation/gpu/xe/xe_sigid.rst     |  14 +++
>   drivers/gpu/drm/xe/Makefile           |   1 +
>   drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 159 ++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_log.c           | 138 ++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_log.h           |  20 ++++
>   6 files changed, 333 insertions(+)
>   create mode 100644 Documentation/gpu/xe/xe_sigid.rst
>   create mode 100644 drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>   create mode 100644 drivers/gpu/drm/xe/xe_log.c
>   create mode 100644 drivers/gpu/drm/xe/xe_log.h
>
> diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
> index 665c0e93601c..0247a255f7e6 100644
> --- a/Documentation/gpu/xe/index.rst
> +++ b/Documentation/gpu/xe/index.rst
> @@ -35,3 +35,4 @@ The display, or :ref:`drm-kms`, support for drm/xe is provided by
>      xe-drm-usage-stats.rst
>      xe_configfs
>      xe_gt_stats
> +   xe_sigid
> diff --git a/Documentation/gpu/xe/xe_sigid.rst b/Documentation/gpu/xe/xe_sigid.rst
> new file mode 100644
> index 000000000000..45d84a62f185
> --- /dev/null
> +++ b/Documentation/gpu/xe/xe_sigid.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +========
> +Xe SIGID
> +========
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> +   :doc: Xe Error Signatures (SIGID)
> +
> +Signature Identifiers
> +=====================
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> +   :internal:
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 44ed055439d4..92134709d998 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -87,6 +87,7 @@ xe-y += xe_bb.o \
>   	xe_hw_fence.o \
>   	xe_irq.o \
>   	xe_late_bind_fw.o \
> +	xe_log.o \
>   	xe_lrc.o \
>   	xe_mem_pool.o \
>   	xe_migrate.o \
> diff --git a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> new file mode 100644
> index 000000000000..93967183ae51
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> @@ -0,0 +1,159 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _ABI_XE_SIGID_ABI_H_
> +#define _ABI_XE_SIGID_ABI_H_
> +
> +/**
> + * DOC: Xe Error Signatures (SIGID)
> + *
> + * What SIGID stands for
> + * ---------------------
> + *
> + * SIGID is short for *Signature Identifier*. It is a small, stable integer
> + * that names one of *recognised fault site* -- nothing more. It is the
> + * primary handle used for triage and maps directly to specific report site.
> + *
> + * Numbering
> + * ---------
> + *
> + * SIGIDs are a single flat list numbered sequentially within the assigned range,
> + * in the order the fault sites were introduced. Values are stable: once assigned
> + * they are only ever appended, never renumbered or reused. A retired fault site
> + * SIGID value is deprecated in place, never re-purposed.
> + *
> + * Why this exists
> + * ---------------
> + *
> + * Today the driver reports faults with ad-hoc ``xe_err()`` / ``xe_gt_err()``
> + * strings that have no stable shape. That is fine for a human reading dmesg,
> + * but it gives fleet tooling nothing durable to match on: the wording changes
> + * between releases, lines can be rate-limited or dropped under an error storm,
> + * and there is no consistent way to ask "which recognised fault just happened?"
> + *
> + * A SIGID answers exactly that one question, identically across driver and
> + * firmware versions, and (eventually) across other Intel devices in a node.
> + *
> + * What a SIGID is not
> + * -------------------
> + *
> + * SIGID deliberately does not encode the detailed reason or the outcome. Those
> + * are carried alongside it::
> + *
> + *   SIGID    -> which recognised fault site is being reported
> + *   severity -> how serious this instance is
> + *   errno    -> the failing operation's error, if available, shown with %pe
> + *   message  -> free-form human-readable context
> + *
> + * Severity is independent of the SIGID. The same SIGID can be reported at
> + * different severities depending on the instance and the recovery taken.
> + *
> + * When to use SIGID logging
> + * -------------------------
> + *
> + * The xe_log_*() helpers are for these recognised fault sites only --
> + * important, operator-relevant faults and events. The driver's only job is to
> + * emit the right SIGID next to the usual human-readable text.
> +
> + * They are not a replacement for ``xe_info()`` / ``xe_dbg()`` / tracing, nor
> + * for one-off diagnostics; using them for ordinary logging would dilute the
> + * fault stream. Not every ``xe_err()`` needs to become a SIGID report -- only
> + * those that correspond to a published fault sites.
> + *
> + * SIGID log output (dmesg vs. the machine record)
> + * -----------------------------------------------
> + *
> + * The dmesg line stays close to a normal xe error message so it remains
> + * readable for admins; the only stable, machine-matchable token on it is
> + * ``SIGID=<n>`` (``dmesg | grep SIGID=``).
> + *
> + * The full dmesg line is not an ABI: the surrounding text may change freely,
> + * and lines may be dropped. The durable record for tooling is the CPER record
> + * carrying the same SIGID (generation is a planned follow-up).
> + *
> + * How to pick a SIGID (the uniqueness rule)
> + * -----------------------------------------
> + *
> + * Pick per *report site*, not per incident. Each site emits the single most
> + * specific recognised SIGID *for that site* -- so the question is never
> + * "classify this whole failure", it is "what does this site detect?", which has + * one answer. A single underlying failure therefore 
> legitimately produces a + * *chain* of reports from different layers, 
> each with its own SIGID -- e.g. a + * GuC communication failure is 
> reported as %XE_SIGID_RUNTIME_FW by the firmware + * path, the failed 
> recovery as %XE_SIGID_GT_TDR by the reset path, and an + * aborted 
> bind as %XE_SIGID_PROBE by the probe path. That chain lets triage + * 
> follow a fault from origin to final effect; it is not a duplicate. + * 
> + * If a site does not match any defined SIGID, keep using the 
> ordinary + * ``xe_err()`` / ``xe_gt_err()`` logging rather than 
> forcing a SIGID: a wrong + * or over-broad classification is harder to 
> retire than a missing one. When a + * new report site is genuinely 
> worth triaging, add it to the list below. + * + * Usage of the 
> existing SIGID reports must reevaluated according to this section + * 
> after making significant changes to the site that emits this SIGID. + 
> * + * Scope: software vs hardware emitted signatures + * 
> ---------------------------------------------- + * + * Some SIGID 
> represents fault sites that the *driver itself* detects and + * 
> reports from the software POV: probe abort, wedged, survivability, 
> driver- + * detected firmware failures, engine TDR, memory faults and 
> IO/bus faults. + * These are the only values the driver assigns on its 
> own. + * + * Signatures that *originate* in firmware or hardware are a 
> different thing: + * they are produced and identified by the firmware 
> or the hardware itself + * (e.g. via their own records or error 
> counters), and the driver merely logs + * them as they are given to 
> us. They are deliberately enumerated separately. + * + * The two 
> driver-detected firmware report sites below (%XE_SIGID_RUNTIME_FW, + * 
> %XE_SIGID_DEVICE_FW) are software signatures: they mark that *the 
> driver* + * observed a firmware problem, not a signature reported by 
> the firmware. + */ + +/* + * Top level Intel Error Signature 
> Identifiers. + */ +#define INTEL_SIGID_INVALID 0 +#define 
> INTEL_SIGID_BATCH 100 +#define INTEL_SIGID_RANGE_START(n) ((n) * 
> INTEL_SIGID_BATCH) +#define INTEL_SIGID_RANGE_END(n) 
> (INTEL_SIGID_RANGE_START((n) + 1) - 1) + +/* SIGIDs 1xx are reserved 
> for Xe GPU software and 2xx for Xe GPU hardware */ +#define 
> INTEL_SIGID_GPU_XE_SOFTWARE_START INTEL_SIGID_RANGE_START(1) +#define 
> INTEL_SIGID_GPU_XE_SOFTWARE_END INTEL_SIGID_RANGE_END(1) +#define 
> INTEL_SIGID_GPU_XE_HARDWARE_START INTEL_SIGID_RANGE_START(2) +#define 
> INTEL_SIGID_GPU_XE_HARDWARE_END INTEL_SIGID_RANGE_END(2) + +/** + * 
> enum xe_sigid - Stable Xe Error Signature Identifiers (SIGID). + * 
> @XE_SIGID_SW: Software component failure. + * @XE_SIGID_PROBE: Device 
> probe/bind was aborted. + * @XE_SIGID_WEDGED: Device was declared 
> wedged and is no longer usable. + * @XE_SIGID_SURVIVABILITY: Device 
> entered survivability mode. + * @XE_SIGID_RUNTIME_FW: Driver-detected 
> runtime firmware failure, GuC/HuC/GSC. + * @XE_SIGID_DEVICE_FW: 
> Driver-detected device firmware failure, PCODE/sysctrl. + * 
> @XE_SIGID_GT_TDR: Engine hang / timeout detection and recovery 
> (reset). + * @XE_SIGID_MEM_FAULT: VM bind, page fault or GTT fault. + 
> * @XE_SIGID_IO_BUS: Runtime PCIe / IOMMU / MMIO access fault. + * + * 
> Each SIGID represents the report sites the driver detects and reports. 
> + * Values are numbered sequentially, are only ever appended, and are 
> never + * renumbered or reused. + * + * Firmware- and 
> hardware-originated signatures are not listed yet here. + */ +enum 
> xe_sigid { + XE_SIGID_SW = INTEL_SIGID_GPU_XE_SOFTWARE_START, + 
> XE_SIGID_PROBE = INTEL_SIGID_GPU_XE_SOFTWARE_START + 1, + 
> XE_SIGID_WEDGED = INTEL_SIGID_GPU_XE_SOFTWARE_START + 2, + 
> XE_SIGID_SURVIVABILITY = INTEL_SIGID_GPU_XE_SOFTWARE_START + 3, + 
> XE_SIGID_RUNTIME_FW = INTEL_SIGID_GPU_XE_SOFTWARE_START + 4, + 
> XE_SIGID_DEVICE_FW = INTEL_SIGID_GPU_XE_SOFTWARE_START + 5, + 
> XE_SIGID_GT_TDR = INTEL_SIGID_GPU_XE_SOFTWARE_START + 6, + 
> XE_SIGID_MEM_FAULT = INTEL_SIGID_GPU_XE_SOFTWARE_START + 7, + 
> XE_SIGID_IO_BUS = INTEL_SIGID_GPU_XE_SOFTWARE_START + 8, +}; + +#endif 
> diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c 
> new file mode 100644 index 000000000000..ae4f6e33f5b8 --- /dev/null 
> +++ b/drivers/gpu/drm/xe/xe_log.c @@ -0,0 +1,138 @@ +// 
> SPDX-License-Identifier: MIT +/* + * Copyright © 2026 Intel 
> Corporation + */ + +#include "xe_log.h"
> +#include "xe_printk.h"
> +
> +static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +			  u32 component, u32 location, const void *data, size_t len,
> +			  struct va_format *vaf)
> +{
> +	/* TODO */

Just for information, CPER log construction for hardware errors involves 
a system controller mailbox interaction, with the error_class passed via 
the data payload.

> +}
> +
> +static bool is_hw_sigid(enum xe_sigid sigid)
> +{
> +	return (int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START;
> +}
> +
> +static bool is_sev_error(int cper_sev)
> +{
> +	return cper_sev != CPER_SEV_INFORMATIONAL;
> +}
> +
> +static const char *log_hwe_prefix(int cper_sev, enum xe_sigid sigid)
> +{
> +	return is_sev_error(cper_sev) && is_hw_sigid(sigid) ? HW_ERR : "";
> +}
> +
> +static const char *log_sev_prefix(int cper_sev)
> +{
> +	switch (cper_sev) {
> +	case CPER_SEV_FATAL:
> +		return "FATAL ";
> +	case CPER_SEV_RECOVERABLE:
> +		return "";

Can we print "RECOVERABLE" here? In my earlier comment I mistakenly used 
"CORRECTABLE"; I meant "RECOVERABLE".

Thanks,
Badal

> +	case CPER_SEV_CORRECTED:
> +		return "CORRECTED ";
> +	case CPER_SEV_INFORMATIONAL:
> +		return "";
> +	default:
> +		WARN(IS_ENABLED(CONFIG_DRM_XE_DEBUG), "LOG: unknown severity %d\n", cper_sev);
> +		return "";
> +	}
> +}
> +
> +#define __LOG_DRM_PRINTK_FMT(fmt, args...)	"[drm] " fmt, ##args
> +#define __LOG_DRM_PRINTK_ERR_FMT(fmt, args...)	__LOG_DRM_PRINTK_FMT("*ERROR* " fmt, args)
> +
> +static void log_dmesg_vprintk(struct pci_dev *pdev, int cper_sev, struct va_format *vaf)
> +{
> +	if (cper_sev == CPER_SEV_INFORMATIONAL)
> +		pci_info(pdev, __LOG_DRM_PRINTK_FMT("%pV", vaf));
> +	else
> +		pci_err(pdev, __LOG_DRM_PRINTK_ERR_FMT("%pV", vaf));
> +}
> +
> +static void log_dmesg_printf(struct pci_dev *pdev, int cper_sev, const char *fmt, ...)
> +{
> +	struct va_format vaf;
> +	va_list args;
> +
> +	va_start(args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &args;
> +
> +	log_dmesg_vprintk(pdev, cper_sev, &vaf);
> +
> +	va_end(args);
> +}
> +
> +static void log_emit_dmesg(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +			   u32 component, u32 location, const void *data, size_t len,
> +			   struct va_format *vaf)
> +{
> +	const char *hwe_prefix = log_hwe_prefix(cper_sev, sigid);
> +	const char *sev_prefix = log_sev_prefix(cper_sev);
> +
> +	/* TODO: add component/location details */
> +
> +	if (IS_ERR(data))
> +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%pe) %s%pV",
> +				 sigid, sev_prefix, data, hwe_prefix, vaf);
> +	else if (data && len)
> +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%*phN) %s%pV",
> +				 sigid, sev_prefix, (int)len, data, hwe_prefix, vaf);
> +	else
> +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s%s%pV",
> +				 sigid, sev_prefix, hwe_prefix, vaf);
> +}
> +
> +/**
> + * xe_log_emit() - Emit a structured SIGID log entry
> + * @pdev: the &pci_dev device
> + * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, ...)
> + * @sigid: signature identifier, see &enum xe_sigid
> + * @component: component identifer
> + * @location: location details of the @component
> + * @data: pointer to the additional details, or ERR_PTR, or NULL if not applicable
> + * @len: length of the @data in bytes, or 0 if not applicable
> + * @fmt: printf-style format string
> + * @...: format arguments
> + *
> + * Emits a dmesg line that includes a single stable, machine-matchable token
> + * ``SIGID=<n>`` followed by the optional severity token (like ``FATAL``) and,
> + * when @data pointer is set, either the error printed with %pe or a packed hex
> + * dump of the @data binary blob. The dmesg line will also include printf-style
> + * text message.
> + *
> + * Note that the full dmesg line, with the free text message, is only a debugging
> + * aid, not an interface! Only the ``SIGID=<n>`` token is stable there.
> + * The durable machine record is the CPER carrying the same SIGID.
> + *
> + * Note: generation of the CPER record is a planned follow-up.
> + *
> + * Examples::
> + *
> + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=104 FATAL (-EPROTO) Invalid GuC reply
> + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=106 (-ETIMEDOUT) Engine 'rcs0' hung
> + *   <6> xe 0000:03:00.0: [drm] SIGID=103 In survivability mode
> + */
> +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +		 u32 component, u32 location, const void *data, size_t len,
> +		 const char *fmt, ...)
> +{
> +	struct va_format vaf;
> +	va_list args;
> +
> +	va_start(args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &args;
> +
> +	log_emit_dmesg(pdev, cper_sev, sigid, component, location, data, len, &vaf);
> +	log_emit_cper(pdev, cper_sev, sigid, component, location, data, len, &vaf);
> +
> +	va_end(args);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
> new file mode 100644
> index 000000000000..d475e816ee0b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_log.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_LOG_H_
> +#define _XE_LOG_H_
> +
> +#include <linux/cper.h>
> +
> +#include "abi/xe_sigid_abi.h"
> +
> +struct pci_dev;
> +
> +__printf(8, 9)
> +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +		 u32 component, u32 location, const void *data, size_t len,
> +		 const char *fmt, ...);
> +
> +#endif
--------------CFLAYzarII07ycZWJ5LS6nLU
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p>
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
      <div style=3D"font-family:'Segoe UI';font-size:14px;font-style:normal=
;font-weight:400;line-height:20px"><font face=3D"monospace">Adding a few mo=
re review comments.</font></div>
      <br>
    </p>
    <div class=3D"moz-cite-prefix">On 13-08-2026 00:44, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20260812191450.11690-3-michal.waj=
deczko@intel.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">From: Mallesh Koujalagi <a cla=
ss=3D"moz-txt-link-rfc2396E" href=3D"mailto:mallesh.koujalagi@intel.com">&l=
t;mallesh.koujalagi@intel.com&gt;</a>

Today the driver reports faults with ad-hoc drm_err()/xe_gt_err()
strings that have no stable shape. That is readable for a human, but it
gives fleet tooling nothing durable to match on: the wording changes
between releases, lines can be rate-limited or dropped under an error
storm, and there is no consistent way to ask &quot;which recognised fault
just happened?&quot;.

Introduce a signature identifier (SIGID): a small, stable integer that
names one recognised Xe fault site and serves as the primary handle for
triage. A SIGID maps, through published end-user documentation, to a
description and a recommended action; the driver only has to emit the
right SIGID next to the usual human-readable text.

Signed-off-by: Mallesh Koujalagi <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:mallesh.koujalagi@intel.com">&lt;mallesh.koujalagi@intel.com&gt;</a=
>
Assisted-by: Copilot:Opus-4.8
Signed-off-by: Rodrigo Vivi <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
Co-developed-by: Michal Wajdeczko <a class=3D"moz-txt-link-rfc2396E" href=
=3D"mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</=
a>
Signed-off-by: Michal Wajdeczko <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Riana Tauro <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:riana.tau=
ro@intel.com">&lt;riana.tauro@intel.com&gt;</a>
Cc: Stuart Summers <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:stuart=
.summers@intel.com">&lt;stuart.summers@intel.com&gt;</a>
---
Cc: Yoni Levitt <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:yoni.levi=
tt@intel.com">&lt;yoni.levitt@intel.com&gt;</a>
Cc: Aravind Iddamsetty <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:ar=
avind.iddamsetty@intel.com">&lt;aravind.iddamsetty@intel.com&gt;</a>
Cc: Raag Jadav <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:raag.jadav=
@intel.com">&lt;raag.jadav@intel.com&gt;</a>
---
v2: CORRECTED is still an error (Michal)
    prepare to decorate dmesg with comp/loc (Michal)
v3: update SIGID DOC section (Riana/Aravind)
    warn about unknown severity (Mallesh)
---
 Documentation/gpu/xe/index.rst        |   1 +
 Documentation/gpu/xe/xe_sigid.rst     |  14 +++
 drivers/gpu/drm/xe/Makefile           |   1 +
 drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 159 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_log.c           | 138 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_log.h           |  20 ++++
 6 files changed, 333 insertions(+)
 create mode 100644 Documentation/gpu/xe/xe_sigid.rst
 create mode 100644 drivers/gpu/drm/xe/abi/xe_sigid_abi.h
 create mode 100644 drivers/gpu/drm/xe/xe_log.c
 create mode 100644 drivers/gpu/drm/xe/xe_log.h

diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rs=
t
index 665c0e93601c..0247a255f7e6 100644
--- a/Documentation/gpu/xe/index.rst
+++ b/Documentation/gpu/xe/index.rst
@@ -35,3 +35,4 @@ The display, or :ref:`drm-kms`, support for drm/xe is pro=
vided by
    xe-drm-usage-stats.rst
    xe_configfs
    xe_gt_stats
+   xe_sigid
diff --git a/Documentation/gpu/xe/xe_sigid.rst b/Documentation/gpu/xe/xe_si=
gid.rst
new file mode 100644
index 000000000000..45d84a62f185
--- /dev/null
+++ b/Documentation/gpu/xe/xe_sigid.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+=3D=3D=3D=3D=3D=3D=3D=3D
+Xe SIGID
+=3D=3D=3D=3D=3D=3D=3D=3D
+
+.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
+   :doc: Xe Error Signatures (SIGID)
+
+Signature Identifiers
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
+   :internal:
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 44ed055439d4..92134709d998 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -87,6 +87,7 @@ xe-y +=3D xe_bb.o \
 	xe_hw_fence.o \
 	xe_irq.o \
 	xe_late_bind_fw.o \
+	xe_log.o \
 	xe_lrc.o \
 	xe_mem_pool.o \
 	xe_migrate.o \
diff --git a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h b/drivers/gpu/drm/xe/abi=
/xe_sigid_abi.h
new file mode 100644
index 000000000000..93967183ae51
--- /dev/null
+++ b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
@@ -0,0 +1,159 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright =C2=A9 2026 Intel Corporation
+ */
+
+#ifndef _ABI_XE_SIGID_ABI_H_
+#define _ABI_XE_SIGID_ABI_H_
+
+/**
+ * DOC: Xe Error Signatures (SIGID)
+ *
+ * What SIGID stands for
+ * ---------------------
+ *
+ * SIGID is short for *Signature Identifier*. It is a small, stable intege=
r
+ * that names one of *recognised fault site* -- nothing more. It is the
+ * primary handle used for triage and maps directly to specific report sit=
e.
+ *
+ * Numbering
+ * ---------
+ *
+ * SIGIDs are a single flat list numbered sequentially within the assigned=
 range,
+ * in the order the fault sites were introduced. Values are stable: once a=
ssigned
+ * they are only ever appended, never renumbered or reused. A retired faul=
t site
+ * SIGID value is deprecated in place, never re-purposed.
+ *
+ * Why this exists
+ * ---------------
+ *
+ * Today the driver reports faults with ad-hoc ``xe_err()`` / ``xe_gt_err(=
)``
+ * strings that have no stable shape. That is fine for a human reading dme=
sg,
+ * but it gives fleet tooling nothing durable to match on: the wording cha=
nges
+ * between releases, lines can be rate-limited or dropped under an error s=
torm,
+ * and there is no consistent way to ask &quot;which recognised fault just=
 happened?&quot;
+ *
+ * A SIGID answers exactly that one question, identically across driver an=
d
+ * firmware versions, and (eventually) across other Intel devices in a nod=
e.
+ *
+ * What a SIGID is not
+ * -------------------
+ *
+ * SIGID deliberately does not encode the detailed reason or the outcome. =
Those
+ * are carried alongside it::
+ *
+ *   SIGID    -&gt; which recognised fault site is being reported
+ *   severity -&gt; how serious this instance is
+ *   errno    -&gt; the failing operation's error, if available, shown wit=
h %pe
+ *   message  -&gt; free-form human-readable context
+ *
+ * Severity is independent of the SIGID. The same SIGID can be reported at
+ * different severities depending on the instance and the recovery taken.
+ *
+ * When to use SIGID logging
+ * -------------------------
+ *
+ * The xe_log_*() helpers are for these recognised fault sites only --
+ * important, operator-relevant faults and events. The driver's only job i=
s to
+ * emit the right SIGID next to the usual human-readable text.
+
+ * They are not a replacement for ``xe_info()`` / ``xe_dbg()`` / tracing, =
nor
+ * for one-off diagnostics; using them for ordinary logging would dilute t=
he
+ * fault stream. Not every ``xe_err()`` needs to become a SIGID report -- =
only
+ * those that correspond to a published fault sites.
+ *
+ * SIGID log output (dmesg vs. the machine record)
+ * -----------------------------------------------
+ *
+ * The dmesg line stays close to a normal xe error message so it remains
+ * readable for admins; the only stable, machine-matchable token on it is
+ * ``SIGID=3D&lt;n&gt;`` (``dmesg | grep SIGID=3D``).
+ *
+ * The full dmesg line is not an ABI: the surrounding text may change free=
ly,
+ * and lines may be dropped. The durable record for tooling is the CPER re=
cord
+ * carrying the same SIGID (generation is a planned follow-up).
+ *
+ * How to pick a SIGID (the uniqueness rule)
+ * -----------------------------------------
+ *
+ * Pick per *report site*, not per incident. Each site emits the single mo=
st
+ * specific recognised SIGID *for that site* -- so the question is never
+ * &quot;classify this whole failure&quot;, it is &quot;what does this sit=
e detect?<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:,whichhas+*onean=
swer.Asingleunderlyingfailurethereforelegitimatelyproducesa+**chain*ofrepor=
tsfromdifferentlayers,eachwithitsownSIGID--e.g.a+*GuCcommunicationfailureis=
reportedas%XE_SIGID_RUNTIME_FWbythefirmware+*path,thefailedrecoveryas%XE_SI=
GID_GT_TDRbytheresetpath,andan+*abortedbindas%XE_SIGID_PROBEbytheprobepath.=
Thatchainletstriage+*followafaultfromorigintofinaleffect;itisnotaduplicate.=
+*+*IfasitedoesnotmatchanydefinedSIGID,keepusingtheordinary+*``xe_err()``/`=
`xe_gt_err()``loggingratherthanforcingaSIGID:awrong+*orover-broadclassifica=
tionishardertoretirethanamissingone.Whena+*newreportsiteisgenuinelyworthtri=
aging,addittothelistbelow.+*+*UsageoftheexistingSIGIDreportsmustreevaluated=
accordingtothissection+*aftermakingsignificantchangestothesitethatemitsthis=
SIGID.+*+*Scope:softwarevshardwareemittedsignatures+*----------------------=
------------------------+*+*SomeSIGIDrepresentsfaultsitesthatthe*driveritse=
lf*detectsand+*reportsfromthesoftwarePOV:probeabort,wedged,survivability,dr=
iver-+*detectedfirmwarefailures,engineTDR,memoryfaultsandIO/busfaults.+*The=
searetheonlyvaluesthedriverassignsonitsown.+*+*Signaturesthat*originate*inf=
irmwareorhardwareareadifferentthing:+*theyareproducedandidentifiedbythefirm=
wareorthehardwareitself+*(e.g.viatheirownrecordsorerrorcounters),andthedriv=
ermerelylogs+*themastheyaregiventous.Theyaredeliberatelyenumeratedseparatel=
y.+*+*Thetwodriver-detectedfirmwarereportsitesbelow(%XE_SIGID_RUNTIME_FW,+*=
%XE_SIGID_DEVICE_FW)aresoftwaresignatures:theymarkthat*thedriver*+*observed=
afirmwareproblem,notasignaturereportedbythefirmware.+*/++/*+*ToplevelIntelE=
rrorSignatureIdentifiers.+*/+#defineINTEL_SIGID_INVALID0+#defineINTEL_SIGID=
_BATCH100+#defineINTEL_SIGID_RANGE_START(n)((n)*INTEL_SIGID_BATCH)+#defineI=
NTEL_SIGID_RANGE_END(n)(INTEL_SIGID_RANGE_START((n)+1)-1)++/*SIGIDs1xxarere=
servedforXeGPUsoftwareand2xxforXeGPUhardware*/+#defineINTEL_SIGID_GPU_XE_SO=
FTWARE_STARTINTEL_SIGID_RANGE_START(1)+#defineINTEL_SIGID_GPU_XE_SOFTWARE_E=
NDINTEL_SIGID_RANGE_END(1)+#defineINTEL_SIGID_GPU_XE_HARDWARE_STARTINTEL_SI=
GID_RANGE_START(2)+#defineINTEL_SIGID_GPU_XE_HARDWARE_ENDINTEL_SIGID_RANGE_=
END(2)++/**+*enumxe_sigid-StableXeErrorSignatureIdentifiers(SIGID).+*@XE_SI=
GID_SW:Softwarecomponentfailure.+*@XE_SIGID_PROBE:Deviceprobe/bindwasaborte=
d.+*@XE_SIGID_WEDGED:Devicewasdeclaredwedgedandisnolongerusable.+*@XE_SIGID=
_SURVIVABILITY:Deviceenteredsurvivabilitymode.+*@XE_SIGID_RUNTIME_FW:Driver=
-detectedruntimefirmwarefailure,GuC/HuC/GSC.+*@XE_SIGID_DEVICE_FW:Driver-de=
tecteddevicefirmwarefailure,PCODE/sysctrl.+*@XE_SIGID_GT_TDR:Enginehang/tim=
eoutdetectionandrecovery(reset).+*@XE_SIGID_MEM_FAULT:VMbind,pagefaultorGTT=
fault.+*@XE_SIGID_IO_BUS:RuntimePCIe/IOMMU/MMIOaccessfault.+*+*EachSIGIDrep=
resentsthereportsitesthedriverdetectsandreports.+*Valuesarenumberedsequenti=
ally,areonlyeverappended,andarenever+*renumberedorreused.+*+*Firmware-andha=
rdware-originatedsignaturesarenotlistedyethere.+*/+enumxe_sigid{+XE_SIGID_S=
W=3DINTEL_SIGID_GPU_XE_SOFTWARE_START,+XE_SIGID_PROBE=3DINTEL_SIGID_GPU_XE_=
SOFTWARE_START+1,+XE_SIGID_WEDGED=3DINTEL_SIGID_GPU_XE_SOFTWARE_START+2,+XE=
_SIGID_SURVIVABILITY=3DINTEL_SIGID_GPU_XE_SOFTWARE_START+3,+XE_SIGID_RUNTIM=
E_FW=3DINTEL_SIGID_GPU_XE_SOFTWARE_START+4,+XE_SIGID_DEVICE_FW=3DINTEL_SIGI=
D_GPU_XE_SOFTWARE_START+5,+XE_SIGID_GT_TDR=3DINTEL_SIGID_GPU_XE_SOFTWARE_ST=
ART+6,+XE_SIGID_MEM_FAULT=3DINTEL_SIGID_GPU_XE_SOFTWARE_START+7,+XE_SIGID_I=
O_BUS=3DINTEL_SIGID_GPU_XE_SOFTWARE_START+8,+};++#endifdiff--gita/drivers/g=
pu/drm/xe/xe_log.cb/drivers/gpu/drm/xe/xe_log.cnewfilemode100644index000000=
000000..ae4f6e33f5b8---/dev/null+++b/drivers/gpu/drm/xe/xe_log.c@@-0,0+1,13=
8@@+//SPDX-License-Identifier:MIT+/*+*Copyright=C2=A92026IntelCorporation+*=
/++#include">&quot;, which has
+ * one answer. A single underlying failure therefore legitimately produces=
 a
+ * *chain* of reports from different layers, each with its own SIGID -- e.=
g. a
+ * GuC communication failure is reported as %XE_SIGID_RUNTIME_FW by the fi=
rmware
+ * path, the failed recovery as %XE_SIGID_GT_TDR by the reset path, and an
+ * aborted bind as %XE_SIGID_PROBE by the probe path. That chain lets tria=
ge
+ * follow a fault from origin to final effect; it is not a duplicate.
+ *
+ * If a site does not match any defined SIGID, keep using the ordinary
+ * ``xe_err()`` / ``xe_gt_err()`` logging rather than forcing a SIGID: a w=
rong
+ * or over-broad classification is harder to retire than a missing one. Wh=
en a
+ * new report site is genuinely worth triaging, add it to the list below.
+ *
+ * Usage of the existing SIGID reports must reevaluated according to this =
section
+ * after making significant changes to the site that emits this SIGID.
+ *
+ * Scope: software vs hardware emitted signatures
+ * ----------------------------------------------
+ *
+ * Some SIGID represents fault sites that the *driver itself* detects and
+ * reports from the software POV: probe abort, wedged, survivability, driv=
er-
+ * detected firmware failures, engine TDR, memory faults and IO/bus faults=
.
+ * These are the only values the driver assigns on its own.
+ *
+ * Signatures that *originate* in firmware or hardware are a different thi=
ng:
+ * they are produced and identified by the firmware or the hardware itself
+ * (e.g. via their own records or error counters), and the driver merely l=
ogs
+ * them as they are given to us. They are deliberately enumerated separate=
ly.
+ *
+ * The two driver-detected firmware report sites below (%XE_SIGID_RUNTIME_=
FW,
+ * %XE_SIGID_DEVICE_FW) are software signatures: they mark that *the drive=
r*
+ * observed a firmware problem, not a signature reported by the firmware.
+ */
+
+/*
+ * Top level Intel Error Signature Identifiers.
+ */
+#define INTEL_SIGID_INVALID			0
+#define INTEL_SIGID_BATCH			100
+#define INTEL_SIGID_RANGE_START(n)		((n) * INTEL_SIGID_BATCH)
+#define INTEL_SIGID_RANGE_END(n)		(INTEL_SIGID_RANGE_START((n) + 1) - 1)
+
+/* SIGIDs 1xx are reserved for Xe GPU software and 2xx for Xe GPU hardware=
 */
+#define INTEL_SIGID_GPU_XE_SOFTWARE_START	INTEL_SIGID_RANGE_START(1)
+#define INTEL_SIGID_GPU_XE_SOFTWARE_END		INTEL_SIGID_RANGE_END(1)
+#define INTEL_SIGID_GPU_XE_HARDWARE_START	INTEL_SIGID_RANGE_START(2)
+#define INTEL_SIGID_GPU_XE_HARDWARE_END		INTEL_SIGID_RANGE_END(2)
+
+/**
+ * enum xe_sigid - Stable Xe Error Signature Identifiers (SIGID).
+ * @XE_SIGID_SW: Software component failure.
+ * @XE_SIGID_PROBE: Device probe/bind was aborted.
+ * @XE_SIGID_WEDGED: Device was declared wedged and is no longer usable.
+ * @XE_SIGID_SURVIVABILITY: Device entered survivability mode.
+ * @XE_SIGID_RUNTIME_FW: Driver-detected runtime firmware failure, GuC/HuC=
/GSC.
+ * @XE_SIGID_DEVICE_FW: Driver-detected device firmware failure, PCODE/sys=
ctrl.
+ * @XE_SIGID_GT_TDR: Engine hang / timeout detection and recovery (reset).
+ * @XE_SIGID_MEM_FAULT: VM bind, page fault or GTT fault.
+ * @XE_SIGID_IO_BUS: Runtime PCIe / IOMMU / MMIO access fault.
+ *
+ * Each SIGID represents the report sites the driver detects and reports.
+ * Values are numbered sequentially, are only ever appended, and are never
+ * renumbered or reused.
+ *
+ * Firmware- and hardware-originated signatures are not listed yet here.
+ */
+enum xe_sigid {
+	XE_SIGID_SW			=3D INTEL_SIGID_GPU_XE_SOFTWARE_START,
+	XE_SIGID_PROBE			=3D INTEL_SIGID_GPU_XE_SOFTWARE_START + 1,
+	XE_SIGID_WEDGED			=3D INTEL_SIGID_GPU_XE_SOFTWARE_START + 2,
+	XE_SIGID_SURVIVABILITY		=3D INTEL_SIGID_GPU_XE_SOFTWARE_START + 3,
+	XE_SIGID_RUNTIME_FW		=3D INTEL_SIGID_GPU_XE_SOFTWARE_START + 4,
+	XE_SIGID_DEVICE_FW		=3D INTEL_SIGID_GPU_XE_SOFTWARE_START + 5,
+	XE_SIGID_GT_TDR			=3D INTEL_SIGID_GPU_XE_SOFTWARE_START + 6,
+	XE_SIGID_MEM_FAULT		=3D INTEL_SIGID_GPU_XE_SOFTWARE_START + 7,
+	XE_SIGID_IO_BUS			=3D INTEL_SIGID_GPU_XE_SOFTWARE_START + 8,
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
new file mode 100644
index 000000000000..ae4f6e33f5b8
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_log.c
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright =C2=A9 2026 Intel Corporation
+ */
+
+#include &quot;</a>xe_log.h&quot;
+#include &quot;xe_printk.h&quot;
+
+static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigi=
d sigid,
+			  u32 component, u32 location, const void *data, size_t len,
+			  struct va_format *vaf)
+{
+	/* TODO */</pre>
    </blockquote>
    <p><font face=3D"monospace">Just for information, CPER log
        construction for hardware errors involves a system controller
        mailbox interaction, with the error_class passed via the data
        payload.</font></p>
    <blockquote type=3D"cite" cite=3D"mid:20260812191450.11690-3-michal.waj=
deczko@intel.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
+}
+
+static bool is_hw_sigid(enum xe_sigid sigid)
+{
+	return (int)sigid &gt;=3D INTEL_SIGID_GPU_XE_HARDWARE_START;
+}
+
+static bool is_sev_error(int cper_sev)
+{
+	return cper_sev !=3D CPER_SEV_INFORMATIONAL;
+}
+
+static const char *log_hwe_prefix(int cper_sev, enum xe_sigid sigid)
+{
+	return is_sev_error(cper_sev) &amp;&amp; is_hw_sigid(sigid) ? HW_ERR : &q=
uot;&quot;;
+}
+
+static const char *log_sev_prefix(int cper_sev)
+{
+	switch (cper_sev) {
+	case CPER_SEV_FATAL:
+		return &quot;FATAL &quot;;
+	case CPER_SEV_RECOVERABLE:
+		return &quot;&quot;;</pre>
    </blockquote>
    <p><font face=3D"monospace">Can we print &quot;RECOVERABLE&quot; here? =
In my
        earlier comment I mistakenly used &quot;CORRECTABLE&quot;; I meant
        &quot;RECOVERABLE&quot;.</font></p>
    <p><font face=3D"monospace">Thanks,<br>
        Badal</font></p>
    <blockquote type=3D"cite" cite=3D"mid:20260812191450.11690-3-michal.waj=
deczko@intel.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
+	case CPER_SEV_CORRECTED:
+		return &quot;CORRECTED &quot;;
+	case CPER_SEV_INFORMATIONAL:
+		return &quot;&quot;;
+	default:
+		WARN(IS_ENABLED(CONFIG_DRM_XE_DEBUG), &quot;LOG: unknown severity %d\n&q=
uot;, cper_sev);
+		return &quot;&quot;;
+	}
+}
+
+#define __LOG_DRM_PRINTK_FMT(fmt, args...)	&quot;[drm] &quot; fmt, ##args
+#define __LOG_DRM_PRINTK_ERR_FMT(fmt, args...)	__LOG_DRM_PRINTK_FMT(&quot;=
*ERROR* &quot; fmt, args)
+
+static void log_dmesg_vprintk(struct pci_dev *pdev, int cper_sev, struct v=
a_format *vaf)
+{
+	if (cper_sev =3D=3D CPER_SEV_INFORMATIONAL)
+		pci_info(pdev, __LOG_DRM_PRINTK_FMT(&quot;%pV&quot;, vaf));
+	else
+		pci_err(pdev, __LOG_DRM_PRINTK_ERR_FMT(&quot;%pV&quot;, vaf));
+}
+
+static void log_dmesg_printf(struct pci_dev *pdev, int cper_sev, const cha=
r *fmt, ...)
+{
+	struct va_format vaf;
+	va_list args;
+
+	va_start(args, fmt);
+	vaf.fmt =3D fmt;
+	vaf.va =3D &amp;args;
+
+	log_dmesg_vprintk(pdev, cper_sev, &amp;vaf);
+
+	va_end(args);
+}
+
+static void log_emit_dmesg(struct pci_dev *pdev, int cper_sev, enum xe_sig=
id sigid,
+			   u32 component, u32 location, const void *data, size_t len,
+			   struct va_format *vaf)
+{
+	const char *hwe_prefix =3D log_hwe_prefix(cper_sev, sigid);
+	const char *sev_prefix =3D log_sev_prefix(cper_sev);
+
+	/* TODO: add component/location details */
+
+	if (IS_ERR(data))
+		log_dmesg_printf(pdev, cper_sev, &quot;SIGID=3D%u %s(%pe) %s%pV&quot;,
+				 sigid, sev_prefix, data, hwe_prefix, vaf);
+	else if (data &amp;&amp; len)
+		log_dmesg_printf(pdev, cper_sev, &quot;SIGID=3D%u %s(%*phN) %s%pV&quot;,
+				 sigid, sev_prefix, (int)len, data, hwe_prefix, vaf);
+	else
+		log_dmesg_printf(pdev, cper_sev, &quot;SIGID=3D%u %s%s%pV&quot;,
+				 sigid, sev_prefix, hwe_prefix, vaf);
+}
+
+/**
+ * xe_log_emit() - Emit a structured SIGID log entry
+ * @pdev: the &amp;pci_dev device
+ * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, ...)
+ * @sigid: signature identifier, see &amp;enum xe_sigid
+ * @component: component identifer
+ * @location: location details of the @component
+ * @data: pointer to the additional details, or ERR_PTR, or NULL if not ap=
plicable
+ * @len: length of the @data in bytes, or 0 if not applicable
+ * @fmt: printf-style format string
+ * @...: format arguments
+ *
+ * Emits a dmesg line that includes a single stable, machine-matchable tok=
en
+ * ``SIGID=3D&lt;n&gt;`` followed by the optional severity token (like ``F=
ATAL``) and,
+ * when @data pointer is set, either the error printed with %pe or a packe=
d hex
+ * dump of the @data binary blob. The dmesg line will also include printf-=
style
+ * text message.
+ *
+ * Note that the full dmesg line, with the free text message, is only a de=
bugging
+ * aid, not an interface! Only the ``SIGID=3D&lt;n&gt;`` token is stable t=
here.
+ * The durable machine record is the CPER carrying the same SIGID.
+ *
+ * Note: generation of the CPER record is a planned follow-up.
+ *
+ * Examples::
+ *
+ *   &lt;3&gt; xe 0000:03:00.0: [drm] *ERROR* SIGID=3D104 FATAL (-EPROTO) =
Invalid GuC reply
+ *   &lt;3&gt; xe 0000:03:00.0: [drm] *ERROR* SIGID=3D106 (-ETIMEDOUT) Eng=
ine 'rcs0' hung
+ *   &lt;6&gt; xe 0000:03:00.0: [drm] SIGID=3D103 In survivability mode
+ */
+void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
+		 u32 component, u32 location, const void *data, size_t len,
+		 const char *fmt, ...)
+{
+	struct va_format vaf;
+	va_list args;
+
+	va_start(args, fmt);
+	vaf.fmt =3D fmt;
+	vaf.va =3D &amp;args;
+
+	log_emit_dmesg(pdev, cper_sev, sigid, component, location, data, len, &am=
p;vaf);
+	log_emit_cper(pdev, cper_sev, sigid, component, location, data, len, &amp=
;vaf);
+
+	va_end(args);
+}
diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
new file mode 100644
index 000000000000..d475e816ee0b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_log.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright =C2=A9 2026 Intel Corporation
+ */
+
+#ifndef _XE_LOG_H_
+#define _XE_LOG_H_
+
+#include &lt;linux/cper.h&gt;
+
+#include &quot;abi/xe_sigid_abi.h&quot;
+
+struct pci_dev;
+
+__printf(8, 9)
+void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
+		 u32 component, u32 location, const void *data, size_t len,
+		 const char *fmt, ...);
+
+#endif
</pre>
    </blockquote>
  </body>
</html>

--------------CFLAYzarII07ycZWJ5LS6nLU--
