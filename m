Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522A0C61D92
	for <intel-xe@archiver.kernel.org>; Tue, 21 Nov 2023 13:00:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0562D10E278;
	Tue, 21 Nov 2023 13:00:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C6210E278
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Nov 2023 13:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700571609; x=1732107609;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=nKSBZ6EgWdikEg2WTIMg9ZMAj+m0pHzmChVgVRYWAmg=;
 b=KTbBcpnRKz8Jf6kjaf5r9Zn6YyAbkWOxXIyUlZpT6ANznN9JAMoL6xaG
 K2x/oFVl+L1zlcei3M7LUEddhD6je4VRgyomKdkhGD5qz7PbPEb4HocEv
 AOaJx/pgVK+X2MvoTcR4z6dDchdPEuv58hOaKTAeS3skuz7RzzFrS85v+
 fIhGEGA/ORIQSFIh1dMVGiqkEbKZQ09sH9w+PrGkBVT9FaKXGVHFyulwy
 gY4MUWAhdK4PHo+AMbFk4T4SosY+/X7PgDf/tU+HBirsQpJwUHIWipzcB
 ZslhsVaeoY+ZgOqxocXOAMHAqXM1dRlNgFb08gKCpGxK3mO6d6WMjXGb5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="10498924"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="10498924"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 05:00:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="910436768"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="910436768"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2023 05:00:07 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 21 Nov 2023 05:00:06 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 21 Nov 2023 05:00:06 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 21 Nov 2023 05:00:06 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 21 Nov 2023 05:00:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RmULinqka4ieHRT2xBpPHl0l6K14qY06eLQDJlRjx4Ee05qba2MXMO9QGFPxLScIHOh/PTacWUyJGLnr7b6kqaBRt6kCuvkO126DiSkbM7NR+3tgQ8xxIgMpbO3r3+E6PLzmxvOBLk0obSU1ejnAVi5jZtVAbjG6xIgNn7Ka7QHgGZ+pUSNMR0znFYw7ZZx4i/PaWEFVZ3yacR+I0Gzc7vpoKhrfMK1Vc68yiQpi8USfcKnvpAtlLU0H6qFA71+bT/Hpgv7YRX5+FflRmYvuufHAKcMqAHzL1ADDtYgHjOGl5x0pU80xse7NP6YxwMpil5XWuL/g/d9wM8fN85dJhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a9q7bop4CgsXqc+vpXtrDnRq2evdxI8556JxTJfbheY=;
 b=lZ4ALfqJX6wMfJBlIAqkyfSR6uH6TzYNhDPDs1A/GMCgiuHefYaOs0RD4k/kJKYDtOCjET2lwdOU4fbYQJrOw3UMQ8GlBewt+5il9nJOT0WyHFCAKIvYvf+xqqP9kElbcPHPs6vJ/cZo6aY4n/NRC2VrdvVjgMny/A0NUEANkJjc2ZLnvsDIMl4pc/ocOK1pVVizq30VAHqQdYJeVdZtLKygAquj7sBXFLu7hsK1CYj5Mam7Ycya4cSSK3eN3mXbtwkUuHRxrZa9HYqWOfVInJgSsqX+uw7A2q5zaq6h5hHGiW3w37pJkISyGKX6ZFQE9zo1MlwKLQF843ka2R11Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by DS7PR11MB6197.namprd11.prod.outlook.com (2603:10b6:8:9b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Tue, 21 Nov
 2023 12:59:57 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::3964:7725:b677:28c6]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::3964:7725:b677:28c6%7]) with mapi id 15.20.7002.028; Tue, 21 Nov 2023
 12:59:57 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231120221904.695630-1-lucas.demarchi@intel.com>
References: <20231120221904.695630-1-lucas.demarchi@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Tue, 21 Nov 2023 09:59:49 -0300
Message-ID: <170057158947.1932.11679729397006630724@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR01CA0014.prod.exchangelabs.com (2603:10b6:a02:80::27)
 To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|DS7PR11MB6197:EE_
