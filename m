Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EB6D42B9E
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 04:12:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AABCF10E342;
	Wed, 13 Nov 2024 04:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OBoozI4n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C2D10E342
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Nov 2024 04:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731471139; x=1763007139;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=e/9EIjY/V6MBGMLXcDtSJnLP0wX6NhquOGnkolrsiDs=;
 b=OBoozI4nKpClhfMrBPb16KNH0iofnQfurMDx9BlB7Ig1YWNOMOlqpsUJ
 9nMp8X+7EO45/4f2U1MBK/UblvMSBngy6d9CGUBezl5FmVGN3VnhWvYYN
 4GcWqL5IGUjuGjYBcOwsvJVY3PSUdxtCvYZlEIsN5bN+F7+tMewlS7vKM
 TlyG867NTOe/1u0cTmvkrwTNqPIp1F5NOKaVPeEMm9ebkFrP7+LBdHkBA
 ZxJRquea0PdQeJhfvIU9Ai8eWl5Da5GOidehgtben+8lHDj9MaMyF+v6q
 k0mA8OWj1JYDq0IbTbmEvKDIL/GrJkwTWmAGqLWtbNWkSi5UXajtQBvf3 w==;
X-CSE-ConnectionGUID: z/kddluuTt2sBstJl5CRLw==
X-CSE-MsgGUID: h+eJm+iQSjOf/KdTis7VTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="42731194"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="42731194"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 20:12:19 -0800
X-CSE-ConnectionGUID: cvyAukCFShyn28CAIglOKw==
X-CSE-MsgGUID: CXHf5U5TSq2yDJD8M7tS4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="87484787"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 20:12:18 -0800
Date: Wed, 13 Nov 2024 06:12:15 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 2/3] drm/xe/pmu: Add GT C6 events
Message-ID: <ZzQnH_xiU6maevXn@black.fi.intel.com>
References: <20241112205142.4026554-1-vinay.belgaumkar@intel.com>
 <20241112205142.4026554-3-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112205142.4026554-3-vinay.belgaumkar@intel.com>
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

On Tue, Nov 12, 2024 at 12:51:41PM -0800, Vinay Belgaumkar wrote:
> Provide a PMU interface for GT C6 residency counters. The implementation
> is ported over from the i915 PMU code. Residency is provided in units of
> ms(like sysfs entry in - /sys/class/drm/card0/device/tile0/gt0/gtidle).
> 
> Sample usage and output-
> 
> $ perf list | grep c6
> 
>   xe_0000_00_02.0/c6-residency-gt0/                 [Kernel PMU event]
>   xe_0000_00_02.0/c6-residency-gt1/                 [Kernel PMU event]

Is it possible to do per gt?

<bdf>/gt<n>/c6-residency

Raag
