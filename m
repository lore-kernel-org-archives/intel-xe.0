Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3297C88E7B
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 12:39:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 759D210EC5D;
	Tue, 15 Sep 2026 12:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ay3QpBe2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F07310E05E;
 Tue, 15 Sep 2026 12:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789475965; x=1821011965;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=mCNuBZS//P7R6B/Fv9eoPxIsDMqg9+3sPLy2E1oHV6k=;
 b=Ay3QpBe2BR7kw5I68OtTUoUpirtqeP9Z0C5nIZJzN3xU1lR5Y4U23UZn
 SUgSeEzA+EIwXtsnTAmGKWidepEC0KLoCR10M32lSdL3W0mi6PVVzEg7N
 YfVxfXTd7q4tzD9jGmXwRhJ5EOv3AHdCd1liWwMFcQ9VuGWTJrw83xbFx
 Hcv1qUgpsC7iBo3HZQ2NwocunljevCXc8Ad+7hO9GAlf9Rb1HX+Pd99CZ
 cqSc5cmcHNReQDas4UsxFf2WT7MwRpVVUiqY80O2snTzN9XyFPvrp8/Rn
 cnTlF9Uxgw60x4evKuCvi9gscNz4VbVHczYvLnf+RXILeSZV6Q5RO32zK w==;
