Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E334C7EE23
	for <intel-xe@archiver.kernel.org>; Fri, 24 Feb 2023 19:47:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA2F10E5DB;
	Fri, 24 Feb 2023 19:47:09 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC1A10E5DB
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Feb 2023 19:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677268028; x=1708804028;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=CBkWnv121i/T/GbR1WWOk33VQ7IgHGUCtubMK37kg6A=;
 b=oGZyvpeEgKX8/IwG3gnnvtb9CT/mDB0gUomfZUL+g6gWPI/wJ8OXij8+
 mzgZNgCm1qI2VSQq/+Xq905xcdpo53jBZildLSgQKBYpRCzGDc2SfE8jq
 X17D1n9aZxZ03gs3Tjrce2g+RBq7dQ2UPgVWnYt+s6zaFNYrTZNKqF/G7
 t962/HfOCeKZkJGdrwnDj+h3BQP0uYTPkwM+OpGftvtpxtnpaz6DSexTy
 PoRfxNJrhmbFEOOSE6wY8BkP0Xd7hO5rywdnTH8CrnrtHIByFVQ5ICbqz
 ajWOavYLilBonSfTUo4Y4lw5cdfsoD1yEpPAOxv2cBdwix5/TAYx3gLWZ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="398299093"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="398299093"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 11:47:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="675046708"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="675046708"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 24 Feb 2023 11:47:07 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 11:47:06 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 24 Feb 2023 11:47:06 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 24 Feb 2023 11:47:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cg2Xj5EODnRc4aII/f6uPmiYPq+SaMS1zBFQzkz1ObKGM87ktbG3eFRUX6nZwXm43uSr4igkL9cP8x/WcIrs+7ruZVXBLC3azdSEUOjW7SWKKs9SKt5pVtmRbnXmPKrw5Xgdb+PxDgG5pJkfFkF6WiP4RYeznyfZFLReMVkM8I1Qkyv7Xv7EpyHKYa/+HA1iK5kIlbl3g154qbIbCkbxQs5/U1lAROXsZFyy2RkXYB+f1EMEPXF6NWQq0gHNbkot0JKqb5xK2eZX8XDgJWX2wpC2Q35icKzMzM7U7ulCwZcmNW/p16qvmS9YCPYVDmopl9D4eYVF8FlgNmBnkuU4lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBkWnv121i/T/GbR1WWOk33VQ7IgHGUCtubMK37kg6A=;
 b=aOxa3hcdgvwkWSln9ZPqMdoBD1agc2wl9acsE2pHVJt66w64o5KWrw8HtqWOTfsUc5yq4Jbuq5sQIyT/a+aFM7sjv354DyAj/k4MINDHrDt+voZ/vDTyexkYr/CKi/EC74ebI11q9QfavCl/jqekXH5BO/q/SCsyh7jsS+T76xCRS6ccbCMW4jGZ6CNhDoy49k+b22z61ePdtZLgYDJEtV8ZDHz+PiphUR8KL2JcMc7crrHeSTvdGELMxiAfybszB+TyIsbiBN9vy+wg+oxyN5PTSFK8LIez23wF42rS7K7OpsFvK/YMNtUaeL6kDLhOp6TzhegxwvAWnF6kJTvLvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB6623.namprd11.prod.outlook.com (2603:10b6:a03:479::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Fri, 24 Feb
 2023 19:47:04 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 19:47:04 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH v2 05/11] drm/xe: Remove dependency on
 intel_gt_regs.h
