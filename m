Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F22D59F5D
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 18:20:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A93E10E1FC;
	Wed,  6 Nov 2024 18:20:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CI6oUEgb";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7593410E1FC;
 Wed,  6 Nov 2024 18:20:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C44C05C3F42;
 Wed,  6 Nov 2024 18:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0665DC4CEC6;
 Wed,  6 Nov 2024 18:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730917241;
 bh=8G4O4dEtP6Bo3rEClOZ0cMEjXqTB7M09ZeIdHwMKGJA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CI6oUEgbzBdNEoQTZ6DNY7g81Q1DxYs3Rvu60LDGJFxcHJo0Jvmj+oyzKEE1681Zn
 NXF0BZPTBMdRZVV3kOpU/liXrCs6kT8UllX1enH3IWMy/etzd73oOC4WGBWGdaeORX
 AjXYScrdgIV1mMYT9g8SRt15NkxQntvkZv65EDz+qv5L+9l4kOWi+BeBq+yTAG5X4b
 tIONYjD92Q7csM9zCTA4WTfRca2bZxCTNUw+KYRN5Bf6aKuuSFxZ+hJ/mHHuOy8W+F
 GJwR6aVrvA7CWAlruOZW1lqgNlQmytHaRPQkyvaCX+uUW/U3KmGbUi/fm038rHdrsN
 b9TzQn+uRjTPQ==
Date: Wed, 6 Nov 2024 08:20:40 -1000
From: Tejun Heo <tj@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Zefan Li <lizefan.x@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Friedrich Vock <friedrich.vock@gmx.de>, cgroups@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH 0/7] kernel/cgroups: Add "dev" memory accounting cgroup.
Message-ID: <ZyuzeIhTgXU5CCk0@slm.duckdns.org>
References: <20241023075302.27194-1-maarten.lankhorst@linux.intel.com>
 <ZxlRLMwkabTaOrjc@slm.duckdns.org>
 <20241024-beautiful-spaniel-of-youth-f75b61@houat>
 <Zxp-nLXOJXoSy8BN@slm.duckdns.org>
 <20241028-meaty-mega-nuthatch-3d74b1@houat>
 <20241029203834.GA636494@cmpxchg.org>
 <20241106-vivacious-eagle-of-gaiety-44a419@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106-vivacious-eagle-of-gaiety-44a419@houat>
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

On Wed, Nov 06, 2024 at 11:31:49AM +0100, Maxime Ripard wrote:
...
> > How about dmem for this one, and dpu for the other one. For device
> > memory and device processing unit, respectively.
> 
> dmem sounds great to me, does everyone agree?

Sounds good to me.

Thanks.

-- 
tejun
