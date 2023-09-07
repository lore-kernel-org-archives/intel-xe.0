Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F84EE14D6
	for <intel-xe@archiver.kernel.org>; Thu,  7 Sep 2023 09:35:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDBEC10E223;
	Thu,  7 Sep 2023 09:35:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A3C10E223
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Sep 2023 09:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694079330; x=1725615330;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KMjRfbDn2kyPbhaZ+DNY0G4BFwueLspdkh3Y1R8sLxk=;
 b=MUk7DlscUIvaI8PN4RTNuaYW6UzrX82Q1z6YSqfAUZVKyVU2mvZT5Ylu
 X0+556oVkXo6nO0OpYkapVJMEvWmuIAJPgL2yIwUu1qTA9w0Fcc6ektIU
 HXSkJ/Lx/7gFglp6RUB7mgxmzgN+ceBB/NqvsSlvWz9gKKMEGkxK1Y5M+
 8P9uKxHyoVIZ4aZMopJOG117XQdE4sGlUrPQNVaif2zmshL7XZXEKdPds
 3gXhmv58WEcBqQcxc/UTB52ygOmB+Jf8Yb1GUPemRq7xUPV/8FLWcDiLT
 oxvgo6Rhb5L1HYLwi9HPFnYqgMAnBc+Vcrsp1zMyJD10jW+7gTHpuMYqn w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="356788976"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="356788976"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 02:35:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="771209522"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="771209522"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Sep 2023 02:35:29 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 7 Sep 2023 02:35:28 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 7 Sep 2023 02:35:28 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 7 Sep 2023 02:35:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ONOU2k6U9YTHwKP28K/5PX2fO42+VYAK3UzoxFx6k+UwCf2mo6ze8vndhzwbnJ1rlRNAndVkguJYYtf5ifrtQgYTC0T8BJlxQmbR+HKmfh6T+lhmjk3ehjqYfVn9OkX2/2dpi6chdO3Vaf99IPm2m+pq2Sl0VkiHx5e+EtvEHjHBbI2huBUdtSKpPYe3Pg9taihconheBsJUa+jT1JEEVvR0xwTBmQS62L6kAvkLaK07IhcTkv2qVVW+r6GS55kIsAoDh4Ta7+FNfKfntlco4LhiQVMOtA/qgIAbDWkz6/jAkY68jzlS52jAVkyNvGz/t6faipjzZMV0LZQIVpQudA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMjRfbDn2kyPbhaZ+DNY0G4BFwueLspdkh3Y1R8sLxk=;
 b=NoGHVhXEWg/FLF9UmwDGYdtVIXazTk7gnfwkCgkqtQDVWacuQPDqi8RMZPHjiorxs0nFo+yX0j2JKcR5CddN5ISr+naPmJ8w79Fx+u9QnHlsp34DCeU49fR+C4QZAU4WAaYnc+3TECqBBi251elrZMw1Un5VQ8ls3w21PGV1u22LNSBKZnCcS3KmEj2UPbiSPNz/RxEUmIivKxdHzgYx94AQjAqI3QaDzJwwRlJqEEMjKhgr7yZefbztI/v0v2zK40KgThZHHp/wMyOl71qk7D70NbQUgwz96nAKoRQs2z1qO4XtwkJ4ptQEo51XL9S5baOq/MjA6XaqreA/DYa8yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Thu, 7 Sep
 2023 09:35:27 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::ed57:a908:f0ad:13cd]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::ed57:a908:f0ad:13cd%7]) with mapi id 15.20.6745.030; Thu, 7 Sep 2023
 09:35:26 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 0/7] drm/xe: fdinfo memory stats
Thread-Index: AQHZ2+lLGoPd8FEI7ESiGl7QF6aNHrAPIdKAgAACtzA=
Date: Thu, 7 Sep 2023 09:35:26 +0000
Message-ID: <SJ1PR11MB62044096851F50BCAC87D85F81EEA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230831090536.2949934-1-tejas.upadhyay@intel.com>
 <58217dd8-e733-47e1-adbc-95186f01ba3d@intel.com>
