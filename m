Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F7CE7FDF5
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 22:37:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3BE10E0BC;
	Mon,  2 Feb 2026 22:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lYb398Yi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA9110E0BC
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 22:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770071874; x=1801607874;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WrS3rYGQ6YuRiZH/md49pbBF8UpWlC3yMh0v29GGOEY=;
 b=lYb398YihJ1XjrHcb4Mdj4XjkoGzATY8oQEE0J87BzCaXu3D0R/wRMhM
 auyENJloU+JzFxN5DxUN3kdIYquw7cv1tsi29vL52Htzph50l+b4KmdZo
 wJCq1GkNhk3Ctxg5FUONIOeCCbhhfNV5pbGXG/GmolFqoIxqsHCfPrMzn
 7R6sOUTBT9Ccz5outlZtgtsP2T3G8hb0uBr5uyO/AP5AhePNcaNeQiwTR
 QhErbV68MZcxuwDwdBISX2Yv3CXsRiNk0BtrgBA1SjGRgHKTyVW0HWEOu
 JaToLME/Ev6xhmTaDklyBOr0NphwdWseRTIaAbV21JHIORqMScFOyyHEb A==;
X-CSE-ConnectionGUID: LMd2JFn6RSiFBY4ilhPqlA==
X-CSE-MsgGUID: X9E1vH/6QzSm5dcGQkzpXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71136759"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="71136759"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 14:37:54 -0800
X-CSE-ConnectionGUID: nP7P/eTCRS+BC79VNrrcSw==
X-CSE-MsgGUID: d0yZ64IbRkqq0qdCakk4+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="209871808"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 14:37:54 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 14:37:53 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 14:37:53 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.16) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 14:37:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fxqfRQLcEk7j4CLs8IdoNqemffdRKAL/ERWsIX9Ir287uT/+5q4r6GNjmDOsWUFgWXp5CCNFhw8gGQ+brrHu99mFLSKIen54mZXE/s7RapV0+rmjdah5hRIyOxP4j6ZU9IPwHIA/SOSeZ0eOX78q3Vr335Ex6qDqswgDkwS0zmyDbUKVgHfpbRPnbywBRAmWzj7nt7eO4ALCGdzmzAENU1b5Hf5XRodn6ccvXR5CXmUCSYvMJqxZygQ155v2JO5Dieczry5M+NHuIvUN2GWM0AeM5bu6jdtMVimvAfegy0BAuKcMc+2sUYtqcOXu65C6AKxoQdbOJBDSqoNwDy1nVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z72qzn4X2bL7bGG3EEO+/A0KdNBAFddZgvWx6nlWXTU=;
 b=cX46JIubgoCzj1eDG//mBpnvHahaHV7pAkPaZgbGYIMqC27LuxKqiMa6HlWNxP6V/2koYVMffh3MDTjvkz/t5B+ibOPuGi3QrAdKIORGr9llmYWP4oQhvb7piAurDNd6Jzse2iyM0m+oIctMFEXs9+IpBf21gHhJfyRf3cD+emFsca5tl2MUSIxTklYTH0jjbZ6CEexTu3Zo599cPp3wJSLhB7tS1NtIeVP4xOlwhZ4Dz6h0dZ+yHTES1Sd5FJ7B7gn48ykJPIysvA6p615+UJYErNB20mIK7WKVwpbfp/bulpUOblAgPBh84QhxffXBhQvMWmGPTC63jjVBPmh8AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 22:37:49 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 22:37:49 +0000
Message-ID: <debe7ede-51ac-490d-8e3d-ac10a69a591f@intel.com>
Date: Mon, 2 Feb 2026 23:37:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/cri: Add check to verify if CSC is a PCIe
 endpoint
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Alexander Usyskin <alexander.usyskin@intel.com>, Shuicheng Lin
 <shuicheng.lin@intel.com>, Soham Purkait <soham.purkait@intel.com>
