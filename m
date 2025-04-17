Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD9EC369C9
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 20:00:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7EDE10E3AF;
	Thu, 17 Apr 2025 20:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JCYacHO4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A747C10E3AF
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 19:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744920006; x=1776456006;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XfPbXf7qHnhkZzAZ49kR8mnF9HQmLIAgu4Wguv56IIs=;
 b=JCYacHO4RBq2Q3s4Nrwkc5z3xHXse+2KSlyZm6o0knWAmeC8A8/G5yyy
 824AlgRtHMd3MRPIg0oan+iAfK3h8c/FE8zz39isijUsdqnVALFbm3+6g
 oWvm7T04jaV/wGsYTICcnOFD1TV32HHHwR7TryX1BmhvbPrS6beViBwsv
 qRxg6E0jQ+ZIser28sLcKUtd2sbol+BQw+aLAhOBKuwrodF3hoUUZdV/1
 hguxveJ8R2viUx0ksPIoHhzUrp7/TVA0GM7Xu2SEeWSpGFATQTNfEDE/T
 Gujw6txN4urX4zeAQN3fb41CFUIUjIyOVXSB9MMp1wHD+3SUYuWjMi7mq Q==;
X-CSE-ConnectionGUID: ofHu4SDXTn6W0yoiGlsETw==
X-CSE-MsgGUID: TeawhbwTQkCZS2G9GTlzaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="57199898"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="57199898"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 12:59:48 -0700
X-CSE-ConnectionGUID: ibcv69qxTQiM5paul12ytw==
X-CSE-MsgGUID: lBtSUm+dTAy4yZUEz5x33A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="135752286"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 12:59:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 12:59:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 12:59:47 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 12:59:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kfttmOv5I9t8BKOwENmRz1TICYufzHwXSFwEfFtxR5xxvprFgIqPB/MpCj0i/Fv6kXluYVcexqHeHa+Wslp8rWZ1yArVJ//Yud9zRXlCMtr14MubaNFgwowsoymysAI9EXPKiD7RdePrdZqrOyh7SCMMVNzXkgDgV3hMcs6PzFkvm9M0cpnAtxdQkmA5Wh8uRivVo7I0ubTSfGwwC8Uy2CcBflGePnqMxCB6s+VrrwOBgo1+4pwIXwKsm/QHiB62vpEjTt7elgZCawTYmbEIVVuQjR9gf7LS1ktD1radEPVvXs0zgIfqVSdY1ZKp6NlBsFenxgZep1Xrfuafg1m7+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ES9Ji+aTnv6JFhXcvAsvqH2o/YJRJZ1aswZ4lbGxi5k=;
 b=NWibfv649oA1jIwE27U6TSqsA2G7DnL9dLhvWo9lCGaxA9qGUYxfMH0Oo4zAmI0OpTjFZ/C6oZeqFR56iX3HRpxXvHBZl64tztlSldPjNBkDDpzcccRyejV1pH9bzufAq2UtVsbNncDtTbXY+UmAEqNJUwAQRJqyniEA6PukFujYTiRZ9Xz520zHCOK4FFt0a0cA3uvEWLZqAcTavD0QqG5dqW+jFwU8eTUIu9CIpcPsqDijcydtzWm1pJHoFhZOu/RwQSsrLfncFgl1hYYWl1xOV1bqaXN2B0/duV43hYtZp2JkGfy8F837j4Llew6VZMUZc/QBO3QHnCBDnepLOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH0PR11MB7421.namprd11.prod.outlook.com (2603:10b6:510:281::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 19:59:38 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%5]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 19:59:38 +0000
