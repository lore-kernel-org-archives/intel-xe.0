Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6673FC197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 23:11:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16FBB10E040;
	Thu, 16 Nov 2023 23:11:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B0C510E040
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 23:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700176315; x=1731712315;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=bRVD3Tz1APNBAw32VDUxjsCtYP1taAWakdkMBi6wTNo=;
 b=WCmqsIz9AX5fs/g2aN8V/tL4D6HMk7TuaR7UZn57BsVbeNwMQSnK23Hc
 2TLqy946uS1e18RX6QsZPLEAlMDdLq2blJXZBJ2VOlUlEUdQlIzgDqKEa
 H3d4nohvf3R+TSaZrYAEcjflCSacmaw0iis88wlxzv2l0ehgtSoIbGN12
 fG/GvqJAL/WoVBSc1+h4Ja4TNQqqncyBhYAQecb8HxbAbc1+Csgr0WWZY
 BHuENTQOfT9KbX+Zs6hl19eTWSlKC2nYxS7/GL80Wzxwpdu3100o8BIyI
 31vsifkYFYHonjv1vLER1iQPKZmP2/NVbj0xK9ON4tW+7lCoTdhQb8cSi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="371378414"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="371378414"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 15:11:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="882927032"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="882927032"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 15:11:45 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 15:11:44 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 15:11:44 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 15:11:44 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 15:11:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YS6rtCJDJ3VjBYA6oWiE+l6UpusFqBFeFddKs5dLLaO5pv5nyhlzR94mlT5GdRQIs07iM7lePrancngDf6xWxr/liIhUmOhPXNcsIMk2QQZ/TvVWU226DO3R3SCex6UoqnIP/ytkUjmQitzUfHEWtJwEha4/fzdO5PtaXnjHmkBSYiX5nsZJF5AuNDvs4HuBuwqchm5B9bCPd9IXwMWagECdxmUjmCqFyoRPDT3fBZcHSgNJZ/QnjkALF3S7HCqZdA8ggdIuKzktwzYwgGEP7KHJS8v87Y4zbgoARGj9DpyuQ+LuPFwqbCvAK8bhZSpN24O4OkmmlGvmlJMHA2JkdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRVD3Tz1APNBAw32VDUxjsCtYP1taAWakdkMBi6wTNo=;
 b=fCVTVx2lJlXTSZBIraeErA/7VCptjP5c2w0tS9PluKegvKJA2nOVBgXVTgZSQWCc6hreiERiEJgE7naKk9QC5EAw7pnO0ow57pwK69LVih+JP5zklNFZUJagk/qAu7325+iemRDJcUGW+DhPDngXySbfQ76dv4vgWdWAaN2QWgfGhlcLqa1CXL+vAx/5TXM5Nih/fYVPKnTmNWcKI2XxmCYHGt2p7cmZ1CFZGyGxZzRPDVX1kN6LGbXJEeiiVB+Cj0WE2PpX7GkND8GMk5W5nYrm1xWRY24ZQlpv+G6aiHOAciGf4obDgevQqDC4Zl2O2djFa9uKDJuM7UjuCAyPyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO6PR11MB5620.namprd11.prod.outlook.com (2603:10b6:303:13e::17)
 by SJ2PR11MB7425.namprd11.prod.outlook.com (2603:10b6:a03:4c0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.21; Thu, 16 Nov
 2023 23:11:40 +0000
Received: from CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::fa1c:6a63:a5d0:b783]) by CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::fa1c:6a63:a5d0:b783%4]) with mapi id 15.20.7002.018; Thu, 16 Nov 2023
 23:11:40 +0000
From: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "Souza, Jose" <jose.souza@intel.com>
Thread-Topic: [Intel-xe] [PATCH 1/5] drm/xe: Allow num_binds == 0 in VM bind
 IOCTL
Thread-Index: AQHaGMTl/ro3DPemqUKFMNkaCv+Sx7B9bD8AgAAmuIA=
Date: Thu, 16 Nov 2023 23:11:40 +0000
Message-ID: <1dfb060aed8ee6e581601cd037d24fd4bb8a9b27.camel@intel.com>
References: <20231116194047.214330-1-matthew.brost@intel.com>
 <20231116194047.214330-2-matthew.brost@intel.com>
 <5071488434e6018bf1ca7deef03434cbf70d4291.camel@intel.com>
