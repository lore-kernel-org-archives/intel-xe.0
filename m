Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030BEC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 20:58:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8607D10E510;
	Fri, 12 Apr 2024 20:58:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kVgeB0op";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8463F10E510
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 20:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712955506; x=1744491506;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=++9ni/swrpOD5eVN6ruDE3yqH+ax95Bovsn7NvgHI50=;
 b=kVgeB0op0VSgXk9SJvXPMdYK7f2maulw7E/m0PeJZa2zMG55emVgcNQt
 MwOaig4dj//GJ4CNiq8dsoAbTeic5yba2hVZHoHvmw4VZDC0NQw62MIDu
 zOZydFyamGLA8o28IYYJpUQO6SDNOKygw0kqxdz5R1bmOfjICXq/dLkyO
 NsrLe0Ts+rg3yQAEwXrSh40CHjZRnfjgMTUDnwctyjro49gRsWVtpkvTd
 dWCyRjzk0FdYpJ1PgV9DPxf0hkHIfzZMlx4UcIQuY1A8FVY0ABTQ5/ErS
 oDL9mD9LhA/eTpdLhX+6Uk1eRYahB50IGX6pK8s5gOLYMJ2+Rn9vTyNc/ Q==;
X-CSE-ConnectionGUID: Wdinkoc2Qp+57rGRylOdiQ==
X-CSE-MsgGUID: OGU4ZxqeSiOxdhRiC33Y9A==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8296069"
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; 
   d="scan'208";a="8296069"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 13:58:25 -0700
X-CSE-ConnectionGUID: 2cDhIug9QvOBw9dftWJesA==
X-CSE-MsgGUID: xEhx5zmKQ06jbyQxT/R2zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; d="scan'208";a="25886901"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 13:58:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 13:58:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 13:58:24 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 13:58:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CUcGVz5jr+SsrX5PcIFVb4uTpB87aE8ZU9+6efAZkZDRITePRnuSevOkT+Xyxse/yWs+/P8jfT2mVSA0Ss+GIWwkj0S1qWNRzXPcqdY46T1aBFy6kxnnmPq8MhWU4wlTyaF1prVe2moU0C5BjZiTXS5p/hrzIVCNIV3sG5fhHrHuaj+IUA9utfc2uE00Z1dlpAqCg7CP7yqokzWF2LugY9f/snBrI4AGD/0b90XITdF16rYZLpQzS70NdkH3BZJYw6mE8/tss7WAF9Qk8WTCNCuR6BK3ecKE0fR/jP3++CtWgAweOUaTlkek/oNjZQqCRtOFjK9YV0sPM+5M4IkXgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++9ni/swrpOD5eVN6ruDE3yqH+ax95Bovsn7NvgHI50=;
 b=cfLIAsezDBaLJjaigTRIPH1L7almItmiWQwn9PXFLkDFNutxCgZgWlBHtd2GB7vWDbLXyXMP+veSUzSPdOPXVpR+mbF7s9OVSXhx71GgDiKIC62Bfq+52YPOhHVxqMJIGeKY1ei8nV/NDwkf0RiszzQ3hKXshZ19nqq9Iv138XC8ZLkzuRbcHnawS+iO1P6o9guZNdgdnzBG5qXpLaw1cqEgolwIENSAle7Op8epgq4NJkLS7KmWH0vtsKpS5xv6hjE0uGAUoYqjg1wbApv96E7ruzfzZr64jX2hdAHc8EGldjkUnErBQJBC+SA309u81qq87zOKU4r9+9i7UEX4aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5445.namprd11.prod.outlook.com (2603:10b6:208:30b::7)
 by SJ0PR11MB5135.namprd11.prod.outlook.com (2603:10b6:a03:2db::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Fri, 12 Apr
 2024 20:58:22 +0000
Received: from BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::f50a:986e:f38f:32c5]) by BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::f50a:986e:f38f:32c5%7]) with mapi id 15.20.7452.019; Fri, 12 Apr 2024
 20:58:21 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "Gupta, saurabhg" <saurabhg.gupta@intel.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH v4 2/3] drm/xe/xe_guc_submit: Allow lr exec queues to be
 banned
