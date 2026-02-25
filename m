Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DA4F55431
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 00:22:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8608710E012;
	Wed, 25 Feb 2026 00:22:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ge0AiJIv";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87DC10E012;
 Wed, 25 Feb 2026 00:22:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A013C60051;
 Wed, 25 Feb 2026 00:22:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8666EC116D0;
 Wed, 25 Feb 2026 00:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771978925;
 bh=ynS84/0PMmxwKi16uvPa1XSyB0im66wxPhqSCK6S0ds=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ge0AiJIvBbl8tSOzxzpG6pDDxdakdYHxj/SGqI3iokbedOLglImYp+KS38hGNLx0a
 aM4z068jN6vU+r6rQx96V354L/n0avRsXMP61aiek7Wk/sTQI/b/qtcaYXPMNI4jIj
 pUvPi6m8MfYfGpMMgEMs1mEvyNGFgZsjTHt2fO9tuWmafIKW9JNw94xJZSonkwZQhO
 N7N+6eS2Ypj6Qedc00oqWRi1T7HC9ThxHiXUEdpSGv68DZ7fIpzGbprS9+eBwESEDG
 WBdNBdDQRHLx2jz2FBUpPSykRhJDOHutCVc2UfCQYFN0Xags6ULJmM8vzqnJm5JvDH
 ICcFRdvLF48gQ==
Date: Tue, 24 Feb 2026 16:22:03 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, ravi.kishore.koppuravuri@intel.com,
 raag.jadav@intel.com, anvesh.bakwad@intel.com, Zack McKevitt
 <zachary.mckevitt@oss.qualcomm.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, "David S. Miller"
 <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet
 <edumazet@google.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v8 1/5] drm/ras: Introduce the DRM RAS infrastructure
 over generic netlink
Message-ID: <20260224162203.279f7b74@kernel.org>
In-Reply-To: <20260223060541.526397-8-riana.tauro@intel.com>
References: <20260223060541.526397-7-riana.tauro@intel.com>
 <20260223060541.526397-8-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Mon, 23 Feb 2026 11:35:41 +0530 Riana Tauro wrote:
> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Introduces the DRM RAS infrastructure over generic netlink.
> 
> The new interface allows drivers to expose RAS nodes and their
> associated error counters to userspace in a structured and extensible
> way. Each drm_ras node can register its own set of error counters, which
> are then discoverable and queryable through netlink operations. This
> lays the groundwork for reporting and managing hardware error states
> in a unified manner across different DRM drivers.

Family itself LGTM.

I'm getting this diff when running regen:

diff --git a/drivers/gpu/drm/drm_ras_nl.c b/drivers/gpu/drm/drm_ras_nl.c
index 4714a574a143..8bc85eab751f 100644
--- a/drivers/gpu/drm/drm_ras_nl.c
+++ b/drivers/gpu/drm/drm_ras_nl.c
@@ -7,6 +7,8 @@
 #include <net/netlink.h>
 #include <net/genetlink.h>
 
+#include "drm_ras_nl.h"
+
 #include <uapi/drm/drm_ras.h>
 #include <drm/drm_ras_nl.h>
 

Is there a reason why drm_ras_nl.h is in the global include/ path and
not in drivers/gpu/drm/, directly? This header is meant to be used
just between the generated C code (which is mostly structs at this
point) and the C source implementing the family. We haven't had any
use case which would require making it global so generator doesn't
support that.

The source needs to be clean after regen, so we either need to move 
the header in this patch or I can send you a patch to add a new
generator feature to override the header location. LMK.
