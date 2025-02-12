Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980A3C02198
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 23:49:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC4B10E333;
	Wed, 12 Feb 2025 23:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EtmkxVIL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902F410E333
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Feb 2025 23:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739404196; x=1770940196;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7ffUO2o7XjQJ1D3GyK1G7UG0nxBoIpaucVQxnHjMXQk=;
 b=EtmkxVIL85y2eWq73982/rRPYzdz/coP7f89mDNxAfhouy++hMZoUHsU
 /Tc5m0cAssULIcoFISqtwdIItRc9YSsHLfpxZWIWrCwPLzgTlJFiJ2pJ0
 22eVcMTG+pOnB1H1EzG3o6HQomytQDIP+ZG54GkxC3bX5YD703d1MkPVL
 7JKQYA5E1BnP1SQdvebIYkCWPs8HzLgjqqrNcwSv3xoCLU2SlqV6a4ZCv
 65W1TzljsSUfaIMAomeDHMgH55VFjMqu5aOHZr9FC8xNsIgDjKpTrb4xW
 hM2+s4fNvb6IXk7QVXRNzsW5pOJwHVvuMwKANYGLUG5/Q2pB+gQWLgEhw g==;
X-CSE-ConnectionGUID: sqWOVA/eTV+8fX9MbDq52A==
X-CSE-MsgGUID: CRnzPnXzQrSur7FuOBrCMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="62553986"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="62553986"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 15:49:55 -0800
X-CSE-ConnectionGUID: VbybgI5JQyCtQOyH9fjomA==
X-CSE-MsgGUID: LYxZ4l2rSLa3J+geGqbxhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="112940445"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 15:49:55 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 12 Feb 2025 15:49:54 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Feb 2025 15:49:54 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 15:49:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y0BGbTAk+0K45pw+Fh91VQN+7eUzDIGFhZiEzhRhyGLVC61U4Hsvuqfu/zYBDSLGmkjYrbzfO7laibGckgq1TPk49MYItpszcHz4fPkCfPvljG3d4tF9prIybS00PAMS6vRfOMRdJLdM8vhmK8SMB118ZQWd5MW5p5hBn7jAZHkiLhdXdC7ie/kLFT4Le5f4Q6arJGglmWCabrU3zTHkTBCucI2aNbxEO/M5CAYlRxYju2mrQuZkJgZw41J87TVkp989NPNAjIaKpOwxZE152QhRxtBeTM1qXrtE2N0on2s45KRTrQV6kHLtQ8lBCDThf96oi7DpxX/eG3bOCP8ypg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UlxOghNh/MxzliFTBXeMDBbuY1qisYXU2OSQselXJW0=;
 b=PwSYZHs3sIfQSgsAnp7sSfJ6FYla+f0PjN3HpaT549jVs/TlE8zpZowaw3wgk4YBhM9Kx7Ritj04pbAgcNwJKk7tJqhz5OdOX3DhkKuPMc7K1gCB7AjJw1cKVaI4sI+KgDEsvJPWBznhZKH3AKR/tnQFI3fKuUZMNBcuL1zUxiMq9ggK/Vf1ZNGPFgtCJ24rIIra/8ojhLMWrS7Ck3qi2h+PtLAZmu2mgh3cNuPX7nQAOI+MoMBBMtZBlfUdPUJNURFursulyrcmJS7kXBqhfmgPnAwpzH/PRRhWC5uwoNMna7NbdNgVJ+WzLp9DhB8nrfUHD+O9XlTeh+qL07ADfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA1PR11MB7889.namprd11.prod.outlook.com (2603:10b6:208:3fe::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Wed, 12 Feb
 2025 23:49:52 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 23:49:52 +0000
Date: Wed, 12 Feb 2025 15:49:50 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Himal
 Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v6 5/8] drm/xe/xe_pmu: Acquire forcewake on event init
 for engine events
