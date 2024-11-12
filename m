Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9D7D597A7
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 21:29:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 459E610E660;
	Tue, 12 Nov 2024 21:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CEO/tAos";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86BD610E660
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 21:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731446997; x=1762982997;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UNsnoaAYWH/DT7XXMn2AwP4RVsW+xPgw65a6tRE/Kgw=;
 b=CEO/tAosi9r6M65bcuS3PG2RvIyG05IFArza2FO0u1dxf4DkJISX3WkH
 vwUyvERRZTgWcL+ZGRDp7Ts9x7VzUJ1NcfydrIaummpGzlvB/az2ocST2
 L25oi1p0WFj/Nqkb4enfj+uDxH2IOtLU0qpI6JYgNhRrQq4FzaV7Zlq+C
 J+JaeJYojNGHffPDdV8Z4H8+5nr81mkQDiM9SS7OwKGt8jLw8YIZC1XPH
 vA5mN283Lc/OtW9uLud+frAgl4P2z6PMSwXyKlXjYdD/ymg3bVLPgZRHl
 KqDCYEO6AupnFNjX5y4MbCifp1EuFOJK1MH+7Oa7zTmTkLl81GbSlYC0U w==;
X-CSE-ConnectionGUID: 5OljUFSrT4i0t7Zxcfm5gQ==
X-CSE-MsgGUID: DTEN1WeDQ5yO24A5dCUvOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41871841"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41871841"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 13:29:57 -0800
X-CSE-ConnectionGUID: Ph8taiGHSUGhfDm8zvTcrw==
X-CSE-MsgGUID: 5qLXqTIyQPK4cC3jFB/8hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="92613565"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Nov 2024 13:29:56 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 12 Nov 2024 13:29:55 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 12 Nov 2024 13:29:55 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 12 Nov 2024 13:29:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fojmoHL5bfjPaMLKv+iui2Xios6Z++i8B5XQpPa4iCZApqJvEc4iiknLtFjoeotO5NBGT0vAUWDmWT0CaE6vPeskXqbI7/OKGLQQv2RUF864Gtmujw3/cHadtf42T2DxjqwBd+c/zIPF9yRo26F1611O+9ixILwqofjU64vQqqoypEKB75EMf7TRrWeP6nkPH2gaI5RlGwAilZ2W9LhtBwuhTFqWgXsJ9lZD1cZxE+O0cmEsJanYLV2964qQXtNG9w6VL53bnWfw/SReKdHbPDwVkCOLbsgdFnqukI77ssb3Fiz6rmGXh2CTssvXcdGcVzejIuc/qkJbMJfelhb+vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FK+715F/6fOvfZXvzgF+6+o1C0L3cDl+Xvhs9ZNqCNE=;
 b=TjO9i2s/+w6uq6Spzr576nP9yBeOWcNPObLCoMpUo70l+MNOtmBIANR/At7N37L7+FZIpB3WhFdf72KM9nm1AcEMee9DeUO2+D1jCR3VqF11Tm8mTA6HCe5MfGm0Hf2wemT7UUWooYpDCMbuejDVVGkkGIiAlAqUsYsmdh323zhHULmp9yQclXW62Xm8fIOkULaIAY0Yg5TyvB9JjDMGCFJgh8cLVYosw0yXf3ZL/v2pC9uItl5HBUD56RRjtd+KmkmbWAy4ntTFRmFDKAFZrHRgecobO4PDnjXeKHRcJDoW8bdfpt4RN4zLtHohnrBldYaBwbJbMWnJDUOOWFGCGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by IA1PR11MB7775.namprd11.prod.outlook.com (2603:10b6:208:3f3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Tue, 12 Nov
 2024 21:29:49 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%6]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 21:29:49 +0000
Message-ID: <87325dbd-0b29-4e19-b693-f041f610d76b@intel.com>
Date: Tue, 12 Nov 2024 13:29:48 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] drm/xe/pxp: add a query for PXP status
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
 <20240816190024.2176976-9-daniele.ceraolospurio@intel.com>
 <d3d243b0-a720-429d-8d96-3a4595728df6@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <d3d243b0-a720-429d-8d96-3a4595728df6@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:217::19) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|IA1PR11MB7775:EE_
