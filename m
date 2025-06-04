Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2989C5B552
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 08:21:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EBAF10E635;
	Wed,  4 Jun 2025 08:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bXkv9MG1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9453210E71A
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 08:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749025274; x=1780561274;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=iJ9bGsRNpmRshUGwtNe9AkAld+uFgbj1E8p59P03tmw=;
 b=bXkv9MG1XAjgIuPp8Zjk+L9yyuUh7bc0wBde1I0wSz0Tnh6V2mAJl+pV
 64sDofsXSNU3vYXpf4AuFTfkMNSPdIoC18ggBRSSGXRcdMiQmJQR2iYtx
 /xBhXNGmyxxPFBBHHMemQiZfwEN4nI0Z2rAEZtSBAIr9v0iZBhHrwd+I5
 DEa7edX24gCa2RuqQjtH8n7xsHV0Em7FOiur2izlpmGGcEIsJGT7i+xUI
 Fi/J6MrKnx+shJQUSkZJ37tY/HGk2BY/umNSBBRplXb7vfKOHTvm4/nyH
 0qaPxujDAVIKpp/Tb+D0Y48QmbBJsEyrUHnJ/w4rpHw44J7sGFdswd10E Q==;
X-CSE-ConnectionGUID: XeEqDwteQ3GlcEsyExw3Nw==
X-CSE-MsgGUID: Q9ML1qS9QIWShowjGlH4LA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="62484252"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="62484252"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 01:21:11 -0700
X-CSE-ConnectionGUID: b5vA9ZD/T2CutEivZwyukA==
X-CSE-MsgGUID: 1V/2BxIHT1OJIIVtEJzRng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="145721329"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.101])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 01:21:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH] drm/xe/bmg: Fix NULL-ptr deref during probe on SKUs
 with no display
In-Reply-To: <IA0PR11MB7185E199BA1AC3599471432FF86CA@IA0PR11MB7185.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250602221118.306395-1-vivek.kasireddy@intel.com>
 <20250602224801.GE6239@mdroper-desk1.amr.corp.intel.com>
 <IA0PR11MB7185A38AE8BC13D4B6CAEBA7F86DA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <13b240abd3144e1830bf18d133cfabeca3261653@intel.com>
 <IA0PR11MB7185E199BA1AC3599471432FF86CA@IA0PR11MB7185.namprd11.prod.outlook.com>
Date: Wed, 04 Jun 2025 11:21:07 +0300
Message-ID: <60a9f7937cbbd953db5e6b1dacd8d0f7e6d1e775@intel.com>
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

On Wed, 04 Jun 2025, "Kasireddy, Vivek" <vivek.kasireddy@intel.com> wrote:
> I guess we need a short-term solution to address this problem, at-least
> for Xe. So, do you prefer the revert option or the minimal, safer Xe fix
> you shared above?

Yeah, let's go with the revert. Would you care to post it, please?

Thanks, and sorry for the trouble.

BR,
Jani.


-- 
Jani Nikula, Intel
