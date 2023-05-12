Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC044C77B75
	for <intel-xe@archiver.kernel.org>; Fri, 12 May 2023 18:03:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABFE010E239;
	Fri, 12 May 2023 18:03:45 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5927210E239
 for <intel-xe@lists.freedesktop.org>; Fri, 12 May 2023 18:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683914622; x=1715450622;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5Jx4rwVEYXdsDQAIRHHRhIADQt70Vvuz8Y4034j21BY=;
 b=bBUkUO2EOO9wT0nf+SdTBNO4nqBMYYTz2P3JG9FzVKHcyfrtLaqgGZZ3
 A5q7SHX995akCjT/I+fCnAAyb77wkpqouvynB0ljKrmyBR/IcdUwvN/8H
 w9XdONkXNjkgmY71MkGfGpAxpRbgoW8jct3ROdvBr+EPUx34i/nR7E8jf
 dEPHDz5vRzth0FRtfWOS9l3irPLYeLwtif8bz3x4a2H8OAQiq511gsYvj
 8/vx6RcWDpRxE4mBJZYr7uIWZAT95qGpKsw3dDrcvBnGc+2Aq1naOjJJW
 /KFz10LAL+YZN2EGyIoHaS4eRarRxx1kwPCNGEKYQC1uobQEZATMre/o8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="331219479"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="331219479"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 11:03:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="769887792"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="769887792"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 12 May 2023 11:03:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 11:03:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 12 May 2023 11:03:31 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 12 May 2023 11:03:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLZLNecGJ33EEv7yLd5QIfzCKDZ4gpG1dKTl4ejI6g7eUHht1BE2dk2TNkuzkJu6GKg5Jox4NPlgmd1YREA67R4Za+bed5wXqpUIn25y6U4XqH908oSdLp8gUCeJXi2ls33Y6HtgLqt9pQM+JTDf8WmpEj32d5kze+8EKp4tBdBVhLRjBMFzeACsdLjyOtHg1eC+eFY6kXQX0/VXt93v+oNUUdhuCO9MZOEpWwx617e9SGhCKPi9kg6LExndoXqvn9xr8XUw1299H4rDvdYrpjwWHuGjECxHr4Z+/dRjPES07oBt+csdhXR/hNkzfIEHZof15X21bNaY71BUAzJxIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXFxGTlEjY09P5QR3jV7ryftadZGq5JXeAi9ILMaZRo=;
 b=GQgd/P+uiYHa5v3yx9Q3PeHKEwTzP+DSOkd3yR6VQuZz5IKmW2uKi2SmvdmZzzH4yhE6JHiOAxOMeqHoUYihueyvmA8zsnpvgJuHmfJ22Dh3K2X4DbOuR6vCQdrNYS5A9MmGcrzDx4qUnStJ7ywVkBnRES/pH5aLsp66Ff2+LnTw6poEHS0+PgZHL0DJvAxHZuEMF737z1MJm0tiOilBvt4SU7asVV6LVKF1DZOqHas1Yos1ww0nxcvHHh6RoVAlRvN85a915PXbuBC36AkmCXZXpK+uD39l8EoK2LycCG+4BfETeX3nxYl2U8qjVyC9FOBI0RLTKLgi/ZRecYKqzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB8502.namprd11.prod.outlook.com (2603:10b6:510:30c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.24; Fri, 12 May
 2023 18:03:29 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6387.021; Fri, 12 May 2023
 18:03:29 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 12 May 2023 14:03:08 -0400
Message-ID: <20230512180313.1765011-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512180313.1765011-1-rodrigo.vivi@intel.com>
References: <20230512180313.1765011-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0045.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB8502:EE_
X-MS-Office365-Filtering-Correlation-Id: 58692a05-d4f7-463a-59d6-08db531330d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FAuFqdnzBDOCmW06rGxXVlbr+Uz/DGKtnZU0dzwYDKEprpD3vxw1R8ZPlaaOOzRPbK7Cb+ek+9OeFWam60XkflZPEoA6GbIErn+89+YkEnv/pOJ9yewSvhFVW3o/0+ikl/bosvmxG7K0VVi44q0+fxrDS/tquDKHoszIJn4d7D4EzMI4JcpwMoeq0kL0EKmRCXtB5dVTTs0P6g88TzIsINslIqD21t7ZpGlkBgnA6rcz5Ryyw9DE7EMDE90PT2navTj56pUaCtoBmJ18pOJuk03Ae3PoCdg6PHG3hXPVU6k5q+E3IcXgExxADnyl2rderM4wC2V9MiblmgxM5ID2V6aNXujQcKIRVb8BqH61DHs7eyCfFgH+LbeTPXsodXoenGUlRB9SvB2ZaK0jUoS/UQW+8tAElj+h5VkcMQorEZKPqo8zjzdFmIjVWCLvXdR/qbgFV6yYL54oI6QDRgBOXEJTaSKqL86RBRojw3uee1ztR0aOGYyl+dKvTz9x8dlSP+Nom6jPuZmkyeumiw2K8uaFWrB18QKJu14hBo38Ewx/7GaK5mFtFzPNm/aWhnx1LwbTcrtAiy2gBSeoOweTmmNYZozLojjlvDfRavpFikE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(346002)(136003)(366004)(396003)(451199021)(6486002)(316002)(6666004)(41300700001)(36756003)(478600001)(86362001)(66556008)(6916009)(66946007)(66476007)(6512007)(1076003)(6506007)(186003)(26005)(2616005)(83380400001)(4326008)(38100700002)(82960400001)(5660300002)(8676002)(44832011)(8936002)(2906002)(4744005)(107886003)(15583001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QHfDSNZSs6Ee1c7KMXJ7H6vAg4CyaM8ldQ0thayz4EzsUpNsRum/P642mGS7?=
 =?us-ascii?Q?AII63ZXasIZYfB/8HCP/ATez35cXBJujH3/yzIf4Tj1WBjXKZ+CFUHL6XX5e?=
 =?us-ascii?Q?H6Jj4F2iRR6VDpMAyGz2cpa/5i6CbjAcP8XKOZ3m9/sZSy+N1y/wzPO66+2U?=
 =?us-ascii?Q?c4/JWPucSQqmwU8EwFU/T/yiqO/IHY5X/uIXgS9Jsf3VPVbRSmVNSkJKo5e1?=
 =?us-ascii?Q?KLvYJyxcCHcBr+pL32jL4eJnWK5yxYN4s1XNIVejoy9D+67XMcZt+Snp8hCH?=
 =?us-ascii?Q?l/pE4E0H+JGFlpuidnesFUfbUTIEzCvvQqLg0ymMvMz9nSNu44hZUU5hiJU2?=
 =?us-ascii?Q?mxLpMwdJU6iEGXG9sGGZmUrsK8qBoFzFDve2OiHsj8hLTfps2YZgHzVb11OK?=
 =?us-ascii?Q?b0cOj+rMvueeuZv5MjhosMG7vPBvVM+hJ57jzzi2ZQlv5wTmaOmF7W/fIwnw?=
 =?us-ascii?Q?I6ziy3OEfeNUsrbAc97WWCRTXC9XRnEKgovAueyWvqNnf35jMYdbHNTBB45/?=
 =?us-ascii?Q?/MHSj/RAjQ437Js1COz6agvSo8fwo5XXOhuRm3yRxRoeTPqHFrGjh1Ew6YU9?=
 =?us-ascii?Q?CN0//oEuWZgCrijodPFBTJjWLVNyPJZYkiA2ANnbClxCt1d5vag7y1SogQjV?=
 =?us-ascii?Q?z4D6QjeKAsc7xUiwWVyUApsbQqMq7ZI2hPEaU7lZ0IQk6SziHL0e0oIJ7kl+?=
 =?us-ascii?Q?n6bHKlx2S0vxg1HwbeEkd/1AK7+jXedLIyChE3+YgdVQ8kd1CZJtoMEJF4bq?=
 =?us-ascii?Q?+rpCGeje9nkCbYYFrS769s/A6OnJyMd/BebC51DHTIpruS2XFMCFb87n11Zf?=
 =?us-ascii?Q?y78XVwuTpN4v6my/3omyB6cM2lyzlfE8Wzr1izS/Zsapt/MGuzBznb1P5A4u?=
 =?us-ascii?Q?PQf8SpecWZ8DC+KAln2EDueIkjL+bX7BjBxwkd7d3elypbLCcI2GiKji7Fp5?=
 =?us-ascii?Q?nVaWGMI2v+zIxUopDDTkeNoXvHReU8iQT+/Ad/G/lXPHXd6JYMMbOZ7YNX3U?=
 =?us-ascii?Q?TG4k47j9SwzYNhbWOsp4jmn6GRGUqAN5ipHv6gj7dy+mWiR3AfWPyAELHc6c?=
 =?us-ascii?Q?swkM2NSNBY1AKv06rlX//VMoqKsSSb1OQrA60MwOH/aBrC3UpALkJ0zh5eJK?=
 =?us-ascii?Q?v1cyZRhpvW3a9mJC+4l+XXf4JbERzWWr5AS033vajdOM1+faFQPiQzbuCePA?=
 =?us-ascii?Q?+dv3gRZolUC8boqkWrmDw3w2bDg2sklG1TU593iiKgMpmdShwFfP43hxUY9W?=
 =?us-ascii?Q?DOIFEe4aYZSZCIdBOcPF2Dgo8SVIw2rUXlJOaV8XPB5f6KPMUFd/JdLSS3+E?=
 =?us-ascii?Q?QRRBVVaWS6QCgEtcPNpX6TOtpwkBN6Jn/XFs+iFgoNO+tC6MjWQbp0x11ebI?=
 =?us-ascii?Q?sQvzfrCQXVfncSyktmLVt8SsOuZfpmQoGJM5pl9AWb2ui8k80eLOdOa17YB/?=
 =?us-ascii?Q?JuD0M0WZGAPx5HnLNKjDG7pjGOkqeH4aQQ/GxoAzQFF3vz/qd207aXvSlHrg?=
 =?us-ascii?Q?gsnsyq4O121bPn/W0ErzDHJBABYD0ivUAF03uyIn5TmUxpmISOZzKp/2CvHn?=
 =?us-ascii?Q?Hwc1ufFhMfbGoWr2Ugxsr61Z56VakZF2dSsGVN3B?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58692a05-d4f7-463a-59d6-08db531330d7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 18:03:29.4689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s/XsUPV8z9QnPy6hOqgjWHLlH3PVQ+CsKamNOpFsYx5uvzw1i4xuH0N0l1F8FCdDXkCwJVN0TfbOC4TXqvDZnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8502
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 2/7] DUMMY commit: only to get the fixup applied.
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

to be removed on the next clean-up rebase.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_sprite.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index 718fe026c5f7..d9713094735b 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -46,7 +46,6 @@
 #include "intel_de.h"
 #include "intel_display_types.h"
 #include "intel_fb.h"
-#include "intel_frontbuffer.h"
 #include "intel_sprite.h"
 
 static void i9xx_plane_linear_gamma(u16 gamma[8])
-- 
2.39.2

