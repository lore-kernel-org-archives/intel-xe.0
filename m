Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEED6C3DA62
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 19:20:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8078D10E355;
	Wed, 17 Jul 2024 19:20:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q5tkcBQy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA31210E350
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 19:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721244011; x=1752780011;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=E6W6y/s+PDCQQaIcu12kNFheM6Jsf5N9OEy0wWHqmgk=;
 b=Q5tkcBQy/1duFvny1YbTAGOdpinbUL6SrB8QkpJ9FmBkyxrDw/bf6ZiZ
 1tbZaf+USiHhTbPMht02+KXBn/bdsfepG4+v/9JcwkWD4Mp+s/bn6dmec
 39nu4bkvhDRwwV6QtCGkjt3SVevnV2oyD/BR079OAAG56Z6Fzq8Txig7i
 bihfUGm7IC/OUVgQcyGLM17tO0yFBNwEf7pS2VumBE9HdHmMC1Ldrmti8
 2i2IIYOU4LDqgTrFcmHo/T+I+YPwcld3iPdb9GgOJdBuly8EL/P7K8vd8
 hFmhPF6mQLX/+ywT7fOiN4EsAE2cLnTjn1nywqx/gZXewSiXL/zOz6vBh Q==;
X-CSE-ConnectionGUID: uYKukKZ0Tm+KX/IUY0dYeQ==
X-CSE-MsgGUID: TI62eqGDSRe7qskgGeD2UQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18389628"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="18389628"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 12:20:10 -0700
X-CSE-ConnectionGUID: e73z5n9lT1ShFwGWNhGI4w==
X-CSE-MsgGUID: kM5qWQTVS3+1yKSIz8HNgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="51220136"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 12:20:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 12:20:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 12:20:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 12:20:08 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 12:20:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c3Hph4uIeClO+y5rfdS7Wbh2YPKlzo5ufFUGUUqCXAuyvNgehv0wXHyIfyfca/EKeAHrmsvkvcNxe++mBp7sgkMfurEjEAEDJyjAVFBj2Qqj539nRpvSrdU+CnnLjL5sLmpK2emaX0gnfKRHwfDFy5V2tDXNvOJ/vgjEAmGtp9C1kNpLUikevGCxbqMxd2W+Sdp9Sh4Ep1JlH+kCILa5SKiQEiKw7Xa1rOe2wiqq1fuvM2PV792MVWpo/y/0lXtQ/KoQ+fsw7CZHpUrgF3DikC9VbJqoyQZCxrh62LtwDgF7jvPZJzrSpoUBVTQLsAVTdZoy/2fu9DnwfhzHcaeb6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0PPb5UszVs6o+SDM9K/GeuErKEgWThWRRrajek45O7Q=;
 b=l9GFNYtUZNn4NnR/ltaNAIUnrSknWu0R+CIS+rkjmWY/sYts3/B/9sJlAdQLKvZwZWtfgOKQKRr7PQ7PBQI+FOHYQZkumjKdFqxEoncbt/1WLGNXvGwjye+FwImlxD5vMwkZV4aA4qlD842B7ZqUzysJNPdspYqi7hdQCYN9SfPSNApS1HITIsiFJViAVAF5lPFcJCYtW+7tcS4O1A/LnqJgmYaJyEIx0uNwDqQyOKs+MGc5XTziy0HVrPGNgnweXJz5fmUgnCr0vCmRn2+gnIQ22QnXhjbt21qd1I2WBDwBcabPIVN62DxsxUnItprTD7hW2jbikWunnQInhV7/6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14)
 by CH3PR11MB8383.namprd11.prod.outlook.com (2603:10b6:610:171::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Wed, 17 Jul
 2024 19:20:06 +0000
Received: from CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::ae3c:acd2:8d33:99d7]) by CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::ae3c:acd2:8d33:99d7%6]) with mapi id 15.20.7784.016; Wed, 17 Jul 2024
 19:20:06 +0000
