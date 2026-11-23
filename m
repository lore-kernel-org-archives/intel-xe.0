Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F65F606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 16:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Tel9BhrK;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Ch0ZP2Fg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D719F10EC36;
	Mon, 23 Nov 2026 16:18:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD8810EC36
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 16:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795450706; x=1826986706;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Acf3DgSZaanuH0SYfkeNtNpFEZecPsud/e9DUPIuRsA=;
 b=Tel9BhrKQ7W8jM07kaLDFdbUHB0aHUfEtgrYPA34xLo6PC+2uv6/+pAE
 fBUBLnRMvPFU/q40o6DkF3PJiA0gl6ZBFWWjPdhsYiU388h2/5UKI/MWl
 13C3PDjOAXiy0ofiYRsdPoHv5jxtG9rrZrvIPMVd6LSsqR29yQSPP/qlR
 bWMrtV3iyvymEm5E4qK19e1BkcDTOenv+qS7IkrqcSY61TLTd0cXfYuxh
 lkjPwMhVbSD3kvnUnMjWn62nkTN+Cmxu0a5Wt+8OD2RC34w0EhAdKtxbk
 QOOdr3JZqoJHNuFKqIxt1z6zZqSBP49D7NOidNd0+5LEs7kPEXUkgZ31j Q==;
X-CSE-ConnectionGUID: exKiirYvRrqIpLHqHUe7CA==
X-CSE-MsgGUID: 0sxssrJVRauaZQmlrJf7Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4103314"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4103314"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 08:18:25 -0800
X-CSE-ConnectionGUID: JryxrlsBSWSRAoyzxuO1TA==
X-CSE-MsgGUID: O+jfzFfETRqdrAgkqhwn3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208";a="11669565"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 08:18:25 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 08:18:25 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 08:18:25 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.71) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 08:18:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e9+Ne/D2XEh/3X0KHJ/Bjlt1fiG1BlFcEGVMrOvUaP6z1t26IEiDP8LhWtNsmqETpxe3aJnOWtnH3y7MtkEPPXbuJ8YcnhFK0NecD+NCz/h259SGRtVlvEO+rGVNd1QmUwyKrt9dNPs2tQXHqJNGHrLcaf6TaHL/HdcmXm1S/Cn64rHTajbzabfL0wVyJW/UkyzqCvdiCS932oLk35UWuqvH/EczEMb2HcC3U3wQDR6EL7JVGnNjOUgZtj0lWwcAr0p2GNCMDGipLLKM1kBC4Y1evj3E6c75+P0u2T0P6GhNpP3eSHtN0t7AXTRuRFwi+klHxfFJ1ON92/Kt8F+HuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Acf3DgSZaanuH0SYfkeNtNpFEZecPsud/e9DUPIuRsA=;
 b=asb9r0DEfZ37dLUOacIakR6rxhDZ2Ie5vq/Skr0RCQHKVCTPCmtSo/Rrrq4VbgWPmOX1XAVOjtK4pY6+SGkCFL7wpQ/szMWe8vLahGXzV7zjprbZr5ttl8vuA2sxDvTG8opyMRgp69RK118ExNpS8ikWtKLPeeisLJUljet0RTH1dYFxjpRQE4ekoB0GLW7nmLOfUJ6dMprg+aFHRmLTDH42MUFfaqTBOmqHiW6iCk58xm3NCKbIK+XhcQTtb00GMic4dsoFKQ3ttyPmmHp1JUy2h/DI3H+CzrmcMl7sCDKb47uiATtu8xpoBWgjYjRTGKkXD5dxvheKLzqeg0vz/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Acf3DgSZaanuH0SYfkeNtNpFEZecPsud/e9DUPIuRsA=;
 b=Ch0ZP2Fg0+JbRbxfip6TATqkT37yQdv83m+O1DHpM0j+QLkKVDJmEXru3b6vP8K3Zvw466RReqUPUA5UWATi/4por7Op6na6CeUh3BhAOb3nV1257fHS8kpoT/ZDEj8PEgNMoq/alMQ8Kgqp2F9obtHm1noE35UWJOi960QUqvE=
