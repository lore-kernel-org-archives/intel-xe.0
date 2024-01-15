Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4A4C3DA79
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jan 2024 07:21:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB0E10E206;
	Mon, 15 Jan 2024 07:21:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A27D10E1FF;
 Mon, 15 Jan 2024 07:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705303302; x=1736839302;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=yVqJ3Rg9lUIyC6w3Twzi1bAsXCEBs+7oXHKshgvivXU=;
 b=dxVT7A+1VnKb74cC0TzoegkaqnSlHaqSEehthkH70toZWbjrL1knVLQU
 vvfFSVUVQLMzHvK2u6gGpIYkQzisXeIKukoKzpWfuNKWgHJT1tEtel0wd
 o8rmAxR+FEUqLYfHkPSL4GC1ffv/dqIa12iId7L1IQsRd/uMZoq8Rh/OQ
 +F+Wx9AhfSdv4FrS12Dc8p3z9o44cSqTeCfZcvTYSTW4+M8D2ROrwtB0B
 uDvgRDs0UN7/MpN8m7WFZ7Q9LNEOFXu7Nsc2/CaAsf3fTK64kiddD5OBw
 8nddFt7hLzH+C6+W2Fn9hEX+DT0lz5KiIgtIoxR20elFTbYpw6sspNfPm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="13030798"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; d="scan'208";a="13030798"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2024 23:21:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="906979845"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; d="scan'208";a="906979845"
Received: from nrseife-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.54.233])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2024 23:21:39 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] xe_live_ktest: Use xe_live_test kernel
 module
In-Reply-To: <11e1b3f4-b0ba-4095-96c6-f2bf18f27fd2@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231205224926.2188996-1-lucas.demarchi@intel.com>
 <20231207164152.57be3d07@maurocar-mobl2>
 <3kunqgqyf7tobiwhcpvjp7rcvidrgnz2jq3qqoxjbl7kaftdq7@7hdweo57htff>
 <njwvai6cu7jwmy7lmg3vkg4jd52uq2f6es4obvdplkz43i6hpe@jqrzk4bveqqc>
 <dzacvbdditbneiu3e3fmstjmttcbne44yspumpkd6sjn56jqpk@vxu7sksbqrp6>
 <20240112093252.0a4bf850@maurocar-mobl2>
 <57epajumgzrllmyufx7233yjja2c3fbs2zgfflkhcspfvwak47@h64l4uzne54h>
 <11e1b3f4-b0ba-4095-96c6-f2bf18f27fd2@linux.intel.com>
Date: Mon, 15 Jan 2024 09:21:35 +0200
Message-ID: <87mst7rri8.fsf@intel.com>
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
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 15 Jan 2024, Mauro Carvalho Chehab <mauro.chehab@linux.intel.com> wrote:
> On 1/12/24 15:29, Lucas De Marchi wrote:
>>> On such case, you should document kunit_debugfs at Documentation/ABI.
>>
>> debugfs is not part of ABI.
>
> That's arguable. Check Documentation/ABI and you'll see several debugfs 
> nodes documented there.

I guess you could argue documenting your debugfs under Documentation/ABI
makes it ABI, but I'd avoid doing that. Usually we use debugfs precisely
to avoid the burden of ABI and all the baggage that brings.


BR,
Jani.


-- 
Jani Nikula, Intel
