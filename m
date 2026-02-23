Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F4FEA4FC4
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 14:17:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4AD10E454;
	Mon, 23 Feb 2026 14:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YPa5L5N7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A9410E41C
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 14:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771856221; x=1803392221;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=OwJUe5fPeDHFXEu9+750F7Cw8qQ1ML+F9yhsgQcB+2g=;
 b=YPa5L5N77FZIJq3ybIeJm0cTWUZ/Yyx29RHopV6N1RUI0RNOQkBZqx/M
 wuI8k0v10TuUG6UjdYnSBsbornxPs7dJBJPm5Z516buz/8tWfRWz4L9ab
 7VC1srx/YekbC3U75tAOV3/0sF4uEiouAwRV+iXJN4utNm/tlpWlcBrvJ
 SFTgkyRJyIP4jBvBETlGd2Q+245uTQpA1P9p5KNhJDSUw1dA6ecVg/QO+
 yAiiOmgcT29xih6qXCDPdORI9ZEA0L70KJysM/k4xsJlk+f2wFhl3RH5Y
 2uC3G4HBINRy1CuZ1cM8Qr83JZg4i8oVb7QfzRtJbB6TcWcR+FFdYuOWI Q==;
X-CSE-ConnectionGUID: TjdjWRddT1WSnv4QNsGw/g==
X-CSE-MsgGUID: jvRLxJFgSDWApBOYdZX8bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72059829"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72059829"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:17:00 -0800
X-CSE-ConnectionGUID: XgzcqyJ5SOO8W+dijUbGSQ==
X-CSE-MsgGUID: P9/dPX7RS/uW2gpY81NlfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="246170292"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:17:00 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 06:16:59 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 06:16:59 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.32) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 06:16:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBfazX16Fapqx5lYS1qeakLEFfEh3fzCPC56PR4AWk0b23dt+jq7FsUaD5zAc3WnDylJeONffBwrQTaey8+bSknptzhEG4gXycFP4E5SQATx/rI2JAdvz26oc9yg4b/qzvgp67suKoW4YtemvOnxyq4xdBfOxhsQfO0opfuSGlw8wJyOmchoTPIv/DlbmaN6r4RH9QhzIYtHR+TuVg9mPAsTz7cnikIXV5I4cEKeWR8ead8HgnVXc4H/bqA/0mm+2Yw2UCRLSr/HigsoVpT9rtSROxEDOYUhNHqMaS6PyGB927CwdHhcvGWozZnyLtJ8DIABAtTCG/Kc8s4G3zYJYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tcYmJ+H9DgbVDrENYdvCB4vWGMdyRWyePdwFEeDERfk=;
 b=L1jHUE38OxjYcBOEkRKbXvF33cZ44xQp/voZV9jYJyx40dUwxZ6xJ7HwshGunOEhl8Ua7xJ5ynExA+RA0hwEPddDxvOPCFU/zg7da91JF3sv9lMMayiKm0DIMI6hE0HlLYq9r2RY38fNlJtLl1FdKnc2UX0QfM4d07qVXBI/CpjEquksn4ZvtoW5Y88nynuCnr7YGDccBcw77Aa9aKfRadTd2I+PwLJlpKDcVXTelQ8zINYkzbVKiEvTVsh80/K1B/f6fl8ovWFsBU9njxwynu05G4Q8xKwyEDreYMkkkO/qFVOSc5FqrkzDk1jcRUuejDHsQYVATNem3pXNsSxelw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by DM4PR11MB8177.namprd11.prod.outlook.com (2603:10b6:8:17e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 14:16:55 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 14:16:55 +0000
Date: Mon, 23 Feb 2026 19:46:48 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 09/23] drm/xe: Consolidate workaround entries for
 Wa_16018712365
Message-ID: <aZxhUOlTaLJ8T296@bvivekan-mob1>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
 <20260220-forupstream-wa_cleanup-v2-9-b12005a05af6@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-9-b12005a05af6@intel.com>
