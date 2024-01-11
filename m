Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C87C4707B
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 23:45:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DEAB10E9C1;
	Thu, 11 Jan 2024 23:45:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E6110E998;
 Thu, 11 Jan 2024 23:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705016748; x=1736552748;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pFVes0zoHzEQvHnjIEQbrQVnop8Yeuf+MBIkwcKZ4JM=;
 b=CNPtQw8LyqmU5iV80cvHIzinYs18wD42+yT/rO/XCm6BLxTLorytpj+G
 ebqliLkK9MuOwVIgkh05/GekzG95MOMud03r+ICgz/SRd+VMDK9BgZwuY
 WxfJaKsLfQJKOeD6PZdnNM7un4hT8o4KvREWmOtqthxJssIWyErclqkdp
 zuJrNRLsV2BIll21RZuPIlIZGeuIZ2A6q0b3GgK0vbspOJERKS8SF2Ly9
 fsXiSQyvT3FF4lVmnDiyAx4LFxGaG/ODgCYP6+zh84i73QXP644LFN/r3
 ezHbM5hku305MMa9iaJMRZcE5Zv9hYQlW7smYofKdg0czqZWjM/zfDP9J A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="5795378"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; 
   d="scan'208";a="5795378"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 15:45:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="955930011"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; d="scan'208";a="955930011"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jan 2024 15:45:47 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 15:45:45 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Jan 2024 15:45:45 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Jan 2024 15:45:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jenhgwKldZ++DCLqpa425k6CXWKTQhM4By5t0kCp0YOR8SbVr+8FvnN8AdMGKMVNWtNjRjaM9aSczAjaaKnf9z3JcR3YfEBbDATEQpXL4k9g7hDHWrEQioKvNXcX+ywXPH3iQratGNsxZKQ++/lE/+3HUFXLWChqJ+FkyW7t9h5HHoARnQFqQAj0C35V3e2ZrU14aOyyjtz+nveIl2ZJzvMSV9P4suTaLPWMytLu7gPItpfVXm0l6ZKmnbZz5u4p7wWUtiqxSyjje3LH5Zo9xkPjzNyGsZVaPgNvy5ZF/5ty23Zwg44gs8I4+0dlcDEQpH+l5KXKx1YuIZE4fcqTHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kn674tJAYdKoU9G9fOwjWzb58r4EzJQ90xcjzvZvcj0=;
 b=OWYQA7kagaqrwGrlaRpomk8GjbwsQRkWDkTWPGv5VfotZFmW1A8fkfoKVkm5zdaL0FEKZ7ngla/27aDVf2/4pnW5aUqmkqbv/Lce94NMZA8fQYNd6NqxNRBZTGwgQWUuML9SRwgh8VBOMad4VmINLfwD0lfWqeC01RwgJ0kXIvvJlG5GLfjPyODT6tz/6nYQVj1Cc1efHgGcrT/agXU3ujeESfxzU8IJseltsChlDsyTpMTn/xI6qzMQ39avRyJ3FRN63vqLXsulB2/IVeeXi/p2CvbnTv/scL6ZS12g80Fr43TsjsnOvQ//UrGv+ir4qJUKEMA645+4+NoCBfYFQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ0PR11MB4813.namprd11.prod.outlook.com (2603:10b6:a03:2df::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19; Thu, 11 Jan
 2024 23:45:40 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b30b:545e:3b7f:9626]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b30b:545e:3b7f:9626%2]) with mapi id 15.20.7159.020; Thu, 11 Jan 2024
 23:45:39 +0000
Date: Thu, 11 Jan 2024 17:45:37 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] xe_live_ktest: Use xe_live_test kernel
 module
Message-ID: <dzacvbdditbneiu3e3fmstjmttcbne44yspumpkd6sjn56jqpk@vxu7sksbqrp6>
References: <20231205224926.2188996-1-lucas.demarchi@intel.com>
 <20231207164152.57be3d07@maurocar-mobl2>
 <3kunqgqyf7tobiwhcpvjp7rcvidrgnz2jq3qqoxjbl7kaftdq7@7hdweo57htff>
 <njwvai6cu7jwmy7lmg3vkg4jd52uq2f6es4obvdplkz43i6hpe@jqrzk4bveqqc>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <njwvai6cu7jwmy7lmg3vkg4jd52uq2f6es4obvdplkz43i6hpe@jqrzk4bveqqc>
