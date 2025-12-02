Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51AD5D1267F
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 23:16:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0493510E5C8;
	Tue,  2 Dec 2025 23:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CUxWi5rC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F8F10E5C8
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 23:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764717402; x=1796253402;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gvGwXIDZ8GxzIBzS9UE0owEP91g5ZGMzWpuOG6K670Y=;
 b=CUxWi5rCCAlAm1HWb4tZgzFu1h6V+D3cpnrRUvhzmaKAQYNbT3zdVfMw
 6JIdKaA7e9qO85dzSuMfJCyJqzIsf2UTfEESl+3lCjR4t6lTZJ3Nm67rQ
 1weKSW7ry2KMD1fPTClrlAyPFkBwF8Kixxlg4bDsRfoNgb1UJb+uAG6nC
 kIUMqREPxkDcD+vPVq0e7vPAbPYODJuHT/KKR42hsNInvn73hSx+rK7Yh
 QH8x3wNYNZw9VMylZENTveWzzezIZtx86NtwFXwpkp2tbCkwo+0v1T3dK
 XTW1JJ6HWNcRQy29S3O/0/uVH+CurEZdVkGn0rqaP3Cs35KV1SQnd0B5O Q==;
X-CSE-ConnectionGUID: fMwHEjv7SOqGax0QSRdEag==
X-CSE-MsgGUID: Wb3KMJmrSsGcrVTBF6XeNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66592620"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="66592620"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 15:16:41 -0800
X-CSE-ConnectionGUID: tFopZ1/ySSKCQXDUQlhHcQ==
X-CSE-MsgGUID: OYJ6epwSRYeA4Y42bCHcEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="195302002"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 15:16:41 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 15:16:40 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 15:16:40 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.26) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 15:16:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kCDhWPBuCY+siL5S4SIatt4fno4jyMpteVIdV/ZTeEXVthBMRNK8LP24J3wMwDJSKl/UgrZxiTFh37LrFMSmruUBwlWlCu8Lf0O3UOZWsUwPFjSI/ko0EKRLRQCFKJmnc55yfgPjLz/Xl/6aEw9fgUCjocB3OxWKe4AGsz/X+wxEQgEQM1BSCgX6P2vxQhIMeiwnZWgnZX95c81sK6DzHys2trMTvBaZhQQahHtKyv1aFV0FNdBhIfBL6ozBpf8ir2tFQz3Asz1CpVPAtHOPcUHCkHnWXqAtMy1L16uHbZ+5RSkLbitoiaUXimMGHSpzWs5829+UTcz4SEbWVcsABA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LtetKA/eZM41/T8G4ZIy4vTUDWt4fJlpQGqyT97Lm4c=;
 b=FtEvDkYnP/xO2DavnnTLdJYFSk2aUg0ZegmbPM68tPZ9b18hTVGP84ldTCqh6nxQ84r7dmfkV6xxbfeCvS6Jx+n6vXFcGnFAzBl0zNpKtxwKlwbJOu+K+A4D5OR4sTv2uqmmojTy62i0mD52bZkHFpS2bxWTr28l9Cx6tG+QNixoFfTTZA+3CygHZnEEPc2JO3Qq84iWxz0vDEe4PRCZbIeFvxrOMkYUOsSHRqpO1hTPf8S3fo5i28uv/5K3FYtskoC0hQywBjfMGS8RLyoaWUUJ9wDRGQfmKuPbnW83ksYta7ClHnBlqc9uoScSMRlO+bc7kE42NhNnaHfg2N+Emw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CH3PR11MB7893.namprd11.prod.outlook.com (2603:10b6:610:12e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 23:16:31 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 23:16:31 +0000
Date: Tue, 2 Dec 2025 15:16:26 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/5] drm/xe/oa/uapi: Add gt_id to struct drm_xe_oa_unit
Message-ID: <aS9zSoN9EhvUbqvM@soc-5CG1426VCC.clients.intel.com>
References: <20251202025115.373546-1-ashutosh.dixit@intel.com>
 <20251202025115.373546-3-ashutosh.dixit@intel.com>
 <aS9nxJK9YYbDmpj0@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <aS9nxJK9YYbDmpj0@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: MW4PR04CA0161.namprd04.prod.outlook.com
 (2603:10b6:303:85::16) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CH3PR11MB7893:EE_
