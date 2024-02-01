Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEB2C47DDB
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 10:25:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D3F210EB1B;
	Thu,  1 Feb 2024 10:25:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E102110EB1B;
 Thu,  1 Feb 2024 10:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706783102; x=1738319102;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K2KgtLpieQ6eeKqcs+Rwz35iMUs+sD0Yq9jn1JL4FCc=;
 b=SAaXB4k+jOUw5cxpwpTunHtwW71gVU3DP2IM0F8OdKVlJWrIBytvZZ4I
 K7cytwh42NASqV/3GBulTJOP98wfUlznZHilg01VyP/WNylVIE8R5UNVr
 VZh2OTneY1mHM+P45GTtDNviYu3QgSmz+nR9MOFGPpuTMCnXj4KAIjLjw
 uZTShHi6KALOjoqFzh3uZf/YU8KsaVHvIzsfwNIwP1ZuCB8SpOwx4hmC0
 Oecgu5hXJZj3LvDYaNgqeP0vW815CEBy85nWhDCQCRZsC4YW+kVCG1koD
 /krymRxZlo9wW0v0CC7rsgXc6ALRAU270GSuyhKVQAKBYXkotZg4YW/G+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="407581544"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="407581544"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 02:25:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4338885"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.1.219])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 02:25:00 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v2 3/6] lib/kunit: Unload base KUnit module only
 before reloading it
Date: Thu, 01 Feb 2024 11:24:56 +0100
Message-ID: <3216932.vfdyTQepKt@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <m3j2mworpv2l3d7vtqcm3qjkrhqbnqn5jjqhbcpmlcu6nzx7ew@uu4k74ef2p3g>
References: <20240131181156.80571-8-janusz.krzysztofik@linux.intel.com>
 <20240131181156.80571-11-janusz.krzysztofik@linux.intel.com>
 <m3j2mworpv2l3d7vtqcm3qjkrhqbnqn5jjqhbcpmlcu6nzx7ew@uu4k74ef2p3g>
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
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Lucas,

On Wednesday, 31 January 2024 23:46:59 CET Lucas De Marchi wrote:
> On Wed, Jan 31, 2024 at 07:03:50PM +0100, Janusz Krzysztofik wrote:
> >In preparation for replacement of the current method of reloading base
> >KUnit module when a new set of module parameters is needed with updating
> >those parameters via sysfs, unload the module right before it is now
> >reloaded with new parameters, and stop unloading it in other places.
> >Follow-up patches will remove some of the code added here, but even then
> >they will be shorter and more clean with that adjustment already in place.
> >
> >Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> >---
> > lib/igt_kmod.c | 23 ++++++++++++-----------
> > 1 file changed, 12 insertions(+), 11 deletions(-)
> >
> >diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> >index d1091bdc79..d2c28d0a64 100644
> >--- a/lib/igt_kmod.c
> >+++ b/lib/igt_kmod.c
> >@@ -1130,6 +1130,7 @@ static void kunit_get_tests(struct igt_list_head *tests,
> > 	 * iterating over KTAP results collected from blind execution of all
> > 	 * Kunit test cases provided by a Kunit test module.
> > 	 */
> >+	igt_ignore_warn(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
> 
> with the rw params, we should be able to run with a built-in kunit. Will
> we be able to with this call here?

Please note that next patch drops module unloading completely from the code.  

This patch has been added to the series on request from Kamil (IGT maintainer) 
for splitting the initially single patch into four.  I partially objected that 
requirement, but since there was no response from Kamil, I found the way to do 
it.

The idea is to place calls to igt_kmod_unload("kunit", ...) only in front of 
igt_kmod_load("kunit", ...) or a block of code that results in the module 
being loaded automatically, so next patch can replace those operations with 
kunit_set_parameters() more clearly, not touching other code chunks.

Thanks,
Janusz

> 
> Lucas De Marchi
> 




