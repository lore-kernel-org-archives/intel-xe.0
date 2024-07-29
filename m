Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B3BC3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 08:28:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4431510E335;
	Mon, 29 Jul 2024 08:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X4psfS6v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4BB10E328
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jul 2024 08:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722241689; x=1753777689;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4JevFTxDaZzASe7w864vQ+Oz884BIhBB9GPmH0+xKEg=;
 b=X4psfS6vbe7mTB/TCCKZwmTTWPDbCw+bJBxU34+vk1GpjjwYybrbdUgH
 W5lUOXgxBBlb5KlsLlpS6sTJ42LskniIexZ2HKhwnusKsk7e/S3fdjqRH
 8R/b/MfLmTESsvLsVcQwhkogpwxMOSqy8vFhhRvnhNIkhtRBV+UFg5rZQ
 r6Ci5w+JEtYcDBBa/Be/WnZk5t0NC29BTd9brJP4gAKRPTFcnZNyylQG+
 eHr4wnnErvrz7yGXrdYUyRs+OOTXOZaZnK7PGwaYtsJ7u8ty5MNd0cPu3
 PZBh2G7+sDVeluf+0SzPFbVHLmr056OhiAA3hYMncsTtnY882JtmX5IEt w==;
X-CSE-ConnectionGUID: /4ZH5j4oTFONg2pEnqVlwA==
X-CSE-MsgGUID: gJlZ8FzNTuiomfKRa+khxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="23777377"
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="23777377"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 01:28:08 -0700
X-CSE-ConnectionGUID: cunXnuCTSayMFihedTPP1Q==
X-CSE-MsgGUID: L1VS0hC/SlqsODqdixqqHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="53809011"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jul 2024 01:28:02 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 01:27:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 01:27:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 29 Jul 2024 01:27:47 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 29 Jul 2024 01:27:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wNdy/DHgluJv0CXhdu+UinCGAX3/hipiWUzTkKzoCmhedyxNhMMiwBd5b8BiHGg2SXo3Da9pB0mqR+5o0TEOpxVf8udWhdtQBifH/xcF9qW6Do2iJPEX/72IsYC/+Hse5vGadfujuYv3ysXwJe0+W8yij3kQeHuBS+85VYLbdb0idryfeRZNtX8tH6JM/wAZJsExJ1+o6Mrg7RFUNjM6yNWYfyiv+MPorMzIeeekEfz6cbdqLdusJNdqUn+yD/+2WqC5bUO92ZnMqy6BV/r4sHxA1uBNHUj/adyQX9aMdAvAjBxJnCWN/I/NGFPIwklB7eP6vaWmFNj4DLmR6uv5cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8EqUMFiBBkcAHFrIwJkV7RLwi5GzxKaF1jIYYGHaFE=;
 b=gn6FFG7JErbGn550kQiBPhOA6UGBRpWp9tOsdwAtNmzXkAE8iKzZpvLo23K4HN6+t+TL8BdFPM5+P16xbYGW/lgxeThqboIWAcXNk38PZcFakk2ziyIBM9TUP0f/H+dAfIXzKEPBLBFOOFUrZ0DS8BPsP1kvDShIsSn+IZWpIjtmIodksAx+ntKd6iIc678uugLJGyY4i78Jx6aWl4pcOtaGE3K9+aMkcySd9xhHsBERDrhb5KUqxtdHw4jp5tBjodCD5GFe1pHilNt+mG4QGOGV2nqNBb4F5LrGSWaxmZF0pmCPnYQxAsFReksiVcJsgbmxvJoZHn6OkEv1oBTS6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7807.27; Mon, 29 Jul 2024 08:27:44 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739%4]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 08:27:44 +0000
