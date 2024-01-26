Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD738C47DDB
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 21:06:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15EA410FEA4;
	Fri, 26 Jan 2024 21:06:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB2910FEA3;
 Fri, 26 Jan 2024 21:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706303163; x=1737839163;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wHN4PS9PmLhc4EmzQ9WRGbrb9ei1hpSHS/Xfm6v0BSY=;
 b=P6ZnTJzP4Ix+C6pnKlbqbTk/HsDZSI/72RM73/ObtIES8omE8INQ44RN
 42T1rzRpy0U690WMhiwv1HyWzbMFYsR2k5hSGDEIdU9GQhzJuq8J21GYp
 hyTGjPy4Eq8+GJkuvsmMfN2tPC4P44nELpoSirjbo6c9SLJ/apuIKW25V
 3h5/peZwb/zqyvF6ENB65gfqupMLL3mSnGqjaOBF4/L+aqfDGStBUOYTH
 JD0/CE2+DOA64QT4SxbjPlvPLGJ8j1iO/gDgH/pBu/siLTSVt+gAeiyWo
 voGaSUVjki7d9k9kH5jnL2+WVVAvKF+W4Nz+KwbiFye493rUdxO2Qwjcx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="2414007"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2414007"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 13:05:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="877489357"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="877489357"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.21.53])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 13:05:27 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t 0/3] lib/kunit: Support writable filter* parameters
 of kunit module
Date: Fri, 26 Jan 2024 22:05:25 +0100
Message-ID: <7620076.EvYhyI6sBW@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <2221731.72vocr9iq0@jkrzyszt-mobl2.ger.corp.intel.com>
References: <20240125165749.15599-5-janusz.krzysztofik@linux.intel.com>
 <kiflqa7ksoazk52b7ffmzktapvtx3yayqqmqm6gulylvdu7mx3@dzp5fpbsblty>
 <2221731.72vocr9iq0@jkrzyszt-mobl2.ger.corp.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

On Friday, 26 January 2024 17:31:53 CET Janusz Krzysztofik wrote:
> On Friday, 26 January 2024 15:46:54 CET Lucas De Marchi wrote:
> > On Thu, Jan 25, 2024 at 11:25:55AM -0600, Lucas De Marchi wrote:
> > >On Thu, Jan 25, 2024 at 05:52:09PM +0100, Janusz Krzysztofik wrote:
> > >>Instead of wasting resources on reloading the base Kunit module each time
> > >>a different set of filter parameters is needed, try to write the required
> > >>values to sysfs representation of those parameters.  If that fails (e.g.
> > >>on older LTS kernels with read-only filter parameters), fall back to
> > >
> > >we can't really execute anything on LTS kernel. I don't think think it's
> > >worth keeping the multiple fallbacks we have now.
> > >q
> > >I think trying to maintain compat is good, but I'm not sure it makes
> > >sense for these tightly coupled tests with the kernel.
> > 
> > I gave it a try and it doesn't really work for me. It seems that after
> > you list the tests, the filter_action remains on skip, so the tests just
> > skips.
> > 
> > $ sudo ./build/tests/xe_live_ktest --r dmabuf
> > ...
> > Subtest dmabuf: SKIP (0.078s)
> > $ sudo grep . /sys/module/kunit/parameters/*
> > /sys/module/kunit/parameters/action:(null)
> > /sys/module/kunit/parameters/filter:module=none
> > /sys/module/kunit/parameters/filter_action:skip
> > /sys/module/kunit/parameters/filter_glob:*
> > /sys/module/kunit/parameters/stats_enabled:1
> > 
> > This works for me (with my additional patch to rename the module):
> > 
> > # # list tests
> > # modprobe xe_live_test
> > # echo -n 'skip' > /sys/module/kunit/parameters/filter_action
> > # echo -n '*' > /sys/module/kunit/parameters/filter_glob
> > # modprobe xe_live_test
> > 
> > # # run just xe_dma_buf
> > # modprobe -r xe_live_test
> > # echo -ne '0x00' > /sys/module/kunit/parameters/filter_action
> > # echo -n 'xe_dma_buf' > /sys/module/kunit/parameters/filter_glob
> > # modprobe xe_live_test
> > 
> > I  think the main issue is that kunit have some different code paths for
> > not param == NULL and also that writting an empty string is not really
> > working as it doesn't issue a write() syscall. If you force a \0 and use
> > len + 1, then I think it might work, but I didn't test it completely.
> > I may have to enhance the patch on the kernel side to handle that more
> > effectively.
> 
> OK, if you are going to enhance the kernel side then I'll hold on for now and 
> get back to it when we can call the ABI stable.

Or I can propose a workaround that sets some non-default values of filter 
parameters that effectively work the same way as if default NULLs were 
restored, which now seems impossible to be done via sysfs.  Example:

List mode:
- filter: "module=none" (no module matches the filter),
- filter_action: "skip" (always, since all modules are filtered out),
- filter_glob: "*" (equivalent of default NULL).

Execute mode:
- filter: "module!=none" (any module matches, equivalent of default NULL),
- filter_action: not used (no modules are filtered out),
- filter_glob: application decides.

Thanks,
Janusz


> 
> Thanks,
> Janusz
> 
> > 
> > Lucas De Marchi
> > 
> 
> 
> 
> 
> 




