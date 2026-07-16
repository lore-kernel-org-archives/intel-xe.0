Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68C3C44501
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 13:32:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 649B510F319;
	Thu, 16 Jul 2026 13:32:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QUC+5YhG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB1F10F319;
 Thu, 16 Jul 2026 13:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784208759; x=1815744759;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eY3pAxN4r8O446GhnJeauOCSg82Rzwj3sv9o97yMJkM=;
 b=QUC+5YhGfSKuXGkLzjfIq9WBqztJozQNuoyOYjYdjGteo5NxLrph3yX5
 l2rl7k96p1jAeINzWWFiwK3iQoeXJ2AdWmRfmLEXkkPT9DJR+rnUl45cs
 a5kXXn95735e7VPkcRevZgeyulQI8fkS1czzMghrEFwbw1mfMoGTtVDP6
 vE7e0RavVL9v7H1S1Jxa07ANIfNw7ls5pu+V71SF0Btzjkl7AvFiK7fOc
 BV+7vpQe8NIq/UFmVrtn1ImCW9AM2sNz/2UBNHnnj/o0fXIS5pPEY3NQC
 bTKTtWJWQ13bUQhXlsdEE9mPEy+88HnufbWev3zoX2IUHbJpLEtfPiTeR A==;
X-CSE-ConnectionGUID: NiqOD31LT22qTaODlDsbNA==
X-CSE-MsgGUID: Jbcfa/INSVa6HUUp7wbAJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="96235684"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="96235684"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 06:32:39 -0700
X-CSE-ConnectionGUID: FxRk/BT2SlmNKBDTcau+GQ==
X-CSE-MsgGUID: xCEPKZjQTCSQ70DCCL0BfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="254759322"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 06:32:39 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 06:32:38 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 06:32:38 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.40) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 06:32:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KaY7XyG2UK5L7PGF+X9qxDa2CVZaOR67A3dp/RTr8cVmUeQ+Wl3JwQjryjEFX+Sp0Gv1Zuh2REfXjovrD8wuWgGo+PfIkiTbcVGIB8qZxp1pfY+/Tbpi4RI9jY6wc8cqNKSCxULCVlhAHjF3z59quVhuruitu8VhAwZOQvghKinnjPIwHHEK2G1hw2r7ho805BhD0v1mdZrpCc3RatY5BmeJhF1j5oax+1lN7S0Re4w36OreWS4C7wsWDUYSt+sAeXPCs/py3ykM8Jp2QyUsPFYgEv9iGEgIgv5ruUxni5tX64eEc7N/JudWu42LlYCOkkI730xqYbH+dP/yOaFpwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eY3pAxN4r8O446GhnJeauOCSg82Rzwj3sv9o97yMJkM=;
 b=xZAWs2X6Mpfpbo8jOhkV1Zrv0UhsZFFpWvdEM+q6UgKRwRufLjxEzxwFdkOd6BhjY0UQmvRFpvMGD0rj1z8NI/B8UdQ1I81HuZ/APYkZWCaz93S1xnezRB++v2fuEC3g8/EPbwK63t17BVQvhbwzJhAnrfOMHgitZFeXcmAh7kIGE0uUlhVqWJDJfk+PgD2g3FkbqQtOg1/Lfnng3A097locbfCljzZgtiZocP3OjEOo3gH9DxnMMEyUN0Vkoqp/8QGfOCqe2CX8s4P8SiKp0eLYnNTS0ukLFGu93gOGKj1NA0x+3wOYo2gupFnU96jfzyCupivgOgqgmSQjbZkWkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by DM4PR11MB6144.namprd11.prod.outlook.com (2603:10b6:8:af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Thu, 16 Jul
 2026 13:32:34 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::5a70:4005:6905:8e31]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::5a70:4005:6905:8e31%7]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 13:32:33 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Shankar, Uma" <uma.shankar@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v3 5/8] drm/i915/vrr: Move CMRR hw registers to fix
 refresh rate path
