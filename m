Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7308CCD1BF
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 19:51:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B38810E223;
	Fri, 24 Oct 2025 19:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i75Xuxf0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B7E10E223
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 19:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761335505; x=1792871505;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=cyP0MUssE0RjY7wPahKBsGetTdd0oAv7JHYTzmGtChE=;
 b=i75Xuxf00swYCYN+byZ+swIgEi7RsjS9FHkKy+JwEwOscSYuwI21HKJg
 izSnlZdYNggEYW5PASHSE16c+3FXKWjE7PxUapCGlRN6ci3/j/xLWvYGb
 wI2tDZxxozD7YSZu3lnjKI9easkbuFc3IjqKO4PuHx9wGWKMdlvC1m7Og
 QB252t7c529XJhmWRW5yCFmfc48VqcqPlr9HW3Xsjmpr6kejZjUXCKJk+
 ghTbFg2Vtvt9TczQRF1ip8BQyaCukeP+TVyDDgXGoWq4mmkFnlaa3Xd/l
 jr5RsdX/H+4Z+Y9+3XDIGAuVXXy9GFtykrMMLnA2f25Sp6uxzSQcCC0Tm A==;
X-CSE-ConnectionGUID: i99bc2NqRIeVOZuE7osb/A==
X-CSE-MsgGUID: C/+IXO32SNes2FIiThq6vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81148378"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="81148378"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 12:51:44 -0700
X-CSE-ConnectionGUID: S/t3ey04RyC0hen4w8FY5Q==
X-CSE-MsgGUID: 3k6k/AyaSIiVCoX5zJafKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="221713612"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 12:51:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 12:51:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 12:51:43 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.2) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 12:51:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z8Q1zAKRutW1/9Cx3u6+KA+xIC5h8ZSTSS93g23GWhmyWf86G/RGbHglo62m/yS10aAtt78NYBihicCuRb/4UWPsWqsji+0s48+edVE2BNj+OEqar9iiRb/au/a/vDB/kHmcW8sw5AcwoKT8pBwutl4HT6Vi+l/cMFhk4XyU8Q4WMPYCd9n+dvcyXG/CB2he6bL/a4ZJ7OwusiecOKkQ6UArJJKTQIaB9a3qUPm73HakJXBecjamslDRV93Z6OyTYdCWyBoxiz3hKjg73D/hJnbA3Yyeu8ld4Aear8IuLkF4doBAx62VXsS9xO0aWRoY3q5Q/jSn2rwrt4Wm6S4MDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y5RsG2gsCFm47THNjNRY30NYYeIG4OAPMlgnmvqMG/c=;
 b=Pyj8RP3/lf1ESSi4Sx2OCYvZw5Z7a86Fu94v+oHsL1VikUfViCm/WY2i8eopYyGKj35wl0FZaJGzW1wGm+q05WPDiZm1xFh2ZUTWrV/UX1gBIbNlawhy2nS4LvtorQ6wpYJNuuMsUaNU9IV8ynboqlnyhdfJ7RZsqzCItddV/DFy2YhzExzldSxfvOOFPecDHqeRycPk6PmYIH30ZFMBFaeWOz3X60x6RRgC9eMMc1QuHhYicvmH1kP4zRz8Y/ezIf/Y9RPl7jWiBq/mmx/mKwP7V8AdJCnxERuGKMIsKU8R6UevZ+ROdbOgNgKx+cTLTLRxG2W34cbffOU1+txW5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ0PR11MB6669.namprd11.prod.outlook.com (2603:10b6:a03:449::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 19:51:41 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 19:51:41 +0000
Date: Fri, 24 Oct 2025 15:51:39 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Lucas De
 Marchi" <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 13/14] drm/xe/pf: Allow to stop and reset VF using sysfs
Message-ID: <aPvYy5EH7KOYlqen@intel.com>
References: <20251020182414.576-1-michal.wajdeczko@intel.com>
 <20251020182414.576-14-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251020182414.576-14-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY5PR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::35) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ0PR11MB6669:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ec1407b-ad86-47f6-4b7c-08de1336c0bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmJKZEJzTFM0Tk41b01sZzZpdmMzekJ5NFQzZnNNMmpoQVpPQkJNT0hWczVj?=
 =?utf-8?B?RzhZbXZ2amxZR2MzQmZXaE84OXVDaE9zZ2VHMmxnYlhnVUxQQ2N0R0xweDUv?=
 =?utf-8?B?eUxDZ3hXZUJzR3VyZ0FtYmQyZUxxMzJIRS9rd0hqeVRZUDRQc2VSUlZSOFRB?=
 =?utf-8?B?ZVBROUJOeks4cStNNlVLTDdaRURwYmVvN0x0VEhaRWdNeHFxZW9JVnR1Nlla?=
 =?utf-8?B?WEFpNjNRYStkc0J4elZkQjVFYUxwUmFtRUNGM1ZNVFdlZWNUZnBTUDJkNlFM?=
 =?utf-8?B?V0JwU0hDOVNJOG83S2tUcVh3UStKMkV5SkQyS1JLR2VENnA2U0dQMzBQMnpE?=
 =?utf-8?B?RndrRHFublViYnlpN20wNWJTNlNEeFQxYkFJNlFHNXAzcFBFaTNFNTgwM1o3?=
 =?utf-8?B?SXJmT3VtZmoxTzBMQ2V6djBmbEhmTUJ3a2RqRVVLbUtSWFU3STZkMC8wemFR?=
 =?utf-8?B?OVFZaG5rYTNWREc0cGhUekMvVlBPblZWa1hEYkRCWWlKNmhQSnNabWhBbmto?=
 =?utf-8?B?Qnc0Z0JYa1dxRjRwUlpRTGNIdU5zaTZKOGtxS3RrL0oyT0ZPVFgydUM3NXQ1?=
 =?utf-8?B?ZE1pOTFwQjBtZ1FKT0VPZEFoczNtQjZjeVZUY2V5NzVCT0UxcExGM0dyNHhD?=
 =?utf-8?B?OGQzc05uc21neENjam1rYUVFWUlJVnhrczVRNGxvQlRrbFJQYXZtUE5tS3o1?=
 =?utf-8?B?YStWSDlWclFQTFhOcFkvK28rOHdPQXFvVkV1NVA0VFc2Uk1pUUZBc1pmYlpr?=
 =?utf-8?B?WVBTUUQvVWFubGhsSEsycmJCaVozL1l3dWQ2VjNrNGpKRVdGeC9GRkFaQTl5?=
 =?utf-8?B?MU9oYnJxK291NDJZd25jaVJYa0hMcEE1Y3N4RXBQa3kvRG5iUWRJTjlMOVFW?=
 =?utf-8?B?eU43TTl0OGxZSzZWOU5tVGh6blJyTnFoWnVibVdWTUNYZ0pRK25mOUtQL3V4?=
 =?utf-8?B?Y3pHanhFczM2UUYxVi9RNU5lRDE0eTY3L0ZibTkyVHIvOHlGQlhlQ0E1OFF1?=
 =?utf-8?B?aWJHdUpva0MrdTRPUnNGbWVldklpREIyYkdid293NXZodCtaQXJPWXJxK0N2?=
 =?utf-8?B?VFg1T2RpTkhra2Z6c2FZemlNeEZjMEEyNUhwU1RDbzJqK0JoQWdPZGFFTkVr?=
 =?utf-8?B?WmRyRnp1dEkyNi9PcGljajE1UFljRlZYd1JtbFNFc1JQUUZXMnlmMWRlWEkz?=
 =?utf-8?B?VS9TaUpodHhmM0F4R0ZOTEw1c1kxa1NCS2hacTFOMWVaN3pKeFFDckR6L2Ns?=
 =?utf-8?B?TEhlbmVzZEhkbzRPb3NteER3bnpra1BOdDhPMW8vNUlNNS82bW14akcydVl0?=
 =?utf-8?B?dkMrYXRHanBPVWduOS9vYlVUNjlIWWVkKzE5aVJDMGR5ZFNGWGdIT0tVQ1Q2?=
 =?utf-8?B?L0VvYkY2NVpkSUp6bUtWQ0hyNTBTQkE5bE10NGo2d2pNZGIxWlRjZVVpREw1?=
 =?utf-8?B?M1JLa1RlRzZ5OWdvSWR4WndYN1NhOG55N0FsMVVpWkhXdTFOaWF1ZXZNeU5J?=
 =?utf-8?B?am1CVVVkMjdxa3dZY2lsdHpNaEFlVVIzSGxPekZRc2paTk54OFlNVWtTN1FP?=
 =?utf-8?B?NmFuUHp5cnBWWkhkdWtCM3FMZlRGdWxiNHZ1d1ZxVGF3OEVMaXByOStKSzds?=
 =?utf-8?B?WTErNTV1RFVWMHZSM1VDaGg1WDliZzNkb2d5RVFMdjRGYzZqc2lxWXpFQ3V4?=
 =?utf-8?B?TUc5Wlh2Z2lZNG02T2NXWkt1WTgzcVJGbjdOTkpwMmJiRUl4Skd4Y3BGdzUr?=
 =?utf-8?B?NHVnbGNMVmNzY0RtaU1DMC9wNWQwcjZlbkQ4bmNUZnQwcjBBclQwWkI3dDNq?=
 =?utf-8?B?NjVFeitEY1ljdHRXbEtoUXBLWFlZdTdHdGpNZVNZUU1FRmtaaE5ubnNTd3h0?=
 =?utf-8?B?QTZyMVJLcjRBeVlCUm5od3NhV0hDVE53dTFlSnZrbWc0UDlQcGxjOTB0emE4?=
 =?utf-8?Q?cH6S9lrrD1U4vCef7hF8OMpc3+fA+wLe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzFudklvRGsxYUphL1U1WTQ3azJ0UTZJYWpoNGNobVRZT1NHOGFCdWxxa2du?=
 =?utf-8?B?NTRLY09aUjNBcXNCcjQ1U05NdW5SUklwNlNHR1Z0Qkp1YmFKckZHUi84YVVY?=
 =?utf-8?B?ZWZzb0xteS9ldlRNaVFBQ3Z3SmVNYUh5eGc3M0VoVHl3bU5hWklkTEt6T1cy?=
 =?utf-8?B?SHkzajlneUNEZXVFUThMM1pEQnZYcWlVTWxEbkREZ2MzL0RlRHVVUVM1dVVR?=
 =?utf-8?B?d1dhUUlUVkRZMFRmMDN2NFNmckpDZDBYMnZpTy9RQTN6SGN3SGRyaHdvODlP?=
 =?utf-8?B?NitBSlBvVWZGNnpGSWwzNWRhdnI2Tm80YjRVTUwrQWZhWVNnUkFkdkJIb3VN?=
 =?utf-8?B?K09wOStqWFcwbm1pWWV6c2pDN1RqeFgvcWRhMWQxVGZPck5Vdkw5WXlseWtk?=
 =?utf-8?B?YjVTVzZKMVFvTmN3Tyt6Yldad3RYVXNsZ2xqMXdudkg0ZkFrQ2F6TzEvNWFV?=
 =?utf-8?B?ZHNMaU1YSWdzN3NIOC9QWGE5ZEk0R3FhdVRwMkVoZHp3bDVrdDVmOVN0QzhQ?=
 =?utf-8?B?dGk5U292VnQxb1hkNmxNRXJoNUxxY3VFUWV2VXVPVjBsYVpoRDk3S01HK25X?=
 =?utf-8?B?c0xFaCtLR1FKNXRtcFkydmxkWVUvZmt2TTlMbU05K0FXbjNkRmxuN3RMazRI?=
 =?utf-8?B?WTFveG0rNzZnbFZjSVhRY0Y2MG9OQk8zUi9YZ1E5MXo5OWZLcXhqOWdweTZJ?=
 =?utf-8?B?YnZGTHhGRDlTeVlWOXNZS3NUa1o4WHFxOEpUZzhXN1I4bStVWGhoK2lRN0ZE?=
 =?utf-8?B?MWhkTTdsVHdqT1RYZ1VkQzJyTU5DaXMyeGRjNmxrTndhZTJGQWUweDVXdjR2?=
 =?utf-8?B?VVhudTE3cS9RbnhUSmtGNWE5bXZ6OXpTMU0xelVTaVQyUFZUV0pBZE9HVDNi?=
 =?utf-8?B?Rm54bmVjMG4yZzdBOElnRDEyL1JqVDlFd0twSWpkWnlJVmlGRExzRlBrSjFI?=
 =?utf-8?B?dkI4bFdZUnFaNmdCTkZBdnZOVlhoaEF2STVjc05HcSsyMFgybzdRbkQ1am5a?=
 =?utf-8?B?ZkpVVXJ5dk5EdWdLOTNVS3VwWG1hTjlvejBEM09ZbGt2VUVoSGxQOGlxWG5h?=
 =?utf-8?B?VEFLZ0F2ZFA2Vm9kbmpReFBmbmM3TXg1L2pKRUE4bEhMNU51UER0YmQzYzZt?=
 =?utf-8?B?R1dHMFBybW5Db3JrWnFTdC9hc1NOOU1FakpkL21xZHBSdlNUVkJFNFU0UHJa?=
 =?utf-8?B?a0hHM3YwU05XQU1zRklpU1FHR1BQbVpHbGRvMlp5cXRjTTd3YzZ3VXdJZkdo?=
 =?utf-8?B?K0dOcTBGM2EvSVYxYXJleHJwb3BENEdRMXFPT3M1WTdmVnkzTHZiUitTeXNC?=
 =?utf-8?B?TGtJeUVPZ0FYd0dDek9SSGlucFE4aUtJV2RsWEhycUx6U1FTckxielVRZVZU?=
 =?utf-8?B?cjl5TDBIcmVINEY4ZU5kL1ZOVlFOV01Ga2prRmdkOEEvY1JidFFvZWNkMy9x?=
 =?utf-8?B?TkhoYjBQSlhYY2NQM0JaWExQQ0llbVVDRzY4K296N0ZZb2gzVHRiTTRrZTNW?=
 =?utf-8?B?amdkSUJKNm1qSE5BVWZtM2FuZjVvelNKTEt1aE1LbWNSajNYdFovM253YWQ4?=
 =?utf-8?B?UkQ1U0Y0c1VTNXdWMGVYOUNXd01jMWc2Zk9XL0g1VmE4Z2VKY1V3RjQxZW55?=
 =?utf-8?B?ZWVVbE9kRERPYkFXMi91VDJ2SHRtcStBbktPU01xZmdQQW1MbWN1eHBwS1d4?=
 =?utf-8?B?YW0rbnFCSm5UaHY5UXlnSHdLV0dVbnNGL25CVkhRYlVaTllweVZSakhGMEJn?=
 =?utf-8?B?dkRYYUtmU0JhUTRONGlDODF6NnFtODVRbHl5RmIraUpxd1V3ODQ3WlJRTjVT?=
 =?utf-8?B?NjZtcmUvM2l0OU4vQUwrTTJLZVZyY3NIajNjR2VDbWdtK2xyR05ndStpTzZN?=
 =?utf-8?B?akhvMzNYQVFwNzJEcUR0TFFjUFNlRCtGTUV2RU1UNDI0dUtNR2x6blhsZXVB?=
 =?utf-8?B?N3ZFRGtHaDB6OGpyY3psdzk0SWxtcHgzemFsbVZUT08rWWQrdkxZWVVBMkRU?=
 =?utf-8?B?WDRmMUxFR1ZrNUoyazUrdCtLc2JnOXVFeENucVBwdGJEVUVMdnlIcHJsZXRr?=
 =?utf-8?B?bDJJb2U1NXRDWG1JaGRHdkpNd2h2Z0d4Qnh0WllDRXoxOW1TZk1wUGRNVDFH?=
 =?utf-8?B?OXAzcnByd1RjajRqUERpMDBGQUhjaDI3NUNwQ3gxUktGcTkrYTBwV1BlSm8z?=
 =?utf-8?B?OWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec1407b-ad86-47f6-4b7c-08de1336c0bb
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 19:51:41.7552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YdkvQIfXQgQDtjaB9RAkYAwDr2HpwxJepSqxOVtu2UKNLoqNEmDehU+yXoO5YUtXuZWPRVBz+NX9ElvXNZ/akg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6669
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

