Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5ADC3DA59
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 16:42:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEEF110EC53;
	Fri, 19 Jul 2024 16:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bdDaB/uH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A61E10EC53
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 16:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721407354; x=1752943354;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1mbvKkFQjb72kVlTnc6WXHb0sHBc9DkswCpWQQDdIyg=;
 b=bdDaB/uH45V5IHLvwIH6XsgWl7IASO8sbyHx5exJjAICn2sRVjSIu+8V
 l+lHwfzObqzP7xzGJ4WQ9IzTrvPbEbdaud3f8EStyARr2/seaqgQja1Gv
 KpRWVf4j7XI/cYp/dWh6O7YBI9K9Iwcqm6RqJzhFfJs00K9NgdyssdYYW
 iyMYPhKXoTekmOsfiv8HymDHW9Efz97WYWCY2wDbZWvUJ2iRdXwjJ9d/f
 yIusRebve1cm+z70FYeHu65PuJs0BsDQjrAJj+7hR3EsOaiX8aswjTJ+C
 OnbqZkbYK4whdR3IE3WU9oXe3TLCNJjmxbYLq5fKdQDD1XfHSjT+7VdgD w==;
X-CSE-ConnectionGUID: oruWyNK2QjuS1pzwp5UVoA==
X-CSE-MsgGUID: ooG1CjzWSOK2+2MxxzFCCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="18649258"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="18649258"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 09:41:42 -0700
X-CSE-ConnectionGUID: Sv5DKL6vTcq5t+XQJgWNng==
X-CSE-MsgGUID: a4tcOI3cQY+QW4Azd9UbqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="51189155"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jul 2024 09:41:42 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 09:41:41 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 19 Jul 2024 09:41:41 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 19 Jul 2024 09:41:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dtn8UbYZAm9azqzQFLIgd4x/3m7AfgURfV9+8jDFVRSAoxF1ZcU+cyxOo0WeRQ8aQf32mLHxnoop0P6t9hqgrwDNwQv5orS4Qb+z/4TvvlwenM87GEnlLDqElP6NzXlPbm8CNyKCIhwF9J8/2lkO/V7tuT6yJMFtr9lRoLnA6hPWTlfTzmEOKly6v4UaamkrPtDvCuTTKxIcfz3DQTpZ6k5fsApPdNw7wqVfe5IC4+KSSidH8C8K/eOF+FcDYwrreMXwvhz6h9YBFGnMSj3tJ9oSb2Jbl8TNPX7sh8QjzEIMU7Ux72Fla/u9PCqqvm+gUILvDHPOmc1pvF+ngNqG6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3fvdtdJWNGR+avPCk/xkVkw3nx1AgfLw+C0iajohJyQ=;
 b=ZrI3a4H13CbiS7rEXJ5b4YP3DscSEEA/6Ml4ulkTdFTY9/CYZKXZuZHshAHRy7oV5I3fqBZVwPiws/suuqW/T0lHDXn8KpheDQEXyjPX7uACWzyyyzJwwU91ydzvQISD8fn5P/j/L82Q3aKeBk9chhJN8XEQVmaD0mC7Kk9DvRAADmr4bU0kHs2JJJbQrPcF/h8gA/QIXOm+3RHIVYIUT3ilVqfVdHD3s2XE9WGnE2Jwebbn8eZ9lFgvLbA0259wSzDocLx0L/M2nR05VMWNt2UnbLo6ScJuLE9JSks1XLC2rK9oXl8uLGMiRUTgu5gBmNrSyAMJfI063wTPpK6UMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB5074.namprd11.prod.outlook.com (2603:10b6:303:97::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.27; Fri, 19 Jul
 2024 16:41:37 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Fri, 19 Jul 2024
 16:41:36 +0000
Date: Fri, 19 Jul 2024 11:41:32 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 7/7] drm/xe/tests: Skip xe_mocs live tests on VF device
Message-ID: <fespagccr5hxyvaumytlpbo2bp62zvc7zrl24epm3mzqct6ak3@yw55n64ug5qp>
References: <20240717195155.442-1-michal.wajdeczko@intel.com>
 <20240717195155.442-8-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240717195155.442-8-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR04CA0367.namprd04.prod.outlook.com
 (2603:10b6:303:81::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB5074:EE_
X-MS-Office365-Filtering-Correlation-Id: 396a491e-83f7-4078-03ff-08dca811a822
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0f8XbPb0JYqXnEuSBYQvyve2cyzwHFm1rwvPjra8c+Mkwu1dycl3/RlWMS5O?=
 =?us-ascii?Q?n8Z01Dh+FgBTjY5bAQ9q8aRCSjv2n0j2VvSP4NwnDXM8Tg0iXd/eqScvLXKi?=
 =?us-ascii?Q?nHXrVY+qjRmR/P9U16LCk0/fBxre4gVdpcX00RsXxFQEo9wWeJOBEf5rHWfk?=
 =?us-ascii?Q?ca2yLPivmMmKVG9ByepYoOaYdFgcphg334uywl0SmdHQ0x/gdf2nJBWf2n0I?=
 =?us-ascii?Q?RqfkndRFCw+aaCvWHrWuD/Gw5kn45adShK43hX5YoVYe932JLnegYX36GfYo?=
 =?us-ascii?Q?8vNjLaIEO4KbQFOCtWF97lKAUBga1cx2Oe6sPy+tERLgIYoartf9HGIqNt+V?=
 =?us-ascii?Q?+ts5gtZR3RLT6uOrbL0rX/0CtoQmKbrQa/lN/AuIRdP1pq+NmYjaA8xZE75j?=
 =?us-ascii?Q?B2BPxYiSE9kuq9UjQoffMisBUxyqB8pIwK+QUQjWN8F9HqTcKJY0bFgvEhTv?=
 =?us-ascii?Q?wPqTeRSpJf/zDYpWX8wvyyvz1DaMGZpM9GFrMYy8cUctlp8mhg0Z+oXVBOVA?=
 =?us-ascii?Q?CFFOaFz3X3WCd3UnDQxj9DBQHMaFUvkqGaPvCzkWV++VY6zfEF5B1rWg6rd+?=
 =?us-ascii?Q?6SDXOVFgTToMqkpuKYyy1+uabt//yIhvPHMk89mA+EaZA1pK5XKnPSa+Armc?=
 =?us-ascii?Q?w1zmApSQpkj5phO+jjsfRkz+GeBM9F+hmeacNmKevsBO0RjvrfOQdH+FPplI?=
 =?us-ascii?Q?hT4B/Nn5seDYO0AsJRYdfC/thgytS2vUm9Y2dXGaN/2p6UqW4C2ZeYj0kBEK?=
 =?us-ascii?Q?XHtU2YIYL7n1ynMU94t/lq7hgMeHqBeJ+vaV+5sqD5/Fon7wUWHmnQ3JSOX4?=
 =?us-ascii?Q?lZvakDapRZGd/2ZSaelVic1eyj1pfaqjuFIptfE4/kqdX1NjSUHgQ+wg8Ama?=
 =?us-ascii?Q?bX4gi3kOwrzB0dQpaZ4Vp91hTpPYp6l3dBYZUeo2ikatZ5TPXY7f20gk5mWP?=
 =?us-ascii?Q?fUh/C49L+e68nb+KILFUW8aCTm03X4RmO39dMTtiAOipnZwls0zFGWqVokfE?=
 =?us-ascii?Q?q5ep7k10Y2z0QAEatkeKg2kEdrTQTmpH9DSDimaPFokFh5AkAJ+V2AmYNfuj?=
 =?us-ascii?Q?XVmI/0qOaJgRmqFfPVvnhQ9+ocZUOJfVDbHCI8ug2gYxAa6K3A5fQGt9kk+r?=
 =?us-ascii?Q?lOZoGzdnFibYJJj7zWCPVNhb5X5lX4FqFqpxZqXYmpfBczlU50BKqgXMAnmb?=
 =?us-ascii?Q?JkefCBwpZv5TBm6YA/MIrlpUnXoVRueUFnHh7Q34Vefx4UFvgs8djEGfDFn5?=
 =?us-ascii?Q?tr8tWHAY7py0ihcyIGtoG1qHlytSHkUD5ldkEzYgxmjPlsjZjyU9UPBPlxvc?=
 =?us-ascii?Q?GqF6Mdkag0onnayeJq0h5Dhsou5A3LjnFYLvHM1HJE3dng=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PmkML8WccCnjXuXhqmgKP/T9xNLxdhLEioE1dRVPjl4JBBpYVOvl+hDIKd68?=
 =?us-ascii?Q?OW06iW/codoChUi8x7d9/idMVx7Tumpg5cUFt77lesg14+q8y9smn5XvbDpf?=
 =?us-ascii?Q?WU3v7wJlk2GCBLQURSf1jwVElQqWB5N3iQ/XvcA0McCyVMZ6YzF+mS/M+I/3?=
 =?us-ascii?Q?o7eADH+JzB0fTp+6g6t9AhLqc1QuccWp9Ee8lJkMpYOu87w0rVjvieWQSmm+?=
 =?us-ascii?Q?ts6Chn0dP2EP7FdBtAd/Fhp+bwZzAIioBrAuDqnefTwLIumKvX/ke4FRB+DQ?=
 =?us-ascii?Q?Ubf839MNn4lGPiOyW5+eODK7iGhlccaBBqFJ1N/2JqEgEhGyD7gr7fJjLFDH?=
 =?us-ascii?Q?6TwXZ5Zwahh9HVg+kIR8UM42XFJaYfO4UDmLjoqMSOB4yfkXJWF8haYmxIfj?=
 =?us-ascii?Q?u+XYh8nTqVxBwAF6CZg9kNDgRVEn27ltq3nTmTr1XU9stUOIERWWHEwbGFNJ?=
 =?us-ascii?Q?8KeQSbLTTU9vBduE8+d8WUdfYp7mzDtyYdQKaO0yWsny62i8QTP1NoNXteNV?=
 =?us-ascii?Q?moU8mTFb1A65h8Lb7NezHU+6PiaaKeLllHs0rSTVBZ4I7VDZ5Cjqqk2FaqJd?=
 =?us-ascii?Q?lrHaJq0a2TVJsjz9PPfOcwuId83dg3UeJgt+9Hnjq2Yq5+PC9OXvITuU/hxL?=
 =?us-ascii?Q?q8xZbzTeBhmeSajFd0yVvnfdQZafFjILg8YTN+5sHeCdWSsNtIoQl6eF/j7H?=
 =?us-ascii?Q?hvyGY4Bbwb1hK36eQ7yrXVuGrFyfUZc1vFuqzQwlKNaf4DMGgJ0KnDTEw/rC?=
 =?us-ascii?Q?dtk8k0GcPUnCewtDCFC0gORhk5wlIldSghE2+RFuEc5zTUjK7oGRNH2HaD98?=
 =?us-ascii?Q?DfeXGcOwR7LzgpYs4U9pkonCo65hdzEsqqqnV/+41jssL8WxMsc6jo2Ndtu3?=
 =?us-ascii?Q?JO/8yWx+4xbgvcBnvb8134e8XDRJ32VJ9TKU2pWtrHBRg0H7yhHRwMQIA45K?=
 =?us-ascii?Q?fqy/M6hYp4ok0gjrsekYZmoEbvase6YJAmPaqjJNvtv52gpv5GOuv72o9wh9?=
 =?us-ascii?Q?T5MiY128TRl4EpYuAr/ThRmjACyYtfOawral/n5rVGrn1OUcucZ/vrragM4+?=
 =?us-ascii?Q?ZlXU2X5M01JUeaA1VIBi0/7Bi5fXZjsPgjHgb2eZU7Dd9UkQjICCcW+fodH9?=
 =?us-ascii?Q?IZFwaSfXFTJSaRd2URWrtTpT7xz6K0ugDGCowsiURjCuSCAlsENDCkeOpBgr?=
 =?us-ascii?Q?eXrikY2pmGf+a2kpr02h3YvQ1qRVMU2UPSww60kZ9aOZ5+ctwNXxaNorN0dM?=
 =?us-ascii?Q?WdXDCWTI+8lG0sbkBIoAE4jpjpKDttwkk3jpHISZ8y5KQxU5YpVCjck38uT/?=
 =?us-ascii?Q?M8+AGN6qdpm8+J86InQ/LROxt8KTNX97xA36DQMO3b1d8q/XATRXF09bLgse?=
 =?us-ascii?Q?9njnA22K/6k/DgmNBgD+eRAJ2MIJP6bma1kODpYbwVZawf9Lx4azsVuo+TT8?=
 =?us-ascii?Q?KRBGNBXPjaPz4zQiMYe450/ZcNx0qG2CqZ5PnqEDurK7IgxkKZ4w3IGywt4d?=
 =?us-ascii?Q?yHuP8ouGjYBQPBXQ+d1Q65DKMFMj2H/wJUEQBhEHdRv3Qg55/LIaVuKrUBPa?=
 =?us-ascii?Q?Bu6FYsLw1MTozPV1kb7NFxqrk8pW+DVX1lSbEXx4WaE4xUNSIGkjHmq93Sca?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 396a491e-83f7-4078-03ff-08dca811a822
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 16:41:36.9284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fzT6FNeuprP0vlYl0yUMJVKfX0pCiYUZtVLzMhp9gHDTYkp//nSVSAZo0wpgoIwxHYL/WlfjjjDvlNnjEZwdddQkMv9EAW0qznLossyhmSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5074
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

On Wed, Jul 17, 2024 at 09:51:55PM GMT, Michal Wajdeczko wrote:
>There is no point to run those tests on VFs devices as they can't
>access any of the MOCS registers. Skip testing on the VF device.
>
>  [ ] =================== xe_mocs (1 subtest) ====================
>  [ ] ================ xe_live_mocs_kernel_kunit  ================
>  [ ] [PASSED] 0000:4d:00.0
>  [ ] [SKIPPED] 0000:4d:00.1
>  [ ] ============ [PASSED] xe_live_mocs_kernel_kunit ============
>  [ ] ===================== [PASSED] xe_mocs =====================
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
