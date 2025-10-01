Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2107CCA470
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 09:44:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806D210E33F;
	Wed,  1 Oct 2025 09:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cxm1Mpti";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9116E10E33F
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Oct 2025 09:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759311891; x=1790847891;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vfweT7UTnFrUBNa9ObjzMleavDpygbrpV/w/VFMx4+0=;
 b=Cxm1MptieehnWXOFowTH9RtnRgu604dB5JzQ0orhHrJD6iCAPoTuxfv8
 hEOniirNMUi88/1fefhqDwPG3C00NzC40h1moX+RbzcmlSWPr9Pre98ha
 FZcKLw/lTD9qmed5HyehPiPZoD5gFf48VrYeJgmbJ/K9yoZhjQGqBx8ar
 IsBqfhiU4PhC0KSghR5B/9sjoBcF4m026FmOg2e83Qt9ju1Tvt8Mz7nRn
 yW76IkDxmS96qTrUPQvMwUIdgePShvAx4dSD4XwXWfjOpDS6R/mhcv75y
 ZfqNEK6An1XXu/KUemznnRz/up1fGByklIVZKfH+jphV29witN6o9Njzt Q==;
X-CSE-ConnectionGUID: Sx3CG4KRS6e7S1RY5L4e5w==
X-CSE-MsgGUID: Y+baP7MhSbu1XBaXWprSBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="79232278"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="79232278"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 02:44:50 -0700
X-CSE-ConnectionGUID: itPkVSxoTWWWOWkLWXk9vw==
X-CSE-MsgGUID: u20A+QKMTKWW8ekIJpmiCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="182771775"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 02:44:50 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 02:44:48 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 1 Oct 2025 02:44:48 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 02:44:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zzy7uabvYD6f2QCOWx10K0PwXr81VVLoBZ2w3jVTMz9i2rqwdg5BL7A/oI4UXrnEXaUCUGaukj2JLuXR+DPfEDtNT/8Tu5K4DxgmqbRVrC/dTNo2DyYy2WvKRU30i2P1iUuaI6NVHiwIFGGQdRhbISqQD0Nw7x1yGW1FuNrgdU77vYyAubacU/uRxAE9reoLCLSuQMI5Y3ZYKu7I7TogZhEoCvMAa7TwNLzJSt/AFxUj/TXr72aGZd4KJZCxf/eYlZQES/rNas/zlp32iksdHev7Xe1ZO2XKG2wZCxukEJA3w4k2gHOpfMSVtYAyit7BXII8Qb+NfaUQ03FbWb160g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iOmqZ2WfW9TOLLjAb2NWR2djaPszA+PPhT3ozpaIubc=;
 b=FTCXLD3pweL/MFoSGys5b8Zv/4uN6EhokJrDgJhloXNqRgcsaazWN1+yuTIaTSLfZxwI1XY1MzkltwTUfOUbimATmT7RNOggNXfX9gKZVwyr1EceQa6/cBppV5avk8TB/4jGXRjaBF2PrhVFgtTvgoBupS58M4aYoWGdn+f3ZSzJpJiRbBFy7k++oWPjs/VvUmAW5ludHQSfj55lrSd/6x7VKGAu4+bTizb2yfr1zH+nE+uoZGKmYFdcmKivQ+kaXWppBddvJXGUywyogVTOWy2ZbAqD32QxEkyZZvrAM3XyZCvVZ9w9HnAFCGfwas3hp0YqD7DBPgJFiLpR5zjI+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB6024.namprd11.prod.outlook.com (2603:10b6:408:17a::16)
 by PH8PR11MB6854.namprd11.prod.outlook.com (2603:10b6:510:22d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 09:44:45 +0000
Received: from LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::dc22:ef1e:53e2:f00f]) by LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::dc22:ef1e:53e2:f00f%4]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 09:44:45 +0000
Message-ID: <43c824c1-dbfc-48b1-9c90-389e3bf24c9a@intel.com>
Date: Wed, 1 Oct 2025 11:44:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/23] drm/xe: Move 'va_bits' flag back to platform
 descriptor
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250930225618.140071-25-matthew.d.roper@intel.com>
 <20250930225618.140071-28-matthew.d.roper@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250930225618.140071-28-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P191CA0012.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::15) To LV2PR11MB6024.namprd11.prod.outlook.com
 (2603:10b6:408:17a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB6024:EE_|PH8PR11MB6854:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d3b2b99-3e34-4c80-570c-08de00cf275f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEU1Q055SU5QbTAzS1pnWlVwS3c5YUcvRDlJTWJvdDZGbFFXL2lqREU0bXhq?=
 =?utf-8?B?UU5WanJTdVVIWFdCakxvbWNJd2F4UVdTZ2ZSRURUOEwzeGJMZUs3UEJwUDRJ?=
 =?utf-8?B?T3RNbkpqQit5VlRSeTZwYlRTaEIrbCtWb2NDT3MwNUlWRDlsMXFBQllvczRL?=
 =?utf-8?B?b0lqQWJKQTdPSVZkajZVZ2lIVzBPSE44dzd3cWFiU1M1ZVZKZUorMENXOG9C?=
 =?utf-8?B?SUk5ODJyQUdOV0tJYjVBcG04NHgrNlNaN3NQaVpuVHFpL2tMa1h4WHE2Ulpw?=
 =?utf-8?B?UXQxN2hlcXZDVW51TUlYcGdpVkFpTHJJMnJVS0pJQ2RCK1V6aWNxalU0K0VH?=
 =?utf-8?B?N1VNUkZ1MHpPQWhyRmVQaCtMNTRZZnVLU1NJVllGY3FZUHN4bEdObUFOMG5T?=
 =?utf-8?B?QUVVVVloYXZ0WXplMElJM0V5azl6L2l3MHpmVTdiRWpRR2w4YzJXWEVKaXB0?=
 =?utf-8?B?RlRmOE8rRDg1SnNrTFRzT25ZVFJncUYraCtMcjBCMmJUTDJJaUo3RUZHL1Fw?=
 =?utf-8?B?dEVnVmI1V0RINEFwMDF4TmVVbCtRekZpUm1QSzFOQ0oydUNCUzAwREhYRnl1?=
 =?utf-8?B?S0VTS2l0ZEZUNFFUaWg2a3J1ZlcrcnFUQ05TNlZRRDVyRlRWeWt6S3A1QThh?=
 =?utf-8?B?VUErUXNTeVF3aVA1cXBSbkw3TEE1UFZRaDJMREE2VGU2QkErbm5mTFIweVh6?=
 =?utf-8?B?aXorSmZkTG1PeDB0ck5uRXhna2daQ3VoNjN5SHZpZHV5OXdEMytJeEdaR1I5?=
 =?utf-8?B?NW42M3NSNTZDVFdSdWFmNFhheXg0TlFOM293THhTQis1SGIvMmVac2REOU1m?=
 =?utf-8?B?UTJXYWg3SURTTUowdXh0TldPckdWcUJ3ejRKMzNTV0prZzlvQzU1eTREa3Jv?=
 =?utf-8?B?WFhqUkF4RGNuengxUGhSaEVkRXFab0FjTVBvY2N2UExURlh3dnFLVzZoaThp?=
 =?utf-8?B?cmxrQW1UWWQxMTNnZ1MybEFpRFBtL2xwOGdjOVZENGNRVGNpeVdDRzJ1czdw?=
 =?utf-8?B?RkNHcGl5dlpCckNONFlCbFp2aXNzNk8rNXZGTE5GNExzUWtTai9YaDJyak43?=
 =?utf-8?B?aGV0Skpxajd2RzJWdmtwU3oxTzVFdjB1UmFsSzZMMEF5OEFEaUlpMitRckhF?=
 =?utf-8?B?RlFFUzUwVzczbFhadzZCc2NRSDdYNnc2NU80OEpTUnVBWkNXcUFRWkU1UGV3?=
 =?utf-8?B?TzdvMEJCTmkzZTBMREFHY1VTb1NpbHh5VFVFcmZCVW9hdWF3Q1JYc1NDVStk?=
 =?utf-8?B?U1hNQi9DM1FzNWYxVEY5TlJKQWtWWUVucGJlVGVqb0FLdUNVTGcxTXZtVjJo?=
 =?utf-8?B?MGpBNkxmdFVyVmhLdVprVGNmY01EQy81dVp3ckVxcUthL3hsZi9oL0U1WG1s?=
 =?utf-8?B?NkdxejFjMGNkN1hldzJwaSs4cG5kbDQ0UWlESlRuUDlFS3pwUmVud2pTK0Vv?=
 =?utf-8?B?THdmL1FLOE9xajByUXJuejVkMjRYYXhobWxzWFd6YXNraFpuelVvclh2akZ3?=
 =?utf-8?B?Z2Z4YlhzeXVaT2VqZnFHOGp0MjBueVduNHJkM3hUY0ZncjdrNG1yMW45MzNW?=
 =?utf-8?B?VjFOSVdXSTYrbDk4bkZOWWhlSzRQQ0FWL3lpcENPcHN5bXZCbmFmM3gyQWxH?=
 =?utf-8?B?YzNhQnFEMkd0NXpmRTYxUkZET211M294Y0F2ek5XNnVyaXQ1c1lkTUdtV0s2?=
 =?utf-8?B?TzRNNmVBV25Bem94c0sralJmS0dFL1FpZ1dMZDdjZXpOakJ2R3dXQldGbXYx?=
 =?utf-8?B?bXVMc1FHZ0hjcDZkVU41UlorRjdKdXRVRkVpRDA4amZKbzAvNkplRDAyeGRN?=
 =?utf-8?B?NFR2bk8yUVZreVhWL2Qwa3JzM3Y2NU5VcC9hU1dheFJyS1d3WnZnemtBZDh6?=
 =?utf-8?B?cjhHRGJmOUZJRjk3bFY1amU2T2Fpa0lUcmdYN3lCVXBZQm12RmZQWHM5RmFx?=
 =?utf-8?Q?Ms6y4P8MqQJAp4Xmh0+hbGAh5Kk5ZD0a?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB6024.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHIrWVlhMmR6cVZKcUUweWNXbFRpYll1QTdTeGJWQW53OG5zeFhDVm9mMStT?=
 =?utf-8?B?VVlaTURoWGxvcnZrWmlkeFEvcC91M3MxVEdqNWk4NkM0QlQyYjBzcHB2bzFI?=
 =?utf-8?B?UjJqMHg5VEZRc3ZZVUw0YnlEaHlqWE5nVlJpSy9WWGkwZzczUC9CY3lRcFpi?=
 =?utf-8?B?b2xuUkk3ZkpkMjBQSFBSZ1kxZWppa29QcDVBZDVUcVJEZ216NmZKMDlxaWxL?=
 =?utf-8?B?NkxKR2J2cVRyRmpSYmRld1pBaXFiNFE0Q3FxZ3NDYlpPczRvMGo5OWcwS3Zh?=
 =?utf-8?B?S0hndlZOQXpmVjVTbHc1TXQxc0tUeUZyak9kSmtET09vOURENFBNcE5nZktK?=
 =?utf-8?B?OU9HRm1RWjRHQVhZaFJDS2k2YmQ0OW8rSDNUcXNYTnV2SWFucWduM1FrcThj?=
 =?utf-8?B?VTJUSmFKS21MYWhCeTVHdVU2a3pqOGgzS0p3UXJWUmNoVWpCSFdrdlEyK2cw?=
 =?utf-8?B?Q2lxeWlWTUg1ckpBZDN1MkM5VldyRCtKT1JGMUl5dVJQcy82VHo0empCM1VN?=
 =?utf-8?B?NUtjNitEMC9CUkRmejBxbXI3SXhmVjY1a2RLaHpJc3hrZjI5Nm00MC9kL3dU?=
 =?utf-8?B?ZlB1VzVZNXRzTDVONnljSUpkTE02aE9KeFFvR1cxWDA5ekRNS1l3cm91UGI0?=
 =?utf-8?B?UVZseFhIc1hCVjlsUkhQYVpkS2xNY3pVSGtlZWFpamJONkc0NzJlKzNZK09q?=
 =?utf-8?B?aHdJOW9YakdHWHFHblR2cmRBUllkbVMrZlFWdzF1VnlsOGI3VkJHUEhFcjVP?=
 =?utf-8?B?R2lkek9KOUpiOTRpWWoxMnhMRFFYWVN6UmZmazZXR1JxTVpWcE1pcmg1bzNl?=
 =?utf-8?B?ZzM0SW5yUmwrZWFnVlVNc2NwN09pZEVJVWhQUzFFWXdFT2sxekplTjhFaXVT?=
 =?utf-8?B?clBxNmRqWTRKNG4yUTlEZUN1RWMwQjB5WVVWMm8yN3RYS1dUZXJoeHJyQXpO?=
 =?utf-8?B?TVJMYzE4T1BzdE8vYlFiWHpFRWw4RS9Wak9NRXJUMlJSMFVBTTJtbXhkL0RK?=
 =?utf-8?B?bEQxZ1RaU0xLVFFlR3o2Rm1VSVY1VHFMMG5QejA0SVV5UEE4NFE4TTRkV3M2?=
 =?utf-8?B?aWY4byt2cU5LNXBHeDRVWXpqTHlIeVR1dk5CbUlCL01tWEJaRmZJNzNqV1hF?=
 =?utf-8?B?aXB0by9qeGVYdWxWRlRMdnFEek5YaVNFRFhvMEdZMWw1N0Y1VFNlZjdETnEx?=
 =?utf-8?B?ckNNR2JSd2puTW8zaGI3ZEUwZWFnWnNGTU9uTUVZYlMvSkhMVDZhS1dYRUhP?=
 =?utf-8?B?UVZaWWFBR3Y0TjFyVXhaSDFJN21ZRkJhVVlPNFY4SkJJQm9DdWRHVCtESExD?=
 =?utf-8?B?MDNub0JmS3NKcU5odHUxYnVnSnY0d0hZL0ExMDhaeFFaK2dudFJxaThUUFlP?=
 =?utf-8?B?WGthRHhTVm84UjJiWGVmT0gzYVBGZVZsNmJVbHRWMVMwaVdxTURSdXoyTjRW?=
 =?utf-8?B?a09haXRIc25TK0RiNGMwL3RtL2hmMElIZDhORlFtVmlDTjVnM3k3MHBLemt0?=
 =?utf-8?B?VmNWV3Y0VXNVY3hvSmVpcEx6T3pUOVlVUFJ0SExCT1RmODc0S0xrblpXWDN6?=
 =?utf-8?B?VHlkQzluR3Nla1ZFTUJsaVdlSDdTS1FQN21pZmVMRlZ3TkRHNDBBNk1HOHFx?=
 =?utf-8?B?cWZtdTZ5a25TMlBWeHpNMlYwRHNvU3JaN3l6Y3JDSVVlajgxSkR4Nys2MXEw?=
 =?utf-8?B?V3J6Rk51VjQ3RHVkU1RLcDFNcUFyeWdPZ3FOUlUrUHIvL2d2TTFqaUdoNHJw?=
 =?utf-8?B?TVRsUjNiTnRXSXVrTUVxRHpNSTMrUVN1RGtFUGV1Zm8wWm81bmd5SDAzblV3?=
 =?utf-8?B?U3VCblNYZFY5MDg3ZGxFcGd2MzQzNjQyV3NWRUtRK0JFdVRRN25GNjZaM01Z?=
 =?utf-8?B?VkJ6aEZZeEZXcWw0aWtjcjZJdTNsSEVtV2dFVHNucmx6dEM4YVdhdElpaDNv?=
 =?utf-8?B?T3pOTUJWL2dVczJBSW9EOVhHWVR6YXhSYnlsaEpsZkw0eHc2SWF2bVFsSWli?=
 =?utf-8?B?OVZUVXFiRFlla1RnQmpZYU85UTh5K3lHMzlHZnhVV1pIN1dZTzE1ZWFkUmxT?=
 =?utf-8?B?Q3NxcUFYT213bzZVcndOS1piaDNpM3E4Um45RGhxRWVYa1pjOEl6NEk2K0cr?=
 =?utf-8?B?Z3Y3d1pjM1NSOGRqaC96Z00wL01ya0ZkKzhWeTZFOFI2ZFFqR2JsSTFZandt?=
 =?utf-8?B?MEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d3b2b99-3e34-4c80-570c-08de00cf275f
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6024.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 09:44:45.4647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MrsyC0fkRuuTvwO98x/hq8QW8/BQGpCJUsqoGI9NptTjUar+gnmHbd1gBakOsiRwuqNKSWrDMvlay833U/PbQwERlyTrgMUbmi8D/Wp+ZTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6854
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



On 10/1/2025 12:56 AM, Matt Roper wrote:
> The number of virtual address bits is something that should be tracked
> at the platform level rather than the IP level.  Even when mixing and
> matching various graphics, media, and display IP blocks, the platform as
> a whole has to have consistent page table handling.  This is also a
> trait that should be tied to the platform even if the graphics IP itself
> is not present (e.g., if we disable the primary GT via configfs).
> 
> v2:
>  - Drop the default value of 48 and explicitly set it in each relevant
>    descriptor.  (Lucas, Michal)
> 
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c       | 21 +++++++++++++++------
>  drivers/gpu/drm/xe/xe_pci_types.h |  2 +-
>  2 files changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 3f42b91efa28..69ed987fef67 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -52,13 +52,11 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
>  static const struct xe_graphics_desc graphics_xelp = {
>  	.hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0),
>  
> -	.va_bits = 48,
>  	.vm_max_level = 3,
>  };
>  
>  #define XE_HP_FEATURES \
>  	.has_range_tlb_inval = true, \
> -	.va_bits = 48, \
>  	.vm_max_level = 3
>  
>  static const struct xe_graphics_desc graphics_xehpg = {
> @@ -84,7 +82,6 @@ static const struct xe_graphics_desc graphics_xehpc = {
>  		BIT(XE_HW_ENGINE_CCS2) | BIT(XE_HW_ENGINE_CCS3),
>  
>  	XE_HP_FEATURES,
> -	.va_bits = 57,
>  	.vm_max_level = 4,
>  	.vram_flags = XE_VRAM_FLAGS_NEED64K,
>  
> @@ -108,7 +105,6 @@ static const struct xe_graphics_desc graphics_xelpg = {
>  	.has_range_tlb_inval = 1, \
>  	.has_usm = 1, \
>  	.has_64bit_timestamp = 1, \
> -	.va_bits = 48, \
>  	.vm_max_level = 4, \
>  	.hw_engine_mask = \
>  		BIT(XE_HW_ENGINE_RCS0) | \
> @@ -174,6 +170,7 @@ static const struct xe_device_desc tgl_desc = {
>  	.has_sriov = true,
>  	.max_gt_per_tile = 1,
>  	.require_force_probe = true,
> +	.va_bits = 48,
>  };
>  
>  static const struct xe_device_desc rkl_desc = {
> @@ -185,6 +182,7 @@ static const struct xe_device_desc rkl_desc = {
>  	.has_llc = true,
>  	.max_gt_per_tile = 1,
>  	.require_force_probe = true,
> +	.va_bits = 48,
>  };
>  
>  static const u16 adls_rpls_ids[] = { INTEL_RPLS_IDS(NOP), 0 };
> @@ -203,6 +201,7 @@ static const struct xe_device_desc adl_s_desc = {
>  		{ XE_SUBPLATFORM_ALDERLAKE_S_RPLS, "RPLS", adls_rpls_ids },
>  		{},
>  	},
> +	.va_bits = 48,
>  };
>  
>  static const u16 adlp_rplu_ids[] = { INTEL_RPLU_IDS(NOP), 0 };
> @@ -221,6 +220,7 @@ static const struct xe_device_desc adl_p_desc = {
>  		{ XE_SUBPLATFORM_ALDERLAKE_P_RPLU, "RPLU", adlp_rplu_ids },
>  		{},
>  	},
> +	.va_bits = 48,
>  };
>  
>  static const struct xe_device_desc adl_n_desc = {
> @@ -233,6 +233,7 @@ static const struct xe_device_desc adl_n_desc = {
>  	.has_sriov = true,
>  	.max_gt_per_tile = 1,
>  	.require_force_probe = true,
> +	.va_bits = 48,
>  };
>  
>  #define DGFX_FEATURES \
> @@ -249,6 +250,7 @@ static const struct xe_device_desc dg1_desc = {
>  	.has_heci_gscfi = 1,
>  	.max_gt_per_tile = 1,
>  	.require_force_probe = true,
> +	.va_bits = 48,
>  };
>  
>  static const u16 dg2_g10_ids[] = { INTEL_DG2_G10_IDS(NOP), INTEL_ATS_M150_IDS(NOP), 0 };
> @@ -265,7 +267,8 @@ static const u16 dg2_g12_ids[] = { INTEL_DG2_G12_IDS(NOP), 0 };
>  		{ XE_SUBPLATFORM_DG2_G11, "G11", dg2_g11_ids }, \
>  		{ XE_SUBPLATFORM_DG2_G12, "G12", dg2_g12_ids }, \
>  		{ } \
> -	}
> +	}, \
> +	.va_bits = 48
>  
>  static const struct xe_device_desc ats_m_desc = {
>  	.pre_gmdid_graphics_ip = &graphics_ip_xehpg,
> @@ -303,6 +306,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
>  	.max_gt_per_tile = 1,
>  	.max_remote_tiles = 1,
>  	.require_force_probe = true,
> +	.va_bits = 57,
>  	.has_mbx_power_limits = false,
>  };
>  
> @@ -314,6 +318,7 @@ static const struct xe_device_desc mtl_desc = {
>  	.has_display = true,
>  	.has_pxp = true,
>  	.max_gt_per_tile = 2,
> +	.va_bits = 48,
>  };
>  
>  static const struct xe_device_desc lnl_desc = {
> @@ -323,6 +328,7 @@ static const struct xe_device_desc lnl_desc = {
>  	.has_pxp = true,
>  	.max_gt_per_tile = 2,
>  	.needs_scratch = true,
> +	.va_bits = 48,
>  };
>  
>  static const struct xe_device_desc bmg_desc = {
> @@ -338,6 +344,7 @@ static const struct xe_device_desc bmg_desc = {
>  	.has_sriov = true,
>  	.max_gt_per_tile = 2,
>  	.needs_scratch = true,
> +	.va_bits = 48,
>  };
>  
>  static const struct xe_device_desc ptl_desc = {
> @@ -347,6 +354,7 @@ static const struct xe_device_desc ptl_desc = {
>  	.has_sriov = true,
>  	.max_gt_per_tile = 2,
>  	.needs_scratch = true,
> +	.va_bits = 48,
>  };
>  
>  #undef PLATFORM
> @@ -584,6 +592,8 @@ static int xe_info_init_early(struct xe_device *xe,
>  		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
>  
>  	xe->info.dma_mask_size = desc->dma_mask_size;
> +	xe->info.va_bits = desc->va_bits;
> +
>  	xe->info.is_dgfx = desc->is_dgfx;
>  	xe->info.has_fan_control = desc->has_fan_control;
>  	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
> @@ -713,7 +723,6 @@ static int xe_info_init(struct xe_device *xe,
>  	}
>  
>  	xe->info.vram_flags = graphics_desc->vram_flags;
> -	xe->info.va_bits = graphics_desc->va_bits;
>  	xe->info.vm_max_level = graphics_desc->vm_max_level;
>  	xe->info.has_asid = graphics_desc->has_asid;
>  	xe->info.has_atomic_enable_pte_bit = graphics_desc->has_atomic_enable_pte_bit;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 9b9766a3baa3..095133a1aa44 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -30,6 +30,7 @@ struct xe_device_desc {
>  	u8 dma_mask_size;
>  	u8 max_remote_tiles:2;
>  	u8 max_gt_per_tile:2;
> +	u8 va_bits;		/* default is 48 bits if not specified */

this comment is n/a anymore in this ver3

btw, maybe we want to add kunit test to make sure all descriptors
have va_bits defined ? or other mandatory fields ?

otherwise LGTM

>  
>  	u8 require_force_probe:1;
>  	u8 is_dgfx:1;
> @@ -51,7 +52,6 @@ struct xe_device_desc {
>  };
>  
>  struct xe_graphics_desc {
> -	u8 va_bits;
>  	u8 vm_max_level;
>  	u8 vram_flags;
>  

