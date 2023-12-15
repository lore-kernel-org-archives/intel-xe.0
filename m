Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2999DC35274
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 22:11:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B4610EA9C;
	Fri, 15 Dec 2023 22:11:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADECD10EA9C
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 22:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702678296; x=1734214296;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FQCZYe82/YMm2YUka/24vq+U8wHFpDREcF0nqwiYl+o=;
 b=ZigF43yJ2ExshErFGJhSAI19o2dXJo1LsxKzsJ/foTiAs+Vrt+wyNoEQ
 j0cEc3P6HumHO5+ttCrRIw+4R25lCLVeLnzmyZA+VnCe9ygyv9p4oAdZX
 vesso+8x5+hoPRCv8N5DSGUvcCO4OKIJE+bZcNx0tfqVZXMV18WD6wpqW
 XP+jgVlI1tD8PxXbIM37lGqDQG+b6+OgvSm/C0YCZ8nt31jktKXVC3+jB
 0xPdvxmkHcOI0fVHKGU2tDiFbGqdJA1VqCleC5a6zocx8FYWO2e5f0XoF
 jnFRE2iOY7RarHpLEkQXr6bqqHbn7yvYFXvTDUxcKjXcFGackNPnU38AA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="394209339"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; d="scan'208";a="394209339"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 14:11:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="778417322"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; d="scan'208";a="778417322"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Dec 2023 14:11:36 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 14:11:35 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 14:11:35 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Dec 2023 14:11:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bwfqaLOOt2kgebM1vpHx6g1aleuiHTOv8xkFu7EuURFHLjJRyPrIL7ovhIlMfhSLwd2gE7e/Fq+1oC3QU1BF/abtXWFc/wgC/S75wXfuMqU0hH3BqcmNGFDSE5xBf8NU0DnW/cX2GZxfsnj/wVfWNW9PW39+XhSjPNatkY9al0DaWmmYSqe3Le9NnWdj0b9iHQp4JPY2SMVLKmRR+ac9ZOSTxmUPmQGISFSGqwzCTD2n+8ZNyA4oNBkMb2+qgmEnOsCw2GWYHe4udQ/ZubpSW+fCVXsVZUVFHvdub23Ok3OJAZYDjk9/7euLvSPcdKtlWig1S2AnVTnQxz2QeQS2rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLOryQhr3Fdi4zSE4PRPMShx69/a3aB9HSD1Kz/7fDQ=;
 b=AsObcTELPS7b13phvD5Y+Slk9qdGY8p2ck9XXPonx75uqZe19c+yCtQ5Nhc7cBseHpHEr7rmoEbEAbZ5dnVr0z24uuPy6S8LrpK8f8s/Gag0ZKnPr/WaAAj8jAwaLvohZg2SXjQVct4M8QszqjnpIfYywegq+HPxsbXNYQr8qx0IazyHw8vxhlaTPKp8NcCeSaRdiL97YQ1NYhQCgrbEkfz6HIeKJHMxmWdfYeWr8i0YlpQ2SdP3RJ9s9SxGiulsoqGpi6Vn3P0GYS5NocB5m2NNJnalTIWhrIEhk+xkBlrRhMX9AXfJEY3mwQz47UmaZUIo7F6WYJd1WSvhDH+/pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.32; Fri, 15 Dec
 2023 22:11:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7091.028; Fri, 15 Dec 2023
 22:11:33 +0000
Date: Fri, 15 Dec 2023 16:11:31 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v4 06/10] drm/xe/kunit: Restore test->priv when done with
 fake xe device
Message-ID: <3sc7ulh6z3t555u33wwxj77gwbmh4jvs3qwo3cn7dbs4vann4i@mjxlz45midfu>
References: <20231215162502.1879-1-michal.wajdeczko@intel.com>
 <20231215162502.1879-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231215162502.1879-7-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0179.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB8370:EE_
