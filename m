Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2699C021A4
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 17:12:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C8710E945;
	Wed, 12 Feb 2025 17:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RLm5jb7W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3552F10E944;
 Wed, 12 Feb 2025 17:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739380367; x=1770916367;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=SDmCsRHYKXwrLOX/IDQTwg6DdKXv4jUHN57zXfrfmSw=;
 b=RLm5jb7Wpg5HgAG//J9fp05ATtbO3sadD/NnKUEwq0rwk/0iaWnNELf2
 lV+N8MfquEgKqiiFZ92pUkOe4SZAcgWU4fV82Sdtd7BkQ2LqQ1XP2syE5
 8tCfttSXmEOA+v65S/+PD2HQzSuR0xYqyHuLJkQzCh5R3HeGrOCtdlDmA
 Np4hPdsux39kpS9PBl1TccuC/vI1Vgg4Ru5sPq8TxWiy6O4rFRkSNn5Wv
 J40VUBey9aNHNNmOl4kcOcwE33+9rGj9ZAsz2NEd3b4BSsouBRTdzbBLb
 W+Q9ONujHiMP6B4922Tx/a1KQOhhCqIL2lt+cKTfX/JXf6Ap5/sVii1bx Q==;
X-CSE-ConnectionGUID: OtA6YGv/Tt+b8Xlsv+GyFw==
X-CSE-MsgGUID: LmR8Mt3mQ+O9dAKZWqvaiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="62518787"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="62518787"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 09:12:46 -0800
X-CSE-ConnectionGUID: GTnaMyA4SWWv9VM4AopTPw==
X-CSE-MsgGUID: DtxUdf32Q2KVpluoEmm+lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="117823946"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.167])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 09:12:45 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97?= Xe.CI.BAT: failure for Improve
 type-safety on POWER_DOMAIN_*() macros
In-Reply-To: <173937954545.145254.15387044598135714895@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250212132658.323640-1-gustavo.sousa@intel.com>
 <173937676007.1347988.12791820742293922574@b555e5b46a47>
 <173937954545.145254.15387044598135714895@intel.com>
Date: Wed, 12 Feb 2025 19:12:41 +0200
Message-ID: <877c5vytme.fsf@intel.com>
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

On Wed, 12 Feb 2025, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
> Quoting Patchwork (2025-02-12 13:12:40-03:00)
>>== Series Details ==
>>
>>Series: Improve type-safety on POWER_DOMAIN_*() macros
>>URL   : https://patchwork.freedesktop.org/series/144727/
>>State : failure
>>
>>== Summary ==
>>
>>CI Bug Log - changes from xe-2647-a05c910166dda7fc8b510e5c9771c3bed3fbb906_BAT -> xe-pw-144727v1_BAT
>>====================================================
>>
>>Summary
>>-------
>>
>>  **FAILURE**
>>
>>  Serious unknown changes coming with xe-pw-144727v1_BAT absolutely need to be
>>  verified manually.
>>  
>>  If you think the reported changes have nothing to do with the changes
>>  introduced in xe-pw-144727v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>>  to document this new failure mode, which will reduce false positives in CI.
>>
>>  
>>
>>Participating hosts (9 -> 8)
>>------------------------------
>>
>>  Missing    (1): bat-adlp-vm 
>>
>>Possible new issues
>>-------------------
>>
>>  Here are the unknown changes that may have been introduced in xe-pw-144727v1_BAT:
>>
>>### IGT changes ###
>>
>>#### Possible regressions ####
>>
>>  * igt@fbdev@info:
>>    - bat-bmg-1:          [PASS][1] -> [TIMEOUT][2]
>>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2647-a05c910166dda7fc8b510e5c9771c3bed3fbb906/bat-bmg-1/igt@fbdev@info.html
>>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v1/bat-bmg-1/igt@fbdev@info.html
>
>
> Hi CI Team,
>
> The changes in this series are non-functional. This failure should not
> be related to this series.
>
> Could you re-report, please?

There's a non-functional change, and the report might be spot on!

BR,
Jani.


>
> --
> Gustavo Sousa

-- 
Jani Nikula, Intel
