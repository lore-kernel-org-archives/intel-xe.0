Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661BACA0EE4
	for <intel-xe@archiver.kernel.org>; Sat, 16 Aug 2025 06:52:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 125B410E089;
	Sat, 16 Aug 2025 06:52:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A0V3O7SR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE52B10E089
 for <intel-xe@lists.freedesktop.org>; Sat, 16 Aug 2025 06:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755327152; x=1786863152;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H3sZ0oFX30ocd6S2y19fB8K+dI/qanQ/lmkbOvi9AdU=;
 b=A0V3O7SRWtiF1IdiHSuOzg+f4LY5INpgVAv1BPY0LobbMQvth6/2qVQV
 wwhMPqvI6Jdhjs9ltME2C4FaoN+q+lb+RvQodLvW2oYpop6Mh7hZFW/Qd
 wcBHwcHoNiQcAnyaZZFfXHb1TYagl2cxMrZGq5cCMWEpfGD6RrxCkFISr
 OvYa/IOR21VVh4dW8pd568tjyNfgZMUbHBaU+pDGpN30scUXOVZf1HG9s
 nip6y0ngkEkVMWf2cQrJ27AKkEHps+Qfi08RKMczggSYOB7qClhacWJkC
 KbyA957BQKJO6ugg3sC+nrHYBFYflAnt8oeFo3hDvZpXngZxTpGX+Ue2W w==;
