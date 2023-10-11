Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAF7CD98F5
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 07:26:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE5110E483;
	Wed, 11 Oct 2023 07:26:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B15110E483
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 07:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697009171; x=1728545171;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LiuzAaOVXa/6TsneRbVtIAMS1/K5XkLiyUQ68gEss2E=;
 b=W1qrZLh4xo4xKYx1WFPnpNhvGHNAhljv+4kfIqpG2YUHP7bVG9ACJgKS
 uwFFZUtoEmtPDWjP9py/rq4R9lTdbl7HYxpvw0uTBqTBlCbW83kGpsbEe
 PlDuPp+8iCycLzOwWkNrbRTbFiFwSR7WFsSJ424jaYyR2QXhBL8j1HzUz
 7TmcehY04B80FsaTe2rwV4GXj5qfW6+6zyFPNL561UPIchBF3S8tS4Tgt
 n/8cdrkbs4wEq4dI4NcBQScSeAWHR9/S3alZDzq1xMl2q2NGJv587offq
 3QCHsmo6Vo0Qpw/jyoSLWLBJycRgvf26s8vkr316JhBS8qZnBnRG420o1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="363957885"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="363957885"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 00:26:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="819592366"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="819592366"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2023 00:26:03 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 00:26:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 00:26:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 11 Oct 2023 00:26:02 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 11 Oct 2023 00:26:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8AYqxRXpTL0J5ucHxjfSRULyIExlXY8HUK9MQhjZcLdnEHqZo5HxyLWV+PuknZy8cTS5f6CqYYk2u1QrL9jdH9X7EAoKDn29bMKQRRvbcN2QrgFa+IUiHSK7CKNZqsPpcRXbfm1jWqUaN46lDmQcD8BT197COHmjpVQLCGGWmxZSYNIJMX71wfEC4hGmCceQfeQx6NwDvJgNAqIYkjtgsB1BdcVI0wIzdwAw4GGbtVcN+rbsLEGsaFVeieKtut0FBXqupHlzI4/agM1G77KmFWjZuu1IK3d2zgqiFS5R4eYfmlgpeH4N/jbzKEzPcd0LoPV+weyeZQJkwChd0MUFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LiuzAaOVXa/6TsneRbVtIAMS1/K5XkLiyUQ68gEss2E=;
 b=e42dhMfgfvkLvrfISv7mM8SNMZp3YLaF/MxkCTv6qavAH8w6AKorKWMs88zBMTISAQW/F6wYSM9aHFVsV7D2LZ27yTz7AbrdZWENtXDS4RBNUICjiT3zg4aTLNH0RG2q9FAYUKEB5cr64UdZndhNZYWeJa/0h2dnw4FBpca4g5c9yioI1xbP4rXYeY3rQPbAESVTBjiDe2+ZNk/cOvXkP+7wsi3OiAhX02hx0KxdMFIT8SVvUIy7MKXStwW61Cot8iizylOfBg+u/MsRk4LUVuUV/UFCEXksKzqDNlLBSkC97UHKJiraJ5cKLstYrhdGNkWJjqinidyMTkXColXZDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB8155.namprd11.prod.outlook.com (2603:10b6:610:164::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Wed, 11 Oct
 2023 07:25:59 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::163d:1c68:1eeb:3514]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::163d:1c68:1eeb:3514%6]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 07:25:59 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH 06/11] drm/xe: Notify userspace about GSC HW
 errors.
Thread-Index: AQHZ8Tdr7IVZgnkmeUeKs0/66MRVfbBERTAAgAAAO0A=
Date: Wed, 11 Oct 2023 07:25:58 +0000
Message-ID: <MW4PR11MB70569F78CD647F840CD2DF0BB3CCA@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230927114627.136925-1-himal.prasad.ghimiray@intel.com>
 <20230927114627.136925-7-himal.prasad.ghimiray@intel.com>
 <d2e6ffcb-9a7c-13c2-f48c-027595e90631@linux.intel.com>
