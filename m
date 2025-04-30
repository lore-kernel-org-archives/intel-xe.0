Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFEEC369D9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 16:34:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D35410E7F4;
	Wed, 30 Apr 2025 16:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GW9d1Gi4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A63810E7F4
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Apr 2025 16:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746030893; x=1777566893;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6X4GFH3pPr6y3wVCvBlZiTzI07yB5tSsIu/BkwczM7A=;
 b=GW9d1Gi4OfR0/prxh/W43NC/PZ1yQ0nWBGwzjRDrHH8xIE/7HQgA8dsX
 EiEWPq6++ad68D+V/qe6CN02Kh5MhrFc2joVYM+i7WTspXt3evItTxE2v
 truLy8ZNuVlham9pv4eRfZabXERTkoUgCH5uR5ocJgAKL58Zd6J6si8uY
 /M0kpo6+deAP+iZurQNbVKuaEG/ntHBF9k8NcwRxe1DjTlyBiqvs6SQAg
 50WZUb7vjsFHsY9our4ZQP6jDV9UpIj+uMzfb84LZtSBoXdLi5u+vKhtd
 F0N98jsDf/gIBiLcnhTHSTpavEd6JKd9ReXo8b9eyF58lfsmbMc/K3uHq g==;
X-CSE-ConnectionGUID: dJqkazN7RXm9m0A2//u0ng==
X-CSE-MsgGUID: mSEB0dY3RzGGqm95ql61SQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="47837586"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; d="scan'208";a="47837586"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 09:34:52 -0700
X-CSE-ConnectionGUID: Qd/013PJQqOfxBIFaUWAUw==
X-CSE-MsgGUID: Q8p64mhURFGqPHAt+VsQbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; d="scan'208";a="135138676"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 09:34:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 30 Apr 2025 09:34:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 30 Apr 2025 09:34:51 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 30 Apr 2025 09:34:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wKn6Eh7KgzVPrZsLWhIa4WHpSDZfEKOZDx0JnbQMvQhhWTHYwtxdOY4QgO0L5HBx+orMrHhTYyrjFQTh919Vu+likEkiCMJDKTAoFfmod+KR4uJ6icEPk5xbM30wzSv693vVyUM4rRZXQwlap+3rLA+r1U+HLuH4Bb3EivgEYFHXk9obgES7b4/YX8so3Q8JIjTZXvO9vhs+1ELMIHZK0wldqcrgmR/ZovMOQYH8cPRWRtV7R1evsWIA1k3OIe9JYY2SFzgL+Wbar4LiPzCABcNYmvgLkA4e3Yok3jy4IRwyyNBH16DSolGfWxhrC5qUdcAaLSEXiIEOVcM8yOO7pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6riq6n8l4x1kymyWUa4Ru1HfYERFHc+Cqxi8mwmoTRc=;
 b=duU2i01AoYkGC3lIEp5eQzP11yNmWNMXGy/1ve5uI21fxAE90iHOgq/neT7IW6aeVgQ9t7xT2z0TEZeFIwnOs57h3szw0xsRH0g1JJnUL9jzYOcLcBSNMCqYJQ5wXum7JSAsmbMhB1yaUX+wbNA46tJMzyUeq0uyq9tlldmUW+/yWoEqW9iy2f6JSzPIr7vwMT3ZT4A+OX6kFjcKusi7rkmb6wOMZ0vK2EILJm1rmFv03AJmBCvUVi0jEiVF4FwB/yVy/5uK1GlCE8GblxPouTjlwlcN6ld015JzXcUkzB8gwFQ3PYc79wf2hgXQ/bWKR/M/TqG569Z1KKzzigaBXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB6080.namprd11.prod.outlook.com (2603:10b6:8:84::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.31; Wed, 30 Apr 2025 16:34:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 16:34:07 +0000
Date: Wed, 30 Apr 2025 09:35:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v6 18/20] drm/xe/svm: Add xe_svm_find_vma_start() helper
Message-ID: <aBJRUnDyYBkHIAg/@lstrano-desk.jf.intel.com>
References: <20250430121912.337601-1-himal.prasad.ghimiray@intel.com>
 <20250430121912.337601-19-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250430121912.337601-19-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR05CA0052.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB6080:EE_