Received: from DS4PR11MB131308.namprd11.prod.outlook.com (2603:10b6:8:502::7)
 by CO1PR11MB4962.namprd11.prod.outlook.com (2603:10b6:303:99::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 16:18:17 +0000
Received: from DS4PR11MB131308.namprd11.prod.outlook.com
 ([fe80::40c0:7a50:a98c:8920]) by DS4PR11MB131308.namprd11.prod.outlook.com
 ([fe80::40c0:7a50:a98c:8920%6]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 16:18:16 +0000
From: "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>, "Piorkowski,
 Piotr" <piotr.piorkowski@intel.com>, "Narvaez, Jesus"
 <jesus.narvaez@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Subject: RE: [PATCH 2/4] drm/xe: Add MI_SEMAPHORE_WAIT_64 instruction
 definition
Thread-Topic: [PATCH 2/4] drm/xe: Add MI_SEMAPHORE_WAIT_64 instruction
 definition
Thread-Index: AQHdc4gTipSxNVJaGEaU8avaAK5LZrc2n90AgABNoaCABPeV8A==
Date: Mon, 23 Nov 2026 16:18:16 +0000
Message-ID: <DS4PR11MB1313087323AD767C4484EC94D8C8452@DS4PR11MB131308.namprd11.prod.outlook.com>
References: <20261113155734.4164230-1-tilak.tirumalesh.tangudu@intel.com>
 <20261113155734.4164230-3-tilak.tirumalesh.tangudu@intel.com>
 <1334be6a-b10d-48ba-acdd-81b54e0cc15b@intel.com>
 <DS4PR11MB131308979BF5529C7AEA338F72C8782@DS4PR11MB131308.namprd11.prod.outlook.com>
In-Reply-To: <DS4PR11MB131308979BF5529C7AEA338F72C8782@DS4PR11MB131308.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PR11MB131308:EE_|CO1PR11MB4962:EE_
x-ms-office365-filtering-correlation-id: 2754ac42-f320-46f7-e1a8-08df497d61b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|921020|38070700021|10067099003|4143699003|11063799006|56012099006|260925021311599003|260925022911599003|260925021911599003|261009223027099003|261022113327099003|261022075727099003|261022105027099003|261021121427099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: HRTcpdvUJsyGhsVkhXI78GfImwSD8++hCVDMKI6YVmrq0xJmvUypo0EJr541HlYkFe46PIIZf4nWcB/WmTlWti6XR53mawTX+hZJOQVCqtnH1tlhzBG4rBp1tvl+6Ep2MB7ThhzGXbbwVDwz2v8/DEzvOZJsJyPObrJCaJXwRwNrlu4Lrw5D0/awf32b8uVB8cqtSrOyuIMUgacXmJnvGW7kUyxYx1IE3sk3ilKpQb2SoLEZ788Viuoz9KH1oM98y6Znzn+ayNjKuzoz4gsdZ+6snqowctXB7BuZ0JpOOE9cnQH0Y18LSytUgsORY9xr0eG8gX1esl6/aLWmaAdXqDBUwlGBaxAIdhrlghaDs8hlQ+UwxYO8dyFU7qukWd671WIdJoB8pHW5G5IltUpl532osYAtiTxB53lT13duyvxwdMr+WX67AlKsJJtSHo9AdxQQvJZD8ny1V/mB5Rmak1jgjR/or4/EHrRQcPDl0obkKu9wkbI0wHXah2snRQf2zjzUWrEjJzb19Q7hhqkx3LMKJTJmAsFh5m1uDFuOrVigECkIzZfJggAt9VRdz2/eNSAVhxqMpGRt4F6R9+OYQDyO4YV9ByL4qDWcxlmMjN0IMDGUYYkkMz0t1f2AH/mBy+XpyKqqtefmTfV7rTNAa+Qv4o5Ai/mDD6N6se3DTI3p6aMBsXFQrJdcr+7N+yZWAd6746U+8DC3hzJBGRmrjgcLn+iA9pwdtq6i1cjnVrM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PR11MB131308.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(921020)(38070700021)(10067099003)(4143699003)(11063799006)(56012099006)(260925021311599003)(260925022911599003)(260925021911599003)(261009223027099003)(261022113327099003)(261022075727099003)(261022105027099003)(261021121427099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U3lqZldrZW1lUERUVjc4elZyd25EZllpT1I5Z3cyK0V4aWo1SE9rWDNoNG81?=
 =?utf-8?B?cU9NbzRydFJoY214ZHkzb2ZURi9NWVVpYm00RDVoTTFoUjFGSlI2YVdwS2M1?=
 =?utf-8?B?K0tiQWkwZmtRNDhWTS9WNUQ3ZGcwS2wrWDNjbFNNbzlFaVRDNitiNk5TU2lI?=
 =?utf-8?B?NGJrRHRTVzFVM3k0d01TOHAySks0Y28zRFJxNmlkQ0Y5TDJFRHhFdThVVnBM?=
 =?utf-8?B?eGJNaTNraVUrcldmZWppVG12ZmVDbnk3Qlh2YnZlODRiZ0xDVjFxck9jSGVh?=
 =?utf-8?B?ZHQzdExKZkxGdFp3TFh6WVg1eWF2TG5SVUFpN2UrazBFRHdjRjB4VEdoZ3pn?=
 =?utf-8?B?MWF3Y1RrV2RONHpuRG9KcU9HbEFpR3YydGkrSXN5ZWVnTWd2NDMrREVoazhl?=
 =?utf-8?B?alVJaDRvWDBNOU0vWnFneFF5MFhUTUlQV2YzaDhlTWExeHdDN1ZMUXlCRHpL?=
 =?utf-8?B?QWMyTm5DVFVqUUhMSThHcFkyb0ErQkg0dGllMGU3N2x5Qit4SWFCN3JpRFcz?=
 =?utf-8?B?SStVeFc3ejNDYVZQQ1JxZGRrd2s3Yk1JcVozamRWNmtGd0NkZEJrcGxteExm?=
 =?utf-8?B?NUt4UHpwZXZPTTQ4WllFZFNlaC81c1BvZk5ZVllaOXJRR2ZnYmg3SUhtNzE2?=
 =?utf-8?B?ODgvaEVRZWRsME1RRkh2RFpPQ0ZVay93VkwrYTFzQ0twTmdRYWRkR1RZR2Zy?=
 =?utf-8?B?bkJ0Vkk3YmpVaU9LLzlpdXpTRWRqWTNIdzV4aXBiOWJPN2loKzl3K3E5T0pq?=
 =?utf-8?B?WktRNnRhMmhXQ3d1R21vYTBFRlhoQVdGVlVmVStoSmpiTm5aV3g1aEQrYkk4?=
 =?utf-8?B?RlQ2Tk9KSXF5MkdCQWllckZNNHAvR1RRTGhJam9KWmtDWjc3c1FVaEg1WXY0?=
 =?utf-8?B?RjJQa095T0FwTFVWYVlsOVNrZGpXQ3NIQXgzcWxjeGxTekdMNExqNXh6eTZt?=
 =?utf-8?B?NUVtdlg2U1hmNUwvSkorRDRuRlYrcE1yUlVtd2ppWU1kNVVlVCtFSS91UUgz?=
 =?utf-8?B?dWdFTjQxUTJDL0p6MmwrbUNhemJUeHVDWEZhcVVzRk1IeTB2V2N0M1AzMXZp?=
 =?utf-8?B?WUhvejc5bjZ0YXRYWFU5NmRFeUVWWTU2U3psbVVUZUVXOGw1K2NzeUQxbnNE?=
 =?utf-8?B?NFA5ZDgxYmdCdW1WQUNjTGVIcG1BMnVFYXoxcnF3SmFiRkcxQ2NabUdtcytx?=
 =?utf-8?B?dEJoZ2U3SHVLYy9LcEZkcnFIT0hUQ0VKRGJvaWhMZjBQc25FTGcxQStyU1pC?=
 =?utf-8?B?akpzbU1tZ3FzdVFrNlIxR2NnMStJM1Q2Y1lJamFrT0FlczJUY1ZsWXVpTjlp?=
 =?utf-8?B?ZEc4azdNbm5oTW1sVUxaMEt0eG5EMHlDTUtqR2JnZG1DcXA1UFh3YjVUOE00?=
 =?utf-8?B?ei9SYXlSTmhlMnRncFFsS296aWJ2YUpLQ3hMZGN5clZLek1Teng5Q0dheWpC?=
 =?utf-8?B?TUFrY01rNnFaM2FwdExSc250VURFWENkU1FRREVZSzduWDhHdnk0OGdsRU91?=
 =?utf-8?B?Q2pWd0V6NW42MHFXMFIwUjdEdEMyM245RjRDamFEeGxCRFVVVUY3bHI4RHBE?=
 =?utf-8?B?VytwSFI2WHBnZmMxdDNuMTdsTzlkTExpaS8wdkx3SktrUW1sUU52cEM0cEtE?=
 =?utf-8?B?Ly95RFgvWWRVQzVUcFRKVUtoZyszK0NqVnk4bnlyUndTVXpYKzkyMElHMTc5?=
 =?utf-8?B?U0RTOU1LUGEvRHBSSkxMNkxsMVA0OW5hR2w1REpHSjJLV0wrZHdzTDV0YkJj?=
 =?utf-8?B?bkJPeWgvVVNCR2tUUmVZRVh6L2UxaW1mOVVTNitLaXpWaWw2NHk4NVo0cjZY?=
 =?utf-8?B?WTN1ZVlYT1VmaVBxR3U1bm1VeEZGaHhTVDhhNk43Q1lpOU5pSmJUalFIZG1J?=
 =?utf-8?B?ZGY3K2c5TXRsd2NoTWcxRGhMMnhMNVdCeS93eFA1MDY4eGM3dHFlTURXVGVv?=
 =?utf-8?B?dXFZL0dzY0dHdWgzZldORldSbks3ZXZGMGtNZzhuUzB1c0NOVHRmSVJmZk9I?=
 =?utf-8?B?QzF6VlRCQjhQUDllbjlZZlBWWlM4Zk9jWFRLaElkQ09CSlRzaGJOOG9VdmJU?=
 =?utf-8?B?SWFuYk96ME1lTlVTWEl0MlRXSXpHVzRYaEsxdDlTT1hFVC9Nd3RvVjE3Z3Zu?=
 =?utf-8?B?UTg3WWpsSmxoMmNxT1dMOXZvdkVZTDliS2ZSeGZxcVlPaElXSlJKZ1VERTBt?=
 =?utf-8?B?azlIaFdGL21wZTU0ZEx4MmUzamgvaU5ZTHpTZWJhWm9mZnVJbUU5VnpNd1ls?=
 =?utf-8?B?MnVXd0NEYzJPUmNMbkNDVVBEUTR2R2JPQVVVK3BIL1l6bEFucHRjYS84cFhC?=
 =?utf-8?B?VVhVYUdIYzUvTjByZy9iaUlaR0FVeFAxM20zdTR5TFA2SkZta3ZKckMweHpR?=
 =?utf-8?Q?oDq240lVVqGjg8Uw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: N5Ib7qBz1bYc2Z22haHUKU58rRBOmKgjcBwd8+3KAwxkC6DqTXSoqLCPBi/I7TYmDRCQtcyk+yy/E4ph4Pp8DLIvxuXjD9H4zj9zw2vZmqKPLnIMJ4AMPwVa1LdD9gbExMUCxKUSpYujVKnoH1SVA06a4Gs0AZOTxzzQUdzavecRplDsX+yRu/rD0z05t0CLZYDJIPfksuRTyGaMWcrLmfZ1aJzM/5a+18PkvdiH3e+JTaTZYVa9mKS8PxZQM4r2zW799Ad0wQozQh4yBuSdIQaxWfba5wa9xMGgzIG6j2U7j/zXHlqLFJMc3d55ZcKEaW3jwV2CNsoQ8MLXAZ85kw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PR11MB131308.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2754ac42-f320-46f7-e1a8-08df497d61b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 16:18:16.8872 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XVCit8era5s8JdPMreLSc8fDqv2ljc92LLzY6IxjfYk6G1wr/b+TEhJP2qXhKgq/s722ilKoevEgxMIrzommpt8Mk9CwXcUikqcVOU+vHO+0qWNsQeodLRNwBc0kjJrb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4962
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFRhbmd1ZHUsIFRpbGFrIFRp
cnVtYWxlc2gNCj4gU2VudDogMjAgTm92ZW1iZXIgMjAyNiAxODowNg0KPiBUbzogSyBWIFAsIFNh
dHlhbmFyYXlhbmEgPFNhdHlhbmFyYXlhbmEuSy5WLlBAaW50ZWwuY29tPjsgUGlvcmtvd3NraSwg
UGlvdHINCj4gPFBpb3RyLlBpb3Jrb3dza2lAaW50ZWwuY29tPjsgTmFydmFleiwgSmVzdXMgPGpl
c3VzLm5hcnZhZXpAaW50ZWwuY29tPjsNCj4gQ2VyYW9sbyBTcHVyaW8sIERhbmllbGUgPGRhbmll
bGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+OyBTdW1tZXJzLCBTdHVhcnQNCj4gPHN0dWFydC5z
dW1tZXJzQGludGVsLmNvbT47IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJq
ZWN0OiBSRTogW1BBVENIIDIvNF0gZHJtL3hlOiBBZGQgTUlfU0VNQVBIT1JFX1dBSVRfNjQgaW5z
dHJ1Y3Rpb24NCj4gZGVmaW5pdGlvbg0KPiANCj4gDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+ID4gRnJvbTogSyBWIFAsIFNhdHlhbmFyYXlhbmEgPHNhdHlhbmFyYXlhbmEu
ay52LnBAaW50ZWwuY29tPg0KPiA+IFNlbnQ6IDIwIE5vdmVtYmVyIDIwMjYgMTM6MTgNCj4gPiBU
bzogVGFuZ3VkdSwgVGlsYWsgVGlydW1hbGVzaCA8dGlsYWsudGlydW1hbGVzaC50YW5ndWR1QGlu
dGVsLmNvbT47DQo+ID4gUGlvcmtvd3NraSwgUGlvdHIgPHBpb3RyLnBpb3Jrb3dza2lAaW50ZWwu
Y29tPjsgTmFydmFleiwgSmVzdXMNCj4gPiA8amVzdXMubmFydmFlekBpbnRlbC5jb20+OyBDZXJh
b2xvIFNwdXJpbywgRGFuaWVsZQ0KPiA+IDxkYW5pZWxlLmNlcmFvbG9zcHVyaW9AaW50ZWwuY29t
PjsgU3VtbWVycywgU3R1YXJ0DQo+ID4gPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT47IGludGVs
LXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi80XSBk
cm0veGU6IEFkZCBNSV9TRU1BUEhPUkVfV0FJVF82NCBpbnN0cnVjdGlvbg0KPiA+IGRlZmluaXRp
b24NCj4gPg0KPiA+DQo+ID4gT24gMTMtTm92LTI2IDk6MjcgUE0sIHRpbGFrLnRpcnVtYWxlc2gu
dGFuZ3VkdUBpbnRlbC5jb20gd3JvdGU6DQo+ID4gPiBGcm9tOiBUYW5ndWR1IFRpbGFrIFRpcnVt
YWxlc2ggPHRpbGFrLnRpcnVtYWxlc2gudGFuZ3VkdUBpbnRlbC5jb20+DQo+ID4gPg0KPiA+ID4g
V2FfMTYwMjkyODE5MTMgcmVjb21tZW5kcyB1c2luZyB0aGUgTUlfU0VNQVBIT1JFX1dBSVRfNjQN
Cj4gPiBpbnN0cnVjdGlvbg0KPiA+ID4gaW5zdGVhZCBvZiB0aGUgbGVnYWN5IE1JX1NFTUFQSE9S
RV9XQUlULCBkdWUgdG8gYW4gaXNzdWUgd2l0aCB0aGUNCj4gPiA+IGxlZ2FjeSBzZW1hcGhvcmUg
b24gc29tZSBYZTNwIHBsYXRmb3Jtcy4NCj4gPiA+DQo+ID4gPiBBc3Npc3RlZC1ieTogTExNDQo+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBUYW5ndWR1IFRpbGFrIFRpcnVtYWxlc2gNCj4gPiA+IDx0aWxh
ay50aXJ1bWFsZXNoLnRhbmd1ZHVAaW50ZWwuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgIGRyaXZl
cnMvZ3B1L2RybS94ZS9pbnN0cnVjdGlvbnMveGVfbWlfY29tbWFuZHMuaCB8IDYgKysrKysrDQo+
ID4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCj4gPiA+DQo+ID4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL2luc3RydWN0aW9ucy94ZV9taV9jb21tYW5kcy5o
DQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS9pbnN0cnVjdGlvbnMveGVfbWlfY29tbWFuZHMu
aA0KPiA+ID4gaW5kZXggODM1ZWY3NWJiZWIxLi4xODZjOWFjMzVlNWIgMTAwNjQ0DQo+ID4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0veGUvaW5zdHJ1Y3Rpb25zL3hlX21pX2NvbW1hbmRzLmgNCj4g
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9pbnN0cnVjdGlvbnMveGVfbWlfY29tbWFuZHMu
aA0KPiA+ID4gQEAgLTM0LDYgKzM0LDcgQEANCj4gPiA+ICAgI2RlZmluZSBNSV9GT1JDRV9XQUtF
VVAJCQlfX01JX0lOU1RSKDB4MUQpDQo+ID4gPiAgICNkZWZpbmUgTUlfTUFUSChuKQkJCShfX01J
X0lOU1RSKDB4MUEpIHwNCj4gPiBYRV9JTlNUUl9OVU1fRFcoKG4pICsgMSkpDQo+ID4gPg0KPiA+
ID4gKy8qIFdhXzE2MDI5MjgxOTEzOiBNSV9TRU1BUEhPUkVfV0FJVCBoYXMgYW4gaXNzdWUgb24g
c29tZSBYZTNwLA0KPiA+IHVzZQ0KPiA+ID4gK01JX1NFTUFQSE9SRV9XQUlUXzY0ICovDQo+ID4g
RG8gd2UgbmVlZCB0byBtZW50aW9uIHRoaXMgaW4gdGhlIHJlZ2lzdGVyIGRlZmluaXRpb24gZmls
ZT8NCj4gDQo+IEkgbWlzc2VkIHRoaXMgY29tbWVudCwgYXBvbG9naWVzDQo+IA0KPiBBZ3JlZWQg
d2l0aCBTYXR5YSdzIGNvbW1lbnQuIEJ1dCB0aGVuIGhvdyBkbyB3ZSBwcm9tcHQgZnV0dXJlIHVz
ZXJzIG5vdA0KPiB0byB1c2UgdGhlIGxlZ2FjeSBzZW1hcGhvcmUgb24gcGxhdGZvcm1zIHRoYXQg
c3VwcG9ydCBzZW02ND8NCj4gDQpAUm9wZXIsIE1hdHRoZXcgRA0KQW55IGNvbW1lbnRzIG9yIHN1
Z2dlc3Rpb24gaGVyZT8NCj4gU3R1YXJ0L0RhbmllbGUsIGFueSBzdWdnZXN0aW9ucyBoZXJlPw0K
PiANCj4gLVRpbGFrDQo+IA0KPiA+ID4gICAjZGVmaW5lIE1JX1NFTUFQSE9SRV9XQUlUCQkoX19N
SV9JTlNUUigweDFjKSB8DQo+ID4gWEVfSU5TVFJfTlVNX0RXKDUpKQ0KPiA+ID4gICAjZGVmaW5l
ICAgTUlfU0VNV19HR1RUCQkJUkVHX0JJVCgyMikNCj4gPiA+ICAgI2RlZmluZSAgIE1JX1NFTVdf
UkVHSVNURVJfUE9MTAkJUkVHX0JJVCgxNikNCj4gPiA+IEBAIC00OCw2ICs0OSwxMSBAQA0KPiA+
ID4gICAjZGVmaW5lICAgTUlfU0VNV19DT01QQVJFKE9QKQ0KPiA+IAlSRUdfRklFTERfUFJFUChN
SV9TRU1XX0NPTVBBUkVfT1BfTUFTSywNCj4gPiBDT01QQVJFX09QXyMjT1ApDQo+ID4gPiAgICNk
ZWZpbmUgICBNSV9TRU1XX1RPS0VOKHRva2VuKQ0KPiA+IAlSRUdfRklFTERfUFJFUChSRUdfR0VO
TUFTSyg5LCAyKSwgKHRva2VuKSkNCj4gPiA+DQo+ID4gPiArI2RlZmluZSBNSV9TRU1BUEhPUkVf
V0FJVF82NAkJKF9fTUlfSU5TVFIoMHgzYikgfA0KPiA+IFhFX0lOU1RSX05VTV9EVyg3KSkNCj4g
PiA+ICsjZGVmaW5lICAgTUlfU0VNVzY0X0lOVEVSUlVQVAkJUkVHX0JJVCgyMCkgLyogcmFpc2Vz
IHRoZQ0KPiA+IHNlbWFwaG9yZS1mYWlsIGludGVycnVwdCAqLw0KPiA+ID4gKyNkZWZpbmUgICBN
SV9TRU1XNjRfMzJCX0NPTVBBUkUJCVJFR19CSVQoMTkpIC8qIDA6IDY0Yg0KPiA+IGNvbXBhcmUg
KGRlZmF1bHQpLCAxOiAzMmIgY29tcGFyZSAqLw0KPiA+DQo+ID4gQ2hlY2sgYWxpZ25tZW50IGhl
cmUuDQo+ID4NCj4gPiAtU2F0eWEuDQo+IEFkZHJlc3NlZA0KPiA+DQo+ID4gPiArI2RlZmluZSAg
IE1JX1NFTVc2NF9JTkhJQklUX0NUWF9TV0lUQ0gJUkVHX0JJVCgxNSkgLyogcG9sbCBpbg0KPiA+
IHBsYWNlLCBkb24ndCBzd2l0Y2ggb3V0IG9uIGZhaWwgKi8NCj4gPiA+ICsNCj4gPiA+ICAgI2Rl
ZmluZSBNSV9TVE9SRV9EQVRBX0lNTQkJX19NSV9JTlNUUigweDIwKQ0KPiA+ID4gICAjZGVmaW5l
ICAgTUlfU0RJX0dHVFQJCQlSRUdfQklUKDIyKQ0KPiA+ID4gICAjZGVmaW5lICAgTUlfU0RJX0xF
Tl9EVwkJCUdFTk1BU0soOSwgMCkNCg==
