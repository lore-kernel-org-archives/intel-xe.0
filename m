Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74ED0CCD183
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 03:10:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1245910E1BF;
	Tue, 14 Oct 2025 03:10:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SAqfUR9q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C92F10E129
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 03:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760411456; x=1791947456;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=fof5vmf7jSA4aw/jyMtFiVdlEMCxNENUTNaKyMdEyLQ=;
 b=SAqfUR9qKQ5XLDzAK6LsstUldsl/XRSp0wF0IKP/53ebzwbxUtgSO5co
 jNJPBLlJ/P9+89Pj1bLPYOGqyYWlN8KdR+JvTR8eljs/MT2WpTFOPgJ1t
 /dC08tpqd91GETlCgJRX9M0HragLVb/Aw1mATwqVIwOJue1iXn8tHDPMq
 wVpYQpN/hmMNGzzNvTBWAr9BLxEdzJvSd9qrp4iy7tgw2YS7ci1/Wrv7V
 NXmCZMtDV5ZDNbtw+NI0exIsYRra4DsP2JrVmY2YLjSTQ6nlk0mvzMvYh
 cYS9+nH8Gfygozsiyt1fvymT55kNhi0soS58qsruxbGlQgO8smcWhTva8 Q==;
X-CSE-ConnectionGUID: rUqmqLdUQU2udwTXhZiaRQ==
X-CSE-MsgGUID: Dz8ZfmzCSO2FQ/wVHMx/LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62495581"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62495581"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:10:52 -0700
X-CSE-ConnectionGUID: IrXJZ619Q8C8b/oVP3Ttxg==
X-CSE-MsgGUID: x8o07XRuRxCh0qYDeYk+9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="187063211"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:10:51 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 20:10:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 20:10:51 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.56) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 20:10:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rihlFrs2BpFt1pOVunoHNLxxs1mN6trIdARXwquFxbjHOZd7WiCOS8MAl9VtvByjXbMyYQIWtAIJpJU96W4o4HblUDOAlVCX9V11qcuCSEyAhNvlzchj2383kDa1hxNufWQY88H2ClGWi/JuovEPwEHPbY7CKuaBkXrUsQTixrDcF+5BQuIQIXhUZBy7m0yf8hi2f/FNWATAG+HI3eLXSg5s/PlY7gGmNKEWrL6BdkunFIh81KWqNCUUXiRgojZ+HRgjHGHONKw0t7hMPybgbEPSORBD54iqyGu4SPLWt559smUHYTqbOKFFfLjxeCEh1lKlr7S4o9cHVv0Uj7tBnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fof5vmf7jSA4aw/jyMtFiVdlEMCxNENUTNaKyMdEyLQ=;
 b=wHbY4xFv7mRB+D3PP6s+8EBiapRzuPM6XR9wHeCHTASzHlZ66TVouaUi7M2WigYvOhXFTzH4HFkwgrchvFVErQKNQhU56hjh9WacEGlbdP/olTRAivCL6zLQ59ab9HnaG7qTZpClESUttbnrpn5kv+J1DKirARmwk2E/GjJysTb9v0OmkR/ry9dKBizAcjeMP3s9Z5EJOD9Xgb+r1J6JmiNtrSVWfZN8EA6TA3c9eHtFkViTzrq0gv+pR73vgBz32He1CpfVV4qoq949CTMbBPPuC9UdxOGD9Dv1ZJ4T/2ts5KER06rlAHbdT+2tmAZcUgfxsDy0wZFtLUqD/bVXSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA1PR11MB5873.namprd11.prod.outlook.com (2603:10b6:806:228::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 03:10:37 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 03:10:37 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 7/7] drm/xe: Check for GuC responses on disabling
 scheduling
Thread-Topic: [PATCH 7/7] drm/xe: Check for GuC responses on disabling
 scheduling
