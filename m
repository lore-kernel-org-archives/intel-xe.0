Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9EBE73146
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 08:38:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC85D10E286;
	Mon,  2 Feb 2026 08:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P1pOtJCT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC7F10E286
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 08:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770021510; x=1801557510;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=P0HSLM4k3LXOiQ7hGhHZj8m+oWLZJmxMZMM/9Eog+24=;
 b=P1pOtJCTx5ovKjsbAkDNQX5nxCCEYp2IW8a2nRSffh9u4BAX1trJ2Z3o
 OxsJkDR/APiAIzJ3+XXRp4Qqfh2FTfwtWEGX82v/ErhzrLoDAKwb5OAo8
 JR9VBYDAfjzsUCW+Bj02aAZdTTCTsxhhIXAYjcQTxhXAAyWmzdfmIuRGw
 xL9LvH9aHkFYZurd8jHFN4S3TcxyOSbwf3G5sEgGU1bjXptCm4WSku1fb
 hCzoMlk/3YhBOQXA7+j6HKQ1r6qoDh+Tbe7jPnIfQ4J50jayRH9Onu+7U
 LVrcgw6OdRSkMZCHknvlZozQcG+t/DScJ86cgeifiEORSylTfSd8lzV/d Q==;
X-CSE-ConnectionGUID: YI2JnSsySt+HP4sXvWVz/Q==
X-CSE-MsgGUID: 7TxI/X+nRAuh/kWmShT/zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="71156727"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="71156727"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 00:38:30 -0800
X-CSE-ConnectionGUID: 9cvTTwAXQ5eowicdE96zYQ==
X-CSE-MsgGUID: V9uDZr5DRVObFaQqOXwlGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="209317572"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 00:38:28 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 00:38:28 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 00:38:28 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.39) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 00:38:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XQLci23qNkv9tEmh17SZxNeMr3MBZppi/+ENkG6a4NWBhU4S9kH7oJ89eRRnNG8GXINfHPSHwH6C8ZLzgAB5c8KjxOIztxHRkCBK1vI/QkmLfPjvRMC+KJwRuvXPzPQ4ZZku3xJ9auhbCsVUIUX5sHxcaOCUj4WyxUxiGLFrGTYnK9t9hxPTGdOil8jUKdbDcQevlSKlsVYiRbfxnR4mmvvnoDD0Bnuqr4Ihx0/XWgIwqyAE4uk46pGaNg4LfQdZLxgrLSd5qWTYWq+riyl4mJ+ayp2+gXB2Nyb4dRKNf52emvVU6LBbJYYw/AwUcCjsB78ozhK+3ond/6lvznb0tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XOmgDR8sscsZzvUFIEC8/h6YnJbCV+SDP9mnYKUxuZc=;
 b=oax48Yb506ZHfpM3LTkM+tqRJRIHAfTQUAtQCuZ/4/jT47tZg6Ga3Jd1sdeQ1lZFCif3gYvQSjslk9QzMLzuaSnmhuBrD9BpnJKRB6f1ZtGnjSDlsA184gaYcoeVRbp16/UEaqZ95PrjKfwFml+dfGAB3tcJM5/toPMhpCZ9A/yp7rxZN7uXEgxjgXwvuWQj+XF7MGd2p/x5EMmfvez/etOOFtfdw0nvfpa/mo8AZfmZPMBRGqPsurWYHxvOjaz1xSMk0qIMsHvJ8E5fTfh2RWdemzWRkFlkJjEzIafvVp2s29nMTXZmkFgfXseVOABqlvco02TpU92cXVMr6BKjGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CY8PR11MB7313.namprd11.prod.outlook.com (2603:10b6:930:9c::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.16; Mon, 2 Feb 2026 08:38:25 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%3]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 08:38:25 +0000
