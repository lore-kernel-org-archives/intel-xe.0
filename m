Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6DCC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 11:18:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A870510E6DB;
	Thu,  8 Aug 2024 11:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="inLBnQhH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D2E10E6DB
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 11:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723115928; x=1754651928;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CHUdZleWR+rcvDq4cGUO/bXGCwL7PvEFCAjaO0kXyaY=;
 b=inLBnQhH1atp4VdC8ARRiudvM1pKqC3z3BWeEMpkufH8wdm1dREdUcmt
 Jw4eSOfYSXNMfSsVWh/2X7i9gA4SMtjfYUj8dBxfpNtKj3mwK4mHQyVbH
 aZuwlF39cGLKVE8+FM82s+BDKzTCMV6NqoyAqJxcfJmwkaE8mS8bVneyI
 efINxSKLumyGNEhpfcAy86Krq+K9ilcYMSVTR48wIULH68FENBBlSDc6J
 kiakQcXP/tm4ckXTey4TFMAxZxX7TLl1NZjRzWMVeM9uUyqnou3NbQ3Ma
 4Xrz7VYUQY0R26eN0lDUKErdxS6mHjvpJ9WNb0Jln/hxtL0toAawcoIlw A==;
X-CSE-ConnectionGUID: wol4aniSRhKVehos4o7zEg==
X-CSE-MsgGUID: ti0zgYBtQd+bT386R09jQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21385546"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="21385546"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 04:18:47 -0700
X-CSE-ConnectionGUID: OFo6o8OPTMGBSHwC4sDrWQ==
X-CSE-MsgGUID: KoG7srcIQfuhMvAnbBsDkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="57428728"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.245.71])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 04:18:44 -0700
Date: Thu, 8 Aug 2024 12:18:40 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 04/21] kernel: export ptrace_may_access
Message-ID: <ZrSpkNEuKNx9sK4s@ashyti-mobl2.lan>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
 <20240726140818.54304-5-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726140818.54304-5-mika.kuoppala@linux.intel.com>
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

Hi Mika,

On Fri, Jul 26, 2024 at 05:08:01PM +0300, Mika Kuoppala wrote:
> We need to export ptrace_may_access to be able to
> allow debugger connection to check for debuggee access and
> at the same time allow xe.ko module build.
> 
> CC: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> CC: Andi Shyti <andi.shyti@intel.com>
> CC: Maciej Patelczyk <maciej.patelczyk@linux.intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

Just one note here: the tag order matters a little, the signature
of from the sender should take the last place.

> ---
>  kernel/ptrace.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/kernel/ptrace.c b/kernel/ptrace.c
> index d5f89f9ef29f..86be1805ebd8 100644
> --- a/kernel/ptrace.c
> +++ b/kernel/ptrace.c
> @@ -354,6 +354,7 @@ bool ptrace_may_access(struct task_struct *task, unsigned int mode)
>  	task_unlock(task);
>  	return !err;
>  }
> +EXPORT_SYMBOL_GPL(ptrace_may_access);

I also believe, as suggested, that we should seek an ack from the
maintainers here. Maybe we could have CC'ed just for this single
patch. (You can add people in CC even after the '---' section not
to pollute the commit log. This way you let git-send-email handle
it).

Nevertheless, same as I agreed earlier:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi

>  static int check_ptrace_options(unsigned long data)
>  {
> -- 
> 2.34.1