Thread-Index: AQHZSH3l1MGXPENx7EGuGFGT5ybtUa7ebCgAgAAUYwA=
Date: Fri, 24 Feb 2023 19:47:04 +0000
Message-ID: <5996d61189ec584381319540402a66c03dfd840d.camel@intel.com>
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
 <20230217005226.106499-6-lucas.demarchi@intel.com>
 <Y/j8lmaf2b49It/M@mdroper-desk1.amr.corp.intel.com>
 <20230224182914.ytykgqzkp4o4ibcg@ldmartin-desk2.lan>
 <Y/kDHFFeDZY6blAt@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <Y/kDHFFeDZY6blAt@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.3 (3.46.3-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6059:EE_|SJ0PR11MB6623:EE_
x-ms-office365-filtering-correlation-id: e2e8cb05-7e65-44a0-bd47-08db169fe7bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a74dbVpPseCc5Ujid21DevtE7MOuTf4DCNnymp5OSI4AO+ueyO4YtXs49zwlOd/s7qY3neJ63PYpTBFVTn+QHM5y+9aTG7/aUxjjyLzRPvK9WH6pG2W9ntyACdbZVBgtzsTvT8vthe2K0qFvVnpi8LHR+WUZFpI642jazq2Vn5pyfj8iiSHNEVt/OlOfqDo3bIbxGDYsnvTXaGUU5PZAY48ZEBu3bex6G13T4dZVagx/DIr5ofG40sAIh2pSSboggFmd3W9gd7/HDVvVxeGSpuchP2HRbvj8X5G8Cloaq5ICfNjAHfnm/NtWpVJp6tWzhzLo43if1G8JDxvjnfCMZmsYEo4JYlvoi1G5J4SqTer9GauyK7cXRULQdI1+2hzmYGQeWscvN3P/fhD17eKNaqTMGZmhd8orbaIqnjamoU/oh5+XoxKHqp7AIKuDTaspfX5lpgnvUz0Oj9hH78bN5EF9pRZzbhprkCwbU40abocb+8nJq7IDHd9fy+QPGjBT2to8UAx5vtyJcTEg2knjn7+PH3V4gellGofYr37G6hpiwDbV4eBAMlaDNdvlk2mRm4lAAS8PrTquktLyIEpL/YlXwvsF33ClkyxEwg45o1A/R6ev8km6s171Nck4/QbY4/WNIotMt17jrv7hHpUIeHx5em8pwKmw9pjPOVyZ/IeH1KmnPD9OPmHaL0YWhueXT0c9xB+C1fH+KOudwq2z7Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(39860400002)(346002)(366004)(136003)(451199018)(86362001)(38070700005)(36756003)(76116006)(2616005)(54906003)(91956017)(6636002)(66556008)(41300700001)(66476007)(6506007)(66946007)(316002)(4326008)(8676002)(64756008)(66446008)(107886003)(6512007)(478600001)(110136005)(71200400001)(26005)(186003)(82960400001)(38100700002)(122000001)(6486002)(5660300002)(83380400001)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bzRqd3RtVDNBdU1vc1ZFK04xNVJWaHNFNk5JZVl2RzBkVE9EOGI2UkJNUzlB?=
 =?utf-8?B?TjA4TDJwWlZXV1A0WnZDdTErcXQ0ckRpZDhCTU1WWXlpS0hrTVdKSCtiTHdU?=
 =?utf-8?B?L2c1UVFvam5jQ1Rsa2VHWXFKUHVkUWgzY2RzeHcyYXNla2dSSlQwaGF0QWt3?=
 =?utf-8?B?YW85TXlEbExQSkdKSlJveTI0RUQvcUhRUmo2MG13ejFoODJka0k3WGRhaitI?=
 =?utf-8?B?aHRjbWN1WWNBS3U2RGVqbUdLckVQM2w5S2pIaWJSeFh0bWhTT3kvMDk3NkFj?=
 =?utf-8?B?U09FejNJaTVFOEVpbFVPWEF0UTh2Q2dpOFRETkNEWnhzakkwVEw4cUc4WlJu?=
 =?utf-8?B?STBqY25CTXV5VVh3YlNoMmI2Ujh6dUErNjEwejdWM01IbE5kRnBobktGTTZx?=
 =?utf-8?B?S21BZ2hYYnpTb3Z0L0V1QXBobU5rc0dnUEh4Q1A1c293WHA2cHZiaU9nMTNG?=
 =?utf-8?B?Ym5kTFhxSXhxRlFqdkFuSVAxbkp5L1NxZmJLLzNkYm13dENJeUZPc2puY3hB?=
 =?utf-8?B?aUFFOXlpSTFhZ0lTR3RJejVseUpSd21IQzhrZ1JvVFRXTWZlTGZPb0J6cWRW?=
 =?utf-8?B?cVJpbjZSUEZ1Ly90WCtSZHZjYVNyMnpWVUoyMW5YazNpaVBhSlVuS3RhN2lv?=
 =?utf-8?B?Z3d6ZUVUNU1ReEZSZnhScHNsbGltZFpJZEg2UVByTEI3R012VEN1QzNtSG5w?=
 =?utf-8?B?c3ZVRWRHejZ6T3RCc010bmlVKytqVktGQkhndlBSbjBiUWRPelh4eEs2RExD?=
 =?utf-8?B?OFdOeEJob0hQdkZ2RmY4WXZJa2IwR3ZqS0pyM05uMkIyQ0l2U0hKNjA1Mysv?=
 =?utf-8?B?NmFZSHRBOCtEVExPSlp0WHJtV21OUEpLano5UktHUDNMRkJySlZ2VFVTeFdG?=
 =?utf-8?B?U3lzL3FKZ2J4N1hNSDlKWUpWbWVMNGdmWXlub1RRS3FCU0RwMjJEYkkrR01J?=
 =?utf-8?B?ZUNPK3JJT0FldmhsYk9iOWRNcGVoNTFFUUIreVZRMURPOExXclI0K2NnQmNU?=
 =?utf-8?B?eDM2VjhCa3l2QnFkYXdXaVU4dDBuTVUyVFhtTVZqUEl6Q0NwQ0lsSkJ1cmxS?=
 =?utf-8?B?cUFmZEhKN0VYVFU2VmNqdnpxN3BhQTY5Y09pSDIvbWJBVXl0UENvbEhXaWdl?=
 =?utf-8?B?dkQ3bGRTYmJIbVRvRjRYVjZlY2NySmV4UGp3VWlyZUtva3lvd3JkMU93Q1dV?=
 =?utf-8?B?aTd6a3JPN1pmSWpXOGtXRW5ZRDhxeVB0U3RnNVJHSEY5TVl3NHlzTXYwYXBK?=
 =?utf-8?B?VlRJNzMreThtKzBGZjlmZ0d2V3N4SlI3MFNseERjYVc2bzdUWC9BODRwcG1R?=
 =?utf-8?B?MEluU0dtZjJSTUpsOGE3VWVaSTM5TnBzUWZrb1p1Yy9Mbllyb3c3ZjdtZDdI?=
 =?utf-8?B?SWE2UEUwSWh4MlFyaVd6Z2NiR050YTM1MndoVXFwcEV3cVB6QTIwMGUrYTBX?=
 =?utf-8?B?c2ZYdGZNdUx2RGhmRnVkeXpCbk5Hdk5BKzE2bHlhV3JCYW5jOVhtRVNXTlRM?=
 =?utf-8?B?TnRmVHBaUkF4YmNqNUt4OEJMZTFNTEZHWEVTWTdyKzBUeERIRWZiV3UxRm0y?=
 =?utf-8?B?aFpNTEVLS2JXazFGNXdGMWo5K2cvNW4yRXdWZW5mVDFlWDN6ZlZaeGdaYkJI?=
 =?utf-8?B?VCtJZUttd2VoWnhsNjZBODBta1VjY3JwR1lzZmZhejJJZ0JGK2ZFdzBNZWl0?=
 =?utf-8?B?Q2x4V2wxdnJZU1FhdmtSUyt4MlhLMk9GS1ZhMTloT2dPZnlybjhLOGgyZUs2?=
 =?utf-8?B?bzl1anhJRFR3cW1obi9VRldPVEZMNm5mUThVcWQzOTdvMlRxOUY1TTVXdmZm?=
 =?utf-8?B?ZENTZmZNQWFXb2wvM1BSbzJkbTZORFh6TUVGazZnOXNHYS9USk1sZ1hOWGxx?=
 =?utf-8?B?UE1nL0RuL2J4TnhzSmhlbWNQQnhkRHZublN5ZU9OR0JycXNycmhKQVR5M3JB?=
 =?utf-8?B?cXZmUktla2U1NGRmN1BRNVRSd3NRQWJHd0N1dnE0dUtuYTdFUklzTi9Ebnoy?=
 =?utf-8?B?dVRwZWduV09kOFFyZExiYmpabWJDckZjTDRmNnFydzBLc2ZjRVJtODM2K1dV?=
 =?utf-8?B?UTlDRGg4Wm5pRkdIUU1ENnZlUElzWGZFTTN1T3BRa2RRSFVpZ2tKYWFMQ1p6?=
 =?utf-8?B?TXo2VWVUaUUxTFZpOVcwdkN1b3ArN0JubXAyOHl2Y1FlSVpJa3Z5SWZFZzZo?=
 =?utf-8?B?VlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <187CD5131097984E95F6E7F2BB87E8AC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2e8cb05-7e65-44a0-bd47-08db169fe7bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2023 19:47:04.6171 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QFU88zuy09jcvFrZPP8gsQ1mmjN4xZ5IFiEVHFY8X0J3niBjyHjYLJCRXmW75dbi0Tl2wJx1BtD1d/nutw5IqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6623
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 05/11] drm/xe: Remove dependency on
 intel_gt_regs.h
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Lankhorst, Maarten" <maarten.lankhorst@intel.com>, "Auld,
 Matthew" <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIzLTAyLTI0IGF0IDEwOjM0IC0wODAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiBP
