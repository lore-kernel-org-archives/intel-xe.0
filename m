Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2738CCD183
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 18:35:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58DF910EADE;
	Thu,  9 Oct 2025 18:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ba/QHdVd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 503E210EADE
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 18:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760034934; x=1791570934;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/g96Vna8LlUDZV5JOK1Nubw4X6h1x2+DfV/+dLfLxYk=;
 b=ba/QHdVd4RfX6WlGzVvZs3aQQRstWkVnELzcSBm13+hz9kVnt9EnjLRT
 2/F+z2uS68sL/e033yAb+XDvo3yree6Gb6w+Uwpg5DmlfKzig0ZLYhM2z
 MXGkigsmtV2JtPtKVbGON6A9Z80Fwm8wGxwfvYkky+csoi7D6dg2bs46t
 PnaNoD1I8KR/YB+89X2sipvRE531O1ppNOqSNxDND9JdHabkNtulgtQ5h
 p8ZnvMtsnpx+7hsUY24lSLHQufysUtqKqUQQ8+FgKLXf6x//aWVMqItoX
 MswnAnGxmMRP2tLID/oYp+k+gcDeFbfbU3yqpU0qkpsUKoI6cA0dtCxTr Q==;
X-CSE-ConnectionGUID: kSfDr2W8Rh2wpVEbRX5E2w==
X-CSE-MsgGUID: TT98rKX+RnSfHFfJmsBmGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="73686093"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="73686093"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 11:35:33 -0700
X-CSE-ConnectionGUID: 3frIuAAZQqyc2fbESDp6Pw==
X-CSE-MsgGUID: dKLLekJdREqSEccXWTJ3LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="204487068"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 11:35:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 11:35:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 11:35:31 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.42) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 11:35:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LUi3FclxGGEvGHbeacNxJ1NpvxMDCN/BXepjNyvCNQyWB4eMav8ZEMjgqDTbKIhSXdcb5H/wk9vuW/3l1mPCGOsQ4jpSBqa4Sk1fTd2/Hg8WkUPGuhwyrKN31QLIjGAir+coGUkykZGZiAOImu3k20qba3i8+lTx7LT5iMLB1lwJkLt+YGfndEMsK6tHEsL+RAPEo/OW+t8jiAT3OFLugSLbRoBGd0n00oM0KbeZVSgZmtrg28AdVw4vn/8PdTOGzq/QxnfiBlA8cSf0OCT8G8TyojAcLozN5Q7NCQkqKnz8X38DZzf257k3duz2gS7tu0jrxKpsoh3zCUUP/fJTag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5l6qmeZqoEhpNgAchDxbrF/93+eMqAtX36gMLNtSq20=;
 b=Ny6SiIgnFjuuWuY3TyioIIkhoJWFvn9k6JXy3/HIUEQPCtDxC6lKPveB3yDU3tjUYn0ShcXXQBHzCocCXNG0ehxpt4XLiXU04fknR5cBVP8NActZMazapL0mIsLQ3JTKvyS2A1J932Cz+HFD1SVOTtr4Nn1VndCZm5yyfOgp0V6/HAjNZDX7Px9YNWBNLCm8ZgtWopPcVpuSRnnpf1inKh3sVU84UCLqycYbs2sg0xrk73WlOC9mij1HI6/rjAiPWve3C4wSzXkj0XtNa9bzIwAdpRGDPccd7SoP8cBysc3EvpM0onSycMwfDHYINCEymJ4gWzG9ZjePWfUcjC8rnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA1PR11MB8576.namprd11.prod.outlook.com (2603:10b6:806:3b5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 18:35:14 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 18:35:14 +0000
Date: Thu, 9 Oct 2025 14:35:10 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v5 1/3] drm/xe/migrate: Atomicize CCS copy command setup
Message-ID: <aOgAXul_Az3JLC0V@intel.com>
References: <20251008101145.11506-5-satyanarayana.k.v.p@intel.com>
 <20251008101145.11506-6-satyanarayana.k.v.p@intel.com>
 <aObsmCaIbrSgHrvd@lstrano-desk.jf.intel.com>
 <aOex-1E8yBlGFbwI@intel.com>
 <aOfeoWV87W+Gt6HH@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aOfeoWV87W+Gt6HH@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR13CA0058.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::33) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA1PR11MB8576:EE_
