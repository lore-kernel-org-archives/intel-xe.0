Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EBEEB64DD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 22:12:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CAC210E3F4;
	Tue, 25 Jul 2023 22:12:23 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11EA010E1A6
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 22:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690323138; x=1721859138;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=qG+IoQn4oW3YtV8W+b5IA+biSAKRtZ0V6YIpbSVUp1w=;
 b=QdYX9uXK/Bai2eK7eaLpTjiliAtT9iSBJjJnsAVnWJlfEz5PKPBJQEmT
 1A7/bI6v4K4KoDkBcwFssux/C07ifYbTS+MWHs2VzAxsG0W1NAOrJqS+A
 EG6jUftYBuw+UFrGpJkZ2pfaufJyuptisgS6760o9tTcNS6viGzFYJQ5F
 RiIs9pXBtqSHV8ql4zGcSO9ugGXIYqCn7aal3Rg4+cRwVwA33Ul/TJorj
 GsxwnqJvaN4exDokqovzHbF71y0Gx6G6taPBwHM8YqONlquX2V0jADbcR
 /8k9NhxMxuoYuHCNLM/qFM1dFNlqzLbmIGMTlcmQdk2JtB0ITF5BKHTtP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="398775364"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="398775364"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 15:12:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="729552644"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="729552644"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 25 Jul 2023 15:12:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 15:12:17 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 15:12:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 15:12:16 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 15:12:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9ogpc3NAX9Po/vl9WoCh+WtkgOHFSu5rBG1y0EK8b2AJKjuL4o1Us+usrzFDHsotkdmxXGRUq9dPBFFaOSJDUkSR2QACfJbmFibIxkMxQAzbkYq/k68fjPR+d/gFgFV2xxJybLnQT9hwR4Gtwguf08x0clrUHwI0C/eSkS+hVNo9EZqLBd8KVF4q9B4GBJMNpUT+tAdDGKxPRNr7eAvQwpn/09wB1vzn0Ri1pnC6UN7cOrMFM2RPPTNE4Ms06dyN2NXc1UA7IlKjSRNrqnIUPmxIFiwytoWd2IhBPB3IMPAqT/O9Y00yAog9cJbfI8aFxb0DF3w6sJkMGDtA1TFGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bk51IpS17NeU+YCIY8kHtAtorZHkr3fIG5kq6dU5/Ng=;
 b=C36h8ZXAs2lbdOt3zWqQKYvbeyelJ6+ZQA2qaSLpOdeHw2z2KrFHe9UW8YuMvZmN4NVoobbXDyvRfeQLEQ7g5SvxHD1ykU4OgG2YQkxXOMyc3dyfq3c2KSS7h351EOWx96H/ldnCkUcHQ7GRpm4W5b5RSotrKGKuB0YZBWTbyubAQX+G41n8IxQt22BSYhrf2LiCm4mspWk/wPOUCWD2w+aGhjrX2MvpdDzN0l2MbI7DltIYeoWheC+oDUQpbdezzzNNua4dKsk4djGIOWpwymUEAUK3FMxG/bhY9Z6FIsTbolOxw5C2GCHjH5Z2CWmTFYMABbvDjoyExdsEbgItRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB6781.namprd11.prod.outlook.com (2603:10b6:806:25d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 22:12:14 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 22:12:14 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 25 Jul 2023 18:11:58 -0400
Message-ID: <20230725221159.354618-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725221159.354618-1-rodrigo.vivi@intel.com>
References: <20230725221159.354618-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0018.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB6781:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e458b5b-71e7-4338-5173-08db8d5c3381
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1yepDpMcjEo/sVfos9ORmgKi6zfrhxw6VQBUtCXYkMgDDvDJ0L2AIlSOJQsu9tzQ1R5bMLEHwvE55zDfK1Jx2nH4uFu8BXSYQh2w/ttwfYUBlBBftW6kBv5bFM0pp7aZ7ZpXMPDljJKUyPny4dUd5ujc7ETDkz+FjjLUEc31hJdSeSz+fMj/+uGMjLoXCQp4dT5MTU530r8ypsA5UvgvJYLzgWIV6GvJJs57+EkshOhHoY4ACqjqreC6xdSnDyTPE1wutUOekGohUdwoKsPXuKDCcPu+U2yoo0xAflmxXQKrzYtsmHat/M1U8gpCeLOd+DkfSCsYfMb7aCSgCQ5+c/Sj6cn2rmC/ByizXIxOX/idsGx8UGoa+e86EjkHvYUJa5lkfboF1oMjHY6156z8MRdQItXLr6juBGB3C16QBVwis59UPb8ZjCaQFHXODSQzBJdZBsBfsjVfFa2aj2sJwVYNch7fMs72QqNn8l51vr9+LXKaTNjMXS7YpRz5ykNmcTyd2ZS/Y9Zc4qnPniz59GFpqWfgaAZR0cNcQETp3NTKYfiVzjjQdjJRlW2QsFG1UuZp50enc/wMfAF2iBfgRLku4EMCA7FLAETskfL8qhDOlTzOc/gfMoZy60TvzMxwkyo59PNlTmF6WrWw6rp5kw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199021)(8676002)(8936002)(44832011)(5660300002)(41300700001)(316002)(4326008)(6916009)(2906002)(54906003)(66946007)(66556008)(66476007)(6486002)(26005)(107886003)(186003)(478600001)(6512007)(4744005)(1076003)(6506007)(6666004)(82960400001)(86362001)(36756003)(2616005)(83380400001)(38100700002)(42413004)(32563001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?921YqErvQOjOw4VIySU6geJC7L7EY8rCia/0605iXYptlw0ZVzyaSVUomKuw?=
 =?us-ascii?Q?iWpn258c/UFd0lfooOBvdhyzceOO7Tj45Fa6JGdxzg8tO/LpKp28z726dcQY?=
 =?us-ascii?Q?kGvzYe+wuclbonnVf8LVcJusaGEiDvzD3nE5pAt9VAcMHDG3g4rwtiGBjuRY?=
 =?us-ascii?Q?4qkfSBzx9Ylap+T9jeBCukPfPlQ0wVV/rBJyVgn0kYy2vTwALjBlzxqv/+BL?=
 =?us-ascii?Q?K/gqIJyXQmtl6djjvvigmMIR5hhM0VW4UYOLOJfHAi1275RvOvtEO1r50KzS?=
 =?us-ascii?Q?mKxD5KpdIzK4eZPQMK6o8KRy3uo7CybV8WUojBmloqwGi7JcQbLJrroxzgYG?=
 =?us-ascii?Q?4aPJOdAUBg5/9GGqDyVYPSIGbW0Y0bXNPt24bRa0zy2eCbL7jhHqikRImQKp?=
 =?us-ascii?Q?J2K9lhLuTQx5rBm8lxM7agcEN9xHzrt0LvuYnDYSGXh+BeXZ30pXL8ow9tHG?=
 =?us-ascii?Q?ZzAvgfm6MhtdSdRHGKidIHCKwwPYcvTB5eoFVtwKWl6eSUcuuBPsOZA/IhJm?=
 =?us-ascii?Q?3dpQYSbQJhzgwmcudFLWssyKzrIPJF7NwRCI+2RQn+DvHkQ1DpPoomZBzTnH?=
 =?us-ascii?Q?Drvt3z5z+Rqd16ecFroaikO2iMdqU9+jiGt8bToAJv9bxUCef/LsqhyDnfHo?=
 =?us-ascii?Q?bt8A8FqCLMzx1N20SdpsOs3ZhFSsUM9zZ2b6pkIbOGY6IQ7uZr5GG5ma+iVY?=
 =?us-ascii?Q?i3Oig7ZlKV+v15aPXVK81HcOvlSDGwcYksZUelujy70JSdznt6e8B/6CUVbH?=
 =?us-ascii?Q?GJsSFCL4z1igFsJyHJnqzGgZdo1IgQDHwUjf03WkEB+1pfTNeH3yGjjT1sAy?=
 =?us-ascii?Q?FxkrbqlYMAvAVi64g33yZ6fZEYty6vmeA6NsHmZokZzkdVXQrR2oiFI+mLna?=
 =?us-ascii?Q?Kpo52w51yCqNsfgi4Wkj0Av30GYnUS7TJgPCF/iGxOLF5zdg5d4kpokzw0zg?=
 =?us-ascii?Q?84CFGQpxeyUdPq/F36pAkZjsFQ4/9SlEq0cU2yPszpCaWVV1uoUCHtGFxEGK?=
 =?us-ascii?Q?EFykhzyaiLDltOSirwNkmVYJGUTxMNiXr63z2HFMK8G+D6AqhGtdBqD6r0R4?=
 =?us-ascii?Q?5IfzrrsIz419uGIbckvt+ZNT3R8Pdx4zI1mhTfMZ/0YBUf+GYE8bwrh2MZe0?=
 =?us-ascii?Q?E0g/V44mttAUMvuMqWIkH/WqOmgZzRfeSMpyCcNSb6pfVxuSJHcboF8oRO66?=
 =?us-ascii?Q?m096hBaiegfwOXETi8qRLkoWF+IxLiV4r5iHjCefsZfKmlV3QAQN9t4EpOvm?=
 =?us-ascii?Q?DuVTNyswtSfPhF7ag0IBVxQvsk1uZv79CRRKNvI0+gloAbQ6aEPGocYiNqSy?=
 =?us-ascii?Q?PRw0oYHqJ8T54siz6TSWAulWDeEb6RG55d+4PIG83mBPi+HuEi6mbMpTyDpN?=
 =?us-ascii?Q?sjxctkEQcG6Dsf6hj6MJsr4QkqDdInUXSHAWy0kQUYAHxuP+RyvZiGG25a1F?=
 =?us-ascii?Q?ty1oJoEAgvxkRfbamgpKny6BchV1VSwRtVM27EByMoHFK0NUzAgjqYWKm0s2?=
 =?us-ascii?Q?eIOMqmwEgPa3UYwpBLMd1mlpxsZDzA9S5xa9NMaH8HgoXGujfaJzlWXSRnKI?=
 =?us-ascii?Q?LviWhblSSefsGLrFdGcTxHuCW7E77buO2PnJzACmklN7V95d5vAiIXdQ+5vH?=
 =?us-ascii?Q?Lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e458b5b-71e7-4338-5173-08db8d5c3381
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 22:12:14.6191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mKrmSV/2aTX2i298bFqcmblKnOCZCalR1R4deRLAIsV798/yd4FQJqeOk9jR27d0zqu/GUVpLWmiWTbq12e+5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6781
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 4/5] drm/xe: Only init runtime PM after all
 d3cold config is in place.
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We cannot allow runtime pm suspend after we configured the
d3cold capable and threshold.

Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 834d87d98194..67ca7cb7e8dd 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -152,10 +152,12 @@ void xe_pm_init(struct xe_device *xe)
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 
 	drmm_mutex_init(&xe->drm, &xe->d3cold.lock);
-	xe_pm_runtime_init(xe);
+
 	xe->d3cold.capable = xe_pm_pci_d3cold_capable(pdev);
 	xe_device_sysfs_init(xe);
 	xe_pm_set_vram_threshold(xe, DEFAULT_VRAM_THRESHOLD);
+
+	xe_pm_runtime_init(xe);
 }
 
 void xe_pm_runtime_fini(struct xe_device *xe)
-- 
2.41.0

