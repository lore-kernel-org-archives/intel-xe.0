Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7CB606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 14:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=It4yQLp9
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6805D10F65C;
	Tue, 24 Nov 2026 14:16:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0748910F65D;
 Tue, 24 Nov 2026 14:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795529768; x=1827065768;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=Pi2CxIkktlb14Deufma4YQB7FFyuT5rxKNn53r9gnLY=;
 b=It4yQLp9UMMkg5Y+whBQ/Ag9TvWiz4+dR0r8px9yEjXEmm7MxL1OUvDQ
 zp+FFzQqD8sEpsOXeXBqFbFRDnyVLtAbWXj/j4qJwPCC9/Wdv9JmxDJH6
 KpL8GRpgHSVyG0bK5qT4tJXJWSiq4lO035z0bl/lI5ckDusIektMalmvC
 ADsOCGN4yhJAzw6otbRXrpjCtbpoH3DFuqkauUemO5CTgm8L/NlPVRENg
 w8RasJVEMiHkmGkMOZBKBX3N7B9yoFOgJq9f5AIDiEUlCn1+XZCyA1A1f
 bvK+UWywHTfG2SlbGWcgmCOMW0gfIBehEVcmsNt95eCkl2GKBYNLyLe6T w==;
X-CSE-ConnectionGUID: OhCE/Cd1RQWl4ZR2MfYsCg==
X-CSE-MsgGUID: bX3o8w31QUaZRQlruoMEHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4218111"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4218111"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 06:15:25 -0800
X-CSE-ConnectionGUID: 0F3GIxOqR8KGizTAGikSvg==
X-CSE-MsgGUID: Up43Zn2pSmedj/scHUUfqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="11766300"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.138])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 06:15:24 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/i915/display: don't be cute about printing
 enabling/disabling
In-Reply-To: <20261124141040.1560003-1-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261124141040.1560003-1-jani.nikula@intel.com>
Date: Tue, 24 Nov 2026 16:15:22 +0200
Message-ID: <9fb335fb1626f6e0ec0614cd24a7b4af10be7874@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 24 Nov 2026, Jani Nikula <jani.nikula@intel.com> wrote:
> Convert "%sabling", enable ? "en" : "dis" patterns to use
> str_enable_disable(). The imperative is just fine here.

Please ignore, I fumbled while sending the patch. See [1] instead.

[1] https://lore.kernel.org/r/20261124141146.1560208-1-jani.nikula@intel.com


-- 
Jani Nikula, Intel
