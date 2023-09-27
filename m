Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5045E82CD8
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 20:39:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6362510E5A7;
	Wed, 27 Sep 2023 20:39:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F9810E5A7
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 20:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695847139; x=1727383139;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mWBQAn+M4JMr0yPAill4bz4/BBuacVCU2bZRnzmym7E=;
 b=lrMBu5zfl7R+MKEFlIUlp+o5kr0+sRdhlnmaesuBIdJG2p0hjXkIxMmc
 gbmThbIODm78J0c8uOh5msApFrDmwR0VV+g54ZacPPjmTDtwt7kzRidje
 RT0PDu7PZWoJV2e9erfEo9j/oGbuwKbYQRKMJtRv0/fwYHYc24KM4kj3+
 Z8RRG/i7eOt4cnUimQUq0sg+r989Rgxt48VRUSiyW6xDu/SAfUHRI6/Bg
 gVq/gp8KCxNSxrHUWM7QBrFlUxYy3XsFpDuZNYh3hAKcqA0sz1plDQA27
 +n/+/x8xPRBl4pSHXdDye61j6S+8QhvYrCbfLE29fYlYfHLDYAljpRLwX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="448412353"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="448412353"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 13:38:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="814972734"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="814972734"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2023 13:38:58 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 13:38:58 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 13:38:58 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 13:38:58 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 13:38:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZ2V4/RtQPDntSu4a3Avhq3j3yLfctU3Z6fr7h9M2lYH5MgDhL4aj10hmdNicrpG8qw/uJQELJPVHpVXj9WEegxYq1AWJ6xuSVRRALRkjgxs+iceQAcX79FDeL1/j+z8MHHf7dBsCbgSxmeziGoJysSIa4uYYBB6JEFreqkJVQmz0NlFPhYpJ/2F9XKHikOrJOTzT4ZJOsFHJ4/hVQJ2FopbxG/MQgw9F4l/JQTSwVmsYytMRqb1bHHiGCmSPR47iLl02LS87Ehyq1QxLti9v88kZVyafHdpC+193auMlSJaqlJ9RyJL7i0FNyiPe1IBVThfR0shouGr8HL7AbwprA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PXTwv+AzwUkp9WY/sPpTGTvG6+OTTmduWoaScj7TD10=;
 b=QviGRFW+eMvD3l2lWctcqFGvwFUFUkW5G9DyK+I69Tje335e+fUL282kdyErOHUSb2UhOyZbkMzc8lCKN2j+UnKHPqaFskUKras2QW9grd6NIdfpQKoN2LwoIrKgd5noYPcVnZ+WaDEUmMefmTwepbLd+uZOjPCo/LQmtNbpWG4U0ek5+HwRnmMi7IMxUc+5WH7c/C1/Ay5gqM6Z25l3dUoMUQgqFkAff236choL7KgaqIcVjccHqj9TBwDfKv25B36HW4RDeJ5ZvPIyPJZZdeQc+MaBBVd51SeScTAa3TVBa5fn1LkbmhCbuYQboa9H04R1jZ6g6oh1kFsVIiMt8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by PH7PR11MB6030.namprd11.prod.outlook.com (2603:10b6:510:1d1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Wed, 27 Sep
 2023 20:38:56 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042%3]) with mapi id 15.20.6813.017; Wed, 27 Sep 2023
 20:38:56 +0000
Date: Wed, 27 Sep 2023 13:38:34 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Bommithi Sakeena <bommithi.sakeena@intel.com>
Message-ID: <ZRSSyoYJRa18aXEM@nvishwa1-DESK>
References: <20230927165012.9048-1-bommithi.sakeena@intel.com>
 <20230927165012.9048-2-bommithi.sakeena@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230927165012.9048-2-bommithi.sakeena@intel.com>
X-ClientProxiedBy: BYAPR02CA0059.namprd02.prod.outlook.com
 (2603:10b6:a03:54::36) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|PH7PR11MB6030:EE_