Message-ID: <Z60zngGCAOpITKGN@orsosgc001>
References: <20250211100952.322303-1-riana.tauro@intel.com>
 <20250211100952.322303-6-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250211100952.322303-6-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:303:8f::29) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA1PR11MB7889:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a705677-cc42-4cb6-5ca8-08dd4bbff1a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1VuQjdXcWlFcWErdU10Tk5NSlo4S2NYMDNRZmZ3ejY1eHZQZDNPNjhrR1Qv?=
 =?utf-8?B?eDF1TkNzNFRoNGVGY1gwV2VGYVY1d0pqelFFUEE1UFI3cnA1clFON1JSdjZ5?=
 =?utf-8?B?WHNsVEYwTEI5OXJRcVl1a01qTmNZY1B2MkoyNmdqdUFmbWt4R01aQ3ptU3Yr?=
 =?utf-8?B?blZOTWl3aHpHNExUL0JBb3MrUjM4d3lpVG9iRm03ZHkydWJ5c1RRY2xTQU5U?=
 =?utf-8?B?aGM4bkJiUFBVQmpjdFArZ1d3N2VHV3RlZW02dU1qTGR5ZUt6aE1Xb1FDeUpO?=
 =?utf-8?B?VXpublZHVHlPMGhtaGtQendXUk9KZSt4S212NlBYZnhCNmJDMSswSkpTdFFJ?=
 =?utf-8?B?eWNaRllUb3gxM3NLRDNwRWFNd21SenhVTzNDUUx3VSszc00wMnhNVFBRVXFI?=
 =?utf-8?B?SUhMTWs0dEs0UmtkYVBPRDA1MzlIV2l0dkNHbU9TZFAwUS85dk5FbEY1K2x2?=
 =?utf-8?B?bFZsTFY3OE13VkliQmxkSWFjM3lZR2w5ZjhXNUZjY1hEVWxFL3JQY2svOWwr?=
 =?utf-8?B?VnE2NmZpM2NWR241cmhoUzdYbjB2d21tZ1l5SlB2RUk5ajlGZk9KWjZmN2Q0?=
 =?utf-8?B?NzhPSjdMRStud0lNZFpuMVcvSzQzSm9oK2ZFNjdFT3J0Sk81ditIZTZuSURL?=
 =?utf-8?B?MThiMkpHSWN2UVlVdnIzUU5BZFRncHpYUGRLME50NHluV1U1OWMxdVVxcjN6?=
 =?utf-8?B?aVZRMExVVkJTaURmUDUvUjZYT2l0Yk1BdGFyL2l6UlV2cS9zTmsyQnNNVFRh?=
 =?utf-8?B?UXBMQXJ3VnlyWGZjb0pmeGFlNC9Bdmp1M2pPYk42ZzMvSkVtV1NuTTFnam9z?=
 =?utf-8?B?SGlTQk5VbWVXUHVHY2VZdUVNb3R5bS9jQ1l1Q2NWNnZwcUczcmtEVVVBdGNL?=
 =?utf-8?B?VkhLSWNQa3N6Vk5FbFNkZC9MM01hdU1VVTZEWkEyeUFZL1d1WDBHZHRSVUhK?=
 =?utf-8?B?ZFREYk1Kb3BRQlM3YWZKVDhvbldFUHFvK0xiNVoybnVlc2lwNE9iOW9NMDNp?=
 =?utf-8?B?WGV3V0g2NENzODRhMHNTQlZUQ2hJSnNSbXpqUXFzSGw2R1Z6MnNEYW5NakxP?=
 =?utf-8?B?THlWK2xzTGFkL0U2ZHFpSHVvN0lHRDY2LzgxSndiZENRSE5Ua3dzaW1Sekln?=
 =?utf-8?B?VGpCTWNoS3VkU1pIdGNOSC91RGR2aTZ0bklFZThmR3hJNzhzWGhBQlQvVnAw?=
 =?utf-8?B?UkJRaUxWN2Flb0Q4RnZERkxWeDFHMHNtQ1JtdHhWWXRQVUFkVDBGVmgxRVBM?=
 =?utf-8?B?aldDdmkyUUVxVTlIbUtsakdtZTVsMlB5eVRQRGhpakVvaWk3WHoyVEhFWmhN?=
 =?utf-8?B?MTZocFZoalRaQzB0eDRKUXZGSm1laTNOcFdFN2VMdFFWYzBIYmFKLyt2R3NF?=
 =?utf-8?B?YkpJSEh6eC9zdXc0bHlzeUZBa2pmYU1VZ3M1TWJqcWc4QjQ4ajIxWERMS0pW?=
 =?utf-8?B?c1o0UU1DK0lVdmZzWlNjOXFCbkljK2toOTNyRitZZXZHUXBpQlA5bGlyZ3pV?=
 =?utf-8?B?RXpERDRUUWNkaFJIYnZaYmhvQml3eW1kQ3ZCWUltODdIcmNzRHhReXh2YzhX?=
 =?utf-8?B?WkF0MFcxaEtLSU9jTXJRaERtS1RLWjJibGxBRVo5M2lxQ1hNeUw5R2JKSVhU?=
 =?utf-8?B?aWhyZ2srT00rWmpWVFAxZ3h4WjlWMTFQN0YrbnBDVGxPNUFNbkFoQkhNNVhs?=
 =?utf-8?B?THJQS24yYTlzR1p2Tk5URUlzc0JDRHorb240RFNJbFgxWTdVaitSZ2ZmeFZy?=
 =?utf-8?B?TlJUSnAzU3dhcjZCdGNGY3VBT0ppRnFGeGFnMG01czd1eVV2d0N5NmpOMnRj?=
 =?utf-8?B?YU5TU2lHWHhWRUdUc3JVU3BRY1JvK3BEWU9YSnpvU3B6TjBialVSN2lpVTZB?=
 =?utf-8?Q?mPytc+JjjvWB3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlFyZFUzVnQ4aFJ4eExERis0TW4wSjhBSHZFcnJzVUlsdzVrVlpSYjdVQmw0?=
 =?utf-8?B?OTJmMlJkVHR1NE5VZ21OeVV3STRQdWFab2ZPM2gvSkZHQ1Y3WUFrNUtsNThZ?=
 =?utf-8?B?bTBJQXRPQUhvK2F1dk96MmxkR3ZiL21aRXNvODlvMEJONDluby9mNXZKVWFF?=
 =?utf-8?B?M1FaeFA5N0FzRS9UV2p2N0dFOFdmQmlMdjN2ekpaQS90bno3U0hXNG5DQitl?=
 =?utf-8?B?dklCVEJPSi9ybE9GOWRZdlNpc0dNQkorRThickUwN092ZGRTZDBxNjJDUkI3?=
 =?utf-8?B?WXlzcUxld3ZUbGhTQmY2SFV5Y0JsUW4yalJZZDhhWGphNDZwRFJGdFNVRGov?=
 =?utf-8?B?THlBWk9XcVp4c1JERXlqQ3BNM0Z0SlpVS0NQdjd6MHJWNDRlcGh2dEVNSTcz?=
 =?utf-8?B?TFptcTVFczQ5UHAzSmFFZ3Q3RnE0SGhnbmZVVUdoTlJPQlBJZGFkcmNlWldn?=
 =?utf-8?B?SXp5cG16dGdxVDVQQ2RPQjZBeXo1YXpIK2ZIS2JnaG84a244VGcyc0pwTCtH?=
 =?utf-8?B?VjBuZndoeVVQUDdmSVBGYXJsOVV0NjBmZHVlM3pGcGY2S205YW5PVEw4djVB?=
 =?utf-8?B?dWxoRzNSYkEvZXR4ZG9YdGpsZVJGLzMyYkhnMUx2MjJLQTQwc3hlL1NlQjRt?=
 =?utf-8?B?TVpYNmlXa0I2V21aTjQyem95R0NtdE1TNmduM0EyTkxFMk5BNmVRSU5HSUFr?=
 =?utf-8?B?aGdreDlpRjN3SUpoTjA1SzdwOHZyWEhJMEVVbWFraENpQWFXcytWcm83WGdn?=
 =?utf-8?B?MzZEYzhmSXBzdkE4L29IeEViUVE4aTBFSnhSUXNSUWpZNTNTV3kxSU5yTlpx?=
 =?utf-8?B?Qzc2QnBzV2VmU0ZNUFpONklsUWZQbnJ0eGh0Q01WS2gzMXJzcmFtYXY1bjBD?=
 =?utf-8?B?NXNpandFY2xFQUl4MkdPNU9lMkdzQjBIc3ZDZVgxVnY4VTA1T1hUK3dRTmoy?=
 =?utf-8?B?QkR0VFE2THdDZ1pZZmtsa0ZLckgySTI1c2JGZmtUYnlwYnJORmJ5SUpGTHUv?=
 =?utf-8?B?Z3FIVXBZR2IzbDJzbDJGNFNoVzJhZGFkU2FDVGdrZ2JXYjRHWVY2NzAzRjVt?=
 =?utf-8?B?NzdyNHBJbHZxSFJkSzZaK2ZJcHdmOHRUNHZQNzg4bG9yNC9vUG1yQStURzhK?=
 =?utf-8?B?K1NqcTc5czhUdjU0VW9reTRPZFB6NW1WSDd5em9SMzNkQzhmYlF2UFNudmFy?=
 =?utf-8?B?WVoyL3NhbEtWQVlHWUxyNSsyL3pJWHZLUDU2Wlh2RDN5R1RRN3hPbnJOcFdZ?=
 =?utf-8?B?TXpDMmkxKzFBamNZSDRkVzJiYmF6M2ZxVDhENVZrNExpTEx4TjlFTWhXVGRh?=
 =?utf-8?B?NTVYMlcwTVQ0MjdMaU1lSkp5LytodnppUlhoU2tzTEc0L2xlSHREN0tvTk9M?=
 =?utf-8?B?YlJaSnprSngrNTQvTXMxbVhPSzRaYjVURW5jSE9pUW1TR3JjeDdzWG80UW9p?=
 =?utf-8?B?b2hLQ2JxamU4VmQ1b0ZZL0k0Vnl6Sm9UYjJ1eVkyZTJYVlptMFFaTHlmYnRB?=
 =?utf-8?B?VUtmZEhqTldDVnJLTFY1c2huL01SaEVRK0hIQVEybEVBS3dhbTREdEpteExP?=
 =?utf-8?B?TlZWTjRjdVgyMGM1QkZxdit6UkpJdC83OVJrZlhUT0VKL2JITkNabDlJUUhN?=
 =?utf-8?B?bS9hVk1EMW1rUko5OFFtVkRaL3ljMHFTNmpkOGVpclVHRUdqMmN3MjBsQ2hp?=
 =?utf-8?B?NHhnK080TU5xd1JIalJDTjVVNGJZZGxWVmhMRVBLTHp1WjUvcFVnVHFwUDdM?=
 =?utf-8?B?ZTllNVJaLzR6YmE4dHJvejh3cktJNGNCUFlnc0wwYnk5dmZBeGwyOW9nRzVW?=
 =?utf-8?B?dlk4NGZCWjA0b1VZTys0MXk2bnRuTmdFNXRpMklVeWJwTjBHM3ZidnlMRUhp?=
 =?utf-8?B?ZkUyU2JpOEMrbUxtK2Z6VU51QlNyWG9qL2tUU2U4NWxzLzQwdElaNDdVM2Yy?=
 =?utf-8?B?K2NxY0JjaDBUdDU0Ui9UTzNDcWtxUmFlMklPcVpQZEQrd1JXVHNNN1ZNcFhn?=
 =?utf-8?B?UjlQQzlPTytYM0d4VE5mckRnd1Zheld4NmxQbG5DRlpoSURyZGFCaXlKYmJC?=
 =?utf-8?B?YlZjbStLZVFTa2ZKUUJzSlRqSU42dWZrZUJIUktuUlVyQ3RoUy9sdlVwM3Z1?=
 =?utf-8?B?aWYvZmFzOUp2MEZNQlE3SU9PVGVvcFc4Y3d5aUE5MXY1QW5GL2RycWVTM0JT?=
 =?utf-8?Q?EFVUReeOd7clo2RUxn6OyQg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a705677-cc42-4cb6-5ca8-08dd4bbff1a6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 23:49:52.3891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wO5W91Ao+24L7Bf5sWIGc2kOgZnMNbn/MpOvYbDki98QfaRx3iiGa9vFYXQXoc0xTpk8D6BNTH89J2jnQo/aU34MIWZ8wbGs62FR3BfxZds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7889
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

