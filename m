Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 728CAC76196
	for <intel-xe@archiver.kernel.org>; Mon, 10 Apr 2023 17:15:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4A410E0BE;
	Mon, 10 Apr 2023 17:15:39 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9DE10E0BE
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Apr 2023 17:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681146937; x=1712682937;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=P7GcoCBc64BXHBhN+685KH6SmqjooJ1UGM5Cch7tLo4=;
 b=J4ddtoQG4o7HjWZhxPo/++gwJppXlu++qA87qvgGfi8SZr3GOpPE7VNO
 3/krix23t3LOVAjLmsT76Ien4kZCC6vl64Bp1KXj1SgSn0UjVV9kqZd2R
 Ow2w4UrMvUPVeisUWSp5Li4N/O0Vpzh5I35kP4SxMM8nkguEyswIR4GMS
 5VC+7MpQMzH4gvon5ZXp8FYG1E1lK3SZH5BFkjJlhruKCAFDUuMVRHtcN
 a+gh0eF6WD6gsaNyK7lzOWafrWR7nRd0tgexPnsoAbFLlqQqFAn87mzot
 EGuTZwbyZA6x8AaeazGN22FWMasY4hkJ+f5G1GGqt5NvtBc/esVeIv6Ea A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="408542970"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="408542970"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 10:15:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="752832618"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="752832618"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 10 Apr 2023 10:15:35 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 10:15:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 10 Apr 2023 10:15:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 10 Apr 2023 10:15:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RgB3WQtiiLV2036LzAsen0mXnCbefhZr8C8C0dEk1oxWah8cisVl7G7ckgrYEGLxs4VFdYrnSvcJf2Py0dBEhEpHKXom8Ok/bPf0OgPynZOFCbQR4QLgab3szN4pYSGWdsetrv45C8oc3jwSgxrsaNl2cK7EMB/xsfafjy899GaNzfTtnZbx4e4YNPgAsmC9PgwxhY4jsX7w0OVXlljUt89QChGPf/lF+T1g5W7yDA8wwt79yBmeoSibvpWOewGJLd7NaXsGJfVb0p40aAmyIonlsNM4rR3hpW9FmmgCBDMxYz53QLWwv+fpslW48rpYUmd6tjZI4c00voOQogf2pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7GcoCBc64BXHBhN+685KH6SmqjooJ1UGM5Cch7tLo4=;
 b=d23Aqf4CoNq8sRusg4cqOnCOnt59wZGNB1sR2aSeq/3xqrzs7OqL5md715uip1JKBvDycYHMN3atX6A3id2dZ+Sw6ZHf6Vu1auPsCLbPuSHisOcPaxM3VCU3B6D2HqeI8m1+K34zfzNuRxhpH3OPqr82YfJM+fIFjmPtA6maO0glQDLtmM60rPfeQEi3HRYyQbt8mwsteH5uvkVMFyB7YY9lOJvsE6Ys13mWGafG0qZp1iSe/NtQWj7iu4h3Enaqy8egoC6S2nBScGctypeqjk55rKye4HPnpY+azH2OvyrPxHiKVSEm4PzEtAydHtVHSL28qAkCIGhRe+PjIgoBXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CYYPR11MB8329.namprd11.prod.outlook.com (2603:10b6:930:c7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Mon, 10 Apr
 2023 17:15:11 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651%3]) with mapi id 15.20.6277.038; Mon, 10 Apr 2023
 17:15:11 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Thread-Topic: [Intel-xe] [PATCH v2 rebased 4/6] drm/xe/display: Enable modular
 fia in TGL
Thread-Index: AQHZaJSMR6ZsdytSyUGeoT9qcYq7na8ks9sAgAAMuQCAAAdgAIAABuIA
Date: Mon, 10 Apr 2023 17:15:11 +0000
Message-ID: <e8ab12b22159466ae1fb606ecca2c4e4f02a0e12.camel@intel.com>
References: <20230406143133.29474-1-jose.souza@intel.com>
 <20230406143133.29474-4-jose.souza@intel.com> <ZDQteoVKCktzyNus@intel.com>
 <fd512e4feaf3949b2cf5209e741b358159ed7f53.camel@intel.com>
 <ZDQ+VkdmHwcZQL/W@intel.com>
