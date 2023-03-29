Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2755C6FD18
	for <intel-xe@archiver.kernel.org>; Wed, 29 Mar 2023 17:59:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF63310EBEE;
	Wed, 29 Mar 2023 17:59:51 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B9910EBE7
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Mar 2023 17:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680112789; x=1711648789;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=FWPqHWZW9lQ8+tUfTL4EzmcA+3i+v9x0oB1B306cWcU=;
 b=Qcz5HgXz21pHjhglIP0VPleiqEchpYx8NYEPhdy7zJofKjNkLwx9Q7ZU
 XfrocAkYpcK5q0L4X5qWC49/q1Ya9YeS205YDAyYAzYBZ0+8353tEySW5
 XFFc+V/TzoV9Ojv2RQCr3eEfB4en7cMs3uRYE9OBt8F1gvZ5BQBCUulLc
 1jE1B2Rx2VKeFLvo/sHHltaBzpCZ33COV4U3dn+Gx49EUoBhPgdUL5wus
 VWojdEF5BYsDB5WkowNTM3GB7k7DQEZjGglhQk2qa0A/Nxk68atDHDAhN
 jYbEMuRZWW9zkUx5s3dVmAPYRpZ8yl2rS/7GrbZkBVGzqMMG0RsPXadxB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="320615403"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="320615403"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 10:59:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="858592553"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="858592553"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 29 Mar 2023 10:59:48 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 29 Mar 2023 10:59:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 29 Mar 2023 10:59:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 29 Mar 2023 10:59:47 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 29 Mar 2023 10:59:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LY62dlKlSH3LFWoeVVxd68w4wvM73AZG5ikSQsn32Hzfb/49erSX81xPFYeWLHdVrQEsrB1woDlr5ejyWZAArH4pzlF2zIYmqJ/kHnVgeU4Qhv155QkgPOBJESoDNf3BCavAz6hdycQe0mmn2KmnCe5vFSzaWUyDv67LGKJbCk2OMeh4YNBeWfBIpCMjSg2ZmLn3kAjq8SQG6dOc17B4pZnKNsgBCJQCDGmfbuAdRdBgFdSCOLg5YEKSth8EX0tvKXpy1P7h8PhKgZEBmrUj/wFoVs05Vukggjs1s+dqnmK6FhLjD8+D0RIpunIoLxx4UBx7jXkFFg6Syuy4iwtc2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FWPqHWZW9lQ8+tUfTL4EzmcA+3i+v9x0oB1B306cWcU=;
 b=jeLAVAc+llHLm8bw/JUyeFydlj+F231BBSVNgkl6x2mg9WWEiquOXlRuSt0VCjOsvIrgBefV9wsXbS5Po6zoUnz9cDs23kCSFq5sDrm6pyO/pGY8dkAlYaWC/ecoK/23KGV7VcyOOBtwWdnuW32Wc3vnVNBCSa7b3z/ZZCFe1jJFikBxGi1WrWybElNQQIgv5vWx289iZFjj6csTpWQrvMGKHeB1QQ1YL8hSHbox76zmD/MOC87UG/HIyfb9/WHgzYVO4XRGbPjleVRhGM5+8hzWd9ZgZLCHssOkY3B37dbRV0XOR0y+pilPnJBZb3GGJKIrgBV2hmSGXKKkY9cJTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH7PR11MB5944.namprd11.prod.outlook.com (2603:10b6:510:124::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Wed, 29 Mar
 2023 17:59:45 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7ad:5a7f:9d62:e51f]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7ad:5a7f:9d62:e51f%5]) with mapi id 15.20.6222.035; Wed, 29 Mar 2023
 17:59:45 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper, 
 Matthew D" <matthew.d.roper@intel.com>