Message-ID: <052efa8b-665b-454f-9329-74df8b534ca9@intel.com>
Date: Mon, 2 Feb 2026 14:08:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] drm/xe/xe_ras: Add support for Uncorrectable
 Core-Compute errors
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>
References: <20260122100613.3631582-10-riana.tauro@intel.com>
 <20260122100613.3631582-17-riana.tauro@intel.com>
 <b9c82350-c32f-4cd3-9d69-c9c7aa1a347a@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <b9c82350-c32f-4cd3-9d69-c9c7aa1a347a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0274.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::14) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CY8PR11MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aa6693f-c318-48c8-f9a0-08de62366e48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3pUa05uUWxEeGZYMjRjcDJaYmp0QmVpd2lCb2lzMEIzc1BMNVhsamtTSXBn?=
 =?utf-8?B?NHhZaWhXY0NXcG9UNk96em9ab1BGenZNWWk4MU4veXljVjV2eitBclV5SDlk?=
 =?utf-8?B?YlM0cmZDR3UwaytaVjZRWEx2V0dITjJabXpEa1BGS0FMYUVYaXdzNWxTeFJC?=
 =?utf-8?B?aTRPNUFDMkhnUDk0OW4wdHVmcCs3QTU4Zy93RSt1UmJsWHJqdTNGbzVhVUo4?=
 =?utf-8?B?L1dJNDR2cTJFdnZXQTRYQ204cWh4U2xtNEsvbHZFaG5pUTdGejlMYzVnaVZh?=
 =?utf-8?B?L25IRWhOd1d3bVZiTmhoNTNmeEdSWVR4bXJoY1V5SlEvT2Y0NXhabjVNYlZK?=
 =?utf-8?B?RHpMVE0yQ0J1TWlvMjlTZVBndXBsaTFnOUc3bUZjWUw0a1FsY0JudzVMNWYx?=
 =?utf-8?B?TmlLWUgvTWNqVkxsV1FuSThQRXo2NEh4V2xPaHlMYlRGT0lkTlFlQ0orOFNj?=
 =?utf-8?B?QzlmSTgvNzcrWjRjcTRrQnFRMUlHdnVoVFhPbHhhaXBRajVxVWxrUG1wcVBs?=
 =?utf-8?B?QVQwSW1mL2RHdnFRdUJuUS96QlVabEY5L0tmUS8rd1ZCOW5VRWlJWFByclBj?=
 =?utf-8?B?dGxXeEh1ZVVoQTNXYlJpejZ2Y3lrWkh5aVNpQzB6WUJ2ZFZnSUhIRldaSFND?=
 =?utf-8?B?b0VQVVJTcUJ0RlhOZXBkdkVWYUF3NnZWcURsTEF3Sko0R2tzbEt4RzBoQVJu?=
 =?utf-8?B?MlN6SlEvaVNoeXBVN21hcVl0Y3FBN1p0aFNzU1VTYnI1ZUZHdm1tTGVSQXBo?=
 =?utf-8?B?TGJPUmZPQzBoQ2hLVVM4M2RQVXVmWWhCaW5QUWEveThqK21Wd09LL3ZieEN3?=
 =?utf-8?B?TlpGR0JURlZUSjkwNnVSNzlyTFhBaXBKcHoxeU5lV1NldGg3bFcxUk54cFkw?=
 =?utf-8?B?YWtObDJrcFFVU1l0MXo5K2w2TmdaeGhmSFdNMmZybFpVcHI2R3hIMVZpMjUz?=
 =?utf-8?B?UjBkbEVTQ1BTNlQ2ejlLSjMvOVZZend2bk1iN1RFREREZ3R4eXB5NEdrNEVx?=
 =?utf-8?B?ckYzQTRORVhNL0tNdU8wQ3BTdTBsMTNPaHNSV1huZTB5TGw4ZXgvdmFnOElG?=
 =?utf-8?B?T1RPc1d5Y1c2RW1sV3ZUdTJybCtqdFR0NVZkZEhEM3NCaWZyYXJ2Wnd2aERl?=
 =?utf-8?B?Y1cxczYzeW03dXlMcDVEbFdxaUU0UXprWGFiNFhIUFE4YmlMWGk0eGFTUm1i?=
 =?utf-8?B?ODIyMG9XU3c1bzNhS2dVa2VvOUkwSmY3RlZzS2ZyalFlRGxaN1Fod3ZPSUk3?=
 =?utf-8?B?RnNFM2QzaWYwbXJBbGtUc2RIZkM4YmlSSkcrMi9vcVN0c2FBd3RxVjF3RDc0?=
 =?utf-8?B?WjFpdXNsY1J4Q3B3eS9MMTZ3MkQ1Q1RLSXdNM3R4M0RyN1dyU3FVdWlPdlRa?=
 =?utf-8?B?VE5UcmpSeWxLRnJ2cEtSZ1ozb3orMmpaSTNkVHcvL3ZSMEw1T2lnRlo4OGw1?=
 =?utf-8?B?NFlVdC8wWnl6SDdCRFAwNG91U2puT1dGeUtQVGs0OE54Z2g2eUJvdW5mT2RE?=
 =?utf-8?B?dFgveS9LWUE5K0duNzhIdTFRaWYyVmtiblhCQk9WWjBlTkhySHBVaUlnZzFP?=
 =?utf-8?B?S3dXZ20yN2ZiRnh2V2M5U042MEVoMjRqTTlZcDZjR0ZLQ1VhQ3RxV3VDcXJt?=
 =?utf-8?B?UnNYK2RYS0lNUm9VRCtlYUxCNHVsOGdNNGZ0djhRVEE2SDN2Wk9vU3Q4T09t?=
 =?utf-8?B?cmhRdStCeGJsZkVtdFMvWkJWZ2k5azdveFFtNURKeVN5eitYWFY5VUloajFP?=
 =?utf-8?B?V29RMEYzZWtLTkMyTFVzQXM0N1lDU2EvbVl3TlFqMnY1ZkpRcWtUR2V0eHR6?=
 =?utf-8?B?dlBvZ3pWUThxOU1yNFNhUmdZVFpRVk9vZ09WekRNeVJYL2FSMHc0RjNjSHVO?=
 =?utf-8?B?RkVyOGprUDR3TU9aTG5qNjUvWFFSQS8yQnRHRlMyd3ZzaTlCZkNTRHFMU3VH?=
 =?utf-8?B?eUF0cUJxeE96SVJ4SjdETzEwTU1DeGJ0UmtxYXBLNjFDUmtiRVY4UGN1Wkk0?=
 =?utf-8?B?aUIrZDgrNk84RTEyRTZVVDdpcDlzbzhVblBTMlk2SjUwSXBnQWpoc3J0Z0lL?=
 =?utf-8?B?SVlOTDRrOXdVV2s4Rm1oNzViTUVQMXNGc1N4VDN4ZWhxSklXTUJmalRGVGxq?=
 =?utf-8?Q?em3o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkJOdkt4RnA1Z1lKMXpjZysxMGRZNVBrclZVdkYxT3NRb3hiWUlJbE9FZGdQ?=
 =?utf-8?B?MnZFeHlvVW9tZ2RQYWFJYTY3cWpxSDFveERpcW91NmZINzVOalg0cVNWTGQ0?=
 =?utf-8?B?M042M2FiQmFjM21BakVBSlIydmJBK0NMK1ZDWUwrVmxEQTk3RlpMWk5PWHN1?=
 =?utf-8?B?bjY0c1k5QjJiT3gzUkRsdVRUL3AwUk55WDBkOXVqQmlXRS8ydFFkNi9DMWc1?=
 =?utf-8?B?Tnh4aVZ1QWFiSzdHcGQxMzA2Z3NOSlFFQjJ3ZjhSbHhFY3NlRTJVczhXejBX?=
 =?utf-8?B?WWxGeUtHdk1Ib1BBWmlzT2owcXJVSnorWUJMbXNieS9zb1c0MHJSczNQYXJ4?=
 =?utf-8?B?ZU05bWx4aG0xM3VyWGZpV282SWRJS0l3MGJ3WUV6c3ppQkJVZXVlS0ZKOGlm?=
 =?utf-8?B?TjJXT2xjUCtqRytJVTN1eVlhNFZPNnI4a0xlK2pLa1VHYUZncDFiZ0xIY2pp?=
 =?utf-8?B?VDVsMFU4MFYrSjcxd3VhZmgxeHJnR1BYYUdGeHJaZ3J6ZFAxd2cvZjRMMk5E?=
 =?utf-8?B?SHNWM2xROU5OZm5LNEg1b3gwczJFallpTEZmMkI2TWhvemsvYXhVbnJuUERL?=
 =?utf-8?B?ZEtJbFlkV05yekFMcW5INjNlM3QwRUpWVGNzVDFpWmlkZU5pbDNVODN0dzRk?=
 =?utf-8?B?QWQxbDVhbGtmSlhlRUs4bTlGdGpaZE5BSEtwY21sZnRHQS9DWGovTnpQR3Fx?=
 =?utf-8?B?K3NTNU5hNHM1WTVZQWRnZlljQnRUck9QQ1FlOWVvd1pGUitzdzJKeWdZcGhT?=
 =?utf-8?B?eG5TczBHaXN0ZnZWSWc3aUdaZlgwZGJFNzJ1OEZYT1duSm1NMjY5Z293aStr?=
 =?utf-8?B?bkZiRzNRZjRCSklMVnFEc2syMUlvWjNhMUQyWndGUXczQTduWVQ5c0pRTGZv?=
 =?utf-8?B?YStoenNBZ3ZoS0YxQnkxVWNDWnFnMVczVTRQZkFDVDFvWjhmczlHMk1sTkNo?=
 =?utf-8?B?WVV0YUYvQUE4Q1d5QlNieXREdFhaQWNwZ2diV3RvVE1xSWJaQVVkd3BvOHds?=
 =?utf-8?B?UDZOK0QrYzVLTkQrN1ZtUG5Oc0dxWE5mdUVpdVRGSEpMYzY2TmlMUm5OUlZy?=
 =?utf-8?B?c2lCeExLZFFhQ3FWaWdZNnBkMDIwQ3Qvay9EN0haM2sxZ2V6UnVzU3Z5TTlh?=
 =?utf-8?B?ZHFlSFR2M1dPSmhOQzBhd0pVRGJJK1AwcG85dDhORlJVcjY1cGVBR2xqWGVN?=
 =?utf-8?B?SXNHNklmNDgvNFdzUjJQNnRKUGRua3c0UlVvSlRMOU4yR096Q0VmQVhEampv?=
 =?utf-8?B?WDFibmNjY1hpbWlRNFN0REtESDMxMnZFMnNZclZRd2hpUmY0Z3BsZjR2V0F5?=
 =?utf-8?B?bmtialZHcURGbDl3QlVOMUVYSkMyeFRFTzFHUk5hekl1U212dnNyK3hkankr?=
 =?utf-8?B?Um43d0JlZ2hWTGhkN0VqSGV5dDJ2M1BlQUQzMG5iQlFrTlVOV0VzYmN3K3Yr?=
 =?utf-8?B?R0VjeXZCVWtTSTU2QlpyVitMNzJVMVBSOTBBakJ4OW9UZzU0dXlHcmtVMGpr?=
 =?utf-8?B?b0JoWG1veXhNK1Axd0xLUlRiamZGQ0IvdGdaSjhZQjBRN3F6UzYreERkZDV0?=
 =?utf-8?B?Y1JPQzJ5ZVphWkNWREVMN1FDVnRtamVPN0E1TysxVytnVDRmMEplUHZ3QXQx?=
 =?utf-8?B?bXJvWi9BQVJrTU1MbmlDZ3kvK2Q0VU41aXFnVWFNMTNpNVFVZzRjNUU4N0dS?=
 =?utf-8?B?SFk0bVVEMVM4SUxJNUYrVkhTMnUzTnpqTnpSUTIyVkc3S0lWQ2JMY29mN1dP?=
 =?utf-8?B?WlhjcHljT01qaGtsYVRya2JOVCtGV01IRXh3elBiU0JFN1ZBRTIyZVhzcXZy?=
 =?utf-8?B?Z1R4VjVNYkNLQ3hkTUNKdWxNZ0VMVkdicm0wSUlyYlh0NHF3SUMra0ZNOEZ0?=
 =?utf-8?B?VlhJbG1hbEFUdmRuUlVkUHN4Q1E1enBUUDhwcHZ0Q2dFQjI0SS9UTjVhWlMz?=
 =?utf-8?B?RWFTc2tiUnMxRjJFck1IdEZOajArWW05M1Z3dmVPNDZ1UFpRRnFtdEM1b2tm?=
 =?utf-8?B?bnhLelJFeGRYdzBwRGhLdHJDU0crOG4wYVJDNklJTWlTN2FlZzB2NnFoQWxU?=
 =?utf-8?B?dldzeUpBVFlJY1pwZmZKYlZVUkM5UXZER21QNVQreHdrSFVQeUFzVmdqM1ly?=
 =?utf-8?B?djFhRVNYeDNWZkp4THlMZTNYcHpvY2F1MzV0L1MxRUkzalY1YVBmYzU3OUg5?=
 =?utf-8?B?dmc5azJuZlpmNGFpSGNPSEpGbG9SSmxUUHl4VnQ0UjdEeENta0gzTW9FVjVB?=
 =?utf-8?B?a1FBcUNrSGZBZlhUVkNwdzVvNWNHamtJcDNOamdDUTRYc2lmTzJ0NVVkL243?=
 =?utf-8?B?YUxiOUExeXN0SVFBYWlyaDFOcXppN2VsZTUwTHBka3F5ZWo2T2wxUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aa6693f-c318-48c8-f9a0-08de62366e48
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 08:38:25.5692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1VLulMmK2WGWus9ubBlw6HgH3023N3JCZRMvQL9hdPtSCz4X2jljLrCQAZXVjMuP788RvNgst3CY0+u070FBzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7313
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



