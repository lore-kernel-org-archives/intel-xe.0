Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D79C48295
	for <intel-xe@archiver.kernel.org>; Mon,  5 Feb 2024 13:34:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A1DC10F996;
	Mon,  5 Feb 2024 13:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n0Vf3GGN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A64010F996
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Feb 2024 13:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707140072; x=1738676072;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Zwidf2UnXWa93b5e/qSjq7bRBMyZ6s4e+vrIKrTydVM=;
 b=n0Vf3GGNBeg0pYLerc/d87WdGlpWTiWo2OdMCPcBoyUpiknTyUX3dCpv
 EG0JsBYv/T2UxtoAp4JODUkIiiNBtuJeHVzowzQzJ3dunhOR5umCDee3E
 bgDpLHozjyRorLtBA8IdjDKqPSx2CMaup0RRL4GchUCZN/oMjLhmpHKNG
 gHDeEAQOmxCp6alcsJeVyVBNAGNHlj21Aqrdea8rbhEXP220TL0jbKFtY
 EyU1UW7b9Ga5C0JbYmZieiMASVKPn0Y48ccT3Kax2177JplD7Cr9F2EM+
 2bincS0bvWx3y0W3AEGOJH5Wq8GIwn/OQyyKetWZowxiqQWGmcd6wH/Kp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="11258829"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="11258829"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 05:34:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="1011101"
Received: from vgolodni-mobl.ger.corp.intel.com (HELO [10.252.0.151])
 ([10.252.0.151])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 05:34:31 -0800
Message-ID: <c867c559-aa54-4f44-8355-1f2ca75e2349@intel.com>
Date: Mon, 5 Feb 2024 13:34:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 30/34] drm/xe: Remove useless mem_access on PAT dumps
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
 <20240126203044.1104705-31-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240126203044.1104705-31-rodrigo.vivi@intel.com>
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
> PAT dumps are already protected by the xe_pm_runtime_{get,put}
> around the debugfs call. So, these can be removed.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
