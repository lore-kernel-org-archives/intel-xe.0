Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93AAC87FCF
	for <intel-xe@archiver.kernel.org>; Sun, 10 Aug 2025 09:26:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 598EB10E258;
	Sun, 10 Aug 2025 09:26:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QDJlSNUT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 385FB10E259
 for <intel-xe@lists.freedesktop.org>; Sun, 10 Aug 2025 09:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754817964; x=1786353964;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ki0mbjQldD6fYCgTtc1Wkg2nAgwO4iPm6EL1k8LSmqA=;
 b=QDJlSNUTu80fT0SjsC4tovC5TiZIEq+XeKUxjwJumBs+DXtQXu9ebO3s
 HS4vkFqk9ALTK6kxkP2A2vOE6zZokUkC/bRTmMWiVv4JdVbFxmy8ucSPx
 Kt5q95c5VstaM1TqyV/k/P4BXnri4P1zWmEz4CN1LS29IarzQZfVnabb8
 75MAod5OqGZoVtjCSOWgHC/UIXmvEgXM6/PHoSVMZTbGNwtH0WU9TeDNE
 lnw4JC2X18hN3bVCIn2P51JyW7pqZTfML5KVnFDf9201SFf+BmiWsh3hs
 En2G3NRvDkb3L/qG7GLnCxUKspnSRtSWsD6NdfgI3m10o1B1ksLxNf+c5 g==;
X-CSE-ConnectionGUID: 68LHdKoZSlSqrDd/LXh/0g==
X-CSE-MsgGUID: EnH6OE2jT6ChL/44lshY2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11516"; a="57164274"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="57164274"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2025 02:26:04 -0700
X-CSE-ConnectionGUID: SRR2vVwQQcKlEAa9AKXDUQ==
X-CSE-MsgGUID: /gROw2/rSUyXNz3H7dDp0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="165562652"
Received: from unknown (HELO black.igk.intel.com) ([10.91.253.5])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2025 02:26:03 -0700
Date: Sun, 10 Aug 2025 11:26:00 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: stuartsummers <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe/pcode: Initialize data0 for pcode read routine
Message-ID: <aJhlqGvzbAZjH5OR@black.igk.intel.com>
References: <20250808153656.67098-1-stuart.summers@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808153656.67098-1-stuart.summers@intel.com>
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

On Fri, Aug 08, 2025 at 03:36:56PM +0000, stuartsummers wrote:
> There are two registered filled in when reading data from
> pcode besides the mailbox itself. Currently we allow a NULL
> value for the second of these two (data1) and assume the first
> is defined. However many of the routines that are calling
> this function assume that pcode will ignore the value being
> passed in and so leave that first value (data0) defined but
> uninitialized. To be safe, make sure this value is always
> initialized to something (0 generally) in the event pcode
> behavior changes and starts using this value.

I'm not particularly against it but let's say if/when this happens,
can you guarantee the expected value to be 0?

Raag
