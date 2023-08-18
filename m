Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BB3C05052
	for <intel-xe@archiver.kernel.org>; Fri, 18 Aug 2023 04:08:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79CAA10E43C;
	Fri, 18 Aug 2023 04:08:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ECDC10E43C
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Aug 2023 04:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692331734; x=1723867734;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=sNL8173wspJ/DShQjyr7bs0xE1BM3J+71v1D//OZsxE=;
 b=GXtc4Qj282Rf03FOuq4oymFMBLUt2Dp2fObcwbKW5hmhmHJ7Vx3rz+Mv
 Sn0m6vtt84XwrbnRs+7PLZE0/znw9llX7aSguLg8ujcB4ltxMJbWMOYE6
 ugyYID63kxVbKeb6oI7dWNU8hmF0tyJNU4j439qMyjZPaJpBKALb9TqTg
 PCVfR0g4b3HZIIMxMjzKf32hIQ6jJ4kAHTa4g6MlEK3E0xttVGGqbwOO+
 8692pvknJD6aUeAwjjfWTJr3Dfy+WHpO7y53S3I5qDDewkgzg1Ko4pRhJ
 Zx0mn3feZurRhzdIDAelPBhhgLA35wHXRaX6+0Ki2RdQueeCWgsL/wi6v w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="375784757"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="375784757"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 21:08:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="908702084"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="908702084"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 17 Aug 2023 21:08:53 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 21:08:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 17 Aug 2023 21:08:46 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 17 Aug 2023 21:08:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nyP4n7YVwNoWuuYk45C+NdYGKIqmJROOrelz9vLpf3Xyh+5kXVfPiB9XqxU7JC8b8TO0s35kdwc6qyhXS+hOHRsS7PraCZS/1fkc6PO1ukg/plvsGs2weMbveuFa7RZWlxDvNwkXopa5LZ4AQ+VLgGaE7V8kX2nE5OHZlWO9Iw8uQJNXQrvWSzYh7rgQVG7KZQE7oLUPB0lxTT+V84LhhR4Rrwd2eU+A3qZ/28BD3uvlcyV+2e5JrE78wqjdJOpYOxiZ0b5u+U2qsinTE/ombsAvzwIjCwsL+kZrn/QDboQTOWH1F203zfR0T4PO7JqWvA3Xn1+fuYcNTuH735fVNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNL8173wspJ/DShQjyr7bs0xE1BM3J+71v1D//OZsxE=;
 b=eeFHeIDCZFL3Ol1gpLSacYhLpcS/Sp/HbLyXMzVaOcrW5VyRSZgo5te99lOZ5HsQqfU39oNJ4jQiWiIeBTNc14penJROqdwwF/xP2qqZnW0PSMrVMOHVf63BEpsZMcWuoCSmg/0iCX/P7DfQyy0XChIctR+HH7slfacYuLk+2EbvKZfliUSqtFWEaHAbugT1CI/kD6c7vX1wn4TsCYMvteV0EKWdlAMLmo4GEKWUTXVxelaEngvr2uJHDPgKa/qyY3qqyGt8Y5yM0NOWBTe6Ecc5vohbUpi0RqnpAZda/G6FcBJn/9WCu9RIo+xxGN/qCZXNaGy6BvaZCOKMOdg2Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5629.namprd11.prod.outlook.com (2603:10b6:a03:3ab::13)
 by CYXPR11MB8662.namprd11.prod.outlook.com (2603:10b6:930:de::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Fri, 18 Aug
 2023 04:08:44 +0000
Received: from SJ0PR11MB5629.namprd11.prod.outlook.com
 ([fe80::6bc5:81ec:9f27:2004]) by SJ0PR11MB5629.namprd11.prod.outlook.com
 ([fe80::6bc5:81ec:9f27:2004%6]) with mapi id 15.20.6678.031; Fri, 18 Aug 2023
 04:08:44 +0000
From: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
Thread-Topic: [Intel-xe] [PATCH 0/3] Fix array of binds
Thread-Index: AQHZ0MPFyQbthm97EUqqIrh2I1grR6/vcdKA
Date: Fri, 18 Aug 2023 04:08:44 +0000
Message-ID: <510722ac122ddcdffb86f9715fdaf09752a5e429.camel@intel.com>
References: <20230817043148.740495-1-matthew.brost@intel.com>
In-Reply-To: <20230817043148.740495-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4-2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5629:EE_|CYXPR11MB8662:EE_
x-ms-office365-filtering-correlation-id: 943d9268-6c4d-4c0c-0762-08db9fa0d0a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +lKOSHo+Nsim5dVsrCirCuKHQbg4aGbg7d3mfunKSX/n4aVRnCYKUvLWoQCsNpWastwrG1dvKdNLzhKYzoIj0nhmPdaiRH7KQDlKhFr6FGIEelpqawsARjBwmTX+2zx2+lboSSCPJbRJyUKOjlQ56yORu1idTxlB/dQHGLaD1TspRbi/8bN5GwZ3PeMZ+9HtALdd9c70OG3E1FPXm1CAqpHv6GksdADt0/zLkJxbSF6xw2Eh5z8hiIdiGlkJGHnPURyGucp2EAcp1ZdmEqEOGJzS9Hj5eKyUpiIbxL4hh5NNV75Wb5JooKjAGDHeQIXf9HYFmWNGhzm98OHiYLXj/gD80Mraetyn5IfcxzbaPL0Yz76giy+Lp5GHkat1vuxq05M2shiHc1tOs4LZc86onrVTTgBRD15BLsGpARIlQ4AZqgqW5LGkO4cANALD7fvXwtO3b4LBYel3BVBxur+sG5gmVnNoyifk6su1qUMkIR2wFHu9UU+tHkw0jv4y2QSrkkdFgCu+wNwKkemB/HGaCamRUa0IbdyjTgw5JYAkk4bs0fF50/5eyeJTWu23ywoBYNfBvtRZa5K7AHbXXm7wylJvfEFyEFtOGMDazF9OXBg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5629.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(366004)(396003)(39860400002)(451199024)(1800799009)(186009)(86362001)(36756003)(82960400001)(122000001)(38070700005)(38100700002)(76116006)(966005)(2616005)(5660300002)(110136005)(66556008)(478600001)(6506007)(66946007)(66446008)(66476007)(91956017)(6486002)(71200400001)(64756008)(316002)(6636002)(6512007)(8676002)(8936002)(41300700001)(83380400001)(4744005)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QllxSXNLQTBadDV3TzYrWmxZS0tGWi92R1hyTzJDRWdmYkJudXFBREZvT2Zk?=
 =?utf-8?B?Nm1qc2QyclJpYkQzamMxa1F0WTluZTEyNUVEQXVFWG1OU1MreHJSNmZ2bUI1?=
 =?utf-8?B?QlE3ZGJZZTVrdVpuYm5GdHVFNUwrSDcwbjJYSzExb1ZjUS9UaVNUTWd5bW14?=
 =?utf-8?B?MitnZnZ6RG5Vc2JEK0ZibGd2YVB4L0tLWWEwMjl2S3VoU2I0R1AreHkxMnhY?=
 =?utf-8?B?a0dSeUk1VHp2cFZVU1RUV3MrMkxtSkVndFJRTGk1T2dKWFlBVzJQZWNaNitJ?=
 =?utf-8?B?eUVOZHJqaGEwOGRoY0RyZVVzSVVrQUp0dXI3UnpnMUUrdDhBNklJN0FBbmxD?=
 =?utf-8?B?Z1NBRUlmU3RuVmh3YlpBdXYzek8vSHFsZUdmcFB1c0duK3hJemEzT0JPSnR0?=
 =?utf-8?B?MWRibCsySTNndkczakl3OFRrbTBaanAvK1ZPQU5rUnFwK1hWV2xFTnBRRmJw?=
 =?utf-8?B?Z0RONWZTdXFuWTBYUTFpMVFwNS9LcGRkZnI2MGFMakZZUDc5SXRCempnQ3g5?=
 =?utf-8?B?T3lOZmNYOGlTVTJscWwzZlBCencyemhlRzNkM25tVE5RWUZ6OG40djZiYUJW?=
 =?utf-8?B?cUhhZU5RZ3AzVGZhS01UVUI0WmFySnJRSkZHUHEyUnFmd0dnS1hqWTl0eHhT?=
 =?utf-8?B?L3VkWkMwZEN5aXRIZ2dNaExEN3EwV0szYXI4RHV6RXhEUXpEdVV6TGZWbkxj?=
 =?utf-8?B?N0dXU210aGNpNmQ5cGd4aDFENHNIVXZ5REhqbThiTFFHWGdFNElNUTBpcmVt?=
 =?utf-8?B?ZE40dlVlWnBUNzBCSEZ0NFJvSFJmaFRBbjk4SmVBR0ZGYU1DSDd0Y1h6aHov?=
 =?utf-8?B?aXdFVzVZaFpLak9CWkZxUlkzaUNid2tyeFlsUGwwbEtxVFFLNWNCNUdtM3FY?=
 =?utf-8?B?MHBTTEo4Z2drdE1pNWJOb3RwRU1TSVQ4TEl3cm9wdzdIL0lWOTU2L1RLRURL?=
 =?utf-8?B?ZkFYTE5Jb0ZBYVQ5ZGM5Si9ZV2tMaW51QzlCNTcyZThCazMwMUtaTGVRa0J3?=
 =?utf-8?B?bnZQRmVzQXdUbVJBTXVjVENxZ2Jza1NsQVlKenFGbmgvb3Byc1BwRDBIOGJ2?=
 =?utf-8?B?QnNlb1pLeG5YZVI3MFRHSVJoQkI3VVdybHpQUkQ1OHA4dWNVYjdCSzZqNlh4?=
 =?utf-8?B?ay9QRCtGSk1RdDVldE1mcnUyOVZIaFFWVGpsSXE1R3ZMazR6Y0prTUpCMnRo?=
 =?utf-8?B?TFVCOTJOM0RtL216LzhMWVZUSjVUeHlXTUc3bUtpQ1cxMmVtdzdRcUN2MWFL?=
 =?utf-8?B?OUZXUUNHYzB3bEJBb0R0T2h5MmQvdStzajVaT1pZUk5uRklFQzJKdERwUE9i?=
 =?utf-8?B?VEVmczJlK1lUSDhGYXVwZ3M2MkVHZXBuaVlMN3RYZGRBdjNoUDdhV1Z3TWg2?=
 =?utf-8?B?QmRld0tkMk9BZ3dHblllSC9hak94TlNWY05QdnlxaUdsNURVWkFwS2ZVOXVz?=
 =?utf-8?B?Smt2RjdCUklKcDZWKzFQbjYwU05Pci9mSUQvK00vV2Z6eEJlNldJOG43eG9G?=
 =?utf-8?B?cGRZNDkyOXl0OHFCbzF4NXNjYjBiNnpIeHlkZWFFZU1yakhuTkF1RHNGNlcy?=
 =?utf-8?B?clMvckl1QWw5MnZhQXN3NG5MSitRWDVQT3dWRjhEcFFQaTZ4NHFoVGlSbVlH?=
 =?utf-8?B?UFdzRm9xUHRSY1ZQajJzRjM1Tlc0dm5Ub3plSHA2MHYwbk4wNG83SmhDazRa?=
 =?utf-8?B?VWJLaGc3OFNzeHBiZGk1em1JdExaV3JhM20xTUN0b1FnUjFaNzlubzVuRU9s?=
 =?utf-8?B?c0JrTVlIZ2pTRXhCOW9OSlo5WE1FR2E3SlRBVStUVW0vU1pNbzJOR20vSGow?=
 =?utf-8?B?NzM5bmFCd0xPWGpEVlVvZVdlL2l0c1p1MkY1b2F0dHEzZTJmN3dpTTV4Mkp3?=
 =?utf-8?B?RC9jaGd2bTRvSDNCd0lYTXhFeUxTeXZ6VEt6WWE3b3VYZDUwY3JiVmx4b1lv?=
 =?utf-8?B?b1ErOWRwcW5IZmNpbzl5b2M5ZzN5bFVEREw2ZkUveENSMkNDdDNPSktscVhT?=
 =?utf-8?B?R2Q2VGV1YUo2VC8vOGJDcGFLNDlGUUtMM0pMc3JSR1JVWXQrZ040d2trMzhD?=
 =?utf-8?B?aW5icVBIWkRRSGw1Z2lhRk1ndStVbWpnYW50LzZSd0VKM1N0K2tWUlVmS1o1?=
 =?utf-8?B?VkJNSlV1WXl6WDJNb3JCM21qTUtkeFFnTGJMMzZNdGZKZmpObTVla050TCs0?=
 =?utf-8?B?ZllqalZPNkwrYW9vK0pzVHMyT0Y1eStNOVhIMmNSR0F0bGZ4U1gwNzg1S0tr?=
 =?utf-8?B?dVB3eFFvc1FGME5RMzN1QVgwYUdRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A1204CD3E58C974C9FCF6EBE852ECD69@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5629.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 943d9268-6c4d-4c0c-0762-08db9fa0d0a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2023 04:08:44.6580 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y+VJPRBAUQnAYmyq4/ggWb6SpylIgwrk4DwgWH4aR23+uIP+3oy9UI3uBRBF6n2uIs3mkm3H+2DKtR8h43Z8EAvYAmt9YFUcqsiy5ZVmHrc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8662
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/3] Fix array of binds
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

