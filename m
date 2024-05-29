Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FFBC27C43
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 12:52:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D98B10F3CB;
	Wed, 29 May 2024 12:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XOfipLKJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0041E10F3CB
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 12:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716987131; x=1748523131;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=FkFAjjaEGQrNHo1pl++acdC0FvaVlEgEnUMCyYUzn0A=;
 b=XOfipLKJkuwkCv/Vb8NBmfUYcL3H7lmyKZRnXql4uF+AaHBnMaqDRJ6e
 PEoB5MwiMsh7WUL1rcjiTpFKoAvh+bJaJshlVBCEUQZPb52tAzwx1+Ea+
 3u9gSeb9tBKEre87Bfml0Zwr5GLwoJ0mAdxGR/pdkdn4YzcxejbWWqbTi
 EjAAdROHY7oDNgFfykM7RF4oiVjR6UgDwxOH1vcZ6XUSBgAKR0denofvL
 swtDhT4IiA0g+sVLXiAGlyHyJaFc4dPmcezV1Noh72B3ithcnCht23nCD
 nRckrEPx3VjMef+ggWIIaQrUNgJ8LLWExnpsuDzGVSaN1vatrb4W9kIUq A==;
X-CSE-ConnectionGUID: PaW6ZlNdQYSjPWWPEriAug==
X-CSE-MsgGUID: 3irJkzTBR82MQr8z8Ik0kg==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24040893"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="24040893"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 05:52:10 -0700
X-CSE-ConnectionGUID: Tx2hYdO6S2uFWbXabvReQA==
X-CSE-MsgGUID: zF4yf0a9RwuTXuqoj5unBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="72876470"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.86])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 05:52:08 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Matt Roper <matthew.d.roper@intel.com>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Lucas De
 Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 4/5] drm/xe: Rename internal vram helper function
In-Reply-To: <c368cc90-2d0f-4e6e-9cdb-8ccef42e2d0d@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240527173554.1108-1-michal.wajdeczko@intel.com>
 <20240527173554.1108-5-michal.wajdeczko@intel.com>
 <20240528213515.GI4990@mdroper-desk1.amr.corp.intel.com>
 <ZlZXaouXdtj852Aq@DUT025-TGLU.fm.intel.com>
 <46164a96-f72c-4991-a41d-eea299540d75@intel.com>
 <87bk4okfb4.fsf@intel.com>
 <c368cc90-2d0f-4e6e-9cdb-8ccef42e2d0d@intel.com>
Date: Wed, 29 May 2024 15:52:14 +0300
Message-ID: <875xuwkcg1.fsf@intel.com>
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

On Wed, 29 May 2024, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:

[snip]

> but then it should be treated as an exception, to be approved by the
> maintainer, from general guidelines that maintainers can still document

I'll just note that I only provided some points of view for
consideration, won't argue them further, and I'll just defer to the xe
maintainers to provide the guidelines here. (What a nice feeling to be
able to do so. ;)

BR,
Jani.

-- 
Jani Nikula, Intel
