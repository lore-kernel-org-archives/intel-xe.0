Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F50CD6E5D
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 11:43:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073BE11A790;
	Fri,  5 Jun 2026 11:43:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lfAy5NRl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF3511A790
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 11:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780659815; x=1812195815;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=QKQxPQTfvuMWRPKkl2pHr3UEoU6Zc2KoktKiDlQ5NdU=;
 b=lfAy5NRlbNSlD4U6O8oqVAUg4ZhAE1506Scf1RAfBFdHXiRylii+fcuN
 tDpQW8IsQENMMd+kj1exNcV/s76xa/s8q0Er8SfnqjpBd6rZgEDyYa8vM
 aLY/vAdW8u+NGhzjBebuGnkkrA9F0WHrpzMa/cQM0e3F82XjabGdU8wQl
 zKi/YDOls4XsgTq9LdjWJeePwVXt/cOBBlSPpZzXY7CrASKBw//nnUd3z
 JC1jCNkj52kxcDA4QtEE1bFXxHvE4WXmqzTAyYib8lSkbhxEabX99VzMB
 OKIgdecAI52utVEjgqPjephU+UVv/V86lzXQyiSwVw02FOL0Ulh9H8js4 Q==;
X-CSE-ConnectionGUID: k0L53zGQTsSa6trHZkpLHg==
X-CSE-MsgGUID: 4X3mDRNHS8m++qPT4+y0MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="92601625"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="92601625"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 04:43:34 -0700
X-CSE-ConnectionGUID: 9ks0LFsiQd+c0SIuwV8NPA==
X-CSE-MsgGUID: 1zGR/U21SwGWAxIg4HxwDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="244688515"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 04:43:34 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 5 Jun 2026 04:43:33 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 5 Jun 2026 04:43:33 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.66) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 5 Jun 2026 04:43:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R2a6rBk2sqG5tCvcCMEyHz0tLcVYJD8yZ5yH+W8Rms7uNHEf6Ps8Mzx3Q7f4M07gB43qcUTW/SVV5fF06bHnuFr1usDxbTleKWdcjUCnkEoAgs4xAKJ3CaTxhwRPCsPFSORILwhyVg3gitEQhCbaFfXCUjugrLUFcQqVJlnDei5Bql5CRtS7vRPrzDHgk6aNgPvD3KHyg0WlwZLFHpPsEWSovRtVEaQicILUWQkSqWr2tz8kieLxb74gKD3NSov1HK4SwWnKus4XqHU6YXoYKKTUhHxMYAUl57iJb4M9H8lkSxlMXGzo3CjO/aFAdlt5c4MPm+Qdl/cI5PCQ1pJa0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKQxPQTfvuMWRPKkl2pHr3UEoU6Zc2KoktKiDlQ5NdU=;
 b=DEejP7RyyKaJ2Zqe4KHGdNB2QIr8AVW8orpgOs9Krgojq0SdcYZIkv17xnR60vrKc36vfnkRsnu9MNpxV5R+mB2biIyIds4WlHn95Y32m/ejKrXNq4TLzLzIN797IASZou029qWJZMty94vvb6+GnUdjWoGomiWAh4ZO7ze10SJy49uvTol9c4Nu0fb5tkUPtBzmPB3zQAPus9w+hoHmiXvB+bQxYoTOztW3zpec3gSQT0nCl7DEPs+3BKdafmLGinjdOn97bp59rC7Mr4K/oidbEAM228b4k0VcEQJAFfldel5Np9u8rUrU9UnH7UQlUoXwgjUckfaEojoQXP4yfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB7625.namprd11.prod.outlook.com (2603:10b6:806:305::12)
 by PH7PR11MB8273.namprd11.prod.outlook.com (2603:10b6:510:1ac::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Fri, 5 Jun 2026
 11:43:30 +0000
Received: from SA3PR11MB7625.namprd11.prod.outlook.com
 ([fe80::a120:f916:60ba:5ad3]) by SA3PR11MB7625.namprd11.prod.outlook.com
 ([fe80::a120:f916:60ba:5ad3%5]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 11:43:30 +0000
From: "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>, "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms
Thread-Topic: [PATCH] drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms
Thread-Index: AQHc84mVFY9lZ8jhSkeF2A35JOTWU7Yv0d0AgAADsrA=
Date: Fri, 5 Jun 2026 11:43:30 +0000
Message-ID: <SA3PR11MB762545D6D52F55B7F0A24D9BC8112@SA3PR11MB7625.namprd11.prod.outlook.com>
References: <20260603184752.3377539-1-tilak.tirumalesh.tangudu@intel.com>
 <aiKvksJNKwDH7dBW@bvivekan-mob1>
In-Reply-To: <aiKvksJNKwDH7dBW@bvivekan-mob1>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB7625:EE_|PH7PR11MB8273:EE_
x-ms-office365-filtering-correlation-id: c4164dd5-eb2e-4b11-8e17-08dec2f7aa5b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|10070799003|38070700021|3023799007|18002099003|22082099003|11063799006|4143699003|56012099006;
x-microsoft-antispam-message-info: 7YG1Y0xtznJwdvg3+lsfiWT2R27boW4Xn3vzI0KVUilttNksqeDhZVm+vQh6Icv+sR+2P9I0ykQwWYTxuDQmotEJuzaB2VTBCmKI0ovcDfffUDZPMmgNJkmQrQvK6zCr6sNwPOK2WDE35bbpFFp/syxNMxkbTxmlCsqiZZZijRNu6qY8+679gKhP3VDjyx1OkKUQBLsg3AMm44wdTj5f+/tLkFa2wLNqPYbIMGNaLSYoqAcm85CuK1AllsS0wHyCCHVeGtXbJ9YOBj55lI1sCdgfTjuHAJX0GFM6PEKEa3VAz8D3bcSdcq+MM/646ujpVc37AHCR/UchASfp5puCJYqgJcUeK/ilRQXBhFzcfuSdXjjACLr/bBWC38zJGZqY8vqnaPr8gq7rkCVlBWEM9n+umDQkCAtqVWSulP6o6MFsiLTBLNVwxiFDtu75OtXA4Apvyq5JnnPpCa8/n5jiRNwz25igh5Ux3MplujwCjis9HJ2CFnSX0HFkIYvywFFBm7N4Rgf8WXq0O/B5BoN37UxRPdetcV7z2tA9g26RoP7/nSIO8tV+ZwxvvIUvA1Lh+5W4hwjZnIcaLhWJWUUlywjP8Wheg93HJZIaZVRAnuCt1cHF+ZSJ7UNtwHP3BYO2SV9zoSPX/CLiSSSU1kirX9BmiZVicOwFa9ct4vqadbUQpKuealjcZgTxkEiwA+QE0TxK3xs2lX3+W7kOIF80Zd/wCIQEevE5xxwgFNvHn4KyMUJyjkWdMXNu1jG1w1xd
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7625.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(38070700021)(3023799007)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bGtSd0V3TTBnZXE1SEI5M1pTazc5SHBDbnl5UFNWWll5MUNKVDFiYndXK3dX?=
 =?utf-8?B?NkJwVHZEckgrVEZUZEUxRGFITmgzcUpvSDZLSm5WUGRCZGNQb09MT2pvR0Ur?=
 =?utf-8?B?S1NRZ1hCUGtucmFKaFhOMkp3cXE3RE1wWW1haUF2Vi9JajVFclZYMVRDRGJC?=
 =?utf-8?B?bDhxY1VCZEc3V0Y1eHZDdTI0eGFrTmY4dmc3b0lOOTRFM1o2TzFiMks5Rzhx?=
 =?utf-8?B?b0NUNUlFOXVKNmVmQU1WcWVBSEZZWDlHRGszYzBHaC9uYzFBdHhTMHR1UFFp?=
 =?utf-8?B?NkZ1NGVlc2MvRGhuRHBqV1o5VnB6NnV5RzdsanY1c0hzdnpmQTJoOWZMYzJu?=
 =?utf-8?B?Y2xVV2YyS3dkRWx6M1JLYitkbEc0T0FBU0ZCeHdoOUVrMGh0b2FLbFJOci9u?=
 =?utf-8?B?Z3hHbyt3cXdFTVNUUnl1d2RnTmhqQXlCelNnMnBQb2dEdkl2SkVkNVNraURR?=
 =?utf-8?B?ODB3L3JsUDljczVmZHBIank2UDVWV1JydzhGYmtrelVTaThZVVBqRGdXWGc5?=
 =?utf-8?B?OXJaMU5mZm41dmVCdTJEUzAxcWhjazJ4WVVnTThTRFBKVXBnTnNVVEVKZjRZ?=
 =?utf-8?B?UTN0UUdRV0JpcTN6QWcyYmFIRHBGOUVFYS9aMWtvT3VjWFVDNmd1aDdQNGU2?=
 =?utf-8?B?WVE4Z08rdWZzdGZscElpa2xkdTk5NnpTeDF2TTFxY1EzZjRDQzBjakk5OGJm?=
 =?utf-8?B?VHR3ZnFqVGI0NHZwMWhOZnhSOFZzcVg2YzRiRG9ZemhWZnk4ajhUcTVYdnZo?=
 =?utf-8?B?OEJDT2V5cEdrZFBLV2U3T1I0RENjZlI5Tmo1RUEySVdWdUxjOEw1UjFDdjFU?=
 =?utf-8?B?NUN5RXhpOFJsVjIvZElLK3pzTEUrTklSdzZQUWxGWXRSRWZObHRJWUc2UWdW?=
 =?utf-8?B?VWg1VDdmenJ6cElMcTZ5TnlYV0NZa3owVWhwMzBkeVZNYVQ0NTg2ZTZQSjNT?=
 =?utf-8?B?WVhTT2IyNGJ6TXkzUXVibU9lc3FKWTJsSkJFVWswVzd3cHAxNVg0ZUNwUVhz?=
 =?utf-8?B?YmtpMXRMOXRHK2h1UnA5dHlmbEgyaW1tNEFvQytsb2lySWlWSXFwN3JlSW9h?=
 =?utf-8?B?Wjg5WStvcU1hemdxRnpZWXJrKzJwbm4zckgyWVV1SCtvdEJNL1BvTEsrTmFl?=
 =?utf-8?B?ckkyTWdsNlRhbGQrclNFdlV2N1lFUDdQOXBFTXMrWmhYOVM3aDJFYys0dTZw?=
 =?utf-8?B?V3dvSE9EajVtM2piVkF6QlZmaWNzQ1BaKzJKUkEySHZWRHM3U29HSjVRaUpu?=
 =?utf-8?B?STBYWHFSVlg3N2hMK0lWbG9QTW5ZZzRDZmlxYmVwN2dZdHJCY2xiRDlmT2Rp?=
 =?utf-8?B?VXhPaTNvblVkVmhqVzI4K2hQVDBWMHIyNHFST3pVNUpNSmVNeGpmamJZbGNF?=
 =?utf-8?B?K1FKcVBjL2ZKeXZSNkQyb0drdjVVVjBTK2JKZ1MySGlseVcrUkZFTllMblFq?=
 =?utf-8?B?TzVvTDRmTU9MMExIaFdiS0J0S3BFclIzNjVtZkdBRXBqUS9qMTNualJyenVI?=
 =?utf-8?B?cklzRlpzczY0RnRGcHlPemYrVm9nQTBOME1Sd3dPaWk5U1phSWZGdVZQMlo3?=
 =?utf-8?B?ZWg0N0k4b1VPY3lUTmdOVDdqN2hidXJoN0s5bzIzcnlVeHN2amN0aC8wd0V5?=
 =?utf-8?B?d20rck80Y3pHb0V6WUxqZEUxNVlKOG1FSEhyL2FQMlU2QkFhNURKdW9FQjZy?=
 =?utf-8?B?K1ROV1grSm1oWktZVGd4c1g2NGF4bjBxUHVxclorSHdOVk1mNWRnTXQ0UDFG?=
 =?utf-8?B?Z1ZaVkNrSWZNTVFiK1dDczZDTHJwSGdxVzlWbFpkeFVEM2tGQm45cFZMV29C?=
 =?utf-8?B?SFYrcFc1eEZ4d0lsLzZnUmdwQkMwSWgyN2g1YXlwcnFUblRpbWFHdXpiNXVM?=
 =?utf-8?B?ZjI1SmxrWHMrd2Y1NzQzMnQ1Wkp6Qno4K3NNeWxWaVNkYm1NRlBpOGhEVGtp?=
 =?utf-8?B?R1JxdXZlVTVOOXV1SmhlRFhFVjU5ekJvaG5Zb1ZXZ3hlSVh5UjdtMmtoc20r?=
 =?utf-8?B?VUh6bm40NWZxWFMrMWd1V0doSm96TzZVY2pvYjRhWXZudldSY05hTnFkMjNz?=
 =?utf-8?B?MDRtQ2JMVG9GUG9ZY3VSMFlGclV1andnSEc2YWRQR0JFakc0cTNmOHhIWk9K?=
 =?utf-8?B?L08xMldaM09sQmFmUTR2dzNzNWl2TFRSK29hN3NQaU9IcVFMS1dDVEtGTzRG?=
 =?utf-8?B?aHg3NUxobDlEZk5aQk9hU3doaXE1NGdqVkJCTHg4YndjdXoza0lCOHpldmVM?=
 =?utf-8?B?aE5rR2ltMm9SaHh3S2dRWkprc2RpN2RxMXZqdzhzU09TaDJqanlITXdHUUNM?=
 =?utf-8?B?SlVqMGQzdHIrTFlvczN3R09qbFZRYkpPN0ZJMWNqcnhWZW9zRUU1ZzAzdWFs?=
 =?utf-8?Q?iG244ocxq3mVfVkUqnbSNzVohRte1CkrHR0MO/f+UwsGV?=
x-ms-exchange-antispam-messagedata-1: ARQhXYL7VCKaxCKuzO62cyn120+VsmR22wM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Q34w/EnIUNKZAGhvNcR5HiTXzBmo5UDRu3iOc+BTbZux2cvpuT28Ipb0iR4kig5a8uG8YYrW+RPADw/0Pmgh58mc+b75RWiI13oeAVDI4Q5TorQ+A5jhvM35kmka2+SInu5+9YYEg3M5riXjIFEw7i7hIAp+AVB5slpmIyxt18ofi5ilwBPdjGGWs+XFZ3ieKgzgPR2IEieDZPFv/RdcMsQ9DlQjvbIoiNbHzdlO2wjLxC6mPS9KeA1hHuq9bWuVUubnT4iNW93XHQuMF/7vneFdla2oKbONC+6Vo01z3Ifkvs3/3xRBmaLubyNpacquJlBAGO0fzdtfvHsS/qDadA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7625.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4164dd5-eb2e-4b11-8e17-08dec2f7aa5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2026 11:43:30.3699 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qNuoqAxZyiKOsxtwzGHxRE8+Cxn6q3sMKY75tEhJoSZm+3Rqc6f0+NvzwK0FexUmgXaV/lXROZlmnDrsSvH6g5kmsaSnsopG1lTTT6jEcBoEXq2+Ti16L5u0wgKpIBz0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8273
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

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBWaXZla2FuYW5kYW4sIEJhbGFz
dWJyYW1hbmkgPGJhbGFzdWJyYW1hbmkudml2ZWthbmFuZGFuQGludGVsLmNvbT4gDQpTZW50OiAw
NSBKdW5lIDIwMjYgMTY6NDQNClRvOiBUYW5ndWR1LCBUaWxhayBUaXJ1bWFsZXNoIDx0aWxhay50
aXJ1bWFsZXNoLnRhbmd1ZHVAaW50ZWwuY29tPjsgUm9wZXIsIE1hdHRoZXcgRCA8bWF0dGhldy5k
LnJvcGVyQGludGVsLmNvbT47IEJlbGdhdW1rYXIsIFZpbmF5IDx2aW5heS5iZWxnYXVta2FyQGlu
dGVsLmNvbT47IFVwYWRoeWF5LCBUZWphcyA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPjsgaW50
ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0veGU6
IEFkZCB3YV8xNDAyNTk0MTU4NyB0byB4ZTIsIHhlMyBhbmQgeGUzcCBwbGF0Zm9ybXMNCg0KT24g
MDQuMDYuMjAyNiAwMDoxNywgdGlsYWsudGlydW1hbGVzaC50YW5ndWR1QGludGVsLmNvbSB3cm90
ZToNCj4gRnJvbTogVGFuZ3VkdSBUaWxhayBUaXJ1bWFsZXNoIDx0aWxhay50aXJ1bWFsZXNoLnRh
bmd1ZHVAaW50ZWwuY29tPg0KPiANCj4gQXZvaWQgSURMRURMWSB0aW1lciBwcm9ncmFtbWluZyBs
ZXNzdGhhbiA1IG1pY3JvIHNlY3MuDQo+IEFwcGx5IHdhXzE0MDI1OTQxNTg3IHRvIEdyYXBoaWNz
IFZlcnNpb25zIDIwLjAxIHRvIDM1LjExIGFuZCBNZWRpYSANCj4gVmVyc2lvbnMgMTMuMDEgdG8g
MzUuMDMNCj4gDQo+IHYyOiBVc2UgeGVfcnRwX21hdGNoX25vdF9zcmlvdl92ZiwgbW92ZSB0byBs
b2NhbCB2YXJpYWJsZQ0KPiAgICAgUmVtb3ZlIHdhcm4gYW5kIG90aGVyIGtuaXRzICAgICAgICAg
ICAgLSBNYXR0IFINCj4gDQo+IHYzOiBBZGQgdmVyYm9zZSBjb21tZW50IC0gVGVqYXMNCj4gDQo+
IHY0OiBSZXN0b3JlIElETEVfRExZIHJlZ2lzdGVyIG9uIGVuZ2luZSByZXNldC4NCj4gICAgIEFk
ZCBpdCB0byBHVUMgc2F2ZS1yZXN0b3JlIGxpc3QuIC1WaXZlaw0KPiANCj4gdjU6IEV4dGVuZCBX
QSB0byBNZWRpYSBWZXJzaW9ucyAxMy4wMSB0byAzNS4wMyAtIFZpbmF5DQo+IHY2OiBBdm9pZCBj
bGVhcmluZyBpbmhpYml0IHN3aXRjaCAtIEJhbGENCj4gICAgIFJlZmFjdG9yIGNvZGUgYWNjb3Jk
aW5nbHkgYnkgYWRkaW5nIGlkbGVfcmVnX3ZhbC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFRhbmd1
ZHUgVGlsYWsgVGlydW1hbGVzaCANCj4gPHRpbGFrLnRpcnVtYWxlc2gudGFuZ3VkdUBpbnRlbC5j
b20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19hZHMuYyAgICB8ICAyICst
DQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMgIHwgNDkgDQo+ICsrKysrKysr
KysrKysrKysrKysrKysrKy0tLS0tLSAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhX29vYi5ydWxl
cyB8ICANCj4gMiArKw0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspLCAxMSBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Vj
X2Fkcy5jIA0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfYWRzLmMgaW5kZXggYzk4NDU0
NTQ1YTg1Li4yMDgwZTBlNjUwZWIgDQo+IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3VjX2Fkcy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfYWRzLmMN
Cj4gQEAgLTc2OCw3ICs3NjgsNyBAQCBzdGF0aWMgdW5zaWduZWQgaW50IGd1Y19tbWlvX3JlZ3Nl
dF93cml0ZShzdHJ1Y3QgeGVfZ3VjX2FkcyAqYWRzLA0KPiAgCQl9DQo+ICAJfQ0KPiAgDQo+IC0J
aWYgKFhFX0dUX1dBKGh3ZS0+Z3QsIDE2MDIzMTA1MjMyKSkNCj4gKwlpZiAoWEVfR1RfV0EoaHdl
LT5ndCwgMTYwMjMxMDUyMzIpIHx8IFhFX0dUX1dBKGh3ZS0+Z3QsIA0KPiArMTQwMjU5NDE1ODcp
KQ0KPiAgCQlndWNfbW1pb19yZWdzZXRfd3JpdGVfb25lKGFkcywgcmVnc2V0X21hcCwNCj4gIAkJ
CQkJICBSSU5HX0lETEVETFkoaHdlLT5tbWlvX2Jhc2UpLA0KPiAgCQkJCQkgIGNvdW50KyspOw0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5jIA0KPiBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYw0KPiBpbmRleCA5ODI2NTI5M2YyZGMuLjAz
ZTk3N2Y0ZWIyNCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2lu
ZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYw0KPiBAQCAtNTc4
LDI1ICs1NzgsNTQgQEAgc3RhdGljIHZvaWQgaHdfZW5naW5lX2luaXRfZWFybHkoc3RydWN0IHhl
X2d0IA0KPiAqZ3QsIHN0cnVjdCB4ZV9od19lbmdpbmUgKmh3ZSwgIHN0YXRpYyB2b2lkIGFkanVz
dF9pZGxlZGx5KHN0cnVjdCANCj4geGVfaHdfZW5naW5lICpod2UpICB7DQo+ICAJc3RydWN0IHhl
X2d0ICpndCA9IGh3ZS0+Z3Q7DQo+IC0JdTMyIGlkbGVkbHksIG1heGNudDsNCj4gKwl1MzIgaWRs
ZWRseSwgaWRsZWRseV9yZWdfdmFsLCBtYXhjbnQ7DQo+ICAJdTMyIGlkbGVkbHlfdW5pdHNfcHMg
PSA4ICogZ3QtPmluZm8udGltZXN0YW1wX2Jhc2U7DQo+ICAJdTMyIG1heGNudF91bml0c19ucyA9
IDY0MDsNCj4gLQlib29sIGluaGliaXRfc3dpdGNoID0gMDsNCj4gKwlib29sIGluaGliaXRfc3dp
dGNoID0gZmFsc2U7DQo+ICsJYm9vbCB3YV9hcHBsaWVkID0gZmFsc2U7DQo+ICANCj4gLQlpZiAo
IUlTX1NSSU9WX1ZGKGd0X3RvX3hlKGh3ZS0+Z3QpKSAmJiBYRV9HVF9XQShndCwgMTYwMjMxMDUy
MzIpKSB7DQo+IC0JCWlkbGVkbHkgPSB4ZV9tbWlvX3JlYWQzMigmZ3QtPm1taW8sIFJJTkdfSURM
RURMWShod2UtPm1taW9fYmFzZSkpOw0KPiArCWlmICgoIUlTX1NSSU9WX1ZGKGd0X3RvX3hlKGh3
ZS0+Z3QpKSAmJiBYRV9HVF9XQShndCwgMTYwMjMxMDUyMzIpKSB8fA0KPiArCSAgICBYRV9HVF9X
QShndCwgMTQwMjU5NDE1ODcpKSB7DQo+ICsJCXUzMiBtaW5jbnRfaWRsZWRseV9ucyA9IDUwMDA7
DQo+ICsNCj4gKwkJaWRsZWRseV9yZWdfdmFsID0geGVfbW1pb19yZWFkMzIoJmd0LT5tbWlvLCAN
Cj4gK1JJTkdfSURMRURMWShod2UtPm1taW9fYmFzZSkpOw0KPiAgCQltYXhjbnQgPSB4ZV9tbWlv
X3JlYWQzMigmZ3QtPm1taW8sIA0KPiBSSU5HX1BXUkNUWF9NQVhDTlQoaHdlLT5tbWlvX2Jhc2Up
KTsNCj4gIA0KPiAtCQlpbmhpYml0X3N3aXRjaCA9IGlkbGVkbHkgJiBJTkhJQklUX1NXSVRDSF9V
TlRJTF9QUkVFTVBURUQ7DQo+IC0JCWlkbGVkbHkgPSBSRUdfRklFTERfR0VUKElETEVfREVMQVks
IGlkbGVkbHkpOw0KPiArCQlpbmhpYml0X3N3aXRjaCA9IGlkbGVkbHlfcmVnX3ZhbCAmIElOSElC
SVRfU1dJVENIX1VOVElMX1BSRUVNUFRFRDsNCj4gKwkJaWRsZWRseSA9IFJFR19GSUVMRF9HRVQo
SURMRV9ERUxBWSwgaWRsZWRseV9yZWdfdmFsKTsNCj4gIAkJaWRsZWRseSA9IERJVl9ST1VORF9D
TE9TRVNUKGlkbGVkbHkgKiBpZGxlZGx5X3VuaXRzX3BzLCAxMDAwKTsNCj4gIAkJbWF4Y250ID0g
UkVHX0ZJRUxEX0dFVChJRExFX1dBSVRfVElNRSwgbWF4Y250KTsNCj4gIAkJbWF4Y250ICo9IG1h
eGNudF91bml0c19uczsNCj4gIA0KPiAtCQlpZiAoeGVfZ3RfV0FSTl9PTihndCwgaWRsZWRseSA+
PSBtYXhjbnQgfHwgaW5oaWJpdF9zd2l0Y2gpKSB7DQo+IC0JCQlpZGxlZGx5ID0gRElWX1JPVU5E
X0NMT1NFU1QoKChtYXhjbnQgLSAxKSAqIDEwMDApLA0KPiAtCQkJCQkJICAgIGlkbGVkbHlfdW5p
dHNfcHMpOw0KPiAtCQkJeGVfbW1pb193cml0ZTMyKCZndC0+bW1pbywgUklOR19JRExFRExZKGh3
ZS0+bW1pb19iYXNlKSwgaWRsZWRseSk7DQo+ICsJCS8qIFdhXzE0MDI1OTQxNTg3OiBhcHBsaWVk
IHByaW9yIHRvIFdhXzE2MDIzMTA1MjMyLA0KPiArCQkgKiBhcyB0aGUgbGF0dGVyIGhhcyBoaWdo
ZXIgcHJpb3JpdHksIGFsdGhvdWdoIGNvbmZsaWN0DQo+ICsJCSAqIGlzIG5vdCBleHBlY3RlZC4N
Cj4gKwkJICovDQo+ICsJCWlmIChYRV9HVF9XQShndCwgMTQwMjU5NDE1ODcpICYmDQo+ICsJCSAg
ICBpZGxlZGx5IDwgbWluY250X2lkbGVkbHlfbnMpIHsNCj4gKwkJCWlkbGVkbHkgPSBtaW5jbnRf
aWRsZWRseV9uczsNCj4gKwkJCXdhX2FwcGxpZWQgPSB0cnVlOw0KPiArCQl9DQo+ICsNCj4gKwkJ
aWYgKFhFX0dUX1dBKGd0LCAxNjAyMzEwNTIzMikgJiYNCj4gKwkJICAgIHhlX2d0X1dBUk5fT04o
Z3QsIGlkbGVkbHkgPj0gbWF4Y250IHx8IGluaGliaXRfc3dpdGNoKSkgew0KPiArCQkJaWRsZWRs
eSA9IChtYXhjbnQgLSAxKTsNCj4+V2Ugd291bGQgZW50ZXIgdGhpcyBjb25kaXRpb24gZXZlbiB3
aGVuIGluaGliaXRfc3dpdGNoID0gMSwgc28gd2Ugc2hvdWxkIGhhdmUgYW5vdGhlciA+PmNvbmRp
dGlvbiBiZWZvcmUgdXBkYXRpbmcgaWRsZWRseS4NCkkgaGF2ZSBsZWZ0IHByZXZpb3VzIFdBIDE2
MDIzMTA1MjMyIHNlbWFudGljcyB1bmRpc3R1cmJlZC4NCg0KPiArCQkJd2FfYXBwbGllZCA9IHRy
dWU7DQo+ICsJCQkvKiBpbmhpYml0X3N3aXRjaCBvdmVycmlkZSB0byBrZWVwDQo+ICsJCQkgKiBz
ZW1hbnRpY3Mgb2YgV2FfMTYwMjMxMDUyMzINCj4gKwkJCSAqLw0KDQotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tDQo+ICsJCQlpZiAoaW5oaWJpdF9zd2l0Y2gpDQo+ICsJCQkJaWRsZWRs
eV9yZWdfdmFsICY9IH5JTkhJQklUX1NXSVRDSF9VTlRJTF9QUkVFTVBURUQ7DQo+ICsJCX0NCj4g
Kw0KPiArCQlpZiAod2FfYXBwbGllZCkgew0KPiArCQkJaWRsZWRseV9yZWdfdmFsICY9IH5JRExF
X0RFTEFZOw0KPiArCQkJaWRsZWRseV9yZWdfdmFsIHw9IFJFR19GSUVMRF9QUkVQKElETEVfREVM
QVksDQo+ICsJCQkJCQkgRElWX1JPVU5EX0NMT1NFU1QoaWRsZWRseSAqIDEwMDAsDQo+ICsJCQkJ
CQkJCSAgIGlkbGVkbHlfdW5pdHNfcHMpKTsNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0NCg0KPlRoZSBhYm92ZSBjaGFuZ2VzIHdvdWxkIHdvcmssIGJ1dCBpdCBjb3VsZCBiZSBzaW1w
bGlmaWVkIGFzIGJlbG93LiBJIGxlYXZlIGl0IHRvIHlvdXIgPnByZWZlcmVuY2UuDQoNCj4JCQlp
bmhpYml0X3N3aXRjaCA9IDA7DQo+CQl9DQoNCgk+CWlmICh3YV9hcHBsaWVkKQ0KCT4JCWlkbGVk
bHlfcmVnX3ZhbCA9IFJFR19GSUVMRF9QUkVQKElETEVfREVMQVksDQoJPgkJCQkJCSBESVZfUk9V
TkRfQ0xPU0VTVChpZGxlZGx5ICogMTAwMCwNCgk+CQkJCQkJIGlkbGVkbHlfdW5pdHNfcHMpKSB8
IGluaGliaXRfc3dpdGNoOw0KDQppbmhpYml0X3N3aXRjaCBkbyBub3QgcmVmbGVjdCBJTkhJQklU
X1NXSVRDSF9VTlRJTF9QUkVFTVBURUQsIGl0IGhhcyBvbmx5IHJlc3VsdA0KPldpdGggdGhhdC4N
Cg0KPlJldmlld2VkLWJ5OiBCYWxhc3VicmFtYW5pIFZpdmVrYW5hbmRhbiA8YmFsYXN1YnJhbWFu
aS52aXZla2FuYW5kYW5AaW50ZWwuY29tPg0KDQpUaGFua3MgZm9yIHRoaXMgDQpUaWxhaw0KDQo+
UmVnYXJkcywNCj5CYWxhDQoNCj4gKwkJCXhlX21taW9fd3JpdGUzMigmZ3QtPm1taW8sDQo+ICsJ
CQkJCVJJTkdfSURMRURMWShod2UtPm1taW9fYmFzZSksDQo+ICsJCQkJCWlkbGVkbHlfcmVnX3Zh
bCk7DQo+ICAJCX0NCj4gIAl9DQo+ICB9DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfd2Ffb29iLnJ1bGVzIA0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YV9vb2IucnVs
ZXMNCj4gaW5kZXggZjhhMTg1MTAzYjgwLi41ZDUwNDExNjhmYTggMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV93YV9vb2IucnVsZXMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3dhX29vYi5ydWxlcw0KPiBAQCAtNjUsMyArNjUsNSBAQA0KPiAgDQo+ICAxNDAyNTg4
MzM0NwlNRURJQV9WRVJTSU9OX1JBTkdFKDEzMDEsIDM1MDMpDQo+ICAJCUdSQVBISUNTX1ZFUlNJ
T05fUkFOR0UoMjAwNCwgMzAwNSkNCj4gKzE0MDI1OTQxNTg3ICAgIEdSQVBISUNTX1ZFUlNJT05f
UkFOR0UoMjAwMSwgMzUxMSksIEZVTkMoeGVfcnRwX21hdGNoX25vdF9zcmlvdl92ZikNCj4gKwkg
ICAgICAgTUVESUFfVkVSU0lPTl9SQU5HRSgxMzAxLCAzNTAzKSwgDQo+ICtGVU5DKHhlX3J0cF9t
YXRjaF9ub3Rfc3Jpb3ZfdmYpDQo+IC0tDQo+IDIuNDYuMA0KPiANCg==
