Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C611606A329
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 22:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iP8nxVAi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4444010E1E2;
	Wed,  4 Nov 2026 22:04:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C1F810E1E2
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 22:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793829863; x=1825365863;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=OxOYaS2Oz6AZ8fokIkOel2mY00Acmu1q8dpfCromaMI=;
 b=iP8nxVAiotFFC4Tjw/oLU9OD541ps0FK6dRoYwYu86I+e427rJp7slor
 VuxHV0HRcOxo//4KkieSu3E07yS6Pvt7NSZt52UlefcHNIbZc/CZ5236p
 Za9bhA/v0OmRD+jxW1Agm+pzxnBT9KZ3zpOGwHcPJJbjgxplPG0urgd4A
 7NcIL3fJHUsgqVjYWAfxkSFu2Nk9N9DmYNd//HeVPWRi67qBJ0b+iBjfR
 VrfYTaDeAaPe4RveLpVv/YShnnChIWS3/cTTDZwWELjmcK9++u/aWRAxr
 QHoZ2iFvCWmi2VghFSvLu6KyXkjjHdpBx3jKBVNg8OOnv0k7HsiOYAI+c g==;
X-CSE-ConnectionGUID: /2HNrbiAS9ucrY0cKAhGiA==
X-CSE-MsgGUID: FPgBpJOoTRu5A4UCBZcWTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2597029"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2597029"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 14:04:23 -0800
X-CSE-ConnectionGUID: yMdhutKGQSqXQoSAsI1XWA==
X-CSE-MsgGUID: DKWeG9DsRS+V0LffPSd+kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7145125"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.24])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 14:04:20 -0800
Date: Thu, 5 Nov 2026 00:04:17 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stuart Summers <stuart.summers@intel.com>
Cc: driver-core@lists.linux.dev, bartosz.golaszewski@oss.qualcomm.com,
 balasubramani.vivekanandan@intel.com,
 intel-xe@lists.freedesktop.org, heikki.krogerus@linux.intel.com,
 dakr@kernel.org
Subject: Re: [PATCH] driver core: platform: tests: add a shared software node
 test case
Message-ID: <auur4ZlHSB97uiKH@ashevche-desk.local>
References: <20261104202419.30180-2-stuart.summers@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261104202419.30180-2-stuart.summers@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 08:24:16PM +0000, Stuart Summers wrote:
> Cover the pattern used by drm/xe + i2c-designware, where a software node
> assigned as a platform device's primary firmware node is handed to a
> second device via device_set_node(), and make sure removing that second
> device leaves the owner's node intact.
> 
> A potential fix for this issue in the drm/xe driver is being discussed
> in [1].
> 
> The signature in this case looks like this:
> Oops: general protection fault, probably for non-canonical address
> 0x6b6b6b6b6b6b6b73
> RIP: platform_device_release+0x6f/0x80

> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Assisted-by: LLM
> 
> [1]: https://patchwork.freedesktop.org/series/175858/

This is wrongly formatter tag block, also URL can be made a Link tag.
On top, Assisted-by is obsolete.

At the result it's expected to be

  Link: https://patchwork.freedesktop.org/series/175858/ [1]
  Signed-off-by: Stuart Summers <stuart.summers@intel.com>

And last, but not least — thanks for the test cases! It's always appreciated.

-- 
With Best Regards,
Andy Shevchenko


