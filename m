Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B50CCFA13
	for <intel-xe@archiver.kernel.org>; Thu,  6 Nov 2025 20:26:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB3DF10E9C7;
	Thu,  6 Nov 2025 20:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lKMSMRCQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1CA10E9C7
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Nov 2025 20:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762460763; x=1793996763;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=TE0IMzMGF/EpYn7U1y2Y7XXMm0+a5HvBvr90M9mhmQI=;
 b=lKMSMRCQmPUsgR9Zas0nCMBb8g8OUDUOIpF/1Fb5ZenPK9ejgVPW69af
 bkME73VIvOeudgkqPSBnygxpFQdMs8l72FlT9m35THJ8e0/9lg7vre778
 8isoOAPJrAyY0jpHptx6Ez0kXjEutCtfS+o86bYA4jR8NsBNt/V7ehkva
 55Qt/wTuZRtzqS/JVsdq/mwId7UhTP4RWiaK9T7A0RuyxyUyyVUsgFybi
 cliJ1mVY05GPn5Uuc+A5iQpjpOOgFLIiRU5LcsrOTv89dXQjqhyCO2GPT
 VG39v8CSEK7tdHA+0rVFE1pDPn1lO5QQ7D+KDTwWK+yxuXTIUp0Z1z1o5 A==;
X-CSE-ConnectionGUID: CdiSy05hS7GuC8EkRK0hLg==
X-CSE-MsgGUID: Dq57tX8SSrmBT7omq36uAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64539139"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64539139"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 12:26:03 -0800
X-CSE-ConnectionGUID: duOryPaGQnSRJ4MtpgQTYw==
X-CSE-MsgGUID: JKpYao3nSUGrNMMS8JxSiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="187151201"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 12:26:03 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 12:26:02 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 12:26:02 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.27)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 12:26:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=an1e0ZTDCyETGwBbkOwy/J6xg79ma7WwVzYicA/IxlEaZRpviMrhzGANXM8vtIXFwT73Fklvbk596yV1ZJKXm/3a8NAEC3yU/OO2RNrZAuWMr5C7l5P3B2TtcP7x0nJl9435ZyJlAadU/HZolySS2qVezdYfZFdNaV5z4UCKltctvZSgRCxypmcG3LTpE04CLIYDYsk7/9zyorCFv0e+85sK6PD9nVvAiUF2F5vaRppoOotDdAgb4aEE9g6u/8etJfDlf165LBAdC5bqkgVicMZwiQeyTzSqA253NOWqdTE+Avxi3Pyqh2m+u5BP2om5Lc7UdVo1O4F/w755WZNHDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TE0IMzMGF/EpYn7U1y2Y7XXMm0+a5HvBvr90M9mhmQI=;
 b=nX5v4hwxxow9y8aZUoWcpFekX+zuzhXQjHfWxJiHZvtfwu0bbHrfr2tcYACUlHt3ATD3yTVUbagpPYpXHx2lcSyuDfaCcVf3yEYH/8WMLu6GtlFTbQtOz/jlM4P/LfojaPiWL2m5jaC2UOy/GlBURp9vtG0i/66pdT0P+483oWJLHaCMOZCFwVFbeRFu7rKIrOZFwGpm5XBf0S/pbqO4A2uY7e8BznSqUeTgvlcy7Ny3cSWkANsbmWi8v2+8ngYWyLTeD7lhCvleoO+UqH9nNcUnbEG5UqBOJ5x76aD1I94i4bW3d3NSb75bv0sxwwa+TP2nax1NO6oaNl83N8XIbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 IA3PR11MB8940.namprd11.prod.outlook.com (2603:10b6:208:57e::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.7; Thu, 6 Nov 2025 20:25:59 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 20:25:59 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 08/12] drm/xe: Add send_tlb_inval_ppgtt helper
Thread-Topic: [PATCH v2 08/12] drm/xe: Add send_tlb_inval_ppgtt helper
Thread-Index: AQHcTcUh/pVycav5WE+tI3ksGi4YKLTmG5OA
Date: Thu, 6 Nov 2025 20:25:59 +0000
Message-ID: <f0e8ad79ec0fa4440edd367a6cc465fdf3fb09e2.camel@intel.com>
References: <20251104195616.3339137-1-matthew.brost@intel.com>
 <20251104195616.3339137-9-matthew.brost@intel.com>
