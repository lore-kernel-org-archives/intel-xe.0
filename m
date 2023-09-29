Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126A5E728F3
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 20:53:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D5A10E157;
	Fri, 29 Sep 2023 20:53:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC0B10E13D
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 20:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696020811; x=1727556811;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=YUvCEC+H0ipSjWVBL+9hWlCB+PR+91yuUblnrTIlUdo=;
 b=VP/rO69eNNETOZrFxHDbvlLtNdX/mIjSNRUd3EX2elP7k1rdM2LOWsyO
 dsadDQl4OQujI6RVI9DqWU+Xw3SRGqzBknk+L32fRV6nsW13mmAhhh4vF
 6Uqj9Uvf3/m08LdX2UoVzSs0qSdoSoCHAVMPc7RZOV8Y+SvdKGYKNX7jv
 Q71D+jWljcae/QdW+zxMNHftaR1MZlchIQEg8ibzYyBQ6edmAEwA+HcYW
 QapRpiSQWibPNbgMHzn7m1jAM6bm9JA439XEkpAyDWIJcZj0zXtULg584
 ymXc2Rc0gpPV1Kpx4M/qk9aDET4Uf5s5dEj9YA4cnvxl34QUzJT0eW4BX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="413278265"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="413278265"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 13:47:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="865825941"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="865825941"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 13:47:12 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 13:47:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 13:47:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 13:47:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 13:47:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FoRaX7ZtWwf8YIeD/QooJfODqqsB3aJLFw1RGZv4Usag+2UbQFgyxyJgRkYYtcbV7rGd+4mO3QcKdj2mOWIlM6iy4qR/m5havXihMiVc+8AxpaWVQ6wWyWMZVCs6zDLbC7uGaCclY4e7IQwaJ3yon4/2MT4hL9CPOIKr58iUPHUv+guEv0MQTpMsCOtZTafh9or80EMjYoCn6vwnUb+a0KCzFrcuW3RLejfqIbwL3b0gZknNn/G51tLajaAhkL4qvjMGOz8w/odcgHw/XaMp+mt1w5Z9a56a/9KVe0yst0ejQVsAdsUHk4wE8KJUh1LBnLJiu7bRbG7LeT2P+9DVgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1FiFpmHhNivc4tPG5k0M1+Z66F6ylVZfmy70Mj2QXfc=;
 b=ig5DNocvHiVdKzK5OrlY9p68zNzQWCmhg8e7sju6Eh/h9XIeJtKu587hGqaMrUz5I82JwzaSCfRZN2XedgBwILbw1YFA7KWfUjg9rNPXLOQ3qizlogptgA2t0ZG0t5oSQv2sc1xtDGOk3lnlmVJHrfXTk+uIc/nXA1i/5Wf02CE7fQACn14dF05sDvZJr1BCZJrMUNbNnGlmMyDyWGbLMli85HB0+ggWriSRIVwJxkuNV2leWXZF9324NsVYPSFBjGKlDMneML5q7I56oDPHBWDEi/xp6nWktHgMZ2xFZ9wQ0d1Wow39O4lljvy6TvmaMFZc/RDJ3GrYAe/yHpxVoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA0PR11MB4639.namprd11.prod.outlook.com (2603:10b6:806:70::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Fri, 29 Sep
 2023 20:47:10 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6813.017; Fri, 29 Sep 2023
 20:47:10 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 29 Sep 2023 16:44:11 -0400
Message-ID: <20230929204637.1202492-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230929204637.1202492-1-rodrigo.vivi@intel.com>
References: <20230929204637.1202492-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0156.namprd05.prod.outlook.com
 (2603:10b6:a03:339::11) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA0PR11MB4639:EE_
X-MS-Office365-Filtering-Correlation-Id: 661686bc-8d63-4363-568c-08dbc12d4059
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zz7/ddSya7EF1NpWBeyJzVx2rctHjAdnAe2ITySXxmkIAXNARGYXkMnhWx/5479m1hGrmk5dSOa/hAC2At+Rtt44pByMZ0vwW/LIeoeWo3KrAgYl8lddCDelvFTEL4OkzGKFXkbZ0BhJQwMXtam1Qhd5uDyE7+teHWniQNnOBEMrkk2NybtaUfUvLYu2QHLJvU0XAkOnN4Ax+qvnbPtVXyGzzs9YC+pKxzzIBEjI88TSe2XSk8mHix1UMvL2htn77oIvFoWauQi/uiHZWc058jwmnlL/fsjk2cmcVo2bIU7GsdcgSCfx+BJjQFWabnTYA2dJbClYJLgtlG3O0NKhSiMMRxU0MX2hxlMPsJOkbZkj+k1+8ym3+wKCWRxOvceQm8ejxnLM0wecaYLivHHblRApClR6hqvdphXkwiPjRUMCjeJmEaBZrM8uR9OEPQ8BP2XjAWAAngxu39Ykq+f6LQHXY71hbqedevpxlmfkMRYAVQDQcIs6pC1LeDRva2/X0YZGlK70Q559/kVHrUKJHtE47d3jC2Q7VG/4TkjmF3NVpURI6JkNgVV42nbOuN1E
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(366004)(39860400002)(396003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(8676002)(8936002)(478600001)(4744005)(26005)(44832011)(4326008)(2906002)(66946007)(5660300002)(66556008)(6916009)(41300700001)(316002)(66476007)(6506007)(6486002)(6512007)(107886003)(2616005)(1076003)(36756003)(86362001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+sng28JLu3TaJjcnuJMZXP0bFJHXrSMWZMpJogTPI1MkBGtKdXid5rI0TluY?=
 =?us-ascii?Q?Vt1wiYMaf0e6OQOHthGoKZFuZ8owiXllb874l8UJMrGOl5Mn3s20/PdXjoWx?=
 =?us-ascii?Q?R4OsW6L5MTsg+YKAHVdUgTOEGggtfm0qMpSYPwJQuFx2fwV6ZitTgJIxHjVy?=
 =?us-ascii?Q?X+HbGcMTRpIts78iTkZ6lkVHKXpzjm5+NC4jebeMNfmA3RMfsqaEs0ryW22s?=
 =?us-ascii?Q?qqQ+G+gAQHltyk2672EqKKx32Xn3h9GQd6Wt80pfmM35TIEV9E6eEXXJJTj9?=
 =?us-ascii?Q?jl2jY++t5RyHuZhHZ2EQdw0PrHBovY4XFvlLB8ZlFbR20XEINrBhpb+eAR+a?=
 =?us-ascii?Q?j03cUU3itrqlyRizBxvmvecTbIbZ00z1o3hQzE4tL14M8lYJFKchtjDKpjPQ?=
 =?us-ascii?Q?t2Dbqk8VDRFMMH+qpm9qRJcAYOaxpixjRMGzdhcIbNiQZxoqzbIl5WhSB7TN?=
 =?us-ascii?Q?niqzfCUEV31pvK4HIGQFXVCRGiJGgwHaJ3Up6jG+h3t0ZIDOF21FlpRyO4WY?=
 =?us-ascii?Q?qLb0dovqyWkBZjLAbn9w1dSBOSFDTtTaybEVOmFt+Dy02JUnOOZaf/Wx0NlP?=
 =?us-ascii?Q?LJ6alJjc/+Jbn8cI7Ff4VFKpVkOEjkoSMNvaIKRCeVJNEqjBOv/yioij2fFn?=
 =?us-ascii?Q?UKyELlbyZWxcl+3t8fby9Y5EhIxjuIxJPJ0o2M+ad54ngYMKU1Z3gsVOPuNQ?=
 =?us-ascii?Q?0rooc5gYugb2mHwf4DIVHl4fcuF4ErFCU4Toe4wsxc3gUR2LqXVGchUdp2f4?=
 =?us-ascii?Q?L0Bu5wWzGPzYGSKGezGrGA0MuxfIB/zl84IQuwXQPCIUwRnXSVfudoRKYQlp?=
 =?us-ascii?Q?AyiqRFn9MXixzCz3IDBYewlqFGLRkBx/ds0MgVOOHfSixPVAUXmYvtBN3yf5?=
 =?us-ascii?Q?Od2Sbuhj/Y53SXcRnrCZyeFPNQU8uLg6bLQUYRHUx1apLxW7u1o+ZQO+pBoY?=
 =?us-ascii?Q?v+6ojPQVzNP5Lo6fIQc6zm07hka0TJvk1qMysoE1FQN7d4OVyhMLpht8HKjl?=
 =?us-ascii?Q?J4fgtlgoPLs/C8UPXP4ubenXAQdoBwRbBwux7xcz4lauyQLfopkqU+WNleFW?=
 =?us-ascii?Q?JT4L5F5ucvLtP6ukoKQ0SbHBaqlaFeO2sgPR7nGBe451v1/70GIdMqxQ55KO?=
 =?us-ascii?Q?IzY0/bjWIfmUPHOV4WA6HYRsP8tRkdZ5HpejhFJ+fs2+BobsbGUOgwTDfbN9?=
 =?us-ascii?Q?xSfZf8DuYrzNsRpw5yhH3P/ubG/HXdvmnxKrm14gZmpVCmI+8ulgy+Zsx2z5?=
 =?us-ascii?Q?8zzSZhD/wHfLMa68bVji3sbWrQJFWY6offKrX5wZ5Y0eni1xSLmt5KkO442a?=
 =?us-ascii?Q?qG8KGo9+LdEMM9MTKlWOCEObIvd1GmgH0WfiYEYZck5Qlx+TZc6w+Uq9VtkW?=
 =?us-ascii?Q?UXDxcD1Fk34yLv1e43SqCt10O51K6Fy3ctwRtY1IVCGlL7B2kKLG7a1dvTGH?=
 =?us-ascii?Q?ZuG1YDtm4pi0RqEmHaoTtXXug+XdabhO+dxIKDEhesg+KyvRfCjGTL9U7DLz?=
 =?us-ascii?Q?PgsNKNveIXC07GpsDV/XaMk5jEwVYRY5ejhc5P5uJozi8YPhTzCzIcHOztRk?=
 =?us-ascii?Q?N036jqhZmYN1AYzCwNK17wBRjb2aNZm8YG3qbIab?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 661686bc-8d63-4363-568c-08dbc12d4059
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 20:47:10.1359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Etgs8SK5AvL4VZ2TBTKWWbonLWxvZm6fNrS5B2tbUu/yfAZMf5XRAZ+kZzQKBvAk8XKrkZ5IGirFN3qbb8g+mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4639
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 4/4] fixup! drm/xe: Rework xe_exec and the VM
 rebind worker to use the drm_exec helper
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

---
 drivers/gpu/drm/xe/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 97ed2a00f862..9b74b05475cf 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -34,6 +34,7 @@ config DRM_XE
 	select VMAP_PFN
 	select DRM_TTM
 	select DRM_TTM_HELPER
+	select DRM_EXEC
 	select DRM_GPUVM
 	select DRM_SCHED
 	select MMU_NOTIFIER
-- 
2.41.0