Thread-Index: AQHcPJEqoAdXAhjwuUqH4dpNy8mgFLTA5eOAgAARMwA=
Date: Tue, 14 Oct 2025 03:10:37 +0000
Message-ID: <b8b076b3602ff1effa1ad6fb3d2ab1d1430f7a67.camel@intel.com>
References: <20251013223135.189357-1-stuart.summers@intel.com>
 <20251013223135.189357-8-stuart.summers@intel.com>
 <aO2wvw/FIZecvvXB@lstrano-desk.jf.intel.com>
In-Reply-To: <aO2wvw/FIZecvvXB@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA1PR11MB5873:EE_
x-ms-office365-filtering-correlation-id: 684f8ee5-3199-4d37-bff1-08de0acf3fa0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ZWNuYTRnaWRvVEYza0FzVTJZRWhFNkVSamFNMlIzUGk0Y01vUFFMZ3daUkxM?=
 =?utf-8?B?blNQOFF4bjBCek12bVN1dXVCZU5iRVFsUHBKVUJ2dkJremY4Lzd5aXV3UXFJ?=
 =?utf-8?B?YWJ4czBwZDZwakhFbHE5YTV6WHpXendhSWNTV2JWbmp1UXpLMXlyR1ZReWdP?=
 =?utf-8?B?dUt0WVAxMkM1TWtBK3pOSFJXOTVVQ09kWGZ1MXNYcVB5dWcra1daekcyamly?=
 =?utf-8?B?QW56Mld0UFFxaVYrdzdoSGpKUzR1SmVUeGk2UnZsYkhUZXhaS0xnZVplT2Nr?=
 =?utf-8?B?MncvSENOb2RWY0ZOVk5VNkczK01GSngvaHNxUERUaCsxMHdQZmpheXNacmk5?=
 =?utf-8?B?S1lsbzNjV2ZiVStWSS8yWmNiZWJnVERvaVh4NVIya3NpL0ZTeFgySDdMTDNo?=
 =?utf-8?B?d2FZOXRSN29uWGxQZjhjN2tSeHY3Y2hpd2ZoLzFjZUlqaDRPaE9TREZwRmlr?=
 =?utf-8?B?blIzYVRWMGw2RHRPeHdWS1RuaHR0ZDZnTlZGeENMQUcvZ25yREhPMVMxbloy?=
 =?utf-8?B?QUN3My9Ycit1QTBFMmFDS0srcnU3ZldmN2RoQjhyT3NyMEJ0ckg2cXNJUGpo?=
 =?utf-8?B?Zkpxd1Y5K1Z4ekZtN1UzZ3J2emZpSEs1OTNXRlZ1NDhpZ2tVRW43T2FMbmJj?=
 =?utf-8?B?Yzgwb0ZJa2ZPUXlvd3B0RUhtTTNTeGtUYWwyRkxDcWMrdUlCTE9Lc1pEOFo1?=
 =?utf-8?B?bjFKUnF0TWc4VlY3R0pzZ1BzZytXV0pjQ3ZPWmphaDFMUEdPMjVNblNtcHFB?=
 =?utf-8?B?YzFJd0x6bUNCbnM0VDUyS2dNakF1WTRrWlJTRlRLOUhwL25OS0dlU0p2cHFu?=
 =?utf-8?B?djdld0VINSs2QzBTem0wbVdPS2Iwb2dUWTNjZkxjVFVVUVptcVNQRUx1djNn?=
 =?utf-8?B?M2pENVBMbXBsbmpXWUJORUlVWXlCMlFlZ0F2SlBERGw4S2xRWi9GL0ZIMis4?=
 =?utf-8?B?UDFVR3VWQTZxQm92Q2FKaGtJZlhuNmVwUjZweEJPM1JodWhFWnNjamZpRDhm?=
 =?utf-8?B?MTNtSU90M01YOUlTRDB3ZmM4WHdYUi9XMEFnam1GMkpiaUtEdm1MbHczcFFI?=
 =?utf-8?B?MVJaSHM2RklMNjM4ZlhQaTZtWGQweVpJdHdlNGR1NDRPczVJb014Yy83SFRI?=
 =?utf-8?B?aThteWlxYVRFSFhQanNyelgwUXArU05TcmtMZTN4UlBJb1RUUDJrbjUxaW8v?=
 =?utf-8?B?N1FvTEpKWVlEYjNnS0VOTWN1S0tOTGFNTWVoM0hBQ0VOUStOSEZHOExUTXdI?=
 =?utf-8?B?L1hwcG9LVm9Db3lDSzkvSktHeDhvYkpzN0kvdmhlSk43ZGZWTHNFRkl0TEtF?=
 =?utf-8?B?c2JEcktacFV4S013ZHVENVBSdTRGVEtoL3JwRmRtVkIyb2o3cHFxS0RNYWxI?=
 =?utf-8?B?TjJNQ3hrdUcwazhmWklBQytaUVQ3elBvT3plOVhaVU84V1hWcURLSTlGYW9K?=
 =?utf-8?B?dnptakRwUEVpUklBZEZ1eUFNUCtScFVZYk9xY3c4SzR5ZjFwTnR5VE42b01Y?=
 =?utf-8?B?VC9WLytlMlNOZDVRekpUNEl5WitSaFJNdldCcDg0REJOdnRFQmQvcUdNVG9o?=
 =?utf-8?B?ZG9CTWJWZDQ0dG1XOVp5V2piRit6L2puOUd2cXVKcFJSTWZHU1FHSUlsd2po?=
 =?utf-8?B?TUNyUlpZbHJPek1ubnVCY0ZRWitwNEVUZWxadlE5K0tCUDVOblJWNDltcGNk?=
 =?utf-8?B?VCtnOG9jTXQ0NnkzMW9vbFN2WnFkN0hBaVZkQkZNeEZUdDhqQWpyZjg3SnVu?=
 =?utf-8?B?UlpHVzV3NzBWdnZsTVo0SVJyaGo2SCtmMngrdGVwd3FwbE9YWmhIL2RIbzNt?=
 =?utf-8?B?UWlIcWo3M0dwSk5LcUNDTjErQ1dlcHhqS2dFQ0ErMGZwaDJFTjh0OWNlb0Uy?=
 =?utf-8?B?a1dhN3ZzWUNweThGN0RPMm51U01ZOW1zb25NL2hpWnZxNDNrNzBEYVJIelRG?=
 =?utf-8?B?dkJEcDZLYTlVTENpOVFQUjVTbGFsT3JXNGwyTzZtMzBWMTFJejdKT1RvZUxK?=
 =?utf-8?B?L21wZXlGeGhid3Jsckd2WEtkbGQzcldxaVpKdWdkU1pHajEzQ3dQaU8xQm4v?=
 =?utf-8?Q?HR281Y?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmRMVkNTR3BsUW1EUk1YTlpKTTMzNDllamJhd1dSV1M4aFI1dzVpaTVRWm9P?=
 =?utf-8?B?N3VkVlNLOG9OT21sc1V1Q0gzOHVvS1VFeWJzSkdYK2E1M1FxNXRYak9FcnpV?=
 =?utf-8?B?LzR4NFVQdkdVMHdQVXBiUWFydEFSSVkwN21CQkx4OTNhbDdTbG5pVWEvNGdZ?=
 =?utf-8?B?UlZTWFByUmxWUnZ1c1FWbzRxc2poRVQ2VmhFT0pKRTRkb0F2bEFVeHVpaVBh?=
 =?utf-8?B?N3JDY2E3bEpSelJKQW10QTZPc1lqeU9rK2VpRW0yc3RuNzMrWFo5WmlYaTBX?=
 =?utf-8?B?Sm5LK0tXYXFiWFFNZkN1QnZjV0grUVQvR1RXdTZZV0p5RUNQTjVFRmFUTStt?=
 =?utf-8?B?eFhFYWVuZEFUTmp4cGtQYlNtWStPMFdycUt6MFA1R0VpWFVxaEZNdEhmdkp0?=
 =?utf-8?B?UVIyTTZmanhnZitoWkYrS25YMmljRmMrUTZuckgrYjhPN3lKY3FMVkZUTkFO?=
 =?utf-8?B?V3A3bDh0YkpLbzdvRGhIbWJIQ3lLSzlxSy83QStwQXVPa1ErSGVpZ1hsbGxt?=
 =?utf-8?B?MVR2YjZFZlh3WkE5N2NodVVsczBuT0Eva3g2eE14V055RlFsditndmpYMFgw?=
 =?utf-8?B?cVNZT0t2UG5KTG1MZ3ZGVlJjYlIxa2xLVGx2OTg2cUFkWVg4aWpvWDhOVGRV?=
 =?utf-8?B?NFh1VW9YeXkyUHFCYnhQaTJGTTVUWnVFYmVwUW5rWlZkVDVJYlRGTkdqb2hM?=
 =?utf-8?B?TUk4bEttN3R5UDdXWXRmU1d6R0t3SnREaTVmeFZ6bi8xa1JUMG5INytNbjZ3?=
 =?utf-8?B?T1l1NmpYMzhyeFVKUzkzRzBuVlBPSHlZS3p0MHRpVHRIRmZWZ1pUbm9nOEZT?=
 =?utf-8?B?SGNwamN4b29kUWJ2THE4TFR4cU9ZMWdBVEN4NU94b21HM1VmU05DTDJuSkln?=
 =?utf-8?B?cE5nT2JZRW10TTdvc1k5Qk5BNUZveDlnS2hyTWpwLzdoOUFkVWhKUUNvN3pC?=
 =?utf-8?B?L3djNmcyK0swVlBQVjF2bXptR0xSTGs3WnRqUTBTRUVXWGh2T0owazBZWlQr?=
 =?utf-8?B?M2NQUWUyYjBZeHNhNG5yR1BWemFzNk9UNnU4MXl3cGE3QkYvT3ZTcGtib3JS?=
 =?utf-8?B?N3MyNWYyOGcvc0NpcHErUUZTTVl0elJ1VmxoNGRXMVNpdW9icEhPMWVRRjYy?=
 =?utf-8?B?Q1hqamRNZlhVNXVQdURaSDhzY3loeHo3ZGZUNXROMTY2azBpMkkxemFHL3FJ?=
 =?utf-8?B?NVdCalNocE1HNGRYNFJwS0hnbXk5b3pyTXc3LzgxOUMxT1RTMitxVGxzS1E4?=
 =?utf-8?B?S3Y4NWRySmZwSkJaT1V1ZFNOVlNCdmIxRlZzMjNlVlA2WTRhbE1wemp6UnZq?=
 =?utf-8?B?Sk9aM2g3aUtDWlZWWUdHbm0zdFpOSnY2YVZpc2x0a1FEWktEeXpxOUgvZUtC?=
 =?utf-8?B?bUJ5SHE3ZVk0bWxBQTYzMlZadDlmT0tXcWVISDA3NitBaTU4NHpEUVNiK2sw?=
 =?utf-8?B?RUxtY2pJWUJEbkxpYktzU09wYWhTcDVwZzYyaDJ3Z01ET0FIZldJbENtTDdS?=
 =?utf-8?B?eERCRWlaR2lhYWVXbENQTzdzeUdNNTdOK1N6K1RYMVhTNFhNamJGOWxqOVlU?=
 =?utf-8?B?c01kTDVaZEladzN4THJ3V05BUHhBWUFrdDl5REFpWFFpbm5QOEx2cUdrZThO?=
 =?utf-8?B?cFVjalByNzBpbGl0NER5SUVaQ0FQOUYrUzFxOXlmWDFLdVdoVDFJRjg3ckZj?=
 =?utf-8?B?dVNudE11S2RUakZUWHhkV3dYUi9CaG5UZ2M0Wnp1ejIvQW84S0pqRjlGYmtC?=
 =?utf-8?B?cTZtdGRpSmdpeHRIOFBDQVlLUmY2R3RqaTYwTVBqMnJvT0hyaGRYOVQ0a21O?=
 =?utf-8?B?b0xpTkdscnNYL0J1ZG81b09GdExPMmJISVZGRVJKWURmWmNNbXY2Y2VLa2pP?=
 =?utf-8?B?MEFHSjFYVGk0OTg5MitRN3g3b2d1S0RhOFY2NS9qTGNReVY1Q20zZFF4MVRt?=
 =?utf-8?B?bkMyQW9wdi9QbWFLNHZrcVIrNmxSUytudGYxRUl0eFM2d2s2dnRUY2YyWjJa?=
 =?utf-8?B?RjBXeUx1ejZIV3NsTWVMSlkzZTQrenJTY1BhblZGZ0ttWitCVWlnVC9oNTc0?=
 =?utf-8?B?N3BRWWNsbjg2NWhXd29MNlVtQUFacDVQYjZEQWlHMlVmdUFHL1lCbUlGVGlW?=
 =?utf-8?B?ckpQazdsTmt2QkZ5YnhxMkpSOHBiSldlbE9IMDlpQzRScmdIc0FSZ3Fwai9F?=
 =?utf-8?B?MGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5CFFAF2FFAFFD44EBD841AD8323805E6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 684f8ee5-3199-4d37-bff1-08de0acf3fa0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2025 03:10:37.5044 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eQrh/VxqjoIONHCGzOd030y3IUzX7k/hDWi2gcRFmNMu/DEKvy11SnUiWZiqO3V/GPOEL+yk7y5RvRycVp/3XSoOf+s244TgGSNjq96XuTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5873
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

