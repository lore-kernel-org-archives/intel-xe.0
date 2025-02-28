Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11076C282D0
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 18:12:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA53E10E0D9;
	Fri, 28 Feb 2025 18:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YgwEVfxL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAB010E0D9;
 Fri, 28 Feb 2025 18:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740766338; x=1772302338;
 h=from:to:subject:date:message-id:references:in-reply-to:
 mime-version; bh=9ne0wWzqyZ4cgK8Sp4hTaY2u/v3ntHZexL2Mk/Wl0yA=;
 b=YgwEVfxLF2tIj9jEme/vWhGvtXHN/sqSEhqP4CL0j/pzMS9Bk+dXT5XL
 /q8cRnow8NRn77DY6qo0r2/lPTrDU+2AsrVZzLVcApZUjWaRx9DEslpdO
 a/DXc/ksF66iskWjAQohpSQ+6iC8mEbXye+WziVnRI7EIqFFxdagEsckk
 hQKQ0N5+LPf3AN96GaxFjXpQOmRErF25P+UGhZQoJSWYzV4obhPqQhZ5n
 MdYow2s1jwJg1IHs8mncFsaycATb00VfyBypeBYtW2zkQ6kHHMZ6dYJd8
 2TqLswxFwwOEWYw3Ns3xTRSOXLwRgeQ76mgyrvH0rckh3XNGZ15tYCoqQ g==;
X-CSE-ConnectionGUID: LwczF04mS/KGBS6ti/8KOw==
X-CSE-MsgGUID: VqdW59arSeeAUvdhNFgxhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="45487379"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208,217";a="45487379"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 10:11:47 -0800
X-CSE-ConnectionGUID: WshcOhghQr2e9HQfmpDK1A==
X-CSE-MsgGUID: JxSngcurRA6BZ2ST56kRtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; 
 d="scan'208,217";a="117390920"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 10:11:44 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Fri, 28 Feb 2025 10:11:44 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 28 Feb 2025 10:11:44 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Feb 2025 10:11:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fXY1UhSNUCpSvykuwH7cPOuUTPAKyjvO0Y2bVjjQKDQMKn2f7xWSZU/S0ODQ7n1rZmaQlFBRUWQT1/RiENtiiSKqalqANaHaLUg/+NdjK6La+23QJL18H0QAf3CPx1mgGpvw717Z+k2/jFT43SH5n6Nf2ihCnBd+xIRB8/CQnXIwA1kkHyxT9EjnbxTDSHjODSD+A6g/ZP1lfAOOpED/JRtm67pz53H3n6vFyXr21uDWAjRQGrUSfSEkVA1GWPP3Cieg/+dF8KKfgy18nmpywpy9JWMqycXDOaX6gFuN1S4bi4Glzn1StR0wa4nfKBttHrvSHxP4hN8cB895XT1wow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ne0wWzqyZ4cgK8Sp4hTaY2u/v3ntHZexL2Mk/Wl0yA=;
 b=k4TTFl098t8uwFuOPSBsoCF9Xf05/wNPc7+XK6tzmFd4lMmXvhMbWxRX1mNCukCNiZzQUqF8wwu3vXzJVbHRIF/oLk1I3nyCZl7bPo+AyM0WbrDwv+JAAvZwKqvk1Yqw3EgMV73JdGQrfSBt/nEYyUSdbH86/NfaeaHEhHmR5Cpah1dxgDmXaq+uIBOLR0taRUwE6LkzwiuIfzYJvYEaohZdYOMZGxa/HdgATpbX2hYMvLYFG4U7oDj381xXZ0XpHcfmU8fSyIRad5w44g+tClJM2uh5V/az87i292cftCT+R6cOCVqXtPRl5FXScpbeIu0buUfF2kajZ8KO5WUN1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by BL3PR11MB6481.namprd11.prod.outlook.com (2603:10b6:208:3bc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 28 Feb
 2025 18:11:40 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8%4]) with mapi id 15.20.8489.023; Fri, 28 Feb 2025
 18:11:39 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>
Subject: =?utf-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0vaTkxNS9mYmM6?=
 =?utf-8?Q?_FBC_Dirty_rect_feature_support_(rev4)?=
