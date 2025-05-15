Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8B5C2D0CD
	for <intel-xe@archiver.kernel.org>; Thu, 15 May 2025 18:38:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D08F10E949;
	Thu, 15 May 2025 18:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ncTfjC2t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FCB10E949
 for <intel-xe@lists.freedesktop.org>; Thu, 15 May 2025 18:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747334286; x=1778870286;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Q7JxVwxdArqF/Q9YVCKsafUq2Hnh4wU7gAQAvQ9eWCk=;
 b=ncTfjC2tsw40TuCfSPFY+BXRXpo+FMSYyNbwmt88jKWyvlV5/Rhq+G6I
 wquzVgANiTZ8kGMsej5xC4lbOryaHaVIsp2hruoHwdAe9/5+HhF07BtIJ
 QAK5hsQ6FfbhFzj6cT6FYijBfLvVu1XFh0QUXA1Ys9oQV+lSgWgvU/iRm
 KL8WgxYFQh1qJxy2c06AXJV9fNMdwbFj5YZG73whFv0AlnAKcjVuPEC0q
 dQXIFSYZgeRTb5FxWoLgmeLaY1uPmHdeNOln7oIo5ljj9/yR5umN17jTk
 PHYzCAY1AIBaIkIlTWY+Xgdivm83q0AzS4018PyXI5vV3msbRkRm+9xS2 Q==;
X-CSE-ConnectionGUID: +m6JauMaRKWbNroMRnOIsg==
X-CSE-MsgGUID: Taov1kqIQXmpOG3vt6nwFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49276014"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="49276014"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 11:38:06 -0700
X-CSE-ConnectionGUID: D4UeJEFtT0SXiZYiekieyQ==
X-CSE-MsgGUID: PCq/TZ0HTZui7BDWcPd5iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="143683227"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 11:38:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 15 May 2025 11:38:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 15 May 2025 11:38:04 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 15 May 2025 11:38:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TExOMTg/QEe56nqhR1x+mjX91sH1awtFpqt0MUDgeYeYbKZKIMKmdjQDHY0UrrQAfnOe/xiTRUcmY/DeUiGM02v3BlXIQqNcsjyok9wJ79p0b4eq7K43VewRPsviQ+VjgEzOF66e3HGPi27fvM6SC07s9LNCi/l1toONTjnU0TKkP5u79e2bLPqB9kz96+RVhzh9CKTup9jcoBbH/L2v/KF2u3at+IhEZ7KgoDN3vKBORgHELK/a+xIOAgy42NoRVJvlOF3O5s1y6dpiC+A2XN+S9AaFESO5i8QYbuaVEOY4m2tXc1z4bZvaOBAceRyqOrvRyh6qMk2mlYFNSQ1TUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q7JxVwxdArqF/Q9YVCKsafUq2Hnh4wU7gAQAvQ9eWCk=;
 b=SwWBrY9yGSu/H6UFKuIdqsIkvyTjCBreenGzNAsGP30VFDOtiQ60Uwi1G165lVCRmPgdMwsgKAGtRnzToiqu+GxbaAQoI7Vm04sqPIT/XB9gGI7QfBXXVMAwEQN5EuH0oEP5XZa79fiCE37DQWC+zgh6qsi9GOsfvIJoKL2qqI+AHLMbPz7rsNgAbgGjCNjx8jlth0aJTUypg8etLTepBIoPE1VkNdXhKPufyq75eOy+Q1WauSgKlApeEvmbEpmRGko6YSWhnPLuonlFboLkK2Ifbc54LE5p18jqpocG+p7Rzr2nYamE7wI8DAkpe9nPrmItmDzMF3CT136tHWaH0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH0PR11MB7562.namprd11.prod.outlook.com (2603:10b6:510:287::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Thu, 15 May
 2025 18:37:34 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%4]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 18:37:34 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Bhatia, Aradhya" <aradhya.bhatia@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Make creation of SLPC debugfs files
 conditional
Thread-Topic: [PATCH] drm/xe/guc: Make creation of SLPC debugfs files
 conditional
