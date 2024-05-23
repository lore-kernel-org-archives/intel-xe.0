Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700D3C25B75
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 18:17:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A5710E154;
	Thu, 23 May 2024 18:17:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cWkCgO0Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7359310E154
 for <intel-xe@lists.freedesktop.org>; Thu, 23 May 2024 18:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716488219; x=1748024219;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=noublw7puLTk7pyd6oAcnyFSgQ9G4ZL8cbEWBeduYjI=;
 b=cWkCgO0ZffgqxzlkZBtnN4s/LFGuLhM2PkAUErgCjp7Z2Alz50HY6SZW
 HkUqyIeRcg7NFEU3BvxKClKQxU/Or9jQP7q75WnHYoOYrfrp5cTcoPlqI
 uvZKTsvN+x6nOi6vuQB5JfDF6rYCzomYXBv4YuO00BCNRzBt51fOUFjQe
 KW39uvVafeFy0W99G2OTTpnlBp9JApItWVQI/fPVrJhYb73TRdgiw8mwU
 vdAAZLer5MgzTQ2b59WeQZ7lcqXet9MuzMqmeDsjd3XOm8zo0TxEGJJHB
 sLG5ndj586nJnqgX1ndpcm8IpLn4xld8xy1qpDFT+7Ia+cgh45yYwDWUU Q==;
X-CSE-ConnectionGUID: vZgxSTl8RWmAWQoTcqx2GA==
X-CSE-MsgGUID: lXZIRFWSQjqKoOB44aJZkw==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="23401443"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="23401443"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 11:16:48 -0700
X-CSE-ConnectionGUID: IGLtrvTOSgiVAkaoEa4BJQ==
X-CSE-MsgGUID: hmLdgUnGQqSCfwQy0HYhrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="34308403"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 May 2024 11:16:44 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 11:16:42 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 11:16:42 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 23 May 2024 11:16:42 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 23 May 2024 11:16:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ggFJFsvd6NcNRVB3y5LE1/f0/gMy3dHY7yoIBq+tkLGEb1lYxOdJcBawjU0hZtrziTi90igaCF/kR6FzvZ+lPnLkrNjM7Q/F5ilwXSmYhx9ZHOWBKIPJvo7OmiGfv/XI7pw2kocfbAs7kZPqtXaDjIjVMz6ojAZhkkb17MTkAnuvdm0YQE7DRae04vunN3UuVaVZeJKoy0hY4AVf3HuogUutTEAI370cUXQVfZMxPJSpbxikxVV1OqSxf3sX0vyc5zW8D9NTBL/3K8YT0wnUAIxN5+xAOLYnlirKarZyEBwl7v2b3gZ/PSpkwDJZiwE4NoXF3Oqj3Fk2mSjFBwGgqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UqKD0q8ejpLkiDTZQTu1NXxgN5jgSC28FFWWk00TTbo=;
 b=B+5W0FRW2RFALK7lxB0zOGDsFisdHq0osN1wceqDDpfueS8hTTcgeKEPcTSo/6poYylchw6HajkBzuTCbBv7Sw76wCcX1C31W8lpbz+FPN78M7ESlGaecyR+4NIHYJfhzVNkmFdR/SxDk6+90aGrfJP+ZKjoYvaLkSlf0cBm8pAqDlk7uMYdHmKVp6WLDPhh7rEagw6PvtbUrCJ22u60cS6pb8nP4W2MeMZUoSJ6+5DCIWKm9+7dFunHxLzPkj0SqfdHZXS7PNibFha6OF9HxpJxY4OF1+EKOCpt6ymTUcn/cIsFw0R3++JKAZiUDZY7CFHCgVxk3M4HX9bfPqkR/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by MW4PR11MB5773.namprd11.prod.outlook.com (2603:10b6:303:180::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 18:16:38 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7587.030; Thu, 23 May 2024
 18:16:38 +0000
Date: Thu, 23 May 2024 18:16:15 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/5] drm/xe: Don't initialize fences at
 xe_sched_job_create()
