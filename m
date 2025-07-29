Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4B4C87FC9
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 07:42:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0485110E5EC;
	Tue, 29 Jul 2025 07:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ad1vA7Mw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C15C10E5EC
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 07:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753774940; x=1785310940;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iJDoROLAcwfWfCAgjo+2cyZTx5gnA6Km4WiqCTNNuio=;
 b=ad1vA7MwG6HghrvoyOUPs94oYHeBPr26x8BxpzfAlOKWDOc5VbLAAiv0
 Yijv+xuI4vu8Ctnfzlli0lQB3TVmEZbd1UV7SUBHzWZqQ0TzTRUcls/ti
 YkdrjUG8eXCSFCqveG89bLg7qBpbArnzeN3CjIuFv3ELYDtVgaWTlm29r
 lrFkeoSGkLVY4RddGcWhCp0085s/i9cYFOPe6lFSwjGUVkEnlb90OuGzu
 /qQGtOTbfWF0ubIUSbUf21y+D1zh3yeXUhYqCYCkaqdteCZ/hAtOiRJZ/
 BjA2XZ0JIp/MIcyREXXuBGhx+YQ1zMuBUkOjXCX299zcvV8B/ZT0LVcUh A==;
X-CSE-ConnectionGUID: 2IKzmK0STiucYc/qK4ASNg==
X-CSE-MsgGUID: uJnyVL8KQsqfT4EWPhdaTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55918071"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="55918071"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 00:42:19 -0700
X-CSE-ConnectionGUID: J/dh78MhQYu4TPsTO2MXKg==
X-CSE-MsgGUID: 9HRtjwdeQ8Kv/AQFV+V8AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="161904730"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 00:42:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 00:42:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 29 Jul 2025 00:42:18 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.44) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 29 Jul 2025 00:42:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CUdHbVqgDGdtuFDDlSEYq0PhsJl+9e4i95GT8yrI3sUiXseaZ/4U/C5B3t7is/544SHgrS2DaWd/+LEQiThHgm6WCmfnE2dKqZGymGPD3NtZcIvctXeSaVbR/2lYzDIAHUhYP2boUIQR4Q3wC4Ss5lHAsc9hhi9rAFviJQ8CIRMt7t2bKLobCfZLRV476xx98apWLZa7TbEmxVG3UsnnH3ziqV0hXbNp/1+PweP/sunccJxadjpoHbEll/SOoUQnMMSZCwLcTt56yYZmr/Ubz1e5q79bAvhyY/s2Bwq9hJ3YAlPHAp8QI5N8PDTHMXcYSHfQ8GgjBa3THqWum96fvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tU2+VOAV+4HKMrE6A/EKfKBD/pVvWACl0P0+FCjSulY=;
 b=HOdXvuDpPMjhEaUVvCNDrYuYIhbLqaO4bw1nGluEmjvLlZU/5NOYod8DGbTcbS0xjgq2ZKPMC5s+anzNOjCRxaKXvbHSF7QYCkMsv0w//kt5SD085IM8Pq/2jywNzdVSa3/ouMEaOefpbpwNoVskGv+w+U046KqKhrTCdJUXY6FTmM/gQLjs0jZqBnNt3MPhU54oKuXW7oUZX4I8i5n/zRmNy2FOivmhsSJPUwol8Oagb+4i5VR5ZUpph2WahkMixwcftNkBkwCGXNRYwlniprBFxXYH8bQZCNSMYTLmfPef66u5ySWDCLgy0QTdABrv/WYE1kDkTudmoaRYWgt9Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DM6PR11MB4642.namprd11.prod.outlook.com
 (2603:10b6:5:2a2::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Tue, 29 Jul
 2025 07:42:16 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e%8]) with mapi id 15.20.8964.021; Tue, 29 Jul 2025
 07:42:16 +0000
Message-ID: <898d4e01-64b6-4937-b2ce-1504021217ea@intel.com>
Date: Tue, 29 Jul 2025 13:12:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/23] drm/xe: Allow CPU address mirror VMA unbind with
 gpu bindings for madvise
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
 <20250722133526.3550547-9-himal.prasad.ghimiray@intel.com>
 <aIhCyZKx1edN1JMf@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aIhCyZKx1edN1JMf@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::14) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DM6PR11MB4642:EE_
