Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD264C46CA1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 20:55:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89D9510E341;
	Mon, 18 Sep 2023 20:55:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 678AB10E341
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 20:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695070522; x=1726606522;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=//fsU1s0i8Yx+WFD+E21cXsc642oOseSGxBOtz6TKxs=;
 b=GgtVPFmQxSdhD5f9mEG2MvReGnhZiWnHwm/FEHgYQQxFt5utqifQKe7g
 frj6Nwc2ieVi5/vYsObvhqB7C7vRQWlJoJScTzbhM7btr8PXSqwtUCTxt
 B5xHnThSO3HbkXQSmE/qeMYBQsnHw9SV/g/TFmQq9quprl6BxhjMDyUsl
 vkP64PFMbOEW5sIN3ht7Ls6UjA4FkKM5Y87NpkrIECn44FDci8UWtjJj4
 DPT7QTqlYqZgni0WfX5SP5Tw0Cc39vu3doQuc8Pv9aAFqXuzzmeSEAiZB
 yM7lrGAqisv8KYxlStf3PwIypAEnejiNx8dCTtKrdW3kX3/Y7VxElqk2q A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="383588136"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; d="scan'208";a="383588136"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 13:55:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="869706536"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; d="scan'208";a="869706536"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2023 13:55:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 13:55:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 13:55:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 18 Sep 2023 13:55:20 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 18 Sep 2023 13:55:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8zO0XVvahjAuM6340OAGFkraGALJ+eNpe8dFjW4DP07wc4aH2r5cuiYiO2TznS9Na/wZ7KTOAIPfp3hrgW/QyWyEcbM4p9QFvwm8YuEQY17DceFbM9/9FQj7Wt8NvqhJ/v1JU81uzdNuWwrlkPSocgz9/1kd9+mbobdnLTJDSeBumNpkIffZ0+iewHhK4fsMsu6AiWBECvrPeV1aRQrkDORM3WVN13SX6SIMSCPRAIn6pHM/SZcaOcPuQ4USFDucJufd/Lxk5fVmx55o1DXoRRBLK9ZvnJKP22KBSHn22FKq83dd2FwxEwkas77SMdeTw1cHMM6Ea+q7qJH0fTk7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//fsU1s0i8Yx+WFD+E21cXsc642oOseSGxBOtz6TKxs=;
 b=GMoYaMOhuu0p0I75meUSsG3mFozhsgdMG3ojWdzcPR3DzLc1NPZOTWwSZ0e8JC8tDifEZ5R4HnpvIEQpFXhijaceIhoPhZhjY0kY92mM7OkVzsKBDGH7VgRRMq13SK3WuhaHxy7bZKOd1z2z3sIw/jV3wfvqJ4/YkWv6HBClPM9fXIXkVrEw2TjwQKccRJATrXGzJbNEEsItGcyrxJLx2P4W6/lrZ8xlxWlMdmm9jU9yKAjlqYtUfnRHbwbugAtTpbavLIG21dfdhsPrn7SROOGo3M42P8Djk1cWjcQWxxcRLf7GXC1YHiKdJQ57eLpTaJd9Jg8aBprkYBwS42cmtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Mon, 18 Sep
 2023 20:55:18 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::cf28:4320:6c5e:aec]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::cf28:4320:6c5e:aec%5]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 20:55:18 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Hogander, Jouni" <jouni.hogander@intel.com>
Thread-Topic: [Intel-xe] [PATCH 3/6] Revert "FIXME: drm/i915/drrs: include
 intel_frontbuffer.h from intel_drrs.c"
Thread-Index: AQHZ58N+i+F2KaV3I02z9knxjNSKYLAhFVSA
Date: Mon, 18 Sep 2023 20:55:18 +0000
Message-ID: <483470deca793fb2bc68d663cc89e7166d2b1864.camel@intel.com>
References: <20230915105724.1025509-1-jouni.hogander@intel.com>
 <20230915105724.1025509-4-jouni.hogander@intel.com>
