Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CC3C46CD2
	for <intel-xe@archiver.kernel.org>; Thu, 28 Dec 2023 02:13:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F53E10E061;
	Thu, 28 Dec 2023 02:13:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0204410E061
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Dec 2023 02:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703729608; x=1735265608;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=HdvB66NSvmROqKx3GLq12thn6VbAhGubDRjRvRxAfBU=;
 b=hViKy4EBXE/pAFe7PWkVxwsXrjtAF4+cReW+itLV6XK8iwyCNoVJlIAS
 g4Ds+J9EHNn9Wr6OeR8keIpq32jKhfjdArHXORvot+RYYHeYyJXPjr+JP
 GQNUoF2EQchstD8KVwkn2G6zFUzXnFvPTsjs38lX5kGSUvHtCgyLwsDPr
 LMeBpK2K7LGQbAR2KnQs2iSPa3YUbCkNOwN7PS/yaD5EBtZJw45tIai2K
 B3VnzPc/c1Ptw0+WtDds0778ZQ4IQTdUW4IxzPIrUwe70LYuTRsYsUT3j
 iE/hVkaztDk6jH1Cx/jTkU9WWLAb2t8+ILW6HHdS6BsHGRSdYlLm8hPIp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="3807718"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; 
   d="scan'208";a="3807718"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 18:13:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="921983509"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="921983509"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Dec 2023 18:13:27 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 18:13:27 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Dec 2023 18:13:27 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Dec 2023 18:13:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YOnYZoueniMe+xEJRGpopxKvU5CJPxHdCXf2z1F2jsQxSsG7D1pBH2r/H1CxIVGvA1Ji37a7U9YEOHQE6KrXYNSzSvRhs1R36y9vYjQP9V29Fh/fNv5gAsyTcLAUqVtD8GP/xyn0aifJrhUV6UHVigYefDE7iRkcETBIT6mMBrlDrNcl4IU613WHfIx9I97Dct8U0FBJjpSCyiZVw/KyOCtM6x6bzpzD0ZRFZCeC4wYTNvvIeqJZwXe212Rosykghwg2J+1fAttdc4tqdXNdUamarCO057ZD5GZPsy7o2HumA2JruZIsDjnCgBpPeVkRcF0kgSFwCyGZ04JWx6pvVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dyjKdwCAzCzmXVsm4GRnMaePQPrCKmtE4hMbOPUU7Dc=;
 b=Yf2hIyywT8PQ0Yu+cz1FMkh0+9DpFL4szY4P+XmozSsgrgAw54wo0kC3MFXIh4lAd7G/dVdmpvtofgallDdNOhcDUjoBdROSPg5re2ohXl9GmPpARP1880c8xYgLOU+1dv8CWf1oyys8x7xgyv89oD7VmrdUwKNllFxTvV9olVESoEWJHReRU8V6keOZSeFwjFo8ng6ep1aBJ1fWP3ZsGRRHJPRQCiKSjQd7ei4+A2NfZrnKQhpFhA2xnYGVP9f8ka53VYNgdi7gCT/c/3bYanYWingMvkIhsQKyjwLtpska36ktnwfLQiD1SKdUuA1K+b218vHBwdkztLtHfDAIQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7146.namprd11.prod.outlook.com (2603:10b6:510:1ed::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Thu, 28 Dec
 2023 02:13:24 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7113.027; Thu, 28 Dec 2023
 02:13:24 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 14/20] drm/xe: Replace dma_buf mem_access per direct
 xe_pm_runtime calls
