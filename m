Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B369E7C4E5
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 17:11:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7269310E3A0;
	Wed,  4 Oct 2023 17:11:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F6510E3A4
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 17:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696439483; x=1727975483;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=P2JYYcd+EV5wmPLUcSFv6i1bcbPX1XbdH6VZZfvvBso=;
 b=UWTrM0mpmeRe9IKEkpVMfMvfYc+fXpikkgWCof1m7hMsHipPEOwzGydM
 vRl3JkgUNyJNe697EtDXf7QscZ+gsprxMRv6PXejMy6bx8eTHyYeJp3pZ
 DC97gLLbkIAPVasZXLQH57BuWYlRYJMQdauSVAlcQG/l1HeUorSWxQ1yg
 XwfEVtIpFAP6VD7mle5mXsEHoDl6sGns9XgBPQFgcpbBj8/VmtpHUBFC9
 ULl/CvsC8VcFKfyVnnBd/UQ0CBK6pRno+B3T1zyNN3/lv9WMxQfjsMGAH
 ojPOzARyiNT8PRH4pNRY1pedGqVP8x7zA9Ikz/4uB1bkQMMd6ClYGad0E g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="414152110"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="414152110"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 10:11:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="745047292"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="745047292"
Received: from msterni-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.56.48])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 10:11:20 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
In-Reply-To: <diaa7nf3l6b5qsczyxto5ftyrcdrx2l3kec7wauoen57hy7dus@bxvldjcc5yyr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1696343521.git.jani.nikula@intel.com>
 <e40596b157f7689f2870b074b7a1cdd9696f70a4.1696343521.git.jani.nikula@intel.com>
 <diaa7nf3l6b5qsczyxto5ftyrcdrx2l3kec7wauoen57hy7dus@bxvldjcc5yyr>
Date: Wed, 04 Oct 2023 20:11:18 +0300
Message-ID: <87zg0ycnyh.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 08/10] fixup! drm/xe/display: Implement
 display support
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
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 04 Oct 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Tue, Oct 03, 2023 at 05:34:55PM +0300, Jani Nikula wrote:
>>Turn the enable_display module parameter to the same thing as it is for
>>i915: assuming you have display hardware, take over it, put it to sleep,
>>and keep connectors disconnected.
>
> that was not what it was created for and it was on purpose. That is not
> what we need when enabling a platform. The argument that *users* would
> then be left in a situation that the display hardware is still consuming
> power is IMO wrong as those *users* are not supposed to be using module
> parameters and if they do, it's their only responsibility.
>
> The module parameter here is for kernel developers and CI/validation,
> particularly when enabling a new platform, to decide if the display side
> should be enabled or not.

If you have a module param without the _unsafe annotation, and the only
documentation is "enable display", it *is* for users.

If you want to have a module param that's for development or debugging
only, make it _unsafe, and add documentation to that effect.

In any case, what's currently in the tree is conflated and broken, and
this is/was an attempt to fix it. It's impossible to integrate xe with
i915 display if the xe has different notions on the basic idea of what
having or enabling display means.

BR,
Jani.

-- 
Jani Nikula, Intel
