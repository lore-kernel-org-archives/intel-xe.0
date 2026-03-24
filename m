Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19479FEC11A
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 21:51:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F2910E189;
	Tue, 24 Mar 2026 21:51:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bh7JRmIV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 414C410E189
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 21:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774389085; x=1805925085;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=CVi7lckVgJYo98yI/Ham9D56Iuknbp85JeREeipJg2Y=;
 b=Bh7JRmIVcpxc4jiK8cm82/jOlHSqKU8vFmj/ysj/FiKybQSWKvnjpETJ
 ZQDPDs3VhTyGyufL7jP4yrZrglSxCgmd8Qt++MKnmNA/aGbZPcWEvGyZK
 f/2i3o0OFA/WEiicQPxXKJDsmgpm7mx8w8iVTYhAzgBjxyMkHaAoXlRVG
 SYcdol+CSr3zYToUslA/EzWU1ZpPgSg8vqYbFA49XW3tfyIVx9Qed+gFG
 ElbUnoe6CSJOMxdSjByoE/fefYtPavZ//n//8JhI6HMbgmvtu2HdbRr53
 rKsQxAO+YjWrz+8DakhafWsQDLj04sLyuDsoqlCWT+OcbfVc0eKs2ebVO A==;
X-CSE-ConnectionGUID: 6Gl0Kb2TQuWzFXtIHo/KSg==
X-CSE-MsgGUID: DbXugL/VSHChJOH/Xqvlqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75445408"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="75445408"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 14:51:25 -0700
X-CSE-ConnectionGUID: 5YVpC4gOTuOyhcv4wggaLw==
X-CSE-MsgGUID: 0UZTKxYNQfCMLj13U9arXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="226116940"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 14:51:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 14:51:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 24 Mar 2026 14:51:23 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.16) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 14:51:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YIJ4WwjRppxPRxfOaEYy1vnmGt2+pPmYi99iZ+B3MRd6zPJB9VFcKVwTM7K84hTI4NudOuhs4UbRMfVBqSbVXPSIDvg5i+9FKtuJSp+QjuuehNehbEn6fAF/VZjEU0+YRvqibOhFJPh/wvQwPYnxU+tdzt1jrdqM6uQHxGnuOwBTOwokdS3fYxjYPWS2E0yX65uUfmeN0uUQHCZaiwAAPxo1lR8FEUNy040jSjy/EU5SwtgCQEgNfrpZVEPHosHm1LfE6393H2y1VLtquxQhI+/+z+IRiqsZfNdnPu/TY4VqZKlUMMKjhTHGQ8XXXPDfQp0a5kTMNJIiG9Y1j6Q+Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVi7lckVgJYo98yI/Ham9D56Iuknbp85JeREeipJg2Y=;
 b=gaK5g1y+ftJXyGfyaGG8b2x/KSei0BlGkgdG6wOpPwncpmgoRtiN+CiiprvyVF6okYYGAuG0y0XQau9o9IBf4+XZ3r94c8l4YkCNmk0PKL+R/fBrVuw8yE5sW3zN+ZY/XKU8NwKaHmunpNOfLKyfLBLquXOHUILEvRdighfiUPvLCAleHEsBkvn3kqPCniyvYZWK/6mjKZXVboWW1BF17AzD18NzYCtUG17E5805aoBBKJgXVdDo2i8WB+2/Oc7TvmPC0g/k7PSNLLVPfnO5SVtC7X2hGj7mttx7qvK9P8A7JK3FljZSMGIx9ijywmYfVFg0/nk6LRGZd6AwySyctA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH3PPF740777B0C.namprd11.prod.outlook.com (2603:10b6:518:1::d2f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 21:51:18 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 21:51:18 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH] drm/xe: Always invalidate TLBs on userptr invalidation
Thread-Topic: [PATCH] drm/xe: Always invalidate TLBs on userptr invalidation
Thread-Index: AQHcuwqDvtaeByK1NkStSwXNeI4hObW887mAgADSHoCAAHTBAA==
Date: Tue, 24 Mar 2026 21:51:18 +0000
Message-ID: <dbde50462394e808b4de52974f9c7c086191e35a.camel@intel.com>
References: <20260323211743.285064-1-stuart.summers@intel.com>
 <acH1IT6MBYvSf2GH@lstrano-desk.jf.intel.com>
 <0e9794ab3a16896d0790289750f56538602798e6.camel@intel.com>
