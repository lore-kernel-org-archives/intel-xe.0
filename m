Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14305CFA466
	for <intel-xe@archiver.kernel.org>; Mon, 24 Nov 2025 13:52:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B750D10E2CA;
	Mon, 24 Nov 2025 13:52:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JJBGm6yI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0B310E2CD
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Nov 2025 13:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763992367; x=1795528367;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kogCCRdsnNQF617qwoeLZO/sTMjMfgpXwJrGyqn6Ld0=;
 b=JJBGm6yICG0BVUQk4Jx62h49fV59QYw0WK3Cesumpp0pjupUjJuv8E7c
 UQvdOscoxoA7RnDlnrCF2BoQJdqBGj0lVIrIEUAmRnG8oNqYvnMxZ5D79
 AtImaKXRZxftA5/I60c7hbhtPA/zVsrmAT5LahZ/bMor7iNge0lyB1kMi
 +VReQUO3apyFSD/XCTdp2iEhbqudQITkwUK7ZiOJ4LtBO4GU4wb/4Lb5q
 ftUGxm8/Kex9znxjRTtqCSBxLHe31hJpnIrTaW0kcLbdPH55Bvwgy/9JY
 jkiqQuhg+XTXxXYY/cJ7MT/8PxL+7gv/t2VPpHfIsdhyaYlPnVV6g4idn w==;
X-CSE-ConnectionGUID: P9JMHmYdQmumqhlC84+hDw==
X-CSE-MsgGUID: RZGDzEE0Txyh3MOozuT59A==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="76603081"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="76603081"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 05:52:47 -0800
X-CSE-ConnectionGUID: pnkhHDDZRourrti1b7Ypbg==
X-CSE-MsgGUID: Po46LtYhTe2UIygIHHAcVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="192435888"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 05:52:47 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 05:52:46 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 05:52:46 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.29) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 24 Nov 2025 05:52:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jt44HSW72sNga9dN3qZxR1uG5SFgjUzuk71cwZfIInZtEBpNPJKxzt7MmPVkcFscnTNR6uVArAKG3Kb3WiRB/LhczKf6hSxtk/VYSRWYbsKLgoWViITdh6geL5Ag8ZBDR79iiPGSI8sQGuE+s2CSPU+BA2HNt1GjFIxz4J3iQSOvchEqGHG7ST71Y5WbAMoSvIIDdBtEbIXi8cJl8pfJOQEjnBw1qYM0xE9y0I+AD1Qz8AM61Tt5r8ugXduVDuIqZkG400Ms58X0ZZD+T9IrIwk0PEUKTAl25aIiffZMlO6Paxcq0pwSnbIJt0ziB1ZuAvp+TfaL0r1oSC20iSaSDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LjbDZn+vKCb8kQBmNb+i4chynxOI2rmCZ9fxO5dt1pg=;
 b=lljcmyXga0CN1LKgOg1EbDuPoMknmcuxOVRK+8UxrVtbbZHUpg+3cnAlByhZWY040QHg9sUs3J9Ri9txxJRzkdV+jMuvj3XoCzxeZGP7MA0IVOJBcU2TpEeyLiWtLRM5wovHR7rmSrMmQUQ3bNNTOaiaJXsrN1hoOxR7MRjYFkQ9LTbpuZfhwHetPfd7Iy+VKSS7RpYsFLMoVOp74O7lYAuc+bKTaB35chuKa0pt7qRc4yvtQXvJ3RIosU6EQgSw4RJWFX7XV+LTPLzwR3wy6rnBI56gThUs0ZoZg5SF/e6JIKn8Pd35QtyAPkXiPdxd6k5Byo8nX7zWjyAsnDIx8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ5PPFD56E32CC2.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::859) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 13:52:44 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 13:52:44 +0000
Date: Mon, 24 Nov 2025 14:52:41 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2 4/4] drm/xe/pf: Handle MERT catastrophic errors
Message-ID: <20251124135241.7tdfq7lpz54ec4gg@intel.com>
References: <20251031080501.844-1-lukasz.laguna@intel.com>
 <20251031080501.844-5-lukasz.laguna@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251031080501.844-5-lukasz.laguna@intel.com>
