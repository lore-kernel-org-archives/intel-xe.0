Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB471E732E7
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 16:10:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC4210E68B;
	Thu, 28 Sep 2023 16:10:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9FF010E060
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Sep 2023 16:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695917450; x=1727453450;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tlzOm77pD+hblSSGQDfQ00JFQSxCJZG+RkcuaQPAQNs=;
 b=g6qtgGGg0ifaFDn6Itaycw1ZsytRrOYFPGayaqn31j5ik5qXjEo6fFXh
 auvTN1PAUAZGvE2ZZN8LHYs60hY6V0Pfhu5C3mzjGCAPSwiKtYHS444RB
 X2bAig2U0ZhMJIE8M+hRhDbYLfuKzdy//7lFtOmIn/7DhBdbXbWDmLoKb
 8i6z/rzSdaZuxfi1Ug9u5yesvtpGxi9J+0NwnxYZOCpeE5mezk0TnD5lG
 OD3U5YlA1cUydWKkB3pTZhnvGUzik93GkT7dKAidYaUqqyNJcvlkMyTeQ
 NDArSxOSkaE6oYFfgiCIBYY+s+Dw0V+v8YYcn60X3Iw3isZUy1AYgb5vZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="380983111"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="380983111"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 09:10:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="749644705"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="749644705"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by orsmga002.jf.intel.com with SMTP; 28 Sep 2023 09:10:47 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 28 Sep 2023 19:10:46 +0300
Date: Thu, 28 Sep 2023 19:10:46 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Message-ID: <ZRWlht3cvt4WYCsu@intel.com>
References: <20230927073125.3825836-1-jouni.hogander@intel.com>
 <ee8b5153-1cbd-4ab3-2b1a-626b13fbd761@linux.intel.com>
 <2fd37d47aacb192f9d4b4e8491743323536f364c.camel@intel.com>
 <85245068-4cce-8851-e527-29792385f78b@linux.intel.com>
 <fb8f3086713e91e4280421c507b082949a3640f8.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb8f3086713e91e4280421c507b082949a3640f8.camel@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-xe] [RFC PATCH 0/3] Xe dma fence handling on atomic
 commit
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Sep 28, 2023 at 08:23:41AM +0000, Hogander, Jouni wrote:
> On Wed, 2023-09-27 at 14:35 +0200, Maarten Lankhorst wrote:
> > Hey,
> > 
> > On 2023-09-27 12:45, Hogander, Jouni wrote:
> > > On Wed, 2023-09-27 at 12:33 +0200, Maarten Lankhorst wrote:
> > > > Hey,
> > > > 
> > > > When we wrote the original display support, we purposely decided
> > > > on
> > > > not
> > > > adding i915_sw_fence support.
> > > > 
> > > > In this case, I think a better approach would be to remove this
> > > > code
> > > > from i915 as well, and end up with cleaner display code for both
> > > > drivers.
> > > 
> > > Yes, I agree eventually this would be the goal. I did some
> > > experiments
> > > here:
> > > 
> > > https://patchwork.freedesktop.org/patch/558982/?series=123898&rev=4
> > > 
> > > Which is replacing i915_sw_fence with same code I'm using for Xe
> > > driver
> > > in this patch set. The problem is GPU reset detection. I don't have
> > > currently good ideas how to tackle that without compromizing i915
> > > functionality in this scenario -> ended up doing this only for Xe
> > > to
> > > ensure this is not blocking upstreaming Xe. Would this be
> > > acceptable as
> > > temporary solution to be solved after upstreaming? Anyways what I'm
> > > doing in these patches is not really an i915_sw_fence revised, but
> > > using dma_fences.
> > In atomic, plane_state->fence is set for all fences, and that should
> > be 
> > enough. I think creating a reservation object is a massive overkill,
> > and we should try to use the drm_atomic_helper_wait_for_fences if at
> > all 
> > possible.
> 
> Checked this plane_state->fence. To me it looks like it's for userspace
> to set? I don't think this is the case for i915. For Xe, I don't know
> is it done?
> 
> Also i915 is waiting for fences on old frame buffer objects and new fb
> objects. Shouldn't we do the same for Xe as well?

xe shouldn't need the old fb fence since userspace there won't be
doing any MI_SCANLINE_WAIT stuff.

> Anyways there is
> currently no mechanism in dma_fence implementation to have common fence
> for two separate dma_resv objects (dma_resv_get_singleton) -> I did
> this by creating a new dma_resv for this purpose. If there is no reason
> to wait for possible fences on old fb object, maybe we could just do
> dma_resv_get_singleton in prepare planes for Xe and wait for that and
> uapi.fence in commit?

drm_gem_plane_helper_prepare_fb() supposedly does something that already
works for xe. Looks like it does a few things:
- populates plane_state->fence with dma_resv_get_singleton() if using
  implicit fencing
- uses dma_fence_chain internally to add additional (kernel internal 
  for memory movement/etc. maybe?) fences to the uapi supplied explicit fence

Presumably we should be able to glue on the old fb fence using dma_fence_chain
as well?

-- 
Ville Syrjälä
Intel
