Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CFAC0218A
	for <intel-xe@archiver.kernel.org>; Sat,  1 Feb 2025 06:19:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B35710E283;
	Sat,  1 Feb 2025 06:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vc0CwB5j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9E710E283
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Feb 2025 06:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738390740; x=1769926740;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8IrVU7H9a/62hsbWdi8+LwQEBqFRGN7APL6vKmF+Puw=;
 b=Vc0CwB5jDWZTpCRBeFu8kXiz0RIcofsMZdb7TzXNhcdrGmenvVC04HQ3
 4bwwl8FR8QiYIuj6QpSITLNaZzqBRnD2JJzKAh6cLdr9RdDUyD8XGPa6P
 DpZHpA1lNhA1kqh0CD6PkGKcf0k7XP95ZzRi1zHFGmI/KtcJMpZHkrWPF
 p47/39cRRl7lYhsGoukp8IzMQhfTeZUFx9DOq0CWc3SKlh6TqWiYns6W3
 6Btru1hWXqtjY8rdNUCgXpxmLmRnuc8zRIfrvGPSZaqEsefKVtINAF8Nz
 bRMaup3MIq86xQNORLgO3MF7cwkiXH+94EWve2/FPnumFH33gbAV0oH2Q Q==;
X-CSE-ConnectionGUID: nNjVvVq1QOqQGLw1p7hi9g==
X-CSE-MsgGUID: aiT5mrFmR+GMJccQLEsUKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="49617082"
X-IronPort-AV: E=Sophos;i="6.13,250,1732608000"; d="scan'208";a="49617082"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 22:18:59 -0800
X-CSE-ConnectionGUID: OTgJscHvRvaMgw+zdfvZyg==
X-CSE-MsgGUID: yjbASQ67StKrpBhShTmwrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="114803290"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 22:18:58 -0800
Date: Sat, 1 Feb 2025 08:18:54 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Remove xe_dummy_exit()
Message-ID: <Z528zj96ktn45hTi@black.fi.intel.com>
References: <20250131223908.4147195-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131223908.4147195-1-lucas.demarchi@intel.com>
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

On Fri, Jan 31, 2025 at 02:39:08PM -0800, Lucas De Marchi wrote:
> Since commit 014125c64d09 ("drm/xe: Support 'nomodeset' kernel
> command-line option") the dummy exit is not needed anymore since the
> caller check for a NULL pointer. Drop it.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
