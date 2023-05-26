Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21773C77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 09:12:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E784810E7D9;
	Fri, 26 May 2023 09:12:28 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D9010E7D9
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 09:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685092348; x=1716628348;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=DYjD85W73q4/JwUH5qojexW/fVVJ84u5SnrAHeFs8fU=;
 b=KEzqyz8ivJmNvLRkKeOOiLg6eotdK851kd5rdGHCJXgngnhZhYifftk6
 lFrc/6nuw+CUImvYoTg38HFuNFNpMnjNKnCYMpAnJswfJKBw3ftCz9tyE
 VoGd+PjNk5iG15BrJfJDkmCc68tQSqyn8vTljaI9ifUGll7V+vR939e9I
 XVev5iSpiFsvbYdZDN01bGmn4BGlPy3WK6G5Xob/xIzBqrgjaG2VZ6hbM
 Pd+/W1kBZJK+MSIgWspbuugi5pwadzQQ24m3I9jXNTmNYCgPJ9ryCsLKX
 BkWIiLmjyZPmG/OjIpB3Cw4Y+njRKnMgH4+UZfw+9NKhVLSgqgXk80ezE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="440513623"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; d="scan'208";a="440513623"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 02:12:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="1035281239"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; d="scan'208";a="1035281239"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 26 May 2023 02:12:27 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 02:12:26 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 02:12:26 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 26 May 2023 02:12:26 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 26 May 2023 02:12:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RuWNgo1z+UaHVzGprrH4i8IIh9McNGCt1U63kdO4pOGSyidzsVvRsMWdapBcAQIsv+86+B5hKxY5R/NPVaHeSZmzuPgR6Mnjy+gu0EX4BClhUXOaIO2fRQo8K1kKsJZjRoKzxFOSNNBWU78XmLclO4c1HLZQUwrlBVX0EOeAcYf6rsMvKrI81RCIOI3XXsswhi8SFZdkxonGDfNk3NKNEtxZbNkpP9NjcdRiXkjbb4a71JyTk2I/lBbwCe9BH3gyFqsNggAHWf2VAa3VewW5tuR7G6D1vta/uLSF1ORRWhSHLbHUs8mh6yvixraURlnoYcrWVjaTZm1ZWsKi4AoA/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYjD85W73q4/JwUH5qojexW/fVVJ84u5SnrAHeFs8fU=;
 b=X4BCMzgYokoojSsrY0dLI8hMHZHUKkI28SZQZnYjO72NpcSLIk4xbA9AQ4AqSMFSVsw19VDnfT8bteJaV6lnGUphA2ep8Y91SWJ9cxYszAlyccR6KvOspM/pNQeGRt88+XzhGf0FAAZOULEnTOnzT6NAndsvJFwbRljuL0+taiJkOuGRq5bYSgzKcQFn2HQ3o9R2ZZpZd+JVEOjBOZBUlh+emZaUQc8k/4tpJkM6sXml5YdvuKXIYhenQMgfOpzWb/wZQSBCaxWrKJHXT4DnkcuAGHkNOOwEl9skozm5yL0RjTKx//MA5WPc/5u6VV01HZSe+l89Er1kQKln6wkxKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3114.namprd11.prod.outlook.com (2603:10b6:5:6d::11) by
 CO1PR11MB5060.namprd11.prod.outlook.com (2603:10b6:303:93::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.18; Fri, 26 May 2023 09:12:23 +0000
Received: from DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::bd04:720:a75a:8bd]) by DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::bd04:720:a75a:8bd%5]) with mapi id 15.20.6433.018; Fri, 26 May 2023
 09:12:23 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Thread-Topic: [PATCH v2] drm/xe: Apply upper limit to sg element size
