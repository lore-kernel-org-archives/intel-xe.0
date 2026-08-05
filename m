Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D0AC55174
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 20:23:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B639610EFCB;
	Wed,  5 Aug 2026 20:23:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iEOEtB3D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E1BF10EFCB
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Aug 2026 20:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785961398; x=1817497398;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=qNj6d7YJK9WIxv65WhgvlJ/VBXveJOTFP4myRYDJt8M=;
 b=iEOEtB3Dl13cqL67KPmNrH8QJXl2TKEga+EfZD2L5yy4q7BmspFBfwfC
 mZAb16slGuDFVFW6EExkDYX16gNgV4/QdtXpj2ok8uoODuYVtwWlq01aX
 7b8sUQjpBhUfXpGvRPlqICfVzMAptq1a1TXpg+dK776wRkaO7cMV52Vbn
 QCosFdsT+mi12AGaIuh56/ooIt6D5gGK/FsgksayNT+8wq5JxPAVFUWZ8
 voffJe7D/LaHX5CTiLmL1TvlPCrnf3SSGBVq1qTbln784gVWWeFF0T64f
 IUBxkamhr5e4CQqy47LTTLv39farvM+V6f2imaRJfvkpTgZK0XAx7ncDT A==;
X-CSE-ConnectionGUID: 0jVSWD40SJ2WcIPJJ/DzYA==
X-CSE-MsgGUID: +bq8rHUwTBWHidP3/yxTuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86317728"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; d="scan'208";a="86317728"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 13:23:17 -0700
X-CSE-ConnectionGUID: pwuclpmlQcOMV7TkWCXZIA==
X-CSE-MsgGUID: 6EhGRm09QAiZSFkh+puLTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; d="scan'208";a="259280527"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 13:23:16 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 13:23:15 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 5 Aug 2026 13:23:15 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.15) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 13:23:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yX47269vfYMM5BZ3p3CBw1FDZyDyIfXlZC3yVJn+nZ4osOF99SwgmtHxRQucJt7T0yVRdjnRoKIgrReX+SPqr54Frj+zM5z0cxJ9ZPKXsHVUiPyhx7p5jxhnA9cWxJ29kbTEojVSj5Cf3Zs0iUgaNg5xhWV2llL07ydknAQv2jKcrcNyFcfRLAPKSY6QWzchBbir0AtF6DouISyp/GOt/BU8uLQaTz+51s1o6Biryb5WFRqT90z3ke2kEoOOm2qANW4k4ZKe+CARaXrP+yZcF26jgeo7n0wAwGm1ExVE5XiNk70wv3GiAPJzT71R5XEGSBTtObOJWNAxDCOeNr+Mpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qNj6d7YJK9WIxv65WhgvlJ/VBXveJOTFP4myRYDJt8M=;
 b=qnUUR+5mJ4tFrRb7yuuUfvWUuiSxnq7p9JYOX4Hn9GbFP8MNck7K9JaOXjUt3Txq5otQpbG+G8+MBWDWJ7n/ex5s9vWyWBSeg5F5L+MPmyUNrnYYJh/GgHM+YdD1UUMgxNE3GjnwKZ8PuLLqE/dVMYhTdos9B3SN8PYJStHIPNVEk4zYGj2kiiJEBF9+wZLTq/0rbpDii8S31uVNxKX+HzLtEi2iPwJNG1iY98iWadu434TRqhnW49BMcfi4OSfBoY7TKah7g7n8fZ6MOEVdSXVY59t98Wi1KXA8NbCc4udmeoyvSH2Zjz1qe5el2DWYmOLlxhOalrdsLLWwGywsAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6320.namprd11.prod.outlook.com (2603:10b6:930:3c::9)
 by DM3PPF5217261E0.namprd11.prod.outlook.com (2603:10b6:f:fc00::f21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 20:23:09 +0000
Received: from CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76]) by CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76%3]) with mapi id 15.21.0270.018; Wed, 5 Aug 2026
 20:23:09 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
