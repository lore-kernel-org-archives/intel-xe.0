Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C045FE7849A
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 07:04:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651D610E193;
	Mon,  2 Oct 2023 07:04:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B4A10E1A3
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Oct 2023 07:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696230275; x=1727766275;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=rvT9iNcJsLpx9vunymWs7WShsiQetQUAn/ABeZv7Etk=;
 b=SzQk8WHx+aLwCm01MrMRBP6Ihr2FyqRbirbA6RfEY91lD29vtVZVN3w/
 LTv3DogdBkOnP1ZBktE6Un17R2rXxQ2SZeNMvo0HtW+B6lCy2yk3c8Qsi
 cb1Yai6QAmPXLyWwvLB+JzA3qCsl7WnSoUNg7nM3X4YPEDyFzvjFRxrEX
 OJb319xF0GI8DxWBD/X2QfOUVArDG8Copcf2mtoiKKePz055/B8JePMIN
 lVg63OIw+ddlUZxNHf9uHX2iI3alfM4vAIgi9RnkVqxI1bqVT3kr8W0kZ
 wXwFvCipgK0gDbf+CsGmiQ37obRTMHIX6eEl0M6JZbanTCS/3jGCs3LJN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="449081921"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; d="scan'208";a="449081921"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 00:04:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="779858744"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; d="scan'208";a="779858744"
Received: from svandens-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.151])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 00:04:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20231002065802.3609656-1-jouni.hogander@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231002065802.3609656-1-jouni.hogander@intel.com>
Date: Mon, 02 Oct 2023 10:04:24 +0300
Message-ID: <87cyxxijyf.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 0/2] Backport including i915_active.h in
 intel_frontbuffer.c
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
Cc: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 02 Oct 2023, Jouni H=C3=B6gander <jouni.hogander@intel.com> wrote:
> Including i915_active.h in intel_frontbuffer.h is now merged into
> upstream. Let's revert similar patch from drm-xe-next and backport
> from upstream.

Acked-by: Jani Nikula <jani.nikula@intel.com>

>
> Cc: Jani Nikula <jani.nikula@intel.com>
>
> Jouni H=C3=B6gander (2):
>   Revert "drm/i915/display: Include i915_active header"
>   drm/i915/display: Include i915_active header in frontbuffer tracking
>     code

--=20
Jani Nikula, Intel
