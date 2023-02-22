Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B502BC64EC4
	for <intel-xe@archiver.kernel.org>; Wed, 22 Feb 2023 14:59:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61BF110E9E6;
	Wed, 22 Feb 2023 14:59:56 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B8E10E9E6
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Feb 2023 14:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677077994; x=1708613994;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Q1Qodg8+TrIJcqGPx8qu/lkK7qiAMKeHd+5eFuBZYpg=;
 b=CpK9ZXpaWR5RfaHW3iwzKQLhflgVkZoxw3+v3dMyR7Ng3nqdVbVqPy5O
 Az85NWiw58ugwsX35YaUz9YqnsKUpTsRcaNVJVMZiHP08vO4GGHW5+R/L
 jTWOlbfcDWpY/cJIHcvkW9LVgn/JA2vnDkprlh2UHW6xTWhv5qtL6e1si
 mkOVKf+IRXmBlKXQ4GEp20RZK1woeOfn5bGgW9a0z9A8Gq0noIk//NqD9
 hchEF8/Bcvjeq52nb5I8TcY62PHyhfBK84xnf4khNZEYPeSCy8LHZwVdt
 D7Hi7jG1kl6t7xMEkRfYbdKBO0tTRUB2IS4N78x4h/2fT5AYEt7C5Qc9N w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="321081675"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="321081675"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 06:59:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="814960886"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="814960886"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 22 Feb 2023 06:59:47 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 22 Feb 2023 06:59:46 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 22 Feb 2023 06:59:46 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 22 Feb 2023 06:59:46 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 22 Feb 2023 06:59:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gKLcStmEmPvEww21hQzpsKQ7bD5Fev1FUGYhJzXQbxy8D74opNVvFC54PiFSCVFmnQ6jgBXC2SrTLEria55MFtsEdUGmd5pjNMthmkoOtQ0h3QSOQPrGW0t1UVc9gbUQnceQmBzhAGrFD0FO3/vXlLJQa0p7WNgMYoH/bMeM8kWQ3bk3036bAAIY/0pt+Wch74ZnhOKAuufBv0wT/mXK17bYJ8EkPy5H3BUf/KjEapkNd22/Vl3XE4l/ZSx821rtjJ0dtucJElv+1OWZuzK7sjVh9hy5YUxIMVN8bp1a+2qE6OQKmwjDii0UvjWuiel8dMMQlr+yLIhNnEWGwANyFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5JNTGZOR9ah7H4FuBFdjSCua2EFhaJ2zK+Q2s3icQI=;
 b=cYYp51YkZ7VoIQ3FzjO92eXox5FWGMW/r+0S8TfbN1MM0eB+tFGV7+EsbuB9GnDpEGwHcQ74ORgzpHNwXL+rzjXJekotNPfQMYNzW5kwxnHI2dT0rYqjSkecx864xnHvLN4yN+jQlGoMcoM9zdxsE0cZzcb2hf2nlhW5RQAy3H4hdxwdmXgXJ1zDmRH9UjQqA69BvjjMDSSpLYhU4hYdXxw7g9cFaBevV7SsrvsuSmlOqQiHSX3uSzM97aBXR+pPwQUC8jQrYfaoNDpmyC8Umklu22psu2XHHa9csj87xF0xGEa2E2edfWGPo/evJsdY9xK6xL4DDzBRGs2o2XkCTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB7819.namprd11.prod.outlook.com (2603:10b6:610:125::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Wed, 22 Feb
 2023 14:59:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%6]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 14:59:44 +0000
Date: Wed, 22 Feb 2023 06:59:34 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Message-ID: <20230222145934.d5xmmfyle2iwyhnw@ldmartin-desk2.jf.intel.com>
X-Patchwork-Hint: comment
References: <20230221233348.883897-1-lucas.demarchi@intel.com>
 <20230221233348.883897-4-lucas.demarchi@intel.com>
 <CAM0jSHM8xp7M0A47AqnwdBPjxY1ZVKPp=rH+yP8NB2_2G4Z3Wg@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <CAM0jSHM8xp7M0A47AqnwdBPjxY1ZVKPp=rH+yP8NB2_2G4Z3Wg@mail.gmail.com>
