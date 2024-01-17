Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BC4C47258
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 20:41:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00BB210E844;
	Wed, 17 Jan 2024 20:41:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3295E10E844
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 20:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705524069; x=1737060069;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=+YjC/xfU2sRwawAdzq3uZU3+73v5uibNK30TmA5hFxk=;
 b=QF3WUAd4D18RAAYJAmIc1nFrtRQDbiIYpf6bQQzJfsVht4p0lXJ1OH8s
 7EdpD/2pl8pUsfbA0MHCc+tb65YaC00KrG/5Nb50ziAKtNM5YvAtIrsO8
 j+FQpTlqQzBIFeO0/SND+YowSArSyBd9Rri8pLTAlU1xUqSZ+Zm0qvQkq
 X+fV0Xbj8zzbRMmUi5zPjWytUKxw5DoFvq1pMBc7I+YnOGX3dIBlC221a
 qpZYNXO4Mcq6phg7WGDQ8XqQmR6omAcWPVoaUmBwCVeL7gIRSBTK1Ii1s
 S6HakAbTiXOZdJNWMzgL8r/Q9pYSEpYxpAfQz1cYLtGWYvoL3o5t6k03t w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7644466"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7644466"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 12:41:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="32906161"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2024 12:41:08 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 12:41:07 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Jan 2024 12:41:07 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Jan 2024 12:41:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JtJfi5H7X5a9xUz3n2sgPTi1rQ+AIDnH9AGSoK8R+ls4qJ2kZj703geS5Su+byvn5htNYa8HN0K0+3X5otEnHGcWKpNupKSMb0ocHJbDDXhjchqYVtt9/6n3zs9riQ8Gdx8q4BP+SBKRl484V0pzyT4/TDP1uismMQq/7WQo3lt8nYrq0fqxypZOUx18jrN5DhoMD0ovC6g86xxb7GiVo8mbHlN/XCCgQLYUjN1P1OjKuXCYDjBNHJV58i99MPPwZSjOg7XbeDM5pD1qmHN2YgL0MNtK6zEU6rlffw8t4GoFMhhrixTm+ijOpWkjQszYh01aE1USBF0FtlhzvMjr2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DxW3nXDK9lmEkEikHOig79YjjrSvK+zfTofTELHjRnE=;
 b=LnkWBGkUf60rxqUbuzLhSk3iRG1lzYGo/w+EWUWJ8TkkqWVkS8GiwnsX89BV4q5IOBRHPX5O5uKDT9yPdgoo+nnRlNR9C2kIxBmCS8flcPDs0pJvzJfCKjsidncSpqRXdw/fYS6fn4+B3y1DmXfYCblhmQtluFR05Ov113xJMQGjHcI2LaYKpCIue0fFAvc4s/daC3oWJ57b34qFYkXXukzaAPQnItQtWWbpG3GtZwsABKyhAzx99f06ac7YTMcbWvpXg0r3gE9Fgjh8prAxnR/MhdiMpwfCg0opVgfluOJSAKiGXnyYjR0AwRld+/4Gx8vE/MLYtejIR01uY0YVXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB5981.namprd11.prod.outlook.com (2603:10b6:510:1e0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.28; Wed, 17 Jan
 2024 20:41:03 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7181.031; Wed, 17 Jan 2024
 20:41:03 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH] drm/xe: Do not flood dmesg with guc log
