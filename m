Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED62CD5BD1
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 09:39:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C698810EEF1;
	Thu, 28 May 2026 09:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aq91de6v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9460E10EEF0
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 09:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779961184; x=1811497184;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AWg4xff2d29L+fOqoM8/xNP8j+thsvJk5u4JTbthY+Y=;
 b=Aq91de6vs3qXLm8b0wDVZfGe4wF5PWvWMzSPwb5Uyy2fnYxAKLxMEPqo
 mjosBPmwe8Txj8zVvVImAa8D+SxWLWcbiw6wrObWiv8035HRFPZCBRval
 /rpWAbmdDv+O7O6WUiVpvjPjrGMHAdUZhbQm5uLbMu3VVQBp7ailwxY5h
 ngqwAE8uyi1RzU8tHzu1GBMt3meNuATdoD1Mbi9Or9w14E+6kCyk6A1ux
 32vviukgvGfoHnzutmbNaevV76BhqeJFxHpqCDQ3+ifcUqLNwR2bEfMvK
 cWCKaaY9x/D0yA8vsj6f/d7TLP1IlEcQPOn1Towq4r7AwgkAeetkYRBwk w==;
X-CSE-ConnectionGUID: aNTOwbCGQ8arFjUVdmb7jw==
X-CSE-MsgGUID: t9Fu1RNlQo6Kk7njowS8wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="79949703"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="79949703"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 02:39:44 -0700
X-CSE-ConnectionGUID: aAKBansIQU6JQhpt4fo6pQ==
X-CSE-MsgGUID: HFBPgRPPSS2P9PLIfCrYhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="239498306"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 02:39:42 -0700
Date: Thu, 28 May 2026 11:39:39 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH v7 3/6] drm/xe/xe_ras: Add support to clear error counter
Message-ID: <ahgNW0Z9eQmQzGzY@black.igk.intel.com>
References: <20260527060241.3351323-8-riana.tauro@intel.com>
 <20260527060241.3351323-11-riana.tauro@intel.com>
 <ahgK4dvEKdSWnN7e@black.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahgK4dvEKdSWnN7e@black.igk.intel.com>
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

On Thu, May 28, 2026 at 11:29:10AM +0200, Raag Jadav wrote:
> On Wed, May 27, 2026 at 11:32:45AM +0530, Riana Tauro wrote:
> > Add structures and helper function to clear error counter value.
> 
> ...
> 
> > +	ret = ras_status_to_errno(response.status);
> > +	if (ret) {
> > +		xe_err(xe, "sysctrl: clear counter command failed with status %u, err %d\n",
> 
> '%#x' specifier for status, it comes from the hardware. Also, I think
> err is redundant here since it's just our interpretation of status (which
> is already present) and it doesn't really help debug anything.
> 
> > +		       response.status, ret);
> > +		return ret;
> > +	}

Forgot to add

> +	xe_dbg(xe, "[RAS]: clear counter for %s %s\n", comp_to_str(counter->common.component),
> +	       sev_to_str(counter->common.severity));

Use 'clear counter value' for consistency. I'll be using 'counter threshold'
terminology in my series.

> Reviewed-by: Raag Jadav <raag.jadav@intel.com>
