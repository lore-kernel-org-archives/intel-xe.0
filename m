Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306C4EB64DD
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jul 2023 07:02:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD92C10E32F;
	Wed,  5 Jul 2023 07:02:12 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89EEB10E32F
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jul 2023 07:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688540530; x=1720076530;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/f0192UglZYe+h80MBPqxgbYcnF8FaRpJ0iqHS2qurg=;
 b=G5f7vlZnQeEiOg0iIgB1XX2WjmIdBW4dqCPMdQ8c101SxuIwa6T8ZJfY
 jBac1kd6ibEi68ldHFu2sDy6FrkB9OcbWQ6lDFPvXlnqSrBTEFzOvr3U8
 U4vQlztxdV6mNbxgunek4gQ3irTDYDqz6OlMo4e3CLz9p7PFuCHkJgNsn
 ad93QbHVn44MCmSWcsNPL8oGfwRGa/9tEixqpQq7d9xEmJbUY7EySpv8h
 IcN0yzW805kLsE7lSx9RBh2K46ojKIC6zpf3MNv7xIS6JDzr/DWc0MoAQ
 r9hh/cR6Ri90+Emda/Xo/qyN5fdJppnpz9jBGUEt2ZpcnJXgSm7GVYRL5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="362133195"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="362133195"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 00:02:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="965708577"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="965708577"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 05 Jul 2023 00:02:08 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 5 Jul 2023 00:02:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 5 Jul 2023 00:02:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 5 Jul 2023 00:02:07 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 5 Jul 2023 00:02:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TPOLqfc6wc4SdQe3LKizvOhAz05Krgnx/80cE1HhKW3XVJo6aXRWs5SDE4xSICFLrIVy/o4k6y3nhGbJV7+XLXNzmhVrDxkwZAOS1eOtWE3c0MictdGGJILLI2eE8cFS797vDvPFuUpRPUTYpCbT46M0X7Jh0VKIy2c23gUfloDWGuFfK1Q2qqQYDZDOcMyy/tVEwU2NYhgZHtgMwC1aGzJgEgPuUeXU35lzWl5rom7NUuTntoMAnaGKAkLUixT6gx+TSLNYGC5osE+AL7pjtsPzieds3qwfNEgW8UrNVRz9EVymjWi53Qs2iA+8GW72+wVXzw7lCfz+h2gDBIHICA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/f0192UglZYe+h80MBPqxgbYcnF8FaRpJ0iqHS2qurg=;
 b=F0zhjfychE05btwKrm3/4of6hfEaHy9pvP9VBvpwzFeeO7EiyY5YAlJoA7D4BAGe+zAXc+GkwfQsUwK2QGgA+ElKAHM+IbMHySqbRrp+wRKzMHrNryZe72fELQxVxMiVm4qzA82Q8r06WIOas3Ws2BKmdPZzvjujE3Rf6QEt8uUIqHJXrHEwiY6RTxXhwJLKFHnbFycnE5oRr4KkOfhMDOJjKp1SoWirU/eyx3gw/5iy7JK48cAcAZyYu+8M5gzEEKPi7xAP3y4jTSvPOiPvQaj92MNwGSbUCrpj1X7zVO0+mkEiuikS/7Vgsiq1gFJC6zJYjjiM7iaAK+MTz6HMJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by IA0PR11MB7911.namprd11.prod.outlook.com (2603:10b6:208:40e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 07:02:04 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::347c:9286:96c4:cf61]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::347c:9286:96c4:cf61%6]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 07:02:04 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH v3 4/5] xe/drm/pm: Toggle d3cold_allowed using vram_usages
Thread-Index: AQHZqO6xal6A+i2Ikk2gI7xFqMPkl6+pKLQAgAGiflA=
Date: Wed, 5 Jul 2023 07:02:04 +0000
Message-ID: <CY5PR11MB6211E3BECBDA9956398A9C7F952FA@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230627115642.2087251-1-anshuman.gupta@intel.com>
 <20230627115642.2087251-5-anshuman.gupta@intel.com>
 <f75d088a-ec18-2cdf-1441-1417b0cb54f2@intel.com>
