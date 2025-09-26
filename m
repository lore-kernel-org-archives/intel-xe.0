Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A142CAC5B8
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 14:46:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C768910E08B;
	Fri, 26 Sep 2025 14:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LXtZghmP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E9010E08B
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 14:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758898012; x=1790434012;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lK09UWiz3L/ck5yD1PNucuZwCtKRx5Q3DTpEdwazEm0=;
 b=LXtZghmP97/me/IgwCAfMbRUC9ca1PFN5KtBs0cOrpx8GeiAfOssyrYk
 eaN1qQC+uGeZZ1VHclhXrxZwrVoZ1bTkZqIK6w6IW3xEiRz2xg9aTbADh
 J6XG7tBgoUqL3FPagouQyq3SKhG+LGzomKYzjFbY7pRJMxzbHdwvwhMbV
 HE+/3qWgWiMxOrLCBii4mNWRMRTvhm9GHcMwt2cEx7/4La4/yscDhhk/l
 H5JVWCzkYv0cyhkWut5tKpPx/oMBWZmHQP3MGpujo/z8VLIrUPuHjRazL
 QXQ1w0dguiPXNuYn0WkYJYMOmWOznWTLEJpkkkx3EySeJtExxMdtaNzeo g==;
X-CSE-ConnectionGUID: K5Oi2HHmTc23kRmejr+6eA==
X-CSE-MsgGUID: Thl0Haj9QNmKbOspLN+svw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65043827"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65043827"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 07:46:52 -0700
X-CSE-ConnectionGUID: /UCt6dcPQQaeCLNRRtBcOg==
X-CSE-MsgGUID: 6Bmnx6xIRsaMIAys8mVClQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="182795124"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 07:46:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 07:46:50 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 07:46:50 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 07:46:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZxhazxhS66gUsqJvJYUp/8JbCP/aSmLl/xy/49yMTrZiuAL8glD9fW+NZc/DWMzNiTopmP567fhqm7LwOsH1lGxrsECKzyfgjEg7amhHZjLEHNxIIHpYWhzkD9YWne6DdPUJbfMo9lm08mcbznCHV8Te5kybQrEUkin7ZAJwz9YpgGnrrCxFoo5VGDS0gdqdVMMCHIZOvZvELRRmh2q2a4989nYCAASjw/jVAUea4hvEykcfX4mFkCUt3CCbta7liY9b+9kdmN0fLWZczwlcaS4su7E8ycn0B3oNCcekzSJG93Fbf6Pe5/p/HfqV0OMflQthSmUcs0NuznG1rZ9HQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CGbNYaKyup8Fe0IrSRvkWmE2XCWjbMAtb0y2UDu+JWs=;
 b=KaNmFgtCKtb6QwoflnpnzLPf+Lw0QAAphHdsCl3RK74mbhCPpuiOGh/4JnBMpvzMt87a7mwsyMLSvmcHAmF7/iMOdOKYQ0lq7ZJw8AwpgRyvicSsxy6xnJkIqpLg56LSINBk/CmaJEaxEAP1yssvaGPHfTlGcubaHbdKK/UcCpN3bdqc/fqsqqKt8F4ui7AMa3/uMMcW8eLiECHTzR8/8sjT3FMeSnHNpeDKS7S5k4Hr9ZSViJ5VjVCB/J0TuJKLupqppQTUkQ/mBM1E2DmYd+O03ryy2edxOsWvOEo2wtEdR90j8PtUFdAXtmi7m18Gt8Rp/GLcbRt0rQkMYcepxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5239.namprd11.prod.outlook.com (2603:10b6:208:31a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Fri, 26 Sep
 2025 14:46:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 14:46:47 +0000
Date: Fri, 26 Sep 2025 09:46:44 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 4/6] drm/xe/pf: Move SR-IOV GT debugfs files to new tree
Message-ID: <atqhpevxjxq2fuimjgvjnmeuzemgrqe7at37wijukar7nsu5ao@7hdkolhjrxys>
References: <20250925220425.196860-1-michal.wajdeczko@intel.com>
 <20250925220425.196860-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250925220425.196860-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR02CA0007.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB5239:EE_
