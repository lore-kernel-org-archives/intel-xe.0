Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB68C3DA7F
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 19:07:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B20110E50D;
	Thu, 15 Aug 2024 19:07:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fqh0yN3D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD3710E50C
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 19:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723748877; x=1755284877;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=uixZMdXQYGpJEbBEh8xoL59J2qLm+ppaNxnFYEv1Uts=;
 b=Fqh0yN3D9jhMHcrztCfHSGAYZe274hGpBM/nHB9O++u+L8ODdreVJEw9
 R67iJWxu3/u7mj6KYdbXX+lsmBcx55CwS2qmdsBqXRC/ZueuYNX34LZuR
 0ysDQe2iRq28c5Ymp5JHgom0n7RUJtsEnK6+2TiLSQhgQbRzDze8PGOs+
 16UB0TbEOmRdsczd0evVTaHTJDN38ll6JZmiou30U+6P7dluOv7oFVfbd
 yRliKc5+OQ3dyAVfufk+LoaNfCDqdCFGwY4r0imk869e+L5W65jlRk2V9
 Kz0bNHMi7lzyqF95lMTvmdmDCKEWXXHshHswhS9ODi9J+o/vJ/WFcBnr1 Q==;
X-CSE-ConnectionGUID: nq0EqvwvQnyVw3OGR+hK3g==
X-CSE-MsgGUID: 4vc3A9UYQTaf7RTGNDSNqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="39542464"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208,217";a="39542464"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 12:04:00 -0700
X-CSE-ConnectionGUID: HFe5r2WwTvWAcXlc2SZWaA==
X-CSE-MsgGUID: EWNamrL3TTqaNYpaqM8rFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208,217";a="60011439"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 12:03:57 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 12:03:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 12:03:55 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 12:03:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cRBCqpQIiTEbDHRkPXTUGJI/rwYLdLygU18QmByDix7fVQmo/wGD0JCcpREJRZezaUKMqWad8MFKM93XPV4rmgCyMQlYtUfr/zbwa4b9/W9La7p3LXXDTfeL/6CF9+foOKm8eTOQ07BqWXy4jkMGJUQNXnPtCx71qbLdwfVTBYD5wVKbXI69MKrDyVDB9wOreVVBQYCvs+J+AxSLVSKv/mM8YgizCITx8k6icWizyVRT8woSDA+aJPmjgnPvgHX//SjVJhNf4sFEinsXtPhqyKvneBkEKOYDU4oPiaPbUVr/ZR9nTfreTFiFqs/pGl5PHM2YHRLv/qXV1b4jp3Felg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPrHc8WRMVz/JhAO01OFMyPrPzg/RJDQ0DNEoY6yl+o=;
 b=gtiJM7KaQFdGB1MI9aIVHNADZBTwInFY5MA1F9VGhL/7BQhTyDPFLUeuODCYjoAmx0zH83VCS959WvwkpXOqHXV2co11a0zQ7y5Ye5rDzSGexjMwF0hDcaJunKpzow98UyzrQF7h8TYJAi9hcUUbls9fYuiHS2EbcXvxLcwN0BiMwcVQp5as9K8PFI4DhOxcTcuFmc2cB86ofWMHR0+XB6Q/yiRH1ehLSO07MPLXbQOO6P5ZlmqmNf3pekMgXmMA7K6i/Pt4hdHjEmX+YlsnbdgrY/8C38+fb/f1NrXS55c3ThKUhRvmL2gG3U8ccveLrbUZ3xrUnXD419q4+noqZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by DS0PR11MB7998.namprd11.prod.outlook.com (2603:10b6:8:126::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Thu, 15 Aug
 2024 19:03:46 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848%6]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 19:03:46 +0000
Content-Type: multipart/alternative;
 boundary="------------vc0LHe4CzKbw1opgxtAJixI9"
