Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16352C197A0
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 19:47:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D316910E0BE;
	Mon, 20 Nov 2023 19:47:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AFC510E0BE
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 19:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700509672; x=1732045672;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=oms0bAAf5eQ1vajMg74MVhlGt4NS855jRCoxiLvQ06E=;
 b=a1iE+rcdz8ipK3YlWpbcyCZgwyPdcmRbLIzFKbxHZLQGVF80v/uTOB/3
 /WWzHIAVmPHg1s++TyLQGf6S0zHuJxGr5GL9Eunz8tTmhdPrSegRLD/Rt
 eI7yqWBnnTBy0ILKEE3vZU6srzn9YY/KI7tABqZkmZEIYuLNF4SBkphW+
 y3W4pfDuYC0cKCzfhMp21VQBD0xwvLWcJRxk+X/532yX+Jqq8uVAmg3Y+
 jBzrA5Gv1v/XMXtu14T4lCliHpQ8PeLSFi1fd8/xxHYhK8tp7Sm1Ml5Ie
 XB0npetw6eTcciapsTG07W0+M5nEQrmkL8KJZabb1DERNhvItg7r0TG95 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="394537049"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="394537049"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 11:47:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="1013682742"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="1013682742"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2023 11:47:46 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 11:47:47 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 11:47:46 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 20 Nov 2023 11:47:46 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 20 Nov 2023 11:47:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E59g6/1IiHvxHhNpO/UNHLB1rY+t4VqdrFmlvAPVBe3+kwFQezHvDV5TbiBh3n1BA+Ry6JaZIqegmpQAAo85xxi1IPB/p1ssQOMuW4v8zX28avg8TkIN/ifefsMr4SKqffvQyCkqjyxXFdOcZDsjwfJbR8tcMpkPF5H0w+90Vk5RZEQuAI/v3kHlMeJi0CB5MYU1K3qlh5qdG8qSYUOaxNn5NRLDrO/umCGZasLMr89U4PxFaYyhqHcfEDUzua075v5DOr7IPeTurT+roOEekhkjrsYPnR/pMrNc7tMOLc9lu9adGmm7aIsx0D6LoPisNk19vKMA8D4KAboFFb9KSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iL7ayfSvXp8Y+FQFh5tM2LFZ/vmCi7D98PmzqnvcvRk=;
 b=Vl652RX/czgCHo7RaI414egeVUe/NzKkgpghcuGaMI/0TdKac6qwO0kxBVuIefVR77e2holbDkOO02tH8AX/hhoeQ57KSjySEEd6j6xiKBiPJOLHzr6BzwvwrBF6IRNYs37a6qbWrJcAkwPxq4UTr1Bg8w06vqi/CtnjUGVNEoLydncDaAOJTwJ1Ujad9F7YYPzwtTnSOPAjDxXrfEsIL8962sS17rez7Ug6g0v/cQLEs9voteFWD0B1Oe3yc5zIYYR5G8wpmUnfHnCB5KZpMiKI42Kn6E+hEAstm3g8ZeRAloz8+YKDzsSsfzpvii66cv0UKZwzPyjPPz1RrxLL1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6309.namprd11.prod.outlook.com (2603:10b6:8:a8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 19:47:43 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7002.026; Mon, 20 Nov 2023
 19:47:43 +0000
Date: Mon, 20 Nov 2023 13:47:41 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <3i2ylxjl32ne2kgtt2p4gplgnvhp4zadfsxnglz2ldpzbgw4iw@2frmzgiq47an>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
 <20231114130231.2299661-7-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114130231.2299661-7-michal.winiarski@intel.com>
X-ClientProxiedBy: BYAPR08CA0062.namprd08.prod.outlook.com
 (2603:10b6:a03:117::39) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6309:EE_
X-MS-Office365-Filtering-Correlation-Id: d962f1da-554c-4ead-0733-08dbea018fa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kLqgNYPuHthfHYJUzxsAvuf2Lwlp2pRmNXtn9RrTVW4yiLOFrUBosMVTxjL7Omld/SnTJANMaAnDJ+uucGVeo33M3wIrxkptSfDvzvL+ZBLerO4cjf2wyAokH4uiW/uExPo2BjIrN34sE2Brvtkpflg2JO0kTb3KryxgMDc45l1yCaymBacvU6FOvG+adJ3NkpRHd5ULdTFHUzjwdy0sJL3TBfp50gDBmaEcpMrxk7oVFcTwRAsq11evyQeOKrpUko2P9fdVZyUrxX9+Ky0z5KbrtcqaeU6xHYoenrMfSdhtqEdtL8I61n1/HMlnu51+bveZlsXQvKxeomSEnzvVsOmB9qWMLUiguYg1IqK6Npng8GTGohIwBjQ0gKVFGMygG3n9lTGLrp6BkLbOxRw99UzHPXxUwqMkeaukKPf7cAMoqKE0kB/a1vKPawOh7gsCjI0EB/GbliAJlIk+Ln4NT1d1jREQdadH82gAHH1Pfz4g7RLrUK50eZn6j1Xd76eB8FCSF1ZEI0lrTJOoxgK6qLhJIGYfdmbTE2igc/2UnfT2S7x9oKDPcb429+LVja80
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(39860400002)(366004)(136003)(346002)(396003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(9686003)(6512007)(66946007)(66476007)(66556008)(6636002)(4326008)(316002)(6862004)(8676002)(8936002)(107886003)(478600001)(26005)(82960400001)(6506007)(83380400001)(6486002)(33716001)(38100700002)(5660300002)(2906002)(41300700001)(86362001)(66899024);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlRHa2Jib3cyY0FWd01NT1lJV05QOHJyVFVreHVEaENMSjFXNnlXTEpLamJZ?=
 =?utf-8?B?Rmx3YVJJcFU3MjcvbFFGMXJXUkQvMlZKa2NOU05VR3lNeTVKR0VZR0JDRENr?=
 =?utf-8?B?U1RvcUtpTUg3d3QxY2hpQ0hpUFhmd3oyMUx3Q1lwcVA5MmFiellXY3dFd1c4?=
 =?utf-8?B?RUhERUk1UXcyd1I1ak9La0k3REIwWGRVYWw3dlVjV2tWaXZWSDRrOG9uYzIy?=
 =?utf-8?B?Rm82dHE1M2xDalFpVk95N2twaXdZNktUM2tobUtCWkFGV1p5MUx3UnFvdkd5?=
 =?utf-8?B?UkRuWUtvYVJHWjZzQnFTSU1NUU90bDlNOXJpZ00xa1R1TEc3NGYzTk90MHo2?=
 =?utf-8?B?T2tBMm1SS0FRanY3UjNmNnZRaVNsNlJqSEp3bUltOGxVVFpaS01sNmFEUEJQ?=
 =?utf-8?B?Yk02TVYzbml3cnk5MlN4ZGJQU0EyeTdGVTFjcnFwNFhrRWlXTlM3Y3FLSXRw?=
 =?utf-8?B?d3lsSmZlZHFVc2FkdVdyaU44MFRBdGVnTHJhRy82bCt1MW1rMWZINXlUVVph?=
 =?utf-8?B?UG9YenRXeWlvQU13U2l4cmVWSDBMVFlEeUJzc0prNHVkeVV4bFhRWmM3SkhP?=
 =?utf-8?B?a2tpZXR1dCtMSTZnVTBIYVkxZHJJYU94eUpmM1gwZ0Yydmo4TWhja2tJQUhZ?=
 =?utf-8?B?L2ZJME4rZDdsL3R1eXIzMHVmODJNaHJadEdKS3VrMU1VR0pTb3FlWVhYS3Jj?=
 =?utf-8?B?ZFJiK080R2o5TUJrN2tWbUw0dU1aMWVrV1RjaUU1NFhiNk4xVFRhb1lUZFpv?=
 =?utf-8?B?VTZoM3RLdHY3ZWFSSzFYS2doci9YZkVpQlJIS0JvVVptdzloVWVSbWp6SjNU?=
 =?utf-8?B?MWJvQVJ1RW1sbnBwVGpYdWJkWStMcHo0bDBaNCtuSkJsYUF3OXB3VitrRVBM?=
 =?utf-8?B?Y3J1WjdLWXVXdkxlQVcyd0pNbnlseGQ1bnd4QmlML1ZOR05tM2t2dlBsMlBJ?=
 =?utf-8?B?KzlVNzJ3SUE0THNjMklaSitJOUE2cVEvU0pOczkyZmphWXAxQlVTcXdlUGtH?=
 =?utf-8?B?bWVEMUkyRGtrM1ZGTGlaWmV2REZoQk9ucUI3SkRaVTBocWVndWhWWS9Pc0lT?=
 =?utf-8?B?QjR1ck5ZbWdKZGxjWkI3WEFHVzUvZ1Z2L2JyamZqVE1wUUlNN1M1WFp2TGV0?=
 =?utf-8?B?ME5CdHpoQnFmcWlnMk5OaEFXeHRmdk9tT0pwaE1PTjB2Q0V4YU92b2haZjha?=
 =?utf-8?B?Y3dzQ09qcFJYdmxJTEdXaTcrcUxoMnBuTGNLN3ErTkpDN1J1WkMzM3FtcVpv?=
 =?utf-8?B?RVk4SUpuamlsMyszYWVLMkpvTFNiQ3c0OTNUTG1iTnhMOUhmWHdhNFUveHRN?=
 =?utf-8?B?dUl0SG11VnpSVVZ2UmxkbnVxWXREdDY1b0lRYjdTSkJKMTdENUE2SHBKZ0Ry?=
 =?utf-8?B?MzRjUW9XTy9NeEpJTjFMQ2hzMG1maDRyUlQ1SzAvT0U1Qm1pRy9pdmVxd2ZC?=
 =?utf-8?B?RjJHNmJ3cVkxeG9aNnhhRG14Z00vQi9WblAxWXBWL1A5K0lKa1ZjMVRjY2Ft?=
 =?utf-8?B?OXJxY3VON0VmWmpaZncxN0tlcFA0VE0rcG1RenU3c2NlOVlraHluSGZpaVFt?=
 =?utf-8?B?SmQvN21qeHNSRURBZWs4a3BjN016bTBvYXkwdFN2Vzg1NGdZY3JMMkJ1U2Z2?=
 =?utf-8?B?ZVVWYUd2NDBTbjNFVW9GSFNsQlpYUjk5MVR5K2Y5aStNd29DVEZSLzNWcXJi?=
 =?utf-8?B?VEhVbEllSU5TM25DUDVUS1pyZ3lxSDI5ZnJycjdiaHpQS1dDUEtOY1lWUmtQ?=
 =?utf-8?B?emhMYnRsbHZhM21RTnRBV3B2ZzFtTS9ma0tJS3lldnloSENTQVorU3lHWVVw?=
 =?utf-8?B?TTV3aEl1WEsraUlseW1iejlSd1JSNUthTjBWOWZHTTJrUzJ2d1h4Wkdnem5t?=
 =?utf-8?B?R3NxWW5oM1N4RUJmRXFUNFgxZUZzZ1RQRnl4aCtvazB0RG5ZbHFWRHBVQzZz?=
 =?utf-8?B?dFRYdGh6ZE4wdkdJeGdWUWloQVlFWXVXNm40WDhSdSsvQWlIMlBvTTFoWFBI?=
 =?utf-8?B?V0x4TUdObTZkQzBoeWxkVVNwSXdvU0xOekhFaWZxMFg1WXd1UVdDeTBzaHVm?=
 =?utf-8?B?d3RSZzh5c2d0K2ZaczJxM1N6cStERWxFZFYvMjBqMTJCOVdpUE1JVVorVGhY?=
 =?utf-8?B?N3VmazNDd1VWRDRUN3BVSjVwUG53ZkJXMnNuYzRZaHZmcHdTamdRYi9EcS9P?=
 =?utf-8?B?M0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d962f1da-554c-4ead-0733-08dbea018fa3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 19:47:43.4912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gBuinlyKamXbJMduUpNPLrPVO+o+H6ZQB2nX9cxagoK/g4PZ0sYWN9Q8Z3wILyHEoLHqsaVnoNqr0JdbxBBATdtNdPoTc4TkqMwEM2psEl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6309
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 06/20] drm/xe: Split xe_info_init
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 14, 2023 at 02:02:17PM +0100, Michał Winiarski wrote:
>Parts of xe_info_init are only dealing with processing driver_data.
>Extract it into xe_info_init_early to be able to use it earlier duing
>probe.
>
>Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
>v1 -> v2:
>- Add comment to "early" variant (Lucas)
>- Move xe_info_init_early usage in kunit to correct patch (Matt Brost)
>
> drivers/gpu/drm/xe/tests/xe_pci.c |  1 +
> drivers/gpu/drm/xe/xe_pci.c       | 41 ++++++++++++++++++++++---------
> 2 files changed, 30 insertions(+), 12 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
>index a40879da2fbe1..733df9a270db2 100644
>--- a/drivers/gpu/drm/xe/tests/xe_pci.c
>+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>@@ -143,6 +143,7 @@ int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
> 		return -ENODEV;
>
> done:
>+	xe_info_init_early(xe, desc, subplatform_desc);
> 	xe_info_init(xe, desc, subplatform_desc);
>
> 	return 0;
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index e6b59c4b02bdc..d603093f32274 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -532,7 +532,34 @@ static void handle_gmdid(struct xe_device *xe,
> 	}
> }
>
>+/*
>+ * Initialize device info content that only depends on static driver_data passed to the driver at
>+ * probe time from PCI ID table.
>+ */
>+static void xe_info_init_early(struct xe_device *xe,
>+			       const struct xe_device_desc *desc,
>+			       const struct xe_subplatform_desc *subplatform_desc)
>+{
>+	xe->info.platform = desc->platform;
>+	xe->info.subplatform = subplatform_desc ?
>+		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
>+
>+	xe->info.is_dgfx = desc->is_dgfx;
>+	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
>+	xe->info.has_llc = desc->has_llc;
>+	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
>+	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
>+
>+	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>+				  enable_display &&
>+				  desc->has_display;
>+}
>
>+/*
>+ * Initialize device info content that does require knowledge about graphics / media IP version.
>+ * Make sure that GT / tile structures allocated by the driver match the data present in device
>+ * info.
>+ */
> static int xe_info_init(struct xe_device *xe,
> 			const struct xe_device_desc *desc,
> 			const struct xe_subplatform_desc *subplatform_desc)
>@@ -544,10 +571,6 @@ static int xe_info_init(struct xe_device *xe,
> 	struct xe_gt *gt;
> 	u8 id;
>
>-	xe->info.platform = desc->platform;
>-	xe->info.subplatform = subplatform_desc ?
>-		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
>-
> 	/*
> 	 * If this platform supports GMD_ID, we'll detect the proper IP
> 	 * descriptor to use from hardware registers. desc->graphics will only
>@@ -573,13 +596,8 @@ static int xe_info_init(struct xe_device *xe,
> 	if (!graphics_desc)
> 		return -ENODEV;
>
>-	xe->info.is_dgfx = desc->is_dgfx;
>-	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
> 	xe->info.graphics_name = graphics_desc->name;
> 	xe->info.media_name = media_desc ? media_desc->name : "none";
>-	xe->info.has_llc = desc->has_llc;
>-	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
>-	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
> 	xe->info.tile_mmio_ext_size = graphics_desc->tile_mmio_ext_size;
>
> 	xe->info.dma_mask_size = graphics_desc->dma_mask_size;
>@@ -591,9 +609,6 @@ static int xe_info_init(struct xe_device *xe,
> 	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
> 	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
>
>-	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>-				  enable_display &&
>-				  desc->has_display;
> 	/*
> 	 * All platforms have at least one primary GT.  Any platform with media
> 	 * version 13 or higher has an additional dedicated media GT.  And
>@@ -712,6 +727,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> 	pci_set_master(pdev);
> 	devm_add_action(&pdev->dev, xe_pci_clear_master, pdev);
>
>+	xe_info_init_early(xe, desc, subplatform_desc);
>+
> 	err = xe_info_init(xe, desc, subplatform_desc);
> 	if (err)
> 		return err;
>-- 
>2.42.1
>
