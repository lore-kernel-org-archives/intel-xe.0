Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474ECCD37B0
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 15:19:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0496310E28A;
	Mon, 18 Sep 2023 15:19:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188FF10E098;
 Mon, 18 Sep 2023 15:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695050365; x=1726586365;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7i1/dNWgmYS0t8WY7RLYhTPBTDW5jJpIE+83oH7l+FY=;
 b=QHxy/gsFB4HwKQiPaCvb41zoq/B/Ccd3GoLBPlzhjKjzbGCU3dgGkzl5
 Zts0fGBacH8tTDU3c08z74I2Pn9Y/eXfS4E2UcGpgDsbXsGF5JBmo4Stk
 mlrHklTMz+sS0dRk5Bd1tfxPZc9EhqE88lNNL29hditMj1sMLLCzuesN8
 vJ/e6XnFVgT3RgyE86yF4zX4goR/DtpvqapmnrspgXDld4FzRJhXkHq1C
 YEUn/PAwKSltHxdfjPNPp9ooOGIgX0AGkc4MynETRP/7EZmvHCttRNK+J
 xIdIntnykV5easas8iOTEBK+LRyoDFh30otWO+LlwATMtO0qQwGtYAmZQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="379587573"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="379587573"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 08:09:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="861095433"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="861095433"
Received: from ldmartin-desk2.corp.intel.com (HELO
 ldmartin-desk2.attlocal.net) ([10.212.23.222])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 08:09:07 -0700
Date: Mon, 18 Sep 2023 10:09:03 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <s4pd63isa3zc5p6roa23gg74puas7m5irxlvolg54f67zcrua6@v7ah2t3b5sqp>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
 <20230915132346.1845909-3-lucas.demarchi@intel.com>
 <20230915174346.GC2706891@mdroper-desk1.amr.corp.intel.com>
 <20230915174712.GD2706891@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230915174712.GD2706891@mdroper-desk1.amr.corp.intel.com>
Subject: Re: [Intel-xe] [PATCH i-g-t 02/14] lib/gpu_cmds: Remove prefix from
 gen7_fill_binding_table()
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
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Sep 15, 2023 at 10:47:12AM -0700, Matt Roper wrote:
>On Fri, Sep 15, 2023 at 10:43:50AM -0700, Matt Roper wrote:
>> On Fri, Sep 15, 2023 at 06:23:34AM -0700, Lucas De Marchi wrote:
>> > This function is used by pretty much all versions. It's odd to have a
>> > gen7 function end up calling next-gen functions and it's error prone:
>> > when adding something to e.g. a gen8 function to realize that behavior
>> > breaks previous platforms.
>>
>> Even more confusing is that we have a gen11_filling_binding_table
>> function as well, but Xe_HP still uses the older "gen7" variant.  Maybe
>> we should incorporate the gen11-specific logic into the single
>> fill_binding_table function as well?  It looks like it only gets used in
>> one path (which winds up being ICL-specific, not even used for EHL/JSL
>> due to lack of media samplers).
>
>Hmm, I guess the signature of the gen11 function doesn't match since it
>takes separate src/dst buffers.

yep, I hit this issue when trying that abstraction. I think we can leave
it to be done on top.

Lucas De Marchi

>
>
>Matt
>
>>
>>
>> Matt
>>
>> >
>> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > ---
>> >  lib/gpu_cmds.c | 9 ++++-----
>> >  1 file changed, 4 insertions(+), 5 deletions(-)
>> >
>> > diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
>> > index bb35204fb..648451f74 100644
>> > --- a/lib/gpu_cmds.c
>> > +++ b/lib/gpu_cmds.c
>> > @@ -259,8 +259,7 @@ gen11_fill_surface_state(struct intel_bb *ibb,
>> >  }
>> >
>> >  static uint32_t
>> > -gen7_fill_binding_table(struct intel_bb *ibb,
>> > -			struct intel_buf *buf)
>> > +fill_binding_table(struct intel_bb *ibb, struct intel_buf *buf)
>> >  {
>> >  	uint32_t binding_table_offset;
>> >  	uint32_t *binding_table;
>> > @@ -321,7 +320,7 @@ gen7_fill_interface_descriptor(struct intel_bb *ibb,
>> >  	uint32_t offset;
>> >  	uint32_t binding_table_offset, kernel_offset;
>> >
>> > -	binding_table_offset = gen7_fill_binding_table(ibb, buf);
>> > +	binding_table_offset = fill_binding_table(ibb, buf);
>> >  	kernel_offset = gen7_fill_kernel(ibb, kernel, size);
>> >
>> >  	intel_bb_ptr_align(ibb, 64);
>> > @@ -357,7 +356,7 @@ gen8_fill_interface_descriptor(struct intel_bb *ibb,
>> >  	uint32_t offset;
>> >  	uint32_t binding_table_offset, kernel_offset;
>> >
>> > -	binding_table_offset = gen7_fill_binding_table(ibb, buf);
>> > +	binding_table_offset = fill_binding_table(ibb, buf);
>> >  	kernel_offset = gen7_fill_kernel(ibb, kernel, size);
>> >
>> >  	intel_bb_ptr_align(ibb, 64);
>> > @@ -803,7 +802,7 @@ xehp_fill_interface_descriptor(struct intel_bb *ibb,
>> >  {
>> >  	uint32_t binding_table_offset, kernel_offset;
>> >
>> > -	binding_table_offset = gen7_fill_binding_table(ibb, dst);
>> > +	binding_table_offset = fill_binding_table(ibb, dst);
>> >  	kernel_offset = gen7_fill_kernel(ibb, kernel, size);
>> >
>> >  	memset(idd, 0, sizeof(*idd));
>> > --
>> > 2.40.1
>> >
>>
>> --
>> Matt Roper
>> Graphics Software Engineer
>> Linux GPU Platform Enablement
>> Intel Corporation
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
