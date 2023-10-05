Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDF6E92711
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 15:40:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 410FF10E02B;
	Thu,  5 Oct 2023 15:40:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C65E10E02B
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 15:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696520443; x=1728056443;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=1nCQuIq7zPB9nFUamXyEsYM9xHP2iCQJOxfgbK3I+S0=;
 b=WLGeCh1KVk6qVrZF+kPALc+Z9H/jnmf1q2tZYcgHU7nulgGld5bJGEU7
 R/YK4dYOCKEj6IBvgP8yDdwMIqexXehtADMfrh900cl6akARcQfe5q64z
 kUe+9N+xIIxiBePUH9uSWq2QWbVgmJkM0yPvgoa8g+Ym6h+wQUdWY/NpW
 y39fikBtXNkZitPN3kCfNexOBhIjNFYTYattZYVMChKXE6aIbLRNKbpok
 7NFZMnGlbHG21erfI1mjQfBM1SAnFUaFo6tGjaQcDGjKpSoygoE/jem5x
 QRKxlG7dEcPfVixhZJ3gGryWpywtJ2OL/j6bzlGHl82QRdQ+0QfO7CE30 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="363813891"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="363813891"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 08:39:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="701698457"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="701698457"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 08:39:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 08:39:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 08:39:29 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 08:39:29 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 08:39:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSTXG167+uLP8LG06sh9wk8e0iBXQYndWiJL2BgTpYEVTD68owewJzbDuxim5RGxDOX8QmHCYSAaZCZPMjzqNb7lxustj7Hjnh3iM4Kn4M8oSMLWI2FJ6A1LoUWm1hhcGT7IpDvFV1ODIg//am0VGyyFBzy1DnqFTF1RUfBJCBuEYvvZwF7lUEGekm6jUHjVXqnV61FWXNs1NRouAZXgySdzfTW5kfwZ2P3R06fm4f14q43VAgKnaaUni0J5CkHraXjH9uFNNHypyHjbmae4SKp5zEepnUWVHEcY7tdNJM7HPEIT8prPJhJukLdPIfI3qWQo2Clf3atp3pCLefK/YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1nCQuIq7zPB9nFUamXyEsYM9xHP2iCQJOxfgbK3I+S0=;
 b=lNTIpbkCmg12jXvDD+cBS+h9MgxrPZMh25NSQx6c8v6gAkLCxLB0a+Qx6zY/orHMNm9hkRkCe4I/lEIp360L6hLr3lW21qA5FeR4UsXQIxkNYuO0Ntqx9r7YozCdtvqfhQpJYSDp4yGbqEDUJkjk5/DcbrTcaOLvKVSqF1Q/MtOSHdAzKtsjE8J5YTaj2EhiTHrC9PMjkRDVIS8ef2Xi1uarFSJDK2mQ3FNN51Jq8E4mXac85pSrVi9DIZpnpl7lYCfjPtLaaXk5t0h590AMZzit3WEBt9jgzHoQzHdJy+XrdbU2CB32zgr95McarBupdbah1Im2gBhC0ZnUAayLww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 LV3PR11MB8483.namprd11.prod.outlook.com (2603:10b6:408:1b0::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.35; Thu, 5 Oct 2023 15:39:27 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::b0d1:9c31:5561:496]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::b0d1:9c31:5561:496%5]) with mapi id 15.20.6838.016; Thu, 5 Oct 2023
 15:39:27 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Thread-Topic: [Intel-xe] [PATCH 2/2] drm/xe: Add coredump to wa_bb timeouts
Thread-Index: AQHZ8L9rN/5cHz6VtUmrXYfM3UMISrA5rzsAgAGzhAA=
Date: Thu, 5 Oct 2023 15:39:27 +0000
Message-ID: <72ddf2c56a8c5e0261d4c24332f7728c903599e1.camel@intel.com>
References: <20230926212056.40881-1-stuart.summers@intel.com>
 <20230926212056.40881-2-stuart.summers@intel.com>
 <ZR1rWD6BZgDOk6+3@intel.com>