X-MS-Office365-Filtering-Correlation-Id: a5038196-5886-42fb-3f90-08ddfd0b84a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZXhEeGppZEljSVVwZVVjeGdTajlrVXBXUFJkcENhRjRKWGF4M2xIWkdrSzhP?=
 =?utf-8?B?elRvVjhPUXVTbmtUamU5emZtMEhoQkc2Mmg1cUZVRkd0WEdmZFRlaUVXZk9y?=
 =?utf-8?B?QmxMdXMvbUkyQlVQKzJiTzZWWWtxS3hJZjBXOGI4cHA0eWZqRTlzQzdSOXNQ?=
 =?utf-8?B?eWhJT3U2ZFpsV3JHSWhlQVl3cyszaDVCRlZLOFVBWU16M2p0YklPcW1VL2xy?=
 =?utf-8?B?MWoxOHpCTHRwTHV2dXMxL09BelI5dUJIanhucWg3T3A5OGorZ00vM05reXhF?=
 =?utf-8?B?R3JDMkkxQ3dBVk82bEZNUTNmZ00zVzBQdFBzbjcwbDBlMndITGdIWjhXR2Yr?=
 =?utf-8?B?UUoxR0pNSHdib21QbFhEeUhzR0twcThrUElzTGZUSGVNSCt2cS8vUFJMcG14?=
 =?utf-8?B?eTZjM014ZEpRNGhhN2R3b3RDYVZ0SnhGd01NTXR1c2JiOVFYQ1dNTlVCU1JY?=
 =?utf-8?B?cFZ3K1AxWEJ2dDdDMFljSWh3aEFuc2hsdDBwT2YyR0xQcmVEWlFJbFh3Y3lJ?=
 =?utf-8?B?VHpGdEdzRm91RzFhZWxTbXdHTmRuY0Rpc21JdDU1L1d5VE9YVk1VTWUvbU5k?=
 =?utf-8?B?c0Yva2pIN0pmUUNYaU1iNkI3Q2lSL1M2ZmpkakpoUGVoQkJqeWdVRDExOCtS?=
 =?utf-8?B?MFhrTFhhT05ENThuQXVmM3dmODVYRXhXYW5pZ0gvQ1dvSWc0b3NHSnEreFNn?=
 =?utf-8?B?cTQxOFJrRFdQWG55aVRubjNkeDVGL3ZIZDU1MVVnY0VqalhuaUNDeEpGSjAy?=
 =?utf-8?B?QTZDV29CcFM1KzdoakFFOExDa2lvT1ozSCtKUkZHTFpVa3UxNnU1NzViYzFK?=
 =?utf-8?B?OUpCM0p6MXovUUpEUmo3QUk4L092NGpHNHNDUEx1Sk5wYk8wRS85SnFQZHAv?=
 =?utf-8?B?ZjNMTThsTnd4UVdTalEzWEhOK2R4dVZjRTRpa2VZbXNNMWhsbzZZU0lMMGZp?=
 =?utf-8?B?d0VDQmNIVE9memNMWE9TQzRYaWlJWW80T3BFVGVpczV2UUpQUnFsTWQ5cVc0?=
 =?utf-8?B?UU9hVnZGdnFTb1licUk0VXA2Qi9VczA2ekpjTTFWTTgzdkVnWGp5YW92UFQw?=
 =?utf-8?B?K25WbDluR2JUOWoralloK3daQnl0a3U4Vm1aQnFHU2w2bG41TnU2cVFOWEhW?=
 =?utf-8?B?KzJrYjhmVWs3eDV4THh0WUozeE5GNkoxRThJSXh6S2JXaDN4Ym5aQzUybXFQ?=
 =?utf-8?B?ZUVqdlFhZElHU0p5eklMTmRiQ05tdG1aUFY3cFFEY0hyVWQ4b0p6WkZSRlkv?=
 =?utf-8?B?RzByazlTMjc0ZGxWTjVPclBvZDZwM3h0NFNQcXhNR1BNY3BIZERyNWFDQTJa?=
 =?utf-8?B?dEdnZENUejFZTVFkN3RIZWx4R0VESWhPaGw0RGNXSHFEZzZtZDEyWGNjb3Mw?=
 =?utf-8?B?RGl5cVh0WCtTYXh3ZlZVdzdyOWhvc3BGU1JPZ254Z2lqY2NoUDJqU1BhbGty?=
 =?utf-8?B?MjdNai9peTYzQ1QvMUs0MEFVSFhSOWpuTk93N3hkTm1xR1ZFZGk5K1RacUlK?=
 =?utf-8?B?UnNIaFFOTWJwbUllMlZ5TktjcTlCQ1NaeEROYThoUENTVWg1YlRka1JUajZv?=
 =?utf-8?B?R3Iya255V2R5NUN0S3JET3RjR1htZlVTTGVLSE1Pd0dDNGN1dDZhVE50eU9i?=
 =?utf-8?B?YVBFamtqQWVwcStJWmVya24wUUwyK21QcVZWUGp3OEwwQzFVSWpIenFQYWpU?=
 =?utf-8?B?TUtCZWVCOURIR2ZWOFZPeGU5Z0IwdkJ3dHV6UnZ2U0k2RndaWVBVc2txeUxP?=
 =?utf-8?B?cE1kU2wvNmtSM2t2ejZMSWs5NWZ5eGR1NkE0N050RndJc1JKeHR2NFJyczVL?=
 =?utf-8?B?cVVjZDZMdHRtcWZzUVJXOXhTOGVnVmJjVEc5cStCQitlZmQzTmQxR0xyWjdX?=
 =?utf-8?B?M1dOdy9wazU1K0hUVThMb0x3a3A0cm5Fd0hYSkdlTkYzTE9qV2U0ZGpzYTJw?=
 =?utf-8?Q?JMAbe7thBnN8pw6I7Vxzpes8uaMNeaOq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkluMldQTjBKS2NRaGV6Y1hXTHhWZVkzS1NuQ0JrQWhGQ1dvUTkrZEdnRWNj?=
 =?utf-8?B?d0tYbnZIaHhOMXNBVzdxSSt1MXE0RUNtTjFWMjUwc0xCcDRWS21MVi82Mnc0?=
 =?utf-8?B?S2pOa3VaNDhLQ2JVZ3FxNWFFcjFHQzhoNiswWTAraFlzU3ZDTnhiMndrd2pn?=
 =?utf-8?B?MU9kVWhaTlN5b1E0ZWtXR1hwVzJwQ3pQT2FwVkJaeUJQOFBTYS9DVHA4aG9x?=
 =?utf-8?B?K05la0o3dkNiSWx4ZmxuMXZlakdwWmVFcHJBYnlDekk5bzhJRWJUUVJ3V2xm?=
 =?utf-8?B?a3orQUZqb0d0ek5Mc1JUNW9LOUxzUlN1R1FKUEQzeWtuUER4OU80RElEejI5?=
 =?utf-8?B?VzRzRXdIS2pkVFIxYjlCRExQUmZWTnYveWk1N2dKeWJ0cHFZYUM3a1hMVUtu?=
 =?utf-8?B?azVyQWNDMGs2YUliNkJ0NUVMRlovcEZvbmtFTnhoN2Raazl2RHFpeUhmQkVL?=
 =?utf-8?B?M3l3bE04cXh2cFBVSEw2RFlrYll2WVo3RWVoUkV5MnhsWjJYWVpGU09WUndV?=
 =?utf-8?B?WVl6eEs0ZW96emNrVWpTYnFoeVIyTHd0MWo1Sk04NzM4ZnBUdjhFUUprSDJx?=
 =?utf-8?B?cVAzTE5hdUs1aWdYMmV0em51L1NsK3FYUm5tamJBOVdzUGRISjFRZ3FTZnJZ?=
 =?utf-8?B?TG0vN3phdTRxWFpZRzduL1NLeWhqYUNlZlZpcnl2Ym1sbEsrRjVKTnZDQnNI?=
 =?utf-8?B?NUhpNkg1am5LZjVQaXh1ZGl6Mk0vMzZxQks0Q3huc0M1UklhYUIzMnE5eUVH?=
 =?utf-8?B?bnlodkRKS2xYN2cyOVBSczJ2ZFlKRktCbFRhbjBOWDEybWd6UzRpOVAxNTZS?=
 =?utf-8?B?MWoyc3NMWXVjY3ZrV3Q5SnNuQW13SStndlBzQjFQRHVFaGpLblZsWVoxVXB2?=
 =?utf-8?B?QW5BYkluTVFZZ2tsZUU1YWRpZ3FiNXFURnFLak5Bc2QvU00xU3dBVFIxMjlZ?=
 =?utf-8?B?TGlEMXlFRjd2SW1jdE1pMGh4U1pKenh4c1V1ZTVNYmZ5aGtpdG1NS2VtZnRo?=
 =?utf-8?B?R3lPbUFmRFIxd094dXVXelY2RldYSVhuUWcwRldxRzgySklVVGo2UUJQcm9u?=
 =?utf-8?B?MWpZUGNBYkM3L21CMnR6TTRzN1pKQWRqVEFyREErK21tR282WEV0WUxQT0RS?=
 =?utf-8?B?ZU0xVHREamoybUJaM04wRVlrUEh1TmovVEMxcjEvcEdIdmU1Mk9CNEVJVkYw?=
 =?utf-8?B?ZnE1YXJNY0l5cE5uSm1mdVRJY0hKcjQ3c3phdXVibHNvS1dnc0hoOElKNnZN?=
 =?utf-8?B?SFVlTjhvTGFQdC9uc3J4YXlLcWRYdllVZnNKZGhqUmVMNThaQ3hhRHdsTFE0?=
 =?utf-8?B?UXo5aHYxcWdzd1oreGlNTEdZclRzdi9IcDBCZlZRSmU0R3hXY0JOMmdQaUxT?=
 =?utf-8?B?cUhIOC9sLzZrVXgwVkVzbzREY2V2SmlKWUhOUXhYM3o4N3ZTZzhjSWNDOXd1?=
 =?utf-8?B?OGF3eTFya3J3Nk5lUUdXOGJWMStXMElrY2wzSTNMMDVQY2V5VmRQQ1M5enFB?=
 =?utf-8?B?T0NuZTNNeWM1NnVSYnR6alQvREtuWm95OHc1RFZybVJSK1ZHeFByT1FHV2d0?=
 =?utf-8?B?b0xnc2U4WlRGODV1eks0ZjVzcmFkNTV2OGU5elozTmZYdFVUZzlQQ1BRRExM?=
 =?utf-8?B?cHR0c2phdUQ1SzVNdTVwSHRmYXpIV1QxbmVGVmtRMzdlczlUQm02VGx4RlhK?=
 =?utf-8?B?anRoaWVQZHFGa2hlY005b0Rlb1k1ZHdhOFVTTmRyandyUS9tWHFHekczY1dr?=
 =?utf-8?B?KytwYUVQVmQ0MlF5ZFF5NklwWmRrR2t1NGh5V3N6V1Fybm5hY0RBZko3WXhC?=
 =?utf-8?B?cS93OUpJL1hObWJCY1Q1Uk5UcXU2cS9DWlUreUh1eHB4aWNHT2dMRFZMM0pT?=
 =?utf-8?B?SEIxbDZxaitYNDkxOUVYcENoWXhSdzBPR0p0VW15ZmYyTVdOSE1DY1pMaHl0?=
 =?utf-8?B?ejVkYlJtRTFNb1FMalI3Sk50dDZ0TkhUZGxxQ3gvWGNYTTlKWTJNdis0czhw?=
 =?utf-8?B?UDdqMnExNExnMUEzNi9Idi8vUDdWN2tOTENCMUpxOWY4c01zZkdydjAwdmE1?=
 =?utf-8?B?OUJRUW80V3Nia1czdnl2UERZaWxlZGUrMzd2R0ROZjdBZE0xV2NMR3ZNLzFY?=
 =?utf-8?B?eUhBNmdWaXpZWUNmTUdhLy94NjN6MXQ0OTdKMVlvMzQyTmhwcklNK2ExT2Y1?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5038196-5886-42fb-3f90-08ddfd0b84a9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 14:46:47.0747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 98WQMMuFHGJGnd85zy93mVDQxFPlU1nXkkPkf8rKcPJYYjkR1CxMm4nL7btfaZADLxO5y/kdzwXme/FbF4/TqIlXH+EFGJcHRzm9kUGJopY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5239
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