Message-ID: <47f69512-fc63-4b8d-bca7-83fd47e5034a@intel.com>
Date: Thu, 17 Apr 2025 12:59:35 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] drm/xe: Add devcoredump chunking
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250415183916.332202-1-matthew.brost@intel.com>
 <20250415183916.332202-2-matthew.brost@intel.com>
 <9aa30608-7a74-42de-be19-1c3c6e0a7e5c@intel.com>
 <Z/9DyT1rzA2tOEOo@lstrano-desk.jf.intel.com>
 <b0634792-f2e3-4402-8b48-58b83f773426@intel.com>
 <aAAUnDb+EqjPFQ7M@lstrano-desk.jf.intel.com>
 <0da60d60-08f9-4da8-bf8b-ad62cfe3245d@intel.com>
 <aABFjLcK7OZQ0y4x@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <aABFjLcK7OZQ0y4x@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0354.namprd03.prod.outlook.com
 (2603:10b6:303:dc::29) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH0PR11MB7421:EE_
X-MS-Office365-Filtering-Correlation-Id: 56a2d12a-8227-4afe-3ed3-08dd7dea6288
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXYwOW9rZ1AwckRDcDEzcGdxdFpueUVwQ1NYVG03Y2ZSOTBHbXJpQUhoRXd3?=
 =?utf-8?B?Z3hxT3l1bjlkcCtEUnRVQWp0ckF5WHhKT0NGYkdsUUJ1aHZTZkhFQ0xFZU9G?=
 =?utf-8?B?eUFzUFQzaC9vTnRnWThPaXRpUWZRaHdydkZtU3FNYVYwZFVhdVVrTWcrbEtN?=
 =?utf-8?B?L2tmUE85QWY4VFRWMWliWDhsaWVzZEt6eHd6QWw4bW1sV2NzL2xaUXpLeFZV?=
 =?utf-8?B?bVk4OTc1ekdzS2xZVzFoZDcrMnFMYm90bXIrSmlqandTZ3JxZlRZV2xoQTJO?=
 =?utf-8?B?OXh4cm5EbGJmdTBOUEZmV2MyQ1RxYS82UmlOZTNrSnk2SXc0TTRpd0Q5K211?=
 =?utf-8?B?LzV5dEQ2VmRVTkJabDZSN2dYMEw2d2NDdk1JV0hWMGlpRFJsc2w1S1NjN3Zz?=
 =?utf-8?B?MHRpZ2FqOVZqMWtlOUYrQVhhRGpmek4wNTZCT2puWkZtNEdzcFdON3V4amRC?=
 =?utf-8?B?NFloVVhRSG15M0JjdUxPdEhRV2NGd2o0em5GY29MTHQwd3NOK3VXVUpFMmQ0?=
 =?utf-8?B?Z1ovNUdFUXRWR1JSWmZjOUN2YmxGSnpkUzdnRUFaT0hOVEc4MENlbFMwQXlt?=
 =?utf-8?B?MkpSRWhmR1JpcXNQMFArOS9QRE1WY25Ed1JpOWNQYUdjTmZuNDBGOE1OZnZG?=
 =?utf-8?B?UHQzK2NTbFR1M3FUOVdNYUpJZ1ppM3VEeERoUTBxaHJqM0hQenBZS2lIRTlU?=
 =?utf-8?B?elhqR1U2UXptRUNmczJDc29seEZuMldUc096T0dHWnlTMDlINjRMaUFHRjVp?=
 =?utf-8?B?L2VGZHp1THIwaGZ5cFY3SFNFRXZ6ZnlKWVcwbjNwemdXaEFRa09Dc0hLdVZO?=
 =?utf-8?B?eUl0LzRueXJCeTF2MnNydUdBMnpmOHZaNWUzWjByOVBGTTZhQWM4MXhmdnY0?=
 =?utf-8?B?M3VFckRZRnFqaVNzVG5TTnRJbldjQ2xoMVMzT25TMkFrZTBCbVA5VzBBRmtV?=
 =?utf-8?B?Ym0yQ2hXMjNtNFJ6bWRkRG9JRm44cGJmT0t1Z0VCQ0RtdHRXV1RnOE96Nm9E?=
 =?utf-8?B?Ny8zMnlvU01MRWhsQSs3N2NRcTI4akdpaUVLdEpNSG83TTZlMUlMRk14b0tE?=
 =?utf-8?B?U3Bwc3dhNWZNczErbTFMR2k1MkUwQVBSVHR1eDVXWkxaOHNTdFJDMXE2d2VL?=
 =?utf-8?B?cjM3UGFFMVFvY3lLVTFxOTZoc0NSNlBhNzBkVXNXeS94SEdSc1NUM1VHeEg1?=
 =?utf-8?B?dVphOVdWT3lRZjRObXlQMHNnMmc2SDBpMGNhcEdTYTFHcGFGYitLQWJZT0ti?=
 =?utf-8?B?QmtxWHVhbWdjWXNYTFpETC9QcDhFeVd5QVRTNzRKU2JISmhISnRhd3lCM0p3?=
 =?utf-8?B?SHhPMjVsRWxnKy94UWZxaG4vKzR0bmdybWlsZGx1K1NTT1B1bzdSM0VUOEpm?=
 =?utf-8?B?Y0cwQ1JRZUovSEtjNzR4R1d3aytXa1ZOV0oydTJZWkJJOGhjcHAwSytxYm1m?=
 =?utf-8?B?bDkxMXg3RnpmTVlZNkg4WU5CNXhsVFl6amVxd2xrZzZENXA1N1VRUVBFOU9R?=
 =?utf-8?B?YzdTMDZLeklhMHdXQnl1c3RSb05zS011TnJDdGJBR01VSitDVlgrejBTVDFr?=
 =?utf-8?B?ekt1RXgrdUkwRml2WmtOZ3F4T3NndGpzZzNnMFR1UFd0cWZwYjJidjRjSFh2?=
 =?utf-8?B?cnVRdndZcVArVHk3SFlldS96bURuUWdrWnJTNjNsd1ZpS2Q1WjgvZG9rODV1?=
 =?utf-8?B?NytKZDdpVlJadEZGcklIdHdCZUJ4YWhOM2Z4TmVZYWxkcXF4QkdJdHQ4aThv?=
 =?utf-8?B?MGYxTGs5NERpZTltMXR0anBMM2U5K25hRC9QQzJrcHpHbDZMYnJFbzMyZVF5?=
 =?utf-8?Q?w/W7CTF/P3L+ewjuGkpGqKPEk/dtgT6DjJLyk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elhZWnZKZGh1N1NBUkZsZnkxWU1OaGdGcjZSTUlmRWYvdXZuVU5Bd0tNVFk1?=
 =?utf-8?B?V3JGcG5vTVNPZHJlZzlxVkRFYThRQlFvaTlsbXhjVk5GdU9nZ1EzTkk2UTJV?=
 =?utf-8?B?MlpvT0F4TjREN1ZsME5uYjM0Rml1TEZ6cmlnK2Q2MmRCL3RqclYzM05aYlhY?=
 =?utf-8?B?aUdsZUFRSkpmWmgwYXZIaEViU1FacDlXZlhQUHBhMzdYUWVEbWpuQWJUS1lT?=
 =?utf-8?B?aWVQREZ0QWJHLytFVDh3elVoVGg5bUtYenhBYnU0Z0NRYytudGhwMHkyMUVw?=
 =?utf-8?B?ODhMcmFVR0FVWEpFOWczMGRMY1M2azRIUU5xbFBzL1VlckhRKyt1OUdERXA5?=
 =?utf-8?B?YkpaTHZRWFE0aTVmZVhRZGQvL2pNZm5KOXc4ZjVPM3o1Zk9MMm9IaUFGVUpB?=
 =?utf-8?B?Z2IyMEF1ekliTDA3cm1Ba00rQUFHdkszdEdYZkFjcE8vQWtnczhZY0ZiaERK?=
 =?utf-8?B?cVhXS0p1YXBpUUxaM0tYNnpJMlh2OXhocVVORk1aK0ZpTEZucm9HM0Rkblgw?=
 =?utf-8?B?TWh2STJKZGZNWmhqc1hKMGxucTkyVldxRWdWQ0xmeXpmRXZDQnh1Y2tDbnp0?=
 =?utf-8?B?b2xNYjFsbWJydXlPWHhPUXdyc2RFbHdicEJxU0dhenFveW5uYVE3bDJtTGNz?=
 =?utf-8?B?QU5oQ1JrYzUvaHlCL2kxaFZzQUFCeVVIdmZwQTlUOU5JVzI4QjhjZTdnWmlJ?=
 =?utf-8?B?eXNQTUtNS255WG5pcjJTRXYyWW5NNDh3cWwxTlJLZ2tlc3RFdDk2Q3ZSbGRm?=
 =?utf-8?B?UENxWTdHamZZc2Z0MVlqaUxSRzAyMmJvWWdYM1U1akRSRDZ3aURsSlQ0SGFh?=
 =?utf-8?B?V29PRG9GMFc2c0IxNmI4NEJvUU8va3JXRTNQeGNEZFBnWElCRi9zVnpPOWZt?=
 =?utf-8?B?WHpNcHFqK0EvVUxRUnBXYmlVdkZ4VUc1REtuNnNwWUZLNzlGd0lmVmtjQ0Zy?=
 =?utf-8?B?OU1ldXJzczR4NmdRQjBRZnFPck9Gb3dSRTVMM0ZWUFFaTTVCamFPQWUyME4w?=
 =?utf-8?B?SXNBdTRTd0x3MURna0w5MEhKcVFnZGI2MEhhekFMM1FKaGM2ZFFCclo5SXhz?=
 =?utf-8?B?NWhBM3U5MVNsMGx2WHM3Q1g4NzFlOFRtUDV5MTZhY05NcDlVelVyWS8rdlR0?=
 =?utf-8?B?VS9sOHQ3enZhUGdyT1FxT0Z5L2c4UEM0OHhVNjBCdWljb0tsa2dNd2xCS0ZX?=
 =?utf-8?B?Wk10eDBxbWtvY1dGcWZJd2VVdDFNM3VES2U3TkZVYXAxMHFvN3EydTJpNUVF?=
 =?utf-8?B?d1hlM3Uyck9OMEFEb0U2ZUEydjhtVnozOW5DNTJNR3ZmV2FvdXZoTGJ1cm85?=
 =?utf-8?B?Y3hOOTVoRDdJVUx6aDJac21qUzg1UkU0Q0x2U2crN2tCWU90d2M5RGNGN0o2?=
 =?utf-8?B?VkVKVmoxZnJSSkdyVCtvdzM4c1RmZU5NZlducC9NY2VObHlldHJrM0k1cGpE?=
 =?utf-8?B?dEJtV2VDZFNKUGxiTVNabVZZTWNGWHI3WVR5UXBaZHRCNzIvdWtwR0l5bkQy?=
 =?utf-8?B?eEhTT1o5N3ZyNWVqUDkyeERyNXdUVUJKeTR5STcvenQ5Qjg2QUZNR2hnVmNx?=
 =?utf-8?B?UVBZWWQ4Y3I5T2hTbllDMDAzR0lLeFZRT3lXeERiL1NSNG5JQkQ1anZqbXJ4?=
 =?utf-8?B?NjJLUHJIVTVsRngrTlpMSWRUMkVzNzQwV3BZSFRDKzhoRDUwekl5c3dQaUYr?=
 =?utf-8?B?NnZ4RnpZckJBMlhRUnp5dHVjWlNFVGRtUUlOOXdZQjhoc011OGRIemw3WVNJ?=
 =?utf-8?B?by82RlByOXEwRWdaY3FlTnZtQjJQYTlta051RCtqYW9pcWlNR1JhTHIyVzUv?=
 =?utf-8?B?SWZ5WEFPRDZ3QXJHUXh0MUNaZ2tjRy9zck1COEN6NkpVek8wSXVpWXJDd1RJ?=
 =?utf-8?B?eCtBSmRsd2Y0cG91eUIrc3Q3RzNQbnNVQloxWTlJUS9xVElkUXVlUDluNDFn?=
 =?utf-8?B?cVVvME43WS9XczhNOFJIcUxHM0lPd1FPY1k0c25nRWdqdUVRYW5nTC8rV09m?=
 =?utf-8?B?K0djLzViMlFXVzdJT1dZZlJzQmMraFlSTUIwQ1BQQTBJbUQ0bDc1UWdzQldp?=
 =?utf-8?B?SWRwU2xrTFowMXROREVRVHVOcE9kNkRuRTNCTnBudDBBTXE0UGY4N0JnNVBB?=
 =?utf-8?B?V2ZEOEQ0UmtvR1FUOW9naU9seHNoRGJhd3pwREN0RmNEY25HazViRzE2Q0Nj?=
 =?utf-8?B?cHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a2d12a-8227-4afe-3ed3-08dd7dea6288
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 19:59:38.7429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5gjFPbUvfEdB0ovtrN/pREwK4QjLRrD62P3N5gyR3rcRX50BcWj1b/P/BfhM4/nHCWQXlWitVgeGOZggt3hDw4S7TNRcbELOtu/iOdn/HhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7421
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

