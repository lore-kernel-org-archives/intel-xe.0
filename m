Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE29FA1FF8
	for <intel-xe@archiver.kernel.org>; Wed, 22 Apr 2026 20:38:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E18B10EA54;
	Wed, 22 Apr 2026 20:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UTN+4R7Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 950FA10EA54
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Apr 2026 20:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776890309; x=1808426309;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=JcmhWUHX5vEuiMRjX/Cie/YZWjw070yUY6koG732tng=;
 b=UTN+4R7QaJrF8U54M0xZ6Pmv2eKtTCbil8D+Achn6wTqSJE/y8bwKQSm
 VTFAdLDWAyr7NIzl0HNXq1LvELqwpi55jiD0TvcbCQ6z8AlAjqfSQszTY
 2jGttlpbLLeYmYq+uwpkAJUHYDWJA83hXW43P++S5Nsj+vPwaLWpYD+H2
 6SdbcgpPUs7kIWDYq5p//DBC/K7rXp3GoIC5f0sSqqW2Lm15Y/+3qTOqi
 Q4I3D6hozNY8llS3bPby3Q4sVtwZhLps50Ag92nRHjEIW6Bp/nHeRGoh2
 rrMCsAdc9dBviiHdRF+IKO8h7UIyHfLisKhKBfG7ljD6dyv5KTa3SBEVU Q==;
X-CSE-ConnectionGUID: O4mXjx8/SCucrII9B4+DEA==
X-CSE-MsgGUID: 0Arf9jBuSY6CmOhHdTNKjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77734556"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="77734556"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 13:38:29 -0700
X-CSE-ConnectionGUID: b4n1Pr0LRi6oPz7oJPxb3A==
X-CSE-MsgGUID: 0Iu4t7xqS0eH9TGGET176w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="232357017"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 13:38:28 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 13:38:27 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 22 Apr 2026 13:38:27 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.3) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 13:38:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NwobuDOdHna0q248QOU3avbbgEP+H28B1bm5w/YOcvivMdQVIzsl8W/8roL3dOKcMkNOXIaBeRNISAZNEEf1Z9Tpke1D/G1Zhnd5+J3Oxc2dPhgJVFPVnsoPHfV1j5rLKgpXTLrhge6D2CqWZyoJm/GfU2ZcYvZcGTAUjY8bJG9ZZGArVZ3qMKAUDpqFvJadvObCyjPFpzWEo6lTAlSLb9bFVQMZnbHxz5NI5AtSYewAZiGHeVKg/qmQzTwhYBERC3+Bwn6x43wDhnq8QpBlu952stBiI2/GuEOn9ji7aYOge0TAXmy2xet4JQysT6qoCvtTeMe0tUJe1AEovNFdbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JcmhWUHX5vEuiMRjX/Cie/YZWjw070yUY6koG732tng=;
 b=fhZJgQFQeZU69SwGHT18C1Om0Qt+uhRhiWlHgDni2CKQZwahJmycgQG99COsTNvSthLB1RPjx6uyAc+g+tdKLxykYqf5anR76J8loxKoHeZwd10zTnVQs6MYVhlOdZ0U4ISz254hXaOwdF0Dry+3J97xEjbZ5tIXsRi9JgzdgHBnjZu/AhQ9IWXEUPMsW2C3oSXJ/ui8h0/x5aLvUxikzNkNid/EuWkLuVr1UEJaYTCr5MPw49nosdQvHmJeW/qYAM/Q8OQAf+dgT6z/1PaD6JlECEJtnmSElVGSZxvcyZvifRdNasMGxGUtUOBEsZexbpl5FD1XOjlTLV7HaF0N1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SN7PR11MB7139.namprd11.prod.outlook.com (2603:10b6:806:2a2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Wed, 22 Apr
 2026 20:38:23 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%5]) with mapi id 15.20.9846.011; Wed, 22 Apr 2026
 20:38:22 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>, "Yadav, Arvind" <arvind.yadav@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC 11/15] drm/xe: Add xe_guc_access_counter layer
Thread-Topic: [RFC 11/15] drm/xe: Add xe_guc_access_counter layer
Thread-Index: AQHctqZXuwm+hmdVG0iq0DeiWyLPWrXrwp2A
Date: Wed, 22 Apr 2026 20:38:22 +0000
Message-ID: <2c36232ed3a6da34fba46324e0762c5fa253d771.camel@intel.com>
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
 <20260318074456.2839499-12-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260318074456.2839499-12-himal.prasad.ghimiray@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SN7PR11MB7139:EE_