In-Reply-To: <ZDQ+VkdmHwcZQL/W@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CYYPR11MB8329:EE_
x-ms-office365-filtering-correlation-id: e0791b4e-153b-4d21-f078-08db39e72489
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xYdnDgqJey7Gqq+Gf05+1/xiYeCKscfH49w5GtGZvHlK77uBfPyBO9dPE4BMhAnKdIdrALJXmczVarzbPjKaqHcWmEEWgdM7ayTxMegSW4SvzJ64ta9wq5OuWwZcRDhj0yaPYR9JTi43lma6cQpxKRaJNZh/LIp+A1xqm1OURvA8faXwNvX18sJx+Jo3+IlvM1kRc0SMleEZcuSPHNbBX4dpPS42P1MUjow0JRfdpNsetsbhhU1DURLbsLqE2YH1BaBLqfUFTf+TY7eMVf3k/dRny0/HISOlsiFUEQSQJPi6EIUqKv2ZT6oxd8lmmRIcyFKsr8wN7OJwmeTeQQB6julKqobnzinxrGC/icy4sLHaL2QQJrBetUDQSKstNUsfRdfwinqMY8zigHx+z7+HIfsXWLVKsP5yoIlOB4oPG+icA3lpvFotcIZhfGtKw372OO0MthgG4/UJJs9jALq5vm1FvcIi0yHp9k53Hd+uGvgEsTosOnZAfJaUEoaFMS6IcXNZy53mATJf1t3GEk2UFvtgOcFSMpNdl8MINry5C5dIEwxp64mV9bi/pe+GBnl8imC658cvHNGmlFE58XjbQ3YFFYwDyvkrAY36rB63LPEGb35nDibXBasX+NsPLjIA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(366004)(396003)(39860400002)(346002)(451199021)(66556008)(76116006)(91956017)(4326008)(64756008)(66946007)(66446008)(66476007)(478600001)(316002)(37006003)(6636002)(5660300002)(41300700001)(122000001)(82960400001)(8936002)(8676002)(6862004)(38100700002)(186003)(83380400001)(2616005)(71200400001)(6486002)(26005)(6506007)(6512007)(86362001)(36756003)(38070700005)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OXkybTVvRCtEcnlQamUwcnMrSUdsNUYzWm1zcjVwNkhBQno2UlBQYS9nRndJ?=
 =?utf-8?B?YjNVOEpaM2YrbW5BYUVZR3Evb1lGT0FvRDhIYUNLYXg5YWNGN3pFVFlYR1FL?=
 =?utf-8?B?N1BDaVJrT1JUV2ExVUVoMEJTTU8raVZzYmRyWmpaNndOZ2oyVlo0dEgwY2l3?=
 =?utf-8?B?SUJwUlVpd1ZRN25GVWJLWXhKQ3NMeXp0THJmUHlwTDRxbnJOMVlLR1pZUmN3?=
 =?utf-8?B?RWprRFZsNDZBV1krakVaaThmMC9QbHNzNmVwNWN2TC9ReDRsaCtoTzV4NzU3?=
 =?utf-8?B?N00zQWlWdzlOWGY4clN4cEdlUDJMZHJhNTFjRGJBQytjOU01YmptZWM2ZWx6?=
 =?utf-8?B?bTMrd01aeExnbVpScjdobnNYeGs0N0xJVE9XRFFxN293K3NFYnJqbXZDT2Uv?=
 =?utf-8?B?MzZ5dTdoU0wvdmhZMGNySGUyeEpETkxEcHVITzlxQ0g0YTlsZzRVMWFNdWl4?=
 =?utf-8?B?VTMvN0hNaXd6NTNvVFAzMkZ1MUhGUXVqeXFIZk5mcVJLNG1kN2xRZUdURUlz?=
 =?utf-8?B?dW1zbXNKaDVWT1BCZzkwNmZvN2NYaGFGQllwS0JabFVGWEpUcTdzZll1YVFy?=
 =?utf-8?B?Mk5kcW8yK1Vtd1FtaWZOZjU4aWRRSHFaSXVQbm1IS084WVlyZjdDOUZsanFP?=
 =?utf-8?B?NDg1dCt2cTRlelVueWVkZE80dW9FUE5iQzhHeVRNRkF6QTBpcXBUckN2S0dh?=
 =?utf-8?B?ZDd4WmxRa2JoZE12UXBXN1FicFpSWUo3VWZkNnJjb1FLN3h6UmN3RU9nYm9T?=
 =?utf-8?B?UWprNWIySUxMUmp6bXMwZlVJWXpiZCtLUDkrenhUamhhbldtd1JlQk5WRnJU?=
 =?utf-8?B?emdJWkFaeW80dlAyK20xaHVSSkJCY2NpVUM4M0s0UWxKUDVsQmxhd3V5eWtV?=
 =?utf-8?B?RFpXMGhBK2x3MmhsaTNDWDdQV3A0YU5pdml3dHVGZGNGOFo2N2xvQXhxeG5p?=
 =?utf-8?B?Rmw0eStEWGlOZ0dTRUVkRmttQStRMGlPTDEyNlk1K004SHp0YU5pMytJZjZY?=
 =?utf-8?B?aURuQlJ3b3FkQ0MwaWdQOXMwa3laQy9uL3UxcFMxOWJFSDd6d0w3Si96Ums5?=
 =?utf-8?B?YjJWL05rUXRLNEhZWmNvSDAyMGRUdWtMOWR2SHVsNmkvcUVOY01yL2JhVXZt?=
 =?utf-8?B?VEhIMWN4YXM2eFhENTdGTUlZWjRjenZSZ0lGWjU4V1EvZythMVhBajA3ekpW?=
 =?utf-8?B?NkpzWlNMVVBPNnBsVHduN1YxdmU1YjVuYjlxbmM1b3Q1WklCSmhNaVZhQ3ZQ?=
 =?utf-8?B?eG9YL1AzVVBTanhqczg0c3lOQ3lrMkk2bk9qSTRTQUJyNERlbXhsTEE5T05U?=
 =?utf-8?B?NlpycXJEUy9iSVhudi9IYi9BSWp1SGJ2N3hEVGhDSnRtV1hUZmZOdEozcEJX?=
 =?utf-8?B?aXVhU1BaM0kxak5zbDJpY3daczlWMDlmWTZGMlIrMEszMStERFN0MGNFU0No?=
 =?utf-8?B?YmRoMU1YWE1QZVV1QVZhSmJjUVo4cGFGd2l2U25WYVFzRmd1bFVncmJKQWlR?=
 =?utf-8?B?aG04OUhtNllaN0NrNEUxQTVjQVZqODVqa1R2bytDWklGTlp6U28xKzl4UDV3?=
 =?utf-8?B?N0ZXZXZhTzZHdnU1NUx0UURMSmtIb3pqRllQRk9McGJ3VVkzTnlzbndUcmtz?=
 =?utf-8?B?akNxQVZSS09VbGFaYmxYZ3ZHSzRQRGFOWjdhOGR1QWZNYXRjd1lXdFFZRU1y?=
 =?utf-8?B?QVN5WnNrdjlMdUk0T3hWK3V5SnY5MXBMMFRCVkxLcEVHcUdmL2FwbTMwWWdG?=
 =?utf-8?B?bDRMQ3pVK3VtSklVUXY1bGRHWEVoREJlSXpHK2V5aTMyVXhUYXJHeVJYZnd2?=
 =?utf-8?B?SjNNWHNSRFVvRDFibDBybjArNGVZS3QwM0w4NWdWaXY1cGV3Q2dNaVFoNC82?=
 =?utf-8?B?Nk1MR3p3aGN0Rmg5RHN0bG1tMm9HZkI1dTVWOWticXdmTnh5ck1MZUY5cWUx?=
 =?utf-8?B?eUFtaHcwdjk0NGJmdm1XSkFvVmxJcmVVcm9jbVRETWgyN3J3ZkxVUnc4T2Ey?=
 =?utf-8?B?TnFrNUc5NmpXUDZLdFdVNDljS2ZVS2M2akpNZU5XSE1wTVk0cnlFVTc2OUti?=
 =?utf-8?B?VWlGeXRjVHgyVEZUTVVZN2VPckUwVUlXWmtNNGtuWnZZMUFSVmlXVUtXNjNx?=
 =?utf-8?Q?iDGYAuF6IFi0TwA4HGDvj9AGp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CFD4084B1B3D1949A666C992DBD06936@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0791b4e-153b-4d21-f078-08db39e72489
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2023 17:15:11.5857 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CbuNimdAZG0hacWSLwqO1r2uLA1aE07pleRKz46E4Hs5UrKVomNBwF0cGuveIFcprOR4oUU7bpswM3pDEJ0iMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8329
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 rebased 4/6] drm/xe/display: Enable
 modular fia in TGL
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

