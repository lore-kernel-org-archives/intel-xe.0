Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92068C71136
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 23:32:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E0510E74A;
	Wed, 11 Jun 2025 23:32:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dKpQiU0M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A8510E74A
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 23:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749684726; x=1781220726;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=T8/mm4dcmfa1EwCf2k0kibQavve+9omxvgu1D3iz25Y=;
 b=dKpQiU0Myi0X5txrbM99bzed2coXVflW4V72+0pPL2Mw6zvXhkXG6ChY
 3fnTZLSOuOvA/MErxX5wU6Y3lKEYpZewZ6W9lEgBrChjYFNj3ge+zmvKd
 XlwdsA1JuuG0VCOZSoIxTPSMOvOXTg/QtUSYQkgQg0XswxIjYuK/MoofK
 7Bs0qAs/+uK3MtKCJ3rcveDQA8Qq0c/whdJol3R/su0R9H/AiThMjoI8B
 zX+I2pUpcgGxXLWyLD+BzCenwIB8VL84uQJN5Ui3/I/c7zJVFvHHvGof6
 xzmoSKill+Neo907+xIeptRGeHwX76u8rGCXdB4TGizo6o77T+Krql48G g==;
X-CSE-ConnectionGUID: 7B6F1oQsSlu3Stc/VyUM2w==
X-CSE-MsgGUID: w47e5X5PSWKYyXg1Ap8N4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="39459547"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="39459547"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 16:32:06 -0700
X-CSE-ConnectionGUID: ISs9J2H2Tv6mxEuzMS3vXA==
X-CSE-MsgGUID: 9tEiXzAmTF2p8xW58Eb4Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="152337259"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 16:32:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 16:32:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 16:32:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.81) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 16:32:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IcV0kJxIA9VlvRXgDEyYKqf+zojfwb3a95nQrOGQBAeSZOSMdaL2NchAsplCsy2eIQ9wCGu41OLGzhPJ2BjY5JN9d6vigez7Dm0UuHsHUopVPdjJoI37ggfN1Q12wGxOZTl6ghUs16gaVz0L+u4dJPiRXDFluFX5WgkjMCYgpE2K308ExFSo7JJAC8AEYynFTTbmRh8A6rbEMGDjzPBfu5UgqI5P9sfmHqfPdc3buKpbCg5eQE6+FVSSnrkrNCPU+18Cgyxeor7r61Lm6CFr6et2rIDFe+nqGi1hic7UTi2B1rfEZuBbTaUbgh1gY2fRYFPVbRMjCLWF6cu3oLpIzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T8/mm4dcmfa1EwCf2k0kibQavve+9omxvgu1D3iz25Y=;
 b=meVWjiG+xFc78cimOWe9Vi98l4lxWsbDwfogLzKSTPi9H9Btut7tUw/lPi1fcAs4jfU67q/IyXrBpA9YiBr+LK9h9fggpfe23mxSB7Uc1EcOrECM4VT8ckf8Tw3qClI4LjYGq31uDak9eMLgMAtT34mDJQ4ETYo0WOfoSfx/nqj850M6gxeZEF6xneh5L2uFbsDvzJKud5tf1bOAP5kCKMAFE7DNOabHwq1vwiP7H6M2zQBMXoUAg0u3Ivr4Xj+tPawXiTbzw9qbs6nY3SjZCHCxN5czaIol/XrI0l5w18iotMgDsn7IR/WNWVkN7vXc14NUvfQfya6Rg/ixzvvKww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MW4PR11MB6960.namprd11.prod.outlook.com (2603:10b6:303:226::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 11 Jun
 2025 23:31:36 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 23:31:36 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH v3 1/4] drm/xe/bmg: Update Wa_14022085890
Thread-Topic: [PATCH v3 1/4] drm/xe/bmg: Update Wa_14022085890
Thread-Index: AQHb1Bi2Rz7m/s3aGk2VJ2AWxoSwWrPxs8qAgAASW4CAAA3TAIAAEPKAgAA8BoCABLfJgIAHyM4AgAAINYA=
Date: Wed, 11 Jun 2025 23:31:35 +0000
Message-ID: <35db7636c14d554f596c25f7ff9f346f5e9a835c.camel@intel.com>
References: <20250602234415.2015921-1-vinay.belgaumkar@intel.com>
 <20250602234415.2015921-2-vinay.belgaumkar@intel.com>
 <85316ce01b40c0cf8775833c29c4843bbf281315.camel@intel.com>
 <83ec77ee-1aed-4926-866b-e1a6301109e2@intel.com>
 <8afdac13617376dd5c9151e832921b5993443243.camel@intel.com>
 <5f834906-e62e-4a61-8dbc-7bed51904548@intel.com>
 <7094d8f3f850baed86783365bfbf5ffb84663edf.camel@intel.com>
 <c2dg4jybyfkmxgwpydvchso5bdpv46gpqat7zcjdrwcrjwjx7x@zxdu4py4iyki>
 <ckmq3cgq4onko4ls37uklvqd2gdzkj7noj36qiie23a77zem5d@xpxeo37h2s7f>
