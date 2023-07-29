Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38390C00528
	for <intel-xe@archiver.kernel.org>; Sat, 29 Jul 2023 15:58:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525D710E0D2;
	Sat, 29 Jul 2023 15:58:09 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58AA410E0AB;
 Sat, 29 Jul 2023 15:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690646287; x=1722182287;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8B2ZXTX/T+9iJs7GisviUMJRO157mD7QeorTcPRymOo=;
 b=bGSuB4UCQwdAWhvSt+XifMZdgdXABdtxaBHUFqvFB3ZbJtyoaCSdc1qI
 fgTeD0Shl98N2Yl4ty2kbbrEBng7T45tBt5Lrof6/grhH9CfS8AcsfZhB
 u2IaXVg1TRcgHAZIkzwAL5Yg0KK7IYsD+zwxj4DEOHbqgn+6sxBiIvqeK
 kgC9U6DsI/wG5dxIdCXXDdgoOk/o8cmBSNed3BpCQwt0JExtKVEWiT84e
 oKu+T6JZl6qj+ygzSen0IfAdnJSVCbpdsafbMZh1n1Cs7mR79lvordG/4
 SvG0KIhzM+/VperQl5MkLF+7KF6LSFm5pPRfjVBosvYY4QHRqvjxFTN0p A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="371471167"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; d="scan'208";a="371471167"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2023 08:58:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="793225232"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; d="scan'208";a="793225232"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.23.199])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2023 08:58:02 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, kernel test robot <lkp@intel.com>
Date: Sat, 29 Jul 2023 17:57:59 +0200
Message-ID: <3204833.aV6nBDHxoP@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <202307290124.BnnhRy8b-lkp@intel.com>
References: <20230728154419.1810177-8-janusz.krzysztofik@linux.intel.com>
 <202307290124.BnnhRy8b-lkp@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [Intel-xe] [PATCH 3/3] kunit: Allow kunit test modules to use
 test filtering
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
Cc: kunit-dev@googlegroups.com, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, igt-dev@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-xe@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Friday, 28 July 2023 19:24:55 CEST kernel test robot wrote:
> >> lib/kunit/executor.c:182:42: warning: declaration of 'struct suite_set' 
will not be visible outside of this function [-Wvisibility]
>      182 | static void kunit_exec_list_tests(struct suite_set *suite_set)
>          |                                          ^

I've apparently broken this patch while reordering patches in the series.  
Sorry for submitting that untested.  Please expect v2 soon.

Thanks,
Janusz


