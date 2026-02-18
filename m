Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397C2E9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 00:24:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED46510E155;
	Wed, 18 Feb 2026 00:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LGPZMyAU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7759710E155
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 00:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771374255; x=1802910255;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=JZXeMcVImNvaoj8bf8JGn7pumXtBAqEORLo2t6IzrUQ=;
 b=LGPZMyAUR9neP+J0Qf1Qx4xhv58ymOvjadSIpxwEdJ83EssWvZfb0uSp
 rst3C6JXwBkLVUACc2rCbDNptnlpHL3gWVrAGRfaXSxNKXBZ3MNOE3lgs
 QT0e2SPzQe/fzEJukSqXqeLgu2B2cFPhznJKHv4ZotJHvbNAuXAd50S1l
 prfZgw6aAHcdae0/P6WEX6jwMkRo/IrA6D86fpET2CGhf1a0Y6lZTU6FA
 g4m9GI1xxvFAdWIM5u0/M0JSqHRvSe8UZhJbitPHUEHFDBfxgwX2FC4Js
 TWVKXQ8yvaRte6RsIjhhxOHIjVWwjt0BLMw/AhWKfv0hTCWWNdwa1Z82l Q==;
X-CSE-ConnectionGUID: JEduBbX6SWaZ9pxof9H1Xg==
X-CSE-MsgGUID: 8CgRWojNSGm3R9q2zMAxTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72446786"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="72446786"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 16:24:13 -0800
X-CSE-ConnectionGUID: l9xtFoxTSDGUv0apMBsrGw==
X-CSE-MsgGUID: flje4YG2Tea8j2sRpWOz+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="237049462"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 16:24:12 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 16:24:12 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 17 Feb 2026 16:24:12 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.7) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 16:24:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AJWzD7FsAAaTOh8R9R489kGNPr1cztPnqzlWS3utUsgH3m0fPw9cDvLmFN4rPQNHOjQPY/ufiSzrEwXf0YwYcKKBcmItWf1jYDawhklUwt2gjqb6BZy/U701z5FGZGCIMUxAHLnH1Z/T5EIg9JHAbh7T/aDJ6ChDhxlwcsxcQ1aZQZf0T9KT1Kobdh6PO3S70DSgIFG8DTYF1iWrdvoyR7jL+yJH9fuXEKOGEjbO73mJzW49NEZxo4rTYq6Ej3/ljID7Js9cp3OknsVNkdg1GBqX5DjMsowZWzZdQmCJlOvKHtPQ99NjkMIZHv5DIWIV/Y3VwQ89HJdKDS3IXY2qdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZXeMcVImNvaoj8bf8JGn7pumXtBAqEORLo2t6IzrUQ=;
 b=m/axkTN6/d4IoEJQujcMHZ1HBq6Ulxj+8ae73zpDzqGLvs3fRGvNxTioXBn1R2OJw1jnNhymR77wsY1wZJadW+9eTEqT2lkEcBhirUDGlbrGhN3K7lVfZf+bLhE9zqOQnCidy3ZQA5MrEjT8OZN5/OR+YydzVOvwwjiK4jGodkZwXc5yMdFCdUQ8GTDuxF1ADgo06M1jvWrNDUaqUwsfojpiJdHthHyeN7JybphKS5yll3Ro1y+Le0+ezaxP+xECDavDyvBIiJek8mSBX+1iKrOVKRSY9ImxUGnh9gQH1hzKRf4yqFyjrBul1YfMkpDON6c3aJV4t2CiX9/23TiBRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH7PR11MB8453.namprd11.prod.outlook.com (2603:10b6:510:308::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.16; Wed, 18 Feb 2026 00:24:09 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 00:24:07 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Wajdeczko,
 Michal" <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Remove H2G reads in CT send path in
 non-debug builds
Thread-Topic: [PATCH v2 2/2] drm/xe: Remove H2G reads in CT send path in
 non-debug builds
Thread-Index: AQHcnS4RaTlYpc/CG0mYJLxcNPww2rWFS7WAgABQkYCAASflAIAA20CA
Date: Wed, 18 Feb 2026 00:24:07 +0000
Message-ID: <4920f526ed76e3e80cbb4bea3ae5523252221fa8.camel@intel.com>
References: <20260213211625.3117729-1-matthew.brost@intel.com>
 <20260213211625.3117729-3-matthew.brost@intel.com>
 <aZMS7Qg5AvFRE_Zb@fdugast-desk>
 <aZNWg8PTJ7vYl6oK@lstrano-desk.jf.intel.com>
 <aZROunEO_59GOECh@fdugast-desk>
In-Reply-To: <aZROunEO_59GOECh@fdugast-desk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH7PR11MB8453:EE_
x-ms-office365-filtering-correlation-id: 4a15b87c-7ec9-4ba5-f4d9-08de6e8407b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?UnFJZE9yRkhEREZ4VkJvZUtWU09SWExhdEd4OFA4bzRpczlaN2NIMHpzNm00?=
 =?utf-8?B?TmlHb25jRTdqN2g3cnJuWm1iUkRmUE5MZlJBQnhpeEU4eUFJdEZZTEdiZ1Jj?=
 =?utf-8?B?eUFxSm9pQ1hNV25zeUZCV1NXUmZrV214VFBVU1JVbkFCaVE4UkROY0lhZGVS?=
 =?utf-8?B?ZzUybEYvQ3RON3cyM0ZiWEFUQmc0VHNMOEo1cFdLSk00UGJCZkYzWkJxSzhP?=
 =?utf-8?B?eHpNejRwZ2JIbzNOUzhJQUN3UlFBamhPQ3RLRlRFUXU3UnRSRmxvS2JEYk1p?=
 =?utf-8?B?UDRTcUxXUWRGWnhrVGMyb2pHYVV6Vi8zdm1wTzN2d1h4Q2xRa1FtREJKWjZZ?=
 =?utf-8?B?a3lGbFpTWWJNem40ZkcvWGJ4dzhPbU4xSVlYOWNTQ0lHQy8yRzMwcGlZaUtC?=
 =?utf-8?B?SGtweE84VjNvUDFMZ0d2cDRoK3NxZ1NkY1lpUWkrSHVZbk1qZXVUcjVFSzV4?=
 =?utf-8?B?eEx3bi9UcVFNTUJtUHp1clFiV1Fpb3p4L0I2MlF2MmllWEZUWWdvWFQxV1gz?=
 =?utf-8?B?SkhtU3dQV1d4eXdFUDdobnFyam4wL1dXVTc2NWtkakpFeG9ic3ZzZXg2MkNp?=
 =?utf-8?B?TGFjNCt3SkFiVUxTb284eGZaNDNiQllKdGxLTlIyYXNLRWdSQWRSMVZpMDdq?=
 =?utf-8?B?cVRxdDNkVUFnVUJXU3ZSMHlLWDZ4Q3o3Vko1b0ZhSnFkNXVrVFhmbHZUTDdH?=
 =?utf-8?B?aThTS2RhczdHOVl1cWxMbG9RMWdiT05USk1NR1cyUWtBdmY5eHZRcy9LeldP?=
 =?utf-8?B?R0djMHJFRU5CdXZOOEl5c3ZHUkp6cS9vNSt6NUZHREJ3bThlUWxOdXN5a3R6?=
 =?utf-8?B?c05mVEN6aUE5SXB1ZHJBUE5mUzA5TlpnYXJDR0YwVmpmam1YQ3lOR2M1UjZK?=
 =?utf-8?B?ajR3UkdFNmR1UyttUjVWUFVDWFA0dHVUUHlOeEhaNzg1TmNoWVgwdytxNGtX?=
 =?utf-8?B?WmNkZVdDZi9wMGwvTTZNdEhNUkxXNXh4WHRTbmVLU1EvK04wMG10RUdEODR2?=
 =?utf-8?B?N2gxUWhrdEEyYllkTjlTTXNkQ1ZYQUVVaTl5bUJlemVuMldHeEN2Q2xCd2Vu?=
 =?utf-8?B?TFBUT0gzVTQwbFNWUUprWjdRNGtzc0pjRGd1NTY3UXdaQUd4R2JxZ3Y0dUlF?=
 =?utf-8?B?K2lSY3hDdFVPeE1WZEw3Qzd5NmVCZnZ4c01pdHlwNnVqTkUvbCtLTHE0Mjk3?=
 =?utf-8?B?V2ZFUnhKbFNDUEk5bDFHcjNET2x3eFBqL29Zdm1sam9zcUUzMTdTU3g1WnJG?=
 =?utf-8?B?MlpFNGpIWExmb0wzdnVXdDZDVEhKU1VOWTNYZytzamdodUpRRHMzenZrWFRp?=
 =?utf-8?B?KzE2a04xN0p5M0RveGxkQU1NRFpNRXEwaVpWYkhBU3pFRXlrT2lQOWNORUxH?=
 =?utf-8?B?MnFuWEJtZlUxSS9yRmJ2RlZ1UEgzWE83SXBpeFA3UFFSQnFyK1o0NDNkTzcw?=
 =?utf-8?B?RXJEckFhNldFTm4xZHdxZmQ2TVNTVzRIcjQxendJWTZ3RkJrekNUU1VpRldh?=
 =?utf-8?B?aUNqQ0RDbFdOS2ZtNU1RdlhhTWt2ckI4Um1rNG9IVTZZUUhybG9BNnM5ZWsx?=
 =?utf-8?B?N00rTjJrSDlVLzVkL1NGcFpZN1hBZmpmVWRTRnhZU3h0M0FTZ1dBNGhMNGd6?=
 =?utf-8?B?a3NYY0Jlc1k4VjFhb2cvay9QRFVaR0kwcnhHUjAydnRPQldVM0dZdzNESzNp?=
 =?utf-8?B?d2s3R0Fld1kyY2tITWVRNU9PQ01wWGcvbnNIbW1kMjJKN01scUUvU21MRnp5?=
 =?utf-8?B?djRwNWw1TVU5UzNodnY3aVFFVEF2U1VIWUl4enB3Wld4dVNXaVJ2TjR6OGdN?=
 =?utf-8?B?OXoreUhxZSthNDFKOVROam1WSXBOU0VJM3hza3owK2J6MXR6a3NkTnUvSGEw?=
 =?utf-8?B?ekd3MXZHQU5lZno2U1lHRlRtTitFaHB5cVJvSFFtYWUrdk5ycjFKVUErNVVG?=
 =?utf-8?B?aDJEQ3l0ekFuT3VNa3VBQzNtNXh6Z1RVcEh2d0loY081aGVmd0ZyUzZLTk1v?=
 =?utf-8?B?Qy9kOVJGb0NFWVVpY3Bab3FvdWJvbWlLMXRKd1F0L1kvV1VRZFI0Mm4zS25r?=
 =?utf-8?B?bTczaEdtV0gwZ1lFenJVWHRkOHhjdnNpWjk1R1d3WnFoTzFuNW5VSm1HQzQ3?=
 =?utf-8?B?dGV0M1N6b3RSczNLMzNyRlo4V0tWSXI0c0Yzbjd2YStFUTQ0d0duZVFqUVlq?=
 =?utf-8?Q?WfgieBwlb35a7wm2oTfVZ8s=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZFVnbmwxR09PdldyYVJOdkJ1eXYxQWwybjRJaWNsdFRCQWc4eS9xeTFTTjNU?=
 =?utf-8?B?YlZUWGhPMHJvck5nd1UyOElNaGZtc0w5cFFsZ3o3VFlDTkFFRVQyZVJScGZ6?=
 =?utf-8?B?VDFEeDQ5RUJtYXp6cm1qR0E3NStHT3pPSXVpMUdiZFhVT0txSEh2RlVFWlAr?=
 =?utf-8?B?SnlkZGVzR2NRNS9zeUpJUmQrbTZRSElROVFHZlJHSTBjS3BFU0JRY1JtODQv?=
 =?utf-8?B?MGsxN3EvMWh6bXJwR1RIenNSVGVRQjFxMDNRZUJVMWxBa1gyU2lhS1RXcGhM?=
 =?utf-8?B?dUFyVW1ua0pnV2FLMUxac2FrM3dTYWVDM0pDbTl0alJRWVY2SU1jUmRWT2di?=
 =?utf-8?B?Y3BNUE0yamQxMERISmRRTjVSMVc3OUdKRy9tNzlMTnBmaXlxOTVsRElrMm4x?=
 =?utf-8?B?WjBKK1Fsamt3R3JoVzEwMDlUTGhVaGEzejRWU1JVWTYxTjFiQ3BlZFMvbmlL?=
 =?utf-8?B?Z1dHSERWcGlMWU1rVDJNdS9XRFVwaEJQbmRlWUQ1U0pMeDh0SklZY0xlWEVy?=
 =?utf-8?B?a3FjdUdVMHdkS3FucFdObFVPdUhCWjE1RHhqb3o2Kzg1SmFaMElucWpYN3Y3?=
 =?utf-8?B?eks0V25ROGZ4R2NrNzV2T2pQYXMyRitPamxzQUxNblB6ekJsZHJmdSs3azBV?=
 =?utf-8?B?d3Q2UlVFQ3JPZjV2Mk9PenVWaFBQam43U3RzdHlsL1diZmlrQVRBdDZBN3RU?=
 =?utf-8?B?YVovV3c3ZGZ1V2tSSGt2ZzViai91dDArYmt6NXJCeSt4YmtWdzlaRlhIVWty?=
 =?utf-8?B?T2w5RE9IYW80NElBRTlHcHBmbVhzTGJ4cFpoQ3ArTSthUlIxN3BxcUhlT3BK?=
 =?utf-8?B?ZVFuaWtialE5VlRWK1EwY2UvSXdDQUZnSG9hNUNuc21jc0h0KzdTMTdKdTVF?=
 =?utf-8?B?NkdGUHNZOGNoUlkrSzVVNEgzN0JkWS9FU2JEa3NFeUpGVDh1akp2aW5HUnI4?=
 =?utf-8?B?czhlR2pvSHVrdVk0aFZGTnJnOXQ4ckNkRlI0MkVJN0Z2MmE3WGx1ZGhWcCtR?=
 =?utf-8?B?YjRnTTJxbzh3YXpMRjVNbFEzaUFIdkNsOUxQbEw2a1BKdzlHZFhVdjZ0T0JZ?=
 =?utf-8?B?SDFPUGNVd25MMW8wajR0eGdzTGU2VTlzNW9KaHlQWlNjTmh3UVBMZ1FBWXFu?=
 =?utf-8?B?QitGM1ozOG5EUkt0Ukk0QjJJSGtxL0NIWXg5VThVS0JlRlhyak1VM0NPOGYv?=
 =?utf-8?B?MkdyK2xGbmpUUHYyT094M1JQR0xEdEVmVEdONzhBS0FxdlA1bnBpMWxKZWtK?=
 =?utf-8?B?RWZGSjhEZlNhaC9vdmxjMjM2N2IrVkI5ZUNlQ3ZhL1k2bTJXaUJUenB2OUFP?=
 =?utf-8?B?dEZiYmpWRnZSbUxtc1lva2ZlMk01cUtqckY5NWpLa2daVjFKZUtFY3U1c1Ji?=
 =?utf-8?B?VW1VVGJ1WVdXSUtNYWJXcmQvVHVJRlhHTk0yMXNqcTIyc1lIYXdoVElnTkl1?=
 =?utf-8?B?SjhLZ0x4MUdGVUZsaXhKeXRINHVocnU2bllxWk0rdnFPYjFObzJ2cjRpVjh6?=
 =?utf-8?B?c05sV1VoQUlMUnJKV3RqNGI1YU5Obkx1V1hPN3pPc0VJWkZqUFM5d0JtbGtv?=
 =?utf-8?B?blluNXl3S3pzZ2doTm5iUjViekV6OHdkWWZnS3JjVGgyOXBNcUFqZmpqZXZv?=
 =?utf-8?B?c0VPNzZ2YzcrOGI0L1huTWUzSnFUUGJmdCtQcHVSVnJFTzUxRTNBUG80Ynli?=
 =?utf-8?B?SW1GbW5hV3RLTjFPMnd0bUZ0MVV5WkV6Rk9VckwrTXpIaWVPenJpYVNHM2t3?=
 =?utf-8?B?YzlmUzUrYXFybVVRU0x6NVhiL0xtZE1NR1BYVkMxd3pIUDJneXB5SGtCb1Bx?=
 =?utf-8?B?ZmJlcUdTTXh5N0NzcjFaaG5qelRURlJJdU16RFJGY3VLc2JQTFFGTUhVVFlL?=
 =?utf-8?B?bm45MVRqakJCQzUwOEdoaGZuTnFVbWRJMENBT1pqWWszdFA2Qy81elhTNXJT?=
 =?utf-8?B?cGh5a3B0elIrM0xMQ0lvTWJVL2lLVnhHNUxJSVU3dnZISzlFYlZSVVJSYXR5?=
 =?utf-8?B?RW5obC9TVXRFSWNaQ0x0SWxNbzVib2x3cjg5a1ZYd041WXhnKzd5QXBLRWdT?=
 =?utf-8?B?dytLWlVBZTdReG5YSmJ1bDFNRkEydUIreHJGV2RxRCtLU1hJcVgwZ1lva0w1?=
 =?utf-8?B?R3VnRU9ZbkNVK2l4ajQ3R0JKUE9LNmRicjhTamVVS1FmcFpnblhSckxiT1Fr?=
 =?utf-8?B?MTljVmR6RDUwL2grU29KL0dLZ21lMzF4T1BwcWV6dFZrdllzb01CclQ1eXBs?=
 =?utf-8?B?U2J6MFMvYzBnbk1CczlhaGRSbFVOVXZtSm1qbC9PeUtvb3BjeHhpYnJDN1Ru?=
 =?utf-8?B?QmhUKzFlbDlrYlVseE5FTy9neVNreDh2TWUyS25TSlJnNUlRc3h1d2lCQmgw?=
 =?utf-8?Q?suBzv6iMtOME5YFQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <73E0A5464866614E84855F170CD87677@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a15b87c-7ec9-4ba5-f4d9-08de6e8407b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2026 00:24:07.7458 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +snpPmsIlWUXp3ZmvdjcnGs5OsFjImYLCFisditJUd8E4FhcMsWTRO8R9ekV+rxqM0U72kdfxE894pKI/ADSOteBFIdTqzf01ip3AOweoQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8453
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

T24gVHVlLCAyMDI2LTAyLTE3IGF0IDEyOjE5ICswMTAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
DQo+IE9uIE1vbiwgRmViIDE2LCAyMDI2IGF0IDA5OjQwOjE5QU0gLTA4MDAsIE1hdHRoZXcgQnJv
c3Qgd3JvdGU6DQo+ID4gT24gTW9uLCBGZWIgMTYsIDIwMjYgYXQgMDE6NTE6NTdQTSArMDEwMCwg
RnJhbmNvaXMgRHVnYXN0IHdyb3RlOg0KPiA+ID4gbU9uIEZyaSwgRmViIDEzLCAyMDI2IGF0IDAx
OjE2OjI1UE0gLTA4MDAsIE1hdHRoZXcgQnJvc3Qgd3JvdGU6DQo+ID4gPiA+IEEgc2luZ2xlIFZS
QU0gcmVhZCBvbiBCTUcgY2FuIHRha2Ugb3ZlciAxwrVzLiBXaGlsZSBzbWFsbCwgdGhpcw0KPiA+
ID4gPiBpcyBhDQo+ID4gPiA+IG5vbi10cml2aWFsIGFtb3VudCBvZiB0aW1lIGluIGEgaG90IHBh
dGguIFJlbW92ZSB0aGUgZGVzY3JpcHRvcg0KPiA+ID4gPiBIMkcgcmVhZA0KPiA+ID4gPiAocG90
ZW50aWFsbHkgYSBWUkFNIGFjY2VzcykgZnJvbSBub24tZGVidWcgYnVpbGRzLCBhcyB0aGlzDQo+
ID4gPiA+IGVycm9yLWNoZWNraW5nIGNvZGUgaXMgbm90IG5lZWRlZCBvdXRzaWRlIG9mIGRlYnVn
DQo+ID4gPiA+IGNvbmZpZ3VyYXRpb25zLg0KPiA+ID4gDQo+ID4gPiBBYm91dCB0aGUgY2hhbmdl
IGl0c2VsZjogSSB1bmRlcnN0YW5kIHRoZSBwZXJmb3JtYW5jZSBiZW5lZml0IGFuZA0KPiA+ID4g
dGhpcyB3b3VsZA0KPiA+ID4gbWFrZSB0aGUgY29kZSBjb25zaXN0ZW50IHdpdGggdGhlIDIgb3Ro
ZXIgcmVhZHMuDQo+ID4gPiANCj4gPiANCj4gPiBZZXMuDQo+ID4gDQo+ID4gPiBCdXQgdGhlIGV4
aXN0aW5nIGJsb2NrIHVuZGVyICJpZg0KPiA+ID4gKElTX0VOQUJMRUQoQ09ORklHX0RSTV9YRV9E
RUJVRykpIiBzZWVtcyB3cm9uZw0KPiA+ID4gYmVjYXVzZSBpdCBpcyBub3QganVzdCBhYm91dCBv
cHRpb25hbGx5IHByaW50aW5nIHNvbWUgZGVidWcNCj4gPiA+IHN0YXRlbWVudHMsIGluIGNhc2UN
Cj4gPiA+IG9mIGVycm9yIHRoZSBmdW5jdGlvbiBhY3R1YWxseSByZXR1cm5zIGEgZGlmZmVyZW50
IHZhbHVlIGlmDQo+ID4gPiBDT05GSUdfRFJNX1hFX0RFQlVHDQo+ID4gPiBpcyBlbmFibGVkIG9y
IG5vdCAoZ290byksIGFuZCB0aGlzIHJldHVybiB2YWx1ZSBpcyB1c2VkIGluDQo+ID4gPiBfX2d1
Y19jdF9zZW5kX2xvY2tlZC4NCj4gPiA+IA0KPiA+IA0KPiA+IEkgY2FuJ3QgcmVhbHkgYXJndWUg
d2l0aCB0aGlzIGxvZ2ljIGJ1dCBJIGFsc28gc2VlIHRoZSBiZW5lZml0cyBvZg0KPiA+IHZlcmJv
c2UgY2hlY2tpbmcgb2YgR3VDIHN0YXRlIGluIENJIGNvbmZpZ3MuIGZ3aXcsIHRoaXMgbG9naWMg
d2FzDQo+ID4gYWRkZWQNCj4gPiBoZXJlOg0KPiA+IA0KPiA+IGdpdCBmb3JtYXQtcGF0Y2ggLTEg
ZDJjNWE1YTkyNmY0Mw0KPiA+IA0KPiA+IFRoZSBjb3N0IG9mIHJlYWRzIGFyZSBhY3R1YWxseSBo
dWdlIGhlcmUgLSB0aGlzIHBhdGNoIGJ5IGl0c2VsZiBpcw0KPiA+IGluY29tcGxldGUgYXMgYSB0
cmFjZXBvaW50IGJlbG93IGRvZXMgYSBkZXNjX3JlYWQgaW4gdGhlIGFyZ3VtZW50DQo+ID4gbGlz
dA0KPiA+IGFuZCB0aGlzIGlzIHVuY29kaXRpb25hbGx5IGV4ZWN1dGVkIGV2ZW4gaWYgZnRyYWNl
IGlzIGRpc2FibGVkLiBPbg0KPiA+IEJNRyBIMkcNCj4gPiBiZWZvcmUgdGhpcyBwYXRjaCAvIGZp
eGluZyBmdHJhY2UgYXJlIDMtNHVzLCBhZnRlciB+MzAwbnMuIFNvIEknZA0KPiA+IHN1Z2dlc3Qg
d2UgbW92ZSBmb3J3YXJkIHdpdGggd2l0aCBhIGNvdXBsZSBvZiBmaXhlcyBwYXRjaGVzIGZpcnN0
LA0KPiA+IHRoZW4NCj4gPiBpbiBhIGZvbGxvdyB1cCBlaXRoZXI6DQo+ID4gDQo+ID4gVGhlIGNv
c3Qgb2YgcmVhZHMgaXMgYWN0dWFsbHkgaHVnZSBoZXJlIOKAlCB0aGlzIHBhdGNoIGJ5IGl0c2Vs
ZiBpcw0KPiA+IGluY29tcGxldGUsIGFzIGEgdHJhY2Vwb2ludCBiZWxvdyBwZXJmb3JtcyBhIGRl
c2NfcmVhZCBpbiB0aGUNCj4gPiBhcmd1bWVudA0KPiA+IGxpc3QsIGFuZCB0aGF0IGlzIHVuY29u
ZGl0aW9uYWxseSBleGVjdXRlZCBldmVuIGlmIGZ0cmFjZSBpcw0KPiA+IGRpc2FibGVkLg0KPiA+
IE9uIEJNRywgSDJHIHJlYWRzIGJlZm9yZSB0aGlzIHBhdGNoIC8gZml4aW5nIGZ0cmFjZSBhcmUg
M+KAkzQtwrVzOw0KPiA+IGFmdGVyLA0KPiA+IHRoZXnigJlyZSB+MzAwbnMuIFNvIEnigJlkIHN1
Z2dlc3Qgd2UgbW92ZSBmb3J3YXJkIHdpdGggYSBjb3VwbGUgb2YNCj4gPiBmaXhlcw0KPiA+IHBh
dGNoZXMgZmlyc3QsIGFuZCB0aGVuIGluIGEgZm9sbG93LXVwOg0KPiA+IA0KPiA+IC0gTW92ZSBh
bGwgcmVhbGx5IGV4cGVuc2l2ZSB0aGluZ3MgaW4gR3VDIENUIGxheWVyIHVuZGVyDQo+ID4gwqAg
Q09ORklHX0RSTV9YRV9ERUJVR19HVUMsIGVuYWJsZSB0aGlzIEtjb25maWcgc29tZSBDSSBydW4N
Cj4gPiAtIFBlcmhhcHMganVzdCBhc3NlcnQgaWYgR3VDIHN0YXRlIGlzIGNvcnJ1cHRlZCBpbiB0
aGUgcGF0aA0KPiA+IG1lbnRpb25lZA0KPiA+IMKgIGFib3ZlDQoNClNvIGlzIHRoZSBzdWdnZXN0
aW9uIGhlcmUgdG8gZW5hYmxlIHRoaXMgREVCVUdfR1VDIHBhcmFtZXRlciBmb3IgYWxsDQpDST8g
V2UgZG8gcmVseSBvbiB0aGVzZSBlcnJvciBtZXNzYWdlcyBmb3IgYmFzZWxpbmUgZGVidWcgYW5k
IHNvbWV0aW1lcw0KdGhpbmdzIGNvbWluZyBvdXQgb2YgQ0kgKG9yIGV2ZW4gYSBjdXN0b21lcikg
YXJlIGhhcmQgdG8gcmVwcm9kdWNlLiBJJ20NCmEgbGl0dGxlIHdvcnJpZWQgcmVtb3ZpbmcgdGhp
cyB3aWxsIGRyYWcgb3V0IGRlYnVnIGZvciB0aGVzZSB0eXBlcyBvZg0KcHJvYmxlbXMuDQoNCi1T
dHVhcnQNCg0KPiANCj4gU291bmRzIGdvb2QuDQo+IA0KPiA+IA0KPiA+IE1hdHQNCj4gPiANCj4g
PiA+IEZyYW5jb2lzDQo+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IE1h
dHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+
ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2N0LmMgfCAxNCArKysrKysrLS0tLS0tLQ0K
PiA+ID4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0p
DQo+ID4gPiA+IA0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1
Y19jdC5jDQo+ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5jDQo+ID4gPiA+
IGluZGV4IDZhOTZiZWE0MDcyMC4uZjIwMGQzZWU5ZDIyIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2N0LmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2d1Y19jdC5jDQo+ID4gPiA+IEBAIC05MzksMjIgKzkzOSwyMiBAQCBzdGF0aWMg
aW50IGgyZ193cml0ZShzdHJ1Y3QgeGVfZ3VjX2N0DQo+ID4gPiA+ICpjdCwgY29uc3QgdTMyICph
Y3Rpb24sIHUzMiBsZW4sDQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqB1MzIgZnVsbF9sZW47DQo+
ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgaW9zeXNfbWFwIG1hcCA9IElPU1lTX01BUF9J
TklUX09GRlNFVCgmaDJnLQ0KPiA+ID4gPiA+Y21kcywNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0YWlsICoNCj4gPiA+ID4g
c2l6ZW9mKHUzMikpOw0KPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqB1MzIgZGVzY19zdGF0dXM7DQo+
ID4gPiA+IMKgDQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqBmdWxsX2xlbiA9IGxlbiArIEdVQ19D
VEJfSERSX0xFTjsNCj4gPiA+ID4gwqANCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGxvY2tkZXBf
YXNzZXJ0X2hlbGQoJmN0LT5sb2NrKTsNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHhlX2d0X2Fz
c2VydChndCwgZnVsbF9sZW4gPD0gR1VDX0NUQl9NU0dfTUFYX0xFTik7DQo+ID4gPiA+IMKgDQo+
ID4gPiA+IC3CoMKgwqDCoMKgwqDCoGRlc2Nfc3RhdHVzID0gZGVzY19yZWFkKHhlLCBoMmcsIHN0
YXR1cyk7DQo+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoGlmIChkZXNjX3N0YXR1cykgew0KPiA+ID4g
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfZ3RfZXJyKGd0LCAiQ1Qgd3JpdGU6
IG5vbi16ZXJvIHN0YXR1czoNCj4gPiA+ID4gJXVcbiIsIGRlc2Nfc3RhdHVzKTsNCj4gPiA+ID4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gY29ycnVwdGVkOw0KPiA+ID4gPiAt
wqDCoMKgwqDCoMKgwqB9DQo+ID4gPiA+IC0NCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGlmIChJ
U19FTkFCTEVEKENPTkZJR19EUk1fWEVfREVCVUcpKSB7DQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgdTMyIGRlc2NfdGFpbCA9IGRlc2NfcmVhZCh4ZSwgaDJnLCB0YWls
KTsNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1MzIgZGVzY19oZWFk
ID0gZGVzY19yZWFkKHhlLCBoMmcsIGhlYWQpOw0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgdTMyIGRlc2Nfc3RhdHVzOw0KPiA+ID4gPiArDQo+ID4gPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkZXNjX3N0YXR1cyA9IGRlc2NfcmVhZCh4ZSwgaDJnLCBz
dGF0dXMpOw0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKGRlc2Nf
c3RhdHVzKSB7DQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgeGVfZ3RfZXJyKGd0LCAiQ1Qgd3JpdGU6IG5vbi16ZXJvDQo+ID4gPiA+IHN0YXR1
czogJXVcbiIsIGRlc2Nfc3RhdHVzKTsNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIGNvcnJ1cHRlZDsNCj4gPiA+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0NCj4gPiA+ID4gwqANCj4gPiA+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAodGFpbCAhPSBkZXNjX3RhaWwpIHsNCj4gPiA+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZGVzY193cml0ZSh4
ZSwgaDJnLCBzdGF0dXMsIGRlc2Nfc3RhdHVzDQo+ID4gPiA+IHwgR1VDX0NUQl9TVEFUVVNfTUlT
TUFUQ0gpOw0KPiA+ID4gPiAtLSANCj4gPiA+ID4gMi4zNC4xDQo+ID4gPiA+IA0KDQo=
