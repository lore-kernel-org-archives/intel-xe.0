Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C239C61DA4
	for <intel-xe@archiver.kernel.org>; Wed, 22 Feb 2023 17:42:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D562710E1DC;
	Wed, 22 Feb 2023 17:42:24 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC8410E1DC
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Feb 2023 17:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677087743; x=1708623743;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IXuOeIRRvGnr1ZoiH1xjZ3bHMPxysmq5H/V+eMgwzXU=;
 b=VSkbSxozC4ACbe+pQcDaLeShyyRjou5OSVLP5s8ap34wcJEPbDJQGGbB
 N1QbFCTkCq+Or89V+NNmvyg4/+8WFKOF6Bo3oV5kgJYCXmEiYyIdzFQIS
 p1Tfoq+ucLuKJTijDxpCCMWfBvvmdoQ+veqF9qzrYyQ2IrDxVo94wxx7g
 jelCpl0pX2Bc0AAz4fAazvj7zChSMuYfxLqlBRNvjouYXD6wjxK+8iufj
 ADqrj2wqLzZbbnRKNAjM03fX2BFxea9VBiVGTBE/p6nJKseOEdzm3GRGo
 vLEs3rwOHYVbhtrMEUjGzYURov8m3usKdrO9G1nu+Ddq5T8YSOAPxcG8Z w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="334353193"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="334353193"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 09:42:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="846217789"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="846217789"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 22 Feb 2023 09:42:22 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 22 Feb 2023 09:42:21 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 22 Feb 2023 09:42:21 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 22 Feb 2023 09:42:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N8z85L4WfZlZrm9BUeQvf2HX5Zchhh+qVSbmosEEhVlKvUAmKLeI6SaYTxZhHT+rMS4vQ+eh1KJfyjGbDmQuqE7CbK5l3ClGPzm/b8Rgx0FdDDSMeIpB3FY5Z7w8XLsTTz5ZHKlf6pkf9oebDYbeEs9AyqqsFLkplTp+U0PbgIIdrLre4ObB0+gxlvmgruvSbAh/HTRo/zIwRlBcjphiWlmdQLolCOL1L5idZQI2OaVHYrSiTakTel/T2xJybRGFHkZVU2pVIGNH9xkwvJroOyo4bHCtc1H0GMeW9f4ItW+EmyeUS9r9fz3teipd4xgWuyx62AfwMn0oOIBJzoDIaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDnNq32S1G2ABcfbR+w/T1kvgUWw96oEZZYGSM0KW9k=;
 b=a+QYeDd07REX+7kLOWL4nWbcW1/4a0wPaKP5nscKVrvN8ip5A56YIiP8kgJVFyw4+ZXfoJcqomGOydDWC914uiu+516SG8b6r3l/hvgWSPBCXn0n0QH7ll6HPgcoxfS4E+nSy8JWiLNE5ZSoEO6Qa+fWk4sTlPhlDOXCyH/cfmMeT0htJ/8Po5rRPlHK2bltPEp9Ey35ZIEpfBQlHuexS01L814f3RzwhHJsnoPdEQiAh7IMr2svDchz3+le3XKnvTd/ZZCxFOc0pvXdXt3CR9ii9YoUzZo6+3xjiInd6sefyrQk1pZQ+IvD0HZUk3aEl407lSpRReIdCc60IMduqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6692.namprd11.prod.outlook.com (2603:10b6:303:20e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Wed, 22 Feb
 2023 17:42:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%6]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 17:42:19 +0000
Date: Wed, 22 Feb 2023 09:42:15 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Message-ID: <20230222174215.5ccspqelplth2hhf@ldmartin-desk2.jf.intel.com>
X-Patchwork-Hint: comment
References: <20230221233348.883897-1-lucas.demarchi@intel.com>
 <20230221233348.883897-4-lucas.demarchi@intel.com>
 <CAM0jSHM8xp7M0A47AqnwdBPjxY1ZVKPp=rH+yP8NB2_2G4Z3Wg@mail.gmail.com>
 <20230222145934.d5xmmfyle2iwyhnw@ldmartin-desk2.jf.intel.com>
 <CAM0jSHOkr+d=Zy8MuKoLMCA8sAZCP1JMjFLR0mEtMvN4R--F-g@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <CAM0jSHOkr+d=Zy8MuKoLMCA8sAZCP1JMjFLR0mEtMvN4R--F-g@mail.gmail.com>
