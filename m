Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BD6C4706C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 14:29:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6FEC10E052;
	Fri, 12 Jan 2024 14:29:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1EA710E052;
 Fri, 12 Jan 2024 14:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705069778; x=1736605778;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vO9UlNJVf++xFgug30TdYPiS2uyftzWlH3+JL8qyy2A=;
 b=FhNgnWQe8fnQu5wT0nXJgjxbCbWNH06CB6JdsF+fGimxhsmH2+ls9Ue3
 ZDQH3CQaqwmEqBO81qrP01ThEXxBeSxnXHQk9aOxLClp/DT3SEGt2zBvz
 CV33MC/SZXsFw3qP6nGh6MbsWfyWdmzXdQS+pAF1oapdQn0i49hBaoScz
 pTxD8PKeRBRWMQupAiRanHgKPD9GklDifhORioZhvzwAKJ3z+13qcT4wJ
 tI//7PGiZP6xHD7p5XWm6rkLYhffUW+s1GfApRNCAltdEJIaOgTH/i8Jn
 xyulCw7xwkIhLjr00bj1VUruAgNU8apNV77xhfqvNR+WrAWxiBbor6/UZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="12545574"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; d="scan'208";a="12545574"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 06:29:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="732589590"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; d="scan'208";a="732589590"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jan 2024 06:29:22 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 06:29:22 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Jan 2024 06:29:22 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Jan 2024 06:29:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IsXzJNlYITQe/68sMiq2BmJZksJHoF3s5KW/GuuKHkPOpsNcQ8prMXfJt62AJXBEnZ9arKGKxNpOc3CxONtq25slL28GPne18PzJZ+KP6zqFCknVZbaZGrQqM81/jRbZLfnYycBtzh+a1uLbIfUIOkTW0oJ9lb+5Je3C7SPr9z65K8ijeA6zX8Ukzd+ja7QQtwm/2QUeC1h1QexErL3bPKWRF5D2Ny9MC8nO72DExnaDjJdLXVz7usNU9IT/zfCSyglTlQ2x4mbmGksX07J/aMVGFtmJRI/v0WCgW7In4XbK+/zL32Rsvqw1PwazG9LiwqpOz/Ns4K2fP9EG/6sgvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUiGtCCbX02NRPsa3JmaW5BQEi/hHb2RdCl/2DU++4E=;
 b=I2pk8RCDJu3jf+mIawdOYDrZW+dZCNxEvvkPcuFiYefDREiYQdTbN3AGvWNVlG9JsX3phehEJus/XOAvOggBXY8sGqvhIaPAsqTTyodd0fPBVI2QhsvDnmJSLUGztKVYAOLaeWhV6gvN7A+Jj0bTdtotvUKD66EdbXAYgui0N2wsUrcUPPDh5C3RM10GTI6j4+C10OU8EPoffqQ8RnP9rYoO9e5vX2MaKGo2UnclsrB7u/iEZT90IBUgiipZi3loVfrDo9keTXM0r2qyUVrdGzpI5d2aYbp7wRlbMrtwaX+noP641q1sM9s6PG1fuFvNf5M8SdT1TmXVRTh2qxU26Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6661.namprd11.prod.outlook.com (2603:10b6:806:255::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Fri, 12 Jan
 2024 14:29:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7181.020; Fri, 12 Jan 2024
 14:29:19 +0000
Date: Fri, 12 Jan 2024 08:29:17 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] xe_live_ktest: Use xe_live_test kernel
 module
Message-ID: <57epajumgzrllmyufx7233yjja2c3fbs2zgfflkhcspfvwak47@h64l4uzne54h>
References: <20231205224926.2188996-1-lucas.demarchi@intel.com>
 <20231207164152.57be3d07@maurocar-mobl2>
 <3kunqgqyf7tobiwhcpvjp7rcvidrgnz2jq3qqoxjbl7kaftdq7@7hdweo57htff>
 <njwvai6cu7jwmy7lmg3vkg4jd52uq2f6es4obvdplkz43i6hpe@jqrzk4bveqqc>
 <dzacvbdditbneiu3e3fmstjmttcbne44yspumpkd6sjn56jqpk@vxu7sksbqrp6>
 <20240112093252.0a4bf850@maurocar-mobl2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240112093252.0a4bf850@maurocar-mobl2>