Thread-Topic: [Intel-xe] [PATCH 0/3] Minor batchbuffer handling fixes
Thread-Index: AQHZYmSyPAnGjKkGBUuTh/TxcR5FAa8SC6yA
Date: Wed, 29 Mar 2023 17:59:45 +0000
Message-ID: <eddd577a89138154f4d7af6b042f51299cc63ce4.camel@intel.com>
References: <20230329173334.4015124-1-matthew.d.roper@intel.com>
In-Reply-To: <20230329173334.4015124-1-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH7PR11MB5944:EE_
x-ms-office365-filtering-correlation-id: 0db7fced-975d-4851-3f16-08db307f6115
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OdLx0/TrbnLOYMGPYVPSfXnHe95r49NwkBulYqg/0SVEt0RcxFCh8f2tX2zEghvCXh4WaZlPJlZ7pTYLfbN6h6pNbi7AyVq1D2OGgXIZbqPi029rEDfnNS+SBOcYtXaHMTy9DJeS0pOZ0BylgABsh+B+8aKbHGEIz9qvQY2L4QlUuuFt3GaYMNBbVQeYWEk9cO4Y5VADjScjgAuikKgaLpf00AmPXg2mZOU0mGqa2PGtSTmceK2SQ3fIx9zaXo27QH9FpRGOqp1cNryHHjAa8P7k01yBRh2PqXzMljZCNDCxvyeoCtK+gF9fvWAERsp7rYEY5J5sEER6D1HGi7sudbIS3ANHAkvLbRheiOZS4GzFyvhJGuJUu1uc2g4ljalX8OFAYwPGAgnS7S27SekXTpQeVPDWce6E43Eh1yvUGEeXXYNC2LRnisI1oQQWbEAu6pMAPtTG5IqK7YF51jmqECHbIiH0BdKlP7ZWZaZffflMwHc4+xeOuG1P/hm6eq0N9T3gtrLxRvvM2GGsNURht7/FrCbjGyill1LbXYKeT0TEwjRwaQoOhBSyYhpvM0IL4J4gsgAk6UfAySfDvnGBMoOZBo6f9eqjZZ4nhKCT7JrghDk3YxCFF5by5CoDJzS1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(376002)(366004)(396003)(39860400002)(451199021)(4744005)(186003)(41300700001)(2906002)(66476007)(6636002)(71200400001)(64756008)(38070700005)(110136005)(478600001)(66556008)(316002)(8936002)(2616005)(6506007)(36756003)(83380400001)(5660300002)(38100700002)(6486002)(66446008)(91956017)(26005)(82960400001)(122000001)(66946007)(76116006)(86362001)(6512007)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czZKMWRNMWs2WWR4ZEFyUUxzYnM1Um9RN21adXo3Wng4L0RtaDJvSVZJZTlG?=
 =?utf-8?B?TXVHMjhZSll5RmZoalZrNlZvdU1kVHFmaTN4VHQ0N3cxZ2VYQUs1RkNlTEZx?=
 =?utf-8?B?VjMwNWo0dkRsS3kwUVJHcmxCQitsaDkzZWNCWC9TMTZIbkJpTnc4ZlQybC93?=
 =?utf-8?B?ZUQwMmg2dGQwcTU3VEhtZTRpc2VXMWx2WXh1UE11SXRhYkUxamdteDk0ZkM1?=
 =?utf-8?B?TUJwajRiY0U1d1JFdWxKbjcraTBVTGtVZ1lrMWd2WWZvRzZ2NzV0cTI1cUsw?=
 =?utf-8?B?WG1XWGhoTmZwV3VSSytjZWg3aXRJZldLMTZVQVdtVjZUSUNXMG5HTEZvb0ox?=
 =?utf-8?B?NFBqeGUwV2JuckVkT3V0dm9zeVM3VzlKUXF4bjRUUytYK2NrQTdFQXViY2E5?=
 =?utf-8?B?S1FPcW1OQTZXS1JHYWZsRUt2enViV0ZOYk1UQlROSjJUVlJjdHpPSTAvUkZ1?=
 =?utf-8?B?b1c5NzlQRWdVc2l4eUxxaE9HUkExTTE5N3ZMTTlHclp5STdjYStoZ3lzZXF2?=
 =?utf-8?B?VVVlcGRiZnZ1Ym9IdnorS2ptTW00YU5uRldWa2cxcHo0bmxEVEF4VzZwRUIz?=
 =?utf-8?B?Wlc4SzBMZFB2SkpXdGpNR0k4TGt2ZEtlU2JLMFQ5VjArRGw1VjBXeUNvY2kx?=
 =?utf-8?B?dmJoTU14NTBLditKbVV4NEJFTm1RampsR3FxNnE4aE82ZzUyemJjcXVVZUVZ?=
 =?utf-8?B?SmlvSVZFTGxsUHh5VEE4bis2WEUvUjEremtIL05Qc0lZSlUxTUdObWVDdnhB?=
 =?utf-8?B?VjJMTzBxSVk5TWpqNXh1d1RPKzQ0RTBUTWJIOWRZUkhIbC9QQWdrSkJSei9F?=
 =?utf-8?B?U2JVTnc1aGxGZXJnQUQvNWV3cUxoYytSUU1VQnNTVHVWVUR5SlFKVWNCd0VM?=
 =?utf-8?B?RW9Ld3J1alYzYkNnRDNkVGQ0TDdjTkFsOWk1enBDVGpaV3dsdEZzM042dTk4?=
 =?utf-8?B?STN0YnVJTklveHk3V3BGYUpIL1lucWc4TEdZemx3cVNXNWJxRnRNNVpUd3F1?=
 =?utf-8?B?SzQ5NHVUcmErWkFZWmowaDhDTlh3d0M2RWtHcHd5V1V6ODF1aExxcTVmbWZ3?=
 =?utf-8?B?Uk94c3FvSHJEWUFtRmpJZVRlNEZsUkFibDNZL2ZVWDF4MG9SUWxhUjBXUzhr?=
 =?utf-8?B?LzY3Z25Dek1BQXE1a0JIUmJtdnVIaUw1cm5xZFkrUnRnd2M5UkRSNGZrVTVy?=
 =?utf-8?B?NFJFRnd3YlZia2Q4eXl6cWg0aGFjQXBSVmthR1NQZ0NOd3JaOXNMS1RWQUw4?=
 =?utf-8?B?MmNGUVY3Q2tGcXFzZm8xaTdDYUg4TU1qSjgwSGRnMXFMc05XTnVyeEJBQXZs?=
 =?utf-8?B?YTVaeCtnUmtTcWtOcE4zRURxdFB2bHhoc0s5bHJhUjM2QlJqODB5SDJnSVRE?=
 =?utf-8?B?MmRtRFBBRDA2WS9sZHFEQTBpODhGanBCd2swZVkwSmJFWlNwTjc0ME5rVjA3?=
 =?utf-8?B?eklTMGFwRUNXOXFXSDQ0RkdJd3J3aVQ0MDAydGg3b1hlRVJGbGRiTmpJMUlR?=
 =?utf-8?B?ckp2YTZBR3UxbUZ3c3UyYzJjRVhrUUxxaVR0aitiOE9ac1B4a3dtNmljdlZR?=
 =?utf-8?B?REhlN0JncUVIYlhoK2R4VW5naDlBWnJTTDNBK0wxMDkxOXgwcVpvMVZiMlNX?=
 =?utf-8?B?czUxdUhEUUc0UitWVDQ4dU43bGpkUUJPeFNZbjFrUjdzenJNRGdMT3dLVUpE?=
 =?utf-8?B?aWlNSXc2UXhRcFJZMW1DZTVhVmhHd3Y5TlR5SGNyd0JuZ2RmVXJSUXkvL3BD?=
 =?utf-8?B?QXJBd3F6aWhkTWQ2U3BNR1FIb3dlNFNjaTRSS0hnd1l3eFh2TWhEeHJtcytu?=
 =?utf-8?B?OW5UNHJPSWVCUXFCNG9ZTkd3ZkdUdjdQYzhzWkRGellRM2R6MWpiMFFQNzBx?=
 =?utf-8?B?aEluNTdmelFQakt5cy9XVmVtTWU0L05hOTVhZlVCYUZTSS9qRjl5M2JRNzVw?=
 =?utf-8?B?KzNxN1E1VUNrSEx0eTNzL1h5RlpERVNsdEdmNVJTUmZMOTdLaHgvdFpBNm5R?=
 =?utf-8?B?dzh4bGN2TVFUZlp6a3dqM0xiN3FoTkdRdFVKSzVDQjJQZUtQRUt6d08wVVd3?=
 =?utf-8?B?Zm45NmhkY3VEQWg4U2Y0ajdRZlNBQzE4WjlrZDA1OFd1RWZOZ05qWmhWN2lG?=
 =?utf-8?Q?iPDfJhGpoDDV7VLFaXTQvL/vu?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2BA63ED0E3A0D24A8C51C0496EC44E54@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0db7fced-975d-4851-3f16-08db307f6115
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2023 17:59:45.0489 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 69td/T9rVEO9AAJjx15YBjf4YKa+EG6vaUEPBttma/CJTwynM/XeuJ5XjDrpmljNgufDCqldNGla3TmwTWhiSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5944
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/3] Minor batchbuffer handling fixes
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

