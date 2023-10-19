Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E20E7CDB483
	for <intel-xe@archiver.kernel.org>; Thu, 19 Oct 2023 12:55:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E0110E4CF;
	Thu, 19 Oct 2023 12:55:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2012410E4D0
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Oct 2023 12:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697720135; x=1729256135;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Cmw+FCa317VQHjGhe5o6je/JLk0mldaicpJeFVGA81I=;
 b=gizNwtxxJOXn+4mrYpj9z4X/V3KwBjp1M8vAowMfDuG0IhAZBsNaNxiS
 IBMlI5DexQLPx9Yxyh3Xqwyujyh9qbi9cB2kCDFfVlVcRrGPIdCKX2HTb
 0CdK6foFhZ3LoWTFBRX02NrKd9yf/BguXmR0j3ceL5op6RcXqjr3PxQ24
 VvZClmG70X0GTjgAERXveFgpDH4B7EC/zijDnsxLRz216KJKMXQVLFXC2
 vzXhDX1GEF66cU72o9el+etFeUrMt6aRM4Yj+3DhmPzCWdkH7GpzA3sUn
 IeQ34wqDPZ+aR4lj615gx18vYVy/e6GtTls6J8k0aJUuAeWmzAsY/Ujm2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="417352568"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; d="scan'208";a="417352568"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 05:55:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="1004220774"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; d="scan'208";a="1004220774"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Oct 2023 05:55:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 05:55:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 19 Oct 2023 05:55:33 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 19 Oct 2023 05:55:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lTC2T3TWQ+kX8iMw40vBt/mwKnpNcGRYId0LKfUporydoYEHBq0kUO/WrUlhIbDcyIduBjqt78QWkmNTCot9PKPcvnL7RnZIgb/a8+XJznHmXbpeefrwg9FQoNymlSw/A3ydQ9y3ARpn9h9z39sb0MT/YZH9SmRx6+HTTvzgyC8nJyBTXEI4NNX6HH/QNtSPC0/ZJhgDXY+GyP07uOoVh+RPPxzfNUvAClQB8dG9ctHWqXxPctS+WK8re1pOCMkUbOxVhIOnys6xvGU/reabhyFBvs8p2pDygyr0eK8woTJw4+XfHD8nz30bjw9D1Erp4hzSlQ4tlgnp/U7Ya3QecA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cmw+FCa317VQHjGhe5o6je/JLk0mldaicpJeFVGA81I=;
 b=W3RB645EIbeUEUZBloJPAh2ScIuihBqTAWdUnBxCTkGtEEVsbk66BIwPAFvg7BLFLFrRsD/lXIs/sFdK8Y8UlT2r4g6z70WKfydkBOVbpKRx3X7CByovDxUh45TgYuiK7+fCVzb6GeAu2iKtdhQdT+HqW+FjXPYI816+Hhl8nLvUGT+hAlkzYGnIkVh2VDwhiM0mWImNCLHZXi3lvQmMqDt+t8r11ZQbY8hDFttwy7cD7248i9i78iOkQ8OhTaxUmwTe9PELaDlqd9phAo1R6YXUHctF2t/ZUlwv/7P5dY/kA/u3jdUsPc3p6YlWcYnfrEfatR5IxI2+EG5Q2LmfvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SJ2PR11MB7620.namprd11.prod.outlook.com (2603:10b6:a03:4d1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.41; Thu, 19 Oct
 2023 12:55:31 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::94b:839a:3fa0:e539]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::94b:839a:3fa0:e539%3]) with mapi id 15.20.6886.034; Thu, 19 Oct 2023
 12:55:31 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Winiarski, Michal"
 <michal.winiarski@intel.com>
Thread-Topic: [Intel-xe] [PATCH 2/3] drm/i915: Fix uninitialized variable
 warning
