Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891DFC4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 12:48:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D0D810E10B;
	Wed,  6 Dec 2023 12:48:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B6410E10B
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 12:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701866906; x=1733402906;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=bPj0zfnMHIMKZfy3SUkCmxjZnMjL1zQOzXr88yDUw5I=;
 b=G7CzoR2iivdpowjV+oWoNyWHKYIKjAeNZtoKyHloBg+1tzwlc1jejfcu
 ia8745h43pbveXZWlWu2hO7GOd/JRTHQ4EWXTF4ouPKTRxjvsSf5Tpjbg
 cC3Agk+JlVjGc+H6yZC2Kh7kIlQzKXOY6E2t+thtJ/Gf2vVoqNycTQh+i
 IxnbK31NlyjylaZBauwA8I1qXoglajk+gs2zvjR5Ty2m5l93gbfSY/B9w
 LcI8aYQO4GU5X9uHJnDnozXJ+C5CoHzocfA8ICw/xE6f0zbxxd4md0iHb
 v+Vz9XBSNMKX1C4seUh4kF5ZQfU8caqhfIcbc8b0xCu56jVbuniwq2WGV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="384457406"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="384457406"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 04:48:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="721070297"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="721070297"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 04:48:05 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 04:48:04 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 04:48:04 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 04:48:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iVNCOdAhjMx0WToCRx6osaPWwU5HtS8+ZARvuZirJVN/qzJATRFqyF1IOujk4ZwvNDxBYKfD9sOEF+9V7Eh64Ndoo8SqXpcd/agJkzNaAbNRWI342c3xRv766si3CB5AJv/KvBIxWYOInuG/ReT54g62QweEURSS6NsXZ/pWMPV9mpZfOfPt04THBKeWMEgWAtQ/TfiY98PawLsqndinSRJXIKe91S0tGMt0tzBY+GZcRkR5AcDlOexn/FB+JeZ1hfecvoMUnBYifqVcWumz/iLhyt6MV+py6O0FmQSOQsGoFmwLbttFRIBO7/iwIx0SPW+S6/xhxnL7PdwAwxWTSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=if469c1mA1cibVN9hBxU16MBg1U2JU28gIi+WR/vQtY=;
 b=JiFaokZfFCrdlf10Z/aYPwJnTrOlv7TD+65ryEO1+hc5mffg7mvKG99VzWQRT5HrJ0kj0Du0fyNidl7GcfTxIf0cPaIQKqnd5M6tOJ03HdCp7IOeeUqK2OZMlLhp7GNavYAHdF76trtVGaonlprXipivJd6kLz+vz1koN51JDJAMpTpvKDxvejrLi/dvFnG7XLU1/YSTMOIaWG7otVP6QSDxPpc9bEuXc1LlferNEfkYF+mEIZfdJYO9310vILjT2EdWHS8+jrtjBUk/M4HuNLOJDnUxXMjTcYlpXO3Iia0ow5WBpa7bol7NMDG3ykArLcktHFXvwSON23r5rKsy2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by DS7PR11MB6063.namprd11.prod.outlook.com (2603:10b6:8:76::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 12:47:57 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::3964:7725:b677:28c6]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::3964:7725:b677:28c6%7]) with mapi id 15.20.7046.034; Wed, 6 Dec 2023
 12:47:56 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231205145235.2114761-1-lucas.demarchi@intel.com>
