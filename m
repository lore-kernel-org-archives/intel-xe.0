Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4524FC021B2
	for <intel-xe@archiver.kernel.org>; Sat, 22 Feb 2025 12:42:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA67510E352;
	Sat, 22 Feb 2025 12:42:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="D+pH9DQO";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7863810E352
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Feb 2025 12:42:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4D7265C569C;
 Sat, 22 Feb 2025 12:41:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31EDBC4CED1;
 Sat, 22 Feb 2025 12:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740228147;
 bh=dlNurf6J/kF6jwdjyszmwDsz+iXM2ZJ+Sue3Mwroilc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D+pH9DQOXkxhQeEh+Ai6/XFiHNKLwNubwX/mHikU5yCIGNXSGur8XtPtfCNjtiAW2
 4nONXV+Pl9vj1oH0lwUA6GXI8ExTLfVT5HCgsPiLAippGOGVy90snc0krkRT+dnyEo
 qJgWlMooAOkhfdLz3P17m3Hh+JXHtlifflerO9psToO835MyZz8YECVTHj4PKjv2Yh
 wIvhe3VZjRynplNpJi0Iz+yNuNGLM+NdkwRN/UVD52ytYjcOoJABClElec37WOh76m
 1mWYMHp6zP0465OyWU0C1p2SjWezCbbVYfl9c5lJKCoB0ekSvA5CDJcPb1+mkRW+vI
 Grb+lQYZoipCw==
Date: Sat, 22 Feb 2025 13:42:18 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v14 1/7] perf/core: Add PMU_EVENT_ATTR_ID_STRING
Message-ID: <Z7nGKlY509BxgyUn@gmail.com>
References: <20250122062341.1100173-1-lucas.demarchi@intel.com>
 <20250122062341.1100173-2-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122062341.1100173-2-lucas.demarchi@intel.com>
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


* Lucas De Marchi <lucas.demarchi@intel.com> wrote:

> struct perf_pmu_events_attr has both id and event_str however zeroes
> the id and only set event_str. Add another macro that allows to set both
> so drivers can make use of them. The id is useful for determining the
> visibility of the attributes without resorting to creating separate
> groups passed via update_attr, while the event_str is still useful for
> attributes like *.unit or *.scale.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  include/linux/perf_event.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo
