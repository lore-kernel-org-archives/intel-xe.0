Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA1BC74A44
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 10:33:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADDE10E766;
	Tue, 14 Mar 2023 10:33:06 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796A710E766
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 10:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678789984; x=1710325984;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=g6Wlb+SxRMCzh+Pk8hGvfw9Auul7Od/HfPVWdCl3zHU=;
 b=GNVO8zIa4h+V8xNykExNHGKCZJRhfgAPxOdr49AX27Nvl3THcybwKt5x
 w851LEVmD5VzgiJnOmltffYTwzZMsLL/M4EfxrJpn0NFMOpZggA4Oicc7
 6UWjKOEwtFb5ARvWw0fZtEfaO5bpATGh8vwlUBacqG5b01IOGQvXqjZ+u
 rRhaifAi1A1RZ9qNUc9XIFKaazYKp3FeHbdGaqJlEIQYA3c0/JCs7/UTM
 URZxt9ZY3VHIYRvTc6xnD41prbluyVV+vg7/sb63E6Mi+hVY82BDqP5Df
 evqkpexIf2iUBCFqZHyhrnG0FXYmVtguQY4xB3f0C8WNaJPtVcMluj/Gc w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="399975002"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="399975002"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 03:33:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="924863584"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="924863584"
Received: from vperevez-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.61.84])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 03:33:02 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
In-Reply-To: <20230314002437.baxfkjubclrc272a@ldmartin-desk2.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230309122133.486044-1-jani.nikula@intel.com>
 <20230309173734.GA3408186@mdroper-desk1.amr.corp.intel.com>
 <20230314002437.baxfkjubclrc272a@ldmartin-desk2.lan>
Date: Tue, 14 Mar 2023 12:32:59 +0200
Message-ID: <87a60f7hd0.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH] drm/xe/irq: the irq handler local variable
 need not be static
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 13 Mar 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Thu, Mar 09, 2023 at 09:37:34AM -0800, Matt Roper wrote:
>>On Thu, Mar 09, 2023 at 02:21:33PM +0200, Jani Nikula wrote:
>>> It's just a local variable.
>>>
>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>
>>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>
>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
> but the commit message should probably say 's/need/should/'. Setting it
> as static pretty much breaks setups with 2 devices like TGL + DG2.

Mmmh, only if the probe races between xe_irq_install() calls for the two
devices. Can the same driver probe two devices in parallel?

BR,
Jani.


>
> Lucas De Marchi
>
>>
>>> ---
>>>  drivers/gpu/drm/xe/xe_irq.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>>> index ae2f65c00fa6..529b42d9c9af 100644
>>> --- a/drivers/gpu/drm/xe/xe_irq.c
>>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>>> @@ -529,7 +529,7 @@ static void irq_uninstall(struct drm_device *drm, void *arg)
>>>  int xe_irq_install(struct xe_device *xe)
>>>  {
>>>  	int irq = to_pci_dev(xe->drm.dev)->irq;
>>> -	static irq_handler_t irq_handler;
>>> +	irq_handler_t irq_handler;
>>>  	int err;
>>>
>>>  	irq_handler = xe_irq_handler(xe);
>>> --
>>> 2.39.1
>>>
>>
>>-- 
>>Matt Roper
>>Graphics Software Engineer
>>Linux GPU Platform Enablement
>>Intel Corporation

-- 
Jani Nikula, Intel Open Source Graphics Center