Message-ID: <Zk+H708g5g323hT3@DUT025-TGLU.fm.intel.com>
References: <20240523152911.28387-1-thomas.hellstrom@linux.intel.com>
 <20240523152911.28387-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240523152911.28387-4-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY5PR16CA0005.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::18) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|MW4PR11MB5773:EE_
X-MS-Office365-Filtering-Correlation-Id: 6044af3e-048d-4046-39ce-08dc7b547cab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?8aCGdShOkcxfnsaDNR9j5ycjWKQk4+Wd5Gq7yBBcmhYij1TdRaExSAxxnk?=
 =?iso-8859-1?Q?wmsMpNYV/ax2Fn92FK+8wq49uU00o7L3K6YKE08Sw4VQhDi1+WcSwG9nfU?=
 =?iso-8859-1?Q?JuxXsCAR5f2XtT+m852UeSl6Lf5Zo/vajElpSm/V5/5Zyd/r2ZDLOzXVUj?=
 =?iso-8859-1?Q?+f+b0bO6J4g+vY9QtW6ZFkr0wvz042NdpI4Yrd1mTMoG77pum4XWsAcfJx?=
 =?iso-8859-1?Q?h7BUi0MsD38ccuWWirha53TzYgfL1Gx2jZKDV8SSvMHaSNOvV9BtQxm0Pd?=
 =?iso-8859-1?Q?4KTO95sJokNi3og+j3CN4keybLiWXBllYyAbCsDK2uCLlHDCvhf+7WLaUw?=
 =?iso-8859-1?Q?2xSh4NqBS7S1LJCv6GGbPk7ZOnlS2pIx16TFikZMHJXQ71IDgPVfID68IC?=
 =?iso-8859-1?Q?eNLXFQGBVLAjgrvwQzPEpQz4uwL/vaEmBmvpTpSZ244j/OFLrtbObX6flw?=
 =?iso-8859-1?Q?RK48HOEYW8GfZCPp0odxhHF1TXpSimYdDvEbKB3atzBjISj60GqctOd+1V?=
 =?iso-8859-1?Q?ZTn/QswXqjGWKhgxdWgWKSs4Fzk7XlA+PRHnVWCyPpCDAr0CXRf/fKeTqs?=
 =?iso-8859-1?Q?efo15iPjmSpuGWAnqKLLNni3FS6qlFBAIhsNPtOnJjG8zH32AIwV+uUA1y?=
 =?iso-8859-1?Q?ZS4/THQf6ClZn11LUHuKinARq8Qoy3IX8yMmlILdvA2zrVBXqYiBchHN29?=
 =?iso-8859-1?Q?pM+ndEJ8cONDA8fVRs8ZP3y/rP8dci85TuIWQrAlNOIGurpZrzhL6XE5rs?=
 =?iso-8859-1?Q?TRPdnCuazWUeRPJVmXXpdBueNse6fS0z4OwZFAoh5bBu50Iq1J0xwKldn6?=
 =?iso-8859-1?Q?MmprpCrTQwmT5x+bVRa9VvwFHDczicEemYx5J9wbjcuBfC4nKrMpfVRS7t?=
 =?iso-8859-1?Q?qeUXcDzo5w6rivda/rubb1OGFlniVsMr+8zhoUQkZ/2GstfQGfDAEQ0F4E?=
 =?iso-8859-1?Q?oUv9DO9KsRIq30AjPUpNdWQ4Wtk6aYnpZUPQsENY7OcXv3NqLYmgOY3S7r?=
 =?iso-8859-1?Q?GjwQUIxacEJHqE5mqhjMDXnr4ju3COFOQ5D9GtCd1RZLxf4M6QTYKxPdWA?=
 =?iso-8859-1?Q?eL29a8y0l+KAFLSbDvp/xsU3XGe3pHAWcuf34P9FGHw7G1ahqksHweSnAT?=
 =?iso-8859-1?Q?rvlnBG29JvNGi5q7zGiajasIXOlFj2Nh43FNJM8vpxO3uMJbFqR7cQL6px?=
 =?iso-8859-1?Q?+IALJC0EGHsqEyTGedU4zCkJVNWnoz+dQCPItEWxScb1W5UIFLpos0XuNc?=
 =?iso-8859-1?Q?qckNrqqSvh3jzj26T+UOYaWbLgRQPecTdZxKZ5gf7mc9+HK++syUWREHzO?=
 =?iso-8859-1?Q?VybfPlyYpiWvJSgQ3OtmMVuRUQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qZosWE9/sjfm2327++RUWldvdV6ELvBkcLWysquLI6bquZgEivX1DerksA?=
 =?iso-8859-1?Q?IuJUC2RUDDZFj3LZPJGd9+71yJaGHwatZB6wGzP94eECAwqMnXSjHEJ4gg?=
 =?iso-8859-1?Q?roFhmYmBKW6jymg/XobNfduzmVGzSE+jpvcUn3thdFgWcqhIsPHoCF5Dsb?=
 =?iso-8859-1?Q?KoZiLSWLfcwA9cDo6utOFble41mXpngXIcBCASZXmgeBB5cZwhGOHHkLe1?=
 =?iso-8859-1?Q?oYUTRY6eViP6z1tOmFFrq6rNR9ZRoV45YULgV/HIL4jD1GM3PNE1IO8Y2F?=
 =?iso-8859-1?Q?LX42VPTtaJ+yJlj+YW30RZ/wcXlKMSHgTo6f1Rw1SgvvhAgk9TeQFUleVu?=
 =?iso-8859-1?Q?xHwb2JeOCkKy7zoJBLzZUk7K06SmG2USQj5jT2aLKDOWOIsjQ7CJe4CNBJ?=
 =?iso-8859-1?Q?Bsilti0P7QqHKnWcWmG+12yynvT3XeigsFgWWWtE0mxmTa6jCdOkcA2qtM?=
 =?iso-8859-1?Q?YGDvw1flamOQs+Z6b/ZmlPAkraV1nRPFgSObeecsMZGsFEK9uNOSf9ldEX?=
 =?iso-8859-1?Q?GptrZvAFDb9MEshzZUIB38rKTWHul3RgShuvV8E6AuJLtUwV/dxbGkATAx?=
 =?iso-8859-1?Q?ZBn69esDJhGH0OSWPQWZ75h2nHYeAftH1WIRmGnkZckqq/scOGFmwUceyw?=
 =?iso-8859-1?Q?LmASUEzglodj0uqhV2vCe5CJKEGVbD7Bv2EBLviXX+GGcmxQmnItuIp+VL?=
 =?iso-8859-1?Q?U7aT7uL8xT/79I2m2cGecHgTU7azJdMxkGhWTCmFJ8iUfK7ZGEmPYLrxTF?=
 =?iso-8859-1?Q?+UcN5IUDb+QSXN+BIHR4zd0s8JYW+WUvLOJUUcTxFb9/4xujsQo413YczC?=
 =?iso-8859-1?Q?GFvLgdtPjCT0tFbM7JFEo1iEbvm+Us8Wh40lHW1PZMPC5H1ynX4bSRygT5?=
 =?iso-8859-1?Q?9gK1PUwAjTy9yZrDbdpg6YA66BgqRDOxo/BXZ0r8F9/dLskRnwK96JoRik?=
 =?iso-8859-1?Q?CeboWCtZZ379XhEM5I8oCE715Q9eBxYtHnbprisDLo/zMVF7EbNw4Zk7y7?=
 =?iso-8859-1?Q?yQavXLdZUP2XRDBwiPit6x3C4jA0sUiI1vCqaZePNblU5jXwM3LAlwhdeO?=
 =?iso-8859-1?Q?4yI346/7CqC45Q8YSZGJrwmiVR9N2RHCFgPPNVXmG5Q+hzhWoHFlkcu0JU?=
 =?iso-8859-1?Q?5+JD4nai0xqLBadFOPjJpaF4iKI+yIs04QCoubqZZhENdd1aiH/x6HfMbd?=
 =?iso-8859-1?Q?lJJjqvqwQDFIoVyezpy0SmlfrSV1ExEWd2KbWq4RvypwmSwH5NFPqihTIo?=
 =?iso-8859-1?Q?xK1r7ejvyYwRgR8HVI8P/f6zTUbGkV9WEQogE0Xee8tDpEesgC7HPWIiWG?=
 =?iso-8859-1?Q?Yj2dxlo5aKDl1Z6cI7NBjm1WEUZ16uGVgO8vS9xwimCNlUloU6Ab/3U/z+?=
 =?iso-8859-1?Q?X5iN7gsLrAuh3mmkxh/cLpBJvAblJyIMs5Ce//lAfuA9rDrLjfMR487H8U?=
 =?iso-8859-1?Q?10DVixiCz64TkX18K9r4xavE5pR+r0O0MPfcdN/bRJggXQYeRW0eGOR3zs?=
 =?iso-8859-1?Q?b5LVJXlA1GCg4R8BdR7zipJz0G4eG9E5WmEM/1jwF5PsKmQ9THCBypfO0r?=
 =?iso-8859-1?Q?mShuRVwN6SkVRFSjaV2t+OrMX8OaqawUDngeSzM240Lh9rzooQjN74AHTG?=
 =?iso-8859-1?Q?ELi4XA8d3uBLSpyppEdgDwauKTfHFBDAH9jZPTX4cARFpqZNbT4pPfCg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6044af3e-048d-4046-39ce-08dc7b547cab
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 18:16:38.0448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BF3/cOH7151dO5wAbn9BGM9ov7RaALMvbvSgGE8upC9LoNAN9FUslGCJH7CjzFZ+ekudJugjb4IwaC2BsoMuYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5773
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

