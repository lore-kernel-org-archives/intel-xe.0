Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5106CC4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 19:42:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 138D310E65B;
	Wed, 29 Nov 2023 19:42:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 348F410E65B
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 19:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701286963; x=1732822963;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HY86/tyKPASyu3bGe0bDzpE7CLZzhwqRjKD66J3D0cQ=;
 b=D8okBEzpGwKCtCcRg4HgT4t1ajKkU6EaueLmXx7ezvWlTQ5c5l3EWd11
 /xX0epHiZj61V2TggaplcDRdv1qKdVXh+3tr6Iw7M/+rY63zAIC4JQgBB
 ONLpvink4il7yE3SmFSJlTlxN+K/OyW4WQy0AgUCFCsCq9U2Um6Ev86cY
 KL6ruWQWxd4+Tx7wWns+DG0IFSVUkllp/uEZYAUNlTu7aVyMdWhQ9X7u6
 v9SRGztlds7IJ7XKLMMk2HmjLulJxaPXWx4O31e4dJ9kbrUWd+6lb6Ufq
 szFyTdvKZG7mHjvmg4H6PQPM8JJB88ftVloDq/alupuJPVzHPywIxfO7h A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="479417253"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="479417253"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 11:42:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="769027276"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="769027276"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 11:42:42 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 11:42:41 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 11:42:41 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 11:42:41 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 11:42:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k8HshunpKFs8jUtOpi2PADx2RpI2zM5t6m9IddOKzwXB9/s9aMB82icsKNvW78rmUk/6gu2RmaDn4/z+HfEVZOJRLGPq5BjDXSiEVnStG8xGjtxsXt0U0v7gmYaHiMM4mrpKeQ/iU3QWylkCzJYKvpy3/1TTvUjEJ/vJSvc9u+p5nqwBvED9n2ZqaugW0Hx6SKq6084Z5GYGK02KsiogXKBQvpifVAifK/R5qmjR3Ap1Nfj/jTOIAMKp7RZY+T2T3U+4vz7G7WIZ4TwVsorIK0qr6xqd67dCq7vQ06BdkxndD8jHhIN0Jvmo/ja4kd4sKa19sx1hZXGvQwR3S8uPrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3+Nc20nJFhMhGbCWnCi0/p6r8DohcsBAbuhAhMQj0c=;
 b=Qr2nb/YThU8RILTSQkUc8ZigVzAY328wq9LSiXbINEjQsnghrh972kjyy835fdHwwsDx3xBiDiy2tjBUp7tVTIvdsbwyjTpf3reW5vp90jMv7/f/888XUwXsHP3dSUKwWO+MCke/sn9ZORvVFe2DXPfeHV6AQh4zNx0XPPnfiaW9aTU8OyFDsmadxzO+vQ8UDRM+6AV6NzSQ6SLuhDuVD34+YtbZ7vj3N4j8xsnVclhB93C250f4drfFiHBKYmd0zyJGQirP+1kPfE7WAVVTSPcTPNSvfYE/3p7jEBCc0QuylysYNx/qoCWpn6SbmlrRS48fGcqR7xiNjh9yRWfASQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Wed, 29 Nov
 2023 19:42:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7046.023; Wed, 29 Nov 2023
 19:42:36 +0000
Date: Wed, 29 Nov 2023 13:42:34 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <jih2brcspl52xqwdik6h2napsphn6ycmqdhtnczcbu3k3xhrwa@zrtruipup5dj>
References: <20231122203147.988021-1-lucas.demarchi@intel.com>
 <20231122203147.988021-2-lucas.demarchi@intel.com>
 <5f30eefb-c37d-48ee-8dd4-4533dde55790@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f30eefb-c37d-48ee-8dd4-4533dde55790@intel.com>
