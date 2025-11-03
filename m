Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15ECECCF9E3
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 01:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB8410E282;
	Mon,  3 Nov 2025 01:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ffBOZH0o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A0110E282
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 01:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762133156; x=1793669156;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=G9TxfaIqNfcJtZ9tFLvyvqRIE8Fn+ynlVFnKStdtvyg=;
 b=ffBOZH0opOAmC89kLhMI8fJB0SLc8TrByZD3NgC7zwvVW3ti2LVrjm2x
 fOYx9dEKtdn4kkS+VHkc50kdY7HDC6i5BWzqYwG3/dR0V/K9gR6rgwNb3
 N0uv8wHo27Pw+9kJV4D89sBvKI/+BYPCd2slkPB906h/1qgEWadGmpgKU
 K/CPCF5YcqAHcWcJbClN1YcbyFHunqE9UmsjaGX8fJQo1ktVi68D7ctWa
 fNGGPmz3Kq7c6PHFtyU/PVi8xBaxxqnlSq5yAeVsyI1PEAEg5ts8wxaUt
 s0gAozVisH3R5dDqTLhmrmwp3abYHHaErtbFeaAlODIjwjee6x4XFsIcY A==;
X-CSE-ConnectionGUID: RzJNSwJ8QautbTFO3gP+vg==
X-CSE-MsgGUID: JKzM4V8hQkyZS8/5K+Vizw==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="86831440"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="86831440"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2025 17:25:56 -0800
X-CSE-ConnectionGUID: 3ZBLCeHETme+KOu4HrP8GQ==
X-CSE-MsgGUID: UzLcCM4HQjK7V6YZa3gD1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="191076800"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2025 17:25:55 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 2 Nov 2025 17:25:55 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 2 Nov 2025 17:25:55 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.62)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 2 Nov 2025 17:25:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ArrLffMRd75/pSb7/1oTfqm5Pc3zNRedg+YSFbDrzyUoyaANeKOlj+jhrv/7qGhQO5XbWhvHMRBzjh8JCs2kCTrAWYcWCg/qpyZAcdVvYi1uALQCEmdqSUdQ/ZIi3QuiHoCdBQ8c8r8Nsixie6nDLMNw+ZVEApsVSwbMHVGJ/vgGHDOsATEJEjgK6rvxKh29p1Qoki37ZIcY/rsuoRbTCl54FH06vOrIKPxifCvrCk/kXVQnSKZluVOPA4xRrywS205DfA4aPrTHn3+MWf/Z52zF2yIFeEzEXqMLqAqxva/Q1K6Tnlm/ChTMgkiMGsHb4bR8mgLhbcI1dv/9isgD7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=04lzy7eCJ3dYUUVwaQGce6w//k9/jxOOVEhf0lwMS0A=;
 b=Rrg48VPXM1DlnuuF5mMEJkHbuZj+wlEkr7Qp4wFqdfKZHEh2qiMasD1mPrWZmgWGTFrSZxLP/Us7jX6Qa3XfliPeFBR+lyGusWu3LIN/MxNomOlXj2XfNIyGf0aqn/tSZJUZcytyYgDCOYpJzW8iaKVDaMPlbs4SK0Be+ou01U7bA0bGjpki0F3godwRUsHmCOm5bQ7pZuKqym6P72JhNG+MR7AFWE4xMSDIWNpUAlZbCSSAqY8RdcWLoQ5zUeDZbsQtD/yt6LVWxHW0CJb8glP7oARbqA8Hn+FfKt3HbPmfCcGjgBSfT+MjsGOrJ/DwO0vJMNfR8D0an0NqsVwE1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by DS4PPF2AD6B04BA.namprd11.prod.outlook.com (2603:10b6:f:fc02::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 01:25:52 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 01:25:52 +0000
Date: Sun, 2 Nov 2025 17:25:49 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 01/16] drm/xe/multi_queue: Add multi_queue_enable_mask to
 gt information
Message-ID: <aQgEneb2u4UpgX86@nvishwa1-desk>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-2-niranjana.vishwanathapura@intel.com>
 <aQafaLieY4yC/55s@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aQafaLieY4yC/55s@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BYAPR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::20) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|DS4PPF2AD6B04BA:EE_