X-ClientProxiedBy: SJ0PR03CA0123.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6692:EE_
X-MS-Office365-Filtering-Correlation-Id: 523a0ec7-d513-4853-8622-08db14fc251c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kkIDHqM/60Ekd1Z1GZl6Db4xg5k6Hx/GHEmUixPMXmnu0XDmyjlzKA/hg/CNchWDnr4W0+YrCV1+Zq2KktxawGfqXyKYkklvFiFI5MO5wO0YDmSXSGB7aB/4208TB3CBOLbJtO7QkJrveKGkQQgTieJAH/KpjGQGUdVZqBRmIG95CJQmrRB08zZWe8Rx5IOPWKtt8brVgrEmeAzhs3n7MsB+0MefSfWnNlNZO2jbYkhAgAwINcAEzdWsDoLrXBoWh6mQLtCd+s+Z0PH1L8ahcVUSJiY0CVaSsKbgeVP8OWNiF6PpfoW3bYB22s9d/pX9a+QLMEUFTBmVX1p5OXqqH7STaB8GztqjV5ilz1ECxTjqzMDvbhttQVJQF2nNauLpoTljIg6zbZgHfSzkThVJy9wTXBhJwjYYv4cSlWybCZm8QUnl+WBERtRg46aUWf6o8widRUjOzR4sVXmE4j730nustkfatLb6MNdy0IOOd4pLpVCZmC2h5BOCdqEJP3XpmCQsn/uwD7TWqtDleYdoP+GywwvJT3Bt+7f3BIwNbe+WAUErILjEVd6pXDDZA8RqnS9EE8vby5vzLx0TT+brPlcNn1oMrx8O4XmNgFW6MZqM1M5BCOpachbvEcR4Y983
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(346002)(136003)(366004)(39860400002)(376002)(451199018)(38100700002)(82960400001)(83380400001)(8936002)(86362001)(2906002)(41300700001)(5660300002)(26005)(186003)(6512007)(316002)(6666004)(1076003)(6506007)(4326008)(66946007)(66556008)(6916009)(966005)(6486002)(8676002)(66476007)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8cCQRqPWWu0pvKgldHth325w7vXtj33/JQztJKBiJcevTacqCXOakNFDwMeY?=
 =?us-ascii?Q?iDgiVWSATCqsxG1kmy17zAJCoQnIZxNMbzqF8wtX546pUC5CZcLpMuAzmsGw?=
 =?us-ascii?Q?bF0bGey4WXnz8FRdgmQXRxKMIYXMHpoLKfcQ5N6T+UCW5fuEF5Lhyi7gQw63?=
 =?us-ascii?Q?mLM5hsgKOhd7Z2FVwcSd75KYnCt4V8qDoCSqjVgcEMhDsCdHsOs9ZezHQ7tL?=
 =?us-ascii?Q?QkNZ/H6nJJnlXtkTnlE6ksYp3xDwNrWTh4q8V51YS8vFQzoBH62yJcTpr3JW?=
 =?us-ascii?Q?i3fFlG0WeDjwWN9543JF29vZQ0ws5fITaARU4n6+Y3jixqdrDymkWit1kPrZ?=
 =?us-ascii?Q?9QAfCk/dlWzesExU9JTT7Lj2Qbw1a4zrz41sm+uspqMmGujRDbevg2v9F9Do?=
 =?us-ascii?Q?BMS0U3mwmHk95UP+PsOsOopZ2nQlCvfr80pb6gQ3aXWlhK7cnrys8ux0CHre?=
 =?us-ascii?Q?vJ1U9hpckqzaf9LMvl0415lgEWizUBB/JsxdpdgHjck+1O12qjAzYT/Kr4kp?=
 =?us-ascii?Q?HB+mPLE63HSCnaN+Vtth8fufZ6GlAP5H3ZknGeKtHfmmEzKsNSJlsqOS0VvP?=
 =?us-ascii?Q?+rXX0FAhHGk0Z/iSL0azaDOEXVYyMIphuj5yNLIxjvOTIDTVMwxPoZp47Cbh?=
 =?us-ascii?Q?/1fEThaqKRSai3c9bnOpnhs0IHsPB4QFkDCckDI3156cTxzMfxG59fy4N9Le?=
 =?us-ascii?Q?JLWFfFBTx8CCX7Eeh36du0+WF/CGXad3QAlE3KTzIcJr2ywW/aYw3DPsBQAj?=
 =?us-ascii?Q?7e0Uuvn2csowFWSnEvBsMoMIlmTHHIw+umu6GGfL5cVwqe3XyeoZ+harPIQZ?=
 =?us-ascii?Q?QwnrgDoAipzqT6YpcKn4CP6DImqG9EUrqp3u8bYqs5dmQ76O52OoxtUCCIEM?=
 =?us-ascii?Q?cyq4I57qjwg3AlbrU64ZZ36RiTswMimWNYrMT2o0o+wF7nWH2wFDGMnBm7ES?=
 =?us-ascii?Q?iEPICL9Dgwh8Ee/PHj5BF16LbUfKSY2QcEYZyufJxkI/2/QibGT4Und/zDde?=
 =?us-ascii?Q?MQqOlKrTawc2TXang5lEfI4zw3Z1lz2bxD9B/cfDINzEOlP+padN7SSbUPx5?=
 =?us-ascii?Q?vejXQrkzIBfrRqdiGDBR+4t5szN/2YYBrhTqfV9RNCRHQKQ5E0DtCFU6SFKF?=
 =?us-ascii?Q?e6tg11OnC5kgnOEBggLjv9Awoqh6+2avrK2NUQ3EZKoKfAmVWbAO5B28o7W0?=
 =?us-ascii?Q?AKsUCDuCzOLHFZKG2q7Mlt7DL1Mg1lFnT4t6uOfhGZo6A0NWG6ywbvz7DN4S?=
 =?us-ascii?Q?8qcKWwdcoNARawbHfSxpP+0D9omsjUVGiNneIusry7Hdd+XxF+48bWAqLcpi?=
 =?us-ascii?Q?9A8lM3AOy793EucV6MAJIRKg4UikrZJBmH6uVufpOwrlg2ibGVlrGqAbJsCM?=
 =?us-ascii?Q?lMOj0ZMiSyGwTxepP9+Y/qIPKUUjzURqSl828uhEBMLoZohjvrP7MvfkLTF6?=
 =?us-ascii?Q?fHSckaYVQ09X2Lh50IZCmCH82Ex25LQUjJO4kr0iLhRiqo0+Kt1EvoorOfrJ?=
 =?us-ascii?Q?N96yMBPQ/mMtbYx4WOUCFHyuY1ZBCbzCEWmSsXAesflGusk6pvphvRibN5Cx?=
 =?us-ascii?Q?f3djgV/n58M9/n1DAuvtk3KUw7otFpMQuN8Cuq/LeTMXaAqyVw3VK/TVU8OM?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 523a0ec7-d513-4853-8622-08db14fc251c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 17:42:19.1872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GtX5ojZ0UvfvOBmuOFdkvCboz86OHJIX2D8Uk6U3FGvBETkflzYeGOkUUbztCs8/1W+Ope8WvjBE+4oc7YfaXL0pzp6o/MYeFvn717i749c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6692
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

