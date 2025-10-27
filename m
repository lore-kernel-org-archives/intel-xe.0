Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E528CCF9EA
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 12:15:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F25910E0BD;
	Mon, 27 Oct 2025 12:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IOSWoBrv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFDD610E0BD
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 12:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761567331; x=1793103331;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RT8EtmbIK2LQotWq5ubIVwRLDWtvMN8QuYitTs8deMc=;
 b=IOSWoBrvwYorVvmKqjLGkbo26aGpXwkHKBFm1SZynfWajBUSs5Wfwzoq
 p8ZqYyg2TCY/kQXUZm87d1iAkJ8GhU6QYgPiJuxz78DHeQizATgzG2FGM
 JIqwnRf7qMfCUe9AonDl32U7/XcBuXBFJNqQkWEjlKY1VZi2kgxKO2MY9
 mlKOrqVRPGrc3hXthEHNTwd2J9UCKwN5VdVnT56twqf608RVZTQwdU1qs
 H0tQ1t53/P2XfU6p6JIW/QymP/DAuRglMLaM7dCgUSUkQ8TkD7Urr4N1e
 RpidrnBr3HMgX4FtULHNVOQsDW7lOSx2XxGARSo+O0coRpZhlPxwxw6mB A==;
X-CSE-ConnectionGUID: fjsWViKVQM+LDlqObSvNLw==
X-CSE-MsgGUID: HZTeACfUTc+zyjXw198gDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63345233"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="63345233"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 05:15:30 -0700
X-CSE-ConnectionGUID: ygMlLOUYTOS9ZV5ebEITXA==
X-CSE-MsgGUID: ivldggP6S/iWPGp6oDK4OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="184207487"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 05:15:29 -0700
Date: Mon, 27 Oct 2025 13:15:26 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 7/8] drm/xe/gt_throttle: Drop individual show functions
Message-ID: <aP9iXm376i4ynGdE@black.igk.intel.com>
References: <20251026-gt-throttle-cri-v2-0-41f8288a71a7@intel.com>
 <20251026-gt-throttle-cri-v2-7-41f8288a71a7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026-gt-throttle-cri-v2-7-41f8288a71a7@intel.com>
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

On Sun, Oct 26, 2025 at 10:57:19PM -0700, Lucas De Marchi wrote:
> They are all doing the same thing with the mask being the param. Just
> declare our own attribute to store the mask and provide a single
> function.
> 
> Another common pattern is to define the show function in the macro,
> however on follow up work the mask may be used for returning more
> information, so it'd need to be stored in any case.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