T24gTW9uLCAyMDI1LTEwLTEzIGF0IDE5OjA5IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IE9uIE1vbiwgT2N0IDEzLCAyMDI1IGF0IDEwOjMxOjM1UE0gKzAwMDAsIFN0dWFydCBTdW1tZXJz
IHdyb3RlOgo+ID4gQ3VycmVudGx5IGlmIHRoZSBHdUMgYmVjb21lcyB1bnJlc3BvbnNpdmUgZHVy
aW5nIGEgc2NoZWR1bGUKPiA+IGRpc2FibGUgZXZlbnQsIGFmdGVyIHdlIHNlbmQgdGhlIENUIHJl
cXVlc3QsIHRoZSBkcml2ZXIKPiA+IGRvZXNuJ3QgaGF2ZSBhIGdvb2Qgd2F5IHRvIHJlY292ZXIu
IEluIG1vc3Qgb3RoZXIgY2FzZXMsCj4gPiB3ZSBleHBsaWNpdGx5IHdhaXQgZm9yIEd1QyB0byBy
ZXNwb25kIGJ5IGNoZWNraW5nIGVpdGhlcgo+ID4gcGVuZGluZ19lbmFibGUsIHBlbmRpbmdfZGlz
YWJsZSwgb3Igc29tZSBvdGhlciBzdGF0ZSBjaGFuZ2UKPiA+IHRoYXQgd2UgZXhwZWN0IHRvIGJl
IHNldCBhZnRlciB0aGUgcmVzcG9uc2UgZnJvbSBHdUMgaXMKPiA+IHJlY2VpdmVkIGZvciB0aGF0
IHBhcnRpY3VsYXIgcmVxdWVzdC4gQWRkIGEgc2ltaWxhciBjaGVjawo+ID4gb24gdGhlIHNjaGVk
dWxlIGRpc2FibGUgc2lkZSBhbmQgbWFrZSBzdXJlIHRoZSBxdWV1ZSBzdGF0ZQo+ID4gZm9yIHRo
ZSBxdWV1ZSBiZWluZyBkaXNhYmxlZCBpcyByZXNldCBwcm9wZXJseSBpbiB0aGF0IGNhc2UuCj4g
PiAKPiA+IHYyOiBPbmx5IGNhbGwgdGhlIGRlcmVnaXN0cmF0aW9uIHNlcXVlbmNlIHNpbmNlIGlu
IHRoaXMKPiA+IMKgwqDCoCBjYXNlIHRoZSBzY2hlZHVsaW5nIGhhbmRsZXIgc2hvdWxkIGJlIHJl
c2V0IGR1cmluZwo+ID4gwqDCoMKgIHRoZSBHVCByZXNldC4KPiA+IMKgwqDCoCBCeSBkb2luZyB0
aGF0LCB3ZSBkb24ndCBuZWVkIGEgd2F5IHRvIHRyYWNrIHRoZSBzY2hlZHVsaW5nCj4gPiDCoMKg
wqAgZGlzYWJsZSByZXF1ZXN0IGhhbmRsZXIgZm9yIHRoYXQgcXVldWUsIG1ha2luZyB0aGlzIHNl
cXVlbmNlCj4gPiDCoMKgwqAgc2ltcGxlci4gQXMgYSByZXN1bHQsIGRvbid0IG1hcmsgdGhlIHF1
ZXVlIGFzIGJhbm5lZC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0
dWFydC5zdW1tZXJzQGludGVsLmNvbT4KPiA+IC0tLQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3VjX3N1Ym1pdC5jIHwgMTMgKysrKysrKysrKysrKwo+ID4gwqAxIGZpbGUgY2hhbmdlZCwg
MTMgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2d1Y19zdWJtaXQuYwo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5j
Cj4gPiBpbmRleCBjOTIzZjEzYTEzZWYuLmNhMzdjN2E4YzVlZCAxMDA2NDQKPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndWNfc3VibWl0LmMKPiA+IEBAIC05MjQsNiArOTI0LDggQEAgaW50IHhlX2d1Y19y
ZWFkX3N0b3BwZWQoc3RydWN0IHhlX2d1YyAqZ3VjKQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBHVUNfQ09OVEVYVF8jI2VuYWJsZV9kaXNhYmxlLMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gPiDCoMKgwqDCoMKgXAo+ID4gwqDCoMKgwqDC
oMKgwqDCoH0KPiA+IMKgCj4gPiArc3RhdGljIHZvaWQgaGFuZGxlX2RlcmVnaXN0ZXJfZG9uZShz
dHJ1Y3QgeGVfZ3VjICpndWMsIHN0cnVjdAo+ID4geGVfZXhlY19xdWV1ZSAqcSk7Cj4gPiArCj4g
PiDCoHN0YXRpYyB2b2lkIGRpc2FibGVfc2NoZWR1bGluZ19kZXJlZ2lzdGVyKHN0cnVjdCB4ZV9n
dWMgKmd1YywKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHhlX2V4ZWNfcXVl
dWUgKnEpCj4gPiDCoHsKPiA+IEBAIC05NjEsNiArOTYzLDE3IEBAIHN0YXRpYyB2b2lkCj4gPiBk
aXNhYmxlX3NjaGVkdWxpbmdfZGVyZWdpc3RlcihzdHJ1Y3QgeGVfZ3VjICpndWMsCj4gPiDCoMKg
wqDCoMKgwqDCoMKgeGVfZ3VjX2N0X3NlbmQoJmd1Yy0+Y3QsIGFjdGlvbiwgQVJSQVlfU0laRShh
Y3Rpb24pLAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
RzJIX0xFTl9EV19TQ0hFRF9DT05URVhUX01PREVfU0VUICsKPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEcySF9MRU5fRFdfREVSRUdJU1RFUl9DT05URVhU
LCAyKTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoHJldCA9IHdhaXRfZXZlbnRfdGltZW91dChn
dWMtPmN0LndxLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICFleGVjX3F1ZXVlX3BlbmRpbmdfZGlzYWJsZShxKSB8fAo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHhlX2d1Y19yZWFkX3N0b3BwZWQoZ3VjKSwKPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBIWiAqIDUpOwo+
ID4gK8KgwqDCoMKgwqDCoMKgaWYgKCFyZXQgfHwgeGVfZ3VjX3JlYWRfc3RvcHBlZChndWMpKSB7
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfZ3Rfd2FybihndWNfdG9fZ3Qo
Z3VjKSwgIlNjaGVkdWxlIGRpc2FibGUgZmFpbGVkCj4gPiB0byByZXNwb25kIik7Cj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaGFuZGxlX2RlcmVnaXN0ZXJfZG9uZShndWMsIHEp
Owo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2d0X3Jlc2V0X2FzeW5jKHEt
Pmd0KTsKPiA+ICvCoMKgwqDCoMKgwqDCoH0KPiA+ICsKPiAKPiBJIHRob3VnaHQgSSBhbHJlYWR5
IHN0YXRlZCB0aGlzIGluIGVhcmlsZXIgcmV2aWV3cyAtIHRoaXMgcGF0aCBpcwo+IGRlc2lnbmVk
IHRvIGJlIGZ1bGx5IGFzeW5jIChpLmUuLCBubyBibG9ja2luZyBoZXJlKS4gSWYgSDJHIGdldCBs
b3N0Cj4gZm9yCj4gd2hhdGV2ZXIgcmVhc29uIHRoZSBkcml2ZXIgc2hvdWxkIGJlIHNtYXJ0IGVu
b3VnaCB0byBjbGVhbnVwIHRoZQo+IG1lbW9yeQo+IHJlZmVyZW5jZXMgYXNzaWNvaWF0ZWQgZm9y
IHRoZSBsb3N0IEgyRy4KCk5vIHlvdSdyZSByaWdodCBhbmQgSSByZW1lbWJlcmVkIHlvdXIgaW5p
dGlhbCBjb21tZW50IGhlcmUuIEkgd2FzCnRoaW5raW5nIHNpbmNlIHdlIGFscmVhZHkgaGF2ZSBh
IHdhaXQgZWFybGllciBpbiB0aGlzIGZ1bmN0aW9uIGFuZCB3ZQpoYXZlIHNpbWlsYXIgd2FpdHMg
Zm9yIG1vc3Qgb2YgdGhlIG90aGVyIEd1QyBjb21tdW5pY2F0aW9ucyBpbiB0aGUKcmVnaXN0cmF0
aW9uL3N1Ym1pdCBjb2RlIHRoYXQgaGF2aW5nIHRoYXQgaGVyZSBmb2xsb3dzIHRoZSBzYW1lCnRo
b3VnaHQuIEkgZ2V0IHlvdXIgcG9pbnQgdGhvdWdoLiBJJ2xsIGhhdmUgYSBtb3JlIGFzeW5jIGZv
Y3VzZWQKc29sdXRpb24gaW4gdGhlIG5leHQgcmV2LgoKVGhhbmtzIGZvciB0aGUgZmVlZGJhY2sh
CgotU3R1YXJ0Cgo+IAo+IE1hdHQKPiAKPiA+IMKgfQo+ID4gwqAKPiA+IMKgc3RhdGljIHZvaWQg
eGVfZ3VjX2V4ZWNfcXVldWVfdHJpZ2dlcl9jbGVhbnVwKHN0cnVjdCB4ZV9leGVjX3F1ZXVlCj4g
PiAqcSkKPiA+IC0tIAo+ID4gMi4zNC4xCj4gPiAKCg==
