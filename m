Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74193C52D6F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 11:05:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335C010E623;
	Thu,  8 Aug 2024 11:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q0qbyU0D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 903A110E623
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 11:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723115108; x=1754651108;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dXHWCjzIFKrM91O2wVyVB1k9gdog5+WHHp2IFJLVAmc=;
 b=Q0qbyU0D2lmbfyhiYlS1ZlYav0KuNbP2nq3Y/F20o98bo9tG8MyCsDm+
 OmOSXTlJa7cM7sP4lTtSNHoxuwbjWW+B04ygihPT/dNmtOdSPEBioQINS
 LubJ+Nl3h/IePuVDT48Cdpulccq0QKBTcoYwOeYxyr19oXwsenI0M5N5i
 8Ob9TFqYbapQBm7C2vXj8fDhPf3OnsA4MrXQWJMa0bEf9czXRdGVEcpWc
 g5PiBAvR3ddIQIFqn8JOqeL+y7vndxgJjBnzxz28Bb5Exd0wdsveuVhwr
 fcWrkdQ6OQ52llJ+Qo+GMoQw1R0X0FJQtxLeKUEetStixvI+oEFFEmV6D g==;
X-CSE-ConnectionGUID: 5FKV3LWBRrqrcHwZH4C5Lg==
X-CSE-MsgGUID: EpM/SPOWTVO+ZWHlQnucNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21091226"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="21091226"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 04:05:07 -0700
X-CSE-ConnectionGUID: m6mXSVaKSVu6Yav75Fr9Ow==
X-CSE-MsgGUID: A+uhGPFcQWKqEu2+8ovjdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="87834103"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.245.71])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 04:05:05 -0700
Date: Thu, 8 Aug 2024 12:04:59 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: Re: [PATCH 01/21] drm/xe: Export xe_hw_engine's mmio accessors
Message-ID: <ZrSmWxfbsqV0FeeZ@ashyti-mobl2.lan>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
 <20240726140818.54304-2-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726140818.54304-2-mika.kuoppala@linux.intel.com>
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

Hi Mika,

On Fri, Jul 26, 2024 at 05:07:58PM +0300, Mika Kuoppala wrote:
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> 
> Declare hw engine's mmio accessors in header file.
> This is in preparation to use these from eudebug code.
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

with the renames suggested by Matt:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
