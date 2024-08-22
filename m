Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F568C52D6F
	for <intel-xe@archiver.kernel.org>; Thu, 22 Aug 2024 02:20:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 544EA10E653;
	Thu, 22 Aug 2024 02:20:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FKZR8GOf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586CE10E653
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Aug 2024 02:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724293226; x=1755829226;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=VOTJtDSt9ORL6e8X1NnQgxVw0UnP4JwUwy9yqHwwqdQ=;
 b=FKZR8GOfmuZlZpno9A9XrUcAzzCyapjc+pz4lEmmDQAyqdydQA3dhJtS
 rabYu+a0FaFmT24TNBngkjBf+lJfWMWrZQhcdGmaKUD797qTG3KoBHAWu
 xq6h18ZgNthGA9/QNQ8Cru9Yu7Dj++hxpNjVC/hLxOG8KzLrJ3GVHUcXA
 ysdxp+Lfl/USOaFQK9uHhZ2ZwgJdna0LzmESJxF0z1VxSb2SKTSccugeq
 NsCogl1/RCBfhTSoeKvPihUNw4Eg34sOYvq15xAdvYGgqpG/wn7rThlTg
 uNSKts10+94iUPKuo6uem10AdCpZFka01OY/NB/oUdZ6vK6ZV99WPf1ct A==;
X-CSE-ConnectionGUID: pQTQKl3zRVWna0vhLl9Txg==
X-CSE-MsgGUID: oFk5FZxKTOG3bnLMzr2cKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22820203"
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; d="scan'208";a="22820203"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 19:20:25 -0700
X-CSE-ConnectionGUID: V+eOGaI+QI6Z8Mtkk1Dasw==
X-CSE-MsgGUID: GlXy/co4SJmamrBsts+gBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; d="scan'208";a="60948115"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Aug 2024 19:20:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 19:20:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 19:20:24 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 19:20:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZY6tTKXzpj2Jvh855s200j6AS3EjYctGp9mneNwD1qpz/ajhLg3k9s5D65HydGgianLcZrjCasBueXa7impo0fbhlFywDA0Ec5FzOPZERh+QS0ilsxOZyYIxv332irFJCXNYQCcll2kIasoZNz0KAlFxY8+a1uXaB3/y6DjK8txQxr8LoGBEEL4W4G1HdwTGD0kHpLiAeNDiAbPnmUp0RKKoR7S4AbgAie7K/YQSVPy8GllucZbp4Z4dlfGgoMnkwRd/17CL17o7ZFnl6voP0pW1Weuura6OmdeNOIot3l6cLcUvFUgt4onXJbltLqcktf93v17VARkyfzyBjPf/4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOTJtDSt9ORL6e8X1NnQgxVw0UnP4JwUwy9yqHwwqdQ=;
 b=R4bDsTIJFBHnNFUT55ruG7qCxgOI5BcmKwNMQwKqe3SNf8LNJ9Hy0PzyYG3Yjk1Txyluk+AXjkLdcb+2dgrnTv5PiQKSdo3roRCh3HC14BGv3iT1rtFfgbKbL1W3s89iWWEWTsXNuxEXRR8Q22mKmhZ7xiwuQpasI1JuxOYjbT5lc/N/glfwQx2+HxXwPH9pdW0N+le6/dYAS/KYCR9eVFBWiPbboXtlcDCmV5gNssgBX/q3iqpfpZ1S09/BAcngsWY/MUikfjjldbTSrX30lOT1GJ/l7ad3PuqwQcDunmIQay4hnc2iZaVASIBtKioOHBs9G8Sv9aLRCnI0KJgwIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CO1PR11MB4899.namprd11.prod.outlook.com (2603:10b6:303:6e::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.21; Thu, 22 Aug 2024 02:20:21 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%4]) with mapi id 15.20.7875.019; Thu, 22 Aug 2024
 02:20:21 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v16 6/7] drm/xe/guc: Add dss conversion from
 group/instance ID
Thread-Topic: [PATCH v16 6/7] drm/xe/guc: Add dss conversion from
 group/instance ID
Thread-Index: AQHa8qZhJPUt4G4CEEePVkqj2ax3T7Iyjl2A
Date: Thu, 22 Aug 2024 02:20:21 +0000
Message-ID: <7067e3a7cef748240cac800d93ce475e9cb104bc.camel@intel.com>
References: <20240820021142.436536-1-zhanjun.dong@intel.com>
 <20240820021142.436536-7-zhanjun.dong@intel.com>
