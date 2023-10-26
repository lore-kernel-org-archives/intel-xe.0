Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1082CC25B48
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 14:52:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D057810E80E;
	Thu, 26 Oct 2023 14:52:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1521410E80C
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 14:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698331925; x=1729867925;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=3MMgrvNkbB6b/dp9eOsZ3vvZxS+rd6U/MqPK5FbJfyc=;
 b=PO1gviPTJXmVDJNMs5UyA373YpCQQN5fYGBaZYpl+dO4PC/39s2mDL40
 rA4cI84znLWQHXBihvvCoy5kmG2OWWPyjl3pw+xBMh81lsKkHMCd83Wpz
 GEO8qiKH2WvVmt48E2ps6dL0VXgCQwFobLfEvhaVzh/BxAMWUaAQl819A
 kJeUHo1AiviMOpQNT86snwskcBGF7yVf9on5f9Bk4QvnuRzEapgrl2fyo
 iOzNUlgGp43Mt04qhwA6KKnLq4LVxiaOPFeAm3t2AMFXSLJ/LSo2CZIqg
 JDeYD9ZLEW/lTXqewzXvmm7eBp5+y+OU2CAEof4nBou/XTEFndSNIIAeq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="473806886"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; d="scan'208";a="473806886"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 07:52:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="759242235"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; d="scan'208";a="759242235"
Received: from tzirr-desk2.ger.corp.intel.com (HELO localhost) ([10.252.49.68])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 07:52:02 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
In-Reply-To: <33cff30cdf4415f794df18463c7a62545dd5c5a6.camel@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231025172836.770398-1-jani.nikula@intel.com>
 <33cff30cdf4415f794df18463c7a62545dd5c5a6.camel@intel.com>
Date: Thu, 26 Oct 2023 17:52:00 +0300
Message-ID: <87h6md77xr.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] Replace "drm/i915: Abstract display info away during
 probe" with upstream version
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 26 Oct 2023, "Hogander, Jouni" <jouni.hogander@intel.com> wrote:
> On Wed, 2023-10-25 at 20:28 +0300, Jani Nikula wrote:
>> This is a bit silly, but gets the job of annotating the commit done.
>>
>>
>
> Acked-by: Jouni H=C3=B6gander <jouni.hogander@intel.com>

Thanks, pushed.

Rodrigo, please be aware that drm-xe-next now has:

drm/i915: Abstract display info away during probe
Revert "drm/i915: Abstract display info away during probe"
drm/i915: Abstract display info away during probe

And when rebasing, we should retain the one with cherry-pick annotation.

Thanks,
Jani.


--=20
Jani Nikula, Intel
