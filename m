Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30137E77173
	for <intel-xe@archiver.kernel.org>; Fri,  6 Dec 2024 05:02:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D6010E3CD;
	Fri,  6 Dec 2024 05:02:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kbQczuVe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B494410E3CD
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Dec 2024 05:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733461370; x=1764997370;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZoNFD6sAsvSCRDZ0RvI5uIBXdR0njlpl8o32La0AhV4=;
 b=kbQczuVeYVmDF7ybC1luodG4LcYO2ufmSv1TnTjKJm/rj9SYoS86WvlB
 +5uJfsMPEMGlFY0tQMN+Wuuzc28ieFS71isy4pJpoc3ZtDE1kPFVmlBjD
 r+4m97wuW0vFbVrVfGK3PENCmk/ZboUox/tmZxHF+lBRNFfG/EXTHBrj1
 WNQP/x+lg8iqx5Pe9vRnoPVxkIw/6ACK/waBPvYdFpQLRG8wh16K3IlWW
 /5/UJXJuALphnYmA7fLGBaxAqwNO+OXRv7ImVawreqTRzfnw24WdEn8BM
 YGKW+LN2vFH/RDzl+D4/Ad5/QlTMWAVsFQJax8IOTbszO89xFhk6cik6v A==;
X-CSE-ConnectionGUID: ms6hz5xEQuq9M0hu2lOJ5g==
X-CSE-MsgGUID: 52t5l1HaT0KcaTv/ZHusPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33723190"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; d="scan'208";a="33723190"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 21:02:49 -0800
X-CSE-ConnectionGUID: NH+Z++UOTjSlWeFzeS/wEQ==
X-CSE-MsgGUID: E/ZFJegzQ0GYc13WgBptAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; d="scan'208";a="131720614"
Received: from jdoman-desk1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.108.215])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 21:02:49 -0800
Date: Thu, 5 Dec 2024 23:02:41 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>, 
 Jonathan Cavitt <jonathan.cavitt@intel.com>, ashutosh.dixit@intel.com
Subject: Re: [PATCH 2/5] drm/xe/reg_sr: Write all whitelist slots
Message-ID: <bhdorpx32fe7g4bjr6pajplbwbw4guxn35raks5gadtygyma77@pr5x4fcspqvt>
References: <20241205182240.3463027-1-lucas.demarchi@intel.com>
 <20241205182240.3463027-3-lucas.demarchi@intel.com>
 <dee410d2-f96e-4819-aa5f-7060b1d376c8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <dee410d2-f96e-4819-aa5f-7060b1d376c8@intel.com>
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

On Thu, Dec 05, 2024 at 02:51:00PM -0800, John Harrison wrote:
>On 12/5/2024 10:22, Lucas De Marchi wrote:
>>Currently if there's 1 whitelisted register in the engine, on slot is
>>written with that register and all the others are written to a sane
>>value. For the free slots, there's no reason to change the behavior
>>if there are 0, 1 or slots occupied. If the default value from HW is not
>>trusted, all values should be written to.
>>
>>Also, later on all values are passed to GuC via ADS to be restored on
>The values are not passed to GuC, only the register addresses. GuC 

I know, just a poor choice of wording with "sr value" (which is actually
the register address).

Lucas De Marchi
