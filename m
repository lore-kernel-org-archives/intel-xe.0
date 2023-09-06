Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B457EE14A0
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 14:53:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0DE10E692;
	Wed,  6 Sep 2023 14:53:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4566810E692
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 14:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694012024; x=1725548024;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Q3X/DZJxJn6gxUs7Ar6ZtQeluYO1xOMN9uJsulStxYI=;
 b=Dwu1Hvb6i9IDMCOTfdWg60hOPedvvtYYXed/HNLploEFXIO2ew7figQJ
 Nf9JBXHwXuvO3qC9Ie3BhyfOuB4jFOFmYjPkR17+eiRZioBt8Hc3PQt5Z
 It54cBTVoAYjUgDeBIRJHgjAagQgVdU+Eri5ocG49cdiGe1vx1HKCxdAv
 gqaeJ8hmS021BXbWjgbNYjXsr8JVJkHVCeGNeBdLPs7FHLAUntITRTNhD
 uxRmTuV8bHKDMy5rX9sphs86pqjeVUkyoU8fzpxq3C6KXbXmXvCgK9vP+
 KixWlbuby6EYlYAh+MRjtbR9Vd6+EuRsk6+pj07nXTTMUBqVvfUn+xgTr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="362117100"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="362117100"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 07:53:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="735086697"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="735086697"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 07:53:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 07:53:42 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 6 Sep 2023 07:53:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 6 Sep 2023 07:53:41 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 07:53:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nunei7S02aygzBWhqiW+BwiYs4bMXrp/8wCilBFS6XOFUoQXzuze8QeDxh/37lRHXfyBkcdiLcrfbZIFJkAr+BArnjFmHVDI9Cj4Vy9FbFqAKhTd+FigAURFBeM68iAJj/06uJQhzFeteueUcF9tzzURhRelttSJXaXbBq9Y/lGCYJBnlXgNNwa8HLFATrEoNm+Ks4ONWZW+fIagdBR3l6pOqVDT4RZbqNhIGWQGwFmq4un0wkk29qB7N1iVbjdF3cCMiXBDlXBBv4lZuEPDnD4Iuo9XlYgT3C2FrqzPLZOF8p+TZEn8wmimmMEPOJSGLolOlm5Vh3MJpLjiB9O/Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KXer1m/owZPzsZtTM/DP9dw28LlCGAl2Y24oC7SZdLo=;
 b=aI9pyuZUu7Dz1Y4Ve++z+GNaq9cOOfn1OZf7KgcGtf5Z3h+KX2TZyxUrpHs9YMZSWn1MnxVFbQtt8S+HjrN8npDjMwpAsGwJiN+vgRLHiL9rJRAnDGwcYDnMYu10dvwzm4GpovOncG+ADSD2yygAZNr1N1O/Fz/TZbgq048CIid6sLac5TTqU+ubShlIwUlytKCqhFC9sLVyIgHhJdhWnkuLawOBq6XO+EdyFSLsEfZPF+i87h+d86iGzxyShlioLV+KsGIN3I0ehgKh77vrc60PGqXfVehFzt9i5rlaw0tYrGZRjYUKaBAvAO1BALLSrCIPzSH44LL3cCQ3/G/2dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH7PR11MB6556.namprd11.prod.outlook.com (2603:10b6:510:1aa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 14:53:39 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723%5]) with mapi id 15.20.6745.026; Wed, 6 Sep 2023
 14:53:39 +0000
