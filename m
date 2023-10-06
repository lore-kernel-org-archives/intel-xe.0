Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D21BE81DFD
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 13:41:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29971890BE;
	Fri,  6 Oct 2023 13:41:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C51890BE
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 13:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696599709; x=1728135709;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=gvPb31LvoKQ3jf6Gz2FVtupNo9xo+CtsQHg3i/vl5DY=;
 b=bZXZLAGoZ1Jc3XfZ4K+mxSwr221bYGoYQTFnlxQmYtKpLYR+RGSLkYm0
 vktgASX9RleE0rqAfS5xA7srJuvISjtP588S7fIwiYQVpLevfg+HPzqdP
 SzYt50qqa60YDptWnlmFaw40KgzUPFG0Yi5si0cay5aBI5yVejZlqvXlE
 3sSWoAXJs8VqNiyb6upN+V+8T7zv0dQ6L2w6QUaLNEddNTLX5X4thvlWL
 x07nqQnRHXOlX50aHxbFH/GR8MqbxBBFWBYttZENYr6wHFOkpf0efrY8n
 cHSVayTQnhG7DmMhlBZakJg4424AmAfJVTwZFgGQDw2rOhQ8bAXfDIvVs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="2354987"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="2354987"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 06:41:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="818010152"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="818010152"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Oct 2023 06:41:47 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 06:41:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 6 Oct 2023 06:41:47 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 6 Oct 2023 06:41:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cTg/ylETw8SmDmGULVn2pqAzRLqPoY8c8ICh6KCru8uRf6VvxCoTePp7AxHyLOWTCI6lT7r10sJPYSysGLLK62rcde+XPsSnEX4+h+I5CkzOrTh9VMUXRO5cZZDPj2Yak8dgtOYwYS8ESBd0ruMCSG8HC28GxpIHB9xE5/RRNL37evLMz5cUN+wfTvs1IdDRgHlnE/yOHHHHdQf5a2Cf290oWMiqVvYf0ISPed1zMw710x8ZKU1OAUWFJBJrl2Dn0uq/KT+sBD1Gi7zD1xttKvUaero+EEaxEG2g7EhSOBqaSfl3jgOwaZQPeyVN3GGarJek8Orb2gck8tuJxqm1Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvPb31LvoKQ3jf6Gz2FVtupNo9xo+CtsQHg3i/vl5DY=;
 b=MfuxG/VcrYXYhnUNjPnYFU+KJBCBR7dD6FhoIJgvr6MNTDU9OBG6jrLcxRhzSP4GX7cm8jOxQPHkHWa6xmuS9uh7vc3ZcH3N+X8L2E5acvB7MjmegSNGckN36keL0IW/JjrmcbiC2HVjFbW8sTFNnjCjIqgdbMx0T9FpS3X797j9QEc0Nyz+rF0llSquUbN5WuCUJE14Ok0eFLRMxZBI6cfNUwIZyso6h5/d388AL/q7lKB/gF4SkVuwRRVqT3mi7cEV+yJYxWbUvgPTBT3HNxB8yGT+V8WKul2qpDCvU7IaquLMrXqjHMqHWpnwHPp3DVHeAqgCZWNXr1jLxfg3xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CO1PR11MB5155.namprd11.prod.outlook.com (2603:10b6:303:91::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Fri, 6 Oct
 2023 13:41:45 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47%7]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 13:41:45 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Dugast,
 Francois" <francois.dugast@intel.com>
Thread-Topic: [PATCH] fixup! drm/xe: Correlate engine and cpu timestamps with
 better accuracy
