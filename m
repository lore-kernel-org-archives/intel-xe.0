Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB07C88E7F
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 17:35:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 062F010E420;
	Wed, 16 Sep 2026 17:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VLPWGfJf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37CE010E3C7;
 Wed, 16 Sep 2026 17:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789580148; x=1821116148;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=E47EkrcH7Azngy5GFRqx1MXB2mMVvqTqMsvb9GGJGUM=;
 b=VLPWGfJflujA/rSbOwJgRNWzgOXEFsMkRmadFuUuCipJX8BqoGNM318f
 lfzYFcRh2H6s2GLtxkExeJvTSHGyL3lHFPjAHQpDkx3nzLTWh2HjrzGGl
 su3dYGKp2F5J9VXJTycCPxt8ZE2hwn4tU3syHH1aYP/4UtJMgYTh9/DkF
 laLbJlXfo6mdwY4gIg91BAFy3iaWleHtjoygrPbwraZm9Y0KRukQ2uQSc
 SDZpUVO72eETZX+rx7nd4pyzCyBgHZq+xeCjw8sNh36da/URDPwshCg5R
 cmM7pgNTDLxNzAYZW007DSbpkTCL3JYHfsapppIlLyEV7Y96BcLUVHWZi Q==;
X-CSE-ConnectionGUID: 9dg40jvDRm64QM58mS/Xhw==
X-CSE-MsgGUID: 1mZvKuboR+iJ/JNX8OqMFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="472390"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="472390"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 10:35:48 -0700
X-CSE-ConnectionGUID: KA/zoUt8S2aIOvFvZqGrDg==
X-CSE-MsgGUID: pQduuNXBQKqHGWbhTKZ+iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="273376266"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.224])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 10:35:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: imre.deak@intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/dp: use EXPORT_SYMBOL_IF_KUNIT() for kunit
 helpers
In-Reply-To: <aqpg7Ci9a12a14dr@ideak-desk.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260915160620.779372-1-jani.nikula@intel.com>
 <aqmS6M-FARktEMow@ideak-desk.lan> <aqogWoTeD5hCQgXq@ideak-desk.lan>
 <96b06c0f2b846afde41582b5f291a2fd51680c44@intel.com>
 <aqpg7Ci9a12a14dr@ideak-desk.lan>
Date: Wed, 16 Sep 2026 20:35:43 +0300
Message-ID: <dd8d82c5ad95126fce1e42a2d9d7abb86a29fe57@intel.com>
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

On Wed, 16 Sep 2026, Imre Deak <imre.deak@intel.com> wrote:
> On Wed, Sep 16, 2026 at 10:27:52AM +0300, Jani Nikula wrote:
>> On Wed, 16 Sep 2026, Imre Deak <imre.deak@intel.com> wrote:
>> > On Tue, Sep 15, 2026 at 09:48:14PM +0300, Imre Deak wrote:
>> >> On Tue, Sep 15, 2026 at 07:06:20PM +0300, Jani Nikula wrote:
>> >> > Use EXPORT_SYMBOL_IF_KUNIT() instead of the regular EXPORT_SYMBOL() to
>> >> > export the symbols to the kunit namespace. Otherwise, the symbols get
>> >> > exported for all the kernel to see, and the corresponding
>> >> > MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING") in the tests is
>> >> > meaningless.
>> >> 
>> >> Yes, these symblols are only used by kunit, so no need to export them
>> >> otherwise. Should've thought about it while typing the above
>> >> MODULE_IMPORT_NS():
>> >> 
>> >> Reviewed-by: Imre Deak <imre.deak@intel.com>
>> >
>> > Actually, the symbols are defined and exported only if KUNIT is enabled
>> > without this patch already, as both of these are in an
>> > IS_ENABLED(CONFIG_KUNIT) block.
>> 
>> That only gates whether they're exported or not. The change is about
>> exporting them to the kunit namespace when they're exported.
>
> Right, so in a kunit build the visibility of symbols was still too
> broad. The R-b still applies.

Thanks, pushed!

BR,
Jani.

-- 
Jani Nikula, Intel