Thread-Topic: [PATCH v3 5/8] drm/i915/vrr: Move CMRR hw registers to fix
 refresh rate path
Thread-Index: AQHdE3/bUYYuHZw5cUCluBJij5i6E7ZukMqAgAF9woCAABg0AIAAALYg
Date: Thu, 16 Jul 2026 13:32:33 +0000
Message-ID: <IA1PR11MB6348FC9AC91C3A13B42376F5B2C72@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20260714103938.2371448-1-mitulkumar.ajitkumar.golani@intel.com>
 <20260714103938.2371448-6-mitulkumar.ajitkumar.golani@intel.com>
 <4b475ef0-4572-4b6f-957a-0e5bbf256bd2@intel.com>
 <IA1PR11MB634858DAD04F80A44D36CB60B2C72@IA1PR11MB6348.namprd11.prod.outlook.com>
 <2621089a-298b-4714-92ea-aed376598883@intel.com>
In-Reply-To: <2621089a-298b-4714-92ea-aed376598883@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|DM4PR11MB6144:EE_
x-ms-office365-filtering-correlation-id: 01628213-46e4-4a08-bc1a-08dee33eb187
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|23010399003|376014|1800799024|366016|22082099003|18002099003|56012099006|4143699003|11063799006|10067099003|38070700021;
x-microsoft-antispam-message-info: P0ChZiLYmNoxzAaHb8/9xSKZgR+FLEDzp4inQjAxhSxor8KSSydLTOqlYvx+jKKwekR737GPwWJIB3gbgC4jb73OnzdxPjoAFXGOtcnQ4ko0LUKKLJRPyctgfYseg+Ls10l486qCOlUK64LoKzmtKmgu9HlzsBdxkPwT/YfEhVAWtXtcfjyRrRkLx5S8aDtuje8hQXzPuLAJmtADQzAtMInfxpbRpw9YAKtX43VTn9th4p8cWClx/SaE5pezIU4hXliUSiQVzQQ8gNKwIpCP5770EhhELp/6WbTjLO0tXPhXYeA9QccIcW4fxrSBBGCesR7lzNeLrM5CACVnAM9LRhai3pm0VeZFcTeneNbkaXuZO8b7DMqIEfKAPEz4mVQf1I90YqHviHLYbvL0zbnoADyDWt4mehn9+DJ3phcCK+MHQH+b5Nf9WEPScmpb6VMULIA4paR34lvSEb3Mlpgx47rsqHSt3LXY7523cGI8FVvU9q+Nugl0mNf9d5GjeVqhqZdfsTQ8HW6BroUH7m3lrt0t3SXX+IL30fDxkrZUIyoNwdIp2HdNYzfcgOHO2ihzo935P1uXXzTZQk+H0Bm3NRnrEAHgS15ay/Gz+m9TKJlPSUb9OkZ4FZeW/rlO9PU8sUlocbiU1KZtg9VdnvGJ+CbtVl8+2/wTCEWYE//Upq5oGzcBOTp/c2IRiWf/TjUVX3qIvRDQNhVynJs0yyK7MVsCOjZZNEFN+7j/HQbvHuA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(23010399003)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(10067099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dHI3eUx4MWk1VnEzVFM2dzNZOXFPZFZsWm9YelBBRldIYW1sN2h3U2RSRGpI?=
 =?utf-8?B?RUc4c3JlWWhyUGducGRIb2hGc24vZHJsMUdIWUdJck9GWFFPVCt4bWpKZm40?=
 =?utf-8?B?V1N5a0RiUXI0Y0ExaUVDRTNjd1JXZnhQdHNPWWlFcEpjeENxNFh1T3AveVQv?=
 =?utf-8?B?bXNwUWJMM0VSMlowMUFac0FVWXlja3JBMU1ITUpPa0R2MjZJQnRhVDhWQ3lP?=
 =?utf-8?B?Mys4OWdwakVJOTBsYnhwTkFLSVVQcENhSGJPMlZjOGN5UEwyRkRQY1d4NGtO?=
 =?utf-8?B?QTVtRVJMOWpWR3FUY2RZbnY0QTU2ZHZjZXEzajNBZTNqTUMrQk9TOWNKelln?=
 =?utf-8?B?cDFFaHNWZXJGRlRwTGMvUTlrUW5SckhDN1ZiTXpUemkxaHpkWnZtdzlMb3NU?=
 =?utf-8?B?Yk9NbktqQjJVamdNdisxN05xTXpPdExsTnlxZVpIdXlWTDFEd3Q3bmI1UTlz?=
 =?utf-8?B?UFRQblp0S1c3WWJ6QWRsYjJQYzF3a3dhakhlQjRqVlMxWW1PakFBWjY2S1Aw?=
 =?utf-8?B?Y0RadkI2QUUvOTZ2NkFMWHM4SWNRUFgvaXNhSlpScVVUQ1N6eVFHVVNsQ2hJ?=
 =?utf-8?B?cXVSL2NWUUNZTFNDbG9JL29EVmdyNy9mU0NxNDRsMlpZWm9aY1JzSngyNEVL?=
 =?utf-8?B?ak9EREVKd2JqN1hPSHNIR3doUnc3KytDS3FaYmNGZmZaZ2JOQ2JHWGdpQTRq?=
 =?utf-8?B?SE1Eb1ptQncxWlFvMjMzd25PNS92dmphYW1XT0NYQ0ljRUVxelJWK1ZMNFVE?=
 =?utf-8?B?THVNSmFlZU1aVTlTdzRaZWk1aUFMTndpUEdYOWErM1BIUWw3ZU4wVzhpcXpx?=
 =?utf-8?B?T1VueXZDL2QvTktmMFc0M3VnRmZta3Y1YXFvWFBPVGdyc0YzNkt4T3ZqcGZV?=
 =?utf-8?B?aHk4V1NNbTRNci9OY2toajR0Q2dMRkNlcEFvSU5PUldrSWJKTkRTR0NCNGpG?=
 =?utf-8?B?U050c0NtbWNPbnJTK0k5am5RY3I1VHZFaEY1UTJPWGR0WmtLUUExUC9jWDhp?=
 =?utf-8?B?eFJrd1RwTmVjR1JXL3pBeklWQ1V1aFFoZklab3VBTTNmbjJZT2svS0lqbkt1?=
 =?utf-8?B?aDRzdUQ5TFFXY25wVFF3aFo4SVdOWVFqTkROcDZXTjc1YXBBZHE5cVZZTWRh?=
 =?utf-8?B?a0lWaTNHa29DV1k0N0NmTTM0TWJYeFpUOGxIVkt4RSt1ODd4TXBDa2FpU0l0?=
 =?utf-8?B?TndnMzY2MmNhWnlxVmRsVXBRUjh5TTRDbk5XZEFVdDRjYXF3c1RIZCtUSTAy?=
 =?utf-8?B?M2xLaVk1RytFbTR2aE4xMWJtUVVnWXQzK2VqMjY2TVFJNXlsWHRmd1kzaWYz?=
 =?utf-8?B?TTNZNHVtckx5cHhUVDU5YStVZXVrVkUrdEduY2x4Skx0eGxUNXlXZUI1Mllo?=
 =?utf-8?B?K1JkZDdZeWZxMkhoUUo0UEJ5VVpzNmc5bXUwS0U1TkhKSTdlSWg1ZkV3NEdn?=
 =?utf-8?B?TTBqZGgvY25xRHRxNU1uSWQrNStKMC9kMVRvN3B3Tmt1U2hHbmZDRGxKYVpZ?=
 =?utf-8?B?Z3RlVmlEZ09pdVZLOFJYMWJxeGRlTkhyOElnc2cwTHpkS2ZWZkxMRjBnSWZS?=
 =?utf-8?B?YUh0U3ExNUJlSkZQRkhSQ1F6eU9aZ2hqUnBOOXdoZTMyVDlWeUdBdyt2U2Ft?=
 =?utf-8?B?RDRKMUdLZEw3NEJnVXE5ZUpSSGpVQ2ExYUs2NUw5VUdaZnZ4RnJzak1rN2dX?=
 =?utf-8?B?S3FES1pmYmNydHZ2aDI3QndwOHdldlQ0T0J3NkYyK3pESCswNS85U1N0UjNo?=
 =?utf-8?B?SkYzeTl3UlhHWHpQVWR0bGlNS20zTmU1aTdLdFArYmVocVZHMG9HTzR1OW1z?=
 =?utf-8?B?ZVoxUk5SNUhWeW9JdWxsRVlHSW1PYTZGT083THJnSjRkQ09rbyt1NENvVDRH?=
 =?utf-8?B?Z2ZLQy9vTm1NcU95Sk1HSFlXaytQWWJ3ZisxOGJ3M1duRllWNmZPSXVBMUJL?=
 =?utf-8?B?UjJpYUdZRmZES1A2N1d0aDVncjBWUWNaOUJLOEZTd0QyVm9BcWZidno1MS9B?=
 =?utf-8?B?QXVhM3JlK0xLSjd3czJyYUtFemUvSDAvd3Y3Q2JGVWhnakQxcWpGQ0JBRmV2?=
 =?utf-8?B?cWE2QkNWQnJpL0RqZjNaU1RJUlpGMmMxVUdHcm9jSEhvUVRkeU9qczdSRGU2?=
 =?utf-8?B?dXFJRXVhUWJBN1loenVmZEtkUzBSTjF2YWFyWHRIRllhQWpPdVFKM004OGM0?=
 =?utf-8?B?MUs1WmMyV2tHdmUzTTl6ZXpJcFBmSndnbVNUclA1bjIwYTQySWNaaEdkalM5?=
 =?utf-8?B?V1VtYUU4V3Q2M2hUTStqQ1plUnlibzdzKyttU0NGczl3VWpsSUI4eVRuNitx?=
 =?utf-8?B?M1hCeGdYTTE3VmxLd0NEUW8wZVNlSjJySS9RK2lCNWJxS0ZjTDBHeWhKRnl2?=
 =?utf-8?Q?bz7JW3ge6bTgMRMyG2x961Y13i607+xIecfOFzl0+bF9I?=
