Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C097EF48CC
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 06:01:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA7DE10E2D7;
	Fri, 13 Feb 2026 06:01:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fWde9GHN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88BB510E2D7
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 06:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770962462; x=1802498462;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3e07c/yYAoVPf82gw6n94gCe2lYDFP7Q8Q2a+3xKkdI=;
 b=fWde9GHNoTFm3IzKsW/96iyc28hhGyhPa4nt9P3RIA/0lkhwJgDvQD3s
 jnMt8C24EEHzhgLOX5hqn7J76LSRPjg1vQev2bV+uEtb2vENbsoWMf1rk
 sFDWTJ8tuxNdNun0KYhQaMgDH2Z8+Xhq7OUSl4w5FUA2C8dloQ1nGa3K8
 AWqJ6NORFMnhrjGYMWuwu5JKk0vZCUP84WP+7D0YCT2jlIVKsmWC/yp5s
 0J9iarq7IpTVLLalq/N2ONqophWotOvgLwV/j1fFG6P1oZ22FIFhXc6IM
 Wt2RNd4nppnj+hAb1mynixjC8CTd+X1+XqzIyDXEG4VbsDYvYDghBbjbx Q==;
X-CSE-ConnectionGUID: dXUhVUYhScGK5JS2rpERlw==
X-CSE-MsgGUID: 8gfVjmreRm6VlmKIRUV7JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="83588047"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="83588047"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 22:01:01 -0800
X-CSE-ConnectionGUID: OdFTkRCaRzK48Vyh7q2cNQ==
X-CSE-MsgGUID: ggaNZPXOSOGTIQo5GEc2/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="235804396"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 22:01:01 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 22:01:00 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 12 Feb 2026 22:01:00 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.71) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 22:00:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EB74j7tiawtSzBfUCnScZf3YOjO1BWNeAPD3Kzkg02GyfyEjFKCSOfGhedoQ9Kslw+B49OzoTT6r4Z6DAHLNkA0OIkW0MI4Rdop2eKbXjy3Kr/+IFgnV0HVF2kKb3kQbQzSKoutUvU0DzNuGVNK8xboTmYUBxqtNheZC59MrwaaXeBrD19eJJN8zzJGMKPMMYV23nT+MX+sZzoNof054YYr03xruXOHKY531vs7crkHN05VZbkc7pjHex6KvFQ3A2ePBuE+jFM5MMNyw858SAtJGqb4fe3MlrkUX+iLfAfAi7Yieze+Ixi+hOTNj0I4heAGh0+iJBD1Ln1BEbb1cQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3e07c/yYAoVPf82gw6n94gCe2lYDFP7Q8Q2a+3xKkdI=;
 b=GTdKwCZbGrboFxv0kAW1n6lyUU7VcUn4hsU+GqPrDN/WB+ugmbshoJw05wKQf9BiyQM3hB87t+rpQc8WJieMrXk18gvYlImbRObhsmLe9XdulHnvq5kPiFzj6H9oWuqJUSQlH8RLb+XO0jDgy/cHa9z4vKszcuOVJuLmq+8txlHLBaYDgTZGuyYpZDLte1a9NC1KuVYGoZAWPdJLaqNFt7Z0lpU/liG36zZWXbnSIKz157XGc0KHsXtk3Jz6hCRW1Cy6OHEciZtMu0+ZfpsyECNevjLNSE+CtzJhVx9b8BwTqumaHTwtm0c+B7uVNwZqbI1r91HkVoIlaJpyEOOWxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by IA4PR11MB8892.namprd11.prod.outlook.com (2603:10b6:208:55c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Fri, 13 Feb
 2026 06:00:46 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437%6]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 06:00:43 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [RFC PATCH 2/7] drm/xe/svm: Use xe_vram_addr_to_region