X-ClientProxiedBy: CP5P284CA0096.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:92::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: b5efcea3-dcf5-479f-4e4d-08db14e56e75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /NyuSE6gH+FwLUCUWpQFqKOemrifMlIREsr5aYq7DN4wPnL21oEcBH5Jfw41QFHMWYE7gBtNKyWxk40DOEytxm2hwy5GHqqsyQCBoAdSovhw/ZuKMvQZp/sVQzSoOr/5yt2KXgD7QIz/ezPqXfYgpf6hBzTGjujHFYLfj/qQ+yaRlh/l6qA47e/WqMxdeKgWCEhazGRFXMBKLe/OBkPpuSOz3HDDyQSp0f+554IPjtZZAE0vRSjgXCf9RiZTDIFQzPbGh7D/4ym3uFSBNJPU4A0hLbjjcozildAKx4lkl33TanbXgso+pHGy4il7P7LHvuzYy7MG3VyhpZo0oM+GMSi1uuFtM/0eRPuQa780cQzGoWonM4TK99iH3BWVH8KBobiw2TritQqHxrrfDVUhJbIPnNc9uH1OqDaOWcN5sx7ThugbuT0QTFEHjTvCS5+Z6cWzSQRBuCsrEFaG/Mq1DD/yKP/yuYYc4wFyMe67BtN7gMf5e3FB/jGIhBv6a4Ug0xgSfwEFD8jTlbuKvKqTKXh4uUB62y0W4V//QSFWFY1jL4DevwDFppNlRgBNHKKyeAKpf5hCvYdxLoXhFpid8Ytv2K5iLMUgyXBORZ+uF+rskPF+aqr7kMVZQZe7cxUG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(376002)(346002)(396003)(39860400002)(366004)(451199018)(8936002)(5660300002)(4326008)(41300700001)(38100700002)(82960400001)(2906002)(6916009)(478600001)(966005)(6486002)(186003)(26005)(6512007)(86362001)(6666004)(1076003)(6506007)(83380400001)(316002)(66476007)(66946007)(66556008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sxwf7zWIy+x+d+Y4cdjWXiOWlcmaijYdnarTwl7sHztJWnHB9ljb+Pjymni8?=
 =?us-ascii?Q?KCyTtaKLeVz6do6NZAczCscbYaiA0TH4k2SWxcI2hVKxQOKvCSLlutqIRmUa?=
 =?us-ascii?Q?PkXBLkCeSITijDU0OkZ93/hAG3yQvb7t3lQrKCyGMSTahvyrQhxNL57jUo6b?=
 =?us-ascii?Q?NCTn8woKQFx8g/sdz2awCtrcAFq+cZcHzYbxvQE5BohC8DET7/GipBDBjmfE?=
 =?us-ascii?Q?N3y75gsggiSNsmBVCCcLyK2cofPIY8HY9OinmqXIi1TYwLPGxOL8Kfwnlm4j?=
 =?us-ascii?Q?vu55liyfEqKu+yn1L2C1j1Mf7wdUdTi0TTk6BA0FMMt7T3j26qp6xcc0+4xg?=
 =?us-ascii?Q?YIsnCbYpJ4gywUCh3sEY/om0ojFSpX0ZO3LKgoGXblmb8Mh1S4RjlHErYx72?=
 =?us-ascii?Q?BGthkD8JDgkPbKgxnrV7zfnuwCenm//EMb0WV5Ps1SRYkhNUed70vLy+9PMJ?=
 =?us-ascii?Q?V4fjbE9LjRnzZuyY5tiSrKkV0WIDss0T7/ENWY9Try4EMiGIXXeDzS3IXrZ9?=
 =?us-ascii?Q?DboPIiPEGT6M8srvo8L4XkxcK8QSximk73k705NcN8AZkJtSo8xcabiQWvww?=
 =?us-ascii?Q?VcEPt8TpwJcoHNRWQAZ3Ai3OWBHd7GzisUpWjZLY/gt/9yCIUlW7DauZiQyw?=
 =?us-ascii?Q?F3FOBe66x84qmlVh9hG7t4H4oEzp74gEBLm9TNSU+c0bu73a6+xCbmqzvOM/?=
 =?us-ascii?Q?836NPHnubk0sQ8pUK5IHrSI02joNIsi0OeENMcXCisTXdrDFB1qxi3EBxbDO?=
 =?us-ascii?Q?BR2jG8xaOV63iq8D9tNk6oge+JXOPqzF1QIryi6RJeR88Eo5t7JbqSpMltfa?=
 =?us-ascii?Q?4bCEnZQnnZLAt7tJV4DjOwTrr/ldmWwvsLMkTdayi0vX9ls7OfP0Ds94qkxz?=
 =?us-ascii?Q?Uh4jrrHvyb+9hGGvo7hmbA1xSaYNF3l/NG1bCmr6MfTU6cd74DD6PWDOCkO3?=
 =?us-ascii?Q?hdagEb2jQ+2OlWhnEVYMoL6P4S7OEEMtdEKa+8W0Ng1xPFUEtrhtAVG4vILC?=
 =?us-ascii?Q?d8OcHMzaXcJgvyyDZ0vQigW/1EKOMAoHgsmjfyVQ20ZtcjaSyqpkUyeVs2x5?=
 =?us-ascii?Q?/AEmh9D7EgqvqojvCqpbjN4COge0wrsSY45O/XMwyTwBDMQpoHcjha3BjgPu?=
 =?us-ascii?Q?5sWzGF64MAL0FPj9IAwjxlV4ZNneAHW/kWPVmDt+IM+hAkpCzHYk+fobiu1n?=
 =?us-ascii?Q?jdzvnix2/4uioQghOtLxdtRnWhG8C0/WE2ztqSl0aNrL0f91Lvq4MkrfuQEj?=
 =?us-ascii?Q?qbRGdbQRD3D4O5eCMisfwb3ep0GG2UlojE9d4uMhNtNjCyu2wKSx4skoll84?=
 =?us-ascii?Q?TCNd1GMlOynQnLWjcRJasqVc1CIrXTBk3NG4dyC7MIayUH61D5mZAlv0846W?=
 =?us-ascii?Q?NwMBRCFusU3AibeJ8a1Q6RpIWdE6oFSVLG0wjAQ3XYHtiWvJQPfHXrazt6qX?=
 =?us-ascii?Q?DP62T1g7epHMbImImhU24tIT0Ov5Lz80fIpMeExnycTefnC82KhgUsk35Jco?=
 =?us-ascii?Q?9byli5sOGsNhYcnuFf4hIEGWUSkpvgPHHCA7rVFxs3ZCEetK8u2M0Yyynums?=
 =?us-ascii?Q?LBiXDvVmChFxUlMtM1jWM94jgLi/LhA4DxmMQfYafjFBWRIkjVWRfU7xzHlW?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5efcea3-dcf5-479f-4e4d-08db14e56e75
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 14:59:44.1460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J/qdwyDk0aTN0/tZOmVKv7eIssKWK6tlk5uNGyGpFPJwuSi0fiqH02UYMSMnonmYK3H649N4BwijIFXuk1QY+IsO2J1lKQxKMez+PBHvk6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7819
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/6] drm/xe: Fix kunit integration due to
 missing prototypes
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

