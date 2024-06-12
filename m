Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FCBC27C77
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 14:48:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9447810E889;
	Wed, 12 Jun 2024 14:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FphvwxMP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9200210E889
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 14:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718203688; x=1749739688;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=3UJhOYC6+ibFnhZfrheX3Ro0/LDRJtUbGY2vKkCBD3U=;
 b=FphvwxMPhrtetvyjNX/RaWnmP5jLi0eU0FGuQPnLxYr+RoSB/tIxDWtx
 HDEVFXa2PMHu1co9J5YHlXFiLOIHKhLzwDODNnDj0Xg99mN9n3LFdlpba
 Wrb4TtTziF9ncHk3oxqaK3ctIXi7Dm9GJwCM0oLn9m+vhkwikEflasW8T
 8DWY1ave4Tw1Zh718+7gr+twZ0O4ApZgrXjppKYajuzEAw3SAVN+5Zeew
 WK1OOeqxpWI2eEtwkFRztBN1EOZY6x/rCD66fWw77I51EYwal25wwaD0H
 Xw42t6aerLGq2RnAh36nrymVSJwF57UAXhn2EEszzeF81Eip/yJ1VY/Tv w==;
X-CSE-ConnectionGUID: LDzQ/w2ZSiysI1vPE6YwRg==
X-CSE-MsgGUID: ioyl4GH5RmGrSJ6B2QTSsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="17896334"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="17896334"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 07:48:07 -0700
X-CSE-ConnectionGUID: k6+kkvn7THmqPIQhuU7/Vg==
X-CSE-MsgGUID: mFW39Vg+S2SbPzVoBCWEgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="39667163"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 07:48:06 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 07:48:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 07:48:06 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 07:48:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XIpTt7VD6UfZ7bu1WOx4s4MpC6ygIZOh6vMuDwnFShMbkJ1ROB+Ejc2dbyGDbin1pYlpD1loGSYEVO/dqGC1cBJkmfxanCPQHlOWK/ZWLDX8LYGgPFrMbfaaqMndMEcKhhE9lEotetnBrF/7+iwfgJpnRgSn1X5uhXgW6frFk5eMLdi+9TOr4DookLijF3Pcwk0Nvk5QGUoFXbZk+oxyC47w4cuj/QR8t05DU/Tw+51GEF7EuG38oSJQvbgmvyUATU1oG5s+N50bijC0KWUu1RTvln+rV3/nBC1kNAJBn01F1aJDeDaTX/hTbd/YkqmIb+R1kg9E0UbdUf0HwNeJqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3UJhOYC6+ibFnhZfrheX3Ro0/LDRJtUbGY2vKkCBD3U=;
 b=f6vYhs2wWlwVkaKHGcdhZf7liZpR6qPx0jSHFalsWtMopDF6grcmOeQdRoCrGmcaSi1PNtY1yxscVSFGdfGcWyWENwY+d/JnLHCSPiqDypz4hJOYhQ3Vxk7eGN+vphkth1uQy8l3TQga0lm7rYi3NBZ1q/hrppNs3VwXDY0tZ4s46J65A1TOSFrjT5Jh54AfDc0IlvDkyyn8Yam2UjhbA4k4D68pwMGIvK8JryBMxEots0M7ddatcYA76t0dWry3ciSI/lCtMcwjC+czaNV6WysDQaxNxbHx3879UaRIXqkKH9iN01mb/RuiHuGVomDnVk1j73tKqomA4kONxNDdsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DS0PR11MB7530.namprd11.prod.outlook.com (2603:10b6:8:146::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.21; Wed, 12 Jun 2024 14:48:03 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%7]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 14:48:03 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Welty, 
 Brian" <brian.welty@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Use topology to determine page fault queue
 size
Thread-Topic: [PATCH 2/2] drm/xe: Use topology to determine page fault queue
 size
Thread-Index: AQHau3V1h9PTcFzSSEOyoig8QlMBu7HDUD4AgADn4wA=
Date: Wed, 12 Jun 2024 14:48:03 +0000
Message-ID: <29065404957bff03d2cf4acf59d772b0562d7020.camel@intel.com>
References: <20240610203300.182615-1-stuart.summers@intel.com>
 <20240610203300.182615-2-stuart.summers@intel.com>
 <7e08f192-1b2d-4099-9e0f-c83749496658@intel.com>
