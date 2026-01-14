Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0A2D39013
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 21:10:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A2D10E1C8;
	Wed, 14 Jan 2026 21:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GhBgZ6Z0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E08A10E1C8
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 21:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768425036; x=1799961036;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=c7w28uce3ztHWOzklLlVtiNPMKobERXcrZ9GiCmC8fY=;
 b=GhBgZ6Z0wx9/RSTw2ohwRL7WZa59X4yzx3+V8RUDsbPaw9ByIahQz/QD
 4B7ok2za6LrrWjnGZhSfJhlsh7xZqLxZYO/6tLcGkj4vmaV/X7cVe0jNx
 MnbOiHktmEG5ctx/NfNJuL/eWc9tav1gOvntZiqniUHdD/+EcFFQ3vhcY
 3HgWdEnGPN4WQ6jBK6Zkv3EaN1oDzhEhAICVwIY5r41a192/WBVAg7jl8
 PnvYHuAi/ObzgaSbAS0GDtRRVg676NnzNncl8wyPCcvRd3kOnX2rKrBpi
 SspcNdCOCZ41di8sxvFE8VmTcQT6IQJZoH41u+UAuYjZXsAkIiXCMmrX7 g==;
X-CSE-ConnectionGUID: bV5pg4ihQ2SYYzCapL86Fg==
X-CSE-MsgGUID: k9Jt7oH6TMK/6O8/yFqfZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="57286619"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="57286619"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 13:10:35 -0800
X-CSE-ConnectionGUID: C6H9TXmxRNG7KxEF/tq78Q==
X-CSE-MsgGUID: Ni/BGwWdQlyqpvJAi8LHPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="204829122"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 13:10:35 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 13:10:34 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 13:10:34 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.70) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 13:10:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n4Rb/FPQahkc832/aaTZz5YUARnbQkf6xH7Qzk0a0mlX3MLrTshwXP2G2kwFfRuIL/bd3WxwjpJrB9hr8kByoeR4SmO3U3kKsV5DQnEq8byo43+DToxP16fb4FskHXc9dRNQkIKl2ahLdJUWMZdi06H/bOGpyY0m8FcZyzqWqhV3qD7gbv9ASs/kf33ABkYDUauOXK8Rq9fBnfm0jV5ZfZLQwj987JwN1tGL0UKl8kRL1N86pfipBEayO/KBbufpyAx3ArpCECDi6hWFNdYZr0kLMzBkZesXA8A3yKtbRIvkFcxgdMj+AHBuZWPGTaSfBEnJ2K4HrQQd865dONHrzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7w28uce3ztHWOzklLlVtiNPMKobERXcrZ9GiCmC8fY=;
 b=a872RD1XL2yu99/wbbdPfoMcTHNEGpXBue5Fm2Og5g9PCN9BBJmHOHiOwCJvboJOl1t8sfaxJEVb3/DtmJV3XO/0Yf5cURewdszXs3zQ99EqUxmMtBMlJyWdH9DuHobiyXgCM5B+X4U9QdZaKQpzeVe24MIxYKaWttw6R4DiBr1xd5UKskq/dl9u6+pHJFR2M1ktmOWswIq4N57zMG6U4kE5Buioz4jgh5/s5dR6sJWSwg3sDdG9yRIHF3w0gL0o/P9hcFmw17Pqp3SvzjLi4gtSSOgFAeduP3DzjYQkO9PKlJF0TLy4GKhTYtcA1PAa7hn9xgLoYygXNoY2lE1AaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH7PR11MB6746.namprd11.prod.outlook.com (2603:10b6:510:1b4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 21:10:29 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 21:10:29 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH] drm/xe: Reduce LRC timestamp stuck message on VFs to
 notice
Thread-Topic: [PATCH] drm/xe: Reduce LRC timestamp stuck message on VFs to
 notice
