Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D40CAC5B0
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 19:42:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718C610E158;
	Fri,  3 Oct 2025 19:42:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ShjDaNg+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF76310E158
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 19:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759520557; x=1791056557;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Dt4odnPdg/YbwMR1JOCqj6i/hkvHGOcDICkHdyHQJng=;
 b=ShjDaNg+DhPizN6gxZd2yVl4SfaDM5pSFwzZ62aU8TejhnkFAKaQDLiV
 q5RGXY5LkxBhP1XjHfVnEVoMDJMLHh8LhH7el4ebYRUnsddhw/CzqFCvo
 x6MG7/y50ThddbfwWQPcK/rPPWx7RHJijwvKXPhshTK6/Dan4T1mt9CVH
 cfkb+Egt3d6X84/1tzxF2KK1vfiEVEai1rA6+lCe/PkzaPMYIIDINYm9P
 fEyEHnZ01XMv55Uxc3ydJtRsKVZDExsV3WW02JpDH9yiR4jnSD9PwYAai
 di8s2Huoc4EW1m3aAO7jOFo39rHQn1zcbIoRgyIO+18gRRkAhXl5Y6eEs g==;
X-CSE-ConnectionGUID: FVePdyZXSaawOsezPfI19g==
X-CSE-MsgGUID: a0ok+lOWSXSrcut3HsPJaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="79234708"
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="79234708"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 12:42:36 -0700
X-CSE-ConnectionGUID: rXK6pvPSQNOXNjGTBrHcDA==
X-CSE-MsgGUID: CoyPI0s9S/uILPgcxRNpEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="183758113"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 12:42:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 12:42:35 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 12:42:35 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.31) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 12:42:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TLIf358w9Cb7aCzuWvhHJPj2B9iHod8SouRLB9266vpvqbcolgetPQRq5qG3ssVtu7YifOLUpXTXukmc4edXRbB26krD01Uf/JIjrNnv0g5lIFHY6XLed5Hl7YZ2qjflwg9H/t5zVzPnaB7G5LA0uKhI26sXUf/JCVZba+Sh8RWAyubWB/PkFjQqeQLg9Xk5wgHIlD5vsVO2n5D2kR9clmULxGrowByfk6MxUSdn95kAJelFu2kmxkKu57M2Wj7N8SkeNaGsPJKZyaSL3E/pANbSnQKTgzjzVFrBCsGEvJ43UswyhipKcwyp9Qsq6FqlmaJekTJBvsjF2qioNcrqZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dt4odnPdg/YbwMR1JOCqj6i/hkvHGOcDICkHdyHQJng=;
 b=WhwA99x5TmIM5JY736vwvyGuwlQp7Ql+khW+m9CPDB6QWYK99mysRarOvZiJuquPUinbACOsnK/LABeqLP7sKJ7OVy0yaO1Pyn0K1s5SLvg/h50/tw9X6aw7O92729MkiS3GmRKHIHC8E4x0vSONGIvuJ8xXxVAkHi+w0yq9LG7/uu9LbqwzmZmpGir5yOTcNuLfncJiDa+/opXipKx4x3L0ORiknzCqSFF5t2we7X/BVRES52a6mNfA6EUYLUrvbUBdlyN2qOU3wtQKlFlfG1GiYP1LpbLn1mYgJbp9Acq/kHKwnK6uDn1At/wY1YLSkFZxLEL0DCl1F6aVzyv+Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SJ0PR11MB4783.namprd11.prod.outlook.com (2603:10b6:a03:2af::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.16; Fri, 3 Oct 2025 19:42:26 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 19:42:26 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 7/7] drm/xe: Check for GuC responses on disabling
 scheduling
Thread-Topic: [PATCH 7/7] drm/xe: Check for GuC responses on disabling
 scheduling
Thread-Index: AQHcM/D4jvxlEfzKm0yKUDEcvHBvRrSwxlAAgAABPoCAAAtDgIAAAPsA
Date: Fri, 3 Oct 2025 19:42:26 +0000
Message-ID: <0e4a67db333a000b722e114ec52b8c8000db32e2.camel@intel.com>
References: <20251002230444.313505-1-stuart.summers@intel.com>
 <20251002230444.313505-8-stuart.summers@intel.com>
 <aOAb0JnFULgND3ad@lstrano-desk.jf.intel.com>
 <65030659cc8fb5da4eaf4f28aa822bb149e0453f.camel@intel.com>
 <aOAmTW76SjtPpS73@lstrano-desk.jf.intel.com>