T24gV2VkLCAyMDIzLTAzLTI5IGF0IDEwOjMzIC0wNzAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiBY
ZSdzIGludGVybmFsIGJhdGNoYnVmZmVyIGNvZGUgaXMgbm90IHByb3Blcmx5IGNvbnNpZGVyaW5n
IHRoZSBoYXJkd2FyZQ0KPiBwcmVmZXRjaCByZXF1aXJlbWVudHMuICBJdCBpcyBhbHNvIGVtaXR0
aW5nIGR1cGxpY2F0ZQ0KPiBNSV9CQVRDSF9CVUZGRVJfRU5EIGluc3RydWN0aW9ucyBpbiB0aGUg
d29ya2Fyb3VuZCBiYXRjaGJ1ZmZlci4NCj4gDQo+IE1hdHQgUm9wZXIgKDMpOg0KPiAgIGRybS94
ZTogSW5jbHVkZSBoYXJkd2FyZSBwcmVmZXRjaCBidWZmZXIgaW4gYmF0Y2hidWZmZXIgYWxsb2Nh
dGlvbnMNCj4gICBkcm0veGU6IEFkanVzdCBiYXRjaGJ1ZmZlciBzcGFjZSB3YXJuaW5nIHdoZW4g
Y3JlYXRpbmcgYSBqb2INCj4gICBkcm0veGU6IERvbid0IGVtaXQgZXh0cmEgTUlfQkFUQ0hfQlVG
RkVSX0VORCBpbiBXQSBiYXRjaGJ1ZmZlcg0KPiANCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9i
Yi5jIHwgMjkgKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0NCj4gIGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndC5jIHwgIDIgLS0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygr
KSwgNiBkZWxldGlvbnMoLSkNCj4gDQoNCldob2xlIHNlcmllcyBpcyBSZXZpZXdlZC1ieTogSm9z
w6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQo=
