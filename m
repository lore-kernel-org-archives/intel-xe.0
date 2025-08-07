Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8DEC87FCA
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 17:10:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ADC510E881;
	Thu,  7 Aug 2025 17:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="in0L9u9K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0107010E881
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Aug 2025 17:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754586645; x=1786122645;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9cM0x0iYJQD+91rogpMo4Jg/72re0eqbdNr/Q/Z9DUs=;
 b=in0L9u9K+vxIZBE4z0JZka1iNFjZ7ugkQoqfy0w3AgvkCMh81ql9Mf1m
 4aI43gUy069XlAOBdfC4BGs9kdIE5kcBTEKT7otZwpdbTvDwsG0TNdbO/
 FO9FBUEhKtEbUGZbpWZ+YsEg7h4YKov9V142qYN5kx4B0u5lepoTgJbhN
 uyk/9lsEX5sTqBzGvrDNy+u4UbZfxrGLsgYSkWPLf6jbMDiZCOTP/HoGC
 9GUglSvkIdecVvnxyRXL9/ldYwRDg3+OK+MmI7JRggXcGaQqWMVxK9ES4
 TUhoBUPCDXxxXuGipOvWnS8RwLl6wlzWkWLIV3rpKUxWRuKTZpUm68nFX g==;
X-CSE-ConnectionGUID: Sqyu4H9XRUur3aWNw2r77A==
X-CSE-MsgGUID: GaQOxuaQTUSH41MreF7amg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="60738185"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="60738185"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 10:10:42 -0700
X-CSE-ConnectionGUID: 8LQIOYklSEWeFB42BSXUcA==
X-CSE-MsgGUID: FWGkJHxiTR6YPV4JnPmvDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="165019944"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 10:10:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 10:10:41 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 10:10:41 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.78)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 7 Aug 2025 10:10:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eP9JHQyI6CpEJme8HuEDtcSRFiPffZk2mUVLSgRjGT0AbKEVc/UVwJbWM3Kfk/BloGZoTRUBT/xPABp3JKdyJxLK4u+92ySFzDUx5yQmwnjzsOj4puw0SJv8bWCDiQRrIUPVvndRb+9x7HG4U+eMe5v2dOmQRkpkUZnc5Q5zGAzrmt34I1URVDwApwTkpjH6NlnXoyocDPqCjUUJB1wiKcpTLUUy8LOPj6tjtTdx9j0SJ54gc07j5ajEoF89GPY0YR7CSyrsXqTH0QLpDpJBdGIqumzhT4NiuLzrxd5cYntpjkxpncmROahIcR0Q+rAv3Wty/UAL+4te3hlTfBL2WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9cM0x0iYJQD+91rogpMo4Jg/72re0eqbdNr/Q/Z9DUs=;
 b=AGgKkymd5K8DfY+qnbCqlhoJgFVXko2nVBwpdt45gKRXufB0ssU9aiBt00RfCrj96U5s2pPKcua/60zhNLnlh6nTcwVe40Mu3DoILXunO0nsvKWcDFd7C+axVdlt1nCVGc9yrZGfg/355bunaBhL6l+RzGa8nHN/ci9u2J4bxKDuGSYfW2w/bAOQmufRaXxvOaFGB3wvG57GRJ41dxBx0JaOflgSJ2El8RrJX3cnp9B5+dm1MHZWAecShMssVwlcxWQRCNxsLO2QJNtVEjWfG2+VcDvcsES7Rj8m9Z20EqoeizhVbxnJEDyrp7LqYgOVIuU/Jf639MRyjHmXakSCaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 IA1PR11MB7679.namprd11.prod.outlook.com (2603:10b6:208:3f1::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.15; Thu, 7 Aug 2025 17:10:38 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9009.016; Thu, 7 Aug 2025
 17:10:38 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Kassabri, Farah" <farah.kassabri@intel.com>
Subject: Re: [PATCH 1/8] drm/xe: Move explicit CT lock in TLB invalidation
 sequence
Thread-Topic: [PATCH 1/8] drm/xe: Move explicit CT lock in TLB invalidation
 sequence
Thread-Index: AQHcByDZyg4p3pt2fkmT43OPgucOt7RXbiGA
Date: Thu, 7 Aug 2025 17:10:38 +0000
Message-ID: <eacb4ffdb6b18bf912d6101496c8da156b6c139f.camel@intel.com>
References: <20250806222404.30333-1-stuart.summers@intel.com>
 <20250806222404.30333-2-stuart.summers@intel.com>
In-Reply-To: <20250806222404.30333-2-stuart.summers@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|IA1PR11MB7679:EE_
x-ms-office365-filtering-correlation-id: db5e55ce-533c-468c-f56c-08ddd5d554fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RG9xWmRqYkZ6MDNNNFhObnErcXphdnZiQ0Rld0N6ZndPZ3JadjFMbnhMb0pV?=
 =?utf-8?B?RExiclNHVjRwcVZDeFFYbTArZGtaaEJmM3E0K2o1U3JzS3p5QVl1WnB6RVVV?=
 =?utf-8?B?YTEwYmh2NkdvdkdCLzVwTHNqOEhoZ3IvUFBpLzZXajBaZGQ5bmR1N3ZNZGFo?=
 =?utf-8?B?TnBUcTZyN1JHVUpiTnliN25LSUdvZTNlanFHWElaRWo2UjBtazRkUndZZUUx?=
 =?utf-8?B?SW1YdFh0VU95cWs2T1RDK0VjcW0vcFJ0UFNEMjdrYzBWenRCeUIxVDkvcjJS?=
 =?utf-8?B?dWlteFMwZU1HU2NNZFoweEJrUUpMdVdLZ24wQUtWYWl1SWdyS1ptaWpDTGxm?=
 =?utf-8?B?UE5DUDVndGQ3UkZvTmtHOCsvd2VCMUpoMmVOcUFDOVJPTDh2c3pxZEQvSEtV?=
 =?utf-8?B?Z2NsMmdlSENicGlnSmlkUmhRZWhpclk1MW0zSFFUZC9qSGZmL2lxOVR6SzNG?=
 =?utf-8?B?eW9YdUw5Y3ZPUzJHRnA0VkgvYUdPYjJmYUVadFZjVHIwUlE1TU1HaWpJSlBv?=
 =?utf-8?B?SlpQbm1tNmgrNEdGWjFGVUY2bHVPZ0JsdTlYUGJUYzlOSkovUG0wV1dqSWZ1?=
 =?utf-8?B?dlpxN1Z4UExqS2R6N29LVmNBZ0tlVGtHZnhEUTJoTFlMek9BZEFnODQwQUla?=
 =?utf-8?B?U1cvbUswVERhWkE1YkRrdVpObXpJM0VsVFg0dE4xM2lBbjRXOGhvV1YwMjVt?=
 =?utf-8?B?MHVYUlhic0V5MXpSSUxwc0Y1Z2VzWVV4YnZqOU1DTkNDa0ZheEtHS1pRM2xM?=
 =?utf-8?B?UVEzZklMYUhvaWZiK2M3V3dDZ3cxWUU5eWRzNy91TmtURGdmTCswZk94N285?=
 =?utf-8?B?dTIzRURMbjRuZ2Vld1d1S1c4ZWZSYXY4dXV3MXE2VTFLVGlRNkluaGh0ZHZn?=
 =?utf-8?B?bmRoM01kdzhtMHJ3T1VScjRackZlblBoait6SzZXcWJFdStBNFVqc0dLMFZT?=
 =?utf-8?B?eGVMblhqUEVnNURLeTZDWHM5K3YvUHRRZ3BUcTFXR1VrQ3ZaUDNmcklnYy9l?=
 =?utf-8?B?V0luN29lNWhTTmlBOU1ndGRMNERiQWpYQ045aEZSZnJMbE9Ed0lWZURXOU5w?=
 =?utf-8?B?dXNVVXprVHl6Tzg3d3ZXNjFVK2RqSC8xQnI4WUVISHFJN0cweXB3TEMvTVp5?=
 =?utf-8?B?N1dpWjlPaUpNZHg3R3ppRzZXY1JhRnFxam5mdDltam5pNDFIUnRacm9pNkUv?=
 =?utf-8?B?VXIyQ0VZamxCaUtXQ0xyVzc0eWxjSExYWVc3UC9pdFpvY0J4TjdFaEQ2TFVs?=
 =?utf-8?B?RWRrZEtYSGpkNm1KZ202SEJvZmFhNVVHNnArS3AvSTNHM0RQbkgxRzI3RW9u?=
 =?utf-8?B?ajBGMStIa0lWUWNWZkxpUWNZUjBmZmo4aFdnM09WWjM2SmZRaVNIb0d6ZStN?=
 =?utf-8?B?Skg1RnR1dTFqOWpZTGdwSnA1NXpVVElSNzhrY2hoekdvUUNyUFZhY3Nzb3dB?=
 =?utf-8?B?eGpJem5DUUFwb1JJQlZSeW5lejQwV09mYWJWYWVFOEtjR3FFRlZVY2xkRkJa?=
 =?utf-8?B?YU4xaXVFN0daMFFjTTd3NTJiU0pTU3d0c3hVcTZjQ05HNWJmblk4UXBRQ2RJ?=
 =?utf-8?B?MVM2eGJOUWxGbW94K0ZQdEJLNmI4Lzd2V0JzbzFVTmJEandTMmcxVHJRMWlI?=
 =?utf-8?B?c2NJR3ZRWTdMMEVrZ1M5V044TGRzMzhvN0U1ZVNSODJ6UU1zcnd3WHlqYlp1?=
 =?utf-8?B?bS9welVDM1RORkd1UnBpTGs0aGh2dUdqajZhK3JEQzhhSkNBWCtIVjhacXk1?=
 =?utf-8?B?L3VlNytCMUdPYmdjQkFqSWIrV09rWFpUdUdJRUdaZGprQzNHNkc3SVNTeW8w?=
 =?utf-8?B?UWJhNXVYMW1HVGhNcC9Xa0VnajRvVjgzZThSWDNuM1YwWUtLbkJCUjBLWmZv?=
 =?utf-8?B?WE04QllJRkY4Skg2b1V3Mk03RVpCbjJERUFLNTFJVWZUMUErK2Q1UnBxMDEy?=
 =?utf-8?B?aWthTWg0VTkxOE9YTUp5RHc1T0dzSVBJd00rNGJGS3FyQ3BsUjJiU3ExeEhF?=
 =?utf-8?Q?DQZPHDy9dIqrX8mTjIQZ03LqYtwWIU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0xBeUpWY05TZTYvN3NuNTlLTHd6REc2Q2VtUmxVays1eG5MYVJtY3ZjZGph?=
 =?utf-8?B?djJXS1VReEpwb3ZKa0JjYjdWMnZ0YUg0em81UHJuM1JMSWdXTzBjbFYwcjRi?=
 =?utf-8?B?TWxJSWFNazYxTFpQNHloWjNxOFlKOS9FT29kZWRiSXgydTFJMmhoMDV2VXdB?=
 =?utf-8?B?ajJ3L09xY0NzTG9kMzJjYzBjZVpVUjVwSnlwMDZxRGFWeTJqZy9PQTBsVWMy?=
 =?utf-8?B?b1REbjJlRkxjRlhWOXkzVjZ5OEtpcEdRL1RQaE1uQmpOdHRRR0U1MklwWjdO?=
 =?utf-8?B?M01lUmZ5dDZueVZKaEUvWWdIUFIzWlI0OTdoVEFtRXRnQXVzc1NDb3JTR0RM?=
 =?utf-8?B?ZHkrU1hubWJPbTdhQkxwb0FCdm1zWWlNb0JFbkp3Tm83MFAvTGExRVVBUG13?=
 =?utf-8?B?eWlmOFZwMGt6amZCcWpKVzJhTCtLWXRFYlA5c1Y2MW1xRWhNQ2t0R3l3aHA3?=
 =?utf-8?B?YkFXTGhvM0M2Y0hhT3RkYlJFN2pMbFhyWENLK2VxSUhCcUxOV3Y1TkdzMURR?=
 =?utf-8?B?emF5clM3TU94WFE0YXI2dGRUNVdYcWZiS3NrOXExTSttVklQWWFmQUVQNndU?=
 =?utf-8?B?Yk82NE5NN3JTb0NEMDZmZmczZm5VaFdzUHcrSkIzTUx4UllXem52UnZ4SHRo?=
 =?utf-8?B?emlFV1VTUVRZY3JETXdLMzl1T3k2M05rbHlSTWI3MUR3U0RrNEYxV2diMCtG?=
 =?utf-8?B?cVZoTUJGeFRIS0ZLR0pGakhxdzU3WXkzU1VCbDRhYlJoM2VWSnRBOHVTS1ov?=
 =?utf-8?B?ZFBDL2pLSHFLSFNnNDZ5WlRVTktSYlY5clhxRU56bnNyaGxTU09oeUxrQ2kx?=
 =?utf-8?B?MUZURHBXMFg4VUI3ZlpHRXlPaVFtR012T0l1TmUvRmlPbElsTmpvVVR0b2Z1?=
 =?utf-8?B?am5SUEFHVkd2SkJiN0ZKU2s3UmFVb25BYUNpMFBNQ2lJVklrcVpjdlNLOEpC?=
 =?utf-8?B?MVpkY2RuY0FsNVUrclNjRHZ2L2NUbU9rV2U2VDQ2d2lRSGNRbjJsam9XR3Ex?=
 =?utf-8?B?Vm1uRnRCVjU0dDJNMC90a3RENS96S0RTMWNUUDAySnYraUh2cXVCUG9Xc3FX?=
 =?utf-8?B?QitDUytnRXBsZHR5NWIwbDNidDlubWFYSG10TWtMYmhGZXFlQ2dPRWNLWHc4?=
 =?utf-8?B?aS9xeG1lVnp5TTY5SHU4NXkzL3FNT3hkbVo4eXF1bXNsSDRCeTdrUXlBdERi?=
 =?utf-8?B?ZzV2YW5KQ0hTTGg3b25mWjlHSGV3MnRlN2RDa2gwc3JQUExTbUprSHRBUjFD?=
 =?utf-8?B?bTBNTlRmeGRmQm9CRjFTUURoM2M1YVdoNXFFaU9lRmlqbkpzcERWYm9zUDN0?=
 =?utf-8?B?ZU9FbVFLWkg4VkZUQU5xeHRmbWN0MDJCT3h2emRXaElLWC91T3lUTGhxOW1w?=
 =?utf-8?B?SjVWVi9PZFVVeHl5MGlLeUVEbUhSYzR1elRBQmxDSE84YTVHbWk0VVFjL1VO?=
 =?utf-8?B?VmxoMmViTEZGelNiOXRlejZIMlgyeUN6SXZmb211YWVSeVJ2MU45YkxkNEpy?=
 =?utf-8?B?TXN5Q1laNGJpZ1d6dy9WSmt5YkJCcFFnUHMwS2V3bzdmeXR1c1JoM3o5STBp?=
 =?utf-8?B?NVNmWWZNSXYyOXN3WUhjOWhpQ3ZFSDJ2aDY3Tldtcjl6YUhyd20vWWVsNk04?=
 =?utf-8?B?NWZMa2dNUVYwYTkvd2lZMDhhZjdNdVEvZFM5aE1hbWJlbHNmV2tvYUxpbnZz?=
 =?utf-8?B?b25lb2JZRldIb3hpZndNUlVEQkw5aWxDWWJXaTJtNDdpMnNkRXpucmlOQms3?=
 =?utf-8?B?ajUvSldDWFVzeitFVEhESUVsUWhNbHp4RzZ5QjN1NHU0Zkh3LzNXY1A5VGZm?=
 =?utf-8?B?MUlKU1NRQTdPNExERUsvZ0xjUWpyc2w5VExDNVNrbDdwSXhZalA4MmVCS2cy?=
 =?utf-8?B?RWtMQklRTnBQNkxCb3RVck4vL1gwM2VGeFVaMlByQzl2MDAwYWpwZWFCYnh1?=
 =?utf-8?B?YlU1RFA3RDB4MXZEZEdxS081cWRySjRDZ3NyMjB3a3A5MEkxdUx0U3JBOHpW?=
 =?utf-8?B?MUpzcWVqd09hamp3RFRKVDY4cWFwTWN1OFpJcHpZLytHUlJJejRuQURVbXh1?=
 =?utf-8?B?cVBaVkFwY250cG5GZDN2UzN6RGU2cnlVQ0YwQlBTTTV3TzFTVTBIdmxlZUt0?=
 =?utf-8?B?OGQ1ZnNTUTVPSFFqOUZPeW1oUW5SRGNTMUllTnR0WHN1ZVZIRlZYcE9CcCtZ?=
 =?utf-8?B?NlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C06FE4733BB1B049A46D5B8CB9FF1AAF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db5e55ce-533c-468c-f56c-08ddd5d554fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 17:10:38.6795 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BRTffOOtCci1oR1DK8zCuVUkVzsmT1NSUgFvVAgvZEN/lRDs0iutmLd2YSXhY/HCLYgaS0kIXnSK3PCu3F0rRtStB+hDgSV12K/b70MI2dc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7679
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

TWkgTWF0dCwKCkFueSB0aG91Z2h0cyBoZXJlPwoKVGhhbmtzLApTdHVhcnQKCk9uIFdlZCwgMjAy
NS0wOC0wNiBhdCAyMjoyMyArMDAwMCwgc3R1YXJ0c3VtbWVycyB3cm90ZToKPiBXZSBhbHJlYWR5
IGhhdmUgYSBsb2NrIHRyYWNraW5nIHRoZSBmZW5jZXMvc2VxdWVuY2UgbnVtYmVycwo+IGhlcmUg
KHBlbmRpbmdfbG9jaykuIEFuZCB0aGUgR3VDIENUIGNvZGUgYWxyZWFkeSBoYXMgYW4KPiBpbXBs
aWNpdCB2ZXJzaW9uIG9mIHRoaXMgbG9jayBpbiB0aGUgY3Rfc2VuZCByb3V0aW5lLgo+IFByZXBh
cmUgdGhlIHdheSBmb3IgZnV0dXJlIG9wdGltaXphdGlvbnMgaW4gVExCIGludmFsaWRhdGlvbgo+
IGZsb3cgYnkgbW92aW5nIHRoZSBtdXRleCBsb2NrIGRvd24gaW50byB0aGUgR3VDIENUIHNlbmQK
PiByb3V0aW5lIHJhdGhlciB0aGFuIGluIHRoZSB1cHBlciBUTEIgaW52YWxpZGF0aW9uIGxheWVy
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IHN0dWFydHN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVs
LmNvbT4KPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90bGJfaW52YWxpZGF0aW9u
LmMgfCA4ICsrLS0tLS0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA2IGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdGxi
X2ludmFsaWRhdGlvbi5jCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdGxiX2ludmFsaWRh
dGlvbi5jCj4gaW5kZXggMDJmMGJiOTJkNmUwLi4yMzBmMzAxNjEzOTUgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3RsYl9pbnZhbGlkYXRpb24uYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndF90bGJfaW52YWxpZGF0aW9uLmMKPiBAQCAtMTU4LDcgKzE1OCw2
IEBAIHZvaWQgeGVfZ3RfdGxiX2ludmFsaWRhdGlvbl9yZXNldChzdHJ1Y3QgeGVfZ3QKPiAqZ3Qp
Cj4gwqDCoMKgwqDCoMKgwqDCoCAqIGFwcGVhci4KPiDCoMKgwqDCoMKgwqDCoMKgICovCj4gwqAK
PiAtwqDCoMKgwqDCoMKgwqBtdXRleF9sb2NrKCZndC0+dWMuZ3VjLmN0LmxvY2spOwo+IMKgwqDC
oMKgwqDCoMKgwqBzcGluX2xvY2tfaXJxKCZndC0+dGxiX2ludmFsaWRhdGlvbi5wZW5kaW5nX2xv
Y2spOwo+IMKgwqDCoMKgwqDCoMKgwqBjYW5jZWxfZGVsYXllZF93b3JrKCZndC0+dGxiX2ludmFs
aWRhdGlvbi5mZW5jZV90ZHIpOwo+IMKgwqDCoMKgwqDCoMKgwqAvKgo+IEBAIC0xNzgsNyArMTc3
LDYgQEAgdm9pZCB4ZV9ndF90bGJfaW52YWxpZGF0aW9uX3Jlc2V0KHN0cnVjdCB4ZV9ndAo+ICpn
dCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICZndC0KPiA+dGxiX2ludmFsaWRhdGlvbi5wZW5kaW5nX2ZlbmNlcywgbGlu
aykKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGludmFsaWRhdGlvbl9mZW5jZV9z
aWduYWwoZ3RfdG9feGUoZ3QpLCBmZW5jZSk7Cj4gwqDCoMKgwqDCoMKgwqDCoHNwaW5fdW5sb2Nr
X2lycSgmZ3QtPnRsYl9pbnZhbGlkYXRpb24ucGVuZGluZ19sb2NrKTsKPiAtwqDCoMKgwqDCoMKg
wqBtdXRleF91bmxvY2soJmd0LT51Yy5ndWMuY3QubG9jayk7Cj4gwqB9Cj4gwqAKPiDCoHN0YXRp
YyBib29sIHRsYl9pbnZhbGlkYXRpb25fc2Vxbm9fcGFzdChzdHJ1Y3QgeGVfZ3QgKmd0LCBpbnQg
c2Vxbm8pCj4gQEAgLTIxMSwxMyArMjA5LDEyIEBAIHN0YXRpYyBpbnQgc2VuZF90bGJfaW52YWxp
ZGF0aW9uKHN0cnVjdCB4ZV9ndWMKPiAqZ3VjLAo+IMKgwqDCoMKgwqDCoMKgwqAgKiBuZWVkIHRv
IGJlIHVwZGF0ZWQuCj4gwqDCoMKgwqDCoMKgwqDCoCAqLwo+IMKgCj4gLcKgwqDCoMKgwqDCoMKg
bXV0ZXhfbG9jaygmZ3VjLT5jdC5sb2NrKTsKPiDCoMKgwqDCoMKgwqDCoMKgc2Vxbm8gPSBndC0+
dGxiX2ludmFsaWRhdGlvbi5zZXFubzsKPiDCoMKgwqDCoMKgwqDCoMKgZmVuY2UtPnNlcW5vID0g
c2Vxbm87Cj4gwqDCoMKgwqDCoMKgwqDCoHRyYWNlX3hlX2d0X3RsYl9pbnZhbGlkYXRpb25fZmVu
Y2Vfc2VuZCh4ZSwgZmVuY2UpOwo+IMKgwqDCoMKgwqDCoMKgwqBhY3Rpb25bMV0gPSBzZXFubzsK
PiAtwqDCoMKgwqDCoMKgwqByZXQgPSB4ZV9ndWNfY3Rfc2VuZF9sb2NrZWQoJmd1Yy0+Y3QsIGFj
dGlvbiwgbGVuLAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHMkhfTEVOX0RXX1RMQl9JTlZBTElEQVRFLCAxKTsK
PiArwqDCoMKgwqDCoMKgwqByZXQgPSB4ZV9ndWNfY3Rfc2VuZCgmZ3VjLT5jdCwgYWN0aW9uLCBs
ZW4sCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBHMkhfTEVOX0RXX1RMQl9JTlZBTElEQVRFLCAxKTsKPiDCoMKgwqDCoMKgwqDCoMKgaWYg
KCFyZXQpIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNwaW5fbG9ja19pcnEo
Jmd0LT50bGJfaW52YWxpZGF0aW9uLnBlbmRpbmdfbG9jayk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAvKgo+IEBAIC0yNDgsNyArMjQ1LDYgQEAgc3RhdGljIGludCBzZW5kX3Rs
Yl9pbnZhbGlkYXRpb24oc3RydWN0IHhlX2d1Ywo+ICpndWMsCj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBpZiAoIWd0LT50bGJfaW52YWxpZGF0aW9uLnNlcW5vKQo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGd0LT50bGJfaW52YWxpZGF0
aW9uLnNlcW5vID0gMTsKPiDCoMKgwqDCoMKgwqDCoMKgfQo+IC3CoMKgwqDCoMKgwqDCoG11dGV4
X3VubG9jaygmZ3VjLT5jdC5sb2NrKTsKPiDCoMKgwqDCoMKgwqDCoMKgeGVfZ3Rfc3RhdHNfaW5j
cihndCwgWEVfR1RfU1RBVFNfSURfVExCX0lOVkFMLCAxKTsKPiDCoAo+IMKgwqDCoMKgwqDCoMKg
wqByZXR1cm4gcmV0OwoK
