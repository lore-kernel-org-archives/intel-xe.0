Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B02AC83F1A
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 17:22:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4365210E0CE;
	Wed, 23 Jul 2025 17:22:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IW1vAMEK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF9310E0CE
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 17:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753291377; x=1784827377;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=xGlbu7EiN6tFm75eWhmeFt7m6ph/G7dDq2zR/5ZEGFo=;
 b=IW1vAMEKBEA97s47Tmvq1jeX+GRPEs24t8FCA9PscAa+GaIs8kLzMhig
 kCIfkvhSYJAk6EMm9vb75Or5NHxp0TJ7T4V3fdxuwcqYOuTdBwue5vNei
 biOYE1YgHhSFILmB6uMUSi3MifwXvxEwSEAvwVrVywiTFLaXT/2Odkp+f
 NtSN8NZEG049AghVGK/PvbWSwAmi9lFl+WEtTgrFdWERN0cX3v9BYf7/o
 SsbNPAaR758WVDBfDW0Bz4MI18NRoSTzUTto8b9t9PYm6exkOP2LZge1g
 9P1UUV3cmVKWZvjuznm4CUyHmaasNfl+hPrlNYSkqnd/EkNZjah4hOGpd g==;
X-CSE-ConnectionGUID: v04sTR78RDKZMI39a3euKA==
X-CSE-MsgGUID: M6iIvzbaR5attMF5BbLLWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="66151687"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="66151687"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 10:22:56 -0700
X-CSE-ConnectionGUID: mAHdsBhbR0+n288lZqfZTw==
X-CSE-MsgGUID: ommCKZZASkymXHyrTk7z5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="158921047"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 10:22:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 10:22:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 23 Jul 2025 10:22:56 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.60)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 10:22:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jMlxFQY+OKdNFxHulXyrihpzBec3IqeX3KSRRmSzx0790FAuUitrNd0evMw1NO+lDHqfIEtq3QOnz3yLsJhnG/2rtfL2H/171j1m8bsVwr5O0mT2PcrSNGC6d62gKPwdfKTSlR3YaUtIrrD5L67HfA6RkEzDDzW1+vf+pLvXFEkHXiTBByHn9Ow3Bk6l7bQq/jqh6mP9zmfdCnvC9sDVe/Vu4wR8BBB16/LHUPNnb+mQicR0pt8Q3rC1pNhxRQjNtok7MN9dWQQ5lCfJDnBOhWUXNC6teR7zSoq5eqqlpktJUS/CMRTeGYbJ2WilJRx1ao07jcjfpIKqnOgKQQLrrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGlbu7EiN6tFm75eWhmeFt7m6ph/G7dDq2zR/5ZEGFo=;
 b=gzQ1D1LljTDENKLa1MoHY+8bGxBw5juGrwiEMANJULnGkRRQtQX3jm8lBZ7E7XsL4FYZxuk4NEGNWFq+BPHaqlYh4Pd8nffrD4IMasHXb/rD1lejptpFVwvBtUOPvpdIzdkUJx9oXeGdPpHoOj5SK4VArqD3/FpRyuDg1f0GlL1Hg7kCZMK+691ZBYEXBKHVZ++8x++56p1h+/jybwKC4lBNdQv2JltNhfmBKufpdzRR3laC3H8Maf7tk7OWP3UEa9Dj4ZT8MipUjxG//ydCbm03mDwT4dF4VQTMEZt7qwFWveC4D49yckRMh25ufeMf5oQIJsUMQBkCebaq/Q5avw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DS0PR11MB8113.namprd11.prod.outlook.com (2603:10b6:8:127::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.21; Wed, 23 Jul 2025 17:22:12 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 17:22:12 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "nirmoy.das@intel.com" <nirmoy.das@intel.com>, "Kassabri, Farah"
 <farah.kassabri@intel.com>, "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH v2 05/11] drm/xe: Add xe_gt_tlb_invalidation_done_handler
Thread-Topic: [PATCH v2 05/11] drm/xe: Add xe_gt_tlb_invalidation_done_handler
Thread-Index: AQHa0OzR5ibEbgp0e0ag+DL/Th/DpbRCSssA
Date: Wed, 23 Jul 2025 17:22:12 +0000
Message-ID: <d7493c11d2b2d0f4d3d9e1d71e2d88982d8cea92.camel@intel.com>
References: <20240708040331.766264-1-matthew.brost@intel.com>
 <20240708040331.766264-6-matthew.brost@intel.com>
