Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D459C43458
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jun 2026 16:28:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE1B210E97F;
	Mon, 29 Jun 2026 16:28:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MG/kIUUw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A07A610E97F
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 16:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782750483; x=1814286483;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SQ8FYVsoGliVcIT0J2MI/93oK15cph7kCr+uhCPapdA=;
 b=MG/kIUUwNNTWuWqUmJRMHRbA3CC97r4ZZ967LRdMtQFmpCBc02fvQLir
 lJTQO8MpGvZr2h0AQ3fSEmbhjMgEtPYmhQpPz/ysEZAflFFFOBMu6YlIy
 e3Vua6kfIPaMBzmj3GqSaQJ2mtxF46pxCTSp7ZqUX4tnMPjg5qqUiB/dp
 +JpHSAd9UFG48u67ag6CmGG7srB9hkZE0z6JexqjAveAjsYMvCjnNgJDw
 yg68/wWJOkcsP4W6aOSjhM1/36E4hrlzzeEhi4ChqTmt1pvD6jaTJzUM0
 yiJNTiUQrzY0G2WLIx3MVpR/2ZjO37txIDwEHvXTiJkSexd8atIbTuuPS A==;
X-CSE-ConnectionGUID: LPA5QaX3RJeN1Tb4flAknA==
X-CSE-MsgGUID: wAOXg2HESjiYfmF/YfjaTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="93800094"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; d="scan'208";a="93800094"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 09:28:03 -0700
X-CSE-ConnectionGUID: zv+AebJzQdKKinFOBnj9hw==
X-CSE-MsgGUID: N6bVRu6FSoGPJvPYb8Gxrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; d="scan'208";a="248026544"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 09:28:03 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 29 Jun 2026 09:28:02 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 29 Jun 2026 09:28:02 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.11) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 29 Jun 2026 09:28:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L+wwKnDkccMP18QTP4MUUE4y4RrbfgH4KzcyYLeD+z90FKmFNo+nDMbsq8HzBvCBbOtT4n80iwcvCpW+HINtyaPk6L9PB6tgVCIlGBYRggvNImR6y3D4sQb/8mWR2argqa2lHDf3Zds5+mosp01gfL5dxHS+XPwJZ3nHOiT4sIoTR3z/2vDUjXGArfC55bXjeMDb/f294ddA21GfqGV1WKiXVL1H1vINO87K4gwaQVxiWe5VOh9agxnfl5nW5nZ/1XkpBN3JCP5LwXzKEAT3ezr1m0V1fRVU/SEFWKFx4x1urFUcbscO2lgWx3/K9aFy0FOtBul0t1a7C77TW3aHwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8nY6xa6SnR4y1H7lgHKBl1j4sVI5jLWj0PYfdNgqSs=;
 b=xSkokeV9GizuKSZ1+s55i/RmHm8GLglh2VytK00Z4+WT9HnL1m8WWlZfXuKqBxFCPrecTUiOjQQQOjlxCbs2MUxnJxVXPjo5Zp4nWkDgv9nBMzhNfF/FzSMsUV/gKV7DMn7Z3/GE+FJxBZmNZ0AYIpHetujpON9N1f7UBU//H7F85XMoaqmnjXTgsvzGy454XtbzTW3nksWVIWiJTTzAsEdkDoN1EPB2kYqzGndKSQv3Yrcd/4Ccp4+YuhyGNZAYQqKYAmPMOKgw+1E1kuDebvcl6TzIYwhpgH6g32en5JYpSs4M3Bb2Kq3wULl+gcFpC7+n8g2QEk18fFlIe3nU6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6832.namprd11.prod.outlook.com (2603:10b6:510:22c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 16:27:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 16:27:58 +0000
Date: Mon, 29 Jun 2026 09:27:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Honglei Huang <honghuan@amd.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 4/5] drm/gpusvm: move struct drm_gpusvm_pages out of
 struct drm_gpusvm_range
Message-ID: <akKdDBjNvTpqJHem@gsse-cloud1.jf.intel.com>
References: <20260629022921.17533-1-honghuan@amd.com>
 <20260629022921.17533-5-honghuan@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260629022921.17533-5-honghuan@amd.com>
