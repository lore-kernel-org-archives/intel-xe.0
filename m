Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A36C61DB2
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 12:50:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6940D10E249;
	Fri, 13 Jun 2025 12:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="F3wHEAZk";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD53910E249
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 12:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P37eNgMsepwWvNAqyEjlYPIMepU+1skvXs7vomXoF7g=; b=F3wHEAZkfikFUssz0JZHJX4tKL
 07jGZSA+523o6VK3vfNrprGeLTn1HNh0EKDvmOI+YHxRk1ZFEM+rcF/mBzK8JVKvJEzYyW6J+ed1Z
 gOCaQNxw2hlHXup7or+EkdHYT6OtltTeo/y7Y8yJk2+QAM8YWxbroI7ykTWyW4g+dXqAJeM3bgGhk
 LwFroi3Lbx7B8mnsKZ/Ra6Hx0Svdhs1UZhvTuXupb/Y4movHZ9uU1o7TPVrWOop18V+lAzcszHgcl
 Uu+pq1Mfuqfld++irVyMojuwEufn2PDHQV1YpPCehONwfxh0P+sF5JFIHvmi/b0KYTfzB+DH0vBnB
 ETuDLFUg==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uQ3rb-0031Gl-Uw; Fri, 13 Jun 2025 14:50:32 +0200
Message-ID: <53ea0d8a-02e8-414a-b54a-8962716e742a@igalia.com>
Date: Fri, 13 Jun 2025 13:50:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] More missing XeLP workarounds
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
References: <20250613124159.65636-1-tvrtko.ursulin@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250613124159.65636-1-tvrtko.ursulin@igalia.com>
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


On 13/06/2025 13:41, Tvrtko Ursulin wrote:
> Some more missing XeLP workarounds. This time including some which need to go
> into indirect context, which also means some plumbing had to be added.
> 
> Includes a fix to use iosys helpers for existing wa bb emission since there is a
> code dependency on it.
> 
> v2:
>   * Use iosys helpers.
>   * Split indirect context plumbing as a separate patch.
>   * Tweak where and how Wa_16010904313 is emitted.
>   * Move Wa_18022495364 into the wa_bb.
> 
>   v3:
>    * Rewrite on top of Lucas' wa bb changes - use same infrastructure.

Scratch this, I did not spot 3a1edef8f4b5 ("drm/xe: Make WA BB part of 
LRC BO") has sneaked in while I was reworking this. Stay tuned for v4.

Regards,

Tvrtko

> 
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> 
> Tvrtko Ursulin (8):
>    drm/xe: Clarify LRC size when allocating
>    drm/xe: Generalize wa bb emission code
>    drm/xe: Support writing at offset in workaround batch buffer emission
>    drm/xe: Return number of written dwords from workaround batch buffer
>      emission
>    drm/xe: Allow specifying number of extra dwords at the end of wa bb
>      emission
>    drm/xe: Add plumbing for indirect context workarounds
>    drm/xe/xelp: Implement Wa_16010904313
>    drm/xe/xelp: Add Wa_18022495364
> 
>   .../gpu/drm/xe/instructions/xe_mi_commands.h  |   1 +
>   drivers/gpu/drm/xe/regs/xe_engine_regs.h      |   3 +
>   drivers/gpu/drm/xe/regs/xe_lrc_layout.h       |   4 +
>   drivers/gpu/drm/xe/xe_lrc.c                   | 231 +++++++++++++++---
>   drivers/gpu/drm/xe/xe_lrc_types.h             |   5 +-
>   drivers/gpu/drm/xe/xe_wa_oob.rules            |   2 +
>   6 files changed, 212 insertions(+), 34 deletions(-)
> 

