Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D12C072A2
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 03:53:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C58BC10E5A2;
	Fri, 17 Nov 2023 03:53:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CEEF10E5A2
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 03:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700193219; x=1731729219;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=cwlRnrGOdo5ux8/jcpFVQDSxFD+D1lXhy8N0iWLgFm4=;
 b=dd7Ae+L4umhE2x/pIN5hezX4GzeCI2XJ/sFFNUeSc8SEd3xbpymgXLoD
 ZfGctaPURL8OTZYazz88IXsCaMF4eElftvlVZKtR2e0G8qSM3+UjVJNoy
 R8KpN73v3lZ5Fq3okLfjdzhUbqreOF2G1w/k3g+1B4aOPDKuUsiobh8Zf
 sdvii7ZZiO6UizzDNDUcjVrExuccAQ1d6yZcdQvWVIsq9F/HJFR/poqO/
 fs4Ud/EU9Vhs5pv4Cmtn8pMjv+gxWhtMlR2faXtDu0zvUQr9X20U9smFz
 qY8FhAgO+zlKnoIkI3sM1XCKlm3ZFxr7E3bbT0tGr0JkqbRDnTepuRZLP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="457727112"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="457727112"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 19:53:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="882984066"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="882984066"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 19:53:36 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 19:53:35 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 19:53:35 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 19:53:35 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 19:53:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LevYO3MMe4TvKQKYjAjbpsuuRZ4zKT3sRgajIDCcOwiLOqzuYqw+O8ZrjyJ6ntfKaDm0F0g13+r+EI7Bdb/ZFFBdPpMieBiW9cH8R+N4QNx7ueRDnlEfggue5fEcP3r2IufTo0ZqdOCWHtwixoDv8Za2jRqFRbcIWFseALgMoGQLevYlsIuV1yf2ZmxEQ1afG5i3hxCZJPz/6pwKhhn0cD6+2omiNsG+n7+ujLA8ND9xfDXPcLOeF+5+yrOWgwYpU8pMY9tr96yqaPcBqCGQUEQ4X0krKJF0VT0xcqz7QSTDdcbVQgaH55WGLKZOY5MOUQR6evYzb2VJeVOmp4ss8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h/BOslanScC55q/ulrYqqabR6kqAi7lelbFG/nALAPg=;
 b=M0GMhxdo5jWg1p6VzqZGL2thj7hd70xffOS7szIFvDufdtE7tonzZmiHFHWOaeIwP3s4Z+i492HdIKwXQe7O3ESgav1mEsyLkFmOp4cNTkFyeO42zwJJ4YUuPb8fnqb0O1sXD94uW6GE1/d7G1Hpb6DzJQoPU5guy6+pNGIJ8E01p4yMG2mAZBpbUwzW1I4kFzg1dgXnHf0JLvgdJoTgoAVzPzlFBbVGIcbiang+Ly97JiQU3EKiJbwPDKpLEBOX0Vu3WzaAjQkpcWbQ6dIyblPur5PdrslW3+UZlqZEjzYd9vS28EiGZWIv3n9/Ry36+pKP3ksBbbY5fAmVuY3u2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.20; Fri, 17 Nov
 2023 03:53:28 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7002.022; Fri, 17 Nov 2023
 03:53:28 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 16 Nov 2023 22:53:21 -0500