Thread-Index: AQHbxX6yLfAYAJq6GE+loa2nYn1bdbPTrCCAgABIpgCAABESAA==
Date: Thu, 15 May 2025 18:37:33 +0000
Message-ID: <e7ea4de877f65babac4b89f2206cb18eac3ec648.camel@intel.com>
References: <20250515094913.2437-1-aradhya.bhatia@intel.com>
 <SJ1PR11MB6204CD374CDB31981218C7308190A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <53969660-e48b-4467-9d3c-053fa7ceca9c@intel.com>
In-Reply-To: <53969660-e48b-4467-9d3c-053fa7ceca9c@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH0PR11MB7562:EE_
x-ms-office365-filtering-correlation-id: 466b7fef-a3d5-4dcb-7600-08dd93df8ed9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YXRPbVZFSmhrTnNPRkk1NWt0blFtTXpBUHhIaDZic3FqVW9VeE0yT0xJUTh6?=
 =?utf-8?B?alp0WEZQbjlnWmxZTGFXbi9WUzdaaU14Y29ZN0IzVVp5RTBlVjRaWkJYQ3NM?=
 =?utf-8?B?U2VCTEZTeVFPaVI5QTgxM05HSlcra09LQnpuRTdiT09rZi94WEoyS2YrRW5B?=
 =?utf-8?B?Qjg3a0luZDkxbW8xYjVaNkRxcGFBNVQwb3lVVE9UNWdiaGxiRmJWMlZ6U2Rr?=
 =?utf-8?B?Q1Q1dTFrbjQxcDJycVlOYjBCSWQzU1pmNmYrVzhJNFVXOHkzRm8wNDNtTkJm?=
 =?utf-8?B?WlRpZnB1bitWNElSZ0dwUnVRYWNYOVFuK3pRRFVCUzZIdjNid1N2ZUJKK1RJ?=
 =?utf-8?B?cGZrRUpIeFo3dU5UQ0VqY1ZxMXFPQmk0dnU5RU5UU2t2QkprS0hKQnUxK050?=
 =?utf-8?B?akcrNFBVV1ZreU5kS204YWxNc0ZCRndRMktzYk1zZkd5dFkyZUYzTHdtbWl0?=
 =?utf-8?B?dmNSK3BINFJHUnZ6OGl0T1E2aWc5QUxybXA0S1RxdlJUY0haVnIvV2RWUlFh?=
 =?utf-8?B?NXl1Ujk1TkR2NHBMelF4R1BIWXluUWVvejRwNndNRWJ1R0JSU1k0K05oNHc3?=
 =?utf-8?B?TkFRcUM0NkIvdE5FUjk4aHpXRUNGUFd1TFJHdDcrdGRhR1JlMUFNTFpVL1pz?=
 =?utf-8?B?TXdxa0ZxbWxPQXZIUkNqMlN6OUp1TWFRUTVVWVBTVnJpNkhLbWhFYVVKeWRU?=
 =?utf-8?B?SGxsbHIzMGlrME1nME1QUGtxRk5MbkhzQUlxcGdQeDFsTEJhOEM2ZW85dlNy?=
 =?utf-8?B?Y2llNkszeFFtS3IzMWxzMVVURk4wYXZnZmxOVlMvWnB6V1FMWU1HWnlVL3VE?=
 =?utf-8?B?Y0piUmVRNjRsbnFPSTdENkVCb0dWZW5nbVRPbytsMWw4anRCL0phL3kvMTFs?=
 =?utf-8?B?UHl5ME1WR2JldkFuMUIvVW9XeUp1ZmQ2N296UmNza1p4ZEs3RXh4WDFhdHVQ?=
 =?utf-8?B?dFFFMWxnekRvbEJ5d3ZzMDdDeE5td0RBUC9UVUY4Yy9GU2RVTzBUM3BLZnQr?=
 =?utf-8?B?b3FyZFh0cnF5V0JOemM4V0RiTmtHbm16SWMzVkFiM2xWMWpaeENNWkFMekl2?=
 =?utf-8?B?MlBYOXdaMTdLdXNHYUFBUUFJUUY2anBPSUZHWkRaY3J0bGUwb2V3Qng1dzRo?=
 =?utf-8?B?Znd6UnVJZEwxZHBUbURRaVpQa3RpWUN6WWRWOVNrcjIxcFZuVmR6ejFkTmtJ?=
 =?utf-8?B?K2IwREM4dGJNVjdDKzVZQ0ZWems1cGFadWw0OTZkVzcvdFNUWnhWcjJUemk1?=
 =?utf-8?B?ZHFxZk9TcHI5ZnZub245bFVDYWZ0M09FeFlOOVhOemNEMGdja3p5RjV4U1JI?=
 =?utf-8?B?c00vTkJMVU9HL2ZXSE5EL25ZQ1VQTW5EZWNkT3BWdnYzaE5OQUFJaG1JM1Jt?=
 =?utf-8?B?NjhCeDF4ZFQ4Y2hNbk5uT1V4T0FsdzRaVTZESG5WbmhlTzk3UWg5RGlUeFhy?=
 =?utf-8?B?MWJYM3Q2cCtYb0trY01xUU94eWs1dEErWUlESnYxQ3RzWVZ3OVI5VzBPVm9v?=
 =?utf-8?B?L2kyQmZoWVB0VmxuaHNSOGxaZHFpbGd4c2VZZk5RZ3JhQU5KMkliZnVCNlJ4?=
 =?utf-8?B?RUUzQnhTVHZxQUdjNHRYcTBoSGkwMnlBSnlSYUs0UzQ0Um1NcVhXYmRxZndo?=
 =?utf-8?B?VHBscFFGT2tjSHFKNWRTS211dHFlTHBJRDVaRTRrOVVROTVkTGJlZmdiYzky?=
 =?utf-8?B?Rnljazh0TEhHTFVOT0R6eEVWbUNkREZ2Z2Z5RElSMzlNU2dWc0FIbCtac2Rp?=
 =?utf-8?B?dTRLTUg4YklGdFE1UmkvamxoOUtYL2lNc2NHQ2Y0THFKS2Vwb2RiRkliS2lH?=
 =?utf-8?B?bFlXZTRnMjVha3VoN2E4TXpWMk9jYit5Y1hKOU1IRzl1R243YlJmUnQvM3dZ?=
 =?utf-8?B?MXQ5TituVXNFa2wvUllZM0FPVmdxTksrV2JuZDZEaVlvTkVhVGdiOVRENWZE?=
 =?utf-8?B?T3lmN1hGYUtYYnVXaGVJZVNRcFZlMSt2dGNNdWVxeTlkeUpJREdVS05HZlkr?=
 =?utf-8?Q?FRcQ3y53aNnGONPA0spYRSDQkqY3QU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TkxPNVVJZ0huNEU0MWtUMGQ4aDdQRWd5ZmJ4Mi9TVEFpZENvZG1HYWpGbGdr?=
 =?utf-8?B?dVpneEVhZ0hPc0syY3VZbm5aS2tOWnZsSURYK3VneE1HVWgwQk4rTGE2Z1NS?=
 =?utf-8?B?SG5EZWRDU2Erb0JjcmV1L2VDb091UlRNSGQ4ZXVOUXhaRTh4RDEybVg2UG1W?=
 =?utf-8?B?dnJQRXJUTlFrYUNBeW1PWjA3KzRmMnFpT1JvOXRBcGVsWmRaVElDbUd3cVpm?=
 =?utf-8?B?V09lc29KWnFMUnYvR0JFbXlKVTAxbjd3dlVSSTNadU42N2orenp6RWpWTUJy?=
 =?utf-8?B?Nm1PYnFpWEozck1UWXM4NzJCWFJKSE1HdEpReFRIbU9wUXZ4MlRhT1UvN0Nz?=
 =?utf-8?B?S0NWeU1PR1YwVXVYOTR2QW93QURJeGJkU2lBZTdOT2g2aDhaMlF1MXBXdXBH?=
 =?utf-8?B?eUxWKzE3NDBnNmVoZ2cva0pPZnIzN3kwaU9pQjNScUZlcDY1UzdsbTRyQlow?=
 =?utf-8?B?QUFCUGExZno2M09KR1dnU1d1K3BTRTBqNExWYjJvNzVOekY5Qk9kREtKMTJG?=
 =?utf-8?B?dGpvcVdOZk9CVXJSSGNoSW0rV3cxRk8rM1QxQk5pKzROdk9oYUxHQmtMdTVw?=
 =?utf-8?B?SGtGaDMrL3VsREptMzBHRng5VHJtOUU3NldyeS9JbWJtVEFhNmVYditNbnVv?=
 =?utf-8?B?MGxCbVlXNzVwWDI1NnhFeHROTHFsV0t4SnFTQnRCV3dLNUo0ZmpiZlpwbjRz?=
 =?utf-8?B?Y3hMVW50aGtzNmdJbFBOVGVxRjRCeHBaNDZEeUFoWWRHRGh5aWVJb2UwcUhx?=
 =?utf-8?B?Q0JkYmQwYkcxeXQxSTRZajlPMGdncFFSNDRvK2lEelRPc1BFQlpzbWpDL1lu?=
 =?utf-8?B?T3dXYzgzemFES3FUejNSS05jVTdlRmtMZXRRSVl2RDZicGloSGlqbUNjN20r?=
 =?utf-8?B?cHNVMjc3ZjBPODYvYU5jRmZaVkFOSG5FVXVtY212b3FEOGdZcTNKNkhSbUdp?=
 =?utf-8?B?TWlzL2RZVjM4VHNueUxCQXJkRWhVTDM2UnRyeC9KRzJCWmFKZURXcmpkV1Vy?=
 =?utf-8?B?Y2VqNzl0b2Zpc0c5V2NNcUM2TnM1SEVKYW1DRjNwTlNyTm52ZXBPSDgrOGhj?=
 =?utf-8?B?TWwzRkxpcVd6QmdaTXkzMWhTbzFpZ2FWZWw0SzlVNHFQQ0phYkhnMEhSRXhI?=
 =?utf-8?B?Z1BINnZKTXpUQW1GUTgvWW1WYlB5VU1kZW52ODZVbDdkd3B2amRDclBhUHM5?=
 =?utf-8?B?OFBuUEltd2lWM3ZxT2hGTm5uOGZlakE3M3VUMlpKM25wVmhmWnNaS25KYUtT?=
 =?utf-8?B?SWdWZnJaNi9YV3JvdHllajNqZDI0UzBUOXZJZWJhMjIvcUVPaE1PSGdBS3hF?=
 =?utf-8?B?SnFhR0JVVCtnczBQWVp2MElicHRuZHM1djBRUFBLbDhMSUNPZzIwZGR2SlpS?=
 =?utf-8?B?MExFQ0YwbEZWMVhDTlN4NUVMNEszaFY1UXFrbUlwOS9nNUM2b3lkeGtERVI5?=
 =?utf-8?B?QUtVSytHOXh4QTBaUDNkYWJPY3g5QWRkbVBxNGZtZDZYNGUwSTFkLzVlcU93?=
 =?utf-8?B?L0phNjZia3lsRExHR2FtbVYrMFdVbUV0WHYzOGlGRWQwMHFUWGxBcndWZ1ZK?=
 =?utf-8?B?RXFtMXZBdGhyZmlyWE9BRkRWZTZCbW8xSUI1S3cwbmNFNlFJRGRMR0lPUi96?=
 =?utf-8?B?QVZaZytzSnYwNk5BQU9rQXhweVdueDl6aU50MjltaXFHVURSdnpTVnV3dmhH?=
 =?utf-8?B?RGpxdjJvN3lJTSsyTGJ2bitYYjZoWDcwdWF3QXhEWXhrOEhXL1lSMjJpVFdv?=
 =?utf-8?B?OU5Sc0oxaUtaRlo2U203dFE4SUJZejhNdTVKd1IyaHBGSzFRQW9Ra1dOMGlX?=
 =?utf-8?B?UWk4cHdDbExIS1JNMUJFRVZod3hRc0krcnEzZE0rdFc3TElqbGhEckdNLzRX?=
 =?utf-8?B?ZVh5UjV2SER3WFZrSWRWSHQyaU10Qm5PVmtMYmZIRXVwci9BMVNSVWhtQ2wx?=
 =?utf-8?B?OVo3Y3doTVNpYm9RRENZS1NDR3BYcHpTVlo0TlowemJJNUxqcEJJU3NDUCtV?=
 =?utf-8?B?VUw5TWlrYTJqUU1zcWZNejdFWXBqaU5FMm1yZmdwZXlwVnpybGZhU01CZGd1?=
 =?utf-8?B?R3lQVzBVdHV2a2ExS25wMGhiZXhDU3Q3MDJvRUpBNmo1WEVJeDZWditROVA0?=
 =?utf-8?B?Q3poMk43VUpTaFNiZmtseE1DZzdOWEsvM1lWamx2OXQxTWtDY0NwU0RPZTJN?=
 =?utf-8?B?SXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EA900071A136AA40AE2243AC3E28A8E5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 466b7fef-a3d5-4dcb-7600-08dd93df8ed9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2025 18:37:33.9611 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZJ0Y3mSwvnPARySfzTMAVwnsqsM8/CSAA6bXBsFgM8YD9onGd+I7EObc6SltT1eqsERrO2JxWkZ5Yy3axc9JMOEKs63YM0qgX36epJ/Csa8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7562
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

