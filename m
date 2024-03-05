Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE063C54E41
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 10:24:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65FB41129E6;
	Tue,  5 Mar 2024 10:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XIgS2265";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 445D01129E6
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 10:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709634276; x=1741170276;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=popnOlN9q7WYugsgGads3F0dlITgJYfaEox0LKS/oq8=;
 b=XIgS2265KutfK3PoUOonttpTJMSl4OUIXbIyExc/9TKOsPira0frXS0V
 QH6VlmX8gpQdnNyfd6Di5zuiTfuXEqRd/bfZt7QeZ2a+fif5JgbcNkr7U
 fxCgm6O/TbfEhgfoMfRo7BCvL/32lSVXOz0zqy3DZiCT1wnAZfF4ibqLh
 zC+5iWTvLN9hxV+8F4j0L5i+/fA5OUnuAf1dwfCOMALM1eT3+CedB5Sh1
 NLXnV+ro/SugjEs35GXVFmQ2Xqez8IZmO7MWiqGpeig8wbRdjdoktCo7Y
 7iqoHPxY1nBw/o/eOj9toUDv5SUDM85Zwz+pRIUxJKxu2dLObXQvY1N98 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="15582411"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="15582411"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 02:24:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="32490357"
Received: from pkunieck-mobl.ger.corp.intel.com (HELO [10.249.140.91])
 ([10.249.140.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 02:24:35 -0800
Message-ID: <76463eae-4655-4d3e-9cc5-b5a5094b3cb2@intel.com>
Date: Tue, 5 Mar 2024 10:24:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] drm/xe: Convert mem_access_if_ongoing to direct
 xe_pm_runtime_get_if_active
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240304182154.42611-1-rodrigo.vivi@intel.com>
 <20240304182154.42611-7-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240304182154.42611-7-rodrigo.vivi@intel.com>
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

On 04/03/2024 18:21, Rodrigo Vivi wrote:
> Now that assert_mem_access is relying directly on the pm_runtime state
> instead of the counters, there's no reason why we cannot use
> the pm_runtime functions directly.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