X-ClientProxiedBy: WA0P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::26) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ5PPFD56E32CC2:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e029a29-3e54-40bd-aa18-08de2b60be34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TTE1bXFKdC9FamhUa1pxTktmNURZekZsc0ZQL3JPZWJaQThxTnJqUFRnSmNX?=
 =?utf-8?B?ZVF6WlRrOVY4a1BGbWhndXNMSUF3clNPbmJCK01zakpPbXM3UUxIemgwSk5j?=
 =?utf-8?B?cnZLQXllWlc0WHdnRjFkUk1uNTk4Vzg5UXVnejE4YmkveVVVMlROKzJzbjdp?=
 =?utf-8?B?dHBUdDVXS3ZaaGFWQkFpdUVZbWRxQ01oRmRuMkNqTmNuOGJUUUh1QWhaNmUr?=
 =?utf-8?B?cmhmM1RtNk0zZXpaU3BWN3RZZ0NEQW9IWW1ZdWJmblJRQUV5M2dJYjlEc28w?=
 =?utf-8?B?T2RudEZhdmRKY285UnJkQXNWUmdGdDl5a25kN1NtT0tvV1o4Y09lTGhhU1kx?=
 =?utf-8?B?Zm9ySGswc0tuNXVqV3hjSng1dUFBSmZnbENscHNvbUViSlc0Y1ljSk9TUlcr?=
 =?utf-8?B?dHNHOGg1clgxZmZrS2ZBd3dQQlRLam1BcWtjVk5OM1g1clBia3Z2c1I3SHlX?=
 =?utf-8?B?eUxSTmxrZ0FYczZwRE9BUFdaai95VktEWldyQVdidFpiRGdKQlV0YzdmaUp5?=
 =?utf-8?B?Q3RTSVFVSng0WVdlUzU1VnU3NkVXcHU4R3FQdUdIc1ZjcDQwLy96TDFrZVYx?=
 =?utf-8?B?V0YzMDRSVkwxSXFZY0FGbEwraElZSmdLd1F2TFlFNUpad0xrMGZxem5ROURZ?=
 =?utf-8?B?eDV3U25GT3hWV3YyQ3o0WXdKbUV6U0NHMmVPcFQrV1pUakViUHJvYXFXVkJr?=
 =?utf-8?B?akRFaXk5R0pjVEFCSzBNY1BBaUZHbHpreHJ4cUJTR3BWajNncHg1Wk9ZdHZE?=
 =?utf-8?B?cVZXcklDTnd1bDVXNFpqbGlQenhnSXpPQWhHa3BPTkdWVzlxeFkxQ1NUVEJX?=
 =?utf-8?B?bmhEMGtHREZscm9tVEJWd3ZVZHBoSDFYc20rcmpLbUxwbVZaT3AyMkhJTDMv?=
 =?utf-8?B?YVB3RzFLUCtDN1VHZUQ1bElSRjZkTFhmSks2MjVCbE5qVnZ6Z0hOS0JzQ0Uw?=
 =?utf-8?B?c3J5dGNrbDFONjZTemNzejZKWnJTOEJLUVhHbHdYUDVmbVhNei9aelFMK0Vm?=
 =?utf-8?B?RWNvS09WS0lETHVRRVBVZWhJOVVGWnRjMnJXZjFtcnMzbm1zRllaR3RLa0lr?=
 =?utf-8?B?TXRhVWZtUkpoVGNHY0FjVktpNkk1TlJWbEtoY3JhdnZldm04Ym5rakRPVnAr?=
 =?utf-8?B?WEkwU2pVbWVpSXJRYkgwRUdUL0dNQXNhUTE3ZXFYZDJvOGZBaGZuZGs1NTJO?=
 =?utf-8?B?RW9PSU4wS1N5ZE91TmVxcStHeDkxNVBSSTlGUEtSYjJvR3dsWUdGcEd5eU9R?=
 =?utf-8?B?cllSQmo1Y1FpMUdjK2lRb0lwczRZVGdzS255ZW4yZWpaVjFhbDhRQURTY1Zk?=
 =?utf-8?B?eW5jRkJqeStweWZTY2VDajA0RzQ4UFloR3RnZ0p1bHd2NFp1R2VlZzZhcDJO?=
 =?utf-8?B?NEdpQWtjYXorWWVpV1kzWk1WbWc5djBNYW9YNDc2K0p5NksrUmNxNlZPM0Mz?=
 =?utf-8?B?VVdsRWtBWWZTRlZmalg0RW53RGdTdE1RSDV6dnlzTk1SazNOK0ltdSsrQWJk?=
 =?utf-8?B?Yng4eW1YbVJFNDNuK2d6dkRmOEJsMGpUcFZVN1lOWHdZVXphTkhiTjRyYmlu?=
 =?utf-8?B?NGljZko1cERTYUVNckI3RWJTYjRnWWpzL3podEdxRURuMDNpckZDSWdiTVFv?=
 =?utf-8?B?WEJxVm5VbTNkb3ZmQVJ1WGtmbmNxZVpYZ2o3V3cyR3J4elBNM2NudzdsTGhw?=
 =?utf-8?B?S1QyQi9MRTJveVpJWU54N1l2QmdNWmdUTGh1YkUzVEhKVUpZZzhhOFN5eEhS?=
 =?utf-8?B?NisvN2swRFRlT1lDZStqdTJaeERDcmJXZ2tnZHBPWEFBdi96d2IzK1Njam1o?=
 =?utf-8?B?Z2R3aW1VRDBVa21RY0xYWVlNVkhFdnRlYndwTGt2UGlCK1EvRlh1bWx3OHNu?=
 =?utf-8?B?bVZpL0t2M0pmS0p4TWpIb3R5a2Z0WjRYTXhEMzdKZTNyREdvalVLT0w4OU5K?=
 =?utf-8?Q?+0nCRh3Q1oiOusdCbw0c/XMKeX9I6tYS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S09zeUd2SXkvTWNmSy9WcmhkV2UxSjhIVEVVSUhFWUJmdGZ2YmduNTBjSHRV?=
 =?utf-8?B?cFhMQXUrTmpldmYvc1M3cEYxWElWVW5EWjdhVkFVSXozWWFZaHpIQTFlbXZK?=
 =?utf-8?B?R1Y5Z0JNWEpTOXpkcmsxQUF2Q0E5dkJidjJPSlpyVGMvdEZIRll5Z3NJV3R6?=
 =?utf-8?B?WC9YQVRXeGlMeDVscXR1RlBubWtRYVlLZWYvUDR4MEh4QjY2UldmOEpFeklq?=
 =?utf-8?B?RitYNjNTQ1NBQlV0OEtKa0NjV1RUaDZVTmpBY29IVDRZSFRnVVdXbVJPMTl1?=
 =?utf-8?B?eTlpekpPWCt0UDYzdm43NVQ4TXJ6RDhXZ2tmQ1NkSXB3Y0g1Sy85Y0JBTTVR?=
 =?utf-8?B?Z0xQUlFKcWtQdzMwQzk1UXVWQXYrbmU4UEZUaEhBbXpOcXpwYjRLd2JhSzVZ?=
 =?utf-8?B?MzYzOGZCWjZ4V1crMGNuWHZDeUFxaURqM2JBb3JaNjVPU1BkTzNFYkRHMG5N?=
 =?utf-8?B?WU16cVFGVGQzRHB6bW1UTGNXMmk2REZqUU1UdFlpWC85bmpxL09UK2VaWlMw?=
 =?utf-8?B?L2NySG9oZG1GVUk4QjhsRDRsKzdiTHdidTFSSnk3MzRhclNEa0dSUytKL2ZQ?=
 =?utf-8?B?ektFOEdraFZNdUtiOG8rdU1lblBUZXBVRTU2KzJkRWcrN0RGM0F0TjRKVE5B?=
 =?utf-8?B?SlArWkErT28rdkxzdFhieCtpQTI5S0ZuY0xiYUplODBDeElTOTZBNGJwdmlK?=
 =?utf-8?B?U1pOZDUrTWJnc3QyVUlaem1DajZEdWs0UTFXL25RdURWY1VQbHFRQnhoZkJi?=
 =?utf-8?B?TDVad1U3UXVvdTE2WGVKYjduNHV2QStUZ3RZNGxhNnF1UmVIM01SMGVLMkt3?=
 =?utf-8?B?RFhUaVlZTmY0YUd2U3Nzd3BZTHY2QXpqOFRUVmtPRTRTZytsbHNCWTkveTEz?=
 =?utf-8?B?dUhzUGl1WEdrcWNVdXNMdTBGWW4xZWt2emlVWloxWm12VzFBbythVWN3QkhF?=
 =?utf-8?B?WWxzUUYvWlJWaUdFUFVFTlBVOWwwdG9qMFpQZy9uY3kya3RSQ3l4eHVqRXZl?=
 =?utf-8?B?WWUvWmRlZWJIdlpLRzNROS9QaUcrbFJsMWQ2eWE1dXhJQzBoUkdzaGJ4YXdt?=
 =?utf-8?B?bWpDblJzSTczTHVzS1ZhZk56T2o3Rkt5RXg3bUd4b1Jxd0RvOEZrUXhDTGZi?=
 =?utf-8?B?OEM4RUc0bUtvT01GSmpPRkpWSWNzczZFR3Z3ck9mcVpLeFdGbUlTeGVyMU1B?=
 =?utf-8?B?cHlSWm5vN3VPYVBra3JLNnVHVmt1Y2xmeVNrVXY5QXViY3lUZ3JRdkEzekJx?=
 =?utf-8?B?THJ6Wi9Oclo5NG45Q3ZvZzJ6Q0RDblZXd25aMkR1UVdPTHNNMnROeVk5TWNn?=
 =?utf-8?B?Y2dTZVdXdnR4UGdCak1ONkdxeWk4YzJEV0RpQks3SmFQMXd4a0FvK05scWxC?=
 =?utf-8?B?azFueGZqRlBkL2h1UjIxWkp3ZGVrL3J4aXlQSHZ2QWs0YVBrdlZJWUFxZEtW?=
 =?utf-8?B?RFByOHN1VjZsMGQ4QkdVTUhlakVGQ3MyazBkT3VwenowSER5di90dXdqWW5y?=
 =?utf-8?B?YjJzb3lyRTRhc1NRVTIwcUtWbkNuSjdYOXJNYTNUMGVhT0dDcHpEdkRRd1h0?=
 =?utf-8?B?YnhSdWsrVDF5OW4zV2RCTjJlSWxYUWpCT2hZb2VlNy9XL2g0K3RFUWVWV2Nq?=
 =?utf-8?B?clVpWTAwcVlVd0thVFR6clV3Y0ZDWTNnKyt3NTRwaFhRb2VpQUxDWE04YkFu?=
 =?utf-8?B?NDhHYnVtYWVjMVFVNkZrSXhDMmZkYWhudHExNENoZnZTUGVZa09tbEJiYWJY?=
 =?utf-8?B?NXpzanFxZzVZaHhXSnJ3akR1V2RuZHB6enNyVlRZVi9PS3ZzQmNhd1hRVUpr?=
 =?utf-8?B?V1lVYVV1UFpqL0pHSHlZUkdTK0lRci9vSW1qWmoxQ2dTRVAvTmVJWUtZWE5O?=
 =?utf-8?B?TG4zOWptdDR6azVXWlVObk5TaDRSSlIyVjl6MFUrM0lETGdtTjZ4SEoxUlRy?=
 =?utf-8?B?aDg5VVpmWU5zWmNTcnZNSWZ2a3NMLzBkakZhWFR3NDZMSkRFSmR2NmY5SEVX?=
 =?utf-8?B?dmNpK2lCMjhKdmQ5VFJaQUxnVWtZekJxMDNwUFhtb1Z4Q2pENWUzellNTHdz?=
 =?utf-8?B?RzdFQXhsWjZJY3JjaVcybVpqbkZpNytKRWdEZFh0Z0RmSmpwOWQ3VDR4WnRj?=
 =?utf-8?B?TVV3aDhRYTJGbXp0akVRZnFCRWRkOUtISVFzbDhQYmVJQ1VncTBuRWJlSlRN?=
 =?utf-8?B?QVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e029a29-3e54-40bd-aa18-08de2b60be34
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 13:52:44.2637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Cn8j/N2OT4UrTODFnjZpcnReDD1ATNKXXoE9kcWvAnjUD1VAQoHSf3l8Ioh1+p5zEdh5y9ptUxITeavLCl95CyhiQyUeBvm+3hD+g2k62I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFD56E32CC2
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

