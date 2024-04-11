Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867B4CD128A
	for <intel-xe@archiver.kernel.org>; Thu, 11 Apr 2024 09:00:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB93410EB41;
	Thu, 11 Apr 2024 09:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EsFMjXRd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E40610EE4D
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Apr 2024 09:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712826009; x=1744362009;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=EuOnDaGWP4a/hqIvIECHfjj+j6kUzJc1SNqT1GJRbMA=;
 b=EsFMjXRd7a0o0YeufVKMyhbYddrYyrajjlCfW2mEaEVfz7W20O05q0PO
 gjek+L8PtY5PZc6WaKEvmRGrW5IE8bVmaEqNPLYOMbwppuAXTeRxyxa8d
 4/5m9ynJb20UPaLysBr9ZuPBZmJxsEDUyyFobgVQI57LbiO/LaQlxRMC7
 d3zK2yjAvKqbNgMi/rIVflFkJIG48N5Ka1ismFn79ULU3QFuVHH4xnmMv
 EwlVcuJMyaHgXGKs5vx4G0eBNAgeiobUbTrEmgkN/rCsAGMlZGkxsSCcb
 wb1BCsp60ZVoVpTFeA4GbPL1lNHzjaK3mDVHKGVpx33ieZLUteIr4i7pI A==;
X-CSE-ConnectionGUID: IIKXT6oDRRu8bFNhBT6/Yg==
X-CSE-MsgGUID: H4bzsiY0QxKWOjHB5Pz29w==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11185389"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="11185389"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 02:00:07 -0700
X-CSE-ConnectionGUID: /lMkNe7wRTOF/R55vXS9oA==
X-CSE-MsgGUID: W1l6KAafR9KWHe0hOzlxLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="20797115"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Apr 2024 02:00:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 02:00:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 02:00:05 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Apr 2024 02:00:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Apr 2024 02:00:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ee1JTWreOuGYLQIynvzAjrwH68blcUTWJ78d3MCfP3p6hvjE3UXnd06ZFS8xUtLgxWvYvH0elv5TDiE+w89gMfNoK8Tg2dEcMom2dQy3efa4Y+GDy5bkk1ge46uTka2P8TuabkmTbxg0idF22VlP9ZmWD/mmjdkkIuWPfc0gPI1WnG+ToPuaYinkl4T5a2eEP2zxRlG2YACoocdlqQ+nkkib/Yj+VZBOWRYb4qnuNGAKczWTMqbKQv1J39aJTs7uZxGRCZ5lWk+nQNarPjJzd/bph45HQCMJ9ROR5adsd8X/oQxycUQHwITO64w8PE4CEFXzbFhq6wGKKitOHUhi/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NghOsKFyjXUn6O0csTRvMB9Six/ZUkizK5jekN3TjrY=;
 b=iYtcaWPJq2HkSLKdVQG6rGxBHzAImypd9kx5zn25aE2afSoez6PXEqRVVy+vagPAuiFKsQGbjhZ8s4N1PPW6/Q/3kv1dJURy5JwBo0nMAn8K2F1mdvvGM2Otyr78H8W7TR5m/Uct/gU+ip/zKCOmEkr3zLK84XbrFMqgjPSFQE0wsOY6IeIBDA7xdF2tFiKxkFiK8MVwVdh67BWXrAAxV8bSnhgmUjnfIGv2dj6mdFq3qu6DtTmBAcUNHosula1AwGT+dJALUHAqpe8XpoDD74ClxHn08elvSDr1Ago2079qHl98mA0wFibIHfYm/Jk94xG7tDA5j5Fe40BBIEgLIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by BY1PR11MB8032.namprd11.prod.outlook.com (2603:10b6:a03:524::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Thu, 11 Apr
 2024 08:59:56 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7452.019; Thu, 11 Apr 2024
 08:59:56 +0000
Date: Thu, 11 Apr 2024 10:59:52 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 5/5] drm/xe/pf: Add support to configure GuC SR-IOV
 policies
