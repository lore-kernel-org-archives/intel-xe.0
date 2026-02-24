Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C865E9B260
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 13:16:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D21110E582;
	Tue, 24 Feb 2026 13:16:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G6vuVahS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA0610E066;
 Tue, 24 Feb 2026 13:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771939002; x=1803475002;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=sIvvIJDugeN5XSdqVRorZGT2URVA0ZkAEKAcPeFDfQo=;
 b=G6vuVahSMaIMRsE1ohysMj8/1Ocnkk5539P1UwTsoeo/x7En1tkFuSev
 yHvbAoMCHN6kDEHK4cjp+ZfGRHT+yw+Gl0JIW2pPL76yy+8wvyVrxdGY1
 C5IXorxLGXZx0gGXDwg2zv0CkifjokI6TuDrPEDV7VLeaeKdqyRDmuV+9
 ZvdquER/gg5z16jHo11dVFu9TRFi6D8pUbP0Q0hqiXNKfOsq/C6zTicY3
 Aboiz1b1pualnOL51p6VhLL3fC+TvsM3MNd1hNryK2Z5iThy8eN889Bbc
 kn0+1SkYqwWwucLLdAiydLPHitDIafMX5SiiWUPutlEMoOBB2DRQdSAlr Q==;
X-CSE-ConnectionGUID: ExseBrxzSrim25LUd++nVg==
X-CSE-MsgGUID: AimYRDH3TCSEFC7UWGqtFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76813647"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="76813647"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:16:41 -0800
X-CSE-ConnectionGUID: HKWOiWJTSZ+EyhPc0Yc/1w==
X-CSE-MsgGUID: GRwTgJR3QPOHnGfgZycNbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="220487155"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.20])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:16:39 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: "Srinivas, Vidya" <vidya.srinivas@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lee,
 Shawn C" <shawn.c.lee@intel.com>
Subject: RE: [PATCH] drm/displayid: reduce DisplayID checksum error logging
 to debug
In-Reply-To: <PH7PR11MB8252364C58CFC0216A5FCC298977A@PH7PR11MB8252.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260217055002.245099-1-vidya.srinivas@intel.com>
 <40f54d2357194813cd16e71a49b719f8c35b1549@intel.com>
 <PH7PR11MB8252364C58CFC0216A5FCC298977A@PH7PR11MB8252.namprd11.prod.outlook.com>
Date: Tue, 24 Feb 2026 15:16:36 +0200
Message-ID: <a709533a1f406109306ea9a46f2088d93ae8f53b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 23 Feb 2026, "Srinivas, Vidya" <vidya.srinivas@intel.com> wrote:
>> -----Original Message-----
>> From: Nikula, Jani <jani.nikula@intel.com>
>> Sent: 23 February 2026 16:02
>> To: Srinivas, Vidya <vidya.srinivas@intel.com>; intel-gfx@lists.freedesktop.org
>> Cc: intel-xe@lists.freedesktop.org; Srinivas, Vidya <vidya.srinivas@intel.com>
>> Subject: Re: [PATCH] drm/displayid: reduce DisplayID checksum error logging
>> to debug
>> 
>> On Tue, 17 Feb 2026, Vidya Srinivas <vidya.srinivas@intel.com> wrote:
>> > The patch "drm/displayid: add quirk to ignore DisplayID checksum
>> > errors" introduced a mechanism to bypass checksum validation for
>> > certain panels. However, even when ignoring the error, the code
>> > continues to log a DRM_NOTE.
>> 
>> Please refer to commits with the usual format (see git log).
>> 
>> > On affected hardware, this results in persistent "DisplayID checksum
>> > invalid" messages in the system log. This noise often misleads users
>> > into thinking there is a critical hardware failure or a functional
>> > regression, despite the quirk successfully handling the issue.
>> >
>> > Downgrade the log level from DRM_NOTE to DRM_DEBUG_KMS. This keeps
>> the
>> > diagnostic information available for kernel developers while silencing
>> > the unnecessary warning for end-users.
>> >
>> > Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
>> > ---
>> >  drivers/gpu/drm/drm_displayid.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/drm_displayid.c
>> > b/drivers/gpu/drm/drm_displayid.c index 58d0bb6d2676..1f6d78fe29f2
>> > 100644
>> > --- a/drivers/gpu/drm/drm_displayid.c
>> > +++ b/drivers/gpu/drm/drm_displayid.c
>> > @@ -69,7 +69,7 @@ validate_displayid(const u8 *displayid, int length, int
>> idx, bool ignore_checksu
>> >  	for (i = 0; i < dispid_length; i++)
>> >  		csum += displayid[idx + i];
>> >  	if (csum) {
>> > -		DRM_NOTE("DisplayID checksum invalid, remainder is
>> %d%s\n", csum,
>> > +		DRM_DEBUG_KMS("DisplayID checksum invalid, remainder is
>> %d%s\n",
>> > +csum,
>> >  			 ignore_checksum ? " (ignoring)" : "");
>> 
>> I understand the desire to make it debug level with the quirk, but IMO it
>> needs to be more than debug level when there is no quirk.
>> 
>> BR,
>> Jani.
>> 
>
> Hello Jani
>
> Thank you so much. I understand your point.
> Only problem is other components not familiar with drm get confused about
> the message and say it is display issue. They also report this flooding
> is causing delay for their driver load etc.

It absolutely *is* a display issue, it's got a buggy EDID. It's not a
driver issue. If we go quiet about it, people will only notice the issue
through missing advanced display features as the DisplayID got skipped.

Like I said, make it debug level for displays that have the quirk
(ignore_checksum), and keep it noisier for displays that don't. If we
hit that, there's a (small) chance we can give the display vendor
feedback and have it fixed, otherwise we can add the quirk.

But the displays will never get fixed if we always keep quietly
accepting buggy EDIDs.


BR,
Jani.

>
> Regards
> Vidya
>
>> 
>> >
>> >  		if (!ignore_checksum)
>> 
>> --
>> Jani Nikula, Intel

-- 
Jani Nikula, Intel
