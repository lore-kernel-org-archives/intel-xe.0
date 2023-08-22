Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D772EE4993
	for <intel-xe@archiver.kernel.org>; Tue, 22 Aug 2023 14:52:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D4910E380;
	Tue, 22 Aug 2023 14:52:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFDB10E380
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Aug 2023 14:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692715922; x=1724251922;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=SsgrVRWGVTPZlZN/hW7DhMGLUO2PBQrp0SsVFxdcMaQ=;
 b=Y6hZuR2jVrJM206KZZp4eHXifSDRQxa250mVPE5G81T39KoRKTONQ3TZ
 2zCcOKaRTlT4uV6LL+Ti0BJGxjSPF8X2R2IgdPCAldXzFk1GD2G+v/pc1
 ZVsTPv6Wxlu1l6lwZSMCBKso7zk/BBY42sK5Yux9zg+ri5JDYJsKeaLcc
 x1heusrVOKMn3eGA1jW4nzh/6x78bO8vmwNnuj59+xovwv4G0HCGN2Hs8
 qAtv6gJwYjfE3zE5cORrygkth0d9x+KEfPftsI75CqWVIHnIJwkd3/HJD
 C22HZjEf9wItcR4ie5HKup83fpaKaS/LMulldUvhdvHcS0RPb5W7RcAdP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="377658003"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="377658003"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 07:51:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="713186152"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="713186152"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 22 Aug 2023 07:51:58 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 07:51:58 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 07:51:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 22 Aug 2023 07:51:57 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 22 Aug 2023 07:51:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJ6iVHAIDhFdCYJN2NTCPnlaMeiDHEuu2ragmx2bLS6eZ6JR7qDuBLQMkv9dTv+IOzmC4UGuho/NoF/LS2Jtes6AVGqdiVC7sWFIEDa8Su24WRAVFrKZ71HdBYUzAGu4MO/7BnjW+6GYAqnADEf8w72/bf1iDmKwvfTbaOx1kTYoU0zA46Ng6telKV0ip8LWiPotplm8jOgYxw6x2vDsidy/57VTcH/4rDPpeslOXgb025/GCVKML4RnKUZZRT4s8yCwdMGu7aCxhyo0VXT11xshOd9cfPlmaVSRfOOeLCpZ4bdfhBvKG7mJm48BibV7UeJYJVc+FTZXDuzNecLzDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsgrVRWGVTPZlZN/hW7DhMGLUO2PBQrp0SsVFxdcMaQ=;
 b=JQWljnJ24gutmrHg4bgXeRti9u+eWwzCi71TRHSHohHwbJIC6gRLaNtKnxGLCM3ZdTvbQLeuLL7rU+PE8zqdD3UgOWDuDiKrxmRA4QubeAyD/VEpA420rr82uOv6NWn4EdjNzzYwxktJqf8vsWs2327NA/H/GYxhjhknlMCcQ5WPy5dMT3Hb/8cgsBdejD+u6mS+vNdZg/SX5/GIrXdSa4Hn9A+cB2jsM72bnOZZwx8JMa6nV21CKfYXJhaN+H3uqHWByq1PRz/F2s5orpgJMnRsNQgmzj3i4Z8ssyrcKXwKLKbVtX1PLI9/jWfWWZnzEAdw6zC9U/wJKj65GRwKJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SA1PR11MB7130.namprd11.prod.outlook.com (2603:10b6:806:29f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Tue, 22 Aug
 2023 14:51:55 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8e21:274a:64d1:5de]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8e21:274a:64d1:5de%4]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 14:51:55 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH 2/2] drm/xe: Drop xe_mmio_write64()
Thread-Index: AQHZ1IlW5c+z2z9YRUy21HycbNaJJK/2XGIAgAAAtQCAAAo2gA==
Date: Tue, 22 Aug 2023 14:51:55 +0000
Message-ID: <efe65c1d556539d94fee3775c34726f93f03d9d1.camel@intel.com>
References: <20230821234322.758689-3-matthew.d.roper@intel.com>
 <20230821234322.758689-4-matthew.d.roper@intel.com>
 <d6uoulsbl5l7uibznwqy6jkrcp2yctoryre67xn5pa4znolrb6@skw5zmgvydtm>
 <fgxtgocqv5zi62fhwmnck52xi2ytmthy6i6ssmvefaovycvuxa@7qe6igl4mbbe>
