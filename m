Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE39C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 17:58:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0560A10E1D9;
	Fri,  8 Dec 2023 17:58:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF68310E1D9
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 17:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702058305; x=1733594305;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FS5i3Z81cIjL7srsYU2f9psp4Jf70cpinkKLAdbVfNA=;
 b=ZV5bpjwwVBoKjZGxzBeH6Kh6mM2h9cc++c+dCp6y8UCbVeV1RrCplWLP
 zfYGYg8qwbUImyuKFuTjVf+qW0wHuT0AyDJZd/xbCP0OwLUbVjAj3Nc4M
 5F+MTealkYv66CMwEC2fhek/pgEz5qJxf9p7mIieaVTI1y78/SWp2GgZq
 G0MeK2OPVKeey0AtNiDxH68TE6ruHiII44FVn7S2hKr9mwLhLW0QYpjRx
 p2fU9e3D0NrOcEdIkKM46w+yAPcs/OcBCkEooz2m3+MHlYdCKwTnSekEA
 vMd1o/OnzMnW2/pxsG1W0r/GZLWLeQqBLDjOM8HM0gpwyGCNP65QxLUhM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="425574104"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="425574104"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 09:58:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="801179201"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="801179201"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Dec 2023 09:58:19 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 09:58:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 09:58:19 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Dec 2023 09:58:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dVeBGcRBonr0wJ0jYPB+GD1zH3Qoh048l9wveldr6YQlYrxa2Gz2rR++wwLEkL6ltbSEUJdwnHSrdenKlVULAAzBwVeBxlyMkE8fhQYpJ2fohJt3Jt2/w0QVJr0ldUnHfUUeREsKg3HDoPXsRr0YdzfDjft55l3QSROImbIQgmKRVecJr23Ghq0R1X/DuMiZLDPGH90wFDdMiEaZS0XirC63QeEYgzfuwsODqTfS97IiJMhRt35XfXzecnaves1nAABMJO9YmmRXPBMly31ptLuIkJefZpVnKiVVyJO4d3WXkDngaDJYMtkWmcRXMw07+Rns6UfZUEYpf7g0JH1iEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvTVTgHeacHFvgqGx4YzSwnXmLtUtp4JFWfDkBq6PO4=;
 b=ntb4yS03faSyCYg8KGtQKyas48txoHREXoXO3egJWlO06RvROFOrmoWkEDPHpexAvw4IknnAWpO7pZdz4uvLq5Ypgd7bjpJvMUg2Aeatb97HsuDNLYlB5kcFK3m47sawXYWgYUeseKbeOsflayqyG4KIT3A4eQEfuuWUEMVwj/xjh7TmU/PKtArGcyzIcTu8HXhNr2qH+fZH9N8wGAHlQYdUUrSlRHskEyMTZKYl2jpjBCo9pWm3ONRMf/W2RNfnGSzSi5pznNBqIocp+7vJzfiW03V4J7uqHRUXAK7dWE45hvVP9IYTq3hSf/SLahUePPgUqOlRcfFq4l5IkbloXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB6742.namprd11.prod.outlook.com (2603:10b6:a03:47b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 17:58:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7068.028; Fri, 8 Dec 2023
 17:58:16 +0000
Date: Fri, 8 Dec 2023 11:58:14 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Group normal kunit tests in a
 single module
Message-ID: <xo7nktc3nv4rrwdql2ad3d5fzi5q4fci4dwzeqr3xr2ltyv64y@4m7mpijc65m6>
References: <20231122203147.988021-1-lucas.demarchi@intel.com>
 <20231122203147.988021-2-lucas.demarchi@intel.com>
 <20231207171110.67073e33@maurocar-mobl2>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231207171110.67073e33@maurocar-mobl2>
X-ClientProxiedBy: SJ0PR03CA0264.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB6742:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a156062-4474-4d71-85ed-08dbf817410c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 74uOWp9nNf20mtla223Kf0Hd2vX9EVl10oTLcy2UKoSATi+FFFGpoK+zm22I5dYA9TDDGBifP/Ogf7uWopgeO9LS4MHkXhqS6aswrOKvOtAhf201mlW6EIth9wYxDwCM0sMuH42rk54QZy8++/7W9wTFKW91GRjGWIQNgPw5q8w34etaEwy7ihw2jCZ/uN+nISa9fGceBgBvFCv3o+jXVE3atbzE/hkjqFu9pHVa2VSSf1JIYd/Zsx2DJu+aKxZvaOHL9MJCW7LoxxZ3oH7W6vn8128gpcLWyDs5Pvw1LDDcMwTwjr9Yaoy+g7Bn99ofUFY/OFI33al3+k4eX/EtQiIVG+57uDdn9/1xpvb87rvzOnFlbQT548XqqiPL5bIVAtHtV+WSY3YH7BChfsf9kJqAi+E7omqeypTuBO6rXP1Z3U0755/FZ7v2BDaMOfjUhtsyqyrKDibLdknO6vVTTMRxVeQv/AoCVEY+O4UjZ7Kfvts+MQ6RkFOoUCD4Jpzp8xdG04TRdEmm9FeadOrK3oDSmMGeNVMDW+XyOo+NO0QfA0idLAxAcInsbjWlv6lc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(136003)(396003)(376002)(366004)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(6916009)(316002)(66556008)(66946007)(66476007)(478600001)(6486002)(33716001)(5660300002)(41300700001)(2906002)(86362001)(4326008)(8676002)(8936002)(26005)(83380400001)(82960400001)(38100700002)(6512007)(9686003)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?uyvCxRxAGoY9Lsa01Q/JxYUMWTQPJGmOlrB/D+hbkGSxbnZx9f5AbkiPnk?=
 =?iso-8859-1?Q?1Q1apy28p62Fg+qE87nysEggI459NhnwujNRqaCepCcMgLwriwDHADxk64?=
 =?iso-8859-1?Q?8qU+agXSUeOnSR7KZwflEPq2FQCoj0rcpw1DVqh5nABRvET4u0NATVM+Mu?=
 =?iso-8859-1?Q?VOmDtBmWG8yx1MeMSTSkApsHkJobsd68lKQA+VFz6Xvv7sDRQyLVfC8wBe?=
 =?iso-8859-1?Q?TZOXiks1OFdUEFqOH7ws3xq6M9BA+9epWdCPnhtbgHAT+LXECJ3gnrFX0Q?=
 =?iso-8859-1?Q?2ChOdfvDqIZEqLvSlayJR9mMYUvNi9VR6dfWOprxZTSSsrsjjoCeuzwAhU?=
 =?iso-8859-1?Q?8eWv3wZVyWXcTh1PNXps7FmRlnmtqJHs1ilmSAsjXK5HCRY2sPWjRB8boY?=
 =?iso-8859-1?Q?5FEQ+aknsHLH6M19zwTq+Zu7l6lq+QyDfXk6tEmIpB70zeDvyJ5s73MgVw?=
 =?iso-8859-1?Q?Fuggag9ENVxehV1cd64czh3IscsU+4CRrnU4Ix2WofA+R4Zq94Xdkk5nSH?=
 =?iso-8859-1?Q?kEkJdP3O6WIhpUto4vtrAm3ZKabl5iAtbcD9tDNZI9UMHkgzVk0YGLXyF1?=
 =?iso-8859-1?Q?XDKWqDONCBVASTYye/X+YEdMKBj70nCOM1n1qYRMN4A5VmwSxvbadPV8K3?=
 =?iso-8859-1?Q?aIntmVQAGqxKez3RJbTPL7htEhRfHAJc0Ffjk04UIrlPvuoVvF9AV9dVr8?=
 =?iso-8859-1?Q?6Nxm/e1LuFG9WoXD9dXF1KuKz19+yD41qNSEo9ptQwOBWiPDNOJcUxG30b?=
 =?iso-8859-1?Q?x3fMQPDpaufp9mR/mnlDSvA0rmQ8A0xlZVHwdpFXCIoy598NXfqW75CpHK?=
 =?iso-8859-1?Q?3R3Eh3n3tyaq99MDTgKP/+gRdepgIn7Bv6dkRl6dFqCA6DVQLd8h0G6oXb?=
 =?iso-8859-1?Q?2yXN/BUYZuCW+97hgH9/08zId0W+qIFVPrkX6H9qDmrctPpamcMwZecywS?=
 =?iso-8859-1?Q?qtLQfSQ6nHp2hg1lEIF17K9uhmdMk+lCDk38OiMJ4HT4k+m907/ZroIHAT?=
 =?iso-8859-1?Q?kxujsiUwfJaL3+VXT2ZM5hCp8NvYnl2HUvhBt9bLtbqrMQqvU08jRfzO2y?=
 =?iso-8859-1?Q?eX0dH1BctXhvK58gOiViYk9UoxPxBuavbns6qqW+fnHuztb89P2bjl6CH4?=
 =?iso-8859-1?Q?tyJO9GPBERbVPPHied+MPuf8kuZkaH2h2O787g5tW57SPMg5hhbw7zHAXp?=
 =?iso-8859-1?Q?kBPWzejow4baoi+3GxcnBKkDLbeDeOpc4mJFg8JOiobE76vGJLKeYNHRtp?=
 =?iso-8859-1?Q?rYatwRLmFfd6kKuNm+nOAwPhhynJOPyv9KkJ1+jV3NPXOzH6nYAyk+z6bt?=
 =?iso-8859-1?Q?AVkXRYe4bQN/iBmZZ9Wrzj+tzlYkKxJJHvRtEHABif3gcf1/yqOY83mUQG?=
 =?iso-8859-1?Q?R0iRC/+75VvCVFGxijbinl+GVivEgsTCf8zc4VgRUd/GZ8Y1lOW6x0qTX/?=
 =?iso-8859-1?Q?Vs7F8BbUUjDcu6Livqonu1Q95KD/PWrKfFSG0m3JZWYs1a7ebs2jj68PjC?=
 =?iso-8859-1?Q?nc8IEWfAPtxy3o5fChF+j/j4Bx/axUYfz6YlLfgQxqYXXLKYfLW4ocdB/E?=
 =?iso-8859-1?Q?zCod4MzeqytuYhq4SCeRWpdK4PjXkXqNABcmvT37PS7cW29oCYAwJwluas?=
 =?iso-8859-1?Q?E8nvIfv6u6QjX7gkqbkKLMmo0sE6o1R43QwlNIJz/neIAsA/EhOatGeA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a156062-4474-4d71-85ed-08dbf817410c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 17:58:16.3791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zWnMYtd0yubIBZnJiO43QUFYccus6swVFqTqaORTPnwJLtnlzffEr5fCLzZzaLpaxhVxle6a0AVCVKUJE9Dqt16g3slTTFa5U4yZXGfVbiI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6742
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 05:11:10PM +0100, Mauro Carvalho Chehab wrote:
>On Wed, 22 Nov 2023 12:31:46 -0800
>Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>
>> Creating one module for each compilation unit to be tested seems
>> excessive as the number of tests increase. Group them all in a single
>> kunit test module called xe_test.ko.
>>
>> The tests requiring the physical device, aka "live" tests, are still
>> kept in separate modules since they are normally triggered via igt,
>> and not via kunit.py. After igt is converted, those can be merged in
>> a single module as well.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/tests/Makefile      |  7 ++++++-
>>  drivers/gpu/drm/xe/tests/xe_pci_test.c |  5 -----
>>  drivers/gpu/drm/xe/tests/xe_rtp_test.c |  5 -----
>>  drivers/gpu/drm/xe/tests/xe_test_mod.c | 10 ++++++++++
>>  drivers/gpu/drm/xe/tests/xe_wa_test.c  |  5 -----
>>  5 files changed, 16 insertions(+), 16 deletions(-)
>>  create mode 100644 drivers/gpu/drm/xe/tests/xe_test_mod.c
>>
>> diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests/Makefile
>> index 39d8a0892274..9d1d88af8b2f 100644
>> --- a/drivers/gpu/drm/xe/tests/Makefile
>> +++ b/drivers/gpu/drm/xe/tests/Makefile
>> @@ -1,10 +1,15 @@
>>  # SPDX-License-Identifier: GPL-2.0
>>
>> +# "live" kunit tests
>>  obj-$(CONFIG_DRM_XE_KUNIT_TEST) += \
>>  	xe_bo_test.o \
>>  	xe_dma_buf_test.o \
>>  	xe_migrate_test.o \
>> -	xe_mocs_test.o \
>> +	xe_mocs_test.o
>> +
>> +# Normal kunit tests
>> +obj-$(CONFIG_DRM_XE_KUNIT_TEST) += xe_test.o
>> +xe_test-y = xe_test_mod.o \
>>  	xe_pci_test.o \
>>  	xe_rtp_test.o \
>>  	xe_wa_test.o
>> diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.c b/drivers/gpu/drm/xe/tests/xe_pci_test.c
>> index daf652517608..59e29a148478 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_pci_test.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_pci_test.c
>> @@ -67,8 +67,3 @@ static struct kunit_suite xe_pci_test_suite = {
>>  };
>>
>>  kunit_test_suite(xe_pci_test_suite);
>> -
>> -MODULE_AUTHOR("Intel Corporation");
>> -MODULE_LICENSE("GPL");
>> -MODULE_DESCRIPTION("xe_pci kunit test");
>> -MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
>> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>> index a1d204133cc1..83b0ba097a3e 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>> @@ -310,8 +310,3 @@ static struct kunit_suite xe_rtp_test_suite = {
>>  };
>>
>>  kunit_test_suite(xe_rtp_test_suite);
>> -
>> -MODULE_AUTHOR("Intel Corporation");
>> -MODULE_LICENSE("GPL");
>> -MODULE_DESCRIPTION("xe_rtp kunit test");
>> -MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
>> diff --git a/drivers/gpu/drm/xe/tests/xe_test_mod.c b/drivers/gpu/drm/xe/tests/xe_test_mod.c
>> new file mode 100644
>> index 000000000000..875f3e6f965e
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/tests/xe_test_mod.c
>> @@ -0,0 +1,10 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +#include <linux/module.h>
>> +
>> +MODULE_AUTHOR("Intel Corporation");
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("xe kunit tests");
>> +MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
>> diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
>> index 01ea974591ea..4eb8e1e8a76c 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
>> @@ -135,8 +135,3 @@ static struct kunit_suite xe_rtp_test_suite = {
>>  };
>>
>>  kunit_test_suite(xe_rtp_test_suite);
>> -
>> -MODULE_AUTHOR("Intel Corporation");
>> -MODULE_LICENSE("GPL");
>> -MODULE_DESCRIPTION("xe_wa kunit test");
>> -MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
>
>AFAIKT, if you want to have multiple test groups at the same file,
>you should use, instead, a different macro, pointing to all
>test suites that will belong to the module, e. g.:
>
>kunit_test_suites(
>	&xe_pci_test_suite,
>	...
>	&xe_rtp_test_suite);

having multiple kunit_test_suite should be fine as it will only add the
symbol to a special section, .kunit_test_suites, and when the objects are
linked together there will be one .kunit_test_suites section with all of
them. We'd need to force using  kunit_test_suites() if we needed to
enforce the ordering (although it's still up to the linker if it will be
top to bottom or bottom to top)

I think kunit_test_suites is useful if the suites are on the same
compilation unit, but we don't really need to export the symbols just to
group them in a single place.

>
>Regards,
>Mauro
>
