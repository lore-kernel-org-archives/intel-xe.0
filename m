Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84935C27C53
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 07:11:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3475710E199;
	Fri,  7 Jun 2024 07:11:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cS8PliF/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61FD510E199
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 07:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717744259; x=1749280259;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=KfN2Ga6/CXVThPy58lIuH3a1+t92zMwz+gOipyF7hO0=;
 b=cS8PliF/NEkowyUlD6K/deQ1uMBUOMhkULPmbYF3b6qgFHOVhY3xg8f0
 J+qSq03RQcFa5fTHio+KmtdRfZ9xctuNyZY186bIfQjt/vZ6pL/oqMgJY
 JKZiNEUFwxsLVS0zFejFHGMRmRXb0XC0VI9+R7/4ep0fmJbENWO1zIuMM
 Q26InpPZoOxn6cA2EbRNtXGrItlir72Cp2DpSH6cF1ZOLdZLD9cuDk0Z8
 OiZPgZPaON+givh1m5WUoRybHIfthQ+JDtNBhQWsWZG0Z0OOw/NbIEHPX
 snX7RNqNhxajvkwsCInmqHu9fJ1nv/S1aKIbma2Jg4MA1eqE+SF2t6x2m A==;
X-CSE-ConnectionGUID: UjAegiONQ0+oDgAagnC5Ig==
X-CSE-MsgGUID: T6XPQsUPT1qlGGOnGQRwMQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14332640"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="14332640"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 00:10:58 -0700
X-CSE-ConnectionGUID: YS9gEU7fRAubDLFUagCDMQ==
X-CSE-MsgGUID: 47j7ntl0SaOk8GMnXANTuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="38219908"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.72])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 00:10:57 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Subject: Re: [RFC PATCH 1/5] drm/xe: Add LRC ctx timestamp support functions
In-Reply-To: <20240607065219.2264624-2-matthew.brost@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240607065219.2264624-1-matthew.brost@intel.com>
 <20240607065219.2264624-2-matthew.brost@intel.com>
Date: Fri, 07 Jun 2024 10:10:54 +0300
Message-ID: <87bk4dmdmp.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 06 Jun 2024, Matthew Brost <matthew.brost@intel.com> wrote:
> +static inline u32 __xe_lrc_ctx_timestamp_job_offset(struct xe_lrc *lrc)

Please don't use the inline keyword in .c files, no matter how simple
the function. Just let the compiler do its job of inlining as
needed. Using inline also silences warnings about unused static
functions.

BR,
Jani.


-- 
Jani Nikula, Intel
