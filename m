Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E8BC7EE25
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 12:54:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6555F10E5B0;
	Thu,  8 Jun 2023 12:54:49 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5BE610E5B0
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jun 2023 12:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686228887; x=1717764887;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=oNCm9jrlaxAY69qkNcyE+jWYTNcgf7nnJAkhIz5o/7A=;
 b=Hf6kT0hMNVHrWPOW80CJQBaXsodAqf4fpU+5Nv9JRx/ks/OUrVU3a/Cw
 3PIc7wtUGjfommsB52v+BA2YbKJN6m3jGJtCJGWX5+FTXT6rn1HT6+zCU
 /n/c9YjGlTUXKY/nT1XRrbfGIqA2uTZDMkMDpgn4la+gyvO+tQRwOgRIe
 S2nPdRjwylrgmVrU4Asm+VtC3Q0R1T0aNhOgGo8+l3qTbQMgJ6UEJsduv
 +spvAVvqr2Unm6LlQ8+Z8RDtH6C1A+HVkXB3Cdl4Zf4IUgf1mgOzdlNvD
 X8dUeybdTbjor99y5H5qGw+xTGM1KFmGxyCiZz7jBaq/cj9dTazbmWScu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="357303808"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="357303808"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 05:54:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="739691497"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="739691497"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 08 Jun 2023 05:54:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 8 Jun 2023 05:54:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 8 Jun 2023 05:54:46 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 8 Jun 2023 05:54:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gv2WtHrCJqbiNZ45/no/MxPLl51ad9f1tBpnJdNAYDE+xV8rrDCDrhESCmNr3k0788j2VS2Xtfe4GoU4zY6Rml9f3V3r6egChfzyiVX/lMI6Dks0+OJD/DXTcxv+lVy173XaLsyHynod3eNNdYYMEcdTQgHQcVMNfjkeWzxSw1pepILJ3rjsYS+BvhwM/n47NlQCR+xp8/aDgHEEgZv77NCEq35LWQsxsyQxwinuQ85ADVM6KrHiueJXBWoAx37ifL50UKJFF01qubHbTQQH6seUK+NewOYgquVBGUT352wv7ivzIW1okPLessfOnC/X1Gj6mCQ7mcs01w39sP09jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oNCm9jrlaxAY69qkNcyE+jWYTNcgf7nnJAkhIz5o/7A=;
 b=byg8467MDiVMFkGqVrDo2p4L7FNHOmKxL6hzTGfoXly3/un+h8xFzDWQpK+4WXFMGKwCGmxuC3o23D+03aV+pwYUhl0Izm9utqAE0ku3KRlac7V4AE3qrZURlcLLJlnV5g20ztQtaEgmf5qxK4/K+jGJb55jggKEfy1xX7Pxbr6o9VyRSEIAdwhZ2GDlR6acgT8g5g5x1i9TG/6aV5vMcmCJewl1rnarYku2Gpqx9AisOdxe4W/nVNMj7F8eBt4W3YCNaHrZ8agX9gTqwNmR+JnqgRgWuRXaAa2jrsxIUwhefcQew3gROWNZWviM4xqDGURAbn5B+h6wi9lO5TDt+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3114.namprd11.prod.outlook.com (2603:10b6:5:6d::11) by
 CO1PR11MB5106.namprd11.prod.outlook.com (2603:10b6:303:93::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.38; Thu, 8 Jun 2023 12:54:45 +0000
Received: from DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::7bdd:7269:8d66:346e]) by DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::7bdd:7269:8d66:346e%3]) with mapi id 15.20.6455.034; Thu, 8 Jun 2023
 12:54:45 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: Use large rings for compute contexts
Thread-Index: AQHZlX0R1PFtu5dKIEqspO26qFd5vK975dSAgACOsICABHFIAA==
Date: Thu, 8 Jun 2023 12:54:45 +0000
Message-ID: <488e97074252e77b277cda92998e6ff21bbc17d4.camel@intel.com>
References: <20230602180702.17380-1-niranjana.vishwanathapura@intel.com>
 <0541475d-1f16-3d17-8e2b-24885c5f4035@linux.intel.com>
 <ZH4Vixiob1JtYkkQ@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZH4Vixiob1JtYkkQ@DUT025-TGLU.fm.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3114:EE_|CO1PR11MB5106:EE_