On Thu, May 23, 2024 at 05:29:09PM +0200, Thomas Hellström wrote:
> Pre-allocate but don't initialize fences at xe_sched_job_create(),
> and initialize / arm them instead at xe_sched_job_arm(). This
> makes it possible to move xe_sched_job_create() with its memory
> allocation out of any lock that is required for fence
> initialization, and that may not allow memory allocation under it.
> 
> Replaces the struct dma_fence_array for parallell jobs with a
> struct dma_fence_chain, since the former doesn't allow
> a split-up between allocation and initialization.
> 
> v2:
> - Rebase.
> - Don't always use the first lrc when initializing parallel
>   lrc fences.
> - Use dma_fence_chain_contained() to access the lrc fences.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       |   5 -
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  10 --
>  drivers/gpu/drm/xe/xe_ring_ops.c         |  12 +-
>  drivers/gpu/drm/xe/xe_sched_job.c        | 159 +++++++++++++----------
>  drivers/gpu/drm/xe/xe_sched_job_types.h  |  18 ++-
>  drivers/gpu/drm/xe/xe_trace.h            |   2 +-
>  6 files changed, 113 insertions(+), 93 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index e4607f0e3456..a5969271a964 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -96,11 +96,6 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  		}
>  	}
>  
> -	if (xe_exec_queue_is_parallel(q)) {
> -		q->parallel.composite_fence_ctx = dma_fence_context_alloc(1);
> -		q->parallel.composite_fence_seqno = 0;
> -	}
> -
>  	return q;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index ee78d497d838..f0c40e8ad80a 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -103,16 +103,6 @@ struct xe_exec_queue {
>  		struct xe_guc_exec_queue *guc;
>  	};
>  
> -	/**
> -	 * @parallel: parallel submission state
> -	 */
> -	struct {
> -		/** @parallel.composite_fence_ctx: context composite fence */
> -		u64 composite_fence_ctx;
> -		/** @parallel.composite_fence_seqno: seqno for composite fence */
> -		u32 composite_fence_seqno;
> -	} parallel;
> -
>  	/** @sched_props: scheduling properties */
>  	struct {
>  		/** @sched_props.timeslice_us: timeslice period in micro-seconds */
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 2705d1f9d572..f75756e7a87b 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -366,7 +366,7 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
>  
>  	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE; /* Enabled again below */
>  
> -	i = emit_bb_start(job->batch_addr[0], BIT(8), dw, i);
> +	i = emit_bb_start(job->ptrs[0].batch_addr, BIT(8), dw, i);
>  
>  	if (!IS_SRIOV_VF(gt_to_xe(job->q->gt))) {
>  		/* XXX: Do we need this? Leaving for now. */
> @@ -375,7 +375,7 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
>  		dw[i++] = preparser_disable(false);
>  	}
>  
> -	i = emit_bb_start(job->batch_addr[1], BIT(8), dw, i);
> +	i = emit_bb_start(job->ptrs[1].batch_addr, BIT(8), dw, i);
>  
>  	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | job->migrate_flush_flags |
>  		MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW;
> @@ -397,7 +397,7 @@ static void emit_job_gen12_gsc(struct xe_sched_job *job)
>  	xe_gt_assert(gt, job->q->width <= 1); /* no parallel submission for GSCCS */
>  
>  	__emit_job_gen12_simple(job, job->q->lrc,
> -				job->batch_addr[0],
> +				job->ptrs[0].batch_addr,
>  				xe_sched_job_lrc_seqno(job));
>  }
>  
> @@ -413,7 +413,7 @@ static void emit_job_gen12_copy(struct xe_sched_job *job)
>  
>  	for (i = 0; i < job->q->width; ++i)
>  		__emit_job_gen12_simple(job, job->q->lrc + i,
> -					job->batch_addr[i],
> +					job->ptrs[i].batch_addr,
>  					xe_sched_job_lrc_seqno(job));
>  }
>  
> @@ -424,7 +424,7 @@ static void emit_job_gen12_video(struct xe_sched_job *job)
>  	/* FIXME: Not doing parallel handshake for now */
>  	for (i = 0; i < job->q->width; ++i)
>  		__emit_job_gen12_video(job, job->q->lrc + i,
> -				       job->batch_addr[i],
> +				       job->ptrs[i].batch_addr,
>  				       xe_sched_job_lrc_seqno(job));
>  }
>  
> @@ -434,7 +434,7 @@ static void emit_job_gen12_render_compute(struct xe_sched_job *job)
>  
>  	for (i = 0; i < job->q->width; ++i)
>  		__emit_job_gen12_render_compute(job, job->q->lrc + i,
> -						job->batch_addr[i],
> +						job->ptrs[i].batch_addr,
>  						xe_sched_job_lrc_seqno(job));
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index 8dd612b8b2b0..95c6c0411592 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -6,7 +6,7 @@
>  #include "xe_sched_job.h"
>  
>  #include <drm/xe_drm.h>
> -#include <linux/dma-fence-array.h>
> +#include <linux/dma-fence-chain.h>
>  #include <linux/slab.h>
>  
>  #include "xe_device.h"
> @@ -29,7 +29,7 @@ int __init xe_sched_job_module_init(void)
>  	xe_sched_job_slab =
>  		kmem_cache_create("xe_sched_job",
>  				  sizeof(struct xe_sched_job) +
> -				  sizeof(u64), 0,
> +				  sizeof(struct xe_job_ptrs), 0,
>  				  SLAB_HWCACHE_ALIGN, NULL);
>  	if (!xe_sched_job_slab)
>  		return -ENOMEM;
> @@ -37,7 +37,7 @@ int __init xe_sched_job_module_init(void)
>  	xe_sched_job_parallel_slab =
>  		kmem_cache_create("xe_sched_job_parallel",
>  				  sizeof(struct xe_sched_job) +
> -				  sizeof(u64) *
> +				  sizeof(struct xe_job_ptrs) *
>  				  XE_HW_ENGINE_MAX_INSTANCE, 0,
>  				  SLAB_HWCACHE_ALIGN, NULL);
>  	if (!xe_sched_job_parallel_slab) {
> @@ -79,26 +79,33 @@ static struct xe_device *job_to_xe(struct xe_sched_job *job)
>  	return gt_to_xe(job->q->gt);
>  }
>  
> +/* Free unused pre-allocated fences */
> +static void xe_sched_job_free_fences(struct xe_sched_job *job)
> +{
> +	int i;
> +
> +	for (i = 0; i < job->q->width; ++i) {
> +		struct xe_job_ptrs *ptrs = &job->ptrs[i];
> +
> +		if (ptrs->lrc_fence)
> +			xe_lrc_free_seqno_fence(ptrs->lrc_fence);
> +		if (ptrs->chain_fence)
> +			dma_fence_chain_free(ptrs->chain_fence);
> +	}
> +}
> +
>  struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>  					 u64 *batch_addr)
>  {
> -	struct xe_sched_job *job;
> -	struct dma_fence **fences;
>  	bool is_migration = xe_sched_job_is_migration(q);
> +	struct xe_sched_job *job;
>  	int err;
> -	int i, j;
> +	int i;
>  	u32 width;
>  
>  	/* only a kernel context can submit a vm-less job */
>  	XE_WARN_ON(!q->vm && !(q->flags & EXEC_QUEUE_FLAG_KERNEL));
>  
> -	/* Migration and kernel engines have their own locking */
> -	if (!(q->flags & (EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_VM))) {
> -		lockdep_assert_held(&q->vm->lock);
> -		if (!xe_vm_in_lr_mode(q->vm))
> -			xe_vm_assert_held(q->vm);
> -	}
> -
>  	job = job_alloc(xe_exec_queue_is_parallel(q) || is_migration);
>  	if (!job)
>  		return ERR_PTR(-ENOMEM);
> @@ -111,43 +118,25 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>  	if (err)
>  		goto err_free;
>  
> -	if (!xe_exec_queue_is_parallel(q)) {
> -		job->fence = xe_lrc_create_seqno_fence(q->lrc);
> -		if (IS_ERR(job->fence)) {
> -			err = PTR_ERR(job->fence);
> -			goto err_sched_job;
> -		}
> -		job->lrc_seqno = job->fence->seqno;
> -	} else {
> -		struct dma_fence_array *cf;
> +	for (i = 0; i < q->width; ++i) {
> +		struct dma_fence *fence = xe_lrc_alloc_seqno_fence();
> +		struct dma_fence_chain *chain;
>  
> -		fences = kmalloc_array(q->width, sizeof(*fences), GFP_KERNEL);
> -		if (!fences) {
> -			err = -ENOMEM;
> +		if (IS_ERR(fence)) {
> +			err = PTR_ERR(fence);
>  			goto err_sched_job;
>  		}
> +		job->ptrs[i].lrc_fence = fence;
>  
> -		for (j = 0; j < q->width; ++j) {
> -			fences[j] = xe_lrc_create_seqno_fence(q->lrc + j);
> -			if (IS_ERR(fences[j])) {
> -				err = PTR_ERR(fences[j]);
> -				goto err_fences;
> -			}
> -			if (!j)
> -				job->lrc_seqno = fences[0]->seqno;
> -		}
> +		if (i + 1 == q->width)
> +			continue;
>  
> -		cf = dma_fence_array_create(q->width, fences,
> -					    q->parallel.composite_fence_ctx,
> -					    q->parallel.composite_fence_seqno++,
> -					    false);
> -		if (!cf) {
> -			--q->parallel.composite_fence_seqno;
> +		chain = dma_fence_chain_alloc();
> +		if (!chain) {
>  			err = -ENOMEM;
> -			goto err_fences;
> +			goto err_sched_job;
>  		}
> -
> -		job->fence = &cf->base;
> +		job->ptrs[i].chain_fence = chain;
>  	}
>  
>  	width = q->width;
> @@ -155,7 +144,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>  		width = 2;
>  
>  	for (i = 0; i < width; ++i)
> -		job->batch_addr[i] = batch_addr[i];
> +		job->ptrs[i].batch_addr = batch_addr[i];
>  
>  	/* All other jobs require a VM to be open which has a ref */
>  	if (unlikely(q->flags & EXEC_QUEUE_FLAG_KERNEL))
> @@ -165,13 +154,8 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>  	trace_xe_sched_job_create(job);
>  	return job;
>  
> -err_fences:
> -	for (j = j - 1; j >= 0; --j) {
> -		--q->lrc[j].fence_ctx.next_seqno;
> -		dma_fence_put(fences[j]);
> -	}
> -	kfree(fences);
>  err_sched_job:
> +	xe_sched_job_free_fences(job);
>  	drm_sched_job_cleanup(&job->drm);
>  err_free:
>  	xe_exec_queue_put(q);
> @@ -193,33 +177,39 @@ void xe_sched_job_destroy(struct kref *ref)
>  
>  	if (unlikely(job->q->flags & EXEC_QUEUE_FLAG_KERNEL))
>  		xe_pm_runtime_put(job_to_xe(job));
> +	xe_sched_job_free_fences(job);
>  	xe_exec_queue_put(job->q);
>  	dma_fence_put(job->fence);
>  	drm_sched_job_cleanup(&job->drm);
>  	job_free(job);
>  }
>  
> -void xe_sched_job_set_error(struct xe_sched_job *job, int error)
> +/* Set the error status under the fence to avoid racing with signaling */
> +static bool xe_fence_set_error(struct dma_fence *fence, int error)
>  {
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags))
> -		return;
> +	unsigned long irq_flags;
> +	bool signaled;
>  
> -	dma_fence_set_error(job->fence, error);
> +	spin_lock_irqsave(fence->lock, irq_flags);
> +	signaled = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
> +	if (!signaled)
> +		dma_fence_set_error(fence, error);
> +	spin_unlock_irqrestore(fence->lock, irq_flags);
> +
> +	return signaled;
> +}
>  
> -	if (dma_fence_is_array(job->fence)) {
> -		struct dma_fence_array *array =
> -			to_dma_fence_array(job->fence);
> -		struct dma_fence **child = array->fences;
> -		unsigned int nchild = array->num_fences;
> +void xe_sched_job_set_error(struct xe_sched_job *job, int error)
> +{
> +	if (xe_fence_set_error(job->fence, error))
> +		return;
>  
> -		do {
> -			struct dma_fence *current_fence = *child++;
> +	if (dma_fence_is_chain(job->fence)) {
> +		struct dma_fence *iter;
>  
> -			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> -				     &current_fence->flags))
> -				continue;
> -			dma_fence_set_error(current_fence, error);
> -		} while (--nchild);
> +		dma_fence_chain_for_each(iter, job->fence)
> +			xe_fence_set_error(dma_fence_chain_contained(iter),
> +					   error);
>  	}
>  
>  	trace_xe_sched_job_set_error(job);
> @@ -234,7 +224,7 @@ bool xe_sched_job_started(struct xe_sched_job *job)
>  
>  	return !__dma_fence_is_later(xe_sched_job_lrc_seqno(job),
>  				     xe_lrc_start_seqno(lrc),
> -				     dma_fence_array_first(job->fence)->ops);
> +				     dma_fence_chain_contained(job->fence)->ops);
>  }
>  
>  bool xe_sched_job_completed(struct xe_sched_job *job)
> @@ -248,13 +238,24 @@ bool xe_sched_job_completed(struct xe_sched_job *job)
>  
>  	return !__dma_fence_is_later(xe_sched_job_lrc_seqno(job),
>  				     xe_lrc_seqno(lrc),
> -				     dma_fence_array_first(job->fence)->ops);
> +				     dma_fence_chain_contained(job->fence)->ops);
>  }
>  
>  void xe_sched_job_arm(struct xe_sched_job *job)
>  {
>  	struct xe_exec_queue *q = job->q;
> +	struct dma_fence *fence, *prev;
>  	struct xe_vm *vm = q->vm;
> +	u64 seqno = 0;
> +	int i;
> +
> +	/* Migration and kernel engines have their own locking */
> +	if (IS_ENABLED(CONFIG_LOCKDEP) &&
> +	    !(q->flags & (EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_VM))) {
> +		lockdep_assert_held(&q->vm->lock);
> +		if (!xe_vm_in_lr_mode(q->vm))
> +			xe_vm_assert_held(q->vm);
> +	}
>  
>  	if (vm && !xe_sched_job_is_migration(q) && !xe_vm_in_lr_mode(vm) &&
>  	    (vm->batch_invalidate_tlb || vm->tlb_flush_seqno != q->tlb_flush_seqno)) {
> @@ -263,6 +264,25 @@ void xe_sched_job_arm(struct xe_sched_job *job)
>  		job->ring_ops_flush_tlb = true;
>  	}
>  
> +	/* Arm the pre-allocated fences */
> +	for (i = 0; i < q->width; prev = fence, ++i) {
> +		struct dma_fence_chain *chain;
> +
> +		fence = job->ptrs[i].lrc_fence;
> +		xe_lrc_init_seqno_fence(&q->lrc[i], fence);
> +		job->ptrs[i].lrc_fence = NULL;
> +		if (!i) {
> +			job->lrc_seqno = fence->seqno;
> +			continue;
> +		}

I removed the assert in my RFC for seqno being equal to the composite
fence but version of that I think still has value as the job->lrc_seqno
is used in ring ops for every LRC in the exec queue.

Something like:

		if (!i) {
			job->lrc_seqno = fence->seqno;
			continue;
		} else {
			xe_assert(xe, job->lrc_seqno == fence->seqno);
		}

With that addition:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> +
> +		chain = job->ptrs[i - 1].chain_fence;
> +		dma_fence_chain_init(chain, prev, fence, seqno++);
> +		job->ptrs[i - 1].chain_fence = NULL;
> +		fence = &chain->base;
> +	}
> +
> +	job->fence = fence;
>  	drm_sched_job_arm(&job->drm);
>  }
>  
> @@ -322,7 +342,8 @@ xe_sched_job_snapshot_capture(struct xe_sched_job *job)
>  
>  	snapshot->batch_addr_len = q->width;
>  	for (i = 0; i < q->width; i++)
> -		snapshot->batch_addr[i] = xe_device_uncanonicalize_addr(xe, job->batch_addr[i]);
> +		snapshot->batch_addr[i] =
> +			xe_device_uncanonicalize_addr(xe, job->ptrs[i].batch_addr);
>  
>  	return snapshot;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
> index 990ddac55ed6..0d3f76fb05ce 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> @@ -11,6 +11,20 @@
>  #include <drm/gpu_scheduler.h>
>  
>  struct xe_exec_queue;
> +struct dma_fence;
> +struct dma_fence_chain;
> +
> +/**
> + * struct xe_job_ptrs - Per hw engine instance data
> + */
> +struct xe_job_ptrs {
> +	/** @lrc_fence: Pre-allocated uinitialized lrc fence.*/
> +	struct dma_fence *lrc_fence;
> +	/** @chain_fence: Pre-allocated ninitialized fence chain node. */
> +	struct dma_fence_chain *chain_fence;
> +	/** @batch_addr: Batch buffer address. */
> +	u64 batch_addr;
> +};
>  
>  /**
>   * struct xe_sched_job - XE schedule job (batch buffer tracking)
> @@ -43,8 +57,8 @@ struct xe_sched_job {
>  	u32 migrate_flush_flags;
>  	/** @ring_ops_flush_tlb: The ring ops need to flush TLB before payload. */
>  	bool ring_ops_flush_tlb;
> -	/** @batch_addr: batch buffer address of job */
> -	u64 batch_addr[];
> +	/** @ptrs: per instance pointers. */
> +	struct xe_job_ptrs ptrs[];
>  };
>  
>  struct xe_sched_job_snapshot {
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index 6c6cecc58f63..450f407c66e8 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -272,7 +272,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
>  			   __entry->flags = job->q->flags;
>  			   __entry->error = job->fence->error;
>  			   __entry->fence = job->fence;
> -			   __entry->batch_addr = (u64)job->batch_addr[0];
> +			   __entry->batch_addr = (u64)job->ptrs[0].batch_addr;
>  			   ),
>  
>  		    TP_printk("fence=%p, seqno=%u, lrc_seqno=%u, guc_id=%d, batch_addr=0x%012llx, guc_state=0x%x, flags=0x%x, error=%d",
> -- 
> 2.44.0
> 