In-Reply-To: <58217dd8-e733-47e1-adbc-95186f01ba3d@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CO1PR11MB5057:EE_
x-ms-office365-filtering-correlation-id: 9c627d58-be57-4a12-5054-08dbaf85c4b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F7Y3gAK07HSx13+OKqkdSAbu3YaLsJ3oSROVSpKZA+WeiWF4cP1XJlkaXRjdbESIbbVDEFRfsiuDASuBV8DfjokaXR0Px0ioT46enhM1SCJ75FD1EHVuI09f/vgvYJvCEc2NFO4fzChVE/ashx0JowtDtkx6Mi0/s7M96ajh2hL1AG9xubXoEihtLnNuu8Qc81tM+zzfufZ2V4ONdAPoMVl1cca91btfHYj6k94edH1qOEqkh8E+aK/2TrVRwtUqUAK7L4R/V5k/nHbKTJgY3ijf61jQl6l626QHYCvCVm8cVJOWB1Qv1ZtztiBvCC1sG4wDXaiMG7S70GRXwtqDSDsLhmL+3vASvLTfXW1MTXSb+m/6cKCe6xQj32y5u6fOZ4f15E7vRymoJDYAJpgDl/zus52gwwi5lc6RBjk9oTu7JppT3UHI4810eGF4Je/ycSPwPYv8TpGxTO4Wpt0ma45zNoGQ9gLBQ7hoK+tr/BqncV7tk2bcCjAk38Dd0NTkhGPJZ5qwVArfeiclDCsqJ1iKWi14b//UkFsidHkjUHuhBpn4Yx0gCBE4djGQ3RAvDrLnA4+S8F7g/EwY7L/NUEua4IrslWNtSOgc3fBdPJMubEGfJMrPBFT6VKPpulUp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(366004)(346002)(136003)(39860400002)(186009)(451199024)(1800799009)(55016003)(71200400001)(83380400001)(26005)(107886003)(66476007)(64756008)(66446008)(66946007)(76116006)(66556008)(110136005)(4326008)(52536014)(8936002)(41300700001)(5660300002)(8676002)(6506007)(478600001)(53546011)(7696005)(2906002)(9686003)(316002)(86362001)(82960400001)(33656002)(122000001)(38070700005)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VU9DaXNNak9UQndsZS9Jd3dpcDkyUXJPeCtTSThOWUJNYlR1VnNqODhQNWxC?=
 =?utf-8?B?djh2YTl4cUlWaUhqbk5oRlBFRml6SStEcEUwU20zSDFDcmNRT0hnemdTZ1NZ?=
 =?utf-8?B?NnZRaGY5VXNzdXBUUVMvcWRXWUF3YUszbGl3OFdKdFFYTkp4UGMvNkRIQlhV?=
 =?utf-8?B?MFAzd3cyZk5iQ2R5c2htVER4d3RjRXhYQnZJYUlDMWNCVnE4UjFFanBZTUJG?=
 =?utf-8?B?MkhrTy9kUWgrdm4vblMyQWdwclpXMzFES2pDWnQwZkNkQTJRcjYwWnpCRlFl?=
 =?utf-8?B?bnpkdXRCRTZjWDYxaG1GcUs2aEdtU04xR05TVXlxWkFUYkwyZFpwdFZ3RnJG?=
 =?utf-8?B?NmR5Q0diRGQ0dDJoWGNaVjZKTWQzU1pSRlp5N3g3RGQxdFlVSlFtSnBzN2FK?=
 =?utf-8?B?WkFaUHhCdXE3WDYwNlhieVg2UUQvdnpJYUt4M3NMaFpWazRKWTB5UC9RVW9X?=
 =?utf-8?B?UHJ6Z3R4TUNpVVNxM1lzaSttWDlVQXgwYkdQMmpWc0hHWG1sRkVIVXpjc29o?=
 =?utf-8?B?V0NLcE53cHBHa21ITFM1eWpEN3p2djZ1bE1GdGlyWXFCVnlyUlptLzN5eDV6?=
 =?utf-8?B?cHQ5RFZ6YzNUWkM3REw0aGsyWHhqc3pzMFpJYXpCMjlkM3lLSmtaT05VT3Ni?=
 =?utf-8?B?QWduOVI0cDlBaTJ6MFpERzN1N2tEd3RTV2R6eTVUb0J0bTZ0WXk0TkYxSS9O?=
 =?utf-8?B?VmxjNVZveEdkTzV0TWZIeGorVE4zNmtiQzFyTG42N3ZVY1VsTGdjVGlwODh2?=
 =?utf-8?B?V0I4aDdGb21LT29MRmhSd0xIY0RQOTZxL3FpakFOWDFQT2p2eG53OW5tbjQx?=
 =?utf-8?B?MCs5bzFETTM2dkVZbzZTSndPUDZKbytFREJ6YW9DaW1lQ084azRsRHpNSmZO?=
 =?utf-8?B?WUM0b2J6YS9Wa1hEUHFLaUJkSzNicXpEdnpOdzlBc0pZdXM2MHI0V3pSckJv?=
 =?utf-8?B?cXdnY0ZmRTJoMW9IRUVTU1V5N3JLMWN0MFRCVklud2JnMXBJUUl5TkMrS0VY?=
 =?utf-8?B?eXVvdy82allKZmFLMFJ4bVBYekxoOWNUUkZyZ1Z4Q281OFhROStzTmwxRzd6?=
 =?utf-8?B?TzhMNURGVm02OStkdGQ1cGlDcUlVdG5tMTg5U2RwalJtN3gvRmtOL0JNSGM4?=
 =?utf-8?B?elJpUGJUc2RVTWIxUjB2NUxTb0tiM1FNeDV0Y1I0T3B6ODlLNmhZYXJUekds?=
 =?utf-8?B?OUZ6TGpZa3lNNm40V043MVJ2T01EdjFwRjdZUVBZai9CVmZnUFBvRWpMSVcx?=
 =?utf-8?B?c01TMk9FSjNTaFhwRm5zVW56Y0Y4UHdmZTMzNDlwZ1FjMUxtQkdmdmpHRHpv?=
 =?utf-8?B?RldvRkszRlBWTEg0SWRLSW5TdVAwV0VsZlNodHJnOEljdGFlN1JkRGc5RzQy?=
 =?utf-8?B?SjRSVVFxaDE3WFZtUDA2d2UyVEhVUEZ1a2wxNkJTb01DV0R5Q0c5QktBL1ox?=
 =?utf-8?B?bTRhZFArWmpjNlZydmVnSkY5WlYzUzEvOUlEMng2YTFoM2pTWUd0WjN3WkRR?=
 =?utf-8?B?RnVJYzJuUm9Ua1VzMjhVQXVnZStVK2NjdzNzRkVTckJBRGJDdVpTeWx3ZjRl?=
 =?utf-8?B?dU5NaXlndXNleVJPMk1Qc21PWnIydGRabzI3YjhjWFRPbmN5UHVSSnBWUVdh?=
 =?utf-8?B?TEVYUVJtcGk5cldnRTdrNFVDTHdIS1ZzUXBRZkZ1Z1RVQXNyc3lzL1lwekZZ?=
 =?utf-8?B?Z0lTYXh4OWZRd3ZvMHRUaTkvdTZpTnJRdmhVenVFbG1lT0dQNWVleE1tZzRy?=
 =?utf-8?B?T0dTZmI5MkxvaW1ydVlMRlp5cTN6M0RpT0JxZWtRLzcxQmxicUd1dTd1OE5T?=
 =?utf-8?B?amdnR2JHbEdLNTJjTktiT24yeWJ0VUtBRW5PaEF0TStka3QxU0lrSTdlaUdi?=
 =?utf-8?B?STkvbU5aTGlZT2J6OW8yWE9BVTZ3Y2lsK3djV0lRZ2VvVi9vellWSHZYYzN6?=
 =?utf-8?B?bkp5NExkV1dEZVZWa0hDcEVqc0NKNnl1RExVRmpNbTJmd0dnVHVmcTY5aU0z?=
 =?utf-8?B?dFE0R1J5Sm9VNFlFY0VJaU4zbEF0UGJ0QmZUR0xKTmJ6bjZkTkg0cnVTZ1FF?=
 =?utf-8?B?WnVERW43azZ2ME1yUDBwSGRQSFpZSzFsVEUwK0k0dzRrWFk3UDczQkdzSThr?=
 =?utf-8?Q?HswLLBwsRlPvyO4ZlUlX1rrDV?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c627d58-be57-4a12-5054-08dbaf85c4b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2023 09:35:26.8553 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SRUs1JfiFXU1bBXDI6cY/uN9XBsxzUDAveNO2qC4BQQ2ozGmvwsdJPfYZut3HSDNkQYg082WInnbardF+yObppFn7rq/JjdatIzl02oaYMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5057
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/7] drm/xe: fdinfo memory stats
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2hpbWlyYXksIEhpbWFs
IFByYXNhZCA8aGltYWwucHJhc2FkLmdoaW1pcmF5QGludGVsLmNvbT4NCj4gU2VudDogVGh1cnNk
YXksIFNlcHRlbWJlciA3LCAyMDIzIDI6NTIgUE0NCj4gVG86IFVwYWRoeWF5LCBUZWphcyA8dGVq
YXMudXBhZGh5YXlAaW50ZWwuY29tPjsgaW50ZWwtDQo+IHhlQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0KPiBDYzogSWRkYW1zZXR0eSwgQXJhdmluZCA8YXJhdmluZC5pZGRhbXNldHR5QGludGVsLmNv
bT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAwLzddIGRybS94ZTogZmRpbmZvIG1lbW9yeSBzdGF0
cw0KPiANCj4gDQo+IE9uIDMxLTA4LTIwMjMgMTQ6MzUsIFRlamFzIFVwYWRoeWF5IHdyb3RlOg0K
PiA+IFRoaXMgc2VyaWVzIGVuYWJsZXMgZW5hYmxlcyBmZGluZm8gbWVtb3J5IHN0YXRzIGZvciB4
ZS4NCj4gPg0KPiA+IEkgYWRkZWQgdHJhY2tpbmcgb2YgbW9zdCBjbGFzc2VzIG9mIGJvICh1c2Vy
IGJvLCBwYWdlIHRhYmxlcywgcmluZywNCj4gPiBscmMpIHdoaWNoIGNvbnRyaWJ1dGUgdG8gY2xp
ZW50J3MgbWVtb3J5IHVzYWdlLiBUaGlzIGZvbGxvd3Mgc2ltaWxhcg0KPiA+IGxpbmVzIHRvIHdo
YXQgUm9iJ3MgbXNtIGNvZGUgYW5kIHR2cnRrbydzIGk5MTUgY29kZSBpcyBkb2luZyB3aXRoIHNv
bWUNCj4gPiB4ZSB3YXkgb2Ygc2hvd2luZyBhbmQgdHJhY2tpbmcvZmVjdGhpbmcgb2JqZWN0cyB3
aGljaCBhZGRzIHRvIGNsaWVudA0KPiA+IG1lbW9yeSBzdGF0cy4NCj4gPg0KPiA+IEV4YW1wbGUg
ZmRpbmZvIGZvcm1hdDoNCj4gPg0KPiA+ICNjYXQgL3Byb2MvNDYyMC9mZGluZm8vMw0KPiA+IHBv
czogICAgMA0KPiA+IGZsYWdzOiAgMDEwMDAwMg0KPiA+IG1udF9pZDogMjMNCj4gPiBpbm86ICAg
IDExMTYNCj4gPiBkcm0tZHJpdmVyOiAgICAgeGUNCj4gPiBkcm0tY2xpZW50LWlkOiAgMTMNCj4g
PiBkcm0tcGRldjogICAgICAgMDAwMDo0ZDowMC4wDQo+ID4gZHJtLXRvdGFsLXN5c3RlbTogICAg
ICAgMA0KPiA+IGRybS1zaGFyZWQtc3lzdGVtOiAgICAgIDANCj4gPiBkcm0tYWN0aXZlLXN5c3Rl
bTogICAgICAwDQo+ID4gZHJtLXJlc2lkZW50LXN5c3RlbTogICAgMA0KPiA+IGRybS1wdXJnZWFi
bGUtc3lzdGVtOiAgIDANCj4gPiBkcm0tdG90YWwtZ3R0OiAgNCBLaUINCj4gPiBkcm0tc2hhcmVk
LWd0dDogMA0KPiA+IGRybS1hY3RpdmUtZ3R0OiAwDQo+ID4gZHJtLXJlc2lkZW50LWd0dDogICAg
ICAgNCBLaUINCj4gPiBkcm0tcHVyZ2VhYmxlLWd0dDogICAgICAwDQo+ID4gZHJtLXRvdGFsLXZy
YW0wOiAgICAgICAgMjAgS2lCDQo+ID4gZHJtLXNoYXJlZC12cmFtMDogICAgICAgMA0KPiA+IGRy
bS1hY3RpdmUtdnJhbTA6ICAgICAgIDANCj4gPiBkcm0tcmVzaWRlbnQtdnJhbTA6ICAgICAyMCBL
aUINCj4gPiBkcm0tcHVyZ2VhYmxlLXZyYW0wOiAgICAwDQo+ID4gZHJtLXRvdGFsLXZyYW0xOiAg
ICAgICAgMjAgS2lCDQo+ID4gZHJtLXNoYXJlZC12cmFtMTogICAgICAgMA0KPiA+IGRybS1hY3Rp
dmUtdnJhbTE6ICAgICAgIDANCj4gPiBkcm0tcmVzaWRlbnQtdnJhbTE6ICAgICAyMCBLaUINCj4g
PiBkcm0tcHVyZ2VhYmxlLXZyYW0xOiAgICAwDQo+IA0KPiBkcm0tcHVyZ2VhYmxlLXZyYW0wLCBk
cm0tcHVyZ2VhYmxlLXZyYW0xID8NCj4gQXJlIHRoZXkgY29ycmVjdCBlbnRyaWVzID8gU2VlbXMg
aXNzdWUgaW4gUEFUQ0g3Lg0KDQpZZXMgSSB3aWxsIGRpc2FibGUgcHVyZ2VhYmxlIGZsYWcgZm9y
IHZyYW1zIHdoaWxlIGV4cG9ydGluZyBzdGF0cy4gQXMgZGlzY3Vzc2VkIHdpdGggQXJhdmluZCwg
cHVyZ2VhYmxlIGlzIG9ubHkgYXBwbGljYWJsZSBvbiBCTyBpbiBQTF9TWVNURU0gYmVjYXVzZSBi
eSBkZWZhdWx0IHRoZXkgYXJlIGNvbnNpZGVyZWQgcHVyZ2VhYmxlLg0KDQpUaGFua3MsDQpUZWph
cyANCj4gDQo+IEJSDQo+IEhpbWFsDQo+IA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogVGVqYXMg
VXBhZGh5YXkgPHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT4NCj4gPg0KPiA+IFRlamFzIFVwYWRo
eWF5ICg3KToNCj4gPiAgICBkcm0veGU6IEFkZCBkcm0tY2xpZW50IGluZnJhc3RydWN0dXJlDQo+
ID4gICAgZHJtL3hlOiBJbnRlcmZhY2UgeGUgZHJtIGNsaWVudCB3aXRoIGZkaW5mbyBpbnRlcmZh
Y2UNCj4gPiAgICBkcm0veGU6IEFkZCB0cmFja2luZyBzdXBwb3J0IGZvciBib3MgcGVyIGNsaWVu
dA0KPiA+ICAgIGRybS94ZTogUmVjb3JkIGVhY2ggZHJtIGNsaWVudCB3aXRoIGl0cyBWTQ0KPiA+
ICAgIGRybS94ZTogVHJhY2sgcGFnZSB0YWJsZSBtZW1vcnkgdXNhZ2UgZm9yIGNsaWVudA0KPiA+
ICAgIGRybS94ZTogQWNjb3VudCByaW5nIGJ1ZmZlciBhbmQgY29udGV4dCBzdGF0ZSBzdG9yYWdl
DQo+ID4gICAgZHJtL3hlOiBJbXBsZW1lbnQgZmRpbmZvIG1lbW9yeSBzdGF0cyBwcmludGluZw0K
PiA+DQo+ID4gICBkcml2ZXJzL2dwdS9kcm0veGUvTWFrZWZpbGUgICAgICAgICAgfCAgIDEgKw0K
PiA+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMgICAgICAgICAgIHwgICA3ICsNCj4gPiAg
IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5oICAgICAgICAgICB8ICAxMSArKw0KPiA+ICAgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2JvX3R5cGVzLmggICAgIHwgIDEwICsrDQo+ID4gICBkcml2ZXJz
L2dwdS9kcm0veGUveGVfZGV2aWNlLmMgICAgICAgfCAgMTkgKystDQo+ID4gICBkcml2ZXJzL2dw
dS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmggfCAgIDYgKw0KPiA+ICAgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2RybV9jbGllbnQuYyAgIHwgMjI4DQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysr
Kw0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RybV9jbGllbnQuaCAgIHwgIDcxICsrKysr
KysrKw0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xyYy5jICAgICAgICAgIHwgICA3ICst
DQo+ID4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcHQuYyAgICAgICAgICAgfCAgIDQgKy0NCj4g
PiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jICAgICAgICAgICB8ICAxMCArLQ0KPiA+ICAg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtX3R5cGVzLmggICAgIHwgICAyICsNCj4gPiAgIDEyIGZp
bGVzIGNoYW5nZWQsIDM3MiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+ICAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kcm1fY2xpZW50LmMNCj4gPiAg
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0veGUveGVfZHJtX2NsaWVudC5oDQo+
ID4NCg==