Thread-Index: AQHaAbqBflX3PffED0auEKeWgOK2JrBPxBUAgAFOizA=
Date: Thu, 19 Oct 2023 12:55:31 +0000
Message-ID: <SJ1PR11MB62040EC516A09B0979C70AD881D4A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20231018115826.3908905-1-michal.winiarski@intel.com>
 <20231018115826.3908905-3-michal.winiarski@intel.com>
 <hei43mlosgjrz6s6zrzsi73haxndlwm2s46uxy2sv5be76xroc@c33rolrzaulg>
In-Reply-To: <hei43mlosgjrz6s6zrzsi73haxndlwm2s46uxy2sv5be76xroc@c33rolrzaulg>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SJ2PR11MB7620:EE_
x-ms-office365-filtering-correlation-id: c7899b1c-3e9e-441e-f4b0-08dbd0a2ad42
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PfLsT+GogZ72APqSFZZquflAaCwF9JgMTtlXXuUBprielVGmCPJnjGUcKWJF7/o0ijmo8ztSkNBZRnoRyh0vIlA7UCYqeoMFz6ZnkZ8W+E9EnEGccImfCaDssTUBXFBhYpV6VmuwEM2mxRnCMJbWIt0Uu6KFY8awKJcEreDeV+UyHISlPAz1Dza9hNEht3pt/3y98ZSTHvT6PNZuJ6V+cvPEluoXSZZmXoG8gGy5dLGscWwwL8C+Hh5CbvaC6rcEZFQUJp0ekJdceuK4ze93cb5x5hTj6kXiOMpkKI9bZcCPpAXwYlFdKSGcWfS3fV1rEZ6vGZWN7lYiVqm3lDOHfswU95S+FaEY61/8QLf+MDQ8KIhEVvl42Uf0WmW5bbvFUwMKdA7XqlKBCdS06z2FvIZL2KGbh06xBYCrAdFnlfMQyLZNfbhO+h04qVftu0yZqQvfCywmPIEOu0iYVPdjiHAYmjr3xZZ8rdrOjfqBjTumoHIfelUvtc1a8ZmnFIkLH9jPnY2AnAxG9u7SyHmUoaIQnrNH4K5SoyJDBsDQInA96+PSAkJIILFQIXNgMEGF9zw+GDf7cMwn8ZjNs+CcZn0s07Cmc9iAXDvwXyZPtEWRU2zxVvqSNsy87XLXpivF
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(346002)(396003)(136003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(55016003)(86362001)(38100700002)(6506007)(7696005)(41300700001)(5660300002)(4326008)(52536014)(2906002)(83380400001)(9686003)(82960400001)(122000001)(53546011)(38070700005)(71200400001)(33656002)(8676002)(478600001)(8936002)(110136005)(66446008)(66946007)(76116006)(66476007)(316002)(6636002)(66556008)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WEJkUUN6azlFdFByeTBnRU5LVDV6cGxZR2ZrcFU3UnBRZ0RZUjRmYWE3MFg3?=
 =?utf-8?B?M2VnRlZjVlNORkk3Y05hMlB2bGFuWkRSZ3QzK3Z6Nk1NREZIdFJyZDJ5Wm5v?=
 =?utf-8?B?SDRRVlg0Q3lTaWxHWVUrUEJoMm45eFJkNldrNnEwYWptRjJ6dTkxbXVRcnhz?=
 =?utf-8?B?dGdlUXNXL1VmbHNpWUdHcnpRaUZUdmhFSzMwVk03OVFzRTJ2OGxQQVRhYkZU?=
 =?utf-8?B?WEhYaG5LenhxVkZXNW15dDU0RXdIOE91WlFZcENreFltaUJJU04rSjhpTWh1?=
 =?utf-8?B?NHZOU0pDSzExdys3YndRUURvYmgyWEZWeTZVWnVGbThhaElMVTl0eVpDK0xi?=
 =?utf-8?B?d2ZaeFR1QmVuZzR5cVU5VUs2N05VSERvaERNbHBWUU1XMk8yUGVpWW0zUkEy?=
 =?utf-8?B?Vk1iZjVqTTQ2bkRqTlU0TEJMZi9LbVV1MnhURkJCUG1kaGwxS3drSGVGSks5?=
 =?utf-8?B?QXNEejZrVHczaDRHcmkzUnRqQ21BMU93UlFFamRZUmxKM1ErcjJHbUgyKy9T?=
 =?utf-8?B?eUFwSW16OTNTaVRacU1Ib1JRRDVYS21SQW5CR08xcnQ0cjJDdmhZdG9xazRv?=
 =?utf-8?B?c2g0RU5vdW42YnpySUpXNDZmd29vanVTS24rc1FTZUoycFQvUkZsK25jelU1?=
 =?utf-8?B?bVpZeXdJNzhvbHJRNkIzQUJOWm5sQXdJMXp0WDRBYU0zWWllalMyOFFXZ3dB?=
 =?utf-8?B?S25sR29MQ1MvcHNQMDNDV3lSaHZKR2IwZmlOT3dLNnBXT0c0WXphWjNyR0pp?=
 =?utf-8?B?SFBteml5bEVqRDRzTTRxbHhxb2tvQnUxZlE3c1ZqYS9OUlBueVlwVFh6UUtE?=
 =?utf-8?B?QVM5MmtlbFEwRWUvWnQ0dU1tUXVQc3VIZG9XQm5RMElsMEUzUnNRMXBuWjgw?=
 =?utf-8?B?NEhpWkV0RHYrK1dtdzk1S0diNG55ajFVWDRIUUM2K29QQ2h3WitaSTF2cldB?=
 =?utf-8?B?YWk1ZDNvOVFhcHBlZC9YMnFNK0QwMEduQ0ZCZHZWd2Rvb0JNempqZm5MWXdq?=
 =?utf-8?B?MjlNVGlPeldCQWc4eG1xdVJoNFNCUHZEN1NUa0NzTG1Xb2t1U0o5WDZ1Nnht?=
 =?utf-8?B?dS83Zi9QYTdZRlNvNW0yRlJLSTZkY2NLZVhwRzNHMzZjU1pFc2dsRlNTT24v?=
 =?utf-8?B?ak9EcUxxQXdDeGpBZmpuN0ZSS0loTFhyMDlmYkc0ZmFDZU5YRGJqd210UERN?=
 =?utf-8?B?TG85T0IwcTl6L1ZBc2VRUmhBS2JFb05RRW5lK0cvemw4YzJQcWdFWTE5aEpl?=
 =?utf-8?B?U01RNFVVT3VReVVLNVo2S2VleGRTY1dUR1BXbzJOR2xNVkhlR2k5ZW9wMitW?=
 =?utf-8?B?cWR2elcyL3lJUU5TQXhlSE9MSWMzTnRLVTk0WjNoS3lEYmJLeC9tNjJtTmtC?=
 =?utf-8?B?L3RrUUlZV05kcmQ4a3dicnpPcVAzYU11dXNQdkEwZjdBT3YyR21ibkNsaUhH?=
 =?utf-8?B?Vlo4VGlLa1dYcXpYa2ZXMFJ2azlTYmxNUE1Rb05QV05KZnhDQllhcm9rQzM0?=
 =?utf-8?B?Vk45dFM1TEJVL0thQi9uR1FPUzNQUC9iOTV2TkltSmU4Q1l3L2lJaURDOTFT?=
 =?utf-8?B?dmJ2YzhwSVNhQTMzUEJIVlJPTGgweHpQWEtTSjdiTEhnS013UVQzZEludU1n?=
 =?utf-8?B?a3V0aHdOajhOdzN1Y0JTSXRWbkp0NFloS1EydURlbXBnSGtDTlJWR1p5SStI?=
 =?utf-8?B?ZDdzU3d2MktoNzFuVFJwekYrdFFzZWUzNmYxRnNqc0NmVUlMZzZYdEIweVpL?=
 =?utf-8?B?cmJVV0p3L2JJZ3dieThVVWtLSUVLMExpQVloT0tFeFFNbmY2WU1GYWJ3a09S?=
 =?utf-8?B?cVF0UU1RSlc1dWxsUzN5SngwWGdnNHpZblhvd1hsSzdlUzJOb28rbXZoTkR3?=
 =?utf-8?B?TWU0UUJuTmxBTHpidUttZ0ErREV5OGRia1hvZXlVaURTWEdHRkUyalR1TFlX?=
 =?utf-8?B?RkRLR1hFbmpkZFhlMEQ5cDZmN2Uwa3liUkJaL2MyUkJSckpWemtvUER6MVdD?=
 =?utf-8?B?a3pxeks0YktiMWUzOXpCQVUvWjNNY2RnNG9DVjhkSXBybkF5clczOTI0cnlX?=
 =?utf-8?B?aWs1N1I2T1QwSEl4QjFsT2Y2aG1IQTV5NGMwN2dEaWNJYVhFdjhzMFpxZDAr?=
 =?utf-8?B?akx0UmdUWFV1N3NRVUtTaFE1RWNSMnp0OWVtOS9ycVQ2ZFhCR3RWMTB0Vkht?=
 =?utf-8?Q?tGIOAZsUsGOyyFWrTY6r9RyAwfXpjtTGxc0/FAr4UOzv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7899b1c-3e9e-441e-f4b0-08dbd0a2ad42
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2023 12:55:31.3173 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bKyZDIwA1eFieai28wxuufw44vYXqqrw/ZwxK6z4i3F74Cbs0BZ5qtvJQQa5zt36jygWFUw2zprCa0aaSdngcrld/L2yumTIwszKk3dKJNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7620
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/i915: Fix uninitialized variable
 warning
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgTHVjYXMNCj4g
RGUgTWFyY2hpDQo+IFNlbnQ6IFdlZG5lc2RheSwgT2N0b2JlciAxOCwgMjAyMyAxMDoyNSBQTQ0K
PiBUbzogV2luaWFyc2tpLCBNaWNoYWwgPG1pY2hhbC53aW5pYXJza2lAaW50ZWwuY29tPg0KPiBD
YzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBbSW50ZWwt
eGVdIFtQQVRDSCAyLzNdIGRybS9pOTE1OiBGaXggdW5pbml0aWFsaXplZCB2YXJpYWJsZSB3YXJu
aW5nDQo+IA0KPiBPbiBXZWQsIE9jdCAxOCwgMjAyMyBhdCAwMTo1ODoyNVBNICswMjAwLCBNaWNo
YcWCIFdpbmlhcnNraSB3cm90ZToNCj4gPldoZW4gdXNlZCB3aXRoIFhlLCAidmFsIiB1c2VzIGFz
IGZ1bmN0aW9uIGFyZ3VtZW50IG5hbWUgY2xhc2hlcyB3aXRoDQo+ID4idmFsIiB1c2VkIGluc2lk
ZSBpb3N5c19tYXBfKiBtYWNybyBjYXVzaW5nIHRoZSBidWlsZCB0byBmYWlsIHdpdGg6DQo+ID4N
Cj4gPmRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHNiLmM6ODc6NDY6IGVycm9y
OiB2YXJpYWJsZSAndmFsJw0KPiA+aXMgdW5pbml0aWFsaXplZCB3aGVuIHVzZWQgd2l0aGluIGl0
cyBvd24gaW5pdGlhbGl6YXRpb24NCj4gPlstV2Vycm9yLC1XdW5pbml0aWFsaXplZF0NCj4gPg0K
PiA+U2lnbmVkLW9mZi1ieTogTWljaGHFgiBXaW5pYXJza2kgPG1pY2hhbC53aW5pYXJza2lAaW50
ZWwuY29tPg0KPiANCj4gSSdkIHJhdGhlciBjaGFuZ2UgdGhlIG1hY3JvIHNvIGl0IGRvZXNuJ3Qg
dXNlIGEgY29tbW9ubHktdXNlZCB2YXJpYWJsZQ0KPiBuYW1lLiBJIHVzdWFsbHkgdXNlIGEgXyBz
dWZmaXggb24gbWFjcm8gYXJndW1lbnRzIGJlY2F1c2Ugb2YgdGhhdC4NCj4gDQo+IEkgc2hvdWxk
IGhhZCBkb25lIHRoYXQgaW4gY29tbWl0IGU2MmYyNWU4YjNjZCAoImlvc3lzLW1hcDogQWRkIGEg
ZmV3IG1vcmUNCj4gaGVscGVycyIpDQo+IA0KPiB3b3VsZG4ndCB0aGlzIGJlIGJldHRlcj8NCj4g
DQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2lvc3lzLW1hcC5oIGIvaW5jbHVkZS9saW51
eC9pb3N5cy1tYXAuaCBpbmRleA0KPiAxYjA2ZDA3NGFkZTAuLjc4YjM4NTZjNDc1YSAxMDA2NDQN
Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9pb3N5cy1tYXAuaA0KPiArKysgYi9pbmNsdWRlL2xpbnV4
L2lvc3lzLW1hcC5oDQo+IEBAIC00MTQsMTEgKzQxNCwxMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQg
aW9zeXNfbWFwX21lbXNldChzdHJ1Y3QNCj4gaW9zeXNfbWFwICpkc3QsIHNpemVfdCBvZmZzZXQs
DQo+ICAgICogc3VwcG9ydGVkKSwgdXNlIGlvc3lzX21hcF9tZW1jcHlfdG8oKQ0KPiAgICAqLw0K
PiAgICNkZWZpbmUgaW9zeXNfbWFwX3dyKG1hcF9fLCBvZmZzZXRfXywgdHlwZV9fLCB2YWxfXykg
KHsNCj4gCQlcDQo+IC0JdHlwZV9fIHZhbCA9ICh2YWxfXyk7DQo+IAlcDQo+ICsJdHlwZV9fIHZh
bF8gPSAodmFsX18pOw0KPiAJXA0KPiAgIAlpZiAoKG1hcF9fKS0+aXNfaW9tZW0pIHsNCj4gCVwN
Cj4gLQkJX19pb3N5c19tYXBfd3JfaW8odmFsLCAobWFwX18pLT52YWRkcl9pb21lbSArIChvZmZz
ZXRfXyksDQo+IHR5cGVfXyk7XA0KPiArCQlfX2lvc3lzX21hcF93cl9pbyh2YWxfLCAobWFwX18p
LT52YWRkcl9pb21lbSArDQo+IChvZmZzZXRfXyksIHR5cGVfXyk7XA0KPiAgIAl9IGVsc2UgewkJ
CQkJCQkJXA0KPiAtCQlfX2lvc3lzX21hcF93cl9zeXModmFsLCAobWFwX18pLT52YWRkciArIChv
ZmZzZXRfXyksDQo+IHR5cGVfXyk7CVwNCj4gKwkJX19pb3N5c19tYXBfd3Jfc3lzKHZhbF8sICht
YXBfXyktPnZhZGRyICsgKG9mZnNldF9fKSwNCj4gdHlwZV9fKTsJXA0KPiAgIAl9DQo+IAlcDQoN
ClByZWZpeCBfIGluIGRlZmluZXMgaXMgZ2VuZXJhbCBwcmFjdGljZSB0byBhdm9pZCB1c2Ugb2Yg
c2FtZSBuYW1lIHJlc3QgZXhlY3V0aW9uIG9mIGNvZGUuIFNvIGl0IGxvb2tzIG9rIHRvIG1lLA0K
DQpBY2tlZC1ieTogVGVqYXMgVXBhZGh5YXkgPHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT4NCg0K
PiAgIH0pDQo=