X-ClientProxiedBy: MA5PR01CA0131.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::8) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|DM4PR11MB8177:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b496f1c-5410-4e4d-931e-08de72e6328f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGFCM09xWExndFFGMGREd2JVMFJJYW1PdW1MOGZTcDBkTUltajg4N2tzbGlp?=
 =?utf-8?B?M3A4alZrOWR6aCtkdmVHeEFhZXRaM0liY0l6dW94SnJWejRUQ3hoSDNteW9L?=
 =?utf-8?B?elY0M3RYVEU0VnhJMGZzZ0M3NU92djFtMFFISlZSMXNtUTZUNWlUQ3JGdzlh?=
 =?utf-8?B?RmpPWnBEWUh1U25sKzZsK2VsU1pvWll0TnYrc3FObzB5Q3pUOEM2c1NNa1Nt?=
 =?utf-8?B?Tm5QdEs4Nk1raEJQKzAzbGNvTXA5RWVVY2VhMStzdGdXK2ZQd1haWElYSWha?=
 =?utf-8?B?ZTZhc3lsNEFQemE0NjJ4aFUyQUxPNUc2R0VxeitDa001WGQ3dzZpbkJmZzQ3?=
 =?utf-8?B?SlNjc0VvaFZNdmdUSzJSamtDRlZmV0ZBRzgxM25mSXBtWEJtMTVzdk5LNG1S?=
 =?utf-8?B?dVNKQkZoaHFJaElsQUp4QzVXaEhpSmdmVnlUTkJPVk9iTENIMVFWOHYxSkoy?=
 =?utf-8?B?YUluWk1BaGZVOEJocjBOSEJ4OEIzNXdobXNlVVZGOWZLTHNKMFF6d2V2b3BF?=
 =?utf-8?B?K1h4T0dEZTF0SDJPMjFtcjlSbmZDZ3RHd3BOU2c3NXpEZUZHaGpsSFEwV2tX?=
 =?utf-8?B?eklKK2h6cW9PSVpETGJYbU44ZVBpVGJmd3ZRK2ppRy8zUkJrSzZON2c2UjRa?=
 =?utf-8?B?Uk5uUmNVaWNBTk5EMVB2NlNrYytHcmNOcWp1ZzV5MDl5ajlvSFVpc1lMV3Rj?=
 =?utf-8?B?SUl1R2RIdWRWeWF3b0xMaGRFUXRHL3l4dFByNHJyT1Q2dHZTK1FyNmpXeFoy?=
 =?utf-8?B?QnZya25wcW9Yb2NPV3JDUEt0RnpEYmJSWnBQWFo4bHExTGEzRVZySDlaSWtQ?=
 =?utf-8?B?eUdYR1ZCS3EvQzZ1UzBDaVlJSVdZbU5KM1lVWTQ1eHNuZjVxV2NJWG9GYkhJ?=
 =?utf-8?B?dXdwbEpvOTZJTWhWQzJZOXRqS2VPY3hOR0RVU3pBNXRsdTRuQ3J4cEVYWkpU?=
 =?utf-8?B?MWxJa2Nyb00xaUI0ZFhXY0pweU1QTHM2cmMzMlJ0c2VDeVNxN2FWUWZZbTl5?=
 =?utf-8?B?dnlDaXI3MlhkbUNrSFRuOG84UUs1Y1BOMlFBbW9mMkV0NnZpWDROVzRDRjRm?=
 =?utf-8?B?cVA4c1R5RmNHaTluRXBUZUtpTHcvR1dEcXV3WTJ3ZDU0Q2p5dWo3M0xKa0V5?=
 =?utf-8?B?K2dGVjhxUm41ZDUwZzFaNXZON0E0WnJ6bTRqeE5LRXMrNlZwdURqYXpzTGJK?=
 =?utf-8?B?WFM1RkRxKzFXeW9STzc5bElIemMzTHQvQnVDdVhZL200czUrU2Q1WkVLM2NZ?=
 =?utf-8?B?VHVxQnd4elJKRnovLzlEc3l6aWw5aENDZlJLcmJMSmpVTlFOR0VHUlNBdmRD?=
 =?utf-8?B?QW40NWxydTlLYzNvQW1mNHpIQW1ZdlhWYTRQL0JnVFBKMkFOSDhvbzdjZWZX?=
 =?utf-8?B?cW05YnB3S0RIL2FOeWNEdGFOdkRtMmdQbXJkWk5ZYThxcWJuQ2FLU0F4Q0VJ?=
 =?utf-8?B?UUpRNzZVZC9TbkFYQytBRUd4djl2KzJxRmwrU2Jnb2hOYlVTbm1FNDZLWGsy?=
 =?utf-8?B?YjduVVg0YjdGTnBEbllpcWxHcG84Rk54UnAwSEFHeVlFUWFFQWY5d2tjd1ZE?=
 =?utf-8?B?UDRDUlZoSkVJOFJOY2NPNWpROWJkTHViYUwxWG9Sd0VaazNEU092WHMzSXFH?=
 =?utf-8?B?djNXZnExNUFKc1RwN29oeFAxMmpwVmV1dm8xVXI3bmJTNHN6ZXRQSzN4Tjhz?=
 =?utf-8?B?VkREZTNIaFQzc0d3R3NPVG1QWGp3WEtWREQ4ZDFvTnpkU251YWx2V0dLVHJI?=
 =?utf-8?B?SEFIUkE3MngxY1lpOURPbjhKNnpGamhwM1lYTElzalA0bU5nWURQYzBGVyty?=
 =?utf-8?B?OFhMcTJzRk44NmxNVGlaTEtZSHgzSElySWFZNEorRFhqT0pVaGpKRXIvcW1M?=
 =?utf-8?B?OVBpNHZ5aExoMUxLT05uSXphbVRLendWNDZXNTBlSWdkckRRUEQ5UW80QzEr?=
 =?utf-8?B?TnlOTHhMSUMvZFpCZWl2TytFZ1dveWFGMmNpQ25CaVorTGo1VE5TWCtSTDJT?=
 =?utf-8?B?VTJYbDN2c2owdUNSS2h2by9xMFNwZTZZeDhrWHhjai95dnZXUnEweU9IZ1I0?=
 =?utf-8?B?Smdnekp3UzNxTHFQUHJ6VjVicCtYRFBDdFlmSlJpaTNzUzhvY3VzNG0wT0xo?=
 =?utf-8?Q?qovE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVNGUlF3MGM0MWZWUytOUmpDLzNRNXlETVA3TVVLTE15cDZoYm8zTEhTVy84?=
 =?utf-8?B?QUkyQ3c2NEpWWGZWNFhDSHZGMi9HRVB5KzdtQ1FHckJBVVYvR1orVXVFK05p?=
 =?utf-8?B?azdwWGVKQ2RsNHVxTGhjczBROEk5REo4aTlNUktxNVUxSzIrV0R1YUhIMjhi?=
 =?utf-8?B?Z0dETHpSVUU4bWt6U2VZbXV1bnoxQXJpRklqbmp0VWZwTGVsWTF5S1FqY1dK?=
 =?utf-8?B?UHZxdmc0dUdEckpqNU9oaGdUTk9EcWtMbVJkVXdDY2Jad3BRWUhuOGlKc3dR?=
 =?utf-8?B?RTJaRHMzWTYwYk9XcW84MktoYzAyU09uUlR0aGI4REY0NGQwZTlKT0orcUti?=
 =?utf-8?B?Q1Y1R2J6UUk3eHNGOGN6OXVsWCtYRGlSVzh1RGNWRGxZWEJWTTB3aENMYytJ?=
 =?utf-8?B?TlljWStZZDRZQ2JzS21tSEZaS25jL1BFOEt2VUJWaWpad1ZMUFQxU2N1Sk9y?=
 =?utf-8?B?c3dweWErRWMvNUI2ODUvUWZxL1I2YW5BQzNZZEliMGJ1dy8yZGI0ZFFDa3Bn?=
 =?utf-8?B?dUx6SXM5a09UZWdmclZ5SmpHd1dDYlN2ZU1DekZid25xUUI4dEx0d3V4Z1I2?=
 =?utf-8?B?L3B0ZkJSUllBbWJ6UVUyc3JLMEJVS0JlZTYrU1Awd1V3UGE4bEI4cDJGZHQ3?=
 =?utf-8?B?RVU1b0VLZEZrZkJxT0RKWXY5WWpYTXhTeEpBRUt6b3NyNEhCYjVrUmZzT1J5?=
 =?utf-8?B?bmFNM0t3WXpqR3lmcnpLQkJxSEhmaXpNS3VTTzF6bGJvR1ZNQ1EvQ25kcEZr?=
 =?utf-8?B?QkFudzV2bTFWdU9NSmIzV1BrSU45MndmcnVReTNRVllYWGpwRlU2QkFGS0Fx?=
 =?utf-8?B?c21lM0J3Zm1BNVBhYVMwenVUTDhPUGtqZitHUmxQR2RMR05JWUhLMHFueDRX?=
 =?utf-8?B?TksrTHh6bTVmbEh6bUR3RmdnV3JaNVl5L0tCT0wxaTl2N2s3dkd5VGg0MGFo?=
 =?utf-8?B?MUN1bXQzY2g1eUhqRTczYzZib1JrQlBXMDVibTk4UEpKcEd6OXBUL09aaHdr?=
 =?utf-8?B?TDN0dmlFM2UyeExkeDB3VWJGdW84NUljN3krdVkvOWduT1JMVk82b1Ayaitp?=
 =?utf-8?B?SWRUcmRjYm9YQnliWHpzRENVZHJSb3VFaXUrWWpab0g5bEdkSU5sU2lnU04z?=
 =?utf-8?B?dGtUOFZjM0JhMTB4eE9DVlNCZ0JQNysyWGJ1blVtTTBkc0t4QlJFRHp0UmZO?=
 =?utf-8?B?U1VLRU9PcFI0RERZcmpBclNjaHh2TllzVlJLYjN3dUtUTnVzVGNLTnpkTlBN?=
 =?utf-8?B?eXQrNm5XV004RjY0VDMrMnRtRjlSS2RZKyt1Q21yY3Nqb00wRzRFNjFuWVlj?=
 =?utf-8?B?d2hlencrKyt0UjUyV3ArKy96djNSRUZYM2RUQmlYN2cxSUJpUmRGZ2hNWFI1?=
 =?utf-8?B?OEVVS0E3SUJQZGdkKzNrU2IwaGhER0VabmlkZVRHMTJxYkExTG8wZXZwU050?=
 =?utf-8?B?VVBmRW9SVnFNYm16WDMrUlVrT2hOWi9MVExIak1pcTVtYjRXVjdnUDdSS0Mr?=
 =?utf-8?B?Y3haVFZLYkpXZGhiUHBTZmh3b0Z0LzJNa0RsYlQwWWR1VE45RXNYdXJnZUJV?=
 =?utf-8?B?UVBVRit1WjNsTE1QY0Q2YTFKc2dMTzQ1UnhqR29IUGk0QXRsQUR3TEpIRlJl?=
 =?utf-8?B?T1MxRGEzc253c1ZWVDhkWkZmNmdxTS9KMEZJbncyZ05CeE1EVnd3cWJLUHVl?=
 =?utf-8?B?R21sblFUckVFYVJrOEFQNVpZSFhzeWZTYTVQQk9FL0RuaVlLU3czVUxvMEtW?=
 =?utf-8?B?UDRVVG4zamloelRJVTZxOTRXY0dSR2JaQ0pmU1NmZGF4dlNCU1hMMWdmWWlC?=
 =?utf-8?B?cFJaWW8wWktVTkxZeVF1N2tUZTZ5cHpiNTc3d3FreHNSQzFQRzBDY0ZWcU54?=
 =?utf-8?B?cXM0a2VLdUxHalhXTzNRQmQ1OWRjeEJoMmlJQ3BJNmoyb0gxVk1mcGxoSXd3?=
 =?utf-8?B?U1NTSFlUSWl6d1dzaDhmMk13OEdiL0pseUdGbTdtY2dyRGg2V1FoZnFWSVBi?=
 =?utf-8?B?Z3RhSGY2aEhuZzBzbkpreHdKS1R3b3hCM2JnTmFKaTNVOG1KZUU2VEc2b3pK?=
 =?utf-8?B?eUhJOGE5VEJadGIvUmtaRlRFbmZzUVUxVzZoRFQ4bUlXSndoaFpiSUFvUVpa?=
 =?utf-8?B?dWpGU1ErYlYxR0Zab2JWYkRVS3hCaTM3Ujg5a29ISzNIOHBVR2RFWDdJTG1y?=
 =?utf-8?B?THBrRkNaUkx1VXZJSE4ybDFIanpxdkpBR1dtYVNLTklPQkx5elZKUC9tdndY?=
 =?utf-8?B?R3plMWlKMzdJVmhoVys2M3ZnVlBRSlNQK3hDaS9DWEJIajdOQzMveXRJSG5l?=
 =?utf-8?B?YWkxbXpCNzM0VGR2d3VuMnpLS3VVTnlhYVcyWjNYNVcwL0ptZytWeDhJb0NF?=
 =?utf-8?Q?eN9gbPoKqIOrs/VstZVXpLp6imQZzqm0IqB+G?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b496f1c-5410-4e4d-931e-08de72e6328f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 14:16:55.4030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wXxEnqPk6jPbbQBstp+W9SjBvtFImDC1EsC8/KMU0ko9payHROlYDJnpi9UDR5SNvvwHz0DkbEHSUNvUsxogS2Km518+dpW7xKAdorwh219N3BN99LZjoWgrFS6zfueA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8177
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

