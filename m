Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC4FCA0ED1
	for <intel-xe@archiver.kernel.org>; Mon, 11 Aug 2025 21:14:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6003B10E315;
	Mon, 11 Aug 2025 21:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kfvi3ybU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11EE510E315
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Aug 2025 21:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754946848; x=1786482848;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nqyp6BoDc5n7yD3cRyGgEHDIydoO4LvjKsSDLjQASr8=;
 b=kfvi3ybUaqu95KoJN510Cm/2X6l8G3wqYtfn7P3GUTyg4ksWdHKgxvGr
 bjkew6QI8dORsjMcnNMRa33mUJNc7kHS4KwaMEwO8kMczxcVaEH1MxGVv
 Oa1cd1W2L1SdO3Fw1qK/VyS5NdohqhFbYI2Q3euIc/5A6jiKiOW1i8d9n
 EY0MLeJcicZQVnvpIJDDfQ80z9fZPh/DKU/e+rbmjgeFmMQ/GAzgcDGIM
 8qadkz04KQyYtnkpg9NwtefsYa9wh74EAgDMwsg13Wgt45pbGaCrfjxrn
 luy84gpWx6AWdlCTKwGWplNBJ3XYma2EdKw4TgpZCPUgxGy8z7jNZZ1hT g==;
X-CSE-ConnectionGUID: 6jvsEEADRMKr7X0LDNIf1Q==
X-CSE-MsgGUID: 4sJe3U1vQrW5CBuMKIGqEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="74795254"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="74795254"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 14:14:07 -0700
X-CSE-ConnectionGUID: 1zGI3XEzTaOpfn6AvV8urg==
X-CSE-MsgGUID: L2l0ehP6ROeBctwEEcttYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="170155597"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 14:14:07 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 14:14:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 14:14:07 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.51)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 14:14:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=byt/cN9L2tVfyFz3GvN/HDgV6yv8JLELRwIRrVEgrJSU9kycT7pS3iUPEZLVfQxIXQTiGuH4aCUkt2ONWJNM8w6OWu97FKOem+3ZiT8moZukrW+DCAkXJMNg5vXtkPZ52Mm0bHej/dGitA8vPkY3wQ/lk+R50S0BPDSq7+YQUwm8lsKMogm62336Pd3MKsipXuOAVkwEG+EWzCtiStIGPemevYDZCXtALLfBWls5GSAlt/w1iSf4DfaCV5/ECchRfiLD/sQJS3otm8OjzjWOiruG2itdkBpGsSdWHekA54uuJ12W91GV9y3eg5jAPOaP6g/DysExoq9NBFLyIRmy6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ttNTQ+agJJs10CJ0OGLXb1wwv8LZtynd+MOF7XkmX8=;
 b=UBOJtNj9cye3qKpMrjoatYstHhx+IDCm5Kzhan4JSrITKel44hs7VNkJlvvU/to21Wi03NrUs0ZUpZqSMyWw4y1UnyiQeuG14M8AGx2Ip7eQGA/PXh2sRgDZifQEW4pL1v6Rh8lXZoNsG3x26Do9rpYfCmyhXhUVJztRyOBsjnE7mq1dODoNi4FBtGEkHehn9JfJHR5mQXNjcuE2DrhFBwPVUygXEqO0vhOERM/dwi9IgHuX+NLxJ4v2te+EZS34P6HtHOyDHSbgTNJHzRPwsSR0sZxxqmFrnbcDuB1sT+1gMutVb1K1QiSq9F140U5syIM+xt48J0D6Sxx80SYTrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH0PR11MB5079.namprd11.prod.outlook.com (2603:10b6:510:3d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Mon, 11 Aug
 2025 21:14:04 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 21:14:04 +0000
Date: Mon, 11 Aug 2025 18:13:59 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jeevaka.badrappan@intel.com>
Subject: Re: [PATCH v2] drm/xe: GPU frequency tracing support
Message-ID: <i6iszloxcdb2olq5hspkzjefimracmqoawpu7t5gwlehgnyudv@usbccibofr7v>
References: <20250811083414.3863103-1-s.sebinraj@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250811083414.3863103-1-s.sebinraj@intel.com>
X-ClientProxiedBy: BY5PR13CA0002.namprd13.prod.outlook.com
 (2603:10b6:a03:180::15) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH0PR11MB5079:EE_
X-MS-Office365-Filtering-Correlation-Id: 57b46561-c2ff-4228-8594-08ddd91c000b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?g8riGmtFjomclecw6ahHacSwmx3/La1U79xW6iNsQQSjE7K2cWCxeoV8AG?=
 =?iso-8859-1?Q?01Xe9oEZHV+PpYtcf54X6yGrcoRaBrZEdLl5fKq9hIWMwuz11ns+hR1TUA?=
 =?iso-8859-1?Q?IlJgzv13RcNJ2+mw5YnU6ARUoDpw9a3i7FEj8QPDUkF28AUmyClpR7umID?=
 =?iso-8859-1?Q?rJQy+oO0WZuqSgvi9E61Lj7wPgmrovZpJHAr0/a3U+A0MqvlHkBZUp1kJi?=
 =?iso-8859-1?Q?cue+tvx1QYmR7UfUCITFHAQ0Ip5dug29w9OST0fZzU9zTTdSBUgFK3VsjP?=
 =?iso-8859-1?Q?iCAoN5puozBAnJwVXfIitC7GPgK9ucDQa70K71O5QypwVvMioisja51ARV?=
 =?iso-8859-1?Q?9+Ov3mzSPyq/o9QvEqW0P5fhxRqqnZ3J9eSQQAjNUphgGjxyhW3JtF8ydU?=
 =?iso-8859-1?Q?foI5s5cIu3c+AqS2JXw2juGFdzhFXzM9fpUcP/GhB7ZuHEmoNgy0EEyN+k?=
 =?iso-8859-1?Q?kyhxG+gLIHRfMIc5/t8NODuHS0C5cADNmWyfspBhB+ZW3KoMl2eHtVLPZt?=
 =?iso-8859-1?Q?l2HdJOesGZYIFgJ5NEO684H7OZaFPH1eSqjUN3ALBLEVnNjZ04OVg80UUS?=
 =?iso-8859-1?Q?YDLrgNUBHDsISQEuddllrBe0jn4zMR7gBbKJEGC9DRloXjSfVs9dJ1/SLh?=
 =?iso-8859-1?Q?/65+JgR++oXk9hajZ2ESJsawvwAb2+nyXdKMkF1l1Bm7FCb6MABpoBUDIH?=
 =?iso-8859-1?Q?RcsGCbJRqS8ctuj4TR0bR8KCLNKofXn0wZt7lGmZogb6YefpuN2LNFh/f6?=
 =?iso-8859-1?Q?bgskfX/FM02eonNhrZ9WE5H7hVLoGD+LzXNdal2yh7GXpIVNpK3hw8Qsk/?=
 =?iso-8859-1?Q?3JGVQ56rCvy0dBcKulET5MHRJW9LYrMz1BU/Az/r5rnCuNa81GmlyJzHMV?=
 =?iso-8859-1?Q?2+qNjYX18XOUGdKwXX0sgRitXvJlOCeWLifX+uX8dEMYKVjO+8lt25egEi?=
 =?iso-8859-1?Q?dUaw1KhuUlNIozWCylvsPicYTVYnGr0RHjttqV//BVRKhFOtyeimhYvZa6?=
 =?iso-8859-1?Q?qWKQ1OoKK1X9xOw1nX+kCJxPSvPFNtufOSLkT7D7OfL8RVG3ov42x6gRUq?=
 =?iso-8859-1?Q?2uBf36bW8wojLH08v+ic40HMaZ+irlO8UwWeBYTvik2PfLi94ahQNODcSM?=
 =?iso-8859-1?Q?wzQRglR4VZ/+uv9ip5GuDt/gFvIBvO+wbE/frv+erQZcRyHdNx7EjQgGXe?=
 =?iso-8859-1?Q?6P0uRHxqhwPlFKlzJdzZiXC61nUPCxWXNmZt4saf3AhQvjlR5vMqv2EcLT?=
 =?iso-8859-1?Q?kIfYeckKo26pdtW2LN2/MsAYwgXOIz1f+kVPKpYAg3p17CH8CTvV5oGQlo?=
 =?iso-8859-1?Q?TMkyH1H5QMaVhilnZl89yu81ciB4NnqVrWzjZLaxjFEgXNQcT2nkLRtbuy?=
 =?iso-8859-1?Q?HNFgrIrpObIhfst9tl1Emk8njlXiuPfnw9zTjjpcv9itMtdm0oLZgfjKso?=
 =?iso-8859-1?Q?6dl+wEGaVXCQ5QYMWHtKSExJyeE5C/67Cq3dJDXbkJDZVbMap2BGDnKms5?=
 =?iso-8859-1?Q?0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?K+oe5pdFv1VQ7YxJ7RDrT4h23qyg7dQnFk9EzPTvt4VKd7i8kT5dKCF3iv?=
 =?iso-8859-1?Q?SBMXiSTJ0CpxSy/q4XGU7FmylKRZceHuS11Z8BJ/vRcOUq4wWa5MIibXL8?=
 =?iso-8859-1?Q?Km/BMHj9qjVBuatYoo7JfvTNwQuS2WqpO26l3Z31hA/+J8yo7/Pe3ch25v?=
 =?iso-8859-1?Q?WgZmKp1izDuHaFM6e4co5s1XhgC7ApYsyAYXZbNMRPEJy0kPMycay7zYo4?=
 =?iso-8859-1?Q?32QDnaGgQZduKRkB0w2EHKJI2crl5s1ukBmEiL8YcwOvJbjO4ujiAtlZtS?=
 =?iso-8859-1?Q?nZBLJ5tX8B4NTyDNH1/MJH+EslXea1Q7hOINsQvd86yZxJ3G5UNx1Tefas?=
 =?iso-8859-1?Q?zR1D/PG47BJWCjAypunC4S92QP5KaSneKGZP3ahQk6UzW+/539jSNvcRQO?=
 =?iso-8859-1?Q?NWDN42+Xk+wK9xAV/9ZXlZW/IxjyE+0w1GKttwA414ceqLVsVFUklOb9l+?=
 =?iso-8859-1?Q?TbsyL+2NoEhiLIlWEGU2GzPaQH8bh8o3nDP5sNqdlmRPopAFwk2uNSGJ4t?=
 =?iso-8859-1?Q?0Nv/rpmJIa4uSbyJRd2/5bcNCh/TN30rrQOGXyjjOMs0JS0hDi5Pxi0vsM?=
 =?iso-8859-1?Q?HP72bDNw5XQYnUFI1/8fkYkf8TgDm9pLd+IyPsoFIKT1QW6sqpIZQoXkVh?=
 =?iso-8859-1?Q?YTaEKlJjWPEfXrKdvHz59S6/wV/7EIYGMwDw97x0cL7eaP7huwIhTquaDD?=
 =?iso-8859-1?Q?lgdZAnNZ2xwNdfmcuSufXhVc2XJSKRlPlNF4ZIFcWOF2LSG9jAP7p/VEMR?=
 =?iso-8859-1?Q?Vfi3VlS7FDBAFLjwgA1Y+RQA1fQMevpUHHpv0nYIzhkR5ZJuhMSRALuO/Q?=
 =?iso-8859-1?Q?i+p3WhUQcl6jFkRsqGEczjccUYaTcgCnStDzYC+pFj1mADTFiD7xIX+oWk?=
 =?iso-8859-1?Q?QC7VWgWPQvZKvSCfs2JunHUkWs6WfgyxrZQEz2AuH5LHJXvUb/8BTtgqHW?=
 =?iso-8859-1?Q?t3eQWuFD84ujF43rVO5JNHSxTHwvMcyFgBfG2H6cm9ZCBr816UQiliG0F8?=
 =?iso-8859-1?Q?KveRRawEJCWm5EZcCmT9IeaAp7CCjK4QHyaUp3eYnanRpXuo/OBrjNoA5O?=
 =?iso-8859-1?Q?ppwWHlyKXrfFFpsmskjykdd1ljhckZmAkvc8otZq04r6X3gGFz6I+Zyuob?=
 =?iso-8859-1?Q?tz5LQ70DURY0z/0WNsrloDVckb4gyb45VxpShXB1j0RN/SZpj1vZR3P4o/?=
 =?iso-8859-1?Q?nYvdlhhr0knFvDvqiBaxwx1ds2KeekwyDqQin3yPP++DcSHHEwlMkFUYNF?=
 =?iso-8859-1?Q?jiYZk3SaRZzlYzQN8aQ3KERZR4fvIuJ2oo6VGE/eY+PV8LXsYlGZRdluJ/?=
 =?iso-8859-1?Q?3gEElcWXrIKopdKi3bgbg22hEG4FozMVj8jUpLl5jGbr9HERSZY1n5CSXL?=
 =?iso-8859-1?Q?7nxG2lavAUlvZGSJbrD8eVfGZnLxrrvsVtfzFgBXmzs/oEounIzX85TKfC?=
 =?iso-8859-1?Q?O2zBs8GRpDUrJWHAaSkH1jasgE8j/PyX4UajYe5yUVVCDgcNL8tPQ9/xBX?=
 =?iso-8859-1?Q?AtDGMjBGorLRn1I1VhQPma0YaIKgMjkL1bms61NIFUPVTi0M8l8u3gFYRF?=
 =?iso-8859-1?Q?Ir6YbGYnU5jnNHlVc+4l+IX/kNj1DtXJNoJk2q9qbTCeC+irIBGnhbSB2g?=
 =?iso-8859-1?Q?VbdWE9dvVK17GQ2NS8DRhWlTmUpH/mPqYzxWH6KrXKMej4UFUVV2ciRQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57b46561-c2ff-4228-8594-08ddd91c000b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 21:14:04.3156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SlDEXZ35xfanX2ra+3Lyotg6tqxbrpOjHtpOlnjamhOUlXfXJnJkBcdgz1vbBxbYl01SUaD95/safWrNxGb+fKgZdkYbT0b6Qj/eQKBF/ik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5079
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

On Mon, Aug 11, 2025 at 02:04:14PM +0530, S Sebinraj wrote:
>A periodic GPU frequency monitoring and tracing program for the
>Xe driver. The implementation provides periodic sampling of
>GPU frequency through the Linux ftrace infrastructure.
>
>Key features:
>- Periodic GPU frequency sampling with configurable intervals
>- Immediate frequency change reporting via tracepoints
>- Integration with Linux ftrace subsystem under 'power' events
>- Per-GT (Graphics Technology) monitoring support
>- Dedicated workqueue for non-blocking frequency sampling
>- Configurable via CONFIG_DRM_XE_GPUFREQTRACER kernel option
>- The monitoring interval can be configured at runtime via the sysfs
>  (default 5sec).
>
>The sysfs entry is at:
>/sys/module/xe/parameters/gpufreq_monitoring_interval_ms

This is actually a module parameter, which is global to all devices xe
binds to.

>
>The tracepoint is exposed at:
>/sys/kernel/debug/tracing/events/power/gpu_frequency
>
>Format: {unsigned int state, unsigned int gpu_id}
>- state: GPU frequency in KHz
>- gpu_id: GPU clock domain identifier
>
>This enables userspace tools and system monitoring applications to track
>GPU frequency changes for power management analysis, performance tuning,
>and debugging purposes.
>
>Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
>---
> drivers/gpu/drm/xe/Kconfig                  |  22 ++
> drivers/gpu/drm/xe/Makefile                 |   3 +
> drivers/gpu/drm/xe/xe_device.c              |   7 +
> drivers/gpu/drm/xe/xe_device_types.h        |   4 +
> drivers/gpu/drm/xe/xe_gpufreqtracer.c       | 292 ++++++++++++++++++++
> drivers/gpu/drm/xe/xe_gpufreqtracer.h       |  30 ++
> drivers/gpu/drm/xe/xe_gpufreqtracer_trace.h |  48 ++++
> drivers/gpu/drm/xe/xe_module.c              |  12 +
> drivers/gpu/drm/xe/xe_module.h              |   3 +
> 9 files changed, 421 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_gpufreqtracer.c
> create mode 100644 drivers/gpu/drm/xe/xe_gpufreqtracer.h
> create mode 100644 drivers/gpu/drm/xe/xe_gpufreqtracer_trace.h
>
>diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>index 714d5702dfd7..d9d07ec69875 100644
>--- a/drivers/gpu/drm/xe/Kconfig
>+++ b/drivers/gpu/drm/xe/Kconfig
>@@ -129,6 +129,28 @@ config DRM_XE_FORCE_PROBE
>
> 	  Use "!*" to block the probe of the driver for all known devices.
>
>+config DRM_XE_GPUFREQTRACER
>+	bool "Enable XE GPU frequency tracing"
>+	depends on DRM_XE && FTRACE
>+	default n
>+	help
>+	  Enable GPU frequency tracing support for Intel XE driver.
>+	  This adds an ftrace tracepoint that reports GPU frequency changes
>+	  at periodic boundaries (default 5 secs, configurable via the
>+	  gpufreq_monitoring_interval_ms module parameter) and
>+	  on direct frequency change events.
>+
>+	  The monitoring interval can be configured at runtime via the sysfs module parameter:
>+	  /sys/module/xe/parameters/gpufreq_monitoring_interval_ms
>+
>+	  The tracepoint will be available at:
>+	  /sys/kernel/debug/tracing/events/power/gpu_frequency
>+
>+	  Format: {unsigned int state, unsigned int gpu_id}
>+	  Where state is the frequency in KHz and gpu_id is the GPU clock domain.
>+
>+	  If unsure, say N.
>+
> menu "drm/Xe Debugging"
> depends on DRM_XE
> depends on EXPERT
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 8e0c3412a757..61d46cc4dc25 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -170,6 +170,9 @@ xe-$(CONFIG_PCI_IOV) += \
> 	xe_sriov_pf.o \
> 	xe_sriov_pf_service.o
>
>+# GPU frequency tracer
>+xe-$(CONFIG_DRM_XE_GPUFREQTRACER) += xe_gpufreqtracer.o
>+
> # include helpers for tests even when XE is built-in
> ifdef CONFIG_DRM_XE_KUNIT_TEST
> xe-y += tests/xe_kunit_helpers.o
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 57edbc63da6f..88198ceb519b 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -34,6 +34,7 @@
> #include "xe_exec_queue.h"
> #include "xe_force_wake.h"
> #include "xe_ggtt.h"
>+#include "xe_gpufreqtracer.h"
> #include "xe_gsc_proxy.h"
> #include "xe_gt.h"
> #include "xe_gt_mcr.h"
>@@ -896,6 +897,12 @@ int xe_device_probe(struct xe_device *xe)
> 	if (err)
> 		return err;
>
>+#if IS_ENABLED(CONFIG_DRM_XE_GPUFREQTRACER)
>+	err = xe_gpufreqtracer_init(xe);
>+	if (err)
>+		return err;
>+#endif
>+
> 	err = xe_oa_init(xe);
> 	if (err)
> 		return err;
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 01e8fa0d2f9f..0634dbbbdc3f 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -35,6 +35,7 @@ struct dram_info;
> struct intel_display;
> struct intel_dg_nvm_dev;
> struct xe_ggtt;
>+struct xe_gpufreqtracer_data;
> struct xe_i2c;
> struct xe_pat_ops;
> struct xe_pxp;
>@@ -529,6 +530,9 @@ struct xe_device {
> 	/** @oa: oa observation subsystem */
> 	struct xe_oa oa;
>
>+	/** @gpufreqtracer_data: GPU frequency tracer data */
>+	struct xe_gpufreqtracer_data *gpufreqtracer_data;
>+
> 	/** @pxp: Encapsulate Protected Xe Path support */
> 	struct xe_pxp *pxp;
>
>diff --git a/drivers/gpu/drm/xe/xe_gpufreqtracer.c b/drivers/gpu/drm/xe/xe_gpufreqtracer.c
>new file mode 100644
>index 000000000000..07eedfb79e93
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_gpufreqtracer.c
>@@ -0,0 +1,292 @@
>+// SPDX-License-Identifier: GPL-2.0
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+
>+#include "xe_gpufreqtracer.h"
>+
>+#include <linux/workqueue.h>
>+#include <linux/slab.h>
>+#include <linux/jiffies.h>
>+#include <linux/kernel.h>
>+#include <linux/moduleparam.h>
>+#include <linux/types.h>
>+#include <linux/container_of.h>
>+#include <linux/gfp.h>
>+#include <linux/atomic.h>
>+#include <drm/drm_managed.h>
>+
>+#include "xe_device.h"
>+#include "xe_gt.h"
>+#include "xe_gt_types.h"
>+#include "xe_guc_pc.h"
>+#include "xe_module.h"
>+
>+/* GPU frequency monitoring interval constants (in milliseconds) */
>+#define XE_GPUFREQ_MONITORING_MIN_INTERVAL_MS	100
>+#define XE_GPUFREQ_MONITORING_MAX_INTERVAL_MS	10000
>+#define XE_GPUFREQ_MONITORING_DEFAULT_INTERVAL_MS	5000
>+
>+#define CREATE_TRACE_POINTS
>+#include "xe_gpufreqtracer_trace.h"
>+
>+/**
>+ * struct xe_gpufreqtracer_gt_data - Per-GT frequency monitoring data
>+ * @gt: Reference to the GT
>+ * @delayed_work: Delayed work for periodic monitoring
>+ * @last_frequency: Last reported frequency to avoid duplicate reports
>+ * @monitoring_active: Whether monitoring is currently active
>+ */
>+struct xe_gpufreqtracer_gt_data {
>+	struct xe_gt *gt;
>+	struct delayed_work delayed_work;
>+	atomic_t last_frequency;
>+	atomic_t monitoring_active;
>+};
>+
>+/**
>+ * struct xe_gpufreqtracer_data - Per-device frequency tracer data
>+ * @xe: Reference to the XE device
>+ * @gt_data: Array of per-GT monitoring data
>+ */
>+struct xe_gpufreqtracer_data {
>+	struct xe_device *xe;
>+	struct xe_gpufreqtracer_gt_data *gt_data;
>+};
>+
>+
>+/**
>+ * xe_gpufreqtracer_sample_work - Worker function to sample GPU frequency.
>+ * @work: Pointer to the delayed_work_struct representing the scheduled work.
>+ *
>+ * This function is executed in a workqueue context to periodically sample
>+ * the GPU frequency and perform any necessary tracing or logging operations.
>+ * It reschedules itself for the next sampling interval.
>+ */
>+static void xe_gpufreqtracer_sample_work(struct work_struct *work)

this looks like a weird abstraction that creates issues (see Matt
Brost's reply) that are already a solved problem. Why can't the
userspace interested in it use perf for that? We already sample
frequency changes there. See drivers/gpu/drm/xe/xe_pmu.c

Lucas De Marchi
