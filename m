Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68562C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 04:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 321E710FC6D;
	Wed, 24 Apr 2024 04:05:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LZ9sxfz2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE5EB10FC5B
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 04:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713931518; x=1745467518;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Zr0DLPT/KsOezO5C5TOO4qHuHwu8LMdMt6Xsaa2ueGM=;
 b=LZ9sxfz2RE7H2XGW5Bu1GYUJaVyahTNaKhiBTGpHwJsZhT0rJ0DLP501
 ik8n363ZBMMghehZaTW3oxwlAXsJoVShEBeo+JKceUffRW9aPx2M0SqGl
 hy7JxQMo/usuWfo0u3Wb5JLYmcnK3ynOVB1SRMN4eE2xjbS+xsKEBpa3w
 cWdxTIXu92E3VgFs3GfJ3e0vVtbs5KWb2Z+g0Hk6Vpr0fu6W6lH3nDHf4
 oS1rvq7kjCt6h5VWGM42H+2dSRxbce+FeI231YNOIVgz6aPnN169f6nDf
 frPhkfKEicTL4wlQpL6MRhXAa3sGk2+NuAL5hgqrHyrJiabhE0M+op3tA Q==;
X-CSE-ConnectionGUID: cnp/A3/qSiGHBFwXsVbK6g==
X-CSE-MsgGUID: ZetlmcXfTVuqvnVPrRnl5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9372434"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="9372434"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 21:05:18 -0700
X-CSE-ConnectionGUID: 0dM2zc9gTdSlwywETmdccA==
X-CSE-MsgGUID: W76o9asGRoCkHUf+vvrM1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="25093781"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 21:05:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 21:05:16 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 21:05:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 21:05:16 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 21:05:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HMe+J0VUrd9QnTDA6RijiGkPhDx6IZwx3NtGolUEjg4V39vdw9VkmtTkwtKfRY0zPqlepv0hkfmt1B/ABvx+LJhY7wjk1n+UBIQCuyc338h/Yz46R6gqwEhwO2mdQ5qXqLiChGXctPqmPo7uBs/Vbi2N5kGIT2801xZxS/hdMvtjZaL+ymmYYCsJIJUUi9yjsTuxkOwzcGfqi+gf+fhzSqmKI7+kbQvfvhZVMRdDpaVE0gPFHAFYDd02WVcnqMci6xOMuREI44OAiLEKgcbLYiKXOF9A8WjAALmW80IH4iTBMqcmGfCJ7aGBdFeBqkKCCDi5ZurUWvyGy4XRV644Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2IVFcE4wiRfPIcVONb338Bu7DriDWwEuuwjIZQPmhE=;
 b=Zh4vbcM6K23Uk0MgUIZuNDP2f+7Et3BbEOpZ8MDLFLwgr0YHUfssOLMzzO6XBcueskd/Hi7v69sGUid5666h03xSxdHCZMFocm8808ChfY+VcBskJjuGehdA8GketAOa2tK+VUzTJOJzVlrgGY8RQhUDsUODybXs8gkPRTRnsm5WNatre8RbeR8wNL+2e4BC6HCYCiYkNiteSN1wEm4HWhEJNWJ5sNpv9CunnoUD/Z0TLi/LWsv40xqQML31xdquGI0DszTejvjzMQ+ljiEDIfSbcQXm2FkFcoE022DSt7s8ybHXU6ep+TpRiDlgtHYVY7iAWVaSeVYtAGIpVJ2zKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by IA1PR11MB6491.namprd11.prod.outlook.com (2603:10b6:208:3a5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Wed, 24 Apr
 2024 04:05:14 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8e17:1f3b:64f:9c67]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8e17:1f3b:64f:9c67%4]) with mapi id 15.20.7519.021; Wed, 24 Apr 2024
 04:05:14 +0000
Message-ID: <062c0ae2-e67b-4513-a7d6-eecaf84020a4@intel.com>
Date: Wed, 24 Apr 2024 09:35:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/vm: Use xe_vm_lock()/xe_vm_unlock() helpers
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <20240424035756.2169209-1-himal.prasad.ghimiray@intel.com>
 <20240424035756.2169209-2-himal.prasad.ghimiray@intel.com>
 <ZiiCi8RUNDytoZoS@DUT025-TGLU.fm.intel.com>
 <19d1ea6e-eea8-4a14-a886-740f1f8a4464@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <19d1ea6e-eea8-4a14-a886-740f1f8a4464@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0178.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::12) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|IA1PR11MB6491:EE_
