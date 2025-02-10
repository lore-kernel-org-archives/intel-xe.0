Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26A4C02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 09:05:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9661F10E070;
	Mon, 10 Feb 2025 09:05:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="StZe39IN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C8410E070
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 09:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739178310; x=1770714310;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BOpvGO9hfZXrZdZdMj+dMG4abIzAYWUgApJSuQlQa5k=;
 b=StZe39INr1SGDXa5/L5yICYSZGBvsBadRx+SwFPuDcGa+sCsWZImqY2B
 EH1Rpsl/S4H8iM9fhwxVCbgKCp9Xrr3mOukgpcc8BPtuRivQTU0ajFOpn
 coH6f4hpRKdf6OyJALJ0RNPRL75Gv1tGj1akAcnbiaUhAkVVRGswcmCJf
 WGtGmbj4FKfghD7/Tz9+X0OUfJQTU4K3wxwlUPtaTKA1i7nRiQBmBBvUS
 VcD5xwH00Ggh34nvzB2O6c3Wtv08CVps8myAcFzLTodhRfBwuCL0bIr/c
 hxbFgG+uabxaKsIlHuIuBx+Ue9arsrU2jg+b+4ckue8HDCSMAJBONxxJs A==;
X-CSE-ConnectionGUID: r5EeGSNVQiSH8KBYjyClAg==
X-CSE-MsgGUID: ZsF8CMnQTACTr9lKVQJMRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="62225313"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="62225313"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 01:05:08 -0800
X-CSE-ConnectionGUID: FhHFgSkOSvWENWPxp9/PqA==
X-CSE-MsgGUID: hxIoNR8uRlWyYtG83adffQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116196308"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 01:05:07 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 01:05:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 01:05:06 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 01:05:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mgGqvQ5b/IRIO7RuYLQPliT1iiHLBs7HBHGr6MGVKr1MGCW37HBkl7Ja1VJgVlknc0GsG5vk4cSs6S/KmV9MK2Si05VU1ezcVd3jFBG7zbtQAlUiS/iJ+SPs/LFtzGpeMGyw/9VSdDXLUtTdTfV1xdHawWDOf9V7z26bDsKCrjBCFSY9fK3pgCyeRclImchgIOmJUxrZEYNaXZYn0hA7DEVjdEbzTxuMTuOsk5l0SryGjRrjBlGDJ+zt8f4Js7c4XwE5XOADtGLEYSoprD2urb9xuFhcdSy6QC4Pd25cDGqyzx5PJGuZuF4W1bAziboBALUhHRI+W5tSz/BuddmVgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opNTkcFJCzoNb5+z1t1Di7h7gdr/dJuOMt5uaVLts7E=;
 b=yex5gJT/kdfXicSXZO4TaNs6F3pyu/E4a7jJyyaTE6d2QZZxbzxXePuoxrU9dk0oY8J7GHs3cs+Ugjw1GS9fukJjXWipvTw7KHyn9mDhQOeLm0xll4tzWNDP+DTC0VGAbYHuoKy3F2D1ooUtDYPDW/r8Ic5MBFdl7rXtUSi0J9OeY4chVMJJFhdcFjFQ8uJfzIiUdJ+DYeJ5cjs1erMkNGWsXnbEOMau1wPyY8blJsAb5x2nb/gyrQFcx1l6o//J8x5fKz3Rm3z6Q2lYATINB+qFDmm3rccV7YgEoNar8PYSI6kDxRgT22ydZW/JYQk2AMXQncr7wnYMOtKvCB1rqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH0PR11MB4935.namprd11.prod.outlook.com (2603:10b6:510:35::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 09:05:00 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 09:05:00 +0000
Date: Mon, 10 Feb 2025 10:04:51 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cmUgZm9yIGRybS94ZS9w?=
 =?utf-8?Q?f=3A?= Use an explicit check to see if the device has LMTT (rev4)
Message-ID: <20250210090451.xcpzpbpilb2xjxht@intel.com>
References: <20250207113111.853821-1-piotr.piorkowski@intel.com>
 <173897683483.2933703.5323107585989525565@b555e5b46a47>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <173897683483.2933703.5323107585989525565@b555e5b46a47>
