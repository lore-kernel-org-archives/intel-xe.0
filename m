Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFECCFC501
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 08:18:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 131EF10E3B3;
	Mon, 14 Oct 2024 08:18:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NPCrQJ+M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D257710E3B3
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Oct 2024 08:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728893901; x=1760429901;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oQDbRqH/QjtUr1wDhhuBChqHPGLeSkgTl2EKO5xgR7s=;
 b=NPCrQJ+MN7TjRJWiUnrsPQ4S6h/lPjqsti+gHw0OWHZyCbyiqOMbkBpg
 z1NCCCPuOcfX05L0BwAXJXnjB7l1ESB+lUorqfRzEL6t87tYzB+Jpwrr+
 vU6hoRS0ti+Lhtg4m/87YQSsiB523teGG9ktXr6FzQlmSYzdzhIRnJnDL
 Qs7nR4hEOsoFxfU49bSHIRMM85RMt40ymhU8orKE1O2GNRi3F5fSJChH1
 gGofPt8M45nMqEqfxiCulCqRoKpp+kiZXrj1c3wGEMqVY0vOVrNlpfcXL
 kYrAuB7gfQNWx33VHfw+w7mhJDXCoTRr8QSSQ3F09hTmmX9jR1DPwjc5i A==;
X-CSE-ConnectionGUID: xoMQP1GOSjul6YNVhCPwvg==
X-CSE-MsgGUID: PYMWMhvTRdOkoret4qWlCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31926711"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31926711"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 01:18:20 -0700
X-CSE-ConnectionGUID: j9CaWNEjS8CCInrvgyPvWw==
X-CSE-MsgGUID: OXUlk9CNRhKZ2EpNkxzkfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="82275049"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Oct 2024 01:18:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 01:18:20 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 01:18:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 14 Oct 2024 01:18:19 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 14 Oct 2024 01:18:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ndt4N2+6xc7Bk0Qqq4keJtgPSCOooWFtpqXi4YJz2VZuR1b3R1nyzxQVX1KTujNoCD7xTfj6ZVodc5DUB4d69lJDfVe/mNkrLDNv7CJMGAJx8kepoJr6eNSJr+xJ7FzZjU9OkQdUmHm3eIckZSJZnAHURHM3BoizulcNqspJEA0SQBec4+FIq+VF3TTp/Ktz7FveWhn95DMuFE4hUrvBa7EoIjQ0Zt7x3zv2WdalwSvvgn9xwX94Y5RazAP/k98Taco+YN/m+zfqxTfFTGrkPWNSSKKyeTBB6VWAamiPDbkrRlkYHbwjZS1O44tdAXiHWMw88/tia9cCAXMxNGQbcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MCba7oBDTOjEUG7Xj2gQzwYR4t7yH5iXuiiamVJMyqg=;
 b=fdfDVXUROUNn/7+JPRUBZAE4Bd7OIl+7WsYuaTPZZnS9ydRxc5klWa37R4XcL9SU6C+pMO1vCUD6HON47yxPXMijP9wE3EWip8qEXZZYllX4cweajx7yv7MGLwsTHaH0QAW47e/J51SP5lbURKK4eQoj7ux2Cd4PyopqlRS3OOhJrTM8sJXcn1IwFH2Zhxh+JbUs8WDJb2/fKhQkfnmValzYweItubZPobouuOvOnp1SMvZJVFlIrO+N0mJY+FK4G4Vo3L7OwsXt9dSDIe4OFYwACwOFLpQWX2I1YcI6u/fkfd/luA3lNLPQ+f843HKVf7P8/om8nEgfoD1ByZmjfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6614.namprd11.prod.outlook.com (2603:10b6:806:255::11)
 by SJ1PR11MB6300.namprd11.prod.outlook.com (2603:10b6:a03:455::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 08:18:17 +0000
Received: from SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746]) by SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746%2]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 08:18:17 +0000
Message-ID: <8bdfbeb3-5a02-404d-bd58-74e471f29905@intel.com>
Date: Mon, 14 Oct 2024 10:18:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe: add system memory page iterator support to
 xe_res_cursor
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Mika Kuoppala
 <mika.kuoppala@linux.intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20241011-xe_res_cursor_add_page_iterator-v3-1-0f8b8d3ab021@intel.com>
 <Zwndjh6knRv2Bs0P@DUT025-TGLU.fm.intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <Zwndjh6knRv2Bs0P@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::18) To SA1PR11MB6614.namprd11.prod.outlook.com
 (2603:10b6:806:255::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6614:EE_|SJ1PR11MB6300:EE_
X-MS-Office365-Filtering-Correlation-Id: 92c183e6-baae-4d74-049e-08dcec28c173
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S08wVWVVYml1dUVCRnE0M2ZxMHh3SDZ4U3dXQ3R3aExqcHhNN0lwUEdDOFN5?=
 =?utf-8?B?ZFJXOUJmMnZZSTJSNGhqWXhweTkybVV5cmFhcjJRcm15aHVONDRGdXdNNHVQ?=
 =?utf-8?B?V2o1bUlVeGtJdVcrT29XZS9sYXF6VjBvYnR2WkRMRk41SzJlOVM1VGMwNUQy?=
 =?utf-8?B?dmRCejBmRkQ0anlneHNSemoxckxINVB5cDkvd0hSVzlJKzN6eitJOVZQVFpH?=
 =?utf-8?B?QTVSdExDTGVPVkxPOWNoZUJNajkyWGdzc3hoUkdLUmxGK1huRFdnN2RtME1C?=
 =?utf-8?B?QXU0TVg3STJXc0hWc1kvWXE1bTM3WHBJNEI5Yk5NWmhXbFJvU20zWUFnejR1?=
 =?utf-8?B?YzNIRWVFTlBQNHdacW5xbENJTU56aVNNN0NZL3BpSnF2VlA4WFNsU1dZOWM5?=
 =?utf-8?B?a1BiSXZ0R2I2MjczdytWaUhYM3NiVHlCQU95V01kZklrWlplb3NtRFhZVzZh?=
 =?utf-8?B?OEtBYkhabmRlNTkxb2Q0b0R1bktNN2U1K0xQdnQ5TTlvL1FMdHNIa2VhUURx?=
 =?utf-8?B?K3BGWldQTTVOcUFBcTkrcHJHNUg4WVdDSUZ5OCtnNUJBUFRUcmlNcVZRR1dN?=
 =?utf-8?B?Y2ZXM2JUNDBQbmVRcExrVjRaQ2VEUU1zMFhDVWZoU0hVc2dtWWQ1ZnVwaFp0?=
 =?utf-8?B?amkxSmFZZlhob0JHUGJQdGRuZlRrQk5hc0NtYkNRZFVDYzFWaDFMVks0cksy?=
 =?utf-8?B?dnNPWWYrSDdwUGVkMGZ4L3pTekV0TVFma0ZBL25MRk9KdkdySCtCWE5UVFVD?=
 =?utf-8?B?MUM4VGtsM1IyeEFsSWRqMGduZlN3aDQxUGQwVlJvUTNvZE1SRzJvam8zYm8w?=
 =?utf-8?B?RlA2akhrYWNGTlFhVUErMDVlTjdGOHF2SG1Fa2xJTzdKSGVlZGhadVVVdXRr?=
 =?utf-8?B?cmZtalo3aDQ3TlgrV2VjU1djTVNSTU82V1dmWWowTDFnenphNXFzZ29Ta0Nq?=
 =?utf-8?B?aFlKK24vbGNOTmZSTVpXQnZnbHFHNmdRcnAxS3VjNjBoWlRZcXJDeTFFUGc5?=
 =?utf-8?B?SGZ6RGNrcFIwb0wrQWlCZHRnbnNWM3hmQW02QlZTdVdDMkkrUVVJcUUwQXQv?=
 =?utf-8?B?M2pUdHhyWlo1dFB5eW5ER2xCcFA5T21RMVNYVVUrWGRuK0pFQlQ4Y0FqWGZV?=
 =?utf-8?B?SVF4M0luRjkxdmNRVlRqR202R21GbXFram9UdlpvQzExdEpvYWZXU2t1L2d5?=
 =?utf-8?B?OHBPV25MckkzNVNNaUFNQW9GcjJWN2Y4S3FWbXRNWjV4enZSSnVuMi9VVkNR?=
 =?utf-8?B?UEdKT2c0WWNmdk8wV1VZQ2paQkI5Q0pScCsyOFFnZU5aS3ZxQUhyUG01QzJW?=
 =?utf-8?B?cWxJa0hPZVhOTmJ1VWtBa1pQVlB4a0hTS0RWZk00UTAvWDhtcjNPR1BFK2xV?=
 =?utf-8?B?V2R2KzJtM2tDNEgyMzY1Qjk0eEVmZElaNmVVc0g4Zi9NaGV1bUZvR2FDSkIr?=
 =?utf-8?B?ek9pTEVwakVQMi9lQUswelFQM0poUUZYVUdrU2UrQXZkNUU5aFpVa1RDWEFV?=
 =?utf-8?B?Rk5GY1M1RjFBVkhFbkoya29DcFkrd0RBdkRCQTVJSU1memYrNjY0eDVNSEcy?=
 =?utf-8?B?TEdnajdGSHBMcVdzb0M2WUZkaGpuT2xrMnEzTm5SSGkxS0ZRK3F3czFkdWsr?=
 =?utf-8?Q?zV8PP8AQo2sCEIvr+xdVU6SwDi1FCfsLgJNJ/t+1hz00=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6614.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y25kZVlWcis0UGdUK1czbE5PV1loakRoOXFod1BHayt1MkFsTE1DZVRmZ2Nt?=
 =?utf-8?B?QUo3aHo4ZUo5bFhlQUgzSjVqcnJSTkU0UmRaWXNBS3VqQ3NIc1VQdG0yY1NJ?=
 =?utf-8?B?SWZvRko2c1h2RGxCQmxKOGc1UHpVQ21PRkxrY3NFT3VzN1Fma05VRm9lZm40?=
 =?utf-8?B?S0dMaEtTZm10a3JsZjBRTG9YMkVSRkREZFdCaHJXWmJuOVRKRnlqVVlJMno1?=
 =?utf-8?B?S3N0N1gzaUw2QmExSTBXSm0rVjJhSWlSQWU0WWF0UVlDTVR6Mm1iQmdzY0li?=
 =?utf-8?B?YlZ2UWc2WHFydHlZOEhnRmNYNXhwWkRVeG0zZlY4Z2k0Z1d1YVYzM1ROblF6?=
 =?utf-8?B?VFZBblFXSlVlYi9ScnZJeW50VGhJVllBekljRWluZlU2OWk2Ykl6SjNIVnli?=
 =?utf-8?B?VGRmclpyNnQzdS9UOWhtY1hFT1B2bFU2d2I4YzJLMWJiT1NWeU96TVFicURy?=
 =?utf-8?B?QWdCUDRNTmhWc3FsM2krSDNEajVVN0NtS1JKTkV2MWQ3VzZaSVFJajVuNGhz?=
 =?utf-8?B?cFBKWHc4dnBQNGZSeEJ5VENtR1V3ellRVkZucWtvYVoxN3NKSEpKNThLRDZj?=
 =?utf-8?B?aG9kb2REZ2hrcENXbjJ4Zy92VEVxbEJUNzF3b2hrMmlGci91ZnlDeURZQnZ2?=
 =?utf-8?B?bmZSaTN0RWZpeVR4RHNCVUpDeG9iRUtqRGZwaXFYUitnUGRNRERWbFM5QUw4?=
 =?utf-8?B?bHBBNHg4YWxBNURMY2hYTFdyN3pBaE1RaUVVMHRjWklNQkpBY2toV2RUWjFj?=
 =?utf-8?B?YXduYngrZU81MzYrN0dHV0FmdE41cmF3QjlFcGtyaTZDL2RLblpsRVdBNTRC?=
 =?utf-8?B?ak5LdjBRTHNoL0RzUGJxRmVxRloxeXdWZnppVmpWVTNETTEydk9TY2pBNDlh?=
 =?utf-8?B?TGFQS0FkMGl6WW5ucU9rTFFNNHAzVmNtdVNZWXI3aFJpTS9UdndLZ0cyUFhF?=
 =?utf-8?B?Z1ErNmtHWmpJZmk1Q004Z0xLcThjWmNRODNxUWM1bWJZa0hNQVFybXY5NlQy?=
 =?utf-8?B?UHppOGlWcTRIdlZ0K2k0ZzJBN1BCbXhuY0NXTSs5RnNQVTJGbDN3b1pCYXha?=
 =?utf-8?B?eitrR2NtcUZSckxBTkJDajNJTTlsOVZjUFUxbDFIcWprdE1UR29uTzNGY2Zt?=
 =?utf-8?B?U21ndVBtMVNyK3FDQWh2aEQ5dnBETVFadmU2WXd2ZmNUUjRvb0FOM3U5VzZ0?=
 =?utf-8?B?emViRjNCbWNINWQvUGNNdEJwQTlOQWE0L0JuRUJ2MW54MGlpNm5rR2NFWUg2?=
 =?utf-8?B?Rzl3NFFLd3d3OEZFS2hEalJUK1R3TlQ1YTB3Y2EwcHczcDF0MENXUXlTZC81?=
 =?utf-8?B?Q1VwREh5SWV6WXR2WWlwT3BmdmtnSERPb3RMeHkybExxRUNXNlZFdUZKTlBN?=
 =?utf-8?B?QXhRL2Z0azZtOFFVS08vemR6NU0vSzFIN2FrRUlhZGpWdkxxMS9zejRlWm5y?=
 =?utf-8?B?RGdGUnB4cFpKVE53WlppcGZVdk5YNlU3RHF4Yk1vMVZNaU5pa3VYL3p3L0hD?=
 =?utf-8?B?MU8vVXZGbWVtSHp6aXZjZnNxUlpCNE5pbDR4a0Q5Z0dzYmdSWFgzYSswTWsy?=
 =?utf-8?B?c0l3dG81T2VQSSswRmhzNG5iaURRMFFqRlEzNDVYMTVUbmlFSE8wcEpmc01W?=
 =?utf-8?B?VDZrRVFUZUF0QzVXa09kS3R1RkZ4YlhHYVQrdzQ0U1pkWXhlSUFiSnFuc3RN?=
 =?utf-8?B?Y0pPSzFkUkNsSVdzekJETFJiZS9rOVpReExKaEc0Wkl2cTU1b1VSa1Zhd3Zu?=
 =?utf-8?B?SkNLRzR4R2kyWm00T3RuL0t2eFo0dGxWVk9jZkdORDhmNU04WEZkN2hTa0N4?=
 =?utf-8?B?akRCQzI4RTgvRUJOV1JzUUN2UnBtWHo3NDJHSHovUHc3cjdnNWx2UUd6cGp0?=
 =?utf-8?B?NkNRQUhaZXp3ZUJmalo4eHF6U3VmSUE2akhScHFwb2J4UjdUV1d4eHU3T3Rl?=
 =?utf-8?B?QUpIYXZXVDhGa0RDSWlZbkRoaDdVaFdDYWM4YmlmWG9Nc3N0aUs0cTlsQXlJ?=
 =?utf-8?B?aklnb0hPbWxPbytyNkhqSG11TDlFZUIzMWlQYmRHTWx0UXUvSE5ITzZGMTdj?=
 =?utf-8?B?L3MzRlNzUUhkTFZvUWxieTZvRnJzc0VMUW9jRi9pTWk1djllUDFkTC9HSXJQ?=
 =?utf-8?B?dzJiVU9SQkFiN25kVnd6TDJtZkpLU0g5MVprY2VWemFpLzEvWGcxZTlUZ2ta?=
 =?utf-8?B?dnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92c183e6-baae-4d74-049e-08dcec28c173
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6614.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 08:18:17.1050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BnUSOSQn5I6duZQXVrpsgO4GfRAUOGkVBnQW4eVkOtJV/a8k3AlEtCSGuSMMB+A9O+QAIDyNv+fg/AjkB/0jJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6300
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

Hi Matt,

W dniu 12.10.2024 o 04:23, Matthew Brost pisze:
> On Fri, Oct 11, 2024 at 09:26:30AM +0200, Andrzej Hajda wrote:
>> Currently xe_res_cursor allows iteration only over DMA side of sg tables.
>> Adding possibility to iterate over pages allows the use of cursor in more
>> contexts.
>>
>> v2: fixed wording in commit message (Jonathan)
>> v3: indentation and author fixes (checkpatch)
>>
>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
>> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> ---
>> - Link to v1: https://lore.kernel.org/r/20241009-xe_res_cursor_add_page_iterator-v1-1-c883446e5770@intel.com
>> - Link to v2: https://lore.kernel.org/r/20241011-xe_res_cursor_add_page_iterator-v2-1-367b74c1cc29@intel.com
>> ---
>> Hi all,
>>
>> This patch is required to proper implementation of userptr_vma access
>> in configurations with iommu turned on[1]. Required by upcoming eudebug
>> feature.
>>
>> [1]: https://lore.kernel.org/intel-xe/20241001144306.1991001-13-mika.kuoppala@linux.intel.com/
>>
> I'm failing to see why this patch is required for [1].
>
> I don't see this patch included in [2].
>
> Both justifications here are pretty vague - 'use of cursor in more
> contexts' or 'Required by upcoming eudebug feature'. Not understanding
> the why. Can you please elborate?

IIUC sg tables after mapping operation contains mappings between list of 
pages (represented by pair of struct scatterlist fields: page_link and 
length) and list of dma addresses (represented by: dma_address and 
dma_length), both lists are 'hidden' in sg tables.

Currently xe_res_cursor can iterate only over dma addresses, ie after 
every call to xe_res_next xe_res_cursor.sgl points to scatterlist 
corresponding to dma_address at requested position.

But for eudebug we need xe_res_cursor.sgl pointing to scatterlist with 
page_link corresponding to requested position, ie we need to iterate 
'left side' side of the mapping. The only change to achieve this is to 
track .length field instead of .dma_length.

I hope my understanding of this is correct, at least tests are positive :)