X-CSE-ConnectionGUID: PaMETgLIRjGDKzziiLAz3w==
X-CSE-MsgGUID: aK0Zype+Te63ud3vRfsZ6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="57740503"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="57740503"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 23:52:31 -0700
X-CSE-ConnectionGUID: LF0P35mDTjq/FIuh5KZKTg==
X-CSE-MsgGUID: FdOtPU6URLmXBFs+xWxRbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="198165352"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 23:52:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 23:52:30 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 15 Aug 2025 23:52:30 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 23:52:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EoLojiGarRKb/diuOdAVtKW+QG0AY2bzmw9BOikM2eArJsY0BFu8T5f1t28GRrED2A5THjW9RG/8hPHc5/HVAwy1ci9on67IayhkSYAHzTP+llB9+DKeerIB0bilMXBc2W96Wk6x3HQqu5cYssnkuAK7Pni2Sw3bs5NtatgLEn0MnhG2ehqY0j7RF3833isKSreTw1xKaMOn14uLA0ZD3o4XziQY27XRR9rCnZEHfl6qU7lEZBz2f8FLC2GYk7SCnAUuzlN8kKzjeeLfW4DKPaPeQeoavZz8tP3TBKV45qecGgW3DTN7oI8EbrnRWC7hdCB3C1alEDPssXF0ymzHWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDvQMhhFuwH23lrtsUZl2yEcs5X3I1A2phVNX5Rih6U=;
 b=unD/xJVmMjbY2yUH9BXaUkkqqjHDGQVF1kYHbp+w6JijdeBmyl3CKkHhPZ9HeGVTU6F5a6lkMJIozZrDO8DxXIuwQWew6HCYpM9ZShfF0VntNoli0kJ2QXLsf7USdOmLLn+GCnX4QUP3RRuHF2/GkB46l3giLGtTI3SsvhU8GyshEjKmdWqlRvQ4XOD9jbxSVsAL8txWwsNqJdueaat6tF9EIwYRjytKwjJiWqOHfgUOfnoY78Mh372TEv1VpF+lwYDYXkrI6R1phEqabb6GQVOBq7V4a2IHwUtaGmjjk/BG4CmrYCH71+Sbcd2poVeBg4IGFpLVWIen1lZHdxAgNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MN0PR11MB6109.namprd11.prod.outlook.com (2603:10b6:208:3cf::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Sat, 16 Aug
 2025 06:52:27 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9031.018; Sat, 16 Aug 2025
 06:52:27 +0000
Message-ID: <31188898-5f9f-4c6a-ba78-cedbd92ead9f@intel.com>
Date: Sat, 16 Aug 2025 08:52:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/xe/guc: Add devm release action to safely tear
 down CT
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
CC: Matthew Auld <matthew.auld@intel.com>, Summers Stuart
 <stuart.summers@intel.com>
References: <20250813101225.16638-1-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250813101225.16638-1-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0037.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::17) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MN0PR11MB6109:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c36d0f4-3353-46a5-677e-08dddc917676
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0RXMHREY1pBZTU5N25kWkwvdU9zQm9HQUdpUjA1M25ZaDcxby83elVUSGxW?=
 =?utf-8?B?aXpNd2lqYzJoWlB4U2ZCNC93R3FReE0xaDUxd0VHWGc4dExpODZESTNybWkr?=
 =?utf-8?B?THh3Q2hxK2NtNVZlbm9xdlgzcFA0RXpXKzlzUXMzazZoZFRBZ0NHRVQ3TE5I?=
 =?utf-8?B?SHVDWlQvYWN5RFZOa3NzWHQ3Vy9qSFVNcGo1V2V2M3NVMnZsRCtyUWt0Y0hU?=
 =?utf-8?B?K3A4c3VMdEwwaWh3THlwS0tyb1lidW5BVXhkaTlWQ2l6MkJyL0NrQ2hSeVBP?=
 =?utf-8?B?V3FuU280V0xkK1NvVFYrTzJ2RjBpL3N0Y2N2NmJ6bGJVN3YzUlVWc3QwSHZs?=
 =?utf-8?B?ek1PTHJsSDVNck4vSEtBenJRbFIrcXlURmcybWYyaHVOOXhkdEpqdzdpeDMz?=
 =?utf-8?B?TXdaWUhNZHFRMVNnNkl6UEx6TEZGaU5iOUF3TytVRXlKYk4rUGxmalRiMzVj?=
 =?utf-8?B?TEU1Y3NyQk8xNUZ6Mm5HT1VBVTliVFVnZmovK1IzTmIxL1hjZlBsLzhwRzQx?=
 =?utf-8?B?ajZlS3htK3Nha1NXcXZUK0FDN3hQcUFhU0g5eldRNnBIZXgrSnpjZjJSR3V2?=
 =?utf-8?B?Mkw5a2pjLzVacnMvUm5EZ1FteGorR2VnZ0tVWURNNGR3ZEtBcTlqd204NG9H?=
 =?utf-8?B?Qng3dXdKdE9IVjFFWmR4M0lXeDFPb1R3ZE1yL2JpZ1BIRnRYbTFYRHU2NTlH?=
 =?utf-8?B?MjJzc3owVDdhVU8vL3M5Rk1lWVFSWVM0MHpGelZlZXNxamxVdWJmVXBtVkFi?=
 =?utf-8?B?R0llT21Fc1EwVWpDd2svZzBScG0rR2tZQkVMazJQbnJIc1J2VnNJSFkyTUl2?=
 =?utf-8?B?NWZXc1JpV0lOWTROeTRoNVBrWmR1RS9rdGV1bEx1RFVEWTRsdVV1ck4xY0I0?=
 =?utf-8?B?MUdSaTFaYWhmNkNnUXZwcVM5VVhBMlR5NnlONlp5YlFFQkp0RlEwNkpldzg0?=
 =?utf-8?B?THhEWHlPem9YVHBxTHc4dWhkbjR0YTdMamVTb243WkFQSWtON0g5N2RoV3gy?=
 =?utf-8?B?Um53NHRlaTA5YUtZOWhzbzdPMmZqc1RlMU1BYzIrWTF4RVAzL2ZaVXNZZUV0?=
 =?utf-8?B?djZTa3U0U3dOdmo1c2F4Z2d2a0w4cFR2ZjFmS01rUDdOZHpjaXdkQWVyWWV1?=
 =?utf-8?B?ZWkyWmNFRHN4OG9rMlJ3c0NsS3VUdlVLM2lTQTYwYnNlcUxQdzlaZVV1a2xw?=
 =?utf-8?B?WnpSMldLMWdHa2JoYUduc3o3Y3BhKzBNcHl6QTcwNmtCWGljd25PcXhWdEIr?=
 =?utf-8?B?WXo0RHNPOWVlU005ZWVtYlRxTzhGRitjZzBRWkRjWjZIUDFLY2RhaDNQNk1k?=
 =?utf-8?B?L1h1Y2dNRkl2SnlzWGxQaTQ1ZGZkYmV6N1FpM3VLWSt6bVBZa1VEazZKREYr?=
 =?utf-8?B?VHZvN2FiWUxlTUxQenhSbGE1NFlIWXRsR3pEZzR4b0ZKMkFwMjdOZnk4djk5?=
 =?utf-8?B?ajVzVlJtMmVjbHJtaUFNTE9DeG1GU0VJa040NlpySTdLcXBkSFY5VEZzeWxa?=
 =?utf-8?B?SE5sRE11NllvMko3YXFLaGxnYVFTTEVIOFdWV2NZb2xCUGF4K0dxSkwzZFVB?=
 =?utf-8?B?YnpLU3hJSjFwWUZwWVptQ3lKZEVkMnAxVGZGakNzZ3RsL0xZOEVObld4OUtu?=
 =?utf-8?B?bW1LL2xaL3pXNm1mR3JmS1U1dlJZbVNpWEFXTGZDYTl3QU5hWVZYMjJ2YndQ?=
 =?utf-8?B?YUlSSVQ4TlQycnhnVjQwbXVNMWNUS1pwdGZSekl6YmdlMjEwYWZqV1I5SGdt?=
 =?utf-8?B?QWxqYTk2bG8wdzI1UG0vK0tNc1UwY0ViSlY3aFhkd1M0MmdwTmtXUm5ZcU51?=
 =?utf-8?B?WkhySmliR3IwT0hLRkZZMHRESGl6YkpaK1RLeUlNa2FQWDEyUk1oV1dGN1dM?=
 =?utf-8?B?a2o4d3VYNUdJa3l6VEhDN2oxNnhacTc1d1ZCbjhTZ0FlSmc4cDB5V0Vpcnhp?=
 =?utf-8?Q?AsPeg9APMtA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXdVNytYRlZ2UUpqQ1NabWpadnRsbVFKY09kQmlsSkZDVUs0OFlPWU5odG8r?=
 =?utf-8?B?dllMR2JFMDNwYmxiUUVyd0poVUs3Ym1RT0lkQ2FmMHhMUVZ3aGlNNDlmQ0hF?=
 =?utf-8?B?YzZER1NRUkFHRGl2S3ZWSWVlVHlnT0ZTQ2lxb1BsZ3VGMTZPbVZqYnREOVJE?=
 =?utf-8?B?R1lhMzIybUhGU2JPTzMvNExjcXRHaWJFbTZ3aXZnakJYNDZqVDVvTlBzKzZO?=
 =?utf-8?B?eVZxNU5LQjh2ZlZzTytodFBlK0hLWmIrV1ZudEpxbWpYY1haZy9aeXBhZHkx?=
 =?utf-8?B?K0JHUitDY0VqendqdDRrU09GbUw3ODh5UFZBaURrSkROd2lJSzZYa1RnY3ZE?=
 =?utf-8?B?Mk9JbjkzVXoxVTVPY1dhenFhQlFpWW1TbmVqL0pCSE0yWWExV3gvMGs4UjJX?=
 =?utf-8?B?R0RwemxCd0JHeEpPZjk4aDRseGlVSFF3c3Ewcm50YjhTcytRY2dKL0EraXR6?=
 =?utf-8?B?c0N3eXVUdzRSbmpBUEtXWVNGSFRFRUlGVTY4aGVZMzVBMTIyQ1p6czFXdWlM?=
 =?utf-8?B?RzB1VTJ5azVibHFhVUpwWXpOQWFJZEVHbWloNXcwK2pUaHVSdmdxalo1M25a?=
 =?utf-8?B?Szdud2N0VjUvcEJzSEVpR1dQdzNSaTg2TXhKcGtNMWwvVk1LNUJQSXR5RTlI?=
 =?utf-8?B?VHlyNWRTc3NJZ2ZoQkxBQTBCRWFMMTVjSE0wYjRTaldLMkFDZTNPT3paNFdR?=
 =?utf-8?B?YTJYOFA4czgycDU5NEgrVjVORnNaV2R6OCtKWTlCTy9TRnBxVnVLWUpJSUZP?=
 =?utf-8?B?cUMwZHVZYUJ1SWZEQWkvVnJmZk9iNHZMNmpIRG9zWENRZGVaRWZGZmJZZW5O?=
 =?utf-8?B?L2hoUndMRmcyZXI4M2IwYjRTS1hJaFJGUWtGWXdUNnF0MWtkcnZzVTlvY2lS?=
 =?utf-8?B?V1RHSDUzZDRTUlFOaU0xYi9GanFwV3F1WGFaK0ZtckhEemhvMDdRV2FYdUNJ?=
 =?utf-8?B?azBFZS9DUFhpc1p4RWRVNCtFUEdGWFZqbVU4SERMMGk4OCtkSzBwRHgzUXBJ?=
 =?utf-8?B?WWlZQ2U3dzc1dGdIc0grL3oxWmY1RnlFL0FnOUd1ay9BRWlMdE9GRFhrN2Zu?=
 =?utf-8?B?dHhRbGlQNlVUNkl0ck8zYkZjVGU4YjIrUnNYR0dHVWdUVXowaTV2VTJYSGZI?=
 =?utf-8?B?SFNxOFg3Tm1UTzRxTHJHVVZueG5ndWxuMERsa1R4WHdnNG9PZkk2Wk0rUHRu?=
 =?utf-8?B?ZVhtZlpOVDhRYU93UCt2c2d4SFM0QlFoYnRxNUYrQ3c3WkFST0IzU25iV282?=
 =?utf-8?B?ZDNETGVMNlFPLytOZFU1RGFVUkFxSm9VQm9SWFIrZTlpSzFrYnl2MXlCT0x3?=
 =?utf-8?B?TDdCZnhKa3pJQ0NmeXBuL2ppanVZUkcrTUVZYUxQWUQ5b3lvQ3FUcGtLOXY4?=
 =?utf-8?B?TUtHSkFjTkNIMUtQcGFEc3U2ZDBtR25nU2c3RkErNnZIZ3NTWHJsZWQ2YVFa?=
 =?utf-8?B?UTIwY2ZKQnlYMDFEOGE0QzU0bGpBQS9Qd0xWeUswYTZLZkx1YVBhVUcyM0c5?=
 =?utf-8?B?OHRkdituMVFGTVY1SXd4LzdKMTBMMGFhbnZZMUdCQS9PMDVWRGpFekdaMi9F?=
 =?utf-8?B?Nnk3WXFPU1g1MmR2dUxCVmxQRGJsTGNYM1lrcElDd1FJd2p5VnZQVEhwcldu?=
 =?utf-8?B?a05JQnJTNjYrbExvTjdVRGZQK01uNUFqUFB1NUxjQVdtQXlDa2JZNHd2Vml6?=
 =?utf-8?B?eFc2c3NvMFBRVnJRVEprenNWV29icU0yTVBNMk5tM2I3VDh6bnQxeFdnR3Mw?=
 =?utf-8?B?YVNvN2M4dm5LWkJmelpEZldWSHRrOEpiZWNTZEp0K3pCSy96aWJVSWtXV21s?=
 =?utf-8?B?ejFpRHJDSXk4TmZ2VG5IN0N3TDBpT2xTejcxMXFubmhYRTdiSkpFTGVqUmtB?=
 =?utf-8?B?SzUvQWc5aE54S2J5RmhETUNMeTBrdGRQTGY1alMvQmQyRUN1d0tSckN6N1RP?=
 =?utf-8?B?c1ExczR1dk12eXNjZFFTS3lTUk91M0Jrd1hjcE0rY09ZQmlTZmxLUVBNdzdU?=
 =?utf-8?B?M21jY3d4MHZIeHZJdjNaVTNPMy82OFljYkNIZXJqcWV2NS96bk5VdnFaOTdW?=
 =?utf-8?B?SlRnRGlrU1BwZlhCSGxnYy9xZWFUOExLc1I0dDd0amw0elErbTZLZkE0VG1P?=
 =?utf-8?B?SmExbTlsNnBMWDJvNGFlT0h3Q01aTUNLdmRwR0R4MzA5bnh5U3ZwUEp3MUFR?=
 =?utf-8?B?SEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c36d0f4-3353-46a5-677e-08dddc917676
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2025 06:52:27.4502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 44cjZIeS6+Zlfbypt+6kyiGrMw+HqP3ViYW7yZewNrBSBvGoLaI888wl8R3mjxczRBkQ5UI+MEkChjp7bg76mWKXKMi2RmilINK3+7fSV7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6109
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