Thread-Index: AQHchYaDrxfUY7xpfUmEiw6yUbS/OLVSHOkAgAADcACAAAFmAIAABuOAgAAAs4A=
Date: Wed, 14 Jan 2026 21:10:29 +0000
Message-ID: <4e915c370dfda68d31e80813963811803b1ccf96.camel@intel.com>
References: <20260114184905.4189026-1-matthew.brost@intel.com>
 <cf8ccdcfa6e3e22b0979d88f6eeea5f2cf4e4a2b.camel@intel.com>
 <aWf+tGpSKfxmaQ+g@lstrano-desk.jf.intel.com>
 <563ccee86f66c06aa0eebc9430b06641eff36857.camel@intel.com>
 <aWgFp0N3XQ0Vk75I@lstrano-desk.jf.intel.com>
In-Reply-To: <aWgFp0N3XQ0Vk75I@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH7PR11MB6746:EE_
x-ms-office365-filtering-correlation-id: 65872f9c-ba98-4a7d-b515-08de53b158cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?U2xIb1pBcVhpWWNNcVhLQlZ5Q0RuSytVbFE2Q0M1Q0JNM1dVTDRKSnk4TUJW?=
 =?utf-8?B?eVUveHFmL2JCZ1hPaXYwN3JFaWczY25uays5WnB1cWt2WVdOeW1BZW8vYkQx?=
 =?utf-8?B?MFdQWThac1BERFB1RTNVS0NhM2Y2dDVSVTBMUmhacEROdVVycGVCLytSYmQ0?=
 =?utf-8?B?cXh0NDlqSGYzWjErRHJISlFPMzN0bVZJbFZOK2kxZXB6NW0rQmxKMFdjbXZL?=
 =?utf-8?B?MHBLblNvZzdSWmZLZVZIMkpEak1WUEtqeXZDUlZzd2pTM1hqaS8vWTNLZSs1?=
 =?utf-8?B?WDdKd1kxV1RPUm5GdVlJdVlFZUsvOHdoelBlOG85Y0NMcWVpTHh0M1oyU0NL?=
 =?utf-8?B?Z080WHc3UzdRS3BVYU1JMTJMRkU0KzRJWHVienZTcjYyLzVXNXlSZFhBb1hn?=
 =?utf-8?B?cmxnUEN5ZlN6KytIQnNaMmpkd3p1UGNLMit3SXdteDc5UnFCZnhBditnZXBw?=
 =?utf-8?B?elBhQjg5dmt1QzNVZVh3TWhOR3BuOGZ0c2NudTI3eDcvQnFDeUJQK1NiSUNx?=
 =?utf-8?B?OXh4MVcyZ0Q3R3F3OE1kSko4MmZYOGVxQTFqZDZKSG9Mcmp2SCt6R0kwd0FN?=
 =?utf-8?B?dUVDNVN5dVBzWWhXL1pnTEtVRjdwT1pucWNnNkJiRmU4UWJEMTBDcy83N0VQ?=
 =?utf-8?B?dzI4THBlNWVkY2RmVzJpN29rKzRTSzdITVBhNHhCUXd3UHlZcU45cS9rdHJr?=
 =?utf-8?B?aWZ0NDg0Z25od2xMRlk2dmpadjV2UExiN29Kb2ZKU0xNTjlaMjAzTWJoemxa?=
 =?utf-8?B?VnhzdjVydlhPcXJOUHBUOVZwT3FDdnp0NXdoVEE4VTBZeVdFVTBmTDRZWkJs?=
 =?utf-8?B?VjJnTHdUcGFlTTV1N0RQQ0Z5MTZ0dGhiNXpBeDN0cTZ4blR4U2pJTWt4WEU4?=
 =?utf-8?B?TU1vY0Q0Q3d6dVBkQVYrYW53U3VEMEVMZmxOaE9vaFFtZWJ1R0g4K2pmR216?=
 =?utf-8?B?MmFRTTVOWUY1L2VMMXJxd1cvbGJPNzNieVl6dEFrSkpxMXBIaWorcGlrOEZB?=
 =?utf-8?B?bk1mRU1zWnVuOG94MVpoa2xSenlKT2xmaUFRN3NQZllDcHlWeGxhQlg4OUxq?=
 =?utf-8?B?VzJKZzl2M2tzdzVLUTRLbU95UTlQY3lYOTNMcTFXVDVBcGp0U1RzeTRTdXpo?=
 =?utf-8?B?T1RjQVpoZHQzdEZnaHNyeHRQbzV4bDIvTVVJRHlNR3JJWEd2M1lpSVBQWlFW?=
 =?utf-8?B?OTM1S3dDYWtTcm9vS0t4ZnA0Qm91dnY5dFNwQjJFMGZzZXg3ZkhPNGhDN1pp?=
 =?utf-8?B?cjB6ZG4xKyttNnh1SXZudElhQTdyVUZpa3c0cG84ZGNPdnJwWFpyZmpWcjEr?=
 =?utf-8?B?NEdjekgrMmtnL1Z6U3E1SUZ2dk5WTXdPMy9FdGpub1V2Z01MUTEzeGJkVkhI?=
 =?utf-8?B?MDhiTEZlRzJtN2p3eThBRWFZWVhERmNsZHZMNG5HaytWdWo2dVh2NC9FblNY?=
 =?utf-8?B?Rm14dU5abHIvNU5TbHdXTWtPRFNFMkFUOWVYdzF0YThTQ0o0MWIybEJZWHNp?=
 =?utf-8?B?MHEvOHNIQ2dGcFplb251cW5lMTRJN255SmdabDRXV1Q2VmZjQytraDFkUXht?=
 =?utf-8?B?THE3bUN3VTNZRSttbVk1RTZjU3NNRG80VWNMU2FxQ0RYTWZNbFhZWUNEWmps?=
 =?utf-8?B?aGNrTTBreTZkeFRCaFhhSWxkN0VmUVpZOFF1VVFVRFYxVGY0QXlja2F4Zzdy?=
 =?utf-8?B?N1JNWUIvUXUzamo0ZVFBdkRSL2M2YkVsTU41cGV3amJVeGNBd2hiRm5tVVJY?=
 =?utf-8?B?VGxCVDFjRDZadlhUV0JaaWE3WTJ2Tk9seVF0NEJDRTRDUUwvWkdaa0NQVmxH?=
 =?utf-8?B?WkI0eHlLYzRKanFpenE3UXd6RCt4RUlGQ3ExeEFJMTFYMjg2cS9YMnRibWNs?=
 =?utf-8?B?eDBxRCtZSW44MlFBR0RldnJ4RXNHTzJxOGF4T2N3SHZMTlhJMnJSOVZYYWww?=
 =?utf-8?B?Q1Q3RUN6dkw2ZlFzM3lkejJCazhhWEVXSDBpMGlaY1RXaGwvQ3BXVm1XZytC?=
 =?utf-8?B?Nys3UEJmWUQ2V2NULzc1eUZRUVRIVFNNT1BGYkpid05Uc1pHL1VickZoWlFW?=
 =?utf-8?B?WXhtRmNteFp0UFpWbVgyRXBUSEViYjZpN0ZXV1dib0JRaDNDUnVTVm9tdWtD?=
 =?utf-8?Q?DICKzVnkJ+nHP/cFgt9FTCetk?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dkhpajI0TzlOalViL0RCWWVpN3hiQnAycWV1Uy94L0NRY0ZySmNZenFCYWNa?=
 =?utf-8?B?ZEg5K2VXMDZ5VEtDbE1JcjI5QWgxWU9KSHl3aDlubUxaOGxVUFVsK0xlbGFy?=
 =?utf-8?B?NEczdENPeUZvYW9jc1BseWxVUlUrUHBvK0JTb2R1MXFXR2c5Ny94dU96SjFE?=
 =?utf-8?B?OTE0UzVud2NrMzRpamlSWVdFM2VWdHBacWdJNURLS0RHU3JBdXN6dXo2YnVY?=
 =?utf-8?B?ZS90d1V0aGFZR0YxaUpCTGo5cXl6MWtiYWxsRHdsQTRyYjZLNmdWRENQMmRY?=
 =?utf-8?B?djBDWk40ZXRkZng0RCt0alpWWlBQZVpZUHU3WWJSSGR0RGFPeGJHNjJXc2kv?=
 =?utf-8?B?VU45MDduazhLdmZ0a3ZjUlJOaXZpQWg2dDhlaGkvSzRMMk51R1IvV3Uwc3h3?=
 =?utf-8?B?enJuQ3FsdlMyVnFEVFd0ZUNvRDJESkQ4SWQrUHNKdkw5R3QrRjZscVFsNGZM?=
 =?utf-8?B?eDJwYm1sU2RNaXVnTm41Tk1oaDZMN0YvN1BUMlZhQWkzMEQ3eGJ2ZGFCK1VQ?=
 =?utf-8?B?b1Z6WTNQZWJZb2NPTlVGczF0YWdDZC9CcHd4SFhsKzU3eWoveEhmaE9OYUtF?=
 =?utf-8?B?RmdNeVVBcTNJYmdINmpmUTFFUnZWbG9SVzIwNG5CQ25MdURJRmdKcmhMb2RS?=
 =?utf-8?B?V25FSW1TVXhIZTU1WHRkbWtPNzd0MTFNUVZmUS8vZ1RmeGpNeDhIS2RKSnQr?=
 =?utf-8?B?SXJzTFFQcTBiQzZOWm9jTHJlWXJPaDRwYVVXaW1ZVThIMWwvNGR5WWdNYXU0?=
 =?utf-8?B?YU5yYldPRjAxNU02OFJyMVBxRWV1MlJhZHBxRTQyUGJEdXhxbnRvQjgvREpT?=
 =?utf-8?B?Q2lMQjNTc2orZ2dDRFZnTm1TY1UzU3ZHdExKdEs3MzdzcW1uL0NNdTg3TVRP?=
 =?utf-8?B?ekVKU1k5QkdpNWI3VEw1Wk1Pd3l3YnB3M2tKMnFhV2ZUYVZSQzdibHdxWFVv?=
 =?utf-8?B?djJEZHNEVE9BZmhxVDU5ekJac1dTMmYyeXlCb3BVa3UycTFXR3ZlMERaL2Fv?=
 =?utf-8?B?SlBkR01CS2lrY1kwUDdJYjRlWVkvNlJUeEoxdlpMUTJaRE45T1AzRWdNTGxU?=
 =?utf-8?B?R0F2VnRNNmpJK3c3V3FxMVBpbXQxaFhveXhsV1JIWHBZcXl2OE53OFNTakFr?=
 =?utf-8?B?bVdZRHcvbG54OERLbEI3ajYvRXdHSkxCM28wR2RFRmtpN0w3NlEreW9hc3FG?=
 =?utf-8?B?NTJNdXRvVlhYaGhMZVFOS3N0UXpwMUxBOWxQdVBKVFhsVkNIR1BnbHZjdmU5?=
 =?utf-8?B?U0dMV1phSnFDR3VOM3lCOE1jVnduNDdjQmJRRVdNdjh3blpma21DV2FaUE9x?=
 =?utf-8?B?TWtvWEF5YStKSDROOE1NWGNablhnZ0dxSHlPdDBuVE5qcHlEMlB5WGszVXF5?=
 =?utf-8?B?VEJ1Ump5eWVpaysrMFd1SUFUcElMN3pRcEl5NHFKK0JXTndIUTVTV3VqWWlj?=
 =?utf-8?B?amFaV2NSamhkOG45aS9xaDBkL3ArUVRMbmFYSW9kTUp4eXgzNURVVk8yTzIr?=
 =?utf-8?B?djFZdEpQbklTaTlyV0FBd2x3T20vT1lwSUFaay9TV0llcURhcFJ2YnVVZ0Ni?=
 =?utf-8?B?UFdPbHhXalZjRE9UMCtEYkF3bGxObUdNZXVvQW12YUV5VmRsaFdUdUFvTG5n?=
 =?utf-8?B?bVhwTnRUVXdaMXhmdGlsNFJjMWJEVUpkSlVSVS9uakRaWjZncUZuSFIzOUFF?=
 =?utf-8?B?RWE1WWdiVTlnZHliL0svZUhtUnpBUWJwZllPRmhVZlNnbFpVM1NDTFI5eEVY?=
 =?utf-8?B?T0l3MEttbnRsYzZCWnFwMXNneHZUeE4rdWRUT0J1azk4ODc3SkdDWXNDemNh?=
 =?utf-8?B?UnczQ0F2YzFYY0ljVXFEbjRlMXh2OGtubVYrejl5R0wxSW5JNmMxK1ZHc1Zh?=
 =?utf-8?B?Z0RVZGgwRVEzNXVnOEZVNnJNN2h3UlBOdzRGOXZ2ZVBod1BKTzlacXkyNkhq?=
 =?utf-8?B?N3Vkd1NHTC9jRU92ZVJNbXpHVHo3bTd4M1pTVS83bmhwcEFSeFowVjdGSmRW?=
 =?utf-8?B?WGZwWExqOGYrNGRpMlJ6TUZFOXdxdzFUd3VsMHFuRU5vOTAxMUxpMUdEODlH?=
 =?utf-8?B?WnlxZWdLY3QwOHVTUEZRdkxmV2JlMUd0TEN5WUNRRVd1eEZ2TTlZQVZTQS9V?=
 =?utf-8?B?c0ZPYjEzWlJ2TSs2UWNERWllSzA5N0FHbi9Rd1pJMi8wQkFYREFvbkZEanR6?=
 =?utf-8?B?clVmZ29TWHJRdlVwWER6MzUrOTlWN2ROdUVCZGJCOG9oR0xkVUI0Q3lOeGNz?=
 =?utf-8?B?WWZaTmd5ZlliRno2OXlQejB0dDczOGVOVStTdnBSTWJMRTJMQVJObkIzM0l5?=
 =?utf-8?B?dHJUMndvSnNvZVFZdnI1U0hQQ2FXOGU3ZzhCeGlxVWgxRFp2bFZsc1B2M1NN?=
 =?utf-8?Q?dZuYcn8ETlVKHi84=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <28F584BC4B357C42A77716C0DBA505CD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65872f9c-ba98-4a7d-b515-08de53b158cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2026 21:10:29.6395 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZeiI7Re2JdL/MSAOb/QCfF/YdJZDBu61VVANqn8S524hsHTOgBX6WkZl1ebAR+7Cztvp5E0tS9aIukewEb47MQx6mKezJuAdf0MyO36eHzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6746
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

