Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4451FCCFA05
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 13:16:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00ACB10EABF;
	Fri,  7 Nov 2025 13:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YovslsLN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA38810EABF
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 13:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762521384; x=1794057384;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0FwfOeMJY0bA8bBTbUNF5O8wPXcoGVefl5I0bpYVHyw=;
 b=YovslsLNBUYSEWSFwP5dBFyjIubmkqLPhj4LJ/lShl89/V3NjUcV+JIo
 2adhqk60k1sArIFMi01GCjqW2gZ4Uq9FrGs7xSxlPWkdby0ymaJE3/eAM
 NW0hnHoOnKwXru/2zOkGqifD4HmZeGoc7zVE958JCLkDi6aZYFP8laaFT
 9/S6JMvcoENfMUbAjigckW2dHJRVo1TY9ccknT/3FPzxUJQUvo8DrDCWg
 3l5esJBQmGcpA8TgcEZZ9b+TTMbkeYfsl9d0xXhopTCSbhEuqUUMe4nMk
 zWtu7TdKYJXKppfFV9FRNQAww1PouuPCba5s7RqMeWQdqHB7LLxm9cPC1 g==;
X-CSE-ConnectionGUID: JFfcLxPbQqSHgF2MKW2kWA==
X-CSE-MsgGUID: 4ObZUMfoRf2psN5vPOe7Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64595928"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64595928"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 05:16:24 -0800
X-CSE-ConnectionGUID: 9Cx/c+apQbSH8jz8Pue1Jg==
X-CSE-MsgGUID: 2bnrRbCOSay7btDVWjOyag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="192297225"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.106])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 05:16:21 -0800
Date: Fri, 7 Nov 2025 15:16:18 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 badal.nilawar@intel.com
Subject: Re: [PATCH v2] drm/xe/pcode: Convert unsupported commands to debug
 level
Message-ID: <aQ3xItyGMVnKdzoi@intel.com>
References: <20251107055746.110055-1-raag.jadav@intel.com>
 <b4f677ximgoni5pzf6bsh6kkchh52fy6drckbiasqsaekvnzbj@o3rkfqwcg6or>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b4f677ximgoni5pzf6bsh6kkchh52fy6drckbiasqsaekvnzbj@o3rkfqwcg6or>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Fri, Nov 07, 2025 at 06:03:28AM -0600, Lucas De Marchi wrote:
> On Fri, Nov 07, 2025 at 11:26:11AM +0530, Raag Jadav wrote:
> >If the device is running older pcode firmware, it is possible that newer
> >mailbox commands are not supported by it. The respective functionality
> >isn't useful in that case but neither is error logging, since it doesn't
> >particularly signify anything wrong with pcode firmware or device as a
> >whole. This is useful in cases where we want to make a decision on driver
> >functionality based on pcode return codes and a bit simpler design choice
> >compared to other solutions like checking pcode firmware version, which
> >comes with additional complexity of binding every single command to a
> >specific version and deems pcode commands useless in case driver fails to
> >obtain it for reasons unrelated to pcode.
> 
> yeah.. I don't think we should regress the support in new kernel
> versions and require users to update their IFWI. However dropping the
> error message here also makes it harder to find cases in which we are
> indeed using a wrong command.
> 
> I'd say to decide on err vs dbg based on CONFIG_DRM_XE_DEBUG so
> developers can still see the error and take the right action.

I think the caller should decide this. If it's explicitly probing
for something that may or may not exist then use  dbg(), otherwise
use err().

-- 
Ville Syrjälä
Intel