biBGcmksIEZlYiAyNCwgMjAyMyBhdCAxMDoyOToxNEFNIC0wODAwLCBMdWNhcyBEZSBNYXJjaGkg
d3JvdGU6DQo+ID4gT24gRnJpLCBGZWIgMjQsIDIwMjMgYXQgMTA6MDY6MTRBTSAtMDgwMCwgTWF0
dCBSb3BlciB3cm90ZToNCj4gPiA+IE9uIFRodSwgRmViIDE2LCAyMDIzIGF0IDA0OjUyOjIwUE0g
LTA4MDAsIEx1Y2FzIERlIE1hcmNoaSB3cm90ZToNCj4gPiA+ID4gQ3JlYXRlIHJlZ3MveGVfZ3Rf
cmVncy5oIGZpbGUgd2l0aCBhbGwgdGhlIHJlZ2lzdGVycyBhbmQgYml0DQo+ID4gPiA+IGRlZmlu
aXRpb25zIHVzZWQgYnkgdGhlIHhlIGRyaXZlci4gRXZlbnR1YWxseSB0aGUgcmVnaXN0ZXJzIG1h
eQ0KPiA+ID4gPiBiZQ0KPiA+ID4gPiBkZWZpbmVkIGluIGEgZGlmZmVyZW50IHdheSBhbmQgc2lu
Y2UgeGUgZG9lc24ndCBzdXBwb3J0ZWQgYmVsb3cNCj4gPiA+ID4gZ2VuMTIsDQo+ID4gPiA+IHRo
ZSBudW1iZXIgb2YgcmVnaXN0ZXJzIHRvdWNoZWQgaXMgbXVjaCBzbWFsbGVyLCBzbyBjcmVhdGUg
YQ0KPiA+ID4gPiBuZXcgaGVhZGVyLg0KPiA+ID4gPiANCj4gPiA+ID4gVGhlIGRlZmluaXRpb25z
IHRoZW1zZWx2ZXMgYXJlIGRpcmVjdCBjb3B5IGZyb20gdGhlDQo+ID4gPiA+IGd0L2ludGVsX2d0
X3JlZ3MuaCBmaWxlLCBqdXN0IHNvcnRpbmcgdGhlIHJlZ2lzdGVycyBieSBhZGRyZXNzLg0KPiA+
ID4gPiBDbGVhbmluZyB0aG9zZSB1cCBhbmQgYWRoZXJpbmcgdG8gYSBjb21tb24gY29kaW5nIHN0
eWxlIGlzIGxlZnQNCj4gPiA+ID4gZm9yDQo+ID4gPiA+IGxhdGVyLg0KPiA+ID4gPiANCj4gPiA+
ID4gU2lnbmVkLW9mZi1ieTogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5j
b20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVn
X2RlZnMuaMKgIHzCoMKgIDIgKw0KPiA+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hl
X2d0X3JlZ3MuaMKgIHwgMjg3DQo+ID4gPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKysrDQo+
ID4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNsaXN0LmPCoMKgwqDCoMKgIHzCoMKg
IDIgKy0NCj4gPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZm9yY2Vfd2FrZS5jwqDCoMKg
IHzCoMKgIDMgKy0NCj4gPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ2d0dC5jwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoMKgIDIgKy0NCj4gPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3QuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMyArLQ0KPiA+ID4gPiDCoGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndF9jbG9jay5jwqDCoMKgwqDCoCB8wqDCoCAyICstDQo+ID4gPiA+IMKg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X21jci5jwqDCoMKgwqDCoMKgwqAgfMKgwqAgMyArLQ0K
PiA+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuY8KgwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoMKgIDIgKy0NCj4gPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2Fkcy5jwqDC
oMKgwqDCoMKgIHzCoMKgIDQgKy0NCj4gPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Vj
X3BjLmPCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICstDQo+ID4gPiA+IMKgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2h3X2VuZ2luZS5jwqDCoMKgwqAgfMKgwqAgMiArLQ0KPiA+ID4gPiDCoGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV9pcnEuY8KgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKy0NCj4gPiA+
ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfbHJjLmPCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDC
oCAyICstDQo+ID4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX21taW8uY8KgwqDCoMKgwqDC
oMKgwqDCoCB8wqDCoCAyICstDQo+ID4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX21vY3Mu
Y8KgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAzICstDQo+ID4gPiA+IMKgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3JlZ19zci5jwqDCoMKgwqDCoMKgwqAgfMKgwqAgMyArLQ0KPiA+ID4gPiDCoGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9yZWdfd2hpdGVsaXN0LmMgfMKgwqAgMyArLQ0KPiA+ID4gPiDCoGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9yaW5nX29wcy5jwqDCoMKgwqDCoCB8wqDCoCAyICstDQo+ID4g
PiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3R1bmluZy5jwqDCoMKgwqDCoMKgwqAgfMKgwqAg
MyArLQ0KPiA+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV93YS5jwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8wqDCoCAyICstDQo+ID4gPiA+IMKgMjEgZmlsZXMgY2hhbmdlZCwgMzA4IGluc2Vy
dGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQ0KPiA+ID4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9ndF9yZWdzLmgNCj4gPiA+ID4gDQo+ID4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZ19kZWZzLmgNCj4gPiA+ID4g
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZ19kZWZzLmgNCj4gPiA+ID4gaW5kZXggYjVl
MDZiNmE5NDc4Li5hNjA4MGM5ODNhNzcgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2k5MTVfcmVnX2RlZnMuaA0KPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9pOTE1X3JlZ19kZWZzLmgNCj4gPiA+ID4gQEAgLTEzNiw2ICsxMzYsOCBAQCB0eXBlZGVm
IHN0cnVjdCB7DQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqB1MzIgcmVnOw0KPiA+ID4gPiDCoH0g
aTkxNV9tY3JfcmVnX3Q7DQo+ID4gPiA+IA0KPiA+ID4gPiArI2RlZmluZSBNQ1JfUkVHKG9mZnNl
dCnCoMKgwqDCoMKgwqDCoMKgKChjb25zdCBpOTE1X21jcl9yZWdfdCl7IC5yZWcgPQ0KPiA+ID4g
PiAob2Zmc2V0KSB9KQ0KPiA+ID4gDQo+ID4gPiBTaG91bGQgdGhlcmUgYmUgYSBjb3JyZXNwb25k
aW5nIHJlbW92YWwgb2YgdGhpcyBkZWZpbml0aW9uIGZyb20NCj4gPiA+IGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d0L2ludGVsX2d0X3JlZ3MuaCA/DQo+ID4gPiANCj4gPiA+IEFzaWRlIGZyb20gdGhh
dCwNCj4gPiA+IA0KPiA+ID4gUmV2aWV3ZWQtYnk6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3Bl
ckBpbnRlbC5jb20+DQo+ID4gDQo+ID4gDQo+ID4gZ29vZCBjYXRjaC4gSSB3YXMgdHJ5aW5nIG5v
dCB0byBjaGFuZ2UgdGhlIGk5MTUgaGVhZGVycywgYnV0IHRoaXMNCj4gPiBvbmUgd2VudCB1bm90
aWNlZCB3aGlsZSBmaXhpbmcgdGhlIGJ1aWxkLg0KPiA+IA0KPiA+IEkgd29uZGVyIGlmIHRoaXMg
c2hvdWxkIGJlIGEgc2VwYXJhdGUgcGF0Y2ggdG8gbWVyZ2UgaW4NCj4gPiBkcm0taW50ZWwtbmV4
dCBieSBpdHNlbGYuIEl0J3MgaGFybWxlc3MgdGhvdWdoIGFuZCB3ZSBjb3VsZCBrZWVwIGl0DQo+
ID4gaW4gdGhlIHhlIGJyYW5jaCwgYXMgbG9uZyBhcyBhbHNvIHJlbW92aW5nIGZyb20NCj4gPiBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9ndF9yZWdzLmgNCj4gPiANCj4gPiBSb2RyaWdv
IC8gTWF0dCwgYXJlIHlvdSBvayB3aXRoIHRoaXMgYXBwcm9hY2g/DQoNCnllYXAsIGFueXRoaW5n
IHRvdWNoaW5nIG91dHNpZGUgeGUgbmVlZHMgYSBzZXBhcmF0ZWQgcGF0Y2ggYW55d2F5Lg0KYW5k
IEkgYmVsaWV2ZSBpdCBjYW4gYWxyZWFkeSBiZSBzZW50IGRvIGludGVsLWdmeCwgcmlnaHQ/IQ0K
DQo+IA0KPiBFaXRoZXIgd2F5IHNvdW5kcyBmaW5lIHRvIG1lLg0KPiANCj4gDQo+IE1hdHQNCj4g
DQo+ID4gDQo+ID4gTHVjYXMgRGUgTWFyY2hpDQo+IA0KDQo=