X-MS-Office365-Filtering-Correlation-Id: 27cbd0fc-5e49-44b9-7bd2-08de31f8d406
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SE0zZWNnT1VGazNOMzZzKzc1VzQ5VFZ2WU81bXhZQjJERGhZSEFZTDVMWE43?=
 =?utf-8?B?OEVXV2hVRnNFcDRCUDdHWExxMkdlc1lSK25CYXVTTS9kWW9BczNOYXpueDRu?=
 =?utf-8?B?MmJSUFVWL2w5VHlKeWttN3Zod2MzaEF5ZlVPYXJUdlp6M1BvNGNvTHFBVURl?=
 =?utf-8?B?VVZ3MGR5MGhkWXlsbXdMVld6Wk1Wb3VKVnVBZW5jOFExZ1d5UmpxeGVGNmlk?=
 =?utf-8?B?d2czNmkzSVFyNDA5TGZLT3lxNEEwc21QVDFNSHQreEhsb0pkVnBINGlTME0r?=
 =?utf-8?B?T1VlMWlXcC9aL3JZZnRiblpmTDZiVWhxZ1hSSlRLbExyOHlRQ3k4OHh3dlM2?=
 =?utf-8?B?N29FdG1EZ2hsZEcrQjh5dWgyLy96eE51SUxWenpEY1RZSXU0ajZrSE1JSFRl?=
 =?utf-8?B?eEJGQ0tRSmNFSEtwQVErcG1LRVkwSGxZZndjUWYwSjZyc3k5bisweXJLRlgw?=
 =?utf-8?B?OVRJN1JPK2NVK29Bay9nRDdQNjBGM2M1M250VXdjdUJibk9WazlpNVdWdlY1?=
 =?utf-8?B?MDBCcE1KeG9LTXBCaGRHUXRZRnBuckkvWXVYdUViSXBPVEpRK09FTEJNdWVv?=
 =?utf-8?B?eDk2U1ZOdDVYa2pKdlpWRlNpYUU4Y3oyOFhtWEJoOUtGQ0o4Q2pEZkN2ak1r?=
 =?utf-8?B?b0Jtek5idy96cnVqRnJDZjdjSDF5QSs5ejg3VXp0R3d3WE9Kc2tsbWhRYXVX?=
 =?utf-8?B?RFoxSkd1ZzhPdk5OU25oNmZpUmZLS1dmMDZXQ1k1YnFteXYzOUF4a3MrZnBq?=
 =?utf-8?B?STBIQlJJY1FmeTI2M2c1SVA4UlYxd25oVWJzbmZGaFpTRnY5YmRMa2NXN3Bl?=
 =?utf-8?B?c0xyakhmQU96aTVTcmZlN3dMM0xlSWVWNkp5NHcxSm1YSUlkdVpVczBkVEVO?=
 =?utf-8?B?SEthZjA4T2NoUExiRjdRbG9scTNSTnk1STFTcGxTenM5MGVRbjhKam9LbWVy?=
 =?utf-8?B?N0M0ZEprUG9NeXB6OWJSOWQrNlcrVzI0cm0yNEdPWjhjQWRQV1lYVFY1TGw4?=
 =?utf-8?B?RlRhMjVBQnFEY2R1aW96ZStISHpPWTljSDRZdGh6OC9FNlhTRzIvQVFsbjRs?=
 =?utf-8?B?d0ZTWm1UOTZCai9pVjlqMFl4VFUycllhOWJEMFRtY0k5TVRNSkNINEhFd2Zm?=
 =?utf-8?B?N1dVaXlQRlh1ZFVBUFJ1blRTVkpENzNCejJxc21aNGlxTENleitVYmpvTnJ1?=
 =?utf-8?B?Mi9MOWdaaklnb05Hcmg0RVh3aVlSenJ4bTdIS0src3NFOSsyTm9OSSsrQ3lr?=
 =?utf-8?B?NVdqU3Vpb1NtNXZWNFd1bzRubzNGdGl1VEo4bVVKUjFibWJyRjk4OUlJUHZq?=
 =?utf-8?B?NTRyYzF1dEFibG1Lbzh0VVA0RnRBaU9vbzB6WHhVTE1TUWhYaTdDL1R3TUEw?=
 =?utf-8?B?MU8wb0xRTTdMVDdBMU5seG9kL1ZxZDBCd01VN1RDci91Ymh4SlByWm1ySDBY?=
 =?utf-8?B?NE9wOWgyNENBc3FIaVNCcGlCOHBOQVk0M2ttOTlEcmZhMHAyUkFXZXBGcTVl?=
 =?utf-8?B?cThWNUlZNkRHVG42cGRCK0laZHVVWlRmZHFqMWxlUTZXaGZyMC9rZEQyTko0?=
 =?utf-8?B?TFhKT0pMMXdldFpucXBmN2JaYnZXbmtsZndVYUFuWlpsd3Arako5TDZVeU5S?=
 =?utf-8?B?ZVMxbVFXMGVUYkZybXNOem43ZW02YS9IR2habFpBVjU1R1BtVVRwWkdXcWpu?=
 =?utf-8?B?Vkt4bnR4N1RSc0JxcXBCYVh5Snk4Z3dQclpFMFJLWEhxYzdRVU5YRHAzME9q?=
 =?utf-8?B?eG9ucmplMzZKUlR1MldRTFNiWFoxSW9nd3B3QXdkV2hKK05sOU4yZEx2ZjZO?=
 =?utf-8?B?UXE1WGNYb2NoWSthQitpM1JBZkN5RGpqRng5NkhFTUlDWUZ2cS9BLzB6VEFG?=
 =?utf-8?B?d3BWWGExVWNTdkZyMlNzVCticnA3VndEZDZkV3FJQTdBbWxQa1BEdGRWOE1I?=
 =?utf-8?Q?peig08heLXSLLIjI1EQw2Br2P9fKpy9h?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDQzWnhONUR5ZHZqQnQyZmlLeWp2cjZuM05WejRRN0JKbDFxMmF1bUtYczNR?=
 =?utf-8?B?aWtQOHA1T3BaeSs3WjdYNlpTemZIZkpxVlg5am5ZdkozM0dYTlQvbm1FZndj?=
 =?utf-8?B?bzRMK2tzclBLTVFHeEJpdXNJcTZvTlRTN1JTZHlxSFJwdU42V2hrakExRFRS?=
 =?utf-8?B?WHQrNGFFWkY0QXF0aHRNYzBKQWx1WitZVmFsaXBOeUJvN29YZmFzaUpleURY?=
 =?utf-8?B?dnpDSmlTNTVWdXg0V1ZmK3dRMzJKMjhBZ08zRXR2d2ZQeTJOempWdFBQejNz?=
 =?utf-8?B?QkRRdXRwOTdJbHhCN3pFYWJEaGxRZzd6bnk5NXZCeEd5RXZkQys3akgzT3Ar?=
 =?utf-8?B?R3d4OWFRdlh3cnV6S3dZNXZyN2wyTWwyMGpBUzU3YmJLQnVDUDZIc1BNdFZJ?=
 =?utf-8?B?Z2ZCNWI1dm54STdSTlBZbXZnN2ZHWHdIYVRXdjdkOWhjelpFVmQ1emFSS0Jm?=
 =?utf-8?B?UzdsYTdldUN5aHd1cTJ5eVVCSm1HSE9WNXdZMTMvajhmdFBtcFJ3d2k3eE04?=
 =?utf-8?B?TTJPS1hnUXBpdlJlWHcyVGxXVjJHYitrY0pCMjJTYXRua1ZlNFJEQlZPbTEz?=
 =?utf-8?B?RWF1aUI2Q0hwdXpRM0MwOWJYRVpScHl6Z3NGYllQRzlEMU53WEVjSTdFWU1U?=
 =?utf-8?B?SUZtbHJ2YW05cEc3YzRadVJsVmdoS01hNlBLT0hnNWxnN2pad3FzMjQvNDJI?=
 =?utf-8?B?cnZUdFVqTUJ5SjIxWCtmbytWT2NCbkJvWWVLQ3M4N1FEZWxlM2dXbEZQS0pN?=
 =?utf-8?B?TnFYbllGK0s4NVpDcFY4TCt5TXNMNURnUG5UMXlRQmdxM0NyVDZpck5EWlFo?=
 =?utf-8?B?bXFtVTVEbkcvYlN0RzByY2hORmEzcWsyazIwVi80c0ljcEhlMWpKYXJhY3dX?=
 =?utf-8?B?SDhtOUR3MUhNRUt1UGNBL2ptaTlhRjRCWXpaYmlNNU16TEhtN1FncFVPRlpJ?=
 =?utf-8?B?dkN4R29LOVRBbWR1UWo3a3oyWVdOYndzWllHUzFiVEVYV1JmODZmY1Vzblkw?=
 =?utf-8?B?SGJJOE0vc3dDR0FkVTZUVlRpZUkvRUNZeEYrVnVJQ3luSGs5WEhwY1Q3ZjJn?=
 =?utf-8?B?dDE5Uk01dlpyT2lYc0NuTFRRTEZLOG9MSmh1dlB6Z2xLU2hzdjRoUG1Rbmpl?=
 =?utf-8?B?bWxjSGhZQVRCNmlhMXdkV3o1ZGtCcmxoWmFydUdhNitrd3VEeVRBTlFROFhX?=
 =?utf-8?B?VkdFcmRUYiswak5TN0EvckRGMitmeHdCUjFqTmtmWFI1VFhGZ3U4bFVicm83?=
 =?utf-8?B?OWV5ZThTTDhMc0huOTl5bG1QR3JMb2N6ZEZtS2ZxcFFoR1RlYXlvVG9KM3NB?=
 =?utf-8?B?M0VYR0ZMY1BpVmpiTmN3aWZ3TUZUZ0U0ZUUyN1FmUzhvcWRNSzBIbWd4WEN4?=
 =?utf-8?B?ZHBlTkFRQVlFNVN2VnB4d1ViQzZCdzMrMzFCMmtrVlI0WGwzd0c3T3dZa0tr?=
 =?utf-8?B?anZHRzNEYXhKTm5zR1Vidlk0eWZ1STlqMG5pVmlaQW9iT0pPMUhMaTA5NjRX?=
 =?utf-8?B?NEtENGlMTkYvTGFkN3RpeW9mZFRYcHU5bW5hU2NYNXRubVVRZEhpNmlnQXVj?=
 =?utf-8?B?cjRDcFZqMzZ0M2s1cHNtUHFPaDJHRllyMURRdHg2eHlkK0M4SWlkd01ISmlX?=
 =?utf-8?B?RUo2ODFyQ2pnanFoeU1PM25FVFdRNjdZMkRpR2VBeFppejdBNkNBUSsrdHZM?=
 =?utf-8?B?eTJ0K0ZieXFYR0I4ZHJ4ekNyOXV2a1FKT0hOUERVc2ZRYVBaV0lkU29aTGJx?=
 =?utf-8?B?TWEwcHI5aFlTUHhZYUp5bUdJWHk3M1hQOUFnK0gxN3dyMmpCL1AyUmUzajhF?=
 =?utf-8?B?QUUvYjk2dEk0TW94Z1BqMUQyMW1ZUTJpaWdBMlRobkN6elNsaEkreU9pQlJP?=
 =?utf-8?B?MFc1MVVCeVhmQ3VuZi9lZ2J4NzFwMjRNSmdxRUREREEvNGxOL1N4amo3ZjJS?=
 =?utf-8?B?RHhtczFDRkxzYjdNcDJvNm9rMUViUzZFZFovbWRjZWlsaHFTMVVTWEVsS29O?=
 =?utf-8?B?U3F3OEZ0aDg4djVOdm1meDZ6TVAxdkxQWGtiL1JEa3VtOTJFNU5waWNYNEpD?=
 =?utf-8?B?d3VtdytIRHFZemI5MFFkcDVxNVk1RTRVZEZtZGZmaWY2TmVNYmYyc2p4M0N4?=
 =?utf-8?B?TU1VUURML3JVa0plZ0MwWmdCZlFEV3ladmo3bXhna2RmMms4amJxcytCMW5Y?=
 =?utf-8?Q?1VkjUY9/qgjW+gp12fX6Jks=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27cbd0fc-5e49-44b9-7bd2-08de31f8d406
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 23:16:31.3476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JxWP6R45vklWWA9n+1wWyzU77nC5KHroedKsYeOLgi698L7bkuN2bZplfi3f/xBl0TQ1VpEaWWB3JvHeHwFpheKGoaTLbjBbknC4VXzszJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7893
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

