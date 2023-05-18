Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD18AC7EE23
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 17:28:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A097789C05;
	Thu, 18 May 2023 17:28:49 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B86789C05
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 17:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684430928; x=1715966928;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=woGnDE5jt8C8h6Fngdurva324AgnbweOFc2ejZ0Vl98=;
 b=PQChDBVm7J0ri4taTPT3LiAjL6XN8FiLJ6EJanRel3rEVK4ohJE6+pcz
 TaWilRlcE6hqa2qmYSl/OKLY13SiNe0uW/sl4EHYa8iB17gpPwR/gc7pD
 QV+i4HCFDJrCfUYH5CGhjWE4rbm4+raH/kkE75pCcQzl/SibseKEVsLrV
 aCtcLHOVUvq9uGPcTKNi7loan0WcqrjdwS0YJCXV63JuAMYfun+FW18cO
 v3mo8PyAO8GcvSwBHAPSY1LHdyOvtHL3wVFr6V4axnJvt+YvTxXHRYQaG
 Y/mWnedH2FTHyv1xXr9m0ZfV3d7o/cEPAl+Ogjmc3ve79/wCOWnYeIVpf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="349650116"
X-IronPort-AV: E=Sophos;i="6.00,174,1681196400"; d="scan'208";a="349650116"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 10:28:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="652742247"
X-IronPort-AV: E=Sophos;i="6.00,174,1681196400"; d="scan'208";a="652742247"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 18 May 2023 10:28:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 10:28:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 10:28:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 18 May 2023 10:28:46 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 18 May 2023 10:28:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RGVwoScrWNGYjC0Q2lphxDcqBzvchusvm0tXDBis209gF/KqDfQL2K1/jbvjsHs3JQICD5nGJUbC0S94tYyUJk/CIIrkAYoVBWXCvK+mKcSVM1nWa7HTZGEwLBNTbgXx6x5VgqAYbzabRGoVwfMtEwYIhYg22WL2N5N6K8PYfP95YuqzTPLJbD1fSGOIv2DAs6Ux1afMn0oRbSG88T/kl6+GJ2RLVmuiLZbAM0bECSEMgFU4LuFBRkCGafQ5SBNdP0HUqC/jzSDKcLQMIavEe8jGYiWLRXV85/LsKJod0ZwC3O/pS67I3qjlS+rbo0fTbkJyIRnyI0uHWaltEsaveg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=woGnDE5jt8C8h6Fngdurva324AgnbweOFc2ejZ0Vl98=;
 b=aN1/XH+hDVO+70u2KabWEezkmhTnuxz2nRZZjd92EkBklzJXwDqBh4BrjM9V5wIi85324/jkqgrW3niCyTL3SJ1RgIo2TARFjtjPi+A2N+tYtUPA1CffI+9l3Rdawq0J2xlw6kXiE2cOMRQyUrVYpD+qU4FZxrGU576toc/Q9GJoqrHLSWK7I1XY+2GV6TVHOOWZl2+nJ2w0+BbEJbYNe/JosDNLsdk6WQp3zozx82Wq61WwUENxj6xSHr+48rOwZWfDsi9Qf9UJMua27l5npkAMGt5Fk+wYQdnTVpkfE7mIX5jVn6FWN5jZudJMy7hzOBcNPTZrCrLXcG6obRVfNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SA1PR11MB7062.namprd11.prod.outlook.com (2603:10b6:806:2b3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 17:28:44 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651%3]) with mapi id 15.20.6387.033; Thu, 18 May 2023
 17:28:43 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "rodrigo.vivi@kernel.org" <rodrigo.vivi@kernel.org>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: Allow scanout of bos that can be
 migrated to lmem
Thread-Index: AQHZiNzED6hcj/cKM0GDaWsddJekJ69gSIEAgAACIYA=
Date: Thu, 18 May 2023 17:28:43 +0000
Message-ID: <f4a7e0ec905b4e7b74afb9fb7d0588f2bcd37400.camel@intel.com>
References: <20230517162918.59058-1-jose.souza@intel.com>
 <ZGZefKnOnVm9rHfY@rdvivi-mobl4>
