Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBE4CD342F
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 22:32:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB1B10E8B8;
	Mon,  4 May 2026 22:32:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V8oiz2mk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F76510E8B8;
 Mon,  4 May 2026 22:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777933928; x=1809469928;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=BaeTvZ5W7NMg/KbnQEtUyVcZg7D5uS4UleZkYVub1+c=;
 b=V8oiz2mk8PSwDKb1Uo2C4y5/voJ/rL0t18+/0a/xbWxIYfz+7wyRUIVJ
 o1LC1U8LTeKvWOzJhblY0helQG6ZdTX5wg8RqN21jqHFuLK2ZGaS63UeT
 sRI/nviEhhro0SYLMvkMOXf5vNMaL/N0wyQ97hICUvCKbTYEwY5FR1M4O
 wlu6TUleHQ1+FuL5CWbUKDyG+pePsJBKQvPI3VwCUrpDj2QszJtA1rup1
 uSWC3JOeQDKqz7MRgPN4RaPkxH9QtDS1+ROZZExMek5Lq+oqtFNr6xA1K
 sjCK4E+faGoZ/qhsHHIARaKoBGl4gpnfcFJld2wS+PP0V2Wp/qmBurpc8 Q==;
X-CSE-ConnectionGUID: LpkSTuM2R0+YZ4t9+5LXNA==
X-CSE-MsgGUID: 7xvIVI9RTgaBLfhUpInwgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="66329403"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="66329403"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 15:32:08 -0700
X-CSE-ConnectionGUID: 1B5S1WCaQyWWoSUrg2JSrQ==
X-CSE-MsgGUID: Pg9v3w3dRbiyVTdMMdz/gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="239927041"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 15:32:07 -0700
Date: Tue, 5 May 2026 00:32:04 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH 4/4] drm/i915/display: define and use intel_reg_{offset,
 equal, valid}() helpers
In-Reply-To: <5a94a92b723e39285c29cc400c64b577c2876cff.1775653994.git.jani.nikula@intel.com>
Message-ID: <fece80fd-60c8-684c-4da6-dd334757e340@intel.com>
References: <cover.1775653994.git.jani.nikula@intel.com>
 <5a94a92b723e39285c29cc400c64b577c2876cff.1775653994.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1955333856-1777932879=:12090"
Content-ID: <77c08bae-9826-6321-d2e9-3871b81e7ac9@intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1955333856-1777932879=:12090
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <583b94a5-b9ed-c8e8-4931-3336e91da660@intel.com>

On Wed, 8 Apr 2026, Jani Nikula wrote:
> Add display specific helpers for getting the register offset, checking
> for equality and validity. Add them as static inlines for increased type
> safety.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³
--8323329-1955333856-1777932879=:12090--
