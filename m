Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E6BCA0FF0
	for <intel-xe@archiver.kernel.org>; Sat, 30 Aug 2025 00:24:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4606110E0DB;
	Sat, 30 Aug 2025 00:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NDZXMsdx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CECD10E0DB
 for <intel-xe@lists.freedesktop.org>; Sat, 30 Aug 2025 00:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756513485; x=1788049485;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=q9VukulfKB+KURdRcq4yp+23az/FGllttexreKH4vYA=;
 b=NDZXMsdxHcl7achRFcKFl0ES7MwHkmR1U0E8vwrzKjDAWxh6zcgokt+6
 1wxAoR0Mx1YZ2Sm+W8t/0aOGBvbExxcZPgIn7kceT3iR/igXOBDzL+tQf
 MHANmu5egtX24j5MEAhrfRMaCJxHm+e0tTmQhQcfgZIgygxgUzm/UVaPw
 uv8FmuoPNAFoH9QX3gZagns7DgC82Ahe+GkBQwlyVSbLEJyw+hfFe+fsg
 uQfGyH17JMEcesoIh9ivGHP0jAlDwhSa7Kr2rqLfLA8eFcYv2S4buk3FH
 2fW2VMQwdT/yOZKOI4+U4DH8tFUTlfY1RWe3W04Y9IyQC11yOwOR2XwbP w==;
