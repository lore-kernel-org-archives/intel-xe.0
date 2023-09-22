Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A209ACD4F41
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 09:30:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3224410E05B;
	Fri, 22 Sep 2023 09:30:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29DD10E05B
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 09:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695375015; x=1726911015;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=znO2WwVG4/+rRa1JafBSaMpZzBGiAGRz8jXgeH3y9h4=;
 b=YQ84GQwF/DT6OiPQnurBldKGOZ5SrPn7n3P7PdAIz68rje2kjbPkot8c
 iZ5tPF43SlN2G30xN199wPBUD7Zk8T9BUNCvtvCMs6Y3QEI0eTXP1Wbol
 EBEMOWsEW7gq5pCONlKlw7ETgFkArmxrJzyENS3z8hnelQ5tWxz+Vs2oG
 AZybs6Z051XX95+o2zzyNeQtPPPIW4Qd/ZRptTrXAREeksOgd3bSLlsJi
 3sg4GODmkDZZO92d2K/S2YSWQnFxZGnYof0TknA+Vk+E5Ov3FLAkxnztK
 Y42HKuWf3XGzco1C1vqG/ODQ9TiFmjknp0AQKSsHCLv1hT+ul9VzVKant w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="379664805"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="379664805"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 02:29:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="724114351"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="724114351"
Received: from aboreiko-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.50.131])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 02:29:51 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20230922082909.334085-1-suraj.kandpal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230922082909.334085-1-suraj.kandpal@intel.com>
Date: Fri, 22 Sep 2023 12:29:48 +0300
Message-ID: <87r0mqo8s3.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 0/3] Remove Stubs in HDCP code
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

On Fri, 22 Sep 2023, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> This patch series aims to remove stubs from code in HDCP code.
> Patches 1 & 2 are just added so no rebase issue is created later
> and for buildbility patch 3 is what we actually aim to merge.
> Patch 1 brings HDCP code in par with current i915 state (removes stub).
> Patch 2 is i915 refactor which has been already floated.
> (https://patchwork.freedesktop.org/series/123955/)

This should probably not be merged before the upstream change has been
merged, so a) we can be sure we don't need to rehash this, and b) we can
reference the upstream commit with git cherry-pick -x.

BR,
Jani.

> Patch 3 adds the definition of intel_hdcp_gsc_check_status in Xe.
>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
>
> Suraj Kandpal (3):
>   drm/i915/hdcp: Remove i915 check stubs
>   drm/i915/hdcp: Move checks for gsc health status
>   drm/xe/hdcp: Define intel_hdcp_gsc_check_status in Xe
>
>  drivers/gpu/drm/i915/display/intel_hdcp.c     | 13 +------------
>  drivers/gpu/drm/i915/display/intel_hdcp_gsc.c | 14 ++++++++++++++
>  drivers/gpu/drm/i915/display/intel_hdcp_gsc.h |  1 +
>  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c      |  5 +++++
>  4 files changed, 21 insertions(+), 12 deletions(-)

-- 
Jani Nikula, Intel
