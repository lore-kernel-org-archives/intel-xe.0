Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD37CCD37B0
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 20:57:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF5C10E343;
	Mon, 18 Sep 2023 20:57:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D9810E343
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 20:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695070642; x=1726606642;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=G3m5V1k02hfCfxRfHTa4PjcfpNlh0WIfRhnWyQQnyFQ=;
 b=PjaikjhR1n34HdBke93Qmv22KmiI9Kfs3WmcrD0AwRlQPp5clKvaV/I8
 OSDcXIt1LyPuUAfr9cyjYKodqpYuxGmAovt4hmyKO2IXZ6kiH/B4SGlP5
 a5w0uSog6F1pYMEtayNcwVQoT+xrtvc4QwPrUhbVChUjiqCy3q1tPyyVZ
 0B5YbO+0EPQdYjA4/7I6gFYxcgEPLei+DsrrqK6kH2hWVfwykx4IGvPqU
 rPER7Y/JgH3ulB+ycoMFPvzB6FzsA0daH5Aq6LTf22X0dpXzdzPpxq8F6
 I8bazC5Fylmqr0Td3L4ai3bVpWpYlDVBWudxRnR81hGf3MY0wpAi4RGxE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="383588487"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; d="scan'208";a="383588487"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 13:57:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="869707186"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; d="scan'208";a="869707186"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2023 13:57:18 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 13:57:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 13:57:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 18 Sep 2023 13:57:17 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 18 Sep 2023 13:57:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JfpxvoP+vx7MU/p9WpCp8HWvSvJQs3EPkemcYFSAR6I96tj+qRHD+EYK/Vjxf2eMTlOVCAHXB1vBolL41Lcnr6MoNb9fU/Srp5GIo7I65EG3XVX0EjAzMEksXykFR55cHCFib480IzkTeczIPuUHkeHOFD11JU5G4ZqqQ/Jenz+1H6NkLHB/gOFvjiLBYsdAiMP0nV8OYqJNEOjE5iQ8i9v/9pK1Ra/bXy4qlcxXPurrhf8B0mKRBmVbdXtQ82a5UfEGkqWpwgjpZ+jVvod44SaN51KEIU9z/eiwpWfJKhZ88gWfW4QUYx1BR+xkNly2cfYxcMoTnxLj27j/KEsYgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3m5V1k02hfCfxRfHTa4PjcfpNlh0WIfRhnWyQQnyFQ=;
 b=RrBnIknE+cKJ0kOyT+iY6zoK84OlbpD7XOOTUcMruYOD6xcR66lA8vhhqs08xAcDWyNGu/HKDSudBgQMaO3QAOwzsZtdadkXLVNA+DMxxQ4OGRq9xPFivoND1ApcvyrT3lHaodF1mppeM2zpoE7n6C0cgSrFG978oAGI9aHGM/tcIB6o7aJKoFaIEWGT4G8AIdbmueOfdrj8xfEmyUX0aORs9pxyDgbKTdqCd7BT9YXzZZN8x7v97c+p3D9SkoZLWl0MqwKYx9t9oW6byrrIWP6+wbjZESJbtLXCyW4Y56y0mQn5rRiLNAdfZBivtaqYL/bDXNWtVTyvDcBp9O22lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by SJ0PR11MB5040.namprd11.prod.outlook.com (2603:10b6:a03:2d6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 20:57:11 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::cf28:4320:6c5e:aec]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::cf28:4320:6c5e:aec%5]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 20:57:11 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Hogander, Jouni" <jouni.hogander@intel.com>
Thread-Topic: [Intel-xe] [PATCH 5/6] fixup! drm/i915/display: Move releasing
 gem object away from fb tracking
Thread-Index: AQHZ58OA17QpcthfMEiTooT/mRgth7AhFdmA
Date: Mon, 18 Sep 2023 20:57:11 +0000
Message-ID: <9ea959b2009640c73c76081e70075a2e52f987a2.camel@intel.com>
References: <20230915105724.1025509-1-jouni.hogander@intel.com>
 <20230915105724.1025509-6-jouni.hogander@intel.com>
