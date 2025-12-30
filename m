Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6C3EE4990
	for <intel-xe@archiver.kernel.org>; Tue, 30 Dec 2025 19:31:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39BCE10E1E7;
	Tue, 30 Dec 2025 19:31:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dz1s6OuI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E9C10E1E7
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Dec 2025 19:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767123107; x=1798659107;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6XtgCUgZeR/GLP+yK+x7if2I0XPiGZmT4+Densxo3tg=;
 b=Dz1s6OuIkAhR1d5GborjTryKO3MMaVQh2dBx5LAVghDISXB3XO6MPsgg
 LsPIelYdiSC2qmNnvVjy8PUHjD1xUBjMqUICwz//t40sCUdJv8VCmFHXl
 eugerPApti+0mrXrDeGmTeGQZ2j6lGpQmgaFLCvsq00Pbs4JmK0qb3/DE
 W0bbGrdijy1l5KASm8u+90YdHivebN0B9kqU0WjZ5jQ7JS4o59WzaSf2B
 +ZX2l8UM5bEnIrZGIAOTnjU0yQhCTZ3L95fkRYgq6TY9mGAG0R0WALMDt
 XtL+qTzU0iTC8eV6zURB3YDvpFhG3TDNGERs2t1Wp+x5lMIVNmobyc72x Q==;
