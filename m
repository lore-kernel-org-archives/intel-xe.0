Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373B4E810D9
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 12:18:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0362A10E4F8;
	Wed, 27 Sep 2023 12:18:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3749910E4F8
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 12:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695817136; x=1727353136;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=mLAt6EP9qkMydr2NHOFrc1rnppJeJtDgB5ifFP64bgs=;
 b=ZXyT/FRePeKRKT/Opo0a4NoMu85o84Bs5nNN8A0eGqr8tnt9B4W8bphP
 jZ0qNPHGk+cGra1Phf1zXNUL5+zKgyEDvr/n2nH0PFSjlqZ1Br8ZyA79p
 Wym6+UtzM43o6PknV+qPJV5F1TQyBVEnsnW1BEL5zM9nglbPujzuvypZN
 vdr2j0+7WmNNC3Vz7G1CkiD/o3duvb3S8DgMSjJH8e9n9y06TAYAeClzc
 JkCsE2Hx2C3z1/bRKYODVt0h7XdJTZytmF1LE4IbGwnSs/rYotFLx8kDN
 +AZPZrtw5XVxIlnCv+kaw2XKTSLhixkK6QKbaBzO8erEuRx/qaakDo779 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="372151876"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="372151876"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 05:18:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="892581298"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="892581298"
Received: from roomensx-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.40.191])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 05:17:46 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20230912064709.2802305-10-jouni.hogander@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230912064709.2802305-1-jouni.hogander@intel.com>
 <20230912064709.2802305-10-jouni.hogander@intel.com>
Date: Wed, 27 Sep 2023 15:18:51 +0300
Message-ID: <87o7hnkdw4.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH v3 09/12] drm/xe/display: Include i916_active
 header
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
Cc: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 12 Sep 2023, Jouni H=C3=B6gander <jouni.hogander@intel.com> wrote:
> We have compatibility headers containing dummy defines to handle lack
> of i915_active in Xe driver. Include a header to avoid build problems
> with Xe.

This has been merged to drm-xe-next, but has this been sent upstream?

Needs cherry-pick or mailing list reference.

BR,
Jani.

>
> Signed-off-by: Jouni H=C3=B6gander <jouni.hogander@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_frontbuffer.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/g=
pu/drm/i915/display/intel_frontbuffer.c
> index c567220bfaf6..d70c941dcb67 100644
> --- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
> +++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
> @@ -55,6 +55,7 @@
>   * cancelled as soon as busyness is detected.
>   */
>=20=20
> +#include "i915_active.h"
>  #include "i915_drv.h"
>  #include "intel_display_trace.h"
>  #include "intel_display_types.h"

--=20
Jani Nikula, Intel
