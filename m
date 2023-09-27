Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69EF1E810DB
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 12:34:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338C110E500;
	Wed, 27 Sep 2023 12:34:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7240E10E500
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 12:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695818087; x=1727354087;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=HOclUYEd60D90n1HOmSKPPId28qsl9JYQQJAItBFFRs=;
 b=WQmd/YAZ09XOR/9wqKfzRjf508w6PZETBb1hKEuI9yV11dpY1vj7f61u
 utN/wpUFV4A33Rlqv1ae438R7iPBXxWUdldMKJgjXADQ32jlYQz4dIkVs
 vKxOKGpBTGxuvTJ1QSZllBD6uGiXUi1upAFyTA6JGqa7u4v52vkSLd1gN
 SECrg20sQyGQPwNf2kvCWMv3cxNm+d2sTA8klRmh84x6Cqw9NI/4Wo/Dc
 YXKQdQe34s+9fEzo6P/tt4C3uHN1xhbJIgiHLkd4Ieb5lrJKuR0Yw0d7m
 sTv/bZBNReJs1I9wHVnoPKVYV98dUg+xCKdaZ9c7ne/P4hz67mmwVV41I Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="385670166"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="385670166"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 05:34:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="752557914"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="752557914"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2023 05:34:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 05:34:20 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 05:34:20 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 05:34:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uz5jwDBXHwA71g91JxOH5PV3RQ93ivt6KbWDKHTdg25wJz+XzbwmvPvH8z3MqyMwVkbq+Lx8ZXuzXTyoEqOaWlLaQ6Mtk1SscLZShRCoVAYnlIGp6hgO2tq/jekJUB5FTw1HeXaev+eUdqae9Rb9zqU5omUKusiKSdo3301NHmFTLNAifvop3ysjp/tD1Kw6pps0DLDFolmEd+dRD7Mfa8SvFADXOzScTx5U4KU852OUv4GXXwl0yM+THmJhG4th0O+PjZ3fDIQ8JuX/eD1uXHyLSjc/maE1uKZBOnsE3YvWCbHcBCjejgFDdR9PG2AXvSQMC2OoVuoAjpR1P3bW9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOclUYEd60D90n1HOmSKPPId28qsl9JYQQJAItBFFRs=;
 b=aEGgkwMmRwV5IpDFWV670ngcQosqLI62bPbneoU4HBaoRwIs2psD2XwQS7c7MboodrTGqB29sgBLthHne6OzEL7qri2hdPQ7Jt0zaMYX4Se4/fWD61fjdckIx7GofJ1irIFMDV4U3VCVtFYXNtjmHWegqcsVVJUXF6mVvHnRLHrBGJhAUm9taRKk5Rt7hrZoNl+yUSlgXf6DuoGP8yiStW45xwq0xUD0LCVjrHN6YwouiwO+9UCi8IPSstSqX6CPFNy8b5OchclPPb4wniCP1HG2uaMwkMXQJ/nM+uRldEobwrIqnCcF6lz4ZgZ7/I08/JNN28vlDF7iFvfoIH5i9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 CY8PR11MB7363.namprd11.prod.outlook.com (2603:10b6:930:86::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.28; Wed, 27 Sep 2023 12:34:19 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::3c89:fe31:95fd:c2cf]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::3c89:fe31:95fd:c2cf%5]) with mapi id 15.20.6792.026; Wed, 27 Sep 2023
 12:34:18 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>
Thread-Topic: [Intel-xe] [PATCH v3 09/12] drm/xe/display: Include i916_active
 header
Thread-Index: AQHZ5UUHZDbBGuF8B0CHXextVCfEvbAurwKAgAAEUIA=
Date: Wed, 27 Sep 2023 12:34:18 +0000
Message-ID: <c294323bbf19b447ff4db6915c55d565a07b2086.camel@intel.com>
References: <20230912064709.2802305-1-jouni.hogander@intel.com>
 <20230912064709.2802305-10-jouni.hogander@intel.com>
 <87o7hnkdw4.fsf@intel.com>
