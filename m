Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8480C47258
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 17:19:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F5C10E0CD;
	Fri, 12 Jan 2024 17:19:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AFBB10E0CD
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 17:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705079984; x=1736615984;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=tCqG6juOB+e05pVIia1vsw/coNV+z1qvnbwSju5yU5k=;
 b=aVgzCpQ2UyyWaqWLWywJF+gHy6cUxCQdrI3kJSTqkS2GbkBy0HUA5Rbu
 O5SjL3Tkd5HaiU6JkcST+Mxp6iwpElpNDUYjvEw9I3JGGkQ01V3ZZDpMA
 H95o2xK6mfE0awVxhcmERkem+4wH3KkQW+y2rFgkmBYI9yAB2ktEFJjOL
 1tdCuLgisoXkYITzJ8a4vKil0KFyu1mP6R9ejGyi4nJu2L7nZp+u096pJ
 W1FaL1wNPEcDF/XOFjYcABvCeZPmNpMko7njTlPvaqb1X7QMuPOk2IlNV
 m8Ei/AlswTKP5xGbdcFsL/4YwvN3J5bAsoJlsJpD/c3MoLzcK97pbU0Hq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="398106462"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; d="scan'208";a="398106462"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 09:19:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; d="scan'208";a="24768403"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jan 2024 09:19:43 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 09:19:43 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 09:19:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Jan 2024 09:19:42 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Jan 2024 09:19:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KoOj3f4lvTzo8ca1eq3zeykWjuAcAjdJTqtCfw6V8aGxfYmGUQRp3nMxHzS1qD4V7UdIk1dQe0nHxx5FdBEkVz9IhRapKj4BqKSjDTr77VIrCHVnfnSGOnzHBBL5PnXXtbG/F8ICUiJqPZL77tu+pk+tx/fJsyvtCl4mV7pPySRSlRacGuh6xN8BjtWExXpgnDIfTh/V+DdY4VYaZtVHzGOWny68GFq+j/P4uVXcYwlAzEXP9QPd0uR8xnd4a+Ed0fcZOaeM1nJMNvgS8JZt4LxRtzvnbhNt7+iEPo8do43XTchl6B+IYiylWsCDJZQZOiKjTTYzORgvvDOUiroEmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCqG6juOB+e05pVIia1vsw/coNV+z1qvnbwSju5yU5k=;
 b=PAaewsiKDQOGG6yfO0JbO1hfuPtFQxLB7bPsSUL7vwWxzCo3CpwTTcvy/qPaECkVjDeV2p9hT3GyHuf82DjkiuBCjgEDhvj9frbGXRJu6FPHm3C7qq243iVLeVKgO53GPbN30UzB1qrE2r1Kv8ReF0nMDOYTq1UHOEXRDlrlWpx7Cu3k4U6filJDHBkKdueUNShJQJsXC+KVmDH+y/7nRK3XJQIP6CnYamxL4/zbV4t8IUAScc6vQY6uc+3L3h0xQjAuTSj7xh7fb7Ti3wXp93JwAQDWOPaHve4o6YqM7goX/b7WYEvqyP0XUj8zC1phhWr4jDkNzJ4I2HXUOIIY1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by MN0PR11MB5964.namprd11.prod.outlook.com (2603:10b6:208:373::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19; Fri, 12 Jan
 2024 17:19:38 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf%7]) with mapi id 15.20.7159.026; Fri, 12 Jan 2024
 17:19:38 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 1/4] drm/xe: Add uapi for dumpable bos
