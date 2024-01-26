Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83188C47422
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:32:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A94F10FE5A;
	Fri, 26 Jan 2024 20:32:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A61E210FE5A
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 20:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706301160; x=1737837160;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=7IHpNrfPPAamCN8u/XxOKwuMpnpl4GoIZ391gZLs+5s=;
 b=aFpB0J1HNDgjdMvKDF4q7KEX1ftxfcUY0/kyGXo7iCK9G6T/9/gu5k5J
 zuGQigEKcA5o7DJ3plPl2Wi9PPC1H3qOA6cJ6Tjmk7t3oJbFXLkiy12V5
 z0Z2Jj760ZkqVt8QaDqFadkSDM1rHhwNpIukCtkvYb32kWXMkT3ODQ9Iv
 0LVgi7pROKTqu+cJyDrNfzR23zd2l7+rmpdVAWkBg12qj3M3xsXLTPkxu
 7D0k6V3SIfdthMUELunOhhCtXbkPWGBylHdC+pXmcmHldQCqk/t4YYJs8
 2dOIwgItkowtPHvsDZ+7+c/7CWbhkOnCzkOjpIbUlWtkEO9zukdQ4oR/Q w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="1494839"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1494839"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 12:32:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="821245458"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="821245458"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 12:32:38 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:32:37 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 12:32:37 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 12:32:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1P6eVX06XNUtVI+ahEfbJLryfKGrw1CDWBI2eLXeZvAYA7K0vwHPh0rhni4pJfTtXUALFfKkgRl0P+w+TlFlkuCN8J8ku9HuYtCrN7AjyR05ff8ji3m9bI9Na3gMjq7BTH1rWB8F4Zu1qP+fO/57I3UJgMqZr7G/BtkPSSjUNKkiWvu3E+02HZmoHfic+1xpawl4OUMxyvikhvmHNQRgSZ/YB/iDXXRVRjB65tGMBoT5Q1mpx2ldbXhYHwMzJLijWz7u2qRkIO0P3eXqoBkXomTyLrqbUyQS0Pu3bccAaFexfePez/kTrzikNZLLNBVCtWR63Mc8ARxwC5PinGVrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eH2J4tElyA6nkdCzZx4muB1T0GQHsSieJPDzQIG7Sck=;
 b=cZKcXy92cushHs3tSP4tnOJnrzE1Xe6sybeMyXSuh6rvddtuZo6E38x+MT0c3muRTz8I2iVV1emAdRcCEEeZNT99xyt+z3HRRKSRv4mj3fDm6Fi1aAxcnfnzlCYB1ylPAXlaOJTzL53UzuGmFoPtFIJCanXuvRrk/a7wSt1+FoXTOqeNf217HzBtWrlAQKB2Y2ObAxh+uhTw/+JeJCvZuyYx+7BaRQ3SxMehQzIqFr4/4gBb0qtPJPGE3iGB3Eoaz/28LGhtsVIHBwhIXOiwlTvMNL3HznIZ6sbJz/ztMcwS+Zex4GUpgR7kSS8RH1Cq29tS1xCgMMWm4+C13hGH+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5769.namprd11.prod.outlook.com (2603:10b6:a03:420::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Fri, 26 Jan
 2024 20:32:35 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 20:32:35 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 34/34] drm/xe: Enable D3Cold on 'low' VRAM utilization