In-Reply-To: <20251104195616.3339137-9-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|IA3PR11MB8940:EE_
x-ms-office365-filtering-correlation-id: 86f5c881-0c4e-44c3-ba6e-08de1d72b288
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?WGNRbU9tTThmN2ZyNTBCOWt2cFhtRXhNejNVbUlXOUkweGdjUVFOTU5pQmsy?=
 =?utf-8?B?dENuYnNsZGx5OHBxZ3N6RlFsUUw5cm1DWWtJSGxLZk42bDNsZG1CeldpR0U4?=
 =?utf-8?B?Y09FelBYUTVpVnpMVzQ4U2ZhUktRUWRjcjhxSzV6N00vNjFEUUdqWk5PVU5l?=
 =?utf-8?B?K3BuSjdqVVp0aHhtRkZrbUwzODZkeFp4UjNaTm1UUXVzWTlWQTJVdlFQdWZu?=
 =?utf-8?B?MXFXNHVqVGVyNTlMVzZLY2syZFdPZUdNcW4rblZ5OXUrS3R1TWJaa3ZQVXFv?=
 =?utf-8?B?eWFxbGxGSWRmb1EzRTBMc2dqc1E1RTEzemFmNEtueFpUbzl2akhIcW1RNXVC?=
 =?utf-8?B?OTI0REk5bVAvbEkzVWpORXVvS0VYMnhSY3RVc1FKNVloWFlnQllWd0hmc1RM?=
 =?utf-8?B?S2Z6NjI2bzBRNXNvamM5UERTb2lyaWkvNWIvTi9MdTIrVEc4TEFOdE9qNmxS?=
 =?utf-8?B?YU55d0lINGw4bmpqcVBYTGwyaFR0US9tcWVYOUo1MjFUYTJJRXplUEVqcUlu?=
 =?utf-8?B?QktUWWRabFhjUlV1bVlZSWxQTkVQemtjSmZKaFlWejhMZ1FselFOVnc3UnJp?=
 =?utf-8?B?L3l5Z1hYQ0I4OHlSbU8xVXZ4cTdjUjFOMThYNVZSbDE5ZTNoQkhHeGxnWWZO?=
 =?utf-8?B?Z1pscWxhZ0dsRDFqQVBaNnJCWWtCYmo4S1Y2MW5PZUlwWWF5STBPUHlPVjRY?=
 =?utf-8?B?UnliZHorc01ibVByQXVOSm8yRjVPalB5UW1iZGp6eFYreGM0b2JqWEhsbzJn?=
 =?utf-8?B?ZVF6TWJ4WnZBSHo5Y0xmZldvSGxra3NyV3dGMU1vWURmZGdZSGF4T1dLT1lC?=
 =?utf-8?B?a0piWmNtMlpYTEVCV2UreFdFZ0ltYjhuMFE4eFpZV2c4MHNiZXNLMldWK1Fv?=
 =?utf-8?B?T0xPTmE5V3lZQThjZ0R6ZFZBeVJPNjAvcWtyU3U2UzRmM2p0R1RtY3gvYkdC?=
 =?utf-8?B?cDJieUJSdjVUNjU0V3dPbHlxeFlKUzBuNEhhM2s2MkFkUGhGNE5mQmNnUkJw?=
 =?utf-8?B?dkxES2txZ01qdlNEdUxKQTJQc1AvcDZpZlN0Y0gwM0xLNFY0MDdUUU5DRWhS?=
 =?utf-8?B?Zzl2NklmZ2dkNVovR2tHOStRbFE0djlHNktaRnJIajVVRlAyZU11OEJNWnh6?=
 =?utf-8?B?VGJ5Q2duQy9KK0E0djRaYi9meXVoQ29vMk9Mam80My9nK216TXhOa2RubUpq?=
 =?utf-8?B?YVFYbFFaU2VlbS9tVjhTcGgxME9PME05MWlIRUtERkpaTXRGblJNa1VZMm5o?=
 =?utf-8?B?VVBQdXRYcTJEZmpYVkY4aDlyNUhXM09BQVRMN2RQOE1oTEFwZkpiR2ZZYURG?=
 =?utf-8?B?azc1Z2xLQjhneThKRE50c1c0N0RUUDlLUzIyaG1OVThEUnZGeTFCNTBOMG82?=
 =?utf-8?B?YVNjZXlyOGw0ZjNXcXZzd3FiSVJsKzFZSEZTc0RHY3dKTktWdmxrNnA0UGNi?=
 =?utf-8?B?WHRMdWM0bUJzM00zZkxNUVM3L25jcFRDa3UzelNjN1R6UlVTRWFHaENEbDd6?=
 =?utf-8?B?QnVrMWt5VjRnaTM2cXpDMnVzWTZncm5LTjE3MmZwR0psUEVGSEd2R3B5c3Iv?=
 =?utf-8?B?TSt6Y0VkeEIrazJBV2psbTRxcnkwVzM2QmhEMWFpY2Vkd3p5bDdWNEMxbjJZ?=
 =?utf-8?B?ZkdZU05rdDNaZDhhUmhoM3FnUTdGdEptbUlCV2RPTzY0YVlQcWp3bVE5UExr?=
 =?utf-8?B?SFFPOEZVdFZvenI0Q21OczJCeWpaejBoREFGeithZGRrSlVnUDQ3R1VVWEoz?=
 =?utf-8?B?ZG5FalRnQUozRkR1QVl6TGZFVmgzMDMyK1BVcCtPcXlWWnZPOGY0aVhxSHNT?=
 =?utf-8?B?RGRPbGhsYTBwQXpabmNPNGVKclBYRWVhZnpzWVBVaVZTbTBHZnp3RCtqSnBp?=
 =?utf-8?B?clR1bWJ6N3hubHgvZ0pQc1k1KzdjTU9pNFVpdk4zUGVWOTJIYmlQaTdOUFFi?=
 =?utf-8?B?LzhWSi9ZdWY0SzViSWx5a0U2QnZ4ekRMdTB1SFY0UjV5eHRaaE1wNnA5SXZR?=
 =?utf-8?B?cVBvTjBFSTZTaCtSenNGMlNYRlRwZlh1SWlDL2Q1TnRIY1NEaURERWYwYndw?=
 =?utf-8?Q?6hjs6p?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SHIwT1djRDBaaUoxN1ZqY3FBZXdsNjZkeUFvYTZDN3B1ZTMrejRDZm1wN2Ra?=
 =?utf-8?B?OFFGY1p6SGlJZE95OXpWZ1A5K2Q2OUNZcVZnQ1lzckVWdjdUUXFkb2ZrSjZ3?=
 =?utf-8?B?ZHhpTTIwbWF3ZzFIdWVKczRvM3A1REs4TjVvdUFpMnl0UkZqZE9TTk5SUjZF?=
 =?utf-8?B?YXhONUhWWU9nT1FPamtKZFUrRHp2R2IvNm5VcVc5N3VKQm5HTkpUODBsdS81?=
 =?utf-8?B?UWdVVk9NYThBYVR4cFZibEk4K3NBeHNXTk9Xc0MwSFozZEtnUVlrNlN4Uzdi?=
 =?utf-8?B?ak51K0VHcTNjVEZsZHJ6ajB5dE5NWjhnZmhUK25obWV0akZNek5PTXVtMkhW?=
 =?utf-8?B?TE5MR2RTSGZsSTVyekhNY25HTlhmbUVLUWk4eVVKVGFxUU5CKzNQbkJWT1ln?=
 =?utf-8?B?eUhSMjBxdDRKMmZUNWI3UVpCNTlnUG5zYUlhU0xYN3lWOVpaL0VJWllmNVBR?=
 =?utf-8?B?bXVLdndoYVVVSi9VaGlBRCtkS1AvNE5XOTdlejFBWmJabVZ6R2YyQTBIUUNJ?=
 =?utf-8?B?UnJtL3VTMElGTEhpTHFkWFVQOFgvbW9LUmpEVEhSQjMwR1NVUXk3Skc3a0Jt?=
 =?utf-8?B?S28wYm9tZDNoVzR3WHViQm0zZmRKbWlXMC8wYmRnUkdLZWVDL05Xdkw4RWF5?=
 =?utf-8?B?dm96RUVtV3NCS2ZFYWRxZmNGcEJuelU5cXNyRHlWa1ZGUXpWb2w3RkgxTDkr?=
 =?utf-8?B?SlI4R29RSUd1cm02dnc4OHFGb3JHbXRsdXhOaFhKcGN1T3hMVTR3WUVCRkJE?=
 =?utf-8?B?SHpGZVRldnk5Y1NrT3JDTnNwekM5M0J3SnpaYnQ1R1RJTFhpeEZ6TEt3Vk93?=
 =?utf-8?B?NS8rY1JucFkwREQxQ1lXcm1wU3FreE1WRzRZNkxhTnJpUGVLRzNrVmF2bFho?=
 =?utf-8?B?Nk9IMVVialFnaGdndUxkbDJBT25ESnpkYnFwbjZkY2txL0t1UUdhNTBwVFdE?=
 =?utf-8?B?ckpocHBHcWNPaExKUk1FcURrRVRPMzMwdGNCU0hrcVRrRmM1M1dCRW0xU1Zz?=
 =?utf-8?B?U3JuaCtPU3A4cjhYckEvQUNRU3VwQjN6a0ZCNXBCaWJTYjdZSXdtWGJCSVNX?=
 =?utf-8?B?aWF5c2JNZEkvK2t0VENPZTZvakV5LzZuUHYxanZxTEd2ZkYzdXllZUVZWlU2?=
 =?utf-8?B?Y1VEM2I2akpucG9CVEdETmRSSjNWSUQ2VVdUbmZXUlZCcytnaWIwTUFQRU0x?=
 =?utf-8?B?SG1jczlLajhOaHEwcjMwS0pOeW5PN3llU09CM3haSm5vTm5UMFhzZVNCU1o3?=
 =?utf-8?B?SDRGdkNtQWY4RHFybkNIc3c2eGZINXBNdlN1NUVBTHdjbmlJYURwRk05Nm05?=
 =?utf-8?B?dE5xTW9nbngza0w1TmN5VVhoZ2w4QVo1QlpwbXFZMGNJYnExbitaSUV4Vmtx?=
 =?utf-8?B?Vm5hZFlWbzB4a1h3ZnE4d3pUcDNLSDh5K0NIc1RiTmt3SXNtY1NJNHNZcE05?=
 =?utf-8?B?dDluY1RwL1FLMU5jNkVTWDBxWXQ3MmdkSzFUUTJocWllRzk0VjRwTWgwWHgx?=
 =?utf-8?B?elpkNFdWbkZhVWhVcFNCOCszVGhROVFuK1BBVUVkQkxnQmpkUERSc2JQcStY?=
 =?utf-8?B?WUVCUjl1NWsxemtzbGtYcjFBOHFTckRDV2NxaFNwaDBUcnBZSVJwN004cHJ1?=
 =?utf-8?B?RVpNcHNNcVJMeEhseHFPR3FzRDRLRExYR2xiV08xd2NMV28wQ0MrY2FUWlpX?=
 =?utf-8?B?Q1NBV3J3QTh5YVowSk9mVVN6Uzl6NFpRQTZrRC9QNG1aTGVLNXVmWVZWRGV2?=
 =?utf-8?B?R1hKbmtjTWtMbXltV0hBNXBTTU5pMHMxOGFIcUllaGFZVjdReGZCWDhjbm5a?=
 =?utf-8?B?YzdFWExqaTNMTE8xWFY5TU9GTFRhYlN4VVZlRWhmejNQdURqUXN0RS9weEQ2?=
 =?utf-8?B?aUl3MDYyM0lxd2ZlbE16TFhUR3dFdnRZVE5heXVzTUZIem11V1lnYytSQklC?=
 =?utf-8?B?TStzaGp1TlpjUzBvQ2N6UzVrOWNSN3NzZXV3QnlxSTZSc0NNYkZRRllTUzNX?=
 =?utf-8?B?K1RDVVVxWXFKdXliUFgyVGphZXh6MU5aSjJ3dXZLblF4b09pUzFaUHJFdjBC?=
 =?utf-8?B?U3hRd1d2RDk3Si85NEYxT2J0WjVDSDJkbHFqekRQSUkwVVliNFB5NkppbHQv?=
 =?utf-8?B?eFNxU3FGc250Wm1KajFJWjM3L3N3b3poZGJ6aHo3Rm1naHdaVUxlTE9ENnQy?=
 =?utf-8?B?MUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1F44D947E8EA534FABCFC3816C26BED5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86f5c881-0c4e-44c3-ba6e-08de1d72b288
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 20:25:59.1924 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KK6EYA39BlqPpWskUOfxPXc58c+exf8zcqA9itjy2okzIc48CWAdGOoqXVEt6QAD0VklKSjeOSwluAhL0Wg2Vs7Qknn4OpNo7AcwaAXmaQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8940
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

