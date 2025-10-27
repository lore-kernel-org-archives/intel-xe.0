Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D71CCCF9E5
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 20:10:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3700410E55D;
	Mon, 27 Oct 2025 20:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hN9a8Ogm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4025710E575
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 20:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761595812; x=1793131812;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=5qns2uLBIJcO0MJZTLMDooi9RjAedSfWRw8LTUYzgj0=;
 b=hN9a8OgmigTHxraIYvdj77XfpJdUnXgllXdUI6n3FTJD8ud14Fn+MtIC
 Q0OP43X9D9qhKLviBiusI30WriJ2zjd6SQlb0X+TVCG8jHRHjRlr8STig
 cJK51JXwsTwqfeJ6dnIlERjqX4C2TbjmCkhIMpSgvuA52Gv73QsC9rBH1
 eSD8JcBfp5V/VMby7h836ML1oFvfQRMvhMpqn+ntFC/wwahHUVTRG9Vml
 /ekSWRuEZ7K8Jlczt0rFRAUHlVV0DLofAztZuvW62z5mJBL1VSTxo+2XL
 lcvJsE42Dw+HJT1q2v+c/IK619Px8fMVgiRDSBQCGT0Em4tV3LC2yWRZh Q==;
X-CSE-ConnectionGUID: TDSE5sV/TiOUlOxRRBSkbg==
X-CSE-MsgGUID: uoE/TCQITR2lSELem4v7Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63614484"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63614484"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 13:10:11 -0700
X-CSE-ConnectionGUID: V8iLD/XKT6K+ix4ZG4XJuQ==
X-CSE-MsgGUID: R/pEpCyXRmqehWTgvqmZSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="216030164"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 13:10:10 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 13:10:10 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 13:10:10 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.32) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 13:10:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bHxFH3B8ARl/zumt6seJe1BnaFFLWZ6Lr4+SomcE4B7M4jZwzuBUsgBZ1sgduuq7EWQXI/KBTO+lx4Lr1F+6c6k38nK0tobRoRVVIGkktZq8sYwt6LaRbB/PtEXd4JN54t2brLCVB/Gii2Oa5ZtPvvdizEZlu/fIuaw7GLXT0oKHJAZS8IXeGgMvq9paLW4tl/bUbGSfsr0sYL6OVTXZ9UY5v9z/5UxY3/t+isiHrBHB1N9F4fxf2YMcDCwEOQUZmV5t/7dDPzkYSdTLGATQhhrplTvoLB8RtlhZn91Zvxt3G1BnPE0JT2d8xXDK2b75LaV96IPW104aOF4H4C5/VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qns2uLBIJcO0MJZTLMDooi9RjAedSfWRw8LTUYzgj0=;
 b=JWL/TuQhIWVWSFh8sx6uQHEY/wSIWj4/JdLfMQEzh49mifh5FrtOnuSOMceJVagAVc3ibIJoFOGrU1ZegqECDcahxYYb84quEpuUIRj4kV1QsFBnenz24ViciDBHuycP0JRaMW9Nlo3qfuzcKZTBi+TJdhWfZxpzoUxqAl2UV+cWih5d6bGwzzeMZ3vrLKw/SEVO9uflaPg8yRsOjyhtJt4qtF1j/Z9Ktj81Gsc3/sk/KisUM/RdSoaUH6vuJaORSvx2BtfBc2TIVeeXOOdxQdPQfglbulvJvDyWQkgnHUsnP7Tjhh/xy9EHZnxz0RNGIFy+CSZCaGPxMnWzj2nJgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CH8PR11MB9481.namprd11.prod.outlook.com (2603:10b6:610:2bb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 20:10:08 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9253.018; Mon, 27 Oct 2025
 20:10:08 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re:  CI.KUnit: failure for Fix a couple of wedge corner-case memory
 leaks (rev6)
Thread-Topic: CI.KUnit: failure for Fix a couple of wedge corner-case memory
 leaks (rev6)
Thread-Index: AQHcR24qJM4nbwnWGUSLbPloww5wHbTWbIMA
Date: Mon, 27 Oct 2025 20:10:08 +0000
Message-ID: <b898043516fd7e104e5b1f6277e66097a0e6d830.camel@intel.com>
References: <20251027180412.63743-1-stuart.summers@intel.com>
 <176158904091.59660.2314497415900577533@97596180aaec>
 <690f7dc218ae124b7eb56836819c78c53981d375.camel@intel.com>
In-Reply-To: <690f7dc218ae124b7eb56836819c78c53981d375.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CH8PR11MB9481:EE_
x-ms-office365-filtering-correlation-id: 41f4a065-17dc-418c-e97e-08de1594d3df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?S0tKUFE5cEdUSWxaNlVnbnpVTjltSkxacy8zd01IQTVLWVRVdnRPVG9mWXNo?=
 =?utf-8?B?RzdmSGV3eU1pV3QydWlPcTd2Yk1kRTlSTURCakxleUJ5UE43bEdkSFd1YkZX?=
 =?utf-8?B?TlY0K0RwZ0xZWXl1SDM3NFF1L2xSNkFjV2dmdTE3RkJiWmlHaU1vVVhSQnRs?=
 =?utf-8?B?WFZHTVVjMjZqTUVQNXNPS1V4OCs1WFpUektTY0N4b1hwenpCdVV1b1lTKzNx?=
 =?utf-8?B?S1VFTjhzdEhMcFk1YTFFeWRHRGFxUVozM0tkb04zS0xuUW9MUENVUWhXT1pj?=
 =?utf-8?B?aVg4T1dlRHdNT1k4eHdTWGs3eThiN01IYzFVdlVQMDBWOWxhU0ZGV3RqdlJB?=
 =?utf-8?B?QXRQWnhZaFY1UTY4UWdSZlJWdHhPWWhFZnRhakxOaERERTN5S0ZaMXd6aWZM?=
 =?utf-8?B?cVNRTTBML1dMTk5jSlZWZkliQ2lJekorVURwTjg0RjA5WlAxTnloa3FIQVRa?=
 =?utf-8?B?aW5Ka3NURHBLb25rK09BTXlNYWEyMi9DQWsvNEJRWU1TQXRXelJaQ0swL1Jp?=
 =?utf-8?B?bmg0UmU5NHB6Qk1BdHJoN0ROVGt4cy9OM0N6ZEVJcEtSWnFZcFRNekhWQUV4?=
 =?utf-8?B?djYycFRPY0o5OWdrRXhvMmZXS3p5SmxMYXBYUGtYVlJMSHhtVWU2MkpUb1NQ?=
 =?utf-8?B?alBoVTFrdXNtK2hNR0MwUndKVlQ5U0VDUW5hZWpOaFFuYU1wY3NjVW5QYjZB?=
 =?utf-8?B?a054M3o1VnlaYkZJKzZMN1JVdU9TeldIbjBHR056b1dSYlpxbXhqYzRoZ01J?=
 =?utf-8?B?aHJkMDJnL2lMS09GdVRxWkZKS1ZZZWJ0QVV0SndzdkpHcE1PeTBpNFhIVWo3?=
 =?utf-8?B?TVZTZWxkWjZFTWU0NXp6ckpRQ24xbk1pUmdleG9tMnkwd1VuSnp2Rmp4Zzc5?=
 =?utf-8?B?cmxVRlMyS0NidlRQUi9Oc2dTYVk4QklEanNHSlNsbnhoYm1nVG8rUm5ybW1O?=
 =?utf-8?B?TzNGcGxsWmVxZGQvMHBwTGtSTVlkc2V5MzdRS3MzbU5aOVhBVnQ5L1R5R2t3?=
 =?utf-8?B?TTNVeHdLMFVGVzJ2SU1oTEhlYXJ6NEhhMGI0Z2NIQWdsdjJTbWhLSCs5bFRY?=
 =?utf-8?B?L1poMFZsYWl6dlc5dFl3ZXNhVkZVaDBNWHJMY3I0czNud1h2cjNFdVl6RjRK?=
 =?utf-8?B?UUtPcmhobHhmM3YxcWRsZ1hSTGcrQml4Q05lUEJMdVNZcFcwcmo4UkpZUTFS?=
 =?utf-8?B?d2JsZW5CMmhXQVQxVTV3bXJRNmJiZEtmWFRoMld2bGlzN1hUTWd5VUFsMWlM?=
 =?utf-8?B?SUVabllNZFRXellYZVFCWDYvNDJqdlpmYURtRUkrZTdybE9NU1ZZZkJQTTJz?=
 =?utf-8?B?d084VEZWK1FlNW1uOVNwTUN5WXZTeUwzZmlaWjA0ampTOFdBUkRrbG8rM1I4?=
 =?utf-8?B?OTg3Q3lGRGQxZU5nd3lCSXkrb0QzM0hWanR2cFR0ek1ZQ214Ukx2OWswZWxF?=
 =?utf-8?B?VDh5UExsZ010aVczaGtiN3ZmbXhyVDFTRlVkcDRHWFpTVFRsOHJCdTJlQ3hD?=
 =?utf-8?B?SHlQTVkxZGY2c2hOT3pSeUYzRSsybURFdXFSTks2N3VNTjdsZHUxR21XcWl4?=
 =?utf-8?B?ekRLaEowenNyMWpPTGRjUlpCajRqQzE3TTBEazJueWZBY3VqTTRNK3RoTWpC?=
 =?utf-8?B?QXpCNHpMbzZBYWJzUkt3M2xMcEQzWjJvNE1xdXN0UVlCQVpyaTRsODhQOWJY?=
 =?utf-8?B?WFpvdjhUbjdxMkk5VDZiTUZ5NVcreFMwSUxoYUhyS3FLUm0vaTJBT0VpbWln?=
 =?utf-8?B?TFhFeDFHcUVXaFR2Q2d5V08yK0RPdVpUVk1EQm9GZStrc1p6QVJlK1d0V3hq?=
 =?utf-8?B?L1k0K3dBU2ZaWnZUclZKMkkzVzdhUkJmK3ZiOGpkdGhWWFBPOUpNUTZ0ak4v?=
 =?utf-8?B?ekMxMkFJMC9ES0w2ejJhZ1VzRnlBYUZpS3Z6MmprRGdzZjRmMEh5YmFNL0gx?=
 =?utf-8?Q?fi61MebxX/EqbzjacmlPkN/HtApcy49y?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UTgwVnptU3NLcjFTdjBoclRQZWxtTGVJbDNXclBLSWg0OHRBeFFLeVg5elF2?=
 =?utf-8?B?bnl3c01MVDF2L3ViK2huMmJOTG15Y21kUHFQRmJYVWNUcTkwV3N4YVJzb3hF?=
 =?utf-8?B?dTc4YVh0bUl4R3dnSklnbWMxSjU3U2Nzd2NPQi80MmlJV0hDVTF3enB3bmU1?=
 =?utf-8?B?ZVkyUkV2NE4yYTdNeHY1THQ2YWRkOEwrYkZBSnI5OHJ6SkFQTnppU0NjOUpx?=
 =?utf-8?B?SGI2dER6SklUSXpxL3Fha1RpbDAxUG9lOXV3dUZ4VTVjK1h1MmFXb3FUK3lP?=
 =?utf-8?B?aDk3dEd6WGpUeXNRS0dWTDhaN2J4YnNNUStNdG1BSUFQaWU3VXF1dDFONHlZ?=
 =?utf-8?B?UmErYVYvUE8zUXFPSWFZcCsrZ1JiTVQrbzc0alBuVFpuVEZHM1p2UC9EdGFW?=
 =?utf-8?B?WnYyenhzNEcrRHMzSXZteUFIdmV4cDRhWGhDK0lBQWx4ejJ3VU9wempEM1lD?=
 =?utf-8?B?YUpTdVlLK0N3UEJCRlEyc3hxTVJ2Z1NzK2d4YktDbXZJSll6VEp6T2dOY3h4?=
 =?utf-8?B?RXR2WTJ6dlNwVGtaakx0b2FGVllhRklZNkF6SzZkdWJNTnpNYklZb0x2K1JJ?=
 =?utf-8?B?TmFmYUR4TVFMWHB4bStPL3ZnS242MTJTZmdtM1hnQ3BIdkFVbmlVVURoYWd5?=
 =?utf-8?B?aDh1SzcvODNSZy9SNlZ3cS83eDlUK2lUT05zdUxad1psdElqZk4rREZ5REFR?=
 =?utf-8?B?ajVtY09LQytrZ25wYlZGZHpuYnUvMko5Q1hCQk85Vm85aVRBbVRzT1g5MndS?=
 =?utf-8?B?MWVOVDJ4ZnM1S3FPdEFXblJ5dWFwZkhoZW1teXNhcFNkSUJZNzJiV1RPNk0r?=
 =?utf-8?B?RnFrU3R0eVJ5TE02KzhGWHFFdWwrdGE2bnFXVkI5ZkM5N3FtbVFhTXR6RFpH?=
 =?utf-8?B?ejBMOVJhODZDWlFQSmdMY2ZvOFhOSkV5TEN6SDVxd3Zid1ozNDg4Z1dRbjIv?=
 =?utf-8?B?Qk8wcmM3dlFKOFg2UlVLSjRpOUtHbnVPSGovTWVVNDZrQ2xGTWhQVEJjT1l2?=
 =?utf-8?B?ckhTYlYzZnpMOWtTSHd3SVVGY3o2TmM5azF3dGJxOFhmMTh6Uy9CZjVmcm9w?=
 =?utf-8?B?VGVUK2E5cVZycGZCZ29BaXh4VzFwSUI0VGxwVmt2VEF1aVpaVG9kajMvL1Bv?=
 =?utf-8?B?ejB0MHhrNGxYYlFTcVBMTmtWNzNJOUxEOXpXajBUSUFBeVovVU9LVXpBdmkv?=
 =?utf-8?B?Wi92eUZRTDNvZ29CdVF1Z3JPUkkxc0RWb1Nzc0k1eEFWR2NjYkE2N213R3Vh?=
 =?utf-8?B?V1BWRFZWRW1SMVZSaGpMcG9DSXBnTjByb3hselNuZW1TM25UeCs3SkErL0lh?=
 =?utf-8?B?bm03emdTZEVSbVlzWExhYTFWTitNQVpUeERNN0taeFZzdStTM0o3R1QwbFlj?=
 =?utf-8?B?enNENHkxZExvVE1QVlllZk4rR1ZBNy9TTXh3TVhVWVFhZmtTbU5uZnlPTHR6?=
 =?utf-8?B?RUY0U3FCakIzcC9tZEJFSmo3eGltc0svZVpsdzBCODQ1YUp0aDAvbmtyZjB4?=
 =?utf-8?B?SDRRYUZiRzNlN0tIckFEUzNXUDJyUWhTMndhWXpZRnhmQUJJdjhlTkE0Q3Ns?=
 =?utf-8?B?VEgzN21mZWx0RmtBeTY0MzZXaTZ4d1ZEOFNlSzhiY1IyQ0t1OExONytzTEcr?=
 =?utf-8?B?VDBxYlJJS0lRRythQWNteXozNUlRN3hLaytON0dLQm50QU1PdEtoMlBlMkxp?=
 =?utf-8?B?Z1l1Y0N2NjdSNDJ2em5GaURyd0pVVTh4eDRoVjYwNjc2RUhBTmphdWs0eFU5?=
 =?utf-8?B?ajFRbk81em1YKzEvc01EQTQrVjlBWjkvL1RBMWdrYTR1dndMb3ZBMFRHVTFW?=
 =?utf-8?B?WkduVUE2bnQ0aVVEUXc0bEpVSHpVWndLYWxmcHJVRkh1c2N1SmpQbmcxNHB3?=
 =?utf-8?B?NVVqUmQrS1BkWVdpdzlIazlJV2lYbHBUOXAxTVZ2SUpWK2Nkc1Z6MVAyaFVs?=
 =?utf-8?B?OW95ekJUUzcwTStoamtVenFxclZlbFVkNzF5V1pkaDB6VXM2d3JQMEZpUE4y?=
 =?utf-8?B?b3BLd3FVUWNoVi9xYVBBRElaZ1pUenN4b3ZzUjFCTk1vdHNxeVVSTXdwTXVC?=
 =?utf-8?B?MmliTUhFV0pEemdRZVgrWCtqamNJRSttUXA1WkNRblBzekx5Q0tHaXluM1hi?=
 =?utf-8?B?MCszQmd0b2sxUk9OMitsVVdZQ1FpZTByMTJNK0RQTGUxbHpGWDN2aHBQUlUr?=
 =?utf-8?B?b2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <040EEFD10C1F1C44A20D4C62193137A2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41f4a065-17dc-418c-e97e-08de1594d3df
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2025 20:10:08.6812 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wx1BuntP+2H2iQoLN8K6NRgFsT4VfjS0hNn1W5CZPtye7IGNznrZg2diSxgFBr/13zgJKRCpKHN7MsRN32cPxPC1tmj7tVMW6CermzzyG0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9481
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

T24gTW9uLCAyMDI1LTEwLTI3IGF0IDE4OjE4ICswMDAwLCBTdW1tZXJzLCBTdHVhcnQgd3JvdGU6
Cj4gT24gTW9uLCAyMDI1LTEwLTI3IGF0IDE4OjE3ICswMDAwLCBQYXRjaHdvcmsgd3JvdGU6Cj4g
PiA9PSBTZXJpZXMgRGV0YWlscyA9PQo+ID4gCj4gPiBTZXJpZXM6IEZpeCBhIGNvdXBsZSBvZiB3
ZWRnZSBjb3JuZXItY2FzZSBtZW1vcnkgbGVha3MgKHJldjYpCj4gPiBVUkzCoMKgIDogaHR0cHM6
Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNTUzNTIvCj4gPiBTdGF0ZSA6IGZh
aWx1cmUKPiA+IAo+ID4gPT0gU3VtbWFyeSA9PQo+ID4gCj4gPiArIHRyYXAgY2xlYW51cCBFWElU
Cj4gPiArIC9rZXJuZWwvdG9vbHMvdGVzdGluZy9rdW5pdC9rdW5pdC5weSBydW4gLS1rdW5pdGNv
bmZpZwo+ID4gL2tlcm5lbC9kcml2ZXJzL2dwdS9kcm0veGUvLmt1bml0Y29uZmlnCj4gPiBFUlJP
Ujpyb290OkluIGZpbGUgaW5jbHVkZWQgZnJvbSAuLi9pbmNsdWRlL2xpbnV4L2JpdGZpZWxkLmg6
MTAsCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmcm9tIC4uL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmM6ODoKPiA+IC4uL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndWNfc3VibWl0LmM6IEluIGZ1bmN0aW9uCj4gPiDigJhndWNfc3VibWl0X3dlZGdlZF9maW5p
4oCZOgo+ID4gLi4vZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYzozMDA6MzE6IGVy
cm9yOiBpbXBsaWNpdAo+ID4gZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYZHJtX3NjaGVkX2lz
X3N0b3BwZWTigJk7IGRpZCB5b3UgbWVhbgo+ID4g4oCYZHJtX3NjaGVkX3N0b3DigJk/IFstV2Vy
cm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+IAo+IEhtLi4gSSBkaWRuJ3Qgc2Vl
IHRoaXMgd2hlbiB0ZXN0aW5nIGxvY2FsbHkuIEknbGwgZG91YmxlIGNoZWNrIGhlcmUuCgpBaCBy
aWdodCwgdGhpcyBjb21lcyB3aXRoCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9w
YXRjaC82ODE2MDYvP3Nlcmllcz0xNTUzMTUmcmV2PTMKd2hpY2ggaXNuJ3QgYXZhaWxhYmxlIHll
dC4gSSdtIHdvcmtpbmcgb24gcmV2aWV3aW5nIHRoYXQgc2VyaWVzIGFzCndlbGwuIEkgc3RpbGwg
dGhpbmsgaXQncyB3b3J0aCBnZXR0aW5nIGZlZWRiYWNrIG9uIHRoaXMgc2VyaWVzIGluCnBhcmFs
bGVsLCBidXQgbGV0IG1lIGtub3cgaWYgdGhlcmUgYXJlIGFueSBjb25jZXJucyB0aGVyZS4KClRo
YW5rcywKU3R1YXJ0Cgo+IAo+IC1TdHVhcnQKPiAKPiA+IMKgIDMwMCB8wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAhZHJtX3NjaGVkX2lz
X3N0b3BwZWQoJnEtPmd1Yy0KPiA+ID4gc2NoZWQuYmFzZSkpOwo+ID4gwqDCoMKgwqDCoCB8wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IF5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gPiAuLi9pbmNsdWRlL2xpbnV4L2J1aWxkX2J1Zy5oOjMw
OjYzOiBub3RlOiBpbiBkZWZpbml0aW9uIG9mIG1hY3JvCj4gPiDigJhCVUlMRF9CVUdfT05fSU5W
QUxJROKAmQo+ID4gwqDCoCAzMCB8ICNkZWZpbmUgQlVJTERfQlVHX09OX0lOVkFMSUQoZSkgKCh2
b2lkKShzaXplb2YoKF9fZm9yY2UKPiA+IGxvbmcpKGUpKSkpCj4gPiDCoMKgwqDCoMKgCj4gPiB8
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoAo+ID4gXgo+ID4gLi4vZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Fzc2VydC5oOjEx
Mjo5OiBub3RlOiBpbiBleHBhbnNpb24gb2YKPiA+IG1hY3JvCj4gPiDigJhfX3hlX2Fzc2VydF9t
c2figJkKPiA+IMKgIDExMiB8wqDCoMKgwqDCoMKgwqDCoCBfX3hlX2Fzc2VydF9tc2coX194ZSwK
PiA+IGNvbmRpdGlvbizCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBcCj4gPiDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgIF5+fn5+fn5+fn5+
fn5+fgo+ID4gLi4vZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Fzc2VydC5oOjE0ODo5OiBub3RlOiBp
biBleHBhbnNpb24gb2YKPiA+IG1hY3JvCj4gPiDigJh4ZV9hc3NlcnRfbXNn4oCZCj4gPiDCoCAx
NDggfMKgwqDCoMKgwqDCoMKgwqAgeGVfYXNzZXJ0X21zZyh0aWxlX3RvX3hlKF9fdGlsZSksIGNv
bmRpdGlvbiwgInRpbGU6Cj4gPiAldSBWUkFNICVzXG4iIG1zZyzCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFwKPiA+IMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqAgXn5+fn5+
fn5+fn5+fgo+ID4gLi4vZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Fzc2VydC5oOjE3Mjo5OiBub3Rl
OiBpbiBleHBhbnNpb24gb2YKPiA+IG1hY3JvCj4gPiDigJh4ZV90aWxlX2Fzc2VydF9tc2figJkK
PiA+IMKgIDE3MiB8wqDCoMKgwqDCoMKgwqDCoCB4ZV90aWxlX2Fzc2VydF9tc2coZ3RfdG9fdGls
ZShfX2d0KSwgY29uZGl0aW9uLAo+ID4gIkdUOgo+ID4gJXUgdHlwZSAlZFxuIiBtc2cswqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKg
wqDCoCBefn5+fn5+fn5+fn5+fn5+fn4KPiA+IC4uL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9hc3Nl
cnQuaDoxNjk6Mzc6IG5vdGU6IGluIGV4cGFuc2lvbiBvZgo+ID4gbWFjcm8KPiA+IOKAmHhlX2d0
X2Fzc2VydF9tc2figJkKPiA+IMKgIDE2OSB8ICNkZWZpbmUgeGVfZ3RfYXNzZXJ0KGd0LCBjb25k
aXRpb24pIHhlX2d0X2Fzc2VydF9tc2coKGd0KSwKPiA+IGNvbmRpdGlvbiwgIiIpCj4gPiDCoMKg
wqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXn5+fn5+fn5+fn5+fn5+fgo+ID4gLi4vZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYzoyOTk6MTc6IG5vdGU6IGluIGV4cGFuc2lvbiBvZgo+
ID4gbWFjcm8g4oCYeGVfZ3RfYXNzZXJ04oCZCj4gPiDCoCAyOTkgfMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHhlX2d0X2Fzc2VydChndWNfdG9fZ3QoZ3VjKSwKPiA+IMKgwqDCoMKg
wqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF5+fn5+fn5+fn5+fgo+ID4gY2Mx
OiBzb21lIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzCj4gPiBtYWtlWzddOiAqKiog
Wy4uL3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6Mjg3Ogo+ID4gZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Y19zdWJtaXQub10gRXJyb3IgMQo+ID4gbWFrZVs3XTogKioqIFdhaXRpbmcgZm9yIHVuZmlu
aXNoZWQgam9icy4uLi4KPiA+IG1ha2VbNl06ICoqKiBbLi4vc2NyaXB0cy9NYWtlZmlsZS5idWls
ZDo1NTY6IGRyaXZlcnMvZ3B1L2RybS94ZV0KPiA+IEVycm9yIDIKPiA+IG1ha2VbNV06ICoqKiBb
Li4vc2NyaXB0cy9NYWtlZmlsZS5idWlsZDo1NTY6IGRyaXZlcnMvZ3B1L2RybV0gRXJyb3IKPiA+
IDIKPiA+IG1ha2VbNF06ICoqKiBbLi4vc2NyaXB0cy9NYWtlZmlsZS5idWlsZDo1NTY6IGRyaXZl
cnMvZ3B1XSBFcnJvciAyCj4gPiBtYWtlWzNdOiAqKiogWy4uL3NjcmlwdHMvTWFrZWZpbGUuYnVp
bGQ6NTU2OiBkcml2ZXJzXSBFcnJvciAyCj4gPiBtYWtlWzJdOiAqKiogWy9rZXJuZWwvTWFrZWZp
bGU6MjAxMDogLl0gRXJyb3IgMgo+ID4gbWFrZVsxXTogKioqIFsva2VybmVsL01ha2VmaWxlOjI0
ODogX19zdWItbWFrZV0gRXJyb3IgMgo+ID4gbWFrZTogKioqIFtNYWtlZmlsZToyNDg6IF9fc3Vi
LW1ha2VdIEVycm9yIDIKPiA+IAo+ID4gWzE4OjE2OjQ3XSBDb25maWd1cmluZyBLVW5pdCBLZXJu
ZWwgLi4uCj4gPiBHZW5lcmF0aW5nIC5jb25maWcgLi4uCj4gPiBQb3B1bGF0aW5nIGNvbmZpZyB3
aXRoOgo+ID4gJCBtYWtlIEFSQ0g9dW0gTz0ua3VuaXQgb2xkZGVmY29uZmlnCj4gPiBbMTg6MTY6
NTFdIEJ1aWxkaW5nIEtVbml0IEtlcm5lbCAuLi4KPiA+IFBvcHVsYXRpbmcgY29uZmlnIHdpdGg6
Cj4gPiAkIG1ha2UgQVJDSD11bSBPPS5rdW5pdCBvbGRkZWZjb25maWcKPiA+IEJ1aWxkaW5nIHdp
dGg6Cj4gPiAkIG1ha2UgYWxsIGNvbXBpbGVfY29tbWFuZHMuanNvbiBzY3JpcHRzX2dkYiBBUkNI
PXVtIE89Lmt1bml0IC0tCj4gPiBqb2JzPTQ4Cj4gPiArIGNsZWFudXAKPiA+ICsrIHN0YXQgLWMg
JXU6JWcgL2tlcm5lbAo+ID4gKyBjaG93biAtUiAxMDAzOjEwMDMgL2tlcm5lbAo+ID4gCj4gPiAK
PiAKCg==
