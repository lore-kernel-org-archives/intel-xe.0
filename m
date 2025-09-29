Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB0BCAC5B5
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 15:34:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D9710E454;
	Mon, 29 Sep 2025 15:34:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="afLjp5Vw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5D810E454
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 15:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759160084; x=1790696084;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=sZZAa3eqsAkPL0nstYilIZXWFLrvmBSD5qLLTRPf0y8=;
 b=afLjp5VwwU8+NHynldEqxmiN18TveLUJlPmfMqOAisFRU1kr7JVyyWrm
 czD/6hRsmjwuGHGJeCOLdbEK1sjbyi3f5uniuwRosw3kuudA8y+0Pdz3v
 nsRtk32X66otDRuEyOj3RuMIu6OK7QgPo/bRMUUbLCZw5qKD4W6ROjO7k
 jgbAqJj7I6r4KXs2rcdJ/i1Tyzg3Sd4t9z5STGprEVP5cFaW8HftZayi+
 zGRLiCVBn9tIoKVnIoIv7VMCp6awNphVMMvaXyHL3RMfS4+Gg7Zb035/k
 7B7amwsCYPs6tw0rUNkD5Mykj0YG9HnPt8IQXYt5ijbeIURIDxj4yj+J0 w==;
X-CSE-ConnectionGUID: sBsT+Xp4SISq0naNgSCqAQ==
X-CSE-MsgGUID: hinM4FimRTC5acPWCCPKxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="78828174"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="78828174"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 08:34:44 -0700
X-CSE-ConnectionGUID: op8IlW3USyaUqnqXXoutwQ==
X-CSE-MsgGUID: q8+QhlE7SEmQMaLUQFx2wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="177514651"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 08:34:44 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 08:34:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 08:34:43 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 08:34:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nfAb4Go6zeNVd+JSg1s6uvrFZYbFKvc1lNwVrCW2MOY1a2zY8ga1pgch0OY/N7KJnsxHtMWeZS3vLp1baKijQmG2qMXD1Fgc+WvgRos2WqezpXc3FK2QmbAV2YHE0nL+9Lwx4GHD7gau0ZARE9AOfR2YzNYUoUMMR25og2htgLhr936sdhMb9Rr3XbG8mGQkUuuXG90+ceWQvkHLOLO3M5q9EnGaxjTw8LZHVDooUpJORbLlPHwOa67XNr4aZW7UGVo33ePjKprouWEb7AcLGzybsXE6U730k7I6KI+TTo5tIL9RwYFyR3vvAmyxCf63onT/Reag2wnpd033yKAp+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZZAa3eqsAkPL0nstYilIZXWFLrvmBSD5qLLTRPf0y8=;
 b=tttYyrDCasYVqRMm8EejVaoCzYlOlUSYZtXpvZuReJAqssVbVvnIR9pd6nKPI4QWPPwJCAsEigEApnbH1J+pB+NRADiIF/G6/T/4aU7iTyM9HieG7psImHONjdBblJm/fSyd0oa62cCEYUFr1a4DT+gXz8UfI+H0zibinTqIlhh0T82D1CAh2bcpJsmFKhPVSXy8/pibsoyw4ABqB1n8bbYfRBHDMvHPLPdQbrgH/Ug9R3pD5Is/V/NArvMopc40QjlTkZZG4CMFkqq2eepQhzoDqe1y0D5zIZKT+4miKthlhFSAt6HjCHBG6JpHCwWn79b5LZ33/h2Melq8PR5ccA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 IA0PR11MB7282.namprd11.prod.outlook.com (2603:10b6:208:43a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 15:34:40 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 15:34:40 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kumar
 G, Naresh" <naresh.kumar.g@intel.com>
CC: "Gupta, Varun" <varun.gupta@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe/: Mutual Exclusivity b/w Multi CCS Mode & SRIOV VF
 Provisioning
Thread-Topic: [PATCH] drm/xe/: Mutual Exclusivity b/w Multi CCS Mode & SRIOV
 VF Provisioning
Thread-Index: AQHcMRzW9MPbsw2Cx0iW6alKgna7JLSqSumA
Date: Mon, 29 Sep 2025 15:34:40 +0000
Message-ID: <461865ff2b223a053d602f2b04118c58625e8d6c.camel@intel.com>
References: <20250929083613.644931-2-naresh.kumar.g@intel.com>
In-Reply-To: <20250929083613.644931-2-naresh.kumar.g@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|IA0PR11MB7282:EE_
x-ms-office365-filtering-correlation-id: 1f9b71bd-3492-40a6-cef2-08ddff6db4d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?dHNmUmpkanpyZVRsamtOWDd3MG9sb3RPc1ZZaGNiNE9SZ1JNVk5qRWZPN1Yw?=
 =?utf-8?B?SFFrTXV0UlR4SkFwb3ZYSXYwaTRRcWZaeDgvVzJ6ZXF0Q1BYWCtYNGk1Y0hp?=
 =?utf-8?B?RTlkZjgvUnllN1NXTFVLWEFLL0FKa3BqV1gxcTV6blZwZms4UXJHd3dHTjJ3?=
 =?utf-8?B?aWlud044TzRORlhVNjlMSmphRnM1SzNWNVIrN2VxTGRaazRHY3d0bCtGMFc3?=
 =?utf-8?B?SUdJMlVZU2ZZVUdyUjlpT1BCbEpValFseGI5Wk96Ry9OVDZBb281SnN5RnBT?=
 =?utf-8?B?VnUvNDlvdDA3clpHbzJhNmw3a3lqUXRrU2VUdjc4cFlIeWt4VERiV3hyRWtH?=
 =?utf-8?B?cWVVUUpYRVl1dmF0ZGlkdUdlUVRkdDJMYmxxd2orYlNkUC84RmtWdSt4T29z?=
 =?utf-8?B?NDdhZ2Y3Z1YzZFNxMVZ2VGtBZHgzSW5sSGhrSkNQZWdYSkpUM0YwLy9iZjdD?=
 =?utf-8?B?ODd5Z2Zjc1BIdllrVU81azNKTndYYllreWdPalpYWnFlbTRJYnEwVDdzenJn?=
 =?utf-8?B?aUZoVkN2ZUIzK1hHdzRWT0IySzZHY005UEI3REFZSjhpMDRZaGtvN0FHclZQ?=
 =?utf-8?B?Q3NINEhIbGRtVUIyUTE2NnFRcytTNm1zbmhWUUUzaFZjT1FzMWdDZlBxZWZx?=
 =?utf-8?B?SGhDTmhCK3NXSDFQOWU0TzVDdVpsc20waFZIeWxxOURCT2swY1J6bnA4Tm9I?=
 =?utf-8?B?bmpqeVhXSWhPY1gwRWNMVVFiUG1FQUR0V0o2d012SE1GV0RicHVtZkFqVnE5?=
 =?utf-8?B?bXBqUGR4cjdTM3JwNEpUWkp5STZBSk9jV1VCa08rbWwwWUpFUzRCc0tSNnFl?=
 =?utf-8?B?SWpLTWlXMm1zRGJCUFQreWd2VjNuU1BCLzk3MzE2Wmc3UXlaZE9WdjVnNits?=
 =?utf-8?B?eFpGVDhFcXlmUktpL1l5WW9yU2FBakx3ckNTZXJKMjJLL3ZNUWJTSmo1Nm9v?=
 =?utf-8?B?am9jblNUeU80NG5Oa1pkZXVCaUQ0T1pHb1ZlSllmaTMvNkV5QXlSVWZIR0Rl?=
 =?utf-8?B?cUVhM2pWZzFkWCtwRkR4aXFkMjNQTEpGY0U5dGNxeHBJdnRNVWlmVmpROVNZ?=
 =?utf-8?B?QmIybDM1VUxGMEdkT2FoZUZnTGF5Rk14Q2tHcXhOeXR3Q3ptOE1oSzZVOVlR?=
 =?utf-8?B?a1BMdGhONnNQVkJpekpPTGFNeHF5Ui9YMzN4STY3dDBTS1lLVU1uUnY1QjdO?=
 =?utf-8?B?M01uTjFyNnRNK2s2NmR3SGtRQmh6WC9JSVFjcHExNkgxRTd3d1dkcGp1RkNU?=
 =?utf-8?B?em9peUJ2ZW1DN1pQMXBvQXd2S3NuQWVrYVJRZGNTWE53Z1VvUlRJS0hOc0tK?=
 =?utf-8?B?aW8wQXpHN3NwRFVIdjl1YzR6dGxON1ZubWJobTE2aGhqUS9IeWlLQVF0eFlj?=
 =?utf-8?B?Zmt0K3RLb3J2cEZVdWtCSVBNL0hQbXhiN3NLRkFIRGhGbnRCQVNlanVFYlF5?=
 =?utf-8?B?WEczY0RtME1pdy8wNjJXVm9kaW1sdEZEOXpSajhudFlnUGx5VGFTVVVQNm4r?=
 =?utf-8?B?cWNjcTIwa0NFR0JqZ1VscEk3L1F3R0VSb3FPazdNRmVPbHNETW04YVpZNjVM?=
 =?utf-8?B?Uko4YVk2eGk5WTB2THNZSTlrWXo0Rlcrc052Smh0QzFWbE1Dd3piNjlWTEQy?=
 =?utf-8?B?QTRnaHV0S1VSRGdDakV2WVVVNXBDMklOZGZpbVBlWDJQelNFQmJxRlMrdXE0?=
 =?utf-8?B?LzRiTVZtT1hCcVBmUkpTVkJuREt4YlZEQmU2OGR2ODdYSXNFeEc2SG9LZDR2?=
 =?utf-8?B?NXJVek0vRTNlOS9teFJGYy9vTlV2a1hVQVAxVGRoaHo0Um5kQ0E5aGFQZENS?=
 =?utf-8?B?bXFoR2pOSlVSK001Q3I3WGRWdlY2U3I0eVl5Rm5KRWJzd1JvWFFUNXpCeGRo?=
 =?utf-8?B?RFJOZ21YcjZEWjFoT0NnekNyWUxva3dKd3Z1TGUrQmhUb0JyWGw0U0ZJRHNC?=
 =?utf-8?B?RHM3YXhIVVo2bzhyUUFJZ1N3MjZXNEVDS2F4enVhbmRpU3pxamxqWkhBbGNC?=
 =?utf-8?B?MHBmbUdMMThOWTdEY21lMlF1aWFrLzRuQ3hGUG5VWGk2K0pVMU9QMkpkVVN3?=
 =?utf-8?Q?8XH0FI?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eXYxb3VkV1cyTXNOMFdTdm9MQm4xRGNhWmJ6Rm53dHd0RUpRSitwZy9JMWR5?=
 =?utf-8?B?NkgyNk14THZ3eUJzcTgvTmc5ZTVhbXQvYW5pNnlsZXRSTHZhbXA4c2xFYlZW?=
 =?utf-8?B?aitoV1MzNkpmdXFnTGhNaVpWRS8zR0YzeHBCNDJsbGhYajl1bFIzR3hpQ0pu?=
 =?utf-8?B?N1F2OE42YkV1bVZ3YmhTMEhXZTAra0NBVW9Na1poa3dNSjJ6QjlpVlY4NUFw?=
 =?utf-8?B?UHN1azEyOU1PdzVzaFJvUzBpYU1teDVCTjNlNmJjYWZrZXkxTEMvMDI1QzBW?=
 =?utf-8?B?cFZiaGhHaksxRkREb0cvbzJ1S0JsQ3N3LzVVWjNIY1FsMThVWFg2bG1qZEFC?=
 =?utf-8?B?ck5TU2tkQjh3WjVqWmJnbUp6alRkTkhsd01zbXdKZExDMEhFUXlmQ004UDhk?=
 =?utf-8?B?U2NLeW5Bcy9VTHFUa3RwRHNUaVNObXBVc3dnL21DTEpZWlQ2UW1tTVU4TDFp?=
 =?utf-8?B?eW1SMlVWTzJ3N0VDOXRYcm0weGZZb0JtOU5BQVJTMzJaSDNmeVpPcUc5TUE3?=
 =?utf-8?B?UERrWWJ0YTNEV0w0ZDNPMEd3NVZWNEZ3Vzdsdm5vRWRzNDN5VzFocjVRWWxt?=
 =?utf-8?B?ejFoRWN2MitvOUg4U2RXMG0xQW1NbUpSN3NpZjNYTVZmU2hKQ1dCUjVhNVlH?=
 =?utf-8?B?SG1lekVWQVh0NWZrb1hUS1V3OUdhamhvQlU4L0s0WHRyMGFvOE8vakhwOHlN?=
 =?utf-8?B?bTc0ZTNDbks3U1QzQnlEUmRucWt4WUt0eTNDdW16Z3NXSkpwSXlpb1Jnb3py?=
 =?utf-8?B?OEFXNmIzcUMrVkwrWWNUUzh0NTlwdlFaRk0wUzVUUGFYVFI0Y0w2TkttMGEx?=
 =?utf-8?B?RS9tbnk5b2FhdkRvR0hXWm9NMmx1REFxdldicFRnYkxTQXFTUE0ydHBKbUJ4?=
 =?utf-8?B?c0pkb3JJUlQ1RFBHb3h3aXBjZmcwcTVmdWpWNXpPTUF6M2ZZcWNwd2N4L3Jk?=
 =?utf-8?B?cUU0WjZEL1czamVPM005ekpiMGVmMno3VUNyWlVBamo0ZVVjdmFDbi9xNUtW?=
 =?utf-8?B?dzdTUTZwaUd3Q2gwTDM3MVRURDUvUDZNSXhvckNFMEg1ZlUxdkZCR3RDYURi?=
 =?utf-8?B?bGptRjlwWS9Zblk3aVUrVXZkNUZTRVdCVDFPM01zeUduUGZvY1hnQkdXNzhx?=
 =?utf-8?B?OFYrdmxPdHAxKzMrTllxVFBUM3JJZzNQWjBLVXBLVUU1TlcwaFY1V0o1WThn?=
 =?utf-8?B?WjJxbmpIeHI1RllidTdmditoNVBqZk0xamMveTNMZm9XVlBwN3RBcEZPV09a?=
 =?utf-8?B?YjVNY2xUSmlqWU85dmF1SnhZeEdGVG1hYjY4aFFvWFVzVWxyb1k5RkR1aWx6?=
 =?utf-8?B?YmZNQUZJbUlwZVpTYUUwV0ZJeGtVWVIyRnQ0NENiMzZObU9PblJHVzJqd1pY?=
 =?utf-8?B?YkExclFwdkx1VGFmSVdzNkJGTjAwb2J1MllaQll4T1V0eEpzNGtFYmI4QXl0?=
 =?utf-8?B?OVYxbzBtejdBZjZwSlVtWitVZTdXNEYyWHhsV24wcmVFSGVvWDBCcG4rNE9y?=
 =?utf-8?B?Z2pLRWY3dzd6cDRuRnd1YWFVbUJKeU0wVWFhRWZpZUIwVGI3ZHRndWhWeWU3?=
 =?utf-8?B?RWJRTFlkdll3RE9mSTJvRzNPWGp2N3JsY1lISU9ySnQvQlFReS9rcWtaOFhv?=
 =?utf-8?B?VHd0VGdlR3k2ZjFDbVZ5TmNsK0QzR0gyVURQK2R6ekFWNitQaFVSY3dRVndh?=
 =?utf-8?B?WXlRdUsyQi9ZTlNDWGRyeHowSkhaS2J5eFl0Y3FnM2JZcmZIdDQvN1B2SHlk?=
 =?utf-8?B?R3FUZ1h6MEJESytOQld1cTBRMnR0VHptb040cyttMS9IR2xwRHYyVm8zNXVy?=
 =?utf-8?B?bFFYRjJHV29tKzBCVE5JaERubTlKUFYveXh4ejU2MGpqMWNJa1pHVmMzNGJr?=
 =?utf-8?B?RHc2emxXNDI1b2xZbElLZnY2NDNhS2JDckh4RHUvNVdDMG9heU1xR3V3TUhx?=
 =?utf-8?B?Z2FMamZmMVAyNytpWlJqREt0eThQajZjOTM2cU80bW8zZkRYcVpSbFlxYkl4?=
 =?utf-8?B?YmNtVHA1SklENkdCdkN4MFlTbTlZRDNvY1Vkc1JsbmdGQjd4Z2JzREhnSWhw?=
 =?utf-8?B?V0tyNGJTb1dQSGdtS2J5djdWaFhubkJ2UjNMdndZUGEyREZQb2pqYWJBRFJw?=
 =?utf-8?B?S3FVeWY2dEQ5eDQ1c013TGg2K3cyWkZBVzZrSjAvbSt5NmY4YnI4bnBBcURt?=
 =?utf-8?B?RXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <503C0DB69754FE4F8CDE1DFE1EA81B8B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f9b71bd-3492-40a6-cef2-08ddff6db4d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2025 15:34:40.6380 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M37o2+fWYlIAKqe8FDBrWquu5EdfmcqQgI7nbul0+9v3KQ7QpToFaxMzZ+3x/8gi89MTaHvgG9U/YBC9Zdbp7JYYB5EvnAHsz+l3XvV2KyA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7282
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

T24gTW9uLCAyMDI1LTA5LTI5IGF0IDE0OjA2ICswNTMwLCBOYXJlc2hrdW1hciBHb2xsYWtvdGkg
d3JvdGU6DQo+IER1ZSB0byBTTEEgYWdyZWVtZW50IGJldHdlZW4gUEYgYW5kIFZGcywgbXVsdGkg
Q0NTIG1vZGUgY2FuJ3QNCj4gYmUgZW5hYmxlZCB3aGVuIFZGcyBhcmUgYWxyZWFkeSBlbmFibGVk
Lg0KPiBTaW1pbGFybHksIGVuYWJsaW5nIFZGcyBpcyBkaXNhYmxlZCB3aGVuIG11bHRpIGNjcyBt
b2RlIGVuYWJsZWQuDQoNCkkgaGF2ZSBhIHNpbWlsYXIgY29tbWVudCBpbmxpbmUgYmVsb3cgYXMg
d2VsbCwgYnV0IHdoaWxlIHlvdSdyZQ0KZGVzY3JpYmluZyB3aGF0IHlvdSdyZSBkb2luZyBoZXJl
LCBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IHdlIG5lZWQgdG8gZG8NCml0LiBUaGUgcHJldmlvdXMg
Y2hlY2sgc2hvdWxkIGhhdmUgY292ZXJlZCB0aGlzIHRvbyByaWdodD8NCg0KPiANCj4gdjI6ZnVu
Y3Rpb24geGVfZGV2aWNlX2lzX3ZmX2VuYWJsZWQgaGFzIGJlZW4gcmVmYWN0b3JlZCB0bw0KPiB4
ZV9zcmlvdl9wZl9oYXNfdmZzX2VuYWJsZWQgYW5kIG1vdmVkIHRvIHhlX3NyaW92X3BmX2hlbHBl
ci5oLg0KPiBUaGUgY29kZSBub3cgZGlzdGluY3RseSBjaGVja3MgZm9yIFNSLUlPViBWRiBtb2Rl
IGFuZA0KPiBTUi1JT1YgUEYgd2l0aCBWRnMgZW5hYmxlZC4NCj4gTG9nIG1lc3NhZ2VzIGhhdmUg
YmVlbiB1cGRhdGVkIHRvIGV4cGxpY2l0bHkgc3RhdGUgdGhlIGN1cnJlbnQgbW9kZS4NCj4gVGhl
IGZ1bmN0aW9uIHhlX211bHRpX2Njc19tb2RlX2VuYWJsZWQgaXMgbW92ZWQgdG8geGVfZGV2aWNl
LmgNCj4gDQo+IHYzOiBEZXNjcmliZWQgbWlzc2VkIGFyZyBkb2N1bWVudGF0aW9uIGZvcg0KPiB4
ZV9zcmlvdl9wZl9oYXNfdmZzX2VuYWJsZWQNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5hcmVzaGt1
bWFyIEdvbGxha290aSA8bmFyZXNoLmt1bWFyLmdAaW50ZWwuY29tPg0KPiAtLS0NCj4gwqBkcml2
ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmjCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgOCArKysr
KysrKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9jY3NfbW9kZS5jwqDCoMKgwqDCoCB8
IDE0ICsrKysrKysrKysrLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaV9zcmlvdi5j
wqDCoMKgwqDCoMKgwqAgfMKgIDYgKysrKysrDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Ny
aW92X3BmX2hlbHBlcnMuaCB8IDEzICsrKysrKysrKysrKysNCj4gwqA0IGZpbGVzIGNoYW5nZWQs
IDM4IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5oDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rl
dmljZS5oDQo+IGluZGV4IDMyY2M2MzIzYjdmNi4uOTg2ZjljYWJiODk3IDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2RldmljZS5oDQo+IEBAIC0xNzIsNiArMTcyLDE0IEBAIHN0YXRpYyBpbmxpbmUgYm9v
bCB4ZV9kZXZpY2VfaGFzX2xtdHQoc3RydWN0DQo+IHhlX2RldmljZSAqeGUpDQo+IMKgwqDCoMKg
wqDCoMKgwqByZXR1cm4gSVNfREdGWCh4ZSk7DQo+IMKgfQ0KPiDCoA0KPiArc3RhdGljIGlubGlu
ZSBib29sIHhlX211bHRpX2Njc19tb2RlX2VuYWJsZWQoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+
ICt7DQo+ICvCoMKgwqDCoMKgwqDCoC8qIE11bHRpIENDUyBtb2RlIHN1cHBvcnRlZCBleGNsdXNp
dmVseSBvbiBHVDAgKi8NCj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2d0ICpndCA9IHhlX2Rl
dmljZV9nZXRfZ3QoeGUsIDApOw0KPiArDQo+ICvCoMKgwqDCoMKgwqDCoHJldHVybiBndC0+Y2Nz
X21vZGUgPiAxOw0KPiArfQ0KPiArDQo+IMKgdTMyIHhlX2RldmljZV9jY3NfYnl0ZXMoc3RydWN0
IHhlX2RldmljZSAqeGUsIHU2NCBzaXplKTsNCj4gwqANCj4gwqB2b2lkIHhlX2RldmljZV9zbmFw
c2hvdF9wcmludChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0DQo+IGRybV9wcmludGVyICpw
KTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9jY3NfbW9kZS5jDQo+
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X2Njc19tb2RlLmMNCj4gaW5kZXggNTBmZmZjOWVi
ZjYyLi41ODRmMzI0NWZjN2QgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dF9jY3NfbW9kZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9jY3NfbW9kZS5j
DQo+IEBAIC0xMyw2ICsxMyw3IEBADQo+IMKgI2luY2x1ZGUgInhlX2d0X3N5c2ZzLmgiDQo+IMKg
I2luY2x1ZGUgInhlX21taW8uaCINCj4gwqAjaW5jbHVkZSAieGVfc3Jpb3YuaCINCj4gKyNpbmNs
dWRlICJ4ZV9zcmlvdl9wZl9oZWxwZXJzLmgiDQo+IMKgDQo+IMKgc3RhdGljIHZvaWQgX194ZV9n
dF9hcHBseV9jY3NfbW9kZShzdHJ1Y3QgeGVfZ3QgKmd0LCB1MzINCj4gbnVtX2VuZ2luZXMpDQo+
IMKgew0KPiBAQCAtMTE3LDkgKzExOCwxNiBAQCBjY3NfbW9kZV9zdG9yZShzdHJ1Y3QgZGV2aWNl
ICprZGV2LCBzdHJ1Y3QNCj4gZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwNCj4gwqDCoMKgwqDCoMKg
wqDCoHUzMiBudW1fZW5naW5lcywgbnVtX3NsaWNlczsNCj4gwqDCoMKgwqDCoMKgwqDCoGludCBy
ZXQ7DQo+IMKgDQo+IC3CoMKgwqDCoMKgwqDCoGlmIChJU19TUklPVih4ZSkpIHsNCj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2d0X2RiZyhndCwgIkNhbid0IGNoYW5nZSBjb21w
dXRlIG1vZGUgd2hlbiBydW5uaW5nDQo+IGFzICVzXG4iLA0KPiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgDQo+IHhlX3NyaW92X21vZGVfdG9fc3RyaW5n
KHhlX2RldmljZV9zcmlvdl9tb2RlKHhlKSkpOw0KPiArwqDCoMKgwqDCoMKgwqAvKg0KPiArwqDC
oMKgwqDCoMKgwqAgKiBDaGVjayBpZiB0aGUgZGV2aWNlIGlzOg0KPiArwqDCoMKgwqDCoMKgwqAg
KiAxLiBPcGVyYXRpbmcgYXMgYW4gU1ItSU9WIFZpcnR1YWwgRnVuY3Rpb24gKFZGKSwgb3INCj4g
K8KgwqDCoMKgwqDCoMKgICogMi4gQW4gU1ItSU9WIFBoeXNpY2FsIEZ1bmN0aW9uIChQRikgd2l0
aCBvbmUgb3IgbW9yZSBWRnMNCj4gZW5hYmxlZC4NCj4gK8KgwqDCoMKgwqDCoMKgICogRW5hYmxp
bmcgbXVsdGkgQ0NTIG1vZGUgaXMgbm90IHBlcm1pdHRlZCBpbiBlaXRoZXINCj4gc2NlbmFyaW8u
DQo+ICvCoMKgwqDCoMKgwqDCoCAqLw0KDQpJTU8gdGhpcyBjb21tZW50IGlzbid0IG5lZWRlZC4g
VGhlIHR3byBjb25kaXRpb25zIHlvdSBoYXZlIGJlbG93IGFyZQ0Kc2VsZi1leHBsYW5hdG9yeS4N
Cg0KPiArwqDCoMKgwqDCoMKgwqBpZiAoSVNfU1JJT1ZfVkYoeGUpIHx8IHhlX3NyaW92X3BmX2hh
c192ZnNfZW5hYmxlZCh4ZSkpIHsNCg0KQWxzbyBhcyBJIG1lbnRpb25lZCBlYXJsaWVyLCB3aHkg
ZG8gd2UgbmVlZCB0byBtYWtlIHRoaXMgY2hhbmdlIGhlcmU/DQpJcyB0aGVyZSBhIHJlcXVpcmVt
ZW50IHRvIGVuYWJsZSB0aGlzIGluIFNSSU9WX1BGIG1vZGU/IE15DQp1bmRlcnN0YW5kaW5nIGlz
IHdlIHdhbnRlZCB0byBleHBsaWNpdGx5IHN0aWNrIHRvIHRoZSBkZWZhdWx0IG1vZGUgKG9uZQ0K
Q0NTKSBpbiB0aGlzIGNhc2UuDQoNClRoYW5rcywNClN0dWFydA0KDQo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBjb25zdCBjaGFyICptb2RlX3N0ciA9DQo+ICFzdHJjbXAoeGVfc3Jp
b3ZfbW9kZV90b19zdHJpbmcoeGVfZGV2aWNlX3NyaW92X21vZGUoeGUpKSwNCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCJTUi1JT1YgVkYiKSA/ICJTUi1JT1YgVkYiIDoNCj4gIlNSLUlPViBQRiB3
aXRoIFZGcyBFbmFibGVkIjsNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2d0
X2RiZyhndCwgIkNhbid0IGNoYW5nZSBjb21wdXRlIG1vZGUgd2hlbiBydW5uaW5nDQo+IGFzICVz
XG4iLCBtb2RlX3N0cik7DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJu
IC1FT1BOT1RTVVBQOw0KPiDCoMKgwqDCoMKgwqDCoMKgfQ0KPiDCoA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaV9zcmlvdi5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3BjaV9zcmlvdi5jDQo+IGluZGV4IGFmMDVkYjA3MTYyZS4uNzFjMWQ5OThiYTgyIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpX3NyaW92LmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3BjaV9zcmlvdi5jDQo+IEBAIC0xNTUsNiArMTU1LDEyIEBAIHN0
YXRpYyBpbnQgcGZfZW5hYmxlX3ZmcyhzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwNCj4gaW50IG51bV92
ZnMpDQo+IMKgwqDCoMKgwqDCoMKgwqB4ZV9hc3NlcnQoeGUsIG51bV92ZnMgPD0gdG90YWxfdmZz
KTsNCj4gwqDCoMKgwqDCoMKgwqDCoHhlX3NyaW92X2RiZyh4ZSwgImVuYWJsaW5nICV1IFZGJXNc
biIsIG51bV92ZnMsDQo+IHN0cl9wbHVyYWwobnVtX3ZmcykpOw0KPiDCoA0KPiArwqDCoMKgwqDC
oMKgwqBpZiAoeGVfbXVsdGlfY2NzX21vZGVfZW5hYmxlZCh4ZSkpIHsNCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHhlX3NyaW92X2luZm8oeGUsICJEaXNhYmxlIG11bHRpLWNjcyBt
b2RlIGJlZm9yZQ0KPiBlbmFibGluZyBWRidzXG4iKTsNCj4gKw0KPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1FQ0FOQ0VMRUQ7DQo+ICvCoMKgwqDCoMKgwqDCoH0NCj4g
Kw0KPiDCoMKgwqDCoMKgwqDCoMKgZXJyID0geGVfc3Jpb3ZfcGZfd2FpdF9yZWFkeSh4ZSk7DQo+
IMKgwqDCoMKgwqDCoMKgwqBpZiAoZXJyKQ0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGdvdG8gb3V0Ow0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3NyaW92
X3BmX2hlbHBlcnMuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zcmlvdl9wZl9oZWxwZXJz
LmgNCj4gaW5kZXggZGQxZGY5NTBiMDIxLi5lMjY4MzcwOTEzNzUgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9zcmlvdl9wZl9oZWxwZXJzLmgNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3NyaW92X3BmX2hlbHBlcnMuaA0KPiBAQCAtNDMsNCArNDMsMTcgQEAgc3Rh
dGljIGlubGluZSBzdHJ1Y3QgbXV0ZXgNCj4gKnhlX3NyaW92X3BmX21hc3Rlcl9tdXRleChzdHJ1
Y3QgeGVfZGV2aWNlICp4ZSkNCj4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiAmeGUtPnNyaW92LnBm
Lm1hc3Rlcl9sb2NrOw0KPiDCoH0NCj4gwqANCj4gKy8qKg0KPiArICogeGVfc3Jpb3ZfcGZfaGFz
X3Zmc19lbmFibGVkKCkgLSBEZXRlcm1pbmVzIGlmIHRoZSBQRiBoYXMgYW55IFZGcw0KPiBlbmFi
bGVkDQo+ICsgKiBAeGU6IHB0ciB0byB4ZV9kZXZpY2UNCj4gKyAqDQo+ICsgKiBSZXR1cm46IHRy
dWUgaWYgb25lIG9yIG1vcmUgVkZzIGFyZSBlbmFibGVkIG9uIHRoZSBQRiwgZmFsc2UNCj4gb3Ro
ZXJ3aXNlLg0KPiArICovDQo+ICtzdGF0aWMgaW5saW5lIGJvb2wgeGVfc3Jpb3ZfcGZfaGFzX3Zm
c19lbmFibGVkKGNvbnN0IHN0cnVjdA0KPiB4ZV9kZXZpY2UgKnhlKQ0KPiArew0KPiArwqDCoMKg
wqDCoMKgwqBzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IHRvX3BjaV9kZXYoeGUtPmRybS5kZXYpOw0K
PiArDQo+ICvCoMKgwqDCoMKgwqDCoHJldHVybiBwY2lfbnVtX3ZmKHBkZXYpID4gMDsNCj4gK30N
Cj4gKw0KPiDCoCNlbmRpZg0KDQo=