References: <20231205145235.2114761-1-lucas.demarchi@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Wed, 6 Dec 2023 09:47:52 -0300
Message-ID: <170186687243.27709.2485801479192283213@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR13CA0038.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::13) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|DS7PR11MB6063:EE_
X-MS-Office365-Filtering-Correlation-Id: 354c88e9-9a79-4801-8a7e-08dbf6599202
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TpM6srMyIeZ7ZqQIAKu1NQeN4+JfjeFWohDnN/Ll9kb7zwax5RXtGWA1jBtpfp/9dra2KUU1wBQv3cQprs3cmtZg/YGfkSM2SfVBFkX8Wg5qTy/V6GlRS6kEw4tlWT/NkGzucr2Tf+WaxPGXQ9oSoz2OV28hsYbSwyg423Dd3I/UHnYm1MgbAnfDlpk7JQy9HY1XZb4biGCrRbBncbpG8T9B2zK3LPJTlkxDNWQCzCM8kSJoLoByqQC49PwDi+Arxi6reZPu9R/dD4DWkgKGz7NEAvUWiJQpEbFz0IF7Ps+25r/cjGaPk5+vVD7ThIxqbSER0EbphLwSTyGmWuDmfPh6PP6F0B0HQ8vbejSNpfKz8IMKVuiL37ST9+AMXSsfgpg+iBnwNg6IE8PBIzTvN8qEqEfu4nB7pv7ji4obyEsfNqZlRGOnz9Sb7SA0IGvtBpsAHq2Wp2gIHVwSIinRVz4gkxlr2xEJoXPePGnjXYu5M2WTQVTdQn0CseuL7CHnVAmM3GQ8s94cNfW8Rk268AgwYbB4Zbx5cM02+bvBF+XDB1uAgJFZc8itVUxCGrh3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(366004)(346002)(396003)(39860400002)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(6512007)(478600001)(6506007)(8936002)(8676002)(4326008)(6486002)(107886003)(66556008)(6666004)(26005)(9686003)(54906003)(66476007)(66946007)(316002)(83380400001)(30864003)(38100700002)(33716001)(82960400001)(5660300002)(44832011)(2906002)(86362001)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHpScFFwcE1rTVFUclZqSXNmV25KS3RudXg2cHFLSXl4NHEzUTQ4ektVZFpv?=
 =?utf-8?B?WllZY3NwQjZvMEtkZ2c2SzBMemJ3UnFyK2NucDB6WENNZVNTM1lKOFdFc3hK?=
 =?utf-8?B?KytJN1J4TFhDL1FMQnRFNy9VcUw4MVNCcXUreitxYnNSdmQyWUZhcDNUNEZx?=
 =?utf-8?B?TXFmYzc2ZEpYcDFBU3FXT1BuRWtsVUI4OCtNeHQvN3RmbkVIKzZ3R2VnOVd5?=
 =?utf-8?B?ZFdzUVFpRE9NNnpyeTljbWlZR3dVcVljU2ozR2F5OVo0WndRMmlZcWxSOEpM?=
 =?utf-8?B?a3crWjJSdUpucVIxTUlEMW1odjZ2ZkhGanpFaUhBMkJtczZCUGJGTnpkYjFY?=
 =?utf-8?B?RnIvd3EvcHpQNnNoZzBCdTg4V3RqL3Rram15a2doUGJJd0xZVHJBWEJHOVBY?=
 =?utf-8?B?MmQwa092cC9Na09qLzZtUUpITm9uY0F6THBHWkVKMXF6ZTNaU0VESldDaHU1?=
 =?utf-8?B?YkdieEV1UjJKaDAxaDlGbWRIcGU2Z2E4b2g4WmVFQisxQkU3RnlUMDVFVm1r?=
 =?utf-8?B?dXZUNDVDK2Vielo1RUZ6ckZHVlJUcFJ6dEdXWHlxUzliTUFPdFo2dkNyQ3Zy?=
 =?utf-8?B?K2pzbmU4RG9RNWl6TmUxQXIzZnAyS2tJSjJaeHhhaGsyY1F1bVlid0U1RTdC?=
 =?utf-8?B?Z29yV2JaNzVXcHdMYWU3SkxCcjdXZDV5amwxa3hOUE1vdWFSUFlUcldubFF1?=
 =?utf-8?B?dG8waGFxRHowSWNVVzhPeUVsc1BiMkxBSVFhdHZCQXdEYnlza0h3dmlUQzNU?=
 =?utf-8?B?d3JEU1N6Z0ZFWE9obTdCKzhFSy9ReUN0NkF1YzVjdUcwMVBrN2xIdXJSSUN0?=
 =?utf-8?B?WjRha1Vrc3dQUlUwbEFQZ1ZQQnRud3FSY3U3T3JFUTZFbEFTVTRkN2JObGVD?=
 =?utf-8?B?eTBWK3ZiNGpkaHFQNmlWMDB6NUg0Rkl4L1JvZGNEMmF4ZDVDQTFocVFGZTVi?=
 =?utf-8?B?L0VySzB5WkI5US91TEIwRmFISjZlNHNsYjNCYTZubHIrSTl4a0llVzZZeHVF?=
 =?utf-8?B?dXRYY2lvby92NmV6dTh5dVFiL1pYbDR4aWxuTXkzVjkrazRzK1Nsc1g1OFU5?=
 =?utf-8?B?V3BKSmF4czAyZTFRMC9uamZvYThNNG8xbnk0NGt4cWxLcGw3N3o3bVN2WkpG?=
 =?utf-8?B?WS9XQzZVNGNxVnlydkY5QWRGRXpBRzQ0dlo0aFpGNWpsaG5TQUw1SzE5ay82?=
 =?utf-8?B?NWNIekRxR1ZjTHcwZW5xQ2VWTG5NZ3lCMFZQNTRSMkRzbVF6Rnk5dFNWcGVN?=
 =?utf-8?B?TFViVjBBVkFHTSsreUcwRkhNb0pzcmQvQXI3Tk03b1k3Umt5SWRBZGt5QUVX?=
 =?utf-8?B?Z3Y3STMvc1BXd2JOOCt3bE9PTjBZWGJXZkhDNUNzVXoyR0dUN1hmR3hCWWV0?=
 =?utf-8?B?Qm9mYnU3YmpvK3ZKUG1tZzEyVUlGdGsyQ1Q2TmJ6ejVxRHIvQkRGL3pPUUsz?=
 =?utf-8?B?SE51b3hVRkVEK1oweStnTERjU3ZPSGVIK0pkRGREWUN0U1NsSzR0TWQyUTE3?=
 =?utf-8?B?Z2N1NkhRTWtJMDFyOFlESHd1MVdIYU02WXl6OUV3Mm5OTVBHOXppUG4vUWVE?=
 =?utf-8?B?dmhsbzRuL2h1SGQ0T2p4WGlKNDhQaUh3VytHdkY3YVdrTGVTa2NzaWFjLzBn?=
 =?utf-8?B?UXJWT21qWVlmak1wS1BLSzhGOSttZ1BHam8ya1dweWNhd3lEMlFWYjRGMUM1?=
 =?utf-8?B?aTNhNUpyLzFyWDdxalRvSFQwSm5DdlVKam9ybzNDblBVUXR0VlZ6VG0xR2s0?=
 =?utf-8?B?STc4QTA5MCtEdW5kcE9ZT05qS3NRd05qV3JoUEZkZlZWSkdabDRFai9IczRw?=
 =?utf-8?B?c1hubnpBaWdPbTdaWGtoWDNDbU1YVFVCbG90WVdwZmlYK2RuNGtTQzJLd252?=
 =?utf-8?B?U2NIaUlHTE1IeUE5eDg1WmgvUFdRY0MxaXROamtZS0pxaTJ3ZnZWQkE3Uis0?=
 =?utf-8?B?NGd1d0g4WTJoYzZ2aUZERlpwNXZMT2hCdDJTRWJBZ09XUWlBK2NNRHgvbXBC?=
 =?utf-8?B?OHZKWkdjZk1UQlJDZkhMNGNtdERUZ1NQWGZWdW9oVnNGZ212Wld1SlNUVkpM?=
 =?utf-8?B?aStvUjdlQllmelFRYklRNGU5VStLSTlVdTlUcnRSWm9Cald5Qlo4eVE1NzNR?=
 =?utf-8?B?RDhoRHBDYzNuWisrQmg5QTM0SXpGY3BSVUlYRWpmUjlubG0rK09PYUpNMVEv?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 354c88e9-9a79-4801-8a7e-08dbf6599202
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 12:47:56.9035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vzQSGHA6PjY95FxIUzrhbtL7b31diXSaTWlR4VI7ttZ4nStkeaZDHwi57NB02+yXSLKqn7yNR45B2mpVxfEC7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6063
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Rename info.supports_* to info.has_*
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Lucas De Marchi (2023-12-05 11:52:35-03:00)
>Rename supports_mmio_ext and supports_usm to use a has_ prefix so the
>flags are grouped together. This settles on just one variant for
>positive info matching ("has_") and one for negative ("skip_").
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/tests/xe_migrate.c |  4 ++--
> drivers/gpu/drm/xe/xe_debugfs.c       |  2 +-
> drivers/gpu/drm/xe/xe_device_types.h  |  8 ++++----
> drivers/gpu/drm/xe/xe_exec_queue.c    |  6 +++---
> drivers/gpu/drm/xe/xe_gt.c            |  2 +-
> drivers/gpu/drm/xe/xe_gt.h            |  2 +-
> drivers/gpu/drm/xe/xe_gt_pagefault.c  |  4 ++--
> drivers/gpu/drm/xe/xe_guc_ads.c       |  4 ++--
> drivers/gpu/drm/xe/xe_hw_engine.c     |  4 ++--
> drivers/gpu/drm/xe/xe_lrc.c           |  2 +-
> drivers/gpu/drm/xe/xe_migrate.c       | 16 ++++++++--------
> drivers/gpu/drm/xe/xe_mmio.c          |  5 +++--
> drivers/gpu/drm/xe/xe_pci.c           | 12 ++++++------
> drivers/gpu/drm/xe/xe_pci_types.h     |  2 +-
> drivers/gpu/drm/xe/xe_vm.c            |  2 +-
> 15 files changed, 38 insertions(+), 37 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/te=
sts/xe_migrate.c
>index 83d6a66ed369..47fcd6e6b777 100644
>--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
>@@ -37,7 +37,7 @@ static int run_sanity_job(struct xe_migrate *m, struct x=
e_device *xe,
>                           struct xe_bb *bb, u32 second_idx, const char *s=
tr,
>                           struct kunit *test)
> {
>-        u64 batch_base =3D xe_migrate_batch_base(m, xe->info.supports_usm=
);
>+        u64 batch_base =3D xe_migrate_batch_base(m, xe->info.has_usm);
>         struct xe_sched_job *job =3D xe_bb_create_migration_job(m->q, bb,
>                                                               batch_base,
>                                                               second_idx)=
;
>@@ -308,7 +308,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *=
m, struct kunit *test)
>                 goto free_pt;
>         }
>=20
>-        bb =3D xe_bb_new(tile->primary_gt, 32, xe->info.supports_usm);
>+        bb =3D xe_bb_new(tile->primary_gt, 32, xe->info.has_usm);
>         if (IS_ERR(bb)) {
>                 KUNIT_FAIL(test, "Failed to create batchbuffer: %li\n",
>                            PTR_ERR(bb));
>diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debug=
fs.c
>index 2de8a0b9da18..f1e80be8b930 100644
>--- a/drivers/gpu/drm/xe/xe_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_debugfs.c
>@@ -53,8 +53,8 @@ static int info(struct seq_file *m, void *data)
>         drm_printf(&p, "tile_count %d\n", xe->info.tile_count);
>         drm_printf(&p, "vm_max_level %d\n", xe->info.vm_max_level);
>         drm_printf(&p, "force_execlist %s\n", str_yes_no(xe->info.force_e=
xeclist));
>-        drm_printf(&p, "supports_usm %s\n", str_yes_no(xe->info.supports_=
usm));
>         drm_printf(&p, "has_flat_ccs %s\n", str_yes_no(xe->info.has_flat_=
ccs));
>+        drm_printf(&p, "has_usm %s\n", str_yes_no(xe->info.has_usm));
>         for_each_gt(gt, xe, id) {
>                 drm_printf(&p, "gt%d force wake %d\n", id,
>                            xe_force_wake_ref(gt_to_fw(gt), XE_FW_GT));
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_=
device_types.h
>index 9a212dbdb8a4..5b30836fcb23 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -242,8 +242,6 @@ struct xe_device {
>=20
>                 /** @is_dgfx: is discrete device */
>                 u8 is_dgfx:1;
>-                /** @supports_usm: Supports unified shared memory */
>-                u8 supports_usm:1;
>                 /** @has_asid: Has address space ID */
>                 u8 has_asid:1;
>                 /** @force_execlist: Forced execlist submission */
>@@ -252,18 +250,20 @@ struct xe_device {
>                 u8 has_flat_ccs:1;
>                 /** @has_llc: Device has a shared CPU+GPU last level cach=
e */
>                 u8 has_llc:1;
>+                /** @has_mmio_ext: Device has extra MMIO address range */
>+                u8 has_mmio_ext:1;
>                 /** @has_range_tlb_invalidation: Has range based TLB inva=
lidations */
>                 u8 has_range_tlb_invalidation:1;
>                 /** @has_sriov: Supports SR-IOV */
>                 u8 has_sriov:1;
>+                /** @has_usm: Device has unified shared memory support */
>+                u8 has_usm:1;
>                 /** @enable_display: display enabled */
>                 u8 enable_display:1;
>                 /** @skip_mtcfg: skip Multi-Tile configuration from MTCFG=
 register */
>                 u8 skip_mtcfg:1;
>                 /** @skip_pcode: skip access to PCODE uC */
>                 u8 skip_pcode:1;
>-                /** @supports_mmio_ext: supports MMIO extension/s */
>-                u8 supports_mmio_ext:1;
>                 /** @has_heci_gscfi: device has heci gscfi */
>                 u8 has_heci_gscfi:1;
>                 /** @skip_guc_pc: Skip GuC based PM feature init */
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_ex=
ec_queue.c
>index cb284c4ad049..53b432265631 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>@@ -362,7 +362,7 @@ static int exec_queue_set_acc_trigger(struct xe_device=
 *xe, struct xe_exec_queue
>         if (XE_IOCTL_DBG(xe, !create))
>                 return -EINVAL;
>=20
>-        if (XE_IOCTL_DBG(xe, !xe->info.supports_usm))
>+        if (XE_IOCTL_DBG(xe, !xe->info.has_usm))
>                 return -EINVAL;
>=20
>         q->usm.acc_trigger =3D value;
>@@ -376,7 +376,7 @@ static int exec_queue_set_acc_notify(struct xe_device =
*xe, struct xe_exec_queue
>         if (XE_IOCTL_DBG(xe, !create))
>                 return -EINVAL;
>=20
>-        if (XE_IOCTL_DBG(xe, !xe->info.supports_usm))
>+        if (XE_IOCTL_DBG(xe, !xe->info.has_usm))
>                 return -EINVAL;
>=20
>         q->usm.acc_notify =3D value;
>@@ -390,7 +390,7 @@ static int exec_queue_set_acc_granularity(struct xe_de=
vice *xe, struct xe_exec_q
>         if (XE_IOCTL_DBG(xe, !create))
>                 return -EINVAL;
>=20
>-        if (XE_IOCTL_DBG(xe, !xe->info.supports_usm))
>+        if (XE_IOCTL_DBG(xe, !xe->info.has_usm))
>                 return -EINVAL;
>=20
>         if (value > DRM_XE_ACC_GRANULARITY_64M)
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index a9c71da985d3..70ad563c2c65 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -427,7 +427,7 @@ static int all_fw_domain_init(struct xe_gt *gt)
>                 /*
>                  * USM has its only SA pool to non-block behind user oper=
ations
>                  */
>-                if (gt_to_xe(gt)->info.supports_usm) {
>+                if (gt_to_xe(gt)->info.has_usm) {
>                         gt->usm.bb_pool =3D xe_sa_bo_manager_init(gt_to_t=
ile(gt), SZ_1M, 16);
>                         if (IS_ERR(gt->usm.bb_pool)) {
>                                 err =3D PTR_ERR(gt->usm.bb_pool);
>diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>index caded203a8a0..11265e851a81 100644
>--- a/drivers/gpu/drm/xe/xe_gt.h
>+++ b/drivers/gpu/drm/xe/xe_gt.h
>@@ -63,7 +63,7 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, st=
ruct xe_hw_engine *hwe)
> {
>         struct xe_device *xe =3D gt_to_xe(gt);
>=20
>-        return xe->info.supports_usm && hwe->class =3D=3D XE_ENGINE_CLASS=
_COPY &&
>+        return xe->info.has_usm && hwe->class =3D=3D XE_ENGINE_CLASS_COPY=
 &&
>                 hwe->instance =3D=3D gt->usm.reserved_bcs_instance;
> }
>=20
>diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_=
gt_pagefault.c
>index a5358064a4e0..4489aadc7a52 100644
>--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>@@ -398,7 +398,7 @@ int xe_gt_pagefault_init(struct xe_gt *gt)
>         struct xe_device *xe =3D gt_to_xe(gt);
>         int i;
>=20
>-        if (!xe->info.supports_usm)
>+        if (!xe->info.has_usm)
>                 return 0;
>=20
>         for (i =3D 0; i < NUM_PF_QUEUE; ++i) {
>@@ -431,7 +431,7 @@ void xe_gt_pagefault_reset(struct xe_gt *gt)
>         struct xe_device *xe =3D gt_to_xe(gt);
>         int i;
>=20
>-        if (!xe->info.supports_usm)
>+        if (!xe->info.has_usm)
>                 return;
>=20
>         for (i =3D 0; i < NUM_PF_QUEUE; ++i) {
>diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_a=
ds.c
>index 2f5ff090aa6b..6006f992b781 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ads.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>@@ -140,7 +140,7 @@ static size_t guc_ads_um_queues_size(struct xe_guc_ads=
 *ads)
> {
>         struct xe_device *xe =3D ads_to_xe(ads);
>=20
>-        if (!xe->info.supports_usm)
>+        if (!xe->info.has_usm)
>                 return 0;
>=20
>         return GUC_UM_QUEUE_SIZE * GUC_UM_HW_QUEUE_MAX;
>@@ -595,7 +595,7 @@ void xe_guc_ads_populate(struct xe_guc_ads *ads)
>         guc_capture_list_init(ads);
>         guc_doorbell_init(ads);
>=20
>-        if (xe->info.supports_usm) {
>+        if (xe->info.has_usm) {
>                 guc_um_init_params(ads);
>                 ads_blob_write(ads, ads.um_init_data, base +
>                                offsetof(struct __guc_ads_blob, um_init_pa=
rams));
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_=
engine.c
>index 108ecbfe593e..37279cee6ad4 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -450,7 +450,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_=
hw_engine *hwe,
>                 xe_hw_engine_enable_ring(hwe);
>=20
>         /* We reserve the highest BCS instance for USM */
>-        if (xe->info.supports_usm && hwe->class =3D=3D XE_ENGINE_CLASS_CO=
PY)
>+        if (xe->info.has_usm && hwe->class =3D=3D XE_ENGINE_CLASS_COPY)
>                 gt->usm.reserved_bcs_instance =3D hwe->instance;
>=20
>         err =3D drmm_add_action_or_reset(&xe->drm, hw_engine_fini, hwe);
>@@ -859,6 +859,6 @@ bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe=
)
>         if (hwe->class =3D=3D XE_ENGINE_CLASS_OTHER)
>                 return true;
>=20
>-        return xe->info.supports_usm && hwe->class =3D=3D XE_ENGINE_CLASS=
_COPY &&
>+        return xe->info.has_usm && hwe->class =3D=3D XE_ENGINE_CLASS_COPY=
 &&
>                 hwe->instance =3D=3D gt->usm.reserved_bcs_instance;
> }
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 17c0eb9e62cf..d6dfbd0bdc70 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -759,7 +759,7 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engin=
e *hwe,
>                 xe_lrc_write_ctx_reg(lrc, PVC_CTX_ASID,
>                                      (q->usm.acc_granularity <<
>                                       ACC_GRANULARITY_S) | vm->usm.asid);
>-        if (xe->info.supports_usm && vm)
>+        if (xe->info.has_usm && vm)
>                 xe_lrc_write_ctx_reg(lrc, PVC_CTX_ACC_CTR_THOLD,
>                                      (q->usm.acc_notify << ACC_NOTIFY_S) =
|
>                                      q->usm.acc_trigger);
>diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migra=
te.c
>index e8b567708ac0..c9c4d2428068 100644
>--- a/drivers/gpu/drm/xe/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>@@ -217,7 +217,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile,=
 struct xe_migrate *m,
>         if (!IS_DGFX(xe)) {
>                 /* Write out batch too */
>                 m->batch_base_ofs =3D NUM_PT_SLOTS * XE_PAGE_SIZE;
>-                if (xe->info.supports_usm) {
>+                if (xe->info.has_usm) {
>                         batch =3D tile->primary_gt->usm.bb_pool->bo;
>                         m->usm_batch_base_ofs =3D m->batch_base_ofs;
>                 }
>@@ -237,7 +237,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile,=
 struct xe_migrate *m,
>=20
>                 m->batch_base_ofs =3D xe_migrate_vram_ofs(xe, batch_addr)=
;
>=20
>-                if (xe->info.supports_usm) {
>+                if (xe->info.has_usm) {
>                         batch =3D tile->primary_gt->usm.bb_pool->bo;
>                         batch_addr =3D xe_bo_addr(batch, 0, XE_PAGE_SIZE)=
;
>                         m->usm_batch_base_ofs =3D xe_migrate_vram_ofs(xe,=
 batch_addr);
>@@ -374,7 +374,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *til=
e)
>                 return ERR_PTR(err);
>         }
>=20
>-        if (xe->info.supports_usm) {
>+        if (xe->info.has_usm) {
>                 struct xe_hw_engine *hwe =3D xe_gt_hw_engine(primary_gt,
>                                                            XE_ENGINE_CLAS=
S_COPY,
>                                                            primary_gt->us=
m.reserved_bcs_instance,
>@@ -397,7 +397,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *til=
e)
>                 xe_vm_close_and_put(vm);
>                 return ERR_CAST(m->q);
>         }
>-        if (xe->info.supports_usm)
>+        if (xe->info.has_usm)
>                 m->q->priority =3D DRM_SCHED_PRIORITY_KERNEL;
>=20
>         mutex_init(&m->job_mutex);
>@@ -706,7 +706,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m=
,
>                 u32 update_idx;
>                 u64 ccs_ofs, ccs_size;
>                 u32 ccs_pt;
>-                bool usm =3D xe->info.supports_usm;
>+                bool usm =3D xe->info.has_usm;
>=20
>                 src_L0 =3D xe_migrate_res_sizes(&src_it);
>                 dst_L0 =3D xe_migrate_res_sizes(&dst_it);
>@@ -956,7 +956,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *=
m,
>                 struct xe_sched_job *job;
>                 struct xe_bb *bb;
>                 u32 batch_size, update_idx;
>-                bool usm =3D xe->info.supports_usm;
>+                bool usm =3D xe->info.has_usm;
>=20
>                 clear_L0 =3D xe_migrate_res_sizes(&src_it);
>                 drm_dbg(&xe->drm, "Pass %u, size: %llu\n", pass++, clear_=
L0);
>@@ -1227,7 +1227,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>         u32 i, batch_size, ppgtt_ofs, update_idx, page_ofs =3D 0;
>         u64 addr;
>         int err =3D 0;
>-        bool usm =3D !q && xe->info.supports_usm;
>+        bool usm =3D !q && xe->info.has_usm;
>         bool first_munmap_rebind =3D vma &&
>                 vma->gpuva.flags & XE_VMA_FIRST_REBIND;
>         struct xe_exec_queue *q_override =3D !q ? m->q : q;
>@@ -1264,7 +1264,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>          */
>         xe_tile_assert(tile, batch_size < SZ_128K);
>=20
>-        bb =3D xe_bb_new(gt, batch_size, !q && xe->info.supports_usm);
>+        bb =3D xe_bb_new(gt, batch_size, !q && xe->info.has_usm);
>         if (IS_ERR(bb))
>                 return ERR_CAST(bb);
>=20
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index 35aeb50b7158..f660cfb79f50 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -333,11 +333,12 @@ void xe_mmio_probe_tiles(struct xe_device *xe)
>         }
>=20
> add_mmio_ext:
>-        /* By design, there's a contiguous multi-tile MMIO space (16MB ha=
rd coded per tile).
>+        /*
>+         * By design, there's a contiguous multi-tile MMIO space (16MB ha=
rd coded per tile).
>          * When supported, there could be an additional contiguous multi-=
tile MMIO extension
>          * space ON TOP of it, and hence the necessity for distinguished =
MMIO spaces.
>          */
>-        if (xe->info.supports_mmio_ext) {
>+        if (xe->info.has_mmio_ext) {
>                 regs =3D xe->mmio.regs + tile_mmio_size * tile_count;
>=20
>                 for_each_tile(tile, xe, id) {
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 076e9dc85838..465ffbe9d032 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -59,14 +59,14 @@ struct xe_device_desc {
>=20
>         u8 require_force_probe:1;
>         u8 is_dgfx:1;
>+
>         u8 has_display:1;
>         u8 has_heci_gscfi:1;
>-
>         u8 has_llc:1;
>+        u8 has_mmio_ext:1;
>         u8 has_sriov:1;
>         u8 skip_mtcfg:1;
>         u8 skip_pcode:1;
>-        u8 supports_mmio_ext:1;
>         u8 skip_guc_pc:1;
> };
>=20
>@@ -147,7 +147,7 @@ static const struct xe_graphics_desc graphics_xehpc =
=3D {
>=20
>         .has_asid =3D 1,
>         .has_flat_ccs =3D 0,
>-        .supports_usm =3D 1,
>+        .has_usm =3D 1,
> };
>=20
> static const struct xe_graphics_desc graphics_xelpg =3D {
>@@ -165,7 +165,7 @@ static const struct xe_graphics_desc graphics_xelpg =
=3D {
>         .has_asid =3D 1, \
>         .has_flat_ccs =3D 0 /* FIXME: implementation missing */, \
>         .has_range_tlb_invalidation =3D 1, \
>-        .supports_usm =3D 0 /* FIXME: implementation missing */, \
>+        .has_usm =3D 0 /* FIXME: implementation missing */, \
>         .va_bits =3D 48, \
>         .vm_max_level =3D 4, \
>         .hw_engine_mask =3D \
>@@ -548,10 +548,10 @@ static int xe_info_init_early(struct xe_device *xe,
>         xe->info.is_dgfx =3D desc->is_dgfx;
>         xe->info.has_heci_gscfi =3D desc->has_heci_gscfi;
>         xe->info.has_llc =3D desc->has_llc;
>+        xe->info.has_mmio_ext =3D desc->has_mmio_ext;
>         xe->info.has_sriov =3D desc->has_sriov;
>         xe->info.skip_mtcfg =3D desc->skip_mtcfg;
>         xe->info.skip_pcode =3D desc->skip_pcode;
>-        xe->info.supports_mmio_ext =3D desc->supports_mmio_ext;
>         xe->info.skip_guc_pc =3D desc->skip_guc_pc;
>=20
>         xe->info.enable_display =3D IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>@@ -614,10 +614,10 @@ static int xe_info_init(struct xe_device *xe,
>         xe->info.vram_flags =3D graphics_desc->vram_flags;
>         xe->info.va_bits =3D graphics_desc->va_bits;
>         xe->info.vm_max_level =3D graphics_desc->vm_max_level;
>-        xe->info.supports_usm =3D graphics_desc->supports_usm;
>         xe->info.has_asid =3D graphics_desc->has_asid;
>         xe->info.has_flat_ccs =3D graphics_desc->has_flat_ccs;
>         xe->info.has_range_tlb_invalidation =3D graphics_desc->has_range_=
tlb_invalidation;
>+        xe->info.has_usm =3D graphics_desc->has_usm;
>=20
>         /*
>          * All platforms have at least one primary GT.  Any platform with=
 media
>diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci=
_types.h
>index dd3546ba6f90..b1ad12fa22d6 100644
>--- a/drivers/gpu/drm/xe/xe_pci_types.h
>+++ b/drivers/gpu/drm/xe/xe_pci_types.h
>@@ -27,7 +27,7 @@ struct xe_graphics_desc {
>         u8 has_asid:1;
>         u8 has_flat_ccs:1;
>         u8 has_range_tlb_invalidation:1;
>-        u8 supports_usm:1;
>+        u8 has_usm:1;
> };
>=20
> struct xe_media_desc {
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index e09050f16f07..b8e22d50d30d 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -1942,7 +1942,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void =
*data,
>                 args->flags |=3D DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE;
>=20
>         if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MO=
DE &&
>-                         !xe->info.supports_usm))
>+                         !xe->info.has_usm))
>                 return -EINVAL;
>=20
>         if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>--=20
>2.40.1
>