In-Reply-To: <87o7hnkdw4.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|CY8PR11MB7363:EE_
x-ms-office365-filtering-correlation-id: a87efafa-bb5d-4201-f078-08dbbf561171
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VMguD+GjSjEOn72NmhgXO++xLeGyu5g5DhMrab6HP4pUx+wPQfmMzrPqNUqN8+d73WD+XImFoYecYUaAO7Eg82UlPPFyHkwUMeNBFzGYrTX8n2yd8fIIRThphSmReD7w9ELo3hlelN04KKAPlbjTuHXBRIEfejnfmRsjF0ZRZo5yGcs/XCg2dxsJSIwg9edBmOf4QxRGnZLSvqnmTNyXbVpxmD4ACNnipC7FtZTpNaK7cL3HhsBBixCKugWEHA14CYjK8YfLjkawaHCwv36SaNbqCCiKanuSb3TmwwbLZsrMiH8kBGSUm+UkPm2oTS418or/P1s5pyjWkh5OBEXAHtIK01RX7m0m9eBJ52U3/Mnk2SMswIlwX+bjPq4wdC4GKXLO24NpE57xxzLlO6HKN/U5z2qWjx6tdN3pffKey/RdFdrWWgHfUuyq20ipuLmFfn2Anb2Q9FO0iaCgEIIgRCiVrN3G4xF258lvCwia41Ki6HK8RjO4NWi6AYXm9x+3DihZNwg90jtfnV8BjBuM8EoUkZJKtc+PhCiI+XfjrINuC11MRVkV8/5SQyL5YVXryZZUF40uzBbN6DqUf5lUowVbjcDtW7J2KfpszMT05oaGZUzSJUfiNU+t6eZ4SgX3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(136003)(376002)(39860400002)(396003)(230922051799003)(1800799009)(186009)(451199024)(76116006)(6486002)(36756003)(71200400001)(478600001)(6506007)(8936002)(26005)(66574015)(6512007)(66556008)(5660300002)(66476007)(41300700001)(66446008)(316002)(8676002)(110136005)(91956017)(66946007)(64756008)(38070700005)(86362001)(83380400001)(38100700002)(2616005)(2906002)(122000001)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R05Jb0ZPZEZHMW9IY2UzUDJacUc3bFkrU0VxamgyOTZvTm5IVE1vYUtpekx6?=
 =?utf-8?B?ZjViZlhhVWRQOVY3VDJxUkRidmtGM3BqdytCSmRlUDc2TmdFMlVxTlpIbHd0?=
 =?utf-8?B?VVh0ako4N2RsVjV5OHJkUEpTV3M5UzRFMGZwRVFrem9IRlg5Y1llb25SZmdO?=
 =?utf-8?B?dUxTcUxyaFRRMzBYdGlHY2cxQytLdFczclAwU1U0QmdoWGJLSGY1ZUFIZzlR?=
 =?utf-8?B?b3RQZGJIekNqWnVER0R5cVRITjc5K0hJTFV4QWVpNm5tbjFIUExEVU1GcUtK?=
 =?utf-8?B?SE9TMzBxZ1NWazIwZGExMnhIN2ZORldwUGpXeDNseElzWWRIQ3NnK1EyenBj?=
 =?utf-8?B?NnJ3Z2svSjFlLzBRYnNmSU9YV3MzZGFkQnpHUXpjZTUxNEwwVENYbWlBQkxM?=
 =?utf-8?B?ZGZNanVxYlNNVTNSemFlSHgrZlQxdnVSbzBKeHhDdWhaRkNiaXpDeHhaQlI0?=
 =?utf-8?B?d042S0xEQzVFVlRUdG84b3N4azZBcTF1UnJseTdaa01lenJhcHFBZGlSVkJJ?=
 =?utf-8?B?WWZ1K1EvNFRrUUQzWHVFUS9KUFB0NVZENi9uZ3g2TjhVaHNHMEF5Yk9UM1hm?=
 =?utf-8?B?SXZXSGh0RVZROXZYeHRDUkdSODQvMmlVdHN3YVNBRVkxUStsOUhoV0lnazBm?=
 =?utf-8?B?dzd5Ukt1c0RBUE1oYmdYS20zb3E2bm9BV3o0cGt0UUpYU1dXVTNGcmVYSU4w?=
 =?utf-8?B?NjF0amRQaFFMV0NTNWMxYmEzbExuVVpSUDJoSHpPMHpGcXRjbWVEY1BwMFgr?=
 =?utf-8?B?a0wrUTdxR3lSSkYrZTdxOW8zbUJxZFVJcGVmLzRlekkwT3FnMHhvaUs2TGRY?=
 =?utf-8?B?R093WEQvNVVoT3d3RDYwZkFlUGlWZWZmd1c5M0F3QnhnbXQwZUYvMkxTVnc1?=
 =?utf-8?B?ajV3aDJ6dnlBS09kNlpFMmM3SGZkNVpzV0pqNUJOV3ZIVHg2dUM3cVpSUGpm?=
 =?utf-8?B?eTJSYTVMeFVpRi8xcTJ4S09xWFg4TGJha0JTRG1lMW1QdGpaWmZqVGlXWW1J?=
 =?utf-8?B?ZHcvSjI0eDgzSm83cmI0TWx3RExLM09LMklmSUxYUU9MVURJdkQ2MXZBeHpT?=
 =?utf-8?B?TmpQalZSUDluOVB2WDdYZ004S00wc2krb21GV2JVU0loTVpELzZhdnpEZVFP?=
 =?utf-8?B?a1phLzBsYmFBcUFnTDUwbFhSeFArdGxBZ0FYTkI3bkErVEdsZC9jMFBYT091?=
 =?utf-8?B?aUpoUEU4V2pCcm40cXJIRk8vWmFPV2VNOUtINlV3a2g1Q2hnelVtajVJM05y?=
 =?utf-8?B?Z01iV3U4Wkw5VEpDWWhXNDVuVVJUcHRYdUpXbE90cjliNGlzMkxqOHV1bll6?=
 =?utf-8?B?eEdQcUV3dEtuNTBveDZvaUx1bGZScmw1em5wTld5VlpQTWpCTmRNQmZYWlJQ?=
 =?utf-8?B?d1VtMXR6TEhoL3JQZW51QkJURGJhdzVPM3NPZmZ6SW91Uzc4d2VEV21zVkRp?=
 =?utf-8?B?QlFZeDdtQ1YyS0x2djVlMk92Tml4UWQrZDdkYVZBK1Exa2dScUd3RUpaU0Vn?=
 =?utf-8?B?akFZb0FqV3g3UzhGL05yeGZTSVVUQXFldmlEWTlTaXp5bisyRkJlODJQa0hP?=
 =?utf-8?B?UlZrRDI2emV1enJPSkgxNFVaQzlaRU1RSEFTSFBWZWtYVEprb0lyRzhjNjFo?=
 =?utf-8?B?eXd4emVJTmZiNGZNdEFta2xLZG9rd0lOaXR3OXVwOW5aajhpbzR3RDh6a1RF?=
 =?utf-8?B?a0hiR1RtM0lqdjZORFh2VGJHRng0NzNvbUEzc0VlNkxrUTdkU0I5M2FFSVo5?=
 =?utf-8?B?empYYXYrZURDQXhMblplM09NMUQ4b2syQ2dEWUNLaHBmZERJSzl0b0VhQTNh?=
 =?utf-8?B?YmFsRHJOeWh3RmRoT2xIdW1HQ0V0Zll3aHpjekVXdmsvRGNRV0FLa2JhdmFL?=
 =?utf-8?B?KzBTVXZWZnpMWGNXYmx2Q2ZTRGExT2dqQlJyYVp2NTNDTU01MTltaXNyeVpo?=
 =?utf-8?B?cmJuSjE5L1YxM2FQc1l2bW1wNnNRMkQrWU5uLzRTN0F3clJINDVHUzRDalBt?=
 =?utf-8?B?d0pWSW9hS1JhaDRISm40SWt0STZ6YkF3NEhIb1lpUktRR0F3UnpKOVhsSDVN?=
 =?utf-8?B?em5NZDE4d0dQM01VUDB1TVdBamZjRVNYUCtGTkh2cys5QmFyNHl1ZE1xWkxD?=
 =?utf-8?B?bk9MRzV0VkJ3V245RWt5dWt0NUVnZDZwcW9od0h5WlUwM0Rsdkk2dG95ZVh6?=
 =?utf-8?B?VkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ECA13C23B3B88F49A6EBCEC3241AF234@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a87efafa-bb5d-4201-f078-08dbbf561171
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2023 12:34:18.3437 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gwcidmGPaCP+/CWTPqMJKRDVOue2PVXiYUwxrIgYtlZ7q5lOi6lswmQwhEdHLa2ltrFHe4Rh0EzjyKLvLSguMPZz87jfUUKH9dU3TOQCrdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7363
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 09/12] drm/xe/display: Include i916_active
 header
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