Thread-Index: AQHZj0AWzEu/IDaL0UCXP4Pk1q0Rw69sRdeA
Date: Fri, 26 May 2023 09:12:23 +0000
Message-ID: <a0112b3f617356d507f055f081dc72071607ea0e.camel@intel.com>
References: <20230525193528.25251-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230525193528.25251-1-niranjana.vishwanathapura@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3114:EE_|CO1PR11MB5060:EE_
x-ms-office365-filtering-correlation-id: a6dc2c06-4d53-4fee-d9c7-08db5dc9511a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fBiF0YGFJ8oXGY4WBRYENYdYYVtFepP8Oh4gTjwpCE6Mm2ywR7aXxHHjfSM9SmzbHQ2GqA3LTc/UOXFYcHKHM3SSwIf2fHuMGs9DzHlUHbTCnJgFHB093/Cdz7KCtkrQRHt/wETZaOfh+LiJZIWAPsix1NzJJ5mghY+Yr+gizBFUh3lDMEBGzzgmEDaDyY56iXjPefJ+i7eMUcNbGGN+yKGm52moGMLWpDZ2Nik/TitD1iv6/1EmJgxvOHIKzkDBShn/ecenH0m/+IMFDglqrmkf+NgyhygLpYtBUFI2dcOg932u5rW36BFzcK7ZDSjOhPQqG2c+kYnoksIACpgTIi6bm98MPLePEHS5yX+1qyENrUbUXYRpxwOLeCIHLDHQ1fhsPeubGgP6OGzVFsCqElfAQ4SVmPCuyjixEb5tv+0KtM4l6YDI5mJwWUnD4rwSwAxicYA/qS2MTJ5QCGEspGzSNzQ4KzRe/BX/lja4UC7l9vA6MIPNM0wUXqNCGesrBT0Y4x59p8He8y0zDi/uYSAWiuQba89FfngJkvZ4aFj5RyfOi2y2ZDAsxcjo45DUywx2ZkLxWofxIELrUcc/bNH7SB9djp8BAIEmr5oMACvTVJRyDqNwsqmgcF2xkGeG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3114.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(346002)(366004)(376002)(396003)(451199021)(316002)(71200400001)(26005)(91956017)(122000001)(36756003)(82960400001)(6506007)(6512007)(4326008)(6636002)(107886003)(66946007)(76116006)(64756008)(66556008)(66446008)(66476007)(38100700002)(5660300002)(41300700001)(6486002)(8676002)(8936002)(83380400001)(86362001)(478600001)(110136005)(54906003)(186003)(2906002)(2616005)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RWNGNXJQbkxrYWJYeWZzM2RKUlVRUnVVUFhOSXkxM2c5R1Rva0tVSFZvQUpw?=
 =?utf-8?B?VXNENm41cW5GMjgzS2tXaE94QnA4R0VSZERrZjZOYlJtZ0RUNW01ME5VMEgw?=
 =?utf-8?B?dHM5Ym92dXFKcEhsYlZzY0dFU3BNckloRWlDejU1Vno4V2QzeDMrTFhZaDFr?=
 =?utf-8?B?ano0N3h4MUdSNFYrSkUxc0dMelRmKythb1Nlb09lOHpGb3Z0SkNGQ2JBeGly?=
 =?utf-8?B?eENZWGJnOEVWZitPWE9wWnhCSi96QlJ5VFJBN2dXUU50dk14cWl6ZFlINUtx?=
 =?utf-8?B?QldNMTRGK1ZUdXNhRnUyeUhaN0Z5a2JqQlVjZG9EdjJaRXBocGpCaDIyR1Jo?=
 =?utf-8?B?eTdLSVl5NDl2MDhqRGNtL1d2dlZKQWJZRnFUSlZlMzZ4c25VL1c2Z2NCWUs0?=
 =?utf-8?B?UW03QmxKZ09RNWxDNjE5aGhralQvcFhjVi9RNVl2L3dUcWNtRXhFRGVISjhW?=
 =?utf-8?B?bFoxUmVjbWJLTkJHZElnYzQ5TTJ0VFFGajhYL09QT2RpMFhTRHRwLzBGZVhP?=
 =?utf-8?B?VE94aWsrQjFiMVRVenNJemZ6ZkR0OE14OHl5ZG9TaHRhWDh3cFRxTWlRaVBF?=
 =?utf-8?B?MDRpemp6M0J2Y3VWdXU0ZUViVVRKQ0NGMkM4THEzWERCN1B6V2RnT2ovQmxQ?=
 =?utf-8?B?d0ZRSjRHNGFveEFCTGNSSVBKL3RPN0grYnNiaFRjL3lnNFFueE0zMXRIbWtq?=
 =?utf-8?B?MDBNMGNnd2tNbVR6YmJOb0pDNlRFWlV2bEdDYWtFOTVpN0htNWgydTRidXl3?=
 =?utf-8?B?RXRHNGtUMkhxekErc1ZvQmRra1NYMjBqNnFBNDIzd2NRQzhaNGpwOWtSVFFB?=
 =?utf-8?B?L1laMU4wWk9jZUx5ZDhFbnhxV2JkYmxqODl2REtWajBNWW9HcVd3V1dVdnJM?=
 =?utf-8?B?Z0o0VWUweGoyay8xZlFUdStLTll0LzkydmFmUXlZL0V1Z0ZGbGF6S2N6VHVC?=
 =?utf-8?B?cVZFSkxpVTNiUWRVRXgyZ2I5QW5XYzM0V1E4YmMwS0ZXajByektlQW5UUzV2?=
 =?utf-8?B?NFZWQUt2dG5DM2JEY0lBZ0s5cmpBMytpY3BIcU9wY1RBbWk3OFVtQzJkeERP?=
 =?utf-8?B?UWdUSUNkRmN0NkFXOHhTQmN2ZG1YdlJqdnlzWXVLQXBCeUZTb1MyV0ZEd2tZ?=
 =?utf-8?B?c2I3WWZ5NkVETVQ3TjFYY0d1VEhOZGNFdGRkd0ZSRGNCS3R6eWxSR2REWlpC?=
 =?utf-8?B?aDZnU2ZzOEhEOENUMXc2b1ZsN1BoclBWTXJ4NDZGbWQ0VTBBRE1DQXFuNnMz?=
 =?utf-8?B?SUZHdmw0ZVNsa3RDeE9TZjhvYnFML1NuQXFGaDlvR3BCYURlQWllVjhwajh2?=
 =?utf-8?B?OTc4dWhxb0RHT2VzTHNRZTNqbE84bXdCSzl6Rlg2NkZwV3JMTGV2dzlYOXoz?=
 =?utf-8?B?ZTVrdG5DVGVpR29VZGR3K0dVVjlUVTBsc3RhTkVJVk55MkFkTHhEUlNiejMv?=
 =?utf-8?B?T3QyWkN6L2YrRzJVR2pXM2lqenpCOGk0NHYwTENGc09mbTg4ZGRSem5sVEhq?=
 =?utf-8?B?VmF1cVFHZnpZR3praVJhcmJUOUdSOHhTRitqK0NOWEJjVUdkM2IrNEZleFRm?=
 =?utf-8?B?dCt2MjBvRHc4V2JHM2Q2Qlp0RGNtOVJLVE5sZlNzY004Rmcvd1VaUFpDMHB2?=
 =?utf-8?B?QkxjYU40MjFIdlM0QzBPdUxNMlFMNVVGQlg4K0JsckJmMTcwUThOQ0dFYkRs?=
 =?utf-8?B?VEtCODFEUEt1WDRtemZFa1FENkhKT1lSZUE1MWVKV3NnM09Nb2FrM2Uyell3?=
 =?utf-8?B?eTBKRjBRS0oyTkJkUFBZMWo5R1F4Z3ZNOG56ZXl2Nk1GckZMbkxPOWVtTlNi?=
 =?utf-8?B?VHpMQnBZaVFILytiTE9UUm9PNVZ1Y0tyaXpkY3RoVUFXS2R0YzdTZ2I3OWwx?=
 =?utf-8?B?UUpKZjJFTjR2Y0gxTURFWCtLWG9nMXp4NlBDelJ0aWdzNGt6WWZ2Z1JocVBa?=
 =?utf-8?B?WXFUWUV5VngyYjVlVndYYVVldnM2Y1NXQndhZTIxOE1CVHpTYmhEcFgwYTdZ?=
 =?utf-8?B?Mi9TZC9rRzVERkRLczluQ3pWVHE5bXlWU2dPOU5ITk5RNDNIWkF3K0N5c2pG?=
 =?utf-8?B?TnBqVDAyQWtKR0dabVhVZFlYcE5wbkFVN3hQVzFQZXQzcllzMFdxYXRwZlYy?=
 =?utf-8?B?SXNiNm5KR051dHphN2g0aiszSXJSRXB6M2hMcDJ0QkpuYUxhNEpMb3FwQnFX?=
 =?utf-8?B?bmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7682B4EDCA3CEE46AEE28FC2BAE6094D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3114.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6dc2c06-4d53-4fee-d9c7-08db5dc9511a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2023 09:12:23.3257 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vcGONwqaIG3GOcqg6F8FG+R/KzHo2LGoIqU1DnPQb3S9sU0fGSB/j1ewRy515rAtXWDYMgBglfPFrch+ygQamqpMCZ0areOg2/TbC2s5BDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5060
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Apply upper limit to sg element
 size
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

