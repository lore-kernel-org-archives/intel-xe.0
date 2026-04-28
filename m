Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359E6FF885D
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 13:19:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1A810ECF6;
	Tue, 28 Apr 2026 13:19:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZFG8MF0S";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A6010EC34
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 13:19:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7436C61119;
 Tue, 28 Apr 2026 13:19:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1065C2BCAF;
 Tue, 28 Apr 2026 13:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1777382370;
 bh=lfva2pCj+Ft0QSBNmOa4zc7Q5f3ee6f0DAqf7hE9kNo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZFG8MF0SRBeIm3My7a6VqwdjYhOZ+7fDRzIUtGO1NyfLKpappQLv8/ZWySnUY6BiC
 xSaN2n8eO3lxOfr9ep6O1Gd5BTfgt1bc1yqFHhxy8ytuJESh98NRE86Wdj6b3TMNDF
 jghquMnHjx7/rnw+zK56Iu8F/YthWHeSqOUdlTXHdVWQZIHipuSAAOV8SZRzQVomlx
 TJUsKBzK8lAqphTNtKpwcOMsoe+ZGGLj+Bmjp2wahiruKkqVILpJpXSy8jBWFd6d4m
 a8+jH+MafpDVozlqhevg8RU8yC+9jFb1CNuTpRugAr2SZRXCsFHoZal9GgLixzafrX
 EcHjegZcJgB+Q==
Date: Tue, 28 Apr 2026 15:19:27 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Soham Purkait <soham.purkait@intel.com>
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com, 
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, 
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, 
 andi.shyti@intel.com, rodrigo.vivi@intel.com, anoop.c.vijay@intel.com
Subject: Re: [PATCH v2 1/2] drm/xe/xe_ras: Add types and commands for RAS GPU
 health indicator
Message-ID: <afCzQcBgjLXWRV-R@zenone.zhora.eu>
References: <20260423173925.699486-1-soham.purkait@intel.com>
 <20260423173925.699486-2-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423173925.699486-2-soham.purkait@intel.com>
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

Hi Soham,

...

> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 89456aec6097..fc73e02c3202 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -10,6 +10,21 @@
>  
>  #include "abi/xe_sysctrl_abi.h"
>  
> +/**
> + * enum xe_sysctrl_mailbox_command_id - RAS Command ID's for GFSP group

supernit: /ID's/IDs/

> + *
> + * @XE_SYSCTRL_CMD_GET_HEALTH: Get current health status
> + * @XE_SYSCTRL_CMD_SET_HEALTH: Set new health status
> + */
> +enum xe_sysctrl_mailbox_command_id {
> +	XE_SYSCTRL_CMD_GET_HEALTH = 0x0B,
> +	XE_SYSCTRL_CMD_SET_HEALTH = 0x0C
> +};
> +
> +enum xe_sysctrl_group {
> +	XE_SYSCTRL_GROUP_GFSP = 1
> +};

This is the only enum without comment. Is there any reason?

The rest of the patch looks good!

Thanks,
Andi

> +
>  /**
>   * struct xe_sysctrl_mailbox_command - System Controller mailbox command
>   */
> -- 
> 2.34.1
> 
