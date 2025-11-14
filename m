Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A63CDE006
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 05:25:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F89E10E220;
	Fri, 14 Nov 2025 05:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mw9Ea3eK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573E910E220
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 05:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763097921; x=1794633921;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=i15UC9z87s+BwQI4y28S/fvFf04ZI88GcXB+t053TBU=;
 b=Mw9Ea3eK/E3xx0oQvF+4XXumJt5vN5aiWko8cQHD4bm1R2tNmYBoxyV3
 /fOzHmjEKkLMdupbquvoq9VB2HXGVcZIVfzukDBhgylTZwZpT3Lgbb/Ln
 rvxPRhib7jg28oZc+z9lAmc1jq9eQg7ArPXaIvMm0g4EFWmmu9ndlAkwz
 jVH1pBIsSP8380y6IncsmKOU4RNLCqGFzHTfzRTDR0sXxr6RxwH/or3fQ
 t66mynq9Kmw2GEVgl4W1In3KtkJR6+s4u52zwdOpFrdFBggORhH/FYaki
 Optwyr+IyJ+LYMXhJoAfQwPdB0+K8AcGzUkJWQ5m3AESJJbThhqNqocO/ g==;
X-CSE-ConnectionGUID: nD1V88JLQj2lHpV9xEYGUQ==
X-CSE-MsgGUID: aEIQhhGJQmu8ypSzgwrPyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65228440"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="65228440"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 21:25:21 -0800
X-CSE-ConnectionGUID: HCflsD+rS0WMls/eGYUQrw==
X-CSE-MsgGUID: l8fCzfOrT2mw7FtwKfJRVg==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 21:25:19 -0800
Date: Fri, 14 Nov 2025 06:25:16 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 badal.nilawar@intel.com
Subject: Re: [PATCH v2] drm/xe/pcode: Convert unsupported commands to debug
 level
Message-ID: <aRa9PL9qmh_1qqxL@black.igk.intel.com>
References: <20251107055746.110055-1-raag.jadav@intel.com>
 <b4f677ximgoni5pzf6bsh6kkchh52fy6drckbiasqsaekvnzbj@o3rkfqwcg6or>
 <aQ3xItyGMVnKdzoi@intel.com> <aRSdenIjmrfTaw8U@black.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aRSdenIjmrfTaw8U@black.igk.intel.com>
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

On Wed, Nov 12, 2025 at 03:45:19PM +0100, Raag Jadav wrote:
> On Fri, Nov 07, 2025 at 03:16:18PM +0200, Ville Syrjälä wrote:
> > On Fri, Nov 07, 2025 at 06:03:28AM -0600, Lucas De Marchi wrote:
> > > On Fri, Nov 07, 2025 at 11:26:11AM +0530, Raag Jadav wrote:
> > > > If the device is running older pcode firmware, it is possible that newer
> > > > mailbox commands are not supported by it. The respective functionality
> > > > isn't useful in that case but neither is error logging, since it doesn't
> > > > particularly signify anything wrong with pcode firmware or device as a
> > > > whole. This is useful in cases where we want to make a decision on driver
> > > > functionality based on pcode return codes and a bit simpler design choice
> > > > compared to other solutions like checking pcode firmware version, which
> > > > comes with additional complexity of binding every single command to a
> > > > specific version and deems pcode commands useless in case driver fails to
> > > > obtain it for reasons unrelated to pcode.
> > > 
> > > yeah.. I don't think we should regress the support in new kernel
> > > versions and require users to update their IFWI. However dropping the
> > > error message here also makes it harder to find cases in which we are
> > > indeed using a wrong command.
> > > 
> > > I'd say to decide on err vs dbg based on CONFIG_DRM_XE_DEBUG so
> > > developers can still see the error and take the right action.

Forgot to add here before floating v3. This is no different from current
situation because we don't have a way to make sure that the changes are
tested on all possible versions of IFWI and since we like to force everyone
to upgrade (atleast internally), it is still possible that we hit some
corner case in the field.

Raag

> > I think the caller should decide this. If it's explicitly probing
> > for something that may or may not exist then use  dbg(), otherwise
> > use err().
> 
> I like the idea. What I'm afraid is that once we open that door it'll
> probably start getting abused.
> 
> So rather we can check if we're really *in* probe()? Wait for a v3.