In-Reply-To: <20240708040331.766264-6-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DS0PR11MB8113:EE_
x-ms-office365-filtering-correlation-id: 336a45c9-811e-4283-2693-08ddca0d7642
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SkwwdDBkcWcwdHFNQ2lZV3dJRGVRNU9kMk5GazNXVFJwM2hheUJyQ09raDVw?=
 =?utf-8?B?VjJyempTQ0hFNnNBbVZhME56L0pJRytGaXB4UVJoSlFGQjBjcnhZV3p0TXZF?=
 =?utf-8?B?eHZTNDZRVllmRDRwOFU4VjU0ajdPY0U1YTVyL2gwTFhKZ0ZsdTVxMW1BcVZ1?=
 =?utf-8?B?THFEclp6eFlDZU5TdXpEWUgzb2M4NmdMYzlpaGRhOE40RUk5amRObXhTTjRy?=
 =?utf-8?B?OWFpaHo4M2lrVHFwMUE5UVVYdzl3OGdGV3VXMTljb0NxbVoxaHpmWVFwMjd5?=
 =?utf-8?B?L1h3N290ckI3WUVYOExSWXE0WlhvT041UGF4bUxyaUIvSjkzVlBIZENteE8z?=
 =?utf-8?B?T2E0VFpXbHJzblQ0NmcxdEpZb1owVG9VRjRQR0pEaCtVR012TG01OGp1bm9v?=
 =?utf-8?B?eDVxUzhxa1FZZ2t2Z29BdmFjb2UzRW9Tei9hT0JrOVh2NGUvdzhaRjBFd0di?=
 =?utf-8?B?L09vR080WFhzYmE5ZDdpS25uYzhTZ004Z09MS1NieHdzVjRxdGNCQU85RUVX?=
 =?utf-8?B?N2NXK2d5UktrN2tMenNzMXVmRS9FaFozMStFMVpmZkZiQ1l4bGQvbnNmakNx?=
 =?utf-8?B?c3NIMXhES0pCUWZ4MHZ0bEs2dnNwTjdnSHJjMzZreTFWbXFxOTYxRVR5c2hC?=
 =?utf-8?B?WnRwM0sxWitsZW1jbHJ2T0lqUzMvcTlqMi9NUUtKVkRKeE9TYXF2RjBwRG9H?=
 =?utf-8?B?ZTZkemRlUmJpOVhUbzNWRk5sNlZJZ0QxRUFsM1cxamFMK1FqdWVvSTNIa0hS?=
 =?utf-8?B?RkhUWFA4UnpxNDZsWlRiYmM1TWJZQWNwelJpbmNDcEFpVVVrdCt6SW1pUkJi?=
 =?utf-8?B?N1hQcFVxL2U5cURPM1NCRlYyd2x4NGFGZVlpUVdRUDdZL1A2aFl2VlZ3L1lh?=
 =?utf-8?B?ODNtdGNjcTROektZRTh4Y0xMVEYvQUk1aXNwOTZNLytYMWNhYnJyd3ZZanFP?=
 =?utf-8?B?aFQ1R3R5Q0k4ak9TaDFCMThET0ZtNTNvUERick1FU1NibzAwRitBbmxEb3NE?=
 =?utf-8?B?ZlN6Q1RhZkJ6aUp2OFZWYy9FRDF3SnhsRisyS3cyYy9RUFlHcXcyUUlUcUtp?=
 =?utf-8?B?alRodnFXakR5UVRkeS9YSExORkFKUGUyV0V1VUJubldxZWFucWhmejVra2dJ?=
 =?utf-8?B?ZjMzZ0JML2tzUGYvbnVYRDBONnpCU2NYTG8wcHY1dG5tN2laT3lNVlYwVjYy?=
 =?utf-8?B?N0tncDhzYnNrTGx0Tmt4MjNKelNMWHU4TXgvTUFuNWpGR0hDc2JweTlnUnRa?=
 =?utf-8?B?QmtmM1c4V0JuUENvSVpKL29TV2tKZjY3QkkrTEJjLzdnRGR1UUtsWWw2T0tm?=
 =?utf-8?B?MVp5RHdzUUJRSk9vOTdjRWVkMEl1dWlJMmxLOElVTldLTlYxUlhjVGNYbDRs?=
 =?utf-8?B?QjRDaEw4VDMvZExLM3FZMEozWkVNWUttQlBnYnFiWldTQnNTOEQ0dHk3Vm51?=
 =?utf-8?B?MVZhZ2dSc2xwYjlnOUJhM1RLWDVjdmVrT3o5M01aUU0zc0lQYmR1WWtyNFYx?=
 =?utf-8?B?T2JCZ1ByaDhZWm51aUszcFBmTzZLR08zbTNtWkFuWCtHMldpcXhEVWtzczQz?=
 =?utf-8?B?NUZWY3ppNWpuSkthYkx6dEwzRlJYTHFIM1h3TWl2UjFtMWo0MUQ2T2ZQQkZZ?=
 =?utf-8?B?OWNlZGl2K0pnaTk1OEJEMUN1Ri9NN0U4ZCt6SGJ6dlE0anIxWVI3U3hwL0Mx?=
 =?utf-8?B?eGRlZXVlVVZuT3YwZ3FicW9tR2p4U1UwanlDY0ZWWE5tQndGS1FWUTdHVnVm?=
 =?utf-8?B?dHp5U0hOMHNEYTFZK3E0OXFLQVJXTlkzMEJsZ3BzVDFHNG5GNkJZMUM1akQ4?=
 =?utf-8?B?UXgvRFRpcXhrcngwN3F6NGhkaWo0Q2R2K09uL2ZNSlBNT0paYUVlNXp5MnQx?=
 =?utf-8?B?ZkJPczUzaFJJM0k2WEMvZWVzMGd6UDlKcVRQcTdHS0ZMZHA2Ym1pbVNjRkRY?=
 =?utf-8?B?ODc4TldxSWNvT1VrNWtZQ0lXTU1zK2NsMFBLaEM2RytJNFlHSFpZYWoxaW5j?=
 =?utf-8?B?M2ZiUHhrYUZRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?djdFMHZmSlVSZGphRnRGeE8rUVRsT3lDNFNPWXVkdVo3MllKSmtWbFRia3gx?=
 =?utf-8?B?THEwN3NMcnA4ZGZYaDd2d0hlQitTS0lsWDIzMVBJaERBU0FCbS9sb0hWS2JU?=
 =?utf-8?B?Mjc0ZlVIUDl6cExkaTBuMzNHTGhUNjV3bkpxM2FZM2xzWkViOW52V1BJd2pF?=
 =?utf-8?B?dGFMY0RMckdpMmlRdXd5SDR1U1NFYWxYb2YzcHVvVkRQL1BXbi9JemlNVUI5?=
 =?utf-8?B?Rlk2SWM1RTBmNUUyZzlmem0xVTFnbUMwVlRHSmlnTWFvU3Bpd2xJYXF4V2hH?=
 =?utf-8?B?OUxpLzRwUkcrd3BnL2N4WHZIREZ3U2lGSnRlNlh1ME1rMjh6a2xuTnVKazIz?=
 =?utf-8?B?dkdSNDRGWHFJSGpXQWV5N0QzZ29TT2pOTG0xeXRDamIrWWp4TDRIWkJvRFo2?=
 =?utf-8?B?Rm9XZHluTDI4a05BbGdGTmtSdVFuTVFpQTcvNFRxaFNpM3VYbFQ3c0tsTlhY?=
 =?utf-8?B?VE9Tdm9GN3VNcDdSMkpjd2N5K3hsMlFmclFuUmdETjJ5Y1RYNU5rWlRkdkxs?=
 =?utf-8?B?anowd0s2azJoUmp4eXhWZGptRmswY1VyQWg1YTM5RUVFNFNqU0xBbVp3ajFj?=
 =?utf-8?B?SXBadk1CM3BXUEUyWENpTS9nZS9FV3IwSzJtdWNIcElRL3NaejZGbisrc29X?=
 =?utf-8?B?OHM3Q3B2R2tON0YvbUtvYUJhempOMXhHUWJpZCtzTWxuOGNpbkk3K2t1TGtJ?=
 =?utf-8?B?QUdiemNrdVptRTIrWWhid2VxdmMxZmc4Yk5TcmpkWThPN1pmSWlPTmErelJC?=
 =?utf-8?B?Y2RnZHJodDY5cVFYT0o0UW9wQkZwSkwrZ2RJR1hQNmU0cHcwdlJCR285Rjd6?=
 =?utf-8?B?MnNwS1U5RWpSVCtVOEI1SHVUTjEyL3huQUFiclRGb1IrRmx1cmYzL1ZRZ3Uz?=
 =?utf-8?B?QW85ZkY5TGhqakhLbjQ3N2h6bVU2VGtWc085ZWJReVF4Qkd5bElmOVZNUi9C?=
 =?utf-8?B?NDczU3hNVkhRUWZGMGswWEc4cTJsaFBJREpIMlhPUlBuZ3BkZVFReXVZdFpx?=
 =?utf-8?B?eGJvNW5SLzJxWEZYNkJoV1F1WGxMdC8xT3grVWFmVEcyUUNGRG5pQUlUU2d3?=
 =?utf-8?B?UlVWQkx1bFFKYW1LdGI1WTlSbkpDRGNHMzQvem8rWjY3bmYyYTg1czZ2VFR6?=
 =?utf-8?B?VWh2VzZVanJDYVl3RTF3UXJTZ3dHcVRKZUZJTVRIalkxNkc1Q3pJUHZNMUo5?=
 =?utf-8?B?UXI0bFRaeXlzOHJNY0V1ekhkcjB3TUp3cnZhM0xUOXRyYzFmUkc3Y1hJaVZF?=
 =?utf-8?B?dDdSUjhPQXNNN201MElMS2tCbGwyRE9PelNRdzlrR1ZTT3JwL3E1Y1hnRHpr?=
 =?utf-8?B?VEVwcWI4V0UxcUtEMDl5SG9sRkZsTDRTRVR3Tk56cmlMdVc0TGpZaXNrbUpU?=
 =?utf-8?B?WFQ5bVp5RzBzRHFvVjdIRS9MYkxPL1NEbmltVnhqcXphU01LeGRMaHFGVDY1?=
 =?utf-8?B?ZUtJL2lHTEVCdDkvbTRseEhSbXVEdER3b3pldC9YWnVaR0o1dE1ZcExXNTcy?=
 =?utf-8?B?SGtjaEg3bkdEbHIybUZTQUNNeWtaWHFqL1lhNHJEcG45eUdoVzJMR1E0emVF?=
 =?utf-8?B?dFRoMUFLYUxzTWd4cHVqTTl3eHIzUWpNUUxVeUFjVFBzcTBjMjZPR2FlMTZR?=
 =?utf-8?B?blhEVm5sa05RRlZSTlh4b2M4TkdSNHkxNlFGaGJUYitqbEJYSll6a3kzVUwv?=
 =?utf-8?B?bjl4WS9lMk1KelhoNjZqWllObElJZGVxZDVBZi9EOGczZ1dOT0E2TUNMUnhL?=
 =?utf-8?B?ODJBcUJBSHhhb04wOEN6MUl0U2hMTkFPdG45b092RWdKVW1nVkZ5anVFU2ZO?=
 =?utf-8?B?ZVFzVjAwdEprWEhmc2VqL3orN1A2NDU5SVZpTHc2VWRkYzk5bCtmUUxaK0x6?=
 =?utf-8?B?dWQvZFMyYjRKOVd2b1pCTmRqbXYydjZ1eDFBcEo3V1A1OE1mbXhlTkw3b2Rh?=
 =?utf-8?B?MVdJMWhkNlVIc1Qzb1VHdXVvQ1kweFk3bkkzT1A5bHpHb3U2WkUzMDhScm1a?=
 =?utf-8?B?YmpRUnhqUlZjWXQ3R2Rpa3FtUHJrYmpxRkx2eUhzWmluRHVNbmlydENxaDVu?=
 =?utf-8?B?aGtJK00yRmRmTFUzZUhjWG9LMWdXcEFkZTJsYUhQeTZwdW0yNFdCRFlZMmtM?=
 =?utf-8?B?NU8wenlHNnd3ZXd4dlRoRVZPNDIvbDFXVGhaWWhhQStuRFpOQkJQei9aSTcz?=
 =?utf-8?B?K2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9836C0EB7168D0428669B29781AC488D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 336a45c9-811e-4283-2693-08ddca0d7642
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 17:22:12.3836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IMZsr5EsDslgdVkppF7ukG2TQN4nSzIvKvm4zhZbPI8pQEpNEIsxwNRvNXtfIDNFfXc/52KhCNUNfDIf8pZ8FfjTqmATJ90PEC6BH8iaxpg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8113
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

