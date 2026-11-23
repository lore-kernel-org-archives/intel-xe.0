Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8698C606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 12:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a7iE81ZW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C91A10E51B;
	Mon, 23 Nov 2026 12:12:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC7B10E3F5;
 Mon, 23 Nov 2026 12:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795435941; x=1826971941;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=W+k6fUi1ophwDJhhD1sTmn04O5XKebRs6yLgZvZsodQ=;
 b=a7iE81ZWDv8f8xWayK8v6RYcra7Sm+v+33PV4pGkFpO7tiWYpKZPpqQE
 yFY4COScVivRMkLV9eyhmx0nxbxKAtw4z549RYcyqEQ9SQPX0q8WuAkRE
 IjBlMX+23L2xwns+tZWF1OFMYlQa+i3l2OGtEW1NYtYnxfPfRRb2tSpfy
 1Fw3AgWVvfapruzochHzDA71H2miDiyD86lLIAYoGScaCvSvMroOq1x/n
 PlLouNN0WuQXtR5q9yIcFR4MA9UdgFeVtQqSrmW19s5dpUd5isGr/8l+4
 X/hB3K1nJJzpJT+AB9F/ql3zFzL5FCGL5gBYNazYfCDdutWTKidN2mWGM g==;
X-CSE-ConnectionGUID: 9A5w3LkoQYWnVKvJDSnubQ==
X-CSE-MsgGUID: Pgi32q52RxigJSXhlSRYQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4138401"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4138401"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 04:12:21 -0800
X-CSE-ConnectionGUID: YREfu2RZQ3ytyehKMAX55A==
X-CSE-MsgGUID: UeMShTqzRSi4oEYDX2lSEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11269968"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.16])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 04:09:10 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Eriksen Xie <xiaolu.xie@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>, Arun R Murthy
 <arun.r.murthy@intel.com>, Mika Kahola <mika.kahola@intel.com>, "Nautiyal,
 Ankit K" <ankit.k.nautiyal@intel.com>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Imre Deak <imre.deak@intel.com>, Eriksen
 Xie <xiaolu.xie@intel.com>
Subject: Re: [PATCH v2 0/2] drm/i915/lt_phy: Fix the ML to TX mapping
In-Reply-To: <cover.1795156437.git.xiaolu.xie@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <DS4PPFE901A304FFE20F33BBF2CAE5C4009E3782@DS4PPFE901A304F.namprd11.prod.outlook.com>
 <cover.1795156437.git.xiaolu.xie@intel.com>
Date: Mon, 23 Nov 2026 14:09:08 +0200
Message-ID: <fd03c9af88037c78b8bf6d1b49d38157adf16729@intel.com>
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 20 Nov 2026, Eriksen Xie <xiaolu.xie@intel.com> wrote:
> v2: Split into two patches as requested by Suraj Kandpal.

For future reference, please don't send whole series in-reply-to
previous version of the series. It has a good chance of confusing both
the CI and the people.

BR,
Jani.

>
> Eriksen Xie (2):
>   drm/i915/lt_phy: Enable TX2 for single lane DP-alt links
>   drm/i915/lt_phy: Fix the ML to TX mapping for voltage swing
>
>  drivers/gpu/drm/i915/display/intel_lt_phy.c | 32 ++++++++++++++-------
>  1 file changed, 22 insertions(+), 10 deletions(-)

-- 
Jani Nikula, Intel