X-ClientProxiedBy: SJ0PR13CA0152.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7264:EE_
X-MS-Office365-Filtering-Correlation-Id: 996caaf3-9267-4336-89a2-08dbf11356b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CbssTsIHl1fgk8Kqil2tqcuXZA3lYTboeDc2RY/tWDCDZuEWeMHJASmNEsI2xgD4Vb4ISpJNvB+nikhzjULXHltpptd5ZNzeLRDZXMaOO3OmBiEBcNNNUSJq1cZ3eStmopPucjZVF4D2Eoy2jHebW4CUav0tgYWzLKANEr1YFLAoVS/PcPfy79URfaUaONsr1qNrhnkUKhoaX7SFfh1zVLO3gt55nmYbNZjqC6+d4sNrDMB1Ftfjcf5j2t55Kg9oHkoa68vvv//2UWSVoodXqoA6s8IaiWqwJdnrZgNaeleCo9rBLZSoVdiEbxcRZFdlLHL9+sUkcXnEDGj0T4GB9LSF+jVe9AGS0OmOZTSBlFMyinhzQtEPSIDsOhnRf/1c23QcSLGbe/zoN4cycbcUvyZ2P9xrGtm/R2fIk0wfm5A6/G+SJ+hsntCdrwAzLYq+RRdw7JYGI6Udu0DUTj3Dj/vJ1Qd+E6Z7UACIo6oS4REmsjCs2sE2MW3TbRF0mq/9d2Jgq1cLeDU6Pfl6UPpOenmgx/z/ZD9oKfNCSQzNSGi96b5oHkuDeir+ZhnBIpR25Nar8yf5jeDMuGZ5BK5DIKO8RrzE+LwARJ75bIVCw5cPDxmEg4Tq64XUe65JkI0m
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(346002)(366004)(376002)(396003)(39860400002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(478600001)(9686003)(6512007)(26005)(2906002)(83380400001)(41300700001)(6486002)(5660300002)(33716001)(6862004)(8936002)(66946007)(8676002)(6506007)(316002)(66476007)(66556008)(6636002)(4326008)(82960400001)(86362001)(38100700002)(202311291699002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?G0OyLSMpvuMHJU69KuZxPsrWTWSUdHl14kuP/Wi65yU6c15g+7ChMde59U?=
 =?iso-8859-1?Q?LH19pE3o3R3Atwgjn0AsZ+vZGUbmDjPRQJWZp9EpXxwzaq/WW7QU0pvwmt?=
 =?iso-8859-1?Q?jB/OI7Fil3q5dZ+0pdU9WoDg04N+hZaQgmOCWQ7ZUdQrBD5Cv4aZOjzUh1?=
 =?iso-8859-1?Q?hXB2X9341Wz98KNOC1WTB25p6EBeNnf3N6HXbV19zcaxgkn/mDirNdgP/y?=
 =?iso-8859-1?Q?yCnYvOSKZEf6pObOoNZnh8qUwSqF+7PelJgaVPa+717AfzrVfnH7IwLv89?=
 =?iso-8859-1?Q?AKFh/WU531YjxqATT0PGh/WhGup9m7ozQReNzmfvsDPAy7aSDPu1WY66yO?=
 =?iso-8859-1?Q?C5UtOG7JPJPwlhqdyEUDwKIxHzvcuSzx1LBdrJhIKmjLN2vGIbcUBK3mn3?=
 =?iso-8859-1?Q?+1uBRzRvUCNDlABgx/9rGTSVbqkydlorwMkWJY9PE4+ODy56O65+4t4QCy?=
 =?iso-8859-1?Q?1A9a9nCNtsSBewR6GTxRB3FC3hwa2v9bIbMZ//MJZWavanD3a8RPMh4jCM?=
 =?iso-8859-1?Q?wE1qkP4NlgCCPYp3f2BMuHt6qaFcy61lI0pcPsQE2fju58klicKoZE3Rub?=
 =?iso-8859-1?Q?zpEfSRrf3poDaoSnhRyUbRu/cT2zgTvF/G4ReU2fHqC3Hu4j3iXDZrWz8a?=
 =?iso-8859-1?Q?sAKx3D+KMQKpaOTnmQVWRd6xv6jpnBS4N2l2PBG03EeHz7YVBbbtdHV+wL?=
 =?iso-8859-1?Q?9JEl2PHN9YXgYny8u2dX+fvLK6ZmQpjmQYmt+8ztcvvSUcY+4XDiPRxxD+?=
 =?iso-8859-1?Q?pXpev0zc1ScAfhD3qhey59+cOd6lacioFYNBPuRVaVGRIL7Zwm7YrGW8pe?=
 =?iso-8859-1?Q?L9K+ZsqGDWpKq8glbufLF0VQ+041zUX74neaBbkbNSD+GMV9iMPCGEYKWv?=
 =?iso-8859-1?Q?cpLRlYY90/H68kp2W/jdfIShAYChgXVqDcGOA7erlwl4uailk0aR+xySYU?=
 =?iso-8859-1?Q?ky3KIU8KHpWNEoOByo0TPdWhVD7XNxXpEq+XYHGPQSrXTE+3ZnwbHfR9Eq?=
 =?iso-8859-1?Q?Yi8S8MA/CbLeWi+RGXru7fc0xg9eM6vJXaYhHeV2nyIRI9aYxcGP75lLdz?=
 =?iso-8859-1?Q?bO3wbsMdwahQr+YIh1pJFQEGiNXhYflK2Yv36XOpW2078TJF4ZlRC1Feg/?=
 =?iso-8859-1?Q?QwVxwO4iAeEkwQm4+0YS+8kdOhQ6d4cLB5aZwRsar+4+xbMQclN8pHJlQO?=
 =?iso-8859-1?Q?1mkD0guS1xMrPqPmp3pF0V6R7v2SspsQEgkpQ3U3hPx67Dc/DygoIgazDk?=
 =?iso-8859-1?Q?blGWRppg7p6wKXbKWLRYsNWBSdRWr2Uhg+flXb3jWFs0lkU0HO5R+r2yw+?=
 =?iso-8859-1?Q?/9zRhVz9B1VNQ43tV9899wemciwXvLKdOwy52xNQ6H7DC9b+MFN/cABp6h?=
 =?iso-8859-1?Q?xreQt4zz24SJOBOYA2+Dei/ixdM06IzBcDSKAjvOm7Pq42CUAiGUgPBPA+?=
 =?iso-8859-1?Q?1Ws/RaN+Tk2XXm9QtptFmyOG1MWNv7DutfZZN6yOgTcmHSEM1KXOdd/XPo?=
 =?iso-8859-1?Q?4VFzLFreL2EX4xx6T48FR7RncXS6J0aQwzOHMmVih5a5B6kqtzkJezULNC?=
 =?iso-8859-1?Q?KBYmY5hjy6UjW7aoDTJ0tCSIP5i+WaU17Nj4cTtsldoZBD7/pNYhJfagaU?=
 =?iso-8859-1?Q?JKvKqNxgEjP/YSx3y10Nf8/DfvuHd5yfWKlZTMBeLBgB0cd23P8cKJfA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 996caaf3-9267-4336-89a2-08dbf11356b5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 19:42:36.5976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +esPxSWzYopg3gNzKxA4YZwBwXrDsgaAOk6p3DBup0Al3QHbnB+s3Mo/oFgS+2ey5bhccSZo5I98l/qrvFGquyMUVEieKzxqgM18uPYA1yA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7264
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Group normal kunit tests in a
 single module
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

On Wed, Nov 29, 2023 at 08:29:12PM +0100, Michal Wajdeczko wrote:
>
>
>On 22.11.2023 21:31, Lucas De Marchi wrote:
>> Creating one module for each compilation unit to be tested seems
>> excessive as the number of tests increase. Group them all in a single
>> kunit test module called xe_test.ko.
>
>maybe even we don't need a separate test module ?
>
>mostly we are testing low level internals, pure kunit tests cases can be
>included by respective .c files and we can avoid need to export many
>functions/structs that could stay static.
>
>IMO separate module is more beneficial for closed-box testing, not sure
>which of our tests fits into that category

I think there's a small benefit of letting people think twice before
spreading test things throughout the codebase and then not knowing
anymore what's there just for tests...

>
>but anyway, single module is better than many, so

let's start with the transition to 1 module and if it's too cumbersome,
we can move to no extra modules in future.

>
>Acked-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>
>with one nit below
>
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
>
>nit: can't this be just named as xe_test.c ?

no, I tried that before deciding by the _mod, but that creates a
circular dep on the Makefile.


obj-$(CONFIG_DRM_XE_KUNIT_TEST) += xe_test.o
xe_test-y = xe_test.o \
	...

make[8]: Circular drivers/gpu/drm/xe/tests/xe_test.o <- drivers/gpu/drm/xe/tests/xe_test.o dependency dropped.


Lucas De Marchi

>
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
