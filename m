Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9807D606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 14:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J/lDHcH7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6174210E4D0;
	Thu, 29 Oct 2026 14:39:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D583210E4D0
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 14:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793284769; x=1824820769;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8Dobp4+kfgSIOVbbxtlTEKkTGrCpfUmw++tYZ6igESg=;
 b=J/lDHcH7/sBEmJWgcLfjFhJB9o7yRIIKOUSffC/XyZpvcNClIyoRTODG
 nFO96XHaiBCjzLLLwy/Y6BdEe6EmDbZL+1dZtMXgXU5aDiasGwsbKhebl
 gitMOoiKyY1uVm7z+BjEZNrwErbhbsVOROzXMEb8y6+5WpgGdjx6vKpKi
 zFppAJmbr3VeAInM2M4uxBEFQ2pw5ypjFFInwPkoUEgbMhxhUY1HnJxHw
 EyEi6a6douWQd/lTBqTdMB6jw20OaiduuL5Q1NpRt5PqvQZIKdmGjM1I3
 sT+UQ7YJHosipP7Vtavb4bCgIFH9+GK36xaujEeElEScxVG1SPUSS8UHb w==;
X-CSE-ConnectionGUID: LQU4y3ECRoWdSiRaaluH6A==
X-CSE-MsgGUID: su5T9BcgR82/vyIwRybe5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2054585"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2054585"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 07:39:29 -0700
X-CSE-ConnectionGUID: IuGEXhStSqGaRsOCBMpW6w==
X-CSE-MsgGUID: Jmkdr4kpTXGyB41J+XRgZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5291358"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 07:39:28 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 07:39:28 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 07:39:28 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.23) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 07:39:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HhkaxeS/PyEWV3oUQ00jL7lwOby7Awfgo2R8Mwzo9KGqz9QkVtjTPKbQRWBz9VuiL4zNe+F11Z0lX8/d1WZaDtT7LoJnbW7ujBPi5xoIoGrydWPQg88vxUNImxGf0yMC6DGcMd7DarBZtMZb4LENAvxmJij3akaDL+aWLS+1mc2jTOTZqhPXyNRjymq7joAHP4MjsohObzaBKlmxLSTo/3LnfFYvFjetU4o1GRMRCVg9I2JiwnHuvOZ+bK/L/gp43boe6zWqzmHwQGSsofa/LHylJMPv0v2BHpYLu4Q3/pv7sIyYzg4LJJnN3tirBj+3SHnCc+UlgWRit+iva9zvEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T8Oe8R1ghglKX1fLN5s0yMAP23J2YdDyUO5/KBp/B2A=;
 b=xdaBD1PWoC9YR3CMeTj7qS9Boy8IrBvWblLFOxlbm9/M2RlisCPcIgqKo5k5K9gEW/cDS2E5Xkds3iAeH8cCQULx0QAwKHANXVePuEpzUCJ6H6GcoVTHYc5/atgqig/8L1ZKQR8xOWbM0syj2O/vHRo9lnopzY8KgkcCJOyh/eyh8s1L0mqV3ijkfelq050A3zFkP8wRVS8RpcLvBfP1DrGkZX1xIO4PE1zSpxGyjQDu5baZD9+OBE1qjV8MMeuUqj6cgxT0ZsCUusku64SUhYFy3XzSsBDd9ghIzEMArIr/rrtSG/tHAEEYKTybgnI53MBYSnQZCYmSMQ0XsqAYlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by LV2PR11MB121525.namprd11.prod.outlook.com (2603:10b6:408:423::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 14:39:26 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 14:39:25 +0000
Date: Thu, 29 Oct 2026 07:39:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/dma-buf: Add xe_dma_buf_to_gem() self-import helper
Message-ID: <auNamy4jovDxiDPq@gsse-cloud1.jf.intel.com>
References: <20261029142111.2590982-2-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261029142111.2590982-2-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: MW4PR03CA0097.namprd03.prod.outlook.com
 (2603:10b6:303:b7::12) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|LV2PR11MB121525:EE_
X-MS-Office365-Filtering-Correlation-Id: 5070b422-6d7d-4fc6-47b0-08df35ca6e14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|11063799006|56012099006|261009223027099003|261026121527099003|10067099003|261022113327099003|261021121427099003|261021123027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: TCBVvJD5bO/JXCZMR9qHSOueWHRZVKhkHPMmL6IJSc/xhuWSfPhArARrHH4GqhDRzJvTwg4023QXnXo5znXTQsrkr4cpxJav5sHFvm2V6Jyypg+8xyju9QNaZ9X6581Ailpt+QOkT/4hxQi2R3GPzM+CmHfbBWghDZtKSoSR/Eog9QzBIGn4TJva6TaCzh7hLj5HOBv4SAlDEzEcFGIYnp2AZXA6e/fgYbPlmfchus3FkoaJmjnRWE/8fvH3lqErn5OrrElxw24/F2NZs8Vknh51OXwsPsvn5U9yPlveGha2cmqPLlJMdWp4JnKXW3e0DtkvY0/917GdINmBOQu3iOnEtUTMrVTLz7xJp2K3I1mWiq/M61CxrQdiMs4NW6ruX/TTdgJFak4AcYfJYCGbB6XqOYRSu0p0/dNjn6IEpWsRn3WAQ8cRqF34tfaY8TrPSq7MNmYIwKRbKCsAYcw2nYTHnsBVSpuUsZ9ng+BbPJN0uiwIS62mgDF8+Ln12duM7MgNINDqN6XYJ/qvnlXHtiU1lsHgG5oMCjYVFYMUZHjS56JUlTvL2vnFOcKA4w/CNdozSPvr3nWLyQvHn1xgTgc5dhQol5LMwkrA4cZhjEZLSqXvmsxVwUQjbYtxKb3H4NpMgVdQqwNKlAvOHjBm8eFri/72ci0XIw8q1i/aPxg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(11063799006)(56012099006)(261009223027099003)(261026121527099003)(10067099003)(261022113327099003)(261021121427099003)(261021123027099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/cIZNhn9SeJaJAvktRGDmkKnCbhX3ICa+zC3TRO/grjicLPx/n/hx7GDrmuA?=
 =?us-ascii?Q?T/gEVtN2/kfU4aSMDSsmhazn+SJy+jruVNmZK6+/l//OUFt23yHDOnxGYTc2?=
 =?us-ascii?Q?8W6XgPxIhqyxFEepFnOgva9yMIhv4Bm2+xJ5BrIKXpbKheb1GvgDfQWSdNY9?=
 =?us-ascii?Q?9k59+r0uTRRWM4WZ1R9vVoU4b97uL99UQzsGPHjDRTPWEWGYsuCylHia5u16?=
 =?us-ascii?Q?Asn3vmx/KixO8218LPPvAMN4VE3edaKcJukKlnLJu26+4lgByxUGBwljq6b1?=
 =?us-ascii?Q?z/kG4yZZBClw6KvVfOJiHVhCA7y7JMN6NsvxBH68jv2dVLD8Mhqehu9zLmxi?=
 =?us-ascii?Q?crEbbFHppvU4U81CNt09tFPzt/DYpzZqRNU6WilR9ypiW4+DuDa//DUgrgM8?=
 =?us-ascii?Q?QRmDMvjFoC+ymowU0mXQX3652gVYuox6V0xbGTKG/UbxmqFKn3ln0y3vLJhz?=
 =?us-ascii?Q?u11gW+eyOxyXpPdSIQw3r4k86H+lz9FcO0IUiHvLHMvz9H362ygjPkN1vMMz?=
 =?us-ascii?Q?JFGdtFy/XEOgqFESALaxtHiC/Nis8lhQUTw5Sfa65Q7XdmS2YuVuWdc6u8UW?=
 =?us-ascii?Q?HORFl9CYMpZoceCR7B82fusl84HgxD/Jsr5MctGVGpcGRNvguy/2VGcjh4FN?=
 =?us-ascii?Q?bkuwmDzv280gN+ttwx9n91GxwKYEM6QdyJo5/bFF3oB5bW6vJQPr+0lUKwuO?=
 =?us-ascii?Q?ZdiyKME80rtmQrZFFHqs5chv0CrgdlrlZq6Y8j/0ZnVTYvDmb4BkfFRlKgH5?=
 =?us-ascii?Q?CHVdJbue4NR325Y+qWlK0h2qTjufy2VWwg/ECzEuv3jLBFiGalgPu1uygG1O?=
 =?us-ascii?Q?Fiqx6QEn3q8BJ5jNS4SCdBFfUS+9NRIouehmJRDqU0cY1vQAe9cqCftIQLrL?=
 =?us-ascii?Q?vc1rNRqhyAq6zc++l4CbZojWr55VX7Wr/UNli+ir/3djqOMauM2NkGMYdM5M?=
 =?us-ascii?Q?eIWYBki2+VuRPekD6LfSFzuE7Yc1xP9z1SzoeRL3BzjfKd+yjpkh7UkDyaUo?=
 =?us-ascii?Q?yqxJNXXZfcRWJpb40g3mbYjQz1A45/gOoSHhQRlW6tzzxuWoEMFCplMKe2I2?=
 =?us-ascii?Q?rwHyH8m1/wDJR5jRkNLjQQIQxnwIU/5Zn4DLufsnbTTL3Hg8VPMX6pAvNj9O?=
 =?us-ascii?Q?4Kx0UV/CVq9JAxeGds3tKEeRjB9t/khpAcnRg1EmLe1y4ruX8HVqFbxnsdHx?=
 =?us-ascii?Q?/6vU8vGdrv/Ox/3c07g4x87mFj+XD+N2pjTUVE4DCE+3Sh0Ou3woEgOcFLk1?=
 =?us-ascii?Q?iHT3bl41J+ar7NcTZFQ1a0n+PEE9p6WfV7dlmq3tkPlvYjwHoREW2wZ1VTzh?=
 =?us-ascii?Q?qHusJnBUxmd9+pvwnGgRTAjZdCxFJXXmbFGL2t0GhDdi7Affy2mYbqcQ/hBZ?=
 =?us-ascii?Q?S3flK7LceD3vEaTcB1Hz1e0bk+wnF/UJraH8YfOL4OzMwSQXXVmH2CdfamAi?=
 =?us-ascii?Q?vY23wfiBvOUjMTwIwL/3SrlfUFOy1FPdSO6dCh2cmt/saiCChYv3G6aO0wqF?=
 =?us-ascii?Q?4OWzKzJpvlKY4ENGLSM6mUWj3cmv90otuBldyVRn5VNq21dlhmVsmhxqkkUu?=
 =?us-ascii?Q?vrlIYhIAJZMTxFX2Hopk2RhQPPttt1PjHldHjSglBw9pXob+M3Xa24mJe3qP?=
 =?us-ascii?Q?D745J59S2RgE9xeQ9sRxJtUSxoJpJ2hSlebWrHk0we0Hh1MoC5IHJls1+1tn?=
 =?us-ascii?Q?dkszYZHvHr7OTiZJ0Y/Di9WWGZNkzeFQdwq+Wb+jjlBkl+SCwjq0rCtwlNLC?=
 =?us-ascii?Q?2K/1kzm+Pw=3D=3D?=
X-Exchange-RoutingPolicyChecked: cQcHsVmkWOBOWts0s6QhotC2qwwWzxv42B5DGpTr9W6S5fygswSo4XswvXy1SRHS2hw9TR/onvk9ewcRXJdPtObA0nW7CLkBd8dEAjoPNuryk04XrDxPnMez7cBaoJeA5nUdx0sCzvAqVTNELKgxTo8ZKY1euzvYTrSvVX8YlHEp89ZZevdQu59bWmfdfifhfaPpfi5QBkYiW+uRAfhRNxZQDp6+zpEKoisBrmE457HKnSz0SZ1wfB1jh2p9wduZzbnMoHrpx+cERNXjwTJLWb32JYG+s3omJImwJPGzRd7jyktsCJ9coPqP8Hko9O6mIzgu9it72XlhT9wlSl8pew==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5070b422-6d7d-4fc6-47b0-08df35ca6e14
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 14:39:25.8613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qgug3hrvamL8mzzzVYblM3IwYcjPRo/PATyqmhjznAD0uS3ICFbFitLzGChXFT5WH5b1fCLRkd//tUGupX9UGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB121525
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

On Thu, Oct 29, 2026 at 07:21:12AM -0700, Niranjana Vishwanathapura wrote:
> Factor the dma-buf self-import detection out of xe_gem_prime_import()
> into a standalone xe_dma_buf_to_gem() helper. The helper checks that the
> dma-buf was exported by this Xe device (matching ops and drm_device) and,
> if so, takes an extra reference on the backing GEM object instead of the
> dma-buf file. Expose it for future use within Xe.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Farah Kassabri <farah.kassabri@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_dma_buf.c | 38 ++++++++++++++++++++++++---------
>  drivers/gpu/drm/xe/xe_dma_buf.h |  2 ++
>  2 files changed, 30 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index 6a85b292dee7..5bf13dc4b61d 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -239,6 +239,27 @@ static const struct dma_buf_ops xe_dmabuf_ops = {
>  	.vunmap = drm_gem_dmabuf_vunmap,
>  };
>  
> +struct drm_gem_object *xe_dma_buf_to_gem(struct drm_device *dev,
> +					 struct dma_buf *dma_buf)
> +{
> +	struct drm_gem_object *obj;
> +
> +	if (dma_buf->ops != &xe_dmabuf_ops)
> +		return NULL;
> +
> +	obj = dma_buf->priv;
> +	if (obj->dev != dev)
> +		return NULL;
> +
> +	/*
> +	 * Importing dmabuf exported from our own gem increases
> +	 * refcount on gem itself instead of f_count of dmabuf.
> +	 */
> +	drm_gem_object_get(obj);
> +
> +	return obj;
> +}
> +
>  struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj, int flags)
>  {
>  	struct xe_bo *bo = gem_to_xe_bo(obj);
> @@ -372,17 +393,14 @@ struct drm_gem_object *xe_gem_prime_import(struct drm_device *dev,
>  	struct dma_buf_attachment *attach;
>  	struct drm_gem_object *obj;
>  
> -	if (dma_buf->ops == &xe_dmabuf_ops) {
> -		obj = dma_buf->priv;
> -		if (obj->dev == dev &&
> -		    !XE_TEST_ONLY(test && test->force_different_devices)) {
> -			/*
> -			 * Importing dmabuf exported from out own gem increases
> -			 * refcount on gem itself instead of f_count of dmabuf.
> -			 */
> -			drm_gem_object_get(obj);
> +	obj = xe_dma_buf_to_gem(dev, dma_buf);
> +	if (obj) {
> +		if (!XE_TEST_ONLY(test && test->force_different_devices))
>  			return obj;
> -		}
> +
> +		/* Test only: force different devices */
> +		drm_gem_object_put(obj);
> +		obj = NULL;
>  	}
>  
>  	/*
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.h b/drivers/gpu/drm/xe/xe_dma_buf.h
> index 861dd28a862c..d0c7893a5a6f 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.h
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.h
> @@ -8,6 +8,8 @@
>  
>  #include <drm/drm_gem.h>
>  
> +struct drm_gem_object *xe_dma_buf_to_gem(struct drm_device *dev,
> +					 struct dma_buf *dma_buf);
>  struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj, int flags);
>  struct drm_gem_object *xe_gem_prime_import(struct drm_device *dev,
>  					   struct dma_buf *dma_buf);
> -- 
> 2.43.0
> 