On Wed, Feb 22, 2023 at 10:02:08AM +0000, Matthew Auld wrote:
>On Tue, 21 Feb 2023 at 23:34, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>
>> In order to avoid  -Werror=missing-prototypes, add the prototypes and
>> move the functions to the end of the file, surrounded by
>> `#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)`.
>
>Is everything under tests/ not excluded from compilation when !XE_KUNIT_TEST?

yes, except the ifdef is not in tests/. Example:
drivers/gpu/drm/xe/tests/xe_bo.c

The way the kunit tests in xe are split is: each .o in tests/ will
create a separate module. In order to test a function like we are
doing, the function needs to be declared !static and exported so the
other module can call it.

There are other possible ways to test functions on a different
compilation unit: https://kunit.dev/third_party/kernel/docs/tips.html?highlight=static%20function#testing-static-functions
I'm not so familiar with kunit yet to be able to say which one
is better for our case, so I just went with the easy fix.

+Thomas

Lucas De Marchi

>
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/tests/xe_bo.c      | 54 +++++++++++++++------------
>>  drivers/gpu/drm/xe/tests/xe_dma_buf.c |  2 +
>>  drivers/gpu/drm/xe/tests/xe_migrate.c |  6 +++
>>  3 files changed, 39 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
>> index 87ac21cc8ca9..2c94ddaacda6 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
>> @@ -141,29 +141,6 @@ static void ccs_test_run_gt(struct xe_device *xe, struct xe_gt *gt,
>>         xe_bo_put(bo);
>>  }
>>
>> -static int ccs_test_run_device(struct xe_device *xe)
>> -{
>> -       struct kunit *test = xe_cur_kunit();
>> -       struct xe_gt *gt;
>> -       int id;
>> -
>> -       if (!xe_device_has_flat_ccs(xe)) {
>> -               kunit_info(test, "Skipping non-flat-ccs device.\n");
>> -               return 0;
>> -       }
>> -
>> -       for_each_gt(gt, xe, id)
>> -               ccs_test_run_gt(xe, gt, test);
>> -
>> -       return 0;
>> -}
>> -
>> -void xe_ccs_migrate_kunit(struct kunit *test)
>> -{
>> -       xe_call_for_each_device(ccs_test_run_device);
>> -}
>> -EXPORT_SYMBOL(xe_ccs_migrate_kunit);
>> -
>>  static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kunit *test)
>>  {
>>         struct xe_bo *bo, *external;
>> @@ -278,6 +255,8 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
>>         return 0;
>>  }
>>
>> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>> +
>>  static int evict_test_run_device(struct xe_device *xe)
>>  {
>>         struct kunit *test = xe_cur_kunit();
>> @@ -296,8 +275,37 @@ static int evict_test_run_device(struct xe_device *xe)
>>         return 0;
>>  }
>>
>> +void xe_bo_evict_kunit(struct kunit *test);
>> +
>>  void xe_bo_evict_kunit(struct kunit *test)
>>  {
>>         xe_call_for_each_device(evict_test_run_device);
>>  }
>>  EXPORT_SYMBOL(xe_bo_evict_kunit);
>> +
>> +static int ccs_test_run_device(struct xe_device *xe)
>> +{
>> +       struct kunit *test = xe_cur_kunit();
>> +       struct xe_gt *gt;
>> +       int id;
>> +
>> +       if (!xe_device_has_flat_ccs(xe)) {
>> +               kunit_info(test, "Skipping non-flat-ccs device.\n");
>> +               return 0;
>> +       }
>> +
>> +       for_each_gt(gt, xe, id)
>> +               ccs_test_run_gt(xe, gt, test);
>> +
>> +       return 0;
>> +}
>> +
>> +void xe_ccs_migrate_kunit(struct kunit *test);
>> +
>> +void xe_ccs_migrate_kunit(struct kunit *test)
>> +{
>> +       xe_call_for_each_device(ccs_test_run_device);
>> +}
>> +EXPORT_SYMBOL(xe_ccs_migrate_kunit);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
>> index 615d22e3f731..d8ad135d0e04 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
>> @@ -252,6 +252,8 @@ static int dma_buf_run_device(struct xe_device *xe)
>>         return 0;
>>  }
>>
>> +void xe_dma_buf_kunit(struct kunit *test);
>> +
>>  void xe_dma_buf_kunit(struct kunit *test)
>>  {
>>         xe_call_for_each_device(dma_buf_run_device);
>> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
>> index 03a60d5b42f1..7be0c2543916 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
>> @@ -352,6 +352,8 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
>>         xe_bo_vunmap(m->pt_bo);
>>  }
>>
>> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>> +
>>  static int migrate_test_run_device(struct xe_device *xe)
>>  {
>>         struct kunit *test = xe_cur_kunit();
>> @@ -371,8 +373,12 @@ static int migrate_test_run_device(struct xe_device *xe)
>>         return 0;
>>  }
>>
>> +void xe_migrate_sanity_kunit(struct kunit *test);
>> +
>>  void xe_migrate_sanity_kunit(struct kunit *test)
>>  {
>>         xe_call_for_each_device(migrate_test_run_device);
>>  }
>>  EXPORT_SYMBOL(xe_migrate_sanity_kunit);
>> +
>> +#endif
>> --
>> 2.39.0
>>
