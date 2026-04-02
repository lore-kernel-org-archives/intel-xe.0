Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B0DD39406
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 10:18:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC5610F1C0;
	Thu,  2 Apr 2026 10:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b7/Y/wOt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE2A10F1AE;
 Thu,  2 Apr 2026 10:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775125124; x=1806661124;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QhOuBrbZCq0cbYkjDNg+VrxlasJtaZvT0w/hljFJp8Y=;
 b=b7/Y/wOt0Gwj5soBOT9CIhU5BeGpOqKEtOeddZ+7eXkK4QnadrHeXN8x
 ZW3TPkObU98kSaEZPnQN5sJhJZ4g+/s3fe+BOzUIS4wEXvrZEYXRYVADU
 tC7ylNaudgrTLUIs7OHTvb/VQWeICyRQVgdJ1otGmiHBwVbyu6VsfgQhZ
 IXVlmXvfB9KJFveP2wiOuSgeqQeoHZMSe0nyYlCkikyy7I43bbcXz22Hc
 vRh7jRWbdrbMBtbCjckYyZfFOwONyeV5WSevS3n5X6HCOMNMTgnotlWh0
 zr218ArljZqBxg58O7UgzPByhDoIMf2+u220WcxDazJnrhKnJ/EgnArrV g==;
X-CSE-ConnectionGUID: N6+egWXtS26knDVpj+ocMQ==
X-CSE-MsgGUID: xnwaPtnJQOuG1F5XnecQPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76145618"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="76145618"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 03:18:43 -0700
X-CSE-ConnectionGUID: x1T6ydfnR2S2yRXMzjYkLg==
X-CSE-MsgGUID: MzMcpJqZTqKKsRS337DVXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="250154516"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.61])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 03:18:41 -0700
Date: Thu, 2 Apr 2026 13:18:38 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [CI] drm/i915/display: change pipe allocation order for discrete
 platforms
Message-ID: <ac5CfviBE46QGbVl@intel.com>
References: <20260316121837.1264876-1-jani.nikula@intel.com>
 <2db8f3e8adde89b85da08477ed3f4bd6b7392b5c@intel.com>
 <acqYWkrs5b3MOrnO@intel.com>
 <c14a06980bbea7ab14b070b4840a92dc593a0fa7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c14a06980bbea7ab14b070b4840a92dc593a0fa7@intel.com>
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

On Thu, Apr 02, 2026 at 12:43:57PM +0300, Jani Nikula wrote:
> On Mon, 30 Mar 2026, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Mon, Mar 30, 2026 at 02:37:47PM +0300, Jani Nikula wrote:
> >> On Mon, 16 Mar 2026, Jani Nikula <jani.nikula@intel.com> wrote:
> >> > When big joiner is enabled, it reserves the adjacent pipe as the
> >> > secondary pipe. This happens without the user space knowing, and
> >> > subsequent attempts at using the CRTC with that pipe will fail. If the
> >> > user space does not have a coping mechanism, i.e. trying another CRTC,
> >> > this leads to a black screen.
> >> >
> >> > Try to reduce the impact of the problem on discrete platforms by mapping
> >> > the CRTCs to pipes in order A, C, B, and D. If the user space reserves
> >> > CRTCs in order, this should trick it to using pipes that are more likely
> >> > to be available for and after joining.
> >> >
> >> > Limit this to discrete platforms, which have four pipes, and no eDP, a
> >> > combination that should benefit the most with least drawbacks.
> >> 
> >> Ville, I think it's time to review and, pretty soon, merge this.
> >> 
> >> Our IGT changes to deconflate CRTCs and pipes have been merged, and
> >> there's the removal of invalid igt_crtc_t at [1] left. The trybot CI
> >> results on i915 for swapping pipes B and C on all platforms, not just
> >> discrete like here, didn't break anything either anymore [2].
> >> 
> >> I'm contemplating slapping Cc: stable on this too.
> >> 
> >> There's the FIXME on the CRTC index warning.
> >
> > IIRC we already concluded that the WARN is unnecessary. I'd have to
> > look through the previous mails to see what I actually said there.
> >
> >> With the A+C and B+D
> >> pairing there's no issue, the CRTC indexes remain in that order. But can
> >> we ever really end up with B+C pairing?
> >
> > It might be rare if userspace picks crtcs in order. But IIRC we had
> > bugs where it was clear userspace was just picking random crtcs willy
> > nilly. IIRC it was sway doing it, and I think I even proposed a
> > uapi documentation update to suggest using crtcs in order. Can't 
> > remember that happened to that one.
> >
> > But I think we still want the "walk the crtcs in pipe order" change,
> > mainly to keep the more optimal commit sequence. Also I'm not quite
> > 100% convinced we don't have some subtle assumption somewhere about
> > the order.
> 
> You mean convert all for_each_intel_crtc*() iterators to pipe order?

Yes.

-- 
Ville Syrjälä
Intel