Message-ID: <20231117035321.40102-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN0PR11MB6135:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a59511f-79bb-45a6-4926-08dbe720c1c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UBuEZlxaDZABI80jaVvhX9WgaGR1h0LUYih1d9uQ3xrJMRq+JGCxzZBj1TJbh9bWSENMd/Edlv0MlaiviO93NKdJ4/wFYc1/eXtUw7AmJ1cZHVK3cMNJ+xiXnJDs6R0OH6GlpJdUYY+muVGOfXFfuDp5fqplnzCJzX9wP/LlCYPmV4+a7joPyZ8nkD4fm57Xt36mAMeS0QrGFBuci7scnDQ5iHx6/LGD1F+2cNPl4cFxhNG8+WYihlDm5cYxHAf8QIdTg0xAzpTIXu2aPfK8g8g16MLAORuSlcYxqKhvhHTxdEfDJdlV5pMuHrGyE4oNrBQWtWM0h5zo/225vplydTRv/0qdWa2t3zo87yWI07UKDus7xklYIvTr/tT9tFPQCy9IxkIRAV6kbZrL2HG8J1/s8gIRGscp8/KwrU7tMvMcNGvyoJfsq3dVnLi0BNx6o5u45T9ywgQJMAB/iN40+PChXs+Ew6eJ56ytxL8YBFjANSP69vBelx+0pg9Muh48hH99N1W6EimLw+SSwnxAsgPaWwDAnJv6DYY6r2RXMnUzeF/q4xf8x56hG9uBNTMh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(39860400002)(346002)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(83380400001)(38100700002)(66946007)(8676002)(8936002)(66556008)(66476007)(4326008)(107886003)(36756003)(41300700001)(82960400001)(1076003)(4744005)(26005)(6512007)(2616005)(6506007)(6666004)(478600001)(6486002)(2906002)(44832011)(6916009)(316002)(5660300002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MUOJFT2ej/sJDm8pzQHRfBWz4UFjSOlE0zhd8ilt0NWdvcnND7VDbMGIiYL1?=
 =?us-ascii?Q?RZbrSSuVtbkkpeVPqTcOv9sJlmU9TO8GmqINcMUq5i2IHs1K0hAtEo10LuoU?=
 =?us-ascii?Q?9gEJRtaPH2iFYgDektsvC1UuhxXZhUPnwwIFpjSp8OKz4mclZumsA1VcuIQC?=
 =?us-ascii?Q?Iqru5MA8T0R24oDxfMvMrMtQXElvwtO4YAdNVcyzg4EEp+arxwOv4Ujxe57I?=
 =?us-ascii?Q?ouhGamEfsxrZEADTqU/5faKaoL8Ml0LGAcaZ1GYvukuw612BxHBRONzfUkFt?=
 =?us-ascii?Q?ZgONFF2UTYqvRgMW5wKca3MMgFqY5EMebnwqk5bGZiQI3AGl7jp4i9Yj+vlx?=
 =?us-ascii?Q?uEC7ZqmY8mUWjEE8RoNGv36EG/JGZeNoI27jpfjAWXl5BQ+Y6iuIUYHgkUQP?=
 =?us-ascii?Q?LHczOMh2YA2aqi3+B861LXp/UbxG3VJ1OJkT32mw8dRuzMyXuz3KxtxAL1Us?=
 =?us-ascii?Q?eaF+s9FWuSMiPdJT7IGhQOs4i10EO7+9e8mjSkCs7umZzD47z04TzceQUVRv?=
 =?us-ascii?Q?Dz0Yg9lRPvapsibDqS6WlBv6HzHHwk5PnmYbosihYq4shMk/aCNne9ZbTrt4?=
 =?us-ascii?Q?VUKVRdsbBXeciBJrS1r0CxZdqX0trIX2ELnCX5MJlnKsNIdRpptH33IWJ99s?=
 =?us-ascii?Q?O0WECM4qMAb7YZsMIiYh4Jf5kjDfkpsfU5JShC1sUqc7G18dxsC9bz3QfaAd?=
 =?us-ascii?Q?MYpr1X1sBBbCmoHm/K4GKTsnHBdRqh7xtyoKA1zWOdotMlLMEmxdjFcZn8/i?=
 =?us-ascii?Q?x6118cJKo1BSxvWnBBlQzkxNr7C/XOqY6gDj4AIM+iKOQQsvbWPPKzoSXr1N?=
 =?us-ascii?Q?7yqBQ8p/mDyy+8GAbzZJp1DXFddWCJCrd631Hl5Mwq66u7tCuJmFRPMkGQ2l?=
 =?us-ascii?Q?9Xx4RhyTp864eW4RUxZDV/nx0NrbG2UanQy6hVJW9mF1Gmzu+wZyqtzRLzPI?=
 =?us-ascii?Q?hF4Q2JoKn2ffYbLdaw7fbBsLWsHHPe/wVvKS7R7wHNbHi72DYzMh+DlfiPZG?=
 =?us-ascii?Q?0qjza1r4/Gj9oymuGFlw6Id38KRwRW8SDAN/Rs6T9xjU8yktPgDmn/Gpd6bO?=
 =?us-ascii?Q?QeHfd0RkgRy/iVKTKvcXNf+qwTEPQpbRPCqEwvruSCNzBtK7O1UJaxrdv0Lp?=
 =?us-ascii?Q?DsyivPmxSOF0OY7+0X7fKQIAuxCxYqy5Rj38+zwkA4AM6TzOGZR7PEjoOdpf?=
 =?us-ascii?Q?ggAtAfnCAufXhj7A1Jtx9ft1A0o2PL6/SVg6JsfK/aV+ow+MORO6OAoMwKQM?=
 =?us-ascii?Q?mUzoEVSdV9xUJbIUgtd02OTztBEwF/qRoTK/zUcmzeelD+85/mU+q4QZu1Xx?=
 =?us-ascii?Q?7F2QksebB2GF0cYjv/4GkgpNXl9kkExuboh9OYIxh1CEBTv3uW7olNc6FWO2?=
 =?us-ascii?Q?UzR00REW7kBUrYG9LbOLKgnF+26rOSwztL5swhRECssBmhxdYDWnDMBIc0Wf?=
 =?us-ascii?Q?pcjxwLJcAxwT8eG3tM5+pZAT4aRB4602Tn0pM27Yk32a0P6pIrheYp1QtO3L?=
 =?us-ascii?Q?AallFdCRvNKM1cZmDoWCez4Ks0vqKxpCpDBdDncT0Nfh1DTnnZUGd2mDLX30?=
 =?us-ascii?Q?B8aN+hy/3aE7ZXbslTgygXaYLmqJmfOYEWqUC31I?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a59511f-79bb-45a6-4926-08dbe720c1c8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 03:53:28.1374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9MqCuFpJNTIIIvcB1+AdyIPeS8Bg05QNzMBzY5usucjd9Qcg69yCqUVEgmg3LkPX3/6/nI+TRuLT2w5cw4S+2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6135
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH] fixup! drm/xe/uapi: Remove MMIO ioctl
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

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index ae09f777d711..24a23dad7dce 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -124,9 +124,6 @@ static inline int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask,
 	return ret;
 }
 
-int xe_mmio_ioctl(struct drm_device *dev, void *data,
-		  struct drm_file *file);
-
 static inline bool xe_mmio_in_range(const struct xe_gt *gt,
 				    const struct xe_mmio_range *range,
 				    struct xe_reg reg)
-- 
2.41.0