X-MS-Office365-Filtering-Correlation-Id: 949ad9aa-7358-47c0-72a8-08dd0361233f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGcxVEtpMXVSVDVnd1huN0JiUU9QczhLOFFQTUdUejM0Z0IyZzF0OFBGdDZ1?=
 =?utf-8?B?TE93UThRWlh4VmdvaFpwMC9iZlVOcTZaQXhMRHY0YnJRZkZvYUZoSktoeFA1?=
 =?utf-8?B?d0RYd0drWk15SWtLb3huQ0orREhmNFM1STlzbUJEcno3RWVBUjNMUTFwUzFp?=
 =?utf-8?B?NXlSc05FR0I5eW5zRjVIZW5DbnduVElmb2NYZ0VpREw0Z1FqdG9hcmI1eTRk?=
 =?utf-8?B?YXdFbTBaUHVmajNNOEhtd3AzUGVvVUdkbktYejA5T3R1dnZnSDdMU29kVDV4?=
 =?utf-8?B?VDdvYk0xSHEwRVN5czZsbjZLSG1TQkVEQzJqUzI5ZjhUQ3lFZGFpaHFtaUtE?=
 =?utf-8?B?dUtUVlU4dXQ2cVZsOTkrQXlsOWFjOXMvYlVkTUt5cTRGZFJJQzhtajE1OHUx?=
 =?utf-8?B?TzVzNk5wN1FKZUpRcEk4WGNZdHVjZnJCeVZRaUcyUFZQUGxQRW1kR2NxN0Jn?=
 =?utf-8?B?VXV1WHpKUTF0Tmpad1d1bnJFdEVtd0gzam5vRHVMajVROWpEOHNMVVFEcytK?=
 =?utf-8?B?RDVsSDU0Y01qcVZNbExlZ0hKQ1ZOMlllekg4UWswUXRVUkhXNVRpNDdYWXp6?=
 =?utf-8?B?M05kVkZlbXp1QkZqY2RnQ1lyNkZ2YVQ4VHpYVGtLSDhDNml1YkpHa3JYMEFO?=
 =?utf-8?B?UjI3L29jc1h2ZHUwWGxLRWt4ZFRSckdkMXhNVlZtL2I5ZHFQRjM4QVhGcFpF?=
 =?utf-8?B?dldWNGttUGxKN0VzR0hSNEdNeGRXTHpQWWs3TFh3N3VjaHVIcFBqR01CdWlO?=
 =?utf-8?B?eFV5cXJaaVFTQ3REUmtldGhHK3ZuOHRvZjA1NmFIUFk1T3RCNm1kc1RmM1RF?=
 =?utf-8?B?cmtLd1QwekhQSGpjeTRhRW90UVh1cm42WlNqUEhQQXZ2dWxSZUVYM1pURmp1?=
 =?utf-8?B?SjRoVVVTNFVwcUpSaGZ5YUhyQWlpT3dHSjhwSzBRVzU4OFFFMFhta1Fua1Ns?=
 =?utf-8?B?ZE5CRDFyYmNDSy93MXBmeUt0MnNyRzBOWnhtMzQ1cnZEbklzWmVCdE8wd2NB?=
 =?utf-8?B?MzBzUFJLT0g4c0JVUk1xdjRJRXdBbGtnMHduYW1kSitQTk8wekxSN3h0Z0pn?=
 =?utf-8?B?UE83a1IvbEYrSWJFOHZBbW1oSmFPMUtOREEzaXM5ZG9jTngwWldxZHh4MlBZ?=
 =?utf-8?B?R3VZTkl3bVZDRkM3cVFRb1pkdlphZkJVMlZ6aGhqanBSQmplQUJhTXhZV005?=
 =?utf-8?B?OG40TUhudit2UGIrbTRGMDJzWGk1Q1lOQTd0QlV5SktDTHlRbmdCU1paK0Vi?=
 =?utf-8?B?VXI0bUpiWXFRb0RHQ2JwMUNMQ0JwSzJlN2lkMlp5QzV0djFXWmlUdlY4Smxs?=
 =?utf-8?B?ajRUQmZjaC83alJ5bGx4YTNSSjY2c3B2R0tjQjZIa1BTMDJtTHk5MW9BZEYr?=
 =?utf-8?B?NHc1eGtTc25NQmg1QWpCMTBidVB3UXJKR0dPaXZQTUNVWGgvYUJjbWZQSi9L?=
 =?utf-8?B?OFpGaytwM2FjeEkvVERoUWx6dFh3eTh1R0ZCeG56OStDeGpIMENlUFFPR3Zj?=
 =?utf-8?B?ZGMvOURmTHNiOVhhc0F5Q1d6ajd2ZVBMZFk2YVNpR0dMcUQ3dUZEdnBqa1dU?=
 =?utf-8?B?WHBOeGpyNDI1WStSL1BRZGM3QzJTR2VJRjJDZk9iemJTR3JJQlF2S0ZzTVRZ?=
 =?utf-8?B?blhoRG1YOVlWUkZ5Yk03OHVmSFlqZkF2N0xWeWhZMEc2a3IwNUVyMkR1aWw1?=
 =?utf-8?B?NUl5amg0LzhFMkZxdTJVWXVmb1o5V3l2dEg5OGxTU05uVnB0Nm5PUFdSSnpO?=
 =?utf-8?Q?iHe5G+pg0UXfbLm9hkldyOtSvV9z+rmBTh2Gyww?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmVqMW03bXQ1Ujgyc1o1Z2ZVbjFCbjd3K2Q0MFpzMkFKZ3dYK2tPM1Y0Tm51?=
 =?utf-8?B?OGhqTHhTbEF5V2QxcFcyMklhNGZsSzNUa0xMR3lwSmJ2Q0s2enhXTGFtVFJX?=
 =?utf-8?B?WDhBN3gxamhsV1ZJaGxFSFQ3YkVHQkdXSmloWFlHZFR1UUlCOSs1cjVvQzY3?=
 =?utf-8?B?WFJWV00xVUFMOW8vNGVtbEdKYXdMSGdUQi9LM2lnOUlPMndqdGErb21XbElX?=
 =?utf-8?B?Qm9iUWNJQThDNEdwbklTMjhHbDZ3U3oxMDJObTYzMXhFMTRIUGNLYkVaS20w?=
 =?utf-8?B?MWVqWEE3Wk4vMnQ1b0RBTHN2b1grMVRwc0hIM2VFQ3JrNDdHME9IRGJxZGIr?=
 =?utf-8?B?RkxYeThBekNXcnJvLzZ3QU5aZkk2NGwvSlFnTmhocjZPdG50NXpXeGZNSitJ?=
 =?utf-8?B?RnRHT2xzdEh3dWJUQ2E2VVlkaStiSnRhN2ZCUEdMTUVXS1ZVaWQyZ1ZwZ1Br?=
 =?utf-8?B?RFdYRGZpMlFucGVibmpBZVZUT1RpOEJWY2pYN08rRDNZOCsyUllPU1lnR1dX?=
 =?utf-8?B?S0NyQTM1UWdwaldyZ3c3b2FscURuT01ESlZiWm9NZGh0S2UrOWNKN2hSQXhH?=
 =?utf-8?B?M2taVXFDSmxwWFlGWDRxdThkdkJDa0sxVXpvL0RncnhUb1UybjE2NHJVbFE4?=
 =?utf-8?B?ZUZRNWdwSlRuNTF6VENkZkViWW1WRDMzcjhxKzgrVTMwdVp2NWRiRHFMTFhF?=
 =?utf-8?B?a3hTMWM5K1pjcUlyUnlVaWdRSkc4MkRhOUJYYmhUZ0xvVmpxWTRLQTd2b0w5?=
 =?utf-8?B?YktoUzZLSkI3VTFDOHM5V3drWUpDTjFGa2RvbnQrc01YM2hOdlgwNEcwUDhJ?=
 =?utf-8?B?SmVxcjlmdWI4M2d6QXVrb2JTbXIxM0NpcXdhNHpZalBvZlRMOGhtc2M1YUZ5?=
 =?utf-8?B?R1BzS2xhcmVhY1BrbkZaTXpUR3VjbVZGVUtQS0hiRk54Sk94ZENkOFZrZ3FB?=
 =?utf-8?B?T1J3RVIzbXFRcnBSVE5MUDlKZ1BNZjUrL2d4NmY2ZXNqSnpnL3NVaG5lK29N?=
 =?utf-8?B?V0g2THNxQU9QdVdqOVZyMEh0aGJkd2VCSFlqQjI5KzBjKzlqUzJRRGNUSjVM?=
 =?utf-8?B?ZnZZNElzR2M5TGU4WlRUV0hJbVhuRWhoQ1hPaE9MSDhMVVRsVUd5YmlkRUhR?=
 =?utf-8?B?OGpBdi9VekRmT0ZLYXp5dDJCcHVvenVkbGk1QTJFbFdzelVrcXNLRUp2ZGZR?=
 =?utf-8?B?cm5hQWdXbHo2UlJFVTk1YXdlaVozaFkySHkxYWgvN1c0UHk2OThWbm1uRFFk?=
 =?utf-8?B?Lzc5SGRWS3VIWWZRV1dNZ3lwRjVIY3dDdjBpenNodC9XaWJuMk9GUHhRbjd6?=
 =?utf-8?B?aHAwb1JzZm9zQXIwUjVZOVVHSXcxOHNaamE3QmpzZFJEZFNodXg3MzJoUldk?=
 =?utf-8?B?c25EWXVmcnVGRk9NSjZob0tKSDNJdWVRZkExSy9VVWJkRXFjNGszamwxeHFy?=
 =?utf-8?B?YVZsRzBIdW1kVUF6RFlYYVF1SGNlYTlUN0JlcWQ2L2tDRTZ6K1V4dVI1d3Vp?=
 =?utf-8?B?Zkd4N2FUZVNzcE5LUmNzR016aThoNTA1UUM4K1FTNGpOUWNjYlQ5SmhwZm5x?=
 =?utf-8?B?N2tWOWd2akN1QS81SkVQRkVnNjBSTjJGbVJ0dS8zbmt3L3kzMDU0NUk5OW41?=
 =?utf-8?B?V1ZaL3ZpcDgyTGIrblUrRFBjdWI1Ym5YRXg3dE1xQTUybWJUemh5UzhrQU5X?=
 =?utf-8?B?a0RYcTdRWCttSE5EazRzLzFNbjRLbDNQSGVzUEY5QmEzemNXbnZkdDNnelRs?=
 =?utf-8?B?M0Uzd1dSVzBkdDd2cTBnNTlLVitmT1NnOHQyK0FqRzI5YlYwUXFkTXJvUkh2?=
 =?utf-8?B?YmZkTnJtTE1XTVQ4NmFuOVZKd2pWMTJFUy94RzZudE1TNDZySEFiM0lIZVNF?=
 =?utf-8?B?bmJuejY3cFY3K2Q5MkdzTXdJS2RnMi9xVjB1dDU3Slh4ekxoUU9lTWR5Nm8r?=
 =?utf-8?B?eUhUNkMycWpoSHlvR1JyUkNabzZKanpjVEkxUFlDemVqWkJJQ0ZVY1cyQWVH?=
 =?utf-8?B?cFg3d0RreTF3WFNaWkMybmxnWCt3RzRLWXMrdVlPbThDSmpJRWpseUhmZTVX?=
 =?utf-8?B?TVJCbVYxR056cUhYaTVDci9Pc252dlRWMVZNZjVGRjh3ZDFiUitmMkdPb3RK?=
 =?utf-8?B?eEU3SDd5L1pyZjhtejhyWnh2QzRPdlFRMWVFNUo2UHdJVDlXSXR4M0RCS3hJ?=
 =?utf-8?Q?S5nxgDwfPnMDtIw7vPwxW6Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 949ad9aa-7358-47c0-72a8-08dd0361233f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 21:29:49.6428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RKEsZLbWJ6+51+bEoEnTi9xdhfIlUSBZkpy4n337cwCv+wcK1+UoDwmMGqLOfTMJ2LtgmCNC6WnlYx+tCD7nxBTaGT4ynUdtxHhEdgFIBlA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7775
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


