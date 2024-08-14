Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFF7C3DA4A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 19:12:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A9910E526;
	Wed, 14 Aug 2024 19:12:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bB5iQ2JD";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB5010E525;
 Wed, 14 Aug 2024 19:12:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C916361BC5;
 Wed, 14 Aug 2024 19:12:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 158DCC116B1;
 Wed, 14 Aug 2024 19:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1723662741;
 bh=MxWVFVGMu8yeZFa1Q/ovILbgW1opbuMIzYsgxtugszI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bB5iQ2JDXAxlojsRpOLf+rBymIfn8Fw/b2M4Zwt2mt7UGRFJXzsMOFftRmHihEuXA
 oq8nAaveXQZdF/ai5SIMK9EI7+61NbQ0jtOfcEGacEwBK7qMlLZdF3AcnI6+qw7KdB
 lCQwbKZg23ZugXUKrKPjv8N9i25zG1sEjxJea16g=
Date: Wed, 14 Aug 2024 12:12:20 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 akinobu.mita@gmail.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org
Subject: Re: [PATCH 1/3] fault-inject: improve build for
 CONFIG_FAULT_INJECTION=n
Message-Id: <20240814121220.adcbbc0db20c6821a05da11e@linux-foundation.org>
In-Reply-To: <87cymbzj50.fsf@intel.com>
References: <20240813121237.2382534-1-jani.nikula@intel.com>
 <20240813192450.9aff86552e06a48924b7bbc1@linux-foundation.org>
 <87cymbzj50.fsf@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

On Wed, 14 Aug 2024 09:57:31 +0300 Jani Nikula <jani.nikula@intel.com> wrote:

> > Removing a nested include exposes all those sites which were
> > erroneously depending upon that nested include.  Here's what I have
> > found so far, there will be more.
> 
> Right. I didn't hit them with the configs I tried... though I wonder why
> not, especially lib/fault-inject.c puzzles me.
> 
> How do you want to proceed? Arguably uncovering and fixing those places
> is good, but that's kind of an unintended consequence here.

Is OK, it's a good change.  I fixed everything which my usual build
testing covers.  Other things will be reported and I'll fix those also.
If you have time to eyeball the 36 files which include fault-inject.h
then that would help things along.

