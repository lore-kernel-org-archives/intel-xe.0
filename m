Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B47C4828D
	for <intel-xe@archiver.kernel.org>; Mon,  5 Feb 2024 11:08:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3181410F7E1;
	Mon,  5 Feb 2024 11:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fepc3CDg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C258210F7E1
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Feb 2024 11:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707131309; x=1738667309;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=rx7nBbeyW9Pkn+Y2jRI2UFsU9Ts+7eCUYz0H2fgNaec=;
 b=fepc3CDgL9Czyqz2YgrnTcJReIHITI0t9mMCpMK3Z9EBOIsDMrRLTSdV
 bFnD+wFxeUm22h7nT156PhWnk9pjqUoC/WK1vEssV3N1wOXLhSAxCGaDP
 rT+E78g/lN/nzzgeCIbLISS/JKhcC9xk9GdyPehcESzUt/CZ+B/vDq2wZ
 iyZMYDXASrGgEcaP9lBL4bsl/uVuMw6LSd27w8mcWP0446idMuZrQGU1c
 PAJ4rvyCmIZM9zP4dGHGEK6g5aKbCAOLU7dWyGIn2Fw9BA7FZfGqTcfNR
 NzEdNbkLA2sji6RC9a980uZ0ogPtfMx2kVe69B2S7QJXQ+RMC64mzQ/o+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="18024948"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="18024948"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 03:08:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="31781525"
Received: from vgolodni-mobl.ger.corp.intel.com (HELO [10.252.0.151])
 ([10.252.0.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 03:08:27 -0800
Message-ID: <a314a382-53f4-4a4b-a814-46514652ff0d@intel.com>
Date: Mon, 5 Feb 2024 11:08:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 13/34] drm/xe: Remove mem_access from guc_pc calls
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
 <20240126203044.1104705-14-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240126203044.1104705-14-rodrigo.vivi@intel.com>
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
> We are now protected by init, sysfs, or removal and don't
> need these mem_access protections around GuC_PC anymore.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

