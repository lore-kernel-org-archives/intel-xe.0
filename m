Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84222D1A427
	for <intel-xe@archiver.kernel.org>; Sat, 12 Oct 2024 01:51:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9D210E1C2;
	Sat, 12 Oct 2024 01:51:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M3ArOX5M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D0810E1C2
 for <intel-xe@lists.freedesktop.org>; Sat, 12 Oct 2024 01:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728697865; x=1760233865;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uTM1m5nUW/WVN3EvN3cX4Rn5R4jL3mHLNthT4CZNwd4=;
 b=M3ArOX5M/JtxYQEHADGZao32Lbfyohvt97LL6oMRm25TVPSV9oJxtvoP
 XjIf5Mj6evnkKHf0UWsNIw12mFYQ6CERTHiLpnamWKKrvL3YTsjGvx3Mw
 NEHBkPT1ky+nnB88bAG8Ylfd2O1WiE2w2dc5lM4XQE2scjBKsdj/iopgE
 N+f73PBDuoxYC+wlCKUhi3rqbt5BE9lAYng1QqoPPeF/V8qjMsx2PzbCE
 FWRLYRF/3ImBEI3b4Snx8RP2SnUsmQeDSSAMizLc3dhRzsbQoFGU857US
 a7LweElzCGNgEPaWEXZzfI8s3ZjMHbg0rK+Bpw2eSoJaeDss2LQ6Q/GgR g==;