In-Reply-To: <0e9794ab3a16896d0790289750f56538602798e6.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH3PPF740777B0C:EE_
x-ms-office365-filtering-correlation-id: fc6f853a-2559-412a-e947-08de89ef7ac0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: NyNMxffazRGoTOZ7ms7pajo26BJtRnQUgX6Os0g8JfM1WWn2RpLZt1sqMFUOO38dS4l9rlkGNheWbJGQmOiFhVdmoWwRtZ+Y6axyWbOYgtPeuln32f+7UA+/lwxlp3AHp7bPNcka+FOiTZ9Dp58n08JCU22ZyT27H4k981XUx+0Wc+nRkXRNR7+2AlIZ3XDKRSgPLwUw0GrK+OX4bSDFvG6N69AT5P2/fOX/uCTvPgzZI4UDCPgMRTkGyn/7o/KYNUp8LKZhorOqcSEsenolzCl5QtNOw1Br78fSeEsl5vIDCeaKyNRnZ+PCUex7TF1g09cn0xX2TYQq1X0bDAK3sM8yF6JpKJsgCBYaGCH2L5dHYZe8qeadd2jC8QH7PEuBcEkntAQ0GLaz2aWtfcnLVObK8VE6nL1GQ6lNuyoanKtTSzwXKqgz9AWJ+O8oLKHuCJPtXi+gXkvy34/ma3RZxbtt9aorSelQdkBaC6/9z6k9b//VuRdHCfE8ttb5gx07Pz+wkagHGGYJT4N069lTsDlzu6LpOfLQbhkhUN6jclZSHEjjMS5V3NY7LgwaoksvuP7Wz9QbRFVNexKRs0mXdnUvQLtkfpSEG9Dqez7hr0Kp0qbuWLAAa330BTvsirIKgJRsGx3AgdUBsD01F8G//gF1Ka+gjneSMUyahqXCSmBz0yboz8H5KbPO2FD6gHEhS4aAG/qZr+NHSzbxfi63Zvs2yO2+OxhHuQ4QFF/+7GSVHpNGybbT/kXaXg4NyOU0eUqCbc69W9xNyK1se9MwfhG6Pyvwzn5kjTiS8Ich2o0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y3NVUEVSQzltdDBxeE9obDdDZEFROTBxcGVFeVRGNlA5VVIrRFJxNzhabnY2?=
 =?utf-8?B?OFdmb3dOem90ZGRUY3pLdjBBa1BRSzRLV3hnczdWQ2tsQ1JiaXZ0NXZzNWx6?=
 =?utf-8?B?d2RselVCWXdiRUpXeUxLTnltYWd4SCtFaXBZV0g3NmdpbjlFNGQwUHdCbzMr?=
 =?utf-8?B?d2VSd081QkQ0N3pKbFB3aXhtYXZ3ZHdrSCt4Wkl1QUF0eHJPSFNMV04xU2d3?=
 =?utf-8?B?d2JHaTQ2M1pFRFFLUFo0SXcxOVpSRFd1YWtrZWJJVXhQai9CZDNUdVNUaVZy?=
 =?utf-8?B?bTlneU1ER1haQWdZVCtrOGtVeS8yNWxia01WNGRYUTBTNnR1UHRodW50clR1?=
 =?utf-8?B?VG9tWDJvdHlMRjVQc3U3eEdVTTNab0tNZllJSEJDMjFmM3NwakptZ213MEhC?=
 =?utf-8?B?ZXpES1k3N0dmQ2F3ZFFicHAyaUw2YWdQK29NREs5WXdtM2FwYk5ieHdwMmNi?=
 =?utf-8?B?R1RmaU4yRXdrYXhZdGJUZ2EwOGdIenR3NUthVkV2eXRqNE9WWUpBSUJKZGlR?=
 =?utf-8?B?WFRGdkZjc0lleGxwR3lrVklpYXVwSHA4VkdaMk45bFRLN2pyLy96VTE3YVAx?=
 =?utf-8?B?V3RabzhCclcyWTFsVEZPaHFqN1BlenJmVVJ0emJnSUwzdEVJbnFqWUtWU20y?=
 =?utf-8?B?aTFFSFQzRlJQdUp1bzVwKzRwSkRHK2RmSzN4anpVYmtiY2JiaDJTckxIWlIx?=
 =?utf-8?B?UXVWSXdXcWNIRG0wbFVXZlgzdlZCYkZIZmt1ajd6dm9kL2JRRi8xRm50bkt3?=
 =?utf-8?B?d2ZrZjRncjNoR1N6Y3ZQdzNFc3ZKRDNJR3ZFbEZXcEZlMVBMZkl0MFBXUVZE?=
 =?utf-8?B?WDNBdHV5cE1vWjFMaXdlRkM0ZHBMWkNVVk5jL0NnRWFsMWFUek56ZldPNUxC?=
 =?utf-8?B?ZzBmTjJLMGNDSS9WbnZtOXluTlk2SzZORWVRRmNBY1BEZnFUS2tXdDZLdW41?=
 =?utf-8?B?aUEwcEw1dzZSQnBHM3FtSytvaEtRU1liVmVwK1RSUStBNTVFdWV1Y25qbHNN?=
 =?utf-8?B?YVBqa1lCcnA2cTJ2WXZSSUVTR1NtYzUxRDRHaWhiWTFuS2ZPQlQ2c1Bvbk1P?=
 =?utf-8?B?M1NydnY5OFFJU2tGczk4YnJuMENkbXBjOXJDdEViVkcrVjJyNUVmTFVvTjho?=
 =?utf-8?B?YVpYVVJNOVFEcWYwQWVseUxqWWdzVW52YnVUdlNMZDhCZCszUm1TTEVLSHNz?=
 =?utf-8?B?a0ZFOVg3MkVTcmlLWUtQazVvdWxsbFV5czhKWFZvcE8vaXhkSkRlWkpVUG9V?=
 =?utf-8?B?NUVQZnpZTmxmOGRCU0daTTVOd25uZUhta0ZNRzFrUXhNTHA3K0FxTUh0QzBM?=
 =?utf-8?B?MTdvMkp1WlhtQXh2ZCs2czFTcFA2OFQrNElTdnIvaXQ0ZXFkTmd4bGtwcjhp?=
 =?utf-8?B?V0FwRVpqNTVJdytHZGNkeDZRbnJRUkJJRlFOZ3ZGNzFtQWJkQUNLNUxoeUhH?=
 =?utf-8?B?NHQ5c1FQbTg1ZEUzd3lGM2tNNitwcUMwYWN2c3hDeEJwdzBTeDh0NG0yQ1dU?=
 =?utf-8?B?MUlidmlicVUvcjBMTDBoeldxN0VPaVJFQWkvWFFybWxSelZRMjUrQ1habkph?=
 =?utf-8?B?b2plZlJJcHUzb01XWGZxQ3RWZVZ3MGVZWkN6a0UzYXQycnFaUWo3dDlma3hT?=
 =?utf-8?B?eGtqaGNUTXVUVW5zMWxSYzBWUFltOXRRTjdwTHNUL1k1SGlpMHFkdkN5VlZm?=
 =?utf-8?B?WU5DWEZoYy9ITTBmcnJsSmZtcjdFVVhhOFBPWENoU254TDdoWTNNRXhZSHZm?=
 =?utf-8?B?WXVMTmx3dThxNHJzQVVnYW9uYTdvVEY5MXVaak54MzBodGNHZGh6L1J4ZTEz?=
 =?utf-8?B?SVNUL2JBOEs1bzcvNkxjSTh1Vmxwa0ZPS1NYV2U3OGNqSTFjYVFCa0tMOWNn?=
 =?utf-8?B?Tjc0cmpEZHYvWklNbXl2UldLTVJXTVJTNGw5V0tEanFXZXhvN08yY2tBSXR1?=
 =?utf-8?B?SCthOFZ5VDU3ME5uMC9vdVhaTG94RkF1LzNwV2NyQ0RrMTdGUkZHWnpFMDVz?=
 =?utf-8?B?VnhLV05DbVRKVitRTTJRY0hQU1JSRHh0RkJ5MXhvWW1FQnUvWFY0bC85Z2k0?=
 =?utf-8?B?d0pSdTVjMEtuRkNmU0k2Ny85OS9YMmd6NXRTKzVvNnlFTWIvbklMeHUzcHZY?=
 =?utf-8?B?UldJOFB0R2lQelVrcGlxdExJb3RWaTNJb09SQm1yRXR2TVhWTUNzN21yU1Rk?=
 =?utf-8?B?YTNzbXZnc3FseDlqNjd3TWN0MFNRWlBXT2Y2aERDbkF1Q2h6dW5MQTV0RTJ1?=
 =?utf-8?B?ZnJiWnZrdWg2czdwdWRjOUNwclZTMkxJOUh5NW1uL2hHZmQrUGMyRVBvRjdN?=
 =?utf-8?B?UHJNS1k3c2x3VjFBRWgrNUJlNkV2MzByWDJVVE1zd1BRWlhLbTBFcGk4cnJX?=
 =?utf-8?Q?uFIt3WiAXB6fa+Qg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7910C912EE4B441B5076F35F289871A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: THGgvasDYAVq+abRHQD/3lmW6khg08zqdgypidIKgw82kexgKULU8TBjbX08eYd1QkJtix+vRYoIcLxi8FeeztFiLEPLyG1kVfv40kcq/zQ9M6vVAOw93jfA88VxZZRSCGkFThNlAqutRj+EKDerWZHAQqgh6yE26umrFrS5ufFYQg6+BOPpU5kGstmGCVn0KAn1cqn4akt74m/uSK9HMmfwgA/mxBs/ruyxw2jhTU90iFDc2BDJx7VeVP3EYCWn7eX12DRm1SfgyJbbMqfBHMgzPp2w5Ako388CX8gm2ZyYnuv79SuUzjKZpuWaRM2lrZKYlR1pYdm6Q3/xiUnIkQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc6f853a-2559-412a-e947-08de89ef7ac0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2026 21:51:18.2557 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X8p9vGar7Vlm+g9IrwTRhXOlrVjt8+AzZ/S7R/JTbNRVkGt0uHnR08ZdBjXxvlK36U/nODq9Je27vtSOA+BlRdHVCOh1IR+E4OtyOR2xlqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF740777B0C
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

