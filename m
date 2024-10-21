Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643FDD0E6D8
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 09:50:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D7FF10E46A;
	Mon, 21 Oct 2024 09:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OxHAZIOQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF67C10E09D;
 Mon, 21 Oct 2024 09:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729504218; x=1761040218;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YN0QdmCapaTakcYPkC96gvXWtlpFC3PCduEZcLPQ9Fs=;
 b=OxHAZIOQOsBiO6iXBVzvmIDfcFhLA5K6A6C79pjRdl0QXaqeEyrJDw5j
 /BkNVFOSElgFFsc7d7Swkr0Mf8Q9UAf/oHYjz2n+eA/LJRvy4NoqwM3oi
 rknSSNrxxbA5ILYo8Xuo7XPyDy9DmzzvYAzQ76jQviYTpiCl9OHvuGdIt
 GIPgrUList/irfYsWhZKCnzyzJJgl5k4gxQmhfAQYGlDxduvH4UdCTjs6
 CK9nNxRJmwxyYCa174bFkaYO6OqiZPi+71zWnwOCe4z0bKGkqqBdhzFeG
 1XV/OBcouRUkTCCa/NJ14KCvs4CgJSQDSt3YX+ljJ5DsFaASMT7Lwcl9A w==;
X-CSE-ConnectionGUID: 4B8rmlkUSg+xANUyDA514Q==
X-CSE-MsgGUID: czaTjCZNQvuu0k5jCJ4X5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="54388774"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="54388774"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 02:50:17 -0700
X-CSE-ConnectionGUID: pPyu/J7jS1C3ulUqSoGYxw==
X-CSE-MsgGUID: 5pD2kpheQTubFd6jbxu7Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="83467896"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO [10.245.245.206])
 ([10.245.245.206])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 02:50:16 -0700
Message-ID: <74cbcdff-af60-4a3c-a76a-80edfed9b81b@intel.com>
Date: Mon, 21 Oct 2024 10:50:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] drm/xe: Set XE_BO_FLAG_PINNED in migrate selftest
 BOs
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
References: <20241019192030.1505020-1-matthew.brost@intel.com>
 <20241019192030.1505020-6-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241019192030.1505020-6-matthew.brost@intel.com>
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

On 19/10/2024 20:20, Matthew Brost wrote:
> We only allow continguous BOs to be vmapped, set XE_BO_FLAG_PINNED on
> BOs in migrate selftest as this forces continguous BOs and selftest uses
> vmaps.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

