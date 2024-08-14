Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2225C52D7B
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 13:15:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B959610E476;
	Wed, 14 Aug 2024 13:15:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lzAMsnJu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4970E10E476
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Aug 2024 13:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723641348; x=1755177348;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tlNv1eTJLin/7JfNJzvzSKjQSWbjvpPA+qE5w98cgCo=;
 b=lzAMsnJuwoEUw2Ck9jUOYEy1JqB9/MaKXtj1ICMoWsJ6QhKvlUG00oRn
 a08gXIny0L7btks919FZ5vgxA+x4zo3Za1wBysfg2TZGz0MnZFzrMYLcg
 /nMqpbx1wAvq+aCpzbNjrSrb3ofsn+Gc7lN3yGFjPrx0qm6j08KmWpmLm
 7JGqbCRp2mKtFQAQtrtCo4IeHzbSTkKexkNDM7Ld//FEGqxPNVkkwk0iI
 ch+oRso8jhVQ9+hYBFnqFGr9VvsjiG/x9pNgVXvfOqXv1LmTnzIIEvdDP
 vEkaQYWNltUGAl9tgPijLSRP+B2wVQxrWl5tvIZhZkcIIRWaZDio2RpSc g==;
X-CSE-ConnectionGUID: g0TggL27QWSMZc/NWsqczA==
X-CSE-MsgGUID: Pma7k56NTUWaowByFW/GCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="25659990"
X-IronPort-AV: E=Sophos;i="6.10,145,1719903600"; d="scan'208";a="25659990"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 06:15:46 -0700
X-CSE-ConnectionGUID: fHUdmprFSiWdSUe9dwRntw==
X-CSE-MsgGUID: vwFCtadFRym4oGiB1Z60Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,145,1719903600"; d="scan'208";a="63897228"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 06:15:46 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [CI] drm/xe: Rename enable_display module param
Date: Wed, 14 Aug 2024 06:15:39 -0700
Message-ID: <172364131425.3655289.3066327672559537776.b4-ty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240813141931.3141395-1-lucas.demarchi@intel.com>
References: <20240813141931.3141395-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Tue, 13 Aug 2024 07:19:31 -0700, Lucas De Marchi wrote:
> The different approach used by xe regarding the initialization of
> display HW has been proved a great addition for early driver bring up:
> core xe can be tested without having all the bits sorted out on the
> display side.
> 
> On the other hand, the approach exposed by i915-display is to *actively*
> disable the display by programming it if needed, i.e. if it was left
> enabled by firmware. It also has its use to make sure the HW is actually
> disabled and not wasting power.
> 
> [...]

Applied, thanks for the reviews.

[1/1] drm/xe: Rename enable_display module param
      commit: 1eda95cba9df35f1fb0fb4b89511beb6603c614e

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
