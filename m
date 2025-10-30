Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CECCCF9F8
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 07:03:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08EB210E029;
	Thu, 30 Oct 2025 07:03:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C5LNEdX4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD0DC10E029
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 07:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761807793; x=1793343793;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bt4WOZns5qbMHLsJu/9o1UtSwxxsoKco2VMoINMLtZA=;
 b=C5LNEdX4u4vbraGSfy4yFYrQ6p7fDJkogHd+QTI+0/N303lyDDapRpZf
 mW0zcAkF8OD/gf7U3zY1LAHGu5fq1zot11GxCXMnSlPMDT4T+KjfyeG7i
 XzHhdcU7syen5xEm4Apuo6KiNUXR8L5FrwyF3oWqJ026Zi82BJbnAhdwA
 adx6jA0R2tdI4NHDLNda3AYdGiPft21jatcQ63K5t/nFQiNuqp4ROlCFw
 ooeec+glztwFK09VHwh/lOqcbqbr71F+zD4YeeANSxU3Vupq9z7OfQywo
 +KzlJwTGhqu5w3ni+kuCc4IlRRpV2habdXS2T4MuFU8m42aWNTx+DEXyM w==;
X-CSE-ConnectionGUID: IpqnuNuTSaWgzWPVwT9zPA==
X-CSE-MsgGUID: ouNPFgcYSiq6sHPKvcYdxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63850505"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="63850505"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 00:03:12 -0700
X-CSE-ConnectionGUID: QVMbQKxYROiTpsH9ZpvB5A==
X-CSE-MsgGUID: MSFzV/xZRBG1x8B61P56Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="216728950"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 00:03:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 00:03:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 00:03:11 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.13) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 00:03:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mHdB2sogvi6y+7k5HuJEdQI6J6zpLBaGJCtg42wr2MsWv8OqiiawbI2uZ0jsVJhY1Ovg5mZ2LKzAGcPA88/DKTrBRzUKz/nYeODYSAS7N9du6zMjwJk6MKW/H23x8houV2lp5qc/ok/cX+RPLzG8eH0EFlpQb0ucE9+25wU3PwDXFe1OsYmBYolFBsSuykcvHVnIwvWHcwrkyMOVIEOmutk/Oe143hkLo1w5NnTuTeDuhZG9OeVBrQEmxocBR6GvOCRYQBRGL4iberbBA9tZw9wR7+zxzV52YtTDUJe+jvD5c3jK5HcDPT9nof7XLv2Zo7YSBk2flLzz+SLe6bRbHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLblCU+iMunbrGUYW1IvwfkqzNJc7aMqpaoZE+YTKLw=;
 b=NLjzQch/oSHyb/nbKl33QN0P6Y82gIvRJH0uXHmBEBP7PZ0BG/zD2aXW9h/vVQkfcL90CV8a/c6M5SS5OAqaBiKF7CuRPk99hw/J3JZ8RKtOIXVLunvk7xss8lhC90y+T7igGGJTzH3gwLxZdFi4NV0Tb8VF+WzW7uz+vYDkocEl4uSHSe4O7jhtAAdpCnEXXKtyzrjuUoZAWXEg1M4ACBhgqzZrB3IsOKuv3+9JJVkft60ENAYOiPblvtCVaeKuo71tgyYmnR+x1Wx5HUnXuOIVrXsjvOSp/vXaVhCDQgmlnTY+Y0wLicqYQiRXut6/YM0PWkI6Iz7JxJp7jsycmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6096.namprd11.prod.outlook.com (2603:10b6:8:af::16) by
 DS4PPF4B1ECA5EA.namprd11.prod.outlook.com (2603:10b6:f:fc02::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Thu, 30 Oct
 2025 07:03:09 +0000
Received: from DM4PR11MB6096.namprd11.prod.outlook.com
 ([fe80::f3b4:61a8:7022:df18]) by DM4PR11MB6096.namprd11.prod.outlook.com
 ([fe80::f3b4:61a8:7022:df18%7]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 07:03:09 +0000
Message-ID: <59ccc1f9-efb6-4584-93ca-7114a644a851@intel.com>
Date: Thu, 30 Oct 2025 12:33:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/9] drm/xe/madvise: Implement purgeable buffer object
 support
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>
References: <20251028122415.1136721-1-arvind.yadav@intel.com>
 <20251028122415.1136721-4-arvind.yadav@intel.com>
 <f976fdad404f4e8704ad2974dfed06f80ba31e6e.camel@linux.intel.com>
 <93be3dde56c24ce83c28a2dfe3bffeaf9a47b25d.camel@linux.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <93be3dde56c24ce83c28a2dfe3bffeaf9a47b25d.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0070.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::9) To DM4PR11MB6096.namprd11.prod.outlook.com
 (2603:10b6:8:af::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6096:EE_|DS4PPF4B1ECA5EA:EE_
X-MS-Office365-Filtering-Correlation-Id: afac33e8-f3c6-45c1-4141-08de17826236
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V1ArSW93VHFLY2dRQzc5V3lRYjR4QWhmYjViVHBOelc1MXk0M3AzUFRucGY4?=
 =?utf-8?B?R2hCbWVGakV1alpRVW9YYjc4TTZVSWxERnhFRVhQUTBKaG1mUDdieTlRR2dF?=
 =?utf-8?B?ZzJmZU03NDRBZE5OV05paU40Tk5QYUZLV1VvOG9ZMHkyY3drNWpLU3pjVG42?=
 =?utf-8?B?akVvSVN3aWh6Vld0OHFWUkc3TXdEdk5nWWRFY01seEVHSDhaWW5Mc0JqUEhL?=
 =?utf-8?B?V0syeit1QVpRTHNLTWwwcG40YndtSnNhWGdhNDhobkE0RnFXdml3VVA4dFdF?=
 =?utf-8?B?dkhUODEyU2dhRlh1VEdaUHRuWlFlRGR0SVZmdFhmUTRoSmNzRWV2RnZCSG9q?=
 =?utf-8?B?RHVwaTI4ei9BYlZsYnd4MjZGclBCUW1yRVVjNlE2MnJFZmlwVy9YaTRFWS9w?=
 =?utf-8?B?UGtZTklEU2JzSlo5U01FLzdtQkFRdVpOaTQ1TEgrWG5qUmVrMlZxQWk1b3dW?=
 =?utf-8?B?bVFUU1oyM3hHd0tUQ3k2WFFVOEZ1KzFBTWlXekx1N2E2dU5qYUloQlJGamN3?=
 =?utf-8?B?RmM1eENsMS9mN0NKT2RkTnppZnVOTWl1NSs4dEtoK0tweUJaM3lWaTJWb0Iz?=
 =?utf-8?B?T3pmeVV4eFd6QmNzSFRUYk8yM1pETjdiUUVhYTFsMGlEUjF5bENxcDFML2dF?=
 =?utf-8?B?RG5TTHk2MFp1dHdnUUhrVk9TRndjdm9xWFJuMjZHQzhRS0k3Qk92RGtTOUVO?=
 =?utf-8?B?M0o5elZPTks2dXVBckRuV3llYStsckoyZEd5aGQyT0lSb2tjdjlVOENxYkM5?=
 =?utf-8?B?R3pnMng3ZmVZTFlTUThhMnNXUzJNS0xGcUxPNkpVMm1SVU9lZVVVRnBFMjVa?=
 =?utf-8?B?aXk4ZitORHNCUGdNUTcyaUp3akEzTkZRUWZoUEt6TGVYUUNjL2ZGUG4yZGF0?=
 =?utf-8?B?L1AxY20yR3hrZUxiTktvWlduT3JPY2JZektOVnZkZjFFUHpJeG96TjZFOFhl?=
 =?utf-8?B?TS9HUGFlY1VvMEJBVS95enNtZ2k2WUF3NHlra3JQNElUbHdIRWswT0t5a0dh?=
 =?utf-8?B?TFM5d09xcGxROEhseFk2WENmZGQvMk5SWnB2L2w2OUFBV2cxSHNHSXJ6dE9I?=
 =?utf-8?B?d0Y5S01yV25TUlpEMFRkd2VZbTdORzBGbzdNTExhUnZxalpFQnpGYnE1UkVD?=
 =?utf-8?B?UlJOZFRTaklIUlNsUVdEdy9sYXlmbTgxNFVHcFZaZTFRR1UyUVo5c3Jtc2Zp?=
 =?utf-8?B?Q1VSN3dpVkIzTSs2OXNtUTU0UHRaTS9lVnYvdVZSVUt5TzY4Y25La1RtUW5W?=
 =?utf-8?B?Y2FUbnNSSXNUNVJUL2hxdjYxSEsvMVliM2RzTFBFNEZiRTJnUy95akZSSVVT?=
 =?utf-8?B?MkNweE1HZG10dE9FVEdmNmVsbzAwYVYyN0IvckxmUGNZeFRWRU04QlZJM2gz?=
 =?utf-8?B?akpYc1N3ZE9XanRDRHIzUy9ub1RLWXpVQUVucUl3R00rY3RCWmNaZGJ0UVU3?=
 =?utf-8?B?YXBuQkhLdHFUamFZdm1BMzM0SjQza3JlRFM5U0txdTJyQUJnN2dlQmh6dko4?=
 =?utf-8?B?ZHozSVVUVlp6UXl1c3B5b21sSWRRa3JBUjEvY205dm00NmNyY3pOemh1blgv?=
 =?utf-8?B?WU54aDdaclBNYU1aYXU3dnJLTU9KcFNSb2ppc3U0WjduUnR0RDFOV083dzNC?=
 =?utf-8?B?TjFqR2NUMGw4OVoyem5xZkpiRmswZHNuWHBOS3pqQ1ZENlgwNjRoQ0tnNzZM?=
 =?utf-8?B?S3hrSHdKSjAzZEhxQ0lnL240ZjQ5Y0d1QjhOVysrUTlXK284MVRSUmdYZmMw?=
 =?utf-8?B?N3ZRYndzVVlxenUvaFdBUTUxZGZnWm91azhqQUFjM3pueHZ6L0w5dDVtaFgw?=
 =?utf-8?B?VFN4amV0b2VmUVVSVyt3N3JsRXd6WXVzckZLeTZ1UGRJbDgvSUJuU0ErVGtt?=
 =?utf-8?B?bjVpSjNUOFI0M0ZHQXlGZDI2b0hZNG5MVWhQVnh1VWdwRlpXakZoWTR2WXl5?=
 =?utf-8?Q?qjM59OL7a+QEKUOjLyerACrdroxFFrWf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6096.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enl5SERJcDRWdDM4eng2c1JlaCsvR1F6bHRJcEswMnFMbzl0Z1c0MUtFbVFx?=
 =?utf-8?B?VWgvVmNXUzZuNFV5SVJ6bnN2OFo4S202MUFOU3l0UGZjOHJlRWhhZFNQNjdw?=
 =?utf-8?B?OGl3dC9weGVubGIwU1JKM0pJS1JHUVhKeElOWS9sTEM5RTNFc1cxUk5MNVNM?=
 =?utf-8?B?bU4weklRd0FiNmZUK24wU0R0ZFhtUHRjMCtrZFFBcHVXbXRHeTRyRFBXZVRO?=
 =?utf-8?B?V3ozQlJ4Snk4bGNJZHNpbnpEeFBVaGVZcjZQOWtaL3dlaW9PWmRZN2lsK2xy?=
 =?utf-8?B?MzlLbEsrbEVaUnJ3T1JwUHNERXh3N1lJa29hZngwRlZCVWhxTlJhd1d6LzA1?=
 =?utf-8?B?TE5NeVJpUXVPZXMrSUJMek5pNjc5NVUxVURZMEJhUEl2RVJSdWNiSU1DZmRW?=
 =?utf-8?B?SWRBSjFqRCtIa2lmWkViTDNtNVNHaFZMRHF4S24zR2FkcC81SVpxbGhxWm81?=
 =?utf-8?B?TDgzTmh6WGRiQmpaZk5vMkh4RGZWUXpsdys5YmQ5N3NNM3pic1JmeTl6dzFW?=
 =?utf-8?B?cHBGV2VGTENrbk1XRVVFYjEzeEVxL0gvMk9iUndZbGEwNEkzRUdLTENVbDNo?=
 =?utf-8?B?dVVBTkt1MXl5VHU4dmJ2cm1vYVRTclZXZDF5bG9WckliUWlkZ0R2NDY2YUYr?=
 =?utf-8?B?cGM3Y1doOERablFDRjRHdnRLck9LYWg1aFJ4NjduN2lTRUtRR1h5YnhWMWk3?=
 =?utf-8?B?d0V2UWFmUnRyNjNyYXVlSG4wdWZ3SHdzOUt4M1VsMXRQZE5GYTZSMm51YjZ5?=
 =?utf-8?B?dk5VT3RXdS9wU3BPK3B3T1ZHb1lCOU94VmdyeG5KL1RsU2lZcE42V0s4MWV4?=
 =?utf-8?B?RlVnL1NxMjJLT0ZCY1dvSEhyVFhtSjJiczdsVGFUWkh1Qjh2c0RPMDV0K0xk?=
 =?utf-8?B?K21NbWhrNWljN0FhU0krdXVhNFVMWUl5NDFjcmg2Y2tMTnZ2U1N1YlVtMm8y?=
 =?utf-8?B?djhIaGJJQUpCK0lwd0trNmtQVTVtcitxQ0FIbkFjVzFKUTdyLzBBSkRVZzBl?=
 =?utf-8?B?OW1iOXJqU01Fc0N6VXJkbVNoK1FoWWUrN2I4ejg4MkdsdWVpT3BHVDlBNHUx?=
 =?utf-8?B?SUN5YThEekwxcWJvdXZocHZvU01BRnhJdkN2WkxwNWFyNk1nQUpjSkkweWpz?=
 =?utf-8?B?bXNubVRIcGkrL05uUGd4NEZJUkFsMkFaUDRwUENQRm85M3ZyRjFQVHYxRGQ1?=
 =?utf-8?B?VFJDSXVBUDdlMjUxaTdvYngrdUNKaXdib2E3aGhiUExSaXlKdjJuRWwxVFJT?=
 =?utf-8?B?SjZXUlBkSmtmdVlZR09DZ05BUWRCSmVvVnRKZWU0Uk1pa2p3aUZnNlpvMGhK?=
 =?utf-8?B?NGtZTnFycG0rc1d3Nk5odENGOXNjK2YyT2VEUVdNUU45VVl4aWdxTnBtbzBM?=
 =?utf-8?B?UkpNMmRUS2ZjTS9ZSTZQREFvV29iNWkwUDc1dW90MEd2bG9nN3VNdlp4elFu?=
 =?utf-8?B?T2lpQWd1alZ6QU1WL25lUDZhTmdaTXJHK1RYNWJHN2ZoeEV6bUp5KzZxdnQx?=
 =?utf-8?B?OHdHSDI1Qnd2elpaS2FmdWFiR0M0b2xSWkFabWwxZjJjRlhuYTduVHg5emVu?=
 =?utf-8?B?YkhFNGtVVkdpbGZOUTBydFdVRG5XWUUwMWROek9LaEpRb2ExTDM0NXhZZUF2?=
 =?utf-8?B?UFNmTENwcE9tTG9VNFJKdDJ3WHNkMlpLbTJtZTlpK0lYUWJjWWtIdHBpSmdj?=
 =?utf-8?B?Zm5lSWtUQ3c3cTZITGI5ZTRUc1RaNWpiZU5PamZaOExVaXBJMTFWZURwMUV1?=
 =?utf-8?B?TThuQ0p1SVUwUFkrajBHUkVJK0xHdGY1OEV2dTdldU9sMmxUZGsrc2dNYURO?=
 =?utf-8?B?ZjFpeTBkNVB0eHZkeXZENE1ubTBVUCtDdTlad3lIdnN2WS82UUF4YlJYVGo5?=
 =?utf-8?B?TzNETEdyaC84Q2tDQzVFSTZIRmtxVm8zZStkME1xeU9RTW5nUEpKNWJSSWty?=
 =?utf-8?B?UmRmVk5aV2I4WmU1QTc3ZUlkZFpTbVFvTjRlQ2d4Y0ZYRW1nZFRkbDhsYlp4?=
 =?utf-8?B?ZjdvaCtZVWZDQkFFamFGNFN0b2NmY3hqMGZSbXdGWVZyMGM3WC9qNU84MEJX?=
 =?utf-8?B?djVYUG5WNU12ZVpOUHQ3RGV0T2tYZzlQczJNa0h4R0pWcGJLZG1xb1RSSnJ5?=
 =?utf-8?Q?i8Kp9iBNm+pHaERfzeepajpeL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: afac33e8-f3c6-45c1-4141-08de17826236
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6096.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 07:03:09.8200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Tybh1hEj8BhgjfQgV6ZoN9F0DCHCkLlOOXSRVlqPdNYsxr9ur+8mVaRLtURoezkeVrf9ICgXDi4jdkVX0TSsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF4B1ECA5EA
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


On 29-10-2025 16:21, Thomas Hellström wrote:
> On Wed, 2025-10-29 at 09:55 +0100, Thomas Hellström wrote:
>> On Tue, 2025-10-28 at 17:54 +0530, Arvind Yadav wrote:
>>> This allows userspace applications to provide memory usage hints to
>>> the kernel for better memory management under pressure:
>>>
>>> - WILLNEED: BO will be needed again, re-validate if purged
>>> - DONTNEED: BO not currently needed, may be purged if needed
>>>
>>> When userspace marks BO as DONTNEED, the kernel can reclaim
>>> their memory during memory pressure. BO transition to PURGED
>>> state when reclaimed, and attempting to access purged buffers
>>> triggers appropriate fault handling.
>>>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_bo.c         | 75 +++++++++++++++++++++++++-
>>> --
>>> --
>>>   drivers/gpu/drm/xe/xe_vm_madvise.c | 67 ++++++++++++++++++++++++++
>>>   2 files changed, 130 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c
>>> b/drivers/gpu/drm/xe/xe_bo.c
>>> index cbc3ee157218..3b3eb83658cc 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>> @@ -836,6 +836,60 @@ static int xe_bo_move_notify(struct xe_bo *bo,
>>>   	return 0;
>>>   }
>>>   
>>> +static int xe_bo_invalidate_tlb_before_purge(struct xe_bo *bo)
>> In the future someone might want to reuse this function for
>> invalidating somewhere else. Could we perhaps rename to
>> xe_bo_invalidate_vmas() or something like that?
Noted.
>>
>>
>>> +{
>>> +	struct drm_gpuvm_bo *vm_bo;
>>> +	struct drm_gpuva *gpuva;
>>> +	struct drm_gem_object *obj = &bo->ttm.base;
>>> +	int ret;
>>> +
>>> +	/* BO must be locked before invalidating */
>>> +	dma_resv_assert_held(bo->ttm.base.resv);
>>> +
>>> +	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
>>> +		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
>>> +			struct xe_vma *vma = gpuva_to_vma(gpuva);
>>> +
>>> +			ret = xe_vm_invalidate_vma(vma);
>>> +			if (ret)
>>> +				return ret;
>>> +		}
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static void xe_bo_set_purged(struct xe_bo *bo)
>>> +{
>>> +	/* BO must be locked before modifying madv state */
>>> +	dma_resv_assert_held(bo->ttm.base.resv);
>>> +
>>> +	atomic_set(&bo->madv_purgeable, XE_MADV_PURGEABLE_PURGED);
>>> +}
>>> +
>>> +static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo,
>>> struct
>>> ttm_operation_ctx *ctx)
>>> +{
>>> +	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
>>> +	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
>>> +
>>> +	if (ttm_bo->ttm) {
>>> +		struct ttm_placement place = {};
>>> +		int ret = ttm_bo_validate(ttm_bo, &place, ctx);
>>> +		int ret_inval;
>> Christian from AMD once mentioned that instead of implicitly calling
>> ttm_bo_validate() with an empty placement, we could send the null
>> placement through the evict_flags callback. Would that work?
>>
>>
> Actually it doesn't since we don't get to call move_notify.
Agreed,
>>
>>> +
>>> +		drm_WARN_ON(&xe->drm, ret);
>>> +		if (!ret && bo) {
>>> +			if (atomic_read(&bo->madv_purgeable) ==
>>> XE_MADV_PURGEABLE_DONTNEED) {
>>> +				/* Invalidate TLB before marking
>>> BO
>>> as purged */
>>> +				ret_inval =
>>> xe_bo_invalidate_tlb_before_purge(bo);
>> Since the page-table update and page-freeing is really intended to be
>> an asynchronous operation, and the GPU bindings are intended to be
>> invalidated in move_notify() / trigger_rebind() where we properly
>> take
>> care of special cases like faulting VMs etc, can we move the
>> invalidation logic there?
>>
>> Perhaps it is even possible to skip the synchronous page-table
>> zeroing
>> here in favour of a NULL rebind (when rebinding a purged BO we set up
>> all zero mappings, or whatever mappings are required given scratch
>> page
>> mode etc.) Then the page-table clearing will be properly inserted in
>> the asynchronous execution.
>>

My understanding is that you are suggesting two main changes:

1. Asynchronous Invalidation: I should remove the synchronous 
xe_bo_invalidate_tlb_before_purge() call. Instead, I should rely on the 
existing asynchronous invalidation path that is already triggered during 
eviction via xe_bo_move_notify() -> xe_bo_trigger_rebind(). This will 
handle the TLB invalidation correctly and more efficiently.

2. NULL Rebind on Access(for VM Faulting Mode is ENABLED): When a GPU 
operation tries to bind a buffer that is in the PURGED state, the driver 
should not error. Instead, it should perform a "NULL rebind" by mapping 
the buffer's VMA to a scratch page. This ensures the GPU reads safe, 
zeroed data instead of accessing invalid memory.

The BO would only be re-allocated and re-bound when userspace explicitly 
Call WILLNEED.
I’ll now look into implementing the NULL rebind logic within the VMA 
mapping path and will follow up with an updated patch.

~Arvind
>>> +				if (!ret_inval)
>>> +					xe_bo_set_purged(bo);
>>> +
>>> +			}
>>> +		}
>>
>>
>>> +	}
>>> +}
>>> +
>>>   static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool
>>> evict,
>>>   		      struct ttm_operation_ctx *ctx,
>>>   		      struct ttm_resource *new_mem,
>>> @@ -853,8 +907,14 @@ static int xe_bo_move(struct ttm_buffer_object
>>> *ttm_bo, bool evict,
>>>   	bool needs_clear;
>>>   	bool handle_system_ccs = (!IS_DGFX(xe) &&
>>> xe_bo_needs_ccs_pages(bo) &&
>>>   				  ttm && ttm_tt_is_populated(ttm))
>>> ?
>>> true : false;
>>> +	int state = atomic_read(&bo->madv_purgeable);
>>>   	int ret = 0;
>>>   
>>> +	if (evict && state == XE_MADV_PURGEABLE_DONTNEED) {
>>> +		xe_ttm_bo_purge(ttm_bo, ctx);
>>> +			return 0;
>>> +	}
>>> +
>>>   	/* Bo creation path, moving to system or TT. */
>>>   	if ((!old_mem && ttm) && !handle_system_ccs) {
>>>   		if (new_mem->mem_type == XE_PL_TT)
>>> @@ -1606,18 +1666,6 @@ static void
>>> xe_ttm_bo_delete_mem_notify(struct
>>> ttm_buffer_object *ttm_bo)
>>>   	}
>>>   }
>>>   
>>> -static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo,
>>> struct
>>> ttm_operation_ctx *ctx)
>>> -{
>>> -	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
>>> -
>>> -	if (ttm_bo->ttm) {
>>> -		struct ttm_placement place = {};
>>> -		int ret = ttm_bo_validate(ttm_bo, &place, ctx);
>>> -
>>> -		drm_WARN_ON(&xe->drm, ret);
>>> -	}
>>> -}
>>> -
>>>   static void xe_ttm_bo_swap_notify(struct ttm_buffer_object
>>> *ttm_bo)
>>>   {
>>>   	struct ttm_operation_ctx ctx = {
>>> @@ -2472,6 +2520,9 @@ struct xe_bo *xe_bo_create_user(struct
>>> xe_device *xe,
>>>   				       ttm_bo_type_device, flags,
>>> 0,
>>> true);
>>>   	}
>>>   
>>> +	/* Initialize purge advisory state */
>>> +	atomic_set(&bo->madv_purgeable,
>>> XE_MADV_PURGEABLE_WILLNEED);
>>> +
>>>   	return bo;
>>>   }
>>>   
>>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> index cad3cf627c3f..1f0356ea4403 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> @@ -158,6 +158,54 @@ static void madvise_pat_index(struct xe_device
>>> *xe, struct xe_vm *vm,
>>>   	}
>>>   }
>>>   
>>> +/*
>>> + * Handle purgeable buffer object advice for
>>> DONTNEED/WILLNEED/PURGED.
>>> + * Returns 0 on success, negative errno on error.
>>> + */
>>> +static void xe_vm_madvise_purgeable_bo(struct xe_device *xe,
>>> struct
>>> xe_vm *vm,
>>> +				       struct xe_vma **vmas, int
>>> num_vmas,
>>> +				       struct drm_xe_madvise *op,
>>> struct drm_exec *exec)
>>> +{
>>> +
>>> +	xe_assert(vm->xe, op->type ==
>>> DRM_XE_VMA_ATTR_PURGEABLE_STATE);
>>> +
>>> +	for (int i = 0; i < num_vmas; i++) {
>>> +		struct xe_bo *bo = xe_vma_bo(vmas[i]);
>>> +		int state;
>>> +		int ret;
>>> +
>>> +		if (!bo)
>>> +			continue;
>>> +
>>> +		/* BO must be locked before modifying madv state
>>> */
>>> +		dma_resv_assert_held(bo->ttm.base.resv);
>>> +
>>> +		switch (op->purge_state_val.val) {
>>> +		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
>>> +			state = atomic_read(&bo->madv_purgeable);
>>> +			if (state == XE_MADV_PURGEABLE_PURGED) {
>>> +				ret = xe_bo_validate(bo, NULL,
>>> true,
>>> exec);
>>> +				if (ret) {
>>> +					drm_err(&vm->xe->drm,
>>> +						"Failed to
>>> validate
>>> purged BO: %d\n", ret);
>>> +					return;
>>> +				}
>>> +			}
>>> +			atomic_set(&bo->madv_purgeable,
>>> XE_MADV_PURGEABLE_WILLNEED);
>>> +			break;
>>> +		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
>>> +			state = atomic_read(&bo->madv_purgeable);
>>> +			if (state != XE_MADV_PURGEABLE_PURGED)
>>> +				atomic_set(&bo->madv_purgeable,
>>> XE_MADV_PURGEABLE_DONTNEED);
>>> +			break;
>>> +		default:
>>> +			drm_warn(&vm->xe->drm, "Invalid madvice
>>> value = %d\n",
>>> +				 op->purge_state_val.val);
>>> +			return;
>>> +		}
>>> +	}
>>> +}
>>> +
>>>   typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm
>>> *vm,
>>>   			     struct xe_vma **vmas, int num_vmas,
>>>   			     struct drm_xe_madvise *op);
>>> @@ -283,6 +331,19 @@ static bool madvise_args_are_sane(struct
>>> xe_device *xe, const struct drm_xe_madv
>>>   			return false;
>>>   		break;
>>>   	}
>>> +	case DRM_XE_VMA_ATTR_PURGEABLE_STATE:
>>> +	{
>>> +		u32 val = args->purge_state_val.val;
>>> +
>>> +		if (XE_IOCTL_DBG(xe, !((val ==
>>> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED) ||
>>> +				       (val ==
>>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED))))
>>> +			return false;
>>> +
>>> +		if (XE_IOCTL_DBG(xe, args-
>>>> purge_state_val.reserved))
>>> +			return false;
>>> +
>>> +		break;
>>> +	}
>>>   	default:
>>>   		if (XE_IOCTL_DBG(xe, 1))
>>>   			return false;
>>> @@ -402,6 +463,12 @@ int xe_vm_madvise_ioctl(struct drm_device
>>> *dev,
>>> void *data, struct drm_file *fil
>>>   					goto err_fini;
>>>   			}
>>>   		}
>>> +		if (args->type == DRM_XE_VMA_ATTR_PURGEABLE_STATE)
>>> {
>>> +			xe_vm_madvise_purgeable_bo(xe, vm,
>>> madvise_range.vmas,
>>> +						
>>> madvise_range.num_vmas, args, &exec);
>>> +			goto err_fini;
>>> +
>>> +		}
>>>   	}
>>>   
>>>   	if (madvise_range.has_svm_userptr_vmas) {
