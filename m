Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89CB2C46CA1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 20:55:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 389C410E33D;
	Mon, 18 Sep 2023 20:55:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF5110E33D
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 20:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695070499; x=1726606499;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=OBBSKhmdGk8jtThH4EzTFBeVCHua/7SJ9WDoSMqNCOk=;
 b=UJlqpuHrOk+eT7AkT95vwLteeeKvuN3hD3j9Y/VbIsuh33hVNW7YIo9s
 i3ntNv2xzoOxMZOzYxR82sIdhba9Y9F/5a8Tx28gCAhtEYnb3Bjfq0BYB
 qB+yslXQEsg0kXRy4BCKRIahf5wqhl+7XEWtaRzEoZd58gBrXsK1IUsvn
 bRGLeAgpG4/SpP8EuTsBnTc011OVyVhOeyW8P0ue+C0DNgACeMuKXpz80
 62lWzwnG9ivdRrgUAf9Iss1w5CtuKcrxZKW9LgCZLH1t4lN3eUI9jJqyV
 62go+tvimryumXAzfh6f8MdEEyZUkrJHfxx8OTUPRzEfDUVlHyjUcysRE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="443854235"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; d="scan'208";a="443854235"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 13:54:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="919603390"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; d="scan'208";a="919603390"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2023 13:54:58 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 13:54:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 13:54:57 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 18 Sep 2023 13:54:57 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 18 Sep 2023 13:54:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGwPv69DsL28TYmzF/xoq3DqjcgZX1mDerKCu3OoLEPssMjs+dmghBEc7pt7n5gqD0rvNXzZr+H5HSpcmtDI1Zg9ACt5Pt1zaJIzq0WHZ7EaKKAjLlY/njYM/C4S0b+sp7k/EwiCAZqi7f6S0K382EgZ8e6vcRaLFCumhHPa0/6ZzntzhnJvxxjCvjTaHBQ1utGfz1buUhOEqYClkaG+FM/tCAJwbQZpahZs5OuIt4v4NtADvg9NcZ1kPog2aojjg/97vHEW2in59RFo+mf1bwbwpG/D6txYwbLH5dUJaDJGuiYK4sonpM7ZOiKZIhbksam5Y2uxSrcaDy9rfCfPpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OBBSKhmdGk8jtThH4EzTFBeVCHua/7SJ9WDoSMqNCOk=;
 b=Z4q541kUdXc1ZYDVC0h+LVh6buRk3KzqM5URNh7sFkj7C6nNoO1jVlioXzzmNsAhLEcUt8D3K6NEGGStbuoTveRvFr0Ad/oIPGu3zlKO1lBfrE35OJRP/cNhOuYWh12g6uKvwYzRYKo+Jwocb1f3HvcKemA6VwcRLeAyhZb+IOvdFK8+0lC3TpU8z39w/xzdi61pJS4n9zRxlTuWq668JlIC9fj4KTp96EJ8Zuk/E86Lnx7LZsSZ7HvYwRNUxZHPm05urbfpJcnYK6qBYgIu2tUEUKdIRocg43pIdjejhmjMx63FHidPzbegwVNUd+2llgX37XwlxsHxeDITpkVaGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by SN7PR11MB6995.namprd11.prod.outlook.com (2603:10b6:806:2ae::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 20:54:52 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::cf28:4320:6c5e:aec]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::cf28:4320:6c5e:aec%5]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 20:54:52 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Hogander, Jouni" <jouni.hogander@intel.com>
Thread-Topic: [Intel-xe] [PATCH 2/6] Revert "FIXME: drm/i915/psr: include
 intel_frontbuffer.h from intel_psr.c"
Thread-Index: AQHZ58N62G8mbngqLE+G4UGq2hwiRbAhFTQA
Date: Mon, 18 Sep 2023 20:54:52 +0000
Message-ID: <8b3abac590314c99407bedb82522ac5c7f4316b1.camel@intel.com>
References: <20230915105724.1025509-1-jouni.hogander@intel.com>
 <20230915105724.1025509-3-jouni.hogander@intel.com>