In-Reply-To: <aOAmTW76SjtPpS73@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SJ0PR11MB4783:EE_
x-ms-office365-filtering-correlation-id: 1484478b-d8a9-4a9c-48ec-08de02b4fb3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?VE9HQmtuajh0ZTJKUUhUWVlhZ3gvSjVCb2g3aGlMWi9VNFBxU2J0OTNJTDZl?=
 =?utf-8?B?bld2R3VoV1UwYnpYNHJmZVB4S2hKWjJZMWRuemVSTWk1Y21sbnJGZEtaZUJD?=
 =?utf-8?B?YUc4Tk5XS1RTbVJ6cTlWZ2UvaEFrSGlLZlp2WExIQ2tneGlNWU00b2RwcnhM?=
 =?utf-8?B?ckJuclpmbFBzM2xjYkhqd1g0MVRWWEltV3JMdEFwNFo4WW4venpZUi8zeXB5?=
 =?utf-8?B?cmM3L2ZNbGtzOXEwWWdRMXVzdDVpL3RYbGx2RG5WTjg5RVJKMHFPaWxTTGNu?=
 =?utf-8?B?aDY5UythUGlLMEsvdjFBdmxOUUNkT0NJVHFLdjRGZXFFRmFYaXhPOHFjR2NL?=
 =?utf-8?B?bkFuRG1NVGlyQWRLUzJDSEcyK2JjOTlEOUVPY3RVcVo2WTJIeFVCWExzUGZZ?=
 =?utf-8?B?NXp0a2IwdHZwc25SNU9NclZobjVHZ2N2SVhwbWhkWEpZN2YrZXRGeWdxYXkw?=
 =?utf-8?B?QVNrekhOdWJiQlBXMmUxNU9qSEllVVhLWGRjRitkcUloVGJqSzN2cVpLNzVq?=
 =?utf-8?B?Zzl5U1BISkZxYU9VMHNJN0szdVRJMnd4VnNCU3ByVk5TOG9pSVZBWktXdlZY?=
 =?utf-8?B?ZTZSTkhnTW5XemxHSzFBN1o5TUViam5xVzkwYmxlOWJXVmE0NVZJU0VIQ3Vn?=
 =?utf-8?B?SXVYNjNGZWNQOFFpZ1BpNHk0S0V1MkduM2ZleWg1VlYxRnlJSGdrMGVVMGNV?=
 =?utf-8?B?YUorQVhtbHJrRHE1QU9RQlQ3RVRYdThLaUM5NkdCYis4QytSY2dHOFg4T2VM?=
 =?utf-8?B?NUxwbjVFS05YeE1aZzRWQ2FFRUNDQkdiMC81UHh3c2xrNkR6TVJtRTJrc0JI?=
 =?utf-8?B?QUZQQzhnbDdpeFhmQ3JPTExyaFhvTkVHbXcwUmVKOU1HNzJxQzRvRmNNaldj?=
 =?utf-8?B?eENxdWdib2FLN01HQkJpSzBNYVR6bTI3aDQ0SndvRDhUS3IxWCtBOHFRd0Mx?=
 =?utf-8?B?UzVmZHZJak4wRmFNZWpPRlBCa05VTHNud0tQU2R2cEdpQVBVSlExYWJ0dEdh?=
 =?utf-8?B?WU5haUpOamF6M1pQM0o4ekMyNWNoTjN0dUNJcFdvbmI2ME5pRktTc1djNVRL?=
 =?utf-8?B?TW9wcnRxQlZzZTBrYjl6RlpaVGtoVTBmTWNxWDkwcjlncGZYbzI4SGlPSFpw?=
 =?utf-8?B?cTRQM253V0tNSVZGRzV6RXVZN3pPTmN6Z1NSSTlsM2lzL05MZTV0L2ZMMVZk?=
 =?utf-8?B?RHAzajhzMWFyMk0xV3gvRW9jMlRqQXlNRnZ4MlFyU0tKNS9xbjZsbURhSTRH?=
 =?utf-8?B?Y2Nsc2pLMUhmOEFiLyt6QXpMeFJvL1hpazRvUnNWbzRPOWFiRG9FeU5OMEN3?=
 =?utf-8?B?bWltc3NGVEd0V2tFa3U1MXFTUkpIODZkM3pIdnRRYWpVajNuWHZQWWh5alA4?=
 =?utf-8?B?RmNGTzlqUHVId1RCNTQ2ZHRpNlV4S1BlQXVPdlJ4VkF0WkZIek10ZmlTLzYx?=
 =?utf-8?B?eGp2dlcxRjdUKzRxQ0x0WWUxSVFnWC9nandqcE02SWZ6azFsZnUxRUM0Wkxw?=
 =?utf-8?B?bStmOThOUDBvZDdpbWZ4WGNPdVJGNHppenc5c1pWVlh2UVE3ZTdEQTBqZ244?=
 =?utf-8?B?ZHFFVXk4b1d0bFMrclpsckZuV09rQUh3ZS9paXE1RVJ3eGEzdWc0TVdTWmh5?=
 =?utf-8?B?cnA0OFFxTDFpSHNmQTdabjFXeXNsSkVIL3YrTGZsVGdWeU1ZOVNHV09iQSto?=
 =?utf-8?B?MHRuNHh1WGtWVzdCKzdOZXA0MkxqTXlJZTd2NlZwNlZ1SGxTVHVKdzB3M05Z?=
 =?utf-8?B?d0tNM1hGMmtOcDBsN0dpaWpwdTZ5b3QwNXgyYk9kZHcwNDNxWCtqY3E2M3Vl?=
 =?utf-8?B?OUpjNTN3cjdXbG94MmZqV3UvakRVUWRUMnh0ZDI0djBNaU4vd01IZFVlNllK?=
 =?utf-8?B?cjhrajByZG5TcGppdzVBcG4zL3ZobjVNb0lPUnlsd0c4R25SeGpFRnoxMlpF?=
 =?utf-8?B?TDMvTld5cWFQS2orb1dLYS81OTY5MVkreHJjNmtoWmdtYjExODdGSHcyenBE?=
 =?utf-8?B?aGFXenZsSnN5bkY2c05WaEpBZkIvR3RDUFF2Vm8xNU5ZMmJGWEFTWWE3S1pn?=
 =?utf-8?Q?lQdNn8?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVZPVksvNTU3UWlZeFJQcXhDb1A5bVBKQkE0VUtxR2x2M04vcE52cGduVlpO?=
 =?utf-8?B?di9XMnFURXJPN2kvV3ZZVDlEQzI2QWpwZ2dva05LdlA2SWRYUVNtY2lDK0NB?=
 =?utf-8?B?YUlUZ0tBWG4yTUJidEtlZXdFYnkvazRuUXVPNmgrOHlIUmNiV3V6ejFBZitF?=
 =?utf-8?B?TmxWeWR1V29SWklxdlEvd0lrVHdxTWZqMUcvb2VJV3M2VFBFYUQrd0RQalgx?=
 =?utf-8?B?MnZuRVRHcm5rbmNYY2c5Y3JpOGJjcDJhRC8wRHZTSHVQWXNBRHJkbE5lR1JS?=
 =?utf-8?B?clpCMWgwRmovZytvQlk0KzZ6ekpNT2RKR0lHU1JYTDBRL0JrcU0wQTNnMk9y?=
 =?utf-8?B?U1pyNnczTGhGTU1wSlJsUWh5ZFFDblFoT2s2dys0UURCcDkvbmNhRUh0RHl4?=
 =?utf-8?B?MGdrVGVUNEZlMzVXYlEraGVFL0hubFpIUThrR0x4SzRSU1NKZmRpSTNMUC9n?=
 =?utf-8?B?TWdEdlBidTNxcUhnNEM5a2NRZ2REaVRmVmlSNTBOQkhnU20weXZzT01qQzU4?=
 =?utf-8?B?bWZEZFFIUmwyRk1sMUpsSUtFdm01cnpFWXRXZTdvYktIYUt0WVNkcHZJUytx?=
 =?utf-8?B?bDdxV2JiVzd0aTYzTHViVHpXM25DaUlRWEVZR0FOKzBydTlXRm1zN0gzYTVR?=
 =?utf-8?B?KzdNcGVWT1FwSHR3WXh2ZHFuOVZxQm1CaVNkWTVSU0laV1NHNmdCQXYzODF3?=
 =?utf-8?B?dkQ2REtOQnN5dTdTQzA4QzRrNUsrbS9ZWXhTNm5BSkJYMFpOczlEbytUM1JS?=
 =?utf-8?B?Snc5ajUxK2xoQ0tidXR0bERCUWJhclRRUzJENlFxSm9sMlRlcGN3NjZ2MW1t?=
 =?utf-8?B?bUVhTjg1NVJMTm9hbEJweGNPd2N3UnM3bFFRQTVDa3lrTU9Zajd6UVovV3M2?=
 =?utf-8?B?TXhnRFRwekRTTnFUOTdXd0JOYkdyVHVzU1h2L2UzSzlWcmYwblVtd0RFZTJt?=
 =?utf-8?B?V2RYSnRraGpBNU5EcEZKS3o1b1Y0dFZJUEdDSExwZXM1NGZjb05UVzJpTm1z?=
 =?utf-8?B?amhmZjA3NGpIQ3dLV3phTXMyYlZFZnJsbkdxaXg1L2ZFNDN5dTFsZHRkNytX?=
 =?utf-8?B?UjRWS2FEUTFYMXpTRDBMSnRYSUxMRzhNSGRBVHdUS3VGTkRVVkd6UXRmTGkv?=
 =?utf-8?B?ZnlFV3lWMVVNeU1QMmtMYyt5dzdPNjExK3hNRzk4emFaWGpJN3JQYzgxNGxI?=
 =?utf-8?B?SXFGU1FhVW9rSmJHd2I4ck5iUGdrdHA0cksrMlJ1MmtYaWNLandEMkFRREhk?=
 =?utf-8?B?NFNsZC8rNDRDUFJMcWhoTTlja0IzN2xndFF0WWxYcG14TE5tRURtMlFXdVl6?=
 =?utf-8?B?bWZ0UVZKbWdzNU90TDVNNG1GdndhNTd3WGJQTnNnQ0tjS1JycW9qZk13SkU1?=
 =?utf-8?B?ZnhLaStQVS9rZWJ4Sit1aDV5TG9wbHc3eWIycTduODJFckdJazVCUS9WblJQ?=
 =?utf-8?B?TDVMQTBHMzBnY2I1Q1JISmtZMmMyeXdkVzF4bUZMeDB5N3N1RmR6Z2l2V3Zj?=
 =?utf-8?B?aHUxSURWS1hBa3k4bGR0ZVJIOWhINTFheDNKT3YwRjViM2R6UU5iQVpCU2dW?=
 =?utf-8?B?SnJBV2VDMHI0dEZ4ZEZadmdteU5wWVFQQmM4MVdRdmlSOEd1ZjNMU2ozV1Js?=
 =?utf-8?B?Yjc1TGtldFlQUkdZam1OQ3hpaXo1Vk5nMWc1aEpkUjJCQlQ4UGpEUUwvWkEy?=
 =?utf-8?B?anpSTzYxYTRSWFZNaURoTzYwNmZWcEY5VHNFZDB4MkpsbUJ3RlVVZ3htWGV3?=
 =?utf-8?B?bCtlTHM2VUJzdkdOdmFEUHd5QXg5bVNhZ1ZhMFlTYnpTR25MUVRMNEFOSVlr?=
 =?utf-8?B?am85dXlnNnRVaUhSQTFoNy9TZ0d1SGFidjVhWjVsTzI5SVJhampiQWZvMVdU?=
 =?utf-8?B?RHQwQVB4SkpqTDJaODh2N0RYb3RKdk9ienJaK0FrZS9uWi9QNDFrdVVOeVhx?=
 =?utf-8?B?WnNSaW82RW9rTGg1TkFMbXd5djJtZFJ4K1BLc1k0cit3eTA4WW5yVkh2blUx?=
 =?utf-8?B?SWR2TDNQYXNrR3JvRHpCY1B0UFhUODNtc0hjMVZlakZJOXBNSUUzdnFTTzN2?=
 =?utf-8?B?VmZhYktxcDkyODA2WE0wTExJVURXSDlXWXNrSUdXSDFDWTNVaU5BbE4vdTlC?=
 =?utf-8?B?REd0ZjhTSHNCMFdSZWFHTitqUHNhUkt3c2djb2czMnVPaDZ5L3hhZHBaNSs0?=
 =?utf-8?B?cnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <191E5E9468A14D4DB509FCD94CC3DA1D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1484478b-d8a9-4a9c-48ec-08de02b4fb3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2025 19:42:26.5264 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PALyi3TOBV2nHaBErAz11v5O7iWkhg+QRZwT0sCg6HQD/RuK/zaO0Mhv4YM3M6YGfzxtATldBFCTdMCOB0YiRACXhv3+KUmubB1iO2wImKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4783
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

