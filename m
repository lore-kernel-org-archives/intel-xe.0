Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93BCCA101F
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 17:58:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C7410E9AA;
	Wed, 10 Sep 2025 17:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MChGyvp0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D475210E9AA
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 17:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757527082; x=1789063082;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=yUxAQxJ8icADtkiNPAbji43gAfmq915M2TBuddl4v+4=;
 b=MChGyvp0VCqXYPWfKmymRZlrtPUg02s2nfHh366F2GtjivFXLLWnuCL1
 Ojii5qCk6p3XarYSN1ruuNH+Ydf949LA+k6WFgt4QWbWx5O5iweGnUcGD
 v34PnNYx4Ba7XLoP8S9M6Cw+WujirS/rwjYxcWXzO/AzGoTAtqKStIAPo
 v4x8eWe5cZvjNpeGhscGQBWkd8Pz5CxtRzb7Q+/Vh2Z4GOoCyy3jrNaD2
 0bSL7h2VXoP1I1ZWJw2RZ+uvqRDwtMKJtjb+KEDV2X1kk+ccCxJYN7L47
 dwBc4wYpNncY+oNNdacAFCnOXdy9ag8/nFBl+7SJXfTAlAwrJoto+WRUn w==;
X-CSE-ConnectionGUID: B1/EWCJgSb+2ryL6m37CpA==
X-CSE-MsgGUID: 5HupCU3cQhSCTLxjRjl53A==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="70102742"
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="70102742"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 10:58:01 -0700
X-CSE-ConnectionGUID: +6NECrVoTqin88LfiqEtfA==
X-CSE-MsgGUID: CbHymXYmSoOCY/6jByuPUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="174271482"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 10:58:00 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 10:57:59 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 10:57:59 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.48) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 10:57:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p6DjNffdyP0ItUiQqWycPUSZvQfUe8XnWvpAKbEuOQ5/ILdHmGQH+oQXgMC3oY3xorZfq5vW8wYINdWzZKXg0sUWFtgjz0sUruWpO9F8ZlDfvpwVFOxyyuAi06SUC22fw+DbzPE3utela7FQT99CtUcKOGZYjeIDJaziukxXBOoQ9kyY94x8ur50EqeWMKdlgzsOMUH7xa4l+QH3XoAgSZnhcfapp3h6Wtp0NIBK02ZaiNHactwr56DclQccmVCQ26o627LENh2Lr+RK1wcvnRED51mf5Xx4nopUBECDxTT8edujZoBve7hA32Rl38Op88kdAF+Onkbn7ZHKc1acrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUxAQxJ8icADtkiNPAbji43gAfmq915M2TBuddl4v+4=;
 b=JF2A4kKyYNy2Ez5l+NBpuVygVv23ydtYImLRNP5TbdLN9ynvKueHUe49OwJmy4iOOD6iqy0moXas539HVxXJSpYzYT3Jyez6xd3e1G0ZJ6La6qtV8v9z0w9/OYawo9NVibOh5L/hEYn4UU+3QxixwiEJPuuGGBuKNrlIpVhSRTUVbUdyFXS5tzLupyosz10IPwyKLoeODTWaII8E7gWP3m4rv4XfMFtwir+4GLzHAWlgvimiIogIlSR2uGo7uBC9sWdJ2G8jnYNg3GR5JeeJy5b327U/IRlYO1WNEihKdLqM1DOxsuKeH7jwxRZR6hEH4GppqMHarbZBdyKyMdCgVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DS7PR11MB8807.namprd11.prod.outlook.com (2603:10b6:8:255::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.19; Wed, 10 Sep 2025 17:57:57 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 17:57:57 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Dugast, Francois" <francois.dugast@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>
Subject: Re: [RFC 2/2] drm/xe/gt_pagefault: Add tracepoints when handing page
 faults
Thread-Topic: [RFC 2/2] drm/xe/gt_pagefault: Add tracepoints when handing page
 faults
Thread-Index: AQHcIZsyVRELalHG0UmNU0YiA5xEj7SLNucAgADXfgCAAKdEAA==
Date: Wed, 10 Sep 2025 17:57:57 +0000
Message-ID: <50b242f6435f329aa40e44beec2da102297d0d96.camel@intel.com>
References: <20250909150437.986365-1-francois.dugast@intel.com>
 <20250909150437.986365-3-francois.dugast@intel.com>
 <8fd9e885a3b8cbaa422ff7825fa93c8083aa36c8.camel@intel.com>
 <aMEvyD-j1_99SUMH@fdugast-desk>
In-Reply-To: <aMEvyD-j1_99SUMH@fdugast-desk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DS7PR11MB8807:EE_
x-ms-office365-filtering-correlation-id: 893b8395-6a16-48a8-3dab-08ddf09392e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?cCtBQmhNdGNQeDR5dDdEcEdMcXgrN2EyaGFrU0Q3Um5yanNpenIvQ0NxKzlr?=
 =?utf-8?B?Z2lQSzA3d2s3QVdGdjI3TXdLUFJFWU9ucGhSR2xUaTZyaW84bHNteUEvNXc1?=
 =?utf-8?B?N0VoMmJNTEV5MEdXVmxhMXRDUWJQTlN4dHA0QXZuSms2VVAva1ord2J3MUMw?=
 =?utf-8?B?VWkzYitEbWNGaFdjNzEycUowcy93ZVo4UTVzdlYveVZRQm9tMDlMVm9MUHRP?=
 =?utf-8?B?ai9sRmdnZXA5Y1EyUkdFZ0VsT2RNRUtha3Q1KzdMYi9yTmZkZTdSbFZkdnFN?=
 =?utf-8?B?YnMrWWh3MVJWQUFQcjNTMlJQczB1dW96WGQ5QzB0MHBVNi9XaGZBaTBIK0RZ?=
 =?utf-8?B?OTllZS8vNE1aUFE5Vk81cHp1YjZnZ2ZnQisxQjNHRkhXSTZzZGQ2aGRiQUtB?=
 =?utf-8?B?RjJyTVVFdUJObWdoUDA5Qk13RHdjaEYyUXpzTTR6UVZUeloyK2lMV1d6dFVE?=
 =?utf-8?B?dlBkSWkzRkRsbDJ6d0dXQ0wrQzdyQ0hnbTFraDNVMTA4cDlURHF6L1liUDN1?=
 =?utf-8?B?VlNrVGVtYXpGNUFmYkFiZE5EMmpqSk50YUJEVmRnZjlCbkgxaVVwUmRRZjMr?=
 =?utf-8?B?cmVmOE1ESTNhQzl2SU5pR2dwU2FkQmwrcnFSUHJLNU1VZUdYTnI0UlJSUXdX?=
 =?utf-8?B?VFVHZWJEMEwrMGFDVFlZd29qMThHSFZBTGZuR25oL3pSMjR1bnZsTTRJa0hV?=
 =?utf-8?B?T0N3dDF4SW00WURFUXNtTG44YWM2T3plWGxyb1VvQUNYa2Q5SWVqZDdoMzdL?=
 =?utf-8?B?dzZ1dkk5WlZiL2pqMTgwY292NGl6QS9OOWhzd3p4Yi9HTDgzUFZyRDRyZTBT?=
 =?utf-8?B?MVdlQ2pXK2ZRVm5lZm5xbXgwcnplL3FhSWVFb1RFb215RkZXM3pmN1ZKdUp2?=
 =?utf-8?B?cWZGbnQrWmduY0h0ZHpHTElaY2MxRFhnQ3FFWThFU0hCeE05Wkw0KzBXVEh5?=
 =?utf-8?B?SERRSmFjTDZxeEtxMDNVS2VSd2x0UERkRStFeGp4ZjlRY3M5N2xwdnZYN2FG?=
 =?utf-8?B?bVhhck9UZ2tJZ1M4dDRJWk5QbHVMazhyTFF1V3ZueHBEeWxJV2dKRm13V0NY?=
 =?utf-8?B?bm54bHluMklxd0haRno2N2VQR3ZwUU54T01jaDAwY0IvSStvaTMzV3lGTlBl?=
 =?utf-8?B?WFN6WHBFRjJ2R2NTcndobngydlFHZEZaR0V3UjBhcWJrVTZaSkV0Wmc4cnhs?=
 =?utf-8?B?NUg1Y1JXcEVBRXg5QzRyUjFyV3V0Z1JvUnozL2VONzZKaUNBUlZ1ZlVMbXV5?=
 =?utf-8?B?SUNRK2Exc0Z3RUhkRTQ3Uktuc2tYR2w3WWNudlZIMlpPVXBxQk5VUUF2Q1ow?=
 =?utf-8?B?M1hhcTZIR2N4aXFtQkszWlAvdTVOdEhReVg1WXo1SzBmVFVrMERBaEJ2UitZ?=
 =?utf-8?B?NUpRV2E5NE5LR1J1UVdCRmpBVTFscVlsYjhvVGhERlRlMlJrUnVoU0UvV2JG?=
 =?utf-8?B?akdLckNLQ21PaEM4MFltK1U5bitxZ3hVcEttdG1rKzIyM25lUHp1QXRveTJF?=
 =?utf-8?B?TkhjVExzSG1BemJ3Z2IxYzhKVlJJQk5xUWNNWjArSFpQUzJaSlVlRzBmQXhP?=
 =?utf-8?B?dFcrOVp0Ym1Fam5KZHBTWVZwcFUxVW9OQXJLTFdxV1pZazg2clZMVklLNnUv?=
 =?utf-8?B?cEZ4TVlqSDdieU11SXlWajlJNUtRemNKNXhiempuZSs3ZzU4OVNNUVVqSDQ0?=
 =?utf-8?B?Ym5Vb2xZSGtNVzk4elhtMmlMbnhncUhNcUc1cEo3TzhLMTRSc2hmeXFZQ2dF?=
 =?utf-8?B?YUt5N3NOK3ZucmNONDFPL3lxdWd1Z2lYNldWY3A5QWNvY1hLejFtYTM1N0c5?=
 =?utf-8?B?SzlSNnVTYksxa0dncEE4cE9HbUE3cElTdXpyN056dTh2S1k1RUJGbUM5SEZT?=
 =?utf-8?B?bmhIK2pCOVNYVU43ZG15UHRSUXB1K0ZzOXpFaEsvNDlrTW1DRXl6QUVsTWlh?=
 =?utf-8?B?REduSUhrbjVyUTN6MUFaOFlMbjNheW83ellHbkpGajFidWtjejBBY3lKVGxj?=
 =?utf-8?Q?lLUd5bJ4TE2HrUxnBp6eO7jvQMN5SY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RmhzNEVZdktJazF5aFdrdXV0VDBSeWxVSHNCOGlLRnNkWk5MMWw2WUJna0xh?=
 =?utf-8?B?eWZ6azl4WEZxUUZ1ZnlOL2RYSmoxUlRtd0VGZ3ovSkF2cURyNjhGUElGcTlK?=
 =?utf-8?B?V0lvYkIrZWhOMFJ6dnBMN2R5WTU4cnUzSzU5VmpnYmRmOWhRckdhVkVPZUlj?=
 =?utf-8?B?QkdWUTNJcGhzQmEwRm5vOXlpRW1CU2RzMzE2R0cyeFJ2QjdDWHVqaURZdk1C?=
 =?utf-8?B?T3ZkaE01RVZxNGhLZXF4a0d4QTVPaFVSeE1VTFZrR0pPMGZQOStvd1hNY1ZH?=
 =?utf-8?B?aEhFNTRvUkxuS0tmR0tMZ29acmRnU3FXb3hIeDRIUk1aZHV5c0hjL09Cc2NH?=
 =?utf-8?B?SDlKTjBnSExPVkVETXRiTnI3Vkw3RWZBb0YxZGdEZC9JdmdFOUtZNnRQSDZX?=
 =?utf-8?B?SlpnZ2VtRXdHVTRNUkx6anN4Unk3YzkwWUFiblRTYmZSNXlpMmZiWlFoTDZ6?=
 =?utf-8?B?aWZvOGdGUGJLY0ZEQ0xmNFRqdGoyQmMwWklaTVkxbGlWMS9MRUgrYStCRnFl?=
 =?utf-8?B?bjQ2cEpkMVdTOFNQaml4L29wQVRzUHZId2ZpdEI1SnFPUUgram9mUVJYZUla?=
 =?utf-8?B?UTFySGZjUFpQUGliN2tGRVZNRjZMelJNOU1UTTJVUHprR2NTNkdJSjRFa0lS?=
 =?utf-8?B?VEVaYkprQjVxY1VVc04zNnZMRnk2OXlReCtwVTluWHppMVNydEh5ZytiM3Vw?=
 =?utf-8?B?T1lLaHpzNEwzWmhZVlF6SU10aitYOUhZaEJhU0duR1IwUmxrNDBwL3dFbE43?=
 =?utf-8?B?ckpkZmtTUnVsNTl0amVIZDBPZm5SNGx0c0RkZ2FNUzFza0lyUFRnUlRBdjJC?=
 =?utf-8?B?QXk3VytGb05oRmZ5Mm5HM0VQTkxWdFlUS3pPTEpiV0phbWl1dndJUmptWm9i?=
 =?utf-8?B?WVMvNHZmdkF6bUxiNGpRajYxc2QrdzlIdjNaa3JCRTB3dFlMcUtXdUNyeTdV?=
 =?utf-8?B?b1BEMllGNE1vUm1zQjJxTzUwcTdJT1ZUbGxxNFRMTEwvR3RXTE1Kc3RWMVRS?=
 =?utf-8?B?TnYrYlhGQzREcTZDcnZ4MTVKYlIyejZ4V3hrUDJHSkRPTHI0Q1VXRVVuMmN4?=
 =?utf-8?B?SDQ2aFZoNjVCNDRjYXJlM1RjSHhmYjNUdy9DV3k1YXVscGk0MHNZQnVib2JK?=
 =?utf-8?B?dW0yOWhsMXIyS2d4bldRS09Kb3hBNzFiMlZSSUlvb01NQ1B2eDRrWS9acjJV?=
 =?utf-8?B?UlRacWZlNmhNV3JIWXZ6UUg0MS9kYlpTMFFkQXhKaVFVbXZtL0ZYM0VlWjVU?=
 =?utf-8?B?NlZSTm1YamtBTXVGWWYvOEdyQ2JKWHRHblYyQWNlQitISHNGenpHTVZwNkFZ?=
 =?utf-8?B?UGdsTHJTdisyVnR3QVR0WGdvT1dyd0x2YUF1M1BsK3NRVGtXSUFlWVNkMTNk?=
 =?utf-8?B?NnJmcExBcVE1elBwd3k4V21QWU5uQUVkNDB6Mm41ZWNKN0FtbnhjUEpGam1z?=
 =?utf-8?B?azNpZHF0Wkw4UFhKZ29oWTdjaFpFNHRpN2oxeWRaWkU0U0UyenJsU1NVSXRB?=
 =?utf-8?B?OFM0UDYxUG1VU2NreWxRM0NhWlAxd3graE9Pd1NPdzByUm8yYlg0YUFBWE9x?=
 =?utf-8?B?RkEzc0V6NzhZUUtxak9wdUVaWXZNWFloc2llSTVsWU5NMmJCeE8zaXR5enhr?=
 =?utf-8?B?VGhYVVN0UkxoKzUyQzJjTHIzQlNUWThpMEFqRzNXQ2pBSVRHTGJlcXI4c0Z3?=
 =?utf-8?B?dkc4Y3dWdTd6OXg5V2xPdVZqUGhXZG0xemFzOGdHMW1LQlBqVzRFejYvUkRi?=
 =?utf-8?B?dVVERkFmdGdzclIzUTNHNUltc0dwSTRURXlvTjFTaTNMWnVlNjA2cUpaVDhJ?=
 =?utf-8?B?eVhVU1RDMzlHVlh4WGFueUNSRzJUUC9uZVN2ZjI2VTBIaDdEOVdzYnFLYmpo?=
 =?utf-8?B?Y0Q2ODlkb3Z4OWlUMWV4Z21vRkl3dzV3QUhZaUgzU25yZmpQdkcrRjFnMllV?=
 =?utf-8?B?V21zQVpiQTZaRUorNTY2NjBpUHZOMGUvYXExMGxOem52NlZTeE1MdlhWYVFk?=
 =?utf-8?B?OHM0ZTRLcVBUZ0U1cHA2bWIvWStUWThuRnpJSlVEaHZrTk9XaVFGQ2dFTW1L?=
 =?utf-8?B?T2JGNkxXNTJYa2JkQ0d3VDRLQ1N2L2N1VGhQY3pvNlhJbFBDU3M5b0pFdkFy?=
 =?utf-8?B?VnRENGdyR1lOc1d4Y1YyTXpLYXlnNUtmd2FaWFFwVFhNTEU4YnVSeGh1aGhT?=
 =?utf-8?B?dGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D716483A5BF5234D8E8E4B86DF5C49A5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 893b8395-6a16-48a8-3dab-08ddf09392e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2025 17:57:57.1248 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7jWWsSWS7PT8BBpE6JNtI1/BZxxBpBiVF9Mjv+X47j5Mwf8MFizNNO3eTd7yZ41YVqiP42rHQIyPAF/z5pYlSQ0ysUflif6/8wyDyVE6XnU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8807
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

T24gV2VkLCAyMDI1LTA5LTEwIGF0IDA5OjU5ICswMjAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
Cj4gT24gVHVlLCBTZXAgMDksIDIwMjUgYXQgMDk6MDg6MDNQTSArMDIwMCwgU3VtbWVycywgU3R1
YXJ0IHdyb3RlOgo+ID4gT24gVHVlLCAyMDI1LTA5LTA5IGF0IDE3OjAzICswMjAwLCBGcmFuY29p
cyBEdWdhc3Qgd3JvdGU6Cj4gPiA+IEFkZCBhIG5ldyB0cmFjZXBvaW50cyB3aGVuIGhhbmRsaW5n
IFZNQSBhbmQgU1ZNIHBhZ2UgZmF1bHRzLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogRnJh
bmNvaXMgRHVnYXN0IDxmcmFuY29pcy5kdWdhc3RAaW50ZWwuY29tPgo+ID4gPiAtLS0KPiA+ID4g
wqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfcGFnZWZhdWx0LmPCoMKgwqDCoMKgwqAgfCAyMiAr
KysrLS0tLS0tLS0KPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfcGFnZWZhdWx0X3R5
cGVzLmggfCAyNSArKysrKysrKysrKysrKwo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV90
cmFjZS5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA0MAo+ID4gPiArKysrKysrKysrKysr
KysrKysrKysrCj4gPiA+IMKgMyBmaWxlcyBjaGFuZ2VkLCA3MSBpbnNlcnRpb25zKCspLCAxNiBk
ZWxldGlvbnMoLSkKPiA+ID4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2d0X3BhZ2VmYXVsdF90eXBlcy5oCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2d0X3BhZ2VmYXVsdC5jCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2d0X3BhZ2VmYXVsdC5jCj4gPiA+IGluZGV4IGQwMmQyMmZiMzY1OS4uNTA4MzZkZjc5OTUw
IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfcGFnZWZhdWx0LmMK
PiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3BhZ2VmYXVsdC5jCj4gPiA+IEBA
IC0yMCwyNCArMjAsMTEgQEAKPiA+ID4gwqAjaW5jbHVkZSAieGVfZ3VjX2N0LmgiCj4gPiA+IMKg
I2luY2x1ZGUgInhlX21pZ3JhdGUuaCIKPiA+ID4gwqAjaW5jbHVkZSAieGVfc3ZtLmgiCj4gPiA+
ICsjaW5jbHVkZSAieGVfdHJhY2UuaCIKPiA+ID4gwqAjaW5jbHVkZSAieGVfdHJhY2VfYm8uaCIK
PiA+ID4gwqAjaW5jbHVkZSAieGVfdm0uaCIKPiA+ID4gwqAjaW5jbHVkZSAieGVfdnJhbV90eXBl
cy5oIgo+ID4gPiDCoAo+ID4gPiAtc3RydWN0IHBhZ2VmYXVsdCB7Cj4gPiA+IC3CoMKgwqDCoMKg
wqDCoHU2NCBwYWdlX2FkZHI7Cj4gPiA+IC3CoMKgwqDCoMKgwqDCoHUzMiBhc2lkOwo+ID4gPiAt
wqDCoMKgwqDCoMKgwqB1MTYgcGRhdGE7Cj4gPiA+IC3CoMKgwqDCoMKgwqDCoHU4IHZmaWQ7Cj4g
PiA+IC3CoMKgwqDCoMKgwqDCoHU4IGFjY2Vzc190eXBlOwo+ID4gPiAtwqDCoMKgwqDCoMKgwqB1
OCBmYXVsdF90eXBlOwo+ID4gPiAtwqDCoMKgwqDCoMKgwqB1OCBmYXVsdF9sZXZlbDsKPiA+ID4g
LcKgwqDCoMKgwqDCoMKgdTggZW5naW5lX2NsYXNzOwo+ID4gPiAtwqDCoMKgwqDCoMKgwqB1OCBl
bmdpbmVfaW5zdGFuY2U7Cj4gPiA+IC3CoMKgwqDCoMKgwqDCoHU4IGZhdWx0X3Vuc3VjY2Vzc2Z1
bDsKPiA+ID4gLcKgwqDCoMKgwqDCoMKgYm9vbCB0cnZhX2ZhdWx0Owo+ID4gPiAtfTsKPiA+IAo+
ID4gSSdkIHJhdGhlciB3YWl0IHRvIGFkZCB0aGlzIG9uIHRvcCBvZiB0aGUgcGFnZSBmYXVsdCBz
ZXJpZXMgTWF0dAo+ID4gaGFzIG9uCj4gPiB0aGUgbGlzdC4KPiAKPiBZZXMsIGFic29sdXRlbHku
Cj4gCj4gPiAKPiA+ID4gLQo+ID4gPiDCoGVudW0gYWNjZXNzX3R5cGUgewo+ID4gPiDCoMKgwqDC
oMKgwqDCoMKgQUNDRVNTX1RZUEVfUkVBRCA9IDAsCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBBQ0NF
U1NfVFlQRV9XUklURSA9IDEsCj4gPiA+IEBAIC0yMDksMTEgKzE5NiwxNCBAQCBzdGF0aWMgaW50
IGhhbmRsZV9wYWdlZmF1bHQoc3RydWN0IHhlX2d0Cj4gPiA+ICpndCwKPiA+ID4gc3RydWN0IHBh
Z2VmYXVsdCAqcGYpCj4gPiA+IMKgCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBhdG9taWMgPSBhY2Nl
c3NfaXNfYXRvbWljKHBmLT5hY2Nlc3NfdHlwZSk7Cj4gPiA+IMKgCj4gPiA+IC3CoMKgwqDCoMKg
wqDCoGlmICh4ZV92bWFfaXNfY3B1X2FkZHJfbWlycm9yKHZtYSkpCj4gPiA+ICvCoMKgwqDCoMKg
wqDCoGlmICh4ZV92bWFfaXNfY3B1X2FkZHJfbWlycm9yKHZtYSkpIHsKPiA+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHRyYWNlX3hlX2hhbmRsZV9zdm1fcGFnZWZhdWx0KHhlLCBw
Zik7Cj4gPiAKPiA+IENhbiB5b3UgYWRkIHRoaXMgZGlyZWN0bHkgaW50byB0aGUgeGVfc3ZtX2hh
bmRsZV9wYWdlZmF1bHQgcm91dGluZQo+ID4gaW5zdGVhZCBvZiBpbiB0aGUgb3V0ZXIgbGF5ZXIg
aGVyZT8KPiAKPiBZZXMgYnV0IEkgd291bGQgZmF2b3IgdGhlIG90aGVyIGFwcHJvYWNoIHlvdSBh
cmUgc3VnZ2VzdGluZyBiZWxvdy4KClllYWggbm8gcHJvYmxlbSwganVzdCB3YW50ZWQgdG8gZ2l2
ZSBkaWZmZXJlbnQgb3B0aW9ucyB0aGVyZS4KCj4gCj4gPiAKPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBlcnIgPSB4ZV9zdm1faGFuZGxlX3BhZ2VmYXVsdCh2bSwgdm1hLCBn
dCwKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBmLT5wYWdlX2FkZHIs
Cj4gPiA+IGF0b21pYyk7Cj4gPiA+IC3CoMKgwqDCoMKgwqDCoGVsc2UKPiA+ID4gK8KgwqDCoMKg
wqDCoMKgfSBlbHNlIHsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHRyYWNl
X3hlX2hhbmRsZV92bWFfcGFnZWZhdWx0KHhlLCBwZik7Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgZXJyID0gaGFuZGxlX3ZtYV9wYWdlZmF1bHQoZ3QsIHZtYSwgYXRvbWlj
KTsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgfQo+ID4gPiDCoAo+ID4gPiDCoHVubG9ja192bToKPiA+
ID4gwqDCoMKgwqDCoMKgwqDCoGlmICghZXJyKQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d0X3BhZ2VmYXVsdF90eXBlcy5oCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2d0X3BhZ2VmYXVsdF90eXBlcy5oCj4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4g
PiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uNDMxYjE0NjlkNzliCj4gPiA+IC0tLSAvZGV2L251bGwK
PiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3BhZ2VmYXVsdF90eXBlcy5oCj4g
PiA+IEBAIC0wLDAgKzEsMjUgQEAKPiA+ID4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBN
SVQgKi8KPiA+ID4gKy8qCj4gPiA+ICsgKiBDb3B5cmlnaHQgwqkgMjAyNSBJbnRlbCBDb3Jwb3Jh
dGlvbgo+ID4gPiArICovCj4gPiA+ICsKPiA+ID4gKyNpZm5kZWYgX1hFX0dUX1BBR0VGQVVMVF9U
WVBFU19IXwo+ID4gPiArI2RlZmluZSBfWEVfR1RfUEFHRUZBVUxUX1RZUEVTX0hfCj4gPiA+ICsK
PiA+ID4gKyNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgo+ID4gPiArCj4gPiA+ICtzdHJ1Y3QgcGFn
ZWZhdWx0IHsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgdTY0IHBhZ2VfYWRkcjsKPiA+ID4gK8KgwqDC
oMKgwqDCoMKgdTMyIGFzaWQ7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoHUxNiBwZGF0YTsKPiA+ID4g
K8KgwqDCoMKgwqDCoMKgdTggdmZpZDsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgdTggYWNjZXNzX3R5
cGU7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoHU4IGZhdWx0X3R5cGU7Cj4gPiA+ICvCoMKgwqDCoMKg
wqDCoHU4IGZhdWx0X2xldmVsOwo+ID4gPiArwqDCoMKgwqDCoMKgwqB1OCBlbmdpbmVfY2xhc3M7
Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoHU4IGVuZ2luZV9pbnN0YW5jZTsKPiA+ID4gK8KgwqDCoMKg
wqDCoMKgdTggZmF1bHRfdW5zdWNjZXNzZnVsOwo+ID4gPiArwqDCoMKgwqDCoMKgwqBib29sIHRy
dmFfZmF1bHQ7Cj4gPiA+ICt9Owo+ID4gPiArCj4gPiA+ICsjZW5kaWbCoC8qIF9YRV9HVF9QQUdF
RkFVTFRfVFlQRVNfICovCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
dHJhY2UuaAo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90cmFjZS5oCj4gPiA+IGluZGV4
IGI5ZjU5NjUxNzcxZS4uODU4Nzk4MmU3ZWVlIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfdHJhY2UuaAo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdHJh
Y2UuaAo+ID4gPiBAQCAtMTQsOCArMTQsMTAgQEAKPiA+ID4gwqAKPiA+ID4gwqAjaW5jbHVkZSAi
eGVfZXhlY19xdWV1ZV90eXBlcy5oIgo+ID4gPiDCoCNpbmNsdWRlICJ4ZV9ncHVfc2NoZWR1bGVy
X3R5cGVzLmgiCj4gPiA+ICsjaW5jbHVkZSAieGVfZ3RfcGFnZWZhdWx0X3R5cGVzLmgiCj4gPiA+
IMKgI2luY2x1ZGUgInhlX2d0X3R5cGVzLmgiCj4gPiA+IMKgI2luY2x1ZGUgInhlX2d1Y19leGVj
X3F1ZXVlX3R5cGVzLmgiCj4gPiA+ICsjaW5jbHVkZSAieGVfaHdfZW5naW5lLmgiCj4gPiA+IMKg
I2luY2x1ZGUgInhlX21pZ3JhdGVfdHlwZXMuaCIKPiA+ID4gwqAjaW5jbHVkZSAieGVfc2NoZWRf
am9iLmgiCj4gPiA+IMKgI2luY2x1ZGUgInhlX3RsYl9pbnZhbF90eXBlcy5oIgo+ID4gPiBAQCAt
NDczLDYgKzQ3NSw0NCBAQCBERUZJTkVfRVZFTlQoeGVfbWlncmF0ZSwgeGVfbWlncmF0ZV92cmFt
LAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVFBfQVJHUyh4ZSwgbGVuLCB2cmFtX2Fk
ZHIsIGRpcikKPiA+ID4gwqApOwo+ID4gPiDCoAo+ID4gPiArREVDTEFSRV9FVkVOVF9DTEFTUyh4
ZV9wYWdlZmF1bHQsCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
VFBfUFJPVE8oc3RydWN0IHhlX2RldmljZSAqeGUsIHN0cnVjdAo+ID4gPiBwYWdlZmF1bHQKPiA+
ID4gKnBmKSwKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBUUF9B
UkdTKHhlLCBwZiksCj4gPiA+ICsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBUUF9TVFJVQ1RfX2VudHJ5KAo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX3N0cmluZyhkZXYsIF9fZGV2X25hbWVfeGUo
eGUpKQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBfX2ZpZWxkKHU2NCwgcGFnZV9hZGRyKQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX2ZpZWxkKHU4LCBmYXVsdF90eXBl
KQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBfX2ZpZWxkKHU4LCBhY2Nlc3NfdHlwZSkKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19maWVsZCh1OCwgZmF1bHRfbGV2ZWwp
Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIF9fZmllbGQodTgsIGVuZ2luZV9jbGFzcykKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19maWVsZCh1OCwgZW5naW5lX2luc3Rh
bmNlKQo+ID4gCj4gPiBBbHNvIHRoaXMgaW5mb3JtYXRpb24gaXMgbW9yZSBwYWdlZmF1bHQgc3Bl
Y2lmaWMgYW5kIG5vdCByZWFsbHkgdG8KPiA+IFNWTQo+ID4gc3BlY2lmaWNhbGx5LiBJbnN0ZWFk
IG9mIG1vdmluZyB0byB4ZV9zdm0uYywgeW91IGNvdWxkIGp1c3QgcHV0Cj4gPiB0aGlzCj4gPiBv
dXRzaWRlIG9mIHRoZSBzdm0gaWYgY29uZGl0aW9uIGFib3ZlIHRvIGNvdmVyIGFsbCBjYXNlcy4K
PiAKPiBTdXJlLCB3aWxsIGRvLgo+IAo+ID4gCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICksCj4gPiA+ICsKPiA+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBUUF9mYXN0X2Fzc2lnbigKPiA+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19hc3NpZ25f
c3RyKGRldik7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIF9fZW50cnktPnBhZ2VfYWRkciA9IHBmLT5wYWdlX2FkZHI7Cj4gPiAKPiA+
IEFuZCB5ZWFoIHNvbWV0aGluZyBhYm91dCB0aGUgVk0gd2UgZm91bmQgd291bGQgYWxzbyBiZSBp
bnRlcmVzdGluZwo+ID4gaGVyZS4KPiAKPiBBbHJpZ2h0LCBhbnkgaW5mbyBpbiBwYXJ0aWN1bGFy
PyBhc2lkIGFuZCBncHVzdm0/CgpNb3N0bHkgaGVyZSBJIHRoaW5rIHdlIGp1c3Qgd2FudCBhIHdh
eSB0byB0aWUgdGhlc2UgaW4gd2l0aCBlaXRoZXIKY29udGV4dCBzdWJtaXNzaW9ucyBvciBWTXMv
Qk9zIGNyZWF0ZWQgYnkgdGhlIHVzZXIuIFNvIGlmIHdlIGhhdmUgdGhlClZNIHRyYWNlcyBvbiwg
d2Ugc2hvdWxkIGJlIGFibGUgdG8gc2VlIHRob3NlIGJpbmRzIGFuZCB0aGVzZSBmYXVsdHMgYW5k
CmNsZWFybHkgYXNzb2NpYXRlIHRoZSBkaWZmZXJlbnQgcHJvY2Vzc2VzL3RocmVhZHMgYWNjZXNz
aW5nIHRoZW0uCgpBbHNvIHdvdWxkIGJlIGdvb2QgdG8gcGFzcyBhbnl0aGluZyBoYXJkd2FyZS9n
dWMgaXMgc2VuZGluZyB1cywgc28KYXNpZCwgdmZpZCwgcGRhdGEgKGhhcmR3YXJlIGZhdWx0IGlk
ZW50aWZpZXIpLiBBbHNvIHRoZSB2bSBhbmQgdm1hCnNpbmNlIHdlJ3JlIGNhbGN1bGF0aW5nIHRo
b3NlIHRvIGRvIHRoZSBwYWdlIHRhYmxlIHVwZGF0ZXMuCgpPbiB0aGUgU1ZNIHNpZGUsIHdlIGRv
bid0IHJlYWxseSBoYXZlIGFueSBvdGhlciB0cmFjZXMgaGFuZGxpbmcKY3JlYXRpb24gcmlnaHQg
bm93IHNvIHRoZSBvbmx5IHRoaW5nIHRvIG1lIHRoYXQgbWFrZXMgc2Vuc2UgdG8gYWRkIGhlcmUK
aXMgd2hldGhlciBvciBub3QgdGhpcyBwYXJ0aWN1bGFyIGZhdWx0IGhhcyB0aGF0IENQVSBtaXJy
b3IgYXNzb2NpYXRlZAooaS5lLiBpcyB0aGlzIGFuIFNWTSBmYXVsdCBvciBub3Q6IHhlX3ZtYV9p
c19jcHVfYWRkcl9taXJyb3IoKSkuCgpUaGFua3MsClN0dWFydAoKPiAKPiA+IAo+ID4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCApLAo+ID4g
PiArCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVFBfcHJpbnRr
KCJkZXY9JXMgYWRkcj0lbGx4IGZhdWx0X3R5cGU9JWQKPiA+ID4gYWNjZXNzX3R5cGU9JWQgZmF1
bHRfbGV2ZWw9JWQgZW5naW5lX2NsYXNzPSVkICVzCj4gPiA+IGVuZ2luZV9pbnN0YW5jZT0lZCIs
Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBfX2dldF9zdHIoZGV2KSwgX19lbnRyeS0+cGFnZV9hZGRyLAo+ID4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19lbnRy
eS0+ZmF1bHRfdHlwZSwgX19lbnRyeS0KPiA+ID4gPiBhY2Nlc3NfdHlwZSwKPiA+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fZW50
cnktPmZhdWx0X2xldmVsLCBfX2VudHJ5LQo+ID4gPiA+IGVuZ2luZV9jbGFzcywKPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHhl
X2h3X2VuZ2luZV9jbGFzc190b19zdHIoCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19lbnRyeS0+
ZW5naW5lX2NsYXNzKSwKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fZW50cnktPmVuZ2luZV9pbnN0YW5jZSkKPiA+ID4gKyk7
Cj4gPiA+ICsKPiA+ID4gK0RFRklORV9FVkVOVCh4ZV9wYWdlZmF1bHQsIHhlX2hhbmRsZV92bWFf
cGFnZWZhdWx0LAo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBUUF9QUk9UTyhzdHJ1Y3Qg
eGVfZGV2aWNlICp4ZSwgc3RydWN0IHBhZ2VmYXVsdAo+ID4gPiAqcGYpLAo+ID4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBUUF9BUkdTKHhlLCBwZikKPiA+ID4gKyk7Cj4gPiA+ICsKPiA+ID4g
K0RFRklORV9FVkVOVCh4ZV9wYWdlZmF1bHQsIHhlX2hhbmRsZV9zdm1fcGFnZWZhdWx0LAo+ID4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBUUF9QUk9UTyhzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwg
c3RydWN0IHBhZ2VmYXVsdAo+ID4gPiAqcGYpLAo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBUUF9BUkdTKHhlLCBwZikKPiA+IAo+ID4gWWVhaCBJIGp1c3QgZG9uJ3Qgc2VlIHdoeSB3ZSBu
ZWVkIGJvdGggb2YgdGhlc2UgZnJvbSB5b3VyIHBhdGNoLAo+ID4gb3RoZXIKPiA+IHRoYW4ganVz
dCB0byB0ZWxsIHdoZXRoZXIgdGhlIGNwdSBtaXJyb3Igc3VwcG9ydCBpcyBzZXQuCj4gCj4gWWVz
LCB3aWxsIGRvIGluIHYyLgo+IAo+IFRoYW5rcywKPiBGcmFuY29pcwo+IAo+ID4gCj4gPiBUaGFu
a3MsCj4gPiBTdHVhcnQKPiA+IAo+ID4gPiArKTsKPiA+ID4gKwo+ID4gPiDCoCNlbmRpZgo+ID4g
PiDCoAo+ID4gPiDCoC8qIFRoaXMgcGFydCBtdXN0IGJlIG91dHNpZGUgcHJvdGVjdGlvbiAqLwo+
ID4gCgo=
