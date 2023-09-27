Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF24E82CAF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 16:29:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE2210E56D;
	Wed, 27 Sep 2023 16:29:06 +0000 (UTC)
X-Greylist: delayed 425 seconds by postgrey-1.36 at gabe;
 Wed, 27 Sep 2023 16:29:03 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9023610E56D
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 16:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695832144; x=1727368144;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=5dJt1EDQfp4JbjhcB++BltmhQ/W/3w1v/ukGFJ1NqTA=;
 b=HsMHtkCPMO0QdmuaiefwD11D7soXypP02UBveluJd1Oc009/z4+3Evkm
 JFCtmogzKEiUsEwOJNJ54xy66qhiUMQIuV2mNZGk5F5Ou4ekITTiS7sO9
 LBnqqzDZjoVP3SRxc536PVzsgXB8rpv8pDkaFpZcdMhj2uHoegNM1oIrn
 HEry8A6327pBSrQqVRMen1uPkQJ14jacp7IR8E/MVgCPhUX5h0GcRxWuK
 dNAOC8FBFJcWCHGcN7B7HRX0f6po1kIVk1kWG49lPttUgZ07vuIvjohq5
 oXfgSFbwAD38YiFx7vlnBTjAVC8wKF/ozcUw4L/D1dTVLScTp5981BjHS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="3403391"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="3403391"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 09:21:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="864900902"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="864900902"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2023 09:21:22 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 09:21:22 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 09:21:21 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 09:21:21 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 09:21:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NBtMjapeH7+yG2TxdNOLtUvvnzb7CfPlveD/VBoq1fjJiE4qUjMBli3NPd4VWrAdkq8jm5ef7KHYqPl5PppyRwTzINUUTES4xJajbr5veZOhmVgISFPuAu1v+tQrume3yPdZVMSlZbpop0AcXUGQ0fa4lpP3lw3mn+H9iut/y30nUmGp/8FtE69yzcbfNRFWCA+o41fbNSimqVaZ7Lch2YlVLZuSeIbyeY/ugyaUGob742PlUhCGxHBJE75tXZs/lRGXhGPc9VEnsHF6QLjYTYodVFt9m5pC9so0x5tfiuyBKXGUMY2YwlJHNDeyQVJZTuJ21fguzEz+jLzH7UnizQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5dJt1EDQfp4JbjhcB++BltmhQ/W/3w1v/ukGFJ1NqTA=;
 b=kJLKqYLf5vXbqcCBNviAIk8047D306WmksEVT0DW7pywdVQwXj7uMt00MkPhCYr5Hg4GlPdu5PbG57JObml6YTs3u7qECuAoHIxosn2qKGpvmJvRhS1u34Q2KMp3GVASf027e6ncv1LTgVylBdrotn3DsbwIrtZn+4RnwVsBIMqGHyIf874iOFJr08VH0qzsnL8AKYHwKrIG11rogOq5Eu23S7JqbRnDqLclKbm6KK0Z3CDGvmqlQuOXa/67vt2vA/fsrieUVp5NnZ7l9pRb9yJe9NQOGQ9kcteyqP/1pKWrtCuCL/OwitKKIv5EYFT8nft3b1XtN8L3aOCFIJhmmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH8PR11MB7071.namprd11.prod.outlook.com (2603:10b6:510:215::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.21; Wed, 27 Sep
 2023 16:21:18 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47%7]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 16:21:18 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
