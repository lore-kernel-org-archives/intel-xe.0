Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB7AC6FD20
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 15:27:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F59C10E511;
	Fri, 24 Mar 2023 15:27:28 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4CC710E4E4
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 15:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679671646; x=1711207646;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=GzjwnlPGs4wGYZ89JX7UQyZyJs7sILwKUKbqetFY+ws=;
 b=i3lFH/DE/AzA/2hlH1mGJ3dQBzItizZLe3ksLRLvlHgy+SzGQi0ultbO
 GD3tikBHlrX5aXqJ8YBaI0/SamRWdw3/ZvJ1+3JR3XWowuSURBqTHalf5
 XWUlNcZHE9Czo+N0FFxvo/i4wfXnCCX16bKcyTT8Icnxo21BojKflWLnD
 MA/9H2mfjOnczld7aCwCuaHV4Mp/RDYpDAD4KKWa50t/9C2NEedKCP065
 5NHfSQs2+CFvQ/JzbbmfoPY45nGtHYozjkEk5GGHSXOiRWbKzKOdb9D/T
 tGMY3colaVYgAfeOHpPFWLRm6PgQezcxRsr6CUqNkKavNRU+/r7OEWY5n w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="339828549"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="339828549"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 08:27:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="1012285652"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="1012285652"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 24 Mar 2023 08:27:25 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 08:27:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 08:27:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 24 Mar 2023 08:27:24 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 24 Mar 2023 08:27:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZiaD5BDdfL3uAR0p8gf6ycM/4+nP4I2x/uzVE5Wa1/a9QV+c21k5bhz2M8eW9v0N8JOHtTMu1YO1/ULZUwIrDrsZgqHzqp1nSsHcAfEU2ycT8u6qKAtl5oWCmA/CzyBDoazzWJtjdeCzgO+tgwHikD5SIdaE0dQArIyMBlKZo2K4648XGHqcWbUTZapSaeKu7f+gxRpE9/aqUhPjd2DaofBTal/hyGUIXIzuUVvBv574aWMzmJWE6kCiaqeHU1uC+DxqWx/bnn8k4RRDO661H1D88Ei1SGqnzKK9O1P2jfEWx+bk0/sOmCDpaZche8imsGpkz+U0AND6sllscSiPZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GzjwnlPGs4wGYZ89JX7UQyZyJs7sILwKUKbqetFY+ws=;
 b=P2rgKhTjITu/h/4zecWmUbH4VkWnQET1Z2qo8dwyLTOhnvmmTxak4ZUckAQOlBEhCydEUEbbhld0yI0QfyCY1+c1z2P25DZkUPLByOPWpVZxA3tdlAeAT3LiaU6jVAO+ie/Yh3FdRNjznVVfXts1m6wUTi1yAGmUKG3av8GQsmdfGK39Md9pL7fAQWainR3rbkMaBCy3nVpP7LNBJgqOjTFnWtFa4cjb63n49jQJeUgmXngLmjdTUBs5WaTe8/t6iKLwnr8BdEyWdGdhNYGtPP56urTa8DBLOLahcl4TAU/P28ORLBzoHUx8NPZ74gq/0KUfP0OkoBtfYtlbBN0/MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY4PR11MB2054.namprd11.prod.outlook.com (2603:10b6:903:2d::9)
 by DS0PR11MB7803.namprd11.prod.outlook.com (2603:10b6:8:f5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.39; Fri, 24 Mar
 2023 15:27:22 +0000
Received: from CY4PR11MB2054.namprd11.prod.outlook.com
 ([fe80::ecb6:23da:cb6c:683b]) by CY4PR11MB2054.namprd11.prod.outlook.com
 ([fe80::ecb6:23da:cb6c:683b%10]) with mapi id 15.20.6178.038; Fri, 24 Mar
 2023 15:27:22 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
Thread-Topic: [Intel-xe] [RFC PATCH v3 1/2] drm/xe/uapi: Use hw prefix for
 hardware engines
Thread-Index: AQHZXTNRp+rbOiv/G0u2wt7IuAqET68KD9YA
Date: Fri, 24 Mar 2023 15:27:22 +0000
Message-ID: <7ad21440071a1be34e2270307e47a967403353a5.camel@intel.com>
References: <20230323025801.822678-1-matthew.brost@intel.com>
 <20230323025801.822678-2-matthew.brost@intel.com>
In-Reply-To: <20230323025801.822678-2-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR11MB2054:EE_|DS0PR11MB7803:EE_
x-ms-office365-filtering-correlation-id: 1dca29de-3a3f-4dd7-a178-08db2c7c436d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4sg0DLK+Jarmh0sEOKvxR9zLcqsVKWzXrtr5b+jvTYaEXHgnbksg9b/m70VnsUC3R5X8sOSjb/GDrmt5s9jtR9JT8jpQB+xOw1CM4uqL3W/IhEay/GUPRrcwY88WCAwDDoNgYQzQqVZsGdDQI7rQwTCByjb0L2xByYK7UMc+9doLNL56kUMcJMsqTvF+BE6LJyk8+MPkog9sp9s3lEi9V9Jwhzrk3JXnjFwjQqPiZ9Q8bUbtY+Qxph0Kq7kW/FKTs9CTzruccFo/GJ4HGVBtUyMBD0Cp6uW8WrSTp17MGhH9UcxMK+9EifoKEGlEECiQXFtCXsSNntGM5LTZysLJjwdaNTbAd49xH3g4s4I9nH5Pj621wQQkcDX3aF3LBLSg7EBEg8pHculImQIBtvCsz4vP43G8P5UYN7gnTuDk+4gSCW7GxkIzskjk3e+yh0Mtkv2NZexGBQaFnIEgSBTC6Jh+zXYO/xGJfi0jEw7S14KE87OyDq418j1ciTleHidbkeFoKwC/9zWKj1J05IoLEyL03ncIToDzKFN0TZmOvaQYcHkje660Uj/v/2+XDUCltDBEoXtBhbClGBT891gcOUcOcgVjbramXeN3m3QEaIQwKvgz1NTsdrIr2RvDhtPHjcHWPjoT66HoFHcox2EOL20BKgvoOmENIp99bNdeUhjzsHlYznC7kGo+Mbl5Rf9HsvsR+e++pH5xR/7jpEtUJw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB2054.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(346002)(376002)(39860400002)(396003)(451199018)(36756003)(64756008)(8676002)(66946007)(66446008)(66476007)(66556008)(91956017)(8936002)(41300700001)(76116006)(71200400001)(6486002)(316002)(478600001)(110136005)(6636002)(5660300002)(2906002)(82960400001)(122000001)(38070700005)(86362001)(38100700002)(6512007)(6506007)(186003)(26005)(83380400001)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c0tybDVLY0VITjFONUNpeTZGZVJ6aHErSzBzUDVKL2ZSNldZN2J4b3VHT2M3?=
 =?utf-8?B?V0NEcERIeHFGOWIzS09OdUxoZncxaFZqVGU0NC9ETUJ2eldINk5odDlYMU54?=
 =?utf-8?B?aVY0NmQ4aysxMlc2ekI4WTFQR3pxTHhxOThXN2hNUU1PQndXSTVGWmduRnQ0?=
 =?utf-8?B?SkNQZTF2WFJ1N2U1L3Bhb0pYVDNvRkQ3YkprbnJ0WmxnMm9FYXlTYno4UWl5?=
 =?utf-8?B?NkEyS2hjSFdQbjgvZmQxUEd0K0ltU1J2TXQyb1NYaTk4ODJGNjBQL3krdk12?=
 =?utf-8?B?YldYWE5kK0hubW5MOTEvSGN5UGhRSFNTWWFMT3QzTjdFMU5EVzFkQWpCell2?=
 =?utf-8?B?N0x0VmlKeGtWbWhNdCtCTTNCWk9Wck02YVBFcDRHQWJRYUpwOURUbTUxaC90?=
 =?utf-8?B?TERaUXJsc0ZNOTc5U05obG5TZlFvd3B6c0NPU1ZDMHhWSTUrZ0xvL01BK3g1?=
 =?utf-8?B?QktYV2xSNytvaXJZc1BveDV0STFPUkJHSjBFSVRjbXB6UmgwVXlKTDhXck9t?=
 =?utf-8?B?aTAxWFFwZmR0MlN3UnhFMDNKajZDcXlSUHh2emdyWEFxN2hCcDk3VXJJUHpV?=
 =?utf-8?B?cWh0T09SaFlpdkZyUEZOTkQvbXc3VFhjSG0zZHBrRVdQVVB2UUs2SGpWcmtL?=
 =?utf-8?B?TkV0QytlNjZQeUdQRElpUHRjbmVFZlRkTk1WbVJJT25maHJEckkwaU1TOXVL?=
 =?utf-8?B?RWVOVHVoK01IeTZUNzVDOEJDRUdYQ0s2MXB0dkFPenBxTzZaS1VOSFhQQkRT?=
 =?utf-8?B?VngzbHZSOVV2R0NRWUtzYVAwQ2Juczd1SU9hY3dYUW9PRlRVeElpUkFaZmtl?=
 =?utf-8?B?WFJmSU83RXpPdjVCOE5zWWRuemxzOGllQ0lKRk5ha2IrMnVFT0o4dk95MkZD?=
 =?utf-8?B?a2RGR3pZcFdMQ1QxNnpWamc1VFJEL1FGY3JEWVc0TUZsT1hYOUN4bFpPUVRo?=
 =?utf-8?B?N0VsQ1F6N3ZZM20rN2pkQ1dtdklIVUJLZ0VBZlp1TldYZ0ltaXZ6bWlOYUox?=
 =?utf-8?B?V3NzalcrL0w3eVIrcVI3dStNeWZZeFpucVlMMVdtM08vekdDOThtSGxyQUk0?=
 =?utf-8?B?REE0d0ZkTno2am5yOVgwcWxxVExpUlE3VEZKTXlmYnRHbXlkRGphckVjOW11?=
 =?utf-8?B?Q1VETzBrYUhRMHh1d1NoQXFNL1Zia0ZsMklPKzdaaklEeFdVeHYyQUNOSVZX?=
 =?utf-8?B?bnJFb3NKTUx1OFZsL2MzR20zUEpvVFptV2pWRjQrV0pnb2VleUNZcFJ5T1N3?=
 =?utf-8?B?UXhISzRBcUtxUi8wSHFaS2ptRHB0WnI0OWFyRUhFeExqWktjeDl5OURxNlVM?=
 =?utf-8?B?TEVFdjRtWTRTUTdldTk3RWFzdWY2S09CazY1Ykd0SGZIdVluczlxUVJCdFpU?=
 =?utf-8?B?N3B1ajNrZnFlYlRObmplYW4yZUZvV0ZTYjFBWXZWNWFUQlhOMStmaElsYWRD?=
 =?utf-8?B?WkREUFBlY3R2elUzUXBoaWtPUHFxT0hzYitMMG8wVE9zRWxlcnhmWUxjQlhk?=
 =?utf-8?B?N1hDZnJvTWpPVEU0TUZhQXJkNDk0YTk1MjlXd0x5VDZDTzBSVFZ5VE9LK1Vi?=
 =?utf-8?B?a05UWWlGQWc5T3FaODRMUVpYRHpoQVEvTytJWGdrOFdJV0lCQjk1ODZpNjRo?=
 =?utf-8?B?MllTb0hGUnY1K2JPakI4N1pCSDgxOEVnY0I5Zjk5N2MyTmE4UUhvWnJYdWUv?=
 =?utf-8?B?RjAzN25KNWpaSjFXbEY1VVo1d3dtamNxejZKd1o1dUhMVWRmL1d3a0E3Sytq?=
 =?utf-8?B?d280MkFQcW16UytZOHNPVnNKc2w4TWkrTW9TcGsyeFMyOE5LZml0R2hobEFw?=
 =?utf-8?B?WmVWY1puMmRXd0FGcVJPWXA3SnlIL0Fsbk4zS2tISmxXZlNkdGpxWnpyUEcz?=
 =?utf-8?B?MTFqcUdERFoxSkhkcjRsQ0R3dDY3Uyt2QWlWcHhpRmhydXRJVXlOdmhnRHZD?=
 =?utf-8?B?dHNDSnVrZCtmOFRDNllrTHZUK0lhYkdaT3JRZjZpNkRkaUcxNnVKQy9odlNv?=
 =?utf-8?B?UmxSTjZ6bHF1Z0wyeGU4YURZZy83eHkxWkp1U3hKd2gvdWVkbXR2dC9Dc1R6?=
 =?utf-8?B?QXlKUk4xR21xTSsySDBabkhCZjRSSzV2WmNremVOMU9xeTZMUkhSUDRYTW5k?=
 =?utf-8?B?MndhaVhud2lPNTE5UkNvNERqS1A5ZlFCU0R6ZVQvOU1mRlZXRVZIcURxUjdv?=
 =?utf-8?B?V2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5190CAB7EC60D2419E7184CEC4184333@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB2054.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dca29de-3a3f-4dd7-a178-08db2c7c436d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2023 15:27:22.1257 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DTsm9qGIwULkKCY4LeGikVSi+AL7SoXXNr52ldxyV6URrXYVJ/Xz71S1zesfbckw23T1snRJHPKTMV304KoOog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7803
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH v3 1/2] drm/xe/uapi: Use hw prefix for
 hardware engines
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

