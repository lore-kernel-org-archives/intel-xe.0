Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947471061B18
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 22:16:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48AB110E6B0;
	Mon, 30 Mar 2026 22:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d/OiCO+4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 260F610E6B0
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Mar 2026 22:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774909016; x=1806445016;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=P1lZk/DgBclfFJF+ptKdlfcpnQQZtLHm54kvQuH8Vs0=;
 b=d/OiCO+4GZOKxaIIpYIgysTuNL7I7gfy4P+BQollow6zDxKwEcwxuElT
 LSrun5pK5ca0W0i9way+PdakLq1gcn0h3QxNVJy+JDobts8pAcJU/Xi6E
 JGVEUO7FL5pvBiMl8FZW9irXiDbfNY4SxkkslJ9FM0HIMsLT8oXJmugwn
 gelg5nqOlGEpotYRAhtsyvgkL+z9kt9SFZeNeujeIKMVDzoWbXiY0bqh/
 iBOTdA24z+vq9NEFxRo1GN2yYV71vmQPaek/oucCqHg+/y8x2ytziWVSv
 tcfWn7OvkX4buqdomvcND4BHZgB5HC0Gt+1oNyjHDGiFGMnvHN+3sEee7 A==;
X-CSE-ConnectionGUID: wVI1kKrxTKmlPq2JTcd17A==
X-CSE-MsgGUID: daKw4vxMTICWGztvm46UmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="86213714"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="86213714"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 15:16:56 -0700
X-CSE-ConnectionGUID: tE+qiMPERUqdnBlWeJIdSg==
X-CSE-MsgGUID: E6YiO2sySeWIbpQgOVGyhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="221775307"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 15:16:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 15:16:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 30 Mar 2026 15:16:55 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.3) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 15:16:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QvP7Shl6RXpzYhKeVkGy9xqAxG3drDbm46LFN7pYIDpajOM2EYAkwCgVedwjZIEkuvK3I3UpVpX61gcqtJOvlPDgaqPWd89j1x7fiLRFJHKSYJNzpZfKRG7B5oSYwQzyALQFxkgkbR8Wi07ipWYe0G/EQZ7hYiZs1bNOW5p0t9bXgRTEblqXWIsySCA/v7U2K0iEDEJVXKNlDvM/s4mkGHl7v9O5dw6Yi+BlOWMFyIPGzOsKFuLmyzgilb3qcdFYkitR4eZPJ/cnyS5lkzwgG+GGwisxz3p9kZ2Is1mHxoClJlneQ1May357OTJ5gl0egWHKwnoW8B1AaqbfCMzuPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1lZk/DgBclfFJF+ptKdlfcpnQQZtLHm54kvQuH8Vs0=;
 b=aC/UOfhkEKNZfuhieBgVUHPk00j9QbqgfZ6IdvtGZ+sozRMv0L5D3wcu39W0a7m6+bBCjLuTCSKzFV4lbDS3bcU2FEuP4VzWGGypEzsC58JRv1BmlYkd5chIfeP5iMAtP5AyzNOdc4I8RMzVx2kmF64DS3mskQQiyacVrhAtB4lVfrwvHuip2UTgOvsFxizfBC/m8sRSDGrmbdtXCHhj15Zmw7Z/39tCv7OhaJKxWQnWicHfSOcSYZUI3oB9p2R2KDhkpypJqUlTww9PCK+fA+0PX0aNt7A6sNoRYWMhPv19fSu5NWpGWtV1AZ+UGsGPaEVeOeJMkA0KBOxAqQEq5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SN7PR11MB8065.namprd11.prod.outlook.com (2603:10b6:806:2de::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 22:16:52 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 22:16:52 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Bai, Zongyao" <zongyao.bai@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH] drm/xe/ggtt: Remove duplicate XE_GGTT_FLAGS_64K macro
 definition
Thread-Topic: [PATCH] drm/xe/ggtt: Remove duplicate XE_GGTT_FLAGS_64K macro
 definition
Thread-Index: AQHctZSe5DadCGTAuk2z7d9cnQK/s7XBdcOAgAZBzXA=
Date: Mon, 30 Mar 2026 22:16:52 +0000
Message-ID: <DM4PR11MB5456F52444CB07E0E35DE345EA52A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260316222723.1722591-2-shuicheng.lin@intel.com>
 <af38ac06-e332-486b-8d02-bd566db35916@intel.com>
In-Reply-To: <af38ac06-e332-486b-8d02-bd566db35916@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SN7PR11MB8065:EE_
x-ms-office365-filtering-correlation-id: ef5d2d3d-9798-489c-804c-08de8eaa0b9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: KQuKr9d+stDZPlUB/RVg9RnMufiBm9Dr4BTufXmlFENvyVBn4ejSbxxj8NnMANA0yQSHv/M+YU77VWvDj9+JgfVYwLe58zcK7Fi4kKp7JuOwB+98+OfYkTl/TXDfTWqf6w1MaudjUOOop0+mNg/dRjkD0hw+scozdkwkoWQ3wvqlKiVuThMK78c/WzHX1wmFGzbqWkACrA/u1BuNssMXyBmjbUwSFxIjtqiXsOg+jwmLKGhXG9P1y1mUQ4zlpMcX0luf3ALtpqTWOZ1VEVjulvYAB/nK7tuU7oQ6SEUuoN20nSWgEfqMEaPcuVzSN8kyw6gqEqJGU04j7ohnlRBxAFd9Qap5s+MfLNfzpEM9He3M53VqcEGMMwafdTxvs25/jLe6Z9Ai3fzo3onLvcEzVINn1GfdCtEqPgED8cacdCEgWpxzS/A0dv4kkXjRA5agycgkctFfYY3qS6r6ZIK6S6j+sQXatjD6ry7cm56oYmHjVOcRiZRnYutYMS6LCwlsCiR6b5V9lh1Ko0LrDQ1/uv8YR7dvsWPflnMfBQS2IAU8WbuMN56Ybjvl8DxsYdlxu0PnfpST7rClAMlCVn+QFvGt8XLHoPD+nZwV74Uj9vcsQVhRSIfv+7pZ2RUOQEqO9bDF092hDyrQNiGgNxuPQwTF5OcMtdVkyZ7uA1PQI+NXh2CQlKt6mE0aNdPucPbUO+VUJwOVxNfeb/IA/Pe3OUQionz+nRR0gSKCmZSglR547DE7OIza38wEIv+WyjoepYrdt3uZPJXPPrjnw1i/KsYkAgizWAAQF5e/v68WXSI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2xSVUlqYlpoc2hYMkFxdXFJYmorQ1J0WGp3M091dVI0SHJyT3puSlVOZ0hI?=
 =?utf-8?B?YlRLTW9VNU5Ha1hSdjJsempkNXFtcVhXVkJvdUtFZ3BGVG5FYUV4K1d1ZVNE?=
 =?utf-8?B?OEc3ZlV5N3ZhUk5aMTZzZkFGbWQ3MFptQjBORG1iTlU0bmQyd3hBc2dIZm1m?=
 =?utf-8?B?bEtNM082Y0JncEgvTEgrVmhLVWFDUnNhajZpd2MyUE9mUHpQUWEvMDB4M3pS?=
 =?utf-8?B?Y3Z0VHZOb1dNVDR5ZVMvTmladTNyT0N1V0x4Q3dibmFSUkx4ckJUL0Q2NkpW?=
 =?utf-8?B?N1BLZDBPMStVSFVTUS9PTjJlb1pIWjlnMmlFWWxmWnZnQ1JuN29qclVWeS8v?=
 =?utf-8?B?RWRITmkyRnVXNDYrSjFrS2xib3RWeHFIaUVPODdrWldXSUxWaDJOQkE4NVgr?=
 =?utf-8?B?Rk1odG9WNkhGNGp5dGFBeDdHZmZtQkhKUXZVMXpLNjF0ZjRJZWdVSUMvQm9T?=
 =?utf-8?B?VUpXR3h2bVEzZ1lDVmI3TkdzZFFnUU56Ymg4b1hTU0lTZGpOZmdQaldyQ3NF?=
 =?utf-8?B?NHlPZFlkTXVzY0ZNazRRMms4VkpsL1VDT0VGM1VxQWJFRUZ6QklYbGxqZFpE?=
 =?utf-8?B?TEp2ZzBjeW9vYzZkL0o4ZmlrblR1UEZKVUM1WnVOcWN3Tkp4eE81Ti9PMjJF?=
 =?utf-8?B?a2ZoTmxYWThHb2M5UjdYM0lOQU1BN1FRamd4L0JIT2lZc0ZDcnZnM0ZLWFVn?=
 =?utf-8?B?dzZQdDlGT1ovS1BYRUVSME9NQytLemh6R1pxTXlxUlJ2V2ZzcklORlVVaytr?=
 =?utf-8?B?M05XUXM5R0ZtczQ1MEN2T2tFMjZhdEJ4V1RMWUMwRDhqM1U0T2wyUWVPQnky?=
 =?utf-8?B?cUN5NVFmcWVucHNwWEhGcEN2d25wNEFBZ2NHVXhiK3FDMnlxY1lhZmlFMWk0?=
 =?utf-8?B?b1Q4N1NQcUNXSWNsZTlaeXVUenROanpiNGNOWklaQUVtSmh6TjczcnAycVEz?=
 =?utf-8?B?UlY3cUI2TVQ3cFdBNUVyeXF4Ujg0V25LMnVMZ2RjbDh1bTRIR0JqTVI4THp4?=
 =?utf-8?B?YmdIQ1pYYlc2R1ByVTdEMnNnc0J4R2tHZ3VQVHlZZ2xQbi82VHo1ZlpEQ05O?=
 =?utf-8?B?RjgyYzZZMHJ5bXlaQm5IWUZuU2FkKzZLbXREU2ZnWnp2djVWeVJKQWMzZHQ3?=
 =?utf-8?B?NWsveC92M3Q5YXRTOXQ5TUN4Y3FRS1Yyem9OMHVZKzdiOFJiMUFVRjFlRm9x?=
 =?utf-8?B?VXlXN1BVV1lGVnA5WllSVUptQVpIL3ZCaDE4bC9IQzg5SUxHQzlwdjZOM1lW?=
 =?utf-8?B?SHdPdmZUcXpKdzZLVXNva0xhU2hzVTAyWjNFa3FJaXZDLzFEbHJrclNldEFs?=
 =?utf-8?B?R0k5dG83VWVGU1JVNDN1S3lJUlExdFNxVGFkb2x2aVNmdDlzVElhMm1FbXZT?=
 =?utf-8?B?cjN1bWUxQWlKQVJuM1kvYWpOREVaVS9NU2JiKzJJUXUyN0JwUTdzWW8wRThQ?=
 =?utf-8?B?amFxTGIvTkNpd2QxY1pBNVBGR2RvVTMwTEkwb2NISlJXUmhoYnhHWWR6eTJI?=
 =?utf-8?B?SEh1bVJka3hWa0ZsRExQUTZ5ZzVsRDdOdzBOMkgySi9ZT2hqUklTRmI1Yngx?=
 =?utf-8?B?ZVJmZnJJRXVXL0VJVHhCaUlVNDRzWGk0OWo3Z21YSUpWV3FKdkdBMWlyNVg1?=
 =?utf-8?B?V2l6SVBrZndkeiswU3B4eGtvRHNjUU5rR3UzdEVzWUpzZmRnL0tyQU5YRG1l?=
 =?utf-8?B?SlI2SDdaWEZKL0R4MjJGeEhBcTRMOG5EcG1ON0tNb2JLVHVuSjcrM2JTRlpj?=
 =?utf-8?B?ZkFZNlpsTTd0RVBWZjU1M0t2a1NFZjBCOEFtVmNxdHN2TFNObGc5SkpxeEww?=
 =?utf-8?B?WlI2TmJzN1lWMXRQTDQxWVFYb3NzM2Rsam9XRmpKQ0xJb2NHWEpTVzRvQXV0?=
 =?utf-8?B?VGVWNkp4YUk2eGN4YzR1L2srY0gxeWxoeXpmYmtLQlZhd2xIVEQ3dmF6Tjdl?=
 =?utf-8?B?RzJFSmppUm1HUHpvUVI3SlFSV3ozTmdNZEg3VFlkbk5pMWwza0VQZUxMdi9D?=
 =?utf-8?B?MDJITFVoS213QjJjb3hrUG9XWTdxTktCZldpNG9ZRkkzT1dyOVNEV3dpSHQr?=
 =?utf-8?B?QVhsLzErSm1zbU03Q1VEdmxXUDZuTEFXTE5NdXV2Ymd2b2oweXc5QTUvQmtr?=
 =?utf-8?B?SmxGcVhXTU9kS0JzT1pIcFYzUGcvdDdpcFlqaGZDdHBYQm1NYzRwUXZIRU5w?=
 =?utf-8?B?cTdZM0ZBNHFhUW5ubWhXVUw3OUZVZmZSWnJWVWZyNDdXMEpqYXk3RUZKbmZw?=
 =?utf-8?B?TG1kWkdsa2p6eFZSU3dhSEZpWU11OEVwT290MWkvVExWcnNmNVZSNjF1WlBD?=
 =?utf-8?B?YktGOTdUT0FiRUtnQmZmK0pZMTRkNXZ3TGtPMnpFUGh1a2JNTEdNZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jQc7+jkl8y8al43qMiVf1dr9JbHKF81zkRPS/71SKvAyugDfXJ7erAWJR7xHWesXaHf+wYKsuamTxYF92P/pecm4lEMxmosS+U2yoarAMtNLrnweCktbIgyscjSuOfEdl7icdimBkUXTTjKhrmOomKicgMPBPR4e7LuZBHtpJBIspqT3DWhCfmSmGiZh/CHL88ZS5F9je9yY7723+vjnukrn8jK+KqNmW+KXpNMhJ7gHXCj5/xHvDVkI3MGZk9ZNZvjGu7hbEbuPyYEnhYAimAHOqj7MUcnz0q+NdnOgPi4IiwvsT19ekDY6KAub5maJlCFlfpDJiYg/GhZRTitwkg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef5d2d3d-9798-489c-804c-08de8eaa0b9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2026 22:16:52.2996 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QV7SFOTp3uFfdyp3yHjyvBo6iYgUKWC+YWcIOtL4/ucII6rpaO2UhaAga9jN+TlWf/dVwrwlxZp8HCF0KPR2mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8065
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

T24gVGh1LCBNYXIgMjYsIDIwMjYgMzozMyBQTSBab25neWFvIEJhaSB3cm90ZToNCj4gTEdUTQ0K
PiANCj4gUmV2aWV3ZWQtYnk6wqAgWm9uZ3lhbyBCYWkNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3
Lg0KQ29ycmVjdGVkIHdpdGggIlJldmlld2VkLWJ5OiBab25neWFvIEJhaSA8em9uZ3lhby5iYWlA
aW50ZWwuY29tPiAiDQpQdXNoZWQgdG8gZHJtLXhlLW5leHQuDQoNCj4gDQo+IE9uIDMvMTYvMjAy
NiAzOjI3IFBNLCBTaHVpY2hlbmcgTGluIHdyb3RlOg0KPiA+IFhFX0dHVFRfRkxBR1NfNjRLIGlz
IGRlZmluZWQgdHdpY2UgaW4geGVfZ2d0dC5jOiBvbmNlIGF0IGZpbGUgc2NvcGUNCj4gPiAoYWxv
bmdzaWRlIFhFX0dHVFRfRkxBR1NfT05MSU5FKSBhbmQgb25jZSBpbnNpZGUgc3RydWN0IHhlX2dn
dHQuIFRoZQ0KPiA+IGR1cGxpY2F0ZSBpbnNpZGUgdGhlIHN0cnVjdCB3YXMgb3JpZ2luYWxseSB0
aGUgb25seSBkZWZpbml0aW9uIHdoZW4NCj4gPiB0aGUgc3RydWN0IGxpdmVkIGluIHhlX2dndHRf
dHlwZXMuaCwgYnV0IHdoZW4gY29tbWl0IDRmM2E5OThhMTczYg0KPiAoImRybS94ZToNCj4gPiBP
cGVuLWNvZGUgR0dUVCBNTUlPIGFjY2VzcyBwcm90ZWN0aW9uIikgYWRkZWQgdGhlIGZpbGUtc2Nv
cGUNCj4gPiBkZWZpbml0aW9ucyBmb3IgYm90aCBGTEFHU182NEsgYW5kIEZMQUdTX09OTElORSwg
aXQgZGlkIG5vdCByZW1vdmUgdGhlDQo+ID4gcHJlLWV4aXN0aW5nIG9uZSBpbnNpZGUgdGhlIHN0
cnVjdC4NCj4gPg0KPiA+IFJlbW92ZSB0aGUgcmVkdW5kYW50IGRlZmluaXRpb24gaW5zaWRlIHN0
cnVjdCB4ZV9nZ3R0LCBrZWVwaW5nIG9ubHkNCj4gPiB0aGUgZmlsZS1zY29wZSBwYWlyIGF0IHRo
ZSB0b3Agb2YgdGhlIGZpbGUuDQo+ID4NCj4gPiBGaXhlczogNGYzYTk5OGExNzNiICgiZHJtL3hl
OiBPcGVuLWNvZGUgR0dUVCBNTUlPIGFjY2VzcyBwcm90ZWN0aW9uIikNCg0KVGhlIEZpeGVzIHRh
ZyBpcyBkcm9wcGVkIHNpbmNlIGl0IGRvZXNuJ3QgY2F1c2UgYW55IHJlYWwgaXNzdWUuDQpBbmQg
dGhlIHJlbW92ZWQgY29kZSBpcyBpbnRyb2R1Y2VkIGJ5IDllMDAyZGY5MWY5Yywgd2hpY2ggZG9l
cyBub3QgaGF2ZSBGaXhlcyB0YWcuDQpXaGlsZSA0ZjNhOTk4YTE3M2IgaGFzIGEgRml4ZXMgdGFn
IHRoYXQgd2lsbCBiZSBiYWNrcG9ydGVkIHRvIHN0YWJsZSBrZXJuZWwuDQpTbywgdG8gYXZvaWQg
YmFja3BvcnQgZmFpbHVyZSwgaXQgaXMgYmV0dGVyIHRvIGRyb3AgdGhlIEZpeGVzIHRhZy4NCg0K
U2h1aWNoZW5nDQoNCj4gPiBDYzogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5j
b20+DQo+ID4gU2lnbmVkLW9mZi1ieTogU2h1aWNoZW5nIExpbiA8c2h1aWNoZW5nLmxpbkBpbnRl
bC5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ2d0dC5jIHwgMSAt
DQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9nZ3R0LmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9nZ3R0LmMgaW5kZXggMjEwNzFiNjRiMDlkLi42OGQ1NGRkZmNkYjENCj4gMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2dndHQuYw0KPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9nZ3R0LmMNCj4gPiBAQCAtMTE1LDcgKzExNSw2IEBAIHN0cnVjdCB4ZV9n
Z3R0IHsNCj4gPiAgIAkvKiogQHNpemU6IFRvdGFsIHVzYWJsZSBzaXplIG9mIHRoaXMgR0dUVCAq
Lw0KPiA+ICAgCXU2NCBzaXplOw0KPiA+DQo+ID4gLSNkZWZpbmUgWEVfR0dUVF9GTEFHU182NEsg
QklUKDApDQo+ID4gICAJLyoqDQo+ID4gICAJICogQGZsYWdzOiBGbGFncyBmb3IgdGhpcyBHR1RU
DQo+ID4gICAJICogQWNjZXB0YWJsZSBmbGFnczoNCg==
