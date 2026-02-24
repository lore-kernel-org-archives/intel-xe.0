Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6922F3C993
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 15:10:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53DE210E5A7;
	Tue, 24 Feb 2026 15:10:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lq461PTI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A2F10E5A7
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 15:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771945800; x=1803481800;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JjvVaLq5IpnuLO/fATt4WyKbVcP67BnrWHThvHmxKvY=;
 b=lq461PTI6OfojnqDrRWVm7gEfYXfY6XphRjgDFyOkT47XO7UNYHARxkH
 C0XT2FesTXcfkRClM+h8GYlSGbo5TYPjQnPGN7E6c58GZupb3aMg/PfiP
 pxvjandr4BF3teA6eDaVfAnAqDycjZw7TDJjo4n1MOq18h4IQOYFKK6sj
 m881+ae12Buap4gFTyVGdy4uEioL8rUVUYWI3m3LXY7yoknO5+czYHtzk
 KFm1DZBFYHfjSAQtnRZbpnKYk6pAbPr/zBTMcuJwid7MGVgq/hHLkGaxF
 xDMR+ofG6zFpxUpaex1Zg098KhUv0UGbpNioh0u12IUk3+OMtGimXecAP Q==;
X-CSE-ConnectionGUID: z7rWZh1PRriU7TZ/C39BlQ==
X-CSE-MsgGUID: qVSAi9PBQaKm47AEb7Et7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="84326358"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="84326358"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 07:09:58 -0800
X-CSE-ConnectionGUID: yqELlCHYQyCqlyAzB8VlEw==
X-CSE-MsgGUID: jMQ9aa6WSM6JEzCnZZ1dcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="220042820"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 07:09:58 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 07:09:57 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 07:09:57 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.34) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 07:09:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JDVSdDYpB9/b7sAMxjOFryE4w0b6fFxIJx2NpuNINhqzlxr1a1J0kk7nTrpPPRstjfCSRdAa9uIXSNBpbHYYJ9O0H7+dg8nP3gdAVHZJQkgRF7X6UyzHRe2eLa2XCTSCarrv8uxi4WH19OI3iT/KMOcB6kAwg7vthzu7HX4//OYIlO5sbxxtX+DkLwrsUvKQwtCC7iZJ24D/+SQhJZuMjJEZTFwkR/CS2P20KZd+xL51SZjcGygB9aZjv9JalKoknaItq7rlUxcfFHWYKyKKlDjqn+WReP0uYsBFWEeWhGzBoizcEo12Rh2ot3BFJp2PWdyVaagXKNlgLT/AZG6IIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYB2UzRswSlElUwh3pNFcNG2RWUmVuW0ftCG95YrDaM=;
 b=u5Xolq7Ukek04PwikOshiLqm8OVLicQLhpSr4NseSOMV2iKjglP7zOlpbeamWUGVCQJY8KprOXMR44DUMbwF6Y/11U96fWoJNiv+7wSVarB+jMtChkzFEjXm2A8WC4/KjMg4ZkjXAs7IJxSQkt1aZlPcFPqAN3ZAu58PBYe2YSSCbq2vuqdDWdDMPR0KKfu+kP1UEydTq8TYJo/zQylF6CGGVMaStxRu4nOdMJu5aFR6IztehzmQBNkk3+RiiNEHnWxJWoFGVvXgcQUPs1XOM7oXHgwKaDiaiQZP8nxZDLu+lZKtJwERP4BwrBfJbXJJM1P7PgJ4FH5JcLgIg6PS+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by MN0PR11MB6109.namprd11.prod.outlook.com (2603:10b6:208:3cf::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 15:09:50 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 15:09:49 +0000
Message-ID: <cf352e6d-88f9-4e91-aa55-b0a70ee33db0@intel.com>
Date: Tue, 24 Feb 2026 20:39:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 8/9] drm/xe/bo: Add purgeable shrinker state helpers
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <pallavi.mishra@intel.com>
References: <20260211152644.1661165-1-arvind.yadav@intel.com>
 <20260211152644.1661165-9-arvind.yadav@intel.com>
 <d5997029095cdcbfddbebb5441137d99230af10f.camel@linux.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <d5997029095cdcbfddbebb5441137d99230af10f.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0218.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::17) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|MN0PR11MB6109:EE_
