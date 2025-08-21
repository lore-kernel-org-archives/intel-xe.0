Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3205FCA0EEB
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 21:58:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C127610EA18;
	Thu, 21 Aug 2025 21:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W9NA5v98";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2A510EA18
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 21:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755813515; x=1787349515;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MUlDprQ5eTe2n+EhU9ziJq6JkWLrb4K8cYZ12GL0H7s=;
 b=W9NA5v987aD7nkJNCn1yUY27kYvB6CwzztmH8KyfrdcfGSd68GeE5Y8q
 O0nqnJDsMZrT/a/uPVByxM412kjh2gnk0DJA9+g7joung0PwKCfBiZqhm
 GEZqsH+BPBKrvevlcB13vAeZaIE/uq7dK3x8DDYwvraRXacg9o32cTVuK
 nZAE3+UQzovlYK5fx4cv+mYCY1HxFZ5WYrHfJcpZsQhQ0u4Tp0JXeGRGP
 E1f8M+nyzCZmb/dduzVBf+/RJJyNaV0SSLo3kWbHGR0J7Hyw118/j5LnF
 i6t/CLtYBUGa+uDwr+8CC1EQ+quyx6ACXhNHe4rD+jHXFGYb1bd6Jb2IE w==;
X-CSE-ConnectionGUID: CP3qx6+2Q2qFffKoiyrobg==
X-CSE-MsgGUID: oJ48ZdixTTi1YvZQduFvWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="68387674"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="68387674"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 14:58:35 -0700
X-CSE-ConnectionGUID: dkgIQRKER6O1bR+98Rj7Iw==
X-CSE-MsgGUID: 5MUEWn7JQnaLqP07EMQn/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="167756326"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 14:58:34 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 14:58:34 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 21 Aug 2025 14:58:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 14:58:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jMet+Yoq7y8sgu0m/u7YnPYNw0aSTiBKn1XNQ0PRSGD/BD6Upb61q90ey5x/jAuy0/OxNPxwa5WKr80BXEhBJ5OBnEQQzngeDozhVOYpL8qcpWyBlIMPGEEt0wm1EcU7m0Yf1kz7wCtwa0KjYKEw1bGuR4EIzOm2/zE319IEPBTHT/Uc7b+1edwc8LJBjfsvUU6XliJP6CQEg9LUaD5yDjUahqKaCa+YtCm1kjM67IfRwiCTA9w4XShSzW5CLNMiWbILur2dp1IzdJ6yKF4Slgg3QiJyWBFopD5WRcflynEf71e8/27lP1Hhm7x4hXCSu5QsFiulb9kGzxLq2TV+8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOG3XjR4+JX5p2CaYgbMclCVXNSwpZaCKMFnGPSj9/w=;
 b=Lqn3aHymGtwNpNuNEcecct/cjSMTXpesvHcu+7jRH0buotT1qCEHrosz0w1MoQwE5E09J6G/DkVTmDZaqbXuRlodxjqA9BudLa08O4feGfuaOYRyQjNqfj9ZCVp9+hS73hSIiORDDYoYlibferUhvUcIEdpBHn29y9h4C+vc+wI/z6keWJLxzassfjHtqTdMDUzb1uAqEjGxLp50+Lv8ZRD7pkCmFK/E4m0FoajKEQv54yNFSadYRW06ZbX1NEXTVd8V/hVm0VaZio2B6yPItuL/BQ+XzYZb5DAylPmPoGE7UKCNalm7cgTEN9xgr//0lcuf/HDrXgcKEyTOm+7dCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5159.namprd11.prod.outlook.com (2603:10b6:510:3c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.16; Thu, 21 Aug
 2025 21:58:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9031.023; Thu, 21 Aug 2025
 21:58:31 +0000
