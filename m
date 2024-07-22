Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED580C3DA59
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jul 2024 03:54:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F1410E05A;
	Mon, 22 Jul 2024 03:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cczMtecc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A65110E05A
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jul 2024 03:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721620451; x=1753156451;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xidzwBmDkxeZPE+ZhDxHWz4lYOel9s4ZMIgKmwZsPus=;
 b=cczMtecc7AH4CFRlcAnH8BcP44z0jwaQuVtcLGxw2WmMJwr79qswsq/n
 kCX0Im2tRcX8TTfvXeFSs6VnCyRHGCkiSyP0RWxF9H+giLoLBXkgViak3
 2DwIXRyeX4vmAUUKOgR2Li7jp6qaIYWhXDbKjlcDrrqftvR7ABQORSJoT
 Jpsdp6FusznD97s0huPkU1zGF9XNmkae9gayM4b1LphkQ4xHl4yPCeZxl
 vd6OeqxzGz7mbAi9Bfx+5jk87G3l1SP0lxgRKApBkAI0uUjSlA7kgvmqs
 s2idx9mxwuUOYn64n2FP64xNh1MohfuayRlx6zlh9ZoRIUNa8s7G7k/mq Q==;
X-CSE-ConnectionGUID: B3lwsESeQ+eGPoSuACsvJg==
X-CSE-MsgGUID: yhy83xTkTTqKi+i2F2CIiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="19296520"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="19296520"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2024 20:53:27 -0700
X-CSE-ConnectionGUID: +orty9jHSMq4JZWFGK02xw==
X-CSE-MsgGUID: J5153Sa0R0SReOHlnR3ZfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="52460588"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jul 2024 20:53:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 21 Jul 2024 20:53:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 21 Jul 2024 20:53:25 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 21 Jul 2024 20:53:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B+gWYNcgGEVBWVQQE1zw5GJUhJqqvvw4dJ85JkHIL1EYVfhwUiQmxDDP8YnrflCo2mX4kAKQe1V0bq69uDkAuUGcGdZpCQuUqXhlReSKCcMoc7UttaxP41PogT/X2sK7LMSD1ynkMF/IL5B/bxPq0scBJ78ytcBeZanJkAe2PqPyG2SbQ8ZlN3ZVO4mJzM1EgvUAqCb+LAcULw2GbIX+8m4oBgcMd/YwOaru927DGx7g5UW5AqFfiPzac0qdsRfPXAB9Qy4XC4zPHt0aVgVJw1rtr6114qa9vUH7JdfHE4Fnjzfmh3E72+72b73Qjvl9yqy0KRbst3VmG2XnNp4mbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vo19QlrwHlMzeEbf4zOwiIOVidh199bxcs7EWouB3BE=;
 b=F2W2TY58Em28fntd41Z/6E0ZDfgIP6BtxxwqzOx9L4QSvBk5C6msBfnxGRejGzcol7ROir3y3g6/J7ifDUNDoXQMZ2DXgr4Bi8ZsP4UVC6DR5d9fu/XzfmBwJqFDGbuopdG9UnE/066ddKLySGIdW4wHDki47WGQ9W+99WqoSYbxJUTOYuqZZIE1i//xK5Az8wlleSTN/824S7XHc0pHZOSZ6jN08KIN2OV6Sa/U6AcAQFYo/e5vZmQtI3zMxpaXx+BxCAgT7M8vpbuk+xvbJRNs5y/SG0vcvISlh3Sx5sOPUa3H7hWpAEoT3eh32XL1mAE9IZBuFckmf4SnqJwiCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH0PR11MB5144.namprd11.prod.outlook.com (2603:10b6:510:3e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Mon, 22 Jul
 2024 03:53:21 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.7762.027; Mon, 22 Jul 2024
 03:53:21 +0000
Message-ID: <e4466464-633b-46b4-b5ac-ab7fba511f56@intel.com>
Date: Mon, 22 Jul 2024 09:23:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Return -ENOBUFS if a kmalloc fails which is tied
 to an array of binds
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <paulo.r.zanoni@intel.com>
References: <20240719172334.1527484-1-matthew.brost@intel.com>
 <3bf93639-74b9-41ff-9d6c-1911506772a2@intel.com>
 <ZpxE3A6BrzymJZYL@DUT025-TGLU.fm.intel.com>
 <ZpxGRbMQ3SWAZ38t@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <ZpxGRbMQ3SWAZ38t@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0184.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::13) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH0PR11MB5144:EE_