In-Reply-To: <ZR1rWD6BZgDOk6+3@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|LV3PR11MB8483:EE_
x-ms-office365-filtering-correlation-id: 7b0a4167-3f1c-482c-df13-08dbc5b94225
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KGCTQPCw/kBDENTxBDLNGIrw7xWzTuaCGQmPC0almc7cJVxFk2JEzMAF4JNvMuKALe2hPbkVt+17vHbzbW2ZvLrgJ37D/aB3uYd7u50k1yZmi+IS+000YOOcTjR6aWcua1D6YizIAzN6YzzCItyYui0QMZD+p48JnIeT48K1TglPp4gMxL3bKLOl03hLw2z/1W3AfQx/chdzXya2ee2NP/N1ryh/nmNpCN2Wyj2O+asx4waSoeTROtvzaIR6KcHi8qDQag7s9ALLfPpvzdlfiimtdmMIKqnyzHFBYInlKGgtnU8jsTm5G3SlBJSW37XR2dfZdgnSjhMFjMf2xRi5f0P5ECF4KUUrNsobPG2T1a87dDUI6eA0/im73uFmAZHCNQnGhHTmdQfWLtZSIQiS0Cjygma9/I6E3HDygY5r7reoCAuttkKWfd/KxKkI7DMfKZ6Bm96D14R2C29til9I8WrdpTrUGRB/vKYcOrvGOnON95y0f7HPPPq/wTNQvglfYR6NFIxrfpZGmb7McqIWOdMoYIxN+YGzs4hJBNWgXHSfaiYZbgBqsLYBPoSpAghdI8N1zK71yddksHuiMh3fcQJ46vUax2SjYwgpfnEPu14KSJyAROkLne8pslAPfzgT
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(396003)(136003)(346002)(39860400002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(76116006)(26005)(2616005)(83380400001)(66446008)(66556008)(6636002)(91956017)(66946007)(54906003)(64756008)(37006003)(2906002)(4326008)(8936002)(8676002)(5660300002)(316002)(6506007)(41300700001)(6512007)(6486002)(6862004)(71200400001)(36756003)(66476007)(86362001)(38100700002)(38070700005)(122000001)(478600001)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2dQYk1uakJtcEJOVFQzNmp2Uk9TSGZEWWRqTCtDT1R0Q0xVcUIzWk5IeHFu?=
 =?utf-8?B?SHJ0TEl4Z3pZYWw5QkUycEd0WXBoTitvTGpMcDAyOGUzY0tlMG1STldlaXhF?=
 =?utf-8?B?TlgvNzFuSWR1S0w5RURXTGRONDhPQ2xTZ0FUdUlUa3RtTXFkaDZXL0QxeDFG?=
 =?utf-8?B?YXVOMFFDTVI5MzFlQS9KSHFiUDRwUWhqd3htR1ZqZXhrMFBPMnlSaEtsdzZW?=
 =?utf-8?B?MTgzdEV1OXY3RU1zb1pudGhWak1za1pYMHdMeXhDUGtTSzl5dGxLNk5qcGQx?=
 =?utf-8?B?bHlpdVVKUkl2MTYydStIaDk3bzhMc2cvV3FZYUxRR3BBZytXN1l2MnJwRzhs?=
 =?utf-8?B?bTd3cTRDN2k1bDNhRVBKTXBvR3hlWU9WVGh1UVluNWZSQ3VmNTdZK2hPK3Rt?=
 =?utf-8?B?c0dvaUhIVUZTSU1nWGxWYW9STm5UV3ZPNG9qTEY4aEtQTlhxMDZxRytxSSsw?=
 =?utf-8?B?ZGNLanVta1h6aWh4WkJ2bWxLUE5SMzZwdGF3SUtINkJQRE5UcWxXa2ZFYUk2?=
 =?utf-8?B?TlR0SmVwRXBDSW5LalEzd093Mk9vVTdudTdWejNHU0NEa0ZuWkgrdEQ2MzJv?=
 =?utf-8?B?TzVqbHJDcFlwbTBKcFVGa0oyV1RpVm1xaklvR0V0bWxtbWlhdDh3eFRVNGF0?=
 =?utf-8?B?VlorUnhabGU1TFNyOEZWSnFvNXBObUc0ZWgreEhOeHh2VThqVkV6MHpsN2lW?=
 =?utf-8?B?WHR0b0YveHRsTEJWNHVJTzhualN4K3RrWmo0cFBFZ05lSTJUaXhWWVpVTjY0?=
 =?utf-8?B?UEpQL2lQZkhNcnloK3hZY3NCMHErZlRXWitGd21sMnBDOW54UnAyZnV2T3JY?=
 =?utf-8?B?ajhocUx5cHRIWVJmak9pNW9tQ1NXckpzbWRlNHRCdll6TTFQWTkxZDVneUFO?=
 =?utf-8?B?ZmJnNE9MZXRtdUJRM0dPYXdJeDc0TW5DenkyRzl4V2txeGwrbWdjNmF6K24x?=
 =?utf-8?B?ZXc0UEdzWFJDVkdybEg1U0c0bHczWnE4MUhjcWJRZ2RyS3gwTXlSR1pxTFVG?=
 =?utf-8?B?cUhVRDd4bDU0dEljbXlFRUJsYlB1Vm9kMEl0OXM5cFRyY2RRTU50VUNHcXR0?=
 =?utf-8?B?V3YvQUNWVXp2YVRkUWpRbm52OGd5cFF5eDJGcGcvbkcxMnNLL29KQlRVbDZn?=
 =?utf-8?B?T0ZIWGMrc29OZUNodVlBaEdrMXFOb1ZTbjJ4clVQR3I1UVVhZGhWbFdkdEkx?=
 =?utf-8?B?R0VkSHY0MUJGVmdSdlBVWmpQZmRTUm16Mk5KcXJ5RTFZVWpuYlN5Y3MyS0hV?=
 =?utf-8?B?cDVkYjE2R2xockRBaWxrcytwMFl5eXRoRlNCWDJteHVwOVoxREY4b29DVFp4?=
 =?utf-8?B?MUdza3p4eTY3bXVvR3VPSU9pZEJ6d2NEeHZnbHNZK1B3dk16MWxlQXBrOVJE?=
 =?utf-8?B?Snd4cGlOcFRiYndadFBveGN5Q1laNytUSU5LWmg0UXVKcFoyclpmTVZ1ZmRI?=
 =?utf-8?B?ZnZkb3hMWXhob1dKeUt4NlhqTmFwbExPVkVMbk5HL1BNRHFsOVkyYjVGbjBR?=
 =?utf-8?B?UWRoZlMraXFaVzk4WlJvV3dNSklSbm5NbzVzTnU2anRGazA4ZlZUMGhhSjY5?=
 =?utf-8?B?L3VIQlRHZTRzZmFwRzRUR3UxdEwwOUpEczJYSG84cElKQnJFaTVLUWlWb2hW?=
 =?utf-8?B?MUpHdk8vR1hWUHp4bzlhQkpYWS9lRS9SNWhuTm5hTE4zdmQxZTVXd1hwajNP?=
 =?utf-8?B?M3VPWnBnUnE2MWRwNnRGNlF1OUdvQUlNMXBWdUNBNkJzQ2IrUjRDbDIrM2VC?=
 =?utf-8?B?dkF4SS9hem43ejV3cU5Rcy9BbDIrWEMyZ3N3Tk1CYW9LYUdCckh1OUFEc0hY?=
 =?utf-8?B?aDNuRm5tZjJuQ3NFWlQ4U3BSSzNPNkNHYU5xYlBsUDRWcEs0L0RaU1B5NFBX?=
 =?utf-8?B?aGk1emRJdVp6OXc1QlRkUUV3Um8vdTJocFlNMG1uSlFmbXFJMW9IZXVCekEr?=
 =?utf-8?B?bndiOEZxNkRham9YdTdrMlhjOGZxRDNxM3M2WTlyYnloMGVGSkxHdnNyZkRk?=
 =?utf-8?B?M3A4VVJsakxsT2JHVk0xRFg0Z1JWWWZMeGthTDZOV0t4TitMcjVuTlQvVnl5?=
 =?utf-8?B?RklCSTlEbjNZU2Y4Z1R4Nk1OckVtNXNyTGJTUVhMbkZMVUtoTlFkMTRkenRM?=
 =?utf-8?B?WkRZRkhOaGcxN2kvcHhoWDlpbk1UcHg2YUd1MDR5Yk1Eb085d3c2OXREZnBh?=
 =?utf-8?B?ZUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0BBB6FA07FFEEB4186C18D0A96340DD2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b0a4167-3f1c-482c-df13-08dbc5b94225
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2023 15:39:27.2193 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 61EjlmKeC4y1T9PJMOPjh4eRZzsFB79VB5mxXHQ217tSn4ON65EN22o3SETJDShgu4h9z+q/ST/atri8hu/ZPqw6KqZoDdnFXc3r7hZ1ztM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8483
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Add coredump to wa_bb timeouts
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

T24gV2VkLCAyMDIzLTEwLTA0IGF0IDA5OjQwIC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIFR1ZSwgU2VwIDI2LCAyMDIzIGF0IDA5OjIwOjU2UE0gKzAwMDAsIFN0dWFydCBTdW1tZXJz
IHdyb3RlOg0KPiA+IFdlJ3JlIHNlZWluZyBzb21lIGhhbmdzIGR1cmluZyBkcml2ZXIgbG9hZCBv
biBzb21lIHBsYXRmb3Jtcw0KPiA+IGluIENJIHdoaWNoIGFyZSBoYXJkIHRvIGNhdGNoIG1hbnVh
bGx5LiBBcyBzdWNoLCBhZGQgdGhlIGR1bXANCj4gPiBhdCB0aGUgdGltZSBvZiB0aGUgaGFuZy4N
Cj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNA
aW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmMgfCA1
ICsrKystDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jDQo+
ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYw0KPiA+IGluZGV4IDFhYTQ0ZDRmOWFjMS4u
ODBlYTA3NjE5N2U1IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5j
DQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmMNCj4gPiBAQCAtNDYsNiArNDYs
NyBAQA0KPiA+IMKgI2luY2x1ZGUgInhlX3ZtLmgiDQo+ID4gwqAjaW5jbHVkZSAieGVfd2EuaCIN
Cj4gPiDCoCNpbmNsdWRlICJ4ZV93b3BjbS5oIg0KPiA+ICsjaW5jbHVkZSAieGVfZGV2Y29yZWR1
bXAuaCINCj4gPiDCoA0KPiA+IMKgc3RydWN0IHhlX2d0ICp4ZV9ndF9hbGxvYyhzdHJ1Y3QgeGVf
dGlsZSAqdGlsZSkNCj4gPiDCoHsNCj4gPiBAQCAtMTg3LDggKzE4OCwxMCBAQCBzdGF0aWMgaW50
IGVtaXRfd2Ffam9iKHN0cnVjdCB4ZV9ndCAqZ3QsDQo+ID4gc3RydWN0IHhlX2V4ZWNfcXVldWUg
KnEpDQo+IA0KPiBwbGVhc2Ugbm90aWNlIHRoYXQgeGVfZGV2Y29yZWR1bXAgZG9lc24ndCBoYXZl
IGFueSBraW5kIG9mIGxvY2tpbmcNCj4gbWVjaGFuaXNtLCBiZWNhdXNlIGl0IHJlbGllcyBvbiB0
aGUgc2VyaWFsaXphdGlvbiBvZiB0aGUgZ3RfcmVzZXQuDQo+IA0KPiBPbmNlIHlvdSBzdGFydCBj
YWxsaW5nIGZyb20gb3RoZXIgcGxhY2VzLCB0aGVuIHdlIHNob3VsZCBwcm9iYWJseQ0KPiBhZGQg
c29tZSBkYXRhIHByb3RlY3Rpb24gdGhlcmUuDQo+IA0KPiBCdXQgYWxzbywgbWF5YmUgd2Ugc2hv
dWxkIGRlZmluZSBhbmQgcHJpbnQgc29tZSBraW5kIG9mICd0eXBlJyB2YXINCj4gdGhhdCBpcyBh
bmQgYXJndW1lbnQgdG8geGVfZGV2Y29yZWR1bXAoKSBhbmQgdGhhdCBnZXRzIHByaW50ZWQgb24N
Cj4gdG9wIHRvIGVuc3VyZSB0aGF0IHdlIGhhdmUgYSBjbGVhciBpbmRpY2F0aW9uIGZyb20gd2hl
biB0aGV5IGFyZQ0KPiBjb21pbmcgZnJvbSBhIGd0X3Jlc2V0IGFuZCBmcm9tIG90aGVyIHRpbWVv
dXRzPw0KDQpZZWFoIGRlZmluaXRlbHkgbm90IGEgYmFkIGlkZWEsIGFsbW9zdCBsaWtlIGEgdHJh
Y2UgcG9pbnQuIEknbGwgdGhpbmsNCml0IG92ZXIgYW5kIHJlcG9zdC4NCg0KQWxzbyB0aGFua3Mg
Zm9yIHRoZSBjb21tZW50cyBvbiB0aGUgZGF0YSBwcm90ZWN0aW9uLiBJJ2xsIHJldmlldyBhDQps
aXR0bGUgY2xvc2VyIG9uIHRoZSBuZXh0IHJldi4NCg0KVGhhbmtzLA0KU3R1YXJ0DQoNCj4gDQo+
IENjOiBNYWFydGVuDQo+IA0KPiA+IMKgwqDCoMKgwqDCoMKgwqB4ZV9iYl9mcmVlKGJiLCBOVUxM
KTsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKHRpbWVvdXQgPCAwKQ0KPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHRpbWVvdXQ7DQo+ID4gLcKgwqDCoMKgwqDCoMKg
ZWxzZSBpZiAoIXRpbWVvdXQpDQo+ID4gK8KgwqDCoMKgwqDCoMKgZWxzZSBpZiAoIXRpbWVvdXQp
IHsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfZGV2Y29yZWR1bXAocSk7
DQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gLUVUSU1FOw0KPiA+
ICvCoMKgwqDCoMKgwqDCoH0NCj4gPiDCoA0KPiA+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsN
Cj4gPiDCoH0NCj4gPiAtLSANCj4gPiAyLjM0LjENCj4gPiANCg0K
