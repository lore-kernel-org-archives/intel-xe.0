Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55F8D3A692
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 19:12:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7220E10E6E8;
	Tue, 29 Oct 2024 19:12:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dPUfzCfU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5422810E6E8
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 19:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730229151; x=1761765151;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ioS6Fc7MdRarqTEGzVc8xTtnKDkgnBJiia3bnqmxeaY=;
 b=dPUfzCfUzc2Q3cwMoZccYtuSPMwIzjtSlzc9pfgtluFf0pUhl3Kb8wPn
 N5h1smk8cio2pibzaaCF7QzsYNCW9k/t1t4ro0SxxN4LKBZqx/zbctTzx
 xGv66n3qKHcmcqkgIElZxKU0uENUKEFfcyatOnXKqLaZgNQg2SxaCrcMv
 UeZJaHY5NBSbMP4Fvm5oMZljv5RbVYuv7Pel82f/7xzBG7h0qQcUGvdkQ
 0iSEq0NVmdKURByaLt+aAICc93+jShuvbssFeaksplRUtoVPWh/BZM19a
 5A1PTvY7RF2UQhRbmruqTHB4I4Wx/ut8OPQNb9VyIzoQDXRa6EI0EWarn Q==;
X-CSE-ConnectionGUID: 10w+yqmaQh6mWHhMM4M8Gw==
X-CSE-MsgGUID: I/2MANQTQOmGDmXTvYgd6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="30008858"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="30008858"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 12:12:31 -0700
X-CSE-ConnectionGUID: sKowvKboSpGKMuVBHMbjGw==
X-CSE-MsgGUID: /tXd1x3ZTIGYnIIkqbdrPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="82390053"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Oct 2024 12:12:31 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Oct 2024 12:12:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 29 Oct 2024 12:12:30 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 29 Oct 2024 12:12:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f/ZPG/ckgyuf7J7zuPfbkit+/xyuxuvoejh7wJK7+xSUt5hrH5L76z5IM3Ek+DtzwbssHeaOimssCtMgvRGfeLNWybV6fBPs41VFUt5wt0INTwidjsCfI5FY8TLgLBX2wgSYAc9abNrdjdyCzfDbWL8A97zgDn5u/SWFnz2dYYj6c50+IUmz6KT+h0pEAhFsX6l+ThxDwyc8oR8FNSqHuVxOQQdCpFek+T/myoJd9QUMYZRrJlOrHReoNJ2q+dwfQkFrP8nQyONhaWuglXoBggY81aTDmWhY0ULADlb4cNzItsYBPIk6FpmW6tjqmxOolwDSYx1C1a+RLIOQMtwn9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cEwiHcYIn/isGvZmF7W46ZiAWHrD9rINTF/S3h7MEzg=;
 b=i7Zc6nbgaKR/n+9/bGEKpn5pffeYFvx11GPf8Fl9fbrYfj1dJBo7DKK5i4+E4vdtm9rCkjpTPYxVcch3RXTJMX9J8tLQUbjH3CZf86GBDf034SDkSyTWtsCbMhmT0EdPRS0xK0ivgd6QEmaxycapLPJhVoTutmcVNKVQUcxsXrsEh7Lwz7pFJurbT5ZBDyzqXKqsKi0Z3UhkwQd7WZMlacHcCAjCphtdrTZwbewgJw9sfO1GXbEzmhPN50m46LCLASBNDz/ebqj12OqzMcnMUWRRbup0yy1BaX4J/3X97FP+NyywPw/GdM8VB43Ov128bq7JGFReykuCRMbHmAezRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB7436.namprd11.prod.outlook.com (2603:10b6:806:307::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.18; Tue, 29 Oct
 2024 19:12:27 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8093.024; Tue, 29 Oct 2024
 19:12:27 +0000
Date: Tue, 29 Oct 2024 14:12:22 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Accumulate exec queue timestamp on destroy
Message-ID: <gjm5bmsmlxn7upcvegofokepypbnbhvnkb2ikcakezoxlpvkn3@zc4glcg466ff>
References: <20241026170952.94670-2-lucas.demarchi@intel.com>
 <20241026170952.94670-4-lucas.demarchi@intel.com>
 <Zx/1BZ93nLSC1pFs@orsosgc001>
 <zdjmy5xxglhenvw72jto4oajnkuczyuetp2nnrgkfat77vhmnx@xq6fthganhf7>
 <ZyEbAH60kKHDyA/m@orsosgc001>
 <miao7b7igj35dgaaqea2li7vc722gxwjslnqklwqf34zavtsb6@dhj4cxfpmyoo>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <miao7b7igj35dgaaqea2li7vc722gxwjslnqklwqf34zavtsb6@dhj4cxfpmyoo>
X-ClientProxiedBy: MW4PR03CA0172.namprd03.prod.outlook.com
 (2603:10b6:303:8d::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB7436:EE_
X-MS-Office365-Filtering-Correlation-Id: 669ff328-8d54-4f29-142d-08dcf84da0c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cniQBfXfKcw7WcyY8Cl/4Kn/d7J4K8IPirsPOqBOPUcS8tKFX1d7xLmQ7+nK?=
 =?us-ascii?Q?RMIHVC7TmOa5TmEYPEiSKRbB088t6ofOH7cLJFra2/IGIsxxhjSW82C7J2vI?=
 =?us-ascii?Q?gBa/BejGQo69DAJyUSzVTMfdt7PXIM/hVDGt+1usltACQMPnUZhTNQsfitLA?=
 =?us-ascii?Q?gUIqSwhMO7BHb4ORkVhbXwhRDiinctAvnEPLTCKRECJ3tBc5cU4+bhukM5wl?=
 =?us-ascii?Q?muc2AhUi/grdc+VKsqhRmKTs9tPlbiTP6NlXyTzxHBwJpNv8CAA6PZ36ofLc?=
 =?us-ascii?Q?13rYBycV7+xEO/PJvOeLiW0I4aSJeiZ2jezTwCh17culRGzWCOSAr80FFPKG?=
 =?us-ascii?Q?9wwoa0bixcsOkGDKyhp48sSaQQq5aJ855pJEzKENLEkovFhA+1C6uCcRWxvt?=
 =?us-ascii?Q?XSc/gi0gQzfpX7Snfj1rquLVvauvqCq3M595eWQ2nPPOzalAM+hoG2OQLa1H?=
 =?us-ascii?Q?mzW6SD94EB2ZCb/LCzyeXoaM7vmiNEQ649358ya2ByRIb59q5k3Jw/An67so?=
 =?us-ascii?Q?j20o5bhKtpQcqPOASsTHQXe5gEkLoX3pQtL2s6r13kat7uVdNkTzOUtYPDZh?=
 =?us-ascii?Q?fK+ccaOxXOKO63Ey0xyEGGMw17QVtBpioyeB77d/wg2IJ0EK7/u5TK1nqwsE?=
 =?us-ascii?Q?PSmRU/AEE2fxW6HPHajUe/U4XMn+V5F3s8R+4+zYQ1yptH/EaCF87P9hinPN?=
 =?us-ascii?Q?wd74t73d7fig7HESOattVgxu0YpCKW4z1veCHKb1sGJJiBFH3b0e6w6W7896?=
 =?us-ascii?Q?aX+A1c2m5DzcIiYMmLObBZnfutRlnzhc1L8h5UrrNwgvlGDk6bSf1XkgM7sI?=
 =?us-ascii?Q?b+VJN/zO4tGzZnmk3fhb3K11H7aQQu/d01r5zVSztV60vMIJwUG+jCGCWya3?=
 =?us-ascii?Q?2oGcmAM02DSHXZDuqRvfV0CieKyNk3gmwMVt0cbebpVijW/DiV+UKIHq5Ajp?=
 =?us-ascii?Q?kr7Pm2jEH0Db5kJex7Rjp+cgz51jnsVEmB4iHcMJOwIX1zY8HZ1j6eI+Ossm?=
 =?us-ascii?Q?sB9j/K1Q6bpLTVq+wEntlNVynWNPey5LjBVLHrYw4zbN6V6RFagCSCKdpWyt?=
 =?us-ascii?Q?oOUeb53Zed8IcTRHzpX6at+EkKr0hV2BVnSeLAH4pt51Zjq8IsFk0c4wOmUA?=
 =?us-ascii?Q?U2DeHBl/5wLkIsxXUZyYqc10BwBWXuXhbOESJTrGQTug71y0FwhSMNFHVE1X?=
 =?us-ascii?Q?xcSxdNPgfXns0JU53LElkDbglgjlslYK9lLUnr4HucuOIRyvGYH0aNF7VZTv?=
 =?us-ascii?Q?OG9YdGMbFqCcRo7hkQVcKKbQUfNDH8b2CJXGYXr2E0+8jTHHGCKa3XkUNTeM?=
 =?us-ascii?Q?a5qmf4S14PNjzN/dkTohjbIu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?io2oO04hER7CusvSB/dA/3VdDuHWfXIjSUvOTMdYzCCR8exbKsX6YGWZEHGq?=
 =?us-ascii?Q?hr/T3N1XGh7nR/vOWDBERCL/wg07DtY/ZPCkt5NEa8DcBTTN7+s3Zat5U+5X?=
 =?us-ascii?Q?lPlQ7mzE4hz7V4DCyXRxR3z2LXku86UV9ESCQQEYK/wCSUT3R864SuicTG0K?=
 =?us-ascii?Q?qfsUooEsCeWC1WdP30MNnd3M9GR3jWbj+q4HI1QsA++uAjAsAy+CGKhGhP/n?=
 =?us-ascii?Q?eLumx5NFI3YnOdPsUWIC97G0QvBqCMsf6kE7XtH0iS0UkjjLLSoTgzXAmasA?=
 =?us-ascii?Q?mIsKYesKf/o2L0s+1X23CSPnjHqKGcnnTJCyfHJUz52rRArQ/wX8zttPvWOd?=
 =?us-ascii?Q?au489DOgr8QQCCFGvtDKqe6a8HVvALl7wZwSLQJ6GomIRG2YLDxF16Fc7gt/?=
 =?us-ascii?Q?TPicGCNC4ZJ3Tez467a9BqR0tW62kd756k8chrjf2yX88JFKbaF8tcADNkbf?=
 =?us-ascii?Q?fM2xSLdlayRplRxiYWi+bh9juB6jZbzCVFp42pxtf8vkW41lid0WKX3Pz6E0?=
 =?us-ascii?Q?Aw7lG9a4uyeIRiMuFj1uVp/pr8yfMz3eNf1TgD5mrb9jxUzCERsbQfhceepp?=
 =?us-ascii?Q?44PZhCMyXFTGZV9gGYTlAIrcCq6PjDRUHw3GXYhKSoGma66P0m5WP6ETMkux?=
 =?us-ascii?Q?Suxt/zKRzJno9FrVT11HKIdbuPa06xHWsjyvhepPjizn4U76eGDPcHlmPjPC?=
 =?us-ascii?Q?jb8Vnqw6dqnI3UwmiTmc2berpfk4CEIWIJ7ao0+lCRhCm31I+1san1HQ10Dg?=
 =?us-ascii?Q?ZhCChTiNBLn/OJR/tQysOVyqqQW5TM3EUI1REOe5qS04yMP3FF6KLRk3Qoik?=
 =?us-ascii?Q?w5nHFvaWsVRIt+zC7QtjXEfA2id98kbpa9XWZFTOQ7Gi9KuGrMWw72Ld27s5?=
 =?us-ascii?Q?K6GAHeSsgAvCrj0HXDYlsogLaASRofGQ4Xpt/WljT9R/mrDM2TDaswJuVo42?=
 =?us-ascii?Q?j4ek7Ss6x0Rqkuuum5DNpdtZ/VDYCXsIFYs6RRZRKfEI+3kY8gnf2jjFTYgk?=
 =?us-ascii?Q?FB0VocHy28DIkl8UEQBfpH0SEuu/WLs9QhDzkBByHU5LvSK1YgmCYREoIm5G?=
 =?us-ascii?Q?eIdVUVa3Ij4Fyoju6caNntDFTQxSXHbj+CrzqF4Utuv/RQjFL7JWAfuK4fYX?=
 =?us-ascii?Q?UnjPtd5bkqdeSUSszICk8JXvC3Vmp09ZkvmKzbf2vXUtxGZkVm69J0qb55Qc?=
 =?us-ascii?Q?YwSu7Ij1KnZegNwq7lh+VRitRkfZKDlRKWsR6RO3xNFADfroyNJA7xBp5Uj5?=
 =?us-ascii?Q?GA9JGpbhSgo/CfB5Q4xKnaTCNka+xIfcq8DlVyCHYGBp+uJHhjWywnJm1x71?=
 =?us-ascii?Q?1/069oiH3iBvJYkql+1YcBQeH7R3CwxOSiaG3ySzD4jqUAtnXVJ5GFdJTT9t?=
 =?us-ascii?Q?Tn04ZODmwhfltcfAqIBlGbHi281r8KpdC7eKROq6p12YNb4G+nvxpc6vSOu1?=
 =?us-ascii?Q?uDJb3ZuGBDjJh5Qv6XBV5TeDv0kL8dkFqwQXU56bvX7Rz4ffkHJiPeIlTyy/?=
 =?us-ascii?Q?ZJCD+ZS4zyR80Y/izJTNgoDdxn2S2CP9cypWPtP6pidKPxNFLKK/9lrx9Z+f?=
 =?us-ascii?Q?jtxKiJerH+U59nuQgBR/3kiP2UxXFGmWngRyttrhrF4UTfP0//cDh7Q/hVD8?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 669ff328-8d54-4f29-142d-08dcf84da0c0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 19:12:27.7412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yjhU/1zm7SnvCq049H/qLJPIkrIOI+ZLTBHBO3kbpFcaKZl5O4aw5BseYAKjpD2ah5i/o1J0wGde5DG2DiwM9S8dXbCT1WYb0fQ58AKrqSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7436
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

On Tue, Oct 29, 2024 at 12:58:35PM -0500, Lucas De Marchi wrote:
>>>Starting subtest: utilization-single-full-load-destroy-queue
>>>....
>>>(xe_drm_fdinfo:5997) DEBUG: vcs: spinner ended (timestamp=4818209)
>>>(xe_drm_fdinfo:5997) DEBUG: vcs: sample 1: cycles 9637999, total_cycles 19272820538
>>>(xe_drm_fdinfo:5997) DEBUG: vcs: sample 2: cycles 9637999, total_cycles 19277703269
>>>(xe_drm_fdinfo:5997) DEBUG: vcs: percent: 0.000000
>>>(xe_drm_fdinfo:5997) CRITICAL: Test assertion failure function check_results, file ../tests/intel/xe_drm_fdinfo.c:527:
>>>(xe_drm_fdinfo:5997) CRITICAL: Failed assertion: 95.0 < percent
>>>(xe_drm_fdinfo:5997) CRITICAL: error: 95.000000 >= 0.000000
>>>(xe_drm_fdinfo:5997) igt_core-INFO: Stack trace:
>>>(xe_drm_fdinfo:5997) igt_core-INFO:   #0 ../lib/igt_core.c:2051 __igt_fail_assert()
>>>(xe_drm_fdinfo:5997) igt_core-INFO:   #1 [check_results+0x204]
>>>(xe_drm_fdinfo:5997) igt_core-INFO:   #2 ../tests/intel/xe_drm_fdinfo.c:860 __igt_unique____real_main806()
>>>(xe_drm_fdinfo:5997) igt_core-INFO:   #3 ../tests/intel/xe_drm_fdinfo.c:806 main()
>>>(xe_drm_fdinfo:5997) igt_core-INFO:   #4 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
>>>(xe_drm_fdinfo:5997) igt_core-INFO:   #5 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
>>>(xe_drm_fdinfo:5997) igt_core-INFO:   #6 [_start+0x25]
>>>****  END  ****
>>>
>>>which makes me think it's probably related to the kill being async as
>>>you mentioned.
>>>
>>>I wonder if we should synchronize the call in the fdinfo read with the
>>>queues that are going away.
>>
>>Hmm, maybe.
>
>doing that it passes for me 62/100 running all
>xe_drm_fdinfo@utilization-* tests.
>
>The failure on run 63 is different  and I think it's another bug or


so the other failure, that I forgot to paste:

	Starting subtest: utilization-all-full-load
	(xe_drm_fdinfo:14864) CRITICAL: Test assertion failure function check_results, file ../tests/intel/xe_drm_fdinfo.c:528:
	(xe_drm_fdinfo:14864) CRITICAL: Failed assertion: percent < 105.0
	(xe_drm_fdinfo:14864) CRITICAL: error: 315.453826 >= 105.000000
	Stack trace:
	  #0 ../lib/igt_core.c:2051 __igt_fail_assert()
	  #1 ../tests/intel/xe_drm_fdinfo.c:520 check_results()
	  #2 ../tests/intel/xe_drm_fdinfo.c:464 __igt_unique____real_main806()
	  #3 ../tests/intel/xe_drm_fdinfo.c:806 main()
	  #4 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
	  #5 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
	  #6 [_start+0x25]
	Subtest utilization-all-full-load failed.
	**** DEBUG ****
	(xe_drm_fdinfo:14864) DEBUG: rcs: spinner started
	(xe_drm_fdinfo:14864) DEBUG: bcs: spinner started
	(xe_drm_fdinfo:14864) DEBUG: ccs: spinner started
	(xe_drm_fdinfo:14864) DEBUG: vcs: spinner started
	(xe_drm_fdinfo:14864) DEBUG: vecs: spinner started
	(xe_drm_fdinfo:14864) DEBUG: rcs: spinner ended (timestamp=15218479)
	(xe_drm_fdinfo:14864) DEBUG: bcs: spinner ended (timestamp=15194339)
	(xe_drm_fdinfo:14864) DEBUG: vcs: spinner ended (timestamp=4837648)
	(xe_drm_fdinfo:14864) DEBUG: vecs: spinner ended (timestamp=4816316)
	(xe_drm_fdinfo:14864) DEBUG: ccs: spinner ended (timestamp=4859494)
	(xe_drm_fdinfo:14864) DEBUG: rcs: sample 1: cycles 40481368, total_cycles 31104224861
	(xe_drm_fdinfo:14864) DEBUG: rcs: sample 2: cycles 55700053, total_cycles 31109049238
	(xe_drm_fdinfo:14864) DEBUG: rcs: percent: 315.453826
	(xe_drm_fdinfo:14864) CRITICAL: Test assertion failure function check_results, file ../tests/intel/xe_drm_fdinfo.c:528:
	(xe_drm_fdinfo:14864) CRITICAL: Failed assertion: percent < 105.0
	(xe_drm_fdinfo:14864) CRITICAL: error: 315.453826 >= 105.000000
	(xe_drm_fdinfo:14864) igt_core-INFO: Stack trace:
	(xe_drm_fdinfo:14864) igt_core-INFO:   #0 ../lib/igt_core.c:2051 __igt_fail_assert()


 From the timestamp read by the GPU;
rcs timestamp=15218479 and bcs timestamp=15194339... which is indeed much
higher than the total_cycles available:
31109049238 - 31104224861 = 4824377, which is reasonably similar to the
timestamp for the other engines.

my hypothesis is something like this:

sample1:
	accumulate_exec_queue (t = 0)
				<<<<<<<< premption
	read_total_gpu_cycles (t = 200)

sample2:
	accumulate_exec_queue (t = 300)
	read_total_gpu_cycles  (t = 300)


which makes cycles = 300, total_cycles = 200.

One easy thing to help: move the force wake finding/getting to the
beginning. I don't think it will be 100% bullet proof, but it improved
the execution on a misbehaving LNL to 100/100 pass. Maybe I was lucky in
this run.

Other than that we may need to resort to keep a copy of the last stamp
reported, redoing it if nonsense comes out, or add some locking

Lucas De Marchi

>race. This is what I'm testing with currently:
>
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index a3e777ad281e3..eaee19efeadce 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -614,6 +614,11 @@ struct xe_file {
>                 * does things while being held.
>                 */
>                struct mutex lock;
>+               /**
>+                * @exec_queue.pending_removal: items pending to be removed to
>+                * synchronize GPU state update with ongoing query.
>+                */
>+               atomic_t pending_removal;
>        } exec_queue;
>        /** @run_ticks: hw engine class run time in ticks for this drm client */
>diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>index a9b0d640b2581..5f6347d12eec5 100644
>--- a/drivers/gpu/drm/xe/xe_drm_client.c
>+++ b/drivers/gpu/drm/xe/xe_drm_client.c
>@@ -327,6 +327,13 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>        if (!read_total_gpu_timestamp(xe, &gpu_timestamp))
>                goto fail_gpu_timestamp;
>+       /*
>+        * Wait for any exec queue going away: their cycles will get updated on
>+        * context switch out, so wait for that to happen
>+        */
>+        wait_var_event(&xef->exec_queue.pending_removal,
>+                       !atomic_read(&xef->exec_queue.pending_removal));
>+
>        xe_pm_runtime_put(xe);
>        for (class = 0; class < XE_ENGINE_CLASS_MAX; class++) {
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>index fd0f3b3c9101d..58dd35beb15ad 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>@@ -262,8 +262,11 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
>        /*
>         * Before releasing our ref to lrc and xef, accumulate our run ticks
>+        * and wakeup any waiters.
>         */
>        xe_exec_queue_update_run_ticks(q);
>+       if (q->xef && atomic_dec_and_test(&q->xef->exec_queue.pending_removal))
>+               wake_up_var(&q->xef->exec_queue.pending_removal);
>        for (i = 0; i < q->width; ++i)
>                xe_lrc_put(q->lrc[i]);
>@@ -824,6 +827,7 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>            XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>                return -EINVAL;
>+       atomic_inc(&xef->exec_queue.pending_removal);
>        mutex_lock(&xef->exec_queue.lock);
>        q = xa_erase(&xef->exec_queue.xa, args->exec_queue_id);
>        mutex_unlock(&xef->exec_queue.lock);
>
>
>Idea is that any process reading the fdinfo needs to wait on contexts
>going away via kill.
>
>
>>
>>I was of the opinion that we should solve it in Xe by adding an 
>>update call in an additional place (like you are doing), but after 
>>digging into it a bit, I am not sure if we should resolve this 
>>specific issue. Instead, we should alter the test to not check for 
>>accuracy when the queue is destroyed before taking the second 
>>sample. We know that the ticks will get updated at some reasonable 
>>point in future and the user will see it in subsequent fdinfo 
>>queries anyways. If that "reasonable point in future" is 
>>unacceptably large, then I think the problem is outside the PCEU 
>>domain.
>>
>>Note that the original reason we added the test was to catch the ref 
>>count issue with xef object (which is now fixed).
>>
>>>
>>>Another thought I had was to use the wabb, but afaics we can only
>>>execute something on context restore, not on context save.
>>
>>I am curious what you want to run in context save though and how 
>>it's any different from what's happening now - CTX_TIMESTAMP is 
>>being updated on save.
>
>I was thinking about letting the gpu use MI_MATH to keep calculating
>the delta.... but yeah, it wouldn't help in this particular case.
>
>
>>
>>>
>>>>
>>>>If the ftrace is getting filed up, we could throttle that.
>>>
>>>oh no, that is definitely not what I want. If we enable the tracepoint, we
>>>want to see it, not artifically drop the events.
>>>
>>>Initially (and to get a good measure of function runtime), I was
>>>actually using retsnoop rather than using the previously non-existent
>>>tracepoint:
>>>
>>>	retsnoop -e xe_lrc_update_timestamp -e xe_lrc_create -e xe_lrc_destroy  -S -A -C args.fmt-max-arg-width=0
>>
>>Didn't know that. That's ^ useful.
>
>life saver - I keep forgetting options for the other tools to do similar
>stuff, but this one is so simple and effective.
>
>Lucas De Marchi
>
>>
>>Thanks,
>>Umesh
>>>
>>>Lucas De Marchi
>>>
>>>>
>>>>Thanks,
>>>>Umesh
>>>>
>>>>>	trace_xe_exec_queue_close(q);
>>>>>	xe_exec_queue_put(q);
>>>>>
>>>>>-- 
>>>>>2.47.0
>>>>>