X-MS-Office365-Filtering-Correlation-Id: d031da7c-cc03-4657-d392-08dcaa01d405
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVgyY2h6YTdhQ28xaFZSVnIveUdlRHZzbHZtK2xoSGdBa0hSWWlvODdVbDZ2?=
 =?utf-8?B?ZDhzcktDL1UrVm9iY1RXSmFXczJiWUtnUHJqOXlkeWFJZXd3eGNDNDNtaEZ5?=
 =?utf-8?B?R2NNb0ZzWGxjVUY5WE5HMHhKQU40M0xzMlVYU1BhaVJkVlI2c3BGMjExWVlk?=
 =?utf-8?B?dXhOaU5IQlI0OTQvSGRDOXNKK0xZQzVWM09KblZaWEttS0lYdCtqZVVKZ0Vu?=
 =?utf-8?B?WGRVaGtZQVlRR1V3VXpSWDVBNHJ3NWlmdktEbzNEYVNiSDJsRDRIcFRXNFY2?=
 =?utf-8?B?Z0kxTmJ5VkFOQmJEWVIrVEp1WUZDV3RUaWNNVlphNEhmNmk0c0Y3ZEtQYUtR?=
 =?utf-8?B?dFltR1RsNU5hbk9OOCt5K0JQV2pDeTBJN1kveVY1M1dVdVFqQy9jdGp1d293?=
 =?utf-8?B?T2hGT0M0ZHhoNmFXclN0L2NiNTRXcVZFZWxKMDdwYUxGcXlmaWp0VFhJa3hu?=
 =?utf-8?B?eWpKdnVrSFFMRnhSN25XSnBVRjhreHdNdzVLYU4xSVM3SmEvTWZLWUpocFA3?=
 =?utf-8?B?NVM5QmhTMEJ2dUd0NDlmV2dXQ2VhMXdZUUNoNXR0eHRXdjlQbzZkTTdTdlJG?=
 =?utf-8?B?RytNYzNGYzl2RTFJUFBqVFQ4WXZtTG11UmZTbHFiRENDMkNNc2o2UHhFcDdO?=
 =?utf-8?B?SURJM2ErREt0amZ4ZCtobGxveXJ3WVJ2cW5FbkVjajhjSkpacnJtOWMxTlZn?=
 =?utf-8?B?eFZVdzVrMmNzSkwyT280enV0b2tyR0JybU5kMnp0aU0wc3oyQWFJc2FxYmty?=
 =?utf-8?B?SURPbFRvRU93S0ZRa2g4dTdrcGNaaTMycGptTmJWRERrcW5lSjlyYnNpMkVN?=
 =?utf-8?B?aGdSNUFvbkJNZ2xHN0JSYkRGUjdjeXdPdW5TUEtiMVhJQmtiZzM0KysvcmI5?=
 =?utf-8?B?Wldnei9nRkpiV2NPRkdXaTZFWUM5VTEvS3VlSWtsdnM0dGNla0JaVWJDYUFt?=
 =?utf-8?B?SVJBcHVpL0FKYmxnVjMrMmcyUXV5VFh1d1ZpNXlVTlBsWFZ4M3luZUVNOUJJ?=
 =?utf-8?B?NWVFblJGODVrSHhWa3c4SFFncGxXeXRPZHRNS3hqR05KWU16UjBzbG03dWhI?=
 =?utf-8?B?MmVLOGdwcm5VdTd3ZHZBeGhZMzl4MXdZVzhnckMwZHJDVVVJbERWUzgrOWpL?=
 =?utf-8?B?elJ6a21udG5SQmZQNnpzbFllZFR1VTJiQ2FxS3RnVkVnblhKMVI4Y3JGU2JF?=
 =?utf-8?B?VmFTT2gwM1RYcUw3dDlURE5YeUVRdHdLNEw0UGRxamU3V3pxZjRQcytyUUZ0?=
 =?utf-8?B?S05jblB0Sm1hbjhZMEVMbkV6UUQxMEIxSkxlZE5FUHlZSjBNVWYzbWZyQmhv?=
 =?utf-8?B?eFlEUTl1Z3pYZ1pwRHhzbTNiQS80aVA4S3Jha3lOOWYzZVQyZTlocFBQc25D?=
 =?utf-8?B?eXZicGtLdDhpa3lJUHhCWmR2NGJiNkg0VTNZdER3SFo4cG55bVh5VFowQWhG?=
 =?utf-8?B?S0ZqUktiYmZQVUxPZDdyRDNZNXNzUStsNTVtams0SHRZMWd0NVZsMUxKUURH?=
 =?utf-8?B?cGZsMlRZckY1SVRHUXo0a1RlM3VVSGU2WWRFN3dZL2N0K2ZWNGllSE4yVTVy?=
 =?utf-8?B?cnd0ZGU1OUNVc1l6cTlmVU1UZGFwdElHdHZyQ0czYld5SEVQU1ZXVmJiMFFq?=
 =?utf-8?B?ODNqUGwyRkQ0NEJvaEJ2anRMWjFZRkZaQmd5Qnl5bjNZLzQ3T3JQeFBwRmFE?=
 =?utf-8?B?eUR4QVM0enFmd2xzMjg3QjF5YW12VlFxNC8xck81RzNzb3NpTERNbmQvMmI5?=
 =?utf-8?Q?Q92nM0R1MTaJlYOq4o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWs0NFlMazFqTG9MRlNzelVDOGk1SmVWbzVnTlpPbUhHSUhPTERnWnRxNjlK?=
 =?utf-8?B?RlhrL3NESXFMSXRENTgrQWI4dFViUmh6YTJoMFNobWV1cHhJd3dkcDY4NHpQ?=
 =?utf-8?B?YlBUdERNbTQ5V2cxRFVUVDhqUzN6OGt3NnNHTW9ORUFqbzVYM2ZQUU93dUlL?=
 =?utf-8?B?ZE0vUmY4UUYxL2plVGVYR2dIQjU0UExHM2g4VlI3OGFhazlITnVabHhORDI1?=
 =?utf-8?B?NFU0bmxhWGJyd041azRZdVBiVWc2cFN3akxWUGd3c0lISWFDOFNiSk43Qjlt?=
 =?utf-8?B?Zno5V2dLNStobUt2NFdqSzdTNEl4NjFMbHRaK2hTb05ROTYrSTI2NkNPK2RK?=
 =?utf-8?B?VHNuc2U0L3FDSVV6QUhmbEx0ZVlvd2Z6bjlvMTVPY3FlWU4ydGdVVENETnpt?=
 =?utf-8?B?endZRE0zY3Q3cEhaTkRaSVBRRHhIbDIyVjVEVm9wclVib2l4MTEzN2ZYM0M1?=
 =?utf-8?B?akxxVWNyQ2xySGhBSlZaaHU2T01peHFRWVVNU1ZtS0NtYWRLVkxKeWs4WlJl?=
 =?utf-8?B?RktLUVZCQ0dDY0lJYTdmS3dDbVV0WGJYZHdyRHVLbDVxRjd4aUNMYy9TZVVu?=
 =?utf-8?B?TVRoRVgzOGNya1dYa1BZd1JheklxcXk2QU1tOFNaYjRpL3JwNkNVcDJtdWhW?=
 =?utf-8?B?cmY2RlhNNWxnbTVkSitSV3pnU1pOOUFWaVZpdHA3ZGxoUHE5em1PaWYveFBP?=
 =?utf-8?B?SFBYUkFST0JCRkhMUXA3MkJHekROK0VQUHdrYk1rQ0NoRmdxd3FVVmpUWVdq?=
 =?utf-8?B?VFZPRzY3ZjlJNFJ6bGpBL1QyVzVzcWZjazZPWGRZRFU5ZTNQNGllTm1yZkdY?=
 =?utf-8?B?UXZBK2JNOFFoZDZEaktoVFZNYzZjbHpUSVVIa3doa3R0NVRNWHNZTWJPMGFy?=
 =?utf-8?B?Mk54SHlyc3UrOUhQS3pXMy9GK2E0U3R5MFhlUncycjNSZ1lIaXVTVnR1LzBt?=
 =?utf-8?B?Zzh2MzNTcTNPN1grOTN5cHdrMFJQT1UvNlNPSlZ1SEJGRXIvWHFhRzJ3clNV?=
 =?utf-8?B?M0M1OVlzOGx3Nkhjd0tJWkNTU2VBSlMyUm4vVFpiRndKaHF2aTQ4M2kyTDZ3?=
 =?utf-8?B?anB6VndURkRwZXorSDJMYmhqWHNTL1JPNUpRMlNTd3pTZ3luN2JlMDhUWmRZ?=
 =?utf-8?B?VmZRRWZ0cnZZZUtKaW5TMWhJdVNSWWpHSkZ6NElLbVV3UnhvcmhZdXhwMzlO?=
 =?utf-8?B?Mk5Fb0tMYWczdUVuUmdEZUY4bkJIRHZ3RTVzbDlZNmg5TG0xUVUyQzBiZEV6?=
 =?utf-8?B?WVg2K3hQQVd3V1I2WHNVdGNrZWNkbm1NcFVqMUVTR3RRNVFkbUNvcGhOam85?=
 =?utf-8?B?RGhJNjJBQTNqWkYzQWpTdjZSSzBpQXNDM0czYUFHSG5xaUF2cHk2WUlBcnNY?=
 =?utf-8?B?dndFTEFkdFNqNlBCdEgwZE1XL0pMSG1yWUZFcUNPUnFEbGZ2ZUJnRkhaWmw2?=
 =?utf-8?B?U0RaMUpDMlhXOWtRNDBTVG0wSXhlUmsrc2NNcDRJRHZuYThIY3Qvby9tSksx?=
 =?utf-8?B?RU5nYkhvUEp0NEc5Vk5pMXJmQ0xZbTJpUlRhNDVqUysxWTJRSkxnZVRSM1Ez?=
 =?utf-8?B?YzdSTWJwVm1VSWtlamJvYWdOY1BINnhDNmgweEJuVk93eGxKUTlaR2EvQVRJ?=
 =?utf-8?B?aXBJNGp5aEYwNTN2QnpQTW9LUURucHU3ZSt5YVY0OWJGcDBNcHpuOG5Sa09W?=
 =?utf-8?B?M0lEVDlLZVFGMjh4TUlid2ZvQ3F3WGFKTFRKYVAwU2laQ2VoSWE1TU9JaE5O?=
 =?utf-8?B?SWc3QzN3YnFXT1FBNCtvRE00K2VndnRKN09kM0pLT3gvWnNKY0tMWU4yRjdX?=
 =?utf-8?B?cUdyVUlmejJ5Nk4wWU9XSmd0OHBPWVFjbEpzU1BlQ2Fhdmo5SzlWRW5FNzdS?=
 =?utf-8?B?bFM3aUM3UVJhOTB0aVFpL1BrcXJsd00wSzNaT0FsaHkzQ2FvUjdaT0JLZ0Jo?=
 =?utf-8?B?N1h4eHYxbU84Rk1sSGRCQitmbmEyeVZ4M3RvZXlEN0VMYVhhTzNWa0tsbm52?=
 =?utf-8?B?UGZQTlFHQUdwSHRCemdKZ2k0YzR3Tk5YNjl3VUsrSVg3Ry9NY3JiK0RYeGNv?=
 =?utf-8?B?TVB4bnZxR0tWU3puRUR1SWNNeFNHcElYcGRONWpiR0NLcWdjdFREbFpnQ2pL?=
 =?utf-8?B?TGF4SW8ySHkzNnNWeTZZV1BBSkx5MlBacVU2RWpCVFpzS0x4blY1V2l0Z1Bt?=
 =?utf-8?Q?+lwWCgItIy9FRTUDezFOnKA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d031da7c-cc03-4657-d392-08dcaa01d405
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 03:53:21.1425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pWytSMXPzOqL8k9ObaspkqfLagIsgvT3uQ4cHTfjVjRJO8N9/JVONtW8GNYlrl2PdxWzqMXqD1sArZk1PnjEp/EpdXZtMzRMdC2T5epCgDo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5144
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