X-MS-Office365-Filtering-Correlation-Id: d3bbfb2e-76bf-4ec6-aab4-08de1a77ed9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bKqZvjmDczLD5yWLtMsppnDsDOM9FmlDfepm/BU3mtFKavU0vdTjDT/tKDaX?=
 =?us-ascii?Q?Bsw31viQ5AQm3I3PYUKqTh9jI9jnws+s3My4Iq/GpT0qfGhZk+8Egx+jFj5B?=
 =?us-ascii?Q?KM4l69o0246BLCaF2NfSOCx8mbYlupIBWitmBXF1g3IiAUQtrRJGsUbfRczU?=
 =?us-ascii?Q?bijg7rNOJLjPvsYKiymLeNG1P0PnsWhT1brrW1+vrNLbdplZAoq0umDMrmcE?=
 =?us-ascii?Q?Eb7buMR3tm31o1qpNHPYviZgKPaUxiQ9LtlSkQVesA5Q8YOWom5TRPmVEIAM?=
 =?us-ascii?Q?zr+Djls/JcfsTucKBjB9WqJytdme4mjB36j1WsvxQxbYPlv1Moer4yCMCW30?=
 =?us-ascii?Q?yoSaF7Z05GCRUDwbfE8nN7IR96MGfp2E3AJZl5xBCZk0cay1nxbVEqBs++ge?=
 =?us-ascii?Q?y60fk5MKwJT8+hsrA8qHRpx7WVa6C30GJ13X8y2ePacIbhIRqsP2Q5Fa++48?=
 =?us-ascii?Q?fdBxyLfKkLCLygu3FTcE7NHsOlwiYOWFNW6ylDwChcDOIcagTT5pCT9RLnFj?=
 =?us-ascii?Q?szdPlG5YJ7Ebu7GCjw7UEYlSKq8DeGg0KOAC1vMqk5WN8/UduZ476p4hfgOl?=
 =?us-ascii?Q?jAhaTfkRFp0Xx6JntiCAWS/41yQED9qzGvOXG2FJ4iHrV+E9UdXRr8OHmMEW?=
 =?us-ascii?Q?Y72wpcyI6mI13btFekxzIVxK1+LYvLKdkndds1YMBCgiJ9H/9c9qURiJRBj8?=
 =?us-ascii?Q?nZ9ZEPvnFMWjashCFIXViqfjzE0SgpUuGrDVYtRGx0T1rNje9HejgUKp5GwP?=
 =?us-ascii?Q?3HTtcXOoIELlBT9FFwgp/4IxQ5TCG97fjkci9qaUQVy2sR9E3q80XggHQfj9?=
 =?us-ascii?Q?wvXwAVEKbJ05jEjw5wZP9epsz2AzdLW7OwgI7rdYUlDGVrpfstmER8n7gsvg?=
 =?us-ascii?Q?9646bIBrm3oq+U/30jEhvMTQnMCp2knUecKxYx2hCdI2jR0UknBJJ6eOKfdA?=
 =?us-ascii?Q?bev1MkWoe4yG8GboR5ha95s3S9vLTizk2axmkmzkURUswTcCuZpy4dxcltKL?=
 =?us-ascii?Q?+S2cUjZmMocRMgJThqrudTO2OJ3b85Pb9jkyIXqxScVqmoyg60RIUMR+mPLF?=
 =?us-ascii?Q?X9rTOmc25OoUzJyMAaobv5F4G4RNKZ0aBXZY0sOcaUfkrCOtWucXwCdRdyMj?=
 =?us-ascii?Q?EIazmlS5GxCxaHRnsxChNFKLcT9TWnCN5dZAp33WDctCZKsbzbveuIZRWzgy?=
 =?us-ascii?Q?lQdFJSjcWB1f19kx9Jk+UV/9rkPvTK4mhjAlAsODEOucaUAgAUMDfuIrhyL/?=
 =?us-ascii?Q?NNFswgfBw2RXU7HmBwwW+93ml7otmKYhYtU7X9oAIydh7QrPpSt+vU6y9muv?=
 =?us-ascii?Q?CA0+zH5PFTpaXbmrvTC9RvaKOgVAGvHD4xVksKYCUXyD/vdn69pbcMMQn3np?=
 =?us-ascii?Q?iFxmSB2ViOx0bSISpzHJIndK4k2aEDvmlghNz1PENTw7DX49eu5dJ1I2JfYD?=
 =?us-ascii?Q?Baq7AfWxLtNUe7k8yX6Pu7KG1hDisX5I?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rLyYGUp/dVEbCmoAMaCcWWYnPY/HwvGsG/X+DGkv/mAEgEi4+BLIXWQgmdRQ?=
 =?us-ascii?Q?WKNx57ZnFR/bGf3r0e/2IMvtwoOMslluHsxM9xqf5u/rzbuZOf2hpT6bhCy7?=
 =?us-ascii?Q?d8xEf1/ot5Ayo023y/pcDOFlGGJFh99RrV721fzSQeYHDkvHO0GTrN+esK8A?=
 =?us-ascii?Q?JqlyNRN68S4AfxQt/nLN0OKELi7Yq+uVnFaquLWoQ2Vx+1FwFUJ4pqbdh887?=
 =?us-ascii?Q?Vb4RrAXYefcYaIIpF7YKuzl9gDJwjuUuLuonFd0EUL8qdLDu1MIvNxER+ehR?=
 =?us-ascii?Q?VsmhDqDakxC43GeY58e/ZxZK6lg/Gm60M2gilB5EWFVyXi5FHERfM1Kn6LHU?=
 =?us-ascii?Q?m+9uwFvC6W8fBGfGaXZh02M+AIgOw6GfZay9S940msb+QakELQ0cGhuwZPs4?=
 =?us-ascii?Q?KajSRoXgeD4vVMeweRcKBX43MDL3NTrg4OY1Gsshy63OgxlQ+dOdO5Xk0Q/J?=
 =?us-ascii?Q?EGraIfv67TyAnTlIC1uiSi+xWV2T9yfUq51sbCw+KImyOhsVn1OzVBU/yhxj?=
 =?us-ascii?Q?t9eI9kxY1Q6kXxq2aXeBPQuMNlj+Btaia0P+QaxtRwIkmQimy9M8Jhd9SaH+?=
 =?us-ascii?Q?zAYpCUYZXtylHbb/I+ucv3dSyFQMchJm1HKxP3AFuOibVmlx2nbV7nDJgfpz?=
 =?us-ascii?Q?PZ8xei9MFzy8eI8AYREE1X6iFM4ersITn76+uuPVlJDNRhLqjoVcfZJOJynC?=
 =?us-ascii?Q?d4L9Kng9IGloaBKDZjEyaTVuX3f7REnWhrAVrF0AVGYgZOo6SosiF7t1lnLv?=
 =?us-ascii?Q?D0WIXgzGQdyCTCooJymAknPo9LCIK5+0y2NIu5rylOjYknnv20FWdvhuBCPE?=
 =?us-ascii?Q?6n4JXFWSGh88uc/nkrY+8kWL9/yN03raHU1R5/MXH+W2YsbR5jrv/XSC4fA8?=
 =?us-ascii?Q?aGDfYKUgp78c04eLQK0UV3VmryKvA7OUlZAiNWjpfA7r9KtFt8t4+wz5N13b?=
 =?us-ascii?Q?GRgEINCQCtfrOX1xaNKSNSrkR/NRPrAevCmj4hhWCjGy2m8ctTs6r3pytHoz?=
 =?us-ascii?Q?v73hGMUsuEMU2g//saonyzxAHsGhAlYemehR0/Df7t+iIba1Q5shAzJKWu4w?=
 =?us-ascii?Q?6DjnW347B4vEUuwOdHe+d8jdWl+dlVEOcC6o0/7oenbeVg3Zfl3Ia4FUTozA?=
 =?us-ascii?Q?2ftmBPJxLWjYybIR6B6Uj/assuR9TD/UMGxvs8GK282fjKGYcP+u5dHtWKl3?=
 =?us-ascii?Q?GX+8MsumMnqGg9xOxv5VrgnqCSWjjwK6a9DBRGDTuyc2lJPNcMgjV6yclhiC?=
 =?us-ascii?Q?dZgsSov687bcqlAeB8J4RrtJZr/4v67CVq6d+Dt/njytAQmldvA/LQpvcpbY?=
 =?us-ascii?Q?pCpGAXpVo82WZCCGUY5V6RJCqQHpU2lT9MGNCA4HUqNtscQpEo88vYfigNSj?=
 =?us-ascii?Q?bbxYYd9m08+Z5GAzO05jh3DrJ4rglRxEKpcau21mLY0iCJw9vitTRx3My4x8?=
 =?us-ascii?Q?wL12WAA6g8nw+qfwkl8MWCW0eIfaGE9aTMG4xU0aULKg/dEuu72mfQvco236?=
 =?us-ascii?Q?Gn7/KrchQwo04gtF2aXQq7l4l1rJpD1vjIOX3LVf2B18wVqkTtDXJAD34e7p?=
 =?us-ascii?Q?QCc5NcUCfetRdlKCogxnJFeyxQ77x1SmpIvFBUJPDQPZ+iKu2kP4pzTw1Mko?=
 =?us-ascii?Q?yKsSbo9g/6PYmWCCpAqTuvw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3bbfb2e-76bf-4ec6-aab4-08de1a77ed9c
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 01:25:52.4544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QMJR2GU++q4GomnBOAcotw7YHR8dAGWa9kZJXu58ipB4ODGoVIX2rME1cpR9UOI4WiCkpaAZM6jehgRGYVgpw0Whbla7tqVpr5aTwlki2ksban+/u05AklPyg8ndxRr2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2AD6B04BA
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