Message-ID: <fc2092f8-0212-4122-8f63-526fccbcbd14@intel.com>
Date: Thu, 15 Aug 2024 12:03:44 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Add debugfs to dump GuC's hwconfig
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240815172602.2729146-3-matthew.d.roper@intel.com>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <20240815172602.2729146-3-matthew.d.roper@intel.com>
X-ClientProxiedBy: BY3PR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:a03:217::35) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|DS0PR11MB7998:EE_
X-MS-Office365-Filtering-Correlation-Id: f42ee4f4-3021-43ce-0e4d-08dcbd5cfd0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2Q5MFhOQXV6d1FUbXMwbW4yTWg1bU0vZ1Y4bDFuaGJJbzhGOEJxeTJhVXJw?=
 =?utf-8?B?RTdSNGtQdWF1eWxtdVVFeS9TVFcxVDRmVi8yU1F5Y0NTRFVZeUV3VVNDL3dm?=
 =?utf-8?B?SDI0d3JndDB5OW5lK3BkV3l4b3I3cllxWUlCRFVheWFNTFMrRlg4MzMwR1J4?=
 =?utf-8?B?OXlLRXB4Q201NE0vc1ozN2UxQTFtbHd5SGJWbVc5ZUhsVkNqZEo4TUQrcVEv?=
 =?utf-8?B?YXVTcGg3aWV2YXhrVDFqQnRPTnlqVzQ2WThyanAydWZpUFFLRHpqQlVzUUhN?=
 =?utf-8?B?dkxNL0tZcDlKN2FNMVlvQUVTSXNSc0dxaEgrSE0xMFVKTFVHM0VWSmdsT21Y?=
 =?utf-8?B?ci9nT2I2QUVsTkdTRnQ0VEZOYnRWUHg1bmk5Qkk0YmZMY2Jlb2ZzMzN2ajIr?=
 =?utf-8?B?eGNQQTNqbVlrYjYxWFhobStaSFl2clcva3plM003VkRvVG9iaTdaZ2NRM1B6?=
 =?utf-8?B?c0F5cTlCdXVtYW9Vb0x1YndEUjFWa09GSmppWjlKYmtzSG9PeitBa2twemQx?=
 =?utf-8?B?T2ZEOC94TjFWbXJDazVGUUU2bk91RDFJZDMxdldHL0tCa2xGRmNmVWgvUGVT?=
 =?utf-8?B?RUFkRHU4bWJYSDM0Q2ZVRFdHb2xiNEk5dDU4L3JtbnhrZ2FWWjdVWi8weXNZ?=
 =?utf-8?B?T3hpcEVpY3JLSmNDenJxU3hncVZKN0poUmRMWUlwY1hIaWdHakxxWnFFRUpB?=
 =?utf-8?B?dFpob0NGMEFnRUdFU1FPd1dQYzFDSTU5dFFEYksveld5L3hKbktTazRHd0NP?=
 =?utf-8?B?ZUMza2dZbVA5aFM1c0xOV1BIVjZQa1dxSVZQblhoQzFjZVI5UllaVDg2WXFC?=
 =?utf-8?B?V3hNa3FSQmQ0eE02VUNjS2NkUVQ4SDY1ZW5GMSt5dlVCa3crZ1BWTnJUb1p2?=
 =?utf-8?B?SXEwdlFFK3hsUmFvUG9lM2dBZjd0QjBuMkN5czl5VGl2WVQ1b0lxYlRibDhz?=
 =?utf-8?B?UFJ4Sk9uRCtPQ1V3Z0VnT0lyZFUxRGhGbGdJSkhTTklHNi9WQzBXbW11dk9z?=
 =?utf-8?B?Uk5pUVB4TkZsejB2Z1ZtTkNZSVJQU1hZMXJ5VHVkUFVST1pXa1JMdXM2M25V?=
 =?utf-8?B?Vm56ZkRRVnI3VWdoc1M5RjdpemJtUC8rbXZMUTduVGZwUmlLejUvSE1zQmU5?=
 =?utf-8?B?QmlXWHNTTVhTOFVoU1FGNFpHUkxqdXNEa1YzcEJJbXNIcVNyekt0QWZOUldX?=
 =?utf-8?B?ejlGU2JxcWpzVHl2WlpTRlBScUhPVjd3TVJJTVhZVjVINCs0WFliRFNkWWJM?=
 =?utf-8?B?YU1PNnNkQU1kbjhZUzJvUWh1VDR1Q2NOL28xRFIvV2hDa3VQN2lrN2RFbTBk?=
 =?utf-8?B?UEh0YlVHc1Q5SG1nY09hWWU1UjI1OVFEL3kwT2dsVjJlUjh3Q0w1ci82QWtw?=
 =?utf-8?B?U2tNT0pDUFl4VisrcjQ2YXhpUUFFcnlqc0U2cWU0RTh4ZXZvSnh1eU5nUENX?=
 =?utf-8?B?cXoxMThONHBVMHN6R3VnTHN5c2diQUJNSi9NVlZabXVDSlBzVDlhd2ljOHQr?=
 =?utf-8?B?UElpN0I3NmhHdzYzd1I2VWtwWUpwQmZvNU1EbjBmL2tPRWFPNmRhaHNOOHRE?=
 =?utf-8?B?V2xUbkM1eHA2ajVyS1N4VFdYSEJmWmR3Q1k1RE9rNHRQNS9CeHYxTXlRNlBy?=
 =?utf-8?B?UllJMHJIZGJ3NTg3d2RBNi9wdDhxYnZzaVJkTHpSdFE3OWZlNkhFaHpZcCt6?=
 =?utf-8?B?OEpkTWZvVHZUVmFSc0hSMXZ6UU1NN2U3NlVpVnlZYzRQRFc0UkxjUVhDZGpK?=
 =?utf-8?B?WEJnWmpHZmFURlV6Y3BvdjMzNXhXamFzVE5NZ084V05nN3RqK2tFbHBZQlE2?=
 =?utf-8?B?eDNwMmVWVzVydWFXVEFYZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bW5GSjFQZ0MyMGc0VTZUeTMxUFNYaGpKalErYXdrTEdITWNJVWtiVWdZL1JN?=
 =?utf-8?B?aENVencxSFlNVDExQXIvdDRGQ3E0WTJXRVhieTJSeVdWSnpXUUVld2hSUXdJ?=
 =?utf-8?B?dXdVc21WQUNXUDJXcC9icTNtZjFERWNoMTg4eVVjVDdYbnU5N05lQ2NEUGp4?=
 =?utf-8?B?QVZQOEF5dlp0NmRHN01nWFFtbWJhb0Zvc09vOGFkUjdIMjRiZjlQVXNmVVcr?=
 =?utf-8?B?ckhZS2FSSEhvbkh0KzdoeStmeXFpcm1rWTZWR3R3aktEcjRmTkFCejRQKzV2?=
 =?utf-8?B?dVpnTUlxbEJ6WmVHckNYY2tVOStNbWJyTEptUG9VcWJLSyt0TFVmNVA2emNO?=
 =?utf-8?B?eTIzZUF5WTFaOUdVYWVLN3NtTk1RNGJPT05GS0JGKzRIQnlvenJNczBQcjVx?=
 =?utf-8?B?SjdodG9IK0ozOVB0T1lJbmEyb2Qwb0wvV1ZFN2ZSeUVNWjNjUWZ6QzROR3R3?=
 =?utf-8?B?TEdGQjNFeHhOTTY4V1A5UXdsWkxwZzlNNFlON3NNUG5KR0d0TVNFbEVXMGY1?=
 =?utf-8?B?Qm9DU01VYUNSQTUyY3J0M2gwTTNZTWVXa0MwR08rclJaK1hjcTdWWmNFMlF1?=
 =?utf-8?B?SHlQbmllMEVJZnNkUFRVa09LWnc1SWsva2tpaFc5UWo4YkRHeUJtTXl1NW1J?=
 =?utf-8?B?ZVRESFBpTDZyZFlzOFQyMnlqZmpWVzN4eGVVS3RWZWRiZ1lTV3pxNzVNc3Bv?=
 =?utf-8?B?cU1rR1N6VjlWTEYzckhvQkFaZ2pBQWt0SHpjek5LYXprYkNJTEN0OFZyZnll?=
 =?utf-8?B?T2VQSU5zeWtXWUdBb2pWUDB3Qi9ZcjdmR3lPMGgzRlNGbzVHdzZJVklEL1Ra?=
 =?utf-8?B?OWVmckMxM0R6bTNzbGpXeDE4OWxSblcwUzFCb2dQYkxwdVNlQmZ1ZFYvT3Rh?=
 =?utf-8?B?WnpVRlNROXh3NzFYNzZWNEgvcGxDcWM3cUJrWUIyWW1NbGxaREl4c3NIbGpK?=
 =?utf-8?B?a3BpdUdtTUMrVkdvTFhmUk1sS1FpMU1ZRTRkMmJSV2hmNEYxcVZNSCtSZmFx?=
 =?utf-8?B?NXhsVXpDdHdNckdoQTBYSXpYNVIzdWhUNm5sVkprMWhsOWZTa2NEUkFlb2JO?=
 =?utf-8?B?Yjd4OG51RTlWWWEwdDNEYnBEaW5zM1VTM2tKRFF6WlBoaFg5TC9sWG00Y3FV?=
 =?utf-8?B?MVlyZEVWTEtjQ2dOWW51UmRFSjgvcXprT0QzZVhaQjhMWVBreFdxS05aam9R?=
 =?utf-8?B?OGh3SmxZQVVPYm9ydjNtUXE5RUVBcTlCZk90d0RKcmczVS91VTdxMzhHVDhL?=
 =?utf-8?B?dWtqME5hYkI5cHZYMUEraVpVQ1NHVGk5ODF0ZHNTTzdSalhJZ0czbkpseWNq?=
 =?utf-8?B?cXB5YTNkODEvalJWaHBDVW5zbzZDcU1ITDN5VU9iNjhNdVJYYnU2Z0NPQVJy?=
 =?utf-8?B?Qkg1WUMwNFovRzZGa3RpUkhsS0E4VlpyOXlyWlZlWEZINkM5N2RiaE9ZR1FN?=
 =?utf-8?B?SUp2WGdMNHd6RzI3NEZHZllSTlZnWnlOMUU4eHlLbFVlZjlPWlpjUFpjMFdG?=
 =?utf-8?B?MGNBQm5mbE5qdXpuVzg5OTZDc25IUDdBNnROY2xXdFRvbFNnbHpQZVhNV3VJ?=
 =?utf-8?B?dmMxc3JtZGZwdFZ2T1ROc1FLUTNDTGR0Tm5IdGFiZE9MRDV3QjJoc3FkTFgv?=
 =?utf-8?B?MWgwM2EzUlpHOGlER0VKYXAxczJyU3RtUVhoRDViZlFuVGNCbm1hUUhlaHFo?=
 =?utf-8?B?MWQ3R1VUamZSVTJ0L2dITVM4cy9IWGtralJRRlVkSThsYXcvd0R4ZmlYTzZs?=
 =?utf-8?B?K01GTWNKa1ZJTlRqS2pzUE9LZmhhN2UvckRJcjY4RGRvbnZuZVc2cVZyamdz?=
 =?utf-8?B?V3d6Ylg3azhEUk05bnFrRHQzQXFJcCtET2dtMXN4Mk5yY0tXSklZZGVmQk4r?=
 =?utf-8?B?cVRKdjEzZWVpeVVBNEZ5N0ZPUC9Qd2dCNHR1RndaQjIvdnU5L24rWldSU0pY?=
 =?utf-8?B?U09INWNZWDNFZFJxcStia2ZibDl6SFpYVzB0bWJMWU90RHdBeGVoU1FZRmh5?=
 =?utf-8?B?cmo4VjdxZjQwbllBaUFudEl6bjg5MVJrRHJ4b2p4dG81bjR5TlVDRUU2ZS9G?=
 =?utf-8?B?NlY2YkREVmpJK09GK0ZGTHJ3UXRCRjJWa2xUR1VBZjVXb0pRcTZsL0R4bndw?=
 =?utf-8?B?aEVzYWU1SzA5dllDSU84eGEyelBjU3Q4L0pLWEdpZnBHVkhZdDA2ZHBzYWJp?=
 =?utf-8?B?dlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f42ee4f4-3021-43ce-0e4d-08dcbd5cfd0a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 19:03:46.1001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +fEoIlx3eQ/5sXcQogn3Tk/CbNyowsH7DIWuNisiz9+vKeomnXQ13q6oWdqanygqQGhLR1C1eXgj6jhykpic1ws94e0NZAdCv33s5rKd5ME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7998
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