Userptr implementation in v2 does not work with iommu, and does not use 
this patch, and needs to be fixed. My intention was to get early 
feedback on this approach and merge it separately, or alternatively post 
reviewed together with eudebug v3 patchset and with userptr_vma patch 
[1] updated to use introduced xe_res_first_sg_system:

@@ -3662,7 +3662,7 @@ int xe_uvma_access(struct xe_userptr_vma *uvma, 
u64 offset,
                 goto out_unlock_notifier;
         }

-       for (xe_res_first_sg(up->sg, offset, len, &cur); cur.remaining;
+       for (xe_res_first_sg_system(up->sg, offset, len, &cur); 
cur.remaining;
              xe_res_next(&cur, cur_len)) {
                 void *ptr = kmap_local_page(sg_page(cur.sgl)) + cur.start;

OK, also s/xe_uvma_access/xe_vm_userptr_access/, but this is different 
story.


Regards

Andrzej


>
> [2] https://patchwork.freedesktop.org/series/136572/
>
>> Regards
>> Andrzej
>> ---
>>   drivers/gpu/drm/xe/xe_res_cursor.h | 51 +++++++++++++++++++++++++++++---------
>>   1 file changed, 39 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
>> index dca374b6521c..610407f23dbd 100644
>> --- a/drivers/gpu/drm/xe/xe_res_cursor.h
>> +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
>> @@ -129,18 +129,35 @@ static inline void __xe_res_sg_next(struct xe_res_cursor *cur)
>>   {
>>   	struct scatterlist *sgl = cur->sgl;
>>   	u64 start = cur->start;
>> +	unsigned int len;
>>   
>> -	while (start >= sg_dma_len(sgl)) {
>> -		start -= sg_dma_len(sgl);
>> +	while (true) {
>> +		len = (cur->mem_type == XE_PL_SYSTEM) ? sgl->length : sg_dma_len(sgl);
> This doesn't look right. sg_dma_len should always be sufficient unless
> I'm missing something. Can you explain why if 'cur->mem_type ==
> XE_PL_SYSTEM' you need to directly look at sgl->length rather than using
> sg_dma_len(sgl) helper?
>
>> +		if (start < len)
>> +			break;
>> +		start -= len;
>>   		sgl = sg_next(sgl);
>>   		XE_WARN_ON(!sgl);
>>   	}
>> -
>>   	cur->start = start;
>> -	cur->size = sg_dma_len(sgl) - start;
>> +	cur->size = len - start;
>>   	cur->sgl = sgl;
>>   }
>>   
>> +static inline void __xe_res_first_sg(const struct sg_table *sg,
>> +				     u64 start, u64 size,
>> +				     struct xe_res_cursor *cur, u32 mem_type)
>> +{
>> +	XE_WARN_ON(!sg);
>> +	cur->node = NULL;
>> +	cur->start = start;
>> +	cur->remaining = size;
>> +	cur->size = 0;
>> +	cur->sgl = sg->sgl;
>> +	cur->mem_type = mem_type;
>> +	__xe_res_sg_next(cur);
>> +}
>> +
>>   /**
>>    * xe_res_first_sg - initialize a xe_res_cursor with a scatter gather table
>>    *
>> @@ -155,14 +172,24 @@ static inline void xe_res_first_sg(const struct sg_table *sg,
>>   				   u64 start, u64 size,
>>   				   struct xe_res_cursor *cur)
>>   {
>> -	XE_WARN_ON(!sg);
>> -	cur->node = NULL;
>> -	cur->start = start;
>> -	cur->remaining = size;
>> -	cur->size = 0;
>> -	cur->sgl = sg->sgl;
>> -	cur->mem_type = XE_PL_TT;
>> -	__xe_res_sg_next(cur);
>> +	__xe_res_first_sg(sg, start, size, cur, XE_PL_TT);
>> +}
>> +
>> +/**
>> + * xe_res_first_sg_system - initialize a xe_res_cursor for iterate system memory pages
>> + *
>> + * @sg: scatter gather table to walk
>> + * @start: Start of the range
>> + * @size: Size of the range
>> + * @cur: cursor object to initialize
>> + *
>> + * Start walking over the range of allocations between @start and @size
>> + */
>> +static inline void xe_res_first_sg_system(const struct sg_table *sg,
>> +					  u64 start, u64 size,
>> +					  struct xe_res_cursor *cur)
>> +{
>> +	__xe_res_first_sg(sg, start, size, cur, XE_PL_SYSTEM);
> Not seeing where this function is used in [2].
>
> Matt
>
>>   }
>>   
>>   /**
>>
>> ---
>> base-commit: f1561e6c62b5b5c3fe0276f2fbe7325e0d7c262d
>> change-id: 20241009-xe_res_cursor_add_page_iterator-d29d73c3eb99
>>
>> Best regards,
>> -- 
>> Andrzej Hajda <andrzej.hajda@intel.com>
>>
