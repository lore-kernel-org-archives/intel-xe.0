Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B27C54EAA
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jan 2023 16:32:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5198810E0A2;
	Mon, 30 Jan 2023 16:32:07 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75EF689E33
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jan 2023 16:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675096325; x=1706632325;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=k5p1bSmQ03komUYkHRhnZEj3CDH15PXnntrDoQB1988=;
 b=E6VKvn28Lo6MAuNS7rISIQnQ4HX3rF4ater2UjHBDjMO5SwQpVj2SWHi
 OFyKcYszG6LSNnoz+8nnUJoqWz6UNu2PKhXpkD436S+MX7V9MOjzToP/W
 Qdq5f/lk2tNwSEmR5FBgTNXk4qJpzSVeBZY9IezIpGas+cWhjhjVTYp/i
 JpXvAICzP6z1ACbjcGlIzHtgZ59n9Hvi7nD3VdkqeskkG3qkjzmPZL4VQ
 1ElGq4ogd9wOL0ESaOT4j5OqSo8QYhY5RBoGB2NInoNvGcSSJf9ZRXwVN
 cq5vSpttge18WKmw3wmtL6jleQPpgcWj670vXpkldi6t5OBnNjRcA/jsi A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="325300198"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="325300198"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 08:32:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="806735249"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="806735249"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 30 Jan 2023 08:31:43 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 30 Jan 2023 08:31:42 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 30 Jan 2023 08:31:42 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 30 Jan 2023 08:31:42 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 30 Jan 2023 08:31:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n5J8H/OHOS5jTUfRTw/Yv3gspPjFK3zNVxBxfkLGSWgYG8rATDdvBebyhldkYW5E2++qeRT3EvHgNWphnubzUMlIMAxZT5sqRJw1f8/GJvzPMpeDBzr4TpJTWLflGPVTvZoOl3kA7ieN8xh2hMgZWAGAD+T+9sZg5Ux2Lrn0PncM43LxVwkji54jYUQ6U8YSe6ZBgCBWmS4g5qK9dKxZZDMO0k6QPDcHg/4yvKre++8pLTa2N5MXYAo56yfOdyd5lJJKQV1iSuhrNSIEhFyfCH2k4hjwEg24h2sq7erd5rsOY17BQip/YLloimw3K9ATi28TfECI1GuS+w2yGwUPeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5OPeWgJ92Ox00ZibWOecmk/2EM7q5/QRBI6+rQLVKUQ=;
 b=m5Y+9QtxUoS5buf3zlInyd1dW9/1IJ2+EareaMHkpuyF+iYS6g9Z5z7uJHTIhlh5P+JACRyX46v1oNL7HOeyY7ZoRQtXus+3xgIxlJxUkiYEYDRGuLZah0BpYLG/Kox/h7ndKnzkOvlBKSxd7Z9IQ/Ep/wLnRBh/0An5otpp0Z5Sm0Vq2bTPqy1mOOFFittkSkTnK/lZcaartdgC66hCVfRd290QsAR8Hj2N2kFUe+KKKkrK5hiqBY5XrDsyI33dKFb0q8vG97MNbXX+uoEhVVTHyLRhkb2dJgZ/dgn1X9ARmH02xRSfCN7CySR7Pz036fRgmA8GGql/QfqSNbE+AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Mon, 30 Jan
 2023 16:31:39 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a%5]) with mapi id 15.20.6043.033; Mon, 30 Jan 2023
 16:31:39 +0000
