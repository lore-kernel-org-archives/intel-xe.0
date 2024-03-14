Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E5EC54E60
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 17:08:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4018C10EC23;
	Thu, 14 Mar 2024 17:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lsQlA/14";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C0210FC2A
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 17:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710436079; x=1741972079;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=n6K12LUQK2C4HgOtWA+mbRnXO5MJuMmwM1OyAaYn0bk=;
 b=lsQlA/14VH4iebHrSr5GkGPCh/05crcAJVwsEGGvhghjr1JJ8KkRDK4a
 MsGCHWKcQLSkZJYlOUD/RRx77wm3KldQz3kVIvxv37peR0a3KzW0ytTdK
 AZhjAaE/a9r3B1S08PMEfxTC72ofltAPBnxLdeYaMhD/BXc6dpFqBG/Hy
 eANoL67z3DOTvo6tmmlM8iVj1slSBnt2Wecc9uhAg1/FKVlKafLYj0twG
 XzFU6qj5sXXgW7fNnioJ/lXgb+Y2sRUyBvEXHJ09+rXcTEGF7YvqE0PKy
 djFvP9e3s5JDpkpNtUlp2u6nAe8RAUqnS+wgxP1ObQU8HfOLs7Up8UooI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="8210801"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="8210801"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 10:07:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="17028200"
Received: from unknown (HELO [10.245.244.240]) ([10.245.244.240])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 10:07:55 -0700
Message-ID: <7d5bbc68-6290-410d-b73c-973845186994@intel.com>
Date: Thu, 14 Mar 2024 17:07:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Stop passing user flag to xe_bo_create_user()
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
References: <20240314052619.2628396-1-lucas.demarchi@intel.com>
 <20240314052619.2628396-2-lucas.demarchi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240314052619.2628396-2-lucas.demarchi@intel.com>
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

On 14/03/2024 05:26, Lucas De Marchi wrote:
> It's quite redundant to pass XE_BO_CREATE_USER_BIT to
> xe_bo_create_user() since the only difference of that function is to
> force that flag. Stop passing the flag in the few cases that were
> explicitly doing so.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