On Fri, Sep 26, 2025 at 12:04:21AM +0200, Michal Wajdeczko wrote:
>Instead of expanding GT debugfs directories with large number of
>SR-IOV files, as those are replicated per each SR-IOV function,
>move them to our new debugfs tree, organized by the function.
>
>But to avoid breaking IGT tests that use current layout, provide
>symlinks which could be removed once transition period is over.

I don't think the only reason should be to "avoid breaking IGT". It's
alos for convenience.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   | 355 +++++++++++-------
> drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.h   |   1 +
> drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c |  13 +
> 3 files changed, 234 insertions(+), 135 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>index 3ed245e04d0c..21065394e1b5 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>@@ -25,12 +25,22 @@
> #include "xe_sriov_pf.h"
>
> /*
>- *      /sys/kernel/debug/dri/0/
>- *      ├── gt0		# d_inode->i_private = gt
>- *      │   ├── pf	# d_inode->i_private = gt
>- *      │   ├── vf1	# d_inode->i_private = VFID(1)
>- *      :   :
>- *      │   ├── vfN	# d_inode->i_private = VFID(N)
>+ *      /sys/kernel/debug/dri/BDF/
>+ *      ├── sriov		# d_inode->i_private = (xe_device*)
>+ *      │   ├── pf		# d_inode->i_private = (xe_device*)
>+ *      │   │   ├── tile0	# d_inode->i_private = (xe_tile*)
>+ *      │   │   │   ├── gt0	# d_inode->i_private = (xe_gt*)
>+ *      │   │   │   ├── gt1	# d_inode->i_private = (xe_gt*)
>+ *      │   │   ├── tile1
>+ *      │   │   │   :
>+ *      │   ├── vf1		# d_inode->i_private = VFID(1)
>+ *      │   │   ├── tile0	# d_inode->i_private = (xe_tile*)
>+ *      │   │   │   ├── gt0	# d_inode->i_private = (xe_gt*)
>+ *      │   │   │   ├── gt1	# d_inode->i_private = (xe_gt*)
>+ *      │   │   ├── tile1
>+ *      │   │   │   :
>+ *      :   :
>+ *      │   ├── vfN		# d_inode->i_private = VFID(N)
>  */
>
> static void *extract_priv(struct dentry *d)
>@@ -40,26 +50,31 @@ static void *extract_priv(struct dentry *d)
>
> static struct xe_gt *extract_gt(struct dentry *d)
> {
>-	return extract_priv(d->d_parent);
>+	return extract_priv(d);
>+}
>+
>+static struct xe_device *extract_xe(struct dentry *d)
>+{
>+	return extract_priv(d->d_parent->d_parent->d_parent);
> }
>
> static unsigned int extract_vfid(struct dentry *d)
> {
>-	return extract_priv(d) == extract_gt(d) ? PFID : (uintptr_t)extract_priv(d);
>+	void *priv = extract_priv(d->d_parent->d_parent);
>+
>+	return priv == extract_xe(d) ? PFID : (uintptr_t)priv;
> }
>
> /*
>- *      /sys/kernel/debug/dri/0/
>- *      ├── gt0
>- *      │   ├── pf
>- *      │   │   ├── contexts_provisioned
>- *      │   │   ├── doorbells_provisioned
>- *      │   │   ├── runtime_registers
>- *      │   │   ├── negotiated_versions
>- *      │   │   ├── adverse_events
>- *      ├── gt1
>- *      │   ├── pf
>- *      │   │   ├── ...
>+ *      /sys/kernel/debug/dri/BDF/
>+ *      ├── sriov
>+ *      :   ├── pf
>+ *          :   ├── tile0
>+ *              :   ├── gt0
>+ *                  :   ├── contexts_provisioned
>+ *                      ├── doorbells_provisioned
>+ *                      ├── runtime_registers
>+ *                      ├── adverse_events
>  */
>
> static const struct drm_info_list pf_info[] = {
>@@ -86,11 +101,13 @@ static const struct drm_info_list pf_info[] = {
> };
>
> /*
>- *      /sys/kernel/debug/dri/0/
>- *      ├── gt0
>- *      │   ├── pf
>- *      │   │   ├── ggtt_available
>- *      │   │   ├── ggtt_provisioned
>+ *      /sys/kernel/debug/dri/BDF/
>+ *      ├── sriov
>+ *      :   ├── pf
>+ *          :   ├── tile0
>+ *              :   ├── gt0
>+ *                  :   ├── ggtt_available
>+ *                      ├── ggtt_provisioned
>  */
>
> static const struct drm_info_list pf_ggtt_info[] = {
>@@ -107,10 +124,12 @@ static const struct drm_info_list pf_ggtt_info[] = {
> };
>
> /*
>- *      /sys/kernel/debug/dri/0/
>- *      ├── gt0
>- *      │   ├── pf
>- *      │   │   ├── lmem_provisioned
>+ *      /sys/kernel/debug/dri/BDF/
>+ *      ├── sriov
>+ *      :   ├── pf
>+ *          :   ├── tile0
>+ *              :   ├── gt0
>+ *                  :   ├── lmem_provisioned
>  */
>
> static const struct drm_info_list pf_lmem_info[] = {
>@@ -122,12 +141,14 @@ static const struct drm_info_list pf_lmem_info[] = {
> };
>
> /*
>- *      /sys/kernel/debug/dri/0/
>- *      ├── gt0
>- *      │   ├── pf
>- *      │   │   ├── reset_engine
>- *      │   │   ├── sample_period
>- *      │   │   ├── sched_if_idle
>+ *      /sys/kernel/debug/dri/BDF/
>+ *      ├── sriov
>+ *      :   ├── pf
>+ *          :   ├── tile0
>+ *              :   ├── gt0
>+ *                  :   ├── reset_engine
>+ *                      ├── sample_period
>+ *                      ├── sched_if_idle
>  */
>
> #define DEFINE_SRIOV_GT_POLICY_DEBUGFS_ATTRIBUTE(POLICY, TYPE, FORMAT)		\
>@@ -173,24 +194,28 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
> }
>
> /*
>- *      /sys/kernel/debug/dri/0/
>- *      ├── gt0
>- *      │   ├── pf
>- *      │   │   ├── ggtt_spare
>- *      │   │   ├── lmem_spare
>- *      │   │   ├── doorbells_spare
>- *      │   │   ├── contexts_spare
>- *      │   │   ├── exec_quantum_ms
>- *      │   │   ├── preempt_timeout_us
>- *      │   │   ├── sched_priority
>- *      │   ├── vf1
>- *      │   │   ├── ggtt_quota
>- *      │   │   ├── lmem_quota
>- *      │   │   ├── doorbells_quota
>- *      │   │   ├── contexts_quota
>- *      │   │   ├── exec_quantum_ms
>- *      │   │   ├── preempt_timeout_us
>- *      │   │   ├── sched_priority
>+ *      /sys/kernel/debug/dri/BDF/
>+ *      ├── sriov
>+ *      :   ├── pf
>+ *          │   ├── tile0
>+ *          │   :   ├── gt0
>+ *          │       :   ├── ggtt_spare
>+ *          │           ├── lmem_spare
>+ *          │           ├── doorbells_spare
>+ *          │           ├── contexts_spare
>+ *          │           ├── exec_quantum_ms
>+ *          │           ├── preempt_timeout_us
>+ *          │           ├── sched_priority
>+ *          ├── vf1
>+ *          :   ├── tile0
>+ *              :   ├── gt0
>+ *                  :   ├── ggtt_quota
>+ *                      ├── lmem_quota
>+ *                      ├── doorbells_quota
>+ *                      ├── contexts_quota
>+ *                      ├── exec_quantum_ms
>+ *                      ├── preempt_timeout_us
>+ *                      ├── sched_priority
>  */
>
> #define DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(CONFIG, TYPE, FORMAT)		\
>@@ -233,22 +258,26 @@ DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(preempt_timeout, u32, "%llu\n");
> DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(sched_priority, u32, "%llu\n");
>
> /*
>- *      /sys/kernel/debug/dri/0/
>- *      ├── gt0
>- *      │   ├── pf
>- *      │   │   ├── threshold_cat_error_count
>- *      │   │   ├── threshold_doorbell_time_us
>- *      │   │   ├── threshold_engine_reset_count
>- *      │   │   ├── threshold_guc_time_us
>- *      │   │   ├── threshold_irq_time_us
>- *      │   │   ├── threshold_page_fault_count
>- *      │   ├── vf1
>- *      │   │   ├── threshold_cat_error_count
>- *      │   │   ├── threshold_doorbell_time_us
>- *      │   │   ├── threshold_engine_reset_count
>- *      │   │   ├── threshold_guc_time_us
>- *      │   │   ├── threshold_irq_time_us
>- *      │   │   ├── threshold_page_fault_count
>+ *      /sys/kernel/debug/dri/BDF/
>+ *      ├── sriov
>+ *      :   ├── pf
>+ *          │   ├── tile0
>+ *          │   :   ├── gt0
>+ *          │       :   ├── threshold_cat_error_count
>+ *          │           ├── threshold_doorbell_time_us
>+ *          │           ├── threshold_engine_reset_count
>+ *          │           ├── threshold_guc_time_us
>+ *          │           ├── threshold_irq_time_us
>+ *          │           ├── threshold_page_fault_count
>+ *          ├── vf1
>+ *          :   ├── tile0
>+ *              :   ├── gt0
>+ *                  :   ├── threshold_cat_error_count
>+ *                      ├── threshold_doorbell_time_us
>+ *                      ├── threshold_engine_reset_count
>+ *                      ├── threshold_guc_time_us
>+ *                      ├── threshold_irq_time_us
>+ *                      ├── threshold_page_fault_count
>  */
>
> static int set_threshold(void *data, u64 val, enum xe_guc_klv_threshold_index index)
>@@ -329,10 +358,12 @@ static void pf_add_config_attrs(struct xe_gt *gt, struct dentry *parent, unsigne
> }
>
> /*
>- *      /sys/kernel/debug/dri/0/
>- *      ├── gt0
>- *      │   ├── vf1
>- *      │   │   ├── control { stop, pause, resume }
>+ *      /sys/kernel/debug/dri/BDF/
>+ *      ├── sriov
>+ *      :   ├── vf1
>+ *          :   ├── tile0
>+ *              :   ├── gt0
>+ *                  :   ├── control { stop, pause, resume }
>  */
>
> static const struct {
>@@ -409,11 +440,14 @@ static const struct file_operations control_ops = {
> };
>
> /*
>- *      /sys/kernel/debug/dri/0/
>- *      ├── gt0
>- *      │   ├── vf1
>- *      │   │   ├── guc_state
>+ *      /sys/kernel/debug/dri/BDF/
>+ *      ├── sriov
>+ *      :   ├── vf1
>+ *          :   ├── tile0
>+ *              :   ├── gt0
>+ *                  :   ├── guc_state
>  */
>+
> static ssize_t guc_state_read(struct file *file, char __user *buf,
> 			      size_t count, loff_t *pos)
> {
>@@ -447,11 +481,14 @@ static const struct file_operations guc_state_ops = {
> };
>
> /*
>- *      /sys/kernel/debug/dri/0/
>- *      ├── gt0
>- *      │   ├── vf1
>- *      │   │   ├── config_blob
>+ *      /sys/kernel/debug/dri/BDF/
>+ *      ├── sriov
>+ *      :   ├── vf1
>+ *          :   ├── tile0
>+ *              :   ├── gt0
>+ *                  :   ├── config_blob
>  */
>+
> static ssize_t config_blob_read(struct file *file, char __user *buf,
> 				size_t count, loff_t *pos)
> {
>@@ -521,73 +558,121 @@ static const struct file_operations config_blob_ops = {
> 	.llseek		= default_llseek,
> };
>
>-/**
>- * xe_gt_sriov_pf_debugfs_register - Register SR-IOV PF specific entries in GT debugfs.
>- * @gt: the &xe_gt to register
>- * @root: the &dentry that represents the GT directory
>- *
>- * Register SR-IOV PF entries that are GT related and must be shown under GT debugfs.
>- */
>-void xe_gt_sriov_pf_debugfs_register(struct xe_gt *gt, struct dentry *root)
>+static void pf_populate_gt(struct xe_gt *gt, struct dentry *dent, unsigned int vfid)
> {
> 	struct xe_device *xe = gt_to_xe(gt);
> 	struct drm_minor *minor = xe->drm.primary;
>-	int n, totalvfs = xe_sriov_pf_get_totalvfs(xe);
>-	struct dentry *pfdentry;
>-	struct dentry *vfdentry;
>-	char buf[14]; /* should be enough up to "vf%u\0" for 2^32 - 1 */
>
>-	xe_gt_assert(gt, IS_SRIOV_PF(xe));
>-	xe_gt_assert(gt, root->d_inode->i_private == gt);
>+	if (vfid) {
>+		pf_add_config_attrs(gt, dent, vfid);
>
>-	/*
>-	 *      /sys/kernel/debug/dri/0/
>-	 *      ├── gt0
>-	 *      │   ├── pf
>-	 */
>-	pfdentry = debugfs_create_dir("pf", root);
>-	if (IS_ERR(pfdentry))
>-		return;
>-	pfdentry->d_inode->i_private = gt;
>-
>-	drm_debugfs_create_files(pf_info, ARRAY_SIZE(pf_info), pfdentry, minor);
>-	if (xe_gt_is_main_type(gt)) {
>-		drm_debugfs_create_files(pf_ggtt_info,
>-					 ARRAY_SIZE(pf_ggtt_info),
>-					 pfdentry, minor);
>-		if (xe_device_has_lmtt(gt_to_xe(gt)))
>-			drm_debugfs_create_files(pf_lmem_info,
>-						 ARRAY_SIZE(pf_lmem_info),
>-						 pfdentry, minor);
>-	}
>-
>-	pf_add_policy_attrs(gt, pfdentry);
>-	pf_add_config_attrs(gt, pfdentry, PFID);
>-
>-	for (n = 1; n <= totalvfs; n++) {
>-		/*
>-		 *      /sys/kernel/debug/dri/0/
>-		 *      ├── gt0
>-		 *      │   ├── vf1
>-		 *      │   ├── vf2
>-		 */
>-		snprintf(buf, sizeof(buf), "vf%u", n);
>-		vfdentry = debugfs_create_dir(buf, root);
>-		if (IS_ERR(vfdentry))
>-			break;
>-		vfdentry->d_inode->i_private = (void *)(uintptr_t)n;
>-
>-		pf_add_config_attrs(gt, vfdentry, VFID(n));
>-		debugfs_create_file("control", 0600, vfdentry, NULL, &control_ops);
>+		debugfs_create_file("control", 0600, dent, NULL, &control_ops);
>
> 		/* for testing/debugging purposes only! */
> 		if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> 			debugfs_create_file("guc_state",
> 					    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ? 0600 : 0400,
>-					    vfdentry, NULL, &guc_state_ops);
>+					    dent, NULL, &guc_state_ops);
> 			debugfs_create_file("config_blob",
> 					    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ? 0600 : 0400,
>-					    vfdentry, NULL, &config_blob_ops);
>+					    dent, NULL, &config_blob_ops);
>+		}
>+
>+	} else {
>+		pf_add_config_attrs(gt, dent, PFID);
>+		pf_add_policy_attrs(gt, dent);
>+
>+		drm_debugfs_create_files(pf_info, ARRAY_SIZE(pf_info), dent, minor);
>+
>+		if (xe_gt_is_main_type(gt)) {
>+			drm_debugfs_create_files(pf_ggtt_info,
>+						 ARRAY_SIZE(pf_ggtt_info),
>+						 dent, minor);
>+			if (xe_device_has_lmtt(xe))
>+				drm_debugfs_create_files(pf_lmem_info,
>+							 ARRAY_SIZE(pf_lmem_info),
>+							 dent, minor);
> 		}
> 	}
> }
>+
>+/**
>+ * xe_gt_sriov_pf_debugfs_populate() - Create SR-IOV GT-level debugfs directories and files.
>+ * @gt: the &xe_gt to register
>+ * @parent: the parent &dentry that represents a &xe_tile
>+ * @vfid: the VF identifier
>+ *
>+ * Add to the @parent directory new debugfs directory that will represent a @gt and
>+ * populate it with GT files that are related to the SR-IOV @vfid function.
>+ *
>+ * This function can only be called on PF.
>+ */
>+void xe_gt_sriov_pf_debugfs_populate(struct xe_gt *gt, struct dentry *parent, unsigned int vfid)
>+{
>+	struct dentry *dent;
>+	char name[8]; /* should be enough up to "gt%u\0" for 2^8 - 1 */
>+
>+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>+	xe_gt_assert(gt, extract_priv(parent) == gt->tile);
>+	xe_gt_assert(gt, extract_priv(parent->d_parent) == gt_to_xe(gt) ||
>+		     (uintptr_t)extract_priv(parent->d_parent) == vfid);
>+
>+	/*
>+	 *      /sys/kernel/debug/dri/BDF/
>+	 *      ├── sriov
>+	 *      │   ├── pf
>+	 *      │   │   ├── tile0		# parent
>+	 *      │   │   │   ├── gt0		# d_inode->i_private = (xe_gt*)
>+	 *      │   │   │   ├── gt1
>+	 *      │   │   :   :
>+	 *      │   ├── vf1
>+	 *      │   │   ├── tile0		# parent
>+	 *      │   │   │   ├── gt0		# d_inode->i_private = (xe_gt*)
>+	 *      │   │   │   ├── gt1
>+	 *      │   :   :   :
>+	 */
>+	snprintf(name, sizeof(name), "gt%u", gt->info.id);
>+	dent = debugfs_create_dir(name, parent);
>+	if (IS_ERR(dent))
>+		return;
>+	dent->d_inode->i_private = gt;
>+
>+	xe_gt_assert(gt, extract_gt(dent) == gt);
>+	xe_gt_assert(gt, extract_vfid(dent) == vfid);
>+
>+	pf_populate_gt(gt, dent, vfid);
>+}
>+
>+static void pf_add_links(struct xe_gt *gt, struct dentry *dent)
>+{
>+	unsigned int totalvfs = xe_gt_sriov_pf_get_totalvfs(gt);
>+	unsigned int vfid;
>+	char name[VFNAME_MAX];
>+	char symlink[64];
>+
>+	for (vfid = 0; vfid <= totalvfs; vfid++) {
>+		if (vfid)
>+			snprintf(name, sizeof(name), "vf%u", vfid);
>+		else
>+			snprintf(name, sizeof(name), "pf");
>+		snprintf(symlink, sizeof(symlink), "../../sriov/%s/tile%u/gt%u",
>+			 name, gt->tile->id, gt->info.id);
>+		debugfs_create_symlink(name, dent, symlink);
>+	}
>+}
>+
>+/**
>+ * xe_gt_sriov_pf_debugfs_register - Register SR-IOV PF specific entries in GT debugfs.
>+ * @gt: the &xe_gt to register
>+ * @dent: the &dentry that represents the GT directory
>+ *
>+ * Instead of actual files, create symlinks for PF and each VF to their GT specific
>+ * attributes that should be already exposed in the dedicated debugfs SR-IOV tree.
>+ */
>+void xe_gt_sriov_pf_debugfs_register(struct xe_gt *gt, struct dentry *dent)
>+{
>+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>+	xe_gt_assert(gt, dent->d_inode->i_private == gt);
>+
>+	pf_add_links(gt, dent);
>+}
>diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.h
>index 038cc8ddc244..82ff3b7f0532 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.h
>+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.h
>@@ -11,6 +11,7 @@ struct dentry;
>
> #ifdef CONFIG_PCI_IOV
> void xe_gt_sriov_pf_debugfs_register(struct xe_gt *gt, struct dentry *root);
>+void xe_gt_sriov_pf_debugfs_populate(struct xe_gt *gt, struct dentry *parent, unsigned int vfid);
> #else
> static inline void xe_gt_sriov_pf_debugfs_register(struct xe_gt *gt, struct dentry *root) { }
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
>index 4445824499ad..8517563f2812 100644
>--- a/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
>@@ -6,7 +6,9 @@
> #include <linux/debugfs.h>
> #include <drm/drm_debugfs.h>
>
>+#include "xe_device.h"
> #include "xe_device_types.h"
>+#include "xe_gt_sriov_pf_debugfs.h"
> #include "xe_tile_sriov_pf_debugfs.h"
> #include "xe_sriov.h"
>
>@@ -51,6 +53,15 @@ static unsigned int extract_vfid(struct dentry *d)
> 	return pp == extract_xe(d) ? PFID : (uintptr_t)pp;
> }
>
>+static void pf_populate_tile(struct xe_tile *tile, struct dentry *dent, unsigned int vfid)
>+{
>+	struct xe_gt *gt;
>+	unsigned int id;
>+
>+	for_each_gt_on_tile(gt, tile, id)
>+		xe_gt_sriov_pf_debugfs_populate(gt, dent, vfid);
>+}
>+
> /**
>  * xe_tile_sriov_pf_debugfs_populate() - Populate SR-IOV debugfs tree with tile files.
>  * @tile: the &xe_tile to register
>@@ -95,4 +106,6 @@ void xe_tile_sriov_pf_debugfs_populate(struct xe_tile *tile, struct dentry *pare
> 	xe_tile_assert(tile, extract_tile(dent) == tile);
> 	xe_tile_assert(tile, extract_vfid(dent) == vfid);
> 	xe_tile_assert(tile, extract_xe(dent) == xe);
>+
>+	pf_populate_tile(tile, dent, vfid);
> }
>-- 
>2.47.1
>