X-MS-Office365-Filtering-Correlation-Id: 75d79f83-747c-4518-d2a1-08dbea91c2d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VYi2qGY08+TUf3GzTdMI04/RisRE2xRlZrduJVtowofaJLFJoOLGKvS/zGF6QkAWsk6TJN/lbRz6YuZint+wTYOXL+Xbyg+fe/shAfozhWwx6A0dZff1RAdDeW0ne7hrFUKcLQ1eIeU+hjNEpL1GVW9X0FZFlYrgfIsf1ate9tlFFXlnzNJKILn0xabHM/623aTolgcCrb8igfHzF+7eW9ghSSmrYAhAld/uZAOzUagRCvkeKOK0RuMw7puws0TkdK67e7O562GAjPVYl00/6XXo8yFG0NcLEvSLm0Id+sNHInZ3YSsHCLJPF5xxyOqYk7QNnI1DMcsLyNKTf/t0pyjrJ/W+zi5zY9cXwFgBYCoBhNhf5gZUF2toWNJ56nt6feN7SL86FVIsQEsPaLCrV9fAbyjmpg78qhB2aUwxjDO5Up55svBVYAAHgdHXGGG84H6/L0jfYEJ81mYlkE2E3zXEYnY6bafH5cKxgwDrbj20Yf6cvEQgPSVsyUz6MTvde+nCYGL0tV6ajwf/fYK59DS19CbpISzDkKXZIuP2MUzrHFLDsln5WJgnjaIVUSaqNvGwsXGE8HeRHz8vTezsZncd5r0XZmW0k/1iNKf/sCNinm4oOIZx4uBwO4e7kfPK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(366004)(376002)(136003)(39860400002)(346002)(230173577357003)(230273577357003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(83380400001)(38100700002)(33716001)(82960400001)(86362001)(41300700001)(66946007)(316002)(66476007)(66556008)(8676002)(8936002)(4326008)(5660300002)(4001150100001)(2906002)(44832011)(6512007)(9686003)(107886003)(26005)(6486002)(6666004)(478600001)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cG94VFFVOEZwTjVaUTF1S2IzYTFSWnQvbjNHOFJYZXNCY2MyZEpJUmxOQ0tT?=
 =?utf-8?B?SXpHY1R4bFNWVkJHM1lKcFY3NmlWZnNUME96VUZBLzJUUC9ncDk3U0lLSUl4?=
 =?utf-8?B?SFYwV2lzRVpUYU1FYnJUVEhxRUlCdFRGcFJUWnFOMzlQS1p0UmlFU0N3WTZM?=
 =?utf-8?B?M1dpVVpxOEZ0WUNRb2V3aWVPczc3cVZUWml3QXlOa3llYUwxODYvWDByWG0w?=
 =?utf-8?B?OWJiVURDWTIwbGowQzJTZWtPaU5FRGppOFQrVlZMbWtmdUhDalNaKzR6SzBp?=
 =?utf-8?B?alVuaENiKzViaHpIZUhZWUxab1dSRFdCM3pNNXRqTGZsQ0pVMmx0MmNzeTVv?=
 =?utf-8?B?V2FpbUF3UjY2TElVLzl2eDVrNGFoanpHNTN0RExWUVZHOEFjT1VWWnlVcThW?=
 =?utf-8?B?YVA1ODVpVlZRZFF0MnpsanhZMDBiVWt2RDVDZEZPcjBYQzVHc0oyUHFLL25I?=
 =?utf-8?B?OWFWY2h0RW5ZZlV0Z1YvV053bHhuYWVQK3UyOU91MG9nRmFURnJBdHlWTDd1?=
 =?utf-8?B?Y3FicUxVdlZNWC9aR0JZYWRVMnZEUE5nTFdaK0oxV29pVlRGNWFBVDRQaVFP?=
 =?utf-8?B?RzA5Q3E0cVkyK0ZocTM0b0ZVcDU4Q2c5OElwWDBIRUNvV0MyR0RPQjVvOHdr?=
 =?utf-8?B?ZkRVOVZnUW5rcXR5MGVqRWgzdk5qZGE3cTlRMUNKV0U2UXVYUlhmV1R3OERE?=
 =?utf-8?B?bGp1VVJMOXJiU2NMVkpvcXhSOHA4Qklkd2p5Q25JOFVnTzdQZDFTaWYvQS8z?=
 =?utf-8?B?OTh0UHNEVW84SFYzaGFHajlzODA0T3lpV3FPNmNBQzVBMHZOcDR4a0VGZTVD?=
 =?utf-8?B?Si9uMkNybHoxeTZDWnhNbkF2YVA4TlFDUFJHek9aT0RvQk4vVW1Nam5VcHdz?=
 =?utf-8?B?bzFOMmgwVFMwcDdBdFJMdDhONnRrVFBtVkxzMzkzTUczTUl1THNjM2RGemd4?=
 =?utf-8?B?WlNOTThIazBkVmRkdTFRNXJRUFdVOTVOSEJGL3pKRkRLaERhZUxSZmE3alBj?=
 =?utf-8?B?bXNwVVNad25aM1JwWW1FOEdSTEZVUVZBR05PZEgwNk1QR1cvQ2plWUlrczl0?=
 =?utf-8?B?UUhXZFAyZzE5T1BmaEZzWFBkZ3dMMmxMUGEyZ1NZSmQ3cXUrL0kzTWtOcGR2?=
 =?utf-8?B?b2dEckdsdjdJc0ppVm1HTys1cllFbGd0bVZpVjFqUCswYy9qT3JlcW1LZWJI?=
 =?utf-8?B?ZGYrNmN3UHNUOXM5NjEydGJGOWozU0pjS29KL29uZk1sMjJmQ1FKSjhjeklH?=
 =?utf-8?B?aVN2VGttU0xwKzRsRGFxZFFRa21ZWWE2dGEwYjRmWjNsdHo0VlEwdVZGOGor?=
 =?utf-8?B?dDhDRVEvcDJTMDFORW15bDB6eU5DSmdMZ1NWazNqRXFUMXRyNXpjRUhhd3Rt?=
 =?utf-8?B?Y2pZNHdTYjM3Ym12aG1FZ3hhdzBvSXJjakxldmhBOEs2Y3k5cFNLc2R0SkpF?=
 =?utf-8?B?VTNycTVUU3RmcmYzTzNMNlc4bkNlZzVHR3N0RlNJVXFGUHdjc3dXTDdLdHpt?=
 =?utf-8?B?enJlbTJiejlhRjZjbmM5Z0lMRktJRnFwbmFPMzY1OVdvMS8vUlVJcEkrQkNF?=
 =?utf-8?B?T1BRWUpnKzh3R2k4Mkc3bURwVG1oS0IvY0pmTkJQZ0YyNnhvdmRDYWMrMGdD?=
 =?utf-8?B?emhpeDhETzNLMnkvNUxIUnNmdTNEUWUyUzQwWW9XbFNhcTBDMVNmRkZCeWFF?=
 =?utf-8?B?ZzJXKzBCdzVKVExVN0xuU1BlM1d2dW1TVU1MeGxpbVVkNEhSMEJnTlRLdDlq?=
 =?utf-8?B?WWtpQlBDaGg1Ymw0RUF2Qk55V0ZqdFZOUzJRSzExK0FxdFVyNHE0L0lpeGdq?=
 =?utf-8?B?L0VEdTFMaVZobHhMa21ieHVsQVFUOE5OUHRMMG5ldmFTd21EaU5BOE95ckJt?=
 =?utf-8?B?YnVjVkx4aUI5ci9lRkp2Wk5YeWIwMFMyZTA1OUNBWUJOdHpWSWtZUXAzZTVG?=
 =?utf-8?B?ekJvcnZ0cUhvbWtRazZWWWtTMWVkQWxPYnFTblh0VVFEa0RYZGhRc2FSVGRT?=
 =?utf-8?B?V0E4ZEwyNElqeE01aFdZNkhZcFB4dmdqRmZXalJ6T2ErT2NQVXFHVHhZRnEz?=
 =?utf-8?B?RkRLczZtNklJc2IwQVdCdEc0NUJDdEdjQmh4TGJBN3hxQmFheTlFbjdjVCs3?=
 =?utf-8?B?RjZlamFCRnBJU1dYd1NoTys4VUdCT2s4cE1LY2pvcHVSa25GMTZDQ2ttSm1x?=
 =?utf-8?B?UlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75d79f83-747c-4518-d2a1-08dbea91c2d0
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 12:59:56.6310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fyMv72ov1R3ukZ4hm+EOWwkO5u3YofMB26a89rjKg9KSUaf3GXdu31PuL80u4bFnuDlPRk00+gPOvpHjuaz+gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6197
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix modpost warning on kunit modules
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Lucas De Marchi (2023-11-20 19:19:04-03:00)
>When built with W=3D1, the following warnings show up on modpost:
>
>          MODPOST drivers/gpu/drm/xe/Module.symvers
>        WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/=
xe/tests/xe_bo_test.o
>        WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/=
xe/tests/xe_dma_buf_test.o
>        WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/=
xe/tests/xe_migrate_test.o
>        WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/=
xe/tests/xe_pci_test.o
>        WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/=
xe/tests/xe_rtp_test.o
>        WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/=
xe/tests/xe_wa_test.o
>
>Add the module description for each of these to fix the warning.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/tests/xe_bo_test.c      | 1 +
> drivers/gpu/drm/xe/tests/xe_dma_buf_test.c | 1 +
> drivers/gpu/drm/xe/tests/xe_migrate_test.c | 1 +
> drivers/gpu/drm/xe/tests/xe_pci_test.c     | 2 +-
> drivers/gpu/drm/xe/tests/xe_rtp_test.c     | 1 +
> drivers/gpu/drm/xe/tests/xe_wa_test.c      | 1 +
> 6 files changed, 6 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_bo_test.c b/drivers/gpu/drm/xe/te=
sts/xe_bo_test.c
>index 1c868e3635bc..f408f17f2164 100644
>--- a/drivers/gpu/drm/xe/tests/xe_bo_test.c
>+++ b/drivers/gpu/drm/xe/tests/xe_bo_test.c
>@@ -22,4 +22,5 @@ kunit_test_suite(xe_bo_test_suite);
>=20
> MODULE_AUTHOR("Intel Corporation");
> MODULE_LICENSE("GPL");
>+MODULE_DESCRIPTION("xe_bo kunit test");
> MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
>diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf_test.c b/drivers/gpu/drm/=
xe/tests/xe_dma_buf_test.c
>index 35312bfd5fb7..9f5a9cda8c0f 100644
>--- a/drivers/gpu/drm/xe/tests/xe_dma_buf_test.c
>+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf_test.c
>@@ -21,4 +21,5 @@ kunit_test_suite(xe_dma_buf_test_suite);
>=20
> MODULE_AUTHOR("Intel Corporation");
> MODULE_LICENSE("GPL");
>+MODULE_DESCRIPTION("xe_dma_buf kunit test");
> MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
>diff --git a/drivers/gpu/drm/xe/tests/xe_migrate_test.c b/drivers/gpu/drm/=
xe/tests/xe_migrate_test.c
>index 39179eae890b..cf0c173b945f 100644
>--- a/drivers/gpu/drm/xe/tests/xe_migrate_test.c
>+++ b/drivers/gpu/drm/xe/tests/xe_migrate_test.c
>@@ -21,4 +21,5 @@ kunit_test_suite(xe_migrate_test_suite);
>=20
> MODULE_AUTHOR("Intel Corporation");
> MODULE_LICENSE("GPL");
>+MODULE_DESCRIPTION("xe_migrate kunit test");
> MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
>diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.c b/drivers/gpu/drm/xe/t=
ests/xe_pci_test.c
>index 9c6f6c2c6c6e..daf652517608 100644
>--- a/drivers/gpu/drm/xe/tests/xe_pci_test.c
>+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.c
>@@ -70,5 +70,5 @@ kunit_test_suite(xe_pci_test_suite);
>=20
> MODULE_AUTHOR("Intel Corporation");
> MODULE_LICENSE("GPL");
>+MODULE_DESCRIPTION("xe_pci kunit test");
> MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
>-
>diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/t=
ests/xe_rtp_test.c
>index b2beba0019cd..a1d204133cc1 100644
>--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>@@ -313,4 +313,5 @@ kunit_test_suite(xe_rtp_test_suite);
>=20
> MODULE_AUTHOR("Intel Corporation");
> MODULE_LICENSE("GPL");
>+MODULE_DESCRIPTION("xe_rtp kunit test");
> MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
>diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/te=
sts/xe_wa_test.c
>index 6e1127b276ea..01ea974591ea 100644
>--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
>+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
>@@ -138,4 +138,5 @@ kunit_test_suite(xe_rtp_test_suite);
>=20
> MODULE_AUTHOR("Intel Corporation");
> MODULE_LICENSE("GPL");
>+MODULE_DESCRIPTION("xe_wa kunit test");
> MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
>--=20
>2.40.1
>
