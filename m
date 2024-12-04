Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33855E7716F
	for <intel-xe@archiver.kernel.org>; Wed,  4 Dec 2024 22:37:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC69610E5B4;
	Wed,  4 Dec 2024 22:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ciIQ5s5Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1CAD10E5B4
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Dec 2024 22:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733351871; x=1764887871;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=u+jJ4ShhuylUj7N07CS5a8b9DiHiqBveBCmYFWG4jzY=;
 b=ciIQ5s5Y/ZRIDcmEMdHbFsAbaZiFyMD8RaeThLTEDn0yC0d5VeV/iPQf
 zJNPvXuGF1LAxwVtWYpVwCfHLdAwP3YKm0WtZUdSWZxXMKZ1YXmguk4h/
 FH+p6hUXM/UZ2u+95GLkOLftDvvJ59cJ/ga7Ap/k5YyOJk1MoaFr3Nk/m
 6LvQM+l4cCkJ2S8Nnph6jHz6z/yYMdj7kdm9JE6cDkHCugRrlbfo/lkpY
 lO3DbIXggDXYAscoHYvP6p/R9MRrUd1KUEDpNbf1RvlrhPABjyXh85tkj
 mw8AnhpQIO4fEac8UCLbMdWHOz9/Ay1N3fON+D+5SkTIKpLi6ofgzLJbx w==;
X-CSE-ConnectionGUID: lLjo/ZrVQzqZB9oQmZ4G+A==
X-CSE-MsgGUID: A/QTEJhjSpKUNSMU81ppbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="37577817"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; d="scan'208";a="37577817"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 14:37:50 -0800
X-CSE-ConnectionGUID: pGswr4RnTD+EIcKEqxgsBQ==
X-CSE-MsgGUID: v0ZDlAbWR+ilb2TPsRC6Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; d="scan'208";a="124717449"
Received: from inaky-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.108.115])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 14:37:50 -0800
Date: Wed, 4 Dec 2024 16:37:45 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, katarzyna.piecielska@intel.com
Subject: Re: kmemleaks and our CI
Message-ID: <ns3jiekl3yb4e6y3bcxoaspylcwq3rd6xr3jyylkkxtw6vyz44@jonstynodffm>
References: <734868cf-2f46-47b5-9f77-869164d50bb8@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <734868cf-2f46-47b5-9f77-869164d50bb8@linux.intel.com>
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

On Tue, Dec 03, 2024 at 05:48:59PM +0100, Peter Senna Tschudin wrote:
>Dear xe kernel driver developers,
>
>I am looking into sane ways to integrate kmemleaks with our CI. By sane I mean ways that will help us find and fix leaks while not overwhelming us with noise and our DUTs with unnecessary load.

I think we will need to try a couple of approaches and see how well we
can support. Maybe we will have to filter leaks originated from
elsewhere... not sure. I think it's important:

1) to be easily turned on/off
2) to be easy to reproduce on dev machines - it's awful when things are
    deeply integrated in the CI infra and just a few people know how to
    reproduce it

So, I think it neeeds to be a command line option for igt_runner.
Something like the abort-on-monitored thing it has. But maybe we
shouldn't abort, just warn.

>
>It came to my attention that we may be running _all_ our CI tests with kmemleak enabled and scanning. To me this has two problems. The first is that it slows down memory allocation and freeing, no big deal.

indeed, no big deal

>
>The second problem however, is that if all our CI tests are indeed running with kmemleak enabled and scanning, it means that we are not testing our drivers in a kernel without kmemleak. I don't have numbers, but I assume that a large portion of real world use cases will have kmemleak disabled.
>
>Is it a problem to run all our CI tests with kmemleak enabled and scanning?


not a big deal. If we were running benchmarks and trying to
compare the performance before/after etc, it could be problematic as a
bunch of other debug configs we also need.  This is not the purpose of
our CI - there are other CIs, particularly for the userspace libraries,
that do that.

See our repo for maintaining the kernel config:
https://gitlab.freedesktop.org/drm/xe/ci/-/tree/main/kernel?ref_type=heads

There are other build variants that are also built by CI. CI itself
uses the debug variant, but others are welcome to use the nodebug and
propose changes.

Lucas De Marchi

>
>Thanks,
>
>Peter
