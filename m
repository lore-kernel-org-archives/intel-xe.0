Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACDBC47077
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 20:02:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4673710EA1A;
	Thu, 11 Jan 2024 20:02:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39CA310E9F8
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 20:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705003357; x=1736539357;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=i/szWTu6EGbHNy8hxIzEQzlFAlEnUf7/jANQogyG7jg=;
 b=ZioTO/NYyaW4Cm1ptM8kcynUgRwWOuh0WGnLEhJikmuuGn5e6Uu/ZAoM
 vMwrURJbtTnljhLVGFQJ57sFRVFOkpSvTNbkNnGlAAcl8NE2p0XAmiHxQ
 iP5FUigUA26i9LfomNaSFddsL9KWaPJxiCZmQ6oid8nnDJYj7DpdUZqdy
 unhXv501UvrS6A+gWU/pks2OtQW4vT0xpKfFpeX80kW64wtlukwnKGsJr
 Jpqcfu5CvpvU8w9C2Am0qavnfPTTBXyoYp87WeuYCgQSQ4oEsAUkU4dme
 3z6MkKBnJZKd1/NXz7gLr6T77XDbcNMqxLhjggWqzJsZNFc7O8NwMEo4Q Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="5704575"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; 
   d="scan'208";a="5704575"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 12:02:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="758895363"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; d="scan'208";a="758895363"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jan 2024 12:02:22 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 12:02:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Jan 2024 12:02:21 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Jan 2024 12:02:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EUIA7bjoImfe5/oNlbXwMMWyOtYIacJKtGnqPqnzwLn2lkWgnrAw899ufn/D5I0djPqsPa63Br1KV1KeVV3cIMxETw2ucRzC2B5V+PW0vK0pqG4TvHKfkgEZHC8XVW8E0LLPORunyOo5YXnFaesTbJxReCnKCXmdFAjCvdkCz8CdlA3lzX+d5lF3ynNvumKqai8KtVP6mafOqnlfoKUcWn0KT346KNGGdN/3UM4J1nn7MNLywotJH/LtHHZ8ozus4sZGRumEWj7K1dWVHSdSB69irgL+xlWSxnZBnyzYgiA8SDBzUuWn41FnxnB3yszfRk0rQ1NLKE8fQIPkth5kFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/szWTu6EGbHNy8hxIzEQzlFAlEnUf7/jANQogyG7jg=;
 b=dEMfH/EYnLwPy3z612c3hhUEGbCpvlYZfK8e6TlEpRck2F1NG4+7agbDQ3xOQFoCMAw5B1/HBNmJlY7f1yMdJlgL6rIzWXkmfD6DjvkpHg/G47vlJnlRq3CefDMujXYaoHHc8imhQwCkDUiS87YcxVdOvRzLabPaw7zEZJ5koW+gGJqp9Fs4m2Kn8+PFfL6IbAQPA9I9x3S+NJDpZ/BwzYX9KxrBL8yphtLBohTzKA6EhALkj4LC8JvDVJx2iPrdMejI34kTG6ooI5/8/kz8ytZfbOypy435t9vm+Oam0eeVBar7SOqLKAsPTzYnW4dYZzE/kHOPb8o3TUWXpHu5gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SA1PR11MB6992.namprd11.prod.outlook.com (2603:10b6:806:2b6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Thu, 11 Jan
 2024 20:02:16 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::89b0:d67c:ea7f:465f]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::89b0:d67c:ea7f:465f%3]) with mapi id 15.20.7181.018; Thu, 11 Jan 2024
 20:02:16 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe/gsc: Initialize GSC proxy
Thread-Topic: [PATCH v2 1/2] drm/xe/gsc: Initialize GSC proxy
Thread-Index: AQHaQ14cHgdH/Ityh0m/oAJaVj7sHbDVC2cA
Date: Thu, 11 Jan 2024 20:02:16 +0000
Message-ID: <b0319900c4578281f980b054c3e817df9e943f41.camel@intel.com>
References: <20240110004416.1127942-1-daniele.ceraolospurio@intel.com>
 <20240110004416.1127942-2-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240110004416.1127942-2-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SA1PR11MB6992:EE_
