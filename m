Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2936CA0ECF
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 11:49:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9749E10E406;
	Tue, 12 Sep 2023 11:49:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D82610E403
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 11:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694519383; x=1726055383;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=7sAjuOfeaJSorQ8+b5QdAihjK2GDftLesq3/DqRI0Pc=;
 b=MpCBb8HsErI3/jc1zE0nT2oJgzhsfXA5Zdx4HLiWz7vx6n+yMA+rAdD1
 KZP4zN0v0rEAy1CQ42NEXozL/s1UcbT4dWcKdPi5XXTWbGZIPpaOIJ3Jw
 z7+p971rOEL3wrGwN+FaBLtjP60+yxwujt7yHc2p+dEREZzgmlrkkusS+
 JdcHcPVHttmF6Sma1/AivsZ+RjIrvtjdEUgrxdUZsxa054xkS9Tz9ba+Y
 qu8c8UlVdvTeKkdW0w5XMB8xx1koWQKzQ8WA032n75rmXxeD4nHrw1lT1
 6aJJzJ1pKbQxfwfva6rmjC2MEzZOXJS32Lhb45nMJzvrGES7a7/YqwGS/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="444784978"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="444784978"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:49:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="693468354"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="693468354"
Received: from kscholl-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.206])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:49:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20230912114641.2990078-1-jouni.hogander@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230912114641.2990078-1-jouni.hogander@intel.com>
Date: Tue, 12 Sep 2023 14:49:38 +0300
Message-ID: <87a5try5kd.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 0/2] Remove extra headers added into
 intel_display_power.h
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
Cc: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 12 Sep 2023, Jouni H=C3=B6gander <jouni.hogander@intel.com> wrote:
> These patches are making temporary patch unnecessary:
>
> FIXME: drm/i915: add a lot of includes in intel_display_power.h
>
> and reverting it.

If it builds, it's perfect.

Acked-by: Jani Nikula <jani.nikula@intel.com>


>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
> Jouni H=C3=B6gander (2):
>   fixup! drm/xe/display: Implement display support
>   Revert "FIXME: drm/i915: add a lot of includes in
>     intel_display_power.h"
>
>  drivers/gpu/drm/i915/display/intel_display_power.h | 5 -----
>  drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  | 1 +
>  2 files changed, 1 insertion(+), 5 deletions(-)

--=20
Jani Nikula, Intel