References: <20260202165351.2020699-2-balasubramani.vivekanandan@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260202165351.2020699-2-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::18) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CH3PR11MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: 005a8360-9288-4cbb-5af2-08de62abb182
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGVXSFpVUUYvcDNzbFhvZ2U4RVNDdlVETC8xYVhqVWxQL1k5c1FEV0VzWmFU?=
 =?utf-8?B?Uy9LRTVXT0pNaWRGRUtEQnhHOTdnajVRMnJMNW4wSHJZbmZzT2RGSUl5KzJV?=
 =?utf-8?B?WEkySU9IN2ZIai9wbmk3MEtqTVVHeXc2cG95ZmJyVnoyMFR1TXhBZExkbzFJ?=
 =?utf-8?B?VWs5TzA2MGpWNTlUbjJmdkl4RVgvbHlwOG1PM2w2MjF4d0JnMmcrbnJtZ3ov?=
 =?utf-8?B?WnhpNnd1eHFtNnhqMTBFU1RCekxiZkc3dVlOZGdhcXozVkF5alNFNUx6aUg2?=
 =?utf-8?B?RzlrL05yNkpSeEh1L2x2R1hWWkhrcXc1MDQ1K1FDTklIRmVCdWczZHRJOWZY?=
 =?utf-8?B?UXI1d2ZOcE9GZmMzeWZGN05RZDhqRUJuVFN0K3NwdDV2a09BRDNSUzN3bnl1?=
 =?utf-8?B?dnc1emZ1cU84aVRJbFFOOHhvU3MybEpVRGlIeXUwb3AwK1lCdGU3Mk9ZOThm?=
 =?utf-8?B?M1BiczRycGJZOFRjdlFhMm5EdE5zRWxYTFB2R3VaTG12SmE0ZkFMazEwNjJE?=
 =?utf-8?B?MGxFaHBNVmM4bUg5bDBnSkk2ZzVQNldtd0JsL3lkQzFwc3MrWnB0OHY1bTZC?=
 =?utf-8?B?ZUU2OEZYbTJkdk1VelNaZUNXd2VjL0VOckNmZVNGWnBwVkpDcDRnYm9vZ0Q3?=
 =?utf-8?B?Q2RpL2VCMDZ1ZWp3SHEzOUp4NHV3OEZaVktTV0Fmb1NWOXFQOXZ3bUhZRkpQ?=
 =?utf-8?B?aTFqNUJBT1N6NVI2T1B4WUJjZWhMaXdGc1B0eG5GWjFHVUluTVdINWdiVkFU?=
 =?utf-8?B?MU1RUXRMbmtPODVXMGJnV0VrYnFOSXBRMGlRUm9zbm9saEFrc3M2V2ZRWlpG?=
 =?utf-8?B?WDZod01LQ0MrSDZ4QVpqd0gxbHNZUWo0a0tQNjltdk5HeDZwMVBkOXZzM0N5?=
 =?utf-8?B?QTVpQkhtdC9iRzBqMitPYWVXSjEzUnhrTVZScVhsZlltS1k0dEpUUnRvN3pY?=
 =?utf-8?B?eGk0aEV6NEZyTzNPMnIraVNKUjM4VUFWdFNnUC93dFpMajRsK3MwS2tocjJE?=
 =?utf-8?B?NzBjUGZKWCtiNjY3MFlKZUtyTEtsdXlwRTdwZm5xZ3ZUUDNDbjdTem9uRmlw?=
 =?utf-8?B?NFI4Zkc3eG54b1lhV2lmN291OWlqOHJWNVJyVmRuZjhyMXhuejhLTlZheC90?=
 =?utf-8?B?T3kzSE5MVEI2emk1RUNxU0s0dG4ybVM2d2hGU2M5b2p6N2FXUldhQ3RiUkpL?=
 =?utf-8?B?T0F6Wms4L0p2Zitxc0d6VExDVDJNMTg2b2hkUUZhMnVVVE56NnQ1SDVtS29L?=
 =?utf-8?B?cHNPa0F3Rnl5OUE1SHI4WmQvSTAyeUdRYXFtT3pnMmZGVHlkMmhqREdIQ05u?=
 =?utf-8?B?czN3UUl2TFErNHRyNUdBQTBtdkREbFQzTXJxaktjK3N2OGFrWStMMzlnOXpq?=
 =?utf-8?B?RGFuSnVwT0JsMWRyTzYrVGVaYjBUdXd0TzhOM01DR2pkNjhCU0I2TndOZGp6?=
 =?utf-8?B?eHVCWVcyNzdxLzRNSERtWS9JTlFPT0g4UjVnNk9CSFAvQkhXaEMvd2lnT1lC?=
 =?utf-8?B?VnBhZERJR1c2VVZtbWxHOEFGK2ZDRnN4WGNjdjNnVzc3VzRLOGtxbkJEdnlm?=
 =?utf-8?B?aFZndW4zNnVWdGlCaVdEUm9LeEVaVzIycXVQcE9BNUsyQml6Sk1hZlhrK0dm?=
 =?utf-8?B?RGYyZEp0OVd5VHh3WCtlZzl5SlA4VjEyNkQ1Tm91YW5tajZoWi9NRDRQR0h1?=
 =?utf-8?B?MFFDRUE5YUhMQzliWUNlN0pCR1hpOStxYVdIUFgyL1VDRkJ1OXBhRkJ5RElB?=
 =?utf-8?B?UzBjc2VJL1RZOTB4NWtrOVZmZVZWMmY4NXJVak1iMUpJaDFLMVM2KzdEczhC?=
 =?utf-8?B?QWZWNkI2TU4rT3JCZytNWWt6OWZGcmpsQWRZUnN3NVIrNmZFZjJ4UHpaV3hi?=
 =?utf-8?B?dnQrV0swbGVjNGZibnNTNVhPTGFvQU9vYkRVV3VIUlY5NWk3K0EzaEVIanpr?=
 =?utf-8?B?Q2Z1OE9oaTVwa1QvUHNRU21BdldPc2YzdEFPK3JhTHVGV1hKM0piUmFPc2Qy?=
 =?utf-8?B?YS9ybENMMEs3all1WmZJYkdtZEtIUWVYeGtyVjZkR1RrMjFXSDUvTDFYMjFJ?=
 =?utf-8?B?cTRsWWovSXY0RHVuNi9VbDZkcHNUQ1gyalpzV3g2T3k4OWFrS0IzbjhnNkh2?=
 =?utf-8?Q?7Exk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmpPUXd1WkhKbkNMcmVLbUREZlhHSHR1b0JxYVhOTzZ0Ky9yYmJTbmRERm1s?=
 =?utf-8?B?VElNWXMrZXAvUkpOV1dtOElBWXczSVBvak91cloybWp4Vld5bTQvRTRBKzJx?=
 =?utf-8?B?RUhXOHd0ZnNzUnY0MHUwWlpUWFE5UEx5UFk4MDVYY3hsVFI4UDhvdTlML25q?=
 =?utf-8?B?Rit4VjIrdDY2QmIzS1pCcENZRXpTSlNSbHRvUXoycFVZSGxiQXlRUUhkTndN?=
 =?utf-8?B?WXUvYm84cFk5bW5ER3BXY3B3Qzh2MkM4NFVqT3A2MnVkR1htc0R0MWZsbklH?=
 =?utf-8?B?anF1eVB0RkdYbmJ4M2xBWldDOWtXNWMzT2hHSHlYdlJtMnM3RnhKK1YxN2tO?=
 =?utf-8?B?b0R0VCtlekJBdE5LaTl6QlJONm5kOWQ3dGtueHJiU0plNzd6dnNCSWdVNDBa?=
 =?utf-8?B?SEgzWndzUU5LT1U0b1dLSURHM0p2TkxKeG15d2RWT0dwa0VnZDVRN2ZXdnRu?=
 =?utf-8?B?cS9zQ3czdUJoL2ZhOFNOL3hSSXZDSm90WlZCcEV3RkRhUTcwMDdwMUw2SHVw?=
 =?utf-8?B?MGdwZE10Yi9rcDYyZ3k0OWFaU3BKM21ncjFMOEIwKzFCM00rbzJuQTg4ZUpM?=
 =?utf-8?B?bHIyc0ZJUXFyODJBbTBGOUhmVjBUMm5OTDZpSDJBSDJSSThXQjN3Z3hLUzcr?=
 =?utf-8?B?QzBudWdFaUloR1JyaDYrQ2JMU1N3ZlNab3FjUGhDcHRwRklVcmdzK0FacmJx?=
 =?utf-8?B?WW9hK2VpZHkwL1Rmd3ZhajBPWnQzcFJvdTBwSnQzckVnZmFXNjNrRHE3R2Ey?=
 =?utf-8?B?OEZpQ1VMK3JSL3Bvb2diMExJUWJJemtRbURnTkpTVEk5RCsvRk9ZS3Joei9z?=
 =?utf-8?B?K1hEb25IY1pWQkM1eVREd05BaEZUZUhES1lHcytwY05pajZIQmJJVWlSS1NZ?=
 =?utf-8?B?SVFnTTVNaVJTY1dQTWRmOGJYOTUvU3YzOE5Kd0g3WXpFbkxaWVRvT1B0MENK?=
 =?utf-8?B?cXRKNG8ycnZibkVWd1RveVEvdHd2UUp1a01UdXlleUgrcVFQSWNYb1NkRXBR?=
 =?utf-8?B?NFFHKzkzYkQzRlNrWjM2VlN0bklYSk1UNjF6c1VzcE1BeHYvSzQ4VkRmWFJJ?=
 =?utf-8?B?Mnc0cjRHTmJXK2JmdDQyWGxycmd2L01UR3pwL0xUNTI1aFVDVGRLSldhS1p6?=
 =?utf-8?B?bkVLcHloK1ozNklMc3BraStvcGR3RFlPTTRxSWxjMkx5ZzA5TEFZay9Tckhr?=
 =?utf-8?B?UTRQM1ZXczNTL2hXNkRUS2paclZaWTlSWjdnekJVczEyeVZodm5SUWJaa2xM?=
 =?utf-8?B?U1dQcWpUd3JuekpzQ1ZPdmxvdVpOSG5lcWpDa21RTzFtN2N6WEpUZjhBaGts?=
 =?utf-8?B?VUh0TEZQSFFjRWhXdVY1MUhvbGdsVzVFNUxFU0RSeUtlNEk5bHZXdFpYUFdN?=
 =?utf-8?B?djkwWmovSEZobFZRU1huOVVsZkNXMVhSV1h5WTc5c2UrdnhtVUlYUDhQY1lC?=
 =?utf-8?B?SGQzanZFZHV4aTB4Y3ovZHc0Ukc0U1BTRFQxaHdRbGNiS29KaldCNHhFbXk5?=
 =?utf-8?B?U2NNMjFLcFpYMW45RkdEMHA5d0xZM0ViQ1RGcjJqejVTNGEzcXNteFRJSkIy?=
 =?utf-8?B?SFRFbUVKeElDdUYvSnJCSVpGaEJqc1RYZEc0emlpc2p0K3hmazdST21MMGlO?=
 =?utf-8?B?NWZLeGJSbndFU3Z2WDhsMjAzb3U2T2FrMjUybkJ5ZVdWUnBZQnE5NEpRZHFO?=
 =?utf-8?B?dkdJMHJyZVJINXc5SEJBQXN3R2hGVVFpVktMSG44UW9wMHM2RzUyZmNRV1lt?=
 =?utf-8?B?V0xuRW1VcW51RC84NEY2QWw4bm5PMm03czduM3c2TGVhZ3ltK3dlUGR5Y3lU?=
 =?utf-8?B?ZUtHT3BsR2FFdUx6Y3JKUDRGakRscU5taU1TYzdxbE4vSmZnWHhyWFd6bGFG?=
 =?utf-8?B?dnpPcytleUpxak5jTFhpQ1RsZVJkTEE4RDZWeDRTZ2s4cUpMS2RmdW9hZWda?=
 =?utf-8?B?RVNPTUk2L21ncTF6K1NDNk5VeitMSHNiMm5tNy9mdmZjNnB4dDZxK2I1L2dW?=
 =?utf-8?B?VCtEbGoxUGhuUnhCdHdib1AyQVFENVErbUdHQ3NsNmdoYUtTc2FDQ09Xb2hC?=
 =?utf-8?B?UkdhUkFCMUdMZVJHNGNBVUF3VDFGRGhwcjZEL1hjWnRlM3RRYVUvcnRjaUE3?=
 =?utf-8?B?ck5tM0pudmREUEh5ZTkwQTlscVd1QmlMSUNhV0xORDNrNXVPQ2N4Q1dIQlN1?=
 =?utf-8?B?MTlocWFXM0NvZi9rRkdzOTdFTTlzb2licURzSElseGFaQ29MVlFSbDliSmVU?=
 =?utf-8?B?c2huWUhSSXUxTTdOcm43Y0o3ZGFHM2JOUVlvQUdOcE9QWld3bnBCSS9GUFl1?=
 =?utf-8?B?Q1kwN3ZhcjZYVVFVcGI4cjdJRGZJaHJubUdRbHFZTXB1WTZ5RWFrQ1JPTU5X?=
 =?utf-8?Q?zZJGzJlMxgvjdyOc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 005a8360-9288-4cbb-5af2-08de62abb182
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 22:37:49.2340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F5bkIggz1DQi5DtrzzHFoupr0NlR2JQC8yfPesPFCzd4UQKrCDYoj50nFu/txa7v1m+WEhDoR/N2pTKao3RmmpSE6YdRgDgZXB4St0IuTZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8707
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