T24gV2VkLCAyMDIzLTA5LTI3IGF0IDE1OjE4ICswMzAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4g
T24gVHVlLCAxMiBTZXAgMjAyMywgSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRl
bC5jb20+IHdyb3RlOg0KPiA+IFdlIGhhdmUgY29tcGF0aWJpbGl0eSBoZWFkZXJzIGNvbnRhaW5p
bmcgZHVtbXkgZGVmaW5lcyB0byBoYW5kbGUNCj4gPiBsYWNrDQo+ID4gb2YgaTkxNV9hY3RpdmUg
aW4gWGUgZHJpdmVyLiBJbmNsdWRlIGEgaGVhZGVyIHRvIGF2b2lkIGJ1aWxkDQo+ID4gcHJvYmxl
bXMNCj4gPiB3aXRoIFhlLg0KPiANCj4gVGhpcyBoYXMgYmVlbiBtZXJnZWQgdG8gZHJtLXhlLW5l
eHQsIGJ1dCBoYXMgdGhpcyBiZWVuIHNlbnQgdXBzdHJlYW0/DQoNCkkgaGF2ZW4ndCBzZW50IHRo
aXMgdG8gdXBzdHJlYW0gYXMgdGhpcyB3YXMgcHVyZWx5IGZvciBYZSBidWlsZC4gSSB3aWxsDQpz
ZW5kIGl0Lg0KDQpCUiwNCg0KSm91bmkgSMO2Z2FuZGVyDQoNCj4gDQo+IE5lZWRzIGNoZXJyeS1w
aWNrIG9yIG1haWxpbmcgbGlzdCByZWZlcmVuY2UuDQo+IA0KPiBCUiwNCj4gSmFuaS4NCj4gDQo+
ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBp
bnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2Zyb250YnVmZmVyLmMgfCAxICsNCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2Zyb250YnVmZmVyLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZnJvbnRidWZmZXIuYw0KPiA+IGluZGV4IGM1NjcyMjBiZmFmNi4uZDcwYzk0MWRjYjY3
IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZnJv
bnRidWZmZXIuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZnJvbnRidWZmZXIuYw0KPiA+IEBAIC01NSw2ICs1NSw3IEBADQo+ID4gwqAgKiBjYW5jZWxsZWQg
YXMgc29vbiBhcyBidXN5bmVzcyBpcyBkZXRlY3RlZC4NCj4gPiDCoCAqLw0KPiA+IMKgDQo+ID4g
KyNpbmNsdWRlICJpOTE1X2FjdGl2ZS5oIg0KPiA+IMKgI2luY2x1ZGUgImk5MTVfZHJ2LmgiDQo+
ID4gwqAjaW5jbHVkZSAiaW50ZWxfZGlzcGxheV90cmFjZS5oIg0KPiA+IMKgI2luY2x1ZGUgImlu
dGVsX2Rpc3BsYXlfdHlwZXMuaCINCj4gDQoNCg==
