Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23423D216A4
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 15:51:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6FD010E98F;
	Thu,  4 Dec 2025 15:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BGnJPVQJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04DFD10E98F
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Dec 2025 15:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764863485; x=1796399485;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=59R0yP7+kHjlDRj+PtB71lPRzUQmgEzj6dCNDnUzBOQ=;
 b=BGnJPVQJ92e/z0l+zLTz1Bm3VsG1fE2qG6dQf/PVDYU4ONXN50i8fniD
 yrPh3/uVPHBTXiCnlYpaXbzUc02YQe3H0srRV9uqEAcqUXIglSblIfbZo
 KIOGe0MWgfVkIBt8K461QS5Qq7xIjyo/eIMc01UfN5qldan6C6LLOWwDF
 bcVRKO9LAWfLxdLrCihxJwX5dBbDzeEB99nwIrugNx50tUR8FCXH6ihC5
 1G+sB55zmAY8E8BiWQXoH3Oh3AOVQ/rKw7KWHNnmubsiDNfUcRpeI2Ndo
 WIUA0A9104mAjKhilqV0wZ8qggu3WydTEo/fD1lVC4JA6tvqNq0jfY9Tp g==;
X-CSE-ConnectionGUID: As8zaTCuSi6yyTW7+N8BIw==
X-CSE-MsgGUID: FcsmI9WeQQyBufYvZcJnug==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="78237106"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="78237106"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 07:51:25 -0800
X-CSE-ConnectionGUID: UW6zPmzGSlumumi4O3UigA==
X-CSE-MsgGUID: FEKdD6chSMW3PyVNtoNJuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="199491798"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 07:51:25 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 07:51:24 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 07:51:24 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.41) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 07:51:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ao1GhwMIs7y839VisrlsZMWie/Gi3I4m0Arg3x2/I995zqkaWNc616UTmUiqN3OyAkojaI2E5YTHH3AkIBehIV0vhWVdVZUXfvSjF0bF9reD6aXRTZwM4tiaWsW7bmbCVTrVfu1zOYuX0tijPdwSYktwgqmNCMZA+b/EjSRL4CzOQp5Pc4ud4JyuugcSADAKGf5p29lLV/NZ2UCELhmRw+Lafi6bQ7z8oj3Nn0M0nBsudX722XkPeshRG2Bl4Pk4x0bU/WSob9dKNvNSD7zZGAZJfEV23k4Cquy24ubWRND8NU0nW7wVJtCjON9V3gebr1NVrWxTFZWjmq/QKjg7hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+bfvRiX/6q29OXd+dsJfB8V2rX3GRh8qtBBJHRHucU=;
 b=g+0SRnTuLNDx9NDXmvZ69oY+MjNEA3fLTcFXtVzJ9iw+G34rUDVq5Yc0gV0KXw4s97MpDnZF2m0iQwe9xEN17UB2crew59FkyTGhIIE9N8zFdD1L8wdZcQPWWVUVGeV5EI9jjYuxnKR9mzC0x3v6HcR2sAGAnBWVOCBIWzN7Nl2Z1nan8/UHrc4PM2PjHheHRddDigcGeIJF/u/tmGGVYZ4YSs0fc3wU6GtiXCb2Aqk7YM6r5cC6IMG9Lgw2GeZesCgW2GGakOLLm7mg8RYwwIJLhAAczrA9dj/bbrdRjRlI77ZVDdTGxGOHFqqh2cqq/ze4QMjLT19VeW1Do6KoSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by IA1PR11MB6513.namprd11.prod.outlook.com (2603:10b6:208:3a3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 15:51:21 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 15:51:21 +0000
Message-ID: <3913c62e-5d74-4b4b-b42c-a3584b2a8d9c@intel.com>
Date: Thu, 4 Dec 2025 21:21:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] drm/xe/soc_remapper: Use SoC remapper herlper from
 VSEC code
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <ashutosh.dixit@intel.com>, <anoop.c.vijay@intel.com>
References: <20251203004800.1993258-5-umesh.nerlige.ramappa@intel.com>
 <20251203004800.1993258-7-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20251203004800.1993258-7-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0200.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::15) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|IA1PR11MB6513:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d722a36-e572-4769-9b02-08de334cf83a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aitHK1VVR1BLUTVZaStDNjNNZWVaTVJ6dGkxQ0FnS21JWkU4ZDN6OXg0SkxB?=
 =?utf-8?B?RlNWOTFaamEyTTdjUWtKK29obmd1ZDBWaHVkTnRRY2hUd015U2R6cGoyQmV2?=
 =?utf-8?B?cmRBaWE3SkVIcHBEcWdOcVd5c3NSSFB5TFM5MnJpNWtBTjh4bkMxWjhDQjRl?=
 =?utf-8?B?N0lmcGlhbW5iRG9hR0FlL3RUT1RhcnBhNElSUDVza2tjWk9BTnRJWUlFdWM3?=
 =?utf-8?B?Q0plV2ZxWGdUNGJIM2hzODJrWFRXbFo4YVRmR25PaFJrWFIzMitkY3NGR0c2?=
 =?utf-8?B?SjJqWGt3Z0VZYm1GYkdPTi92djRncHg0K0I5NnRmRFRTVzhQWTR1WE1XeTFh?=
 =?utf-8?B?UjJ4dlpKNTZpYlpqRFFydzRlYm5BbHJ3Zm0wZVlyNWpMaG5LUTR2Zk5uZmY4?=
 =?utf-8?B?RHhEUDRaWkxJRTA1bCtGOWtxS0NiYjNVYWF2bCtZTndTeldzRTdEOWRNcXIy?=
 =?utf-8?B?TkpERytKUFBYZmEwM2M5MkQyV0ZqSEpYUUc5SVBmajhaWk81VXh3SnovcW9m?=
 =?utf-8?B?Wll5NGRrVHYrZytJM1ByTWxWNWt5cFNoVCtQWVA1YzdOTWxaNlQ2NXBXbzFV?=
 =?utf-8?B?TjlpY0lvdWZEY1FBRGV2akx5V3RpK0dwSDI3UDM1ZXNVUW1FLzhMbDJxVDNj?=
 =?utf-8?B?aEVReWtsY3l5b0d3MGo4UDU5cVJaMG12NmlkaDdZZnZVRXJiQjBiMDJLeUZY?=
 =?utf-8?B?Q0FUVHlWUFJzc2Y4bTVPMlh0OU9aNjUwdnZBQ2R5MWVJbkRWSmhTRmpFZmgr?=
 =?utf-8?B?NXVmNm9zdmp6a0RPalVWU3RibUlpMjRvUC9ZSDJpb3E5WUIyeTNoaUMrVFRB?=
 =?utf-8?B?OVpLNlVLNUF4eG53NWpoaHduaUtvQXB6RUhTQkVoL1E3WFVRR3RUc2NHamph?=
 =?utf-8?B?MElXcTFhdzAyT0pOeUpXZTcrUHBoUTBTTzNNSVROL2lBY1p1ZGRTakh3V0x0?=
 =?utf-8?B?MWJGT3RXbGptZzNtb2xERGxhZlZPbUlSbFJObk01TXVKYWNJQkgwK1RTSWFa?=
 =?utf-8?B?blg1cmU3OEVHM2hiK2RDTFZOc2xZU0RGUU5oenljeTNTUEw1YUdsenRJVmxD?=
 =?utf-8?B?cjR6QnNkaDRNNXNrYWo3cUxpWXFWRForQW10dEI2anhYUlJvRjQySjZ2ZCtS?=
 =?utf-8?B?VjRVTUlsU3lFYTlKNWpXbDdZSFQ2dnpIQkVkd1Jnbk1TNEVsd2VrUlgvUDAz?=
 =?utf-8?B?aWtkL04yeW1SL3pKZ3ZOQ2xsdTFnVzlVeklmbUJES2dqNG1ueTlSTDRubGRs?=
 =?utf-8?B?bnZJUEQ4Mjl1bmdvY2xSQ09sZk13clVTNXVLd2J3MFlFUStIQ2x4bkg0UzJG?=
 =?utf-8?B?NDlDTmJEZDMyWFFXOVJlcFpmbmZYaEFnWjNtV21wSXM1YUJnanp2dXBEdDBy?=
 =?utf-8?B?QnRjVWY1ZGZhN2liT1BvaFZ0KytMZmNsYXJhSXBFTUtvQVRjTHlYeTdzZk5k?=
 =?utf-8?B?OUlKQzAySEhDOU9sdGFoT1hnOVBzMlI3bHJCdnNuWFFmRnRUQi91OFNLRDBK?=
 =?utf-8?B?RkFNeFNmWXZQRUo4czFZdkplajZzYzk5SWREWkZPeUVOWFg1Sm40OVp6Yy9a?=
 =?utf-8?B?V0NnQ0t6MmMwRVZJYW94ME9nd3g4TzBBTElBV2I1SlRaZFNTQUZwQkVVT2VD?=
 =?utf-8?B?Y2UxbWprQkdYNk85a3hneXdNZXA5UE04YlgzRzFKdzh6WWFTS1crVnA5TCtL?=
 =?utf-8?B?bjQxWCt1aWlqT0NEdHMrSjN4N0N1SmpYSmtIZzVDbWhGaUZScHQrSTNRMnRn?=
 =?utf-8?B?bFNQMUxES3pWNFNiY2xBWC9pNkk4SC9tSFc3TVlYNEZub2VudnQ3L1cwdCty?=
 =?utf-8?B?ZGl2ZDc1ZnAySUkyNWlmeXBjdkprbllEUHNXS2dwNW95KzQ5TjZHSmJVNVFD?=
 =?utf-8?B?ZkhRR2RXY3N3eVBTS0M3WitOYmdMRE1WZHBRNWRtbTltcjNybVJjNFU5cS8x?=
 =?utf-8?Q?is6IgHfE8VTmCZqI28qGMPkpg6pn7jA/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yk4xcHgzT3p0NlFDdnBLR2tPZ3BCV3I0NFN4a2J3dVdPbHdzNFJLS3BROGVY?=
 =?utf-8?B?MVNZMDhpa3BPRzVaOHhKaWhjcFN3Uno4Nk42M2p5dzBVL0RqQXBRRVVBQ2xR?=
 =?utf-8?B?b21uYjlMenViSkQ1NFhncUlYYVRHMERDeVJwNzV6Q2dodzlFekpGYnJ0V0Zm?=
 =?utf-8?B?RUlQWmhQVTJ0c3oyMXlnKzBpNDZ3NmUrcm1CajdJZUtQYVp0TDRrd3RHNzRl?=
 =?utf-8?B?YTFGU0VSL0g3Zm10V21sSk5sL1lFaVVMZGpNSnhCN0RkdEg4aXdXOVB6dnBW?=
 =?utf-8?B?SzhWY3gwMXZQZm5tNFdDNThpYWU4SVE0T1VmOU1SSm1WRThSYXVHMzc1U1k0?=
 =?utf-8?B?QXByQWlkWnBCdjNaMm1BeDR5QTlnUXhoUzQzWjJqaFRzd1dHMmhwK0IzNzhU?=
 =?utf-8?B?WEdOR09IVTQ3dHhFTHo3ZVR2ekpwMndSWHExak91R092OTJlZUR3UmtWWS8v?=
 =?utf-8?B?VEdpTGhKMTBZb1ZHZlp2dFlyancxbEJaSU00WkNFUWYxRENrT2ZHQmkxTUNV?=
 =?utf-8?B?ck9sTFBYVUdCZ1pGZ1BtcmNuUDRyeXBIOVdodUZmeW5Gc0JZemdBMnVCaGlo?=
 =?utf-8?B?bXhvT20vUGRRRTNWd1lQVlo1TzVEYlZmanVJNDJ6cWUyeUdZNmJSOWx1UlBv?=
 =?utf-8?B?NmU5dDNzMEZLcVdGOFR3ZTMxcmNjaWwxdjArVGp5MXUxeFI2T1d6NU1SQmxs?=
 =?utf-8?B?czNiQ1p3VTcvYnhQNkxzblNlR1o3aFlQWFJIbXBySWRtMlpkT2NkdmZibCtt?=
 =?utf-8?B?MCt1bGZkUEtTR0tuODJ4S1dzS1JQZDcyMzJ6dGxZTWFmVDRwTEUyaWxmaGI3?=
 =?utf-8?B?U0lLMk16VHlOVEthMW9kTVNGK3c3NjYvbXowamFPa204bnFoL2RUazhhYzF1?=
 =?utf-8?B?bGR1WnF5WU5tL2VPNisyQTlWeVVEdFlISGx4WEo1L2N6VTUxbThWMGE2aENp?=
 =?utf-8?B?TllkYTJCV2JkOWZIZ3YwOENSRDlLSEp4c3hOL0ZIQWZzeWdBRy8zMzRoMit6?=
 =?utf-8?B?Y283OHNDTXNBZmtpWlZUYlJZQ1JjREpxaXRxUURGb0JBdHZtV3ZpaGdqQS9z?=
 =?utf-8?B?OEVlcG1XdlpOYWRDV0RueDhTR0VmOHprbU1zeEpCUGpQTk9RYmR6ZEtQN2h1?=
 =?utf-8?B?Zjdib2NuR2RNZDF1MjZ4ckFmZW1zbVdMRU4vNUFHbjRIMHpOZTFjWDVEQkhG?=
 =?utf-8?B?ME92UEdjRDFrSnhMbXBqbFU0bVpMZXMzUzNPTzRldmZKaDgvZlNLU2pyWHlF?=
 =?utf-8?B?SHlNcFByL09DSHBhRGEzYllkN1Y5eGRQaXF0b0ZwdG9kRm1DbDJWWFFIdW8w?=
 =?utf-8?B?cG5QRTQ3Qlh3RUZRMWN0Z0FEYXdSYjFxUDB5ZkZqcTd6UGhGRndhbUpoQ2w5?=
 =?utf-8?B?TlJaVnNTNGozcFIzcHZoT2ZMdkRzbUdSSjluYUQrSzc0NnlYdWVpZEVIdUhw?=
 =?utf-8?B?blMzcUZyR3ZvRGphbk84UTZ6eWJHQlhjN1ZJSHYyUTQvbG15OWZXcWU4Y0Fj?=
 =?utf-8?B?bnI0dVQ5Z0hVT1dnWmtoWkhXVlhZdG9TRTJMaGVXV2NETTJFZzdrb0srczdO?=
 =?utf-8?B?OEEzcW9OdnZwdW5GeThSWEh6S1Z2OEtQZTRYZzN6MFlER3V4aG5JS0g4OFBa?=
 =?utf-8?B?M1pGaTVteW55NUdxdkprKzBWZVB6WWczbXB5VVdMcU1EQTczQzkrL2tLSWVt?=
 =?utf-8?B?SjZOOVozT3A5VldzOUVoQThtRjRSL2RxRmhGWndQQk45VWFGTjFXWjVqQXRF?=
 =?utf-8?B?N2xRUUhBQjhEM0NKaGtpVFlLVnUzdDZpT0xxaG9QQmE4SzZhcE9UeW4vRDVX?=
 =?utf-8?B?aWw4ZzZ6T3ljeE45OTdpckZ5RURYT0lFZHhqVVVkNDJ0Si9URDErSFVqYU54?=
 =?utf-8?B?T2FZMUJKVnB2ZlUxMmwxWG9CYzdkcmJyTWR3WXlZR2t5OHJiZE9vSVFwSmxV?=
 =?utf-8?B?U1I3RUhxT3pXNTNia1gwSXpPL2k1VUI5Nk5USkptNE9NbHF6OVBLYnRiYjFW?=
 =?utf-8?B?VytqN2g3TVU1elNIbjFncFBDYmpsZlM5SHZiQXlFK2RPbDZkcTVqbmk2TVNS?=
 =?utf-8?B?ZStRZXc0RGV6a2wvcnhZSXBCTGFnY0RjUGtXWHRsYzFIYitTYlpjWHVqZ1Y0?=
 =?utf-8?B?dXlpTEJHM1JEdXpkSWZDajJ0LytKcTFWazdPZk15KzZBOGtxYysxWFJXV1M4?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d722a36-e572-4769-9b02-08de334cf83a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 15:51:21.1593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RZGBk2h1hz4GLEGSEL5aOrGbcjazb3vIrGhInlPava8YKy2Yt9x0LnJZjW2FUng48eKGoGYYRdE7Cz6gTMbtdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6513
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


