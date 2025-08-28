Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDA1CA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 13:27:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F4C10E9AE;
	Thu, 28 Aug 2025 13:27:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LRbgdZWW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3BB10E9AE
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 13:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756387675; x=1787923675;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gmmFyhnjm25iFwd/p2hJ2rhZ/Itm2rjDP0z2LC+xaHs=;
 b=LRbgdZWWidDWG5HtieMIp9Bsq73sVxYmoyDoQ0LyDXG9O7Nb1Itkfo/E
 o1/yhJO/P0FmJ71VZK/TVx1R4qMoBcXlKjOG/D589X/cfJiSqoORekYux
 9JPsmXU6+nQRB5rvqBGdA4BGrPcfT3VO21EUv2tCY0seGSME3xt21mRxT
 KgKLw4hf/VT4gtU+BO24s8JXbBYOFBbAsk83NJWlvxhl53P1y8hQSNSsT
 2y7KUZLGYJCDXcYCnjEctYEVNbxP4mCNms2mW5UfXZ5H9K1HOjo7xlGQm
 6Vtg80cdXQ7YU7ZzudWu7Ejei3FpJiJq10oAsotI3TSGzE42Ott7dMTzH A==;
X-CSE-ConnectionGUID: f5zv0d+EQ3Cjsmbxm2TnCA==
X-CSE-MsgGUID: IymX/Oy+SZOgThKbW3uGvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="76105537"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="76105537"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 06:27:48 -0700
X-CSE-ConnectionGUID: 9tzko23XRhm7WZKQPIYOhA==
X-CSE-MsgGUID: VaQ9fPi+T9uoeCq+UJ0EKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="174280898"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 06:27:48 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 06:27:46 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 06:27:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.88)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 06:27:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sN1x4Y0eYPl6yAb2JWwRKKMo7sk3ttcYffxmOcYjePAvEPed+kJWSAwK0j9eRVfrOoymjPWqHBSV8F8LxKQO9+UxZhX8jmO1TdFmYxVPgvo1t65iPoV0zADR78RJuqfHlf9TgfI0h2SfEnFw/zGB6vhSReheDhVYaB1QQVpveO29m59ZBbMfgcg0dyOMVECBEBixg1fel+zb1u6Otn9fXZRpGL5r/7iVX5uYSA6LnzwRi78jzAAX3wt9PPcgj8piNAuu3dOlJ+s4GA5D7MRzDpmyvXDWYJV18Oljl0GSG1w/dWjoIHma902dufphOzv/KWvLJr84hvMDTopTSgvxGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5T/YVg+U0/Qro148XuLfqW/iPkDURA1usb94B6K2jI=;
 b=jK48rX7HJM0Lp2DtIHxUfT1DmJfz7EjSKuOo46hCun4LANHdxzFCreMvQBnIsqtkx4tIAuguOirPAgtn4/oW5ExNVTEnkxmpOE9+p9m/RYI5yRpwSKRQX4jcCBPvs/As9GN64zQXTOCdZpuyWCIY3xv1HuqF6Xv1IERvsXpPU6o2On4cEUlKXhx3/CjxNdrFPfjIHHUXTeigxL6rCvGB72CYwVLnRwTQsIgWmd6CWO/j9ll/5Z8d9Mxm7+O8vdT7XViV/sbk70OjFbgLwn0mRTvAbrVaP8URlRuAOMBOAtpQ8zqPxeXLnaupf2RPT3Y89OV1yM8a93r69V+Gowp1XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by MN6PR11MB8148.namprd11.prod.outlook.com (2603:10b6:208:472::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 13:27:35 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 13:27:35 +0000
Date: Thu, 28 Aug 2025 15:27:29 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <himal.prasad.ghimiray@intel.com>, <michal.mrozek@intel.com>
Subject: Re: [PATCH 06/11] drm/xe: Add xe_guc_pagefault layer
Message-ID: <aLBZQQWCC4f7xFPo@fdugast-desk>
References: <20250806062242.1090416-1-matthew.brost@intel.com>
 <20250806062242.1090416-7-matthew.brost@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250806062242.1090416-7-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: WA2P291CA0031.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::12) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|MN6PR11MB8148:EE_
X-MS-Office365-Filtering-Correlation-Id: 022d4897-00fd-40f3-bda2-08dde636a63f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGYraTBUN0NieGZ6eWZhUGt4ZzBBdDBIZXRBOXE1eDc1UHpQOGcxNXg0NUdk?=
 =?utf-8?B?MVdSNEdmamljVmhJT1BhK051ckhQU2N1VW1VMXdjY292ZWhxSVBtajd5bXJR?=
 =?utf-8?B?SjdjTE84QkNLUzhZOG9MMEFIWjM5SFVUTTVxUXhjQnZvZVIvS3BQdzRqRjda?=
 =?utf-8?B?VkswVDJIekNzTHQ0WTM0R05SY05odVVLT01hZmdQK1R4Vnh2dFc4UDRKV1RP?=
 =?utf-8?B?UWVIUkNqa3laNS9oNWc3L1A2SkhvOGRHWC9Dd2NNZllObmEyK212amsxazhj?=
 =?utf-8?B?RWJmUkY2eU1UZHJleUJmckxBQk42YVE5QmRGOFJHbGpvTUFReWhoc1cweXZa?=
 =?utf-8?B?K05XN1hOeWF4MmZFOTh3SlBiekxkb1JBWHZBQTFwMnF4Skx0cE1xam1Sdmt1?=
 =?utf-8?B?TlBPa0RuUnpJZFhqV1RxcUlRT2pIU1pieFBQYWk1MTY0VEVxZFAxbVVvVDBQ?=
 =?utf-8?B?YlpHSHNWQTMrc3RJaituTVQvMkRDd0ZocnB5bzFxYzdmQnRnVGliMm1BVGpm?=
 =?utf-8?B?cFVuU1N3cUhsb1ZETlNJZWgvR0ZaekdrKzliR0dqcVIzTlNVTks0N3JWVlZS?=
 =?utf-8?B?MVFxeDE5UnJDQkZvQmRyVnU0NVA1ZjUzRitTa0ZnamMwS3pVdGthNXZ1S0Uv?=
 =?utf-8?B?cjJCSzc1VzY5dzVlQ0QyMnpYNXY2eDVKVHdEN1dGcnhYeVpLT0hiQnVLVGdG?=
 =?utf-8?B?RlRpZVJDOHdTZENhTGZTZkprdWRObkpQNlQrbXVlUkdVMnZtWTlSa2tLV09t?=
 =?utf-8?B?Yk9TTFlFUlNja29WcVE2S3V6cmVGZE5Gdk5WMFZkNnFUQkNWUzI2UlhWejV6?=
 =?utf-8?B?bDVQNHFReHV3Y05tYlI2RmZRbXE4R0JjOHlqT3JVMWE2NXgvMG9tL3ZMbFkx?=
 =?utf-8?B?SU1rWDBQK01wL1liVm53dGpvZXo1QUdGMnFUTUJScHJybjk1MlRWa0Ezclhj?=
 =?utf-8?B?YTY4bVAyVmQrYStYM0prNkF4Rm5GbStMM0dqcm5vdElGckpoelRWbHMzK0J2?=
 =?utf-8?B?YWFjTDkrODBxNE42TE1hMkEvbEZFT0F5cTM1SHBtc1JwT2o0bnR0NTAxY1FS?=
 =?utf-8?B?ZUs1MmNjQS9mNm96UXFUMEwzYjlKcjZuMWpMRXlIdGJIRXI1QXpnTm5FVFNt?=
 =?utf-8?B?eVg5S1ZUa2xWVzEwbERPM0dOSUt0U3dXdnFYcEFJMksweldoRWtWNVdoZzZ2?=
 =?utf-8?B?Vi9nWEpacXJ5cDFhMTgzVDB2OUFXL2JsTGdkVlZ1NTlCS1dvcENieFZOLzQ4?=
 =?utf-8?B?OTEvSlpBZEUrcWhXYkphVTBlaExXb2M3dUtjUXk2ZzV4VThkekNsMmVSNFAz?=
 =?utf-8?B?a2lVSm11MmpmZGFCSy9lbCtKVytTTzZuVVhZNVBaRVdPamVyTWI0U29XWHdU?=
 =?utf-8?B?Q3BXSk9EZEdrR1J5L3RSRVJ1ZTNQSU1aNFhHcHhDTlVGdlY4UFhUR1BvanV5?=
 =?utf-8?B?TEZ3U2Fpa3JpdUVKMGZ4bXJCKzk5SzdjVm42eHhSUWY0Q083QXIyUHBJL1FP?=
 =?utf-8?B?VlhaWWhndGpYbEZxV1gxT0IzSU5mb1lTcmtvMlZhdDJEdEJZSHdoSUQvMzl5?=
 =?utf-8?B?MDNRUnl3MVBWd3JYUmRKL3VaenB1UGRwamp3aTdZSndVUStxK1ZYVUpUM04w?=
 =?utf-8?B?TGNaL1VCbWViVXIvcjBFRTF2bEJjT3Y2emJEYjRpS3dmTGQ5STVoOHpteWVy?=
 =?utf-8?B?eGJkb25DTytQWkx4d0IrQ1U2amVJbmp1MGVDdmRoM1NvTGFJc2dhZlFEb2U3?=
 =?utf-8?B?K09pRE5UcEVkUXlPajE2dzNqakRia0I4TXZGOE5CZzhnNkp1S1JidDhlUUta?=
 =?utf-8?B?TXpGQ3ErV01WR3o3bjZDTmwwUXBkTExMUTNMRkw2QVZxSmJVTnR3Y0JPTGhW?=
 =?utf-8?B?QytQSHNXRW9lcUZUR0hwVUZ3RHYxQWRJNWs2LzNvTk5zZ2Q2UmVSSm5wcUZF?=
 =?utf-8?Q?WmlVNek+W1s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjJJUVYvQ2dUbjdVcENmODd6TW1kUzF1aktIK2d1YWVGQjJUTkFYZktLVFh3?=
 =?utf-8?B?WHI3OUlUWGVxN3F3RjFBZVduNDVlejYzcFlXdGEvZENxU1YwWXJFRVhDMEZn?=
 =?utf-8?B?blpKUHZMYXVBdmptZGVhK3RyRU0xb3VTSFk1R0ErS0lqY3dPbFVOUFBOV0lX?=
 =?utf-8?B?Z2xaSkc0Q28vSmgzOEI1WkUxeGQ5SEtDQVdFSmE2WDVGWUZHaXNNdE5mTWNY?=
 =?utf-8?B?b2dCZmVSRUExa09xSGpteko1UTNYdTZnWjZWT28wdHE3WHQ4SXN6VmZXUitV?=
 =?utf-8?B?VTNvRWNvTTdaN0xKVmRrZmNnemVMK3FaeGFaU0N1VTRYNy8vUHJISThFalc0?=
 =?utf-8?B?VTRabktYd2xtQlA1S1d2M1R3cWJJWDdlaWEyRm01OWJENFdwc3JjTUFiUzVO?=
 =?utf-8?B?QnhKNjFCcFFsZkQxZkxPalBaTGpPY0EwZnloS3kxaU40MEFrcG52NFZmeXNy?=
 =?utf-8?B?Mzhlb0M4aWozY1A0QSsxclNERHpwZlIyZDZDMURPbTR1RXY2TS9lanRvUlhU?=
 =?utf-8?B?MCtKemdUSS94bjY1ZU91K041WS9ZN0tlS3BjMjVwSllaU1NPcUQ2ZjBZZnE3?=
 =?utf-8?B?eXIwNDF0Y1BaQTNRMXF3cUQ0aEYvNFlmNGFRdExKQ1p0aVh1clZhQlhxRE5S?=
 =?utf-8?B?QmpYbVFyYUw2WGt6MW9Jd1UyTlZvL3ZSZ0I2bHNpbkRNZ3Vyd1ZSbGJISHBF?=
 =?utf-8?B?OHBxaHE0a1NoRnkvWFNQVHc4c1hKMHluejRXYTBUQlNKdnhQdUhGU1QzaS9R?=
 =?utf-8?B?TzhSN3c5N3FURlRDdUVnRUlkeDFlSDJpYWZRY2I5Q0dVTk93ZnBoNE5DV2xV?=
 =?utf-8?B?WDRjbW1oa2JmWlVla1F6TUNCNzdNalBna3plMURxRTZUVTJwMHFvR0xRSm1l?=
 =?utf-8?B?SUpvWE9hNGNkOHB1RjRwS2JnOEtVZXZKTmk5eHNncGZMcko5L1I2U2loelJj?=
 =?utf-8?B?cU00TVZZcG9xLzNReGRBbjdTM0czQ1VDdmdOSWZtZUpNNEt4MFpxbHZIWE1w?=
 =?utf-8?B?bkRnNzlnZnpNc1RYVXJRaUFTVC8wcDB1WkFEV3FmM0QxVkU1WTBOQzBFaU9I?=
 =?utf-8?B?STdzSGVESmo4ZzIzQ09tTjZNdGxKc1VtbU9WNkRUTTl2ZDhVZ1dGNTlxNnlO?=
 =?utf-8?B?RWFDaFVMVVN6STFoT0lnVTVvMjdLeFZKVjN0RlN6NG01cW9zNGRGWnB0a0ox?=
 =?utf-8?B?SFR4RHB0d2wrcWNHNDBtZ0pMMm15QWNEL2l4Tms1Q295Y2kxVUp2WG16UitO?=
 =?utf-8?B?MHN2WEhqR01NdXNiZ2QrQTJZNnZjdnpCU3AyRytVQ1RBbUN3VFFZWUZsbG1h?=
 =?utf-8?B?VTIxTExJOVBXcHRnWVJ2dGtpYUxaUFNJWkZtSnRtVkhTWXd3S3hncmRUV0J0?=
 =?utf-8?B?RUk0U2MydHNJOVk2U09GVVErSXdSUnJON1NJaVJqZnd3UmdCdWpqUno3YkJa?=
 =?utf-8?B?MWJGdytJS0lmOTJ0QkZ4MUJZQUJCRFFHZ0tZK2htYmZiWjBiYS9VK1U4ZzRP?=
 =?utf-8?B?R2c3RkVvTllLdDNJbEpPMUtvaVhMYTBqMEV0ZVRKL0pkUzBQN0tUS1BvSW9w?=
 =?utf-8?B?WDh1bjhtZGV0aWNKN1k5R1NkbFBidG5vUURldGNtNUdOT3FCVnhYdjNYSWQ0?=
 =?utf-8?B?cUZTSmk0Qm90eWNTaWhjdlNYdXFKbmlFdExPTVdZdEFOZEVqOHc5ejEvQlNZ?=
 =?utf-8?B?bDA2YzJzVUE5Tit0UnZNZjQ2QlpaaFIrTWdXMTVKNU92YndESU1BWDdVNUU5?=
 =?utf-8?B?OGdKUGQza0RhUUxOU0Y0UWw5eGQyWkIyR2xzWm1nelcwVFljaWhGeHpuU3lD?=
 =?utf-8?B?NWdjdWhkVXZSK05Qa3hpbUkxUzZ3YVJMRUhaZUIrVkp1aGlpSVM0ZzFoVWlK?=
 =?utf-8?B?azNtQjh6UEpMM3pPMmJOL000RlU2NnB3RjR2b3k0dUxZZ3A3ZW4zNEVJZjFh?=
 =?utf-8?B?UHhwaVppOGg2Q0crTm5CeXFZcVZQaW9YYWlDZ3pDdVJKVFRoTUN1WHROdGh0?=
 =?utf-8?B?MFBrUzFQNzU1TWJFaWk5eUplVzhockVsL3FVaGRTZmpRSExkcVVYZUtBSlZV?=
 =?utf-8?B?QnFTRzNVUVg1cjVjYSt4RDJZWHk0dTkxMmQ3UUxpNHdtcCtLVWovZ0Qrd1g5?=
 =?utf-8?B?R3dJTlpDYkdCaUcyRUZkRlVlditKY2RuSUh2S1hZT2hXT2Z4UTE4bkp0d2xX?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 022d4897-00fd-40f3-bda2-08dde636a63f
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 13:27:35.0864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: djsSUZf9hujVTzKjKkjDaetii5ADtOUGhstH3owcE/NWOdu3kCMwSB84XzIpqPp++nKTbhKjIw+NzXcr7IU5F07xwCiHMIYr9ndfSqty2UI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8148
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

