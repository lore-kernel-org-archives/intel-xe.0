Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13982EB64DD
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jul 2023 08:15:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF55A10E31F;
	Tue, 11 Jul 2023 08:15:32 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E1710E31F
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jul 2023 08:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689063330; x=1720599330;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=3xRuh9ADw93mEYw9ooao7uFbW4MYf0dT12TjNCrRmek=;
 b=LyTtE28JNmqcvSM0OX1Diqirh6NffdsPJN0LD0sTPWLxa6oclAs9PXG8
 WhSbZ/vu6JFk3pqFR21JYWn/jRKdJ3WTZy0/FmB9MpRhmTWf/nD6b16hW
 XjGcqgARz5kp6tCyJqE9GX5MhXptOgltxlWrB8DnPqFq9drveLN6zZCVu
 joU6YSQfeeThJF5YR+emt7xaZ2W0Ze3UjLc9KBFmPlB9RyVfmB1s4DEAc
 j5UYm25wXgT5yrpEzDU46G6shJavF3NU9rbOksm9frYmAux8Fa1eBkcg/
 P9jSkOADXiMtEwrtLFV4/qaErjCNw0F0s7OprjN61Enq/MwuH4c58s8dt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="363424722"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="363424722"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 01:15:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="895096390"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="895096390"
Received: from sneaga-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.52.179])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 01:15:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
In-Reply-To: <ZKw0I6s8yM48JGYI@ashyti-mobl2.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230630115019.123675-1-jani.nikula@intel.com>
 <20230630115019.123675-2-jani.nikula@intel.com>
 <ZKw0I6s8yM48JGYI@ashyti-mobl2.lan>
Date: Tue, 11 Jul 2023 11:15:22 +0300
Message-ID: <87bkgij23p.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [RESEND 1/5] drm/i915/uncore: add
 intel_uncore_regs() helper
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 10 Jul 2023, Andi Shyti <andi.shyti@linux.intel.com> wrote:
> Hi Jani,
>
> On Fri, Jun 30, 2023 at 02:50:15PM +0300, Jani Nikula wrote:
>> Add a helper for accessing uncore->regs instead of doing it
>> directly. This will help display code reuse with the xe driver.
>
> I asked you in a previous mail if you had tried
> intel_uncore_{read,write}_fw() helpers instead of the simple
> intel_uncore_{read,write}.

Yes, sorry. I decided this was a more generally useful approach,
abstracting the uncore->regs access everywhere.

This does not block a further cleanup.

BR,
Jani.


>
> Thanks,
> Andi

-- 
Jani Nikula, Intel Open Source Graphics Center