X-ClientProxiedBy: SJ0PR03CA0378.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6832:EE_
X-MS-Office365-Filtering-Correlation-Id: a4e9ae6e-f345-4f13-0ee6-08ded5fb61b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Vk6rJ2ZXQqBlZOV+VBCp1sRKpwn0ul9bIkbOaXHzPd3uNdQUiLbSwd0JpXvYNjySzCZw4S2yiwYQEDoM8bzpDscG1iu4XZWlSSVDt5BG0hpnGmFuzAqTTtvRuexakjmMXSxhDqYkoSETfnRSkuHw3wqKKA6YLLfDpM/kC+RlX155RogeW1koLByLc0j68oZ/Qx9J+zkRKYQBYdWsIfbzsvg5a+hIav5aYclxVrUJT3NIM94ylVMxdnUbN6MzAR97VBcXR+2kxuhnlEa6xQ/VAQXxgEf1VjrJtKnDDQCTTg4Djgntswe4V2+1jw43YeZoz8QRn9YM5cMY8/BtdRlZduU2rRE2j1z49pJYQlnJZLsev5id+g00b1HZwfU9c4PjOJFebfxAqRaNzEgLmq5UWyGodD8Ys37xkSQLHIGrZlDKw48UwRUZOVlUxNcxWZXHlulpW1pnOWa0KhseC/Ykh46dMPM5PxVF+3EP7q/Gu2KhJcR5eixGKpkySnb4XzhoSqsSTvHZse3BnRkab5TFfHIzT1IxYe59/vUSMxgFPrs/+gOtP5RW+uoa8uN4w4PaXmSrGLqm/JgQVX0GTv6I7rFYbVkg70Q7ZOZgwrMf95o1Uey/MaNG4dO6TgaHf9aupjPjqa42foKryE/S6hllMKZkd/TaWi7ELb2qdES+y3s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1AmvBDVDpNyzKaEfzDLJSJflRYi5O8r9T4QPPdOCSwyf0bQn1emmcpo8k710?=
 =?us-ascii?Q?2gmIrPPAFrcDendpa7j6XoL/dC+iUFfcYA35STyPqB/AIC1wMJ6BJ1bDDk1M?=
 =?us-ascii?Q?3NFI1Nkc7UgBFPA1hKefeya4jKpolf/MhJ1w703dr/+LzP6j3IDeBP3mu2WS?=
 =?us-ascii?Q?FIVz9HEwM4h0sD+hK+5PeFWTDcDVxAwhVh4bkwEHlPGfeC+nb38fz3uMTTkh?=
 =?us-ascii?Q?cFNG83dGVWVQwoyJ2c0EHs2lVapcDyUdIbzbeKl1hDDqdM5gos7Jd7IFJXUZ?=
 =?us-ascii?Q?zqrP6b1TX1bPBLfidBE1Gb64rObXEEkt+K+lbTW4hSpjpIVPC+ZkfN1oLaa4?=
 =?us-ascii?Q?K3vZ7ED040lrSNwj51UfrsGfkYMTtfL9a4UVH13hihai8+ohLfoXe/+QCE/h?=
 =?us-ascii?Q?HLrpYZSsa51cNR+0U1I3cQfP1ExamNfMvqHa5pu+Co7xNIZNeVBVk81vlxSJ?=
 =?us-ascii?Q?yWag8QNNdX6uCoXViMzCQFB3JJAofdrcSqLtNqBADJZLJUMeLyovoc++vkCF?=
 =?us-ascii?Q?g/hr8yZe2QCU1HDGoAjdB/BBXLPSGJ9EpFntIZMXizwkMSoL11d1pY7D2QL/?=
 =?us-ascii?Q?PAIiaX8RcpiUaTYmXwPE940XASoqMyZe21vfVLYcM5ZxOBYW5r2Nya0SC/fs?=
 =?us-ascii?Q?JNQZYgOTY9mlgoIfcbhTMrZm0+79T8i+qEB1SoY4WQZQQBsU/wNBVqoIYTpX?=
 =?us-ascii?Q?GNoPS9aINQzJiO2qMlAYWrJaKBuFnZzQJEjJt/aJGUNLy3R9Q/ZsXmGe+RhF?=
 =?us-ascii?Q?DXhDzD6P2RfqQQgUjA0gV7YnkWR/4oDtM8kJi5f23FUvDfxvrn52E6wmrF8e?=
 =?us-ascii?Q?KcsJfe0IgSKqlPOnuY+4yVX7M0MikI++b4kaBnsxpJH/yQ4d7KSoVdsqSBE9?=
 =?us-ascii?Q?2CL5T0QhsHoyU1ze7ZkpNE80qDyHj99h4Jj7DEuRaeYHg3Z4M8faW4Rwshrl?=
 =?us-ascii?Q?R+0cZ4C4NWvdJTtzae6yAlrrzmWmzAgBp/KFnZ2epyPE0fkSgWUmLYsuQR9w?=
 =?us-ascii?Q?Qc2tQZzbuaA0unw+cevdx4FGV08M126Aye2KyDrLh0ORfRahLgGAvL0YwIlb?=
 =?us-ascii?Q?pwGE/O1a06CmK28Gj5R4zSKB/RfbxgnA1E1kaS+MOq8aIN9IaygonNqHWuO+?=
 =?us-ascii?Q?2AomHQBTNEOgOm58NdvQJXoQhaw38huhGYs70hqMTrbjEVB21gonl4us1XR5?=
 =?us-ascii?Q?Et3rqGlELWaYn0A0phlR8dEn10nwNSyuqQXRut/tSOeQNUDg52QOGOwJgG8W?=
 =?us-ascii?Q?rHRhjTXPSlawRx67mshb1GWw+idxI203XiX9/GvPpzv0Z/akJMx1l3kOvsXh?=
 =?us-ascii?Q?7Ltwv0mJGjDgGkRulqgjH9ERer5P5mE2oNatEWQRVdpSBiTlzADrhrdlDFmF?=
 =?us-ascii?Q?4mLy5vrPTUy0si7MUsblOiG0To2jhK7G1XDdPupjoRsbqn493jdzfTSFPrtm?=
 =?us-ascii?Q?6/6QP2ZjVjUwUJqOBdbXxUYka60vz2kYe6MWf/+t3q5Aad/xt156LQ9U26QH?=
 =?us-ascii?Q?c4FtVdnE2FfAjJNzRbfpwMgKZ3b/gczO+m5DxJOYXwoaita6OdDaPyp7Hnj/?=
 =?us-ascii?Q?XDngrfaRZW9EcZ7Inpw9xu8O9xS6LN77eoCoSzP0KLmKBxwWmiW3x5yubrer?=
 =?us-ascii?Q?41FxF+CeJVdwzNhrArF4RXES4Iuogz1Ph4hGLCRo4JI063UviHJpoRSnVqyn?=
 =?us-ascii?Q?K9UwkUK/ipiTKVx4KKfeQEWEnDtG0lNxitJE4NgKp10FIYuhCIp4SJtCwiRT?=
 =?us-ascii?Q?9WBvNyOBdilB38fey3cusDbkEVF6MNA=3D?=
