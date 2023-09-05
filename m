Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBC4CA1008
	for <intel-xe@archiver.kernel.org>; Tue,  5 Sep 2023 20:50:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B8DB10E507;
	Tue,  5 Sep 2023 20:50:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2916610E507
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Sep 2023 20:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693947054; x=1725483054;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=iAebnB/hCJ5HhhMXWXw7DFSLvpvt03PW2Achg7leO3k=;
 b=AdPjyuvP2hm4qHJHusVo72e/PvuknDwidJJWLN7b5R3/a7Ap90fD0oWB
 sWDeFqX69CaUZnuxhkPQVYsCFPsvwppDMetc2QxD4zc1YZCNbH3CXph7m
 HYsTkYZw+v7QTuUWxRFYlvmKvPOLxpYQIMrBwo8eUlJoFObP57v2WZnmc
 4TokQBNWBvd1GqdicBkBmVAulprialQ2GajXzkSmZEkJXNa3M8iPO/Yui
 V7VeRHu5jfqxs9XcDmeaYIcsSoxofVpoRAZ3NoWm3Ly0zcqnFJ6x8BKRK
 K6wNTde4grJ9uDC3gaU2XjJmHbHNeJAwO7nE8Escd9KNRY4xyAGuZfsLO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="376816832"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; d="scan'208";a="376816832"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 13:50:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="884448681"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; d="scan'208";a="884448681"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2023 13:50:44 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 5 Sep 2023 13:50:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 5 Sep 2023 13:50:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 5 Sep 2023 13:50:52 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 5 Sep 2023 13:50:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iLfbxCKZx7fGpygzcKyieB36fxmPX5pytrMxey2plIvQREJcj+HlaLS97tVfVNI1St500IxfCEMo4SsVjDC/165Vz2Ag8KOhiJlQTPrS4GyUFyPmtl8bDCi8kjjt0oB6O4WCjJjCkhN4LuAX3Visf6Wjl2/hitiOlmbSrxpTwB6cOtQkGruAiZ2GDK8VsHI2KiV3aih2a8JCiJbLrytTUxEJyU8lDMw8WmiGxKuMc0+VKTYOA/40Z6KL3mnZpGTf3UZURf6N8lW18cfo0tiDilZOEDjMyrbBY1+LBmyNGyCUl7zqVKFSPc8n6GmrpNuS6fevHl2xW61UHehj/kB7qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iAebnB/hCJ5HhhMXWXw7DFSLvpvt03PW2Achg7leO3k=;
 b=mJNzD9vdw/owafXxbotmLp0LK65xF4CVIaPLHZCZ36yT92R16EkDpt96s1EjeLS9JeB2k0XBnHhux72vUUm4XBsNsJ32TSaXcpvLcsgUU41x8oo9rO0Un3dfxonB4JFlIbDZXuHU2/GIcSRs4ufsI4cxrOt9muvClDZe25xP1U3mXqewm/jJCL2nM41FK54ARjaO7/IxTfiWcObCgReRPorjiMR4ZvylJ0elxQmRZbGzlAdnnrpoQ5mxYKqMn5DwEGbA0PJM8SnhT98pMPfDJgc7MC/yWUKS0ebKdjRK9VHY5k5lgmEI9wsWf+joDdWFi1gW6LKFXxNtMOe0MKBgMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by MW6PR11MB8312.namprd11.prod.outlook.com (2603:10b6:303:242::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Tue, 5 Sep
 2023 20:50:50 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8e21:274a:64d1:5de]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8e21:274a:64d1:5de%4]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 20:50:49 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
Thread-Topic: [Intel-xe] [RFC 3/5] drm/xe: move pat_table into device info
Thread-Index: AQHZ2pcJ6lTnRpD4E0KNh5GTKUZH9rAMwByA
Date: Tue, 5 Sep 2023 20:50:49 +0000
Message-ID: <fd6f9e71374934e83cef3342245f6d8e7a85511f.camel@intel.com>
References: <20230829162840.73444-7-matthew.auld@intel.com>
 <20230829162840.73444-10-matthew.auld@intel.com>