X-ClientProxiedBy: SJ0PR03CA0255.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6661:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a1d4a8a-9819-4d5c-973c-08dc137adcec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hExTwlI0SDlqTJZ3tFWa8CldfWAAOS04QbvD1IiLDeTMGunk5yyV2gtDRsmbGtMIBVcVr5PeY9fs1ZBYtD1hGgK7LJ5tP7ClYjwoRTa9cN/2Uy1zQsQD5xPiHXSNKiXtDKjituDYU0XxywG287qMlUj+65vEpPQEAkCHeL3jf69j3aBIfAi8233iRwjNVOykQv7eGDDe+UhggANZms+fZDt4Pk7O5SK5R2cgb5MQkGXDXwt/BNuG5RFU9GE7WDtPtMRgx9T0droruElo4TglYpzmsIAuVFPm3/sSoRkErj7tl4DeBexjw7+i1niTapvZLTddliU1kRnTRLn3i2leMRJAGTtMl6CthvsrKQyccxKs71abKnq0jOk14E/pThFo9SA13TKOemOZOPV30y3oL8fC3E9soWe+ZaTuzCB9HLC0YgXSPnNwQ8NAYLnuCCJ+8NqpFh+5IvC0h/S15i4Yn4V11mEY8auhu9BEiFDoXQosmGUyDbXZcCBX3Tx8KGPwDlKS9v3IYl6jOXAEQtzvz8kYXMhKbRf48ce0oco2vBYJiBqDAm+UjJXgNKBdD27ae3u+SxJ518C+6lrv0Ee4hA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(396003)(136003)(366004)(376002)(346002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(83380400001)(6486002)(2906002)(966005)(26005)(33716001)(5660300002)(8936002)(82960400001)(316002)(41300700001)(6916009)(4326008)(8676002)(66946007)(66556008)(9686003)(6506007)(6512007)(66476007)(38100700002)(86362001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+DEbQiGgua7bCqd7aYcI2fjJLgFasXTIVhU2zbSo/m01y4Xob8LLsCMrMJE+?=
 =?us-ascii?Q?heo0w2+yN3TVP1d5rAJh29UpRejDYD8PjulfoC0ddVqzkm/N9zp5QCT1tnh2?=
 =?us-ascii?Q?dM56ZR6jXCqtObgS5NudUsUVKb321ztF1tx7ahRfzwnwvRbClHRdAvOMJy2Q?=
 =?us-ascii?Q?UP+cgNGUBFJG0b1dm0bwSMNSOj3DhIvX7ycPvBrpRR9snW+AZ65rZYZjrTxB?=
 =?us-ascii?Q?Zwc4O2dpAZ7wQry8ddv+A1jwZ5wTBsK7W0wz9LON94+AFkRElEl4LEe6lDJ1?=
 =?us-ascii?Q?G6rN01LHGx24G+VQcK1ITihellyq5mN7dEsVaAKZvBUJDLFQJ8KDfyjDLi+s?=
 =?us-ascii?Q?H7bdc2FUFx9mxX8NLMGl53vQsMzmR/kPWAnPOyGtsEml7YthIIdTYwXijLBV?=
 =?us-ascii?Q?DddETHScQPdtXr0WeeZMqHwgoF7d3K6qHEYwdQuACw7IWBxf6khvosXSGu/k?=
 =?us-ascii?Q?kyhGfUIWNlf39h3kh2bA+JqpwOB7BUvoaPbXtrd165sI5MiTCIAHXbOwScH2?=
 =?us-ascii?Q?l3kQ2C8WIqsXBk5w9Nm9Tuyw2iIMwj7clm6C82WOZy+gMtDVt3EDNSnugYI1?=
 =?us-ascii?Q?HqCaH73QdP78jNsXxAl4nH5HoNby4PXAd8YXGqbj1b71hiw9PJ++CMzn+LZR?=
 =?us-ascii?Q?x0d0k6PLoL9dEGfzbVghmm5i+XtOCFlGDspEoYPc3d45jDMmzQslp717aO3p?=
 =?us-ascii?Q?UdHUCnM5yZ3R1VZXe/CdQLsDKz9oKsS2hCxeDo2MP+1QjQ8+kdPGDcl5pjxX?=
 =?us-ascii?Q?zPliy4O12y/yNhAPVQRK5PyoHoyVOFzsvUuHBOFJs/k/oV03CFFIev/QHrlS?=
 =?us-ascii?Q?J3ZLMxKvp4xwKHODh65qQFB2Lq6dYhWNC/X5JNIBjBL8ccwyb5m+7kcjxIeC?=
 =?us-ascii?Q?/HDte/XvMDt8rzhiOTIEecCxUElqHcW93wvb93udxFAdw2ZAT4J1oyaGnd7F?=
 =?us-ascii?Q?0tXlmzVM1mh/AprcWkBvjc/MFfgcR91N6bvrsj8g/pzqoCazKZn6yAAZjYxi?=
 =?us-ascii?Q?a6oIlFrxwFVC8Gr885mUMRvReQdPNCy/Zlgj5oJH2w4Vx+IErl4tvavJNCjA?=
 =?us-ascii?Q?xIHrhbrtEkm/llJGbEmKvaCXIJa7x5ogTkMnZ5sF+1wY7gOrxi/S4UvGYIxf?=
 =?us-ascii?Q?ySCpDc6LEQTMtLnDClBuPvQCoeGThxjX0LmFi39chhsavurXuDhPkKlYOpM5?=
 =?us-ascii?Q?5MK9J6DtuLuMVFxJi1GkvfN8HDYzXwh0qn15i9vzf7Gbx3PqOU18RckvQj+F?=
 =?us-ascii?Q?jTPn4umWZnnkkMdTTFRgqtYmC3LO+FufFVQOkKQuHoKqK1+zUK1XhRQDIvm+?=
 =?us-ascii?Q?jhqffCrLwszTQII0+wDuXC0DYUAZdFM9DkP5dSRBtOug4gqTdWauwB1dv/uW?=
 =?us-ascii?Q?m6qNjsakD3ZYKVpeliC5Fcw0Lk0fs4TT3iyUBDVObDdMyMcJFrSOoZbrIJ89?=
 =?us-ascii?Q?wbK9R6c5CZ1z8E03K5MLWIRoGlUocl3yAfDusmTS6a8AK9u36tqe3IyvnMec?=
 =?us-ascii?Q?7WN+ECo7YRgDvmdaphmlMjoNP/6NwYaFQZKmZyTypZWJeE4ZWulT2sC4QNuG?=
 =?us-ascii?Q?3k+AQrZpMlauKM3+SgRRXEzU+68kwqwttUbGhl2tE6uEjeZy/Ktb/iXGlMiB?=
 =?us-ascii?Q?hA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a1d4a8a-9819-4d5c-973c-08dc137adcec
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 14:29:19.4937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qO20HPSm96999BiIqGIMvLGNDUkG56jWi66190yYooGN1/j0UvewGMEVabKWcH24dUOoZBZmwlBI+XMlIjrHAr7vo0CDZYn2iRD1nn6z6kI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6661
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

On Fri, Jan 12, 2024 at 09:32:52AM +0100, Mauro Carvalho Chehab wrote:
>On Thu, 11 Jan 2024 17:45:37 -0600
>Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>
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
>> not used at all by igt.  live_tests[i].name is more informational than
>> to really do any filtering.
>
>Yeah, that's what I would be expecting when I commented this patch.
>Just didn't have the time yet for doing the tests. Btw, before Janusz Kernel
>patches, filter_glob were actually completely ignored with modprobe. It used
>to work only at Kernel boot time and when compiled with Kunit modules builtin.
>In practice, it was originally designed to work with kunit.py.

great improvement and this builds on top. It works with kunit as builtin
or as a module.

>
>> Another issue I see is that since we have the dep xe.ko -> kunit.ko, as
>> soon as we load xe, kunit comes as a dependency. Since kunit's param are
>> read-only, we can't really change the testsuite that will run without
>> first remove xe. Having to reload xe multiple times doesn't seem a good
>> option.
>
>The dependency between xe and kunit can be removed, but will require some
>redesign, moving all the logic calling kunit kAPI symbols out of xe.ko,
>moving them to xe_live_test & friends. This will likely require using
>some namespaced export symbol logic, to let them to call functions that
>aren't part of kAPI. Doable, but not trivial.

That's not a goal and afaik never was. As we add complexity to the tests
it's counter productive to require everything to be inside the _test.ko,
which limits things we can do. It may also come as an indirect
dependency as we share helpers with drm.

>
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
>> 			"Filter which KUnit test suites/tests run at boot-time, e.g. list* or list*.*del_test");
>> 	 module_param_named(filter, filter_param, charp, 0400);
>
>Such patch needs to be reviewed by Kunit maintainers. IMO, it only
>makes sense upstream if one could do something similar to:

already sent upstream

>
>	modprobe kunit filter_glob=none
>	modprobe -r xe_live_test
>	echo -n xe_bo > /sys/modules/kunit/parameters/filter_glob
>	<xe_bo tests executed>
>	echo -n xe_dmabuf > /sys/modules/kunit/parameters/filter_glob
>	<xe_dmabuf tests executed>

No, kunit tests execution is triggered by loading a module
(https://docs.kernel.org/dev-tools/kunit/run_manual.html

	( Once we have built our kernel (and/or modules), it is simple
	  to run the tests. If the tests are built-in, they will run
	  automatically on the kernel boot. The results will be written to
	  the kernel log (dmesg) in TAP format. )

and I kept that design. We don't really need to re-run it if we can simply
remove the *_test.ko. See https://lore.kernel.org/intel-xe/20240112001240.1710962-1-lucas.demarchi@intel.com/
and we make the _test.ko module trivial so it's more a
test trigger && check.

>
>e.g. if changing filter_glob would actually trigger tests, and, when
>kunit itself is loaded, the filter_glob parameter is set in a way that
>no tests will be executed.
>
>In practice, lib/kunit should use module_param_cb() to register a
>callback that will be used to <re->trigger the tests.

disagree as it's not how tests are normally triggered in kunit.

>> To simplify our kunit lib, we could also rely on kunit_debugfs to list
>> tests.
>
>On such case, you should document kunit_debugfs at Documentation/ABI.

debugfs is not part of ABI. What I'm saying is documented at

https://docs.kernel.org/dev-tools/kunit/running_tips.html#retrieving-per-suite-results

Lucas De Marchi
