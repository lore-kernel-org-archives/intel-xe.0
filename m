Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC55BD6C2B8
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 23:35:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A7F10E06C;
	Tue, 19 Nov 2024 23:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P7Tx3GEi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA60010E06C
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Nov 2024 23:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732059348; x=1763595348;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OWRP97dWqDHxcgviNV0k3rBYf1ceS92BkdH3cs7W43I=;
 b=P7Tx3GEiXiG+XUgYymdgi219WvQzGf2u0lfv0NP87AeaMiGiViKJa2dS
 +1QeIuh62v12dvGDd7LtUFkDa6CJDC4k2rn9Qg9yW2fWJjwKvZTbV48zb
 gvN+lmFP8nuNUsBgHIc1KlHfOYm1s4o0BBkPv8JnsHqtAIAy0AJLgreX0
 zbka6sti8IXEoZRrc0HSupKK+jxiBXBWNf+K0GLrPUrFJ6w+XF/Jm8Dqv
 8qtgpn2EKfa1vptVpILg5Gk9HT24PU2w7d825dzNC+6ReoFE4k4swSXAg
 2uH37YL3y6Rj1slvcDTpuVtQ67gCb7E2oH3JWyEIet9c0fiYkKNhUdKno A==;
X-CSE-ConnectionGUID: gmznq7+5RwaHcsgZr8ragQ==
X-CSE-MsgGUID: LmxAwVyeS5aX3uWiqaZ3+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="32023225"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; d="scan'208";a="32023225"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 15:35:48 -0800
X-CSE-ConnectionGUID: nUmUsIzJTjOqgNluR6IsIw==
X-CSE-MsgGUID: /VK95vx3RUWkUdZ4O1/uvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; d="scan'208";a="127267785"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.109.129])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 15:35:48 -0800
Date: Tue, 19 Nov 2024 17:35:40 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe: Drop useless d3cold allowed message
Message-ID: <lvkbcnzmoydp2gc6fy6dxovpxsskutvoaloif6ukgon2pto6o5@bhxa7pyta2c2>
References: <20241115192155.2050987-1-matthew.brost@intel.com>
 <ZzfCwCZr0byTqGj1@intel.com>
 <ZzfYK1jr6KTGxR0c@lstrano-desk.jf.intel.com>
 <Zzzd7FO-z9Q66Ugi@intel.com>
 <o2qvrowghi5shepavwjzb6utpioyj2neqfbr45eny54fqrga3m@trovhcv4hoof>
 <Zz0LNv3K3fEm/o8R@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Zz0LNv3K3fEm/o8R@lstrano-desk.jf.intel.com>
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

On Tue, Nov 19, 2024 at 02:03:34PM -0800, Matthew Brost wrote:
>On Tue, Nov 19, 2024 at 03:01:48PM -0600, Lucas De Marchi wrote:
>> On Tue, Nov 19, 2024 at 01:50:20PM -0500, Rodrigo Vivi wrote:
>> > On Fri, Nov 15, 2024 at 03:24:27PM -0800, Matthew Brost wrote:
>> > > On Fri, Nov 15, 2024 at 04:53:04PM -0500, Rodrigo Vivi wrote:
>> > > > On Fri, Nov 15, 2024 at 11:21:55AM -0800, Matthew Brost wrote:
>> > > > > This message just spams dmesg providing little benefit. Remove it.
>> > > >
>> > > > I don't believe it is useless, but I also hate the spammers...
>> > > >
>> > > > perhaps we could bring the status of it in some debugfs form
>> > > > as a replacement?
>> > > >
>> > >
>> > > ftrace could an option so if you really care about this enable it there?
>> >
>> > hmmm it looks like a good idea... but no strong preference from my side...
>>
>> as long as we are talking about adding a tracepoint rather than a plain
>> trace_printk() unconditionally.
>>
>
>Yes, trace point rather than trace_printk as that would just spam the
>trace buffer.
>
>> with dynamic debug we could use a verbose level that is only enabled per
>> file when needed. Then we can keep messages like this rather than
>> misusing the trace buffer.
>>
>
>'with dynamic debug' - Can you explain what you mean here?

normally used with pr_err/pr_debug() etc so you can enable it in runtime
as needed. See https://docs.kernel.org/admin-guide/dynamic-debug-howto.html#dynamic-debug
It's currently broken in drm, but I think the last bits are getting fixed
(see db62482e3242 ("drm/xe: Fix build error for XE_IOCTL_DBG
macro")).... I only use it with other parts of the kernel and find it
very nice.

Lucas De Marchi


>
>Matt
>
>> Lucas De Marchi