On Tue, Aug 05, 2025 at 11:22:37PM -0700, Matthew Brost wrote:
> Add xe_guc_pagefault layer (producer) which parses G2H fault messages
> messages into struct xe_pagefault, forwards them to the page fault layer
> (consumer) for servicing, and provides a vfunc to acknowledge faults to
> the GuC upon completion. Replace the old (and incorrect) GT page fault
> layer with this new layer throughout the driver.
> 
> Signed-off-bt: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile           |  2 +-
>  drivers/gpu/drm/xe/xe_gt.c            |  6 --
>  drivers/gpu/drm/xe/xe_guc_ct.c        |  6 +-
>  drivers/gpu/drm/xe/xe_guc_pagefault.c | 94 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_pagefault.h | 13 ++++
>  drivers/gpu/drm/xe/xe_svm.c           |  3 +-
>  drivers/gpu/drm/xe/xe_vm.c            |  1 -
>  7 files changed, 110 insertions(+), 15 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_pagefault.c
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_pagefault.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 6fbebafe79c9..c103c114b75c 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -58,7 +58,6 @@ xe-y += xe_bb.o \
>  	xe_gt_freq.o \
>  	xe_gt_idle.o \
>  	xe_gt_mcr.o \
> -	xe_gt_pagefault.o \
>  	xe_gt_sysfs.o \
>  	xe_gt_throttle.o \
>  	xe_gt_tlb_invalidation.o \
> @@ -75,6 +74,7 @@ xe-y += xe_bb.o \
>  	xe_guc_id_mgr.o \
>  	xe_guc_klv_helpers.o \
>  	xe_guc_log.o \
> +	xe_guc_pagefault.o \
>  	xe_guc_pc.o \
>  	xe_guc_submit.o \
>  	xe_heci_gsc.o \
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 5aa03f89a062..35c7ba7828a6 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -32,7 +32,6 @@
>  #include "xe_gt_freq.h"
>  #include "xe_gt_idle.h"
>  #include "xe_gt_mcr.h"
> -#include "xe_gt_pagefault.h"
>  #include "xe_gt_printk.h"
>  #include "xe_gt_sriov_pf.h"
>  #include "xe_gt_sriov_vf.h"
> @@ -634,10 +633,6 @@ int xe_gt_init(struct xe_gt *gt)
>  	if (err)
>  		return err;
>  
> -	err = xe_gt_pagefault_init(gt);
> -	if (err)
> -		return err;
> -
>  	err = xe_gt_idle_init(&gt->gtidle);
>  	if (err)
>  		return err;
> @@ -848,7 +843,6 @@ static int gt_reset(struct xe_gt *gt)
>  	xe_uc_gucrc_disable(&gt->uc);
>  	xe_uc_stop_prepare(&gt->uc);
>  	xe_pagefault_reset(gt_to_xe(gt), gt);
> -	xe_gt_pagefault_reset(gt);
>  
>  	xe_uc_stop(&gt->uc);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 3f4e6a46ff16..67b5dd182207 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -21,7 +21,6 @@
>  #include "xe_devcoredump.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
> -#include "xe_gt_pagefault.h"
>  #include "xe_gt_printk.h"
>  #include "xe_gt_sriov_pf_control.h"
>  #include "xe_gt_sriov_pf_monitor.h"
> @@ -29,6 +28,7 @@
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_guc.h"
>  #include "xe_guc_log.h"
> +#include "xe_guc_pagefault.h"
>  #include "xe_guc_relay.h"
>  #include "xe_guc_submit.h"
>  #include "xe_map.h"
> @@ -1419,10 +1419,6 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  		ret = xe_guc_tlb_invalidation_done_handler(guc, payload,
>  							   adj_len);
>  		break;
> -	case XE_GUC_ACTION_ACCESS_COUNTER_NOTIFY:
> -		ret = xe_guc_access_counter_notify_handler(guc, payload,
> -							   adj_len);
> -		break;
>  	case XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF:
>  		ret = xe_guc_relay_process_guc2pf(&guc->relay, hxg, hxg_len);
>  		break;
> diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> new file mode 100644
> index 000000000000..0aa069d2a581
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> @@ -0,0 +1,94 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "abi/guc_actions_abi.h"
> +#include "xe_guc.h"
> +#include "xe_guc_ct.h"
> +#include "xe_guc_pagefault.h"
> +#include "xe_pagefault.h"
> +
> +static void guc_ack_fault(struct xe_pagefault *pf, int err)
> +{
> +	u32 vfid = FIELD_GET(PFD_VFID, pf->producer.msg[2]);
> +	u32 engine_instance = FIELD_GET(PFD_ENG_INSTANCE, pf->producer.msg[0]);
> +	u32 engine_class = FIELD_GET(PFD_ENG_CLASS, pf->producer.msg[0]);
> +	u32 pdata = FIELD_GET(PFD_PDATA_LO, pf->producer.msg[0]) |
> +		(FIELD_GET(PFD_PDATA_HI, pf->producer.msg[1]) <<
> +		 PFD_PDATA_HI_SHIFT);
> +	u32 action[] = {
> +		XE_GUC_ACTION_PAGE_FAULT_RES_DESC,
> +
> +		FIELD_PREP(PFR_VALID, 1) |
> +		FIELD_PREP(PFR_SUCCESS, !!err) |
> +		FIELD_PREP(PFR_REPLY, PFR_ACCESS) |
> +		FIELD_PREP(PFR_DESC_TYPE, FAULT_RESPONSE_DESC) |
> +		FIELD_PREP(PFR_ASID, pf->consumer.asid),
> +
> +		FIELD_PREP(PFR_VFID, vfid) |
> +		FIELD_PREP(PFR_ENG_INSTANCE, engine_instance) |
> +		FIELD_PREP(PFR_ENG_CLASS, engine_class) |
> +		FIELD_PREP(PFR_PDATA, pdata),
> +	};
> +	struct xe_guc *guc = pf->producer.private;
> +
> +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> +}
> +
> +static const struct xe_pagefault_ops guc_pagefault_ops = {
> +	.ack_fault = guc_ack_fault,
> +};
> +
> +/**
> + * xe_guc_pagefault_handler() - G2H page fault handler
> + * @guc: GuC object
> + * @msg: G2H message
> + * @len: Length of G2H message
> + *
> + * Parse GuC to host (G2H) message into a struct xe_pagefault and forward onto
> + * the Xe page fault layer.
> + *
> + * Return: 0 on success, errno on failure
> + */
> +int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
> +{
> +	struct xe_pagefault pf;
> +	int i;
> +
> +#define GUC_PF_MSG_LEN_DW	\
> +	(sizeof(struct xe_guc_pagefault_desc) / sizeof(u32))
> +
> +	BUILD_BUG_ON(GUC_PF_MSG_LEN_DW > XE_PAGEFAULT_PRODUCER_MSG_LEN_DW);
> +
> +	if (len != GUC_PF_MSG_LEN_DW)
> +		return -EPROTO;
> +
> +	pf.gt = guc_to_gt(guc);
> +
> +	/*
> +	 * XXX: These values happen to match the enum in xe_pagefault_types.h.
> +	 * If that changes, we’ll need to remap them here.
> +	 */
> +	pf.consumer.page_addr = (u64)(FIELD_GET(PFD_VIRTUAL_ADDR_HI, msg[3])
> +				      << PFD_VIRTUAL_ADDR_HI_SHIFT) |
> +		(FIELD_GET(PFD_VIRTUAL_ADDR_LO, msg[2]) <<
> +		 PFD_VIRTUAL_ADDR_LO_SHIFT);
> +	pf.consumer.asid = FIELD_GET(PFD_ASID, msg[1]);
> +	pf.consumer.access_type = FIELD_GET(PFD_ACCESS_TYPE, msg[2]);;
> +	pf.consumer.fault_type = FIELD_GET(PFD_FAULT_TYPE, msg[2]);
> +	if (FIELD_GET(XE2_PFD_TRVA_FAULT, msg[0]))
> +		pf.consumer.fault_level = XE_PAGEFAULT_LEVEL_NACK;
> +	else
> +		pf.consumer.fault_level = FIELD_GET(PFD_FAULT_LEVEL, msg[0]);
> +	pf.consumer.engine_class = FIELD_GET(PFD_ENG_CLASS, msg[0]);
> +
> +	pf.producer.private = guc;
> +	pf.producer.ops = &guc_pagefault_ops;
> +	for (i = 0; i < GUC_PF_MSG_LEN_DW; ++i)
> +		pf.producer.msg[i] = msg[i];
> +
> +#undef GUC_PF_MSG_LEN_DW
> +
> +	return xe_pagefault_handler(guc_to_xe(guc), &pf);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.h b/drivers/gpu/drm/xe/xe_guc_pagefault.h
> new file mode 100644
> index 000000000000..0723f57b8ea9
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_GUC_PAGEFAULT_H_
> +#define _XE_GUC_PAGEFAULT_H_
> +
> +#include <linux/types.h>

For this to compile we are missing:

    struct xe_guc;

Francois

> +
> +int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 10c8a1bcb86e..1bcf3ba3b350 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -109,8 +109,7 @@ xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
>  			      &vm->svm.garbage_collector.range_list);
>  	spin_unlock(&vm->svm.garbage_collector.lock);
>  
> -	queue_work(xe_device_get_root_tile(xe)->primary_gt->usm.pf_wq,
> -		   &vm->svm.garbage_collector.work);
> +	queue_work(xe->usm.pf_wq, &vm->svm.garbage_collector.work);
>  }
>  
>  static u8
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 432ea325677d..c9ae13c32117 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -27,7 +27,6 @@
>  #include "xe_device.h"
>  #include "xe_drm_client.h"
>  #include "xe_exec_queue.h"
> -#include "xe_gt_pagefault.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_migrate.h"
>  #include "xe_pat.h"
> -- 
> 2.34.1
> 
