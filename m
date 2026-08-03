Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13462C55175
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 09:42:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECEE10E569;
	Mon,  3 Aug 2026 09:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BDDusmM1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF0C10E569
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Aug 2026 09:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785750142; x=1817286142;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=87Huh8H+VGuMV57D0XHoXx4P2Ici57SNrQnk3MhZyjs=;
 b=BDDusmM1/Ry05Qp5xe2TxVk8cUAe0qQtg3HpNmeqCczWAvAqTL5z1YgD
 kpzb5JDQrTFlLVfC2XJ+U8oPRAFgyhJaw78j5LNZMF2+TaJVMU5ITmPHg
 3JRI62E9R9yWyCMTuLTkitGrE6ICPP2WYrJd9EiN+lSzw8ucIgAtxxWla
 V0EWY7ptywYRqNHLUbBpaGCY3AY1lNoKn7RM52UUdY8sYIoLf+VlhkMeh
 dBriakFKAcJphO42gc6sZ1XCVvunYZ8FeZpG4uYgCBYxvYEcCDj6zdXf7
 ZEFzMi6o13SPLY3F6W94/TgYIiOIqNKsvnSsDXdjf70PJmHCWaq1rT/1a g==;
X-CSE-ConnectionGUID: q3TCOfJLTKSwKyb0d8hgaA==
X-CSE-MsgGUID: 79iWzd+5Sw6Y7gMjywQ+/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="97655743"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="97655743"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 02:42:22 -0700
X-CSE-ConnectionGUID: xafPScmAQUWMliF6PszsBw==
X-CSE-MsgGUID: 4Gcobj9qRbiv3U4miB0b9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="265007911"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 02:42:21 -0700
Date: Mon, 3 Aug 2026 11:42:17 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 riana.tauro@intel.com, matthew.d.roper@intel.com,
 mallesh.koujalagi@intel.com
Subject: Re: [PATCH v1] drm/xe/drm_ras: Move has_drm_ras check to drm_ras layer
Message-ID: <anBieRFD1ECvBD3c@black.igk.intel.com>
References: <20260803080823.1166925-1-raag.jadav@intel.com>
 <3f8aeb27-ab03-424b-a320-45ad137944dd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f8aeb27-ab03-424b-a320-45ad137944dd@intel.com>
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

On Mon, Aug 03, 2026 at 11:03:11AM +0200, Michal Wajdeczko wrote:
> On 8/3/2026 10:08 AM, Raag Jadav wrote:
> > has_drm_ras flag is meant to facilitate drm_ras feature. Move it to the
> > correct layer where it belogs.
> 
> typo: belongs

Good catch.

> > Fixes: 63dfab5786ca ("drm/xe/xe_ras: Add drm_ras feature flag")
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_drm_ras.c | 3 +++
> >  drivers/gpu/drm/xe/xe_ras.c     | 3 ---
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
> > index 4afa2ad98300..a23cfb49361b 100644
> > --- a/drivers/gpu/drm/xe/xe_drm_ras.c
> > +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
> > @@ -233,6 +233,9 @@ int xe_drm_ras_init(struct xe_device *xe)
> >  	struct drm_ras_node *node;
> >  	int err;
> >  
> > +	if (!xe->info.has_drm_ras)
> > +		return 0;
> > +
> >  	node = drmm_kcalloc(&xe->drm, DRM_XE_RAS_ERR_SEV_MAX, sizeof(*node), GFP_KERNEL);
> >  	if (!node)
> >  		return -ENOMEM;
> > diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> > index 28123f08e513..f7af4da8172c 100644
> > --- a/drivers/gpu/drm/xe/xe_ras.c
> > +++ b/drivers/gpu/drm/xe/xe_ras.c
> > @@ -816,9 +816,6 @@ void xe_ras_init(struct xe_device *xe)
> >  {
> >  	int ret;
> >  
> > -	if (!xe->info.has_drm_ras)
> > -		return;
> > -
> >  	xe_drm_ras_init(xe);
> 
> btw, shouldn't we handle xe_drm_ras_init() errors here?
> 
> hmm, and it looks that xe_ras_init() ignores all errors,
> which is kind of against the "all-or-nothing" driver rule

The discussion[1] at the time was that we shouldn't let the driver suffer
for the failures of non-critical features.

I don't mind refactoring now, but this'll require some consensus.

[1] https://lore.kernel.org/intel-xe/ae9a0aee-d81b-4532-ab36-8025c50ae69a@intel.com/

Raag