Message-ID: <4a55bc1d-24f2-4662-be73-da0c8b5525ce@intel.com>
Date: Mon, 29 Jul 2024 11:27:29 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/21] GPU debug support (eudebug)
To: Matthew Brost <matthew.brost@intel.com>, Mika Kuoppala
 <mika.kuoppala@linux.intel.com>, <jonathan.cavitt@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Grzegorzek, Dominik"
 <dominik.grzegorzek@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
 <ZqSETvUP8g/rwq9x@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <ZqSETvUP8g/rwq9x@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MI0P293CA0015.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::8) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|DM4PR11MB6360:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e198dd8-8ba0-4e88-9349-08dcafa851d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RkxMb1VCbGlFVitMNmhaVGZUR3BLUllMcDhaRGtiYXhnZ0svWEZ3ODNZK2ly?=
 =?utf-8?B?ZGdsUFg2T3VkWm9uQmhDR01nTFZoQ0IxVC9nYkNSaURpWUdpT2s1NDlzMzlm?=
 =?utf-8?B?ano5NHZpeTNudy8wUkVoVjVRQ2pXZWxBdkJTVlRsMVZnVVR5aHBmQ3hNK05Y?=
 =?utf-8?B?dGJwemd4UWNXQ05FTGtjSy94UWR3U0M1S3ljRWxJQktNK2gxVTJqSnZpdE5r?=
 =?utf-8?B?cHQ4VFFSUW5laFl2QWNId3FFbDF4NXd6TEk0S0ZuTzZJb0hTczZXT0liWXR6?=
 =?utf-8?B?dkdyWktRVHVoQURxcWtabzg5UUxLYUMxNXJ1M3E3Zkp3YUt6SDBJcjR6RkRs?=
 =?utf-8?B?R0d6ZUt1VGc4QlNBVndWUXRpRTExdHB6SGIxZVZvdnE3aUtJS1NrdlE1QnBN?=
 =?utf-8?B?d2kxckxVUW1aQmI5TlpMeDFhcHhiUUlrZU4yeXM0V2Rab1BUczZFcjJ5OGdm?=
 =?utf-8?B?MmZIQUFRSXVFQ1JzSGU0N0tlSzFLMVhtWWxBSnRhVWkyaUtNZnlIblFNbHR2?=
 =?utf-8?B?S3JXYjBCR3RCcjBja2Z0cTZ2S1BaSFJJUTNzV3o2TFFnd0V5SzQwSUliWkNm?=
 =?utf-8?B?L2ZJSGZTWThyRER1MytGZEVDa215dmlkRmc0Wit1MGVZdENOZWxpZmJHMW5I?=
 =?utf-8?B?RitQckNmNDdZNGx1ek9LT21xbUFlR2VLa3Z4K3FVaXVUa1k3QytNMkk5MkIv?=
 =?utf-8?B?b1NsOUNxU0xpN1J0dHJoemhXbXU2dTFpcWl4VFlkbzZpcHE5ajBpZUtDbDV0?=
 =?utf-8?B?OE5CcmYrQ2tGUEh5K3FjQkhLSGZ5YWN5TCt1eU9BMWRHSXhLWUs1VG5aSHhT?=
 =?utf-8?B?Wkh5MWJUOW91WDZjcDdmd3lhRGU0NC84VU1udjdhRnhDbG5vcjhhSVJKNW1D?=
 =?utf-8?B?SktNeW1HUjlDVmxhOGtYb2NhQ2tjSU5GWk5uV2d1ckx2RFdvUVFHZ1ZDd2VK?=
 =?utf-8?B?clNjbDFYTWhOWE9XaVJGdEZHQ3gyWVo5S3RmVVY3c1phQWJQdnRIYkxEdEZ3?=
 =?utf-8?B?SkNtTTBmQ0VvZWt1VExMUUxoUmJEWjJ4a2JsNDIrWUFYbjNtS00ycE1CTm5n?=
 =?utf-8?B?aHpCcnpzOTdEYVBTUUZJZWlHSEM5SlhoV3N0VEwvVVg2YlowT2R4UG5kUjV3?=
 =?utf-8?B?N1BSaS9QVUhkNWUxT0FZamxTdmg3WkdKUEZvWHNpa0FZbktONGJLajFnSXJ2?=
 =?utf-8?B?K1BpY2oyRTJaNzdzQnM0SXNqQzlvVElFYytCcWx4bUczNGdxVjY2dHpyRkpy?=
 =?utf-8?B?QVZmaEtBcnRPWGxSQk5TZ1U3azVyNExGaUFwaFVKTjhCQWNFM3d4b0poTGE0?=
 =?utf-8?B?cjZVdVNnaGZld3VYNHcxMlNDMFhWNVdTYnl0MThjdEpNT1F1SnRQd1FmbkFS?=
 =?utf-8?B?YkI4ZjE0YldESTZEOHRSMmEvaGtqQ2NPZnFwZDl2c1ZuTmF6OFBqd2YyZ2Zu?=
 =?utf-8?B?SzFsUStnTWRBdUhwcmdYV0V2eVdSVFlGL3UyK3k0QUNvSEo1NXFkbzducXkz?=
 =?utf-8?B?NUtua0ZKOW9Wb3FmSDc3bFhSTXZUNmhyTEswcDg0V3ljR1hRWmFrZ2R6TmRm?=
 =?utf-8?B?TTh2WkNuZy9veUNPbG9jb1U2N3plck40bUJpNDFRTFVmbzNsQStVek9KZUsz?=
 =?utf-8?B?ZnVIOGRuait6WmRVRUtQcEM5b3Bza0NhSHdsZEYzU0JrOHB1RHBvMVViT1Fp?=
 =?utf-8?B?MDVxOWYzN3J2Ly93SDV6N3p0MUpSK2liNHNSN2VXV010Q0hyQzJ3dEl6dW5k?=
 =?utf-8?Q?CAwBjniJCpcKbk2Pb8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZS9uOWV3YUR2NHpFTnkyd2FJdkcxcTdKRkpweUJlRVVrcFZMTTdZRFBESVFJ?=
 =?utf-8?B?Ym1UWlRIb0VYaEYzSS9zT1JZMlJTZEdYQ1Y0NlNjcDdIS1Q1Y1krcnhWcjVP?=
 =?utf-8?B?TVV3YmQ3cDZsS0NxTkRSK2cxMTFkRmNvTHl1eUg5Z0ZGbyt1R0p4STUwUUJz?=
 =?utf-8?B?UFRaRUVMNTVkdzYzUm9YZlBkQkVsdEt3bW9XVWdPUlNBd0daaDVOUktZcXZy?=
 =?utf-8?B?SmFSZFVCRFBPQWJBVWVyUGxKQUhLQjJsYXJIdm1xRFlUVGw1SU1LV0JKaWQx?=
 =?utf-8?B?ckFjdUlickh5OTl4ZVl6ZWNDWVZHbWFNR0UxS2FTVS93SDZBR0dtckdBOTdk?=
 =?utf-8?B?OUNCMlh1S2p0QkE2aWZBODF4RG96NDV5Q1loK1dFajBmV3VQT3dGU3F2UU5o?=
 =?utf-8?B?SE1DWStoSmxxYkw5bEcxTjJUSlducjh2TVpuTUoyTmcvUVBXODVIY3F4N1hZ?=
 =?utf-8?B?Q0VHVzlNRWdML2hoUFZsb2ExdW90NzNIVXVyUUVwTGI4dGRTeVYreG1PSzRx?=
 =?utf-8?B?MXFUSFBZMU1JU2c2dTZDZUx0OEhJWjYxWVU4cjl6RnRORklHSXJ2OTl3T1l6?=
 =?utf-8?B?SFlMRHlkV3A2S0xsVFpoOXBXRG0xNnBHSmMwc1FHTUZtRHRIc3F5UjBrRUlR?=
 =?utf-8?B?R24yMUdMbWtkSUljUjFTejhIM3lqYnkyem8yc01DUWJyUTJ0ZFdRQkxpeS9P?=
 =?utf-8?B?TWtIMUg3WW16WWlPS3M0NVBzdUx5MTNjTUpFNmMvZ0xDdDRBVXJncldHNnR4?=
 =?utf-8?B?eWhzY1ltcU5aTUF5dVdvZThmSWNVOGdQM21vRlBUcTN2bTZubGZxV1VCcGlR?=
 =?utf-8?B?MGlrWVRQUnlhNys2cnJleHRDQkpVeW9rQjJJQklRRXZGRkhMVkZZTnNUNVF0?=
 =?utf-8?B?M0wvZmtuTEZxQzU1Y282MWxNbEhQT0ZTUThWNm91cmRyQWxPemE2ZEU5eU9I?=
 =?utf-8?B?SThUckxweWFSVkFYUDd5b0s4L0hxSFIwTTVKT0tCL1R0RlAwbjZDK2RYWGV5?=
 =?utf-8?B?UFlaTEJCdy9iM2V0MTdDV2t2MjBUL3ByNml2ZFg2amEvNDFQZ0dhRCs3RXNq?=
 =?utf-8?B?MVF1Q0VMTHdmckZKV21zaUprOXFjZGxGVS9EN0NWYmh1alFySHoweGRXQ3M1?=
 =?utf-8?B?TWRuc04zZXpvcVJEbmxlRUFmUGwxVjRET3pnL3pndFA1MXpkaWxmbVRHSWRT?=
 =?utf-8?B?bmR2UTY1YXdwRERpRGpwOFdCV3JYeFdVRnpLalgwS0NPMWNyYlRzQVpkOHZp?=
 =?utf-8?B?OCtaZkoyanBGN1p5OGJTdEQrTWY3cGQ2b0ZWYmNFcEpzMXZ5Yy9LU3dFSjZr?=
 =?utf-8?B?Z3ZqMHd0Zk44bTEyalBKRk5IWG1Ccmp6WFBvSDZHSy9jV3pXSjc1MVovTzlH?=
 =?utf-8?B?NzVHQ29PcjZyMTF4N0ZaOTVTMng2UmF3SUJFTVRKbytRZU9KRTdYalZ5YU5U?=
 =?utf-8?B?VnBDa0RFTzYwNXJBQUM2dlFwUTdDUzlQb3U1eGxPRlN6eWsrL0ZMR0FFMHRy?=
 =?utf-8?B?NmFMa0lWLytkQmpzOUFGY2VrNGQ2dnpHWStuOVJDRmxaT3BpNVNsMUZEZ2pq?=
 =?utf-8?B?dzJhVzdpNU0yRnJPZU9VZ3pONlhxU01wbzExQzVWeXJrbk9JUmVqN2NBZ093?=
 =?utf-8?B?YmNwUk5jcE10Y2kwQ1hhaGVxZ1Rndmc1QnhuUHQrNTY5QjhjUktrTmdZbnJ1?=
 =?utf-8?B?RXUyL2tXZ3o4KzVHRkV4Z2ZtT2puM21RVURKaFYwVU92bVozZGRMbGpKaDdl?=
 =?utf-8?B?RkRCQ3p0NXhwVEJTb2lVc2ZudHJxdXNYMlhnOEMwUkVmbHM2bWNJTXkyZm1x?=
 =?utf-8?B?K0owWG8wcFFkbWYrYkNtOU5pb2F6ZWdmS2FnbCtyZDJnWkNYbldjSTM2MTR1?=
 =?utf-8?B?Y0s1S0xaODJ0WjE5a0NOZ1ZyempyQjRtRnVEbUxoelJGcnl4QW44cjFFWDFu?=
 =?utf-8?B?UC9qb1I3QzZHS0w0TW9sSEVGanNxYmlYT1lSTUkyVlFoZkFZR2dmbmVJVnBt?=
 =?utf-8?B?Q0Z2QmY0VUV0QTNoZHdFVnd0L0lEMFVCQWZ3L0Uxdlc0ZWQ4NEx0MDRaaWRU?=
 =?utf-8?B?RXRoTkM1MUl5aEFVdjQ5dk0xUzVhWE53OHdMdGdLK0VGelpQcU5nTnFYdHJH?=
 =?utf-8?B?VDVFRlhEdkhBSEd2SDdwUjM0U010OGM4OTNHbmErSW1XWVlBQmc3cW5VUVQ2?=
 =?utf-8?B?VXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e198dd8-8ba0-4e88-9349-08dcafa851d1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 08:27:44.4989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KTPlRtbYO6rzKyeTLCMsWvfIAizuSnTszkeoTtqOesK9OXU4Oll029QWUOHBn+5rfdeHet8Ko222jXjxTmu3IQ/d7sLAdWPG/vVteJBwcJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6360
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



