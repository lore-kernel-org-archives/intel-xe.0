Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0C3EDE990
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 08:43:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B039E10E51E;
	Thu, 14 Sep 2023 08:43:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A437510E51E
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 08:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694681032; x=1726217032;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=zKpJ4AP91G+dqxw3q4ytPfBTpgdue0LFP0qFpkSg1aE=;
 b=RRwU3Zt0I8e1zlTmqEcfaxR2/NJ6yWCC3VW3X/51HEfALn4SIl1s9poV
 VnuyrfBVIztoTMICPmddjzs45MubkRqGCDxe9EYJ/3fwWuB3GRwLP6pHk
 u78+ZdGngl6IUttlyXanUgSFF6GBSboLay49rs4GGCA/a8WFgA9H2RemW
 w9x7IOl+bbzneqk0+jpyEPT5jpX9LnoYNiNt7UgzpKDpocM64PJHaJcyF
 hbBt0L1JOti+3QUHuY51AR4SdZRem1algPZGXW/eiJeb+bSmCTFVKNGdx
 zl2NcMX164UpUcV4W2Wyh3J6O2kUf1ZKfdyn4PpMnmmOclWvsQwrYgWu/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="465262210"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; d="scan'208";a="465262210"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 01:43:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="779550197"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; d="scan'208";a="779550197"
Received: from haslam-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.49.56])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 01:43:49 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
In-Reply-To: <ZQG_erefoFhzg6sd@fdugast-desk.home>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230907193515.7-1-francois.dugast@intel.com>
 <ef36eb06-d65b-6ad4-ac4f-f1fb2ba7a544@habana.ai>
 <tl37n5qledvt7yxce5sl4byon6puewxvs3ymfebsndnolwstg3@3fjfvpuzna5b>
 <fede72f2-e542-8308-fcb4-ad37ae058154@habana.ai>
 <20230912002541.GD2706891@mdroper-desk1.amr.corp.intel.com>
 <23515ffe-c397-21a9-94b5-e28f5b26fd64@habana.ai>
 <oglhtekjfa3i2mfbfks4peoc4ap2y4yvflwsf5ri2za2jvrcsy@ttkz4mxz6xwr>
 <ZQG_erefoFhzg6sd@fdugast-desk.home>
Date: Thu, 14 Sep 2023 11:43:47 +0300
Message-ID: <87edj1w3ek.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH] drm/xe/uapi: Remove MMIO ioctl
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 13 Sep 2023, Francois Dugast <francois.dugast@intel.com> wrote:
> On Tue, Sep 12, 2023 at 09:42:41AM -0500, Lucas De Marchi wrote:
>> On Tue, Sep 12, 2023 at 03:43:06AM -0500, Ofir Bitton wrote:
>> > Hey Matt, I totally undesrstand your concern, I might have another
>> > suggestion. We can create another FD in debugfs and move this ioctl
>> > there (I can take ownership on this), This way ABI is not an issue.
>> 
>> an interface in debugfs would be better than keeping the ioctl.

A regular debugfs interface, or an ioctl on a debugfs file? [1]

[1] https://lore.kernel.org/r/87h6nxw3rl.fsf@intel.com

>> We seem to have some consensus now to go ahead and remove this.
>> 
>> 	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> 
>> Please record the Acked-by from UMD when you get them and before
>> merging.  And we will also need to change IGT ahead of merging this.
>
> Sure, do we rely on intel_reg only or do we also keep xe_reg?

xe_reg?! TIL.

A long time ago we used to have 10+ tools in IGT to access registers. It
was horrible and unmaintainable. Please let's focus on having *one* tool
for this:


commit dfda0b6aeccef464cc6f1af60d8ea16c11fb13f7
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Dec 10 14:27:07 2014 +0200

    intel_reg: introduce one intel_reg tool to rule them all
    
            Three Tools for the Elven-kings under the sky,
            Seven for the Dwarf-lords in their halls of stone,
            Nine for Mortal Men doomed to die,
            One for the Dark Lord on his dark throne
            In the Land of Mordor where the Shadows lie.
            One Tool to rule them all, One Tool to find them,
            One Tool to bring them all and in the darkness bind them
            In the Land of Mordor where the Shadows lie.
    
                    J.R.R. Tolkien's epigraph to The Lord of The Tools
                     | sed 's/Ring/Tool/g'
    
    Introduce intel_reg as the one Intel graphics register multitool to
    replace intel_reg_read, intel_reg_write, intel_iosf_sb_read,
    intel_iosf_sb_write, intel_vga_read, intel_vga_write, intel_reg_dumper,
    intel_reg_snapshot, and quick_dump.py.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>


BR,
Jani.


-- 
Jani Nikula, Intel