On Tue, Feb 11, 2025 at 03:39:47PM +0530, Riana Tauro wrote:
>When the engine events are created, acquire GT forcewake to read gpm
>timestamp required for the events and release on event destroy. This
>cannot be done during read due to the raw spinlock held my pmu.
>
>v2: remove forcewake counting (Umesh)
>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> drivers/gpu/drm/xe/xe_pmu.c       | 52 +++++++++++++++++++++++++++++--
> drivers/gpu/drm/xe/xe_pmu_types.h |  4 +++
> 2 files changed, 54 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>index dc89fa6d0ec5..0539dd61ddc3 100644
>--- a/drivers/gpu/drm/xe/xe_pmu.c
>+++ b/drivers/gpu/drm/xe/xe_pmu.c
>@@ -7,6 +7,7 @@
> #include <linux/device.h>
>
> #include "xe_device.h"
>+#include "xe_force_wake.h"
> #include "xe_gt_idle.h"
> #include "xe_guc_engine_activity.h"
> #include "xe_hw_engine.h"
>@@ -102,6 +103,37 @@ static struct xe_hw_engine *event_to_hwe(struct perf_event *event)
> 	return hwe;
> }
>
>+static bool is_engine_event(u64 config)
>+{
>+	unsigned int event_id = config_to_event_id(config);
>+
>+	return (event_id == XE_PMU_EVENT_ENGINE_TOTAL_TICKS ||
>+		event_id == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
>+}
>+
>+static bool event_gt_forcewake(struct perf_event *event)
>+{
>+	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>+	u64 config = event->attr.config;
>+	struct xe_pmu *pmu = &xe->pmu;
>+	struct xe_gt *gt;
>+	unsigned int fw_ref;
>+
>+	if (!is_engine_event(config))
>+		return true;
>+
>+	gt = xe_device_get_gt(xe, config_to_gt_id(config));
>+
>+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>+	if (!fw_ref)
>+		return false;
>+
>+	if (!pmu->fw_ref)
>+		pmu->fw_ref = fw_ref;
>+
>+	return true;
>+}
>+
> static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
> 			    unsigned int id)
> {
>@@ -144,6 +176,13 @@ static bool event_param_valid(struct perf_event *event)
> static void xe_pmu_event_destroy(struct perf_event *event)
> {
> 	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>+	struct xe_pmu *pmu = &xe->pmu;
>+	struct xe_gt *gt;
>+
>+	if (pmu->fw_ref) {
>+		gt = xe_device_get_gt(xe, config_to_gt_id(event->attr.config));
>+		xe_force_wake_put(gt_to_fw(gt), pmu->fw_ref);
>+	}
>
> 	drm_WARN_ON(&xe->drm, event->parent);
> 	xe_pm_runtime_put(xe);
>@@ -183,18 +222,27 @@ static int xe_pmu_event_init(struct perf_event *event)
> 	if (!event->parent) {
> 		drm_dev_get(&xe->drm);
> 		xe_pm_runtime_get(xe);
>+		if (!event_gt_forcewake(event)) {
>+			xe_pm_runtime_put(xe);
>+			drm_dev_put(&xe->drm);
>+			return -EINVAL;
>+		}
> 		event->destroy = xe_pmu_event_destroy;
> 	}
>
> 	return 0;
> }
>
>-static u64 read_engine_events(struct xe_gt *gt, struct perf_event *event)
>+static u64 read_engine_events(struct xe_gt *gt, struct perf_event *event,  u64 prev)

extra space before u64 prev. Strangely checkpatch does not complain!

Rest LGTM, 

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