In-Reply-To: <20230915105724.1025509-6-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|SJ0PR11MB5040:EE_
x-ms-office365-filtering-correlation-id: 5a48c432-bfcf-467b-1029-08dbb889d44d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jza03nu1YkpWWS2IaPWT/o2WiC+pEDwIViAyZHYrkzHdbCFgFOtWlYswgS97wGsdAff6MV87EjFUm/wzkLoXgvKIgQURALKEDNEkb1QhiYDIKhw7hhWW+I20NLrDSItm8JBldNVowMhecrRYpIwDIWGkY06DjPh2FLVrMSTFqJUDaO1nDKbwbrWghYr7dj5+GAowo+WaICuunSqb2325b1bUUuagiSg5HUHELJVJlE8BHKxKWtaYFPct44v09t06zVE6opDjDd243ys+CUS4r2UuCteP2KmErQAwfdV0JS1rt12P+oMq0cjhGgpLAcGtwx0kbJVYLOoI7SdtlyGXZX24SEIkmjnUtmgAuWZ/KlohgVMDO9Bea+zIAVSvXBhb/5eoadt0CtC0WO4mZT1kCWncnpRyE8azkmkx2XDrNMX75LRqPVC4nih/gGKVcNx8ZR/EchImjNlJVK1oWaB+0uF1Ox/hbtjnwJpPNVhUCNal7ChcMt8FSAXu4cTcsZsVAr7KgWqiQ4awATmrdYoqoHCNKXmfnsWqoBgLlrk7m9T1tHwI40ufJCRrhF57bs2HQ+L56oD+cqSyh6GzDiCUZ7kMlK4T0j88aAT2EI91InzAfEaDTMmyROSU552EAjHV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(376002)(346002)(366004)(1800799009)(451199024)(186009)(66556008)(66476007)(66946007)(76116006)(66446008)(64756008)(66574015)(316002)(6636002)(8936002)(8676002)(41300700001)(6486002)(6506007)(6512007)(478600001)(71200400001)(91956017)(83380400001)(110136005)(122000001)(2616005)(26005)(38070700005)(86362001)(2906002)(82960400001)(38100700002)(5660300002)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QXIwQW1vcmJoSVlMMFplbkpOaU11M0JWdWlVN1VWWjVmREhUN3I1MGY1M05n?=
 =?utf-8?B?VlRBdXBNVDJucnJmWC83cXErdEwzZTM4Nkxsa1VTcWZCaTNIN2c3cnNFdTNC?=
 =?utf-8?B?TU5RNnV4dDV5MUplUTMrS25tRE1NWU1rMFJZZ1lVak5ORDJTVGN4cEprcFEv?=
 =?utf-8?B?MHRwYVdna0Y4RFM4a2lHZ09XZUlidWdRMG9saCszeTNDTUpHUmw3eXBMbVUw?=
 =?utf-8?B?aHhtK0FaK1FUa1F0WjdKaHNvcnRaNk5INlVOM2h6bjB5WEc4U1hZVFYvSlhZ?=
 =?utf-8?B?NXBERG1hMm8xbVFyTUcxWkIyVmUrOUJQclZTWE5TVnBmSkJ2TE5pQzE2NWE5?=
 =?utf-8?B?cEJhcDV3b0ZKcG5BUFJld09kM004cVFBZjVuN1VuMEw2Z2RIakt3S0FyZ1cy?=
 =?utf-8?B?V212bmphdDliMDN1NmtFL05Henlock01Y1owMEtkbDk0QmN1VG1zS0xlcFdF?=
 =?utf-8?B?aitsUitFZnNnL3BhZExiRHlPU3dlNUdVdFYyNXQwNk5WbTZ4aU55eGV4QTNz?=
 =?utf-8?B?TWVMWWU2Nm1XWE9ldnBSSVJUWEdjSFd0ZWU3bmVJVFBjM3l3Y2Jxb1hwRDFL?=
 =?utf-8?B?QWIvSkY4Q1R6QzR3d3R3R3JRM3gyRWRLVFdiSW5MSE5tMCtZL3NjR1hTWnFJ?=
 =?utf-8?B?TEtrUUVpQVRCdE5CYVRmRzUvbHU4YlZ5enYvM1I5UUllMnhqYjByakJFa2VF?=
 =?utf-8?B?cGtLaW5POHlubURrcVhTKzlTRDVHQ21wKzdDRnBTcE1vMnhoUEpvNmZtOWda?=
 =?utf-8?B?UE01eGNNQWRUMzhLQ0xjdlFuUXppanhHNUpWUW5KK1U4SS9RdXhSNkRhSVpS?=
 =?utf-8?B?cFRucHMrd2x3NWhpd21WaDdTZFlYUnJvM1UxREhBbXZHYmp6bE5YcWJQdWNQ?=
 =?utf-8?B?a3d0ay9URWZ0OTJhcXUvTG1LbmREOHpYQ2hRMG9RdUwxVjhWV3c4ZUtPQUZ6?=
 =?utf-8?B?eWVlUmhxeXlWNjBXWC9KajVlQ3ZROTg3TEsvN29odHJaQ2M5TWZ1K0JGdTlE?=
 =?utf-8?B?dGlkVVpyVDBxZkFGRWNmdzdodEdCbHFFYTdLZkJBVnRHOXdOSVZVVEhJOGlk?=
 =?utf-8?B?akEvamNkMDBua0FuN2o2cVg3dVNoSFJ1S2o5bUczTWhBRWI0Yi9kVkNRQzI4?=
 =?utf-8?B?cGFJVHpLSTMySXZkZTF1VE1lS2xmeUkwVGh1Tk5yM3JSSU9rNXdPTU1vY1pr?=
 =?utf-8?B?SitDTHVIakVJMFlyRmVPRm5oNXZZMFNYa2pVNnpxRFRBSUxaWGllbjRrRzN3?=
 =?utf-8?B?ay9jczZuV3FSUC8xU1R4YmVQUENmdkJDcUJkM1pjYkx3TTVXY1U2M0NCYjJa?=
 =?utf-8?B?QXE2eStFMDNJTzlCSEI1ZHV3R0M3SWxwdTlLRWltSFIwOGVhZzZ3QnZvOElG?=
 =?utf-8?B?UDFqM3BHVWQ0R2NLZUtIRkhCNUg4cDlmUHRpL2FFbDZncVJpbUJSZlkyVTBW?=
 =?utf-8?B?VW0xbS9CNENqRmRMZmJ0aXlTMUNKWEdDZ1dOL0VickFGTWtOVjZlZHRNZmwy?=
 =?utf-8?B?WHVTTGNaTXMvRDdMS1JXdUx0N1JUK3BQdkJtbWlSeHIrYnhuckFsMnhaVmF2?=
 =?utf-8?B?YnliSC96eU4ybjlwZ3lPWm5UV2Z5aDZvNGNOdlhwSEhQY3hlQThJRHFhQU1K?=
 =?utf-8?B?M1g2NmFiUXIxRk83QjZlQlJTYmZpc1l4VndwWThZc3Q0Y05YTHpnRUIyOXZ6?=
 =?utf-8?B?SUFCSW11T1A2RkxKTTJXMTFRL255a3llTDI4c0RDL2d3ejQvWVFZYk9GVmdG?=
 =?utf-8?B?VG1aenRpRUF3czBCODJPTDdEbms4YlQyeXFoT0NaY0JqUFEwZXE1cDdMMENy?=
 =?utf-8?B?OWdXUDNWUFRrbXhlYmI4YllKOXFCTDRXMWNHTEtGcER1UHhNN243MWlQLzF3?=
 =?utf-8?B?SFVxZUQxd0J3amU5MktIU2pFT3ZEK2ZpSkpPVVY0NGU3ZHluYTl3Nys4Ylow?=
 =?utf-8?B?T2t1MmhZT2lxcG84ckRXK1djMDE1bm9qTGJLQ0w5ZVJEQ2J2czZzZGhlSzhi?=
 =?utf-8?B?dWgvdVpVYW1HbHNhU0dxUkxMbG9Sbk8yakJJcjV1akdxdm1ucUpVdmdxZ2g2?=
 =?utf-8?B?djFXUG5QUFBKZDZYV3JHODFtNk1JZWRlbk5nTm44K0RoQmpOd1NpSEZDWERi?=
 =?utf-8?B?RDAvb2FTMkltbkMzVStwVVd6SG5jak15NVhHTk4relZkNkoxZ3h3d29zRVVv?=
 =?utf-8?Q?pl2mvne/kAnwgacWXzjqURU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AAC26707B6896B4AAC1A222D234063F1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a48c432-bfcf-467b-1029-08dbb889d44d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2023 20:57:11.4827 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hAbvYe9V56LZgGZLv2dWxUZUpYWFqyJTSqsGYsBHu0a+N5vLZQpVKwwmnZYuYyY84sVu9PDWw2ynSKyfPpHkXqPNUp3Glyt2DjbqVguUE4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5040
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 5/6] fixup! drm/i915/display: Move releasing
 gem object away from fb tracking
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
DQo+IFByZXZpb3VzIGJhY2twb3J0ZWQgcGF0Y2ggbW92ZXMgaTkxNSBmcm9udGJ1ZmZlciBzZXR0
ZXIgYW5kIGdldHRlciBpbnRvDQo+IHNlcGFyYXRlIGhlYWRlciBmaWxlLiBXZSBuZWVkIHRvIHVw
ZGF0ZSB0aGlzIHBhdGNoIG9uIGRybS14ZS1uZXh0IGJyYW5jaC4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KPiAtLS0NCj4g
wqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fb2JqZWN0X2Zyb250YnVmZmVyLmgg
fCAxICsNCj4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCg0KTG9va3MgZ29vZCB0
byBtZSwNCg0KUmV2aWV3ZWQtYnk6IFZpbm9kIEdvdmluZGFwaWxsYWkgPHZpbm9kLmdvdmluZGFw
aWxsYWlAaW50ZWwuY29tPg0KDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ2VtL2k5MTVfZ2VtX29iamVjdF9mcm9udGJ1ZmZlci5oDQo+IGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ2VtL2k5MTVfZ2VtX29iamVjdF9mcm9udGJ1ZmZlci5oDQo+IGluZGV4IGU1ZTg3MGI2
ZjE4Ni4uOWZiZjE0ODY3YTJhIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
ZW0vaTkxNV9nZW1fb2JqZWN0X2Zyb250YnVmZmVyLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ2VtL2k5MTVfZ2VtX29iamVjdF9mcm9udGJ1ZmZlci5oDQo+IEBAIC04OSw2ICs4OSw3
IEBAIGk5MTVfZ2VtX29iamVjdF9zZXRfZnJvbnRidWZmZXIoc3RydWN0IGRybV9pOTE1X2dlbV9v
YmplY3QgKm9iaiwNCj4gwqANCj4gwqDCoMKgwqDCoMKgwqDCoGlmICghZnJvbnQpIHsNCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBSQ1VfSU5JVF9QT0lOVEVSKG9iai0+ZnJvbnRi
dWZmZXIsIE5VTEwpOw0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZHJtX2dlbV9v
YmplY3RfcHV0KGludGVsX2JvX3RvX2RybV9ibyhvYmopKTsNCj4gwqDCoMKgwqDCoMKgwqDCoH0g
ZWxzZSBpZiAocmN1X2FjY2Vzc19wb2ludGVyKG9iai0+ZnJvbnRidWZmZXIpKSB7DQo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY3VyID0gcmN1X2RlcmVmZXJlbmNlX3Byb3RlY3Rl
ZChvYmotPmZyb250YnVmZmVyLCB0cnVlKTsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBrcmVmX2dldCgmY3VyLT5yZWYpOw0KDQo=