X-MS-Office365-Filtering-Correlation-Id: 22873f2c-ac31-424a-8656-08dc6413be47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3B4NVNXNGNZdHZFeGY5dUl4akVleHBPcldZQUFWeDcxOGJUVVVaYnloek5J?=
 =?utf-8?B?NWwzanFWbHZXOUtTSGN6VlNaaG5VRVAvbEJYNUxxUndjRUtja0hONERiM1dO?=
 =?utf-8?B?ZDBLMnk0TS93bU9VTFRJbzhiYkw5ZXM2TjdSaHBzcS8ySjRpa1lCZysxYkRG?=
 =?utf-8?B?VzhqMWpKM3crUnpEWVg1UGZ3UzA4S2FSeDdnV2V4VVhYRGZMUnFNZWlZREJ6?=
 =?utf-8?B?c3BKQnc0ZzJFaUFVdk1FSEhmaUtpdk9MbFhMcU91bHVQV2ZFN29jSEhYT2lK?=
 =?utf-8?B?V1ZqTERaSHFHM29YeXpvR0VxWkdYYzkyd041NTJTKzB5UUN6TkdwL3JOS2pN?=
 =?utf-8?B?dmx4emRrbklxeGw4OHM1dC82YUxaNmZXZXlkKzVZdG85b3R2eFYxcnI0cktx?=
 =?utf-8?B?eElNbXE4N29ucGh6MnNBV2NlQU5PZ2lBSkxkWkJtOVZPL2dCUXVDbDdWN3JN?=
 =?utf-8?B?S2YxaGxBbUxFVGVJcTNHajYvbWVQd1RwYUk5YnpZeUxnY3VoQVZWcEFTU1Va?=
 =?utf-8?B?Sm80aSt1b1c5eVliNVJYZE92bXI1amovWlIxdE80N3VWaTlWRXpXTWFCbEdB?=
 =?utf-8?B?NWxPWmhQYTVIS0VmQTVOaUlyT0IzTENSMkk2V0c4OHFnb1lQWjBvSlFIVEN0?=
 =?utf-8?B?NlhUQU1VdStDL25pQlE5cE12Mm40OFFMRW94VWNITjVkczNheWMrY0VPaXJ6?=
 =?utf-8?B?Yzlyckt3My9hTDVOQXZxOWVvWkRZdGxHN3hFN2pjZWNWQ0ZJajhpRDBXOVlJ?=
 =?utf-8?B?TGpZRVdnVytNeHc5MHJJVFJnbldaK1M0bFplYkEvM0VMMU5kTzBaeHlybmRT?=
 =?utf-8?B?enVqNThtRVBBWTI4VGZVdDAxT1duZkJEVVFIM0JnOUFCbXU3UzJ3RHlZeG12?=
 =?utf-8?B?NDU5djRGVFEwUitBK21BZ1pCbmlHQVk4MW9VM3VEMjduMXNQNEFrb1p5RHVE?=
 =?utf-8?B?N252OTg3OEs0MGlFTzl5YXRGOWxmamRadk16R1g5S0RmVEJqelloSlVpL1lW?=
 =?utf-8?B?c2RhalF0am54b3NmTE4yUTROWkp0c3NvN0ZFbXdjN0htZVZVL3lTNWFkQmNF?=
 =?utf-8?B?WEFFS0V3enl0UEtpT0xCaXVRR2FaUVk2Z1pteFpYVnVqTzNJTDJ2czA3M1Zm?=
 =?utf-8?B?eFdTS2d4MHU0eUd3ek9MNTBoTmZ3QVlrZjNZUmtwQ01ZNGhySkZGRkN4cjZG?=
 =?utf-8?B?SjZ1NEQvQnBVQmM2Wkg4aWczb2t6QUJoTmtlN3dGT2ZkeVIvek91a0xDYkw1?=
 =?utf-8?B?MmdNcnVGdDZYVkh0TVgwaDhlTW1sR0djVi9UcnVRMnY3S2Y3bDRLVEIvT0pj?=
 =?utf-8?B?MHFsUWlYU01BK3J5bk1Ua29hanU2cHZYblYrMFFOeWZYVEk5Mk5GSWxpMWwx?=
 =?utf-8?B?WDNScWZnN3dVZisrQTNnTW9ZWGdzYlBMcDRFSHZGSVFwU0tuZ2E1aGdTL2h0?=
 =?utf-8?B?Mk53UzdVSmJxMGdiWnk1WnJCbmN2V3hJdEpUbEZUWGdFZ3VQRHZKM2JZWlpX?=
 =?utf-8?B?MCt1WUV6Y3hXR3BpZThBOHR6V3V1YkJOUWtUdE1IeXJwY1V1cExETUl3ZlJM?=
 =?utf-8?B?dXRDZ0ErVVEwYjh6WjB1eDg3cXR0clRaY0FSaTRTQXZrTTE4WXRjWHFyQUYz?=
 =?utf-8?B?Q3VsdlgzWHlrcGdHWEpTYm5FTWdGaytBQnplNDBvSkZiTlZtR3EzL1dqeVVy?=
 =?utf-8?B?L0lzWmFvK0ZrQkJOeWkzMG5LU2pXS2I0Vlorak1hN0UrRFBEd050dEVnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0NIYlJIU1QrMWN0OUQzdDc1NElQNFhoeEJOazAzcFoxcWlvYVZMYkVoN3ln?=
 =?utf-8?B?VG9jbGt3RGFhRmw2ZUtwMEY3S1dHZUo1UW5VcStpaDlJTURqL2VwTkhSeXBI?=
 =?utf-8?B?NDlLWUJ2UTNYcURDMXRmQWpBNm85ckNrWTF2em1HM1hYQzB1MEljUjFhZDRz?=
 =?utf-8?B?UjkwanN6am5GSldwNU0rVjhJcnhjRklFcjhaOTFGWng4cTNMZWlGMDVYN1l3?=
 =?utf-8?B?WUo4cngvT0VkKzFmVTI2TmZYMGdQcDR2TXpQRHV4enVCUm8vd1J6RDJpcnVH?=
 =?utf-8?B?NnE3RlErL1UrRXNuVjdpU3hJQnZkNko2bHJnRXM0c0xDNVVGenV0NG9kZkR3?=
 =?utf-8?B?VlBCT2tsMmJtMnYzT2JVRGVGdFdINmVrNUZ2KzUvSWg1RFE0SjBvQWViUElR?=
 =?utf-8?B?OVZZczNBa1FkWWw5UllpdStsWVR1K1Vua2ZsUGR0QmdJdUdXQVJ2c2xWbUZu?=
 =?utf-8?B?MC9LUUhLeUU0aHV2TDVRTGhVOGpYaUlUb0ZabjNrMW9XaVZLZnhmaUo1SWZN?=
 =?utf-8?B?K0Z0bSt5anJDVnVTRGo1a3lYQ0lPUGlUcVBKTGVNYVBxRUxINDVGK01nNVU1?=
 =?utf-8?B?em5aYnNQY0RkN3lSazcvcUh6Y3l6UjZnRVI5N3VkcncrY08xWWVyWkNaN1hO?=
 =?utf-8?B?UVVjVmg5bGVwYjdleG9vTE93d1lCYisrZUJGS0ZyeHE5anBjNzBsK2EzSmxs?=
 =?utf-8?B?eHg2dzlPTWpncWxsZzJFSDVqblZqeWJKSTBUbDZxYVpqQm9TTlgraEZ2cnY3?=
 =?utf-8?B?STI5MWExclljVHNoazc2WmpaSnlxODVlQkRSMXNVQUZHVXMwOWQ5QzlEa3hj?=
 =?utf-8?B?clJTdjdEUzMzQ3pzVjNUeWNETXV4a0lXM1ZzempvQWFOcHh4NEhGSnBNL0p1?=
 =?utf-8?B?WjNKcXlTaXRwVjlvZ04vTjZ6bUtnM2hjVkV6RDBXejkvUnRwbjl0NXdWM2JB?=
 =?utf-8?B?YUx1QktqM2x1alNDcE1YY2d6VGgzQndVUXBmM3hOYllFelVSVmlDbDYrNEtG?=
 =?utf-8?B?bXlHQ3JkNllwZGJReS9SNHE5OWd5aGd6ZGExMGJvUzcrbnF4N08wTWJQTjho?=
 =?utf-8?B?Zk0wdEFaWHdpVVRRRWZSN1FuQStkaWVkUS9lbnA4K3dPYmlPcWEwSDhaS2Jm?=
 =?utf-8?B?MnJ3K0p6N0lBWGZldVFIbHZzNnRwSDBua2ZSV1ZiK1NoUVhrMFRsOEZiZ2FO?=
 =?utf-8?B?alJzYy9mMFJ5WEJJU1pwaW5Eem9vT2RiZGtQREJyTVVKVEptTkF4QUxXUTNa?=
 =?utf-8?B?cGlTamVrN0RueVRoUGV2Mm5XQU5kMzg2VmhVV3UxZWFUbmZjT2R0Y1plT2px?=
 =?utf-8?B?WnlXN1J0V3FLejZPalVxRHRqRDVsN3J6TDVwMElmbm0yeElEVzVLRk83TzBD?=
 =?utf-8?B?OTFKVCt2N3Y1TlJzTnhvbU8zTFYzaWM1Q2Y4MlRCdFBLR2QzNE9pWXJiY1h5?=
 =?utf-8?B?SHlaKzE1WWpQVGFVdUEyb2Y5U2h5MFR4OUZ3cG9CWkRDVTJzN3dBVFBxZEtU?=
 =?utf-8?B?azhBbURMM2lDMk9TcCtjcFFESTBLcG5ZNEZFcEIrSmI2Rk0vVWl2NUhSMkh4?=
 =?utf-8?B?bWlnWnNJcXpjNnNobE91QmwzWThjTWtKNEtlOEJtazBlNUJNdFZyQ3RWOFZs?=
 =?utf-8?B?blpxQVZ1L1JBci9CYkxrVmhBSDF5N1JtRGFRRXFmc082T3hHQ25DR1ZuN0ZI?=
 =?utf-8?B?T2hEKzhWanRCY25jWXRodkJGT05KS3NXNjJyWjQ1VExhK0dHVC9TclN0M1BH?=
 =?utf-8?B?eEM5MmtvUDM2ZkczT0hOUHBZOVBOVzB5WVpBSzl6b3BsNG94cXd1czBJR2Ja?=
 =?utf-8?B?Y1F5YnpIdjNBbXYwdXVqSGViQmx0UGxYUlo0S25aWGIvejZEbXFaVjZORWJm?=
 =?utf-8?B?SE5Zd01PeE5BdEJYSEliZFZJUDlxUHNITG41N3VocnIwNElGeWRVOU9wei9L?=
 =?utf-8?B?M1FyT1ozcndYYWdFZW9uTVBva3JUNGtYMTNMUjdTRWphQzdweG9IdEF6UmFu?=
 =?utf-8?B?WWIwdk1YZytjRDNTVkFzOU9MYTNuZVdlS3hQbEY3WnNqSmdLY09TSkJoczJD?=
 =?utf-8?B?YUZDa1lrRE5kMnhaQXlKbmlrL1pjTXU0Z2ZEY2VlR1doRzFxTStScUNONk1P?=
 =?utf-8?B?TGJOLzdiSVNWcUtMZDB4R1NQVXA3OVNrREVBYTlDeWp3V1hXMHFlanBQL3FM?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22873f2c-ac31-424a-8656-08dc6413be47
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 04:05:14.2288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z+Tbn4qV9NURK2jAMI2sYY7dr7GQREn8XBHcaLkwzl8BqGNhASqmcJ4Dn+hTA8Nrh4lNlSdMyt5vh6KNmoKBKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6491
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