x-ms-office365-filtering-correlation-id: 40d93964-71ea-45a5-cfb2-08dea0af18cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|22082099003|38070700021|56012099003;
x-microsoft-antispam-message-info: U/AaytYfyxz2SMJ8g3Mmv4OGVGAc5TqwbM3BxMQziz5dD7Et1vvQdBq6icDVrH5sgVW5GxTdUCOs+2ANEt/wJ9WQxEDyJpPsjBFuxwZIoY2SbzqjEwbwevuGw1q8bAadUFVZBfF66c+RF/DRkZEPnxcV4Hli04eOJJrJzCg1DwO5iB8CQFMErsyz7Cm+JTi8EgpgNc43iYj1HrGYdSE99OzBvzRYZ8Tqjwa+OoftIz778q2Nihj3mJFhd9xrKComVODVkwVV/X5/XMycj2oWDx1tLoNV4/+pdHUlWNOk0bO7krpyzdzsGQZsqq2OKBgHTSmblSieopoMhI0nPLhKWvQMNEQRh/pQG+FExObdbLCL12XVZswJG+CE0C7dVyQVk3GGXAC9uyexke+b7XUiCncs3wUyqRs+0qf9mgcs+532oWieKrZd8C3XQ49uq3dfu651kni1xxZrrdHV6BIWQlhAQ5XaGML7X6hVn1ejMc+jDLgvPCKI04MIAjInwp3KTpi+P3XGuW4nOqwqASkkFdAclSsdM2Tl60cbtQmaFVRtgKS3cWq3uBNk/VH9jckLYAnKzOeWB8bYF23ycYeCQfY3gvg9VJh1Bk2/HhoUg/Xv6os5fbFJvPxSFP6cBDpDyjTBRSR9TYOZFxfFLVkN3cfG9mwtB6+HeuDEhy6ZFbmcILtMzpQ9ArD1i9D7rxTwf2g93hVNHG9S2Uif0Lz81E9Ui4HdPXk9BrcH+cU6HpzXik8umwZP4npylJrAp43fcMhSVlzvDGNTJDo0XgOCaRZ1127w8eIvxvm5PVH8exM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(38070700021)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cVVIZTNGRzhNUWQyL0ozbXlwSXE2SklsOTJ6ODRSNVA0OHNnUUZuMFJtelJr?=
 =?utf-8?B?UEdVS2ZWZlFvcWhwMmZLa1doV0IxS0FBWTBmV3ZadE9GSldiaEVTT0RwYjJZ?=
 =?utf-8?B?U3l1R3BkQmVPMk9sb0dZSkhXZ29Ybk5jYzhHVHI3dGx0VnlRVHBQeTlNZWJE?=
 =?utf-8?B?eFh3Ykp2ZDhtdzNSQWVMb2lXYlltckduUlIvTXhwVVZBSElRVk9NU3F6dDJY?=
 =?utf-8?B?QUE5TG12NGRxTDN5a0JMbWVJNlBaWmFEVnlzM1U5aEsxTkhSU0x3OHV2eWJW?=
 =?utf-8?B?REp6RUk5RXpRcnkrMVRiQ0U4WTFXNmtmTjJpQjY3YUZUTXMyMnc4RDV3b3Jp?=
 =?utf-8?B?OEU2Qzd1UVhOMTFlTGhnd0d3d0FycSs5eVlKdzNXLzlxSG0zSXRmWjFSWkxq?=
 =?utf-8?B?clVDQ3pMSzhHOGhucTFyTG92UjA4RlRucHZCVUkwVjJ2TXRWRmpDVnJjVGlG?=
 =?utf-8?B?K1NUVC9ETFkxVkpWM0lTQ2J3NkZjK1diMXhSa1Q0MnVJREo4Vmk1MmtVTVFF?=
 =?utf-8?B?Z0ExbWF1Y0lVT1NRS29yVlA3MVBnYXdHWEEyWFloNGtXcUY1UktaamtCT3RJ?=
 =?utf-8?B?cE1kYXhOQlNLbExBSTZqaVNHU1FrSVlnUlRSQ0FvbHExNHlFSlJBYTNseDJG?=
 =?utf-8?B?citwV0xZVkZWUmZCS3dtMU4yR1laeDI2bzB6TzlPMURzVzNMU0tRUFNSMVhx?=
 =?utf-8?B?TGx2L1pIQ1BndWNDTWxuUDdyak1qK0ZtZjJwY2lNQjFpNm0wbnZ2Y0NPSDli?=
 =?utf-8?B?ZDBQWlBpZW9wOEU4K1dTUmVSbEdHeWs5elBuSFB3dUFOYWVJYmx1bUd4Z3Q2?=
 =?utf-8?B?ekoyU1VtM1VsUXBHYVZ5djY1Yit6aGVwWDV5OXM4eENwSTJEc3ZnYkQ5SU56?=
 =?utf-8?B?Zkw2ZTVUb2owVFUvTFNzcGY3VEZVK0FLUXZpRkZIOEhaangxbFZUQjhNWU5j?=
 =?utf-8?B?b3BzbS9nSU1rdkVhUmdrVTZVTUNYc2h1UjJvbnM1TVlUNUpWRE1hbEh2OE5K?=
 =?utf-8?B?enVITitWeWdTRUdBb1FqemxOaWgyVTdpMmdRRHBZU0NQSjhVaUsyT0Fwbk15?=
 =?utf-8?B?QU1FUFU5TDJQOUZoTFgxR0VzNzNaTnM1TEdvM1R1enJGTGVoMDYwM2QzS2o1?=
 =?utf-8?B?Y2xKTjduNEpIaHVObnFSNEJWR004NUJmWmE3eWw0U09TNGFqbEVBdkdSengv?=
 =?utf-8?B?UGc4cVk1bFR0Vk5ieDBKYlFuYi9tUlJMUnpoL2lHcG1WYzU4akwyeTdWYTVG?=
 =?utf-8?B?YnpvdkFPdklJZ3lvNmNTakQ1dVgvZmVCV3VaV25yQTRNUFBrV0E0eU15aHpm?=
 =?utf-8?B?SzlTUGJFeWNuV1dLQjMvbmZCdExOQTN4WlpSVlFiTjhYU0NyZmh3dnk2K1hX?=
 =?utf-8?B?WW5Sb2t1YjhtOEtLb1c2WU40NTlUOG9RVXlzMUFmK0pmdVFVT0Y0ckNicmJw?=
 =?utf-8?B?SnRpOUhYdEZTMUZlU1JDYXphVGh1UHlLUEQ2b1VsYzM1UngzRzNQMXFoYjhh?=
 =?utf-8?B?OU1TaFBVZnRpR3V2YXN0N2plRWlueXhsRWlqNE5mQngwallhZWFEOUxCZHFH?=
 =?utf-8?B?bCtqekc0OEY1UHF0bnhNVkx1QnNUN3ZnSWhzU3dZYmRkNGtCNnFHODNodUo1?=
 =?utf-8?B?K0RYb3BlTW14NjdBcVVvMDlINDhEUU1EV2xaem1NWVhTMUF6d0xDWEpwMm9Y?=
 =?utf-8?B?QWJ0dnZPZUg0YnZ4TS8rSTE4UlBhQXdMZSt5WXJRVU1jaFM3SEFuSHBiWUVp?=
 =?utf-8?B?L1FoYUZIN3hVNW5UNmFBM3BXc0ZHVWhhUGc0OFlmUE15VGdOeFVFOC9KS1V0?=
 =?utf-8?B?U2h5bTF4d1BwcEg1RW4wVEtPNEVIaEFhbFFmblpGcjRRMWhucndXS0psa0Z5?=
 =?utf-8?B?a1ZCcERTa2Y1MXFFbjg2QzdNWWJ2Zkx2SUFobGpLRGEzWEQ2S3BGbVQxemh3?=
 =?utf-8?B?NnpiWkpQZU4za3k1NTJVQWpFSDBWOWg3Z2xlS0RzR0RBaEcyeGMvVGExTFJ3?=
 =?utf-8?B?R3RUWklNL1hXSVgvemNZaWxYc0YvMnFHSUgxTU9uOHlNaTFCdVIwUmFWRWMy?=
 =?utf-8?B?MWp6azF0anJNeTFVUUEvc0JqRXBXekhneDYrTy9tMVVDa0ZIK1FCakN3UHdZ?=
 =?utf-8?B?QnRGaDJvdi9STno5ekJDUG5QNCt1SFJuNGZFMHJQR3RSSTBqTUxhL0UzTnFs?=
 =?utf-8?B?R3AxU2svbHE5Q3RlSzU3Y2hoZWlOek1oVmZ6SmdlY0xsRlR2U2N4VnI3b1F6?=
 =?utf-8?B?MDdCemQzZE0xMm1jbytUcFZwdDhFOUhSL0pkeG9YMkkxeENxdGNBdVBFcER4?=
 =?utf-8?B?dlFWK2pBOHluRjNwWGJ0Q3hCYy9JQS85QS84bzV3TnFuODlHaXR2WExpM2RZ?=
 =?utf-8?Q?ugaoNjC3D999Bduo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7890DC95CEDE1C4B97140F76E847B020@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: MrDMiIlToEYqQrhEuVxNN2YrJRtzuccO7d45w9kdf+jhn/aF2WXawOEKVzvCYDKFiR/UaFKZsbyoPPqCTGeXDOleR9mlAFqHOaRV14TOrlBqaaQHmvsE1wXH3FR7ByFt35yLf7BPvR3TYAlZ2esAq/EL3eFAxFr+k8EeeFMc3oRhzF5MY6yI0NIC0AC+baOnFFMkaOGc04SYr1TVlt7aoSj+UQIiNNUPERLJYdn3g7q7yfDdUaG3SMmKXRpUgbsxAYg2Wp0LrLpIwCCSf9ihdYMfRCEraAmxOLezXFkKVt0CP+1pDRMN9glA+nCaTRwDEsWVJt3kdopOPEqbPYzc/w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d93964-71ea-45a5-cfb2-08dea0af18cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2026 20:38:22.8473 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1+YC4JRWH1gUjGm3uI3YMhMeAAXVWlObOk5sLQOOTuRDkXbeU4ymHkw083HdmN7GClF3qPtAeysKtgCLHlX3b30rs1hoJ9DFXaFVYmlL0KM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7139
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

