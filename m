Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673FCCDB465
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 15:04:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB2710E211;
	Mon, 16 Oct 2023 15:04:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C0010E211
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Oct 2023 15:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697468649; x=1729004649;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=l05/JoG8t6dBztV7/jVbQr8nXSn6Rv72bIJGjbdiq60=;
 b=HCYxpEYAB0MQcd9JS+UFjD852hls4aDuMwgXxSIrUlXDy8RQShknoAyZ
 4k2mQma6urMHDj+h/uAAC5aXXXDghJf/1Ts3+lrI+TNCRtN8vhCznxMVT
 vXp2DrvZKRDkgB8uZYZHz0mT1es5gm2iwLUunTBVF/QJBzS7Wj11FBeRW
 X31UrlH2BRFLq4tSjFNv+uG13l+YFIm+FRvO+cD87hx4S7gBv1jsdaFFN
 WzxtrLuF9gHXQs8fjZszXMbRyoJJtihtWvDPZiIooC57KwlmwAgLeiKnh
 X+LC+u6CmtIRX1TGz8BtyIiPIZS+HqqYEoyO2k1AhNB0yo7zbWnV4S6Bx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="389409022"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="389409022"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 08:03:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="846416991"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="846416991"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2023 08:03:24 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 08:03:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 08:03:24 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 08:03:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KMC28mN4uJYGPHzOKzXAApZKko/EMrRfMUn/fm335Eg3juSOjfC5D75yl4BC7rc7c1L3epG80854og2x4cDR234c3a/YCqaDDJzqsBZHLZj4Xrr11m1a4JHvGyCe46bJUjmtQy3SYrhsQLXWrgxZV6brAPgQqs/0rKd49tJsIAlcYa5eTRGDg7JBALNBQLPj/cOZUrptH2ej769T37oiwxU9Lg+Pp8FX0r+GlT7zUreHx2nY5MXGrtY/Zfxm230wvKW53MfRwvoAe71PLJL39cFYIZX+IL1lfOCZg2gPPo0JpYI/+TqSYOiJsk1TpVdiU4ZmwowhxKa22CcASRJ7uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l05/JoG8t6dBztV7/jVbQr8nXSn6Rv72bIJGjbdiq60=;
 b=Jgg0ITRvl6G3hCzzVQcgXU4oFVtbJr2eIckQj3ukP24funkt6lln1X2njX5I9subaEzuyWxtLCDx8XN5zXhkRku+EUK6YiHgdpv5lma57ZPXdIU33mNRpWqylgTn/WgALwKVxWBGqckuX/RGbylsTGJB+L+fzApTx+eBsmCAUG7AlSGzlt+UPT03JKmnL9b8rkR57vpzYsKeoFEgR3HV9k/12s914G66jyHD5JYxUEeZH2Hw4J+S6IBMFSWoW42CqciKLNhULhEDNiOt2WFyCFskWLizQpm/lW276Z+VGmDjRnN4+7Z415X7lxSVGGY/2EsYPX1HJSTfMqNRucqmMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by PH7PR11MB7986.namprd11.prod.outlook.com (2603:10b6:510:241::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 15:03:22 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::bff0:69bb:b4e7:dacb]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::bff0:69bb:b4e7:dacb%4]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 15:03:21 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH v6 1/2] drm/xe/display: Don't try to use vram if not
 available
Thread-Index: AQHaAECfvlSVLgqIQE+ZTBfUwbQturBMgVNQ
Date: Mon, 16 Oct 2023 15:03:21 +0000
Message-ID: <IA1PR11MB64181E4AB368B7C1B2F92C93C1D7A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20231012135209.403827-2-juhapekka.heikkila@gmail.com>
 <a3b00b7b-266f-4c46-1af3-401aabce2134@gmail.com>
