Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C467DC7EE23
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 12:46:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E9110E4EA;
	Wed,  7 Jun 2023 12:46:32 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8624810E4EA
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 12:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686141991; x=1717677991;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=JOq8jfy3UCn4VMQDD/1D9xo29aA5ykKrUoINctE3/2o=;
 b=eXe6iX+t1ziNjr7mDwXttWUx3BlGSiYe8wHuQTyiywyygQJmz4IcW7+R
 +Vt0an7agByRP3gy9/jM99TA/O9ByXyX+UZVlN9qAitGdSmvzbTxY644U
 QycI7nNvLQDGqVG+QxSNAU56w7h88DQ7gxr8we7nWOlwivnDKEN4FHW/H
 oY7qXKcY/fb3LBKzRHGUtahwTyrd4YYmIhi8M30Ku9F6e3/9aHjaYchVL
 DuUWbqV5Y+eZU9odJkVoYLVCcP+kutEuvJC+xsEdK+0M2fXcPLg5PMwV3
 iCurxxH1JKPsaBpudvhZOnVPp75f4aSOKJjdyv6WT3l5cYO/FympBBuiN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="337334110"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; d="scan'208";a="337334110"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 05:46:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="686980151"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; d="scan'208";a="686980151"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 07 Jun 2023 05:46:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 05:46:29 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 05:46:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 7 Jun 2023 05:46:29 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 7 Jun 2023 05:46:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/TTX+GRds3y7/Q87P0p2V60ME13kxT7LUHv/kElSWry3NI+KPr17hchEp5xuOramObSg8/JJHDAY4OfH8VTcbpJfR5ugN7XMrHZuihMR2MPjw+yTo/1xQVvqYWDTtR2X9BTTm8r8HJ+mwKgtea+/67A1UDlBZtk9cQQRNBwbMCZaa8oosfH1y5EiYHI3ljzzPua34OCZD0aPbl4jxlmCZHx+VcOUO9kqDjgbLZRJ4e8iiXeFYrZPdGpeMnmTT+YcYL2LoFpLMF9UOJa04IwuJ20yheRW5ZY2q89gBLqq2lRFOONaX7aZ1yPu67eGqS/H4MzlAD19Dbm5IjvyqcNjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JOq8jfy3UCn4VMQDD/1D9xo29aA5ykKrUoINctE3/2o=;
 b=I5LAS8clLClC2lHXI49XKzLaXekWUKvmmRJGiiURQgOPNQViFT7x2BCMcWjl5LXr2ciVy1ib3GMHiCVxP+QP2+o2sPJtZIZ68caagix7hdjDTTZo6CVg0uSGqZupv+eK4Dhh3S5lylWD0tZRpu1vbbSeHJrMsOTPg+/E9DwL3UgG5Zj7UbjogS4k+z6yea0hQM0d2NkFTSfPpjZn8sRh7tXSmKwMj1viY5NXgUbTAXcsd2dO2/zPTunwRd3wNg9gWQkrZfhaA6382c5jqlq0LDdi9ykopi3YgXGx5Z4Ee975WeVjbqsczl4q+xG7oK7M5jZkMhxdQwk/A3O5uDF3hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CY8PR11MB7745.namprd11.prod.outlook.com (2603:10b6:930:90::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 12:46:27 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::3204:9161:6e53:13f8]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::3204:9161:6e53:13f8%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 12:46:27 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH V2 3/3] drm/xe: Add sysfs entry to report per
 tile memory size
Thread-Index: AQHZmSeXbgiSaTwMSketaF3iAuBm4K9/PQAAgAAGetA=
Date: Wed, 7 Jun 2023 12:46:27 +0000
Message-ID: <SJ1PR11MB62042F98B570A65887CE88458153A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230607101103.2127088-1-tejas.upadhyay@intel.com>
 <20230607101103.2127088-4-tejas.upadhyay@intel.com>
 <94ca03ac-bd67-dbc1-e827-b6f74776652e@intel.com>
