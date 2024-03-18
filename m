Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE1DC54E58
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 09:51:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2184510EF02;
	Mon, 18 Mar 2024 09:51:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gu+j8sj6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C6710EF02
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 09:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710755485; x=1742291485;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=JEYsN5ne8VFwK0eLPYgm150XvT5F3jBAXiWQ3MeIuJo=;
 b=gu+j8sj6I7E/amfx2ImxCzLhI8CrdUBJU0ZcZceKnunDJeKwc7r4JfBp
 RxQkipxzuLkQI/RmsJvYE1UtgN45IXthTDMsKIwmyvvHbusyAOJzcXvUo
 /85EcLcdFJxqyFZk7Ldg8nt50dyieBzxhiWe11TbWqH2S+8gJmcQAQYvk
 BsceDPOGMytOJ1bycKEbWTb5NJFk5ON1MtpeF0yv1eQe07OMT9gWMT+pU
 Pmp07ic4Krd2wPV+0qwqvKydm+UewxJKShRGVANmZKK67UqEHDOIJZsnT
 wDlKA8tFZ2XHo1TyZGPsEd3I3Fwr4Zd0n33VhwdM2nLyUTnoMJDlr0ipC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5422725"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5422725"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 02:51:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="13896846"
Received: from unknown (HELO [10.245.245.16]) ([10.245.245.16])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 02:51:25 -0700
Message-ID: <f3b5a56b-08fb-45e5-8e6e-ec2231a08ea0@intel.com>
Date: Mon, 18 Mar 2024 09:51:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Drop bogus vma NULL check
Content-Language: en-GB
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
References: <20240318093547.16326-1-nirmoy.das@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240318093547.16326-1-nirmoy.das@intel.com>
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

On 18/03/2024 09:35, Nirmoy Das wrote:
> The vma pointer can't be NULL here.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
