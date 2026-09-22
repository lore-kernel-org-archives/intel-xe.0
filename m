Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37ACC982F1
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 11:11:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F0A10E6A6;
	Tue, 22 Sep 2026 11:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nlptDsmd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2386510E6A6
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 11:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790075502; x=1821611502;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7bv+66E5wClgOM/cjMsYqDjfSbbzT4HDfmWrzlj1Q1M=;
 b=nlptDsmdhwHC37YnnoUI7djRb/uBlTh30FTcYFJU5fko0A5D36REEQ8t
 A6A8vAClSx4fBMzNdirM7UzPV/qmcI4zITnww8qEuSC1FMo8x59cMnpi2
 v5mFjYv9OvFimIAnkXwNFovm0eUjGFILDwwOJwp4KiD/JSnZ6VHWj44Aq
 C3IxStz68c9QRyC2nircU3zmuXFeSu2nQzV/ey9gppB2sMYwV2LThFmHr
 EaReUPby1V3h2IFm4PGFUdS1Yf31FtLiDbCg/IW1lLqG4SWDws2yjTVAp
 V9wCExRvkpMtCF0DnW1avOekwahTZqokMkFRXQyUPGTj3JTTdOWfUz8Tm w==;
X-CSE-ConnectionGUID: SxXgEFfESVqyeHp2k1GJ+g==
X-CSE-MsgGUID: G2Zp+pVdQpqXHknDb5zkbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="101256054"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="101256054"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 04:11:42 -0700
X-CSE-ConnectionGUID: Q6Mcfk7gS5G/XKGUia65nw==
X-CSE-MsgGUID: w4caFuwIT+29sELJgsbgRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="272287341"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 04:11:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 04:11:41 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 04:11:41 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.59) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 04:11:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mtpqDX0HH/JfemC+2sKwytkieTLRNvQd4yQ3Am2kzq8yXrIYZuuzZwNGm9YfUCynKQLvfoCY49zUjoEqyzQ+jP48KwepEJCNGZE5NQPG66+NjNwXozRrnPVsAMBrbXXbqV950jZrmUPYEyfMzev4Rc4OQwmwUofHrRiOrndkn/osZpKCNgwELC7b8S5LFB7V5LNUL24y/FyLwNFjtMc28akl0BhdUTNFJDK8izsrXcsqsDP7RhbdLIUojnXfF88TDPgT1go8j6puL1kWOi0oEVtfvNiijzQ2XDi40MTLoEOPc8c6cuchscQydEARGDlbG5KhP516G5f5aZqPJOO/og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+bUW/ei7BVRZzRPL3l6NdskC4kvTGIWWdaqlgOiJOXI=;
 b=nGHCr4AyrfmU3S3iAQ9SImQpI5buPZB5u8HU/oPPPyo8uERpvyJFdN3jX1FqDaeChzfmVefp8yMsN/1GONUH7jYWjaQOhZDlnoV4ienPxCRLUCdzQa3bqVwXKrZVVZr9hscLO1HoWZ7DB03fxQX7aLIRETM6UIgIX1LOUzw9b/mw7szZyMHKNE7ev9JnEQb2Qlaxz7LQfdjpTASPHb5VZcUW4GI0IxbIuPriENCp35EZ1oWvT3AzGXrZX22buT/Gz8U/8Qi46uuKRXGsVVkIihzSgSrtCxGXyd/RdmCveB79zmvwd3ogoNoEHT6kuOKlr0GGD8aQHt+ln7vBmRtptA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by LV3PR11MB8507.namprd11.prod.outlook.com (2603:10b6:408:1b0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 11:11:39 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 11:11:39 +0000
Message-ID: <f5c7468f-77f6-418c-b85b-c0e80007e6f3@intel.com>
Date: Tue, 22 Sep 2026 13:11:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 07/10] drm/xe/sysctrl: Replace FIELD_GET() with
 REG_FIELD_GET()
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <anoop.c.vijay@intel.com>
References: <20260921133927.128281-12-mallesh.koujalagi@intel.com>
 <20260921133927.128281-19-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260921133927.128281-19-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA3PEPF00000522.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::66c) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|LV3PR11MB8507:EE_
