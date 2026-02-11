Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A0FE9E309
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 13:29:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 125FD10E055;
	Wed, 11 Feb 2026 13:29:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="djKpoIPk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F25BA10E02A;
 Wed, 11 Feb 2026 13:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770816590; x=1802352590;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=gLpm7dDSxnfrlsXVu2MEpHtLinDCiWYkQTzG3wIavo8=;
 b=djKpoIPkwHfYMVWXwvWqvOtVEW8z83iqEvvZHOStjrpuLweoEgViSgic
 KMhD1ZA2/LrKwcBjz0WqxCIfrRkH0kDgVOMOODkeczsfFNeI0DiYxOpfo
 LYcf5ayIyxXY8wXo8ITj61UNNtLI/h4ctRTJY5muQtMSkuOq1efBhdqM0
 oG8M3hcFCV0HuOiH2yDBDoCjCErVJtmENRUVKjcDfTCZnueWLzYNpts5F
 bU7wZ225LDewCsaNhB8KvJovJ6AOywmVuMMOAiINQ/vWx6pxuS30wTrS+
 Px472yzzBWgKSC/Px1TRztz9qQoJ9F3nhDvR9mEQU5JB6gOZCQsyFWURR A==;
X-CSE-ConnectionGUID: 8pDIJI2DRMqWnN+TYg3luw==
X-CSE-MsgGUID: i1b9bGfjROmDilVpiIKTig==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71862472"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71862472"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 05:29:49 -0800
X-CSE-ConnectionGUID: akBCJI2rSWib5pjO+ivptA==
X-CSE-MsgGUID: z3Dy5xlwTzyboDgkNnnQrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="212272558"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.57])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 05:29:46 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Cc: andrealmeid@igalia.com, christian.koenig@amd.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, mripard@kernel.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH 2/4] drm/doc: Document DRM_WEDGE_RECOVERY_COLD_RESET
 recovery method
In-Reply-To: <20260211115946.2014051-8-mallesh.koujalagi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260211115946.2014051-6-mallesh.koujalagi@intel.com>
 <20260211115946.2014051-8-mallesh.koujalagi@intel.com>
Date: Wed, 11 Feb 2026 15:29:42 +0200
Message-ID: <baaa52a6b75c783b7f65e626b7577e383e0da5b8@intel.com>
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

On Wed, 11 Feb 2026, Mallesh Koujalagi <mallesh.koujalagi@intel.com> wrote:
> Add documentation for the DRM_WEDGE_RECOVERY_COLD_RESET recovery
> method introduced for handling critical errors. This method is
> designated for severe errors that compromise core device functionality
> and are unrecoverable via recovery mechanisms such as driver reload or PCIe
> bus reset. The documentation clarifies when this recovery method should be
> used and its implications for userspace applications.
>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>  Documentation/gpu/drm-uapi.rst | 73 +++++++++++++++++++++++++++++++++-
>  1 file changed, 72 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index d98428a592f1..eae6aef68876 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -418,7 +418,7 @@ needed.
>  Recovery
>  --------
>  
> -Current implementation defines four recovery methods, out of which, drivers
> +Current implementation defines five recovery methods, out of which, drivers

"several" to avoid having to update this?

>  can use any one, multiple or none. Method(s) of choice will be sent in the
>  uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
>  more side-effects. See the section `Vendor Specific Recovery`_
> @@ -435,6 +435,7 @@ following expectations.
>      rebind          unbind + bind driver
>      bus-reset       unbind + bus reset/re-enumeration + bind
>      vendor-specific vendor specific recovery method
> +    cold-reset      full device cold reset required
>      unknown         consumer policy
>      =============== ========================================
>  

-- 
Jani Nikula, Intel
