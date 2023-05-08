Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B48EC7EE22
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 21:09:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 462AA10E046;
	Mon,  8 May 2023 21:09:20 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D1910E046
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 21:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683580158; x=1715116158;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=aIxCbibIO5EhzXortXqPxslOC23T2zgUyCzINdLiSks=;
 b=mA4EMpDZnmu60p3ReWzC83xx3jzu8vWvQVN5IC953XBYbqKN9DJfV2a/
 rf9zYvsm8CpUb6GYdXAFORpW+90TBxyE8q5DWJNwTBf8HjHco7LVlT3o1
 0psSCxEQkQV3NfEtFnauONXc7vi29+GQXs5pN9K8oP8LsoC1U6TKOcWPf
 71agenBZ4rQ3dJHQOH3WCAZ0viAdSsAMu7B52mjk6W79XnmoLc2Y6//XF
 AM1GmTZr1O4qoe5ustzJqJ4kktZXPurefo+Yixrlzit/rvD26KeEabYmS
 B7fIUj/OxzSJDYPa6gxlN4HTG8F6gL+TXkKy4sSKDWxpf0c0lcZ9Lp67r w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="436075664"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="436075664"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 14:09:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="945005704"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="945005704"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 08 May 2023 14:09:12 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 14:09:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 14:09:12 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 14:09:12 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 14:09:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j8lYBnGqLfh1tibP2XKa6soZYA8cqdXZ656htVWzR+yGUOVIEoXxZXvbn/lva4fFBDGrz8x6JsQYJgKKZkY9wOwhMk/Uxiw1xw4FNuacuTxrI0/9EL0T+TAo9MU6kIrrNXrqFJNI9Gr9XN+qOs8b0FpQoJKvEc7PH1YsPDrD1PXUEWJzIM4BXVThUTtEf3mE/vnDkOqz7RH2ornBmpbEmRzpY5Pd58fIYYxUG6QhtChmri/h2SOiGKFFfX4qspCwDAnbVi6OrwnKnokfMRBzjfRSrqlz5pNgraPe/rgVHtwK8vG33mkcV568/ItrtmGEswloD32X2diwv30izWTw4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qIsbchdmyNt/p5/5m3tq/PvAJOKIg3q0R91C4JvEws=;
 b=UXQdem0h2xgh+CNqplQXcr0nGlv/Pe94mdKGO/IGcqUvYCwZa67d/0icMCrU4NWoWLyJd/QvawvGDOboKlAZLlLQubqL1rGvAYcYDZoCoayXuMV/RIUUqcPQYekSBBccZ6w0T+ZryS+y3+kkJmzkxzrMHkO1jYfolXufNnz4PH/TCIuY3OcbeljDxiXLnG1HLUrhGIV2nwNwurblIdT6BO8gV+GPl/6rVFmT8Y7s4s/rqihH9cyraVdcelJa39C4xH/Dbn0gdp24C5kNNE1cvaMlk/2IRnX0PWIt1lRkzRlf9sALgWzFyl79XImC7iSFTgEU+W7vFgG6XQqhMfmB6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB5011.namprd11.prod.outlook.com (2603:10b6:303:6d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 21:09:10 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 21:09:10 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 8 May 2023 17:08:25 -0400
Message-ID: <20230508210825.1405432-11-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508210825.1405432-1-rodrigo.vivi@intel.com>
References: <20230508210825.1405432-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0093.namprd03.prod.outlook.com
 (2603:10b6:a03:333::8) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB5011:EE_
X-MS-Office365-Filtering-Correlation-Id: dc558434-0bd7-45b9-6953-08db500877b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: olo/JeGCDxXbzU4OYH/H7LG1XlUW2VC4yAih4L8kJ8jsVqBJb61XOFVqVCnFqJBU3UN8ownLo0xzdyKnDChF5gF6pFs6h+yeSWHV6IeT06wGC1VVciuOzdBp3i7v6lpLQrFYFNYLXkNZSHw9MoJ0QMOsbGCFYFT3MTEQDfWFDJFrIBEVmW2sDYYM1qqBTPuL1JAIlyiX6uJJBqEEhAH4dnvQZPEMKhSfzpg6jABABqzUil3tcoc8WvV9BlQ5ADHXffMbV516JUjO8CVjeXS7w7t7QYTdcxRT8cpYO9lyULtrovWXlgNRRKzOTvYAWM1B2pYNEhupBvWNRDbjb9QhdG8olVlcI8GMUYhq9OqTPgtGXyVEasZvkYTlFxCQT5pEjrerX+0Vvr+Tz9K7HWlzGE72t/p2N6V/QrbgRfjRw5FAzkjgT96dYdf/R2RaQM2ZD1JNbFHnewOzMxicrJlIqSTZOQ/4fBFkr3DC2uYrqtGnNSS3owqFTulgssJfsc9j3sUMToNCtgxXfAlsM6K35PX6X5CBq65fG73RSpGEQT+5vdMKH9JMixLXFUtkt0Dh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(396003)(376002)(366004)(136003)(451199021)(86362001)(66476007)(36756003)(54906003)(66946007)(316002)(4326008)(6916009)(66556008)(478600001)(6486002)(5660300002)(2906002)(8936002)(8676002)(41300700001)(44832011)(38100700002)(82960400001)(186003)(2616005)(6506007)(26005)(107886003)(1076003)(6512007)(83380400001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cfAVcpYkeRZaPxvm2sMESDqEmvXJJbpYqyoJeG66AjPhUDuOtvvLVPA6RtpG?=
 =?us-ascii?Q?61cfBZ5TQzk90hi/kAQb2wI/Z+VW3nFkIBTyj8aVj2Qy/8JUiOYBdbSk9s8G?=
 =?us-ascii?Q?n6ZVMJTCnG2JNWRH7bUpdr2nDr99fVTtfA3/QbI7pbP5LWM2C2UbhKY3v6fO?=
 =?us-ascii?Q?x/4d+z4OAJLz2UpMoKXL/fFXQIG/Nba0eN7gDfHH5blJma5jenXP1K47cZfg?=
 =?us-ascii?Q?EKtGHvuUpZdNXaboJRcnqqzpBp4xb18UnaB2PYQ+ZzlntDvFdKnxIMASN9qR?=
 =?us-ascii?Q?CTGAwM7pfAKFxpRfGuunqhbpg+KrDJZkpUAuV15WW17mREJI6rj+oaL6V1Ul?=
 =?us-ascii?Q?8uAuhXDRfrkzTY/Hin25nPW4A8cq8lvcJcaPJDjVWmwf4rs2+1h7xQB+a/ct?=
 =?us-ascii?Q?vSo3ThJgzd5ATxuAb1Zbc0o814Q4yGpRgbuybXiy9TmWfQm3l6CbfcshNWbn?=
 =?us-ascii?Q?ounvDhuO02U0sE6RoYb0QNLEENQm+uyF31epG1qtz/G69cZndSxvgsDrMM3i?=
 =?us-ascii?Q?URFIyHb6rXkye3bOXe7Zum2+a9viy8aIj4UjR+Qb9zXSjvJ0pFlqmXNS/V2K?=
 =?us-ascii?Q?vKUL+U/8Ale7yoMcy+PdVRUgIvfqXwStQXVSprxog6NC1CKi7xaa8xepl4EH?=
 =?us-ascii?Q?6R/1vY7pOPAQMIwyIdTt45fPiEcN6+L21aJDaQxdcy5BNILPh5L7fWzQNTdn?=
 =?us-ascii?Q?tbbpToc63h2QJvOND0phdOx13DCNsGW6ZNd3xezZf9QGmk61+1GW76HFUmqY?=
 =?us-ascii?Q?kr8GI1ZZStgtLVEw5hJXO+g812XfS2AH1KCqG+7sBDtQcA1Rnj5gu97dmEVZ?=
 =?us-ascii?Q?WLJOz+f9HcvEOMHqnjvXJAXYL/NEsUUZdxQJmq2sXT0xLJqzLy9dkw7sfP4L?=
 =?us-ascii?Q?HaRzhB9Bft+76bMy74kecbpJWOf6fqWZUfJv2kq/XBdad0b6Ozva3D+EjDuD?=
 =?us-ascii?Q?sbr2ZZDn3617ln4R3KvgzpWxvIht/FMQQVGz0ATZtgtdVYtPn4K77FiPqoH1?=
 =?us-ascii?Q?wKfphSLsoFSK4c5wff8FQXD9TtNc1L2LL7eQ8MlcEjVXD9AYUlNoBF+1KjX4?=
 =?us-ascii?Q?ZSSBqgSrQlB84SqGiGMoOhvw8qUiKOjjHxTaqI9CM4uAHOAF67znMs0LujEk?=
 =?us-ascii?Q?mN3UsnrW/+4IliEmd+evbChys9ZfjwKwz8UtWxlZrtmkf+i9bHZ2A45Kjez3?=
 =?us-ascii?Q?4cyMEnsAjKOQei79OQRlF3V7hSqxsvmyxpdnGhPbONl4YY26neRZ9aQ2VMGs?=
 =?us-ascii?Q?94FcIUVXXmD2qfNAyXmaN3Lxrm7n5bggGWqBqqb6n0l4f1Yipt1nkgZ5bCxH?=
 =?us-ascii?Q?FEg3Bm5Tc3E1ofY6PJUhE+56HZkYpc+Ywvqd6/mGBh9O1Axz9/Ncecah+e6T?=
 =?us-ascii?Q?yvzT68LvO7k6ZwFzmeuz77YnUge2AeNZohWxXUwhlUT9ojrccO2gyfvSiXOx?=
 =?us-ascii?Q?cGOjGAgaeYS+Pih/vF7JYsEWbSawXHp0SV2xp6AlKZFTizWohYQ3gHFs3emV?=
 =?us-ascii?Q?XmnjFaHz+XKQogUkD9DU5V0407oScSZOdl4x1soNGQYOsm1ltbTZs+LtTZHt?=
 =?us-ascii?Q?YHiSC9FDZ0M25xWdnvjy+Le3elKXEAomu1Eg6CI8WZ5i/vXp7487Oiw55a2v?=
 =?us-ascii?Q?8w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc558434-0bd7-45b9-6953-08db500877b1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 21:09:10.3684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D0kjOXOEVjLBepDEel2/lV9b2VZTrvV+xyFjj7ahmq7kuc0sgf15lGAG/oz/Bcfaiu72AlyPBCGMPms4jDG0Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5011
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v3 11/11] drm/xe: Limit
 CONFIG_DRM_XE_SIMPLE_ERROR_CAPTURE to itself.
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

There are multiple kind of config prints and with the upcoming
devcoredump there will be another layer. Let's limit the config
to the top level functions and leave the clean-up work for the
compilers so we don't create a spider-web of configs.

No functional change. Just a preparation for the devcoredump.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 91576cec000d..a96372140b79 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3369,7 +3369,6 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 	return 0;
 }
 
-#if IS_ENABLED(CONFIG_DRM_XE_SIMPLE_ERROR_CAPTURE)
 int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
 {
 	struct rb_node *node;
@@ -3407,9 +3406,3 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
 
 	return 0;
 }
-#else
-int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
-{
-	return 0;
-}
-#endif
-- 
2.39.2