Date: Fri, 26 Jan 2024 15:30:43 -0500
Message-ID: <20240126203044.1104705-35-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0028.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::41) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: e491f601-d78b-4d79-b8c9-08dc1eadee18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ojnb+o5ds1ig5eFcgBAcvCN1pid9oxWSmbFQRTgHAgpXa0kOI0JaGQCxFklxpDIZ5u0L76f0j25wxrVCGoneJeoESoLzOiFAp+aUMzdcBu8X7qoxraHJOofCVbs5uvJ5tLI2KXHhYjfWcZJNLa08NN9srW+GYKJxGgMhRcLDIbN07B9MLbs/z46dX5ChVdHW56n1yrFWDqeTE1mDRSkMQTLCl0vpdlLCvyQy/WO54v/c0geyQb9g0zegCPOo8HnPVg2UGXEN9cL2mX/yHfdobF9h0dQgqcCmTgFgUetf2bP8FoRuAlXnmV3fpyKL6YRoUw6G03cfB1FkJdbUDBgnrt5YWMwlZfUiokPCQgFTYej/kET7eF0SwliDBhznGD+DxhiurjDbifY8hwikjcEvXygJeGDIXo7N9x0630OBvQgizN4UJk5zSoyv4wULwkawAnSTRrM2cXc/J2l0TQwO45IVY+YcFDD1K5pScgf0JjGRYVfIfWBqUS1ftIbY58GT6MKxrXlFz1tIowdNUtFfZe8ptk7RJ59HVBKfkEjAfntWUR2IKd/SaIBhEqhKem6Xb5zOy5a1sQNiSgRAPEAtLhYOXINSDpLJUUCsywykm+A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(366004)(376002)(396003)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(83380400001)(41300700001)(66556008)(6512007)(2616005)(107886003)(26005)(38100700002)(8936002)(6506007)(1076003)(5660300002)(4326008)(8676002)(66946007)(44832011)(66476007)(2906002)(6486002)(478600001)(6666004)(316002)(6916009)(36756003)(82960400001)(86362001)(4744005)(32563001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K/BHtmrzBr4VG9LXCuOr1NTT2qrNlSpkT2nfDlVLpFUCH8TuiK6Q5sKPC8pe?=
 =?us-ascii?Q?LvRhURe54wpnFyr/YXelKapbDun/iXwqPN19GT345dlqx7AWLAyFMinY+da8?=
 =?us-ascii?Q?e7kWtju2aJbGI32UqAesTlmZxEpsQASq5lOzD0CCZlNfBz3Y2BqMfNWb4ZnX?=
 =?us-ascii?Q?UnT1AZPbzclbx9ErTgSD8oc4AWgH8w4FzL+JgKXLUIGs0u9t1srIqi7ZVVhX?=
 =?us-ascii?Q?dlgEWQcfNExAVHFw7vOoBKbQ8soW1eFffOQDBrqMoyQ+fBOvW+ec0yobA/dX?=
 =?us-ascii?Q?mgNb9f2/QSgBtG0fXR7T32SQ27dsZiPrSvyQ9Qgz9ezhv/zEOUvgDTcFIt+b?=
 =?us-ascii?Q?YdsnmGEJ5n2csWM9P0ovsNA5oY9fCoynnBiEB9O8AiRwePfVcOCgmqzmjhUX?=
 =?us-ascii?Q?w7xrNyVJGWhisuKpeI8aB7Tiz5MD6ZRpdJ53cyH9uOe8NGCjPC3a4OqIYJem?=
 =?us-ascii?Q?K3PvidP3TYyQAI1Y5AU3zQLANfCh2n8QrdIlzbz11ar5fSTECKtj+MXiOdMb?=
 =?us-ascii?Q?ZndYcrSxRxO7h4fqYZxa2S664UA5IR3k5sTtb5Fh4VyUKSQLvJjDhGXw7liT?=
 =?us-ascii?Q?vQCAunun10GseCsh0jaSc4PYAS8Ve90PRSKO7r40Vwi8HBo+XYBm8yncgIgA?=
 =?us-ascii?Q?EeRAhQBYnECurkagG27MZ8bjJTSn+ZvOnsHlxTa3hB6Rb4WmkBBtF8nJtcws?=
 =?us-ascii?Q?SAP+JAjgkqIugbdR5+AXuizfiJDUh432iZMvHXcXSvtsyJ7gzIYVjNr+VsEO?=
 =?us-ascii?Q?d7F/XRqwzD5o5qd5qLn+ok4b7CYuZChH4Z8WmzPDBkbdvTAV1Bi+RMOvvrh5?=
 =?us-ascii?Q?wQCcFCPjZcoieidWnWdpOptFQvGZ6Rj3QRaGRgmrrjFb5EJvPiz3fXso+6Dy?=
 =?us-ascii?Q?ACd/agdY77K1n8Ib7uEBebXZspeGF353HjqBfkLau32WvXIZyN+a2cayAQTH?=
 =?us-ascii?Q?hY0dN5Ll0nPRLrWWe4PkLrUuc4g9ZSbXI+xLCKgTmQBWHHls9MzT+Nx855Ys?=
 =?us-ascii?Q?MdQC+JAFuzCXAaeno8sA4L/ZKJ5Ig8WacEKLaXx0uLZ5wv2E3UUwV/gyhX5+?=
 =?us-ascii?Q?oYbaDx3xgsZVkIepdYun4KNX7UpcPAlLUguINa7aAdjaOOHy24JTFp6QYb0S?=
 =?us-ascii?Q?2oWGCDf2xCX++4eOk7L5wvyKxd7Vn7Fl5kj5H4az933x0C/F2by01TyOoz85?=
 =?us-ascii?Q?PQslyW9Vhsvut7mOHNqg2A+meDxJOijLv52Lfc3L2QKHaMa+4+yoF56XeFvv?=
 =?us-ascii?Q?D2Su4yEm+BjqYYLjVmxFsn4GIlD/jViF2ySgCXE40Vki7sa/P74snJ89iJKM?=
 =?us-ascii?Q?0iY2KqLqgexxALF8xDUkgnKvfXIaCgewJE0NW2qhv0b+1iJLWXp95DmzF/Ng?=
 =?us-ascii?Q?6eMiGTLmz150iLX1lokTdJ2Yh2qwQl6mypBysJxv7Btg/QWwBSfoNFe6MKt3?=
 =?us-ascii?Q?VnRGTQJkcagZCSnQpIsth2YQqYp1agiDm7OYZshDQ148q/j+1NGJcp/gFtBc?=
 =?us-ascii?Q?rxPViGGxpEtvZZ2k3F5kS3AVArw++Kpmh+eNURWsAAxVV550vdvqiPRUiIb+?=
 =?us-ascii?Q?SZsOXiNAhcb8DEGIQ+8Xv88tEDQYgZ3JgzQoN1ykFCLxmPCz8L3X+DFO4Uvi?=
 =?us-ascii?Q?+A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e491f601-d78b-4d79-b8c9-08dc1eadee18
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 20:32:35.3450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yslhdeV3/LDSXsF3omH+TytVG9dkv1cbmQ5VpqEF902mZ+Hs2AvzChppDj9NJhbCmTe+ua/2ZNhklMiLZMoMvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5769
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

Now that we eliminated all the mem_access get/put with its
locking issues from the inner calls of migration, we can
allow D3Cold.

Enable it when VRAM utilization is lower then 300Mb. On
higher utilization we only allow D3hot so we don't increase
so much the latency on runtime resume due to the memory
restoration.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.h | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 0ae4f6a60c6d..bc6bd2a01189 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -8,12 +8,7 @@
 
 #include <linux/pm_runtime.h>
 
-/*
- * TODO: Threshold = 0 will block D3Cold.
- *       Before we can move this to a higher value (like 300), we need to:
- *           1. rewrite the VRAM save / restore to avoid buffer object locks
- */
-#define DEFAULT_VRAM_THRESHOLD 0 /* in MB */
+#define DEFAULT_VRAM_THRESHOLD 300 /* in MB */
 
 struct xe_device;
 
-- 
2.43.0