T24gVHVlLCAyMDI1LTExLTA0IGF0IDExOjU2IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IEV4dHJhY3QgdGhlIGNvbW1vbiBjb2RlIHRoYXQgaXNzdWVzIGEgVExCIGludmFsaWRhdGlvbiBI
MkcgZm9yIFBQR1RUcwo+IGludG8gYSBoZWxwZXIgZnVuY3Rpb24uIFRoaXMgaGVscGVyIGNhbiBi
ZSByZXVzZWQgZm9yIGJvdGggQVNJRC1iYXNlZAo+IGFuZCBjb250ZXh0LWJhc2VkIFRMQiBpbnZh
bGlkYXRpb25zLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJv
c3RAaW50ZWwuY29tPgoKUmV2aWV3ZWQtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVy
c0BpbnRlbC5jb20+Cgo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y190bGJfaW52
YWwuYyB8IDI3ICsrKysrKysrKysrKysrKysrKystLS0tLS0KPiAtLQo+IMKgMSBmaWxlIGNoYW5n
ZWQsIDE5IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfdGxiX2ludmFsLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndWNfdGxiX2ludmFsLmMKPiBpbmRleCA0MmU5ZmJkMDYyYmEuLjY5NzhlZThlZGYyZSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3RsYl9pbnZhbC5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y190bGJfaW52YWwuYwo+IEBAIC0xMzEsMTkgKzEz
MSwxNSBAQCBzdGF0aWMgdTY0IG5vcm1hbGl6ZV9pbnZhbGlkYXRpb25fcmFuZ2Uoc3RydWN0Cj4g
eGVfZ3QgKmd0LCB1NjQgKnN0YXJ0LCB1NjQgKmVuZCkKPiDCoCAqLwo+IMKgI2RlZmluZSBNQVhf
UkFOR0VfVExCX0lOVkFMSURBVElPTl9MRU5HVEgKPiAocm91bmRkb3duX3Bvd19vZl90d28oVUxP
TkdfTUFYKSkKPiDCoAo+IC1zdGF0aWMgaW50IHNlbmRfdGxiX2ludmFsX2FzaWRfcHBndHQoc3Ry
dWN0IHhlX3RsYl9pbnZhbCAqdGxiX2ludmFsLAo+IHUzMiBzZXFubywKPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB1NjQgc3RhcnQsIHU2NCBlbmQsIHUzMiBhc2lkKQo+ICtzdGF0aWMgaW50IHNlbmRfdGxiX2lu
dmFsX3BwZ3R0KHN0cnVjdCB4ZV9ndWMgKmd1YywgdTMyIHNlcW5vLCB1NjQKPiBzdGFydCwKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqB1NjQgZW5kLCB1MzIgaWQsIHUzMiB0eXBlKQo+IMKgewo+IMKgI2RlZmluZSBNQVhfVExC
X0lOVkFMSURBVElPTl9MRU7CoMKgwqDCoMKgwqDCoDcKPiAtwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qg
eGVfZ3VjICpndWMgPSB0bGJfaW52YWwtPnByaXZhdGU7Cj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVj
dCB4ZV9ndCAqZ3QgPSBndWNfdG9fZ3QoZ3VjKTsKPiDCoMKgwqDCoMKgwqDCoMKgdTMyIGFjdGlv
bltNQVhfVExCX0lOVkFMSURBVElPTl9MRU5dOwo+IMKgwqDCoMKgwqDCoMKgwqB1NjQgbGVuZ3Ro
ID0gZW5kIC0gc3RhcnQ7Cj4gwqDCoMKgwqDCoMKgwqDCoGludCBsZW4gPSAwOwo+IMKgCj4gLcKg
wqDCoMKgwqDCoMKgaWYgKGd1Y190b194ZShndWMpLT5pbmZvLmZvcmNlX2V4ZWNsaXN0KQo+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gLUVDQU5DRUxFRDsKPiAtCj4gwqDC
oMKgwqDCoMKgwqDCoGFjdGlvbltsZW4rK10gPSBYRV9HVUNfQUNUSU9OX1RMQl9JTlZBTElEQVRJ
T047Cj4gwqDCoMKgwqDCoMKgwqDCoGFjdGlvbltsZW4rK10gPSBzZXFubzsKPiDCoMKgwqDCoMKg
wqDCoMKgaWYgKCFndF90b194ZShndCktPmluZm8uaGFzX3JhbmdlX3RsYl9pbnZhbCB8fAo+IEBA
IC0xNTMsMTggKzE0OSwzMyBAQCBzdGF0aWMgaW50IHNlbmRfdGxiX2ludmFsX2FzaWRfcHBndHQo
c3RydWN0Cj4geGVfdGxiX2ludmFsICp0bGJfaW52YWwsIHUzMiBzZXFubywKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHU2NCBub3JtYWxpemVfbGVuID0gbm9ybWFsaXplX2ludmFs
aWRhdGlvbl9yYW5nZShndCwKPiAmc3RhcnQsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiAmZW5kKTsKPiDC
oAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBhY3Rpb25bbGVuKytdID0KPiBNQUtF
X0lOVkFMX09QKFhFX0dVQ19UTEJfSU5WQUxfUEFHRV9TRUxFQ1RJVkUpOwo+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBhY3Rpb25bbGVuKytdID0gYXNpZDsKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgYWN0aW9uW2xlbisrXSA9IE1BS0VfSU5WQUxfT1AodHlwZSk7Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGFjdGlvbltsZW4rK10gPSBpZDsKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGFjdGlvbltsZW4rK10gPSBsb3dlcl8zMl9iaXRz
KHN0YXJ0KTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGFjdGlvbltsZW4rK10g
PSB1cHBlcl8zMl9iaXRzKHN0YXJ0KTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGFjdGlvbltsZW4rK10gPSBpbG9nMihub3JtYWxpemVfbGVuKSAtIGlsb2cyKFNaXzRLKTsKPiDC
oMKgwqDCoMKgwqDCoMKgfQo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoHhlX2d0X2Fzc2VydChndCwg
bGVuIDw9IE1BWF9UTEJfSU5WQUxJREFUSU9OX0xFTik7Cj4gKyN1bmRlZiBNQVhfVExCX0lOVkFM
SURBVElPTl9MRU4KPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gc2VuZF90bGJfaW52YWwo
Z3VjLCBhY3Rpb24sIGxlbik7Cj4gwqB9Cj4gwqAKPiArc3RhdGljIGludCBzZW5kX3RsYl9pbnZh
bF9hc2lkX3BwZ3R0KHN0cnVjdCB4ZV90bGJfaW52YWwgKnRsYl9pbnZhbCwKPiB1MzIgc2Vxbm8s
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgdTY0IHN0YXJ0LCB1NjQgZW5kLCB1MzIgYXNpZCkKPiArewo+ICvC
oMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9ndWMgKmd1YyA9IHRsYl9pbnZhbC0+cHJpdmF0ZTsKPiAr
Cj4gK8KgwqDCoMKgwqDCoMKgbG9ja2RlcF9hc3NlcnRfaGVsZCgmdGxiX2ludmFsLT5zZXFub19s
b2NrKTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgaWYgKGd1Y190b194ZShndWMpLT5pbmZvLmZvcmNl
X2V4ZWNsaXN0KQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gLUVDQU5D
RUxFRDsKPiArCj4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIHNlbmRfdGxiX2ludmFsX3BwZ3R0KGd1
Yywgc2Vxbm8sIHN0YXJ0LCBlbmQsIGFzaWQsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFhFX0dVQ19UTEJfSU5W
QUxfUEFHRV9TRUxFQ1RJVkUpOwo+ICt9Cj4gKwo+IMKgc3RhdGljIGJvb2wgdGxiX2ludmFsX2lu
aXRpYWxpemVkKHN0cnVjdCB4ZV90bGJfaW52YWwgKnRsYl9pbnZhbCkKPiDCoHsKPiDCoMKgwqDC
oMKgwqDCoMKgc3RydWN0IHhlX2d1YyAqZ3VjID0gdGxiX2ludmFsLT5wcml2YXRlOwoK
