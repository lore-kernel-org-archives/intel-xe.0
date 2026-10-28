Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047B5606A31D
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 16:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QjwYNaNI
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C43D510E0E0;
	Wed, 28 Oct 2026 16:17:18 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE00010E0E0
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 16:17:12 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 78B6441577;
 Wed, 28 Oct 2026 16:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63E0A1F01825;
 Wed, 28 Oct 2026 16:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793204232;
 bh=geyGxWmFoPPBJn0vvcdZJ6mdgeutJkWb6yk5KRWIc0s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=QjwYNaNI4jWf1hN0u/xsjoM24a/c03lsy/4W7ytFy9m1sZTE4NdpxU9ndE7CeaJHb
 hC6QVfFuBW3oXnb5+FH8VKxTd/RPnvDuU6pGG0dHTcMaZmteidJhnFWBeC02P6R2pY
 PN+LGcI6hfFcwQCdA0ClQU07p/QzjGiAi4N8TLEJdp0olCcfjm9LRglVsre9EJYZFf
 OPEOsDoSOgzVUQg+sO4EwERbjOxgxFvpheDJr08Dw7OUVN5y2/WVAxYP43JTIYQl9k
 8VQGXPyGefCPsI0+mqYYC3fLwmuESOysUv8q1GPONkGCPk6Ra20W9U8E2lXqZUo/Py
 qHZZW2zVInrWw==
Date: Wed, 28 Oct 2026 17:17:08 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com, 
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, 
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, tejas.upadhyay@intel.com
Subject: Re: [PATCH v2 4/9] drm/xe/xe_hw_error: Handle non-fatal errors
 routed via direct IRQ
Message-ID: <auIf1k9MOd63oVee@zenone.zhora.eu>
References: <20261026060459.771448-11-riana.tauro@intel.com>
 <20261026060459.771448-15-riana.tauro@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026060459.771448-15-riana.tauro@intel.com>
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

One more question here...

...

>  	/*
> -	 * Hardware errors are reported through System Controller on the platforms that
> -	 * support it, and never routed as direct IRQ to SGUnit. So we should never be
> -	 * here for those platforms.
> +	 * Non fatal errors are routed as a direct IRQ on platforms that support
> +	 * system controller.
>  	 */
>  	if (xe->info.has_sysctrl) {
> -		drm_err_ratelimited(&xe->drm, HW_ERR "Invalid error routing\n");
> +		drm_err_ratelimited(&xe->drm, HW_ERR "%s %s reported\n", hw_err_to_str(hw_err),
> +				    severity_str);
> +		schedule_delayed_work(&tile->hw_error_work, msecs_to_jiffies(MSEC_PER_SEC));

why are we waiting one second here? How did you choose this time?

Andi
