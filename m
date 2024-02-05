Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BEAC48295
	for <intel-xe@archiver.kernel.org>; Mon,  5 Feb 2024 13:11:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927E910E424;
	Mon,  5 Feb 2024 13:11:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gdASFGUk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B9CF10E424
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Feb 2024 13:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707138681; x=1738674681;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=dRn+TztZVvEgq+GdFKEacu4kffilmp9bv3/Id3vY8Y0=;
 b=gdASFGUkHqanGMYx4zlEzUYg4MHQ07n9RNMNYJhgDC4jnhjVXYWTkC4V
 fIfs1PRodFVXqHR4c2Joa6PO4loiwpKHnCvXCMD7F5LHXuPnzTB5pnPS7
 wQyohC86RDf2A3aJOElzSDgmwql2Cx+LcnzvjtBnvpRtO3Kby4aAyMKiD
 o5jKj2SVgM9z7JIZb3VzycVSroHMhHd6DPM21MHvPq3TV/+0AnVP/XBCJ
 bjBUxk2nzJS+DiB1xBsCB6vWSA217a+elRP6OvIbDHDAOHiPCVpe5axAZ
 /rbERhuL+KDY1rAj4FvPUgEVq49uRXspu2ncgsL5xGSf4qP94BkA4cT7a A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="408216"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="408216"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 05:11:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="933152598"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="933152598"
Received: from vgolodni-mobl.ger.corp.intel.com (HELO [10.252.0.151])
 ([10.252.0.151])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 05:11:19 -0800
Message-ID: <f7c0573b-711c-4b6b-a25a-f3edcbcae434@intel.com>
Date: Mon, 5 Feb 2024 13:11:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 25/34] drm/xe: Convert gsc_work from mem_access to
 xe_pm_runtime
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
 <20240126203044.1104705-26-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240126203044.1104705-26-rodrigo.vivi@intel.com>
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
> Let's directly use xe_pm_runtime_{get,put} instead of the
> mem_access helpers that are going away soon.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