In-Reply-To: <a3b00b7b-266f-4c46-1af3-401aabce2134@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|PH7PR11MB7986:EE_
x-ms-office365-filtering-correlation-id: 31de4ccf-3b8d-4203-a393-08dbce5909e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VS5zculmY0QLBhPrq9FbD2xs2ocSkW0QAUrZv4nsBfJcYR/1s7ydtkDH3hRSPuCnZz1In6BfFUhFl27WA10yozAxjCgNgu0TnZPRPv9rUxXG9AHS2gTSx1VH+y3VXtu8KESToaf8nre3e7wOD76JwLsRdbFSZ83S2dnWxHDhfGJrfOBIIW/5pL8JK61OrgJkvmPE3B+xFYJ2VHYzyQ30emdLLxEd+Ki8edcXrAsC40ZzXl7EwrtUVybPjb5tChd5Kr24MjoIJlSffDd9KESFHbi6itFrXoCV6hBCYZy6SCKNzKLNz+MbwgAxmmvGn66sLD0qGPa9dyTM0KkGaEx80dbq+tDMfTaIqvkD5NDRuwxDqAxdTXOVHQ3oedTlW39MUZcmv23x304lOZ+E7xHkNgzs1p1VX4FcXAI7x/w4ZUu6h+1Z1QtmLYecqAUTYytFgebg03O+syyAMXsONHVWVxQDyWRTTyvPJB5CdrV56iu7rbt9CjPRpo0z/HsIMJdxxViSTFDhiiQK9UdpBMCzbXEIpa5Y3ddA+Kyv0+/fDv4qCMN59W8cnQiyTcqzDcm1XmDlxeKy8od3ViopGz5qK9e1+IvafMsBDC1xbHLjnKls6IBKpSzXxpt+XaH7njtl
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(136003)(346002)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(76116006)(66446008)(66476007)(66556008)(66946007)(478600001)(316002)(110136005)(71200400001)(26005)(7696005)(64756008)(6506007)(5660300002)(8676002)(8936002)(52536014)(9686003)(2906002)(41300700001)(86362001)(33656002)(82960400001)(38070700005)(122000001)(38100700002)(83380400001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHhqKzVsaHNGVitYcUcxejVQeGEzUy80VTViY200ek9iSVB3bUtCSzhLYXZR?=
 =?utf-8?B?Skt4RldNdDE3U3BkenhQellDQVc5ZnhWNVNLWEJ0V1l5SE5OaGQxU293akp2?=
 =?utf-8?B?SFdnTktpV1lacUxQVE0wNjhUN09SU3J4Z1NmRVJYUnFrVm5pcmlEVndXcnox?=
 =?utf-8?B?ZW5ZV1A0QmpxY3hFTjR2dlAwRjNrZFBKK0RtRlNISEZCTVg4M0NTQy9INkhl?=
 =?utf-8?B?MGczYVNFOHBnSUNpRDJOeHpXUTdDcDYvOElWQjEreVRTK1JJeVM2WnNxRUVx?=
 =?utf-8?B?UWhTMktVaGYvbjNQalBLek92b2JtVEdJZG5FVFh4ZnhwTk5sM2hEU3NKSnJ1?=
 =?utf-8?B?WFBLQ2xxK05wTWFMajRRVkJGRGJVRXRPbmxZek9saDlETHFEUGNDQmxqZUNN?=
 =?utf-8?B?TVU2M1JlSXBndjlkZ1NmSVZiOEROaWgvTHlMWDYyY1lQK3JSYzd5VVBNRndm?=
 =?utf-8?B?bnpsK2tvNzRZY3RUZFVoWWh4MVc2VU1pTVkxc1NKOXNYWFhjUStNRkFUdlNI?=
 =?utf-8?B?VWxiYUtrdU9GN3grcWp6RGlkb09wSGppR2g2OXJYck5FMkZPL2E5TFh6bUNX?=
 =?utf-8?B?RWpJckh5cEJ2TStGYzNIc1FRdGVUU0NQdDUvWVBsWXg5VGFBRXlFWm1ZNEl6?=
 =?utf-8?B?Wm5OcGE5ZENuZjU2eVRObHRUeFVtQjhGc0ViZmk1eFl5MkNJdHpINEpsM2E0?=
 =?utf-8?B?WjEvRDVEU1VKMStqcFdMUllua1ZUaFE4UWRuWWZDUEExQTdTWVdkMkdINS8r?=
 =?utf-8?B?d3BTWkRjclF4QjRaVnRQZHpKSStwU3NLaXJCVmxTRjByNUp6aElqQkcyVHE3?=
 =?utf-8?B?WHQ0OGxVNloxVDZRYUdCeU5hTG9Od2E4WEk2a0craG1aMkdTcTRoK1F2SUV0?=
 =?utf-8?B?WTR2WFhDWFNER1NLeTlobk41UWlXU2lrREd1elpKODVrSSs2WWswV0R2THRr?=
 =?utf-8?B?SzFzL1lpcTUzKzluQmRqUzRVcVhyWEZ2RWphMWF4UGVmR3UwQm1GUEp6UVhC?=
 =?utf-8?B?Z2lGVHhPQlJHVGY5cnVOd3JtdVBFOTFpdEx2Nm9nWEVMSkppYUhDbW5PTE41?=
 =?utf-8?B?SHlNZXY1QlVGZHM3eEFBUjE3SFBHVFV4eGZlaEZrcXlGeUplSFRPNDVKUWZz?=
 =?utf-8?B?Tm1aRzV4Tk12elNZb3NURVpra0xGQ25CemhOSVlFUkNNQTBzN2Fvd0Nza3FX?=
 =?utf-8?B?M3VsdFQ3TTNxRU8vS1VNdGkyQzdRV3NoSFdxVDY3ZVpTbk15SU5RTGNzTGNT?=
 =?utf-8?B?V0d5blJXMlVyUTRPOFdSQTBGU0ttdjRkNGFxVnZ1U2UrVkdBcE5RQVpBUjZW?=
 =?utf-8?B?TUZmZ3NBeWs5WmFVeUd2UmVrY2o5ZkhvT1hQQW5IT0FhMnJMSzVYU0lPdUlt?=
 =?utf-8?B?MGY2M0c4dGloZEQvRDE4Zjl0eHBrdGhSOFJUZUFhN1FrSHZVVTB2TWJJek9C?=
 =?utf-8?B?aWhBL0VObGFDSVIxZVRzQ1ovZzZ4b0RFT1B0eTFSd2crVkJPdW9odk4wdWZr?=
 =?utf-8?B?NjgwTGdZV29mdk92SHcwYmV0UFA4a3NaSkd6VEtmMFlmQ2x6VlBXeHJCak9J?=
 =?utf-8?B?bGFMdUpXbHBVZXFqY25wTGhxMFhlQUkyYkx5RHpJeWtXSnd1Uk5RSWExT1l1?=
 =?utf-8?B?b244WXZSWFIvY3NNVkFTa1JnVjQxUGUrUFNaNy9HcXRjTHZvOXVldkRRM3dy?=
 =?utf-8?B?R2p4OHFtUWRzQ0NlV0oyT0MrNnF3RTQ0TjRaSG5TUEl5MHZYa1l6eFJ3eXhX?=
 =?utf-8?B?T0FNVjJxSk9GZDdwZXo5YkZNY2N3TWpxZXl2dzBUY1B3MkZSaThyT3VTeVV5?=
 =?utf-8?B?ZitlUGh0ZnBIUndidDlVdEk1RXBZTFZkVkZxNkVRYjVXWEhySVlzNGplbGVm?=
 =?utf-8?B?bWRrM3h4dmxNR2YwSkxNM1l2OFNvZVlibnBsdlN2ZkhWZTgyMHRsazhET0xX?=
 =?utf-8?B?YjhIUW15Y3Exa25MakpydjZiWGZjeWJMc3dIcXRrQWVLQUZRY0p3TVJyRG9w?=
 =?utf-8?B?SlpZVFNPdzloeUl3dEZCcVFTZzR5WkJhSVEwS0d5NXlPTUFjVE9mai9ENkxm?=
 =?utf-8?B?OVpyUHA2OWtDMER3bVBoUFQxeXpsY1VoZmN5V21FS0YvWjQxVXNncFU4QjJ4?=
 =?utf-8?Q?eAdjs5hiJrAUd9KUA7GWPozQk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31de4ccf-3b8d-4203-a393-08dbce5909e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2023 15:03:21.6590 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F6iLrCzIDFeBEmLynaMMfoV5ubNqpEbfrqX4osTp2WE6WEN9FUPtJGiSjy694NuA4263jKTySjjZHPgCi83xhZCzNBPOBwpueyBmcFo532k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7986
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v6 1/2] drm/xe/display: Don't try to use vram
 if not available
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

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogSnVoYS1QZWtrYSBIZWlra2lsYSA8
anVoYXBla2thLmhlaWtraWxhQGdtYWlsLmNvbT4NCj5TZW50OiBNb25kYXksIE9jdG9iZXIgMTYs
IDIwMjMgMTA6NTQgQU0NCj5UbzogUnVobCwgTWljaGFlbCBKIDxtaWNoYWVsLmoucnVobEBpbnRl
bC5jb20+DQo+U3ViamVjdDogRndkOiBbUEFUQ0ggdjYgMS8yXSBkcm0veGUvZGlzcGxheTogRG9u
J3QgdHJ5IHRvIHVzZSB2cmFtIGlmIG5vdA0KPmF2YWlsYWJsZQ0KPg0KPlRyeWluZyB0byBnZXQg
Ym8gZnJvbSB2cmFtIHdoZW4gdnJhbSBub3QgYXZhaWxhYmxlIHdpbGwgY2F1c2UNCj5XQVJOX09O
KCkgaGVuY2UgYXZvaWQgdG91Y2hpbmcgdnJhbSBpZiBub3QgYXZhaWxhYmxlLg0KPg0KPlNpZ25l
ZC1vZmYtYnk6IEp1aGEtUGVra2EgSGVpa2tpbGEgPGp1aGFwZWtrYS5oZWlra2lsYUBnbWFpbC5j
b20+DQo+LS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9mYl9waW4uYyB8IDEx
ICsrKysrKy0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0
aW9ucygtKQ0KPg0KPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9m
Yl9waW4uYw0KPmIvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVfZmJfcGluLmMNCj5pbmRl
eCAyYzM2ZTUwMzI0MzMuLjg5Y2Y2NWM1ODE5MSAxMDA2NDQNCj4tLS0gYS9kcml2ZXJzL2dwdS9k
cm0veGUvZGlzcGxheS94ZV9mYl9waW4uYw0KPisrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNw
bGF5L3hlX2ZiX3Bpbi5jDQo+QEAgLTYyLDExICs2MiwxMiBAQCBzdGF0aWMgaW50IF9feGVfcGlu
X2ZiX3ZtYV9kcHQoc3RydWN0DQo+aW50ZWxfZnJhbWVidWZmZXIgKmZiLA0KPiAgCQlkcHRfc2l6
ZSA9IEFMSUdOKGludGVsX3JvdGF0aW9uX2luZm9fc2l6ZSgmdmlldy0+cm90YXRlZCkgKiA4LA0K
PiAgCQkJCSBYRV9QQUdFX1NJWkUpOw0KPiAgLQlkcHQgPSB4ZV9ib19jcmVhdGVfcGluX21hcCh4
ZSwgdGlsZTAsIE5VTEwsIGRwdF9zaXplLA0KPi0JCQkJICB0dG1fYm9fdHlwZV9rZXJuZWwsDQo+
LQkJCQkgIFhFX0JPX0NSRUFURV9WUkFNMF9CSVQgfA0KPi0JCQkJICBYRV9CT19DUkVBVEVfR0dU
VF9CSVQpOw0KPi0JaWYgKElTX0VSUihkcHQpKQ0KPisJaWYgKElTX0RHRlgoeGUpKQ0KPisJCWRw
dCA9IHhlX2JvX2NyZWF0ZV9waW5fbWFwKHhlLCB0aWxlMCwgTlVMTCwgZHB0X3NpemUsDQo+KwkJ
CQkJICAgdHRtX2JvX3R5cGVfa2VybmVsLA0KPisJCQkJCSAgIFhFX0JPX0NSRUFURV9WUkFNMF9C
SVQgfA0KPisJCQkJCSAgIFhFX0JPX0NSRUFURV9HR1RUX0JJVCk7DQo+KwllbHNlDQo+ICAJCWRw
dCA9IHhlX2JvX2NyZWF0ZV9waW5fbWFwKHhlLCB0aWxlMCwgTlVMTCwgZHB0X3NpemUsDQo+ICAJ
CQkJCSAgIHR0bV9ib190eXBlX2tlcm5lbCwNCj4gIAkJCQkJICAgWEVfQk9fQ1JFQVRFX1NUT0xF
Tl9CSVQgfA0KDQpIaSBKdWhhLA0KDQpZb3UgaGF2ZSBjaGFuZ2VkIHRoaXMgY29kZSBmcm9tOg0K
DQoiQmVzdCBlZmZvcnQgYWxsb2NhdGlvbiIgKHRyeSB2cmFtLCBhbmQgdGhlbiBmYWxsYmFjayB0
byBzdG9sZW4pLCB0byAiRGlzY3JldGUgZ2V0cyB2cmFtLCAhZGlzY3JldGUgZ2V0cw0Kc3RvbGVu
Ii4NCg0KSWYgdGhpcyBpcyBjb3JyZWN0Og0KDQpSZXZpZXdlZC1ieTogTWljaGFlbCBKLiBSdWhs
IDxtaWNoYWVsLmoucnVobEBpbnRlbC5jb20+DQoNCklzIHRoaXMgbmV3IHNlbWF0aWMgdGhlICJj
b3JyZWN0IiBhbGxvY2F0aW9uIG1ldGhvZD8NCg0KVGhhbmtzLA0KDQpNaWtlDQoNCg0KPi0tDQo+
Mi4yNS4xDQoNCg==