On Wed, Feb 22, 2023 at 05:10:55PM +0000, Matthew Auld wrote:
>On Wed, 22 Feb 2023 at 14:59, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>
>> On Wed, Feb 22, 2023 at 10:02:08AM +0000, Matthew Auld wrote:
>> >On Tue, 21 Feb 2023 at 23:34, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> >>
>> >> In order to avoid  -Werror=missing-prototypes, add the prototypes and
>> >> move the functions to the end of the file, surrounded by
>> >> `#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)`.
>> >
>> >Is everything under tests/ not excluded from compilation when !XE_KUNIT_TEST?
>>
>> yes, except the ifdef is not in tests/. Example:
>> drivers/gpu/drm/xe/tests/xe_bo.c
>
>AFAICT xe/tests is only compiled if XE_KUNIT_TEST is enabled (looking
>at the Makefile). tests/xe_bo.c is included at the bottom of xe_bo.c
>but that is also wrapped in ifdef. So not seeing why we need to add
>the ifdef stuff directly in tests/xe_bo.c, for example.

ugh... I  read what I paste, sorry.

indeed, it shouldn't build that, so I think it's just the missing
prototype that I need to add. I will rework this patch.

thanks
Lucas De Marchi

>
>>
>> The way the kunit tests in xe are split is: each .o in tests/ will
>> create a separate module. In order to test a function like we are
>> doing, the function needs to be declared !static and exported so the
>> other module can call it.
>>
>> There are other possible ways to test functions on a different
>> compilation unit: https://kunit.dev/third_party/kernel/docs/tips.html?highlight=static%20function#testing-static-functions
>> I'm not so familiar with kunit yet to be able to say which one
>> is better for our case, so I just went with the easy fix.
>>
>> +Thomas
>>
>> Lucas De Marchi
>>
>> >
>> >>
>> >> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> >> ---
>> >>  drivers/gpu/drm/xe/tests/xe_bo.c      | 54 +++++++++++++++------------
>> >>  drivers/gpu/drm/xe/tests/xe_dma_buf.c |  2 +
>> >>  drivers/gpu/drm/xe/tests/xe_migrate.c |  6 +++
>> >>  3 files changed, 39 insertions(+), 23 deletions(-)
>> >>
>> >> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
>> >> index 87ac21cc8ca9..2c94ddaacda6 100644
>> >> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
>> >> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
>> >> @@ -141,29 +141,6 @@ static void ccs_test_run_gt(struct xe_device *xe, struct xe_gt *gt,
>> >>         xe_bo_put(bo);
>> >>  }
>> >>
>> >> -static int ccs_test_run_device(struct xe_device *xe)
>> >> -{
>> >> -       struct kunit *test = xe_cur_kunit();
>> >> -       struct xe_gt *gt;
>> >> -       int id;
>> >> -
>> >> -       if (!xe_device_has_flat_ccs(xe)) {
>> >> -               kunit_info(test, "Skipping non-flat-ccs device.\n");
>> >> -               return 0;
>> >> -       }
>> >> -
>> >> -       for_each_gt(gt, xe, id)
>> >> -               ccs_test_run_gt(xe, gt, test);
>> >> -
>> >> -       return 0;
>> >> -}
>> >> -
>> >> -void xe_ccs_migrate_kunit(struct kunit *test)
>> >> -{
>> >> -       xe_call_for_each_device(ccs_test_run_device);
>> >> -}
>> >> -EXPORT_SYMBOL(xe_ccs_migrate_kunit);
>> >> -
>> >>  static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kunit *test)
>> >>  {
>> >>         struct xe_bo *bo, *external;
>> >> @@ -278,6 +255,8 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
>> >>         return 0;
>> >>  }
>> >>
>> >> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>> >> +
>> >>  static int evict_test_run_device(struct xe_device *xe)
>> >>  {
>> >>         struct kunit *test = xe_cur_kunit();
>> >> @@ -296,8 +275,37 @@ static int evict_test_run_device(struct xe_device *xe)
>> >>         return 0;
>> >>  }
>> >>
>> >> +void xe_bo_evict_kunit(struct kunit *test);
>> >> +
>> >>  void xe_bo_evict_kunit(struct kunit *test)
>> >>  {
>> >>         xe_call_for_each_device(evict_test_run_device);
>> >>  }
>> >>  EXPORT_SYMBOL(xe_bo_evict_kunit);
>> >> +
>> >> +static int ccs_test_run_device(struct xe_device *xe)
>> >> +{
>> >> +       struct kunit *test = xe_cur_kunit();
>> >> +       struct xe_gt *gt;
>> >> +       int id;
>> >> +
>> >> +       if (!xe_device_has_flat_ccs(xe)) {
>> >> +               kunit_info(test, "Skipping non-flat-ccs device.\n");
>> >> +               return 0;
>> >> +       }
>> >> +
>> >> +       for_each_gt(gt, xe, id)
>> >> +               ccs_test_run_gt(xe, gt, test);
>> >> +
>> >> +       return 0;
>> >> +}
>> >> +
>> >> +void xe_ccs_migrate_kunit(struct kunit *test);
>> >> +
>> >> +void xe_ccs_migrate_kunit(struct kunit *test)
>> >> +{
>> >> +       xe_call_for_each_device(ccs_test_run_device);
>> >> +}
>> >> +EXPORT_SYMBOL(xe_ccs_migrate_kunit);
>> >> +
>> >> +#endif
>> >> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
>> >> index 615d22e3f731..d8ad135d0e04 100644
>> >> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
>> >> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
>> >> @@ -252,6 +252,8 @@ static int dma_buf_run_device(struct xe_device *xe)
>> >>         return 0;
>> >>  }
>> >>
>> >> +void xe_dma_buf_kunit(struct kunit *test);
>> >> +
>> >>  void xe_dma_buf_kunit(struct kunit *test)
>> >>  {
>> >>         xe_call_for_each_device(dma_buf_run_device);
>> >> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
>> >> index 03a60d5b42f1..7be0c2543916 100644
>> >> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
>> >> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
>> >> @@ -352,6 +352,8 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
>> >>         xe_bo_vunmap(m->pt_bo);
>> >>  }
>> >>
>> >> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>> >> +
>> >>  static int migrate_test_run_device(struct xe_device *xe)
>> >>  {
>> >>         struct kunit *test = xe_cur_kunit();
>> >> @@ -371,8 +373,12 @@ static int migrate_test_run_device(struct xe_device *xe)
>> >>         return 0;
>> >>  }
>> >>
>> >> +void xe_migrate_sanity_kunit(struct kunit *test);
>> >> +
>> >>  void xe_migrate_sanity_kunit(struct kunit *test)
>> >>  {
>> >>         xe_call_for_each_device(migrate_test_run_device);
>> >>  }
>> >>  EXPORT_SYMBOL(xe_migrate_sanity_kunit);
>> >> +
>> >> +#endif
>> >> --
>> >> 2.39.0
>> >>