X-MS-Office365-Filtering-Correlation-Id: 21b5081b-08bd-4b54-3288-08de07629601
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXlRdWdvcUQ2aDZtMTFVK1JKbmo5L21JQkRId0FCMVNxdmF3SUErbUJZNFEr?=
 =?utf-8?B?ckFNNTRDNENBSjk2WlRLc0hYV01QSzI2N0dEeGc4UUdyQ0ZIRjRpeDUvRktv?=
 =?utf-8?B?TS95aCsvbERSNmxtU0J5aTMwUElQVDJ2OVpucGg4UzcxTk9IMVZheWsrRitv?=
 =?utf-8?B?UDJHaTVKNGt2dTB4Y0dwUjFnYzkvUGVNVnB6ZXdVQWFqVTZnTGwwRzVjYlk1?=
 =?utf-8?B?RXBIRXdTRnRHaUw5a085MHRBMVRVejlYbVA1M0ZLa0FyOUVxYk55aW4wVVh3?=
 =?utf-8?B?WHRaTVI0RGN6QTV1MlVCTVNhempoK3llUStpa3FYL0NCZnNVRjJ4M3ZBd1NX?=
 =?utf-8?B?WkM1cUxkdGJWTCtqRStkL1U5cm82MGY2RnRDNEpBWmI2THFmakhMWGlsbjFm?=
 =?utf-8?B?ckgvUHlEVm83aDh6WkNoYmpveStEZXE1L3lHWkRHV21zNERuS0xaa1dnemZu?=
 =?utf-8?B?S3hKT2t2bDR0dngwRkFKOWJrWHVjdWNhSFhXd3E5UVNhUW1Va2pWcU1oanJz?=
 =?utf-8?B?SUl2aFprc01rbldmN2lUdlBzZVEvYTc5Qk9FYzNpa3ZXVlI3KzBhc3BVTmJG?=
 =?utf-8?B?VDI2dTNDckE3LytOYUZhZE82WVJaSDVaZzY5ZjBSbzAyUWNiNnpCR1BNTFhM?=
 =?utf-8?B?ZklaUzVMNW81UWYwcU5vbkJSS3NBMFFmRlJEMXhtTlZzZVduOHdMTTVnTlpm?=
 =?utf-8?B?RUt2Q3NXWmZhdUw1UjR3Mlo5RERVLzlZU0Z1SEFtMnFUMVV1VmI0U2tYaktL?=
 =?utf-8?B?cWxDK29RVHFydnBHZkp2NWFNbzg3aEtTMG0vd1NTWGM2bW1TanZERU9sL0lv?=
 =?utf-8?B?YXdHYzVaTGd2dkZkdm54clIrM1RzQmptRnhkaHhWOEFBeUxtaERJOTB6QkR2?=
 =?utf-8?B?OUUzbnpMUnNlV3B1cjRNeDd5ejNSZzRndnVxK2xyN1E1UFJWcGJINmtKWGd5?=
 =?utf-8?B?RngvaHp4VzdWbCt1VkNYSFBhaFZzV2JnbzRYUkdzZHFZVlMvR2EwanE4bUdV?=
 =?utf-8?B?U1RmNHVWSWRMcFE5bVBxbGNmcjlPVWtFMlFWT2Y4N1dTVEVDbG5oQ0hycFpn?=
 =?utf-8?B?Y1BIaHJsT3JhZmJxTkNMczNRYjk5bmpDdGM3YnhJaHZQdTR0RVRJT1B1VVc4?=
 =?utf-8?B?eEVXYTdaVXFpc0pFMi9ZdHhkbFhLaFlWNkdndTFjT3NpUWZFdi9nR0VRZG9S?=
 =?utf-8?B?d21oL3NTYnBnUDhrbTJHOTRiU2xKYzNIaXdiaGpWeUs5ZzVtVitUUHdLOWNn?=
 =?utf-8?B?Q2NDdFpGaDFkNVRIa1hWcjNQRVhibW9MV3o1cGZnc1B5NTQ0cEplWWUvckJj?=
 =?utf-8?B?WWZvbWZlN25GNUI3VWI3emVBR1lWdDYzNVJ4emd2M25DdlpPaStYZkh4TXMr?=
 =?utf-8?B?cG5tVFB2aFA4SjMvWlgza0N0a0ZJSzYvUGxrZ3BqVjlydmZrd0dDekJpL2RW?=
 =?utf-8?B?anpQMHY1TDZaTXVsTFFCZWZXM3grY21nQ0czZ20yVXRpMldJQTVHejR5c24x?=
 =?utf-8?B?Yk1vQWsxOTJXb3FvQ29NMElIRGhOV1ZYck4rNEhjbFBLYUNzYUUwckpIUGhD?=
 =?utf-8?B?VE5sVHdNdkJsSDdGamJ5cExhUS9KTDkzcDJqMHlRbmtlSUhQVHhYZEtuTXNS?=
 =?utf-8?B?WCs2MklwQitTOVRUdG1oSFRFdnBpbTB5SndUWVBNOGtRem5abEpmOU84eW9W?=
 =?utf-8?B?ZXhFODE1NUttWlhUSkJOaEZ0ZlkxcHVQYXhQazgzZ3BrV2xMSVdMMFg5TlA0?=
 =?utf-8?B?R2cwc01ob256cVd6TUMxempSWFZsMnVndzhCdFlXK1hGRjhaajdrVHRreGh6?=
 =?utf-8?B?eDBOdXJQcWQvS0dCMlJEdWVpM1RxS0lDNE1XZThBRGNVZWVNMGZkTWNMcWVP?=
 =?utf-8?B?ZUhJa0JISUZVMlZXZUlQQjFwZXpCR1RtZGRIb3FWOGpMcEE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHNrYWp3eEJZZW5aZVZpT0lrM3ZRanhaaGd4eUFxeTdCY01vZlN1ZjA0S3hD?=
 =?utf-8?B?cFF4a0o4YTNnRjFMY0xHczZxYTh3VlljM1l3bUZ4S0g3Y3l6emtENitNRjZZ?=
 =?utf-8?B?UjNoaDhRaWFCY3NseTB1ZWFEZm5ybXorSlErcjFSaFdtSTBtZm9qdjhzaG9R?=
 =?utf-8?B?MW9VbUM5L2MvUEI4Yno2ZlJCTFROWDdJQzMyM3BwNlk1M3hKdnBVbXBCZmVB?=
 =?utf-8?B?S0pOVGMwaEhKWWlsMXNqWHVUSTRwL1hEbjdIazdMWWVEMXRITXhPell1TDVI?=
 =?utf-8?B?aDlSUkdJckxVNWk2M01wNVVma3VTeHJRd1BqUlNYYlJrZktYb0lCV2R2dVNa?=
 =?utf-8?B?SEY0dWs1NGs0OEpmRTNHTXhRMXZwRGNJc1ZCcVpBVTFLQk8zTzhvNEhmTk9x?=
 =?utf-8?B?eWxTVzcydlNwWW1uTml4clhyQUJjdFBRcjhqaDBDMUZRQmM3NVNYVExoSGFH?=
 =?utf-8?B?dC9NSmtDWHFBU3pxVVRubmdmNE5SaEh2QmtCTUdhVnV1ZXg0QVhZd3JUTmgr?=
 =?utf-8?B?THdrTmZqdnl4bnJhOHFpVEl4ZHM5ZzZJQlNoalFZamN6SVgwZ2VlZ3BCbkhP?=
 =?utf-8?B?UFdqTGpnMVNSMHpXeVp2VkR6NkNwS2hFaEQvbTRsREx5T2RKZ0dCRXV3eEhv?=
 =?utf-8?B?ZXB3aHh3bVV4a0FTRytoOTlnS29JTkJCN3NnY0YvdG5kNldCZWdndm9QYnJG?=
 =?utf-8?B?QURydUJzNkpOakhTdUdrNUtMNDlIMVpGTkV0TmZrejhOaWczYnByejhXTCt1?=
 =?utf-8?B?NDh5MUU4WkJOTCtnU3hSU1QvZkRBTFBNbnlwRzZIclFFTmFDWHpZL0h1Ymhy?=
 =?utf-8?B?UmpnWVJuSmo0bVFLbkpuT2VUN0RvYVJqR1I2R1RHTytlN05DZ0R6eEtwc2Ex?=
 =?utf-8?B?MG5IVDR6ZGYvU0hxK2daZHQxem9yZVZXaXZ6Qy84amJiYmdLcmFqSldDaXly?=
 =?utf-8?B?cjBSSGhZWkZkVDF1YWhzMzJVRmhRazVmQmV0RUc4UnovVlJ1elFHd0tJM0ta?=
 =?utf-8?B?Q2VGOGVWR1BlVG1nN0wrWCtyeGZpUzBobmo3NytFN0svUm1jYmlsZkFocElh?=
 =?utf-8?B?WW1xV3h2UlE4WlVScVlobVpmRnA0Q0RmR2JUN0NNeHhpc1NTRzZsc1ZKNlJ1?=
 =?utf-8?B?SmdqV1JzaHk4R0dIcFFKSmVmNzlFbHJFNDZkclAyTEZQa01YVnlDNFU5T05Q?=
 =?utf-8?B?Y0NhZXZXYUhSNHRpdVNVVDZ4QlU5QzNVSG1SVDhVY1owZWk5QW0xdnozUXF1?=
 =?utf-8?B?dXBMM1kyNGpxa1QwY1Q4a0F5bDJUSEIyaUI0UVVFNE5nKzlWVzVSaHNLeXNQ?=
 =?utf-8?B?UTFRd3Uzdi9pd2w2Qm91UVVJbys4ZUlJcmxWZFowcy94dWRrZ0crdytKOTZj?=
 =?utf-8?B?OFZ4VVdKUFQ3T2xCQUJLcnhwbzZXQ0g0bzJxTjlreHc5UEZLT0VLL0NnUURy?=
 =?utf-8?B?N0R5bEVieW9aTUpUWGtEY0pxQlhLYko5T0hMUnh1Sk9ObWRlYnZaUklIMmtF?=
 =?utf-8?B?SjRWL0UxUm5BSmFHdjR0N2orWjk5a2xMaEpDUXFEQkxLUkhBbFB1UmNZQjRU?=
 =?utf-8?B?VzNpRkdla3ltSWdzK3JnS2UrbjYrMTAzVERudTFFSlZSTjBxQTBkVjVtYjNh?=
 =?utf-8?B?SHAzTyt1ZEFKL2FkRzV1bUFsaXoxMDRwdjYweGVvUisrMzVTM0ZzUVJwSjRM?=
 =?utf-8?B?bHNCN3pENlpJZ01yOTM0ZXhYVTQ4eW5hK3FjTFhvYUtJSUZEOVlIUGFVems5?=
 =?utf-8?B?ZkczWWVIcFZLaTNzVTZUeXNlUkY3RVNPaG1uOURWTVc4c245Ky93WWt0WTVX?=
 =?utf-8?B?NFM5YmpSd1ZjaXJ2c0xLOExSVlBvVnlRQ1B1N3FMdkJXUmVQdWJFbTA5Wm1P?=
 =?utf-8?B?RC9oekhZRkVuclNaeXgxMmZySkk4c0hOUm8xeUFTQllMSi91VmdmVy8vL3lT?=
 =?utf-8?B?c25EcEVzK0IvVFdhbVpKWlhvL3Q0eUZNWG15MTVXMmRPblBjb1BUM0ppbnhH?=
 =?utf-8?B?WldqbDcvalhmSS85UTB0ZDJzMlpIeThZQXNFRHQzcEFjbXNENnhMUDJrV0o4?=
 =?utf-8?B?Q1hwdVVwc3hzdXZzNVB1SG1XeUJSQW9TWkFGaEl5emNqMHZnMWx3N1RMN0g3?=
 =?utf-8?B?SDB6UGpqSWlVR0pzVGpLVGNnKzVySGlyYzBVTVNRUk8xQ3hVUEJVSE15UExr?=
 =?utf-8?B?d0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b5081b-08bd-4b54-3288-08de07629601
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 18:35:14.0311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lwBkLvcZnToes7fjh9CImTWlACOO3OiUHa8cDccfYJKV+ocYRQTRVPXavIqpvU4R1NkTAonExmu/Piqq9/EtqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8576
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

