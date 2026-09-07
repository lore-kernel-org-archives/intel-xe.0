Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43B1C79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 08:16:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4753910E2D1;
	Mon,  7 Sep 2026 08:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y7kG+QCr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3035A10E2D1
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 08:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788768979; x=1820304979;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=m1ySD1B9kjFQxgb0i/1uNMdbAXD5pbBILLUl0LZIHro=;
 b=Y7kG+QCrly4zU/AKQy4zpGEFH4VHKhnFVWqBg1wVFvqdJo5JYQYtY7I5
 Pu6q9ZLolqBhiuHXh5F4N+wnk9MTi/mN9uL0G55zSsQT1/NTqJX8DJzx/
 muHeckpoEsgscfroo2BVvP0rjJCGz0Hxk/1eLf1FoOD5Y++w8l+/EuUsD
 sFp4eojvLDcvvvskdIFCgyX2GTzXrJ7a7lUz3vLz7DcXyLE5FFpGJtDNx
 sMZy/FUvGckF/YyXVsWr6lunWJoU1tLF4t31x/P6m2aY4BaAnJPWCoFLV
 hU25/rSSBoql+LPZ2W8GvK2vKt8QIx0y0Tgpb6iKIvjb7mBUiZLb28PmH Q==;
X-CSE-ConnectionGUID: oAJrv8h/SNGCYyLlkw5CFw==
X-CSE-MsgGUID: q5hPTZaTQuCecGa+QMfR9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="99827810"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="99827810"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 01:16:19 -0700
X-CSE-ConnectionGUID: SofwJqgLTfO3pyX4G2s3EA==
X-CSE-MsgGUID: 5b4t3jMORZ2HOW7myxNr9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="266296158"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 01:16:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 01:16:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 01:16:17 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.8) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 01:16:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+tw1rWQsHt+QPcL2/Ky2HZelrG4LgK98KkrGbGO+cN5l1f/Je654YETuqO9/fY12wAEeOHLg0Ul9oT0QALQZZwOm9FjA8mtMjdbNQb7dSEB6pvdDX3ha/arYTanQuhSZ85IVqNTKC/0cLxCM+EZFOD5eU3P96AkuYTNmJ7NjbDbQW0E+oFzPchGIX2G0+sB2Ef6UugXRjEj0DPEwdONTg/5EIBS3dngRMGrV958yDANQBMFdOoFNH9j7nug3Rf514JC6Jhzpf86iBssIGJlpMhMrSwSVXCvHBe4U4kRpW18hrfGiOkvAMbYg3NaZXOqfR9rCNOXryZDB18DQsIDqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m1ySD1B9kjFQxgb0i/1uNMdbAXD5pbBILLUl0LZIHro=;
 b=HyZHjpnKAAxRqT+3axdlFU9q/7SgGAk3+DpdWXcKsaCgka325Z3wiJ0KL+myFgRXLcLm0eol8QThUCyk6qnQi6LpejF3ev1/qzKFyyOVLAL85H0A79TWtGFvDxRur5JN08edf6KgesjMkaIC0C+yX+KnKWID2oFUwwO3ad88mxXEksTwVk8/p+DgoRLLjRdJrZ7UseDhGZb4L1wshmIkX/61OHp2tfcdymLV05HY9uTMp5letM+THWhkKOklzT05O2Um3jB2EKcURzL/9DDEso3uDyDMAL8HMQN2fYWUecgr6Ks763hh5yj9mT1WRY4Yqe/eO9kwRPTYIsBcKM6Bhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by DM3PR11MB8758.namprd11.prod.outlook.com (2603:10b6:0:47::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.14; Mon, 7 Sep
 2026 08:16:14 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 08:16:14 +0000
Message-ID: <a60bc30c-45fe-43f3-aecc-bf3e7e4015ac@intel.com>
Date: Mon, 7 Sep 2026 13:46:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/cri: Expose device UUID through sysfs
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <mallesh.koujalagi@intel.com>, <aravind.iddamsetty@intel.com>,
 <heikki.krogerus@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
References: <20260904160608.2004174-4-badal.nilawar@intel.com>
 <20260904160608.2004174-6-badal.nilawar@intel.com>
 <178875733653.24152.9971461946293121474@jlahtine-mobl>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <178875733653.24152.9971461946293121474@jlahtine-mobl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0141.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::15) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|DM3PR11MB8758:EE_
