Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76023CF2564
	for <intel-xe@archiver.kernel.org>; Wed, 19 Nov 2025 03:18:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307A710E0B8;
	Wed, 19 Nov 2025 03:18:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EL+PEJyS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB22810E0B8
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Nov 2025 03:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763522284; x=1795058284;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xiIvsmr7S318J76dJ94eg/vWP5O62ffP9EBFItFO9lM=;
 b=EL+PEJySYlQBoCGCKKn1c9nySupdMgafValJRSqNji3XDXoqIs/f+vyN
 0G+v46xhrY9D6ZF9NLijDyqhPnPaEA5nnMqWetW7F9ldvfWFqTCOpsmG5
 GhRw588Zz2D4veWVsPiVZt4L0QsKHChY+Be/fKgAnL0YYHsl6hmfrNUQv
 1Lt/nCQlSpFpm2onu3RehzCaA43C0dA7qx/vHKlkcj8VmBwP2KFevsn9f
 yrBes304aLiCHKbg3YmddSczW67ytgsbODjZjB/dj0SJ2Vy/8pOkzWNcI
 RFrFoj3vwSI7UC3jo7+uD3Vcy+YHA8tOYenB9L0NWOQ4+bjTeFadydYEq g==;
X-CSE-ConnectionGUID: QjLrZEf+RVyGJa5rzVfSMA==
X-CSE-MsgGUID: t25oIUTkQiaQeOZOoYf0Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65259688"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="65259688"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 19:18:04 -0800
X-CSE-ConnectionGUID: JEcgBdWTQxiyyOC4/JfLFA==
X-CSE-MsgGUID: N+JOmtevTfy9bfXiAx07xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="195400944"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 19:18:03 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 19:18:03 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 19:18:03 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 19:18:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jcCO6+GaqbPgK2a+8m1LwLWKpRdHPpJc9SUJEMgjS2OWtNnrkwEqWGdS/bujZ66xmTrPD1idk197robaqwf76ea4azML4494Kj+0N05sFK2u8VC4ebR0zaYGJ7wGpnY3wViiGiPFY8rnMUZCccdMGshWHBM6ikiO3fgqdIDX6iLT5FyOUqI+iJsjRo8qOJKW1jtUnVV50qNFkJRcjhz0rupUwz6aGXx+9+/fU7n2VR7bfoUTcXELK6U/iZcp0WlBbYnZjWqSesjtGIyaa3ePxClp0knDrmtwmUQ1Tc1EPA1NNNvNAuYiGVI9nCyc+X2NWerxEk/5yINrAN5SlMmaPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bSebZ3zV55XEB54PlA78XEFIJMmpGIMg9cjeBeWzzM=;
 b=obxkvhJAvHLzJDyCtc1iBP6Vq9rb0G17Jlk6LuL5lerxeEHYCKi4WOg4EKwjkYlXFHRoCVp2MCEE6x4h0QCFs/IFNHxIvfPw8EzPrGUY70LcLqTjWxuUwuMPBalxT8YUHpQvQhY/iQjTkMGFW5dk5vBGBUiqTlFVsfeHjRZuA/SPq9jp86GPtuHCQSqXGFmTyBJwc38/oUVlARYZKmLH7ArsJGT7QymRa45qA6n3aVmd6CMLyJngNouT9NcJ33T4SSSZQrnd+ITjsQSiqZubnvVMShtOwYkrB60vY9Su5uKfNMn4E9msT/kJEgXE1risAqHJ/BhI+Rr/4Pq8DxmGHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Wed, 19 Nov
 2025 03:18:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 03:18:00 +0000
Date: Tue, 18 Nov 2025 19:17:58 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3] drm/xe/uc: Add stop on hardware initialization error
Message-ID: <aR025izk8Q10bFOl@lstrano-desk.jf.intel.com>
References: <20251028153820.3139977-1-zhanjun.dong@intel.com>
 <aQEgDjfMVDYELrWJ@lstrano-desk.jf.intel.com>
 <55e77810-bf9a-4914-9eec-8984d29684da@intel.com>
 <84fa5b89-61e7-4aec-ab17-5057f9c52d74@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <84fa5b89-61e7-4aec-ab17-5057f9c52d74@intel.com>