Thread-Topic: [PATCH 1/4] drm/xe: Add uapi for dumpable bos
Thread-Index: AQHaRVTAzG6ihv8EBU2ECLp1QXZ5VbDWbF2A
Date: Fri, 12 Jan 2024 17:19:38 +0000
Message-ID: <da54a2ad4a494d70dd550b3561c61b20a18d119c.camel@intel.com>
References: <20240112124148.166954-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240112124148.166954-1-maarten.lankhorst@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|MN0PR11MB5964:EE_
x-ms-office365-filtering-correlation-id: 68933d7a-3075-4868-369e-08dc1392a7cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u4xxQ/ia/anAFiy1Dvk9tIhnz0QPKiWWus6Fo78j1/iRMDK6mWn5DQS8z0FteKG5h98PdO3PzM4l9jB1RfwXRNkJYvhXHMwC/UxUYTHTMFJQT5ANw/eSMJZnJyHG95mEkuTLyRIMhXJF8JUBZYe+kQ5LIGKUWICSj2h96KHWriQns6lMK4DbXsWShhpyHP6Ux189IvZQO+DtNZZ2TkR7f+XqBnn+JGb7vwlAH1EX1FT+VBiVAdP2gHnhYPhwNeP+vvKwsRj4bGshVxiyGrU0Tb/q+1aT6qNe8YuyY7tkVuInGA57QpL9BbtYPPdqaMJGmQO5l9Tf4yqMY55OL0OSLzfbnNitvnUM4tVXGkqPq1CUuZe9px+v11Vs14N3uoXIIa/ZDLYiZ5afuyx5lrDLuLIHrg0ay3C0A686StmjdVG278vFiTp/3PyvIBj3Y/XSKH0IUlbavDw8B77jlXT3dB0PeFccrPn+2YK3A6y11KP0rLbTBBr9xL3Z1mcYp7ZxJONQ359/s5RwFb3HnWhZ31eJ5RsqEvQJZhxRolOhHCh1LjtuhLJMVGdB4tbniBlEEoTpH7bHGfS6ed4B2aeDiwv4RB68e7/lMwU1W/nfLRSRW1nP5rvHrA2r8yRMFdnf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(396003)(366004)(136003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(71200400001)(82960400001)(6506007)(478600001)(6512007)(26005)(122000001)(38070700009)(38100700002)(2616005)(86362001)(36756003)(41300700001)(2906002)(6486002)(76116006)(91956017)(8936002)(5660300002)(83380400001)(64756008)(66946007)(66556008)(316002)(66476007)(8676002)(66446008)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bng4M2VLTitsY3hpd2pWWUZVWE9sci9hdzF4RC8zY29DY3J5em4zRnlwZ3NI?=
 =?utf-8?B?cXNITDl6Qkk1cTZqL2t1MnlkdktnakpkWmhCZDR0c0pxYnBDTzNhYmVxWkNZ?=
 =?utf-8?B?K0ZlWDJoOE1sN095VVZaQnk5WFExM0tEeFFZTEFQNjJqM2hkSG9BVWo5T043?=
 =?utf-8?B?MDVNSEdSQ1lteVNuZ1c2eVdiQUNIdkVScDJ4OEpJM0JnQ0M1V2s0MzI3THpP?=
 =?utf-8?B?UGNMMXNLeU5RZ2YyUHkyYkZPMUtlY1lkRzdxWUNHZ0htTVRUV3VGV2xWbWRj?=
 =?utf-8?B?NVg4OHMveU1BMzRhY3lPSmZUTzd1c3FrVmdoM2pEakVnaWVFYllPRGdsOVFY?=
 =?utf-8?B?bkFRb0hTaG1qTFdmVzExeksvWWhLWklzV2JYOUNTcGhhN3JCWVIvU3I5RWlq?=
 =?utf-8?B?TTBrWCtweTIvVlhZamo5MkxoOThlaTZDQ3JNT3VHS2lVekdmdEdRTkdaOGVj?=
 =?utf-8?B?UlB0OWR4VDA1dEwvZitzMVJEOUtnQ290YithYUgyUXpLNHp0VVpUV2hWZlV6?=
 =?utf-8?B?bGN4SWs5Y0U3L2hFV0NxMjNESU52Y21OODBWT28rOGpxRUUxUHJUT2liUHBC?=
 =?utf-8?B?d1QvVnRucGcrTFp4UFE5WEZRLzJOMXpZakJ1bFF5Vk1kTkNPWUJYeVRNQVBu?=
 =?utf-8?B?ZUx0QjBzeDgyZXBUM2dqTXFKRGNQbk56WTVxdDM1QzNjbzVuS3NTWWpLQ3VW?=
 =?utf-8?B?VFhIcmxQdTFWdm1TV29yYUttaklSL2NSc1R6SEdNTGg5WkE3T2RhQmRRSHNu?=
 =?utf-8?B?dDA4ditvWEJPdmJFcXh2S1JGbXlSOFEweDBLOUlsYjNIdTdrM05ERzBCVzNo?=
 =?utf-8?B?Y3dMTksxTXVoeFJKZUxORWh1WjRKZk5tTzJNZzhLOGg2aVB3ODZ3L0Vac3g5?=
 =?utf-8?B?MklyaWRSSHU1dHl1SkxZMHRVQlBHT2pQbXIvOG5rZHF0NUc0UEJpN3pSa1VJ?=
 =?utf-8?B?UEhjUjhDUlU5SlJEN1Y5bTNJUjdFaGFEc25lMVFTdVdMRC95UDhMZXJ2Z3Zw?=
 =?utf-8?B?SUR2UHhxMWM3WURwL05NNmhEc0ptY0dSbXpkZHp5anh5cmd5UzNJNDQwdVlV?=
 =?utf-8?B?UllzMzBQdCtuZTBLWU9QS3lBaDVVL3MycGdEN3ZZWTMrYmN6NkdNYnI2elJ3?=
 =?utf-8?B?WWFBWGtUOGIyQnRFN09ZMCswUDZlSmNTQm84RzEzdWdBSDZwbDlYSVUzN0ZS?=
 =?utf-8?B?ZHdDcXl2cFhMVkhpRjlLc0FDOUJ6S0cwR3BpcjdqZnV5cDJYS0xEaCt2cXdz?=
 =?utf-8?B?OGxQdEdzZmtERFI2TGdQOGFLSkY5YWJRZ2UzS0tmYTV0YnQwRkhCZW1IR01i?=
 =?utf-8?B?enlQdGFHOEV4dFN4Uk5lNjhPVzY0UmdNSjI0aEsyZ05QaG9WcTlpbng4SmMw?=
 =?utf-8?B?V09ZMDRWNGE3blN3YkJGRDF4djZYUzNYVXF0RTJUMlhjV3F2Q2FRMnpnS2E1?=
 =?utf-8?B?R2VzaFgzOEI2Tk1xVGZiaTBqejdIRjBwT3RuOEFnSzhkTWdRT0MwNHJSeEFE?=
 =?utf-8?B?ZUVHVHVnV1F4R3J3RElIVjZsWlVYdTJOSGxwVEhLb0NkZUtNZVdSemF6enVx?=
 =?utf-8?B?S3BFS081eGRXY08vU25uczIvdjhnZ2x4QlVkMmp4VGRxay9lTm40akVJSTN6?=
 =?utf-8?B?THpMdnQ2NXErS2FnUHdLM2xac29JZ2ZwY1ptOGg2YndRWkswL3NDdTFVTTda?=
 =?utf-8?B?VHFvcTBDWFVra2pmbHp2V2FhMEtQNDF6WG5PWUJ3dXQray91SG92b0RFWmVa?=
 =?utf-8?B?endpdkhsdDh6bUVtRUJVQ1hyUFFrL0doY1ZSeks3YjdDKzJzS0xsZGZKTzlX?=
 =?utf-8?B?aVUyOHphUytzU0g4ZHlOWVpVT1lmYzBBaVpxbE5wbTkwaXJzOXgzYWV6Q3FB?=
 =?utf-8?B?NEE0ZXlGYUV0RFpMZ1UrR2x6emVuQk41QkthYnIwUndZMzd0ZHpGSVNXdE1X?=
 =?utf-8?B?TmRMN3ZydTE0M1Q4b2d5YmNoS1ZiS0EvQndQMVZBbjk4UFM2WDI2VUpiMjRm?=
 =?utf-8?B?ZnFDUzEyWm1LKzlwakVNWkMrRk5obStFVmFHdUo3SkRObE5EOWZUM2pnandy?=
 =?utf-8?B?eC9CbDBrWHJyanUwbkFyUWVOaHRWQ3JTSXZKcktPQm9Tay8xM1RINmI4VTRG?=
 =?utf-8?B?dEFzaHdNTVByRVJIQUFRVldyVStsYkEveE1sUjJMTTBOcGVieVF2cFFwNnRr?=
 =?utf-8?B?TXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6855C33BF2629C4880D13DCA5B0425B3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68933d7a-3075-4868-369e-08dc1392a7cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2024 17:19:38.0836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e88rjbMoGoHswUOIMMOb8puT6LQIIMOMmsd6BoLB2Hr+e23rJ7u68bkPaTRUbTe+Q2/HZ/mZ0h1QvPz3nWZMvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5964
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDI0LTAxLTEyIGF0IDEzOjQxICswMTAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToNCj4gQWRkIHRoZSBmbGFnIFhFX1ZNX0JJTkRfRkxBR19EVU1QQUJMRSB0byBub3RpZnkgZGV2
Y29yZWR1bXAgdGhhdCB0aGlzDQo+IG1hcHBpbmcgc2hvdWxkIGJlIGR1bXBlZC4NCj4gDQo+IFRo
aXMgaXMgbm90IGhvb2tlZCB1cCwgYnV0IHRoZSB1YXBpIHNob3VsZCBiZSByZWFkeSBiZWZvcmUg
bWVyZ2luZy4NCj4gDQo+IEl0J3MgbGlrZWx5IGVhc2llciB0byBkdW1wIHRoZSBjb250ZW50cyBv
ZiB0aGUgYm8ncyBhdCBkZXZjb3JlZHVtcA0KPiByZWFkb3V0IHRpbWUsIHNvIGl0J3MgYmV0dGVy
IGlmIHRoZSBib3Mgd2lsbCBzdGF5IHVubW9kaWZpZWQgYWZ0ZXINCj4gYSBoYW5nLiBUaGUgTkVF
RFNfQ1BVX01BUFBJTkcgZmxhZyBpcyByZW1vdmVkIGFzIHJlcXVpcmVtZW50Lg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4Lmlu
dGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYyB8IDggKysrLS0t
LS0NCj4gIGluY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggIHwgMSArDQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+
IGluZGV4IGE3ZTdhMGIyNDA5OS4uMGEzYjljMGFkNzcyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfdm0uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYw0K
PiBAQCAtMjY4NywxMiArMjY4NywxMyBAQCBzdGF0aWMgaW50IHZtX2JpbmRfaW9jdGxfb3BzX2V4
ZWN1dGUoc3RydWN0IHhlX3ZtICp2bSwNCj4gICNpZmRlZiBURVNUX1ZNX0FTWU5DX09QU19FUlJP
Ug0KPiAgI2RlZmluZSBTVVBQT1JURURfRkxBR1MJXA0KPiAgCShGT1JDRV9BU1lOQ19PUF9FUlJP
UiB8IERSTV9YRV9WTV9CSU5EX0ZMQUdfUkVBRE9OTFkgfCBcDQo+IC0JIERSTV9YRV9WTV9CSU5E
X0ZMQUdfSU1NRURJQVRFIHwgRFJNX1hFX1ZNX0JJTkRfRkxBR19OVUxMIHwgMHhmZmZmKQ0KPiAr
CSBEUk1fWEVfVk1fQklORF9GTEFHX0lNTUVESUFURSB8IERSTV9YRV9WTV9CSU5EX0ZMQUdfTlVM
TCB8IFwNCj4gKwkgRFJNX1hFX1ZNX0JJTkRfRkxBR19EVU1QQUJMRSB8IDB4ZmZmZikNCj4gICNl
bHNlDQo+ICAjZGVmaW5lIFNVUFBPUlRFRF9GTEFHUwlcDQo+ICAJKERSTV9YRV9WTV9CSU5EX0ZM
QUdfUkVBRE9OTFkgfCBcDQo+ICAJIERSTV9YRV9WTV9CSU5EX0ZMQUdfSU1NRURJQVRFIHwgRFJN
X1hFX1ZNX0JJTkRfRkxBR19OVUxMIHwgXA0KPiAtCSAweGZmZmYpDQo+ICsJIERSTV9YRV9WTV9C
SU5EX0ZMQUdfRFVNUEFCTEUgfCAweGZmZmYpDQo+ICAjZW5kaWYNCj4gICNkZWZpbmUgWEVfNjRL
X1BBR0VfTUFTSyAweGZmZmZ1bGwNCj4gICNkZWZpbmUgQUxMX0RSTV9YRV9TWU5DU19GTEFHUyAo
RFJNX1hFX1NZTkNTX0ZMQUdfV0FJVF9GT1JfT1ApDQo+IEBAIC0yOTE5LDkgKzI5MjAsNiBAQCBp
bnQgeGVfdm1fYmluZF9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLCBz
dHJ1Y3QgZHJtX2ZpbGUgKmZpbGUpDQo+ICAJCXUxNiBwYXRfaW5kZXggPSBiaW5kX29wc1tpXS5w
YXRfaW5kZXg7DQo+ICAJCXUxNiBjb2hfbW9kZTsNCj4gIA0KPiAtCQlpZiAoIW9iaikNCj4gLQkJ
CWNvbnRpbnVlOw0KPiAtDQoNCldoeSBhcmUgeW91IGRyb3BwaW5nIHRoaXMgXg0KV2l0aG91dCB0
aGlzIGJsb2NrIERSTV9YRV9WTV9CSU5EX0ZMQUdfTlVMTCBiaW5kcyBmYWlscy4NCg0KPiAgCQln
ZW1fb2JqID0gZHJtX2dlbV9vYmplY3RfbG9va3VwKGZpbGUsIG9iaik7DQo+ICAJCWlmIChYRV9J
T0NUTF9EQkcoeGUsICFnZW1fb2JqKSkgew0KPiAgCQkJZXJyID0gLUVOT0VOVDsNCj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2Ry
bS5oDQo+IGluZGV4IDUwYmJlYTA5OTJkOS4uMGY5NzVmNTdmM2U1IDEwMDY0NA0KPiAtLS0gYS9p
bmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJt
LmgNCj4gQEAgLTkzMCw2ICs5MzAsNyBAQCBzdHJ1Y3QgZHJtX3hlX3ZtX2JpbmRfb3Agew0KPiAg
I2RlZmluZSBEUk1fWEVfVk1fQklORF9GTEFHX1JFQURPTkxZCSgxIDw8IDApDQo+ICAjZGVmaW5l
IERSTV9YRV9WTV9CSU5EX0ZMQUdfSU1NRURJQVRFCSgxIDw8IDEpDQo+ICAjZGVmaW5lIERSTV9Y
RV9WTV9CSU5EX0ZMQUdfTlVMTAkoMSA8PCAyKQ0KPiArI2RlZmluZSBEUk1fWEVfVk1fQklORF9G
TEFHX0RVTVBBQkxFCSgxIDw8IDMpDQo+ICAJLyoqIEBmbGFnczogQmluZCBmbGFncyAqLw0KPiAg
CV9fdTMyIGZsYWdzOw0KPiAgDQoNCg==
