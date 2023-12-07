Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEFEC10DC3
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 14:02:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C01B310E1EE;
	Thu,  7 Dec 2023 14:02:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A62910E89C
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 14:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701957718; x=1733493718;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=GkbZjLQ0B2yTIJxF/sBv+1XYx3zd2me0Ui1PKMr6CHU=;
 b=T1ued3/kGtXIG4HQ/ugTMzJRLbEvY14sKyqdunpJJYn9MDyROuzv5rC5
 NziBmrLg4vyeKHoZpRXKMbezjQawxCPuGP3PFta97BVm/Dw88KPF0lOAu
 LawP8th2GbAMiiYfr8R9F50HOkVyeypsZeXAG/fealwNXqTQatpRZ2wFr
 TMdalfCYlPIuD1PC7H+v3sPvt0NGPa5vtqTXSXkpRJ1sjmTQ4DsF+vpRg
 vHGAiuXkSn2p82JRNlg5RX0oomvm8Nn3OyqcVYooHSlxH04mLMWTJDQYY
 3091xG+mLBQBhC4OA5MviQEXHcWOsC6sW8FU0/5+sgZsMF25opaUaGoBO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1114081"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1114081"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 06:01:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="13118550"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 06:01:57 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 06:01:56 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 06:01:56 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 06:01:56 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 06:01:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OzPZ0y6y7OdpxZU/9dmIxIwYgIzJbAOljNztm2ZaPClslwPde1wEJSsCGud3tz1Q8xrvxivVN0zvVz0SjOE7QPIzCq9plfImglXOhNZJaTrD4etG6p0TU5TSpfZ1Ti48FJcJIfc9MEsA34lBoGy7OMBeyrcAk5MPuX2YP2OCvFvQPws/6ptK2032L2HDBluEg9VNz/WmHHka++HxIdOYbwVcn8i5Zak1JYK/BpdXUQMm97uLJ54wFQnwL6zh9sfwYjbjJzvdmxg/GPvtyzl5qTQ70ovT7EFrzBkIc10zrZBrUh4ArNpNfFWmq1ICsh7Y7QPahTWYmrACxUCMeJzR3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GkbZjLQ0B2yTIJxF/sBv+1XYx3zd2me0Ui1PKMr6CHU=;
 b=Vzg23tGOvZmjaVj4xGqg0CU3aw1xnay4t10/hYp7O4nS2MViMqEOSL/PD6OA8YFRINMc97nVtdMNLqa04zK/znDN8EcF7Nr1Sn+zsJAHOQr2kYK/6hgmTvHuCl/1JuMYY7Uy6YuwBvQWXP3S+qrNZKKEiRJgudgCWjObS05hJwu59ZlxIMejL30CVM0PNYlHZMNasGEuliYhDVyHT+Gm3dRj0R6pTGHCSNlKdBtNK49u8Bnz2+4FA+t4TYatXXBbfCUbtcVJTpHj2SMY8WzPu6fCg3973MPsksG4/Y5JXVrfrDckVsIpVUd2O0snYBWcVuCQeGj2OkjDRrCM5cXQIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by BN9PR11MB5371.namprd11.prod.outlook.com (2603:10b6:408:11c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 14:01:49 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf%7]) with mapi id 15.20.7068.025; Thu, 7 Dec 2023
 14:01:49 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
Subject: Re: [PATCH v1 11/14] drm/xe/uapi: Add block diagram of a device
Thread-Topic: [PATCH v1 11/14] drm/xe/uapi: Add block diagram of a device
Thread-Index: AQHaKRRtmHTK3BsRik+dAsY9IWRB77Cd2ayA
Date: Thu, 7 Dec 2023 14:01:49 +0000
Message-ID: <f99379694f13f4ebff6e4e2cb435a6afffcdb4c3.camel@intel.com>
References: <20231207135009.7-1-francois.dugast@intel.com>
 <20231207135009.7-12-francois.dugast@intel.com>