In-Reply-To: <20230915105724.1025509-3-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|SN7PR11MB6995:EE_
x-ms-office365-filtering-correlation-id: ff906100-4b7b-43b2-fb67-08dbb889816b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G24JyO9ZLKzPl7gv03OUCr7oob2ZxCRkZP9wKUaJKn35ActpItFw1ElEBiwcykG70nWDD6Pjw6jIagAt+FTbmGe3YS17kGo8K+CXifEhjspwDIRkM6ipuvHKl59/BdxeT8ZLYfHUrzsZFSkAMV045hB1Y9SqPZ2dOBn+wbvXRmFfiiRddDN5+jf/lHRfXJeqpzxa9Ro3kL8IkeVw8wrpntq7nQNN+0e0t0wN6cp/JARU5SDXlfrL0wQ51dLhbZeRyAbYx+oea3TSou3U8a0A4HKoErWb7sv5eJG1+95UuWuA90sPyeVYPkZdo7dU1rGZignKQ0xzaX//299aqYfPjp+3sKC24Ju3z0TheQwDhrMGODLJkqRH8a5JLepzFWHfE2IbmY6n206jZ3MI9fhVrYsHv83pye7iOSm9crP+iLCV8o5DysbVj0MCqMK8Dw0Ty61AsAY3hgYyesUn5X0Co+LfNqNdK9K6Gs8RoXUTnC67LBykaPjNJqGjnFpRnUoqUzMbcMlibYtHBqhwfUww+SjoUa9oREhyxnFCiR97k8zAaxo75yBZepSp4sVYDLn5FS8ggin4BabDyJ59OXddkAQyQrqJO739dUuYjCdRkJJIHDa4ramNpAZgsYHArlRI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(39860400002)(346002)(366004)(136003)(1800799009)(186009)(451199024)(83380400001)(6486002)(6506007)(71200400001)(6512007)(478600001)(26005)(2616005)(66574015)(2906002)(66946007)(64756008)(76116006)(66446008)(66476007)(6636002)(316002)(66556008)(110136005)(91956017)(5660300002)(8676002)(8936002)(82960400001)(41300700001)(36756003)(86362001)(38070700005)(38100700002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFIwT21QRitXaGpwb3BoaXduMTBzTUtiU0hMa05pK0lkajA1a0tLL0pTR3NV?=
 =?utf-8?B?MXJHRDcveGQ4aDJBbE5raGdQdkRibVJwQmcwRXdMNHdldjRyMkhOZUwvTURO?=
 =?utf-8?B?ZWNTck5BSlhhaVpFZU5hQ24rb283WUpYRkt4aExGSGRxWkZUNkZ5czFnNWE4?=
 =?utf-8?B?M2VWdWlkTW5yOXNYNGxjOG1nbzVTNTBsVmpBK0NNaGU5RmxxeWFla3NiUkZs?=
 =?utf-8?B?b2QwOWpoWFVTZEFHdk1QVTNFN09pNDBKKzBQcnlwM3FncjhuNlExamlPTkZT?=
 =?utf-8?B?MnhWVDdCQXNiZnJTOFQ2TE03aFl3UVNESHU3RzlabmVlMTloT1VBRXFDMzYz?=
 =?utf-8?B?aEYyWWk4UDc1Z3NMUHdtbllITGxZdy9uYmhRZ1BhRzlpeWdzeDFYN3U5Y0d3?=
 =?utf-8?B?dDNucHRFT25KNUE2RVMycVNFZ21hQ3hpbDVJNS92ODZnMHFHSVhyWkZyL1Z0?=
 =?utf-8?B?TUhSUVNTVXNDNmdIbWFvdFE0ZGhPd3RMQVRHdnBmS2NxdFJQVmxpVURhS2lG?=
 =?utf-8?B?U0oxYnJkN2ozb3dzZGRSZDZoUlRGYzdZQTNwZzRoNGdnM2M1WXlMRzEzZlBo?=
 =?utf-8?B?WHVOWnRyUG9nVDZYYWV3SEtuR0E0eVRWbGloV1dEQmwwaUw0MytNTGhuR3F3?=
 =?utf-8?B?bWYyb0VSM0kwQUpqYUZOOHlRbi9ibEFQS1JHbktWM05ZN0RKV3FTTVZHTzkw?=
 =?utf-8?B?MHpRYTc3QUd1VEs4RWZ6dndtQURES2JlanJ3eEVYOWJzamRwS01Kb25rRzlN?=
 =?utf-8?B?YklXb0ZvZ3cwUW13U3BNd083bEYzVmg5M3ZpRmtkOXN1SDdPVWs2c1NPZkpS?=
 =?utf-8?B?RHVSQXhPNm40VlltMUxMWDQzWG9kMTZud0RUYUczejlIK05RL0FwV0hmTUlU?=
 =?utf-8?B?VDBxOU85ZVlLUUhLcFBHbkxWS2xFSkx5NnczM1B3Ti9nMFdZUnZzZHo3bE5D?=
 =?utf-8?B?NExhVStoSzdScUcwSXZJQ3F5MjZ0TldMZlpWZnRubGw3YTRyQW0wU0o2RG5M?=
 =?utf-8?B?eXFReDJZZTVjVEhra1EvcVpnSlowNzdEdUpmc1MxdjI0MUluOFRPMm9zem9X?=
 =?utf-8?B?MFB2cU1tUUw0NWJOVTVzTWt0L2hKdlYweXVDMGRuL0NkMERBcnZ5VFR5K0V4?=
 =?utf-8?B?YitPUDUzQkRXeWxjYUhEdzFLMHcwaU5zTktxWXJ2TVV6TFlERnhXc2owQ2h0?=
 =?utf-8?B?R2pLZTRwNFdaaTZEQk9FZS9ML0c5MmpGb1NGUktxUTNWcmlBblIyTE5iNlpy?=
 =?utf-8?B?Q2kxdVV2NTRwbEZpYmNHOWJPSGlRS1BGdHhXK21VZFVWUmpjdWVPd1dKY3dE?=
 =?utf-8?B?a01Pd2Q0OXBpY1JkL21UVllMMG54eEJWYTEwMk44UDFkMWw2QVE4Z1krV3F0?=
 =?utf-8?B?MFZRbHNNTzZnZnNTVmdNRjFIcFFqM003a2lUSGNjMXc1dFdYdXdrekhaeTZN?=
 =?utf-8?B?Z0ljOW1MamJEWUQ2cStuZ0JGbmZ2Zlc3TTVLTkhRamFSZ3NBT1VKbnJWZmE1?=
 =?utf-8?B?NHFrUXQwWGdzRFNDWUpJVUY2dDZqSG1maGpwdDZQOVpwb1JNNFBmemVuUGY2?=
 =?utf-8?B?ZHZFM2ZSb3c0eEhLNFk2eUdvVEkyak1oYXZ1TUY5bWllSXRyVDZ4RDAxWGlG?=
 =?utf-8?B?bXhFMEkwQWpCOXlESmRhcm9hZ1l4T0YxRkxQZC9SQXZKS21sZlBkWGhORmZk?=
 =?utf-8?B?S0xKMnRvcGQzR3dhaDJJZThieXZTWTN3WkhodmIyaXJnM2wyWkdqVzYySlNk?=
 =?utf-8?B?ZU5YcDZuR1J5dkhENGcyODZxL0ozdXNqT25qbmwxVitHVkhsSUxTaGlOU0Zz?=
 =?utf-8?B?cE03a1QxZ21Td2R2bENHaittZkFONUttWlRDaWVqanZDMnhtcm9yYTlVc1Uz?=
 =?utf-8?B?RzY4cTB1TWVGSnlnUG9ndmt3THM0WDdQRkdrNm5qTEZJQk44ek56V3JtSk5u?=
 =?utf-8?B?L1lNcnBDMkFmSWxFVjd0M0ZoRUczRHhGK0NrTTBtYUFhNC9DTXFtdzBqWUhO?=
 =?utf-8?B?M3JETUZyRWd3Umt5MDZpL1dWd04wYzlONld1SFhsZW1SVXR6UEg0RVMwWWtt?=
 =?utf-8?B?bkdxYUJUR2RCRmhMS1UwQ1phb3BJclAyUVhLU1FqUDZ6OG1sSzdGUzhWTEUr?=
 =?utf-8?B?Y0x3Y1p6ZFVMYWExMUpabWd1c2F1ZG9WV3pxUUFnRWYxVi90QUxtWitBTXUx?=
 =?utf-8?Q?PcIp2+x0XuIoxTKqAByI+XA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <69DD9A70E0C4334DBD21C68356999D4D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff906100-4b7b-43b2-fb67-08dbb889816b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2023 20:54:52.4064 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yu56Jwbj/BOu0of4ETwhEO7s0npdZK6AX8RVhp/188r35LGc12VVSRh2EvZIcrAsW3mBFtGnqkk+zrOAAaJRbAYOVgaX+YoOkGVatngELng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6995
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/6] Revert "FIXME: drm/i915/psr: include
 intel_frontbuffer.h from intel_psr.c"
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