Lukasz Laguna <lukasz.laguna@intel.com> wrote on pią [2025-paź-31 09:05:01 +0100]:
> The MERT block triggers an interrupt when a catastrophic error occurs.
> Update the interrupt handler to read the MERT catastrophic error type
> and log appropriate debug message.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
> v2:
>  - rebase,
>  - fix the VF ID extraction from the read value.
> ---
>  drivers/gpu/drm/xe/regs/xe_mert_regs.h |  5 +++++
>  drivers/gpu/drm/xe/xe_mert.c           | 11 +++++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_mert_regs.h b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
> index aef66c04901d..c345e11ceea8 100644
> --- a/drivers/gpu/drm/xe/regs/xe_mert_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
> @@ -10,6 +10,11 @@
>  
>  #define MERT_LMEM_CFG				XE_REG(0x1448b0)
>  
> +#define MERT_TLB_CT_INTR_ERR_ID_PORT		XE_REG(0x145190)
> +#define   MERT_TLB_CT_VFID_MASK			REG_GENMASK(16, 9)
> +#define   MERT_TLB_CT_ERROR_MASK		REG_GENMASK(5, 0)
> +#define     MERT_TLB_CT_LMTT_FAULT		0x05
> +
>  #define MERT_TLB_INV_DESC_A			XE_REG(0x14cf7c)
>  #define   MERT_TLB_INV_DESC_A_VALID		REG_BIT(0)
>  
> diff --git a/drivers/gpu/drm/xe/xe_mert.c b/drivers/gpu/drm/xe/xe_mert.c
> index 304cc8421999..e5e0ad872506 100644
> --- a/drivers/gpu/drm/xe/xe_mert.c
> +++ b/drivers/gpu/drm/xe/xe_mert.c
> @@ -55,10 +55,21 @@ void xe_mert_irq_handler(struct xe_device *xe, u32 master_ctl)
>  	struct xe_tile *tile = xe_device_get_root_tile(xe);
>  	unsigned long flags;
>  	u32 reg_val;
> +	u8 err;
>  
>  	if (!(master_ctl & SOC_H2DMEMINT_IRQ))
>  		return;
>  
> +	reg_val = xe_mmio_read32(&tile->mmio, MERT_TLB_CT_INTR_ERR_ID_PORT);
> +	xe_mmio_write32(&tile->mmio, MERT_TLB_CT_INTR_ERR_ID_PORT, 0);
> +
> +	err = reg_val & MERT_TLB_CT_ERROR_MASK;

NIT: To be consistent with the rest of the code, I would also use FIELD_GET here.


> +	if (err == MERT_TLB_CT_LMTT_FAULT)
> +		drm_dbg(&xe->drm, "MERT catastrophic error: LMTT fault (VF%u)\n",
> +			FIELD_GET(MERT_TLB_CT_VFID_MASK, reg_val));
> +	else if (err)
> +		drm_dbg(&xe->drm, "MERT catastrophic error: Unexpected fault (0x%x)\n", err);
> +
>  	spin_lock_irqsave(&tile->mert.lock, flags);
>  	if (tile->mert.tlb_inv_triggered) {
>  		reg_val = xe_mmio_read32(&tile->mmio, MERT_TLB_INV_DESC_A);

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.40.0
> 

-- 
