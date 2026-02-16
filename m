Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CEBEF5872
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 17:40:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E7710E3DC;
	Mon, 16 Feb 2026 17:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ku8QWgCk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F37410E3DC
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Feb 2026 17:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771263633; x=1802799633;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kgjgui3L73nGxFpN1x1MtHy9lfuBEZge3JpNXGYYo10=;
 b=ku8QWgCkCrVMTFnlQCPOhJIYQR8yF1D2WmASOLxJGolTYtkDU/OGGpXf
 +lqhK7YvZv16Khxtq1RoQC5jAHQTJ+KW/wpoxKXdwUei4srgpCzE85GTQ
 0f04f3+OHaXL5huCm2/XEqBFG70IjInGeSxzSDqrr7Orl59Qh4sU0XHFP
 6wMH5EJLD/oeqHwV6WCPDZkfsGVqTAfchqAhbQuQ4AWCXU0eoRyU+NHML
 JO7Fdo19SQkXo8llYLfQ6AbbIcGhwgW6IjxJwB1qc7saVoQaaMe3vs+A3
 z4wB935Y5e/rqHr/C2ohBLWR3P/0c/8WnZL9VWsHMJW2NK8l8aJVp+34q w==;
X-CSE-ConnectionGUID: dqAtkvm/R86P/ee8Dy2tDg==
X-CSE-MsgGUID: llpXwlzVTsGzRFig+vy5XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="89929749"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="89929749"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 09:40:33 -0800
X-CSE-ConnectionGUID: s86rVwQ+Saq2h4GkORAVfA==
X-CSE-MsgGUID: I63LRjBVTaKgWl7by0hbjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="217813779"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 09:40:29 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 09:40:29 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 16 Feb 2026 09:40:29 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.7) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 09:40:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RqYH5Pr4aKs5v0qxr3iaxfrAudJuzeI2Ls/MV5kqpmM3PBCyAO6oxH641sxRpls1VT8FMVHRIDRM3OlrRkSK2Nc1nBt5xIhiaBMX4sogF8b1AfsPw3rgTMSjGahLb8JA5GyUrgot4wWDX0gTgl08pHCtKIrldfIFZVsP8bhpYXrj9NvYjUCsuEyAyk/fsnUULy0FEVeXVTQpdkqHc0ZFyUrCq5FYQ00pjO5x+4M4dkUlTFm5Vyjq03kWuLqGRAuE+qn7D707cPwcs9ztZVRaf7W4eG03jG4OxQl/z4ijy7+GWfow0YFXl6oTYZn+T34J9VcyGsZqna1+Y4oAtVc5eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ED6T9MMpSVxyspOYLBDmYFfTeqpzuszAcpjf4uY4xto=;
 b=hEHEyp1r3vR7cVE7zFKSHy2qIhvPbruhXHU1TYO8McUgYomD0jtUqIiHH5l2UeyZS6B3590gqu4lYEh6sUsveehiO6y05yPhZuU1PAltEOYW0mMry7UUj/4310yYJy8qX+v8AgGATNNVxa+/xTo1v8DwUN9LJFOdWrWx36brtjRMT+pTPGEkMTcTdpq1YZdeAzFBmGXEBDq3EjuTbcOTIajpN8J28UNpQMcSKT89myUGScnfk8iWAsFFITtNj5mQx0CsF+6OqdFU95exhTx5hswGQYSuZk6x0tAbUcptWAaVTRwlLN+J/H7W+rqRumTAkoL2xLuYH2j2Vis51AmxbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB5312.namprd11.prod.outlook.com (2603:10b6:5:393::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 17:40:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 17:40:22 +0000
Date: Mon, 16 Feb 2026 09:40:19 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <daniele.ceraolospurio@intel.com>,
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Remove H2G reads in CT send path in
 non-debug builds
Message-ID: <aZNWg8PTJ7vYl6oK@lstrano-desk.jf.intel.com>
References: <20260213211625.3117729-1-matthew.brost@intel.com>
 <20260213211625.3117729-3-matthew.brost@intel.com>
 <aZMS7Qg5AvFRE_Zb@fdugast-desk>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZMS7Qg5AvFRE_Zb@fdugast-desk>
X-ClientProxiedBy: MW4P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB5312:EE_
X-MS-Office365-Filtering-Correlation-Id: 84e9cc9d-3934-4eb8-e658-08de6d8275b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWZMRTFTV09BUCs4NmpLbDZTVWFNQjFvRFBDSElqNVNhK1d5cUx4V1BvYVNY?=
 =?utf-8?B?dEpaaFdnRmllblZqckw4S01SSE1DeVpQUXh2S2t5UkpXNlU0b0FwSi8wMkJk?=
 =?utf-8?B?NExzSFhMdHJHYjdWd2x0eUJzMThicUt1ZytqRTJ2YjJUZmhrYno4MkxxL3I3?=
 =?utf-8?B?bXVkZVc1WU5ZWWFGY3EvR25BVkV0RFlvVmVmRjZzWWhRSFFDQlY4Vm1Nb0Fn?=
 =?utf-8?B?Y3o0dzNubXdTWnhINUF2ZXZ5U0srbXZLSnpvTkZFN05KREZDWkNSS28vK1d2?=
 =?utf-8?B?aFM5MlZ6M0dBUGszZENGVmVPZVhmVnE2RHhvMm1ZWnpXaTYyb1dTVEZhNURD?=
 =?utf-8?B?aGRkLzFpYmQ4cmtBNkdLVmNiMkRPVmVrUlNRd0NZMUhnMUVoYW5EcXBuNGVD?=
 =?utf-8?B?VnAvVmRSeHlOSUpRbERidVpBUWRsUm02NEFBZVlEc3QwTFcyNlY0aGNpWmYx?=
 =?utf-8?B?dHc3UDY1cU5uT3JmN2xnUmxNVXVDbkFLaXFsSlcvc0VWYUVTcGNZMVplRno2?=
 =?utf-8?B?bXJ1K0NGa1JoYzFmdHlGeWE5SFVmdFMrM0FqK1BTM3hMZnFmRVA5czlyZWpp?=
 =?utf-8?B?U0Rvc3czY2RGTFkvY1VkdXVGVi9ualY2eUZpZi82TG82QzM1L2RsWnVVbVJp?=
 =?utf-8?B?am9ialhtdWwyaXQrakpMRkZ5ZmV4N3VXa01kcFBLRlM4YWdUN0RKckhtVWZ2?=
 =?utf-8?B?Z3ZIMk9RUklSN3RJTm9tQzJaOVphd0w0MFlIdXdCNGJyVzdhUWQ5blFaUnJw?=
 =?utf-8?B?akVoQXRnY0pPbWZvS1duN1FwcTF0cGxYY0dCRjRvRXhDeDVxUkwvU2JGWW5M?=
 =?utf-8?B?b2hvbmszMTEyVW8xOXJTTGQ4QXFFZ21iMDMzUzR6LytDc09jcHdwTTJjanFa?=
 =?utf-8?B?SWQ2TzNyb1hkMW5YbEN5Um00ZTlaWHNnd2N6MVp1c3E0OTExVDBLbCtqVlpR?=
 =?utf-8?B?bzZDZ3VWcktkM3RYWUVPUFBwaWhoU2FYOUtJaGU1ZG44MmNCMXIwSjhPTGdM?=
 =?utf-8?B?RFk1QU9qcXlCZHZKRGNrYUd5b3FzRDhyMzR5dDl0cHdJM21jRmlBNXkvSWww?=
 =?utf-8?B?Wkx0UjFZYnZ4VlpWdXBZOVBsMVVsOUNLMU94NFIrYkt6QUlCSUk3NC9LNHBP?=
 =?utf-8?B?RG1PYnd3bWV5N251cVBVeVorZERlSGF2MnJEVGNKVUoyNzVzdmo1aDBNSFNX?=
 =?utf-8?B?RHJSellDelAyTzV2Tk5JTjhIQ2FVcGdKa1FLTE9FMGZaTDZNdjlUM21qdnU2?=
 =?utf-8?B?blVKbm9mSnpsMU12WXlwUFlXS2ZyVDQwbzdEUjhpZUlzWm1qUGI1UWFGVGtQ?=
 =?utf-8?B?eFpabDVjVktNcCtUdGVyaFFHR3I5WHJMakpkVHJYRXJiL2o4K2w2eXZFZFJQ?=
 =?utf-8?B?ckJiSXk1Mk4vWTViTHFCRWV3dHZlcnRJZWh4K0JCaXhYTkZYSjRPQkxpQWNJ?=
 =?utf-8?B?T0hhck95Y1VyakFLZ3hMZDlKWWxrb240MlZyOWxuQnpmZkh2NjNobUFZbWxP?=
 =?utf-8?B?ck9pV0lKR3YvNmUrVThiT0YwRWpRaFZ3dmEvdEhveUNLODlXOXk1VGx4ZTY3?=
 =?utf-8?B?OUVSM0F0N04xUUswRG9aREpxQTRSZG9qUStnS2psWnFHMG9pbk8rTUcrVFpS?=
 =?utf-8?B?V2lQWCtDZFU2MmF2Q0h5VkFXUTgyMzJEL3J0YnB4ZUF0TlN5b0FwRGx1bFk3?=
 =?utf-8?B?dVJQdlE3OWtjQlRzYUZzZnFJc1RraUljUTNoeDZqRU02WkpYN1drZ21KY3c1?=
 =?utf-8?B?QThCcUtiSDY2MHkzTGdvSnNOWEIvSEp1dm5TRkZhTktzRlA3ajk1V1UwdGR5?=
 =?utf-8?B?cHZmL0JNa0NYM2NYRWVWRTgwWHJMQ01WZ1ZXdkVIRURZai9wL1l5SExqZkdk?=
 =?utf-8?B?OHV2dHk5bnJMbTYxMFJsalZHWlg4Ui9TT3NmbUlvOUNudjQrQTdWcHNxV3JO?=
 =?utf-8?B?NS9MNGtiNjg5MDRQVVFxZldZK0x3NkxEL0JXOTdCUnJ5Ui9SRC8yWFNsY3NI?=
 =?utf-8?B?anZLeFNKM3gyOUdwNWRkQ2tiUzM1bW1hZ0hqd25VRlI4SHFhU0t6RmtaRUxw?=
 =?utf-8?B?U1hZUGZ3STAvenhoUmt2dUNTVTBja1NaS1VLVUVtdWNCM1JPeE9PU1ZYMnJG?=
 =?utf-8?Q?dGcA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkthY3ZZUWpsaGpENjVvVW1rRmE5cm1VcTZCTmlvZmh4Y0dMZ1k5M3pPMFJX?=
 =?utf-8?B?VnNYTXF1SXEwOTByMWtHenp4bE9vZDRSWmtmeThxK1ZGZk5BV1Z2aDFqdjlX?=
 =?utf-8?B?YjlsemZYU3d0dUl5bkVKQmh5ZkM4RCswUVM4VW96MThzMk9KTi9VS3I1cFNh?=
 =?utf-8?B?UmJXMTRoQXRsbEtnZVF1cStlU2VmeWEzSWZ6YjJuQ1pKUytJMkNNbnNuSlBI?=
 =?utf-8?B?TmZtcWJFRVMwZndQNEprTms1ZDQrem1DZmxEMzU0K2cxV1VEMGN6RVRUcUwy?=
 =?utf-8?B?K2hBVjA4ZXZZV3NOTVVjVE1ELzRpd0YrLzI0RkM0MFNvcnMvS1hRMUFLN1p2?=
 =?utf-8?B?bExBSzczYmRWZXlpMTdYZUlqaGVQcGQrZ1c2SU53TmVXZm5aUEUwTmdXem54?=
 =?utf-8?B?YnAramROUEt0dGZORFJMZUFmdHJadmdFRU9tRjRJS0F0OUhzd241N0RScGNB?=
 =?utf-8?B?UUNoVlV5MTNrVlkzeVBnRlBJUFVGaW1VcjVoMnNWcERTbFNrcXNacWpKOW81?=
 =?utf-8?B?SmNhanJaU0ZJeXhJKzltMnhTSzE2eDdIWlFieHpRVFplV2hYYzV5T3FIWkIr?=
 =?utf-8?B?T1duK01qWHdGUDJ4ZFpSOEFIc3liOUh1TytKVnY2Rm5WUVErMmwvZ0RlZ3hr?=
 =?utf-8?B?SWNUckgyaEY4azh6NWZBUE4vM3hvVmo1UFpmYnAxeGN6V2xkYmRuaExCVVl4?=
 =?utf-8?B?QStZREpmRUdaeDlGakg1QndJUUNXR0MzQ2ViRkhDbEd0eFpWVFBHMlBzeXUw?=
 =?utf-8?B?K2pOd2RMaURiZ3pCeGJNZHNtQUF3Uk05b25BeEpHUGo2UFJ5UVUvMWdNRERk?=
 =?utf-8?B?WmVtaXlZajRJUnZZQ1VwbEQvbm52VzVPZFFxN0VORE1nSzNxalJuMXUyT0hO?=
 =?utf-8?B?U0h3ekxUd3FiVlFsWFo1NmEva3FYV29qZG5ONVR6N1JOQXFuTjNGU0RMM21C?=
 =?utf-8?B?eUhMTUVTK050NmlrZ0JKMnI3TnlDb21wOEFId3E4UG5ZVFhRRFo4NXpMcFZj?=
 =?utf-8?B?U2VoeW1BZWppd3YvRDJ2Y1VzM1MrRncvOHZjbEhXelREOVlqelZmSXFjZnIw?=
 =?utf-8?B?N1Z4K2l5dVYxY2tmNWZTeVQyWkduT29Dekgva3N4dVc5dHF4cS9tSVBFa2dD?=
 =?utf-8?B?bUo3YjlQUVoyS3VZbnhxVU1tOGFOeElUTlZpMU4vZkpqVUJkYTZwaE9TbFhi?=
 =?utf-8?B?emg2cWFydnpLN3pvejVyWENTbW43d3VaditEazRDc2lqZW9VZzlvK0hCWW1F?=
 =?utf-8?B?bFpiR2xrY0p0TEpPa3FHeEpubWw0THBXd2RyamhPOXNkV3RRMDFCcUt5ZXZN?=
 =?utf-8?B?VDdXR3d6cS9zTVdJUGR2ZjRHMU5EMEVDY2ljTGJtUGx1TjIxbUJYd1BCK0M4?=
 =?utf-8?B?ZWRsOTlMU3FSOEpJc085WUpoYytCMVRhT2dITjRmTENYYVFFc1g2YnFkaDll?=
 =?utf-8?B?Ui80QW80ZlQ0MUNDcExvRXMzNmZiU3JZb2d2ZVhMWktBKzRhdkUwREZjczNL?=
 =?utf-8?B?cDZUQTYxRGNUdGtTd1RUNzMwZDh6TlNKS1kzSHFTT1h1OEJZVmFXVjExakto?=
 =?utf-8?B?Njc0YzVYc0RZL1hoVk5oOHdpNEVlRlAvOFNjbEFnSmdMNUZHSU5sMjBURDJO?=
 =?utf-8?B?VFFucklJQjdMMk9GL2NwbE5pRnh2Z3ZvcmNrVVdHNGlTempBbGhZc2VSRlJn?=
 =?utf-8?B?NDdPR1poeHFwempxSEU2dnVrUWdNcHdSdHBraUk2eHE4eTI1S0NTbFZ6VkpO?=
 =?utf-8?B?aUFacGlvSGdNcFJ3RmJ4L2NsRmNBSml0V2ozYWw4NS8xOG82bEVVSzZxdFRz?=
 =?utf-8?B?UmwxZE54eHhVLzdxVjh3cTNMTGFGait1QmtJcHlvTWJoN1kzR2lmSlh5VW1j?=
 =?utf-8?B?WTlxTHVOaitwNFU2TnNtN3ZaMWU0RTM4cTFaL2NrSlRhMGJvditnSGtuWXU5?=
 =?utf-8?B?b3VXc2lHcFVBRTgxZVFxcHBLSEVqZURYclVmT3RVMEdveG1UZWIxNUhnZDRz?=
 =?utf-8?B?c3k5Y0VRT1gxR05CT1JtTG9HQU5udi9oQW1lTkNVWWtYR1dBQUlQMVl1eFR6?=
 =?utf-8?B?ZGw1aDlDbk9PWDFyMXl4bVB2M2RwdEVuUEd5eEFmME0vWWl4c3Z3WGJiY1dm?=
 =?utf-8?B?Qmx5LzBRRUJLdHBOV1prVWtjVjdUL20xOGI5aTM2VG5Td0lJRHk4NElsdEtR?=
 =?utf-8?B?TWNVZlBMc1RKV2lQWG5KS25UMVJoS0FuT0d6elRGNEw5QjZPYjl2Q1hkdUY3?=
 =?utf-8?B?K1JQbG5ieEZVemlzTXFIckM1Q0JkMlVkNittbXNjSWtBRTJXaTRPczhtVVF3?=
 =?utf-8?B?ZnBNQjJxMmlTT2NRb1hpM1NCTFNSMHNsS0EvcGQ5NmpJZ0RSZmptQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84e9cc9d-3934-4eb8-e658-08de6d8275b7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 17:40:22.3398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CfJFZdxCbzM4eYbmiJYv8Uni39Gbq9a1MXZvLw52/hbCgh8EGvnGoJYtsBYkOksJMuJO9rbAzLcMHNQ8Kdnzlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5312
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

On Mon, Feb 16, 2026 at 01:51:57PM +0100, Francois Dugast wrote:
> mOn Fri, Feb 13, 2026 at 01:16:25PM -0800, Matthew Brost wrote:
> > A single VRAM read on BMG can take over 1µs. While small, this is a
> > non-trivial amount of time in a hot path. Remove the descriptor H2G read
> > (potentially a VRAM access) from non-debug builds, as this
> > error-checking code is not needed outside of debug configurations.
> 
> About the change itself: I understand the performance benefit and this would
> make the code consistent with the 2 other reads.
> 

Yes.

> But the existing block under "if (IS_ENABLED(CONFIG_DRM_XE_DEBUG))" seems wrong
> because it is not just about optionally printing some debug statements, in case
> of error the function actually returns a different value if CONFIG_DRM_XE_DEBUG
> is enabled or not (goto), and this return value is used in __guc_ct_send_locked.
> 

I can't realy argue with this logic but I also see the benefits of
verbose checking of GuC state in CI configs. fwiw, this logic was added
here:

git format-patch -1 d2c5a5a926f43

The cost of reads are actually huge here - this patch by itself is
incomplete as a tracepoint below does a desc_read in the argument list
and this is uncoditionally executed even if ftrace is disabled. On BMG H2G
before this patch / fixing ftrace are 3-4us, after ~300ns. So I'd
suggest we move forward with with a couple of fixes patches first, then
in a follow up either:

The cost of reads is actually huge here — this patch by itself is
incomplete, as a tracepoint below performs a desc_read in the argument
list, and that is unconditionally executed even if ftrace is disabled.
On BMG, H2G reads before this patch / fixing ftrace are 3–4-µs; after,
they’re ~300ns. So I’d suggest we move forward with a couple of fixes
patches first, and then in a follow-up:

- Move all really expensive things in GuC CT layer under
  CONFIG_DRM_XE_DEBUG_GUC, enable this Kconfig some CI run
- Perhaps just assert if GuC state is corrupted in the path mentioned
  above

Matt

> Francois
> 
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_ct.c | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index 6a96bea40720..f200d3ee9d22 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -939,22 +939,22 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >  	u32 full_len;
> >  	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&h2g->cmds,
> >  							 tail * sizeof(u32));
> > -	u32 desc_status;
> >  
> >  	full_len = len + GUC_CTB_HDR_LEN;
> >  
> >  	lockdep_assert_held(&ct->lock);
> >  	xe_gt_assert(gt, full_len <= GUC_CTB_MSG_MAX_LEN);
> >  
> > -	desc_status = desc_read(xe, h2g, status);
> > -	if (desc_status) {
> > -		xe_gt_err(gt, "CT write: non-zero status: %u\n", desc_status);
> > -		goto corrupted;
> > -	}
> > -
> >  	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> >  		u32 desc_tail = desc_read(xe, h2g, tail);
> >  		u32 desc_head = desc_read(xe, h2g, head);
> > +		u32 desc_status;
> > +
> > +		desc_status = desc_read(xe, h2g, status);
> > +		if (desc_status) {
> > +			xe_gt_err(gt, "CT write: non-zero status: %u\n", desc_status);
> > +			goto corrupted;
> > +		}
> >  
> >  		if (tail != desc_tail) {
> >  			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_MISMATCH);
> > -- 
> > 2.34.1
> > 
