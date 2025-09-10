Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A14CA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 19:24:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535D910E080;
	Wed, 10 Sep 2025 19:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KJYdO0jk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1592210E080
 for <Intel-Xe@lists.freedesktop.org>; Wed, 10 Sep 2025 19:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757532251; x=1789068251;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=NfoOlFbUFdqSzZOmXsAb1I71/TwK2ywm7JAEBv9P5ow=;
 b=KJYdO0jkDGW/4fodtEwATbgccEF4C9BDq2FNskX3eMLH8tTjp9qZmS0P
 8JO4im5Ed2PbLR0luk5LAmZ+ryW21sSIpmBsy/pnlFTVVJu0cFsXwczpB
 CthRBtN9O+P9dz6QEjzKgVWDQEhw6fulZyK23gOHvm1W7SPZiq1CEtQjk
 x8h1oxDvSjiA0ioU42T5kx25Vmi8MO6t4EwYosQixJwHD6Brz5X7WpzPa
 cQLj2xHZ16IoThPAOjmOjrckaUx/cckdJ4/xfOyBLKcr+ZqZGDsi512vo
 KpuXe4nAUfmkcevhUToua/QGYBviO999uK/R4aIA3YeIsZ4yhtrc+14bE Q==;
X-CSE-ConnectionGUID: mo6QVYhKR9O6NgHu5X4Ksg==
X-CSE-MsgGUID: WUyLF9HuRryCcQzeUj5UDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59801812"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59801812"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 12:24:11 -0700
X-CSE-ConnectionGUID: u1pxbUKBQ4qnDYObhjSk2Q==
X-CSE-MsgGUID: /PbkI+dpSi2pC24m3ny+bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="173859446"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 12:24:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 12:24:09 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 12:24:09 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.58)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 12:24:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kciApjeRWJvSo/3RAIlwJOUjSnSSA4uM1PJ9J7dGMvMIMzouGjoQOk7oVpTpAasxfEVEU9FMvDhv80iZ0jgo2V2kh66I2dSnci9njgka8SgbHFiq3INS+kku3c6066u0LKaBUgznmcZfji+laUFvOSBivGs7iJA9awMZolLS28VSYOGRv/lmI2qlJd2zudyzXbzepJ3ibY8AGSCF/3E4Kd9MpAf+w3rVUVV1LwrROMmLKksrXtPsjzBViEoQZu8MREaKr58XpyD1C4cQzndVt5DZcigQ7HzAy6conaTadRYlJHNqj6YKjnSEV8GsV6cBAHndm/3KoWo1SbxdIzM0sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NfoOlFbUFdqSzZOmXsAb1I71/TwK2ywm7JAEBv9P5ow=;
 b=FJadDNj/UZFUqnRSplNINWcEbH4yuCJm4rCByYoRUQ54nIlkYf47AHjSoF6e60u8CeWHhNCHxok5GI5Ymg3Dbuio4XIegqB2zhusagp2vKuKQ+D7NiU+SjFJ+4xcyrbM7/gO59hTr5SBMdgO8BxcToEQUUmt6tRzyNloY8SbhZDsWo/a/S7V9S8e1SRCx7wypbmXL1hGtBZEHoXTxVpk36Bg+BmkUR9foX6UEwARBEJSDTsp1CLsJye2kleGU/zyeOT1pFQg0zkhnyHD4eHtWEWpBUCf0DRECv6ExiHBdmfz7tXrQHuMk99scO9SBhotacdhVC3UcHEpkaUAkHUfdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 IA4PR11MB9297.namprd11.prod.outlook.com (2603:10b6:208:56f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 19:24:02 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 19:24:01 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@Lists.FreeDesktop.Org>,
 "Harrison, John C" <john.c.harrison@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2] drm/xe/guc: Return an error code if the GuC load fails
Thread-Topic: [PATCH v2] drm/xe/guc: Return an error code if the GuC load fails
Thread-Index: AQHcIdrvbhIdjOJBtE26Sz2ljI0nWbSMtoUAgAAN3gCAAAjSAA==
Date: Wed, 10 Sep 2025 19:24:01 +0000
Message-ID: <8893c2bc6f5711beab86b97132b9db9d86cb705f.camel@intel.com>
References: <20250909224132.536320-1-John.C.Harrison@Intel.com>
 <9e8460e70cefba27f70a4cfba9f33c58159f4203.camel@intel.com>
 <fcbe0071-82de-4fef-b77a-a1c0f90e80ca@intel.com>
