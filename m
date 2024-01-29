Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E975BC47DA9
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 21:24:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE499112B49;
	Mon, 29 Jan 2024 21:24:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7945A112B49
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jan 2024 21:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706563446; x=1738099446;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=j2fnEK2ZGYiQK/1pa2EvaGNd6SiTZisSCqqxJJmmR2c=;
 b=BDnz1Z4sfFZE8yVUcRuYeEpLjxnLydore1IBckzFLuAOS8dVv0km6Qt3
 iQiGzUpIyJdHmhjA3Rg0XCbVikd71aW9A9OPqS1ZfJwHbSoW0NT8I2+d2
 60Q44B1oJIjk8Uhw52d5cA6Nu1FmWtNT+Tz57ttmzhWPhvJDakAz5Iyfc
 czrXGpAw3Y1vJavL48E2G6UG/IS7yX5tRIclqxeVaZ9XHKvGfRSXkztH4
 z7JPASahVWwYw57HKUPJYnoc7leY9nqW/sHL2cFmu3+LE37ImpPcSHJhd
 DVO4cGgD0ddaO4LbTAqKs48zDwi0zoqeSkIhQZmy3/oWLIqU/s9tjUF78 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="16623374"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="16623374"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 13:24:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="931222237"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="931222237"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2024 13:24:05 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 13:24:05 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jan 2024 13:24:05 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Jan 2024 13:24:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fhybn7oA8nwv0d2K8LFjlM1qkke1ZeYXNp+kkdWzIsryRFjZDRSUkstXUdYlgU+BzADtRFdIkNslwmeJCpGcrFyI45Mz4cKUeDPmcmSI+82L2Mq1C8A1ShkvZMHhsKRTmHLrMlmEU8wAD06c61X9puAycY7ZFoCXYs+x9raOb14Hm+T02h7UkGTxLlmxgu70WCrgH8cgP2wQ/co8EuJB0ZMidWLHbTWbCawpgk1SfDaEJyra6BOt+6HJm6qEKKatXl/DVPUBkLFAbL1bOohBl+ygoOFYbfIxnN2gstzC8t1aCobAaAf0hyPoVkiRGWRkasavH1KWrfCRoViKrMNJMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2fnEK2ZGYiQK/1pa2EvaGNd6SiTZisSCqqxJJmmR2c=;
 b=TXAs1xT/iGwDmN3nXPOfmMbYy/rSjCMb66V/yXIiE+iEuVe9go45hXyzuQ6y8W2pHCXWIDYCtdVZZg5X1jUnPG2UaqkG+OOKU+N6QzsYczPzbYD7JKWA51XJh/Yg2zt8Hr9NNhPHK7JYovO/hn3t+sjEuJDF8cJ7FBzRWtT/GzxzkjKUjSmZYiaK6hsUXeqB5mGHJbTR6Ah8QvTU0V2aDbFW3Ur6hZQCHJ4pjI8AP6Vxvb7NaOqcVL9U/vmya7SEgZI+R2xUcCYpBAdOnBcu/LUjy+5i616IOpbN8yU5MMFK5VS6uGpZ79EUjPIAkFUiLGHkWZQiQBfEX/2FPmbh5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SA1PR11MB6615.namprd11.prod.outlook.com (2603:10b6:806:256::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.31; Mon, 29 Jan
 2024 21:24:02 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::98c3:e090:252e:7967]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::98c3:e090:252e:7967%4]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 21:24:02 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: Re: [PATCH v3 1/6] drm/xe: Add functions to convert regular address
 to canonical address and back
Thread-Topic: [PATCH v3 1/6] drm/xe: Add functions to convert regular address
 to canonical address and back
Thread-Index: AQHaUt97B8GqhdeSrE+dgokfrEbu17DxSkkAgAAC6YA=
Date: Mon, 29 Jan 2024 21:24:02 +0000
Message-ID: <c6d6715dac41865d1fb3f730e70c433ff8ec5d0f.camel@intel.com>
References: <20240129181742.183694-1-jose.souza@intel.com>
 <20240129211334.GK5506@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20240129211334.GK5506@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SA1PR11MB6615:EE_