X-MS-Office365-Filtering-Correlation-Id: fb3fdef1-3352-4580-0de8-08dbbf99b9a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lkja440wxiZSBm11suD1lzAT42Tx4Iduu2Yu7/5dYS1cj2fvu2b423DQOMQmsQo9UCQvy3ZCOifvFugKgPp0qjlO3L7tdNzjEnfW1I5vCG/ziA13tYCez0Qhg/mkPwGEaQVVyrfjRohC4f5UskF/MZzPIFrvNhonosfzXH/PhpBiZgbuvDBTozN2+v06+3TxM3o5bvxP2YXikPvZIB37hBOQmR6HOxCbnTxlCAAiG4F8TsHYXDPhW+lyATYdOTgQmhlNne1LTc78nry09Eq9aADPl54XpQsLu6ptPmdcffmnjpev0iRoPW/Fn6xVO1FhD/kM3BwqXSL7Jrzd/iDCohwmBS3uHJtzsF+2YlR8Hl+iSPwS4eQu1eHSSyOHCvjcmpqvEPb23CkqsVTj7Ai1sVDlO7uzdtmybl1W7GHt5VD3I6hpeql/1/Qzd0X/eAav1bgqOZTd8RgLG0G+ph52yLtuMHtGRHFI6Fq306lvSwXjzwCGajsrFFLWpGKy3++w+LhfKb5mvtKkirXr4ZuMNG5R5anHLtBD5a8qfnQm5MznOSlkJQhknTceKG4FIfv8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(346002)(396003)(376002)(136003)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(8936002)(86362001)(8676002)(44832011)(38100700002)(4326008)(5660300002)(66476007)(66556008)(33716001)(41300700001)(6636002)(316002)(2906002)(6862004)(66946007)(83380400001)(478600001)(6512007)(9686003)(82960400001)(26005)(6506007)(6486002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Cq4roEOQRNCQSIWDBW1mrjYlbC/OB5juMb6wYpXdva7NkAO5llcZS5dQcHDi?=
 =?us-ascii?Q?kYukS2gS3zVd+kw1cSuH9Q7JLRVCzNjmY1+N15Ts9OelBGpVHbldkMWqMcCi?=
 =?us-ascii?Q?ebDF1/W9N2sVJD0HKgFqqFDTAoicds0zMkF9qYvC97BzXr8DX01JzbfWNTyV?=
 =?us-ascii?Q?sRg+rzFRo78JurL/79EXaSnA7PGlhNuSDS9Mo8EX27vtenjVG555134QoUaA?=
 =?us-ascii?Q?ZKoLYqfmWkKuDBC7cXkFi7D4Z6BnchVZwd0heMRlzdRP6vEMP8hLFEtMotSU?=
 =?us-ascii?Q?YgOv/x+7MZSLcSFd522umEg5vMwLcR2wrO5ZR+dSvdD7NWVAnLn0YJWBs8Af?=
 =?us-ascii?Q?WIF0reAtF+wltIHnC3bsYr2i6VtGg+l9PHDKyaq8Mkmt+A2SPzqQmdo8Nhnm?=
 =?us-ascii?Q?zJTk1yavZpuhFZEQt74+iVIIYQBPxAktSLn+xBZyb1IK3mG0yWhufBIfxjF3?=
 =?us-ascii?Q?OkTZgtDmyPZEDKnBdnuxmsORyjlvz6m2fCV3WoRkWfVUBKYLo4Lb0UAttzct?=
 =?us-ascii?Q?6fMh1INnLm+CzdrmOWYBvjW2mKR4FTSv49OUcogD1zbea4cd8qIcDov8nMo7?=
 =?us-ascii?Q?0ZvBwo5P1rEfg/lBFrfY4D3SqHvfcg02e7tSXKET0looCDjSRjuanRtsZBWK?=
 =?us-ascii?Q?u5/hbf6iYZsyC5UHisU67PY05qizJZLdeKBHv/fqxejbrbrmiumHBRjY94It?=
 =?us-ascii?Q?svlyxShbGPQQf9wGYOlkceMOpQHr/Pxn9i+/J5tx84pp1hGmBpYmTXSRXigw?=
 =?us-ascii?Q?55M2cjOq4SlirKuNTp37V5eM30qc2AK02D5IPfBqg6atzrbiM04sVoJMvinu?=
 =?us-ascii?Q?h32yxMG4cv9w5yyyaS5bVapuSXnZyjNJ+meevY4+0fOPJOQb3VNJmKL2Jzm0?=
 =?us-ascii?Q?auXgaW09VJt5aquboVypnf6Olc1iy1XiiQ94hsC+bh1deqcoocKnsQcI26/Z?=
 =?us-ascii?Q?9D90Vo0KZD9gexO7TytpaW/AfRsyhqdXVul+dneRZDmBzq634eukgD2Sk6/9?=
 =?us-ascii?Q?DEjZMlEM48wlXrdAOS02D1IiaUoUD4doXpojbTQ/RUNBvfuyK+rifWGvjvS4?=
 =?us-ascii?Q?DO9NopmKbhze6RQzzSkmCVPCA4l6+pqsKVn95mojzTKzLmKV7ZkuwVx6NixG?=
 =?us-ascii?Q?kE0seDeMsAqSUCZvevp3mMrjtEU/EZJauOvrzPKJqxh1zV+oBSX4W4DiJEBv?=
 =?us-ascii?Q?IfCW59+QDLGqcvPTjZwlwe5zXYpk9H6ySZ03eX7Nxbua9HQVz61J2mHUrezR?=
 =?us-ascii?Q?EFo8acaoL7Qp60x1tdSzMaCRuJ+QBwAvvII70x8L15cDwEeBUsHpZ8yGL9vU?=
 =?us-ascii?Q?DD+q+6RlgcYlAUeHu6fp8RRkjsw6CRThnVixBcE9PupO9a1pbU9V3yyJCw6O?=
 =?us-ascii?Q?CYUqG5RXOdft9x3xkPQx6ahCc0vyzf3EqDNo09Hqh73DEWxDC/Sa8YPHOrge?=
 =?us-ascii?Q?r5RGnPnlUD28IrYKiPciGT0FXojJmnRcW+SN9FSDlfu1L/sJY61DaPE8DbVN?=
 =?us-ascii?Q?cdhbPeNJMrFR5kUIpCv7Tz5+4hQ/S72rSN7/6CtcoFaihgnhWExkwa9+nFgO?=
 =?us-ascii?Q?7GnPZBVTjfU0E9UegWBpWeJnYlAdztCvFF3Ll4edIYy85cT7+FURJlcY71qv?=
 =?us-ascii?Q?79l3tVm3OnAzkcgt8N4D6wM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb3fdef1-3352-4580-0de8-08dbbf99b9a6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 20:38:36.9666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1bltUlAmrPka9Xfhs1+qiTZX+V+6XnxqSCIbAqcPTCrSOSxEI5Wh3pG7h35hqAx9Sv+BTxTZvFf8Bt4KrZRSLslhOu+ys8ybdHeAmCSbsE366lkHzn+uN5I9uBISMfeO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6030
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Add a missing mutex_destroy to
 xe_ttm_vram_mgr
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

On Wed, Sep 27, 2023 at 04:50:12PM +0000, Bommithi Sakeena wrote:
>Ensure that the mutex is destroyed at fini function.
>
>Fixes: e777edb47dc2 ("drm/xe: Implement stolen memory.")
>Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>Signed-off-by: Bommithi Sakeena <bommithi.sakeena@intel.com>

Can we use 'fixup!' tag (instead of 'Fixes') if it can be
squashed with the originating patch?
In either case,
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>index 06a54c8bd46f..285791eb4a79 100644
>--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>@@ -328,6 +328,8 @@ static void ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
> 	ttm_resource_manager_cleanup(&mgr->manager);
>
> 	ttm_set_driver_manager(&xe->ttm, mgr->mem_type, NULL);
>+
>+	mutex_destroy(&mgr->lock);
> }
>
> int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
>-- 
>2.34.1
>
