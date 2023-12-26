Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A47C46CD3
	for <intel-xe@archiver.kernel.org>; Tue, 26 Dec 2023 14:29:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D31C710E0A5;
	Tue, 26 Dec 2023 14:29:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6B510E0A5
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Dec 2023 14:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703600942; x=1735136942;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JHx9KP4KGGmPmaWniweHWPWx1J2oVIyBYyLDYglrLqg=;
 b=VPb7rxvfTK89srt1eUnOtX2GuKkzwtWStw28S1I3Vh4PkUl6naWy67Ro
 X4sw0FTAUCkpoMA0gBK79n80LlyvKRyaiOnmi5ll1qaS5tNW0wzxCupcu
 6OqoJFVDgP1x+pRh8j+wWxbbiu/HRUBUFe/FaoHDcd6xODT7tfYW8/EUy
 hoIe71lQ8KmqlleKQ3wjATVf/jOCpe+wvoF+/aB4PScG+zyLlIA2MALlR
 Du9zQCs03Vkm6iXBcoHqZjUQuP76UbyLTGh/4pYO7MUV9dt8jLbu5/+SR
 GHP3VZx7/K9BIRLpy7OaJvw55Py7zTny1nBVTOiA/GezOogkai/K8oKWV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="393508860"
X-IronPort-AV: E=Sophos;i="6.04,306,1695711600"; d="scan'208";a="393508860"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Dec 2023 06:29:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="754190530"
X-IronPort-AV: E=Sophos;i="6.04,306,1695711600"; d="scan'208";a="754190530"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Dec 2023 06:29:01 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Dec 2023 06:29:00 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Dec 2023 06:29:00 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Dec 2023 06:29:00 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Dec 2023 06:29:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bpaj8jjmygQo8dFu+dW9TkJm0KLCTJA03RM5xFSC0T5R6/f9AAGiP2+MpeXxqbybyTRpP5Fn2a7r39xcxd0m9Mqojj1g61gcMg9K5od7IHbcj7a0WGyWy/2KzHjGVRHR4fl4itAezjsiJxvgywr1MkMv4Lu690hpRJbHVL4J51VWl0lxnInTNrKGEM2/aBTbVUGoFiUNKJJn+t/QhbQMJ6NFuubw3xS5s386nydC1uhiEK6tR4IQYFaP0sTAHNTcNJSznzrRSeOuXsfU2K3a8dzqw7vQ4SP601vos+WJpRgv+L+1v8JDXFC1AeWnHj1SJc2XEry6xY2VGEWfyMBQBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHx9KP4KGGmPmaWniweHWPWx1J2oVIyBYyLDYglrLqg=;
 b=UQRciJHYPHB5CPrXDK6Zj8VIREpFHRaaty08gt1CFbjGTvdKs4xQsVleFdnly3QCZWKHs2ZSidyKblILztiGWipBIYbu4vq0ghHuC+hZEtLFI3VeNiTVt/z+wm0hgHJlcCFQTnNM8zuwXiIyekaKtH2NqDaG0pLW8uQKoUq0riPGxaVxQIIAwqhEXUiFAQaaMeusFpUOKNErje/YUh+KNPcE36VfpSqMWAOk+6G9PrO4+Q0h/MWn020L2ezb6Vjo8EPkmVvcpJ29Q1ngz/nder6/L7PF3Tw1sxB5h12UUfZKz9mzzWKjbg1+gdYfIbaxcgao6VfquCEOGBy5JSIQ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by MN2PR11MB4742.namprd11.prod.outlook.com (2603:10b6:208:26b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Tue, 26 Dec
 2023 14:28:57 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::a226:f114:4de2:5762]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::a226:f114:4de2:5762%4]) with mapi id 15.20.7113.027; Tue, 26 Dec 2023
 14:28:57 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [v6] drm/xe: Add vram frequency sysfs attributes
Thread-Topic: [v6] drm/xe: Add vram frequency sysfs attributes
Thread-Index: AQHaNMTbY7op1p/q30Ku5LZRgdlPiLC1T5AwgAWv2gCAAKWiYA==
Date: Tue, 26 Dec 2023 14:28:56 +0000
Message-ID: <CY5PR11MB62110361C1C67AD8ABA5AA259598A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20231222110631.999517-1-sujaritha.sundaresan@intel.com>
 <CY5PR11MB6211B2AC3B3E3B1A926252219594A@CY5PR11MB6211.namprd11.prod.outlook.com>
 <369acab0-b07e-48d3-ad90-c28969e8957e@intel.com>