In-Reply-To: <fcbe0071-82de-4fef-b77a-a1c0f90e80ca@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|IA4PR11MB9297:EE_
x-ms-office365-filtering-correlation-id: 7ad87ead-db6d-41e9-47c2-08ddf09f994e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?TWh1MDQ2U2pSdlI1T1NRbTF2N3BSQlJSdHNuRGFmb2swWXp4WjdMR1h5blBq?=
 =?utf-8?B?b3ltT3NFU29KT1k2cTRmM2ZYSlIyaEtLc05iWElEdGdXU2wzZlpvZ2J6YzFH?=
 =?utf-8?B?WWlCYUFCK3VFSzVZWkIrUDlHeDFxTXJrNmdlTEtpNWN6Kzd6S0s5eWZYUCti?=
 =?utf-8?B?RFhnckR0OERxa1NLME9QYWJ0UTdLUjFtNjNESWJZVkdMQi8ySTgzUTY2NkVK?=
 =?utf-8?B?eCtabGpzcW5QSDNJdkNHNEdxQk4rcC96UnF6Znh4MG0xMWcvTHlWdGJEdkhs?=
 =?utf-8?B?NUR3ZkdKZTZweDY0cUFRTDJEM3gyNTBnR3hrUVY4OE1RNUpQVzRYOEVndEF3?=
 =?utf-8?B?ZGJIaGhrMWRiNGc2ekdVRGIvOTBWWFUwbldtMjZVa29tWjlBUFM1d3NacVVi?=
 =?utf-8?B?c21vZjdUVEd0OXdVc0gzM2lMYXhwWThGaGU4LzI5QjRQd201eitNblBvb0pr?=
 =?utf-8?B?cTNUN003UjU1ZnAxWktEbVQxV0Z3eEgreGVobkIwb0NtUnZzQkJscXBIT1RV?=
 =?utf-8?B?UnZIaDVHbG1iUUVEZUxOSFVaKzBXZjZxNkRjeFh0V215S2Mwa2tPUmUrdnJP?=
 =?utf-8?B?K001TjJtRFFXZ29nbUNXa0dTM1R6MDdhNGhrUm9GcXdsNGlDdS9HVzk2SURZ?=
 =?utf-8?B?NVFGTUNoODQ4d29icFhManRBQ29qc1VpVVZoSEFzRERvL09iaHdFdEo2SUJC?=
 =?utf-8?B?WEx3cGlRU0Y1ZHEwMTZxVmpGRmZEV1hiV1hKTmhlUVVrdEdpb2pNQVVRRlFj?=
 =?utf-8?B?UkNZbUR3d3V4eWV1RzMvdlhpaXFEeWZHZGZmc2JtOFpSU2NxcStTMDFYTDVj?=
 =?utf-8?B?YWJHVnpuc3Z1OTcwNk5CdncvTTRWMzJ0UWpORFZ2UEwxbUxRNlVKZHlMQkZ2?=
 =?utf-8?B?UTNlSUUxOTNzajQ1VGRzZEE5WTJ1N2FWeUdqNkZqSVNEWEl6ZEJ2RVlYakVE?=
 =?utf-8?B?WlZVY2Yrc0tkVnE1QTUwUHowbm1mSFpBM3k2S2hGanBKSmdYUFd3SFVXblY0?=
 =?utf-8?B?Nmd5QXlpcS9jc2wzaElTL3NXZ1Z0MXJvRWxPM204NzhJczRudkdjcjhUbGMz?=
 =?utf-8?B?ZXg4NEhEME93bFRLVGtIN2dJdldISW1qbXE2ZjNCRHdhOHo3d09odjJ2Y3Bm?=
 =?utf-8?B?S2lhT0dqS211Nyt0LzFPS3ZtZ0RFTkZJcFdFNjZUanJWaDYvcFdORGNMMlJ5?=
 =?utf-8?B?dXhLeEdaVWYvKzB2U2lzRDMwWjNtSS94cUJiT3NTUDRyeUJybk1xMGFxMDFw?=
 =?utf-8?B?MmU2K3JPSkxZTityaFZ4RG1zcWhDOHF3N1NLT2VrSVh6ZlRFUlpsRUsweGJB?=
 =?utf-8?B?dXgvV05nc3U5ZWZnOGxVcmlVbXJRd3hpZkRqSGxsWXNsS09RSnBpZyttTUJ3?=
 =?utf-8?B?N0pMVUFjNnRQU081VWhJcW9tcVlJcHl4enRHMXFhbXdKYzVYSzU2aUlsWEE0?=
 =?utf-8?B?anZMOHRUL2FQTGlCTXFrb0p0UkxpN1pJVjd1SUdIOFlDQ0JSOGgwSUJKU2xs?=
 =?utf-8?B?all3c3MvdWhiUXl0cUxZVXpZaXBVQlorWitRdkdFcE8rdTBqZmwwOVA0dk5K?=
 =?utf-8?B?cGovUVk5WE1YeUVSeHdyYTZoODJqN05sNyt4WDNvM09lVnFMaXcwS2Y3UHVj?=
 =?utf-8?B?UE4yVHdTbi92cjdHcUJ2S2xVODV1SHd2R1dnMVlYOWRTOGF5R3dubFhhTzY4?=
 =?utf-8?B?YXJWUHlRMXdjWklKWjh6UDh2MGZnVjR4ZXdyVkl3cVpYT0FES2xuU1JQdW5U?=
 =?utf-8?B?TThrNnFkNzhTWVdDenhaU3hXSDlUbzdvYUo0MWlOeVIvbTFyNmNiRk5yajlr?=
 =?utf-8?B?d1JBUlFoNzhNWElRMGk2aUhDcTF5RjU2SmZCQk1QYXg4RWxFM3Y5eVlmQmdl?=
 =?utf-8?B?eEI5T3lrU0h0RlE2VUhSb2czMFVXUnV0MVVXS21mblpxYktZbWxKdWtzTEh1?=
 =?utf-8?B?WC8xcVRJdzhhbzg3ZjhkczB0VlRVcm02bHhBRFl4YzIvbG5JczVRSXI4L3Vy?=
 =?utf-8?Q?lh1QoWlM3r8PbgdQ0Ww/IWSc88JvV8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2ZVdnAyZUp4MTFES1A5cXNVZmkxZmI5MEZodHZOUEd5R2JQWjRDSXZzVmZR?=
 =?utf-8?B?b3ZCS3hLOG1PVVlxNyt2VjU3OHVoeUJJUDVrT1lPaFYrdjgxQzFKVTNod0VB?=
 =?utf-8?B?MU5ENUVGVXhpWFk4MGErR0N0ZmpHMWZqZlBPQms2SkhtbkdZMjJEN3QwWGFP?=
 =?utf-8?B?bERMaFFqT3pzWDB4dlZtSDNNMm5DVTJScGd4VEpzQnJwRVhMcUZ4a3hPd2NE?=
 =?utf-8?B?UWREMC9nT0J1R2l1Njd2ZDlISlZUR0U3QWZFSGRpanRhQlJLa1NrSzFzMHVZ?=
 =?utf-8?B?bS9KamMxY0F2czJKeXdJNjZsd2RvS0tadWlrRXNHRmUvV2d1QXlFdXFVRkN2?=
 =?utf-8?B?b3ltK3NBQWlMcHJPVFVXbDYxTXMwQXRpSGFhVitxWUZsTnBBSFBML3Zwcmg1?=
 =?utf-8?B?UXI0T2gvLzRCSTZHNXdTeUFFbWErdmJuYzYwVURDNkxzQlRTWGRFaTV0c3ZV?=
 =?utf-8?B?T3NybjhKVjNBb09mQmgyZWk4U1lWUUdRNDFyMFRnc1M3WktoOW9mclBmUGRa?=
 =?utf-8?B?dVZETmlNTVFyM0hDUEVEQ1ZmUWxXNHpYblllaHVqY3FrY21nbFRQUUhQZVhZ?=
 =?utf-8?B?RjJReFUzVEsxOXUzWngrVjlSQjFpajA3andaNDBhK1gxKzJqaktVc2xyTzJT?=
 =?utf-8?B?Z3F2VjFmS25Ndmk0cEpTM3BiSSs4WVVRZnN6clcvSnlySGZrWXdjR0VEZU9J?=
 =?utf-8?B?dTQvbWVNK1NXWjJ6cHpSbWxNWURjWEF3ZVpzc0FLSFQ3MEhYRnI2Q0VxL3BV?=
 =?utf-8?B?d1FFMkxqY3dsOHRiN0NRZkt3bDFBRksyYXdiSE11STFSeWZqTEd4a2dSWThV?=
 =?utf-8?B?cWpzY2JxYnV1V1gwSkIzcnQyaGxZYjN3di9xeUNPeDl6aGFOMjQ2WmpmVExs?=
 =?utf-8?B?enZjSER1MzIvdnJGTlg3ektkUTQrb3VhbVpCT2hyd1BvdENPS0dldm1wMWkx?=
 =?utf-8?B?NHdzL2tseUl0RjQwREJkamZMdThuUUhvV2VBL2xLTEY5YW5BV1ZudHF5K2Fm?=
 =?utf-8?B?aGE5OHF5bXIvS1U5cVk3WisvdlpiTFpJeTNVaFh0RXFDN3B4SU5VTlVGbVNk?=
 =?utf-8?B?NjhHRCtsZVYvMmJGcTZLdGl6enVQSzN3T1V6YUg5eTJ2QnVhd09rYlVrcWFw?=
 =?utf-8?B?cFJlS1Y5RmtLNTV6bWFrWGQvaTFpL0FWRmxITDJMamJFUS8yV2J3ODlLVGZR?=
 =?utf-8?B?bmlrc1N1cTRiTERwNGhtdkN1d2NKSlhHUGc0cEVSVU5sRDdOOHh2WkxVY0VQ?=
 =?utf-8?B?Rm5vYUZLSGp2SmdDTGRVZU1udUVJT2V5TVdkK0VMSy8yaUZrK1puNXJUVWYy?=
 =?utf-8?B?NzRiY0VyN3JWM3dpNzNLelZydEV2dWt1Q2FBd1NVeTRRQ0tkajVvNmlVcldY?=
 =?utf-8?B?Qzc0TWhycW9GNzNJNGNxNitub1Ryd1UzUjFJcCtHcGpPOFNkanY0VlFRbzlq?=
 =?utf-8?B?VkE0b3VJMVZQUlQrSkdxU2xnR0JNLzdMZVZkR1RPL3pSbHU4V1hLMTN3QTN3?=
 =?utf-8?B?dHBWbHJIU2pxRGx3QVkydllZTlBhWGVmRHhiWVk0cEw1UG1MTkNJamlBakxO?=
 =?utf-8?B?S1hISGVaek5WMG02WXF1c25jY2pBMjdhMXNsM2d1cC8vc2hpV3hBZUdRbkhl?=
 =?utf-8?B?elhZSzNWRHFDVE1UUDAvRXgwZWV2WmdEbC95dmk4WWcwVml0bUNZYkhPVTc5?=
 =?utf-8?B?eWZyQmtuSUtTTGw4TW82RWRjUEF6VVdFc1JqWnJZVlkwS1hIMTVIOWVnb0xx?=
 =?utf-8?B?K0V5M0JKa1hLeUNEMWR1cjNEU2h5T0JEQ1lxRWV2TnpDVzk2Ny85MTZxdkxO?=
 =?utf-8?B?aXN6citkNEl3R2h1K2E1bUYvN0xOczRhRXpUOEhSQUZ3TlEwNm5YTG1wbmg2?=
 =?utf-8?B?VVBNTHJpWFdIaWpiNkQyR0pZWW5YOGdpNzJMZVpkSWg4R2QzaXFCa1N1VitJ?=
 =?utf-8?B?NCtvYUgxVUdLMTVMOU1IR3luU2Y1UzAyZzNuUlppbzFaMThyeUd6QVdOdXI0?=
 =?utf-8?B?dWpIRE5FdmQ3SGJ0N0RNWWZhbXlicEllTW1FTFdPUUpNRGllZGl0OURsd1hT?=
 =?utf-8?B?R1FtUzY4UWc4OXRDdnJmeFJpU2tVQk8wUlpybDAwUEFUUVZQdFFiYlNCZEZF?=
 =?utf-8?B?eC8rc2NJUHhXTFlwellTZUxtV1FsVjBzNGdyeGhUM01jck9ubjFuczRtU1ZX?=
 =?utf-8?B?MVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C96C83717339A4EA39008BCE25F8E20@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ad87ead-db6d-41e9-47c2-08ddf09f994e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2025 19:24:01.8392 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p48m90nkPtkr5Hwd79QGAcs1f5X5pyX5eMRvfMqBTOcn4ucx1x6U2SIwDmCotdjPXZMoJd51TOdjDfSN63rFshy66K1LHqho9b1PQrZ7up0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9297
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

