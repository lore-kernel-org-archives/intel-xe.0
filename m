Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274AB606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 16:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OW/0Pn8K
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC83891BA;
	Tue, 27 Oct 2026 16:32:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF51B10F749
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 16:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793118718; x=1824654718;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=SpcxHmUlZ5eOpgi5fpbYivp8oq6o9byKn9qiEwqYdoM=;
 b=OW/0Pn8KyPY7bWhxXBJJtS50NNAQK94IUhhy87olmPcwsQzOPzEHGwyT
 PTlJMfqa6sEcuyfcKd98uOdnAq0bCbh4v1VqS2I3QboxJy9sn9vLs+g84
 9V41uQHuFqniz3ffCs2t5C8ORgIHCodOziqyzKCNd9AH2XQcfX9gtVQPx
 gZwMV4s7Ll9lpzNXfDdgzNwyjWboYfjqn+SAg3LbtVPcw6/5VTfIUG7Ge
 aAdxXTtSZlRMWeDZe9DlsDy+xSDuQ2ju5FOgxY8cdGoGLMssw8hU/1+D3
 X5zLWh+JIwNqoWCaplTmMeabo9cB0UXe89PLLQVSP/LnYQK0+Fvmn3coT g==;
X-CSE-ConnectionGUID: igV+UhcwQi6iH9kDT6vfJA==
X-CSE-MsgGUID: bk8FwgcvRfqDr0/ZISXkSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1836841"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1836841"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 09:31:57 -0700
X-CSE-ConnectionGUID: uxaHIloeTIWDtV1/rXwcYQ==
X-CSE-MsgGUID: PsoOWIANQz6WQTnNZJF5hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4487584"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.247])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 09:31:56 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Ville
 =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [PATCH v7 5/5] drm/xe/ggtt: Add KUnit tests for usable and
 shareable pools
In-Reply-To: <20261021085716.709503-6-piotr.piorkowski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261021085716.709503-1-piotr.piorkowski@intel.com>
 <20261021085716.709503-6-piotr.piorkowski@intel.com>
Date: Tue, 27 Oct 2026 18:31:53 +0200
Message-ID: <af0830362243e3f3d7289e853b8d72856faf7419@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 21 Oct 2026, Pi=C3=B3rkowski, Piotr <piotr.piorkowski@intel.com> wr=
ote:
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index b7e3d626e8cb8..3dd029bc76dfc 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -1395,3 +1395,7 @@ u64 xe_ggtt_node_size(const struct xe_ggtt_node *no=
de)
>  {
>  	return node->base.size;
>  }
> +
> +#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
> +#include "tests/xe_ggtt_kunit.c"
> +#endif

Why IS_BUILTIN()?

It smells like a mistake.


BR,
Jani.


--=20
Jani Nikula, Intel