--------------vc0LHe4CzKbw1opgxtAJixI9
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 8/15/2024 10:26 AM, Matt Roper wrote:
> Although the query uapi is the official way to get at the GuC's hwconfig
> table contents, it's still useful to have a quick debugfs interface to
> dump the table in a human-readable format while debugging the driver.
>
> Signed-off-by: Matt Roper<matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_debugfs.c   | 11 ++++++
>   drivers/gpu/drm/xe/xe_guc_hwconfig.c | 57 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_hwconfig.h |  2 +
>   3 files changed, 70 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 5125d76ccfac..8f95d3a5949b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -19,6 +19,7 @@
>   #include "xe_gt_sriov_vf_debugfs.h"
>   #include "xe_gt_stats.h"
>   #include "xe_gt_topology.h"
> +#include "xe_guc_hwconfig.h"
>   #include "xe_hw_engine.h"
>   #include "xe_lrc.h"
>   #include "xe_macros.h"
> @@ -270,6 +271,15 @@ static int vecs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
>   	return 0;
>   }
>   
> +static int hwconfig(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	xe_pm_runtime_get(gt_to_xe(gt));
> +	xe_guc_hwconfig_dump(&gt->uc.guc, p);
> +	xe_pm_runtime_put(gt_to_xe(gt));
> +
> +	return 0;
> +}
> +
>   static const struct drm_info_list debugfs_list[] = {
>   	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
>   	{"force_reset", .show = xe_gt_debugfs_simple_show, .data = force_reset},
> @@ -288,6 +298,7 @@ static const struct drm_info_list debugfs_list[] = {
>   	{"default_lrc_vcs", .show = xe_gt_debugfs_simple_show, .data = vcs_default_lrc},
>   	{"default_lrc_vecs", .show = xe_gt_debugfs_simple_show, .data = vecs_default_lrc},
>   	{"stats", .show = xe_gt_debugfs_simple_show, .data = xe_gt_stats_print_info},
> +	{"hwconfig", .show = xe_gt_debugfs_simple_show, .data = hwconfig},
>   };
>   
>   void xe_gt_debugfs_register(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> index d9b570a154a2..025bad701556 100644
> --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> @@ -6,6 +6,7 @@
>   #include "xe_guc_hwconfig.h"
>   
>   #include <drm/drm_managed.h>
> +#include <drm/drm_print.h>
>   
>   #include "abi/guc_actions_abi.h"
>   #include "xe_bo.h"
> @@ -103,3 +104,59 @@ void xe_guc_hwconfig_copy(struct xe_guc *guc, void *dst)
>   	xe_map_memcpy_from(xe, dst, &guc->hwconfig.bo->vmap, 0,
>   			   guc->hwconfig.size);
>   }
> +
> +void xe_guc_hwconfig_dump(struct xe_guc *guc, struct drm_printer *p)
> +{
> +	size_t size = xe_guc_hwconfig_size(guc);
> +	u32 *hwconfig;
> +	u64 num_dw;
> +	u32 extra_bytes;
> +	int i = 0;
> +
> +	if (size == 0) {
> +		drm_printf(p, "No hwconfig available\n");
> +		return;
> +	}
> +
> +	num_dw = div_u64_rem(size, sizeof(u32), &extra_bytes);
> +
> +	hwconfig = kzalloc(size, GFP_KERNEL);
> +	if (!hwconfig) {
> +		drm_printf(p, "Error: could not allocate hwconfig memory\n");
> +		return;
> +	}
> +
> +	xe_guc_hwconfig_copy(guc, hwconfig);
> +
> +	/* An entry requires at least three dwords for key, length, value */
> +	while (i + 3 <= num_dw) {
> +		u32 attribute = hwconfig[i++];
> +		u32 len_dw = hwconfig[i++];
> +
> +		if (i + len_dw > num_dw) {
> +			drm_printf(p, "Error: Attribute %u is %u dwords, but only %llu remain\n",
> +				   attribute, len_dw, num_dw - i);
> +			len_dw = num_dw - i;
> +		}
> +
> +		/*
> +		 * If it's a single dword (as most hwconfig attributes are),
> +		 * then it's probably a number that makes sense to display
> +		 * in decimal form.  In the rare cases where it's more than
> +		 * one dword, just print it in hex form and let the user
> +		 * figure out how to interpret it.
> +		 */
> +		if (len_dw == 1)
> +			drm_printf(p, "[%2u] = %u\n", attribute, hwconfig[i]);
> +		else
> +			drm_printf(p, "[%2u] = { %*ph }\n", attribute,
> +				   (int)(len_dw * sizeof(u32)), &hwconfig[i]);
> +		i += len_dw;
> +	}
> +
> +	if (i < num_dw || extra_bytes)
> +		drm_printf(p, "Error: %llu extra bytes at end of hwconfig\n",
> +			   (num_dw - i) * sizeof(u32) + extra_bytes);
> +
> +	kfree(hwconfig);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.h b/drivers/gpu/drm/xe/xe_guc_hwconfig.h
> index b5794d641900..7df315900e1c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.h
> +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.h
> @@ -8,10 +8,12 @@
>   
>   #include <linux/types.h>
>   
> +struct drm_printer;
>   struct xe_guc;
>   
>   int xe_guc_hwconfig_init(struct xe_guc *guc);
>   u32 xe_guc_hwconfig_size(struct xe_guc *guc);
>   void xe_guc_hwconfig_copy(struct xe_guc *guc, void *dst);
> +void xe_guc_hwconfig_dump(struct xe_guc *guc, struct drm_printer *p);
>   
>   #endif

Reviewed-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>



--------------vc0LHe4CzKbw1opgxtAJixI9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/15/2024 10:26 AM, Matt Roper
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240815172602.2729146-3-matthew.d.roper@intel.com">
      <pre class="moz-quote-pre" wrap="">Although the query uapi is the official way to get at the GuC's hwconfig
table contents, it's still useful to have a quick debugfs interface to
dump the table in a human-readable format while debugging the driver.

Signed-off-by: Matt Roper <a class="moz-txt-link-rfc2396E" href="mailto:matthew.d.roper@intel.com">&lt;matthew.d.roper@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c   | 11 ++++++
 drivers/gpu/drm/xe/xe_guc_hwconfig.c | 57 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_hwconfig.h |  2 +
 3 files changed, 70 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 5125d76ccfac..8f95d3a5949b 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -19,6 +19,7 @@
 #include &quot;xe_gt_sriov_vf_debugfs.h&quot;
 #include &quot;xe_gt_stats.h&quot;
 #include &quot;xe_gt_topology.h&quot;
+#include &quot;xe_guc_hwconfig.h&quot;
 #include &quot;xe_hw_engine.h&quot;
 #include &quot;xe_lrc.h&quot;
 #include &quot;xe_macros.h&quot;
@@ -270,6 +271,15 @@ static int vecs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
 	return 0;
 }
 
+static int hwconfig(struct xe_gt *gt, struct drm_printer *p)
+{
+	xe_pm_runtime_get(gt_to_xe(gt));
+	xe_guc_hwconfig_dump(&amp;gt-&gt;uc.guc, p);
+	xe_pm_runtime_put(gt_to_xe(gt));
+
+	return 0;
+}
+
 static const struct drm_info_list debugfs_list[] = {
 	{&quot;hw_engines&quot;, .show = xe_gt_debugfs_simple_show, .data = hw_engines},
 	{&quot;force_reset&quot;, .show = xe_gt_debugfs_simple_show, .data = force_reset},
@@ -288,6 +298,7 @@ static const struct drm_info_list debugfs_list[] = {
 	{&quot;default_lrc_vcs&quot;, .show = xe_gt_debugfs_simple_show, .data = vcs_default_lrc},
 	{&quot;default_lrc_vecs&quot;, .show = xe_gt_debugfs_simple_show, .data = vecs_default_lrc},
 	{&quot;stats&quot;, .show = xe_gt_debugfs_simple_show, .data = xe_gt_stats_print_info},
+	{&quot;hwconfig&quot;, .show = xe_gt_debugfs_simple_show, .data = hwconfig},
 };
 
 void xe_gt_debugfs_register(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
index d9b570a154a2..025bad701556 100644
--- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
+++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
@@ -6,6 +6,7 @@
 #include &quot;xe_guc_hwconfig.h&quot;
 
 #include &lt;drm/drm_managed.h&gt;
+#include &lt;drm/drm_print.h&gt;
 
 #include &quot;abi/guc_actions_abi.h&quot;
 #include &quot;xe_bo.h&quot;
@@ -103,3 +104,59 @@ void xe_guc_hwconfig_copy(struct xe_guc *guc, void *dst)
 	xe_map_memcpy_from(xe, dst, &amp;guc-&gt;hwconfig.bo-&gt;vmap, 0,
 			   guc-&gt;hwconfig.size);
 }
+
+void xe_guc_hwconfig_dump(struct xe_guc *guc, struct drm_printer *p)
+{
+	size_t size = xe_guc_hwconfig_size(guc);
+	u32 *hwconfig;
+	u64 num_dw;
+	u32 extra_bytes;
+	int i = 0;
+
+	if (size == 0) {
+		drm_printf(p, &quot;No hwconfig available\n&quot;);
+		return;
+	}
+
+	num_dw = div_u64_rem(size, sizeof(u32), &amp;extra_bytes);
+
+	hwconfig = kzalloc(size, GFP_KERNEL);
+	if (!hwconfig) {
+		drm_printf(p, &quot;Error: could not allocate hwconfig memory\n&quot;);
+		return;
+	}
+
+	xe_guc_hwconfig_copy(guc, hwconfig);
+
+	/* An entry requires at least three dwords for key, length, value */
+	while (i + 3 &lt;= num_dw) {
+		u32 attribute = hwconfig[i++];
+		u32 len_dw = hwconfig[i++];
+
+		if (i + len_dw &gt; num_dw) {
+			drm_printf(p, &quot;Error: Attribute %u is %u dwords, but only %llu remain\n&quot;,
+				   attribute, len_dw, num_dw - i);
+			len_dw = num_dw - i;
+		}
+
+		/*
+		 * If it's a single dword (as most hwconfig attributes are),
+		 * then it's probably a number that makes sense to display
+		 * in decimal form.  In the rare cases where it's more than
+		 * one dword, just print it in hex form and let the user
+		 * figure out how to interpret it.
+		 */
+		if (len_dw == 1)
+			drm_printf(p, &quot;[%2u] = %u\n&quot;, attribute, hwconfig[i]);
+		else
+			drm_printf(p, &quot;[%2u] = { %*ph }\n&quot;, attribute,
+				   (int)(len_dw * sizeof(u32)), &amp;hwconfig[i]);
+		i += len_dw;
+	}
+
+	if (i &lt; num_dw || extra_bytes)
+		drm_printf(p, &quot;Error: %llu extra bytes at end of hwconfig\n&quot;,
+			   (num_dw - i) * sizeof(u32) + extra_bytes);
+
+	kfree(hwconfig);
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.h b/drivers/gpu/drm/xe/xe_guc_hwconfig.h
index b5794d641900..7df315900e1c 100644
--- a/drivers/gpu/drm/xe/xe_guc_hwconfig.h
+++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.h
@@ -8,10 +8,12 @@
 
 #include &lt;linux/types.h&gt;
 
+struct drm_printer;
 struct xe_guc;
 
 int xe_guc_hwconfig_init(struct xe_guc *guc);
 u32 xe_guc_hwconfig_size(struct xe_guc *guc);
 void xe_guc_hwconfig_copy(struct xe_guc *guc, void *dst);
+void xe_guc_hwconfig_dump(struct xe_guc *guc, struct drm_printer *p);
 
 #endif</pre>
    </blockquote>
    <pre class="moz-quote-pre" style="white-space: pre-wrap;" wrap=""><span class="reviewed-by" style="box-sizing: border-box;">Reviewed-by: Jagmeet Randhawa <a class="moz-txt-link-rfc2396E" href="mailto:jagmeet.randhawa@intel.com">&lt;jagmeet.randhawa@intel.com&gt;</a></span></pre>
    <div id="comment_1085233" class="comment" style="box-sizing: border-box; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><br class="Apple-interchange-newline">
      <br>
    </div>
    <pre class="moz-quote-pre" wrap=""></pre>
    <blockquote type="cite" cite="mid:20240815172602.2729146-3-matthew.d.roper@intel.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------vc0LHe4CzKbw1opgxtAJixI9--