X-CSE-ConnectionGUID: 6Whn3MnTSpCD/INKhJBOtQ==
X-CSE-MsgGUID: aGJNRmHtR2ahORCgBwHaWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28282345"
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; d="scan'208";a="28282345"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 18:51:05 -0700
X-CSE-ConnectionGUID: GhqVmwJBTt+1nU//Ywuqtg==
X-CSE-MsgGUID: AW7Fbij9RfG6MCvOiiFqhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; d="scan'208";a="114530192"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2024 18:51:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 18:51:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 11 Oct 2024 18:51:04 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 11 Oct 2024 18:51:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O3kz0+xvsC2Rwduc15NJl1q4IlNpRrxhj+MfiJ7k2KJ0dVh2+8jDrlDYbZklWEYSFq8Wex7DyMDYQ6meGnoZ/6P/Y3WLAG2F9gHbKlE3SvG8HfU/ArD8szXYZ9aiJpyrXUx4OHpRYNlszEKGIl3P5sAJ43vGk0EZ8P7WWbtRPwFPpUnqLSxFDF7j8PAG5XZmpv9jS9bcWJYfoX8YE9QhQz3aSBWfcaenW+XT6L61IZ8ibasy1xkc53j1DMeSeFNX+Nz/pAhMKe+kvhESOP2m4g7CQ+cWMtpx9pLFEHh7S+TYtF0u7Cj5pM6LTWnTvbBvERstgoZeJjdmVyScsyhd+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lory2MxK3HBReVTCTNKCTrGeN4DySn6U7ihrqArOcH4=;
 b=jiaTCJWxlMsDDQ/mmTS316LNjiv/Ulrw5+3W10H9U0qF5ICmG32R0tlSqr68hWvuDiXlWtJS+qcI0c+xEd3atb8E/Jb5EU+5x65sz3Y8PtBu7u9R8iXmdM8QZWbTICcuCG6sRg+v1UTudgWWnHeR3eFqZa7sMaiKIWp2QhMg9HYXr8l9PKx2hJr77LhCbiegHn3pajttVktfpkIyv4zKS9nenZXvJAmWYvBe8xKq1XsMd/0DgLPje0klqA/uGnYV2eGNHP9/AcaDV1G4LHj89Aipt1gRhMgocoFHgvs9Ws86jRw8PBhq4vUrtIf0xFQ3A9POlgZTROgWF+WyzazK4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB7164.namprd11.prod.outlook.com (2603:10b6:303:212::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20; Sat, 12 Oct
 2024 01:51:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8048.017; Sat, 12 Oct 2024
 01:51:01 +0000
Date: Sat, 12 Oct 2024 01:50:37 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/5] drm/xe/guc: Introduce the GuC Buffer Cache
Message-ID: <ZwnV7WFgRw85mdxZ@DUT025-TGLU.fm.intel.com>
References: <20241009172125.1539-1-michal.wajdeczko@intel.com>
 <20241009172125.1539-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241009172125.1539-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0117.namprd03.prod.outlook.com
 (2603:10b6:a03:333::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB7164:EE_
X-MS-Office365-Filtering-Correlation-Id: c9714ec4-c09b-4de8-6f29-08dcea6052fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?IPPDCziVeUTCHXqkVWqEL2DrDui1JQXjPuBjZWqQys+Me1WkClMWQHd88m?=
 =?iso-8859-1?Q?NYn7z5qlUFva52+sPl0A5FY4lf+5HvYkwYH8QrJNjspCamKTxG8La69o0h?=
 =?iso-8859-1?Q?6kfaJ5cyVZZR7deLBT5JGX1d7bojmS6sVzv9UBk0Xv92JKBNgAIooeQB7P?=
 =?iso-8859-1?Q?OfTutyzKezA7I6Dw+xAGT+Rx3OhxCWVJ3T6kqnQI+jTtlZi2FJDZSHEihT?=
 =?iso-8859-1?Q?lqfFwKiPQ1A6jec556VWOrer9SYmnU3HHo7QmkPEnwsKq2vRDkyfVwigNR?=
 =?iso-8859-1?Q?Lw6C49wI2V6cqNMhwyg+RErTAEQvAqekCN0htom1GYIu9YGsSMuMzwsRuG?=
 =?iso-8859-1?Q?iKRGnFKmduZTqtIjJ/tiCz645EAFD6x/EaSHLB8b4V7LICgXPnLvCeN+ro?=
 =?iso-8859-1?Q?+ZC940Fs8BJkTj7FV7h3tsU6sqKwYfyJLUvkTyu+7xfhJOLViGJDg8t59D?=
 =?iso-8859-1?Q?/cFcUBdAN7gQWhikTs8rx+4bsJA/MvxTvagmwyPDSTFr7nYxcwPSgq1oRU?=
 =?iso-8859-1?Q?2D4i1F47fpL226rol1m/EbNbv08S/gl7tQMHEBq3OSex5rfKBm3VPtF0AV?=
 =?iso-8859-1?Q?xD18YRk+HhKfP2QPgzwAHMs9R8K8GYGcmFHTVouB+ZhDbB2s8vDHOjmvRo?=
 =?iso-8859-1?Q?iG9QKU2dztKFuA4ncjZGEV7VfcedHOwho8AE7lbvVpiHve1oagmGlZLO6E?=
 =?iso-8859-1?Q?R6OEyIbDLtV07xt412pdQ9zjIuzb8k7DFB8+ds2IW9iHhPWyD0JnLYRXge?=
 =?iso-8859-1?Q?k/+8peusTlKQZ4H8P8RYknTYN4BKAbhJMYJ4HvL7PF3E5T1lRvhsrdtGK3?=
 =?iso-8859-1?Q?wQZbb8VxUxXSK01E6NrRkw63PtjfkAFpDmZXbj3L9sx7dpEMG6gZm1nksH?=
 =?iso-8859-1?Q?9YA7v0CXcj1bIfRYcM8kOwqGTaT7KWRfQ4hGKO2k3iIfY2bN5unzMm0sYp?=
 =?iso-8859-1?Q?ZDgvCt6Q96qBOb9l/VT9aPLCRFd907VB8cDfzT2Nzcgifv35ApkUJWOOhI?=
 =?iso-8859-1?Q?7ypzIS5Tc4PBjDvAbTgI+7NQjyEjVEEPPvb5Bedf8SxmaQsv7Awe1YDGme?=
 =?iso-8859-1?Q?NmXfKJE5NZ/W8MNPvRwvshKVUn5oU2q4P46EfZpvaDZrFjKFnBcI8iBz7Y?=
 =?iso-8859-1?Q?hNpPYOZvjKpVQYNKv2yCuEmpVzoYaLuHAzRhMink/MzMDhVg07tfVOX9Bh?=
 =?iso-8859-1?Q?adOnhoR0MN9zlGItm42TdyfkXIj5AD1BWXBJeu1c+kdWd8UyxBzaDQ1xE6?=
 =?iso-8859-1?Q?S/G4MyMWkjQNok/HY/CCgzJirUqCBpN1On8upbQEsqFlfepgjE7CLVtGYo?=
 =?iso-8859-1?Q?pDQQS/cYojDI3HlKMq7tUmlC4w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?m0s0T4hsSOeyu20bzoqAKIi9kNF1JKhQS6qwBOewzvPWrRi8n7kjQZP0/g?=
 =?iso-8859-1?Q?lUgPGSrz3lr+j1kPPwh9YRwmHvN4ZhiqPOuBUvM/vEI4SnWdbsy7b+YHel?=
 =?iso-8859-1?Q?+/zYRIa/bkcaLylwcFvYEVD4Zkq8DCBgbiFcvnoex8G/DU5YAfudY8YZz7?=
 =?iso-8859-1?Q?vOPikwnK+78Js6JxqsQfHBSoAl8p58hleg2jfGwILs7AdcNDJeOrAX2mQz?=
 =?iso-8859-1?Q?IzpqfjrI+59sRGtj+CYy2gkM9scF95/nSjELOaxOQuYy3VFxaLhEDdymJO?=
 =?iso-8859-1?Q?L+ICdYeuJW0d1u6CWIlDfuDCgccIPEuIAg0JaKN+3i68QmNTk3BWgPiC2a?=
 =?iso-8859-1?Q?P6skyXGd7zA3IP+mOdFI13sUjl0n6wJMKjmv/th/9WYUefZyZV00wwgm1e?=
 =?iso-8859-1?Q?+HawFgBltgm1ckzyp63LN8+o/5+xMAY+QWP2HgQN8GLUdxfskkjDwNGAnO?=
 =?iso-8859-1?Q?AEL5oozOpNV4suSS1ZWja6WwTfGM0bRb8H4373iWnQEa8dANg/Fd73lVVJ?=
 =?iso-8859-1?Q?xVI+H4GZPvKg2rFEO6jYYpdRb7mTLerIyEur43NL2fcMJ7mtjR5Z1rbIa7?=
 =?iso-8859-1?Q?7b5T6WPVZje1w4tWj2kzHpYXLF7h7M7NN7Gc8Z7j1yDB1M2y22FXhk2t1V?=
 =?iso-8859-1?Q?tlTfgZk+4RzVsvRIaQ7VA6CKuhFaDyT8Lei75TGja9sLnojCns6uXiYKru?=
 =?iso-8859-1?Q?ltLzVQEVaoAQxgno5fg92YOrwq6/nKVRDdAhVVmxMCZoUS/Jh5H71RuMBz?=
 =?iso-8859-1?Q?O7gHeHGAPBxpO2/0dRsXXixQPwAUl81yY2kcs74paT1sFzt5IEdEXZu/zr?=
 =?iso-8859-1?Q?RAertHYiQtakVKRMxps4Nb8whuAElJWb+b0YzhrmFiboXbrDl5pJa54QuL?=
 =?iso-8859-1?Q?IskJwN2m2ey7fEng8OswQ1fTMx1W9s/dejR0BTWkDqCM+PXnDPVwHBpmEF?=
 =?iso-8859-1?Q?6CfjeV18LWTOUlpRDaeQBF9nwO8ru3jWjRimdb03kAD/KqyQEbASuhmrU8?=
 =?iso-8859-1?Q?NHmo+8njJzlKjCy2mRoLtiVTgzWoOo/JcjMRxrm4dbi4Jn6EJLi8U16zB1?=
 =?iso-8859-1?Q?wmTQVLxVX9OHsOMfIMAs4po/7Cbeh1w63c7ZzsUpxicyukyONj7p/LbLZ2?=
 =?iso-8859-1?Q?tpRcLAJ+U+DAMlv4Fa0d8xcobs+7Ea5K0kRNoR2WiAqL2jhL1HEeBEjnwF?=
 =?iso-8859-1?Q?crVfFVaUTQWfRJ1noOWnxzDOzLy3MUrVge5C26nb+4lJjo59qLB6xTidJV?=
 =?iso-8859-1?Q?BSg7n9x9gIpEieEk6DrCG5MLG83TxLjcDn/2b2Eb1LoFQa3YvXEhbFLA8C?=
 =?iso-8859-1?Q?d3ZIdIs/j8+zB0Oz9kD1lbT/ZdRzpTjBbqgUjyXfKsSjAZWQpuR2/O93TP?=
 =?iso-8859-1?Q?/uq2dzlEyaH9ubq+1KYUhxka6evRQoy5ZjJqre89C2yU1qkSCrjeVQIOFS?=
 =?iso-8859-1?Q?hFUdUzBiHSImOmEyymowhTprWYJnUZJgJXcTD6oqPww2FFuJulbPBbXvpX?=
 =?iso-8859-1?Q?6/k9iVCsimsT/47Qynh9fEz/i9J/J7GvjsnHQoKyIFZi8+4BusAo//BtDw?=
 =?iso-8859-1?Q?x6OWvHIbrXJHRIEUU+GNfAdt/CmVZQl3MRELA1KOb/yLMeRSkAxxoyY+Vo?=
 =?iso-8859-1?Q?lKEP9ULqhaxyFWBbZGxVrH1+OXb/eiMlZ5IScWYWWxeTctuW+FZrh1hA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9714ec4-c09b-4de8-6f29-08dcea6052fb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 01:51:01.0903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nCDHX3lKrupNBx1JmENWiZ6In9MihUTgP02dpAj0C/Xw2QkveAwQn8abY4c2h/xdtwR3a3qMMgQroQd5ITlW6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7164
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

On Wed, Oct 09, 2024 at 07:21:21PM +0200, Michal Wajdeczko wrote:
> The purpose of the GuC Buffer Cache is to prepare a cached buffer
> that could be used by some of the CTB based communication actions
> which require an indirect data to be passed in a separate location
> than CT message buffer.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Quick reaction without to much thought, this looks like reinventing
suballocation which we already have in the DRM layer / Xe.

See - xe_sa.c, drm_suballoc.c

So I'd say build this layer on top one of those or ditch this layer
entirely and directly use xe_sa.c. I'm pretty sure you could allocate
from the existing pool of tile->mem.kernel_bb_pool as the locking in
that layers make that safe. Maybe rename 'tile->mem.kernel_bb_pool' to
something more generic if that works.

Matt

> ---
>  drivers/gpu/drm/xe/Makefile           |   1 +
>  drivers/gpu/drm/xe/xe_guc_buf.c       | 387 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_buf.h       |  48 ++++
>  drivers/gpu/drm/xe/xe_guc_buf_types.h |  40 +++
>  4 files changed, 476 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_buf.c
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_buf.h
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_buf_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index da80c29aa363..0aed652dc806 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -56,6 +56,7 @@ xe-y += xe_bb.o \
>  	xe_gt_topology.o \
>  	xe_guc.o \
>  	xe_guc_ads.o \
> +	xe_guc_buf.o \
>  	xe_guc_capture.o \
>  	xe_guc_ct.o \
>  	xe_guc_db_mgr.o \
> diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
> new file mode 100644
> index 000000000000..a49be711ea86
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_buf.c
> @@ -0,0 +1,387 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <linux/bitmap.h>
> +#include <linux/cleanup.h>
> +#include <linux/mutex.h>
> +
> +#include <drm/drm_managed.h>
> +
> +#include "xe_assert.h"
> +#include "xe_bo.h"
> +#include "xe_gt_printk.h"
> +#include "xe_guc.h"
> +#include "xe_guc_buf.h"
> +
> +/**
> + * DOC: GuC Buffer Cache
> + *
> + * The purpose of the `GuC Buffer Cache`_ is to prepare a cached buffer for use
> + * by the GuC `CTB based communication` actions that require an indirect data to
> + * be passed in a separate GPU memory location, that needs to be available only
> + * during processing of that GuC action.
> + *
> + * The xe_guc_buf_cache_init() will allocate and initialize the cache object.
> + * The object is drm managed and will be allocated with GFP_KERNEL flag.
> + * The size of the underlying GPU memory buffer will be aligned to SZ_4K.
> + * The cache will then support up to BITS_PER_LONG a sub-allocations from that
> + * data buffer. Each sub-allocation will be at least aligned to SZ_64.
> + *
> + * ::
> + *
> + *       <------> chunk (n * 64)
> + *       <------------- CPU mirror (n * 4K) -------------------------------->
> + *      +--------+--------+--------+--------+-----------------------+--------+
> + *      |   0    |   1    |   2    |   3    |                       |   m    |
> + *      +--------+--------+--------+--------+-----------------------+--------+
> + *                                                 ||       /\
> + *                                                flush     ||
> + *                                                 ||      sync
> + *                                                 \/       ||
> + *      +--------+--------+--------+--------+-----------------------+--------+
> + *      |   0    |   1    |   2    |   3    |                       |   m    |
> + *      +--------+--------+--------+--------+-----------------------+--------+
> + *       <--------- GPU allocation (n * 4K) -------------------------------->
> + *       <------> chunk (n * 64)
> + *
> + * The xe_guc_buf_reserve() will return a reference to a new sub-allocation.
> + * The xe_guc_buf_release() shall be used to release a such sub-allocation.
> + *
> + * The xe_guc_buf_cpu_ptr() will provide access to the sub-allocation.
> + * The xe_guc_buf_flush() shall be used to flush data from any mirror buffer to
> + * the underlying GPU memory.
> + *
> + * The xe_guc_buf_gpu_addr() will provide a GPU address of the sub-allocation.
> + * The xe_guc_buf_sync() might be used to copy the content of the sub-allocation
> + * from the GPU memory to the local mirror buffer.
> + */
> +
> +static struct xe_guc *cache_to_guc(struct xe_guc_buf_cache *cache)
> +{
> +	return cache->guc;
> +}
> +
> +static struct xe_gt *cache_to_gt(struct xe_guc_buf_cache *cache)
> +{
> +	return guc_to_gt(cache_to_guc(cache));
> +}
> +
> +static struct xe_device *cache_to_xe(struct xe_guc_buf_cache *cache)
> +{
> +	return gt_to_xe(cache_to_gt(cache));
> +}
> +
> +static struct mutex *cache_mutex(struct xe_guc_buf_cache *cache)
> +{
> +	return &cache_to_guc(cache)->ct.lock;
> +}
> +
> +static void __fini_cache(void *arg)
> +{
> +	struct xe_guc_buf_cache *cache = arg;
> +	struct xe_gt *gt = cache_to_gt(cache);
> +
> +	if (cache->used)
> +		xe_gt_dbg(gt, "buffer cache unclean: %#lx = %u * %u bytes\n",
> +			  cache->used, bitmap_weight(&cache->used, BITS_PER_LONG), cache->chunk);
> +
> +	kvfree(cache->mirror);
> +	cache->mirror = NULL;
> +	cache->bo = NULL;
> +	cache->used = 0;
> +}
> +
> +/**
> + * xe_guc_buf_cache_init() - Allocate and initialize a GuC Buffer Cache.
> + * @guc: the &xe_guc where this cache will be used
> + * @size: minimum size of the cache
> + *
> + * See `GuC Buffer Cache`_ for details.
> + *
> + * Return: pointer to the &xe_guc_buf_cache on success or a ERR_PTR() on failure.
> + */
> +struct xe_guc_buf_cache *xe_guc_buf_cache_init(struct xe_guc *guc, u32 size)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_guc_buf_cache *cache;
> +	u32 chunk_size;
> +	u32 cache_size;
> +	int ret;
> +
> +	cache_size = ALIGN(size, SZ_4K);
> +	chunk_size = cache_size / BITS_PER_LONG;
> +
> +	xe_gt_assert(gt, size);
> +	xe_gt_assert(gt, IS_ALIGNED(chunk_size, SZ_64));
> +
> +	cache = drmm_kzalloc(&xe->drm, sizeof(*cache), GFP_KERNEL);
> +	if (!cache)
> +		return ERR_PTR(-ENOMEM);
> +
> +	cache->bo = xe_managed_bo_create_pin_map(xe, tile, cache_size,
> +						 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +						 XE_BO_FLAG_GGTT |
> +						 XE_BO_FLAG_GGTT_INVALIDATE);
> +	if (IS_ERR(cache->bo))
> +		return ERR_CAST(cache->bo);
> +
> +	cache->guc = guc;
> +	cache->chunk = chunk_size;
> +	cache->mirror = kvzalloc(cache_size, GFP_KERNEL);
> +	if (!cache->mirror)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret = devm_add_action_or_reset(xe->drm.dev, __fini_cache, cache);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	xe_gt_dbg(gt, "buffer cache at %#x (%uKiB = %u x %zu dwords) for %ps\n",
> +		  xe_bo_ggtt_addr(cache->bo), cache_size / SZ_1K,
> +		  BITS_PER_LONG, chunk_size / sizeof(u32), __builtin_return_address(0));
> +	return cache;
> +}
> +
> +static bool cache_is_ref_active(struct xe_guc_buf_cache *cache, unsigned long ref)
> +{
> +	lockdep_assert_held(cache_mutex(cache));
> +	return bitmap_subset(&ref, &cache->used, BITS_PER_LONG);
> +}
> +
> +static bool ref_is_valid(unsigned long ref)
> +{
> +	return ref && find_next_bit(&ref, BITS_PER_LONG,
> +				    find_first_bit(&ref, BITS_PER_LONG) +
> +				    bitmap_weight(&ref, BITS_PER_LONG)) == BITS_PER_LONG;
> +}
> +
> +static void cache_assert_ref(struct xe_guc_buf_cache *cache, unsigned long ref)
> +{
> +	xe_gt_assert_msg(cache_to_gt(cache), ref_is_valid(ref),
> +			 "# malformed ref %#lx %*pbl", ref, (int)BITS_PER_LONG, &ref);
> +	xe_gt_assert_msg(cache_to_gt(cache), cache_is_ref_active(cache, ref),
> +			 "# stale ref %#lx %*pbl vs used %#lx %*pbl",
> +			 ref, (int)BITS_PER_LONG, &ref,
> +			 cache->used, (int)BITS_PER_LONG, &cache->used);
> +}
> +
> +static unsigned long cache_reserve(struct xe_guc_buf_cache *cache, u32 size)
> +{
> +	unsigned long index;
> +	unsigned int nbits;
> +
> +	lockdep_assert_held(cache_mutex(cache));
> +	xe_gt_assert(cache_to_gt(cache), size);
> +	xe_gt_assert(cache_to_gt(cache), size <= BITS_PER_LONG * cache->chunk);
> +
> +	nbits = DIV_ROUND_UP(size, cache->chunk);
> +	index = bitmap_find_next_zero_area(&cache->used, BITS_PER_LONG, 0, nbits, 0);
> +	if (index >= BITS_PER_LONG) {
> +		xe_gt_dbg(cache_to_gt(cache), "no space for %u byte%s in cache at %#x used %*pbl\n",
> +			  size, str_plural(size), xe_bo_ggtt_addr(cache->bo),
> +			  (int)BITS_PER_LONG, &cache->used);
> +		return 0;
> +	}
> +
> +	bitmap_set(&cache->used, index, nbits);
> +
> +	return GENMASK(index + nbits - 1, index);
> +}
> +
> +static u64 cache_ref_offset(struct xe_guc_buf_cache *cache, unsigned long ref)
> +{
> +	cache_assert_ref(cache, ref);
> +	return __ffs(ref) * cache->chunk;
> +}
> +
> +static u32 cache_ref_size(struct xe_guc_buf_cache *cache, unsigned long ref)
> +{
> +	cache_assert_ref(cache, ref);
> +	return hweight_long(ref) * cache->chunk;
> +}
> +
> +static u64 cache_ref_gpu_addr(struct xe_guc_buf_cache *cache, unsigned long ref)
> +{
> +	return xe_bo_ggtt_addr(cache->bo) + cache_ref_offset(cache, ref);
> +}
> +
> +static void *cache_ref_cpu_ptr(struct xe_guc_buf_cache *cache, unsigned long ref)
> +{
> +	return cache->mirror + cache_ref_offset(cache, ref);
> +}
> +
> +/**
> + * xe_guc_buf_reserve() - Reserve a new sub-allocation.
> + * @cache: the &xe_guc_buf_cache where reserve sub-allocation
> + * @size: the requested size of the buffer
> + *
> + * Use xe_guc_buf_is_valid() to check if returned buffer reference is valid.
> + * Must use xe_guc_buf_release() to release a sub-allocation.
> + *
> + * Return: a &xe_guc_buf of new sub-allocation.
> + */
> +struct xe_guc_buf xe_guc_buf_reserve(struct xe_guc_buf_cache *cache, u32 size)
> +{
> +	guard(mutex)(cache_mutex(cache));
> +	unsigned long ref;
> +
> +	ref = cache_reserve(cache, size);
> +
> +	return (struct xe_guc_buf){ .cache = cache, .ref = ref };
> +}
> +
> +/**
> + * xe_guc_buf_from_data() - Reserve a new sub-allocation using data.
> + * @cache: the &xe_guc_buf_cache where reserve sub-allocation
> + * @data: the data to flush the sub-allocation
> + * @size: the size of the data
> + *
> + * Similar to xe_guc_buf_reserve() but flushes @data to the GPU memory.
> + *
> + * Return: a &xe_guc_buf of new sub-allocation.
> + */
> +struct xe_guc_buf xe_guc_buf_from_data(struct xe_guc_buf_cache *cache,
> +				       const void *data, size_t size)
> +{
> +	guard(mutex)(cache_mutex(cache));
> +	unsigned long ref;
> +
> +	ref = cache_reserve(cache, size);
> +	if (ref) {
> +		u32 offset = cache_ref_offset(cache, ref);
> +
> +		xe_map_memcpy_to(cache_to_xe(cache), &cache->bo->vmap,
> +				 offset, data, size);
> +	}
> +
> +	return (struct xe_guc_buf){ .cache = cache, .ref = ref };
> +}
> +
> +static void cache_release_ref(struct xe_guc_buf_cache *cache, unsigned long ref)
> +{
> +	cache_assert_ref(cache, ref);
> +	cache->used &= ~ref;
> +}
> +
> +/**
> + * xe_guc_buf_release() - Release a sub-allocation.
> + * @buf: the &xe_guc_buf to release
> + *
> + * Releases a sub-allocation reserved by xe_guc_buf_reserve().
> + */
> +void xe_guc_buf_release(const struct xe_guc_buf buf)
> +{
> +	guard(mutex)(cache_mutex(buf.cache));
> +
> +	if (!buf.ref)
> +		return;
> +
> +	cache_release_ref(buf.cache, buf.ref);
> +}
> +
> +static u64 cache_flush_ref(struct xe_guc_buf_cache *cache, unsigned long ref)
> +{
> +	u32 offset = cache_ref_offset(cache, ref);
> +	u32 size = cache_ref_size(cache, ref);
> +
> +	xe_map_memcpy_to(cache_to_xe(cache), &cache->bo->vmap,
> +			 offset, cache->mirror + offset, size);
> +
> +	return cache_ref_gpu_addr(cache, ref);
> +}
> +
> +/**
> + * xe_guc_buf_flush() - Copy the data from the sub-allocation to the GPU memory.
> + * @buf: the &xe_guc_buf to flush
> + *
> + * Return: a GPU address of the sub-allocation.
> + */
> +u64 xe_guc_buf_flush(const struct xe_guc_buf buf)
> +{
> +	guard(mutex)(cache_mutex(buf.cache));
> +
> +	return cache_flush_ref(buf.cache, buf.ref);
> +}
> +
> +static void *cache_sync_ref(struct xe_guc_buf_cache *cache, unsigned long ref)
> +{
> +	u32 offset = cache_ref_offset(cache, ref);
> +	u32 size = cache_ref_size(cache, ref);
> +
> +	xe_map_memcpy_from(cache_to_xe(cache), cache->mirror + offset,
> +			   &cache->bo->vmap, offset, size);
> +
> +	return cache_ref_cpu_ptr(cache, ref);
> +}
> +
> +/**
> + * xe_guc_buf_sync() - Copy the data from the GPU memory to the sub-allocation.
> + * @buf: the &xe_guc_buf to sync
> + *
> + * Return: the CPU pointer to the sub-allocation.
> + */
> +void *xe_guc_buf_sync(const struct xe_guc_buf buf)
> +{
> +	guard(mutex)(cache_mutex(buf.cache));
> +
> +	return cache_sync_ref(buf.cache, buf.ref);
> +}
> +
> +/**
> + * xe_guc_buf_cpu_ptr() - Obtain a CPU pointer to the sub-allocation.
> + * @buf: the &xe_guc_buf to query
> + *
> + * Return: the CPU pointer of the sub-allocation.
> + */
> +void *xe_guc_buf_cpu_ptr(const struct xe_guc_buf buf)
> +{
> +	guard(mutex)(cache_mutex(buf.cache));
> +
> +	return cache_ref_cpu_ptr(buf.cache, buf.ref);
> +}
> +
> +/**
> + * xe_guc_buf_gpu_addr() - Obtain a GPU address of the sub-allocation.
> + * @buf: the &xe_guc_buf to query
> + *
> + * Return: the GPU address of the sub-allocation.
> + */
> +u64 xe_guc_buf_gpu_addr(const struct xe_guc_buf buf)
> +{
> +	guard(mutex)(cache_mutex(buf.cache));
> +
> +	return cache_ref_gpu_addr(buf.cache, buf.ref);
> +}
> +
> +/**
> + * xe_guc_cache_gpu_addr_from_ptr() - Lookup a GPU address using the pointer.
> + * @cache: the &xe_guc_buf_cache with sub-allocations
> + * @ptr: the CPU pointer to the data from a sub-allocation
> + * @size: the size of the data at @ptr
> + *
> + * Return: the GPU address on success or 0 on failure.
> + */
> +u64 xe_guc_cache_gpu_addr_from_ptr(struct xe_guc_buf_cache *cache, const void *ptr, u32 size)
> +{
> +	guard(mutex)(cache_mutex(cache));
> +	ptrdiff_t offset = ptr - cache->mirror;
> +	unsigned long ref;
> +	int first, last;
> +
> +	if (offset < 0)
> +		return 0;
> +
> +	first = div_u64(offset, cache->chunk);
> +	last = DIV_ROUND_UP(offset + max(1, size), cache->chunk) - 1;
> +
> +	if (last >= BITS_PER_LONG)
> +		return 0;
> +
> +	ref = GENMASK(last, first);
> +	cache_assert_ref(cache, ref);
> +
> +	return xe_bo_ggtt_addr(cache->bo) + offset;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_buf.h b/drivers/gpu/drm/xe/xe_guc_buf.h
> new file mode 100644
> index 000000000000..700e7b06c149
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_buf.h
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GUC_BUF_H_
> +#define _XE_GUC_BUF_H_
> +
> +#include <linux/cleanup.h>
> +
> +#include "xe_guc_buf_types.h"
> +
> +struct xe_guc_buf_cache *xe_guc_buf_cache_init(struct xe_guc *guc, u32 size);
> +
> +struct xe_guc_buf xe_guc_buf_reserve(struct xe_guc_buf_cache *cache, u32 size);
> +struct xe_guc_buf xe_guc_buf_from_data(struct xe_guc_buf_cache *cache,
> +				       const void *data, size_t size);
> +void xe_guc_buf_release(const struct xe_guc_buf buf);
> +
> +/**
> + * xe_guc_buf_is_valid() - Check if the GuC Buffer Cache sub-allocation is valid.
> + * @buf: the &xe_guc_buf reference to check
> + *
> + * Return: true if @buf represents a valid sub-allocation.
> + */
> +static inline bool xe_guc_buf_is_valid(const struct xe_guc_buf buf)
> +{
> +	return buf.ref;
> +}
> +
> +void *xe_guc_buf_sync(const struct xe_guc_buf buf);
> +void *xe_guc_buf_cpu_ptr(const struct xe_guc_buf buf);
> +u64 xe_guc_buf_flush(const struct xe_guc_buf buf);
> +u64 xe_guc_buf_gpu_addr(const struct xe_guc_buf buf);
> +
> +u64 xe_guc_cache_gpu_addr_from_ptr(struct xe_guc_buf_cache *cache, const void *ptr, u32 size);
> +
> +DEFINE_CLASS(xe_guc_buf, struct xe_guc_buf,
> +	     xe_guc_buf_release(_T),
> +	     xe_guc_buf_reserve(cache, size),
> +	     struct xe_guc_buf_cache *cache, u32 size);
> +
> +DEFINE_CLASS(xe_guc_buf_from_data, struct xe_guc_buf,
> +	     xe_guc_buf_release(_T),
> +	     xe_guc_buf_from_data(cache, data, size),
> +	     struct xe_guc_buf_cache *cache, const void *data, u32 size);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_buf_types.h b/drivers/gpu/drm/xe/xe_guc_buf_types.h
> new file mode 100644
> index 000000000000..fe93b32e97f8
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_buf_types.h
> @@ -0,0 +1,40 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GUC_BUF_TYPES_H_
> +#define _XE_GUC_BUF_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_bo;
> +struct xe_guc;
> +
> +/**
> + * struct xe_guc_buf_cache - GuC Data Buffer Cache.
> + */
> +struct xe_guc_buf_cache {
> +	/** @guc: the parent GuC where buffers are used */
> +	struct xe_guc *guc;
> +	/** @bo: the main cache buffer object with GPU allocation */
> +	struct xe_bo *bo;
> +	/** @mirror: the CPU pointer to the data buffer */
> +	void *mirror;
> +	/** @used: the bitmap used to track allocated chunks */
> +	unsigned long used;
> +	/** @chunk: the size of the smallest sub-allocation */
> +	u32 chunk;
> +};
> +
> +/**
> + * struct xe_guc_buf - GuC Data Buffer Reference.
> + */
> +struct xe_guc_buf {
> +	/** @cache: the cache where this allocation belongs */
> +	struct xe_guc_buf_cache *cache;
> +	/** @ref: the internal reference */
> +	unsigned long ref;
> +};
> +
> +#endif
> -- 
> 2.43.0
> 