X-MS-Office365-Filtering-Correlation-Id: e35c01f9-e2fd-42e7-97c7-08dbfdbacc06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uKLtjdn4PQOw9LpVUvvjx8yXMOxceeHvJwEP6Y+ncklGdaSLR4/t7NY6o59OyIud6NyhFjGAhdj7r16x15sclN0trNPzqUqFvksJDZEKhK6cWZGJvtKgc/FTxnR1dOWW5HSkPHZR6XracDWWV73mjOPm1j/wsWODh0TiSNdXnL+m6CbpyAAyjFn5X97Ji78bnbVIxGBMhENfyuX9BBrfdhuzvn9t2uKpm5ccTTUtwinTg9yqE2pHPxocZTtKSnd2gvR9Zvmo8jXco1+tYZzjisQcADDLVjUlkG7HX2RBwO4tNfyQ0FOo0IcmPMumW/N42TOJ49HZ1My3qcjbDVDyxd3Wgj8nFYa8iQOU13OVXbW6+kvtPl+NNW+EmiYmywzCeyP11QnfBaL44zm/T+Ryl53/G9SREilVWvHw9dTgRwNTSdNrBEq0ZUqJ+6eFpQJjF/iTaeLkFXdJWj/mHV8HGeVQO8AQmZgCgSRPU2XeAn5UzhqQUnzxdUw6zGgtTGxSF7+1NbCDUpAwABkLdmwOgYz7/JEcRFCw48ghNZrL5D2YAWrm8qy78F8mElEFqDSn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(366004)(346002)(136003)(39860400002)(376002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(6636002)(316002)(82960400001)(86362001)(38100700002)(26005)(83380400001)(33716001)(478600001)(6486002)(2906002)(66556008)(66476007)(66946007)(9686003)(6512007)(6506007)(5660300002)(8936002)(8676002)(6862004)(4326008)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vvDWQ9OFaM/UaqjsrT3dfgnYo72ZtS4wYRebF8FZ+RXYHEQoO53vqSYmXvpH?=
 =?us-ascii?Q?8Vzl/VYYBv1a8AYSaxZzr+Dn9HFaK20TROZDHLgywQq8zGAwzph76b8ybnk3?=
 =?us-ascii?Q?vKmjW7zRVFu2286jsbNd/78oe4D8ZT6JoIuCKvGBb29v/yb5A+9yKhReGz4e?=
 =?us-ascii?Q?Z0jsvab6mUciLLdWXWQX6D1xhsOXnn2UQAUudujNa7v3or+tz/wTOODqgexl?=
 =?us-ascii?Q?R/m98gFWMSe/5Xy0/7IsOXSaK3gZLLSMwJ0IMMCRTW1NElfxtLuE7gpnYMCh?=
 =?us-ascii?Q?+ptzzMwRq9wzXGceFM75pjXh1R6y1eAKa2TaU1Cm2koFQEKNgep4ZOz5kuLO?=
 =?us-ascii?Q?iIjd0dSs5IxCYMwFAg/MuuIGiR/cvtMDrCjmyt2/hLojOQq9uvmIgQj1Mz6U?=
 =?us-ascii?Q?WzMjs89n7byirl9l2cvEKMtxqi6B+PaP3788tHZBqh4gGNpa9d2Ocpf5oirt?=
 =?us-ascii?Q?tuN3+pL5JJ5mpMEaA9ty+i1A6oPgYOVIT2fWsd4mAzVRWXQqAgvNnejwuguP?=
 =?us-ascii?Q?avrcSPF+c1KHZO3EZ0WmluDHB4Ma9P090MW1ZGYNXgs/YrYxBRAKf0EJ+Q/2?=
 =?us-ascii?Q?W0SkQQKCCcS3qBYWe7s3RQrIKD7RFYCF6qj7tKcfaG3XcSEpNY+tah7J4DST?=
 =?us-ascii?Q?E2MxcaJ2M42Gi+hx7uNRriPM486X6WZ4Xs1znCIii4P/nHX8NGK9OJOjkBxc?=
 =?us-ascii?Q?amaDqLIqDbi/WMSB4T6w/ikut7f5jgmTNQI/bH3g/RBxtclDg9ouu7v7icfr?=
 =?us-ascii?Q?707xAOcwxrg7WLa7U/W30ZA7MzzBDvbbaRYryLc82Eh0+4XkJCxd5hZsx2Ax?=
 =?us-ascii?Q?YP8omeht88OW7ZtkgVk8mn7kyEIgSDswjurdppfhZpysDB+ItrqhOHju+wVC?=
 =?us-ascii?Q?BYnJsYQHvZ5Uimt+Qf6iaySIswaKj9D8Sf7MzObgjHSXe8ODUBPDwcgPBHHs?=
 =?us-ascii?Q?Res+c9f3N5/YHNm3gO+pGsE2ybvOq6zmbwWfrpaKcM3tRdrKv4mWFy8EybVy?=
 =?us-ascii?Q?q60QRRIZTrVHAtV+Vg231mHFP+mTFtRvBt6qDhA+NVNeBXlsjyWSxNf3143K?=
 =?us-ascii?Q?qNgnOfGnOyydZZ9BUKzDLC8nmGNJgYC4VYk5tMHKicuy3Qf7Fgg8K0VP1Yyy?=
 =?us-ascii?Q?gV43mUN6erIf+F2WBQ72+L/hfYOpTf4c9goYas2ywDghLwyL5niGG6eonH26?=
 =?us-ascii?Q?miJyUX22lVn1+D51iFg1yGdwU4rNPIrd4TpP5jVAAx1ILjuEr6VbRxGRD5VJ?=
 =?us-ascii?Q?wgZQPl+g++i1U3eiE1w8SmI+sHeVGo4pYV5FsFM0pwebFrdC4CS5OrMw1825?=
 =?us-ascii?Q?nGnNeVyEiMNFlvXA+wMNPa+i87BdVNFLYTRVAdbmN3NKym9UiHX+jAMx2F+I?=
 =?us-ascii?Q?h9MPqZU8P/ZenjpDGx/cCJg3rspi0OXGjdqeWrXIpDY/Ehk5Jx0/9a3nSomv?=
 =?us-ascii?Q?c2HshiRvXIAmiBZEapYPRbjq9MsbPZmmSUuMBYYa5BTAYv527Sz+OqcvPvo9?=
 =?us-ascii?Q?rvY6XDtuQX+Ox981QDJ60u9IWiJgxsZgeAB2p0ZO+apd3HLNc9iV0vHLrpAV?=
 =?us-ascii?Q?jN/mBi8ckQElEcxm2OGtiPtKYVssGX8Py5qoL13H5DrrcchDcZUMZGXoPunF?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e35c01f9-e2fd-42e7-97c7-08dbfdbacc06
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 22:11:33.3712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DsXefjRF+Rv8zf//nKjx0gTcSInZ0VO3Fyq7SbMYyFEe2ChUWDknotdqLIFU2dPBSeVBG6M8DG/MUipqUCqiwrkGd2C4YOyzaRl81GcYYog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8370
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

On Fri, Dec 15, 2023 at 05:24:58PM +0100, Michal Wajdeczko wrote:
>Current KUnit implementation does not reset test->priv in case of
>parametrized tests and that may lead to wrongly treat our output
>pointer to fake xe_device from first call as input pointer with
>xe_pci_fake_data on subsequent calls.  Restore test->priv to
>original value to avoid invalid access.

but wouldn't each parameterized test pass a different a data?

not sure I'm following why this is a xe issue. Are you fixing it in xe
while should be fixed in kunit?

Lucas De Marchi

>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>---
> drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 10 ++++++++++
> 1 file changed, 10 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>index 6d72dbf06139..fefe79b3b75a 100644
>--- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>+++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>@@ -41,6 +41,13 @@ struct xe_device *xe_kunit_helper_alloc_xe_device(struct kunit *test,
> }
> EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_alloc_xe_device);
>
>+static void kunit_action_restore_priv(void *priv)
>+{
>+	struct kunit *test = kunit_get_current_test();
>+
>+	test->priv = priv;
>+}
>+
> /**
>  * xe_kunit_helper_xe_device_test_init - Prepare a &xe_device for a KUnit test.
>  * @test: the &kunit where this fake &xe_device will be used
>@@ -74,6 +81,9 @@ int xe_kunit_helper_xe_device_test_init(struct kunit *test)
> 	err = xe_pci_fake_device_init(xe);
> 	KUNIT_ASSERT_EQ(test, err, 0);
>
>+	err = kunit_add_action_or_reset(test, kunit_action_restore_priv, test->priv);
>+	KUNIT_ASSERT_EQ(test, err, 0);
>+
> 	test->priv = xe;
> 	return 0;
> }
>-- 
>2.25.1
>