In-Reply-To: <d2e6ffcb-9a7c-13c2-f48c-027595e90631@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|CH3PR11MB8155:EE_
x-ms-office365-filtering-correlation-id: cd0f43a3-1a8b-4911-d230-08dbca2b50b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pVvDSssuRVIz49xGxhylXiahDKGBmUPBghZMaO946HxAVwNWhek0WIw6KjLJu0X6zGFRTOEH7Qis92bQRe7PECsinyMOh6CKudHRO2zjnVWOfvSC9TUEI+jFATveKYlTOBr7+VFji/BDSYpp9WaQDVcwXVjweIoAKqM6eySJtwq8U3oh998PgAGbeZL81EftenywdCf0FX3zxQt1EuuNDuN8M6jkJUen1rePtG+sEQ4p4gUtLiO6OT40L1fmbBJpMblUdz5gEMROXTgO48Z8GUOfucKCYTNlptki3vpzw/0Zg29clrYm/hj2wJhBu9Hcdp4GYIMs8xvvtYyI0yh8APt7uSir+D0NWUYogl+LwNUQpEi/BensetEE4l2/ZUSxItAUXPEvkOg05i7uQr3XDpclfvYNzLQWK5wM1Hjuy3E0kQ4KlWMr9VZCZX8AYLs/fVmZml/+tGN3oh6hONH9Ji0r/+Yd7PmYXQ8rpisPjfZpskdmIjqjXvXhb44O1pojlUjbbQilwMkasa5Ty9XKfCp6r3IP1wbyaJFGiR/+Ih9oGKpF+/6W7Nu6+16gyjCR4CjiHQ1e4gF9e5EGGqrbe9zNhJVm2GKkg2dt3XH2Lagp7fSInQy942AEO+yPtKux
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(366004)(376002)(39860400002)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(26005)(53546011)(5660300002)(478600001)(7696005)(71200400001)(9686003)(6506007)(86362001)(41300700001)(33656002)(38100700002)(66476007)(66556008)(66446008)(66946007)(64756008)(110136005)(38070700005)(76116006)(316002)(8936002)(2906002)(8676002)(55016003)(52536014)(122000001)(82960400001)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WlBJTHlKVEExOC80SWRoYXdydGN6RHpDVGFxUyswYVRIRkdNZUJjOXR0NHl4?=
 =?utf-8?B?SVQ2MjhMOHhUY1g5R1dqeWI0SGxlbXpLZVVWLzgwL3pRTFBkVXc3T3gyMklz?=
 =?utf-8?B?NkdvdXBXQnJkSnRIUzd0NkZKWFZsNjUyVVVST1ZBVzJUSnJJSTRBaEV4cTVV?=
 =?utf-8?B?V3JEb0phbGtxNkw2NEE2Q05ZWlhIN2FqVUVKQkR3emIrRjhqbkd6eWE3ei81?=
 =?utf-8?B?Y0hMRk5xakljcHV5M2RXMGttSU1JQXVTZXJTRTRwb1UyUW8xdVJsS3FoTVM2?=
 =?utf-8?B?Vy9pNWhHZmVCNERtTXlWampMTXVLZ0p0SnpBWGZwKzQ0ZE5UaVhISkFHd3N0?=
 =?utf-8?B?Ry80YTJ2czdOTlNqMmxueXRhSjU2MWdaajgyVEVoYU8vMGIrd1B4dEdSa2Fw?=
 =?utf-8?B?K2syRnpRTVhEUWxTWUhQeUQxRU0zSTlLbjN3SDhLeFRzQ1BmR0ozbmpLQjRr?=
 =?utf-8?B?OUo4Z3ZSUzFKSTNCeG5CVzFONG90M1dxZWF0SUZVaVk2V3hGWDVVK08wRkhu?=
 =?utf-8?B?Zk9hT1V3b1JEdjVaeWJnTVBNUkZmckFvQjRaeE1IY2RCWEROQ09vbzFmN25S?=
 =?utf-8?B?WlVvd3Y1bElYaDJXajJIUi9pUjhYNXlad3FydXpUem9kYUtTR0Rha3ZrUE5B?=
 =?utf-8?B?MW1ZUEdkOU1Zb2M4V1lEbURWQlNoZk8xeGlEeWdRV2REaGZyVUprT1p1K0gx?=
 =?utf-8?B?YXhxYUN5OHplemFTMExEdXB6ZVA4elRyUzcwS1B2ckFvVlNNbVFTYVpiaDhX?=
 =?utf-8?B?QWlNZVZLRTdDNzc3YlVINi8wcGRlYkgvdTV5eGI3dSs0UzA5UTRvMlIwMzc2?=
 =?utf-8?B?T1hBWUM0VnQ2ZTc2VE9OZUN6VlRmMHdSV0M5blc4Y0ZCZk9QbWdSa3UzMUt5?=
 =?utf-8?B?SlhBRE9ucnU4cXhuMXVWU0FvcUg5OUtjNWxkZUxPVS9DVWRIQ0lWOW1NRERB?=
 =?utf-8?B?UGVhSlljd3NLenVnUzFLdjNMcVFnT29vVlhBUU5xWWh0UHlVUlk0ekdzckF3?=
 =?utf-8?B?TXZSYUVjMjJ1RXFKOEVKTFNqeUFCZEZ3dFhCbUJpYjQzTnd2SFg1LzBocGgv?=
 =?utf-8?B?NzdkRUFxNWNOTDJpc1BjQjR2TUkyWElwQ2tNbDRMNm0zakxHeDgwSTVreDJy?=
 =?utf-8?B?R1lnRG9sajZyR3dvOGt2M3VmK0c2QXdiai95d0YxZVBjYTNIekZaN2lOQ0ZR?=
 =?utf-8?B?cllxemVoN25MMVNicGQxQUpycEVCTDVGemVLRmd5YlVlaWt2Uk9NVzU5UjFq?=
 =?utf-8?B?eE5kUTBZbkJwYXlsNFFieVUydVFYdEJHODVySllOMmtxOVFkS0Mxa3YzaDBS?=
 =?utf-8?B?VDZHcWxlMXUyRTB0ZVlRcStndlhEVmNkOFJmYjI1QUQzOEVsYmFTcHRWZDJs?=
 =?utf-8?B?cVA1Z3l3USsxWjU1eVpjS1p5c1F1LzlWNUJGcGl3dnRMa3lFUFJ5bVlvS09v?=
 =?utf-8?B?NUVQaWdTMjZMNHMwOUpHNGI2dUg1ekd4eHhoa2lVbGtFVmRLVEQwaG9Va0Fj?=
 =?utf-8?B?WldseWZJM0REKzRyY0d3VE5ONVdjby9zeEtiNTVMVExtSFRQMmxEME9EdXVz?=
 =?utf-8?B?Zmw2VFZqbENUTHU0bnoxRVpERCtPalFtcWhiRjBKdmkwd0xJZDZjSXppY0cy?=
 =?utf-8?B?RmNtWW01aTZMajZtOC9XK1BMdjlVbVhseGJ5Y1RGanVkZUczdTAxb0xQTi9n?=
 =?utf-8?B?Wi9JMmpBaXJrUmxtUWl1Z0hoYnVyZi9OQllyc0NrTVlrbFhycEliWUM3b2Vk?=
 =?utf-8?B?VDRGV2hLZ0JLWFp4YVpWUy9EY2x3UXdkZjNpaXZHWmVtbk91OEcrTkowVWNt?=
 =?utf-8?B?dGRTWEtzQVViMUxabHIrVU1HRGVsWkxHeTNVVUxic0dUS0pKeUg0ZkI2cmZJ?=
 =?utf-8?B?d2wvbXBiaUc4YThzY2k0L2thM3p2NXBza1FkNmJRNnZoR1UrUlViMTZHdU5H?=
 =?utf-8?B?Z1lvRHd5U09meU80QVA0alBqZkw0YkdZM2hpUTR6ZDhMYjRkZy82OVZXZkdy?=
 =?utf-8?B?eS9wVTRiL1lYUWNrTDRvbnd0QTBoWXI1UTluQ0kzbCtSNVhMRWZtV3A1YzNr?=
 =?utf-8?B?Qm1LS05BbjZwVU1DejJobmlDV2dYRHh4SUJMUUluZXllR0FjZUo3V2s2dkVV?=
 =?utf-8?B?cFNTWi9RRkF0bmJ0L1A5S1FJSzdVdFJLSHdXUWoxWG5DK2xmYzJxcjBIVURQ?=
 =?utf-8?B?d0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd0f43a3-1a8b-4911-d230-08dbca2b50b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2023 07:25:58.9454 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2W7aSI3GgZHNDOceXQFA8FG+F3lW1nCqxVSy1HnzBbVfbBUyV+J2dT4xznRVDYJSzKN5l7pa0+J9zn1ddM+FTx+7szSTQXxPB30Agrw1Q0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8155
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 06/11] drm/xe: Notify userspace about GSC HW
 errors.
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXJhdmluZCBJZGRhbXNl
dHR5IDxhcmF2aW5kLmlkZGFtc2V0dHlAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiAxMSBPY3Rv
YmVyIDIwMjMgMTI6NTMNCj4gVG86IEdoaW1pcmF5LCBIaW1hbCBQcmFzYWQgPGhpbWFsLnByYXNh
ZC5naGltaXJheUBpbnRlbC5jb20+OyBpbnRlbC0NCj4geGVAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQo+IFN1YmplY3Q6IFJlOiBbSW50ZWwteGVdIFtQQVRDSCAwNi8xMV0gZHJtL3hlOiBOb3RpZnkg
dXNlcnNwYWNlIGFib3V0IEdTQw0KPiBIVyBlcnJvcnMuDQo+IA0KPiANCj4gT24gMjcvMDkvMjMg
MTc6MTYsIEhpbWFsIFByYXNhZCBHaGltaXJheSB3cm90ZToNCj4gPiBTZW5kIHVldmVudCBpbmNh
c2Ugb2Ygbm9uZmF0YWwgZXJyb3JzIHJlcG9ydGVkIGJ5IGdzYy4NCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEhpbWFsIFByYXNhZCBHaGltaXJheSA8aGltYWwucHJhc2FkLmdoaW1pcmF5QGludGVs
LmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5o
IHwgIDMgKysrDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lcnJvci5jICAgICB8IDIw
ICsrKysrKysrKysrKysrKysrKysrDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lcnJv
ci5oICAgICB8ICAzICsrLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfaXJxLmMgICAgICAg
ICAgfCAgNCArKysrDQo+ID4gIGluY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggICAgICAgICAgICB8
ICA5ICsrKysrKysrKw0KPiA+ICA1IGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
ZGV2aWNlX3R5cGVzLmgNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMu
aA0KPiA+IGluZGV4IDZhYTRmNDgwMWQ4MS4uZmY0NzZhMTY3YmU0IDEwMDY0NA0KPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPiA+IEBAIC0xNzksNiArMTc5LDkgQEAgc3Ry
dWN0IHhlX3RpbGUgew0KPiA+ICAJc3RydWN0IHRpbGVfaHdfZXJyb3JzIHsNCj4gPiAgCQl1bnNp
Z25lZCBsb25nIGNvdW50W1hFX1RJTEVfSFdfRVJST1JfTUFYXTsNCj4gPiAgCX0gZXJyb3JzOw0K
PiA+ICsNCj4gPiArCS8qKiBAZ3NjX2h3X2Vycl93b3JrOiB3b3JrZXIgZm9yIHVldmVudCB0byBy
ZXBvcnQgR1NDIEhXIGVycm9ycw0KPiAqLw0KPiA+ICsJc3RydWN0IHdvcmtfc3RydWN0IGdzY19o
d19lcnJfd29yazsNCj4gPiAgfTsNCj4gPg0KPiA+ICAvKioNCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2h3X2Vycm9yLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9od19lcnJvci5jDQo+ID4gaW5kZXggZWI3NmI4ZTZhMzM4Li43NmFlMTJkZjAxM2MgMTAwNjQ0
DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2Vycm9yLmMNCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZXJyb3IuYw0KPiA+IEBAIC0zLDYgKzMsOCBAQA0KPiA+
ICAgKiBDb3B5cmlnaHQgwqkgMjAyMyBJbnRlbCBDb3Jwb3JhdGlvbg0KPiA+ICAgKi8NCj4gPg0K
PiA+ICsjaW5jbHVkZSA8ZHJtL3hlX2RybS5oPg0KPiA+ICsNCj4gPiAgI2luY2x1ZGUgInhlX2h3
X2Vycm9yLmgiDQo+ID4NCj4gPiAgI2luY2x1ZGUgInJlZ3MveGVfcmVncy5oIg0KPiA+IEBAIC0z
NjYsNiArMzY4LDIyIEBAIHhlX2d0X2h3X2Vycm9yX2hhbmRsZXIoc3RydWN0IHhlX2d0ICpndCwg
Y29uc3QNCj4gZW51bSBoYXJkd2FyZV9lcnJvciBod19lcnIpDQo+ID4gIAkJeGVfZ3RfaHdfZXJy
b3Jfc3RhdHVzX3JlZ19oYW5kbGVyKGd0LCBod19lcnIpOyAgfQ0KPiA+DQo+ID4gK3ZvaWQgeGVf
Z3NjX2h3X2Vycm9yX3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKSB7DQo+ID4gKwlzdHJ1
Y3QgeGVfdGlsZSAqdGlsZSA9IGNvbnRhaW5lcl9vZih3b3JrLCB0eXBlb2YoKnRpbGUpLA0KPiBn
c2NfaHdfZXJyX3dvcmspOw0KPiA+ICsJY2hhciAqY3NjX2h3X2Vycm9yX2V2ZW50WzRdOw0KPiA+
ICsNCj4gPiArCWNzY19od19lcnJvcl9ldmVudFswXSA9IFhFX0dTQ19IV19IRUFMVEhfVUVWRU5U
ICI9MSI7DQo+ID4gKwljc2NfaHdfZXJyb3JfZXZlbnRbMV0gPSAiUkVTRVRfUkVRVUlSRUQ9MSI7
DQo+ID4gKwljc2NfaHdfZXJyb3JfZXZlbnRbMl0gPSBrYXNwcmludGYoR0ZQX0tFUk5FTCwgIlRJ
TEVfSUQ9JWQiLCB0aWxlLQ0KPiA+aWQpOw0KPiA+ICsJY3NjX2h3X2Vycm9yX2V2ZW50WzNdID0g
TlVMTDsNCj4gPiArDQo+ID4gKwlrb2JqZWN0X3VldmVudF9lbnYoJnRpbGUtPnhlLT5kcm0ucHJp
bWFyeS0+a2Rldi0+a29iaiwNCj4gS09CSl9DSEFOR0UsDQo+ID4gKwkJCSAgIGNzY19od19lcnJv
cl9ldmVudCk7DQo+ID4gKw0KPiA+ICsJa2ZyZWUoY3NjX2h3X2Vycm9yX2V2ZW50WzJdKTsNCj4g
PiArfQ0KPiA+ICsNCj4gPiAgc3RhdGljIHZvaWQNCj4gPiAgeGVfZ3NjX2h3X2Vycm9yX2hhbmRs
ZXIoc3RydWN0IHhlX3RpbGUgKnRpbGUsIGNvbnN0IGVudW0NCj4gPiBoYXJkd2FyZV9lcnJvciBo
d19lcnIpICB7IEBAIC00MjMsNiArNDQxLDggQEANCj4gPiB4ZV9nc2NfaHdfZXJyb3JfaGFuZGxl
cihzdHJ1Y3QgeGVfdGlsZSAqdGlsZSwgY29uc3QgZW51bSBoYXJkd2FyZV9lcnJvcg0KPiBod19l
cnIpDQo+ID4gIAkJCWRybV9lcnJfcmF0ZWxpbWl0ZWQoJnRpbGVfdG9feGUodGlsZSktPmRybSwN
Cj4gPiAgCQkJCQkgICAgSFdfRVJSICJHU0MgZGV0ZWN0ZWQgJXMgJXMNCj4gZXJyb3IsIGJpdFsl
ZF0gaXMgc2V0XG4iLA0KPiA+ICAJCQkJCSAgICBlcnJtc2csIGh3X2Vycl9zdHIsIGVycmJpdCk7
DQo+ID4gKw0KPiA+ICsJCQlzY2hlZHVsZV93b3JrKCZ0aWxlLT5nc2NfaHdfZXJyX3dvcmspOw0K
PiA+ICAJCX0NCj4gPiAgCQl0aWxlLT5lcnJvcnMuY291bnRbaW5keF0rKzsNCj4gPiAgCX0NCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2Vycm9yLmgNCj4gPiBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9od19lcnJvci5oDQo+ID4gaW5kZXggMTU1NzIyYTBhZjRjLi5l
ZTc3MDViMzM0M2IgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2Vy
cm9yLmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZXJyb3IuaA0KPiA+IEBA
IC03LDYgKzcsNyBAQA0KPiA+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9zdGRkZWYuaD4NCj4gPiAg
I2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC93b3JrcXVldWUu
aD4NCj4gPg0KPiA+ICAvKiBFcnJvciBjYXRlZ29yaWVzIHJlcG9ydGVkIGJ5IGhhcmR3YXJlICov
ICBlbnVtIGhhcmR3YXJlX2Vycm9yIHsgQEANCj4gPiAtMTIxLDUgKzEyMiw1IEBAIHN0cnVjdCB4
ZV90aWxlOw0KPiA+DQo+ID4gIHZvaWQgeGVfaHdfZXJyb3JfaXJxX2hhbmRsZXIoc3RydWN0IHhl
X3RpbGUgKnRpbGUsIGNvbnN0IHUzMg0KPiA+IG1hc3Rlcl9jdGwpOyAgdm9pZCB4ZV9wcm9jZXNz
X2h3X2Vycm9ycyhzdHJ1Y3QgeGVfZGV2aWNlICp4ZSk7DQo+ID4gLQ0KPiA+ICt2b2lkIHhlX2dz
Y19od19lcnJvcl93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yayk7DQo+ID4gICNlbmRpZg0K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaXJxLmMgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfaXJxLmMNCj4gPiBpbmRleCAwNmM5YjQzZTJjNzEuLjI4NWM2NTdjYzc4OSAx
MDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaXJxLmMNCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfaXJxLmMNCj4gPiBAQCAtNTg2LDYgKzU4NiwxMCBAQCBpbnQg
eGVfaXJxX2luc3RhbGwoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+ID4gIAlpcnFfaGFuZGxlcl90
IGlycV9oYW5kbGVyOw0KPiA+ICAJaW50IGVyciwgaXJxOw0KPiA+DQo+ID4gKwlzdHJ1Y3QgeGVf
dGlsZSAqdGlsZSA9IHhlX2RldmljZV9nZXRfcm9vdF90aWxlKHhlKTsNCj4gPiArDQo+ID4gKwlJ
TklUX1dPUksoJnRpbGUtPmdzY19od19lcnJfd29yaywgeGVfZ3NjX2h3X2Vycm9yX3dvcmspOw0K
PiA+ICsNCj4gPiAgCWlycV9oYW5kbGVyID0geGVfaXJxX2hhbmRsZXIoeGUpOw0KPiA+ICAJaWYg
KCFpcnFfaGFuZGxlcikgew0KPiA+ICAJCWRybV9lcnIoJnhlLT5kcm0sICJObyBzdXBwb3J0ZWQg
aW50ZXJydXB0IGhhbmRsZXIiKTsgZGlmZiAtLQ0KPiBnaXQNCj4gPiBhL2luY2x1ZGUvdWFwaS9k
cm0veGVfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oIGluZGV4DQo+ID4gZDQ4ZDhl
M2M4OThjLi5jNDU4MzNkZWZjYzcgMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS91YXBpL2RybS94
ZV9kcm0uaA0KPiA+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gPiBAQCAtMTYs
NiArMTYsMTUgQEAgZXh0ZXJuICJDIiB7DQo+ID4gICAqIHN1YmplY3QgdG8gYmFja3dhcmRzLWNv
bXBhdGliaWxpdHkgY29uc3RyYWludHMuDQo+ID4gICAqLw0KPiA+DQo+ID4gKy8qKg0KPiA+ICsg
KiBET0M6IHVldmVudCBnZW5lcmF0ZWQgYnkgeGUgb24gaXQncyB0aWxlIG5vZGUuDQo+ID4gKyAq
DQo+ID4gKyAqIFhFX0dTQ19IV19IRUFMVEhfVUVWRU5UIC0gRXZlbnQgaXMgZ2VuZXJhdGVkIHdo
ZW4gR1NDIHJlcG9ydHMNCj4gSFcNCj4gPiArICogZXJyb3JzLiBUaGUgdmFsdWUgc3VwcGxpZWQg
d2l0aCB0aGUgZXZlbnQgaXMgYWx3YXlzDQo+ICJSRVNFVF9SRVFVSVJFRD0xIi4NCj4gPiArICog
QWRkaXRpb25hbCBpbmZvcm1hdGlvbiBzdXBwbGllZCBpcyB0aWxlIGlkIG9uIHdoaWNoIGVycm9y
IGlzIHJlcG9ydGVkLg0KPiB3aGF0IGlzIHRoZSByZWxldmFuY2Ugb2YgdGlsZSBpZCBpZiBpdCBh
bHdheXMgcmVwb3J0ZWQgb24gdGlsZSAwIG9ubHkuDQoNCkhtbS4gWWEgcmlnaHQuIEFueSBvdGhl
ciBpbmZvcm1hdGlvbiB3ZSB3b3VsZCBsaWtlIHRvIHNlbmQgPw0KSW5zdGVhZCBvZiBERVZJQ0Vf
U1RBVFVTIGlzIGl0IG9rIHRvIHNlbmQgR1NDX0hXX1NUQVRVUyA/DQo+IA0KPiBUaGFua3MsDQo+
IA0KPiBBcmF2aW5kDQo+ID4gKyAqLw0KPiA+ICsjZGVmaW5lIFhFX0dTQ19IV19IRUFMVEhfVUVW
RU5UICJERVZJQ0VfU1RBVFVTIg0KPiA+ICsNCj4gPiAgLyoqDQo+ID4gICAqIERPQzogdWV2ZW50
IGdlbmVyYXRlZCBieSB4ZSBvbiBpdCdzIHBjaSBub2RlLg0KPiA+ICAgKg0K