In-Reply-To: <20231207135009.7-12-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|BN9PR11MB5371:EE_
x-ms-office365-filtering-correlation-id: 2ad1a4a9-ef59-4e49-f10a-08dbf72d0e8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C3r3x+Hv5eZNzwlGpIUN7ffPZxfwwt5ppiVqkvJjqllccyByf41EkxfIYITSrbhBeUEG5GGateIbROI2v36hTOzAkkjAEfg5ItaM4YH9ZFxw0Q09PUpM0U1uEZRx2AXPFb+bFz8zMpvDbN9NWdLk7jMflgTLwea8xhT6vRIPhE2lKWXP19ErZARhfrAxrwA6PHQ+SYZ5XnkoGApRp0WsoPNTxEvZ+zSvZBxOD9fv6F1w6fxwci6xEJQ/68nGF8EDqqKAa1Q0BlGMeRdHsqyE2ahufRkIYHcrNLoOw3LqE9o5xfRx8ug7kcFumGWiVsJjNSLbIREvU+PE76ge+upUU6dbf38M96rcy0XMTcXpT0XGXmbrV9YomkEZgWLB76f7AmnV08LJTPCEf0HKoIYS5DYMJ9lsG4EpjKIDH7HMWePsqnPewjsh6msvpSxydu0IOsL0drLoBf1Sl0kyaU3W7dGKOLHU5VjQAp+ozZR6kTnAwbn+ZHprTiX0l/iT6uaH+qVNVh3DBZLdnEv1+6jYkQzJAW86Uh2orQt2L5F0AKLUpRN6M0KXJ+Ng0j3+gVzGyUWOyxlf8I1i5JBLjyBERjAh/JxKvMV0F4zUNfWX9mdAP4Vg/Bg5xn0pPiXosAAZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(39860400002)(346002)(396003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(82960400001)(71200400001)(6512007)(6506007)(122000001)(110136005)(316002)(86362001)(8676002)(8936002)(66476007)(66556008)(66946007)(64756008)(66446008)(6636002)(91956017)(76116006)(83380400001)(2616005)(26005)(6486002)(38100700002)(478600001)(2906002)(5660300002)(36756003)(41300700001)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHB3QWZRajB4SDh3UEpHR2M0cjkySW5KeFlNaUpYM014UFpGU3lmdTEzTnNI?=
 =?utf-8?B?TXR1c0t5NVllc215SFAvM0VuK3JDRFhCakx1R1ZOdFUvTFhiYzJib1JoZTlj?=
 =?utf-8?B?VjA4L3NSR3F4M0xjWlJKNk1wUmM0NERGZzNmbEZHWjF2UzV3OU1seUFKeWJT?=
 =?utf-8?B?MFUxV0ZPdWFKZ3dUVGw2cVJoMkpLTHNnRmlFT0hIVHhNMlkrZG9TUHNMdTZj?=
 =?utf-8?B?TVV2R1Avdk1hK2JLWWZDWWIrdTdxanVpYTRmUUluV2lyMktXUFppVGxYdFV1?=
 =?utf-8?B?dElXNTlyb2EyOHJvc0Y1YTBYTnRPUGtJb0hxS1NQZ012UE1PTUxLN1JDWmJC?=
 =?utf-8?B?Tko3elVsZmRFYmNrMXhZTHYzaWtsSWwzYXZtR0s2MlE1UTI0N2VJcHFadHg3?=
 =?utf-8?B?aU0zazY5RUZXT3FzNlVpWGtvVVdqb1d3RUJRR1pNWEN3SmYreVZoUW03dFJD?=
 =?utf-8?B?c2QrWVdBeUdwN2JIdjJ6NzlwNllqdTJzQTIyRGQ4OVNCSnh3ZVp5c0RrQmt4?=
 =?utf-8?B?OFFBL1BGalM5KzVWc29sdDEzR2hrQ0Y4bjg3NUpCM2VVZ2t2b253em1mRU9a?=
 =?utf-8?B?RGQwOUZ5ZGtocGg0Qkt5Z0s2MWpQWXJZS0RtaGNRVWNDSDNwSElBc21ldlhu?=
 =?utf-8?B?WnNLMWRwWnFNSVBhV0pKWWN2V3Fubm13U3lESmRTYmg3MEhta2txU3R4Wk5S?=
 =?utf-8?B?MUtHWWhsYkYxSFMxRVEyRkNwNk5ILzdvWVZEWlByNytYeHU0MjlOTzJXc2VJ?=
 =?utf-8?B?anpvN3NwbFlDVlpRVk1VdVQ0VzRQQzQwSjl5NFJZcTNJTUVIYWQxTjZpeWlV?=
 =?utf-8?B?ejQrMkcxNkF4cFNDN3Zwb1JnVEhNSWtZL0tXUlNhNUNCQklUTjJHcUhUSy9y?=
 =?utf-8?B?WDhmRWs5WnpxUXRXOUY2SzVkTjJCMzZ0NGtvYWlTKzJIZmRjbmVKMWhOSXha?=
 =?utf-8?B?MmFCZktVRHdRVkRqLzBSbTlDWVQyUEpSekpobklrOC84YkF6aEFxRXZFeFV1?=
 =?utf-8?B?czdnOGREMDJycThQWXY5ME5xZ21HMFFCNFNvYmxKaHJEZmRocWNlYWE4U2pK?=
 =?utf-8?B?TWtQbkxBcnY4WTlkWEZub3lKTkdzbk5rRjJCRENSMjNiNE5JOGNUaGhXaXEy?=
 =?utf-8?B?aUI4dkVCeDFncEJSN0NNeUMxSUszV2JBRW9LWC9sSzRLelUrZzFSSjZyN2pH?=
 =?utf-8?B?eXd5bEVSVmFvMGpmbjVZSU0xVU9FUFJSM3pTaUxPVXp3YkJZUmhkRzFaa2hs?=
 =?utf-8?B?R1lSS0VoNzcwVmpFTVk0SEV2aUlxdDBzaVAyczBRWStGS2FpcStRem11Nk9K?=
 =?utf-8?B?R1I1QVpwV3E4Yk5ieVE4REhVNlBvanN2WUZlc3dkR1JGKzBVL1BOaFFUOWlx?=
 =?utf-8?B?WEsxNVhOSlJEemd2cUlGeW9iTkhWT0tpUmhLR2hyMWNsSTM4NGRnWGdhMFZM?=
 =?utf-8?B?cFlUeHNoaTZCbUFyaTJGZjcxYURKMmxoMEppbTFkYzEveW8rdHd5OUEvZXpV?=
 =?utf-8?B?TzJEU0YvK3hlaU5kSVNqVkM3YVNvQTA4WTliYTlCbkxYRGpDNzNuMFRyTER1?=
 =?utf-8?B?ZDRSV3RPNkI3RDd1ZXZha0dlWGRhWnhNbWtreStqWlNrWUV4WTFpWkM1cUtW?=
 =?utf-8?B?RTMzVVB5ZlNzaXlUVkN6dDE5S1ZHZmJLNUtkdm10K2JWSHF2TEtudS90WDBQ?=
 =?utf-8?B?OTRmMTBWc3BVS1Z2Tnl0U1NtOGIxaVBuL3dId1F0VmZTdXNvdEVYbm5OSGlG?=
 =?utf-8?B?d0RnbDVyOXEwbUN3My9IOHV1cUFrdnY0bDYxQnpYT0h6RDZ1dG10emdtcFFL?=
 =?utf-8?B?azYrdDF4SEhoWUU3dTJEUDM0ejBaeEV4NVBvSERBR1o1RjlkclRYaUYwT2tJ?=
 =?utf-8?B?cklXYzVwbW92MVd4a2FDUlV0SjE0K3V5amt3bFRjcFI2VUd3dVNqWUVKakVu?=
 =?utf-8?B?N0c1Z3pXL2x0eGRUSW5qazBhVERjQnpmVUJQakRHOTlGd0hvSzlRRmZZYTJH?=
 =?utf-8?B?RHQraXZhMkRzOXhBR1RQN2cwMHFDQkJYSGpIV1loTXNMMHEvQjZWRzFFeDBj?=
 =?utf-8?B?ZDVJWFdWamlRM1Z4ZzZWQ2dKeUVsNHcxNUdQSHlUdDI5N3RQWTZvd0FqWjVo?=
 =?utf-8?B?NEp3dU0wdlRxeTRQMVE1M0M0NnloVytaWUJDYnp6Vlg5M29ZQURGUFY4aVU2?=
 =?utf-8?B?VGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E54FCA5B37551C429C5980028F173249@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ad1a4a9-ef59-4e49-f10a-08dbf72d0e8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2023 14:01:49.2526 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lgkLqF5+uaoKOf9BC+vTb/QJF0W+0kQVImniDoU9cDf/ZTLiGn1Rb9FzObu2T71lHVbwW3Cdk2QlVkMDh56Mjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5371
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

T24gVGh1LCAyMDIzLTEyLTA3IGF0IDEzOjUwICswMDAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
Cj4gSW4gb3JkZXIgdG8gbWFrZSBwcm9wZXIgdXNlIHRoZSB1QVBJLCBhIHByZXJlcXVpc2l0ZSBp
cyB0byB1bmRlcnN0YW5kCj4gc29tZSBrZXkgY29uY2VwdHMgYWJvdXQgdGhlIGRpc2NyZXRlIEdQ
VSBkZXZpY2VzIHdoaWNoIGFyZSBzdXBwb3J0ZWQKPiBieSB0aGUgWGUgZHJpdmVyLiBGb3IgZXhh
bXBsZSwgc29tZSBzdHJ1Y3RzIGRlZmluZWQgaW4gdGhlIHVBUEkgYXJlIGFuCj4gYWJzdHJhY3Rp
b24gb2YgYSBoYXJkd2FyZSBjb21wb25lbnQgd2l0aCBhIHNwZWNpZmljIHJvbGUuCj4gCj4gVGhp
cyBkaWFncmFtIGhlbHBzIHRvIGJ1aWxkIGEgbWVudGFsIHJlcHJlc2VudGF0aW9uIG9mIGEgZGV2
aWNlIGhvdyBpdAo+IGlzIHNlZW4gYnkgdGhlIFhlIGRyaXZlci4gQXMgd3JpdHRlbiBpbiB0aGUg
ZG9jdW1lbnRhdGlvbiwgaXQgZG9lcyBub3QKPiBpbnRlbmQgdG8gYmUgYSBsaXRlcmFsIHJlcHJl
c2VudGF0aW9uIG9mIGFuIGV4aXN0aW5nIGRldmljZS4gQSBsb3QKPiBtb3JlIGluZm9ybWF0aW9u
IGNvdWxkIGJlIGFkZGVkIGJ1dCB0aGUgaW50ZW50aW9uIGZvciB0aGUgb3ZlcnZpZXcgaXMKPiB0
byBrZWVwIGl0IHNpbXBsZSwgYW5kIGdvIGludG8gZGV0YWlsIGFzIG5lZWRlZCBpbiBvdGhlciBz
ZWN0aW9ucy4KPiAKPiB2MjogQWRkIEdUMSBpbnNpZGUgVGlsZTAgKEpvc8OpIFJvYmVydG8gZGUg
U291emEpCj4gCgpSZXZpZXdlZC1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6
YUBpbnRlbC5jb20+Cgo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIER1Z2FzdCA8ZnJhbmNvaXMu
ZHVnYXN0QGludGVsLmNvbT4KPiAtLS0KPiAgaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCB8IDM5
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgMzkgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL3hl
X2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaAo+IGluZGV4IDczZTlkMDBhMjExMS4u
YjUxMTdiYzFmMTNjIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgKPiAr
KysgYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oCj4gQEAgLTI1LDYgKzI1LDQ1IEBAIGV4dGVy
biAiQyIgewo+ICAgKiAgIDYuIFBNVQo+ICAgKi8KPiAgCj4gKy8qKgo+ICsgKiBET0M6IFhlIERl
dmljZSBCbG9jayBEaWFncmFtCj4gKyAqCj4gKyAqIFRoZSBkaWFncmFtIGJlbG93IHJlcHJlc2Vu
dHMgYSBoaWdoLWxldmVsIHNpbXBsaWZpY2F0aW9uIG9mIGEgZGlzY3JldGUKPiArICogR1BVIHN1
cHBvcnRlZCBieSB0aGUgWGUgZHJpdmVyLiBJdCBzaG93cyBzb21lIGRldmljZSBjb21wb25lbnRz
IHdoaWNoCj4gKyAqIGFyZSBuZWNlc3NhcnkgdG8gdW5kZXJzdGFuZCB0aGlzIEFQSSwgYXMgd2Vs
bCBhcyBob3cgdGhlaXIgcmVsYXRpb25zCj4gKyAqIHRvIGVhY2ggb3RoZXIuIFRoaXMgZGlhZ3Jh
bSBkb2VzIG5vdCByZXByZXNlbnQgcmVhbCBoYXJkd2FyZTo6Cj4gKyAqCj4gKyAqICAg4pSM4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSQCj4gKyAqICAg4pSCIOKUjOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUkCDilIzilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lJAg4pSCCj4gKyAqICAg4pSCIOKUgiAgICAgICAg4pSM4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSQICAg4pSM4pSA
4pSA4pSA4pSA4pSA4pSQICAgICAgIOKUgiDilIIg4pSM4pSA4pSA4pSA4pSA4pSA4pSQIOKUgiDi
lIIKPiArICogICDilIIg4pSCICAgICAgICDilIIgICAgICAgICBWUkFNMCAgICAgICAgIOKUnOKU
gOKUgOKUgOKUpCAuLi4g4pSCICAgICAgIOKUgiDilIIg4pSCVlJBTTHilIIg4pSCIOKUggo+ICsg
KiAgIOKUgiDilIIgICAgICAgIOKUlOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
rOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUmCAgIOKUlOKUgEdUMeKUgOKUmCAg
ICAgICDilIIg4pSCIOKUlOKUgOKUgOKUrOKUgOKUgOKUmCDilIIg4pSCCj4gKyAqICAg4pSCIOKU
giDilIzilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilLTilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilJAg4pSCIOKUgiDilIzilIDilIDilLTilIDi
lIDilJAg4pSCIOKUggo+ICsgKiAgIOKUgiDilIIg4pSCIOKUjOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUkCAg4pSM4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSQIOKUgiDilIIg
4pSCIOKUgiAgICAg4pSCIOKUgiDilIIKPiArICogICDilIIg4pSCIOKUgiDilIIg4pSM4pSA4pSA
4pSQIOKUjOKUgOKUgOKUkCDilIzilIDilIDilJAg4pSM4pSA4pSA4pSQIOKUgiAg4pSCIOKUjOKU
gOKUgOKUgOKUgOKUgOKUkCDilIzilIDilIDilIDilIDilIDilJAg4pSCIOKUgiDilIIg4pSCIOKU
giAgICAg4pSCIOKUgiDilIIKPiArICogICDilIIg4pSCIOKUgiDilIIg4pSCRVXilIIg4pSCRVXi
lIIg4pSCRVXilIIg4pSCRVXilIIg4pSCICDilIIg4pSCUkNTMCDilIIg4pSCQkNTMCDilIIg4pSC
IOKUgiDilIIg4pSCIOKUgiAgICAg4pSCIOKUgiDilIIKPiArICogICDilIIg4pSCIOKUgiDilIIg
4pSU4pSA4pSA4pSYIOKUlOKUgOKUgOKUmCDilJTilIDilIDilJgg4pSU4pSA4pSA4pSYIOKUgiAg
4pSCIOKUlOKUgOKUgOKUgOKUgOKUgOKUmCDilJTilIDilIDilIDilIDilIDilJgg4pSCIOKUgiDi
lIIg4pSCIOKUgiAgICAg4pSCIOKUgiDilIIKPiArICogICDilIIg4pSCIOKUgiDilIIg4pSM4pSA
4pSA4pSQIOKUjOKUgOKUgOKUkCDilIzilIDilIDilJAg4pSM4pSA4pSA4pSQIOKUgiAg4pSCIOKU
jOKUgOKUgOKUgOKUgOKUgOKUkCDilIzilIDilIDilIDilIDilIDilJAg4pSCIOKUgiDilIIg4pSC
IOKUgiAgICAg4pSCIOKUgiDilIIKPiArICogICDilIIg4pSCIOKUgiDilIIg4pSCRVXilIIg4pSC
RVXilIIg4pSCRVXilIIg4pSCRVXilIIg4pSCICDilIIg4pSCVkNTMCDilIIg4pSCVkNTMSDilIIg
4pSCIOKUgiDilIIg4pSCIOKUgiAgICAg4pSCIOKUgiDilIIKPiArICogICDilIIg4pSCIOKUgiDi
lIIg4pSU4pSA4pSA4pSYIOKUlOKUgOKUgOKUmCDilJTilIDilIDilJgg4pSU4pSA4pSA4pSYIOKU
giAg4pSCIOKUlOKUgOKUgOKUgOKUgOKUgOKUmCDilJTilIDilIDilIDilIDilIDilJgg4pSCIOKU
giDilIIg4pSCIOKUgiAgICAg4pSCIOKUgiDilIIKPiArICogICDilIIg4pSCIOKUgiDilIIg4pSM
4pSA4pSA4pSQIOKUjOKUgOKUgOKUkCDilIzilIDilIDilJAg4pSM4pSA4pSA4pSQIOKUgiAg4pSC
IOKUjOKUgOKUgOKUgOKUgOKUgOKUkCDilIzilIDilIDilIDilIDilIDilJAg4pSCIOKUgiDilIIg
4pSCIOKUgiAgICAg4pSCIOKUgiDilIIKPiArICogICDilIIg4pSCIOKUgiDilIIg4pSCRVXilIIg
4pSCRVXilIIg4pSCRVXilIIg4pSCRVXilIIg4pSCICDilIIg4pSCVkVDUzDilIIg4pSCVkVDUzHi
lIIg4pSCIOKUgiDilIIg4pSCIOKUgiAuLi4g4pSCIOKUgiDilIIKPiArICogICDilIIg4pSCIOKU
giDilIIg4pSU4pSA4pSA4pSYIOKUlOKUgOKUgOKUmCDilJTilIDilIDilJgg4pSU4pSA4pSA4pSY
IOKUgiAg4pSCIOKUlOKUgOKUgOKUgOKUgOKUgOKUmCDilJTilIDilIDilIDilIDilIDilJgg4pSC
IOKUgiDilIIg4pSCIOKUgiAgICAg4pSCIOKUgiDilIIKPiArICogICDilIIg4pSCIOKUgiDilIIg
4pSM4pSA4pSA4pSQIOKUjOKUgOKUgOKUkCDilIzilIDilIDilJAg4pSM4pSA4pSA4pSQIOKUgiAg
4pSCIOKUjOKUgOKUgOKUgOKUgOKUgOKUkCDilIzilIDilIDilIDilIDilIDilJAg4pSCIOKUgiDi
lIIg4pSCIOKUgiAgICAg4pSCIOKUgiDilIIKPiArICogICDilIIg4pSCIOKUgiDilIIg4pSCRVXi
lIIg4pSCRVXilIIg4pSCRVXilIIg4pSCRVXilIIg4pSCICDilIIg4pSCQ0NTMCDilIIg4pSCQ0NT
MSDilIIg4pSCIOKUgiDilIIg4pSCIOKUgiAgICAg4pSCIOKUgiDilIIKPiArICogICDilIIg4pSC
IOKUgiDilIIg4pSU4pSA4pSA4pSYIOKUlOKUgOKUgOKUmCDilJTilIDilIDilJgg4pSU4pSA4pSA
4pSYIOKUgiAg4pSCIOKUlOKUgOKUgOKUgOKUgOKUgOKUmCDilJTilIDilIDilIDilIDilIDilJgg
4pSCIOKUgiDilIIg4pSCIOKUgiAgICAg4pSCIOKUgiDilIIKPiArICogICDilIIg4pSCIOKUgiDi
lJTilIDilIDilIDilIDilIDilIDilIDilIDilIBEU1PilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilJggIOKUgiDilIzilIDilIDilIDilIDilIDilJAg4pSM4pSA4pSA4pSA4pSA4pSA4pSQIOKU
giDilIIg4pSCIOKUgiDilIIgICAgIOKUgiDilIIg4pSCCj4gKyAqICAg4pSCIOKUgiDilIIgICAg
ICAgICAgICAgICAgICAgICAgICAgIOKUgiDilIJDQ1MyIOKUgiDilIJDQ1MzIOKUgiDilIIg4pSC
IOKUgiDilIIg4pSCICAgICDilIIg4pSCIOKUggo+ICsgKiAgIOKUgiDilIIg4pSCIOKUjOKUgOKU
gOKUgOKUgOKUgOKUkCDilIzilIDilIDilIDilIDilIDilJAg4pSM4pSA4pSA4pSA4pSA4pSA4pSQ
ICDilIIg4pSU4pSA4pSA4pSA4pSA4pSA4pSYIOKUlOKUgOKUgOKUgOKUgOKUgOKUmCDilIIg4pSC
IOKUgiDilIIg4pSCICAgICDilIIg4pSCIOKUggo+ICsgKiAgIOKUgiDilIIg4pSCIOKUgiAuLi4g
4pSCIOKUgiAuLi4g4pSCIOKUgiAuLi4g4pSCICDilIIgICAgICAgICAgICAgICAgIOKUgiDilIIg
4pSCIOKUgiDilIIgICAgIOKUgiDilIIg4pSCCj4gKyAqICAg4pSCIOKUgiDilIIg4pSU4pSARFNT
4pSA4pSYIOKUlOKUgERTU+KUgOKUmCDilJTilIBEU1PilIDilJggIOKUlOKUgOKUgOKUgOKUgOKU
gEVuZ2luZXPilIDilIDilIDilIDilIDilJgg4pSCIOKUgiDilIIg4pSCICAgICDilIIg4pSCIOKU
ggo+ICsgKiAgIOKUgiDilIIg4pSU4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSAR1Qw4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSYIOKUgiDilIIg4pSU4pSA
R1Qy4pSA4pSYIOKUgiDilIIKPiArICogICDilIIg4pSU4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSAVGlsZTDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilJgg4pSU4pSAIFRpbGUx4pSA4pSA4pSYIOKUggo+ICsgKiAgIOKUlOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgERldmljZTDilIDilIDilIDilIDilIDilIDilIDilKzilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lJgKPiArICogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIOKU
ggo+ICsgKiAgICAgICAgICAgICAgICAgICAgICAgIOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUtOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgCBQQ0kgYnVzCj4gKyAqLwo+ICsKPiAgLyoqCj4gICAqIERPQzog
WGUgdUFQSSBPdmVydmlldwo+ICAgKgoK