T24gRnJpLCAyMDI1LTEwLTAzIGF0IDEyOjM4IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBGcmksIE9jdCAwMywgMjAyNSBhdCAxMjo1ODozN1BNIC0wNjAwLCBTdW1tZXJzLCBTdHVh
cnQgd3JvdGU6DQo+ID4gT24gRnJpLCAyMDI1LTEwLTAzIGF0IDExOjU0IC0wNzAwLCBNYXR0aGV3
IEJyb3N0IHdyb3RlOg0KPiA+ID4gT24gVGh1LCBPY3QgMDIsIDIwMjUgYXQgMTE6MDQ6NDRQTSAr
MDAwMCwgU3R1YXJ0IFN1bW1lcnMgd3JvdGU6DQo+ID4gPiA+IEluIHRoZSBldmVudCB0aGUgR3VD
IGJlY29tZXMgdW5yZXNwb25zaXZlIGR1cmluZyBhIHNjaGVkdWxpbmcNCj4gPiA+ID4gZGlzYWJs
ZSBldmVudCwgd2Ugc3RpbGwgd2FudCB0aGUgZHJpdmVyIHRvIGJlIGFibGUgdG8gcmVjb3Zlci4N
Cj4gPiA+ID4gVGhpcyBwYXRjaCBmb2xsb3dzIHRoZSBzYW1lIG1ldGhvZG9sb2d5IHdlIGFscmVh
ZHkgaGF2ZSBpbg0KPiA+ID4gPiBwbGFjZQ0KPiA+ID4gPiBmb3IgVExCIGludmFsaWRhdGlvbiBy
ZXF1ZXN0cywgd2hlcmUgd2Ugc2VuZCBhIHJlcXVlc3QgdG8gR3VDDQo+ID4gPiA+IGFuZCB3YWl0
IGZvciB0aGF0IGludmFsaWRhdGlvbiBkb25lIHJlc3BvbnNlLiBJZiB0aGUgcmVzcG9uc2UNCj4g
PiA+ID4gZG9lc24ndCBjb21lIGJhY2sgaW4gdGltZSB3ZSB0aGVuIGF0IGxlYXN0IHByaW50IGEg
bWVzc2FnZQ0KPiA+ID4gPiBpbmRpY2F0aW5nIHRoZSBpbnZhbGlkYXRpb24gZmFpbGVkIGZvciBz
b21lIHJlYXNvbi4NCj4gPiA+ID4gDQo+ID4gPiA+IEluIHRoaXMgY2FzZSwgd2Ugc2VuZCB0aGUg
c2NoZWR1bGUgZGlzYWJsZSBhbmQgdGhlIGV4cGVjdGF0aW9uDQo+ID4gPiA+IGlzIHRoYXQgR3VD
IHdpbGwgcmVzcG9uZCB3aXRoIGEgc2NoZWR1bGUgZG9uZSByZXNwb25zZS4gVGhlIEtNRA0KPiA+
ID4gPiB0aGVuIGNhdGNoZXMgdGhhdCByZXNwb25zZSBhbmQgaW4gdHVybiBzZW5kcyBhIGNvbnRl
eHQNCj4gPiA+ID4gZGVyZWdpc3RyYXRpb24NCj4gPiA+ID4gcmVzcG9uc2UuIFNvIGluIHRoZSBl
dmVudCBHdUMgYmVjb21lcyB1bnJlc3BvbnNpdmUgYWZ0ZXIgd2UNCj4gPiA+ID4gc2VuZA0KPiA+
ID4gPiB0aGUgc2NoZWR1bGUgZGlzYWJsZSwgd2UgYWN0dWFsbHkgaGF2ZSB0d28gZzJoIHJlc3Bv
bnNlcyB0aGF0DQo+ID4gPiA+IGhhdmUgYmVlbiByZXNlcnZlZCBidXQgbmV2ZXIgcmVjZWl2ZWQu
DQo+ID4gPiA+IA0KPiA+ID4gPiBUbyBoYW5kbGUgdGhpcywgbWFrZSBzdXJlIHRoZSBwZW5kaW5n
IGRpc2FibGUgZXZlbnQgaW4gdGhlDQo+ID4gPiA+IGV4ZWMgcXVldWUgZ2V0cyBjbGVhcmVkIChp
LmUuIHdlIHJlY2VpdmVkIHRoYXQgcmVzcG9uc2UgZnJvbQ0KPiA+ID4gPiBHdUMpLiBJZiBpdCBk
b2Vzbid0IGluIGEgcmVhc29uYWJsZSBhbW91bnQgb2YgdGltZSwgYXNzdW1lDQo+ID4gPiA+IEd1
QyBpcyBkZWFkOiBiYW4gdGhlIGV4ZWMgcXVldWUsIHF1ZXVlIHVwIGEgR1QgcmVzZXQsIGFuZA0K
PiA+ID4gPiBtYW51YWxseSBjYWxsIHRoZSBzY2hlZHVsZSBkb25lIGhhbmRsZXIuIFRoZW4gaW4g
dGhlIHNjaGVkdWxlDQo+ID4gPiA+IGRvbmUgaGFuZGxlciwgaW4gdHVybiwgY2hlY2sgd2hldGhl
ciB0aGUgY29udGV4dCBoYWQgYmVlbg0KPiA+ID4gPiBiYW5uZWQuIElmIHNvLCBtYW51YWxseSBj
YWxsIHRoZSBkZXJlZ2lzdHJhdGlvbiBkb25lIGhhbmRsZXINCj4gPiA+ID4gdG8gZW5zdXJlIGFs
bCByZXNvdXJjZXMgcmVsYXRlZCB0byB0aGF0IGV4ZWMgcXVldWUgZ2V0DQo+ID4gPiA+IGNsZWFu
ZWQgdXAgcHJvcGVybHkuIFdpdGhvdXQgdGhpcywgaWYgdGhlIGRldmljZSBiZWNvbWVzDQo+ID4g
PiA+IHdlZGdlZCBhZnRlciBhbiBleGVjIHF1ZXVlIGhhcyBiZWVuIGNyZWF0ZWQsIHRoZSBhdHRh
Y2hlZA0KPiA+ID4gPiByZXNvdXJjZXMgbGlrZSB0aGUgTFJDIHdpbGwgbm90IGdldCBmZWVkIHBy
b3Blcmx5IHJlc3VsdGluZw0KPiA+ID4gPiBpbiBhIG1lbW9yeSBsZWFrLg0KPiA+ID4gPiANCj4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVs
LmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19z
dWJtaXQuYyB8IDIzDQo+ID4gPiA+ICsrKysrKysrKysrKysrKysrKysrKystDQo+ID4gPiA+IMKg
MSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiA+ID4g
DQo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5j
DQo+ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYw0KPiA+ID4gPiBp
bmRleCA0NWI3MmJlYmZjNjMuLmExNzdkODdjODUyNCAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYw0KPiA+ID4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+ID4gPiA+IEBAIC05MzksNiArOTM5LDkgQEAgaW50
IHhlX2d1Y19yZWFkX3N0b3BwZWQoc3RydWN0IHhlX2d1YyAqZ3VjKQ0KPiA+ID4gPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEdVQ19DT05URVhUXyMjZW5hYmxlX2Rpc2FibGUswqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgDQo+ID4gPiA+IMKgwqDCoMKgDQo+ID4g
PiA+IMKgwqDCoMKgwqBcDQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqB9DQo+ID4gPiA+IMKgDQo+
ID4gPiA+ICtzdGF0aWMgdm9pZCBoYW5kbGVfc2NoZWRfZG9uZShzdHJ1Y3QgeGVfZ3VjICpndWMs
IHN0cnVjdA0KPiA+ID4gPiB4ZV9leGVjX3F1ZXVlICpxLA0KPiA+ID4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdTMyIHJ1bm5hYmxl
X3N0YXRlKTsNCj4gPiA+ID4gKw0KPiA+ID4gPiDCoHN0YXRpYyB2b2lkIGRpc2FibGVfc2NoZWR1
bGluZ19kZXJlZ2lzdGVyKHN0cnVjdCB4ZV9ndWMgKmd1YywNCj4gPiA+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzdHJ1Y3QgeGVfZXhlY19xdWV1ZQ0KPiA+ID4gPiAqcSkNCj4gPiA+ID4g
wqB7DQo+ID4gPiA+IEBAIC05NzQsNiArOTc3LDE3IEBAIHN0YXRpYyB2b2lkDQo+ID4gPiA+IGRp
c2FibGVfc2NoZWR1bGluZ19kZXJlZ2lzdGVyKHN0cnVjdCB4ZV9ndWMgKmd1YywNCj4gPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoHhlX2d1Y19jdF9zZW5kKCZndWMtPmN0LCBhY3Rpb24sIEFSUkFZX1NJ
WkUoYWN0aW9uKSwNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgRzJIX0xFTl9EV19TQ0hFRF9DT05URVhUX01PREVfU0VUICsNCj4gPiA+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRzJIX0xFTl9EV19ERVJF
R0lTVEVSX0NPTlRFWFQsIDIpOw0KPiA+ID4gPiArDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoHJl
dCA9IHdhaXRfZXZlbnRfdGltZW91dChndWMtPmN0LndxLA0KPiA+ID4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIWV4ZWNf
cXVldWVfcGVuZGluZ19kaXNhYmxlKHEpDQo+ID4gPiA+IHx8DQo+ID4gPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4ZV9n
dWNfcmVhZF9zdG9wcGVkKGd1YyksDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBIWiAqIDUpOw0KPiA+ID4gDQo+
ID4gPiBUaGlzIGRvZXNuJ3QgbG9vayByaWdodC4gRGVyZWdpc3RlciBpcyBkZXNpZ25lZCB0byBi
ZSBmdWxseQ0KPiA+ID4gYXN5bmMuIElmDQo+ID4gPiB0aGlzIGZsb3cgc3RvcHMgd29ya2luZyBm
b3Igd2hhdGV2ZXIgcmVhc29uIHRoZSBHdUMgaXMgZGVhZCBhbmQNCj4gPiA+IGV2ZW50dWFsbHkg
c29tZXdoZXJlIGluIGRyaXZlciB3aWxsIGRldGVjdCB0aGlzIGFuZCB0cmlnZ2VyIGEgR1QNCj4g
PiA+IHJlc2V0DQo+ID4gPiB3aGljaCBpcyBjbGVhbnVwIGFsbCBsb3N0IEgyRy4NCj4gPiA+IA0K
PiA+ID4gPiArwqDCoMKgwqDCoMKgwqBpZiAoIXJldCB8fCB4ZV9ndWNfcmVhZF9zdG9wcGVkKGd1
YykpIHsNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2d0X3dhcm4o
Z3VjX3RvX2d0KGd1YyksICJTY2hlZHVsZSBkaXNhYmxlDQo+ID4gPiA+IGZhaWxlZA0KPiA+ID4g
PiB0byByZXNwb25kIik7DQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBz
ZXRfZXhlY19xdWV1ZV9iYW5uZWQocSk7DQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBoYW5kbGVfc2NoZWRfZG9uZShndWMsIHEsIDApOw0KPiA+ID4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfZ3RfcmVzZXRfYXN5bmMocS0+Z3QpOw0KPiA+ID4gPiAr
wqDCoMKgwqDCoMKgwqB9DQo+ID4gPiA+IMKgfQ0KPiA+ID4gPiDCoA0KPiA+ID4gPiDCoHN0YXRp
YyB2b2lkIHhlX2d1Y19leGVjX3F1ZXVlX3RyaWdnZXJfY2xlYW51cChzdHJ1Y3QNCj4gPiA+ID4g
eGVfZXhlY19xdWV1ZQ0KPiA+ID4gPiAqcSkNCj4gPiA+ID4gQEAgLTIxMTcsNiArMjEzMSw4IEBA
IGcyaF9leGVjX3F1ZXVlX2xvb2t1cChzdHJ1Y3QgeGVfZ3VjICpndWMsDQo+ID4gPiA+IHUzMg0K
PiA+ID4gPiBndWNfaWQpDQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gcTsNCj4gPiA+
ID4gwqB9DQo+ID4gPiA+IMKgDQo+ID4gPiA+ICtzdGF0aWMgdm9pZCBoYW5kbGVfZGVyZWdpc3Rl
cl9kb25lKHN0cnVjdCB4ZV9ndWMgKmd1Yywgc3RydWN0DQo+ID4gPiA+IHhlX2V4ZWNfcXVldWUg
KnEpOw0KPiA+ID4gPiArDQo+ID4gPiA+IMKgc3RhdGljIHZvaWQgZGVyZWdpc3Rlcl9leGVjX3F1
ZXVlKHN0cnVjdCB4ZV9ndWMgKmd1Yywgc3RydWN0DQo+ID4gPiA+IHhlX2V4ZWNfcXVldWUgKnEp
DQo+ID4gPiA+IMKgew0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgdTMyIGFjdGlvbltdID0gew0K
PiA+ID4gPiBAQCAtMjEzMSw3ICsyMTQ3LDEyIEBAIHN0YXRpYyB2b2lkIGRlcmVnaXN0ZXJfZXhl
Y19xdWV1ZShzdHJ1Y3QNCj4gPiA+ID4geGVfZ3VjICpndWMsIHN0cnVjdCB4ZV9leGVjX3F1ZXVl
ICpxKQ0KPiA+ID4gPiDCoA0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgdHJhY2VfeGVfZXhlY19x
dWV1ZV9kZXJlZ2lzdGVyKHEpOw0KPiA+ID4gPiDCoA0KPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqB4
ZV9ndWNfY3Rfc2VuZF9nMmhfaGFuZGxlcigmZ3VjLT5jdCwgYWN0aW9uLA0KPiA+ID4gPiBBUlJB
WV9TSVpFKGFjdGlvbikpOw0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqBpZiAoZXhlY19xdWV1ZV9i
YW5uZWQocSkpIHsNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGhhbmRs
ZV9kZXJlZ2lzdGVyX2RvbmUoZ3VjLCBxKTsNCj4gPiA+IA0KPiA+ID4gVGhpcyB3b3VsZCBsZWF2
ZSB0aGUgR3VDIHdpdGggcmVmZXJlbmNlIHRvIGd1Y19pZCBhbmQgc3Vic2VxdWVudA0KPiA+ID4g
cmV1c2UNCj4gPiA+IG9mIHRoZSBndWNfaWQgKGkuZS4sIG5leHQgcmVnaXN0ZXIpIHdpbGwgZmFs
bC4NCj4gPiANCj4gPiBCdXQgYWdhaW4sIGluIHRoaXMgY2FzZSB0aGUgR3VDIGlzIGRlYWQgYW5k
IHdlIHNob3VsZCBiZSBnZXR0aW5nDQo+ID4gdGhhdA0KPiA+IHJlc2V0IGV2ZW50IHlvdSBoYWQg
bWVudGlvbmVkIGFib3ZlLiBUaGUgaXNzdWUgSSdtIGhhdmluZyBpcw0KPiANCj4gQmFubmVkIGlz
IGEgcGVyIHRoaW5nIHF1ZXVlIGFuZCBtb3JlIHRoYW4gbGlrZWx5IHdlIHdvbnQgYmUgZG9pbmcg
YQ0KPiBHVA0KPiByZXNldCwgdGh1cyB3ZSBzdGlsbCBuZWVkIHJlbW92ZSByZWZlcmVuY2VzIHRv
IHRoZSBxdWV1ZSBmcm9tIHRoZQ0KPiBHdUMuDQoNClllYWggdGhpcyBtYWtlcyBzZW5zZSB0byBt
ZS4gTXkgdXNlIG9mICJiYW5uZWQiIGhlcmUgd2FzIHByb2JhYmx5IG5vdA0KaWRlYWwuDQoNCj4g
DQo+ID4gc3BlY2lmaWNhbGx5IGFyb3VuZCB3ZWRnZSBldmVudHMuIFdpdGhvdXQgYSBHVCB3ZWRn
ZSwgd2Ugd2lsbA0KPiA+IG5vcm1hbGx5DQo+ID4gZ28gdGhyb3VnaCB0aGUgR1QgcmVzZXQgZmxv
dyBhbmQgcmVjb3ZlciBsaWtlIHlvdSBtZW50aW9uZWQuIEJ1dCBpbg0KPiA+IHRoZQ0KPiANCj4g
Tm8uIFNlZSBhYm92ZS4NCj4gDQo+ID4gY2FzZSBvZiBhIHdlZGdlLCB3ZSBkb24ndCByZWRvIHRo
ZSBzb2Z0d2FyZSBwYXJ0IG9mIHRoZSByZXNldCAoaS5lLg0KPiA+IHdlDQo+ID4gZG9uJ3QgcmVz
ZXQgY29udGV4dHMsIGV0YykgcGVyIGd0X3Jlc2V0KCk6DQo+ID4gc3RhdGljIGludCBndF9yZXNl
dChzdHJ1Y3QgeGVfZ3QgKmd0KQ0KPiA+IHsNCj4gPiDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBp
bnQgZndfcmVmOw0KPiA+IMKgwqDCoMKgwqDCoMKgIGludCBlcnI7DQo+ID4gDQo+ID4gwqDCoMKg
wqDCoMKgwqAgaWYgKHhlX2RldmljZV93ZWRnZWQoZ3RfdG9feGUoZ3QpKSkNCj4gPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FQ0FOQ0VMRUQ7DQo+ID4gDQo+ID4gTWF5
YmUgaW5zdGVhZCBvZiBiYW5uZWQgSSBjYW4gY2hlY2sgZm9yIGJhbm5lZCBhbmQgd2VkZ2VkIGhl
cmU/IE9yDQo+ID4gbWF5YmUgd2Ugc2hvdWxkIHJldGhpbmsgdGhlIHNvZnR3YXJlIHJlc2V0IGZs
b3cgaW4gdGhlIGV2ZW50IG9mIGENCj4gPiB3ZWRnZT8NCj4gDQo+IFRoZSBpZGVhIHdpdGggd2Vk
Z2VkIGlzIHdlIGxlYXZlIGFsbCBoYXJkd2FyZCBzdGF0ZSwgaW5jbHVkaW5nIHRoZQ0KPiBHdUMs
DQo+IGludGFjdGVkIGZvciBpbnNwZWN0aW9uLiBTbyBJIHRoaW5rIGEgeGVfZGV2aWNlX3dlZGdl
ZCBjaGVja2VkIGhlcmUNCj4gbWFrZXMgc2Vuc2UuIFRoaXMgd291bGQgY292ZXIgdGhlIGNhc2Ug
d2hlcmUgc3RhcnQgYSBxdWV1ZSB0ZWFyZG93bg0KPiB2aWENCj4gYSBDTEVBTlVQIG1lc3NhZ2Ug
YW5kIG1pZC1mbG93IHdlIHdlZGdlIHRoZSBkZXZpY2UuDQoNCkJ1dCBoYXJkd2FyZSBzdGF0ZSBk
b2Vzbid0IG1lYW4gc29mdHdhcmUgc3RhdGUuIEFyZSB5b3Ugc2F5aW5nIHdoZW4gdGhlDQpkZXZp
Y2UgaXMgd2VkZ2VkIHdlIHdhbnQgdGhlIG1lbW9yeSB0byBhbGwgYmUgaW50YWN0IGFzIHdlbGw/
IEFuZCBob3cNCmRvIHdlIGRldGVybWluZSB3aGVuIHRoYXQgZ2V0cyBmcmVlZD8gT24gdW5iaW5k
Pw0KDQpUaGFua3MsDQpTdHVhcnQNCg0KPiANCj4gTWF0dA0KPiANCj4gPiANCj4gPiBUaGFua3Ms
DQo+ID4gU3R1YXJ0DQo+ID4gDQo+ID4gPiANCj4gPiA+IE1hdHQNCj4gPiA+IA0KPiA+ID4gPiAr
wqDCoMKgwqDCoMKgwqB9IGVsc2Ugew0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgeGVfZ3VjX2N0X3NlbmRfZzJoX2hhbmRsZXIoJmd1Yy0+Y3QsIGFjdGlvbiwNCj4gPiA+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQVJSQVlfU0laRShhY3Rpb24pKTsNCj4gPiA+
ID4gK8KgwqDCoMKgwqDCoMKgfQ0KPiA+ID4gPiDCoH0NCj4gPiA+ID4gwqANCj4gPiA+ID4gwqBz
dGF0aWMgdm9pZCBoYW5kbGVfc2NoZWRfZG9uZShzdHJ1Y3QgeGVfZ3VjICpndWMsIHN0cnVjdA0K
PiA+ID4gPiB4ZV9leGVjX3F1ZXVlICpxLA0KPiA+ID4gPiAtLSANCj4gPiA+ID4gMi4zNC4xDQo+
ID4gPiA+IA0KPiA+IA0KDQo=
