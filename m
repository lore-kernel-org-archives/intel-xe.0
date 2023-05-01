Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440B2C77B7C
	for <intel-xe@archiver.kernel.org>; Mon,  1 May 2023 22:28:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18EA110E34B;
	Mon,  1 May 2023 22:28:11 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 159FE10E34B
 for <intel-xe@lists.freedesktop.org>; Mon,  1 May 2023 22:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682980089; x=1714516089;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=tsnYt7B+DvebxIeOWiD7/RQo9dbe5GPBZA16+scJkno=;
 b=B/EzhXG6cAqM0m2lp349feivENEjOaUy//THSSzjSQaiK5O8qZi/q5S5
 GG6ebSPhwV1FCbyuGqS3N5R3JajKPk6uxfBBXh06qWB0FP5IiN50MXFSr
 sgShgbMg2De406tOQfNHIiMJO0v26hicBFceSzxhVT9mrTYqMxIl/iZXX
 SM2ko5OTb743/fxOQlTDTp2c9V128LhCJFThuOHrx5HREyu1ioypyDx2i
 OthfKWDS3LqxuyMwmQMNGvr02hSdupL9F/VeoErX5iEZHMb7dg8p0clMu
 8tbS4mmty9FQxYQGker8S16uiEKCDTttnAqSwf42DH47vqwzTzBvlo3NZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="351224912"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="351224912"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 15:28:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="840051395"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="840051395"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 01 May 2023 15:28:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 1 May 2023 15:28:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 1 May 2023 15:28:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 1 May 2023 15:28:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 1 May 2023 15:28:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DEa8sPdSliHeIifEx+r2C2BJka3y7jU/TmeVnI6bOizB9fEV3gu9e1wt0lVt58pBrLHAz4AJilmbZa/5uzzShN6we/UqbdPNKC+rV4rabobEXlwW5Rp27Rrpwze01/68ug7gV/a29/fqmIVxofFYHqyDUHT3tuRgd5DbZdWvQMKqok/pvbt/EK2HBtuqKzu0+U6fEInHPjEWGa/uMua+FQ/aErE9VdQp6ZnzOTEp2adVUeyPlPwDCH4UE1olAOUotJHuZ8rRYkNjm32AW5GB4hQjAn/OdLJy+lexNIb4zIqSb5uQawdEfJlrxFckfA44Jsl0cZywD6FXWQsq7gwu0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tsnYt7B+DvebxIeOWiD7/RQo9dbe5GPBZA16+scJkno=;
 b=DklKZZsgKj2N61fInX6zvQBkH+GC+/o2CCl0YX2OZTT4uZKGNJ2rSKqklCgu7xK/q6M+cYL6o2pKYe2kpzaXr4t+ZhcA+ggcU5b/Ls2xVrcBucXo+PtY1BgE3jkLSqVEHY0sN4zKcaGljUELdBawxx39Elm6+qZeM4VAa2TEbWkhopA40/cYBYBmJCgXI4HgkwUdXkiJ2O8jRxvOJcMosHLdluaULUOvPcnLEUnJtFwA5FVWoYymoHRdfzHTWcjvcRiSH7KffqNmc5ipwXYG5W/AarAhQUK6nLWte5ks639bGNLVWj6vKShBUsfr1HBmJSbYp4cQX/ujoNp/Nsh1eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB5156.namprd11.prod.outlook.com (2603:10b6:303:94::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 22:28:04 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6340.030; Mon, 1 May 2023
 22:28:03 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Gabbay, Oded" <oded.gabbay@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: xe-rev1 Branch for ease the intial review / ack.
Thread-Index: AQHZfHwxSo5QcMR8S0iEncpUCQT+3A==
Date: Mon, 1 May 2023 22:28:03 +0000
Message-ID: <77046462e38d71c3d0d87ddf84d2c412d0cdf8d6.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6059:EE_|CO1PR11MB5156:EE_
x-ms-office365-filtering-correlation-id: 3bed82e2-5c0a-4371-8ac6-08db4a9353f5
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IIIe1GWP0fenFzdiXsUc/4/JoDCp6HtCCv4opneppLvS64x0oW+7uqoVhPj5dW3psPdOIKFv9tpa90BmjiVyj7wGl+faZpDUOnf0RUAhZaGQ4n/+oiJ6Lm5yLYWlmkP9+qD2AE2Vyz+6oD8r1pdX76KCOdaAVRaAITH71I8+B3D3F+/npW6FeNq5haExOdwLQ+bV4OUR/Tod6s8JtvL/DKFfxyo8DxejM/yp92MggJEngrOkyMcxfGa++TMqqF9UwTK77wXNqC+3IF0vw7st+Nwk7QTD7kUovkLWkYVQyTm2Totlz6/5bPJPzSC2HGmjg/Jb1UolFRMqFET6IruUvaCAnRsXet1SryUdTmcKnP+slmirzwesa7adl9ZRBYOPxmoMr6UODo+jTG2zUq9X77gREDXbEqeyWCKE0WHylwQxEcOn5mq7d9H6wA33quoAS7VOzuxnVGfZD/2bpf+ybJozQbg6JcOQl7L3QX7irkggnwalBsWj7Nkf2L/Xqr52g95R+XrJxpd/2ZRl24rx+1ta/cPmtYy8tFcM3smslcBQVrnQp+dhKPK4xbBMvMHw
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(396003)(136003)(376002)(346002)(451199021)(478600001)(54906003)(110136005)(186003)(107886003)(6512007)(6506007)(26005)(2616005)(6486002)(966005)(71200400001)(91956017)(66476007)(76116006)(64756008)(66946007)(66556008)(4326008)(66446008)(41300700001)(83380400001)(316002)(8676002)(8936002)(5660300002)(82960400001)(38100700002)(122000001)(2906002)(4744005)(86362001)(38070700005)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VVNsSFA1NkYrclRkb09NcUJlV09venJIZjIxdkdFOEdYNUJ4eDlheFhWMko3?=
 =?utf-8?B?VC82YThrdUlGYWtRc1R1cmUwYm1FTi9RUU50d1lBVjlYOCtEUC9qY3VWU0tu?=
 =?utf-8?B?SnlqTWUrdXJzdzE0RlVpcFFuZlJWL0p0bHVPTlJjMmhPT0lDa0F1RXdYVDc2?=
 =?utf-8?B?a3h6alNsR1d2dDg0MERJTllFZDlISjkwMHc5VGJxWWY4UU5jeW5ta1Q5T3hh?=
 =?utf-8?B?QXcxN1pGUHNJU2NoaFBMWnRTdmNNRFgvV1d0SWovNzFqQjRRY2Q5ZVNIUm5k?=
 =?utf-8?B?YVZxczF5SDdROHVPL0M2eTZKNDQ0T0hpRzJnSXpqc3RRQUViU0dOUnhNM0lH?=
 =?utf-8?B?QzFDMGF1RVNaNTRJdVF2TEVLZ2Y1NGZzVHUvVE1sM0UxL25KL0Nib0pGcXMz?=
 =?utf-8?B?SitNYS9zdEI5OHhmbHlWWVZyOVFKU3VveWJlUHozK0JCVFN4ZEZIYnF0UzdJ?=
 =?utf-8?B?Yy85Z2pBdHphaEc1aU1GN0YvM05vZ1ZEekhkTzM3cFkyNmNFMTA0dThKY1p0?=
 =?utf-8?B?bXhMRndWV3NwM0ZyZmQzbnVuazh5RENWT01MSTJLNHJsZWdIOUNlZnc3bmc3?=
 =?utf-8?B?SjNQRFpBaFVkV3lOM0lUOVFyQWxwemFCYnhuQWl5dHkyRVdVbDcvUnBNYlMr?=
 =?utf-8?B?Qk5NV0F2UTR6S3Fuc0U3TEVqREN0RW1XQlNPZ1FjR21QcWVyeVJtV3gzbEVw?=
 =?utf-8?B?c0hjMlg5WjJyR25WdExmNU55OXlTYmxCQXdtemhsRW9BM2lkSXhHd1JYcUR1?=
 =?utf-8?B?dkhWK3FCQWY1RlZOVHFtMTZjTmZjeEJmYndmZ1M5c0poUXY3QjlVREFiS3lr?=
 =?utf-8?B?VG1uTEIweWw5eDMxeGF1RjhraUpzQzRub1ZmQ3dpRGNCOVhyMjdObFhWZDhj?=
 =?utf-8?B?STlOczk5Y08vUnZoZHh5WFRZdzdvanZZTENGQW4wU3RIL25sM0dzbmxJVzQ3?=
 =?utf-8?B?ZU5qd3V5SFV0Q05tU2hCM2tkaGgzTlF6V010c3FnZnRhU0dCNU14aTVIOTRJ?=
 =?utf-8?B?RW10STNYMDJBWEMyZ1c2RFRPOTEwZDEyZDNKTDFRa2d4d3BxVkwzaWs3Y0t3?=
 =?utf-8?B?OEhUQnRHdmhoWTB0azNhVFVid3pvL3VnMURyRlFKeGVHT3htcEVramNlK3Yw?=
 =?utf-8?B?MFE2N291cUlNQlZPUWtOaVlHdHJuMEEyRWpJQ3dZM0F3YWY2eThSUWUrbWZE?=
 =?utf-8?B?VUUxVUlmQ0pzK044SGhIdDZCcXlQbmloYWJaWVVBVUJBcjdyaHFWMkwvWlh5?=
 =?utf-8?B?eGVRZ3B3OEtNOXhUbmJMMXhDSG1mTFlPbFZUak0rdEJnUm1nTFBrUENwdDZo?=
 =?utf-8?B?eFpQbEgybDlITE1NVElwQm52WkJDSHg0ODVYWi9HWndUM0duL29uVE1rRmtR?=
 =?utf-8?B?YXNHeENJS2ZmVEpOWkl4WmsxdzA2MGNPam5hR0orOWF5ODN0Vzh2SXR6TlE3?=
 =?utf-8?B?TDBGc0dkbVpPNi9ZNWNWamN3RDlNbUVDQjlUMG5Vc2xBdGdGZ1FQdkpiWGxI?=
 =?utf-8?B?dk8xMnRYT2NRSFFZTGRjcm1kK3E4Zk5BMExFdFdLNURWQjRyUnpQd0lCcHFD?=
 =?utf-8?B?ak81NmxkbjR0NFJOYll6Mzc5c1cwUWYzZk9OMEpWQnUwQ0xPZVNCdnBpZFpW?=
 =?utf-8?B?b1RlVElDUTIycEVSdmEyNzZsVDJyRlhHQUxwMFhUZEFGODVXc2FPYldxUW1i?=
 =?utf-8?B?K1R3eWkzWFJUcFY1RG9xZnNIQWtwTmRRN3ExR2hpQzJxcXVnS01wM2k5QVNB?=
 =?utf-8?B?Q3JWVm5zUmlIMUlZNE9QM3VubGEzVTlwLzA5TklGbE94Vm0zQVRqNHBNUFhD?=
 =?utf-8?B?MStKVHBqcUU1dDVpbmE4OGRzbDJkcUN5aEhkWTMwYXR3c1JyR1JLTDRCZGpR?=
 =?utf-8?B?RE5PcHBkcm1OM3Npd0VWZnl0MmdpbWY1Wk9OT1FYdEV0VFhWcFZpWVhJeDNK?=
 =?utf-8?B?YXFZYVdZWThnMmtDSGprRktCSTEvN3lsZnp4NDFHditDeU43RTh1bVRWRmUw?=
 =?utf-8?B?emkrWFhOaCs1K2hYQm93NzNPYUl6anNzMTNodFBBWDFmblZqUkxtUG0vdEEv?=
 =?utf-8?B?SERJWG9BeWpGWVZLdmFLVm9nS0tWSWxTb0ZXUXFnWkU0VVEwc0sxMlQxbksr?=
 =?utf-8?B?SmpQbHdpd2h6VXN2MWM5c3Y3K1hZNENJbGt2ZDNEV3VyQXFIci9aT1RvYVYz?=
 =?utf-8?B?Umc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AD3CBFAC5D20964BB6EE4795E94C95CA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bed82e2-5c0a-4371-8ac6-08db4a9353f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2023 22:28:03.2195 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OysYTtI/5fS4xRwvns1w3F9OXFthp+wAlC9KrP0BKfU7xbB+6isXbTqXLrGaGL648/8bA2vS/XdxPHvmZbEnzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5156
X-OriginatorOrg: intel.com
Subject: [Intel-xe] xe-rev1 Branch for ease the intial review / ack.
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

SGkgT2RlZCwNCg0KSSBoYXZlIGNyZWF0ZWQgYSB4ZS1yZXYxIGJyYW5jaCBpbiBvdXIgZ2l0bGFi
IFsxXQ0KdG8gZWFzZSB5b3VyIHJldmlldy4NCg0KVGhlIHBhdGNoZXMgdGhlcmUgYXJlIGEgc3Vi
c2V0IG9mIGN1cnJlbnQgZHJtLXhlLW5leHQsDQpleGNsdWRpbmcgYW55IHBhdGNoIHRoYXQgaXMg
bmVlZGVkIGZvciBkaXNwbGF5LCBidXQgYWxzbw0KYW55IG90aGVyIG5vbi1kaXNwbGF5IHBhdGNo
IHRoYXQgaXMgb24gdG9wIG9mIHRoZSBkaXNwbGF5IHBhdGNoZXMuDQoNCkxldCdzIHN0YXJ0IHdp
dGggdGhlc2UgZm9yIG5vdywgYW5kIGl0ZXJhdGUgbmV4dC4NCg0KVGhlIG9ubHkgKGJpZz8hKSBy
aXNrIGZvciBjaGFuZ2VzIG9uIHRoaXMgcGF0Y2ggaXMgcmVsYXRlZA0KdG8gdGhlIGRybS9zY2hl
ZCBwYXRjaGVzIHRoYXQgd2UgaGF2ZSB1bmRlcm5lYXRoIHRoZSBpbml0aWFsDQptZWdhIHNxdWFz
aC4gRGVwZW5kaW5nIG9uIHRoZSBhY2NlcHRhbmNlIG9mIHRoZSBkcm0vc2NoZWQgY2hhbmdlcw0K
Zm9yIHRoZSBmdyBzY2hlZHVsaW5nIGFuZCB0aGUgMToxIHJlbGF0aW9uc2hpcCBvbiB0aGUgc2No
ZWQgYW5kIGVudGl0eS4NCg0KT3RoZXIgdGhhbiB0aGF0LCB0aGVzZSBwYXRjaGVzIHNob3VsZG4n
dCBjaGFuZ2UgYW55IGxvbmdlci4gVW5sZXNzDQpyZXF1ZXN0ZWQgaW4gYW55IHJldmlldyBpbiB0
aGlzIHJvdW5kLg0KDQpBbnl3YXksIEkgdHJ1bHkgaG9wZSB0aGF0IHRoZSByZXZpZXcgcmVxdWVz
dHMgY2FuIGVuZCB1cCBpbg0KZ2l0bGFiL2lzc3VlcyBhbmQgYWRkcmVzc2VkIHdpdGggZm9sbG93
LXVwIHBhdGNoZXMgb24gdG9wLg0KDQpUaGFua3MgYSBsb3QgZm9yIGp1bXBpbmcgaW4gdG8gaGVs
cCBvbiB0aGlzIHVwc3RyZWFtaW5nIGFjY2VwdGFuY2UuDQoNCkNoZWVycywNClJvZHJpZ28uDQoN
ClsxXSBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL3hlL2tlcm5lbC8tL3RyZWUv
eGUtcmV2MQ0K