On 8/13/2025 12:12 PM, Satyanarayana K V P wrote:
> When a buffer object (BO) is allocated with the XE_BO_FLAG_GGTT_INVALIDATE
> flag, the driver initiates TLB invalidation requests via the CTB mechanism
> while releasing the BO. However a premature release of the CTB BO can lead
> to system crashes, as observed in:
> 
> Oops: Oops: 0000 [#1] SMP NOPTI
> RIP: 0010:h2g_write+0x2f3/0x7c0 [xe]
> Call Trace:
>  guc_ct_send_locked+0x8b/0x670 [xe]
>  xe_guc_ct_send_locked+0x19/0x60 [xe]
>  send_tlb_invalidation+0xb4/0x460 [xe]
>  xe_gt_tlb_invalidation_ggtt+0x15e/0x2e0 [xe]
>  ggtt_invalidate_gt_tlb.part.0+0x16/0x90 [xe]
>  ggtt_node_remove+0x110/0x140 [xe]
>  xe_ggtt_node_remove+0x40/0xa0 [xe]
>  xe_ggtt_remove_bo+0x87/0x250 [xe]
> 
> Introduce a devm-managed release action during xe_guc_ct_init() to ensure
> proper CTB disablement before resource deallocation, preventing the
> use-after-free scenario.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Summers Stuart <stuart.summers@intel.com>
> 
> ---
> V4 -> V5:
> - Updated commit message.
> - Fixed similar crash while releasing resources on DGPU after reallocating
> CTB to VRAM from SMEM.
> 
> V3 -> V4:
> - Added new devm release function action_disable_ct()
> 
> V2 -> V3:
> - Moved GGTT validity check to xe_ggtt_invalidate(). (Michal Wajdeczko)
> 
> V1 -> V2:
> - An additional check for validity of GGTT is added in
> xe_gt_tlb_invalidation_ggtt() instead of removing XE_BO_FLAG_GGTT_INVALIDATE
> from memirq_alloc_pages(), __xe_sa_bo_manager_init() and xe_guc_ct_init().
> (Summers Stuart)
> ---
>  drivers/gpu/drm/xe/xe_guc.c    |  5 ++++-
>  drivers/gpu/drm/xe/xe_guc_ct.c | 14 +++++++++++++-
>  drivers/gpu/drm/xe/xe_guc_ct.h |  2 ++
>  3 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 433abc787f7b..a6e46272c0ef 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -705,7 +705,10 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
>  	if (ret)
>  		return ret;
>  
> -	return 0;
> +	ret = devm_add_action_or_reset(xe->drm.dev, xe_guc_action_disable_ct,
> +				       &guc->ct);

hmm, while adding CT disable (aka fini) action from the CT init() function
makes sense, doing that here (due to reinit of the invisible here CT.bo)
looks suspicious and clearly violates the layering ... if this is the only way,
can you move CT related code to xe_guc_ct_init_post_hwconfig() or something?

> +
> +	return ret;
>  }
>  
>  static int vf_guc_init_noalloc(struct xe_guc *guc)
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 3f4e6a46ff16..fe2410091bfc 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -39,6 +39,8 @@ static void receive_g2h(struct xe_guc_ct *ct);
>  static void g2h_worker_func(struct work_struct *w);
>  static void safe_mode_worker_func(struct work_struct *w);
>  static void ct_exit_safe_mode(struct xe_guc_ct *ct);
> +static void guc_ct_change_state(struct xe_guc_ct *ct,
> +				enum xe_guc_ct_state state);
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>  enum {
> @@ -252,12 +254,20 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
>  }
>  ALLOW_ERROR_INJECTION(xe_guc_ct_init_noalloc, ERRNO); /* See xe_pci_probe() */
>  
> +void xe_guc_action_disable_ct(void *arg)