In-Reply-To: <20230915105724.1025509-4-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|CY5PR11MB6139:EE_
x-ms-office365-filtering-correlation-id: 46dedc4a-0a8f-4656-c0f3-08dbb8899129
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KNX86atIMhSZ5mybt68l9iILICkSq7IuHL3DRQH7QZdFPIHjjfYo3vZYbpQdlGJi/3VzzoIr9DHdYJeEknSut/3X9+yo+d9znom4J+grWSTjQVchg0/sKB2J6WQ40BW4aTdoLvM/b3DBOxIVpB37AXuY6Mvmracz4Vi0RuXsDpjoWVNOha003UyixcxNMtY0nRfaeC/s8jQ9XuAcLAqsuD3IPJu/Yw4fi+msfyCBCNFtsjl1ZCywvSBgn060vobHWCj4HRFSrIjAL+FIXkd+MYk+fwTzoEpPXWi05SHcjiuqRVqwTLNKZ6tgBTcS1sk6fQWGEDt9TQAJDQfxFAyY0Nr+MxWjA1Of88Xd3Ze7DEXo8wy8syPYv6LPumhJPa3lcKYF/bAmrofljfTE0Pi6uYavn63je6G5eREdppcZ6auBlqifI9CvwmdHNTmnai4P3CfvS3ni8NmoHR6WaZ1Z+g0R++AXx2IDHOYF0bX1W76eSMW6APVOn7XBG2MJYJZ4NAz24IuvlTr663Jx9eaybeha8Sg3Vb+LhIqpsg+w5K+YJd82WYm66n4xZfZ2GPp3usRIBRrgWynJGcgIvqa9zS8CjbViaQSP2zA2zHO/KlJ15+Jc7OtU6qh3Trse5HIH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(346002)(39860400002)(376002)(186009)(1800799009)(451199024)(83380400001)(122000001)(478600001)(38070700005)(38100700002)(66574015)(6486002)(6506007)(26005)(86362001)(6512007)(71200400001)(82960400001)(2616005)(4744005)(8676002)(5660300002)(8936002)(66946007)(66556008)(41300700001)(66476007)(66446008)(2906002)(36756003)(91956017)(76116006)(110136005)(316002)(64756008)(6636002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?enVBUmQ5THJ0ajRRNTZGU2pidGdKcmJiaUUrdjN0YjZXRlFHb0pmODZCVUgw?=
 =?utf-8?B?cjloS2ZGRmU2Z0VxekpQY3hML2FobURBVEpFbll3VUpKc3ZlcFRZRUNsSlpy?=
 =?utf-8?B?V2daYVRaVk5Odk9xVWttU3RPZ3h2a0d3anhkS0NHb2hiS0pocE9sbzdCd3lH?=
 =?utf-8?B?SWRxSG95ZUtEUzFUV2UxZXlEVGhHQlZjTTgrZU5DRm5RK0cwcGluMFZKT0ZK?=
 =?utf-8?B?bkEyWjE5bXN0QUtTeVlqY3psamVaeW5LTXRnbHlKSExMRVFjaVhnYXR0S3V2?=
 =?utf-8?B?alp1ZklCNXAzY0FRNnBJbHZncE1qV0RsZy9NazlORTh1UmxTWVN3b3JZQnl1?=
 =?utf-8?B?MmdDK1JhcUtkZE9JVFJvL2ovZ2RMbEw2YVAxcmlXVERpZDNFdFpPNFhOUmZP?=
 =?utf-8?B?dEcwZFY1dkV3enhUSEIxbmpEL29yMUtGUlhaQXJmeFJIVFBIZUZZLzh4UTl6?=
 =?utf-8?B?eC9vQjVTZ2dINytCMy9jL20rcTBtVEVnUmF0N0t6ZnRRdUEySlZDVXNLS3BQ?=
 =?utf-8?B?U0ovT0lFSlZHamJWU0kvbWdLN3A4OVIxKzMxVnU3dUtvWlpIWFNwd2FIVU11?=
 =?utf-8?B?OWt3WHBVVjMrZlVZVkNlN1huSDFTMDkrODZaRVJXNkNLSFBveUUrWHlQTjRD?=
 =?utf-8?B?Vll3TlZyeUVaMG16bkJhaXIvVXhlT2Q0N041RllXUGlOUStnUS9KclJnbFN6?=
 =?utf-8?B?eUhwQkFRMDV0L2hVSDk4dmkwK3diVnNlVng5R3F3WEIrKzRFV2E0NGdqamFr?=
 =?utf-8?B?NmtEeHlMei9lVzBiSE9JbmVOcXJnc0d3bHE0dGVMS3NhaDZ2cGRZODIvUUxM?=
 =?utf-8?B?L3BnUW1xVlFVUGR0d3B4TWlldUcvQXk1NVpOMXhHbnNlNTRtclFrRzlLaU5l?=
 =?utf-8?B?QjJCZTd6KzFxb2w1TFAyb3Z3b01CRVNmbk5UVklBVjBITURqN3MrSUdnV1Ew?=
 =?utf-8?B?emNaMHJuWGtRenNtZmFGSzR1cVMxNmNDb2RHdTJyNHNwUGQvcEhjcU05RjVS?=
 =?utf-8?B?WTAwVVZld2grNHJzOXRiN2VLWlZhZW9HbWxrVjJQODVpcUZTb1A4T3BSenU3?=
 =?utf-8?B?TDJZcmN0U3NvMitvcWE1allaanVwb2k5cE42SlZoZ2NVQ0laV1RORnZuYTNr?=
 =?utf-8?B?NGhGNGRSNDJqcC9KK3hFQm1sdWpBN2c4N2tBUDZCc296Rm9RbUY0aDI1QUJw?=
 =?utf-8?B?WEs0SWRnK2dJY2NBZDdKdXRRQWFINUo5QUE3cDhXSXh4anNvL0s1M2xCNEgw?=
 =?utf-8?B?Yzg2YUwzVDVQZzRNVDY0L2F0ZlJZRUU2WEcyRlVrNUJzWVlBdUtnVU5BOUZL?=
 =?utf-8?B?aDFlb3pIZFMvVWpUSkJPS1NLb0M5dVdjVzU3VUZlT2YvL1dwL2lWZjFDck9a?=
 =?utf-8?B?NFZBUkM3aURVenRxaUwwUnZaSkgrSGxUM2VVK3VESzYzaWdkcWNFeC83TWFj?=
 =?utf-8?B?L2FtU1JNNVZjQUdrdFZON1lJS3F6dWVOMjZiUk84MW1SUzR6VngrUTJpUDd1?=
 =?utf-8?B?M1pCNUJyZVlGNjBPc1k1dUk5K3pNYTlyL3lUWHJzTWZpOWI3S2JWd0NnR25U?=
 =?utf-8?B?ZDNiN1MrcG01MlVQVU4xMTdWcDBycXg5TVA2S09SOTk1ZVJYUVBlOHYzVFhi?=
 =?utf-8?B?dzJSUGFSSi9STVI5N0hiMnRrWmhnMGpBMzBZaThkdHh2SjJObk5HT2I5dThL?=
 =?utf-8?B?OVRGMlhYa2RSUDhEWmRQU0VmNzNkYUN1L0NXOFYycUdCOFV5NXR2ODJIaW9x?=
 =?utf-8?B?dnZKbTlrMGgvZWxYMGF5aVJKNnZ1SUV5SnlmZnIwVUlnMWoyWXZGb3lWNTY4?=
 =?utf-8?B?TkpvdEE3NWZ3dXVRelZwc1N3TWY5djQ0U1M0a0h3QTRlRm9VRjZMcDc1czV0?=
 =?utf-8?B?MndPTGw4ajZsWGI0djlUelJGWWhMcUVRR2JDR3FtS0hLVFA1dGtDeHNQT0Ft?=
 =?utf-8?B?L3RnbWk1UFZMelZvZTE4V2V0eGFDMzlHV0NIekVzVVdibkJFajZ3NlFEUWM3?=
 =?utf-8?B?ZnNaREJKQ2FZZTdiUUJPbkFEeDZUSDRVSUpNUU1EOFVqcThvUi9YLysrOGFH?=
 =?utf-8?B?VUlUNFE2OFVDamM1UFNEV0JYMmk5Vm41cHFMbklTektxZ1hHbjZCaUt0Nm9n?=
 =?utf-8?B?TmNRaWhSSHlpRzVDZGlrL0J2ZmpSVnhIZnNUckE3MHY4VHBjci9SenVYSGxm?=
 =?utf-8?Q?3nE1UlTOb1GmXBM44tdo3t4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E18B36A83D1FF240AC062179294FE11F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46dedc4a-0a8f-4656-c0f3-08dbb8899129
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2023 20:55:18.8154 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JqXqluX0fT9LyL/9Wg3XN1dh2WxT5CRXlQd8KLc3UnqpJG8AgNqnP6sQifuHMFIUn4kswS0S/dVtPCEJmccX6FT1Q7xggYj9CZJesUmzINU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6139
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/6] Revert "FIXME: drm/i915/drrs: include
 intel_frontbuffer.h from intel_drrs.c"
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