On 10/8/24 17:09, John Harrison wrote:
> On 8/16/2024 12:00, Daniele Ceraolo Spurio wrote:
>> PXP prerequisites (SW proxy and HuC auth via GSC) are completed
>> asynchronously from driver load, which means that userspace can start
>> submitting before we're ready to start a PXP session. Therefore, we need
>> a query that userspace can use to check not only if PXP is supported by
> by -> but?
>
>> also to wait until the prerequisites are done.
>>
>> v2: Improve doc, do not report TYPE_NONE as supported (José)
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: José Roberto de Souza <jose.souza@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pxp.c   | 33 +++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pxp.h   |  1 +
>>   drivers/gpu/drm/xe/xe_query.c | 32 ++++++++++++++++++++++++++++++++
>>   include/uapi/drm/xe_drm.h     | 35 +++++++++++++++++++++++++++++++++++
>>   4 files changed, 101 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
>> index acdc25c8e8a1..ca4302af4ced 100644
>> --- a/drivers/gpu/drm/xe/xe_pxp.c
>> +++ b/drivers/gpu/drm/xe/xe_pxp.c
>> @@ -60,6 +60,39 @@ static bool pxp_prerequisites_done(const struct 
>> xe_pxp *pxp)
>>       return ready;
>>   }
>>   +/**
>> + * xe_pxp_get_readiness_status - check whether PXP is ready for 
>> userspace use
>> + * @pxp: the xe_pxp pointer (can be NULL if PXP is disabled)
>> + *
>> + * This function is used for status query from userspace, so the 
>> returned value
> value -> values
>
>> + * follow the uapi (see drm_xe_query_pxp_status)
>> + *
>> + * Returns: 0 if PXP is not ready yet, 1 if it is ready, an errno 
>> value if PXP
>> + * is not supported/enabled or if something went wrong in the 
>> initialization of
>> + * the prerequisites.
> You have two independent statements regarding the return code. Would 
> be better to just have the "Returns: ..." paragraph but include a 
> statement that these values are as defined in the UAPI.
>
>> + */
>> +int xe_pxp_get_readiness_status(struct xe_pxp *pxp)
>> +{
>> +    int ret = 0;
>> +
>> +    if (!xe_pxp_is_enabled(pxp))
>> +        return -ENODEV;
>> +
>> +    /* if the GSC or HuC FW are in an error state, PXP will never 
>> work */
>> +    if (xe_uc_fw_status_to_error(pxp->gt->uc.huc.fw.status) ||
>> + xe_uc_fw_status_to_error(pxp->gt->uc.gsc.fw.status))
>> +        return -EIO;
>> +
>> +    xe_pm_runtime_get(pxp->xe);
>> +
>> +    /* PXP requires both HuC loaded and GSC proxy initialized */
>> +    if (pxp_prerequisites_done(pxp))
>> +        ret = 1;
>> +
>> +    xe_pm_runtime_put(pxp->xe);
>> +    return ret;
>> +}
>> +
>>   static bool pxp_session_is_in_play(struct xe_pxp *pxp, u32 id)
>>   {
>>       struct xe_gt *gt = pxp->gt;
>> diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
>> index 2e0ab186072a..868813cc84b9 100644
>> --- a/drivers/gpu/drm/xe/xe_pxp.h
>> +++ b/drivers/gpu/drm/xe/xe_pxp.h
>> @@ -14,6 +14,7 @@ struct xe_pxp;
>>     bool xe_pxp_is_supported(const struct xe_device *xe);
>>   bool xe_pxp_is_enabled(const struct xe_pxp *pxp);
>> +int xe_pxp_get_readiness_status(struct xe_pxp *pxp);
>>     int xe_pxp_init(struct xe_device *xe);
>>   void xe_pxp_irq_handler(struct xe_device *xe, u16 iir);
>> diff --git a/drivers/gpu/drm/xe/xe_query.c 
>> b/drivers/gpu/drm/xe/xe_query.c
>> index 73ef6e4c2dc9..a1e297234972 100644
>> --- a/drivers/gpu/drm/xe/xe_query.c
>> +++ b/drivers/gpu/drm/xe/xe_query.c
>> @@ -22,6 +22,7 @@
>>   #include "xe_guc_hwconfig.h"
>>   #include "xe_macros.h"
>>   #include "xe_mmio.h"
>> +#include "xe_pxp.h"
>>   #include "xe_ttm_vram_mgr.h"
>>     static const u16 xe_to_user_engine_class[] = {
>> @@ -680,6 +681,36 @@ static int query_oa_units(struct xe_device *xe,
>>       return ret ? -EFAULT : 0;
>>   }
>>   +static int query_pxp_status(struct xe_device *xe, struct 
>> drm_xe_device_query *query)
>> +{
>> +    struct drm_xe_query_pxp_status __user *query_ptr = 
>> u64_to_user_ptr(query->data);
>> +    size_t size = sizeof(struct drm_xe_query_pxp_status);
>> +    struct drm_xe_query_pxp_status resp;
>> +    int ret;
>> +
>> +    if (query->size == 0) {
>> +        query->size = size;
>> +        return 0;
>> +    } else if (XE_IOCTL_DBG(xe, query->size != size)) {
> Do we not allow structures to grow in future versions? In a backwards 
> compatible way, that is.


We do. The user is expected to first call the ioctl with size 0, get the 
actual size and then use that in a second ioctl call to get the actual 
information. So even if the size is updated userspace should update with 
it. All other query ioctl are coded the same way.


>
>> +        return -EINVAL;
>> +    }
>> +
>> +    if (copy_from_user(&resp, query_ptr, size))
>> +        return -EFAULT;
> Why copy in the data from the user side only to overwrite everything 
> in the structure?


true, will drop.


>
>> +
>> +    ret = xe_pxp_get_readiness_status(xe->pxp);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    resp.status = ret;
>> +    resp.supported_session_types = BIT(DRM_XE_PXP_TYPE_HWDRM);
>> +
>> +    if (copy_to_user(query_ptr, &resp, size))
>> +        return -EFAULT;
>> +
>> +    return 0;
>> +}
>> +
>>   static int (* const xe_query_funcs[])(struct xe_device *xe,
>>                         struct drm_xe_device_query *query) = {
>>       query_engines,
>> @@ -691,6 +722,7 @@ static int (* const xe_query_funcs[])(struct 
>> xe_device *xe,
>>       query_engine_cycles,
>>       query_uc_fw_version,
>>       query_oa_units,
>> +    query_pxp_status,
>>   };
>>     int xe_query_ioctl(struct drm_device *dev, void *data, struct 
>> drm_file *file)
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 5f4d08123672..9972ceb3fbfb 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -627,6 +627,39 @@ struct drm_xe_query_uc_fw_version {
>>       __u64 reserved;
>>   };
>>   +/**
>> + * struct drm_xe_query_pxp_status - query if PXP is ready
>> + *
>> + * If PXP is enabled and no fatal error as occurred, the status will 
>> be set to
> as -> has
>
>> + * one of the following values:
>> + * 0: PXP init still in progress
>> + * 1: PXP init complete
>> + *
>> + * If PXP is not enabled or something has gone wrong, the query will 
>> be failed
>> + * with one of the following error codes:
>> + * -ENODEV: PXP not supported or disabled;
>> + * -EIO: fatal error occurred during init, so PXP will never be 
>> enabled;
>> + * -EINVAL: incorrect value provided as part of the query;
>> + * -EFAULT: error copying the memory between kernel and userspace.
> Currently, could also be copying from user to kernel. Although that 
> copy seems unnecessary.


I meant this as both ways, but I've dropped the user to kernel copy anyway.


Daniele


>
> John.
>
>> + *
>> + * The status can only be 0 in the first few seconds after driver 
>> load. If
>> + * everything works as expected, the status will transition to init 
>> complete in
>> + * less than 1 second, while in case of errors the driver might take 
>> longer to
>> + * start returning an error code, but it should still take less than 
>> 10 seconds.
>> + *
>> + * The supported session type bitmask is based on the values in
>> + * enum drm_xe_pxp_session_type. TYPE_NONE is always supported and 
>> therefore
>> + * is not reported in the bitmask.
>> + *
>> + */
>> +struct drm_xe_query_pxp_status {
>> +    /** @status: current PXP status */
>> +    __u32 status;
>> +
>> +    /** @supported_session_types: bitmask of supported PXP session 
>> types */
>> +    __u32 supported_session_types;
>> +};
>> +
>>   /**
>>    * struct drm_xe_device_query - Input of &DRM_IOCTL_XE_DEVICE_QUERY 
>> - main
>>    * structure to query device information
>> @@ -646,6 +679,7 @@ struct drm_xe_query_uc_fw_version {
>>    *    attributes.
>>    *  - %DRM_XE_DEVICE_QUERY_GT_TOPOLOGY
>>    *  - %DRM_XE_DEVICE_QUERY_ENGINE_CYCLES
>> + *  - %DRM_XE_DEVICE_QUERY_PXP_STATUS
>>    *
>>    * If size is set to 0, the driver fills it with the required size for
>>    * the requested type of data to query. If size is equal to the 
>> required
>> @@ -698,6 +732,7 @@ struct drm_xe_device_query {
>>   #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES    6
>>   #define DRM_XE_DEVICE_QUERY_UC_FW_VERSION    7
>>   #define DRM_XE_DEVICE_QUERY_OA_UNITS        8
>> +#define DRM_XE_DEVICE_QUERY_PXP_STATUS        9
>>       /** @query: The type of data to query */
>>       __u32 query;
>
