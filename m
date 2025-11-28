Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B77CFD376
	for <intel-xe@archiver.kernel.org>; Fri, 28 Nov 2025 14:29:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D58E110E100;
	Fri, 28 Nov 2025 14:29:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZvoU2bdt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9AD910E100
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Nov 2025 14:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764340191; x=1795876191;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3EVdeaWXHJFzzUbIyGuuA5EUrYNoYRpXMMVq/JU+sks=;
 b=ZvoU2bdtA9iQo42+CCMorrqkXzroAv9ZtDRQH6ymRKryk/E9Rs4BTl4s
 Z3R82+LbcKFYk6P6I7mZiMGT6OqvmvDnbPgvzLmGU7on3X6/+C9bmySGy
 FU2y0aqHOrwunI24s3atZmCU3w7MPfEqrHz4Kenl+RjDjBuxQPWrzucwX
 N2VoDOg/kcCEYHosCQZLLzqklAjRAgPaBRTbYVggLSg+o74qc2vm8EK7E
 tlf+RndYvz0/EHlw3vBoGNvmJR4aJ8wgfGc6/0NNieAtBSpmHVXyIC+Du
 jl12Ktw0NVzRFNkedsDnBuU3ZMZpSWdUZ0eCe13c+fqDVoBbF29Kj8fpM g==;
X-CSE-ConnectionGUID: 2gR66VdcQ1atIZBD2VqWdQ==
X-CSE-MsgGUID: ODqTHcg/Q8Cr/KAEhaUg0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="89019313"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="89019313"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 06:29:51 -0800
X-CSE-ConnectionGUID: uRNi8tBJQmOC5xYsgRrxTw==
X-CSE-MsgGUID: N6FCehVURm2skP5z4DAsgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="194270816"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 06:29:51 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 28 Nov 2025 06:29:50 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 28 Nov 2025 06:29:50 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 28 Nov 2025 06:29:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jzZb96KYulT/osYnQFleVSKW8/CGSr+boBdsx4twzXORwwI5FLJrQR0GV3X8fjuY/Y/xeStIUgagLNIkt9kGztMUDQKqzI6Ns8KAz18fHeDPqNYk4D6ylICpki/PTqFUOqxB01xSjXaimWnnR3ztaOB0LwD5lHWnXLcvCFs1lJAMPPYe6FWAtxfowi7hZ2zwv+6y0n+BN3DG6yjP/AkFCdmBeKa1Ou58E8dcoNg0x1cAaBX8VQVDNOysyqjFF+LdiHG7sRCl3i+WMni86HR/BJSbriBr+xSl/dXY11MODpBbQ4wi0g4Ru7IdG7V3BhextjSBaCccf3hxauKZxnAJwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+W92j6qkgnUVmYRXoenewTItzbeaywl+isfx443dOig=;
 b=T5RSuF2hqcClgwmGd6OdyNF3Ip/4xoUGbLj5aMz78zbVyGSpVTgG7VcZWxT840e/4HDDFuC63pHVQXxiA9fC0AI1CNmDGuNn7QYcPzNt4Y3Hwoc7eK1ZTmJUtFYS2Xd5vYA2oOkLctTBLxra6rOjugNo7B/HwV+jjN8BQzVR0xeC1NmKxq4r6ZfUYnI2FBFBHQy3QWGAA0BwVw4RBnj2NCZwGj4sAtXbstO2VDe9rD/AFgAY4sYEJFngylScgGqs/7evPQ8rKEPTM0muWx81fvPJq26XdeF/CTjgcEd89ZNXI7m6GEq1CJicxJTaUXEAp8djJAYKeyMRGFeJLom8qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH7PR11MB7571.namprd11.prod.outlook.com (2603:10b6:510:27e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Fri, 28 Nov
 2025 14:29:47 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 14:29:47 +0000
Message-ID: <7517f629-00eb-4d85-bb2a-355c689447cd@intel.com>
Date: Fri, 28 Nov 2025 15:29:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/4] drm/xe/vf: Enable VF migration only on supported
 GuC versions
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
References: <20251128133052.17120-6-satyanarayana.k.v.p@intel.com>
 <20251128133052.17120-7-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251128133052.17120-7-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0139.eurprd07.prod.outlook.com
 (2603:10a6:802:16::26) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH7PR11MB7571:EE_
