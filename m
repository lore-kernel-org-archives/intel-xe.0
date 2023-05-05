Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF90C77B7C
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 11:39:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8350510E5D8;
	Fri,  5 May 2023 11:39:41 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF80C10E5D8
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 11:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683286779; x=1714822779;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=vKKDFqZOzpxuY+/3jrzgqs7as9di3OnshH+DTQTsCqw=;
 b=F4IWlQtESgigtOKA+pzGigfHP8zILwtJ7RUDvZ9RUdcvS6I5SJqMs6P6
 /nZVWleBGlzsGLCakmDiPhVHF2QAEWGt5KtzDBoIqsahleIK4fQ0Q5/yT
 bjE4UFfxodNh39NI8FqZ28aHtL57VszoLeYShwcN84ok42ZzTH0zuLpsR
 QuEoPidlnFNXu14vyWllG5W6wfxpATENI2AUe8hm/xujThkXTOWgrNcCL
 IQnshLO8W3lnAD5ZtwQaQuJdssL3OMvRaLJvaW2/vtcv20laIRbmfb/Wb
 k6SVxB8OXnt8Jx5o3ab7YxqqbJzmdKNr3btjCHAtONToDUTxil5slrbzL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="349228601"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="349228601"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 04:39:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="943825375"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="943825375"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 05 May 2023 04:39:38 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 5 May 2023 04:39:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 5 May 2023 04:39:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 5 May 2023 04:39:38 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 5 May 2023 04:39:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dRHL1y2n2gOOmM57h4cZMpaLqa7PvLzljoti2WGuaGgZMJMR5wo6/NQ/e8449yV6+dlj3wrHc5xZoWjqQSwZPOF9cl30RVkOD3HjnayGOH7fkNA1TF4OtzrZhreQAcr9C1PKpvVmIe3R8NwppO9BxW4kEjzLdHZc9nlzk0j2mWcKaZk3bcs140n4kwhVOv/DqDHKK04poW+iOQqI+OPYqu9VTEUNOk5fFO6yZM/mg03WcOMl0ZQBP1gq6iu8gVrbhjCdNzv2QnP7wyKtpoRS0p5+ZCPiMYAMj8TOCJ8SDF6ys+FHJHWemfMTy65kTa7IU0dNQbuSaVUlI0ybtLyKJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vKKDFqZOzpxuY+/3jrzgqs7as9di3OnshH+DTQTsCqw=;
 b=iNglcKDhMBNuSWReib+BkWGU94UFVrMJIq5zstPjon9qj0Qaq2ak7VUZVpdZi9adh2dARnJs9LoBAs78MA5+bPvgDpEoAZfB3Cz6iTauJV+jhL9QpK65v80AaIu0AHlH0vOudU0tVXspUY0ODTh4YLE1EDFeBWSOqKXXu/HnKogEf6qR7u7NUxGXf+QZj4rk9OfmOZG9w0Yg/WkjYjzHWMpsoqdb1MlGH//doIbYjMpXrIBo/MDrMBlHB/38hmvREoGawXq3y6DhCj1TlriF/S0TSAdq/2tTKV+LTdqYVU3rCduhUhZsBHx76MEU8gIxMfYsnfffAuCDg26oA0Szvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 CY8PR11MB7797.namprd11.prod.outlook.com (2603:10b6:930:76::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.26; Fri, 5 May 2023 11:39:35 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::2796:34e3:dbb9:fe97]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::2796:34e3:dbb9:fe97%8]) with mapi id 15.20.6363.026; Fri, 5 May 2023
 11:39:35 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Thread-Topic: [RFC PATCH 17/20] drm/xe/display: Use frontbuffer tracking for
 Xe as well
Thread-Index: AQHZfyv9mSvw4ra+O0uZLW+ZAiTo9K9LXtuAgAAvUoA=
Date: Fri, 5 May 2023 11:39:35 +0000
Message-ID: <1938e4fe9af28f2b1d575ab75c221ed45c9a9a86.camel@intel.com>
References: <20230505082956.2247875-1-jouni.hogander@intel.com>
 <20230505082956.2247875-18-jouni.hogander@intel.com>
 <fe8a4f66-4b29-205b-fb05-45a7784d9902@linux.intel.com>
