Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96BEC369B1
	for <intel-xe@archiver.kernel.org>; Wed, 16 Apr 2025 07:14:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA5410E07B;
	Wed, 16 Apr 2025 07:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c0rH0SHa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B073010E07B
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Apr 2025 07:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744787689; x=1776323689;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=i41OK8bOajm1M1nATqMi79ayjPwsvmg1KuYpL5bIqHk=;
 b=c0rH0SHauDBIHZkEfxAf7s3zDFpmA1xHpCdBSjXTKCY2SNpJdhkWk+mR
 O6WJPEEjOfmCbJkOInh0wNpnlDtVbZfBTM2H0ejP13mjQG92GN/lysR8Z
 8XCHdyhsG9eYqrEfJ7ofIqK07EKH0nSkp/WcCX0wewh7wHNsYy78Memvq
 WGDeyfKPRhyDmLgtK04BX5uQySHVdpPeuU7WO/FAUE7oRPdnnxKsNbrN7
 tVfGBh/ow/K3n6gqFPfvQhYf7OGPR2wLUV9cA1GPOx2i5nf0WS9xe14bt
 xd7wVkxukPHVD7ABsdrphPk/t4xXA+KGP9fuEaBOimdHhcABAy3/qmLOq Q==;
X-CSE-ConnectionGUID: BHwzJMXMQQWSSdFgnwqSHw==
X-CSE-MsgGUID: eIx+fic7TIqJ+vP7OhSGQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46037633"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="46037633"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 00:14:48 -0700
X-CSE-ConnectionGUID: 5oyJC7rrQmSVAd+JAQGIZA==
X-CSE-MsgGUID: a92uBQPqT6WTcaiJID9U3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="135197629"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.96])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 00:14:47 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v3 3/4] drm/print: Add drm_printer_is_full
In-Reply-To: <Z/6TB/QNRrCAtbIc@lstrano-desk.jf.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250410040622.238389-1-matthew.brost@intel.com>
 <20250410040622.238389-4-matthew.brost@intel.com>
 <87h62wuson.fsf@intel.com> <Z/6TB/QNRrCAtbIc@lstrano-desk.jf.intel.com>
Date: Wed, 16 Apr 2025 10:14:43 +0300
Message-ID: <877c3kr318.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 15 Apr 2025, Matthew Brost <matthew.brost@intel.com> wrote:
> On Thu, Apr 10, 2025 at 03:06:32PM +0300, Jani Nikula wrote:
>> On Wed, 09 Apr 2025, Matthew Brost <matthew.brost@intel.com> wrote:
>> > Add drm_printer_is_full which indicates if a drm printer's output is
>> > full. Useful to short circuit coredump printing once printer's output is
>> > full.
>> 
>> The function is presented as a generic drm_printer thing, but it's
>> really only valid for a coredump printer, and will return random results
>> for other printers. Which can't even be "full" in any meaningful sense,
>> making the documentation for the function seem completely weird.
>> 
>
> So maybe:
>
> s/drm_printer_is_full/drm_coredump_printer_is_full?

Works for me.

BR,
Jani.


-- 
Jani Nikula, Intel