In-Reply-To: <20240820021142.436536-7-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CO1PR11MB4899:EE_
x-ms-office365-filtering-correlation-id: 3c2117a7-0493-4364-f7e8-08dcc250f908
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NFFzYWFtQ3ZRUy9QZEN5SFZDcDdjNmtmTy91VXFvUUprYlFLKzFDemt5azhs?=
 =?utf-8?B?QndzRTRFSFJiZ3BoaGltZ1ZSQmt4MW92ZmpzQmlTb0tvbWRMQ0ZiVkVMWk92?=
 =?utf-8?B?QzFhaUFqT1pMVFZqZDA4L0c5SjJZRDZ4Vkw2VjVHaG82MXQrVU9TZUJSSVdy?=
 =?utf-8?B?L3NLUDE4Ti9HTFFZQXE3cXdVakxHU0pxak5IVHZnS3VzREVzUDJBRG5vRFNL?=
 =?utf-8?B?dGZoWVNac1FCTHorMXFEbDl0di9CUHBvWW1hTXg3VjJJSGR1T2kzVEdoTkJp?=
 =?utf-8?B?LytHeHdFODNjUU8vMkY2bnVUUlluOHZ6eWg3TXRwMVp2U0t4TS9PUHptSE5Y?=
 =?utf-8?B?enpQcU9NN2RlVjF6MGtRY1M3enQ4UU5pNTJzdFZZckEyUkRZQ2hndzZSQ2E3?=
 =?utf-8?B?emJwOFVXbXo0QnRFOTh5b0RQVU1ITU1Mbm9iMEl3dDFwNHZqQW1tQjJlYUxP?=
 =?utf-8?B?U3ZQT1EvcnB1NS9MY3B0VVlPTjh3QWh1bzNnNWxNRW04TjhKV3U3cmgzc2pO?=
 =?utf-8?B?Q3JLbnRDQW94NmVISm92MVloQUdyWjRZaERzVnAxMDR6TFNLUjJ0YmVLN0VG?=
 =?utf-8?B?dkR5dytKUDhEUFpRYjNQRzFUVkhhbmc4T2V3Ukt1a1BpK0tKTHNjaHo0b293?=
 =?utf-8?B?SE5rbzltekN2UDZqdC9mQVpyMFo0Q29STG5yQnhOcHRYWkpBWEhtSzhjQmV2?=
 =?utf-8?B?SUg1RndlQXZOeUZ4bWJOSC9HbHFsSG5wREhnR0ZYRytreUNId2d6eEtGU1Rw?=
 =?utf-8?B?RElVNHA0U09qNlV1K1JJN0JqellhVDlhUFZYcXQvSHNKMmM1ZUtkNDZTWm9t?=
 =?utf-8?B?WTRscVFUdXR3c0VrVVhzR3lQV0g5dzYyRVIweVdYbldjNUVzVHI3dEExUnox?=
 =?utf-8?B?VE1ucmlrS3gzTzhiUm5hTCtBOFI1Yi9qRU50ay9lb1pxbWRXcnJxR2hnV3RI?=
 =?utf-8?B?U1QvZ2wvTm9HYmUydDNUQlFzbXJNKzNUMFl5UHIza3BKZ1o0dHRuZ2RhdjM2?=
 =?utf-8?B?T0pUVm9tRXIwOS9YOUpyZUxISkFBbjJia3BKdC92M0JENVBvYmdtZ1lNRHJV?=
 =?utf-8?B?a1BxaFdacU5PcmdXU3JReVhPZk9NLzh2SE9Qb3lRV0NpbVFlL3Uxa3RjY3pa?=
 =?utf-8?B?S05Kb0NSOTBXNmdSc21Mb25jVU1JeGNQLzB3a1hhQ1Y5YWp6cU1ablloSThy?=
 =?utf-8?B?ODUrMEY5QVdTNXJGczFHMTNpa01KSlE4RWVTVmFKdG05N2VxSDBjcnF6QzE5?=
 =?utf-8?B?bTZYeDB0dXEwRzJnVEZ0YnF0eFgxQTRrVVVMUEFXNDd3c0tMQ3k0SEFtdEJq?=
 =?utf-8?B?MVVpRWE2RnViWS9uS2JUeTNDSGpwbWRhSWFVRGhLQ2I0TmdLZ0dnbDl6WlJp?=
 =?utf-8?B?OGRBVWo1dEc1VDR1czFHaWlnUUVyamxMdGdwdnF4cHY1MzdycDA1aGg3REsw?=
 =?utf-8?B?OEg0bFZWTlMrVXBqVmxIOGRLRGV3NGdjTTlSK0pJcUU2aHU4ME9Ga0V4Y3hn?=
 =?utf-8?B?NlMzcTRxdEZBY0R6dTRxOHIyNXNKRlZHdGtRSWFmTURCaWY1anplZEo5aTBJ?=
 =?utf-8?B?VGI4OXdwMXJ0dG5WaVV2UVY2Z1lXR09hMFRjRjd2bW1aL2l5bTBDUWdySzFt?=
 =?utf-8?B?MmwzZnF3alNOMXhJYmo4NnFGRmpvazV4RlRMdzhDV2pYRjNuM0krOVN6Z1NC?=
 =?utf-8?B?QnFqc1c5WWpxcGRVWk1oQXVmMG5nZkpDem9GR2UvVWhJeFF2RWJKMHp0UndP?=
 =?utf-8?B?N0Y2OEFrTGRrOEtubGpFYVpTQU5qM3ZSMFZuSUFyazFBME5kREdjdW9wenc0?=
 =?utf-8?B?TG1jYkZVNXg2Wmd2T2ZIenpYeVdROWZzYWppd2VaMVQ5SzdUODRWOGNpd1I1?=
 =?utf-8?B?a0dQUnFxYWFxeFBTWmhvWVYwQ3JNNlZKRVJhZTVRVmdYeUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UytoVENkRFRnZlRkOWVpSlgyNWFnRGNDMmlXNS9oUWlGaElOc05rS3ZDUjM1?=
 =?utf-8?B?bHVWUUR4eGlEMmlJVU13Wm04emdRUVk0RlV0bEdhWkdpaVFibjNiMzZWL3Fy?=
 =?utf-8?B?RCs4bytndG8rTmc5MDRudnBHODQwZ2VGQ3l5cFBtS3VRUmtuOXhjRUVqVFlH?=
 =?utf-8?B?aTl4cjFxNSs3TVdzWVVqb1hES1R4TWpOTUhGMDA0alpvM0hacEpCc1d5Sk5v?=
 =?utf-8?B?bStLTzZqbWt0SnRLMWlLTnYzSGpITFJOMVFLanZPY0FPbDU2R1JxSXZpNkxx?=
 =?utf-8?B?T2s2THlkbGdBVURuQzNVN0pyTE4xZ09tTEt0RkNxbUU0STZBS0Y3Q3V1MTIv?=
 =?utf-8?B?SVRVcEFadUFTMEt1TkxibFFOQWNPaHc0VlVBbm9zaWxyazhNMWlITzRIdUVD?=
 =?utf-8?B?N3JWOUE1V0NwUWtwVWJkZWgwWDRGV3hXZk9JOHVWemx0WCttUXM5TFg4aDhs?=
 =?utf-8?B?ai9sWGd0dzZqT0FlU1EvY0tjQkdiRVNTUzdpQVc1aUpMeVZvVStxUkxXbmQ0?=
 =?utf-8?B?UTZmQzJjbTBURU5TaVMzN1diRFdjQm5tZ3BGYWtpZ052bkNhclMrbWZPRTlP?=
 =?utf-8?B?MTRYTVQyMUNFM0NUY0RBb0xOc2lnUHVtcEhRWmxCVXlKUXJDSjV4RWo0V3ZN?=
 =?utf-8?B?K3lJY0xJdEZ3M0JwSFlJT1M0WWlSNmFhbENTSGVxdExiTFlxQlVWakxOM1F0?=
 =?utf-8?B?MEhjN3NpTVJiMWxRSUY1dXArRkEvSmtmMnYrRUxldy9xN0x0dXhhNXZSQnZN?=
 =?utf-8?B?cEd4T3Q3OW9wVFg2OUMwY1VYTks3dGU4cEdnZjJoSEpkN05KZXh1dVR1WHU5?=
 =?utf-8?B?ZWUrd3BFZEpha1VVRWtIRGpXY2dLbUlib3RGTi80Q0pENEFqZDZBbURBcmhL?=
 =?utf-8?B?ekNXUERGczhLTlhnbXpqZlNjMktJTThrN2o1SWlSVTdnVnFRNkdja3RqRDZU?=
 =?utf-8?B?YkZ0bmRHVnRHQThFUmFqbTF0RUtzbGlUS0MxdVNVUVZpUitvNkZyWms3UlBh?=
 =?utf-8?B?S1dKR2UyOXVhQWgxTUNSbUVzY0xhZEFQTHd0cGpyQ1hXUm1jZUgrYlBScDZR?=
 =?utf-8?B?V1pWWncwQTY1UGo4ZU1zWUxkVU9hNG5FR2RjclNrcWhhS0NHMmZhWXBRVUJY?=
 =?utf-8?B?T1NQd1FUdnBXUFgySE5zTHByS2VtT1VaaEtzN1BhUURDR0xiamE2OHFUcDVr?=
 =?utf-8?B?VHYxSWFxalZtSFNPSVFTUmI4RERISFAwbzRkVTFFMXh5R0dPdmVRVHRXdUtO?=
 =?utf-8?B?T3FLcU5QQ2hyRUltMksvU1BRY0JENkpGL2lUU1UxemNQZzh5TldPOUttQW9j?=
 =?utf-8?B?QUJQSHFXeHhOVlA1aU9KWGM0Zy9YQnRnZ3VyZmFsaFZHbTZ6dnJLKzM4TVJx?=
 =?utf-8?B?ejd4d1dPM09va2lCUzkyTGFZNjNxOFp3OUFTWWs5S3VhU3d6bTFOZUwvalFO?=
 =?utf-8?B?VWVJbjg5ZnFvdXNqdVk3YWd5cHJCRnpvWnpBbmFyNkQvYmtCRVkwVE0wa1V2?=
 =?utf-8?B?UzBCa0Y1R2ZzbmU5ZGl0K1hjVzJQZjNGVFcvWXpra2RRVWlkeW9iZys0UkVy?=
 =?utf-8?B?VVkvVnJjOXA3ZXd0RFNLZTFYM2xsQk5wanNUeS9LR0EvOVVaVW9CbSt0Q2to?=
 =?utf-8?B?QjlwSURFTE9nT2duYmViSytRbmRycUtoZFBxbW82eTREMTNVQUZGOCtYTU5Q?=
 =?utf-8?B?L1dVc1ZBV25OdWNvb0dSaFNZSW0rNEdZNWZSblVxUVVPYy9BZUtwRjk2RHRr?=
 =?utf-8?B?MGh0R3BYc1BPd2g4UC9NN1I4T0JJK2M0MFdpSHN6TEZ5TXdKVTdrSFZJckc5?=
 =?utf-8?B?eEc0S0RtQm1FNnJ0OFB3akJzYVZtU2gwaHZ4MExEWUxseDhkZWRlV0tIcWVh?=
 =?utf-8?B?RlFWUU5aVWYrNm12NC9IckZ5b3V3WDFUdG82L0RLNXYxakhHZzdXSER1eUZa?=
 =?utf-8?B?MkhzSTFScExkc1ZrYTc0NE90aUQrRXRIYXB5cmtsSnY4Zzd3QzJxbXlUdlVJ?=
 =?utf-8?B?WE96RlpURTdiKzFKamxRWkdzN2xpc2hrSEptTTVwOXJoSHZ5aHhCdXhBWVZZ?=
 =?utf-8?B?WHh5U2VncEpST25iK2ZmMUF4TFlCOUF3TXZPSlpjbEZvOXowWDNRek5FMWhC?=
 =?utf-8?B?cUZoUEVhRzlkSEVBZVZjQkc5RnhXUll5SnpCb2dIa2hmRlV1UkFGcjFoZktS?=
 =?utf-8?Q?YTNPv6Iu3+jCiIG8L9Ah29I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B4B4A3666D5DEF41AAB9999E77B45529@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c2117a7-0493-4364-f7e8-08dcc250f908
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2024 02:20:21.0718 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T0qg0uSpkngXcEudEBfksWTr93/D38vWmUgwm1DUiJbMiusTDcCXqvnyC7IjG95tHhAvS1Ux9q2mM8NVKEpFiRSmPa4zziyeuhuXQU+G/CTSyRoa9N5FxZsT9se7C8Ok
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4899
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

