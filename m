Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE0C0C5B543
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 12:02:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3D110E526;
	Tue, 10 Jun 2025 12:02:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kYk9mdgA";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D16310E518;
 Tue, 10 Jun 2025 12:02:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D0F0661120;
 Tue, 10 Jun 2025 12:02:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33499C4CEEF;
 Tue, 10 Jun 2025 12:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749556941;
 bh=w6ffsrTbltuqyJUoHj7X5zhybMNF6AXKNq6ddxPOe8s=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=kYk9mdgAKaPFQssSaVQmO/fZkEngI7QSxH4yzkwzOQqNY30EEGinZHdiuKD3zfVQu
 YxY2Stmr0I29ssVanyLvmLjw5xNAC7Ft1cwbVv85U/ZlEmxUBFRadEqsuc7uapFHbK
 dN+mdRb4xlp3pzs9Ygqo6f0+gp7c4QqSii6o8Uh9WbQDxsglpZzv8FwVSEhaIEtwa9
 /yehNvnCwW+NMxmCREnculCAiDC4K+RP7THlxrp1WtXHA8osBb5WDpI4yTApATzev0
 h/JBAmvGKDER81l75hgV5t/ztGxbKeSASitKvaELcmBoc+uGKesAE84VZFVe05FwYJ
 fwHC5uAkI+1+w==
Message-ID: <570bc3667c18264c77eab0e7880bb676@kernel.org>
Date: Tue, 10 Jun 2025 12:02:18 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Subject: Re: [PATCH 4/4] drm/i915/panel: sync panel prepared state at register
In-Reply-To: <a33e4fe5e9970aed9c4aef8c426c00a189149c32.1749199013.git.jani.nikula@intel.com>
References: <a33e4fe5e9970aed9c4aef8c426c00a189149c32.1749199013.git.jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, simon1.yang@intel.com, "Doug
 Anderson" <dianders@chromium.org>,
 "Heikki Krogerus" <heikki.krogerus@linux.intel.com>, "Lee
 Shawn C" <shawn.c.lee@intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Wysocki Rafael J" <rafael.j.wysocki@intel.com>
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

On Fri, 6 Jun 2025 12:05:12 +0300, Jani Nikula wrote:
> If the panel is enabled at probe, and we take over the hardware state,
> the drm_panel prepared state will be out of sync. We'll need to notify
> drm_panel framework about the state at probe, so it can in turn notify
> the panel followers.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
