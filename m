Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24143606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 16:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ac+PP3kU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2D710E092;
	Wed, 28 Oct 2026 16:25:38 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B65B810E645
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 16:25:32 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 7FFFD435EC;
 Wed, 28 Oct 2026 16:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FAEB1F01825;
 Wed, 28 Oct 2026 16:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793204732;
 bh=xOiLZBa+786i3dcNNMnreNjYYcTRIG3doS6deKWkExU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=ac+PP3kUf/ozqOec27yOi2z8xDnWia5B/yMFAUWTjIz/7cEnPwS4pW6a5Ox+A/MHK
 gvTA2hRglERMf51CsMrT6uTpbMu0Pe+jcB7lMPjqKC4Rq4LCXbbM2vY2lB+nwygwBQ
 Uy0BoorSeL2+PLSl2uutLhyJwXS0BIRnCLCAUUwM1xVcshP0I6tM3hnlPm9jn0ymrm
 vsRF1ujixIlmVJgFr4oymOk9stJ5LkJ+iMBQEv67OxWrMtLIP6387nwv+slCcUzdPZ
 t2wr/Ef7huIqxjBhBtNiHqNpVMK/Qy8dk7ULyCi6f8ScH8AVv6AVuxPeobb1e08GEK
 XdAzHhfrEM0wA==
Date: Wed, 28 Oct 2026 17:25:28 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com, 
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, 
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, tejas.upadhyay@intel.com
Subject: Re: [PATCH v2 8/9] drm/xe/xe_ras: Trigger SBR for all device errors
Message-ID: <auIh1NUP_0f-9QX4@zenone.zhora.eu>
References: <20261026060459.771448-11-riana.tauro@intel.com>
 <20261026060459.771448-19-riana.tauro@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026060459.771448-19-riana.tauro@intel.com>
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Riana,

On Mon, Oct 26, 2026 at 11:35:07AM +0530, Riana Tauro wrote:
> There are two paths for error reporting. Uncorrectable non-fatal device
> errors are reported via direct IRQ. Uncorrectable device fatal errors are
> downgraded as non fatal uncorrectable internal errors and reported as AER.
> Set the default action to Secondary Bus Reset (SBR) for device fatal
> uncorrectable errors.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
