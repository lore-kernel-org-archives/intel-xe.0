Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA98CD5BCF
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 18:53:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA7910E3C7;
	Mon, 25 May 2026 18:53:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aEJpq/b0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C1310E3C5
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 18:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779735212; x=1811271212;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hAy7Piie8TjfMfvHPWSIU7PRxM8oISPIgSbL1vnc0Xo=;
 b=aEJpq/b0CtmiVyEqn2uoytX5GTMqmJDhKZ4RDGD5IE9G3486YSDzuyVm
 SS49hq4+jGBFs6Xm4J9AnvSHeQVsO76b4gX1TlmX+aqz0PbuZp6V59Z1Q
 +jN1rEGpjPKFuC0gVxdRPV/z+5336uHBt/ugrmQQLO1i3vuzSfyScEX1P
 nfY8c6K8v16OIBYGR4f/vojoKM3dh/tKeeFvOjJ7Oii2FTYqiVi7UIHzR
 V0R09M9GGIbSXm5xJCbX9VbOTD/UolHkYxupzk6o3F7qhbG8dENCFe+fG
 CckPjGPlqLVvoOvukLYQiMRTXoIK1wVQuQ89hDkWwjdkAPovn9BloYGxa g==;
X-CSE-ConnectionGUID: JHhH2CDMTT6q59glC3KGcw==
X-CSE-MsgGUID: YIiPvhGQTmCvnvNnwHXJug==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80526797"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="80526797"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 11:53:32 -0700
X-CSE-ConnectionGUID: E9rBT047QjmQMGenD1vI3g==
X-CSE-MsgGUID: L3sNOzoMRfa4OlcU14efcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="240840218"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 11:53:29 -0700
Date: Mon, 25 May 2026 20:53:26 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org,
 anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com,
 soham.purkait@intel.com
Subject: Re: [PATCH v6 02/15] drm/xe/xe_sysctrl: Make sysctrl flood limit
 reusable
Message-ID: <ahSapgLskga-WaWR@black.igk.intel.com>
References: <20260525100619.3155663-17-riana.tauro@intel.com>
 <20260525100619.3155663-19-riana.tauro@intel.com>
 <6e354e53-4428-4e24-b774-b51681f078d7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e354e53-4428-4e24-b774-b51681f078d7@intel.com>
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

On Mon, May 25, 2026 at 06:26:30PM +0200, Michal Wajdeczko wrote:
> On 5/25/2026 12:06 PM, Riana Tauro wrote:
> > The sysctrl command flood limit was defined in an event specific header,
> > restricting its usage to event handling. Move it to the shared header
> > with a generic name so it can be re-used across all files
> > using system controller commands.
> 
> shouldn't all FW specific defines be declared in the abi/ headers?
> this way we can keep clear separation between non-negotiable ABI
> definitions vs driver internal structures/helpers

The macro in question is not FW specific, we've made it up to prevent
infinite loop scenarios in case FW is overwhelmed.

Raag

> > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > ---
> > v2: remove duplicate (Raag, Mallesh)
> > ---
> >  drivers/gpu/drm/xe/xe_sysctrl_event.c         | 2 +-
> >  drivers/gpu/drm/xe/xe_sysctrl_event_types.h   | 3 ---
> >  drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 3 +++
> >  3 files changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> > index b4d17329af6c..faf6ba89ce98 100644
> > --- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
> > +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> > @@ -16,7 +16,7 @@ static void get_pending_event(struct xe_sysctrl *sc, struct xe_sysctrl_mailbox_c
> >  {
> >  	struct xe_sysctrl_event_response *response = command->data_out;
> >  	struct xe_device *xe = sc_to_xe(sc);
> > -	u32 count = XE_SYSCTRL_EVENT_FLOOD;
> > +	u32 count = XE_SYSCTRL_FLOOD;
> >  	size_t len;
> >  	int ret;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event_types.h b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
> > index c16c66b9fa7f..348768ca454a 100644
> > --- a/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
> > @@ -10,9 +10,6 @@
> >  
> >  #define XE_SYSCTRL_EVENT_DATA_LEN		59
> >  
> > -/* Modify as needed */
> > -#define XE_SYSCTRL_EVENT_FLOOD			16
> > -
> >  /**
> >   * enum xe_sysctrl_event - Events reported by System Controller
> >   *
> > diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> > index 84d7c647e743..0fa786a9e8c8 100644
> > --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> > @@ -48,6 +48,9 @@ struct xe_sysctrl_mailbox_command {
> >  	size_t data_out_len;
> >  };
> >  
> > +/* Modify as needed */
> > +#define XE_SYSCTRL_FLOOD			16
> > +
> >  #define XE_SYSCTRL_MB_FRAME_SIZE	16
> >  #define XE_SYSCTRL_MB_MAX_FRAMES	64
> >  #define XE_SYSCTRL_MB_MAX_MESSAGE_SIZE	\
> 