Date: Wed, 6 Sep 2023 16:53:32 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZPiSbH39eeMoNOQ2@fdugast-desk.home>
References: <20230830214715.113435-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230830214715.113435-1-rodrigo.vivi@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR2P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::13) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH7PR11MB6556:EE_
X-MS-Office365-Filtering-Correlation-Id: 1947b503-601f-44ef-89ef-08dbaee90df5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6t/USQL0eEQEq0EX4iqGwTBkq+QT5RQ+/8R+TVskkABapnvPpaP7QrwQDRVrj42DAA1RXmOC32L/iHgPL8pG4Xo23WjuVWlZA2bG5nG6rc7YOa53jyBIIeH2/934hA357DSlqR1ZHz1i83BUMBcZ8JDY7D7AKnStpnZ8DeXEqbfDdQ9wmZwjtORq7gfgUD/fn6ytKX9eGgA1lDqrL04PfpZKA8ftOflRt09n3fgmQHse41f4tED0LdJ7jtTYvsWj1TWO7ijExN/pvuViJV73Wo5YRv92GoziN7LFALz/FmiXd7yXj3dp0GiL+KuXnkAfgc30jrjjJDlaal0HHxPcaWOxPRAbQPyj4TU/5SONW59goL5runH3wVe+FJl7/8bFMLk1xv7k9TRngVFMaKaTRoN5kChWkLMt5b5T8My9KyDV5BDFRF72rU2zBZPrD6eAb6nTkj2QbipTlREzyv7fUOi/X27Y3e82k4YCI0NBCF6KH4v9A6fX+uUdHhlndQsRtfcIpBzWbSjlrfE8LT/U23en5txEwi2+KwXSdd5mqQI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(39860400002)(396003)(376002)(1800799009)(186009)(451199024)(6862004)(8936002)(4326008)(8676002)(83380400001)(966005)(478600001)(66556008)(6636002)(66476007)(66946007)(6512007)(36916002)(26005)(6486002)(6506007)(6666004)(9686003)(41300700001)(2906002)(316002)(38100700002)(82960400001)(5660300002)(44832011)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2u/tzqaJByn4DwiWp4ju5StSpMmtdB1LOD2zo4h1BA/VCd1r6LHoJPDUf7?=
 =?iso-8859-1?Q?kkOJ7Gtg0JlOGhA65iVgA5/pLC/GFSkoll3lrlRtY43MLyVG+++WT5m7BK?=
 =?iso-8859-1?Q?dZbwr56ajbgWDiDBDrH+hXmP0EAfcwqmTheCz66p9ycyzh5Az25T5Z53Ol?=
 =?iso-8859-1?Q?UIl13SUNIWH2T7jZ3EEt1SiIN5/XgwM412M2yr/vPGpaA9HxT2PiZ2qlfU?=
 =?iso-8859-1?Q?3336LLgNWmDHOqEUYCj3bYQw81/8L2HdgiPVtVBRHp985dILs7k7teGO4h?=
 =?iso-8859-1?Q?uquJEnvRQtHF388dJG5z3KeCn9RDBFzJzchTvJJ1Ga1IMlmPDjbHHG1Jtz?=
 =?iso-8859-1?Q?y8abL3V9zJJefhhrBC9+ZC/66KiqJ1o8/iX0BQwmvIVK7vCPm4Vo3gdbJk?=
 =?iso-8859-1?Q?f8L/SPn/BPJ6ppprgzZ80M1/MPw4dceuWezoPSeKe3zLGnklWDJTrrdR7o?=
 =?iso-8859-1?Q?DXskdgBRatmwDTV6FhkG2k4TqJ/cIYalCwBK5XAojbJufhCs9W7qq+ntVc?=
 =?iso-8859-1?Q?jSP+D04O3U+1wxLYXrVVgKmawe5maXg3+7fEpxd2eIbV1p7L9iy3xSzTWQ?=
 =?iso-8859-1?Q?YbSny41MqtT7cwVqDMhBSaaaawrw5nohvFRuZD1T91w9Ir0FQbvk7G5bAo?=
 =?iso-8859-1?Q?XpArHZ007SqdHRCryjqnU3XdQdhqeejG+ZQguGTg6TcgnTACHlxqx0FKIV?=
 =?iso-8859-1?Q?CPSWdIAOEhTPQplnFP8JXuY28AlibvOVKHP01hafDAMLmv5anegyBc+pH1?=
 =?iso-8859-1?Q?KWVJivVlwYg0FNTFxZY5Ocg9NzgWceHEzoVObJkNIu/FgBhfLRoaOlVne+?=
 =?iso-8859-1?Q?yl3BBY5sz8KhpwLtBJh2qgyJ7d68TIJE5fJqAeztjUOJd4IC5QSE5hiagf?=
 =?iso-8859-1?Q?5n2ThG0Gb5QT3ZyrRTVRB4UhhcU2biOjZgi+2FmcYNmjlBoYO8q0eZ/vmu?=
 =?iso-8859-1?Q?lTk7pAPY9k3UdLMg3WlWk78nV+G/k4uFD1qp8/5G9wel7VlIrmv5mLjR5n?=
 =?iso-8859-1?Q?763NPsSM87JO7kT8wbA7ijeH93THqTYdzTOPg0It8IzpJFQJon4EwmYW3Y?=
 =?iso-8859-1?Q?9seNnFmAMy6rMueOlavTzJGFXvjOW4wknNlc2r7r0LTExEvjvO5bFpPQVf?=
 =?iso-8859-1?Q?X8+2Nu8BMXbbwB6gFSeBBo2fWKOMinXA3PKjRjjOXhiEfBR5FAfAJG9fFo?=
 =?iso-8859-1?Q?vOle4ByVJUbQIZBh5HH9inDu0xWr6oqdmi8FDA1Unnd3SJnGUE5KdlQ3kF?=
 =?iso-8859-1?Q?LJc7P4U0W7rhyDGm1bO6yAnd+ZGFeJ51Guycc+jzLB6Pvxh7u8bJsHCyxG?=
 =?iso-8859-1?Q?cepS8yQcRpyv+20z/RASQfNggG+e4KSxKt5BTFb3KycJsI18gitjPmtvWQ?=
 =?iso-8859-1?Q?LeazoMt0zOByknofG1ksbRb9oVZF4/6kKTDotXvglu8zJYluUMoWPCFjwc?=
 =?iso-8859-1?Q?MpAWIm2d+Uc2VPFOONZnRYdfeVMG/QAdKPztCTJZ4rK/kapKaMRrZnWjWY?=
 =?iso-8859-1?Q?DD9EuZx8fV+S5/19HUdyw4MQ2K4qCMZSJYG3ng1vchoGrrLVxG/2ycCRzn?=
 =?iso-8859-1?Q?ibfrDzF5rGdR2XBbRMPz2zuBllPgkzxZ3Lxr8s5WTtfvLi/Q+tvMP6qJ8Y?=
 =?iso-8859-1?Q?nPC7PidPYyXumesiDXeCeNymRsQsuIwPmB4HEUY1F2htZ5lGBcqMviqw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1947b503-601f-44ef-89ef-08dbaee90df5
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 14:53:39.0269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fq4y3ph5D10Jr/d5It74xyCIbm+BKJIm45vzXp+9g3Iru0WbCEPxxSxvgM/t7uhi1cyFNKRwVj9iCrnsob11TQMFZMkNpKdmg2dFTJXWZlk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6556
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/uapi: Typo lingo and other small
 backwards compatible fixes.
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

