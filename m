Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3C6606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 05:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EBL+DDn/;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=jAzLFUzY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E77CE10FB9E;
	Fri, 20 Nov 2026 05:15:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE0F410FB9E
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 05:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795151706; x=1826687706;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fkRi3LG+6AGlgk6ZgIhvkgTFiKkAk83bX+HtNdfU2d8=;
 b=EBL+DDn/LMKihJ7nf3jMoZMoa5GVdNlMYdEbUyBRWcYSmr3MpA/j8aeP
 aNo1/M4/o4isAevSiLvXFGQiefMZplMlBkPNh4ZIhewJIC7xEuOOGO3dC
 T3Izol+IzxdQEz8I+j0NInsty4E6ty4ifPimOLR3ggYsAJUvzIFGvIVrN
 LYDs6h5q0pgGPgkU+K+t14i3JTZGiOVgBPzxEhmis4+c978Rzqck6jPbF
 GwiZZvdfnv37nv3DJGsAXZdWSMCSchGGVIEAomGancG+jqfH3ZZneDRt4
 0MWtKhhq7ZZ4pbEYuRQ7d0HKZ4ACw/M0FVQkm4ywEewlKhUetj6hm9qJN g==;
X-CSE-ConnectionGUID: ySyYXXWgTqCRZPkz/ldZOQ==
X-CSE-MsgGUID: ewepL8nyS2ix339zO8Jz3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4067006"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4067006"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 21:15:05 -0800
X-CSE-ConnectionGUID: fb7veU8GRFmZyGq15AofqQ==
X-CSE-MsgGUID: u9CSELVOQAGPrd9L39SSaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="12323652"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 21:15:05 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 21:15:04 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 21:15:04 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.46) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 21:15:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tuJIGchmtTlI8b+stF0R6ulevDBna+/igTUXUn/F14/SjJxi6wSRrpPxve9OXc/zs8JGGsFEHPtMiYKwnvPuk7lEe0FmUoZ80fyhQkY1h6ehqX1cPOgRwmTGg2llgeHz53oMrYGdh+OBIeGn4NjS3/pEyr6g+HOQPJw16TRQvo0VefJ3RuWr94Gm1JJa603VhLXTV1J/O8yQTeQvVfU4AdvN6h0DyMDNU/RSVAkUeUJrkSSGy9XrWfj8IIAix8RkbYDAgkC/20CmlWW4J47zTPnK95yif92HDWrdXevx4ADzZM1aOq+8JRjX5IEoSLljxX09QCUYPF5Bt5fdPvYw6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1BVgc5aIzs2pZbjGCfSCaZj0fGv/YtE30UEnRp5BV4=;
 b=LsnAPtxVCb+sxAwXtchwV0saK8bskbuvlCqe0xltuprGfOFBQhKVJ03BHnd9Eo056HtZpb2B+Zi7+0scGlRn4oij2SX2qyinxT5nq0xfFgRAg77TZ4U8WAzF9kPSz/+MCYKPAcMK1Ll8/9+pSRedIr6EaIAZafjHL1nnrltd6ehl0vwhbhVHND6tR87dWT0fkOnh2jcGObd+jSdn5LlM6rJ05mohja/BCVjOIHwhocC9osZEmy0MZYVymQ1avSlQlS6zLUigi5fkMbvKukQ+xegW0nqFGWO5jNSS9RgxXP6RAmPSmdnSTJdkaMrdCprG6+hqAj/TTA+dpUhaxpZwMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1BVgc5aIzs2pZbjGCfSCaZj0fGv/YtE30UEnRp5BV4=;
 b=jAzLFUzYyJJxzYLm61P94RBbw5q3sCl1EXWacT4Z5UIsnS7sWGqQha5CzscrmobGw9EgI4ev8DzNP1v2VsZProLuHiIbKLhnHCmvD+lfbdyKpmoofyJpArC/Dfz5lN3Mnffi3stDLGMbW1XPRdBjdUwkq3JjLHuOcM7L7X7JwOc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by IA4PR11MB9420.namprd11.prod.outlook.com (2603:10b6:208:563::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Fri, 20 Nov
 2026 05:14:50 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 05:14:50 +0000
Date: Thu, 19 Nov 2026 21:14:48 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Hold a fence reference while waiting for migration
Message-ID: <av/XSKKO/on2p/Tj@gsse-cloud1.jf.intel.com>
References: <20261120050530.3808036-1-krishnaiah.bommu@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120050530.3808036-1-krishnaiah.bommu@intel.com>
X-ClientProxiedBy: MW4PR04CA0353.namprd04.prod.outlook.com
 (2603:10b6:303:8a::28) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|IA4PR11MB9420:EE_
X-MS-Office365-Filtering-Correlation-Id: d7659212-aac3-44a4-2a4b-08df46c533cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|261102123227099003|261026140227099003|261026121527099003|11063799006|261028144727099003|261022075727099003|261021121427099003|261021123027099003|261022105027099003|56012099006|10067099003|18002099003|261009223027099003|22082099003;
X-Microsoft-Antispam-Message-Info: ZvKZNlG4wWNWaGoHR5++rcdW3fM4BhDbMU9dMP4UlNTpbP/up8uyPdfHCUzmvLf+Gd0wgET1lBI7/WKfb2ckvQdSC5eYi5oVb6e4fLpUrV8XftyNk7vqlEJyvcSKFkwMGKl67+JbXZ34k5riD1yfPe9/UDKk0S45akrnEfLJsUZ/IZYZpyBGpWzppidTIT24YAp1HoBBHA2JVs9F3rDgXgfuoe0eZZyuqTyNS3e+W5n6oePxwXLRgTARnqizRX1ex/KWXCVmyDVSyFqc06sfuPVRGCMB+acbnm721VaJdYCnp7jsnBIYj+0plR3mHuyre6L6HShqukEK0wBbPWsq641Y9ExVg0WH0H+ZN6aCgbYFaBuu2++0+J5p3ql1aGyfLty1SKIwg0Go93rvBy+wkM/R6AE3FurX7w9/mXJ0UXId7ST7E1BU74oObGX6ZynFNnO1KIsOQGBIegT8cyj4WAi0BNyGriEXsLfnY4u+FbANzosmfVelL0fqICK+RBju5MYyOYMhOTx9tVQCp5FnGN2+3OwFBvfWkSeYwpqRv/yVatwSlQkT5c2Jqg+63eKsTXcpQtFHtiAX+4mBuEH4yE73UDGuSnwswJomYoAnXdZXU5aWh1XGhAb83PeJqchDV7r6cJmobGGADEhHfqq7r/WsqluqJMcY7dxjUcD3KD4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261102123227099003)(261026140227099003)(261026121527099003)(11063799006)(261028144727099003)(261022075727099003)(261021121427099003)(261021123027099003)(261022105027099003)(56012099006)(10067099003)(18002099003)(261009223027099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5kLtYFsa2kRM+iF/LJFC2Zxivgki1igVuxDWjBh4WSa9iX7498w+5cvbwLo4?=
 =?us-ascii?Q?O3DnzT9vLRd1HWrW/QWMiT2lZjW1fVF/CPhdY8XYUyrv+IwVzQSUc38P81Rf?=
 =?us-ascii?Q?KapAqBe1BoGzSEtptS+nJo0aHwmlmImmndq2v/LZGPdix/SkjFcGFJ6mNp7c?=
 =?us-ascii?Q?MhLAqM5W2EZgAjZRRMRVAzjtHdjQEcfTCvoLCme6MVzONXxDEDMURkJavjGW?=
 =?us-ascii?Q?K877xQsrHafNM8+Y8w1M5wtL85HimdW+ZDh+OiSsUj15GzcxlSteR9xvvmPo?=
 =?us-ascii?Q?E3s634Rd8Ho7gm8byCEsVerZWc63GvkFHcO/+m67WN+sVIOBH5rzDFZQvfbE?=
 =?us-ascii?Q?iyBn6I7y8rzQP0FD194szeXqwrudzwTl50Q3zk+JVfGjgoc/AzF+P6ka4gQq?=
 =?us-ascii?Q?LAuuNSBrE9iqaiOP9qOIdJcnukHjdnjI2fcZARyLlaFq0rB9VaDVsmjbXNif?=
 =?us-ascii?Q?GGZiEI0NluNZWhB0R8A41H5p4mLk3f3q2XuetT1xX39LA0YjpFVKNmXgX2yj?=
 =?us-ascii?Q?eOMHRVcYa6XyEyTmiXMQ72Dg/05n4b7WBb4b9AejcL5GMsPB1R76SvlfpAI2?=
 =?us-ascii?Q?TWl0o3KiQ6xtBMZrdP7pirVcJyrpo27XeIEYu/pwbjh5sIQj8BjDck0NvZIB?=
 =?us-ascii?Q?bmWZtZ2/5Ka8jrWdfp8z8Zr7kaZSB8oaa/1zR656yqjG52n39DHUNMat+YLP?=
 =?us-ascii?Q?fYPqh+0vf1EVu5rWYba/6AU47cHmx2Tn+R1chMUKxwFIi7pqoKmpypkABvgo?=
 =?us-ascii?Q?otgoEC2nYh0iJW37pIK7ugzNE8T8FzgIhr+vsBgGwHs7rz68WlU5QsWbquQB?=
 =?us-ascii?Q?gjw+Z88fRT5jU9Dr5e9P9qBqLg/DluRd6o4Xt/2BGwb4hI4Km6SA1MCzdm4u?=
 =?us-ascii?Q?1gCee74u/yDAk/mnQ3AUzfou4HWjeJONupbpbVgQ9zSxrLwxAi9XFAPb3vNh?=
 =?us-ascii?Q?LIpRJY9chDe5BPGKYETg98x5euywNt4XFEz1w5e1JFlpv4lEp4SWH4b0gWRv?=
 =?us-ascii?Q?PhnQnEcf5pAO9DZ5l35SWRkKD6lEbm6gTCPZfH8ROCQbesm+UdGNA7gqfDm5?=
 =?us-ascii?Q?/x04PC8aslHWNeVybS46YasoDQ58+b3mVlrqECTInmxUiN5O+zaQHDAhJxmA?=
 =?us-ascii?Q?k/5QN7p30Ian4T1EY2eCHxdKLqKnLwrvIlljf6qPTmkgFjTnCEtHi36h8i6f?=
 =?us-ascii?Q?btIyEstuP+NsersdqzBKrDSlZKKWZSGPcQsmre3k3U4WvQEeMIFSkoAv0gos?=
 =?us-ascii?Q?YktrFlexOprRbjCGss8PnL0azyIpsGTE5d9zdsRkX9hyyikNbc+Ts52H9/d5?=
 =?us-ascii?Q?pg+PhfIFMjZqtfRcagT4/Nu01Jy3EIEJBlSYI5GuV++DaidToTOBWP6LeP6T?=
 =?us-ascii?Q?7/HZaf413dxInoQmqykBszGCez4QXuSI7ieJJTIAwzf+DjyiTlFmm8mQJdiU?=
 =?us-ascii?Q?fbyy2xScBtiyQE6rBFTOFeSk6qP89OT/Ic4pnRo/JG2uT8KDI4msu0qHapU8?=
 =?us-ascii?Q?z7ken20Jz0U4cXxgP/g1ezzmBz+kHTyuboiGqf+pG0P1joIb8dulZb3o4M25?=
 =?us-ascii?Q?BhQEI/flmscZWN9YRcevLk0O5rgg3D/SsGMBh8a79HMeFIUlhTuNl/EHvin2?=
 =?us-ascii?Q?r6pyuzexFP4ZyR5C3EJMVDk/vZ1d/pB/zBaBd7GPDUf3SovjY7Mv0M3INz7S?=
 =?us-ascii?Q?bkYKREEYTLefkyxdNu6Zp9lfU8uph8P2nPEMds46KZX5H4pBfydv815v/pSu?=
 =?us-ascii?Q?71bSAxf6ud1KH+RxSBsblHaQRJCebGo=3D?=
X-Exchange-RoutingPolicyChecked: CejKDNfQLAESOT0dbozF22iK6hS6UgT6XUFKAH1hVkGnYonYkeIEOzLC+hc8d5l2xBR9Vvt8ZXAQ2xw55gztXpxD9SBIEUCPDMkuuq3KjAlkSVWLJX6ZpiCYXZrkp8YNoHigVRLqjeRhkh48x/puiwFMWbE/8Mvl1CtM1ogjN0rcX+o8G5U206kx9eSSGl1IN+ALYnQPOaayymcJEfJd+Rom1G2DMcwp7fFK4sa8ru9u2cgu5SmKfytw3gLDCQIi0JLLXocadDHymS7O5CmYQMkkfieIh7O6smmG8wBh8WluGtpxTSYvxb/wkwSGfJ3Sy5+66JnE3Iy7+TA3kuUiUA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d7659212-aac3-44a4-2a4b-08df46c533cc
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 05:14:50.2656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +H9zyf3cI3nRJZYaaOdh/+cVY4plohX8M6fu36o4KcqnPv3U3TWXpP6QzIDs4ZFmem+qOlAzWZ7bvhdXfRizdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9420
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 10:35:30AM +0530, Bommu Krishnaiah wrote:
> xe_migrate_wait() reads m->fence without job_mutex, while migration
> submissions replace the pointer and drop the previous reference under
> that mutex. A concurrent replacement could leave the waiter accessing
> a fence whose reference has been released.
> 
> Take a fence reference under job_mutex, then wait and release
> the reference outside the lock. This protects the snapshot without holding
> the submission mutex throughout the wait. Callers must still quiesce
> submissions when they require the migration context to be idle.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> 

Yes, good catch.

One ask: Can you submit follow up patch in this series to formalize the set side, e.g.,

static void xe_migrate_fence_set(...)
{
	lockdep_assert(...);

	dma_fence_put(m->fence);
	m->fence = dma_fence_get(fence);
}

And then use it everywhere in the migrate layer.

Also if we kernel doc m->fence - document the access rules.

> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index d7a8d8ecffe6..57a81eda2088 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -2150,8 +2150,16 @@ struct migrate_test_params {
>   */
>  void xe_migrate_wait(struct xe_migrate *m)
>  {
> -	if (m->fence)
> -		dma_fence_wait(m->fence, false);
> +	struct dma_fence *fence;
> +
> +	mutex_lock(&m->job_mutex);

scoped_guard(&m->job_mutex)
	fence = dma_fence_get(m->fence);

Matt

> +	fence = dma_fence_get(m->fence);
> +	mutex_unlock(&m->job_mutex);
> +
> +	if (fence) {
> +		dma_fence_wait(fence, false);
> +		dma_fence_put(fence);
> +	}
>  }
>  
>  static u32 pte_update_cmd_size(u64 size)
> -- 
> 2.43.0
> 