On 21-07-2024 04:50, Matthew Brost wrote:
> On Sat, Jul 20, 2024 at 11:14:36PM +0000, Matthew Brost wrote:
>> On Sun, Jul 21, 2024 at 12:34:27AM +0530, Ghimiray, Himal Prasad wrote:
>>>
>>>
>>> On 19-07-2024 22:53, Matthew Brost wrote:
>>>> The size of an array of binds is directly tied to several kmalloc in the
>>>> KMD, thus making these kmalloc more likely to fail. Return -ENOBUFS in
>>>> the case of these failures.
>>>>
>>>> The expected UMD behavior upon returning -ENOBUFS is to split an array
>>>> of binds into a series of single binds.
>>>
>>> Would it be appropriate to have some doc/guidelines in the form of drm_err
>>> or kernel doc regarding expected behavior from UMD if the ioctl returns a
>>> -ENOBUFS error ?
>>>
>>
>> Yes, this on the todo list as part of error handling cleanup for both
>> exec and bind IOCTLs. I think kernel doc should go in xe_drm.h with a
>> list of errno returned and expected UMD actions. Eventually I'd like to
>> get this in place for all IOCTLs. I was going to work on getting exec
>> and bind IOCTLs fixed up in the next couple of weeks (we have an
>> internal doc of required changes) to have it ready for when Thomas is
>> back (2 more weeks).

