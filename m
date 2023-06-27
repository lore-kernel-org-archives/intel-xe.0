Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6215EB64D9
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jun 2023 21:25:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB4A10E32A;
	Tue, 27 Jun 2023 21:25:46 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A447310E32A
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jun 2023 21:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687901145; x=1719437145;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=6Ez4hMZhT9DAD02iHBzLA/FrvRdGirvyrncuYNQas/U=;
 b=XiicQeW+mNX+qEWSfYBN/VfOMqRtzB4zFic1kebuxHdd+y12XXUnlG0f
 odPaiKncNo2+5+iU/8PA7JH2ECWgqFZVdOOyn5I1rIYGnFz3IXNTy3YzR
 fdwI1ouQ8iFbwyRXeNkiBfgIFt8/St5Zva037xkx+lvaCTBt3XQjOCDyJ
 WPSAbdUbSeBHibi696Nr1hZbHtBd0bLkGlzbKxUh0i6K+WiSjPK6E8BmI
 D7b9LAKQ5RhB6uMyq9MaTW7UnadF9Mt3KTRweWoxhPPMmEfsr0E9LHqwZ
 Bcpp6Mu1Kx8c8+EDBz5t/ZDDacq9jVLxTqDjOHOgDvPzc7CGoYhUdLuH2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="448069801"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="448069801"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 14:25:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="751923475"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="751923475"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 27 Jun 2023 14:25:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 14:25:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 27 Jun 2023 14:25:43 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 27 Jun 2023 14:25:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VuUhRIyjPGv2JmktzUESFE0SNCuGfEAZQrfi5de3aVU+3h8+F7xHMpzKfyyp84+n/0mfd9afp8sd8WM7RgHbzLmKaWDI87EkcEPqMSDXzVZ2Zs/lE4ppVLoWt9do4T93z0ZTTNh/bwr/VuQ4KNKhlotmkap2KAx8P/BVgjOsyWenGCvWP/Q2kkY0dD94BTPfrTkCQl9M/bOb9m46BNeOlOr/qTHIPuEt2uKbgUJWaMIvVDG5ZwD00kWIa7n17nu3UJJQ6dC7ReF8QcAXpZRJVLWCJYvtW2oWff5DHFfIbWZXrzOkhygcPC9ktukhe+MaKupbF2B4BexYvB4Sf12cZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Ez4hMZhT9DAD02iHBzLA/FrvRdGirvyrncuYNQas/U=;
 b=mbsGiMHvpC71lEVXm0DtW9TYLzhxHFVAA/dzHTRRgEyoRBUMkSFAqOZyJljn5NAliw3bEBGvvb0MNwl+Wz5QJiVu5vrBzR4sLBx1J1Z0G7qsvWWuOJLbQWcKDKScu0XHjfuEbq9lS6Aup6Zt+UI+aW3UdXkdPFoZ1suNgaLNGrgfFyiC/I7RtLjyoUqheIye9UttKHIrL4BNqy5k3Ys7kC37lWMsOROjtZsmKw18IWGG6RDzyYBuMHVKGes5LPY0RwiG5WH6TJXhgYHUf7Ld36/2S2cuivLS56diSi0hnHN+KISrrPYc5ZGxAV1w6ujf6NVWeiUyNna1X5sGSoZiKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO6PR11MB5620.namprd11.prod.outlook.com (2603:10b6:303:13e::17)
 by PH7PR11MB7074.namprd11.prod.outlook.com (2603:10b6:510:20d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Tue, 27 Jun
 2023 21:25:36 +0000
Received: from CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::73e1:ee27:c348:6ee]) by CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::73e1:ee27:c348:6ee%7]) with mapi id 15.20.6521.023; Tue, 27 Jun 2023
 21:25:36 +0000
From: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH 2/2] drm/xe: properly check bounds for
 xe_wait_user_fence_ioctl()
