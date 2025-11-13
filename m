Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE378CD98FC
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 23:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9724E10E95B;
	Thu, 13 Nov 2025 23:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jKdnnBQt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF1F10E95A
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 23:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763075403; x=1794611403;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=m2UqiDnKhxwhsUJILlDKE5NC1DHC2KIrbqsGU3xeUHU=;
 b=jKdnnBQt6yFV7Eel8qPX7xjkDI192Ig027WT5MI1CbAadqkMZ097ZzCH
 j3mGcji7uzFB6ePWZNn4LwpK1pc3aX3J7yxBkvYWlwXMeX9VtODHw5Gq5
 5soMG330ww+j5a9M93O2EfpjVvaKdNaoFooVOCWLlC0atjb8IlwlHvaVF
 WMelS+gVmDzmMHKnXlwMEq/FTYJ4CHjgvrffWsqqTfme+a1/d2AqeYkwU
 HOsYkEKbvq7qwS0sTywrpkEgjP9mt9EQ7M3loa/txAn9jUb3DCXzuCOE4
 z1ceOSaJNDiHAl0M8Y8HoBJZrXjex9lR5r7nbVt0XSbU3TFUwzg9WFdR7 g==;
X-CSE-ConnectionGUID: AZOw32wnSTudndf28ja7yg==
X-CSE-MsgGUID: mhd5SaYTR1uaY7mgAKMPZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="76269313"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; d="scan'208";a="76269313"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 15:10:03 -0800
X-CSE-ConnectionGUID: c57A4iyIR1iaKlaQAeG8Jw==
X-CSE-MsgGUID: 0Ld3kMtTQgqXpTydaI5MvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; d="scan'208";a="188876564"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 15:10:02 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 15:10:02 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 15:10:02 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.53) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 15:10:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UlJclrgKu+ZR6ogKxDb5OTQuGhBKagFn6xzxlCiideGmFF5dl3Wm7znlNLPcwAe//FgDRKIrgZmLg/FJqjdt1nUUlTW5INc46fBLgLU1JNj29L9MD4jK2dM22BuPP9C0e8blgHV/+pCFbrHGB4jv1JB04drJjrXgSxuK7lLv+r2WUcH28U8oFjAMGwLs7sUbKw30hDqjK/b9CMhBuPvefJHyl8AzgflAYXjnE5X9JH4Pg6Gtj2uWU2ucyX9qd12FgqIqM3xW1vgTxaKmCUiRfJiYRlaw/iOlVjTk3G75jozUM9ftg9LgyZPIoCvA1qcDlyeBTuFyXGLNYaue4c0ttQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2UqiDnKhxwhsUJILlDKE5NC1DHC2KIrbqsGU3xeUHU=;
 b=G/RBKt3ptPS4Ss6jvr4feOm2m5RyMUpx0RuahcDKcvIuR2Zk7fFrfp3rJTsuXonPRA1Lwv5wKK5+wZP7r4ZnvzrxgDybk2xNiKsSv2zNNsyQpaKAwwjChnpggTuWC/9+NjdaCflgAJV10mOYHHeLM/fP9s+lEh/wLeumDqHXLzsks4HcE1hf25Qv42GdKEu1ilTxn3ci384abojNWg0K2auoHAZGaKLrHt7kbwrHDnvlRl82WVVm+BucLn+ruo+fC4pQSAOwWJ0uA8rFVofTa6kiaV8Rlg6SEqyWNOCfleuRGVTfJfnKmwWsYPRljAHubJUZ1ydE+zslPwTBdoSGRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DS0PR11MB7631.namprd11.prod.outlook.com (2603:10b6:8:14e::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.17; Thu, 13 Nov 2025 23:09:54 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 23:09:54 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v4] drm/xe/uc: Add stop on hardware initialization error