On 24-04-2024 09:27, Ghimiray, Himal Prasad wrote:
> 
> On 24-04-2024 09:24, Matthew Brost wrote:
>> On Wed, Apr 24, 2024 at 09:27:55AM +0530, Himal Prasad Ghimiray wrote:
>>> There is no change in functionality. Using the helper function
>>> defined within the driver.
>>>
>>> -v2
>>> Use xe_vm_unlock() (Ashutosh/Matt)
>>>
>>> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_vm.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>> index 85d6f359142d..c350c561e7d9 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>> @@ -1279,7 +1279,7 @@ struct xe_vm *xe_vm_create(struct xe_device 
>>> *xe, u32 flags)
>>>       drm_gem_object_put(vm_resv_obj);
>>> -    err = dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
>>> +    err = xe_vm_lock(vm, true);
>>>       if (err)
>>>           goto err_close;
>>> @@ -1323,7 +1323,7 @@ struct xe_vm *xe_vm_create(struct xe_device 
>>> *xe, u32 flags)
>>>           xe_pt_populate_empty(tile, vm, vm->pt_root[id]);
>>>       }
>>> -    dma_resv_unlock(xe_vm_resv(vm));
>>> +    xe_vm_unlock(vm);
>> There is another dma_resv_unlock below the label 'err_unlock_close' too.
>>
>> Matt
> 
> 
> Thanks Matt, Addressing it in next version.
I think dma_resv_lock_interruptible also be replaced with wrapper.

xe_vm.c:1282:   err = dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
xe_vm.c:3117:   return dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);

xe_bo.c:2050:  return dma_resv_lock_interruptible(bo->ttm.base.resv, NULL);

Regards,
Badal
> 
> 
>>
>>>       /* Kernel migration VM shouldn't have a circular loop.. */
>>>       if (!(flags & XE_VM_FLAG_MIGRATION)) {
>>> -- 
>>> 2.25.1
>>>
