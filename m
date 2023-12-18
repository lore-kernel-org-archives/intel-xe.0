Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D59BC46CA2
	for <intel-xe@archiver.kernel.org>; Mon, 18 Dec 2023 22:45:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCAC510E034;
	Mon, 18 Dec 2023 22:45:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA08A10E034
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Dec 2023 22:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702939548; x=1734475548;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PzRqYHYNlPVXKnxi6QeF92LmYrnGfqvwQpRNa0OWsZw=;
 b=GJg8KRD2MyFKIpTyakunDDCW1eHD8o5JiIed0VZYsLySZLkqjcFhjnfY
 mpq1/lvQ1my58NjLAJonoiYeITagcFODhhY1XQlWrTVb7t3ejm17GwaXU
 z+EuQh2Mbmc1PiFbTRWqsVTYPTrchTD5miDC6Gg5pUQ/Q/RA2WL7h8C4G
 DvQVQM2Sx4zZoU4pS+LnhfgtvxPQfz99AdACMhb+/Q2/1IRBiYffw3rIc
 KbrjvhnYRRwjwNLnOYZs0Z9i7Ju/9tZJHgT8wWS7vC2VGSIle+McptwgK
 IJOoG5LKxqe8OY3SLa18dtCzg8pmVCb2TkTmnrcqNJuHCxNQqVUWxnEFa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="394455237"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="394455237"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 14:45:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="948945884"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="948945884"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2023 14:45:48 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Dec 2023 14:45:47 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Dec 2023 14:45:47 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Dec 2023 14:45:47 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Dec 2023 14:45:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B3faHysCN0FsWRfu8vqWCoksxaRE5K13gR9DPG+BmfNI80TPUUAerMYICMffp8/2lDeTOcqMJrBlJHVLES/2l0wfoJS2vFwHC6dUhmlR/NIOsCfEZXQUSCIBNy9vrOjo4WUZ3OoUQks0WomPEgLSc2KvH7dKdbv5F5Di8ot2Ap0Xv1RoMity9cKqP2HuAyEfsQgL67xfDzvdazc7S7jWT6mT0yhx9MZnpfJGgy5+sviq8WFqtPO4FLAdwYOIOFPfmzTuCY5GNdbG1zRwrdyJSw+kx7XKmewdXSfNVNaLcm6YOAwcg48Z8MSPCvF7ETFWsw3JsyV9oAbl7DBvSozhmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhZ1Ul+yjyKtJTia+nnxtp9CVu3vDI92yIlc8+44uD8=;
 b=FyLJETdMCEPgdkDoWfRbmKbcJusesMbKgKnb2SQKDOiXstJfvaxElxOMjqxCwlK/UJo+HRfIimduo8BLduYp5G80N7OS9gzF54P+xaPUe1z00X5yS5WI3P/KsTM7+agatCo/3WT/gba8CKedOhTe3s47hVsTOVLkhU/F2D/MNjWptuH/oXfaSDckbCLKJeHoSmPOWE/mcdMGmdNtCk1uwOeJUu4t2htf2Rzic89eKbseU0xdGcgQCQG6JgHDCRmoL0X3QjuXigoU7lisVcKNK4u0URaIR2N26naLfIzREQIwEsnFxFVS31G4DmTwDq0ajYO5Zdc08qok2IlKRX74YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB6061.namprd11.prod.outlook.com (2603:10b6:8:74::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.37; Mon, 18 Dec 2023 22:45:37 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 22:45:37 +0000
Date: Mon, 18 Dec 2023 16:45:35 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v5 06/10] drm/xe/kunit: Restore test->priv when done with
 fake xe device