In-Reply-To: <ckmq3cgq4onko4ls37uklvqd2gdzkj7noj36qiie23a77zem5d@xpxeo37h2s7f>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MW4PR11MB6960:EE_
x-ms-office365-filtering-correlation-id: 2e7542fe-619b-45a3-3bbf-08dda9401b69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QUduUmpjcy9tMklvQ1VsNU1mK085RnBlRXhudGswNkpneDZDK2R5dDdRd096?=
 =?utf-8?B?L3pZRmZMM1I0TDhxQnc1QzdQTHZxd0cvNVp1SzR4U09XRW1zelRmZEFtTmho?=
 =?utf-8?B?cm1kVmpBTmJYV0JBM1ZxN1Exb01iai9UMVJFekI5L3JnWDRFYW10cEZhVVNr?=
 =?utf-8?B?NHoyU2I2RnNBdnlrei80bVBUYXdDbkhWazVmSGNzdWZzV2Q5K1ZGckRTeXBt?=
 =?utf-8?B?RDZLOHdWZnlSOCsrcmJNQUdFd0t3dERhcHVUaEJ3MER0UWJycTFYYkxpR21U?=
 =?utf-8?B?WFhSZnpjZVF6a3dKZW5vNCtvb1hQbStpcDVqTlcyaVZMSkQwaVQ5b2dkTlpT?=
 =?utf-8?B?VzhMZnVldmVYeENjN2h5b3Awdm5tNlUzQXlBYVRIY2g3NStWa21McDFuN1V3?=
 =?utf-8?B?TURMdk5HandyZ2xDNklLdTc0K2xOb2lPNVoxYTRKU3M0YVl1SUg5eDlDSm1U?=
 =?utf-8?B?RGV5M3JCNE1wQjYyOEcwTWhpQkRtR1ZqcVpRTXJza1d6Wk8wQjR5bkpEUWhR?=
 =?utf-8?B?Nzg0S0FYU01LVm03ZVlpSnlIN1gzRmsxS2JYSFdzOWQvWGpvczRuY2hSV1Jh?=
 =?utf-8?B?aFlQaFQ2S1dlR0ZrREM3dmRMcU9RSkJ1RjM5RFloR1VFYy9RYkhiRUZjUjA0?=
 =?utf-8?B?YmZlcHRMSkNzcVp2RUd2N29ORGRDUmQrQ2ZmbUhoUVlnbTY5YW1pK0g1a21p?=
 =?utf-8?B?cFBVYXlMLzN0aHJWWDl5Z2lDTTFRMEQ1YkFkVzRGYWo2Q1ZUTG5hSDBsNHJ4?=
 =?utf-8?B?N1A1RDlKcDc4YkUxVzlnbWkwMTZvNmpOU3daSUJWMnBHdE9XS3F4eUtjcGM4?=
 =?utf-8?B?QXNIVmdOck1ybkh5SDlxNGxRdmoyRGtpZVZUZENNcUlQdTBvSTFWZ28yckNJ?=
 =?utf-8?B?Sm45SlA2eFlJOXJ2amtBZEg2TG1sSHR4Q3dWY2JLWFp5aEJZY3hrZTEzSW9p?=
 =?utf-8?B?KzNNS0Vkalkvd0E0SHNUQ2JKTk9ZQUloK1ZIMTNVS0V5OCtHYVVkd2kvQzdH?=
 =?utf-8?B?ZXVaUWtTaHNlazJ1MTRHWWxEb3RHNTd5WXh6YTBZMWh2dldQRldHTHlvR09s?=
 =?utf-8?B?NU5GMkJlekkwVXE2dzlrblJxeWxqSjgwSnQwVlNhRWxCbGtvMXBVY01WZlEv?=
 =?utf-8?B?VWpUczZHNUdRdk5zazRwNFRvV1VDRzR4ZkpIZkpJU2w2eTI5OCtPN3U0RERV?=
 =?utf-8?B?dTBFOGpxNXdtOGdGeFJYdXMrZXVoNVluN0lROVVKM0l3N25Cd3ZGT1pTa2tV?=
 =?utf-8?B?U3pGakJKVW5TSDA2M1ZFcWRlZit2cDdPYzJzblZjbk8xY1E1SVVyU2cwcXls?=
 =?utf-8?B?aDZKMGsvZGtPZm9CSVUwMmZUWjB4OGJVejJUSGNJUnlMdW9LZjJlK3VNZmlx?=
 =?utf-8?B?N29HKzRRTXk5MG5ySHVjQTFnSkNWd3psQytTUWFGS2ZWVXh5OU9rMHRUbHRw?=
 =?utf-8?B?QVdpcE92ZnJERWJTUnJFbWx4Vm16Z24xM0VzY2JLRVVZNDNsL25EWGlPMENq?=
 =?utf-8?B?OFllMHk5eWRXRFNDZjRVSEgvMjdtQ1lwdk4vdTE1SjhhQU9DY3VMYW54d1BF?=
 =?utf-8?B?VXZkNkpyUWdndEg4cEVxMW54UDExYmZLUGF6MzlDOVRYRE80SjUwOVo3aVVS?=
 =?utf-8?B?S05HTDdiS251NkVwYnJZWUZ5RHdRN1pTaEt3b2hxZGxKeFk0WGtzUStYU1R3?=
 =?utf-8?B?VW1uVitZUzJGMHk4TjJOYkpRWGs3WUIzYjJ0OFZDT3lob0wyNWxqKzdDd0Ri?=
 =?utf-8?B?Nnpsejdma2llRnB3ZkZ5N0pYMDNSc1JFQ0dxQWRVRGZMeThjckI5UjFmY3U4?=
 =?utf-8?B?QXZsazFVc09VK21mNExFVVBjMFRtUUp1c0RiSkw0c1F5cG1nZlRNOFVONmpR?=
 =?utf-8?B?ZXJPUnBXYmY5aFVpTlpld2I4RytnREdGejQ0SkpQelRQZlBwOHJBUDBDY3lm?=
 =?utf-8?B?SHNBM01KS2hNcG1zWldBaFZwRVVXa0U0MlFoSDR0S05kSm9TSVBJbUpHZTRx?=
 =?utf-8?Q?m9Chhny+Ba+Lb9wQYzGSA/AN5dXTxo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U0J0R1NNUFZ6RW53WHRZY2lJUGdrSThHSjM1WGkwYmJoS3UySkNTYlIwL0l0?=
 =?utf-8?B?cTlvVW5YZjhUeFBZY3NnekhGVlpMSDdqNnpJaWx5R2xaSTdHK0MwM3l2V0dI?=
 =?utf-8?B?ejJYVWkybm9uR2RlTXBZZFJVQlZ5S1pwa1ZjbDVCMWF3UWtpV1VyVEdsdnVz?=
 =?utf-8?B?Qk1lR1pEL0dzenozVGgwTjJ6NXNzRDlZRGt3VVBSL3QxV01DL25rTEVFVnZr?=
 =?utf-8?B?VkpoU1lPMitHMElyVDJJWkNJeGpkSVdIU2U3M1NkMUxPM3IvNjBWUXFzbVdN?=
 =?utf-8?B?aHhBUUszZW5vRU9XT0tuT2M4dDVIcCtTMHczRW95M1d4YTJMUTJSZDV0bWox?=
 =?utf-8?B?a0J5NXBRbmExdzFXSDBmYjFLVXlPZjJuYWVnVVRsMUlXdnkvR3QyZE4xeGpn?=
 =?utf-8?B?THpKclNST2ZON3YvNEZDUEVoTnhqZFZobGl2SDE2Y2hTUnlyOWV2djEzUHJx?=
 =?utf-8?B?UGtwUEpXcjZDVEU5Q0lPMHJNcDJhWTUrY29RVEpEOTU0dXVYUUJzTWluQXk4?=
 =?utf-8?B?bFJYREpHMy9PLzlBMkgvOE54Z2l3NUZoMlRrQlJxYmlYbWp2Njg4UStNK3Vx?=
 =?utf-8?B?bk9uN1ZRbEFJemtNZHlReEt1T0hqM0hCNWVuWjJYSm56SlIrbWVTczFadCtx?=
 =?utf-8?B?U0JreXJvdWdDN09sNHowTGY0WGNrMk9Cb05aMFZOdmYwbUpUT2pUT2Y2TmM3?=
 =?utf-8?B?TDByRFRVS3FqbUJ2K0FDakhVWFpyNXlRMTg2ZHBGTVZMMWZHSFZpOFd1U1gr?=
 =?utf-8?B?TEdOOUY3SGcyLzQ4WmY4NUV3bThudkphcDVwSSthNEtIVmQwYmZTU0ZLTnlI?=
 =?utf-8?B?TjdyelpXWnQrb1l5clVoSGFiazFsZ3VLaDA2NWZGOXA1bjN3YlBNd0lXQzFr?=
 =?utf-8?B?QTJHUlZZV1g2RTBxYlBGSXh4MFVYNkJsajhYTmRoN3ZHdjhzRkEyMG9QTDlN?=
 =?utf-8?B?WFlYL3FxeUhkR0xqRFYxV2Q0TG9Lb2JEY2JOeHBkdmpMM0FKUTlXdHArUUxw?=
 =?utf-8?B?VzRHSHlzdWVNMUh5end2RGQvUkFkRkY5RjhyTzh6RXFtQi82cU44aWo0UFE5?=
 =?utf-8?B?SHl5UmlCYmU2Z3ZSOUc5eEJCakNaSW51Zmt0ZlFueEpGdUY0bEtJajdTaFBB?=
 =?utf-8?B?bFo0TTVoUm1jOXBEcW1UbWFWUTBoQ3RrbHdXdTBHZlBVQzlGK25BczhHUTJQ?=
 =?utf-8?B?QmdXT3piaEZ3Y3FEVi9RTFZOWnFRTWYyU2V1TEgrZ1BFVFdHdzc0UHF6Y0Zy?=
 =?utf-8?B?dnNjZnZmaUVQMFh0QjlkQzBOTmxmdENCckxTNVc5cEN0OU9taUwwS2Uzb2JF?=
 =?utf-8?B?cTN0dFRCZVBHRTNSSUpzV2IySXErM3FPeWJKYkh2cGdRZFN6RFR4aXFYdXJI?=
 =?utf-8?B?am42NU1LelErSHM0QXZ4cnltNWZzMzUvL0VGbWpkWUlJaGZ3aU5Td3R5cHhr?=
 =?utf-8?B?b0tyR1Z3eE5XNXFVamJySWJPandBWVJlZWkzRldzbmtVSUlzTmpYSTdUbVhi?=
 =?utf-8?B?QXZGbEh2ZlNGMVFxWVBOZ1FFSk1FOWRUV0xJSk5MZG12U3VzaFZNaGJOQ3NV?=
 =?utf-8?B?SHVSbDFqWUtiVVcrdVYva3NCRXFEOWp6S0JmbTYrdFhaWFdVLzFZbGg2S2xs?=
 =?utf-8?B?SHBKcjZaSnBmYkNYUVlSS2lmMzFuNjdhQk10U3UyNzAvaDlDVVJQN3J4RlFT?=
 =?utf-8?B?cXN1Z0xqWlY2Vnh0VVM4RDZuUEd3RHhnY2NiR0ZUZXVoUzlxeC9FODgzZllm?=
 =?utf-8?B?Z21jdllFMXVMYXBLRDJXUk16QTZxb0JZeDRNR1VlV2Zrc0pHSjQ1SVh5Nzcz?=
 =?utf-8?B?VG96ZTdqSi9CZjVYNzY3QXlvUEhIcnVHQUlnVzdRblk3S2hYUWgyUnE4NDZ4?=
 =?utf-8?B?NXhGVUo4bnA3enM4WUN6cVZ3d3hCOUlVcG1lZWg4L29sV2ZacnlWZXdPS3Fs?=
 =?utf-8?B?bkhWUFQ2Zk5GMW1GRjNYczR5eVMxUTZMTjlsdk82MGswR0ZiWFVoUFRYUEh2?=
 =?utf-8?B?RXlpMm05a2JVRGo5VTFEVThzYVY5akd6Z0E4Q3RxT3lhVzZiMnBwM3BKOFp4?=
 =?utf-8?B?U2VZVURNNk5oL0I2TXpUaVN1MDJsN2xGQzZ0TmVHMDRqNVYzeDM3YkVQRDZq?=
 =?utf-8?B?K2xnVElCUE1QU2ptTUZXVnNVamxjeTBjUGlCSjBBLzFFajlmQzhNanhHdlV2?=
 =?utf-8?B?YlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <79629F245A8A584186BAF05CF74E336A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e7542fe-619b-45a3-3bbf-08dda9401b69
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2025 23:31:35.9100 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XaGmkGOWMJB0c2v+7SLYJun6l9mxCIoPch7PhSmtzl3LppdoxiVzLurx26v+msFEZUXXJSTO48R2FdVjF1d6/dNzuDMI/D8uq9fDdHi/MWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6960
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