X-Exchange-RoutingPolicyChecked: DwHN83i+sbYABc2HHr63wHv5tIHWug+Ul0qQ2aMlBsUTLhZtD0/MDt06tMiLMTPnAWniJHM9L0PdNvxA9jDdtEs3LbdMWMVdBko3UvN/Ni5yP5RanH79+EXvO/Pk9d2uBBCbx2S6Eznh+mjZEzuzB69AiS7zTvXBchehHMI8gOV0iTCs8dNbS9Ph2/qdC1bJ6Re5zkCIK6hZ7+yavN3M6AlTJmj+njDD7dtDiBqXSuyOpbT/fUyBpJyemUyzJXrnCnyBaLq7FwYXFijqTNJaTbF5s1kHEhc2RBY42ctKegEE1fJLDRJqXwG1kWTR3ha952p98LXqpRE7GyyTpeo4Dw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a4e9ae6e-f345-4f13-0ee6-08ded5fb61b6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 16:27:58.7512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +I57keNFdFlKLQGwrmuYel180gM+oAqq/+/4x9IDFwPmtFDFX/xvuVzp+LncWkz2RYC3ECULajXe9PLKgA3OrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6832
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

On Mon, Jun 29, 2026 at 10:29:20AM +0800, Honglei Huang wrote:
> Since the pages the physical pages and MM VA range has been abstractly
> separated. Unbinding a single form of physical page from the MM VA
> range, brings flexibility to the drm gpu SVM framework, transfer the
> way of management of MM and device physical pages to the driver layer.
> 
> framework's range embedded pages object and its range level wrappers
> have no users left. Remove the following:
> 
>   - Drop pages in drm_gpusvm_range.
>   - Drop drm_gpusvm_range_pages_valid(), drm_gpusvm_range_get_pages()
>     and drm_gpusvm_range_unmap_pages(); drivers should use the
>     drm_gpusvm_pages helpers (drm_gpusvm_pages_valid,
>     drm_gpusvm_get_pages, drm_gpusvm_unmap_pages) directly on a
>     pages object they own.
>   - Drop the notifier_seq seeding in drm_gpusvm_range_alloc();
>     drivers initialise notifier_seq on their own pages object.
> 
> Update the DOC: overview to match the new model: document struct
> drm_gpusvm_pages and the driver owned 1:1 / N:1 layouts, and rewrite the
> usage examples to operate on a driver embedded pages object by the
> drm_gpusvm_pages helpers instead of the removed range level wrappers.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Honglei Huang <honghuan@amd.com>
> ---
>  drivers/gpu/drm/drm_gpusvm.c | 169 +++++++++++++++++++----------------
>  include/drm/drm_gpusvm.h     |  13 ---
>  2 files changed, 90 insertions(+), 92 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index b0e9a2db108..e0fd0b2fcc5 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -48,6 +48,47 @@
>   *	event. As mentioned above, ranges are tracked in a notifier's Red-Black
>   *	tree.
>   *
> + * - Pages:
> + *	struct drm_gpusvm_pages holds the DMA mapping state for a range of
> + *	CPU virtual addresses: the DMA mapped device addresses,
> + *	the device private pagemap, the IOVA state, the per mapping
> + *	notifier sequence number, and the drm_device that owns the DMA
> + *	mappings.
> + *	A driver embeds one or more struct drm_gpusvm_pages alongside its
> + *	struct drm_gpusvm_range, choosing one of two layouts:
> + *
> + *	1:1 - one drm_gpusvm_pages per range (one drm_device). Simplest
> + *	layout; to mirror a VA range on several devices a driver uses a
> + *	separate range (and notifier) per device, so the HMM fault is taken
> + *	once per device.
> + *
> + *	N:1 - one drm_gpusvm_pages per drm_device, all sharing one range and
> + *	notifier; only the per-device DMA mapping differs. The instances must
> + *	sit in contiguous memory so a single drm_gpusvm_range_set_unmapped()
> + *	can mark them all. A driver can keep one instance inline for the single
> + *	device case and switch to a heap array only when more devices join,
> + *	e.g.:
> + *
> + *	.. code-block:: c
> + *
> + *		struct driver_range {
> + *			struct drm_gpusvm_range base;
> + *			unsigned int num_pages;	// 1: inline_pages, >1: pages[]
> + *			union {
> + *				struct drm_gpusvm_pages inline_pages;
> + *				struct drm_gpusvm_pages *pages;
> + *			};
> + *		};
> + *
> + *	In the N:1 case the driver allocates the pages array with a zeroing
> + *	allocator (e.g. kcalloc(num_pages, ...)), initialises each entry with
> + *	drm_gpusvm_init_pages(), and frees each entry with
> + *	drm_gpusvm_free_pages() plus the array itself, from its range free
> + *	callback. Each drm_gpusvm_pages is mapped independently by their own
> + *	drm_device.
> + *	Each drm_gpusvm_pages must be zero-initialised and initialised with
> + *	drm_gpusvm_init_pages(), called once per entry.
> + *
>   * - Operations:
>   *	Define the interface for driver-specific GPU SVM operations such as
>   *	range allocation, notifier allocation, and invalidations.
> @@ -92,7 +133,7 @@
>   * range RB tree and list, as well as the range's DMA mappings and sequence
>   * number. GPU SVM manages all necessary locking and unlocking operations,
>   * except for the recheck range's pages being valid
> - * (drm_gpusvm_range_pages_valid) when the driver is committing GPU bindings.
> + * (drm_gpusvm_pages_valid) when the driver is committing GPU bindings.
>   * This lock corresponds to the ``driver->update`` lock mentioned in
>   * Documentation/mm/hmm.rst. Future revisions may transition from a GPU SVM
>   * global lock to a per-notifier lock if finer-grained locking is deemed
> @@ -140,15 +181,20 @@
>   *
>   * .. code-block:: c
>   *
> - *	int driver_bind_range(struct drm_gpusvm *gpusvm, struct drm_gpusvm_range *range)
> + *	struct driver_range {
> + *		struct drm_gpusvm_range base;
> + *		struct drm_gpusvm_pages pages;
> + *	};
> + *
> + *	int driver_bind_range(struct drm_gpusvm *gpusvm, struct driver_range *drange)
>   *	{
>   *		int err = 0;
>   *
> - *		driver_alloc_and_setup_memory_for_bind(gpusvm, range);
> + *		driver_alloc_and_setup_memory_for_bind(gpusvm, drange);
>   *
>   *		drm_gpusvm_notifier_lock(gpusvm);
> - *		if (drm_gpusvm_range_pages_valid(range))
> - *			driver_commit_bind(gpusvm, range);
> + *		if (drm_gpusvm_pages_valid(gpusvm, &drange->pages))
> + *			driver_commit_bind(gpusvm, drange);
>   *		else
>   *			err = -EAGAIN;
>   *		drm_gpusvm_notifier_unlock(gpusvm);
> @@ -160,6 +206,8 @@
>   *			     unsigned long gpuva_start, unsigned long gpuva_end)
>   *	{
>   *		struct drm_gpusvm_ctx ctx = {};
> + *		struct driver_range *drange;
> + *		struct drm_gpusvm_range *range;
>   *		int err;
>   *
>   *		driver_svm_lock();
> @@ -174,6 +222,7 @@
>   *			err = PTR_ERR(range);
>   *			goto unlock;
>   *		}
> + *		drange = container_of(range, struct driver_range, base);
>   *
>   *		if (driver_migration_policy(range)) {
>   *			err = drm_pagemap_populate_mm(driver_choose_drm_pagemap(),
> @@ -183,7 +232,10 @@
>   *				goto retry;
>   *		}
>   *
> - *		err = drm_gpusvm_range_get_pages(gpusvm, range, &ctx);
> + *		err = drm_gpusvm_get_pages(gpusvm, &drange->pages,
> + *					   gpusvm->mm, &range->notifier->notifier,
> + *					   drm_gpusvm_range_start(range),
> + *					   drm_gpusvm_range_end(range), &ctx);
>   *		if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {	// CPU mappings changed
>   *			if (err == -EOPNOTSUPP)
>   *				drm_gpusvm_range_evict(gpusvm, range);
> @@ -192,7 +244,7 @@
>   *			goto unlock;
>   *		}
>   *
> - *		err = driver_bind_range(gpusvm, range);
> + *		err = driver_bind_range(gpusvm, drange);
>   *		if (err == -EAGAIN)	// CPU mappings changed
>   *			goto retry
>   *
> @@ -205,6 +257,21 @@
>   *
>   * .. code-block:: c
>   *
> + *	// The driver owns the drm_gpusvm_pages lifecycle. ops->range_free is
> + *	// the final fallback: drm_gpusvm_free_pages() unmaps any
> + *	// lingering DMA mapping and a no-op if already unmapped and frees the
> + *	// dma_addr array. The normal flow is to DMA unmap before
> + *	// drm_gpusvm_range_remove() (before the range leaves the tree).
> + *	void driver_range_free(struct drm_gpusvm_range *range)
> + *	{
> + *		struct driver_range *drange =
> + *			container_of(range, struct driver_range, base);
> + *
> + *		drm_gpusvm_free_pages(range->gpusvm, &drange->pages,
> + *				      drm_gpusvm_range_size(range) >> PAGE_SHIFT);
> + *		kfree(drange);
> + *	}
> + *
>   *	void __driver_garbage_collector(struct drm_gpusvm *gpusvm,
>   *					struct drm_gpusvm_range *range)
>   *	{
> @@ -215,6 +282,14 @@
>   *			drm_gpusvm_range_evict(gpusvm, range);
>   *
>   *		driver_unbind_range(range);
> + *		// The pages must be DMA unmapped before drm_gpusvm_range_remove()
> + *		// , so a range is never off the MMU interval tree while still DMA
> + *		// mapped as the original drmsvm design flow. Otherwise a concurrent CPU
> + *		// munmap's notifier could miss this range and free pages still mapped
> + *		// for device DMA. This is the normal unmap point.
> + *		drm_gpusvm_unmap_pages(gpusvm, &drange->pages,
> + *				       drm_gpusvm_range_size(range) >> PAGE_SHIFT,
> + *				       &(struct drm_gpusvm_ctx){ .in_notifier = false });
>   *		drm_gpusvm_range_remove(gpusvm, range);
>   *	}
>   *
> @@ -236,17 +311,22 @@
>   *	{
>   *		struct drm_gpusvm_ctx ctx = { .in_notifier = true, };
>   *		struct drm_gpusvm_range *range = NULL;
> + *		struct driver_range *drange;
>   *
>   *		driver_invalidate_device_pages(gpusvm, mmu_range->start, mmu_range->end);
>   *
>   *		drm_gpusvm_for_each_range(range, notifier, mmu_range->start,
>   *					  mmu_range->end) {
> - *			drm_gpusvm_range_unmap_pages(gpusvm, range, &ctx);
> + *			drange = container_of(range, struct driver_range, base);
> + *
> + *			drm_gpusvm_unmap_pages(gpusvm, &drange->pages,
> + *					       drm_gpusvm_range_size(range) >> PAGE_SHIFT,
> + *					       &ctx);
>   *
>   *			if (mmu_range->event != MMU_NOTIFY_UNMAP)
>   *				continue;
>   *
> - *			drm_gpusvm_range_set_unmapped(range, mmu_range);
> + *			drm_gpusvm_range_set_unmapped(range, &drange->pages, 1, mmu_range);
>   *			driver_garbage_collector_add(gpusvm, range);
>   *		}
>   *	}
> @@ -640,8 +720,6 @@ drm_gpusvm_range_alloc(struct drm_gpusvm *gpusvm,
>  	range->itree.start = ALIGN_DOWN(fault_addr, chunk_size);
>  	range->itree.last = ALIGN(fault_addr + 1, chunk_size) - 1;
>  	INIT_LIST_HEAD(&range->entry);
> -	range->pages.notifier_seq = LONG_MAX;
> -	range->pages.drm = gpusvm->drm;
>  	range->flags.migrate_devmem = migrate_devmem ? 1 : 0;
>  
>  	return range;
> @@ -930,7 +1008,7 @@ drm_gpusvm_range_chunk_size(struct drm_gpusvm *gpusvm,
>  		 * mallocs 16k but the CPU VMA is ~128k which results in 64k SVM
>  		 * ranges. When migrating the SVM ranges, some processes fail in
>  		 * drm_pagemap_migrate_to_devmem with 'migrate.cpages != npages'
> -		 * and then upon drm_gpusvm_range_get_pages device pages from
> +		 * and then upon drm_gpusvm_get_pages device pages from
>  		 * other processes are collected + faulted in which creates all
>  		 * sorts of problems. Unsure exactly how this happening, also
>  		 * problem goes away if 'xe_exec_system_allocator --r
> @@ -1337,27 +1415,6 @@ bool drm_gpusvm_pages_valid(struct drm_gpusvm *gpusvm,
>  }
>  EXPORT_SYMBOL_GPL(drm_gpusvm_pages_valid);
>  
> -/**
> - * drm_gpusvm_range_pages_valid() - GPU SVM range pages valid
> - * @gpusvm: Pointer to the GPU SVM structure
> - * @range: Pointer to the GPU SVM range structure
> - *
> - * This function determines if a GPU SVM range pages are valid. Expected be
> - * called holding gpusvm->notifier_lock and as the last step before committing a
> - * GPU binding. This is akin to a notifier seqno check in the HMM documentation
> - * but due to wider notifiers (i.e., notifiers which span multiple ranges) this
> - * function is required for finer grained checking (i.e., per range) if pages
> - * are valid.
> - *
> - * Return: True if GPU SVM range has valid pages, False otherwise
> - */
> -bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
> -				  struct drm_gpusvm_range *range)
> -{
> -	return drm_gpusvm_pages_valid(gpusvm, &range->pages);
> -}
> -EXPORT_SYMBOL_GPL(drm_gpusvm_range_pages_valid);
> -
>  /**
>   * drm_gpusvm_pages_valid_unlocked() - GPU SVM pages valid unlocked
>   * @gpusvm: Pointer to the GPU SVM structure
> @@ -1638,29 +1695,6 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
>  }
>  EXPORT_SYMBOL_GPL(drm_gpusvm_get_pages);
>  
> -/**
> - * drm_gpusvm_range_get_pages() - Get pages for a GPU SVM range
> - * @gpusvm: Pointer to the GPU SVM structure
> - * @range: Pointer to the GPU SVM range structure
> - * @ctx: GPU SVM context
> - *
> - * This function gets pages for a GPU SVM range and ensures they are mapped for
> - * DMA access.
> - *
> - * Return: 0 on success, negative error code on failure.
> - */
> -int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
> -			       struct drm_gpusvm_range *range,
> -			       const struct drm_gpusvm_ctx *ctx)
> -{
> -	return drm_gpusvm_get_pages(gpusvm, &range->pages,
> -				    gpusvm->mm,
> -				    &range->notifier->notifier,
> -				    drm_gpusvm_range_start(range),
> -				    drm_gpusvm_range_end(range), ctx);
> -}
> -EXPORT_SYMBOL_GPL(drm_gpusvm_range_get_pages);
> -
>  /**
>   * drm_gpusvm_unmap_pages() - Unmap GPU svm pages
>   * @gpusvm: Pointer to the GPU SVM structure
> @@ -1691,29 +1725,6 @@ void drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
>  }
>  EXPORT_SYMBOL_GPL(drm_gpusvm_unmap_pages);
>  
> -/**
> - * drm_gpusvm_range_unmap_pages() - Unmap pages associated with a GPU SVM range
> - * @gpusvm: Pointer to the GPU SVM structure
> - * @range: Pointer to the GPU SVM range structure
> - * @ctx: GPU SVM context
> - *
> - * This function unmaps pages associated with a GPU SVM range. If @in_notifier
> - * is set, it is assumed that gpusvm->notifier_lock is held in write mode; if it
> - * is clear, it acquires gpusvm->notifier_lock in read mode. Must be called on
> - * each GPU SVM range attached to notifier in gpusvm->ops->invalidate for IOMMU
> - * security model.
> - */
> -void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
> -				  struct drm_gpusvm_range *range,
> -				  const struct drm_gpusvm_ctx *ctx)
> -{
> -	unsigned long npages = npages_in_range(drm_gpusvm_range_start(range),
> -					       drm_gpusvm_range_end(range));
> -
> -	return drm_gpusvm_unmap_pages(gpusvm, &range->pages, npages, ctx);
> -}
> -EXPORT_SYMBOL_GPL(drm_gpusvm_range_unmap_pages);
> -
>  /**
>   * drm_gpusvm_range_evict() - Evict GPU SVM range
>   * @gpusvm: Pointer to the GPU SVM structure
> diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> index 3f38283111c..2862104aa1b 100644
> --- a/include/drm/drm_gpusvm.h
> +++ b/include/drm/drm_gpusvm.h
> @@ -177,7 +177,6 @@ struct drm_gpusvm_range_flags {
>   * @refcount: Reference count for the range
>   * @itree: Interval tree node for the range (inserted in GPU SVM notifier)
>   * @entry: List entry to fast interval tree traversal
> - * @pages: The pages for this range.
>   * @flags: Flags for range see &struct drm_gpusvm_range_flags
>   *
>   * This structure represents a GPU SVM range used for tracking memory ranges
> @@ -189,7 +188,6 @@ struct drm_gpusvm_range {
>  	struct kref refcount;
>  	struct interval_tree_node itree;
>  	struct list_head entry;
> -	struct drm_gpusvm_pages pages;
>  	struct drm_gpusvm_range_flags flags;
>  };
>  
> @@ -307,20 +305,9 @@ drm_gpusvm_range_get(struct drm_gpusvm_range *range);
>  
>  void drm_gpusvm_range_put(struct drm_gpusvm_range *range);
>  
> -bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
> -				  struct drm_gpusvm_range *range);
> -
>  bool drm_gpusvm_pages_valid(struct drm_gpusvm *gpusvm,
>  			    struct drm_gpusvm_pages *svm_pages);
>  
> -int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
> -			       struct drm_gpusvm_range *range,
> -			       const struct drm_gpusvm_ctx *ctx);
> -
> -void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
> -				  struct drm_gpusvm_range *range,
> -				  const struct drm_gpusvm_ctx *ctx);
> -
>  bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, unsigned long start,
>  			    unsigned long end);
>  
> -- 
> 2.34.1
> 