CC: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
Subject: Re: [PATCH] drm/xe: Fix a bug in pc_adjust_freq_bounds()
Thread-Topic: [PATCH] drm/xe: Fix a bug in pc_adjust_freq_bounds()
Thread-Index: AQHdI5c1Jg25m0EyjkyRSaFl7Rlu4LaP6UWA
Date: Wed, 5 Aug 2026 20:23:09 +0000
Message-ID: <33e1b47caf2f450e7e80880ba51c634951082fe9.camel@intel.com>
References: <20260803222107.1508812-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20260803222107.1508812-1-vinay.belgaumkar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6320:EE_|DM3PPF5217261E0:EE_
x-ms-office365-filtering-correlation-id: ae9d5f70-ce4a-4971-21e7-08def32f5daf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|38070700021|56012099006|11063799006|3023799007|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: LvQVI9M567bO7MJBtKHrESXxtsjbAkH2HuKTOZBEanEv22JqcWHXCaYXFdbVSNxQ6/e42chWsK+NetNGdcpI8pD/3rOMXiAYJtj29Be0KusGj7yNDG09KgPPbfeFUP8R0MI/q+DJre+ijriBqcwCU4F29B3aNdKcOPXRcOjGdMaGpXfypPnPIhLnaDxTMRzHmWqZxWrBxYD+8Qe9+ErtOmsFiQlB2UQ9E27OmjE2AWwMHbC+wyATEsJ2p0t3RtVhEkVow/fEjt7ST0O4h+l6HAnrxwU6qlj6pE4BHbvwhFoaltmk3IXJERRuNvaI1ToHi0MOC8XSO3nrth/N4lwxFZhYg8sIP91fo8V6+rDw7L7Aca2Mjt2xY1XtcXYCL3/QP+4GuZx/oqogOQTsq5O40SJU/MGjCh6LT+tcfbehbh5NjfbjwCHrPAoevdBCNIGWk4/EBK0SHykw3WFDrGzWSjYfGVI8P3sZHvPoILamU0wVKUalHj9dVT5k5v6ncj2to0qotWx6r4kFBRYNjxyzVutBPMYZUnrecxIpNmhx+6tpQYSuoJ0wfHgRUAvCPQR3Wl11ES8UJUaI8WfSsjo4VGSgJdy+l+91ijz39gGET9NKeSb/heOVeLheU8Jc85hpxO91PQHaAAJk/fU8V/ynKrkiqQDUSOJeE3wZpmFtKEHgQHA8bvdhAJgOxwCGXV1PG1fXI34swmjvG+X+zKECYdacu13erGH7npkAiJzLlLw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6320.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(56012099006)(11063799006)(3023799007)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Um9FdEU3dnM4Ykc2ejJJSXBSSHZUOUMyenB2TFArNlNXWVR6eG5qWVRvcU96?=
 =?utf-8?B?Z2FxSWZoNjAvbElNM0JxMzEwZ3BRVEk5SXRqckw0ZjZyYjZsbjFBajR0Rmxk?=
 =?utf-8?B?TVNHSFF6YzJoMFNrUzlpa2hzNEdNWVorbWtxb2ovV2xlTG1FWkFyeWEwQkZI?=
 =?utf-8?B?azlDaXNMMmplL1Vsem5jOEFqWTR5MytCcURkR0YzV3p1ZTlCN0hBWWJYbTBa?=
 =?utf-8?B?Wlo2ZjVDTHBOV01oa3FiSk9VWVk4aVl1YThCMWh6Yms2QkNEWU5zMk9lY2hU?=
 =?utf-8?B?akVoYmY5VWg2cW42TUNZQm1XK1dnUjVVS2FLUWg1bFBZc0NOcThGYW5JQmZt?=
 =?utf-8?B?RW5BTi9qdmZIaGVTamNEVHZaQjZvNHBNYURIUXVGdDBxbjE4NlZYMWhPcURj?=
 =?utf-8?B?aklyVUJsVjk4aW1JdzVRZEx0WU1weDdVRGtFZkUwcWpIcGVaZmFOZGtyOEJL?=
 =?utf-8?B?eFd6VTVoSWE2UFpBTmhNOTQxdVVBWU8rWENmcVRRbXQzOEVBOXZtbE5zUnc4?=
 =?utf-8?B?d0Y3M1BXeUdGbFNxU21qVXZrR3BhUTBGTmxkR3FUNVdCS2xMOW1oMndNMytQ?=
 =?utf-8?B?TmVOTGQwRFA5eDNaaUltMXVteVNEYVdDYk1qemJUZGRLajFnU2tFT3VsTThq?=
 =?utf-8?B?dkYvMXRnZTEzWHRURlUyc1JGbHpxRSs0SEpQK2c5Q0RIbGhVZjQ2SGxQUWxq?=
 =?utf-8?B?dG1vT2JRMzVMeERSZFBOeCt3VzhMdW92TEhYcWtpeVI5L1NoblY4MWdtQURL?=
 =?utf-8?B?Y3FvaGxRaE83T2s5cEJQZFo1UE04cVVFRTBMQjJTbnNMU0Q2MFhMVTJJSEsv?=
 =?utf-8?B?d0RaWjMzenlpYzJ4eUdzZjY0RFVrNHNvQ1dCNVJEaEw4WmVOWEkzcmpERXFG?=
 =?utf-8?B?aFU2S3MwT0t3Tlc0UXRyUU9XaGtJVkxkM29Hc0xNZUZyb2pqdVAwSTJ1eW96?=
 =?utf-8?B?eWJKdDRHTEdTNFoyU3cwWEZIQ1BOVWlsZXBMaEE1cy91SDV4VE9JQy91RWk1?=
 =?utf-8?B?WGNZaUdqbU5sbXRZOGxSOHVOeHdyZ2NJYWpZdEtJYi9jQXlraDZ2a3lDSC95?=
 =?utf-8?B?UjVmR0lJWURMTUt0Rm5pZ1VIUmFHYmhxMHI3TDdNV05rQTZWTXJtL1VJL2NC?=
 =?utf-8?B?dUZZaTVJenpzcGZTeVVWNEF1Yld6aHV5Y1ZReE1xeU1xck14WEV5VlBPbFJ5?=
 =?utf-8?B?aDZkV3lWak9PVmNJKzNmWEZBRENSTENKLzBUSmo0dWFOR2lKU0pCeFdaWTBZ?=
 =?utf-8?B?TjYvY01aOHczK2VSenV5dGFRdGNPTEtVdVdrOWgvUlBWU1l3Q052bU02azZ5?=
 =?utf-8?B?MVpwYWx5MmR2NUM1M2NhYVltUklWeER0VXdrQ3NTRmtIY3pjUVdFeXFvckYx?=
 =?utf-8?B?bjA3UDVsbDU4eENsclpqd2VsZ1prM1FLSDZtR1dRUG9XM2piaW5DRG9sZnRP?=
 =?utf-8?B?WXhsMW1wTUVOT2hoU3ZDVmQzNlBBM3RmVjg2VWZOc0lvMENLaVVtOVJDNEVr?=
 =?utf-8?B?alRIeW1oL1lOVEg2SXd6SGtqUDRETVkrZ1lyR0dFRHJiTVdTSVNoUWJ5YWxp?=
 =?utf-8?B?SnpaclFsYm9sOW1sRmJYdmlzZWdPdEpOT01WTFFoM2xKMVVZc0tKK1pvZmtP?=
 =?utf-8?B?UTRxbGlUbmFtZzhGRWpjVVBtelhYRTNyRjJpR2x3ZVBrR21kZlV1VlBkOVRr?=
 =?utf-8?B?emhTckR1Y2N6d01wM2YyYlFyUUllUG5rYnhsTm1PTktIekFJdXFIS1BuL0lY?=
 =?utf-8?B?M3hQczRQejB2OXJ6N2M0T0E4Tm13dmxBTEQ0dDZwbzUxanBHOU5FSVdIOTdV?=
 =?utf-8?B?bFNibUN1UGRRRTd1b3FCNHhSU2I5RHlkSnUxM0J6TjVQTkk0VkNQS0pLNTJk?=
 =?utf-8?B?SE5EU2pBY3hNMjJvUGxWcDc4czBqOVcxQ2d2eUdiU0ZKUjU2R01iOGd5VzBL?=
 =?utf-8?B?KzhkOC82VEdGZCtiRXp5OFcvbWR3OHlvcnMwOGdUMEpCMExhbDdLbkw3eGJn?=
 =?utf-8?B?TFhHY29RNmkzWUg1S3B3RHN5ZktXNmxCMnU5Y0pvYlJNckdncmN2QVlxeWNh?=
 =?utf-8?B?RU5iU0lCYU10MjM3M205YlJwNWNXSGc5ZjhmMVBaa1NYQmlZWmhvQURuTmls?=
 =?utf-8?B?RS9qaGVmVGZjSHhwdlp5VUUwQUlzdVpKc3hPZjhsQ1dyYWxUYi9UVHR3TlIw?=
 =?utf-8?B?b2JsT1RqWWRYTWQ1cTRmRHVDRHRSWEFPOFRiYlZ2ZEl6SjBrcllpZk03MHhB?=
 =?utf-8?B?UkpKd2JWT2JuWmMxbk5IZ1RtM2dYQ3ZENG5waElCcHJLWFZYaXJQVVQ5Q3M4?=
 =?utf-8?B?cklJSWlUSElhTnc1MlI4eVloMDF3cDVlbkpPQ3orRmdtU0FRM1BReFhoS1E1?=
 =?utf-8?Q?coygIIaD15iFtBM0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D01AF5675281D94C95BFA47671BFDE95@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: SjfelpuS3bmHMTvvfrz3PsgsfOMiGoo3P+aNEKjamWrYYE6FYbbsFLEcExsN26Y6fyPABlGrXaK+mXynBj+T+xzWT6MHY4qXmiPiXwFOHPt5TSB9cnawoZxmfiQsTxxKSnwbA0oVfsXInQ8tYm++Ss5CjiWvNeBw6yz3cZG0zyCu5C5X2olKnJ3ACQrWOlzcaQV1yerL8oWoDjJXUxpSm7uCnrKwplb2/SMXTN3i4mlz/Imp9rYhVyxQc7W/CX3PGU1k7F13HbP5hj8b9B1yv1U0EWGHOFlktdSLG2hUUhK+AYPL8Jt6qZHaPqt8T5OkrGhHCGlsX31RFb3nBcFxtw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae9d5f70-ce4a-4971-21e7-08def32f5daf
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2026 20:23:09.3574 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O0WelljdsYoIok+XTVSkX0y256VATsVcVswyiTddlaDhxvlYK6wBtusrBCa4a0k3sIqpIn+Nm2tUZr9fkzcCHoEdwwG73n7RuGcHqJWkPRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF5217261E0
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

