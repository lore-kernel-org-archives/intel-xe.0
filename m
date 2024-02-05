Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E558C48291
	for <intel-xe@archiver.kernel.org>; Mon,  5 Feb 2024 11:25:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF311124DF;
	Mon,  5 Feb 2024 11:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YIpQQY5q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4B910FEF1
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Feb 2024 11:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707132355; x=1738668355;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=5IfJg/xas5izSCYWl9mHmta2x5KlY/L8udtmUHFW0NA=;
 b=YIpQQY5qBCEqtbptwszN2w7s7ZHRiJDvw98cwW4Lb6C5XwztS2LI8BX3
 Dfe1l9OAB3PLW9nV2Cz8k/SDWFETEEb8wY6ENSIH3D2ASR3hndc8kPjs/
 2K0jmAsA2OED6KF6dQaZreEkTmIuNBE4V84CTU/Qz3Wyby1VAmvD+nLsE
 vc7Lvgk7EvL1VMITPDZUGqCy2IWwemoVTPq9ZxnRG0WSu+i28m2K9wBWk
 Dt1O/e4xG7cccSvH+oQao8FZm1B3JRsdS08pTTgAq/3DkfQ32gbR3M8OM
 QJJHQRQx+w4R9anR6JQwTatdIk4o5jDtJwMMfem3c91MGKtJTbVXEC6rv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="11088927"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="11088927"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 03:25:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="700596"
Received: from vgolodni-mobl.ger.corp.intel.com (HELO [10.252.0.151])
 ([10.252.0.151])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 03:25:55 -0800
Message-ID: <e4fc0060-7a5a-4fd7-9d3f-fb2224b4049e@intel.com>
Date: Mon, 5 Feb 2024 11:25:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 17/34] drm/xe: Convert hwmon from mem_access to
 xe_pm_runtime calls
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
 <20240126203044.1104705-18-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240126203044.1104705-18-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 26/01/2024 20:30, Rodrigo Vivi wrote:
> Continue the work to kill the mem_access in favor of a pure runtime pm.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