In-Reply-To: <20230829162840.73444-10-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|MW6PR11MB8312:EE_
x-ms-office365-filtering-correlation-id: 3df9fce4-7899-4566-5faf-08dbae51c97f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RXspHSfZCzhalU4Fzhydj3AEcxyXitSf7NCd2Z8PSK+Pm0C/aQmnfCMpD78oHuYkOU6A8ZiIhOcsq9DnEiGknuivDo+dnBRAhRFK8swvRGgPLZrt9Arf8BL1pdSHr2jtUL7hLR9B0Xeb3CbeFPNRFXJ3sCmmoSZn3gda1h0anB49HvCy/d0qPZ/duj/PfKIGvQWjPWPj/c0srL4vQu9lTymtWdPShYOZuOCl8MAMs8OBASdQhstXdO7TgrejmLpRHn222crJ/xr1ECiDgDlgspcQEn2XSayROuNGNesGUnssEzwWxuLh7QbevNEGb6N9VNKbTRblBIsA4ojxLDBSTSNk1DLOvIUOxa8Twj4wDiBclbBXj6gjwD5YAq8zrbF3QLfFRxhBQqQ4ksRoiQM5QaXlfWpGWbXBn+BMn2Jv4dz39AlzEmPxXhJIuLIHFcGurgY13qdkewdxeVlA8nLQhjGjjC1lghcIuHs2fRWYeeGqrFnTEjz+EUnmjEMQo1S8iThZjDNeVsD9wk6EcbCo9LU7ad3V8e4bA76ZByXhCniVIN8Zq9//F1AjG6TjwsZMgcLm18/X3bkTGQiRRntuq1wVeDWXOwC7AyC/+QoPtDaocRe4Rk0UW6vyo1bwv4f4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(366004)(346002)(39860400002)(451199024)(1800799009)(186009)(8676002)(4326008)(26005)(8936002)(71200400001)(83380400001)(2616005)(107886003)(5660300002)(6486002)(41300700001)(6506007)(110136005)(54906003)(66446008)(64756008)(66476007)(66946007)(66556008)(38100700002)(82960400001)(6512007)(316002)(38070700005)(6636002)(86362001)(478600001)(91956017)(76116006)(36756003)(2906002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RCtkRE1vdGV5cWl4Y1pGNi83QkN3N3BNS1E4bWZ0SVlDcE9mVVQrVGdLZzZm?=
 =?utf-8?B?dkZuZXJmNTBhNU1Nd0VQWlhOWkNaVXRXVmtxeXM3VEhZdkoyOFJtdnlyT1Bk?=
 =?utf-8?B?Z0ZjL0tBL0VQaEJoUFI4N0sraFVWNGtTc2t4bmZzZmVibVp6d2d6K2t2RTh1?=
 =?utf-8?B?ZzlsQnRPS2l0SWllRStEZS9kVnJWaVNGWWZOVTQ2c3AreGtqWHpKZE5GNGNK?=
 =?utf-8?B?YjJlS01ZMzNFSkVEU2hqK1U3RHdMbDRFeVhuR1RWaFFRZ3ZCT2lWSW5xL3E2?=
 =?utf-8?B?NEYxQkZxbjVJaGdxcUdYeWJWbytjTC9yQ2x3RC9tVGNDR0ZzM2NNODFsRlMw?=
 =?utf-8?B?MXZHMFBuZmlhVUFpREtaZjI4YXhBRDY5dVJJeGo2NGxaWlExZDRpZWprK2VC?=
 =?utf-8?B?dVBWQktsOGRNdGZjNDA5K0JFb0MzSmhKNUU0NkFSLzZ6NjErWFVMeUIyRXF6?=
 =?utf-8?B?S0xaSWtvSDhMN01TMktOVm5neVBFU200ai9lVU5BdFBmVkcwbjNhRldQZGJj?=
 =?utf-8?B?ZjU4UXVTWWJscm1pUDRHRkRaS0JPcTRoelp0ZUxzYlZsTWdhdkVtbmZsdU1W?=
 =?utf-8?B?c0F4dm03Q0FqN2V1QzZ5WUNZTWRVS3p6dThXN3QwaWgwSmcxNHE4c0tTQWVq?=
 =?utf-8?B?TEg2LzM2Z3ZjVVo1YzZITVNiNWpLNEZuZlF5Y2Nyb0ZwZmhmMjRjRkFkMFVM?=
 =?utf-8?B?NkxFZ3FWdExINC9uYXdNeTJZWGttcUZQZUp5T1JQZHhLU2NvNEl2L0VRREtn?=
 =?utf-8?B?OGZiZUsyVllVZElEZDBoMHRIL1Z2bDBoQWNBYXVKcmxhd2U3amdlTnFIQlEv?=
 =?utf-8?B?ZlBYb0pXTTVPZkREcE1mMCtWM2ZWSlRkRlN5b2xvWnlHSkNUTTgrMkJ1R1l0?=
 =?utf-8?B?WGhYVWltZ2VRY0dHSmhjQkd4bjRXV3h1VnI0U2ZKbW45aTJESktNcUlGbWNj?=
 =?utf-8?B?ODNRdVNFTTFnb0k1ZnBQM1pncTErc083UlJlcDNHYUVQSzNGdi82WlA2V2hj?=
 =?utf-8?B?M3dsV3RFVmdmeERmQjlGeUIxcW5NSVcrb1dtZHJ6ZEVMRlgzalY2eHJ4cWl0?=
 =?utf-8?B?ZENTcTN2M0RxMzYxUVppcVFHTzZWVjBhQlFob01BMDNPZS9tV2lOeTZkcm16?=
 =?utf-8?B?MWhaVnlYWFJCSlUwbEpGT01rRkFDL01xcVVNZXM3bDdsdDZ3dWlhaDJ6eU0v?=
 =?utf-8?B?REg5NjVraW1ybFc2R3V6SitSU0g5UjNoZzNVVExNM0Vkd3RhYW1DbTl2SHVH?=
 =?utf-8?B?M3VmY01NVzg4TW1zd0Jqd1FWeDAzcWd6ajJKYVJ5MVVrLzlSNGlBbVZNaVRR?=
 =?utf-8?B?SlJFNytaV3BxODgwaXZIWUFtajZkcE1xazZHbjNFeW1kSDF1R0pSUEJsMHNE?=
 =?utf-8?B?VlBlVFE2RkpBNEJsR1NSelBoV3QxK1gzN0hmZ1RodUd6SW1LUmxvRUptMmxl?=
 =?utf-8?B?Q2JzUGRnL2I3dkFwR2tpY2ZoYjNNSXhVM2RqSFRNZ0pVaDJUUWtCa2hFYkd0?=
 =?utf-8?B?Z3VMQTA3UGU0WCtPYWJkS1VWekVFenZ5cmxDRkdyR1RaNWVqTGxuUEd1cVRv?=
 =?utf-8?B?ejRZYmpld2h2R1NCWkQwR0FqSWpleWtBdjRPcEZSVldMeGhUcFpOcVJVb2ZG?=
 =?utf-8?B?N0pNMFBueXBSL2dVWVErWE9pdnE2eG52U2hPcFFQbWkreTJCNzg3ZldhVjRs?=
 =?utf-8?B?Z2lNclBtQXpUZVZ5bDVoWitialFHdTJNZlUwbThUcERDNFpDMDB3dWNXZDFt?=
 =?utf-8?B?M1RoZlNQYVVYTERmNXZMdjVjZHM4ZnpBeDZPanlkSy9kS2l6bFdScFNmNjVs?=
 =?utf-8?B?QUdHTlBTYVdidm4rTzIwTDMwVU5uQkFENHN6SC81dmM2SitYR08wN3d1MUlk?=
 =?utf-8?B?V0VxQXh0aG9RbVRrTXZMaXFIVmZ3R3pzeEtWRGVFWjdVYVliempNLzNDL09K?=
 =?utf-8?B?S3NyOU95T3BBRVZtRGFXSU1NTWlUZHk3WEJ1SlpGRE9sQ0JpTjZsSFhISG03?=
 =?utf-8?B?bnVOTEZ4cVljbzh3QllISjcrVHVsekpQcCtYbmNTZW5yTTRuMnhvU3Z6cytj?=
 =?utf-8?B?N0d0QllWbmZoWVVQOEordGltZDZYRHJ1TE1Icm1XdUlvcEhrUGNPaFI3WFc3?=
 =?utf-8?B?RHRabFdmUktTQkhSVFlweDVJL3paZG9mZ0RucnRLVTdPNUZVbk5TK2Qrakhr?=
 =?utf-8?B?U0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <405B88305884F5408864B2B8C057EAB4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3df9fce4-7899-4566-5faf-08dbae51c97f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2023 20:50:49.8641 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: deqrP4/Ln+6QZEvSUhnWxNyt/4yczoITWiJY9dWc7KwRbpkYyDdGSCYgt4DQx3nO+vHmL7RaxVYBbkGyaj7yqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8312
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 3/5] drm/xe: move pat_table into device info
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTA4LTI5IGF0IDE3OjI4ICswMTAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+
IFdlIG5lZWQgdG8gYWJsZSB0byBrbm93IHRoZSBtYXggcGF0X2luZGV4IHJhbmdlIGZvciBhIGdp
dmVuIHBsYXRmb3JtLCBhcw0KPiB3ZWxsIGJlaW5nIGFibGUgdG8gbG9va3VwIHRoZSBwYXRfaW5k
ZXggZm9yIGEgZ2l2ZW4gcGxhdGZvcm0gaW4gdXBjb21pbmcNCj4gdm1fYmluZCB1YXBpLCB3aGVy
ZSB1c2Vyc3BhY2UgY2FuIGRpcmVjdGx5IHByb3ZpZGUgdGhlIHBhdF9pbmRleC4gTW92ZQ0KPiB0
aGUgcGxhdGZvcm0gZGVmaW5pdGlvbiBvZiB0aGUgcGF0X3RhYmxlIGludG8gdGhlIGRldmljZSBp
bmZvIHdpdGggdGhlDQo+IGlkZWEgb2YgZW5jb2RpbmcgbW9yZSBpbmZvcm1hdGlvbiBhYm91dCBl
YWNoIHBhdF9pbmRleCBpbiBhIGZ1dHVyZQ0KPiBwYXRjaC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IE1hdHRoZXcgQXVsZCA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gQ2M6IFBhbGxhdmkgTWlz
aHJhIDxwYWxsYXZpLm1pc2hyYUBpbnRlbC5jb20+DQo+IENjOiBMdWNhcyBEZSBNYXJjaGkgPGx1
Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gQ2M6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3Bl
ckBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBl
cy5oIHwgIDMgKysrDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcGF0LmMgICAgICAgICAgfCAz
OSArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVf
cGF0LmggICAgICAgICAgfCAgMyArKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYyAg
ICAgICAgICB8ICA2ICsrKysrDQo+ICA0IGZpbGVzIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyks
IDE1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9kZXZpY2VfdHlwZXMuaCBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0K
PiBpbmRleCA1MDM3YjhjMTgwYjguLjA2MjM1ZGE2NDdiYiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPiBAQCAtMjM4LDYgKzIzOCw5IEBAIHN0cnVjdCB4ZV9kZXZp
Y2Ugew0KPiAgCQkvKiogQGVuYWJsZV9kaXNwbGF5OiBkaXNwbGF5IGVuYWJsZWQgKi8NCj4gIAkJ
dTggZW5hYmxlX2Rpc3BsYXk6MTsNCj4gIA0KPiArCQljb25zdCB1MzIgKnBhdF90YWJsZTsNCj4g
KwkJaW50IHBhdF90YWJsZV9uX2VudHJpZXM7DQo+ICsNCj4gICNpZiBJU19FTkFCTEVEKENPTkZJ
R19EUk1fWEVfRElTUExBWSkNCj4gIAkJY29uc3Qgc3RydWN0IGludGVsX2Rpc3BsYXlfZGV2aWNl
X2luZm8gKmRpc3BsYXk7DQo+ICAJCXN0cnVjdCBpbnRlbF9kaXNwbGF5X3J1bnRpbWVfaW5mbyBk
aXNwbGF5X3J1bnRpbWU7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGF0
LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGF0LmMNCj4gaW5kZXggYTQ2ODY1NWRiOTU2Li5m
MTlmNWQ4ZGNkOTQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wYXQuYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGF0LmMNCj4gQEAgLTEwNiwyNCArMTA2LDE3
IEBAIHN0YXRpYyB2b2lkIHByb2dyYW1fcGF0X21jcihzdHJ1Y3QgeGVfZ3QgKmd0LCBjb25zdCB1
MzIgdGFibGVbXSwgaW50IG5fZW50cmllcykNCj4gIAl9DQo+ICB9DQo+ICANCj4gLXZvaWQgeGVf
cGF0X2luaXQoc3RydWN0IHhlX2d0ICpndCkNCj4gK2ludCB4ZV9wYXRfZmlsbF9pbmZvKHN0cnVj
dCB4ZV9kZXZpY2UgKnhlKQ0KPiAgew0KPiAtCXN0cnVjdCB4ZV9kZXZpY2UgKnhlID0gZ3RfdG9f
eGUoZ3QpOw0KPiAtDQo+ICAJaWYgKHhlLT5pbmZvLnBsYXRmb3JtID09IFhFX01FVEVPUkxBS0Up
IHsNCj4gLQkJLyoNCj4gLQkJICogU0FNZWRpYSByZWdpc3RlciBvZmZzZXRzIGFyZSBhZGp1c3Rl
ZCBieSB0aGUgd3JpdGUgbWV0aG9kcw0KPiAtCQkgKiBhbmQgdGhleSB0YXJnZXQgcmVnaXN0ZXJz
IHRoYXQgYXJlIG5vdCBNQ1IsIHdoaWxlIGZvciBub3JtYWwNCj4gLQkJICogR1QgdGhleSBhcmUg
TUNSDQo+IC0JCSAqLw0KPiAtCQlpZiAoeGVfZ3RfaXNfbWVkaWFfdHlwZShndCkpDQo+IC0JCQlw
cm9ncmFtX3BhdChndCwgbXRsX3BhdF90YWJsZSwgQVJSQVlfU0laRShtdGxfcGF0X3RhYmxlKSk7
DQo+IC0JCWVsc2UNCj4gLQkJCXByb2dyYW1fcGF0X21jcihndCwgbXRsX3BhdF90YWJsZSwgQVJS
QVlfU0laRShtdGxfcGF0X3RhYmxlKSk7DQo+ICsJCXhlLT5pbmZvLnBhdF90YWJsZSA9IG10bF9w
YXRfdGFibGU7DQo+ICsJCXhlLT5pbmZvLnBhdF90YWJsZV9uX2VudHJpZXMgPSBBUlJBWV9TSVpF
KG10bF9wYXRfdGFibGUpOw0KPiAgCX0gZWxzZSBpZiAoeGUtPmluZm8ucGxhdGZvcm0gPT0gWEVf
UFZDIHx8IHhlLT5pbmZvLnBsYXRmb3JtID09IFhFX0RHMikgew0KPiAtCQlwcm9ncmFtX3BhdF9t
Y3IoZ3QsIHB2Y19wYXRfdGFibGUsIEFSUkFZX1NJWkUocHZjX3BhdF90YWJsZSkpOw0KPiArCQl4
ZS0+aW5mby5wYXRfdGFibGUgPSBwdmNfcGF0X3RhYmxlOw0KPiArCQl4ZS0+aW5mby5wYXRfdGFi
bGVfbl9lbnRyaWVzID0gQVJSQVlfU0laRShwdmNfcGF0X3RhYmxlKTsNCg0KSSBndWVzcyBERzIg
c2hvdWxkIHVzZSBQVkMgZW50cmllcyB3aXRoIENMT1MwPw0KDQpXaGF0IGFib3V0IERHMT8gVEdM
IHRhYmxlIGlzIGJhc2VkIGFyb3VuZCBMTEMuDQoNCj4gIAl9IGVsc2UgaWYgKEdSQVBISUNTX1ZF
UngxMDAoeGUpIDw9IDEyMTApIHsNCj4gLQkJcHJvZ3JhbV9wYXQoZ3QsIHRnbF9wYXRfdGFibGUs
IEFSUkFZX1NJWkUodGdsX3BhdF90YWJsZSkpOw0KPiArCQl4ZS0+aW5mby5wYXRfdGFibGUgPSB0
Z2xfcGF0X3RhYmxlOw0KPiArCQl4ZS0+aW5mby5wYXRfdGFibGVfbl9lbnRyaWVzID0gQVJSQVlf
U0laRSh0Z2xfcGF0X3RhYmxlKTsNCj4gIAl9IGVsc2Ugew0KPiAgCQkvKg0KPiAgCQkgKiBHb2lu
ZyBmb3J3YXJkIHdlIGV4cGVjdCB0byBuZWVkIG5ldyBQQVQgc2V0dGluZ3MgZm9yIG1vc3QNCj4g
QEAgLTEzNSw3ICsxMjgsMjUgQEAgdm9pZCB4ZV9wYXRfaW5pdChzdHJ1Y3QgeGVfZ3QgKmd0KQ0K
PiAgCQkgKi8NCj4gIAkJZHJtX2VycigmeGUtPmRybSwgIk1pc3NpbmcgUEFUIHRhYmxlIGZvciBw
bGF0Zm9ybSB3aXRoIGdyYXBoaWNzIHZlcnNpb24gJWQuJTJkIVxuIiwNCj4gIAkJCUdSQVBISUNT
X1ZFUih4ZSksIEdSQVBISUNTX1ZFUngxMDAoeGUpICUgMTAwKTsNCj4gKwkJcmV0dXJuIC1FTk9E
RVY7DQo+ICAJfQ0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4gK3ZvaWQgeGVfcGF0
X2luaXQoc3RydWN0IHhlX2d0ICpndCkNCj4gK3sNCj4gKwlzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9
IGd0X3RvX3hlKGd0KTsNCj4gKw0KPiArCS8qDQo+ICsJICogU0FNZWRpYSByZWdpc3RlciBvZmZz
ZXRzIGFyZSBhZGp1c3RlZCBieSB0aGUgd3JpdGUgbWV0aG9kcw0KPiArCSAqIGFuZCB0aGV5IHRh
cmdldCByZWdpc3RlcnMgdGhhdCBhcmUgbm90IE1DUiwgd2hpbGUgZm9yIG5vcm1hbA0KPiArCSAq
IEdUIHRoZXkgYXJlIE1DUi4NCj4gKwkgKi8NCj4gKwlpZiAoeGVfZ3RfaXNfbWVkaWFfdHlwZShn
dCkgfHwgR1JBUEhJQ1NfVkVSeDEwMCh4ZSkgPCAxMjU1KQ0KPiArCQlwcm9ncmFtX3BhdChndCwg
eGUtPmluZm8ucGF0X3RhYmxlLCB4ZS0+aW5mby5wYXRfdGFibGVfbl9lbnRyaWVzKTsNCj4gKwll
bHNlDQo+ICsJCXByb2dyYW1fcGF0X21jcihndCwgeGUtPmluZm8ucGF0X3RhYmxlLCB4ZS0+aW5m
by5wYXRfdGFibGVfbl9lbnRyaWVzKTsNCj4gIH0NCj4gIA0KPiAgdm9pZCB4ZV9wdGVfcGF0X2lu
aXQoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfcGF0LmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGF0LmgNCj4gaW5kZXggNTQwMjJm
NTkxNjIxLi45YWIwNTk3NThhZDEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9wYXQuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGF0LmgNCj4gQEAgLTI2LDgg
KzI2LDkgQEANCj4gICNkZWZpbmUgWEVMUEdfUEFUX1dCX0NBQ0hFXzFfV0FZICAgICAgIDMNCj4g
IA0KPiAgc3RydWN0IHhlX2d0Ow0KPiAtZXh0ZXJuIHN0cnVjdCB4ZV9kZXZpY2UgKnhlOw0KPiAr
c3RydWN0IHhlX2RldmljZTsNCj4gIA0KPiAraW50IHhlX3BhdF9maWxsX2luZm8oc3RydWN0IHhl
X2RldmljZSAqeGUpOw0KPiAgdm9pZCB4ZV9wYXRfaW5pdChzdHJ1Y3QgeGVfZ3QgKmd0KTsNCj4g
IHZvaWQgeGVfcHRlX3BhdF9pbml0KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKTsNCj4gIHVuc2lnbmVk
IGludCB4ZV9wYXRfZ2V0X2luZGV4KHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCBlbnVtIHhlX2NhY2hl
X2xldmVsIGNhY2hlKTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2ku
YyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYw0KPiBpbmRleCA3OTExMDdkZWMwNDUuLjI0
ZjIwMjFhYWUyMiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYw0KPiBAQCAtMjIsNiArMjIsNyBAQA0K
PiAgI2luY2x1ZGUgInhlX2d0LmgiDQo+ICAjaW5jbHVkZSAieGVfbWFjcm9zLmgiDQo+ICAjaW5j
bHVkZSAieGVfbW9kdWxlLmgiDQo+ICsjaW5jbHVkZSAieGVfcGF0LmgiDQo+ICAjaW5jbHVkZSAi
eGVfcGNpX3R5cGVzLmgiDQo+ICAjaW5jbHVkZSAieGVfcG0uaCINCj4gICNpbmNsdWRlICJ4ZV9z
dGVwLmgiDQo+IEBAIC01NTMsNiArNTU0LDcgQEAgc3RhdGljIGludCB4ZV9pbmZvX2luaXQoc3Ry
dWN0IHhlX2RldmljZSAqeGUsDQo+ICAJc3RydWN0IHhlX3RpbGUgKnRpbGU7DQo+ICAJc3RydWN0
IHhlX2d0ICpndDsNCj4gIAl1OCBpZDsNCj4gKwlpbnQgZXJyOw0KPiAgDQo+ICAJeGUtPmluZm8u
cGxhdGZvcm0gPSBkZXNjLT5wbGF0Zm9ybTsNCj4gIAl4ZS0+aW5mby5zdWJwbGF0Zm9ybSA9IHN1
YnBsYXRmb3JtX2Rlc2MgPw0KPiBAQCAtNjAxLDYgKzYwMywxMCBAQCBzdGF0aWMgaW50IHhlX2lu
Zm9faW5pdChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwNCj4gIAl4ZS0+aW5mby5lbmFibGVfZGlzcGxh
eSA9IElTX0VOQUJMRUQoQ09ORklHX0RSTV9YRV9ESVNQTEFZKSAmJg0KPiAgCQkJCSAgZW5hYmxl
X2Rpc3BsYXkgJiYNCj4gIAkJCQkgIGRlc2MtPmhhc19kaXNwbGF5Ow0KPiArDQo+ICsJZXJyID0g
eGVfcGF0X2ZpbGxfaW5mbyh4ZSk7DQo+ICsJaWYgKGVycikNCj4gKwkJcmV0dXJuIGVycjsNCj4g
IAkvKg0KPiAgCSAqIEFsbCBwbGF0Zm9ybXMgaGF2ZSBhdCBsZWFzdCBvbmUgcHJpbWFyeSBHVC4g
IEFueSBwbGF0Zm9ybSB3aXRoIG1lZGlhDQo+ICAJICogdmVyc2lvbiAxMyBvciBoaWdoZXIgaGFz
IGFuIGFkZGl0aW9uYWwgZGVkaWNhdGVkIG1lZGlhIEdULiAgQW5kDQoNCg==