T24gV2VkLCAyMDI2LTAzLTE4IGF0IDEzOjE0ICswNTMwLCBIaW1hbCBQcmFzYWQgR2hpbWlyYXkg
d3JvdGU6DQo+IEFkZCBHdUMgdG8gaG9zdCAoRzJIKSBhY2Nlc3MgY291bnRlciBub3RpZmljYXRp
b24gaGFuZGxlciB0byBwYXJzZQ0KPiBHdUMgZmlybXdhcmUgbWVzc2FnZXMgaW50byBzdHJ1Y3Qg
eGVfYWNjZXNzX2NvdW50ZXIgYW5kIGZvcndhcmQgdG8NCj4geGVfYWNjZXNzX2NvdW50ZXJfaGFu
ZGxlciBmb3IgcHJvY2Vzc2luZy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhpbWFsIFByYXNhZCBH
aGltaXJheQ0KPiA8aGltYWwucHJhc2FkLmdoaW1pcmF5QGludGVsLmNvbT4NCj4gLS0tDQo+IMKg
ZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoCAxICsNCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2FjY2Vzc19jb3VudGVyLmMg
fCA2Mg0KPiArKysrKysrKysrKysrKysrKysrKysrDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Y19hY2Nlc3NfY291bnRlci5oIHwgMTUgKysrKysrDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2d1Y19jdC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA0ICsrDQo+IMKgNCBmaWxl
cyBjaGFuZ2VkLCA4MiBpbnNlcnRpb25zKCspDQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndWNfYWNjZXNzX2NvdW50ZXIuYw0KPiDCoGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2FjY2Vzc19jb3VudGVyLmgNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUvTWFrZWZpbGUNCj4gYi9kcml2ZXJzL2dwdS9k
cm0veGUvTWFrZWZpbGUNCj4gaW5kZXggOTJkOGQ2ZTRhNDQ3Li4yOTZiM2NiYTBiODkgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZQ0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUvTWFrZWZpbGUNCj4gQEAgLTc0LDYgKzc0LDcgQEAgeGUteSArPSB4ZV9hY2Nlc3Nf
Y291bnRlci5vIFwNCj4gwqDCoMKgwqDCoMKgwqDCoHhlX2d1Y19pZF9tZ3IubyBcDQo+IMKgwqDC
oMKgwqDCoMKgwqB4ZV9ndWNfa2x2X2hlbHBlcnMubyBcDQo+IMKgwqDCoMKgwqDCoMKgwqB4ZV9n
dWNfbG9nLm8gXA0KPiArwqDCoMKgwqDCoMKgwqB4ZV9ndWNfYWNjZXNzX2NvdW50ZXIubyBcDQo+
IMKgwqDCoMKgwqDCoMKgwqB4ZV9ndWNfcGFnZWZhdWx0Lm8gXA0KPiDCoMKgwqDCoMKgwqDCoMKg
eGVfZ3VjX3BjLm8gXA0KPiDCoMKgwqDCoMKgwqDCoMKgeGVfZ3VjX3JjLm8gXA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19hY2Nlc3NfY291bnRlci5jDQo+IGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d1Y19hY2Nlc3NfY291bnRlci5jDQo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uMjE1ODQwMGJjNTBhDQo+IC0tLSAvZGV2L251
bGwNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19hY2Nlc3NfY291bnRlci5jDQo+
IEBAIC0wLDAgKzEsNjIgQEANCj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQNCj4g
Ky8qDQo+ICsgKiBDb3B5cmlnaHQgwqkgMjAyNiBJbnRlbCBDb3Jwb3JhdGlvbg0KPiArICovDQo+
ICsNCj4gKyNpbmNsdWRlICJ4ZV9ndWNfYWNjZXNzX2NvdW50ZXIuaCINCj4gKw0KPiArI2luY2x1
ZGUgInhlX2FjY2Vzc19jb3VudGVyLmgiDQo+ICsjaW5jbHVkZSAieGVfZGV2aWNlLmgiDQo+ICsj
aW5jbHVkZSAieGVfZ3QuaCINCj4gKyNpbmNsdWRlICJ4ZV9ndWMuaCINCj4gKyNpbmNsdWRlICJ4
ZV9ndWNfZndpZi5oIg0KPiArDQo+ICsvKioNCj4gKyAqIHhlX2d1Y19hY2Nlc3NfY291bnRlcl9o
YW5kbGVyKCkgLSBHMkggYWNjZXNzIGNvdW50ZXIgaGFuZGxlcg0KPiArICogQGd1YzogR3VDIG9i
amVjdA0KPiArICogQG1zZzogRzJIIG1lc3NhZ2UNCj4gKyAqIEBsZW46IExlbmd0aCBvZiBHMkgg
bWVzc2FnZQ0KPiArICoNCj4gKyAqIFBhcnNlIEd1QyB0byBob3N0IChHMkgpIG1lc3NhZ2UgaW50
byBhIHN0cnVjdCB4ZV9hY2Nlc3NfY291bnRlcg0KPiBhbmQgZm9yd2FyZA0KPiArICogb250byB0
aGUgWGUgYWNjZXNzIGNvdW50ZXIgbGF5ZXIuDQo+ICsgKg0KPiArICogUmV0dXJuOiAwIG9uIHN1
Y2Nlc3MsIG5lZ2F0aXZlIGVycm9yIGNvZGUgb24gZmFpbHVyZQ0KPiArICovDQo+ICtpbnQgeGVf
Z3VjX2FjY2Vzc19jb3VudGVyX2hhbmRsZXIoc3RydWN0IHhlX2d1YyAqZ3VjLCB1MzIgKm1zZywg
dTMyDQo+IGxlbikNCj4gK3sNCj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2FjY2Vzc19jb3Vu
dGVyIGFjOw0KPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IGd1Y190b194
ZShndWMpOw0KPiArwqDCoMKgwqDCoMKgwqBpbnQgaTsNCj4gKw0KPiArI2RlZmluZSBHVUNfQUND
X01TR19MRU5fRFfCoMKgwqDCoMKgXA0KPiArwqDCoMKgwqDCoMKgwqAoc2l6ZW9mKHN0cnVjdCB4
ZV9ndWNfYWNjX2Rlc2MpIC8gc2l6ZW9mKHUzMikpDQo+ICsNCj4gK8KgwqDCoMKgwqDCoMKgQlVJ
TERfQlVHX09OKEdVQ19BQ0NfTVNHX0xFTl9EVyA+DQo+IFhFX0FDQ0VTU19DT1VOVEVSX1BST0RV
Q0VSX01TR19MRU5fRFcpOw0KPiArDQo+ICvCoMKgwqDCoMKgwqDCoGlmIChsZW4gIT0gR1VDX0FD
Q19NU0dfTEVOX0RXKQ0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1F
UFJPVE87DQo+ICsNCj4gK8KgwqDCoMKgwqDCoMKgYWMuZ3QgPSBndWNfdG9fZ3QoZ3VjKTsNCj4g
Kw0KPiArwqDCoMKgwqDCoMKgwqAvKiBQYXJzZSBhY2Nlc3MgY291bnRlciBkZXNjcmlwdG9yICov
DQo+ICvCoMKgwqDCoMKgwqDCoGFjLmNvbnN1bWVyLmdyYW51bGFyaXR5ID0gRklFTERfR0VUKEFD
Q19HUkFOVUxBUklUWSwgbXNnWzJdKTsNCj4gK8KgwqDCoMKgwqDCoMKgYWMuY29uc3VtZXIuc3Vi
X2dyYW51bGFyaXR5ID0gRklFTERfR0VUKEFDQ19TVUJHX0hJLCBtc2dbMV0pDQo+IDw8IDMxIHwN
Cg0KTWFjcm8gZm9yIHRoZSAzMSBoZXJlLi4uDQoNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBGSUVMRF9H
RVQoQUNDX1NVQkdfTE8sIG1zZ1swXSk7DQo+ICvCoMKgwqDCoMKgwqDCoGFjLmNvbnN1bWVyLmNv
dW50ZXJfdHlwZSA9IEZJRUxEX0dFVChBQ0NfVFlQRSwgbXNnWzBdKTsNCj4gK8KgwqDCoMKgwqDC
oMKgYWMuY29uc3VtZXIudmFfcmFuZ2VfYmFzZSA9ICgodTY0KShtc2dbM10gJg0KPiBBQ0NfVklS
VFVBTF9BRERSX1JBTkdFX0hJKSA8PCAzMikgfA0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKG1zZ1syXSAmDQo+
IEFDQ19WSVJUVUFMX0FERFJfUkFOR0VfTE8pOw0KPiArwqDCoMKgwqDCoMKgwqAvKiB4ZTM6IFVz
ZSBBU0lEIGFuZCBlbmdpbmUgaW5mbyAqLw0KDQpXZSBjYW4gZHJvcCB0aGlzIGNvbW1lbnQgLSB3
ZSBjYW4ganVzdCByZWFkIHRoZSBmaWVsZHMgYmVsb3cgaXQgdG8NCmRldGVybWluZSB3aGF0IHdl
J3JlIGRvaW5nLg0KDQpUaGFua3MsDQpTdHVhcnQNCg0KPiArwqDCoMKgwqDCoMKgwqBhYy5jb25z
dW1lci54ZTMuYXNpZCA9IEZJRUxEX0dFVChBQ0NfQVNJRCwgbXNnWzFdKTsNCj4gK8KgwqDCoMKg
wqDCoMKgYWMuY29uc3VtZXIueGUzLmVuZ2luZV9jbGFzcyA9IEZJRUxEX0dFVChBQ0NfRU5HX0NM
QVNTLA0KPiBtc2dbMV0pOw0KPiArwqDCoMKgwqDCoMKgwqBhYy5jb25zdW1lci54ZTMuZW5naW5l
X2luc3RhbmNlID0gRklFTERfR0VUKEFDQ19FTkdfSU5TVEFOQ0UsDQo+IG1zZ1sxXSk7DQo+ICvC
oMKgwqDCoMKgwqDCoGFjLmNvbnN1bWVyLnhlMy52ZmlkID0gRklFTERfR0VUKEFDQ19WRklELCBt
c2dbMl0pOw0KPiArDQo+ICvCoMKgwqDCoMKgwqDCoC8qIFN0b3JlIHByb2R1Y2VyIG1lc3NhZ2Ug
Zm9yIHBvdGVudGlhbCBhY2tub3dsZWRnbWVudCAqLw0KPiArwqDCoMKgwqDCoMKgwqBhYy5wcm9k
dWNlci5wcml2YXRlID0gZ3VjOw0KPiArwqDCoMKgwqDCoMKgwqBmb3IgKGkgPSAwOyBpIDwgR1VD
X0FDQ19NU0dfTEVOX0RXOyArK2kpDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBh
Yy5wcm9kdWNlci5tc2dbaV0gPSBtc2dbaV07DQo+ICsNCj4gKyN1bmRlZiBHVUNfQUNDX01TR19M
RU5fRFcNCj4gKw0KPiArwqDCoMKgwqDCoMKgwqByZXR1cm4geGVfYWNjZXNzX2NvdW50ZXJfaGFu
ZGxlcih4ZSwgJmFjKTsNCj4gK30NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndWNfYWNjZXNzX2NvdW50ZXIuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfYWNj
ZXNzX2NvdW50ZXIuaA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAw
MDAuLjFhYzhlNzYzOThkMg0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndWNfYWNjZXNzX2NvdW50ZXIuaA0KPiBAQCAtMCwwICsxLDE1IEBADQo+ICsvKiBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUICovDQo+ICsvKg0KPiArICogQ29weXJpZ2h0IMKp
IDIwMjUgSW50ZWwgQ29ycG9yYXRpb24NCj4gKyAqLw0KPiArDQo+ICsjaWZuZGVmIF9YRV9HVUNf
QUNDRVNTX0NPVU5URVJfSF8NCj4gKyNkZWZpbmUgX1hFX0dVQ19BQ0NFU1NfQ09VTlRFUl9IXw0K
PiArDQo+ICsjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4NCj4gKw0KPiArc3RydWN0IHhlX2d1YzsN
Cj4gKw0KPiAraW50IHhlX2d1Y19hY2Nlc3NfY291bnRlcl9oYW5kbGVyKHN0cnVjdCB4ZV9ndWMg
Kmd1YywgdTMyICptc2csIHUzMg0KPiBsZW4pOw0KPiArDQo+ICsjZW5kaWYNCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY3QuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndWNfY3QuYw0KPiBpbmRleCBhMTFjZmY3YTIwYmUuLjhhYzA5MzhmN2EyOCAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndWNfY3QuYw0KPiBAQCAtMjYsNiArMjYsNyBAQA0KPiDCoCNpbmNsdWRl
ICJ4ZV9ndF9zcmlvdl9wZl9tb25pdG9yLmgiDQo+IMKgI2luY2x1ZGUgInhlX2d1Yy5oIg0KPiDC
oCNpbmNsdWRlICJ4ZV9ndWNfbG9nLmgiDQo+ICsjaW5jbHVkZSAieGVfZ3VjX2FjY2Vzc19jb3Vu
dGVyLmgiDQo+IMKgI2luY2x1ZGUgInhlX2d1Y19wYWdlZmF1bHQuaCINCj4gwqAjaW5jbHVkZSAi
eGVfZ3VjX3JlbGF5LmgiDQo+IMKgI2luY2x1ZGUgInhlX2d1Y19zdWJtaXQuaCINCj4gQEAgLTE2
MzAsNiArMTYzMSw5IEBAIHN0YXRpYyBpbnQgcHJvY2Vzc19nMmhfbXNnKHN0cnVjdCB4ZV9ndWNf
Y3QNCj4gKmN0LCB1MzIgKm1zZywgdTMyIGxlbikNCj4gwqDCoMKgwqDCoMKgwqDCoGNhc2UgWEVf
R1VDX0FDVElPTl9SRVBPUlRfUEFHRV9GQVVMVF9SRVFfREVTQzoNCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqByZXQgPSB4ZV9ndWNfcGFnZWZhdWx0X2hhbmRsZXIoZ3VjLCBwYXls
b2FkLA0KPiBhZGpfbGVuKTsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBicmVh
azsNCj4gK8KgwqDCoMKgwqDCoMKgY2FzZSBYRV9HVUNfQUNUSU9OX0FDQ0VTU19DT1VOVEVSX05P
VElGWToNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IHhlX2d1Y19hY2Nl
c3NfY291bnRlcl9oYW5kbGVyKGd1YywgcGF5bG9hZCwNCj4gYWRqX2xlbik7DQo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBicmVhazsNCj4gwqDCoMKgwqDCoMKgwqDCoGNhc2UgWEVf
R1VDX0FDVElPTl9UTEJfSU5WQUxJREFUSU9OX0RPTkU6DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgcmV0ID0geGVfZ3VjX3RsYl9pbnZhbF9kb25lX2hhbmRsZXIoZ3VjLCBwYXls
b2FkLA0KPiBhZGpfbGVuKTsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBicmVh
azsNCg0K
