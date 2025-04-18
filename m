Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A293DC369AB
	for <intel-xe@archiver.kernel.org>; Fri, 18 Apr 2025 12:43:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE5E010E1FA;
	Fri, 18 Apr 2025 12:43:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KQ9yBAzv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A3910E1FA
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Apr 2025 12:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744980181; x=1776516181;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LwEyLYrNx1GGHMbmhpDwnV3AOg1NtZ4ge0Ev98zvty0=;
 b=KQ9yBAzvuxFWoTWx7eJiweS7Qi8Qm+wY1+QYIKbhwbe61xuh1pSiDj8D
 P2GYr8hBJ1hwuv5l4NORcJk9pXXbh+4j88HoQR+fnFvAcHaLCvxV1E6bN
 dccCh6Fk5QitIfpsv65kp9TPUJYLLWEj47YOMzFFIarekNNdwToskx3D5
 Qg5ChOXA4VGoEeKuwTlSU+zyNj7nz8pH6E0C25Ap2/8dtGZLVhMFNo3m2
 OWxRuFdeOLP6qTi6woVtsTM1fzrZZYe4f8YtJvl1f25ysG1BpeMjKcBLG
 Xc7cW6MyRfZZsEbTGztekEuk3BzYbbu2dFohP8EVSR7tKH9r/mT21mgh2 w==;
X-CSE-ConnectionGUID: o0u56yJOSPKw6O12wB4oyg==
X-CSE-MsgGUID: ksXGVTwrTgu7EM63oM+yoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="50436825"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="50436825"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 05:42:56 -0700
X-CSE-ConnectionGUID: 4BzUvNKLS9maRagnmWHfaw==
X-CSE-MsgGUID: qLOeNUbrSzCekuV8dYO8AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="132004164"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa009.fm.intel.com with ESMTP; 18 Apr 2025 05:42:54 -0700
Received: from [10.245.84.121] (unknown [10.245.84.121])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 4090A33EB5;
 Fri, 18 Apr 2025 13:42:53 +0100 (IST)
Message-ID: <20a2a74a-4cbc-43c9-a993-ea69a4942216@intel.com>
Date: Fri, 18 Apr 2025 14:42:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/4] drm/xe/vf: Shifting GGTT area post migration
To: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250417234239.3786508-1-tomasz.lis@intel.com>
 <20250417234239.3786508-3-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250417234239.3786508-3-tomasz.lis@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 18.04.2025 01:42, Tomasz Lis wrote:
> We have only one GGTT for all IOV functions, with each VF having assigned
> a range of addresses for its use. After migration, a VF can receive a
> different range of addresses than it had initially.
> 
> This implements shifting GGTT addresses within drm_mm nodes, so that
> VMAs stay valid after migration. This will make the driver use new
> addresses when accessing GGTT from the moment the shifting ends.
> 
> By taking the ggtt->lock for the period of VMA fixups, this change
> also adds constraint on that mutex. Any locks used during the recovery
> cannot ever wait for hardware response - because after migration,
> the hardware will not do anything until fixups are finished.
> 
> v2: Moved some functs to xe_ggtt.c; moved shift computation to just
>   after querying; improved documentation; switched some warns to asserts;
>   skipping fixups when GGTT shift eq 0; iterating through tiles (Michal)
> v3: Updated kerneldocs, removed unused funct, properly allocate
>   balloning nodes if non existent
> v4: Re-used ballooning functions from VF init, used bool in place of
>   standard error codes
> v5: Renamed one function
> v6: Subject tag change, several kerneldocs updated, some functions
>   renamed, some moved, added several asserts, shuffled declarations
>   of variables, revealed more detail in high level functions
> v7: Fixed typos, added `_locked` suffix to some functs, improved
>   readability of asserts, removed unneeded conditional
> v8: Moved one function, removed implementation detail from kerneldoc,
>   added asserts
> v9: Code shuffling without much change, and one param rename
> v10: Minor error path change, added printing the shift via debugfs
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