On Wed, Aug 30, 2023 at 05:47:14PM -0400, Rodrigo Vivi wrote:
> Fix typos, lingo and other small things identified during uapi
> review.
> 
> v2: Also fix ALIGNMENT typo at xe_query.c
> 
> Link: https://lore.kernel.org/all/863bebd0c624d6fc2b38c0a06b63e468b4185128.camel@linux.intel.com/
> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_query.c |  2 +-
>  include/uapi/drm/xe_drm.h     | 23 ++++++++++++-----------
>  2 files changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 1db77a7c9039..c3d396904c7b 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -195,7 +195,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>  	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
>  		config->info[XE_QUERY_CONFIG_FLAGS] =
>  			XE_QUERY_CONFIG_FLAGS_HAS_VRAM;
> -	config->info[XE_QUERY_CONFIG_MIN_ALIGNEMENT] =
> +	config->info[XE_QUERY_CONFIG_MIN_ALIGNMENT] =
>  		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
>  	config->info[XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
>  	config->info[XE_QUERY_CONFIG_GT_COUNT] = xe->info.gt_count;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 86f16d50e9cc..7c08bedbeeaf 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -256,7 +256,7 @@ struct drm_xe_query_config {
>  #define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
>  #define XE_QUERY_CONFIG_FLAGS			1
>  	#define XE_QUERY_CONFIG_FLAGS_HAS_VRAM		(0x1 << 0)
> -#define XE_QUERY_CONFIG_MIN_ALIGNEMENT		2
> +#define XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>  #define XE_QUERY_CONFIG_VA_BITS			3
>  #define XE_QUERY_CONFIG_GT_COUNT		4
>  #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
> @@ -449,7 +449,6 @@ struct drm_xe_gem_create {
>  	 * If a VM is specified, this BO must:
>  	 *
>  	 *  1. Only ever be bound to that VM.
> -	 *
>  	 *  2. Cannot be exported as a PRIME fd.
>  	 */
>  	__u32 vm_id;
> @@ -489,7 +488,7 @@ struct drm_xe_gem_mmap_offset {
>   * struct drm_xe_vm_bind_op_error_capture - format of VM bind op error capture
>   */
>  struct drm_xe_vm_bind_op_error_capture {
> -	/** @error: errno that occured */
> +	/** @error: errno that occurred */
>  	__s32 error;
>  
>  	/** @op: operation that encounter an error */
> @@ -609,7 +608,7 @@ struct drm_xe_vm_bind_op {
>  	 * caused the error will be captured in drm_xe_vm_bind_op_error_capture.
>  	 * Once the user sees the error (via a ufence +
>  	 * XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS), it should free memory
> -	 * via non-async unbinds, and then restart all queue'd async binds op via
> +	 * via non-async unbinds, and then restart all queued async binds op via
>  	 * XE_VM_BIND_OP_RESTART. Or alternatively the user should destroy the
>  	 * VM.
>  	 *
> @@ -620,7 +619,7 @@ struct drm_xe_vm_bind_op {
>  #define XE_VM_BIND_FLAG_ASYNC		(0x1 << 17)
>  	/*
>  	 * Valid on a faulting VM only, do the MAP operation immediately rather
> -	 * than differing the MAP to the page fault handler.
> +	 * than deferring the MAP to the page fault handler.
>  	 */
>  #define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 18)
>  	/*
> @@ -727,7 +726,7 @@ struct drm_xe_exec_queue_set_property {
>  #define XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		6
>  #define XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		7
>  #define XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY		8
> -	/** @property: property to set */
> +	/** @property: property to be set */
>  	__u32 property;
>  
>  	/** @value: property value */
> @@ -796,7 +795,7 @@ struct drm_xe_exec_queue_get_property {
>  	__u32 exec_queue_id;
>  
>  #define XE_EXEC_QUEUE_GET_PROPERTY_BAN			0
> -	/** @property: property to get */
> +	/** @property: property to be gotten */
>  	__u32 property;

LGTM but as a non-native speaker I am just wondering about the use of "to get"
vs. "to be gotten" in this context (and to a lesser extent "to set" vs. "to be
set") as it seems not to be widely used:

    $ grep -E "@.*to get" . -ir | wc -l
    701
    $ grep -E "@.*to be gotten" . -ir | wc -l
    1

Francois

>  
>  	/** @value: property value */
> @@ -907,7 +906,7 @@ struct drm_xe_mmio {
>  /**
>   * struct drm_xe_wait_user_fence - wait user fence
>   *
> - * Wait on user fence, XE will wakeup on every HW engine interrupt in the
> + * Wait on user fence, XE will wake-up on every HW engine interrupt in the
>   * instances list and check if user fence is complete::
>   *
>   *	(*addr & MASK) OP (VALUE & MASK)
> @@ -1039,9 +1038,11 @@ struct drm_xe_vm_madvise {
>  	 */
>  #define DRM_XE_VM_MADVISE_PRIORITY		5
>  #define		DRM_XE_VMA_PRIORITY_LOW		0
> -#define		DRM_XE_VMA_PRIORITY_NORMAL	1	/* Default */
> -#define		DRM_XE_VMA_PRIORITY_HIGH	2	/* Must be elevated user */
> -	/* Pin the VMA in memory, must be elevated user */
> +		/* Default */
> +#define		DRM_XE_VMA_PRIORITY_NORMAL	1
> +		/* Must be user with elevated privileges */
> +#define		DRM_XE_VMA_PRIORITY_HIGH	2
> +	/* Pin the VMA in memory, must be user with elevated privileges */
>  #define DRM_XE_VM_MADVISE_PIN			6
>  	/** @property: property to set */
>  	__u32 property;
> -- 
> 2.41.0
> 