In-Reply-To: <369acab0-b07e-48d3-ad90-c28969e8957e@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|MN2PR11MB4742:EE_
x-ms-office365-filtering-correlation-id: 49914d93-f766-453e-40e6-08dc061efe66
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M66DsmL4WKIM5aVnRPxSxq71wxOxVoXMVGleLLDuQ0CIpXHRDRorkYXtDLq8OYFPtEoux+/R7YnhBYMHdOoc5C2jQ3flnBhPWgc36zzPUHyu8VzwkWUa+bvRhNSzbk+GInL7Nd/CNwZlrLNkbtYL0568G+ae5T2mp8Yvqogb6/+eoGatUXEOY+nmWQLcm0vkqY+nAMt3uNTi+/QtEVnRv1/r94Ar3DjYoPAqAVybAgnTlvRWEre+nKsOmu1Gl1wNJZx1eL17cfGia92xRV1X3NWqDRz6tgkFxFOj6oUy0AsJMgInLng//xL52QRdFC+oPR13z6PFsM9CHPBtBfkipkbeJKOqSpb692k7Yqa3/vwEnMIvYfncL+uXMf40sN6OhAunxnP7mwZMfYdI5nKGD6vDS0E1j2Jd4hJE9EngwD2uxUogRwQotBBuwXTHq13zvRmW3Iz7OgML4jyUtFNAfwpCjGGX13ftEGj+RUfS2YB0nDXWrafAoGamOe6gU5bgUVSx03dILSjPFq/byiOBmPg23vqQywPPjXlaDQ/wPmc7qNhAtwy0z/4ucn5KuOtrplBrj7WGJ+e0RuM+vWDvXbjotouVqkYHE3/7nCD6TDKZrkKM13nm6rw3AzXBi7Qy
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(39860400002)(396003)(136003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(83380400001)(41300700001)(82960400001)(38100700002)(122000001)(26005)(107886003)(110136005)(52536014)(316002)(4326008)(8936002)(8676002)(2906002)(5660300002)(478600001)(71200400001)(53546011)(6506007)(7696005)(9686003)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(38070700009)(86362001)(33656002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MlVpRjdSeU44YTVUSXpmcVpVL2pYclRNN2ZkNWlLTFR1c04rK3RNc1ZqazRR?=
 =?utf-8?B?ZHk2ZWpWakVYS0pyMmk4K2dhdGxad0tLbHI2VnJTdUdVTFUxOTNqK2J5anVB?=
 =?utf-8?B?ejJzUjJNeUIzemFNUGJmOVN2T09BQ2sxSUtnT1pwWURHdXdjelNZZ2NnNldV?=
 =?utf-8?B?NlJEcGRBU1R2ZzVoejBGV3RWZnJXZjRnaHIyOHk3cndhVUw4TWRrOXc5cjN5?=
 =?utf-8?B?SDZLR0FGWnppQkRNaitJVlRwZGs1eGpEWHJINzlEcGgycENLS1VpOU5ZNENq?=
 =?utf-8?B?bi9RZEFzcDBjVjI2U1JhU1h0MjhVSkVzZUtJaXNBaHVkejlGZ1VXczJFWDBH?=
 =?utf-8?B?M09ma2VmSE1rVVY4SGlGQkxzRUs2VUZ3OVUwWVlqOG15Q3NJUnhMTWpTcndO?=
 =?utf-8?B?ODN2cTNUTW5SSmhPRk1hRzVxbGZmc1doTEZOSUtpcXVuVDMySy9wcXJQWUc5?=
 =?utf-8?B?eTgwUnJBbDV1NHZZSDRkcW1EZHkwMmE1WjVwUjJmWEhHdXJaRzFtMDdMQWRB?=
 =?utf-8?B?MnhxVXZBZGZuNk14Q3ViWFFmU2ZlTXd2YnpzSkQxdlBJMEh3L3NNaE40VHUz?=
 =?utf-8?B?K3ZYWHJ1RjVnYjZpYVh0cGt2ZDFpU1FhZmYrck4yVndFcEE0RTFLKzhsV3du?=
 =?utf-8?B?QXJpWEJyVktOejRid2I5VUtQUm9NeTUxdkxqUmovYktJK1I0VUhyZlFFcEZp?=
 =?utf-8?B?c3YxZWdEc0ZQUk1xZDZhKzZDcUh5OU5HYkpsVUhqcXVxdnBrV0kvQk53aUU4?=
 =?utf-8?B?SGY2NkNMREhocHIvdENNSm80cXB4VG9Wc0RFODVrNWU4UThQUW54cUY5UzlJ?=
 =?utf-8?B?ZmVjVzlWQ05VaVVrc1cwK0ptOUJGUnpGSnRaY2R5dnJZMFliODViK3A2WVdv?=
 =?utf-8?B?bGs2V1FROTBXaFU1SjNiSHNiMm5Eb3A4OW5kMVlVamN2dDZRUjU4V2o0Yzg2?=
 =?utf-8?B?blcrdkhvdzltMmdsbWlIZjVMZHB4K1YrUzZ5MXNaTkpNUG1RbmJHM29zdFlZ?=
 =?utf-8?B?elE0b1RJSS9wSHNvekx1cnVWOW1VUCtDTzNkSDRwdUthYzBMUE5jMFh6Mllx?=
 =?utf-8?B?UWFDdDlrTmtxaWNibDhmUHVMeGp6MVJBYzREODZxaXBmWThNY0g1ZHpBNk1H?=
 =?utf-8?B?aEFzSERNWFhvR2YxdHFMUkFsODNUWGR2d0w0Wmg4eCtZOXRkYWR4NVZCNGpS?=
 =?utf-8?B?azN3WnJMblNUcVpGMGExNVdVa28waUVwbHpUMkhTdHdtejVETDg2bmRYVS9J?=
 =?utf-8?B?L3lhTTJmMS96MEZOSi9jUUlleGF4ZW8rNE5SWngrUmpiaE1tMlBlYUpVcHFQ?=
 =?utf-8?B?YWRqYU9uRjdXWUJEQ0c2N1ZWY0lTcXU2a01xWG9ka1NzbEpVdmJvbzl2OUF6?=
 =?utf-8?B?K3BLT0U0YUNhL0tBaUpBVkRCUGprT0JGWkd4WXpxbHFxaUtaR0RuS2htODZG?=
 =?utf-8?B?eUpPOWYxQlJrVEx1QmlRKzB3dXpyTnFBc1d0R3dRdVQwUUpiTUlTVWVPdHJr?=
 =?utf-8?B?ak0xV0QvU0I2YmVwVXRheEJPYzUvWUM4UzMrTzNPa1c2TEZQZVVUeG92c2tC?=
 =?utf-8?B?bEpUSnZkUUxJSmVPbFM2blcyUHdwV0dpeWJpaFdGTFhLb3k4MTRLcVh5ZUdZ?=
 =?utf-8?B?anFmTDkybnp5MEdybFYwT3A3WjZjdXNvOFlrOTMxNnFoRExUMW5ONDlHMXFO?=
 =?utf-8?B?dlV2LzNJL1BVUWlnem1jRHRGdTV4Y3NJN1pORGV0ZTdTQzFVUm5nT2hCR0Mr?=
 =?utf-8?B?WU81SFpOR1Bqam9jaWVwd1lkZTgzeWlGQW00ZURkZ0ZIZ1ZaMzFhakdUK3Fa?=
 =?utf-8?B?M2JTRGNZNVdPYVZWZEhOMWlWL1RpZERwWnk2QlVrVzFZMDFJREpJbGRRZVRv?=
 =?utf-8?B?Tng4Tm9iUG5ZeWVuUTI2QU5OK2lRUUgxek4xTksxMUd3azNVMXJlOTlRNVhY?=
 =?utf-8?B?dEJCaU15VmxWWnhXMFFHUjJOQlpES1hGQmpkTEN1L01LcTlZUWY4bmhpRmJ4?=
 =?utf-8?B?dmxrSVQyQ20xdVQ1Rk5TMi94Uk9nS0ZBVHZ4SnFJVUhkUEF2MjJTTGJhSjNo?=
 =?utf-8?B?Sk90aE13MnNaUC9JRjhaRDJ0T1YwUWxIY05WZXdiV2VZV3lxYUxxeW5WZTB2?=
 =?utf-8?Q?xxivT9vnX0AJ//ejk+LV5otHk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49914d93-f766-453e-40e6-08dc061efe66
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Dec 2023 14:28:56.6283 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Hg0NKJ7n9sug0GUeZ+q09SJZmuIXmiSc0GGFaeqoqGjMhFBr+tNnJYEurhRGxskwobwAZCjDLnlJSvheKY8blX1L+lNHm9K9OCIgOBDlKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4742
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3VuZGFyZXNhbiwgU3Vq
YXJpdGhhIDxzdWphcml0aGEuc3VuZGFyZXNhbkBpbnRlbC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IERlY2VtYmVyIDI2LCAyMDIzIDEwOjAyIEFNDQo+IFRvOiBHdXB0YSwgQW5zaHVtYW4gPGFuc2h1
bWFuLmd1cHRhQGludGVsLmNvbT47IGludGVsLQ0KPiB4ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj4gQ2M6IFZpdmksIFJvZHJpZ28gPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6
IFJlOiBbdjZdIGRybS94ZTogQWRkIHZyYW0gZnJlcXVlbmN5IHN5c2ZzIGF0dHJpYnV0ZXMNCj4g
DQo+IA0KPiBPbiAxMi8yMi8yMDIzIDc6MzQgUE0sIEd1cHRhLCBBbnNodW1hbiB3cm90ZToNCj4g
Pg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBTdW5kYXJlc2Fu
LCBTdWphcml0aGEgPHN1amFyaXRoYS5zdW5kYXJlc2FuQGludGVsLmNvbT4NCj4gPj4gU2VudDog
RnJpZGF5LCBEZWNlbWJlciAyMiwgMjAyMyA0OjM3IFBNDQo+ID4+IFRvOiBpbnRlbC14ZUBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCj4gPj4gQ2M6IFZpdmksIFJvZHJpZ28gPHJvZHJpZ28udml2aUBp
bnRlbC5jb20+OyBHdXB0YSwgQW5zaHVtYW4NCj4gPj4gPGFuc2h1bWFuLmd1cHRhQGludGVsLmNv
bT47IFN1bmRhcmVzYW4sIFN1amFyaXRoYQ0KPiA+PiA8c3VqYXJpdGhhLnN1bmRhcmVzYW5AaW50
ZWwuY29tPg0KPiA+PiBTdWJqZWN0OiBbdjZdIGRybS94ZTogQWRkIHZyYW0gZnJlcXVlbmN5IHN5
c2ZzIGF0dHJpYnV0ZXMNCj4gPj4NCj4gPj4gQWRkIHZyYW0gZnJlcXVlbmN5IHN5c2ZzIGF0dHJp
YnV0ZXMgdW5kZXIgdGhlIGJlbG93IGhpZXJhcmNoeTsNCj4gPj4NCj4gPj4gL2RldmljZS90aWxl
Iy9tZW1vcnkvZnJlcTANCj4gPj4gCQkJfC1tYXhfZnJlcQ0KPiA+PiAJCQl8LW1pbl9mcmVxDQo+
ID4+DQo+ID4+IHYyOiBEcm9wICJ2cmFtIiBmcm9tIGF0dHJpYnV0ZSBuYW1lcyAoUm9kcmlnbykN
Cj4gPj4NCj4gPj4gdjM6IEFkZCBkb2N1bWVudGF0aW9uIGZvciBuZXcgc3lzZnMgKFJpYW5hKQ0K
PiA+PiAgICAgIERyb3AgcHJlZml4IGZyb20gWEVIUF9QQ09ERV9GUkVRVUVOQ1lfQ09ORklHIChS
aWFuYSkNCj4gPj4NCj4gPj4gdjQ6IENyZWF0ZSBzeXNmcyB1bmRlciB0aWxlIy9mcmVxMCBhZnRl
ciByZW1vdmFsIG9mDQo+ID4+ICAgICAgcGh5c2ljYWxfbWVtc2l6ZSBhdHRyYnV0ZQ0KPiA+Pg0K
PiA+PiB2NTogUmV2ZXJ0IGJhY2sgdG8gY3JlYXRpbmcgc3lzZnMgdW5kZXIgdGlsZSMvbWVtb3J5
L2ZyZXEwDQo+ID4+ICAgICAgUmVtb3ZlIGRlZmluaXRpb24gb2YgR1RfRlJFUVVFTkNZX01VTFRJ
UExJRVIgKFJvZHJpZ28pDQo+ID4+DQo+ID4+IHY2OiBSZW5hbWUgYXR0cmlidXRlcyB0byBtYXgv
bWluX2ZyZXEgKEFuc2h1bWFuKQ0KPiA+PiAgICAgIEZpeCByZXZpZXcgY29tbWVudHMgKFJvZHJp
Z28pDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IFN1amFyaXRoYSBTdW5kYXJlc2FuIDxzdWph
cml0aGEuc3VuZGFyZXNhbkBpbnRlbC5jb20+DQo+ID4+IC0tLQ0KPiA+PiAgIGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9wY29kZV9hcGkuaCAgfCAgNyArKysNCj4gPj4gZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3RpbGVfc3lzZnMuYyB8IDg2DQo+ID4+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kw0KPiA+PiAgIDIgZmlsZXMgY2hhbmdlZCwgOTMgaW5zZXJ0aW9ucygrKQ0KPiA+Pg0KPiA+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Bjb2RlX2FwaS5oDQo+ID4+IGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3Bjb2RlX2FwaS5oDQo+ID4+IGluZGV4IDU5MzVjZmUzMDIwNC4u
ZjE1M2NlOTZmNjlhIDEwMDY0NA0KPiA+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNv
ZGVfYXBpLmgNCj4gPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Bjb2RlX2FwaS5oDQo+
ID4+IEBAIC00Miw2ICs0MiwxMyBAQA0KPiA+PiAgICNkZWZpbmUJICAgIFBPV0VSX1NFVFVQX0kx
X1NISUZUCQk2CS8qIDEwLjYgZml4ZWQNCj4gPj4gcG9pbnQgZm9ybWF0ICovDQo+ID4+ICAgI2Rl
ZmluZQkgICAgUE9XRVJfU0VUVVBfSTFfREFUQV9NQVNLDQo+ID4+IAlSRUdfR0VOTUFTSygxNSwg
MCkNCj4gPj4NCj4gPj4gKyNkZWZpbmUgICBQQ09ERV9GUkVRVUVOQ1lfQ09ORklHCQkweDZlDQo+
ID4+ICsvKiBGcmVxdWVuY3kgQ29uZmlnIFN1YiBDb21tYW5kcyAocGFyYW0xKSAqLw0KPiA+PiAr
I2RlZmluZSAgICAgUENPREVfTUJPWF9GQ19TQ19SRUFEX0ZVU0VEX1AwCTB4MA0KPiA+PiArI2Rl
ZmluZSAgICAgUENPREVfTUJPWF9GQ19TQ19SRUFEX0ZVU0VEX1BOCTB4MQ0KPiA+PiArLyogRG9t
YWluIElEcyAocGFyYW0yKSAqLw0KPiA+PiArI2RlZmluZSAgICAgUENPREVfTUJPWF9ET01BSU5f
SEJNCQkweDINCj4gPj4gKw0KPiA+PiAgIHN0cnVjdCBwY29kZV9lcnJfZGVjb2RlIHsNCj4gPj4g
ICAJaW50IGVycm5vOw0KPiA+PiAgIAljb25zdCBjaGFyICpzdHI7DQo+ID4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdGlsZV9zeXNmcy5jDQo+ID4+IGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3RpbGVfc3lzZnMuYw0KPiA+PiBpbmRleCAwZjhkM2U3ZmNlNDYuLmNkYzlkYmJj
OTdiMCAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGVfc3lzZnMu
Yw0KPiA+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdGlsZV9zeXNmcy5jDQo+ID4+IEBA
IC03LDkgKzcsMjEgQEANCj4gPj4gICAjaW5jbHVkZSA8bGludXgvc3lzZnMuaD4NCj4gPj4gICAj
aW5jbHVkZSA8ZHJtL2RybV9tYW5hZ2VkLmg+DQo+ID4+DQo+ID4+ICsjaW5jbHVkZSAieGVfZ3Rf
dHlwZXMuaCINCj4gPj4gKyNpbmNsdWRlICJ4ZV9wY29kZS5oIg0KPiA+PiArI2luY2x1ZGUgInhl
X3Bjb2RlX2FwaS5oIg0KPiA+PiAgICNpbmNsdWRlICJ4ZV90aWxlLmgiDQo+ID4+ICAgI2luY2x1
ZGUgInhlX3RpbGVfc3lzZnMuaCINCj4gPj4NCj4gPj4gKy8qKg0KPiA+PiArICogRE9DOiBYZSBU
aWxlIHN5c2ZzDQo+ID4+ICsgKg0KPiA+PiArICogUHJvdmlkZXMgc3lzZnMgZW50cmllcyBmb3Ig
ZnJlcXVlbmN5IGluIHRpbGUNCj4gPj4gKyAqDQo+ID4+ICsgKiBkZXZpY2UvdGlsZSMvbWVtb3J5
L2ZyZXEwL21heF9mcmVxIC0gTWF4aW11bSBGcmVxdWVuY3ksIG5vdCBhDQo+ID4+IGNvbmZpZ3Vy
YXRpb24gYW5kIHJlYWQtb25seS4NCj4gPiBMZXQncyBpbmNyZWFzZSB2ZXJib3NpdHkgb2YgZG9j
IHNvbWV0aGluZyBleHBsYWluaW5nIGl0IGlzIGEgZml4ZWQgZnVzZSBwb2ludCBub3QgYQ0KPiBj
b25maWd1cmF0aW9uLg0KPiBTdXJlDQo+ID4+ICsgKiBkZXZpY2UvdGlsZSMvbWVtb3J5L2ZyZXEw
L21pbl9mcmVxIC0gTWluaW11bSBGcmVxdWVuY3ksIG5vdCBhDQo+ID4+IGNvbmZpZ3VyYXRpb24g
YW5kIHJlYWQtb25seS4NCj4gPj4gKyAqLw0KPiA+PiArDQo+ID4+ICAgc3RhdGljIHZvaWQgeGVf
dGlsZV9zeXNmc19rb2JqX3JlbGVhc2Uoc3RydWN0IGtvYmplY3QgKmtvYmopICB7DQo+ID4+ICAg
CWtmcmVlKGtvYmopOw0KPiA+PiBAQCAtMjAsNiArMzIsNjUgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBrb2JqX3R5cGUNCj4gPj4geGVfdGlsZV9zeXNmc19rb2JqX3R5cGUgPSB7DQo+ID4+ICAgCS5z
eXNmc19vcHMgPSAma29ial9zeXNmc19vcHMsDQo+ID4+ICAgfTsNCj4gPj4NCj4gPj4gK3N0YXRp
YyBzc2l6ZV90IG1heF9mcmVxX3Nob3coc3RydWN0IGRldmljZSAqa2Rldiwgc3RydWN0DQo+ID4+
ICtkZXZpY2VfYXR0cmlidXRlDQo+ID4+ICphdHRyLA0KPiA+PiArCQkJICAgICBjaGFyICpidWYp
DQo+ID4+ICt7DQo+ID4+ICsJc3RydWN0IGtvYmplY3QgKmtvYmogPSAma2Rldi0+a29iajsNCj4g
Pj4gKwlzdHJ1Y3QgeGVfdGlsZSAqdGlsZSA9IGtvYmpfdG9fdGlsZShrb2JqLT5wYXJlbnQpOw0K
PiA+PiArCXN0cnVjdCB4ZV9ndCAqZ3QgPSB0aWxlLT5wcmltYXJ5X2d0Ow0KPiA+PiArCXUzMiB2
YWwsIG1ib3g7DQo+ID4+ICsJaW50IGVycjsNCj4gPj4gKw0KPiA+PiArCW1ib3ggPSBSRUdfRklF
TERfUFJFUChQQ09ERV9NQl9DT01NQU5ELA0KPiA+PiBQQ09ERV9GUkVRVUVOQ1lfQ09ORklHKQ0K
PiA+PiArCQl8IFJFR19GSUVMRF9QUkVQKFBDT0RFX01CX1BBUkFNMSwNCj4gPj4gUENPREVfTUJP
WF9GQ19TQ19SRUFEX0ZVU0VEX1AwKQ0KPiA+PiArCQl8IFJFR19GSUVMRF9QUkVQKFBDT0RFX01C
X1BBUkFNMiwNCj4gPj4gUENPREVfTUJPWF9ET01BSU5fSEJNKTsNCj4gPj4gKw0KPiA+PiArCWVy
ciA9IHhlX3Bjb2RlX3JlYWQoZ3QsIG1ib3gsICZ2YWwsIE5VTEwpOw0KPiA+PiArCWlmIChlcnIp
DQo+ID4+ICsJCXJldHVybiBlcnI7DQo+ID4+ICsNCj4gPj4gKwkvKiBkYXRhX291dCAtIEZ1c2Vk
IFAwIGZvciBkb21haW4gSUQgaW4gdW5pdHMgb2YgNTAgTUh6ICovDQo+ID4+ICsJdmFsICo9IDUw
Ow0KPiA+PiArDQo+ID4+ICsJcmV0dXJuIHN5c2ZzX2VtaXQoYnVmLCAiJXVcbiIsIHZhbCk7IH0g
c3RhdGljDQo+ID4+ICtERVZJQ0VfQVRUUl9STyhtYXhfZnJlcSk7DQo+ID4+ICsNCj4gPj4gK3N0
YXRpYyBzc2l6ZV90IG1pbl9mcmVxX3Nob3coc3RydWN0IGRldmljZSAqa2Rldiwgc3RydWN0DQo+
ID4+ICtkZXZpY2VfYXR0cmlidXRlDQo+ID4+ICphdHRyLA0KPiA+PiArCQkJICAgICBjaGFyICpi
dWYpDQo+ID4+ICt7DQo+ID4+ICsJc3RydWN0IGtvYmplY3QgKmtvYmogPSAma2Rldi0+a29iajsN
Cj4gPj4gKwlzdHJ1Y3QgeGVfdGlsZSAqdGlsZSA9IGtvYmpfdG9fdGlsZShrb2JqLT5wYXJlbnQp
Ow0KPiA+IElmIHlvdSBhcmUgbWlzc2luZyB0byBjcmVhdGUgYSBrb2JqZWN0IGZvciBmcmVxMCAs
IHRoZW4gdGhpcyBzaG91bGQgYmUNCj4gPiBrb2JqLT5wYXJlbnQtPnBhcmVudC4NCj4gDQo+IEkg
ZG9uJ3QgdGhpbmsgYSBrb2JqZWN0IGlzIG5lZWRlZCBmb3IgZnJlcTAsIHNpbmNlIGl0IHdlIGFy
ZSBvbmx5IHVzaW5nDQo+IGF0dHJpYnV0ZV9ncm91cCBmb3IgaXQuDQo+IA0KPiBTaW1pbGFyIHRv
IHRocm90dGxlX3JlYXNvbnMuDQpTdXJlLCAgdGhhbmtzIGZvciBleHBsYW5hdGlvbi4NCj4gDQo+
ID4+ICsJc3RydWN0IHhlX2d0ICpndCA9IHRpbGUtPnByaW1hcnlfZ3Q7DQo+ID4+ICsJdTMyIHZh
bCwgbWJveDsNCj4gPj4gKwlpbnQgZXJyOw0KPiA+PiArDQo+ID4+ICsJbWJveCA9IFJFR19GSUVM
RF9QUkVQKFBDT0RFX01CX0NPTU1BTkQsDQo+ID4+IFBDT0RFX0ZSRVFVRU5DWV9DT05GSUcpDQo+
ID4+ICsJCXwgUkVHX0ZJRUxEX1BSRVAoUENPREVfTUJfUEFSQU0xLA0KPiA+PiBQQ09ERV9NQk9Y
X0ZDX1NDX1JFQURfRlVTRURfUE4pDQo+ID4+ICsJCXwgUkVHX0ZJRUxEX1BSRVAoUENPREVfTUJf
UEFSQU0yLA0KPiA+PiBQQ09ERV9NQk9YX0RPTUFJTl9IQk0pOw0KPiA+PiArDQo+ID4+ICsJZXJy
ID0geGVfcGNvZGVfcmVhZChndCwgbWJveCwgJnZhbCwgTlVMTCk7DQo+ID4+ICsJaWYgKGVycikN
Cj4gPj4gKwkJcmV0dXJuIGVycjsNCj4gPj4gKw0KPiA+PiArCS8qIGRhdGFfb3V0IC0gRnVzZWQg
UG4gZm9yIGRvbWFpbiBJRCBpbiB1bml0cyBvZiA1MCBNSHogKi8NCj4gPj4gKwl2YWwgKj0gNTA7
DQo+ID4+ICsNCj4gPj4gKwlyZXR1cm4gc3lzZnNfZW1pdChidWYsICIldVxuIiwgdmFsKTsgfSBz
dGF0aWMNCj4gPj4gK0RFVklDRV9BVFRSX1JPKG1pbl9mcmVxKTsNCj4gPj4gKw0KPiA+PiArc3Rh
dGljIHN0cnVjdCBhdHRyaWJ1dGUgKmZyZXFfYXR0cnNbXSA9IHsNCj4gPj4gKwkmZGV2X2F0dHJf
bWF4X2ZyZXEuYXR0ciwNCj4gPj4gKwkmZGV2X2F0dHJfbWluX2ZyZXEuYXR0ciwNCj4gPj4gKwlO
VUxMDQo+ID4+ICt9Ow0KPiA+PiArDQo+ID4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGF0dHJpYnV0
ZV9ncm91cCBmcmVxX2dyb3VwX2F0dHJzID0gew0KPiA+PiArCS5uYW1lID0gImZyZXEwIiwNCj4g
Pj4gKwkuYXR0cnMgPSBmcmVxX2F0dHJzLA0KPiA+PiArfTsNCj4gPj4gKw0KPiA+PiAgIHN0YXRp
YyB2b2lkIHRpbGVfc3lzZnNfZmluaShzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCB2b2lkICphcmcp
ICB7DQo+ID4+ICAgCXN0cnVjdCB4ZV90aWxlICp0aWxlID0gYXJnOw0KPiA+PiBAQCAtMzIsNiAr
MTAzLDcgQEAgdm9pZCB4ZV90aWxlX3N5c2ZzX2luaXQoc3RydWN0IHhlX3RpbGUgKnRpbGUpDQo+
ID4+ICAgCXN0cnVjdCB4ZV9kZXZpY2UgKnhlID0gdGlsZV90b194ZSh0aWxlKTsNCj4gPj4gICAJ
c3RydWN0IGRldmljZSAqZGV2ID0geGUtPmRybS5kZXY7DQo+ID4+ICAgCXN0cnVjdCBrb2JqX3Rp
bGUgKmt0Ow0KPiA+PiArCXN0cnVjdCBrb2JqZWN0ICprb2JqOw0KPiA+PiAgIAlpbnQgZXJyOw0K
PiA+Pg0KPiA+PiAgIAlrdCA9IGt6YWxsb2Moc2l6ZW9mKCprdCksIEdGUF9LRVJORUwpOyBAQCAt
NTAsNiArMTIyLDIwIEBAIHZvaWQNCj4gPj4geGVfdGlsZV9zeXNmc19pbml0KHN0cnVjdCB4ZV90
aWxlICp0aWxlKQ0KPiA+Pg0KPiA+PiAgIAl0aWxlLT5zeXNmcyA9ICZrdC0+YmFzZTsNCj4gPj4N
Cj4gPj4gKwlpZiAoeGUtPmluZm8ucGxhdGZvcm0gPT0gWEVfUFZDKSB7DQo+ID4+ICsJCWtvYmog
PSBrb2JqZWN0X2NyZWF0ZV9hbmRfYWRkKCJtZW1vcnkiLCB0aWxlLT5zeXNmcyk7DQo+ID4gSG93
IGZyZXEwIGlzIGdldHRpbmcgYWRkZWQsIEkgYW0gdW5hYmxlIHRvIHNlZSB0aGUgZnJlcTAga29i
amVjdCBhcyBwZXIgdGhlIHBhdGgNCj4gImRldmljZS90aWxlIy9tZW1vcnkvZnJlcTAvIg0KPiBm
cmVxMCBpcyBiZWluZyBhZGRlZCBhcyBhbiBhdHRyaWJ1dGUgZ3JvdXAuIEl0IGlzIHNpbWlsYXIg
dG8gdGhlIHRocm90dGxlX3JlYXNvbnMNCj4gaW1wbGVtZW50YXRpb24uDQo+ID4+ICsJCWlmICgh
a29iaikNCj4gPj4gKwkJCWRybV93YXJuKCZ4ZS0+ZHJtLCAiZmFpbGVkIHRvIGFkZCBtZW1vcnkN
Cj4gPj4gZGlyZWN0b3J5LCBlcnI6ICVkXG4iLCAtRU5PTUVNKTsNCj4gPj4gKwl9DQo+ID4+ICsN
Cj4gPj4gKwlpZiAoa29iaiAmJiB4ZS0+aW5mby5wbGF0Zm9ybSA9PSBYRV9QVkMpIHsNCj4gPj4g
KwkJZXJyID0gc3lzZnNfY3JlYXRlX2dyb3VwKGtvYmosICZmcmVxX2dyb3VwX2F0dHJzKTsNCj4g
Pj4gKwkJaWYgKGVycikgew0KPiA+PiArCQkJZHJtX3dhcm4oJnhlLT5kcm0sICJmYWlsZWQgdG8g
cmVnaXN0ZXIgdnJhbSBmcmVxDQo+ID4+IHN5c2ZzLCBlcnI6ICVkXG4iLCBlcnIpOw0KPiA+PiAr
CQkJcmV0dXJuOw0KPiA+PiArCQl9DQo+ID4+ICsJfQ0KPiA+IERvbid0IHdlIG5lZWQgc3lzZnMg
Y2xlYW51cCBhbmQga29iamVjdF9wdXQgaW4gdGlsZV9zeXNmc19maW5pKCkgPw0KPiA+IEhhdmUg
eW91IG1hZGUgc3VyZSBrbWVtbGVhayB3b24ndCBjb21wbGFpbiBoZXJlIG9uIG1lbW9yeSBsZWFr
ID8NCkNoZWNrIHRoZSBrb2JqZWN0X3JlbGVhc2UoKSAsIHRoaXMgd2lsbCBvbmx5IGdldCBjYWxs
ICwgd2hlbiBhbGwgcmVmIGNvdW50IG9mIHRoYXQga29iaiBpcyBiZWluZyBwdXQuDQpIZXJlIHlv
dSBhcmUgY3JlYXRpbmcgYSBvYmplY3QgYW5kIGl0IHdpbGwgbmV2ZXIgYmUgcmVsZWFzZWQuDQpB
bHNvICB3ZSBuZWVkIHRvIGNhbGwgIHRoZSBzeXNmc19yZW1vdmVfZ3JvdXAoKSBhcyB3ZWxsIGlu
IGZpbmkgZnVuY3Rpb24gPw0KDQpUaGFua3MsDQpBbnNodW1hbi4NCg0KPiA+DQo+ID4gVGhhbmtz
LA0KPiA+IEFuc2h1bWFuIEd1cHRhLg0KPiANCj4gSSBoYXZlIGFscmVhZHkgY2hlY2tlZCBmb3Ig
bWVtIGxlYWtzIGR1cmluZyB0aGUgY2xlYW51cC4gVGhlIGtvYmplY3RfcHV0IGlzIG5vdA0KPiBu
ZWVkZWQuDQo+IA0KPiBUaGFua3MsDQo+IA0KPiBTdWphDQo+IA0KPiA+PiArDQo+ID4+ICAgCWVy
ciA9IGRybW1fYWRkX2FjdGlvbl9vcl9yZXNldCgmeGUtPmRybSwgdGlsZV9zeXNmc19maW5pLCB0
aWxlKTsNCj4gPj4gICAJaWYgKGVycikNCj4gPj4gICAJCWRybV93YXJuKCZ4ZS0+ZHJtLCAiJXM6
IGRybW1fYWRkX2FjdGlvbl9vcl9yZXNldCBmYWlsZWQsDQo+ID4+IGVycjogJWRcbiIsDQo+ID4+
IC0tDQo+ID4+IDIuMjUuMQ0K