Date: Thu, 21 Aug 2025 14:58:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v2] drm/xe/xe_sync: avoid race during ufence signaling
Message-ID: <aKeWhZW9eV4UJ4SJ@lstrano-desk.jf.intel.com>
References: <20250820083903.2109891-2-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250820083903.2109891-2-zbigniew.kempczynski@intel.com>
X-ClientProxiedBy: SJ0PR03CA0220.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5159:EE_
X-MS-Office365-Filtering-Correlation-Id: 241b8b1e-f309-4d46-36f8-08dde0fddde8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXIzSWN4amdnUWd2dENTVDJHTll5WmYwRStyQ3lvdWpYVTZvMk50VE9raVJu?=
 =?utf-8?B?aGpPMEZFOXp1VklzV0V1eVordStaK2pybGpoUkh4emJ0NFNtQkZVRTRlOXhP?=
 =?utf-8?B?eXNRZ1BPblI0eTdBT2ZkL1BPWmdscmhqUllaWVZXSHdlaHJ4b0p6NFlmRDdl?=
 =?utf-8?B?V2h1NGtDUnkvWEx1cWR2NEJwdER6d1lITkNmdm9EdWliUXhraDUyZDRSSGYz?=
 =?utf-8?B?L1hocXh3eHQxemNyOEtvRjZlRHlqNkplQWk0Q2hhWUdqMTFQYXRJK3RjZ3RZ?=
 =?utf-8?B?eHB4TXQ4WGRuL1VuMjNJMEkxOGF5elVnYkdvOEkyVTRmOWk1aktLRVh2Qjgy?=
 =?utf-8?B?ckRya0ErUC90UkNITWZMS3BFR2NjOXBna0Q5Qk5yb0lMVzgzWS9YZ1d3K2I2?=
 =?utf-8?B?MzhYa3JEU0oxbnhMa2txMzJ5Tm1RZlNPVmNLM1VQam1UN3BJQ2w5aDcwY1BM?=
 =?utf-8?B?a2l3REdmbTVrdnlGRmYvc2lCcnl1bkcyT2diWHBHKzFOSkJSaW9HR2xCRnc0?=
 =?utf-8?B?alJmS3Z1b2FiSjhBZ2plbXlpREZjNWh4NzlwYk1lODl1L3VoSW5HREROQ3pK?=
 =?utf-8?B?ZHRvb3NKYnpwMjJlMFFEejlDRis4Zk5zSmljYVh1Vlh5VElZZVFiTWd1eTFX?=
 =?utf-8?B?anBJamdvQ291T1BHbXpoNmZTZGF2UGZVdkR3aXF3MG15SitIcFFZdUI0bWZ4?=
 =?utf-8?B?b0M3TFdJY0h0NlVBbE9xbGFZZVpLRHdacTlNK3dxNldCUlpWRWNnZ2tIZ3hi?=
 =?utf-8?B?UlhXbFBQUEc2djNqdGxOMVpVMUF3WS95VzdFSzdNdDVDLytON0x2UWlwQm1P?=
 =?utf-8?B?MUtZS3NZQUxhWFFHK2VPRjFFREFxM0VhMW9hbjFGaWwvTmNHMjB3SlVZdmdB?=
 =?utf-8?B?TE15Nk4yNkxMVmNIeXBVK1NYZmxzbUpzWis4OGU5TjhkR3lFUzlsODI0UGxl?=
 =?utf-8?B?MVRFOXpiWjBuY3A3TzdMU0RicS9wUzBBeWVxRzZlUDVNaTZ6WnBBTU01Mm1E?=
 =?utf-8?B?cFgzQ2RKZXAxa1BSVzMxVld0eFJyMGZjSmVtUElPdXRnclljZ2RKNW1TWmZZ?=
 =?utf-8?B?SmJuSlNUUWtiN2JWSTNSR2tLWXhKZGRwaXVwZWJZV0l4S3d4MFJJUWhqZWtV?=
 =?utf-8?B?K2VuL1R6eXJxaE84RXNzTkdtTmRaYlAvMm9Ra3UvWHZKcUZhc1Z0YytveXBz?=
 =?utf-8?B?RWoyZGx4OWJSR0JhNmUxdlJvL3YxL0V3MmgzYkErRjBXNzBXR05COXFmYXpz?=
 =?utf-8?B?UXVQSmViTy9aanljRFo4a29nLzg4MEppcVJYYUg0UElENStVQ1N4bzFUQ2ZQ?=
 =?utf-8?B?bW4xYkc4SGtEY254eEZ2WTRzNkd2TmN1Z21Tc3QxVHVpZUZHa1BVN0ZJZi9v?=
 =?utf-8?B?MTIrS0F2VzczZ1FOQjZ1bUFLOUZ5WkRkdExOd3M4cTdlR1o3ZnFqV0N4ZDB2?=
 =?utf-8?B?bll2cU1RdnRTVXBmdkk2UHpiMjlOUmFFcFVZUjBLSGJEdis3OHpXV0YzYWo2?=
 =?utf-8?B?MUhWRGhZVEtxK3pLTWtVRjlqTU94N3o3Nm9ySzRvNWxIQjV3L2xIeStBNUNs?=
 =?utf-8?B?K3psRVZ0OU83ZGw0QXhkN0c0cU1yOU1TaUg4Qm1meWV0TmtUQXoyMmhmdlIx?=
 =?utf-8?B?OGhWdlF4L3FqdFQyZ0daQ1dzSmVaR2JvV1lWcnU4TzUyUm1Sb3hqUkZRYzZU?=
 =?utf-8?B?ZzdRR2R1YVZWY0haS21GMnBENEt1TTN5dGNTQU1vUjdUZmtNRm1PZWRJMFNt?=
 =?utf-8?B?SDRUL1RRSllFanVKV0lDenNIeU5hNXVTeUxsVUxxeERjUVZzWFdmclFGR3Ja?=
 =?utf-8?Q?3wmHNViCDmgkrg/oVO/GXONUeS0vVpBgpy4ls=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?andmMUJyNEk2SmNuREpEZ0FOcFBldC9EVnY2U0VodjdTYVJiSlNBS08zeFlO?=
 =?utf-8?B?ZDcraVhjNUJyQ1ArMmh6TXRuY1pCVGlacWNvNzE5dlFGckdkS3M0bmIwQzVE?=
 =?utf-8?B?ME0xcGw4L2hhNU9ZRXFoOGlqbk1lZUhzM0ZCRVV4Q2RhTVBnOGZjU2VsRXhq?=
 =?utf-8?B?dVlZRTNGQ1R0RlkzUVZKRGF1eFNDeXdNK2JFUEFNaDgzRmRDa3pUdXFOb2R6?=
 =?utf-8?B?T2NidXFxNEExMVh5T0J5YmcyRHI0RGxYUDlFZU91UkZYMXZBS2RJRmlhU1VG?=
 =?utf-8?B?K3UxU1A2QVBKZjZubEZZRDEveVlTaHA4S0hmOUEraVJXTTZYOXdxSVFTWTdy?=
 =?utf-8?B?cmJ4RkZxM3hic1g0TzFRRzNGUWNZczJnSGRzQ0NCOFVMQy9iOFN0TDM0aDB4?=
 =?utf-8?B?eFluU0xZNHJnT3MyQWFNZlh5RUR3VFVXdjgzU2s2MFRtZTUxSjZDL3QzclBS?=
 =?utf-8?B?RlhWbVQzQ2thaWVaOHA2cmY4ZmZaNGxMT1doTjF4R0dVbjc3WVZrUXYvNnJR?=
 =?utf-8?B?S1pLSWEwbjVsNUVTR3NYemJCYlU4MUlqN1krSUltTCtBMVNmVUcxZlhzcWJO?=
 =?utf-8?B?RWFsY0NBZWgzSmRvYWI0dEVKd0hCZnl1VzdSSmlISGtxRHFzcDArQXhMaE5y?=
 =?utf-8?B?UEczOGNkV29yVmh1ODFXYWdqU2gzVEM2RzJhdzFLNkdlYVJ3WjZTSUV1NU1K?=
 =?utf-8?B?d0VEVkdPZlZVcmFXWVV6amY0a3hUVDZTMmd5TFlMQ203T1hvdThhd3hzVU16?=
 =?utf-8?B?cEcyUHBRRHk0QzhmOFQwUkxrb0RRY2UxNm9WbnlwM2hNL2U5eWtlUGxIbkxQ?=
 =?utf-8?B?UURLYUxGZVpPQjBKZFduTDNrbkViMTdzTGxZZThXYzVDTFBUQWRxOHZkRlRl?=
 =?utf-8?B?WmxaWHNBMUdNYlFoUFRyMVRVSy9BcmcxREN4YlBPemJMSHppNUJaenpEQ3ZL?=
 =?utf-8?B?T0pwM0dlMUkxY3Q3S1ZpemdQM2dzSVRMZlJ2R21KUWoxYXdXVFdhdzF6ZkY5?=
 =?utf-8?B?OUJvSi92QkZZWTlhTExkWUxZRUNPMDVCYUFnekVmdVphb2RDZWh6U1lwdVdS?=
 =?utf-8?B?Wkx6ZGtYQ1o3RHhnclpObnZ4c0dtVnA2cy9nMnY4OG5QajV2NkIwd1FkL0Vq?=
 =?utf-8?B?TVR1dUdjWGhac3JqQXoyc1lBNm9JYkJyOWdjazFobExDN0F3VCsxV3pqVS8v?=
 =?utf-8?B?VkY2WTRlRFVLSDlSczIvYnFmTis0VTk5ZzlQeXZmWEdkVEh1aTFhdHRINTdH?=
 =?utf-8?B?SkJOTFJmRGdHRnYwaDEvVHlLbjhqenRITmw3N1QvdS9CaGhaRXZnVS9oR1Fi?=
 =?utf-8?B?cVl6MHlPWXo3RkxTbjd4Q2JuTitENGxmc1B0Smh2NU92ZVNjUFlyOGJYWit4?=
 =?utf-8?B?b3E0M251ait2TDI3cWcxbm8zelVPNzlYS1VyWEFWSUJRMlQrOUFhcDczU1RX?=
 =?utf-8?B?QW8yWUJIMXU3UmxRcjZBeWY4eVBUZElCenFRRVJsUlFIZ1NIaWxHYXJOQ0wz?=
 =?utf-8?B?UEdoQ2EzSm5jZlMzemVBV3NCYW5pcjdsRUNOaDRFZ1JnTzFnYUZ3bzZaSDlH?=
 =?utf-8?B?ejh4aDZSNFF3K29ib1B4d2p1NW9tdW1Mb0FDbXNTc3c4bExlbWQxdjZEdyt1?=
 =?utf-8?B?TWo2OFh0OVNORG05VElnamNWRjdCM296RStNTlFteStCY1lReER0NjJMekNt?=
 =?utf-8?B?d3FZdE1NN3JudzdtaTRrRkNIMXZuZm94SE53Y29HRlhBTGprYmJCQ3ZvbGJW?=
 =?utf-8?B?WGs1RGJVYjF6YzJTWHlTcDJhdjA2UnpSRys0UjFCdkl0Nzk4eU52QmNxaVRD?=
 =?utf-8?B?SjViUFNPYkE4MlhVRzJsMFF2R2FqUmJUMzVTSE5OaEJzZVE4YWRhN2hnenc3?=
 =?utf-8?B?czNEUzFkalFPUnF2TnJNRFJSa0VvN3J4RDhTd1NjdGJiTndaeC96ZzJidHRO?=
 =?utf-8?B?MmRrZDdHR3FTSWF1ZE5uS1laVitDWFZjeHpmbGljb1d6TXB5NW9ZYm5PNWhw?=
 =?utf-8?B?UzZFTGtxN1VJeWdhRU44c3Y5OGxsK0NXUWtUK1NkRHkrSEt3bzkvWm5JMXQv?=
 =?utf-8?B?b0RsOTg4djRnQmdFRFRyMENpSFBvWkVabHlTMXJmS201TGRwSFQ4MXpHVXMz?=
 =?utf-8?B?emFWcVFPM1ZDR0VIQW45SW9aS2YrVm4rVUxTcVVzL3hoTnEwNkZzK3BTekRW?=
 =?utf-8?B?SkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 241b8b1e-f309-4d46-36f8-08dde0fddde8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 21:58:31.5197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eHwJ7WglBfya6h7UdEzNrU8AgBQCsNEF+3Tjid7d57L4LVBQfu1Am5Q2Fm3ixoJOhmk68iFmYUCZLDIgu7vY9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5159
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