T24gV2VkLCAyMDIzLTAzLTIyIGF0IDE5OjU4IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBUbyBtYWtlIHRoZSBkaWZmZXJlbmNlIGNsZWFyIGJldHdlZW4gdXNlciBlbmdpbmVzIChleGVj
dXRpb24gcXVldWUpIGFuZA0KPiBoYXJkd2FyZSBlbmdpbmVzIChwaHlzaWNhbCBwYXJ0IG9mIEdQ
VSkgcHJlZml4IGFsbCBoYXJkd2FyZSBlbmdpbmUNCj4gcmVmZXJlbmNlcyB3aXRoICdodycuDQo+
IA0KDQpSZXZpZXdlZC1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRl
bC5jb20+DQoNCj4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBp
bnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2VuZ2luZS5jICAgICAg
ICAgIHwgMTIgKysrKysrLS0tLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYyAg
ICAgICAgICAgfCAxMiArKysrKystLS0tLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV93YWl0
X3VzZXJfZmVuY2UuYyB8ICA4ICsrKystLS0tDQo+ICBpbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5o
ICAgICAgICAgICAgICAgfCAgOCArKysrLS0tLQ0KPiAgNCBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNl
cnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZW5naW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZW5naW5lLmMNCj4g
aW5kZXggYTRmYzVhZmRmNjg4Li45ODM0NzI4YmIzMDUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9lbmdpbmUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZW5n
aW5lLmMNCj4gQEAgLTQwMSw3ICs0MDEsNyBAQCBzdGF0aWMgY29uc3QgZW51bSB4ZV9lbmdpbmVf
Y2xhc3MgdXNlcl90b194ZV9lbmdpbmVfY2xhc3NbXSA9IHsNCj4gIA0KPiAgc3RhdGljIHN0cnVj
dCB4ZV9od19lbmdpbmUgKg0KPiAgZmluZF9od19lbmdpbmUoc3RydWN0IHhlX2RldmljZSAqeGUs
DQo+IC0JICAgICAgIHN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlIGVjaSkNCj4g
KwkgICAgICAgc3RydWN0IGRybV94ZV9od19lbmdpbmVfY2xhc3NfaW5zdGFuY2UgZWNpKQ0KPiAg
ew0KPiAgCXUzMiBpZHg7DQo+ICANCj4gQEAgLTQyMCw3ICs0MjAsNyBAQCBmaW5kX2h3X2VuZ2lu
ZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwNCj4gIH0NCj4gIA0KPiAgc3RhdGljIHUzMiBiaW5kX2Vu
Z2luZV9sb2dpY2FsX21hc2soc3RydWN0IHhlX2RldmljZSAqeGUsIHN0cnVjdCB4ZV9ndCAqZ3Qs
DQo+IC0JCQkJICAgIHN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICplY2ksDQo+
ICsJCQkJICAgIHN0cnVjdCBkcm1feGVfaHdfZW5naW5lX2NsYXNzX2luc3RhbmNlICplY2ksDQo+
ICAJCQkJICAgIHUxNiB3aWR0aCwgdTE2IG51bV9wbGFjZW1lbnRzKQ0KPiAgew0KPiAgCXN0cnVj
dCB4ZV9od19lbmdpbmUgKmh3ZTsNCj4gQEAgLTQ0OSw3ICs0NDksNyBAQCBzdGF0aWMgdTMyIGJp
bmRfZW5naW5lX2xvZ2ljYWxfbWFzayhzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0IHhlX2d0
ICpndCwNCj4gIH0NCj4gIA0KPiAgc3RhdGljIHUzMiBjYWxjX3ZhbGlkYXRlX2xvZ2ljYWxfbWFz
ayhzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0IHhlX2d0ICpndCwNCj4gLQkJCQkgICAgICBz
dHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqZWNpLA0KPiArCQkJCSAgICAgIHN0
cnVjdCBkcm1feGVfaHdfZW5naW5lX2NsYXNzX2luc3RhbmNlICplY2ksDQo+ICAJCQkJICAgICAg
dTE2IHdpZHRoLCB1MTYgbnVtX3BsYWNlbWVudHMpDQo+ICB7DQo+ICAJaW50IGxlbiA9IHdpZHRo
ICogbnVtX3BsYWNlbWVudHM7DQo+IEBAIC01MDUsOCArNTA1LDggQEAgaW50IHhlX2VuZ2luZV9j
cmVhdGVfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwNCj4gIAlzdHJ1
Y3QgeGVfZGV2aWNlICp4ZSA9IHRvX3hlX2RldmljZShkZXYpOw0KPiAgCXN0cnVjdCB4ZV9maWxl
ICp4ZWYgPSB0b194ZV9maWxlKGZpbGUpOw0KPiAgCXN0cnVjdCBkcm1feGVfZW5naW5lX2NyZWF0
ZSAqYXJncyA9IGRhdGE7DQo+IC0Jc3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2Ug
ZWNpW1hFX0hXX0VOR0lORV9NQVhfSU5TVEFOQ0VdOw0KPiAtCXN0cnVjdCBkcm1feGVfZW5naW5l
X2NsYXNzX2luc3RhbmNlIF9fdXNlciAqdXNlcl9lY2kgPQ0KPiArCXN0cnVjdCBkcm1feGVfaHdf
ZW5naW5lX2NsYXNzX2luc3RhbmNlIGVjaVtYRV9IV19FTkdJTkVfTUFYX0lOU1RBTkNFXTsNCj4g
KwlzdHJ1Y3QgZHJtX3hlX2h3X2VuZ2luZV9jbGFzc19pbnN0YW5jZSBfX3VzZXIgKnVzZXJfZWNp
ID0NCj4gIAkJdTY0X3RvX3VzZXJfcHRyKGFyZ3MtPmluc3RhbmNlcyk7DQo+ICAJc3RydWN0IHhl
X2h3X2VuZ2luZSAqaHdlOw0KPiAgCXN0cnVjdCB4ZV92bSAqdm0sICptaWdyYXRlX3ZtOw0KPiBA
QCAtNTI1LDcgKzUyNSw3IEBAIGludCB4ZV9lbmdpbmVfY3JlYXRlX2lvY3RsKHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+ICAJCXJldHVybiAtRUlOVkFMOw0KPiAgDQo+ICAJ
ZXJyID0gX19jb3B5X2Zyb21fdXNlcihlY2ksIHVzZXJfZWNpLA0KPiAtCQkJICAgICAgIHNpemVv
ZihzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSkgKg0KPiArCQkJICAgICAgIHNp
emVvZihzdHJ1Y3QgZHJtX3hlX2h3X2VuZ2luZV9jbGFzc19pbnN0YW5jZSkgKg0KPiAgCQkJICAg
ICAgIGxlbik7DQo+ICAJaWYgKFhFX0lPQ1RMX0VSUih4ZSwgZXJyKSkNCj4gIAkJcmV0dXJuIC1F
RkFVTFQ7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jDQo+IGluZGV4IDBmNzA5NDUxNzZmNi4uZmJiYTI0
NWY2M2M0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYw0KPiBAQCAtNDAsMTYgKzQwLDE2IEBA
IHN0YXRpYyBzaXplX3QgY2FsY19od19lbmdpbmVfaW5mb19zaXplKHN0cnVjdCB4ZV9kZXZpY2Ug
KnhlKQ0KPiAgCQkJaSsrOw0KPiAgCQl9DQo+ICANCj4gLQlyZXR1cm4gaSAqIHNpemVvZihzdHJ1
Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSk7DQo+ICsJcmV0dXJuIGkgKiBzaXplb2Yo
c3RydWN0IGRybV94ZV9od19lbmdpbmVfY2xhc3NfaW5zdGFuY2UpOw0KPiAgfQ0KPiAgDQo+IC1z
dGF0aWMgaW50IHF1ZXJ5X2VuZ2luZXMoc3RydWN0IHhlX2RldmljZSAqeGUsDQo+IC0JCQkgc3Ry
dWN0IGRybV94ZV9kZXZpY2VfcXVlcnkgKnF1ZXJ5KQ0KPiArc3RhdGljIGludCBxdWVyeV9od19l
bmdpbmVzKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLA0KPiArCQkJICAgIHN0cnVjdCBkcm1feGVfZGV2
aWNlX3F1ZXJ5ICpxdWVyeSkNCj4gIHsNCj4gIAlzaXplX3Qgc2l6ZSA9IGNhbGNfaHdfZW5naW5l
X2luZm9fc2l6ZSh4ZSk7DQo+IC0Jc3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2Ug
X191c2VyICpxdWVyeV9wdHIgPQ0KPiArCXN0cnVjdCBkcm1feGVfaHdfZW5naW5lX2NsYXNzX2lu
c3RhbmNlIF9fdXNlciAqcXVlcnlfcHRyID0NCj4gIAkJdTY0X3RvX3VzZXJfcHRyKHF1ZXJ5LT5k
YXRhKTsNCj4gLQlzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqaHdfZW5naW5l
X2luZm87DQo+ICsJc3RydWN0IGRybV94ZV9od19lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmh3X2Vu
Z2luZV9pbmZvOw0KPiAgCXN0cnVjdCB4ZV9od19lbmdpbmUgKmh3ZTsNCj4gIAllbnVtIHhlX2h3
X2VuZ2luZV9pZCBpZDsNCj4gIAlzdHJ1Y3QgeGVfZ3QgKmd0Ow0KPiBAQCAtMzU3LDcgKzM1Nyw3
IEBAIHN0YXRpYyBpbnQgcXVlcnlfZ3RfdG9wb2xvZ3koc3RydWN0IHhlX2RldmljZSAqeGUsDQo+
ICANCj4gIHN0YXRpYyBpbnQgKCogY29uc3QgeGVfcXVlcnlfZnVuY3NbXSkoc3RydWN0IHhlX2Rl
dmljZSAqeGUsDQo+ICAJCQkJICAgICAgc3RydWN0IGRybV94ZV9kZXZpY2VfcXVlcnkgKnF1ZXJ5
KSA9IHsNCj4gLQlxdWVyeV9lbmdpbmVzLA0KPiArCXF1ZXJ5X2h3X2VuZ2luZXMsDQo+ICAJcXVl
cnlfbWVtb3J5X3VzYWdlLA0KPiAgCXF1ZXJ5X2NvbmZpZywNCj4gIAlxdWVyeV9ndHMsDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2FpdF91c2VyX2ZlbmNlLmMgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfd2FpdF91c2VyX2ZlbmNlLmMNCj4gaW5kZXggMTVjMmU1YWEwOGQy
Li45OGIxZmZkNGE1M2UgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YWl0
X3VzZXJfZmVuY2UuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2FpdF91c2VyX2Zl
bmNlLmMNCj4gQEAgLTU5LDcgKzU5LDcgQEAgc3RhdGljIGNvbnN0IGVudW0geGVfZW5naW5lX2Ns
YXNzIHVzZXJfdG9feGVfZW5naW5lX2NsYXNzW10gPSB7DQo+ICB9Ow0KPiAgDQo+ICBzdGF0aWMg
aW50IGNoZWNrX2h3X2VuZ2luZXMoc3RydWN0IHhlX2RldmljZSAqeGUsDQo+IC0JCQkgICAgc3Ry
dWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmVjaSwNCj4gKwkJCSAgICBzdHJ1Y3Qg
ZHJtX3hlX2h3X2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqZWNpLA0KPiAgCQkJICAgIGludCBudW1f
ZW5naW5lcykNCj4gIHsNCj4gIAlpbnQgaTsNCj4gQEAgLTkwLDggKzkwLDggQEAgaW50IHhlX3dh
aXRfdXNlcl9mZW5jZV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLA0K
PiAgCXN0cnVjdCB4ZV9kZXZpY2UgKnhlID0gdG9feGVfZGV2aWNlKGRldik7DQo+ICAJREVGSU5F
X1dBSVRfRlVOQyh3X3dhaXQsIHdva2VuX3dha2VfZnVuY3Rpb24pOw0KPiAgCXN0cnVjdCBkcm1f
eGVfd2FpdF91c2VyX2ZlbmNlICphcmdzID0gZGF0YTsNCj4gLQlzdHJ1Y3QgZHJtX3hlX2VuZ2lu
ZV9jbGFzc19pbnN0YW5jZSBlY2lbWEVfSFdfRU5HSU5FX01BWF9JTlNUQU5DRV07DQo+IC0Jc3Ry
dWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgX191c2VyICp1c2VyX2VjaSA9DQo+ICsJ
c3RydWN0IGRybV94ZV9od19lbmdpbmVfY2xhc3NfaW5zdGFuY2UgZWNpW1hFX0hXX0VOR0lORV9N
QVhfSU5TVEFOQ0VdOw0KPiArCXN0cnVjdCBkcm1feGVfaHdfZW5naW5lX2NsYXNzX2luc3RhbmNl
IF9fdXNlciAqdXNlcl9lY2kgPQ0KPiAgCQl1NjRfdG9fdXNlcl9wdHIoYXJncy0+aW5zdGFuY2Vz
KTsNCj4gIAlzdHJ1Y3QgeGVfdm0gKnZtID0gTlVMTDsNCj4gIAl1NjQgYWRkciA9IGFyZ3MtPmFk
ZHI7DQo+IEBAIC0xMjIsNyArMTIyLDcgQEAgaW50IHhlX3dhaXRfdXNlcl9mZW5jZV9pb2N0bChz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLA0KPiAgDQo+ICAJaWYgKCFub19lbmdp
bmVzKSB7DQo+ICAJCWVyciA9IGNvcHlfZnJvbV91c2VyKGVjaSwgdXNlcl9lY2ksDQo+IC0JCQkJ
ICAgICBzaXplb2Yoc3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UpICoNCj4gKwkJ
CQkgICAgIHNpemVvZihzdHJ1Y3QgZHJtX3hlX2h3X2VuZ2luZV9jbGFzc19pbnN0YW5jZSkgKg0K
PiAgCQkJICAgICBhcmdzLT5udW1fZW5naW5lcyk7DQo+ICAJCWlmIChYRV9JT0NUTF9FUlIoeGUs
IGVycikpDQo+ICAJCQlyZXR1cm4gLUVGQVVMVDsNCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFw
aS9kcm0veGVfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+IGluZGV4IDY2MWQ3
OTI5MjEwYy4uODk1OTZkMzUzZDNlIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3hl
X2RybS5oDQo+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gQEAgLTEzNiw3ICsx
MzYsNyBAQCBzdHJ1Y3QgeGVfdXNlcl9leHRlbnNpb24gew0KPiAgI2RlZmluZSBEUk1fSU9DVExf
WEVfV0FJVF9VU0VSX0ZFTkNFCQlEUk1fSU9XUihEUk1fQ09NTUFORF9CQVNFICsgRFJNX1hFX1dB
SVRfVVNFUl9GRU5DRSwgc3RydWN0IGRybV94ZV93YWl0X3VzZXJfZmVuY2UpDQo+ICAjZGVmaW5l
IERSTV9JT0NUTF9YRV9WTV9NQURWSVNFCQkJRFJNX0lPVyggRFJNX0NPTU1BTkRfQkFTRSArIERS
TV9YRV9WTV9NQURWSVNFLCBzdHJ1Y3QgZHJtX3hlX3ZtX21hZHZpc2UpDQo+ICANCj4gLXN0cnVj
dCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlIHsNCj4gK3N0cnVjdCBkcm1feGVfaHdfZW5n
aW5lX2NsYXNzX2luc3RhbmNlIHsNCj4gIAlfX3UxNiBlbmdpbmVfY2xhc3M7DQo+ICANCj4gICNk
ZWZpbmUgRFJNX1hFX0VOR0lORV9DTEFTU19SRU5ERVIJCTANCj4gQEAgLTIzNiw3ICsyMzYsNyBA
QCBzdHJ1Y3QgZHJtX3hlX2RldmljZV9xdWVyeSB7DQo+ICAJLyoqIEBxdWVyeTogVGhlIHR5cGUg
b2YgZGF0YSB0byBxdWVyeSAqLw0KPiAgCV9fdTMyIHF1ZXJ5Ow0KPiAgDQo+IC0jZGVmaW5lIERS
TV9YRV9ERVZJQ0VfUVVFUllfRU5HSU5FUwkwDQo+ICsjZGVmaW5lIERSTV9YRV9ERVZJQ0VfUVVF
UllfSFdfRU5HSU5FUwkwDQo+ICAjZGVmaW5lIERSTV9YRV9ERVZJQ0VfUVVFUllfTUVNX1VTQUdF
CTENCj4gICNkZWZpbmUgRFJNX1hFX0RFVklDRV9RVUVSWV9DT05GSUcJMg0KPiAgI2RlZmluZSBE
Uk1fWEVfREVWSUNFX1FVRVJZX0dUUwkJMw0KPiBAQCAtNTU5LDcgKzU1OSw3IEBAIHN0cnVjdCBk
cm1feGVfZW5naW5lX2NyZWF0ZSB7DQo+ICANCj4gIAkvKioNCj4gIAkgKiBAaW5zdGFuY2VzOiB1
c2VyIHBvaW50ZXIgdG8gYSAyLWQgYXJyYXkgb2Ygc3RydWN0DQo+IC0JICogZHJtX3hlX2VuZ2lu
ZV9jbGFzc19pbnN0YW5jZQ0KPiArCSAqIGRybV94ZV9od19lbmdpbmVfY2xhc3NfaW5zdGFuY2UN
Cj4gIAkgKg0KPiAgCSAqIGxlbmd0aCA9IHdpZHRoIChpKSAqIG51bV9wbGFjZW1lbnRzIChqKQ0K
PiAgCSAqIGluZGV4ID0gaiArIGkgKiB3aWR0aA0KPiBAQCAtNzMzLDcgKzczMyw3IEBAIHN0cnVj
dCBkcm1feGVfd2FpdF91c2VyX2ZlbmNlIHsNCj4gIAkgKi8NCj4gIAlfX3U2NCBudW1fZW5naW5l
czsNCj4gIAkvKioNCj4gLQkgKiBAaW5zdGFuY2VzOiB1c2VyIHBvaW50ZXIgdG8gYXJyYXkgb2Yg
ZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSB0bw0KPiArCSAqIEBpbnN0YW5jZXM6IHVzZXIg
cG9pbnRlciB0byBhcnJheSBvZiBkcm1feGVfaHdfZW5naW5lX2NsYXNzX2luc3RhbmNlIHRvDQo+
ICAJICogd2FpdCBvbiwgbXVzdCBiZSBOVUxMIHdoZW4gRFJNX1hFX1VGRU5DRV9XQUlUX1NPRlRf
T1Agc2V0DQo+ICAJICovDQo+ICAJX191NjQgaW5zdGFuY2VzOw0KDQo=