In-Reply-To: <94ca03ac-bd67-dbc1-e827-b6f74776652e@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CY8PR11MB7745:EE_
x-ms-office365-filtering-correlation-id: ef2c51bd-8bc6-4040-08b6-08db67553590
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2fk/RcLPTyW3cDXuEpqb5CgP6irz+IvY5d4RxbVPt6iehQLq5MYhun2foAsYw3pHikVjE8agyAKyervRid+FeVUMip7mmn06fsrXobkuLBnumqZwMXrDXB3elBdjo6nRHBHtCCQHNwZ9WLmsMNIQdGTMVLQddR5UHFshcrCp+85dVLhORgi1t96ZrcOcU5yCgLwMjVyyS2fy0VyRK5mc7D1k8Bx6NEWEhqfhM8bJPEpQ+iSnCfxgExHUW2xPtO8/YKdeAYTLwDIF9SfBV/b4URkadk72zM7rsKjvWj1R2uxpLJhfaJnakyS1BWboHPOuPoI1CVzk43YQGtqCTBHIOXuJN064lv7PGhVD0IfYBFRs29++AnQitAEhwfMdG1Docj6EBzHGpmXDOkoKWi0EB0fNXigZEzw7NqBhAt3kSGdhvo4chmmZUm0fmI47wJe7TQsa0clM5zIUySqHN5RkweZncaW9NMlcl2XqE1XQ4zTUz6YvPy+yrXE+Q5oYUzDnuLi5K+4pfH9mD0wCtSNwP7GmEP1PGuMZfH2SzdXBZavuDOJDneQbklRmWBD2g2l+RnQpjoFnpx0gnktk35ORFbCzeH18q3buccmjGktxFRhbApWmbF03lwb/fYuNYtrV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(366004)(376002)(396003)(136003)(451199021)(83380400001)(2906002)(86362001)(33656002)(38070700005)(122000001)(82960400001)(38100700002)(55016003)(41300700001)(316002)(52536014)(5660300002)(8936002)(8676002)(7696005)(110136005)(478600001)(64756008)(66556008)(71200400001)(66946007)(66446008)(66476007)(76116006)(6506007)(9686003)(53546011)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NE91ZW4xNmdQUFlQK21XbFM2UjdCWHM1bkw1TWpEODY0L0x3R3BzVmt5a3ov?=
 =?utf-8?B?akR6Rm40Z1ZmUFI2elE2alBTUE1rc2Q0MDN5bTQ1VlFxWUI3U0N5SEEvOG52?=
 =?utf-8?B?Y0Nmd3JoWkNVM2lCaytjS05aR1pyZTVtYmZoQyt2MThSdmkreitDei9NYTVi?=
 =?utf-8?B?dDBsSVBPOTVwMW5QNG1GNC8ycTA3QkNOcEFZMzZWRHhmbzdDM0RMTmlsOTZ0?=
 =?utf-8?B?Y3JOZmhOZ250cE8vSzRMRGxOV3N0aUptZzRUc1hORDBIM0k2ZFo4cTFvdDZ3?=
 =?utf-8?B?Z0xaNlpRWVRzb2I3QmtldHpyMk8zNWRGcEROeXJFbENiRVFqV0dlTCtSQUYr?=
 =?utf-8?B?QzB4YUlpajN5NUhBY3Z0eHFaZ3hUQXJkdjBjNllUQzhRMEpybVNCY1RiTW5P?=
 =?utf-8?B?eWlFTk1OcWgyRy94K0NUczU3L01VSldxQmhqNnYyNXpnR1NOOU05WGdVUmhD?=
 =?utf-8?B?STRDT0FsNCtWby9ZQ0lLcmdQeWlYRUlISzYzSlFIRjNrNmkycmhFVkdRWHVP?=
 =?utf-8?B?Y21mMEo4U0NBTVdKYUI3SVMzNVJTNDFFK3hORzY0WHVlWWtvMHExVUFhT3Rs?=
 =?utf-8?B?NG14MWdLdlMvOFN3MWtnT0hTN0UwSDdkaDRONEFjeU5NVUovM1VabXpLa01F?=
 =?utf-8?B?Q096cWJuYm1NWWU2MjdlYzNnaXMyN091M0NoNDB2Sml6SXRlYTNMMTB2YVZX?=
 =?utf-8?B?U1V1TkRkb2V2U0ZlMGRoRUYzNm51bFg0RGlXcjNtUFJYQ1FnTnUzTUtrK25G?=
 =?utf-8?B?QWFGNm9UblhXcXlxYWRDMm1VUCtHcUFxaEUwOVFKZzQ2N3RaQ2RSQXJJM3Fo?=
 =?utf-8?B?UzcyQ0dNdXBvL2xNRjExblZlUjNMSUNtUDNwdFY3enZSdXNLZlJhVVhGVFdO?=
 =?utf-8?B?em5DME9abmhlc2tKVnBHWGlDYTZtRWJrbThIUVg1UnFNdG0yckYvVW1ua2Ji?=
 =?utf-8?B?Zk9iMWRCNitiVElWaVYxUG5mZHhqdlJqN0NORS9lUy9vNWhYQXgydzFES09a?=
 =?utf-8?B?eTNrMXB6aUlSWjYzN1dyUFJnemQvRzUzb1JtMFFjdmtQU0xIbXlhRWpvUmxt?=
 =?utf-8?B?RGs2cWhkZGtJeSt5c3dXeVo2STkvLzVxRVJtM011UXlRbCtlV3RnNEZCMTVK?=
 =?utf-8?B?cDJkVldHa2dET2VmM0xaYlpSZVZrVUdseDlMdjBlVVhkMlc0Wi9BT0pmQWV3?=
 =?utf-8?B?cFRyRVI2YTg2dFAxWGttWHRYRlNnRURzR0lKdTc4QjF5aWdkTTFLUmxIVHk4?=
 =?utf-8?B?emdWUTRxWTVZeHhScFJiRnViQllrSVk5MjBDK1AyRGdGR2xHU3JWd3dtZHR3?=
 =?utf-8?B?TDAwSkRRa3ZNd3FNTlFud1pPUE03VjRveDRodFEwaXpyNTByU3Bwb3FXMCtW?=
 =?utf-8?B?ZWJ5VDI4V2dWMHhhblNoR25NcGhpT0tGdEZ5a2g1TVRnVjQwUDY0alFwWWtY?=
 =?utf-8?B?ZnQ1NGh4NUE1V0JMeUlPQ3hBNG56ZHpCM1FJdVQrT25PZittYTJPbGhkT1I3?=
 =?utf-8?B?a3MzN1JrZllMK29qY3RBTisrRHJTUnBuTlFoeDNjcHZMRFhGY2Q2RUZNUXpG?=
 =?utf-8?B?aE1mZWVmT1cxRllUZURSeTRKZExNQU1Bb0J6cThHUUhWbG1scU4zMGd4Zncz?=
 =?utf-8?B?eVVSNSt0cGhOeitpWlRnbTVGSkxSRS9QZW5WVkN5NHFJNmFJOTFtdTYrTXBY?=
 =?utf-8?B?UlpxcUhNUGp5cjBjdDA4OVlWVktObjVKbmNEQ1hISGFId1YvSXcwUStOMmM4?=
 =?utf-8?B?cXk1Z0YreERXbXpabU9TYWxpVW1qVnhxSXVzR2dYZWU0N0xxaVV5di9hVUhZ?=
 =?utf-8?B?REI1cGgxMk1DdHJJVEpteTluK1FxT2RKM3oyUHFHRjBVbkF6VkdCS3hlMnE2?=
 =?utf-8?B?QWVINFFjS2RhSWR0L2dyTkdRYXFEWGZ4THFKN1RzTi94WFVadGZQOTlSRUw3?=
 =?utf-8?B?dityVjdrTTQ1K2U3L1lWUGVkdlZyMXB5NWMrSENKdGxPY3ZpTmpUa0M0Ui94?=
 =?utf-8?B?S3ViNWRUWVpzUlZUdG8zWHdrRFFYamlCY2MxNmtTMnBIOXVJRFIxakVHOTdH?=
 =?utf-8?B?VWJBZlpRanJZMnNwUURIUUVIUGVDUTFPamJQYmxObEh5cTZ3c1V6Umh6R2N2?=
 =?utf-8?B?VzRXaTdObndEMEdHYjV4MXEyM3dPMkZwZVFmeHJ2SW15QWRLQUMvNnZ0emx4?=
 =?utf-8?Q?CaJfJyMPaljETRWkgeggc5vV4EHFXtNYlvGDvkk+Rtlz?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef2c51bd-8bc6-4040-08b6-08db67553590
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2023 12:46:27.1560 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cetazE30C7Grjyg8Dp1DvBTK0lQ3jzt+82/5VB5rtZPIsyc8g55KhDvLCZpxpPPmaZ894kz5JQ2iLzsciZXRJxVH7/Ph8lbQeRX0ATJ6PJo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7745
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V2 3/3] drm/xe: Add sysfs entry to report per
 tile memory size
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSWRkYW1zZXR0eSwgQXJh
dmluZCA8YXJhdmluZC5pZGRhbXNldHR5QGludGVsLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBK
dW5lIDcsIDIwMjMgNTozMSBQTQ0KPiBUbzogVXBhZGh5YXksIFRlamFzIDx0ZWphcy51cGFkaHlh
eUBpbnRlbC5jb20+OyBpbnRlbC0NCj4geGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1Ympl
Y3Q6IFJlOiBbSW50ZWwteGVdIFtQQVRDSCBWMiAzLzNdIGRybS94ZTogQWRkIHN5c2ZzIGVudHJ5
IHRvIHJlcG9ydCBwZXINCj4gdGlsZSBtZW1vcnkgc2l6ZQ0KPiANCj4gDQo+IA0KPiBPbiAwNy0w
Ni0yMDIzIDE1OjQxLCBUZWphcyBVcGFkaHlheSB3cm90ZToNCj4gPiBBZGQgc3lzZnMgZW50cnkg
dG8gcmVhZCBwZXIgdGlsZSBwaHlzaWNhbCBtZW1vcnkgaW5jbHVkaW5nIHN0b2xlbg0KPiA+IG1l
bW9yeS4NCj4gPg0KPiA+IFYyOg0KPiA+ICAgLSBVc2UgREVWSUNFX0FUVFJfUk8gLSBBcmF2aW5k
DQo+ID4gICAtIERvbnQgcHV0IGtvYmogb24gc3lzZnNfZmlsZV9jcmVhdGUgZmFpbCAtIEhpbWFs
DQo+ID4gICAtIFNraXAgYWRkcl9yYW5nZSBzeXNmcyBjcmVhdGUgZm9yIG5vbiBkZ2Z4IC0gSGlt
YWwNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFRlamFzIFVwYWRoeWF5IDx0ZWphcy51cGFkaHlh
eUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2Vf
dHlwZXMuaCB8ICA2ICsrKysrKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfbW1pby5jICAg
ICAgICAgfCAgMSArDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlX3N5c2ZzLmMgICB8
IDI5ICsrKysrKysrKysrKysrKysrKysrKystLS0tLS0NCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAz
MCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPiA+IGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2RldmljZV90eXBlcy5oDQo+ID4gaW5kZXggZGI2MWRhNGQ2MjEyLi5iOGEwNzgyNmM2
NWYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5o
DQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+ID4gQEAg
LTEwNyw2ICsxMDcsMTIgQEAgc3RydWN0IHhlX3RpbGUgew0KPiA+DQo+ID4gIAkvKiogQG1lbTog
bWVtb3J5IG1hbmFnZW1lbnQgaW5mbyBmb3IgdGlsZSAqLw0KPiA+ICAJc3RydWN0IHsNCj4gPiAr
CQkvKioNCj4gPiArCQkgKiBAYWN0dWFsX3BoeXNpY2FsX21lbTogVHJhY2sgYWN0dWFsIExNRU0g
c2l6ZQ0KPiA+ICsJCSAqIGluY2x1ZGluZyBzdG9sZW4gbWVtIGZvciB0aWxlDQo+ID4gKwkJICov
DQo+ID4gKwkJcmVzb3VyY2Vfc2l6ZV90IGFjdHVhbF9waHlzaWNhbF9tZW07DQo+ID4gKw0KPiA+
ICAJCS8qKg0KPiA+ICAJCSAqIEB2cmFtOiBWUkFNIGluZm8gZm9yIHRpbGUuDQo+ID4gIAkJICoN
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21taW8uYw0KPiA+IGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX21taW8uYyBpbmRleCBmN2E3Zjk5NmIzN2YuLjZmZWJkMTFkN2Rk
OQ0KPiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW1pby5jDQo+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21taW8uYw0KPiA+IEBAIC0yNzcsNiArMjc3LDcg
QEAgaW50IHhlX21taW9fcHJvYmVfdnJhbShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gPiAgCQlp
ZiAoZXJyKQ0KPiA+ICAJCQlyZXR1cm4gZXJyOw0KPiA+DQo+ID4gKwkJdGlsZS0+bWVtLmFjdHVh
bF9waHlzaWNhbF9tZW0gPSB0aWxlX3NpemU7DQo+ID4gIAkJdGlsZS0+bWVtLnZyYW0uaW9fc3Rh
cnQgPSB4ZS0+bWVtLnZyYW0uaW9fc3RhcnQgKw0KPiB0aWxlX29mZnNldDsNCj4gPiAgCQl0aWxl
LT5tZW0udnJhbS5pb19zaXplID0gbWluX3QodTY0LCB2cmFtX3NpemUsIGlvX3NpemUpOw0KPiA+
DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlX3N5c2ZzLmMNCj4g
PiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlX3N5c2ZzLmMNCj4gPiBpbmRleCAwOWE0YTgz
NDJhZWMuLmI1NzY4YzczNWNiYSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfdGlsZV9zeXNmcy5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGVfc3lz
ZnMuYw0KPiA+IEBAIC0yMiw2ICsyMiwyMSBAQCBzdGF0aWMgc3RydWN0IGtvYmpfdHlwZSB4ZV90
aWxlX3N5c2ZzX2tvYmpfdHlwZSA9IHsNCj4gPiAgCS5zeXNmc19vcHMgPSAma29ial9zeXNmc19v
cHMsDQo+ID4gIH07DQo+ID4NCj4gPiArc3RhdGljIHNzaXplX3QNCj4gPiArYWRkcl9yYW5nZV9z
aG93KHN0cnVjdCBkZXZpY2UgKmtkZXYsIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLA0K
PiA+ICtjaGFyICpidWYpIHsNCj4gPiArCXN0cnVjdCB4ZV90aWxlICp0aWxlID0ga29ial90b190
aWxlKCZrZGV2LT5rb2JqKTsNCj4gPiArDQo+ID4gKwlyZXR1cm4gc3lzZnNfZW1pdChidWYsICIl
cGFcbiIsICZ0aWxlLT5tZW0uYWN0dWFsX3BoeXNpY2FsX21lbSk7IH0NCj4gPiArDQo+ID4gK3N0
YXRpYyBERVZJQ0VfQVRUUl9STyhhZGRyX3JhbmdlKTsNCj4gPiArDQo+ID4gK3N0YXRpYyBjb25z
dCBzdHJ1Y3QgYXR0cmlidXRlICphZGRyX3JhbmdlX2F0dHJzW10gPSB7DQo+ID4gKwkmZGV2X2F0
dHJfYWRkcl9yYW5nZS5hdHRyLA0KPiA+ICsJTlVMTA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiAgc3Rh
dGljIHZvaWQgdGlsZV9zeXNmc19maW5pKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHZvaWQgKmFy
ZykgIHsNCj4gPiAgCXN0cnVjdCB4ZV90aWxlICp0aWxlID0gYXJnOw0KPiA+IEBAIC0zNywxMCAr
NTIsOCBAQCBpbnQgeGVfdGlsZV9zeXNmc19pbml0KHN0cnVjdCB4ZV90aWxlICp0aWxlKQ0KPiA+
ICAJaW50IGVycjsNCj4gPg0KPiA+ICAJa2cgPSBremFsbG9jKHNpemVvZigqa2cpLCBHRlBfS0VS
TkVMKTsNCj4gPiAtCWlmICgha2cpIHsNCj4gPiAtCQlkcm1fd2FybigmeGUtPmRybSwgIiVzIGZh
aWxlZCwgZXJyOiAlZFxuIiwgX19mdW5jX18sIC0NCj4gRU5PTUVNKTsNCj4gPiArCWlmICgha2cp
DQo+ID4gIAkJcmV0dXJuIC1FTk9NRU07DQo+IA0KPiB5b3VyIGZpcnN0IHBhdGNoIGludHJvZHVj
ZWQgaXQgYW5kIHlvdSBhcmUgZml4aW5nIGhlcmUgc2hvdWxkIGl0IGJlIGZpeGVkIGluIHRoZQ0K
PiBmaXJzdCBwYXRjaCBpdHNlbGYgYW5kIHdoeSB0aGlzIGNoYW5nZSBhcyB0aGUgcmV0dXJuIGZy
b20gdGlsZV9zeXNmc19pbml0IGlzIG5vdA0KPiBiZWluZyBjaGVja2VkLg0KDQp5ZXMgaSBhbSBj
aGFuZ2luZyBpdCBiYWNrLi4uLi5hbmQgcmV0dXJuIHdhcyBhbHJlYWR5IHRoZXJlIGluIGZpcnN0
IHBhdGNoLCBpdHMganVzdCBJIHdhcyB0cnlpbmcgdG8gYWRkIGRybSBsb2cgd2hpY2ggaXMgbm90
IHJlcXVpcmVkIGJlY2F1c2UgdW5kZXJseWluZyBtZW1vcnkgQVBJIGFscmVhZHkgZHVtcHMgbG9n
LiBJIHdpbGwgY2hhbmdlIGl0IGJhY2sgaW4gZmlyc3QgcGF0Y2guIEFsc28gSSBhbSBjaGFuZ2lu
ZyB0aGlzIEFQSSB0byByZXR1cm4gdm9pZCBhbmQgcmVtb3ZlIGFsbCByZXR1cm4gdmFsdWVzLiBB
bGlnbmVkPw0KDQo+IA0KPiA+IC0JfQ0KPiA+DQo+ID4gIAlrb2JqZWN0X2luaXQoJmtnLT5iYXNl
LCAmeGVfdGlsZV9zeXNmc19rb2JqX3R5cGUpOw0KPiA+ICAJa2ctPnRpbGUgPSB0aWxlOw0KPiA+
IEBAIC00OCwxNiArNjEsMjAgQEAgaW50IHhlX3RpbGVfc3lzZnNfaW5pdChzdHJ1Y3QgeGVfdGls
ZSAqdGlsZSkNCj4gPiAgCWVyciA9IGtvYmplY3RfYWRkKCZrZy0+YmFzZSwgJmRldi0+a29iaiwg
InRpbGUlZCIsIHRpbGUtPmlkKTsNCj4gPiAgCWlmIChlcnIpIHsNCj4gPiAgCQlrb2JqZWN0X3B1
dCgma2ctPmJhc2UpOw0KPiA+IC0JCWRybV93YXJuKCZ4ZS0+ZHJtLCAiZmFpbGVkIHRvIHJlZ2lz
dGVyIFRJTEUgc3lzZnMgZGlyZWN0b3J5LA0KPiBlcnI6ICVkXG4iLCBlcnIpOw0KPiA+ICsJCWRy
bV9lcnIoJnhlLT5kcm0sICJmYWlsZWQgdG8gcmVnaXN0ZXIgVElMRSBzeXNmcyBkaXJlY3Rvcnks
DQo+IGVycjoNCj4gPiArJWRcbiIsIGVycik7DQo+IA0KPiBzYW1lIGhlcmUsIGJ1dCB3YXJuIGlz
IG1vcmUgYXBwcm9wcmlhdGUgdGhhbiBlcnIuDQoNCk9rLCBzaW5jZSB3ZSBhcmUgbm90IGNoZWNr
aW5nIGZvciBlcnJvcnMgbm93LCB3YXJuIGlzIGZpbmUuDQoNCj4gDQo+ID4gIAkJcmV0dXJuIGVy
cjsNCj4gPiAgCX0NCj4gPg0KPiA+ICAJdGlsZS0+c3lzZnMgPSAma2ctPmJhc2U7DQo+ID4NCj4g
PiArCWlmIChzeXNmc19jcmVhdGVfZmlsZXModGlsZS0+c3lzZnMsIGFkZHJfcmFuZ2VfYXR0cnMp
ICYmDQo+ID4gK0lTX0RHRlgoeGUpKQ0KPiANCj4gdGhpcyBjaGVjayBpcyBub3QgY29ycmVjdCBp
ZiB5b3Ugd2FudCB0byByZXN0cmljdCB0byBER0ZYLCB0aGUgY2hlY2sgc2hvdWxkIGJlDQo+IHBy
ZWNlZWRpbmcgdGhlIHN5c2ZzX2NyZWF0ZV9maWxlcywgaWYgKCBJU19ER0ZYKHhlKSAmJiBzeXNm
c19jcmVhdGVfZmlsZXMoKSkNCg0KQ29ycmVjdCwgY2hlY2sgZ29lcyBmcm9tIGxlZnQgdG8gcmln
aHQgZm9yIGxvZ2ljYWwgQU5ELiBBbmQgSSBjYW4gdXNlciBzeXNmc19jcmVhdGVfZmlsZS4NCg0K
VGhhbmtzLA0KVGVqYXMNCj4gDQo+IGFsc28geW91IGNvdWxkIHVzZSBzeXNmc19jcmVhdGVfZmls
ZSBhcyB5b3UgaGF2ZSBqdXN0IG9uZSBlbnRyeS4NCj4gDQo+IHRoYW5rcywNCj4gQXJhdmluZC4N
Cj4gPiArCQlkcm1fd2FybigmeGUtPmRybSwNCj4gPiArCQkJICJTeXNmcyBjcmVhdGlvbiB0byBy
ZWFkIGFkZHJfcmFuZ2UgcGVyIHRpbGUgZmFpbGVkXG4iKTsNCj4gPiArDQo+ID4gIAllcnIgPSBk
cm1tX2FkZF9hY3Rpb25fb3JfcmVzZXQoJnhlLT5kcm0sIHRpbGVfc3lzZnNfZmluaSwgdGlsZSk7
DQo+ID4gIAlpZiAoZXJyKSB7DQo+ID4gLQkJZHJtX3dhcm4oJnhlLT5kcm0sICIlczogZHJtbV9h
ZGRfYWN0aW9uX29yX3Jlc2V0DQo+IGZhaWxlZCwgZXJyOiAlZFxuIiwNCj4gPiAtCQkJIF9fZnVu
Y19fLCBlcnIpOw0KPiA+ICsJCWRybV9lcnIoJnhlLT5kcm0sICIlczogZHJtbV9hZGRfYWN0aW9u
X29yX3Jlc2V0IGZhaWxlZCwNCj4gZXJyOiAlZFxuIiwNCj4gPiArCQkJX19mdW5jX18sIGVycik7
DQo+ID4gIAkJcmV0dXJuIGVycjsNCj4gPiAgCX0NCj4gPg0K
