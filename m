Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B64C71153
	for <intel-xe@archiver.kernel.org>; Mon, 11 Sep 2023 03:47:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16EDD10E06B;
	Mon, 11 Sep 2023 03:47:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1651D10E06B
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Sep 2023 03:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694404056; x=1725940056;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CBGAotRUQ1SFvgPWOZbb0pT6XooPQJ+UHgVbZRNqZh8=;
 b=gYk2a+9q/c0HlMmNpWNJ5Faq0Zim8Uq6uPbkrJ+0igI8G34c9X3SPPRQ
 tPapDOgGXKKQEAuyDdKj3XSpNdHJxkBJILBDWWgvylam35ARqDgtMUF7L
 UV5sSjyRHRcYHkniDoDdPUa2bKuE2mWi2lH/y+RNY0NsCm/JLfkJwQTHy
 J41GotF+D/204+ZjgDvcxewOMk89mTZaidXdb3nAPD7Y/OQilz5G40y00
 UOLrYoekqj0I4ersNZwtbx67nXenYH8VGfYmUnA0AvyQ/nSgU4Agq4lvW
 3nvD6hH6KA2/hL2fGUZdOaIXkDkAWN/ztYR7BJ5jh4O+SF2Az5e5GUpYJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="368223136"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; d="scan'208";a="368223136"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2023 20:47:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="1073990144"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; d="scan'208";a="1073990144"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2023 20:47:35 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 10 Sep 2023 20:47:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 10 Sep 2023 20:47:34 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sun, 10 Sep 2023 20:47:34 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sun, 10 Sep 2023 20:47:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FVrm+adQrR+P4jDiZLgK1doGRDM09AtjfB1JX1ADpt9RFwe9k0mwBQEA69kOYmVBmddx/YSvGKESaX2T01lhLuD9yfkcAsAdF3FXDGTG4qd64MeeO5X5QMhCXhctNdCPhbk6TwjP46dcRJpRjiWNpWWK4oOMZ83GQ7gxU5V2kQ1bIvwz/xK6YdxCPt/WQ2OX1pjb0cr9s1bKv5+seyNc3TozKYlEipJ2YY9DC7kVQIGjUO4irf9Vk/fsW5A9XQWAjK7otIgiuBuxt+e0KBOLuzZpJ63tCAe0h6srpfUGjYl8oD2YhfbH6U8+bRTr5bUPaRn1Yp25WuMYUyW9bXVqVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5dcZnRBAqSezRed8qxMklGRXYZOn/T7aXC85t4OZH/c=;
 b=Ds6geXvBhsKX6L/vm8oWs1xbda1yrCC1ABTjUFGelYA2zbU4GZ2a1OdqtLGCvyqhUK75XrYJR1uIvy/0JIm33zsyjA0yqwfTzjH0bpKKQ4R+MOKncShpALoO9+rqcsKnJYhACSxnBSd8eHfVayUguvVpguXQP3n9L8S5y4fhCHU9H2gA5G5ThEJNAuzdYvbCsMYIGcDwIPdouOo+mAE59EGiv6kl1Tr5B4QxK18+pWqGT6QsjiPP2RTSmzXsZv/UjVLbxqKm8w7OCUsgvMNekJg+3iLrCtGpdm89zDvkGVSYBU1R3ld8ZgKIwvnXUPncxTE2UKTi2abAt4xj+nbkZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4547.namprd11.prod.outlook.com (2603:10b6:5:2a1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.33; Mon, 11 Sep
 2023 03:47:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 03:47:32 +0000
Date: Sun, 10 Sep 2023 22:47:29 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <uuo6ymgwte45hhifxo43wblq3oe745g72k3jblopzl2qtmch43@achez6wz62k3>
References: <20230907193515.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230907193515.7-1-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4547:EE_
X-MS-Office365-Filtering-Correlation-Id: bcf5e024-301c-42a6-1374-08dbb279d3fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 46l8hNxS4Rk5RsJlTQjzL59gp/qE7wEdIFkK1DNDkbZpSB+nYNoN5k6IQV9gIir+DCvsz4/GKOqDM55ZFdYMWq21Gsilgha/8dEb7aZ3Bokccll/9B0xay5Dg+sgnh9WDEocZgsJMJGLt2z+eI53SBAqb5UYL/4Rd3e/1g2sAvWlWjTDkx3qJmkjjdTg3KrJyMc/QoIL0zGvpye8DDdPbyI/896eXK5vpkr6L2dFtFoczNtKkcjQ4c1MqooH90vr2iCvrzFA02Qh20KXWT7pQslowk25FKNmaFQ0gM9FKMHs7Zi8Ld4kBL32DurgMhqOFFsrO0JWSSA5vkdwtvOivQj0PyCrUsPy/wp6Im2v/EiaNAAr1jlUqFkmeYNW413+fvvqXwEoBxpNu9QYciYlMGmReXyA2wRa0WJk/4uaXtlLZJzlUuQqpNHBgOmKNsxA+4veVQcLITspX4cQEY4xr1M5lZJafapc/UpcqDVmZpS8QFoSiitKS4pKnSCNKKS4NUE3MJ598a5FcoJ4Ct1P6Vzth6tkOaBkNJV74JVD5//ydh55xEsrcFNXBYdiMv3OaJZN72AfRFpJKi0EnKz4LQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(136003)(396003)(366004)(39860400002)(376002)(186009)(1800799009)(451199024)(6506007)(6486002)(6666004)(6512007)(9686003)(966005)(478600001)(83380400001)(26005)(33716001)(66476007)(66556008)(66946007)(316002)(6636002)(4326008)(41300700001)(5660300002)(6862004)(8936002)(8676002)(2906002)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ojR/duS49kF/cduFgXB/R2ONHg/N+PUDgZ9qrbnTO0JjG5quxFikIyb3jAco?=
 =?us-ascii?Q?oCpx5D/fZLtuXuR5L65xu0IPFhkRDcHAaNN3yrh1/N5R0/nHMCmxoBfxrWtA?=
 =?us-ascii?Q?/ihP7uFRr+QhlgGY5pLmUP30uzfMAKTTcBS+XFFwqy6YVlzogoPWkbPfTqmj?=
 =?us-ascii?Q?J3umpMMymjV7SKKNI2OmucPClFdEv1aPLH/YTvW/lEDxo8E6HhgdSB/PIgy3?=
 =?us-ascii?Q?Qew6fzHgEc027I3khmrGN1qDKbMn5rJSv0d0Xd32wRLd77mBI68RYxKig1bW?=
 =?us-ascii?Q?u+LBnME4JQXUZZwANVMmYZwieBO0mTA+MyjTxoIzEKsi6ZWJpKgu9gWPgXZ4?=
 =?us-ascii?Q?ltR0Yby9O4hnViWhXMEocTZtnccHwU7kxYr7FvDVkznmhY0rSnXTxlO5zYRJ?=
 =?us-ascii?Q?hbZsiEdLNH9oqXOunQAElI2ZbvYzoMoxm1dqRqQ8uHxDQoWblIRX9lNzYMEC?=
 =?us-ascii?Q?xjDCjgCNvaQzg3uGqlzd15/hiAyeuqzbGPNsyvRsUZwutkXzQcTPFabvXcmV?=
 =?us-ascii?Q?Dnaew6zEoD5np60wNLinVQ7US4e2JsWa5o+q/SZU6wldEFPTq0eRk59Tpksf?=
 =?us-ascii?Q?sl3e23o0coin587KLXsPn1izy8IU+KGI3D6xlDJjskt71QieEMIKQYG7wMDM?=
 =?us-ascii?Q?BWZyxGZO33a9CwO0p0bo6Xq92bdg3SRuE21fVmNESD5Aa5rDIlfqNuDXYPQ1?=
 =?us-ascii?Q?eTfXesGZIoBRUMVQnOPJEuzLcpVlgBo1nFhJuFtWHx6p+P8btSlw5yd7DzDE?=
 =?us-ascii?Q?J99bTO85uOxlm40wPbmLIs6fe3gzAyrxxbUA3hSD5jZjB956Y31DuP9dSyoo?=
 =?us-ascii?Q?nBSk8dCUlklQs0lpQ6N9xS2RBBaKs846rSOLy2T1YfF3G5T9CvUDKIwlQQHr?=
 =?us-ascii?Q?ruX+uaqxgA1MRZF+/FGL5uem78mol9DBpNoWvkOHuEI80vQD8EOYGCiFKNP8?=
 =?us-ascii?Q?6RrsiQxlX0K2dGUsuTQp2ge/v8/cSFWKNPDpcUQ1geUdAZZLjthj/k++k+52?=
 =?us-ascii?Q?iT3bFgeTmXIcownnCYAmwSfrEFN3mc5ojo0O43XKQgnQ29l6GojnT7zTCr/S?=
 =?us-ascii?Q?wPucExWliEJgT/sP60M2HgejbNYqSDill3g7ERFkF7VEmtZYxHPgqJHzyz2s?=
 =?us-ascii?Q?vA6BBF1I3O+GLVxIvBlvWZizRjU19jK3erhQU2Io87qN2wKU8rXfIHBP2M+a?=
 =?us-ascii?Q?VJo8uoDvvdVuQx+lS5v9+elROdiBoZVGXc5pyGw4oBBgl7GyjZKKhx8U1eC5?=
 =?us-ascii?Q?EFQ/iysoX1nJKiG+3Efy63LfL9sChbw9LJHG+hbs8LFowDKJkirGxFAv0KMC?=
 =?us-ascii?Q?w+IUcazBQixVrKp6v3yxGvmz7vCIfMtTBIeLOmIsn5zUJbc7L5JDhiL1CiSZ?=
 =?us-ascii?Q?svWZUUtDbd29Wr56q/fMPxkEDBgJAN2ZEsd3Ue+unHPOpanHmVSb7zK2tAzP?=
 =?us-ascii?Q?hkC2PoaGBbgQAKAK+QVc+lGOBdzMAW0iMrsDWUxWR3JTbGGXXTW/AxipGzVH?=
 =?us-ascii?Q?Oes1PUbOyH5YHQwsK6WIwrqGWeVU40a2A1tIglg05SMrPOlyBELTgA6Aay5T?=
 =?us-ascii?Q?o2Vcv6Af4eXS/B6Nvq8WTujXtFe0h9gjsDPS3xnMimK5ihnnPbBn/Y2Fusmj?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf5e024-301c-42a6-1374-08dbb279d3fa
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 03:47:32.1871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fVEEaF9Su91f8dWEzXHf5Geqo3pU2iLVQvIibC+mWHyWhi4SWOvKcbhETEOcyZ4iUOArqMJ13VP5sV4vy1JQHA6ZxkQlsKKTuFFEvjBW034=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4547
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/uapi: Remove MMIO ioctl
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Sep 07, 2023 at 07:35:15PM +0000, Francois Dugast wrote:
>This was previously used in UMD for timestamp correlation, which can now
>be done with DRM_XE_QUERY_CS_CYCLES.

as a breaking uapi/uabi, "can be done" is not sufficient. We need to
get acks from the UMDs that were/are using this interface. And we can
only do this before merging upstream.

Lucas De Marchi

>
>Link: https://lore.kernel.org/all/20230706042044.GR6953@mdroper-desk1.amr.corp.intel.com/
>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/636
>Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c |   1 -
> drivers/gpu/drm/xe/xe_mmio.c   | 102 ---------------------------------
> include/uapi/drm/xe_drm.h      |  31 ++--------
> 3 files changed, 4 insertions(+), 130 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 109aeb25d19c..10fa1b55578a 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -107,7 +107,6 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
> 	DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_DESTROY, xe_exec_queue_destroy_ioctl,
> 			  DRM_RENDER_ALLOW),
> 	DRM_IOCTL_DEF_DRV(XE_EXEC, xe_exec_ioctl, DRM_RENDER_ALLOW),
>-	DRM_IOCTL_DEF_DRV(XE_MMIO, xe_mmio_ioctl, DRM_RENDER_ALLOW),
> 	DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_SET_PROPERTY, xe_exec_queue_set_property_ioctl,
> 			  DRM_RENDER_ALLOW),
> 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index 3ccc0af4430b..e636e3f3456d 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -422,108 +422,6 @@ int xe_mmio_init(struct xe_device *xe)
> 	return 0;
> }
>
>-#define VALID_MMIO_FLAGS (\
>-	DRM_XE_MMIO_BITS_MASK |\
>-	DRM_XE_MMIO_READ |\
>-	DRM_XE_MMIO_WRITE)
>-
>-static const struct xe_reg mmio_read_whitelist[] = {
>-	RING_TIMESTAMP(RENDER_RING_BASE),
>-};
>-
>-int xe_mmio_ioctl(struct drm_device *dev, void *data,
>-		  struct drm_file *file)
>-{
>-	struct xe_device *xe = to_xe_device(dev);
>-	struct xe_gt *gt = xe_root_mmio_gt(xe);
>-	struct drm_xe_mmio *args = data;
>-	unsigned int bits_flag, bytes;
>-	struct xe_reg reg;
>-	bool allowed;
>-	int ret = 0;
>-
>-	if (XE_IOCTL_DBG(xe, args->extensions) ||
>-	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>-		return -EINVAL;
>-
>-	if (XE_IOCTL_DBG(xe, args->flags & ~VALID_MMIO_FLAGS))
>-		return -EINVAL;
>-
>-	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_MMIO_WRITE) && args->value))
>-		return -EINVAL;
>-
>-	allowed = capable(CAP_SYS_ADMIN);
>-	if (!allowed && ((args->flags & ~DRM_XE_MMIO_BITS_MASK) == DRM_XE_MMIO_READ)) {
>-		unsigned int i;
>-
>-		for (i = 0; i < ARRAY_SIZE(mmio_read_whitelist); i++) {
>-			if (mmio_read_whitelist[i].addr == args->addr) {
>-				allowed = true;
>-				break;
>-			}
>-		}
>-	}
>-
>-	if (XE_IOCTL_DBG(xe, !allowed))
>-		return -EPERM;
>-
>-	bits_flag = args->flags & DRM_XE_MMIO_BITS_MASK;
>-	bytes = 1 << bits_flag;
>-	if (XE_IOCTL_DBG(xe, args->addr + bytes > xe->mmio.size))
>-		return -EINVAL;
>-
>-	/*
>-	 * TODO: migrate to xe_gt_mcr to lookup the mmio range and handle
>-	 * multicast registers. Steering would need uapi extension.
>-	 */
>-	reg = XE_REG(args->addr);
>-
>-	xe_device_mem_access_get(xe);
>-	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>-
>-	if (args->flags & DRM_XE_MMIO_WRITE) {
>-		switch (bits_flag) {
>-		case DRM_XE_MMIO_32BIT:
>-			if (XE_IOCTL_DBG(xe, args->value > U32_MAX)) {
>-				ret = -EINVAL;
>-				goto exit;
>-			}
>-			xe_mmio_write32(gt, reg, args->value);
>-			break;
>-		default:
>-			drm_dbg(&xe->drm, "Invalid MMIO bit size");
>-			fallthrough;
>-		case DRM_XE_MMIO_8BIT: /* TODO */
>-		case DRM_XE_MMIO_16BIT: /* TODO */
>-			ret = -EOPNOTSUPP;
>-			goto exit;
>-		}
>-	}
>-
>-	if (args->flags & DRM_XE_MMIO_READ) {
>-		switch (bits_flag) {
>-		case DRM_XE_MMIO_32BIT:
>-			args->value = xe_mmio_read32(gt, reg);
>-			break;
>-		case DRM_XE_MMIO_64BIT:
>-			args->value = xe_mmio_read64_2x32(gt, reg);
>-			break;
>-		default:
>-			drm_dbg(&xe->drm, "Invalid MMIO bit size");
>-			fallthrough;
>-		case DRM_XE_MMIO_8BIT: /* TODO */
>-		case DRM_XE_MMIO_16BIT: /* TODO */
>-			ret = -EOPNOTSUPP;
>-		}
>-	}
>-
>-exit:
>-	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>-	xe_device_mem_access_put(xe);
>-
>-	return ret;
>-}
>-
> /**
>  * xe_mmio_read64_2x32() - Read a 64-bit register as two 32-bit reads
>  * @gt: MMIO target GT
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 86f16d50e9cc..6c6d1cfa415a 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -106,11 +106,10 @@ struct xe_user_extension {
> #define DRM_XE_EXEC_QUEUE_CREATE		0x06
> #define DRM_XE_EXEC_QUEUE_DESTROY		0x07
> #define DRM_XE_EXEC			0x08
>-#define DRM_XE_MMIO			0x09
>-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x0a
>-#define DRM_XE_WAIT_USER_FENCE		0x0b
>-#define DRM_XE_VM_MADVISE		0x0c
>-#define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0d
>+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x09
>+#define DRM_XE_WAIT_USER_FENCE		0x0a
>+#define DRM_XE_VM_MADVISE		0x0b
>+#define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0c
>
> /* Must be kept compact -- no holes */
> #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
>@@ -123,7 +122,6 @@ struct xe_user_extension {
> #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
> #define DRM_IOCTL_XE_EXEC_QUEUE_DESTROY		 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_DESTROY, struct drm_xe_exec_queue_destroy)
> #define DRM_IOCTL_XE_EXEC			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
>-#define DRM_IOCTL_XE_MMIO			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MMIO, struct drm_xe_mmio)
> #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
> #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> #define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
>@@ -883,27 +881,6 @@ struct drm_xe_exec {
> 	__u64 reserved[2];
> };
>
>-struct drm_xe_mmio {
>-	/** @extensions: Pointer to the first extension struct, if any */
>-	__u64 extensions;
>-
>-	__u32 addr;
>-
>-#define DRM_XE_MMIO_8BIT	0x0
>-#define DRM_XE_MMIO_16BIT	0x1
>-#define DRM_XE_MMIO_32BIT	0x2
>-#define DRM_XE_MMIO_64BIT	0x3
>-#define DRM_XE_MMIO_BITS_MASK	0x3
>-#define DRM_XE_MMIO_READ	0x4
>-#define DRM_XE_MMIO_WRITE	0x8
>-	__u32 flags;
>-
>-	__u64 value;
>-
>-	/** @reserved: Reserved */
>-	__u64 reserved[2];
>-};
>-
> /**
>  * struct drm_xe_wait_user_fence - wait user fence
>  *
>-- 
>2.34.1
>