On 7/27/24 8:23 AM, Matthew Brost wrote:
> On Fri, Jul 26, 2024 at 05:07:57PM +0300, Mika Kuoppala wrote:
>> Hi,
>>
>> We (Intel eudebug kernel team) would like to submit this
>> patchset to enable debug support for Intel GPU devices.
>>
>> The aim is to allow Level-Zero + GDB (or some other tool)
>> to attach to xe driver in order to receive information
>> about relevant driver resources, hardware events and to allow debug
>> related hardware control. End goal is full debug capability
>> of supported Intel hardware, see [4].
>>
>> Debugger first opens a connection to a device through
>> drm ioctl with debug target process as a pid. This will
>> return a dedicated file descriptor used for debugging
>> for further events and control.
>>
>> Xe internal resources that are considered essential
>> to debugger functionality are relayed as events to the
>> debugger. On debugger connection, all existing resources
>> are relayed to debugger (discovery) and from that
>> point onwards, as they are created/destroyed.
>>
>> uapi is extended to allow an application/lib to provide
>> debug metadata information. These are relayed as events
>> to the debugger so it can decode the program state.
>>
>> Along with the resource and metadata events, an event for
>> hardware exceptions, called EU attention, is provided.
>> The debugger, with the assistance of an exception handling
>> program called System Routine (short: SIP) provided
>> with the pipeline setup, can determine which specific
>> EU/thread and instruction encountered the breakpoint
>> or other exceptions.
>>
>> EU controlling ioctl interface is also introduced where
>> debugger can manipulate individual threads of the currently
>> active workload. This interface enables the debugger to
>> interrupt all threads on demand, check their current state
>> and resume them individually.
>>
>> The intent is to provide a similar but not API compatible
>> functionality as in out-of-tree i915 debugger support:
>> https://dgpu-docs.intel.com/driver/gpu-debugging.html
>>
>> For xe the aim is to have all support merged in upstream,
>> starting with this series. With Lunarlake being first targetted
>> hardware.
>>
>> I have split the events into xe_drm_eudebug.h instead
>> pushing everything into xe_drm.h, in order to help
>> distinguish what is controlled by which descriptor.
>> If it's through the original xe fd, it is in xe_drm.h and
>> if it's through the opened debugger connection fd, it
>> is in xe_drm_eudebug.h.
>>
> 
> Looking through the series, I do have question wrt to GPU fault and
> eudebug. I don't see any interaction there. Without knowing eudebug
> works, it seems like setting a break point on a GPU access to virtual
> address is something a debugger would want. On a faulting device, this
> is something we should be able to support. This really comes into play
> once we have SVM as the UMD won't be issuing binds either. Curious about
> your thoughts here.
> 
> If this something that required, in particular with SVM, this something
> the SVM and eudebug teams need to collaborate on early to make sure both
> designs work with each other.
> 
Hi Matt,