On 03-12-2025 06:18, Umesh Nerlige Ramappa wrote:
> Since different drivers can use SoC remapper, modify VSEC code to
> access SoC remapper via a helper that would synchronize such accesses.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
> v2: (Lucas)
> - retain comment
> - s/BITS/MASK/
>
> v3: (Michal)
> - Use scope based locks
> - Add kernel doc for functions
> ---
>   drivers/gpu/drm/xe/regs/xe_pmt.h              |  3 ---
>   .../gpu/drm/xe/regs/xe_soc_remapper_regs.h    | 13 +++++++++++
>   drivers/gpu/drm/xe/xe_soc_remapper.c          | 22 +++++++++++++++++++
>   drivers/gpu/drm/xe/xe_soc_remapper.h          |  1 +
>   drivers/gpu/drm/xe/xe_vsec.c                  |  4 ++--
>   5 files changed, 38 insertions(+), 5 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
> index 0f79c0714454..240d57993ea6 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
> @@ -18,9 +18,6 @@
>   #define BMG_TELEMETRY_BASE_OFFSET	0xE0000
>   #define BMG_TELEMETRY_OFFSET		(SOC_BASE + BMG_TELEMETRY_BASE_OFFSET)
>   
> -#define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
> -#define   SG_REMAP_BITS			REG_GENMASK(31, 24)
> -
>   #define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
>   #define BMG_G2_RESIDENCY_OFFSET		(0x530)
>   #define BMG_G6_RESIDENCY_OFFSET		(0x538)
> diff --git a/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h b/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
> new file mode 100644
> index 000000000000..9edf234227a9
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +#ifndef _XE_SOC_REMAPPER_REGS_H_
> +#define _XE_SOC_REMAPPER_REGS_H_
> +
> +#include "xe_regs.h"
> +
> +#define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
> +#define   SG_REMAP_TELEM_MASK		REG_GENMASK(31, 24)
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.c b/drivers/gpu/drm/xe/xe_soc_remapper.c
> index f49af7e1da2a..d28fd9f3c253 100644
> --- a/drivers/gpu/drm/xe/xe_soc_remapper.c
> +++ b/drivers/gpu/drm/xe/xe_soc_remapper.c
> @@ -3,8 +3,30 @@
>    * Copyright © 2025 Intel Corporation
>    */
>   
> +#include "regs/xe_soc_remapper_regs.h"
> +#include "xe_mmio.h"
>   #include "xe_soc_remapper.h"
>   
> +static void xe_soc_remapper_set_region(struct xe_device *xe, struct xe_reg reg,
> +				       u32 mask, u32 val)
> +{
> +	guard(spinlock_irqsave)(&xe->soc_remapper.lock);
> +	xe_mmio_rmw32(xe_root_tile_mmio(xe), reg, mask, val);
> +}
> +
> +/**
> + * xe_soc_remapper_set_telem_region() - Select the telemetry function
> + * @xe: Pointer to xe device.
> + * @index: Index of the function to be accessed.
> + *
> + * Selects a specific telemetry function based on the index passed.
> + */
> +void xe_soc_remapper_set_telem_region(struct xe_device *xe, u32 index)
> +{

Protect the access on unsupported platform.

Thanks,
Badal

> +	xe_soc_remapper_set_region(xe, SG_REMAP_INDEX1, SG_REMAP_TELEM_MASK,
> +				   REG_FIELD_PREP(SG_REMAP_TELEM_MASK, index));
> +}
> +
>   /**
>    * xe_soc_remapper_init() - Initialize SoC remapper
>    * @xe: Pointer to xe device.
> diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.h b/drivers/gpu/drm/xe/xe_soc_remapper.h
> index 1060ad0f5abc..c7bee284405b 100644
> --- a/drivers/gpu/drm/xe/xe_soc_remapper.h
> +++ b/drivers/gpu/drm/xe/xe_soc_remapper.h
> @@ -9,5 +9,6 @@
>   #include "xe_device_types.h"
>   
>   int xe_soc_remapper_init(struct xe_device *xe);
> +void xe_soc_remapper_set_telem_region(struct xe_device *xe, u32 index);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 8f23a27871b6..3e217fb75394 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -16,6 +16,7 @@
>   #include "xe_mmio.h"
>   #include "xe_platform_types.h"
>   #include "xe_pm.h"
> +#include "xe_soc_remapper.h"
>   #include "xe_vsec.h"
>   
>   #include "regs/xe_pmt.h"
> @@ -163,8 +164,7 @@ int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_off
>   		return -ENODATA;
>   
>   	/* set SoC re-mapper index register based on GUID memory region */
> -	xe_mmio_rmw32(xe_root_tile_mmio(xe), SG_REMAP_INDEX1, SG_REMAP_BITS,
> -		      REG_FIELD_PREP(SG_REMAP_BITS, mem_region));
> +	xe_soc_remapper_set_telem_region(xe, mem_region);
>   
>   	memcpy_fromio(data, telem_addr, count);
>   	xe_pm_runtime_put(xe);
