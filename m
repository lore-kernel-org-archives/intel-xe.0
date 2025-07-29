Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27329C87FC9
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 05:38:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D247110E1C3;
	Tue, 29 Jul 2025 05:38:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ULb1IW0k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41F410E1C3
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 05:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753767488; x=1785303488;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SAIqIWbObhlEcY/7uZlcObZ1qdhPE0EchsYM3mApr4M=;
 b=ULb1IW0kFIPp1h+jPi2ZCrtX8pAu4LM9k2Y0bjrJxPtMJdaX7vSPLfZa
 T3/liq9qUn2Ceqb8YNrmo8OaouOJbQ2tuVEFmwlrLv6PYp5Ili2k1FNbU
 Ly8FKJeyolBCq/F7/7Oh1rothYifC2MDTZHOHQUjSueOA2hsQGNZ/h2+a
 giC4oPzAgZBYe3nvwoiXhk9C/nPimp4qQdJ7bJ3nTGeqCVHUSSG5eLvE2
 I4yumG7cZvjOvzRedDh1Ha8kBQCu1Y/vRRQ0rhouG/f3wApk8+eXSzbKo
 UGrhrg9+G9Lv9xSDooeW7n3a/KBQRIv4dbGOIOjO2Eh/+6xx4tM2VKZhv w==;
