Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A5FEB64DA
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 10:03:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D60910E59C;
	Fri, 16 Jun 2023 10:03:21 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6C710E59C
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 10:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686909799; x=1718445799;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WgZ30HWJYFDIulztHxfjfLGYrIooH3ZySU+JdKvoVts=;
 b=VH9F53xX71uKXHtms7aEF8jCs7ExUv/txUH8c4gv6CDLjU9I1sBCMXIM
 PQ1CXv6XCxzuhsdRUZZOo4p0FmW2weCBP720vIXxio21uLPe/MztHxCUY
 LvPVoiVpYFEV/pzom9v0qa1OsbMMnU2qH0/uv6t0Sv6omXt6V0nXZTNYI
 z9f+R0V5qzLeXdXexggd+lzPYJ6Qsi5BTsNDraHJqLqepcA/HQg0IvCz4
 c0HOAq1vMrZD3zihmhteyMKotzyewPmbguGkH9JiDNpeaAXnV6ye41hjU
 t9yO+869LMk26z45rw4aaH/c0s/mHwTxjydX46pu0taS4FC02WvVv+MEL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="422827939"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="422827939"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 03:03:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="1043041917"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="1043041917"
Received: from vyashin-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.36.124])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 03:03:15 -0700
Date: Fri, 16 Jun 2023 12:03:12 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Message-ID: <ZIwzYJd+1Q6rnslF@ashyti-mobl2.lan>
References: <20230616092521.3862926-1-riana.tauro@intel.com>
 <20230616092521.3862926-2-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616092521.3862926-2-riana.tauro@intel.com>
Subject: Re: [Intel-xe] [PATCH v2 1/2] drm/xe: add a new sysfs directory for
 gtidle properties
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
Cc: joonas.lahtinen@linux.intel.com, vinay.belgaumkar@intel.com,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Riana,

On Fri, Jun 16, 2023 at 02:55:20PM +0530, Riana Tauro wrote:
> 1) Add a new sysfs directory under devices/gt#/ called gtidle
>    to contain idle properties of GT such as name, idle_status,
>    idle_residency_ms
> 
> 2) Remove forcewake calls for residency counter
> 
> v2:
>     - abstract using function pointers (Anshuman)
>     - remove forcewake calls for residency counter
>     - use device_attr (Badal)
>     - move rc functions to guc_pc
>     - change name to gt_idle (Rodrigo)
> 
> v3:
>     - return error for drmm_add_action_or_reset
>     - replace file and functions with gt_idle prefix
>       to gt_idle_sysfs (Himal)
>     - use enum for gt idle state
>     - move multiplier to gt idle and initialize (Anshuman)
>     - correct doc annotation (Rodrigo)
>     - remove return variable
>     - use kobj_gt instead of new gtidle kobj
>     - move residency_ms to gtidle file
>     - retain xe_guc_pc prefix for functions in guc_rc file (Michal)
> 
> v4:
>     - fix doc errors in xe_guc_pc file
>     - change u64 to u32 for reading residency counter
>     - keep gtidle states generic GT_IDLE_C[0/6] (Anshuman)
> 
> v5:
>     - update commit message to include removal of
>       forcewake calls (Anshuman)
>     - return void from sysfs initialization function and add warnings
>       (Andi)
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>

looks good!

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