Thread-Topic: [PATCH v4] drm/xe/uc: Add stop on hardware initialization error
Thread-Index: AQHcVDBFCjYK+3XJ/0KEh+wy0Qwn+rTxPNoA
Date: Thu, 13 Nov 2025 23:09:54 +0000
Message-ID: <95a3dd458fd57ff11513a1e5682b40c295a42d0c.camel@intel.com>
References: <20251112234453.1871032-1-zhanjun.dong@intel.com>
In-Reply-To: <20251112234453.1871032-1-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DS0PR11MB7631:EE_
x-ms-office365-filtering-correlation-id: 5743829a-50af-4c63-45ce-08de2309c1bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?bUJOVlczOGt0aGwzdVNycXdyNjZsWHByN3MwSXdKNHZXS1FBT1FMamJiZk5o?=
 =?utf-8?B?Tlg3MEd1R20wUHkydGZNU3NGL3dYQU42eUo5c3NnSXFwMjBVeFBoWEI1ajFy?=
 =?utf-8?B?RTUwTUsvTmVSZDFtWTVrRVpvUzRndWlGUS94MnF3cU9UVFZ6MzVkRG9nUWsw?=
 =?utf-8?B?V1l5MjFiZnBUOFJXeFo3K1crU3gvKzlONzBWRVZYcVpOeDhNUkpRRzdsbVRB?=
 =?utf-8?B?SldTZUxZZ204dU81d3VGRDhyS1JyZnVwVTNac1VJQTZMZ0pHYmg5N2ZxUW4y?=
 =?utf-8?B?YWJqTk55d0lDWG5pR1p1TU52cTREWC9BYi9SMnA5alJaUytrVGhPWmJQeDgr?=
 =?utf-8?B?eFIrSVEyNkZHZjh3eTRMNXRmakc1QmhuQU92Y0JVNDlrY214R0FxNHdWekZI?=
 =?utf-8?B?NDhoTmZzZHZoWnAxNVJySnpLQ0hxd25naHM4UHJaSlMxVWc5b1RYcXZJTUJv?=
 =?utf-8?B?VUw1dGpMVkNtOGtlQWRzVllpa1JnL2pOTDZDR2hkRkFNUG5zTyt6Q3BTSmlZ?=
 =?utf-8?B?UGVVWlRCYURyVGltVWpwZWIxTkNoVURTZHJLZDZhSnBlem5IaUcwUmhHOC9s?=
 =?utf-8?B?R0RFajBlRC9vb09hM2ZTNldVMUVJaDBobzFwRjJlcmxvNjVYQ3dEVkF5MVpr?=
 =?utf-8?B?WVhqMWRvTVJRakpUZExEbE8wZTNsbG52TVRnUVoyWllGUWhBNWpvUzJLeXVZ?=
 =?utf-8?B?d0pNdkh1aDNHWGdCZUQ4OW1DcFNYcFl2ZUs3eUZQaVJYZkpJWXVCSm5NR1kz?=
 =?utf-8?B?WmJBTkZDYXAyRUlKN1hBRWhrOCttSEV1K09HUkNLa3JGYi9pK29UM0VsYXVz?=
 =?utf-8?B?TmNwUGs5cXlTM0RteGRmMWo2cW54a2s1UWVOWkZLSXFuUmFSR3d2YThiNEdM?=
 =?utf-8?B?NUZYY1cyK1lUZ1NyVkV1UkRrTjkxbk9TWFEzRTZ4aGU4Q2R5VTNKY0pXR29U?=
 =?utf-8?B?aGVEMXlJL0drakpHRWRTdm1wam05VE1iLzBIQXU5SzhkeE83d2V1SGcrTFM4?=
 =?utf-8?B?OUdXRDVXTmxDbW9QMm1sS2c5YWJEbjZOcTRudWw1WlhLbkxJcWpVSHltTENa?=
 =?utf-8?B?TVBDT1M1ZG5nb3Mwc2d5VHU5V2l6NjRBeThCQ0lhVmhZSFJ4RFBYWGJnL1JM?=
 =?utf-8?B?QVdhNUt6ZjM3U2tJSWdJaGl0cG8rQ1Z5eDFXcGRyT2RLRUFycTNzRVJrd09Z?=
 =?utf-8?B?KzZ5SmZ5U2dzRXVCWThzcXRBV0tYakJEaFM2T2VxVjZ2bExjOUxBT3FCdnJP?=
 =?utf-8?B?SlRuMEgxM0VQN25mMlhlcmwvZys0c2JjcFl0MmdkR3h3blk4WlBqdzhlVDNK?=
 =?utf-8?B?WXNFSGUwbDRNTGRHMWt1TlBqc3V6QTB6WE9ab3RUVUZHS25ubHIxdGpBTDl4?=
 =?utf-8?B?b1E0U1F0MUpnaDJXZEprT3RRLzY5eGNHMkhqZGhkbU5zalNrLzdEYXJjQk5p?=
 =?utf-8?B?V3Y2R2x5MjV6cTkxU1FtZk13Wm5WVEpnRjVFWkNoNDZMS1hrMmh3U2t3eldM?=
 =?utf-8?B?N281WElTZVBuUzJXcVJvbDdueUdRcFltT25rT3o1QmFSQmgvckM1bEthZ056?=
 =?utf-8?B?c29nYU1PQTR6cTlNNlJ4T00rSEoyeGZiUWJTaUx5alJwTE5GZ0U2YjRTc2JO?=
 =?utf-8?B?NmZ5bVpUUXJaRUFXczNJRGRFSmNNTXBLS01ydnVHQXNvR2k0eS9Vb0o2SWZV?=
 =?utf-8?B?bmVrR3BPc0RHbDZkMkhlaEhuOXo2SnM3dHNjbytNZU1CYnZZZ1lWYkJaOGQw?=
 =?utf-8?B?ZnFvYjRuQmlESkUvWkRZSDE0WUFYTFFqbURtSmtheDFRUGI3QXJUWlhTWTgv?=
 =?utf-8?B?TlMyS2gxQzRudndmb2U1U285UU5aRkx0aEprUEhkWjJyOTFRaXIvaDBqSFFt?=
 =?utf-8?B?S2psdXo1bWxZQ3pwK09ZODhQMENFeWQ5dmlWN1VBQTFWa2Vkck96Z3B0VFBQ?=
 =?utf-8?B?TGhPcVdIMkhvTi9YWWl1SEtMY2ozVm5ua0FHcGdPc3MrY1R5YVpsRzg0UGRQ?=
 =?utf-8?B?RlV3T2xzejlnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NHhNRUZYRU9QM0VnYUxtZXhyMWQwZVpyd1NBRUNxSXcyUFg2TVpKdlBnYnlJ?=
 =?utf-8?B?aU9kdVhWbkVtekdCMEk2MHhxQ1piTEVTaGg0b3VYZDRkOUhabTJuZzZqYmtO?=
 =?utf-8?B?YW9LcmdaSmtlUDM4TTRha0ZOb3NzUS8rVlNwYjlwemNLMHhJOG94R0dRYmhB?=
 =?utf-8?B?VGQ3aVhCQ1lURWJnYUxXNnRkbDR0RDVIV01mRU5aLzVTTC9JYWUxOVpYQVhT?=
 =?utf-8?B?bHVjeUpaZDcvUGJMUzBvUWFxbHRJd2ZidmRRMmxaanhWV3pQNGwvb2tQZ0ZD?=
 =?utf-8?B?cC9ESjZqTzRIK2laMlBrMGMvMThKaHZXL0dFMnNuaVUxWG5wNytlOHFPUkhU?=
 =?utf-8?B?YUk2aERCczhQVGFiUHgyM1ZZM2xoUC9WVFVSaVhBUUQ0dEFVZW9Sd2wwSHFU?=
 =?utf-8?B?eTg1STFNb0owRHp6bjdaK1FKNjJVL2VkN1FLZmNoVWNtMG82K3g4MVRBTHdF?=
 =?utf-8?B?UExtZEgxanR4N2l0d2lVbWI3dlgwTmFaK05TT0sxRkdNVC8wLy96dWJ3Zzc0?=
 =?utf-8?B?R1g3Y1hrT3ZBZmhjY3RZRVV1T1F2MmxCOUZzcDFZQVptcXo4VXhiei9LR2pp?=
 =?utf-8?B?alhLc3FTUUFoQjkxS0JQVzVEelg1Y2dUZFlTdm5JWFV6dnRxYmltLzFVVzVj?=
 =?utf-8?B?eXNIcUplU0JWcW9JRnNTUTBWdnplVjFWSURvcTZGQzNKbjRWWWxrQ0N1T2Ra?=
 =?utf-8?B?TFc2MXlRbEJlTGFTeEhnUWMvcmZjcGgvZ1dnSjZDWjBIT285UkJ2aFdsUDNv?=
 =?utf-8?B?RFMxa3FvYm93OW02dUovNnYvL2dnUFpSeHpkbWhRLzY0T0tra1EvRDJNZlZY?=
 =?utf-8?B?YmlEMys1MnhrVUdCTVpLcmEvMlpza1FRQ2hYaHpPRlp5bVQ4Z1VsL1BoVzcw?=
 =?utf-8?B?NmVmam5nN096cU1zazRyOTJUMWFIbGRwR3RiR1hOR1V4VUhrTmF0aFljNFB1?=
 =?utf-8?B?ZkZzemZIelNIemVHWnF1a1M3L3dpQTlKTVdwNzJ1dENnanFoc292SGVlNGxi?=
 =?utf-8?B?WkM4L1lrNUlaQzZwTzljMkRWYVpYVE0zbURXNmE1NlVwU1MwNTdHSmh1SjRH?=
 =?utf-8?B?S245a3JFWXlXRFc4MUhzV2gzRVpNRXprUEJWNUtHMEVKaDJ4ck41UU9KelF0?=
 =?utf-8?B?REU1T0RRL1NOWlpxK0dRenVyNjd6dG1jSzdwQTdQQVNYeDBtSGNWYmMwSTZB?=
 =?utf-8?B?K3FGUkFWaU53T2FnVUlPbDdaNnNvU2RFVWZHTFNmdWNYckhyS2luWUM5NGhX?=
 =?utf-8?B?UGJJRWNIRS9SZUtRRGhKZXlXeHVTSm9iTEtJbU5yOVJQR2ZKUlhWa3lVdHNU?=
 =?utf-8?B?RVB4UTgyVkVYZytSUFpNV2RQN05aWkNyOGJYT2pjU0RGeHRWbjhKd2kzNGxh?=
 =?utf-8?B?ZWdJLzFBYkQxRXg1TFcyNEFHa3ppcVhQN3pPMDFQN0VwNDN5TEVBL1lQcmlR?=
 =?utf-8?B?b1FKYzdJd0tTL0lGWDE5RHFzU2ZudCtzQ3NETGNhL2pvbmd5RisxYWdkMmtO?=
 =?utf-8?B?Mmdtek9RVGUyUUpianloL0daRnE2TWVFaDNnS1Nhai9hMkRRWHJ1dm9oK3JL?=
 =?utf-8?B?VGxVbEEyY1JIUjdYRk1xRUNGdkEyTDdCL252dHpIOWJWMUdkZlBaV0VFckY3?=
 =?utf-8?B?SXJNYTcvTHNxV01VWTkvUVJ2OUNRWXY5S1NYWExubzJVYUd4cm1CZ21hUlNN?=
 =?utf-8?B?NmxNakxkOWE0ZG9uMzNkUzdjRGhsOE41bjhZMU84dDhsN0ptbVRHNU52dUV0?=
 =?utf-8?B?YzB4ZitEN0p1bmJBaDZUc0NIZUdLeEgwTVpiWWM1azRmQ3NpTW4wRkpuYVYv?=
 =?utf-8?B?a0RTOVBaejVvV2FmWlVnSWkvenJsTWd3aXY4MHdKWTlOdmZJcUpUeFNNWHpC?=
 =?utf-8?B?cE9qMUp3OEVWeUJnbDRBbWhlelpXU3k0ekM5Rm1KTk5Xb3pUVHo1OEpjamJU?=
 =?utf-8?B?b0Z1SWgxem02UWhydTl5dWMrcXloUXNsRndBbGVEeDZaYzJjWFQ1UDViSGtE?=
 =?utf-8?B?c00rc2FjQXVRRzIrL1JhaloxUG92OGF6SUszaHpBZVQvb2F5YXZxU2NpdGUx?=
 =?utf-8?B?NVpUU0FOelc4TjJsYXhOZE5BQWV0V3JYbmFneUZGL2tKaWtKbjY2cmEyR0p2?=
 =?utf-8?B?OUxHL2l2RTc5OFJjbEhpYy9hY05NM1NPc2pPZjVaWFdVdUs1K2hJT1plM2E2?=
 =?utf-8?B?Snc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6BD279D7D63BC44E903ECAA9B5B6C3DB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5743829a-50af-4c63-45ce-08de2309c1bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 23:09:54.4842 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FXYLGOkK6qq2bctZ+tRo0u+u9xqMv7EQMHzJMVgFm7MV2F5wvAq2zUhj6Lum1QnCf5bwLSCYb0vXn4U4YFVQ3erVJvgjJhU5lDhE00topFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7631
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