Thread-Index: AQHZ99YDsfZh9MCYikGt8vtHrLh7vrA8xgEA
Date: Fri, 6 Oct 2023 13:41:44 +0000
Message-ID: <538d148e11160495a4012d80e16b45da136415d7.camel@intel.com>
References: <20231005215040.3260151-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20231005215040.3260151-1-umesh.nerlige.ramappa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CO1PR11MB5155:EE_
x-ms-office365-filtering-correlation-id: 5a47d8a0-bf65-4b8e-8f7d-08dbc671fafa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DC7MOq+mFgrvveHRuL78fxUzgse6yVIUpJOWfB/ASCk4BT1HuB+vj0QDqJVf3FwWijWeZoRM06WT7XSY6yEBML/GL60wBqbTcc0ZUO2KrtX+WzaggiMJJGOzeOJhRpoIqUpB53CY9rsH2qrw4qnhqBcRfsB+U2QSuuPVlOLndzzL4K2kabWTdZt3uiOvk+e7L6jfM7X4/fXoYeKmbxipbCX/30EYxCK8ZfT9WCYpgEh72PjrNDzyU2HLpFlklI8aUj6orcr4fmPXgxTXOcqd2aKY0ftpeSGGsN4rue3ZkaFTZ4KBivuOGzgiVdERFkYCQmvJSr2Fqmw4iHlZLrA6yFjK//3bmQtUVdZeuhKBV6sdiokrssrZnMbTTGfmQBzHpdLzGUrNIXfe0tte4fZxTWjrsg3sEWLRmARS6lVgL8JxS97ZdekWiwFz24/n0TuwGwPUcirPpDTCGs25D6PfFVhOYtSHLKKTzWYMRErebEs92y5ZDDCbF7t2O6SbankV0poD5Qk5wkFcSif6SMCFGMdUO1QcQ8heOiZkRdfx2yH5FGUt/yguN6KOms7fC7ZDMARXs2E14pRrcQgQ+KJrbZXUmIuIYjY0Whj64V6kTt/lgK94kLDqLH8WnwPQT3s4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(346002)(396003)(376002)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(83380400001)(122000001)(82960400001)(38100700002)(38070700005)(478600001)(6636002)(64756008)(66476007)(66556008)(66446008)(316002)(66946007)(5660300002)(8676002)(8936002)(4326008)(41300700001)(91956017)(2906002)(76116006)(110136005)(107886003)(6506007)(26005)(2616005)(6512007)(6486002)(71200400001)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NDVYY0x3MVVYREdNQlBwdmlseEZLT1V1Z2J3Vm1oQ2xpTjlWdFNJbGozQU53?=
 =?utf-8?B?THhPRm90a2ZBZUErTTRzbzdDNHI2Qk4xKy9LWVhPR3BhN3pGb3ZLTGpXYmVF?=
 =?utf-8?B?QjhuZWpQdm5kd294Mm5VWU5pOVZxMnhaMjBtT20yQTNnRUhhMk1PU1JPNWJr?=
 =?utf-8?B?OFQyNDdCUG9LT3RJODIyOWhaTEMycWVvN29BVVhDZ290dHlORGE0Z1JaZFIw?=
 =?utf-8?B?c29IYm1jd2M4QVdUeWhmVWQ4c2JHNFVDdGREb1cvRUl5b25VdTFoai9tblQr?=
 =?utf-8?B?aE4rWm15bjU5RGg5YkxMUTRLS0RwM29Ed3J2Z2RFOHFpdkdaMGpIc015ZG5T?=
 =?utf-8?B?RlEvMUw2Vi9jYU5JOEdWckFobjMvMXB6ckxDQ1o4NEFpVGdhbmo1Y2JraDk3?=
 =?utf-8?B?Q09SWWk4WS9GN3oraHZaWDIzeTNkcU42ZTFhOWp4TkJQcjBVY0dJdWFDRTdr?=
 =?utf-8?B?NVVXYXV4K092R003bmVGYy9uYmprd1pqb1hkdTlEL0MvUUp1TmtJWFIya0Jr?=
 =?utf-8?B?cXRFYmxqM04vQmdwTlhKNGQxa2hva1h5STJVRDFDWWFPcDJNWEFsVENUQklw?=
 =?utf-8?B?ZENlakovb3FNNDY3REV4R00yQzVWYTR6Umc3TE4wY2xxYUNoL05FSnNFQjFC?=
 =?utf-8?B?ZDk2M1MvNUJpakdIcHU4ZDBpdStHRUdWajZKYWRpZ1lSNWNBUTRSMTFrREg0?=
 =?utf-8?B?UFlhb09vS2drOXV4ZnZtTmtEZWRsWFI4N0NzVjlEdm5vYkNtc2JqbmU3VkJl?=
 =?utf-8?B?QVpNM2xsRnkrT1Rhbk1ZOVYxZVY0NjV1cXRjRzZZNldJYUtWNkNSbGRrNkZi?=
 =?utf-8?B?ZmdhQmo0bGpOMUFLendLOWtIZEJZOUFJWTMzS1VuMThRYmJSdDV2aEpkbmpl?=
 =?utf-8?B?ekJ0VWVjaVQxc2pwL2ZiNjNPRm4xa2hLTU41THF6RzNBbE1OL0kwbUFLVkhK?=
 =?utf-8?B?ZTI1RnZLaHB3NTdvZWV3Q3hZZUVFVHU0SnZVUUNpZW53TzBOUEJvR3NQVmdE?=
 =?utf-8?B?YXZnQ1JuL09MZkJES3FCT29sYzVDcWh5LytNaCtWNUFvREdMZTBVbnpBRTJi?=
 =?utf-8?B?SFdLTDlocE5sYTdEc2hPTjlqTDRhWTNhYndEYy9HMGVlNWhiV0FJNElJZlpJ?=
 =?utf-8?B?cDM0K2h2d011d2xwdGZDdkFlZUVPZm5mT1Q1U2ZQdGZheDhiZzVuU0QxaVk3?=
 =?utf-8?B?MXFNRm9FbXlhZWhOaFk3TElUR0pYWkRuMjhlcm40MFZRU21GejB6UkNmWW8v?=
 =?utf-8?B?YjZOYno4eXphNHFDRXJLOVQvUlRVRDMyUFdwbjhXSnBvTExBK3dFRzdubUR5?=
 =?utf-8?B?QTdOQWVKMjBqWkcyTmZZVXFJMmNtcGpQYUlTeGJWaWZYYXdzaTlNWmt3WUw5?=
 =?utf-8?B?RW01WlNEVERQUFN4NDFzRmxsVCtVdlczNm00aUJtYXJMT2FpbWgyQXpRakhK?=
 =?utf-8?B?WHdEbUpqQi8wK055VG1PZ1liNTV4ZVJhcEFRWjlnbjhsWnl5M25RMEllK1l0?=
 =?utf-8?B?L1dudE0wZFJ0aTllWlF2T2RuRk5DQTdKbFI3N3EyTGpJcW5IanBFSnUxYy93?=
 =?utf-8?B?c2dZYy9nbGVMYkJ0SlJlZkllYmhyWGZIZEczd0RlWTV5d2dhWURvb2g1TTFM?=
 =?utf-8?B?V2JIeWlyQlh0RUM5ZHFXM1VxN3BreDI0cTdvODNQS2dHY0ZBMUxGUXdjenZp?=
 =?utf-8?B?cStTMlQyVlhXRzhZQjh5SnZuSjRzQkl2K3QvR2lNbUhKaTZZdzB3bk02OUdi?=
 =?utf-8?B?bS9nTWVuVzA3QlJPaHpCZVFIRk1xVUhETVRtaHZxVWF1Nmt1cGVpaXNmOTc4?=
 =?utf-8?B?UzRFYzM0R2RRcGhJN0MvMk4zdlZRL3NKUUQzTloxT3U4RmNwTGFtT28vMks0?=
 =?utf-8?B?UndweWxxSktIblptRTA0UkdtT0tBdE8zclVmVnRRZTVLVGZ0bGgvdHVDaDlZ?=
 =?utf-8?B?Y2d6aldYYjU0YnVYWDQ3VGM2dlFIa0hqM0FSeGFtM3B5NzVuSWJBaVYxUHhq?=
 =?utf-8?B?WXdoUXprZ3lMQ2FIcExsdURuTlozcVhmb0oyNVFZeWdDbEZsZHExaklNaGRM?=
 =?utf-8?B?akN1TDAzbHJ6am0xeHRnSEp0SWttNmtvVGxNZDgzSWN1anJOSXBuZXRZMnE0?=
 =?utf-8?B?d1JVZ05VZk9taDVjZWZBeGN6UXp3Snc4K0ZxVmoya0pKQ3l5NVBDeVVKZlla?=
 =?utf-8?B?M0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3E1A554BE2E64B42BBBDB5587FE96649@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a47d8a0-bf65-4b8e-8f7d-08dbc671fafa
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2023 13:41:44.6871 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ygpr9DJv8qr6vlh3tYKS+jqJhzwsEkp4+9AXVFWQgPl7QYHmOph5YoGxqsd+tFzrs/fJ+O3ZN4RLgin3Jzf13Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5155
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe: Correlate engine and cpu
 timestamps with better accuracy
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTEwLTA1IGF0IDE0OjUwIC0wNzAwLCBVbWVzaCBOZXJsaWdlIFJhbWFwcGEg
d3JvdGU6DQo+IENoYW5nZSByc3ZkIHRvIHBhZCBpbiBzdHJ1Y3QgZHJtX3hlX2NsYXNzX2luc3Rh
bmNlIHRvIHByZXZlbnQgdGhlIGZpZWxkDQo+IGZyb20gYmVpbmcgdXNlZCBpbiBmdXR1cmUuDQoN
ClJldmlld2VkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNv
bT4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVW1lc2ggTmVybGlnZSBSYW1hcHBhIDx1bWVzaC5u
ZXJsaWdlLnJhbWFwcGFAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9xdWVyeS5jIHwgNSArKysrLQ0KPiAgaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCAgICAgfCAy
ICstDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jDQo+IGluZGV4IDk1YTZhYTVjYmE1NC4uZTcyNjM2Njg3
MGJlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYw0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYw0KPiBAQCAtMjE1LDcgKzIxNSwxMCBAQCBz
dGF0aWMgaW50IHF1ZXJ5X2VuZ2luZXMoc3RydWN0IHhlX2RldmljZSAqeGUsDQo+ICAJCQkJeGVf
dG9fdXNlcl9lbmdpbmVfY2xhc3NbaHdlLT5jbGFzc107DQo+ICAJCQlod19lbmdpbmVfaW5mb1tp
XS5lbmdpbmVfaW5zdGFuY2UgPQ0KPiAgCQkJCWh3ZS0+bG9naWNhbF9pbnN0YW5jZTsNCj4gLQkJ
CWh3X2VuZ2luZV9pbmZvW2krK10uZ3RfaWQgPSBndC0+aW5mby5pZDsNCj4gKwkJCWh3X2VuZ2lu
ZV9pbmZvW2ldLmd0X2lkID0gZ3QtPmluZm8uaWQ7DQo+ICsJCQlod19lbmdpbmVfaW5mb1tpXS5w
YWQgPSAwOw0KPiArDQo+ICsJCQlpKys7DQo+ICAJCX0NCj4gIA0KPiAgCWlmIChjb3B5X3RvX3Vz
ZXIocXVlcnlfcHRyLCBod19lbmdpbmVfaW5mbywgc2l6ZSkpIHsNCj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+IGlu
ZGV4IDA3OTIxM2EzZGY1NS4uYjc0YzhkMmUyYzQ2IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3Vh
cGkvZHJtL3hlX2RybS5oDQo+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gQEAg
LTE0NCw3ICsxNDQsNyBAQCBzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSB7DQo+
ICANCj4gIAlfX3UxNiBlbmdpbmVfaW5zdGFuY2U7DQo+ICAJX191MTYgZ3RfaWQ7DQo+IC0JX191
MTYgcnN2ZDsNCj4gKwlfX3UxNiBwYWQ7DQo+ICB9Ow0KPiAgDQo+ICAvKioNCg0K