On 4/16/2025 5:04 PM, Matthew Brost wrote:
> On Wed, Apr 16, 2025 at 02:35:42PM -0700, John Harrison wrote:
>> On 4/16/2025 1:35 PM, Matthew Brost wrote:
>>> On Wed, Apr 16, 2025 at 12:30:27PM -0700, John Harrison wrote:
>>>> On 4/15/2025 10:44 PM, Matthew Brost wrote:
>>>>> On Tue, Apr 15, 2025 at 04:18:29PM -0700, John Harrison wrote:
>>>>>> On 4/15/2025 11:39 AM, Matthew Brost wrote:
>>>>>>> Chunk devcoredump into 1.5G pieces to avoid hitting the kvmalloc limit
>>>>>>> of 2G. Simple algorithm reads 1.5G at time in xe_devcoredump_read
>>>>>>> callback as needed.
>>>>>>>
>>>>>>> Some memory allocations are changed to GFP_ATOMIC as they done in
>>>>>>> xe_devcoredump_read which holds lock in the path of reclaim. The
>>>>>>> allocations are small, so in practice should never fail.
>>>>>>>
>>>>>>> v2:
>>>>>>>      - Update commit message wrt gfp atomic (John H)
>>>>>>>
>>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>>> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>>>>>> ---
>>>>>>>      drivers/gpu/drm/xe/xe_devcoredump.c       | 59 ++++++++++++++++++-----
>>>>>>>      drivers/gpu/drm/xe/xe_devcoredump_types.h |  2 +
>>>>>>>      drivers/gpu/drm/xe/xe_guc_hwconfig.c      |  2 +-
>>>>>>>      3 files changed, 50 insertions(+), 13 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>>>> index 81b9d9bb3f57..a9e618abf8ac 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>>>> @@ -80,7 +80,8 @@ static struct xe_guc *exec_queue_to_guc(struct xe_exec_queue *q)
>>>>>>>      	return &q->gt->uc.guc;
>>>>>>>      }
>>>>>>> -static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
>>>>>>> +static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
>>>>>>> +				     ssize_t start,
>>>>>>>      				     struct xe_devcoredump *coredump)
>>>>>>>      {
>>>>>>>      	struct xe_device *xe;
>>>>>>> @@ -94,7 +95,7 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
>>>>>>>      	ss = &coredump->snapshot;
>>>>>>>      	iter.data = buffer;
>>>>>>> -	iter.start = 0;
>>>>>>> +	iter.start = start;
>>>>>>>      	iter.remain = count;
>>>>>>>      	p = drm_coredump_printer(&iter);
>>>>>>> @@ -168,6 +169,8 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
>>>>>>>      	ss->vm = NULL;
>>>>>>>      }
>>>>>>> +#define XE_DEVCOREDUMP_CHUNK_MAX	(SZ_512M + SZ_1G)
>>>>>>> +
>>>>>>>      static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>>>>>>>      				   size_t count, void *data, size_t datalen)
>>>>>>>      {
>>>>>>> @@ -183,6 +186,9 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>>>>>>>      	/* Ensure delayed work is captured before continuing */
>>>>>>>      	flush_work(&ss->work);
>>>>>>> +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
>>>>>>> +		xe_pm_runtime_get(gt_to_xe(ss->gt));
>>>>>>> +
>>>>>>>      	mutex_lock(&coredump->lock);
>>>>>>>      	if (!ss->read.buffer) {
>>>>>>> @@ -195,12 +201,26 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>>>>>>>      		return 0;
>>>>>>>      	}
>>>>>>> +	if (offset >= ss->read.chunk_position + XE_DEVCOREDUMP_CHUNK_MAX ||
>>>>>>> +	    offset < ss->read.chunk_position) {
>>>>>>> +		ss->read.chunk_position =
>>>>>>> +			ALIGN_DOWN(offset, XE_DEVCOREDUMP_CHUNK_MAX);
>>>>>>> +
>>>>>>> +		__xe_devcoredump_read(ss->read.buffer,
>>>>>>> +				      XE_DEVCOREDUMP_CHUNK_MAX,
>>>>>>> +				      ss->read.chunk_position, coredump);
>>>>>>> +	}
>>>>>>> +
>>>>>>>      	byte_copied = count < ss->read.size - offset ? count :
>>>>>>>      		ss->read.size - offset;
>>>>>>> -	memcpy(buffer, ss->read.buffer + offset, byte_copied);
>>>>>>> +	memcpy(buffer, ss->read.buffer +
>>>>>>> +	       (offset % XE_DEVCOREDUMP_CHUNK_MAX), byte_copied);
>>>>>>>      	mutex_unlock(&coredump->lock);
>>>>>>> +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
>>>>>>> +		xe_pm_runtime_put(gt_to_xe(ss->gt));
>>>>>>> +
>>>>>>>      	return byte_copied;
>>>>>>>      }
>>>>>>> @@ -254,17 +274,32 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
>>>>>>>      	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
>>>>>>>      	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
>>>>>>> -	xe_pm_runtime_put(xe);
>>>>>>> +	ss->read.chunk_position = 0;
>>>>>>>      	/* Calculate devcoredump size */
>>>>>>> -	ss->read.size = __xe_devcoredump_read(NULL, INT_MAX, coredump);
>>>>>>> -
>>>>>>> -	ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
>>>>>>> -	if (!ss->read.buffer)
>>>>>>> -		return;
>>>>>>> +	ss->read.size = __xe_devcoredump_read(NULL, LONG_MAX, 0, coredump);
>>>>>>> +
>>>>>>> +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX) {
>>>>>>> +		ss->read.buffer = kvmalloc(XE_DEVCOREDUMP_CHUNK_MAX,
>>>>>>> +					   GFP_USER);
>>>>>>> +		if (!ss->read.buffer)
>>>>>>> +			goto put_pm;
>>>>>>> +
>>>>>>> +		__xe_devcoredump_read(ss->read.buffer,
>>>>>>> +				      XE_DEVCOREDUMP_CHUNK_MAX,
>>>>>>> +				      0, coredump);
>>>>>>> +	} else {
>>>>>>> +		ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
>>>>>>> +		if (!ss->read.buffer)
>>>>>>> +			goto put_pm;
>>>>>>> +
>>>>>>> +		__xe_devcoredump_read(ss->read.buffer, ss->read.size, 0,
>>>>>>> +				      coredump);
>>>>>>> +		xe_devcoredump_snapshot_free(ss);
>>>>>>> +	}
>>>>>>> -	__xe_devcoredump_read(ss->read.buffer, ss->read.size, coredump);
>>>>>>> -	xe_devcoredump_snapshot_free(ss);
>>>>>>> +put_pm:
>>>>>>> +	xe_pm_runtime_put(xe);
>>>>>>>      }
>>>>>>>      static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>>>>>>> @@ -425,7 +460,7 @@ void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix, char suffi
>>>>>>>      	if (offset & 3)
>>>>>>>      		drm_printf(p, "Offset not word aligned: %zu", offset);
>>>>>>> -	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
>>>>>>> +	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_ATOMIC);
>>>>>>>      	if (!line_buff) {
>>>>>>>      		drm_printf(p, "Failed to allocate line buffer\n");
>>>>>>>      		return;
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
>>>>>>> index 1a1d16a96b2d..a174385a6d83 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
>>>>>>> @@ -66,6 +66,8 @@ struct xe_devcoredump_snapshot {
>>>>>>>      	struct {
>>>>>>>      		/** @read.size: size of devcoredump in human readable format */
>>>>>>>      		ssize_t size;
>>>>>>> +		/** @read.chunk_position: position of devcoredump chunk */
>>>>>>> +		ssize_t chunk_position;
>>>>>>>      		/** @read.buffer: buffer of devcoredump in human readable format */
>>>>>>>      		char *buffer;
>>>>>>>      	} read;
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
>>>>>>> index af2c817d552c..21403a250834 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
>>>>>>> @@ -175,7 +175,7 @@ int xe_guc_hwconfig_lookup_u32(struct xe_guc *guc, u32 attribute, u32 *val)
>>>>>>>      	if (num_dw == 0)
>>>>>>>      		return -EINVAL;
>>>>>>> -	hwconfig = kzalloc(size, GFP_KERNEL);
>>>>>>> +	hwconfig = kzalloc(size, GFP_ATOMIC);
>>>>>> As per earlier comments, this should not be happening while dumping a core
>>>>>> dump. The only code which uses this is steering related. That implies we are
>>>>>> reading EU registers while printing out a previously saved core dump. That
>>>>>> either means we are unnecessarily reading registers during the print or we
>>>>>> are not capturing state in advance and only actually reading it out when
>>>>>> printing. Neither of which is good.
>>>>>>
>>>>> Ok, I don't have bandwidth to fix that. I'll let this series die then.
>>>>>
>>>>> Matt
>>>> Or maybe just add a FIXME comment? I've been meaning to take a look at this
>>>> myself but just haven't had the time.
>>>>
>>> I guess that is a better option. I can add a FIXME when merging.
>>>
>>>> If we need the large file support to allow people to debug issues then we
>>>> should get it in. Your patch is not causing the bad register accesses (I
>>> Yes, this is an ask. And no, this patch isn't causing bad register
>>> access rather exposing it via a lockdep splat.
>>>
>>>> don't think), that is something that is already broken in the driver. But I
>>>> don't think you should make this change with a comment suggesting it is all
>>>> fine and happy. The commit description should be more like "FIXME: This
>>>> should not not be happening, but until the unexpected register reads are
>>>> removed/moved make the alloc atomic so it doesn't go boom" and add a similar
>>>> comment to the allocation itself.
>>>>
>>> Ok, can fix commit too when merging.
>>>
>>> Matt
>> Sounds good.
>>
>> Although I've worked out where the dodgy reads are coming from. It's the GuC
>> backend for the register capture code. And it's not actually doing register
>> reads, but just re-calculating the steering for the register value that it
>> had previously read at capture time. It should be possible to cache that
>> information as well, rather than re-calculate it at dump time. And that will
>> get rid of the need for the atomic alloc. Will try to get something posted
>> later today. Up to you if you want to hold off merging for another day or
>> not.
>>
> I'll wait then I guess.
>
> Matt
Posted: https://patchwork.freedesktop.org/series/147940/

Turns out the capture of steered registers was just completely broken 
anyway!  So was definitely worth chasing this down.

John.

>
>> John.
>>
>>
>>>> John.
>>>>
>>>>>> Rather than making allocations atomic when they don't need to be, we should
>>>>>> be fixing why the coredump is not doing a clean separation of save versus
>>>>>> print.
>>>>>>
>>>>>> John.
>>>>>>
>>>>>>
>>>>>>>      	if (!hwconfig)
>>>>>>>      		return -ENOMEM;

