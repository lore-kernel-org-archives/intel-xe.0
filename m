Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A766FC54798
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 10:19:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D7C1129E0;
	Tue,  5 Mar 2024 10:19:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e6qP9WkW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366881129E0
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 10:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709633944; x=1741169944;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=f8lOh+RSd9Q61teutqNFpw1sAVI29kLmN+KdTyv62oU=;
 b=e6qP9WkWcUMBb8Um4yTRdOyMvPiEjNZ+cqqPV/WuYtG+3nUJ4KmmOJ9A
 Yi+iajlMvnCFZDqm3OrlpTWwOfp0LOcWzpNs/cvxdVzGe/xBeqhYmv3pe
 Sq4TUWbDOF8MiaAQoG3eQs13B/XPSiV/kkWY50FN5AbxdhqoC7y+IdxL3
 0tMQrlt03nsK5d1zjq/B0VATLsBnoNUKywhQ8DK/ortdDy7Lcybp2cqT9
 rhxsyn+Py5pi5EhGTWPC+702VixKJh42FUtIAbLuThUXyMoqkb8QKFnxG
 6NhXDU1kxOPScHjJqVHGsq6ujgN/l4GRJIeie2sOiJhVSwX3upqjNvU5E w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4101601"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4101601"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 02:19:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="13982665"
Received: from pkunieck-mobl.ger.corp.intel.com (HELO [10.249.140.91])
 ([10.249.140.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 02:19:02 -0800
Message-ID: <4bf6b91b-fbb8-4dbe-b854-52054f7e8674@intel.com>
Date: Tue, 5 Mar 2024 10:18:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] drm/xe: Convert xe_gem_fault to use direct
 xe_pm_runtime calls
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240304182154.42611-1-rodrigo.vivi@intel.com>
 <20240304182154.42611-2-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240304182154.42611-2-rodrigo.vivi@intel.com>
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
> The gem page fault is one of the outer bound protections where
> we want to ensure that the hardware is in D0 before proceeding
> with memory access. Let's convert it towards the xe_pm_runtime
> functions directly so we can then convert the mem_access to be
> inner protection only and then Kill it for good.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

