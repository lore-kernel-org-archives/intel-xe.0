Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EC2606A320
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 15:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z4BwSSBj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E809B10E653;
	Wed, 28 Oct 2026 15:07:47 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED46710E653
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 15:07:41 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 2577860120;
 Wed, 28 Oct 2026 15:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B619D1F01828;
 Wed, 28 Oct 2026 15:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793200060;
 bh=PdAyeZ2GdQDqvTjLmx0jtJT1IMjgSwZpK7CfOvGdMF8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=Z4BwSSBjXCYcK8/VY0jPp7a2XO9ERdx7FynW5Mt9bKVdVkUQjQWpZ/2+1CO2iz/JM
 UouAVGRhLFOr8EBq/COZuc6d3DtsPN34sCbajYt1Qquj5/STxRWaeHFfyiqf6+Wn8R
 31hGjhL9cHiSgrlqbbq4Wyb6/GC8tn46Z+FkMuft4jk/bs6QUuNQBGk7zALQk1pn1z
 dkyAXgH14Td1LoagW3AaYYNfznN0LDmZ4BcaVWdfa9OyLW+d/D7aA7GgGBJqm/bkmt
 s9O3N9vMt7mD3WJRkxdNw/PddEJDKymZ7Vxxgx/B9ZInlxO/dFySi+eGCvlS0ScNjh
 W4rAc+67LBoyQ==
Date: Wed, 28 Oct 2026 16:07:36 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, 
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe: Add a per-client debugfs file reporting bo NUMA
 node distribution
Message-ID: <auHk62MFrf-H4tms@zenone.zhora.eu>
References: <20261028103237.70129-1-thomas.hellstrom@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261028103237.70129-1-thomas.hellstrom@linux.intel.com>
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

Hi Thomas,

On Wed, Oct 28, 2026 at 11:32:37AM +0100, Thomas Hellström wrote:
> When debugging NUMA placement of bo system memory, there is currently
> no way to tell on which nodes the pages backing a bo reside. The
> /proc/<pid>/numa_maps interface doesn't help since bo CPU mappings are
> VM_PFNMAP, and clients may have thousands of bos, so a dump of all bos
> is undesirable.

...

> Example:
>   exec 3<>/sys/kernel/debug/dri/client-<id>/bo_numa
>   echo <handle1> >&3
>   cat <&3
>   echo <handle2> >&3
>   cat <&3
>   exec 3>&-
> 
> The client id can be obtained from the drm-client-id fdinfo key.
> 
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Assisted-by: LLM

Please drop the Assisted-by and add your SoB :-)

...

> +	do {
> +		kvfree(buf);
> +		bufsize *= 2;
> +		buf = kvzalloc(bufsize, GFP_KERNEL_ACCOUNT);
> +		if (!buf) {
> +			ret = -ENOMEM;
> +			goto out_unlock;
> +		}
> +
> +		iter = (struct drm_print_iterator) {
> +			.data = buf,
> +			.remain = bufsize,
> +		};
> +		p = drm_coredump_printer(&iter);
> +		ret = xe_bo_print_numa_info(file, handle, &p);
> +		if (ret)
> +			goto out_free;
> +	} while (!iter.remain);

this is basically

	} while(drm_coredump_printer_is_full(&p));

The rest looks good to me.

Andi