x-ms-exchange-antispam-messagedata-1: 9DMjswfbKEf0H2sBc0+RAvLEzSEWjil+w1XHDbrmcdVKrrRjoU/cNf8S
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: sfF8kxmKIC+f4kcYfyOD37tldwSGwp4hNYWktWGQ1454g7gAjxVKJ2qljzyCRrFScRX/Ctg9GCHhUue09v04sA2+352uHChbVtIOo8LDwgFgav+PzAqNZy4Ssi6MopXXnJNH+uGjckjhOI0+9NIGw/Bz+OVupQJDi1e9zT2hlymm0Oy9GX5h5D2m6OVHQB1X+7GCWfrKqAHZGNpCx9eNa9V8+4hgrM78GKT57tJ0/5bDrtwn3ItXJNxGOjA8l95BzJSkX5LvtcpW8tdVw5TRp9wrhU9T1LBqry5w0lSG+zyWOczu4+c88Nio/eG5s9vydg/TEtBq2NzE+8SjsxtryA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01628213-46e4-4a08-bc1a-08dee33eb187
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2026 13:32:33.8705 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pBFMHpSqWwFW5NyCQ4IMzTLh+YJgG6UK7+8m18o4BOBxfIEORXAGDtbJTyi0I67q1Td5UDtwfeJOXln/USc/rvvg/Vv4lFN484i2ICuIopcEi5/mKHb2lGlPVWHb295i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6144
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQm9yYWgsIENoYWl0YW55
YSBLdW1hciA8Y2hhaXRhbnlhLmt1bWFyLmJvcmFoQGludGVsLmNvbT4NCj4gU2VudDogMTYgSnVs
eSAyMDI2IDE4OjU4DQo+IFRvOiBHb2xhbmksIE1pdHVsa3VtYXIgQWppdGt1bWFyIDxtaXR1bGt1
bWFyLmFqaXRrdW1hci5nb2xhbmlAaW50ZWwuY29tPjsNCj4gaW50ZWwtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPiBDYzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBTaGFua2Fy
LCBVbWEgPHVtYS5zaGFua2FyQGludGVsLmNvbT47DQo+IE5hdXRpeWFsLCBBbmtpdCBLIDxhbmtp
dC5rLm5hdXRpeWFsQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyA1LzhdIGRy
bS9pOTE1L3ZycjogTW92ZSBDTVJSIGh3IHJlZ2lzdGVycyB0byBmaXgNCj4gcmVmcmVzaCByYXRl
IHBhdGgNCj4gDQo+IA0KPiANCj4gT24gNy8xNi8yMDI2IDU6MzIgUE0sIEdvbGFuaSwgTWl0dWxr
dW1hciBBaml0a3VtYXIgd3JvdGU6DQo+ID4NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+PiBGcm9tOiBCb3JhaCwgQ2hhaXRhbnlhIEt1bWFyIDxjaGFpdGFueWEua3Vt
YXIuYm9yYWhAaW50ZWwuY29tPg0KPiA+PiBTZW50OiAxNSBKdWx5IDIwMjYgMTg6NDUNCj4gPj4g
VG86IEdvbGFuaSwgTWl0dWxrdW1hciBBaml0a3VtYXINCj4gPj4gPG1pdHVsa3VtYXIuYWppdGt1
bWFyLmdvbGFuaUBpbnRlbC5jb20+Ow0KPiA+PiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+ID4+IENjOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFNoYW5rYXIsIFVt
YQ0KPiA+PiA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPjsgTmF1dGl5YWwsIEFua2l0IEsNCj4gPj4g
PGFua2l0LmsubmF1dGl5YWxAaW50ZWwuY29tPg0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYz
IDUvOF0gZHJtL2k5MTUvdnJyOiBNb3ZlIENNUlIgaHcgcmVnaXN0ZXJzIHRvDQo+ID4+IGZpeCBy
ZWZyZXNoIHJhdGUgcGF0aA0KPiA+Pg0KPiA+Pg0KPiA+Pg0KPiA+PiBPbiA3LzE0LzIwMjYgNDow
OSBQTSwgTWl0dWwgR29sYW5pIHdyb3RlOg0KPiA+Pj4gTW92ZSBDTVJSIHJlZ2lzdGVyIHdyaXRl
cyB0byBmaXggcmVmcmVzaCByYXRlIHJlZ2lzdGVyIHdyaXRlIHBhdGggdG8NCj4gPj4+IGNvbnNv
bGlkYXRlIHdpdGggZml4IHJlZnJlc2ggcmF0ZSBpbXBsZW1lbnRhdGlvbi4NCj4gPj4+DQo+ID4+
PiBTaWduZWQtb2ZmLWJ5OiBNaXR1bCBHb2xhbmkgPG1pdHVsa3VtYXIuYWppdGt1bWFyLmdvbGFu
aUBpbnRlbC5jb20+DQo+ID4+PiAtLS0NCj4gPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfdnJyLmMgfCAyMiArKysrKysrKysrKy0tLS0tLS0tLS0tDQo+ID4+PiAgICAx
IGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pDQo+ID4+Pg0K
PiA+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfdnJy
LmMNCj4gPj4+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF92cnIuYw0KPiA+
Pj4gaW5kZXggMjVjZTU2ZDQ4YmIxLi45NWM3YjBjMDVlYzMgMTAwNjQ0DQo+ID4+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Zyci5jDQo+ID4+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Zyci5jDQo+ID4+PiBAQCAtMzM3LDYgKzMz
NywxNyBAQCB2b2lkIGludGVsX3Zycl9zZXRfZml4ZWRfcnJfdGltaW5ncyhjb25zdA0KPiA+Pj4g
c3RydWN0DQo+ID4+IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUsDQo+ID4+PiAgICAJaWYg
KCFpbnRlbF92cnJfcG9zc2libGUoY3J0Y19zdGF0ZSkpDQo+ID4+PiAgICAJCXJldHVybjsNCj4g
Pj4+DQo+ID4+PiArCWlmIChjcnRjX3N0YXRlLT52cnIuY21yci5lbmFibGUpIHsNCj4gPj4+ICsJ
CWludGVsX2RlX3dyaXRlKGRpc3BsYXksIFRSQU5TX0NNUlJfTV9ISShkaXNwbGF5LA0KPiA+PiB0
cmFuc2NvZGVyKSwNCj4gPj4+ICsJCQkgICAgICAgdXBwZXJfMzJfYml0cyhjcnRjX3N0YXRlLT52
cnIuY21yci5jbXJyX20pKTsNCj4gPj4+ICsJCWludGVsX2RlX3dyaXRlKGRpc3BsYXksIFRSQU5T
X0NNUlJfTV9MTyhkaXNwbGF5LA0KPiA+PiB0cmFuc2NvZGVyKSwNCj4gPj4+ICsJCQkgICAgICAg
bG93ZXJfMzJfYml0cyhjcnRjX3N0YXRlLT52cnIuY21yci5jbXJyX20pKTsNCj4gPj4+ICsJCWlu
dGVsX2RlX3dyaXRlKGRpc3BsYXksIFRSQU5TX0NNUlJfTl9ISShkaXNwbGF5LA0KPiA+PiB0cmFu
c2NvZGVyKSwNCj4gPj4+ICsJCQkgICAgICAgdXBwZXJfMzJfYml0cyhjcnRjX3N0YXRlLT52cnIu
Y21yci5jbXJyX24pKTsNCj4gPj4+ICsJCWludGVsX2RlX3dyaXRlKGRpc3BsYXksIFRSQU5TX0NN
UlJfTl9MTyhkaXNwbGF5LA0KPiA+PiB0cmFuc2NvZGVyKSwNCj4gPj4+ICsJCQkgICAgICAgbG93
ZXJfMzJfYml0cyhjcnRjX3N0YXRlLT52cnIuY21yci5jbXJyX24pKTsNCj4gPj4NCj4gPj4gU2hv
dWxkbid0IFRSQU5TX0NNUlJfTl9ISSBiZSB0aGUgbGFzdCByZWdpc3RlciB0byBiZSB3cml0dGVu
Lg0KPiA+DQo+ID4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaGFzIGRvbmUsIGp1c3QgbW92ZWQgdG8g
Zml4IHJlZnJlc2ggcmF0ZSBwYXRoLg0KPiA+DQo+ID4gSW4gbGF0ZXIgcGF0Y2hlcyB3aGVuIGFj
dHVhbCBlbmFibGUvZGlzYWJsZSBzZXF1ZW5jZSBpcyBjb21wdXRlZCwgdGhlcmUNCj4gc3VnZ2Vz
dGVkIGNoYW5nZXMgYXJlIGFwcGxpZWQuDQo+ID4NCj4gDQo+IFRoZSBmdW5jdGlvbiBpcyBuZXZl
ciB0b3VjaGVkIGluIHRoZSBsYXRlciBwYXRjaGVzLg0KDQpZZWFoIEkgaGF2ZSBhbHJlYWR5IHNl
ZW4gdGhhdCwgYXMgc2FpZCwgSSB3aWxsIGJlIGVsaW1pbmF0aW5nIGR1cGxpY2F0aW9uIGluIG5l
eHQgcmV2aXNpb24uIEdvb2QgY2F0Y2guLg0KDQpUaGFua3MNCg0KPiANCj4gPiBUaGFua3MNCj4g
Pg0KPiA+Pg0KPiA+Pj4gKwl9DQo+ID4+PiArDQo+ID4+PiAgICAJaW50ZWxfZGVfd3JpdGUoZGlz
cGxheSwgVFJBTlNfVlJSX1ZNSU4oZGlzcGxheSwgdHJhbnNjb2RlciksDQo+ID4+PiAgICAJCSAg
ICAgICBpbnRlbF92cnJfZml4ZWRfcnJfaHdfdm1pbihjcnRjX3N0YXRlKSAtIDEpOw0KPiA+Pj4g
ICAgCWludGVsX2RlX3dyaXRlKGRpc3BsYXksIFRSQU5TX1ZSUl9WTUFYKGRpc3BsYXksIHRyYW5z
Y29kZXIpLCBAQA0KPiA+Pj4gLTY0OCwxNyArNjU5LDYgQEAgdm9pZCBpbnRlbF92cnJfc2V0X3Ry
YW5zY29kZXJfdGltaW5ncyhjb25zdCBzdHJ1Y3QNCj4gPj4gaW50ZWxfY3J0Y19zdGF0ZSAqY3J0
Y19zdGF0ZSkNCj4gPj4+ICAgIAkJcmV0dXJuOw0KPiA+Pj4gICAgCX0NCj4gPj4+DQo+ID4+PiAt
CWlmIChjcnRjX3N0YXRlLT52cnIuY21yci5lbmFibGUpIHsNCj4gPj4+IC0JCWludGVsX2RlX3dy
aXRlKGRpc3BsYXksIFRSQU5TX0NNUlJfTV9ISShkaXNwbGF5LA0KPiA+PiBjcHVfdHJhbnNjb2Rl
ciksDQo+ID4+PiAtCQkJICAgICAgIHVwcGVyXzMyX2JpdHMoY3J0Y19zdGF0ZS0+dnJyLmNtcnIu
Y21ycl9tKSk7DQo+ID4+PiAtCQlpbnRlbF9kZV93cml0ZShkaXNwbGF5LCBUUkFOU19DTVJSX01f
TE8oZGlzcGxheSwNCj4gPj4gY3B1X3RyYW5zY29kZXIpLA0KPiA+Pj4gLQkJCSAgICAgICBsb3dl
cl8zMl9iaXRzKGNydGNfc3RhdGUtPnZyci5jbXJyLmNtcnJfbSkpOw0KPiA+Pj4gLQkJaW50ZWxf
ZGVfd3JpdGUoZGlzcGxheSwgVFJBTlNfQ01SUl9OX0hJKGRpc3BsYXksDQo+ID4+IGNwdV90cmFu
c2NvZGVyKSwNCj4gPj4+IC0JCQkgICAgICAgdXBwZXJfMzJfYml0cyhjcnRjX3N0YXRlLT52cnIu
Y21yci5jbXJyX24pKTsNCj4gPj4+IC0JCWludGVsX2RlX3dyaXRlKGRpc3BsYXksIFRSQU5TX0NN
UlJfTl9MTyhkaXNwbGF5LA0KPiA+PiBjcHVfdHJhbnNjb2RlciksDQo+ID4+PiAtCQkJICAgICAg
IGxvd2VyXzMyX2JpdHMoY3J0Y19zdGF0ZS0+dnJyLmNtcnIuY21ycl9uKSk7DQo+ID4+PiAtCX0N
Cj4gPj4+IC0NCj4gPj4+ICAgIAlpbnRlbF92cnJfc2V0X2ZpeGVkX3JyX3RpbWluZ3MoY3J0Y19z
dGF0ZSwgY3B1X3RyYW5zY29kZXIpOw0KPiA+Pj4gICAgCWludGVsX2NtdGdfc2V0X3Zycl90aW1p
bmdzKGNydGNfc3RhdGUpOw0KPiA+Pj4NCj4gPg0KDQo=