On Wed, Aug 20, 2025 at 10:39:04AM +0200, Zbigniew Kempczyński wrote:
> Marking ufence as signalled after copy_to_user() is too late.
> Worker thread which signals ufence by memory write might be raced
> with another userspace vm-bind call. In map/unmap scenario unmap
> may still see ufence is not signalled causing -EBUSY. Change the
> order of marking / write to user-fence fixes this issue.
> 
> Fixes: 977e5b82e090 ("drm/xe: Expose user fence from xe_sync_entry")
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5536

Link, I think you want Closes here.

> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Anyways:

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Matthew Auld <matthew.auld@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sync.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index f87276df18f2..82872a51f098 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -77,6 +77,7 @@ static void user_fence_worker(struct work_struct *w)
>  {
>  	struct xe_user_fence *ufence = container_of(w, struct xe_user_fence, worker);
>  
> +	WRITE_ONCE(ufence->signalled, 1);
>  	if (mmget_not_zero(ufence->mm)) {
>  		kthread_use_mm(ufence->mm);
>  		if (copy_to_user(ufence->addr, &ufence->value, sizeof(ufence->value)))
> @@ -91,7 +92,6 @@ static void user_fence_worker(struct work_struct *w)
>  	 * Wake up waiters only after updating the ufence state, allowing the UMD
>  	 * to safely reuse the same ufence without encountering -EBUSY errors.
>  	 */
> -	WRITE_ONCE(ufence->signalled, 1);
>  	wake_up_all(&ufence->xe->ufence_wq);
>  	user_fence_put(ufence);
>  }
> -- 
> 2.43.0
> 
