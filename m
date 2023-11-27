Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0461C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 19:10:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7203410E3CB;
	Mon, 27 Nov 2023 19:10:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E2E10E3CB
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 19:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701112212; x=1732648212;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=73DE5e46qK5Yehd6xfxXmex8glRj6Sr5oFwFNTeq5GQ=;
 b=TN62S47jNubYrqdkhD8rrNsx1gTvMkjIpen5KjHr6fE5+m2eVZX0cxAM
 1Ab+4wdFutpFQD7SxqsaSom8dCB0P2dZDiCxPxvazM+z2awfPmXuWbE+3
 OHgAS/adErhaovdVzQMoPlpYtTJWEEOxG9LcAPozPGoo5KRgkOZyAmi7K
 1MTqHxEqe80Ap3Z9adJBOUu25dhRWy1nIqeLxHyeNIiYFa+DugA4eegOL
 4zv7ms3UnKvxhkLarSIkWBJoEp2yFkg1zEG7VszljptJSvxKvl1RwljVp
 RJw2PyrG67LTTSYGm4tcSqxI3wgho3itU+uIYxgipLWjZczXRiLFgu9AC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="457103129"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="457103129"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 11:09:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="772026866"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="772026866"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Nov 2023 11:09:55 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 11:09:55 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 11:09:55 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 27 Nov 2023 11:09:55 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 27 Nov 2023 11:09:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AeoTbRcWw8ttkZkLqhAzB4moobEiPsBvkbmrJ0sJ85q7UjNeEeZ3WyMUsSDE2Hg7zj4RD0Rrfoq7fMSgcMf5WK0imOyJJY1u4fBVJCdiX9lPA7BEgNBEKc88MTRFCPkS0kZn4acqDu83P1QVArXdj7ETLZ9lgSDBQcjJtLQtW37uZFqEcOtJK/P6Qd9nWqbDBhZFx711qQdHgjFkCgIMyc7iEKHp4H6eZTuZbJUbAU7o/ABoWjGWnIufeapMsJjSrTfgNJcwBCsmlu493gcg3Yxk6ujEDEv+I13MrIf55+Y3vHE8gbg2wAzD20ZzZOSqKhWOyWTmeh0XJ/G7h04NvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WpcLw+HVxDvHVB0Jv7HLXABK9+/qk4R03kT9O/9iuM=;
 b=nWjiTSUkbYx6CVlPkAbIQ6ZY7rpCA945usQc8bXhxaoG7yrzfnaIihSfUw7LI3hMGghq9hyiqwpQzq1vB1IifeeGYJOPPIY3X2BAqd324AUUo+DYdQN8ptNKDC4pVigf08zeUAlHbTdvpcoOjD364I7h5pDYogFrgpDDI1qfyQEWF5tFutJpgMlHOxQQfXHd5O8O7Xa0u7SwENDBmIedNVVFuHdLvIvJqCN2Xf+DXNNfwGFZu/CNcPVhhsZGgXDF3DISQDrtnzJFFJF4D8PLYcOHRyBW/Uqyrw8ILpiDgo+jphxlINhYIMnJkDuPPHrCzLqyR6ob73jlyvKWy52i6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Mon, 27 Nov
 2023 19:09:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 19:09:52 +0000
Date: Mon, 27 Nov 2023 13:09:50 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <fei.yang@intel.com>
Message-ID: <ymi5rgc3ba562kxellzosdndtlo23wwlsz75rrafxg6qfevmc4@owfjmqn5tesj>
References: <20231122204501.1353325-1-fei.yang@intel.com>
 <20231122204501.1353325-2-fei.yang@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231122204501.1353325-2-fei.yang@intel.com>
X-ClientProxiedBy: BY5PR13CA0034.namprd13.prod.outlook.com
 (2603:10b6:a03:180::47) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7605:EE_
