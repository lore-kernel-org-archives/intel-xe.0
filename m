Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3115BC47DAF
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 15:37:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AFC410E3D1;
	Mon, 22 Jan 2024 15:37:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A187D10E052;
 Mon, 22 Jan 2024 15:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705937844; x=1737473844;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vOJ3RdV5qNuUKmSM+tM/5FaF+38/1NR+bmdQHwe5Dys=;
 b=Y7Gy9cZc7lQbshW+LTwdHg7frU3LkcXt+UY2BTlQ0MGfi1nTybkSu+vk
 BsS7E4E70CQK7M5Ygr+sv/0ABrdzQQp7LMPiIB5x0swIQ8bfef7IcNfCm
 9oIGSjSoSBqs31kTydl4HHatEaiq3a3LAZiKl/ex3WfsKss6ssQUwmFAx
 An4s1mC7AzK8CinJx0eaMar45CR2irfm4hMy/kr4th+FxezDIYtT0DYXJ
 ai8dE1mXUwOqpqSbtYzzcWJEAG7r9aubLBTxkSahJuYnoUJ0uHVSt3MvC
 fJS9PpOuh06us+i4qXlqzumRHYR1Dz0+t4mtQfJ0rUIgFt6BWx8iAY1Dt Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="7995626"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="7995626"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 07:37:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="27696782"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2024 07:37:23 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 07:37:22 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 07:37:22 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 07:37:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fpiugn4b5rHa3OKFFmBRFc+Qb5E/Qk48YzTSG2y+/yf6tURooBngQ1GzIdfQVWy8QCI5oVJqQiXVAh73AiuvYIXMNqwTQxEhqfZ6p8EZFozXycQJybd/91fveQBYMkfIHUmRcDmAmkWclmXvyohsO1yCrA6F8M72t05R1GX/fnwR+SX5/vFk8nQx3viIwHtvuU67BMkkwxEIWZnzJJejod38OLr4j8cVuVN2N8PBorQE7iZ2CyxugkqQMUl1zuaX/5pkcJJHwUVwM6Lb80VqAQ4Yjgwoh8R3Rhy+BARf/sMtQcrDNt78DM8NSg6ZkhKmxmHVpMGDs2GuI3Rrozn3ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8la0FmiVrh0X6S3phhY+hAh/NIUm5TT+qGGQ2EfSYnA=;
 b=ROg0/AcVetOv1mtaNpQrmKfnw4lilcI8T2gWeCVvC81exSaLKZdZS/6VHBUddKSeGeHHPdWjLb3lF6EiRJwBC0WcK4+NoyHSFQImvx4TxpaukUScKI/UuG8yAV8F64bWAkXSQsdQbKuLMdKa4EdZ4Dedr5Juz/swdgWHnG40lM27JpHkglbPkkTxVov09E9zOtm/x5murLsS8rLiLXpQGZOXuPDM4qZ/XRZjIUiVSBGfe7UXzKiEPTBdp7VxV6msappMjv8UFLcnjIbtsxWSbbBZWyquzCrRU11CWTdFTUVqDqOSQrMawmkJdHD+1wRVCmpYzo4ZGQcFmkDFmGN9+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB8599.namprd11.prod.outlook.com (2603:10b6:510:2ff::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Mon, 22 Jan
 2024 15:37:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 15:37:19 +0000
Date: Mon, 22 Jan 2024 09:37:17 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: Re: [igt-dev] [PATCH i-g-t] xe_live_ktest: Use xe_live_test
 kernel module
Message-ID: <pzahxxitvi22wn7zs7w7dy35zvj2i7ziwxdpn33pyo53kngmf7@ftr4s7ar2fkx>
References: <20231205224926.2188996-1-lucas.demarchi@intel.com>
 <njwvai6cu7jwmy7lmg3vkg4jd52uq2f6es4obvdplkz43i6hpe@jqrzk4bveqqc>
 <dzacvbdditbneiu3e3fmstjmttcbne44yspumpkd6sjn56jqpk@vxu7sksbqrp6>
 <7633435.EvYhyI6sBW@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <7633435.EvYhyI6sBW@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: SJ0PR13CA0021.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB8599:EE_
X-MS-Office365-Filtering-Correlation-Id: dc546743-1045-4bb8-9cfc-08dc1b600508
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gn2Iztqyt6u8C6Gaa+Ic4Z4TJQPUcojPK42OWSjcQQxaRVBn482Tj7zXcmQrnqNT7QpYlq90+wm8Kub7DUuj82jEAF8i2Pf/ky8doa396ytX8lpRClgnoURhqfsywLFX11oAu5EKx7Dph09dDUGbXJoa8+9X7+mDwSPxTVKPDhumWZ48fM4OpqUpWUL6RU95A1+CCzNcHwZUH7q+OGisbO8hTprtgYzWlPhfxfbDV792f234MYNhGAYftoMct3r2eHdptC6o209uakLTk41ZH371JhzRZMYfzjDLhNtFqPIx3/veLvVCcKcp7QaPXE24OHlTnRQCdb1uSh5bbrrDU/wmn1IwHC2giTm9W6oJZqggxrFKnHqhuATEessiJHs/xKOY+MI61eMZUC0MJ4y6uPHyXmmSCnmhOdWx6xQ2oeuNikq7E+7cWZdoo+WNqbDrRC9GRSf8sNr5QsvHvFjc/hvEcvnUXc5kavzAB9VB75UdSU3iXcnLvN/nBdWetUvQAHRPQbFMUTUXc1KosABXp1w9FP4UehHwqOl6xygazy1ZRe060uwsE88UDgKO1lOiRkWSNKwVpb1kCcXzrUltpQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(346002)(136003)(366004)(39860400002)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(41300700001)(33716001)(38100700002)(82960400001)(8936002)(8676002)(4326008)(6506007)(5660300002)(26005)(9686003)(2906002)(6512007)(966005)(316002)(6916009)(66476007)(6486002)(66556008)(478600001)(66946007)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pjQmTZz9278t7LE7blBhfaFcXHlZWm04t5f2DTKA746QZbL9P9DWqqc/xdS4?=
 =?us-ascii?Q?Fq1Z+CAy42vflKlANpjrvBkXY+ErSFqlf1oWZfIyMj1LZ4jRN8ZidGWv8sUl?=
 =?us-ascii?Q?HmV9Ci48YrF2msJDV6e1x9J9nx87auWnhcXeWBif0KMEcBCoKPK+5e4fWkdm?=
 =?us-ascii?Q?C346icwFBMbGej6WyvFyyZQgoZqeM4zHOxzLlkApNfxJFQLEwW8FyE65Tg1D?=
 =?us-ascii?Q?GnFPvqehsa6XwLzopFLw8W18jSVcdzYuaPnX5lpJjvYSiSJestwnVFgFdvqJ?=
 =?us-ascii?Q?Q4y1ACGyIUdjROFar/Il8l9UlOBHCMkxAmI2eF4U+sQxUrpKkNVbnj1+AlOB?=
 =?us-ascii?Q?PgmQy5r8xdkniQxj9q0cUFE3o8XKTFuYjy3EkmLiWT+LQHyeWL6J5BwTHoBa?=
 =?us-ascii?Q?/3eo1UKhj1d5Ow5/HIMeeOVL2zIjY+5zOG68X+Bm5cvjAeZlnhyU0N3TQHz2?=
 =?us-ascii?Q?sy/+aNGYqJDgZgHxz0z4RkeRTjDK3xQD3PDpmzS2YXmuv9PkDv9HhoR90Gn8?=
 =?us-ascii?Q?AaJeVpZbib4FbP70NaiiLpccA59XhjoeuDab7/uueJ49CnGCtqhoNbwSliSj?=
 =?us-ascii?Q?pFHA6HmU9YC5Ox9C1qPUhUvAF5xzvm1meJW2WJMbsJ7JkrY9Qf2NcMdlZrIB?=
 =?us-ascii?Q?Ne4+yvKg3TYvwvoikhpVq2ONd6MWn38vc2rqRGKGgWDg2GPig5GXvFEFfEJZ?=
 =?us-ascii?Q?CA0z1nsQt4+uYK5dpob4SBnst+bN6BCaig3JrFIPKFqxo0169GXQz/dTfZ5x?=
 =?us-ascii?Q?iDGx9ELwXKL9bD7H//dfP9EyoZUVEER6nTy9pIL+RSFOYXzNfmiDC1m67VG7?=
 =?us-ascii?Q?bTxZURSjCR13n96KJODRPGRfRv90nRgKK4AWwc/4uEKnmohDfXYopg3mMM+w?=
 =?us-ascii?Q?M0RG1gsgRu43idKEyQlWkIrIbtpeYahXDBcnUoARnGyhAmkJqMiJg3xZ/WPC?=
 =?us-ascii?Q?s7uf5LMgozcK2OTz9RhXnZdJjyqhjIyP6z5tX7HeEFFIKXAKe5cY9KZpfd5Q?=
 =?us-ascii?Q?E/4GbELWCdFKZjD5IwJxX5tbzwyGZ71N3FpJqpCCvhwiVoi3oUW3fKviAoco?=
 =?us-ascii?Q?WExVQzOGg1en1isEz9SCg5bTtZ4olUoCgAC8oub9AlnKDskfZor2xicwyVuY?=
 =?us-ascii?Q?aMMF76TmF4dPZ7eyjEbzjSwqWWRNhRRmY0cCw2ZvNfewjTqxY+nLvQs4x0js?=
 =?us-ascii?Q?bI0cM1bP1xAEbBecyILWt5neQGOrWJ1obpdlb5yvybBulwJfLOIzTtka7nBm?=
 =?us-ascii?Q?wHxMe0iARutCKsxazCNUVZRYEONoJ2Onqa0fnbU/ez26JCVLA3DGz5VDxJEk?=
 =?us-ascii?Q?Ams9J6C9PTEhoNvzcr8yVuY8o9xX+vGK+aYe1+pXBC52Kc0mWXBlENCeOBsE?=
 =?us-ascii?Q?WujjAu3LCvu1UkuJVbUp+ectBCBLv5RzUqFrEfyAGD+2j8xbNgk2y+dabsAU?=
 =?us-ascii?Q?9+ChfaTz/kpyiYNg8g6kD6jPEo+JheBSmAW5DACqkpSB7KHTNqZiB3KOVDjE?=
 =?us-ascii?Q?b+vpzoB/qnJKqCD5YZ4fSeJJ5sGx4wHwZSYNwjc/2mcbXG9aXQaEQPu9nJxt?=
 =?us-ascii?Q?Sg6P6v62tT+ccQy6Jjhl2ATZV8t9h68ZjLdrCqiTlIzXGqvfLN6WYjefVLrV?=
 =?us-ascii?Q?9A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc546743-1045-4bb8-9cfc-08dc1b600508
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 15:37:19.6892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vJCryyW5FdAzP4Cu8qT9OJEmZpTgs3vUhLCh+GiSCVsJ5rMmLC6i9WQlL9ONGrS0XK0Rils/ZAMwmGnqjIvmAyEmjyFB4I74O1GELBGrdv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8599
X-OriginatorOrg: intel.com
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

On Mon, Jan 22, 2024 at 12:35:28PM +0100, Janusz Krzysztofik wrote:
>On Friday, 12 January 2024 00:45:37 CET Lucas De Marchi wrote:
>> On Thu, Dec 21, 2023 at 04:15:23PM -0600, Lucas De Marchi wrote:
>> >On Fri, Dec 08, 2023 at 12:13:36PM -0600, Lucas De Marchi wrote:
>> >>On Thu, Dec 07, 2023 at 04:41:52PM +0100, Mauro Carvalho Chehab wrote:
>> >>>On Tue,  5 Dec 2023 14:49:26 -0800
>> >>>Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> >>>
>> >>>>https://patchwork.freedesktop.org/series/126786/ groups all the live
>> >>>>tests into a single kernel module. Use that module to run any of the
>> >>>>tests triggered by igt.
>> >>>>
>> >>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> >>>>---
>> >>>>tests/intel/xe_live_ktest.c | 15 +++++----------
>> >>>>1 file changed, 5 insertions(+), 10 deletions(-)
>> >>>>
>> >>>>diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c
>> >>>>index fe7b2e69f..c8bd68928 100644
>> >>>>--- a/tests/intel/xe_live_ktest.c
>> >>>>+++ b/tests/intel/xe_live_ktest.c
>> >>>>@@ -19,15 +19,10 @@
>> >>>> * Functionality: migrate
>> >>>> */
>> >>>>
>> >>>>-struct kunit_tests {
>> >>>>-	const char *kunit;
>> >>>>-	const char *name;
>> >>>>-};
>> >>>>-
>> >>>>-static const struct kunit_tests live_tests[] = {
>> >>>>-	{ "xe_bo_test",		"bo" },
>> >>>>-	{ "xe_dma_buf_test",	"dmabuf" },
>> >>>>-	{ "xe_migrate_test",	"migrate" },
>> >>>>+static const char *live_tests[] = {
>> >>>>+	"bo",
>> >>>>+	"dmabuf",
>> >>>>+	"migrate",
>> >>>>};
>> >>>>
>> >>>>igt_main
>> >>>>@@ -35,5 +30,5 @@ igt_main
>> >>>>	int i;
>> >>>>
>> >>>>	for (i = 0; i < ARRAY_SIZE(live_tests); i++)
>> >>>>-		igt_kunit(live_tests[i].kunit, live_tests[i].name, NULL);
>> >>>>+		igt_kunit("xe_live_test", live_tests[i], NULL);
>> >>>
>> >>>This loop will modprobe xe_live_test the times. Just do something
>> >>>like:
>> >>>
>> >>>	igt_kunit("xe_live_test", "live_tests", NULL);
>> >>
>> >>but there's no such "live_tests" suite and we want to run each of
>> >>them individually, not together.  How would you select the subtest
>> >>otherwise?
>> >
>> >gentle ping as I want to merge the kernel patch that is blocked on this
>> >one.
>>
>> I did some tests today and... current situation is not very good. The
>> kunit module has the param filter_glob to filter the testsuite, but it's
>> not used at all by igt.
>
>Please see https://patchwork.freedesktop.org/series/126017/.  It has been
>blocked by the below mentioned xe -> kunit module dependency problem, but now

I don't think we will remove that dep so should plan accordingly.  There
are some kunit features that are only possible by depending on some
kunit symbols. That was intentional.


>as I'm back from my 2-months leave, I'll update it and resubmit as soon as we
>have that resolved with writable filter* module parameters.

I will update that series.

>
>> live_tests[i].name is more informational than
>> to really do any filtering.
>>
>> Another issue I see is that since we have the dep xe.ko -> kunit.ko, as
>> soon as we load xe, kunit comes as a dependency. Since kunit's param are
>> read-only, we can't really change the testsuite that will run without
>> first remove xe. Having to reload xe multiple times doesn't seem a good
>> option.
>>
>> Some manual tests I did here. First a kernel patch:
>>
>> 	diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
>> 	index 1236b3cd2fbb..30ed9d321c19 100644
>> 	--- a/lib/kunit/executor.c
>> 	+++ b/lib/kunit/executor.c
>> 	@@ -31,7 +31,7 @@ static char *filter_glob_param;
>> 	 static char *filter_param;
>> 	 static char *filter_action_param;
>>
>> 	-module_param_named(filter_glob, filter_glob_param, charp, 0400);
>> 	+module_param_named(filter_glob, filter_glob_param, charp, 0600);
>> 	 MODULE_PARM_DESC(filter_glob,
>> 			"Filter which KUnit test suites/tests run at
>boot-time, e.g. list* or list*.*del_test");
>> 	 module_param_named(filter, filter_param, charp, 0400);
>>
>> Now we can filter the testsuite at will:
>>
>> 	# modprobe xe
>> 	
>> Run only xe_bo tests:
>>
>> 	# echo -n xe_bo > /sys/modules/kunit/parameters/filter_glob
>> 	# dmesg -C
>> 	# modprobe xe_live_test
>> 	# dmesg
>> 	[ 4064.402190] KTAP version 1
>> 	[ 4064.402195] 1..1
>> 	[ 4064.403336]     KTAP version 1
>> 	[ 4064.403339]     # Subtest: xe_bo
>> 	[ 4064.403342]     # module: xe_live_test
>> 	[ 4064.403410]     1..2
>> 	...
>> 	[ 4065.712622]     ok 2 xe_bo_evict_kunit
>> 	[ 4065.712646] # xe_bo: pass:2 fail:0 skip:0 total:2
>> 	[ 4065.712668] # Totals: pass:2 fail:0 skip:0 total:2
>> 	[ 4065.712700] ok 1 xe_bo
>>
>> Execute all live tests:
>>
>> 	# modprobe -r xe_live_test
>> 	# dmesg -C
>> 	# echo -n \* > /sys/modules/kunit/parameters/filter_glob
>> 	# modprobe xe_live_test
>> 	# dmesg
>> 	[ 5010.536719] KTAP version 1
>> 	[ 5010.536725] 1..4
>> 	[ 5010.537618]     KTAP version 1
>> 	[ 5010.537620]     # Subtest: xe_bo
>> 	[ 5010.537623]     # module: xe_live_test
>> 	...
>> 	[ 5011.831597]     KTAP version 1
>> 	[ 5011.831599]     # Subtest: xe_dma_buf
>> 	[ 5011.831601]     # module: xe_live_test
>> 	...
>> 	[ 5011.867751]     KTAP version 1
>> 	[ 5011.867753]     # Subtest: xe_migrate
>> 	[ 5011.867755]     # module: xe_live_test
>> 	...
>> 	[ 5011.882481]     KTAP version 1
>> 	[ 5011.882483]     # Subtest: xe_mocs
>> 	[ 5011.882485]     # module: xe_live_test
>>
>> To simplify our kunit lib, we could also rely on kunit_debugfs to list
>> tests.
>
>That option also sits in my IGT queue, though it requires an updated Xe CI
>kconfig (or at least it did two months ago).

an MR to https://gitlab.freedesktop.org/drm/xe/ci would take care of
that. Can you prep one?


Lucas De Marchi
