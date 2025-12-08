Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0654BD3ABEF
	for <intel-xe@archiver.kernel.org>; Mon,  8 Dec 2025 04:37:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89FE710E0AD;
	Mon,  8 Dec 2025 04:37:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kTnBLSvv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07BA810E0AD
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Dec 2025 04:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765168624; x=1796704624;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EZR1Wmt802Tp4TLM/A4n8NAW3AVbcbT3YSZuSkWBuh4=;
 b=kTnBLSvveUrMhBPX+8tgQjdMLcgVdBGUsblAPoJGjYIQz4i2TXn1tItj
 j+ZWeHV9EmxTn/9uoeJI5RRvdaFvJt1qKIWBd2ofPEfYH4O5Hq6/z6fo8
 DaKT7UiMUMEynkjKlrNMLsQ2wVUxf2RwoOWnU4ZpWgFO8ZvLY2fkjahLy
 VZ2cXnCX19PH6Xejxj1B/CTPaUNmtT9bYrB6iVdG6PHkwDmsPTNQ8u9dE
 xR0nz8vX/tbowPIlfijFUCjUcTl/laC4fJ5Az3IXPa9JKGQXIyCGguCUs
 L/vqkNxEXkrKMswrkOp55vrk4yQK88rchwB5E1mUF6VNG0krc2Y2bJiIo g==;
X-CSE-ConnectionGUID: /E8AKQTCSaqoHkDVDgZsDQ==
X-CSE-MsgGUID: HABKZ8BPQmyPfBJo6RyDcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="54650049"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="54650049"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2025 20:37:03 -0800
X-CSE-ConnectionGUID: TYVkCFZdSDqSlZtdURTEFQ==
X-CSE-MsgGUID: y2FHwZYURFWYXyOQFrSkUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="200279742"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2025 20:37:02 -0800
Date: Mon, 8 Dec 2025 05:37:00 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: "Anirban, Sk" <sk.anirban@intel.com>
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com
Subject: Re: [PATCH v1] drm/xe/throttle: Skip reason prefix while emitting
 array
Message-ID: <aTZV7GBn_kBbMC9w@black.igk.intel.com>
References: <20251203123355.571606-1-raag.jadav@intel.com>
 <764e770a-42af-44c5-82f8-7dcdb2204843@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <764e770a-42af-44c5-82f8-7dcdb2204843@intel.com>
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

On Thu, Dec 04, 2025 at 03:12:39PM +0530, Anirban, Sk wrote:
> On 03-12-2025 06:03 pm, Raag Jadav wrote:
> > The newly introduced "reasons" attribute already signifies possible
> > reasons for throttling and makes the prefix in individual attribute
> > names redundant while emitting them as an array. Skip the prefix.
> > 
> > Fixes: 83ccde67a3f7 ("drm/xe/gt_throttle: Avoid TOCTOU when monitoring reasons")
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>

...

> Reviewed-by: Sk Anirban <sk.anirban@intel.com>

Thank you.

This is fixing the newly introduced ABI and needs to land ASAP.

Raag