T24gTW9uLCAyMDIzLTA0LTEwIGF0IDEyOjUwIC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIE1vbiwgQXByIDEwLCAyMDIzIGF0IDA0OjI0OjA5UE0gKzAwMDAsIFNvdXphLCBKb3NlIHdy
b3RlOg0KPiA+IE9uIE1vbiwgMjAyMy0wNC0xMCBhdCAxMTozOCAtMDQwMCwgUm9kcmlnbyBWaXZp
IHdyb3RlOg0KPiA+ID4gT24gVGh1LCBBcHIgMDYsIDIwMjMgYXQgMDc6MzE6MzFBTSAtMDcwMCwg
Sm9zw6kgUm9iZXJ0byBkZSBTb3V6YSB3cm90ZToNCj4gPiA+ID4gVEdMIGlzIHRoZSBmaXJzdCBw
bGF0Zm9ybSB0aGEgaGFzIGl0Lg0KPiA+ID4gPiBFbmFibGluZyBpdCBmb3IgREcxIGRvbid0IGNh
dXNlIGFueSBpc3N1ZXMgYXMgREcxIGRvbid0IGhhdmUgYW55IHJlYWwNCj4gPiA+ID4gVEMgcG9y
dHMsIHNvIGludGVsX3RjX3BvcnRfaW5pdCgpIHdpbGwgbm90IGJlIGNhbGxlZCBmb3IgREcxLg0K
PiA+ID4gDQo+ID4gPiBzbywgd2h5IGRvIHdlIG5lZWQgdG8gZW5hYmxlIHRoZW4/DQo+ID4gDQo+
ID4gVEdMIGhhZCBpdCBkaXNhYmxlZC4NCj4gDQo+IHNvIGl0IGxvb2tzIGxpa2Ugd2UgbmVlZCB0
byByZWZhY3RvciB0aGlzIGluZm8gc3R1ZmYuLi4NCj4gYmVjYXVzZSBsb29raW5nIHRvIHRoZSBk
ZXNjIGl0IHdhcyB0aGVyZSBvbiBUR0w6DQo+IA0KPiAuZGlzcGxheS5oYXNfbW9kdWxhcl9maWEg
PSAxLA0KDQpXaGVyZT8NCkkgb25seSBzZWUgaXQgc2V0IGZvciBhZGwtUCBpbiB4ZV9kaXNwbGF5
LmMgYW5kIG9uIGk5MTVfcGNpLmMgZm9yIHRnbCwgYWRsLXAgYW5kIG10bC4NCg0KDQo+IA0KPiA+
IFRoaXMgaXMgbmVlZGVkIHRvIHByb3Blcmx5IGluaXRpYWxpemUgVEMgaW4gc29tZSBza3VzLg0K
PiANCj4gVGhpcyBpcyBhIGtleSBpbmZvIHRoYXQgd2FzIG1pc3NpbmcgaW4gdGhlIGNvbW1pdCBt
c2csIHBsZWFzZSBpbmNsdWRlIGl0DQo+IGluIGEgbmV4dCByZXZpc2lvbi4gQWx0aG91Z2ggSSdt
IG5vdyBjb25mdXNlZCB3aXRoIHRoZSBpbmZvIHNldCBpbiB0aGUNCj4gZGVzY3JpdGlvbiBhbmQg
aGVyZS4uLg0KDQpXaWxsIGRvLg0KDQo+IA0KPiBXaHkgaXMgdGhhdCBkZXNjIG9uZSBub3Qgd29y
a2luZz8NCj4gDQo+ID4gDQo+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KPiA+ID4gPiAt
LS0NCj4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kaXNwbGF5LmMgfCA1ICsrKystDQo+
ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+
ID4gPiA+IA0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rpc3Bs
YXkuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kaXNwbGF5LmMNCj4gPiA+ID4gaW5kZXggNWZh
YjViOWZiZGUwYy4uMDAwMWE5ZDAyNDk1ZCAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2Rpc3BsYXkuYw0KPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZGlzcGxheS5jDQo+ID4gPiA+IEBAIC00ODYsNyArNDg2LDEwIEBAIHZvaWQgeGVfZGlzcGxh
eV9pbmZvX2luaXQoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+ID4gPiA+ICAJc3dpdGNoICh4ZS0+
aW5mby5wbGF0Zm9ybSkgew0KPiA+ID4gPiAgCWNhc2UgWEVfVElHRVJMQUtFOg0KPiA+ID4gPiAg
CWNhc2UgWEVfREcxOg0KPiA+ID4gPiAtCQl4ZS0+aW5mby5kaXNwbGF5ID0gKHN0cnVjdCB4ZV9k
ZXZpY2VfZGlzcGxheV9pbmZvKSB7IEdFTjEyX0RJU1BMQVkgfTsNCj4gPiA+ID4gKwkJeGUtPmlu
Zm8uZGlzcGxheSA9IChzdHJ1Y3QgeGVfZGV2aWNlX2Rpc3BsYXlfaW5mbykgew0KPiA+ID4gPiAr
CQkJR0VOMTJfRElTUExBWSwNCj4gPiA+ID4gKwkJCS5oYXNfbW9kdWxhcl9maWEgPSAxLA0KPiA+
ID4gPiArCQl9Ow0KPiA+ID4gPiAgCQlicmVhazsNCj4gPiA+ID4gIAljYXNlIFhFX0FMREVSTEFL
RV9TOg0KPiA+ID4gPiAgCQl4ZS0+aW5mby5kaXNwbGF5ID0gKHN0cnVjdCB4ZV9kZXZpY2VfZGlz
cGxheV9pbmZvKSB7DQo+ID4gPiA+IC0tIA0KPiA+ID4gPiAyLjQwLjANCj4gPiA+ID4gDQo+ID4g
DQoNCg==