Thread-Index: AQHZqHRcV9hIjeW7E0STSFbcIrjgWK+fCtiAgAAgEYA=
Date: Tue, 27 Jun 2023 21:25:36 +0000
Message-ID: <7f2c6bb6bebf96de06f8633e20cf5bede43e4a18.camel@intel.com>
References: <20230626212221.136640-1-paulo.r.zanoni@intel.com>
 <20230626212221.136640-2-paulo.r.zanoni@intel.com>
 <dzs6mijmrgohz2hvcrpftkzabo6qlsgnfvo6c7vnlkh5xqladw@4qpmwqar73xu>
In-Reply-To: <dzs6mijmrgohz2hvcrpftkzabo6qlsgnfvo6c7vnlkh5xqladw@4qpmwqar73xu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4-2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5620:EE_|PH7PR11MB7074:EE_
x-ms-office365-filtering-correlation-id: fe1676a2-1a70-4eae-527f-08db77550c07
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X6JaJI/DwXc57otGhm/2Bc1EerG9gCNCkZCkvxNhcx22g5x5bsH9PNexcuc8TxVmea+37HTEaWcg3e3IzqxRnD9bbjnLify6tLVWzaJ1zqnZWH2gUTuGn3TIKhGA1KNWBxKqtqmRqBNNbkfEoG3ZvQWfoOpewR8PIkz6UJg5bSfIXZ/7w00CIIoMCSKg73GOL1aWz/MM7O10/DwGjh2RQq8voeuo4mCqgf2MqIfg+3nUd8iF6AB7dK3sXCXBk+eMRwQHkmyTIIwzk64oB8nuY1jm35T4rZbADucUVjRkaJ7hdaXXeLMr0R8nBghrfaMRgqwk3nFse1RobOZBcQPuWxS1rf1+K7GHeaa1PexTP/H0KJnkOjLsnZYB2I8i+kg32MPRiplH67PbbZ9O2aOkzhlwAYy/1c2s+urIS41Cffx8EBqdo8Nk8KzW/Ng4lbGIM7HaD2dY7CoyYxyoT5i3kKOgrHXVCho4glo4czUCApoySgofdYMFya3FScVcH65wv1AYqreLDHxFHBsn+xlnDyHLRqzt6QyjHZhULaeUyvxP5S4GkjFtTDh3ho3IOxQXP6WLpIbBQMXvqftwOqx5g2p8dD3q0pF69eEcbMm7VnY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5620.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(376002)(39860400002)(396003)(136003)(451199021)(2906002)(186003)(71200400001)(6486002)(122000001)(82960400001)(38100700002)(83380400001)(2616005)(6506007)(6512007)(86362001)(966005)(37006003)(41300700001)(38070700005)(316002)(478600001)(36756003)(66556008)(66446008)(4326008)(66946007)(76116006)(64756008)(66476007)(6636002)(5660300002)(8676002)(8936002)(6862004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmNQRVJqejU4Sjc5b1lEaEhXcFdOWHNtU1NmZ1J1YmRvWHNPYVRQeXFrekVP?=
 =?utf-8?B?dVdxNGtLcCtYZ0dXeFpudlJpTmxVV2x0VHVMRTNKRldWZENwdHBRVHpoWEZn?=
 =?utf-8?B?ckdtMXBoa2ZzZytyNFlvV09pUXlUejA4dFNqTGYzM2pFVUFpN1dXUUZvNHda?=
 =?utf-8?B?Sk5WeUJCbHppM1A4NER4WG53WG5LKzNKQi8wanV5Qkl6ZmoyYmhGSUgxUGd3?=
 =?utf-8?B?M2hvZWVleVlOR3Z2d2pjdUtDZHZkVG9XWjFLNnpEODhQM2pZOTFIdG5QVmVU?=
 =?utf-8?B?eFF4elRleElUOW1WTk9ocExPSlV4cGRLT1FYdWF2L2s0MEZWRnd3Sjl6d1U5?=
 =?utf-8?B?T2dXTzlpWHYrT21NdVZrSWZxeHlwT1FleFZjaWpOUXVyNm9FblpGbnRveTdP?=
 =?utf-8?B?dVdZMUVVVklYWXpmbk1rcy9NY21CRkdtUE1uVW55TThPYkxiSWpjMWczNktD?=
 =?utf-8?B?RGlYU0liUUhpNDVMMlVQK3RsTmk5WEZpWVgvVVN4TVNXL0UzdFJvdFMraDdw?=
 =?utf-8?B?N1ZMUEZDVURJcUQ2M1l1bExNeXZBbGk4SW9XYXEzdU5MM29KNXlYdlFkT1kx?=
 =?utf-8?B?b2pIbEdjc3NCR0M3bW5tTUZiQk9BNmc2QmpNTlF6ZW45OGFPMkpSaDdoYUlT?=
 =?utf-8?B?S25PeTQvOEh3azM4VjNDS1daYXZhL3JGY05TMjM5NVdmeXF1TDh5VGFLRFcv?=
 =?utf-8?B?MUw3a2VNbnRWSWZYZjNtbUZQSDhReFdGWDhTQVZDOUhRdTBEWWhoNVJSd2Vx?=
 =?utf-8?B?ZmZCb2VQWC9JOVhhQ0I3WU45aWh3bXF1Rk9BSnBET0swYk5nUmtPMU1YUjAv?=
 =?utf-8?B?NkxOVWJDTjJjTFN4WGpweWhDU2d2dC94Y2tRSlA0M2lDL0I1eFpnb3hWS29C?=
 =?utf-8?B?YVBrV2hiSXp1ZEpmZjJDZWJJYVByU2JHMlJFU0t3RGVPdTl5dGMxcnVaSWli?=
 =?utf-8?B?SGYrazZMZmJsNS9WMGpQYkxURFFHRlQ4T2F6K2ZCek1HaUZEb0RXZnhMd3Jj?=
 =?utf-8?B?eFNzSzVUeFVRbFdBSlVqOWd0MlNxTXh6MTR6VGQvNEJkZXFqelFMeDUzMkhD?=
 =?utf-8?B?dkYybEZncDVsZWgwaFFFOGhDbUJVU0FudHJzejdrNVJLQXJ3RDMyYkMvV2I1?=
 =?utf-8?B?WXFRbVpRbEx0cGMwUHkwZWNrNGRlSTdFU0gyOUpSVDZ2RiticFF2ZkxkRjJl?=
 =?utf-8?B?Sk11NWFjTjhXNnB5QVovMjBGdGxvL1RwQVdacmc2Y3UvYjBtdGlTL1Z1bnow?=
 =?utf-8?B?QzFvcllzRVROcTNnSEVoSEc2TDkzRnd0Qk5mRVlYSlM4TjM1Z21KaG4ySjZD?=
 =?utf-8?B?WlFGaUpodEJaK0NONlJvVnlEWDVFM3pwWWU4eGlBR1lzbGhxdEt2UVlzQjJy?=
 =?utf-8?B?SHJZRWp5bkovRHlSRUl6L1hHa09OZUZ3YnZyVFpMMVNpNjdGZXU1L3A3b2lZ?=
 =?utf-8?B?ai9VQ25yT0tPSytlZms5WE1yRytPL1JZYWFVcTFPaFMyT3pzcUM1VEdkUzlu?=
 =?utf-8?B?STZTWXF0ckxyTHp5SXFaZkVkMG1GY2ErR2NJWlQwMmZIeWdKWVNBMGJyUEtX?=
 =?utf-8?B?eTZpZEVNbkovRy9xZnhHM2RGdG51RUpwTkF5WnpkNHByMHJrMnBvcW50ay9o?=
 =?utf-8?B?MEhsMGNsVncrQTJ4MXdqeXRYZmFuVGczMmtoc0FtS2NmS3JzTzAwY3IweEFV?=
 =?utf-8?B?d0YzbG1DeXc3L2NPUUNXZTlubzZsSjF1UHlLK2cwRW9teW5IWXZHTnE3ZXF4?=
 =?utf-8?B?Wms3QWhvTnRJTUpBL1k2M2VPZHBUQnNVWmNWa2F3MnBVbGVETUpSM1pvNXNM?=
 =?utf-8?B?OHR5OWpCajh2NnBvSHVpNEUyMmFIdnJERlgvMHVQTmZpMXRIUmFZanh2V3Nz?=
 =?utf-8?B?dE16aDZKcG5LcEtHeWprd3JlbmFyS1BrYVNtS0M3T1BnSkVvOVVPdkVUaDJV?=
 =?utf-8?B?QlBQRnM1TjJTNXBPVVZYVTFaLzFBbjJHQXdEY0J6QWQ4RnBhMGwrMGhBMk9a?=
 =?utf-8?B?VmMxMjJyM2ZXNDA2WnYvSXR2aVQ4UGgyWSsvWmI2aVVLYU9zWXkzaXdUQUZu?=
 =?utf-8?B?cTdQZnpWZmg2aCtHTE5OYjBZSWxEajJMRjZoaTdseVVYMVJyQ28yOGYra2tk?=
 =?utf-8?B?MU1mL3NnT3ZJTk43RXU3aDcvSjRkeW1SNDJiSGNhV3NWQmV2aGpIeW5xcFUw?=
 =?utf-8?B?THNkTWVkV0hDMU1nWU4wT0loZDcrVEdtTlllR1FmLzRlbU5QRG02TUNoVE5P?=
 =?utf-8?B?WVIza29KRDNnZ0kyWkJzVmY1SG1BPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <14A22F5BCD72584AACB528B5A1C9FF0A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5620.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe1676a2-1a70-4eae-527f-08db77550c07
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2023 21:25:36.0306 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K/IkClKoXgIeY/cFSKMY1UeM+6fVo6HzdSHmvg7Tdimj09tD564X5NFbgpS9n2Vj+PAEEPColmEAY81uYgZhgPzORlqDLokxJeSqsu14bso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7074
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: properly check bounds for
 xe_wait_user_fence_ioctl()
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

T24gVHVlLCAyMDIzLTA2LTI3IGF0IDE2OjMwIC0wMzAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IE9uIE1vbiwgSnVuIDI2LCAyMDIzIGF0IDAyOjIyOjIxUE0gLTA3MDAsIFBhdWxvIFphbm9u
aSB3cm90ZToNCj4gPiBJZiAhbm9fZW5naW5lcywgdGhlbiB3ZSB1c2UgY29weV9mcm9tX3VzZXIg
dG8gY29weSB0byB0aGUgJ2VjaScgYXJyYXksDQo+ID4gd2hpY2ggaGFzIFhFX0hXX0VOR0lORV9N
QVhfSU5TVEFOQ0UgbWVtYmVycy4gVGhlIGFtb3VudCBvZiBtZW1iZXJzDQo+ID4gY29waWVkIGlz
IGdpdmVuIGJ5IHRoZSB1c2VyIGluIGFyZ3MtPm51bV9lbmdpbmVzLCBzbyBhZGQgY29kZSB0byBj
aGVjaw0KPiA+IHRoYXQgYXJncy0+bnVtX2VuZ2luZXMgZG9lcyBub3QgZXhjZWVkIFhFX0hXX0VO
R0lORV9NQVhfSU5TVEFOQ0UuIEl0J3MNCj4gPiBhbiB1bnNpZ25lZCB2YWx1ZSBzbyB0aGVyZSdz
IG5vIG5lZWQgdG8gY2hlY2sgZm9yIG5lZ2F0aXZlIHZhbHVlcy4NCj4gPiANCj4gPiBGaXhlcyBl
cnJvciBtZXNzYWdlcyBzdWNoIGFzOg0KPiA+IA0KPiA+ICAgIEJ1ZmZlciBvdmVyZmxvdyBkZXRl
Y3RlZCAoNTQgPCAxODQ0Njc0NDA3MzcwOTU1MTUyMCkhDQo+ID4gDQo+ID4gVmVyeSBzaW1wbGUg
cmVwcm9kdWNlcjoNCj4gPiANCj4gPiAgICBodHRwczovL3Blb3BsZS5mcmVlZGVza3RvcC5vcmcv
fnB6YW5vbmkvd2FpdC11c2VyLWZlbmNlLWJ1Zy8NCj4gDQo+IHNhbWUgY29tbWVudCBhcyBpbiB0
aGUgcHJldmlvdXMgcGF0Y2guIEl0J2QgYmUgYmV0dGVyIHRvIGhhdmUgYSBjb2RlDQo+IHNuaXBw
ZXQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLg0KPiANCj4gPiANCj4gPiBSZXZpZXdlZC1ieTogSm9z
w6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogUGF1bG8gWmFub25pIDxwYXVsby5yLnphbm9uaUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+
ID4gZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhaXRfdXNlcl9mZW5jZS5jIHwgMyArKysNCj4gPiAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV93YWl0X3VzZXJfZmVuY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV93YWl0X3VzZXJfZmVuY2UuYw0KPiA+IGluZGV4IDMxMjIzNzQzNDFkNi4uMDk4ZTJhNGNm
ZjNmIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YWl0X3VzZXJfZmVu
Y2UuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YWl0X3VzZXJfZmVuY2UuYw0K
PiA+IEBAIC0xMjEsNiArMTIxLDkgQEAgaW50IHhlX3dhaXRfdXNlcl9mZW5jZV9pb2N0bChzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLA0KPiA+IAkJCSBhZGRyICYgMHg3KSkNCj4g
PiAJCXJldHVybiAtRUlOVkFMOw0KPiA+IA0KPiA+ICsJaWYgKFhFX0lPQ1RMX0VSUih4ZSwgYXJn
cy0+bnVtX2VuZ2luZXMgPiBYRV9IV19FTkdJTkVfTUFYX0lOU1RBTkNFKSkNCj4gDQo+IFhFX0lP
Q1RMX0VSUigpIGlzIHNvb24gZ29pbmcgYXdheSwgYnV0IHdlIGRvbid0IG5lZWQgdG8gd2FpdCBm
b3IgaXQuDQo+IA0KPiBSZXZpZXdlZC1ieTogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNo
aUBpbnRlbC5jb20+DQo+IA0KPiBGb3IgdGhlc2UgMiBjb21taXRzLCBsZXQgbWUga25vdyBpZiB5
b3UgYXJlIHNlbmRpbmcgYSBuZXcgdmVyc2lvbiBvciBpZg0KPiBJIHNob3VsZCBqdXN0IGFkZCB0
aGUgY29kZSBzbmlwcGV0IHdoaWxlIGFwcGx5aW5nLg0KDQpGZWVsIGZyZWUgdG8gYW1lbmQgdGhl
IG1lc3NhZ2VzIHdoaWxlIGFwcGx5aW5nLCB3aGF0ZXZlciBhcHByb2FjaCB5b3UNCmNob29zZSBp
cyBmaW5lLiBUaGFua3MhDQoNCj4gDQo+IHRoYW5rcw0KPiBMdWNhcyBEZSBNYXJjaGkNCj4gDQo+
ID4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gKw0KPiA+IAlpZiAoIW5vX2VuZ2luZXMpIHsNCj4g
PiAJCWVyciA9IGNvcHlfZnJvbV91c2VyKGVjaSwgdXNlcl9lY2ksDQo+ID4gCQkJCSAgICAgc2l6
ZW9mKHN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlKSAqDQo+ID4gLS0gDQo+ID4g
Mi4zOS4yDQo+ID4gDQoNCg==
