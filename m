Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9793BC55172
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 08:11:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B30E10E8C4;
	Tue,  4 Aug 2026 08:11:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dTyyc5eU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A94410E8C4
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 08:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785831106; x=1817367106;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=TUA/TKHuaoVyZas0KZJml45L+nE5SVo6flnVswTef04=;
 b=dTyyc5eUZtqHowgIe7nrI0hFn7j2WMEXaviHPJtm4dmkUDsuPSJ91g0/
 1MwwWxxqDJ8F13u0O8JcXaNA9poA0qIe1sMY4Q/J164loqDFcrJsEh6OH
 xi8NS8M9gM9jcOhXej1Int9hq37Os6tk90Hg9fjpbm0BT++ARaClg2ST0
 4FlROFon3nAt7cafOmLAosSm+8bAuBaxaqV+H6ZGzWxyUb97hLmszqhVU
 mMyZq+1qiUe9WVoEKZpz3F4R6RoGO/xUfrdx/s6q34TfuFSt3GotusPyt
 VvaJLl3PC1+Sscm3JCFqNxAVf4s841LYllnalztSO4iG19QmqKfEM007G g==;
X-CSE-ConnectionGUID: 5qj6+KhuQ8CvA4EuXXJ4kA==
X-CSE-MsgGUID: QBqmV7mwQRmmo/KCZ/GHyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86145144"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="86145144"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 01:11:45 -0700
X-CSE-ConnectionGUID: wnvNlF5uSbuqFNiR6+fMOQ==
X-CSE-MsgGUID: Fnjk7gBnQAuq87dPbBiPIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="257558688"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 01:07:20 -0700
Date: Tue, 4 Aug 2026 10:07:18 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: "Tauro, Riana" <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org,
 matthew.d.roper@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH v1] drm/xe/ras: Fix invalid health error code
Message-ID: <anGdtkV0o2JS_fxy@black.igk.intel.com>
References: <20260804051214.1202957-1-raag.jadav@intel.com>
 <2cd81d12-a37e-47ad-a213-79a470ab7ad2@intel.com>
 <7514b3a7-ee80-4f1b-a2b2-aff3ea522ead@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7514b3a7-ee80-4f1b-a2b2-aff3ea522ead@intel.com>
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

On Tue, Aug 04, 2026 at 08:56:12AM +0200, Michal Wajdeczko wrote:
> On 8/4/2026 8:36 AM, Tauro, Riana wrote:
> > 
> > On 04-08-2026 10:42, Raag Jadav wrote:
> >> We use -EBADMSG for corrupted responses from sysctrl. Fix the error code.
> > 
> > Let's keep it -EIO as it's more appropriate for sysctrl errors and consistent than
> > 
> > #define    EBADMSG        74    /* Not a data message */

The response size is valid, it's just the contents are corrupted. Similar
to what we did with commit 948eee331bef ("drm/xe/ras: Validate sysctrl
response") and more consistent here.

> btw, inside GuC CTB code we use
> 
> 	-EPIPE		// for corrupted message/channel
> 	-EPROTO		// for unexpected content in the message

We have a bunch of these as a response status, check ras_status_to_errno().
The one proposed here is for the values deemed acceptable as per spec.

> as -EIO is too generic

Agree.

Raag

> >> Fixes: 53a7115f9862 ("drm/xe/xe_ras: Add RAS GPU health indicator")
> >> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> >> ---
> >>   drivers/gpu/drm/xe/xe_ras.c | 4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> >> index f7af4da8172c..bdad0621ae12 100644
> >> --- a/drivers/gpu/drm/xe/xe_ras.c
> >> +++ b/drivers/gpu/drm/xe/xe_ras.c
> >> @@ -700,7 +700,7 @@ static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr
> >>       if (response.health >= XE_RAS_HEALTH_MAX) {
> >>           xe_err(xe, "sysctrl: invalid health state %u\n",
> >>                  response.health);
> >> -        return -EIO;
> >> +        return -EBADMSG;
> >>       }
> >>         health = gpu_health_states[response.health];
> >> @@ -753,7 +753,7 @@ static ssize_t gpu_health_store(struct device *dev, struct device_attribute *att
> >>       if (response.health >= XE_RAS_HEALTH_MAX) {
> >>           xe_err(xe, "sysctrl: invalid health state %u\n",
> >>                  response.health);
> >> -        return -EIO;
> >> +        return -EBADMSG;
> >>       }
> >>         health = gpu_health_states[response.health];
> 
