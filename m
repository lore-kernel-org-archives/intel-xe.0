Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E430C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 08:27:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC5310E448;
	Tue, 28 Nov 2023 08:27:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D8610E448
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 08:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701160036; x=1732696036;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=faBUMi0A7tpaA0xuYj5GzlAqqr2ycrp9cQqqZygjpHk=;
 b=YsEf+bmK2aF7G3ay/W8vjcYwsjMjIGaK+J5VIRfv3GsVcW85zql0a2ch
 nIfOUQ2A++dacGyrQ8bBLqI8IynIec4vmtntqVzE1OL2G5w2G26/IeFvE
 qq9zisUWP2ulYIPq3usLocQi68Tis7bjfk4drgBghp8DbPttU/Oozvxw+
 qbZqmnzJkbGw+Hlk0hhKrg0/KkHZV8Lh+tnGgXj9Va8CzCpjCiSQzGJvw
 GwRakd0O0SScbgPVSrMlT9lkjgFC43H/hlY7ITtHbQhKmENyqBHnBOsRt
 +IPEapktvaNmFPFZO5bJWFjfh3sqVs3esYpffCuItJRuM6zbzRdHZOGvO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="392626707"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; d="scan'208";a="392626707"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 00:27:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="834576476"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; d="scan'208";a="834576476"
Received: from mravivx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.42.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 00:27:11 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20231127190935.3150610-1-juhapekka.heikkila@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231127190935.3150610-1-juhapekka.heikkila@gmail.com>
Date: Tue, 28 Nov 2023 10:27:09 +0200
Message-ID: <87leai8eqq.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 0/6] revert local patches and cherrypick same
 patches from drm-tip
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

On Mon, 27 Nov 2023, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com> wrote:
> Here reverted local
> * 1c7037778222 - drm/i915/display: In intel_framebuffer_init switch to use intel_bo_to_drm_bo (12 days ago) <Juha-Pekka Heikkila>
> * d192a479c592 - drm/i915/display: in skl_surf_address check for dpt-vma (12 days ago) <Juha-Pekka Heikkila>
> * c87774bd9237 - drm/i915/display: Separate xe and i915 common dpt code into own file (12 days ago) <Juha-Pekka Heikkila>
>
> and cherrypicked from drm-tip
> | | * | | | | 12b7142e679f - drm/i915/display: In intel_framebuffer_init switch to use intel_bo_to_drm_bo (4 days ago) <Juha-Pekka Heikkila>
> | | * | | | | 185b24883e27 - drm/i915/display: in skl_surf_address check for dpt-vma (4 days ago) <Juha-Pekka Heikkila>
> | | * | | | | 1aba67132cbc - drm/i915/display: Separate xe and i915 common dpt code into own file (4 days ago) <Juha-Pekka Heikkila>

Acked-by: Jani Nikula <jani.nikula@intel.com>


>
>
> Juha-Pekka Heikkila (6):
>   Revert "drm/i915/display: In intel_framebuffer_init switch to use
>     intel_bo_to_drm_bo"
>   Revert "drm/i915/display: in skl_surf_address check for dpt-vma"
>   Revert "drm/i915/display: Separate xe and i915 common dpt code into
>     own file"
>   drm/i915/display: In intel_framebuffer_init switch to use
>     intel_bo_to_drm_bo
>   drm/i915/display: in skl_surf_address check for dpt-vma
>   drm/i915/display: Separate xe and i915 common dpt code into own file

-- 
Jani Nikula, Intel
