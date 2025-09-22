Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83176CA100F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 18:28:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3759C10E13B;
	Mon, 22 Sep 2025 18:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mY9mgklH";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F3610E13B
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 18:28:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A402C44D18;
 Mon, 22 Sep 2025 18:28:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D86DC4CEF0;
 Mon, 22 Sep 2025 18:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758565717;
 bh=CtXv+R6iAlZW62kHx4mvRdzMvmB9GMmmeZkvV3T4gNM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mY9mgklHJ2bbnmR5oqvSjp7yHIOrpCJlEoPeERuxWmHPPAaSfluGnZGWh8qo7mkS2
 G65BSKgOUodgjPJshVxxerGOk5NJj9SGhY+oTqoV52+AvToKb7azjzGveZ4osMDmJb
 WJDV2c/eFEFQFOHsqZFXgvN6UsulJsBgwmq9GPJQmgYKDbUkuPX1PNWiA0JgvA2UES
 Ov4m5oDD81ct94YRLzoIZhztJwBPicV80IY80h4kbQOVTwR2BzSC6Ssa1GQIy2z0hB
 ejjdLU8T87Ty8lyrGe7jWb8Ei0UhwtngCiuaxH0GFqj5GFQw6h7vvyuk4orDvmC+nU
 JDexX6ZbDAung==
Date: Mon, 22 Sep 2025 11:28:32 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 DRM XE List <intel-xe@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Zongyao Bai <zongyao.bai@intel.com>
Subject: Re: linux-next: manual merge of the drm-xe tree with the drm-fixes
 tree
Message-ID: <20250922182832.GA1542561@ax162>
References: <aM1QX4eEaSRQX6Dl@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aM1QX4eEaSRQX6Dl@sirena.org.uk>
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

Hi Mark,

On Fri, Sep 19, 2025 at 01:45:19PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the drm-xe tree got a conflict in:
> 
>   drivers/gpu/drm/xe/xe_guc_submit.c
> 
> between commit:
> 
>   ff89a4d285c82 ("drm/xe/sysfs: Add cleanup action in xe_device_sysfs_init")
> 
> from the drm-fixes tree and commit:
> 
>   fb3c27a69c473 ("drm/xe/sysfs: Simplify sysfs registration")
> 
> from the drm-xe tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc drivers/gpu/drm/xe/xe_device_sysfs.c
> index b7f8fcfed8d86,c5151c86a98ae..0000000000000
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@@ -308,19 -290,15 +290,15 @@@ int xe_device_sysfs_init(struct xe_devi
>   			return ret;
>   	}
>   
> - 	if (xe->info.platform == XE_BATTLEMAGE) {
> - 		ret = sysfs_create_files(&dev->kobj, auto_link_downgrade_attrs);
> + 	if (xe->info.platform == XE_BATTLEMAGE && !IS_SRIOV_VF(xe)) {
> + 		ret = devm_device_add_group(dev, &auto_link_downgrade_attr_group);
>   		if (ret)
>  -			return ret;
>  +			goto cleanup;
>   
> - 		ret = late_bind_create_files(dev);
> + 		ret = devm_device_add_group(dev, &late_bind_attr_group);
>   		if (ret)
>  -			return ret;
>  +			goto cleanup;
>   	}
>   
> - 	return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
> - 
> - cleanup:
> - 	xe_device_sysfs_fini(xe);
> - 	return ret;
> + 	return 0;
>   }

This resolution breaks the build.

  drivers/gpu/drm/xe/xe_device_sysfs.c: In function 'xe_device_sysfs_init':
  drivers/gpu/drm/xe/xe_device_sysfs.c:300:25: error: label 'cleanup' used but not defined
    300 |                         goto cleanup;
        |                         ^~~~

I think those should just be 'return ret', as it appears that
fb3c27a69c473 already includes ff89a4d285c82, so I think you can just
take the right side of the conflict wholesale.

Cheers,
Nathan
