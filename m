Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B6FD3A696
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 19:53:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC9D10E6FA;
	Tue, 29 Oct 2024 19:53:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ODw90Z5p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2551410E70B
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 19:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730231605; x=1761767605;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3+g0ZBq87HWYmVuZaY7x7BVcVE/kGaLE6Hjutmgp028=;
 b=ODw90Z5ptP8KYas7Q42kHaEdxBuL9aYncmkFuk7cVNjM4QxHkKAio1x1
 Bd6vVlO5R02YN8dzW17hxrgHb/38MhtaI9mHzSowoSBEjXKu9ppZ+5q1z
 cHVeiYTNdR16TytQkoEdt+zCgWcLzs1fto8+7apK+emGCZQvXWePbh/Jj
 Cu/2crFa72lIqSb9UAjzCIyBD4qsi/nSVLHq0fYwSEqrK1je9ztGouNRp
 bc+hC8dOCAQtxgPYdAXogPJGbErfNi5+dpKzCIMplwKM9EX8e7WF9xIdB
 8qaiKrbAiG+j/eIy8cpbZ5/1zN7eel89uDx1IW89xx8z84nfBzeaccYHn w==;
X-CSE-ConnectionGUID: D+TxNB0aTAK+99+7kwM0Ew==
X-CSE-MsgGUID: Pwxt61EfSoCIjQ10mLdZQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="47380967"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="47380967"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 12:53:24 -0700
X-CSE-ConnectionGUID: hbXVHMAXQk6G3jgqMdOcMg==
X-CSE-MsgGUID: G5aorFosRaeGMha06TFa+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="82403463"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Oct 2024 12:53:25 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Oct 2024 12:53:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 29 Oct 2024 12:53:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 29 Oct 2024 12:53:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o7VMy8pYQe1K5iJ8dprAQW6Wllx8YtzMNAPbvlk6mDkl02PhPpNdvIPjNNNCkWSabH3uiB+A0NkXXLM6zhVEovN5ifBK+BP27NzombwjIumODNsWKoqSa98/PlbT4RnyVlSYHCFtczCYwCUkCNRpWkXfrg1hsIxHVNCA70fHOp/o7EzOeNmZ85nrVUR/YN/3w+Gfbw2dUxolR5fwuHKsRKNxm7wATtxq5tuvW+y5h86MupvOdR/17l9I1uWHiORz5wsQXTFJM3ZV+ipIAWImKk6hOA3zNpCP+6/m2cSX/v62/n9pw/kJ6DsWRpsSE9Jlv+yb6JwVu8OWHdyBYq/pNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B7VTgaAXnlnD9kLD3alBqy2Ntd+IAWTb1B/Iaq7vzLE=;
 b=xQl6oZgEUaxMnWUzEY7Q8tytPO4PjZLk6ZhhtBaTl7ccOAqq8vl5nOAnH3J445/kCMIvnVwUG1DzN6MQidPYtAdKID4YKWAAE9qSGat4Oy6/Ke81WPqAK4+j2m6bTH2IhWIwt9hO5iltdjGT9txv9sl2bYPlcJe0nVOIDX23XaIELfuAaNOhMRjJTnDVBvEmDnPah+SDGboZk0rGNq4L1+g3AUapiH/HKwflEaod2GhoJ+1ZKg+BtokHkVu69QoZJE1ma+piLts9xk4r1cRRlaBvmKxEWZFo5fkE1TyDRkg1YJLZsSZuLNficjuW3er27utRDravbloTvZ77j7XxgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.29; Tue, 29 Oct
 2024 19:53:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8093.024; Tue, 29 Oct 2024
 19:53:19 +0000
Date: Tue, 29 Oct 2024 14:53:14 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Accumulate exec queue timestamp on destroy
Message-ID: <ppvlyjpq6covnqgfujqtrjb2u7gd6g3vamaqkfrt4t6lxeoywu@pjxrmsb6u3yz>
References: <20241026170952.94670-2-lucas.demarchi@intel.com>
 <20241026170952.94670-4-lucas.demarchi@intel.com>
 <Zx/1BZ93nLSC1pFs@orsosgc001>
 <zdjmy5xxglhenvw72jto4oajnkuczyuetp2nnrgkfat77vhmnx@xq6fthganhf7>
 <ZyEbAH60kKHDyA/m@orsosgc001>
 <miao7b7igj35dgaaqea2li7vc722gxwjslnqklwqf34zavtsb6@dhj4cxfpmyoo>
 <gjm5bmsmlxn7upcvegofokepypbnbhvnkb2ikcakezoxlpvkn3@zc4glcg466ff>
 <ZyE4KuowiDE1bBhC@orsosgc001>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZyE4KuowiDE1bBhC@orsosgc001>