X-CSE-ConnectionGUID: +TmByxe9RdyNegrc+iJZ2A==
X-CSE-MsgGUID: urinpn3YSNamn/DJM5deQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107348681"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="107348681"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 05:39:25 -0700
X-CSE-ConnectionGUID: pK31DsTISv+ACiWJ/3WLxQ==
X-CSE-MsgGUID: Wl05QRPKTXWpD6S1Z4HnLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="302880107"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 05:39:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 05:39:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 05:39:24 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.0) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 05:39:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QcTDB7w5x0osKBOvIUNDIN2ICXNEB5iyJzLK6cE/C9CqWdiOZXOtOiq4xmqA5c8AE/ivBIaOKlSIDulc7/4g8+AyycCCogL0F8TiIwPcKz2vFwYqrKKUTZR9iUOJ6BDa/r2pIQ8IW0Ly79cD4y6kQDC5sa4NHmjHOV1NuuRPSGHuJKI2eSF++g9XneF+eF/9yqV6vBC9HcyObWf8WP0sCinOU9Ij5NLCTzcymOuhqPmM4Q3Nm5zs50yD5qkossZigHuecfq3NK08RmSyLlxSEPs+rsU8ir1a1FMKrZh2el6dYzMYh/MsAQItO4l0bQarCU82ARjv7jPTfJpmmXWZIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCNuBZS//P7R6B/Fv9eoPxIsDMqg9+3sPLy2E1oHV6k=;
 b=lcj42FO5VLLjaTs3h2oXMfE7BCMcxx3EZlqbyR5vJM3tOdFM5vDqanq/bHOmcoWbBhmG8OmSMkbBUyRXXP1XRsHKcJpkT9mKF9w0CtDhPlE2I/Rw6GFZE1Es4CKv9HvKBwSpO/63pahV2rKk0GbVCqx1HcbAhBNRk8wIOXTEkJ2Io5Xlibq+sEgIQOI1lZ5fxxjNMt0U/ZNpz/Sa9Gsp+TTQDj49VFh33kqnLYgOVLmNFRoLyQes23pdUdlOMm39kluR709ZpsU0noquSXQuBRL1qftQ9F/S83tD9kgnrCr69Civ8AHSi7RKh7CmIvjbi2CpqBzDRfzZtbpK2JE5Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SN7PR11MB6924.namprd11.prod.outlook.com (2603:10b6:806:2ab::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.11; Tue, 15 Sep 2026 12:39:16 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 12:39:16 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
Subject: Re: [PATCH v8 3/5] drm/i915/xe: plug the pme_enabed implementation
 for xe
Thread-Topic: [PATCH v8 3/5] drm/i915/xe: plug the pme_enabed implementation
 for xe
Thread-Index: AQHdRPQ2b87hh1wwDUGukEY7sRj55LbPlIUA
Date: Tue, 15 Sep 2026 12:39:15 +0000
Message-ID: <16773df0039d010c34b6281676923b6a45e2d045.camel@intel.com>
References: <20260915092518.639448-1-vinod.govindapillai@intel.com>
 <20260915092518.639448-4-vinod.govindapillai@intel.com>
In-Reply-To: <20260915092518.639448-4-vinod.govindapillai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SN7PR11MB6924:EE_
x-ms-office365-filtering-correlation-id: 665b1128-3c2d-4dbf-7e77-08df13265a9a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|56012099006|5023799004|11063799006|4143699003|10067099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: glBDU4qwo4wh7qwLhX784eK3opRfeygrkXCQErUzk+lD+Fihdj4TufoDjgzu6bWcxe4B19/JMr3g2pKRW/XWZmiBgIporDa+tAMvlr6akCAlPYd3+pB/3+ivSLgYzrocUxAMf8ixrGQzwJNpcXgGPdZlgAtTXCMUjsFra2u922Rdt0buPTVoXXxr2Quxlr2HqaCpiGbzxCUURNiDQQ+aMPekx+gzhC0ZEsah12qX6epbSQHOmDpheXtVMjXKpeUo9/OeKMZeBkDpCczfbgDrJ15fZp2r2w2GsBAbxSHumeXdw01ZIwvzRK7g1XxXMhyOFYCcG8yAo/rH+/EfPIhYrQTiBTP8VV1TNr3CKRL4Ez3JkOd2ZPlke0s2MLSlPf7Z4biQHPwSGfrD+XsEd3PIPu8COV+1CFafcRNreARYeqiFYzr3ceLFHz1cKoBHg2clu3V/uRRcxPBc0s7brQnbySQrKkLDI+Q7JzFtQ4aP24MQ4xOo5KO7aLLGW41IIH6kH916xQrpvCLHfliCZ9T4CYa/r+nVvvTCbN1WBbeNnLTXmkFuhmIvYk1ihIY4mKOLWEu2HPjHlqCu/FOgoF+Npeyejtpe8lu2gr/RY1Lacuw0JnEVFC5Uc9BG2A+EUZ3FYfXTxs+eocUAuhAYwzu01cNVF/NbXfqLqN6Ml82K/rd6/t+HhcQXyn8WMW5nZvzvTU3/uWW7b8tiFCxJ1J9+BpRlpb/xjvg25NvLL5wCk6M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(5023799004)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UDVVQWpOVWV3dDJoeUwydVJYRndtZEdmQjA0MTRpQU55bTBScnRZS3ZFa2xa?=
 =?utf-8?B?SEpVQzNCUkhrOCswbFREWlhVNlFRa0g3OWZzU2VpdVlFblNkYnFJRVh2SE5x?=
 =?utf-8?B?dGU2Q09DMG9kTUpEWFhsM09CQ2F5elVETWFqUElMK3B2VUw4bzBNdE5PR2xY?=
 =?utf-8?B?KzZtdzJHaGVPMVY1K2U3alZoWllHSzc1R05YSlg2RGlRUUMyaE9oa2xUTEJ5?=
 =?utf-8?B?WUFCSUxhcUdqYTVGMWl5QndEUHpHZnBsNTVMN1lPUHpZS0pqUnFRVG9rTlE3?=
 =?utf-8?B?MWpmUjJzV2QrZ0dvNE9tTG01SnlGcWlJQnhvY0RwQ0hmZGlRMDF6M3F0czBP?=
 =?utf-8?B?NURKLzdvZnhTNnJsckJFZzFhZmhUYWdYWWdKV0ZWdkVHUFROOFZ3SDVDTUlC?=
 =?utf-8?B?dXlrNC8zY1dtd3cxdlRlZFdNbStiNTB4WUZncytaa1VGUUdnWEJCVloyWFN0?=
 =?utf-8?B?ejhKdTQ4dWs4cGdpWm84RmtmTk41QU9lZlJ0R1dwZ3pEZExhVzRjRkE2T29q?=
 =?utf-8?B?dWVLUWY5aTZPRitpR3hjNE5lR20xR3dFMkFySFVpZm5MTGR0YzhuRW1JRlpV?=
 =?utf-8?B?NEtabUs4dkRncjl6dmdmVEhNL3laUWRkRkdtM1VWWEdJcEJEK29xdk5hbFBn?=
 =?utf-8?B?Ry9iVlBYaWViamFCSTRCc0VEK2wzRDJPZElRaHdJWjRVUUx3dWJPcTJ1U3Vt?=
 =?utf-8?B?SVVYSSs5OVNqakg5SjZBaXJ2K1RqVTB3K1JLemM5Y0xHNWxLU3NGdmxYWjV5?=
 =?utf-8?B?VEdZMVZPN2JUL2ptUGFGa0lnVjZDN1JXQnBsTVJmM1ZNMEhYdjRwMGNidWI5?=
 =?utf-8?B?YU1aYzhzaEp5Lzk0enNFc1NoWEtaazlEUSt4Zk1vczh5YTRvTHlNS09TdzRi?=
 =?utf-8?B?MWxZRy9FWTVlTng3VnFpZW56M2ZYc0VGeTk5ZG9rYXRIZVBEKzFSYmFIaG40?=
 =?utf-8?B?YUhXZVZOSVlPR1RpaHhZcUxDeUhWcXhKSjRBSktiTFBGTGJFQkUyRWlldXNy?=
 =?utf-8?B?QUFmUndUQ216TVVuWWxubTFuTHVuYVlWQW10dkRxOTI5S2JzRG9GQWtEbEIz?=
 =?utf-8?B?WFRaZUNPVVIvRksxWDgxWmtUQlpMK2JUMkZHeFVBYmRINWNPL29iSC9qajlP?=
 =?utf-8?B?SmFnMmdOQUFLVlZjOXVkVTFiN3Bxc1JmQWJPOXFoRlZJVnc1M0IzaUpFNFFw?=
 =?utf-8?B?MXdxUFRTYlVJSzRIYzk4NVNlL1FkY3JCUG9zZXJuUFB3OHhadTZsVC9FQXha?=
 =?utf-8?B?NXErb1oyNHJPemUwLy9EZyt6c2hyV1RoREpwZko3RHdBZlA5aWU1ZGlIaUNx?=
 =?utf-8?B?MU5rRnNnTFNwTFg1NitnTWtubGlCTDkzT3FsZEN3MnROTW1WUGNoSGlGTGJO?=
 =?utf-8?B?aHFtVDdyZGU1b3VGbFpnQ1FjN2FiYkEraDhlaS9uTWUyVDZ1TzEzWTZDdUxQ?=
 =?utf-8?B?bCttQ1grNXZUaEw5T2t4dmlnTFJJSk96S0VScWx5L3pKNzdWQ2dkYzJlbmE3?=
 =?utf-8?B?RCsrdXM1cTU0ZmhUVllEMUV0aE0vMHUzRVFHdUlCTTdocnU5VnZ2OXNOMC9h?=
 =?utf-8?B?Yit5d2tFbXVnaEdGM3JMRURjSThWM1hTYmxuSHdYak4zbzdRM0dlTFdFRXNR?=
 =?utf-8?B?R28rd3hka1lydkpQMnh1dnIyM0ZnRmRLSlBPbWFTRWhTTlBhdDA4SDhDUitZ?=
 =?utf-8?B?bGRpMlF0U2tDemt1KzhtUm15SzVSTkVaWm9uN2Q0d0NNeTYybVFzRWRVOFRG?=
 =?utf-8?B?V3htdHFxSmVrNDJCWHBwbXVlUmRaaHowemRMSEFRN1lIRTZ2RFJwNVdFMjJK?=
 =?utf-8?B?VEE0cytBS0xUSGw2ZVIrSU81RWp2cFlYdEltN3NSVExpamZqbll6d29aaTZo?=
 =?utf-8?B?KzBJTmpqcjg3eDNHMXhKbUJsVm9uR080YkJ4RlF5b05wWllCQkFLN2R3Vmdo?=
 =?utf-8?B?clQ2bnd4UHdnMWtkSU1ZMjRxK2RuMk9HVGhTZFA1WGNsdWticnpUMnNEakI2?=
 =?utf-8?B?SlA4aTBrRjB3VEJ2Kzg2NnY5cnNPWlBJbklCSGxwcFFUWWNwd3ZNSVh2aXZG?=
 =?utf-8?B?K256ZnZDNUtud3lPaW10YkJ6a2VPdEpOS0QyWGJuNUI2RmJNUys2RXJSb0Rn?=
 =?utf-8?B?cmg1c3RvVEFCcDd5Uk1mMXV1V2pPbEpRTmpFNXBmS2RLd0hqNC9HRzZmMEtY?=
 =?utf-8?B?azBtYzBEV29JMVRkQ1NGSUhJcFBpN1dsSTg4aDVTUExRa1VzVmNsa2tRV29J?=
 =?utf-8?B?bExOMFptZit4TXdkSHBMWlBnV1NFZlRNd0ZwaTJrM0xNdDdWcXVsSUpvaWJJ?=
 =?utf-8?B?NjV5VHAwRXFkQ0ZMZzlXWlIrdEtiT1hqMUxud0htejdya2pPdTQ2RHBOekZi?=
 =?utf-8?Q?p43NwPOsXwAUyzic=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1DFA92EC70A83141A3FC4B871817BFEE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 0V9+jOJJR5003pvFXcFGMcH4FlXSulD9NTAOgZ8C7g7DMi6fyJgmwrOPO1Xz9IdvG3//M7HpZxhK3/0G6UZoDxkc89XAjGTosunxjQxqU9SZmoodXObzcm63wB7ZY9+GGsnkoKDRUIVsRNNUta8xZCU5HarXyrBR8q41zk2JcrIf1LGry1v3PfTBGC9M29IVFxDGdTP+deUYKFbGAUxcEQdOSd7Qpz8ZgKtGpZ+XXAwsF/XEvtnp00Dwvlp6WT/uNL6wguzYnzFHVogIPgAsBfhmrvh7HR5IRY8Ezo7PHaEGG/pXHD2nGGVQXOsmMACovxRRGNXmgxTcLjVskkn9Ow==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 665b1128-3c2d-4dbf-7e77-08df13265a9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 12:39:15.9470 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ccj/ShHoI+ZQYIu1oRPNXTHy+8Lmn/Mq+i4jiZgi4gGlcyvI8I6gnxegsU5xinhX7Ey44rrHKr18oC5wrqMfeouX7tPl03yLUKbf6kJIItc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6924
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

T24gVHVlLCAyMDI2LTA5LTE1IGF0IDEyOjI1ICswMzAwLCBWaW5vZCBHb3ZpbmRhcGlsbGFpIHdy
b3RlOg0KPiBQbHVnIHRoZSBwbWVfZW5hYmxlZCBxdWVyeSBmb3IgeGUuIEl0IHdpbGwgcmV0dXJu
IHRoZSBjdXJyZW50DQo+IFBNRSBzdGF0dXMgZm9yIHRoZSBkZXZpY2UuIEZvciBzdXBwb3J0ZWQg
cGxhdGZvcm1zLCBQTUUgaXMNCj4gZW5hYmxlZCBkdXJpbmcgcnVudGltZSBzdXNwZW5kIGNhbGxz
IGlmIHRoZSBkZXZpY2UgaXMgUE1FIGlzIGNhcGFibGUuDQo+IA0KPiB2MjogdXNlIHRoZSB4ZV9w
bV9wbWVfZW5hYmxlZCgpDQo+IA0KPiBBc3Npc3RlZC1ieTogR2l0SHViX0NvcGlsb3Q6Y2xhdWRl
LW9wdXMtNQ0KPiBTaWduZWQtb2ZmLWJ5OiBWaW5vZCBHb3ZpbmRhcGlsbGFpIDx2aW5vZC5nb3Zp
bmRhcGlsbGFpQGludGVsLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEpvdW5pIEjDtmdhbmRlciA8am91
bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS9k
aXNwbGF5L3hlX2Rpc3BsYXlfcnBtLmMgfCA2ICsrKysrKw0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUvZGlz
cGxheS94ZV9kaXNwbGF5X3JwbS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVf
ZGlzcGxheV9ycG0uYw0KPiBpbmRleCA1NDhiNTAzYWEwMjQuLjU3YmNmYjQxYmRkYSAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVfZGlzcGxheV9ycG0uYw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9kaXNwbGF5X3JwbS5jDQo+IEBAIC00
NSw2ICs0NSwxMSBAQCBzdGF0aWMgYm9vbCB4ZV9kaXNwbGF5X3JwbV9zdXNwZW5kZWQoY29uc3Qg
c3RydWN0DQo+IGRybV9kZXZpY2UgKmRybSkNCj4gwqAJcmV0dXJuIHBtX3J1bnRpbWVfc3VzcGVu
ZGVkKHhlLT5kcm0uZGV2KTsNCj4gwqB9DQo+IMKgDQo+ICtzdGF0aWMgYm9vbCB4ZV9kaXNwbGF5
X3JwbV9wbWVfZW5hYmxlZChjb25zdCBzdHJ1Y3QgZHJtX2RldmljZSAqZHJtKQ0KPiArew0KPiAr
CXJldHVybiB4ZV9wbV9wbWVfZW5hYmxlZCh0b194ZV9kZXZpY2UoZHJtKSk7DQo+ICt9DQo+ICsN
Cj4gwqBzdGF0aWMgdm9pZCB4ZV9kaXNwbGF5X3JwbV9hc3NlcnRfaGVsZChjb25zdCBzdHJ1Y3Qg
ZHJtX2RldmljZSAqZHJtKQ0KPiDCoHsNCj4gwqAJLyogRklYTUUgKi8NCj4gQEAgLTY5LDYgKzc0
LDcgQEAgY29uc3Qgc3RydWN0IGludGVsX2Rpc3BsYXlfcnBtX2ludGVyZmFjZQ0KPiB4ZV9kaXNw
bGF5X3JwbV9pbnRlcmZhY2UgPSB7DQo+IMKgCS5wdXRfcmF3ID0geGVfZGlzcGxheV9ycG1fcHV0
LA0KPiDCoAkucHV0X3VuY2hlY2tlZCA9IHhlX2Rpc3BsYXlfcnBtX3B1dF91bmNoZWNrZWQsDQo+
IMKgCS5zdXNwZW5kZWQgPSB4ZV9kaXNwbGF5X3JwbV9zdXNwZW5kZWQsDQo+ICsJLnBtZV9lbmFi
bGVkID0geGVfZGlzcGxheV9ycG1fcG1lX2VuYWJsZWQsDQo+IMKgCS5hc3NlcnRfaGVsZCA9IHhl
X2Rpc3BsYXlfcnBtX2Fzc2VydF9oZWxkLA0KPiDCoAkuYXNzZXJ0X2Jsb2NrID0geGVfZGlzcGxh
eV9ycG1fYXNzZXJ0X2Jsb2NrLA0KPiDCoAkuYXNzZXJ0X3VuYmxvY2sgPSB4ZV9kaXNwbGF5X3Jw
bV9hc3NlcnRfdW5ibG9jaw0KDQo=
