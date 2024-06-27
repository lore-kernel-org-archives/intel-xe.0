Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA272C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 13:49:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED9910E531;
	Fri, 28 Jun 2024 13:49:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="CRRBpB3g";
	dkim-atps=neutral
X-Greylist: delayed 384 seconds by postgrey-1.36 at gabe;
 Thu, 27 Jun 2024 18:54:32 UTC
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com
 [91.218.175.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9577810EB1D
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 18:54:32 +0000 (UTC)
X-Envelope-To: maarten.lankhorst@linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1719514085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Av9FqovsUOP0h53igKSF4jPKQsdgFn0YopTV64fIgIY=;
 b=CRRBpB3ggXRq1QDcE297/5Kp/kIrT/zzm8p3YYiuwvOqmGDASLFeXhdjLiAN5/Hh3pHQOC
 xtKS4G7SWzx40mmGVlXQxxrzPDwEvOt41vPEcMHd3qqjtp8vidle4isCt1pYW7KNmYE0ap
 dyzwQIqS6gKYG4IDHQ6NlMnjLZKnIPs=
X-Envelope-To: intel-xe@lists.freedesktop.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: tj@kernel.org
X-Envelope-To: lizefan.x@bytedance.com
X-Envelope-To: hannes@cmpxchg.org
X-Envelope-To: akpm@linux-foundation.org
X-Envelope-To: mhocko@kernel.org
X-Envelope-To: roman.gushchin@linux.dev
X-Envelope-To: muchun.song@linux.dev
X-Envelope-To: friedrich.vock@gmx.de
X-Envelope-To: cgroups@vger.kernel.org
X-Envelope-To: linux-mm@kvack.org
Date: Thu, 27 Jun 2024 11:48:00 -0700
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Andrew Morton <akpm@linux-foundation.org>,
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
 Muchun Song <muchun.song@linux.dev>, Friedrich Vock <friedrich.vock@gmx.de>,
 cgroups@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH 1/6] mm/page_counter: Move calculating protection
 values to page_counter
Message-ID: <xedzkn5fs2adz4ea3njugasxlt46637mgz6dbzho7ywzykfbxn@l3dc7c2nbzrq>
References: <20240627154754.74828-1-maarten.lankhorst@linux.intel.com>
 <20240627154754.74828-2-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627154754.74828-2-maarten.lankhorst@linux.intel.com>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Fri, 28 Jun 2024 13:49:41 +0000
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

On Thu, Jun 27, 2024 at 05:47:20PM GMT, Maarten Lankhorst wrote:
> It's a lot of math, and there is nothing memcontrol specific about it.
> This makes it easier to use inside of the drm cgroup controller.
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

You can send this patch independent to the series.

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