x-ms-office365-filtering-correlation-id: c2de6f79-5bf4-4ec6-3a49-08dc21109d95
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fcUuUPJ6v/85w7RDCrxvcwcbP1QORaezY+8WtK0r/GaZHHQH5UwqQtYPDxhl9Z3Ov65Ht9YrRhtEPbHt/sQAIif6sw9Ov+n5RJsnUqTN5CUTvRQUxmsmcd2ddgOqzEFT5kOxiO8gJEo5Y2QaDgMAZKRLEEzk21gnZvlblwC9vS6DEWX8BA4iG7IoS93l7Vt92LQx67RY2gAqjczCBINrS3OdnwsWH9ej7odv4RBrImUMOieKLNGE2XB7PkZzbCTHIuK/t/l/y8pbUqHrYG4VK/L3C1kpM4Z7N0sABn53E1Bgj+wIzMaYgsFKa0XUIE3DADgc68QFPK0JH9t8j39yy6Aqkf1ljzCX0j9fCbIijG+6vkB4VMXriy2diZRSc1fUo1Rolz95aQ2is6gbEM1xS1P0opBQqTJZZdTdRYvZw7NmP4Z/zXKZgvobPAYPAEOP93sjK2txLqcO6Hey4mowVEQI1R6MZm6pcSPR+u4GRWFyjl2qeQDfNUhniS3+pWVZJ9XO+5q2quJBf1GTnUT7O3+1WYxtOxj5DrWM3siRyx0HYqejxvYdi+E/bvDoBLjKeq5h7gmyEBiIUGVdADsZpSzCbFwlTyRb0uZo/PZu08LKGTO/u/jy+tNZLvaoRV0J
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(366004)(396003)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(26005)(83380400001)(6512007)(6506007)(36756003)(86362001)(38070700009)(82960400001)(8676002)(8936002)(41300700001)(6862004)(4326008)(5660300002)(66946007)(122000001)(478600001)(107886003)(38100700002)(316002)(66476007)(64756008)(76116006)(54906003)(66446008)(66556008)(6486002)(2616005)(71200400001)(2906002)(6636002)(37006003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NjBFd09qcFZaTFZoQVExU1FORkJyMnhWa045Y0p2bDBlUVBDcVdmTC9sSjRL?=
 =?utf-8?B?SlgrVWRBZzd5MGROczBjOEg5eU1BQlRoTmdRaElBVkpTMHdmSGU1OElUU0cx?=
 =?utf-8?B?dGRYVkxLcFA3NFlXU3ZTZ1VxeG5mQ0NUUjZMdmg2OFNlU3BSQmVHVDI0QWFh?=
 =?utf-8?B?RnFLSlJaMEJad2lzVFkxK0RxMkxHQW04V3VVQ1loVTJzZ0c4d0JpSlk4cWdB?=
 =?utf-8?B?TVNkUlMzRWh0anJkQTdYbGN2dHkxRDhpcHhQdGk2NjhDZFAyRTJPczZpa1Bp?=
 =?utf-8?B?UzlRMEFKMElSK3RQcU55TUVOUW11QnlDZERuQjZ3aE1tb2JPMjltSDZnZ3Nl?=
 =?utf-8?B?ZXN1ZEJXL2RaMTh5MmFwZFlYTUg4SnpFZ3ZFS2ZmdDRMN01wbW5ucStwWElQ?=
 =?utf-8?B?RkJxTDlFNjV5ZmwxUUdXb1Z0dGZFWWZPUlM3c0E5aUh1cXczK01yVGE3eVh2?=
 =?utf-8?B?b2ZGaEVhS1d4bFRuazdxWWxSblNJcm56MndTUWQyMk9sL3dxWmt4MWRFVHJQ?=
 =?utf-8?B?aEVYRWJqR2NiWTJnQ2V5aVBFQUVKRWovMGRPWnlycjJuL1ZYbFRDcStLT1Zk?=
 =?utf-8?B?bVVoWkxPUzMyM1JXcEsreWE1cGFZbS9aU2Nmam5HWGhDNVBmYkRnMWRwY0pk?=
 =?utf-8?B?bHkycVM5aThucFlRaFZjSFBqRW1YNHRNZFJXNzRNYXF1YlJSZ3YyYXBZZUli?=
 =?utf-8?B?YVpNUFExOFE5WExUbExtSEFDeFhBR29uRlFqS0YvbSs4NUVjVFhxdmR4bHp5?=
 =?utf-8?B?NW42THk2bVZMRDNtUGZTRXMraDhrU1AxT1N4L2FPTWJjVWdYN2NQNUVKTzhh?=
 =?utf-8?B?cFY1NCsxMzJ0bFpOREJQZURGa2YrZnFCRTFJTUlqTlFZdXZOL2tHL254WTNv?=
 =?utf-8?B?a1E2ZzVQZk1VWTRpUzUySVRLZUhwS2pnYUhUNjl1MTJFVnIwcXVQT1lFYWJr?=
 =?utf-8?B?SmRHODRyb3ArS21jOG5wUHlaTFZqckdhZFk2QXk5TWhhcUF1a3FKbEViZFRC?=
 =?utf-8?B?MmpValdpNnNnRnZUV1pBSzVLYi8wUlRNakRxMXhyZWpNQUZoMnlVSUVrR0Ru?=
 =?utf-8?B?MU5iRDFCb1lWS1o0MklJSjF3SlJmTHNZbXp0U1d6eHoxdnU1Qm5sRVIzZmIz?=
 =?utf-8?B?SHV2N1VacmFCVG5JczRUTkxUQjFUbjR5OHIra3p4QmxmakszOG1Hc0lUU29t?=
 =?utf-8?B?UGcxbHhieWV2Q3c4SnltWlIwRWF4eWo0SkxnRUduVzJ0Y0t5U01paXd4UHpk?=
 =?utf-8?B?MnF3cFRWSkR4SFhxVC9aWFJFbHRoeWZyWmlyWU9iKzZteXRFaGRIRld0L3FK?=
 =?utf-8?B?OG1hS2dzMk5DSHBkdFFJQS91eG5NVVA5L2xFaGNCRDRLbjhUNnZNZzNwZVRZ?=
 =?utf-8?B?WXprTjViYmZhQk5RYmcvNUVNeWdCeHNyL0JXM3ZpVWFsVldFR0hGZUhIK0Rp?=
 =?utf-8?B?WVJHTFowS0ZYRm0zd1M4a2JWQjh4a0pSc0xBaS8wYW9EMTQ2dVg2b2RNc0xq?=
 =?utf-8?B?YndGTnk5dGh2N2VtODE5QXhxTkVvR0hGblZEZUIzNFlBNlpvSlZjQTR3M3JU?=
 =?utf-8?B?bDJNRm93ZW1QT2dYUGxkeWlBdWp0by9TM0wzY1kwcTl4eFY4NWw1WVZhUlV1?=
 =?utf-8?B?RXhla3VKeEh5azVRQzc5K3VjclBHRnMxMkloZjhKa1ZXNkRFWFdxVnYrcHVN?=
 =?utf-8?B?aTNLYVcrMlYwMFJ5eDhvaGpUK0FpaUxKeTEyRzRyOXRQNS9PeHprdVRpdURs?=
 =?utf-8?B?eVRBcGx1NFY5RHY3UlR0c0ZISE5xdlA3MEdGR3Y0TnBma3F5R1JYaGN2cExl?=
 =?utf-8?B?YWRiaWVnSG5McnZIdzZOVGdFS1hCQ0taN0NObWxQMi9UWERJM1ZTT1psT2JR?=
 =?utf-8?B?cjRKUmRFSUxWbkUvN0YrZFMzeDFnSU94MjlBcUhaYVRjbzFkY2tnVEd4UG5l?=
 =?utf-8?B?bHdPN3pHazNIaERxbW9vdjVhVmFkUWxrWElRNWFKRmtIZEhOL2tzK0EyRE1S?=
 =?utf-8?B?RGxGak5XUE1GWmNheXVpSFpYQTNMaDZJNmdTOG5SdDczbVZUbDYwVmRKYUx5?=
 =?utf-8?B?aUVnbEo1elVYMmNvTGo5N0NnRDBVNUVWOVVOdzQ0a1JDczRaY3h0MUhSSGFC?=
 =?utf-8?B?UjRKREFlNHdpSWUrdUpNc0NqRjZvWElqcWtxaldPL2YrQkc0dFBiTEVlZ1Vh?=
 =?utf-8?B?YkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1F8899589678FF42BC548AA309633EB4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2de6f79-5bf4-4ec6-3a49-08dc21109d95
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2024 21:24:02.6358 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xD9kZW1dxSh2ZR8OHdRYhftHswcyLtwkYv0Wy10SwIvDg1+SbEC/DjAo6h88KvU17bhYEubgAPpcGhuKQbzo7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6615
X-OriginatorOrg: intel.com
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "dev@lankhorst.se" <dev@lankhorst.se>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDI0LTAxLTI5IGF0IDEzOjEzIC0wODAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiBP
biBNb24sIEphbiAyOSwgMjAyNCBhdCAxMDoxNzozN0FNIC0wODAwLCBKb3PDqSBSb2JlcnRvIGRl
IFNvdXphIHdyb3RlOg0KPiA+IFNvbWUgaW5zdHJ1Y3Rpb25zIHJlcXVpcmVzIGNhbm9uaWNhbCBh
ZGRyZXNzIGxpa2UNCj4gPiBNSV9CQVRDSF9CVUZGRVJfU1RBUlQoVU1EcyBtdXN0IGNhbGwgeGVf
ZXhlYyB3aXRoIGEgY2Fub25pY2FsIGFkZHJlc3MNCj4gPiBmb3IgWGUyKykuDQo+ID4gDQo+ID4g
U28gaGVyZSBhZGRpbmcgZnVuY3Rpb25zIHRvIGNvbnZlcnQgcmVndWxhciBhZGRyZXNzIHRvIGNh
bm9uaWNhbA0KPiA+IGFkZHJlc3MgYW5kIGJhY2ssIHRoZSBmaXJzdCB1c2VyIG9mIHRoaXMgZnVu
Y3Rpb25zIHdpbGwgYmUgYWRkZWQNCj4gPiBpbiB0aGUgbmV4dCBwYXRjaGVzLg0KPiA+IA0KPiA+
IHYzOg0KPiA+IC0gaW5saW5lIHJlbW92ZWQNCj4gPiAtIHJlbmFtZSBoaWdoZXN0X2FkZHJlc3Nf
Yml0X2dldCgpIHRvIHBwZ3R0X21zYl9nZXQoKQ0KPiA+IA0KPiA+IENjOiBSb2RyaWdvIFZpdmkg
PHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+ID4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxkZXZA
bGFua2hvcnN0LnNlPg0KPiA+IENjOiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50
ZWwuY29tPg0KPiA+IENjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwu
Y29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMgfCAxNSAr
KysrKysrKysrKysrKysNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5oIHwgIDMg
KysrDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZGV2aWNlLmMNCj4gPiBpbmRleCA2ZmFhNzg2NWIxYWFiLi42MTcyZDRmOTg3OTM3
IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiA+IEBAIC03NDcsMyArNzQ3LDE4
IEBAIHZvaWQgeGVfZGV2aWNlX3NuYXBzaG90X3ByaW50KHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCBz
dHJ1Y3QgZHJtX3ByaW50ZXIgKnApDQo+ID4gIAkJZHJtX3ByaW50ZihwLCAiXHRDUyByZWZlcmVu
Y2UgY2xvY2s6ICV1XG4iLCBndC0+aW5mby5yZWZlcmVuY2VfY2xvY2spOw0KPiA+ICAJfQ0KPiA+
ICB9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IHBwZ3R0X21zYl9nZXQoc3RydWN0IHhlX2Rldmlj
ZSAqeGUpDQo+ID4gK3sNCj4gPiArCXJldHVybiB4ZS0+aW5mby5kbWFfbWFza19zaXplID4gNDgg
PyA1NyA6IDQ3Ow0KPiANCj4gQ2FuIHdlIGp1c3QgdXNlICh4ZS0+aW5mby52YV9iaXRzIC0gMSk/
ICBBcyBmYXIgYXMgSSBjYW4gdGVsbCwgd2hhdCB3ZQ0KPiByZWFsbHkgY2FyZSBhYm91dCBmb3Ig
Y2Fub25pY2FsIGZvcm0gaXMgdGhlIHNpemUgb2YgdGhlIFBQR1RUIHZpcnR1YWwNCj4gYWRkcmVz
cyBzcGFjZSwgbm90IHRoZSBETUEgbWFzaywgcmlnaHQ/ICBUaGF0IGFsc28gbWF0Y2hlcyBwbGF0
Zm9ybXMNCj4gbGlrZSBYZV9MUCBiZXR0ZXIgd2hlcmU6DQo+IA0KPiAgICAgICAgIC5kbWFfbWFz
a19zaXplID0gMzksICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4gICAgICAgICAudmFfYml0
cyA9IDQ4LA0KPiANCg0Kb3VjaCwgbWlzc2VkIHZhX2JpdHMgd2hpbGUgcmViYXNpbmcgdGhpcyBw
YXRjaC4NCg0KdGhhbmtzIGZvciBwb2ludGluZyBvdXQuDQoNCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICANCj4gDQo+IA0KPiBNYXR0DQo+IA0KPiA+ICt9DQo+ID4gKw0KPiA+ICt1
NjQgeGVfZGV2aWNlX2Nhbm9uaWNhbGl6ZV9hZGRyKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCB1NjQg
YWRkcmVzcykNCj4gPiArew0KPiA+ICsJcmV0dXJuIHNpZ25fZXh0ZW5kNjQoYWRkcmVzcywgcHBn
dHRfbXNiX2dldCh4ZSkpOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICt1NjQgeGVfZGV2aWNlX3VuY2Fu
b25pY2FsaXplX2FkZHIoc3RydWN0IHhlX2RldmljZSAqeGUsIHU2NCBhZGRyZXNzKQ0KPiA+ICt7
DQo+ID4gKwlyZXR1cm4gYWRkcmVzcyAmIEdFTk1BU0tfVUxMKHBwZ3R0X21zYl9nZXQoeGUpLCAw
KTsNCj4gPiArfQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNl
LmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmgNCj4gPiBpbmRleCAyNzAxMjRkYTFl
MDBlLi40NjJmNTllOTAyYjEyIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9kZXZpY2UuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuaA0KPiA+
IEBAIC0xNzcsNCArMTc3LDcgQEAgdTMyIHhlX2RldmljZV9jY3NfYnl0ZXMoc3RydWN0IHhlX2Rl
dmljZSAqeGUsIHU2NCBzaXplKTsNCj4gPiAgDQo+ID4gIHZvaWQgeGVfZGV2aWNlX3NuYXBzaG90
X3ByaW50KHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCBzdHJ1Y3QgZHJtX3ByaW50ZXIgKnApOw0KPiA+
ICANCj4gPiArdTY0IHhlX2RldmljZV9jYW5vbmljYWxpemVfYWRkcihzdHJ1Y3QgeGVfZGV2aWNl
ICp4ZSwgdTY0IGFkZHJlc3MpOw0KPiA+ICt1NjQgeGVfZGV2aWNlX3VuY2Fub25pY2FsaXplX2Fk
ZHIoc3RydWN0IHhlX2RldmljZSAqeGUsIHU2NCBhZGRyZXNzKTsNCj4gPiArDQo+ID4gICNlbmRp
Zg0KPiA+IC0tIA0KPiA+IDIuNDMuMA0KPiA+IA0KPiANCg0K
