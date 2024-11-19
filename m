Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E546ED6C299
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 21:01:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38E910E36D;
	Tue, 19 Nov 2024 21:01:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VWc8cQPO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C07110E36D
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Nov 2024 21:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732050115; x=1763586115;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PbSWOMRbV0caE4exgI0EaqCT3H4mLPwi9elnDYHAHOY=;
 b=VWc8cQPOsiNnKmD6wgUXFQTjbWb0Hs3EvWJ4DoLDFmdocpxghyb8SUON
 V7YCS6aej4hCSeXNkPJLQSt2AP8LCJv2j9MAqH5/LYAm4S2fSLuTkfzmI
 vuDSvEK42PD3crO1utcqR0ccz4idjl3JAMeMWVccKVlG1DV3OYdlvw1vi
 LQwX4gLWHPZZRhPA7y5z/FOL+LElqZW/67OJnQb5yQkwAuQQ7+d+zffwn
 oa82JEbR3mQI2EJcukfKAI/8W4oBMDzlLpgaOm3QgXLiYFo9W5xFeBVYw
 4tfdv37/DMLRvtmC/gq8ElYAMeaRHQzkn+IHQ05R8CTbRepiBOmaRShW4 Q==;
X-CSE-ConnectionGUID: DBFibDOsTNSmXce/jXBREw==
X-CSE-MsgGUID: a/1L2X5mTWizVAM4/oDBsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="49616551"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="49616551"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 13:01:55 -0800
X-CSE-ConnectionGUID: WDCUFEi0Qo+cWqzWeXMwRw==
X-CSE-MsgGUID: olLqk4lnRweBk1IVcCZfTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="93759399"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.109.70])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 13:01:54 -0800
Date: Tue, 19 Nov 2024 15:01:48 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>, 
	intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe: Drop useless d3cold allowed message
Message-ID: <o2qvrowghi5shepavwjzb6utpioyj2neqfbr45eny54fqrga3m@trovhcv4hoof>
References: <20241115192155.2050987-1-matthew.brost@intel.com>
 <ZzfCwCZr0byTqGj1@intel.com>
 <ZzfYK1jr6KTGxR0c@lstrano-desk.jf.intel.com>
 <Zzzd7FO-z9Q66Ugi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Zzzd7FO-z9Q66Ugi@intel.com>
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

On Tue, Nov 19, 2024 at 01:50:20PM -0500, Rodrigo Vivi wrote:
>On Fri, Nov 15, 2024 at 03:24:27PM -0800, Matthew Brost wrote:
>> On Fri, Nov 15, 2024 at 04:53:04PM -0500, Rodrigo Vivi wrote:
>> > On Fri, Nov 15, 2024 at 11:21:55AM -0800, Matthew Brost wrote:
>> > > This message just spams dmesg providing little benefit. Remove it.
>> >
>> > I don't believe it is useless, but I also hate the spammers...
>> >
>> > perhaps we could bring the status of it in some debugfs form
>> > as a replacement?
>> >
>>
>> ftrace could an option so if you really care about this enable it there?
>
>hmmm it looks like a good idea... but no strong preference from my side...

as long as we are talking about adding a tracepoint rather than a plain
trace_printk() unconditionally.

with dynamic debug we could use a verbose level that is only enabled per
file when needed. Then we can keep messages like this rather than
misusing the trace buffer.

Lucas De Marchi