Sure, that sounds great!

>>
>> I made this change as we already have -ENOBUFS implemented in a
>> different failure point for array of binds (BB being to large, see
>> xe_migrate.c) so might as well just finish up this error code to make it
> 
> Also see xe_sa.c, search for -ENOBUFS.
> 
>> complete as it is fairly simple change. Also Mesa has a MR [1] inflight
>> to handle -ENOBUFs situations.

Makes sense.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>>
>> Matt
>>
>> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30276
>>
>>>>
>>>> Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_vm.c | 12 ++++++------
>>>>    1 file changed, 6 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>>> index 3fde2c8292ad..b715883f40d8 100644
>>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>>> @@ -718,7 +718,7 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
>>>>    		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
>>>>    }
>>>> -static int xe_vma_ops_alloc(struct xe_vma_ops *vops)
>>>> +static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
>>>>    {
>>>>    	int i;
>>>> @@ -731,7 +731,7 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops)
>>>>    				      sizeof(*vops->pt_update_ops[i].ops),
>>>>    				      GFP_KERNEL);
>>>>    		if (!vops->pt_update_ops[i].ops)
>>>> -			return -ENOMEM;
>>>> +			return array_of_binds ? -ENOBUFS : -ENOMEM;
>>>>    	}
>>>>    	return 0;
>>>> @@ -824,7 +824,7 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
>>>>    			goto free_ops;
>>>>    	}
>>>> -	err = xe_vma_ops_alloc(&vops);
>>>> +	err = xe_vma_ops_alloc(&vops, false);
>>>>    	if (err)
>>>>    		goto free_ops;
>>>> @@ -871,7 +871,7 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_ma
>>>>    	if (err)
>>>>    		return ERR_PTR(err);
>>>> -	err = xe_vma_ops_alloc(&vops);
>>>> +	err = xe_vma_ops_alloc(&vops, false);
>>>>    	if (err) {
>>>>    		fence = ERR_PTR(err);
>>>>    		goto free_ops;
>>>> @@ -2765,7 +2765,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
>>>>    					   sizeof(struct drm_xe_vm_bind_op),
>>>>    					   GFP_KERNEL | __GFP_ACCOUNT);
>>>>    		if (!*bind_ops)
>>>> -			return -ENOMEM;
>>>> +			return args->num_binds > 1 ? -ENOBUFS : -ENOMEM;
>>>>    		err = __copy_from_user(*bind_ops, bind_user,
>>>>    				       sizeof(struct drm_xe_vm_bind_op) *
>>>> @@ -3104,7 +3104,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>>>    		goto unwind_ops;
>>>>    	}
>>>> -	err = xe_vma_ops_alloc(&vops);
>>>> +	err = xe_vma_ops_alloc(&vops, args->num_binds > 1);
>>>>    	if (err)
>>>>    		goto unwind_ops;
