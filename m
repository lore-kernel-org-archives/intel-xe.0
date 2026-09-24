Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C50C9830E
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 13:05:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D71FC10F52F;
	Thu, 24 Sep 2026 13:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PnCSUgwo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 305D310F52F;
 Thu, 24 Sep 2026 13:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790255113; x=1821791113;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=aNQhlgMdVNMMMSN19ijuN4PMbKf9xb6Mkq/ypUnqIn0=;
 b=PnCSUgwoNfJyLrBSazn98VDI66iF4NWmW+GQw6dBV178buZz5pxLcBDH
 rp97gbMDsg0E1EDpO/nXXTMi+Ne1ZEJFp4QhNA2XLDGE3DsAmEFGr2unR
 gAGIAhjGFT8HuYIG58PQKbRAibBkHvdZ2Yx+b4+hc9WYEBqhV89tDC8b3
 VLIz8ZZwDK/aDvAzPdf4nrPPUCsneR78BmUjYxRiPpTlbwVwtRbmjXGqV
 c+7mOvMWTjgiaOgAZA2EpDvhsuhiEl3OCVpG1ei0Py5gVNrmB8ZSsjVP0
 rDttY12Fm2gbryGCyuIKQ+HObwWD4BuHvyqfHFhyyxSGrEH/U1zeCRP7r Q==;
X-CSE-ConnectionGUID: DvF+2YxiS9yRgxMgYA+wMw==
X-CSE-MsgGUID: 9Q37V0uHRmKEp0XQovyGlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="93914172"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="93914172"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 06:05:13 -0700
X-CSE-ConnectionGUID: LWEXULLdSNKI/DoKVj6/ig==
X-CSE-MsgGUID: PuwxXjqpSXWXY4uxbm7X1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="273516815"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 06:04:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 06:04:26 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 24 Sep 2026 06:04:26 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.33) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 06:04:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gndr+t6zPqHGLA+gzxc1rB3zD/fFG1V1pLJdg8F7NKbV2ijCH3pnuVIr7oMzLqQ/SfWec/tSY2i8mX8G8N5QqsMa55vvrOz7CbisXHYOflCX8hL3bNnmrgtA5atA/N5w5m5WmSyeFJawU4f8zL8lHb04V/SZh95WO0TEPwpfEnzn9YXBwhGkDsuIR6fBIi8P55MoRA1KCs2NYlB0LTvMSYZTBSv0Hsd6RewX/nLczRa60LJLKRUhCQkeZQUIXguCxHaH8T1aPAQkfKdZIHZsGzCCMPA5BmLzvGWZOBc8ur8T8JvfBS8KMf6C+0/b/g8vCCEpHhJ77oU3GcE90JmHpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNQhlgMdVNMMMSN19ijuN4PMbKf9xb6Mkq/ypUnqIn0=;
 b=J6Ci3xqB33NvsAbM7uEE859JtIsl1ae1oMh6CnZkhXrY+Om+skjPwlyt3pA1T2HOFAwtdWQ3iVayM0/nBys48Snzb4ZWmwHZXYhAQ1vTvaA6kK7kdezDDYOmwRdVF3k+lR0sdX4pWNhwHKVh/vJiqTyjpyyiI9iJSi6tmn3KhRpTp70pjusWepa2fan+C0j//7fQzxsz58RKC99XjFhq9vbOllKQA9Akca1tEKfx0u3FhCRRHUcNaJTVCFWpIZfzGROm0BfhpuKyclc0T1aoR/aZZCLgA+VlkMa9NJKdi8pw7GJS2G2DKBan2kkIrdmyEXima3WKpvi4Kwx5my/OSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SAWPR11MB9897.namprd11.prod.outlook.com (2603:10b6:806:54a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 13:02:30 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 13:02:30 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Kahola, Mika" <mika.kahola@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/psr: Track all joined pipes for frontbuffer
 tracking
Thread-Topic: [PATCH] drm/i915/psr: Track all joined pipes for frontbuffer
 tracking
Thread-Index: AQHdS1MSJ3u0BUWc7EOZHvN2TrW12Lbds0EA
Date: Thu, 24 Sep 2026 13:02:29 +0000
Message-ID: <346dd60f86bc532f6bff95040c6247b104ea46ba.camel@intel.com>
References: <20260923115941.746934-1-mika.kahola@intel.com>
 <20260923115941.746934-2-mika.kahola@intel.com>
