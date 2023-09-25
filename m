Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E22CE7A81
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 11:47:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C4A10E146;
	Mon, 25 Sep 2023 11:47:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E7D910E146
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 11:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695642446; x=1727178446;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HwTF1t8jSm91tgxi+6iYg1+2XYF7lrv2ld25inh5udk=;
 b=m8iL5FLtUp7RaAj+zCRMlHKJSOjrv1JjfHL211LfLE8xe2r/jEyTHVc0
 4sJltnO2bexD9tkWFRtQ4K8hInYmC/NbnJ36tVvJJCzkD8m/SNq0cbCPa
 Of2x+z0EZSuIo4x4/7avzkEG8TCwE+z7mn3OvGhAKoJpk3BuvmxyTbZtm
 S5NgVNYHkKpB523LG4CTS5JbQOzIpzw5OA67H+o4FCOrqVXJM3SFToK1w
 I4NlkiNByLBTfFcVAOb63tcnAbCUQlN87wbmHE3eNmZ+2JjH3vIa5N6Wp
 3erhngnbRi5j4vZkdgE1bacjnaO10Vbre+CAYF9dPvVWcQ9kqKyxxEuxw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="467516904"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="467516904"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 04:47:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="724965758"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="724965758"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by orsmga006.jf.intel.com with SMTP; 25 Sep 2023 04:47:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 25 Sep 2023 14:47:17 +0300
Date: Mon, 25 Sep 2023 14:47:17 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <ZRFzRdldsC7BXITb@intel.com>
References: <20230924144751.446446-1-arun.r.murthy@intel.com>
 <CY5PR11MB63445AE80355495983540166F4FCA@CY5PR11MB6344.namprd11.prod.outlook.com>
 <874jjio5ik.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <874jjio5ik.fsf@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Add module parameter 'fastboot'
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
Cc: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Sep 25, 2023 at 02:29:23PM +0300, Jani Nikula wrote:
> On Mon, 25 Sep 2023, "Shankar, Uma" <uma.shankar@intel.com> wrote:
> >> -----Original Message-----
> >> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Arun R
> >> Murthy
> >> Sent: Sunday, September 24, 2023 8:18 PM
> >> To: intel-xe@lists.freedesktop.org
> >> Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> >> Subject: [Intel-xe] [PATCH 1/2] drm/xe: Add module parameter 'fastboot'
> >> 
> >> Fastboot is by default enabled on all Display 9+ platforms.
> >> Module param is added in xe for controlling the same.
> >
> > On Xe, we don't have the module param yet. So, there is no
> > way to change the default what we set here in this patch as of
> > now. We should modify the statement here.
> >
> > It should be ok to get rid of the #define and have fastboot disabled
> > by default for now. But we should work on the task to get the
> > module param or any other mechanism acceptable by maintainers
> > to control fastboot feature.
> 
> The question is, do we *want* that module parameter in xe?

We don't want it in i915 either. Just nuke it IMO.

-- 
Ville Syrjälä
Intel