In-Reply-To: <fgxtgocqv5zi62fhwmnck52xi2ytmthy6i6ssmvefaovycvuxa@7qe6igl4mbbe>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SA1PR11MB7130:EE_
x-ms-office365-filtering-correlation-id: da54404d-4014-49b5-cdce-08dba31f541c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 42rX2nPakS0BoYWNu6byC0BGWCcUOtnydWzNMb22PEbNZx21ypW9Dj6w159AP2tPl4TDTKAETn3Yj2RUdHGuXsyUWKh+gD7kaQQcrruRnLn9rioC2AxufTFrWCIaywHDn/bN1Z1XUZ9C3KECVIm8+6iFxbVg2C6Dx9eYLVNU8po6U26T+VUtoILzdcgQkzzv0IusOFgm4crI8GLNjcauCTfsl7VWOjE9vOA8NXcnHBDe+JKu7QMC0v6OBf57XSZzdrb6Gf0ILTWtz4eDRSSgmwXDtjktzVYdSRPpgQmPibehB7gEZAHAFNN1JpuSUy4I+8zW8a3Gl+RI61+sVv3iHYxtxfawb7BexNwvyatKUruOUZd1fyRoF5EHNxX0Cx4bnl1F5SgUaVDJfNycHNt1cbUjxMYPsijEZHxQEh/2infP1z3Mi8430ccWv8k7mz6XZIqMOtwmwV3xV/BX+jU2RJXm2lbGbfxTTnD2Eq1RyZzV83G8AK87yMk0gquvXUZZGK5+2P/iaDKHvFSVbJVuxchlohzINTcVChOkvHKxl2ABEoYIfjt1Bcj07CJ4R5hCFWvVspJHQ8xqyRxckBg33UrFcEH0pfuoVcvJwMstjf92QSv2sDM6deC2lL5KeQNk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(346002)(136003)(366004)(396003)(451199024)(1800799009)(186009)(66946007)(91956017)(316002)(110136005)(64756008)(6636002)(76116006)(122000001)(66446008)(66476007)(5660300002)(41300700001)(66556008)(38100700002)(38070700005)(4326008)(8676002)(8936002)(82960400001)(26005)(2906002)(83380400001)(478600001)(86362001)(6512007)(71200400001)(2616005)(6486002)(6506007)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MW5acGZ6MFo5dWZTV2RFVThuMDI4VXZaYkMyTUtUcmlBWVU2UTR4ZHpqT2hZ?=
 =?utf-8?B?S1JJU3pXY085NHdnS01teGFWMmlKTzRSMXlGZ25BUEh6V1dHckF3WTFudVJv?=
 =?utf-8?B?eVJjaldacVRGNXNmUHJyUWpVSVhpTUFreXlWUnkyZ1RoUThhcW11eTNsYlZa?=
 =?utf-8?B?TmNTeWdwVU1ucGhHMzYwSDJwckJmWndzdmd6M3VMRkhKbmcwbHlIcmpnS2Nn?=
 =?utf-8?B?eWo1YStmWGlEd0tJNURwaTQ2eHg3V25HbnZqd3FBTVBJT1dWTDhySjAyVHRw?=
 =?utf-8?B?b05UMlcyZlM5Qm9LcGsvOGVzWHJ0eUZibzZoVlRYYXgrVWkrZ29zeGhPcW00?=
 =?utf-8?B?WkllRzZXUDR4M1dmblhWUFZubGk2a1Bua1lwL2NjcEk4a2dRNG5HbDR5OWZv?=
 =?utf-8?B?djRVR2NZUmdGdHNsV29BT2U2a25wWm1YdjVjaldDc0lmV280dC8wYjg2aGRi?=
 =?utf-8?B?YzJ5Q0M1UXFGbUNIclkveE84SlkrL1lrZWlPU2tOK3pPU01uWjI5SW1xd0pU?=
 =?utf-8?B?TVpPTzY0Y2oraW16eVZONnFKaEtLOHpyeEFNUTFRczc2eHhVZ3U4akg4RTJH?=
 =?utf-8?B?V0lSUDFnTnFwSGJjeEE2OFdWeXduejhBK25BMFdscG5ldnhIeFdZV1EwMlFL?=
 =?utf-8?B?V2NmZGZlTEZxOXJiYmhmZ003NEcrQ25BZkpCVStLWld6cTZsbVJVSzhvWGtq?=
 =?utf-8?B?UzhHZE5tMWZQMFd2cExRazVCYlZ5QkJRNE14UFQ1Z1FtTUpnWlBLM0FnL1Jk?=
 =?utf-8?B?b1dIMmRuYTEvSFBMV3RBK3pmek11MnF6SitoZDdWc0dPVGN0K0ZCRlFhKzNV?=
 =?utf-8?B?OFBwSm1sS3h1UGQ0dDhCQlFwaDZqUmFFaktJZ0NvSUw0UkZRR0xXeDNqMVlV?=
 =?utf-8?B?L2U5TExrVUdxS2pUNGh6TU5nc0N5VWhkM3lIa0M1TzE0NWNnSWpWUmRxcy90?=
 =?utf-8?B?UEhDUXN5Qm5mNlFTaEkxa09xOE9UN3UyUG9rR1hIRnl6UjJxTEtPRm9IV2cz?=
 =?utf-8?B?UGxRcE5tbTNUWlU2Q2pNMnVIYkRIMmVOYjhKdFBkOW5XK25EUWNrTnFZR0to?=
 =?utf-8?B?QXNEMWJHZFozcldaTHpnZUdaS21BbEd1SW1uQ1JUYzdLUlV3MXRxd0cxd1Rx?=
 =?utf-8?B?aVdGeXYzOFVyeURxeU5kYXZCVHlvYU1ZTXYxVkVqeVZscVM5cVEvK1loWXBi?=
 =?utf-8?B?R1BrV0hpbEpCL2VlR08reEFUL0U1VUczTE5VRFN4T3A2ZVF5S25JbVVJTElv?=
 =?utf-8?B?MTlUek90MnFLL3R5YmR6RjZGZURhK2UzZFhDMDZDYmNkUmh4NGZueTNsenFY?=
 =?utf-8?B?RjBIbmc4dTRhZUlMdFR4NnMycHVnSENTYUlLY0tGM1cvUXo4MldsNElqY0d3?=
 =?utf-8?B?QlVrVHFyeFBUcDlEcW12dEE2STdZQjlzdVNUWktFVEF1TTFQdTdDaENPb0Q2?=
 =?utf-8?B?WDllRytzV3hnSTg1Wi9Ub25RRDlrNkE0TGluME15SjhxUHJJR0pEN1NYcWtW?=
 =?utf-8?B?czdZMEJ4SGwvZXQxYUl1RUthN0tBZWxURmNTSnlYWWF5MEtrbjQzZGhJcTg1?=
 =?utf-8?B?MjJCeC85cmh2NUpFYmtOTkRON3hJd2VOOHJlVmZIY01HK2VKWXFvNmpqYzh6?=
 =?utf-8?B?TFRpcXBYRmNHMkl6YWl1ajFzaGNIdmJqSmR5OTVwTUdZWFZ3YUNlTzRCMDla?=
 =?utf-8?B?QnFJdCtsdktQUENRUUhXOHNrVERDR0RmcnpDMkFsNGZzQVlsai9BTmI1Mjhh?=
 =?utf-8?B?MFVqYUwxQnhFV0U3ZURMMW44WHZMM0tUSmZwS3FBK252NlUrRXdkeWNFZjU1?=
 =?utf-8?B?NW8xcHc1MmhvYjE3MzVDU3ZQMHRLVlVIS2hQR0RrVDFDY0pNRk81ejAwRkpm?=
 =?utf-8?B?OVBrTDVtSk1mOHpjcXd5eEFGQUx5NFowV0VzUy9CZU01dlV0bUhoK1dhTUVB?=
 =?utf-8?B?SXZ3TzRYb0JlNnVjempNaHNFTCtxV3RhYkd3OXFzdC9kdUQ4aC9Ob0xpbzVn?=
 =?utf-8?B?NnNaSUs2Q3J0RTRsSWhsb2hVMDZ3Y3Rpb2RPRHJmS2IwT3JsL3Z5UVpGMXE0?=
 =?utf-8?B?ODIzZWhQYzJLcktIajkrNER5WGNDK2l0c0QwT3ByR3o5cWlGMUtEbHIvclE3?=
 =?utf-8?B?RVh0Q29aQUttRjFFdDA2TnBYZlNBdGZiVHZxbGRuUW4wbkk0TEU4b01YdUVN?=
 =?utf-8?B?aHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5AC23D96B66B224B83B6BB9792117E1B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da54404d-4014-49b5-cdce-08dba31f541c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2023 14:51:55.3119 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cl00Ze3kvtvFDjNELQMx0yoq8PLEEj55wPuUi9Vl0NguwrQK6DyzmkD0SsAfQEkWe/qxoNYl6kfKcV54HnXWjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7130
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Drop xe_mmio_write64()
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

