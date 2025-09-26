Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE1BCAC5AE
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 11:29:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D9910E06B;
	Fri, 26 Sep 2025 11:29:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j4mV0yIo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1309C10E06B
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 11:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758886193; x=1790422193;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=V4Z0snWy4HsO0phhE94nfI/hpg7k41hoIYwA9EfWqrE=;
 b=j4mV0yIoWC/hPMabarbiWemtgeBraMiSyvNvUyNII8x9WyOyDGICGG7x
 aPLtboKb/Uep8HqDWIItxjpPSSlHKjbm/PwihU0E/R8/ZLr5kMTF3XZzQ
 Kk8wi+eweHJxxMT1hvw0MuFepQPcljgbaxuLai+5zQTwQ7Qk0/OqOSSF/
 jb8Hpq16dlEIxfesGdAAFYvgOJt0hvDMkXVco3jyqFxYfMTbS7GVrEGsB
 c10MW7JUC0imLM5UjgtuAAEj37fGDDYTYFVV/94dsOXsBTnDI8189pNlH
 uYl249H4+Vlg0/iqSZ9ux/tfaLMDQt3lkKElXe0qDJP3OA8qGUqCs0ea+ A==;
X-CSE-ConnectionGUID: xuQ4Q6N4TRS32qLK6sbSCQ==
X-CSE-MsgGUID: gFA4FBlxSXOLpDQNww6Jjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="64849206"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="64849206"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 04:29:52 -0700
X-CSE-ConnectionGUID: QrjYuKbwSEu5Sj8cGNZcKQ==
X-CSE-MsgGUID: qYZ/O71sSV+bntEmquWI0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="214723031"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.10])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 04:29:49 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, carlos.santa@intel.com, matthew.auld@intel.com,
 Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Subject: Re: [PATCH v4 5/9] drm/xe: Handle xe_user creation and removal
In-Reply-To: <20250926104521.1815428-6-aakash.deep.sarkar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250926104521.1815428-1-aakash.deep.sarkar@intel.com>
 <20250926104521.1815428-6-aakash.deep.sarkar@intel.com>
Date: Fri, 26 Sep 2025 14:29:45 +0300
Message-ID: <af4ebce25316d1068ed98e51a382fa963347205d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 26 Sep 2025, Aakash Deep Sarkar <aakash.deep.sarkar@intel.com> wrote:
> diff --git a/drivers/gpu/drm/xe/xe_user.h b/drivers/gpu/drm/xe/xe_user.h
> index e52f66d3f3b0..b13130cc9492 100644
> --- a/drivers/gpu/drm/xe/xe_user.h
> +++ b/drivers/gpu/drm/xe/xe_user.h
> @@ -8,8 +8,12 @@
>  
>  #include <linux/kref.h>
>  #include <linux/list.h>
> +#include <linux/mutex.h>
>  #include <linux/workqueue.h>
>  
> +#include "xe_device.h"

The changes in this patch don't require adding either of those
includes. Avoid including headers from headers if you can get away with
forward declarations.

BR,
Jani.

> +
> +
>  /**
>   * This is a per process/user id structure for a xe device
>   * client. It is allocated when a new process/app opens the
> @@ -43,6 +47,11 @@ struct xe_user {
>  	 */
>  	struct work_struct work;
>  
> +	/**
> +	 * @id: index of this user into the xe device users array
> +	 */
> +	u32 id;
> +
>  	/**
>  	 * @uid: user id for this xe_user
>  	 */
> @@ -61,7 +70,8 @@ struct xe_user {
>  	u64 last_timestamp_ns;
>  };
>  
> -struct xe_user *xe_user_alloc(void);
> +int xe_user_init(struct xe_device *xe, struct xe_file *xef, unsigned int uid);
> +
>  
>  static inline struct xe_user *
>  xe_user_get(struct xe_user *user)

-- 
Jani Nikula, Intel