In-Reply-To: <ZGZefKnOnVm9rHfY@rdvivi-mobl4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SA1PR11MB7062:EE_
x-ms-office365-filtering-correlation-id: 1ce75ad5-79b1-41cb-3f29-08db57c553fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XeoKYPFnbqMvDWtHmHZehaL5WedFiQ0LfiuOkdEgj57Nd1xvqPZq1gNNRPbcxs4Y335DjGpTEtn07/teGM1y4iDNQipxaOpz8NkK53hbZqAjfA3O4WTU3E/D7bU0yTjVS2sk881lOeNA1cC2OWHbm4M0HlBRUKRPWu7lsNjUuMcQ4WnUpYAGBQsyhAQ6fDO7Lzn6uhO53NbNv4cd/SSp1HZfXsdJPIv7AqFyzBjMuO9yPqPTpMW4AR2Dqii7J7plI7sUuk1ZL2CCBVJ1vaBh58KoRIKVfLIm9JNTJJQE9zGiFxAEgvNVEDZ3hxPuK9+p1kuAZFz0d7dvkq38HhWacjSyeomwBJe7U1Q90VTRkcygzidvCxV8UhWKfz4XOQyTT8CsI1hrkEQboS/45ncnes99RJ8lvrWbvnI3btikC1y1SK4O8MOQ8adllKodcsNrJwhcHswF/0HuVCTSif9vBYgSAwiot2KOmrhDaFA3DMVG0exnEvcb+SlMDsQAh6Oj4pQiXHunO5v4bi7F5gznR6GOWmjIeQ+1UohfqNdukKNmQ5eo04Hs4mgtLndXaSKz1lLzHz3JjfaLSK6xeznOZQXXnW1USCTbG53z5qsA+rMdJ0vOzgRW6x/WiMKYhb/b
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(366004)(136003)(346002)(376002)(451199021)(26005)(6512007)(6506007)(107886003)(36756003)(83380400001)(38070700005)(86362001)(2616005)(38100700002)(82960400001)(122000001)(186003)(54906003)(478600001)(2906002)(4326008)(6916009)(8936002)(8676002)(41300700001)(316002)(5660300002)(91956017)(66446008)(66476007)(64756008)(76116006)(66946007)(66556008)(71200400001)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L1ZvZjZNSE5XUDZ3UjVoQnZhcVdDNDQ2Ry9SNW9ReTkvdlNwTkpIQjMxUmQ5?=
 =?utf-8?B?di9sV0dJWWZkUlcralczbXJaTXhTWHd4K1R1R0JHT0ltS1BGZ3VKYVltaDJq?=
 =?utf-8?B?dzhVNGE3NE9HVGdQSkRyK0tOVmpnbjh1YURINmtSaTJoWStNdFdmNGE4dks1?=
 =?utf-8?B?R0I3Mm1VbUJuOCs3em8xc3pWZ3A3SGJCUExqdnJpMlVsS1ZPUXQ2M0FmYW5q?=
 =?utf-8?B?ektYQlRZR2R6SDdiL05GWmpLTDk4clN4dGU3Z2xFSW0yUHdyZUh5Y1BNUzhM?=
 =?utf-8?B?WFhHWHQ5dG1idWF2cnU5UHUySHk1Z0NzUU1iK2t1eTk4ZVhISlRFRExHbVlO?=
 =?utf-8?B?ZExrMFlaU2F5WWVJT0Z3U2NESzVCR0hISC9TY2F4NEJEenNUbDhHbElUNUF1?=
 =?utf-8?B?bWtoMUtxTzNkZ3NUYmZRckQxZVk3YlpSS0NhUjNOL3RjemZveVc5Y2R3cGdj?=
 =?utf-8?B?eDJ6SkRQRUNBczNPbURYb29nQjNrMmtySFFHdWpzblVBdSs0YXJwQjJGMzFN?=
 =?utf-8?B?UkcyaW1PVXVkZ1RTdWJYbzVWYnNIM29Td09IVTJWOWEvb2t6RGxOeStuNnBL?=
 =?utf-8?B?LzY2SFI0dUh5eWdCMUpmMFBhSFhQemszQms3WW9udU0rdWhONXdaZTdJd3lF?=
 =?utf-8?B?WWtFRnZBc3JYRzQxQmVvYTRHWXoxLzZodmFIUUVaTDRKSzIrdTZoNkxZWElU?=
 =?utf-8?B?RyswdUNtbDVYVnZtVzZsL2M0RjhyY1dxSkRDT0VHN3M2VDlxYU0veUkrb0Nj?=
 =?utf-8?B?ZXI1ZXF6SUd3U1o0YmdEUys3UkpBTnJTWmhLMVdZMUE5UjVtbkFPWkFWdTNX?=
 =?utf-8?B?TlBqTjBzeWgrMDBhRFJzREdKdEJJb2J0S3FKSFNmQUhmcjZGWm9vNlduWjFJ?=
 =?utf-8?B?RDFqd1YyQzJNR2tpMkxvTmozWkFnTmhlSVlBRE9KbWtQSHNJSHA0S1QwYzQz?=
 =?utf-8?B?OXM2ZGEvQ3RENTl5N3d4Ri9FcUF5cEFURk9raDB1SXFlNktobEo1K1pMeFA0?=
 =?utf-8?B?QzMzQ2Z1cmRac0h2ZW5tSGpuaWlEbXRxbmhqU0xycFEyTHBkbHNrOVFMekJ5?=
 =?utf-8?B?a280QWduTy8vMkYwdU81T1B2cmd2T0lmQThJMzFQb1lhaWE4OTdQVSs1c1Zj?=
 =?utf-8?B?elFSeWFGWVRUbzQvU0FtaXIvNmhzYmNBcE0vU0VmV3NMOWJiMG92UXRXYWU5?=
 =?utf-8?B?MDZIY283d3hWZFlFWlYyUVNSVGVKZWFqck8zdE9ESUs5WVJkakZNa1JMV2VV?=
 =?utf-8?B?eTZGeFYybWRCM3lXQURQN2pFVkJYaE9WL2x0NGQybnVmZFJjSjdRMDZLQmYr?=
 =?utf-8?B?VXVHNFhGa2wxRFZNQkNZVysvd1pDdk1nQ1puWko0VGdSSHNhZkdXNkR5MzlT?=
 =?utf-8?B?UzQ4ajVyVVhQbkpmdWU4YUhLa3kzN2UyNHdWQ3RPeXBlZDZFelBSdWtmNnlR?=
 =?utf-8?B?SHl0V2s1L2JnSDJHNkVKd2I4VGlsOFRNWVZiZEJSVEtyMGxWU1F1Z1d0R20x?=
 =?utf-8?B?dHVXUVpFdXJwZm1tNmdEVlNKYTZpRTNMRktHcXhpSXg3clZ4WkNKelluQWZu?=
 =?utf-8?B?K3p6M3pBSENJK25JemJMN1FTMnJRS1N3Ulp2QTBvd3RWQWhaeTVKNnFXZFFw?=
 =?utf-8?B?SWdCdmVHWkd6Q1dqZFlhVitxVzZuT3pTL3ZHSW1LK1FacFVVNnFOcS84dXVF?=
 =?utf-8?B?emluak5zSjhzUW0xZ3ZSNURFMTRHVXZiYk40Y3RvRitwdXZtZEJzWDBpMXJr?=
 =?utf-8?B?bEVBbXBtQ2dDbkFqNjhVNnE0amhWaTZuMDJxZUVqeG0vNXk5YjJEV2hndStt?=
 =?utf-8?B?NGp5MkVtVWpCNVJzMGhMYSthR1VhMHJGTVdHYlU2MXVKdmloUVRobHVkVTFZ?=
 =?utf-8?B?NFhpNXhVZW1MYkRtblY1VkllYU1hSTZaT2tYc0NuVEpNOWthOXR1aXhxOStm?=
 =?utf-8?B?ZTk1MW0wOGFldmRTQTlIVjNDTGtQQ0NXeEEzWXA2RExQOVRCZU5IWTltYTRK?=
 =?utf-8?B?ZlVmL2hSbkpCUDJzMzJaUnRNV3crZTIvM3RaS21VQThIWXczWUR3ZGM3WE5h?=
 =?utf-8?B?SFNxMEoxZktsc0NSUmY5by80MlkwKzdwd2I4b2RYcldpRFUvU251aWhIWFdW?=
 =?utf-8?Q?vPByHJRTUpQ8HgMjPrS1f6jIj?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EDB5261302695E4199A69560E070DE3D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ce75ad5-79b1-41cb-3f29-08db57c553fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2023 17:28:43.1744 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2IO/n2Yve7OpOQKexx96G6DP4Cii6LdwM+IMiXPJKr7o4BVT0QKEP17OKPS8d9s7akGlWQ5dRh6jPdi8XIZMiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7062
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Allow scanout of bos that can be
 migrated to lmem
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTA1LTE4IGF0IDEzOjIxIC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIFdlZCwgTWF5IDE3LCAyMDIzIGF0IDA5OjI5OjE4QU0gLTA3MDAsIEpvc8OpIFJvYmVydG8g
ZGUgU291emEgd3JvdGU6DQo+IA0KPiBUaGUgcGF0Y2ggaXRzZWxmIGxvb2tzIGdvb2QsIGJ1dCBJ
IGJlbGlldmUgdGhhdCBJIG1pZ2h0IGJlIGNvbmZ1c2VkDQo+IGJ5IHRoZSBjb21taXQgbWVzc2Fn
ZS4gc28gYSBmZXcgcXVlc3Rpb25zIGhlcmU6DQo+IA0KPiA+IE9wZW5HTCBzdGFjayBtYWtlcyBz
Y2Fub3V0IGJ1ZmZlcnMgZXhwb3J0ZWQgYXMgd2VsbCBiZWNhdXNlIHVzdWFsbHkNCj4gPiBpdCB3
aWxsIGJlIGV4cG9ydGVkIGZyb20gY2xpZW50IGFwcGxpY2F0aW9uIHRvIGNvbXBvc2l0b3IuDQo+
ID4gDQo+ID4gRXhwb3J0ZWQgYnVmZmVycyBuZWVkcyB0byBiZSBwbGFjZWQgaW4gU01FTSBzbyBp
dCBjYW4gYmUgYWNjZXNzZWQNCj4gPiBieSBkaWZmZXJlbnQgR1BVcyBpZiBuZWVkZWQsDQo+IA0K
PiBzbywgaWYgaXQgbmVlZHMgU01FTSwgd2h5IGFyZSB5b3UgbWlncmF0aW5nIHRvIExNRU0/DQoN
CkRpc3BsYXkgY2FuIG9ubHkgc2Nhbm91dCBmcm9tIGxtZW0gb3IgcHJpbWUgaW1wb3J0ZWQgYnVm
ZmVycy4NCg0KPiANCj4gPiBzbyBpbiBkaXNjcmV0ZSBHUFVzIGl0IGlzIHBsYWNlZCBpbg0KPiA+
IFNNRU0rTE1FTS4NCj4gDQo+IEkgc2VlIHRoZSBjb2RlIG1pZ3JhdGluZyB0byBMTUVNLCBidXQg
bm90IG1pZ3JhdGluZyBMTUVNIHRvIFNNRU0sDQo+IHdoYXQgYW0gSSBtaXNzaW5nPw0KDQpEb24n
dCBrbm93IHRoaXMgb25lIGJ1dCBwcm9iYWJseSB3aGVuIGFjY2Vzc2luZyB0aGUgcHJpbWUgYnVm
ZmVyIHNvbWV3aGVyZSBpbiBYZSBjb2RlIHRoZSBidWZmZXIgZGF0YSBpcyBtaWdyYXRlZCBmcm9t
IGxtZW0gdG8gc21lbS4NCg0KPiANCj4gPiANCj4gPiBCdXQgdGhpcyBjb21iaW5hdGlvbiBpcyBj
YXVzaW5nIGFwbGljYXRpb25zIGxpa2Uga21zY3ViZSB0byBiZSBhYmxlDQo+ID4gdG8gY3JlYXRl
IGZyYW1lYnVmZmVycy4NCj4gDQo+IHRvIGJlIGFibGUgb3IgdG8gKm5vdCogYmUgYWJsZT8gd2hh
dCdzIHRoZSByZWFsIGN1cnJlbnQgaXNzdWU/DQoNCm9wcyB3aWxsIGFkZCB0aGUgbWlzc2luZyAi
bm90IiwgaGVyZS4NClRoZSByZWFsIGlzc3VlIGlzIHRoYXQgc29tZSBjb21wb3NpdG9ycyBjYW4n
dCBjcmVhdGUgZnJhbWVidWZmZXJzIHNvIGl0IGZhaWxzIHRvIGluaXRpYWxpemUgbGVhdmluZyB1
c2VyIGluIGNsaS4NCg0KPiANCj4gPiANCj4gPiBTbyBoZXJlIGRvaW5nIHRoZSBzYW1lIGhhbmRs
aW5nIGFzIGk5MTUgYW5kIGFsbG93aW5nIGJvcyB0aGF0IGNhbg0KPiA+IG1pZ3JhdGUgdG8gbG1l
bTAvdnJhbTAgdG8gYmUgcHJvbW90ZWQgdG8gZnJhbWVidWZmZXIuDQo+IA0KPiBva2F5LCB0aGlz
IHBocmFzZSBpcyB3aHkgSSBiZWxpZXZlIHRoZSBjb21taXQgaXMgZG9pbmcgd2hhdCBpdCBzaG91
bGQsDQo+IGJ1dCB0aGUgYWJvdmUgbWVzc2FnZXMgY29uZnVzZWQgbWUgYSBiaXQuLi4uDQo+IA0K
PiA+IA0KPiA+IEF0IGxlYXN0IGFsbCBjdXJyZW50IGRpc2NyZXRlIEdQVXMgd2l0aCBkaXNwbGF5
IG9ubHkgaGF2ZSBvbmUgbG1lbQ0KPiA+IHJlZ2lvbiwgc28gd2UgZG9uJ3QgbmVlZCB0byBjaGVj
ayBmb3IgdnJhbTEgYnV0IHdlIG1pZ2h0IG5lZWQgdG8NCj4gPiBleHRlbmQgaXQgaW4gZnV0dXJl
Lg0KPiANCj4gYWNrIG9uIHRoaXMgcGFydC4NCj4gDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTog
Sm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQo+ID4gU2lnbmVk
LW9mZi1ieTogTWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPg0KPiA+IC0tLQ0K
PiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiLmMgfCA1ICsrKy0tDQo+
ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2ZiX3Bpbi5jICB8IDcgKysrKysrLQ0K
PiA+ICAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4g
PiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9m
Yi5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYi5jDQo+ID4gaW5kZXgg
MDE1YWFjYmFkMWIxMS4uZmViOGEwZjVmYmRmNiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2ZiLmMNCj4gPiBAQCAtMjEyMSw4ICsyMTIxLDkgQEAgaW50ZWxf
dXNlcl9mcmFtZWJ1ZmZlcl9jcmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gPiAgCQly
ZXR1cm4gRVJSX1BUUigtRU5PRU5UKTsNCj4gPiAgDQo+ID4gIAlvYmogPSBnZW1fdG9feGVfYm8o
Z2VtKTsNCj4gPiAtCS8qIFJlcXVpcmUgdnJhbSBleGNsdXNpdmUgb2JqZWN0cywgYnV0IGFsbG93
IGRtYS1idWYgaW1wb3J0cyAqLw0KPiA+IC0JaWYgKElTX0RHRlgoaTkxNSkgJiYgb2JqLT5mbGFn
cyAmIFhFX0JPX0NSRUFURV9TWVNURU1fQklUICYmDQo+ID4gKwkvKiBSZXF1aXJlIHZyYW0gcGxh
Y2VtZW50IG9yIGRtYS1idWYgaW1wb3J0ICovDQo+ID4gKwlpZiAoSVNfREdGWChpOTE1KSAmJg0K
PiA+ICsJICAgICF4ZV9ib19jYW5fbWlncmF0ZShnZW1fdG9feGVfYm8oZ2VtKSwgWEVfUExfVlJB
TTApICYmDQo+ID4gIAkgICAgb2JqLT50dG0udHlwZSAhPSB0dG1fYm9fdHlwZV9zZykgew0KPiA+
ICAJCWRybV9nZW1fb2JqZWN0X3B1dChnZW0pOw0KPiA+ICAJCXJldHVybiBFUlJfUFRSKC1FUkVN
T1RFKTsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVfZmJf
cGluLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9mYl9waW4uYw0KPiA+IGluZGV4
IGVkNjkxZDI4YjM0ZDcuLmM3YzRkZjE4ZTQzOWIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL2Rpc3BsYXkveGVfZmJfcGluLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
eGUvZGlzcGxheS94ZV9mYl9waW4uYw0KPiA+IEBAIC0xODMsNiArMTgzLDggQEAgc3RhdGljIGlu
dCBfX3hlX3Bpbl9mYl92bWFfZ2d0dChzdHJ1Y3QgaW50ZWxfZnJhbWVidWZmZXIgKmZiLA0KPiA+
ICBzdGF0aWMgc3RydWN0IGk5MTVfdm1hICpfX3hlX3Bpbl9mYl92bWEoc3RydWN0IGludGVsX2Zy
YW1lYnVmZmVyICpmYiwNCj4gPiAgCQkJCQljb25zdCBzdHJ1Y3QgaTkxNV9ndHRfdmlldyAqdmll
dykNCj4gPiAgew0KPiA+ICsJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGZiLT5iYXNlLmRldjsN
Cj4gPiArCXN0cnVjdCB4ZV9kZXZpY2UgKnhlID0gdG9feGVfZGV2aWNlKGRldik7DQo+ID4gIAlz
dHJ1Y3QgaTkxNV92bWEgKnZtYSA9IGt6YWxsb2Moc2l6ZW9mKCp2bWEpLCBHRlBfS0VSTkVMKTsN
Cj4gPiAgCXN0cnVjdCB4ZV9ibyAqYm8gPSBpbnRlbF9mYl9vYmooJmZiLT5iYXNlKTsNCj4gPiAg
CWludCByZXQ7DQo+ID4gQEAgLTIwNCw3ICsyMDYsMTAgQEAgc3RhdGljIHN0cnVjdCBpOTE1X3Zt
YSAqX194ZV9waW5fZmJfdm1hKHN0cnVjdCBpbnRlbF9mcmFtZWJ1ZmZlciAqZmIsDQo+ID4gIAlp
ZiAocmV0KQ0KPiA+ICAJCWdvdG8gZXJyOw0KPiA+ICANCj4gPiAtCXJldCA9IHhlX2JvX3ZhbGlk
YXRlKGJvLCBOVUxMLCB0cnVlKTsNCj4gPiArCWlmIChJU19ER0ZYKHhlKSkNCj4gPiArCQlyZXQg
PSB4ZV9ib19taWdyYXRlKGJvLCBYRV9QTF9WUkFNMCk7DQo+ID4gKwllbHNlDQo+ID4gKwkJcmV0
ID0geGVfYm9fdmFsaWRhdGUoYm8sIE5VTEwsIHRydWUpOw0KPiA+ICAJaWYgKCFyZXQpDQo+ID4g
IAkJdHRtX2JvX3BpbigmYm8tPnR0bSk7DQo+ID4gIAl0dG1fYm9fdW5yZXNlcnZlKCZiby0+dHRt
KTsNCj4gPiAtLSANCj4gPiAyLjQwLjENCj4gPiANCg0K