X-CSE-ConnectionGUID: qIMUue0gSLKxcsGtja5u2g==
X-CSE-MsgGUID: gCW3Da5IRfybRzLR25Cabg==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="68781356"
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; d="scan'208";a="68781356"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 11:31:47 -0800
X-CSE-ConnectionGUID: vpXG+VWTQwOxqbg17rc3aA==
X-CSE-MsgGUID: jyngE8tlQwKqubN73vcHdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; d="scan'208";a="202233178"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 11:31:47 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 30 Dec 2025 11:31:46 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 30 Dec 2025 11:31:46 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.20) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 30 Dec 2025 11:31:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWlgZfRH3KpGg1CPpM/8wd2WbB3R+Zuhsy2+C1jvLTPGieY2+B3A7W7wpxWkMNciGjgisRugHX89FFsVvYg9ohZsz3SJBRkbFB0MPfcSsp/39faW1Q+bMzvHsk2+x5MzT39VL0pG1yl0y9WMUObGYbuennwURMqIc3ljBds85s6zGyUoYazmBtCn6DibKGUgIy0qoWFEmuefvpFA/2s1qrrTxc9eZ5OCft7IxGydLfkpZ1MUwPxRGNMCyS2Hg3NKHFDd9Od+XYd/1HJQ9KrMN+zAOIDm2KVKnGQbvx8Dfjdnq4bg3pV4VnW/4qa+m8+f0DfhJPKVTksGbzpkMy8+1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cftRLWkksS1b7jXpWixxl+RDBfUoFlzz13cjUy43I24=;
 b=cLhwlyZRdiJgBkLzJc27/JuQtcz1RsrNVFY36+pRVopa/0TJbg/vCKuIfBsti0SztagxPGebzAY4RdciI9JoJ5nnL/8Uwv+1gIEsbHxTkbZJypJv+a1aDH3eAhZ9w/13878RO0s8XqCCdYKfAFIEU43pKMWqG0q9hjmbW7ou0MXVdjSEmwB5e3fBIQOh1ETy9h0cFypgDh4dlu9fV+iUfsTag7B6hZsoRv8saqtTpnVzu9bKXIv+vGzh+/ZKobSNe7/kORKQFabmnawTzXozJxS3j7xCCkWcHY7NAX5nc2JWbcG1/RV1npiuokR6cjCV++rzVIO5eUdNDPXthFcOAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS0PR11MB8115.namprd11.prod.outlook.com (2603:10b6:8:12a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 19:31:44 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9456.008; Tue, 30 Dec 2025
 19:31:44 +0000
Date: Tue, 30 Dec 2025 11:31:37 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Jani Nikula <jani.nikula@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Enable out of tree compile for Xe KMD
Message-ID: <aVQomXswIYFjtQ0U@soc-5CG1426VCC.clients.intel.com>
References: <20251224223046.2819609-2-umesh.nerlige.ramappa@intel.com>
 <b131c1d8e94335d679db480f1442b6836a6056e8@intel.com>
 <aVL0lwd7EBrARLvf@soc-5CG1426VCC.clients.intel.com>
 <c40c05e193f59b20896251cfcd69d67734658e57@intel.com>
 <20251230172544.GX4164497@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251230172544.GX4164497@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR05CA0065.namprd05.prod.outlook.com
 (2603:10b6:a03:74::42) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS0PR11MB8115:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d203b8e-683c-44cd-33fd-08de47da1091
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7142099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RS9laDhITnlsUitlc3d3d09WWU15L2wvYVIvZS9nTDc0dFBGODhOcDQyQ3VQ?=
 =?utf-8?B?L2tKbmppZ0VQMXlMTkg1WVhMK05PbVlDSlQ5UzduYmRHQmRIYVNNdUNiVTlR?=
 =?utf-8?B?bERhVVFSY3lkQnJGeGttY2doRGRPYk1RUGpkTGlia3BzelE0R2lvN2trKy84?=
 =?utf-8?B?M0VSL01OcEFqWWgrbjdiand4ZHNGM21uU2lQNXRsN0N5SzdKblZQcTN0VExZ?=
 =?utf-8?B?dEt0MmkrMkFPY2ZSQVZkc3dmZW03cjFDRFJyeDVTeHRUN1AvaGZ5b1ZzMWJl?=
 =?utf-8?B?RzBKQU5OY1MyOXFMdUNiVUp0WXRuZ1FjR0NSdGR2NmdJQTVUVTVCeHU4Z3h2?=
 =?utf-8?B?R3NjYXk3N0hPdFZtY1J2Y2lIa2JNWlpBTzNDUDFmcDRyejJiUTRJcHlHSnZt?=
 =?utf-8?B?R2tNZDJONjEwSWVBUnQ5NHZ5TzE3RGl0Z09aeXgyQU1YNXpEV1UvZzZnRXls?=
 =?utf-8?B?NnRvNkdBTGhWYVE5L096L0xISkxRRnNTSmxGZzFKQmVuTFF4OEZRUFB2b3dB?=
 =?utf-8?B?U2FNbnBScFB2TnZLMDBOSFh4MVJuUmdqK3RvWTA5WHZ4Z01VeFM5ZXd4ZFVu?=
 =?utf-8?B?MVI2Q1lXWDFrYmttUnJUZXl1RTFZNDR5K2JPVlVsSEFNMlgzME02R1Rrb1NR?=
 =?utf-8?B?c2RNWmVKcEJTNTZwSGgvVmU5cXpvd2xPVGRLVVZKWjJGOUU1R2g2aVFVak5h?=
 =?utf-8?B?MStpWml1OGNFUmUyOTFTODRJT3dxbEpSY05DQU14R3hKTXpLM1ZHanlZYWFj?=
 =?utf-8?B?R2k5VSsvazY1NlNYa0NXdlIrOUhMV3ByQU9zKzhTK3J2dTBGR0VLRC9jbjBv?=
 =?utf-8?B?Y3M2eFNpdEk3RHFXeXJjckkxWndVNlJJcFgvSS9icjhiQU9Za29BcHovRHh3?=
 =?utf-8?B?OTZrZzR0b1pqUFJvMWxqeFJxSCttU01YZ2ltZnAyTG5DMGdITG9aNlFBUHNJ?=
 =?utf-8?B?Q2IyZzRtRk5rTUc4ZVhCZ2NsdHJGMWcwcitJZ0ptSDZUUmZYdGNDVXRjNnVS?=
 =?utf-8?B?dndFN3JxOG5lMWtqZGtqRGVONFVFWFFCU21mUk9GWkNtdU1wME5wTDBuelg0?=
 =?utf-8?B?ckMvcEhYeWJ5bzhjNnFyMVJpak0vZXdIb3VsdGdRaDdIRjZURFNpV2E5dW9k?=
 =?utf-8?B?Qmc2L2lydS96WnhacnI3azRqa1JmZk9zOEtUWDY1TFRZT05vNFo4UUMyMnFU?=
 =?utf-8?B?OFA0NnNKV09XZHBDZ2xMMGdSNEFyVnIzbThRY1NEVlJ5VDlXTVJIS1FLWmJF?=
 =?utf-8?B?MGV0Qmg5UHd0K0VXbVBVYmtWSWZ2OHVXa2ZRUnh4VHl5Ym5jYW5nNTUrRXp6?=
 =?utf-8?B?VHFoYm1tdjBsdXFFUGxxeFliY2c3SlordHF5cC9iQVpwdWlmOTVPWjNnc3FR?=
 =?utf-8?B?OHBlZVlPVm4rYmxrTElKTkJDcGFtOWdXV2RBK1R2OGRITUg3Vnk4UkxBWjht?=
 =?utf-8?B?WnNSSkRrc0JCU3RjbzI0S3lUVGFoYnk5Z2xhNHR6eWpsWEc5R3BpL3h6SWk1?=
 =?utf-8?B?Rk5zSzVJanJHbTMxYVUrcEk3bi9PN1ovUkdobVZUUEF0MmlDYkpSa3R3K0VT?=
 =?utf-8?B?WlkyU3g5cnpVVDY2VUgyc2lPQmZ0eXRrWFZObW9FSEp4QmxvMnR2a013Z0p0?=
 =?utf-8?B?WTRZT3J1YThtaW5OOFY1OHorK2xzb01keEFIS0RzSEgwQVRrQ1pTR1BpQTRQ?=
 =?utf-8?B?NWZzcGFqM0JveHdYcTJpeWNKU3U3djI3YnJORW5JZWVGb2tyenVESmtwczAw?=
 =?utf-8?B?OGx5T0hlTmt0aWlYOGhJdm0wODdyeDlDazhWUHR6c1JEVzUwcy8rS2cxQkNE?=
 =?utf-8?B?QXhScnBMZ251bEVjNWtlZ0NBUlBsc3JSN3pLTnRUWE1xaW9rd0M5YkNqcVIw?=
 =?utf-8?B?V3RZeEt6ZXJ1OVhXdlNld2FadHljZEVaVTJJK3U2cU91Y0N3UXR6RCtyV0lr?=
 =?utf-8?B?U3V6YWxCcitzQ0l6RkFjZjgxTTJpQ1BxV2xVbUUzR1lwTytOUE1HZDBXbk9w?=
 =?utf-8?B?dlpPSjh1amlBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7142099003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0VFZFZHZXdSTGQzbVArZXBBOW5CbVNyeW9JY090YTJHcDJTVW55NzgzdWlj?=
 =?utf-8?B?TCs1ZlZNcFVSQW9PNHh1d09BU244YjRBOCtFc0NVVFg5RWs3Uko2VWYyRytk?=
 =?utf-8?B?U29wYkt1UmwzditNdEpHV2dJOStqd1hwaE9oaW9Hb293QkZrUjQrS0VvNWdy?=
 =?utf-8?B?VElIVmFIaTZKM0FrOTRrak1pQ3JjOUY3cFd5UzU5a1c3bDRiQ1J2bTlKNnVU?=
 =?utf-8?B?Z2RQQS9YOHVkTTQxU3B2NEZvUGRjY1pHdlBob1BQamVFTERJU3EvSStvSGZo?=
 =?utf-8?B?M1I1QkFQV1BIc0Q2QUxGNXFTa3NDK0xDSXlPVzVZS3Nud1ZBSzhQVy9FWjFB?=
 =?utf-8?B?QTZPOVdmemVjWlhGZjYvZStKSjBXeHVBM0Y3L29EcE42ZERCWWg0Y0lCb1Uv?=
 =?utf-8?B?N3BTY2hrLzBwb05LcHNyaWlUQTErRFFsa203WlpJaTk3V2l0cWU2T1BFcis5?=
 =?utf-8?B?UHhIUVhYRkNuRDFQVnBaY2p1ZDNPOUdGWEhFbVNySzhEUDVQd2VLRFNUOHow?=
 =?utf-8?B?T2VySVBETzUxT2lYeVFEOE0vNzk1bHNmb0hJMGdUc0NYR09KZEM2UW5qUmUv?=
 =?utf-8?B?QTY3R2lBRElKaWc4Y0xYSkpmaDFvb1RpQmdsWkpKajZhMXNQM25RNVZnMDFS?=
 =?utf-8?B?RkVpWWNhSGd0MmJrSFI3RFJwZ2Y1YUUzUHpldEdNWnRKMytQOGVxbmg1VTRl?=
 =?utf-8?B?aGdSeVdKSWErREZzNnZuMnJHZkJrc3lJbFgwRGM0akFNV3hTNE5oMDZCMWlH?=
 =?utf-8?B?OUIrT0hOcVN6eGZGNlFGVkZkZDc3Zll2M2lKN29TRHlBb3pnUkZlMmpLZk5L?=
 =?utf-8?B?c1FZazVFdGl5Q09YZ0dhMTlrRU1zYy8vN3NjRngrOFhHTklYUlMvZkVCK3lz?=
 =?utf-8?B?L1RNVkI4Nkx3K2lDa2poSzRtRXk4SWV2NHMrb3VJM2hhUkFESzVTNUxKdlB0?=
 =?utf-8?B?TEVGOUMwVTgyYWdPeVI5KzVRdm9Ha2g4RHB2aWE1bldLMVFUWVArWDd5WGJr?=
 =?utf-8?B?YXlBc2dFZEZ1VCtha1VwSTYvdjM3ay95djErcUtGRE9Ocnp4VG9YdzJReTN0?=
 =?utf-8?B?dTc3czNDL1Vhcm5hRVNOd2RlbFBBVFJSZWNwUTByd0FEbGpscExUSE9SVFdH?=
 =?utf-8?B?QXBNVUYrT0FjK3kwZUJXd295Y3BrMlBPSW04WE81SEZRaVNSeURCTnJxdGdX?=
 =?utf-8?B?RDBqeVBCZzFWekhTRXpGSEg3Y0ZiM05rVHROVFQwUkV4K2tyUWxLYmp5OStv?=
 =?utf-8?B?OW5NOXZ4cEFLYUdtNnI1bXNueFJ3YlNldHRJbFFmajl2TWFFSHRZb0F6SU84?=
 =?utf-8?B?aGZKN280akNHRlhGUHlpcm0vek1KRVRvdCtMS0h3WXkwdFovNEV6ajdBSEtX?=
 =?utf-8?B?eXdGM3pPT3d2a0JPNVh6LzRldFBVcHdIbGwzYWR2MWo5UXRMQ3FjcERuVG91?=
 =?utf-8?B?KzhHZmlxcTEvdlFZd1ZKdWp1S1Y2aGp4TUwxRGJkdVRjTFY3d043ZmhYWnJm?=
 =?utf-8?B?THMzOWFxMlJYbUUxU1VCalF3dVp3Yk15Wkkrd1NiY2dPK2VydmZiY0o1NS9U?=
 =?utf-8?B?d1NLZTFaRktYeVhxbmZxUDRlRElNckN5V2d2SzlJNEtqbXZzTHkxTjBSeTVL?=
 =?utf-8?B?RFVXWGErNWJZK1FFNW9WSDJBb25MVXFUbUNvMHJNcHY1Z2VmTStBUndkeFJO?=
 =?utf-8?B?WlVlbEJpNWZtNGpNV1RrUk9YUG8zVkg4VCttTjV6U3JNQy9WY0hqOXNsODIy?=
 =?utf-8?B?cHZBVHVJUGhxYVVOKzFjb2FXYXZqbTBraThBZ21ScjFLb0tpNk1TZ2dBOXNv?=
 =?utf-8?B?SkkzakhyL1RwTGpDcW1lempRajM3ejZmTnNSeXRMaTFEOVcwckpFdTNlNHA3?=
 =?utf-8?B?SXJ0VWFZcUpWcVdVSS9KTXdnU1l1SFVLN3hCSWpxN1ZaZDl4Z1ZuM2hqTHFJ?=
 =?utf-8?B?amVQRUQ3WlZwcnYvbTVBVW9taW1GSmIxUElBcUNUNjE0eVZFOVRnWHM2QUUw?=
 =?utf-8?B?U1NGN2hXejV5OHFWWmJHNDVVd3BabExTeFV2WkxuZlV1VEZRNXA2WmFXblJL?=
 =?utf-8?B?WnhFNE5FZ3pkS1poODRnWGs5ZlR3NVAzQU54Sjc4TVlhVHNkVEYxS0hzUy9M?=
 =?utf-8?B?S3UrbVNmQnMxdE9MWHhQdmFLUDdOLzFmckQ1Sk9WT0Rjc21SRWVIVlkwc2Zv?=
 =?utf-8?B?YmZVK3VNNmpicjJ6aXB3SmNTVC9ZdGhtZjdzV2p2ekNYVTVOYTZndXk2ZFRZ?=
 =?utf-8?B?Mlg2Lys5UnpSTG1WSk5JQy8zZWNhQVdsYzNvV0ZKR01PcFp5T3Z6b2hSajJK?=
 =?utf-8?B?Z3JRTXlGanpYS3BhalplRFBwdWVERURXY0lYOTVuZTBabU52c1NKOUNUQ0Za?=
 =?utf-8?Q?4rN3jPTKawcQOrAA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d203b8e-683c-44cd-33fd-08de47da1091
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 19:31:44.1857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e/ev3wHECpLxDLniY+XF7wqzdSkxD5JdHfwqEJquABiyj4wHJzJHll80nHUJGD6D+0v32A2lUudEG7LFPzKnsTv1Tkr/wFsOM3mFQXTifDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8115
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

On Tue, Dec 30, 2025 at 09:25:44AM -0800, Matt Roper wrote:
>On Tue, Dec 30, 2025 at 05:03:39PM +0200, Jani Nikula wrote:
>> On Mon, 29 Dec 2025, Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com> wrote:
>> > On Mon, Dec 29, 2025 at 11:10:56AM +0200, Jani Nikula wrote:
>> >>On Wed, 24 Dec 2025, Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com> wrote:
>> >>> When trying to build the xe module out of tree, the compile fails to
>> >>> find the right trace header files and display paths.
>> >>>
>> >>> Both i915 and xe directories are copied to an out of tree location and
>> >>> the usual commands to build an out of tree module must be used to build
>> >>> xe.
>> >>>
>> >>> Based on the link below, modify the TRACE_INCLUDE_PATH to fix this.
>> >>>
>> >>> https://lwn.net/Articles/383362/
>> >>>
>> >>> In addition use relative path for display components in the Makefile
>> >>
>> >>Please don't do any of this.
>> >>
>> >>See include/trace/define_trace.h and the comment on TRACE_INCLUDE_PATH:
>> >>
>> >> * TRACE_INCLUDE_PATH if the path is something other than core kernel include/trace
>> >> *     then this macro can define the path to use. Note, the path is relative to
>> >> *     define_trace.h, not the file including it. Full path names for out of tree
>> >> *     modules must be used.
>> >>
>> >>See also commit 4e6d7719bdc5 ("drm/i915: Use correct path to trace
>> >>include").
>> >>
>> >>If you are doing some weird out-of-tree hacks, you need to keep them,
>> >>well, out-of-tree.
>> >
>> > Out of tree build didn't work for me without these. Maybe I am missing
>> > something then. Will look into it.
>>
>> No matter what, building an upstream in-tree driver out-of-tree is not
>> much of a rationale for making changes upstream, is it?
>
>From talking to Umesh offline yesterday, it sounds like "out-of-tree"
>might have been a misleading term for what he was trying to do.  I
>believe what he was actually attempting was:
>
>  - install a pre-built deb/rpm package of drm-tip generated by our CI
>    system
>  - checkout drm-tip source at the same commit as the prebuilt binary
>  - apply an additional Xe patch for testing
>  - rebuild just xe.ko without rebuilding the entire kernel via:
>
>        cd ${drmtipsrc}/drivers/gpu/drm/xe
>        make -C /lib/modules/$drmtip/build M=$PWD
>
>So his real goal was just to leverage the symbols+headers from the
>pre-built CI package while building drm-tip's xe.ko in the hopes that he
>could bypass the need to re-build the rest of the Linux kernel at the
>same time.
>
>But I don't think pointing "M=<path>" back at an in-tree location
>(instead of a truly out-of-tree module) is something that most people do
>and I'm not sure if it's really expected to work for in-tree drivers.
>

Yeah, sorry, I misunderstood what out-of-tree meant and Matt clarified 
that. My intention is to just build the xe driver against installed 
kernel and header packages.

Thanks,
Umesh

>
>Matt
>
>>
>> BR,
>> Jani.
>>
>>
>> >
>> > Thanks,
>> > Umesh
>> >
>> >>
>> >>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> >>> ---
>> >>>  drivers/gpu/drm/i915/Makefile                      | 4 ++++
>> >>>  drivers/gpu/drm/i915/display/intel_display_trace.h | 2 +-
>> >>>  drivers/gpu/drm/i915/gvt/trace.h                   | 2 +-
>> >>>  drivers/gpu/drm/i915/i915_trace.h                  | 2 +-
>> >>>  drivers/gpu/drm/i915/intel_uncore_trace.h          | 2 +-
>> >>>  drivers/gpu/drm/xe/Makefile                        | 6 +++---
>> >>>  drivers/gpu/drm/xe/xe_trace.h                      | 2 +-
>> >>>  drivers/gpu/drm/xe/xe_trace_bo.h                   | 2 +-
>> >>>  drivers/gpu/drm/xe/xe_trace_guc.h                  | 2 +-
>> >>>  drivers/gpu/drm/xe/xe_trace_lrc.h                  | 2 +-
>> >>>  10 files changed, 15 insertions(+), 11 deletions(-)
>> >>>
>> >>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>> >>> index 4db24050edb0..13a910a005fa 100644
>> >>> --- a/drivers/gpu/drm/i915/Makefile
>> >>> +++ b/drivers/gpu/drm/i915/Makefile
>> >>> @@ -374,6 +374,8 @@ i915-y += \
>> >>>  	display/intel_vrr.o \
>> >>>  	display/vlv_dsi.o \
>> >>>  	display/vlv_dsi_pll.o
>> >>> +subdir-ccflags-y += \
>> >>> +	-I$(src)/display
>> >>
>> >>In particular, I do not want display/ added to header search path
>> >>here. We're in the process of removing i915 includes of display headers,
>> >>and this makes it harder to track them.
>> >>
>> >>BR,
>> >>Jani.
>> >>
>> >>>
>> >>>  i915-$(CONFIG_DRM_I915_DP_TUNNEL) += \
>> >>>  	display/intel_dp_tunnel.o
>> >>> @@ -419,6 +421,8 @@ i915-y += \
>> >>>  i915-$(CONFIG_DRM_I915_GVT) += \
>> >>>  	intel_gvt.o \
>> >>>  	intel_gvt_mmio_table.o
>> >>> +subdir-ccflags-$(CONFIG_DRM_I915_GVT) += \
>> >>> +	-I$(src)/gvt
>> >>>  include $(src)/gvt/Makefile
>> >>>
>> >>>  obj-$(CONFIG_DRM_I915) += i915.o
>> >>> diff --git a/drivers/gpu/drm/i915/display/intel_display_trace.h b/drivers/gpu/drm/i915/display/intel_display_trace.h
>> >>> index 27ebc32cb61a..aa43f2a5510a 100644
>> >>> --- a/drivers/gpu/drm/i915/display/intel_display_trace.h
>> >>> +++ b/drivers/gpu/drm/i915/display/intel_display_trace.h
>> >>> @@ -853,6 +853,6 @@ TRACE_EVENT(intel_frontbuffer_flush,
>> >>>  /* This part must be outside protection */
>> >>>  #undef TRACE_INCLUDE_PATH
>> >>>  #undef TRACE_INCLUDE_FILE
>> >>> -#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/i915/display
>> >>> +#define TRACE_INCLUDE_PATH .
>> >>>  #define TRACE_INCLUDE_FILE intel_display_trace
>> >>>  #include <trace/define_trace.h>
>> >>> diff --git a/drivers/gpu/drm/i915/gvt/trace.h b/drivers/gpu/drm/i915/gvt/trace.h
>> >>> index 63874d385c6f..235d51ee48ad 100644
>> >>> --- a/drivers/gpu/drm/i915/gvt/trace.h
>> >>> +++ b/drivers/gpu/drm/i915/gvt/trace.h
>> >>> @@ -378,6 +378,6 @@ TRACE_EVENT(render_mmio,
>> >>>  /* This part must be out of protection */
>> >>>  #undef TRACE_INCLUDE_PATH
>> >>>  #undef TRACE_INCLUDE_FILE
>> >>> -#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/i915/gvt
>> >>> +#define TRACE_INCLUDE_PATH .
>> >>>  #define TRACE_INCLUDE_FILE trace
>> >>>  #include <trace/define_trace.h>
>> >>> diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
>> >>> index 7ed41ce9b708..a074a5f542fc 100644
>> >>> --- a/drivers/gpu/drm/i915/i915_trace.h
>> >>> +++ b/drivers/gpu/drm/i915/i915_trace.h
>> >>> @@ -721,6 +721,6 @@ DEFINE_EVENT(i915_context, i915_context_free,
>> >>>  /* This part must be outside protection */
>> >>>  #undef TRACE_INCLUDE_PATH
>> >>>  #undef TRACE_INCLUDE_FILE
>> >>> -#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/i915
>> >>> +#define TRACE_INCLUDE_PATH .
>> >>>  #define TRACE_INCLUDE_FILE i915_trace
>> >>>  #include <trace/define_trace.h>
>> >>> diff --git a/drivers/gpu/drm/i915/intel_uncore_trace.h b/drivers/gpu/drm/i915/intel_uncore_trace.h
>> >>> index f13ff71edf2d..01219e97574b 100644
>> >>> --- a/drivers/gpu/drm/i915/intel_uncore_trace.h
>> >>> +++ b/drivers/gpu/drm/i915/intel_uncore_trace.h
>> >>> @@ -44,6 +44,6 @@ TRACE_EVENT_CONDITION(i915_reg_rw,
>> >>>  /* This part must be outside protection */
>> >>>  #undef TRACE_INCLUDE_PATH
>> >>>  #undef TRACE_INCLUDE_FILE
>> >>> -#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/i915
>> >>> +#define TRACE_INCLUDE_PATH .
>> >>>  #define TRACE_INCLUDE_FILE intel_uncore_trace
>> >>>  #include <trace/define_trace.h>
>> >>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> >>> index a6749dd6a725..00aa4634f10b 100644
>> >>> --- a/drivers/gpu/drm/xe/Makefile
>> >>> +++ b/drivers/gpu/drm/xe/Makefile
>> >>> @@ -201,16 +201,16 @@ endif
>> >>>  subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
>> >>>  	-I$(src)/display/ext \
>> >>>  	-I$(src)/compat-i915-headers \
>> >>> -	-I$(srctree)/drivers/gpu/drm/i915/display/ \
>> >>> +	-I$(src)/../i915/display/ \
>> >>>  	-Ddrm_i915_private=xe_device
>> >>>
>> >>>  # Rule to build SOC code shared with i915
>> >>> -$(obj)/i915-soc/%.o: $(srctree)/drivers/gpu/drm/i915/soc/%.c FORCE
>> >>> +$(obj)/i915-soc/%.o: $(src)/../i915/soc/%.c FORCE
>> >>>  	$(call cmd,force_checksrc)
>> >>>  	$(call if_changed_rule,cc_o_c)
>> >>>
>> >>>  # Rule to build display code shared with i915
>> >>> -$(obj)/i915-display/%.o: $(srctree)/drivers/gpu/drm/i915/display/%.c FORCE
>> >>> +$(obj)/i915-display/%.o: $(src)/../i915/display/%.c FORCE
>> >>>  	$(call cmd,force_checksrc)
>> >>>  	$(call if_changed_rule,cc_o_c)
>> >>>
>> >>> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
>> >>> index 6d12fcc13f43..f3ef77e2bcda 100644
>> >>> --- a/drivers/gpu/drm/xe/xe_trace.h
>> >>> +++ b/drivers/gpu/drm/xe/xe_trace.h
>> >>> @@ -515,6 +515,6 @@ TRACE_EVENT(xe_exec_queue_reach_max_job_count,
>> >>>  /* This part must be outside protection */
>> >>>  #undef TRACE_INCLUDE_PATH
>> >>>  #undef TRACE_INCLUDE_FILE
>> >>> -#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
>> >>> +#define TRACE_INCLUDE_PATH .
>> >>>  #define TRACE_INCLUDE_FILE xe_trace
>> >>>  #include <trace/define_trace.h>
>> >>> diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
>> >>> index 86323cf3be2c..8a687dcf09ba 100644
>> >>> --- a/drivers/gpu/drm/xe/xe_trace_bo.h
>> >>> +++ b/drivers/gpu/drm/xe/xe_trace_bo.h
>> >>> @@ -258,6 +258,6 @@ DEFINE_EVENT(xe_vm, xe_vm_ops_fail,
>> >>>  /* This part must be outside protection */
>> >>>  #undef TRACE_INCLUDE_PATH
>> >>>  #undef TRACE_INCLUDE_FILE
>> >>> -#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
>> >>> +#define TRACE_INCLUDE_PATH .
>> >>>  #define TRACE_INCLUDE_FILE xe_trace_bo
>> >>>  #include <trace/define_trace.h>
>> >>> diff --git a/drivers/gpu/drm/xe/xe_trace_guc.h b/drivers/gpu/drm/xe/xe_trace_guc.h
>> >>> index 78949db9cfce..aac9eebd4815 100644
>> >>> --- a/drivers/gpu/drm/xe/xe_trace_guc.h
>> >>> +++ b/drivers/gpu/drm/xe/xe_trace_guc.h
>> >>> @@ -154,6 +154,6 @@ TRACE_EVENT(xe_guc_engine_activity,
>> >>>  /* This part must be outside protection */
>> >>>  #undef TRACE_INCLUDE_PATH
>> >>>  #undef TRACE_INCLUDE_FILE
>> >>> -#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
>> >>> +#define TRACE_INCLUDE_PATH .
>> >>>  #define TRACE_INCLUDE_FILE xe_trace_guc
>> >>>  #include <trace/define_trace.h>
>> >>> diff --git a/drivers/gpu/drm/xe/xe_trace_lrc.h b/drivers/gpu/drm/xe/xe_trace_lrc.h
>> >>> index d525cbee1e34..ada8f97a99e0 100644
>> >>> --- a/drivers/gpu/drm/xe/xe_trace_lrc.h
>> >>> +++ b/drivers/gpu/drm/xe/xe_trace_lrc.h
>> >>> @@ -47,6 +47,6 @@ TRACE_EVENT(xe_lrc_update_timestamp,
>> >>>  /* This part must be outside protection */
>> >>>  #undef TRACE_INCLUDE_PATH
>> >>>  #undef TRACE_INCLUDE_FILE
>> >>> -#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
>> >>> +#define TRACE_INCLUDE_PATH .
>> >>>  #define TRACE_INCLUDE_FILE xe_trace_lrc
>> >>>  #include <trace/define_trace.h>
>> >>
>> >>--
>> >>Jani Nikula, Intel
>>
>> --
>> Jani Nikula, Intel
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