X-MS-Office365-Filtering-Correlation-Id: a8b2541c-9d36-4a24-9f90-08ddce737043
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Tkx5T1ZMQ0V6T3ZTZUVDRzNDSWR0UVNidkZFV0cyOUZhUmgrWjBYS0wwZ2N5?=
 =?utf-8?B?TTJ5eUtod3hQSmJ1Y1BSdE5VaXlOWXBlUkhqbkFIN3B5RFNHYkhpelNYUXYz?=
 =?utf-8?B?WXNpT2h5eHpYcFBKNVQ0Ulp5NUtDeXFEMmZFMnpBL09kb3NDWFkzZmxJNHNw?=
 =?utf-8?B?eVlLZmIwNE9KVDJ0L091eTc3UzVTY1laQ2NKYkNsVUJveTRGdVZHUFVZUU42?=
 =?utf-8?B?Umc2VEFQbGR0dVc5YXF4Y0lLS1YvcGIxR0lrNSt1L1kwcytYNU1BZ3ErMDRE?=
 =?utf-8?B?TFFMbFNjVjE5dUpCTjhVcENjc1VUT08zSC8zVTlSNlFkWm5zSzdNekxLY2sr?=
 =?utf-8?B?YkRlaHlHdTNiM2hqNVRmWER6K2hvTUJuUHdzQktsaHNYbFlWYzZrQ0hSTFdy?=
 =?utf-8?B?N3BuejJCWmR6MHoreU80YStBWlc3L1NEbWc0b3E0bG1CMHIrZDR5YUJ4SzB1?=
 =?utf-8?B?UEQzT1JoZXNLVG5GSjdKeVF3dGZTZytjR3hrb3pvVDJIMzBhck9hdm9pUTda?=
 =?utf-8?B?RHRUMUdtKzAzdEZvWjc1SllXa1hhM3hNVHBMWDlJQzVGY0JLMGsyR3IrOW9w?=
 =?utf-8?B?NGNKWVFESm1SaW9mR1V5YVVtSzlmTFZFLzB0cVhXbk1BU2FWNSt5eGRvY0V3?=
 =?utf-8?B?L21HTU42ZXFycUxuUEQyOTlMU2lRenJGUndCUUxEK0tpRjNsR1NFamxSRmRl?=
 =?utf-8?B?bWlYSHphNTBmSEdSSFE1eThqekVXTmFvVzhDc3lPeUR6TnVpOWRKTjFmc0RW?=
 =?utf-8?B?VXowVElKYWtQQnZoUU13Y1FQTm9yZzZjZkxhczJKSjg1dDQySy9pbUNPeUpC?=
 =?utf-8?B?cnFkdnQyVVNIVDEzTDRYU2hLNU5wN3JpQ3hYMjU0NUMzUFRaMkc5V1g5dkZV?=
 =?utf-8?B?b25FeXJldVpzMC9XM1ZrNVhvWDFORkowR2FmWHhlMm1IeThlMy8wSnAxOU1D?=
 =?utf-8?B?OGdBNG5NbENYY1hPMkJEUW1QdkZDRU1LUmM3UGpqN2RsWXVac1QrT2xJV2s1?=
 =?utf-8?B?YllyUTdnNjlwNTlzaUlaaGFBc0xXd2ZZdDRLbG96a1c4bTVtNERQM01tb21W?=
 =?utf-8?B?WE56ZlYyNWNGZmxFeXhMcThNQ2R4a2x0NEhnSWJhZHBHSDBnVWMxaU0vUmV6?=
 =?utf-8?B?SmV2NTQyWktHWi84c3M5V3lpdnlqdDl0RVA2eHFsU1o0MTdjSno4NC9Va0ps?=
 =?utf-8?B?WGZ2T2FLV21YcDVyMDRpQzlRM0NnNEM5MEdpbC9DT0U0bVRmUWRreWExcWFH?=
 =?utf-8?B?RVEvaVkwclhtbWtVZ1hjMHBkSXZNU0J3SWxHSENzai91dEx0ZWQ4ODhQTFlz?=
 =?utf-8?B?cStzQitlem4xQUJ4blB0dXZQbnZIdGtxVDlDalJtQzdZemNJYTNCamRPVGE0?=
 =?utf-8?B?dU9MK2J3Zld5LzBablo2Sm9SaWpyS1o4RnpadUxmZHYyWCt6R0Z5dms3TTNR?=
 =?utf-8?B?ekFqczgxRnE4b2R3TFdiSG5XZ1ByNTVPRC9sMVdkRFNQNGVPR1ZndVF3a3J1?=
 =?utf-8?B?MG1rcm81OVI2MVJZTmpFb3RCQXFkaGxvbVJNN3c3U1BiV3AvTVdKMjRGeVlZ?=
 =?utf-8?B?NXZuQUFMT21UR0JBZW15L1JWaGZaREpZNllMRDB3WS9OMld6by8yd1hjZmww?=
 =?utf-8?B?QnJzOUtWT1JpRVE4RWF0aFdTUHZLNG9NS0VubkRXdWRMQW4rSUNzbGZObEZk?=
 =?utf-8?B?a3J4T09GN0NRdWRlNmFUVWc2N2lORWg1K0t5Wjkxakl5UmFhbFk2cGdzVzBI?=
 =?utf-8?B?VjNOeGEydlA4MDJ4N0VxUE1lNTIvb25PZno4UDhnS1BNS09EZStpaGxjYktF?=
 =?utf-8?B?QXdzeFhFbEdXU3kyMTZrc2xHR2doVlRNQlhkcWtibmt5WjdWZEZxS2xjUkdG?=
 =?utf-8?B?QStaTVludGdBcFBzRGxLUjdZSFhoaXpvZE9mWEdOQ3NjbG14ZHV5Vkp4NVls?=
 =?utf-8?Q?QkhWfyHAxCE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkJYQzZET0xBTVVRbEhUcHpCbzAvMHRFTklrTjhsS2FxM2RqbkFFVFdwTkt2?=
 =?utf-8?B?eEU2VFhKNzRKc0RVSStiaVRKNDlZeXQ5YSs4K2lyelNIZk5IWDlXUWtmZXN6?=
 =?utf-8?B?Skw5L3lNci96bjRyaStCRUNlWk41QkdQbDlQWlIvVzJnYXpiR0Z4WU80QWk1?=
 =?utf-8?B?L3Z5MlUxamluNWF0VmM4QWlsSHhSTk91Q3VlOWxhbmRsTjk2SHlVbnNPZVNB?=
 =?utf-8?B?TEVLTHpqSUtXc2hEaHdUMm9qQm44VGF1Y3MyRVlCeTBQclNicEFMMVI0Qm1M?=
 =?utf-8?B?T2UzbkVqZjBMOTRiTU54VGFubExnbFlPMkQ5YkVqTXhoR2M0QzNUbDAyV1pG?=
 =?utf-8?B?MXY5ZFo3T3hYTXlMTm43V0kvVXMreS9oN1FqbFMvUzViWUJSS2dsZ2JOTDlV?=
 =?utf-8?B?ZlRROEZ2b28zQ2tLM1RuMGNMRndpY2ZRNXB3dFNheUpFekJjS0MrdUM4RGZR?=
 =?utf-8?B?T0cvem5uNTBiTTlsNmhPUlVYZmRpenc2Y1BPYTNUMUNiVGtTNDVUcFZGc1Ba?=
 =?utf-8?B?My9nSG5aVHJhTTJJTkR0d2ZXZUhWOUQyalAyS2Z5Rm5rUy8zRjFiOTNNN0hi?=
 =?utf-8?B?QUpHTlVBajZlT280SlRIZWlodmpJSnNjWFQvRTRVaXZ3amxGNzl1QlpPWmk0?=
 =?utf-8?B?aEpudEtMbEJ5azlBTUxaVEhyUWJYaFpxUHJyQ3JBYXNtUjg4TUhWOUdpLzFx?=
 =?utf-8?B?Rjd1bkJRaHNLMERKd1QyK1hlMEl2WGlBTVg0ZWxiTHN1a1N0czcraGdoek1N?=
 =?utf-8?B?SmtqUTVIQk0rRkdLWmdUeEI3dG12Tm9FVEJjZHpzTGc0RUJCZkhzeGNVQ00w?=
 =?utf-8?B?bnJ0N0pzZUZJK3NHQUNnKytWSTBPT2UxWmt5MkJ2ZUhCb3BSVFJVdmM2L0FC?=
 =?utf-8?B?TlhETy8wU2RGaktpbHFEMitlSUF4MlU4MG9oN2E5QTByVmVLS0d5dnZUOEpj?=
 =?utf-8?B?OEVsZnBlNVZ1RVhOTEREVDNrQjYzUS9GUi90K2JQVWJsOERqSFlQZUFWbERI?=
 =?utf-8?B?YzZYTFJZbEp2L01Na3Zsa3dsVUpOMWdTSUlMSThqbUpaNHNORlNyZkt3Vzk1?=
 =?utf-8?B?NUVPQnBmOEEzVVpMNkU0NDUyaXc0c0tXVkFvU29uU09tUFJUdU1JR1JHMVFm?=
 =?utf-8?B?NCtnekdPZXdPaE1acXp0VlozelM0Zm9ob2VuNzdtNVc3ZmNYZStqZ0R3RE9P?=
 =?utf-8?B?NmhpdnlPR3ZUVVc5SU5WOWlkSmhFaUNXZm50amN1ck5RdlFVbFhLUE9Tb0wz?=
 =?utf-8?B?WWRGV3F3TTdJdXpRem81dW5sdExVNjRsT044TDM4VXduaGc5b0VLNW81RTVu?=
 =?utf-8?B?MDhsLzFrM2YxTkNhRTcyc3pRZEMyUWl5aHg2UlVQOUkxMHBXemZXSERlWW01?=
 =?utf-8?B?L1NvUStFblFTRkxuakwrTjZOMDdURXFRdFQ3WW5RL1kyNlN6cEd4WkU4YUJm?=
 =?utf-8?B?MzNLRHRJTFpTUThLMFI1Q3RUNHRLZDFSYzZLbGIzNDRsSzZZOXNzLytDbE83?=
 =?utf-8?B?cnEzUytSTHNjR2srQ010UUptVTRkTmxYSXVwd29tcUJTWFE4eVFERW5GaDgy?=
 =?utf-8?B?MjFjV1NZa2VMOEtQVTNPRlpaeUo1TkdyakdMTlJQYkZrVUJwbEdtUXRkVWhw?=
 =?utf-8?B?S00zLzJKbUhRN0p4dC9HKzJOeHFLWHpRaTVaKzZWNmJRL2tScTZHL3dUOEw5?=
 =?utf-8?B?WlZiY0JJNEFDSHJaWUp5dTg2QmxuTDR1K0VsWTAvNDZ2SmdyUU9VWjE2TE50?=
 =?utf-8?B?VXdBVGVzclZ5ekxMYXBQcksxcHpkUXVaTFRhNVM3Yk5MSHA5U3VYcVZGYVV3?=
 =?utf-8?B?UEJKNkYzaGg2bmh2NFFWcTdaTjI2cEgvSWppRHdUMFFXd3AvRHF4TkduN3Zo?=
 =?utf-8?B?Wkd3czdJQkZ0TldyeFZSaGVBSS9sS2VQT1RuSUtIZ3p5Q05oS1dGYmNOUUhB?=
 =?utf-8?B?M3RDMmVWeTFsL3RpdHFHcHZzRUpEQTJ4ZUtVL0VzRVo4N0NrbHJLUkdnd2Zo?=
 =?utf-8?B?bkRKQjV6aktTeE9DSFIzemUxT3lkU1F5L2Z0K0JjdHUxTEtGcld5aU5hcGpp?=
 =?utf-8?B?c25qdDk4cTZ4MlppbmxPbG45NnN0cWFoV09DdlJOeHBrL0tTUVVYRXhHUWR4?=
 =?utf-8?B?R1dlei9hUm1CZ2dkTklvWURMMk5OUjZMc1ltREVHV3RqZXlUVnlCTkNZYXdD?=
 =?utf-8?Q?DAjKNzVAia/LCvLkmnlD/Hk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8b2541c-9d36-4a24-9f90-08ddce737043
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 07:42:16.0011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6onhkAByA/TocPt60Wd4ywR/8fHtHQEgaoZChybMALKkTs75MZtH6LnXhnpMdoh45C5rQ/zZHgPxnQCp5wYMHGSaZdKuwxBGqYhUawXErQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4642
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