In-Reply-To: <7e08f192-1b2d-4099-9e0f-c83749496658@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DS0PR11MB7530:EE_
x-ms-office365-filtering-correlation-id: 7d4bd3a6-4aa3-4e39-ba27-08dc8aeea9ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230032|366008|376006|1800799016|38070700010;
x-microsoft-antispam-message-info: =?utf-8?B?cXRuRThybzRFWUhOMnBrMnF5bVAxbVlmY3Y2cnJtcWE2Vmo1TmFoWGlQR25v?=
 =?utf-8?B?MTZ4NDBhYmhDTXE5cmUxUmMxRlp0Yml1U3VBbHV2OTNzVUxrbmhRUW9NOS9J?=
 =?utf-8?B?cFl4RlhBVHZybnhhc2wxV3YxVjlqYk9CRE5qakZtMzhxTjJQQnFHTGdGWGo4?=
 =?utf-8?B?c1d2dnZVd0VKOHVDSXF2eFlESkx6elNYbmtQRkZRc1VxdVloa0xMekIrdGhW?=
 =?utf-8?B?TEVFY3lKUnFrK0dIOEpyKzUrWVRnNUhkeTVXa3FESVpLQ3VUZTZQZ2lGeXM2?=
 =?utf-8?B?QVRmZFdvZ0pzbi9xcEVkdWxHcWpidDVBelA1eUdCQjJjb3ZudVJjOHYxc1Vz?=
 =?utf-8?B?UG1SelZkTXUrVUd4RFVEQUppMWI0U1RGVDdvWDVXdzJYeEhXS3B6dWZZVVFR?=
 =?utf-8?B?bGVaelRIbUNYSEN6ZUVCMjk5ZDZnanc4dktZanpLaXYzNkFGWWNNeUVVZTNJ?=
 =?utf-8?B?MzZIOXVFSjlLVnhjZDY0NmxqM01kRmVKaWIxNGhrTkZkdXZjd25YYU91ek4w?=
 =?utf-8?B?NmxIb25MVDNRWEdLdXBkbkMzUXB6YjlZZ0RzbTl3SFp0dVEvYlY1clJLSzg2?=
 =?utf-8?B?c2tqSUhCQTczSDFWamM2SnJZeXpmMVpBbnJlQi94MzU2WnRkeG8wWmtKcHM3?=
 =?utf-8?B?OS8rNDI0Y2tNSUFvRzk1N3dYMEROR090eHRLL1V5SllyNTZNSFUraUhEYkN2?=
 =?utf-8?B?S3N6amVTRFpvbllIMzdVYlpKREZBaHVJODBUNXpXeHhOZHdlWnBWRUp1cFBh?=
 =?utf-8?B?bkIwNytVK3JVYlcyVzNmTzNzK1NpZWlKbXRoeWQzeU5ObkRBaUg1eS9RdjIy?=
 =?utf-8?B?MW9oQ3RTL09Gd0lGcHJHUmVvMVZnTjNwNW9GQWlxTnp5YXltNlY2dUVKUWI3?=
 =?utf-8?B?MWRZTkU5ZDJIRld1VVZNTlY1NGlJTnNjSlZ3MTlpcjk4RTRhM2trR0tmMEJp?=
 =?utf-8?B?ZUNxZVZ5UURtb21KY3pjM3F1c2VXRFVIVlVQcU9kMDgzdGUwdGtmVWFROFgr?=
 =?utf-8?B?VGdVRXF2NFJmbFQvRWFRSFRhS0JKL3k0bUIzbGd0MkNnYk45a2dQdDdPeHNQ?=
 =?utf-8?B?UGZKalZETUtRVTFXSFY5RlVvdDc3dkw2UEZGVzVIaG1OSG5VOFJiYXdzY0FM?=
 =?utf-8?B?V0c2R0VMV3RrZWx2WVRMNi9LekEwUk81ak15ZytBK3o1UDl4dUtiS25wU0Fu?=
 =?utf-8?B?WjNtOFhvb0QrcGtBSW9TUW03TGsrdXBPYUJsTEpJN2NqMXV1ejVyM0gwVUs5?=
 =?utf-8?B?cUdUZXY2LzhFUytzVE1xUThxaEFxZk5xZHNNRVdjNDNGYTlub3REWHR6ZUhT?=
 =?utf-8?B?ZEJBWng3anZsdlBWWS95Nmpveml1R3Z0TEw2Y3RsRXQ5SGFYazRWY1dMdEU5?=
 =?utf-8?B?U1lBcUsvME0wWTdwelpyQWlQbTZXNXUydGNRT1VyRFNwZHg5dElSUHhZVk55?=
 =?utf-8?B?N3o5YkRDMUU2OERNck96STN0ZWQrdnNCVTFRU1J4WWJiczd2ZUZkaXhvU29D?=
 =?utf-8?B?WVBOSkgyUkNxNzFDa1JJaENYSHhGL1BrZ1NTdnJBT2tESmpyN1RVVDNlekQ1?=
 =?utf-8?B?RUwvQ0xOeitvVkJQb1BpMitEaEhmQ1ZnTGpxTzRJUEFiemt0eTI3R1RuK0tq?=
 =?utf-8?B?NnV4Y0FndGtrNElsVHh0RnB0WjdyYzVXNGZCOFNoS0dySGg3Mmk4U2pHWFNw?=
 =?utf-8?B?bmUzajZoMGRJVTlKRjM1RXhWY1AzQVNqeUdwbG9Vb2FGYm5uTU5hU2g5akV6?=
 =?utf-8?B?WjBBdVlnVGRmYW55dkgzMVArUUd2UmlOeis0bHdzNHpVZHNzTUZUc29vQ2Jt?=
 =?utf-8?Q?iyeTHDdIxNj+IqZZLN84HWwfkfTOkfuo+VDek=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230032)(366008)(376006)(1800799016)(38070700010); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ajh4Qy83Z3RzelhIRUpqMWtnZ2E1ZFI2Uk5MVmg4ZWltUGNBb2VjTjM1UCtj?=
 =?utf-8?B?eTF5SzdiOXIvOFdPUFRlN2dyZmR6eFB6YWdEWmVPcEZ3RmdoY1NJMTdDN2RV?=
 =?utf-8?B?M3dxNjQ2MVdnNjJZMzdwcHJFWDJnTldmeVhqMnduUDg2RGY5d3A2Q2hFd3Rl?=
 =?utf-8?B?L3BRYk54Mnc1aC9LMi9wQWh1dVBmVk5GOW1nWVJmQ0huRDMvWUxwTTRJTnNJ?=
 =?utf-8?B?S3FrWlB6dVdyTllyd3FZMkJaTmNnN0NtSHNEQUpOdVRuRllTeDdJVURxRkNK?=
 =?utf-8?B?cEE2U2hhalpHM29BbVVqV0pnWmRsYWdUNzVtMXFyWEhzTjNmdFdPdyszNVVK?=
 =?utf-8?B?UTlQaVpKMUhucGtON1hHLzVNRVFwbXJSZGpmVU90WEF1MVgxclllQUJpQ1Vj?=
 =?utf-8?B?MnkzWTB0ZDZBUkljckoxS084OHVKaW02K0tzcWx1RmEyVGJpVFM3dkhVZ05p?=
 =?utf-8?B?UnN6b0Q1c2RoOEFWdVE1YzFHc2RGVmVhRmo1alRpZm1tUHdDWEpZWjJrRGdX?=
 =?utf-8?B?c2huUGE2NVNBZTFJbkR4WVgzRm9XdWt3cDFUdDhaR3RVNHUvVThsY3NWdTRv?=
 =?utf-8?B?Y1ZVaDA5WGFpREVrb0ZlcTFOUmJBS1pONzMzOHd4R01ucDJjSDZvQkNhRHRU?=
 =?utf-8?B?R0d1UzJQV1VOaGdka1hTMDdPYzhJMXJxME5TSStNT3JDTXNkMi9xNUdUbDZt?=
 =?utf-8?B?TkhwNDNmUDY0ZkVvdC9DL1dQd1htVXhodE9leUgvRzR6KzhKL1VCeCtmbGRk?=
 =?utf-8?B?VGxoMks0eDN2WWJYUml5NHhtaWdoZTFYOTF5WVlxaXJDUE9GWVJsNzQzYWs5?=
 =?utf-8?B?K2JPY3BhU0QxU1lpbDJyTEljUi9kczBLOWhQUGNaZFVXOUU0SXR4L1NZRk1x?=
 =?utf-8?B?TFE0bWdqRFFhU1FZaXZibDJod3FpMjdIMzc5citzVmQzUVljbjU5K1kwamky?=
 =?utf-8?B?alNFRGQ2aDFHd2t4Zy9tYWpYMGFvVnQ5UzJJd1R5K1VlOEMvZ1VuK1c2VnlM?=
 =?utf-8?B?WUhBWUx6a1ErV2N6WHoybDlhSnI4bEZwQnR6eHJSN2xZZm16KzBTRUFCK2Nn?=
 =?utf-8?B?UXEvQUx6RThHZ1J0L01DWEJUQ1lXVk1rUGpUc2J3OUR3aEVqVkFLc08wSzhx?=
 =?utf-8?B?Z0NRVFpSeGNZWG84UG5TQ2dITHRzV25mSjFXNTgrVnR5c2tsNnZvNVFQTGlt?=
 =?utf-8?B?STVFUW13UTZmemJrSXNObGROVGxuL2F1UVFhTXF0WFh3bVBRQ0U2b2s3TXho?=
 =?utf-8?B?WmJqekd4clBycU1jdFV0SnZRcVZNMGNaWWhXOGNtZE83UmllbW1OZkduK2lK?=
 =?utf-8?B?cS9nQXMvdFRiQVdXZTN6ampxMjFSSWtKem90c3k2Mk9hU05HS29ZMFM4OFlM?=
 =?utf-8?B?bzkzb2FuMHhYYm14eWF1SVp0bCtURWdsOFFLR05ncGdMYis2VXBaSTZFbWI4?=
 =?utf-8?B?REhjR21pcTR2L2ZTVUQ0RUpRTDFFeFMxVjhaaitJRjhnaUI0Y1NvelU3RVRY?=
 =?utf-8?B?aVJhT21aSHpEU09hR1NWOWVnNW9PMmxZY0djdzdGdmhtS1VRTzY4VldLSWNo?=
 =?utf-8?B?aXV1L0dXbWFPN1RqWG00dEtYcWF3ajQyOUlya1gzUFQ3RVI5TFE0WWJHaTRF?=
 =?utf-8?B?bFVhL1hhTHhBN05mR1BnRmFUYlA4Y2E1VGpRM2RZcmtVRnRRdm1QaFlpL3lM?=
 =?utf-8?B?TVRLemh1L3BVTHc0NXFkd29iMklTc29DWmsvbU0xcG1SbndmWGMvNEdXVDNi?=
 =?utf-8?B?WVMyWmM4OTJuelg4eGxGN1liNGxjd01ic1FTZUpSdXpWbXVQVytXT1BKcHgz?=
 =?utf-8?B?RXNTT2NtWGd5S2kzSExkdm1MVUxudTZkK3lHTXdDZjZpZ1pmOUo0TUQ0K3dU?=
 =?utf-8?B?NllScms0UHp2blNSNUdCZVF4U0pnY1RXSXI4dUdvRlJrTm5ycDJUTW9rNGxj?=
 =?utf-8?B?bUNhRDFTNEE1TmdvdGpoT0tSazRJMEtHOUZMbkw1ODFlMFJXYkhoOWErVWov?=
 =?utf-8?B?b2JyNS94bG84ZDVZN0hvWEtFdkU1SkVJMzRTRW1CWkRwVUNKWGNkdTQ0aXls?=
 =?utf-8?B?d1EySjY2Qk1kM1krUUU3UkZUUkNuSnpmWU1NUWcwSWprSFl4UGN3dTlGZ3lN?=
 =?utf-8?B?N2hVNW84bjFERlQ2M3ZyUVRlZ1orWEtNdFBvWk0wTk5KYXQxVWpWeDY3MkVs?=
 =?utf-8?B?ekE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C5ACFC2C8205D42990BBE376770510B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d4bd3a6-4aa3-4e39-ba27-08dc8aeea9ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 14:48:03.7311 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IGnmfRQZnqvh/I/DAv7tPYNsi5dLSmismTBaWiKqDsOJ6cS0VsSLh3zg85vf8gI+cBOR9g0ZlDE5+lVx3o3bFwGm8TL2olT6FbZR+GR1S74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7530
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

