Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD03C54E41
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 10:22:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7083A1129E8;
	Tue,  5 Mar 2024 10:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SKSC2I4l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E5061129E9
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 10:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709634166; x=1741170166;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=D4FkZ9/OG4o7rF52nVz3d/A+ECJjUMkdFdMXQfnJEn4=;
 b=SKSC2I4lKp8ilPRvk7FpTpue2i9sVFqxOwOJVmOtlluwxLqYORyY3VNE
 RptVLBGIi0u9v8xSTKzyIGpD9x+eOo2EVNuELuW1ZxPRXpXW8MA6e7Zr9
 A4g8fe3icfV+LEkG/bsqK+EjU3qEUmZ9pzDh5XXOcci7ARYg3ZsMynfFy
 PkmbMyuSIexEZuGYPQu9SOtWHQaZxPNUqegThanntpdcaNxWVG2bNdaGz
 Ap+9Yw1Wk083bEAAAE5RHJnpvqmMNgPH9QkvhsVjF8/TwLaywIStuPIEu
 u4USod8zcvBb06f2X6ZpRstt754OURohDfwXDQo9bCM9+6SiTieTfMAOa Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="15582230"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="15582230"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 02:22:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="32490136"
Received: from pkunieck-mobl.ger.corp.intel.com (HELO [10.249.140.91])
 ([10.249.140.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 02:22:45 -0800
Message-ID: <d679ee9f-8ef8-44a3-b765-90130a2b0cc7@intel.com>
Date: Tue, 5 Mar 2024 10:22:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] drm/xe: Removing useless mem_access protection from
 runtime pm
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240304182154.42611-1-rodrigo.vivi@intel.com>
 <20240304182154.42611-5-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240304182154.42611-5-rodrigo.vivi@intel.com>
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
> This condition was always impossible. Likely the original
> idea was to only have an extra protection to exit resume if
> refcount was not zero, but ended up with a bad implementation.
> 
> Since it doesn't make sense, let's remove this extra usage of
> mem_access_ongoing, so we can proceed with killing mem_access
> helpers.
> 
> v2: Improve commit message to highlight it is impossible,
>      rather than stating it is not useful anymore (Matt).
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