On 29-07-2025 09:10, Matthew Brost wrote:
> On Tue, Jul 22, 2025 at 07:05:11PM +0530, Himal Prasad Ghimiray wrote:
>> In the case of the MADVISE ioctl, if the start or end addresses fall
>> within a VMA and existing SVM ranges are present, remove the existing
>> SVM mappings. Then, continue with ops_parse to create new VMAs by REMAP
>> unmapping of old one.
>>
>> v2 (Matthew Brost)
>> - Use vops flag to call unmapping of ranges in vm_bind_ioctl_ops_parse
>> - Rename the function
>>
>> v3
>> - Fix doc
>>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_svm.c | 28 ++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_svm.h |  7 +++++++
>>   drivers/gpu/drm/xe/xe_vm.c  |  8 ++++++--
>>   3 files changed, 41 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>> index a7ff5975873f..ce8a71b80811 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.c
>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>> @@ -933,6 +933,34 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
>>   	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
>>   }
>>   
>> +/**
>> + * xe_svm_unmap_address_range - UNMAP SVM mappings and ranges
>> + * @vm: The VM
>> + * @start: start addr
>> + * @end: end addr
>> + *
>> + * This function UNMAPS svm ranges if start or end address are inside them.
>> + */
>> +void xe_svm_unmap_address_range(struct xe_vm *vm, u64 start, u64 end)
>> +{
>> +	struct drm_gpusvm_notifier *notifier, *next;
>> +
>> +	lockdep_assert_held_write(&vm->lock);
>> +
>> +	drm_gpusvm_for_each_notifier_safe(notifier, next, &vm->svm.gpusvm, start, end) {
>> +		struct drm_gpusvm_range *range, *__next;
>> +
>> +		drm_gpusvm_for_each_range_safe(range, __next, notifier, start, end) {
>> +			if (start > drm_gpusvm_range_start(range) ||
>> +			    end < drm_gpusvm_range_end(range)) {
>> +				if (IS_DGFX(vm->xe) && xe_svm_range_in_vram(to_xe_range(range)))
>> +					drm_gpusvm_range_evict(&vm->svm.gpusvm, range);
>> +				__xe_svm_garbage_collector(vm, to_xe_range(range));
> 
> There is a corner here - the range could be in the garbage collector
> list...
> 
> I think to fix you have to do this:
> 
> drm_gpusvm_range_get(range);
> __xe_svm_garbage_collector(vm, to_xe_range(range));
> if (!list_empty(&to_xe_range(range)->garbage_collector_link)) {
> 	spin_lock(&vm->svm.garbage_collector.list_lock);
> 	list_del(&to_xe_range(range)->garbage_collector_link);	
> 	spin_unlock(&vm->svm.garbage_collector.list_lock);
> }
> drm_gpusvm_range_put(range);
> 
> A little convoluted as it is only safe to check if the range is in the
> garbage collector list after it has been removed from the notifier,
> hence the need for extra ref counting here.

Makes sense, will update in next version.
  >
> Also I believe this code path will need an IGT specifically to test this
> code path.

Its part of plan and being tested by me, just instead of 1st fault, I am 
doing prefetch which populates 2 MiB range.

> 
> Roughly...
> 
> buf = aligned_alloc(SZ_2M, SZ_2M);
> fault_in_buf_on_gpu();
> madvise(buf, SZ_1M, some attribute);
> fault_in_buf_on_gpu();	/* Ideally showing different behavior between 2 chunks */
> read_buf_back_via_cpu();

Thanks.

> 
> Matt
> 
>> +			}
>> +		}
>> +	}
>> +}
>> +
>>   /**
>>    * xe_svm_bo_evict() - SVM evict BO to system memory
>>    * @bo: BO to evict
>> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
>> index da9a69ea0bb1..754d56b4d255 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.h
>> +++ b/drivers/gpu/drm/xe/xe_svm.h
>> @@ -90,6 +90,8 @@ bool xe_svm_range_validate(struct xe_vm *vm,
>>   
>>   u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *vma);
>>   
>> +void xe_svm_unmap_address_range(struct xe_vm *vm, u64 start, u64 end);
>> +
>>   /**
>>    * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
>>    * @range: SVM range
>> @@ -303,6 +305,11 @@ u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end, struct xe_vma *vm
>>   	return ULONG_MAX;
>>   }
>>   
>> +static inline
>> +void xe_svm_unmap_address_range(struct xe_vm *vm, u64 start, u64 end)
>> +{
>> +}
>> +
>>   #define xe_svm_assert_in_notifier(...) do {} while (0)
>>   #define xe_svm_range_has_dma_mapping(...) false
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index a56384325f4d..7f3d0ad04b3f 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -2663,8 +2663,12 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>>   				end = op->base.remap.next->va.addr;
>>   
>>   			if (xe_vma_is_cpu_addr_mirror(old) &&
>> -			    xe_svm_has_mapping(vm, start, end))
>> -				return -EBUSY;
>> +			    xe_svm_has_mapping(vm, start, end)) {
>> +				if (vops->flags & XE_VMA_OPS_FLAG_MADVISE)
>> +					xe_svm_unmap_address_range(vm, start, end);
>> +				else
>> +					return -EBUSY;
>> +			}
>>   
>>   			op->remap.start = xe_vma_start(old);
>>   			op->remap.range = xe_vma_size(old);
>> -- 
>> 2.34.1
>>

