Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6782C5B552
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 06:53:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B6610EFB6;
	Mon,  9 Jun 2025 06:53:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HS++ybtb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26FC410E401
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Jun 2025 06:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749452021; x=1780988021;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=aacYrTj4qLzB21rT3iAAJJz55zd/n/C2duYyHmCZDX4=;
 b=HS++ybtbpFyrsQ3BgOyejf1sDrPnEVgDFJDu1sNk0DGU/lUA+xbBCJFM
 y+101LGN9G+WciFyHGSGH/JbEd41t/Choo5Xkkgx0f2BFkCSfX5/inlQr
 36oinZWCEUrqP/h+BSk9kDq6fUBigJPe6rk8W+0LM4udPvyHr7YIv6LEr
 ayttIbZKPPZZvdJoqWUn2R4DLl0GZcqy3uhJ27fM412U7y40L/+Xca6GR
 sR0c/VM6Fj6bSwV6GnH5hCn8OV1Tl4EVvr5dCEM1E0KKwT5j7tui4tiAf
 Po/m8zQirRtnkPayAt+7u0WZmr64p6SKQB/70BqN8sOIxeGR4aGdFJnkS Q==;
X-CSE-ConnectionGUID: xnLo1phfSquOJe5Qg2JThw==
X-CSE-MsgGUID: zJrK1S6hRKqbHZbQlAje5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="50630016"
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; d="scan'208";a="50630016"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2025 23:53:40 -0700
X-CSE-ConnectionGUID: 67X0lOTlTqq7H9C2knTLBw==
X-CSE-MsgGUID: aefEsuxWTxyjUdtUkBJqOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; d="scan'208";a="146312477"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2025 23:53:38 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 8 Jun 2025 23:53:37 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 8 Jun 2025 23:53:37 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.45)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 8 Jun 2025 23:53:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fOW9v0zuRTqiTKy0SYXBMU5ghUYt6k7I9xB/g6Yy51/UKpexWPqhAF1JJGC2Ri+kpmh8bxD3odXVSZ6hvtPQG3ybuOv2pmRokknlUP7F9BOKLh16zJgNtAEKwmuklOh0amnPtndUQgAH8BkbePTdlQXxJXbsIK9U4gMXr55Rf+pTzwOErtoxNFGESviC650sr3rrDZLe7rqc55AcyViRJFTB//W9pF2ty9CkCidmGGl9QKZjk4pBaM+Ge4BLvvTEjSfNrvyn7VBCDOib66wZ5FrYHzEG5NenDlhhSfLEn/i+zV13+FmO5iSG9FuAJ8ln3Vu4KSMK7+iD9d/WJERofQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20qXQ2qcp3VDLQqNb5tfjH1RbIY2UTbRqq7PkGxas9Y=;
 b=dE0arjOaLuCmKLwu8KabCUidW1zIZrQOUvYOluvO70PfzU+G+HQl2slDva4xZBvM3/iRcVOXHq9MGFDnDE9jhIDSaMwVv/653KK91esRT3vU6JE7nCAOuL/WZRXxs/kyumXT6H6Ilm8MopXkQFrLn4pNzLVF1v3Jpk8Gb2dh4J73lAM27UdZ1+9eLNW8lXf9cmGTtqcQNHxFApTJQhDaVDYSKKGIAw3sTYtjV7DEPJ1Tpeo9lRSrri7SCTNku6Ns4a56YHzFJ1X1F3ruw/XRRHPQoHfi/50LA0FPBR0tD/L99K2z6wjHHrs4VIaofORknOxHrWQq8DhUjr8eVKe4FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7463.namprd11.prod.outlook.com (2603:10b6:806:304::20)
 by SA0PR11MB4528.namprd11.prod.outlook.com (2603:10b6:806:99::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.25; Mon, 9 Jun
 2025 06:53:36 +0000
Received: from SA3PR11MB7463.namprd11.prod.outlook.com
 ([fe80::d1a3:bf59:866d:6424]) by SA3PR11MB7463.namprd11.prod.outlook.com
 ([fe80::d1a3:bf59:866d:6424%7]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 06:53:36 +0000
Message-ID: <770cf95d-80b6-4f32-8bd2-18693c8132d0@intel.com>
Date: Mon, 9 Jun 2025 12:23:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] drm/i915/xe3lpd: Extend WA 16023981245 for display
 30.02
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250606195104.1771715-1-dnyaneshwar.bhadane@intel.com>
 <20250606195104.1771715-10-dnyaneshwar.bhadane@intel.com>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
In-Reply-To: <20250606195104.1771715-10-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0264.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::29) To SA3PR11MB7463.namprd11.prod.outlook.com
 (2603:10b6:806:304::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7463:EE_|SA0PR11MB4528:EE_
X-MS-Office365-Filtering-Correlation-Id: 70628ba5-8005-4334-1aa5-08dda7225b87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S05SQUFWSVRpNU1LT0ptbGJwMnQ4SFpPODhoeC9QdTh4VUI3T2twMkU2R1NE?=
 =?utf-8?B?TTNWcEtiang4MC9zVjRYaG5Ga0pBVGp5SHZybEJFRFhONE1HV1hXSnNmeUFm?=
 =?utf-8?B?YWx0aHBMbFN4Z212a05IMWNjZUJEZEhDeG1QUmM2ejhPUm5TY1dCblF2TldM?=
 =?utf-8?B?MXdYVTJPU0RlZFNlZVVvaHpJNmkvdGlZQkgyVmZPZDJwcndMUm5jVlM4dnp1?=
 =?utf-8?B?aHd6aVVKZ1dIMGFablRVeHAzUXl6UTNTd1hKNE03cUhUNW1oV3RjMmFLMytQ?=
 =?utf-8?B?Tm5iODlrRE52eTJ3ZG5sWTNJdWlEQmx0MXE2UVptV2NFRWcxcEg1ZUNOYTZO?=
 =?utf-8?B?Tk44SXZXRGZjQ2cxK3ExcG8yKzVBaE1pYlVtc0dpazczc3NOVDRJZU8xNjA1?=
 =?utf-8?B?OEhBdGVMREtzVGdBeDA0V2hMMjl3aGhJWWowbE9pVTlaR1JIV2ExZ0F3eFp5?=
 =?utf-8?B?QVVXbzk1NWgzT3FxVXB5TmVFMW9rVk43WVkrQUo0NnRFRXp6em9mY2ZkbFdw?=
 =?utf-8?B?ZXYzWWpsMjl5TDJSOWFWTG90cE9zdE03WUZ1N0pBSjlnMnhsY3FNZWJJMVVz?=
 =?utf-8?B?dFF4YTBiUlYvNDM3SGVhMUEwT3NYWEJ3bFFLVHREUThHYTZ4dWxQZVluWmdN?=
 =?utf-8?B?MDM1TGZCeHVTOGI4cDhWOEVtdFdCVUdQT24zckZvdnFndER3d1VrRkRqUmhv?=
 =?utf-8?B?UUVXdzhuVHkzSGJCck83K2ZmR2pnR2xYYmxvbVgzQXJNSTVQOWtXWk41c2Zq?=
 =?utf-8?B?YWxVMFU1ejhmcFhFNHl6MjlWMTl5c0FZRnNFc2FqbzZWcWpoWHF3Q0hQQmU5?=
 =?utf-8?B?TTJyNVhUWS85UGk4TU9jbnEwcTdQcVlFNytuVitubnVFT1A0R1BWMVk1K1JY?=
 =?utf-8?B?WFFPM2xZbGxGV3hIZVhUU2huZ20zUXBzZVZqSFdBOThWNTUrdHJwUENUMW51?=
 =?utf-8?B?aDROVVN1L21wRnV0K2hPdVpVUWFvdFNSTFNwcStYbzVwL1podHJBMEhsM2ww?=
 =?utf-8?B?OTJNZlRuTU80Y2lQY1FnOVU1anNGN3dDSkZVcmhaZE9qZm5ROUF5STdVSlUx?=
 =?utf-8?B?SXJaOUc4NE9SODB4VTVnVkM2RU5JR080VzcrVk5vSFhxR214aXIyRkt4SDFI?=
 =?utf-8?B?SThra1dhTXBRZnZBWnZRTEwrUXY1dlYxclhzL013M3JDS0xyTS9teUNmSjhv?=
 =?utf-8?B?VC82bUoyVTZFVU42SStpc2ZMbmtwRTl3MjA5NFBSZkp4S2FBT0ZrUEZMN1Zq?=
 =?utf-8?B?YUgvMlNIVnZzTW1EMmUyaTVyUzUvL2llenpUaUgyUU01QjVIYVZRdS9uaEpH?=
 =?utf-8?B?U080QkFKZHZCSGNtSWJ1d2xzSVNHRWQ0MkFRTUt4VEY3RU9COU1GVHdIc3h2?=
 =?utf-8?B?YVY1SmdzdDRsa2Fldm45TmpNL1VYUWQ2NEk0UHhZT2pPMVZ2Q2xubzhCNkxO?=
 =?utf-8?B?Z054bjBwTkFqOG1SN0hhZ2tqZXRwZkdnMUtneU5xc24zWERSaS9OR09xanVN?=
 =?utf-8?B?ZEZRci9kdi80ek5zN2c4eldpbXJQbUVla0JLRjZoRTcrbTNCUEMrYVhmRVRa?=
 =?utf-8?B?MjRmMFpyR3pKQlRlZU9laGp3OXNnN0pMRUtUYkFHa2FZako3NGM3MUVaYThL?=
 =?utf-8?B?TCtjN09BeUhFYXJWTlNQWU5wQm1HdUQvc2cvbjdTWVZySVdtdmk0MnEyOTRm?=
 =?utf-8?B?Sm1mV0Nld0ROeWNJbHA1cUNQVFBuQ1FIMlc3MGdJZmFCbDFmR0pWMTdTc3V4?=
 =?utf-8?B?eDRlNGQyNHZ2QnRUNmpmZG1RbExQVm5MT080RHhmUFBOT1EzajAyMHE5TWxP?=
 =?utf-8?B?aFdMcU9YNktnZWcwK2FkVUNrOHcyRnJ5cWE5R0lOZTJxdzl3bXZnSUxvMm0v?=
 =?utf-8?B?ODkya0NvU2U2b0RSYzZwNUhjZ0hwWmpKTlkxZkpqRk4va2pOcUxORmhZV0JP?=
 =?utf-8?Q?MFJEIXon+pQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7463.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NW5lNnhDRTFaU3czbWY3VzV3Sm5NQnhGdU40MzBPdE1jeEtUSk1XQURPcGlw?=
 =?utf-8?B?dkZ5MnNFTWdkUGVLdFpGVnFSUnMvWjRwMFY0dTlBQWJYcEhtZDZqbm95MWdE?=
 =?utf-8?B?cHRGL1dFWVZlTHB5dDQ0Y2VMcWRMaS9GalJUa3ZLdlI1ZEpZQ0VUNG5naEho?=
 =?utf-8?B?SHdOZHlOWExaRk90MUczZzJ5MmgwaUw0dWxnVnB1ME8zMzdMUWVqWjVSL0x3?=
 =?utf-8?B?Q1FoU3RHaDh1UldYcFRkaXY3cDJneHVOSCtQTVIyTTcyYnVIenlrTHRSc2NH?=
 =?utf-8?B?SUZOYXpJdEdpcm5tUnAxY1pkbjA0RlNjYktHRHl0amNPbVIrMmlhN3NQbnYy?=
 =?utf-8?B?R3lOeHp0U1paZmZxVUZ5YUk1ME8zUC9VVXk2Y0gzS3M2SlBzWFZiOE5oczJl?=
 =?utf-8?B?NjF0WnBud2txVTNUVm5tTE1zMVlrWkVETUkyS2RaaXM3YkJMTnJWTU5ZYVkz?=
 =?utf-8?B?aFF2SlJaTG9VQWtSUko4YTY0bW9pd1pSVGdtRFlSeHp6RS9xQ0Z4SFdZVm1q?=
 =?utf-8?B?MUZSVWllMDgzamUveUVtUHNHTmMxYjlnMDdHbUJsVmJxZDVPWkxkOFZ3K24r?=
 =?utf-8?B?K21Vek5oZHV0dDFvV2pQL29SQVE3NDA0TkdvVEVuZ2NZMTcxVUxpSCtDbEdR?=
 =?utf-8?B?ZkRWa0RPcWtZUFpxNkZnYUl1bmdFVHQwT0crUjRhQnpUOU5POGhMYU15cmRM?=
 =?utf-8?B?VnFZdytENzFzY3ViZzIzS0sxaXBKQmxIeWprVUZCOUhuMUpTamZQblZSaW90?=
 =?utf-8?B?cUFQRkJtL2dvTnZCNEtQZTN2MjhodGlVL3FpY1BDVlE2WnpHalZWa29mcVlX?=
 =?utf-8?B?aGpJMTZERURYWDl2M2k2UUtGVXkrdHJwc1VMdlBzaHUzQ0xmbzFrQ3pTRVJE?=
 =?utf-8?B?dGN1cEJMN3kwell6MUQvQktrUmZTU3phakk0RGFSb1ppeHAyYUlPWnZyL1ZN?=
 =?utf-8?B?NUR6bEtiV09jYWNiZ3huWmdmZktpOFpHRll3NTczZURpSWxaTHNxRzJEWTg1?=
 =?utf-8?B?bHVtMWZseXVia1UyUW5HMm1UdlNoVUVWNUpPNVdkSVo1djkvVW5SZkh0MkVy?=
 =?utf-8?B?ZW9MN0hONnVIYVBmQ0xualo1b3FkWnFheUFRZ2tOTjdESXNUaFh0YnJ1KzV0?=
 =?utf-8?B?ZW8yZThzMVk1eWorOWs0MkRVQ2U4ZVVtQzZIRzk3eGtpa2hCMTlZalVRTCt1?=
 =?utf-8?B?TWlHZitPSDErc04vVlBuK3RQRFNJdjNiOXA3czlCTUdQayswYTVPbmY5WDE1?=
 =?utf-8?B?NWhLblk0Y3BFUmRsY2lNSzF3TWkyZVRFVGlLTmFBOFBaTVIwVWkvRXBVNVpR?=
 =?utf-8?B?ODBLWDE2RzdnNUtkRG9hTmxYYXFJdE9YSlpyZmhZOENVNEJrdWVkajcvZ3Fq?=
 =?utf-8?B?NHVKVjlCeUtRbHUzWXlBekRWT2w1Q1FxR1VwaFY5NDZpZTgySGVLUEVQMHV1?=
 =?utf-8?B?RHRUS05qNXQvQ3NWOUJPQUNtS3F3OFhvS2RYYkdmVFMxbHR5Y2hPZWF2OGRX?=
 =?utf-8?B?dlNPSVFKaWZSQkpsamlxVVlwQWU3eHF4Y0xzSWYxQk1Ob1RhUWVIRjAyakI2?=
 =?utf-8?B?WVNBTEhKV2lsSGozemxlUEpKbkxISUdlWGFNUkg0cHBUUzd0NW1WRGx5RHkr?=
 =?utf-8?B?dE1BcWZ4bDlnZWNZSU84czFWcERJSi9iV1FjcXZnT0hTMi90bU1yOHI1Zmh2?=
 =?utf-8?B?SGhveHROL1dEK0liM3VJYkEyZWFzK2ZPNDhFd3p2VDh6Y05xZWFNdDNUcjdz?=
 =?utf-8?B?bnlxdnZnTGdBZUx5dEtyNHNuZkhYdm1xdzNJeWltalYxNHJpMVV6dnhHZ3Zm?=
 =?utf-8?B?L2RHMmdGbmgrSVpxTFVpMmF3R2k0YzhLa3JyaURwaGRDeG53MVZMNGZyWC95?=
 =?utf-8?B?VjhWV2c2bFNEOVM5YUlFanh1cGlxZUMwQWxad0Vha0RZU0dNdnVRcS9JNW90?=
 =?utf-8?B?bjhxcUFtVWFzNWVZZElXM1hwbC9Od0FRN0VhckViN0QvNnRXci9BWW9RZFZr?=
 =?utf-8?B?anRmM3czNG1HOHdmbm9MRWFlOEUvQXUrY0VFNExIT3NYZmZLc0pQdVJWWkRC?=
 =?utf-8?B?anVwdlAvQy9GNFVvZDI0T2FWb3VROG05S0czeTdpZndDdjhQN2lJWkxiamxJ?=
 =?utf-8?B?aUlBZ0NpOE1ENEdaUkdqRUVFSkxHMzBNbmhWV1ZXNG9wRUh1WXF6V1lrcTJt?=
 =?utf-8?B?Z2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70628ba5-8005-4334-1aa5-08dda7225b87
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7463.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 06:53:36.4377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GmgA6w0fQF1di+Te6kn5PA9AmPEz4N6gU+i9K/Mltjnw71egnlP+g11jE19ToV1oBzCy8mpatS/AN9rlx2lmdUEgbq1SqxhGlUR/5r8RMWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4528
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

On 07-06-2025 01:21, Dnyaneshwar Bhadane wrote:
> wa_16023981245 need to be exteded for display version 30.02
> 
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

Just a typo, should be 'extended' in commit message, other than that

LGTM,
Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>

> ---
>   drivers/gpu/drm/i915/display/intel_atomic_plane.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> index 15ede7678636..e0336c79c294 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> @@ -1085,7 +1085,8 @@ int intel_plane_check_src_coordinates(struct intel_plane_state *plane_state)
>   
>   		/* Wa_16023981245 */
>   		if ((DISPLAY_VERx100(display) == 2000 ||
> -		     DISPLAY_VERx100(display) == 3000) &&
> +		     DISPLAY_VERx100(display) == 3000 ||
> +		     DISPLAY_VERx100(display) == 3002) &&
>   		     src_x % 2 != 0)
>   			hsub = 2;
>   	} else {