T24gTW9uLCAyMDI2LTA4LTAzIGF0IDE1OjIxIC0wNzAwLCBWaW5heSBCZWxnYXVta2FyIHdyb3Rl
Ogo+IEluIGNhc2VzIHdoZXJlIG1pbiBmcmVxdWVuY3kgd2FzIGFjdHVhbGx5IGdyZWF0ZXIgdGhh
biBCTUdfTUlOX0ZSRVEsCj4gd2Ugd2VyZSBub3QgdXNpbmcgdGhlIHVwZGF0ZWQgbWluIGZyZXF1
ZW5jeSBhcyB0aGVyZSB3YXMgYSBtaXNzaW5nCj4gY2FsbCB0byBwY19hY3Rpb25fcXVlcnlfdGFz
a19zdGF0ZSgpIGJldHdlZW4gdGhlIHR3byBzZXR0aW5ncyBvZgo+IG1pbiBmcmVxdWVuY3kuIFVz
ZSB0aGUgeGVfZ3VjX3BjX2dldF9taW5fZnJlcV9sb2NrZWQoKSB2YXJpYW50IHRvCj4gb2J0YWlu
IHRoZSBmcmVxdWVuY3kgYXMgYSBnb29kIHByYWN0aWNlLCBhbmQgY2FjaGUgdGhlIGNoYW5nZWQg
dmFsdWUKPiB0byBmaXggdGhpcyBpc3N1ZS4KPiAKPiBGaXhlczogYmRkZTE2YzlhYzVjICgiZHJt
L3hlL2JtZzogVXBkYXRlIFdhXzE0MDIyMDg1ODkwIikKPiBTaWduZWQtb2ZmLWJ5OiBCYWxhc3Vi
cmFtYW5pIFZpdmVrYW5hbmRhbgo+IDxiYWxhc3VicmFtYW5pLnZpdmVrYW5hbmRhbkBpbnRlbC5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogVmluYXkgQmVsZ2F1bWthciA8dmluYXkuYmVsZ2F1bWthckBp
bnRlbC5jb20+Cj4gLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3BjLmMgfCAxOSAr
KysrKysrKysrKysrKy0tLS0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwg
NSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1
Y19wYy5jCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3BjLmMKPiBpbmRleCA1OWYyZmE3
OWFkNDIuLjhiYzJhZTE1YTgzNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3VjX3BjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3BjLmMKPiBAQCAtOTEx
LDEwICs5MTEsMTUgQEAgc3RhdGljIGJvb2wgcGNfbmVlZHNfbWluX2ZyZXFfY2hhbmdlKHN0cnVj
dAo+IHhlX2d1Y19wYyAqcGMpCj4gwqBzdGF0aWMgaW50IHBjX2FkanVzdF9mcmVxX2JvdW5kcyhz
dHJ1Y3QgeGVfZ3VjX3BjICpwYykKPiDCoHsKPiDCoMKgwqDCoMKgwqDCoMKgaW50IHJldDsKPiAr
wqDCoMKgwqDCoMKgwqB1MzIgbWluX2ZyZXEsIG1heF9mcmVxOwo+IMKgCj4gwqDCoMKgwqDCoMKg
wqDCoGxvY2tkZXBfYXNzZXJ0X2hlbGQoJnBjLT5mcmVxX2xvY2spOwo+IMKgCj4gLcKgwqDCoMKg
wqDCoMKgcmV0ID0gcGNfYWN0aW9uX3F1ZXJ5X3Rhc2tfc3RhdGUocGMpOwo+ICvCoMKgwqDCoMKg
wqDCoHJldCA9IHhlX2d1Y19wY19nZXRfbWluX2ZyZXFfbG9ja2VkKHBjLCAmbWluX2ZyZXEpOwo+
ICvCoMKgwqDCoMKgwqDCoGlmIChyZXQpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGdvdG8gb3V0Owo+ICsKPiArwqDCoMKgwqDCoMKgwqByZXQgPSB4ZV9ndWNfcGNfZ2V0X21pbl9m
cmVxX2xvY2tlZChwYywgJm1heF9mcmVxKTsKClNob3VsZCB0aGlzIGJlIHhlX2d1Y19wY19nZXRf
bWF4X2ZyZXFfbG9ja2VkPwoKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKHJldCkKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gb3V0Owo+IMKgCj4gQEAgLTkyMyw3ICs5MjgsNyBA
QCBzdGF0aWMgaW50IHBjX2FkanVzdF9mcmVxX2JvdW5kcyhzdHJ1Y3QgeGVfZ3VjX3BjCj4gKnBj
KQo+IMKgwqDCoMKgwqDCoMKgwqAgKiBvdmVyY2xvY2tpbmcuIExldCdzIGFkanVzdCBpdCB0byB0
aGUgSGFyZHdhcmUgUlAwLCB3aGljaAo+IGlzIHRoZQo+IMKgwqDCoMKgwqDCoMKgwqAgKiByZWd1
bGFyIG1heGltdW0KPiDCoMKgwqDCoMKgwqDCoMKgICovCj4gLcKgwqDCoMKgwqDCoMKgaWYgKHBj
X2dldF9tYXhfZnJlcShwYykgPiBwYy0+cnAwX2ZyZXEpIHsKPiArwqDCoMKgwqDCoMKgwqBpZiAo
bWF4X2ZyZXEgPiBwYy0+cnAwX2ZyZXEpIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHJldCA9IHBjX3NldF9tYXhfZnJlcShwYywgcGMtPnJwMF9mcmVxKTsKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChyZXQpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byBvdXQ7Cj4gQEAgLTkzMyw4ICs5MzgsMTIgQEAg
c3RhdGljIGludCBwY19hZGp1c3RfZnJlcV9ib3VuZHMoc3RydWN0Cj4geGVfZ3VjX3BjICpwYykK
PiDCoMKgwqDCoMKgwqDCoMKgICogU2FtZSB0aGluZyBoYXBwZW5zIGZvciBTZXJ2ZXIgcGxhdGZv
cm1zIHdoZXJlIG1pbiBpcwo+IGxpc3RlZCBhcwo+IMKgwqDCoMKgwqDCoMKgwqAgKiBSUE1heAo+
IMKgwqDCoMKgwqDCoMKgwqAgKi8KPiAtwqDCoMKgwqDCoMKgwqBpZiAocGNfZ2V0X21pbl9mcmVx
KHBjKSA+IHBjLT5ycDBfZnJlcSkKPiArwqDCoMKgwqDCoMKgwqBpZiAobWluX2ZyZXEgPiBwYy0+
cnAwX2ZyZXEpIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IHBjX3Nl
dF9taW5fZnJlcShwYywgcGMtPnJwMF9mcmVxKTsKClNob3VsZCB3ZSBiZSB1c2luZyB4ZV9ndWNf
cGNfc2V0X21pbl9mcmVxX2xvY2tlZCgpIGhlcmUgdG8gYWxpZ24gd2l0aAp0aGUgcmVhZHMgaW4g
cGNfbmVlZHNfbWluX2ZyZXFfY2hhbmdlPwoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgaWYgKHJldCkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGdvdG8gb3V0OwoKbml0OiBleHRyYSBsaW5lIGhlcmUgZm9yIHJlYWRhYmlsaXR5Cgo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBtaW5fZnJlcSA9IHBjLT5ycDBfZnJlcTsKPiAr
wqDCoMKgwqDCoMKgwqB9Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgLyoKPiDCoMKgwqDCoMKgwqDC
oMKgICogU2V0dGluZyBHVCBSUCBtaW4gZnJlcXVlbmN5IHRvIDEuMkdIeiBieSBkZWZhdWx0IGZv
cgo+IEBAIC05NDcsOCArOTU2LDggQEAgc3RhdGljIGludCBwY19hZGp1c3RfZnJlcV9ib3VuZHMo
c3RydWN0IHhlX2d1Y19wYwo+ICpwYykKPiDCoMKgwqDCoMKgwqDCoMKgICogd2UgYXJlbid0IGV4
cGVjdGluZyBoaWdoIHBvd2VyIG91dHB1dCBhY3Jvc3MgYm9hcmQKPiDCoMKgwqDCoMKgwqDCoMKg
ICoKPiDCoMKgwqDCoMKgwqDCoMKgICovCj4gLcKgwqDCoMKgwqDCoMKgaWYgKHBjX25lZWRzX21p
bl9mcmVxX2NoYW5nZShwYykpCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9
IHBjX3NldF9taW5fZnJlcShwYywgbWF4KEJNR19NSU5fRlJFUSwKPiBwY19nZXRfbWluX2ZyZXEo
cGMpKSk7Cj4gK8KgwqDCoMKgwqDCoMKgaWYgKHBjX25lZWRzX21pbl9mcmVxX2NoYW5nZShwYykg
JiYgbWluX2ZyZXEgPCBCTUdfTUlOX0ZSRVEpCgpTaG91bGQgdGhpcyBiZSA8PT8KClRoYW5rcywK
U3R1YXJ0Cgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSBwY19zZXRfbWlu
X2ZyZXEocGMsIEJNR19NSU5fRlJFUSk7Cj4gwqAKPiDCoG91dDoKPiDCoMKgwqDCoMKgwqDCoMKg
cmV0dXJuIHJldDsKCg==