Date: Wed, 27 Dec 2023 21:12:26 -0500
Message-ID: <20231228021232.2366249-15-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0076.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: c57f6ab8-4ae9-41da-ef02-08dc074a91fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /edgebJ/aDbiDxIFVH8YnOFkePnw9zUJFPTCLEKP94F4+FB23qQ0r733p1Y0b+18nl4sa2HTNOQ1A1d/C36lqBvhZAobq7y0gbDUbfDA5jCBEVXZ5T8O9FK3aVcTB3TRYLv0YvX/djE5yeN0dFBe4Q9gqyJCvBHJZ7U0v2kWG2p2bmwRVKj/0AYw0a8Y8djvMWJZOGYN0RtKq2gFSwBwrmVCJjJP9/5hRzyhHEykgh7AbSON5mnKspqpcOfhg8yGuNRaDsssKUo5xjaA5pSDsNVCYCE+7DlTGB1sfeoHckk4ajlvBn+QEEMC/OM31eqst5EjwhuHi08h99p8JX8B4d3F67GGrWpFfa8KHo6JoSJ9Z02Qft5TScaBC1cRYBONBSWaBEpeVGCJf4FXowSUTYV1A4GQHXBmN9sV+CVC6se72F+PyjhQIKvvxyLvWnMmmLuo1yUxfQ4+d+cwS7fZ3xYS2wJhO8DAZe9M7+npb7xZL837WzqFTJnjqBaeMi2kgGkNvZlfitCJkG5DPjpTWfgv5NUAMidGL0UXXOlZQ1fCmBHGEMmB+6G408hYaFWU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(82960400001)(2906002)(38100700002)(36756003)(86362001)(41300700001)(66556008)(66476007)(316002)(6916009)(83380400001)(66946007)(6506007)(478600001)(6486002)(26005)(2616005)(107886003)(1076003)(8676002)(44832011)(8936002)(6512007)(4326008)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kYTdelUv32xPk3SmzD5JhjnCl2YwjxPNsjBvLDyutle167Fp6yu4hTd+vC+v?=
 =?us-ascii?Q?VWMesYTfL6DVDplTt0xiX7kv6/jdzfKadI5eHBrmtAdyV5buovY3yWyN4Rg4?=
 =?us-ascii?Q?tfWjNLpNNgXeKha5+lommwSbbys6ZFqqdnwy7Z0oC7ZuAZigUgXtlh5OYZH/?=
 =?us-ascii?Q?/tyK8si5aLzXMBR5SxCjkvE49g/PEqIi6Iol9aaepYccUdsHeQcbZfXWmFCh?=
 =?us-ascii?Q?h0+vfQJ3KWkePdIvxiOhpc2x9BmyOYiGGnr6ngVY9rDH3MZIYA79PKTNqYDu?=
 =?us-ascii?Q?jdzcSz7BI/aV2j0+l8TwYXfVc8jt5kNx4cC0NjHrwWEeLPYFR6j3PXWvBVFF?=
 =?us-ascii?Q?cu+/eZjDpuDsKDcvd0cfjcS977VlOF+gbmUkoLhQijpf+FccBiBPxej8L93r?=
 =?us-ascii?Q?+UdZetzWTvji027FSNbJoXgo1XXqEPAxLl1iA+QENpTeDWx7/h/tyqZUbBRP?=
 =?us-ascii?Q?O34nWPZhqnOUo8G6VRJeOAVE87aw3T8YNrkiabr7RyK061aBopmwRZdWhjGi?=
 =?us-ascii?Q?D9YXjca86R2ishZ2oIFeEvCmeHVXN65mo1HRWp1uqTiOel6CoxCavLeEjFpZ?=
 =?us-ascii?Q?zG1Sy9hrO4KS3cWWiXxBpch8qTam8Q1RiIWqTV7nDG5Itkx1ZF5oS2WV97/L?=
 =?us-ascii?Q?sEx9ejwHWtVzM5sJxderI8EZHjncthg3ZgXkI3bMq6o+aHCoWu125kcvHJqH?=
 =?us-ascii?Q?frsQ5SXmA/PoZjQdWPxoKuCOUXusOycEsgUkxUHsU628/odqMVpLLuL/LG0V?=
 =?us-ascii?Q?pDLnF1vSwpG82ELdJzSXGX9M89tmQD6EugJQjvyutyFu8RHsCbb/GkpqKNvj?=
 =?us-ascii?Q?/k4nLBWfvz2SoMBTC7Lh9crUt4AcMemnSGJzTfzdckVv4TzBpuD/N5bmZI3m?=
 =?us-ascii?Q?GyrhoRTZ8KxPcXGj0SD9s7sVO7w9Tvok2aLg92C+VqRyELYJVKXwqtKcyrEE?=
 =?us-ascii?Q?H5ee2xxWUnRFUSx7z6BU7SLptxFwoZ3VO8k97xZmB6KaCrqVQ2yOGJqVTJTg?=
 =?us-ascii?Q?BOEa/BOoEZ2nEbqroqAfp+jcUqCV+7oHxlmdR2S1Lya1VtmEBiRg9VlA6jVG?=
 =?us-ascii?Q?SV6wJEGR0hr8f7K6DE64QGgEyEHBsqIE5rgblbBpr2kPj/+ebYlqHUTVmjdp?=
 =?us-ascii?Q?bYFoMYz/7kB6y/9kCXzTUsRUKyMKWhg2cFrAo83GUVV36INGm0hrblKs01xU?=
 =?us-ascii?Q?vlNA/bjOZb9uzYk5EY1T/q/gr9upK96tdttuBNTDbdcPNBu3S+y040ATwK6b?=
 =?us-ascii?Q?IOnZhdBL2gHq5KeM8ErlDAu613ysfnT3PDB/79lnJu5YVN1KPb3HU5mE5SJA?=
 =?us-ascii?Q?haD8g3zyiH7AhUSQ1cdebOQ447h8NSjuXTHO7dbtqv+R6MJjIXt0ljbBHSV4?=
 =?us-ascii?Q?x/yLN99YlCkvEfbRrno1HgMxNeLaJXJ2whzscMjAcSzdz8kCyQrpIkQqbqOc?=
 =?us-ascii?Q?LSGaGXnyHME9NqWht5govsvEhmH2DJHiS8tKYl4e1VorvrmqRRwRg3KyZbUe?=
 =?us-ascii?Q?f6Lp2UxbhzkV4NJsmX6h9kyHuJicWDcvZxxZYT1E5hQz6q8tsJy30If5nBWO?=
 =?us-ascii?Q?34O5kMRmCdF2BzbJoAzYQip/zB4NRXndExeHE3Z/i4qKF5PXkUJwdp0P11+P?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c57f6ab8-4ae9-41da-ef02-08dc074a91fa
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 02:13:24.0106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i+m+4t7pewFMQptz51bDKI9fBc/0+SgYohj9VxgV2L5PFlqc35V7fJf4GjFYxFV6cQ/4Oft+YC6OovvzNJYIgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7146
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

Continue on the path to entirely remove mem_access helpers in
favor of the direct xe_pm_runtime calls. This item is one of
the direct outer bounds of the protection.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_dma_buf.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 64ed303728fda..eeee103c5c14a 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -16,6 +16,7 @@
 #include "tests/xe_test.h"
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_pm.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vm.h"
 
@@ -33,7 +34,7 @@ static int xe_dma_buf_attach(struct dma_buf *dmabuf,
 	if (!attach->peer2peer && !xe_bo_can_migrate(gem_to_xe_bo(obj), XE_PL_TT))
 		return -EOPNOTSUPP;
 
-	xe_device_mem_access_get(to_xe_device(obj->dev));
+	xe_pm_runtime_get(to_xe_device(obj->dev));
 	return 0;
 }
 
@@ -42,7 +43,7 @@ static void xe_dma_buf_detach(struct dma_buf *dmabuf,
 {
 	struct drm_gem_object *obj = attach->dmabuf->priv;
 
-	xe_device_mem_access_put(to_xe_device(obj->dev));
+	xe_pm_runtime_put(to_xe_device(obj->dev));
 }
 
 static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
-- 
2.43.0