T24gVGh1LCAyMDI1LTA1LTE1IGF0IDIzOjA2ICswNTMwLCBBcmFkaHlhIEJoYXRpYSB3cm90ZToN
Cj4gSGkgVGVqYXMsDQo+IA0KPiBUaGFuayB5b3UgZm9yIHJldmlld2luZyB0aGUgcGF0Y2guDQo+
IA0KPiBPbiAxNS0wNS0yMDI1IDE4OjQ2LCBVcGFkaHlheSwgVGVqYXMgd3JvdGU6DQo+ID4gDQo+
ID4gDQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogQmhhdGlh
LCBBcmFkaHlhIDxhcmFkaHlhLmJoYXRpYUBpbnRlbC5jb20+DQo+ID4gPiBTZW50OiAxNSBNYXkg
MjAyNSAxNToxOQ0KPiA+ID4gVG86IFJvcGVyLCBNYXR0aGV3IEQgPG1hdHRoZXcuZC5yb3BlckBp
bnRlbC5jb20+DQo+ID4gPiBDYzogSW50ZWwgWEUgTGlzdCA8aW50ZWwteGVAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnPjsgVXBhZGh5YXksDQo+ID4gPiBUZWphcw0KPiA+ID4gPHRlamFzLnVwYWRoeWF5
QGludGVsLmNvbT47IEdoaW1pcmF5LCBIaW1hbCBQcmFzYWQNCj4gPiA+IDxoaW1hbC5wcmFzYWQu
Z2hpbWlyYXlAaW50ZWwuY29tPjsgQmhhdGlhLCBBcmFkaHlhDQo+ID4gPiA8YXJhZGh5YS5iaGF0
aWFAaW50ZWwuY29tPg0KPiA+ID4gU3ViamVjdDogW1BBVENIXSBkcm0veGUvZ3VjOiBNYWtlIGNy
ZWF0aW9uIG9mIFNMUEMgZGVidWdmcyBmaWxlcw0KPiA+ID4gY29uZGl0aW9uYWwNCj4gPiA+IA0K
PiA+ID4gUGxhdGZvcm1zIHRoYXQgZG8gbm90IHN1cHBvcnQgU0xQQyBhcmUgZXhlbXB0ZWQgZnJv
bSB0aGUgR3VDIFBDDQo+ID4gPiBzdXBwb3J0Lg0KPiA+ID4gVGhlIEd1QyBQQyBkb2VzIG5vdCBn
ZXQgaW5pdGlhbGl6ZWQsIGFuZCBuZWl0aGVyIGRvIGl0cyBCT3MgZ2V0DQo+ID4gPiBjcmVhdGVk
Lg0KPiA+ID4gDQo+ID4gPiBUaGlzIGNhdXNlcyBhIHByb2JsZW0gYmVjYXVzZSB0aGUgR3VDIFBD
IGRlYnVnZnMgZmlsZSBpcyBzdGlsbA0KPiA+ID4gYmVpbmcgY3JlYXRlZC4NCj4gPiA+IFdoZW5l
dmVyIHRoZSBmaWxlIGlzIGF0dGVtcHRlZCB0byByZWFkLCBpdCBjYXVzZXMgYSBOVUxMIHBvaW50
ZXINCj4gPiA+IGRlcmVmZXJlbmNlDQo+ID4gPiBvbiB0aGUgc3VwcG9zZWQgQk8gb2YgdGhlIEd1
QyBQQy4NCj4gPiA+IA0KPiA+ID4gU28sIG1ha2UgdGhlIGNyZWF0aW9uIG9mIFNMUEMgZGVidWdm
cyBmaWxlcyBjb25kaXRpb25hbCB0byB3aGVuDQo+ID4gPiBTTFBDIGZlYXR1cmVzDQo+ID4gPiBh
cmUgc3VwcG9ydGVkLg0KPiA+ID4gDQo+ID4gPiBTdWdnZXN0ZWQtYnk6IE1hdHQgUm9wZXIgPG1h
dHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBcmFkaHlhIEJo
YXRpYSA8YXJhZGh5YS5iaGF0aWFAaW50ZWwuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiDCoGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndWNfZGVidWdmcy5jIHwgMTcgKysrKysrKysrKysrKystLS0NCj4g
PiA+IMKgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+
ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2RlYnVn
ZnMuYw0KPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2RlYnVnZnMuYw0KPiA+ID4g
aW5kZXggZjMzMDEzZjhhMGYzLi4wYjEwMmFiNDZjNGQgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2RlYnVnZnMuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2d1Y19kZWJ1Z2ZzLmMNCj4gPiA+IEBAIC0xMTMsMjMgKzExMywzNCBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IGRybV9pbmZvX2xpc3QNCj4gPiA+IHZmX3NhZmVfZGVidWdmc19saXN0
W10gPSB7DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgeyAiZ3VjX2N0YiIsIC5zaG93ID0gZ3VjX2Rl
YnVnZnNfc2hvdywgLmRhdGEgPSBndWNfY3RiDQo+ID4gPiB9LMKgIH07DQo+ID4gPiANCj4gPiA+
ICsvKiBGb3IgR3VDIGRlYnVnZnMgZmlsZXMgdGhhdCByZXF1aXJlIHRoZSBTTFBDIHN1cHBvcnQg
Ki8gc3RhdGljDQo+ID4gPiBjb25zdA0KPiA+ID4gK3N0cnVjdCBkcm1faW5mb19saXN0IHNscGNf
ZGVidWdmc19saXN0W10gPSB7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqB7ICJndWNfcGMiLCAuc2hv
dyA9IGd1Y19kZWJ1Z2ZzX3Nob3csIC5kYXRhID0gZ3VjX3BjIH0sDQo+ID4gPiB9Ow0KPiA+ID4g
Kw0KPiA+ID4gwqAvKiBldmVyeXRoaW5nIGVsc2Ugc2hvdWxkIGJlIGFkZGVkIGhlcmUgKi/CoCBz
dGF0aWMgY29uc3Qgc3RydWN0DQo+ID4gPiBkcm1faW5mb19saXN0DQo+ID4gPiBwZl9vbmx5X2Rl
YnVnZnNfbGlzdFtdID0gew0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHsgImd1Y19sb2ciLCAuc2hv
dyA9IGd1Y19kZWJ1Z2ZzX3Nob3csIC5kYXRhID0gZ3VjX2xvZyB9LA0KPiA+ID4gwqDCoMKgwqDC
oMKgwqDCoHsgImd1Y19sb2dfZG1lc2ciLCAuc2hvdyA9IGd1Y19kZWJ1Z2ZzX3Nob3csIC5kYXRh
ID0NCj4gPiA+IGd1Y19sb2dfZG1lc2cgfSwNCj4gPiA+IC3CoMKgwqDCoMKgwqDCoHsgImd1Y19w
YyIsIC5zaG93ID0gZ3VjX2RlYnVnZnNfc2hvdywgLmRhdGEgPSBndWNfcGMgfSwNCj4gPiANCj4g
PiBZb3UgbmVlZCBmaXhlcyB0YWcgaGVyZSBpdCBzZWVtcy4gV2l0aCB0aGF0LA0KPiANCj4gQWJv
dXQgdGhpcywgdGhlcmUgaXMgYSBzbGlnaHQgY29tcGxpY2F0aW9uLg0KPiANCj4gVGhlIG9yaWdp
bmFsIHBhdGNoIHRoYXQgaW50cm9kdWNlZCB0aGlzIGlzc3VlIGlzIHRoaXMgY29tbWl0LA0KPiAN
Cj4gYWFhYjU0MDRiMTZmICgiZHJtL3hlOiBJbnRyb2R1Y2UgR3VDIFBDIGRlYnVnZnMiKSBbMF0N
Cj4gDQo+IFRoaXMgaXMgdGhlIHBhdGNoIHRoYXQgaW50cm9kdWNlZCBHdUMgUEMgZGVidWdmcyBm
aWxlIGJ1dCBkaWRuJ3QNCj4gYWNjb3VudA0KPiBmb3IgdGhlIGNhc2Ugd2hlbiAic2tpcF9ndWNf
cGMiIGlzIHNldC4NCj4gDQo+IA0KPiBCdXQsIHRoZSBndWMgZGVidWdmcyBoYXMgaGFkIG90aGVy
IGNvbW1pdHMgX2FmdGVyXyB0aGUgYWJvdmUgcGF0Y2gsDQo+IHdoaWNoIHJlZmFjdG9yIGluIHZh
cmlvdXMgd2F5cyBob3cgZ3VjIGRlYnVnZnMgaXMgYmVpbmcgaGFuZGxlZCBpbiBYZQ0KPiBkcml2
ZXIuDQo+IA0KPiANCj4gZTE1ODI2YmIzYzJjICgiZHJtL3hlL2d1YzogUmVmYWN0b3IgR3VDIGRl
YnVnZnMgaW5pdGlhbGl6YXRpb24iKSBbMV0NCj4gMzg3NDQ0OTg0ZDdiICgiZHJtL3hlL2d1Yzog
RG9uJ3QgZXhwb3NlIEd1QyBwcml2aWxlZ2VkIGRlYnVnZnMgZmlsZXMNCj4gaWYNCj4gVkYiKSBb
Ml0NCj4gDQo+IFNpbmNlIG15IHBhdGNoIGlzIGJhc2VkIGFmdGVyIHBhdGNoZXMgWzFdLCBhbmQg
WzJdICh3aGljaCBhcmUgbm90DQo+ICJmaXhlcyIsIGFuZCBoZW5jZSB3ZXJlIG5vdCBiYWNrcG9y
dGVkIHRvIGFueSBwcmV2aW91cyBrZXJuZWwNCj4gdmVyc2lvbiksDQo+IG15IHBhdGNoIHdpbGwg
bm90IGJlICJiYWNrcG9ydC1hYmxlIiB0byB0aGUgb3JpZ2luYWwgcGF0Y2ggdGhhdCBuZWVkcw0K
PiB0aGUgZml4IFswXS4NCj4gDQo+IA0KPiBTbywgd2hhdCBzaG91bGQgYmUgZG9uZSBpbiB0aGlz
IHNpdHVhdGlvbj8NCg0KSSdkIGp1c3QgYWRkIHRoZSBmaXhlcyB0byB0aGUgb3JpZ2luYWwgcGF0
Y2guIFRoZSByZWZhY3RvcnMgd2lsbCBoYXZlDQp0byB0YWtlIHRoYXQgaW50byBjb25zaWRlcmF0
aW9uIGlmIHRoZXNlIGdldCBtZXJnZWQgZG93biB0aGUgcm9hZC4NCg0KUmV2aWV3ZWQtYnk6IFN0
dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+DQoNClRoYW5rcywNClN0dWFy
dA0KDQo+IA0KPiANCj4gUmVnYXJkcw0KPiBBcmFkaHlhDQo+IA0KPiANCj4gWzBdOg0KPiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTAxMTQyMzI0NDMuMTEzNTM1NS0xLXJvZHJpZ28u
dml2aUBpbnRlbC5jb20vDQo+IA0KPiBbMV06DQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC8yMDI1MDQwMzE0MjYzNS4xODIxLTItbWljaGFsLndhamRlY3prb0BpbnRlbC5jb20vDQo+IA0K
PiBbMl06DQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MDQwMzE0MjYzNS4xODIx
LTMtbWljaGFsLndhamRlY3prb0BpbnRlbC5jb20vDQo+IA0KPiANCj4gDQo+ID4gUmV2aWV3ZWQt
Ynk6IFRlamFzIFVwYWRoeWF5IDx0ZWphcy51cGFkaHlheUBpbnRlbC5jb20+DQo+ID4gDQo+ID4g
VGVqYXMNCj4gPiA+IMKgfTsNCj4gPiA+IA0KPiA+ID4gwqB2b2lkIHhlX2d1Y19kZWJ1Z2ZzX3Jl
Z2lzdGVyKHN0cnVjdCB4ZV9ndWMgKmd1Yywgc3RydWN0IGRlbnRyeQ0KPiA+ID4gKnBhcmVudCnC
oCB7DQo+ID4gPiAtwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZHJtX21pbm9yICptaW5vciA9IGd1Y190
b194ZShndWMpLT5kcm0ucHJpbWFyeTsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9k
ZXZpY2UgKnhlID3CoCBndWNfdG9feGUoZ3VjKTsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVj
dCBkcm1fbWlub3IgKm1pbm9yID0geGUtPmRybS5wcmltYXJ5Ow0KPiA+ID4gDQo+ID4gPiDCoMKg
wqDCoMKgwqDCoMKgZHJtX2RlYnVnZnNfY3JlYXRlX2ZpbGVzKHZmX3NhZmVfZGVidWdmc19saXN0
LA0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoA0KPiA+ID4gQVJSQVlfU0laRSh2Zl9zYWZlX2RlYnVnZnNfbGlzdCks
DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHBhcmVudCwgbWlub3IpOw0KPiA+ID4gDQo+ID4gPiAtwqDCoMKgwqDC
oMKgwqBpZiAoIUlTX1NSSU9WX1ZGKGd1Y190b194ZShndWMpKSkNCj4gPiA+ICvCoMKgwqDCoMKg
wqDCoGlmICghSVNfU1JJT1ZfVkYoeGUpKSB7DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGRybV9kZWJ1Z2ZzX2NyZWF0ZV9maWxlcyhwZl9vbmx5X2RlYnVnZnNfbGlzdCwN
Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgDQo+ID4gPiBBUlJBWV9TSVpFKHBmX29ubHlf
ZGVidWdmc19saXN0KSwNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBhcmVudCwgbWlu
b3IpOw0KPiA+ID4gKw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICgh
eGUtPmluZm8uc2tpcF9ndWNfcGMpDQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGRybV9kZWJ1Z2ZzX2NyZWF0ZV9maWxlcyhzbHBjX2RlYnVnZnNf
bGlzDQo+ID4gPiB0LA0KPiA+ID4gKw0KPiA+ID4gQVJSQVlfU0laRShzbHBjX2RlYnVnZnNfbGlz
dCksDQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwYXJlbnQs
IG1pbm9yKTsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoH0NCj4gPiA+IMKgfQ0KPiA+ID4gDQo+ID4g
PiBiYXNlLWNvbW1pdDogM2Q2NjcwZmFiNjRjYjAwYjVlNmVkODBkMjUxNzE0N2RiNTMzZmFmMQ0K
PiA+ID4gLS0NCj4gPiA+IDIuNDMuMA0KPiA+IA0KPiANCg0K