X-MS-Office365-Filtering-Correlation-Id: a526072c-c277-4a0c-24ca-08de73b6c12a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZS9iU05UV3dqWU1DM2pHc1AwNldjUU9nUmpQcVNhT1FNZnp0Mmg0WUVIbEtL?=
 =?utf-8?B?amhJb1dYRTkvRW1XVGJ1ekQ2WVFGU05IenpmQ2dwRDZQRklQNjMrMXNBRGFN?=
 =?utf-8?B?aVZEVDVtV1dGTGc3RHl1SEVLM3RPUnRZeTlrMjRNTmIrdStQSDBSUmgzdVhp?=
 =?utf-8?B?RVFIaGNBUmM0MXp0WjRBQ0xZT0pGNnVSZEZVZC9oR1UxZzVpWVV3aE5lVEp5?=
 =?utf-8?B?citUUXcxWHlkSnQzZzRBVEg5N25JdHVFT3FUQStJa2ZwRlFWaml6WXZLRTBS?=
 =?utf-8?B?UDJSd3pFbXYwT1BaZHNOaFoxaitDaVhPVkJiZzF1UFRTTnp5UVplcDk0bGxI?=
 =?utf-8?B?MzA4R0Z5RWNPZFoybUs1dUZrYWN3U3NHNU5Ba1QxbDE0aUI5ODFxZUlxYmFS?=
 =?utf-8?B?eFJKWC9PWW5MZFMvRGo5VCtpUmlCUlRUYXpQZlZBMmZLTUQzQUtqZk9idjUr?=
 =?utf-8?B?MUxYYW1NOG1LVG9UNlVuNUNTdzBHR1dLWitWalZNeSthandhcE5najdpTVRn?=
 =?utf-8?B?dXZLOCszSHNPa3NtbTFxcmZwVHN5MFZDOVIvYjljOURqNlIxcWJjNXQ2RTF2?=
 =?utf-8?B?VXdzSXJmWFV5Ykp0bFBDN2gzZUw1RE5QUEF3YVRIMURQalZZQVZHUkN5UlNx?=
 =?utf-8?B?S01CSi9yWVdCTHdzMW5NM2FHTy9aTSs2ZUZjZnNiNWc3MmxOWHFyV09EdWZJ?=
 =?utf-8?B?QmhraHZxbEU2L2kzbHlQaENtWC9EeGxNNmdBZEhKSGQ2OGhRdk9VVDlTSUxM?=
 =?utf-8?B?eFQ2aWRtOTcyQitoVFVaWXRXMXUrQ1VvVDVoSHpjS0xFcW95ZDErWjN4NkVR?=
 =?utf-8?B?K0J0dlgvdmZQcmtJYlh6SjMvTWFyMDlkZWdFaEdmMFM1dmpCY2tQQ0NFT1FH?=
 =?utf-8?B?Ukh5QWFMTEFnLzg2cVFMMDVyQ3kwclRyeDQxdlJydzlvdlpwSG5iOThabGVU?=
 =?utf-8?B?U0FTcldvTVpQRXMvaEtWcWhzWkNZRnQ3UXUrZWdJTGJEcEVZNjhZSXBzQ29w?=
 =?utf-8?B?Q21IUVl0SzhpNUF1eGQ5bHVLOWdnWjh4dlJLU0FQUTdIeG5ETHFZZnUwYmpF?=
 =?utf-8?B?RWVSVEgxa2pOWm1FRDRUcWVjT2JCSGJmditqRVN1SDA4aFRSb2xCZGxyVWEx?=
 =?utf-8?B?UnlpVytVeFZDNUg2RmczQzh5NmxhMEZFS05FdjVnWXRJVTZOSXVmbzVyVTEw?=
 =?utf-8?B?REhRbTFCRW9aQTI5UmpWTmVvenBzSFpTaEI2MzRSOU53MEhJTkhCUXpjQkpX?=
 =?utf-8?B?VTRRR1RXMDBOajNEaFNvUXA4azRaNjlQLzhSeXY2MlJMK1RPRkFRYitjWWdy?=
 =?utf-8?B?cGhudURDR0JYSmZkc0Zxdmd4bG1FRStpV1hITmRzWUpsN0JUOWt2RkNsN3VJ?=
 =?utf-8?B?U1E2OFhnL2tHcnNKekN1Zk53bWw5Q3MxeW1kbURkVEI0Q3RUc0dFWUEvdmxn?=
 =?utf-8?B?TUJaNW8rNGc1TGl0R0tIb3R0TUdGdmFUL0lvT3JpV0tFaGI3cS9oVm5QYWls?=
 =?utf-8?B?cDZSa1Y0cEtveW1OQzl3TDd1dUhjbTBqZXg1VlcrT1ZBYUE2YUxhZFdERkEz?=
 =?utf-8?B?YjJJWGJIb0pnK2M2bDQ0UnJzQzRGbzVPR1BXTGZkUFcrMHNhSXdHOGVPMFBr?=
 =?utf-8?B?WVJmQ2owdXNEdlZuNzl4NFNxdnZuMXNNZ0hvekRlcVhkT3lKdFRVb0JoS2cx?=
 =?utf-8?B?S1Q2ZWwzdzVEdzlCcTBjQk41WGJhWmtkT3o3K2NBSHBjVmYrdUlWVzBQRWxr?=
 =?utf-8?B?VWpGQjdpODh6TVptK2ROd205dFZGSlg2N04zWGFabHJKNm1oakhwdU03RXlv?=
 =?utf-8?B?VnJOSnV4QXJjRm9xQ3FKRkhsc0FCSHNwczFDa1hyckI1d1NFN05obC9rR0lj?=
 =?utf-8?B?SjFNUnVuQXhJcGZ3TVM2S0hDMXkxNGtHdlFybEhUc29Lb2RTTWtkNzJYRDNt?=
 =?utf-8?B?UTVJL2RzL0JZV1phMTlvNEFLNHg3eWxuNVU4blNvVHBBWHBRSlo3ZTFqV1NC?=
 =?utf-8?B?U2dTczdzRURjRXR4bUFYaHdkVnY2Z1dKd2lFMWw2R3U0Q0kzRGFycGV6OU43?=
 =?utf-8?B?VytEYWY2azNmdWd4UDhQaiszTzEvSWZTT0ErRHNGWTZwbUtsMGlnRzRjdWs3?=
 =?utf-8?Q?APyg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTRTQ0FqNGp2ZWxxRCtlZGNLRVdOOCtuQ1BTczlRYTlYWHdEejJKbFVCMm8w?=
 =?utf-8?B?MThOZ0hKSTl6cDNsTzZ5M3JhZ3JGVU5XOWc5WTQ5RjVna09OdEpzZ1hkZXFF?=
 =?utf-8?B?bTBBVmd4ZE9UNmw4b043QVdwa0V5MlluTURQK1Z6VjlYMlRKOVFVSkU4aDNl?=
 =?utf-8?B?aGpQRVJ5NG9ZNGQ2UjJoZkVQa0Zja1IvdG5OR0t2UjUwMFBkTXI0ejlHS1pi?=
 =?utf-8?B?YlNDdnpXZ3J6cXUzZkV5R21jNnQxblI1d0U3cGtKNjFqMEZBR24vRTd4dU5B?=
 =?utf-8?B?Z1lTUjQzSTltTTFKMnhOcmdiYnpVZ1dZeVVCSm9MWDJ0VWZxcUJHUXhiMndj?=
 =?utf-8?B?aksrZFNUWTFsV3J4cmhsd2U5cGxQYjRSNEdMTVV6azB0Wnp1YlpZSGU0Z0NZ?=
 =?utf-8?B?UVN6dWc2bUd3RmlkQzJuVlhldTYzS1NTSE1YTktpdVhSKzU1SXhaSm5wTjZ1?=
 =?utf-8?B?RzRqbi9qOExQN1AvK3pWakxSaUtDVEtla25jMHFpNWVkUVhoVGhxbVg1Rjcr?=
 =?utf-8?B?WEdPTDRWb0czVHh5QTNNcVA1a3VKOS9mRUVmRnp2N2VuY1A2TXhDRmMyaW0y?=
 =?utf-8?B?RWZuL1VvS3hoNVhUaWVBMjg2Z3JwUmViQXc2RDM3ZnNwL2RVVlBzcEo1Sm9v?=
 =?utf-8?B?d3I0Y2doNFFsMnZyeDRpSEM0UDUyM2dzbjV1NGQvbHpYVTBKOXJaaWRMbm10?=
 =?utf-8?B?QzM1R3NsVkJ4V0pqNVRMZ3NYbzFYQ3JWVHRHMWQrVHdBU3RyRTBRRndnb2hr?=
 =?utf-8?B?aHhRR1hLaGMzY25IU1lpaUl2RmxXLysvTUV2M2xRUEJYNkVoRG5MSnpRcGNn?=
 =?utf-8?B?cm9sL05PR3dMaDdJVU1KemVhR0g1NGVLTG1FbnRBNGltZHdQMlZud1Z4bUNt?=
 =?utf-8?B?aDkwK0grazVEM3ZkTENwTXFSaS95b1FlYXBzYUcxQXVLbHhVYjNtRmJaNkNT?=
 =?utf-8?B?cnFGT2NkaUkxaHFaL1NFbmFZNlNJZXl5L25TdFkxQUxmaUd5SDB3TmVhZEZs?=
 =?utf-8?B?SnUzZGl1WTllRURxbzcvOGwwZC9Tb3d6V0tTQnFmS21NOWNEaTFTczJLSjNh?=
 =?utf-8?B?dy9QM2Y4cHlGcGRONUVLYzBOR01ScHFVTjhSWU5LUXFKN3A1N2VWQ0dGa24r?=
 =?utf-8?B?WXBWdmduVnF1OUpZb2laU1JhM2lFQndxVGRWd3NxeWlzQWFoblU1SENGTFlu?=
 =?utf-8?B?ZlNoTFVTYnNZRXQ0ZTJtRXgrNHNpNU5iQUxjS2RxNGNoVGVGTG9ja2tOd2xv?=
 =?utf-8?B?ZFJSMGZzL1FKWlVSWWpZS2lINldGMFF3TS9HRzBtMTl2NHp0UTVWMXlYMWRG?=
 =?utf-8?B?cTBFWXpraUlrb0dBZFY0aFA3ektGVDhWenpXQ2FVa0VXRHE3REtrQkdYbVQy?=
 =?utf-8?B?cndQZThTaEcvdys4MGlKcG9ZVlR4NUdwTXk2d2ZXcDBQbzZJU1hEdThrVzlr?=
 =?utf-8?B?S0hCYmIwckRGblQvUUJmTmVzdjJraVdCRlVGMEVaUkJuR0kyUjQrMkdTaDRU?=
 =?utf-8?B?bW9JakZUQklQaVJ5R3RybmpNV3RvTVlLZ2FyUkNBZ20xSVpkNndmeFJEanUx?=
 =?utf-8?B?S29FekNwT2hUVm5vQ2VFSTFCOWRNWTZxbnRmektyQm1mRWUyZ216RWZuUU41?=
 =?utf-8?B?QjQ4SmVFa3IvVW51L2VkZjE3aThvbjNMY3ovVnk2OE0wVXdJQmkvMkhlcjBl?=
 =?utf-8?B?NHMxU2RCMEZKcmRyZ1huMVVScmNVV0JkclBFbUZzTnZBRnNJN29MeittU2hm?=
 =?utf-8?B?TjFJYURXNzNURDVQZnJhczJQbWZjQ3NMOWlyRFFMVnVkc2k5Si81cFZ3dG80?=
 =?utf-8?B?dGs0eFdVUDMvcGFTOERvaFI3bTR2YWRDc3NxNUlHZkZZeGZkVUR1ZGZ0d3NL?=
 =?utf-8?B?NEk0dExKdGZhbnFSTWFHVWpMSWswUjQ5Z3duVW9lMStvSXdRanp4YXdDdVpX?=
 =?utf-8?B?bFpaOXhDZVVZMisvU09FckNoelBheTd5UjFkOElKSERGRjVFM2F5S1JXdHIw?=
 =?utf-8?B?TlhVOFRWVjFaSGV0dDVQSklTQlZZSVlpbVZzWlQzdDhWSWhHN09FZ0piUTla?=
 =?utf-8?B?cjZmNjk5UWpYZFVqUXBFRVFZa1B1Q2I3eldwR0g5cjhZNEs1dnJqbEpOUnI0?=
 =?utf-8?B?UmZUZ0UzTGRXaHJ2Z04wQk56NXFybFNEYThxN2p4OVdIYTdCNUlFY040VnRx?=
 =?utf-8?B?eCtyakV0THFiUHZscUdKLzhJandjdTZicUZWVEFVc1NuejFobjhyOEV5bmY0?=
 =?utf-8?B?bXUwZ0YzRTRqeFVXOXBKMGV4eFVYZVFiOHptQ3A4cjRaMU5Pc1BXM0l2Nk10?=
 =?utf-8?B?aXdPMWpsbE9aR2xIeU1DRG82KzlkdklRQUN4YitnT2ZyL250UjE5UT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a526072c-c277-4a0c-24ca-08de73b6c12a
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 15:09:49.8740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CKVScy0T+z9116FG28XLH1UHfFa0pp1pyimz6bEc5rCH4PQ7YZl2Qe/JVgGv4eMi5wczAleZtxtJeWN0t5qVog==
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


