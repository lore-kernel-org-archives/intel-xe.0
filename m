Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05BF8C531DC
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 07:59:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7CC310E164;
	Fri, 23 Aug 2024 07:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VGTS/Zji";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C92410E164
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Aug 2024 07:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724399946; x=1755935946;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=n0Js8YFCuPXuDDK/Oa0j9kH7x8sGcMf/DEbStYEkeqM=;
 b=VGTS/ZjixfH8cdNdD2AOxhzjxp2cjYNBzMK1/BOW3RTfuTzqStc6f4XP
 68yV6ZnVapJTbzPAU4x5BS+fXQ2ZJoNA6bP7yNTlLFPqBsbLS6D98KT0R
 T9Y5tNv9JiCObWV8WtUZ+8BxK37LYCk0NFIl5w5FDmL/UabuXYtt6qi9j
 AR9Lr7Gom1csCoaGdPdDp8MOKYUqDUrlQrKfKgaM30VgRYsng+RELCYSy
 i9C8RUvw4FtlgWUsyIJhVOyI2so+A2+gs0X2qpBWainR7Zx9GswyVA426
 yU32hoqURNlCj/fkSRPeU26cdjccgJGReBVPM7xqZdJKa+70fOzjNeaPY Q==;
X-CSE-ConnectionGUID: Tio85DIvSue9Rx4K8MxA6g==
X-CSE-MsgGUID: 8JzMFk3lScC1cigXjiZ1gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22821350"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="22821350"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 00:59:06 -0700
X-CSE-ConnectionGUID: UwehrCC6QwaRzIt6QXk9xw==
X-CSE-MsgGUID: 4Ijd9w1ZSLygBwWVi4lhXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="61396292"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.180])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 00:59:04 -0700
Date: Fri, 23 Aug 2024 09:59:00 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
Cc: intel-xe@lists.freedesktop.org, nirmoy.das@intel.com
Subject: Re: [PATCH] drm/xe: Replace double space with single space after comma
Message-ID: <ZshBRChhhLN3D2eS@ashyti-mobl2.lan>
References: <20240823080643.2461992-1-nitin.r.gote@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823080643.2461992-1-nitin.r.gote@intel.com>
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

Hi Nitin,

On Fri, Aug 23, 2024 at 01:36:43PM +0530, Nitin Gote wrote:
> Avoid using double space, ",  " in function or macro parameters
> where it's not required by any alignment purpose. Replace it with
> a single space, ", ".
> 
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