Here's a quick scenario of what I understand to happen when a breakpoint 
is set on an EU thread.

The breakpoint behavior of eudebug is that if the breakpoint bit is on 
for an EU instruction, the EU thread will jump from AIP to SIP mode with 
a breakpoint exception before that instruction is executed.
The SIP shader can load/store the ARF (and GRF) registers of the EU 
thread, including the AIP of the EU thread, in memory that communicates 
with the debugger.
And when the SIP shader of the EU thread executes the sync.host 
instruction, it sets the bit of the corresponding thread in the TD_ATT 
(MMIOed) register and the eu thread stops.
The KMD periodically checks the TD_ATT register and notifies the debug UMD.
To resume the EU thread, simply unset the set bit of TD_ATT.
When debug UMD sends the eu thread resume event to the KMD, the KMD 
unsets the TD_ATT register.

It is my understanding that this EU thread breakpoint scenario does not 
conflict with the recoverable pagefault behavior scenario used by (HMM 
based)SVM, and that they can work together without any additional design 
changes.

Apart from this, the unrecoverable pagefault that occurs when an EU 
thread accesses an unallocated PPGTT virtual address requires additional 
implementation.

Mika, Joonas, Dominik, Jonathan, if I misunderstand/missed something or 
have any additional thoughts, could you please share your thought?

