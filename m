Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A58CD37AC
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 10:37:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0509E10E18C;
	Mon, 11 May 2026 10:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mwa4Y3rz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71AB010E146
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 10:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778495866; x=1810031866;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=wAQz+/AasTEi/90jdeiVGhekU5+WliELY8V00uRfoLY=;
 b=Mwa4Y3rzoFbAFSPHy5UW0AJTZWJA4S+F813KViof9UNdFI3Iu3i+ZAMY
 tFWmuBCPTxVTapkgvZYuYnxEMJUfNDIDUOZDwGL0X2u0dy6I+EsOa9mKn
 3S8bkP53UYyYiw37Lh2WtJFXYT+iVG6VnZCcgjs6EZHo2F4IFdTc/+X3Z
 GYHVo9Y9ZfzTyq2eyWLWcImoRat6b/Q78OLWWQ9p7bcIF3F4KSVv9EmeS
 mo7kR841xBGow/kFnWUkTZxVSy5FXWDpHRXAqHeX70bRRwnr5BYhksl3P
 mz1Qn+Ara2HHZtw+T2ExtDfDmuTUs9V/i3DEOoyQqx8a91td8kl3USHIe g==;
X-CSE-ConnectionGUID: Ke+pDhqwQsuTrpduYzD3lA==
X-CSE-MsgGUID: PTzT7Y5FS4mhtMzh+geDVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="96803090"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="96803090"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 03:37:45 -0700
X-CSE-ConnectionGUID: J8qDkYZwRe6vk3NWTSl8Bg==
X-CSE-MsgGUID: BUs9YeJ9SduW5QfO5zq2oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="260891062"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.253])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 03:37:43 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>, intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2 4/8] drm/xe/kunit: Add xe_kunit_helper_is_live_test()
In-Reply-To: <20260508-rtp-mcr-check-v2-4-9897b147a5d2@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260508-rtp-mcr-check-v2-0-9897b147a5d2@intel.com>
 <20260508-rtp-mcr-check-v2-4-9897b147a5d2@intel.com>
Date: Mon, 11 May 2026 13:37:40 +0300
Message-ID: <c4e5c9ed6e931ef2d5ba5b87b7be549c8615f7c0@intel.com>
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

On Fri, 08 May 2026, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
> +/**
> + * xe_kunit_helper_is_live_test - Return true if @test is a live test.
> + * @test: the &kunit test
> + *
> + * Return: True for a live test and false otherwise.
> + */

Pardon me for being blunt, but I think this is the worst kind of
kernel-doc comment.

It doesn't provide any additional information to what the function name
and signature already convey (which is to say excellent job on naming
the function), but it fails to explain what "live test" means.

The extra bits of useful information people might need after seeing the
function xe_kunit_helper_is_live_test() in code are: What is a live
test, and what is it if it's not live? Dead?


BR,
Jani.

> +bool xe_kunit_helper_is_live_test(struct kunit *test)
> +{
> +	KUNIT_STATIC_STUB_REDIRECT(xe_kunit_helper_is_live_test, test);
> +	return false;
> +}

-- 
Jani Nikula, Intel
