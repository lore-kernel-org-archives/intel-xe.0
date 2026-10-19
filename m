Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC22606A321
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 16:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZOXhziVt
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F8710E472;
	Mon, 19 Oct 2026 16:53:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7359F10E472
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Oct 2026 16:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792428817; x=1823964817;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Dem+3/hucjA2o2GN59yY1mqeHJtETf7e6ERIr0ccbzE=;
 b=ZOXhziVtj3uIJUj7gEsTXKwf6jgl2BcRwcWoNlWGAPcIuttOvh7yZd9R
 ZHlW9wxrgwmVJDF3N2XvC/zSpJQMfp/XTnCnCEcrIblRmuoeIUFjlyJGF
 hwrwnKvdjnK93LBReFBGZwLaoqvZYM4BAtEyZPK8hKSahVB4RduWS31dp
 w3pnF5LvooWh0roLDNwD6v1X/Dvcef02B0cHoOIOJ9zyADLr2aeRnbGaN
 4Zux9l53e0+fAyWw6ajLpjY/gDKz8PHuJqdHNTWDp+0cFV+qzMVCoXaqb
 OyDWAUulqTn3VgTmseJloreBhGeovP1xOjA5V6oLEnuy1S98Ifxo+Vzyb w==;
X-CSE-ConnectionGUID: cwf9520nTXqib1B+0c7XEg==
X-CSE-MsgGUID: S3mE/o/oT22MeZfh6RmYdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1023456"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1023456"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 09:53:36 -0700
X-CSE-ConnectionGUID: xkGwSHciSBicBbFJi6x83g==
X-CSE-MsgGUID: 3mvr089UQsK3jGP5M+oF1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2642071"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.21])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 09:53:34 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/xe: Fix build with DRM_XE=y and CONFIGFS_FS=m
In-Reply-To: <20261019152559.GE1329272@mdroper-desk1>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261016191838.GH578251@mdroper-desk1>
 <20261016193254.3042071-2-rodrigo.vivi@intel.com>
 <9411b525240f8b79c2d828a887d1679518374689@intel.com>
 <20261019152559.GE1329272@mdroper-desk1>
Date: Mon, 19 Oct 2026 19:53:31 +0300
Message-ID: <4810b908f782874431348ea1509975a7a30f5148@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 19 Oct 2026, Matt Roper <matthew.d.roper@intel.com> wrote:
> On Mon, Oct 19, 2026 at 06:21:29PM +0300, Jani Nikula wrote:
>> On Fri, 16 Oct 2026, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>> > When xe is built-in but configfs is a module, xe_configfs.o is not
>> > linked into xe, while IS_ENABLED(CONFIG_CONFIGFS_FS) in xe_configfs.h
>> > still exposes the real declarations, leading to undefined references.
>> >
>> > Use IS_REACHABLE() so this case falls back to the stubs, the same as
>> > CONFIGFS_FS=n.
>> 
>> I think using IS_REACHABLE() is almost always a mistake. It's a hack to
>> avoid link errors when something in a module needs something that is
>> built-in. It's a combo that should be handled at Kconfig level, not at
>> build level.
>
> But isn't this situation exactly the case that it's intended for?  Xe
> doesn't "need" configfs, but will use it if it's present and usable.  In
> cases where configfs is built as a module, then it will not be usable by
> any built-in driver (including Xe), and that's perfectly fine; we just
> treat that the same as the 'n' case.

Yeah, but there's zero discoverability for the user, or the developer
looking at a future bug report, with IS_REACHABLE().

The user enables two configs, the Kconfig doesn't enforce a relationship
between the two, but they still fail to work together. How is the user
supposed to know?

With the proxy kconfig option you at least get a hint at what's
required. And you could make it more comprehensible with e.g. something
like this:

config DRM_XE_CONFIGFS
	def_bool y
	depends on DRM_XE && CONFIGFS_FS
	depends on CONFIGFS_FS=y || DRM_XE=m

Anyway, that's just my opinion. Obviously using IS_REACHABLE() is
"simpler" from Kconfig perspective, but I think explicit is better than
implicit.


BR,
Jani.


-- 
Jani Nikula, Intel
