Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFB6103E2F7
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 00:29:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 316F910E1AF;
	Thu, 12 Mar 2026 00:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kspXrAFA";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0100A10E1AF;
 Thu, 12 Mar 2026 00:29:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7F96E408E8;
 Thu, 12 Mar 2026 00:29:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF247C4CEF7;
 Thu, 12 Mar 2026 00:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773275353;
 bh=IoR6lqedT9ZLR/3Sp34HdPCvvTBO8x+GArpju4CwWa8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kspXrAFAbogg3zaGMyeN7CcnfHo/BsvM4ffIYWlFDykGHvOy0wTuwpFgeCJo017oA
 EqGftW69oUQH+g/b69shg8LVok3mdp4ctYFd9p8hfJMdUPj/iPUWWzp4S6bvAET15z
 Ivx3rQIfLK3v8O5yunbRR43gAeg2shU3H73ryRjzLDLambkg7Tk5mRpDhWbNiB+6Dg
 mBVhs5TIHeHf/T669KC0MLbfYLoNOFXNEo+2jGTkmT66sJikwOrfwmI9iFyGdUgC0R
 N2NHfaK/zppW+eDdGD4NQprTfw3sDXBCRJUQobHtmZrZ4hLNdttCkc/vOerru+aUOM
 kuJTxu4B3cZ6A==
Date: Wed, 11 Mar 2026 17:29:07 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, simona.vetter@ffwll.ch, airlied@gmail.com,
 pratik.bari@intel.com, joshua.santosh.ranjan@intel.com,
 ashwin.kumar.kulkarni@intel.com, shubham.kumar@intel.com,
 ravi.kishore.koppuravuri@intel.com, raag.jadav@intel.com,
 anvesh.bakwad@intel.com, maarten.lankhorst@linux.intel.com, Zack McKevitt
 <zachary.mckevitt@oss.qualcomm.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, "David S. Miller"
 <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet
 <edumazet@google.com>
Subject: Re: [PATCH 1/4] drm/drm_ras: Add clear-error-counter netlink
 command to drm_ras
Message-ID: <20260311172907.0ac81a25@kernel.org>
In-Reply-To: <20260311102913.3387468-7-riana.tauro@intel.com>
References: <20260311102913.3387468-6-riana.tauro@intel.com>
 <20260311102913.3387468-7-riana.tauro@intel.com>
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

On Wed, 11 Mar 2026 15:59:15 +0530 Riana Tauro wrote:
>  Documentation/gpu/drm-ras.rst            |  8 +++++
>  Documentation/netlink/specs/drm_ras.yaml | 13 ++++++-

Reviewed-by: Jakub Kicinski <kuba@kernel.org>
