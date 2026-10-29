Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE34606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 09:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AbX+BSHo
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52BF91120F6;
	Thu, 29 Oct 2026 09:10:08 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A86421120F6
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 09:10:01 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 4DCEA41766;
 Thu, 29 Oct 2026 09:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ADFB1F01825;
 Thu, 29 Oct 2026 09:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793265001;
 bh=CGMuMKH/+K+X7MMNSUWRUZqUEFf0jPPR4vEanF/nW1k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=AbX+BSHot9gKJczS5ZTZllSAoxNUa/Ez1xigcp4/7+yskWy4OHoynYelSeVtaThZn
 xltcKoNN2IT5+5lei9a6Ms5dODY2HkqvG8m0ahhYSmsht29Ex0jqMwFhJsPnm6VdoU
 tZUYLGpNRvuRtUBQEkSk1+MPUKryzX1GC+nIdKHJb2ksXYULvHp+UW08+Ol8Mckbet
 j67UsVcD0ncMWcidTYYF2VhSyZ1m3Gc5OHcbLPzpQqebPzv7q7xzi19iShGWbQ/CDc
 0V9sm7M47szGKchwHBKtCHeQDfZHqEs13UwaaZA+x2Zvk7nphkrlLMpXhnm7h+Rr9/
 EwIIbrkwoD5FA==
Date: Thu, 29 Oct 2026 10:09:56 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Sk Anirban <sk.anirban@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com, 
 badal.nilawar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com, 
 raag.jadav@intel.com, soham.purkait@intel.com, mallesh.koujalagi@intel.com
Subject: Re: [PATCH] drm/xe: Enable CSC fault injection on CRI
Message-ID: <auMNTq4V1PDJZpoQ@zenone.zhora.eu>
References: <20261022122708.625136-2-sk.anirban@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022122708.625136-2-sk.anirban@intel.com>
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

Hi,

On Thu, Oct 22, 2026 at 05:57:09PM +0530, Sk Anirban wrote:
> Enable CSC fault-injection debugfs on CRI, in addition to Battlemage.
> Preserve the SR-IOV VF exclusion.
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