X-MS-Office365-Filtering-Correlation-Id: 28b86d6a-72e5-4480-803f-08de2e8a94fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWQyQkZWRU9SYVgwb3BuemI4S3hwalYzUUNadUlBK2dJWEd2akxPcFpXQnVI?=
 =?utf-8?B?bVdzaGVBNjA0QTV4OXhnOEo2aHp5NEtJZ09tQ25JNEdiR2thK0tCcHN3WWtE?=
 =?utf-8?B?Z0c5TlM4bmFYVElkelczTCtCNG9MQitrU0YvSVFSTlR6WlZTUG8vUFpoZjhV?=
 =?utf-8?B?N0RuUHJXU1NoVWtTS250TVJBdzMrdGR0dTZoTTdRSkdGUDNqLzlNdUE4eSti?=
 =?utf-8?B?UHRHeFQ0bFZHM29ZWnhmSmRtTWZaNlZCUmRINEo3V28yV2d5VUlsR0tySFVC?=
 =?utf-8?B?STMyRkQrb3hvdG9RVFJRS1JPN2JjeXQ0TnpaTTVYL3hqNUdJcUhDZmZnWHdM?=
 =?utf-8?B?VVZSYnhqeERpbDRsajhLd2JxcGJTTGNPZXp3MnBmRXRzcnY5VHpvLzNLNE9U?=
 =?utf-8?B?NU5SR21LVmgwUHlzZmJ3WmNHRUNlZEUzUUFaL1dlNzJuTE1iZXE5bjFRaU9m?=
 =?utf-8?B?Lzh4dUFwNUVjQWFvOFRXTndTVVZyMjNtc1R0ckd4SWcyQkxxQTNDR1RRYldV?=
 =?utf-8?B?ZmI4TjdnQ0F3Um1FbEI4K3V3MGlMOEZ5Zi9PZHRBWHBNZGNSbDhVZFJES3VQ?=
 =?utf-8?B?M3hrYzJnUHB2ZlI3eDZvbC9CZHg5T0dtWXdIRmV1QXYyS21WRmJNUUFQK0l6?=
 =?utf-8?B?R0RmQ1hoUmRjQUsyQW54S3lHOWpxYjU4NXZaSGxQRTc4am9OMDN1K0ticnlB?=
 =?utf-8?B?S3oxMUpaRisvSzdVczVNazVOamgwbzdKSDdLZmNvUjQvSE9aaE9kUnhvMmkv?=
 =?utf-8?B?eFBTZjVBSm1HK0xFVWprR0lNUUE1VDJWclVJZ3prMDFJbGM1TTFqUlUzbnJy?=
 =?utf-8?B?SGlGNVJwTWZ4TWJXeDhudnRjL29TTG1GMVUvQTRoZlBWOEVMTTJlSHR6MVFa?=
 =?utf-8?B?VGp1aUhXNXkyZG5OV0JOM3pVcXc0RjczZDJyREppR001VFRrbWNlYVZXUUs0?=
 =?utf-8?B?YXdCWGlmVTdXNk5rUTNtQUxpSHdldmR1V1JxYW80aDBnT1REcitpL3o2Qlpi?=
 =?utf-8?B?Wk10MjMraEdRL3c2T1JHdU9UYTRvTTFKc3RKN0p6bmswcFo5eEZ6cERQMlY0?=
 =?utf-8?B?Tk5meE5oMFpGaEdUdU1nb3FvVllCYytsZU9KU1FXdGpDVExkTnVhZWY5MVZK?=
 =?utf-8?B?enNtYUYxL2pxOUlacEhkODdkaFJwVm50N05HbXJOR2dhYWRMS2JHbUJ2NHJ5?=
 =?utf-8?B?cnJKOWV5b2lGMXorallvUzRHaW1XalAwd2dQVm8wUjhWVXhwaGRQYjh3OXp1?=
 =?utf-8?B?d0VGNklHVklXOVovYnhycUJCY2hxOWlhNTl6dW0xYU1GQzRFbHhhWEJaWk4y?=
 =?utf-8?B?RTJsT1BTTFRLcEl4M1drUHI2eHpTemR1LzVEUkdjbzdVODI3ekpXMUNFSXZZ?=
 =?utf-8?B?SVlVaDJnanVabE4rUmVkc3F3NXNNbEx0dWcySnoxbHJ0a0xrWkljcGRCVkhi?=
 =?utf-8?B?RlBxUm1lNU5oemdWRjJLM0taTGtCUEZienB6T2xaNUp0RWdKenp2K1kvQVBT?=
 =?utf-8?B?amJtVnU3ejVHK1ZmaVdkTlR3WGhZNUhpUkRBSWlqQzU0bGtvc3BWSUdqZXl4?=
 =?utf-8?B?ZHdERDJkanlvS2Z1bCtKUEVjQTIyRm9vUDhmM1pKUDVrbW14NE9QTmFnTXNW?=
 =?utf-8?B?YXJJand2TTlBbE1kcTZhSkthaEdhUW5tUnBITlAvTFRIT3A3OVYxVkF0OXNS?=
 =?utf-8?B?cUVYclFUbmVvZHB3YTNwQkcwWndQQXdvVUFad1phbFBXQU41d3htUWd6TllZ?=
 =?utf-8?B?SVBFUVByM0VCZ2hXSlhEN2c1aWFSSjJzdkF1UW1oZ0VTUE5OblgwWi9KNU5S?=
 =?utf-8?B?U0RjWEV6dmQ4ZUNtYUw2ZVZvUEZqamtvcHlOTHh3MHU3ZTRnZDFVYmZaQzRT?=
 =?utf-8?B?OWlRclplU3M0MFFBeHJqajJkckIzRUxhdVFmUGhkeElQYTJPVm9Yd1pNYzlW?=
 =?utf-8?Q?4nRw/INvjx3E2POl+Xkz11FTbOkJK8w0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFFVUkFrNWhMZVlIUk9SaGtMSTkyOGpmdmMyQ0dHQWN1c2l3bkFHMHhySFI2?=
 =?utf-8?B?Tkk4am1yK2s4UCs4UDltdXlsb2wvUUxFR1JIdTVTSVExMVArSFFLK25OZi9o?=
 =?utf-8?B?cVYrcXh4MkNMa0dFZUk2eUxKRFRUV0d6N0hGejVvWklBelh5M3hCdDNOUUJJ?=
 =?utf-8?B?ODFlZkVBdUtScVNnaFRqSkZScUZWdnRQTmdESDNkN1hsMkhTTzYzSjFnN3JF?=
 =?utf-8?B?eVRXa0NvSFQvUitIR3I3ZnpuUzRWSWJ1YW0wVmhKem9pYlhKSEFQMGQvT2l3?=
 =?utf-8?B?L3A5NzNNR2dmTmJRTXc3SStLTUhVREVyT2lwYldEMnExZWpGMkxITjVUa3dX?=
 =?utf-8?B?WFhZNTh1cXhxdTduR3B5VFBVdjRPaEdpYVdoRTFHaXpHYkVCWU5xZkVBMHht?=
 =?utf-8?B?SjFaSWJVRUlucVljbHhGZUNJM2lIUy8rNWYrU3g2OU5IRktPa0hJSEpVM1BX?=
 =?utf-8?B?QkhZUVZTdnRVN1gxaURKTURqOGN3Wm1ZSUV2dzVQanJvKzEzSk9JOHhVd3Bj?=
 =?utf-8?B?RE54RmpSeS83SXFKd1NiWkZwVEFST2J2TTQ3dWlLK291QkZRS2ZrOU9vTjFv?=
 =?utf-8?B?VFFKZGhBMUhZYUQ0R0ZxWElWQlpwVTFoM1JTY3lEU2luMTFEOXNFUWZ4VHpS?=
 =?utf-8?B?MDlseEhhSGhJTFhpUXhXbkptcTVRbUlGTnNvMFF4dGh2QXdOazJDMlRrUTlG?=
 =?utf-8?B?K2h6N2lCZ0RqLzc3dmF5SjRoTW5sL2JaNDU4ZWpxbzBJZmY3eFFFZzU3QjZU?=
 =?utf-8?B?RTZMTXgzOW1mM0NWSWVyTWxuOHk3WkZsZm84NEdiQkdxcE9YOUZFRkhCNW95?=
 =?utf-8?B?TnlCOEpMZmYyT3BKdzJQTkU3R1BtS2g1VkhucHdDUkN0alprRmJvVTZPdjNm?=
 =?utf-8?B?ekVMekZGbktpMU4yNWZ2b0VTbnNVaUZKbWJGc3hSZi90SFZlTUFtNzk2Z3Vu?=
 =?utf-8?B?aUU4WHNUV2lTUEVmNzNaUm1ES2lLYUlBY2t5MWczMFJIdUJtY3czWWdkUnhx?=
 =?utf-8?B?a0dEeHNiZ1BsbEpPZ2ZxRkwrL2RBV1NyeTVOUC9JM3c1d1RnNW54SXhlVzNR?=
 =?utf-8?B?ajBXWllFb1lVWGMrZTI5MXI1RGtrY2tyUnVJVk1YYTdzUFIzSFRJdGgwLzJo?=
 =?utf-8?B?WmlhR2VVdGNJOXlJSTlSWW9mRmRwRmhJRnordDM1VzkzNklFWXlzR2FVdGRY?=
 =?utf-8?B?QUgwWDdiMjRzam1aWDdSdWdsN0svTHBROWs2NWZja1g1U21XcUVldkNwQWRU?=
 =?utf-8?B?dDd3dVgwYXFtQ2Q2b3VsSzZkdGN3WVYyNW1RQUlScjBnZ1E5ZDlld1JOQm9a?=
 =?utf-8?B?U3Z0Z0hGb2Mwc3FNQmZYZCtUM21aUFQ5NzVNekVZdzVtNzlmaWZtdlU0aEtO?=
 =?utf-8?B?dWJIMHN0WHEzU3ZFZEtKMkVTSjdtNlFIWG9JNHllMVYwQ0tjMmFuTm5rRUVL?=
 =?utf-8?B?MG1EWU5iTXIwNkhCQUorckp1ejBRNlR1dndPaXQ5UUxOOW9nTTJ6R1FnM05r?=
 =?utf-8?B?dEVnTDQvTmdvN2N3YVNzL1BGdUtEalA1OGFHU2F2N3Z4TmlxV1g0U0Q0LzhG?=
 =?utf-8?B?cm9DWktvV2F1UGRiRU0wZFRqdHVFUG5SMkhQaWlzYmoxcnFkSXlWaEpMQml5?=
 =?utf-8?B?eGtxTm9JZ1dTMjNoMDdWODQ5V20wbENmZ1RtMWZ1Mzd2RDVQditib095czFQ?=
 =?utf-8?B?T1g1VUFzbndWZG5iY25VVHdQTmZReklpVUgvandoZitURXhrZThvUFNDZ2xM?=
 =?utf-8?B?eHpzanRTVVRZcFZoamVDWkowYlNSc1UxNE5WbnQ0TVltOTgrWnZ0cnV2KzZz?=
 =?utf-8?B?M2FPVXRwR0ZBZENaNFc5Z1pWZE5CQVljNHFiT21GWG10YnAyU2ppMENDWWh4?=
 =?utf-8?B?a0QzMC9PalJOdWM2N29aQWt6cktwS2h3YjlCYnFTNnVrZ244RnRNWjdkb2lt?=
 =?utf-8?B?UlpTVU9sZUFBSndFMVRwTWtpaUloVkpRcGpIVWNFSFpFMjZWaWRtbnp1M2dO?=
 =?utf-8?B?cUVNYjhpUytWa1ZZMzZXUEtNSXVsVmFtRzhCK0hSOEZSdU1pWlZmRzdxbXlZ?=
 =?utf-8?B?cXpZa3JTODlaRkdaVVJLT3RxSTJpb3MzZTVtTkxTa2UzcUs4Tml2RXp6QjhU?=
 =?utf-8?B?S3h5eVBERDBjVjR6azVQL0xTWGovbjNMcDRnaGw0MW5uTlZ1RmF2OHNJRWQr?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28b86d6a-72e5-4480-803f-08de2e8a94fc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 14:29:47.5616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JVksHYyTfXHZfLJA3o5RmSa47IwW7yv0kskdE3vddfF0DohzbCui6fLjEzpNk7QSTp22CPnUhABUal34YsLS9Xxs8fbJyIWv4+uTvSEFxLw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7571
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



On 11/28/2025 2:30 PM, Satyanarayana K V P wrote:
> Enable VF migration starting with GuC 70.54.0 (compatibility version
> 1.27.0) which supports additional VF2GUC_RESFIX_START message required
> to handle migration recovery in a more robust way.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

