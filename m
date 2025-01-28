Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE27C0218A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 22:52:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7CEB10E11F;
	Tue, 28 Jan 2025 22:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bahRjhTW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD6F10E11F
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jan 2025 22:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738104747; x=1769640747;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=tw3PiBHnNFsfqdffzKBcO9yHtQwd/d8sNGJzAEhG0bA=;
 b=bahRjhTW9wWHpMVHJpaHfLaUPxsuyqAJSv9DR9zHxgJStGeLsIYYOfsG
 OrSOXPkqkCtjBuTZwfXM8FS1QUgLWVV0wEhTGgl+T77BwffdmrA7hczmU
 VtShpGN+sCkfFZdLpQYs8duGbMIl+rNk2HIYgWPMxQ08eBGHeJBTbZQlZ
 MHEQrCpnp00xcWaL4FZtnk4Hnft6SgcAEt3O6oMJynmIRs5yPG6FF2Q7d
 EVeqXijVRdRFXk8qTMaih+tvU6OWVM50JAx2r0GTwqdifbCa7+d8Bkyra
 sTLP7mDIs3DyJlRR55veSr2EfV/cOK/2r2M7faMo92nqw1TDqhpjlCS6X w==;
X-CSE-ConnectionGUID: zep2wwieS7GTqKv/AOUwOA==
X-CSE-MsgGUID: 8Kp2ASiERtS5eJ/0x4cqcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="61076497"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="61076497"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 14:52:26 -0800
X-CSE-ConnectionGUID: 7X4/ty7GQMq7BeerF29P/Q==
X-CSE-MsgGUID: U6GWBSWKTd6DQu99ulGHSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132146169"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jan 2025 14:52:22 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 28 Jan 2025 14:52:20 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 28 Jan 2025 14:52:20 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 28 Jan 2025 14:52:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sbukp1IQfaJgOVQOHGVxtqMf9DXeV85Mdny3O2vF0a3YU01y8y2TrGIAFC1An73zzo/kKF6dnHkwF8acxeXZQ9AKjhLcK8dPZ1OJNW1Nfb7N+cMR8obiwKaj5Rlp3U7GUCtksk/uUMLESE8oKeDVKCOIz35JYlzGEZ1qHrXWy494RJljX7+T3b3ao8Is4oS5FpqbtPOD933pilnKUUBjyVf95UQfyP1w9TQEYC7MQRiQ0YYL1dL395cV/m+8BgGVMCbHxU0v3YNgc9D9dbcpYZPvFBGxOoPu4KH0N+pskD0AqH4SQxLMSLAsTD7+d/NycoxOrFLvEQcIDD9sozI4FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tw3PiBHnNFsfqdffzKBcO9yHtQwd/d8sNGJzAEhG0bA=;
 b=KBCezgrVXDyrWJl4qlizVUwypco9bi8EjKxcKoHUX84mxzfewCe1803CNEZ+peRGaEjn9VH/hoRCEGBebkWUlR/O4Y4j5a/iQ85jRHxlZJs5xGZZDnNjROyext5uAYv65qQSIgwGdlQTNgts8KKgutD74JG37H7497TGiZP9T36pU7ddGLIQv9BOPeaNgFwrRumMXGOaki6EfO5wP5JqMQvduN1Fp8Jg4PWE7WN7FKDLLWOfAuz9EsXHN0QjyjpFDlw566lKqNob2ZOqC8uVV874R2ZZZW79Lww3J/Rle6bgCEwkZ6bpG2ykeZ8jjJltosVPoTTc+si/Yl3VgByv2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN0PR11MB5711.namprd11.prod.outlook.com (2603:10b6:408:167::22)
 by PH7PR11MB6793.namprd11.prod.outlook.com (2603:10b6:510:1b7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 22:51:50 +0000
Received: from BN0PR11MB5711.namprd11.prod.outlook.com
 ([fe80::4137:d45e:2206:50aa]) by BN0PR11MB5711.namprd11.prod.outlook.com
 ([fe80::4137:d45e:2206:50aa%3]) with mapi id 15.20.8398.014; Tue, 28 Jan 2025
 22:51:50 +0000
From: "Taylor, Clinton A" <clinton.a.taylor@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Atwood, Matthew S" <matthew.s.atwood@intel.com>
Subject: Re: [PATCH] drm/xe/ptl: Update the PTL pci id table
Thread-Topic: [PATCH] drm/xe/ptl: Update the PTL pci id table
Thread-Index: AQHbca1F1Hh7hvMfpE+I9NLvOFKnNrMsyxOA
Date: Tue, 28 Jan 2025 22:51:50 +0000
Message-ID: <a140e73d8ad03f4e5a00a679a3fd102756c87d2c.camel@intel.com>
References: <20250128175102.45797-1-matthew.s.atwood@intel.com>
In-Reply-To: <20250128175102.45797-1-matthew.s.atwood@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR11MB5711:EE_|PH7PR11MB6793:EE_
x-ms-office365-filtering-correlation-id: 6b0681b1-a5e0-46b4-546d-08dd3fee5a2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dENWVGg0TmhmV0dIcVMxc3RnODNyTDRJYmtHQ0hQM1o1Ni9SNStCL2FaQUVk?=
 =?utf-8?B?dzhXK0hRVDdrNkZiZVZBcDlVV1lJbHlZSGlUMU45Z0cvZVJMajBvTm8ycW5v?=
 =?utf-8?B?QWtqTjBWWW9FaGtrZ3FkMlZFOGl6QTNLZjhNT1hDUC96WFFkbC8zUTVLc2sr?=
 =?utf-8?B?NVk0TjFKVEZhbThEamhhMm9MM2FHRmZXVTZMVTZ3eDJRMlJhMkdsbjBHZ0o4?=
 =?utf-8?B?YmZxN0VRWjRMRVl6VkpSMXRYSVV0cWs1UEpuTU5wRGVEV2JDaXVKQ1psWld4?=
 =?utf-8?B?N0xtUWhlamRvOXpzVUdjODEyYXZDSC9ZUldSK0lBbUZHTUx6N1IwcUc0Ymow?=
 =?utf-8?B?YWFwSmJXN1E0MUhqNTFlR1FKZS9McjBONnovNncvblNTcFZiYzdqR2JLeHhL?=
 =?utf-8?B?cDVyVUEvTGp4V2NKOGk0b1RvWm56c2NUSEhZV2s2UllIVUNSNkdNZUlVSVZ1?=
 =?utf-8?B?QXRpdTZDOFBtV2dpR25YRUxRL0g3TzdzZjhjUUp0N0RpSTUwaW4rS0paVHJE?=
 =?utf-8?B?WHRrT0txSmhtQ01iWEd6RTFiNnUveVR4SW83Y3Rld01xNm03Z2FGUGJjbC9D?=
 =?utf-8?B?MjZBUGdoR3ZMZFIrRlRUbllJWkFTdFFYZWEydmt2eTlRMFdGVVpIUkt6K0ND?=
 =?utf-8?B?b0c4ejZQNmFRaFhqWGxodzZacnVQZUluazFVbTZENG5xbXBWUHAzc0tVSWR5?=
 =?utf-8?B?cWZra2tHZjBINUs1STluVWRyRlRoK0hDTDdzREwrd0NKT3BPTWxrRHRXRkVQ?=
 =?utf-8?B?RjIrSm5tUmJ0QUxKQ0lXKzRlVEE4ak5BamZrQ1AvQTRibkFMY25RM3orSjZE?=
 =?utf-8?B?NlRRYVdHWjM2ZVZ2YWNzS3ZmM3dTVUVFdlp6Wm0wcW9ZeFphakNhOUlKdWdO?=
 =?utf-8?B?dmZJNVMzVXhiMUk2b2lpOWlRc1NDNEtJZFRWbnZYQTRGMDRvQ3hVd1lIekJp?=
 =?utf-8?B?d1dsZG5QY3V3UXh3MlVFSGxTNkRQMG54ZVljbTRITDJRM1RySGdNcTQ2L1FD?=
 =?utf-8?B?QnJGa0hHN3FISEttbTRLdm42N1FrdkhzT0xsMDZxNUNaMGlMczAvdUlqWC9O?=
 =?utf-8?B?SzBoRnQvYnl2OHB6aHdHcTZmdFVzdURIMTB2OGplUHpTeTU1TzRwTnpDSzVJ?=
 =?utf-8?B?b00wNzIxK2c4eGFXeTV1REhRTjRYanZpTTB3ZG56VDFiQkZBakFRb2xlT2hQ?=
 =?utf-8?B?SVdNTjFldkhCelF0SG5zaXRMYVg3ZUFVVldmL1Q4RG1nYW1YejZBeCt2UFNx?=
 =?utf-8?B?T01uVjlNa1VmZnV2c1lzeWg3T09UWWJobk1pRm1henlCeHBHOTZhbjlQWEFt?=
 =?utf-8?B?UUduZ3oyQmxKcGFXRWdTbG9nNWVGTFc2ekF5VFN2SldjN3UzblJ5eHF4MHEx?=
 =?utf-8?B?OXdyT05pSjRFaDFhd1ZSQkFDVGVRL1FONVVwZnNONlU0SnBjTmRqNU9KOWtO?=
 =?utf-8?B?OFAxbk1rRDFMS3RtbFJXbFpBTE1vK3lPZlIrT2s3bW1IV2xOb1FLbDF0K1B0?=
 =?utf-8?B?RUgzMkNWN1F2RU1rTGovc3hVVDJXOXRQSDJYcWc1RW9jZnFyMzRvM2FDVW9C?=
 =?utf-8?B?djZMbnNTVCtNSE1WNy9kRnpieHNOcFdVbnFXdTBKcGE1cjNjTzlPbFltRFcz?=
 =?utf-8?B?bGRIRk5oYjlCS3g3RnBOMCtkUHorMlBBdFAzNE5IelJxZFdoVStyZ21Jc01n?=
 =?utf-8?B?clpleG9CY0dyUXhRb2N0d096ZmdhZVIzbzdRV2tsaTF6RFJObTZwVGw5R01I?=
 =?utf-8?B?b28zNk9hY0tYdnplWVdtN01TdmE5a0tVTU9LN3RmUzNwWm1xN2xQZjFyYzlR?=
 =?utf-8?B?N0xiVjVEU3VzNmh3L01zTE1mb2FmSFV3MTVLa0t2NlE2OVNiR3RtUzBoSGNX?=
 =?utf-8?B?WnVXM09vUXkvcTVsMUo3M2RibjBzdVBuUG5aZ1h4VHNRR0tycnllRyt3cmda?=
 =?utf-8?Q?t8zlYN5MLIZgqsHvrr5h5AkzJlw0G9LV?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5711.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bkhhTmtEUXBFdzhGaS9QQU1OdC9sYnlZRWZCUUV1L3VVb2ZBL0UwR1JJOFRP?=
 =?utf-8?B?RURUb0pjTi80WWxvRmI1NHJ0VXhwak5aTGZLWHBvNDA2T2JUREZLWE1pUmpS?=
 =?utf-8?B?dFV6UnpoUzlWSHVmZlVkZWRsOEgwU0dFWnZHazVwQ2dSWDJQY1BSN2dJcnd2?=
 =?utf-8?B?dGgrWEQyekh1ckZDcW50VlRjN1FDMzZ2ZlJIdmJxdXZ2S3p1a1lUU1ZySlMr?=
 =?utf-8?B?ajZTMnV2ZkJkZTZsa0JhUURxcmRLK1BWTERDTUhzYlZncnFCbHpxNlQ0UGph?=
 =?utf-8?B?N3lnaG9vSUhDdVUvWmJjZWxTcGxPYStXSUFycVBCaHlFN25LOCsvTDRSTmxB?=
 =?utf-8?B?NUE2Z0RpU01SM2lmekdRZFluWi9VUmRuSktRbXd3TUxYVU40eVhVTHRGVTZp?=
 =?utf-8?B?QmNzeTNZOU5YaE1MR05qM0JzN2hwR1BoSW56UElXWEN0TmRhWE5sb3VQMVFz?=
 =?utf-8?B?OE55M1MwVUpsaFpiN3VNejZ0NytvOHFLY2hlUzQ0aEV2Zzdkb1pkK1hMZHlp?=
 =?utf-8?B?THJYSmV4em1DZFR2YlJoTFJYVE5kdTgyd2Jaei85UmhPWjZ1amgrMkU0SFY3?=
 =?utf-8?B?UzRvUy83YmJidDhxcHA0ZUtOV0JvaG54U25FczFxRUJoR0hydldnVE82ODBm?=
 =?utf-8?B?MVphb0hjQ1pESFlNVkFxelBQb0V4Vit3b1JWRXVGMEFGSVltZW51Q0E0dkpn?=
 =?utf-8?B?WmpETnc0Q0dhMTg2NkdUMXhLM3F1M0JhZVhmekMrOWxIdWxGWk92Zk1RTFNa?=
 =?utf-8?B?bXYyWEtrSGhEOU90OGh3ajZwc1NzVVB5TGdkTXk2czhQS2tVVzNSVUcyUkVD?=
 =?utf-8?B?Zm43N3ZEK1Y5WWpPRlN2QlVhNDVtZ3oxUFF2L2paYWNLbWhjNHZwMGM2Z3Ix?=
 =?utf-8?B?Yjl1RUtZNmRyWm1MbUoxdWl2cVUvQ2RrVWFNY2MwdjdMRVlzYktqcFhhY1k2?=
 =?utf-8?B?b1M5dmw0STRia3hnaExGZXVwb1FMeGtrRzhyRlRFZG91NTJKVjYxRERyTTZn?=
 =?utf-8?B?YTMzbmpxQmFLMFdkc3RpNG1oZFFCRjdINUVaL1dBTFQ2Zm9wM3ZDcUc3dTk4?=
 =?utf-8?B?YnBTQTRheVBBMHhOcTkwTXIyOTliM0RkTG1yeDZrZUNjQjJZY1JUc2FKMDFU?=
 =?utf-8?B?STVMZVNmS0swOFFTejRaQ3VLd0NyNUtlYzdDV1cyUW04bVVoOEN1U0VWR2Q5?=
 =?utf-8?B?aGRSNlRONnZub3d0ckRuV3NKZ2xtTElQSFd6MURRQzdzMlRIcjdKRGxPZHMy?=
 =?utf-8?B?dXNZZ1FhcUNXY2dFWmFURGNGQ3g0Zk5OY25BY29MYUJtcWFXMGlpSzl1a29C?=
 =?utf-8?B?MldCTlhlWHI0SEpoMmNLSWE3ZXRkL3ArUUloeHlETUYvNFB4L1NqT0hsUWNm?=
 =?utf-8?B?bU0vSG5UZlVuWldaRC9RN0ZibGpoSGZXVUNWaXplUHRxSFNzdUpkR1YrMW1S?=
 =?utf-8?B?N3RMQW1EOTlOQS9BdUIxL2g1RGk2aitsQXo4Uk55NFY5c0Q4cnlpbU5rUVdk?=
 =?utf-8?B?aHNNVG9ueEJIT0dIeUpwQmlRblAzT3lMeC80ekl0cFJtM1MyTktPc1NldjRi?=
 =?utf-8?B?cER0aERYT3BvL2w1ZTY5MGhvMm9OVERmRXltMTZMYTZXMGdBcG11VGdiRWND?=
 =?utf-8?B?ZVprMitQd3JHWkNxWGk5eFZmbDk3aEF4TnVUZUhiSjJNQm1naUl0TWNHOXBG?=
 =?utf-8?B?eGJiK3h3TVNVbE5oL2Z4WGdHZHNra1RGN0k2L2RVc2RuSzN2YUgvZ0NvZ25t?=
 =?utf-8?B?Vk9IRlBiajFzaUZzMjJkRWt6eWhFa2dXTEpXS0JNbTE3dGNIVVBJancySkxx?=
 =?utf-8?B?aXNPbHlldm5od1JyRTdDNEJUb3ova2Z5bzZ2OWdIQVM1OVNQTTZiS3hyWWE1?=
 =?utf-8?B?ZUxLY0xYVmpDNFZwWnZvWlE2N2RyVzFUZDJwQUFIQkpNcHp2SkRKa3dRdzBj?=
 =?utf-8?B?MUxlQUYxMy9pN0tISlJIYjU5RmNSQ0xqWGt1ZkhpZUt5UXZDM1BBRVdOanBo?=
 =?utf-8?B?bTBKOWljRzlUeno3emtMdHlmZVg4dHU4dEZZN0FRUXBBRHlHM1Z0bGErcDY2?=
 =?utf-8?B?V3JFOFFkWjNpcWcyNit2SHNZUHR0Z0VQdzRyNGxuMHdpaWdmVTRGSnlMUllk?=
 =?utf-8?B?K25aY3NmaEp5dE1wVVY5c2NaVXdjSE1RUWR4bFZBUU5EV1NpY2NxWis3MDlY?=
 =?utf-8?B?TWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <184DE58C2248C645BDC5F0358D8C028B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5711.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b0681b1-a5e0-46b4-546d-08dd3fee5a2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2025 22:51:50.3373 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ++B+qlGGZnusdIScOgJKaNbiCb/4tafJXO6pGj1+iiodjNcwJ5O+BX83gT62EpDUtSz7OvhnaeCa5fx7j9cdLF1tCIOQnZVolgjgwxuPF5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6793
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

TWF0Y2hlcyBjdXJyZW50IHRhYmxlIGluIEJTUEVDDQoNClJldmlld2VkLWJ5OiBDbGludCBUYXls
b3IgPENsaW50b24uQS5UYXlsb3JAaW50ZWwuY29tPg0KDQotQ2xpbnQNCg0KT24gVHVlLCAyMDI1
LTAxLTI4IGF0IDA5OjUxIC0wODAwLCBNYXR0IEF0d29vZCB3cm90ZToNCj4gVXBkYXRlIHRvIGN1
cnJlbnQgYnNwZWMgdGFibGUuDQo+IA0KPiBCc3BlYzogNzI1NzQNCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IE1hdHQgQXR3b29kIDxtYXR0aGV3LnMuYXR3b29kQGludGVsLmNvbT4NCj4gLS0tDQo+ICBp
bmNsdWRlL2RybS9pbnRlbC9wY2lpZHMuaCB8IDYgKystLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvZHJtL2ludGVsL3BjaWlkcy5oIGIvaW5jbHVkZS9kcm0vaW50ZWwvcGNpaWRzLmgNCj4gaW5k
ZXggOWMzYTMzOWUyNmFmLi43MGI3NWUzMWVkZmYgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvZHJt
L2ludGVsL3BjaWlkcy5oDQo+ICsrKyBiL2luY2x1ZGUvZHJtL2ludGVsL3BjaWlkcy5oDQo+IEBA
IC04NTYsMTIgKzg1NiwxMCBAQA0KPiAgCU1BQ1JPX18oMHhCMDgwLCAjIyBfX1ZBX0FSR1NfXyks
IFwNCj4gIAlNQUNST19fKDB4QjA4MSwgIyMgX19WQV9BUkdTX18pLCBcDQo+ICAJTUFDUk9fXygw
eEIwODIsICMjIF9fVkFfQVJHU19fKSwgXA0KPiArCU1BQ1JPX18oMHhCMDgzLCAjIyBfX1ZBX0FS
R1NfXyksIFwNCj4gKwlNQUNST19fKDB4QjA4RiwgIyMgX19WQV9BUkdTX18pLCBcDQo+ICAJTUFD
Uk9fXygweEIwOTAsICMjIF9fVkFfQVJHU19fKSwgXA0KPiAtCU1BQ1JPX18oMHhCMDkxLCAjIyBf
X1ZBX0FSR1NfXyksIFwNCj4gLQlNQUNST19fKDB4QjA5MiwgIyMgX19WQV9BUkdTX18pLCBcDQo+
ICAJTUFDUk9fXygweEIwQTAsICMjIF9fVkFfQVJHU19fKSwgXA0KPiAtCU1BQ1JPX18oMHhCMEEx
LCAjIyBfX1ZBX0FSR1NfXyksIFwNCj4gLQlNQUNST19fKDB4QjBBMiwgIyMgX19WQV9BUkdTX18p
LCBcDQo+ICAJTUFDUk9fXygweEIwQjAsICMjIF9fVkFfQVJHU19fKQ0KPiAgDQo+ICAjZW5kaWYg
LyogX19QQ0lJRFNfSF9fICovDQo=