Br,

G.G.
> Matt
> 
>> Latest code can be found in:
>> [1] https://gitlab.freedesktop.org/miku/kernel/-/tree/eudebug-dev
>>
>> With the associated IGT tests:
>> [2] https://gitlab.freedesktop.org/cmanszew/igt-gpu-tools/-/tree/eudebug-dev
>>
>> The user for this uapi:
>> [3] https://github.com/intel/compute-runtime
>> Event loop and thread control interaction can be found at:
>> https://github.com/intel/compute-runtime/tree/master/level_zero/tools/source/debug/linux/xe
>> And the wrappers in:
>> https://github.com/intel/compute-runtime/tree/master/shared/source/os_interface/linux/xe
>> https://github.com/intel/compute-runtime/blob/master/shared/source/os_interface/linux/xe/ioctl_helper_xe_debugger.cpp
>> Note that the XE support is disabled by default and you will need
>> NEO_ENABLE_XE_EU_DEBUG_SUPPORT enabled in order to test.
>>
>> GDB support:
>> [4]: https://sourceware.org/pipermail/gdb-patches/2024-July/210264.html
>>
>> Thank you in advance for any comments and insight.
>>
>>
>> Andrzej Hajda (1):
>>    drm/xe/eudebug: implement userptr_vma access
>>
>> Christoph Manszewski (3):
>>    drm/xe/eudebug: Add vm bind and vm bind ops
>>    drm/xe/eudebug: Dynamically toggle debugger functionality
>>    drm/xe/eudebug_test: Introduce xe_eudebug wa kunit test
>>
>> Dominik Grzegorzek (10):
>>    drm/xe: Export xe_hw_engine's mmio accessors
>>    drm/xe: Move and export xe_hw_engine lookup.
>>    drm/xe/eudebug: Introduce exec_queue events
>>    drm/xe/eudebug: hw enablement for eudebug
>>    drm/xe: Add EUDEBUG_ENABLE exec queue property
>>    drm/xe/eudebug: Introduce per device attention scan worker
>>    drm/xe/eudebug: Introduce EU control interface
>>    drm/xe: Debug metadata create/destroy ioctls
>>    drm/xe: Attach debug metadata to vma
>>    drm/xe/eudebug: Add debug metadata support for xe_eudebug
>>
>> Jonathan Cavitt (1):
>>    drm/xe/eudebug: Use ptrace_may_access for xe_eudebug_attach
>>
>> Mika Kuoppala (6):
>>    drm/xe/eudebug: Introduce eudebug support
>>    kernel: export ptrace_may_access
>>    drm/xe/eudebug: Introduce discovery for resources
>>    drm/xe/eudebug: Add UFENCE events with acks
>>    drm/xe/eudebug: vm open/pread/pwrite
>>    drm/xe/eudebug: Implement vm_bind_op discovery
>>
>>   drivers/gpu/drm/xe/Makefile                  |    5 +-
>>   drivers/gpu/drm/xe/regs/xe_engine_regs.h     |    8 +
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h         |   43 +
>>   drivers/gpu/drm/xe/tests/xe_eudebug.c        |  170 +
>>   drivers/gpu/drm/xe/tests/xe_live_test_mod.c  |    2 +
>>   drivers/gpu/drm/xe/xe_debug_metadata.c       |  125 +
>>   drivers/gpu/drm/xe/xe_debug_metadata.h       |   25 +
>>   drivers/gpu/drm/xe/xe_debug_metadata_types.h |   28 +
>>   drivers/gpu/drm/xe/xe_device.c               |   47 +-
>>   drivers/gpu/drm/xe/xe_device_types.h         |   45 +
>>   drivers/gpu/drm/xe/xe_eudebug.c              | 3841 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_eudebug.h              |   51 +
>>   drivers/gpu/drm/xe/xe_eudebug_types.h        |  326 ++
>>   drivers/gpu/drm/xe/xe_exec.c                 |    2 +-
>>   drivers/gpu/drm/xe/xe_exec_queue.c           |   80 +-
>>   drivers/gpu/drm/xe/xe_exec_queue_types.h     |    7 +
>>   drivers/gpu/drm/xe/xe_gt_debug.c             |  152 +
>>   drivers/gpu/drm/xe/xe_gt_debug.h             |   27 +
>>   drivers/gpu/drm/xe/xe_hw_engine.c            |   39 +-
>>   drivers/gpu/drm/xe/xe_hw_engine.h            |   11 +
>>   drivers/gpu/drm/xe/xe_lrc.c                  |   16 +-
>>   drivers/gpu/drm/xe/xe_lrc.h                  |    4 +-
>>   drivers/gpu/drm/xe/xe_reg_sr.c               |   21 +-
>>   drivers/gpu/drm/xe/xe_reg_sr.h               |    4 +-
>>   drivers/gpu/drm/xe/xe_rtp.c                  |    2 +-
>>   drivers/gpu/drm/xe/xe_rtp_types.h            |    1 +
>>   drivers/gpu/drm/xe/xe_sync.c                 |   49 +-
>>   drivers/gpu/drm/xe/xe_sync.h                 |    8 +-
>>   drivers/gpu/drm/xe/xe_sync_types.h           |   26 +-
>>   drivers/gpu/drm/xe/xe_vm.c                   |  227 +-
>>   drivers/gpu/drm/xe/xe_vm_types.h             |   26 +
>>   include/uapi/drm/xe_drm.h                    |   96 +-
>>   include/uapi/drm/xe_drm_eudebug.h            |  226 ++
>>   kernel/ptrace.c                              |    1 +
>>   34 files changed, 5655 insertions(+), 86 deletions(-)
>>   create mode 100644 drivers/gpu/drm/xe/tests/xe_eudebug.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_debug_metadata.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_debug_metadata.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_debug_metadata_types.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_eudebug.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_eudebug.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_eudebug_types.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_debug.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_debug.h
>>   create mode 100644 include/uapi/drm/xe_drm_eudebug.h
>>
>> -- 
>> 2.34.1
>>