Thread-Topic: [PATCH v4 2/3] drm/xe/xe_guc_submit: Allow lr exec queues to be
 banned
Thread-Index: AQHah4SRS43RWiI6kky53MHeeCztgLFlJpWAgAAAzHA=
Date: Fri, 12 Apr 2024 20:58:21 +0000
Message-ID: <BL1PR11MB544510DC6F6F4F2644E2DA0DE5042@BL1PR11MB5445.namprd11.prod.outlook.com>
References: <20240405175505.1161756-1-jonathan.cavitt@intel.com>
 <20240405175505.1161756-2-jonathan.cavitt@intel.com>
 <682a2bc1206df21d50611442ff2bced0aef71e27.camel@intel.com>
In-Reply-To: <682a2bc1206df21d50611442ff2bced0aef71e27.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5445:EE_|SJ0PR11MB5135:EE_
x-ms-office365-filtering-correlation-id: 6c3a93a9-18f3-4714-bf01-08dc5b3349c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xAuhIpyW2wmLJzn+JOWz9uYTgu6KPpD5UJQfLq2SOwcLMse8MHOSG1O5G+hiDQIC9GmpxsxC4rr25kfBvABQsTHXrQsqQDIuMpAWoGzyD7XE02nB7t++2JLhmpWn5KNSKFGbxC7xgzKOVgMUfDwCc0cHk6eP1KLGONHkydMLW1CGbUDyjxKjivHmsl23XrVCqL+rL2WE8oHfuzGMjN5BspQ45S5rFAWAweFhQZUBcv4SAtmTco/ZKDZSteXQvTS2RUo/ty0RpVdbwC6xUMKGjhQ+1iTHrDH6BvSLxR2o+WtLRhMO3LhMbRZrYa5prk9CAr0wzaQLyPvg1I0rl+HniqEru5jNaYe5OKazBRGez/02XnlGzOCqtoffr+nv8gN/18MpwI0JQTwf7ZWJZ3DrFzRDHDmRYDVDyaVm4Hv8RjL6/0uF+YHyjoP6/mRErXwRd7joNTltKItGQQ+Ird5iM4v8L/hD2RxtMNFz95c/9iaFfhN23ZSj2eS+Wv20AXFCYcZTGEyorhnQLk1oaQP+vimjS96Di4CxqlzQLKrMaFfOgezUWSnX2dEEHFxz0KgX7ZrOPlrAz39x2fx65uKFqxcTTVdAv+iQWj1aZkevB5a20z86X35hAIuTCyq21Zud9rRGIXXt/n+7aEJcbt6KJnf3E9/99tjmGFYx6vh3KpbAAzLa3h3HJtXffIZF7Q8quSd4r8G+GxJnG3UcwjjUYw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5445.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dU41cDFLNlhId0h1L3Z1VXZLQXpuYVNSOWxqdVdUYU54bXg0YVNzTFJmeUN2?=
 =?utf-8?B?WER4Y2p5aFJtZFpIdjZrZkZPU0VkUDMycGJoVTNranN2QVdheVZLdGgyQmRR?=
 =?utf-8?B?SVhGaUFFZjZscTlMeTlzUWw2eGNHOEtIQWFKWmRrbFRmSjNUMFlPM3Y0b2Nt?=
 =?utf-8?B?aENkdUtlbWtCYlMxQ1QyVUpRU0ZRZEFFUGVOazNwZlVCYjJzK0hTdjdPR28y?=
 =?utf-8?B?ZU5WZXFHYURzSGU3ZmlPTnlnemwxZWZFbzErSkxGRHdmVkFVTHZ0Z0JkZkg3?=
 =?utf-8?B?aGlnY2VjLytLbEIrWkxpTHJwZE9oNENvL1JGWlc5djVlWWFwdW9xbllodmc0?=
 =?utf-8?B?N2JSamwzTkowVDBHR3lJWDhEeDB3aWd3SlVSVm5vcWo0Z1MyQjFkQTZGcThC?=
 =?utf-8?B?VVA2RTdJSzdNNFFRMW40alR3WXkySk55NDNxV0ZOU2E0MDZ0MVRKZFNwQ042?=
 =?utf-8?B?SU1zUFl2TDdsOUcxV0ozTFVpbHFETnl0aFhZaVR6MXRUWWVWZXBmdXo4bHNK?=
 =?utf-8?B?bE4wUFNOTkQ0MFNubktFRUF0SFNIbG1FWGxEV3BQRzNBeUhnSnlhYjIyZ2ht?=
 =?utf-8?B?WUNYdVkxdk4zdCtYaS9YU2REbFZTZlhmUC83OGFndEJnV3dOMXBUV2RDb3lM?=
 =?utf-8?B?QVMwZnVobDg2Q2VjL0orbCsrVG9pNWZBRkxTN3cxc094bk9CMTN3SWJEVEJ3?=
 =?utf-8?B?NHh3Ti8xTzdldjFkNjV1SHIxelRyTDJiTGY4ODZOZldHTU9XZ1hDOU1RMmkw?=
 =?utf-8?B?Z1kzd0x0TVM1Qjk0OXlVS0hWWTg3YXFzYzRFY0Rzdm5aWUg1ZUxxZ3FMTmxj?=
 =?utf-8?B?eDEvWGdMbktmcXBIV3lwRkxLK0h2YjVhUTJ2QjYwYVIvV0MwTmNsT2R5c0Rj?=
 =?utf-8?B?VTYyQU9HVHhJUWkybWtLTjlSek5IbEZ0czBBc09WeVplOWwrTzgzbWxHcklv?=
 =?utf-8?B?d2NxZXlzQWl6WFZxb1dydU0zUU1URUdoZzB6cFNYakxCajhoZmhyaVFldVVN?=
 =?utf-8?B?MDJrQWEyWkRtUjJ5eHd3MkowV0VHYmdNUzVwK1NaSHNqSjdaK2pqc2QvOVFU?=
 =?utf-8?B?WlNQbEtaUXh5d1diQ2pHVXQ2cTlVWTJOa3NpMjY2OUFhakxiUHduSjBFck1W?=
 =?utf-8?B?dzhhSjFrNG12U3RTOVBKa1JuVzBFWDBiWHg5V1VtUTNvSUs3amRsaGZIOU5X?=
 =?utf-8?B?ZnZXU0hGeFJHWHVNTGtOdGlOeFJDbW44cjlJeVN1S1kxaWFaZEZXLzJISEtp?=
 =?utf-8?B?a3JiZTZ5dnlsRTVSWmdGNlhTdXhvOTlWVDFmcnpZZjBmUUZvSW9LQUx6ZTBI?=
 =?utf-8?B?aCtldGhOeE1La3lUZFNyeHRDOU9xUjYvMDkvSzRWdDJCV1hUL0U1U3ROUGRo?=
 =?utf-8?B?aWNYQ1BUMkZ1SmpSOFJUV1hlNFZOK2VLZW52cHpDYXEydXBKaytFbjlPc0x4?=
 =?utf-8?B?cXY4ckIvYjM0MG1PcjM4Y2JVOTMwODYvNFRuTUF2RW8xTXR2RkV4QTk0MGYv?=
 =?utf-8?B?Y1lVOHdjQXBmRnFNNlJNZGtvWlZveERzdXdhUjZBOVF5WjVJTHM5M0FCbG82?=
 =?utf-8?B?b0VLU0VPaUdrMWVldjU0SVBWU21kZUFlVzIvSGthOU1ZV0Q3TGRlY3lnYTFJ?=
 =?utf-8?B?a00xMDB1VTk2SjZSclFKNmZRNFRTVnRqTnNRSlRCMkpIMHI2RmxLVFdMV25h?=
 =?utf-8?B?Z3VCWCtjQzJBV01XM3NOUHhOTG1qak5rVDVQV3ZsOTBVeHN2VHFOYjhYNkJR?=
 =?utf-8?B?UUtLRk5RRDdtU0t1VFRjQ3NKMFFyM1QvSzNRcDFZR2Npa0lmS0YvWEJBcDdl?=
 =?utf-8?B?T0lwaGsxQXVJL3FGcFNBZ1VHb1JzOStjbmdoTHlWWHNRaUExcVdiZU9YYWN1?=
 =?utf-8?B?ZmNpRFNrNkJHNGlaRm9PMUd6dnZjdlc1V005N3N1S0c2bUdmR092R2pmOGFV?=
 =?utf-8?B?UkcxZkxWUWhvejJPbll5SjNkOXVVV1pTS1pUVUNxZjZhaTdwMkRiU1V6bWVj?=
 =?utf-8?B?VTRlU1I2c2RVTTVTVGxEU2RWdW5nd2tjWGlqWmQ0SEhBOFMzQnB5Y3FIZURp?=
 =?utf-8?B?bkhBNGp3aXVEMFduK2NSbHBZNnJJRGhCOEVRaUFtdmV2QzM4ZW83S3JPSnV1?=
 =?utf-8?Q?IZfaCSOgpVLka1xb+OvU2gC9R?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5445.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c3a93a9-18f3-4714-bf01-08dc5b3349c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2024 20:58:21.7993 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4xCxJFEX2pahnSM800jny+wXhMFc+Qgwpp+Yv0blVqAuRieKhANTx5TkKV17R7+9UvI1zMmBWlxmdmI/NftIBabT9oN/9AQi+YfUcGXggVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5135
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFN1bW1lcnMsIFN0dWFydCA8c3R1YXJ0
LnN1bW1lcnNAaW50ZWwuY29tPiANClNlbnQ6IEZyaWRheSwgQXByaWwgMTIsIDIwMjQgMTo0OSBQ
TQ0KVG86IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgQ2F2aXR0LCBKb25hdGhhbiA8
am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT4NCkNjOiBCcm9zdCwgTWF0dGhldyA8bWF0dGhldy5i
cm9zdEBpbnRlbC5jb20+OyBIYXJyaXNvbiwgSm9obiBDIDxqb2huLmMuaGFycmlzb25AaW50ZWwu
Y29tPjsgR3VwdGEsIHNhdXJhYmhnIDxzYXVyYWJoZy5ndXB0YUBpbnRlbC5jb20+OyBEZSBNYXJj
aGksIEx1Y2FzIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENI
IHY0IDIvM10gZHJtL3hlL3hlX2d1Y19zdWJtaXQ6IEFsbG93IGxyIGV4ZWMgcXVldWVzIHRvIGJl
IGJhbm5lZA0KPiANCj4gT24gRnJpLCAyMDI0LTA0LTA1IGF0IDEwOjU1IC0wNzAwLCBKb25hdGhh
biBDYXZpdHQgd3JvdGU6DQo+ID4gTFIgcXVldWVzIGN1cnJlbnRseSBkb24ndCBnZXQgYmFubmVk
IGR1cmluZyBhIEdUL0d1QyByZXNldCBiZWNhdXNlDQo+ID4gdGhleQ0KPiA+IGxhY2sgYSBqb2Iu
wqAgVGhvdWdoIHRoZXkgZG9uJ3QgaGF2ZSBhIGpvYiB0byBkZXRlY3QgdGhlIHJlc2V0IHN0YXR1
cw0KPiA+IG9mLA0KPiA+IGl0J3Mgc3RpbGwgcG9zc2libGUgdG8gdGVsbCB3aGVuIHRoZXkgc2hv
dWxkIGJlIGJhbm5lZCBieSBsb29raW5nIGF0DQo+ID4gdGhlDQo+ID4gTFJDOiBpZiB0aGUgTFJD
IGhlYWQgYW5kIHRhaWwgZG9uJ3QgbWF0Y2gsIHRoZW4gdGhlIGV4ZWMgcXVldWUgc2hvdWxkDQo+
ID4gYmUNCj4gPiBiYW5uZWQgYW5kIGNsZWFuZWQgdXAuDQo+ID4gDQo+ID4gVGhpcyBhbHNvIHJl
cXVpcmVzIHN3YXBwaW5nIHRoZSB1c2FnZSBvZiB4ZV9zY2hlZF90ZHJfcXVldWVfaW1tIHdpdGgN
Cj4gPiB4ZV9ndWNfZXhlY19xdWV1ZV90cmlnZ2VyX2NsZWFudXAsIGFzIHRoZSBmb3JtZXIgaXMg
c3BlY2lmaWMgdG8gbm9uLQ0KPiA+IGxyDQo+ID4gZXhlYyBxdWV1ZXMuDQo+ID4gDQo+ID4gU3Vn
Z2VzdGVkLWJ5OiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBKb25hdGhhbiBDYXZpdHQgPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+
DQo+ID4gUmV2aWV3ZWQtYnk6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29t
Pg0KPiA+IC0tLQ0KPiA+IA0KPiA+IHYyOg0KPiA+IC0gRml4IFN1YmplY3QgbGluZQ0KPiA+IC0g
TW9kaWZ5IGNoYW5nZSBzbGlnaHRseSB0byByZW1vdmUgbmVlZCBmb3IgImJhbiIgYm9vbGVhbg0K
PiA+IA0KPiA+IHYzOiBSZXZlcnQgY2hhbmdlIGludm9sdmluZyAiYmFuIiBib29sZWFuIHRvIHZl
cnNpb24gMQ0KPiA+IA0KPiA+IHY0OiBBZGQgbWlzc2luZyBzZW1pY29sb24gYW5kIHJlbW92ZSB3
aGl0ZXNwYWNlDQo+ID4gDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5j
IHwgMTIgKysrKysrKysrKy0tDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2d1Y19zdWJtaXQuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJt
aXQuYw0KPiA+IGluZGV4IDFhNmFiYjEwYTk2MGUuLmU3MmYyYTZjYWQ2MGEgMTAwNjQ0DQo+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYw0KPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gPiBAQCAtMTQyNCwxNSArMTQyNCwyMyBA
QCBzdGF0aWMgdm9pZCBndWNfZXhlY19xdWV1ZV9zdG9wKHN0cnVjdCB4ZV9ndWMNCj4gPiAqZ3Vj
LCBzdHJ1Y3QgeGVfZXhlY19xdWV1ZSAqcSkNCj4gPiDCoMKgwqDCoMKgwqDCoMKgICovDQo+ID4g
wqDCoMKgwqDCoMKgwqDCoGlmICghKHEtPmZsYWdzICYgKEVYRUNfUVVFVUVfRkxBR19LRVJORUwg
fA0KPiA+IEVYRUNfUVVFVUVfRkxBR19WTSkpKSB7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBzdHJ1Y3QgeGVfc2NoZWRfam9iICpqb2IgPQ0KPiA+IHhlX3NjaGVkX2ZpcnN0
X3BlbmRpbmdfam9iKHNjaGVkKTsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
Ym9vbCBiYW4gPSBmYWxzZTsNCj4gPiDCoA0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgaWYgKGpvYikgew0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGlmICgoeGVfc2NoZWRfam9iX3N0YXJ0ZWQoam9iKSAmJg0KPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAheGVfc2No
ZWRfam9iX2NvbXBsZXRlZChqb2IpKSB8fA0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4ZV9zY2hlZF9pbnZhbGlkYXRlX2pvYihqb2Is
IDIpKSB7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHRyYWNlX3hlX3NjaGVkX2pvYl9iYW4oam9iKTsNCj4gPiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBzZXRfZXhlY19xdWV1ZV9iYW5uZWQocSk7DQo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfc2NoZWRfdGRyX3F1ZXVl
X2ltbSgmcS0+Z3VjLQ0KPiA+ID5zY2hlZCk7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYmFuID0gdHJ1ZTsNCj4gPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9DQo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0gZWxzZSBpZiAoeGVfZXhlY19xdWV1ZV9pc19s
cihxKSAmJg0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAoeGVfbHJjX3JpbmdfaGVhZChxLT5scmMpICE9IHEtPmxyYy0NCj4gPiA+cmluZy50
YWlsKSkgew0KPiANCj4gV2h5IGRvIHlvdSByZWFkIHRoZSBoZWFkIG91dCBvZiB0aGUgbHJjIGJ1
dCB0aGUgdGFpbCBmcm9tIG91ciBpbnRlcm5hbA0KPiB2YXJpYWJsZT8gSXNuJ3QgdGhlcmUgYSBz
bWFsbCBjaGFuY2UgaGVyZSB0aGF0IHlvdSBjb3VsZCBnZXQgc29tZXRoaW5nDQo+IHJlYWR5IHRv
IHNlbmQgYnV0IG5vdCBxdWl0ZSBzdWJtaXR0ZWQgdG8gR3VDIGFuZCBpbiB3aGljaCBjYXNlIHRo
ZXNlDQo+IHdvdWxkIG5vdCBiZSBlcXVhbCBidXQgbm90IG5lY2Vzc2FyaWx5IG5lZWQgdGhlIGJh
bj8gSSBndWVzcyB0aGUgZmxpcA0KPiBzaWRlIGlzIG1heWJlIHRoYXQgZG9lc24ndCBhY3R1YWxs
eSBoYXZlIGFueSByZWFsIGZ1bmN0aW9uYWwgaW1wYWN0Li4uDQoNCg0KSUlSQyBpdCdzIGJlY2F1
c2Ugbm8gZXF1aXZhbGVudCB4ZV9scmNfcmluZ19oZWFkIGZ1bmN0aW9uIGV4aXN0cyB0bw0KcmVh
ZCB0aGUgbHJjIHJpbmcgdGFpbC4gIEl0J3MgbGlrZWx5IHRoYXQgSSBqdXN0IG1pc3NlZCB0aGUg
ZnVuY3Rpb24gdG8gcmVhZA0KdGhlIHRhaWwsIHNvIGlmIHlvdSBrbm93IHdoYXQgdGhlIGZ1bmN0
aW9uIGlzLCBJJ2xsIHJlcGxhY2UgdGhlIGludGVybmFsDQpjYWxsIHdpdGggdGhlIHByb3BlciBm
dW5jdGlvbmFsIGNhbGwgZm9yIHRoZSBuZXh0IHJldmlzaW9uLg0KDQpBbHRlcm5hdGl2ZWx5LCBz
aG91bGQgSSB1c2UgdGhlIGludGVybmFsIHZhcmlhYmxlIGZvciBib3RoIGhhbHZlcyBvZg0KdGhl
IGNvbXBhcmlzb24/DQotSm9uYXRoYW4gQ2F2aXR0DQoNCg0KPiANCj4gVGhhbmtzLA0KPiBTdHVh
cnQNCj4gDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBiYW4gPSB0cnVlOw0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9DQo+ID4g
Kw0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoYmFuKSB7DQo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzZXRfZXhlY19xdWV1
ZV9iYW5uZWQocSk7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqB4ZV9ndWNfZXhlY19xdWV1ZV90cmlnZ2VyX2NsZWFudXAocSk7DQo+ID4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9DQo+ID4gwqDCoMKgwqDCoMKgwqDCoH0NCj4gPiDC
oH0NCj4gDQo+IA0K