T24gRnJpLCAyMDIzLTA5LTE1IGF0IDEzOjU3ICswMzAwLCBKb3VuaSBIw7ZnYW5kZXIgd3JvdGU6
DQo+IFRoaXMgcmV2ZXJ0cyBjb21taXQgMDMwMGRhMTI2ODFiZDhlZmEzMWY0NDEyNzYyNzk1N2Zl
NDcyMjI3NC4NCj4gDQo+IFdlIGFyZSBhYm91dCB0byBiYWNrcG9ydCB1cHN0cmVhbSBjaGFuZ2Vz
IHRoYXQgaXMgdGFraW5nIGNhcmUgb2YgaW5jbHVkaW5nDQo+IGludGVsX2Zyb250YnVmZmVyLmgg
YXMgbmVjZXNzYXJ5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3Vu
aS5ob2dhbmRlckBpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfcHNyLmMgfCAxIC0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigt
KQ0KDQpTYW1lIGNvbW1lbnRzIGFzIGxhc3Qgb25lLA0KDQpTaG91bGQgdGhlc2UgcmV2ZXJ0cyBi
ZSBtb3ZlZCBhZnRlciB0aGUgcGF0Y2ggNCBpbiB0aGlzIHNlcmllcz8gV29uJ3QgdGhhdCBjYXVz
ZSBidWlsZCBmYWlsdXJlPyBPcg0KdGhlIHBhdGNoIGRlc2NyaXB0aW9uIGlzIG5vdCBhY2N1cmF0
ZT8NCg0KV2l0aCB0aGF0IGNoZWNrZWQsIA0KDQpSZXZpZXdlZC1ieTogVmlub2QgR292aW5kYXBp
bGxhaSA8dmlub2QuZ292aW5kYXBpbGxhaUBpbnRlbC5jb20+DQoNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiBpbmRleCA2MGI0ODYyOTk4MzQuLjcyODg3
YzI5ZmI1MSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9wc3IuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5j
DQo+IEBAIC0zMiw3ICszMiw2IEBADQo+IMKgI2luY2x1ZGUgImludGVsX2Rpc3BsYXlfdHlwZXMu
aCINCj4gwqAjaW5jbHVkZSAiaW50ZWxfZHAuaCINCj4gwqAjaW5jbHVkZSAiaW50ZWxfZHBfYXV4
LmgiDQo+IC0jaW5jbHVkZSAiaW50ZWxfZnJvbnRidWZmZXIuaCINCj4gwqAjaW5jbHVkZSAiaW50
ZWxfaGRtaS5oIg0KPiDCoCNpbmNsdWRlICJpbnRlbF9wc3IuaCINCj4gwqAjaW5jbHVkZSAiaW50
ZWxfcHNyX3JlZ3MuaCINCg0K
