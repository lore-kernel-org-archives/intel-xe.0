Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203DACD4851
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 12:31:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48DC10E337;
	Wed, 13 May 2026 12:31:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h5na5FOx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBAC210E337;
 Wed, 13 May 2026 12:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778675500; x=1810211500;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=SaacoXkpEs+6AJukLc4fio329ViGJpXJHf6bZNVwuzg=;
 b=h5na5FOx7II30Xoih1TO/XhqZeeZVhM5LXIjg+ZUHVZTY9ez/rCxz0qb
 Y0O0zkLMEhmkF6Ock4sTU0kmXbj8122QwynhlUdnJy6ub0+Nw5j35fC5Z
 lLQJ8QwFDJ9HBg46eTFgCFpNaLvVLCcAshEOl+D+dwIYTwOElgBLwPIpm
 SckP6fPYv2gDtM9u7aSc/dM7vDPGrS71eQfqi/6bQ4/2L0/JTUBF6kxmH
 j7JyJ1U5fLVwS5Pjg4KIXnpmx+2OWgaSn8BYHTiEVEZSpVKmGJFi7dqca
 otYPrUT8pZavFJfPv0AOgbxsygKSPBTEWgK+XTIWbB8TcUCxRr8ymbrt0 Q==;
X-CSE-ConnectionGUID: 7q8R72TwR1WtugMWNFqCqw==
X-CSE-MsgGUID: JbNLm/tZQbCEJzH28M/lRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="105060088"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="105060088"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 05:31:40 -0700
X-CSE-ConnectionGUID: L7z1sBnnRNSYstfWSjDUJw==
X-CSE-MsgGUID: BKo6xoxGRD66v90aXL13SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="237972146"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.10])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 05:31:37 -0700
Date: Wed, 13 May 2026 15:31:34 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>
Subject: Re: [RESEND 0/4] drm/i915/display: start switching to display
 specific reg types
Message-ID: <agRvJsmqqi1q0MnL@intel.com>
References: <cover.1777972548.git.jani.nikula@intel.com>
 <0fb8d06a63af7f22dea6d08d69d94350c97a1e83@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0fb8d06a63af7f22dea6d08d69d94350c97a1e83@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Fri, May 08, 2026 at 02:29:50PM +0300, Jani Nikula wrote:
> On Tue, 05 May 2026, Jani Nikula <jani.nikula@intel.com> wrote:
> > Jani Nikula (4):
> >   drm/i915/display: add typedef for intel_reg_t and use it
> >   drm/i915/display: add struct intel_irq_regs and use it
> >   drm/i915/display: add struct intel_error_regs and use it
> >   drm/i915/display: define and use intel_reg_{offset,equal,valid}()
> >     helpers
> 
> Ville, ack on this one?

Looks fine by me

For the series
Acked-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

-- 
Ville Syrjälä
Intel
