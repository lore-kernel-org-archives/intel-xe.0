Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4953BCD6E5C
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 14:26:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0CF910E82D;
	Thu, 13 Nov 2025 14:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TPY7tU4S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF8A110E82D
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 14:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763043972; x=1794579972;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=QH0ZDAZdhb2pdJey6peHivrGxK8o2DVXQ0ktB/aUCR0=;
 b=TPY7tU4SraN1CqHw326Pt4Ji5hf0bKl7Tc0ncEOh+xMr9lTICpqD4IEs
 wex8Q4hWL+Pfg/Jw8i7IVu4Yz/3MOl8sksPUacrMyXTSDCSv6W8DHB+vP
 RcJBYO04mypX+2VlpZUD075bg08kH4ZQCVAdudPdVdhjEhH0n8GKGKW7y
 s0h+eDeghKaROtKJ1jRoQf09cvCdN8ixtySyp5Bf6cfq89FRtJZwk4Qvk
 jgI3DP32Wb5ZjrnKjPUQxqqiibTK+M89O1qeaM31fF7mCFtKKTrmHt/hQ
 OccHyZG20QKwGnzE/ldU4xBNPABfsJw7wA44suHSV07NyJCubLB5kzQIK Q==;
X-CSE-ConnectionGUID: vSREi6OBShqr6e2K6BFI3w==
X-CSE-MsgGUID: C0r8f90CQJidTbsgb+EOaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64328482"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="64328482"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 06:26:11 -0800
X-CSE-ConnectionGUID: z1UbWQ4IQ/yi3JTVGmI0kA==
X-CSE-MsgGUID: tZVOb6TpSFWsStgomAbfRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="194505869"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 06:26:11 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 06:26:11 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 06:26:11 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.50) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 06:26:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rH5Qx5IC9bKcGdwzfKBhM+Z/YT/Zp/YbKFzbOFIluItol93Ixo4/88ID/gLo84saJ1k1ASi8XMyT6aluDhUyRm3dkUXR6A7oiXexbsiF0n9oQIQ0BMGMRZWqLRbXpp+sto3iHZEX60gVjHhjxl5JGPtb49eJZBldfp4+pMvePsJgoKfETBAhOt8+ymlWbtbx/QjsUNFz939YIaK+vOauMHocvIyL0lvKEc48x9kcbGQrXSKRsox/IXy+BijXVNFACuWWem8cvhK5clszcdablTpiBDjGYnLKPX09TvXV+clEe16E5SfLFTKV5h5wEBkzAcubGrEa8PXipu+6rO/JeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FM2gV6xnVHpGkIUtO4+9Qis4f7H+zjnZDZhml5g7ZJA=;
 b=ll9FF1zOBcUNVyBgLO0d7LFvCztxmnyRHJqaNu9xDiZbD/AaX1W4vFg75Fp7RTwmX7eOKUh2RuqfoMUuf90oVei7gLuOFziRe4J/wD+q2MDqR7frToWjHiws+UfKlnpZ1g9ulbDqx3PeHi6zKlha+dcJEmJZDR4V+9UBeGWGkbRTk7nv2qX6tdj2HZaFVjEG2KHJW6W7SaLCIi+rIC7pT6w6XJi2O5c+2lxzpqHF5Hx0JhBbH/lI3j0z7h3r686+E9Uoji59wbxJxH4LPOM7+QjY5GhV36RljqM93DMM5r0+6EZO0EHS5rZhmvl/sqC/p8h00ykEfkgrBGM1LZQSkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ0PR11MB6790.namprd11.prod.outlook.com (2603:10b6:a03:483::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 14:26:07 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 14:26:07 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110232017.1475869-48-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
 <20251110232017.1475869-48-matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 16/30] drm/xe/display: Use scoped-cleanup
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 13 Nov 2025 11:25:48 -0300
Message-ID: <176304394887.3698.6245959522925522278@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BY1P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::12) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ0PR11MB6790:EE_
X-MS-Office365-Filtering-Correlation-Id: da4e1a70-f790-46b4-1b58-08de22c09577
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dE9pV3Y0U0VYUWNObkdaMmZQMUhhRWpDNWRSY3hqeXNDc2dhdktvSGI1TGU4?=
 =?utf-8?B?dUhXekVGNkM2OXlXYlRWZ00vNWJETDIvazlaeVgwZW5wVUpYOWZoVmRNNTI1?=
 =?utf-8?B?V3BOT2JXc2IzczBXUjFITTJtYnFzdENFUVc1Y0ZWazRMYXAyeHpIbE41N2Fm?=
 =?utf-8?B?TGpweHBWSXpjeVgrZWM5emJMSUdieXp5RlBtSG1PTXVnNU5xRmdSc3lvYlRi?=
 =?utf-8?B?dTIrRmlHSnZDWit3dnovSitrUnpjVVpOemg5S2lyTjdQTTA0NG1qRm9DTzB4?=
 =?utf-8?B?YUJPU2pOTE1KODBMNDB0d2FId3d5aHFBS0p6ZW05bTBlNmJnaFZNSGVLSlIw?=
 =?utf-8?B?d3pDWEVLeGxmUzFXT1lBUHJPK2xWRk5lVTIxNXNqNlRFVVpvZ3BmODRuOVFp?=
 =?utf-8?B?NTNuWXh3SWIvRExZQkZla0VqTEhCenhhV3NKZjJnd1VLTVlQVmE4R3pwN05y?=
 =?utf-8?B?dTVrWGw5VGNhblMxWW1aVlVwSHJnRTAvcDRLT0hVemdEbjY4Wm9pVTgraThq?=
 =?utf-8?B?TUtqNU5oMGJpYXQ4SFdZemlpTytQaGU0YTR1N243SGhkSTI3TkdoTXc4NDdo?=
 =?utf-8?B?ck82UUFkTFVVUmhHU000cVZFWmJaSU5SdE5RYUMxQU5IbHJQcGV5dDZpaFBr?=
 =?utf-8?B?VjJTb2dnbGpTRC9sSUREMW1ONDRKUmpiY3VUNERaZ2QzbXVOWjJyUy9DbTAy?=
 =?utf-8?B?L2xRem0xRmU0N0dheVhCdkx3UHZqK3JsUDdpOUhhM0lyVWx5ZkpKRGJxcUUr?=
 =?utf-8?B?ang5UXAybEVnU0xnekxMdG9YNWQwK2FkeEo1Zk9jbXJzSU00M2NIcExNWjV0?=
 =?utf-8?B?NUUzTWl2RWZTSmMrbzhtdjY0cDJmdXFlS215YmJWTGVMNWcySEk3aldhU284?=
 =?utf-8?B?U0l0WS9BSDF3V3g5SGdIVjhTZ2ZVQmtCY1ZEc3RrRUlpdGVpNkJIRkdVOCtm?=
 =?utf-8?B?eEJiOHRLeUZYZm9JN2tFR243a1pUWjkzS3BzQytKd2oyY0ZTaDB2WmtGYzFv?=
 =?utf-8?B?dm5LU0U5ZzN5TVg1Nk9zaDZFZTJCMDBPUGdaTkV4U3pjVy9jM2ZSZk5uZ0Fw?=
 =?utf-8?B?b01NWENyd1cwNEpxSzJHT1BDbndTb1ByWW9Nc3JUNDdwQTYyL1dSTXFSU1JS?=
 =?utf-8?B?ZGNpVklaVnVCK05yTUlmR1ZocFZBYWc2YXF0ellOdXlDc3B4MUtFYThCLzlE?=
 =?utf-8?B?TDk3Z0FhUVZKOXlUU3E5SWg4QnRuRWVXTWx3Z3hrSndFa001NWZ3WGhCb3JP?=
 =?utf-8?B?b3dYRkMrcjBUMWI0bmZQL0NhMWJvd0NNK0I0U0ZFVlBNOFExUTFxRTZqd0ht?=
 =?utf-8?B?dzFNUzFKV3gza25QNVgweHRIVXJPTWtkREl1VWVXT2VsKzVNb29HczhvbE1U?=
 =?utf-8?B?T3FRa2RpVCt3NTA1NElIT1I3NElOZmpCTlJhc1NQVmdyY3ZvRUxoMndUTys5?=
 =?utf-8?B?UVpEdXQxNExjaVc3K1pkNFZzeks4aHZNUjhmRlhpcnk4ZG1Ed3dYQmQ5QUJv?=
 =?utf-8?B?NWc0WmZyN1U4ZEprS1hGT1FLcDdHV1Q4NEI1cDFiNFpodlFtOEdnUU9BODA5?=
 =?utf-8?B?RVNiOFZFOWFTMGNxWno1V214eXNxdURndlpSOVFQSlIrNkpleTNPa25YMks3?=
 =?utf-8?B?ZlBkS0hBQncxNDJ3RDYzRnFERm5EMGs4bUR3T2xRWHl1V3l0K1JDTDd6NzV5?=
 =?utf-8?B?OWJMZzJ5ZjRQV2thNmVKV1A5NHZLT3NwYk04WHZiMWI3TWxqaTNjVlRzemth?=
 =?utf-8?B?MHYxZERxSFNFSDltdEtrOGNyWGZNQ1pJVlB2bUpKRHFtd05FZkI4Um9RVVZ2?=
 =?utf-8?B?NlA2VStSVEsvL2MveFhJeVVWRGI2V2tmOFlCWU10NENmMWFtV24xbGg3S2gw?=
 =?utf-8?B?clRlcUlNYk9CekdwamR2ckNzS3ZjMzZZcFdzdXpDR3ltWnIwRlFYZlpNY3hD?=
 =?utf-8?Q?0DI1xkHk3+aPHqxX7X5cOjns/MawyxO5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmdYL3NBeitRNDBCZDNsUlF4RWNCME5NYlh0WU9ZYlIrcTg2akRCUUVIYlJ4?=
 =?utf-8?B?MS8vNEFPSTdKK3FaWkxYU2J6NDQvMlVZbzlxSlRrS21DRUhVMnBZcXVFUWMv?=
 =?utf-8?B?Z0E0L2NWSmozQzV0ZXZRME55eDMwZFErUnNCT01hU05IeTVpblArYXVWYlpV?=
 =?utf-8?B?S0xxcy95VzVtMkliYVFxbk5oR2o0cmVGeENmcUdjd3FXQVdCL2pWazQrMGUz?=
 =?utf-8?B?K2N1d1lPN1BzSmN3WVFjTDM2aG5ja0syRWtIcExIZ1NVeEk0RXRuODJPTmFP?=
 =?utf-8?B?cGpWcVlyTnlEN0ZLTDMrUTVnMnVMSk1PSVZsSWFXZjlqanppajZEL0ErR0dz?=
 =?utf-8?B?RXlsNGhtRjhaNHBWRkRPMjc1Z1NibXE0d2FwcEVEaDlMTzdWdU9xL2xoVzM4?=
 =?utf-8?B?NDNCVHNCM1VrZDBmMEh5NEtmaVozcjNzQkVIQlYvd1BkYlg4cmxPV2tqWXFq?=
 =?utf-8?B?NUpZbll3MlUzQ1Z0d3pudDJGVmpzOHo3enBzL2creEs4ZWZtcjl6bHpqbm1T?=
 =?utf-8?B?dm5pWDhzV3R6MHVvdEZzc3BYNWg3WUlIdXlkQ0ZJQXVaSmF5U1U0ZGtxK01o?=
 =?utf-8?B?Qy9UZHVGckJnQ3lkdXlESzNZQVp0MCtCcGdoeGZiL29BcGEyVVhBaVRheCtW?=
 =?utf-8?B?dnpCM2M3Qk1LQmFVajdFQVo3WGZ1bWNWcDJzREJBSEU1UVk2N2pVWDVvVzZJ?=
 =?utf-8?B?Q3ZqaFpvdEJQdUNrd2JPaFEzTEQvMk5QSThFVDNoaXFyRU5CRjkwTHVtREtS?=
 =?utf-8?B?ek9sbXcrd0s2cXM1YXNFcmZsdFBFNUYwS0VoV2ZNd2x5L2E5UzRMT0VCWDFU?=
 =?utf-8?B?K1N2Z0tkaks5MkowM0N2Z2FjalVsdTF2bzh6ODNjQUFBSG9IWWMvWHVid3c4?=
 =?utf-8?B?SWwybEZvRGZyTEFSL3kvVnFES2R3R0psNFptOXMxR1UrQ3lZbjBvSzVUakt6?=
 =?utf-8?B?U2o3MmxkNWtRTFd1UW9KeTdUU1V1eGRZN3p0S3VNbjNmNEtjWHhpczlNTitL?=
 =?utf-8?B?QVVvUFZ4UlcxS2VMWkV4ekhmbnBIVVhBNUNYWVRxQzVnY0JrYTBUM2hyZDhy?=
 =?utf-8?B?RVZIQ3ptU29yUXdKdTBvaDNzQjRDQlo0bkJ2dU9pMUpzcElublZROHlnenAv?=
 =?utf-8?B?aVVIb0JIWmJ3bWhwa2VpWEIxWVhmT1Fsazdqbjh3cEJXZzFvaDJIcWNzMlF4?=
 =?utf-8?B?NnBQSithZG1MMGlRcWx5NHl4WWVLMnozL0NQSnNwbkRPbzZ6N0NsdUtWWXN5?=
 =?utf-8?B?VjZSaHg0aStnUUFGczJDUVRDRjFTWjViRi91cEFOUkNqMzgwVmdjeU1YV1g2?=
 =?utf-8?B?amhUNzU2RmJsOGlUM2Z0a1RjUkVGSHR0SEx2NmdodFVabzRGcVdZWjlHSWZV?=
 =?utf-8?B?MFdWSzZGSnpzc0hDbnB1ZDRvVStPZ2ZDTlNCeU9STHFwYjFmRlFCMGlhRUZ3?=
 =?utf-8?B?THUvOGJaZmplQlpFb0dVLzVsWmhjeHI5Wm56Ynd2NnFVaytsY3ZQTTJXekd4?=
 =?utf-8?B?WHFlY21yM1Fhenk2aVBpR3ZNZzRzbTZvVWtzWjYwQURkQnQ2YjlxQkkxR0Vn?=
 =?utf-8?B?Vk96TkJYWFlwc2d6enBzREJDaDM1TVUydStxN01LQnBmcmNUeFZDUnh0WlFv?=
 =?utf-8?B?b3V5Y25ybWlKVUFVNHNRRGIxbjRzOVpGbkNTTzh4QnRjMHN5ZXRIM3dUVmFt?=
 =?utf-8?B?d29ic1prZnNBV3BlSVU3b1JGN2s3VWxXaWc2VnJJQjg2bHFZVGpGZkJJTGRV?=
 =?utf-8?B?QTlycXNpMGo5NGZHc3dUTlFkZ0JlRFVFazg0NmNpVUVTVldqRjBXVmFRSUE2?=
 =?utf-8?B?a0xwMjlWT2lUd09OdFJXcUZnVHEvM3l3RTZ3TURybXorTS9TazA4dE1KM3BD?=
 =?utf-8?B?WGUxTVF6TS94TEF0ZVBxY2VDMWFNdHcwbi9vWGdEQ2FkazhGZCtQc2xKOE9S?=
 =?utf-8?B?dU1vZlNSOGRteGVXZ1lYbnR2TUFmL2t3QW1heGU2UGZIVk5leGxhSThFSHZq?=
 =?utf-8?B?VzREWnpOWnZBaFN4a1FSdFZ0VjRYSjg5VExSWEF4cVZXRlFtNFFYNytLSFFm?=
 =?utf-8?B?ODJvK0k5cS9meHhZRkZLbTIyaFZzSHBhWFQ5TDVaR3NmRVVJK3dlUStQSmRo?=
 =?utf-8?B?VmxDSGhyMktvUzRxMTNBUTZpVDlGYi94Q3A1WFVrRlQ4NGgyOGk2RFQ5a2xO?=
 =?utf-8?B?YlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da4e1a70-f790-46b4-1b58-08de22c09577
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 14:26:07.1320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dQ2rWc/AmDFoRF/9GFC8A9qDS/ZAHn7qFF7ifZYIiwXfk8uLFuaOTfZg3vC6z90Ow2hxLrtaV1vT4rRlwezSUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6790
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