In-Reply-To: <5071488434e6018bf1ca7deef03434cbf70d4291.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4-2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5620:EE_|SJ2PR11MB7425:EE_
x-ms-office365-filtering-correlation-id: 31343362-5007-4d5d-c73f-08dbe6f963f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5Dy6r8Ovqy0I8G6MRvtbi0Ki89C02p7d9PNVSrzIbeNBA3Eqls+djYJULk+hTpKuN+Nzr64iFv0L714QzMXBch34t+UTqx7BH1ef8e80eqgBjWhiUpgvfEFGavFavU/bUDdD8H8JS0/B/GDpRPFpZRVneDRcfqDlDwqZk92PB7q9EfNFP/wpfKQJvJC8kXglPwudWerzVY7TN8tVmpTnHpdG+/P8dB4+F5IUWhwlimMO3LzcRVYKVi0QagS8RPYNOaYOdyz9ADvCIAyvmQKpVeBcsxm4uOlkb0E2IK5pAPbnKyD5V6QR6J2iaDgsbvZGsWWjoG1YHtVW0PFw1cVsN1R/NAo9lYZ1RyHCsh745gWmcAyr9ZgN1Fx/rMVdRi4I3Ob1/HJjr4hnpTMtG1lAGYNYYxJJauCO0gMSPCJwKIlEgWs6uwhEVGN0+ZdT8YvKf8meykb8g+stiP5clmm4Qx9jiEtg2hE2d1eGyX93MTA0x5ZCWT4qEj4hUg/bcDpSpcsPn2vnzzvekrzvkBUB58uZAxxMrwCANr9hNGwQTneQyUC9h4w8Ki4wuiYvDeGlUM+0H70Vp9L/YP3hkINYjtAaK1vG4Mhc3ipVi82opPHZBClo2RTykuWgDCF8c/Y0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5620.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(39860400002)(396003)(366004)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(76116006)(6636002)(66476007)(64756008)(110136005)(4001150100001)(2906002)(66446008)(122000001)(41300700001)(316002)(8936002)(8676002)(66556008)(66946007)(86362001)(38100700002)(5660300002)(478600001)(71200400001)(6486002)(6512007)(36756003)(6506007)(38070700009)(2616005)(83380400001)(82960400001)(66574015);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M1JMVlFrKy9DdEpRKy9ZWG9OemNPMElHNERIZ05KbUZXYVVPeW5IZDk2ZVBq?=
 =?utf-8?B?bUVxcEZja2F5WTZJWlE0dU1Eb1hWU1puOU9kVkFScTl0SFZUcTRLWEtpOVVM?=
 =?utf-8?B?NXIzdWVtL3hpclE1UjU3c1ZLL0l2RUhVMmJBWjVrZWpncXlvTHVtS201YzFK?=
 =?utf-8?B?eGFibjNkVmFEdVlselkyWU5nTFF5NUhGTm00UnMrVk5pNUVRQm5Ma2U5ZmlV?=
 =?utf-8?B?UUt2NlhYcHpjUnF5SjEyZWVwdFdVS2FiOWx2TjdkTzhrZWFvc1h3cHNlZEpD?=
 =?utf-8?B?RGg0aE03WTBiUWh1VXRsNkpPM1dwUmd0QlRLZjhFdi9CUFVXNWthSmtiYzAr?=
 =?utf-8?B?ZU16TndscjFoVllCb1RaeUpXZFUwSEV2SUp0c085WmFRSGNaY01qTFVLNXVi?=
 =?utf-8?B?NUF2TjFad1psQUg5S0o3ZjBVc0lxalE4UTVucnJRY3p2REl4QW5SaVFxd0Ur?=
 =?utf-8?B?RXVONTdRdXMxZnV5b2VhNm5ta0txQWE3S0hqSENDUjJlS3cyOWJ6Rm1IQnc5?=
 =?utf-8?B?THp2d1I1N3p3dHNRYjdwUCtxL2pNRnN5ZVptRFBnZ0s2MDVvck1LMWpZVjcx?=
 =?utf-8?B?R0kxa1ZpT2tQb3NJamxKM003akFPZjBhaTFGNXNlNkIwM0pNcmtMMk9MQURv?=
 =?utf-8?B?NGFQRE03MHhtN2h1bTN4OURIT1Rzb3pBcHl1S2lzTmN3Q2dLd0x5ZFl3ckk3?=
 =?utf-8?B?TW16Rm1BVGtKQ01zZCt5VVFPc2VCeHUzNmE4NlhzOFNhYmM1blNpK0duckc0?=
 =?utf-8?B?Q0ZPVG5VYzVNb3UreFlyMlFGYU05dnVoaGZrVy9pcU13RHB1dGs0MHpjVHJL?=
 =?utf-8?B?dTRuM0VjdnVtazVSb1dyeVlWRHRGR0RKS0VFZjRPZGptMU9LbEo3Mm8xUXM5?=
 =?utf-8?B?c0F3Q2hOM1dSbURRSnVTMGhCakZ1RzhFd2kwRjJhWXM0Z0s2L0VFZFpTWHlH?=
 =?utf-8?B?ZkYwM1hNY0s1ODlsOUxqanQwdEhXNWcwa2sxYmxibGM3QkFHZlJ3a1JzckxY?=
 =?utf-8?B?QlprdTlSbTBNTlAvc0wxWGp4NDBKK243c1ZqcmwwK2tjMjVuRk00Mi9vSkp5?=
 =?utf-8?B?eWo2SmIwbmtRd0xKejQxaHB4bSttWW1HaEIzU3BhYyt1RjhkaU9vQVpsdzNH?=
 =?utf-8?B?TkY5YXBJRmJGVFhFb3VJelkxTUpJVC9OZ2JnUWdpdmJYTE16OUIrNFRyMGxn?=
 =?utf-8?B?c25ORHFnRDdBTDBIZzBFcnh0TWtUVHpRY3JTTE5hdk1sYXRHUXlyZm1XOHEz?=
 =?utf-8?B?SjVndEMydEhGdWZ1WmxMVmVndmk2U0IwR2ZjT0pMQmJFb1FYNlVPRmJyclZ2?=
 =?utf-8?B?M3pXODk3VHpYL0VKVWF3Sm5aWFFVY0tIM3BFendmeFBnd3NBS2p5TndJejdD?=
 =?utf-8?B?SlpUYnBPUi81YW84bzc4ak1iMS9uNXQ3dlZCd0F5NUlSVkxyeG9ESmowcS96?=
 =?utf-8?B?UTRBVUc1bmc2MGZTY0hwSEx5UDFlUVVMWG1PTGtsOGNQRlhiVjRQN0tzZnR5?=
 =?utf-8?B?aGMzVk1JQ0ZTS2hxUWEzSTBrS3Q1M3J3TmhWQW8vcHJGc3p6bEs0WkpNOG9U?=
 =?utf-8?B?cFJzV2dGdGRaNGtxRGFjUklwSW1xS3U5WVdUYWRHRWJoek9zNy9oU3cxamRh?=
 =?utf-8?B?VXYyZHhCaGgweG84eUZTQk12QlFSRUFhTHkxVTNJL0FYMkJ5ZFpkS00xVm5n?=
 =?utf-8?B?ZWthTTJKS1FtUGxCRmNLalE4aWRBV1ZPYkp3WWhSaFpheU1BK1BSS3J4aGRB?=
 =?utf-8?B?dTJzc3V5Vk5IZ3hCdUQ3MlBFMkliTUhjQXlUM01kRWVHWnJ0TDRNWlgwL2tL?=
 =?utf-8?B?K0VJckcrSFMyMVdEU2JBQU1wWStIZC91clhDNkhwME14V2FCUFk5ODFWdU44?=
 =?utf-8?B?YnJQZ1hSMSsrUi9pQ1JJMk1yTFJ3cVEycHRqd3NhZklkV2lQYzF0aUdrZjhJ?=
 =?utf-8?B?ZFZETVRtdnZLbkF2eFp5blRZQVNDSWlvYzZoWDV6WXkwZjFGZEo3VGFpOFl5?=
 =?utf-8?B?VUZsVUQ5NXd2RVpDaWR1b0VXNVJwUDlFNkRZUjlEWnA5SUJUWXZTd2wxNXVV?=
 =?utf-8?B?MXhMczlLbW1OZFVIZUtFdllPUUNCcXI3czVqZ1JSUllKTVp4QUtsUjE0VnhG?=
 =?utf-8?B?TGlWTnQxR1k4ajRZWjQvYmErR3E3N212YWc1Yk82WUZDWGRNWm5rTFEyZHJZ?=
 =?utf-8?B?UlE4MjlFTE5YUUtHeWJPd1ByR3FTZ1d3VVJBaE1iak03eWw2TGxQUnl2SkhV?=
 =?utf-8?B?RzBUOG9rdnNUU1BEYnNJME1JeXRnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B714449C4BDF784ABCBC42F9731E29F5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5620.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31343362-5007-4d5d-c73f-08dbe6f963f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 23:11:40.0908 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZaGsZ77bzGNb5undoqVfsgjn0/vGKj9wvHDb/cN1iDNmiJpu5lNbWOfRyWzq+lfK+afBKaYunc0vKMwpMhZAY5/H/P6IYO+qlVmKupYiVgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7425
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/5] drm/xe: Allow num_binds == 0 in VM bind
 IOCTL
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

