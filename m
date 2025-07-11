Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57322C83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 15:09:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081B410E2BC;
	Fri, 11 Jul 2025 15:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RZ0xl1DN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8656910E2BC
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 15:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752246569; x=1783782569;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=ZD0z6AyYc3YmFeXTCy0cCXwRIlu+Cn0F0W+LZ2DVpkU=;
 b=RZ0xl1DNUql6r1rggTs+q7VAqy95Mozgf6yyunaPTAjXNSSpvSi3RlXF
 bMuBQI3Pd9BR9YKOC9cmbk0LJ8J6KBQ0tx4WxsthhSGZ4TiR+cb678Omw
 nV7vHIr0s6o/9PEuOu3uAGWbbK3R7obsqnx1zW1qkqZI5tsMzQXYz9yD5
 oh7StRPfT99eRafWF7bra3zX82k8ZzkeArS+jsHbZb9fiTni9SlTNVMco
 wq2ZznSqiA2MVSSTkTTups3Wg1JWQWEj6LDlQ+DsiGH+og+6/Y/5TBVZX
 1xShDs8u3f/aPawJbyhQKPkqwyY51OvbSrbriAFCuZ5qguvaH+Syndu1t g==;
X-CSE-ConnectionGUID: jnsNDEoTSiyT2X4BzhSvlA==
X-CSE-MsgGUID: 9kBOFNHORFa/7sra8K0Puw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54676427"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="54676427"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 08:09:28 -0700
X-CSE-ConnectionGUID: 3MFqyPTdSkK6i81liRzSuA==
X-CSE-MsgGUID: G543LGUhTbKqbIoyfHaoXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="156724309"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 08:09:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 08:09:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 11 Jul 2025 08:09:27 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.45)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 08:09:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b9QhZ+yEZZbI1Jb+wUcJZl4ur42AVSRNG0AZ4giBSHlIyaM2l7Zehhifq3iRJKNT4X7Wlzf6Fuc5RPXk3UpZhE+2FnHpGE0gsB3nE25BoOB3pMj190tZDa7n+ZQDhnTOhoZenQie76+qjNWhQ5EZ967NJCaZjeJLg94frtvUEPpJv570xy2zVDw6Hdi/6rhuPZQemVWjY1Ce5+dyhp6D3HIrI4Wrv4hhtfGD5nrPxRhd4C+PBiu0JOJxrTegd5w+mSWib+FTCZSC/t02YjxVOWHsC98XX8F8HD5XbKgQtBwiDqk0kHHSPENX6sHjIQI68C2g31pvDSNZnDJ5NwLXDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZD0z6AyYc3YmFeXTCy0cCXwRIlu+Cn0F0W+LZ2DVpkU=;
 b=ili1ZHaM9VHgMjjTBnkuaqfWwpxKlGF5bMz8UkEHGWkn2k9xGiZcMEnSrJf9kwU1BWRuXxlTcBJBmJKj87I5b52KMrmPlIlJW+ZTOOOSWjr0lfueYmoKIk/iWogvWnsHrXyJKd4X7MNvO21ajBGKBPYB5aDNu0zRgLtEI7M4GjZNpl4qeJhj5X0W5CkzLC5bykOvPGvm0D0h8UMnv4F4IZPi/hj16u52xw2W8tbGZgc4cBBnx+tna3H2etTpYf0OmyO2b9FxSUdVsliPUhbPK6EWMkN4cVSKDLKAqLhgLzWGA2OpsisdGpXOsAGKAtpYmegDL9knj7I6fPb8BmYasQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 IA1PR11MB8152.namprd11.prod.outlook.com (2603:10b6:208:446::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.23; Fri, 11 Jul 2025 15:08:55 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.8922.025; Fri, 11 Jul 2025
 15:08:55 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Move page fault init after topology init
Thread-Topic: [PATCH] drm/xe: Move page fault init after topology init
Thread-Index: AQHb8c5fpuImmq5hQ02lKybd9fjshbQtB9IA
Date: Fri, 11 Jul 2025 15:08:55 +0000
Message-ID: <25add0bffd0a1a561aef4e32074c93b73ef6fd01.camel@intel.com>
References: <20250710191208.1040215-1-matthew.brost@intel.com>
In-Reply-To: <20250710191208.1040215-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|IA1PR11MB8152:EE_
x-ms-office365-filtering-correlation-id: edaf41fd-8a2d-4cac-9a2d-08ddc08cdad6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SHZaL1B1NTc2cnJjdE53K0xUd1BZL2wvWTZxa2hVa3pGbVdtZ0Rzb3JuZTFy?=
 =?utf-8?B?S1dDVy8zdmplazlaSXdlNysyY21aS01MV0hMZWxGRFI5aXZ4NmFZcEtSSTA4?=
 =?utf-8?B?UXZQN1ZGdkN0WFhRRXRleXU5YVVJemNZbDNUQzZGRjFpVnVESFQ4azMxNG5j?=
 =?utf-8?B?MTNrWDVKeVRrUWp1ZUk4ZnNHM2FUbWlUb25HVUpMUGk4YVNYQkdqanMzTUxr?=
 =?utf-8?B?VnNZa0dWS2dTSExXdlRvR1p2QThCOTVsc2ZiQllheCtLOGdxSEQ5OTFrRFlP?=
 =?utf-8?B?M3VPSm9yL2ZjNTIrdTdoOXgvOGJEbzU5L1poN2Njd3Q2SHc3K1R1dWlkQmc2?=
 =?utf-8?B?eHlPTXlvZ0pqVTdLd21VRWNyVGVHZ3BobzZ5VElKVnBjTVJiVFdMUm5JNDVj?=
 =?utf-8?B?SU55ZllyRVN2UlZKMVpJcHpnZmlJMGd2YTBmb1k5VlRpenFGUmYvcW1FZ3Vx?=
 =?utf-8?B?cSs2a0FKUk0xZjRadmg2d0dZRUVBdWhlV3ZpUmtMM2ZuNTVwMGE1NStHL0pq?=
 =?utf-8?B?THBvandZVTg2ZG1iS2RmcWxwZEo2Y05lbXVMU1pjSlArQzhNQS90b3FOdEtU?=
 =?utf-8?B?RjAwU1FlNE1uZ0l3bHlhWmlyb0pIbVhxdjRmekdtMXZzdjZwNmVqSVFmNE5m?=
 =?utf-8?B?MnQwS3J0Rm5LanRHOTJjTnhPS2VSeGVlZHVwN0g3NjhFa0NyOU9rNFQ4eWFX?=
 =?utf-8?B?aTlJYjNNWGNTWG8va3lVWHJnMm1LbHVKQ3VMS1pqSjJ0U0IrSjlnem43MVNa?=
 =?utf-8?B?N0JqeUlMektmTWkwb0Y1NmF3VU5ybGtjVWRrNXQvRmtQUVJaSE55MXE1MjA0?=
 =?utf-8?B?UjQ0TzVzWDg4RG9ZKzgzYmo4elJrblZZYlpWTm9uU1d5djRoaEFBdFNkb3Uy?=
 =?utf-8?B?cmlVL0krL2d3WUZSNmdCTm40ektESllTWkVnZTVWNGlpRWttR2JiVzN1aUJR?=
 =?utf-8?B?NzhDMXRQcWJhU1g0TVYzUFZ6dUI4TFoybkVGY2tzMm1hdmlvSWlNOXRhbWJB?=
 =?utf-8?B?dHRNb0h2YTJjaXdLN0NjRnQvczRTV3BSZ1BraVo4NjB2S0J1M1kwVFBvVlRZ?=
 =?utf-8?B?Qk1zSjA0VHJJM2phV2pkdnM3eDJiU2RDUnhDdXNJYjJzOHVDY24vc3JTdjE3?=
 =?utf-8?B?dHFqOEpZbGF0YjVYQk16SlhDeENDUjh0bk0xUE51czBuT3BadlJzQlBFWU1T?=
 =?utf-8?B?U0dUOW1udzBRMUROVUdZczROalhIdDdTdDNCMkRXU1U0TWdGZnZPRCtPajZT?=
 =?utf-8?B?Z2xFZXRrN0R5eEZxVHJ1SzE5OVdSRG9MR0k4d1pSdFo1bCsyUVhaSW12QzlY?=
 =?utf-8?B?MFZUSnFQUG9saFhVQitINVRrRStoU3JkOTJzUmZDbTBWZUVlU1dkV1NyZW5J?=
 =?utf-8?B?TzhSZzVmeDRTeXJBTk1ZeGpzTlJHTGx6UTg2TDRueU1hcEp6dFRFd05TUUJD?=
 =?utf-8?B?VVhrL0R0dy9RMEdLeDJneHM3QkxvT3dqWFNybWxtOUI3U0NLT09CWDdyblpl?=
 =?utf-8?B?K0RwL3RIZStPNmUvTzV6VHVnR2xFS0RMbXYwZTB0OHc2ai9sWVFNWVU1Y2RX?=
 =?utf-8?B?bWV2NzFHcCtaZUtZNTJ1enhTdHdPeEtKWHk2TEFVNDRlTjFEdVF2Z0xNdFlY?=
 =?utf-8?B?dmVRaGJ2R3BmYjRYRFZ4ZzUwNkorZDZJTG9xY3kwS1huSU5Vd2pVYWNuaE5r?=
 =?utf-8?B?NW5MY1RsaTV2WEUrOG10NUUwODhYTlU3YmNZWDZYTnU4MWZIWVRCVEErb3ZZ?=
 =?utf-8?B?YjNPaE9RVVFud0ptcHBXcHFyMkh2YUNmZ2ZJUTI5aUhLblJBR1pudGYxY1Bk?=
 =?utf-8?B?M2kzZ1lvblNubmZpRzIzN0dUMFRRbmE3bHROUUJ1NWk5YjViNUNlMTN0S08x?=
 =?utf-8?B?Y0F4VU14dG9pMVB3QXNzRGM0MkxFUGN4cnBGcDhZaStYZ3l1aXpYOUZOb1J4?=
 =?utf-8?B?VENCMFZkSmkrc3UxUTQvaENrVEtEUFFWNHoxaVU2aEdZUDBZSmkxMEZ4a3d6?=
 =?utf-8?Q?7Q9Q+WzjQnmcYLofEVLD0JWomHuT08=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXNyaWs2SUhJWjVNaTZyNG1DYktuOEFFOVVMcDRZcFd5OUtFQVY1YTZaaXE1?=
 =?utf-8?B?L1pkbVFVUy9WSUxjaTdnam9RRjlOb1RURFgvN3ZqZzNZT1U1S2xQQWFGMGlv?=
 =?utf-8?B?K1Z6dFFpVDE4VEFXa2k4dzJySzI4TWZwRnpEK2oxRDBYcHRFM0tIRUdDWjFW?=
 =?utf-8?B?NXVrb1Q2aTM5alc3VGhvOXptSS81NmtVWExWSXprUEhpWHRna0daZ2ZTbkV6?=
 =?utf-8?B?Vy82ek5wM21DQ2daMjBMVGNHTjBtcGNvZWE0ZlBEeEVzcVBVRlpPSFhiU0lK?=
 =?utf-8?B?dHFOMzhFNjloNnh1U1dGZUZoN0xmNW5BdWsxL09WNnZBSHVVbjIyeEFqL1Fy?=
 =?utf-8?B?VHZRZTJRM1ZvWC9SSHlCYk4wZTNMTDB2cGgwSlk4dFJsUGdaZkZaMmxyNFVq?=
 =?utf-8?B?YlBTcTNYU28xTzdDWFlOWlg4UXRVT0QwamQwbnREVm5MSGpKUDRkSzdXbnRW?=
 =?utf-8?B?YXhjbGJIT1RHVmhZZjVOQUFsUXJyb0lmSWlaUjk1eHlidTlpTEJ6L3ZwTWtO?=
 =?utf-8?B?d0p6Z3RMdEdCQk5JWHM5WUVRQitQMjRhNTdnMW9pdjNocHZmL2pRQytUL0F1?=
 =?utf-8?B?WTBiYjVKMUYwUHBtWFBFOHNQTVM4bGhCSHQ3TVBHc2R5RnZSYnc0RnlncmFQ?=
 =?utf-8?B?R2RZbTNuSWgzTStjRDJFTlUzMXlYa1U2aE9RbXFva3MySTB4Q3ZTTkl2NkRz?=
 =?utf-8?B?N1AzV0VGaFBwZVFZaHRRaExndllBcW9aNXo0T0R4L2crS0wxREhQQlp5R3Bz?=
 =?utf-8?B?OXJCZzBOcTU0UWtXRzNXdlIyMVZXUlMwQng1LzlEY1RzSEJHbDdBbkk1Rmtu?=
 =?utf-8?B?SFN5NWU5NVcyK2FIVkdNVU9OVU1JdzRqaDUycmtCbVErM0FhdEczNmsyam1y?=
 =?utf-8?B?K3JnbnpVRUZOTFJsK2VZZFFXTy82Z291aDY1ekg5UmJxRlhYVEt5cGpxOTRi?=
 =?utf-8?B?MzdIS0YvUmVpczhBR2N4dGpOSk1heG0wYmlnNVB0VElPbUZTT2pkdVROc1BZ?=
 =?utf-8?B?eHlQUXFUaS82VVZTNEErM0wyWk4xRUtXWnJMWXVkZnByY1ovV05WaFZXRkR3?=
 =?utf-8?B?aE1wTm56ZGQwVHB6aTMxRTlOazZNTjE4UzY1bWgzNVFjUXZJRDRJaFR2ME9n?=
 =?utf-8?B?Tm9JSTVmYlpoZXlkZTFtcEhJYzg5VHdmQ2RmUTQ4dGtCV3FFNVZoMVg3bFlR?=
 =?utf-8?B?SUwydW9LdmsyVnNQZUVkOVR6OFhucnc4b1U4SnlsdU5jNnU1b2FWMGxaTlkw?=
 =?utf-8?B?VVU4eUdtWmFzWkdLSWRUSjNmQXNMclFDcmMxRkVCSUpSeG1xTStsRFhMancy?=
 =?utf-8?B?OCtvMU0zWGx5ZFc0dTJEWC9SNHJTMGMxcGorTzNIRi9PeFk4eEVFSjJUN05Y?=
 =?utf-8?B?QVZGcmNNMkR6Mmk5LzlNM3orRFpYN2tBWU1vM2c5b2MxT09BSldxVWd4cVJW?=
 =?utf-8?B?QUZ1SGZEZHlvWTNvVndZajVhYWx5Vk9aQUJjSWVGWjFpVDZBejlNa2NIOHM4?=
 =?utf-8?B?dzNmdno5R0FEVnpGSmFjRnkwV3F3cXBha1IweEsveExkc3RndHVEZWtSV0ho?=
 =?utf-8?B?N25WSlM2NTNUejB2d1dmbmFScS9BN0JwejlrbVdoMlRFVTdIM0tBUnorLzE2?=
 =?utf-8?B?ZGZmdXdmNTN6ZlhXWmN4cU5jL2V0c2YrdkgwUnVldVlnR3RvdVFHOWdPR3Ey?=
 =?utf-8?B?cHRRU0xpZi9lQnFKL0VjVUp0ZzMramI0UHV2NDJNNkh2YktlRExwLy82VG1k?=
 =?utf-8?B?T2xOeE9NWUVQc2F5UGxNZllML3gzYXNRRjNxZEZxdmRYRVRXM2Nra3NXNHNJ?=
 =?utf-8?B?ZTZyVmVuMGIxV3RkRlc5ZjE3WGNMbjhIOTE2TFdCdGE1MlBkUzZDMkRXMVlM?=
 =?utf-8?B?dkhHQVZTSHFHcXlPVXpjd0hlNmprSk5pTm1OYU9GRXA4MEFSUk1IcUEyelhw?=
 =?utf-8?B?NUpkVXBsOEtmaHRENXorVzVLK2V5MUNORXdxUURiMGNaYlVIMmdFUk44SjRR?=
 =?utf-8?B?b1VjT0VORDVLTm1XY3VmZzBOTWdxTmF2a3Q2ZUNjU3ZUWDFPSWZITTd2ZVEv?=
 =?utf-8?B?NERNd2NBbkJKUzNoaTRxTURUSThydld5MHhrUHRvR0gvUDR3Rm81MmJMR2U4?=
 =?utf-8?B?YzdJV2ZqNElsOE1qeWRtTGV4bWkwekJ1TTVMSEVUY29YeWJFaUNxb3kxSzl5?=
 =?utf-8?B?cUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D8A8594E5270AF489A9B52EC9F3F17B5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edaf41fd-8a2d-4cac-9a2d-08ddc08cdad6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2025 15:08:55.5587 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zw0jV37VM2sq2ydaJ/WmxjQt0UswoHyC8+ATMq/16As5vmJ53d41HCVkL1Xc2Gpa93IxMR6l+FrQKExzepU6MwqVSAcz9r8t/hBdsod+4tQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8152
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

T24gVGh1LCAyMDI1LTA3LTEwIGF0IDEyOjEyIC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IFdlIG5lZWQgdGhlIHRvcG9sb2d5IHRvIGRldGVybWluZSBHVCBwYWdlIGZhdWx0IHF1ZXVlIHNp
emUsIG1vdmUgcGFnZQo+IGZhdWx0IGluaXQgYWZ0ZXIgdG9wb2xvZ3kgaW5pdC4KPiAKPiBDYzog
c3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IEZpeGVzOiAzMzM4ZTRmOTBjMTQgKCJkcm0veGU6IFVz
ZSB0b3BvbG9neSB0byBkZXRlcm1pbmUgcGFnZSBmYXVsdAo+IHF1ZXVlIHNpemUiKQo+IFNpZ25l
ZC1vZmYtYnk6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPgoKWWVwLCBn
b29kIGNhdGNoIGFuZCB0aGFua3MhCgpSZXZpZXdlZC1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFy
dC5zdW1tZXJzQGludGVsLmNvbT4KCj4gLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Qu
YyB8IDYgKysrLS0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jCj4gaW5kZXggZDM5N2RmMDU2ZTRjLi5hZjAzZTE5ZWY5
YmUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3QuYwo+IEBAIC02MjgsMTUgKzYyOCwxNSBAQCBpbnQgeGVfZ3Rf
aW5pdChzdHJ1Y3QgeGVfZ3QgKmd0KQo+IMKgwqDCoMKgwqDCoMKgwqBpZiAoZXJyKQo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGVycjsKPiDCoAo+IC3CoMKgwqDCoMKg
wqDCoGVyciA9IHhlX2d0X3BhZ2VmYXVsdF9pbml0KGd0KTsKPiArwqDCoMKgwqDCoMKgwqBlcnIg
PSB4ZV9ndF9zeXNmc19pbml0KGd0KTsKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKGVycikKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBlcnI7Cj4gwqAKPiAtwqDCoMKgwqDC
oMKgwqBlcnIgPSB4ZV9ndF9zeXNmc19pbml0KGd0KTsKPiArwqDCoMKgwqDCoMKgwqBlcnIgPSBn
dF9pbml0X3dpdGhfZ3RfZm9yY2V3YWtlKGd0KTsKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKGVycikK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBlcnI7Cj4gwqAKPiAtwqDC
oMKgwqDCoMKgwqBlcnIgPSBndF9pbml0X3dpdGhfZ3RfZm9yY2V3YWtlKGd0KTsKPiArwqDCoMKg
wqDCoMKgwqBlcnIgPSB4ZV9ndF9wYWdlZmF1bHRfaW5pdChndCk7Cj4gwqDCoMKgwqDCoMKgwqDC
oGlmIChlcnIpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gZXJyOwo+
IMKgCgo=
