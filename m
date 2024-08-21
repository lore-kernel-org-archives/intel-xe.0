Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CA6C52D7C
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 19:39:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BDEC10E6AE;
	Wed, 21 Aug 2024 19:39:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ku16k0kP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD54410E6AE
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Aug 2024 19:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724269147; x=1755805147;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=yLYqJAWrKs8ufPDgFhClF+PeGNTPjbcrbZTvXTUnGaE=;
 b=ku16k0kPaIz27JTXVyliQEktITsMwWKu4vywM962ZUPzUmHpi2NABX/J
 i/IFIZPB+/s8WipMomxnH6Nrod58t3kJT3CQtcmy3jqk1O9Wrt0zJVQti
 jTvqdAE+KfQJ6jR3AQZwjNjEXlsCDEE02ljHP8ORaMhQIcAHk4aGWGR2V
 SHEYDKIWVq1qFOvqw6Ty7uDxNguhP60Os6OJ/tGrRW/cSqDcWJwOKmrE2
 Im3ein8dCQVhgbpQN5Qf3qn+D8pSzNZWUD0XpfLZEPurM62Renjey99cE
 geT3u+SfHqfbk2e2NiAYhwbUpuhaqCvpFSGj0pYK8spyxZe+mVlxQtr0/ Q==;
X-CSE-ConnectionGUID: LHiqoazYRCqtsUXketE/EQ==
X-CSE-MsgGUID: +AB7sDbWT5yeihwbSj+Fxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22805295"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="22805295"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 12:39:07 -0700
X-CSE-ConnectionGUID: j/KQujBqR06gZ+4mUQy5zw==
X-CSE-MsgGUID: G9FQHUZQRIuxkfquFattIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="60907600"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Aug 2024 12:39:06 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 12:39:06 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 12:39:06 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 12:39:06 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 12:39:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TWFbQoNw7ZEDMeYJ5fIt+rlEAej4fAqxIiy221FSfduyyqUAtk8m/xcbcnzhYbxFeZfxVKL3zXm4stJ0gpugscbcRQY3yoYzfY8cFyjaiYUj4AatP7va/Nrp644MahccHCUidrw55bTdG76KHZ/AmQzcJ5GXNQR6s9XSlTx6IL6OUuYROofDTV+AufgINliTrecgUn02qgUeaY/CpsKNj0UXshPNtGfoxtlMgPUcvUMLx6acuvndmqjimWoqgE04Xx/F4diB/UxnYmue8LzFnHP8iHSuh0Ta7g3xlRYqAVi7wH33acV87UOwarlcRKbrtX8S3K4EQu02xL4HK+jxsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZk2YhbbAoOy0Vaz6pO3TvZtfrppic7rJaKuEw5NufY=;
 b=EsqymJS6EIV0RuYbUPCwet0mc15IvwUUInls1Q4PBcxq/L/6e/Q58E9awoooqe6RDKxcP5+uzZFuEOyCBAqatBinXLAu4mYhacuv/7lMRJ77fky+Ex5vNR86fZ1jr2D2p0n8+/l7NU03oJhq+seFkXKNxD30pPL85qDc/fkLDE24TBOP08slgMopYWMJrm0s8dP3dRnjwEwkDeUunrlK21FBKK7CIvLQckU0/63gnVcEa1YtroFALcZoEvIrv+3hYGApzQ7aTH3Uwu8tMT5dewknmYxdyd5hxY3Rd8kCc6M+7YSsR88Ge68tO0OSMFzVkkgkFe+iKvIqxX6+8gz/qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by MN0PR11MB6232.namprd11.prod.outlook.com (2603:10b6:208:3c3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 19:39:03 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 19:39:03 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH 08/12] drm/xe: Introduce xe_ggtt_largest_hole