T24gVGh1LCAyMDIzLTExLTE2IGF0IDIwOjUzICswMDAwLCBTb3V6YSwgSm9zZSB3cm90ZToNCj4g
T24gVGh1LCAyMDIzLTExLTE2IGF0IDExOjQwIC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiA+IFRoZSBpZGVhIGJlaW5nIG91dC1zeW5jcyBjYW4gc2lnbmFsIGluZGljYXRpbmcgYWxsIHBy
ZXZpb3VzIG9wZXJhdGlvbnMNCj4gPiBvbiB0aGUgYmluZCBxdWV1ZSBhcmUgY29tcGxldGUuIEFu
IGV4YW1wbGUgdXNlIGNhc2Ugb2YgdGhpcyB3b3VsZCBiZQ0KPiA+IHN1cHBvcnQgZm9yIGltcGxl
bWVudGluZyB2a1F1ZXVlV2FpdEZvcklkbGUgZWFzaWx5Lg0KPiANCj4gcy92a1F1ZXVlV2FpdEZv
cklkbGUvdmtRdWV1ZVdhaXRJZGxlDQo+IA0KPiBTbyB0aGlzIGlzIGp1c3QgZm9yIHRoZSBiaW5k
IHF1ZXVlLg0KPiBOb3Qgc3VyZSBpZiBpdCBpcyB1c2VmdWwsIE1lc2Egd2lsbCBldmVudHVhbGx5
IG1vdmUgdG8gYXN5bmMgdm0gYmluZCBhbmQgd2Ugd2lsbCB1c2UgYSBzaW5nbGUgVElNRUxJTkVf
U1lOQ09CSiB0byB0cmFjayB3aGF0IGJpbmQgb3BlcmF0aW9ucyBhcmUNCj4gY29tcGxldGVkLg0K
PiBQYXVsbyBkbyB5b3Ugc2VlIGFueSB1c2Ugd2l0aCBzcGFyc2U/DQoNCldlIGRvbid0IGhhdmUg
cGxhbnMgdG8gc3VibWl0IHN0dWZmIHRvIHRoZSBLZXJuZWwgd2l0aCBudW1fYmluZHM9MCwgYnV0
DQp3ZSBkbyBuZWVkIHRoZSBLZXJuZWwgdG8gc3VwcG9ydCB0aGUgY2FzZSB3aGVyZSB3ZSdyZSB0
cnlpbmcgdG8gYmluZA0Kc29tZXRoaW5nIHRoYXQncyBhbHJlYWR5IGJvdW5kIChzbyB0aGVyZSdz
IG5vdGhpbmcgZm9yIHRoZSBLZXJuZWwgdG8NCmRvLCBidXQgbnVtX2JpbmRzID4gMCkuDQoNCkFu
ZCB5ZXMgdG8gdHJhY2sgb3BlcmF0aW9ucyB0aGF0IGFyZSBhbHJlYWR5IGNvbXBsZXRlIGl0J3Mg
dXN1YWxseQ0KYmV0dGVyIHRvIGp1c3QgY2hlY2sgdGhlIHN5bmNvYmogKHRpbWVsaW5lIG9yIG5v
dCkgb2YgdGhlIGxhc3QgdGhpbmcNCnlvdSBzdWJtaXR0ZWQuDQoNCkN1cnJlbnRseSwgZHVlIHRv
IHRoZSB4ZS5rbyBidWdzLCBvdXIgdm1fYmluZCBjb2RlIGlzIGNvbXBsZXRlbHkNCnN5bmNocm9u
b3VzLCBidXQgdGhlIHBsYW4gaXMgdG8gbW92ZSBpdCB0byBhc3luYyBsaWtlIHdlJ3JlIGRvaW5n
IHdpdGgNClRSLVRULg0KDQpJJ20gbm90IGRpc2NhcmRpbmcgdGhlIHBvc3NpYmlsaXR5IHRoYXQg
d2UgbWF5IGhhdmUgdG8gZG8gc29tZXRoaW5nDQpleHRyYSBmb3IgdmtRdWV1ZVdhaXRJZGxlLCBl
c3BlY2lhbGx5IGFmdGVyIHdlIG1ha2UgaXQgYXN5bmMsIGJ1dCBJDQpkb24ndCB0aGluayBzdWJt
aXR0aW5nIG51bV9iaW5kcz0wIHdpbGwgYmUgdGhlIHJpZ2h0IGNob2ljZS4NCg0KPiANCj4gPiAN
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNv
bT4NCj4gPiBSZXZpZXdlZC1ieTogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21A
bGludXguaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm0u
YyB8IDMwICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMTggaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Zt
LmMNCj4gPiBpbmRleCBkNDVmNGYxZDQ5MGYuLmNkOGMyMzMyYTIyZSAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV92bS5jDQo+ID4gQEAgLTI4NTAsNyArMjg1MCw2IEBAIHN0YXRpYyBpbnQgdm1fYmluZF9p
b2N0bF9jaGVja19hcmdzKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLA0KPiA+ICAJaW50IGk7DQo+ID4g
IA0KPiA+ICAJaWYgKFhFX0lPQ1RMX0RCRyh4ZSwgYXJncy0+ZXh0ZW5zaW9ucykgfHwNCj4gPiAt
CSAgICBYRV9JT0NUTF9EQkcoeGUsICFhcmdzLT5udW1fYmluZHMpIHx8DQo+ID4gIAkgICAgWEVf
SU9DVExfREJHKHhlLCBhcmdzLT5udW1fYmluZHMgPiBNQVhfQklORFMpKQ0KPiA+ICAJCXJldHVy
biAtRUlOVkFMOw0KPiA+ICANCj4gPiBAQCAtMjk3Nyw3ICsyOTc2LDcgQEAgaW50IHhlX3ZtX2Jp
bmRfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwgc3RydWN0IGRybV9m
aWxlICpmaWxlKQ0KPiA+ICAJCQlnb3RvIHB1dF9leGVjX3F1ZXVlOw0KPiA+ICAJCX0NCj4gPiAg
DQo+ID4gLQkJaWYgKFhFX0lPQ1RMX0RCRyh4ZSwgYXN5bmMgIT0NCj4gPiArCQlpZiAoWEVfSU9D
VExfREJHKHhlLCBhcmdzLT5udW1fYmluZHMgJiYgYXN5bmMgIT0NCj4gPiAgCQkJCSAhIShxLT5m
bGFncyAmIEVYRUNfUVVFVUVfRkxBR19WTV9BU1lOQykpKSB7DQo+ID4gIAkJCWVyciA9IC1FSU5W
QUw7DQo+ID4gIAkJCWdvdG8gcHV0X2V4ZWNfcXVldWU7DQo+ID4gQEAgLTI5OTEsNyArMjk5MCw3
IEBAIGludCB4ZV92bV9iaW5kX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRh
dGEsIHN0cnVjdCBkcm1fZmlsZSAqZmlsZSkNCj4gPiAgCX0NCj4gPiAgDQo+ID4gIAlpZiAoIWFy
Z3MtPmV4ZWNfcXVldWVfaWQpIHsNCj4gPiAtCQlpZiAoWEVfSU9DVExfREJHKHhlLCBhc3luYyAh
PQ0KPiA+ICsJCWlmIChYRV9JT0NUTF9EQkcoeGUsIGFyZ3MtPm51bV9iaW5kcyAmJiBhc3luYyAh
PQ0KPiA+ICAJCQkJICEhKHZtLT5mbGFncyAmIFhFX1ZNX0ZMQUdfQVNZTkNfREVGQVVMVCkpKSB7
DQo+ID4gIAkJCWVyciA9IC1FSU5WQUw7DQo+ID4gIAkJCWdvdG8gcHV0X3ZtOw0KPiA+IEBAIC0z
MDI4LDE2ICszMDI3LDE4IEBAIGludCB4ZV92bV9iaW5kX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYsIHZvaWQgKmRhdGEsIHN0cnVjdCBkcm1fZmlsZSAqZmlsZSkNCj4gPiAgCQl9DQo+ID4g
IAl9DQo+ID4gIA0KPiA+IC0JYm9zID0ga3phbGxvYyhzaXplb2YoKmJvcykgKiBhcmdzLT5udW1f
YmluZHMsIEdGUF9LRVJORUwpOw0KPiA+IC0JaWYgKCFib3MpIHsNCj4gPiAtCQllcnIgPSAtRU5P
TUVNOw0KPiA+IC0JCWdvdG8gcmVsZWFzZV92bV9sb2NrOw0KPiA+IC0JfQ0KPiA+ICsJaWYgKGFy
Z3MtPm51bV9iaW5kcykgew0KPiA+ICsJCWJvcyA9IGt6YWxsb2Moc2l6ZW9mKCpib3MpICogYXJn
cy0+bnVtX2JpbmRzLCBHRlBfS0VSTkVMKTsNCj4gPiArCQlpZiAoIWJvcykgew0KPiA+ICsJCQll
cnIgPSAtRU5PTUVNOw0KPiA+ICsJCQlnb3RvIHJlbGVhc2Vfdm1fbG9jazsNCj4gPiArCQl9DQo+
ID4gIA0KPiA+IC0Jb3BzID0ga3phbGxvYyhzaXplb2YoKm9wcykgKiBhcmdzLT5udW1fYmluZHMs
IEdGUF9LRVJORUwpOw0KPiA+IC0JaWYgKCFvcHMpIHsNCj4gPiAtCQllcnIgPSAtRU5PTUVNOw0K
PiA+IC0JCWdvdG8gcmVsZWFzZV92bV9sb2NrOw0KPiA+ICsJCW9wcyA9IGt6YWxsb2Moc2l6ZW9m
KCpvcHMpICogYXJncy0+bnVtX2JpbmRzLCBHRlBfS0VSTkVMKTsNCj4gPiArCQlpZiAoIW9wcykg
ew0KPiA+ICsJCQllcnIgPSAtRU5PTUVNOw0KPiA+ICsJCQlnb3RvIHJlbGVhc2Vfdm1fbG9jazsN
Cj4gPiArCQl9DQo+ID4gIAl9DQo+ID4gIA0KPiA+ICAJZm9yIChpID0gMDsgaSA8IGFyZ3MtPm51
bV9iaW5kczsgKytpKSB7DQo+ID4gQEAgLTMwOTIsNiArMzA5MywxMSBAQCBpbnQgeGVfdm1fYmlu
ZF9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLCBzdHJ1Y3QgZHJtX2Zp
bGUgKmZpbGUpDQo+ID4gIAkJCWdvdG8gZnJlZV9zeW5jczsNCj4gPiAgCX0NCj4gPiAgDQo+ID4g
KwlpZiAoIWFyZ3MtPm51bV9iaW5kcykgew0KPiA+ICsJCWVyciA9IC1FTk9EQVRBOw0KPiA+ICsJ
CWdvdG8gZnJlZV9zeW5jczsNCj4gPiArCX0NCj4gPiArDQo+ID4gIAlmb3IgKGkgPSAwOyBpIDwg
YXJncy0+bnVtX2JpbmRzOyArK2kpIHsNCj4gPiAgCQl1NjQgcmFuZ2UgPSBiaW5kX29wc1tpXS5y
YW5nZTsNCj4gPiAgCQl1NjQgYWRkciA9IGJpbmRfb3BzW2ldLmFkZHI7DQo+IA0KDQo=