this should be a static function since it shall be used only
by the init()

> +{
> +	struct xe_guc_ct *ct = arg;
> +
> +	guc_ct_change_state(ct, XE_GUC_CT_STATE_DISABLED);
> +}
> +
>  int xe_guc_ct_init(struct xe_guc_ct *ct)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
>  	struct xe_gt *gt = ct_to_gt(ct);
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	struct xe_bo *bo;
> +	int err = 0;
>  
>  	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
>  					  XE_BO_FLAG_SYSTEM |
> @@ -268,7 +278,9 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>  		return PTR_ERR(bo);
>  
>  	ct->bo = bo;
> -	return 0;
> +
> +	err = devm_add_action_or_reset(xe->drm.dev, xe_guc_action_disable_ct, ct);
> +	return err;

since this should be always the last step of the init() there is no
need to split this into assign err variable and then return err

>  }
>  ALLOW_ERROR_INJECTION(xe_guc_ct_init, ERRNO); /* See xe_pci_probe() */
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 18d4225e6502..b9f06ec0db52 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -73,4 +73,6 @@ xe_guc_ct_send_block_no_fail(struct xe_guc_ct *ct, const u32 *action, u32 len)
>  
>  long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct);
>  
> +void xe_guc_action_disable_ct(void *arg);

this shouldn't be a public functions as it takes random argument

> +
>  #endif