Quoting Matt Roper (2025-11-10 20:20:34-03:00)
>Eliminate some goto-based cleanup by utilizing scoped cleanup helpers.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/display/xe_fb_pin.c   | 23 +++++++++-------------
> drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 25 ++++++++----------------
> 2 files changed, 17 insertions(+), 31 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/d=
isplay/xe_fb_pin.c
>index 1fd4a815e784..6a935a75f2a4 100644
>--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>@@ -210,10 +210,11 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_f=
ramebuffer *fb,
>         /* TODO: Consider sharing framebuffer mapping?
>          * embed i915_vma inside intel_framebuffer
>          */
>-        xe_pm_runtime_get_noresume(xe);
>-        ret =3D mutex_lock_interruptible(&ggtt->lock);
>+        guard(xe_pm_runtime_noresume)(xe);
>+        ACQUIRE(mutex_intr, lock)(&ggtt->lock);
>+        ret =3D ACQUIRE_ERR(mutex_intr, &lock);
>         if (ret)
>-                goto out;
>+                return ret;
>=20
>         align =3D XE_PAGE_SIZE;
>         if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
>@@ -223,15 +224,13 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_f=
ramebuffer *fb,
>                 vma->node =3D bo->ggtt_node[tile0->id];
>         } else if (view->type =3D=3D I915_GTT_VIEW_NORMAL) {
>                 vma->node =3D xe_ggtt_node_init(ggtt);
>-                if (IS_ERR(vma->node)) {
>-                        ret =3D PTR_ERR(vma->node);
>-                        goto out_unlock;
>-                }
>+                if (IS_ERR(vma->node))
>+                        return PTR_ERR(vma->node);
>=20
>                 ret =3D xe_ggtt_node_insert_locked(vma->node, xe_bo_size(=
bo), align, 0);
>                 if (ret) {
>                         xe_ggtt_node_fini(vma->node);
>-                        goto out_unlock;
>+                        return ret;
>                 }
>=20
>                 xe_ggtt_map_bo(ggtt, vma->node, bo, xe->pat.idx[XE_CACHE_=
NONE]);
>@@ -245,13 +244,13 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_f=
ramebuffer *fb,
>                 vma->node =3D xe_ggtt_node_init(ggtt);
>                 if (IS_ERR(vma->node)) {
>                         ret =3D PTR_ERR(vma->node);
>-                        goto out_unlock;
>+                        return ret;
>                 }
>=20
>                 ret =3D xe_ggtt_node_insert_locked(vma->node, size, align=
, 0);
>                 if (ret) {
>                         xe_ggtt_node_fini(vma->node);
>-                        goto out_unlock;
>+                        return ret;
>                 }
>=20
>                 ggtt_ofs =3D vma->node->base.start;
>@@ -265,10 +264,6 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_fr=
amebuffer *fb,
>                                            rot_info->plane[i].dst_stride)=
;
>         }
>=20
>-out_unlock:
>-        mutex_unlock(&ggtt->lock);
>-out:
>-        xe_pm_runtime_put(xe);
>         return ret;
> }
>=20
>diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe=
/display/xe_hdcp_gsc.c
>index 4ae847b628e2..084baddb160e 100644
>--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
>+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
>@@ -37,7 +37,6 @@ bool intel_hdcp_gsc_check_status(struct drm_device *drm)
>         struct xe_gt *gt =3D tile->media_gt;
>         struct xe_gsc *gsc =3D &gt->uc.gsc;
>         bool ret =3D true;
>-        unsigned int fw_ref;
>=20
>         if (!gsc || !xe_uc_fw_is_enabled(&gsc->fw)) {
>                 drm_dbg_kms(&xe->drm,
>@@ -45,21 +44,17 @@ bool intel_hdcp_gsc_check_status(struct drm_device *dr=
m)
>                 return false;
>         }
>=20
>-        xe_pm_runtime_get(xe);
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
>-        if (!fw_ref) {
>+        guard(xe_pm_runtime)(xe);
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GSC);
>+        if (!fw_ref.domains) {
>                 drm_dbg_kms(&xe->drm,
>                             "failed to get forcewake to check proxy statu=
s\n");
>-                ret =3D false;
>-                goto out;
>+                return false;
>         }
>=20
>         if (!xe_gsc_proxy_init_done(gsc))
>                 ret =3D false;

We don't need ret anymore, right?

I think we can just return xe_gsc_proxy_init_done(gsc).

>=20
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>-out:
>-        xe_pm_runtime_put(xe);
>         return ret;
> }
>=20
>@@ -166,17 +161,15 @@ ssize_t intel_hdcp_gsc_msg_send(struct intel_hdcp_gs=
c_context *gsc_context,
>         u32 addr_out_off, addr_in_wr_off =3D 0;
>         int ret, tries =3D 0;
>=20
>-        if (msg_in_len > max_msg_size || msg_out_len > max_msg_size) {
>-                ret =3D -ENOSPC;
>-                goto out;
>-        }
>+        if (msg_in_len > max_msg_size || msg_out_len > max_msg_size)
>+                return -ENOSPC;

Huh.. Did we just fix a bug in this function?

It appears this function was putting without getting when the "if"
condition evaluates to true.

--
Gustavo Sousa

>=20
>         msg_size_in =3D msg_in_len + HDCP_GSC_HEADER_SIZE;
>         msg_size_out =3D msg_out_len + HDCP_GSC_HEADER_SIZE;
>         addr_out_off =3D PAGE_SIZE;
>=20
>         host_session_id =3D xe_gsc_create_host_session_id();
>-        xe_pm_runtime_get_noresume(xe);
>+        guard(xe_pm_runtime_noresume)(xe);
>         addr_in_wr_off =3D xe_gsc_emit_header(xe, &gsc_context->hdcp_bo->=
vmap,
>                                             addr_in_wr_off, HECI_MEADDRES=
S_HDCP,
>                                             host_session_id, msg_in_len);
>@@ -201,13 +194,11 @@ ssize_t intel_hdcp_gsc_msg_send(struct intel_hdcp_gs=
c_context *gsc_context,
>         } while (++tries < 20);
>=20
>         if (ret)
>-                goto out;
>+                return ret;
>=20
>         xe_map_memcpy_from(xe, msg_out, &gsc_context->hdcp_bo->vmap,
>                            addr_out_off + HDCP_GSC_HEADER_SIZE,
>                            msg_out_len);
>=20
>-out:
>-        xe_pm_runtime_put(xe);
>         return ret;
> }
>--=20
>2.51.1
>
