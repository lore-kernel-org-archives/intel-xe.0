Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A189FD78321
	for <intel-xe@archiver.kernel.org>; Mon,  2 Dec 2024 14:02:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5C510E740;
	Mon,  2 Dec 2024 14:02:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PDzusRld";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1A510E742
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Dec 2024 14:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733148138; x=1764684138;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zgKYzr0CY/jG0zaLZsAeRQ8oJ4bjmUvjxSKEsgbbxWA=;
 b=PDzusRldXTjiuGEmeuBj0IwNaF0B1JT72rfQ/Rok1eQI3Kx9IUyfnnt/
 y0JwB+p2Lvwx91jnuAYIsTmkUriB6fRehpDp+bKmQ5O6RS/3afaPXqlma
 CSa9WDhF3w3PKim48x+jNkjS4XknwKiBiW7yQkqx2+/+vsc5q9EW6Z3wG
 7UvED9guKNZhbkEMNZoqU43iYnI6XznMMP86WGs1AzEAeq0m/+CuWuOg7
 BYDFE8yQZRwaPy1bE5KMUyKj+CUB2bSnto7lXP44BP31CIAj5/TpN/hLK
 3o9uA8O9RhZom+MVVK7a8CkNsOeOQHNJpl6UFmHdseGupBgERtPbwKBGM g==;
X-CSE-ConnectionGUID: UB4BNQHiQvOtz93OBIK4iw==
X-CSE-MsgGUID: 16GStDCNQ+yWgFIIPKvoDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="20908739"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="20908739"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 06:02:17 -0800
X-CSE-ConnectionGUID: RRzax4BXRRWxAVfa1ADnxg==
X-CSE-MsgGUID: pDOwdpJjQJWSrc4+NhYNpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="98218650"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 06:02:15 -0800
Date: Mon, 2 Dec 2024 16:02:11 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>, rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 Michal.Wajdeczko@intel.com, ashutosh.dixit@intel.com,
 matthew.brost@intel.com
Subject: Re: [PATCH v2] drm/xe/throttle: Log throttle reasons
Message-ID: <Z02941ro8eHHTxTM@black.fi.intel.com>
References: <20241129074300.1304068-1-raag.jadav@intel.com>
 <9f227ba3-4f59-418e-bd20-dbb462aaccc4@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f227ba3-4f59-418e-bd20-dbb462aaccc4@intel.com>
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

On Mon, Dec 02, 2024 at 12:20:45PM +0530, Riana Tauro wrote:
> On 11/29/2024 1:13 PM, Raag Jadav wrote:
> > Log throttle register MMIO reads which will be useful for debugging.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Looks good to me
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>

Thanks.

Rodrigo, can you please pick this one if it's okay?

Raag
