Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC79ACD6E57
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 14:40:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB64113419;
	Mon,  1 Jun 2026 14:40:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="mlm/tXEd";
	dkim-atps=neutral
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B37F10F699
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 22:28:02 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-516d6009380so741cf.0
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 15:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1780007281; x=1780612081;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gVpTGabkogMhFDXFQqGwv1xAtmXdvvWNz/fIztc8SkQ=;
 b=mlm/tXEd5t/cKWtAsY4YO2wkZJUzKUnjPpF75jmP2F2JMpW7/s8lIQxb4SnI+WxdHg
 vJ0KU8ChcZmc3vPJApUAcxOg5sMfdoTuq/VX2S3487HfYyVtPO8c0leVvmUi+GuRZgkM
 HmY+plffzDerciiphKrl2KrnQT5ENm80CejkmF542+0KiKUcX5XjljqFpdvpus3AvPCz
 Wqp2i0YU9Z+AuaV6G0i/pFI+IHW4AOqMyDPSqG/5iFjMuwSrFNH4IPtPHe56b9WBFyeA
 lW7HvLGHJz41/sFaKbCvSbeDKubJkiPvWFRhnXdkYU7wTg8D+1neOSjBH0pIIOhdcN8U
 MGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780007281; x=1780612081;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gVpTGabkogMhFDXFQqGwv1xAtmXdvvWNz/fIztc8SkQ=;
 b=TCqW0QB5VikyfACd4GjLoprGO6Pb9kaPWdLzOViANfkF/YpXgbgqZrixYX4dlpiGwu
 JL6vn8phzPBGoGYL10OHPlOc5zyLUArq15GSDseJWJh4Lt6tmYiHDR8YxrV/UlgJUW07
 Aq0TPRyPW9+0goditDskt4SSC4+sQ/2U0sLVXP40q5eA5bKq1AT1hMnvYI2qxzcY45aq
 vB93h+jdq4GngHYXs0wgS4E6p0PIWgWDFFWxj5QJeCC0DsLR8j7oAZ/nRj/Vkhj0S6mm
 rjx5rH36BPd9Gl6gIKHyWrgk90M2EwXpfgl3IVnBjnOUKXpPTl7Q74+vh8GK4xFA9gxP
 /P9Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ+zEcICiIAS1eUrapLtf2rxlb63rGOwjKcQpWndDKw0zaVIOBqanm84TRhZdI35Dciv5rChPGmZ9Q==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2KeXEJxmkdiolNHyv9JBNWZ0IyQjZIpDpkJkh3iHeCVijFJw/
 EFD/yrdYOmqbv5qrfFRUdSKIcvsBvBpKrzTW4K9EHdkUGJX4FwfXRE3gZOLqZBxjLg==
X-Gm-Gg: Acq92OGh65KxBGTREIaaIY3HrS3WqQhOg+SSKBL+eR/8oNfJMtt/LcW93yi0fVB7n2l
 YRDl3+Db8ShvWn3pXouAMejl/Z7XWFRmL5OzxtdRsNluoCdDcXCp1Vag0T5s5E8jzMNXZmvIAAN
 q8fMsd229Av1gWEmNZmm1jzRLb/DzF0ECQ/7NbhpYw/bOoFU7hUbX9d8N2lLtsggihyZuUu0iSG
 QWVb2v/JjAfSvu0r0mkXs0x3gto0k3zH3bet3e0UPqiu2N7fKfqevaLKcvKyXbUAF0H5TSbdxOh
 ziTCn5rl02MzzeaN7BxPbNE4yhggW0R/L5VW3FyrYPFyPjk90sphW1ZQOAvvjOsi4go5CZkRntZ
 1K0go3EOhKz/i+ABtMr9afOZOjDof+Galhq1Pboa7jG5gHDxkOiLFKcwRVsNIcxnwbPuQTsGriI
 5dhsaeHZlGyBJFTSA1OL00LTWeQ49JejfMyghtAtigTTXx8/ANpDSGQ+qJHN8HWKOsmYDFzzUIe
 X26//KpWGJrGgVDcdq0M9gkZwzgVAK5qP9PJjh6xIG5jPJY+x5/pARZNlCkmdxDPJnr8WX4+P9H
 MZTe2tvWNq/kRQ==
X-Received: by 2002:a05:622a:8c1a:b0:50e:5c9d:49c7 with SMTP id
 d75a77b69052e-5172df5a778mr1238301cf.7.1780007280921; 
 Thu, 28 May 2026 15:28:00 -0700 (PDT)
Received: from google.com (236.10.48.34.bc.googleusercontent.com.
 [34.48.10.236]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-7d389813ee6sm93608657b3.2.2026.05.28.15.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2026 15:28:00 -0700 (PDT)
Date: Thu, 28 May 2026 22:27:57 +0000
From: Brian Geffon <bgeffon@google.com>
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, uma.shankar@intel.com,
 pranay.samala@intel.com, radford@google.com, gildekel@google.com,
 seanpaul@google.com
Subject: Re: [PATCH v3 0/4] More Fixes for color pipeline
Message-ID: <ahjBbUwF_8jcXKHY@google.com>
References: <20260511053213.3122314-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260511053213.3122314-1-chaitanya.kumar.borah@intel.com>
X-Mailman-Approved-At: Mon, 01 Jun 2026 14:40:04 +0000
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

On Mon, May 11, 2026 at 11:02:09AM +0530, Chaitanya Kumar Borah wrote:
> v3:
> - Re-arrange patches

We've been impacted by this on PTL devices. Ray has tested and can
provide more details.

In the meantime can we ask that a maintainer take a look?

> 
> v2:
> - Make dependency on atomic state more explicit (Ville)
> - handle blobs in hw state clear
> 
> Chaitanya Kumar Borah (4):
>   drm/i915/display: Copy color pipeline from plane in the primary joiner
>     pipe
>   drm/i915/display: Don’t use atomic state back-pointer to derive color
>     pipeline
>   drm/i915: Avoid programming color HW blocks for NV12 Y planes
>   drm/i915: Fix color blob reference handling in intel_plane_state
> 
>  drivers/gpu/drm/i915/display/intel_cursor.c   |  2 +-
>  .../drm/i915/display/intel_initial_plane.c    |  2 +-
>  drivers/gpu/drm/i915/display/intel_plane.c    | 77 ++++++++++++++-----
>  drivers/gpu/drm/i915/display/intel_plane.h    |  5 +-
>  4 files changed, 61 insertions(+), 25 deletions(-)
>

Thanks!
Brian

> -- 
> 2.25.1
> 
