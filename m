Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3AAC54798
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 17:47:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9AEB1122CA;
	Tue,  5 Mar 2024 17:47:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V2dgVdfw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1DF41122CA
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 17:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709660875; x=1741196875;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=NAzH0B5Bqo7iEzn86cMQ8SjUw3Cok8QS24VHzA779DY=;
 b=V2dgVdfweT89wKo0qdvz0QsK6sYvR+U7JVeghPZ6rxJsOx5AM+nmr5We
 Jq4dd7DtAKaMi0K1gzDaPZr+DKM+U5AGEMfcknJWT0Uf3u6kOGLXBloPt
 iGkrSRAm5M4owAsgedDIv0vZf3NW/yeVePGqj8VHuUaO48HovoFL8bSdq
 LV4J08iKIO/T3mKB9m/IdZ9Heg+vK4qHW3Trx4yxJF3MCBGBpoJ/ka1z8
 zie9UwJ6XN1bgKrqjD1dxTrbENlF7mn8GeYvhhRF6iukCP4vr/U6xMB/p
 g3N86iBIM/3UO2s7bSds52w1ynuZISFzphPReFtMJc8dVjtGnA7zSQWi3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="26690771"
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; d="scan'208";a="26690771"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 09:47:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; d="scan'208";a="40458885"
Received: from pkunieck-mobl.ger.corp.intel.com (HELO [10.249.140.91])
 ([10.249.140.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 09:47:53 -0800
Message-ID: <a30b3464-405b-478c-950f-d41ae4e9c258@intel.com>
Date: Tue, 5 Mar 2024 17:47:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Pipeline evict / restore of pinned BOs during
 suspend / resume
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20240305173503.285223-1-matthew.brost@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240305173503.285223-1-matthew.brost@intel.com>
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

On 05/03/2024 17:35, Matthew Brost wrote:
> Rather than waiting for each evict / restore of pinned BOs to complete
> just wait on migrate exec queue to be idle once during suspend / resume.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