X-ClientProxiedBy: SJ0PR05CA0122.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::7) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ0PR11MB4813:EE_
X-MS-Office365-Filtering-Correlation-Id: c915a8ed-a257-4220-b875-08dc12ff6aa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zhxv/7+3qAg0BodtHGcwFt2InezgcQ1F//StSMsxPB4ROzTcokCJTRb1m33q1Pjj0Qtr/4WK5cqMgu/n9olgYVYKC/IjDKegZTY8ar3wO7lgrE+HPD7tmDvqMfWSw9fxCptOZfDBqzyS5ZG+QUUHx565rysGT0+walhVWBKReAEhqw0e8e1xiqOgmPHI3HtfIWYJW14rqpkfYUmovCj9HB3qnXfhmPcFGmswnlW6sak+gPzmyM99njvp9WCyKo4LwRbLhsmsmIZt1uIh04A1X9S4D2iNFxByHrWylSOx9arRGlMRMQ/JplHiB1WU7broAdriluMmDwIRe9VbmEGoz2KmX78nYZYzM3q97uethGPouKNsjm2H4C43enz86LqLeelao+bmdZwQVbuRyUncOCQas5NYJ0fb09dZFFzJI9LurExUmELqAx+7uEYqGDxW2Q4W9aWnU9h0afpzXhNMMfRmJ9IxX11p13ZNF80b1Xf9Sr8vWP/5iTflcHvz4Mya7H28/mm71Wrt9VnC75c4Std73+oxx91CgOEqWbj5YPA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(39860400002)(346002)(396003)(376002)(136003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(9686003)(6512007)(26005)(6506007)(6486002)(478600001)(83380400001)(5660300002)(2906002)(33716001)(66946007)(41300700001)(66556008)(66476007)(6916009)(316002)(8936002)(4326008)(8676002)(38100700002)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y1On2o9pmBOcea+h5x16tSE4B+F4C8nSuXmEe48CPuAvCVoDYo4PLJOmCSaB?=
 =?us-ascii?Q?C7v2YYG5ElOE0G3iNQOfX5Lqi098I8heHhI29i9pDMKeUithoHi7VF/F2Bmd?=
 =?us-ascii?Q?j/2qWR7+niHFKeDMBAQ0/7N1zRWQ9apZG/k+dYxqOW0fQNB4vUOccuTRHZ0i?=
 =?us-ascii?Q?TW5X9snciBpkOGC4XeKavlwdBNArGsqbVPN40GjpTNZHg5CuqrwRc+20orNd?=
 =?us-ascii?Q?rCstmuKuST+XN0cRchfIgJX9X1rfy+d1ySiyBKUC2F+wo/G2s2Z9Noq66Iw0?=
 =?us-ascii?Q?4U8LmY8FA0gySvZljRYUtHfEOh4+2xsIgZUIHRIwOiKuZrPl1K2KtcuLgBmw?=
 =?us-ascii?Q?I4Z75z4do0sFV3v8m6QRPpHGA3XiK4FKXbxtjK2Sx2ns0P8Zi6/MPAI52hXw?=
 =?us-ascii?Q?OmuANGhYprt5yBBV/zEv1LW/i7/8vwuUuVAF9bwsGIZfXZ8rm1rLFJJVT6EL?=
 =?us-ascii?Q?UBHAmWX+gybyzYO/MkOSbsxYx9/H411bcdu0oD0+fDCiz8pqtchKDlFiUxBc?=
 =?us-ascii?Q?rlhx5oC4hCR3D1hxG3bPU4CLCUawPpMjiiwbYIlMSQQ58YECKStLyb9BJSkc?=
 =?us-ascii?Q?wx3ypht91yMSvo7jNKo3J5ThXAhMUNaDOr7U+xiwJqQxYoQ1tMeAGIDxUv4D?=
 =?us-ascii?Q?b74CdfFwCYISYYbM97jZVPsJboNCflvpA4agkcGwPtcgcdbDarfAstMq/log?=
 =?us-ascii?Q?/fKKoN4UKTmdeGOuAhiJq/VA/Xq9Lejwf4FkjORbtuFc9PXCMvU8Z5DwPvtT?=
 =?us-ascii?Q?eg1nE/kPnH4TmsR7zolUFlfiEWb2L3YUzlDFTOPOa4IQfxMAcCJXeue++s4L?=
 =?us-ascii?Q?xSnwFEW5zalZYl0ewl3kBWMLCE1o7ZW9F7gPiyyoC3mUdpZLewZVHjJ1vHTG?=
 =?us-ascii?Q?zgm//jMBRW07qxYMGjY8kiae97iyfSoCvop7Ni0TeCyPXFidWypli2Lc/85L?=
 =?us-ascii?Q?echcvusm4vDJOMeyblJv7L/ft12WbH7SMIFFAYhUPic21OdGYrAZ1vYSrz0R?=
 =?us-ascii?Q?YuY0Q2BpwlQmCKGSuKbHgSYEecOfEwJOdLS03gkOS9Ubm7lpXzCAHMfODeOC?=
 =?us-ascii?Q?LoJyJ3oRHYG4UNOOXnAgQFC03CT4GbmF1Tblj6fBGNepIASDS3pazDa802Xt?=
 =?us-ascii?Q?+qahw+RYFTcTy5Da+Hts+Gt2YhSjJURh7xfL4Hs+uB3yxMPArrQWRvu0eW0o?=
 =?us-ascii?Q?x8j8lvE6j3HDSMWi72Vdyrc0+85OfNiNserU3c2sLeJkwSdAN9vFpOy3rXa6?=
 =?us-ascii?Q?CXo0VwJ4hxPI3LHOqyTV6r1lYl9BCayXlHxbHbH1ogkIz35PpgifmpP1J5hI?=
 =?us-ascii?Q?J/XU3qBjolHFqwVcUa55aVthkPNPSgSVFz8gjVz2VTHQOYx/2xlf2ILDQiZg?=
 =?us-ascii?Q?6ZqKq1P8+S1BpHAvpNsZtQBO7z7KV5byG9GYgdzL0WvhS+fKV2Dmau5BT9Bz?=
 =?us-ascii?Q?FqrZ9lqTun85lMvu8WA4maqRaM/w64W/7dVzKuypPrfR33UDrCclVtVm2FKV?=
 =?us-ascii?Q?/Xx61+p7GTntjAhobu1c/QCFuITrvLgt3UYDBTz4eEMbxwodAM8dNzqSsu/q?=
 =?us-ascii?Q?82rESi+U6CVlqDGFywpMIbW2f5BCAu+cKPtZ+URZ/kta4b51xsVgyVjjUaRo?=
 =?us-ascii?Q?bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c915a8ed-a257-4220-b875-08dc12ff6aa1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 23:45:39.6950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SKJes9lb82q7G2tDNzX0t1HMWgLBcKZBSEVD7aq91OEoR+3XArVQCMEgIdJB8uqDB17p+55xo8b6gN/dygMIOuynfB6V4QLjHcLmO9EIkZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4813
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