Date: Wed, 17 Jan 2024 15:40:59 -0500
Message-ID: <20240117204059.345143-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0055.namprd08.prod.outlook.com
 (2603:10b6:a03:117::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB5981:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ee61b72-f534-4d8e-819e-08dc179c9efd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5o3Pp7JCqaWkmpe4XNn9C2cYOLvivZ0y1yD5xy5MF8ifNaw4/ATj98saZitv3SUuSyh8O2Cd5hq2J5mUDQFEU/X44oT01GjrVFif91Zs5V3aLan91H4aGiC8deN27dAQ/cdjR1qhm12z4nTuzGrNXflCT4STeUeqSsABlpYBO0m5FOCL5nzRsNcgzKGt3c77lK+nG5KThk47ToVPCKvRoBy4VuJPA+bgDlYTuRwD9fCnnwoMJRvzhUV0s4FS7fGVivIQ+MeCXAkCM+cff36C7sdVykxRhtS3f7T08RIge33Ku2yTMafuUr57K5qkPhGReQmqpn6LwPbZhaJAJktQx5fexRCf5AQsFS6aARnihZTZJHRGHHrqAmUyYPNFYfsHwX90/fVO6hec6qm91RlbeTIUG+dLArkF1I2onVH5xQPGnZysgZ2wuXNP1wk/hyT+x5ncvcXAr3pnE3TU2oWB4XPiccyXMHnJz5p+c1vXP+KuNa/1X8Q4K4L0qW5J2V6r/UbsP1z+GglL7Rkned/LS10L/oo1+QI06DKgSEs1JfBdSdI9LMmI038iJjjzeRa+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(136003)(376002)(396003)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(2906002)(26005)(107886003)(41300700001)(36756003)(66476007)(86362001)(83380400001)(1076003)(82960400001)(66556008)(66946007)(316002)(6916009)(4326008)(44832011)(38100700002)(478600001)(6666004)(8676002)(6486002)(6512007)(6506007)(4744005)(8936002)(5660300002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0+7thoUmLQH0aS5ruFu7BAjh4B5SeOQaIQhu9RQG619mK2xvecjkWVJxbUHr?=
 =?us-ascii?Q?oWEJ1y80KnGoZnCqbBo48LXxxrlreex8gfJz7BIC6zcQlZbTcN8P+4t64fYu?=
 =?us-ascii?Q?ENctp76K/X9V9XPJhzW8sBdBaXGDfa5lM0c3WHvrEy4GLOfC+AniWKqlQ31e?=
 =?us-ascii?Q?HfdnszTk3bjuFFBl9uu7vBjaZz7bWph3JzjIrX+slZ9NVbMQxsSlXcLTD8zP?=
 =?us-ascii?Q?zH2k/kIxmCBsyuGlC6Ai+eWFGXv1b3JoH8LRGguhBEV11qSfWOjX9jteWPLf?=
 =?us-ascii?Q?T12uVJn0czINNFp0c1iJ+iRdsGmfOGzQlVs/+jMS7tA891SNZFbRV0OGJrXD?=
 =?us-ascii?Q?SDulHGUwU6EpIQSoltHvQtSAMMo4s1Rr2xio4sXLKGvPloYwb+J2wW0h/v6e?=
 =?us-ascii?Q?97nKS7l+ldF7AVjAJfp1kPV+ju6R21ham11iCXTUqD/xFFV/e1iwxrtGhoG/?=
 =?us-ascii?Q?cxdVQpOmrMyjTAgGLHMVFZ1VR2sBERp59wftyayQ1iSmcoiqOKIEpIcs5IuP?=
 =?us-ascii?Q?WB6zwZHF1A7cjMQD9wgfYUYBCnSMaTfpem//UbQ7cNQg+nmadq4fRmUHz98+?=
 =?us-ascii?Q?hC89FlsM+THTetWMdhnBR0TelNQVqBTlOFac3sdOiBmwF0exSZfvm/9z52kN?=
 =?us-ascii?Q?fpQwukwbukWT2R4PONNIM6Hb7ZbbIpjr+Yym7aahZS6Nv359mN0BmbE7sUsD?=
 =?us-ascii?Q?oxhVBVm2W6acjzU8iAm0DY+aJUtOuakz9cqvOp6iICU8FK/YNO8LDxh2D/OX?=
 =?us-ascii?Q?fgrIIFECgQgMgoOrPfDwZmYctweZxoR97Lq6o6H4gMClrEdzNnykm6tWmBJh?=
 =?us-ascii?Q?tspAwgtnvp539lbJgdmVwKaeW63oi0Zripa9WVEApE9NfrXKEBFogwxJJO5F?=
 =?us-ascii?Q?z3P5WNXVGDgP+fNvfO+uj+hp3Bj21l/07hMCZCuTRCQjrP58lXDFkDwdnI9q?=
 =?us-ascii?Q?YWTLzwtnoBDpqOYqdRKSQPV0Ewk+TdbmBZpTz6AbIZs07VCt6RPGI+FX4AdH?=
 =?us-ascii?Q?I20lZ7FkaTMKnHCOb0t9eL/Xsyib9WwxX7fEmLyWYFDhpg9XmJbYmvDFmhxv?=
 =?us-ascii?Q?9qbE6AyxLX9OgO8EbdlE3ANTg1ylP7d6TopTxNAnQCKOC8xlrvrM3Gu8aVxc?=
 =?us-ascii?Q?eR6zvK2OQmpZ7qPt7+Qm5ovNkZbIstqiQsJqcpavrp+MtwBjb2uK7vuUp4kZ?=
 =?us-ascii?Q?CRYv7TI3cPziXiaVGOiULhTqIOwBWu7QWbHRw7inK5DSUeWEByv9YLKGfyQE?=
 =?us-ascii?Q?zpd3V8C0YRBcE+Y0OfLeRVgAejBwfAQtb1NRsb41q3z+on1FzAhGuMqJCfe9?=
 =?us-ascii?Q?RyjxhJohNdZWfDn6uawDQp4RNGRGCfAbSiCV0S76AyDyDSyb4GXD2AlBtoae?=
 =?us-ascii?Q?9sMJBGK8Ku//HKfQNQlUHpNaPznKe5K23zxe+rizHfPWr2UoMrRmh/A6UYgu?=
 =?us-ascii?Q?Tq2rF6jbOfcTXVwAMuyV5G27Nx7r4eDbm3bE86SlizWZwfQalHSTX8nLkiZJ?=
 =?us-ascii?Q?QBWj1G9iyWuELQt/2dAXRNr0FErehXlH4rbMaaQ5z5WmYBVh6wvtC7uNQKH3?=
 =?us-ascii?Q?ReFCX2fYZkR1AmRV+cG95Ar/z+ZNJ9ZfEhK8T6rz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ee61b72-f534-4d8e-819e-08dc179c9efd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 20:41:03.0447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2I2HeM6X0GpIL4jMna7w/rUlfH03c9RzHaxa7tU1si4u5133f8Kn9qW3HEI/YcQvje4twE7UEelzpw6oZQAJyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5981
X-OriginatorOrg: intel.com
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

This information is already present at
/sys/kernel/debug/dri/0/gt0/uc/guc_log if needed.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 235d27b17ff99..2a71348c5deda 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -466,7 +466,6 @@ static int guc_wait_ucode(struct xe_guc *guc)
 			ret = -ENXIO;
 		}
 
-		xe_guc_log_print(&guc->log, &p);
 	} else {
 		drm_dbg(&xe->drm, "GuC successfully loaded");
 	}
-- 
2.43.0