Date: Mon, 30 Jan 2023 08:31:36 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <20230130163136.rgfpddu44ucvpcca@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20230130161723.42602-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230130161723.42602-1-jose.souza@intel.com>
X-ClientProxiedBy: BY3PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:a03:254::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB8107:EE_
X-MS-Office365-Filtering-Correlation-Id: 85973252-5f4b-43ae-cefb-08db02df7634
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JEsyDnDP8/bzFCK3O4lYL99v/0wkZn1lxBVl/LnmNc9rPwFxRxGH3abW0OyC4EPLfvgJznNM3iQrVEmIgVL33d1sw0Y/VWPlNKaF5gJGPt9LW+0wqtUEJNevfubwvVgU34X62dyI0gyXdtagbKyaxb+wM30YRHpia8aJNLcgJ2eED85J4k1V/mOuxy/Jbg7U2Rvd4FXkxAk+fAVLUJY03/ZLqkIlbomHV+3WGO5yiPqgR3MUEivXVXhnSdC3F127IZ+CoU284atCctJMrP19DTkJmmeKmTJWRV66coMQSGL7zinbgw/kECC0UZr/YqRKFX9DLrQhjmMvqqjO+mw0vE2PQT3RkwyJXv/f/jLAswAQMntKk7a8+aVLDyPzWdY8dvHRi80R4ITbfJ+18ZbYnpE6dq4RFyJ8rPUItIOlwWdKH8zOvJvqu09F3OKtzBzhH9zJ2DHQ5nanAo+MA2QKHj6c8s1OvnX4qqDHNRk/zlST+qZDTkNOx7UhfoBj+S9mxo7H2nBmUTfvUMDjPK+l3i07YP3p1fCvU84UWRsf1u76GBflpaDgrzZqGGc2NEnvBfzKBGA2horORSaMFMAVNMi9biEbuDnqEY4B9T2HP4xAcU5Y5o+D+JxVKjum5PLDMPb6rR+Up5D/cjHxwS6Ttg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(346002)(39860400002)(366004)(376002)(136003)(396003)(451199018)(33716001)(41300700001)(5660300002)(8936002)(82960400001)(83380400001)(86362001)(4326008)(66476007)(6636002)(66946007)(66556008)(8676002)(316002)(9686003)(186003)(6512007)(26005)(478600001)(6666004)(6506007)(6862004)(6486002)(1076003)(38100700002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jgQDwk3NE6ytZPt2/QRbaZlYg3kE6pHK620ffV9RgyCh+rtKl649JU6oxy?=
 =?iso-8859-1?Q?4zobQVdma/HEVuL2QPXB7y+LVSgJmbVil6IKv+TTjVb8D43hjyvwXEwuIO?=
 =?iso-8859-1?Q?8DEVw7LQ9Y1ZyHwHzu8ClgZv6AI7yfcPtkc+eQ05JwA2hIinWQy/scdaM6?=
 =?iso-8859-1?Q?ahZZ7qU3LHD1ICQk92V4ZvzXT7OQhAWhJ9XpS/LKp9g0ttSTWjoziesEiz?=
 =?iso-8859-1?Q?WPf01Dua2fkZGMUAYBq1hDU/ENF3oTZyQIAeDSbTwxMpwlP6AsvBVjDxdn?=
 =?iso-8859-1?Q?rxKC1p6ntoF+LL6Clka4rT1jDGGeNnSsv/LXffy5xehs+evnFqWetk57lW?=
 =?iso-8859-1?Q?3D5+wxRGc7iGqRx6miI8XP7kaR7tzkVnULBD4+kdOYXmYkNWb5xOmtUSE0?=
 =?iso-8859-1?Q?mO8wu5gwNZWB+U1Fhe0sZZuGCF59Njn985NRmED0hS1GF/ywXsTRvLTaxB?=
 =?iso-8859-1?Q?5Fi0gz+2a1ZhfiaL7QeXVNOBvqOWiUz2zT7IppU8QMH1U42xAQCiZcb28K?=
 =?iso-8859-1?Q?XlKVAlpT5xXwyiUdZ3I638wWtTJsqLiZ8AwwSPgKH3A0Ql+3nyRq2SExG8?=
 =?iso-8859-1?Q?0FoRkn6LLgkbau+OGesA/JT/TQ9F0iI/N3mESv8RHE3oOraUzPiN1/uX2b?=
 =?iso-8859-1?Q?H01GwlJarjwdnp1CchTegJM7xoSe8O7tBodWm/CytIqyRmCkprgrA5wnCA?=
 =?iso-8859-1?Q?N7G1BS5hIU6A2obvFEHaDLSFY2YvM4t8Zf8eLrhGe1t7j6oviF9FWHYEtL?=
 =?iso-8859-1?Q?iYkV3bOrpDyb3Dcf3bZedA+9FqYGWf6sxU7iwK6CyseiOGkSd0oZ/4y4E8?=
 =?iso-8859-1?Q?j174G/jVZ/qo5CAOiqc7qIfTmc6B7tToTS2T9NHuq8Vog/FI6622vkje/C?=
 =?iso-8859-1?Q?YQ5pjTIkq3R22y5QDhIpqzn7mgInGfLxclCdSc8EOFeBg5+wR+JNQLebQ1?=
 =?iso-8859-1?Q?K75QtSc1y5v+oPlk0HXWCsN69i4/uD08CfHTzcvWUjzxQpppUBO9bbnI0I?=
 =?iso-8859-1?Q?WXFxJNq3K2z9vJKDIz/FqBsZuOyEhLD4QOCyNLmCH6eOuG5JogPGY/A5D/?=
 =?iso-8859-1?Q?cKH6kSF2ekVgmVQJU8xDSPuKuKqBh566D3JiOQoyF+35l5AvlqsNdqTnSn?=
 =?iso-8859-1?Q?kgAiCx7PLcntg06bwovZI1kZuKd+Alvu8QDIt2Sy7gGgtmc90Be5T9IIFW?=
 =?iso-8859-1?Q?J/A3W8vAg8z3NsBBn5Hyr78khwm6Zt5ybUf3Ijd9EDgBaa2tX2TWQPxZax?=
 =?iso-8859-1?Q?Xs5pQMARTJTTD8O6R/YZUXzr+mxKzJNtSTFXvYthx3DVu3xbaPbL7Dor0v?=
 =?iso-8859-1?Q?+0udiM7laY05MLjgAxVYOIBDEIKWMOHPq0oteOXa+ntd6/mKFI8iDkd6q4?=
 =?iso-8859-1?Q?b5Qsa1NXt24P65YI8P4bCqbya+gUGVBEdQKExXUNmkiA8fPg3+AugovrSn?=
 =?iso-8859-1?Q?26X/223l3sxPjkdFqEWrs7erZ/FT5cNYCP9lvs8ffbcSC0BDQ1VGX+yWrX?=
 =?iso-8859-1?Q?s77KL0WkpamwzWhh+JQO5Q9bwlzVwZrSGTig/z8VCOSAfNT8OQV1VdvbQ4?=
 =?iso-8859-1?Q?fqRLH4isK/XSf34wP8QoAD4NSSzazl0+Hakw2sr3UK7dlvem7xEuli/Kpf?=
 =?iso-8859-1?Q?mlrCwoH2J4R4BayUkGXEaAVLTPorwzllmR4joXCN8HnklxGX3bJVPlhQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85973252-5f4b-43ae-cefb-08db02df7634
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 16:31:38.9535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3YIIqh/jTaU75bq0KoyQKAtXj+idNe5bdRZsEJATTe3Kr4zao/NMQRiJ1g4DgFixFEgYZyk74Bj3pBZV2RqJdatAdsg6yE43SvwdrgFWUFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8107
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Add fake workaround to maintain
 backward compatible in MI_BATCH_BUFFER_START
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

On Mon, Jan 30, 2023 at 08:17:23AM -0800, Jose Souza wrote:
>i915 has the same fake workaround to return MI_BATCH_BUFFER_START
>nested batch buffer behavior in DG2 and newer platforms to the same
>behavior as older platforms.
>
>So here cleaning up TGL_NESTED_BB_EN in MI_MODE to disable third level
>chained batch buffer level.
>
>v2:
>- replace IP_VERSION_FOREVER by XE_RTP_END_VERSION_UNDEFINED
>- move fake workaround to lrc_additional_programming table
>
>Bspec: 45974, 45718
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt.c |  1 +
> drivers/gpu/drm/xe/xe_wa.c | 28 ++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_wa.h |  1 +
> 3 files changed, 30 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 84a73eeccd297..5d07e1e7bd506 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -311,6 +311,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>
> 		xe_reg_sr_init(&hwe->reg_lrc, "LRC", xe);
> 		xe_wa_process_lrc(hwe);
>+		xe_wa_process_lrc_additional_programming(hwe);

it's in a separate struct just to avoid mixing stuff, but it should be
handled by xe_wa_process_lrc().

>
> 		default_lrc = drmm_kzalloc(&xe->drm,
> 					   xe_lrc_size(xe, hwe->class),
>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>index 3325de3edf691..744b7d0982683 100644
>--- a/drivers/gpu/drm/xe/xe_wa.c
>+++ b/drivers/gpu/drm/xe/xe_wa.c
>@@ -288,6 +288,21 @@ static const struct xe_rtp_entry lrc_was[] = {
> 	{}
> };
>
>+static const struct xe_rtp_entry lrc_additional_programming[] = {
>+	{ XE_RTP_NAME("FakeWaDisableNestedBBMode"),
>+	  /*
>+	   * This is a "fake" workaround defined by software to ensure we
>+	   * maintain reliable, backward-compatible behavior for userspace with
>+	   * regards to how nested MI_BATCH_BUFFER_START commands are handled.
>+	   */
>+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1255, XE_RTP_END_VERSION_UNDEFINED)),
>+	  XE_RTP_CLR(RING_MI_MODE(0),
>+		     TGL_NESTED_BB_EN,
>+		     XE_RTP_FLAG(MASKED_REG, ENGINE_BASE))
>+	},
>+	{}
>+};
>+
> static const struct xe_rtp_entry register_whitelist[] = {
> 	{ XE_RTP_NAME("WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865"),
> 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
>@@ -362,6 +377,19 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe)
> 	xe_rtp_process(lrc_was, &hwe->reg_lrc, hwe->gt, hwe);
> }
>
>+/**
>+ * xe_wa_process_lrc_additional_programming - process additional LRC programming
>+ * table
>+ * @hwe: engine instance to process workarounds for
>+ *
>+ * Process additional context programming table for this platform, saving in
>+ * @hwe all the registers changes that need to be applied on context restore.
>+ */
>+void xe_wa_process_lrc_additional_programming(struct xe_hw_engine *hwe)
>+{
>+	xe_rtp_process(lrc_additional_programming, &hwe->reg_lrc, hwe->gt, hwe);

move this to xe_wa_process_lrc()

>+}
>+
> /**
>  * xe_reg_whitelist_process_engine - process table of registers to whitelist
>  * @hwe: engine instance to process whitelist for
>diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
>index 1a0659690a320..872f3e4ddc73c 100644
>--- a/drivers/gpu/drm/xe/xe_wa.h
>+++ b/drivers/gpu/drm/xe/xe_wa.h
>@@ -12,6 +12,7 @@ struct xe_hw_engine;
> void xe_wa_process_gt(struct xe_gt *gt);
> void xe_wa_process_engine(struct xe_hw_engine *hwe);
> void xe_wa_process_lrc(struct xe_hw_engine *hwe);
>+void xe_wa_process_lrc_additional_programming(struct xe_hw_engine *hwe);

and drop this


Lucas De Marchi

>
> void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
> void xe_reg_whitelist_apply(struct xe_hw_engine *hwe);
>-- 
>2.39.1
>