T24gVHVlLCAyMDI2LTAzLTI0IGF0IDE0OjUzICswMDAwLCBTdW1tZXJzLCBTdHVhcnQgd3JvdGU6
DQo+IE9uIE1vbiwgMjAyNi0wMy0yMyBhdCAxOToyMSAtMDcwMCwgTWF0dGhldyBCcm9zdCB3cm90
ZToNCj4gPiBPbiBNb24sIE1hciAyMywgMjAyNiBhdCAwOToxNzo0MlBNICswMDAwLCBTdHVhcnQg
U3VtbWVycyB3cm90ZToNCj4gPiA+IFJpZ2h0IG5vdyB3ZSBhcmUgb25seSBpbnZhbGlkYXRpbmcg
VExCcyB3aGVuIHdlIGFyZQ0KPiA+ID4gcnVubmluZyBpbiBmYXVsdCBtb2RlLiBGb3Igbm9uLWZh
dWx0IG1vZGUgYmFzZWQgdXNlcnB0cg0KPiA+ID4gVk1zLCB3ZSB0aGVuIHJlbHkgb24gY29udGV4
dCBzd2l0Y2hlcyBhZnRlciBhbiBNTUFQIGhhcw0KPiA+ID4gaGFwcGVuZWQgdG8gZW5zdXJlIHRo
ZSBUTEIgaXMgY2xlYW4gZm9yIHRoZSBuZXh0IHN1Ym1pc3Npb24uDQo+ID4gPiANCj4gPiA+IFdp
dGggY29udGV4dCBiYXNlZCBUTEIgaW52YWxpZGF0aW9uLCB3ZSBjYW4gbm8gbG9uZ2VyIHJlbHkN
Cj4gPiA+IG9uIHRoZSBpbXBsaWNpdCBpbnZhbGlkYXRpb24gaGFwcGVuaW5nIGR1cmluZyBjb250
ZXh0IHN3aXRjaCwNCj4gPiA+IHNvIHJlbW92ZSB0aGUgZmF1bHQgbW9kZSBsaW1pdGVyIGFuZCBz
aW1wbHkgYWx3YXlzIHBlcmZvcm0NCj4gPiA+IHRoYXQgaW52YWxpZGF0aW9uLg0KPiA+ID4gDQo+
ID4gPiBJIHdhcyBhYmxlIHRvIHNlZSB0aGlzIGJlaGF2aW9yIHVzaW5nIHRoZSBmb2xsb3dpbmcg
dGVzdDoNCj4gPiA+IHhlX2V4ZWNfY29tcHV0ZV9tb2RlIC0tciB0d2ljZS11c2VycHRyLWludmFs
aWRhdGUNCj4gPiA+IA0KPiA+IA0KPiA+IEhtbSwgdGhpcyBpbXBsaWVzIHRoYXQgcHJlZW1wdCBm
ZW5jZXMgZG9uJ3QgaXNzdWUgYSBUTEINCj4gPiBpbnZhbGlkYXRpb24uLi4NCj4gPiBJIHRob3Vn
aHQgd2UgbGFuZGVkIG9uIHByZWVtcHQgZmVuY2VzIGRvIGEgVExCIGludmFsaWRhdGlvbiBpbg0K
PiA+IG9mZmxpbmUNCj4gPiBkaXNjdXNzaW9ucy4NCj4gDQo+IFNvIGluaXRpYWxseSBJIHdhcyBt
b3N0bHkgZm9jdXNlZCBvbiB0aGUgeGVfdm0gaW52YWxpZGF0ZSBjYXNlcy4gSW4NCj4gaGluZHNp
Z2h0IEkgc2hvdWxkIGhhdmUgZG9uZSBhIGxpdHRsZSBtb3JlIGZvY3VzZWQgdGVzdGluZyBoZXJl
IGFzDQo+IHdlbGwuIFRoaXMgY2FtZSB1cCBhZnRlciBzb21lIG1vcmUgZXh0ZW5zaXZlIHRlc3Rp
bmcgaW50ZXJuYWxseS4NCj4gDQo+IEF0IGxlYXN0IGluIG15IGxhdGVzdCByb3VuZCBvZiB0ZXN0
aW5nLCBJIGRvbid0IHNlZSBhbnkgaXNzdWVzIGluDQo+IEJBVC9GVUxMIGFmdGVyIHRoaXMgY2hh
bmdlLiBJIGRvIHRoaW5rIGdldHRpbmcgdGhpcyBtZXJnZWQgKG9yDQo+IHNvbWV0aGluZyBzaW1p
bGFyKSBhbmQgdGVzdGVkIG1vcmUgYnJvYWRseSB3b3VsZCBiZSBpbnRlcmVzdGluZy4NCj4gDQo+
ID4gDQo+ID4gV2UgbWF5IGhhdmUgbW9yZSB3b3JrIHRvIGRvIGhlcmUgd3J0IGNvbnRleHQgYmFz
ZWQgVExCDQo+ID4gaW52YWxpZGF0aW9ucy4NCj4gPiANCj4gPiBJIHRoaW5rIEJPIG1vdmUgcGF0
aCBsaWtlbHkgYWxzbyBuZWVkcyB0byBiZSB1cGRhdGVkIHRoZW4gdG9vLg0KPiANCj4gSG0uLiBJ
IGhhdmVuJ3Qgc2VlbiBhbnkgaXNzdWVzIG9uIHRoZSBCTyBzaWRlLCBhbHRob3VnaCBpdCdzIHBv
c3NpYmxlDQo+IEkndmUgbWlzc2VkIHNvbWV0aGluZyBpbiB0ZXN0aW5nIG9mIGNvdXJzZSAobGlr
ZSB0aGlzIExSIGNhc2UpLiBJJ2QNCj4gcmVhbGx5IGxpa2UgdG8gZ2V0IHRoaXMgdGVzdGVkIG1v
cmUgcmVndWxhcmx5IGluIENJIGlmIHBvc3NpYmxlIGFuZA0KPiB3b3JrIHRocm91Z2ggaXNzdWVz
IHBvc3QgbWVyZ2UuIEkgdGhpbmsgbW9zdCBvZiB0aGUgcmVtYWluaW5nIGlzc3VlcywNCj4gaWYg
dGhleSBjb21lIHVwLCBzaG91bGQgYmUgdGltaW5nIHNlbnNpdGl2ZS4NCj4gDQo+IEFsc28gdGhl
IGZhY3QgdGhhdCB0aGlzIGlzbid0IGVuYWJsZWQgaW4gYW55dGhpbmcgaW4geGVfcGNpLmMgcmln
aHQNCj4gbm93DQo+IG1lYW5zIHdlIHNob3VsZG4ndCBjYXVzZSBhbnkgbWFqb3IgYnJlYWthZ2Ug
b3RoZXJ3aXNlIGZvciB0aGUgZmVhdHVyZQ0KPiBnZW5lcmFsbHkuIE9mIGNvdXJzZSB0aGlzIHNw
ZWNpZmljIGNoYW5nZSBpbXBhY3RzIGV2ZXJ5b25lIHVzaW5nDQo+IHByZWVtcHQgZmVuY2UgbGlr
ZSB5b3Ugc2FpZC4gSSBjb3VsZCBhZGQgYSBoYXNfY3R4X3RsYl9pbnZhbCBoZXJlIC0gSQ0KPiBo
YWQgdGhvdWdodCBhYm91dCB0aGF0LiBCdXQgdG8gbWUgdGhpcyBzZWVtcyBsaWtlIGEgbW9yZSBn
ZW5lcmFsIGNhc2UNCj4gZ2l2ZW4gdGhlIGRpc2N1c3Npb24gd2UgaGFkIGFib3V0IGludGVudCBv
ZiBleHBsaWNpdCBpbnZhbGlkYXRpb25zLg0KPiANCj4gQW55d2F5IGxldCBtZSBrbm93IHdoYXQg
eW91IHRoaW5rIGhlcmUuDQoNCkxpdHRsZSBtb3JlIGRldGFpbCBoZXJlIG9uIGZ1cnRoZXIgYW5h
bHlzaXMuLi4NCg0KU28gSSBoYWQgZm91bmQgdGhpcyB0aHJvdWdoIGRlYnVnLCBidXQgbG9va2lu
ZyBhIGxpdHRsZSBjbG9zZXIsIEkgdGhpbmsNCnRoZSByZWFzb24gd2UgbmVlZCB0aGlzIGlzIGJl
Y2F1c2Ugb2YgdGhlIHhlX3ZtX3JlYmluZCgpIGZ1bmN0aW9uIHdpdGgNCnRoZXNlIGxpbmVzIGF0
IHRoZSB0b3A6DQoNCmlmICgoeGVfdm1faW5fbHJfbW9kZSh2bSkgJiYgIXJlYmluZF93b3JrZXIp
IHx8ICAgICAgICAgICAgICAgICAgICAgICANCiAgICAgbGlzdF9lbXB0eSgmdm0tPnJlYmluZF9s
aXN0KSkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCiAgICByZXR1cm4gMDsN
Cg0KU28gYmFzaWNhbGx5IGlmIHdlIGFyZW4ndCBpbiBwcmVlbXB0IGZlbmNlIG1vZGUgKGxyX21v
ZGUpLCB3ZSBhbHdheXMNCmludmFsaWRhdGUgdGhlIFRMQnMgaW4gb3BzX2V4ZWN1dGUoKSBjYWxs
ZWQgaW4gdGhlIHhlX3ZtX3JlYmluZCgpDQpmdW5jdGlvbiBsYXRlciBvbi4gSWYgd2UgYXJlIGlu
IHByZWVtcHQgZmVuY2UgbW9kZSwgdGhlcmUgaXMgYSBjb3JuZXINCmNhc2UgaGVyZSBpdCBsb29r
cyBsaWtlIHdoZXJlIHdlIGNhbGwgdGhlIHByZWVtcHQgcmViaW5kIHdvcmtlciB0aGF0DQp0aGVu
IGNhbGxzIHhlX3ByZWVtcHRfd29ya19iZWdpbigpIC0+IHhlX3ZtX3ZhbGlkYXRlX3JlYmluZCgp
IC0+DQp4ZV92bV9yZWJpbmQoZmFsc2UpIGFuZCBoaXRzIHRoZSBhYm92ZSBjYXNlLCBjYXVzaW5n
IHVzIHRvIHNraXAgdGhlIFRMQg0KaW52YWxpZGF0aW9uLiBJZiB3ZSBhZGQgdGhlIGhvb2sgaGVy
ZSwgaXQgZm9yY2VzIGludmFsaWRhdGlvbiBmb3INCmxyX21vZGUgYWxzby4NCg0KV2UgY291bGQg
anVzdCBhZGQgdGhpcyB4ZV92bV9pbl9scl9tb2RlKCkgY2hlY2sgaGVyZSwgYnV0IEkgc3RpbGwg
dGhpbmsNCmRvaW5nIHRoaXMgYWNyb3NzIHRoZSBib2FyZCBpcyBzYWZlc3Qgc28gd2UgYXJlbid0
IGhpdHRpbmcgc29tZSBvdGhlcg0KY29ybmVyIGNhc2UgaW4gdGhlIGZ1dHVyZSBpZiB3ZSBkZWNp
ZGUgdG8gcmV3b3JrIHRob3NlIG90aGVyIHNjZW5hcmlvcy4NCg0KVGhhbmtzLA0KU3R1YXJ0DQoN
Cj4gDQo+IFRoYW5rcywNCj4gU3R1YXJ0DQo+IA0KPiA+IMKgDQo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPg0KPiA+ID4gLS0tDQo+
ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV91c2VycHRyLmMgfCAyICstDQo+ID4gPiDCoDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+ID4gDQo+ID4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3VzZXJwdHIuYw0KPiA+ID4gYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfdXNlcnB0ci5jDQo+ID4gPiBpbmRleCA2NzYxMDA1YzBiOTAu
LmRmZDY3OWRkOThkOSAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV91
c2VycHRyLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV91c2VycHRyLmMNCj4g
PiA+IEBAIC0xMDIsNyArMTAyLDcgQEAgeGVfdm1hX3VzZXJwdHJfZG9faW52YWwoc3RydWN0IHhl
X3ZtICp2bSwNCj4gPiA+IHN0cnVjdCB4ZV91c2VycHRyX3ZtYSAqdXZtYSwgYm9vbCBpc19kDQo+
ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGZhbHNlLCBNQVhfU0NIRURVTEVfVElNRU9VVCk7DQo+ID4gPiDC
oMKgwqDCoMKgwqDCoMKgWEVfV0FSTl9PTihlcnIgPD0gMCk7DQo+ID4gPiDCoA0KPiA+ID4gLcKg
wqDCoMKgwqDCoMKgaWYgKHhlX3ZtX2luX2ZhdWx0X21vZGUodm0pICYmIHVzZXJwdHItPmluaXRp
YWxfYmluZCkgew0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKHVzZXJwdHItPmluaXRpYWxfYmlu
ZCkgew0KPiA+IA0KPiA+IFNob3VsZCBiZSBjaGFuZ2UgdGhpcyBpZiBzdGF0ZW1lbnQgYmFzZWQg
b24gaGFyZHdhcmUgc3VwcG9ydD8NCj4gPiANCj4gPiBNYXR0DQo+ID4gDQo+ID4gPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICghdXNlcnB0ci0+ZmluaXNoX2ludXNlKSB7DQo+
ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKg0K
PiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICog
RGVmZXIgdGhlIFRMQiB3YWl0IHRvIGFuIGV4dHJhIHBhc3Mgc28NCj4gPiA+IHRoZSBjYWxsZXIN
Cj4gPiA+IC0tIA0KPiA+ID4gMi40My4wDQo+ID4gPiANCj4gDQoNCg==
