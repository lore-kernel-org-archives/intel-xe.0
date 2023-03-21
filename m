Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F35C7618D
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 11:15:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D6710E08B;
	Tue, 21 Mar 2023 11:15:58 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F90C10E08B
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 11:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679397356; x=1710933356;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=IfrxQaQrtUgBGIjrh+P8DWnoP98TtRocMcX5DQNCgyc=;
 b=ducjN+iWQ4hgQIoD9Mwb/TNWhVxQN9758NgSIH8Rio2MUOLRnWS9AQ4G
 PqNZKAqp8h2XnLwj1u2bsKfS9Cm5jehmreakWhAGA3Vq12S/H38u18RNK
 WpqBxoXtAzytqNK3oo42VuI+Rnw5yroEUK0EiDe+3tMubCyRiah0ZDPLb
 DTosFY5eP0Cm/fyTYqARfqCOubPu13UMc06PwUOMiM7ZpfZKUYVSK0QWi
 Dy1ChYenrBGztY0znIAYJ+PRi3Qasc99EB4x1TNXMpqs0wT6usrADISDD
 ultC0rDDag7pnO+cRJEXvgmi1vb220LtfSE/k4lkwACM0yyYawdQL31xd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="327285967"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="327285967"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 04:15:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="674801448"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="674801448"
Received: from trybicki-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.119])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 04:15:54 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20230321104529.157616-2-matthew.auld@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230321104529.157616-1-matthew.auld@intel.com>
 <20230321104529.157616-2-matthew.auld@intel.com>
Date: Tue, 21 Mar 2023 13:15:52 +0200
Message-ID: <87fs9y8idz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH v7 1/2] drm/xe/buddy: add visible tracking
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 21 Mar 2023, Matthew Auld <matthew.auld@intel.com> wrote:
> +	XE_BUG_ON(min_page_size < mm->chunk_size);
> +	XE_BUG_ON(min_page_size > SZ_2G); /* FIXME: sg limit */
> +	XE_BUG_ON(size > SZ_2G &&
> +		  (vres->base.placement & TTM_PL_FLAG_CONTIGUOUS));
> +	XE_BUG_ON(!IS_ALIGNED(size, min_page_size));

Hijacking the thread, sorry. ;)

If we are supposed to not replicate i915-ism, why do we have
XE_BUG_ON()?

I think it's an anti-pattern.

Currently XE_BUG_ON() is just BUG_ON(), which should not be used for any
reason. Not even CI. The plan in i915 is to migrate all of them to
WARN_ON()'s and use panic_on_warn in CI.

The other thing is that having BUG_ON() in the name gives you the false
impression that it's sufficient for input (or any precondition)
validation. In i915 it gets conditionally built for CI only. So we catch
errors in CI but not in actual production use. You just plunge on.

Part of it is just naming. The BUG_ON() association is pretty strong for
any kernel developers. If it were called XE_ASSERT() it would have an
association with assert() that does what XE_BUG_ON() actually is: code
is only generated for debug builds.

In i915 it has become habitual to sprinkle GEM_BUG_ON() all over the
place, just in case, belt and suspenders. IMO there's not enough
discretion about what can and can't actually happen, and what can and
can't happen in CI vs. production.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
