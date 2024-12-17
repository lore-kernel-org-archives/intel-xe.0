Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D53E7717F
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 17:11:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F6C10E41D;
	Tue, 17 Dec 2024 17:11:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="r7e6Ky0X";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3966A10E41D;
 Tue, 17 Dec 2024 17:11:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1BCD65C65B1;
 Tue, 17 Dec 2024 17:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C84EDC4CED7;
 Tue, 17 Dec 2024 17:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734455461;
 bh=fWEKQkxXI884vG+WF4qLVHpsT7vM3EElPdmXZ5tnPrI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r7e6Ky0X5QW7vVRBN3FDwoKg+K/J3+YB7JETZWQdy/reod6qL10Z3Zz1xE9c+SafF
 dcb53XesfsCBLt411HlUfmfkK0Ux4NCwN20GZWYtfE0JP7fANUdxHsoiWUGaC2c0Ov
 VuNX65kVwM6AtY1zumfEQErppZ+E7NpU1hEi5ekJ+G05/DaifNK4BSUA79WHXemtb5
 6NP4qyNX6WbhycT2kxk3T67x6m+idCj76G5ubK7D6ReDAX5kgCgXObmJ7r8y4mUihD
 knish44Q5fMeULq55tljoYm6uIbRiLBvAfK7OLjKzBclCLsIWY+SkobffKgkFzsPnu
 82OZ0/fBrF3ag==
Date: Tue, 17 Dec 2024 07:11:00 -1000
From: Tejun Heo <tj@kernel.org>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Friedrich Vock <friedrich.vock@gmx.de>, cgroups@vger.kernel.org,
 linux-mm@kvack.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2 0/7] kernel/cgroups: Add "dmem" memory accounting
 cgroup.
Message-ID: <Z2GwpOQDVshpv-ml@slm.duckdns.org>
References: <20241204134410.1161769-1-dev@lankhorst.se>
 <20241213-proud-kind-uakari-df3a70@houat>
 <80c49a80-d49c-4ca5-9568-9f7950618275@lankhorst.se>
 <20241213-gentle-glittering-salamander-22addf@houat>
 <5a50a992-9286-4179-8031-ffb514bca34f@lankhorst.se>
 <20241217-meek-bullfinch-of-luck-2c3468@houat>
 <a69a3500-be17-4899-bdb9-c6a63bf8dc81@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a69a3500-be17-4899-bdb9-c6a63bf8dc81@lankhorst.se>
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

On Tue, Dec 17, 2024 at 03:28:50PM +0100, Maarten Lankhorst wrote:
> Now that all patches look good, what is needed to merge the series? Without
> patch 6/7 as it is a hack for testing.

There were some questions raised about device naming. One thing we want to
get right from the beginning is the basic interface.

Thanks.

-- 
tejun
