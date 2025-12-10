Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44E3D2CE17
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 05:33:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F3B10E661;
	Wed, 10 Dec 2025 05:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CLIyehQ6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D0410E661
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 05:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765344808; x=1796880808;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=svYsPTgbkhClR2k4o/MUQT6sbicO1slR7mmAu4J+vok=;
 b=CLIyehQ6lB427yITjvTjSShyLBwcl1c28rzjGmYqKSG9TOt1Gi/jhzrw
 nwn1exHyyXbnQjiV08Gvje8dWHeoki+Dm+GnE0FTY5oeMv4ZrACOKtP2J
 mPYVxbifgfTksTS5iuCfwGS8TjzmRIFaO1c6YzTFyqzEtPox7TJhGyryh
 wp11SsYIMNCghTWF4R8GrjNs4lo2FxYfFsAySV2GX6IRx2a/c9q4btgNt
 SLLIEBZ0omtjIjyL6beIN7W8FSRGe+tQ5DEGkbdasXio6bliZTkzynbcR
 uXkl3nUht325qyX/FUd+fVywVE0yBW8P3CEO2UdeCp4RLrLKEla/5BJce w==;
X-CSE-ConnectionGUID: PMYjIrmwRF2VqTPQSLY2OQ==
X-CSE-MsgGUID: FDwH4Jo3TQ6ssyWHTdQAzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="69898474"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="69898474"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 21:33:28 -0800
X-CSE-ConnectionGUID: QTEKJM4iQgi9VqfbkFSlYw==
X-CSE-MsgGUID: 779HJtgoRGGIiiO8MmK7Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="233822797"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 21:33:27 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 21:33:27 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 21:33:27 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.48) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 21:33:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O/Hrv99s82jJGMW/sX3DGPe9FCYY+FNyggKHUJM8FlNVWPckPhErqXfeTOP2s93vc52FZU/f+RnaPrkyZh2Dty2XkBw0AMLJm7z6zMhgzyBc9SFyuc7N6tpWRTB3Kzpz6jcyWH38Gs6BTT5bs4Y2/GNf9UkeCNbW+HlUVTliJrKpx69hpxWRbLuPLNzNTKfDF/LApILPr5TN5ObTUX1/T0/cicyozFccYJSuvo4Tbq0jxesS7x9Q9F5FFgw9bRyxAVyPKT+v8tPa6O8OfzqJMoHaZI/8rDUxGp5TzzpTaLutue56Il2Pvi2RzZgGaT3eqKFln8fEqp0P8Qbp6uOx1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVedvovkoNae4triK5+gcpKprI4P+0M8wgbam/bxQOM=;
 b=DP0THd/h/2FhF/PIXeOYV4kpgWr+OkJQiiQKU6emiCPKnh+lOKHdEQEJbZKpzxO5O7mMGrkJVr3Cu53Qnjm8oP++lysNBiE3FnelgHy2KKymNWNCEAqBV8YgovbzW1ZeZUzRlcj4Pw4lDDoexlllz3pjMTut438xHM97zt2pUisN3Dl6XqoGUpWgjdIupOP60kFzB+nPIbT/BuVVLDEvF3jrxK+DumpwNiWrzIP5/fZ1nz4EBTggV5GNJKUo/XEQsSwEr44A78aRPv7of8qLC+mmzkakeX6C7mnHNnRJ+H3PmicWzMsHyzCRFnSPTvP8xTF0BgPeRshoksunUAhH3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB7689.namprd11.prod.outlook.com (2603:10b6:8:e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 05:33:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 05:33:25 +0000
Date: Tue, 9 Dec 2025 21:33:22 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
Subject: Re: [RFC v3 1/8] drm/xe/uapi: Add UAPI support for purgeable buffer
 objects
Message-ID: <aTkGIoPSL5xOWQ7R@lstrano-desk.jf.intel.com>
References: <20251210043112.3267620-1-arvind.yadav@intel.com>
 <20251210043112.3267620-2-arvind.yadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251210043112.3267620-2-arvind.yadav@intel.com>
X-ClientProxiedBy: MW4P221CA0023.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB7689:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e805f4c-a9e5-4cc2-0463-08de37ada3a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?82spkDRPLIGCJGaUAo/s6A+PUNWuPJwCHn/7cP5tGFnzNDmGayQa6FBoaK?=
 =?iso-8859-1?Q?gJtltodd24J2Zxy+8wuHpGicyxLx5RYgNDnQmW1ZJhAFAK5kofg13UTAUC?=
 =?iso-8859-1?Q?02+3s7LfwlH3SbBFI+vHtsdfF8ZQY7eTG2CLmMqN6YJAPRhCE/OS+7kzzJ?=
 =?iso-8859-1?Q?gLkTi/KDUJ/UX9zu7ygOg8ot3L6skIFUX3f7VXJgkGxcu9tcYVwiY6AwKY?=
 =?iso-8859-1?Q?aaSg4VH/Q6hhWKj8Q3jfYQ1cFC8atLUR5ud8BGhB0iMwA2mzih1KLIQ6vy?=
 =?iso-8859-1?Q?zZS7rWrV12g9y8aJzlwYiKryjI8f4CJ5QniCC8xXY0HBr+kUTzp5Y307ZW?=
 =?iso-8859-1?Q?y2/4exz7iGxHhuJ00ZuVkcKNRrLiEc9VgP43/f2oQjtlww2lG6iSGic7GQ?=
 =?iso-8859-1?Q?wFWtX8UE/aliC6w6vG2OxixfZMo3vi9c1QdX864DaSC34UH8w9FDwAQeda?=
 =?iso-8859-1?Q?zma1iM8zW4+QzUVjxWAfMSkVw9k2niAxH51CspdmLBBG1wxWnJ1ctrqo8Z?=
 =?iso-8859-1?Q?tS7leVMDHfWDlSieYbyybyQrSfrWrRUyh/9kHv6jkVddqZNW3Cid4JpEOJ?=
 =?iso-8859-1?Q?bIZRMixKULFmiwUN3SqEzblDrfXWivxqNnaaSCbB+64yLbH7lOy5l9vOvA?=
 =?iso-8859-1?Q?dt6Py86adup2tviTGU9cx+dZhHXoq982Kd2lutslLaX/TPTzfqBc6eyVj/?=
 =?iso-8859-1?Q?09lAyBGV6NARkTgyqzHjsDv/LmyyL+Nsq4D87sss8BhQIpkHInODZtiVe/?=
 =?iso-8859-1?Q?0RZ7QawUtvrPloT8lxy/j8R6Ckiu2JQDZIJCB2MxxBVbG9HxFZrDYgmirb?=
 =?iso-8859-1?Q?obm7rcHMfZzaqe5OqjNAybeNtEjmGXRDmRgxqgb4yr/VRJix8bNyhAIdcP?=
 =?iso-8859-1?Q?IKf3X5hTB6LhDSeQcfcA8Lao9K/zMWP2+/0UV3TPLCsLyYclPTyXU3EWo2?=
 =?iso-8859-1?Q?5k3ywE9G5aZfhuPRCY1j7n8ZCnie60mpLrr6nu0f8/5a5bBTan+tm58nhz?=
 =?iso-8859-1?Q?LbRAK0PBWWAdff4Ghuqc02Uu6rVUVq3+yU+Wib009mGW3LIcFqeo4tGWrs?=
 =?iso-8859-1?Q?Cyc9eHXKBCnhrO2UgbXG4tX87pGiURP+FcRm6nliQbkqGcOKTcVH3WbSJN?=
 =?iso-8859-1?Q?FUHn2ID1rgXlibtA/vvneCcLes2Ws4ktLz7XjYET9nPzfVKyTgj6A4Skvn?=
 =?iso-8859-1?Q?f0PjvSGfs2B2lHtLlex8HUnAOC1twUuN6puGL/VxJhoVevsYczNtp1ToyB?=
 =?iso-8859-1?Q?/Y4QlG0YPJ+IQmCSfx3r9lxJ/Wrdg6k3HuvTznR9+NdklYQsvDiSqsXa4U?=
 =?iso-8859-1?Q?PiNNEzAq03gNrBCBBsEW09MJzYeVp2Soym2QnKOBspDDa8gI2z35EgSReI?=
 =?iso-8859-1?Q?zD/WBF56Jhw7ycn2eot4Ph8Ro7Aq0vEF92Qi+puGjSiwzc0YYQsXfQhYbs?=
 =?iso-8859-1?Q?CC7gXq6XMUuzmPAaPtaqExokZHWxlZGHuZRfzv6rdNeVavbPpuuEshNXvU?=
 =?iso-8859-1?Q?/PBlPoElzxkKW1oU+Jnj1G?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8Bk3RK4dsi/iZo02XfYRNafYFuaPH8jJfTnotvZ3WJDgrg42ajvOmf49Kn?=
 =?iso-8859-1?Q?SJhd7XJ94vSkE1R7UUFb3T8U+GL4F2iSHJSDgKnD2H77H8cb3t0z9xBPee?=
 =?iso-8859-1?Q?/jwi4kdSAA1oUHdyQNTW9FBl6vJY0n1BNrZ6glyh3GiyzBNDNjTSUNpPYb?=
 =?iso-8859-1?Q?ISJElanBA9hNn3Lmj15Ls+kn6d6oXkNx/uwDA9CXZtVcy+/zvn5cPCDF0F?=
 =?iso-8859-1?Q?OSHHa0e+qii1Tv5Pcd8c5cRvhYe2fkura238UfGC+jV6GRFNmZrYx2tq0t?=
 =?iso-8859-1?Q?QU0Wo6fkG4VCXF2ipdDDmNkFZGeHzU9q09VhID/dbMOUjlSsmS313EUcc+?=
 =?iso-8859-1?Q?XXO23rtDyI09vlSEJXKHjTwPfnAPZEbv4YfXo33VMbWCJsOaI+FPBm467i?=
 =?iso-8859-1?Q?i8KC+dEDilBHHbefyShff4L7ZqzbAgfk+B6AWvb9a1mpp8RDKkGzYSazUb?=
 =?iso-8859-1?Q?qUy0akCzZwdg6wVpz9uhNyODOB2N+7Yv+VZaV0XNJusuySbDERPg2rUjT5?=
 =?iso-8859-1?Q?8hgB//es5O5yLXNK3Nxyn7XSw6y9RCZoj7rGa9jFJadWaDbP8JoPXOBVeo?=
 =?iso-8859-1?Q?MhUPFfzPSdtaD22pmZkI3lnSrdVS6r2+SsQbKchf64a/oZQe+JFABghup5?=
 =?iso-8859-1?Q?wLwj+NFi4u+x4MvfJ/UGkuqaUXA5Y2BEqDEAjvgJrjetbTa0Md3uJ+rNws?=
 =?iso-8859-1?Q?a+IhdUv5DFy3JbC2RVg9EqQ7LI7o2/Cuod4q1G0uSAHw6xFv9p0fqVXOYk?=
 =?iso-8859-1?Q?Ubs1od4B3HVtqTL4JcmxRKj78ph722x4bFhgVeu66ndbCc0CSFSx/XHsIw?=
 =?iso-8859-1?Q?ClEIC4ACCaRbfpMPs4TIRobJA7jHH7rB4Wsg9YDMcFf+YZxJeTCFRclgUN?=
 =?iso-8859-1?Q?NyAL62bnpu1Wc6/O+yxF3YN2iH5vt2eOoT5xFR7JdPJlAl4C5G9ZIQ1hcC?=
 =?iso-8859-1?Q?BRCsBy/CL466T6TA0+bLx8VxQsF/491wYQm3D2TEvBXVOvAGP5BQ7gKiDm?=
 =?iso-8859-1?Q?1uHZFBwv+Ea6c+o4hSjnwcihtscsPPpYPqG5RBXnwRCHpN0VM+rmDXqpEq?=
 =?iso-8859-1?Q?RwCi8GT+HkBAUeFfIOktBTufAraRtvCvQoKTX72scSw9HjR8E2bN55aHTf?=
 =?iso-8859-1?Q?3+YgdP42KGtoKBkzqJlP+Fn//9iS2bbehv4mDguXcHeU+VcpcBd+GQ/ICY?=
 =?iso-8859-1?Q?oSbXKjmLWyvpPOscifC0RClKCHgS4QqUAilJE3vOznzv8YDDLufjj3iwab?=
 =?iso-8859-1?Q?2ENeYNPmllmSBRZwIpEDEOsK3hMeksKEOjr4Fno4U98oy9yc6LFbyu7N4+?=
 =?iso-8859-1?Q?k0QLr9OIJsa4FxdDJKlr7P/4VQAxj1ebNMfm9CoootEjMAJ88VMlRpEX2Y?=
 =?iso-8859-1?Q?A7VbflY2E5LgdSFPVVS1Sid7XyE7BJt3jt3nEu0wMgF/4qG/w0uWzQh6n5?=
 =?iso-8859-1?Q?FsfPqP0XHBKtLAi6I1DsqDkzMpzEenG1tE3hwWn3l+ipgzA8ZgpWE8cstO?=
 =?iso-8859-1?Q?8fdNyG1UxTh7U3ryzAAcGQtebXghZwIkS8fa9xRJpm19IY3jlIyxiaaRII?=
 =?iso-8859-1?Q?vHGzAlrhNiKOQShyIsZci//2BHdKCkyzKS+92a/FiTQCmkLl6fFWlhyvTe?=
 =?iso-8859-1?Q?ueA21UlP0qGJXo/7nZ9bChbwOS5EyhbvYfG3xduypTlha9ZrL3DwbmOw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e805f4c-a9e5-4cc2-0463-08de37ada3a7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 05:33:24.9884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nX9N8/UYrpIacUw268tdEd5OF5pqWSWKMZ9VrCg46eeC2GFc7WEgDmqIEK0VtdkDXaz+xoVMy3kROJTWvxBt7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7689
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

On Wed, Dec 10, 2025 at 10:00:45AM +0530, Arvind Yadav wrote:
> From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> 
> Extend the DRM_XE_MADVISE ioctl to support purgeable buffer object
> management by adding DRM_XE_VMA_ATTR_PURGEABLE_STATE attribute type.
> 
> This allows userspace applications to provide memory usage hints to
> the kernel for better memory management under pressure:
> 
> This allows userspace applications to provide memory usage hints to
> the kernel for better memory management under pressure:
> 
> - WILLNEED: Buffer is needed and should not be purged. If the BO was
>   previously purged, retained field returns 0 indicating backing store
>   was lost (once purged, always purged semantics matching i915).
> 
> - DONTNEED: Buffer is not currently needed and may be purged by the
>   kernel under memory pressure to free resources. Only applies to
>   non-shared BOs.
> 
> The implementation includes a 'retained' output field (matching i915's
> drm_i915_gem_madvise.retained) that indicates whether the BO's backing
> store still exists (1) or has been purged (0).
> 
> v2:
>   - Add PURGED state for read-only status, change ioctl to DRM_IOWR,
>     add retained field for i915 compatibility
> 
> v3:
>   - UAPI rule should not be changed (Matthew Brost)
>   - Make 'retained' a userptr (Matthew Brost)
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 876a076fa6c0..fc0dada62dd0 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -2079,6 +2079,7 @@ struct drm_xe_madvise {
>  #define DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC	0
>  #define DRM_XE_MEM_RANGE_ATTR_ATOMIC		1
>  #define DRM_XE_MEM_RANGE_ATTR_PAT		2
> +#define DRM_XE_VMA_ATTR_PURGEABLE_STATE		3
>  	/** @type: type of attribute */
>  	__u32 type;
>  
> @@ -2157,6 +2158,44 @@ struct drm_xe_madvise {
>  			/** @pat_index.reserved: Reserved */
>  			__u64 reserved;
>  		} pat_index;
> +
> +		/**
> +		 * @purge_state_val: Purgeable state configuration
> +		 *
> +		 * Used when @type == DRM_XE_VMA_ATTR_PURGEABLE_STATE.
> +		 *
> +		 * Configures the purgeable state of buffer objects in the specified
> +		 * virtual address range. This allows applications to hint to the kernel
> +		 * about bo's usage patterns for better memory management.
> +		 *
> +		 * Supported values for @purge_state_val.val:
> +		 *  - DRM_XE_VMA_PURGEABLE_STATE_WILLNEED (0): Marks BO as needed.
> +		 *    If BO was purged, returns retained=0 (backing store lost).
> +		 *
> +		 *  - DRM_XE_VMA_PURGEABLE_STATE_DONTNEED (1): Hints that BO is not
> +		 *    currently needed. Kernel may purge it under memory pressure.
> +		 *    Only applies to non-shared BOs. Returns retained=1 if not purged.
> +		 */
> +		struct {
> +#define DRM_XE_VMA_PURGEABLE_STATE_WILLNEED	0
> +#define DRM_XE_VMA_PURGEABLE_STATE_DONTNEED	1
> +			/** @purge_state_val.val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
> +			__u32 val;
> +
> +			/* @purge_state_val.pad */
> +			__u32 pad;
> +			/**
> +			 * @purge_state_val.retained: Pointer to output field for backing
> +			 * store status.
> +			 *
> +			 * Userspace provides a pointer to u32. Kernel writes to it:
> +			 * 1 if backing store exists, 0 if purged.
> +			 * Similar to i915's drm_i915_gem_madvise.retained field.
> +			 */
> +			__u64 retained;
> +			/** @purge_state_val.reserved: Reserved */
> +			__u64 reserved;

You cannot make this part of the union (purge_state_val) larger than the
existing union (16 bytes) or the bit layout of the IOCTL changes and the
uAPI breaks.

So just drop the '__u64 reserved' field.

I'll also follow up if we can change an IOCTL from DRM_IOW to DRM_IOWR
too. I honestly don't know if that is allowed or not.

Matt

> +		} purge_state_val;
>  	};
>  
>  	/** @reserved: Reserved */
> -- 
> 2.43.0
> 