Message-ID: <20240411085952.eo76xxp2bdzyrrf2@intel.com>
References: <20240410170338.1199-1-michal.wajdeczko@intel.com>
 <20240410170338.1199-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240410170338.1199-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR02CA0028.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::41) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|BY1PR11MB8032:EE_
X-MS-Office365-Filtering-Correlation-Id: a391b345-01d8-46c2-b11e-08dc5a05c248
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zzrAIKRWR7XEhv0ifxCbXAZAVWz9fvJxXaXW9EVAGzv3wNgZ0Jxtfx6oGhtDOdaEPZZROlxbousJyd7GagrlfJTCinsvUFuevFIeyJ+wI+3CMsi8Mv4Ldc0Sr8AiwxyoWIsZEndB6MpvC7DXwrzJpg1z0Px+UlycCx2Yew2CPim6qlpaP2PrKzPsOkKYe7SknINgnQG/AnTwLxS10hEAmHtxcYVRsgftExdxTQdrkWP4iPEkgW4YLreZYTv4MFBgFRj8pGjlatgBbFPaSbY9sM/00nVsSf2HBIZwT63XzMjbvVSEC7kCmo/D5TU1pRv+wHEG2mTf4s/SfrltLX9ndjITsPjr6qJCWOPo6lnNy0xGmR4svbiOWN2yVCrCeV+wzRTjor9rzIYUWSlQ0/U45RU/tRHqjfubw+yOwIrqwhxVi9OYJVQtb0UGxyqb2x6mqf+B6F04mILeSmsqp7swphX26Vj66PZP5wU5iZGXdHw0ehXItwAvV+JPR7yyTicmqeLILPSZk46Blik5k0DS4pDz6zAaxaKjbTfnfssJJxEffLJLtDLmeZwXqCtZdcYlHNepao8p+JOrkV7LHjDY2GdhJsuy9iyOcTwbGrnh79SHY45w4nq5pmEZZvCNTgsabx5IbHOoq8LoxivdkLTZ7r57E+9ifpIgdPLP+joSEqI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmNnSTBRTUpiR2JxTE5lWnFvVmRPVWt6SWdybWdrTys5eFRSV3o2bVVQYnZz?=
 =?utf-8?B?dUJhZDdSRVdZRThUY3NsRWRlNEtZRVhqVWwwdmVhSXE3UVVDaitWYzVzVS9x?=
 =?utf-8?B?d2RmeWdTaWo5cm1MUUZDQm5RNXdqVVhSc1B0U21LSlNrWkphSmVuWWdKTWgw?=
 =?utf-8?B?YitpeDhFVWJadWI5NXNMRGVNSVpUOFdhRDJNSmlFNk0wOXI0WnR1UDNRT2Rk?=
 =?utf-8?B?RFErTFhWRzRvQU9jTnBpWG5NTXRGTXE5NkY4aGVaTXFYS1MzdGErYW1YNGZS?=
 =?utf-8?B?WnhPbEViSU1JNjhBcUQyOHhUbnhiLy9WbU1lMnNiZmt0V1p0L210STZvNXFo?=
 =?utf-8?B?aTRkVjNhSlRFVEswNWI5OHdxdjNRRERGK2hRNm1YMm5xT3FQalMrRTl5bU9J?=
 =?utf-8?B?UzNVNzNQQ2dpblRVMjgvTWFXcUNGSlI0cjhTMnhIUXl6cjdEVlQ2MGx0dDRK?=
 =?utf-8?B?YnA1VjRQdFlINDN5em9zYnhCQWlTQVZvZG1ubkpmWFNzaUIvaWlLQzZmWk4v?=
 =?utf-8?B?OXpicmtBTEh5cGRCZWhTeW9rRHlBSVBXS1NhYTRXTlFNZDJZeVZGWXJPdFpn?=
 =?utf-8?B?STBuRlJITExzRmpPWGY0NmpsVHpUWjh5Zy85ZHA2Tzh3NDRHVEdSZFFvanJP?=
 =?utf-8?B?S2ZTZXEyRkNXUHhEY2ZQL2paWmdzN29vVmFZMCs3TSs4NzNxV2paODdGdzZi?=
 =?utf-8?B?SklqMzRUa1poMTViaWw4MzN3dUhJdTlpUUlpS2NGWVM3bFgrNDREMW1zRlU4?=
 =?utf-8?B?dWJocTI3a0RYY0dXMVNwTzZUNm8zQzR3TmlVTU5hN2w4Uks1enpDWGVUcENr?=
 =?utf-8?B?ZXF3cnU5T3kxaWpqRU9OaG5MbDFwdU5pVEZVMFQ2R09PMEJMcHRicEhMbGdC?=
 =?utf-8?B?V250NEJsMzVkckNjb3NrMVhKTHQzdDloaVV5L0VUYW45am93RW15RkZNK0ND?=
 =?utf-8?B?Qi9EYm8rNktQbHUxZThxQVRBdVBtU2VSOUx6Nmx5REdseDFnOW53Y2dWRndz?=
 =?utf-8?B?eXcxOStBb281SVZGOWI2YU1WN3pvbVltMWVGbFV4TVJEVEdXV0lXY2RKR3Q4?=
 =?utf-8?B?ZHZEQnNtVVllTXV6WEdGODduYjEwbmRZM2JTeWlnQUVDWEJHQlNndmpMV3VR?=
 =?utf-8?B?VGJFd09XYnZqMWtMdVJJNFFPU0xQZUVRZ0pSRHM3TVNIRkhlb0RUWUVkU3pZ?=
 =?utf-8?B?Y0xUTEYwdDUybkJVTWtvalVCS0V0dEdrbmtJNXRWY2lDQzJ1cWxocnZhZDA3?=
 =?utf-8?B?Sk1uWUR4ajdDQ2I3MjF0eGNESU1rdCtobkR3RG1DaWJiMGtvMVk4M2J6aFc1?=
 =?utf-8?B?QjZTREVOdHdSTEIyeUNYTTdFaGtiSHFNL1dnYTFrNmd5aEJnUjUwMndKbGIz?=
 =?utf-8?B?MnZCb01nMjNST2JvY3M3L3hYSjJWamU4cGNuK3VqSWZpQkE4VVIzb1k4dURH?=
 =?utf-8?B?dWMrS2lCRUlmWEExV3BNU3J3OVArRUdnSE4zZUJrR1g1cnVWMjNmR2c5UzJt?=
 =?utf-8?B?UnNLRlVQdmhWdThNeWZIbGhBK3JlMkJkSVllL1Z3ak5rK1o4K09DM0FMSkNq?=
 =?utf-8?B?dVVKVEl5YUdoc0NrcHZwalhQQ2xuSVM4V1lVTDZ2alljQWZhT2ZWR0tuTWtF?=
 =?utf-8?B?SmtqcGxmVEpvQU1YMFpsZmZ2bC9jUTVBVHhDQkkvRExmTVF4OWdoYTd2ZE9S?=
 =?utf-8?B?dkFIZCtTY2V2WGdrZzIvK01kTnV4NXNUanZwR2NEZnJORWdVbzBMeW5SbXhH?=
 =?utf-8?B?UXJHam5SenFPUm5kMzFWK0RXdzM1QStWbVNUUk9YYmR2WnI3Qzh2eWhSUy9N?=
 =?utf-8?B?cCtNQUF3UmRMcHp0cUVkaVYxRHI2TzdZRG85Q1AxNHV5MHJaZGpYUGpKQ3hh?=
 =?utf-8?B?Y3d5b0VDcnhFbmhJR283bEczc2RqNkZrZXRZRlVrd0lPM0tTa1ZlNHB2c2hU?=
 =?utf-8?B?cGlJcGtWMHFHMXR2cWcyZW1lUkNINEJ2SVpneDBoMEcwd2pIYm9EMHdmRWlv?=
 =?utf-8?B?Y3JCaFFzUEUwUWRLZUpLRmU1VEd2OSt5SHM4T0s4RlRqV3BnQWlpMFZLak0x?=
 =?utf-8?B?a25RWE9vb1Eyd0o0bWI5eHd4SVlkMDIzam1IZG03Q0ZDVzl6UVVPUWhwMjhz?=
 =?utf-8?B?WkF4eDdtZmhMQ2psM0pSOVJmdE8wWEZmeFV3Q2liWmIrc1V5eVFRSEsxa1Vm?=
 =?utf-8?B?Ymc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a391b345-01d8-46c2-b11e-08dc5a05c248
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 08:59:56.4347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YRaxEmV0wiBzV5zK7Q5nzrCtcP/5Inibq/GY+zpZ43yzwA/nHInMNIIAqP8VZLJECfgI3Hco7WlvX+S0Ii+PVtx2B/dMuHaQsyzHwYAa/Zk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8032
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2024-kwi-10 19:03:38 +0200]:
> There are few knobs inside GuC firmware to control VFs scheduling.
> Add basic functions to support their reconfigurations.
> We will start using them shortly once we prepare debugfs.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
> v2: use xe_map_memcpy_to, fix xe_device_mem_access_put (Piotr)
> ---
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 417 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h    |  25 ++
>  .../gpu/drm/xe/xe_gt_sriov_pf_policy_types.h  |  31 ++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |  21 +
>  drivers/gpu/drm/xe/xe_gt_types.h              |   7 +
>  6 files changed, 502 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index ad238f48cf51..3efec3315044 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -158,6 +158,7 @@ xe-y += \
>  
>  xe-$(CONFIG_PCI_IOV) += \
>  	xe_gt_sriov_pf_control.o \
> +	xe_gt_sriov_pf_policy.o \
>  	xe_lmtt.o \
>  	xe_lmtt_2l.o \
>  	xe_lmtt_ml.o \
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> new file mode 100644
> index 000000000000..3eaa17ca54fc
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> @@ -0,0 +1,417 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#include "abi/guc_actions_sriov_abi.h"
> +
> +#include "xe_bo.h"
> +#include "xe_gt.h"
> +#include "xe_gt_sriov_pf_helpers.h"
> +#include "xe_gt_sriov_pf_policy.h"
> +#include "xe_gt_sriov_printk.h"
> +#include "xe_guc_ct.h"
> +#include "xe_guc_klv_helpers.h"
> +
> +/*
> + * Return: number of KLVs that were successfully parsed and saved,
> + *         negative error code on failure.
> + */
> +static int guc_action_update_vgt_policy(struct xe_guc *guc, u64 addr, u32 size)
> +{
> +	u32 request[] = {
> +		GUC_ACTION_PF2GUC_UPDATE_VGT_POLICY,
> +		lower_32_bits(addr),
> +		upper_32_bits(addr),
> +		size,
> +	};
> +
> +	return xe_guc_ct_send_block(&guc->ct, request, ARRAY_SIZE(request));
> +}
> +
> +/*
> + * Return: number of KLVs that were successfully parsed and saved,
> + *         negative error code on failure.
> + */
> +static int pf_send_policy_klvs(struct xe_gt *gt, const u32 *klvs, u32 num_dwords)
> +{
> +	const u32 bytes = num_dwords * sizeof(u32);
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_guc *guc = &gt->uc.guc;
> +	struct xe_bo *bo;
> +	int ret;
> +
> +	bo = xe_bo_create_pin_map(xe, tile, NULL,
> +				  ALIGN(bytes, PAGE_SIZE),
> +				  ttm_bo_type_kernel,
> +				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +				  XE_BO_FLAG_GGTT);
> +	if (IS_ERR(bo))
> +		return PTR_ERR(bo);
> +
> +	xe_map_memcpy_to(xe, &bo->vmap, 0, klvs, bytes);
> +
> +	ret = guc_action_update_vgt_policy(guc, xe_bo_ggtt_addr(bo), num_dwords);
> +
> +	xe_bo_unpin_map_no_vm(bo);
> +
> +	return ret;
> +}
> +
> +/*
> + * Return: 0 on success, -ENOKEY if some KLVs were not updated, -EPROTO if reply was malformed,
> + *         negative error code on failure.
> + */
> +static int pf_push_policy_klvs(struct xe_gt *gt, u32 num_klvs,
> +			       const u32 *klvs, u32 num_dwords)
> +{
> +	int ret;
> +
> +	xe_gt_assert(gt, num_klvs == xe_guc_klv_count(klvs, num_dwords));
> +
> +	ret = pf_send_policy_klvs(gt, klvs, num_dwords);
> +
> +	if (ret != num_klvs) {
> +		int err = ret < 0 ? ret : ret < num_klvs ? -ENOKEY : -EPROTO;
> +		struct drm_printer p = xe_gt_info_printer(gt);
> +
> +		xe_gt_sriov_notice(gt, "Failed to push %u policy KLV%s (%pe)\n",
> +				   num_klvs, str_plural(num_klvs), ERR_PTR(err));
> +		xe_guc_klv_print(klvs, num_dwords, &p);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pf_push_policy_u32(struct xe_gt *gt, u16 key, u32 value)
> +{
> +	u32 klv[] = {
> +		PREP_GUC_KLV(key, 1),
> +		value,
> +	};
> +
> +	return pf_push_policy_klvs(gt, 1, klv, ARRAY_SIZE(klv));
> +}
> +
> +static int pf_update_policy_bool(struct xe_gt *gt, u16 key, bool *policy, bool value)
> +{
> +	int err;
> +
> +	err = pf_push_policy_u32(gt, key, value);
> +	if (unlikely(err)) {
> +		xe_gt_sriov_notice(gt, "Failed to update policy %#x '%s' to '%s' (%pe)\n",
> +				   key, xe_guc_klv_key_to_string(key),
> +				   str_enabled_disabled(value), ERR_PTR(err));
> +		return err;
> +	}
> +
> +	xe_gt_sriov_dbg(gt, "policy key %#x '%s' updated to '%s'\n",
> +			key, xe_guc_klv_key_to_string(key),
> +			str_enabled_disabled(value));
> +
> +	*policy = value;
> +	return 0;
> +}
> +
> +static int pf_update_policy_u32(struct xe_gt *gt, u16 key, u32 *policy, u32 value)
> +{
> +	int err;
> +
> +	err = pf_push_policy_u32(gt, key, value);
> +	if (unlikely(err)) {
> +		xe_gt_sriov_notice(gt, "Failed to update policy %#x '%s' to '%s' (%pe)\n",
> +				   key, xe_guc_klv_key_to_string(key),
> +				   str_enabled_disabled(value), ERR_PTR(err));
> +		return err;
> +	}
> +
> +	xe_gt_sriov_dbg(gt, "policy key %#x '%s' updated to %u\n",
> +			key, xe_guc_klv_key_to_string(key), value);
> +
> +	*policy = value;
> +	return 0;
> +}
> +
> +static int pf_provision_sched_if_idle(struct xe_gt *gt, bool enable)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return pf_update_policy_bool(gt, GUC_KLV_VGT_POLICY_SCHED_IF_IDLE_KEY,
> +				     &gt->sriov.pf.policy.guc.sched_if_idle,
> +				     enable);
> +}
> +
> +static int pf_reprovision_sched_if_idle(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return pf_provision_sched_if_idle(gt, gt->sriov.pf.policy.guc.sched_if_idle);
> +}
> +
> +static void pf_sanitize_sched_if_idle(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	gt->sriov.pf.policy.guc.sched_if_idle = false;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_policy_set_sched_if_idle - Control the 'sched_if_idle' policy.
> + * @gt: the &xe_gt where to apply the policy
> + * @enable: the value of the 'sched_if_idle' policy
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_policy_set_sched_if_idle(struct xe_gt *gt, bool enable)
> +{
> +	int err;
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	err = pf_provision_sched_if_idle(gt, enable);
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return err;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_policy_get_sched_if_idle - Retrieve value of 'sched_if_idle' policy.
> + * @gt: the &xe_gt where to read the policy from
> + *
> + * This function can only be called on PF.
> + *
> + * Return: value of 'sched_if_idle' policy.
> + */
> +bool xe_gt_sriov_pf_policy_get_sched_if_idle(struct xe_gt *gt)
> +{
> +	bool enable;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	enable = gt->sriov.pf.policy.guc.sched_if_idle;
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return enable;
> +}
> +
> +static int pf_provision_reset_engine(struct xe_gt *gt, bool enable)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return pf_update_policy_bool(gt, GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH_KEY,
> +				     &gt->sriov.pf.policy.guc.reset_engine, enable);
> +}
> +
> +static int pf_reprovision_reset_engine(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return pf_provision_reset_engine(gt, gt->sriov.pf.policy.guc.reset_engine);
> +}
> +
> +static void pf_sanitize_reset_engine(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	gt->sriov.pf.policy.guc.reset_engine = false;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_policy_set_reset_engine - Control the 'reset_engine' policy.
> + * @gt: the &xe_gt where to apply the policy
> + * @enable: the value of the 'reset_engine' policy
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_policy_set_reset_engine(struct xe_gt *gt, bool enable)
> +{
> +	int err;
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	err = pf_provision_reset_engine(gt, enable);
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return err;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_policy_get_reset_engine - Retrieve value of 'reset_engine' policy.
> + * @gt: the &xe_gt where to read the policy from
> + *
> + * This function can only be called on PF.
> + *
> + * Return: value of 'reset_engine' policy.
> + */
> +bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt)
> +{
> +	bool enable;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	enable = gt->sriov.pf.policy.guc.reset_engine;
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return enable;
> +}
> +
> +static int pf_provision_sample_period(struct xe_gt *gt, u32 value)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return pf_update_policy_u32(gt, GUC_KLV_VGT_POLICY_ADVERSE_SAMPLE_PERIOD_KEY,
> +				    &gt->sriov.pf.policy.guc.sample_period, value);
> +}
> +
> +static int pf_reprovision_sample_period(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return pf_provision_sample_period(gt, gt->sriov.pf.policy.guc.sample_period);
> +}
> +
> +static void pf_sanitize_sample_period(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	gt->sriov.pf.policy.guc.sample_period = 0;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_policy_set_sample_period - Control the 'sample_period' policy.
> + * @gt: the &xe_gt where to apply the policy
> + * @value: the value of the 'sample_period' policy
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value)
> +{
> +	int err;
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	err = pf_provision_sample_period(gt, value);
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return err;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_policy_get_sample_period - Retrieve value of 'sample_period' policy.
> + * @gt: the &xe_gt where to read the policy from
> + *
> + * This function can only be called on PF.
> + *
> + * Return: value of 'sample_period' policy.
> + */
> +u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt)
> +{
> +	u32 value;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	value = gt->sriov.pf.policy.guc.sample_period;
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return value;
> +}
> +
> +static void pf_sanitize_guc_policies(struct xe_gt *gt)
> +{
> +	pf_sanitize_sched_if_idle(gt);
> +	pf_sanitize_reset_engine(gt);
> +	pf_sanitize_sample_period(gt);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_policy_sanitize - Reset policy settings.
> + * @gt: the &xe_gt
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt)
> +{
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	pf_sanitize_guc_policies(gt);
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +}
> +
> +/**
> + * xe_gt_sriov_pf_policy_reprovision - Reprovision (and optionally reset) policy settings.
> + * @gt: the &xe_gt
> + * @reset: if true will reprovision using default values instead of latest
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset)
> +{
> +	int err = 0;
> +
> +	xe_device_mem_access_get(gt_to_xe(gt));
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	if (reset)
> +		pf_sanitize_guc_policies(gt);
> +	err |= pf_reprovision_sched_if_idle(gt);
> +	err |= pf_reprovision_reset_engine(gt);
> +	err |= pf_reprovision_sample_period(gt);
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	xe_device_mem_access_put(gt_to_xe(gt));
> +
> +	return err ? -ENXIO : 0;
> +}
> +
> +static void print_guc_policies(struct drm_printer *p, struct xe_gt_sriov_guc_policies *policy)
> +{
> +	drm_printf(p, "%s:\t%s\n",
> +		   xe_guc_klv_key_to_string(GUC_KLV_VGT_POLICY_SCHED_IF_IDLE_KEY),
> +		   str_enabled_disabled(policy->sched_if_idle));
> +	drm_printf(p, "%s:\t%s\n",
> +		   xe_guc_klv_key_to_string(GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH_KEY),
> +		   str_enabled_disabled(policy->reset_engine));
> +	drm_printf(p, "%s:\t%u %s\n",
> +		   xe_guc_klv_key_to_string(GUC_KLV_VGT_POLICY_ADVERSE_SAMPLE_PERIOD_KEY),
> +		   policy->sample_period, policy->sample_period ? "ms" : "(disabled)");
> +}
> +
> +/**
> + * xe_gt_sriov_pf_policy_print - Dump actual policy values.
> + * @gt: the &xe_gt where to read the policy from
> + * @p: the &drm_printer
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_policy_print(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	print_guc_policies(p, &gt->sriov.pf.policy.guc);
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> new file mode 100644
> index 000000000000..2a5dc33dc6d7
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_SRIOV_PF_POLICY_H_
> +#define _XE_GT_SRIOV_PF_POLICY_H_
> +
> +#include <linux/types.h>
> +
> +struct drm_printer;
> +struct xe_gt;
> +
> +int xe_gt_sriov_pf_policy_set_sched_if_idle(struct xe_gt *gt, bool enable);
> +bool xe_gt_sriov_pf_policy_get_sched_if_idle(struct xe_gt *gt);
> +int xe_gt_sriov_pf_policy_set_reset_engine(struct xe_gt *gt, bool enable);
> +bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
> +int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
> +u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
> +
> +void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt);
> +int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset);
> +int xe_gt_sriov_pf_policy_print(struct xe_gt *gt, struct drm_printer *p);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
> new file mode 100644
> index 000000000000..4de532af135e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_SRIOV_PF_POLICY_TYPES_H_
> +#define _XE_GT_SRIOV_PF_POLICY_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +/**
> + * struct xe_gt_sriov_guc_policies - GuC SR-IOV policies.
> + * @sched_if_idle: controls strict scheduling policy.
> + * @reset_engine: controls engines reset on VF switch policy.
> + * @sample_period: adverse events sampling period (in milliseconds).
> + */
> +struct xe_gt_sriov_guc_policies {
> +	bool sched_if_idle;
> +	bool reset_engine;
> +	u32 sample_period;
> +};
> +
> +/**
> + * struct xe_gt_sriov_pf_policy - PF policy data.
> + * @guc: GuC scheduling policies.
> + */
> +struct xe_gt_sriov_pf_policy {
> +	struct xe_gt_sriov_guc_policies guc;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> new file mode 100644
> index 000000000000..768277b8bc95
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_SRIOV_PF_TYPES_H_
> +#define _XE_GT_SRIOV_PF_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +#include "xe_gt_sriov_pf_policy_types.h"
> +
> +/**
> + * struct xe_gt_sriov_pf - GT level PF virtualization data.
> + * @policy: policy data.
> + */
> +struct xe_gt_sriov_pf {
> +	struct xe_gt_sriov_pf_policy policy;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 2143dffcaf11..882953d9b87d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -8,6 +8,7 @@
>  
>  #include "xe_force_wake_types.h"
>  #include "xe_gt_idle_types.h"
> +#include "xe_gt_sriov_pf_types.h"
>  #include "xe_hw_engine_types.h"
>  #include "xe_hw_fence_types.h"
>  #include "xe_reg_sr_types.h"
> @@ -140,6 +141,12 @@ struct xe_gt {
>  		u32 adj_offset;
>  	} mmio;
>  
> +	/** @sriov: virtualization data related to GT */
> +	union {
> +		/** @sriov.pf: PF data. Valid only if driver is running as PF */
> +		struct xe_gt_sriov_pf pf;
> +	} sriov;
> +
>  	/**
>  	 * @reg_sr: table with registers to be restored on GT init/resume/reset
>  	 */

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