T24gV2VkLCAyMDI2LTAxLTE0IGF0IDEzOjA3IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBXZWQsIEphbiAxNCwgMjAyNiBhdCAwMTo0MzoxNFBNIC0wNzAwLCBTdW1tZXJzLCBTdHVh
cnQgd3JvdGU6DQo+ID4gT24gV2VkLCAyMDI2LTAxLTE0IGF0IDEyOjM4IC0wODAwLCBNYXR0aGV3
IEJyb3N0IHdyb3RlOg0KPiA+ID4gT24gV2VkLCBKYW4gMTQsIDIwMjYgYXQgMDE6MjU6NTVQTSAt
MDcwMCwgU3VtbWVycywgU3R1YXJ0IHdyb3RlOg0KPiA+ID4gPiBPbiBXZWQsIDIwMjYtMDEtMTQg
YXQgMTA6NDkgLTA4MDAsIE1hdHRoZXcgQnJvc3Qgd3JvdGU6DQo+ID4gPiA+ID4gQW4gTFJDIHRp
bWVzdGFtcCBnZXR0aW5nIHN0dWNrIGlzIGEgc29tZXdoYXQgbm9ybWFsDQo+ID4gPiA+ID4gb2Nj
dXJyZW5jZS4NCj4gPiA+ID4gPiBJZiBhDQo+ID4gPiA+ID4gc2luZ2xlIFZGIHN1Ym1pdHMgYSBq
b2IgdGhhdCBkb2VzIG5vdCBnZXQgdGltZXNsaWNlZCwgdGhlIExSQw0KPiA+ID4gPiA+IHRpbWVz
dGFtcA0KPiA+ID4gPiA+IHdpbGwgbm90IGluY3JlbWVudC4gUmVkdWNlIHRoZSBMUkMgdGltZXN0
YW1wIHN0dWNrIG1lc3NhZ2Ugb24NCj4gPiA+ID4gPiBWRnMNCj4gPiA+ID4gPiB0bw0KPiA+ID4g
PiA+IG5vdGljZSAoc2FtZSBsb2cgbGV2ZWwgYXMgam9iIHRpbWVvdXQpIHRvIGF2b2lkIGZhbHNl
IENJIGJ1Z3MNCj4gPiA+ID4gPiBpbg0KPiA+ID4gPiA+IHRlc3RzDQo+ID4gPiA+ID4gd2hlcmUg
YSBWRiBzdWJtaXRzIGEgam9iIHRoYXQgZG9lcyBub3QgZ2V0IHRpbWVzbGljZWQuDQo+ID4gPiA+
IA0KPiA+ID4gPiBPayBhbmQgaWYgdGhpcyBoYXBwZW5zIGFuZCB0aGVyZSBpcyBhbiBhY3R1YWwg
cHJvYmxlbSwgdGhlDQo+ID4gPiA+IHF1ZXVlDQo+ID4gPiA+IHdpbGwNCj4gPiA+ID4gYmUgYmFu
bmVkIGl0IGxvb2tzIGxpa2UgZnJvbSB0aGUgZWFybGllciBwYXRjaCwgc28gc2hvdWxkIHN0aWxs
DQo+ID4gPiA+IGJlDQo+ID4gPiA+IG9rLiANCj4gPiA+ID4gDQo+ID4gPiA+IE15IG9ubHkgcXVl
c3Rpb24gaXMgd2h5IG5vdCBtb3ZlIGJvdGggY2FzZXMgKFZGIGFuZCBub24tVkYpIHRvDQo+ID4g
PiA+IG5vdGljZT8NCj4gPiA+IA0KPiA+ID4gVGhlIG5vbi1WRiBjYXNlIHRoZSBMUkMgdGltZXN0
YW1wIHNob3VsZCBhbHdheXMgYmUgbW92aW5nLCBpZiBpdA0KPiA+ID4gaXNuJ3QNCj4gPiA+IHNv
bWV0aGluZyBoYXMgYmFkbHkgZ29uZSB3cm9uZyBhbmQgQ0kgc2hvdWxkIG5vdGlmeSB1cyBvZiB0
aGUNCj4gPiA+IGVycm9yLg0KPiA+IA0KPiA+IE9rIGJ1dCBzaG91bGRuJ3QgdGhlIGpvYiB0aW1l
b3V0IGdlbmVyYWxseSBiZSB0aGUgc2FtZT8gKHNob3VsZCB3ZQ0KPiA+IGNoYW5nZSB0aGF0IHRp
bWVvdXQgdG8gd2Fybj8pDQo+ID4gDQo+IA0KPiBBIHRpbWVvdXQgbWVzc2FnZSBpcyBhdCBub3Rp
Y2UgbGV2ZWwuIENJIHVuZGVyc3RhbmRzIHRoYXQsIGJ1dCB0aGUNCj4gd2Fybg0KPiBsZXZlbCBo
ZXJlIGlzIHRyaWdnZXJpbmcgQ0kgZmFpbHVyZXMgb24gVkZzIHdoZXJlIHRoaXMgbWVzc2FnZSBp
cw0KPiBleHBlY3RlZCBpbiBhZGRpdGlvbiB0byB0aGUgdGltZW91dCBtZXNzYWdlLiBGb3Igbm9u
LVZGcywgd2UgZG8gbm90DQo+IGV4cGVjdCB0aGlzIG1lc3NhZ2UgZm9yIGpvYiB0aW1lb3V0cy4N
Cj4gDQo+ID4gQW5kIHNvcnJ5IGlmIHRoaXMgaXMgYSBiYXNpYyBxdWVzdGlvbi4uLiBidXQgd2h5
IGlzbid0IHRoYXQgdGhlDQo+ID4gY2FzZQ0KPiA+IGZvciBWRiB0b28/IEJlY2F1c2Ugb24gdGhl
IFZGIHNpZGUgd2UgYXJlIGlzc3VpbmcgcmVzZXRzIGFzIHBhcnQgb2YNCj4gPiB0aGUNCj4gDQo+
IFRoZSBhbGdvcml0aG0gdG8gYWNjdXJhdGVseSBzYW1wbGUgdGhlIExSQyB0aW1lc3RhbXAgcmVs
aWVzIG9uIGFjY2Vzcw0KPiB0bw0KPiB0aGUgZW5naW5lIE1NSU8gdGltZXN0YW1wLCB3aGljaCBh
IFZGIGRvZXMgbm90IGhhdmUuIEnigJltIHRvbGQgd2UgY2FuDQoNCk9oIHRoaXMgaXMgdGhlIHBp
ZWNlIEkgd2FzIG1pc3NpbmcgYW5kIG1ha2VzIHNlbnNlIG5vdy4gVGhhbmtzIGZvciB0aGUNCmV4
cGxhbmF0aW9uLiBBbmQgeWVhaCBubyBwcm9ibGVtIGFuZCBJIGFncmVlIHdpdGggdGhlIGNoYW5n
ZSBoZXJlLg0KDQpSZXZpZXdlZC1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGlu
dGVsLmNvbT4NCg0KPiBtYWtlIHNvbWUgY29uZmlndXJhdGlvbiBjaGFuZ2UgdG8gYWxsb3cgVkYg
YWNjZXNzIHRvIHRoaXMgcmVnaXN0ZXIg4oCUDQo+IEnigJlsbCBmb2xsb3cgdXAgb24gdGhhdCwg
YnV0IHVudGlsIHRoZW4sIGxldOKAmXMgbm90IGJyZWFrIENJLg0KPiANCj4gTWF0dA0KPiANCj4g
PiBzdWJtaXNzaW9uIGZsb3cgbm9ybWFsbHk/IE9yIGJlY2F1c2Ugd2Ugd2FudCB0byBtYWtlIHN1
cmUgdGhlDQo+ID4gcmVzZXRzDQo+ID4gZnJvbSBvbmUgVkYgYXJlIGhpZGRlbiBmcm9tIGFub3Ro
ZXIgVkY/DQo+ID4gDQo+ID4gVGhhbmtzLA0KPiA+IFN0dWFydA0KPiA+IA0KPiA+ID4gDQo+ID4g
PiBNYXR0DQo+ID4gPiANCj4gPiA+ID4gSXMgdGhlIGlkZWEgdGhhdCBpbiB0aGUgbm9uLVZGIGNh
c2UsIHRoZSByZXNldCBpcyBhbHJlYWR5IGFuDQo+ID4gPiA+IGVycm9yDQo+ID4gPiA+IGFuZA0K
PiA+ID4gPiBzbyB0aGUgZXh0cmEgd2FybiBpcyBvaz8gQnV0IGluIHRoYXQgY2FzZSBJJ2QgYWxy
ZWFkeSBleHBlY3QNCj4gPiA+ID4gc29tZQ0KPiA+ID4gPiBvdGhlcg0KPiA+ID4gPiBlcnJvciBt
ZXNzYWdlIHRvIHRyaWdnZXIgQ0kgKGxpa2UgdGhlIGVuZ2luZSByZXNldCBub3RpZmljYXRpb24N
Cj4gPiA+ID4gZnJvbQ0KPiA+ID4gPiBHdUMpLiBTbyB0aGUgZXh0cmEgaW5mb3JtYXRpb24gaGVy
ZSByZWFsbHkgaXNuJ3QgZG9pbmcgYSB3aG9sZQ0KPiA+ID4gPiBsb3QNCj4gPiA+ID4gbW9yZQ0K
PiA+ID4gPiBmcm9tIGEgd2FybmluZyBsZXZlbCAoQ0kgdHJpZ2dlcmluZykgcGVyc3BlY3RpdmUu
DQo+ID4gPiA+IA0KPiA+ID4gPiBUaGFua3MsDQo+ID4gPiA+IFN0dWFydA0KPiA+ID4gPiANCj4g
PiA+ID4gPiANCj4gPiA+ID4gPiBDbG9zZXM6DQo+ID4gPiA+ID4gaHR0cHM6Ly9naXRsYWIuZnJl
ZWRlc2t0b3Aub3JnL2RybS94ZS9rZXJuZWwvLS9pc3N1ZXMvNzAzMg0KPiA+ID4gPiA+IEZpeGVz
OiBiYjYzZTcyNTdlNjMgKCJkcm0veGU6IEF2b2lkIHRvZ2dsaW5nIHNjaGVkdWxlIHN0YXRlDQo+
ID4gPiA+ID4gdG8NCj4gPiA+ID4gPiBjaGVjaw0KPiA+ID4gPiA+IExSQyB0aW1lc3RhbXAgaW4g
VERSIikNCj4gPiA+ID4gPiBTdWdnZXN0ZWQtYnk6IERhbmllbGUgQ2VyYW9sbyBTcHVyaW8NCj4g
PiA+ID4gPiA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVsLmNvbT4NCj4gPiA+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4NCj4gPiA+
ID4gPiAtLS0NCj4gPiA+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMg
fCAxMSArKysrKysrKy0tLQ0KPiA+ID4gPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYw0KPiA+ID4gPiA+IGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYw0KPiA+ID4gPiA+IGluZGV4IGJlOGZhNzZiYWYxZC4u
MDMxMWM4OTEwN2Y5IDEwMDY0NA0KPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndWNfc3VibWl0LmMNCj4gPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Vj
X3N1Ym1pdC5jDQo+ID4gPiA+ID4gQEAgLTEzMTksOSArMTMxOSwxNCBAQCBzdGF0aWMgYm9vbCBj
aGVja190aW1lb3V0KHN0cnVjdA0KPiA+ID4gPiA+IHhlX2V4ZWNfcXVldWUNCj4gPiA+ID4gPiAq
cSwgc3RydWN0IHhlX3NjaGVkX2pvYiAqam9iKQ0KPiA+ID4gPiA+IMKgDQo+ID4gPiA+ID4gwqDC
oMKgwqDCoMKgwqDCoGN0eF90aW1lc3RhbXAgPSBsb3dlcl8zMl9iaXRzKHhlX2xyY190aW1lc3Rh
bXAocS0NCj4gPiA+ID4gPiA+IGxyY1swXSkpOw0KPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqBp
ZiAoY3R4X3RpbWVzdGFtcCA9PSBqb2ItPnNhbXBsZV90aW1lc3RhbXApIHsNCj4gPiA+ID4gPiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfZ3Rfd2FybihndCwgIkNoZWNrIGpvYiB0
aW1lb3V0OiBzZXFubz0ldSwNCj4gPiA+ID4gPiBscmNfc2Vxbm89JXUsIGd1Y19pZD0lZCwgdGlt
ZXN0YW1wIHN0dWNrIiwNCj4gPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgeGVfc2NoZWRfam9iX3NlcW5vKGpvYiksDQo+ID4gPiA+ID4g
eGVfc2NoZWRfam9iX2xyY19zZXFubyhqb2IpLA0KPiA+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBxLT5ndWMtPmlkKTsNCj4gPiA+ID4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKElTX1NSSU9WX1ZGKGd0X3RvX3hl
KGd0KSkpDQo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqB4ZV9ndF9ub3RpY2UoZ3QsICJDaGVjayBqb2IgdGltZW91dDoNCj4gPiA+ID4gPiBz
ZXFubz0ldSwgbHJjX3NlcW5vPSV1LCBndWNfaWQ9JWQsIHRpbWVzdGFtcCBzdHVjayIsDQo+ID4g
PiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgeGVfc2NoZWRfam9iX3NlcW5vKGpvYiksDQo+ID4gPiA+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqANCj4gPiA+ID4gPiB4ZV9zY2hlZF9qb2JfbHJjX3NlcW5vKGpvYiksDQo+
ID4gPiA+ID4gcS0NCj4gPiA+ID4gPiA+IGd1Yy0+aWQpOw0KPiA+ID4gPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBlbHNlDQo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9ndF93YXJuKGd0LCAiQ2hlY2sgam9iIHRpbWVv
dXQ6DQo+ID4gPiA+ID4gc2Vxbm89JXUsDQo+ID4gPiA+ID4gbHJjX3NlcW5vPSV1LCBndWNfaWQ9
JWQsIHRpbWVzdGFtcCBzdHVjayIsDQo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4ZV9zY2hlZF9qb2Jf
c2Vxbm8oam9iKSwNCj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgDQo+ID4gPiA+ID4geGVfc2NoZWRfam9i
X2xyY19zZXFubyhqb2IpLA0KPiA+ID4gPiA+IHEtDQo+ID4gPiA+ID4gPiBndWMtPmlkKTsNCj4g
PiA+ID4gPiDCoA0KPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0
dXJuIHhlX3NjaGVkX2ludmFsaWRhdGVfam9iKGpvYiwgMCk7DQo+ID4gPiA+ID4gwqDCoMKgwqDC
oMKgwqDCoH0NCj4gPiA+ID4gDQo+ID4gDQoNCg==
