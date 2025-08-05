Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DF7C87FCB
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 19:30:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C04BE10E2B6;
	Tue,  5 Aug 2025 19:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZeoNUMOC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E65810E2B6
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 19:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754422215; x=1785958215;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=KuDR99sYfQT+ZZOGi9l6+CiGjPLnFJNiEgRdXmdqyzk=;
 b=ZeoNUMOCpkNxT+dRZZoEyB+7xYmMzNcFglUYi1M38uQ+6LuMCXd2xKSY
 peLTeZXQpMB0uYatj5ZR/ngm7wZF5wU8tjcni7rwvECT2K5lsbLP3DmRs
 wYlvJtUvqGMBK1FlQrze68KSUlgR3jrAQYGjiOryIE+QKCreqN0L06Rwg
 o2nxcwXmcfWFiKo/z/G6w0N43IdqHbzYXEa9wwSweiPF4r12zXsJTrULA
 Nexo/12dDkEVR/c84mE3P9PcDCaF7LkK2Yw1XTAtdQO45kWXhvJStRt/A
 joLU0ErPUTowy+BT42938Hq9HUOqi/hv68gY3K1LTdg8oUxm+hD9IE/jd g==;
X-CSE-ConnectionGUID: gQ3Lmn3fSDGk05K0Rt0ypg==
X-CSE-MsgGUID: STwONH5MQHmTLT+ayVWoLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56599053"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="56599053"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 12:30:14 -0700
X-CSE-ConnectionGUID: 1690EpZMSpGuhsKYACGlWQ==
X-CSE-MsgGUID: k7YVEoHLQpeSvtOYi1l6bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="169846115"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 12:30:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 12:30:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 12:30:13 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.58)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 12:30:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pBCGpBAG5YfbgbeRwm+QNyZEe/KXdf0eqe6ZvGA3cJ6O3IvnmosHT3PEInNKoUYyqYmjmjhE9kzsg/ifd4xGZEFiZ2+zMmwqWdC4SI2UTzDaa4thMm+dtn2DrNMsmzF2p2nHcdDp1pGiB4dUmeXkb6dZS/SuYTLzsbqC34+884F/keVzFhd6m3aU2HGKDUWij6C/mC2XDV6ASUkLIz/TD586Q9kULAiGNdTtSvE3AWujrP0Ya98R2n1dNgvmSIsuc+8kiTgUoS5HqOhCP1/upqIspB9fKCC4EpYnnFF1OjUmJih9CFge6q1y8FiUpxJDmZFOcmfOs93QQYR6TqaMlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9Pm1skp16Yu6oIsNm1Jo8iFupHj64DT98JyEadP9os=;
 b=JbZX9WTZrBf229G/3/++auO8C0APMiqCVnwANM1pPIhgiGwk5AFVIQ8a2dMsXoSkzpyShqB9P8Lu2T5Gi0YvV7SKXY/mzqDl77778LiKvIXUYa3fPgKrIl4aljaOdbM+fev+tkh41LAx1hvPIG2DgPeyFctjLPj3pRD26XoOoumBl2CPZQYgGj24ryWGYk7FhwIL+ErlsDFv81pcqWJ6eyFTu6sWND+mvxiLcSH7OhRPPa02J10jFy/Z1okPTpYt4y20kwSbGCEP0qHKjEb7xCGcT5MRnI6y/0FAHOloRaggbj5I1bHVRQ/l8cQweQ2TWuCDblNYuGSmc5IHkBMx0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8544.namprd11.prod.outlook.com (2603:10b6:806:3a3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Tue, 5 Aug
 2025 19:29:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 19:29:54 +0000
Date: Tue, 5 Aug 2025 12:29:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Shuicheng Lin <shuicheng.lin@intel.com>
Subject: Re: [PATCH v5 25/25] drm/xe/uapi: Add UAPI for querying VMA count
 and memory attributes
Message-ID: <aJJbr/TSuv4ae13m@lstrano-desk.jf.intel.com>
References: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
 <20250730130050.1001648-26-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250730130050.1001648-26-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0270.namprd04.prod.outlook.com
 (2603:10b6:303:88::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8544:EE_
X-MS-Office365-Filtering-Correlation-Id: 338e7af3-d3de-417c-9a97-08ddd456745a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?cMr/RG/8J5XE5rLMHRpEqAxwbJkcrM/Ot5SFUpejB1fGMYiGsiKPlGXBYB?=
 =?iso-8859-1?Q?at46uSy9+OkahQnLSKoatqHlWcDvYo3CCOvknS6wKliZmN3dnTVPVQuNS7?=
 =?iso-8859-1?Q?1kKDF3sc/H0zdWDodOR+Pf9iMHhm4l00N7OmexuTbYQ7kj/CEFahRXX4Ek?=
 =?iso-8859-1?Q?+cZQmbw5bERSXHlkreoWOVGzzOrkXWXf5hulrCjMaCsKUQa524fuqhFs/7?=
 =?iso-8859-1?Q?oZxhYtVq5S2TVCenY2Pf53af/i4ZM2xJTWcYgzizs/ZyWGKxq0McKJA8pT?=
 =?iso-8859-1?Q?y8Ad9mO8LWRd/dGQl79JV33bB68R+aL1L32PfIHs3PEl5EdqdxR0VvqRKi?=
 =?iso-8859-1?Q?szskSPEvPTGw/nw12QVJvpyQJfF3prradvBRPXgIRl6kCQ0ZwxsIJ6fDfU?=
 =?iso-8859-1?Q?th1bKjfhknqHDZDoFqMKWSwMD4z0516+lX+LQXHSbvF/d6EEnDUV1dFtxG?=
 =?iso-8859-1?Q?tENZH4AmS50g9DXWc5T0RVaUWL4/8HqjYD2sKjzbkYUGggWfe3/ZCMymoI?=
 =?iso-8859-1?Q?ssNSnX+8t/S0mGhDsHWdAFAXbMmfnuYOeHfjVzvi5Q5rYLsZxnHSNvDdpc?=
 =?iso-8859-1?Q?SqWrpU6L77WbSChfY3/qLjzoRYhLtKWaSAGv3SF88+mfrajMEcuX7R7IF7?=
 =?iso-8859-1?Q?NfN25CvxK2Mag1CFwkMhW7F1JG0JbRXNQqmuBQZmGQpNl1+lCSEM5iAeES?=
 =?iso-8859-1?Q?LzX50rmyAJU33t5k+sJlTU9BHkVP/ozzZ6wLFI2LPOxSlA2NNMlvtPvsOp?=
 =?iso-8859-1?Q?NIruCJvJRLfm62ttkHFxzdxL3vqkAwTCCzmA6Hfn2uOlIAMT2sLMtJwVv+?=
 =?iso-8859-1?Q?1WsrYXvRiGpIN9ECmtuvi3hLqpH+WV5JMuIabzQtPXyrMBUbXwZCdeM+8h?=
 =?iso-8859-1?Q?hGj83PHCxWRQ/vRccR4Jd8CnMYk+mfAPcpeQGrLD7ATw/uqTkwR5tTg+A4?=
 =?iso-8859-1?Q?k0D5u9MD9OVTtMNcu0w5O6C+NyDUhr0DfzQxxSgtvGcXXCmDOmXfvBGgMJ?=
 =?iso-8859-1?Q?Z2kmT6MQMQMRAabnzh5hEVWx+tJYz5SpKDNehHlVLG6sm9PlbxfqN+lyWA?=
 =?iso-8859-1?Q?0LH8T3PM40V2o7G9rCZ9Q5LQc8ZQlx+ykIIxeZhR+qGwtmss94HU4iO4fI?=
 =?iso-8859-1?Q?7MKb0DRtFB7+NQTmRVa26l1JAk/O8S2PrOC1Rn4Re7wApzteAUjFAewagO?=
 =?iso-8859-1?Q?aG3vTqIpnW+z2VLwnQFlOA7IwPtdDShYt0UF6IiyAA73rj9RF1W08JmTUQ?=
 =?iso-8859-1?Q?3zFt1/Xzweyn4WQFtUOT60QYVJ1PPr+H/r3sHsUIP3U5HFYZNmwuVfO5Di?=
 =?iso-8859-1?Q?m1JQwRT8mYPjJQSYD7uKZAo9kWcCmF9fnpM2AAv1MmvRFpwiYf78GOPDWK?=
 =?iso-8859-1?Q?XjizYusHsTpsm1QaCJNP5pyJiC1t95O3mMNuqoW9KgetoMqRs5/iS97Vz+?=
 =?iso-8859-1?Q?r83kVc7tYfB6m9QSEfN8+YyeYAeb3XiLOwOCvyYX4mKErTA0sRQYu0SYYB?=
 =?iso-8859-1?Q?4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Uax4scw0XMu4xzt47OCABsbZ+lAqYW7iOlsAUYDftQjFeeIqaJ8cXvBsOJ?=
 =?iso-8859-1?Q?5QdGSUB4WpgegVBPbRpFOG81jTyuIpv9UL6+WQ64txHqpwN1aZIcPo6SdO?=
 =?iso-8859-1?Q?LfdZYbXw3UBDqIsssvblJNI115qBWauZj/5RbR5dR1FH9DyOQYt0i7x/CL?=
 =?iso-8859-1?Q?paBNprJ1Ni6DZhwGrJqTjJlRwn507UoB4UBBvbu7q8dVwuM/UAf3fZoVS7?=
 =?iso-8859-1?Q?oc/ZJzqwuxskHEIlQ6KqnpYR3rQhQqLow/l6LcxINvH4bVNcY13WFkvfub?=
 =?iso-8859-1?Q?c8oolW92nTDNxgURHzlNOxBJqMISMwSXg4E2yxtLZoIzOtuIBYlxZFgLQ9?=
 =?iso-8859-1?Q?nvOclTkyUFlCAotyBBcxwu2B0ikyZuDcbRhDpgc1jQ5bjJgjAxVMF7VRcV?=
 =?iso-8859-1?Q?XZHqZF4MnFW5EQVxjkp7gx0HjjDa0L7Rbu2+fpYBCdfT33LgQIaanPR0Pz?=
 =?iso-8859-1?Q?7VXxSX/JrCWWoCGwotMqH5o+CtBswRoBJx3lTUiY2e5HXgjDOBO+/gv2xC?=
 =?iso-8859-1?Q?NmSmqCXFo3WpzUrOZfx1BCMNopiD9qNNeqU94RJluDo5+r8iPt3s6dOB4z?=
 =?iso-8859-1?Q?TyFh7rMVtXT5VkMhCQAf5Vddvh7dtm8JQO2TnZy0MpD+57tmc/OomNEHRb?=
 =?iso-8859-1?Q?qZf59WvPLOI14qyFFn2+J/b/8AGaAr/D784VjlBYIsXR3TGb0BG7KSVJYn?=
 =?iso-8859-1?Q?zrAMbmot4ni0yowuRAQYw4hac7pvZUYNrUkaAcagvggY6K7cUM2vFJQdQ1?=
 =?iso-8859-1?Q?wP6sB+4wqQDdj1H8JVffrsCCODShLJCsEJkB2PqYgquI1q4kbxq7i9/KpD?=
 =?iso-8859-1?Q?KSLQ3K+cEq+gb1zN00juhlc5bnhT6zIOLrQ1XDHTQvwyhsOCK4Ft3g3cX5?=
 =?iso-8859-1?Q?rAdvWipTZraLq0vY6eGpSbxn4M+gDKL8Mo0CkUI9ookqud2SJfg4nJ9GQz?=
 =?iso-8859-1?Q?zjp9qj1ivfoO3cHikBek+S9/a/1bBSwcRim6zwAYNtK1MX6sHhBt/z8p/+?=
 =?iso-8859-1?Q?vnkoqDl2NJz+PscQFB4qvKUdqhNW486OJ/XvnEcMaq1f8U0L+x+md/qJrN?=
 =?iso-8859-1?Q?jMN8AnkwRWFhdEwzf3C5v1vkwWBTQ8VviuAZKIWUNEUznx21AtDlNBOAXi?=
 =?iso-8859-1?Q?7QPM96rwlFC3v37cbxz+Os4+OP3cReTjtTswAlt2R5riXDSZSpW5nfjNOO?=
 =?iso-8859-1?Q?hJdYdAhS0UTtg4vK+WAiIoKIlIeP1lnSZEZSQC/NwXt+PRRpO7f59DQAdA?=
 =?iso-8859-1?Q?IcCnHwmPKE6+E/V1We/qeg/vKe1WdnYT+vb9eopFfgnVm3S5KMPqEKt8Cc?=
 =?iso-8859-1?Q?MbZSQqPtNSS4qjppbar1jupySUvzDvvSDoK/00smuDjxaXHWMJys7VZ+aS?=
 =?iso-8859-1?Q?CjTDaYNW5TkiGRiVbV4g82bgo1Doq0pguOFboM7oZvIrjXRFaXnwHBGPYC?=
 =?iso-8859-1?Q?tUHfq9boIhxgU1Jn9eqf2bsRLSf+CNspvfb0xDV8OCgq23yy/RtJ8BNHFD?=
 =?iso-8859-1?Q?QCDTEN4eRANzr6r/b8Lw152pw1HTsFxaGt/cwJpgt7nLvStvwgU3mmAdYQ?=
 =?iso-8859-1?Q?P4zEYILM2B1JGiqoomU2Zy9Exb/8rjj7HZfdQOIFDX+Edu4r09Mcw8K+vC?=
 =?iso-8859-1?Q?qJbaQ4VBI2XaKYFfIXWSh80repni3YOR5KUR97sFFtD9u7hudexqUzJQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 338e7af3-d3de-417c-9a97-08ddd456745a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 19:29:54.2422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Uh1lRkChy8byVlXmcsCUQB0n0gwLBQ2w49o4DVqWdK4B9WdoZkMb2EHn7zwgL+aWKkxM9wbZUnXCugEsqnQ3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8544
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

On Wed, Jul 30, 2025 at 06:30:50PM +0530, Himal Prasad Ghimiray wrote:
> Introduce the DRM_IOCTL_XE_VM_QUERY_MEMORY_RANGE_ATTRS ioctl to allow
> userspace to query memory attributes of VMAs within a user specified
> virtual address range.
> 
> Userspace first calls the ioctl with num_mem_ranges = 0,
> sizeof_mem_ranges_attr = 0 and vector_of_vma_mem_attr = NULL to retrieve
> the number of memory ranges (vmas) and size of each memory range attribute.
> Then, it allocates a buffer of that size and calls the ioctl again to fill
> the buffer with memory range attributes.
> 
> This two-step interface allows userspace to first query the required
> buffer size, then retrieve detailed attributes efficiently.
> 
> v2 (Matthew Brost)
> - Use same ioctl to overload functionality
> 
> v3
> - Add kernel-doc
> 
> v4
> - Make uapi future proof by passing struct size (Matthew Brost)
> - make lock interruptible (Matthew Brost)
> - set reserved bits to zero (Matthew Brost)
> - s/__copy_to_user/copy_to_user (Matthew Brost)
> - Avod using VMA term in uapi (Thomas)
> - xe_vm_put(vm) is missing (Shuicheng)
> 
> v5
> - Nits
> - Fix kernel-doc
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c |   2 +
>  drivers/gpu/drm/xe/xe_vm.c     | 102 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h     |   2 +-
>  include/uapi/drm/xe_drm.h      | 139 +++++++++++++++++++++++++++++++++
>  4 files changed, 244 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 80a77488381a..1e4334f8bdf4 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -203,6 +203,8 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>  			  DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_VM_QUERY_MEM_RANGE_ATTRS, xe_vm_query_vmas_attrs_ioctl,
> +			  DRM_RENDER_ALLOW),
>  };
>  
>  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index e77c04f92d0b..a3ca3041e812 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2171,6 +2171,108 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>  	return err;
>  }
>  
> +static int xe_vm_query_vmas(struct xe_vm *vm, u64 start, u64 end)
> +{
> +	struct drm_gpuva *gpuva;
> +	u32 num_vmas = 0;
> +
> +	lockdep_assert_held(&vm->lock);
> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end)
> +		num_vmas++;
> +
> +	return num_vmas;
> +}
> +
> +static int get_mem_attrs(struct xe_vm *vm, u32 *num_vmas, u64 start,
> +			 u64 end, struct drm_xe_mem_range_attr *attrs)
> +{
> +	struct drm_gpuva *gpuva;
> +	int i = 0;
> +
> +	lockdep_assert_held(&vm->lock);
> +
> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
> +		struct xe_vma *vma = gpuva_to_vma(gpuva);
> +
> +		if (i == *num_vmas)
> +			return -ENOSPC;
> +
> +		attrs[i].start = xe_vma_start(vma);
> +		attrs[i].end = xe_vma_end(vma);
> +		attrs[i].atomic.val = vma->attr.atomic_access;
> +		attrs[i].pat_index.val = vma->attr.pat_index;
> +		attrs[i].preferred_mem_loc.devmem_fd = vma->attr.preferred_loc.devmem_fd;
> +		attrs[i].preferred_mem_loc.migration_policy =
> +		vma->attr.preferred_loc.migration_policy;
> +
> +		i++;
> +	}
> +
> +	*num_vmas = i;
> +	return 0;
> +}
> +
> +int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> +{
> +	struct xe_device *xe = to_xe_device(dev);
> +	struct xe_file *xef = to_xe_file(file);
> +	struct drm_xe_mem_range_attr *mem_attrs;
> +	struct drm_xe_vm_query_mem_range_attr *args = data;
> +	u64 __user *attrs_user = u64_to_user_ptr(args->vector_of_mem_attr);
> +	struct xe_vm *vm;
> +	int err = 0;
> +
> +	if (XE_IOCTL_DBG(xe,
> +			 ((args->num_mem_ranges == 0 &&
> +			  (attrs_user || args->sizeof_mem_range_attr != 0)) ||
> +			 (args->num_mem_ranges > 0 &&
> +			  (!attrs_user ||
> +			   args->sizeof_mem_range_attr !=
> +			   sizeof(struct drm_xe_mem_range_attr))))))
> +		return -EINVAL;
> +
> +	vm = xe_vm_lookup(xef, args->vm_id);
> +	if (XE_IOCTL_DBG(xe, !vm))
> +		return -EINVAL;
> +
> +	err = down_read_interruptible(&vm->lock);
> +	if (err)
> +		goto put_vm;
> +
> +	attrs_user = u64_to_user_ptr(args->vector_of_mem_attr);
> +
> +	if (args->num_mem_ranges == 0 && !attrs_user) {
> +		args->num_mem_ranges = xe_vm_query_vmas(vm, args->start, args->start + args->range);
> +		args->sizeof_mem_range_attr = sizeof(struct drm_xe_mem_range_attr);
> +		goto unlock_vm;
> +	}
> +
> +	mem_attrs = kvmalloc_array(args->num_mem_ranges, args->sizeof_mem_range_attr,
> +				   GFP_KERNEL | __GFP_ACCOUNT |
> +				   __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
> +	if (!mem_attrs) {
> +		err = args->num_mem_ranges > 1 ? -ENOBUFS : -ENOMEM;
> +		goto unlock_vm;
> +	}
> +
> +	memset(mem_attrs, 0, args->num_mem_ranges * args->sizeof_mem_range_attr);
> +	err = get_mem_attrs(vm, &args->num_mem_ranges, args->start,
> +			    args->start + args->range, mem_attrs);
> +	if (err)
> +		goto free_mem_attrs;
> +
> +	err = copy_to_user(attrs_user, mem_attrs,
> +			   args->sizeof_mem_range_attr * args->num_mem_ranges);
> +
> +free_mem_attrs:
> +	kvfree(mem_attrs);
> +unlock_vm:
> +	up_read(&vm->lock);
> +put_vm:
> +	xe_vm_put(vm);
> +	return err;
> +}
> +
>  static bool vma_matches(struct xe_vma *vma, u64 page_addr)
>  {
>  	if (page_addr > xe_vma_end(vma) - 1 ||
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 6538cddf158b..3953b3ee2955 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -199,7 +199,7 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>  			struct drm_file *file);
>  int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
>  		     struct drm_file *file);
> -
> +int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
>  void xe_vm_close_and_put(struct xe_vm *vm);
>  
>  static inline bool xe_vm_in_fault_mode(struct xe_vm *vm)
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 115b9bca2a25..6b03f319ab70 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -82,6 +82,7 @@ extern "C" {
>   *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
>   *  - &DRM_IOCTL_XE_OBSERVATION
>   *  - &DRM_IOCTL_XE_MADVISE
> + *  - &DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
>   */
>  
>  /*
> @@ -104,6 +105,7 @@ extern "C" {
>  #define DRM_XE_WAIT_USER_FENCE		0x0a
>  #define DRM_XE_OBSERVATION		0x0b
>  #define DRM_XE_MADVISE			0x0c
> +#define DRM_XE_VM_QUERY_MEM_RANGE_ATTRS	0x0d
>  
>  /* Must be kept compact -- no holes */
>  
> @@ -120,6 +122,7 @@ extern "C" {
>  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>  #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
>  #define DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
> +#define DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_MEM_RANGE_ATTRS, struct drm_xe_vm_query_mem_range_attr)
>  
>  /**
>   * DOC: Xe IOCTL Extensions
> @@ -2113,6 +2116,142 @@ struct drm_xe_madvise {
>  	__u64 reserved[2];
>  };
>  
> +/**
> + * struct drm_xe_mem_range_attr - Output of &DRM_IOCTL_XE_VM_QUERY_MEM_RANGES_ATTRS
> + *
> + * This structure is provided by userspace and filled by KMD in response to the
> + * DRM_IOCTL_XE_VM_QUERY_MEM_RANGES_ATTRS ioctl. It describes memory attributes of
> + * a memory ranges within a user specified address range in a VM.
> + *
> + * The structure includes information such as atomic access policy,
> + * page attribute table (PAT) index, and preferred memory location.
> + * Userspace allocates an array of these structures and passes a pointer to the
> + * ioctl to retrieve attributes for each memory ranges
> + *
> + * @extensions: Pointer to the first extension struct, if any
> + * @start: Start address of the memory range
> + * @end: End address of the virtual memory range
> + *
> + */
> +struct drm_xe_mem_range_attr {
> +	 /** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @start: start of the memory range */
> +	__u64 start;
> +
> +	/** @end: end of the memory range */
> +	__u64 end;
> +
> +	/** @preferred_mem_loc: preferred memory location */
> +	struct {
> +		/** @preferred_mem_loc.devmem_fd: fd for preferred loc */
> +		__u32 devmem_fd;
> +
> +		/** @preferred_mem_loc.migration_policy: Page migration policy */
> +		__u32 migration_policy;
> +	} preferred_mem_loc;
> +
> +	/** * @atomic: Atomic access policy */
> +	struct {
> +		/** @atomic.val: atomic attribute */
> +		__u32 val;
> +
> +		/** @atomic.reserved: Reserved */
> +		__u32 reserved;
> +	} atomic;
> +
> +	 /** @pat_index: Page attribute table index */
> +	struct {
> +		/** @pat_index.val: PAT index */
> +		__u32 val;
> +
> +		/** @pat_index.reserved: Reserved */
> +		__u32 reserved;
> +	} pat_index;
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved[2];
> +};
> +
> +/**
> + * struct drm_xe_vm_query_mem_range_attr - Input of &DRM_IOCTL_XE_VM_QUERY_MEM_ATTRIBUTES
> + *
> + * This structure is used to query memory attributes of memory regions
> + * within a user specified address range in a VM. It provides detailed
> + * information about each memory range, including atomic access policy,
> + * page attribute table (PAT) index, and preferred memory location.
> + *
> + * Userspace first calls the ioctl with @num_mem_ranges = 0,
> + * @sizeof_mem_ranges_attr = 0 and @vector_of_vma_mem_attr = NULL to retrieve
> + * the number of memory regions and size of each memory range attribute.
> + * Then, it allocates a buffer of that size and calls the ioctl again to fill
> + * the buffer with memory range attributes.
> + *
> + * If second call fails with -ENOSPC, it means memory ranges changed between
> + * first call and now, retry IOCTL again with @num_mem_ranges = 0,
> + * @sizeof_mem_ranges_attr = 0 and @vector_of_vma_mem_attr = NULL followed by
> + * Second ioctl call.
> + *
> + * Example:
> + *
> + * .. code-block:: C
> + *    struct drm_xe_vm_query_mem_range_attr query = {
> + *         .vm_id = vm_id,
> + *         .start = 0x100000,
> + *         .range = 0x2000,
> + *     };
> + *
> + *    // First ioctl call to get num of mem regions and sizeof each attribute
> + *    ioctl(fd, DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS, &query);
> + *
> + *    // Allocate buffer for the memory region attributes
> + *    void *ptr = malloc(query.num_mem_ranges * query.sizeof_mem_range_attr);
> + *
> + *    query.vector_of_mem_attr = (uintptr_t)ptr;
> + *
> + *    // Second ioctl call to actually fill the memory attributes
> + *    ioctl(fd, DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS, &query);
> + *
> + *    // Iterate over the returned memory region attributes
> + *    for (unsigned int i = 0; i < query.num_mem_ranges; ++i) {
> + *       struct drm_xe_mem_range_attr *attr = (struct drm_xe_mem_range_attr *)ptr;
> + *
> + *       // Do something with attr
> + *
> + *       // Move pointer by one entry
> + *       ptr += query.sizeof_mem_range_attr;
> + *     }
> + *
> + *    free(ptr);
> + */
> +struct drm_xe_vm_query_mem_range_attr {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @vm_id: vm_id of the virtual range */
> +	__u32 vm_id;
> +
> +	/** @num_mem_ranges: number of mem_ranges in range */
> +	__u32 num_mem_ranges;
> +
> +	/** @start: start of the virtual address range */
> +	__u64 start;
> +
> +	/** @range: size of the virtual address range */
> +	__u64 range;
> +
> +	/** @sizeof_mem_range_attr: size of struct drm_xe_mem_range_attr */
> +	__u64 sizeof_mem_range_attr;
> +
> +	/** @vector_of_mem_attr: userptr to array of struct drm_xe_mem_range_attr */
> +	__u64 vector_of_mem_attr;
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved[2];
> +
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.34.1
> 