x-ms-office365-filtering-correlation-id: f79c6836-d496-44ef-caa6-08db681f88e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UPwv5gTz+1lKQNNvO//wyw5eb6TSgCCw3/g3nDjsXtYRCnGHb3B/gvIoykm5iAjdROdQUdWFKBIPQNr1bbgKnez4O7M9FSodN672sQ67rxpTgQD9lhsZLBVYYk+JuSo086BMOACQu1wVmvyAJk5nctxzfvyKN9qOBxe2OVOaM/eS07GvXmENBQacl7H0ylImWYpTU766JgwyZjXPMfZBPaTnv+HkBsdGmxoZMBTMql9GrKvRd1Ocx6DRakHZLgd57GEFlG3pPwILeBtLUE2XhfMi3r7v0KWczWhaB/eNtjG/aozEiOqP9y3PRVtApWjM5YT5tsFuDuNILhJssvnxI1SAvOhXunDy7Fi/nCi0dHTBqNvo8PZxNo6S5W1FUNVgmEKE6Q/7WiHLfObNpqm2wdl7NKnIcoxLi2DkImQzYtyUMSYJf9d951/jLwud1E12c7Uudgy0ddMqBn6BUz9DkSLazzeQt/PpX9XdKAHz86QsyvY1oH7L5rhlFCDiBtNRzQPdMZbfGzM+tzBXLGlHs88sCTQmkesQYBaRa/lHuukLAQaxCUgYO9+v2eAJanph
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3114.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199021)(36756003)(38070700005)(2906002)(86362001)(966005)(66574015)(6486002)(71200400001)(186003)(83380400001)(26005)(6512007)(53546011)(6506007)(107886003)(5660300002)(122000001)(91956017)(82960400001)(478600001)(54906003)(37006003)(66946007)(316002)(66556008)(66476007)(66446008)(64756008)(4326008)(6636002)(2616005)(38100700002)(41300700001)(76116006)(8936002)(8676002)(6862004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RG56V1JMMlhjTEJpek1rN0FxQ2d0SXB5bjlJUk11cnFuYlNNeVlZMVZKWGkw?=
 =?utf-8?B?MkZOdDRMMlNjTm5xajMxVmdmazY1OVJxYzJVckJ3b2h4MW03M0pYZmYzVWdF?=
 =?utf-8?B?b2taYWloQnEwSkYrYU11WWp4a3oyZGtBNkJkMHp5bWIxRk05RGd1Vkw3c2o2?=
 =?utf-8?B?RUpoUWo2TjB3eGV0L2c5TlBzcnN2MFJJNW9CN0Q2UCtUL1hsdHc1aWxzdldl?=
 =?utf-8?B?MmY5K3NRWlRrUzdWVElPclZPaUVSSXNGK05SZGh5RGh1a2ZLMTRua3VJem5p?=
 =?utf-8?B?czBYMzkyby9KaGNnVmRlalJxcHRLdUk4RzFWL0xHdjRhOFRNU2UvQk9hcm5G?=
 =?utf-8?B?eDFtVHdmejNUMzhCZnROcDJQWUZ0T3RCMU5CR3JtV1RPc2F1M0hGeEZyZ3lh?=
 =?utf-8?B?UkxFc3RjY3lWZ0VMN0VFSURLemsrMU4xVTdyaE1BVjFwUWg5NVlUUmEyVHlG?=
 =?utf-8?B?OWlSRjVLTTgwRmF4QksyY1grRzdHb09nN09iYVZqOGx2UGpERS9QYVFubzEr?=
 =?utf-8?B?aTc2WjJkMFRIUHB1akw2bStaT0swd0orQjVQQnoxN3E2aFAwMUk1SDZLUTc5?=
 =?utf-8?B?MWtOT1FpWUVzQldPdnJ5bVp1RHNIWFY5c25NZ3lWbGUxb01SdjkzNXF4S0sv?=
 =?utf-8?B?TDRNdHFsdUdvVzVBQ3lTRUQ5TDMweUN2bDZkc3ljYlRMU3ZtamwxQmJ4ZVhO?=
 =?utf-8?B?dEtFSTFuZFEydFRoU2Q3T2hsd05sUDBlcC84WlgzRUFuZVg1dktya3FabHQ0?=
 =?utf-8?B?NnovVk5vSTdnTFN4ZVRtUDlIQVZYZzhpRVVwL1ppWjRCZGhBR05qYVhYLzFv?=
 =?utf-8?B?Q0N1NXFuMnV0RnVTRlMrcVNSUUVhVWtuc0FUNUxSZS9UK1JGZkVXVVBQY0lE?=
 =?utf-8?B?ckl1QjFJbGh6YTQyRExIdWJlUHVLS1poSU1Lays1SmV3SXY1VnhGRyttU0pr?=
 =?utf-8?B?dkpqR0h6TUJnejFCYWtGbGhGRERHT3BuUDg4NXkrWW4wQk02OEZxcWtNcjVC?=
 =?utf-8?B?SDVwMllJdEErREdMTC9xZy8xRVVXbGhySlA4b1EzK1J3WXloSkdsUjlJTitn?=
 =?utf-8?B?ajRpWWg2alMvVzdwVVdSQXpYbUlmZWFySHgzMmZkR2tJT3JkemRmdVB0bGl4?=
 =?utf-8?B?bjZUbjczUlZLc1Y0MFdmaHgxcG5UV2dvVXJ4cnlPdW1yRytNUlhXK1hBSEdm?=
 =?utf-8?B?L2hEZVVPcG5RV2NxcDhocHVYNmJqVTlGeENla3ZyMlpSNlpHU1k5TzFqTjNv?=
 =?utf-8?B?a0IrVTNuVmtET2lWUnpNeGEwN0xCZXltNVdZRlJMT2hjTTZRb3UzYTJ0djRM?=
 =?utf-8?B?aWxsd2F4NWZEZ3JMQXFqUkJNYVJUdlJTTVhray9pRGFhOUhTeDhrZGZLQVUz?=
 =?utf-8?B?dEQvOUhDY211YkxBWVB6TkhSVHp6RVJUdFRQQWpUSjhFYmZRRGU0UWY0M0c3?=
 =?utf-8?B?c1pWQ2ZjVFNPcFFzRlA1emgxMG8rM21waGNiNk9mdGhUcTBPYkpvQVc5M2Fv?=
 =?utf-8?B?anhybHNuQmRmc2ZTNWtWcGxUbWptaklYZDg2SGdrWW9idFkyNXd0Mm9lZi9z?=
 =?utf-8?B?QWtFM1hOTVdER0RHTktBZnF6akRzbkhNTzUwVktaOHFWNEdmeEM4WWFyU1U2?=
 =?utf-8?B?KzdjdEdGdTQrQWhJSUp6VW9MM0J0bUd4aTVMOCs0THRuaTIwaUhvQUd2ZHV3?=
 =?utf-8?B?VCtUTWlwS2RMTHUzdjhCK0tzUFYzcDN4bzJVcWZxNjVsaTBTS0NIQjV4UjlC?=
 =?utf-8?B?MS9ZZVNBeEIzMWtDMVFWUnFEaGpxQzdoUmFwelhicWtHelpEc2FibUdyS2ND?=
 =?utf-8?B?dmFIekxFTHJ0LytjYUl1MUUwdFM3ckFYZlpuSUsyelhzdnBGTEZHR1FwVGUy?=
 =?utf-8?B?WTlSUVF0WGJHMmhMRlducStDZ2xGRVFLUzBJYmlUM0ZCODNwcElZYWFhU0pz?=
 =?utf-8?B?c3puS29MVVRWQ1BLazE3SkhsVW1BSi84OVdjMXVNV3RBWlNCNkJmeVBobjNj?=
 =?utf-8?B?TDBKeWdrM2dvZkJNd1JVQ2JmU0V4YmlqaXE5QTNuUDd4a1NSUEl3ZHZFcHhK?=
 =?utf-8?B?R1RxekxPaUdDMER4Tk5HQzRaa0w5SFpOOXlZMTBMZUZsaVpVdXpQbmVFa0Nv?=
 =?utf-8?B?TW1wWVd6WFJaVXVMWktuZExGSDZBVjB6ck1uSTh5SitSNTVNdFdyOGhoVVpB?=
 =?utf-8?B?bkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BBAA0FB7CD708F4B89EDA11F82E6F938@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3114.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f79c6836-d496-44ef-caa6-08db681f88e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2023 12:54:45.3017 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vt3seZY241YyvzUvr3uBMC3zpfyi+j+zDZ4qCbdte6415AbQ7si9tZZltAl5Aj05FSucod31A0Eftg+lNRq6spJuIReEOX8j5HTYyVwVVyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5106
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Use large rings for compute contexts
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Wilson,
 Chris P" <chris.p.wilson@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTA2LTA1IGF0IDE3OjA0ICswMDAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBNb24sIEp1biAwNSwgMjAyMyBhdCAxMDozMzoyOUFNICswMjAwLCBUaG9tYXMgSGVsbHN0
csO2bSB3cm90ZToNCj4gPiBIaSwgTmlyYW5qYW5hLA0KPiA+IA0KPiA+IE9uIDYvMi8yMyAyMDow
NywgTmlyYW5qYW5hIFZpc2h3YW5hdGhhcHVyYSB3cm90ZToNCj4gPiA+IEFsbG93IGNvbXB1dGUg
Y29udGV4dHMgdG8gc3VibWl0IHRoZSBtYXhpbWFsIGFtb3VudCBvZiB3b3JrDQo+ID4gPiB3aXRo
b3V0DQo+ID4gPiBibG9ja2luZyB1c2Vyc3BhY2UuDQo+ID4gPiANCj4gPiA+IFRoZSBvcmlnaW5h
bCBzaXplIGZvciB1c2VyIExSQyByaW5nJ3MgKFNaXzE2Sykgd2FzIGNob3NlbiB0bw0KPiA+ID4g
bWluaW1pc2UNCj4gPiA+IG1lbW9yeSBjb25zdW1wdGlvbiwgd2l0aG91dCBiZWluZyBzbyBzbWFs
bCBhcyB0byBmcmVxdWVudGx5IHN0YWxsDQo+ID4gPiBpbiB0aGUNCj4gPiA+IG1pZGRsZSBvZiB3
b3JrbG9hZHMuIFdpdGggdGhlIG1haW4gY29uc3VtZXJzIGJlaW5nIEdMIC8gbWVkaWENCj4gPiA+
IHBpcGVsaW5lcw0KPiA+ID4gb2YgMiBvciAzIGJhdGNoZXMgcGVyIGZyYW1lLCB3ZSB3YW50IHRv
IHN1cHBvcnQgfjEwIHJlcXVlc3RzIGluDQo+ID4gPiBmbGlnaHQNCj4gPiA+IHRvIGFsbG93IGZv
ciB0aGUgYXBwbGljYXRpb24gdG8gY29udHJvbCB0aHJvdHRsaW5nIHdpdGhvdXQNCj4gPiA+IHN0
YWxsaW5nDQo+ID4gPiB3aXRoaW4gYSBmcmFtZS4NCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1i
eTogQ2hyaXMgV2lsc29uIDxjaHJpcy5wLndpbHNvbkBpbnRlbC5jb20+DQo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBUZWphcyBVcGFkaHlheSA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPg0KPiA+ID4g
U2lnbmVkLW9mZi1ieTogQW5kaSBTaHl0aSA8YW5kaS5zaHl0aUBsaW51eC5pbnRlbC5jb20+DQo+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhDQo+ID4gPiA8bmly
YW5qYW5hLnZpc2h3YW5hdGhhcHVyYUBpbnRlbC5jb20+DQo+ID4gDQo+ID4gV2l0aCB0aGUgRFJN
IHNjaGVkdWxlciwgam9icyBhcmUgd3JpdHRlbiB0byB0aGUgcmluZyBmcm9tIGEgZHJtDQo+ID4g
c2NoZWR1bGVyDQo+ID4gbm90aWZpZXIgd2hlbiBhbGwgZGVwZW5kZW5jaWVzIGFyZSBzYXRpc2Zp
ZWQgYW5kIHRoZXJlIGlzIHJpbmcNCj4gPiBzcGFjZQ0KPiA+IGF2YWlsYWJsZSwgYW5kIEkgYmVs
aWV2ZSB0aGF0J3MgdGhlIGNhc2UgZXZlbiBhZnRlciBNYXR0aGV3IEJyb3N0J3MNCj4gPiBjaGFu
Z2VzDQo+ID4gdG8geGUgLyBkcm0tc2NoZWR1bGVyIG9uIGhvdyBjb21wdXRlIGpvYnMgYXJlIGhh
bmRsZWQuDQo+ID4gDQo+ID4gU28gdGhpcyBwYXRjaCBzaG91bGRuJ3QgYmUgbmVlZGVkIGZvciB4
ZS4NCj4gPiANCj4gPiAvVGhvbWFzDQo+IA0KPiBPbiB0aXAgb2YgWGUgd2UganVzdCBob2xkIGpv
YnMgaW4gdGhlIERSTSBzY2hlZHVsZXIgaWYgdGhlcmUgaXNuJ3QNCj4gcm9vbQ0KPiB0aGUgcmlu
ZyBhbmQgd3JpdGUgdGhlIHJpbmcgaW4gcnVuX2pvYiBvbmNlIHNwYWNlIGZyZWVzIHVwLiBCdXQg
SQ0KPiBndWVzcw0KPiB3ZSBjYW4ndCBkbyB0aGlzIGJlY2F1c2UgZG1hLWZlbmNpbmcgcnVsZXMg
Zm9yIGxvbmcgcnVubmluZyBqb2JzDQo+IChjb21wdXRlIG9yIGZhdWx0IG1vZGUgVk0pLCBzbyBh
ZnRlciBteSB1cGRhdGUgd2UgcmV0dXJuIC1FV09VTERCTE9DSw0KPiBpbg0KPiB0aGUgZXhlYyBJ
T0NUTCBbMV0uIFNvIHllcywgdGhpcyBpcyBuZWVkZWQgaWYgdGhlIHVzZXIgd2lsbCByZWd1bGFy
bHkNCj4gd3JpdGUgbW9yZSB0aGFuIDg1IGpvYnMgKDE2ayAvIDE5MikgYXQgYSB0aW1lIG9uIGxv
bmcgcnVubmluZyBWTXMuDQo+IA0KPiBbMV0NCj4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0
b3Aub3JnL3BhdGNoLzUzODY2NS8/c2VyaWVzPTExODA5MSZyZXY9Mw0KDQpIbW0uIFllcyBpbmRl
ZWQgSSBmb3Jnb3QgYWJvdXQgdGhlIC1FV09VTERCTE9DSyBzaW5jZSB0aGUgcmV2aWV3LsKgDQpP
VE9ILCBJSVJDIHRoaXMgcGF0Y2ggd2FzIHRvIGhhbmRsZSBhIHNpdHVhdGlvbiB3aGVyZSBhIGNv
bXB1dGUgYmF0Y2gNCndhcyBtYWRlIHRvIHdhaXQgb24gYSBsYXRlciBiYXRjaCBiZWluZyBzdWJt
aXR0ZWQsIGJ1dCB0aGF0IG5ldmVyDQpoYXBwZW5lZCBkdWUgdG8gbGFjayBvZiByaW5nIHNwYWNl
LiBTbyBkZWFkbG9jay4gQnV0IHRoZSBwYXRjaCB3YXMNCmNvbnNpZGVyZWQgYSB0ZW1wb3Jhcnkg
c29sdXRpb24gYW5kIGV2ZXJ5Ym9keSBhZ3JlZWQgdGhhdCB0aGUgY29ycmVjdA0Kc29sdXRpb24g
d291bGQgYmUgdGhhdCBVTUQgaW1wbGVtZW50ZWQgdGhlIG5lZWRlZCBidWZmZXJpbmcgaGVyZS4N
Cg0KU28gbm93IHdoZW4gdGhpcyBpcyBnb2luZyB1cHN0cmVhbSBpcyBhY3R1YWxseSBhIGdvb2Qg
dGltZSB0byBtYWtlIHRoYXQNCmhhcHBlbiBJTU8sIGJ1dCBwcm9iYWJseSBuZWVkcyBhIHN5bmMg
d2l0aCB0aGUgY29tcHV0ZSBVTUQgZm9sa3MuDQoNCi9UaG9tYXMNCg0KPiANCj4gPiANCj4gPiA+
IC0tLQ0KPiA+ID4gwqAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2VuZ2luZS5jIHwgNCArKystDQo+
ID4gPiDCoCAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+
ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZW5naW5lLmMN
Cj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2VuZ2luZS5jDQo+ID4gPiBpbmRleCBiMzAz
NmM0YThlYzMuLjQ3YzlmMTE5ZmIyOSAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9lbmdpbmUuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2VuZ2lu
ZS5jDQo+ID4gPiBAQCAtMjksNiArMjksNyBAQCBzdGF0aWMgc3RydWN0IHhlX2VuZ2luZQ0KPiA+
ID4gKl9feGVfZW5naW5lX2NyZWF0ZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwNCj4gPiA+IMKgIHsN
Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfZW5naW5lICplOw0KPiA+ID4gwqDCoMKg
wqDCoMKgwqDCoHN0cnVjdCB4ZV9ndCAqZ3QgPSBod2UtPmd0Ow0KPiA+ID4gK8KgwqDCoMKgwqDC
oMKgdTMyIHJpbmdfc2l6ZTsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBpbnQgZXJyOw0KPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoGludCBpOw0KPiA+ID4gQEAgLTY1LDggKzY2LDkgQEAgc3RhdGljIHN0
cnVjdCB4ZV9lbmdpbmUNCj4gPiA+ICpfX3hlX2VuZ2luZV9jcmVhdGUoc3RydWN0IHhlX2Rldmlj
ZSAqeGUsDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGUtPmJpbmQuZmVu
Y2Vfc2Vxbm8gPSBYRV9GRU5DRV9JTklUSUFMX1NFUU5POw0KPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oH0NCj4gPiA+ICvCoMKgwqDCoMKgwqDCoHJpbmdfc2l6ZSA9IChlLT5jbGFzcyA9PSBYRV9FTkdJ
TkVfQ0xBU1NfQ09NUFVURSkgPw0KPiA+ID4gU1pfNTEySyA6IFNaXzE2SzsNCj4gDQo+IFNaXzUx
Mksgc2VlbXMgbGlrZSBvdmVya2lsbC4gQWxzbyB3ZSdkIHdhbnQgdG8gY2hlY2sgaWYgVk0gaXMg
YSBsb25nDQo+IHJ1bm5pbmcgYXMgVGhvbWFzIGlzIGNvcnJlY3QgdGhpcyBub3QgbmVlZGVkIGZv
ciBub3JtYWwgVk1zLg0KPiANCj4gTWF0dA0KPiANCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBmb3Ig
KGkgPSAwOyBpIDwgd2lkdGg7ICsraSkgew0KPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGVyciA9IHhlX2xyY19pbml0KGUtPmxyYyArIGksIGh3ZSwgZSwgdm0sDQo+ID4gPiBT
Wl8xNkspOw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGVyciA9IHhlX2xy
Y19pbml0KGUtPmxyYyArIGksIGh3ZSwgZSwgdm0sDQo+ID4gPiByaW5nX3NpemUpOw0KPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoZXJyKQ0KPiA+ID4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byBlcnJfbHJjOw0KPiA+
ID4gwqDCoMKgwqDCoMKgwqDCoH0NCg0K