X-ClientProxiedBy: MW3PR06CA0023.namprd06.prod.outlook.com
 (2603:10b6:303:2a::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8019:EE_
X-MS-Office365-Filtering-Correlation-Id: ddf80178-46d2-4a9f-3880-08de271a3e6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bTkvV3kwMnVwZWpLS0pzdlpydExkMHhiTW41dDJhRFB4TlJORXI2MUdRK2pQ?=
 =?utf-8?B?aGlBSTh1eUxVcW5SM2JIeit4My9aVHVSMndRS2xIL1U1SXphbUc3TTJiOWNr?=
 =?utf-8?B?Ly9yeUR4aHJRR2htR3ZkQkJsS1BxbDhHNWlWREF0ejR1MnZTT05jZWUzL3NV?=
 =?utf-8?B?UGMwYnduc0lPYW4zNGJQOXJreHNxYkIvVDBpdEh2ckFjcDN4V2kydndYQ1Vq?=
 =?utf-8?B?RzZNNVlwR0kwbEJBbG5DbDRmM0ttRm5zSk1EcE1mRDhiUGgwTWkySTZFb3dN?=
 =?utf-8?B?a0tTTDdqUE5LQ0hGM3p4a2JaRktyb2F0cUlhakROYkt3RldHRkVWYUpXWity?=
 =?utf-8?B?Q0JPZHJiU1U5MFZ1emZPYUhPKzdyMFR4ZndlSVd4L3JCY3htTWZTTGJUcDdy?=
 =?utf-8?B?c2dmbTJURGtibkJ5SVFRSkRrTGVNbWtjdTFkek9vaWpPZExZdnNHR2FYMk96?=
 =?utf-8?B?cGdQTjVTR0V3ZFpTUG5ZM3lOTVY4TXJ0aytySDFNUjRHcnQvUCtzTnBnOENM?=
 =?utf-8?B?WGhINlVuTzk3Zm15dUVIL3NPSVhuMm8rOUQ0R3lsR0VYRUNxQmJMamJMeE5I?=
 =?utf-8?B?UXFJSm9pTHAyNW83eGE0cTc2dXJPbWh6S2E2TDZuSENuWVpRNWtsWXJ5azUx?=
 =?utf-8?B?c3FLejBJZnlEUFc4QllST2dZZFdGb2pXNERMUDlQd0ZTQ09kck5QSkMycWxx?=
 =?utf-8?B?R3dpOVY0NE5nT05tOGdZUDNDZnFweEg5aXVBZTRWa3RDNHl4bUF6eGtzSW9R?=
 =?utf-8?B?SjdleFV4U2RNZTJEcllrR3gxbTVtV0ZuNGhxUnRpUGkzUFVCVUJaK0NCdStN?=
 =?utf-8?B?em1FUXN4ZGkxZzlpOHhYK1JmUmhQMVVtNkJ6eFFxNkhWVVdzWDVuVEdNMFJG?=
 =?utf-8?B?OHo3QXFNVGFwTFhiRFNaSVFtM0hXbThsVllxZnp0RXJlNC84by9USllDZnNp?=
 =?utf-8?B?YkR2Z1dUcFRiVHlJWFlnMGRNL0N5MFBWUUF1OXNVY0JFUVFKazhTalhoS3lI?=
 =?utf-8?B?MHR0S0V4K3NmMXlURkNLelU4WmVveWlVSWtMOENFT3NDQW1vbTBSVGRUVXZS?=
 =?utf-8?B?cXJiNmhOT3JNZzJEWkNuUDJXRnBWSGZPdjBhWG9nVEgwWUp3OVZ3cUlGUXBi?=
 =?utf-8?B?dVVLM2lSa2ltMjUzL2N4R3ZFaU5RUHRjUWxKcHBlTURxdXp5WmNtVHExemZS?=
 =?utf-8?B?UHpVTjlzVHJsZS9hK05BcTdUYmF5RU5XZHI5b3ptZGhjNDdlNG4ra2orRG1t?=
 =?utf-8?B?WjFzMkJKSnl0cnZPQ0x0OGhROWJycFZUN0hkc3dzMUJiOVFxcXRxV2dIcnVX?=
 =?utf-8?B?K2R6VENJa1FyVElkYWdPbzZMTlp1OFJ6cENsa2ZXU3VoM3Y4NDNEY2NSbDdC?=
 =?utf-8?B?QTYrZTgvejgvdWlySVYxcUdEdFJIOTMramU0U2lkT3hOemo5M0dJd3k1SDdN?=
 =?utf-8?B?aGttNC9tUXk5ZWNYYUJ0ZGg2ZWhpd290dkVIQWQwS2lZTitJcFFSU0ZnQ2dJ?=
 =?utf-8?B?ejRmbkZ5Q3dnbmpmTndvc1l5d1BqUHVDcExwYzJiY1FTZDRQb3EyTWl6Z2x2?=
 =?utf-8?B?bDkvc1lNYlVaUFN2QThrVC9VdmhhcEFTWFIzclNPYW1DWWFtalp5L1ArS3kr?=
 =?utf-8?B?eVIxOEF2VnlWVWRDd0NrWFZTS1B0elVlMXNTZ0dpVGdCdVA5ZjU3TFY2Uy9U?=
 =?utf-8?B?L09FVjJQcW9mL1diS0ZUNXRoV1lCNzJObzk5SVFvKzdEdDZUaFFmVUY5NzEv?=
 =?utf-8?B?a0NQaHdFcENJU1l6Z3E2bHlpaC8zajFBdmhmb25FZ25ONzEvZjkzSGEzSDMy?=
 =?utf-8?B?UERTN2hPZEV1dVZ6K1ZRUkloZll0NkVROXpiU0d1VlpNWXpZSDVYNDJRVzN2?=
 =?utf-8?B?OGJhdlV1YnRlTkVxNWtHNWI3a3Z3clNoTEtiZzBjZjJBZnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0FhMXE4UHhLRWpNNlV0Vkdrai9SSnozRTRZNkIvRDNya2RpN3Qzb3ZBSWhq?=
 =?utf-8?B?ZVZFazVna21ad0dyV2FncDQxZGt3Zy91MjdLRC9pbm5uanIwdkhqcXZrQmEw?=
 =?utf-8?B?MDdiU2Y5SDBDM25GWWJuQ1E4TlIySlBDVWNpSWhaa2hQRDR3UE5ZYnE1VkxR?=
 =?utf-8?B?THhXOExTanVvRGkzR1JmOURmRVJ2bGtYcVozMHl4MFdXSG1IMG9nMG5lOXFN?=
 =?utf-8?B?NWlvR1NnaGFZa1I4OHNqUlZGYkxyeEtZMUxlc3IxbEY5NC91SHBwaHNaUEhD?=
 =?utf-8?B?TFlkNVdVaFRQcnFFbkw1aDF0SmdlcmIwWTFWWVRCaE1vM2FlYm5XNXYxQXl1?=
 =?utf-8?B?cm5oN2RlWE02TVF3MytmVnJlVzBrZzFmQnV5OXF5enEvWlA5cUg0K3dEZ1Z0?=
 =?utf-8?B?S1hwWGFQS0k4OUt0Vk1TcnZWcU1pSisvNWxiaFBEWjZraWN6MVRSYklIUlVR?=
 =?utf-8?B?TTNlRGw1MFBaSi9kWDJuQlRkbmFvd1ZCMmhHZlBYaFAzaG9TOXJIL3pLaUwr?=
 =?utf-8?B?RFAzazY2cUVZTEdTZlFWSlNYdndVOW9GL2xuaE56OUpiVlV4Q01PSEdGTGhN?=
 =?utf-8?B?VWNsTmpLVVpCZHZPNTJKZk8wOFJUZldjSU9Iamg3bFlrZk0yNWM5Wlc1dEhq?=
 =?utf-8?B?eElYK3VvYVpXUmVrMWIyK2pMbHJGeGRhUndXVnlmYVpFK1ZEeFVPdUtsNHVO?=
 =?utf-8?B?c2NPL2VaZktlUDRZdHFTcmFqOXRkYjB4SHRsYjgzNVk2RTU3RlJ0VStlV1hx?=
 =?utf-8?B?SU1TWGQwa1Z3Z3ZYR3o3NU9zUXk2RGhhenhRUSs0QWg1MjBnK2lLRVgrM2Jm?=
 =?utf-8?B?cncyQmp3dEEzRU8vVmd6Mys4d1ZReVBvTk1wUU1wOXZNTkFyZFArQ2ZvL3Bp?=
 =?utf-8?B?cFJOeHkwOVR6WmpudENObE11QllJUmhqaVVlODJwUm5ZMVZHRVRJN1cwSGtE?=
 =?utf-8?B?MDVUM1ZYOXpzcGN1SS8yeEN2Wk5uQmRNZFA5OVMyQ2NUVkp0OVFUTUlvSGZ1?=
 =?utf-8?B?c25sTHZORi81T0c1amNkN1BtMmVnMjdNb2tTeWJaVGxHSm5NQmlkZjFXQ0w2?=
 =?utf-8?B?Qm00L0dPY28yZXIwQzAvTCtoZjJFWGhhM2RxeG5ZQlhBYS9vZzE4NDlaVEoz?=
 =?utf-8?B?UjJkWTViYmgxRXdqakg1N0hMQ2dJTXdmSEltVXU2TXAzVDRjYzJldWVlZm1P?=
 =?utf-8?B?VGpraGdUeFhhVVdnK1l3Vm8xN0E5OTBhQ0oraWFRYWhkKzJNSURnd1Q3cTF5?=
 =?utf-8?B?L2d1b1VSU3FpTUNYNU9GWUg5dmlMdVBockgrakI0NG5ZNFQwYVMyWnNIYjE0?=
 =?utf-8?B?RXh6eXUvRjBLL21Cd3VmWXcvQTBqNHFuRWowQi84RmdySkFER2xnczBWckRq?=
 =?utf-8?B?Tk9JTnhFRzdnMEIwbG5Sbmh3TEk0em8zU2IvejN0NldURmJyd0pYcDljY0h0?=
 =?utf-8?B?SUlLL1h1UUVXVjV1YXE0dDZ4OFNHYS9sbURZK3NIbUxUZHFlRTNVQm9OMGg0?=
 =?utf-8?B?UzgxdDMybG1pL3dzYlhpTWN4Nmo3WUlGSEh6VStpT2JhWlNRNlVmbjIzTGEr?=
 =?utf-8?B?eXloeXNtZ1JIT3VFaGtnS3hsRkpId1hTa05NRjNzeEwxWSt5K0c4eW9EQ2JV?=
 =?utf-8?B?SmppMGlGZ053SHlIKzdIODV0bHN3NVhxZVZXbWtkMGQ5ZlUxS2g0UkRoY2pF?=
 =?utf-8?B?aTVtTlFGKzJYMjRXZERTSGlLNE9GRVErbWg0ZC93WTc4NmtoVCttajlNM2s2?=
 =?utf-8?B?amhnK281M1VKNTR0eFpGdmljOUkxS0M1MUNYdVZuWkt4M2VVVkZ5S21qd1Fl?=
 =?utf-8?B?Y1NOTUFQUlVrTjgvMEFxM0pqbVpveHU2aUJpL2ZuTUpLQytmcWJQY1JkbEVv?=
 =?utf-8?B?TFZPTUZBbkNESm1ndWpuV1pqNGdGTjNVblI5cHZzK1BYMTFQR2NnMXJSV3Uv?=
 =?utf-8?B?N3FuaEZsbUQrUVFaMWhvekl0bUZ5cmFBVDlxV2x3dUdNZ2FOK1g2NDA5aUJ1?=
 =?utf-8?B?K05BWE9IVG41V0dpNFlKdklIZE9HN0d2aVROb0oyLy9Dc0YrTTFKWS9ZQS9a?=
 =?utf-8?B?WU85a1Q5ajdkcHk3UmNEZWJ0TTRJeGZiVWptRnlSbmhtZU9OSXhBeG1OZVJn?=
 =?utf-8?B?UlV5U3JvQ1pVZTRHWUU1RUwxOTljeVN6RWVnWTVwYjJ2UFpMMzNwclJ6aHJU?=
 =?utf-8?B?RXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ddf80178-46d2-4a9f-3880-08de271a3e6e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 03:18:00.5424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tb6TI66GW7OAZvJrjsrJ1+YyckY3bHFxbkQuIWjsuYYidSPV0KIaSacvr12ZUStWT+vPMrZNxHYOuEcjx3u8tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8019
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

On Tue, Nov 04, 2025 at 11:33:19AM -0500, Dong, Zhanjun wrote:
> 
> 
> On 2025-10-28 6:36 p.m., Dong, Zhanjun wrote:
> > 
> > 
> > On 2025-10-28 3:57 p.m., Matthew Brost wrote:
> > > On Tue, Oct 28, 2025 at 11:38:20AM -0400, Zhanjun Dong wrote:
> > > > On hardware init fail, the hardware might no longer response,
> > > > add GuC stop
> > > > to clean up exec_queue items.
> > > > 
> > > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5466
> > > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5530
> > > > Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> > > > ---
> > > > v3: Switch to xe_guc_stop
> > > > v2: Switch to xe_guc_ct_stop
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_uc.c | 2 ++
> > > >   1 file changed, 2 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> > > > index 465bda355443..00ca5883e006 100644
> > > > --- a/drivers/gpu/drm/xe/xe_uc.c
> > > > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > > > @@ -173,6 +173,7 @@ static int vf_uc_load_hw(struct xe_uc *uc)
> > > >       return 0;
> > > >   err_out:
> > > > +    xe_guc_stop(&uc->guc);
> > > 
> > > If exec queues are destroyed later—after the submission backend has been
> > > stopped—the final put on the queue may be lost, leading to dangling
> > > memory when aborting the driver load or unloading it.
> > > 
> > > I think you'll need to call xe_guc_submit_pause_abort somewhere to
> > > ensure the final put cleanup messages are processed by the queues. Maybe
> > > we add this call in guc_submit_fini before wait_event_timeout?
> > > 
> > > Matt
> > Thanks for review.
> > My original thought is through xe_guc_stop/xe_guc_submit_stop/
> > guc_exec_queue_stop, where will do clean up, might be not covers all
> > conditions, let me try.
> Tested with call xe_guc_submit_pause_abort in guc_submit_fini before
> wait_event_timeout, works in some condition, while there is 1 condition
> might not cover: for lr queues, it won't clear, so I'm thinking of:
> 
> @@ -2375,7 +2382,9 @@ void xe_guc_submit_pause_abort(struct xe_guc *guc)
>                         continue;
> 
>                 xe_sched_submission_start(sched);
> -               if (exec_queue_killed_or_banned_or_wedged(q))
> +               if (exec_queue_killed_or_banned_or_wedged(q) || \
> 		    exec_queue_registered(q))
>                         xe_guc_exec_queue_trigger_cleanup(q);
>         }
>         mutex_unlock(&guc->submission_state.lock);
> 
> @Matthew Brost <matthew.brost@intel.com>, Do you think this change has side
> effect to migration worker? I can make it another function if true.
> 

Probably actually just change this function to forcefully kill all exec
queues, i.e., call guc_exec_queue_kill. That is likely what I should
have done in VF migration from the start and what you want to do here.

Matt 

> Regards,
> Zhanjun Dong
> 
> > 
> > Regards,
> > Zhanjun Dong
> > 
> > > 
> > > >       xe_guc_sanitize(&uc->guc);
> > > >       return err;
> > > >   }
> > > > @@ -228,6 +229,7 @@ int xe_uc_load_hw(struct xe_uc *uc)
> > > >       return 0;
> > > >   err_out:
> > > > +    xe_guc_stop(&uc->guc);
> > > >       xe_guc_sanitize(&uc->guc);
> > > >       return ret;
> > > >   }
> > > > -- 
> > > > 2.34.1
> > > > 
> > 
> 
