Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21E2EC01B7
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 09:50:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884A410E3E3;
	Mon, 23 Mar 2026 09:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BAI0K2QG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D54F10E036;
 Mon, 23 Mar 2026 09:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774259440; x=1805795440;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HPhRPnZrJa/aFoVGb2wgWEu7n0TMCDeJLSxmQe15z4o=;
 b=BAI0K2QGODpUOAbBIQYojd+OlD95c1Q+DTPmcp2mPlVwm5dyHM/ynvVi
 eLgG5MnZhRmDugzQ5OwBv9jIVFIeATulbJPEjaL5P+5gQKVVvnxsN4ZtX
 aO300YXJBwGi2aIcqv2EBJxamG2nbZwMKCkyxt81zBR1qHyUoq+KF8IAa
 li5IKWr6hPg+UWsNkkGiCmySO7BjerDZeXQjtA7FB9tZApwAygZcUq5gi
 o5/jMmiqPGUjSFsTflYd6pfdDfdnPc6Hx29+5/wSYrE3xpbl643PzsUCn
 0vQOG9OuGGtDYSmLxRJVLsNxsRSA2UuLLXZwqk+ifMFkKXA83lWVcJNIW g==;
X-CSE-ConnectionGUID: Ka3VjPiHTEiGH1kUCGLatg==
X-CSE-MsgGUID: SZR4vkz6RVaQgr7m/y+SNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75373978"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="75373978"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:50:40 -0700
X-CSE-ConnectionGUID: 0KWwIYbYR7uO/79Ilrk1OA==
X-CSE-MsgGUID: n3aE2pTDTj+YF8b8i9UXSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="254450982"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.55])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:50:37 -0700
Date: Mon, 23 Mar 2026 11:50:34 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 3/3] drm/i915/de: Implement register polling in the
 display code
Message-ID: <acEM6tm9cdDDN7oh@intel.com>
References: <20260313111028.25159-1-ville.syrjala@linux.intel.com>
 <20260313111028.25159-4-ville.syrjala@linux.intel.com>
 <c642aab2724d1db478cdcd3af623117e6f9dad5c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c642aab2724d1db478cdcd3af623117e6f9dad5c@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Fri, Mar 13, 2026 at 05:03:16PM +0200, Jani Nikula wrote:
> Another difference between i915/xe and poll_timeout_us() is the range
> for usleep_range(), which is *also* different from fsleep().
> 
> i915/xe have:
> 
> 	usleep_range(wait__, wait__ * 2);
> 
> iopoll has:
> 
> 	usleep_range((__sleep_us >> 2) + 1, __sleep_us);

I was pondering about this a bit and came to the conclusion that
what poll_timeout_us() does with the usleep_range() is a bad idea.
We might have some crappy hardware/firmware (*cough* pcode *cough*)
that doesn't like to be polled too frequently, so it seems much more
sensible to provide the minimum polling interval rather than the
maximum. Also the maximum won't be the actual maximum anyway due to 
random scheduling delays/etc. So I think we probably need to change
the behavior of poll_timeout_us() if we want to actually use it...

-- 
Ville Syrjälä
Intel