X-ClientProxiedBy: MW4PR04CA0380.namprd04.prod.outlook.com
 (2603:10b6:303:81::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7529:EE_
X-MS-Office365-Filtering-Correlation-Id: 26afc52e-c542-4980-5c82-08dcf853563e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IpkECwhraHR84NjutVYDBHrsYxBAvrdphaPjtIjJIvrZVIw9Asvzgd+nR9gH?=
 =?us-ascii?Q?LjEPKwMJwFpn0jCFWdSSA45MKpZNcfFpFveeDdDBtT4jxO4Rr30bccI1AA4r?=
 =?us-ascii?Q?BjBzuhn3kumPC6TMrz0x2Ia/WoA5gX46miARLgUFLsvp3GPoZAcPBppeXh9n?=
 =?us-ascii?Q?TQvGaP9ucq/uPLzLCiHl4Wl49D2C3NeYnZ0YGkSP7DHoz2jG4Yr+WSWfe8ZR?=
 =?us-ascii?Q?F4vYmQQuGIjrnYmn7wN3mNKjQhaWbRpsA1WrSXlk1c8LLSqxPbufBgBr27vq?=
 =?us-ascii?Q?siMsYwkAsbY3EwHkZyA49LPsBLvFLw+pxsTmsGkWiujzFottspG9cTVkIeaj?=
 =?us-ascii?Q?jT4IEedH7zcgkLvW61eHU/F5/5JHaMgnCFnIAvOiqNiICjSF32LR/rsEolpW?=
 =?us-ascii?Q?zsVxAaNjvaLU+65k+a4fkpuMdWJxwsiAlgd3kd0uzDYTLuA6u6kc8xnSYwgv?=
 =?us-ascii?Q?AqdLUXtCSFWWpHOa0ANVoYohyB5sCzMNLyew0MYmD8LvV0GLDn2oFtTh+j1T?=
 =?us-ascii?Q?Wn1uqT2JO2HNTMUPDdhfJLb1z586UEIFxvIVXNC/SZjUiG1Zjriho+4ZvbSq?=
 =?us-ascii?Q?0nZD9D89EXAaYCsrQZiZ7lsg052TcwR6AS5p+OPqzIQQzOd7GOSJ5nCTKt4O?=
 =?us-ascii?Q?JqTLnadobENJwJkyPAnXdEywRDQ9TVpnS5YZkd9Q62tX66GypMNXKRKyoJiP?=
 =?us-ascii?Q?G2BrOr+PbBNuzL0L69o5efenaUDgJ/biPDsNhuPH0MrrNlvJNXJBd4GIgQ+5?=
 =?us-ascii?Q?fQBsp3fn+cTIhqh2E6siULCQFx8vpEvkDGCKyawO+IIqQzIPgvLjTd0GgVsk?=
 =?us-ascii?Q?+1E3Hmyl79i/OD+vnJ7LN2xWaY3GsT+cDRkxA3q/OC+glUi0fCdBf/aYM25p?=
 =?us-ascii?Q?J/FSZIClGvZIoKkQt/fsql0ZEsAEw41rjkHM+MRDL8rPqq0sefGwwb4k+PfT?=
 =?us-ascii?Q?x3dEpRuQ0kguWtD94degF4gfbgwBlRfE0eAbn5z96D3kBjhmhcSaxUK3c+ZD?=
 =?us-ascii?Q?Z7hVGLsZdHSTIgBSvNr4tqgfsSzqHSmj5/k9FfyjKaiQNoHgxmLGKq5m/SVt?=
 =?us-ascii?Q?aNduu8zfQHWmgu9jUYTVXXWW5XVnr/Fz1RCg3R1At6K35X12PE53rDijE2Rb?=
 =?us-ascii?Q?z1Gen6S3jqRb3yQ9wySvUjjSzQK2zF85GQRhuQDcP5a6k9JgrpeZVn08+k1b?=
 =?us-ascii?Q?Xiji7lw/6m2Rtri7KI97YFj45+5jSgoG5nneJw2JmVAD8HQYA6l8yvoM8AID?=
 =?us-ascii?Q?7wuctHfOTZTzsuSNSgPlptSZ3oPdyQvypGHyJ0oepy81f/CcETYjO/7Ypf5P?=
 =?us-ascii?Q?B0sFNi14ro/uGy41GqVIxCAM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mT2+isn2MiN7jGGNVder93FrySMvvPwn5lrVLFev4YBT0Ob9F5tNLGtjSzBz?=
 =?us-ascii?Q?kYCbsv1YCRlizcr9dHvhh9opTclX+wHU1f7RR36HV8fk76ajz/ItObXz6KB1?=
 =?us-ascii?Q?xDAmfocDyTYcDEjZsNH5/hhlfIbN4E0NQWNNKDANcTi61vk0sqgVImhy06kk?=
 =?us-ascii?Q?YeS/ABGdtdoOhDR6Kp7a/toNydlByU4q8Sly8QBAHNNgGiRWOW4xjHmqKK3q?=
 =?us-ascii?Q?B3o3KYz4159IQsrYxVmzY8RHw2IODeHCN21QJzBHmoS/sOy+nDQUc2Ly8HSt?=
 =?us-ascii?Q?eoUpg5gZeXVW9mPHIsiByXHVRB3vYAU0AJ43n5l2lBzYHDmYbDnnWIQG0hJy?=
 =?us-ascii?Q?EQrtA+6sz6QEdR8tPeGQHNzrX/ilxTTtzCvOcxMQU0L+mXRRq9EneQZGSF7t?=
 =?us-ascii?Q?blk96liRswAfrmKEWWlGHP7vYtfyhRotjfNlG0jPicgkaFxWaUbVk99nFVB7?=
 =?us-ascii?Q?evOctIBg44TVM0TH9q29ShdFAXEmn6wijQq0gKJPgeVCgI+PrKJEFt8MU1jZ?=
 =?us-ascii?Q?diugMd0n4j9PmmZ/G+2L2rYWtjuaE7A+mfa0LHeK/VEkvpbkKRhRzv1tdNXc?=
 =?us-ascii?Q?12c0vVKdAkw05R3znQBroUgJWj1CnPZqYqtZ03uEgB0J/+Tx6YM+DXpSGI5W?=
 =?us-ascii?Q?BClCE5W9iiC35Y8wHV0pS3Tgr71VgHWqXsK+7EdhJigp/3BhIGRYb6g/CShO?=
 =?us-ascii?Q?avV/kyfKbmtR8Dyt9qcWPyibM7d3c2jNX25WFSkc7V7qX4EufdOMPUAkdGun?=
 =?us-ascii?Q?1KORtevMfxv5m4Jdg5v6ZJeyksEp8mP1dGQWjaJsmZFEDPO5Jjqe1DhWvxJF?=
 =?us-ascii?Q?GJE8fuc7gHcIi5w9vUcBzd7DmaO7fKr3MGvzgWFWNfuihd8w79k1xtADpRAo?=
 =?us-ascii?Q?/8s1fi+GvtEo/VLjncAK5HAu2shZrVjNeb+ojS1ibvlHBBPs+iF8QQn50pF4?=
 =?us-ascii?Q?2+lSocv+P8pFsTRdvM19K80Wt5ZYHoFooXTXc00u8M8M3TWjeDGmxFQw5Y+V?=
 =?us-ascii?Q?qQXE6ZjWQxUMYw3v6NfF/As7cuHmOSrlZ7TSgKiGELB8gfivaq01dKve4EFP?=
 =?us-ascii?Q?5iBt5vvlqR/DBy1oB0jqiKRNaCEEJfkfcNyuXXH5bAoI3eMf+QlYTdu5sigE?=
 =?us-ascii?Q?ImrmxRyvGZdmUinOxY5AHd4gVCpeWdh4Ulr/XoZTyDt40CWeXhWKE9g5V4vn?=
 =?us-ascii?Q?5AI3wOeuF90b6W3kHS/e4rRDAj1eDGuEe0JOQdpLONWIjhWVm8d1s7AvKF9c?=
 =?us-ascii?Q?38K0oHMz+rGIZIv4IiGpic+EsD9SZjgDJabyf2MlZiE7Jsp55sLmtM4pqjEZ?=
 =?us-ascii?Q?KcFSqAbOyrEs0DkbC9oaAUdpaPYt/NkBju3WCMDFwn/1TFdX6lmh9QmV0XfP?=
 =?us-ascii?Q?BgmWAF07XXpyvgT21TNSVCBubA+nFqXnkv4v8WgQnYTKKG9PMdqkdI/YyZgO?=
 =?us-ascii?Q?Hyl+1PsYQlVd6mPZS4/LCBdG92b0OhhhnH/f8CpmStpZdnzyS4LAq6G4mDFL?=
 =?us-ascii?Q?O5l55uM/YtqszLrCa5j1j4Sv6VJt859fI9BUT/bFW6cYMDjz3nPs/b0DnFBz?=
 =?us-ascii?Q?Pvht2jq9QMidiBUylnn46/JGjyiz5iGXJvzDVNuqnrsdt55aVSt5UP93Bjum?=
 =?us-ascii?Q?jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26afc52e-c542-4980-5c82-08dcf853563e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 19:53:19.4502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: igBdljpiw1HpNqsQJbHYuv/hmMaU80w8HNeANQq8Ske3OKOPUtjqMOW8T1YTRgUONgbuHdhUD2mPcLFf/sRMNwZa3d6kHdsdxCJWBgbnZmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7529
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

On Tue, Oct 29, 2024 at 12:31:54PM -0700, Umesh Nerlige Ramappa wrote:
>On Tue, Oct 29, 2024 at 02:12:22PM -0500, Lucas De Marchi wrote:
>>On Tue, Oct 29, 2024 at 12:58:35PM -0500, Lucas De Marchi wrote:
>>>>>Starting subtest: utilization-single-full-load-destroy-queue
>>>>>....
>>>>>(xe_drm_fdinfo:5997) DEBUG: vcs: spinner ended (timestamp=4818209)
>>>>>(xe_drm_fdinfo:5997) DEBUG: vcs: sample 1: cycles 9637999, total_cycles 19272820538
>>>>>(xe_drm_fdinfo:5997) DEBUG: vcs: sample 2: cycles 9637999, total_cycles 19277703269
>>>>>(xe_drm_fdinfo:5997) DEBUG: vcs: percent: 0.000000
>>>>>(xe_drm_fdinfo:5997) CRITICAL: Test assertion failure function check_results, file ../tests/intel/xe_drm_fdinfo.c:527:
>>>>>(xe_drm_fdinfo:5997) CRITICAL: Failed assertion: 95.0 < percent
>>>>>(xe_drm_fdinfo:5997) CRITICAL: error: 95.000000 >= 0.000000
>>>>>(xe_drm_fdinfo:5997) igt_core-INFO: Stack trace:
>>>>>(xe_drm_fdinfo:5997) igt_core-INFO:   #0 ../lib/igt_core.c:2051 __igt_fail_assert()
>>>>>(xe_drm_fdinfo:5997) igt_core-INFO:   #1 [check_results+0x204]
>>>>>(xe_drm_fdinfo:5997) igt_core-INFO:   #2 ../tests/intel/xe_drm_fdinfo.c:860 __igt_unique____real_main806()
>>>>>(xe_drm_fdinfo:5997) igt_core-INFO:   #3 ../tests/intel/xe_drm_fdinfo.c:806 main()
>>>>>(xe_drm_fdinfo:5997) igt_core-INFO:   #4 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
>>>>>(xe_drm_fdinfo:5997) igt_core-INFO:   #5 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
>>>>>(xe_drm_fdinfo:5997) igt_core-INFO:   #6 [_start+0x25]
>>>>>****  END  ****
>>>>>
>>>>>which makes me think it's probably related to the kill being async as
>>>>>you mentioned.
>>>>>
>>>>>I wonder if we should synchronize the call in the fdinfo read with the
>>>>>queues that are going away.
>>>>
>>>>Hmm, maybe.
>>>
>>>doing that it passes for me 62/100 running all
>>>xe_drm_fdinfo@utilization-* tests.
>>>
>>>The failure on run 63 is different  and I think it's another bug or
>>
>>
>>so the other failure, that I forgot to paste:
>>
>>	Starting subtest: utilization-all-full-load
>>	(xe_drm_fdinfo:14864) CRITICAL: Test assertion failure function check_results, file ../tests/intel/xe_drm_fdinfo.c:528:
>>	(xe_drm_fdinfo:14864) CRITICAL: Failed assertion: percent < 105.0
>>	(xe_drm_fdinfo:14864) CRITICAL: error: 315.453826 >= 105.000000
>>	Stack trace:
>>	  #0 ../lib/igt_core.c:2051 __igt_fail_assert()
>>	  #1 ../tests/intel/xe_drm_fdinfo.c:520 check_results()
>>	  #2 ../tests/intel/xe_drm_fdinfo.c:464 __igt_unique____real_main806()
>>	  #3 ../tests/intel/xe_drm_fdinfo.c:806 main()
>>	  #4 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
>>	  #5 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
>>	  #6 [_start+0x25]
>>	Subtest utilization-all-full-load failed.
>>	**** DEBUG ****
>>	(xe_drm_fdinfo:14864) DEBUG: rcs: spinner started
>>	(xe_drm_fdinfo:14864) DEBUG: bcs: spinner started
>>	(xe_drm_fdinfo:14864) DEBUG: ccs: spinner started
>>	(xe_drm_fdinfo:14864) DEBUG: vcs: spinner started
>>	(xe_drm_fdinfo:14864) DEBUG: vecs: spinner started
>>	(xe_drm_fdinfo:14864) DEBUG: rcs: spinner ended (timestamp=15218479)
>>	(xe_drm_fdinfo:14864) DEBUG: bcs: spinner ended (timestamp=15194339)
>>	(xe_drm_fdinfo:14864) DEBUG: vcs: spinner ended (timestamp=4837648)
>>	(xe_drm_fdinfo:14864) DEBUG: vecs: spinner ended (timestamp=4816316)
>>	(xe_drm_fdinfo:14864) DEBUG: ccs: spinner ended (timestamp=4859494)
>>	(xe_drm_fdinfo:14864) DEBUG: rcs: sample 1: cycles 40481368, total_cycles 31104224861
>>	(xe_drm_fdinfo:14864) DEBUG: rcs: sample 2: cycles 55700053, total_cycles 31109049238
>>	(xe_drm_fdinfo:14864) DEBUG: rcs: percent: 315.453826
>>	(xe_drm_fdinfo:14864) CRITICAL: Test assertion failure function check_results, file ../tests/intel/xe_drm_fdinfo.c:528:
>>	(xe_drm_fdinfo:14864) CRITICAL: Failed assertion: percent < 105.0
>>	(xe_drm_fdinfo:14864) CRITICAL: error: 315.453826 >= 105.000000
>>	(xe_drm_fdinfo:14864) igt_core-INFO: Stack trace:
>>	(xe_drm_fdinfo:14864) igt_core-INFO:   #0 ../lib/igt_core.c:2051 __igt_fail_assert()
>>
>>
>>From the timestamp read by the GPU;
>>rcs timestamp=15218479 and bcs timestamp=15194339... which is indeed much
>>higher than the total_cycles available:
>>31109049238 - 31104224861 = 4824377, which is reasonably similar to the
>>timestamp for the other engines.
>>
>>my hypothesis is something like this:
>>
>>sample1:
>>	accumulate_exec_queue (t = 0)
>>				<<<<<<<< premption
>>	read_total_gpu_cycles (t = 200)
>>
>>sample2:
>>	accumulate_exec_queue (t = 300)
>>	read_total_gpu_cycles  (t = 300)
>>
>
>It could as well be the second sample, see my previous email on why 
>run ticks can be larger than the gt timestamp delta.
>
>For the sake of narrowing it down, you could capture the value of 
>CTX_TIMESTAMP mmio before killing the exec queue in destroy. It should 
>be ticking since the context is active. Once the context stops, it 
>would have an updated value. That way we know how long it took to 
>stop.

in this test there is no kill involved.... it happens in
utilization-all-full-load

Lucas De Marchi