Thread-Topic: [Intel-xe] [PATCH v4 0/5] PAT and cache coherency support
Thread-Index: AQHZ8THoEkEbtgmwAkK5AEwZIqnp2rAu2uMA
Date: Wed, 27 Sep 2023 16:21:18 +0000
Message-ID: <e4ae875f6f17b911d873abf449ecdc7b45cdf303.camel@intel.com>
References: <20230927110005.291917-7-matthew.auld@intel.com>
In-Reply-To: <20230927110005.291917-7-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH8PR11MB7071:EE_
x-ms-office365-filtering-correlation-id: 51947209-58d6-463b-def3-08dbbf75c7cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /A+3hhb9D/Y7Kx/osI97DAxZhenqzZw8t8/S8eM8zrDKTZ8Bn1Sn7gShw20oGlVfUTo8X6xPhsreiCORyInnuGmt0qu5Yer5rUy/GUgWb1lH0DOLpMVkq/bhjzXJ6GvaAuSd1sM8rimvIf0L6ZhUk+/aY75krf5hrRwDo43lxWpEis9JlkqF196uBVs02rvqAy0TMht9IYfam+dhtF4ScggpU5qAPoOZwVCv2mJ+r0yPHUOjXs8BYBDvSsVm/9qSEVHWv/pNzR7JlpF+Ym4GE+RVhBVTSpHVW6yx5hRifkL9UsRpFJfE9etSv0F/GRD78VmBEf56Wm7YYWT/3KYxrsO633B/dRDRbhjsdhbiHFGHGwBoFQeY7Zh+kw4QT36Q7Fxr1n1P385BdqZrVs4HTose4BX6JD2m4BU/G8ZstR+naknuyHQWR/ZI5jkpl/3FLlISIQlNFfwMNhsRc7WZHT8Z6u9GHfUrqB58hxyqg64t0lw7VvaEC1gjs9wVEL8z4zqfw50iSVIwYLO92mzTnoQ31/y2iU4P8Mc+Iev2ucSpP0me7Cs+cKEhhxdFbZ/qutnUfMdmJmtuCHHerYyXxADTaZBQWDwWHbS2I/WZVxiMjMG/Pz6rpC7r/1hOi52W
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(346002)(39860400002)(376002)(230922051799003)(451199024)(186009)(1800799009)(36756003)(86362001)(6506007)(6636002)(2906002)(122000001)(38100700002)(8676002)(82960400001)(38070700005)(64756008)(6486002)(966005)(2616005)(26005)(83380400001)(91956017)(6512007)(66946007)(71200400001)(110136005)(5660300002)(8936002)(316002)(76116006)(66476007)(41300700001)(66556008)(66446008)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVBEVVhIYWY2ekhwUTFPN3Nld0R2NFVienIrd2N3SWF0WGdpbTVqT3NBTmJP?=
 =?utf-8?B?NHVLK3pjVXVCSjNodkJ3bUJBaGg0NE5wNWthUUxEVGdDdURxeGNpSi9NaHNT?=
 =?utf-8?B?R3NpTGY5YTYyRVFlZUNGNUhXaXFCSmVZK2RkaS9XVkgxRzVrM2xMSlllV05n?=
 =?utf-8?B?WVMvTjd3eE55OXZJYlZGWWdzVFo2VlYxYmJ6YW9sbHU2SWVkMlE4c3BKU1ht?=
 =?utf-8?B?b2hzTlpNMXNNZm11ZVFmb2UyOGJVbWtBRU9EWXZGQVRtRTFOVk5qeGc5UUFw?=
 =?utf-8?B?aWVqVTAxRExDMG00cWJvRk5sWGtHendxRG9paHVrYmU5ZWZSMFlUeXowRmg5?=
 =?utf-8?B?SjB5K1lhV0FzV0xlWnlBLzFoM0FlLzY0ZTJ5N1ZSb2t2N3dGaDUwbGVqeW52?=
 =?utf-8?B?eU5GNVZyWXdHejk5TDJTVEhmMkJudjBMQldBb1Y3UTlsZGpzejlPR01LSVlR?=
 =?utf-8?B?T1VsWW9YaEdnZlBpQlBlamJURUFBNVdSSWJYSlZVMzlnYmJaL0RsL1N3cmQ5?=
 =?utf-8?B?L1dvSllGTVhIRmhpdlREMDJPSTNicXh6REtNNml5L0NJRkxJOUpmbm5qdWE5?=
 =?utf-8?B?V2NNVEh1Zko3TzZjZExIUHFrN28yZDU3bVpibzh1aHFSLzEva2ZQakpuQlVh?=
 =?utf-8?B?c1Y5dS9DZFpBUjRaZWVQOCtiNmhsN3ZONzgweFhDSXdyMk1uNGJSeXRLTnpr?=
 =?utf-8?B?ZUZmYXl3V2RTa2ZwdXcxRzZwRGgzMXZnZkVId09zdmZJSEFVMW1QdzgyTjAy?=
 =?utf-8?B?MFJnamJkNXlUT2FzR3VDNmEvc2V4dSt3c0YyVXRJdHVCUlRySVlkdSsvMFdQ?=
 =?utf-8?B?T1BJTDhNOGFoUDhUVkJ4amNpQ0xiaThyWFV4L0QyK1VGcCtzb1pta1hYUXpn?=
 =?utf-8?B?Z3Q1VnBGdWlQZ0RTWWRwblZzbysyc1hNYXhpSUcxVkdlN255N2dEQ2RSSXJ3?=
 =?utf-8?B?Q2RrM1JiU1Iwdnp4WnlIMkoxYlJBY016K2liUDUzRzJONklVTDd2ZEFLQ0JK?=
 =?utf-8?B?MUdSRCtTenA2a3lRcXVuY2VrbUtSZnZsME9UcFJuOEtDZFA2QmlQKzloYkJY?=
 =?utf-8?B?SXVHa1BJYm1TTzd5UUdnRVJlWVpBNjd1VmZaWlZmdWxsQzRPYVZab3F3WFp1?=
 =?utf-8?B?Tk1VQkVXaXp3WnJrTEtsM0UvaTF0RytybkhkNEFpTDVyOEZrdFJKSElrRGVq?=
 =?utf-8?B?S20vM0NmTVZ4c09DM3l5bTFSMXROdVpkQkEzczNqQmhrTk82REpkY1NIU0JY?=
 =?utf-8?B?K1kvSmpqUENWNVJ4a3hMclk3STlua3ZOd2ZRZkNNbWJxMXF4eFhKRGhxNGUw?=
 =?utf-8?B?d2tEODBmUVFKWHoxUDVVcTJoeHR5NER1bmRPcTd1TTAvUjZKemQvM09JcVpm?=
 =?utf-8?B?SHh4U05zNjlVcVMrWUxlaURJTW40bWZYV0VlMXlhbk90UkxKejFhQ01XK1lw?=
 =?utf-8?B?ZldqRmt3eklXQ0U0VWFrMUZNc2lLYzUya2RXcGxFU1BTcVJLOUJLS2RVYk84?=
 =?utf-8?B?M1pIdXA0clIwaFBYSFpwL2R1ci9OamhNMzRpUGUyYWRxY3VxY0R6WmQ4d2hm?=
 =?utf-8?B?ZG5QWTJMVytVdDBrT2NaQUM0emNLbEFneHVFMS8vVjQwT1NxWVIyM3dKMXEv?=
 =?utf-8?B?SFhlRk8zL3p5bWpOUTJIY0thU2FCZmg1ZlR1VytaRzJXbUZ3eDNRN2lIdklH?=
 =?utf-8?B?d0lTT1JySWNpZzBJMmY5QzNkZWwyRHZKRG9xQUlWWlNpb0l0SWEzd1UyZW5M?=
 =?utf-8?B?R1dzSThJdlg4RGVKRE9wcDRrWTRvdzQ1b3grTDkvZHhmNytTYmFvMzVESWNI?=
 =?utf-8?B?cVY2M0RWTVduLzhNRjc3VUpGUjk0MWY3c0tjTGplZy9PQjI3V05MWno4R2RS?=
 =?utf-8?B?MlJSbVIyRCttTmZ4NTNBTUduMWRHQm5TZWQwcktTS3RhTHh2bVNIeGMrL1p5?=
 =?utf-8?B?Y0xpUmkvMHl6Zk1oalptc1BnSjR0WHQ0dzFHY0FQK2dYTnRYelAxbDNncXQw?=
 =?utf-8?B?TEpLT1RycFdoTWE5UnpxUVB6OSsrV1hXRENVdXJ3Zlc3UXo4V1NnR3FjVlFY?=
 =?utf-8?B?c0M0NWg1OHArdjJ1MkkvK3lhenVUQmJuRCtzb2ZYSnhSUldQZGI4MG1NekVW?=
 =?utf-8?Q?4h9fK/tciO2oGXAz/tNn583Z5?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7497A597F5029E41B70032B2E786C8C1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51947209-58d6-463b-def3-08dbbf75c7cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2023 16:21:18.6986 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KBuSWVDYtfpfx1HYQqvc67EZrAMZHsDBFhhmoiwgPyxMh53e7lxyH1aZXkhlnvGH9lgpyacm13IGleIx6QtCbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7071
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 0/5] PAT and cache coherency support
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