On 2/2/2026 5:53 PM, Balasubramani Vivekanandan wrote:
> From: Soham Purkait <soham.purkait@intel.com>
> 
> Add check to verify if CSC is a PCIe endpoint via pcode mailbox
> during xe modprobe. If this mode is not supported, an auxiliary
> child device for the MEI driver is created as a fallback flow.
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
> 
> v2:
>   - Use scoped based resource management for runtime pm (Shuicheng)
>   - Initiliaze return value of xe_pcode_read (Shuicheng)
>   - Assert when CSC is not supported as a PCIe endpoint
> 
> ---
>  drivers/gpu/drm/xe/xe_heci_gsc.c  | 35 ++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_pcode_api.h |  1 +
>  2 files changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
> index c1f15313f92e..48b830c99997 100644
> --- a/drivers/gpu/drm/xe/xe_heci_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
> @@ -10,10 +10,14 @@
>  
>  #include <drm/drm_print.h>
>  
> +#include "xe_device.h"
>  #include "xe_device_types.h"
>  #include "xe_heci_gsc.h"
>  #include "regs/xe_gsc_regs.h"

btw, this include should is in wrong place ...

> +#include "xe_pcode.h"
> +#include "xe_pcode_api.h"
>  #include "xe_platform_types.h"
> +#include "xe_pm.h"
>  #include "xe_survivability_mode.h"
>  
>  #define GSC_BAR_LENGTH  0x00000FFC
> @@ -42,6 +46,29 @@ static int heci_gsc_irq_init(int irq)
>  	return irq_set_chip_data(irq, NULL);
>  }
>  
> +/**
> + * is_csc_pci_ep - Checks whether CSC is exposed as a PCIe endpoint

nit: functions shall be documented as:

	is_csc_pci_ep()

but this is a static function, is it worth to document it?
it doesn't seem to be extra complex,
its name already suggests what it does

> + * @xe:  xe device
          ^^

double space

> + *
> + * This function queries whether CSC is exposed as a PCIe endpoint,
> + * through pcode mailbox sub-command PCODE_STATUS_SUBCOMMAND_CSC_PCIE_DEVICE_STATUS.
> + *
> + * returns true upon CSC as pci endpoint, false otherwise

use proper tag:

	Return: ...

> + */
> +static bool is_csc_pci_ep(struct xe_device *xe)
> +{
> +	int ret = 0;

no need for explicit initialization, it will be assigned right below

> +	u32 val = 0;

likely same here, as I guess it's a xe_pcode_read SLA to setup val in case of success, right?

> +
> +	guard(xe_pm_runtime)(xe);
> +	ret = xe_pcode_read(xe_device_get_root_tile(xe),
> +			    PCODE_MBOX(DGFX_PCODE_STATUS,
> +				       DGFX_CSC_PCIE_DEVICE_STATUS, 0),
> +				       &val, NULL);
> +
> +	return (!ret && (val & 0x1U));

no need for outer ( ) and magic 0x1u - use proper define here

and maybe it would cleaner to first check for the function success:

	if (ret)
		return false;

and btw, will be there any message that pcode read failed ?
if not, then maybe extra message here is deserved ?

	if (ret) {
		xe_err(xe, "Can't detect CSC status, assuming not PCI endpoint!\n");
		return false;
	}

> +}
> +
>  /**
>   * struct heci_gsc_def - graphics security controller heci interface definitions
>   *
> @@ -179,7 +206,13 @@ int xe_heci_gsc_init(struct xe_device *xe)
>  
>  	heci_gsc->irq = -1;
>  
> -	if (xe->info.platform == XE_BATTLEMAGE) {
> +	if (xe->info.platform == XE_CRESCENTISLAND) {
> +		if (is_csc_pci_ep(xe))
> +			return 0;
> +
> +		xe_assert_msg(xe, false, "CSC not supported as a PCIe endpoint\n");

we use asserts to enforce software correctness

we shouldn't use asserts to check HW/FW

and since we can be here for 2 reasons (error, no cap) maybe we should better report what is going on?

note that asserts are compiled out on production builds

> +		def = &heci_gsc_def_dg2;
> +	} else if (xe->info.platform == XE_BATTLEMAGE) {
>  		def = &heci_gsc_def_dg2;
>  	} else if (xe->info.platform == XE_PVC) {
>  		def = &heci_gsc_def_pvc;
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 85cc7478b787..391a98c8b5fb 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -35,6 +35,7 @@
>  #define     DGFX_GET_INIT_STATUS	0x0
>  #define     DGFX_INIT_STATUS_COMPLETE	0x1
>  #define     DGFX_LINK_DOWNGRADE_STATUS	REG_BIT(31)
> +#define     DGFX_CSC_PCIE_DEVICE_STATUS 0x3

shouldn't this defined using REG_GENMASK ?

>  
>  #define   PCODE_POWER_SETUP			0x7C
>  #define     POWER_SETUP_SUBCOMMAND_READ_I1	0x4