On Mon, Oct 20, 2025 at 08:24:13PM +0200, Michal Wajdeczko wrote:
> It is expected that VFs activity will be monitored and in some
> cases admin might want to silence specific VF without killing
> the VM where it was attached.
> 
> Add write-only attributes to control GuC scheduling at VF level.
> 
>   /sys/bus/pci/drivers/xe/BDF/
>   ├── sriov_admin/
>       ├── vf1/
>       │   ├── reset		[WO] bool

This reset is the only thing in this series that I'm not 100% comfortable.
in the device symlink you already have the reset that does the right thing.

If I understood correctly this one here has the same behavior, but with
slightly different path... bypassing the pci subsystem.

I understand that your goal is to have it near the stop since you have to
stop and then reset. But It is still a bit strange.

If you get our only PF FLR supported case, we do need to unbind the driver
before echo 1 > /sys/../device/reset  and still the unbind is not a file
near the the reset.

So we can perhaps live without this double reset here.

Although not a big blocker from my side....

Lucas, Thomas, thoughts?

>       │   └── stop		[WO] bool
>       ├── vf2/
>       │   ├── reset		[WO] bool
>       │   └── stop		[WO] bool
> 
> Writing "1" or "y" (or whatever is recognized by the strtobool()
> function) to these files will trigger the change of the VF state
> to STOP (GuC will stop servicing the VF) or back to READY (GuC
> will start servicing this VF again but after completing the full
> sequence of the software initiated VF FLR).
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c | 52 ++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> index c68acf6cd34f..f872013313c1 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> @@ -13,6 +13,7 @@
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf.h"
> +#include "xe_sriov_pf_control.h"
>  #include "xe_sriov_pf_helpers.h"
>  #include "xe_sriov_pf_provision.h"
>  #include "xe_sriov_pf_sysfs.h"
> @@ -52,6 +53,8 @@ static int emit_choice(char *buf, int choice, const char * const *array, size_t
>   *     ├── vf1/
>   *     │   ├── ...
>   *     │   ├── device -> ../../../BDF.1
> + *     │   ├── reset
> + *     │   ├── stop
>   *     │   └── profile
>   *     │       ├── exec_quantum_ms
>   *     │       ├── preempt_timeout_us
> @@ -291,8 +294,57 @@ static const struct attribute_group profile_vf_attr_group = {
>  	.is_visible = profile_vf_attr_is_visible,
>  };
>  
> +#define DEFINE_SIMPLE_CONTROL_SRIOV_VF_ATTR(NAME)					\
> +											\
> +static ssize_t xe_sriov_vf_attr_##NAME##_store(struct xe_device *xe, unsigned int vfid,	\
> +					       const char *buf, size_t count)		\
> +{											\
> +	bool yes;									\
> +	int err;									\
> +											\
> +	if (!vfid)									\
> +		return -EPERM;								\
> +											\
> +	err = kstrtobool(buf, &yes);							\
> +	if (err)									\
> +		return err;								\
> +	if (!yes)									\
> +		return count;								\
> +											\
> +	err = xe_sriov_pf_control_##NAME##_vf(xe, vfid);				\
> +	return err ?: count;								\
> +}											\
> +											\
> +static XE_SRIOV_VF_ATTR_WO(NAME)
> +
> +DEFINE_SIMPLE_CONTROL_SRIOV_VF_ATTR(stop);
> +DEFINE_SIMPLE_CONTROL_SRIOV_VF_ATTR(reset);
> +
> +static struct attribute *control_vf_attrs[] = {
> +	&xe_sriov_vf_attr_stop.attr,
> +	&xe_sriov_vf_attr_reset.attr,
> +	NULL
> +};
> +
> +static umode_t control_vf_attr_is_visible(struct kobject *kobj,
> +					  struct attribute *attr, int index)
> +{
> +	struct xe_sriov_kobj *vkobj = to_xe_sriov_kobj(kobj);
> +
> +	if (vkobj->vfid == PFID)
> +		return 0;
> +
> +	return attr->mode;
> +}
> +
> +static const struct attribute_group control_vf_attr_group = {
> +	.attrs = control_vf_attrs,
> +	.is_visible = control_vf_attr_is_visible,
> +};
> +
>  static const struct attribute_group *xe_sriov_vf_attr_groups[] = {
>  	&profile_vf_attr_group,
> +	&control_vf_attr_group,
>  	NULL
>  };
>  
> -- 
> 2.47.1
> 
