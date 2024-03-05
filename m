Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2122C54798
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 10:34:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AFB610E411;
	Tue,  5 Mar 2024 10:34:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D7Q9cjD2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C1310E411
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 10:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709634886; x=1741170886;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=CKWqMeXaguj2O1SU6aYTYqiVH3n8gyOTaC81E2YhK+g=;
 b=D7Q9cjD2UshvOTl6U1qNi8q/JD6as6i6OL/n0Z5R7aXkmU1gtMLTZGFH
 7be7PzR+XB5hIaA19y8gJwApGoUNhTBt8GYKTiUNKnws7lvn0/EcLcCnp
 dhsRdrxjzmh6sEqtglGWTheRl89H7l/g+IzGbL0Nox0xXeSHIiD8aOq8O
 4zJA8AIBguhqV1pnGdBg96dpsmhibIqP6zk3r8JGjOc3rxnDzJcr9vDdw
 0t8smf7J2DtY3qdnuXhsPibo6xLzvAyGat1/P/ighT48CGVlmZGjQpcCb
 wdQVoyVINmfyS7MalmAFdvUEl7WSqj9S7dRfdalm0W2YwivGp418kfB5c g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="14824320"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="14824320"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 02:34:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="13926501"
Received: from omakhlou-mobl4.amr.corp.intel.com (HELO localhost)
 ([10.252.51.143])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 02:34:42 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Richard Weinberger <richard@nod.at>, Anton Ivanov
 <anton.ivanov@cambridgegreys.com>, Johannes Berg
 <johannes@sipsolutions.net>, linux-um@lists.infradead.org
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: -Wmissing-prototypes warnings in user-mode linux
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Tue, 05 Mar 2024 12:34:39 +0200
Message-ID: <87jzmh2chs.fsf@intel.com>
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


We're seeing a lot of -Wmissing-prototypes warnings when building
user-mode Linux. For example, our CI hits things like [1], and it's just
extra noise in the build.

I started adding some prototypes, but I lost my way around the arch/
subdirectory a bit. I'm not always quite sure what should or could be
included where, or whether a new header should be added instead, etc.,
so it wasn't going as quickly as I'd hoped.

Do you perhaps already have plans or, better yet, patches to address
this? Feels like it should be fairly quick for someone familiar with the
arch/um codebase.


BR,
Jani.


[1] https://lore.kernel.org/r/170963008487.503981.6735326012843985651@8e613ede5ea5



-- 
Jani Nikula, Intel