In-Reply-To: <fe8a4f66-4b29-205b-fb05-45a7784d9902@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|CY8PR11MB7797:EE_
x-ms-office365-filtering-correlation-id: 2825d681-0f47-4b04-3c57-08db4d5d66ab
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A+6Cfw+o0um6s2aBJa/M13U8kAUVDVVXCFmn8yiLMTIhIU9Lt8mzXyshtgi32x17wcKM45coYivAjJFlNlUgtNEHH9+aE6L5Ih3nqCIgLqBJvEb2GqHEY4NGbhzfLc1j2y9Jd0ibiD0CD3Yg0eJiNNPlW7TmZvnyJ2baFSIg1CdsufTkKuirs5Tdl62Rv6tQwfJtYMOniMnbi2RykLIJBdfq29k/b8m+QoxqyfSR1z3jQrbwdfEczUTH5NuOc2gsa46fPrdza3lyTO08/R2mUKJ8gh5ZZ4iWsUzsgrKH7qTUi3RHOu6eQzQ6SCvhHcO1A8cjkBPnZ2QPNCJehADk3DDmpCakiY2tHwc1KLBktl0qT7h6iibq7WpTOtf/4okjmV1c++8smPwpoWgT16i2UAONRJJW6girBAu6RnP5LljLMrFSUJ0ETiUlR8DeEQXzvk6Mttw0HsivExeIy67MRL0dOfpU7NL/76Qwswq8hJfSq+wFAB2v/s53FSIshxzR/LhD49MgYO0eJSfUMrrQ5PMWXk9UxrZT7WbjzbMAGNroCp3aFfT2Q5gEp2hHznOhUJ52qhgxio+JosOqWcFkMGRb0roMSm/T7EjkFS2U0TO5KuXY4prZtEcgcbStbIko
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199021)(83380400001)(76116006)(66574015)(186003)(91956017)(54906003)(110136005)(6486002)(478600001)(2616005)(71200400001)(6506007)(26005)(6512007)(53546011)(2906002)(36756003)(122000001)(5660300002)(38100700002)(66556008)(8676002)(66446008)(64756008)(66476007)(41300700001)(4326008)(82960400001)(66946007)(38070700005)(8936002)(316002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2FwS1d0TmIzZTUrT3Mrek5iS2Z5bW83dExROVpiNm5yc3dXWFpJZm1OUzJR?=
 =?utf-8?B?VlhNSUkvcEo5NUg5YStXZitIdXdyOGZkOW1ZWld3dk5mcU9GbjROSjJNcDVI?=
 =?utf-8?B?d2YzWC9LeitHY29OTDg0UG5IZnlZTlFoSFlUWHAwZ2pyRVJlZzhjbnZyNzVl?=
 =?utf-8?B?azlIeW4rRE1EbU9iSnJxS3VhMlBKdUFHamN4bGRIdHZkUXdKbDIxNHZhVlAw?=
 =?utf-8?B?cGZIbXR2WllibDJGWnZIUjYrUkErTS84bGZ6SGlTbW9XdnlmLzUvbnFzSldI?=
 =?utf-8?B?MlZzaHVaYmVaTmtVekIvSURXVHluTG9wRm83QnRXQzZEbUxQeGV6eGswS2hM?=
 =?utf-8?B?Q1l3RzZUR0taYUx6TVFITDhUNWVML3pWd0ZmMnhWRllaT0FCSFNQSEd6ZTZB?=
 =?utf-8?B?WWlWelM3RkVWUVdqUzNOd0F6Uk9Qd0xxR0NHV2Z2TUE4bE1nTlNxa0h2YVc0?=
 =?utf-8?B?bE16V1VjTEt4WUlwZTMyRUtPRHV4QzEyWkF1aVdvZ3ErOUd0NDRValMwNUdt?=
 =?utf-8?B?cy90Nld4b053UEZwZk9obkV5NGhtUWVvOWlDa0lLUVExTHhpRlczRzNOS2My?=
 =?utf-8?B?U0VWeHJ0RGtBQ2hBRTBKbS93Q0tuVEQ1N29pMnZ2WHd1TWx6UG5CTWttWERR?=
 =?utf-8?B?ek9TOU5LRlJvRWlNOTFzb3hzcUFyejlPa2VSU2VzVUlrdzNqTXU1RDllMUpy?=
 =?utf-8?B?elNZUGNEUmd0L1RVWEN1TDI2NGZqekZaYmJuQkNadlBLcThxaWF3OEUrQXN1?=
 =?utf-8?B?TFZ0TEdtaUJ2cGdpOGppYjFFcDZwUmwveEZVNEpiQXNvSVlTb2Y0STB1djVB?=
 =?utf-8?B?QSt5WmF3ZTU3c1JleFBKZ01CL25qQTdqMzFqeC9rb0lMTTZLL25TYmVESHAz?=
 =?utf-8?B?eTROSnAyaWFrSnJTSmNCdmJXTUNzc3haVnd4UUhoelFnOXFFdmU0U0lOQW5I?=
 =?utf-8?B?b2Q4Si9ONE5icmwrWFE2RHlnQm1ZeDI2V294bUpFTUtYUnBYRlpuRnVFeEc0?=
 =?utf-8?B?dmFwT3FMZmpKeld1RVdEOWFtVkh1TisrMWxhU1JRZXJDWWlla3VTbDluSC9L?=
 =?utf-8?B?SnVRU2ZWQkU0aWNJU1NESkRYcGFUdlU2M1VKaGV4UERYblB3bk03NFJBbW8y?=
 =?utf-8?B?WDUza3lwSWdteFhXRnQyOXFXR2w3TDkvRnZIdVZ3UjhLVE9tcmpZNExCT2p3?=
 =?utf-8?B?M1BVTFVrL1QyYzk3WUhSem1XZGF2eUZzYjRLeTBlSEg1bE9zWTZvWitaUDk1?=
 =?utf-8?B?SVRtZzFreXgvZURVc2h5V0IyWXhBdzFEMXNxbG85aFh5MjNKQk5SRytnWktT?=
 =?utf-8?B?U2J2c21NMzNrb0hxeE13Ym9UeGtQaWlVUldIWDljdEhoY2lLNG5QbkZablh0?=
 =?utf-8?B?blhyVjkzVjVxQ2NmajFiT3F4K2c4WWlKY3d1ckkrVXhlYzlZMk1EdEI3Zm9S?=
 =?utf-8?B?encra0s1NXR5WGxrM1NaOGY2dTNkOHNkdTN6OGdvaGxJZkttc2cxNWNtK1Zv?=
 =?utf-8?B?RkQ4LzdicW9HRnZFRlhqRmpTYnhyMnFJMTArd2xjSnVTTGNpQzI3dkw5ZUpP?=
 =?utf-8?B?ME1Hdnk3bEtrSzQ4YXhGQUtpcUdmVFRhS05mR3FqRWpuTFZYSldwZTRmendu?=
 =?utf-8?B?UDVaY09BQ1p3OHhOSEFEbk0zektvLzhBTzhlUzhnU0ErY241OFFYanhpb280?=
 =?utf-8?B?WUN2TCtOM3VEY05hdXFuazBYT0wrejREc3ZsM2FLeERUZkdFQ2ltcHZXVXB3?=
 =?utf-8?B?a2RBc2ZjTHBYdlJkQ1VSSnFDaHY2L1FjbjZVNlVJUVhZWWl2RXZNdXhnejJU?=
 =?utf-8?B?WjNMa1FFY25EYUYrWkVxZFV5c0ZUYmx0bnFFR2IzTXB1UU9KUlpEY3lPWk14?=
 =?utf-8?B?YkU5bDBGYW9LT3pQOTlhKzA5OURXR1g3bHFJc1NQODhMb3E2eFRyZWtEcHZC?=
 =?utf-8?B?Y09EMkU2YmJlL2JxNUo2dzBaekx3TUloU2FVcW1OYW5pMkVwSFNtUnVTdEl1?=
 =?utf-8?B?UkQwYnMwWGVHYWRrT1plNmZpUFhHZEd6REVSV3d3dXlMY3F2TFJ5MjJ4R2I3?=
 =?utf-8?B?YmR1L0h2dTJnQUpkbG9YVTlVazNhbXhlQjdKWmJLc3E4dTllMW04cjIxb01F?=
 =?utf-8?B?NlZ3ZjhJQStoZTIzMlIzRGN6MFRsSlF2Z3lMWXRkQ2Q4ZGFydVFzQ2tRbk5j?=
 =?utf-8?B?UlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <887FE215FB76984CA6633569F279518E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2825d681-0f47-4b04-3c57-08db4d5d66ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2023 11:39:35.2794 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lZZ/oF4UPF44w8jEXGHemszeSCkNmOJsky+sAujPKUJ5+jemoiDUJS63WUAl7xOqxte4/5hPUnVYAqVQQ1Q7QDPxGNWl9PMK+pld5MbEOC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7797
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH 17/20] drm/xe/display: Use frontbuffer
 tracking for Xe as well
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
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIzLTA1LTA1IGF0IDEwOjUwICswMjAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToNCj4gDQo+IE9uIDIwMjMtMDUtMDUgMTA6MjksIEpvdW5pIEjDtmdhbmRlciB3cm90ZToNCj4g
PiBVc2UgZnJvbnRidWZmZXIgdHJhY2tpbmcgZm9yIFhlIGFzIHdlbGwgYXMgbmVlZGVkLiBXZSBz
dGlsbCBuZWVkIHRvDQo+ID4gcGVyZm9ybSBmbHVzaCBmb3IgUFNSLCBGQkMgYW5kIERSUlMuIEZv
ciB0aGlzIHB1cnBvc2UgdXNlDQo+ID4gZnJvbnRidWZmZXINCj4gPiB0cmFja2luZyBmb3IgWGUg
YXMgd2VsbC4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5p
LmhvZ2FuZGVyQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiDCoCBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2RycnMuY8KgwqDCoMKgwqDCoMKgwqDCoCB8IDEgKw0KPiA+IMKgIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmIuY8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfCAzICsrKw0KPiA+IMKgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNy
LmPCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEgKw0KPiA+IMKgIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvc2tsX3VuaXZlcnNhbF9wbGFuZS5jIHwgMSArDQo+ID4gwqAgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2JvX3R5cGVzLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fCAyICsrDQo+ID4gwqAgNSBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykNCj4gPiANCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcnJzLmMN
Cj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHJycy5jDQo+ID4gaW5k
ZXggNzYwZTYzY2RjMGM4Li41OTUyN2E0NjY3ZjQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcnJzLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2RycnMuYw0KPiA+IEBAIC05LDYgKzksNyBAQA0KPiA+IMKg
ICNpbmNsdWRlICJpbnRlbF9kZS5oIg0KPiA+IMKgICNpbmNsdWRlICJpbnRlbF9kaXNwbGF5X3R5
cGVzLmgiDQo+ID4gwqAgI2luY2x1ZGUgImludGVsX2RycnMuaCINCj4gPiArI2luY2x1ZGUgImlu
dGVsX2Zyb250YnVmZmVyLmgiDQo+ID4gwqAgI2luY2x1ZGUgImludGVsX3BhbmVsLmgiDQo+ID4g
wqAgDQo+ID4gwqAgLyoqDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZmIuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9mYi5jDQo+ID4gaW5kZXggZTYyZTFlMTI3NThkLi5mYTQ0NjRkNDMzYjcgMTAwNjQ0DQo+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYi5jDQo+ID4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYi5jDQo+ID4gQEAgLTEzLDYgKzEz
LDcgQEANCj4gPiDCoCAjaW5jbHVkZSAiaW50ZWxfZGlzcGxheV90eXBlcy5oIg0KPiA+IMKgICNp
bmNsdWRlICJpbnRlbF9kcHQuaCINCj4gPiDCoCAjaW5jbHVkZSAiaW50ZWxfZmIuaCINCj4gPiAr
I2luY2x1ZGUgImludGVsX2Zyb250YnVmZmVyLmgiDQo+ID4gwqAgDQo+ID4gwqAgI2lmZGVmIEk5
MTUNCj4gPiDCoCAvKg0KPiA+IEBAIC0xOTIzLDExICsxOTI0LDEzIEBAIGludCBpbnRlbF9mcmFt
ZWJ1ZmZlcl9pbml0KHN0cnVjdA0KPiA+IGludGVsX2ZyYW1lYnVmZmVyICppbnRlbF9mYiwNCj4g
PiDCoMKgwqDCoMKgwqDCoMKgaW50IGk7DQo+ID4gwqAgI2lmZGVmIEk5MTUNCj4gPiDCoMKgwqDC
oMKgwqDCoMKgdW5zaWduZWQgdGlsaW5nLCBzdHJpZGU7DQo+ID4gKyNlbmRpZg0KPiA+IMKgIA0K
PiA+IMKgwqDCoMKgwqDCoMKgwqBpbnRlbF9mYi0+ZnJvbnRidWZmZXIgPSBpbnRlbF9mcm9udGJ1
ZmZlcl9nZXQob2JqKTsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKCFpbnRlbF9mYi0+ZnJvbnRi
dWZmZXIpDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gLUVOT01F
TTsNCj4gPiDCoCANCj4gPiArI2lmZGVmIEk5MTUNCj4gPiDCoMKgwqDCoMKgwqDCoMKgaTkxNV9n
ZW1fb2JqZWN0X2xvY2sob2JqLCBOVUxMKTsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgdGlsaW5nID0g
aTkxNV9nZW1fb2JqZWN0X2dldF90aWxpbmcob2JqKTsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgc3Ry
aWRlID0gaTkxNV9nZW1fb2JqZWN0X2dldF9zdHJpZGUob2JqKTsNCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiA+IGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiA+IGluZGV4IGVhMDM4OWM1ZjY1Ni4u
MmVjYzkwMmE4NWEyIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfcHNyLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX3Bzci5jDQo+ID4gQEAgLTMyLDYgKzMyLDcgQEANCj4gPiDCoCAjaW5jbHVkZSAiaW50ZWxf
ZGlzcGxheV90eXBlcy5oIg0KPiA+IMKgICNpbmNsdWRlICJpbnRlbF9kcC5oIg0KPiA+IMKgICNp
bmNsdWRlICJpbnRlbF9kcF9hdXguaCINCj4gPiArI2luY2x1ZGUgImludGVsX2Zyb250YnVmZmVy
LmgiDQo+ID4gwqAgI2luY2x1ZGUgImludGVsX2hkbWkuaCINCj4gPiDCoCAjaW5jbHVkZSAiaW50
ZWxfcHNyLmgiDQo+ID4gwqAgI2luY2x1ZGUgImludGVsX3Bzcl9yZWdzLmgiDQo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvc2tsX3VuaXZlcnNhbF9wbGFuZS5j
DQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L3NrbF91bml2ZXJzYWxfcGxhbmUu
Yw0KPiA+IGluZGV4IDcxYmE1NDRlZGE3MS4uMGYxZTRlNjFkMzJlIDEwMDY0NA0KPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvc2tsX3VuaXZlcnNhbF9wbGFuZS5jDQo+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9za2xfdW5pdmVyc2FsX3BsYW5lLmMN
Cj4gPiBAQCAtMTYsNiArMTYsNyBAQA0KPiA+IMKgICNpbmNsdWRlICJpbnRlbF9kaXNwbGF5X3R5
cGVzLmgiDQo+ID4gwqAgI2luY2x1ZGUgImludGVsX2ZiLmgiDQo+ID4gwqAgI2luY2x1ZGUgImlu
dGVsX2ZiYy5oIg0KPiA+ICsjaW5jbHVkZSAiaW50ZWxfZnJvbnRidWZmZXIuaCINCj4gPiDCoCAj
aW5jbHVkZSAiaW50ZWxfcHNyLmgiDQo+ID4gwqAgI2luY2x1ZGUgInNrbF9zY2FsZXIuaCINCj4g
PiDCoCAjaW5jbHVkZSAic2tsX3VuaXZlcnNhbF9wbGFuZS5oIg0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfYm9fdHlwZXMuaA0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2JvX3R5cGVzLmgNCj4gPiBpbmRleCAyMjlmZWRjOGVhNzIuLmRmNWJlMDMwOTkxYSAxMDA2
NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm9fdHlwZXMuaA0KPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ib190eXBlcy5oDQo+ID4gQEAgLTY4LDYgKzY4LDggQEAg
c3RydWN0IHhlX2JvIHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGxsaXN0X25vZGUgZnJl
ZWQ7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoC8qKiBAY3JlYXRlZDogV2hldGhlciB0aGUgYm8gaGFz
IHBhc3NlZCBpbml0aWFsIGNyZWF0aW9uICovDQo+ID4gwqDCoMKgwqDCoMKgwqDCoGJvb2wgY3Jl
YXRlZDsNCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGludGVsX2Zyb250YnVmZmVy
ICpmcm9udGJ1ZmZlcjsNCj4gDQo+IEluc3RlYWQgb2YgcHV0dGluZyB0aGlzIGluIHhlX2JvLCBj
b3VsZCB0aGlzIGJlIHB1dCBpbnNpZGUgaW50ZWxfZmINCj4gYXMgDQo+IHdlbGw/IEluIHRoYXQg
Y2FzZSwgZm9yIFhlIGVhY2ggZnJhbWVidWZmZXIgY291bGQgaGF2ZSBpdHMgb3duIA0KPiBmcm9u
dGJ1ZmZlciB0cmFja2luZywgYW5kIGFuIGludmFsaWRhdGUgb24gMSBmYiB3b3VsZCBub3QgaW52
YWxpZGF0ZSANCj4gYW5vdGhlciBGQg0KDQppbnRlbF9mYiBhbHJlYWR5IGhhcyBhIHBvaW50ZXIg
dG8gZnJvbnRidWZmZXIuIFRoZSBmcm9udGJ1ZmZlciBvYmplY3QNCmlzIHNhbWUgYXMgdGhlIG9u
ZSBpbiB1bmRlcmx5aW5nIHhlX2JvLiBTZWUNCmRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZmIuYzppbnRlbF9mcmFtZWJ1ZmZlcl9pbml0Lg0KRnJvbnRidWZmZXJfaW52YWxpZGF0
ZS9mbHVzaCBhcmUgZWZmZWN0aXZlIG9ubHkgd2hlbiB0aGUgZnJhbWVidWZmZXIgaXMNCnVzZWQg
Zm9yIGEgcGxhbmUuIFNlZQ0KZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZGlzcGxheS5jOmlu
dGVsX2F0b21pY190cmFja19mYnMuIE5vdyBpZiB0aGUNCmludGVsX2ZiIGFuZCBpdCdzIHVuZGVy
bHlpbmcgeGVfYm8gYXJlIHVzZWQgZm9yIHNvbWUgcGxhbmUgKGkuZS4gaXQncw0KZnJvbnRidWZm
ZXIpLiBUaGVuIGUuZy4gZGlydHlmYiBpcyBjYWxsZWQgZm9yIHRoYXQgZnJhbWVidWZmZXIuIERv
IHlvdQ0Kc2VlIHNvbWUgYmVuZWZpdCBpZiB0aGUgbG9naWMgd291bGQgbm90IGludmFsaWRhdGUv
Zmx1c2ggc29tZSBvdGhlcg0KZnJhbWVidWZmZXIgdXNpbmcgZGlmZmVyZW50IGludGVsX2ZiIGJ1
dCBzYW1lIHhlX2JvIGZvciBhbm90aGVyIHBsYW5lLg0KDQpEaWQgSSB1bmRlcnN0b29kIHlvdXIg
Y29tbWVudCBjb3JyZWN0bHk/DQoNCj4gDQo+IEkgdGhpbmsgd2UgZG9uJ3Qgd2FudCB0byBjb3B5
IGk5MTUgc2VtYW50aWNzIGhlcmUgMToxLg0KPiANCj4gPiDCoCB9Ow0KPiA+IMKgIA0KPiA+IMKg
ICNkZWZpbmUgaW50ZWxfYm9fdG9fZHJtX2JvKGJvKSAoKGJvKS0+dHRtLmJhc2UpDQoNCg==