Date: Wed, 21 Aug 2024 15:38:38 -0400
Message-ID: <20240821193842.352557-8-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240821193842.352557-1-rodrigo.vivi@intel.com>
References: <20240821193842.352557-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::8) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|MN0PR11MB6232:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c893d53-d388-4280-b452-08dcc218e975
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5uRRoKiWBSLsMLC+S7fRmncK3vJBaTbo/epDtgegGXEoCMMFUKUyRlfJWhH7?=
 =?us-ascii?Q?idjLQkUP6GyCG7DuWt481aMccuBxlG9cQL8sMHU0wbOKmRFVm5NS4ScpfT0p?=
 =?us-ascii?Q?k/Ixd7zFdLOIMSRJLDo1mXjEqiJBW9QORmGM6JKlIeqkfERG8jbjVE7+7JDf?=
 =?us-ascii?Q?ASJwal9OmSn8DqAEPsw0DxzHwXX25IxcKm4UurmNOUqJvsIHgSNZBRa/l8in?=
 =?us-ascii?Q?uaYRLQ1ymvyNE4usPmpWVGi8qgd2TPF5BzKvy8ExaHCaVlp7uQNaFPvceHdE?=
 =?us-ascii?Q?1w/PCdvkJ4qlmbyVMizIgHaQvpfywv4/lueFtKzTCSIUA0is/mgKdDow50WS?=
 =?us-ascii?Q?yOlczoZ9jfTboE5/Kr4Bka2HbtVN64Udi+i+3M8UW50IKZjbxlATv75UVpDf?=
 =?us-ascii?Q?ACT/d0YC+9T0/oqNObAYj2HtpTvOQqBjVZ7OnSX6KbV19nf/yDlqomVd1WYj?=
 =?us-ascii?Q?G+rwTx6AcKCvcXf0cm8lYujICvo50TDHEc+MpvUqV0FPlIhJt7EJavyqRfpB?=
 =?us-ascii?Q?a0xcs08BpDLkAR2x1h8/bALrr4nrD/RIssvPrDHma7Wci5v6LZbyFDBRznmN?=
 =?us-ascii?Q?awBBX4F7JBkBcC39Jkt9jFREQn9MgJQnHAQKC0sJCYqSU4hrocWgAQfLyPko?=
 =?us-ascii?Q?pCw9p21HKB0hh2WeduZDl8l1i6tb8fq9aq7I9buDdTPZeTe3yKkwgRbO17um?=
 =?us-ascii?Q?7XuqnPerD5uQBeYoVlmtpWb1eLIYj/52XECRp3LomBKMyvLm9QQxp4gcYWFb?=
 =?us-ascii?Q?UdC3zLlCYxXhSGAAo1D7nClkHmrHNV4/KLE+bvYgDCBImAC+4asDBNTEM2tn?=
 =?us-ascii?Q?zO9WnjycPADBNT5QXY9OFGZBUkMenFpvdOZ6T8nfliNj2AZ9nJVyoJs2rYd6?=
 =?us-ascii?Q?MqAO5j5e+YOameSkipS5mDxEvxFrYVf3XW32wvls4aVr2OAZlYqq2iz7zsk5?=
 =?us-ascii?Q?det1O3vL0VxzP8+oHUCmDPtCVjReJUmbXCd92NzGJZuaCkAD11bCLswqIRQ4?=
 =?us-ascii?Q?FIPq81/aA87axwdIboiIiw8FlBqyLKK5MQ47yUMvOLc3r4dOnvFVL1o1pPSb?=
 =?us-ascii?Q?CFbnPnf1f9VNrY9dExWv33GrZEZ9rElNIQYgSw9sndduJNdFUs0Fx5vn1aOn?=
 =?us-ascii?Q?qPDyS640W+hOmLxeeAwgczKPpYUAGN27IUwdPTZBy3jR7yJopKpTa92Ttvax?=
 =?us-ascii?Q?YZWS5PF/lhlPKNq4OB33HRoB5IvvxsDro4/7rs0Q3LJaBaz5FjeNwcH7SZdW?=
 =?us-ascii?Q?sMa7FJYkv8GZhkFJ0pIatoqgC5hIGymHi6C8gY6xjMpeboImZbG44VW7EKe5?=
 =?us-ascii?Q?iCWZ5yRkAHmPDXaU6IgMt8X+oLlaQNWG+jvjC2AH4jRfNg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2UY6+pobpWAoGnIPoXa0lyqwcWSIq2vQVFOYVwBhYPr7Q0W1+JYjrE6LO+K5?=
 =?us-ascii?Q?cHiyz1jqUwUxDCOSpEGax80DRhzXulqFHfDHGOmdrifkOippSLAM2HHPezNW?=
 =?us-ascii?Q?ikH2KxpSIUvzkvCv4MR7L/X3hiCIPIHZvMBD3OFEZPfKfjTs2JSz8Gb3PKJo?=
 =?us-ascii?Q?tW8IyagnFOXRa+nA0xsmO0UV6XHZC9z+Uj/tEfuoBnfsNG2AZSs7bVQzp9Br?=
 =?us-ascii?Q?iHbKCa3ESv2W5H302vH2pqP9jTc9gPw7DMc0lwKEbCxUyqakkrrcnF4v51Pt?=
 =?us-ascii?Q?kiv1WIqvh/ipQbrcMg82un/Z4YXLEkYDnPoyXM8+XrcKMwGRz65sxEhd4lFS?=
 =?us-ascii?Q?ZiduyC2UeFbRb2moNqWaYZpBP1vcLb9ZYnj84eEiA+4cCwUyLNt/y0KmFcgZ?=
 =?us-ascii?Q?2bydCuRyWDgkVaSW4O/vwv1phxeMabHej8czKY/bziyk31h3xFpQdVudh4Sb?=
 =?us-ascii?Q?lGeoDnn0Mid/4E7H0BXh0rbs7tV587b0KR4EmyucmvDuGohjKrJy3aU5Gns1?=
 =?us-ascii?Q?nmwvMvkI1rEZAkitsBpvYdh/DEar3Gpa0uOgDCZxHhSt31epD2FBCZtGuK7u?=
 =?us-ascii?Q?+sSKWyLgNyuwux7Uw7ujQm+3pa73Hfhz5qymsq0qtdLg+ZwM622BqZM66tH4?=
 =?us-ascii?Q?eXr1LGtxWCzYeXsKATeGF4b35M6aM3cYCXNtiDdlXeI6FVX/UmdEaoIi8Wim?=
 =?us-ascii?Q?QyOH2yvHkynp8MPzS8th1UWvJzvgoGvQEz0g/cBiIw5uATOw4MsrJFwAgQ7o?=
 =?us-ascii?Q?jspwrYvT3c6VevXq7MrDJkZAYOuoBj2mbgKOxokTHQO7zQ3IrwcXd9Sp5oxM?=
 =?us-ascii?Q?7pZmGeE74CgiSUHsXbUyUOMAnMG+NJmU9jUIYw3QSrW8TR9BE6n9NNqBeX1D?=
 =?us-ascii?Q?5j95hR4ZdVBG+QlvRXvKHRcXhfqQHsk4pmCoSnltQzm+egBKe8wno1se6UXC?=
 =?us-ascii?Q?XbfVAfndvIhOhtPUZclIYLDoa90jHomtZyuI3Bjvq6qT68dZyWK0F14f+gNF?=
 =?us-ascii?Q?HwlCvUleEYoyr/pVgpQGBzMF8rDmNrBTSKgv1EPCiQnjruOf+EIZgEtUsVdq?=
 =?us-ascii?Q?I0PlHdEiGLPkKK8SoL2n3sZZxwNQ24mQUs49esmW6vx6SLwOWVrNWSh2Wj4s?=
 =?us-ascii?Q?wQpTEH6JA2K8sbHTxcEOVkTq/Sb+A/7CDOuzh5PWTqoG6ig5O9Cj4edPMHTV?=
 =?us-ascii?Q?zeubD84fk7mel/RphKqP8O2M8YGMkjfg4aqvHc60Rrynl+/sYgPPdRSWrPxN?=
 =?us-ascii?Q?e2aSTtz0eJBKWuJNVynuFJN1kW3PQ2IS7UGcVcyvo50wgCL2+sTmMy0R1/KX?=
 =?us-ascii?Q?IxzqHjvVlNZHLYn+8+WTgq9ywY0MogRVk47jMXMFuFmsNe6FIVljfZgIo6CB?=
 =?us-ascii?Q?ujirhxCOZpz65Da+tfalnXv4oGijGqmg1+Tklfi2ziemJmZjycvnb8w2uVn3?=
 =?us-ascii?Q?8YZ9g0vRng7/iC1fsqWL3SJvuBXHp2igjJzCY4PPH6UuZQ7nBIwypkpzDb6H?=
 =?us-ascii?Q?iXJs6DEhQBTikbyz/XAM2KZ3+MbknwgSPyxny8CXazxiF8QCdLimlMctcio5?=
 =?us-ascii?Q?pbT8TTk8jYPHhmIdzc4X76ys2XFOvIlj6hIdtOBnEO3mnULPg449CIGS9PwJ?=
 =?us-ascii?Q?Ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c893d53-d388-4280-b452-08dcc218e975
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 19:39:03.3858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GvU0fSEbs9J19/u91CxW3f2DF28Y0hfMYp0C4t/dqrAubH83kxIcDyeR3uq2uOHYwwBSVN3avbGCABUoz/+dbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6232
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Introduce a new xe_ggtt_largest_hole helper that attends the SRIOV
demand and continue with the goal of limiting drm_mm access to xe_ggtt.