T24gVHVlLCAyMDI0LTA2LTExIGF0IDE3OjU4IC0wNzAwLCBKb2huIEhhcnJpc29uIHdyb3RlOgo+
IE9uIDYvMTAvMjAyNCAxMzozMywgU3R1YXJ0IFN1bW1lcnMgd3JvdGU6Cj4gPiBDdXJyZW50bHkg
dGhlIHBhZ2UgZmF1bHQgcXVldWUgc2l6ZSBpcyBoYXJkIGNvZGVkLiBIb3dldmVyCj4gPiB0aGUg
aGFyZHdhcmUgc3VwcG9ydHMgZmF1bHRpbmcgZm9yIGVhY2ggRVUgYW5kIGVhY2ggQ1MuCj4gPiBG
b3Igc29tZSBhcHBsaWNhdGlvbnMgcnVubmluZyBvbiBoYXJkd2FyZSB3aXRoIGEgbGFyZ2UKPiA+
IG51bWJlciBvZiBFVXMgYW5kIENTcywgdGhpcyBjYW4gcmVzdWx0IGluIGFuIG92ZXJmbG93IG9m
Cj4gPiB0aGUgcGFnZSBmYXVsdCBxdWV1ZS4KPiA+IAo+ID4gQWRkIGEgc21hbGwgY2FsY3VsYXRp
b24gdG8gZGV0ZXJtaW5lIHRoZSBwYWdlIGZhdWx0IHF1ZXVlCj4gPiBzaXplIGJhc2VkIG9uIHRo
ZSBudW1iZXIgb2YgRVVzIGFuZCBDU3MgaW4gdGhlIHBsYXRmb3JtIGFzCj4gPiBkZXRtaW5lZCBi
eSBmdXNlcy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5z
dW1tZXJzQGludGVsLmNvbT4KPiA+IC0tLQo+ID4gwqAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0
X3BhZ2VmYXVsdC5jIHwgNDkgKysrKysrKysrKysrKysrKysrKysrLS0KPiA+IC0tLS0tCj4gPiDC
oCBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaMKgwqDCoMKgIHzCoCA0ICstLQo+ID4g
wqAgMiBmaWxlcyBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKPiA+
IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9wYWdlZmF1bHQuYwo+
ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfcGFnZWZhdWx0LmMKPiA+IGluZGV4IDM4NThj
OGUwYjcwNy4uNTU2NTczMmU3OWU5IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2d0X3BhZ2VmYXVsdC5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfcGFn
ZWZhdWx0LmMKPiA+IEBAIC0yODcsNyArMjg3LDcgQEAgc3RhdGljIGJvb2wgZ2V0X3BhZ2VmYXVs
dChzdHJ1Y3QgcGZfcXVldWUKPiA+ICpwZl9xdWV1ZSwgc3RydWN0IHBhZ2VmYXVsdCAqcGYpCj4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBQRkRfVklS
VFVBTF9BRERSX0xPX1NISUZUOwo+ID4gwqAgCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHBmX3F1ZXVlLT50YWlsID0gKHBmX3F1ZXVlLT50YWlsICsgUEZfTVNHX0xFTl9EVykg
JQo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBQRl9R
VUVVRV9OVU1fRFc7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHBmX3F1ZXVlLT5wZl9xdWV1ZV9udW1fZHc7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHJldCA9IHRydWU7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgfQo+ID4gwqDCoMKg
wqDCoMKgwqDCoHNwaW5fdW5sb2NrX2lycSgmcGZfcXVldWUtPmxvY2spOwo+ID4gQEAgLTI5OSw3
ICsyOTksOCBAQCBzdGF0aWMgYm9vbCBwZl9xdWV1ZV9mdWxsKHN0cnVjdCBwZl9xdWV1ZQo+ID4g
KnBmX3F1ZXVlKQo+ID4gwqAgewo+ID4gwqDCoMKgwqDCoMKgwqDCoGxvY2tkZXBfYXNzZXJ0X2hl
bGQoJnBmX3F1ZXVlLT5sb2NrKTsKPiA+IMKgIAo+ID4gLcKgwqDCoMKgwqDCoMKgcmV0dXJuIENJ
UkNfU1BBQ0UocGZfcXVldWUtPmhlYWQsIHBmX3F1ZXVlLT50YWlsLAo+ID4gUEZfUVVFVUVfTlVN
X0RXKSA8PQo+ID4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIENJUkNfU1BBQ0UocGZfcXVldWUtPmhl
YWQsIHBmX3F1ZXVlLT50YWlsLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBwZl9xdWV1ZS0+cGZfcXVldWVfbnVtX2R3KSA8PQo+ID4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBQRl9NU0dfTEVOX0RXOwo+ID4gwqAgfQo+ID4gwqAg
Cj4gPiBAQCAtMzEyLDExICszMTMsNiBAQCBpbnQgeGVfZ3VjX3BhZ2VmYXVsdF9oYW5kbGVyKHN0
cnVjdCB4ZV9ndWMKPiA+ICpndWMsIHUzMiAqbXNnLCB1MzIgbGVuKQo+ID4gwqDCoMKgwqDCoMKg
wqDCoHUzMiBhc2lkOwo+ID4gwqDCoMKgwqDCoMKgwqDCoGJvb2wgZnVsbDsKPiA+IMKgIAo+ID4g
LcKgwqDCoMKgwqDCoMKgLyoKPiA+IC3CoMKgwqDCoMKgwqDCoCAqIFRoZSBiZWxvdyBsb2dpYyBk
b2Vzbid0IHdvcmsgdW5sZXNzIFBGX1FVRVVFX05VTV9EVyAlCj4gPiBQRl9NU0dfTEVOX0RXID09
IDAKPiA+IC3CoMKgwqDCoMKgwqDCoCAqLwo+ID4gLcKgwqDCoMKgwqDCoMKgQlVJTERfQlVHX09O
KFBGX1FVRVVFX05VTV9EVyAlIFBGX01TR19MRU5fRFcpOwo+ID4gLQo+ID4gwqDCoMKgwqDCoMKg
wqDCoGlmICh1bmxpa2VseShsZW4gIT0gUEZfTVNHX0xFTl9EVykpCj4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRVBST1RPOwo+ID4gwqAgCj4gPiBAQCAtMzI3LDcg
KzMyMyw4IEBAIGludCB4ZV9ndWNfcGFnZWZhdWx0X2hhbmRsZXIoc3RydWN0IHhlX2d1Ywo+ID4g
Kmd1YywgdTMyICptc2csIHUzMiBsZW4pCj4gPiDCoMKgwqDCoMKgwqDCoMKgZnVsbCA9IHBmX3F1
ZXVlX2Z1bGwocGZfcXVldWUpOwo+ID4gwqDCoMKgwqDCoMKgwqDCoGlmICghZnVsbCkgewo+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBtZW1jcHkocGZfcXVldWUtPmRhdGEgKyBw
Zl9xdWV1ZS0+aGVhZCwgbXNnLCBsZW4gKgo+ID4gc2l6ZW9mKHUzMikpOwo+ID4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHBmX3F1ZXVlLT5oZWFkID0gKHBmX3F1ZXVlLT5oZWFkICsg
bGVuKSAlCj4gPiBQRl9RVUVVRV9OVU1fRFc7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgcGZfcXVldWUtPmhlYWQgPSAocGZfcXVldWUtPmhlYWQgKyBsZW4pICUKPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcGZfcXVldWUtPnBmX3F1
ZXVlX251bV9kdzsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcXVldWVfd29y
ayhndC0+dXNtLnBmX3dxLCAmcGZfcXVldWUtPndvcmtlcik7Cj4gPiDCoMKgwqDCoMKgwqDCoMKg
fSBlbHNlIHsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZHJtX3dhcm4oJnhl
LT5kcm0sICJQRiBRdWV1ZSBmdWxsLCBzaG91bGRuJ3QgYmUKPiA+IHBvc3NpYmxlIik7Cj4gPiBA
QCAtMzgyLDE4ICszNzksNDIgQEAgc3RhdGljIHZvaWQgcGZfcXVldWVfd29ya19mdW5jKHN0cnVj
dAo+ID4gd29ya19zdHJ1Y3QgKncpCj4gPiDCoCAKPiA+IMKgIHN0YXRpYyB2b2lkIGFjY19xdWV1
ZV93b3JrX2Z1bmMoc3RydWN0IHdvcmtfc3RydWN0ICp3KTsKPiA+IMKgIAo+ID4gK3N0YXRpYyBp
bnQgeGVfYWxsb2NfcGZfcXVldWUoc3RydWN0IHhlX2d0ICpndCwgc3RydWN0IHBmX3F1ZXVlCj4g
PiAqcGZfcXVldWUpCj4gPiArewo+ID4gK8KgwqDCoMKgwqDCoMKgeGVfZHNzX21hc2tfdCBhbGxf
ZHNzOwo+ID4gK8KgwqDCoMKgwqDCoMKgaW50IG51bV9kc3MsIG51bV9ldXM7Cj4gPiArCj4gPiAr
wqDCoMKgwqDCoMKgwqBiaXRtYXBfb3IoYWxsX2RzcywgZ3QtPmZ1c2VfdG9wby5nX2Rzc19tYXNr
LCBndC0KPiA+ID5mdXNlX3RvcG8uY19kc3NfbWFzaywKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBYRV9NQVhfRFNTX0ZVU0VfQklUUyk7Cj4gPiArCj4gPiArwqDCoMKgwqDC
oMKgwqBudW1fZHNzID0gYml0bWFwX3dlaWdodChhbGxfZHNzLCBYRV9NQVhfRFNTX0ZVU0VfQklU
Uyk7Cj4gPiArwqDCoMKgwqDCoMKgwqBudW1fZXVzID0gYml0bWFwX3dlaWdodChndC0+ZnVzZV90
b3BvLmV1X21hc2tfcGVyX2RzcywKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFhFX01BWF9FVV9GVVNFX0JJVFMpICogbnVt
X2RzczsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoC8qIHVzZXIgY2FuIGlzc3VlIHNlcGFyYXRl
IHBhZ2UgZmF1bHRzIHBlciBFVSBhbmQgcGVyIENTICovCj4gPiArwqDCoMKgwqDCoMKgwqBwZl9x
dWV1ZS0+cGZfcXVldWVfbnVtX2R3ID0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBBTElHTihudW1fZXVzICsgWEVfTlVNX0hXX0VOR0lORVMsIFBGX01TR19MRU5fRFcpOwo+IERv
IHlvdSBtZWFuIEFMSUdOIGhlcmU/IFRoaXMgaXMgcXVldWUgc2l6ZSBpbiBkd29yZHMgYWNjb3Jk
aW5nIHRvIHRoZQo+IG5hbWUgc28gaXNuJ3QgaXQganVzdCBtYXhfcXVldWVfZW50cmllcyAqIGVu
dHJ5X3NpemVfaW5fZHdvcmRzPyBJLmUuIAo+IG51bV9kdyA9IChudW1fZXVzICsgbnVtX2VuZ2lu
ZXMpICogbXNnX2xlbl9kdy4gQUxJR04gaXMganVzdCBnb2luZyB0bwo+IHJvdW5kIHVwIG5vdCBt
dWx0aXBseSB1cC4KClRoYW5rcyBKb2huLiBObyBhY3R1YWxseSB0aGlzIHZhcmlhYmxlIGlzIHRo
ZSBudW1iZXIgb2YgZHdvcmRzIGluIHRoZQpxdWV1ZSwgbm90IHRoZSBzaXplIGluIGR3b3Jkcy4g
VGhlIGFsaWdubWVudCBpcyB0byBhZGhlcmUgdG8gc29tZQphc3N1bXB0aW9ucyBtYWRlIGVsc2V3
aGVyZSBpbiB0aGUgcGFnZWZhdWx0IHF1ZXVlIGhhbmRsaW5nLgoKVGhhbmtzLApTdHVhcnQKCj4g
Cj4gSm9obi4KPiAKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoHBmX3F1ZXVlLT5ndCA9IGd0Owo+
ID4gK8KgwqDCoMKgwqDCoMKgcGZfcXVldWUtPmRhdGEgPSBremFsbG9jKHBmX3F1ZXVlLT5wZl9x
dWV1ZV9udW1fZHcsCj4gPiBHRlBfS0VSTkVMKTsKPiA+ICvCoMKgwqDCoMKgwqDCoHNwaW5fbG9j
a19pbml0KCZwZl9xdWV1ZS0+bG9jayk7Cj4gPiArwqDCoMKgwqDCoMKgwqBJTklUX1dPUksoJnBm
X3F1ZXVlLT53b3JrZXIsIHBmX3F1ZXVlX3dvcmtfZnVuYyk7Cj4gPiArCj4gPiArwqDCoMKgwqDC
oMKgwqByZXR1cm4gMDsKPiA+ICt9Cj4gPiArCj4gPiDCoCBpbnQgeGVfZ3RfcGFnZWZhdWx0X2lu
aXQoc3RydWN0IHhlX2d0ICpndCkKPiA+IMKgIHsKPiA+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qg
eGVfZGV2aWNlICp4ZSA9IGd0X3RvX3hlKGd0KTsKPiA+IC3CoMKgwqDCoMKgwqDCoGludCBpOwo+
ID4gK8KgwqDCoMKgwqDCoMKgaW50IGksIHJldCA9IDA7Cj4gPiDCoCAKPiA+IMKgwqDCoMKgwqDC
oMKgwqBpZiAoIXhlLT5pbmZvLmhhc191c20pCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHJldHVybiAwOwo+ID4gwqAgCj4gPiDCoMKgwqDCoMKgwqDCoMKgZm9yIChpID0gMDsg
aSA8IE5VTV9QRl9RVUVVRTsgKytpKSB7Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgZ3QtPnVzbS5wZl9xdWV1ZVtpXS5ndCA9IGd0Owo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHNwaW5fbG9ja19pbml0KCZndC0+dXNtLnBmX3F1ZXVlW2ldLmxvY2spOwo+ID4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoElOSVRfV09SSygmZ3QtPnVzbS5wZl9xdWV1
ZVtpXS53b3JrZXIsCj4gPiBwZl9xdWV1ZV93b3JrX2Z1bmMpOwo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHJldCA9IHhlX2FsbG9jX3BmX3F1ZXVlKGd0LCAmZ3QtPnVzbS5wZl9x
dWV1ZVtpXSk7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHJldCkKPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJl
dDsKPiA+IMKgwqDCoMKgwqDCoMKgwqB9Cj4gPiDCoMKgwqDCoMKgwqDCoMKgZm9yIChpID0gMDsg
aSA8IE5VTV9BQ0NfUVVFVUU7ICsraSkgewo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBndC0+dXNtLmFjY19xdWV1ZVtpXS5ndCA9IGd0Owo+ID4gQEAgLTQxOCwxMiArNDM5LDE2
IEBAIGludCB4ZV9ndF9wYWdlZmF1bHRfaW5pdChzdHJ1Y3QgeGVfZ3QgKmd0KQo+ID4gwqAgdm9p
ZCB4ZV9ndF9wYWdlZmF1bHRfZmluaShzdHJ1Y3QgeGVfZ3QgKmd0KQo+ID4gwqAgewo+ID4gwqDC
oMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9kZXZpY2UgKnhlID0gZ3RfdG9feGUoZ3QpOwo+ID4gK8Kg
wqDCoMKgwqDCoMKgaW50IGk7Cj4gPiDCoCAKPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAoIXhlLT5p
bmZvLmhhc191c20pCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybjsK
PiA+IMKgIAo+ID4gwqDCoMKgwqDCoMKgwqDCoGRlc3Ryb3lfd29ya3F1ZXVlKGd0LT51c20uYWNj
X3dxKTsKPiA+IMKgwqDCoMKgwqDCoMKgwqBkZXN0cm95X3dvcmtxdWV1ZShndC0+dXNtLnBmX3dx
KTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoGZvciAoaSA9IDA7IGkgPCBOVU1fUEZfUVVFVUU7
ICsraSkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBrZnJlZShndC0+dXNtLnBm
X3F1ZXVlW2ldLmRhdGEpOwo+ID4gwqAgfQo+ID4gwqAgCj4gPiDCoCB2b2lkIHhlX2d0X3BhZ2Vm
YXVsdF9yZXNldChzdHJ1Y3QgeGVfZ3QgKmd0KQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndF90eXBlcy5oCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90eXBl
cy5oCj4gPiBpbmRleCAxMGE5YTk1MjkzNzcuLmM0MGI5YzFiNWZlYyAxMDA2NDQKPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90eXBlcy5oCj4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3RfdHlwZXMuaAo+ID4gQEAgLTIzMiw5ICsyMzIsOSBAQCBzdHJ1Y3QgeGVfZ3Qg
ewo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgcGZfcXVldWUgewo+
ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyoqIEB1
c20ucGZfcXVldWUuZ3Q6IGJhY2sgcG9pbnRlciB0byBHVCAqLwo+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2d0ICpndDsKPiA+IC0j
ZGVmaW5lIFBGX1FVRVVFX05VTV9EV8KgwqDCoMKgwqDCoMKgwqAxMjgKPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qKiBAdXNtLnBmX3F1ZXVlLmRh
dGE6IGRhdGEgaW4gdGhlIHBhZ2UKPiA+IGZhdWx0IHF1ZXVlICovCj4gPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHUzMiBkYXRhW1BGX1FVRVVFX05VTV9E
V107Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHUz
MiAqZGF0YTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgdTMyIHBmX3F1ZXVlX251bV9kdzsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoC8qKgo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICogQHVzbS5wZl9xdWV1ZS50YWlsOiB0YWlsIHBvaW50ZXIgaW4g
RFdzCj4gPiBmb3IgcGFnZSBmYXVsdCBxdWV1ZSwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIG1vdmVkIGJ5IHdvcmtlciB3aGljaCBwcm9jZXNz
ZXMgZmF1bHRzCj4gPiAoY29uc3VtZXIpLgo+IAoK