SGksIE5pcmFuamFuYS4KCk9uIFRodSwgMjAyMy0wNS0yNSBhdCAxMjozNSAtMDcwMCwgTmlyYW5q
YW5hIFZpc2h3YW5hdGhhcHVyYSB3cm90ZToKPiBUaGUgaW9tbXVfZG1hX21hcF9zZygpIGZ1bmN0
aW9uIGVuc3VyZXMgaW92YSBhbGxvY2F0aW9uIGRvZXNuJ3QKPiBjcm9zcyBkbWEgc2VnbWVudCBi
b3VuZGFyeS4gSXQgZG9lcyBzbyBieSBwYWRkaW5nIHNvbWUgc2cgZWxlbWVudHMuCj4gVGhpcyBj
YW4gY2F1c2Ugb3ZlcmZsb3csIGVuZGluZyB1cCB3aXRoIHNnLT5sZW5ndGggYmVpbmcgc2V0IHRv
IDAuCj4gQXZvaWQgdGhpcyBieSBoYWx2aW5nIHRoZSBtYXhpbXVtIHNlZ21lbnQgc2l6ZSAocm91
bmRlZCBkb3duIHRvCj4gUEFHRV9TSVpFKS4KPiAKPiBTcGVjaWZ5IG1heGltdW0gc2VnbWVudCBz
aXplIGZvciBzZyBlbGVtZW50cyBieSB1c2luZwo+IHNnX2FsbG9jX3RhYmxlX2Zyb21fcGFnZXNf
c2VnbWVudCgpIHRvIGFsbG9jYXRlIHNnX3RhYmxlLgo+IAo+IHYyOiBVc2UgY29ycmVjdCBtYXgg
c2VnbWVudCBzaXplIGluIGRtYV9zZXRfbWF4X3NlZ19zaXplKCkgY2FsbAoKT0ssIEkndmUgZmlu
YWxseSByZWFkIHVwIGEgYml0IG9uIHRoZSBjb2RlLCBhbmQgYXMgeW91IHNheQpkbWFfc2V0X21h
eF9zZWdfc2l6ZSgpIGRvZXNuJ3QgYWZmZWN0IHRoZSBzZ19hbGxvY190YWJsZV9mcm9tX3BhZ2Vz
KCkKY29kZSBhdCBhbGwsIHNvIHdlIG11c3QgdXNlIHNnX2FsbG9jX3RhYmxlX2Zyb21fcGFnZXNf
c2VnbWVudCgpIGFzIHlvdQpzYXkuCgpUaGUgcHJvYmxlbSBzdGVtcyBmcm9tIHRoZSBpb21tdSBj
b2RlIHRyeWluZyB0byBhbGlnbiBzY2F0dGVybGlzdAplbGVtZW50cyB0byBkbWEgc2VnbWVudCBi
b3VuZGFyaWVzLCBhbmQgdGhlIHNjYXR0ZXJsaXN0OjpsZW5ndGggY2FuCm92ZXJmbG93IHByZXR0
eSBtdWNoIHJlZ2FyZGxlc3Mgb2YgdGhlIHZhbHVlIG9mIHRoZSBzZWdtZW50IGJvdW5kYXJpZXMs
CmFzIHlvdSBzYWlkIHByZXZpb3VzbHkuCgpCdXQgdGhlIHNpemUgb2YgdGhlIHBhZGRpbmcgY2Fu
IG5ldmVyIGV4Y2VlZCB0aGUgbGVuZ3RoIG9mIGFuIHNnCmVsZW1lbnQsIGJlY2F1c2UgdGhlbiB0
aGUgc2cgZWxlbWVudCB3b3VsZCBoYXZlIGZpdCBhbmQgbm8gcGFkZGluZwpuZWVkZWQuIFNvIHRo
YXQgdGhlIG9ubHkgcmVzdHJpY3Rpb24gbmVlZGVkIHdvdWxkIGJlCnNjYXR0ZXJsaXN0OjpsZW5n
dGggbXVzdCBuZXZlciBleGNlZWQgVUlOVF9NQVggLyAyLCB3aGljaCB3YXMgcHJldHR5Cm11Y2gg
dGhlIHZlcnNpb24gMSBvZiB0aGUgcGF0Y2guIFNvIHNvbWUgY29tbWVudHMgYmVsb3c6Cgo+IAo+
IFNpZ25lZC1vZmYtYnk6IE5pcmFuamFuYSBWaXNod2FuYXRoYXB1cmEKPiA8bmlyYW5qYW5hLnZp
c2h3YW5hdGhhcHVyYUBpbnRlbC5jb20+Cj4gLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVf
Ym8uY8KgwqAgfMKgIDggKysrKystLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5owqDC
oCB8IDIxICsrKysrKysrKysrKysrKysrKysrKwo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX21t
aW8uYyB8wqAgNyArKy0tLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uY8KgwqAgfMKg
IDggKysrKystLS0KPiDCoDQgZmlsZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgMTEgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMKPiBpbmRleCBjODJlOTk1ZGY3NzkuLjIxYzVhY2E0
MjRkZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jCj4gQEAgLTI1MSw5ICsyNTEsMTEgQEAgc3RhdGljIGlu
dCB4ZV90dF9tYXBfc2coc3RydWN0IHR0bV90dCAqdHQpCj4gwqDCoMKgwqDCoMKgwqDCoGlmICh4
ZV90dC0+c2cpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKPiDC
oAo+IC3CoMKgwqDCoMKgwqDCoHJldCA9IHNnX2FsbG9jX3RhYmxlX2Zyb21fcGFnZXMoJnhlX3R0
LT5zZ3QsIHR0LT5wYWdlcywKPiBudW1fcGFnZXMsCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDAs
ICh1NjQpbnVtX3BhZ2VzIDw8Cj4gUEFHRV9TSElGVCwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
R0ZQX0tFUk5FTCk7Cj4gK8KgwqDCoMKgwqDCoMKgcmV0ID0gc2dfYWxsb2NfdGFibGVfZnJvbV9w
YWdlc19zZWdtZW50KCZ4ZV90dC0+c2d0LCB0dC0KPiA+cGFnZXMsCj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBudW1fcGFnZXMsIDAsCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAodTY0KW51bV9wYWdlcyA8PAo+IFBBR0VfU0hJRlQsCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9zZ19zZWdtZW50X3NpemUoeGUK
PiBfdHQtPmRldiksCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBHRlBf
S0VSTkVMKTsKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKHJldCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHJldHVybiByZXQ7Cj4gwqAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2JvLmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uaAo+IGluZGV4IDdlMTEx
MzMyYzM1YS4uYTFjNTFjYzBhYzNjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9iby5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmgKPiBAQCAtMjk2LDYgKzI5
NiwyNyBAQCB2b2lkIHhlX2JvX3B1dF9jb21taXQoc3RydWN0IGxsaXN0X2hlYWQKPiAqZGVmZXJy
ZWQpOwo+IMKgCj4gwqBzdHJ1Y3Qgc2dfdGFibGUgKnhlX2JvX2dldF9zZyhzdHJ1Y3QgeGVfYm8g
KmJvKTsKPiDCoAo+ICsvKgo+ICsgKiB4ZV9zZ19zZWdtZW50X3NpemUoKSAtIFByb3ZpZGVzIHVw
cGVyIGxpbWl0IGZvciBzZyBzZWdtZW50IHNpemUuCj4gKyAqIEBkZXY6IGRldmljZSBwb2ludGVy
Cj4gKyAqCj4gKyAqIFJldHVybnMgdGhlIG1heGltdW0gc2VnbWVudCBzaXplIGZvciB0aGUgJ3N0
cnVjdCBzY2F0dGVybGlzdCcKPiArICogZWxlbWVudHMuCj4gKyAqLwo+ICtzdGF0aWMgaW5saW5l
IHVuc2lnbmVkIGludCB4ZV9zZ19zZWdtZW50X3NpemUoc3RydWN0IGRldmljZSAqZGV2KQo+ICt7
Cj4gK8KgwqDCoMKgwqDCoMKgc2l6ZV90IG1heCA9IG1pbl90KHNpemVfdCwgVUlOVF9NQVgsCj4g
ZG1hX21heF9tYXBwaW5nX3NpemUoZGV2KSk7CgpkbWFfbWF4X21hcHBpbmdfc2l6ZSgpIHNob3Vs
ZCBiZSB1bnJlbGF0ZWQ/IHBlcmhhcHMKCglzdHJ1Y3Qgc2NhdHRlcmxpc3QgX19tYXliZV91bnVz
ZWQgc2c7CglzaXplX3QgbWF4ID0gMVVMTCA8PCAoc2l6ZW9mKHNnLmxlbmd0aCkgKiA4KTsKCj4g
Kwo+ICvCoMKgwqDCoMKgwqDCoC8qCj4gK8KgwqDCoMKgwqDCoMKgICogVGhlIGlvbW11X2RtYV9t
YXBfc2coKSBmdW5jdGlvbiBlbnN1cmVzIGlvdmEgYWxsb2NhdGlvbgo+IGRvZXNuJ3QKPiArwqDC
oMKgwqDCoMKgwqAgKiBjcm9zcyBkbWEgc2VnbWVudCBib3VuZGFyeS4gSXQgZG9lcyBzbyBieSBw
YWRkaW5nIHNvbWUgc2cKPiBlbGVtZW50cy4KPiArwqDCoMKgwqDCoMKgwqAgKiBUaGlzIGNhbiBj
YXVzZSBvdmVyZmxvdywgZW5kaW5nIHVwIHdpdGggc2ctPmxlbmd0aCBiZWluZwo+IHNldCB0byAw
Lgo+ICvCoMKgwqDCoMKgwqDCoCAqIEF2b2lkIHRoaXMgYnkgZW5zdXJpbmcgbWF4aW11bSBzZWdt
ZW50IHNpemUgaXMgaGFsZiBvZgo+ICdtYXgnCj4gK8KgwqDCoMKgwqDCoMKgICogcm91bmRlZCBk
b3duIHRvIFBBR0VfU0laRS4KPiArwqDCoMKgwqDCoMKgwqAgKi8KPiArwqDCoMKgwqDCoMKgwqBy
ZXR1cm4gcm91bmRfZG93bihtYXggLyAyLCBQQUdFX1NJWkUpOwo+ICt9Cj4gKwo+IMKgI2lmIElT
X0VOQUJMRUQoQ09ORklHX0RSTV9YRV9LVU5JVF9URVNUKQo+IMKgLyoqCj4gwqAgKiB4ZV9ib19p
c19tZW1fdHlwZSAtIFdoZXRoZXIgdGhlIGJvIGN1cnJlbnRseSByZXNpZGVzIGluIHRoZSBnaXZl
bgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW1pby5jCj4gYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfbW1pby5jCj4gaW5kZXggYzdmYmIxY2MxZjY0Li40YzI3MGEwNzEzNmUg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21taW8uYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9tbWlvLmMKPiBAQCAtMTEsNiArMTEsNyBAQAo+IMKgI2luY2x1ZGUg
InJlZ3MveGVfZW5naW5lX3JlZ3MuaCIKPiDCoCNpbmNsdWRlICJyZWdzL3hlX2d0X3JlZ3MuaCIK
PiDCoCNpbmNsdWRlICJyZWdzL3hlX3JlZ3MuaCIKPiArI2luY2x1ZGUgInhlX2JvLmgiCj4gwqAj
aW5jbHVkZSAieGVfZGV2aWNlLmgiCj4gwqAjaW5jbHVkZSAieGVfZ3QuaCIKPiDCoCNpbmNsdWRl
ICJ4ZV9ndF9tY3IuaCIKPiBAQCAtMjYsMTEgKzI3LDcgQEAgc3RhdGljIGludCB4ZV9zZXRfZG1h
X2luZm8oc3RydWN0IHhlX2RldmljZSAqeGUpCj4gwqDCoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGlu
dCBtYXNrX3NpemUgPSB4ZS0+aW5mby5kbWFfbWFza19zaXplOwo+IMKgwqDCoMKgwqDCoMKgwqBp
bnQgZXJyOwo+IMKgCj4gLcKgwqDCoMKgwqDCoMKgLyoKPiAtwqDCoMKgwqDCoMKgwqAgKiBXZSBk
b24ndCBoYXZlIGEgbWF4IHNlZ21lbnQgc2l6ZSwgc28gc2V0IGl0IHRvIHRoZSBtYXggc28KPiBz
ZydzCj4gLcKgwqDCoMKgwqDCoMKgICogZGVidWdnaW5nIGxheWVyIGRvZXNuJ3QgY29tcGxhaW4K
PiAtwqDCoMKgwqDCoMKgwqAgKi8KPiAtwqDCoMKgwqDCoMKgwqBkbWFfc2V0X21heF9zZWdfc2l6
ZSh4ZS0+ZHJtLmRldiwgVUlOVF9NQVgpOwo+ICvCoMKgwqDCoMKgwqDCoGRtYV9zZXRfbWF4X3Nl
Z19zaXplKHhlLT5kcm0uZGV2LCB4ZV9zZ19zZWdtZW50X3NpemUoeGUtCj4gPmRybS5kZXYpKTsK
ClNob3VsZCBub3QgYmUgbmVlZGVkIHRoZW4/Cgo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoGVyciA9
IGRtYV9zZXRfbWFzayh4ZS0+ZHJtLmRldiwgRE1BX0JJVF9NQVNLKG1hc2tfc2l6ZSkpOwo+IMKg
wqDCoMKgwqDCoMKgwqBpZiAoZXJyKQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jCj4gaW5kZXggYTAzMDY1MjZiMjY5
Li40ZDljOGRlOGIzNDggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYwo+IEBAIC0xMTcsOSArMTE3LDExIEBA
IGludCB4ZV92bWFfdXNlcnB0cl9waW5fcGFnZXMoc3RydWN0IHhlX3ZtYSAqdm1hKQo+IMKgwqDC
oMKgwqDCoMKgwqBpZiAocmV0KQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290
byBvdXQ7Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqByZXQgPSBzZ19hbGxvY190YWJsZV9mcm9tX3Bh
Z2VzKCZ2bWEtPnVzZXJwdHIuc2d0LCBwYWdlcywKPiBwaW5uZWQsCj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoDAsICh1NjQpcGlubmVkIDw8IFBBR0VfU0hJRlQsCj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoEdGUF9LRVJORUwpOwo+ICvCoMKgwqDCoMKgwqDCoHJldCA9IHNnX2FsbG9jX3RhYmxlX2Zy
b21fcGFnZXNfc2VnbWVudCgmdm1hLT51c2VycHRyLnNndCwKPiBwYWdlcywKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHBpbm5lZCwgMCwKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCh1NjQpcGlubmVkIDw8Cj4gUEFHRV9TSElGVCwKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX3NnX3NlZ21lbnRfc2l6ZSh4ZQo+
IC0+ZHJtLmRldiksCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBHRlBf
S0VSTkVMKTsKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKHJldCkgewo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgdm1hLT51c2VycHRyLnNnID0gTlVMTDsKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGdvdG8gb3V0OwoKVGhhbmtzCi9UaG9tYXMKCg==