Message-ID: <hs2ypa4c7mfl2xg2wji5wob457nxivxp7eidrb7iflnjedhewy@uux6gh7ozhlv>
References: <20231218190629.502-1-michal.wajdeczko@intel.com>
 <20231218190629.502-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231218190629.502-7-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR11CA0051.namprd11.prod.outlook.com
 (2603:10b6:a03:80::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB6061:EE_
X-MS-Office365-Filtering-Correlation-Id: 68e52b6a-4c88-48aa-6e5d-08dc001b0d8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E8R54QCz43PfK9LqOk8721zITRwzKr0puDPAMzTfnFG1rXjUgEl8NwiCdiZoi4dewRQSQwAuNUmFOoPHCngn5m2+jHbqWcgsGGpFPF3k5JQHC/plfuPQJZu2WloJv8IPrAFraBJmvYLuslEaK9YXvc8idwtHROEIbJ2j2OfZ8J4ndXTpx8yUD4Ba6typyni1XMjhyhjQXQsusBKvRhMP5D1pGgwxPBCkngxL6mU5PSZbXVJYUDeTsZ2kOm+v/id9+TUne2Oh7EX704bI984MWwZdJv/Sw5AOwsGQ36AtLP1HGV7AldUKEz+qGolT0ExYhpYA73Npj4cyyrZWnXsPAOvkJPMjJuFSZpVbMmDrNi7ygVYTjZkX+H87GCFq9sksflt7QLDN74EVsK/DqbgKU8Jq7xFyRPxPuOuixGUNi73rJCj9qZIBapRKGtXapwb1kAaDdkkWMEPyaSS18lJ5EFUpUUnl9hGLjXUFYjZ9XhRDYkjmnbLptlYAnOWKtudM7U4itPxWbmdpqepif0wyR/JPZ+GQdlzzVInkPhrA/Wg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(136003)(396003)(376002)(39860400002)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(82960400001)(6636002)(86362001)(38100700002)(83380400001)(26005)(33716001)(8676002)(966005)(478600001)(9686003)(6486002)(2906002)(66556008)(66476007)(6512007)(6506007)(5660300002)(4326008)(316002)(8936002)(6862004)(66946007)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+dp9Jgg0Kg5vxOaI8xS/CbJMqi2nU+T6Uchbhh43LZ6uJ8DBP0bT1ujIb5/n?=
 =?us-ascii?Q?Sh5vndn2eMkbNTn0e7uEZnyPgPUWyK1A6FFel5RTBWtuRqHaMcwcIoI+CI6W?=
 =?us-ascii?Q?VGDqRGMyqQYbG6wRoEKY+iojyDuepUSYBuQj1wBcCS/971qBY3t4qsP6MsKW?=
 =?us-ascii?Q?1ZVxuk9zJOx9wPJaInqiWgheOxisQITqxVmZ09KRhnhRP6XkB78UHqWYOzuX?=
 =?us-ascii?Q?2XVIi6e1uY6ZabsGuhSFGP0rP6meDzREwkdCfLxBl5nOND84qtbF3b5iu74O?=
 =?us-ascii?Q?CiNNOTVPlWk2avoTKT0Zo+jf68cqtLEWxcMe1CYN/rlSPEWh/azvn2lkyUhy?=
 =?us-ascii?Q?qQR7BXv+WzAgji3InF+g0VG7vy1zIoWzgGeFPs5VbvVJUsI1NU5rebVO7+kc?=
 =?us-ascii?Q?zlVucCJSv1mkrU1Z9UGgRe5B4Dmfg4/2C1/P1jRDoISxhliB1Dn0hDdfPGEB?=
 =?us-ascii?Q?WdoNo/vM8KUyX25WaYFG01BOZdy1SlDavwbf6t/SrJztaRpknpkfpT+Y6/9K?=
 =?us-ascii?Q?mgCeaj8vOnPms4JbQy366pEddLnRPKG0N/5fV3WlJBpBOOIjL6vo2X04kDmU?=
 =?us-ascii?Q?Z/LJWshd4lpq0jVpsXX2QsHWCH0Vq6QPm8a7kjVFxOF9M5C1RX3Wun9nziGW?=
 =?us-ascii?Q?/MULFcE967Z9f5zkB2/4wIehDpCyH9cfBKxo3hA483KEcBXwkQtQpUcdCHXx?=
 =?us-ascii?Q?WckgScAuc5ToOYObhCQ0u+2nfFiquCb2X0ONmNlaB1C6jkkYFweQJdT+au0h?=
 =?us-ascii?Q?rTIsR0cQOR8ljSxJA3Qm4kHJUJ9pW8x6URUm228qr3+g5K6QfMnNg8XvLfAR?=
 =?us-ascii?Q?9QwiuIt13i/5nFewi3z01CE+l88omAWMw5UUJNuGN8Jt/cB/eiLVUYVa8f9m?=
 =?us-ascii?Q?oHZMffbPDMVcMX+3ESCV8wgwozLGPT+VM5jUej/S0rm2pJ9yBErgphsNjhaV?=
 =?us-ascii?Q?o5eo+7vFr0OVJ1KH4FAUNkhngujnK2TbJ+cG8m8ONMlvRPEBNniG76dE48ar?=
 =?us-ascii?Q?mTgu4/2dp7i9ZMWehnLRhMRi45x8K1okmahg91+FgjbPFqSiJmuclcDf4+G2?=
 =?us-ascii?Q?nQRRi3PPNKy3BpNYWtSQqY0KPQT5BgYtv7OTwt1YF3wQ9MC3v6HndDBwN8/k?=
 =?us-ascii?Q?ujq7ojvMYdBzPL3mkkhfQg9JfsRDtKjcAIxNK/LTqd23diKdNNVLH2D2V4tf?=
 =?us-ascii?Q?uXwXjwZmXV8NN251GQb6kzaFM7csewWbny3mkeZ+XZydn0hKajA7+FhMcbED?=
 =?us-ascii?Q?HwMkF0wgruKJo57ZH+NQM33BEFq7hZFjZbifOiaCZLT9jIXBz0rLORbteTxn?=
 =?us-ascii?Q?0pJ9C8AMY6IrSQIGP+GycJusxqWAl6uf09LLqVbbTXnASdEDb/YruQY0PVy8?=
 =?us-ascii?Q?gimAY8Y+wO67JwQ7aONPZenoLC4iRqqOsynOkV7PGCb15rgdAK4KXpz2nQZb?=
 =?us-ascii?Q?QcCsr974FNjPEBLcaSKzdwX8OifYcdu+PV13iCrMm12fjvzNbxKoyqXlIJ0w?=
 =?us-ascii?Q?dHwi/8edkPtAPybr0/rCaa+f7ff+ACuz0N/Tb1XHseMh5KtMaL7LtAJv3Dvq?=
 =?us-ascii?Q?kSbayfw7LwO5R75z5dxMHeT0dVdJXchVTZ5Ty0aW9YEHwo5MKSXxsiB/R2ee?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e52b6a-4c88-48aa-6e5d-08dc001b0d8e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 22:45:37.4178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7NMEjHPc3HiSi3bw9SpVgyjSyK1c3SSGkLLkswZbmo0sQPbrThkfFImeha3a8Qi/3nttWiUK5oMl8yjiLxblNvN/abYqDkFjsrt9OMVebYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6061
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

On Mon, Dec 18, 2023 at 08:06:25PM +0100, Michal Wajdeczko wrote:
>Current KUnit implementation does not reset test->priv in case of

I don't like much having a workaround to this kunit issue on our side,
but you also did got the kunit patch reviewed at
https://lore.kernel.org/linux-kselftest/CABVgOS=imuVpgwwhSb8AQ_=YG2bfK8T5DE9yYr_XUb1CPDzxgA@mail.gmail.com/

Hopefully that will be applied soon and we can revert this.

Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>parametrized tests and that may lead to wrongly treat our output
>pointer to fake xe_device from first call as input pointer with
>xe_pci_fake_data on subsequent calls.  Restore test->priv to
>original value to avoid invalid access.
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
