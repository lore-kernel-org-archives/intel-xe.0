Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E2FEB64DB
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 11:11:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC6210E4C8;
	Thu, 15 Jun 2023 11:11:10 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D973E10E4C8
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 11:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686827468; x=1718363468;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8LfjotqTLwBZ0zujbUudU6amkEkUf/SRrlIcfXC/a7s=;
 b=eBFR6ahTcbBXM91jPCtvcKe1oUZ9k9xyh6ylI/Y4br6bbSapNSeoVvRT
 TwvtSBDRJcZHuSAT+oysJI6oZS0/NAFYIKrU+WqOnppEa0r/X15rgb6SP
 HKpfUlNWEuZHsYNFjaRMm+qH+GYZMjxEe1p0jjQ4CXfzPdTVafJgX8Ek/
 mZHE6zg4j7/s+KNWVKVWpB3wZ5tOijJ2rn4pcvFACCGm5jfg+YWTvIacD
 xxfLdlTOxUqtJmrzft2KqDozvHi4MhihmjJzksgqI2s2C24Uu6c7nZ7rV
 X0/CHhoX+hplg9njl4tf1F699vWwOczqK274EvLgcL9Vu98MLM1mF/6yH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="339227778"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; d="scan'208";a="339227778"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 04:11:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="836570806"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; d="scan'208";a="836570806"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 15 Jun 2023 04:10:59 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 15 Jun 2023 04:10:59 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 15 Jun 2023 04:10:59 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 15 Jun 2023 04:10:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDFgWBM5w+azffV5I6CpVei6WTqFm7L3+1+oM1brDl69WWRlWIMslMngVXY6WFcXaDBTS6NY7hDaKol4XwDza/NmYnSoLfj1Lzt7U8QWgYtxeZW7m3JKpmvdbDmaCWUl8YeSdr/+8jYHRmzwgJsI1c31Z+8km3/sNEu5afduejfV682pKrlwKAZTtIU9hwcC45BWbXy+Uo3OiYY4/pSc38yee3hcfZ9qqvAY4/SAm89Jtlt9bVYZ+dPl15TwXZwoYTIyigx/hiYS1okLR9yKqpVGIABlFP5aEHbWeQjfgNbYQMS83jJlElaPrmrhHN5mzW5jz9QaMkWBKc0lhYL9RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LfjotqTLwBZ0zujbUudU6amkEkUf/SRrlIcfXC/a7s=;
 b=YHQLWI1yTTZcQrgA1AceFUQgi6Oh3AEOueGSjkwfwhx7Xcp1yn3eaXxGw0PfczBWWiLWXiwgfRRCorHrz2JLzEs8vIUKsZg0qf9/yEQg1Ez7wXHz+E37+Y6jHo9V6XrEKcoNt3MBHVQK+uy6EV70da+vSW3l/xXeu7wnqqhsGZhV04K1eCnKRxEmZVm/+dOdfcfhPwwN7PzEDPXKULAr2ujG7AGSvNNI4mq6inYsoczKzzqXfC+l99oLrlTwHnOutJZGDyPhgFrVxQ0e6zzZ/paYicdpiIMIqXG5lcuGu539Z21SvdTmmV0cWj7Cp1Nog0GzzveK7Bjt+MnycZ8jDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 IA1PR11MB6442.namprd11.prod.outlook.com (2603:10b6:208:3a9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Thu, 15 Jun
 2023 11:10:55 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::5671:364e:5c39:3284]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::5671:364e:5c39:3284%4]) with mapi id 15.20.6455.037; Thu, 15 Jun 2023
 11:10:56 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH] drm/xe/display: Append dma_buf fences to
 framebuffer fences
