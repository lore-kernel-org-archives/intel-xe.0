Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73999D5B866
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 18:40:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB8710E041;
	Mon, 15 Dec 2025 18:40:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HeXiUf03";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C51710E041
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Dec 2025 18:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765824004; x=1797360004;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xe473v3VO7yCMgrQgB05sy8OVyXb8BGIEkV2IDcf5W8=;
 b=HeXiUf03ISZqMLiiTP2pMRuaUdGW5qyL859uJ3I0K++uKl3Q61dIiSrx
 C4MG7DZSo9nZxkW+9aisAsZgyRHbU8SLHrnfCZbHT84C1Li2vy99IxRTq
 +BftTt9VLUxtXDH9EYITd61DUrov1BUfCq/Q+bV7sGvC2uapQZ9ppKzw3
 k3gImR0NQRzI1QD06xdnDNzlRH/13iR8OUPD22BZrvhO4DKZzOiIBWr/k
 QdAHCk6a2WByQd2+Qo+lVT0S451TnvRgaVn6WdzGJtxdIg7MYHfakvSTA
 UWMFkU1MCMZ2aQ7aUlRkihsUSYGi0swgM9pGGUxSYYExJ6B4qBffJukBk g==;
X-CSE-ConnectionGUID: jWPR6SBzT/mDmX8NzGmrpA==
X-CSE-MsgGUID: QrAMNQDETzSHRRwiv1XqmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67612113"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="67612113"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 10:39:56 -0800
X-CSE-ConnectionGUID: Hv6bLyZDRi2FGSoqdtmopg==
X-CSE-MsgGUID: 7gUyahpTSOuAfysmn27wWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="197068430"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 10:39:56 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 10:39:55 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 10:39:55 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.65) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 10:39:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KzQQoroUs5j9RipXRvemq1SW/Tlbpg7Md7A0rxuHxI9hSmtzP8cPhO11U1lhZ6+wxrZ9RSanGD+hbPVW5SEOOkWx3lVXgR9QqmNxT/3T/kvVo4+BmOF+DE1ls9f0ydnpnFTT66mEJnRt72ndY4sO80OpaPMOSULvKQVrSop6235agdXy37TUdMYNJaQ2LO6NayNIFuHkkj/TnXVJZXDBIfEhDBQ17TNpQf7JyPUs84HkoQTx3nBLO0CrsGqGzHYTdDtK/U9jg+DU8kZQahdjxyM1k2UiogFagzksG+uTKoV5bqDM3+bP8LmPp3c0NE7GPl43vhdh3OuH8Ukt+DKK6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ffdxHLuTe2LLyLE21uRNK9sDde4M1m+tSItgzuO1DiY=;
 b=EECCKONq1mDo4w4uLPWLJF2+K7KLL2UR4wAq6XA7FLtN8tEFC310R5PB0OE0m48OiJDA8TyRJtW7xRZd7HOJ5rUT349EH3xhl98TYu66fKF73K9jrSkUzn2XF0tth5vBykGCm7+5omDzc/70vKQXhTQoo4wTgZDkIjxVA4H3v1LjGTkxBXeqVoiHZZh10iwWUQPQ3p/DwIMWbPcvPdovga2kjfvZlVZjerYPhdQMezqcVBwBtz176gvT/kFX7FYphVDaedUDA4HwWkJYuPUgVkd3LjSS2SpyL2JsQUPC8WJZSKsitoY3LZBQxd8NL8ERpQZ1Nzi+FCLf65UGZ6QoqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DM3PPF5AD378C3B.namprd11.prod.outlook.com (2603:10b6:f:fc00::f24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 18:39:52 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9412.005; Mon, 15 Dec 2025
 18:39:52 +0000
Message-ID: <84f58059-1573-428a-a224-835ef5fea22d@intel.com>
Date: Mon, 15 Dec 2025 10:39:51 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Fix version check for page-reclaim feature
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Brian Nguyen <brian3.nguyen@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Shuicheng Lin <shuicheng.lin@intel.com>
References: <20251215170433.196398-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20251215170433.196398-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::14) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DM3PPF5AD378C3B:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fc14282-b1a0-409a-852b-08de3c0955d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnU5K3JFRDhLQ3RvOFZuSnFWVnBpcHVXQUduaThjUVhpZGhPVHRkODlSQ0ZC?=
 =?utf-8?B?UnowZUIza3l6UFVHcVp6bVc3QXpIM1pEQ0pMUm1ydlZrT3pmQ2Fsbi9nNkNP?=
 =?utf-8?B?bW5nem1hRVFlTGVwSHFualhvMDJQdi83SjlKV1FyM1h6OEduRkplU1pRbVI1?=
 =?utf-8?B?YWMwZUF1dTZDZnU2RFFSMWZDNUdPODBPYlkwVGJkWnJYSXZIb01wNlVZanIy?=
 =?utf-8?B?QzgyTi9lQWdCZUlCWDRoOC80Qm5CS3paM0pVZkhOZkRlY2gwU21YRzc5S2Vt?=
 =?utf-8?B?R3VTQUhtbkRIRkRlSW5lRmJsN0ozZHJGSzFlZFhaRmZKRmxJWTdhNlA5QzlM?=
 =?utf-8?B?SUYvZWpPb2Z2QWtHZG4ybVpCOGhDS0dsUHdNbXZTbUYrY0lqY3VvMUV6N3ZO?=
 =?utf-8?B?TkZ2alpWc3dvcjFHNlNDSlRRQit3MjBpK2FYZ2VHdExJWG40UnpWS0dQOWVO?=
 =?utf-8?B?R2ZFTUljeGdSVmdFaFhKZ2hEM2x3a0V2MnBVTGVvamNKemRuVkZLNkwyZWNk?=
 =?utf-8?B?T08vZzA5TGNpb2xxcDBXWTgyY1ZURHlVWFVoS3NNN1dDbUNjNDU3S1Fqbk5q?=
 =?utf-8?B?SDloMnppeE9HL1NPWjN5TG9EcmtRMGpyWGlDRzE5Z2FvQVlpbXlZeTBsVVl0?=
 =?utf-8?B?UWNZMFJCTmZGaEVKaFZaRnEzYjJNamJxL3FkcE14amxTQmFmd3FDMktDM1Zr?=
 =?utf-8?B?Tm9vdHpJejEwdDlxcDdRMlJRTVpnWjBRRnkxTjJHUHJLUXNPU3dyMHgxckpu?=
 =?utf-8?B?OGJ6Y0N6NXZ5dUdtblh4SWdaeXgwemNKYUY3OGNFNStWdEJNNWhsVGxVU2NK?=
 =?utf-8?B?SWU1dUM3dURkNVFYczdBcFNFWXlWTzl4emxOc2U5RDJKS3kwM2pQUXJ0eGtU?=
 =?utf-8?B?YytFclZmcjRjcmdOMzgzOHdFMXEyZi90elhQVVpndnVpWkZGb2FKNkQxRmF2?=
 =?utf-8?B?WEF6ajlVNGRWRURWanhCVnFkenFUeElnMkVpaFEyOWhpQjBQYXBtc2VvdFA2?=
 =?utf-8?B?TUk5N05FeXZUanoveFZLN3A3U01Uclg5R2Y3R01UcXZxV3NvMGRaaW5oZU1l?=
 =?utf-8?B?dnVPRzNDN2VFcVI5TmZ2MVVMSFNaN3U2TkdkZmhFcGJZV3FYa0N5c3AxenVJ?=
 =?utf-8?B?eFA0ZWRkelhwK2p3RXZzbk9kOFBLK0p6TVU4SGIxbm14Skg0OUZiTEU3OWRp?=
 =?utf-8?B?ZU9tUEJGSWVFNG1pYnE0eWFheUtGcjN5N1BYUUViZ0FPVnVweVZabENNYkFN?=
 =?utf-8?B?ZVlOdHVSQmJRU0dRajc2NlBxeFJNc2lRTWFwY0RJemNrRzV3ZlZnL0JYNEhC?=
 =?utf-8?B?OE1aSVhwZWxMZkZ6ZGlIZGVnRFo3Y0hla2NLQVl5KzZoN2NGREZqY2trVjU3?=
 =?utf-8?B?bm04bXlFbERDKzVRQXlLY3BMclhtQ1pHVGdnQ3MzTWc2WkhJcXRleVh2ZGt5?=
 =?utf-8?B?M3h0elJYeXdWdU1SUWdqY3R1ZEF5S0JFOTByViszckNHamptaURBTTEyZkpL?=
 =?utf-8?B?SkpqZkFNaHpIeTh2K0ZBMXIvMWVUZkZNYTRVVFBSMWNJWmFLK05UL0pETkF4?=
 =?utf-8?B?aVBiVTczRzNNaHFnOTJ4VUt6ZnQ4d1VHRElKRFFlV1dnTGwyTWdPV0VtVHJL?=
 =?utf-8?B?RkdSSVVlVmhkaVd6cmE3OUM3OFFEUmlvQ1RUK3VwaE9lU3YrL252djVia0F0?=
 =?utf-8?B?b2t3R3VFSFQwVzh4c3Z2bWQ4eGk5SVRxdHU4dGVsMk9tcE5lM0UxbVV4eWUw?=
 =?utf-8?B?U2JDOEVHWW91TFJwZDNkY21oTFhZUE9lUHMyUi83bzQvTHpoaWdZMW15cG1K?=
 =?utf-8?B?dmRJTFl4ZDFTS2lLWEk4Vkd2TWpseENURDRMbThLWm5UV1ZrR3dpNFB6ckRx?=
 =?utf-8?B?UE9ZWEpzUmg0d0prK29DK0hXM1dyUm1ubS9UZGNvR1lBRFZPZ2MrMXZoMURW?=
 =?utf-8?Q?4sD8lpgFnblzd6G5BCIv8JGRyANHyO0e?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STFEOGJ2TlBMZzhVc1p6ZWo2TVR5Z3pxN1VzK0xpU1lheHhLdEY1eWgyNW8x?=
 =?utf-8?B?ZTQ4ejFOVnBjb1EvdzJQOHBLK0JlTHExY0NhcngyeER5NE5yYmtCNjNicmh0?=
 =?utf-8?B?TWJ0Y0tOMjhQTThsbThDRlM1eWRDbTU5MWRwSXpGV29zS2hFTnpPQ2E1UjJv?=
 =?utf-8?B?NERjd0M2a0pyQ0JRRFBsZmEwZm05OEVwbkdRdE1oSkdISkRBN1hzL1lTQ0lU?=
 =?utf-8?B?Z1psSmtMUkI5dUVVUTNYakVVR2JJNHlhQ1hhUUxFenhVaUpxSDZvWjNDc3V0?=
 =?utf-8?B?MUE1SWNnbE5ubklpVnNEMXNPWThFN2tSRnY4V1RZOWdkVFk4WkEyUjFCU2VZ?=
 =?utf-8?B?dXpod0Y2b1dBdkhneWM4V3prcjZQeTAvUXJJYlFheWorWDB4Y0R3cVdseEtK?=
 =?utf-8?B?TGwvYnlYR2RhY1J6cnR5SVVwRWRxbjZVTktqNFVsSzdyb1dodE9uU2ExUFhh?=
 =?utf-8?B?UUQxVWY1YXd1TUdyNGRXdG8zWW1RTVdhRjBnOGVLa2V6UFJnUXFEZmhWdWxt?=
 =?utf-8?B?Z2tHVjQva3ZIZjBLQ0xvUGZydm03L09MWjc0Rko4WDcwK0FmNGg5YUJ3Z3NL?=
 =?utf-8?B?aDREemxzZXJKWFFBOHB5ZFNSTDhHY3A1VE1kT08zemplcHJ3eEh1YTlNcDR2?=
 =?utf-8?B?SU1XelpHT08xUXdQVmN0N2RtcTNEUjl3aGZTU3lUTXZDYjQxTmlXOTBNQVRK?=
 =?utf-8?B?amo3N3BlbTBUdWhOQzY4YVhXSzltVTU4b2xzVnBGejFOVWJqYmxnMk5PNGNV?=
 =?utf-8?B?U0ZQVzhhbm5VWEE0eG9WaTBtQUlackVicWRCSzI3Mk03dnFBdHNnTEppVzJj?=
 =?utf-8?B?N0hURnFUT3JwTGlNNm5oV0VwVGRHeEhxTWZyLzB3QzVITzZKbEducDZ4ZUZU?=
 =?utf-8?B?OWVsUXZWSzA1WUU2UmxyVHF2ZkRpUTBNVjZtYWw0Tko3Q2pUbXRUVjRhUGVU?=
 =?utf-8?B?MlQ4blFqYVU5UDdXS0Z2cms1ZjgwQXdydjM3QzJwejNKcWVXR3BJUmxzMEt6?=
 =?utf-8?B?Vkk2RmtqUkdNUEpGNk54Nndjcy94aDlqeXFrZ3hDK1orZlJYNEs0M1NFWSt5?=
 =?utf-8?B?T0pHVE9wVUdFZnhCNDdYWjRpUFZhMnlaY08xS24rWWQ5WlVBTXVPdXBpOFNo?=
 =?utf-8?B?RGhEQ3RmUFRiSnNaYzhxVlQ5RHQwQ2ZDVEs0UjUrYlB5dWFsdzJ1a05BZFFO?=
 =?utf-8?B?ckNKampIeXF2dHQwZkVKWlkyQ0NEaDhaQXB4WmhieXNlRFhaTzVUbUlMRGFO?=
 =?utf-8?B?RkZONVhSK2l6VnRaeGRjRDJadWJXbWo3OXgwWDVEMVpseWNrK25POUI4Y0M5?=
 =?utf-8?B?dmE1NGlTUXB3QXRiK0RFWUVzN2xLRkpVUkhWdGtsWHRaTFMrcFU2UmpQdURU?=
 =?utf-8?B?ZWU3V1c5byt4TGcyQU0zVi9nTjQ2blFkMDR4aDg0dnBxTWxWZFZqS0w5U0Yx?=
 =?utf-8?B?dm1sL1Y2TVJIMHBlNzJWdHQ0eFFoOVRGLzlLcDdiYXdBTVdXMVlxbUM0d2xW?=
 =?utf-8?B?UDR0Y29aRlZpMzloU2VQWkMxc2gweEhhdFhyZkhTVEhMNUpIZW9STStyNTB3?=
 =?utf-8?B?VGlyc2crQndwYjlmNUZEdys2QjJLQkZjY0pMY3lzZXR4OG41OGhGQ0IweXRZ?=
 =?utf-8?B?KzVjQld1TWExUFU5OWh4UnVyK25ocDlrL3U5RmFobGxJTDB0a3IzMlc2Um4y?=
 =?utf-8?B?T2MrQkpoTkZ3SGZxQXFmSmhIQ2ZFblJBdFAyUFROTzFUNkFyb0JoRHByRHJj?=
 =?utf-8?B?RnMzbnJTMWNoeGJTWGVIZFR4ZDBaQi9pZUEwNVNseGFjRzFCRElKZDl0WFR6?=
 =?utf-8?B?VnhBcWJpa29McFgra2NEVWZPbTdBaGhzWFNCelJGU3JrU2sxYnVrdkpnZ05l?=
 =?utf-8?B?K3kyNk10SDlsQThZTkZwQ2g0MkFSeWI5VmdDdktHQWdveHlGblFwcjNGRm1w?=
 =?utf-8?B?TzZtRk01U2R5QlFlRkFMU0dFL3N0QWVIekdBMmZYMDNLMkVQdmJwWmVjWmsv?=
 =?utf-8?B?M21qbGRjNjRMODdDRnh2ZFJzTnBnV0pld1BkdENTMXdRS2ZndEc5MEpoeE1t?=
 =?utf-8?B?Mkl5aHQ4bmNqKy9LSzFGR2ZJUnVwZ3NnSXdyVzNRem1abS8vL2gyRmlmTnk2?=
 =?utf-8?B?MzVIbGd3S2dFZXFSeDRIOFFsUmxxbFc4cEEvMkswcUN5YlRmQmVBOGtiM282?=
 =?utf-8?Q?SmYAQ0akKwdNGLFOz2Pk9Ho=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fc14282-b1a0-409a-852b-08de3c0955d2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 18:39:52.7040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bopGlmplP4bE8rCUGC4S2CWPeM7cQnzIqNZag9bANDytpMt5mjwa7eNrbpjOfQJxle8HQv8yuS6Ft4UPIfZfntF8+dJ8sntokVOuXN4SZ3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF5AD378C3B
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



On 12/15/2025 9:04 AM, Michal Wajdeczko wrote:
> Page reclamation interfaces were introduced in GuC firmware version
> 70.31.0 (which corresponds to GuC ABI version 1.14.0), but since this
> feature is also available for the VFs and VFs don't know the firmware
> version, use GuC compatibility version check instead.
>
> Fixes: 77ebc7c10d16 ("drm/xe/guc: Add page reclamation interface to GuC")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Brian Nguyen <brian3.nguyen@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/xe/xe_guc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 7daae3294665..09ac092c3687 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -768,7 +768,7 @@ int xe_guc_init(struct xe_guc *guc)
>   		return 0;
>   
>   	/* Disable page reclaim if GuC FW does not support */
> -	if (GUC_FIRMWARE_VER(guc) < MAKE_GUC_VER(70, 31, 0))
> +	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 14, 0))
>   		xe->info.has_page_reclaim_hw_assist = false;
>   
>   	if (IS_SRIOV_VF(xe)) {

