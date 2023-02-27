Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C1EC64ED8
	for <intel-xe@archiver.kernel.org>; Mon, 27 Feb 2023 22:06:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F6110E198;
	Mon, 27 Feb 2023 22:06:47 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06DFA10E198
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Feb 2023 22:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677535606; x=1709071606;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=By04gfH27A6oR2ZKe5ot3BFInsCOFELB81QXE+Ay1Us=;
 b=c3m6VIwQIjOd5Z5eFIIeeYWa1VRZAYn4gUq/+F15yeEeEMoYZl/Csb0B
 X/QmFN7BmeCYE/mC2t3lHlp+ubHjf2M4YOGuunv3+84ypGSa/JyKQt6IJ
 Q1upvo5wwLtBXXiyWNsCCbnq3XDfI0+we2JfnSYd+zhYkvdbGDnamhFu7
 8GSZrP/bJZGoFVKDOkhbI/ZRVT+vL3c6drmU7XhS6EEymFA9b/PPu5xMw
 JlbBJxi3WzxEm/IlFXOlwSNX17y3sjUCqPWEGWj8ewvRqjtyLlEPx9fFq
 pazNvcvtI5Bd6ovGapXu4ewjLJhSdU+C6F3ixEWjyn1McRrFR39QZE8gm g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="398755887"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; d="scan'208";a="398755887"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 14:06:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="704186763"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; d="scan'208";a="704186763"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 27 Feb 2023 14:06:45 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 27 Feb 2023 14:06:44 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 27 Feb 2023 14:06:44 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 27 Feb 2023 14:06:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FmBYabvP7TRfJRdAMZv9aG4FXdIiLtxFMxMCYQIEoWtTaoqv47kKvxRHHPoTY10Ong4mIdIEGgGaFNu/Jakm7MFFn/ffDb2/6dSEbaCMJYeNRIh5BV05nMgLs+2CwygDwfsWLFoDtyyUm+nHzetmJUkd1u1iLBzsKxnwLqC/HRAPrHOWESJHLZqDBcGeWHyUBylHKv8vusB4exLyFcdGteg1Extuel/gv9ESPbaHecNfLYPS1souipqUh39MpRUzszIV6PP9Bho1Z89f/OqWwNaanol7TVE4Dwthcu81q5BamEdTGhyuHQJYnRpbBBrTWwczXEExv+C9wyn02uGeFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9s0ANC04gsKG9+vLa/jiFOs+oi0/KqjTRIg5x0ZN8IU=;
 b=SoMOlPIvVHVAj/oTEY4XqwT44zcgY2slJ453mw3ZpezaNfuGhLwrWES9mE9loRCR6vy1LUZ3Ey6h17idqt/oBNwK3Rtw21ENwQw7wAtUbNJaslrUxC6d+YTTjPL2z7Qa+JtKgGYcHaLZUjWplsrsE9ZqoJO8hTUYEwxAlIohRxB7oZXMMAyxBnqL7Am9GkkoBPnin4RyFYhVAV25FOyJ34E7w7JgkinsRrYVCvZAvMoDClu8TDYmreJJS7jE8j5M8lN63d7fQ+BF7nwQbJV3DmoChA8l37mnbx4VE+/V4XxNWfQCqlqrwoSrstUeq9zIIZWEfKK7hbPtion4VnU2AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW5PR11MB5762.namprd11.prod.outlook.com (2603:10b6:303:196::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.25; Mon, 27 Feb
 2023 22:06:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%5]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 22:06:41 +0000
Date: Mon, 27 Feb 2023 14:06:37 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230227220637.zgvmxj545ibjljok@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230223185740.3356127-1-matthew.d.roper@intel.com>
 <20230223185740.3356127-7-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230223185740.3356127-7-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR02CA0003.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW5PR11MB5762:EE_
