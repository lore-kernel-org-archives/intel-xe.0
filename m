Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09425C87FD2
	for <intel-xe@archiver.kernel.org>; Mon, 11 Aug 2025 10:44:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C701310E437;
	Mon, 11 Aug 2025 10:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k2CKEPv3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25DBA10E436
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Aug 2025 10:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754909055; x=1786445055;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=sXoJXV3HdEHldscK/P7AKuDkXC6obECEuVpqKcTMoBg=;
 b=k2CKEPv3VVSc0LmkebLwWDahpQc1fbhBLUIWl4XCo5xyhwvA4YcNKaa0
 xpoE67jA7vS9/N26P6dYEraPjO73l4UnkP1szXTqUfAjGbLYc4Hcpr5cD
 KEO1ed2T7iCKFlGzd2EcRfZrLBrk/Qg8jQTSiAWFBhWEsIW+t8b2ymMK3
 074UYqLFJoJMxLjDlRP1AmDr/pSzzlFJVDgGUQFp1d6nlfBcLVEKlCuGo
 /7zdEU19qV2r7csXJUGXzvLMAvahKXr1yisseypHWd6TCbXhUncUyoerE
 DyzdXPBQ2MNcu4aCtqzJ5fxzeS0J9S90EoVbGqxKBje42mCyccbR4y25d Q==;
