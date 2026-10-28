Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81AC606A323
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 16:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eCpxN6aS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC8910E0A6;
	Wed, 28 Oct 2026 16:07:37 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E2910E0A6
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 16:07:31 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 42BBC42A28;
 Wed, 28 Oct 2026 16:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D79C1F01300;
 Wed, 28 Oct 2026 16:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793203651;
 bh=4Jd0MQtSU+iNnvgnfQ+ErbfDty8nF1pBKMLGOgsfwBM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=eCpxN6aSY9VOejvKZ/qcN71tvSAvdS9CrUpSARr9xEOgG3cfJHYKwHcvQz5ZNTDcP
 PJEFipxdKObhGgZ/WKfpDpZUvTkPi6LvBNlZ2oLI+HygERkqaLH1zBfl2vdquXm6vE
 wWFgQIq7JtHR1k+a2NLaOKsQxUznjXt0XLTuknztWrcdqmJEwbQsfmWHDG8ACyyymj
 uxTNYvzyZvhFIXLST9W3M8dyGb3qPB5ytWmbgbHKNtdmPZKtJW2jg0Ri3G9xtPrsp9
 Bpml62Beft7OWbH46VviSDIn06rNOF4LrAVwtvudZHegvS64+aBWidZ8iVBpe41J7F
 Sia38B4rNuDXQ==
Date: Wed, 28 Oct 2026 17:07:27 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com, 
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, 
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, tejas.upadhyay@intel.com
Subject: Re: [PATCH v2 2/9] drm/xe/hw_error: Initialize hw_error_work per tile
Message-ID: <auIW6DsRRyZ0GWnz@zenone.zhora.eu>
References: <20261026060459.771448-11-riana.tauro@intel.com>
 <20261026060459.771448-13-riana.tauro@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026060459.771448-13-riana.tauro@intel.com>
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

Hi Riana,

...

>  void xe_hw_error_init(struct xe_device *xe)
>  {
> -	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	struct xe_tile *tile;
> +	u8 id;
>  
>  	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>  		return;
>  
> -	INIT_DELAYED_WORK(&tile->hw_error_work, hw_error_work);
> +	for_each_tile(tile, xe, id)
> +		INIT_DELAYED_WORK(&tile->hw_error_work, hw_error_work);
>  
>  	process_hw_errors(xe);
> +	devm_add_action_or_reset(xe->drm.dev, xe_hw_error_work_disable, xe);

we are ignoring the return value of devm_add_action_or_reset().
Perhaps we can make xe_hw_error_init() an int function.

Andi

>  }