X-MS-Office365-Filtering-Correlation-Id: 50b3acca-0746-4219-cf3e-08dd8804d37f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lWIPpWEcvWpoi/siC87mjYFpzEWZDZf5nwlMPTxVyk8D9BDtLgyk780md2+P?=
 =?us-ascii?Q?9qCIzqEcfDxW3N8ofKdDfezFR3n/rf+MhjM6cGSzbd8tUARdE9lkt3r2MFOz?=
 =?us-ascii?Q?7vzatFt+HNJnDCBmHbvM1T2Mq6kzWH5EcyBt4KgYf1uKsDT7CaOz2C9cv7IS?=
 =?us-ascii?Q?ZuKlX6o52J23a1N7TahsUIELJe6PQ1k2m07tX4bwmeMzdJ9wPB3YXkCp6pr9?=
 =?us-ascii?Q?BqKP7EjKyPQWIoKo68cdQzGij/OFJDxLcVXf6XpnWLerBcUDJE+4XFKsnFhv?=
 =?us-ascii?Q?vcZQz4BKYsHj23JCimovm6uodgR6zu7qqVD5hPB4lxYG/nTyQlRMrI3wJAZW?=
 =?us-ascii?Q?B4BLMZbnZpHMTjwZjeBvM6Z3YcI9c993K2jMQA9Eaw+Y7Hkui0rK75aF/dUT?=
 =?us-ascii?Q?8KUwx/BNMAWx/1gZkQ2tA77cBNhHGJVsfn1e90pZpytLV0xRV4q4TjFxChtJ?=
 =?us-ascii?Q?8rIp/wi5FvV0T43l4bm6q2f7iGxRgJOaSMqIZiyVnTw1EoKSABxLmK8XnPI9?=
 =?us-ascii?Q?l3ON9SnlO17fwJvzzV9fKbGhEjiLlQ0DQ9JuQl+RD/HhNomO6LuGZ5E5u7TB?=
 =?us-ascii?Q?hZ5wade/1vTDJVUy4yAZRpGj2WJbbpb391/TRleOJ0wyuMd50prhxOfOwaMg?=
 =?us-ascii?Q?yHPGZECAzdKQHq/mAnf5PVYBid3GXjJhY0q/Vk2IGETm6r0BEDPAf1cWf+2m?=
 =?us-ascii?Q?CeG2BQR0M7oO/GYTgDf5ipFRm1Ucaz6OPb6FHBo3DFgvJUbeSKdsI397f4cW?=
 =?us-ascii?Q?hGDd7HMxDSJuVrX1YF3VqS+O+UhLAiI4qOKjrBdHsDCCKjLE/HBIREfuDVp1?=
 =?us-ascii?Q?rQUsVxtHofEhWUjk2gBZSaP4w8f9UPT5ihtm2eilfk6HWPL06ZjTTMbmtVBZ?=
 =?us-ascii?Q?KMt4b8M0cYdcfxDGcMRMzQ1fh6nENy35JaDvja838wI63QQ9k3uyyIY9xAPG?=
 =?us-ascii?Q?KL+Om4xFXxtyheMbQXmve3hsumw5iPodtA84YWEG5BvFVcIQ8OBzLaJd8F9g?=
 =?us-ascii?Q?mP4wc6/v5ObzevdTZS+PQddjbAoy4TaYRnhWtOprns3xvtlGNAFFWP4gzYM9?=
 =?us-ascii?Q?hxexc793W68Oj9UXjFM9O+qB3SWs+DcUTtqnWtP0uZyamd2px4NkpbqRZ0m+?=
 =?us-ascii?Q?/9eh9Vtc3Zx8ndUjpR2jJ35n6fNiF3n+VU1aSdcGXEE5rlT++EqA1lHadrlj?=
 =?us-ascii?Q?KhYtUS8HNx5B1A/Fm2Lg2j65NwqulxA7ASa2lKNXXgaROvaRCm4T5TFrF5xo?=
 =?us-ascii?Q?hG4T7rvS1CXy7wqBFgeygcePG6U41iJVgWlmpWj3cynLF7YXZPq1ihhuQmJH?=
 =?us-ascii?Q?LAczqJiS+uX2LTQbF0ZYEZwcXdVKNPGpwbv70P2LSxa/ngd4plTlZ7Odl6a2?=
 =?us-ascii?Q?5I5+2ielBq9uPbkzyREMgZyyfP7vjQeGH9I+kiyZDKGp91C+fKXF/gBPUqGQ?=
 =?us-ascii?Q?zaEhqcu+sGo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qP2oX5Kbp3RTwKLxrzG8DlnJrKQGNOwTUXppbL4nvvu/lDksV8RTSpLAQ/BG?=
 =?us-ascii?Q?9mgAWsK4dVL0jDmdZMyRgJwz4Dcav3UJktgXJL8eFS4As9QX52rkcRMYJKwI?=
 =?us-ascii?Q?7QVXpPVrhhYcSBWEziY1fVTDbl21j6hjbPylerncsfpJKPYd20YohAx0mhew?=
 =?us-ascii?Q?xa9TjcSiJs9TZqdBU97za4MHDVjHxvhiKOMMKJNk6CH3YkhS02H2fGWWz7qw?=
 =?us-ascii?Q?WgamSZjZV0w/ckbNOmwMdWINKylrvFD0wCLyLl17thcDvH24jnaeSK6rGCK4?=
 =?us-ascii?Q?d/rTEK5m5OuGqH6wGpovMgo5Ty/kiWnOObINNpVBoY8RAYdIXw0bRU6gnXqp?=
 =?us-ascii?Q?BXHAzLEqXgspiIi99dHCA7b1V0zArBps3WaXtLDPqOwY1e9EcooZ3jQ317dg?=
 =?us-ascii?Q?8Fntzp19cvXKbXVXSrnSqyL9Vv1jc/1mRq/W0hL1C/iD6JQw33mmb/Fqp1KW?=
 =?us-ascii?Q?TLwkil2y56An4NTVtUJ1saXoooPDpf/Io/eQ/83+6GALSz/OWwoyWwYTBxd6?=
 =?us-ascii?Q?a9gOusi+NjY7TWICKt5+dWtJtimZIrMXyvP1EG/zneNKTnKcjDO/1xTYH+Af?=
 =?us-ascii?Q?lHQKh8ioTcHbmc1fH+S7XUoaNjbh97nIMFjNNM6SFABT4JzQyf2s8u0rNRwt?=
 =?us-ascii?Q?xgd8lil2sSeewP/53KeoyDOO5BhqVbNfpVZAWzrh9rBj4JMJ581rM0z974qR?=
 =?us-ascii?Q?Qc/QfllmDE/xgXnZ9UcA/vSwqHhOpR6zJkmHnr6XiUDB29miGad9QyTCB7JN?=
 =?us-ascii?Q?Zlv/WSixKqCi7yjB2Hm2nHsgCTU/2F0JlyMJg5psye+4H/XdAAcam66hq3nM?=
 =?us-ascii?Q?wmfk+13lyfJHxPLjXHwyw3nIjcXp73T1PORyO/SvUnMeoOuqHzpBSXMPMt85?=
 =?us-ascii?Q?KqRcaGZ5zgLyuTVOtd5ug+pEc81vxzQzCq7/V3pJYkLJKdZC9kucZKalY7wb?=
 =?us-ascii?Q?DMcgb4GgoyP+iXzaz/MA21POPX+eAh0nPUqAyGGU9FswNSkLy0ZC60VmtHVB?=
 =?us-ascii?Q?rdizbAW7V8lDx2bvLFS9r2n+JeMa8l7gUkACCAmF2vYJX3UMlWui8vl+TAjs?=
 =?us-ascii?Q?sRQTYJ6wMxlFWr053AiodoYsYTyeicK450PsQh6GkHy5mGj3FiMTlZK+SiDj?=
 =?us-ascii?Q?8dY58xVx1hXXDK174P/utkBKlRWJttW+nCe3ijzVGuvNEflEZBwwJIPo8OvB?=
 =?us-ascii?Q?6qIXLyEG4cdYb1oo2Xs8KtkbQ7ARf+44M79Fdl3bBrhzr5ipRZopRf386QT3?=
 =?us-ascii?Q?/CCBLNo1IZXVS6spkMijmXgpeYCCC4NoJM4jHTWIUEg06gpHfg+aEIrhXmdh?=
 =?us-ascii?Q?A7lygXK9a1oxvHroiu9HgnMHOADFwwxJc286mE0I/lHzufSipK5Ygxue+8Sn?=
 =?us-ascii?Q?jtad/O8OlY/B/nsGygY56FGlFEc10hE7ErGzv4BO3QHaZKeAzWTl0/5/yYcW?=
 =?us-ascii?Q?pXdcFS0836c/mpRFYX70kSVd0XLrQA7Rwt+9um8o9/3N2hpQoiLYWErX4Zjj?=
 =?us-ascii?Q?iWYWiCDAvwCmxLa1UQkGG6I/uZvw6CAt1zoMr0SN1lc3yyVtjmjdWkBYmsPu?=
 =?us-ascii?Q?iR8vDPJhntdkmbOZJkDBC7zvEiIAIxnNRhMKLfcBnvgkZRF530N+hXnNRLiF?=
 =?us-ascii?Q?dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50b3acca-0746-4219-cf3e-08dd8804d37f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 16:34:06.9240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g0MYbmCaJfpRya7GsERJDOz7uS3LypysHJnpHeFCgIDhr0bnNkjeamMWn0WgMQJNAiKk2Y9UGQHhwBFyS6F0fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6080
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