X-MS-Office365-Filtering-Correlation-Id: 13042ab1-db67-4375-b8e9-08dbef7c6f4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UQ/bh6ezh4GOeqVF0z5Scw5Fn8Sw/25HRqAE6e1+525NgdsJ40fZeb+XQaCJ5JNHMGLV6ubTkUrWrqjM8tuQOLb7h4bjcW25b6ljalp9eaaau3eQRy3pe64CV0BoWR2XjvXmZnjrlqp3Msv0JQwTdO0hNUlUQydhNksHuIoPTdrreNDngoPB5VReTeuuyxx4L4xolP8Ga72KuB5zE7PMce56qYJ6Cm4V2r9FB3198yxLv5SCnshI30FS+CYKNorLV44qNUi9vDQej+mBo9KdZ/7OaCFFRi1Lh9J8Kcko2QFwg96mDOm+fmTxYyGcWA/OmA9KJrVAhP7p0EfrVtN33RK9SFU+OlEL+yKfs0MTRbqP+ZQe/fWy5purWhHAGaOXUciWjq06ekAkiazhRtmZfJxMTIqt0v9xHQXXcARAkbUau2bMbk7IEzhjs9MkHrnZftCCggDXQ4ppYK1pCRa4p/9OKa0ky3eR28BQbdkEHf1I6STVodEgV0MUoTjtePgl0XIP05Oj73qVkBvl+BJUBxM2xoY7i44fZq1beK+Il6GzQDXkA+El0Re714I/s58duYTuQRGcK+0ylo0OeSkxNtQ+aKaHXxSSBW5mEOHUxeVAZsBAGULUYYkY76pgyyZb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(39860400002)(366004)(376002)(346002)(396003)(230273577357003)(230173577357003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(6512007)(107886003)(478600001)(6486002)(6506007)(9686003)(83380400001)(2906002)(6636002)(41300700001)(33716001)(66946007)(66476007)(34206002)(4326008)(316002)(54906003)(8936002)(8676002)(66556008)(5660300002)(38100700002)(82960400001)(86362001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UO25tPdnChFZp0ZdhOmNYxHJAq3xhVry14/oigetO9vL20wjSOWs/HoEagRa?=
 =?us-ascii?Q?FRYUzM7QCUUvX7wSJWyiNlxDlJIeKexJmCcgIE4Fa8XCLX/zt2RO8Wy4e3NT?=
 =?us-ascii?Q?TGCWFHu4kW7LnXfVq0EzAlyCUBseEWxk6PsUJ52drC0woyNja8diqoDRDv5b?=
 =?us-ascii?Q?z0OjJnDlrl7Q/Vz3qQ+Wa6tWCcKkIu1xVK/J2XvB7k9KpB0aM0BkC2uUdEuZ?=
 =?us-ascii?Q?1noriDq0tLTBlTFZrrTvFoE4+Rsue0q8HqTmRzgzK+xP/a8DuvsXhr6y/6Xv?=
 =?us-ascii?Q?JkYDiONH4SMo5j8mxfB43u9fGm8Zb4tKHeIBktk2eI4QwHNNTKeD5slCpSX/?=
 =?us-ascii?Q?+Nc82MlhEcC8BQhRJVZybLG/O7CZyLMbUD7ebR2dPSCWAyGnY9W7KDrCDZbB?=
 =?us-ascii?Q?wmBc4vTXzbZoEmD3oi0qXjPEecjpQ6DRtrV3B6LtSr88ZHaSnHoaftixyAf1?=
 =?us-ascii?Q?MecPF4MXdqFIm54JZnlKCZaey2XkL4BNvMCDyWSFZWDxu8fEBCDI5R1ZUrKy?=
 =?us-ascii?Q?Ivg2cmh/iK1nVh0JtSogutJyHuVejidzjd9eV1RWSKvQVR2TrDsBaMP5pUSp?=
 =?us-ascii?Q?GzymANYLtLtkm7Y/RVaNpFWq8ahbv0dfoVidhU/triYWZSCru+FVrSHKou2L?=
 =?us-ascii?Q?Bp8Z9aERfSFCiS+b8L13fxm2SDXWCpr9ojJ5NkHJkzbpyaXAe/BzYpaXcLly?=
 =?us-ascii?Q?2297fJQ2G+uaBR9xQpmO9fcpRUcnTa3nPA2HHPBELrxCVBO79rdH47c+wIUL?=
 =?us-ascii?Q?v5eyWoUhL6xbr/cXkhP9Yy9oKwYvGV908JZpn36Waou72iMLoFJ/J8H1EDc/?=
 =?us-ascii?Q?J+66Ql+jUOi1N0ys7Gu2dGLATV8OAgPVFZB3JYRnyRQEHmQzZeS8CF3ytuxg?=
 =?us-ascii?Q?XiVD2lZoctBdmfvHaZFISikfmSK0pbfHRdkRKwN97f1/V0HU4ZfjfyGIsNyJ?=
 =?us-ascii?Q?EyFRLuAaPA2nU19BivsThk9z6dgzKlNksaXim57j78wwWu1pjWAsQNRaSE6I?=
 =?us-ascii?Q?BWqeabfYvqKYBm98jpibAvd9Ldq16HiOVh9LOistvDtZZWishkzhV0P10v4h?=
 =?us-ascii?Q?IKvd1BDEn+y5IyajIH5zNWqVkW7GwBdT64+3TCuAFTg4hTOEaK4GDgO7P8jV?=
 =?us-ascii?Q?WvsXujOB1Mzd6+a7vFAUsTPeBYYLVVXnVVDBZHBKCoAuWZMLu/kK4F7Gi1n3?=
 =?us-ascii?Q?LyGO/e1vm3wDtsXCCO1/yYy3FQEjGlMsd8tQdHsryP0/H2eShGat1R2TLk3T?=
 =?us-ascii?Q?bbL6zLkPhJacSRjgcIPYDB34E68Tqn3k3lyXwTK2QUPp8/PVA+vHBRKheRqX?=
 =?us-ascii?Q?s3uAG/xTiNGpgVH7NP5KwDXuTbrtUzpFNHrGc5NZTwFBpJxUMNjGSSQNWlYQ?=
 =?us-ascii?Q?g/3gMEqDyYdoiRU/ChMgC9iNEoypuQCYQ3bRXVy6UG1znHgZRQLFjZzcUb+X?=
 =?us-ascii?Q?mfn/3LXGrr3pyY89WXnPT2L5zDxdqjOOluKnNZlKOJLwQEoobDBDG6ACedBw?=
 =?us-ascii?Q?cx090tMjSFt6q9MkfDRRshJBLtFdAgQ1EjymQhoAdmo5nCHonN0fnqM7tNxF?=
 =?us-ascii?Q?cs0gVJohagMsAfZykDkVe5p0EgT1ID7xT1CV1LwPy/vj+RvOTHjQ5gyPXeZ3?=
 =?us-ascii?Q?QA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13042ab1-db67-4375-b8e9-08dbef7c6f4d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 19:09:52.7335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NqLEJcjH90VHITCkaCvBKCmvl/sT74WIUiWgWLIK4xemxDN7cyihtcaDntPBZuKARzrkf9+aYV8CXbshyPWKc8mjPYPc6FOLrlSfYkoVzGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7605
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/1] drm/xe: explicitly set GGTT access for
 GuC DMA
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
Cc: matthew.d.roper@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Nov 22, 2023 at 12:45:01PM -0800, fei.yang@intel.com wrote:
>From: Fei Yang <fei.yang@intel.com>
>
>Confirmed with hardware that setting GGTT memory access for GuC
>firmware loading is correct for all platforms and required for
>new platforms going forward.
>
>Signed-off-by: Fei Yang <fei.yang@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_guc_regs.h | 1 +
> drivers/gpu/drm/xe/xe_uc_fw.c         | 3 ++-
> 2 files changed, 3 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>index ba375fc51a87..92320bbc9d3d 100644
>--- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>@@ -70,6 +70,7 @@
> #define DMA_ADDR_1_HIGH				XE_REG(0xc30c)
> #define   DMA_ADDR_SPACE_MASK			REG_GENMASK(20, 16)
> #define   DMA_ADDRESS_SPACE_WOPCM		REG_FIELD_PREP(DMA_ADDR_SPACE_MASK, 7)
>+#define   DMA_ADDRESS_SPACE_GGTT		REG_FIELD_PREP(DMA_ADDR_SPACE_MASK, 8)
> #define DMA_COPY_SIZE				XE_REG(0xc310)
> #define DMA_CTRL				XE_REG(0xc314)
> #define   HUC_UKERNEL				REG_BIT(9)
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>index 3032c4f148d4..438ce51dd373 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -629,7 +629,8 @@ static int uc_fw_xfer(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
> 	/* Set the source address for the uCode */
> 	src_offset = uc_fw_ggtt_offset(uc_fw) + uc_fw->css_offset;
> 	xe_mmio_write32(gt, DMA_ADDR_0_LOW, lower_32_bits(src_offset));
>-	xe_mmio_write32(gt, DMA_ADDR_0_HIGH, upper_32_bits(src_offset));

not that this patch changes anything but this upper_32_bits() is a code
smell. If uc_fw_ggtt_offset() can only return u32, why exactly we would
try to get the upper 32 bits (and suppress the warning by doing 2x >>
16?). Humn... commit ee2dee81e484 ("drm/xe/huc: Extract version and binary
offset from new HuC headers") extracted css_offset and now we are
adding 2 u32. So maybe keep the upper_32_bits(), but move src_offset to
u64. That also matches what we have in i915. Before that commit, doing
that write was basically always writting 0.

With that,

	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


+Daniele / +Matt Brost

Lucas De Marchi

>+	xe_mmio_write32(gt, DMA_ADDR_0_HIGH,
>+			upper_32_bits(src_offset) | DMA_ADDRESS_SPACE_GGTT);
>
> 	/* Set the DMA destination */
> 	xe_mmio_write32(gt, DMA_ADDR_1_LOW, offset);
>-- 
>2.25.1
>