In-Reply-To: <f75d088a-ec18-2cdf-1441-1417b0cb54f2@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|IA0PR11MB7911:EE_
x-ms-office365-filtering-correlation-id: d354521d-7870-45c8-9e65-08db7d25bd2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2uwyACifCf5iK64+b55kDBkg53cL/xVpXz+7Jb1jd2aDyuyaYhXDxtgu4Zbi/nLR+kRUuiggIWoGXHHVxrwu2E+B/9U7kwAwc6pgChxd5unM4aXTu2JAkTmnHcDEVYxkO2jems8cvKxWEtX13pnrG+q+RMxWxY/dk+7zsdfkdMCks9vXJNFZzkJRWDzzcSsdbAD9tjfYUQALrO4sADmnrXumDpPIHR/7UKby+jOu4K4PH79D4hwk2cwhavU8L2JpOjjvhKA8GT5jF/PWiIivQAU0ukLs9jwSmRKb8dhdtHVkZvM4NnNnnrVHNvAz1WZZXANpapo1WGEAuq9CMxO/JaHFENQQOIvDIdqimDgQXPV5cpWwg6nut4pwHCA1xkabk0MFugT1ds+eea0YPtUSJb4BfNPLWIJBV2Rv+WzF5AeL7NIoeh2Aw5FkotTU60fSNyNY2U++MKhEeYvpCt61kx7eMo2gWkZxL8DuHm9368JdPW1QkdSM3mZtZLQJZsxjiOMsGFP9qc0NZA7zvULOHVD12wCqk/qg9T/Sw3guB/i9uqo2u32btTKGv50EpKv+ZnSSGHREcVDcIsOg4lLBvspra/caCMbgL8iyvL1NR4lRVAcCxLrPNxJH0n/xoVR6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(376002)(136003)(346002)(396003)(451199021)(66446008)(66556008)(4326008)(66476007)(76116006)(64756008)(122000001)(186003)(38100700002)(107886003)(82960400001)(38070700005)(86362001)(26005)(6506007)(9686003)(53546011)(83380400001)(66946007)(33656002)(478600001)(7696005)(55016003)(54906003)(110136005)(52536014)(41300700001)(8676002)(8936002)(5660300002)(2906002)(71200400001)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3lNblNQR3BnZXJMOHhhOURNdGZxbCtmTkppYTBOYlVIR05PcjdJNlpBY2Jq?=
 =?utf-8?B?cnZVQzZBb0pVRWRMb1lnSkFCQ1UrajAvOHZIRFZlMnRwVFQ4R1JKUlgzRVNS?=
 =?utf-8?B?eWxETFBNdTZyTjEvbTVlN1ppVXE4UDdIZUdQVzBUUFFMaW1tVzV1d3U4dTBT?=
 =?utf-8?B?MUJ1eld2Y1hPUDR6YUFpc0gxT2lqa3lBTDJsZmlLemM1SHRHRGlTQWFNQytG?=
 =?utf-8?B?SHFWZ1NNSURwcGd6clhERzYyR3Bzd3piQ2FCcU45SmMvTFo5OFc5cGUxSUxx?=
 =?utf-8?B?MVFqZm1oVE83N1FndVlEQytYaTlUZGliTk9wajB6Y3hZZ0xwZ21CR1BKakRu?=
 =?utf-8?B?amQ2VmhMNmQreWFFMVArMmVYYkx2YXYzaDdzbEh3VXc3WVRHV1llakJSVlUw?=
 =?utf-8?B?WnJQcnM3VUgwOUJiSkJSZHMxblFHdDZxWVVZLzJCK2s4WDE3SEt6ckVMZjRR?=
 =?utf-8?B?ZmdxdSttSzZVMitVTEdzT3ZlN2xsWGU0RTNmUU9TNjlOazMvK1hkT3hBa0x4?=
 =?utf-8?B?MklzRFU1U0pkY1IrZkVlYkRQU2UvNmFzazk2M0RsSjVBUGsvNEtHZmRzRVdx?=
 =?utf-8?B?MXlHWTlEb25KSWJFQ2hNaGwxMkF5SGt1ZVFBeFUxRlFWNzFaMkR1TlhMSEJq?=
 =?utf-8?B?WTBmSS9TQVJVQzNXWWE3eTROSHhTcndmbWJGMUp6Tkw4THMzc0F0bUlWUUxt?=
 =?utf-8?B?ZFR5aUhFbC83cmwwOXVyU1ROczhUWEZYK1RGZzNoNis3UGFsdFpMRGoyMWxi?=
 =?utf-8?B?UklMcGU3ZDgzRFd2YTVhOWIyTzZ5ZGJ1UUNBMmRocHEybTBOVFFhTGdrOUhW?=
 =?utf-8?B?aGxQL0VJem9HdXBEeURHTStFdDRiMDhlbEFJMktybUtDT3pFWjg3cktEaUNI?=
 =?utf-8?B?Mm4ybkd1MkZNUXpRUDlrRVNodU1iZEU2dnJvZ1NjMFhVQ3pSRkJhalJjZjlY?=
 =?utf-8?B?SXdjbkRsb2hSSEQxSGpYQ1NMQjNmRndJeHN5a3ZOUVI4SDh3aWE5V2twMU92?=
 =?utf-8?B?SHNsMmJwU09nd29uYllCSEFqMzdEZGp4c3hQc3FDMkttQXNIU1hFTzJGV1cr?=
 =?utf-8?B?RUZRVG40NEs0VUQxM2ZPdFpMcmhpYnJabEpjR0pwZmhHcFZuYmswVk4weHlS?=
 =?utf-8?B?KzZ5TmlUMFUwbWFvMHV2WXFXWkFkN1VtM01tMzl6UC85WWZUc0JNQ2svenhD?=
 =?utf-8?B?MFM1MmdHcnIyZEVhVmI1bkkyZkJGZmpsMGFqS3NFemtmc1RKY2g2cTkxMmtM?=
 =?utf-8?B?MFpxQjdFcWhTTTdFeVJPU3FmVnRUMWpmWHRtQlpGMFE4UDVKb3RqS2czZjBq?=
 =?utf-8?B?MWxTV0c5KzNEamRGNlhSeXhWaUtpUk50WmRnM2dyRlpxTFdhVkJRM29TQXZh?=
 =?utf-8?B?OFdSZGovbkNEVXZINlk0c3RralQzUEpJZFM0dWFpMzlTRnNuOVpiTUxzR2ln?=
 =?utf-8?B?TnlaeHY3bkdKRlk1bzBtT2R1RWp6U1ZGblo1VjNQblF1ODJTTWo0cUJnWkp6?=
 =?utf-8?B?TWJPNWJNcFFySGdmdXFWVWVIL1dNbXU4OTZJdnhWWHVPdEZ6SUFHMTVlUmdU?=
 =?utf-8?B?NWFMdEI0U3pmekxXQUpHSnFMUGsyOHl6S2ZJUlVKbkJuYTNUeEtVNFNNak5n?=
 =?utf-8?B?eWVyQmcwdlZqNGk3YmRXM1FOcXJKa1ZXKzg1SVFCd2Y0WmpIMGVJTForYUFx?=
 =?utf-8?B?S2JSWGtHeDk1RmVEQjJYSnlNYkY2Ukh2ckdlRmxVZEhrZkNnZ2c5aXlDVXQy?=
 =?utf-8?B?c0FHWVlMZUN1RjRYdVBEMzcvVy92YzJIU2JQbmRuVDE3ZTFDeFpyY3JuOWxx?=
 =?utf-8?B?NW5weFpoekRtTENLTDlQbEl3bSt1WUNvSElORjFiTlQwSnZUTElqNTVzYXIz?=
 =?utf-8?B?bTQvdUlVZnBXUXJWeEV3T1BCZlRwYlhkeXQrdzhIOFVKR0FsbVJVdHlOZGpu?=
 =?utf-8?B?TzZ2Rm9UYVY1TnN1cnpiNk9udGh6RlhoeXNtMVcxSkFzcE5EWnp1SUQyMnl6?=
 =?utf-8?B?TmJmd1NaZURneS9rd2NXT1FTcm03WEU4RTJaMUJqMUV0Z3pYbTMvbWswcWk4?=
 =?utf-8?B?Nml4ZHF5NWVyZE1BcEEvN20yWWF5blo3N1BlTU96bnVMaU9YL2o2MzR6cGtW?=
 =?utf-8?Q?2d53lIkxI0m/l8E3hlQUKwffJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d354521d-7870-45c8-9e65-08db7d25bd2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2023 07:02:04.3869 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2JKiAor8nIBLnqVr57s0xlc102pKZMsRMQ0w7yrQomVn1Q1HrDvN9OSykxcbn7bBdUAM0n9o3BArcAMwX3wXcBjk5m2Qpwg5esYlesBKa10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7911
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 4/5] xe/drm/pm: Toggle d3cold_allowed
 using vram_usages
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
Cc: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGF1cm8sIFJpYW5hIDxy
aWFuYS50YXVyb0BpbnRlbC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bHkgNCwgMjAyMyAxMToz
NCBBTQ0KPiBUbzogR3VwdGEsIEFuc2h1bWFuIDxhbnNodW1hbi5ndXB0YUBpbnRlbC5jb20+OyBp
bnRlbC0NCj4geGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBOaWxhd2FyLCBCYWRhbCA8
YmFkYWwubmlsYXdhckBpbnRlbC5jb20+OyBWaXZpLCBSb2RyaWdvDQo+IDxyb2RyaWdvLnZpdmlA
aW50ZWwuY29tPjsgU3VuZGFyZXNhbiwgU3VqYXJpdGhhDQo+IDxzdWphcml0aGEuc3VuZGFyZXNh
bkBpbnRlbC5jb20+OyBCcm9zdCwgTWF0dGhldw0KPiA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgNC81XSB4ZS9kcm0vcG06IFRvZ2dsZSBkM2NvbGRf
YWxsb3dlZCB1c2luZw0KPiB2cmFtX3VzYWdlcw0KPiANCj4gSGkgQW5zaHVtYW4NCj4gDQo+IE9u
IDYvMjcvMjAyMyA1OjI2IFBNLCBBbnNodW1hbiBHdXB0YSB3cm90ZToNCj4gPiBBZGRpbmcgc3Vw
cG9ydCB0byBjb250cm9sIGQzY29sZCBieSB1c2luZyB2cmFtX3VzYWdlcyBtZXRyaWMgZnJvbSB0
dG0NCj4gPiByZXNvdXJjZSBtYW5hZ2VyLg0KPiA+IFdoZW4gcm9vdCBwb3J0ICBpcyBjYXBhYmxl
IG9mIGQzY29sZCBidXQgeGUgaGFzIGRpc2FsbG93ZWQgZDNjb2xkIGR1ZQ0KPiA+IHRvIHZyYW1l
X3VzYWdlcyBhYm92ZSB2cmFtX2QzY2NvbGRfdGhyZXNob2wuIEl0IGlzIHJlcXVpcmVkIHRvIGRp
c2FibGUNCj4gPiBkM2NvbGQgdG8gYXZvaWQgYW55IHJlc3VtZSBmYWlsdXJlIGJlY2F1c2Ugcm9v
dCBwb3J0IGNhbiBzdGlsbA0KPiA+IHRyYW5zaXRpb24gdG8gZDNjb2xkIHdoZW4gYWxsIG9mIHBj
aWUgZW5kcG9pbnRzIGFuZCB7dXBzdHJlYW0sDQo+ID4gdmlydHVhbH0gc3dpdGNoIHBvcnRzIHdp
bGwgdHJhbnNpdGlvbiB0byBkM2hvdC4NCj4gPiBBbHNvIGNsZWFuaW5nIHVwIHRoZSBUT0RPIGNv
ZGUgY29tbWVudC4NCj4gPg0KPiA+IENjOiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRl
bC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogQW5zaHVtYW4gR3VwdGEgPGFuc2h1bWFuLmd1cHRh
QGludGVsLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogQmFkYWwgTmlsYXdhciA8YmFkYWwubmlsYXdh
ckBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMg
fCAyNyArKysrKysrKysrKysrKysrKysrKysrKystLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9wbS5jICB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gICBkcml2
ZXJzL2dwdS9kcm0veGUveGVfcG0uaCAgfCAgMSArDQo+ID4gICAzIGZpbGVzIGNoYW5nZWQsIDU0
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jDQo+
ID4gaW5kZXggODQ4ZGU1ZGNkYWE1Li43OGU5MDY2MDcxODggMTAwNjQ0DQo+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3BjaS5jDQo+ID4gQEAgLTc0Niw2ICs3NDYsMjQgQEAgc3RhdGljIGludCB4ZV9wY2lfcmVzdW1l
KHN0cnVjdCBkZXZpY2UgKmRldikNCj4gPiAgIAlyZXR1cm4gMDsNCj4gPiAgIH0NCj4gPg0KPiA+
ICtzdGF0aWMgdm9pZCBkM2NvbGRfdG9nZ2xlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBib29sIGVu
YWJsZSkgew0KPiA+ICsJc3RydWN0IHhlX2RldmljZSAqeGUgPSBwZGV2X3RvX3hlX2RldmljZShw
ZGV2KTsNCj4gPiArCXN0cnVjdCBwY2lfZGV2ICpyb290X3BkZXY7DQo+ID4gKw0KPiA+ICsJaWYg
KCF4ZS0+ZDNjb2xkLmNhcGFibGUpDQo+ID4gKwkJcmV0dXJuOw0KPiA+ICsNCj4gPiArCXJvb3Rf
cGRldiA9IHBjaWVfZmluZF9yb290X3BvcnQocGRldik7DQo+ID4gKwlpZiAoIXJvb3RfcGRldikN
Cj4gPiArCQlyZXR1cm47DQo+ID4gKw0KPiA+ICsJaWYgKGVuYWJsZSkNCj4gPiArCQlwY2lfZDNj
b2xkX2VuYWJsZShyb290X3BkZXYpOw0KPiA+ICsJZWxzZQ0KPiA+ICsJCXBjaV9kM2NvbGRfZGlz
YWJsZShyb290X3BkZXYpOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICAgc3RhdGljIGludCB4ZV9wY2lf
cnVudGltZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gPiAgIHsNCj4gPiAgIAlzdHJ1
Y3QgcGNpX2RldiAqcGRldiA9IHRvX3BjaV9kZXYoZGV2KTsgQEAgLTc2Myw2ICs3ODEsNyBAQA0K
PiBzdGF0aWMNCj4gPiBpbnQgeGVfcGNpX3J1bnRpbWVfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpk
ZXYpDQo+ID4gICAJCXBjaV9pZ25vcmVfaG90cGx1ZyhwZGV2KTsNCj4gPiAgIAkJcGNpX3NldF9w
b3dlcl9zdGF0ZShwZGV2LCBQQ0lfRDNjb2xkKTsNCj4gPiAgIAl9IGVsc2Ugew0KPiA+ICsJCWQz
Y29sZF90b2dnbGUocGRldiwgZmFsc2UpOw0KPiA+ICAgCQlwY2lfc2V0X3Bvd2VyX3N0YXRlKHBk
ZXYsIFBDSV9EM2hvdCk7DQo+ID4gICAJfQ0KPiA+DQo+ID4gQEAgLTc4Nyw2ICs4MDYsOCBAQCBz
dGF0aWMgaW50IHhlX3BjaV9ydW50aW1lX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlDQo+ICpkZXYpDQo+
ID4gICAJCQlyZXR1cm4gZXJyOw0KPiA+DQo+ID4gICAJCXBjaV9zZXRfbWFzdGVyKHBkZXYpOw0K
PiA+ICsJfSBlbHNlIHsNCj4gPiArCQlkM2NvbGRfdG9nZ2xlKHBkZXYsIHRydWUpOw0KPiA+ICAg
CX0NCj4gPg0KPiA+ICAgCXJldHVybiB4ZV9wbV9ydW50aW1lX3Jlc3VtZSh4ZSk7DQo+ID4gQEAg
LTgwMCwxNSArODIxLDE1IEBAIHN0YXRpYyBpbnQgeGVfcGNpX3J1bnRpbWVfaWRsZShzdHJ1Y3Qg
ZGV2aWNlICpkZXYpDQo+ID4gICAJaWYgKCF4ZS0+ZDNjb2xkLmNhcGFibGUpIHsNCj4gPiAgIAkJ
eGUtPmQzY29sZC5hbGxvd2VkID0gZmFsc2U7DQo+ID4gICAJfSBlbHNlIHsNCj4gPiArCQl4ZS0+
ZDNjb2xkLmFsbG93ZWQgPSB4ZV9wbV92cmFtX2QzY29sZF9hbGxvd2VkKHhlKTsNCj4gPiArDQo+
ID4gICAJCS8qDQo+ID4gICAJCSAqIFRPRE86IGQzY29sZCBzaG91bGQgYmUgYWxsb3dlZCAodHJ1
ZSkgaWYNCj4gPiAgIAkJICogKElTX0RHRlgoeGUpICYmICF4ZV9kZXZpY2VfbWVtX2FjY2Vzc19v
bmdvaW5nKHhlKSkNCj4gPiAgIAkJICogYnV0IG1heWJlIGluY2x1ZGUgc29tZSBvdGhlciBjb25k
aXRpb25zLiBTbywgYmVmb3JlDQo+ID4gICAJCSAqIHdlIGNhbiByZS1lbmFibGUgdGhlIEQzY29s
ZCwgd2UgbmVlZCB0bzoNCj4gPiAgIAkJICogMS4gcmV3cml0ZSB0aGUgVlJBTSBzYXZlIC8gcmVz
dG9yZSB0byBhdm9pZCBidWZmZXIgb2JqZWN0DQo+IGxvY2tzDQo+ID4gLQkJICogMi4gYmxvY2sg
RDNjb2xkIGlmIHdlIGhhdmUgYSBiaWcgYW1vdW50IG9mIGRldmljZSBtZW1vcnkNCj4gaW4gdXNl
DQo+ID4gLQkJICogICAgaW4gb3JkZXIgdG8gcmVkdWNlIHRoZSBsYXRlbmN5Lg0KPiA+IC0JCSAq
IDMuIGF0IHJlc3VtZSwgZGV0ZWN0IGlmIHdlIHJlYWxseSBsb3N0IHBvd2VyIGFuZCBhdm9pZA0K
PiBtZW1vcnkNCj4gPiArCQkgKiAyLiBhdCByZXN1bWUsIGRldGVjdCBpZiB3ZSByZWFsbHkgbG9z
dCBwb3dlciBhbmQgYXZvaWQNCj4gbWVtb3J5DQo+ID4gICAJCSAqICAgIHJlc3RvcmF0aW9uIGlm
IHdlIHdlcmUgb25seSB1cCB0byBkM2NvbGQNCj4gPiAgIAkJICovDQo+ID4gICAJCXhlLT5kM2Nv
bGQuYWxsb3dlZCA9IGZhbHNlOw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfcG0uYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbS5jDQo+ID4gaW5kZXggNzAyOGM5YjZl
OTRjLi40ZGI0ZTVhMWIwNTEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3BtLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcG0uYw0KPiA+IEBAIC0yNzcs
MyArMjc3LDMyIEBAIGludCB4ZV9wbV9zZXRfdnJhbV90aHJlc2hvbGQoc3RydWN0IHhlX2Rldmlj
ZQ0KPiA+ICp4ZSwgdTMyIHRocmVzaG9sZCkNCj4gPg0KPiA+ICAgCXJldHVybiAwOw0KPiA+ICAg
fQ0KPiA+ICsNCj4gPiArYm9vbCB4ZV9wbV92cmFtX2QzY29sZF9hbGxvd2VkKHN0cnVjdCB4ZV9k
ZXZpY2UgKnhlKSB7DQo+ID4gKwlzdHJ1Y3QgdHRtX3Jlc291cmNlX21hbmFnZXIgKm1hbjsNCj4g
PiArCXUzMiB0b3RhbF92cmFtX3VzZWRfbWIgPSAwOw0KPiA+ICsJYm9vbCBhbGxvd2VkOw0KPiA+
ICsJdTY0IHZyYW1fdXNlZDsNCj4gPiArCWludCBpOw0KPiA+ICsNCj4gPiArCS8qIFRPRE86IEV4
dGVuZCB0aGUgbG9naWMgdG8gYmV5b25kIFhFX1BMX1ZSQU0xICovDQo+ID4gKwlmb3IgKGkgPSBY
RV9QTF9WUkFNMDsgaSA8PSBYRV9QTF9WUkFNMTsgKytpKSB7DQo+ID4gKwkJbWFuID0gdHRtX21h
bmFnZXJfdHlwZSgmeGUtPnR0bSwgaSk7DQo+ID4gKwkJaWYgKG1hbikgew0KPiA+ICsJCQl2cmFt
X3VzZWQgPSB0dG1fcmVzb3VyY2VfbWFuYWdlcl91c2FnZShtYW4pOw0KPiA+ICsJCQl0b3RhbF92
cmFtX3VzZWRfbWIgKz0NCj4gRElWX1JPVU5EX1VQX1VMTCh2cmFtX3VzZWQsIDEwMjQgKiAxMDI0
KTsNCj4gPiArCQl9DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJbXV0ZXhfbG9jaygmeGUtPmQzY29s
ZC5sb2NrKTsNCj4gPiArDQo+ID4gKwlpZiAodG90YWxfdnJhbV91c2VkX21iIDw9IHhlLT5kM2Nv
bGQudnJhbV90aHJlc2hvbGQpDQo+ID4gKwkJYWxsb3dlZCA9IHRydWU7DQo+IENhbid0IHhlLT5k
M2NvbGQuYWxsb3dlZCBiZSBkaXJlY3RseSBtb2RpZmllZCBoZXJlPyBUaGVyZSdzIGFsc28gYSBs
b2NrDQo+IGFyb3VuZCB0aGUgY29kZQ0KcGF0Y2ggaGF2ZSBsb2NrIHRvIHByb3RlY3QgdGhlIHZy
YW1fdGhyZXNob2xkIGNvbmRpdGlvbiwgaXQgaXMgbm90IHRvIHByb2VjdCB0aGUgZDNjb2xkLmFs
bG93ZWQuIEkgY2FuIGFzc2lnbiBkM2NvbGQuYWxsb3dlZCBoZXJlIGJ1dCB0aGF0IHdvdWxkIHJl
cXVpcmUgdG8gY2hhbmdlIHRoZSBmdW5jdGlvbiBuYW1lIHRvIA0KeGVfcG1fdnJhbV90b2dnbGVf
ZDNjb2xkX2FsbG93KCkuDQpCciwNCkFuc2h1bWFuIEd1cHRhDQo+IA0KPiBUaGFua3MNCj4gUmlh
bmENCj4gPiArCWVsc2UNCj4gPiArCQlhbGxvd2VkID0gZmFsc2U7DQo+ID4gKw0KPiA+ICsJbXV0
ZXhfdW5sb2NrKCZ4ZS0+ZDNjb2xkLmxvY2spOw0KPiA+ICsNCj4gPiArCXJldHVybiBhbGxvd2Vk
Ow0KPiA+ICt9DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbS5oIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BtLmgNCj4gPiBpbmRleCBiNTBlYzhiZGNlNmYuLjA4NjEy
Y2YzZTY3YiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcG0uaA0KPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbS5oDQo+ID4gQEAgLTI0LDUgKzI0LDYgQEAg
aW50IHhlX3BtX3J1bnRpbWVfcHV0KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKTsNCj4gPiAgIGJvb2wg
eGVfcG1fcnVudGltZV9yZXN1bWVfaWZfc3VzcGVuZGVkKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKTsN
Cj4gPiAgIGludCB4ZV9wbV9ydW50aW1lX2dldF9pZl9hY3RpdmUoc3RydWN0IHhlX2RldmljZSAq
eGUpOw0KPiA+ICAgaW50IHhlX3BtX3NldF92cmFtX3RocmVzaG9sZChzdHJ1Y3QgeGVfZGV2aWNl
ICp4ZSwgdTMyIHRocmVzaG9sZCk7DQo+ID4gK2Jvb2wgeGVfcG1fdnJhbV9kM2NvbGRfYWxsb3dl
ZChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSk7DQo+ID4NCj4gPiAgICNlbmRpZg0K