T24gU3VuLCAyMDI0LTA3LTA3IGF0IDIxOjAzIC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBEZWNvdXBsZSBHVCBUTEIgc2Vxbm8gaGFuZGxpbmcgZnJvbSBHMkggaGFuZGxlci4NCj4gDQo+
IHYyOg0KPiDCoC0gQWRkIGtlcm5lbCBkb2MNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoZXcg
QnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KDQpMb29rcyBnb29kIHRvIG1lLCB0aGFu
a3MhDQoNClJldmlld2VkLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwu
Y29tPg0KDQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90bGJfaW52YWxpZGF0
aW9uLmMgfCA0NyArKysrKysrKysrKysrLS0tLS0tDQo+IC0tDQo+IMKgMSBmaWxlIGNoYW5nZWQs
IDMwIGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90bGJfaW52YWxpZGF0aW9uLmMNCj4gYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3RfdGxiX2ludmFsaWRhdGlvbi5jDQo+IGluZGV4IDkwNjJkOWY4NWZmYi4u
MjQ5M2VhOTFiNjM3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdGxi
X2ludmFsaWRhdGlvbi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90bGJfaW52
YWxpZGF0aW9uLmMNCj4gQEAgLTQxMiwyNyArNDEyLDE4IEBAIGludCB4ZV9ndF90bGJfaW52YWxp
ZGF0aW9uX3ZtYShzdHJ1Y3QgeGVfZ3QNCj4gKmd0LA0KPiDCoH0NCj4gwqANCj4gwqAvKioNCj4g
LSAqIHhlX2d1Y190bGJfaW52YWxpZGF0aW9uX2RvbmVfaGFuZGxlciAtIFRMQiBpbnZhbGlkYXRp
b24gZG9uZQ0KPiBoYW5kbGVyDQo+IC0gKiBAZ3VjOiBndWMNCj4gLSAqIEBtc2c6IG1lc3NhZ2Ug
aW5kaWNhdGluZyBUTEIgaW52YWxpZGF0aW9uIGRvbmUNCj4gLSAqIEBsZW46IGxlbmd0aCBvZiBt
ZXNzYWdlDQo+ICsgKiB4ZV9ndF90bGJfaW52YWxpZGF0aW9uX2RvbmVfaGFuZGxlciAtIEdUIFRM
QiBpbnZhbGlkYXRpb24gZG9uZQ0KPiBoYW5kbGVyDQo+ICsgKiBAZ3Q6IGd0DQo+ICsgKiBAc2Vx
bm86IHNlcW5vIG9mIGludmFsaWRhdGlvbiB0aGF0IGlzIGRvbmUNCj4gwqAgKg0KPiAtICogUGFy
c2Ugc2Vxbm8gb2YgVExCIGludmFsaWRhdGlvbiwgd2FrZSBhbnkgd2FpdGVycyBmb3Igc2Vxbm8s
IGFuZA0KPiBzaWduYWwgYW55DQo+IC0gKiBpbnZhbGlkYXRpb24gZmVuY2VzIGZvciBzZXFuby4g
QWxnb3JpdGhtIGZvciB0aGlzIGRlcGVuZHMgb24NCj4gc2Vxbm8gYmVpbmcNCj4gLSAqIHJlY2Vp
dmVkIGluLW9yZGVyIGFuZCBhc3NlcnRzIHRoaXMgYXNzdW1wdGlvbi4NCj4gLSAqDQo+IC0gKiBS
ZXR1cm46IDAgb24gc3VjY2VzcywgLUVQUk9UTyBmb3IgbWFsZm9ybWVkIG1lc3NhZ2VzLg0KPiAr
ICogVXBkYXRlIHJlY3Ygc2Vxbm8sIHNpZ25hbCBhbnkgR1QgVExCIGludmFsaWRhdGlvbiBmZW5j
ZXMsIGFuZA0KPiByZXN0YXJ0IFREUg0KPiDCoCAqLw0KPiAtaW50IHhlX2d1Y190bGJfaW52YWxp
ZGF0aW9uX2RvbmVfaGFuZGxlcihzdHJ1Y3QgeGVfZ3VjICpndWMsIHUzMg0KPiAqbXNnLCB1MzIg
bGVuKQ0KPiArc3RhdGljIHZvaWQgeGVfZ3RfdGxiX2ludmFsaWRhdGlvbl9kb25lX2hhbmRsZXIo
c3RydWN0IHhlX2d0ICpndCwNCj4gaW50IHNlcW5vKQ0KPiDCoHsNCj4gLcKgwqDCoMKgwqDCoMKg
c3RydWN0IHhlX2d0ICpndCA9IGd1Y190b19ndChndWMpOw0KPiDCoMKgwqDCoMKgwqDCoMKgc3Ry
dWN0IHhlX2RldmljZSAqeGUgPSBndF90b194ZShndCk7DQo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1
Y3QgeGVfZ3RfdGxiX2ludmFsaWRhdGlvbl9mZW5jZSAqZmVuY2UsICpuZXh0Ow0KPiDCoMKgwqDC
oMKgwqDCoMKgdW5zaWduZWQgbG9uZyBmbGFnczsNCj4gwqANCj4gLcKgwqDCoMKgwqDCoMKgaWYg
KHVubGlrZWx5KGxlbiAhPSAxKSkNCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJl
dHVybiAtRVBST1RPOw0KPiAtDQo+IMKgwqDCoMKgwqDCoMKgwqAvKg0KPiDCoMKgwqDCoMKgwqDC
oMKgICogVGhpcyBjYW4gYWxzbyBiZSBydW4gYm90aCBkaXJlY3RseSBmcm9tIHRoZSBJUlEgaGFu
ZGxlcg0KPiBhbmQgYWxzbyBpbg0KPiDCoMKgwqDCoMKgwqDCoMKgICogcHJvY2Vzc19nMmhfbXNn
KCkuIE9ubHkgb25lIG1heSBwcm9jZXNzIGFueSBpbmRpdmlkdWFsIENUDQo+IG1lc3NhZ2UsDQo+
IEBAIC00NDksMTIgKzQ0MCwxMiBAQCBpbnQgeGVfZ3VjX3RsYl9pbnZhbGlkYXRpb25fZG9uZV9o
YW5kbGVyKHN0cnVjdA0KPiB4ZV9ndWMgKmd1YywgdTMyICptc2csIHUzMiBsZW4pDQo+IMKgwqDC
oMKgwqDCoMKgwqAgKiBwcm9jZXNzX2cyaF9tc2coKS4NCj4gwqDCoMKgwqDCoMKgwqDCoCAqLw0K
PiDCoMKgwqDCoMKgwqDCoMKgc3Bpbl9sb2NrX2lycXNhdmUoJmd0LT50bGJfaW52YWxpZGF0aW9u
LnBlbmRpbmdfbG9jaywgZmxhZ3MpOw0KPiAtwqDCoMKgwqDCoMKgwqBpZiAodGxiX2ludmFsaWRh
dGlvbl9zZXFub19wYXN0KGd0LCBtc2dbMF0pKSB7DQo+ICvCoMKgwqDCoMKgwqDCoGlmICh0bGJf
aW52YWxpZGF0aW9uX3NlcW5vX3Bhc3QoZ3QsIHNlcW5vKSkgew0KPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmd0LQ0KPiA+dGxiX2ludmFs
aWRhdGlvbi5wZW5kaW5nX2xvY2ssIGZsYWdzKTsNCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHJldHVybiAwOw0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJu
Ow0KPiDCoMKgwqDCoMKgwqDCoMKgfQ0KPiDCoA0KPiAtwqDCoMKgwqDCoMKgwqBXUklURV9PTkNF
KGd0LT50bGJfaW52YWxpZGF0aW9uLnNlcW5vX3JlY3YsIG1zZ1swXSk7DQo+ICvCoMKgwqDCoMKg
wqDCoFdSSVRFX09OQ0UoZ3QtPnRsYl9pbnZhbGlkYXRpb24uc2Vxbm9fcmVjdiwgc2Vxbm8pOw0K
PiDCoA0KPiDCoMKgwqDCoMKgwqDCoMKgbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKGZlbmNlLCBu
ZXh0LA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICZndC0NCj4gPnRsYl9pbnZhbGlkYXRpb24ucGVuZGluZ19mZW5jZXMs
IGxpbmspIHsNCj4gQEAgLTQ3NCw2ICs0NjUsMjggQEAgaW50IHhlX2d1Y190bGJfaW52YWxpZGF0
aW9uX2RvbmVfaGFuZGxlcihzdHJ1Y3QNCj4geGVfZ3VjICpndWMsIHUzMiAqbXNnLCB1MzIgbGVu
KQ0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNhbmNlbF9kZWxheWVkX3dvcmso
Jmd0LT50bGJfaW52YWxpZGF0aW9uLmZlbmNlX3Rkcik7DQo+IMKgDQo+IMKgwqDCoMKgwqDCoMKg
wqBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZndC0+dGxiX2ludmFsaWRhdGlvbi5wZW5kaW5nX2xv
Y2ssDQo+IGZsYWdzKTsNCj4gK30NCj4gKw0KPiArLyoqDQo+ICsgKiB4ZV9ndWNfdGxiX2ludmFs
aWRhdGlvbl9kb25lX2hhbmRsZXIgLSBUTEIgaW52YWxpZGF0aW9uIGRvbmUNCj4gaGFuZGxlcg0K
PiArICogQGd1YzogZ3VjDQo+ICsgKiBAbXNnOiBtZXNzYWdlIGluZGljYXRpbmcgVExCIGludmFs
aWRhdGlvbiBkb25lDQo+ICsgKiBAbGVuOiBsZW5ndGggb2YgbWVzc2FnZQ0KPiArICoNCj4gKyAq
IFBhcnNlIHNlcW5vIG9mIFRMQiBpbnZhbGlkYXRpb24sIHdha2UgYW55IHdhaXRlcnMgZm9yIHNl
cW5vLCBhbmQNCj4gc2lnbmFsIGFueQ0KPiArICogaW52YWxpZGF0aW9uIGZlbmNlcyBmb3Igc2Vx
bm8uIEFsZ29yaXRobSBmb3IgdGhpcyBkZXBlbmRzIG9uDQo+IHNlcW5vIGJlaW5nDQo+ICsgKiBy
ZWNlaXZlZCBpbi1vcmRlciBhbmQgYXNzZXJ0cyB0aGlzIGFzc3VtcHRpb24uDQo+ICsgKg0KPiAr
ICogUmV0dXJuOiAwIG9uIHN1Y2Nlc3MsIC1FUFJPVE8gZm9yIG1hbGZvcm1lZCBtZXNzYWdlcy4N
Cj4gKyAqLw0KPiAraW50IHhlX2d1Y190bGJfaW52YWxpZGF0aW9uX2RvbmVfaGFuZGxlcihzdHJ1
Y3QgeGVfZ3VjICpndWMsIHUzMg0KPiAqbXNnLCB1MzIgbGVuKQ0KPiArew0KPiArwqDCoMKgwqDC
oMKgwqBzdHJ1Y3QgeGVfZ3QgKmd0ID0gZ3VjX3RvX2d0KGd1Yyk7DQo+ICsNCj4gK8KgwqDCoMKg
wqDCoMKgaWYgKHVubGlrZWx5KGxlbiAhPSAxKSkNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHJldHVybiAtRVBST1RPOw0KPiArDQo+ICvCoMKgwqDCoMKgwqDCoHhlX2d0X3RsYl9p
bnZhbGlkYXRpb25fZG9uZV9oYW5kbGVyKGd0LCBtc2dbMF0pOw0KPiDCoA0KPiDCoMKgwqDCoMKg
wqDCoMKgcmV0dXJuIDA7DQo+IMKgfQ0KDQo=