On Wed, Apr 30, 2025 at 05:49:10PM +0530, Himal Prasad Ghimiray wrote:
> Add helper xe_svm_find_vma_start() function to determine start of cpu
> vma in input range.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_svm.c | 22 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_svm.h |  8 ++++++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index fff3a279e232..727c393d19b8 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -684,6 +684,28 @@ bool xe_svm_range_validate(struct xe_vm *vm,
>  	return ret;
>  }
>  
> +/**
> + * xe_svm_find_vma_start - Find start of CPU VMA
> + * @vm: xe_vm pointer
> + * @start: start address
> + * @end: end address
> + * @vma: Pointer to struct xe_vma
> + *
> + *
> + * This function searches for a cpu vma, within the specified
> + * range [start, end] in the given VM. It adjusts the range based on the
> + * xe_vma start and end addresses. If no cpu VMA is found, it returns ULONG_MAX.
> + *
> + * Return: The starting address of the VMA within the range,
> + * or ULONG_MAX if no VMA is found
> + */
> +u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 start, u64 end, struct xe_vma *vma)
> +{
> +	return drm_gpusvm_find_vma_start(&vm->svm.gpusvm,
> +					 max(start, xe_vma_start(vma)),
> +					 min(end, xe_vma_end(vma)));
> +}
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
>  static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 3f8c82f9c363..fe9f6fcaeb3a 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -89,6 +89,8 @@ bool xe_svm_range_validate(struct xe_vm *vm,
>  			   struct xe_svm_range *range,
>  			   u8 tile_mask, bool devmem_preferred);
>  
> +u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *vma);
> +
>  /**
>   * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
>   * @range: SVM range
> @@ -295,6 +297,12 @@ bool xe_svm_range_validate(struct xe_vm *vm,
>  	return false;
>  }
>  
> +static inline
> +u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end, struct xe_vma *vma)
> +{
> +	return ULONG_MAX;
> +}
> +
>  #define xe_svm_assert_in_notifier(...) do {} while (0)
>  #define xe_svm_range_has_dma_mapping(...) false
>  
> -- 
> 2.34.1
> 