v2: Fix a typo (Michal)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c               | 35 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h               |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 23 ++------------
 3 files changed, 38 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 7c8bbaa30fca..2d055f489879 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -584,6 +584,41 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 			    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
 }
 
+/**
+ * xe_ggtt_largest_hole - Largest GGTT hole
+ * @ggtt: the &xe_ggtt that will be inspected
+ * @alignment: minimum alignment
+ * @spare: If not NULL: in: desired memory size to be spared / out: Adjusted possible spare
+ *
+ * Return: size of the largest continuous GGTT region
+ */
+u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare)
+{
+	const struct drm_mm *mm = &ggtt->mm;
+	const struct drm_mm_node *entry;
+	u64 hole_min_start = xe_wopcm_size(tile_to_xe(ggtt->tile));
+	u64 hole_start, hole_end, hole_size;
+	u64 max_hole = 0;
+
+	mutex_lock(&ggtt->lock);
+
+	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
+		hole_start = max(hole_start, hole_min_start);
+		hole_start = ALIGN(hole_start, alignment);
+		hole_end = ALIGN_DOWN(hole_end, alignment);
+		if (hole_start >= hole_end)
+			continue;
+		hole_size = hole_end - hole_start;
+		if (spare)
+			*spare -= min3(*spare, hole_size, max_hole);
+		max_hole = max(max_hole, hole_size);
+	}
+
+	mutex_unlock(&ggtt->lock);
+
+	return max_hole;
+}
+
 #ifdef CONFIG_PCI_IOV
 static u64 xe_encode_vfid_pte(u16 vfid)
 {
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index f816b3c0732b..31060fe7644b 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -29,6 +29,7 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 			 u64 start, u64 end);
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
+u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
 
 int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 947750d97d7d..1852ff45bea4 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -590,30 +590,11 @@ int xe_gt_sriov_pf_config_bulk_set_ggtt(struct xe_gt *gt, unsigned int vfid,
 static u64 pf_get_max_ggtt(struct xe_gt *gt)
 {
 	struct xe_ggtt *ggtt = gt_to_tile(gt)->mem.ggtt;
-	const struct drm_mm *mm = &ggtt->mm;
-	const struct drm_mm_node *entry;
 	u64 alignment = pf_get_ggtt_alignment(gt);
 	u64 spare = pf_get_spare_ggtt(gt);
-	u64 hole_min_start = xe_wopcm_size(gt_to_xe(gt));
-	u64 hole_start, hole_end, hole_size;
-	u64 max_hole = 0;
-
-	mutex_lock(&ggtt->lock);
-
-	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
-		hole_start = max(hole_start, hole_min_start);
-		hole_start = ALIGN(hole_start, alignment);
-		hole_end = ALIGN_DOWN(hole_end, alignment);
-		if (hole_start >= hole_end)
-			continue;
-		hole_size = hole_end - hole_start;
-		xe_gt_sriov_dbg_verbose(gt, "HOLE start %llx size %lluK\n",
-					hole_start, hole_size / SZ_1K);
-		spare -= min3(spare, hole_size, max_hole);
-		max_hole = max(max_hole, hole_size);
-	}
+	u64 max_hole;
 
-	mutex_unlock(&ggtt->lock);
+	max_hole = xe_ggtt_largest_hole(ggtt, alignment, &spare);
 
 	xe_gt_sriov_dbg_verbose(gt, "HOLE max %lluK reserved %lluK\n",
 				max_hole / SZ_1K, spare / SZ_1K);
-- 
2.46.0