X-MS-Office365-Filtering-Correlation-Id: 91fe77bc-94f0-4ce4-9cd4-08df189a461e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: NNDx6kupH4lhqhX6UPIIPeni54Ja9pTCq0aAQbtnywGysHwcbhlUbVqIWNUgeQTodOYKRPI1z/s/XXjiqffWe67TpPx6RVaDkvGkkbfMY8HTcCcyrkMVwsM4AZ0ya3emEUUTp3gkMxBUdIJ/Hi0wu+SLp4JRGOT5uUVAPu0IMpn8ss+bNdV94QzwEif8DQB2dGnUEU2xBEnWtKEV/4lWj8gXrpX/z5bPvZW6hlpJOgapC6C1Ehn2baEBHYU8VF2oEpnS4EGBNXhYCXuXYFhDrldS0ffiqf0u549pwFwckhKjnxjFwTY4K2MYrsH0TBdNla0XcMYXtCliWavWmUCSpzvoKHKjfa25RaDsjf8i8fMu12M2FXq64wYNKebf3Q2NeWIlg4ZmGOZ8mN+PSLgdLmeI6Uu+6S1+Ynh+K07FNx3AbEWM69vv1kBkzPmLnCVGa38fk+0T0WI3yQxYpCJBFFymkK1qvFreuto27ZO8nOEkd47zl2p9RAxD862QO5CZcqjPN7MFz40On8qxFfNoKIbgUwWasrTUmiu5WN2STsZzkqt0RzmgMExOnHHsdIDPVDX/TuGRVdZAVdfjnczTrFP7yDRGYb4OoShZdHAADDHgBwEK22b6sPYRg0BbzZ21pXmc8SuxHD0+FNlLrRNsGO4j7w+d2M93hP3vmeeCSN8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2hhV0pwSkU1SlowTFIzcTlSRTNPVW45VUN2VWNRZW1aWGZudFlaRVV3bWl3?=
 =?utf-8?B?T3hZRHlrNy9yRURrbDlzQTBTVFRoTWwzMld1a3Z3Q1R2Ulh1OEo5QXZZVmRD?=
 =?utf-8?B?QXE2NVJnSWFpWTdpalo1UFY5NCtzMnJZNFI3TmJ1Mk5kSUJ3TENvbGhkaS91?=
 =?utf-8?B?dGFtc2lkVjUrZElQelJxQnovVmRvSFlPQUVScXR5anFDTDRqaktTaGNBSldH?=
 =?utf-8?B?a043VHBPUE1lRVBMbDU5dVk2NkQ0SW9pdXlhRW9WbWJ6bTU4ZGpCZ0gvd0Ew?=
 =?utf-8?B?N3ltb1ZycmRhVmVRSzlvVTd5ZlE2SE5rT0dzN3RkSHpXWHNQMXRTNy9kbThM?=
 =?utf-8?B?d2NVVTZ0UEFpc2IzejVhTitzRUVXQWNMRU1wb3JnQWR4SS9SNGp0VGhQdEda?=
 =?utf-8?B?dUJPY29Xd3l3aGU2T1VzY3haMUc5OGZYSVhiMVQ0NE9DS0FNTTAzYVFteEc2?=
 =?utf-8?B?Z2wvcEJiL1VEVTlYRVl4ZGdKTjBoR25GSnBhU3JHelBwMmVEVGdnd3lmSmFK?=
 =?utf-8?B?T0pLcHJYZ2gxYjBNajg5VmY1UkhRS3JIUHdXMm9TUkVIY0REdlkrc0VFMysw?=
 =?utf-8?B?OE84a0VaczVuQm0xQ1I2VC9EbWpmQ2hpcVNld1kvVWJ3Q1BudHhZdHljcDNV?=
 =?utf-8?B?enZJY3FEMmErMEhMZUN6dHBFb1dqbjFUNUlRNHhsOCtIRFJ5eUhaTVh5RVhH?=
 =?utf-8?B?VEFsT0pIdEFpMzhqNk1LRUw2WTNQV1l6NWNUQWR2eGtEdlV0VzIybWJHaFll?=
 =?utf-8?B?bWFVTjRNVnRuNlIzZ0wwSE95ZTM5TGVxbmxwRlRXSEdnZ3ZHU2RTT2tCSE1L?=
 =?utf-8?B?dzNCWFVRRHEzbGhibytRWlp3UGdtcHg4L1BJeU9nbkU0Um9MZ1ZyYmFGOGlh?=
 =?utf-8?B?N0I4OUt4ZzBUd3VCd0J2ajR0UGdiN0Q3K2FYNWdzbFA1ZTlCbTl2SHBydGFP?=
 =?utf-8?B?ZjBiYlNtYWpaTU5SL2ZBNFY3bG5rRFhpNTNBK0VTWjZuTGo2SG9HVGR1ZEVs?=
 =?utf-8?B?bFQvOUYzNTZaTWh0dmNhUHAwcldyUHQrWW00T1VJZG9nblp5bm5lMmNReWlI?=
 =?utf-8?B?QkVHYm5ERk5hZzBHenRCMjNQaG9OcmhJU1FTZ1pCVEJ6eEdsM1lyZFBuZU5S?=
 =?utf-8?B?TmUyMEVXK3hBK3QvM1Z2Z2MxdXo0aWJRaWNGZXBheXpQL0tCaEtrZ2FJVjJr?=
 =?utf-8?B?bXg4ZHRvVGJaRVpONkFGeUVHeC9qMHlDa2VITEdZWVVRR2xXQVlHUTRLRnhN?=
 =?utf-8?B?d3MvZXRtUSszV0lPQ0xzZzR3QjhFb01ORnhUVzlhV0I4S0Y1NndkU3MxRGNP?=
 =?utf-8?B?SlhiZXBOVkg2OW0zbEoxalBGY0NlcytBLzhhS2JiT1pYYk12QXc3RTJ1bHRD?=
 =?utf-8?B?NG42K3FBZDlOSCswa2NqdkIwbEsvcWs2YWQwT25LcGVSVHRIODJ0cFBjajZ1?=
 =?utf-8?B?Q1AyRlFzM1VvN2c5djZGVkx2TWc2Y21wZnpqRXpUdEQ0bWNRSi94VlBCcTQz?=
 =?utf-8?B?SzcxR1RTbEVZOGQ2VmFaTzlFRzZtWVdOdVZrV0pCTk8xcy95eExuWWNIQ0tH?=
 =?utf-8?B?ekE5c2kzM3lPa3poSElJVUtSM1JzTmZqVHptN09qdTIwa1dPejFsL2R3Z0pQ?=
 =?utf-8?B?YVh0dW1pTGM5YnYzUThqZzBEeHhGZkNpRE9ScjE1NWVuZk0yOGVJVmU4VUZM?=
 =?utf-8?B?dktaSUd5WnZYRmlUc054RHI5Z3hPVHNldGEzS2dPczV1bU9rZ2lzU0l2R04w?=
 =?utf-8?B?QnFWUTlaY294U2cweWJ1NUk1M2NhSGFPSDNnUSthelQyKzNFNlJGd0xSeFZv?=
 =?utf-8?B?cDJxRXRrMTZiU3RwZW92bzM5MTVJV1FBeldtM2sxcXo0ajVBK3dDTTJHeEpj?=
 =?utf-8?B?RGRRQWlaR3VNRVNQb1krMGxPUXpsa3BHdVJRaEZmbGJrYVFmUHJUYmRBZDRR?=
 =?utf-8?B?M3dZTVNyUEdqbGY0TEZrU0pZQytGUTBUVUtUWU40dE5mT1pESU9KZXQ5WmhC?=
 =?utf-8?B?enEvWm90YWRBUzFoNGI4OEhNUnhCSEUrQzVHajdkL0F0MnBzcm9YR3MvWUtI?=
 =?utf-8?B?UTBmWUJLRkJMbzg4WlRRSmdrWHlBVUZRalRJc2VTdGgxbGcwUmNNN2RxU1Jr?=
 =?utf-8?B?QnhzdXNkSkxMMnNhaVBnVUhLY1hXc3lRZU1Xcy9ZSFF4Z1p3Mk5aeHBPZmts?=
 =?utf-8?B?MUlkU2VXR2U2citUNWxuU2hCV1FPcXlPa0c3WkszdDhpMHJBUWVqYUZoMGhI?=
 =?utf-8?B?YTY4ZW56VE1rcitWektlOHlNOUVsZ3pxTlRrOVBLdVdyazRxOUVtejRua2Fi?=
 =?utf-8?B?VDZ4QWtqVkhVUkVQSloxUU8wOXBtbkhtRi9BdXRMcEpFV1FzZHB0SXlpZ0Y2?=
 =?utf-8?Q?vQejgC4L8jDH7XO4=3D?=
X-Exchange-RoutingPolicyChecked: O5X/KQ8aNlW3ElyZZr13howqP1z/8bYCQk/o+2d4YLhqcqeZx6dr4m2RlBjq7eD/DABJ1Q3y8n/CLp5ihnLeeicXPTPG0RDrky1M7abV6lDEjBy7o0uyYxxI5Mmvk0cWXF/dyZ2blizHzB19baHxA1/48mQWLYcgdvYRfMpBgKu8gPMhSWlp5Cfc/7XCRfZOSr5v++a+cMki5LgLmNoPZKJLC8KTKQXssOYObUlXhSPmMsW55DqB6Klfk/7F3FO8GDZ/UYnt9LPa+MYeEddBwK6h3RMICJRMERhn0CjeAw+eXWeOCQ8w8UD03vgaOlFR8qLI7phTSEIL1mBHu5lZXQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 91fe77bc-94f0-4ce4-9cd4-08df189a461e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 11:11:39.3763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yXI61GobmasTLy754h78+AjIlKqs1hehFVpSCOhWpW2irqlaxfdh6vsNtW1fWWbX8V3spy3TjEk16D23nrM0k9jwvl8n81RNXVgNUgPDIes=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8507
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



On 9/21/2026 3:39 PM, Mallesh Koujalagi wrote:
> Use REG_FIELD_GET() and REG_FIELD_PREP() when working with fields
> from SysCtrl and application headers. This better reflects that
> the masks represent register-style bitfields and improves consistency.
> 
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


