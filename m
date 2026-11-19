Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57CE606A901
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 20:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CI2aBWr4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC5610E05E;
	Thu, 19 Nov 2026 20:50:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D4F10E05E
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 20:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795121438; x=1826657438;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EB4trBC5j2tDFjhzNSEIIW38w0NLc5Z19TLoWFO9ENE=;
 b=CI2aBWr4sZYvv8w0cxTk/to2M5kD+7X3jKAa9EqYpTVoxQQn/KlQPCa/
 nTQzGCGZWfl4T6Eh/Sy56brOPLBnm4MKrLfBjQqfDJeEHYSOBJ+YzNeA5
 q1GoDQfzMri6sB3cE4+ytRUFnDztjwfva4JToK9gIar2mR+ZI7tJ1oZJS
 6FjyFYdY8hj+0iwTqW/gb8PACxEcpxCLy0fIE8pJ9SmHfiN/0VURlQHK8
 TzU2Qr1JFU6FKVuM5m8xMs50GmT2iSAnIQtTkAGYtXIQma0zaOpOW6FHK
 dVubPLObgvpTDaW7ZiytJ+vVFVgxoXyYTEYxowU57Z8OBkuvjXBOZm/pp A==;
X-CSE-ConnectionGUID: 2lxwfbapQIW/ptNYaQWILg==
X-CSE-MsgGUID: QclC+ViYQeigbWpJAUz+KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3884329"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3884329"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 12:50:37 -0800
X-CSE-ConnectionGUID: o6TCV4W7R3+7eR2sT8LXFA==
X-CSE-MsgGUID: jwbH+Da3QXiViTBAaJoGIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10524786"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.61])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 12:50:35 -0800
Date: Thu, 19 Nov 2026 22:50:32 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stuart Summers <stuart.summers@intel.com>
Cc: driver-core@lists.linux.dev, bartosz.golaszewski@oss.qualcomm.com,
 balasubramani.vivekanandan@intel.com,
 intel-xe@lists.freedesktop.org, heikki.krogerus@linux.intel.com,
 dakr@kernel.org
Subject: Re: [PATCH 1/1] driver core: platform: tests: add a shared software
 node test case
Message-ID: <av9hGMZz0SZyxCQR@ashevche-desk.local>
References: <20261118223023.19653-3-stuart.summers@intel.com>
 <20261118223023.19653-4-stuart.summers@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118223023.19653-4-stuart.summers@intel.com>
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

On Wed, Nov 18, 2026 at 10:30:23PM +0000, Stuart Summers wrote:
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

This probably was a single line, make it so in the commit message despite its
length.

> RIP: platform_device_release+0x6f/0x80

...

Test cases are always warmly welcome!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


