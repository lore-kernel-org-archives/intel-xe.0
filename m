Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7EB2C369D9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 18:51:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 837F410E0A1;
	Wed, 30 Apr 2025 18:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IKZzvfXn";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9FD10E0A1
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Apr 2025 18:51:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 60BDE5C5411;
 Wed, 30 Apr 2025 18:49:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 277C5C4CEE7;
 Wed, 30 Apr 2025 18:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746039081;
 bh=WxRBc7gQUW1/n1rxYLI87+eRnwvtnLn4tQbnKhpju08=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IKZzvfXn5shwyIJG+ep7foEGXFKmO+T5z0Vqtkxg91y9NgoAYsfxVwBdUQKs+L+Kb
 aOb0mGV4F2r8Fs1sVyEN6Ll1veIHnXiPOFmF7Q8cD5rrRLJI0WAc/cM3YuSAF/RMvR
 EuNyaVwv8GgY3dlm4A1SsL3UX4DE3pkL4nfTBW1u08seOADe/otV6SUPTl55+lP2z0
 c5y6vBLuSrOXdleEaG6zTffT7MGDNWJeL0RAplVX9r9IEVevFy+LTbC+7fJV9ywMMO
 wWO+Ct3in0J6+oZ7U0wZZrdH5k+Sth43Svm05Syj7Twy7ovOZWPKemei/f/a1VE+mJ
 PnNEtuLhjndKQ==
Date: Wed, 30 Apr 2025 11:51:18 -0700
From: Kees Cook <kees@kernel.org>
To: Harish Chegondi <harish.chegondi@intel.com>
Cc: intel-xe@lists.freedesktop.org, ashutosh.dixit@intel.com
Subject: Re: [PATCH 1/1] drm/xe/eustall: Use copy_from_user() instead of
 __copy_from_user()
Message-ID: <202504301151.81F35C4@keescook>
References: <c8b410629c1825f5b16537974a3cee11b2d911f2.1745989733.git.harish.chegondi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8b410629c1825f5b16537974a3cee11b2d911f2.1745989733.git.harish.chegondi@intel.com>
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

On Tue, Apr 29, 2025 at 10:11:11PM -0700, Harish Chegondi wrote:
> copy_from_user() has more checks and is more safer than
> __copy_from_user()
> 
> Fixes: 1537ec85ebd7 ("drm/xe/uapi: Introduce API for EU stall sampling")
> Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>

Thanks!

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook
