Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D44F36C49
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 07:49:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A7910EC60;
	Mon, 20 Apr 2026 07:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jkScjeoR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 788ED10EC61
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 07:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776671348; x=1808207348;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=g4OD85ye0xDGhfnt2oMD7Fh5xi9IEEFeVMNe/npj5js=;
 b=jkScjeoRtRBKKsgAWru6M9zKo+hHaTl7W9bfhtLpJ6QnP04Hgxr/XcZc
 CAYeGu0OEeLnk4FpiKBQqYguEVw3disw8nyRadtl9+gNaDpSQNWLKop2V
 VNyTFMyCW+NHeOfIH6xwJKrkPwnGxKVarKZM5XFzLScl0MEAcvUThU+GA
 nBy61QS9IHP0hyN6K38wTWe065S+cQT5gSMtL9E4cVRLSNo5lLkPUmmup
 zn2d/mrd9L7Y2kgF2Il9VfbfWhtrSTiA/4kzXMN9nmRBsjOgCPX1/WD+h
 X5BD9Gjn5jBSAQgqHQ0vCVxzUd7oN+1Nv7h1uPdhDOu3NffIx2tYwKupK w==;
X-CSE-ConnectionGUID: JJlAcpc0TeWMgfUQ4AtMGg==
X-CSE-MsgGUID: ozTxFAN1QcuE23kvOnGAWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="95141802"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="95141802"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 00:49:07 -0700
X-CSE-ConnectionGUID: 6SYyV5NDTC6qOlN99sQrjg==
X-CSE-MsgGUID: UmRzMV3aTKG+6+CpA5SU/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="269684511"
Received: from unknown (HELO black.igk.intel.com) ([10.91.253.5])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 00:49:07 -0700
Date: Mon, 20 Apr 2026 09:49:02 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "aravind.iddamsetty@linux.intel.com" <aravind.iddamsetty@linux.intel.com>,
 "Nilawar, Badal" <badal.nilawar@intel.com>,
 "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>,
 "Koujalagi, Mallesh" <mallesh.koujalagi@intel.com>,
 "Purkait, Soham" <soham.purkait@intel.com>
Subject: Re: [PATCH v4 06/13] drm/xe/xe_ras: Add basic structures and
 commands for uncorrectable errors
Message-ID: <aeXabs0nB8ezkyUS@black.igk.intel.com>
References: <20260417085812.4013309-15-riana.tauro@intel.com>
 <20260417085812.4013309-21-riana.tauro@intel.com>
 <20260417173854.GE7476@mdroper-desk1.amr.corp.intel.com>
 <SJ2PR11MB76194CE5B11F52874CA88CAB8C202@SJ2PR11MB7619.namprd11.prod.outlook.com>
 <20260417213235.GG7476@mdroper-desk1.amr.corp.intel.com>
 <02b7cd96-73c3-4fb8-922b-afbb8fa4d27f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02b7cd96-73c3-4fb8-922b-afbb8fa4d27f@intel.com>
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

On Mon, Apr 20, 2026 at 11:04:40AM +0530, Tauro, Riana wrote:
> On 4/18/2026 3:02 AM, Matt Roper wrote:
> > On Fri, Apr 17, 2026 at 02:25:28PM -0700, Jadav, Raag wrote:
> > > > -----Original Message-----
> > > > From: Roper, Matthew D <matthew.d.roper@intel.com>
> > > > On Fri, Apr 17, 2026 at 02:28:18PM +0530, Riana Tauro wrote:
> > > > > Add the commands and common structures for the get_soc_error
> > > > > sysctrl command.
> > > ...
> > > 
> > > > > +/* Severity classification of detected errors */
> > > > > +enum xe_ras_severity {
> > > > > +	XE_RAS_SEVERITY_NOT_SUPPORTED = 0,
> > > > > +	XE_RAS_SEVERITY_CORRECTABLE,
> > > > > +	XE_RAS_SEVERITY_UNCORRECTABLE,
> > > > > +	XE_RAS_SEVERITY_INFORMATIONAL,
> > > > > +	XE_RAS_SEVERITY_MAX
> > > > > +};
> > > > Drive-by comment:  I notice that there's a fair amount of common changes
> > > > between this uncorrectable series and Raag's correctable series, e.g.,
> > > > https://lore.kernel.org/all/20260410102744.427150-4-raag.jadav@intel.com/
> > > > However it seems that there have been some minor style differences
> > > > between the two that would be good to reconcile (e.g., this series
> > > > writes out the full XE_RAS_SEVERITY_*, XE_RAS_COMPONENT_*, etc.
> > > > whereas
> > > > Raag's series uses slightly shorter XE_RAS_SEV_*, XE_RAS_COMP_*, etc.
> > > > names).  Similar differences exist on some of the functions like
> > > > severity_to_string (taking both the device and the severity) here vs
> > > > sev_to_string (taking only the serverity) in the other series.
> > > > 
> > > > We should probably figure out which form we actually want to go with so
> > > > that we don't have last-minute conflicts as we start applying these
> > > > series.
> > > The one's in my series are consistent with uapi, but I'm okay with
> > > either one. My only concern is that we don't invent overly long names
> > > that warrant ugly wrapping while using them in the code.
> > Yeah, I don't have any strong feelings one way or the other.  But if I
> > want to apply both your series and Riana's series to the same branch for
> > tracking or testing, I'm left uncertain which series I should favor on
> > the conflict resolutions.  It would be good if we could come to a
> > decision early just so the two series don't drift apart.
> > 
> Yeah using the full word here wasn't creating longer names so i preferred it
> over abbrevations.
> I will make the patch in-line with Raag's patch in the next rev.
> 
> His series has got all RB's so might land before this series.

I don't believe we should land it without your review ;)

Raag
