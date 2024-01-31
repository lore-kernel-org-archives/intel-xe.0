Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F14C47DB3
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 20:17:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C60AC10FCA6;
	Wed, 31 Jan 2024 20:17:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CCB210FCA6
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jan 2024 20:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706732219; x=1738268219;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=EC9ajulijrmegs21FSIqlcYrgEwlsog0wEXa1zYlCAc=;
 b=cYaPL8ivLHg/8BTfpdoTjUC5bJvC0SU36TP8r6YtciX7u04wUPBTo+Qc
 bAzdEQLzcUlbYWXElKWjBUIj8s3oHeJg5wZrHL4akFIt/NaOB7brs3T0/
 rii8bEe7dTEHNxf8VEcJiGG/JCeyosB0jPFKW1aLIsC4KiY4kjT9Nh/Mr
 2B0W3MnphpsCIMGgpGsFcPgjPGGGuh2fv5sSL6ncIyKL9JzyvwQgDlzjK
 tanACLx2PE1SqL2UiHG62Rv/aQpsUPxeCKQGH+CtPP6F1Ys7WkQ89iDjP
 7pnAKCIpllYbbLoznnMRumVbgmPLwqazSG0p+l+nFhfSnDEN4pasLb6f7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10472162"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="10472162"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 12:15:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="858928718"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="858928718"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2024 12:14:13 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 12:14:13 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 12:14:12 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 31 Jan 2024 12:14:12 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 31 Jan 2024 12:14:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=llDJxf5967tS63toPcb5mXmt0T4hqDMqjkXnO08f9OmG64RAqaOgTQjPsA+O6Kv+jVVabwFEHEj2MK4BGIBgymjGTHrSBN2y6o7If9G6i79KUCYIaJNGV9aeWcrBJ9MD5XchQ8CEMKwd0ilGz/mPe5g6TK+mTJT8RjRy7bqUZ+EtDw48KEqnqHofeHISyYjSxsxB2ai4cM+5gv5Cz46EtJYLP+m5nAer6FRZpRovn/vS6jZ+fLrbXHk4fLpYYNXXBDdPgARn7LgseZhZU9z6qDu7DWHwYD2IgYiD8wd3z9Ej3MlMZf0NPRLb/oAIvv0KX/S1Ns1FF1INeo5WN/p7BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EC9ajulijrmegs21FSIqlcYrgEwlsog0wEXa1zYlCAc=;
 b=e4b5js8elLEDQFBKWx+rY7rFFj3o3kxNFkSyK/qJRcJZvfZwOxprsIkyuiAcFpsz2LnszqjxoxTLcUMHgjv6jhhzxAbplWVX3Z6uPmXKQA2GILUoRfQE+5Kh3EOuBxmc3nzdup+DaRBG72p0IeIL582p/LaNJRKRXiv15gJs48IqvRm+lMjEmfE8vElO58HeJZOLg+ofrYO5uVTLPOYKWZ9pq7yoes3/dAWGz39Asai4fdulXraqYbyJyVUhpbImHOhDrxp1v+7DWZaakEyqfnj6NrdXBvUZztrrGCt3Sn3kUS5aPtwl68csuXRm6S35DOhi+4S2HD3DV1SZ8JwGjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MN2PR11MB4581.namprd11.prod.outlook.com (2603:10b6:208:26c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24; Wed, 31 Jan
 2024 20:14:10 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::cc1f:3742:ac61:448f]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::cc1f:3742:ac61:448f%7]) with mapi id 15.20.7249.024; Wed, 31 Jan 2024
 20:14:09 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Winiarski, Michal" <michal.winiarski@intel.com>, "Elbaz, Koby (Habana)"
 <kelbaz@habana.ai>