X-CSE-ConnectionGUID: kxyplWccR1av1aHF+gtFkg==
X-CSE-MsgGUID: TycwSGumSdesIZQsnml7VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="56363720"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="56363720"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 03:44:15 -0700
X-CSE-ConnectionGUID: 1xLekFQNQSKQGZZsWIEuTQ==
X-CSE-MsgGUID: ZZbkm2yMQXqn71aR2tXArw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="165782382"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 03:44:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 03:44:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 03:44:14 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 03:44:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UEk1EWPSpAf6yS7mAEQ3agjiM86CUWd8SSMkRHHxodaU67BggO80IXZiBh4SZ/mt8kbdziHYiq3OPlyclwwyI1azzCQ3royYVHH9gzAGwBKUCayCYKLWsiA9ZqrV89u9F57UdnsqN1oi2iK6WtK9xNAAX9PFL7odGXJMH2+WaXh5LVb/ouPzP+9R29P2kk3OOq8jESjFaPP48kyA+iiIG6OjD2UMUyajRaXV2Qhrc/WZB74pGDoADehjMYiHCpRrJ5lp4QQT+H7GM+eDPwX1wyGXEljhxu/8O2F0DguF7Su7bJjmCIEt22jdzuU3DZCHcfABGAnu8e6a55eowe7KGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0Mw/LIDyBDdXtZrAsQP5aAwLhM46ZkOWjUgjL7NPWQ=;
 b=n7I1Rq9ZmDXs0z6UjM0Kq3V/07g3IGYH+rHRqrsCFYW2i/o088ftFs/j3+3Q8g3w0jgSqlPHVpIw2v3Df9T0mPbYPnbo7eYTdNJCAnfSxHyKH+hFBxsPw0jSuK/nfQcb9C3wrejWmtp/2M3I88V8MV8jpK0/LP2hviTXogp3jiP3r1VJyk0cp8v/r2+P2TWvfrhwbp+j/tRwJzWzKzxc4+qEkWW4o5RKW9TtTWcvesiZo/t6kDERHyL9SrlJCjNNLF4erlJZ8tyENYalb4gykQLmvBRZvBLQ3/nmIEgRQras4ohqt1WWXol8QzQvaBisDTNjC3th3A+4sJ8s0rofjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS4PPF2AD6B04BA.namprd11.prod.outlook.com (2603:10b6:f:fc02::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.20; Mon, 11 Aug
 2025 10:44:12 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 10:44:12 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>
Subject: [PATCH v3 2/2] drm/xe: Move ASID allocation and user PT BO tracking
 into xe_vm_create
Date: Mon, 11 Aug 2025 12:43:58 +0200
Message-ID: <20250811104358.2064150-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250811104358.2064150-1-piotr.piorkowski@intel.com>
References: <20250811104358.2064150-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZP191CA0010.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f9::27) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS4PPF2AD6B04BA:EE_
X-MS-Office365-Filtering-Correlation-Id: 90ae43cf-3f3e-4078-fbde-08ddd8c40270
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHhCOSsyKytRNldWWkIrTnZnWEwxREdwSzcxdkgyTW5CWFlrY3VrTXg3YVBK?=
 =?utf-8?B?OHgrU2FEazJxVlVscVNWQURMM2dzTVdTWC9pNlRvRzVrM2RjMGFVZkJCbG9w?=
 =?utf-8?B?VUEzYUUzaW5pRU1YVlBDcHplU2pkYUVac0YwRG9HZ1UxaTB5cXhKUkdQZGpL?=
 =?utf-8?B?Q0ZNMkJZOHFFQTA4Tk5LaW81cFVId1AvSTBxMks5d1RJd1E5U0xQekplTUNX?=
 =?utf-8?B?cFU3MFZlekRoZVdSUHZjMDVZaktCN0g2Z2pPd0FFYjVCVEVZdnVOZjF2dFhY?=
 =?utf-8?B?MXpNZzY5MEZ0OExBY01VYWZUWlhnbGd1UVdRZWdzc1VIRmVTLzVPVWhTOWt5?=
 =?utf-8?B?SVZSUkVHTitTT3lDWWw4ZnllUjQ0SUpRaG56bzV5NGlHdkNTY2JIVXZRdllp?=
 =?utf-8?B?ZmFRRFE2NzNDbDVoNWZYU1d2S1d2RHI2a1VldTNjZ0VOSUhodG1JcnQ3Mmxm?=
 =?utf-8?B?OGQzMVNSS0krNkxhYnFBQytJSy92N1cvZWRtQ2FXZ0s2RzZvVDB4NmlqZTZy?=
 =?utf-8?B?bjgyWnpVSHhaL2xTaFFyaWtWaWx2amcvYVNSSjg3MXpqbEZ2dEFMUVJmOW8x?=
 =?utf-8?B?enkydjZWYTBScjJSRjg2M1VUUjZSbUhSeFc2WTVQTU5EQmFJNVl3YjBjbHpE?=
 =?utf-8?B?WFM5V25XNTQ4NXJPMHJTVXkySmlnWkt1M1VzM2J5OEkzSzd0dmNFc3hoRWlI?=
 =?utf-8?B?ZnNqTzVxdUhMU2V5aStNWU8zTFVZRHFxS2JLaXY5dldLNEY1QUN5SXF2KzFO?=
 =?utf-8?B?eFp2RUxBRXZZVlVTYys4OUJvNmVJbXpYRmE5aUpBUTJtMjdNU1dzYmdtS1Bz?=
 =?utf-8?B?T1hmSWJsMFZuc3diVjBjcXkrMzBQb0xpUW1mSjFHQlVnYW14K2d6NUJpVFo4?=
 =?utf-8?B?TGlmYmg2QkgyTHNUTlNwWVVjOEMzRUVQN2lzeEM2ZjJYYUJaTkVxNkUrbDYw?=
 =?utf-8?B?dGFEUVMzUUQ0N3pISWl4aVpjaTdsVXowR0U0L0NVUDd4LzRudkJLc0hZbkVn?=
 =?utf-8?B?S0lWeXd1Skg2anFBNUxVTE9qdlZEMk1idEo2WTJJeUg3WEI3WE1ObmhwLzdO?=
 =?utf-8?B?KzlPN3Rvc0xIcUozNG8zQTNPSmtQTzJuNXhqcFhPWTU0bkVEVFhpZFJqMEhT?=
 =?utf-8?B?L3d3cEhrUW5PaU5RWE84dWhyRHVGZWxqem9mTnVnSUFtMkhpV1huY2R3YkI0?=
 =?utf-8?B?Y0JCaWZpdlRwRUl4aFJWRVk3aU9NMCtmK1FjVk9HSllCQWo5S0V6N291Rkdt?=
 =?utf-8?B?YUd5ZTRmNUFlSUVDU2FRM1RNcmZzVmlacU9FM0FWN0Z1MlRxSllVZm9paE9n?=
 =?utf-8?B?VFNMcGtrMUlIaUpqWVhLejVmb0d2QVNqZ2tsU3VYK1NCbHkxWS9WaS9yUEp1?=
 =?utf-8?B?MGdINFJNdTg1NC9RY1FBVU1Oa1UvNGxtODFUUXF6WklrSGhTWk1Sa3JXb1VF?=
 =?utf-8?B?ZXRIQngrOHltWlNLZU0xemN5ZWJFUy9FKzlUSEdkVzk3R0Q3QXhWNytwNWxC?=
 =?utf-8?B?K1VDOUt6VXpLZnp5bEVia0xXWWZhYVNxcHRwalRRWURtb0RGc1RIOXVzcHRN?=
 =?utf-8?B?WkdsN2ZLbzJYNlhqWmgxR1k3S2JGWWFqZjF3WWFTZWFGOEpRMzIyZnVUU1Fa?=
 =?utf-8?B?ajNTNE50cFRYRi82dVFZK20xUUlIbEVGeUNEclBEdEh5aW1JbU8zMVJFcndE?=
 =?utf-8?B?aUhWaDgvN2VOMUwvQlJ1cUZUWFVhYldJWExGSTk1Z1UrSkNaVmtNQmJzcTVz?=
 =?utf-8?B?bmU4TjB1NEFra2pxNThtaFFvL2hnZFZjak5BWmsxd2dCbTFMcmZ6NGFBTEc3?=
 =?utf-8?B?b01Fa09IVnVMeHJId0llWGFxL0EyVkpaR0VkWlA1b1lhemt2YlFvcXhWdEhk?=
 =?utf-8?B?WFo3Z000OWYyRzQza0M1bFZmNEJXKzBpRGtzT1RqeUtvNVdhZTVVME0zQ0pq?=
 =?utf-8?Q?6oXrZl7UUGM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWV1OHhQb296cTNKV2JwZDNLYUk4dlRKMHl1UlBVN0lSUUNpRlhLZmJuZDVO?=
 =?utf-8?B?aFYySHEyaVhkbSthd3o5dmxsaWdxc0NHVkY0S2hEc242SGlFdlNnRVdRc3Jt?=
 =?utf-8?B?aVV1THlmejlsRjlhU0pFdXVRSXhJY0ZwaVVGaU1Bb3lmQ1U4QXQ3TW8rTldp?=
 =?utf-8?B?NFYwUllWbjFTUFNiMm5PSTB6bnVDWEc3YUZHNjFaYytiaDcwekZiNmFKamVB?=
 =?utf-8?B?d1NKSWtwaGt1UTg2cm1NRTRvRTJUQU1JVG5rS0c1a3pnWUlBZkVqc2N6eEs5?=
 =?utf-8?B?UUFJTHArTnE1Q1Rzc1VqUCtIK1F2aTJNSkxOc1MrZnRnMld6czBxSEFEZ1lN?=
 =?utf-8?B?RHFXcmY5K09wclkxNE43RVFiSUpIbnRCaXlVMEZWNWhYVmJOVURhTnI4WGZO?=
 =?utf-8?B?SnFReG0zdWdvZTZUUmlRYmRWc015Y1YwL2xESFRHbUNwUzJiK3Q5ZzMwcmhs?=
 =?utf-8?B?anNQZUV6YzVxelRwM0ZFWjhIY2JiTEJtcmI0UmhwcTRZVng5YzJoOXdhUDIx?=
 =?utf-8?B?Nm1Zamc2U1diS05xRW1vMVp1RVBUK1duZXRJRUdjcTlkVkZ6dlBhbE9RWHJE?=
 =?utf-8?B?SUhRV051b0RieTExbTMyQXoyK1RNNEUrckF0d3VrTzNIc05qRndadFllZTIw?=
 =?utf-8?B?R3RxWWtJejJCOWU0c3dPcXVLL1hRY1NOd050RzhHbGlSZ0RzNW9jYkUwUnVo?=
 =?utf-8?B?TVJXa2lnOWk2bEYydDVrcndKc3E3QzlvQi9FSVNiYUVHaW9vU1hFR2pONXFX?=
 =?utf-8?B?MTdCWWcyYVh5SU5aRzF5VXhMeFBVZkhsSkFyNENzMFZqcXFYZElsb2lQWjc3?=
 =?utf-8?B?MkhnYUdncEJ6UC9YZmQxOWJKTkp1Z2k2V3hUZ0w3cXpwQU4rSWNSOUxyU0dB?=
 =?utf-8?B?U2tOblNIRUl0b0VDT0RzOXB2alV3elVzZmwxM1k5NkhuZ3Mzd3dOdHFCeWM2?=
 =?utf-8?B?elQ1RXg5V1BvNWtHV3E4aElKa0NNQXhTMFc3cEZjNnVhNUZ5N0x1eTBNR210?=
 =?utf-8?B?eThpb1VYaThiTm5NcEJhSVdpbHBEZTRTajdCWDk4aEJ0WWhnRHZyeHFNV01u?=
 =?utf-8?B?ajlBU3VOVXVTUXV2TnFTTmc5ZFM1eUlhZEk0K1RIbU54WWRmWlg2RWtSU2dr?=
 =?utf-8?B?ZkNJMEpndzNSSWR5NjNDT1JML3BxUzZBVGlQVDM1N0hGWWJ2OFBsaGVHU3Ro?=
 =?utf-8?B?RFZnWjVGVzdqcko1SFZ4Tm1wcGMvU0NWekIrVTlkM1h6bGpmTnFzL1dYdGNR?=
 =?utf-8?B?Z0xPdDZpL0pOa0crQmxpeURXWDA4bXpEbUVPeDB4dW9laTJJNkhDVGR3N2NJ?=
 =?utf-8?B?Q1hlZ1JHTXNCSzNZZ2ZRc0hJNFVNekJyOWxiNjBmV3RaN0JSWXdEeHVWVmVI?=
 =?utf-8?B?a2tKRERpekFETmwzVEs5VWxKUkFsY09PY0pCbUw0L2MwRkpicndsRU8zN3lV?=
 =?utf-8?B?UXJsYkpsazlzbXY5MUNScHhKTThjcUtzUUE0bXhxVnBpRTMwSWNibnlJT1Vw?=
 =?utf-8?B?RmVuM2tNU3ZLRDdta0prOTFQREQ3dkg4RWkxdjhjSERHYk9yZXBZcTBmRWps?=
 =?utf-8?B?eGMwQVNYWm5BNHFlYnJ1KzQ5a3VYMW5kemlGUWNMV09DZXI2YXZlWW1UbmpQ?=
 =?utf-8?B?WkZXcFl3aS92a3ZhaG1TdFpvT0pyNHNoRHpVK2YzOUtzWFMrWUh6Uysvb1Vt?=
 =?utf-8?B?MDh6QUdITWN4ZDM4YXduVUxWcGM5cktKZVRKSGE3TzFCVCs5RW9KbXpMYm1T?=
 =?utf-8?B?VytWbU9RN2VsZzlsUi9SOHZDRmp1UFI4Ly9hQTNzN09HZDFScFVMVHFqSTRV?=
 =?utf-8?B?cGNyOE13c3hlWDgrMU43TWh6cHFvNHFMRzJqUXpOSnhGV2k5MmV0RDRNcUJX?=
 =?utf-8?B?bXdqUS9kWlk2RGhkMWNlanowRGN0SWNEd204bkY2YmpLZ3M1Z0toVVE0MEpV?=
 =?utf-8?B?aHVLMXdMSG8wMEUrVzR0Rk1xcUhRRTdIWVBLOUtYbXhja0tDdVdYNEFYelJx?=
 =?utf-8?B?UUQ1OUw3YzlHUWxvUVFGU2owaC8rY3MyVHZoRWtmY3Nwb21SaE54WVdpT2t6?=
 =?utf-8?B?K1haSldZcGI0NWxYeVFpR25kOE16MUVIY2ljeWdqYU1xS2FSV3BXQVlPQ2oy?=
 =?utf-8?B?N3dIaXpkWlFhbkROUDNEVTF0S3dLWS9DcVY5U2xRUi9TcHA1cUFVcHNCR1hX?=
 =?utf-8?B?akE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90ae43cf-3f3e-4078-fbde-08ddd8c40270
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 10:44:12.4140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r/xCrRWu3Y9fzS8Ry9jSRPVYFMzxh/rIu4p6PHR00wnEw2FZ+oKtBU/juhHdx0oic5FRZoKuqxvpfeTEnzk6yamvFli+5FDPl9SXk2xH3IU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2AD6B04BA
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Currently, ASID assignment for user VMs and page-table BO accounting for
client memory tracking are performed in xe_vm_create_ioctl.
To consolidate VM object initialization, move this logic to
xe_vm_create.

