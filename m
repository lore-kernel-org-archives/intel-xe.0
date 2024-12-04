Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9147E7716B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Dec 2024 13:46:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D5210ED2D;
	Wed,  4 Dec 2024 13:46:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lWd5vNvl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7AFA10ED2D
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Dec 2024 13:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733319988; x=1764855988;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=tiJL532+Qt/g2RiE/c7vlfmJYqL2oa53TymtfgPrzYk=;
 b=lWd5vNvlThxGEI47aRznLknnqixmCaUskj43KgXyLxXtvVgIr7357+NX
 2tkuPTOVAurPQFMLdqtGiQz48tMQuY3Ykg36+0wAB07lIWCISxsIqrs5q
 1iaPR7yifNAeBI3+gJhrqTPem0Z8+ZdxzRlgm9skzkPYVFIq+Nnr1PNjS
 cUuj9CgimcP5ga+e/iACWaaIlRBl2i1c6gZsRtiOq0fwGcFcmm9HmBiwn
 9WL+1iAZVdJ/UR+z77teotmsQDKU63v6CIwHZ3iZS2f/GMhWM/xjbf25W
 /XWCyNpvsyR4VpkEh/BFiP6ef2PPGq7XtGr3XIR7YqfucP61Q3Nj8tQ4E Q==;
X-CSE-ConnectionGUID: pMO1qz+cSJav5C9iwQj03g==
X-CSE-MsgGUID: VqzglqQfSCqZRYtN4h9d1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="44250478"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="44250478"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 05:46:28 -0800
X-CSE-ConnectionGUID: DtaBQed/QNmFaboYeijYHg==
X-CSE-MsgGUID: bCJzwpIeQ1OfZnpYyoTcDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="98199050"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.205])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 05:46:25 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mark Brown <broonie@kernel.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, DRM XE List
 <intel-xe@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Dave Airlie
 <airlied@redhat.com>, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: linux-next: build failure after merge of the drm-xe tree
In-Reply-To: <Z1BawrcFMsj0ByLk@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <Z1BawrcFMsj0ByLk@sirena.org.uk>
Date: Wed, 04 Dec 2024 15:46:21 +0200
Message-ID: <87a5db36j6.fsf@intel.com>
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

On Wed, 04 Dec 2024, Mark Brown <broonie@kernel.org> wrote:
> Hi all,
>
> After merging the drm-xe tree, today's linux-next build (x86
> allmodconfig) failed like this:
>
> In file included from /tmp/next/build/include/linux/module.h:22,
>                  from /tmp/next/build/include/linux/device/driver.h:21,
>                  from /tmp/next/build/include/linux/device.h:32,
>                  from /tmp/next/build/include/linux/auxiliary_bus.h:11,
>                  from /tmp/next/build/include/linux/intel_vsec.h:5,
>                  from /tmp/next/build/drivers/gpu/drm/xe/xe_vsec.c:7:
> /tmp/next/build/drivers/gpu/drm/xe/xe_vsec.c:233:18: error: expected ',' or ';' before 'INTEL_VSEC'
>   233 | MODULE_IMPORT_NS(INTEL_VSEC);
>       |                  ^~~~~~~~~~
> /tmp/next/build/include/linux/moduleparam.h:26:61: note: in definition of macro '__MODULE_INFO'
>    26 |                 = __MODULE_INFO_PREFIX __stringify(tag) "=" info
>       |                                                             ^~~~
> /tmp/next/build/include/linux/module.h:299:33: note: in expansion of macro 'MODULE_INFO'
>   299 | #define MODULE_IMPORT_NS(ns)    MODULE_INFO(import_ns, ns)
>       |                                 ^~~~~~~~~~~
> /tmp/next/build/drivers/gpu/drm/xe/xe_vsec.c:233:1: note: in expansion of macro 'MODULE_IMPORT_NS'
>   233 | MODULE_IMPORT_NS(INTEL_VSEC);
>       | ^~~~~~~~~~~~~~~~
>
> You need to merge up cdd30ebb1b9f36159d66f088b61aee264e649d7a ("module:
> Convert symbol namespace to string literal") from mainline and fix up
> for the changes in MODULE_IMPORT_NS.  I'll apply a fixup for now.

Commit cdd30ebb1b9f ("module: Convert symbol namespace to string
literal") isn't even in a tagged release yet. We'll get it when -rc1 is
out *and* backmerged to drm-next.

BR,
Jani.

-- 
Jani Nikula, Intel
