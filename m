Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8912FC3DA79
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jan 2024 19:52:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B89110E36F;
	Mon, 15 Jan 2024 19:52:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F97710E36F;
 Mon, 15 Jan 2024 19:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705348333; x=1736884333;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vzzuKp0AeBdnE6eBIc2C1gSpHUAPybiG9qgPyg4DcL4=;
 b=Ez9SxZ0rS6DOH13qeOZI96mFdY68fS5ygCEzavmARjF69qvWlnK4GidA
 rWCe12C2+pdbB3mTlvdDi6VDjrmUdnoeQAvgWx70ioNNps7gR1wptiyJw
 KOOI7OMC/rdSSP6s1MK1tid1prEijnCG7N3Np8OmLgYs+b1Y4d3p5grBi
 yAHT1D6QkJMYOPi/mt0+auXORuWg/Ft9zraJ6yesy64bEfi1ei19FNqym
 RalD+Gx87QyXNAf8MQEIugzA3Hdcskfh7MwacrMukzoeszRt/TwT7vkwc
 TKIzTKDT09QcMAPiwB5ViwVx3hwmg20mBRrq1yctcQMEYjRvGIp2C2oUW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="6781710"
X-IronPort-AV: E=Sophos;i="6.04,197,1695711600"; 
   d="scan'208";a="6781710"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2024 11:52:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,197,1695711600"; d="scan'208";a="18218228"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2024 11:52:11 -0800
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.246.34.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 32BFF580BF0;
 Mon, 15 Jan 2024 11:52:09 -0800 (PST)
Date: Mon, 15 Jan 2024 20:52:07 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] xe_live_ktest: Use xe_live_test kernel
 module
Message-ID: <20240115205207.5b491e3e@maurocar-mobl2>
In-Reply-To: <87mst7rri8.fsf@intel.com>
References: <20231205224926.2188996-1-lucas.demarchi@intel.com>
 <20231207164152.57be3d07@maurocar-mobl2>
 <3kunqgqyf7tobiwhcpvjp7rcvidrgnz2jq3qqoxjbl7kaftdq7@7hdweo57htff>
 <njwvai6cu7jwmy7lmg3vkg4jd52uq2f6es4obvdplkz43i6hpe@jqrzk4bveqqc>
 <dzacvbdditbneiu3e3fmstjmttcbne44yspumpkd6sjn56jqpk@vxu7sksbqrp6>
 <20240112093252.0a4bf850@maurocar-mobl2>
 <57epajumgzrllmyufx7233yjja2c3fbs2zgfflkhcspfvwak47@h64l4uzne54h>
 <11e1b3f4-b0ba-4095-96c6-f2bf18f27fd2@linux.intel.com>
 <87mst7rri8.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 15 Jan 2024 09:21:35 +0200
Jani Nikula <jani.nikula@linux.intel.com> wrote:

> On Mon, 15 Jan 2024, Mauro Carvalho Chehab <mauro.chehab@linux.intel.com> wrote:
> > On 1/12/24 15:29, Lucas De Marchi wrote:  
> >>> On such case, you should document kunit_debugfs at Documentation/ABI.  
> >>
> >> debugfs is not part of ABI.  
> >
> > That's arguable. Check Documentation/ABI and you'll see several debugfs 
> > nodes documented there.  
> 
> I guess you could argue documenting your debugfs under Documentation/ABI
> makes it ABI, but I'd avoid doing that. Usually we use debugfs precisely
> to avoid the burden of ABI and all the baggage that brings.

Placing things at debugfs "precisely to avoid the burden of ABI and all
the baggage that brings" sounds a bad practice to me, but you can ask 
others at LKML and see if this is a acceptable.

My understanding is that, if userspace tools rely on what's there at
debugfs, and a change break such tools, there is a high chance that
such change will end being reverted - at best, it will surely provide
some flame wars.

I remember we had some troubles related to trace logic in the past,
due to something similar: even not originally meant to provide a stable
ABI, and being under debugfs, there were some changes breaking userspace 
which caused lots of discussions. Can't remember anymore if the changes
were reverted or not, but at the end ftrace ABI was considered as stable.
I have an userspace program which depends on it (rasdaemon).

Also, having it documented or not doesn't mean it is not ABI. See, for
instance, this article: https://lwn.net/Articles/309298/.

Regards,
Mauro