Thread-Topic: [RFC PATCH 2/7] drm/xe/svm: Use xe_vram_addr_to_region
Thread-Index: AQHcnD2VG2sizGdcaEq/8a44jeQ1pbV/WHOAgADLC3A=
Date: Fri, 13 Feb 2026 06:00:43 +0000
Message-ID: <SJ1PR11MB6204A40B5E0523C8609652C18161A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20260212163439.1514363-9-tejas.upadhyay@intel.com>
 <20260212163439.1514363-11-tejas.upadhyay@intel.com>
 <1e1f6110-e3b7-42c0-963c-d6ba033f883a@intel.com>
In-Reply-To: <1e1f6110-e3b7-42c0-963c-d6ba033f883a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|IA4PR11MB8892:EE_
x-ms-office365-filtering-correlation-id: be80de3f-35ba-4304-597e-08de6ac53973
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?WWlvTUkyTEF1cUZnRk5nd09saEx0ZkpyQkVoSUlRUUtJQXNTOGtLNm5TMUJh?=
 =?utf-8?B?UDJNV0Eyd21ZK0FTVWJVT1J1R1RwSjBBcXhob3lrYWVBb3FpRzZNN0greUxl?=
 =?utf-8?B?T2Yvalc4MDBsVCtCblZ2UHJvMDVCeVA1bHkwNm13SmFWTENrT1BUSklZSGVk?=
 =?utf-8?B?THJWNzNJRENuMmxxMEhmTVlWNWQ2blNSZmpsZXlNUnVRSUIxTmJjNmhFY0tw?=
 =?utf-8?B?ZnlqL2l3emZUVVllQzgvUmsvYlppU21KRVcvM1ZuSHVKZXk2cnA3WW5RMXZv?=
 =?utf-8?B?MGxSUktCRG5DMjd6K0Nyajh1OWN1WVQvbHBqdm4venhmUjNNT0FyZzAyYm9X?=
 =?utf-8?B?Q2xOeThQTThHQzFFWDYrRklsSVhSb0RyTUgyeDJLSU1pZDNNdkl2L2NJTHdD?=
 =?utf-8?B?d0N6eHpEZnAzbXA3bWFhR3FmY2I3dmQwR20wTXFxNXFvVFk3Z1ZiRElFQ2hC?=
 =?utf-8?B?ekcxNHMvUXJpWEw1OURJRzQ3cjE3M2FyZVlWK0U3SUZva3M2SnYwRExsY3Ex?=
 =?utf-8?B?dmloZlRXMXJXOVRLZm0rWjE2VmVJSmJnRnJCS2lTNXl0eTJjQVhSTUdFT2hO?=
 =?utf-8?B?NUVLVWdoZnlxdGRMdXBicWZleVVLalZ4WXd3YUNFQ3A2VElIK2R4U1o3QkJp?=
 =?utf-8?B?cml3RjFMTzNxQVJMUlFDZy90SUpWQ2EwNG5rS2tMMGlYK0FXNVpCOUhEYTND?=
 =?utf-8?B?alRRazVFZWNNKzNoaHA3clA5cmxSY3lsUzhoT0tVaHFNNUFyZjNPNUFkcmRW?=
 =?utf-8?B?YlRaVUxxZVdoYS9NTVpiY291WlgzWlhFc1BLaTUvdUZ4cHRXb2hLcVF1VmZY?=
 =?utf-8?B?cmdzVnBCcXB5ZjQwY05jaWQ2NW5YekY2ZnBRTVlaVzhNQmxJM0J4akpDeWIv?=
 =?utf-8?B?Qm13NzVBYUZLeFFRUHJaclVhMXFmRitGZDJiTEFyeU5iUmtEVmhEdTJGLzVV?=
 =?utf-8?B?cWN2UDFVREx1OVpqeWI4UUxXamY3YkNBNGg3OFNRM2dzbWZLTDhyZEREdDNL?=
 =?utf-8?B?UEtpSVFMak9wOXpBcWNJMU5SbEtWMmhGZWsvdURyVm1oS2NmOUFqcE1vVzJz?=
 =?utf-8?B?Q1o0dzVqODBNK0RXQ3JWQk9xaCtpQ3MrTTZWTndpa1VqOGh4NEJZOU9EdjB3?=
 =?utf-8?B?YXJ0NjBscCtPWm1EemswbHEyN1RiNmhyWUYrQStYSEhuaENaWmFqemJyOXRZ?=
 =?utf-8?B?OXZzY2Z3dGgweTFSdEkvcFVXN3JQalgrN2JtRUJsVXMyQktQRkI4WEExVktH?=
 =?utf-8?B?SmFsdE9sd0o3bFY1bFMvT0dDZWJsbzBDMXN5VGFlZklPb1VyR0c4UDF1SXBX?=
 =?utf-8?B?cW9vSDNleHlNODVsczBjL0dqTmMzdU0rR2o3NWk3aCtXQnNQZWhFMERIL1dW?=
 =?utf-8?B?aDd0a0hQYnpRWm85V2NKTTVaNXIzUE5qcm4ydGppaWV4Z1BEUHFDUXMxbUdH?=
 =?utf-8?B?a011blEwSVVrL3NvQWF2T3REb0lEYWlwN2graWc1L0RxUmxoRmgxTkxOSG1H?=
 =?utf-8?B?TGFyU3cxa2szWWJyTWE5S2g3UE03UDMySVp4VWM0OVZpSzBKRWJ3TkJmOG9D?=
 =?utf-8?B?Y2RyLzVaZFJYU1RqbithSlRmZkFqQVNHa3VhK0d1QmZxS1ZQY2RHRDRLQ1dZ?=
 =?utf-8?B?MWVXR2xxOElFTU9EZTF0b0ZYQzlKdUt3MmVFU0xTblI4WU5SYlM5YWc1b2tr?=
 =?utf-8?B?Q3E3Q0Z6Y2w1QW80dlU0UWVYd0k4TG5mNzJLMlZGaFZISnc1bHNxQWNzK0xz?=
 =?utf-8?B?ZXZIWkV5NVI1aTJmSEVyQnFYQ0J1eHdiU2JrK0JId0VhZHBmNjd1YkFuNy9U?=
 =?utf-8?B?S0k1WnE4SlhBU0U3WXp2WWJ0RVdrdFRhRlAvMWlGQjZkK0dvSG5tUEZ2eWU5?=
 =?utf-8?B?YVdXL2gveVpraWR2Q2lLQjRoQ0FtY1FDQ01tbmFveEh0dWd4MHBFd3phbFhx?=
 =?utf-8?B?SnQ1SUs3WkN0UGNzdVRwRGRZQUxLd3laK213cnhuZkNtNjlsUTRUZ0NTcUVt?=
 =?utf-8?B?VEp6c0hCckV2eHNTeVl1bytPV2NSRFZrMmh1S3ZNU0hXWmhobURwOUg5YXpk?=
 =?utf-8?B?Qzlna0pBaHRVdEpINlNLWkRpM1RMZ1BmaUFCUkFmSTdDbmJzVFhkZUVkalJM?=
 =?utf-8?B?a2xEWDZMK1ZOQXhQN1AyYWdhLzNmRUtseEUySEdDMXd1eGNpZitkWTZNdXZl?=
 =?utf-8?Q?Cakz7MteGPriQUBJe+VBS7k=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZUc5TERiUHhmTStKRG5aZ2ZMZ0t2WTY3T1g4QU5ZeThkSGZSc1dIaVl1UTUw?=
 =?utf-8?B?UzhVSUQrcC9JR2h2dlp0dVRWTHRWQVpzRk1uQTR1UnBCRUUyWE52RlE1SkVW?=
 =?utf-8?B?bHZYZWJyclJTOWgyWGE4TTNmSEx5eGNVNmc0V1dNMFNKZHhYcU11T2pPaWRJ?=
 =?utf-8?B?R3I4V2Z6Zng0VnpNeTBuZGY2UEpGL2Y3S3BtYk1ncExDN1MxV3RDbnh1eE9N?=
 =?utf-8?B?eTVZRjJxSm4vTVlxcjZjZkxmcGtONXlFNnRMVjdyaVhQaGNWcnNOMmFBTHJC?=
 =?utf-8?B?eGFLc293RDRtVkExUWNvT1J0bDZ1Q3NXdmgzSHVrNlMyRXE1Tzd2VUNOL0JQ?=
 =?utf-8?B?NDdCekpuTEJFdWpFT0x5MkZMaFBkT1ZVOHYwSHYzRDRMWjdJWGlTanhhYkZU?=
 =?utf-8?B?bzQwMzFOQk03all3NGJLT0U4eU45dHRtU2dIUjluSVA5bEhiQUJ3OTFUNmYw?=
 =?utf-8?B?amVyZ2Z3M2tPYSt1ZjQ5cDBTNXJ6U0l1bmVvSThpQ2dXRHlsbTExRGs5Rnc2?=
 =?utf-8?B?TTlqTWR4N0NZc2pPMVRqLzVzWjQ4TzRHeHFPZ0FXMTBCczBONzE5ampWYUU3?=
 =?utf-8?B?emhnMTZwNkhBVnJaNHdxcERWcEUwYjd3U09jM3p4ZE53Ykd1Rkp1R1pBaWNG?=
 =?utf-8?B?bk1GaXlzS1lZNVpkYlZsZkFDdDhCbnkxNStMcmZmMSs0eS9DWkdLMkI0TTVh?=
 =?utf-8?B?YW1ONHVwTmkzaGN0clNYZmFibnZuWkd0bFZBdmxzM2N2WW9jMjdDcm5Samda?=
 =?utf-8?B?Mmdmc3hraHdYQzRYUnZTNStZeXlUMFNXekl3ck44eUhuU2pUd3JoYXM2Z2ZD?=
 =?utf-8?B?R09MOGNqcWdiM3ZnRWhvUWFFbzltUzhIOUU2b05uZThsTFdyVTJ6Zkc4NDRv?=
 =?utf-8?B?ZVpWNE5Uc084Zk50emdpQ0hqdmdNM1ZEdXRTN2RTbkQrdXA0Z1lWaVk0ZWdE?=
 =?utf-8?B?MmZFeU5sUjBMZHZXVjRsT2JtUXZOZlF1V0hjbGhNa2NXdFM0ZWFNK0dBdjJh?=
 =?utf-8?B?YUxjaUZwQjhNK3lpdHlCR2FXMGFTeFMyVkFrM3RkbzgxMnhxZHZTMmZ6M2VU?=
 =?utf-8?B?MERGc255TnFVcWd5SlNBTWs5TG4yUW9tYWdnYVFhcHRVVU5LYU1ueUlSSGFm?=
 =?utf-8?B?cllsU2FNNnJPdnJFSzk0Njh3NTdGNzRYL09RYVJrZ1ZSVTV0REI4aTBGcmZS?=
 =?utf-8?B?aXRiYlF3eWc3VjQ5T05ZSk96bUJYaXNoU0txaXppaXIzMUNlR0lUSGxHaVU1?=
 =?utf-8?B?eDdFYzQzTVFYQlgzYllzZFg3VFRlbkh5aTJ2R0ZPYzcxaHhwSFRIWjJiZXdi?=
 =?utf-8?B?RDhiQ1NHa0RKNVhPM2c4V09GRHVqd1dOd1FQRVZ6NjdiNVdKSDVtcFhKak5k?=
 =?utf-8?B?OXFrU050azdMS0pPKzhXZkxlaVBNc3kySDJ6SWIrSnhVRW13bVlVWjY4Wm9y?=
 =?utf-8?B?MitRSnljVkRicjUxbHRPazhhTmNmWmoxbFI1ZS95NXF1bDNPcWM2bGlBMTFr?=
 =?utf-8?B?NGkwZXp3QXZiY24yeDNMZ0xvRlF5MEhaeGNtY2ZmbjNOL2FVR0dlZFV3L2lh?=
 =?utf-8?B?dG5nU1BUdWhMeSt1THNZRXBvTFFqelJCTTVjb0U0UGNyUFh1a1Rsemt5cHNm?=
 =?utf-8?B?SE9Cb1IybktLRFRQNy85Yk9Pbm1VRGpYZzBYQUdwUUFWRTFySU5Sckd4WDha?=
 =?utf-8?B?eTlROG5Mam5Gc0ZuL1BBK1UxcHB5ZnBxSzJ6aHdNNXlBRnUrdVd0Vnd4UDF3?=
 =?utf-8?B?Rzh4RGlFNW5uZ0FraHJieGhqYjVwSS9JeENEcGdQbVRxd0NQb0ZQckQ2ZHZJ?=
 =?utf-8?B?NW5ZcGRqenF6M3g0c014Z2ZGQ3lKZ0RFLzhyT2crdlE5ZWV5aUZxMGlrb0RT?=
 =?utf-8?B?MEtsc25YY1BQWCtDdWdXaW5rTSszTVBnM1cxWk82L2dnQmswVmFjam8yMU9p?=
 =?utf-8?B?STFYb28zVndDR3VRZDZEeFl1ekNBdGRsVTVwUUZWM2x4YnpnaTlrU2ZIVE03?=
 =?utf-8?B?czNrU0NjdEZla3RYRkUwdm9kdXRSZDZucUl3OWtySXBTZlg4WEVvb0NicEc0?=
 =?utf-8?B?a3FvMVIzUUhvcGRJL24wVlJJTDNaeFpZb256cERQdHdBc0dKQlhaWHY1d0pX?=
 =?utf-8?B?UFJ5dVBDSlZ1enRoRGRUTEw0bytZNFpvS2dYQ2IxRFZuN2xwUy9SZ3B5M0hX?=
 =?utf-8?B?dUZlYWVtRGt0NnhSSDRLNlcvVlhxUVV2QmRiRW9OTjVFODdMM0lDU0JrZE1m?=
 =?utf-8?B?WDVmVVMvOVF0WHVZb3ZIK3NTbHI0MUFsQlErN0duVHh5Ui9TVjhyTFFPdk9z?=
 =?utf-8?B?RkEzcm1HalkycW1EeWFPTmlkZGFLQmFKVWZiV0c1UTVmYm5Bb2oreVVXaEdZ?=
 =?utf-8?Q?6Ra7+5tVpafutkjt9oq+6PPLmwC0Ry1mO4IWpwH89s+h2?=
