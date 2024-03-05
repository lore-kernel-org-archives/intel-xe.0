Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C117CC54798
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 13:46:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7178C112AFB;
	Tue,  5 Mar 2024 13:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bPC1h61w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B13112AFB
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 13:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709646360; x=1741182360;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=9FYfbdaMxKGMXj+xYpy1/eVZZHsqi5THnS3dzKG2Y8E=;
 b=bPC1h61wMTH9T9Sh8g7SjkqVnUpzktD86hZusfQ7IFm+jGz4mQ9AleCF
 mbOLxQ/kbfO2/WCgqiA0ySd4+9FnZnzrOP3VKV64FUZy5kml1iumboZ6D
 G8D1QV6yjChOLWjxR2AImH5MdXOyYXmVGmOh+zRi0DnMqZb9hmtNJFqq2
 lSf2xM6a0TTwNBLsUG7ffFhJQcTXGIRNMCFAuWrtcG4kmuWPH0Tf+Q/mV
 kkxNx01WWxabL1ll0jEWabPQ77FuryNYvzKHoeF2LPBAG4f0JZZ2q0s7d
 MyUjaLA1cqYDGLgfy3QjLPRUkEuhJ9WucZFNJluGalE2x0c+0dh+7kKjh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4055534"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4055534"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 05:45:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="40374085"
Received: from omakhlou-mobl4.amr.corp.intel.com (HELO localhost)
 ([10.252.51.143])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 05:45:56 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Tiwei Bie <tiwei.btw@antgroup.com>, Johannes Berg
 <johannes@sipsolutions.net>, Richard Weinberger <richard@nod.at>, Anton
 Ivanov <anton.ivanov@cambridgegreys.com>, linux-um@lists.infradead.org
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: -Wmissing-prototypes warnings in user-mode linux
In-Reply-To: <9d297bf5-4f54-431b-ab8d-c5be825f129e@antgroup.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <87jzmh2chs.fsf@intel.com>
 <5d1dfb9fce5d7647ff3203080416eadc9806059a.camel@sipsolutions.net>
 <87frx52btl.fsf@intel.com>
 <9d297bf5-4f54-431b-ab8d-c5be825f129e@antgroup.com>
Date: Tue, 05 Mar 2024 15:45:52 +0200
Message-ID: <87y1aw23n3.fsf@intel.com>
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

On Tue, 05 Mar 2024, Tiwei Bie <tiwei.btw@antgroup.com> wrote:
> Thanks for raising this topic!                            
>                                                               
> Indeed. To make it easier to review, the current series only addressed
> the -Wmissing-prototypes warnings that can be fixed straightforwardly (e.g.
> by turning into static functions or including missing headers). The remaining 
> -Wmissing-prototypes warnings mainly fall into the following categories:
>
> - Symbols defined and used in os-Linux/;                
> - Symbols defined in os-Linux/, but declared in kernel headers;
> - Symbols defined in individual files and not called explicitly;
>
> My plan was to fix the remaining warnings in followup series. Ultimately,
> I wish we can let cc treat -Wmissing-prototypes warnings as errors.

Yay! That's good to hear.

If you want to get build testing from our CI, using our configs, please
just Cc: intel-xe@lists.freedesktop.org when sending the patches. You'll
get the results in reply.


Thanks,
Jani.

-- 
Jani Nikula, Intel