X-CSE-ConnectionGUID: zhXWak40S8u7J/poDyLmZg==
X-CSE-MsgGUID: Zlat2CFhTI2k7F4kjWvwAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="70237022"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="70237022"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 17:24:44 -0700
X-CSE-ConnectionGUID: d4mly4mITlGoQrBW5r0/ug==
X-CSE-MsgGUID: HzZ7S7bESzOaSybaAhK5NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="175777446"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 17:24:44 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 17:24:43 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 29 Aug 2025 17:24:43 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.55) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 17:24:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u2Ch6fVheN4J4ljL8DRIcA0/ZUEOBhiETfaQ48XzjCBkps2yVfw2z4M2n0g6Eol7ohaQ7klEvg/TiCPXMxNh8heR3LMKp60dt+uAoCpgt6UhXS+/UdVVhDs9ATPYNKUy3L0r8TzRcS0tcX2JWR0MSMtQuczI0zhLzmUd33qbD+WezCiUeuIRbA6PgLvqsRZScoNr7knWEL4t4PAgo94nCBVsJZL616/Jz/XMewM/YaUBlfgMnEZisWe0hMKdqc+ZL+sqQa5Y91Zfi2zydxN3y1TAqY7yAH3BOS9CTiywhzEzSxCy3LBPZ8UE4JVT8nY6sTQzLNSo20xDucs9W6n61A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOjs0EOsR9nYNRC28klluswNaBLRXcLPY6tsEmiAtAU=;
 b=lE1N1p6DdUMTQUM59PD0diwESU9ZN0vZUjrzmGAcbHI0XaZMiQMVj8V4sOufLX0/Losp2yBl/96YbVepF6/JIIpAkc3SLaXesvE6xdJhEEgK4xCNqCkhNb7oqkowY/SbrcDRFJluWE5et6FlpbR+Jf3s89qb+hUF8fr0FGEO7fHkn/HE34sJIHFMhvlmKeq4wZ3Ko8Z9vutFsKgCSPJvoYepsnV0BoQhE7fHbZr6Ee7c+WU/UF9FYczRCNrL3Hp+cOcVlQrkeeg+Jacxyny5KgN6w2VDD74Slota2uzIGUUpWZXa7ir49iXWLLe7p9vR1XuWOMrnS0Y15ucnHsBYVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by PH3PPF4EB9556A6.namprd11.prod.outlook.com (2603:10b6:518:1::d1f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Sat, 30 Aug
 2025 00:24:37 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.9073.021; Sat, 30 Aug 2025
 00:24:37 +0000
Message-ID: <78533ae2-6c5e-4452-8357-07dda6decce8@intel.com>
Date: Fri, 29 Aug 2025 17:24:36 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/xe/guc: Refactor GuC load to use poll_timeout_us()
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Jani
 Nikula" <jani.nikula@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250828-xe-iopoll-v1-0-9832ccd1c8b1@intel.com>
 <20250828-xe-iopoll-v1-3-9832ccd1c8b1@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250828-xe-iopoll-v1-3-9832ccd1c8b1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0103.namprd04.prod.outlook.com
 (2603:10b6:303:83::18) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|PH3PPF4EB9556A6:EE_
X-MS-Office365-Filtering-Correlation-Id: 9275dcbb-6d4d-492d-25a7-08dde75b99e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0VoVTFKYWpYR251ZEgyNEdObUducDRPUWE5VHNMbk01SUs5NUZXL0hDWVI1?=
 =?utf-8?B?MExJTUxhNWZLMEVKdHZsTlorK0owNXNIVkZiN2tYWGp2SFZEaThrb2duUk5j?=
 =?utf-8?B?OStacEs2QWJaOEE5RWJaa1pJL2thUkdxOFEybCtJRGg0TGhXVGd1NnVORGhu?=
 =?utf-8?B?NUo0bHhrOHcxTUNURFNFdndZbzlWUlJJRzZRMDV1WHR5R3VQVW1tNEtzVlRD?=
 =?utf-8?B?SWsyL0l0RHRIYm5lbmZ4TEIvVVZaYSttdkVaNnhvRWJhQlVwMEt2OXpIeThZ?=
 =?utf-8?B?T3NhU0kvTjRCV0VaWld2ZkxJRE5kaFBQaEZzdDVqbDF3bWtZSjF5ZTdwZkhz?=
 =?utf-8?B?U2d3TmFuelBkK25NQnJXNThqSUMxUkZoYVhHalRvS1lYOXpLY1lFME40S1Bq?=
 =?utf-8?B?S29PUXBDZ1UwS1VvNnoyUklEZjAwcVZ5Y2tGald5eU9ieC9aQU5tclp2MnVy?=
 =?utf-8?B?VFBIRWVleEJaSS90WXB1TlhWbzUxMWxqbGpGaVlib2M3Sm54M1RvWjFFNUZ3?=
 =?utf-8?B?Y3ROdjJPVnlZbWc5WFRobVdDejN3bzhObzFKQmliSkNpdW0yVkwvUldtL2Qz?=
 =?utf-8?B?NXhNd3BGcGwvZUN3TUluT0g3TUtmRitHRU12MThDU2hCaVZZL3RoVWpTc2h4?=
 =?utf-8?B?R0pqd1U3cVg5eFJGTGJPVlhTeWdWNTVqWWlJREc0VlFFV3FZQ3ZvZVFqd2NR?=
 =?utf-8?B?TlF4TTFQMkFwcUUyMzIwNEJydzRhaWJucjUzVWJIT2g5c2NLSGxFRUpJb3BN?=
 =?utf-8?B?UFp3V1hNT0VmUEFZVU5LdEplWVg3bkpOVG5vcmRjR1dkb1Q1RWhXZkFYMmNQ?=
 =?utf-8?B?L3FzT0FMbVRobE5vemJ6VDhIQnFyaTROREhxa1dRTUZNR2Y1VXNYMUJJa01r?=
 =?utf-8?B?LzdWZmlNK25PZms5MHZ0N1l3NmxtMndBYzBqU0kxZlhzUWJQNG1CZTVJSWJz?=
 =?utf-8?B?b3ZMeXlHOGlod0tSRzBndE92N3JtMkZnNlg2OHM2MnFoenR2RVUvdGc2RGIy?=
 =?utf-8?B?cjcxdVFEOTBWaUlHU2h1TmRGTkVHTU5USzU3V3p3UG94Y0tRN3FyQ1VvU2Ir?=
 =?utf-8?B?T2ZBckpsUk9nSm1DOTlqMW1rcFNvL2hJNVVXVnVHR3lEaDZhc2c4emdhdDBo?=
 =?utf-8?B?TTA0eVdsZkJESkJidlFwMFFRZ2x1YytjejhRME85Ylk1TzNhSVFQdCtUUVpW?=
 =?utf-8?B?SGZHcVd0MnRIbUp5ZXpVRERLQmtZNFBtbkpNcW9QUG41TkIwYXc5ejFtRlh0?=
 =?utf-8?B?eUV3eGpkdi9Qb0s0VnlIT1RJZzRsV3Ixb01VWjUxQVlvNm9FaDd2ckIzelNl?=
 =?utf-8?B?TjBJbm04SWMyZlFad0VTQ1I4V2hVWXVKdGZObTlpQUxlUXMrNFFpS3Joaktw?=
 =?utf-8?B?VVBmR2sxZ3dXV2R2aWp4NjFCNFA2Q2ZhRTVhODYzNWU1TmE0b3NrU3dCVzNo?=
 =?utf-8?B?eitrY0pwQ05rZWJ3MnhXbEMrZ2dpV1BmeTZBRHIxcnlHUWw2RWtkd1JQVUVM?=
 =?utf-8?B?Z2c2eHFGbUNkaTF6WmsvN1ZqMTB3b0lrakZoeUdWS1dzMlZxWGNUNUhKRUZ2?=
 =?utf-8?B?bngwd1k0cEg4L1dKSTJLNE53dmVBTTFYTlAxUGRDVCt3SEhvMEN5dXN0Tlpl?=
 =?utf-8?B?QVRGbDBRaUJWRHNEdG9LaWVuWHBuVzVxY0d3NkxuMmRLekoxY1BSMk0xQ2lo?=
 =?utf-8?B?R0hoMEVyVENKSUxEY1kxQ3dRZHE2Qmh1RUlaZEdMRktrU1o5Zmd1SkVZaWFO?=
 =?utf-8?B?WFQwTG8wS2ZVelphekp0bjlMeGdkS1VheE15b3V3WFlSMGRqeUtnNEh3SmFk?=
 =?utf-8?B?UTF5Rk1oc3J4K1ZCTkxYZ2hwaXVhY2c2UXc4YUdsNUdCYnRUdTFZTVFkenY1?=
 =?utf-8?B?ZEpySTB3czJFa2owOHpMcWRTTXJtWlA5K0RLY1NYcTYzeUhSYS9JdU9PZ29r?=
 =?utf-8?Q?22u+ciPBGog=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGo5M0UrMUNNazZLcmhnVkE2bWhpeHFqcVdLOTdoZ1NVSmM0SG9XbnVHMGh5?=
 =?utf-8?B?Q0tJNVltbmIrbUNCbWc1blhyUC8xWGU2SlFkSEwxcEg2ZU55V3A2SEZoQnZJ?=
 =?utf-8?B?cTVvTnFkdnQ5cVU5djFmbjNnMzlvTE1CR0JFbUpBUFdjWHNnVlFTMGdaWjFB?=
 =?utf-8?B?dHJIZ0htWnNhNHdxejBINVFVQ05CYndOYXVjK0NUZUh2TTB4QmNOUjFEQjFJ?=
 =?utf-8?B?TS80ZXoyWkYzcmlQSG1HN2MvSTBUc3RCOVNlb0ljR0dzeU55czVjS3NOUEhB?=
 =?utf-8?B?QmpTVDlaYWZzK3hGUFpVWUgvTVpaZmhZQVhUWERnTm5iV0ZEMklRZ2IrdWMz?=
 =?utf-8?B?RnBIb1J4MG95RVljOTJrQ3llVENkZDExaWF3clRlekFHNlEwY1ZDb2RReEVt?=
 =?utf-8?B?emR6cnZ0VERUTTFZbW04ZFJFRGJmUVR0bVRVVTJWREpERnY4ZE5TcXZ6bGlY?=
 =?utf-8?B?OVVTWW5JQmtTT0NFL2l3MUFWenZoNEJ5bnVUMjRVdnJpbVZzSEpoT1owYXpI?=
 =?utf-8?B?VTUzTXdQV1hKd3V5MUJvZHVIY1JRVWlkd1BTY3FtOWVaekRwOXllUkNWeG0r?=
 =?utf-8?B?RkxCNyt4aWhwTTk3dGVlMU5GeWwwUHBYVFN4OGx0azFIemRwTWNabkFLaHgv?=
 =?utf-8?B?dUJZVnRLbnFWcVVwTGFxbGxJV3l1VURkN1R6SXBpck1Ic2twRDlPS3QwbVh3?=
 =?utf-8?B?eVdVSkZ6YXlFWGZRcGdtMmduRnhid0lHL3o4QzAxVG0xNnlERmZ1YzZUWEcy?=
 =?utf-8?B?Z0NsT2l6Y2lLOFBsR00vMFFwdExabWlxM3o5R1hUQWZndkNxSkI1SC8yMmsy?=
 =?utf-8?B?UWdHS3dNdWFPTG1jbktBVTJGcUJQb2hnNy83dFdZbTBaZWk0VE5RNXNkV1lT?=
 =?utf-8?B?ak5CRTJyeWRxUjJ6Um0yeWhvb1BweXBIcVM4S2FEUEdNNnMvbStqeGNabXFh?=
 =?utf-8?B?NXVuQ0VOT09JQ0ZXdU9ncFBFU1A1SE1LUTZ0SHZYcTZtNzhCdjFOZjFlaS9j?=
 =?utf-8?B?Q28vMU8ralFTYllNMU1TclYybHczMFlKU0tKQUhVNkhsS21PRnBmN1NUN2pH?=
 =?utf-8?B?aDFZaE4xSkpQMnpkdytnUit6empHbVNsQ0RpSklVSnhLZFdBaHFEaTJsMzd5?=
 =?utf-8?B?YnRJdDRTSVExNlJsNGtsbGlYbkNBY3RVNjdtb0lpZzlIc2RZNE5MWGZ4Mkk2?=
 =?utf-8?B?bkVjYXZpZkxvVnhua2tBbEs0RlBxT0t2bDMwNW91OVZiUVAxOGxGMXNMb2xH?=
 =?utf-8?B?VkQvMlVpVDBBZEVtOUNlMWN1aWdqZjRzcnZSMDFndlpubnE4OTB6K3oyWHAw?=
 =?utf-8?B?OHMyRU9EajE5ZVQvb3RuK3lpclFhcTJZUUJHWGp5WWNsMGJXb2hYZE5iTCtE?=
 =?utf-8?B?enRZazhyWk0vV3d3cmpVUFJXK2l2OGlPV1F0T1B2RnFGdW02aFB5YXVNSkpS?=
 =?utf-8?B?SzAvN3F6N2RLUWY3dFdEQkwzNDVuS1luemFUVWI5ZDlIbUJvQWdHL25JYllC?=
 =?utf-8?B?V0RuS2NLaHM0MHZQeWRvK0J5ZUhYZjVWZU1PdnNVME1RelhvNm9WQVh3RjdE?=
 =?utf-8?B?RlhGVE1zVjY4YzR3YTVFR2RaeTEvaUxGOU00UHN6Vi83c1NzS0RZb0drVXhw?=
 =?utf-8?B?cnk2amdlT0FtNnRUUlFvVzg3NTBnVTVTRVg1RFA2VzNYZkRHR1haUUVXUlpU?=
 =?utf-8?B?bHBDQlVYSVQ4RG5HeVllZmEydk5jMGxpbC9mS2ptaklhS1RMb1BsdUxRZS9K?=
 =?utf-8?B?TXFzaVlqYlhCQnRQVWlYQ1FKV09yeW1rS2JzSEVLNm9IK04yRURkcjlEN04w?=
 =?utf-8?B?M3RhTDVmMVFtWkdoUFFuTGhweG1CN3V2N1lTY083SXBxVXpwNnA5cThtNXA1?=
 =?utf-8?B?Y1hHL3lnbDlrK3hBeUNvcXJYMGhzTFliV0JBZGdla3crSFdmVkNEZk5odmVV?=
 =?utf-8?B?SmFPc0prRjMxZmxVcmlBa2xWd3puU1FtZHBDdHVmcUt3RUpYOE1tMUJlS3Fl?=
 =?utf-8?B?UHRnOUpjR1FJMDFZaVRadUJCblVtUzV5VWRjeUhrUmRuNFc3dHp2MW9WTVFz?=
 =?utf-8?B?c3FlempHNW85RWwvclFCM3RWZ1J4VHZsWEkwNm15b3V3TytWWXBsVjdoWGZo?=
 =?utf-8?B?d2pISm5oRmVYazl6MHdzN3ArMWt3OEgwMzlFSDVVYlNRRE1QU3Y0SGQ3TWgx?=
 =?utf-8?B?cGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9275dcbb-6d4d-492d-25a7-08dde75b99e0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2025 00:24:37.0030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2z6BizjGfByYn+N0cjfG5ATrJtBT5dNnIpEoBPE5BXhsq5u4sd73YZfeOwCZBlgq/T6hFmvn/43EgBD73bMzI8bhzbxIOGszoTDra3eS/Mg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF4EB9556A6
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

On 8/28/2025 3:04 PM, Lucas De Marchi wrote:
> Currently there are 2 wait loops for loading GuC: one in
> xe_mmio_wait32_not() and one guc_wait_ucode(). Now that there's a
> generic poll_timeout_us(), refactor the code to use that and be more
> readable.
>
> Main change in behavior is that there's no exponential wait anymore:
> that is now replaced by a 10msec retry.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c | 269 ++++++++++++++++++++------------------------
>   1 file changed, 125 insertions(+), 144 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 37d06c51180cb..130492405a982 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -5,6 +5,7 @@
>   
>   #include "xe_guc.h"
>   
> +#include <linux/iopoll.h>
>   #include <drm/drm_managed.h>
>   
>   #include <generated/xe_wa_oob.h>
> @@ -981,21 +982,103 @@ static int guc_xfer_rsa(struct xe_guc *guc)
>   	return 0;
>   }
>   
> +static s32 guc_pc_get_cur_freq(struct xe_guc_pc *guc_pc)
> +{
> +	u32 freq;
> +	int ret = xe_guc_pc_get_cur_freq(guc_pc, &freq);
> +
> +	return ret ? ret : freq;
> +}
> +
>   /*
> - * Check a previously read GuC status register (GUC_STATUS) looking for
> - * known terminal states (either completion or failure) of either the
> - * microkernel status field or the boot ROM status field. Returns +1 for
> - * successful completion, -1 for failure and 0 for any intermediate state.
> + * Wait for the GuC to start up.
> + *
> + * Measurements indicate this should take no more than 20ms (assuming the GT
> + * clock is at maximum frequency). However, thermal throttling and other issues
> + * can prevent the clock hitting max and thus making the load take significantly
> + * longer. Allow up to 3s as a safety marging in norma builds. For
margin, normal

> + * CONFIG_DRM_XE_DEBUG allow up to 10s to account for slower execution, issues
> + * in PCODE, driver, fan, etc.
> + *
> + * Keep checking the GUC_STATUS every 10ms with a debug message every 100
> + * attempts as a "I'm slow, but alive" message.
> + *
> + * but emit a warning if greater than
> + * 200ms.
Line wrapping is odd here!

> + *
> + * However, bugs anywhere from KMD to GuC to PCODE to fan failure in a CI farm
> + * can lead to even longer times. E.g. if the GT is clamped to minimum frequency
> + * then the load times can be in the seconds range. So the timeout is increased
> + * for debug builds to ensure that problems can be correctly analysed. For
> + * release builds, the timeout is kept short so that users don't wait forever to
> + * find out that there is a problem. In either case, if the load took longer
> + * than is reasonable even with some 'sensible' throttling, then flag a warning
> + * because something is not right.
This paragraph is just a re-wording of the previous one. No need for 
both. Although maybe combine rather than drop one because the former has 
more detail while the latter has more explanation.

John.

>    */
> -static int guc_load_done(u32 status)
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +#define GUC_LOAD_TIMEOUT_SEC	10
> +#else
> +#define GUC_LOAD_TIMEOUT_SEC	3
> +#endif
> +#define GUC_LOAD_TIME_WARN_MSEC	200
> +
> +static void print_bootrom_ukernel_err(struct xe_gt *gt, u32 bootrom, u32 ukernel)
>   {
> -	u32 uk_val = REG_FIELD_GET(GS_UKERNEL_MASK, status);
> -	u32 br_val = REG_FIELD_GET(GS_BOOTROM_MASK, status);
> +	switch (bootrom) {
> +	case XE_BOOTROM_STATUS_NO_KEY_FOUND:
> +		xe_gt_err(gt, "invalid key requested, header = 0x%08X\n",
> +			  xe_mmio_read32(&gt->mmio, GUC_HEADER_INFO));
> +		break;
> +	case XE_BOOTROM_STATUS_RSA_FAILED:
> +		xe_gt_err(gt, "firmware signature verification failed\n");
> +		break;
> +	case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
> +		xe_gt_err(gt, "firmware production part check failure\n");
> +		break;
> +	}
> +
> +	switch (ukernel) {
> +	case XE_GUC_LOAD_STATUS_HWCONFIG_START:
> +		xe_gt_err(gt, "still extracting hwconfig table.\n");
> +		break;
> +	case XE_GUC_LOAD_STATUS_EXCEPTION:
> +		xe_gt_err(gt, "firmware exception. EIP: %#x\n",
> +			  xe_mmio_read32(&gt->mmio, SOFT_SCRATCH(13)));
> +		break;
> +	case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
> +		xe_gt_err(gt, "illegal init/ADS data\n");
> +		break;
> +	case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
> +		xe_gt_err(gt, "illegal register in save/restore workaround list\n");
> +		break;
> +	case XE_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR:
> +		xe_gt_err(gt, "illegal workaround KLV data\n");
> +		break;
> +	case XE_GUC_LOAD_STATUS_INVALID_FTR_FLAG:
> +		xe_gt_err(gt, "illegal feature flag specified\n");
> +		break;
> +	}
> +}
>   
> -	switch (uk_val) {
> +/*
> + * Check GUC_STATUS looking for known terminal states (either completion or
> + * failure) of either the microkernel status field or the boot ROM status field.
> + *
> + * Returns 1 for successful completion, -1 for failure and 0 for any
> + * intermediate state.
> + */
> +static int guc_load_done(struct xe_gt *gt, u32 *status, u32 *tries)
> +{
> +	u32 ukernel, bootrom;
> +
> +	*status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
> +	ukernel = REG_FIELD_GET(GS_UKERNEL_MASK, *status);
> +	bootrom = REG_FIELD_GET(GS_BOOTROM_MASK, *status);
> +
> +	switch (ukernel) {
>   	case XE_GUC_LOAD_STATUS_READY:
>   		return 1;
> -
>   	case XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH:
>   	case XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH:
>   	case XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE:
> @@ -1011,7 +1094,7 @@ static int guc_load_done(u32 status)
>   		return -1;
>   	}
>   
> -	switch (br_val) {
> +	switch (bootrom) {
>   	case XE_BOOTROM_STATUS_NO_KEY_FOUND:
>   	case XE_BOOTROM_STATUS_RSA_FAILED:
>   	case XE_BOOTROM_STATUS_PAVPC_FAILED:
> @@ -1025,165 +1108,63 @@ static int guc_load_done(u32 status)
>   		return -1;
>   	}
>   
> -	return 0;
> -}
> +	if (++*tries >= 100) {
> +		struct xe_guc_pc *guc_pc = &gt->uc.guc.pc;
>   
> -static s32 guc_pc_get_cur_freq(struct xe_guc_pc *guc_pc)
> -{
> -	u32 freq;
> -	int ret = xe_guc_pc_get_cur_freq(guc_pc, &freq);
> +		*tries = 0;
> +		xe_gt_dbg(gt, "GuC load still in progress, freq = %dMHz (req %dMHz), status = 0x%08X [0x%02X/%02X]\n",
> +			  xe_guc_pc_get_act_freq(guc_pc),
> +			  guc_pc_get_cur_freq(guc_pc),
> +			  *status, ukernel, bootrom);
> +	}
>   
> -	return ret ? ret : freq;
> +	return 0;
>   }
>   
> -/*
> - * Wait for the GuC to start up.
> - *
> - * Measurements indicate this should take no more than 20ms (assuming the GT
> - * clock is at maximum frequency). However, thermal throttling and other issues
> - * can prevent the clock hitting max and thus making the load take significantly
> - * longer. Allow up to 200ms as a safety margin for real world worst case situations.
> - *
> - * However, bugs anywhere from KMD to GuC to PCODE to fan failure in a CI farm can
> - * lead to even longer times. E.g. if the GT is clamped to minimum frequency then
> - * the load times can be in the seconds range. So the timeout is increased for debug
> - * builds to ensure that problems can be correctly analysed. For release builds, the
> - * timeout is kept short so that users don't wait forever to find out that there is a
> - * problem. In either case, if the load took longer than is reasonable even with some
> - * 'sensible' throttling, then flag a warning because something is not right.
> - *
> - * Note that there is a limit on how long an individual usleep_range() can wait for,
> - * hence longer waits require wrapping a shorter wait in a loop.
> - *
> - * Note that the only reason an end user should hit the shorter timeout is in case of
> - * extreme thermal throttling. And a system that is that hot during boot is probably
> - * dead anyway!
> - */
> -#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> -#define GUC_LOAD_RETRY_LIMIT	20
> -#else
> -#define GUC_LOAD_RETRY_LIMIT	3
> -#endif
> -#define GUC_LOAD_TIME_WARN_MS      200
> -
>   static void guc_wait_ucode(struct xe_guc *guc)
>   {
>   	struct xe_gt *gt = guc_to_gt(guc);
> -	struct xe_mmio *mmio = &gt->mmio;
>   	struct xe_guc_pc *guc_pc = &gt->uc.guc.pc;
> -	ktime_t before, after, delta;
> -	int load_done;
> -	u32 status = 0;
> -	int count = 0;
> +	u32 before_freq, act_freq, cur_freq;
> +	u32 status = 0, tries = 0;
> +	ktime_t before;
>   	u64 delta_ms;
> -	u32 before_freq;
> +	int ret;
>   
>   	before_freq = xe_guc_pc_get_act_freq(guc_pc);
>   	before = ktime_get();
> -	/*
> -	 * Note, can't use any kind of timing information from the call to xe_mmio_wait.
> -	 * It could return a thousand intermediate stages at random times. Instead, must
> -	 * manually track the total time taken and locally implement the timeout.
> -	 */
> -	do {
> -		u32 last_status = status & (GS_UKERNEL_MASK | GS_BOOTROM_MASK);
> -		int ret;
>   
> -		/*
> -		 * Wait for any change (intermediate or terminal) in the status register.
> -		 * Note, the return value is a don't care. The only failure code is timeout
> -		 * but the timeouts need to be accumulated over all the intermediate partial
> -		 * timeouts rather than allowing a huge timeout each time. So basically, need
> -		 * to treat a timeout no different to a value change.
> -		 */
> -		ret = xe_mmio_wait32_not(mmio, GUC_STATUS, GS_UKERNEL_MASK | GS_BOOTROM_MASK,
> -					 last_status, 1000 * 1000, &status, false);
> -		if (ret < 0)
> -			count++;
> -		after = ktime_get();
> -		delta = ktime_sub(after, before);
> -		delta_ms = ktime_to_ms(delta);
> -
> -		load_done = guc_load_done(status);
> -		if (load_done != 0)
> -			break;
> +	ret = poll_timeout_us(ret = guc_load_done(gt, &status, &tries), ret,
> +			      10 * USEC_PER_MSEC,
> +			      GUC_LOAD_TIMEOUT_SEC * USEC_PER_SEC, false);
>   
> -		if (delta_ms >= (GUC_LOAD_RETRY_LIMIT * 1000))
> -			break;
> -
> -		xe_gt_dbg(gt, "load still in progress, timeouts = %d, freq = %dMHz (req %dMHz), status = 0x%08X [0x%02X/%02X]\n",
> -			  count, xe_guc_pc_get_act_freq(guc_pc),
> -			  guc_pc_get_cur_freq(guc_pc), status,
> -			  REG_FIELD_GET(GS_BOOTROM_MASK, status),
> -			  REG_FIELD_GET(GS_UKERNEL_MASK, status));
> -	} while (1);
> +	delta_ms = ktime_to_ms(ktime_sub(ktime_get(), before));
> +	act_freq = xe_guc_pc_get_act_freq(guc_pc);
> +	cur_freq = guc_pc_get_cur_freq(guc_pc);
>   
> -	if (load_done != 1) {
> +	if (ret) {
>   		u32 ukernel = REG_FIELD_GET(GS_UKERNEL_MASK, status);
>   		u32 bootrom = REG_FIELD_GET(GS_BOOTROM_MASK, status);
>   
> -		xe_gt_err(gt, "load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz), done = %d\n",
> -			  status, delta_ms, xe_guc_pc_get_act_freq(guc_pc),
> -			  guc_pc_get_cur_freq(guc_pc), load_done);
> -		xe_gt_err(gt, "load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
> +		xe_gt_err(gt, "GuC load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz)\n",
> +			  status, delta_ms, act_freq, cur_freq);
> +		xe_gt_err(gt, "GuC load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
>   			  REG_FIELD_GET(GS_MIA_IN_RESET, status),
>   			  bootrom, ukernel,
>   			  REG_FIELD_GET(GS_MIA_MASK, status),
>   			  REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
>   
> -		switch (bootrom) {
> -		case XE_BOOTROM_STATUS_NO_KEY_FOUND:
> -			xe_gt_err(gt, "invalid key requested, header = 0x%08X\n",
> -				  xe_mmio_read32(mmio, GUC_HEADER_INFO));
> -			break;
> -
> -		case XE_BOOTROM_STATUS_RSA_FAILED:
> -			xe_gt_err(gt, "firmware signature verification failed\n");
> -			break;
> -
> -		case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
> -			xe_gt_err(gt, "firmware production part check failure\n");
> -			break;
> -		}
> -
> -		switch (ukernel) {
> -		case XE_GUC_LOAD_STATUS_HWCONFIG_START:
> -			xe_gt_err(gt, "still extracting hwconfig table.\n");
> -			break;
> -
> -		case XE_GUC_LOAD_STATUS_EXCEPTION:
> -			xe_gt_err(gt, "firmware exception. EIP: %#x\n",
> -				  xe_mmio_read32(mmio, SOFT_SCRATCH(13)));
> -			break;
> -
> -		case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
> -			xe_gt_err(gt, "illegal init/ADS data\n");
> -			break;
> -
> -		case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
> -			xe_gt_err(gt, "illegal register in save/restore workaround list\n");
> -			break;
> -
> -		case XE_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR:
> -			xe_gt_err(gt, "illegal workaround KLV data\n");
> -			break;
> -
> -		case XE_GUC_LOAD_STATUS_INVALID_FTR_FLAG:
> -			xe_gt_err(gt, "illegal feature flag specified\n");
> -			break;
> -		}
> -
> +		print_bootrom_ukernel_err(gt, bootrom, ukernel);
>   		xe_device_declare_wedged(gt_to_xe(gt));
> -	} else if (delta_ms > GUC_LOAD_TIME_WARN_MS) {
> -		xe_gt_warn(gt, "excessive init time: %lldms! [status = 0x%08X, timeouts = %d]\n",
> -			   delta_ms, status, count);
> -		xe_gt_warn(gt, "excessive init time: [freq = %dMHz (req = %dMHz), before = %dMHz, perf_limit_reasons = 0x%08X]\n",
> -			   xe_guc_pc_get_act_freq(guc_pc), guc_pc_get_cur_freq(guc_pc),
> -			   before_freq, xe_gt_throttle_get_limit_reasons(gt));
> +	} else if (delta_ms > GUC_LOAD_TIME_WARN_MSEC) {
> +		xe_gt_warn(gt, "GuC load: excessive init time: %lldms! [status = 0x%08X]\n",
> +			   delta_ms, status);
> +		xe_gt_warn(gt, "GuC load: excessive init time: [freq = %dMHz (req = %dMHz), before = %dMHz, perf_limit_reasons = 0x%08X]\n",
> +			   act_freq, cur_freq, before_freq,
> +			   xe_gt_throttle_get_limit_reasons(gt));
>   	} else {
> -		xe_gt_dbg(gt, "init took %lldms, freq = %dMHz (req = %dMHz), before = %dMHz, status = 0x%08X, timeouts = %d\n",
> -			  delta_ms, xe_guc_pc_get_act_freq(guc_pc), guc_pc_get_cur_freq(guc_pc),
> -			  before_freq, status, count);
> +		xe_gt_dbg(gt, "GuC load: init took %lldms, freq = %dMHz (req = %dMHz), before = %dMHz, status = 0x%08X\n",
> +			  delta_ms, act_freq, cur_freq, before_freq, status);
>   	}
>   }
>   
>