v2:
 - removed unnecessary duplicate BO tracking code
 - using the local variable xef to verify whether the VM is being created
   by userspace

Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 157e11bd2121..486d345b82de 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1795,6 +1795,20 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 	if (number_tiles > 1)
 		vm->composite_fence_ctx = dma_fence_context_alloc(1);
 
+	if (xef && xe->info.has_asid) {
+		u32 asid;
+
+		down_write(&xe->usm.lock);
+		err = xa_alloc_cyclic(&xe->usm.asid_to_vm, &asid, vm,
+				      XA_LIMIT(1, XE_MAX_ASID - 1),
+				      &xe->usm.next_asid, GFP_KERNEL);
+		up_write(&xe->usm.lock);
+		if (err < 0)
+			goto err_unlock_close;
+
+		vm->usm.asid = asid;
+	}
+
 	trace_xe_vm_create(vm);
 
 	return vm;
@@ -2062,9 +2076,8 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	struct xe_device *xe = to_xe_device(dev);
 	struct xe_file *xef = to_xe_file(file);
 	struct drm_xe_vm_create *args = data;
-	struct xe_tile *tile;
 	struct xe_vm *vm;
-	u32 id, asid;
+	u32 id;
 	int err;
 	u32 flags = 0;
 
@@ -2104,23 +2117,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
-	if (xe->info.has_asid) {
-		down_write(&xe->usm.lock);
-		err = xa_alloc_cyclic(&xe->usm.asid_to_vm, &asid, vm,
-				      XA_LIMIT(1, XE_MAX_ASID - 1),
-				      &xe->usm.next_asid, GFP_KERNEL);
-		up_write(&xe->usm.lock);
-		if (err < 0)
-			goto err_close_and_put;
-
-		vm->usm.asid = asid;
-	}
-
-	/* Record BO memory for VM pagetable created against client */
-	for_each_tile(tile, xe, id)
-		if (vm->pt_root[id])
-			xe_drm_client_add_bo(vm->xef->client, vm->pt_root[id]->bo);
-
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
 	/* Warning: Security issue - never enable by default */
 	args->reserved[0] = xe_bo_main_addr(vm->pt_root[0]->bo, XE_PAGE_SIZE);
-- 
2.34.1