T24gV2VkLCAyMDIzLTA5LTI3IGF0IDEyOjAwICswMTAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+
IEJyYW5jaCBhdmFpbGFibGUgaGVyZToNCj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L213YS9rZXJuZWwvLS90cmVlL3hlLXBhdC1pbmRleD9yZWZfdHlwZT1oZWFkcw0KPiANCj4gU2Vy
aWVzIGRpcmVjdGx5IGRlcGVuZHMgb24gdGhlIHBhdGNoZXMgaGVyZToNCj4gaHR0cHM6Ly9wYXRj
aHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xMjQyMjUvDQo+IA0KPiBHb2FsIGhlcmUgaXMg
dG8gYWxsb3cgdXNlcnNwYWNlIHRvIGRpcmVjdGx5IGNvbnRyb2wgdGhlIHBhdF9pbmRleCB3aGVu
IG1hcHBpbmcNCj4gbWVtb3J5IHZpYSB0aGUgcHBHVFQsIGluIGFkZHRpb24gdG8gdGhlIENQVSBj
YWNoaW5nIG1vZGUuIFRoaXMgaXMgdmVyeSBtdWNoDQo+IG5lZWRlZCBvbiBuZXdlciBpZ3B1IHBs
YXRmb3JtcyB3aGljaCBhbGxvdyBpbmNvaGVyZW50IEdUIGFjY2Vzcywgd2hlcmUgdGhlDQo+IGNo
b2ljZSBvdmVyIHRoZSBjYWNoZSBsZXZlbCBhbmQgZXhwZWN0ZWQgY29oZXJlbmN5IGlzIGJlc3Qg
bGVmdCB0byB1c2Vyc3BhY2UNCj4gZGVwZW5kaW5nIG9uIHRoZWlyIHVzZWNhc2UuICBJbiB0aGUg
ZnV0dXJlIHRoZXJlIG1heSBhbHNvIGJlIG90aGVyIHN0dWZmIGVuY29kZWQNCj4gaW4gdGhlIHBh
dF9pbmRleCwgc28gZ2l2aW5nIHVzZXJzcGFjZSBkaXJlY3QgY29udHJvbCB3aWxsIGFsc28gYmUg
bmVlZGVkIHRoZXJlLg0KPiANCj4gVG8gc3VwcG9ydCB0aGlzIHdlIGFkZGVkIG5ldyBnZW1fY3Jl
YXRlIHVBUEkgZm9yIHNlbGVjdGluZyB0aGUgQ1BVIGNhY2hlDQo+IG1vZGUgdG8gdXNlIGZvciBz
eXN0ZW0gbWVtb3J5LCBpbmNsdWRpbmcgdGhlIGV4cGVjdGVkIEdQVSBjb2hlcmVuY3kgbW9kZS4g
VGhlcmUNCj4gYXJlIHZhcmlvdXMgcmVzdHJpY3Rpb25zIGhlcmUgZm9yIHRoZSBzZWxlY3RlZCBj
b2hlcmVuY3kgbW9kZSBhbmQgY29tcGF0aWJsZSBDUFUNCj4gY2FjaGUgbW9kZXMuICBXaXRoIHRo
YXQgaW4gcGxhY2UgdGhlIGFjdHVhbCBwYXRfaW5kZXggY2FuIG5vdyBiZSBwcm92aWRlZCBhcw0K
PiBwYXJ0IG9mIHZtX2JpbmQuIFRoZSBvbmx5IHJlc3RyaWN0aW9uIGlzIHRoYXQgdGhlIGNvaGVy
ZW5jeSBtb2RlIG9mIHRoZQ0KPiBwYXRfaW5kZXggbXVzdCBiZSBhdCBsZWFzdCBhcyBjb2hlcmVu
dCBhcyB0aGUgZ2VtX2NyZWF0ZSBjb2hlcmVuY3kgbW9kZS4gVGhlcmUNCj4gYXJlIGFsc28gc29t
ZSBzcGVjaWFsIGNhc2VzIGxpa2Ugd2l0aCB1c2VycHRyIGFuZCBkbWEtYnVmLg0KPiANCj4gdjI6
DQo+ICAgLSBMb2FkcyBvZiBpbXByb3ZlbWVudHMvdHdlYWtzLiBNYWluIGNoYW5nZXMgYXJlIHRv
IG5vdyBhbGxvdw0KPiAgICAgZ2VtX2NyZWF0ZS5jb2hfbW9kZSA8PSBjb2hfbW9kZShwYXRfaW5k
ZXgpLCByYXRoZXIgdGhhbiBpdCBuZWVkaW5nIHRvIG1hdGNoDQo+ICAgICBleGFjdGx5LiBUaGlz
IHNpbXBsaWZpZXMgdGhlIGRtYS1idWYgcG9saWN5IGZyb20gdXNlcnNwYWNlIHBvdi4gQWxzbyB3
ZSBub3cNCj4gICAgIG9ubHkgY29uc2lkZXIgQ09IX05PTkUgYW5kIENPSF9BVF9MRUFTVF8xV0FZ
Lg0KPiB2MzoNCj4gICAtIFJlYmFzZS4gU3BsaXQgdGhlIHB0ZV9lbmNvZGUoKSByZWZhY3Rvcmlu
ZywgcGx1cyB2YXJpb3VzIHNtYWxsZXIgdHdlYWtzIGFuZA0KPiAgICAgZml4ZXMuDQo+IHY0Og0K
PiAgIC0gUmViYXNlIG9uIEx1Y2FzJyBuZXcgc2VyaWVzLg0KPiAgIC0gRHJvcCBVQyBjYWNoZSBt
b2RlLg0KPiAgIC0gcy9zbWVtX2NwdV9jYWNoaW5nL2NwdV9jYWNoaW5nLy4gSWRlYSBpcyB0byBt
YWtlIFZSQU0gV0MgZXhwbGljaXQgaW4gdGhlDQo+ICAgICB1YXBpLCBwbHVzIG1ha2UgaXQgbW9y
ZSBmdXR1cmUgcHJvb2YuDQo+IA0KDQpUaGFua3MgZm9yIHRoZSBzbWVtX2NwdV9jYWNoaW5nIHRv
IGNwdV9jYWNoaW5nIGNoYW5nZS4NCg0KVGhpcyBsYXRlc3QgdmVyc2lvbiBpcyBjYXVzaW5nIGEg
R3VDIGZ3IGxvYWQgZmFpbHVyZSBpbiBNVEwsIEkgaGF2ZSBiaXNlY3RlZCBhbmQgaXQgaXMgY2F1
c2VkIGJ5ICJkcm0veGU6IGRpcmVjdGx5IHVzZSBwYXRfaW5kZXggZm9yIHB0ZV9lbmNvZGUiLg0K
DQpbICAxNzMuOTk1MzA4XSB4ZSAwMDAwOjAwOjAyLjA6IFtkcm06eGVfZ3VjX2luaXQgW3hlXV0g
R3VDIHBhcmFtWzEyXSA9IDB4MDAwMDAwMDANClsgIDE3My45OTUzODhdIHhlIDAwMDA6MDA6MDIu
MDogW2RybTp4ZV9ndWNfaW5pdCBbeGVdXSBHdUMgcGFyYW1bMTNdID0gMHgwMDAwMDAwMA0KWyAg
MTczLjk5NTQ2N10geGUgMDAwMDowMDowMi4wOiBbZHJtOnhlX3dvcGNtX2luaXQgW3hlXV0gV09Q
Q006IDQwOTZLDQpbICAxNzMuOTk1NjA5XSB4ZSAwMDAwOjAwOjAyLjA6IFtkcm06eGVfd29wY21f
aW5pdCBbeGVdXSBHdUMgV09QQ00gaXMgYWxyZWFkeSBsb2NrZWQgWzIwNDhLLCA4MzJLKQ0KWyAg
MTc0LjIzNDY2N10geGUgMDAwMDowMDowMi4wOiBbZHJtXSBHdUMgbG9hZCBmYWlsZWQ6IHN0YXR1
cyA9IDB4ODAwMDcxMzQNClsgIDE3NC4yMzQ2ODFdIHhlIDAwMDA6MDA6MDIuMDogW2RybV0gR3VD
IGxvYWQgZmFpbGVkOiBzdGF0dXM6IFJlc2V0ID0gMCwgQm9vdFJPTSA9IDB4MUEsIFVLZXJuZWwg
PSAweDcxLCBNSUEgPSAweDAwLCBBdXRoID0gMHgwMg0KWyAgMTc0LjIzNDY5MF0geGUgMDAwMDow
MDowMi4wOiBbZHJtXSAweGNhYmJhOWU2IDB4ZGVhZGZlZWQgMHgwMDAwMDAwMCAweDAwMDAwMDc4
DQpbICAxNzQuMjM0Njk3XSB4ZSAwMDAwOjAwOjAyLjA6IFtkcm1dIDB4MDAwMTAwMDAgMHgwMDAw
MDAwMCAweDAwMDBmZmYwIDB4MDAwMDAwMDANClsgIDE3NC4yMzQ3MDNdIHhlIDAwMDA6MDA6MDIu
MDogW2RybV0gMHgwMDAwMDAwMiAweGNhYmJhOWU2IDB4ODA4NmRlYWQgMHgwMDAwMDAwMA0KWyAg
MTc0LjIzNDcwOV0geGUgMDAwMDowMDowMi4wOiBbZHJtXSAweDAwMDAwMDAwIDB4MDAwMDIwMDAg
MHgwMDAwMDAwMCAweDAwMDAyMDAwDQpbICAxNzQuMjM0NzE0XSB4ZSAwMDAwOjAwOjAyLjA6IFtk
cm1dIDB4MDAwMDAwMDAgMHgwMDAwMDAwMiAweGNhYmJhOWY2IDB4YmVlZmZlZWQNClsgIDE3NC4y
MzQ3MTldIHhlIDAwMDA6MDA6MDIuMDogW2RybV0gMHgwMDAwMDAwMCAweDAwMDAwMDAwIDB4MDAw
MDQwMDAgMHgwMDAwMDAwMA0KWyAgMTc0LjIzNDcyNF0geGUgMDAwMDowMDowMi4wOiBbZHJtXSAw
eDAwMDA0MDAwIDB4MDAwMDAwMDAgMHgwMDAwMDAwMiAweDgwODY5MDBkDQpbICAxNzQuMjM0NzMw
XSB4ZSAwMDAwOjAwOjAyLjA6IFtkcm1dIDB4MDAwMTAwMDAgMHgwMDAwMDAwNiAweDAwMDEwMDAx
IDB4MDA0NjA2MDYNClsgIDE3NC4yMzQ3MzVdIHhlIDAwMDA6MDA6MDIuMDogW2RybV0gMHgwMDAy
MDAwMSAweDAwMDA0MDUwIDB4MDAwMzAwMDEgMHgwMDAwNGIwMA0KWyAgMTc0LjIzNDc0MV0geGUg
MDAwMDowMDowMi4wOiBbZHJtXSAweDAwMDAwMDAwIDB4MDAwMDAwMDAgMHgwMDAwMDAwMCAweDAw
MDAwMDAwDQoNCg0KdUFQSSB3aXNlIGl0IG5lZWQgc29tZSByZW5hbWVzIHRvIGZvbGxvdyB3aXRo
IHRoZSB1QVBJIGFsaWdubWVudCBzZXJpZXMoaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Au
b3JnL3Nlcmllcy8xMjQyNzEvKSB0YWtlIGEgbG9vayBhdA0KaHR0cHM6Ly9wYXRjaHdvcmsuZnJl
ZWRlc2t0b3Aub3JnL3BhdGNoLzU1OTU3Ni8/c2VyaWVzPTEyNDI3MSZyZXY9MQ0KaHR0cHM6Ly9w
YXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzU1OTU3Ny8/c2VyaWVzPTEyNDI3MSZyZXY9
MQ0KDQoNCg==