Thread-Topic: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cmUgZm9yIGRybS9pOTE1L2ZiYzogRkJD?=
 =?utf-8?Q?_Dirty_rect_feature_support_(rev4)?=
Thread-Index: AQHbigTpRkQuFPEExU6zm2Ei5DgkSrNdBF4A
Date: Fri, 28 Feb 2025 18:11:39 +0000
Message-ID: <623c40d4df75762ab53aa76af5d513290a2df8aa.camel@intel.com>
References: <20250228093802.27091-1-vinod.govindapillai@intel.com>
 <174076314961.3262429.3371975473416370523@b555e5b46a47>
In-Reply-To: <174076314961.3262429.3371975473416370523@b555e5b46a47>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|BL3PR11MB6481:EE_
x-ms-office365-filtering-correlation-id: d690633e-1fc4-4950-f5e3-08dd5823591a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|8096899003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?TUFQOUNFSEp3RU40Ync1RlBPakNNRHliQ1ZnZkRBSjZhZkxyazNwUnd6VVU4?=
 =?utf-8?B?UXAwZDAxckpUL09xYkE0UVY2dG04TEpxaUFCaWZIOXZTbFNPRlFUN0todlhu?=
 =?utf-8?B?VzF6M2dJNEgzRHo5VmF3Lzc5bFVxKzBnZjFQcEd1bFZOZW9NTjNEMEFzOW9P?=
 =?utf-8?B?ZVlSNTNUWmhlbHk4c25RSk9jUnR0cGhybWJVYmFpcUJESDQ0TFZnWktFSUZH?=
 =?utf-8?B?bDJyUmx3TFQ3T0FWRlBiT0pQNGYyd0x2cG5VajEzL1hzQ2tzVmE5ZEdCQkpn?=
 =?utf-8?B?eVhmTGxIUk0rTDdBeCtWSitXQzhDRlc3WFRjb1VnaGlwOVBFOVdLeS82STV2?=
 =?utf-8?B?c0JlcVQyU3hEVzV0dloydGtEUFNvd0ZXTzZiL0lvY1dRL3BZQ3ZBT1Irc2l1?=
 =?utf-8?B?bUgrZjNpRkE4R3lHUFZNanNYQzdjbk5obHo0alZTcjBKd28rdTFXbXpaRGhk?=
 =?utf-8?B?T3M2MlVQRVhoQmF6KzlMQVN1cXgzUm9IV3lROWhlelFtY0NRYVRpMlpXaG41?=
 =?utf-8?B?YTB3eVliMTF0ajY1OEhpNENaYkNaczk0MEN5MHdRSG1PaTRYeWFBbFRNWVhC?=
 =?utf-8?B?TmUySXhxUklXS3F1M3NKa2FJUWpoWmdKSlNUbWY3Z05yYnQvdU1WdndyWHc4?=
 =?utf-8?B?VkxMdDBJOW9nVncwdzhrSmJDVHQrOW94VFJoOVFuS2RQazM5NzF5U3JtVm0z?=
 =?utf-8?B?RVJPdFRkMWsydFVhK2ZrKzc1UzdjNnZweStxZDdpbmQxemJhQ1NzYXFrR3Yr?=
 =?utf-8?B?eVdNRlNPMjcySks5K2N3RGFQQWcvSEYwSTRvMTJQZVNObWFpOG5POHZqdG1Q?=
 =?utf-8?B?enRnbXlIWFFMWkoyK1FqMWNGR1VOaXlEUDl2RVNzTFkwZ2Q4UWloQmVWVnBT?=
 =?utf-8?B?a2h4WDkxRjU3c09MNVVENGZuQlVVS3d4aS9zQzM4YXJmZ056dGRURWljZVZD?=
 =?utf-8?B?Qm9hL0lQRmoyVFF3SDdHNmxSY05wT2tROHZ5SDJTdC8xWExGRUs0cVF0R2Vr?=
 =?utf-8?B?UUdsUkoweG5vU054dGQ0Vnl2MlZnWGxtU2JxZVVmZDdUUmVkSkxCM0VySno1?=
 =?utf-8?B?dVRNM1ZLYStEUEozQXFRbURoNllCblRnR28xQ0RRY0o2S3hLKzg4ZlR4R3JH?=
 =?utf-8?B?MWhreU5JeWdVT2JEUGNKS0pnaG45bm5qeldPczJwVFB4ejNoeThaNmZ0UXMr?=
 =?utf-8?B?RXRoVkd2dlJpUUI4ZC9GU2FMcWs2K2RKK0ZpWWE5VmFNWWZleXdBOTBUM3dv?=
 =?utf-8?B?QkdJcTZwRFM5L0JRY2JYZSs4Y2Uxd1FoNjBIL1lEdExhcjdiVGxkRkxodjln?=
 =?utf-8?B?UVloMTFVMG12UkxrWnh3QXNYWjZ3bmlHU01CeXFjdXVlZldZTHJVckZ2WnI2?=
 =?utf-8?B?UWl6d20weCtpR3UyNnFDamV4VWNNLzQwSkZNcll4dm1VcC8xMTZtQktwdUlz?=
 =?utf-8?B?YS9NYmx4bXptT2E3Q1JHNVowKzBxNWlnVjBWMjhwSzUwNGNhVmxOcG1jcUNJ?=
 =?utf-8?B?Y3o0RXBRejVsQ29OazFLWXcxdWVhcVdSb2JTYnl4VkJYM3lUU0xwcEJ3MTFG?=
 =?utf-8?B?amtFSWVJaEd0NVBBRy9ORnhHaXV6REdaSTZCWFh5U3NYSmRqRVhrL1VyRmJl?=
 =?utf-8?B?bDNLN3lPWmZiUmdHQ0FRVnhIZ0dKaFNJbUtPWDJVbll0Rm4yRUZwbUhTcUx6?=
 =?utf-8?B?eFZ4L2FwU3U0R2VGRnptQVBkYzRKT2E0TzUydkR0SVNCYzVMMkxwTzd2N1Bu?=
 =?utf-8?B?QVRtRTFDVE9PM20zRk9qR2o0Q0FpdnkrSWFENHV1cTJ1NXBKUE5kS215VnRw?=
 =?utf-8?B?SFZNSzZZUFd4ZlVDbSs3V3k4b0l1a2NRdjBRWFA4b1NYNFlySHJCQTA5cjRj?=
 =?utf-8?B?MUZibmZYeFE0KzhLWmMwNHNTUWVURi81bisyQXhtVFRIOGxWUXNsZTFiakth?=
 =?utf-8?Q?gnTkxoH3BT15k8nzrtDbKV/UGxB/ZgtT?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WC9jNWJKaXpjT0ZWQzA4SXVuOWlDYm9uRWxMN1Q4d2doN25UaEpwdy9zdHFj?=
 =?utf-8?B?VGtrWXJmakZ6MHVpaE92L0g2Tm9sMU9GYXRPaThMWU4vTmxPcDNmY05UQk9x?=
 =?utf-8?B?dUlQS1RrOWFOaE4wallDUnkxUWpnTVJveVdtZ1hXQ1ZJU3k0TWVrTWZYQnpl?=
 =?utf-8?B?ZlJkcmFXc0IxWDB2TmhRSndjU1VlRC9vMFJ3WmZLRDBXMTdsVWdmcGhVdHAx?=
 =?utf-8?B?Z2RubE9HQ0sxNVp1Q2NMMFc5WUd3QjN0NGhqSS9PQWhmQUNvOGNEdWIvSXND?=
 =?utf-8?B?a3QxUnJFV3ZoK01icEUyNXdaUGFkRmFjYkpSQVkzYlZZTDdlanZZVmtXUnNT?=
 =?utf-8?B?enRPK0hmakZJekp2OG80VmRYZ0dLUXBYS2ZYMlkyRkt1dVh3TFVwZnNicSt1?=
 =?utf-8?B?VWFPTFJ1ZUdkNE5NSTJZLytaL1kvZWpURFBSUzF3Um9OYzRhUEZudCtHQnZJ?=
 =?utf-8?B?WlB4bWtzRHZOakdab3R0NTBGK2hPUFdScVJ6UVNLRmIwaFRBWHowSmhOZFlN?=
 =?utf-8?B?SFpwcXBvMHRSbDRqMzltZlQ4RFZmNHRwWm5FSU9PY1BpWmtieDlwMXVKUmJR?=
 =?utf-8?B?QTByZEY2SHZKNjZrN1VpSWd2Ykpuak1Fa1F1NlJEaUtyRHllekZPMHRwdGlW?=
 =?utf-8?B?cU5CbkhEcWo4Y3IwQ1lCY0l5ZGxGdm5iUE1KM2RwaVdyazlob3FGTUF6MHFq?=
 =?utf-8?B?R0hZWlIrY01xcTVhTEpwbHB4Tmt2RUx3TlF4MFE3WjI2WmpCQ243REJsM1U2?=
 =?utf-8?B?VmMvNU5JT0Q5cm1hVGl3emo2MGtpOHJsdUxFWStjNXArbWZjTmU1MHNRcW1H?=
 =?utf-8?B?MjZ2VHh1c3RhdGdWNnZ5OGMwOTd2NGJVbmFTVmliSlFhNnVTc1RZcHBvNEFx?=
 =?utf-8?B?UXB2cXlTTXp2L0hLRXk1K1hndTNmTWxGLzN4Y1dtRlNWdjZPZXZiamdqcjJS?=
 =?utf-8?B?UGJheEpTUUhTaDdnSzAzWkdPTVR4eG5tcDBHcnhzdXB5cUhtNk5NK051UTBO?=
 =?utf-8?B?MmlYaFZGWGdWcE1taGVjampNUHdLZVVnMUx6QmVtUWhwOFpMWllpMUlFUGhl?=
 =?utf-8?B?dWNtTU1JVXpFN2hQa2JkcnVyRVg4L2QzaFV1ZTVESE15Yk84TklSOWpsYWpm?=
 =?utf-8?B?UHl1ditPWDFIMTJZZXo0MXFzRS9mLytZL1k5NndMd2VhNkZWbXN2NldBUzdU?=
 =?utf-8?B?bFgvejVwc01jM3J0ME81RTJERElCWDNCcjltTlNWN2szSTdSSmZmb0h3eHB3?=
 =?utf-8?B?QlYrZnQ0NkFHdGx5YjBEcS82WVdLM0JaeHpGMURSWTNUbWEwK0hiMEx2RHVW?=
 =?utf-8?B?R0drV2JlektTbkU4Z1VqSk1DZ0hqbjRRRjFmNDNMbHg1Qm9CcXgraTZFdEc1?=
 =?utf-8?B?SncvdHpuU0tzZkkrbmVoeHZWS1loNFpSdmxuaVdQekhYK28wbERtSVg3Mzlr?=
 =?utf-8?B?Y0t2MGljRFdXa1Z1d3doOWtQaXRmdzV3WEJia2NyQXZYU0V1RXhhZGFGMnZE?=
 =?utf-8?B?UWRYV2o1WDU5dmloVFpHZ1J0Rkp5TGE0YjBWR3NZdU5rZ0hTTFg4K2U1N2tJ?=
 =?utf-8?B?Q3loWFVEbEZQdVJ2cVlpVXdCZ29UdDhOK3Q5SXlCdHpKNkRNRkNwZEtUUHpQ?=
 =?utf-8?B?L3poWG5sd1EyVGJraFZxYVhEUy9XNUFKbDVxNXBDdmU2YnVIK1ZWSW9YL1Bv?=
 =?utf-8?B?bVl3Snd2alVOQjlNbDNBMVp4TFd1aWhNS0NXM3M4SjdTKzRESm1VeTJUVWxt?=
 =?utf-8?B?OFYvZGZGUG5WdnE3bW4rK2RyckI3eDI1NE9EM3RZLy8rcXBOMDlaVktYWW9r?=
 =?utf-8?B?eiswcHZjTWhtS3J5TkdzaG5icWNMdGhWZC9vWUR1WTRUZVMrZUF0VG8xSjlY?=
 =?utf-8?B?WXpmeE9aNmcvL2MvVkY3ZS9SL1h2TDVWK1FkOE56WW1ySmM3bFlLV0JEU0dN?=
 =?utf-8?B?U3ZFTWllWG8yZVF2eU9oNDZNbXg1eVpoZUtEMFkxMmVYZ2REa1NsOWRCT0VX?=
 =?utf-8?B?QU8yUTNpUmg3MERwNkdOSHh1VUR6cG9WYzBZdVlFRUN5bVVoS2ExRUtEL3JW?=
 =?utf-8?B?Sm44NUZpWm9mWmhJZENpUVNndmxaenRsczJCSG0zTHlQdFFKODdhK2J4dUxp?=
 =?utf-8?B?RTBaNWlHNVAzN00zMldEQi83aVhPYWhVVUx4dVBhT09QTmxtNU5QNFh4Q3h6?=
 =?utf-8?Q?8/srzK4SIn76SfBj1BweExk=3D?=