T24gVHVlLCAyMDIzLTA4LTIyIGF0IDA3OjE1IC0wNzAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IE9uIFR1ZSwgQXVnIDIyLCAyMDIzIGF0IDA3OjEyOjQ4QU0gLTA3MDAsIEx1Y2FzIERlIE1h
cmNoaSB3cm90ZToNCj4gPiBPbiBNb24sIEF1ZyAyMSwgMjAyMyBhdCAwNDo0MzoyNFBNIC0wNzAw
LCBNYXR0IFJvcGVyIHdyb3RlOg0KPiA+ID4gVGhlIG9ubHkgcG9zc2libGUgNjQtYml0IHJlZ2lz
dGVyIHdyaXRlcyBpbiB0aGUgZHJpdmVyIGNvbWUgZnJvbSB0aGUNCj4gPiA+IGhpZ2hseSBxdWVz
dGlvbmFibGUgTU1JTyBpb2N0bC4gIFRoYXQgaW9jdGwncyByZWdpc3RlciB3cml0ZSBzdXBwb3J0
DQo+ID4gPiBvbmx5IG9wZXJhdGVzIGZvciB1c2Vyc3BhY2UgcnVubmluZyBhcyByb290IGFuZCBj
YW5ub3QgYmUgdXNlZCBieSBhbnkNCj4gPiA+IHJlYWwgdXNlcnNwYWNlOyBpdCBleGlzdHMgc29s
ZWx5IHRvIHN1cHBvcnQgdGhlICJ4ZV9yZWciIGRlYnVnIHRvb2wgaW4NCj4gPiANCj4gPiBtZXNh
IGFsc28gdXNlcyBpdCBmb3Igc29tZSBvcGVyYXRpb25zIHRvIGF2b2lkIHRoZSBleHRyYSBsYXRl
bmN5IG9mDQo+ID4gc2V0dGluZyB1cCBhIGJiLiBIYXZlIHdlIGNvbmZpcm1lZCBub25lIG9mIHRo
b3NlIGFjY2Vzc2VzIGFyZSA2NGI/DQo+IA0KPiBidXQgeW91IGFyZSBhY3R1YWxseSBvbmx5IHJl
bW92aW5nIHRoZSB3cml0ZSBzaWRlLCBzbyB0aGlzIGlzIGZpbmUgYW5kDQo+IHRoZSByZXN0IG9m
IG15IGNvbW1lbnQgY2FuIGJlIGlnbm9yZWQuIFNvcnJ5IGZvciB0aGUgbm9pc2UuDQoNCk1heWJl
IGFkZCBzb21ldGhpbmcgdG8gdGhlIHVBUEkgYWJvdXQgNjRiaXRzIHdyaXRlcyBub3QgYmVpbmcg
c3VwcG9ydGVkPyBub3QgZXZlcnlvbmUgaXMgZ29pbmcgdG8gcmVhZCBYZSBLTUQgc291cmNlIGNv
ZGUgdG8gZmlndXJlIGl0IGlzIG5vdA0Kc3VwcG9ydGVkLCB3aXRoIHRoYXQgYm90aCBwYXRjaGVz
IGFyZTogUmV2aWV3ZWQtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50
ZWwuY29tPg0KDQo+IA0KPiBSZXZpZXdlZC1ieTogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1h
cmNoaUBpbnRlbC5jb20+DQo+IA0KPiBMdWNhcyBEZSBNYXJjaGkNCj4gDQo+ID4gDQo+ID4gaHVt
bi4uLg0KPiA+IA0KPiA+IAltZXNhICQgZ2l0IGdyZXAgRFJNX1hFX01NSU8gLS0gJzpeaW5jbHVk
ZS9kcm0tdWFwaS94ZV9kcm0uaCcNCj4gPiAJc3JjL2ludGVsL2NvbW1vbi94ZS9pbnRlbF9nZW0u
YzogICAgICAuZmxhZ3MgPSBEUk1fWEVfTU1JT19SRUFEIHwgRFJNX1hFX01NSU9fNjRCSVQsDQo+
ID4gDQo+ID4gU2hvdWxkIHdlIHR1cm4gdGhvc2UgaW50byBhIDJ4MzIgYWNjZXNzPyBUaGVyZSB3
YXMgYW4gaXNzdWUgaW4gZ2l0bGFiDQo+ID4gYWJvdXQgY29tcGxldGVseSByZW1vdmluZyB0aGUg
bW1pbyBpb2N0bCwgYnV0IHRoYXQgZ290IGJsb2NrZWQgYmVjYXVzZQ0KPiA+IG9mIHRoZXNlIGtp
bmQgb2YgdGltZXN0YW1wcyByZWFkLg0KPiA+IA0KPiA+ICtKb3NlDQo+ID4gDQo+ID4gDQo+ID4g
SXQgd291bGQgYWxzbyBiZSB1c2VmdWwgdG8gY2hlY2sgbWVkaWEgYW5kIGNvbXB1dGUgZHJpdmVy
cw0KPiA+IA0KPiA+IA0KPiA+ID4gSUdULiAgU2luY2UgdGhlIHNwZWMgaW5kaWNhdGVzIHRoYXQg
aGFyZHdhcmUgZG9lcyBub3Qgb2ZmaWNpYWxseSBzdXBwb3J0DQo+ID4gPiA2NC1iaXQgcmVnaXN0
ZXIgYWNjZXNzZXMsIHRoZXJlJ3Mgbm8gcmVhc29uIHRvIGFsbG93IHN1Y2ggNjQtYml0IHdyaXRl
cywNCj4gPiA+IGV2ZW4gZm9yIGRlYnVnZ2luZy4NCj4gPiA+IA0KPiA+ID4gQnNwZWM6IDYwMDI3
DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwu
Y29tPg0KPiA+ID4gLS0tDQo+ID4gPiBkcml2ZXJzL2dwdS9kcm0veGUveGVfbW1pby5jIHwgIDMg
LS0tDQo+ID4gPiBkcml2ZXJzL2dwdS9kcm0veGUveGVfbW1pby5oIHwgMTEgLS0tLS0tLS0tLS0N
Cj4gPiA+IDIgZmlsZXMgY2hhbmdlZCwgMTQgZGVsZXRpb25zKC0pDQo+ID4gPiANCj4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW1pby5jIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX21taW8uYw0KPiA+ID4gaW5kZXggOTMyYWE0Y2E1OWM4Li41NjhjZDEwNmQwZWMgMTAw
NjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW1pby5jDQo+ID4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW1pby5jDQo+ID4gPiBAQCAtNDkwLDkgKzQ5MCw2IEBA
IGludCB4ZV9tbWlvX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+
ID4gPiAJCQl9DQo+ID4gPiAJCQl4ZV9tbWlvX3dyaXRlMzIoZ3QsIHJlZywgYXJncy0+dmFsdWUp
Ow0KPiA+ID4gCQkJYnJlYWs7DQo+ID4gPiAtCQljYXNlIERSTV9YRV9NTUlPXzY0QklUOg0KPiA+
IA0KPiA+IGlmL3doZW4gd2UgY2FuIHJlbW92ZSB3ZSBhbHNvIGhhdmUgdG8gcmVtb3ZlIHRoZSBE
Uk1fWEVfTU1JT182NEJJVA0KPiA+IGRlZmluZQ0KPiA+IA0KPiA+IEx1Y2FzIERlIE1hcmNoaQ0K
PiA+IA0KPiA+ID4gLQkJCXhlX21taW9fd3JpdGU2NChndCwgcmVnLCBhcmdzLT52YWx1ZSk7DQo+
ID4gPiAtCQkJYnJlYWs7DQo+ID4gPiAJCWRlZmF1bHQ6DQo+ID4gPiAJCQlkcm1fZGJnKCZ4ZS0+
ZHJtLCAiSW52YWxpZCBNTUlPIGJpdCBzaXplIik7DQo+ID4gPiAJCQlmYWxsdGhyb3VnaDsNCj4g
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW1pby5oIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX21taW8uaA0KPiA+ID4gaW5kZXggODkyZTk2ZTUwNDYzLi43YzUyNWQyN2Nh
ZmIgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW1pby5oDQo+ID4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW1pby5oDQo+ID4gPiBAQCAtNzUsMTcgKzc1
LDYgQEAgc3RhdGljIGlubGluZSB1MzIgeGVfbW1pb19ybXczMihzdHJ1Y3QgeGVfZ3QgKmd0LCBz
dHJ1Y3QgeGVfcmVnIHJlZywgdTMyIGNsciwNCj4gPiA+IAlyZXR1cm4gb2xkOw0KPiA+ID4gfQ0K
PiA+ID4gDQo+ID4gPiAtc3RhdGljIGlubGluZSB2b2lkIHhlX21taW9fd3JpdGU2NChzdHJ1Y3Qg
eGVfZ3QgKmd0LA0KPiA+ID4gLQkJCQkgICBzdHJ1Y3QgeGVfcmVnIHJlZywgdTY0IHZhbCkNCj4g
PiA+IC17DQo+ID4gPiAtCXN0cnVjdCB4ZV90aWxlICp0aWxlID0gZ3RfdG9fdGlsZShndCk7DQo+
ID4gPiAtDQo+ID4gPiAtCWlmIChyZWcuYWRkciA8IGd0LT5tbWlvLmFkal9saW1pdCkNCj4gPiA+
IC0JCXJlZy5hZGRyICs9IGd0LT5tbWlvLmFkal9vZmZzZXQ7DQo+ID4gPiAtDQo+ID4gPiAtCXdy
aXRlcSh2YWwsIHRpbGUtPm1taW8ucmVncyArIHJlZy5hZGRyKTsNCj4gPiA+IC19DQo+ID4gPiAt
DQo+ID4gPiAvKg0KPiA+ID4gKiBJbnRlbCBoYXJkd2FyZSBvZmZpY2lhbGx5IG9ubHkgc3VwcG9y
dHMgR1RUTU1BRFIgcmVnaXN0ZXIgcmVhZHMgb2YgMzIgYml0cw0KPiA+ID4gKiBvciBzbWFsbGVy
LiAgQWx0aG91Z2ggd2Ugb2Z0ZW4gc2VlbSB0byBnZXQgcmVhc29uYWJsZSB2YWx1ZXMgYmFjayBm
cm9tIGENCj4gPiA+IC0tIA0KPiA+ID4gMi40MS4wDQo+ID4gPiANCg0K