T24gV2VkLCAyMDIzLTA4LTE2IGF0IDIxOjMxIC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBQYXRjaGVzIHNob3VsZCBleHBsYWluIHRoZSBpc3N1ZSwgZml4ZXM6DQo+IGh0dHBzOi8vZ2l0
bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0veGUva2VybmVsLy0vaXNzdWVzLzUyOA0KDQpUaGF0IHNl
ZW1zIHRvIHNvbHZlIHRoZSBpc3N1ZXMgSSByZXBvcnRlZCBpbiAjNTI4DQoNClRlc3RlZC1ieTog
UGF1bG8gWmFub25pIDxwYXVsby5yLnphbm9uaUBpbnRlbC5jb20+DQoNCj4gDQo+IE1hdHRoZXcg
QnJvc3QgKDMpOg0KPiAgIGRybS94ZTogRml4dXAgdW53aW5kIG9uIFZNIG9wcyBlcnJvcnMNCj4g
ICBkcm0vZ3B1dmE6IEFkZCBkcm1fZ3B1dmFfZm9yX2VhY2hfb3BfcmV2ZXJzZQ0KPiAgIGRybS94
ZTogRml4IGFycmF5IG9mIGJpbmRzDQo+IA0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMg
ICAgICAgfCA0MjIgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQ0KPiAgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3ZtX3R5cGVzLmggfCAgMTAgKy0NCj4gIGluY2x1ZGUvZHJtL2RybV9ncHV2
YV9tZ3IuaCAgICAgIHwgIDEwICsNCj4gIDMgZmlsZXMgY2hhbmdlZCwgMjM2IGluc2VydGlvbnMo
KyksIDIwNiBkZWxldGlvbnMoLSkNCj4gDQoNCg==
