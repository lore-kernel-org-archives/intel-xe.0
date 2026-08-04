Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB78C5518F
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 10:16:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE6310E150;
	Tue,  4 Aug 2026 10:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RWEW0joo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C113B10E150
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 10:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785838594; x=1817374594;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ohUQOTlU5zTJw0nELiQiPZ71ZPji3g3cCo/dmq1tJjY=;
 b=RWEW0jooLJvipbDT7gZW/oIuFf89eMiClmSqNprSHcEo0lan3AjVEn1m
 pgumkJ7EM1sxEmOwXQhdPxqDUpLje3yi4QCoU+OhG3ureeA1CMaMYT/v1
 vpib6448op0UoFMkcVPiNI6UTmO9OQArPok+hh5qrowMeCh6kQTlD7kVQ
 VseXGkYAew3fD+tASyJ8ZzIdLNqz0V2cVN7PC7TDVjXJKluVx9iihG0oE
 65j2Z3eZYDE8fqjZAKR0jUkBxTCXQI5M2zcVSd85auIJIAwAaQo80syqF
 gU3uKbrXXGBetrIUh104H2q52BP2X6bmzGyJ+drZZm0dKH2MGFI32Xn2l g==;
X-CSE-ConnectionGUID: 82TxjlDhTaiUHCTErEDb1A==
X-CSE-MsgGUID: YOX+5exjSxGSJPYdrpLuFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86331748"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="86331748"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 03:16:34 -0700
X-CSE-ConnectionGUID: 38Lvd1g1TZefWphpDxDTqg==
X-CSE-MsgGUID: J+I9tZbCQPKrDIk6P+imnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="260880270"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 03:16:33 -0700
Date: Tue, 4 Aug 2026 12:16:30 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org, matthew.d.roper@intel.com,
 soham.purkait@intel.com
Subject: Re: [PATCH v1] drm/xe/ras: Fix invalid health error code
Message-ID: <anG7_k5P3DJezk8n@black.igk.intel.com>
References: <20260804051214.1202957-1-raag.jadav@intel.com>
 <2cd81d12-a37e-47ad-a213-79a470ab7ad2@intel.com>
 <7514b3a7-ee80-4f1b-a2b2-aff3ea522ead@intel.com>
 <anGdtkV0o2JS_fxy@black.igk.intel.com>
 <75f2a523-ac6d-4470-a87a-33d9ccc07540@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75f2a523-ac6d-4470-a87a-33d9ccc07540@intel.com>
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

On Tue, Aug 04, 2026 at 02:01:16PM +0530, Tauro, Riana wrote:
> On 04-08-2026 13:37, Raag Jadav wrote:
> > On Tue, Aug 04, 2026 at 08:56:12AM +0200, Michal Wajdeczko wrote:
> > > On 8/4/2026 8:36 AM, Tauro, Riana wrote:
> > > > On 04-08-2026 10:42, Raag Jadav wrote:
> > > > > We use -EBADMSG for corrupted responses from sysctrl. Fix the error code.
> > > > Let's keep it -EIO as it's more appropriate for sysctrl errors and consistent than
> > > > 
> > > > #define    EBADMSG        74    /* Not a data message */
> > The response size is valid, it's just the contents are corrupted. Similar
> > to what we did with commit 948eee331bef ("drm/xe/ras: Validate sysctrl
> > response") and more consistent here.
> > 
> > > btw, inside GuC CTB code we use
> > > 
> > > 	-EPIPE		// for corrupted message/channel
> > > 	-EPROTO		// for unexpected content in the message
> > We have a bunch of these as a response status, check ras_status_to_errno().
> > The one proposed here is for the values deemed acceptable as per spec.
> > 
> > > as -EIO is too generic
> > Agree.
> 
> Using -EIO consistently for system controller errors allows easier debugging
> for
> sysctrl commands.  When any sysctrl ops fail we know it's not RAS layer.

We still log it as a sysctrl error, so nothing changed from debugging POV
here. Besides, error codes are what make the failure cases distinguishable
to the consumer, otherwise we wouldn't have so many of them :)

> The only other error code we see is directly from firmware status.

I'm all for trusting what the firmware tells me, but this has caused more
problems than solved historically :)

> This is my thought. I will leave it upto you

Sure.

Raag

> > > > > Fixes: 53a7115f9862 ("drm/xe/xe_ras: Add RAS GPU health indicator")
> > > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > > ---
> > > > >    drivers/gpu/drm/xe/xe_ras.c | 4 ++--
> > > > >    1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> > > > > index f7af4da8172c..bdad0621ae12 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_ras.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_ras.c
> > > > > @@ -700,7 +700,7 @@ static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr
> > > > >        if (response.health >= XE_RAS_HEALTH_MAX) {
> > > > >            xe_err(xe, "sysctrl: invalid health state %u\n",
> > > > >                   response.health);
> > > > > -        return -EIO;
> > > > > +        return -EBADMSG;
> > > > >        }
> > > > >          health = gpu_health_states[response.health];
> > > > > @@ -753,7 +753,7 @@ static ssize_t gpu_health_store(struct device *dev, struct device_attribute *att
> > > > >        if (response.health >= XE_RAS_HEALTH_MAX) {
> > > > >            xe_err(xe, "sysctrl: invalid health state %u\n",
> > > > >                   response.health);
> > > > > -        return -EIO;
> > > > > +        return -EBADMSG;
> > > > >        }
> > > > >          health = gpu_health_states[response.health];
