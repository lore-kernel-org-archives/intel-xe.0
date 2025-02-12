Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2BBC02198
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 21:19:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A31E910E03F;
	Wed, 12 Feb 2025 21:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DgFNGqG6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F2BE10E03F
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Feb 2025 21:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739395175; x=1770931175;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TBiAvitxzt48vd+U+i5BG2HzHNymyC96VfWB4CJVfNw=;
 b=DgFNGqG6jCzcBircwkXTsGoRIMYqVkUu6qqS52FmkDZ5TPuF5WmDB/Rl
 MY2pCRgaUcMXUEKN8gMNcdXjFO1e3s+hs9ynL/xOqzxItAHnqhKaEzEEx
 DqpsdeN1gC/zztE0kHRnpuCUHq57bhNX+L1qHkHBiN+KEbpxQm9i15cCC
 B2ztHGEuJgRZnYjH7+44W3KkoN4WmzyvYIE2AprpVTadKsJGWJkcs3KX5
 pCnPE7aY6iXO8o7b5SV2UdK71BoFiSX5Y3igqZ0vOG0vmnwYKSNuOGkDM
 PadYPTxmz6+xKw5ztmfvZ85lx6NE+gkoMVruavDwrpsc1z0q4N0qb2J4n g==;
X-CSE-ConnectionGUID: xffZ02VnR5mIBtIeQPUHPw==
X-CSE-MsgGUID: M/QcsZ30S4yrFkVZWsxKxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51507398"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="51507398"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 13:19:27 -0800
X-CSE-ConnectionGUID: BeiPMkUOT0S4kR0zDomtMw==
X-CSE-MsgGUID: ZBkAw7evQkuBxZJI8utCZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113846048"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 13:19:26 -0800
Date: Wed, 12 Feb 2025 23:19:22 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 01/13] drm/xe: Add callback support for driver remove
Message-ID: <Z60QWgI68CS8TflK@black.fi.intel.com>
References: <20250212193600.475089-1-lucas.demarchi@intel.com>
 <20250212193600.475089-2-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212193600.475089-2-lucas.demarchi@intel.com>
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

On Wed, Feb 12, 2025 at 11:35:48AM -0800, Lucas De Marchi wrote:
> xe device probe uses devm cleanup in most places. However there are a
> few cases where this is not possible: when the driver interacts with
> component add/del. In that case, the resource group would be cleanup
> while the entire device resources are in the process of cleanup.  One
> example is the xe_gsc_proxy and display using that to interact with mei
> and audio.
> 
> Add a callback-based remove so the exception doesn't make the probe
> use multiple error handling styles.
> 
> v2: Change internal API to mimic the devm API. This will make it easier
>     to migrate in future when devm can be used.

Which means we'd like to go back to devm action someday, or is that even
possible? Assuming it is, and still worth it, why not try to do that
instead?

Raag