T24gV2VkLCAyMDI1LTExLTEyIGF0IDE4OjQ0IC0wNTAwLCBaaGFuanVuIERvbmcgd3JvdGU6Cj4g
T24gaGFyZHdhcmUgaW5pdCBmYWlsLCB0aGUgaGFyZHdhcmUgbWlnaHQgbm8gbG9uZ2VyIHJlc3Bv
bnNlLCBhZGQgR3VDCj4gc3RvcAo+IHRvIGNsZWFuIHVwIGV4ZWNfcXVldWUgaXRlbXMuCj4gQXQg
ZHJpdmVyIHVubG9hZCBwYXRoLCBhZGQgY2FsbCB0byBHdUMgc3RvcCB0byBjbGVhbiB1cCBxdWV1
ZSBpdGVtcy4KPiBUaGlzCj4gY2xlYW4gdXAgd2lsbCBmaXggbWVtb3J5IGxlYWsgaXNzdWUgbGlr
ZToKPiBbwqAgMTg5Ljk5NzkwNF0gW2RybTpkcm1fbW1fdGFrZWRvd25dICpFUlJPUiogbm9kZSBb
MDBmMGYwMDAgKwo+IDAwMDA3MDAwXTogaW5zZXJ0ZWQgYXQKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZHJtX21tX2luc2VydF9ub2RlX2luX3JhbmdlKzB4MmMwLzB4NTEwCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9feGVfZ2d0dF9pbnNlcnRfYm9fYXQrMHgxNjcv
MHg1NDAgW3hlXQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4ZV9nZ3R0X2luc2Vy
dF9ibysweDFhLzB4MzAgW3hlXQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX3hl
X2JvX2NyZWF0ZV9sb2NrZWQrMHgxZjMvMHg5MzAgW3hlXQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB4ZV9ib19jcmVhdGVfcGluX21hcF9hdF9hbGlnbmVkKzB4NTkvMHgxZjAgW3hl
XQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4ZV9ib19jcmVhdGVfcGluX21hcF9h
dF9ub3ZtKzB4YWUvMHgxNDAgW3hlXQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4
ZV9ib19jcmVhdGVfcGluX21hcF9ub3ZtKzB4MjMvMHg0MCBbeGVdCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHhlX2xyY19jcmVhdGUrMHgxZTQvMHgxN2MwIFt4ZV0KPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgeGVfZXhlY19xdWV1ZV9jcmVhdGUrMHgzOGEvMHg2YTAg
W3hlXQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4ZV9ndF9yZWNvcmRfZGVmYXVs
dF9scmNzKzB4MTE3LzB4OGIwIFt4ZV0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
eGVfdWNfbG9hZF9odysweGEyLzB4MjkwIFt4ZV0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgeGVfZ3RfaW5pdCsweDM1Ny8weGFiMCBbeGVdCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHhlX2RldmljZV9wcm9iZSsweDQwMy8weGEzMCBbeGVdCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHhlX3BjaV9wcm9iZSsweDM5YS8weDYxMCBbeGVdCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxvY2FsX3BjaV9wcm9iZSsweDQ3LzB4YjAKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGNpX2RldmljZV9wcm9iZSsweGYzLzB4MjYwCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlYWxseV9wcm9iZSsweGYxLzB4M2IwCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fZHJpdmVyX3Byb2JlX2RldmljZSsweDhj
LzB4MTgwCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldmljZV9kcml2ZXJfYXR0
YWNoKzB4NTcvMHhkMAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBiaW5kX3N0b3Jl
KzB4NzcvMHhkMAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkcnZfYXR0cl9zdG9y
ZSsweDI0LzB4NTAKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3lzZnNfa2Zfd3Jp
dGUrMHg0ZC8weDgwCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGtlcm5mc19mb3Bf
d3JpdGVfaXRlcisweDE4OC8weDI0MAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2
ZnNfd3JpdGUrMHgyODAvMHg1NDAKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAga3N5
c193cml0ZSsweDZmLzB4ZjAKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX194NjRf
c3lzX3dyaXRlKzB4MTkvMHgzMAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4NjRf
c3lzX2NhbGwrMHgyMTcxLzB4MjVhMAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBk
b19zeXNjYWxsXzY0KzB4OTMvMHhiODAKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
ZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4Nwo+IGFuZDoKPiBbwqAgMTg5Ljk3Mzc3
NV0geGUgMDAwMDowMDowMi4wOiBbZHJtXSAqRVJST1IqIFRpbGUwOiBHVDE6IEdVQyBJRAo+IG1h
bmFnZXIgdW5jbGVhbiAoMS82NTUzNSkKPiBbwqAgMTg5Ljk4MTczMV0geGUgMDAwMDowMDowMi4w
OiBbZHJtXSBUaWxlMDogR1QxOsKgwqDCoMKgwqDCoMKgdG90YWwgNjU1MzUKPiBbwqAgMTg5Ljk4
MTczM10geGUgMDAwMDowMDowMi4wOiBbZHJtXSBUaWxlMDogR1QxOsKgwqDCoMKgwqDCoMKgdXNl
ZCAxCj4gW8KgIDE4OS45ODE3MzRdIHhlIDAwMDA6MDA6MDIuMDogW2RybV0gVGlsZTA6IEdUMTrC
oMKgwqDCoMKgwqDCoHJhbmdlIDIuLjIKPiAoMSkKPiAKPiBDbG9zZXM6IGh0dHBzOi8vZ2l0bGFi
LmZyZWVkZXNrdG9wLm9yZy9kcm0veGUva2VybmVsLy0vaXNzdWVzLzU0NjYKPiBDbG9zZXM6IGh0
dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0veGUva2VybmVsLy0vaXNzdWVzLzU1MzAK
PiBTaWduZWQtb2ZmLWJ5OiBaaGFuanVuIERvbmcgPHpoYW5qdW4uZG9uZ0BpbnRlbC5jb20+Cj4g
LS0tCj4gdjQ6IEFkZCBtZW1vcnkgbGVhayBmaXgKPiDCoMKgwqAgU3dpdGNoIHRvIHhlX3VjX3N0
b3AKPiB2MzogU3dpdGNoIHRvIHhlX2d1Y19zdG9wCj4gdjI6IFN3aXRjaCB0byB4ZV9ndWNfY3Rf
c3RvcAo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Yy5jIHwgMyArKy0KPiDCoGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV91Yy5jwqAgfCAyICsrCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3VjLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYwo+IGluZGV4
IGVjYzNlMDkxYjg5ZS4uYjRjOTY3M2Y4NGQ2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndWMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYwo+IEBAIC02
NjEsNiArNjYxLDcgQEAgc3RhdGljIHZvaWQgZ3VjX2ZpbmlfaHcodm9pZCAqYXJnKQo+IMKgwqDC
oMKgwqDCoMKgwqB1bnNpZ25lZCBpbnQgZndfcmVmOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoGZ3
X3JlZiA9IHhlX2ZvcmNlX3dha2VfZ2V0KGd0X3RvX2Z3KGd0KSwgWEVfRk9SQ0VXQUtFX0FMTCk7
Cj4gK8KgwqDCoMKgwqDCoMKgeGVfZ3VjX3N0b3AoZ3VjKTsKPiDCoMKgwqDCoMKgwqDCoMKgeGVf
dWNfc2FuaXRpemVfcmVzZXQoJmd1Y190b19ndChndWMpLT51Yyk7CgpLaW5kIG9mIGEgZmx5Ynkg
Y29tbWVudCBoZXJlLCBidXQgaXQgZG9lc24ndCBsb29rIHJpZ2h0IHRoYXQgdGhlCmVuY2Fwc3Vs
YXRpb24gaXMgYWxsIG92ZXIgdGhlIHBsYWNlIGhlcmUgYW5kIGluIHRoZSBsYXRlciBmdW5jdGlv
bnMgaW4KdGhpcyBwYXRjaC4gV2h5IGFyZW4ndCB3ZSBjYWxsaW5nIHhlX2d1Y19zYW5pdGl6ZSgp
IGhlcmU/Cgo+IMKgwqDCoMKgwqDCoMKgwqB4ZV9mb3JjZV93YWtlX3B1dChndF90b19mdyhndCks
IGZ3X3JlZik7Cj4gwqAKPiBAQCAtMTU5OCw3ICsxNTk5LDcgQEAgdm9pZCB4ZV9ndWNfc3RvcF9w
cmVwYXJlKHN0cnVjdCB4ZV9ndWMgKmd1YykKPiDCoHZvaWQgeGVfZ3VjX3N0b3Aoc3RydWN0IHhl
X2d1YyAqZ3VjKQo+IMKgewo+IMKgwqDCoMKgwqDCoMKgwqB4ZV9ndWNfY3Rfc3RvcCgmZ3VjLT5j
dCk7Cj4gLQo+ICvCoMKgwqDCoMKgwqDCoHhlX2d1Y19zdWJtaXRfcmVzZXRfcHJlcGFyZShndWMp
OwoKU2hvdWxkbid0IHdlIGp1c3QgY2FsbCB4ZV9ndWNfcmVzZXRfcHJlcGFyZSgpIGZyb20KeGVf
Z3VjX3N0b3BfcHJlcGFyZSgpIGluc3RlYWQgdG8ga2VlcCB0aGUgb3JkZXJpbmc/Cgo+IMKgwqDC
oMKgwqDCoMKgwqB4ZV9ndWNfc3VibWl0X3N0b3AoZ3VjKTsKPiDCoH0KPiDCoAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdWMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV91
Yy5jCj4gaW5kZXggNDY1YmRhMzU1NDQzLi42YzcyY2UzMDVkNmMgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3VjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdWMu
Ywo+IEBAIC0xNzMsNiArMTczLDcgQEAgc3RhdGljIGludCB2Zl91Y19sb2FkX2h3KHN0cnVjdCB4
ZV91YyAqdWMpCj4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiAwOwo+IMKgCj4gwqBlcnJfb3V0Ogo+
ICvCoMKgwqDCoMKgwqDCoHhlX3VjX3N0b3AodWMpOwo+IMKgwqDCoMKgwqDCoMKgwqB4ZV9ndWNf
c2FuaXRpemUoJnVjLT5ndWMpOwoKQW5kIGFnYWluLCB3aHkgeGVfZ3VjX3Nhbml0aXplKCkgaW5z
dGVhZCBvZiB4ZV91Y19zYW5pdGl6ZSgpPwoKPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGVycjsK
PiDCoH0KPiBAQCAtMjI4LDYgKzIyOSw3IEBAIGludCB4ZV91Y19sb2FkX2h3KHN0cnVjdCB4ZV91
YyAqdWMpCj4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiAwOwo+IMKgCj4gwqBlcnJfb3V0Ogo+ICvC
oMKgwqDCoMKgwqDCoHhlX3VjX3N0b3AodWMpOwo+IMKgwqDCoMKgwqDCoMKgwqB4ZV9ndWNfc2Fu
aXRpemUoJnVjLT5ndWMpOwoKQW5kIGhlcmUuLi4gSW4gdGhpcyBmdW5jdGlvbiBhYm92ZSB3ZSBo
YXZlIHhlX2h1Y19sb2FkKCkgYXMgd2VsbCwgc28gYXQKYSBtaW5pbXVtIGl0IHNlZW1zIGxpa2Ug
d2Ugc2hvdWxkIGNhbGwgdGhhdCBoZXJlLiBCdXQgSU1PIHdlIHNob3VsZApqdXN0IG1vdmUgdGhp
cyB0byB4ZV91Y19zYW5pdGl6ZSgpLgoKSSByZWFsaXplIG1vc3Qgb2YgdGhpcyBpc24ndCBkaXJl
Y3RseSByZWxhdGVkIHRvIHRoZXNlIGJ1ZyBmaXhlcywgc28gaWYKeW91IGFncmVlLCBoYXBweSBm
b3IgdGhlc2UgdG8gYmUgaW4gYSBzZXBhcmF0ZSBjb21taXQgd2l0aCB0aGUKZXhjZXB0aW9uIG9m
IG15IGNvbW1lbnQgYXJvdW5kIHhlX2d1Y19zdWJtaXRfcmVzZXRfcHJlcGFyZSgpIGFib3ZlLgoK
VGhhbmtzLApTdHVhcnQKCj4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiByZXQ7Cj4gwqB9Cgo=
