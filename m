Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DE4C61D99
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 15:58:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE6210E2F6;
	Wed, 22 Nov 2023 15:58:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10CD110E2F6
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 15:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700668726; x=1732204726;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=g7OnIKyNPKm+w+Gl3ulKNq+wr4dtHK4jaZSVfPEDcUA=;
 b=lYaWTDmY9t/Il+hwrdTwVYX3mb62TCnp8Tfv0fISoU360ms7ftjBtlgf
 OBBjlnVXiqr6iO4AYNQh3vTOcuaFmPIhqQIvFZTjYRSUXMlv3gxnUcmmg
 ip2WqH72Jwq8VtNV10oWPNVFEQnWgGpLZOk/fxieVBgQNhWzTBKD9YMIL
 jaJidlTiODiS/7rdRZxdte2OtY0L5KdXGXSKIvzWbh9L4ZglzysmYdhIH
 6WYlJ7dLZELMS6GidhExLb8QcSD49ro/3jnU1G7OeaNbV0e6N7VK4hTR/
 UkudlwrugQ4WXTZNl24w5VEMqcm+/Ne+6tZdsCpPEGHC40PIVoyRvk62/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="5282266"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="5282266"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 07:58:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="837468404"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="837468404"
Received: from aconradi-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.221.156])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 07:58:44 -0800
Date: Wed, 22 Nov 2023 16:58:41 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Message-ID: <ZV4lMfD0b37rhb7j@ashyti-mobl2.lan>
References: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
 <20231106111845.2333093-4-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231106111845.2333093-4-mika.kuoppala@linux.intel.com>
Subject: Re: [Intel-xe] [RFC 03/25] drm/xe/eudebug: Introduce exec_queue
 events
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

Hi Dominik and Mika,

On Mon, Nov 06, 2023 at 01:18:23PM +0200, Mika Kuoppala wrote:
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> 
> Introduce exec_queue events.

I love exec_queues, I love them more when they are properly
introduced.

> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

which doesn't prevent you from reviewing this patch.

...

> +static int exec_queue_create_event(struct xe_eudebug *d,
> +				   struct xe_file *xef, struct xe_exec_queue *q)
> +{
> +	int h_c, h_vm, h_queue;
> +	u64 h_lrc[XE_HW_ENGINE_MAX_INSTANCE];
> +	int i;
> +
> +	h_c = find_handle(d->res, XE_EUDEBUG_RES_TYPE_CLIENT, xef);
> +	if (h_c < 0)
> +		return h_c;
> +
> +	h_vm = find_handle(d->res, XE_EUDEBUG_RES_TYPE_VM, q->vm);
> +	if (h_vm < 0)
> +		return h_vm;
> +
> +	h_queue = xe_eudebug_add_handle(d, XE_EUDEBUG_RES_TYPE_EXEC_QUEUE, q);
> +	if (h_queue < 0)
> +		return h_queue;
> +
> +	for (i = 0; i < q->width; i++) {
> +		int h = xe_eudebug_add_handle(d,
> +					      XE_EUDEBUG_RES_TYPE_LRC,
> +					      &q->lrc[i]);

please, important assignments need to be separate from the
declaration.

> +		if (h < 0)
> +			return h;
> +
> +		h_lrc[i] = h;
> +	}
> +
> +	/* No need to cleanup for added handles on error as if we fail
> +	 * we disconnect
> +	 */

this comment is misplaced and not properly formatted.

Anyway, for -EEXIST and -ENOTCONN, you don't really fail, I think
those need to be checked and treated separately. If -EEXIST, I
believe the correct behavior should be 'continue', rather than
'return'.

> +	return send_exec_queue_event(d, DRM_XE_EUDEBUG_EVENT_CREATE,
> +				     h_c, h_vm, h_queue, (u16)q->class,
> +				     q->width, h_lrc);
> +}
> +
> +static int exec_queue_destroy_event(struct xe_eudebug *d,
> +				    struct xe_file *xef, struct xe_exec_queue *q)
> +{
> +	int h_c, h_vm, h_queue;
> +	u64 h_lrc[XE_HW_ENGINE_MAX_INSTANCE];
> +	int i;
> +
> +	h_c = find_handle(d->res, XE_EUDEBUG_RES_TYPE_CLIENT, xef);
> +	if (h_c < 0)
> +		return h_c;
> +
> +	h_vm = find_handle(d->res, XE_EUDEBUG_RES_TYPE_VM, q->vm);
> +	if (h_vm < 0)
> +		return h_vm;
> +
> +	h_queue = xe_eudebug_remove_handle(d,
> +					   XE_EUDEBUG_RES_TYPE_EXEC_QUEUE,
> +					   q);
> +	if (h_queue < 0)
> +		return h_queue;
> +
> +	for (i = 0; i < q->width; i++) {
> +		int h = xe_eudebug_remove_handle(d,
> +						 XE_EUDEBUG_RES_TYPE_LRC,
> +						 &q->lrc[i]);
> +
> +		if (h < 0)
> +			return h;

why not continue?

Andi

> +		h_lrc[i] = h;
> +	}
> +
> +	return send_exec_queue_event(d, DRM_XE_EUDEBUG_EVENT_DESTROY,
> +				     h_c, h_vm, h_queue, (u16)q->class,
> +				     q->width, h_lrc);
> +}