On Tue, Dec 02, 2025 at 02:27:16PM -0800, Umesh Nerlige Ramappa wrote:
>On Mon, Dec 01, 2025 at 06:51:12PM -0800, Ashutosh Dixit wrote:
>>gt_id was previously omitted from 'struct drm_xe_oa_unit' because it could
>>be determine from hwe's attached to the OA unit. However, we now have OA
>>units which don't have any hwe's attached to them. Hence add gt_id to
>>'struct drm_xe_oa_unit' in order to provide this needed information to
>>userspace.
>>
>>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>---
>>v2: Change gt_id to u16 (Matt Brost)
>>---
>>drivers/gpu/drm/xe/xe_query.c | 4 +++-
>>include/uapi/drm/xe_drm.h     | 9 ++++++++-
>>2 files changed, 11 insertions(+), 2 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>>index a7bf1fd6dd6ac..18bd8047ebfdb 100644
>>--- a/drivers/gpu/drm/xe/xe_query.c
>>+++ b/drivers/gpu/drm/xe/xe_query.c
>>@@ -682,7 +682,9 @@ static int query_oa_units(struct xe_device *xe,
>>			du->capabilities = DRM_XE_OA_CAPS_BASE | DRM_XE_OA_CAPS_SYNCS |
>>					   DRM_XE_OA_CAPS_OA_BUFFER_SIZE |
>>					   DRM_XE_OA_CAPS_WAIT_NUM_REPORTS |
>>-					   DRM_XE_OA_CAPS_OAM;
>>+					   DRM_XE_OA_CAPS_OAM |
>>+					   DRM_XE_OA_CAPS_OA_UNIT_GT_ID;
>>+			du->gt_id = u->gt->info.id;
>>			j = 0;
>>			for_each_hw_engine(hwe, gt, hwe_id) {
>>				if (!xe_hw_engine_is_reserved(hwe) &&
>>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>index 37881b1eb6bad..4413c7f918740 100644
>>--- a/include/uapi/drm/xe_drm.h
>>+++ b/include/uapi/drm/xe_drm.h
>>@@ -1681,12 +1681,19 @@ struct drm_xe_oa_unit {
>>#define DRM_XE_OA_CAPS_OA_BUFFER_SIZE	(1 << 2)
>>#define DRM_XE_OA_CAPS_WAIT_NUM_REPORTS	(1 << 3)
>>#define DRM_XE_OA_CAPS_OAM		(1 << 4)
>>+#define DRM_XE_OA_CAPS_OA_UNIT_GT_ID	(1 << 5)
>>
>>	/** @oa_timestamp_freq: OA timestamp freq */
>>	__u64 oa_timestamp_freq;
>>
>>+	/** @gt_id: gt id for this OA unit */
>>+	__u16 gt_id;
>>+
>>+	/** @reserved1: MBZ */
>>+	__u16 reserved1[3];
>>+
>>	/** @reserved: MBZ */
>>-	__u64 reserved[4];
>>+	__u64 reserved[3];
>
>Maybe I missed this in earlier reviews, AFAIR, we should ensure the 
>MBZ part in the implementation (i.e. check that reserved fields are 
>zero when validating the params). Not sure if things changed with Xe 
>KMD.

Please ignore, since this is output data.

Thanks,
Umesh
>
>Regards,
>Umesh
>>
>>	/** @num_engines: number of engines in @eci array */
>>	__u64 num_engines;
>>-- 
>>2.48.1
>>