On 24-02-2026 19:51, Thomas Hellström wrote:
> On Wed, 2026-02-11 at 20:56 +0530, Arvind Yadav wrote:
>> Encapsulate TTM purgeable flag updates and shrinker page accounting
>> into helper functions. This prevents desynchronization between the
>> TTM tt->purgeable flag and the shrinker's page bucket counters.
>>
>> Without these helpers, direct manipulation of xe_ttm_tt->purgeable
>> risks forgetting to update the corresponding shrinker counters,
>> leading to incorrect memory pressure calculations.
>>
>> Add xe_bo_set_purgeable_shrinker() and
>> xe_bo_clear_purgeable_shrinker()
>> which atomically update both the TTM flag and transfer pages between
>> the shrinkable and purgeable buckets.
>>
>> Handle ghost BOs and zero-refcount xe BOs separately in
>> xe_bo_shrink().
>> Ghost BOs from ttm_bo_pipeline_gutting() still hold reclaimable
>> pages,
>> so attempt the shrink to let the shrinker block until the fence
>> signals.
>> For xe BOs whose refcount has dropped to zero, return -EBUSY since
>> the
>> destroy path will handle cleanup.
>>
>> v4:
>>    - @madv_purgeable atomic_t → u32 change across all relevant
>>      patches (Matt)
>>
>> v5:
>>    - Update purgeable BO state to PURGED after a successful shrinker
>>      purge for DONTNEED BOs.
>>    - Split ghost BO and zero-refcount handling in xe_bo_shrink()
>> (Thomas)
> You'd need to split this patch so that the zero-refcount fix gets into
> a separate patch with a Fixes: tag!