Thread-Index: AQHZmLRaDYhIF3zNiUiaPnFAyjDnzq+Lwftw
Date: Thu, 15 Jun 2023 11:10:55 +0000
Message-ID: <DM4PR11MB6360A0F1846E78E51FE0A2D0F45BA@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20230606201959.94128-1-jose.souza@intel.com>
In-Reply-To: <20230606201959.94128-1-jose.souza@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|IA1PR11MB6442:EE_
x-ms-office365-filtering-correlation-id: d9d52927-936b-4b52-3043-08db6d9130b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2+Ewjatd2afKqrIPE4bhGnqHO7ZlUFpRE/mvbaPzDXJxXFpzwkudsfJ207A1AT14e64vD6ebUIT0PUIcbVqWc3GwJNiF83BbmcGp3DBh7hPZ2W/1EYGMZirgWiD4Aob824Dy1J02fOprMQupnZcVoJCBQmFuvmS5FVjQk5Ke/68bZ4ChtGbWRtuGiYh6cfWWUtUxA1WdcTRb1Ml/k7iFlY26iQH/ed6YqnhG4ec9xChXgaXH9hLWWHe2mp8OJrRAi4SR9GP5RrysGa+WSqPyk9YOK0jWB6eWNzit9+61JcfPr7lUvylSMDQS8loOzY7U9RTPDjQtWJZMNIqCEFjFYodxmozSVjxAoDvvj06sdtHOHrgtE5nupu822wDcEhh2fxNX2bpKQcKRZ0SfjqPhgFIocaicXoLrMWgMzz/aRnZgYtmTQH0vXDl44/8BkjNLDAUg492BqHNX8LPpa8Jj588Mq27igGRS+3zr/JF7AQpyDLcj++qVJocbQK/PSN4p4+pyzYaLo8A0WxylEOmGbD9v5TFFzq5FTp4oosfGbfN/jpGtWrHcMkhN02Wb30Hp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(39860400002)(396003)(136003)(376002)(451199021)(5660300002)(83380400001)(52536014)(186003)(55016003)(6506007)(2906002)(966005)(41300700001)(8936002)(9686003)(7696005)(26005)(8676002)(316002)(122000001)(110136005)(38070700005)(33656002)(53546011)(478600001)(82960400001)(4326008)(76116006)(66556008)(66476007)(86362001)(38100700002)(66946007)(66446008)(64756008)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WURIK1hkR0d0a2RSUmRkMU9RZDZvaEhaTFBzTEZsa0NyZVpJMzEvRmdVVmlj?=
 =?utf-8?B?ZW00WnRsSlc5dzRvdVZER0Z0bU8vcUwyQWl5aDZ6cEJaMmVoRWJSazFmOHla?=
 =?utf-8?B?MHNFRm5objNHSkhqT25iOG9JMG5IQy9SQURGc2daWGprRGJOakFLOVpFVXQy?=
 =?utf-8?B?U1EyNlhOMzdLWUNEd2FEc0dITmVRcXRxdWI1QlRMelVHeWtnc3RZVnhmbnRp?=
 =?utf-8?B?SFN4eld6VGRQZGNQbzkwUjF2SFRXUGYzYUJtTjRKeU1Ob3BySTZrL1lCeW44?=
 =?utf-8?B?NklTcHFkRzVESEVOVXBvY0c3NmtGalpkYnhQMU05U2dZOEF3Yk9NNG5YM0dK?=
 =?utf-8?B?NnBTMzVTQ2R6Y1I5bHY0a3BCQ2JqSDZNbExoTjVveHFNK09ndDBZejUyU2Rl?=
 =?utf-8?B?OWdFSmFLU3M2ak14dXVQay9LTk90bE1pQXlqTm1mdW1tc08veU1RRlB2OWc2?=
 =?utf-8?B?Z2hvRzdaQnN4eXc1WG92Z2RFSnlNOS9pdzduS0JGa2ZuajNJZWJWZmlUK1BQ?=
 =?utf-8?B?N0JKa2ExcDJYQnVOdDl5cFhiV3EyOGJaQUQ4ZXk5cjc5a24rbld2WTVGNjRL?=
 =?utf-8?B?dE1mMktSUDlnOEg0cnZmMTB5V2J0QmZFRERibFlqK0JTNmFMMWdCcXcrR0N5?=
 =?utf-8?B?N2VUNVE1SzltLzFhZW45clJmRUEwUHJ2V0M1NjVHNFF4dkprcVJiR05WaFZP?=
 =?utf-8?B?Z083R21sbFhWbnZyMTZuV3pkQVNkempWY21nQ1VCdVdkWlg3c2xqc1lPSHhW?=
 =?utf-8?B?U2gwSzNlNFg3NDVmL0JQckZOVWFSUDA4YStQREI4bUJxZC8wZldNbUJaR0ND?=
 =?utf-8?B?SU1MUGhkdmNXaThqOXVSem8xR1pnOCtoZFRFdDR4Sm1HeHJTN0IwcGhJUDBK?=
 =?utf-8?B?Ylh5OXYvNTY0RVpuWGlwOXNUYnFpNlNYTUVOZFJWUFdHUCs0RHFobnRkNmtD?=
 =?utf-8?B?b05aTkZvaTFmK1lHK2FrWG45c2h6dWxVZHRrcVRYRzJQME50OTVocXNPSXlY?=
 =?utf-8?B?QnEveXFKOEFmaUw1Szg2UzkxbjhGa3gxeGt4b1BiKzRhNUswSlpNeUpITEtw?=
 =?utf-8?B?L0xOVm83SU9LSGUzeHVwU1c2Q015dWl4aitIYlVpejNHRUFGcTFPVEtlNXJY?=
 =?utf-8?B?UXMyTzlJeFFPWFNnaGRQdnk2TkloaVkzUkIvR09VMzNQOXJZam0rNG5uWGJT?=
 =?utf-8?B?alRuYXkxVW9WSjV0QnRaTU1LN2dNZ0hkaVdiZXVBTGdUdmpGaUZScDF5YXVq?=
 =?utf-8?B?a1JFaDdzck9rVGZWVzFYOGt2VnZPSFh0dUIxSUw0Vmcxa2dmUlFDdHZqMDdi?=
 =?utf-8?B?TFVrSlNEaFVNa1ZWWDkvbGZVY09nYlAxS2ZQaGtWWFRYVTJ5VGdsVlE5c2dO?=
 =?utf-8?B?ZklScWFBdVF3c3c0eGhhdFA1cXpIUEhtZWlyNUlhcU05VXJaOG5OZ2dKdnVU?=
 =?utf-8?B?cjZ0WDNZZWxKRy9TYmVvc2tyemNPUkhQSlJ0VklrdS9qN1NpTW1ZUU9qaWxF?=
 =?utf-8?B?eUtrc3hJaEo0WXRNN0JCY2NzQ29NUDZnYWVnRzRIeUNMTTJITUFZMmxUYi9N?=
 =?utf-8?B?NVdySEd5WCtqMm0rTEhQcjF0QUJaczYrQ2s2VDlGdWZJajNLZG5laTk1Z25v?=
 =?utf-8?B?NzR4aDhFY1dhSXQyNmlEbkI2cm5pWE1tczE3YTNUTGFXbWkrMEhzVjFyTEIw?=
 =?utf-8?B?TTdNcXFPMjJrTnFGMHljcU5tSU5wOTdqcWJrTTJtSUZMa0l6WFJPdGJCdCtv?=
 =?utf-8?B?dGI2MTgyN2Z6ZmUwVThWZjBJaUU3Y1drbWN3a1ZCRmw5S01WUC83QzNJZUdT?=
 =?utf-8?B?dGtWZTE3YW9tOTIxc2RZbTFrYlA1bmQxOTFUc05OUzZqcE84d1p6bC9QRnUw?=
 =?utf-8?B?ZE8zRnk5SXJHY1VkejV3NTdBcktpNHoweE91QnpmUG0zS0E4WWU1NXAzT0lv?=
 =?utf-8?B?RUhQZlI5NFVoREFGYVhCWXZpa3Ayc2lYc2lab3pDaDF3aWV1cFlpOVI2SkxF?=
 =?utf-8?B?dlhpMFk3MkVGbUxhSkxDZE5FVmtLQjZBa0djSTlGV1B6SE95dnhkZlYyamtC?=
 =?utf-8?B?cjRrMEUvVE1lVW42NGdYSUtydGJRM0xHSU05TjJDOTFhbVNUT25xL0JXYnkr?=
 =?utf-8?Q?psuwWMvk1ExPP8ikZvv3KXOxA?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9d52927-936b-4b52-3043-08db6d9130b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2023 11:10:55.8002 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VydwpF4Vu2bT4PsMxSv1nsCa+fw/crvwrtTOQM5YfItHkiwByvWHleyx/57Fs5HxGFTJ6j3vJL0Dn5tZjJqCKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6442
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/display: Append dma_buf fences to
 framebuffer fences
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
Cc: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgSm9zw6kgUm9i
ZXJ0bw0KPiBkZSBTb3V6YQ0KPiBTZW50OiBXZWRuZXNkYXksIEp1bmUgNywgMjAyMyAxOjUwIEFN
DQo+IFRvOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogW0ludGVs
LXhlXSBbUEFUQ0hdIGRybS94ZS9kaXNwbGF5OiBBcHBlbmQgZG1hX2J1ZiBmZW5jZXMgdG8gZnJh
bWVidWZmZXINCj4gZmVuY2VzDQo+IA0KPiBUaGlzIGlzIHJlcXVpcmVkIHRvIGNvbXBseSB3aXRo
IEtNUyBwYWdlIGZsaXAgcmVxdWlyZW1lbnRzLCBhbmQgaXQgaXMgdGhlIG9ubHkgd2F5IHRvDQo+
IHN5bmNocm9uaXplIGZyYW1lYnVmZmVyIHNjYW5vdXRzIGluIFhlIEtNRC4NCj4gDQo+IFVNRHMg
YXJlIGV4cGVjdGVkIHRvIGF0dGFjaCBhIHN5bmNvYmogdGhhdCB3aWxsIGJlIHNpZ25hbGVkIGF0
IHRoZSBlbmQgb2YgdGhlIEdQVQ0KPiBqb2IgdGhhdCBpcyByZW5kZXJpbmcgaW4gdGhlIGZyYW1l
YnVmZmVyLg0KPiBUaGlzIHdheSwgdGhlIGNvbXBvc2l0b3IgY2FuIHNlbmQgam9icyB0byB0aGUg
R1BVIHRvIHJlbmRlciB0aGUgZnJhbWVidWZmZXIgYW5kDQo+IHdpdGhvdXQgaGF2aW5nIHRvIHdh
aXQgZm9yIGl0IHRvIGNvbXBsZXRlLCBxdWV1ZSB0aGUgcGFnZSBmbGlwIGluIEtNUy4NCj4gDQo+
IFRoaXMgZml4ZXMgZGlzcGxheSBnbGl0Y2hlcy4NCg0KTG9va3MgR29vZCB0byBtZS4NClJldmll
d2VkLWJ5OiBVbWEgU2hhbmthciA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPg0KDQpAVmlsbGU6IENh
biB5b3UgYWxzbyBjaGVjayB0aGlzIG9uY2UgYW5kIGNvbmZpcm0uDQoNClJlZ2FyZHMsDQpVbWEg
U2hhbmthcg0KDQo+IExpbms6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL21l
c2EvLS9pc3N1ZXMvODkyMw0KPiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXph
IDxqb3NlLnNvdXphQGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2F0b21pY19wbGFuZS5jIHwgMTMgKysrKysrKysrKysrLQ0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2F0b21pY19wbGFuZS5jDQo+
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hdG9taWNfcGxhbmUuYw0KPiBp
bmRleCBiNzU2NTYxZjA4YmQxLi5hM2YzMGEzMTllNGMwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2F0b21pY19wbGFuZS5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYXRvbWljX3BsYW5lLmMNCj4gQEAgLTMyLDYg
KzMyLDcgQEANCj4gICAqLw0KPiANCj4gICNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxwZXIu
aD4NCj4gKyNpbmNsdWRlIDxkcm0vZHJtX2dlbV9hdG9taWNfaGVscGVyLmg+DQo+ICAjaW5jbHVk
ZSA8ZHJtL2RybV9ibGVuZC5oPg0KPiAgI2luY2x1ZGUgPGRybS9kcm1fZm91cmNjLmg+DQo+IA0K
PiBAQCAtMTEyMCwxMCArMTEyMSwyMCBAQCBpbnRlbF9wcmVwYXJlX3BsYW5lX2ZiKHN0cnVjdCBk
cm1fcGxhbmUgKl9wbGFuZSwNCj4gDQo+ICAJcmV0dXJuIHJldDsNCj4gICNlbHNlDQo+ICsJaW50
IHJldDsNCj4gKw0KPiAgCWlmICghaW50ZWxfZmJfb2JqKG5ld19wbGFuZV9zdGF0ZS0+aHcuZmIp
KQ0KPiAgCQlyZXR1cm4gMDsNCj4gDQo+IC0JcmV0dXJuIGludGVsX3BsYW5lX3Bpbl9mYihuZXdf
cGxhbmVfc3RhdGUpOw0KPiArCXJldCA9IGludGVsX3BsYW5lX3Bpbl9mYihuZXdfcGxhbmVfc3Rh
dGUpOw0KPiArCWlmIChyZXQpDQo+ICsJCXJldHVybiByZXQ7DQo+ICsNCj4gKwlyZXQgPSBkcm1f
Z2VtX3BsYW5lX2hlbHBlcl9wcmVwYXJlX2ZiKF9wbGFuZSwgX25ld19wbGFuZV9zdGF0ZSk7DQo+
ICsJaWYgKHJldCkNCj4gKwkJaW50ZWxfcGxhbmVfdW5waW5fZmIobmV3X3BsYW5lX3N0YXRlKTsN
Cj4gKw0KPiArCXJldHVybiByZXQ7DQo+ICAjZW5kaWYNCj4gIH0NCj4gDQo+IC0tDQo+IDIuNDEu
MA0KDQo=