Content-Type: multipart/alternative;
 boundary="_000_623c40d4df75762ab53aa76af5d513290a2df8aacamelintelcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d690633e-1fc4-4950-f5e3-08dd5823591a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2025 18:11:39.8230 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: npEr9yuD/YrAvuo8TNJei9oHcLpkV1YE3FTYcXpqN3PhpLN31zeeMxsM8FD9bC5o00eLWZ/dRJU+OtukLp/VVeaK0G5mYdr2eUMpY1A3zIc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6481
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

--_000_623c40d4df75762ab53aa76af5d513290a2df8aacamelintelcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8NCg0KVGhlIHJlcG9ydGVkIGZhaWx1cmVzIGFyZSBub3QgcmVsYXRlZCB0byB0aGlzIHNl
cmllcw0KDQpCUg0KVmlub2QNCg0KT24gRnJpLCAyMDI1LTAyLTI4IGF0IDE3OjE5ICswMDAwLCBQ
YXRjaHdvcmsgd3JvdGU6DQpJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KDQo=

--_000_623c40d4df75762ab53aa76af5d513290a2df8aacamelintelcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <CDAC6BBD5197654885D459D3B0046526@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZT5wcmUsY29kZSxhZGRyZXNzIHsNCiAg
bWFyZ2luOiAwcHg7DQp9DQpoMSxoMixoMyxoNCxoNSxoNiB7DQogIG1hcmdpbi10b3A6IDAuMmVt
Ow0KICBtYXJnaW4tYm90dG9tOiAwLjJlbTsNCn0NCm9sLHVsIHsNCiAgbWFyZ2luLXRvcDogMGVt
Ow0KICBtYXJnaW4tYm90dG9tOiAwZW07DQp9DQpibG9ja3F1b3RlIHsNCiAgbWFyZ2luLXRvcDog
MGVtOw0KICBtYXJnaW4tYm90dG9tOiAwZW07DQp9DQo8L3N0eWxlPg0KPC9oZWFkPg0KPGJvZHk+
DQo8ZGl2PkhlbGxvPC9kaXY+DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPGRpdj5UaGUgcmVwb3J0ZWQg
ZmFpbHVyZXMgYXJlIG5vdCByZWxhdGVkIHRvIHRoaXMgc2VyaWVzPC9kaXY+DQo8ZGl2Pjxicj4N
CjwvZGl2Pg0KPGRpdj5CUjwvZGl2Pg0KPGRpdj5WaW5vZDwvZGl2Pg0KPGRpdj48YnI+DQo8L2Rp
dj4NCjxkaXY+T24gRnJpLCAyMDI1LTAyLTI4IGF0IDE3OjE5ICswMDAwLCBQYXRjaHdvcmsgd3Jv
dGU6PC9kaXY+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44
ZXg7IGJvcmRlci1sZWZ0OjJweCAjNzI5ZmNmIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPg0KPGRp
dj5JOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzwvZGl2Pg0KPC9ibG9ja3F1b3Rl
Pg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+PHNwYW4+PC9zcGFuPjwvZGl2Pg0KPC9ib2R5Pg0K
PC9odG1sPg0K

--_000_623c40d4df75762ab53aa76af5d513290a2df8aacamelintelcom_--
