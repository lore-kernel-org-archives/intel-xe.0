Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D598ACD6E64
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 12:51:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E9F910E7BE;
	Wed, 11 Oct 2023 12:51:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6258510E7BE
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 12:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697028716; x=1728564716;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=tDA8vUokyzIX/Woc2SFLv0phGUgZkr2IQnaYI6HEfOk=;
 b=Y7p/zSEyo0xjVko6W4uA1v22gRObC71CaM5Je6gcwsLgVmBVTK8d31tF
 JCJTO663IA5QP7DmDIUW/F5p5U9/v874ssXd8Gtg+62ot+r4wA7280JaQ
 7Mt4rG1b/YSImp+TIQOTug0U6Ns6g773Do/j0vmgBoPm2rHZtEMdUt+oZ
 M4zywD1k1qAIlGP5ns1JsCfYbYhKMKk3bKCCeHRLXQPJ6WjFaQ4OeHIgy
 b5iq6vrlNjfi8IvFMHpuWVbtX65IuHRoVf/z0QKDWFPC7wa1wnTbPMbLk
 ozAE9isX3ilDcbnE7MlO6AxrJDM6jw/9k2VU1/UaeGEwE3tLqDxGhqJgZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="470915361"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="470915361"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 05:51:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="897614677"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="897614677"
Received: from bjvanakk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.42.111])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 05:50:09 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
In-Reply-To: <69012691aecbdb459d37451827900f7b415ba3d8.camel@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231002065802.3609656-1-jouni.hogander@intel.com>
 <87cyxxijyf.fsf@intel.com>
 <69012691aecbdb459d37451827900f7b415ba3d8.camel@intel.com>
Date: Wed, 11 Oct 2023 15:51:50 +0300
Message-ID: <878r894909.fsf@intel.com>
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 02 Oct 2023, "Hogander, Jouni" <jouni.hogander@intel.com> wrote:
> On Mon, 2023-10-02 at 10:04 +0300, Jani Nikula wrote:
>> On Mon, 02 Oct 2023, Jouni H=C3=B6gander <jouni.hogander@intel.com> wrot=
e:
>> > Including i915_active.h in intel_frontbuffer.h is now merged into
>> > upstream. Let's revert similar patch from drm-xe-next and backport
>> > from upstream.
>>
>> Acked-by: Jani Nikula <jani.nikula@intel.com>
>
> Thank you Jani. These are now merged.

I don't know what happened, but they were nowhere to be found. Maybe
lost in a rebase, with the wrong one left in the tree?

Anyway, pushed again.

BR,
Jani.


>
> BR,
>
> Jouni H=C3=B6gander
>
>>
>> >
>> > Cc: Jani Nikula <jani.nikula@intel.com>
>> >
>> > Jouni H=C3=B6gander (2):
>> >   Revert "drm/i915/display: Include i915_active header"
>> >   drm/i915/display: Include i915_active header in frontbuffer
>> > tracking
>> >     code
>>
>

--=20
Jani Nikula, Intel
