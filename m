Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0BEDC77B7A
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 17:33:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7146110E60F;
	Fri,  2 Jun 2023 17:33:19 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEAD310E5F0
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jun 2023 17:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685727197; x=1717263197;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=GyYKqdfBrGHP7pMZF0xPls7vsTaOyc3JEQZgdvnJWI8=;
 b=jnLVo5N1eUWj59IIhgforHTbV1O5noAJNoLauXOn22jE3vqJHAIPpnDK
 T4CDYiKcNrOkU/Kani/wXHrdoiNLKoAHb75LtQKSg0Fsa2ZcJmSbQqfYa
 9lMdpGcW6xJqtjA00TZAKbGi+FtwcDbAQitVQ/ZTnVkgnbgMft1q9yHbV
 22z6gWRoVXHe2Fp9gklMq+RPc4qDrnWW5Xb42gIiO/G1c8ZMjHwOYtz1u
 oBHXiC2Z/hEWrdKauB+KUwukf5PvE38ECivXcBD4cFRkeKnaGOT4+8/7B
 Phi9Cy9KYJs56DJ9b/zGjFDP5nJGGNrpY3qzttJC2hDhxrTfaj5kE5vRD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="358354740"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="358354740"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 10:33:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="882152401"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="882152401"
Received: from jwerner6-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.111])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 10:33:15 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
In-Reply-To: <20230601163523.GI6953@mdroper-desk1.amr.corp.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230531224821.387722-1-matthew.d.roper@intel.com>
 <20230531224821.387722-9-matthew.d.roper@intel.com>
 <87o7lzfscm.fsf@intel.com>
 <20230601163523.GI6953@mdroper-desk1.amr.corp.intel.com>
Date: Fri, 02 Jun 2023 20:33:12 +0300
Message-ID: <87bkhxdb1j.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 8/8] drm/xe/display: Call display probe from
 i915 code
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 01 Jun 2023, Matt Roper <matthew.d.roper@intel.com> wrote:
> On Thu, Jun 01, 2023 at 12:24:09PM +0300, Jani Nikula wrote:
>> On Wed, 31 May 2023, Matt Roper <matthew.d.roper@intel.com> wrote:
>> > FIXME:  These changes should have been a fixup patch against
>> > "drm/xe/display: Implement display support" but that commit has itself
>> > been mis-squashed somewhere and no longer exists.
>> 
>> It's been mis-squashed into "drm/i915/irq: split out hotplug irq
>> handling" which should only be a cherry-pick from upstream.
>
> Since Rodrigo is out at the moment, who's handling the periodic rebase
> of drm-xe-next until he gets back?  We should make sure unsquashing this
> is on their radar for whenever the next rebase happens.

Lucas fixed this one.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