On 1/27/2026 5:14 PM, Mallesh, Koujalagi wrote:
> Hi Riana,
> 
> On 22-01-2026 03:36 pm, Riana Tauro wrote:
>> Uncorrectable Core-Compute errors are classified into Global and Local
>> errors.
>>
>> Global error is an error that affects the entire device requiring a
>> reset. This type of error is not isolated. When an AER is reported and
>> error_detected is invoked return PCI_ERS_RESULT_NEED_RESET.
>>
>> A Local error is confined to a specific component or context like a
>> engine. These errors can be contained and recovered by resetting
>> only the affected part without distrupting the rest of the device.
>>
>> Upon detection of an Uncorrectable Local Core-Compute error, an AER is
>> generated and GuC is notified of the error. The KMD then sets
>> the context as non-runnable and initiates an engine reset.
>> (TODO: GuC <->KMD communication for the error).
>> Since the error is contained and recovered, PCI error handling
>> callback returns PCI_ERS_RESULT_RECOVERED.
>>
>> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c | 109 +++++++++++++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_ras.h |   3 +
>>   2 files changed, 110 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index ace08d8d8d46..2a98cb116dc7 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -2,11 +2,16 @@
>>   /*
>>    * Copyright © 2026 Intel Corporation
>>    */
>> -#include <linux/pci.h>
>> -
>>   #include "xe_assert.h"
>>   #include "xe_device_types.h"
>> +#include "xe_printk.h"
>>   #include "xe_ras.h"
>> +#include "xe_ras_types.h"
>> +#include "xe_sysctrl_mailbox.h"
>> +#include "xe_sysctrl_mailbox_types.h"
>> +
>> +#define COMPUTE_ERROR_SEVERITY_MASK        GENMASK(26, 25)
>> +#define GLOBAL_UNCORR_ERROR            2
>>   /* Severity classification of detected errors */
>>   enum xe_ras_severity {
>> @@ -60,6 +65,106 @@ static inline const char *comp_to_str(struct 
>> xe_device *xe, u32 comp)
>>       return xe_ras_components[comp];
>>   }
>> +static void log_ras_error(struct xe_device *xe, struct 
>> xe_ras_error_class *error_class)
>> +{
>> +    struct xe_ras_error_common common_info = error_class->common;
>> +    struct xe_ras_error_product product_info = error_class->product;
>> +    u8 tile = product_info.unit.tile;
>> +    u32 instance = product_info.unit.instance;
>> +    u32 cause = product_info.error_cause.cause;
>> +
>> +    xe_err(xe, "[RAS]: Tile%u, Instance %u, %s %s Error detected 
>> Cause: 0x%x",
>> +           tile, instance, severity_to_str(xe, common_info.severity),
>> +           comp_to_str(xe, common_info.component), cause);
>> +}
>> +
>> +static pci_ers_result_t handle_compute_errors(struct xe_device *xe, 
>> struct xe_ras_error_array *arr)
>> +{
>> +    struct xe_ras_compute_error *error_info = (struct 
>> xe_ras_compute_error *)arr->error_details;
>> +    u8 uncorr_type;
>> +
>> +    uncorr_type = FIELD_GET(COMPUTE_ERROR_SEVERITY_MASK, error_info- 
>> >error_log_header);
>> +    log_ras_error(xe, &arr->error_class);
>> +
>> +    xe_err(xe, "[RAS]: Core Compute Error: timestamp %llu Uncorrected 
>> error type %u\n",
>> +           arr->timestamp, uncorr_type);
>> +
>> +    /* Request a RESET if error is global */
>> +    if (uncorr_type == GLOBAL_UNCORR_ERROR)
>> +        return PCI_ERS_RESULT_NEED_RESET;
>> +
>> +    /* Local errors are recovered using a engine reset */
>> +    return PCI_ERS_RESULT_RECOVERED;
>> +}
>> +
>> +/**
>> + * xe_ras_process_errors - Process and contain hardware errors
>> + * @xe: xe device instance
>> + *
>> + * Get error details from system controller and return recovery
>> + * method. Called only from PCI error handling.
>> + *
>> + * Returns: PCI_ERS_RESULT_RECOVERED if recovered or if no recovery 
>> needed,
>> + * PCI_ERS_RESULT_NEED_RESET otherwise.
>> + */
>> +pci_ers_result_t xe_ras_process_errors(struct xe_device *xe)
>> +{
>> +    struct xe_sysctrl_mailbox_command command = {0};
>> +    struct xe_sysctrl_mailbox_app_msg_hdr msg_hdr = {0};
>> +    struct xe_ras_get_error_response response;
>> +    u32 req_hdr;
>> +    size_t rlen;
>> +    int ret;
>> +
>> +    if (!xe->info.has_sysctrl)
>> +        return PCI_ERS_RESULT_NEED_RESET;
>> +
>> +    req_hdr = FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
>> +          FIELD_PREP(APP_HDR_COMMAND_MASK, 
>> XE_SYSCTRL_CMD_GET_SOC_ERROR);
>> +
>> +    msg_hdr.data = req_hdr;
>> +    command.header = msg_hdr;
>> +    command.data_out = &response;
>> +    command.data_out_len = sizeof(response);
>> +
>> +    do {
>> +        memset(&response, 0, sizeof(response));
>> +        rlen = 0;
>> +
>> +        ret = xe_sysctrl_send_command(xe, &command, &rlen);
>> +        if (ret || !rlen) {
>> +            xe_err(xe, "[RAS]: Sysctrl error ret %d\n", ret);
>> +            goto err;
>> +        }
>> +
>> +        if (rlen != sizeof(response)) {
>> +            xe_err(xe, "[RAS]: Sysctrl response does not match len!! 
>> \n");
>> +            goto err;
>> +        }
>> +
> 
>   Array bound check is required for response.num_errors. if num_errors 
> are more than 3 then potentials security issue (accessing uninitialized 
> or arbitrary memory).

yeah agree. Will fix this in next revision

Thanks
Riana

> 
> Thanks,
> 
> -/Mallesh
> 
>> +        for (int i = 0; i < response.num_errors; i++) {
>> +            struct xe_ras_error_array arr = response.error_arr[i];
>> +            struct xe_ras_error_class error_class;
>> +            u8 component;
>> +
>> +            error_class = arr.error_class;
>> +            component = error_class.common.component;
>> +
>> +            if (component == XE_RAS_COMPONENT_CORE_COMPUTE) {
>> +                ret = handle_compute_errors(xe, &arr);
>> +                if (ret == PCI_ERS_RESULT_NEED_RESET)
>> +                    goto err;
>> +            }
>> +        }
>> +
>> +    } while (response.additional_errors);
>> +
>> +    return PCI_ERS_RESULT_RECOVERED;
>> +
>> +err:
>> +    return PCI_ERS_RESULT_NEED_RESET;
>> +}
>> +
>>   #ifdef CONFIG_PCIEAER
>>   static void unmask_and_downgrade_internal_error(struct xe_device *xe)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>> index 14cb973603e7..28400613c9a9 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.h
>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>> @@ -6,8 +6,11 @@
>>   #ifndef _XE_RAS_H_
>>   #define _XE_RAS_H_
>> +#include <linux/pci.h>
>> +
>>   struct xe_device;
>>   void xe_ras_init(struct xe_device *xe);
>> +pci_ers_result_t xe_ras_process_errors(struct xe_device *xe);
>>   #endif