x-ms-office365-filtering-correlation-id: aff80cdd-2386-4475-97d7-08dc12e035ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t/dmKybzz9TtvUEH0D2d48wT9p2MgKU2H5tQuXDr3JgIuuErmGxLr8gCdbIL8V84E9xcMVGxyDT0SaZTDXsebZjYoOElFsCHV29CDqcN0iZ6NCPJg384nDKpSaw6/yZL7tPMQIGGnpE8omhRrgMJt/LgQfGNyTEQmrDCgC+or6ms9JOYCw9bdBokLpVt/R9zxj5ZaG87n+YFgZkv1pk9+o7hpsifWsPZFwWsUNNaudL55g61xykL7Cy6jGrLk2KfBZs3uMr7MTKAP6D9PWM0BJgCni93Uu0sLnk4FHEZKHFUhud6P7lmZXHbeCc0My6WyNMUlHGyyuhRr0Zbd0aGmbgcN6iRbvLFozo10Li7g2C7ksRkkrWTln/213reB0Un0tgBoW8++psTbs3sJAnKzOdQi5GYasF4uItER+e8cmPPry1XnN0Mmlt1r4d6OQ1svWko/kMpHgskucP/moChzlJMqk490/BqjkCPEzrPZzHNviC26yc2t7ZR+L3911OgU6pUF0tevJ8Dfz7RAnxNp3v38AWYFj4ZUvUg9Y7wUGZgl+7ttHdqAuCiHCRE/D5rAv1B3n21/ixl5Xkmpo+y4Y816iqfp6DwJ6gQwhUcRIURSsCTIW1siifDPHSktUg9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(136003)(396003)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(41300700001)(83380400001)(316002)(2616005)(66446008)(6512007)(26005)(122000001)(107886003)(38100700002)(8936002)(5660300002)(110136005)(71200400001)(6486002)(64756008)(4326008)(6636002)(478600001)(66556008)(6506007)(8676002)(66476007)(2906002)(91956017)(36756003)(76116006)(82960400001)(38070700009)(66946007)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YmFnQkpiR3BodDJ6Y1ErNDQ1VHVFVldlRWlHOXgzTXZYU1FjV1o4Q01pSm9r?=
 =?utf-8?B?TDJoUXU4NnduMmUzTVVtTDZKVmNjWW45Vm56bnEzM2xUWnV4bUNCTStNRzMy?=
 =?utf-8?B?aTlpTGx4ZHBEaHFCeENIdUt0UjZZUks5QlljOFJ1dW1MRlg2VU1TYTlJSDR6?=
 =?utf-8?B?MVJQdWdxbkdnc3JGVldNTlBZZ1lpVC9WUnJrQXYrU3hjRmI5SXZ1NTBOUTJF?=
 =?utf-8?B?T01CWnNWMW0rUklaUFhOVGgzNkRmU0sxaytFRGxoY1FwVjBUL3RQaEljMlZ2?=
 =?utf-8?B?d1VUdHVrNkMvOHBsN2QydU1CU2Y1RXE1Nzk0VHo2TDdoU01tSnpNbFdVK0xo?=
 =?utf-8?B?UmVzNXByR1gzekllTm1jNlE1a0lRRi80RkczcDJUODlpRmg3ZE9NcGpOY1ZW?=
 =?utf-8?B?NndSdDdmaVNid09KblZIdzZ1UTU4OXBMY2FCMzlrRW42SmxFbGVCeFZlRG9t?=
 =?utf-8?B?b0ZvK2ZIa2RwdjRCaENGS3dpR2FScDdidlJ5bm1yZVZnanpWT3M0UmVpTUNi?=
 =?utf-8?B?cVpxQ2FsZmtPT3psaDdXTzVKZkhWUFJnM2haR2pMNW1yU2RtT1ZzYWpZMjJ0?=
 =?utf-8?B?dGo0RUZNaGFnVUowendzcVEyQjIxMTRqZytXd2Z1Wk42N3A4QWV2ZUNTZGFk?=
 =?utf-8?B?a3phbUVsYkQ1Y0pBZlZKZzJCQ1hHWEZqOFZBVTdlNDFENTZoOWRrQTVYOHJx?=
 =?utf-8?B?Q1lpeUg0ZVJGOEgxOVVBK2p1S293UU1ldWhLdUxVZXJOR3Y4T25wNmtRSnl4?=
 =?utf-8?B?QTNSdE5EQTlEdFFIblRYRnBrZyt4aGYwRlcrWGZ0TW9lb3FXR25XQXhlb2lQ?=
 =?utf-8?B?cHhSVVNZTytrVk54K25RalAxZzdGVDZUOTZrWlNjdFZTZ283dC9JeEx0WVZn?=
 =?utf-8?B?VFBLU05tSXg5OFYxaWZkS011YnplUG5yZ3FUNWE2T3hyTlVKUnIzQ3AxaC9u?=
 =?utf-8?B?WTVNdStEZFk0dFZYSEltN2M0M2R1aGd4T0wwZ2tjVjFORjB0MEF6cEp6aXNZ?=
 =?utf-8?B?Y1VsdmVkT3F2eEROYlBQSXZ2Q2F6blBxa0dKeEFNYTFuQm9PNkdZRjdSTEhU?=
 =?utf-8?B?SlR3NWJaMk4xQ3dOdG90ZE9BUllzUWVsR0VIUDhVZXlQeVpCSE5lN0dFT1dl?=
 =?utf-8?B?Qk5VeVNFdWJaTzhIYnJYVTNzNWxxeVJkMnRCeHRnSEFWMjhKaVFaL280MTkw?=
 =?utf-8?B?Y0UrY3pIWDJoYjNUOGlYSmlJaEhSZ0VORHM5TmswLzNqZUpYeGQwS1BMRXJ0?=
 =?utf-8?B?ellsMjBJT1pRaDA3VzdWZkpSR0pBWmtVRXE2TU5nYmU5aUJDdERSbk9aS2dh?=
 =?utf-8?B?ME93anl1dmk1dFZCRHJkc3RxaStDQUJDc2JNdkxaeGdTVFZzS3I3b2M0bFpS?=
 =?utf-8?B?c3dqNHZ2eG5HZWpZZHBWMGh5U3hPVWhyeGtOYnhXRWY1SDdpZzhKK1hvN2Zu?=
 =?utf-8?B?dlVtK3JYUllNUUNPbWRpM0d6V1QvTnp2Ujc5bHlaOXpQQmpXeWFTSE1hVENm?=
 =?utf-8?B?Q0IzZkxYaGZ0MnBtVm5kZ3FXaDRIWmdyaEJ2Y01SUzl3RFlwcy9VdU5OYWxK?=
 =?utf-8?B?NTkvV3F1MlBwVGh1bzB0aG9YampPVUZ5aXk4bGRnOGx4NXMzRzNVbGkva1hR?=
 =?utf-8?B?ZDNIZXJ5dkw0NkJ0YUUrZFpEbEtVMzZQdFdPU1BPYmdkUkdKYmg4Wnpaczk2?=
 =?utf-8?B?OUhSNjNMcE5rTnBRbmFkcWZ0M2l6SFBsc01md01HYXdOTUE2RXQybkRkTDIr?=
 =?utf-8?B?azZaa2tEUk55b09MVVliV1hJVjhZNHphWllacTZody9HTUVYNVlKSmxPcm40?=
 =?utf-8?B?b1lUeGVZc0dYRVB6K01ldmx4TWx4M29GdlFGZGZ2TTRGZ1k5VTNxM3BzKzN5?=
 =?utf-8?B?NmhjdkkyKzRHT2JKamI1VTRXdmxVM1ZVbVdKWmZOUmo4amhob05RdkM5VWFa?=
 =?utf-8?B?TkpEY0RsVitnTVllQjQvdTAxbE1qSzl1VkRjVnQxczV6NGJ2ak9UL1kzd1Fz?=
 =?utf-8?B?K2RDM1dmaEN6RmRkK3ZPZWNPcGFCOW1lYlY2MEtvKzJKTjBMRzJvZmJDUEhP?=
 =?utf-8?B?V0UzSGlxcnFyM0hRVlBhODdveHdlZ3hCM2hFaC9QRHphYjRkektHMldiYlJD?=
 =?utf-8?B?b2VyZDFKZVJKYzdtZnRxbTNac1VpUHVnQTBVTU5Hc1JiNUE5R3ZhNjcxQmk4?=
 =?utf-8?Q?pVHh3YMBNm6MqvC5oZe6PIc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <453350BDBB877D44A4E4EBF18145C0E1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aff80cdd-2386-4475-97d7-08dc12e035ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2024 20:02:16.1764 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SMTOzVlWSr3djTyAagWCVF/VNB4o5CbvPAh6/aPm4+OS1v2dzp6/gYm3a5tbX2FImRddYEUPOxLjpjgKGtr++YxVklYYeNQ7+XejrZOV+aATBH5EUkFouVHiW8klzk/P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6992
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDI0LTAxLTA5IGF0IDE2OjQ0IC0wODAwLCBEYW5pZWxlIENlcmFvbG8gU3B1cmlv
IHdyb3RlOg0KPiBUaGUgR1NDIHVDIG5lZWRzIHRvIGNvbW11bmljYXRlIHdpdGggdGhlIENTTUUg
dG8gcGVyZm9ybSBjZXJ0YWluDQo+IG9wZXJhdGlvbnMuIFNpbmNlIHRoZSBHU0MgY2FuJ3QgcGVy
Zm9ybSB0aGlzIGNvbW11bmljYXRpb24gZGlyZWN0bHkgb24NCg0KYWxhbjpzbmlwDQoNCg0KPiAr
c3RhdGljIGludCBwcm94eV9xdWVyeShzdHJ1Y3QgeGVfZ3NjICpnc2MpDQo+ICt7DQo+ICsJc3Ry
dWN0IHhlX2d0ICpndCA9IGdzY190b19ndChnc2MpOw0KPiArCXN0cnVjdCB4ZV9kZXZpY2UgKnhl
ID0gZ3RfdG9feGUoZ3QpOw0KPiArCXN0cnVjdCB4ZV9nc2NfcHJveHlfaGVhZGVyICp0b19jc21l
X2hkciA9IGdzYy0+cHJveHkudG9fY3NtZTsNCj4gKwl2b2lkICp0b19jc21lX3BheWxvYWQgPSBn
c2MtPnByb3h5LnRvX2NzbWUgKyBQUk9YWV9IRFJfU0laRTsNCj4gKwl1MzIgd3Jfb2Zmc2V0Ow0K
PiArCXUzMiByZXBseV9vZmZzZXQ7DQo+ICsJdTMyIHNpemU7DQo+ICsJaW50IHJldDsNCj4gKw0K
PiArCXdyX29mZnNldCA9IHhlX2dzY19lbWl0X2hlYWRlcih4ZSwgJmdzYy0+cHJveHkudG9fZ3Nj
LCAwLA0KPiArCQkJCSAgICAgICBIRUNJX01FQUREUkVTU19QUk9YWSwgMCwgUFJPWFlfSERSX1NJ
WkUpOw0KPiArCXdyX29mZnNldCA9IGVtaXRfcHJveHlfaGVhZGVyKHhlLCAmZ3NjLT5wcm94eS50
b19nc2MsIHdyX29mZnNldCk7DQo+ICsNCj4gKwlzaXplID0gd3Jfb2Zmc2V0Ow0KPiArDQo+ICsJ
d2hpbGUgKDEpIHsNCj4gKwkJLyoNCj4gKwkJICogUG9pc29uIHRoZSBHU0MgcmVzcG9uc2UgaGVh
ZGVyIHNwYWNlIHRvIG1ha2Ugc3VyZSB3ZSBkb24ndA0KPiArCQkgKiByZWFkIGEgc3RhbGUgcmVw
bHkuDQo+ICsJCSAqLw0KPiArCQl4ZV9nc2NfcG9pc29uX2hlYWRlcih4ZSwgJmdzYy0+cHJveHku
ZnJvbV9nc2MsIDApOw0KPiArDQo+ICsJCS8qIHNlbmQgcHJveHkgbWVzc2FnZSB0byBHU0MgKi8N
Cj4gKwkJcmV0ID0gcHJveHlfc2VuZF90b19nc2MoZ3NjLCBzaXplKTsNCj4gKwkJaWYgKHJldCkN
Cj4gKwkJCWdvdG8gcHJveHlfZXJyb3I7DQo+ICsNCj4gKwkJLyogY2hlY2sgdGhlIHJlcGx5IGZy
b20gR1NDICovDQo+ICsJCXJldCA9IHhlX2dzY19yZWFkX291dF9oZWFkZXIoeGUsICZnc2MtPnBy
b3h5LmZyb21fZ3NjLCAwLA0KPiArCQkJCQkgICAgIFBST1hZX0hEUl9TSVpFLCAmcmVwbHlfb2Zm
c2V0KTsNCj4gKwkJaWYgKHJldCkgew0KPiArCQkJeGVfZ3RfZXJyKGd0LCAiSW52YWxpZCBnc2Mg
aGVhZGVyIGluIHByb3h5IHJlcGx5ICglcGUpXG4iLA0KPiArCQkJCSAgRVJSX1BUUihyZXQpKTsN
Cj4gKwkJCWdvdG8gcHJveHlfZXJyb3I7DQo+ICsJCX0NCj4gKw0KPiArCQkvKiBjb3B5IHRoZSBw
cm94eSBoZWFkZXIgcmVwbHkgZnJvbSBHU0MgKi8NCj4gKwkJeGVfbWFwX21lbWNweV9mcm9tKHhl
LCB0b19jc21lX2hkciwgJmdzYy0+cHJveHkuZnJvbV9nc2MsDQo+ICsJCQkJICAgcmVwbHlfb2Zm
c2V0LCBQUk9YWV9IRFJfU0laRSk7DQo+ICsNCj4gKwkJLyogc3RvcCBpZiB0aGlzIHdhcyB0aGUg
bGFzdCBtZXNzYWdlICovDQo+ICsJCWlmIChGSUVMRF9HRVQoR1NDX1BST1hZX1RZUEUsIHRvX2Nz
bWVfaGRyLT5oZHIpID09IEdTQ19QUk9YWV9NU0dfVFlQRV9QUk9YWV9FTkQpDQo+ICsJCQlicmVh
azsNCmFsYW46c25pcA0KDQo+IHByb3h5X2Vycm9yOg0KPiArCXJldHVybiByZXQgPCAwID8gcmV0
IDogMDsNCj4gK30NCg0KYWxhbjogbml0OiB3aXRoIHRoZSBmaXhpbmcgb2YgdGhlIHJldCBmb3Ig
dGhlIGNhc2Ugd2hlcmUgcmV0IDwgZXhwZWN0ZWQgaGVhZGVyIHNpemUsDQppIGRvbnQgc2VlIGFu
eW1vcmUgY2FzZXMgd2hlcmUgcmV0IGNhbiBiZSA+MCBhbmQgbm90IGFuIGVycm9yIHdpdGhpbiB0
aGUgbG9vcHMgcG9pbnRzDQpvZiAiZ290byBwcm94eV9lcnJvciIgb3IgdGhlIGJyZWFrLiBJbiB3
aGljaCBjYXNlLCB3ZSBjYW4gc2ltcGx5IHJlbW92ZSAicHJveHlfZXJyb3I6Ig0KYW5kIHJldHVy
biByZXQgYXQgdGhlIGVuZCBhbmQgaW4gYWxsIHByaW9yIGNhc2VzLCB3aGVyZSB0aGVyZSBpcyBh
ICJnb3RvIHByb3h5X2Vycm9yIg0KcmVwbGFjZSB3aXRoIGEgZGlyZWN0ICJyZXR1cm4gcmV0Ii4g
DQoNCkJ1dCB0aGlzIGlzIHRyaXZpYWwsIHNvIG5vIHBvaW50IGhvbGRpbmcgb2ZmOg0KUmV2aWV3
ZWQtYnk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0K
