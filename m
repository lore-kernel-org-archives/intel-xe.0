Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9F0C5DF6D
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 07:33:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907C410E83E;
	Wed, 19 Aug 2026 07:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KW/BV5HW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF3510E83E
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 07:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787124799; x=1818660799;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=5vLE/5OsmvK/rde1I3hS2Tn1jUYtQKrJuCWN0kkGyTc=;
 b=KW/BV5HWX+9xSHlF2C0uhXchtOg32ClaUrtZp78fpeAOYXmC/zqH0b7o
 EJSmnYqXJbjyastQk12Q+c4EH1em+TBheN+j9GUMvxQ8G51a9S67sJZTP
 g3zBvot2y6VVtmr/9YnHn8rBwJzV17mRpPkVHds82RIc5zjGRpxhYUggl
 RcEjtQT0Z0xPR6uP7Ap4dZeS/bED2iPs8/yAO1EzM/quA04m/nSh7qJVk
 LN1rMCP35VYu0HuTx7PIAotDTKUClytEgGUW6ruWMo/0ira7SdxqC56d3
 NE7hYnWLgZqRL9T0LKgdktVu6itnrg/rLo2inWVNHjR18WkxLSfPyKFMe A==;
X-CSE-ConnectionGUID: uanmRq3OQC6+7dV68tMjCw==
X-CSE-MsgGUID: bCa716O0Que0azOR/phSGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="98988749"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="98988749"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 00:33:18 -0700
X-CSE-ConnectionGUID: JONMuDssSu+Vge/+ZHXlcw==
X-CSE-MsgGUID: ASjuqhY5Q4WS6/sh2uqQFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="303670211"
Received: from dev-417.igk.intel.com (HELO devbox) ([10.91.214.181])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 00:33:17 -0700
Date: Wed, 19 Aug 2026 09:33:15 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Dan Carpenter <error27@gmail.com>
cc: Imre Deak <imre.deak@intel.com>, intel-xe@lists.freedesktop.org, 
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [bug report] drm/i915/kunit: DP link: add fallback tests
In-Reply-To: <aoVX1vP6u291ElZW@stanley.mountain>
Message-ID: <48681343-ec61-3b57-d39b-8f353048cbaa@intel.com>
References: <aoVX1vP6u291ElZW@stanley.mountain>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="8323329-2067065736-1787124797=:1356931"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2067065736-1787124797=:1356931
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT

Hi Dan,

On Wed, 19 Aug 2026, Dan Carpenter wrote:
> Hello Imre Deak,
>
> Commit 4fee95d4f887 ("drm/i915/kunit: DP link: add fallback tests")
> from Jul 1, 2026 (linux-next), leads to the following Smatch static
> checker warning:
>
> 	drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:1223 get_fallback_config()
> 	warn: ignoring unreachable code.
>
> drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
>    1210 static bool get_fallback_config(const struct test_config_table *expected_table,
>    1211                                 enum intel_output_type output_type,
>    1212                                 const struct intel_dp_link_config *target_config,
>    1213                                 struct intel_dp_link_config *fallback_config)
>    1214 {
>    1215         struct kunit *test = expected_table->test;
>    1216         const struct link_config_set *config_set =
>    1217                 get_fallback_configs_for_output_type(test, output_type);
>    1218         int i;
>    1219
>    1220         i = lookup_config(config_set, target_config);
>    1221         KUNIT_ASSERT_GE(test, i, 0);
>    1222
> --> 1223         for (i--; i >= 0; i--) {
>    1224                 const struct intel_dp_link_config *config =
>    1225                         &config_set->entries[i];
>    1226
>    1227                 assert_config_is_supported(expected_table, config);
>    1228                 *fallback_config = *config;
>    1229
>    1230                 return true;
>
> This return statement means this for loop doesn't loop.

Same applies for get_target_config(); there is a fix under review for
both [1].

BR,
Micha³

[1] https://lore.kernel.org/intel-gfx/20260812141300.184053-1-jonathan.cavitt@intel.com

>
>    1231         }
>    1232
>    1233         return false;
>    1234 }
>
> This email is a free service from the Smatch-CI project [smatch.sf.net].
>
> regards,
> dan carpenter
>
--8323329-2067065736-1787124797=:1356931--