T24gV2VkLCAyMDI1LTA2LTExIGF0IDE4OjAyIC0wNTAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IE9uIEZyaSwgSnVuIDA2LCAyMDI1IGF0IDA3OjA5OjM5UE0gLTA1MDAsIEx1Y2FzIERlIE1h
cmNoaSB3cm90ZToNCj4gPiBPbiBXZWQsIEp1biAwNCwgMjAyNSBhdCAxMjowNjo1MkFNICswMDAw
LCBTdHVhcnQgU3VtbWVycyB3cm90ZToNCj4gPiA+IE9uIFR1ZSwgMjAyNS0wNi0wMyBhdCAxMzoz
MSAtMDcwMCwgQmVsZ2F1bWthciwgVmluYXkgd3JvdGU6DQo+ID4gPiA+IA0KPiA+ID4gPiBPbiA2
LzMvMjAyNSAxMjozMSBQTSwgU3VtbWVycywgU3R1YXJ0IHdyb3RlOg0KPiA+ID4gPiA+IE9uIFR1
ZSwgMjAyNS0wNi0wMyBhdCAxMTo0MSAtMDcwMCwgQmVsZ2F1bWthciwgVmluYXkgd3JvdGU6DQo+
ID4gPiA+ID4gPiBPbiA2LzMvMjAyNSAxMDozNiBBTSwgU3VtbWVycywgU3R1YXJ0IHdyb3RlOg0K
PiA+ID4gPiA+ID4gPiBPbiBNb24sIDIwMjUtMDYtMDIgYXQgMTY6NDQgLTA3MDAsIFZpbmF5IEJl
bGdhdW1rYXINCj4gPiA+ID4gPiA+ID4gd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gU2V0IEdUIG1p
biBmcmVxdWVuY3kgdG8gMTIwME1oeiBvbmNlIGRyaXZlciBsb2FkIGlzDQo+ID4gPiA+ID4gPiA+
ID4gY29tcGxldGUuDQo+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gdjI6IFJldmll
dyBjb21tZW50cyAoUm9kcmlnbykNCj4gPiA+ID4gPiA+ID4gPiB2MzogQXBwbHkgV2EgZWFybGll
ciBzbyB1c2VyX3JlcV9taW4gaXMgbm90IGNsb2JiZXJlZC4NCj4gPiA+ID4gPiA+ID4gPiANCj4g
PiA+ID4gPiA+ID4gPiBDYzogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4N
Cj4gPiA+ID4gPiA+ID4gPiBDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29t
Pg0KPiA+ID4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFZpbmF5IEJlbGdhdW1rYXINCj4gPiA+
ID4gPiA+ID4gPiA8dmluYXkuYmVsZ2F1bWthckBpbnRlbC5jb20+DQo+ID4gPiA+ID4gPiA+ID4g
LS0tDQo+ID4gPiA+ID4gPiA+ID4gwqDCoMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19wYy5j
wqDCoMKgwqAgfCA1ICsrKysrDQo+ID4gPiA+ID4gPiA+ID4gwqDCoMKgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3dhX29vYi5ydWxlcyB8IDEgKw0KPiA+ID4gPiA+ID4gPiA+IMKgwqDCoDIgZmlsZXMg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfcGMuYw0KPiA+ID4gPiA+
ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19wYy5jDQo+ID4gPiA+ID4gPiA+ID4g
aW5kZXggMThjNjIzOTkyMDM1Li5jYjA1NjM0OTRmY2MgMTAwNjQ0DQo+ID4gPiA+ID4gPiA+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19wYy5jDQo+ID4gPiA+ID4gPiA+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19wYy5jDQo+ID4gPiA+ID4gPiA+ID4gQEAgLTUx
LDYgKzUxLDcgQEANCj4gPiA+ID4gPiA+ID4gPiDCoMKgDQo+ID4gPiA+ID4gPiA+ID4gwqDCoMKg
I2RlZmluZSBMTkxfTUVSVF9GUkVRX0NBUMKgwqDCoMKgwqDCoDgwMA0KPiA+ID4gPiA+ID4gPiA+
IMKgwqDCoCNkZWZpbmUgQk1HX01FUlRfRlJFUV9DQVDCoMKgwqDCoMKgwqAyMTMzDQo+ID4gPiA+
ID4gPiA+ID4gKyNkZWZpbmUgQk1HX01JTl9GUkVRwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDEyMDAN
Cj4gPiA+ID4gPiA+ID4gPiDCoMKgDQo+ID4gPiA+ID4gPiA+ID4gwqDCoMKgI2RlZmluZSBTTFBD
X1JFU0VUX1RJTUVPVVRfTVMgNSAvKiByb3VnaGx5IDVtcywgYnV0DQo+ID4gPiA+ID4gPiA+ID4g
bm8NCj4gPiA+ID4gPiA+ID4gPiBuZWVkIGZvcg0KPiA+ID4gPiA+ID4gPiA+IHByZWNpc2lvbiAq
Lw0KPiA+ID4gPiA+ID4gPiA+IMKgwqDCoCNkZWZpbmUgU0xQQ19SRVNFVF9FWFRFTkRFRF9USU1F
T1VUX01TIDEwMDAgLyogVG8gYmUNCj4gPiA+ID4gPiA+ID4gPiB1c2VkDQo+ID4gPiA+ID4gPiA+
ID4gb25seQ0KPiA+ID4gPiA+ID4gPiA+IGF0DQo+ID4gPiA+ID4gPiA+ID4gcGNfc3RhcnQgKi8N
Cj4gPiA+ID4gPiA+ID4gPiBAQCAtODQzLDYgKzg0NCw5IEBAIHN0YXRpYyBpbnQNCj4gPiA+ID4g
PiA+ID4gPiBwY19hZGp1c3RfZnJlcV9ib3VuZHMoc3RydWN0DQo+ID4gPiA+ID4gPiA+ID4geGVf
Z3VjX3BjDQo+ID4gPiA+ID4gPiA+ID4gKnBjKQ0KPiA+ID4gPiA+ID4gPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgaWYgKHBjX2dldF9taW5fZnJlcShwYykgPiBwYy0+cnAwX2ZyZXEpDQo+ID4gPiA+
ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gcGNfc2V0
X21pbl9mcmVxKHBjLCBwYy0NCj4gPiA+ID4gPiA+ID4gPiA+cnAwX2ZyZXEpOw0KPiA+ID4gPiA+
ID4gPiA+IMKgwqANCj4gPiA+ID4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqBpZiAoWEVfV0EocGNf
dG9fZ3QocGMpLCAxNDAyMjA4NTg5MCkpDQo+ID4gPiA+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHJldCA9IHBjX3NldF9taW5fZnJlcShwYywNCj4gPiA+ID4gPiA+ID4g
PiBtYXgoQk1HX01JTl9GUkVRLA0KPiA+ID4gPiA+ID4gPiA+IHBjX2dldF9taW5fZnJlcShwYykp
KTsNCj4gPiA+ID4gPiA+ID4gRG8gd2Ugd2FudCB0aGlzIGFib3ZlIHRoZSBnZXRfbWluX2ZyZXEo
KSBjYWxsIGFib3ZlPw0KPiA+ID4gPiA+ID4gPiBTZWVtcyBsaWtlDQo+ID4gPiA+ID4gPiA+IHRo
YXQNCj4gPiA+ID4gPiA+ID4gd291bGQgZnVydGhlciBsaW1pdCB3aGljaCBpcyB3aGF0IHdlJ2Qg
d2FudCBpbiB0aGF0IGNhc2UNCj4gPiA+ID4gPiA+ID4gcmlnaHQ/DQo+ID4gPiA+ID4gPiBObywg
dGhpcyBpcyBkdXJpbmcgU0xQQyBpbml0LCB3ZSBkb24ndCBuZWVkIHRvIHJlYWQgdGhlIG1pbg0K
PiA+ID4gPiA+ID4gZnJlcQ0KPiA+ID4gPiA+ID4gYXQNCj4gPiA+ID4gPiA+IHRoaXMNCj4gPiA+
ID4gPiA+IHBvaW50LiBXZSB3aWxsIGFkanVzdCBpdCBsYXRlciBpbiB0aGUgZmxvdyBpZiB0aGVy
ZSB3YXMgYQ0KPiA+ID4gPiA+ID4gdXNlcg0KPiA+ID4gPiA+ID4gcmVxdWVzdC4NCj4gPiA+ID4g
DQo+ID4gPiA+IFRoaXMgZW5zdXJlcyBtaW4gZnJlcXVlbmN5IGlzIHNldCB0byAxMjAwLiBUaGF0
IGlzIHJlcXVpcmVkIGJ5DQo+ID4gPiA+IHRoZQ0KPiA+ID4gPiBXQS4NCj4gPiA+ID4gSWYgdGhl
cmUgd2FzIG5vIHByZXZpb3VzIHVzZXIgcmVxdWVzdCAobGlrZSBiZWZvcmUgYSBHVCByZXNldCks
DQo+ID4gPiA+IHRoZQ0KPiA+ID4gPiBtaW4NCj4gPiA+ID4gd2lsbCBiZSBzZXQgdG8gMTIwMCBp
bnN0ZWFkIG9mIHRoZSB1c3VhbCBSUGUgKHdoaWNoIGlzIGFyb3VuZA0KPiA+ID4gPiA1MDApLg0K
PiA+ID4gDQo+ID4gPiBPayBtYWtlcyBzZW5zZSB0byBtZS4gSSBkaWQgY29uZmlybSB0aGUgd29y
a2Fyb3VuZCBmcmVxdWVuY3kNCj4gPiA+IGNhbGxlZCBvdXQNCj4gPiA+IGluIGJzcGVjIG1hdGNo
ZXMgaGVyZToNCj4gPiA+IFJldmlld2VkLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1l
cnNAaW50ZWwuY29tPg0KPiA+IA0KPiA+IGJ1dCB3aHkgZG8gd2UgZG8gMiBybXcgaW5zdGVhZCBv
ZiAxPyBTb21ldGhpbmcgbGlrZSB0aGlzDQo+ID4gDQo+ID4gwqDCoMKgwqDCoMKgwqDCoHUzMiBt
aW5fZnJlcTsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgLi4uDQo+ID4gDQo+ID4gwqDCoMKgwqDCoMKg
wqDCoC8qDQo+ID4gwqDCoMKgwqDCoMKgwqDCoCAqIFNhbWUgdGhpbmcgaGFwcGVucyBmb3IgU2Vy
dmVyIHBsYXRmb3JtcyB3aGVyZSBtaW4gaXMNCj4gPiBsaXN0ZWQgYXMNCj4gPiDCoMKgwqDCoMKg
wqDCoMKgICogUlBNYXgNCj4gPiDCoMKgwqDCoMKgwqDCoMKgICovDQo+ID4gwqDCoMKgwqDCoMKg
wqDCoG1pbl9mcmVxID0gbWluKHBjX2dldF9taW5fZnJlcShwYyksIHBjLT5ycDBfZnJlcSk7DQo+
ID4gDQo+ID4gwqDCoMKgwqDCoMKgwqDCoC8qIEJ1dCBzaG91bGRuJ3QgZ28gdG8gbGVzcyB0aGFu
IEJNR19NSU5fRlJFUSBvbiBhZmZlY3RlZA0KPiA+IHBsYXRmb3JtcyAqLw0KPiA+IMKgwqDCoMKg
wqDCoMKgwqBpZiAoWEVfV0EocGNfdG9fZ3QocGMpLCAxNDAyMjA4NTg5MCkpDQo+ID4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBtaW5fZnJlcSA9IG1heChCTUdfTUlOX0ZSRVEsIG1p
bl9mcmVxKTsNCj4gPiANCj4gPiDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gcGNfc2V0X21pbl9mcmVx
KHBjLCBtaW5fZnJlcSk7DQo+IA0KPiBodW1uLi4uIGJ1dCB0aGF0IHdvdWxkIG1lYW4gd2Ugd291
bGQgYWx3YXlzIGhhdmUgYSBjYWxsIHRvDQo+IHBjX3NldF9taW5fZnJlcSgpLCBldmVuIGlmIG5v
dCBuZWVkZWQsIGkuZS4NCj4gcGNfZ2V0X21pbl9mcmVxKCkgPD0gcGMtPnJwMF9mcmVxIGFuZCBm
b3IgcGxhdGZvcm1zIGFmZmVjdGVkIGJ5DQo+IDE0MDIyMDg1ODkwLCBwY19nZXRfbWluX2ZyZXEo
KSA+PSBCTUdfTUlOX0ZSRVEuDQo+IA0KPiBzdGlsbCB0cnlpbmcgdG8gZmlndXJlIG91dCBvbmUg
dGhpbmcgdGhvdWdoOiBpbiBCTUcgdGhpcyB3aWxsIGFwcGx5DQo+IG9ubHkNCj4gdG8gdGhlIG1h
aW4gZ3QuIG1lZGlhIGd0IHdpbGwgbm90IHNldCBpdCBhbmQgc2luY2UgcGMgaXMgcGVyIGd0LCBp
dCdzDQo+IG5vdCB0aGUgY29ycmVjdCB0aGluZyB0byBkby4NCj4gDQo+IE1hdHQgUm9wZXIsIHdo
YXQgYWJvdXQgYWRkIHRoZSBkaWZmIGJlbG93P8KgIFVudGVzdGVkLCB3aWxsIGRvIGxhdGVyDQo+
IHRvZGF5Lg0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19w
Yy5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3BjLmMNCj4gPiBpbmRleCAzODYx
ZTk0NzM4N2ZkLi4wNGUxMTJjNzUxMDk2IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndWNfcGMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfcGMu
Yw0KPiA+IEBAIC04MTgsNiArODE4LDcgQEAgdm9pZCB4ZV9ndWNfcGNfaW5pdF9lYXJseShzdHJ1
Y3QgeGVfZ3VjX3BjICpwYykNCj4gPiDCoA0KPiA+IMKgc3RhdGljIGludCBwY19hZGp1c3RfZnJl
cV9ib3VuZHMoc3RydWN0IHhlX2d1Y19wYyAqcGMpDQo+ID4gwqB7DQo+ID4gK8KgwqDCoMKgwqDC
oCBzdHJ1Y3QgeGVfdGlsZSAqdGlsZSA9IGd0X3RvX3RpbGUocGNfdG9fZ3QocGMpKTsNCj4gPiDC
oMKgwqDCoMKgwqDCoCBpbnQgcmV0Ow0KPiA+IMKgDQo+ID4gwqDCoMKgwqDCoMKgwqAgbG9ja2Rl
cF9hc3NlcnRfaGVsZCgmcGMtPmZyZXFfbG9jayk7DQo+ID4gQEAgLTg0NCw3ICs4NDUsNyBAQCBz
dGF0aWMgaW50IHBjX2FkanVzdF9mcmVxX2JvdW5kcyhzdHJ1Y3QNCj4gPiB4ZV9ndWNfcGMgKnBj
KQ0KPiA+IMKgwqDCoMKgwqDCoMKgIGlmIChwY19nZXRfbWluX2ZyZXEocGMpID4gcGMtPnJwMF9m
cmVxKQ0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBwY19zZXRfbWlu
X2ZyZXEocGMsIHBjLT5ycDBfZnJlcSk7DQo+ID4gwqANCj4gPiAtwqDCoMKgwqDCoMKgIGlmIChY
RV9XQShwY190b19ndChwYyksIDE0MDIyMDg1ODkwKSkNCj4gPiArwqDCoMKgwqDCoMKgIGlmIChY
RV9XQSh0aWxlLT5wcmltYXJ5X2d0LCAxNDAyMjA4NTg5MCkpDQoNCkkgZGlkbid0IHNlZSBhbnl0
aGluZyBpbiBic3BlYyB0aGF0IGV4cGxpY2l0bHkgY2FsbGVkIG91dCBtZWRpYSB2cyBub24tDQpt
ZWRpYS4gV2hlcmUgYXJlIHlvdSBnZXR0aW5nIHRoYXQgaGVyZT8NCg0KVGhhbmtzLA0KU3R1YXJ0
DQoNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gcGNfc2V0X21pbl9m
cmVxKHBjLCBtYXgoQk1HX01JTl9GUkVRLA0KPiA+IHBjX2dldF9taW5fZnJlcShwYykpKTsNCj4g
PiDCoA0KPiA+IMKgb3V0Og0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
d2Ffb29iLnJ1bGVzDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2Ffb29iLnJ1bGVzDQo+
ID4gaW5kZXggYmRhMDI1YWI5MDBkYS4uMzhiNTg5ZmU5MTk4ZCAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfd2Ffb29iLnJ1bGVzDQo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3dhX29vYi5ydWxlcw0KPiA+IEBAIC01OSw0ICs1OSw3IEBAIG5vX21lZGlhX2wz
wqDCoCBNRURJQV9WRVJTSU9OKDMwMDApDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIE1FRElBX1ZFUlNJT05fUkFOR0UoMTMwMSwgMzAwMCkNCj4gPiDCoDE2MDI2NTA4NzA4wqDC
oMKgIEdSQVBISUNTX1ZFUlNJT05fUkFOR0UoMTIwMCwgMzAwMSkNCj4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgTUVESUFfVkVSU0lPTl9SQU5HRSgxMzAwLCAzMDAwKQ0KPiA+ICsN
Cj4gPiArIyBTb0Mgd29ya2Fyb3VuZCAtIHNob3VsZCBhcHBseSB0byBhbGwgcGxhdGZvcm1zIHVz
aW5nIHRoaXMNCj4gPiArIyBncmFwaGljcyB2ZXJzaW9uIGluIHRpbGUtPnByaW1hcnlfZ3QNCj4g
PiDCoDE0MDIyMDg1ODkwwqDCoMKgIEdSQVBISUNTX1ZFUlNJT04oMjAwMSkNCj4gDQo+IEx1Y2Fz
IERlIE1hcmNoaQ0KDQo=