X-ClientProxiedBy: ZR2P278CA0006.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:50::12) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH0PR11MB4935:EE_
X-MS-Office365-Filtering-Correlation-Id: f2f0fca6-ce8a-420f-ad08-08dd49b1ff73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFBEQ2tnRDZMRHBnR3pLK3pmUXVSMTg5WmJ5emExWkNuUmoyZm53S0N0T1Qx?=
 =?utf-8?B?eWUyVlBPajVBa2RZR3N1NjZVaVYrMFpwd0ZXcHR2K0pYWlE4ZXhpaVRETmJK?=
 =?utf-8?B?RjBvOHU1Y2JMTmwrT25HVG9SeVRRL1ZpaUdxM3U3V1VKZnY1VFMwRGNWNzlr?=
 =?utf-8?B?QUdJWjVYa0UrdnhRY0h3Wi9XeUVQclM0SmxkNUJVcWREKzc5NWs4WE9yaWhZ?=
 =?utf-8?B?OWhKN3phdnNUdGxQOXc0azRld1ZsbnA3SHpQZ2VvbC9WYTM1TnRGK3dTTmZT?=
 =?utf-8?B?TkQ0c1NweFpMZjJUcHBtZHZzRlRvUEhMdUhDOURxMUN5U1lITkQ5L2c4N2tL?=
 =?utf-8?B?VDNsTGRKSkp1WjZFRlF0WW4xb0FLQm9VcFNFbWpDdWx2Vkg2dlNlLzJKNDd6?=
 =?utf-8?B?U05QU0E4bklzbWZtcmlxQXh1cnJ4MUYrN3k5L200NkxMekFadndZMlhtckM3?=
 =?utf-8?B?ZVFaTFYvbkdtKzR6anU2ejBrdTVDbGVqSmFYa0c5OERCcDBtcFVuaGtDWHVj?=
 =?utf-8?B?VjFlM3pTVnVlb3VGRGtCRFFGYW1CMVE2NC92dm56L2VOdEJsdGR1MzNKQWVF?=
 =?utf-8?B?eHllNEVaS01WZVF4ZlFJejdxY0hLaE1qektLYWZFUndMOWs2aWVYQkRadWdE?=
 =?utf-8?B?TFJOZnBuaGpCclFCQStKaEoxYUhKKyt0RExGMTdQY0JnMzl2OVNNdDVoQ0Zq?=
 =?utf-8?B?aE1ZRXhTVTllWFhHbnNKdDlrWkw2V3hGdSsvdTBSajdzeVQxWVFrT0FUS0ZR?=
 =?utf-8?B?eU13akdsRkdGVm1VUDZWRGhwT3k4d3dNNTBjdGVrZkxSd2ZNZzdiMjcreldG?=
 =?utf-8?B?aUJkc29WSFFSdG1GSWczVGxMSWdLYzQ2TWpqWVgwdk03d2JRVTNjNkRNV016?=
 =?utf-8?B?RXlmMndLemlaWS9WV2JhcjA5L2hsN0psOW5sNUJ5OVZTY1dxc2cyRFp2Rzc3?=
 =?utf-8?B?V1VOeEVRSUVuRHFOYkVmV29xZ1cvWVJydWdldTdhT1NRTHpRRFF5ajArdktP?=
 =?utf-8?B?UFQ4MzdJNG5NUVlJdDFHOHAxVEF1cWlvMFpxVXNmdk1yTDBQeU16cHVQTWJ6?=
 =?utf-8?B?WkFQdHp4SzhaUXFHbUpQZzZmejcxVUt3Ly9BSUpCZDYyTms2bFh6TjFSTnZC?=
 =?utf-8?B?VmkwVFJIZDJGekw2cUw4UTU2TGFNUTM2TDlIOHBWTm9BVW0xRURFeHFNU3lP?=
 =?utf-8?B?NVh3cmZqZk5ISzM2dXFpbHNBcEZzK1Q3YmxETkx0ekdFSE1aSGVDdkJLQlhC?=
 =?utf-8?B?dEpMZ3JlWU0xTFJsRndUaTliQ0RHZnV0WldzU25aWUZTRmNZQVRZV1loQzF1?=
 =?utf-8?B?OVVxaHpnMHE5KzRyTlkzL29iNHp2YXkweUY0S0hkaXdGU0lvcUhHbUpUSUdW?=
 =?utf-8?B?Mm1USCtQcVh2aXgvY2Vpb0xjNDVrN2JueHBmSmx6TDlFcCtDSndoQ1FJdnZt?=
 =?utf-8?B?NFAwVXdDK1ZmbmlwSUMrWFV1MFRPa2tzcVJZM2NIWEZyNmhEUkVIU1NoODB3?=
 =?utf-8?B?cG5tMUplU3hFa3FuM0dOWnlaVnZGc2QrQ2V6cngwR0JweTZEUVN0N0Y3dVRw?=
 =?utf-8?B?RFRwYmlFeWFwaXdSdk4wQTE5RzhZcWtTTENJYzQ2ak9YZTJXdG9zcXU4RXo2?=
 =?utf-8?B?MGlwa2JSTHlrSk4rcVMwS09YZVFGUFZYaEVUZklzMlV4ZmFnSWVZQ0FpMEtI?=
 =?utf-8?B?eC9Fcmw2VVJEWTNiUkVZcENwTFcyRmVvM0VZWUh0S3ZMTE1pOXgyNDV1LzlL?=
 =?utf-8?B?Q1V1Tm0zUDZkMjVWV0pWRXExOU82cWc4MzRwWEVzbGxPOTE5S2J0NS9HZi8r?=
 =?utf-8?B?RkhiUjJZa3M4Sk5waS93QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1paYWg3VllwMmZtem9mSW1Da1NtWU1wNHZFZzFDbDFDM1Q2cEZ0WkpXb0FC?=
 =?utf-8?B?bHczZC9USFVuTlVHTzg0MlBQbnhMTU9MZ05MYVhkU3FUWmMwUHExY28vM2w2?=
 =?utf-8?B?bGtYOFBFQlIyTjZLNHByaFBYTE9ZMHhtMnBGUVhyRnNiUjZqTFI5M0U2ZzJm?=
 =?utf-8?B?SFhYTEwxUndkV1Z4bFpwcDFPQWtSWHlsSHpybXl2TGhpcDU1VDF5TWFwZWhE?=
 =?utf-8?B?cmlUblVEajV5VDdnUHJ6Kzl1QzU3ZFo5dmxpQWhLRk5BVmdPOElFUUQ2WWZV?=
 =?utf-8?B?emVGMUpaUWpOeDlKQkt0RVR1WGFXQTlVOTRUT0x4R0FHeWdERyt4eURCNDdu?=
 =?utf-8?B?dnlsa29QeXJ1Rmh5MnhYWDRmdHgvNHhDZkRPQUVJVlgycEhwb25halJ1eTBJ?=
 =?utf-8?B?ZjRTQmNaM3JQblRhOGhmamVTc3BkUlo3OVdlY3NKSnFVbEM1RDZzTXplbWxQ?=
 =?utf-8?B?MnNPYUNJeTFrVWZwVjNLN2Z2ZXR5MnlUVHl1VFJoN2NPOUZIUDlxSXBBVWkr?=
 =?utf-8?B?SkFsQUZYYnpqZTdBUXhjRVRRaGtsWWk0R0N6VnUyQW00dm13WHRRQ1BJL016?=
 =?utf-8?B?ci82ZkNEN01FUVQ5VW90WkoyOEZua2xwQmFDd3F2Y3NKQjdFc1J0UGNTeEN3?=
 =?utf-8?B?K2hlMVRmdEFGNXFTYlR4djZaSmdLVTJIT2N2dEVXNy81K3FWbFUwUk9ZT3I2?=
 =?utf-8?B?VFdacUdkd25RNHVtNjlIZmF6UWNLZUF5ZnZCd1BUNFNrMnFmVVZPR01CWk9p?=
 =?utf-8?B?ZG50djl5OHBKU0ZZSmJ2L2o2ZWJZei84aEl2aUZEekNnUlpxbTl3WEQyQXBu?=
 =?utf-8?B?TldrNjU0ME9QRERUWmhRVFdiZmVuVjVmaGU3dmo0U0l5azNUUUtabXhGQzhL?=
 =?utf-8?B?eGRpTHZjcERFRlRLRjJ0d1pCMzFFakZsOUF0UkFzcWZzbFJLNjZhUDJ4eHlk?=
 =?utf-8?B?TytGSE5wb1VjQmdDK2NTVjJZSUlLZis0MEdybzRrT2tGUnFQQU53SkVhNjdD?=
 =?utf-8?B?SlloQjFNZ1B3S085QXBCY09CU0t0bENsTXlDbkRqa0tHendzZVpGR2kreUJO?=
 =?utf-8?B?NmRlQXE1S2pVcExMSVRSZ0pSalAxOTk3N1U4VFc2TGx5dVNWaFNockJCQUtN?=
 =?utf-8?B?U2p4ZEk2Y2VKTkFNaE1iaU8ydFg5UDFSWG8rTGxrNG1odnBkZ1h4d0dvQ09q?=
 =?utf-8?B?b3k2MmdHQ2d3Ky82dEhLV1Y2VDVIUHRKYmFiV2RielBlSmNZSlNqVUNLdHg1?=
 =?utf-8?B?cDRTTUw0N2tNNklpNzdaUVdiVXNRZEMzMENpdTdvQ01BSnJCOHQrTlZYNWdi?=
 =?utf-8?B?dHo2ZEpLbXBCellyOVRWSWhNckNOcVFvZXFmNE5pSmg2cTJkb3RTb2VPcnNG?=
 =?utf-8?B?SkZHdEY0WFJ4dkZjT3RjdjF2Zmt6b01va2M0U0x0U290M3pHS01aSmpjeExH?=
 =?utf-8?B?R3FkWkRTK0FJdlJyRlNTdm5Sbkt2bkc0RERwUDR4eUE2dldaYWdTcG5kYlZE?=
 =?utf-8?B?cEtya29SL05WaU9CRW9Vd0V3dU0zVzExOFJZWkU5dXRyTjlObUsrbzExY3U4?=
 =?utf-8?B?STNWTVVzbDIwc1RnWmt4NFVUQys5ejBUc1FORUxnRHQxS3M1dmI3ejVFV05o?=
 =?utf-8?B?TmFuQ3EwYSt1RnlrUkNVUGFpclpsYXNEdmRkdzdTcUlyRkVxUVNZL2MzTjJL?=
 =?utf-8?B?eGMvUU1WcFNPeGFzbFlDOEF3bGgyQ0dJclZQdmVrS2c1bXZudEF2S3hjYmxK?=
 =?utf-8?B?cFU1anBRWjMzQnUzWEVGT1p4QjJPcWpFZmdGSktvNjQ1ekpMeFFXakRDL2Rz?=
 =?utf-8?B?RUE1d3hZUTl3c3U1c21qT2hGc3RaNUVmRnRzK09DY0ZobS9sZ3pzeThCazhB?=
 =?utf-8?B?czBKaVB3aXMyb1VXVHZaeVZoM25NeGZHb2p0MjB4V0hQemZvYVZtRHBnUVZD?=
 =?utf-8?B?VTMxS1E4aEFjbmhNUEQxZDMvdTRyNFNubVJtQ0ZDVXJMdjNFdDI3SzlLbEdx?=
 =?utf-8?B?T0l6TjcrZVJCQUlkcSsvZkhQMFNaSFR3Z3ppZjlrT0VzK2tTZUswZk5mTUVQ?=
 =?utf-8?B?elllWDU4UDNZUVk1dkZwZjBJZ0hnajNuMW5WK2tCeU50dGJkMUcvYjhucmQz?=
 =?utf-8?B?MnN3Sk8xc1dWanFtSHNCdXppc1VlMEVTZ0hDYnZaMEpRMXUzU0Y1ZXY4N1hF?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2f0fca6-ce8a-420f-ad08-08dd49b1ff73
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 09:05:00.2932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IdXunlMevIJPokfR2U1kdkgOiFOmbH6TT4o4tQ2xxcEIdBPuNGnhmFS4+hriHQJrxrIEhEj9iROZVN+GCaGPJ579aRN9l/8zC5NcXI+Z2sA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4935
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

