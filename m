Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F4DCD5BC9
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 19:01:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54EB410E3C2;
	Mon, 25 May 2026 19:01:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bPDnyd9e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 348BD10E3C2
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 19:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779735705; x=1811271705;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YiEZ0mgWnWtv8SzN1kEgARdZkemgCr1vrYogwbbOBDs=;
 b=bPDnyd9e6KiUhNlte0vOJLIpcI4XDZJwAG4SKKVHG2LvboiUuLB+Xrs7
 4ntSQzMqo4XQaEhiQeAZ9xCG5T9tknNeKxHO5a9Uy689YAdj8/+11IHXN
 wnp6DdmBWPNRlLjlQRbbO8/8mmAijOegXQCFhqCOb4rEkii8URPnAbWKj
 UrM7znMT57CeOWcUfCMjHVLOMobryR35XeZdH7q4M6UTVpxzsdPP+2Y/8
 TYq7B2OLjos9paLF4Ef1MU+VvM2kvtSORbmpWsZ5xZI8w6CciaHiOhRFq
 7/DBud2OGDk6359YhOUDCTXBY5Legi0LusqPaEZMdUY2ipDrY1c9nqFAL g==;
X-CSE-ConnectionGUID: ssXNxqoVSk2JLP0lDk7U7A==
X-CSE-MsgGUID: 6zZiKiwxRUysYJcKYKrUJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="91944536"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="91944536"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 12:01:44 -0700
X-CSE-ConnectionGUID: iblxOTAVRei12S30+hDXEw==
X-CSE-MsgGUID: 15f4SIlSSaSzzzuLztz2Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="272004821"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 12:01:41 -0700
Date: Mon, 25 May 2026 21:01:39 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH v6 02/15] drm/xe/xe_sysctrl: Make sysctrl flood limit
 reusable
Message-ID: <ahSck3AMcnufBiha@black.igk.intel.com>
References: <20260525100619.3155663-17-riana.tauro@intel.com>
 <20260525100619.3155663-19-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525100619.3155663-19-riana.tauro@intel.com>
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

On Mon, May 25, 2026 at 03:36:21PM +0530, Riana Tauro wrote:
> The sysctrl command flood limit was defined in an event specific header,
> restricting its usage to event handling. Move it to the shared header
> with a generic name so it can be re-used across all files

Why the early wrapping? Please utilize the full space where possible.

> using system controller commands.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