On Sat, Nov 01, 2025 at 05:01:44PM -0700, Matthew Brost wrote:
>On Fri, Oct 31, 2025 at 11:29:21AM -0700, Niranjana Vishwanathapura wrote:
>> Add multi_queue_enable_mask field to the gt information structure
>> which is bitmask of all engine classes with multi queue support
>> enabled.
>>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_debugfs.c   | 2 ++
>>  drivers/gpu/drm/xe/xe_gt_types.h  | 5 +++++
>>  drivers/gpu/drm/xe/xe_pci.c       | 1 +
>>  drivers/gpu/drm/xe/xe_pci_types.h | 1 +
>>  4 files changed, 9 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
>> index e91da9589c5f..34460d7ef71c 100644
>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>> @@ -93,6 +93,8 @@ static int info(struct seq_file *m, void *data)
>>  			   xe_force_wake_ref(gt_to_fw(gt), XE_FW_GT));
>>  		drm_printf(&p, "gt%d engine_mask 0x%llx\n", id,
>>  			   gt->info.engine_mask);
>> +		drm_printf(&p, "gt%d multi_queue_enable_mask 0x%x\n", id,
>> +			   gt->info.multi_queue_enable_mask);
>>  	}
>>
>>  	xe_pm_runtime_put(xe);
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>> index 0b525643a048..4a18bf772b22 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -140,6 +140,11 @@ struct xe_gt {
>>  		u64 engine_mask;
>>  		/** @info.gmdid: raw GMD_ID value from hardware */
>>  		u32 gmdid;
>> +		/**
>> +		 * @multi_queue_enable_mask: Bitmask of engine classes with
>> +		 * multi queue support enabled.
>> +		 */
>> +		u16 multi_queue_enable_mask;
>
>s/multi_queue_enable_mask/multi_queue_class_enable_mask ?
>

Ok, will rename it as 'multi_queue_engine_class_mask'.

Niranjana

>Matt
>
>>  		/** @info.id: Unique ID of this GT within the PCI Device */
>>  		u8 id;
>>  		/** @info.has_indirect_ring_state: GT has indirect ring state support */
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 6e59642e7820..b5eaf0fc105c 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -754,6 +754,7 @@ static struct xe_gt *alloc_primary_gt(struct xe_tile *tile,
>>  	gt->info.type = XE_GT_TYPE_MAIN;
>>  	gt->info.id = tile->id * xe->info.max_gt_per_tile;
>>  	gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
>> +	gt->info.multi_queue_enable_mask = graphics_desc->multi_queue_enable_mask;
>>  	gt->info.engine_mask = graphics_desc->hw_engine_mask;
>>
>>  	/*
>> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
>> index 9892c063a9c5..77e09a53da64 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
>> @@ -58,6 +58,7 @@ struct xe_device_desc {
>>
>>  struct xe_graphics_desc {
>>  	u64 hw_engine_mask;	/* hardware engines provided by graphics IP */
>> +	u16 multi_queue_enable_mask; /* bitmask of engine classes which support multi queue */
>>
>>  	u8 has_asid:1;
>>  	u8 has_atomic_enable_pte_bit:1;
>> --
>> 2.43.0
>>