Subject: Re: [PATCH v6 1/2] drm/xe: add a new debugfs file - mmio
Thread-Topic: [PATCH v6 1/2] drm/xe: add a new debugfs file - mmio
Thread-Index: AQHaVIA/NQqtyU2P70miZwchrhimP7D0WxWA
Date: Wed, 31 Jan 2024 20:14:09 +0000
Message-ID: <41d1faeb0cc7e8a0ffe9f3258c22ca3ef566ea34.camel@intel.com>
References: <20240131195953.852641-1-kelbaz@habana.ai>
In-Reply-To: <20240131195953.852641-1-kelbaz@habana.ai>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MN2PR11MB4581:EE_
x-ms-office365-filtering-correlation-id: d3f43da9-8cdd-410f-2260-08dc22992f3b
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Gw994VQMeOYFrmkmFw6uLH6D+vFqrOIR3fu7zyprgRiwgoahmlNNHqS5iEa8HKHiFOurk0wMUvkDU9m03Jgu4bXEZcZ3z2XU0r7QRqTmCv3i3CUJFgA8jQdnf1TEFSHIeKtXXjA6qhaLmhuN9KWOpExviZM4wtcwZkcFpvaWmRBz1MO9HwzxUdjKh2/FsyYIgT5mpw9pIj8+1J6EJlsVpdnGmkNkmpfVJhVNF8wm2XEnssPQJPvLYqjdEAaEDNsIb49/SPaXFJXpQt6bssoTVGWgwX6lMecJa4kKlpcq4qOPWBMNOSLKVVWCuhNrlQyYk3zttxjnUnWrIWQHvrzKXtlRht+tok1ljQKliBSFjVxehB7KFhNwtK/hD2/QJR6tjbApAb5F/GX11uYO3CQQBK9JY6SRO+jVknwnVEsFqRHSyZAbCWrAbLUnkHTK+HTIVhF/pMxYKKmnOafCc5NwPuw+741ChUlkoIooQJumuGJirmrkJq5Iz2FWVFdp9OFi5uqVMsEwxAK0o60yn8SkHnnnnVNEAKmy6tRvoYGJocWrUpMC2oI0Tt31T/Xawa72IW60bbe64nB6QcmVwmkbIgm6qhhlN3FGbujEEaJkOPgsYXnnIQieoTzJ4d5nOP1/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(136003)(376002)(396003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(83380400001)(41300700001)(82960400001)(36756003)(86362001)(38070700009)(122000001)(6506007)(38100700002)(2616005)(26005)(6512007)(8676002)(66946007)(478600001)(6486002)(2906002)(316002)(110136005)(76116006)(66556008)(66476007)(66446008)(64756008)(5660300002)(4326008)(71200400001)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bnV3L0t1TzlFUlpyTitDWC9hTXRzVWtSa1RSMGpWdGtxR3NJNFlTbFM5VEFl?=
 =?utf-8?B?YUhLUklVSHg5QThZTzBMRXJNZFU3NDUxTy90dGxKQmR3dmdaQTllTkJER2Zk?=
 =?utf-8?B?YzVqa2VOdTRLZFJJQzUxY3dQTTJPOG15UWNUbU9WeVIxQ0g1Sk13VG1CS0Fm?=
 =?utf-8?B?K1crOXBwN0hBV21RT0tqaFVyMllwcXpzUlB6V3pTMVBPVld1WnV5Q0h2Qy81?=
 =?utf-8?B?ajB4T0krUGNjOUtQL2kxWVNyUnA3OWtmSmEwS290Y3dpVWZUNHBwa0VmTnF3?=
 =?utf-8?B?T2dZZTR6QWdjN3NjYlRWMW9jME9hYnhBbDdJamVLejFQcTRUYzQyOGRPQ3Ji?=
 =?utf-8?B?dVZZaXdNcTZVUDJ3K0VVU3pia1ozemx5bXdHUmhRUEtxN25yM1BEdk5NVWtS?=
 =?utf-8?B?MmMxamw3eVNYVjdlTmtMU3BvT054WmJzazBtUVJqTmx5UXhjYmZWbTdnU2Fi?=
 =?utf-8?B?Q01HdmdaSXcydFphelJiYk5EdEpyYVVxUkFyU2kyWFlURGFVaC9UbEtGKzdJ?=
 =?utf-8?B?U0pCSnNMN2xyaitERFZmRVJTaDN1R3N6a1JDZW5uMzdnMjNYUnV3WDJZMnlQ?=
 =?utf-8?B?d2YySzBPM1ZabmZPaW54bnVaUUE1Rk1Pc2xwWWxqQkNzTFlyWlR6QTZXMW5x?=
 =?utf-8?B?L2tvWnZIUmFIY0tRZ3puUTVNOVRuTktaVmwvWHV0RUNMak1BRkZWeGh3MXNK?=
 =?utf-8?B?UVpPcmd3YzNBU2owMmJFaElIOWNPVWtmYnpDdFFFcTlNRkExbTkwOFRCLzJJ?=
 =?utf-8?B?WHdaQzI4dklhQjZycVZjQnA5QTA1WGdHZnBYQVlVc2dHZGVjazgxZzhvdFNF?=
 =?utf-8?B?dWlvTlZ5d1pyUUV1cENveWtCUzIzVHdiVlNnMnlQZFRDalhSY3VDVjN4S1dp?=
 =?utf-8?B?aXNDR0tyYnMyZFBFVVRXZ0kwZkQ0MUVsYXpPR1Y3NG45cjFtY2pQd3BUdUJO?=
 =?utf-8?B?NXNkYjVPVTBPVmZaNXFZU2pBcVZuNmpxWlZmK3lSdEJDL2M4d3JaWWJNS29n?=
 =?utf-8?B?V1FLNEVaZTl1ZjdLZUVRUUEzSFEyb1c3SlZXNERFOEYxK3NFWm1hVWlaa2o3?=
 =?utf-8?B?TUVoeGR2VFdxTEtwMEEwTUw1VzhrS1NZWEs2MElzWG1mNk5GQkxVRjJkNSt4?=
 =?utf-8?B?K3F4MjR4N05qQUZ2NTYzZzd6cXBUdDgxdGx6d0dnK3ZRekw3RzFwZ0tBQ0FI?=
 =?utf-8?B?Uk9DYXpKd1FGd2w5dnpPTFhtcUtmRWRKeG1sL24xS2xQeCs1WWJSbzlFNmlT?=
 =?utf-8?B?TCtROFVDb1ErZHF4dVlTajVrRVgxOUlkTW5ZMFg0WUI3dlBENUs2VXJVcDFB?=
 =?utf-8?B?Q2lseUloQ3ZLN3F1L0VWK2hRN0RvbWkrZ3hYMU9ZMlQvdzJkNE5ScDhxRXR0?=
 =?utf-8?B?Zk84T2I5ZWNwL1hOODdvd05pSWRJbGEzWlczVDJlUlBLdWhWT2dLREcwd1Rk?=
 =?utf-8?B?cEpHb3dkNVJtMk5sUk5mNFE3Smp6ZEFBMHlhdTAyUzhhTXFaMUk1aXkrMUNp?=
 =?utf-8?B?Rk53SGpCbEYybWpkSWExM2lyQlk3bENtQzNiWlJLVk42ditOMjkzR3U2YktK?=
 =?utf-8?B?NS9paTdVVWZ2OEdIem9SVTlnSlFnY0R3RHRDaTdLcDVhUDBORnZ4NjVnR0V0?=
 =?utf-8?B?dllQMlJhbldnTHBhNVZEa0gvbmdWVnBWOGg0MTFqTFRyRlRyY3YzZS9USnFM?=
 =?utf-8?B?aTB5WHlEeUxqbmpqVzJqNXdmNUl5ZVVrMHI4Y1ZNc1A1SzJJNTVpSnk1S240?=
 =?utf-8?B?bWJnZkh3d3I2YWFvS1BsODZ1b0tjL3FPV1B1cytyN1dnZlN5Wk5CZndQV0Zx?=
 =?utf-8?B?d3d3RDhULzRmdnJpMmZPRXAxZG5qVEh6WVBJOUNYMkYxdGlyOUNkaStDaTBP?=
 =?utf-8?B?elI2Tk4waWFLRFEzN0kraElESmNYU0hwQlV5S3FxVUdSTUZoaFNuMmluMUR5?=
 =?utf-8?B?dHpvOGkvcnRua1Z3Zi9IL1A2clJLcDVhWGVtN0ZPTmNma0VrS3dhTENTLzZG?=
 =?utf-8?B?Njh1WUdoYk9NMHJvNmdwTmpoTGNJS2tTUUZ6eXhVUnZ4Uk1yc0NxSzQvbC9u?=
 =?utf-8?B?YlE4NGR3Y3BZMEpWdHlvZVNmdk9oQUUwUDNJSy9wdGgvYVBTWlBDQU5mTnJl?=
 =?utf-8?B?OGVZaE1KQlg3TlVuTVAwai83cjBWblF0ZjRHRHhYSkd0ci9ENXpDOVlDQnhI?=
 =?utf-8?B?SHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <427E7AECE3039045B03C482DC13E0A6A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3f43da9-8cdd-410f-2260-08dc22992f3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2024 20:14:09.6910 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XTxsKbmhJ2tvrHLDtx/KuUuvm8qI1OGmocnKuooOgBmBKO7H5rsnDPKpYtNvdZawBFnB0XEqlsSfdsOa+ONe1gwIyL9qgd4C3/BtVZ4laAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4581
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDI0LTAxLTMxIGF0IDIxOjU5ICswMjAwLCBLb2J5IEVsYmF6IHdyb3RlOg0KPiBO
b3cgdGhhdCB0aGUgZm9ybWVyIG1taW8gaGFuZGxlcnMgYXJlIGZ1bGx5IHJlbW92ZWQsIHRoaXMN
Cj4gZGVidWdmcyBmaWxlIHdpbGwgYmUgdXNlZCBmb3IgbW1pbyBhY2Nlc3MgKHJlYWQvd3JpdGUp
DQo+IHRocm91Z2ggdGhlIGRlYnVnZnMgaW9jdGwgZmlsZSBvcGVyYXRpb24uDQoNClNvcnJ5IEkg
ZG9uJ3Qga25vdyB0aGUgaGlzdG9yeSBoZXJlIG9mIHYwLXY1LCBidXQgb25lIHF1ZXN0aW9uLCB3
aXRoDQppZ3QtZ3B1LXRvb2xzL3Rvb2xzL2ludGVsX3JlZyB3ZSBjYW4gcmVhZCBhbmQgd3JpdGUg
TU1JTyByZWdpc3RlcnMNCndpdGhvdXQgbmVlZGluZyB0byBoYXZlIHRoZSBkcml2ZXIgbG9hZGVk
IGF0IGFsbCAoaS5lLiBzdHJhaWdodCB0aHJvdWdoDQp0aGUgQkFScykuIFdoeSBkbyB3ZSB3YW50
IHRvIGFsc28gcHV0IHRoaXMgY2FwYWJpbGl0eSBpbiB0aGUgeGUgZGVidWdmcw0KdGhlbj8NCg0K
VGhhbmtzLA0KU3R1YXJ0DQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEtvYnkgRWxiYXogPGtlbGJh
ekBoYWJhbmEuYWk+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZWJ1Z2ZzLmMg
fCAxMiArKysrKysrKysrKysNCj4gwqAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZWJ1Z2ZzLmMNCj4gYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZGVidWdmcy5jDQo+IGluZGV4IDAxZGI1YjI3YmVjNS4uMjFi
MjI1N2FhM2E4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGVidWdmcy5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZWJ1Z2ZzLmMNCj4gQEAgLTk4LDEyICs5
OCwyMiBAQCBzdGF0aWMgaW50IGZvcmNld2FrZV9yZWxlYXNlKHN0cnVjdCBpbm9kZSAqaW5vZGUs
DQo+IHN0cnVjdCBmaWxlICpmaWxlKQ0KPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7DQo+IMKg
fQ0KPiDCoA0KPiArc3RhdGljIGxvbmcgeGVfZGVidWdmc19tbWlvX2lvY3RsKHN0cnVjdCBmaWxl
ICpmLCB1bnNpZ25lZCBpbnQgY21kLA0KPiB1bnNpZ25lZCBsb25nIGFyZykNCj4gK3sNCj4gK8Kg
wqDCoMKgwqDCoMKgcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4gwqBzdGF0aWMgY29uc3Qgc3RydWN0
IGZpbGVfb3BlcmF0aW9ucyBmb3JjZXdha2VfYWxsX2ZvcHMgPSB7DQo+IMKgwqDCoMKgwqDCoMKg
wqAub3duZXIgPSBUSElTX01PRFVMRSwNCj4gwqDCoMKgwqDCoMKgwqDCoC5vcGVuID0gZm9yY2V3
YWtlX29wZW4sDQo+IMKgwqDCoMKgwqDCoMKgwqAucmVsZWFzZSA9IGZvcmNld2FrZV9yZWxlYXNl
LA0KPiDCoH07DQo+IMKgDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyBt
bWlvX2ZvcHMgPSB7DQo+ICvCoMKgwqDCoMKgwqDCoC5vd25lciA9IFRISVNfTU9EVUxFLA0KPiAr
wqDCoMKgwqDCoMKgwqAudW5sb2NrZWRfaW9jdGwgPSB4ZV9kZWJ1Z2ZzX21taW9faW9jdGwsDQo+
ICt9Ow0KPiArDQo+IMKgdm9pZCB4ZV9kZWJ1Z2ZzX3JlZ2lzdGVyKHN0cnVjdCB4ZV9kZXZpY2Ug
KnhlKQ0KPiDCoHsNCj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB0dG1fZGV2aWNlICpiZGV2ID0g
JnhlLT50dG07DQo+IEBAIC0xNDIsNiArMTUyLDggQEAgdm9pZCB4ZV9kZWJ1Z2ZzX3JlZ2lzdGVy
KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPiDCoMKgwqDCoMKgwqDCoMKgZm9yX2VhY2hfZ3QoZ3Qs
IHhlLCBpZCkNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9ndF9kZWJ1Z2Zz
X3JlZ2lzdGVyKGd0KTsNCj4gwqANCj4gK8KgwqDCoMKgwqDCoMKgZGVidWdmc19jcmVhdGVfZmls
ZSgibW1pbyIsIDA2NDQsIHJvb3QsIHhlLCAmbW1pb19mb3BzKTsNCj4gKw0KPiDCoCNpZmRlZiBD
T05GSUdfRkFVTFRfSU5KRUNUSU9ODQo+IMKgwqDCoMKgwqDCoMKgwqBmYXVsdF9jcmVhdGVfZGVi
dWdmc19hdHRyKCJmYWlsX2d0X3Jlc2V0Iiwgcm9vdCwNCj4gJmd0X3Jlc2V0X2ZhaWx1cmUpOw0K
PiDCoCNlbmRpZg0KDQo=