x-ms-exchange-antispam-messagedata-1: Czvl8GvGZkUK9A==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be80de3f-35ba-4304-597e-08de6ac53973
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2026 06:00:43.7521 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eXKHGZ0nHMeb515MmsJ3LcPc3+QSLjOJMLlsnvtzzaa1Y9845b+ttnyR5ESN2PkVadPjLkVCCJTMK+7YTJVc+xrTb+WPd8S037skq8ADsoU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8892
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVsZCwgTWF0dGhldyA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU2VudDogMTIgRmVicnVhcnkgMjAyNiAyMzoyMw0K
PiBUbzogVXBhZGh5YXksIFRlamFzIDx0ZWphcy51cGFkaHlheUBpbnRlbC5jb20+OyBpbnRlbC0N
Cj4geGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBCcm9zdCwgTWF0dGhldyA8bWF0dGhl
dy5icm9zdEBpbnRlbC5jb20+OyBHaGltaXJheSwgSGltYWwgUHJhc2FkDQo+IDxoaW1hbC5wcmFz
YWQuZ2hpbWlyYXlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1JGQyBQQVRDSCAyLzddIGRy
bS94ZS9zdm06IFVzZSB4ZV92cmFtX2FkZHJfdG9fcmVnaW9uDQo+IA0KPiBPbiAxMi8wMi8yMDI2
IDE2OjM0LCBUZWphcyBVcGFkaHlheSB3cm90ZToNCj4gPiBSZXBsYWNlIHRoZSBkaXJlY3QgdXNl
IG9mIGJsb2NrLT5wcml2YXRlIHdpdGggdGhlIGhlbHBlciBmdW5jdGlvbg0KPiA+IHhlX3ZyYW1f
YWRkcl90b19yZWdpb24gdG8gZ2V0IHZyYW0gcmVnaW9uLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogVGVqYXMgVXBhZGh5YXkgPHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT4NCj4gPiAtLS0NCj4g
PiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9zdm0uYyB8IDkgKystLS0tLS0tDQo+ID4gICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9zdm0uYw0KPiA+IGluZGV4IDIxM2YwMzM0NTE4YS4uZTc3MzQ1NmFmMDQwIDEwMDY0NA0K
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zdm0uYw0KPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9zdm0uYw0KPiA+IEBAIC03NjIsNyArNzYyLDggQEAgc3RhdGljIGludCB4
ZV9zdm1fcG9wdWxhdGVfZGV2bWVtX3BmbihzdHJ1Y3QNCj4gZHJtX3BhZ2VtYXBfZGV2bWVtICpk
ZXZtZW1fYWxsb2NhdGkNCj4gPiAgIAlpbnQgaiA9IDA7DQo+ID4NCj4gPiAgIAlsaXN0X2Zvcl9l
YWNoX2VudHJ5KGJsb2NrLCBibG9ja3MsIGxpbmspIHsNCj4gPiAtCQlzdHJ1Y3QgeGVfdnJhbV9y
ZWdpb24gKnZyID0gYmxvY2stPnByaXZhdGU7DQo+ID4gKwkJdTY0IGJsb2NrX3N0YXJ0ID0gZHJt
X2J1ZGR5X2Jsb2NrX29mZnNldChibG9jayk7DQo+ID4gKwkJc3RydWN0IHhlX3ZyYW1fcmVnaW9u
ICp2ciA9IHhlX3ZyYW1fYWRkcl90b19yZWdpb24oYm8tDQo+ID50aWxlLT54ZSwNCj4gPiArYmxv
Y2tfc3RhcnQpOw0KPiANCj4gT2gsIEkgdGhpbmsgYmxvY2tfb2Zmc2V0IGlzIHRoZSByZWxhdGl2
ZSBvZmZzZXQsIHdoaWNoIGFsd2F5cyBzdGFydHMgZnJvbSB6ZXJvLA0KPiBidXQgaGVyZSB5b3Ug
d2FudCB0aGUgcmVhbCBhZGRyLCBidXQgdGhhdCBpbmZvIGNvbWVzIGZyb20gdGhlIHJlZ2lvbi4u
Lg0KPiANCj4gSSB3YXMgZ29ubmEgc2F5IHNpbmNlIHlvdSBzZWVtIHRvIGFscmVhZHkgaGF2ZSBi
by0+dGlsZSBhYm92ZSwgd2h5IG5vdCBqdXN0DQo+IHBpY2sgdGhlIFZSQU0gZnJvbSB0aGF0IHRp
bGU/IExpa2Ugd2l0aCBiby0+dGlsZS0+bWVtLnZyYW0/IEJ1dCBJIHRoaW5rIGJvLQ0KPiA+dGls
ZSBpcyBOVUxMIGV2ZW4gaGVyZSBzbyBhYm92ZSBsb29rcyBsaWtlIGl0IHdpbGwgY3Jhc2g/DQo+
IA0KPiBXaGF0IGFib3V0IGxvb2tpbmcgYXQgdGhlIGJvIGZsYWdzIG9yIGN1cnJlbnQgdHRtIHBs
YWNlbWVudCB0byBmaWd1cmUgb3V0DQo+IHdoaWNoIFZSQU0gdGhpcyBiZWxvbmdzIHRvPyBUaGVy
ZSBsb29rcyB0byBhbHJlYWR5IGJlDQo+IHJlc190b19tZW1fcmVnaW9uKCkgYW5kIHlvdSBoYXZl
IHJlcyBhYm92ZS4NCg0KWWVzIGxvb2tzIGxpa2UgcmVzX3RvX21lbV9yZWdpb24gd2lsbCB3b3Jr
Lg0KDQpUaGFua3MsDQpUZWphcw0KPiANCj4gPiAgIAkJc3RydWN0IGRybV9idWRkeSAqYnVkZHkg
PSB2cmFtX3RvX2J1ZGR5KHZyKTsNCj4gPiAgIAkJdTY0IGJsb2NrX3BmbiA9IGJsb2NrX29mZnNl
dF90b19wZm4oZGV2bWVtX2FsbG9jYXRpb24tDQo+ID5kcGFnZW1hcCwNCj4gPg0KPiBkcm1fYnVk
ZHlfYmxvY2tfb2Zmc2V0KGJsb2NrKSk7IEBAIC0xMDMzLDkgKzEwMzQsNyBAQA0KPiA+IHN0YXRp
YyBpbnQgeGVfZHJtX3BhZ2VtYXBfcG9wdWxhdGVfbW0oc3RydWN0IGRybV9wYWdlbWFwDQo+ICpk
cGFnZW1hcCwNCj4gPiAgIAlzdHJ1Y3QgZG1hX2ZlbmNlICpwcmVfbWlncmF0ZV9mZW5jZSA9IE5V
TEw7DQo+ID4gICAJc3RydWN0IHhlX2RldmljZSAqeGUgPSB2ci0+eGU7DQo+ID4gICAJc3RydWN0
IGRldmljZSAqZGV2ID0geGUtPmRybS5kZXY7DQo+ID4gLQlzdHJ1Y3QgZHJtX2J1ZGR5X2Jsb2Nr
ICpibG9jazsNCj4gPiAgIAlzdHJ1Y3QgeGVfdmFsaWRhdGlvbl9jdHggdmN0eDsNCj4gPiAtCXN0
cnVjdCBsaXN0X2hlYWQgKmJsb2NrczsNCj4gPiAgIAlzdHJ1Y3QgZHJtX2V4ZWMgZXhlYzsNCj4g
PiAgIAlzdHJ1Y3QgeGVfYm8gKmJvOw0KPiA+ICAgCWludCBlcnIgPSAwLCBpZHg7DQo+ID4gQEAg
LTEwNzIsMTAgKzEwNzEsNiBAQCBzdGF0aWMgaW50DQo+IHhlX2RybV9wYWdlbWFwX3BvcHVsYXRl
X21tKHN0cnVjdCBkcm1fcGFnZW1hcCAqZHBhZ2VtYXAsDQo+ID4gICAJCQkJCSZkcGFnZW1hcF9k
ZXZtZW1fb3BzLA0KPiBkcGFnZW1hcCwgZW5kIC0gc3RhcnQsDQo+ID4gICAJCQkJCXByZV9taWdy
YXRlX2ZlbmNlKTsNCj4gPg0KPiA+IC0JCWJsb2NrcyA9ICZ0b194ZV90dG1fdnJhbV9tZ3JfcmVz
b3VyY2UoYm8tPnR0bS5yZXNvdXJjZSktDQo+ID5ibG9ja3M7DQo+ID4gLQkJbGlzdF9mb3JfZWFj
aF9lbnRyeShibG9jaywgYmxvY2tzLCBsaW5rKQ0KPiA+IC0JCQlibG9jay0+cHJpdmF0ZSA9IHZy
Ow0KPiA+IC0NCj4gPiAgIAkJeGVfYm9fZ2V0KGJvKTsNCj4gPg0KPiA+ICAgCQkvKiBFbnN1cmUg
dGhlIGRldmljZSBoYXMgYSBwbSByZWYgd2hpbGUgdGhlcmUgYXJlIGRldmljZSBwYWdlcw0KPiA+
IGFjdGl2ZS4gKi8NCg0K
