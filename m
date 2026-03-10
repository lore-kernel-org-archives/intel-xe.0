Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EE4FCC9DB
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 08:50:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0483910E68E;
	Tue, 10 Mar 2026 08:50:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bOOShh+w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E0010E227;
 Tue, 10 Mar 2026 08:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773132607; x=1804668607;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=i4AK2j01qusAn4Vz1Vrbv2ZHyPB2kTaWPBuUEGL8FXo=;
 b=bOOShh+wDoMikt9OD+YeksWnWnWeEI8UZ4XjNVDMl3Ep3wbpX329rmWJ
 BUVRBRXAbUhJbsZM1oc7/Re+odwFDRXkxW/MgUpyiyEeJTZ14fiCsK2T8
 DAZwtIXq1HR21Ot93qqdduh2tDCFjiwcAyw2jN8nB8IEMURnvBKSVtaAf
 KZ6xKUBkSlDjkp47QEXSr7ESUMEcbezQk5An58w6GjnwphYrz1TRhnrVt
 1IavhB3amMWny54aOefu+a01hrJV4RZV4Kf1wmxKAuJ2y2Mz8p9vjUrsq
 r/+4sUkbw34s2KGFwCoYcImpUSErSEH8TRQLa1BPwKeBQB+MBLwOjuhl4 A==;
X-CSE-ConnectionGUID: q8DT6k2SSdawNKSgkuLN8A==
X-CSE-MsgGUID: pPlNfBlcROGtBW/iPZRSQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74048800"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="74048800"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 01:50:07 -0700
X-CSE-ConnectionGUID: CMdvgxxXR5y4N2tnJJN5Aw==
X-CSE-MsgGUID: T2MZEnyuTsuuW+QZLMmJhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="257954952"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 01:50:04 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] iopoll: fix function parameter names in
 read_poll_timeout_atomic()
In-Reply-To: <f57f964c-d4c2-41d7-86ce-6db11b0601e4@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260306221033.2357305-1-rdunlap@infradead.org>
 <d1ea41327832c2e4447429d6fc0030b71491ca44@intel.com>
 <f57f964c-d4c2-41d7-86ce-6db11b0601e4@infradead.org>
Date: Tue, 10 Mar 2026 10:50:01 +0200
Message-ID: <8b4fb7cdc116b3d4ed78295f70e263daaf86b7e6@intel.com>
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

On Mon, 09 Mar 2026, Randy Dunlap <rdunlap@infradead.org> wrote:
> On 3/9/26 3:35 AM, Jani Nikula wrote:
>> On Fri, 06 Mar 2026, Randy Dunlap <rdunlap@infradead.org> wrote:
>>> Correct the function parameter names to avoid kernel-doc warnings
>>> and to emphasize this function is atomic (non-sleeping).
>>>
>>> Warning: include/linux/iopoll.h:169 function parameter 'sleep_us' not
>>>  described in 'read_poll_timeout_atomic'
>>> Warning: ../include/linux/iopoll.h:169 function parameter
>>>  'sleep_before_read' not described in 'read_poll_timeout_atomic'
>>>
>>> Fixes: 9df8043a546d ("iopoll: Generalize read_poll_timeout() into poll_timeout_us()")
>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> 
>> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>> 
>> Please let me know how you want this merged. I don't think iopoll.h has
>> an active maintainer.
>
> Right, that's why I Cc-ed you :)
> And since Fixes: points to you and others.
> Please take it, Jani.

Thanks for the fix, pushed to drm-intel-next.

BR,
Jani.

-- 
Jani Nikula, Intel