On Thu, Dec 21, 2023 at 04:15:23PM -0600, Lucas De Marchi wrote:
>On Fri, Dec 08, 2023 at 12:13:36PM -0600, Lucas De Marchi wrote:
>>On Thu, Dec 07, 2023 at 04:41:52PM +0100, Mauro Carvalho Chehab wrote:
>>>On Tue,  5 Dec 2023 14:49:26 -0800
>>>Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>>
>>>>https://patchwork.freedesktop.org/series/126786/ groups all the live
>>>>tests into a single kernel module. Use that module to run any of the
>>>>tests triggered by igt.
>>>>
>>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>---
>>>>tests/intel/xe_live_ktest.c | 15 +++++----------
>>>>1 file changed, 5 insertions(+), 10 deletions(-)
>>>>
>>>>diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c
>>>>index fe7b2e69f..c8bd68928 100644
>>>>--- a/tests/intel/xe_live_ktest.c
>>>>+++ b/tests/intel/xe_live_ktest.c
>>>>@@ -19,15 +19,10 @@
>>>> * Functionality: migrate
>>>> */
>>>>
>>>>-struct kunit_tests {
>>>>-	const char *kunit;
>>>>-	const char *name;
>>>>-};
>>>>-
>>>>-static const struct kunit_tests live_tests[] = {
>>>>-	{ "xe_bo_test",		"bo" },
>>>>-	{ "xe_dma_buf_test",	"dmabuf" },
>>>>-	{ "xe_migrate_test",	"migrate" },
>>>>+static const char *live_tests[] = {
>>>>+	"bo",
>>>>+	"dmabuf",
>>>>+	"migrate",
>>>>};
>>>>
>>>>igt_main
>>>>@@ -35,5 +30,5 @@ igt_main
>>>>	int i;
>>>>
>>>>	for (i = 0; i < ARRAY_SIZE(live_tests); i++)
>>>>-		igt_kunit(live_tests[i].kunit, live_tests[i].name, NULL);
>>>>+		igt_kunit("xe_live_test", live_tests[i], NULL);
>>>
>>>This loop will modprobe xe_live_test the times. Just do something
>>>like:
>>>
>>>	igt_kunit("xe_live_test", "live_tests", NULL);
>>
>>but there's no such "live_tests" suite and we want to run each of
>>them individually, not together.  How would you select the subtest
>>otherwise?
>
>gentle ping as I want to merge the kernel patch that is blocked on this
>one.

I did some tests today and... current situation is not very good. The
kunit module has the param filter_glob to filter the testsuite, but it's
not used at all by igt.  live_tests[i].name is more informational than
to really do any filtering.

Another issue I see is that since we have the dep xe.ko -> kunit.ko, as
soon as we load xe, kunit comes as a dependency. Since kunit's param are
read-only, we can't really change the testsuite that will run without
first remove xe. Having to reload xe multiple times doesn't seem a good
option.

Some manual tests I did here. First a kernel patch:

	diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
	index 1236b3cd2fbb..30ed9d321c19 100644
	--- a/lib/kunit/executor.c
	+++ b/lib/kunit/executor.c
	@@ -31,7 +31,7 @@ static char *filter_glob_param;
	 static char *filter_param;
	 static char *filter_action_param;

	-module_param_named(filter_glob, filter_glob_param, charp, 0400);
	+module_param_named(filter_glob, filter_glob_param, charp, 0600);
	 MODULE_PARM_DESC(filter_glob,
			"Filter which KUnit test suites/tests run at boot-time, e.g. list* or list*.*del_test");
	 module_param_named(filter, filter_param, charp, 0400);

Now we can filter the testsuite at will:

	# modprobe xe
	
Run only xe_bo tests:

	# echo -n xe_bo > /sys/modules/kunit/parameters/filter_glob
	# dmesg -C
	# modprobe xe_live_test
	# dmesg
	[ 4064.402190] KTAP version 1
	[ 4064.402195] 1..1
	[ 4064.403336]     KTAP version 1
	[ 4064.403339]     # Subtest: xe_bo
	[ 4064.403342]     # module: xe_live_test
	[ 4064.403410]     1..2
	...
	[ 4065.712622]     ok 2 xe_bo_evict_kunit
	[ 4065.712646] # xe_bo: pass:2 fail:0 skip:0 total:2
	[ 4065.712668] # Totals: pass:2 fail:0 skip:0 total:2
	[ 4065.712700] ok 1 xe_bo

Execute all live tests:

	# modprobe -r xe_live_test
	# dmesg -C
	# echo -n \* > /sys/modules/kunit/parameters/filter_glob
	# modprobe xe_live_test
	# dmesg
	[ 5010.536719] KTAP version 1
	[ 5010.536725] 1..4
	[ 5010.537618]     KTAP version 1
	[ 5010.537620]     # Subtest: xe_bo
	[ 5010.537623]     # module: xe_live_test
	...
	[ 5011.831597]     KTAP version 1
	[ 5011.831599]     # Subtest: xe_dma_buf
	[ 5011.831601]     # module: xe_live_test
	...
	[ 5011.867751]     KTAP version 1
	[ 5011.867753]     # Subtest: xe_migrate
	[ 5011.867755]     # module: xe_live_test
	...
	[ 5011.882481]     KTAP version 1
	[ 5011.882483]     # Subtest: xe_mocs
	[ 5011.882485]     # module: xe_live_test

To simplify our kunit lib, we could also rely on kunit_debugfs to list
tests.

I will prepare a patch for the kunit part in the kernel.

Lucas De Marchi

>
>Lucas De Marchi
>
>>
>>Lucas De Marchi
>>
>>>
>>>>}
>>>
>>>Regards,
>>>Mauro