In-Reply-To: <20260923115941.746934-2-mika.kahola@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SAWPR11MB9897:EE_
x-ms-office365-filtering-correlation-id: 697003bc-bde8-4bba-e168-08df1a3c173b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|10067099003|56012099006|18002099003|22082099003|4143699003|11063799006|38070700021;
x-microsoft-antispam-message-info: YhAg2D4UmVFcUfzmo2Ahai96twTWyejyKSG2PvxsTOGxmrZQydagYNMVb2ghmy/hfUkLz8GD43Wdka1TMd7lB6xSUeFW1nF9/RviQ7DTn9m6SxJGzUEayLfCLoDZM7mI1FfBJsylwTozy116g7kS047HZpBGx0hZThN9gjkpRwI2NUoQzzZ5PsCD1a3zQ82ie4fdWz3jgoTxEn+HivtLn/xloT2C0ZQF6UOh6TvZ6cPu4AMsSqjAHXDe7MovEBVlAG0wavzEwFNrFQKSBKzCos4/e08z5GfcRm1x2uuu2cIf3yv86OlgUjqXkk2YmtwTatDwZuL6FD0PLptEn/4ImZpk1xKih/qzZWMkRv51c9C7mPh8TMPecrjFZkL+tn7bxQ5p/N3X9xPAfptIv6WjaWtzLxYjfFY/UMyD/cbJVX8iu9FTpOEjqiHySE8tB8XXlS/zC+QvFBHupkAAfv3NDmChoBREHhF4eo4fkBvox8a0/cVbh0jByCQdt7L5Djk/mikhp/zZYi0lsZas91n96koUcW3B1DDJq8YyZbssT2/V6mG7Zf6umVqMolDFqFLEPriJ3jAr+GzMplj8k0InYiewMN5wiHBGfSBGGc0inTmm+bboIPJXY7G5peuLF4wz7czOcIAfUVMds0dp0dC9XLOlp630L+yuAcNOwXbQMZqTPGlbWShCThoATSr3W06vQw74SMFqTXIxL+QalzEWhJmtm52gxhlsMzsPxFWH8gg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(56012099006)(18002099003)(22082099003)(4143699003)(11063799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXBXMzRHWTRGNndBUGFRaGIzMjFVZ01nZHJjVksrLzFKbEFBcVZWZ1NndGVJ?=
 =?utf-8?B?TlNwdy8rb01OVXVSRG41ekErWTR2K0dFNVpNK3QyeFl5bjNlYmFNNThLWjAx?=
 =?utf-8?B?TnNCWWFpVDNXSlJOU0prOHEvV2dETnpEa1NYRmlFSWl3RHUrcXZuTHNMY1Ur?=
 =?utf-8?B?anUzWCtYbGdocEZlaEl6Mmc0ejQwdnZuYUZacEFCc3cvQ0cxNXRUMTJ3cXBM?=
 =?utf-8?B?NlExQ0JCaDlPQ2VsZkRVU0tyL3NQcVl3ZGlUcksyYVIrYTlzc2ltV2xmTEFW?=
 =?utf-8?B?QmZSQWhUUFJ0N2kxQnh4ckU4TkduZE0vYUhjc0o1UVM1SVg5K01qLzlyQW1q?=
 =?utf-8?B?WTErbXc2WXdyZUxtWmRmbjVkTTc3YmFVWUIzUTBickIxRmwrcnk0RURzZTJh?=
 =?utf-8?B?V3FkL01ES0lDOWFtelpWV3dmei91alJBeENieVdXdU4xYXIzdWVwejliY25M?=
 =?utf-8?B?M0VhcVV3aFVnUW5wYTJOdUZnbmMxM1VnVXdyeWNZdVZqaXhYQTRuVDV3cDcz?=
 =?utf-8?B?WUQyQjJ2WHVmQ01oU3ExODlyUzdrV3haL2tDNUdxZFk1NGhHek1nQmJkZUtE?=
 =?utf-8?B?VkxqY1pWY0xld1NsMVMwbjArcGRLOFJtbXlEM0hwOUR3eksyVTdwS1kyRWNS?=
 =?utf-8?B?K0xCNXEzd3pCczN1aytjdGM5UHlWdWY0UjZjZlNKa1ljUWNQbU5UNGV4RDNZ?=
 =?utf-8?B?enluTHkvK2x0YTRmTTgyUitWV240aUF0NWI4UTdoSUpxb3l1VjhUVlAwM09N?=
 =?utf-8?B?RHFEN1hhdXhPQTVtb0REdHkxVXllUEhCc2tLQ3RVWTVGN1RnT0hDZXVxemFj?=
 =?utf-8?B?QTF3bGxNQVkvV0VQKzAvcGphZVBOYVJWR1ExeHFqMW1VQ0UvNkZZbUZrZ2pO?=
 =?utf-8?B?YmtzeVBLQXBBcWtpMDV2RTE1YTFWSVRJZzNiM0NTSnBqUUkzNHZSYkwzcGNm?=
 =?utf-8?B?UDZ1bGp5dFFOeHdhd3RPQTRWTytPdmViVUFabk1GR2xpMDFHZjhJMjYxNkZu?=
 =?utf-8?B?a3BQa3FOU21ERlRtQ29ZKzBnUUZRVXVFOGwxZGZ0eWZtUHV2TlpENWROaVc4?=
 =?utf-8?B?dk0rLy9GekxDcFpsODBzOEgvV2lOb2VCZUhMS2YraTVBV1p4SEdOdzdlZU9N?=
 =?utf-8?B?WkFUMSt5SG1jeDkzUTFNSmVQWFBEdW45VWdLaTFWSEhTdWo0THRBbkJJTHhQ?=
 =?utf-8?B?cjlHcjVaVGtISzBKRDliQlkrWTljN2NVSlk2bDRrZHVOOEQ5V3NZMnFxQ05v?=
 =?utf-8?B?dzNPQVRKTlAyUlZPN2IwcWVKSXJ4RDVCczVLdXp4T3FXUzBFd2krbjBTNFZy?=
 =?utf-8?B?Znc0RTVXeXEvQUpQbU1Fa2RBK0lUajdGcisxU2tFVFNhelNGdG5LTXhNdUNq?=
 =?utf-8?B?T3RiQytqaFZDMURGMEg2ZFRwMTkxaHQzWENtaXlHcHV6QlBXcXVpTW1IRytK?=
 =?utf-8?B?SUpsWFkwdmxwT2laQ0JvcklkbWU3R1VxSTZFeFA4L3N1ZEhNRWJpbTByVHZL?=
 =?utf-8?B?QW1Rc2l1eHUrN3VOSzQrcUhiNGtoMWkyNStyOEFIWnNac2hlSzc2SUsyRlBQ?=
 =?utf-8?B?UTZSOGUwaEJQZWZrZW5HME1DVGFqb2lXS1VnTW5VVDIxdDdkNWVuZVQ0ZCt4?=
 =?utf-8?B?YXRKTWw3SVhUbmZBNXdSank3ZzA2WVFqTjlNSTYxOFNEcUVQdHRUK284ZlpG?=
 =?utf-8?B?Q0FtZEVjZzhUbitOUVh6SXhFd1NRaEVNZWN6V1VWS2xOT0RhTG1JYThQcTBJ?=
 =?utf-8?B?UUtPQmppVU1OR1lGZWljUktBZVlWT2lGbXNoRmI0M0dHSURlNEZMZXRwcjQ1?=
 =?utf-8?B?MWVvbjZVL05kQ21KdWRyMTNyb0dvb0NtaTJGcE5iYkMxMndHZzd2THJEWmh1?=
 =?utf-8?B?Vm5lTWM2NUFJSFcrbUowRzA2NE1QRnVaT3ZxeFZRdVppQmNkc0ZXY0g2R2gr?=
 =?utf-8?B?RTRJaVBDd0FOdWhXNUNoUlRsZDBFTVNnY3VucFhCRldtaGRnYlNHOEdtcVdx?=
 =?utf-8?B?TXdmdFV6VTJGdkhuTllVYzdMSUdBbkdUclljWmY1dnQxVnRVVFRld3JFZEt3?=
 =?utf-8?B?T3Budm9VME84TlBjVCtrQkQ1STRRODZHZWljOFBrc2oxSzlncDJBa0UyeVFD?=
 =?utf-8?B?Szg3TUhubnVFWGk1WkZwa2dzSEZQRFFMeGh2eVJQSXp6d0lzT2JjMGFSb0o2?=
 =?utf-8?B?Wi8xcWd6QUhFLzZHSlJqa1pVYkZvU0Z5ZDIrN1BiZDFncTc0YlN3QWdEbWtu?=
 =?utf-8?B?SkxXdTh5TEpvNEk2akgvYnFFRldVa3p0LzJyZUptemg3VHBFMkN1bnhTSC9H?=
 =?utf-8?B?S1c4dnFxUFU1aVdGUWMyWXAveVRFWUNOYnVzdzU2RCtpVm9aSUE1NDRaeHla?=
 =?utf-8?Q?zVOTho45Y2M9MQVg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E112A11FB9037458F48A937A538E86E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jIbC/6ZnYnzRFz8CLTyWO6aUXiqirx1KAsNr28UYzZ0mhLiImsf9XwhIeScvB3tkwOjmKNk1Dp2AQIf71hgiFMJH6ny6RJ/EyilEezBBh5HQC7Dt/barNf171YSPeufTgVL2Yx3KtbBt2xVcwW4Is/BoHh90sbyckXTRkPnLxyPFPsnECvT94omr+R2jN6szerSghRKrJnr50Vphoi2ECCkZGcHLUwy4EXznSIM+bNlX8w3/1Nw0I62osLG9lYi748/nYwpwcFhtriDOEbqQEk0ZZ3uoo5kF6SO8KXzb5PqDrepgf68UMqNk2HOfOLYzYuZ0Rxx/ASN+lJw2PVUynQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 697003bc-bde8-4bba-e168-08df1a3c173b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2026 13:02:29.9925 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D3yX1kwbKZm9KXUsQkT9oK+eGf3LPiqpfqVkcvPxu2nupaVOG+e/YqZSuKfimrTraGhPURfxhq44Aosa3ScFTeznfi8bA1n97t1yPUC4V+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9897
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

T24gV2VkLCAyMDI2LTA5LTIzIGF0IDExOjU5ICswMDAwLCBNaWthIEthaG9sYSB3cm90ZToNCj4g
cHNyLnBpcGUgaXMgdGhlIGpvaW5lciBwcmltYXJ5IG9ubHksIHNvIGZyb250YnVmZmVyIGJpdHMg
Y29taW5nIGZyb20NCj4gYQ0KPiBzZWNvbmRhcnkgcGlwZSBnZXQgbWFza2VkIG91dCBhbmQgdGhl
IHVwZGF0ZSBnb2VzIHVubm90aWNlZC4gQWRkDQo+IHBzci5waXBlX21hc2sgY292ZXJpbmcgZXZl
cnkgam9pbmVkIHBpcGUgYW5kIHVzZSB0aGF0IGluc3RlYWQuDQo+IA0KPiBObyBmdW5jdGlvbmFs
IGNoYW5nZSwgam9pbmVyIGlzIHN0aWxsIHJlamVjdGVkIGluIGNvbXB1dGVfY29uZmlnKCkuDQo+
IA0KPiBBc3Npc3RlZC1ieTogQ29waWxvdDpjbGF1ZGUtb3B1cy01DQo+IFNpZ25lZC1vZmYtYnk6
IE1pa2EgS2Fob2xhIDxtaWthLmthaG9sYUBpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoC4uLi9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaMKgwqDCoCB8wqAgMSArDQo+IMKgZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuY8KgwqDCoMKgwqAgfCAyNyArKysr
KysrKysrKysrKy0tLQ0KPiAtLQ0KPiDCoDIgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygr
KSwgNyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90eXBlcy5oDQo+IGluZGV4IDc5ZjMwNjYwYzJiNi4uMmU2
ZTM2NjE2NzVjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2Rpc3BsYXlfdHlwZXMuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2Rpc3BsYXlfdHlwZXMuaA0KPiBAQCAtMTc5OCw2ICsxNzk4LDcgQEAgc3RydWN0IGlu
dGVsX3BzciB7DQo+IMKgCWJvb2wgZW5hYmxlZDsNCj4gwqAJaW50IHBhdXNlX2NvdW50ZXI7DQo+
IMKgCWVudW0gcGlwZSBwaXBlOw0KPiArCXU4IHBpcGVfbWFzazsNCj4gwqAJZW51bSB0cmFuc2Nv
ZGVyIHRyYW5zY29kZXI7DQo+IMKgCWJvb2wgYWN0aXZlOw0KPiDCoAlzdHJ1Y3Qgd29ya19zdHJ1
Y3Qgd29yazsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfcHNyLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+
IGluZGV4IDg3MmUyNTNkYjE3OC4uNzYyNjBjZWI0OWNiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4gQEAgLTM2LDYgKzM2LDcgQEANCj4gwqAjaW5j
bHVkZSAiaW50ZWxfY3Vyc29yX3JlZ3MuaCINCj4gwqAjaW5jbHVkZSAiaW50ZWxfZGRpLmgiDQo+
IMKgI2luY2x1ZGUgImludGVsX2RlLmgiDQo+ICsjaW5jbHVkZSAiaW50ZWxfZGlzcGxheS5oIg0K
PiDCoCNpbmNsdWRlICJpbnRlbF9kaXNwbGF5X2lycS5oIg0KPiDCoCNpbmNsdWRlICJpbnRlbF9k
aXNwbGF5X3JlZ3MuaCINCj4gwqAjaW5jbHVkZSAiaW50ZWxfZGlzcGxheV9ycG0uaCINCj4gQEAg
LTE3OTgsNiArMTc5OSwxOSBAQCBzdGF0aWMgdm9pZCBwc3IyX2RjM2NvX2Rpc2FibGVfd29yayhz
dHJ1Y3QNCj4gd29ya19zdHJ1Y3QgKndvcmspDQo+IMKgCW11dGV4X3VubG9jaygmaW50ZWxfZHAt
PnBzci5sb2NrKTsNCj4gwqB9DQo+IMKgDQo+ICsvKiBGcm9udGJ1ZmZlciBiaXRzIGZvciBldmVy
eSBwaXBlIGRyaXZpbmcgdGhpcyBQU1IvUGFuZWwgUmVwbGF5DQo+IGluc3RhbmNlLiAqLw0KPiAr
c3RhdGljIHVuc2lnbmVkIGludCBwc3JfZnJvbnRidWZmZXJfbWFzayhzdHJ1Y3QgaW50ZWxfZHAg
KmludGVsX2RwKQ0KPiArew0KPiArCXN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5ID0gdG9f
aW50ZWxfZGlzcGxheShpbnRlbF9kcCk7DQo+ICsJdW5zaWduZWQgaW50IG1hc2sgPSAwOw0KPiAr
CWVudW0gcGlwZSBwaXBlOw0KPiArDQo+ICsJZm9yX2VhY2hfcGlwZV9tYXNrZWQoZGlzcGxheSwg
cGlwZSwgaW50ZWxfZHAtPnBzci5waXBlX21hc2spDQo+ICsJCW1hc2sgfD0gSU5URUxfRlJPTlRC
VUZGRVJfQUxMX01BU0socGlwZSk7DQo+ICsNCj4gKwlyZXR1cm4gbWFzazsNCj4gK30NCj4gKw0K
PiDCoHN0YXRpYyB2b2lkDQo+IMKgcHNyMl9kYzNjb19mbHVzaF9sb2NrZWQoc3RydWN0IGludGVs
X2RwICppbnRlbF9kcCwgdW5zaWduZWQgaW50DQo+IGZyb250YnVmZmVyX2JpdHMpDQo+IMKgew0K
PiBAQCAtMTgxMyw4ICsxODI3LDcgQEAgcHNyMl9kYzNjb19mbHVzaF9sb2NrZWQoc3RydWN0IGlu
dGVsX2RwDQo+ICppbnRlbF9kcCwgdW5zaWduZWQgaW50IGZyb250YnVmZmVyX2JpdHMNCj4gwqAJ
ICogQXQgZXZlcnkgZnJvbnRidWZmZXIgZmx1c2ggZmxpcCBldmVudCBtb2RpZmllZCBkZWxheSBv
Zg0KPiBkZWxheWVkIHdvcmssDQo+IMKgCSAqIHdoZW4gZGVsYXllZCB3b3JrIHNjaGVkdWxlcyB0
aGF0IG1lYW5zIGRpc3BsYXkgaGFzIGJlZW4NCj4gaWRsZS4NCj4gwqAJICovDQo+IC0JaWYgKCEo
ZnJvbnRidWZmZXJfYml0cyAmDQo+IC0JwqDCoMKgIElOVEVMX0ZST05UQlVGRkVSX0FMTF9NQVNL
KGludGVsX2RwLT5wc3IucGlwZSkpKQ0KPiArCWlmICghKGZyb250YnVmZmVyX2JpdHMgJiBwc3Jf
ZnJvbnRidWZmZXJfbWFzayhpbnRlbF9kcCkpKQ0KPiDCoAkJcmV0dXJuOw0KPiDCoA0KPiDCoAlt
b2RfZGVsYXllZF93b3JrKGRpc3BsYXktPndxLnVub3JkZXJlZCwgJmludGVsX2RwLQ0KPiA+cHNy
LmRjM2NvX3dvcmssDQo+IEBAIC0xODQ1LDcgKzE4NTgsNyBAQCB2b2lkIGludGVsX3Bzcl9zZXRf
bm9uX3Bzcl9waXBlcyhzdHJ1Y3QNCj4gaW50ZWxfZHAgKmludGVsX2RwLA0KPiDCoAlhY3RpdmVf
cGlwZXMgPSBpbnRlbF9jYWxjX2FjdGl2ZV9waXBlcyhzdGF0ZSwgYWN0aXZlX3BpcGVzKTsNCj4g
wqANCj4gwqAJY3J0Y19zdGF0ZS0+YWN0aXZlX25vbl9wc3JfcGlwZXMgPSBhY3RpdmVfcGlwZXMg
Jg0KPiAtCQl+QklUKHRvX2ludGVsX2NydGMoY3J0Y19zdGF0ZS0+dWFwaS5jcnRjKS0+cGlwZSk7
DQo+ICsJCX5pbnRlbF9jcnRjX2pvaW5lZF9waXBlX21hc2soY3J0Y19zdGF0ZSk7DQoNClRoaXMg
Y2hhbmdlIGlzIG5vdCByZWxhdGVkIHRvIGZyb250YnVmZmVyIHRyYWNraW5nLg0KDQpCUiwNCg0K
Sm91bmkgSMO2Z2FuZGVyDQoNCj4gwqB9DQo+IMKgDQo+IMKgdm9pZCBpbnRlbF9wc3JfY29tcHV0
ZV9jb25maWcoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCwNCj4gQEAgLTIxNzUsNiArMjE4OCw3
IEBAIHN0YXRpYyB2b2lkIGludGVsX3Bzcl9lbmFibGVfbG9ja2VkKHN0cnVjdA0KPiBpbnRlbF9k
cCAqaW50ZWxfZHAsDQo+IMKgCWludGVsX2RwLT5wc3IucGFuZWxfcmVwbGF5X2VuYWJsZWQgPSBj
cnRjX3N0YXRlLQ0KPiA+aGFzX3BhbmVsX3JlcGxheTsNCj4gwqAJaW50ZWxfZHAtPnBzci5idXN5
X2Zyb250YnVmZmVyX2JpdHMgPSAwOw0KPiDCoAlpbnRlbF9kcC0+cHNyLnBpcGUgPSB0b19pbnRl
bF9jcnRjKGNydGNfc3RhdGUtPnVhcGkuY3J0YyktDQo+ID5waXBlOw0KPiArCWludGVsX2RwLT5w
c3IucGlwZV9tYXNrID0NCj4gaW50ZWxfY3J0Y19qb2luZWRfcGlwZV9tYXNrKGNydGNfc3RhdGUp
Ow0KPiDCoAlpbnRlbF9kcC0+cHNyLnRyYW5zY29kZXIgPSBjcnRjX3N0YXRlLT5jcHVfdHJhbnNj
b2RlcjsNCj4gwqAJLyogREM1L0RDNiByZXF1aXJlcyBhdCBsZWFzdCA2IGlkbGUgZnJhbWVzICov
DQo+IMKgCXZhbCA9IHVzZWNzX3RvX2ppZmZpZXMoaW50ZWxfZ2V0X2ZyYW1lX3RpbWVfdXMoY3J0
Y19zdGF0ZSkgKg0KPiA2KTsNCj4gQEAgLTIzOTQsNiArMjQwOCw3IEBAIHN0YXRpYyB2b2lkIGlu
dGVsX3Bzcl9kaXNhYmxlX2xvY2tlZChzdHJ1Y3QNCj4gaW50ZWxfZHAgKmludGVsX2RwKQ0KPiDC
oAlpbnRlbF9kcC0+cHNyLnBzcjJfc2VsX2ZldGNoX2NmZl9lbmFibGVkID0gZmFsc2U7DQo+IMKg
CWludGVsX2RwLT5wc3IuYWN0aXZlX25vbl9wc3JfcGlwZXMgPSAwOw0KPiDCoAlpbnRlbF9kcC0+
cHNyLnBrZ19jX2xhdGVuY3lfdXNlZCA9IDA7DQo+ICsJaW50ZWxfZHAtPnBzci5waXBlX21hc2sg
PSAwOw0KPiDCoAljYW5jZWxfZGVsYXllZF93b3JrKCZpbnRlbF9kcC0+cHNyLmRjM2NvX3dvcmsp
Ow0KPiDCoAlpbnRlbF9kcC0+cHNyLmRjM2NvX2FsbG93ZWQgPSBmYWxzZTsNCj4gwqB9DQo+IEBA
IC0zNjI3LDggKzM2NDIsNyBAQCB2b2lkIGludGVsX3Bzcl9pbnZhbGlkYXRlKHN0cnVjdCBpbnRl
bF9kaXNwbGF5DQo+ICpkaXNwbGF5LA0KPiDCoAkJCWNvbnRpbnVlOw0KPiDCoAkJfQ0KPiDCoA0K
PiAtCQlwaXBlX2Zyb250YnVmZmVyX2JpdHMgJj0NCj4gLQkJCUlOVEVMX0ZST05UQlVGRkVSX0FM
TF9NQVNLKGludGVsX2RwLQ0KPiA+cHNyLnBpcGUpOw0KPiArCQlwaXBlX2Zyb250YnVmZmVyX2Jp
dHMgJj0NCj4gcHNyX2Zyb250YnVmZmVyX21hc2soaW50ZWxfZHApOw0KPiDCoAkJaW50ZWxfZHAt
PnBzci5idXN5X2Zyb250YnVmZmVyX2JpdHMgfD0NCj4gcGlwZV9mcm9udGJ1ZmZlcl9iaXRzOw0K
PiDCoA0KPiDCoAkJaWYgKHBpcGVfZnJvbnRidWZmZXJfYml0cykNCj4gQEAgLTM3MDgsOCArMzcy
Miw3IEBAIHZvaWQgaW50ZWxfcHNyX2ZsdXNoKHN0cnVjdCBpbnRlbF9kaXNwbGF5DQo+ICpkaXNw
bGF5LA0KPiDCoAkJCWNvbnRpbnVlOw0KPiDCoAkJfQ0KPiDCoA0KPiAtCQlwaXBlX2Zyb250YnVm
ZmVyX2JpdHMgJj0NCj4gLQkJCUlOVEVMX0ZST05UQlVGRkVSX0FMTF9NQVNLKGludGVsX2RwLQ0K
PiA+cHNyLnBpcGUpOw0KPiArCQlwaXBlX2Zyb250YnVmZmVyX2JpdHMgJj0NCj4gcHNyX2Zyb250
YnVmZmVyX21hc2soaW50ZWxfZHApOw0KPiDCoAkJaW50ZWxfZHAtPnBzci5idXN5X2Zyb250YnVm
ZmVyX2JpdHMgJj0NCj4gfnBpcGVfZnJvbnRidWZmZXJfYml0czsNCj4gwqANCj4gwqAJCS8qDQoN
Cg==