Noted, I will create separate patch .

Thanks,
Arvind

>
> Otherwise LGTM.
>
>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c         | 69
>> +++++++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_bo.h         |  2 +
>>   drivers/gpu/drm/xe/xe_vm_madvise.c |  8 +++-
>>   3 files changed, 76 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 7ee85c8eadde..9484105708f7 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -863,6 +863,66 @@ void xe_bo_set_purgeable_state(struct xe_bo *bo,
>>   	bo->madv_purgeable = new_state;
>>   }
>>   
>> +/**
>> + * xe_bo_set_purgeable_shrinker() - Mark BO purgeable and update
>> shrinker
>> + * @bo: Buffer object
>> + *
>> + * Transfers pages from shrinkable to purgeable bucket. Shrinker can
>> now
>> + * discard pages immediately without swapping. Caller holds BO lock.
>> + */
>> +void xe_bo_set_purgeable_shrinker(struct xe_bo *bo)
>> +{
>> +	struct ttm_buffer_object *ttm_bo = &bo->ttm;
>> +	struct ttm_tt *tt = ttm_bo->ttm;
>> +	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
>> +	struct xe_ttm_tt *xe_tt;
>> +
>> +	xe_bo_assert_held(bo);
>> +
>> +	if (!tt || !ttm_tt_is_populated(tt))
>> +		return;
>> +
>> +	xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
>> +
>> +	if (!xe_tt->purgeable) {
>> +		xe_tt->purgeable = true;
>> +		/* Transfer pages from shrinkable to purgeable count
>> */
>> +		xe_shrinker_mod_pages(xe->mem.shrinker,
>> +				      -(long)tt->num_pages,
>> +				      tt->num_pages);
>> +	}
>> +}
>> +
>> +/**
>> + * xe_bo_clear_purgeable_shrinker() - Mark BO non-purgeable and
>> update shrinker
>> + * @bo: Buffer object
>> + *
>> + * Transfers pages from purgeable to shrinkable bucket. Shrinker
>> must now
>> + * swap pages instead of discarding. Caller holds BO lock.
>> + */
>> +void xe_bo_clear_purgeable_shrinker(struct xe_bo *bo)
>> +{
>> +	struct ttm_buffer_object *ttm_bo = &bo->ttm;
>> +	struct ttm_tt *tt = ttm_bo->ttm;
>> +	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
>> +	struct xe_ttm_tt *xe_tt;
>> +
>> +	xe_bo_assert_held(bo);
>> +
>> +	if (!tt || !ttm_tt_is_populated(tt))
>> +		return;
>> +
>> +	xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
>> +
>> +	if (xe_tt->purgeable) {
>> +		xe_tt->purgeable = false;
>> +		/* Transfer pages from purgeable to shrinkable count
>> */
>> +		xe_shrinker_mod_pages(xe->mem.shrinker,
>> +				      tt->num_pages,
>> +				      -(long)tt->num_pages);
>> +	}
>> +}
>> +
>>   /**
>>    * xe_ttm_bo_purge() - Purge buffer object backing store
>>    * @ttm_bo: The TTM buffer object to purge
>> @@ -1234,14 +1294,21 @@ long xe_bo_shrink(struct ttm_operation_ctx
>> *ctx, struct ttm_buffer_object *bo,
>>   	if (!xe_bo_eviction_valuable(bo, &place))
>>   		return -EBUSY;
>>   
>> -	if (!xe_bo_is_xe_bo(bo) || !xe_bo_get_unless_zero(xe_bo))
>> +	/* Ghost BOs still hold reclaimable pages, try to shrink
>> them. */
>> +	if (!xe_bo_is_xe_bo(bo))
>>   		return xe_bo_shrink_purge(ctx, bo, scanned);
>>   
>> +	if (!xe_bo_get_unless_zero(xe_bo))
>> +		return -EBUSY;
>> +
>>   	if (xe_tt->purgeable) {
>>   		if (bo->resource->mem_type != XE_PL_SYSTEM)
>>   			lret = xe_bo_move_notify(xe_bo, ctx);
>>   		if (!lret)
>>   			lret = xe_bo_shrink_purge(ctx, bo, scanned);
>> +		if (lret > 0 && xe_bo_madv_is_dontneed(xe_bo))
>> +			xe_bo_set_purgeable_state(xe_bo,
>> +						
>> XE_MADV_PURGEABLE_PURGED);
>>   		goto out_unref;
>>   	}
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>> index 0d9f25b51eb2..46d1fff10e4f 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.h
>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>> @@ -272,6 +272,8 @@ static inline bool xe_bo_madv_is_dontneed(struct
>> xe_bo *bo)
>>   }
>>   
>>   void xe_bo_set_purgeable_state(struct xe_bo *bo, enum
>> xe_madv_purgeable_state new_state);
>> +void xe_bo_set_purgeable_shrinker(struct xe_bo *bo);
>> +void xe_bo_clear_purgeable_shrinker(struct xe_bo *bo);
>>   
>>   static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
>> b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> index 8d55ea78b6d1..235fff2b654e 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> @@ -289,12 +289,16 @@ void xe_bo_recompute_purgeable_state(struct
>> xe_bo *bo)
>>   
>>   	if (xe_bo_all_vmas_dontneed(bo)) {
>>   		/* All VMAs are DONTNEED - mark BO purgeable */
>> -		if (bo->madv_purgeable !=
>> XE_MADV_PURGEABLE_DONTNEED)
>> +		if (bo->madv_purgeable !=
>> XE_MADV_PURGEABLE_DONTNEED) {
>>   			xe_bo_set_purgeable_state(bo,
>> XE_MADV_PURGEABLE_DONTNEED);
>> +			xe_bo_set_purgeable_shrinker(bo);
>> +		}
>>   	} else {
>>   		/* At least one VMA is WILLNEED - BO must not be
>> purgeable */
>> -		if (bo->madv_purgeable !=
>> XE_MADV_PURGEABLE_WILLNEED)
>> +		if (bo->madv_purgeable !=
>> XE_MADV_PURGEABLE_WILLNEED) {
>>   			xe_bo_set_purgeable_state(bo,
>> XE_MADV_PURGEABLE_WILLNEED);
>> +			xe_bo_clear_purgeable_shrinker(bo);
>> +		}
>>   	}
>>   }
>>   
