Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803C8C761A6
	for <intel-xe@archiver.kernel.org>; Tue,  4 Apr 2023 17:57:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5778710E748;
	Tue,  4 Apr 2023 17:57:16 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F37310E755
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Apr 2023 17:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680631034; x=1712167034;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JrrGDR8oi/4PMAMNMVgPcEwYk5t/bZGCwQtnZ/O/Tl0=;
 b=H435xEHEZxjLBYxXAxynbA87cVf7vR7D508iCXoUkz/EwhoQ2AE6F2DI
 /6mEMk2TxyKaLqyRVDpr34bd3cMJ58Es1Pb5Kuq+ASfhEkKeBJzFUg3G9
 t7IslGnGHyAmhnuYvGpEbjmrNubxa30PiQJssm4dn5UTeXLf2s0yPQV3y
 tZv03h1qavvkiBrXryw2y8VLijRNvrJP4/7s/JGkpz+alcKbEjZFSYW6q
 vw0nJeI2hdo+LxAR/SKtPBg9JuC8si5IY8ZRU+0GTLclgRfMqmqsBqGx3
 KVQl9tYkSwB+AOMUwS7E3ke1EmlmgrJfB/s9vC2JC0xGyAPNGV66c8LCR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="321920770"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="321920770"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 10:57:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="636614394"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="636614394"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 04 Apr 2023 10:57:12 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 10:57:12 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 10:57:11 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 4 Apr 2023 10:57:11 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 4 Apr 2023 10:57:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=faRc43Gcg8SY9eIo5aeRXRbeTAijH7xFZEAjFfMIWWwBLhmp4jx9qVUiR2qXFctnNVMOmnMMSv3dRQYmP85jK5QDCePx0uxglfTVxFc2Y4c136oiYW7a5rHA0LLQdEwVc3CDrf2Fhkmz38twzXe7VCZb51p2iwx4lvNqk9/mlqJ4efTWjSabzpsqTxzQMHtG/tuGnG5ziyZ0/DDeFN0Y32LAG+79xjJ2bZY61K6FUlCAf6o3Tj+dpYWn2rkk4R0ZJVWYGLjzFPo4yVhk/yqTM5Ubg8kvbuc/qcpBfV+tt2NSZeU1Ynvu4B9cMGWXLnjb5SmuZAQHqZsyurAphOU2Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AqNYESd6xff6cCmdtZ8CIFJkxvUHolEa+TGpmUfBrsM=;
 b=XnUUo7xFPQthZ2JWwlyJ1xbArRMzVi3JCi2Ga6RO+FGIMiFpvOYJOQRWo0eyXe+kJb1tZLNyZFMik3cjGU6XttH7Lb+fVmH877UC8F/prCtLjXaBU/lxeyoyUQXgTh2spaM3A8rtxdm5q4VUsyyoJYfHbtsspO0/JHufkBSakLJWeeTT0qLYQwy8nATK64YnTrgwUHY7pN9ssWYsijkGnf/qTjIv7zwyhG33IYugqOaxDQxQJpOiSs6kP0L0F5aWgT53EjqqR6l+5TKdjJxoosQ3lxdEIcMlPrLW1oGvFsPQp8NrFmUNw5bFRw18ISDiVn47tleYfzRjlvLvJUEMVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5064.namprd11.prod.outlook.com (2603:10b6:510:3b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 17:57:09 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 17:57:09 +0000
Date: Tue, 4 Apr 2023 10:57:06 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <20230404175706.gserzlrvpmfuuhlw@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230331102419.521392-1-maarten.lankhorst@linux.intel.com>
 <20230331102419.521392-5-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230331102419.521392-5-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: BYAPR01CA0069.prod.exchangelabs.com (2603:10b6:a03:94::46)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5064:EE_
X-MS-Office365-Filtering-Correlation-Id: 1470efec-fa32-4d4c-0da8-08db353602d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iEySnJUcBVIkn8KXJy6nJwWgLfosSAqbLJDBSABcBUjfRTeiNmG+upRQqt9Y+amJyvnk/ZaFl5UcTk0Gmu9xjvemVxci30VBSaBkHVI+UNuTYFlrfyvhvChP+FNo6szQvgXF39DUzjNEG1ZMizLE0cptRQiIP+jUDXxysdp4lSPL/MT5oMLQLWRK7edy6G5Yk3d/5A2MOGzU4NRHytR6J1Z5kk5VfNDma8gY0YhSJXb6p1ZmmkWw9sg9jqe5ZqzbO0GxMzva2Li8wVM29ntjbAx7pTRmTQmS1qN6wyrg4px+CQXdWfrwhvGN4an4iKu4qgxyJUGOtsyfOAVpZCVV1nilXcEOfckwSG2tMGUOTvnQ7pScoO53pZDTppZMz3WZcbq2uHhodRnr72cBoorK9tv/JYK+cZGeGxU9hKUTxH3d9rBTc4OpDMwv/vkzE6xsRY0qQW8iJWmCOD2cTW3KFgm1bm7sLzSOnx/lgphQ0M+0PZiB72OhO48ustwiZ4jZ/BHwOhQ8qkciFg4MdT0UgAEXEb/xpNyMnehpL+pZeTIAQw8sxvBm2/jxvrGInGer
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(346002)(39860400002)(396003)(376002)(451199021)(4326008)(8676002)(6916009)(66476007)(66946007)(66556008)(1076003)(26005)(478600001)(6512007)(6506007)(6486002)(86362001)(6666004)(9686003)(36756003)(186003)(316002)(83380400001)(5660300002)(3716004)(8936002)(82960400001)(38100700002)(2906002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fU8uN4l9/9Sr3eSxSq6JDVOP/87vPc8N7l+Fu+fAYDbvIU6wNdgq8sD6w6gx?=
 =?us-ascii?Q?sLNcpZmNIBFG2QdNELIZwYuAZFxJMMgdFY+c+spD3s3xzNTfS5IYmW/oznzV?=
 =?us-ascii?Q?wPiBcwh5F8cQbqRNMT6I48e/FK4/zFQ99NIeFtS9sbcMLh9W1fOWGHd2ybv+?=
 =?us-ascii?Q?69zSFsAyGQT3fFnXBfRUVgyQYZO+iy/8frAHSNesX6BcEAKdcODr9/5LoN+a?=
 =?us-ascii?Q?/ronn09opH10xqLocmzJLcXd2ixNsdoSmf2EL2m7w6pVvucrecQfYiT5ZA51?=
 =?us-ascii?Q?cL8u/NWe1xWSlSGviGX4oVGt8it6gBivHfIsuVrUYEuMpcWXpesrN0/OIpjv?=
 =?us-ascii?Q?ZlNA6Whzac3gbntHq49N3gXT9fbrYm0IQfNril5xjAqA8oFGNkgfb621gKDp?=
 =?us-ascii?Q?7StGAdH0+Ci4evFfGYkT6PwEpq3ksbJzousXbR/i3Eqbvh9/3MbHWOm74qdk?=
 =?us-ascii?Q?6reWPvz3Po3GU8wQqDKMLVKS2lcqU/p+a8agWECVOhNOZlXXYvRcpByb/Xz4?=
 =?us-ascii?Q?lqmHT/JYq2Ko9mmLOaHysW2mBAq9eyFYwacnqgUvCxtb/H30wXoMwMHgtJuY?=
 =?us-ascii?Q?JADkZ/5tAeKJ6ro12YPOMdnDR5RZP35IoZcIbb+vUf+icmGsvE5sAGdrtQ8S?=
 =?us-ascii?Q?Ss6GpEyqszBcDMRBPxxI/HMwbFejp/SOFTK2UA+VDot+v2WBP6g8thxboWVv?=
 =?us-ascii?Q?QnA4cjUa5jRJuipCqSO1TZrKAoRcLiLTpS0n3kkqCMYbCU5HLISV5UXy5AMW?=
 =?us-ascii?Q?MElJ/uojKLG3pyGodd84J6pQNUC/Z2VF/GYjKlzmJIcOM7DV71SQPgz+sWOt?=
 =?us-ascii?Q?XJJRn6Ojl1UChcCLNU9TV+HsSUhULDFJdARdqpxj+OlvkPnRbpNkF6MD/xQC?=
 =?us-ascii?Q?+Ao6/GLmCU+sBcAzRubdSjOpEchhJgrqNU761ql77MTKzi1L2G0f2zzlQgWk?=
 =?us-ascii?Q?nIMkPW6rmU6yh9OlGQEgKmvQU0q775kBouy12PTLX8Lhtn8++6cB8Z/r4cV5?=
 =?us-ascii?Q?j0r5cyCtqmrfGDJijZzoHGD+ACfuqRzaapCCzjEzpRMCwa9dGxme/tOSXR72?=
 =?us-ascii?Q?mL2GT6ZeTq3hSUeOc1JGyRLQL5/QFbtbLVQilJsRXmihCR5Ubrmg7YzyX4K0?=
 =?us-ascii?Q?a8SYERMWmDE5YlgwtRYwASo7A2WoJySKUaIeMd9zdwRdhaubEj+IwRKPWnYt?=
 =?us-ascii?Q?KBFrYKM9fqKJYoOlzEaT/1UT4mmBvCT4QDeOBNK7pLBT3rKbKUeWCrAsz5Ff?=
 =?us-ascii?Q?TYIsbeC+lHSwDyfDcXZp61DfGRLQiIQxj/sgYOhIxGj9CpYQAKIBqhRycsLg?=
 =?us-ascii?Q?SCtowpZeue6rgTnHN7PW4ebetcMj/V0wdBtt0v36xQuBo1NAqKNiyyPScpec?=
 =?us-ascii?Q?HuDrLPLr0syBWR1PfEgiczX6mvgdP0mQghBQYvTqolpRbfYPskt8Yy81MiBE?=
 =?us-ascii?Q?1mO8q8S4ZYxh/gB3hUMhfRSW297ys/fOvRSvF7XQxgyISdqnnTR7NIfRmEMJ?=
 =?us-ascii?Q?7D3z5zB4bd1BwuNbBZxD7oAv6anpWhg+IKfxGUr4BJSkfmtoVgdojuzqU89G?=
 =?us-ascii?Q?AbOm56Tn0gFYEd7rCeNyoJA6DsULb91N6Ma3unQYWJRdhqB/wEPwabHSZyy3?=
 =?us-ascii?Q?xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1470efec-fa32-4d4c-0da8-08db353602d3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 17:57:09.7530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6d6mfQHkr5HnIa386b1cI45FFeSO9Qmgu7t2CyEMOw6o9ry8C8xa6wFKjIHu3j00rkWs9BjJ6oUnKZgTtscIZRSqWIoB+mHSrgO1M0TJobk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5064
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/6] drm/xe: Fix XE_LPDP and meteorlake
 display info.
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

On Fri, Mar 31, 2023 at 12:24:17PM +0200, Maarten Lankhorst wrote:
>MTL has modular FIA, and LPDP also has FBC on pipe B.

commit message needs to be drm/xe/display: Fix XE_LPDP and meteorlake

And here:

Bspec: 65380
>
>Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>---
> drivers/gpu/drm/xe/xe_display.c | 9 ++++++---
> 1 file changed, 6 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
>index e9b3997c4028..64e65b29d8de 100644
>--- a/drivers/gpu/drm/xe/xe_display.c
>+++ b/drivers/gpu/drm/xe/xe_display.c
>@@ -475,8 +475,8 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
> 	XE_LPD,								\
> 	.ver = 14,							\
> 	.has_cdclk_crawl = 1,						\
>-	.has_cdclk_squash = 1
>-
>+	.has_cdclk_squash = 1,						\
>+	.fbc_mask = BIT(INTEL_FBC_A) | BIT(INTEL_FBC_B)
>
> void xe_display_info_init(struct xe_device *xe)
> {
>@@ -513,7 +513,10 @@ void xe_display_info_init(struct xe_device *xe)
> 		};
> 		break;
> 	case XE_METEORLAKE:
>-		xe->info.display = (struct xe_device_display_info) { XE_LPDP };
>+		xe->info.display = (struct xe_device_display_info) {
>+			XE_LPDP,
>+			.has_modular_fia = 1,

I think to avoid the extra 3-level inheritance here and based on BSpec 65380,
it's safe to just add this to LPDP.

+Matt Roper on that.

With those changes, feel free to add:

	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>+		};
> 		break;
> 	default:
> 		drm_dbg(&xe->drm, "No display IP, skipping\n");
>-- 
>2.34.1
>