On Thu, Oct 09, 2025 at 09:11:13AM -0700, Matthew Brost wrote:
> On Thu, Oct 09, 2025 at 09:00:43AM -0400, Rodrigo Vivi wrote:
> > On Wed, Oct 08, 2025 at 03:58:32PM -0700, Matthew Brost wrote:
> > > On Wed, Oct 08, 2025 at 03:41:47PM +0530, Satyanarayana K V P wrote:
> > > > The CCS copy command is a 5-dword sequence. If the vCPU halts during
> > > > save/restore while this sequence is being programmed, partial writes may
> > > > trigger page faults when saving IGPU CCS metadata. Use the VMOVDQU
> > > > instruction to write the sequence atomically.
> > > > 
> > > > Since VMOVDQU operates on 256-bit chunks, update EMIT_COPY_CCS_DW to emit
> > > > 8 dwords instead of 5 dwords.
> > > > 
> > > > Update emit_flush_invalidate() to use VMOVDQU operating with 128-bit
> > > > chunks.
> > > > 
> > > > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > 
> > > > ---
> > > > V4 -> V5:
> > > > - Fixed review comments. (Matt B)
> > > > 
> > > > V3 -> V4:
> > > > - Fixed review comments. (Wajdeczko)
> > > > - Fix issues reported by patchworks.
> > > > 
> > > > V2 -> V3:
> > > > - Added support for 128 bit and 256 bit instructions with memcpy_vmovdqu
> > > > - Updated emit_flush_invalidate() to use vmovdqu instruction.
> > > > 
> > > > V1 -> V2:
> > > > - Use memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
> > > >   (Auld, Matthew)
> > > > - Fix issues reported by patchworks.
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_migrate.c | 93 +++++++++++++++++++++++++--------
> > > >  1 file changed, 72 insertions(+), 21 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > > > index c39c3b423d05..b629072956ee 100644
> > > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > > @@ -5,7 +5,9 @@
> > > >  
> > > >  #include "xe_migrate.h"
> > > >  
> > > > +#include <asm/fpu/api.h>
> > > >  #include <linux/bitfield.h>
> > > > +#include <linux/cpufeature.h>
> > > >  #include <linux/sizes.h>
> > > >  
> > > >  #include <drm/drm_managed.h>
> > > > @@ -33,6 +35,7 @@
> > > >  #include "xe_res_cursor.h"
> > > >  #include "xe_sa.h"
> > > >  #include "xe_sched_job.h"
> > > > +#include "xe_sriov_vf_ccs.h"
> > > >  #include "xe_sync.h"
> > > >  #include "xe_trace_bo.h"
> > > >  #include "xe_validation.h"
> > > > @@ -644,18 +647,49 @@ static void emit_pte(struct xe_migrate *m,
> > > >  	}
> > > >  }
> > > >  
> > > > -#define EMIT_COPY_CCS_DW 5
> > > > +static void memcpy_vmovdqu(void *dst, const void *src, u32 size)
> > > > +{
> > > > +#ifdef CONFIG_X86
> > > > +	kernel_fpu_begin();
> > > > +	if (size == SZ_128) {
> > > > +		asm("vmovdqu (%0), %%xmm0\n"
> > > > +		    "vmovups %%xmm0,   (%1)\n"
> > > > +		    :: "r" (src), "r" (dst) : "memory");
> > > > +	} else if (size == SZ_256) {
> > > > +		asm("vmovdqu (%0), %%ymm0\n"
> > > > +		    "vmovups %%ymm0,   (%1)\n"
> > > > +		    :: "r" (src), "r" (dst) : "memory");
> > > > +	}
> > > > +	kernel_fpu_end();
> > > > +#endif
> > > 
> > > Everything in this patch LGTM but I think we maintainer input to ensure
> > > we are breaking some rules about inlined asm code in a driver (no idea
> > > if this exists) or if a better place would be somewhere common. Can you
> > > ping Lucas, Thomas, or Rodrigo and ask them about this?
> > 
> > Well, it is possible and we have asm code in i915 for instance (i915_memcpy.c)
> > 
> > But the rule does exist:
> > https://www.kernel.org/doc/html/latest/process/coding-style.html#inline-assembly
> > 
> > "don’t use inline assembly gratuitously when C can do the job. You can and should
> > poke hardware from C when possible"
> > 
> > In this case here, please explain why exactly memcpy with smp_wmb barriers and
> > or WRITE_ONCE code combined couldn't solve it.
> > 
> > Also, please explain how exactly vmovdqu guarantees the atomicity promised by
> > the commit message. On a quick search here my take is that for this 128 or 256
> > bits, atomicity is not guaranteed.
> 
> I don't think cache atomicity is what we're after here—rather, it's vCPU
> halting atomicity.
> 
> Consider the following case:
> b++ = XY_CTRL_SURF_COPY_BLT;
> b++ = addr;
> 
> If the vCPU is halted during the instruction that stores
> XY_CTRL_SURF_COPY_BLT, the address will be invalid. The GuC executes the
> batch buffer (BB) that is being programmed as part of the VF save. This
> will clearly cause the BB to hang due to a page fault on the copy
> command.

okay, perhaps this is what is getting me confused most
what I don't understand in the flow is: why GuC is already
executing it or going to execute it while you are going to a halt when
writing the command to the buffer?  and not writing to the buffer first
and then sending it to the exec queue?

> 
> If the entire XY_CTRL_SURF_COPY_BLT is stored via an AVX instruction,
> then either the GPU entire instruction is written or none of it is. I
> believe vCPU halting guarantees that a CPU instruction is either fully
> executed or not at all—regardless of how many micro-operations (uOPs) it
> decodes into. If this guarantee does not hold, then the entire
> architecture of CCS save/restore on PTL is fundamentally broken which is
> always possible.

Okay, this is guaranteed. I mean, the vCPU won't get halted in the middle
of the vmovdqu nor vmovups. only before, between, or after them.

But is this uncached and/or coherent? isn't there really any possibility that
the command finished, but GuC mid-flight executing things aren't still
seeing different cachelines?

> 
> > 
> > So, imho this patch is introducing a unmaintainable, complex, and fragile code
> > that is not even doing what it is claiming to do. But I will be glad if someone
> > can challenge this and prove me wrong.
> > 
> 
> Let me know if the above makes any sense.

Okay. But how to handle cases where AVX might not be available? really not needed?

> 
> Matt
> 
> > Thanks,
> > Rodrigo.
> > 
> > > 
> > > Matt 
> > > 
> > > > +}
> > > > +
> > > > +static void emit_atomic(struct xe_gt *gt, void *dst, const void *src, u32 size)
> > > > +{
> > > > +	u32 instr_size = size * BITS_PER_BYTE;
> > > > +
> > > > +	xe_gt_assert(gt, instr_size == SZ_128 || instr_size == SZ_256);
> > > > +
> > > > +	if (IS_VF_CCS_READY(gt_to_xe(gt)) && static_cpu_has(X86_FEATURE_AVX))
> > > > +		memcpy_vmovdqu(dst, src, instr_size);
> > > > +	else
> > > > +		memcpy(dst, src, size);
> > > > +}
> > > > +
> > > > +#define EMIT_COPY_CCS_DW 8
> > > >  static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> > > >  			  u64 dst_ofs, bool dst_is_indirect,
> > > >  			  u64 src_ofs, bool src_is_indirect,
> > > >  			  u32 size)
> > > >  {
> > > > +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
> > > >  	struct xe_device *xe = gt_to_xe(gt);
> > > >  	u32 *cs = bb->cs + bb->len;
> > > >  	u32 num_ccs_blks;
> > > >  	u32 num_pages;
> > > >  	u32 ccs_copy_size;
> > > >  	u32 mocs;
> > > > +	u32 i = 0;
> > > >  
> > > >  	if (GRAPHICS_VERx100(xe) >= 2000) {
> > > >  		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> > > > @@ -673,15 +707,23 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> > > >  		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
> > > >  	}
> > > >  
> > > > -	*cs++ = XY_CTRL_SURF_COPY_BLT |
> > > > -		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> > > > -		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> > > > -		ccs_copy_size;
> > > > -	*cs++ = lower_32_bits(src_ofs);
> > > > -	*cs++ = upper_32_bits(src_ofs) | mocs;
> > > > -	*cs++ = lower_32_bits(dst_ofs);
> > > > -	*cs++ = upper_32_bits(dst_ofs) | mocs;
> > > > +	dw[i++] = XY_CTRL_SURF_COPY_BLT |
> > > > +		  (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> > > > +		  (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> > > > +		  ccs_copy_size;
> > > > +	dw[i++] = lower_32_bits(src_ofs);
> > > > +	dw[i++] = upper_32_bits(src_ofs) | mocs;
> > > > +	dw[i++] = lower_32_bits(dst_ofs);
> > > > +	dw[i++] = upper_32_bits(dst_ofs) | mocs;
> > > >  
> > > > +	/*
> > > > +	 * The CCS copy command is a 5-dword sequence. If the vCPU halts during
> > > > +	 * save/restore while this sequence is being issued, partial writes may trigger
> > > > +	 * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
> > > > +	 * write the sequence atomically.
> > > > +	 */
> > > > +	emit_atomic(gt, cs, dw, sizeof(dw));
> > > > +	cs += EMIT_COPY_CCS_DW;
> > > >  	bb->len = cs - bb->cs;
> > > >  }
> > > >  
> > > > @@ -993,18 +1035,27 @@ static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
> > > >  	return (NUM_KERNEL_PDE - 2) * XE_PAGE_SIZE;
> > > >  }
> > > >  
> > > > -static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
> > > > +/*
> > > > + * The MI_FLUSH_DW command is a 4-dword sequence. If the vCPU halts during
> > > > + * save/restore while this sequence is being issued, partial writes may
> > > > + * trigger page faults when saving iGPU CCS metadata. Use
> > > > + * emit_atomic() to write the sequence atomically.
> > > > + */
> > > > +#define EMIT_FLUSH_INVALIDATE_DW 4
> > > > +static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *cs, int i, u32 flags)
> > > >  {
> > > >  	u64 addr = migrate_vm_ppgtt_addr_tlb_inval();
> > > > +	u32 dw[EMIT_FLUSH_INVALIDATE_DW] = {MI_NOOP}, j = 0;
> > > > +
> > > > +	dw[j++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > > > +		      MI_FLUSH_IMM_DW | flags;
> > > > +	dw[j++] = lower_32_bits(addr);
> > > > +	dw[j++] = upper_32_bits(addr);
> > > > +	dw[j++] = MI_NOOP;
> > > >  
> > > > -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > > > -		  MI_FLUSH_IMM_DW | flags;
> > > > -	dw[i++] = lower_32_bits(addr);
> > > > -	dw[i++] = upper_32_bits(addr);
> > > > -	dw[i++] = MI_NOOP;
> > > > -	dw[i++] = MI_NOOP;
> > > > +	emit_atomic(q->gt, &cs[i], dw, sizeof(dw));
> > > >  
> > > > -	return i;
> > > > +	return i + j;
> > > >  }
> > > >  
> > > >  /**
> > > > @@ -1049,7 +1100,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > >  	/* Calculate Batch buffer size */
> > > >  	batch_size = 0;
> > > >  	while (size) {
> > > > -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> > > > +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
> > > >  		u64 ccs_ofs, ccs_size;
> > > >  		u32 ccs_pt;
> > > >  
> > > > @@ -1090,7 +1141,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > >  	 * sizes here again before copy command is emitted.
> > > >  	 */
> > > >  	while (size) {
> > > > -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> > > > +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
> > > >  		u32 flush_flags = 0;
> > > >  		u64 ccs_ofs, ccs_size;
> > > >  		u32 ccs_pt;
> > > > @@ -1113,11 +1164,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > >  
> > > >  		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> > > >  
> > > > -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > > > +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> > > >  		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
> > > >  						  src_L0_ofs, dst_is_pltt,
> > > >  						  src_L0, ccs_ofs, true);
> > > > -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > > > +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> > > >  
> > > >  		size -= src_L0;
> > > >  	}
> > > > -- 
> > > > 2.51.0
> > > > 