Patchwork <patchwork@emeril.freedesktop.org> wrote on sob [2025-lut-08 01:0=
7:14 +0000]:
> =3D=3D Series Details =3D=3D
>=20
> Series: drm/xe/pf: Use an explicit check to see if the device has LMTT (r=
ev4)
> URL   : https://patchwork.freedesktop.org/series/142212/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from xe-2614-a05904055d959d068edd472132e9e4939888832=
d_full -> xe-pw-142212v4_full
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
>   **FAILURE**
>=20
>   Serious unknown changes coming with xe-pw-142212v4_full absolutely need=
 to be
>   verified manually.
>  =20
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-142212v4_full, please notify your bug team (I915-ci=
-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in=
 CI.
>=20
>  =20
>=20
> Participating hosts (4 -> 4)
> ------------------------------
>=20
>   No changes in participating hosts
>=20
> Possible new issues
> -------------------
>=20
>   Here are the unknown changes that may have been introduced in xe-pw-142=
212v4_full:
>=20
> ### IGT changes ###
>=20
> #### Possible regressions ####

all unrelated to current patch, appear to be related to  display - changes =
introduced by this LMTT
patch and should not affect platforms without SR-IOV (DG2 and BMG) and plat=
forms without LMEM (ADLP)
>=20
>   * igt@kms_color@ctm-0-25:
>     - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d0=
68edd472132e9e4939888832d/shard-bmg-6/igt@kms_color@ctm-0-25.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-bm=
g-1/igt@kms_color@ctm-0-25.html

The test was not completed, it is difficult to determine why - it may be a =
problem with the machine
>=20
>   * igt@kms_color@ctm-0-25@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-bm=
g-1/igt@kms_color@ctm-0-25@pipe-a-dp-2.html
>=20
The test was not completed, it is difficult to determine why - it may be a =
problem with the machine
>   * igt@kms_joiner@invalid-modeset-force-big-joiner:
>     - shard-dg2-set2:     [PASS][4] -> [SKIP][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d0=
68edd472132e9e4939888832d/shard-dg2-436/igt@kms_joiner@invalid-modeset-forc=
e-big-joiner.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-dg=
2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.html

Test requirement not met in function __igt_unique____real_main494, file ../=
tests/intel/kms_joiner.c:643:
Test requirement: data.non_big_joiner_output_count > 0
Non big joiner output not found
Subtest invalid-modeset-force-big-joiner: SKIP (0.000s)

Not related to patch

>=20
>   * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation:
>     - shard-adlp:         [PASS][6] -> [DMESG-WARN][7] +11 other tests dm=
esg-warn
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d0=
68edd472132e9e4939888832d/shard-adlp-8/igt@kms_plane_scaling@plane-scaler-u=
nity-scaling-with-rotation.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-ad=
lp-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation.html
>=20
<3> [383.196811] xe 0000:00:02.0: [drm] *ERROR* AUX B/DDI B/PHY B: did not =
complete or timeout within 10ms (status 0xad40023f)
<3> [383.207228] xe 0000:00:02.0: [drm] *ERROR* AUX B/DDI B/PHY B: did not =
complete or timeout within 10ms (status 0xad40023f)
(...)
<3> [383.228234] xe 0000:00:02.0: [drm] *ERROR* AUX B/DDI B/PHY B: did not =
complete or timeout within 10ms (status 0xad40023f)
(...)
<3> [383.622222] xe 0000:00:02.0: [drm] *ERROR* AUX B/DDI B/PHY B: did not =
complete or timeout within 10ms (status 0xad40023f)
(...)
<3> [384.368207] xe 0000:00:02.0: [drm] *ERROR* AUX B/DDI B/PHY B: did not =
complete or timeout within 10ms (status 0xad40023f)
<3> [384.368239] xe 0000:00:02.0: [drm] *ERROR* AUX B/DDI B/PHY B: not done=
 (status 0xad40023f)

Not related to patch

>   * igt@xe_pm@d3hot-mocs:
>     - shard-dg2-set2:     [PASS][8] -> [DMESG-WARN][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d0=
68edd472132e9e4939888832d/shard-dg2-466/igt@xe_pm@d3hot-mocs.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-dg=
2-436/igt@xe_pm@d3hot-mocs.html

<4> [242.410793] ------------[ cut here ]------------
<4> [242.410807] xe 0000:03:00.0: [drm] pipe_off wait timed out
<4> [242.410863] WARNING: CPU: 10 PID: 4770 at drivers/gpu/drm/i915/display=
/intel_display.c:416 intel_disable_transcoder+0x3dd/0x4c0 [xe]
<4> [242.411376] Modules linked in: snd_hda_codec_realtek snd_hda_codec_gen=
eric snd_hda_scodec_component snd_hda_codec_hdmi snd_hda_intel snd_intel_ds=
pcfg snd_hda_codec snd_hda_core snd_hwdep snd_pcm snd_timer snd soundcore m=
ei_gsc xe drm_gpuvm drm_ttm_helper ttm gpu_sched drm_suballoc_helper drm_ex=
ec drm_display_helper cec rc_core drm_buddy drm_kunit_helpers drm_kms_helpe=
r i2c_algo_bit kunit overlay intel_rapl_msr intel_rapl_common intel_uncore_=
frequency intel_uncore_frequency_common x86_pkg_temp_thermal intel_powercla=
mp coretemp joydev cmdlinepart spi_nor kvm_intel mtd mei_hdcp ee1004 mei_px=
p hid_generic wmi_bmof mxm_wmi kvm polyval_clmulni polyval_generic binfmt_m=
isc ghash_clmulni_intel sha256_ssse3 sha1_ssse3 usbhid aesni_intel crypto_s=
imd hid cryptd rapl intel_cstate igc video intel_pmc_core nls_iso8859_1 i2c=
_i801 mei_me pmt_telemetry spi_intel_pci i2c_mux pmt_class serial_multi_ins=
tantiate mei spi_intel i2c_smbus intel_vsec acpi_pad acpi_tad wmi pinctrl_a=
lderlake dm_multipath msr nvme_fabrics fuse efi_pstore
<4> [242.411767]  nfnetlink ip_tables x_tables autofs4
<4> [242.411792] CPU: 10 UID: 0 PID: 4770 Comm: xe_pm Tainted: G        W  =
        6.14.0-rc1-xe+ #1
<4> [242.411806] Tainted: [W]=3DWARN
<4> [242.411812] Hardware name: Micro-Star International Co., Ltd. MS-7D25/=
PRO Z690-A DDR4(MS-7D25), BIOS 1.10 12/13/2021
<4> [242.411819] RIP: 0010:intel_disable_transcoder+0x3dd/0x4c0 [xe]
<4> [242.412295] Code: 74 2a 49 8b 7c 24 08 48 8b 5f 50 48 85 db 75 03 48 8=
b 1f e8 c5 35 66 e1 48 89 da 48 c7 c7 f0 50 d0 a0 48 89 c6 e8 03 4a 90 e0 <=
0f> 0b 48 8b 45 d0 65 48 2b 04 25 28 00 00 00 0f 85 99 00 00 00 48
<4> [242.412305] RSP: 0018:ffffc90009777808 EFLAGS: 00010246
<4> [242.412318] RAX: 0000000000000000 RBX: ffff8881045b3a10 RCX: 000000000=
0000000
<4> [242.412327] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000000000=
0000000
<4> [242.412334] RBP: ffffc90009777868 R08: 0000000000000000 R09: 000000000=
0000000
<4> [242.412341] R10: 0000000000000000 R11: 0000000000000000 R12: ffff88814=
b608000
<4> [242.412348] R13: ffff88814b60abd0 R14: 00000000ffffff92 R15: 000000000=
0070008
<4> [242.412356] FS:  0000722d4b698940(0000) GS:ffff88888f300000(0000) knlG=
S:0000000000000000
<4> [242.412366] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4> [242.412374] CR2: 0000722d48e82004 CR3: 000000014e63c000 CR4: 000000000=
0f52ef0
<4> [242.412382] PKRU: 55555554
<4> [242.412389] Call Trace:
<4> [242.412396]  <TASK>
<4> [242.412406]  ? show_regs+0x6c/0x80
<4> [242.412427]  ? __warn+0x93/0x1c0
<4> [242.412444]  ? intel_disable_transcoder+0x3dd/0x4c0 [xe]
<4> [242.412929]  ? report_bug+0x182/0x1b0
<4> [242.412950]  ? handle_bug+0x6e/0xb0
<4> [242.412964]  ? exc_invalid_op+0x18/0x80
<4> [242.412979]  ? asm_exc_invalid_op+0x1b/0x20
<4> [242.413008]  ? intel_disable_transcoder+0x3dd/0x4c0 [xe]
<4> [242.413440]  ? intel_disable_transcoder+0x3dd/0x4c0 [xe]
<4> [242.413910]  intel_ddi_post_disable+0x38a/0x720 [xe]
<4> [242.414350]  intel_encoders_post_disable+0x82/0xb0 [xe]
<4> [242.414813]  hsw_crtc_disable+0x71/0x180 [xe]
<4> [242.415243]  intel_old_crtc_state_disables+0xdc/0x1d0 [xe]
<4> [242.415640]  intel_atomic_commit_tail+0x129f/0x16f0 [xe]
<4> [242.415715]  intel_atomic_commit+0x2ed/0x340 [xe]
<4> [242.415786]  ? intel_atomic_commit+0x2ed/0x340 [xe]
<4> [242.415856]  drm_atomic_commit+0xad/0xf0
<4> [242.415859]  ? __pfx___drm_printfn_info+0x10/0x10
<4> [242.415863]  drm_atomic_connector_commit_dpms+0xd5/0x100
<4> [242.415866]  set_property_atomic+0xe3/0x1a0
<4> [242.415872]  drm_mode_obj_set_property_ioctl+0x10d/0x1a0
<4> [242.415875]  ? __pfx_drm_connector_property_set_ioctl+0x10/0x10
<4> [242.415878]  drm_connector_property_set_ioctl+0x3b/0x60
<4> [242.415880]  drm_ioctl_kernel+0xb9/0x120
<4> [242.415883]  drm_ioctl+0x2f9/0x5b0
<4> [242.415885]  ? __pfx_drm_connector_property_set_ioctl+0x10/0x10
<4> [242.415890]  xe_drm_ioctl+0x53/0x80 [xe]
<4> [242.415931]  __x64_sys_ioctl+0xa4/0xe0
<4> [242.415934]  x64_sys_call+0x131e/0x2650
<4> [242.415937]  do_syscall_64+0x91/0x180
<4> [242.415939]  ? do_syscall_64+0x9d/0x180
<4> [242.415940]  ? irqentry_exit+0x77/0xb0
<4> [242.415942]  ? clear_bhb_loop+0x15/0x70
<4> [242.415943]  ? clear_bhb_loop+0x15/0x70
<4> [242.415944]  ? clear_bhb_loop+0x15/0x70
<4> [242.415946]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
<4> [242.415948] RIP: 0033:0x722d4d924ded
<4> [242.415950] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 4=
5 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <=
89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
<4> [242.415951] RSP: 002b:00007ffe849c1160 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000010
<4> [242.415953] RAX: ffffffffffffffda RBX: 0000556d5cb35d40 RCX: 0000722d4=
d924ded
<4> [242.415955] RDX: 00007ffe849c11f0 RSI: 00000000c01064ab RDI: 000000000=
0000005
<4> [242.415956] RBP: 00007ffe849c11b0 R08: 0000000556d5cb04 R09: 000000000=
0000007
<4> [242.415957] R10: 0000722d4da69370 R11: 0000000000000246 R12: 00007ffe8=
49c11f0
<4> [242.415958] R13: 00000000c01064ab R14: 0000000000000005 R15: 00007ffe8=
49c1220
<4> [242.415962]  </TASK>
<4> [242.415963] irq event stamp: 217117
<4> [242.415964] hardirqs last  enabled at (217123): [<ffffffff814a4c89>] _=
_up_console_sem+0x79/0xa0
<4> [242.415966] hardirqs last disabled at (217128): [<ffffffff814a4c6e>] _=
_up_console_sem+0x5e/0xa0
<4> [242.415968] softirqs last  enabled at (216848): [<ffffffff813d3fbf>] _=
_irq_exit_rcu+0x13f/0x160
<4> [242.415970] softirqs last disabled at (216843): [<ffffffff813d3fbf>] _=
_irq_exit_rcu+0x13f/0x160
<4> [242.415972] ---[ end trace 0000000000000000 ]---

Not related to patch

>=20
>  =20
> #### Warnings ####
>=20
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-adlp:         [ABORT][10] ([Intel XE#2953]) -> [ABORT][11]
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-a=
dlp-9/igt@xe_pm@s4-multiple-execs.html

<4> [213.847757] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
<4> [213.847761] WARNING: possible recursive locking detected
<4> [213.847764] 6.14.0-rc1-xe+ #1 Not tainted
<4> [213.847768] --------------------------------------------
<4> [213.847771] xe_pm/3010 is trying to acquire lock:
<4> [213.847774] ffff88810e2ec558 (&sb->s_type->i_mutex_key#12){++++}-{3:3}=
, at: efivarfs_actor+0x94/0x100
<4> [213.847786]=20
but task is already holding lock:
<4> [213.847789] ffff88810e18c558 (&sb->s_type->i_mutex_key#12){++++}-{3:3}=
, at: iterate_dir+0x99/0x2b0
<4> [213.847800]=20
other info that might help us debug this:
<4> [213.847803]  Possible unsafe locking scenario:
<4> [213.847806]        CPU0
<4> [213.847808]        ----
<4> [213.847810]   lock(&sb->s_type->i_mutex_key#12);
<4> [213.847815]   lock(&sb->s_type->i_mutex_key#12);
<4> [213.847819]=20
 *** DEADLOCK ***
<4> [213.847823]  May be due to missing lock nesting notation
<4> [213.847826] 7 locks held by xe_pm/3010:
<4> [213.847830]  #0: ffff888133e2b738 (&f->f_pos_lock){+.+.}-{3:3}, at: fd=
get_pos+0x92/0xe0
<4> [213.847839]  #1: ffff88810b6f4420 (sb_writers#5){.+.+}-{0:0}, at: ksys=
_write+0x7c/0x100
<4> [213.847848]  #2: ffff88811977ee88 (&of->mutex#2){+.+.}-{3:3}, at: kern=
fs_fop_write_iter+0x11e/0x210
<4> [213.847857]  #3: ffff888102507880 (kn->active#275){.+.+}-{0:0}, at: ke=
rnfs_fop_write_iter+0x127/0x210
<4> [213.847865]  #4: ffffffff83298fc8 (system_transition_mutex){+.+.}-{3:3=
}, at: lock_system_sleep+0x2b/0x40
<4> [213.847875]  #5: ffffffff832aca70 ((pm_chain_head).rwsem){++++}-{3:3},=
 at: blocking_notifier_call_chain+0x2d/0x70
<4> [213.847885]  #6: ffff88810e18c558 (&sb->s_type->i_mutex_key#12){++++}-=
{3:3}, at: iterate_dir+0x99/0x2b0
<4> [213.847894]=20
stack backtrace:
<4> [213.847897] CPU: 10 UID: 0 PID: 3010 Comm: xe_pm Not tainted 6.14.0-rc=
1-xe+ #1
<4> [213.847899] Hardware name: Intel Corporation Alder Lake Client Platfor=
m/AlderLake-P DDR5 RVP, BIOS RPLPFWI1.R00.4035.A00.2301200723 01/20/2023
<4> [213.847900] Call Trace:
<4> [213.847901]  <TASK>
<4> [213.847902]  dump_stack_lvl+0x91/0xf0
<4> [213.847906]  dump_stack+0x10/0x20
<4> [213.847908]  print_deadlock_bug+0x23f/0x320
<4> [213.847911]  __lock_acquire+0x145f/0x2810
<4> [213.847915]  lock_acquire+0xc9/0x300
<4> [213.847917]  ? efivarfs_actor+0x94/0x100
<4> [213.847919]  down_write+0x3e/0xf0
<4> [213.847922]  ? efivarfs_actor+0x94/0x100
<4> [213.847923]  efivarfs_actor+0x94/0x100
<4> [213.847925]  dcache_readdir+0x7c/0x210
<4> [213.847927]  iterate_dir+0xcc/0x2b0
<4> [213.847929]  efivarfs_pm_notify+0x139/0x180
<4> [213.847931]  ? __pfx_efivarfs_actor+0x10/0x10
<4> [213.847934]  notifier_call_chain+0x4d/0x170
<4> [213.847937]  blocking_notifier_call_chain+0x47/0x70
<4> [213.847939]  pm_notifier_call_chain+0x1a/0x30
<4> [213.847942]  hibernate+0x259/0x480
<4> [213.847943]  state_store+0xd3/0xe0
<4> [213.847946]  kobj_attr_store+0xf/0x40
<4> [213.847947]  sysfs_kf_write+0x49/0x80
<4> [213.847949]  kernfs_fop_write_iter+0x164/0x210
<4> [213.847951]  vfs_write+0x2b9/0x570
<4> [213.847955]  ksys_write+0x7c/0x100
<4> [213.847957]  __x64_sys_write+0x19/0x30
<4> [213.847958]  x64_sys_call+0x2c4/0x2650
<4> [213.847961]  do_syscall_64+0x91/0x180
<4> [213.847963]  ? putname+0x60/0x80
<4> [213.847964]  ? __slab_free+0x185/0x310
<4> [213.847967]  ? putname+0x60/0x80
<4> [213.847969]  ? putname+0x60/0x80
<4> [213.847970]  ? kmem_cache_free+0x3a4/0x4b0
<4> [213.847972]  ? putname+0x60/0x80
<4> [213.847973]  ? do_sys_openat2+0x9f/0xe0
<4> [213.847976]  ? trace_hardirqs_off+0x5d/0xe0
<4> [213.847979]  ? syscall_exit_to_user_mode+0x95/0x260
<4> [213.847981]  ? do_syscall_64+0x9d/0x180
<4> [213.847983]  ? syscall_exit_to_user_mode+0x95/0x260
<4> [213.847984]  ? do_syscall_64+0x9d/0x180
<4> [213.847986]  ? trace_hardirqs_off+0x5d/0xe0
<4> [213.847988]  ? syscall_exit_to_user_mode+0x95/0x260
<4> [213.847990]  ? do_syscall_64+0x9d/0x180
<4> [213.847991]  ? irqentry_exit+0x77/0xb0
<4> [213.847992]  ? exc_page_fault+0xb1/0x300
<4> [213.847994]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
<4> [213.847998] RIP: 0033:0x73d6fb51c5ad
<4> [213.848000] Code: e5 48 83 ec 20 48 89 55 e8 48 89 75 f0 89 7d f8 e8 b=
8 bf f7 ff 48 8b 55 e8 48 8b 75 f0 41 89 c0 8b 7d f8 b8 01 00 00 00 0f 05 <=
48> 3d 00 f0 ff ff 77 33 44 89 c7 48 89 45 f8 e8 0f c0 f7 ff 48 8b
<4> [213.848001] RSP: 002b:00007ffda5de1100 EFLAGS: 00000293 ORIG_RAX: 0000=
000000000001
<4> [213.848003] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 000073d6f=
b51c5ad
<4> [213.848004] RDX: 0000000000000004 RSI: 000073d6fb747f88 RDI: 000000000=
000000b
<4> [213.848005] RBP: 00007ffda5de1120 R08: 0000000000000000 R09: 000000000=
0000000
<4> [213.848006] R10: 0000000000000000 R11: 0000000000000293 R12: 000073d6f=
b747f88
<4> [213.848006] R13: 000000000000000b R14: 000000000000000b R15: 000073d6f=
b7a17a0
<4> [213.848009]  </TASK>
<7> [213.848275] xe 0000:00:02.0: [drm:intel_dp_aux_xfer [xe]] AUX B/DDI B/=
PHY B: timeout (status 0x7d40023f)

Not related to patch:
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4268

Thanks!
Piotr
>=20
>  =20
> Known issues
> ------------
>=20
>   Here are the changes found in xe-pw-142212v4_full that come from known =
issues:
>=20
> ### IGT changes ###
>=20
> #### Issues hit ####
>=20
>   * igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][12] ([Intel XE#4172]) +1=
 other test dmesg-warn
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-b=
mg-6/igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-3.html
>=20
>   * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
>     - shard-bmg:          [PASS][13] -> [SKIP][14] ([Intel XE#2314] / [In=
tel XE#2894])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2=
-displays-3840x2160p.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-b=
mg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
>=20
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#787]) +26 other=
 tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-d=
g2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html
>=20
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-bmg:          [PASS][16] -> [INCOMPLETE][17] ([Intel XE#3862]=
) +1 other test incomplete
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-b=
mg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>=20
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#455] / [Intel X=
E#787]) +8 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-d=
g2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4.h=
tml
>=20
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [PASS][19] -> [INCOMPLETE][20] ([Intel XE#1727]=
 / [Intel XE#2705] / [Intel XE#4010])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-mc-ccs.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-d=
g2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>=20
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][21] -> [INCOMPLETE][22] ([Intel XE#2705]=
 / [Intel XE#4010])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-mc-ccs@pipe-b-hdmi-a-6.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-d=
g2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
>=20
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
>     - shard-dg2-set2:     [PASS][23] -> [INCOMPLETE][24] ([Intel XE#4010]=
)
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs-cc@pipe-a-dp-4.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-d=
g2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
>=20
>   * igt@kms_content_protection@uevent@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][25] ([Intel XE#1188])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-b=
mg-8/igt@kms_content_protection@uevent@pipe-a-dp-2.html
>=20
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>     - shard-dg2-set2:     [PASS][26] -> [SKIP][27] ([Intel XE#309]) +1 ot=
her test skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-dg2-436/igt@kms_cursor_legacy@2x-flip-vs-c=
ursor-legacy.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-d=
g2-464/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
>=20
>   * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
>     - shard-bmg:          [PASS][28] -> [SKIP][29] ([Intel XE#2291])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-bmg-7/igt@kms_cursor_legacy@2x-nonblocking=
-modeset-vs-cursor-atomic.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-b=
mg-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
>=20
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>     - shard-bmg:          [PASS][30] -> [SKIP][31] ([Intel XE#1340])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc=
.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-b=
mg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
>=20
>   * igt@kms_feature_discovery@display-2x:
>     - shard-dg2-set2:     [PASS][32] -> [SKIP][33] ([Intel XE#702])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-dg2-436/igt@kms_feature_discovery@display-=
2x.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-d=
g2-464/igt@kms_feature_discovery@display-2x.html
>=20
>   * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][34] -> [FAIL][35] ([Intel XE#3321]) +1 o=
ther test fail
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vbla=
nk@ac-dp2-hdmi-a3.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-b=
mg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
>=20
>   * igt@kms_flip@2x-nonexisting-fb-interruptible:
>     - shard-dg2-set2:     [PASS][36] -> [SKIP][37] ([Intel XE#310]) +2 ot=
her tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-dg2-466/igt@kms_flip@2x-nonexisting-fb-int=
erruptible.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-d=
g2-464/igt@kms_flip@2x-nonexisting-fb-interruptible.html
>=20
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>     - shard-bmg:          [PASS][38] -> [SKIP][39] ([Intel XE#2316]) +3 o=
ther tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recrea=
te-interruptible.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-b=
mg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
>=20
>   * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][40] ([Intel XE#301] / [Intel X=
E#3321]) +3 other tests fail
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-d=
g2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
>=20
>   * igt@kms_flip@flip-vs-panning@d-dp2:
>     - shard-bmg:          [PASS][41] -> [DMESG-WARN][42] ([Intel XE#4172]=
) +21 other tests dmesg-warn
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-bmg-7/igt@kms_flip@flip-vs-panning@d-dp2.h=
tml
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-b=
mg-4/igt@kms_flip@flip-vs-panning@d-dp2.html
>=20
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-bmg:          [PASS][43] -> [INCOMPLETE][44] ([Intel XE#2049]=
 / [Intel XE#2597])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-b=
mg-2/igt@kms_flip@flip-vs-suspend.html
>=20
>   * igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:
>     - shard-dg2-set2:     [PASS][45] -> [INCOMPLETE][46] ([Intel XE#2049]=
 / [Intel XE#2597])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-dg2-466/igt@kms_flip@flip-vs-suspend-inter=
ruptible@c-dp4.html
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-d=
g2-435/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html
>=20
>   * igt@kms_flip@flip-vs-suspend@c-hdmi-a3:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][47] ([Intel XE#2049] / [=
Intel XE#2597])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-b=
mg-2/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html
>=20
>   * igt@kms_flip@flip-vs-suspend@d-dp4:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][48] ([Intel XE#2049] / [=
Intel XE#2597])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-d=
g2-436/igt@kms_flip@flip-vs-suspend@d-dp4.html
>=20
>   * igt@kms_flip@plain-flip-fb-recreate:
>     - shard-bmg:          [PASS][49] -> [FAIL][50] ([Intel XE#2882]) +1 o=
ther test fail
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-bmg-7/igt@kms_flip@plain-flip-fb-recreate.=
html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-b=
mg-4/igt@kms_flip@plain-flip-fb-recreate.html
>=20
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [PASS][51] -> [SKIP][52] ([Intel XE#656]) +7 ot=
her tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2=
p-scndscrn-spr-indfb-draw-mmap-wc.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-d=
g2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.=
html
>=20
>   * igt@kms_joiner@basic-force-big-joiner:
>     - shard-bmg:          [PASS][53] -> [SKIP][54] ([Intel XE#3012])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-bmg-7/igt@kms_joiner@basic-force-big-joine=
r.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-b=
mg-6/igt@kms_joiner@basic-force-big-joiner.html
>=20
>   * igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3:
>     - shard-dg2-set2:     [PASS][55] -> [INCOMPLETE][56] ([Intel XE#1035]=
) +1 other test incomplete
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-dg2-466/igt@kms_plane@plane-position-hole-=
dpms@pipe-a-plane-3.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-d=
g2-436/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html
>=20
>   * igt@kms_plane_cursor@overlay:
>     - shard-dg2-set2:     [PASS][57] -> [INCOMPLETE][58] ([Intel XE#3966]=
) +1 other test incomplete
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-dg2-464/igt@kms_plane_cursor@overlay.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-d=
g2-464/igt@kms_plane_cursor@overlay.html
>=20
>   * igt@kms_pm_rpm@modeset-non-lpsp:
>     - shard-dg2-set2:     [PASS][59] -> [SKIP][60] ([Intel XE#836])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp.ht=
ml
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-d=
g2-464/igt@kms_pm_rpm@modeset-non-lpsp.html
>=20
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
>     - shard-lnl:          [PASS][61] -> [FAIL][62] ([Intel XE#899])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-lnl-1/igt@kms_universal_plane@cursor-fb-le=
ak@pipe-a-edp-1.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-l=
nl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
>=20
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-adlp:         [PASS][63] -> [DMESG-WARN][64] ([Intel XE#2953]=
) +1 other test dmesg-warn
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-adlp-3/igt@kms_vblank@ts-continuation-dpms=
-suspend.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-a=
dlp-2/igt@kms_vblank@ts-continuation-dpms-suspend.html
>=20
>   * igt@kms_vblank@wait-forked@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][65] -> [DMESG-WARN][66] ([Intel XE#1033]=
) +8 other tests dmesg-warn
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-dg2-466/igt@kms_vblank@wait-forked@pipe-a-=
hdmi-a-6.html
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-d=
g2-466/igt@kms_vblank@wait-forked@pipe-a-hdmi-a-6.html
>=20
>   * igt@xe_exec_threads@threads-bal-mixed-shared-vm-rebind:
>     - shard-bmg:          [PASS][67] -> [INCOMPLETE][68] ([Intel XE#1169]=
)
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-bmg-8/igt@xe_exec_threads@threads-bal-mixe=
d-shared-vm-rebind.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-b=
mg-1/igt@xe_exec_threads@threads-bal-mixed-shared-vm-rebind.html
>=20
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
>     - shard-adlp:         [PASS][69] -> [DMESG-WARN][70] ([Intel XE#4173]=
)
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-adlp-8/igt@xe_fault_injection@inject-fault=
-probe-function-xe_wopcm_init.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-a=
dlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
>=20
>   * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>     - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2229])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-b=
mg-7/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
>=20
>  =20
> #### Possible fixes ####
>=20
>   * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>     - shard-bmg:          [SKIP][72] ([Intel XE#2314] / [Intel XE#2894]) =
-> [PASS][73]
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2=
-displays-2160x1440p.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-b=
mg-8/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
>=20
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-siz=
e:
>     - shard-bmg:          [SKIP][74] ([Intel XE#2291]) -> [PASS][75] +7 o=
ther tests pass
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-fli=
pa-atomic-transitions-varying-size.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-b=
mg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size=
.html
>     - shard-dg2-set2:     [SKIP][76] ([Intel XE#309]) -> [PASS][77] +2 ot=
her tests pass
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-f=
lipa-atomic-transitions-varying-size.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-d=
g2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-si=
ze.html
>=20
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-bmg:          [SKIP][78] ([Intel XE#2425]) -> [PASS][79]
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-bmg-4/igt@kms_display_modes@extended-mode-=
basic.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-b=
mg-8/igt@kms_display_modes@extended-mode-basic.html
>     - shard-dg2-set2:     [SKIP][80] ([Intel XE#455]) -> [PASS][81]
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-dg2-464/igt@kms_display_modes@extended-mod=
e-basic.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-d=
g2-466/igt@kms_display_modes@extended-mode-basic.html
>=20
>   * igt@kms_dp_linktrain_fallback@dp-fallback:
>     - shard-dg2-set2:     [SKIP][82] -> [PASS][83]
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-f=
allback.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-d=
g2-435/igt@kms_dp_linktrain_fallback@dp-fallback.html
>=20
>   * igt@kms_feature_discovery@display-2x:
>     - shard-bmg:          [SKIP][84] ([Intel XE#2373]) -> [PASS][85]
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-bmg-6/igt@kms_feature_discovery@display-2x=
.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-b=
mg-7/igt@kms_feature_discovery@display-2x.html
>=20
>   * igt@kms_flip@2x-blocking-absolute-wf_vblank:
>     - shard-dg2-set2:     [SKIP][86] ([Intel XE#310]) -> [PASS][87] +2 ot=
her tests pass
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-=
wf_vblank.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-d=
g2-435/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
>=20
>   * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
>     - shard-bmg:          [FAIL][88] ([Intel XE#3321]) -> [PASS][89] +3 o=
ther tests pass
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vbla=
nk@ad-dp2-hdmi-a3.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-b=
mg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
>=20
>   * igt@kms_flip@2x-plain-flip-fb-recreate:
>     - shard-bmg:          [FAIL][90] ([Intel XE#2882]) -> [PASS][91] +1 o=
ther test pass
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recrea=
te.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-b=
mg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html
>     - shard-dg2-set2:     [FAIL][92] ([Intel XE#886]) -> [PASS][93] +1 ot=
her test pass
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-dg2-435/igt@kms_flip@2x-plain-flip-fb-recr=
eate.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-d=
g2-466/igt@kms_flip@2x-plain-flip-fb-recreate.html
>=20
>   * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
>     - shard-bmg:          [SKIP][94] ([Intel XE#2316]) -> [PASS][95] +4 o=
ther tests pass
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-=
interruptible.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-b=
mg-8/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
>=20
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][96] ([Intel XE#656]) -> [PASS][97] +5 ot=
her tests pass
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2=
p-scndscrn-spr-indfb-draw-blt.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-d=
g2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html
>=20
>   * igt@kms_joiner@invalid-modeset-force-big-joiner:
>     - shard-bmg:          [SKIP][98] ([Intel XE#3012]) -> [PASS][99]
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959d=
068edd472132e9e4939888832d/shard-bmg-6/igt@kms_joiner@invalid-modeset-force=
-big-joiner.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-b=
mg-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html
>=20
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - shard-adlp:         [DMESG-WARN][100] ([Intel XE#4173]) -> [PASS][1=
01] +1 other test pass
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959=
d068edd472132e9e4939888832d/shard-adlp-2/igt@kms_pipe_crc_basic@suspend-rea=
d-crc.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-=
adlp-3/igt@kms_pipe_crc_basic@suspend-read-crc.html
>=20
>   * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>     - shard-bmg:          [SKIP][102] ([Intel XE#2571]) -> [PASS][103]
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959=
d068edd472132e9e4939888832d/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-mul=
ti-pipe.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-=
bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
>=20
>   * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
>     - shard-bmg:          [DMESG-WARN][104] ([Intel XE#4172]) -> [PASS][1=
05] +24 other tests pass
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959=
d068edd472132e9e4939888832d/shard-bmg-2/igt@kms_plane_scaling@plane-downsca=
le-factor-0-75-with-rotation.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-=
bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html
>=20
>   * igt@kms_setmode@invalid-clone-single-crtc-stealing:
>     - shard-bmg:          [SKIP][106] ([Intel XE#1435]) -> [PASS][107]
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959=
d068edd472132e9e4939888832d/shard-bmg-6/igt@kms_setmode@invalid-clone-singl=
e-crtc-stealing.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-=
bmg-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
>=20
>   * igt@kms_vrr@negative-basic:
>     - shard-bmg:          [SKIP][108] ([Intel XE#1499]) -> [PASS][109]
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959=
d068edd472132e9e4939888832d/shard-bmg-6/igt@kms_vrr@negative-basic.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-=
bmg-1/igt@kms_vrr@negative-basic.html
>=20
>   * igt@xe_evict@evict-beng-small-multi-vm:
>     - shard-bmg:          [DMESG-WARN][110] ([Intel XE#1473] / [Intel XE#=
4172]) -> [PASS][111]
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959=
d068edd472132e9e4939888832d/shard-bmg-6/igt@xe_evict@evict-beng-small-multi=
-vm.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-=
bmg-7/igt@xe_evict@evict-beng-small-multi-vm.html
>=20
>   * igt@xe_exec_threads@threads-bal-mixed-userptr:
>     - shard-dg2-set2:     [DMESG-WARN][112] ([Intel XE#1033]) -> [PASS][1=
13] +7 other tests pass
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959=
d068edd472132e9e4939888832d/shard-dg2-436/igt@xe_exec_threads@threads-bal-m=
ixed-userptr.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-=
dg2-464/igt@xe_exec_threads@threads-bal-mixed-userptr.html
>=20
>   * igt@xe_exec_threads@threads-hang-rebind-err:
>     - shard-dg2-set2:     [DMESG-WARN][114] ([Intel XE#3876]) -> [PASS][1=
15]
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959=
d068edd472132e9e4939888832d/shard-dg2-435/igt@xe_exec_threads@threads-hang-=
rebind-err.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-=
dg2-435/igt@xe_exec_threads@threads-hang-rebind-err.html
>=20
>   * igt@xe_live_ktest@xe_migrate:
>     - shard-bmg:          [SKIP][116] ([Intel XE#1192]) -> [PASS][117] +1=
 other test pass
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959=
d068edd472132e9e4939888832d/shard-bmg-2/igt@xe_live_ktest@xe_migrate.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-=
bmg-1/igt@xe_live_ktest@xe_migrate.html
>=20
>   * igt@xe_module_load@many-reload:
>     - shard-adlp:         [DMESG-WARN][118] ([Intel XE#2953]) -> [PASS][1=
19] +1 other test pass
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959=
d068edd472132e9e4939888832d/shard-adlp-6/igt@xe_module_load@many-reload.htm=
l
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-=
adlp-8/igt@xe_module_load@many-reload.html
>=20
>   * igt@xe_pm@s3-mocs:
>     - shard-bmg:          [DMESG-WARN][120] ([Intel XE#4172] / [Intel XE#=
569]) -> [PASS][121]
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959=
d068edd472132e9e4939888832d/shard-bmg-6/igt@xe_pm@s3-mocs.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-=
bmg-7/igt@xe_pm@s3-mocs.html
>=20
>  =20
> #### Warnings ####
>=20
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][122] ([Intel XE#455] / [Intel XE#787]) -=
> [SKIP][123] ([Intel XE#787]) +8 other tests skip
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959=
d068edd472132e9e4939888832d/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-t=
iled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-=
dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6=
.html
>=20
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-h=
dmi-a-6:
>     - shard-dg2-set2:     [SKIP][124] ([Intel XE#787]) -> [SKIP][125] ([I=
ntel XE#455] / [Intel XE#787]) +9 other tests skip
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959=
d068edd472132e9e4939888832d/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-=
180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-=
dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d=
-hdmi-a-6.html
>=20
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     [INCOMPLETE][126] ([Intel XE#1727] / [Intel XE#=
3124] / [Intel XE#4010]) -> [INCOMPLETE][127] ([Intel XE#4010])
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959=
d068edd472132e9e4939888832d/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs-cc.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-=
dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>=20
>   * igt@kms_content_protection@uevent:
>     - shard-bmg:          [SKIP][128] ([Intel XE#2341]) -> [FAIL][129] ([=
Intel XE#1188])
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959=
d068edd472132e9e4939888832d/shard-bmg-6/igt@kms_content_protection@uevent.h=
tml
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-=
bmg-8/igt@kms_content_protection@uevent.html
>=20
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
>     - shard-bmg:          [SKIP][130] ([Intel XE#2291]) -> [DMESG-WARN][1=
31] ([Intel XE#877])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959=
d068edd472132e9e4939888832d/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-fl=
ipa-toggle.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-=
bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
>=20
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-siz=
e:
>     - shard-bmg:          [DMESG-WARN][132] ([Intel XE#4172]) -> [SKIP][1=
33] ([Intel XE#2291])
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959=
d068edd472132e9e4939888832d/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-fl=
ipb-atomic-transitions-varying-size.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-=
bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-siz=
e.html
>=20
>   * igt@kms_flip@2x-flip-vs-modeset:
>     - shard-bmg:          [DMESG-WARN][134] ([Intel XE#4172]) -> [SKIP][1=
35] ([Intel XE#2316])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959=
d068edd472132e9e4939888832d/shard-bmg-1/igt@kms_flip@2x-flip-vs-modeset.htm=
l
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-=
bmg-6/igt@kms_flip@2x-flip-vs-modeset.html
>=20
>   * igt@kms_flip@2x-plain-flip-interruptible:
>     - shard-dg2-set2:     [DMESG-WARN][136] ([Intel XE#1033]) -> [SKIP][1=
37] ([Intel XE#310]) +1 other test skip
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959=
d068edd472132e9e4939888832d/shard-dg2-436/igt@kms_flip@2x-plain-flip-interr=
uptible.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-=
dg2-464/igt@kms_flip@2x-plain-flip-interruptible.html
>=20
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-dg2-set2:     [DMESG-WARN][138] ([Intel XE#1033]) -> [INCOMPL=
ETE][139] ([Intel XE#2049] / [Intel XE#2597])
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959=
d068edd472132e9e4939888832d/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-=
dg2-436/igt@kms_flip@flip-vs-suspend.html
>=20
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
>     - shard-dg2-set2:     [SKIP][140] ([Intel XE#651]) -> [SKIP][141] ([I=
ntel XE#656]) +11 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959=
d068edd472132e9e4939888832d/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-cur-indfb-onoff.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-=
dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
>=20
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][142] ([Intel XE#2311]) -> [SKIP][143] ([=
Intel XE#2312]) +14 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959=
d068edd472132e9e4939888832d/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2=
p-scndscrn-pri-indfb-draw-mmap-wc.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-=
bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.=
html
>=20
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
>     - shard-bmg:          [SKIP][144] ([Intel XE#2312]) -> [SKIP][145] ([=
Intel XE#4141]) +7 other tests skip
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959=
d068edd472132e9e4939888832d/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p=
-primscrn-indfb-msflip-blt.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-=
bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
>=20
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>     - shard-bmg:          [SKIP][146] ([Intel XE#4141]) -> [SKIP][147] ([=
Intel XE#2312]) +5 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959=
d068edd472132e9e4939888832d/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p=
-scndscrn-spr-indfb-onoff.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-=
bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
>=20
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-=
wc:
>     - shard-bmg:          [SKIP][148] ([Intel XE#2312]) -> [SKIP][149] ([=
Intel XE#2311]) +19 other tests skip
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959=
d068edd472132e9e4939888832d/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrr=
s-2p-scndscrn-cur-indfb-draw-mmap-wc.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-=
bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-=
wc.html
>=20
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen=
:
>     - shard-dg2-set2:     [SKIP][150] ([Intel XE#656]) -> [SKIP][151] ([I=
ntel XE#651]) +11 other tests skip
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959=
d068edd472132e9e4939888832d/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-spr-indfb-fullscreen.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-=
dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscre=
en.html
>=20
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
>     - shard-dg2-set2:     [SKIP][152] ([Intel XE#656]) -> [SKIP][153] ([I=
ntel XE#653]) +12 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959=
d068edd472132e9e4939888832d/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-cur-indfb-onoff.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-=
dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.htm=
l
>=20
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          [SKIP][154] ([Intel XE#2313]) -> [SKIP][155] ([=
Intel XE#2312]) +13 other tests skip
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959=
d068edd472132e9e4939888832d/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p=
-primscrn-indfb-plflip-blt.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-=
bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
>=20
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
>     - shard-bmg:          [SKIP][156] ([Intel XE#2312]) -> [SKIP][157] ([=
Intel XE#2313]) +16 other tests skip
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959=
d068edd472132e9e4939888832d/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p=
-primscrn-spr-indfb-fullscreen.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-=
bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.htm=
l
>=20
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][158] ([Intel XE#653]) -> [SKIP][159] ([I=
ntel XE#656]) +13 other tests skip
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959=
d068edd472132e9e4939888832d/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-pri-shrfb-draw-mmap-wc.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-=
dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc=
.html
>=20
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-dg2-set2:     [DMESG-WARN][160] ([Intel XE#4212]) -> [DMESG-W=
ARN][161] ([Intel XE#2705] / [Intel XE#4212])
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959=
d068edd472132e9e4939888832d/shard-dg2-436/igt@kms_plane_scaling@intel-max-s=
rc-size.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-=
dg2-464/igt@kms_plane_scaling@intel-max-src-size.html
>=20
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][162] ([Intel XE#2426]) -> [SKIP][163] ([=
Intel XE#2509])
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959=
d068edd472132e9e4939888832d/shard-bmg-6/igt@kms_tiled_display@basic-test-pa=
ttern-with-chamelium.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-=
bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>=20
>   * igt@xe_live_ktest@xe_eudebug:
>     - shard-bmg:          [SKIP][164] ([Intel XE#2833]) -> [SKIP][165] ([=
Intel XE#1192])
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2614-a05904055d959=
d068edd472132e9e4939888832d/shard-bmg-4/igt@xe_live_ktest@xe_eudebug.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/shard-=
bmg-2/igt@xe_live_ktest@xe_eudebug.html
>=20
>  =20
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/10=
33
>   [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/10=
35
>   [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
69
>   [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
88
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
92
>   [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/13=
40
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
35
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
73
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
99
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/17=
27
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/20=
49
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
29
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
91
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
11
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
12
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
13
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
14
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
16
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
41
>   [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
73
>   [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/24=
25
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/24=
26
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/25=
09
>   [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/25=
71
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/25=
97
>   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/27=
05
>   [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
33
>   [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
82
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/29=
53
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/30=
12
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
24
>   [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/33=
21
>   [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/38=
62
>   [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/38=
76
>   [Intel XE#3966]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/39=
66
>   [Intel XE#4010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/40=
10
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/41=
41
>   [Intel XE#4172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/41=
72
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/41=
73
>   [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
12
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>=20
>=20
> Build changes
> -------------
>=20
>   * Linux: xe-2614-a05904055d959d068edd472132e9e4939888832d -> xe-pw-1422=
12v4
>=20
>   IGT_8224: c659b986ba648584d36b3cfece897bc84a33dcbb @ https://gitlab.fre=
edesktop.org/drm/igt-gpu-tools.git
>   xe-2614-a05904055d959d068edd472132e9e4939888832d: a05904055d959d068edd4=
72132e9e4939888832d
>   xe-pw-142212v4: 142212v4
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142=
212v4/index.html

--=20
