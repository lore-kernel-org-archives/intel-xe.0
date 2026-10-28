Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43DF606A321
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 16:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BRzupJHs
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DDE910E0E0;
	Wed, 28 Oct 2026 16:20:06 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D9810E0E0
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 16:20:00 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id C81FA43764;
 Wed, 28 Oct 2026 16:19:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF791F01825;
 Wed, 28 Oct 2026 16:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793204399;
 bh=Pk5aJm6r49Y+5Z1yC2x4w0xSBRdKZeaq3KhjUNItQPE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=BRzupJHs5DE3Ghw8ZzyX3BgrvJ8JSKuR1jjaTxHemr5oyYPqWua53kuYXeLa2w++H
 xIeh5Z57ERd1m22DeBXhq5D5jCp0p2WcWbH/K2vQ99xhRGcQk5ejeV95EjU6r6vChs
 goDTehg+QUzLcNKR5EkkaioNjJDFyA5BtPq7kZguxqCc2zglpAR7Sh8Kxk1kmWIQLD
 ci8aogPMc+UCjdK91JU/xD4vDf4lS7XGa1n4iWzwiZzS0Yib+/gdYP1lO5RNpWwLwk
 xqhQPe3sq8/aCCHMxca1W3DAdOlcRZSwdzaY3P1rAWR7fQnXVMDc44Pe0MJPTc9W/G
 T7wUeR4yHlKnw==
Date: Wed, 28 Oct 2026 17:19:56 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com, 
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, 
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, tejas.upadhyay@intel.com
Subject: Re: [PATCH v2 6/9] drm/xe/pci: Add upstream switch port lookup helper
Message-ID: <auIgkNGz2oliaZGD@zenone.zhora.eu>
References: <20261026060459.771448-11-riana.tauro@intel.com>
 <20261026060459.771448-17-riana.tauro@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026060459.771448-17-riana.tauro@intel.com>
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

On Mon, Oct 26, 2026 at 11:35:05AM +0530, Riana Tauro wrote:
> Move the USP lookup logic out of RAS code and into the PCI
> layer so it can be reused by other callers.
> 
> No functional change.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