X-MS-Office365-Filtering-Correlation-Id: 59316466-722f-4302-56cf-08df0cb848d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|10067099003|6133799003|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: ZO2gJRl03X4QcuytwOik0MSLu6KvB3juVYmKN1cA6hUmDJVbS3mZ4NKR872krtB6uGSNAEGmD6SOhBCeFVZHe0nf7svTCFXHmGrLq9FJ60E67xSPKc5WaZZD6pVt4lcaXQJDh+Y0awUijGamJLe8GqxNMkZ1rLQiq2jZsJ4B3E+GGJSXidyHzt7Sp5Gv9tulFyoLx+OO2OSsAp4WTbVDpwtR9egqULRxqHzJRpoCpebz7Zjib77iiTBLNRTvmvxm9ulnCdY2BXYbPAxdfu+2IDqS7fz+iwVDxKT1wBISTVhToKYcVeV8/Nqv429KHIjfqn53/vObqUEqtu4zRiyoBLnb79iHXedYmXfePfxgkUTOLwdlF5vFfwuhm3y8bUMR+rLEmlvmjLq/yBM5UZ/mTlry6m33gP+G6Fo9+0mCEy+6eRSR8dppJFtK4T2uGa0uWSsW9+IJgJwZRcmVzYX0+JiFQy4NyzVS1ci7Spm6Z/MqxzTo9Fcp5x7BpKXsnT4tWf+9KNUkl4vVc1OsAymQhatlr+Kyt25/J0lJO0++FfXhNVZPxlIfWbj5cbazqRh/scO0sLYrXiP6QyDYOGQZMWgBWsuEDi7fTna951ICHtM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(6133799003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qlh4emgrSjZXU3Q0dDd3Z1JoQVowVmc0aWhRQWZzTjBHMXdJSit2WDh4LzNF?=
 =?utf-8?B?UFRTcFNHWVpYcGh2Zmhjdm5UYXA0aWtmVVI0UUFhVHNhSmNZU2c5cUlvZmFo?=
 =?utf-8?B?Tm9yYUxiNzJQVkZXWnhsVkMyRGNRTHBhUTc3Rk05OGRwMGwvdm93K0RmREFU?=
 =?utf-8?B?TXBmNVVJUzhabVBocmNqQjJmVmUyLzBzT2RZZUszYTIzcTdabGo0and6WEdE?=
 =?utf-8?B?dG9nN05JUUttN0wyM01KTHI4NDM1U1NZeTRTWmtXODBXTmVmTy9KdE1ZWmhJ?=
 =?utf-8?B?eGE5bEFyRkJQblpDcEgvK3F2ajRjVVg3WWZHOUlqaVRraXNpM3BoUGYyVVd0?=
 =?utf-8?B?OWVwc2tzVml3dzBXdkI1dGo4dGNmd0YydHAzYkx4Vm5rQ3B2VjBZUWlsRmdO?=
 =?utf-8?B?MWJRbFVjRVFmRm9IZlRweFcxaFFBR2ZwMy9xVm5NdjBXMVRZbm5PTzhFdDlY?=
 =?utf-8?B?WlA4dHNBbVRuZGw2Rjg5blBTZGtzU21MUlBPWWdMK3AwY2xkWEtid0JaM2lI?=
 =?utf-8?B?SU5uNVpNYWZWQ3pHM3lwejNuQU9yMGN0ODlRUmhWZlRFeTc0ZTV4K0xQOE1q?=
 =?utf-8?B?MDRuVWRCeEJTMkwrWU1lOStXcjU4ZnFNSE1tTng1NDVSRG5JTDMrMVVtUktG?=
 =?utf-8?B?RjBqZVpua0pGdjFmc1JncXdrYVZoVFZySG9SKzI0NHM1RlZBTjlEeWcyemlC?=
 =?utf-8?B?dG5JQ0pNNGJFbmYyd1Vuazk1K0c1ZXhjMmVNODZGMVZyWVZaVGNqUld1ZVVh?=
 =?utf-8?B?dldoZmN2dlFOSFpDYXRQSURxdHBVK25WZzhVTmFvMmZLRVVZb2h1OUJ2UUU1?=
 =?utf-8?B?SGl0WHVNQndVNjB0UlBGbDhDK3BmUWhKTXV3REVMUUpOQTlKUXVIV3NYdTdI?=
 =?utf-8?B?cjMzYnB5dUZWdXk3ZGFpMlJlQ3Y0YTFnbjd1MUNKaGNwS2RtUDFYVW53cldP?=
 =?utf-8?B?K2Y4SmkvUGhIN2FacVU0V3JISStMdUNkSkhmNDdERGo1SEk1a0FkUkt0bEpQ?=
 =?utf-8?B?ck5SK1dDRm9mNDBWRGVkM0ViTmo1MGY4ZGpGeTU2aHVNRVhxMjZObFUyYWFW?=
 =?utf-8?B?aGxqOUo0REZDaEFQemhxTkh0bXcrWmhDZHV1NUZsbmNXWnZBelFueERYM05l?=
 =?utf-8?B?R2VFNU5nNFV2T2xueWt6UEQrS1pWbDNWL1lQWnJCVnd4TDFpTUtNZzZhalFp?=
 =?utf-8?B?aGhuR00wZ1ZXQzZUa1A5MWtBMHdtRmVlelUwWUtjVjNSN0ptbFUvNUo2S05F?=
 =?utf-8?B?ZjFEbklBU1FjcUVwNm9FUFRIYnZ1TndMOUJ0cmpnc2puTUlNVWhlVjEvdUVN?=
 =?utf-8?B?NUZlTFBVSlBQOGE4a1Mwb1dtYzU1cGpoU1FlNzdtaUd0NHMrcDBXVExCVHUx?=
 =?utf-8?B?UzFTQ0ZtMTAzUUZEcHk3TU95bnNXRHNpeThRNWV0UG0yR28zTG84WDZtemhP?=
 =?utf-8?B?M0JRUWhDdVZiOXdWZ0JWVllReUlJU2IzWmw1TjdCRWlFZjJ3c1IwWUU5eElt?=
 =?utf-8?B?bWk2NzdXdVNoODJEYXhxSTNvT1RDaUFlTURVWUthWlBHZGJDMXdvdUFHaVZS?=
 =?utf-8?B?UjJ2Nk8zeFJNSkhTcUNjYkRGdXdUejZacGx5aXRmM1htWHByZWZSVTZNcFFt?=
 =?utf-8?B?VXJrZWg2RjVVNWJlZUNnS0x4cm5mYWtmZzdzTGp4dlpLamRBZW5pb2xVODFv?=
 =?utf-8?B?b3FhNndmVEVLWmxQMWFqN1hqYkV0bEw2b1YvZXgzMFZVOU11L2VSaDB4WUpk?=
 =?utf-8?B?NkptREpmRDJyL3RIMnB5bWdLcHBFT3JmV2V6YjBIcExvRjBKc2NHMGpOemFL?=
 =?utf-8?B?OHA4eEFwSzY1WUhhRUJlc0d1a2ErU1E1ckMrRXZDamVjeGhkblhGVk1sbVZl?=
 =?utf-8?B?TmlHQnQ3OWlzaVp5MEkvUGQwbjErczlyYXVFTCsxSnMwR2tjSzJPWGlQOXZp?=
 =?utf-8?B?MS81YktWU1ZrRU5Hb3RCL0gvQWM3Y2k5ZWdCbS81amhWa01hUlVsY3dGdTNH?=
 =?utf-8?B?OGlvekJ5cXFiaTM4OURtQkJraUppemtybzhKRmk5dVc1R1VWNmRKMGVMUnUw?=
 =?utf-8?B?SVkvVmxnMEJKbnlkQnkyVEswMHNCRGp6aDRjR2lBQ2dQQUdCTDl6LzVOSXZW?=
 =?utf-8?B?cHBxbWpvcW1nUXVOQVpuSFh2aDB1T2FIR3FRMFZKaVZONnZqbENLVzViVkdy?=
 =?utf-8?B?Z2F5elB6ZGl2a0lPWEVmRE5CMGpRWjJuT2VvUEJMeGxWdlZwdHBrWGFVUXJo?=
 =?utf-8?B?YWpxK1hEODA0Y0daTnRyMmNrenZqZHpOUkZvd1Z6bFNLU2VUcU5ORWNRODhk?=
 =?utf-8?B?VjlhUU5WWnlObXcrb0o3MmpnRkF2a2VVQWx1Nloydkd1cTJyNTJMZz09?=
X-Exchange-RoutingPolicyChecked: Suh8Q6HsjeWa/5xX8g7wPugtKh5x0qaW8T9O+R1Ak6yOjWQtoM5AcNVXkKLj15gDJKCjdv3tP9G8z4qx098UBRIPOT9afTMJm99vDRStenTwMl/iMS29HVa/OCrxZXu88BQD1J7V3M5s8EjtnFTfliaVNctyS00FEA5dlLmakOBw2vGDfDW+CvFstn6dILvnV01qo55CcDh+8Y/SlMuCnzgKOe0ckwZs5U6JsL9+NJWjmnslkjkEiCTbzRN6cDH2mzD7wiMeYfe6LAaEXljtq3Yif6ZGmTgNNwjEqv6NkWdPiNKJw3tb6stTBm1+VS46JFpnOrxmEf7rS2cP0j8d8Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 59316466-722f-4302-56cf-08df0cb848d5
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 08:16:14.6128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4l2BKqGj/v2+fEOZPif/znQnWqHJ9xa+LQz0iir5RWWgrSfz/Ufpw0iLxEz4xS34oaOZUwOWvdP2Sq6E0qHp1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8758
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


On 07-09-2026 10:32, Joonas Lahtinen wrote:
> Quoting Badal Nilawar (2026-09-04 19:06:11)
>> Expose a read-only sysfs attribute, device_uuid, that reports the
>> GPU's unique hardware identifier.
> This patch is not exposing UUID[1] which has a well defined
> format for 128-bit numbers. Instead of Universally Unique ID,
> what we have is just 64-bit (locally) Unique ID.
>
> You should replace s/uuid/uid/ everywhere in the patch.

Agree I will rename this as device_uid.

Thanks,
Badal

>
> It'll be up to userspace to hash the number with 64-bits to
> generate a UUID. Same as with PVC.
>
> Regards, Joonas
>
> [1] https://en.wikipedia.org/wiki/Universally_unique_identifier#Format