On 20.02.2026 09:27, Matt Roper wrote:
> Wa_16018712365 applies to all graphics versions from 20.01 through 20.04
> (inclusive).  Consolidate the two RTP entries into a single range-based
> entry.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)

LGTM.

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala 
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index a483a76c7665eba1c6a87a18bab1a31d11a01f4d..f99f1fbe3aee016d8a8aa19d62f6fd503e6e19f2 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -348,6 +348,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, SEQUENTIAL_ACCESS_UPGRADE_DISABLE))
>  	},
> +	{ XE_RTP_NAME("16018712365"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, XE2_ALLOC_DPA_STARVE_FIX_DIS))
> +	},
>  
>  	/* TGL */
>  
> @@ -485,10 +490,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  
>  	/* Xe2_LPG */
>  
> -	{ XE_RTP_NAME("16018712365"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
> -	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, XE2_ALLOC_DPA_STARVE_FIX_DIS))
> -	},
>  	{ XE_RTP_NAME("14020338487"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
> @@ -538,11 +539,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  
>  	/* Xe2_HPG */
>  
> -	{ XE_RTP_NAME("16018712365"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> -		       FUNC(xe_rtp_match_first_render_or_compute)),
> -	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, XE2_ALLOC_DPA_STARVE_FIX_DIS))
> -	},
>  	{ XE_RTP_NAME("16018737384"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2999),
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
> 
> -- 
> 2.53.0
> 