T24gV2VkLCAyMDI1LTA5LTEwIGF0IDExOjUyIC0wNzAwLCBKb2huIEhhcnJpc29uIHdyb3RlOg0K
PiBPbiA5LzEwLzIwMjUgMTE6MDIgQU0sIFN1bW1lcnMsIFN0dWFydCB3cm90ZToNCj4gPiBPbiBU
dWUsIDIwMjUtMDktMDkgYXQgMTU6NDEgLTA3MDAsIEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5jb23C
oHdyb3RlOg0KPiA+ID4gRnJvbTogSm9obiBIYXJyaXNvbiA8Sm9obi5DLkhhcnJpc29uQEludGVs
LmNvbT4NCj4gPiA+IA0KPiA+ID4gRHVlIHRvIG11bHRpcGxlIGV4cGxvc2lvbiBpc3N1ZXMgaW4g
dGhlIGVhcmx5IGRheXMgb2YgdGhlIFhlDQo+ID4gPiBkcml2ZXIsDQo+ID4gPiB0aGUgR3VDIGxv
YWQgd2FzIGhhY2tlZCB0byBuZXZlciByZXR1cm4gYSBmYWlsdXJlLiBUaGF0IHByZXZlbnRlZA0K
PiA+ID4ga2VybmVsIHBhbmljcyBhbmQgc3VjaCBpbml0aWFsbHksIGJ1dCBub3cgYWxsIGl0IGFj
aGlldmVzIGlzDQo+ID4gPiBjcmVhdGluZw0KPiA+ID4gbW9yZSBjb25mdXNpbmcgZXJyb3JzIHdo
ZW4gdGhlIGRyaXZlciB0cmllcyB0byBzdWJtaXQgY29tbWFuZHMgdG8NCj4gPiA+IGENCj4gPiA+
IEd1QyBpdCBhbHJlYWR5IGtub3dzIGlzIG5vdCB0aGVyZS4gU28gZml4IHRoYXQgdXAuDQo+ID4g
PiANCj4gPiA+IEFzIGEgc3RvcC1nYXAgYW5kIHRvIGhlbHAgd2l0aCBkZWJ1ZyBvZiBsb2FkIGZh
aWx1cmVzIGR1ZSB0bw0KPiA+ID4gaW52YWxpZA0KPiA+ID4gR3VDIGluaXQgcGFyYW1zLCBhIHdl
ZGdlIGNhbGwgaGFkIGJlZW4gYWRkZWQgdG8gdGhlIGlubmVyIEd1Qw0KPiA+ID4gbG9hZA0KPiA+
ID4gZnVuY3Rpb24uIFRoZSByZWFzb24gYmVpbmcgdGhhdCBpdCBsZWF2ZXMgdGhlIEd1QyBsb2cg
YWNjZXNzaWJsZQ0KPiA+ID4gdmlhDQo+ID4gPiBkZWJ1Z2ZzLiBIb3dldmVyLCBmb3IgYW4gZW5k
IHVzZXIsIHNpbXBseSBhYm9ydGluZyB0aGUgbW9kdWxlDQo+ID4gPiBsb2FkIGlzDQo+ID4gPiBt
dWNoIGNsZWFuZXIgdGhhbiB3ZWRnaW5nIGFuZCB0cnlpbmcgdG8gY29udGludWUuIFRoZSB3ZWRn
ZQ0KPiA+ID4gYmxvY2tzDQo+ID4gPiB1c2VyIHN1Ym1pc3Npb25zIGJ1dCBpdCBzZWVtcyB0aGF0
IHZhcmlvdXMgYml0cyBvZiB0aGUgZHJpdmVyDQo+ID4gPiBpdHNlbGYNCj4gPiA+IHN0aWxsIHRy
eSB0byBzdWJtaXQgdG8gYSBkZWFkIEd1QyBhbmQgbG90cyBvZiBzdWJzZXF1ZW50IGVycm9ycw0K
PiA+ID4gb2NjdXIuDQo+ID4gPiBBbmQgd2l0aCByZWdhcmRzIHRvIGRldmVsb3BlcnMgZGVidWdn
aW5nIHdoeSB0aGVpciBwYXJ0aWN1bGFyDQo+ID4gPiBjb2RlDQo+ID4gPiBjaGFuZ2UgaXMgYmVp
bmcgcmVqZWN0ZWQgYnkgdGhlIEd1QywgaXQgaXMgdHJpdmlhbCB0byBlaXRoZXIgYWRkDQo+ID4g
PiB0aGUNCj4gPiA+IHdlZGdlIGJhY2sgaW4gYW5kIGhhY2sgdGhlIHJldHVybiBjb2RlIHRvIHpl
cm8gYWdhaW4gb3IgdG8ganVzdA0KPiA+ID4gZG8gYQ0KPiA+ID4gR3VDIGxvZyBkdW1wIHRvIGRt
ZXNnLg0KPiA+ID4gDQo+ID4gPiB2MjogQWRkIHN1cHBvcnQgZm9yIGVycm9yIGluamVjdGlvbiB0
ZXN0aW5nIGFuZCBkcm9wIHRoZSBub3cNCj4gPiA+IHJlZHVuZGFudA0KPiA+ID4gd2VkZ2UgY2Fs
bC4NCj4gPiA+IA0KPiA+ID4gQ0M6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNv
bT4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEpvaG4gSGFycmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJ
bnRlbC5jb20+DQo+ID4gPiAtLS0NCj4gPiA+IMKgwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Vj
LmMgfCAxMyArKysrKysrKystLS0tDQo+ID4gPiDCoMKgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndWMuYw0KPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Vj
LmMNCj4gPiA+IGluZGV4IGU1NmM5YzVjODg0NS4uNWFhNzI4OWNjODNlIDEwMDY0NA0KPiA+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Yy5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3VjLmMNCj4gPiA+IEBAIC0xMDU3LDcgKzEwNTcsNyBAQCBzdGF0aWMgczMy
IGd1Y19wY19nZXRfY3VyX2ZyZXEoc3RydWN0DQo+ID4gPiB4ZV9ndWNfcGMNCj4gPiA+ICpndWNf
cGMpDQo+ID4gPiDCoMKgI2VuZGlmDQo+ID4gPiDCoMKgI2RlZmluZSBHVUNfTE9BRF9USU1FX1dB
Uk5fTVPCoMKgwqDCoMKgIDIwMA0KPiA+ID4gwqAgDQo+ID4gPiAtc3RhdGljIHZvaWQgZ3VjX3dh
aXRfdWNvZGUoc3RydWN0IHhlX2d1YyAqZ3VjKQ0KPiA+ID4gK3N0YXRpYyBpbnQgZ3VjX3dhaXRf
dWNvZGUoc3RydWN0IHhlX2d1YyAqZ3VjKQ0KPiA+ID4gwqDCoHsNCj4gPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoHN0cnVjdCB4ZV9ndCAqZ3QgPSBndWNfdG9fZ3QoZ3VjKTsNCj4gPiA+IMKgwqDCoMKg
wqDCoMKgwqDCoHN0cnVjdCB4ZV9tbWlvICptbWlvID0gJmd0LT5tbWlvOw0KPiA+ID4gQEAgLTEx
NjQsNyArMTE2NCw3IEBAIHN0YXRpYyB2b2lkIGd1Y193YWl0X3Vjb2RlKHN0cnVjdCB4ZV9ndWMN
Cj4gPiA+ICpndWMpDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGJyZWFrOw0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoH0NCj4gPiA+IMKgIA0KPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhl
X2RldmljZV9kZWNsYXJlX3dlZGdlZChndF90b194ZShndCkpOw0KPiA+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRVBST1RPOw0KPiA+IElmIHdlIGVycm9yIG91dCBo
ZXJlIGluc3RlYWQgb2Ygd2VkZ2Ugd291bGQgaXQgYmUgYmV0dGVyIHRvIGFkZA0KPiA+IHNvbWUN
Cj4gPiBkZWZhdWx0IGNhc2VzIHRvIHRoZSBib290cm9tIGFuZCB1a2VybmVsIHN3aXRjaCBzdGF0
ZW1lbnRzIGFib3ZlIHNvDQo+ID4gd2UNCj4gPiBtYWtlIHN1cmUgdG8gY2F0Y2gvbm90aWZ5IG9m
IHVuZXhwZWN0ZWQgZXJyb3JzIHJhdGhlciB0aGFuIGp1c3QNCj4gPiByZXR1cm4NCj4gPiB0aGUg
cHJvdG9jb2wgZXJyb3I/DQo+IE5vdCBmb2xsb3dpbmcuDQo+IA0KPiBUaGUgc3dpdGNoIHN0YXRl
bWVudCBpcyBqdXN0IGFib3V0IGRlY29kaW5nIGNvbW1vbiBzdGF0ZSB2YWx1ZXMgaW50byANCj4g
aHVtYW4gcmVhZGFibGUgbWVzc2FnZXMuIEVhY2ggY2FzZSBpcyBsaXRlcmFsbHk6ICdjYXNlIFg6
DQo+IHhlX2d0X2VycigiWCANCj4gaGFwcGVuZWQiKTsgYnJlYWs7Jy4gQW5kIGltbWVkaWF0ZWx5
IGJlZm9yZSB0aGUgc3dpdGNoZXMgaXMgYSANCj4geGVfZ3RfZXJyKCIweCVYIGhhcHBlbmVkIikg
dG8gZ2l2ZSB0aGUgcmF3IHJlZ2lzdGVyIHZhbHVlcy4gSWYgDQo+ICdsb2FkX2RvbmUgIT0gMScs
IGkuZS4gd2UgaGF2ZSBnb3QgaW50byB0aGlzIGJsb2NrIG9mIGNvZGUsIHRoZW4gdGhlDQo+IEd1
QyANCj4gbG9hZCBmYWlsZWQgYW5kIHRoZSBkcml2ZXIgbG9hZCBuZWVkcyB0byBhYm9ydC4gSGVu
Y2UsIHRoZSByZXR1cm4gaXMgDQo+IGd1YXJhbnRlZWQgdG8gYmUgRVBST1RPIGFuZCB0aGUgb25s
eSBxdWVzdGlvbiBpcyB3aGF0IHVzZWZ1bCBtZXNzYWdlcw0KPiBjYW4gd2UgcHJpbnQgZmlyc3Qu
DQoNClllYWggdGhpcyB3YXMgZXhhY3RseSBteSBwb2ludC4gRG9lcyBpdCBtYWtlIHNlbnNlIHRv
IGFkZCBhIG5ldw0KaW50ZXJlc3RpbmcgbWVzc2FnZSBoZXJlIG5vdyB0aGF0IHRoZSAid2VkZ2Vk
IiBzdGF0ZSBpcyBnb25lPyBPciBpcw0KaGF2aW5nIHRoZSBQUk9UTyBlcnJvciBlbm91Z2ggYXMg
YSBzdGFydGluZyBwb2ludD8NCg0KSSBndWVzcyBub3QgYSBodWdlIGRlYWwgc2luY2Ugd2UncmUg
YWxyZWFkeSBwcmludGluZyBhbGwgb2YgdGhlDQpyZWxldmFudCBiaXRzIGluIHRoZSB4ZV9ndF9l
cnIoKSBhYm92ZS4uDQoNCkFueXdheSBub3QgYSBibG9ja2VyIGhlcmUuLi4NCg0KVGhhbmtzLA0K
U3R1YXJ0DQoNCj4gDQo+IEpvaG4uDQo+IA0KPiA+IFRoYW5rcywNCj4gPiBTdHVhcnQNCj4gPiAN
Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoH0gZWxzZSBpZiAoZGVsdGFfbXMgPiBHVUNfTE9BRF9U
SU1FX1dBUk5fTVMpIHsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4
ZV9ndF93YXJuKGd0LCAiZXhjZXNzaXZlIGluaXQgdGltZTogJWxsZG1zIQ0KPiA+ID4gW3N0YXR1
cw0KPiA+ID4gPSAweCUwOFgsIHRpbWVvdXRzID0gJWRdXG4iLA0KPiA+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRlbHRhX21zLCBzdGF0
dXMsIGNvdW50KTsNCj4gPiA+IEBAIC0xMTc2LDcgKzExNzYsMTAgQEAgc3RhdGljIHZvaWQgZ3Vj
X3dhaXRfdWNvZGUoc3RydWN0IHhlX2d1Yw0KPiA+ID4gKmd1YykNCj4gPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGVsdGFfbXMsDQo+ID4g
PiB4ZV9ndWNfcGNfZ2V0X2FjdF9mcmVxKGd1Y19wYyksDQo+ID4gPiBndWNfcGNfZ2V0X2N1cl9m
cmVxKGd1Y19wYyksDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGJlZm9yZV9mcmVxLCBzdGF0dXMsIGNvdW50KTsNCj4gPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoH0NCj4gPiA+ICsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoHJldHVybiAwOw0K
PiA+ID4gwqDCoH0NCj4gPiA+ICtBTExPV19FUlJPUl9JTkpFQ1RJT04oZ3VjX3dhaXRfdWNvZGUs
IEVSUk5PKTsNCj4gPiA+IMKgIA0KPiA+ID4gwqDCoHN0YXRpYyBpbnQgX194ZV9ndWNfdXBsb2Fk
KHN0cnVjdCB4ZV9ndWMgKmd1YykNCj4gPiA+IMKgwqB7DQo+ID4gPiBAQCAtMTIwOCwxNCArMTIx
MSwxNiBAQCBzdGF0aWMgaW50IF9feGVfZ3VjX3VwbG9hZChzdHJ1Y3QgeGVfZ3VjDQo+ID4gPiAq
Z3VjKQ0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gb3V0Ow0K
PiA+ID4gwqAgDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqAvKiBXYWl0IGZvciBhdXRoZW50aWNh
dGlvbiAqLw0KPiA+ID4gLcKgwqDCoMKgwqDCoMKgZ3VjX3dhaXRfdWNvZGUoZ3VjKTsNCj4gPiA+
ICvCoMKgwqDCoMKgwqDCoHJldCA9IGd1Y193YWl0X3Vjb2RlKGd1Yyk7DQo+ID4gPiArwqDCoMKg
wqDCoMKgwqBpZiAocmV0KQ0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdv
dG8gb3V0Ow0KPiA+ID4gwqAgDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqB4ZV91Y19md19jaGFu
Z2Vfc3RhdHVzKCZndWMtPmZ3LA0KPiA+ID4gWEVfVUNfRklSTVdBUkVfUlVOTklORyk7DQo+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsNCj4gPiA+IMKgIA0KPiA+ID4gwqDCoG91dDoN
Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoHhlX3VjX2Z3X2NoYW5nZV9zdGF0dXMoJmd1Yy0+Zncs
DQo+ID4gPiBYRV9VQ19GSVJNV0FSRV9MT0FEX0ZBSUwpOw0KPiA+ID4gLcKgwqDCoMKgwqDCoMKg
cmV0dXJuIDDCoMKgwqDCoMKgwqDCoMKgLyogRklYTUU6IHJldCwgZG9uJ3Qgd2FudCB0byBzdG9w
IGxvYWQNCj4gPiA+IGN1cnJlbnRseSAqLzsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoHJldHVybiBy
ZXQ7DQo+ID4gPiDCoMKgfQ0KPiA+ID4gwqAgDQo+ID4gPiDCoMKgc3RhdGljIGludCB2Zl9ndWNf
bWluX2xvYWRfZm9yX2h3Y29uZmlnKHN0cnVjdCB4ZV9ndWMgKmd1YykNCj4gDQoNCg==