X-MS-Office365-Filtering-Correlation-Id: 8434247b-0d36-4f37-2ce3-08db190ee7c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0rMRY/GuA9TTrrx7WF+D3RoRJUzyNqpeqcblOJCUIJSvqqb6MsSUaAMjTtVOWi8s3eyZjVxvBUIbc8jN/NGOlt9U5xBucTZqREXirVfsdtW8g0HLIqoQYzoTd3vNPy6CxBYYNt0q4BL18ZLdlH/kccdSDW0dCuT3N0m4etTImw3ndbvSKVPH7tnPF/hFEn3vVxYccT4UkzwMsWoKZp39ux3q/mBmbBG3t+IFfrNTq26txlH/3ZKllNv2Mpl437sEcyokL3ltF0MSEXJdzgw60B+DcOoWnL/5zPewkP1tYxutlDUmf2IeuYYfPSHVMZ84aLYM8dsjjgZcfSauU3Api1dlkRA4uJVnBkkXovFo8I+9MAKk1c3SDHMU8ojz+98W3hYiZh9fQOrOGjaeOIqRv/+oo3fPgkhVA33fbyyr/iJaCJmMrQEDxPLbH1KjFlqcuQnFXVDAS/pX+kRtghHVj5bqekRi746CCZXPxK0CNg0uZpOcFVcPgaQ5IMUMYJu04654QfjFZL9twJb4+3WX1h9x6OKeVUQALiAeS9VG5zWFO64dkw/bHs8EaHP70Wda5rQ9fbXWsP/EzDVfqJgKMGPvoO946mFpPlbEsqXUhWjsDYtxNNtGF6aCDDviiL5M1hGvWyDlLIh7kwz41kXZxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(376002)(346002)(396003)(136003)(366004)(451199018)(1076003)(83380400001)(82960400001)(38100700002)(4326008)(41300700001)(2906002)(66476007)(66946007)(6862004)(8676002)(8936002)(66556008)(6512007)(6506007)(26005)(5660300002)(9686003)(6486002)(6666004)(186003)(36756003)(316002)(86362001)(6636002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NjEpgEmDYlyaZjjoUJQ3BJodyApeJkEM/zL0AeJVpT39ipmxRVI3RNq6a1NJ?=
 =?us-ascii?Q?a6Gdz45kBgKZEAMBKoF3TKdWgVk9xgPFXdSfHKTFA/3I2KKuBkzEZGLk5msc?=
 =?us-ascii?Q?7eRn4S7u1Vp5g9vyZXoRISFNCED6lliZ3u9HJzh1EE+hTCGd8U8v3ZbwnbVt?=
 =?us-ascii?Q?47Oo7ta9OQmAxH3Ai2i/MP6pj3Pr9gvibiqV5jsNQpZ0v6/yteQKpCaoh6IX?=
 =?us-ascii?Q?bPArT+3MPUDjt6Hd7LGTmRJjT0UMju21zloC/rB9ifF/Bgu9IVBo1VnKBqiB?=
 =?us-ascii?Q?titEd0bDdBlcqE1nNnNI2Clk8Fe9fLElON7KflMA+BnIsGd/vQZO32ehjwZW?=
 =?us-ascii?Q?z9vpiUpGwQrO4/EO90v8pOVVRXjD3GPLNHT7n1n0rc4fq5Ia/TJkC1o49faj?=
 =?us-ascii?Q?mn6ZTd+OpqkA5432pHLPiLipYm5HErc7AfWZtr5Ah9QFBqbLimiwqsLxyFu/?=
 =?us-ascii?Q?1RvBymwXzz8qYLdp4o8vB+7uBRmyQnik9rdtIX8puGv8bzmhcQwkKIksMtDx?=
 =?us-ascii?Q?wS9ykFLCTyLrNWNq6Xluihlg8RnWqzw/o5z6jDiVIv9jcVs70l9HPyNBUrFP?=
 =?us-ascii?Q?Udn6xIcV2IcLO5GUsHAwkeH+ES8PF8WtTACuIZgbHylWtsTzDp/EsiFnwGoF?=
 =?us-ascii?Q?4k9rbYrAkxg+10XvP2s+HdfJGKiuldNfD0pcHNrxRejPtfBjEvHUjhnKRtiS?=
 =?us-ascii?Q?tK4URSStwddbU0hYL9enFPJXbHSWExFSC3GZGeWYtzpdzEdeXSxH+h3yx6F0?=
 =?us-ascii?Q?RCtAoScd0ehjXn1rAHx921n9ao1klkRErMQxPAjgqvdZAndVyglN8/Z+eCCo?=
 =?us-ascii?Q?XvkIzeBDiB35syQPrffi9fM8lEsZqxdAtXk+lnmYX4Q2fnylZBoUOGCYQgw0?=
 =?us-ascii?Q?90tbZ6zbH5RFKePjFyL9nWfK1afbzHNMr8tLqPPL76riQAUiZkAdhcsniMKt?=
 =?us-ascii?Q?Jf/eovAwT5+rnTvmghvFxdclTZTn+CzqIqE5zg5CWx6wJLNH4MX78m8PRdje?=
 =?us-ascii?Q?ccgXL9CwT0OkvRlijba+wArWAerK3rGkzmglG7W6CyrVpvB8y1h5dteETHA6?=
 =?us-ascii?Q?GFu/DcUE4F63f/pV0ItBD6oWXwI5j9hhijanlQCJ2vhVLNJ5JPizPXX18uKi?=
 =?us-ascii?Q?9a+dBT/eJ6fTaFj3I7lVom+g+Zaj6+yDDJEn/7UyOJdRp7+F8qEH2xCEMtTw?=
 =?us-ascii?Q?QwKiZGVeTNi1oxZoq22DYRZVnZAq/BiuynqiAX0pNiJfTXxRhU2hfRenBG62?=
 =?us-ascii?Q?6cwl4hwbK8jzqZCFS0RnMxe4HnYUv1TorxNcVSz0bXPh1zq9x48aSTlaUw9/?=
 =?us-ascii?Q?w8MtMeVguBNoF+TBSVquCyLk32j4ynF9fX6TSj6teXv13WOTmZyNEyPwu6jv?=
 =?us-ascii?Q?4VnRRrga+UNLL2QnZBzhvcSIS2JwedLg0gvqbis+cS2HNW1/K2+zP455mdb3?=
 =?us-ascii?Q?6KfOINSqCGUPUiLKB76E8r04P1LzKs+fuzJDoOCSZVDZaa6kDOVbndrpB/w/?=
 =?us-ascii?Q?tIdWL41JMIrdrBw0w3J2sujmOByl5DguJ/eiJC1hRrRqSFcZ274YDJRxqoWD?=
 =?us-ascii?Q?MwbOEG73318Cat7d9Y+vPrrZskfMdr/H7re5OkZnGEOYl121ZxDajl7pUYwB?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8434247b-0d36-4f37-2ce3-08db190ee7c6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 22:06:41.5098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4IRZp2DbLXYJl1kLB6bwEl04lcnqaquIvho03ldPSJh3fl/8EtPsB8CJCj+zKyL3ih25xcJhrB4+1ZhkNZdGcb05+7KVhCO3mQcR7VknNjw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5762
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 6/7] drm/xe/mocs: LNCF MOCS settings only
 need to be restored on pre-Xe_HP
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

