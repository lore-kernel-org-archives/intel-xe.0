Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 485FDCCF9F8
	for <intel-xe@archiver.kernel.org>; Wed, 12 Nov 2025 14:45:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA0910E0A9;
	Wed, 12 Nov 2025 14:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A0uNLRZG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB26F10E0A9
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Nov 2025 14:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762958720; x=1794494720;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=y6vt2e6SztTot+yV+g8QqJ6+Ke6RruJfZOkqAPipwSE=;
 b=A0uNLRZG/RKjvtpHVP+8rhkk1Umx9EGquFzWlEgiZl3xtpvxwD8mtR/v
 8t+hYm7kMA9m2fT66xFbUrJf7gYcRI69svIi4S0P4TY+cZ78Y9tK3dJsz
 Sv2ATbKlmhlXrg/vltDMEhO5+80cHGQlQVN17i1W0qijbiOhfFIo5qHHu
 dDW4KpXR7qMjE0+YSWGpVDAc2u+joSblHoY9VylBM7o6NcJ2+JE5l14J+
 ztdD2P5WduokmOQ4peTeAm5nFSjB5aQnvcHZaVvxbMOPgKWA5nYGQQFsX
 yvy2Yxbe8WcDjHJM0hrgVfPHKrE/x2i6KowHqFSlg8tUpAHNsrSkxvBpb Q==;
X-CSE-ConnectionGUID: I76pMokqQyuuQRC2lAuGBA==
X-CSE-MsgGUID: Jgxq+SyeSwaRt+vo2fsXng==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="75702035"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="75702035"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 06:45:19 -0800
X-CSE-ConnectionGUID: qf9A4qwiT3ivJMmAYoBa1g==
X-CSE-MsgGUID: ezeuUTHmTZ2d9e6FSiKAYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="189007332"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 06:45:17 -0800
Date: Wed, 12 Nov 2025 15:45:14 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 badal.nilawar@intel.com
Subject: Re: [PATCH v2] drm/xe/pcode: Convert unsupported commands to debug
 level
Message-ID: <aRSdenIjmrfTaw8U@black.igk.intel.com>
References: <20251107055746.110055-1-raag.jadav@intel.com>
 <b4f677ximgoni5pzf6bsh6kkchh52fy6drckbiasqsaekvnzbj@o3rkfqwcg6or>
 <aQ3xItyGMVnKdzoi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aQ3xItyGMVnKdzoi@intel.com>
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

On Fri, Nov 07, 2025 at 03:16:18PM +0200, Ville Syrjälä wrote:
> On Fri, Nov 07, 2025 at 06:03:28AM -0600, Lucas De Marchi wrote:
> > On Fri, Nov 07, 2025 at 11:26:11AM +0530, Raag Jadav wrote:
> > > If the device is running older pcode firmware, it is possible that newer
> > > mailbox commands are not supported by it. The respective functionality
> > > isn't useful in that case but neither is error logging, since it doesn't
> > > particularly signify anything wrong with pcode firmware or device as a
> > > whole. This is useful in cases where we want to make a decision on driver
> > > functionality based on pcode return codes and a bit simpler design choice
> > > compared to other solutions like checking pcode firmware version, which
> > > comes with additional complexity of binding every single command to a
> > > specific version and deems pcode commands useless in case driver fails to
> > > obtain it for reasons unrelated to pcode.
> > 
> > yeah.. I don't think we should regress the support in new kernel
> > versions and require users to update their IFWI. However dropping the
> > error message here also makes it harder to find cases in which we are
> > indeed using a wrong command.
> > 
> > I'd say to decide on err vs dbg based on CONFIG_DRM_XE_DEBUG so
> > developers can still see the error and take the right action.
> 
> I think the caller should decide this. If it's explicitly probing
> for something that may or may not exist then use  dbg(), otherwise
> use err().

I like the idea. What I'm afraid is that once we open that door it'll
probably start getting abused.

So rather we can check if we're really *in* probe()? Wait for a v3.

Raag