Message-ID: <364c0a7c-aea8-476c-bac0-365369610725@intel.com>
Date: Wed, 17 Jul 2024 12:20:03 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/8] drm/xe/migrate: Parameterize ccs and bo data clear
 in xe_migrate_clear()
To: Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <akshatajahagirdar6@gmail.com>
References: <cover.1721193361.git.akshata.jahagirdar@intel.com>
 <2d4fb2f3bbbd38180b878f00775c9df5a5017b2a.1721193361.git.akshata.jahagirdar@intel.com>
 <Zpe400axUhGEfIrE@DUT025-TGLU.fm.intel.com>
 <4de49a7a-8fc1-4600-b124-f953f36372e0@intel.com>
Content-Language: en-US
From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
In-Reply-To: <4de49a7a-8fc1-4600-b124-f953f36372e0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0102.namprd04.prod.outlook.com
 (2603:10b6:303:83::17) To CO1PR11MB4977.namprd11.prod.outlook.com
 (2603:10b6:303:6d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4977:EE_|CH3PR11MB8383:EE_
X-MS-Office365-Filtering-Correlation-Id: e8d3ef65-2c4b-4690-da00-08dca6957729
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0M3NlBGWEdvRDJvMVFjajh6OGptd3QxQXBMQWRmY3g2K2R6M0l2Nk9CVk9P?=
 =?utf-8?B?NnBWMXNtd3Evb3JrMjRoaXhGUlNhT0h0QVE2N3J1ZUU1Y3d5SWhaZW1hZ1BX?=
 =?utf-8?B?eElpR3hFeGlZV2VuQnNHbk1rNm1SSlR1VTh3VjdnWDdIeU9JMVFkY3lpMGlX?=
 =?utf-8?B?aWdOU0pTaHV3Wnl5NUFGeWVJczdTaDd4YlFyUGZIb0RrVTFvSWxNc2t4dkxB?=
 =?utf-8?B?V09kMzRrOWcvRW5keU82MWRrQ3lsanZSRTg3cHkyL0pFL1BnVWZsa1FueTRZ?=
 =?utf-8?B?ZGVlc2p4Rk9XVE1maGxuSXhtb2VucXpTWUtiU0s1R2NBOTR4UlNIQnFPYlZx?=
 =?utf-8?B?Z3E3d0tkMXdUUW1CbjVnT1RpMzdFanlHM2hJSm50R2ExY3VPOTFjRlZrT3hV?=
 =?utf-8?B?VndyQm5TUTlUVVF6UDNHMWtlNGNmK0EwbjhLaFVEcEtWaUI5WFpjWmZrSThU?=
 =?utf-8?B?MEFwSTVWd2VibkJIdjR5V2RMNTlHL25mTmdKamQ2TlRIT21PWFl0WlZ2M3dW?=
 =?utf-8?B?UlhYZ0VDZWowUzEwYkFwcHhmdnR0cEpFcnlsUHQ5RERuSlByb3VPemYxeUxX?=
 =?utf-8?B?cDkwRzBTZWR2eW92TXhFZ2l1bk1XcnpGT0xrMGVYbzV1OG9kL2NNdXZjTGlX?=
 =?utf-8?B?WkgzYVBTczlBUGxueW4wYUl1WSt1QU9CN1dTSnU4WVpyUy9XKzBwQlA5RkRt?=
 =?utf-8?B?aEV4SmhuNmFlbEJpTlQycHJIRXlSemtEUjBhUFlDVW1jR3d5VHZSZVJCQVQv?=
 =?utf-8?B?NCszSEpSOWV5dlRwU2xwWXNlOTZyaVZpc2RjUlFFZmh5emw0cUIxRG5HbW5G?=
 =?utf-8?B?dmNMaUVrVlQzejA1M1BsR0dPZlZSb2lmMGZjcVdrdUg1UVFQOXNtWTB2ZUVj?=
 =?utf-8?B?ZWVvVkw2STA5OVlTVzB0akxBczRYNFVBRC9aSUVwT1NvZHJkbmo2cFpzclVN?=
 =?utf-8?B?UEJHSjF3ZHlzSHVSRVREZ2hYTlNRMkVMbVJZUWtWSjNKTVFOL2JndHozQkpo?=
 =?utf-8?B?L0xNQW1TZW80bXAxQTZldk1Yb1FQTEI1ODhGeitlcUhndnl4ejM5ZHF3ZFFj?=
 =?utf-8?B?QmlLSGlaM2REQnRpU1Z3Y0txalk4N2VBV1U4VnFrNDdsak55SmsxdkdORGth?=
 =?utf-8?B?dWpzdlpESm5FU0wvSFVaMlZUckFWYXZaeElIYXNkVWhvQzd6MC9qdjRKUDY5?=
 =?utf-8?B?bVB2dFByZVhJNDcrTkpHZ0N2bk9JZWV6UnQ4Z3loaEw5TDJxbURqM1FyMXFQ?=
 =?utf-8?B?YzZMd2dKeDNYbC82VkxVRXN1L3p2VnU4dDM3RjM4Smx4dHFwT285N1pOQzlU?=
 =?utf-8?B?d0tncDNHd1F3eFp1NTdaZ1JHam5tZFE1UWFEamF0d1U5anVZUFNqMDhJSTda?=
 =?utf-8?B?Mm40Z2FEVEdwbi9sNnR0NFpFYktIeDBJS1pRQnIrVVFEbDMxcCt2bmhPajRI?=
 =?utf-8?B?d1k5Q1ZJL1h1UzZMOEpxNVpHYXNKSFpBcmJoZzRZc3VibVU5YzE5TEtlT3Zv?=
 =?utf-8?B?eTUxZG5ZVmRqdGZWY2lmOE10ZmpSMllVak9COUVLRmdkRkIvQWdHQndXUEpI?=
 =?utf-8?B?b0FLQ0dvRi9VSTJMaXFHOG9PbTI5NUZGbVk2QkUvRWVjMkcrYzN1c2IrT0xB?=
 =?utf-8?B?M1dSSzRSWUVYNGVJU1Z3M2VCZDA4ZUZINVdibXlic2ptMGptQmhoQXBOY0NW?=
 =?utf-8?B?NkRwRTl1djVMWGJKWEljSFh2UjV5RWQyRm5nYXpmM05CY0x6Q1FaS2Y5VGRp?=
 =?utf-8?Q?9+cZ7xnhEF/Zb4ZuAc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4977.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHJSaThyeTBXaTdVSFc1TytKOXpNRjdHNDBKaVpvNGpuVFNSM3orQk85UXU0?=
 =?utf-8?B?T0d3VHpFMlpIVG94OTc1UExhWDdRN2craTBwUjJ6T0JDWGErYzhsQisySjVC?=
 =?utf-8?B?L05QbSs3NG9LY0l3T1hPK1VvMXBIL1FQS1BQZjQ4MWlYUWZ4elhUc1RRd1Vq?=
 =?utf-8?B?UjlILzdoNmZrWkRhWjIzN1UvTXFKSEVQS1BjaDRjbk16NzdtV2ppWlRJa092?=
 =?utf-8?B?WHFMVjVNVmw0R2ljZHJZZTRNeHMrN1pUU1lsNlIxSlZiaXNReVl3SUJoUUNR?=
 =?utf-8?B?VmlGeXNWUVhpbGc3VmVpYnpjVkdNSjZtZVBZWm5ZRnlFblRYbWdreEQ4WCtw?=
 =?utf-8?B?a3hydzd4R3BoSnFiYmlJRGgzYURRNGN2R0pTaXN3bXNIVVZEcmZoSDZWc1Qv?=
 =?utf-8?B?bDFhNnhHL21EdjVDZ0Ercnp3a3dNQVlGS0o5cXphTzRzRnZRWG5CMEc3L21l?=
 =?utf-8?B?NngrS284VFhSRC9ONWRRRjE0eXJEZm05cUJicC9ZTmNvYkRsZG1RVzFmL205?=
 =?utf-8?B?Y0FIV1NSME55NHdJVXpJR3owOWVvTlRhaEtGaC9CL01KV2tkTnZxWmp3MEpV?=
 =?utf-8?B?d2NpRzI1Y0Nqa0ZCVkR2YnVEYmtYeXhNWjJnSWFlTUJtYnBHMDFyUkM2R0hE?=
 =?utf-8?B?bzhGaWE4WENIZnFJL1B3azFaVmNLRjc4K0twY1FhME84Rks2WnVocWZyU2lG?=
 =?utf-8?B?RlY5ekg4M1JhZ01JbzJwc3NuZmp3NWZ6eWZqUFp0WENTTU1ONlE0U1QxTlBH?=
 =?utf-8?B?V3RYM0JKcGV6NE5rYUpjVDAwM0w5OFpYSnFXd0xuSjltcEJISExscmZZRUU5?=
 =?utf-8?B?b3pRcGZROTJubThSS2RpNlhlYXJGLzdyaEZiNytHZXU4RmkxTnhZNzJXUDZo?=
 =?utf-8?B?cnVFenFjbExPOWdjWHBNTkVMWjdHaVlKMTgyOGVraEp4VnJuOGhueG8wK1RS?=
 =?utf-8?B?MWxGNEVGanRTUmFjQTRzM1p1V0paUzdSbkJHeTRVUE5jL01wY2Jnd2VRV0ow?=
 =?utf-8?B?eTFRZnVyRzBaTkQ2dVNBdTN4bmtRQ1BHTUpVdXF5MVUxTmUwcmQvUEpyNjZm?=
 =?utf-8?B?VmtUcmRBZUVtWmRlMStLbjQ3N3h6bk5MRC9jaXliN09tVHIvcFFhWUZZajVo?=
 =?utf-8?B?a29CKzRtcU1TTHVOZDFObGJWOHYvOUlsZmplaU9WZTY2SnhnWmVvc090QmRk?=
 =?utf-8?B?STN6bm1FNk5iVjNaWmI0S2VXODgyMVcydUpteFYzN2Q0d0tQclFpRDRkVUZp?=
 =?utf-8?B?eTlLai9VQldvQjRkaFQyN2pyWFowVndKc0VzK3JBUWkxSGJQOGhWQzEvM1Va?=
 =?utf-8?B?eUxjWE51eEk2SiswZU9oSERHekFoOUlCak9kOERLTHQ0ODdBbWtMKzk2Q0hK?=
 =?utf-8?B?Z21rZkRYeENwaU53alpIam0rbVZXSUZDelBEN0VybnI5WVRKWGpGN014TTRK?=
 =?utf-8?B?UTVwb0k1SmtNTytPbUVVWlEzdFNQdWl6S0E4S3VMQ2h3MUdKKzhiWWlKaEZU?=
 =?utf-8?B?dlFUOWdNdXdNU0F1RE9VSzZXZ3pUa1I5THRabkdXSCtSVDRhREc3Ly9XYkFl?=
 =?utf-8?B?WXM1NHNhdzhmd1JodXpkWmdiYW5YWU5YUzNHbzNTUmJTR0tkbVhmeXd1eHRm?=
 =?utf-8?B?Q1pwUklHK2tyWnI2eEU3RUpSZFVNZTNwRjBWWlIwSjdlbHdrajVOSllFVS9O?=
 =?utf-8?B?S29QNFUzd1NqR2ZBbTJqM1JhemxSVHd0VEgrTDVSZ3JDZVlFY1lLQ1BaR1Y5?=
 =?utf-8?B?T3krNFpQUFAyK0ZLR3VZY0VsM3Z2aFkrbU9FcFNSSGJZaERCYklQOHZzaW14?=
 =?utf-8?B?WDhmNGJNOFFqRDRZaFMrckVSODlta1B1WCtGd0M1QVBNbU5jQlF6ZWUzc1ZV?=
 =?utf-8?B?TVZsc1Y0ZGJvaVkxdVhLTnUraGF6NFUxRlBObE8rKzUyVm02UXVneS9UUGg3?=
 =?utf-8?B?eFc3WmhWUmdaMDEwMytVNjZ4S2toRHRjRm1qL082WVg3S05yYmJ2RmVNd3Q0?=
 =?utf-8?B?WWxlOWMzdGMveXpvM1FWU29JdWJhaEF3and6OGthRWJ5L01Td0RTQXlPYkJr?=
 =?utf-8?B?VTUvUW1HNWtLRXE0emk5KytwVWV6aC9BclNjSU9vUDY3WTNrNDkwS3ZtcFRl?=
 =?utf-8?B?T28rWVFiVHlYR2ZuS3JVdWhzUVk3TElhSnBnK0JiMjVyVnErekJQMjJzNGlm?=
 =?utf-8?B?MGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8d3ef65-2c4b-4690-da00-08dca6957729
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4977.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 19:20:06.0480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nEuYPXpCHm8crQ1OmJIpBr+mF10GbEanCk1Lnsp56unHEwtZLRGmj4tpCEPjBnDT/JLa0YiLWJReztB30G+gijPnu28ZvjyQsibUA3ljNm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8383
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


On 7/17/2024 5:49 AM, Nirmoy Das wrote:
>
> On 7/17/2024 2:28 PM, Matthew Brost wrote:
>> On Wed, Jul 17, 2024 at 05:21:33AM +0000, Akshata Jahagirdar wrote:
>>> Parameterize clearing ccs and bo data in xe_migrate_clear() which  
>>> higher
>>> layers can utilize. This patch will be used later on when doing bo data
>>> clear for igfx as well.
>>>
>>> v2: Moved 2 bool arguments to a flag argument
>>>
>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/tests/xe_bo.c      |  3 ++-
>>>   drivers/gpu/drm/xe/tests/xe_migrate.c |  8 +++----
>>>   drivers/gpu/drm/xe/xe_bo.c            | 10 +++++++--
>>>   drivers/gpu/drm/xe/xe_migrate.c       | 32 
>>> ++++++++++++++++++---------
>>>   drivers/gpu/drm/xe/xe_migrate.h       |  3 ++-
>>>   5 files changed, 37 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c 
>>> b/drivers/gpu/drm/xe/tests/xe_bo.c
>>> index e2e0ea24757a..c6db62a07276 100644
>>> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
>>> @@ -35,7 +35,8 @@ static int ccs_test_migrate(struct xe_tile *tile, 
>>> struct xe_bo *bo,
>>>         /* Optionally clear bo *and* CCS data in VRAM. */
>>>       if (clear) {
>>> -        fence = xe_migrate_clear(tile->migrate, bo, bo->ttm.resource);
>>> +        fence = xe_migrate_clear(tile->migrate, bo, bo->ttm.resource,
>>> +                     BIT(2) | BIT(3));
>> Use defines everywhere. e.g. s/BIT(2)/CLEAR_BO_DATA_FLAG
>>
>>>           if (IS_ERR(fence)) {
>>>               KUNIT_FAIL(test, "Failed to submit bo clear.\n");
>>>               return PTR_ERR(fence);
>>> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c 
>>> b/drivers/gpu/drm/xe/tests/xe_migrate.c
>>> index 4929af88e75c..ac52bc4d2c51 100644
>>> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
>>> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
>>> @@ -104,7 +104,7 @@ static void test_copy(struct xe_migrate *m, 
>>> struct xe_bo *bo,
>>>       }
>>>         xe_map_memset(xe, &remote->vmap, 0, 0xd0, remote->size);
>>> -    fence = xe_migrate_clear(m, remote, remote->ttm.resource);
>>> +    fence = xe_migrate_clear(m, remote, remote->ttm.resource, 
>>> BIT(2) | BIT(3));
>>>       if (!sanity_fence_failed(xe, fence, big ? "Clearing remote big 
>>> bo" :
>>>                    "Clearing remote small bo", test)) {
>>>           retval = xe_map_rd(xe, &remote->vmap, 0, u64);
>>> @@ -278,7 +278,7 @@ static void xe_migrate_sanity_test(struct 
>>> xe_migrate *m, struct kunit *test)
>>>       kunit_info(test, "Clearing small buffer object\n");
>>>       xe_map_memset(xe, &tiny->vmap, 0, 0x22, tiny->size);
>>>       expected = 0;
>>> -    fence = xe_migrate_clear(m, tiny, tiny->ttm.resource);
>>> +    fence = xe_migrate_clear(m, tiny, tiny->ttm.resource, BIT(2) | 
>>> BIT(3));
>>>       if (sanity_fence_failed(xe, fence, "Clearing small bo", test))
>>>           goto out;
>>>   @@ -299,7 +299,7 @@ static void xe_migrate_sanity_test(struct 
>>> xe_migrate *m, struct kunit *test)
>>>       kunit_info(test, "Clearing big buffer object\n");
>>>       xe_map_memset(xe, &big->vmap, 0, 0x11, big->size);
>>>       expected = 0;
>>> -    fence = xe_migrate_clear(m, big, big->ttm.resource);
>>> +    fence = xe_migrate_clear(m, big, big->ttm.resource, BIT(2) | 
>>> BIT(3));
>>>       if (sanity_fence_failed(xe, fence, "Clearing big bo", test))
>>>           goto out;
>>>   @@ -598,7 +598,7 @@ static void test_clear(struct xe_device *xe, 
>>> struct xe_tile *tile,
>>>         kunit_info(test, "Clear vram buffer object\n");
>>>       expected = 0x0000000000000000;
>>> -    fence = xe_migrate_clear(tile->migrate, vram_bo, 
>>> vram_bo->ttm.resource);
>>> +    fence = xe_migrate_clear(tile->migrate, vram_bo, 
>>> vram_bo->ttm.resource, BIT(2) | BIT(3));
>>>       if (sanity_fence_failed(xe, fence, "Clear vram_bo", test))
>>>           return;
>>>       dma_fence_put(fence);
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>> index 31192d983d9e..22b16a0006c5 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>> @@ -793,8 +793,14 @@ static int xe_bo_move(struct ttm_buffer_object 
>>> *ttm_bo, bool evict,
>>>               }
>>>           }
>>>       } else {
>>> -        if (move_lacks_source)
>>> -            fence = xe_migrate_clear(migrate, bo, new_mem);
>>> +        if (move_lacks_source) {
>>> +            u32 clear_flags = mem_type_is_vram(new_mem->mem_type) ?
>>> +                        BIT(2) : 0;
>>> +            clear_flags |= mem_type_is_vram(new_mem->mem_type) || 
>>> handle_system_ccs ?
>>> +                        BIT(3) : 0;
>>> +            fence = xe_migrate_clear(migrate, bo, new_mem,
>>> +                         clear_flags);
>>> +        }
>>>           else
>>>               fence = xe_migrate_copy(migrate, bo, bo, old_mem,
>>>                           new_mem, handle_system_ccs);
>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c 
>>> b/drivers/gpu/drm/xe/xe_migrate.c
>>> index efd64af4f8cd..da06b434b9eb 100644
>>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>>> @@ -518,15 +518,15 @@ static bool xe_migrate_allow_identity(u64 
>>> size, const struct xe_res_cursor *cur)
>>>   #define PTE_UPDATE_FLAG_IS_COMP_PTE    BIT(1)
>>>     static u32 pte_update_size(struct xe_migrate *m,
>>> -               u32 flags,
>>> +               u32 pte_flags,
>> Looks unrelated.
>>
>>>                  struct ttm_resource *res,
>>>                  struct xe_res_cursor *cur,
>>>                  u64 *L0, u64 *L0_ofs, u32 *L0_pt,
>>>                  u32 cmd_size, u32 pt_ofs, u32 avail_pts)
>>>   {
>>>       u32 cmds = 0;
>>> -    bool is_vram = PTE_UPDATE_FLAG_IS_VRAM & flags;
>>> -    bool is_comp_pte = PTE_UPDATE_FLAG_IS_COMP_PTE & flags;
>>> +    bool is_vram = PTE_UPDATE_FLAG_IS_VRAM & pte_flags;
>>> +    bool is_comp_pte = PTE_UPDATE_FLAG_IS_COMP_PTE & pte_flags;
>>>         *L0_pt = pt_ofs;
>>>       if (is_vram && xe_migrate_allow_identity(*L0, cur)) {
>>> @@ -1032,14 +1032,19 @@ static void emit_clear(struct xe_gt *gt, 
>>> struct xe_bb *bb, u64 src_ofs,
>>>                        is_vram);
>>>   }
>>>   +#define CLEAR_BO_DATA_FLAG    BIT(2)
>>> +#define CLEAR_CCS_DATA_FLAG    BIT(3)
>>> +
>> BIT(0), BIT(1)
>>
>> Also since this is a public function, define these in xe_migrate.h.
>>
>> Since public define, probably normalize too (see xe_bo.h XE_BO_FLAG_*).
>>
>> So...
>>
>> s/CLEAR_BO_DATA_FLAG/XE_MIGRATE_CLEAR_FLAG_BO_DATA
>> s/CLEAR_BO_DATA_FLAG/XE_MIGRATE_CLEAR_FLAG_CCS_DATA
>>
>>>   /**
>>>    * xe_migrate_clear() - Copy content of TTM resources.
>>>    * @m: The migration context.
>>>    * @bo: The buffer object @dst is currently bound to.
>>>    * @dst: The dst TTM resource to be cleared.
>>> + * @flags: flags to clear_bo_data and ccs metadata
>> Mismatch variable names flags & clear_flags. CI hooks is complaining 
>> about this.
>>
>>>    *
>>> - * Clear the contents of @dst to zero. On flat CCS devices,
>>> - * the CCS metadata is cleared to zero as well on VRAM destinations.
>>> + * Clear the contents of @dst to zero when clear_bo_data_flag is set.
>>> + * On flat CCS devices, the CCS metadata is cleared to zero with 
>>> clear_ccs_flag.
>>> + * Set both, clear_bo_data_flag and clear_ccs_flag to clear bo as 
>>> well as CCS metadata
>>>    * TODO: Eliminate the @bo argument.
>>>    *
>>>    * Return: Pointer to a dma_fence representing the last clear 
>>> batch, or
>>> @@ -1048,18 +1053,23 @@ static void emit_clear(struct xe_gt *gt, 
>>> struct xe_bb *bb, u64 src_ofs,
>>>    */
>>>   struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>>>                      struct xe_bo *bo,
>>> -                   struct ttm_resource *dst)
>>> +                   struct ttm_resource *dst,
>>> +                   u32 clear_flags)
>>>   {
>>>       bool clear_vram = mem_type_is_vram(dst->mem_type);
>>> +    bool clear_bo_data = CLEAR_BO_DATA_FLAG & clear_flags;
>>> +    bool clear_ccs = CLEAR_CCS_DATA_FLAG & clear_flags;
>>>       struct xe_gt *gt = m->tile->primary_gt;
>>>       struct xe_device *xe = gt_to_xe(gt);
>>> -    bool clear_system_ccs = (xe_bo_needs_ccs_pages(bo) && 
>>> !IS_DGFX(xe)) ? true : false;
>> I'm not familar enough with this code to know if this change is 
>> correct...
>>
>> I'd check with Matt Auld or Thomas (but he is out for 3 more weeks),
>> don't feel comfortable RBing this one as I'm unfamilar.
>
>
> I suggested to pull this patch here from 
> https://patchwork.freedesktop.org/series/135743/ as 1st patch of this 
> series
>
> is doing what I did in patch 2,3. Now, I think, it is not so relevant 
> to this series if this has to be the last patch.
>
> Akshata, I see all your patches are reviewed so  feel free to remove 
> this patch from the series to unblock your series.
>
> I will pick up from here and wait for Thomas to get back or when Matt 
> Auld to gets free cycle.
>
>
> Regards,
>
> Nirmoy
>
Okay, got it.
Feel free to pull me in wherever needed.

Best,
Akshata
>>
>>>       struct dma_fence *fence = NULL;
>>>       u64 size = bo->size;
>>>       struct xe_res_cursor src_it;
>>>       struct ttm_resource *src = dst;
>>>       int err;
>>>   +    if (WARN_ON(!clear_bo_data && !clear_ccs))
>>> +        return NULL;
>>> +
>>>       if (!clear_vram)
>>>           xe_res_first_sg(xe_bo_sg(bo), 0, bo->size, &src_it);
>>>       else
>>> @@ -1085,7 +1095,7 @@ struct dma_fence *xe_migrate_clear(struct 
>>> xe_migrate *m,
>>>           batch_size = 2 +
>>>               pte_update_size(m, pte_flags, src, &src_it,
>>>                       &clear_L0, &clear_L0_ofs, &clear_L0_pt,
>>> -                    clear_system_ccs ? 0 : emit_clear_cmd_len(gt), 0,
>>> +                    clear_bo_data ? emit_clear_cmd_len(gt) : 0, 0,
>>>                       avail_pts);
>>>             if (xe_migrate_needs_ccs_emit(xe))
>>> @@ -1107,13 +1117,13 @@ struct dma_fence *xe_migrate_clear(struct 
>>> xe_migrate *m,
>>>           if (clear_vram && xe_migrate_allow_identity(clear_L0, 
>>> &src_it))
>>>               xe_res_next(&src_it, clear_L0);
>>>           else
>>> -            emit_pte(m, bb, clear_L0_pt, clear_vram, clear_system_ccs,
>>> +            emit_pte(m, bb, clear_L0_pt, clear_vram, clear_ccs,
>>>                    &src_it, clear_L0, dst);
>>>             bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>>>           update_idx = bb->len;
>>>   -        if (!clear_system_ccs)
>>> +        if (clear_bo_data)
>>>               emit_clear(gt, bb, clear_L0_ofs, clear_L0, 
>>> XE_PAGE_SIZE, clear_vram);
>>>             if (xe_migrate_needs_ccs_emit(xe)) {
>>> @@ -1172,7 +1182,7 @@ struct dma_fence *xe_migrate_clear(struct 
>>> xe_migrate *m,
>>>           return ERR_PTR(err);
>>>       }
>>>   -    if (clear_system_ccs)
>>> +    if (clear_ccs)
>>>           bo->ccs_cleared = true;
>>>         return fence;
>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.h 
>>> b/drivers/gpu/drm/xe/xe_migrate.h
>>> index 453e0ecf5034..0d19bfe02a23 100644
>>> --- a/drivers/gpu/drm/xe/xe_migrate.h
>>> +++ b/drivers/gpu/drm/xe/xe_migrate.h
>>> @@ -104,7 +104,8 @@ struct dma_fence *xe_migrate_copy(struct 
>>> xe_migrate *m,
>>>     struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>>>                      struct xe_bo *bo,
>>> -                   struct ttm_resource *dst);
>>> +                   struct ttm_resource *dst,
>>> +                   u32 clear_flags);
>>>     struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m);
>>>   --
>>> 2.34.1
>>>