On Thu, Feb 23, 2023 at 10:57:39AM -0800, Matt Roper wrote:
>Reprogramming the LNCF MOCS registers on render domain reset is not
>intended to be regular driver programming, but rather the implementation
>of a specific workaround (Wa_1607983814).  This workaround no longer
>applies on Xe_HP any beyond, so we can expect that these registers, like
>the rest of the LNCF/LBCF registers, will maintain their values through
>all engine resets.  We should only add these registers to the GuC's
>save/restore list on platforms that need the workaround.
>
>Furthermore, xe_mocs_init_engine() appears to be another attempt to
>satisfy this same workaround.  This is unnecessary on the Xe driver
>since even on platforms where the workaround is necessary, all
>single-engine resets are initiated by the GuC and thus the GuC will take
>care of saving/restoring these registers.  The only host-initiated
>resets we have in Xe are full GT resets which will already
>(re)initialize these registers as part of the regular xe_mocs_init()
>flow.
>
>v2:
> - Add needs_wa_1607983814() so that calculate_regset_size() doesn't
>   overallocate regset space when the workaround isn't needed.  (Lucas)
> - On platforms affected by Wa_1607983814, only add the LNCF MOCS
>   registers to the render engine's GuC save/restore list; resets of
>   other engines don't need to save/restore these.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi
