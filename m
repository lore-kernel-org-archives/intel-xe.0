Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2221606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 16:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bTZYHQCY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9111C10E0A6;
	Wed, 28 Oct 2026 16:15:28 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5842210E0A6
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 16:15:22 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 692B0601FA;
 Wed, 28 Oct 2026 16:15:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21FF11F01825;
 Wed, 28 Oct 2026 16:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793204121;
 bh=0t8zbBSpkxv08jGLkywQoe0VoB/NRiubFG9TzMtXH2Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=bTZYHQCYQdPZ3fCKv5i+VE0sJrl9G7D7ZRe/oC59ubYN4BefbMnV7elhku+lOW7BX
 D5k04i13fXtIpCjNdx+jeUm8WPf2On9Gi+1F7yfUE88SxSZTTYQrM9tyIiNIizX7sL
 4F0TyBDH4JULJRtAkJtVKfltnkC7mf3OXCgAkqK5wPDpmDDQq0MDUXO1hE7/hpHG6E
 DlpAgAj6eXGw3UcUHaPQDslwFBEJ/qofV2be9CzmgRJzzSQAf+ce+EC242Vp4b27bU
 B15eNNKDxb+s9Xgwj167i2VTApQSc5O/2PHqeBQdp/hmkq47Eg7SgjLAU6wwxu28x0
 1l3x8aBWcg9VA==
Date: Wed, 28 Oct 2026 17:15:17 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com, 
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, 
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, tejas.upadhyay@intel.com
Subject: Re: [PATCH v2 4/9] drm/xe/xe_hw_error: Handle non-fatal errors
 routed via direct IRQ
Message-ID: <auIedl6plynJE3ML@zenone.zhora.eu>
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

Hi Riana,

...

>  static void hw_error_work(struct work_struct *work)
>  {
>  	struct xe_tile *tile = container_of(work, typeof(*tile), hw_error_work.work);
>  	struct xe_device *xe = tile_to_xe(tile);
>  
>  	guard(xe_pm_runtime)(xe);
> +
> +	if (xe->info.has_sysctrl && XE_DEVICE_WA(xe, 14028434957)) {
> +		/* If the device is in reset in AER path, skip processing hardware errors */
> +		if (xe_device_is_in_reset(xe))
> +			return;
> +
> +		xe_ras_process_errors(xe);

also here the return value is completely ignored: we need to
handle the action if we, e.g., receive a
XE_RAS_RECOVERY_ACTION_RESET.

Andi

> +		return;
> +	}