T24gRnJpLCAyMDIzLTA5LTE1IGF0IDEzOjU3ICswMzAwLCBKb3VuaSBIw7ZnYW5kZXIgd3JvdGU6
DQo+IFRoaXMgcmV2ZXJ0cyBjb21taXQgNTdmOTQxYTkwYzJjMjBlMzg4NDU3MWIwNmM0YzNlMGEx
MDc5NGFmNy4NCj4gDQo+IFdlIGFyZSBhYm91dCB0byBiYWNrcG9ydCB1cHN0cmVhbSBjaGFuZ2Vz
IHRoYXQgaXMgdGFraW5nIGNhcmUgb2YgaW5jbHVkaW5nDQo+IGludGVsX2Zyb250YnVmZmVyLmgg
YXMgbmVjZXNzYXJ5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3Vu
aS5ob2dhbmRlckBpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZHJycy5jIHwgMSAtDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24o
LSkNCg0KU2FtZSBjb21tZW50cyBhcyBsYXN0IG9uZSwNCg0KU2hvdWxkIHRoZXNlIHJldmVydHMg
YmUgbW92ZWQgYWZ0ZXIgdGhlIHBhdGNoIDQgaW4gdGhpcyBzZXJpZXM/IFdvbid0IHRoYXQgY2F1
c2UgYnVpbGQgZmFpbHVyZT8gT3INCnRoZSBwYXRjaCBkZXNjcmlwdGlvbiBpcyBub3QgYWNjdXJh
dGU/DQoNCldpdGggdGhhdCBjaGVja2VkLCANCg0KUmV2aWV3ZWQtYnk6IFZpbm9kIEdvdmluZGFw
aWxsYWkgPHZpbm9kLmdvdmluZGFwaWxsYWlAaW50ZWwuY29tPg0KDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcnJzLmMgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RycnMuYw0KPiBpbmRleCA2MjgyZWMwZmM5YjQuLjBk
MzViNmJlNWI2YSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kcnJzLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
cnJzLmMNCj4gQEAgLTksNyArOSw2IEBADQo+IMKgI2luY2x1ZGUgImludGVsX2RlLmgiDQo+IMKg
I2luY2x1ZGUgImludGVsX2Rpc3BsYXlfdHlwZXMuaCINCj4gwqAjaW5jbHVkZSAiaW50ZWxfZHJy
cy5oIg0KPiAtI2luY2x1ZGUgImludGVsX2Zyb250YnVmZmVyLmgiDQo+IMKgI2luY2x1ZGUgImlu
dGVsX3BhbmVsLmgiDQo+IMKgDQo+IMKgLyoqDQoNCg==
