Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFBCC83F26
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 22:03:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C8910E1C7;
	Mon, 28 Jul 2025 22:03:09 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FA110E1C7
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 22:03:08 +0000 (UTC)
Received: from [IPV6:2400:2410:b120:f200:a1f3:73da:3a04:160d] (unknown
 [IPv6:2400:2410:b120:f200:a1f3:73da:3a04:160d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id B6F9E3F02F;
 Tue, 29 Jul 2025 00:03:02 +0200 (CEST)
Message-ID: <b2fbfd3e-b0d8-4bf9-8bae-b0a5b2230da7@hogyros.de>
Date: Tue, 29 Jul 2025 07:02:59 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] drm/xe/query: use PAGE_SIZE as the minimum page
 alignment
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, jeffbai@aosc.io,
 Wenbin Fang <fangwenbin@vip.qq.com>, Haien Liang <27873200@qq.com>,
 Jianfeng Liu <liujianfeng1994@gmail.com>, Shirong Liu <lsr1024@qq.com>,
 Haofeng Wu <s2600cw2@126.com>, Shang Yatsen <429839446@qq.com>
References: <20250723074540.2660-1-Simon.Richter@hogyros.de>
 <20250723074540.2660-6-Simon.Richter@hogyros.de> <aId-3AFWP-V10Cfr@intel.com>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <aId-3AFWP-V10Cfr@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

[removed stable@vger from Cc list]

On 7/28/25 22:45, Rodrigo Vivi wrote:

> honest question: if it is vram needing 64k we give 64k alignment, otherwise
> nowadays regardless if it is vram or system memory we give 4k.

It's supposed to be the largest of the requirements, I think. The code 
(kind of falsely) assumes that 64k is the largest we will ever see.

"Kind of", because anything above 64k requires all the ELF files on the 
system to use a larger alignment as well, so we're in "really special" 
territory here.

16k is also a valid CPU alignment on ppc64 and aarch64, so that needs to 
be handled as well.

> what should happen with non-64k vram request on these systems? really give
> the cpu alignemnt or continue with the 4k for gpu?

Depends on whether we want to be able to mmap the vram later, which I 
guess we do.

We could relax this to 4k when actually allocating if 
DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM isn't set, but 
info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] is what Mesa uses to determine 
what size BO to request, and the ioctl handler has

         if (XE_IOCTL_DBG(xe, args->size & ~PAGE_MASK))
                 return -EINVAL;

so setting the query value to PAGE_SIZE is the minimal change that will 
make Mesa do the right thing.

The alternative is to relax the check in the ioctl back to 4k and align 
the size in ___xe_bo_create_locked depending on XE_BO_FLAG_NEEDS_CPU_ACCESS.

    Simon