Y291cGxlIG9mIG5pdHMgYmVsb3cgYnV0IExHVE0NClJldmlld2VkLWJ5OiBBbGFuIFByZXZpbiA8
YWxhbi5wcmV2aW4udGVyZXMuYWxleGlzQGludGVsLmNvbT4NCg0KT24gTW9uLCAyMDI0LTA4LTE5
IGF0IDE5OjExIC0wNzAwLCBaaGFuanVuIERvbmcgd3JvdGU6DQo+IEFkZCBkc3MgY29udmVyc2lv
biBmcm9tIGdyb3VwL2luc3RhbmNlIElELg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWmhhbmp1biBE
b25nIDx6aGFuanVuLmRvbmdAaW50ZWwuY29tPg0KPiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3RfbWNyLmMgfCAxMSArKysrKysrKysrKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndF9tY3IuaCB8wqAgMSArDQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCsp
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X21jci5jIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d0X21jci5jDQo+IGluZGV4IDdkN2JkMGJlNjIzMy4uZWZmOTQ2
OGNhMzcxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfbWNyLmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X21jci5jDQo+IEBAIC0zNTIsNiArMzUyLDE3
IEBAIHZvaWQgeGVfZ3RfbWNyX2dldF9kc3Nfc3RlZXJpbmcoc3RydWN0IHhlX2d0ICpndCwgdW5z
aWduZWQgaW50IGRzcywgdTE2ICpncm91cCwNCj4gwqDCoMKgwqDCoMKgwqDCoCppbnN0YW5jZSA9
IGRzcyAlIGd0LT5zdGVlcmluZ19kc3NfcGVyX2dycDsNCj4gwqB9DQo+IMKgDQo+ICsvKioNCj4g
KyAqIHhlX2d0X21jcl9zdGVlcmluZ19pZF90b19kc3MgLSBHZXQgRFNTIElEIGZyb20gZ3JvdXAv
aW5zdGFuY2Ugc3RlZXJpbmcNCj4gKyAqIEBndDogR1Qgc3RydWN0dXJlDQo+ICsgKiBAZ3JvdXA6
IHN0ZWVyaW5nIGdyb3VwIElEDQo+ICsgKiBAaW5zdGFuY2U6IHN0ZWVyaW5nIGluc3RhbmNlIElE
DQo+ICsgKi8NCj4gDQphbGFuOiBuaXQ6IG1heWJlIHJlbmFtZSB0byAieGVfZ3RfbWNyX3N0ZWVy
aW5nX2luZm9fdG9fZHNzX2lkIg0KYWxzbywgbml0OiBmdW5jdGlvbiBkb2MgYWJvdmUgc2hvdWxk
IGluY2x1ZGUgd2hhdCB0aGUgcmV0dXJuIHZhbHVlIGlzLi4uDQpidXQgaSBsYWJlbCB0aGlzIGEg
bml0IHNpbmNlIHRoZSBkZXNjcmlwdGlvbiBhbHJlYWR5IHN0YXRlcyB0aGlzLg0KDQo+ICt1MzIg
eGVfZ3RfbWNyX3N0ZWVyaW5nX2lkX3RvX2RzcyhzdHJ1Y3QgeGVfZ3QgKmd0LCB1MTYgZ3JvdXAs
IHUxNiBpbnN0YW5jZSkNCj4gK3sNCj4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIGdyb3VwICogZHNz
X3Blcl9ncm91cChndCkgKyBpbnN0YW5jZTsNCj4gK30NCj4gKw0KPiDCoHN0YXRpYyB2b2lkIGlu
aXRfc3RlZXJpbmdfZHNzKHN0cnVjdCB4ZV9ndCAqZ3QpDQo+IMKgew0KPiDCoMKgwqDCoMKgwqDC
oMKgZ3QtPnN0ZWVyaW5nX2Rzc19wZXJfZ3JwID0gZHNzX3Blcl9ncm91cChndCk7DQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfbWNyLmggYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3RfbWNyLmgNCj4gaW5kZXggOGQxMTlhMGQ1NDkzLi4zYzg0YjIwYjEwYzkgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9tY3IuaA0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3RfbWNyLmgNCj4gQEAgLTI4LDYgKzI4LDcgQEAgdm9pZCB4ZV9ndF9t
Y3JfbXVsdGljYXN0X3dyaXRlKHN0cnVjdCB4ZV9ndCAqZ3QsIHN0cnVjdCB4ZV9yZWdfbWNyIG1j
cl9yZWcsDQo+IMKgDQo+IMKgdm9pZCB4ZV9ndF9tY3Jfc3RlZXJpbmdfZHVtcChzdHJ1Y3QgeGVf
Z3QgKmd0LCBzdHJ1Y3QgZHJtX3ByaW50ZXIgKnApOw0KPiDCoHZvaWQgeGVfZ3RfbWNyX2dldF9k
c3Nfc3RlZXJpbmcoc3RydWN0IHhlX2d0ICpndCwgdW5zaWduZWQgaW50IGRzcywgdTE2ICpncm91
cCwgdTE2ICppbnN0YW5jZSk7DQo+ICt1MzIgeGVfZ3RfbWNyX3N0ZWVyaW5nX2lkX3RvX2Rzcyhz
dHJ1Y3QgeGVfZ3QgKmd0LCB1MTYgZ3JvdXAsIHUxNiBpbnN0YW5jZSk7DQo+IMKgDQo+IMKgLyoN
Cj4gwqAgKiBMb29wIG92ZXIgZWFjaCBEU1MgYW5kIGRldGVybWluZSB0aGUgZ3JvdXAgYW5kIGlu
c3RhbmNlIElEcyB0aGF0DQoNCg==