X-CSE-ConnectionGUID: ZlcE/xoVRqioWtV/NGAM2w==
X-CSE-MsgGUID: /32XMZQ1TbOI09akYTny/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="67462171"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="67462171"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 22:38:07 -0700
X-CSE-ConnectionGUID: JRR+6dkTTl66+aQHuMA8Fg==
X-CSE-MsgGUID: q4tnPQx9SKCjcV4lOAXtAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="168011960"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 22:38:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 22:38:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 22:38:07 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.89) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 22:38:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rVMNeoXk9AKABUmaC6C9iEFZ8Xv24nPYyuZA0EYN4Vs/lZo5N0fElrBAcVFogpE8XkUVsBPiAF2Kj8piOyOnP6tkylv08pcDDbKwjj9oObgOmCjVgB59+9UhoTkAfl9z2NEZc2mVH6FJ6QHGptcat0ecCvd4+uwckmaL9EqFisnFwzSMVfuke7228EDgHA2Mt7+xn4g8uD10Q6Yy0wjxX4+61JbDcgoIPo+hESaO9FflbKvSwH7a3QCxN9xZFDaXfP10oW7WN0LLAOQtZH3BXEleoROjizDE93y5puvuqhaoOYf/nKncvLEQjQnH1K0iBzJf/q3uKFCUTd1HAYlaiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xV+ElrkEFW+rv9usCO2m/zh/X+tfQmnLjTsFLw6E9Ds=;
 b=y2exxcjm2y/J1bwJnzDcAImp1PZy/rs1WYGydib35gaIB/WrwVkumJJpo/wSwVE29lyobvFQrtVwU9Hb7tWy6n980A5RsGCd+Yo8ise1Xy8YCXe7dq8qjo5nThAPdzh2kCmvrC31O0b1V1IgEH0FDPdG99WAG3YBC2p+VPy4NqpJlD1LxPNDFiamYve/9zuYZwXonwn/9M1iWXQz5MwAvgCJFTz1yIAj9m+poBk7FbRrT7VaBtUmq8kw6ynnQhg573c5ITX9nNWsyoFOEsCbH7w/GEjKGwApv9d3Nu3oF2auyK5KnwWv2XLkmBrfAKqz3ocVuKgeoi7mdTc9luTHlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6301.namprd11.prod.outlook.com (2603:10b6:208:3c3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 05:37:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8964.026; Tue, 29 Jul 2025
 05:37:11 +0000
Date: Mon, 28 Jul 2025 22:37:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Shuicheng Lin <shuicheng.lin@intel.com>
Subject: Re: [PATCH v5 23/23] drm/xe/uapi: Add UAPI for querying VMA count
 and memory attributes
Message-ID: <aIheBEtHhg4LQQy6@lstrano-desk.jf.intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
 <20250722133526.3550547-24-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250722133526.3550547-24-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0193.namprd04.prod.outlook.com
 (2603:10b6:303:86::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6301:EE_
X-MS-Office365-Filtering-Correlation-Id: f16d421c-ea1c-4fac-3246-08ddce61f782
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?7F9Q12k0PVXYnp+AJ2FdVW+doGippWzHSx9/6zFDZVpaQqDRg84tXcMVSO?=
 =?iso-8859-1?Q?5hSkOTynpdmYawNnmEp/gSMXyASJrVpn3NoAChgg+ZbJRZmtwjHJXYmvxa?=
 =?iso-8859-1?Q?v/wyJAKiMAKSaKsKRVveGu0n7HSCWJO/gjX5714LI1vcJ19drJ2/u1eStQ?=
 =?iso-8859-1?Q?BBRKZXfy3001YjT4HdVMfQuEsZDS9lLLZwRgpXu4HpPRMrPfMHTT4JU3Qo?=
 =?iso-8859-1?Q?uqY3yLeYgFkgy1+tYs5rWfIj2XTvw0/+8cb329soFUp5QU76zwL1U6X6Zw?=
 =?iso-8859-1?Q?5wArFR5iyLah+C/07BF1sGYQ31feqOXVtJ+hfUJelpswE9KtqYe+KYczMe?=
 =?iso-8859-1?Q?fRvVtS26d57XuLLAgaAvJZmLfJd2i9KqgjmuZK+whJSI7u5XQ+KI2kUKuu?=
 =?iso-8859-1?Q?6KZHrZhp98oeJWCLl6KpLmZr7cHEftygvCs62/AS99083c0EYRHj5ITwrG?=
 =?iso-8859-1?Q?XvIZL6yGkzghzP5YkiirN1vdYYI2LfKQrD8CnXCSmsSl95VBYvPpT5DJhV?=
 =?iso-8859-1?Q?Xv/ofOBAshUVNEqrqoKuw1Y0x9kPgSljE5KfJUVeiBvVE7fh+ou2W1KV6D?=
 =?iso-8859-1?Q?lvZagoHGTqhLGWPYCkOzgW+YZDGrdRw2gN2Oo+ypRcRA8AdAejq/87TSf6?=
 =?iso-8859-1?Q?S+OIQO6GEzn9XjcCnz+W3yRjB0fW6neLC/PdgH/hjDlE1oOlJtz8kxEwkY?=
 =?iso-8859-1?Q?iDawKqTmq45I8MEnZOP12CcUR1wclUXhzHEfA0qIjawzqpZt8Zn2D159N1?=
 =?iso-8859-1?Q?AwI3eKUOHRcZUo36tzkRT1eTV3mGCUkbJQj2rczQIYWr5i0NkHmg0jEj5E?=
 =?iso-8859-1?Q?//UWN7lnf4Mzys0yW633aHvcHMqHCPaAs7iv9ICYejnRN3sAY8rk9I9XJQ?=
 =?iso-8859-1?Q?QPwVfunLPN2f8GoaLIH30q7ebNbSA19ZhrAezKRyZdggmyR9ALXjtrtESl?=
 =?iso-8859-1?Q?0oya9/rk4pJRfzJPnWG3blaAD15eAujRRIMqM2R8NXZjtwwa8M78giDHfZ?=
 =?iso-8859-1?Q?6TWt811KVO9aF5OMfNnPCVVlG3506OqKCNotU7aowggfBU2sElA4tYG45l?=
 =?iso-8859-1?Q?rmMRA9JvU5haCgH2AuREW6jCckyyKNdCyLoIABCq9UJfNchOeo+mV3b44y?=
 =?iso-8859-1?Q?YnQ9j3jetHrBdm4ED1m5WUj2eyP652kHhJmINQekkv+DZ+dECoDQVnRKDB?=
 =?iso-8859-1?Q?fwHVJcjTmS7JbE5I2oqMeimD0nnUei7QQw2ch3yXL2e+U2dLV4czjF6yES?=
 =?iso-8859-1?Q?y0/maOgRAek7BD+GzDYspv1otY0RdzWTQWNJlBh+C8demnlnQkbUp2wthB?=
 =?iso-8859-1?Q?7z19/fWsSoJRl1Gx5EIEPwW8S6i1dmVaTN8bLL77qfFR+KQZg7yMDun/FO?=
 =?iso-8859-1?Q?FiCklxRCcLIMeQ9YgxfpDdJPeAyCTffFMkuXlXLzR26pr5AcMqmmN3MBXZ?=
 =?iso-8859-1?Q?df8kDjvdlFGHk3qsmPGsfHHTUXJq9Si6BPHG2g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?R7HIoG52lmmFHMuv6z9Zc6cfJotvwhSyM7ymllyXpf43nhBIAUo0ZfFvGB?=
 =?iso-8859-1?Q?Qt6oLQY9DOOc6hibBQDKsKeP9hVUkaM5y3UGquAoXooCmpsUesr98P4Zz+?=
 =?iso-8859-1?Q?ue1OIx4gotKuBydtMhtZ7l3YlYu7ke3uXcuO0Eqf0ehrmCSm69lS3R3z72?=
 =?iso-8859-1?Q?VWJYhNybMGmMlk6anEfy+BDyHOJHizIXxGoRW9bYfZm2bDaOXeTsVseW5O?=
 =?iso-8859-1?Q?7QMFYEviPkVaaBxgybx1Adgcs+JHvHNU3S1XyUoYOcQlHLqOUPKjZSSuCV?=
 =?iso-8859-1?Q?nWfIl6gzLjj7cQ3GmRJsUhYQ6QWwDRxv67Mrzeg2yXYe8p+uMEG6v622BP?=
 =?iso-8859-1?Q?VkJc1I5Ebc6x6m/rFZewt2HIGVJHqDOORjU2McHDqlUV1DMT4GJ+Nyd5MV?=
 =?iso-8859-1?Q?DpM0/0tQFkuHP9FF8kfhrxiWKrnXBF/uZAV2XTZlFmHGxu7nQaUWxgFp1u?=
 =?iso-8859-1?Q?3snzfXE9IEwebmAVzOQyyy2MxzScUz0/QaBeqbANIwQUtHjcG6ySOQLvNN?=
 =?iso-8859-1?Q?TTngU97A4rTL1+USYbPuiEldQOLAO8B79qRg13icJ54ECXtc269xerZ4MJ?=
 =?iso-8859-1?Q?9DZWLNhlZUOxbBa9ckedjZLyb4C0a48TekKB5UN1BCKgKPVHZ3gVdAkpmy?=
 =?iso-8859-1?Q?xEi4UibW9Kz8vJQkp0vt/3qpFz86AWxWVlFzMohaVKxQ0h1SEPK/ydofuH?=
 =?iso-8859-1?Q?c06iFTcyYnYX/Yjx18gdGSOzUXwQbfPPMX58SD0SPHjzTXL8Q3TzlSF7FB?=
 =?iso-8859-1?Q?ogf14Upk27cwqk4Tn3ya8ijDd93q812nfzLmROhz/PtkYh75NUByDcZece?=
 =?iso-8859-1?Q?br0Uju3VgPVL66NqU/ZJLbz8CmqxVbc8ljUDcD7n163gE/l+gZXqfL7XeF?=
 =?iso-8859-1?Q?54n9jUY+HcUU+K2sOXPJhqT+AMVfDU0VmLHkc1ycpcj1EOLKqRhkVC/uki?=
 =?iso-8859-1?Q?XTnYv4TmqYnnyy3b3gZGtdiQwexfykAjsE0KDFhzndGsGAfGXZICCrc33g?=
 =?iso-8859-1?Q?mw/ilDL+iZ7dv1kSQfTvGzeBeri99PmYTm2uTYJNsGgfZfbowroUV6an1J?=
 =?iso-8859-1?Q?CunA6ozCr4GkfaCW5k/QkXqTMecg8wXbTIf4r+Ly1fuJXfhRJ1Oq4ZSMsf?=
 =?iso-8859-1?Q?tuhfeErvbxsNbJK2GreJqmrJGughRPGtYaAtpV/KSw3J1dQrsZW33otgm+?=
 =?iso-8859-1?Q?iU8FIMsKKxJFv9TYEDLYP3bXhrlKEMqauls63bHuMhdQh5qikknfAXs++R?=
 =?iso-8859-1?Q?wFwuPiew0C1KMOjkKMP1+VZh1Vix0mn8NDHLMAxhBzu7cetNrdTudQa5Zg?=
 =?iso-8859-1?Q?1YobeByAIYzIr9lN6m2i0/sP+oIGCqZGgizwz7gd7sKuLj8IaPZ2747bDl?=
 =?iso-8859-1?Q?ZutMPDEh5nPhox8bCMNPUmIPmBySMG+eFJrlC2bGPC5oQJ/vkDLkhVXSyJ?=
 =?iso-8859-1?Q?w5TeyDZ1YcBO9AjoBH3Z/1Ijj3Kmfz6CD9tqEU3hknYAaG98kVTZ3RfJ5N?=
 =?iso-8859-1?Q?unfdg4tb8/8T/sHaNBo9rBXHyy9q8G0LjH4c1G2etmn6IVnIEVCeKs5sjM?=
 =?iso-8859-1?Q?liBJG7m0fv615mUgZR8ZoVHftj/3VAoGNgUAqzo25G1ifbRnHhX29wWryC?=
 =?iso-8859-1?Q?yiUokz4Y9BHhxdgKpLrk0denX5ivHq/5MDqQJc5ZEEVo2oXDEVlEnfbQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f16d421c-ea1c-4fac-3246-08ddce61f782
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 05:37:11.7427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 52CNv70PJmhwFdRRuHOnc9NT0+WYjY9rzV8qMCsIvSI5P/zpPn8Ya4UQ3s46eJ/pj8uApHJQIiunSiEP738v+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6301
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

On Tue, Jul 22, 2025 at 07:05:26PM +0530, Himal Prasad Ghimiray wrote:
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
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c |   2 +
>  drivers/gpu/drm/xe/xe_vm.c     | 101 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h     |   2 +-
>  include/uapi/drm/xe_drm.h      | 137 +++++++++++++++++++++++++++++++++
>  4 files changed, 241 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index b02c4ae0fdbf..1e77570db531 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -202,6 +202,8 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>  			  DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_VM_QUERY_MEM_RANGE_ATTRS, xe_vm_query_vmas_attrs_ioctl,
> +			  DRM_RENDER_ALLOW),
>  };
>  
>  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index bee849167c0d..e54ab4dce8df 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2297,6 +2297,107 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
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
> +	if (i <  (*num_vmas - 1))
> +		*num_vmas = i;

Shouldn't you just set this without a condition?

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
> +			  (!attrs_user || args->sizeof_mem_range_attr == 0)))))

sizeof_mem_range_attr != sizeof(struct drm_xe_mem_range_attr)

Looks good aside from these few nits.

Matt

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
> index f7b9ad83685a..6f25d6820991 100644
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
> index 8f1d48664424..ee328bcb8bfa 100644
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
> @@ -2110,6 +2113,140 @@ struct drm_xe_madvise {
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
> +	struct {
> +		/** @atomic.val: atomic attribute */
> +		__u32 val;
> +
> +		/** @atomic.reserved: Reserved */
> +		__u32 reserved;
> +	} atomic;
> +
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
> +	/** @vector_of_ops: userptr to array of struct drm_xe_mem_range_attr */
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
