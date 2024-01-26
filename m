Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AF0C47DDB
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:32:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4013010FE5F;
	Fri, 26 Jan 2024 20:32:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B93010FE66
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 20:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706301128; x=1737837128;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=dCrzgPWsHhizImq4CWRHPZLOk6G9VMFvJFI3fdQ6HIo=;
 b=c8XdbQA5yBfd9nr4YV6Oiz6tw2hehus66o8/XR2LYv/h2E4MiZAyxMlM
 duk3sdg/MiQRglEsAjZPUZaQS6zaZq8q5bOMaucCZabNfArVd6LQHqBh6
 B4ouscD74HSzKruwd0+b7fbVLUoKiQv6VokytmRCa0yiBjFuUC6k4TS4A
 6INpeD1fC45ACZerKDDaRtU9wcFOV2F1HblU29CrQuyjFkK6d4iwQZjf3
 6Cbz2EVPp9xH5Y3bvLNh+FofZViY4jE5wjSNc+XrYAG2MaaRDqrNfd/Mm
 xq2B2QQOEcQ6n8dw53vsJLFJQBJe0MkuVsGsBUp3UVEVtD8Lws2VFCFqQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9948725"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9948725"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 12:32:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="877482277"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="877482277"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 12:32:07 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:32:07 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:32:06 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 12:32:06 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 12:32:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bd1PIq8idrE99OrlUTFO8mnIV8gGRARGRA8EbuvFRPMu8QI1x7zLg23EbcU7g/gUSuUd5ybPEmWC2mU48lhFBUetJng+OYfOqRTPrrbOrZWLDAKcDLB1bL38cxuEM94j2lNckjeo49a3fU2PZC7cP2MaC5WYldlBFBc6Cpm9/Pr18PA3t10xsl+7FquknpK3c7TaV2eCFPrM8W3Eg4VYo0wTGC6arbL4vsjBVTfZoPG1q3QlIf6a6dECHKGep4qiJ5snApVv30j0lCcnbK54kWsyVEee9qtpGyMmwSImANiUJ8Y+tk7pv803bNlD1pgZPa0V/l7bIREqSed9+ebzCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3bCzqqv1WLzPOM3rxBYPn2JabsSnMC0Qx1GQdPRu6M=;
 b=DoR/x+xXqKC85TXOAb5z6aG1pkwv52iVHBX59vGItWSUhrePAiAQp5sHb6KupBktSn4NM4JFtm776+sJpS7vgfVhspUEoA/2Y+c5rRcXUHAyFf9OFCA9vuuaLtT7428D8CQaTafNKPuYq4iEPSewnTgMacINZUlqr5vlmocB8KO7R3uqHKuOW/cT5c7cg+T5YbeeRBpvyHTVH923rBT1+ZzqwEtiddq3jOVa0SgyH2QTQ2Rs3dkhuugwDdV/Rrn/N4CqT+16JyK3Udqqs+cP+bbZWjxg/rkPkt/7vueGlHXW3z3L05kIMtzkqpUDgXXryApD5fkCuUgD8jP5fB67fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CYYPR11MB8407.namprd11.prod.outlook.com (2603:10b6:930:c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Fri, 26 Jan
 2024 20:32:03 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 20:32:03 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 24/34] drm/xe: Remove useless mem_access protection for query
 ioctls
Date: Fri, 26 Jan 2024 15:30:33 -0500
Message-ID: <20240126203044.1104705-25-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0273.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::8) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CYYPR11MB8407:EE_
X-MS-Office365-Filtering-Correlation-Id: 783b5ab5-4960-4d53-ca14-08dc1eaddb27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ByhAn/xIvhRmb3DKaKYE3Agb0EXI9kd881gGvhJcqEx8yvsFgh+KgOF5KWSS3NFZx0caqtAqTNcT3Z9UvdGmvRw/MYvNvjCWw2VjztUipcVgs5zP1kvyGJX84ft+NIyLqb5hHSFUm+A7wjS2lDUxzwlGlt9zHuR7eqW6ziZsQmBLI+KBvAiODFGz6j0xWWF3VNgDWu4LJGSmfnBb0Qr45GNdQJndp15rre5GNIy2VptyN18+lho/auSOl3JezQvJam9vOG6ivvwI0wOBqM/fqzDsdh+QqDSF0EjvbFeVixPmxsJqh/4tMEHCN4HQiszM5Y4du8hSQVIFJ67GhHmjGkwuw/vqPxCpmVsIqU2Su4nSSd5BGIhxQnXrUZIQvpz7xnyvMzll5Sr9XtkWPZy/DQaBrvbbvbRsboso2A5DlhpnRrx57tql/+pHNm11j6RVePmHa+tzD4WtiysNLH1lUeH6Yq3m2pvA3705HZd200/dczZq+sHWYNUnmXzVc/4R+RVSMKiZWwyQh2c/JsrNf/78d42tnr67I/rCBnqDH1Ib/O2zNaA8oqfnIJsRdwXw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(136003)(396003)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(38100700002)(82960400001)(6666004)(41300700001)(6486002)(478600001)(26005)(44832011)(2616005)(83380400001)(6512007)(6506007)(316002)(2906002)(4326008)(36756003)(8676002)(66556008)(5660300002)(6916009)(66946007)(66476007)(8936002)(86362001)(107886003)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Tl9ta8zhyvkV9vIfhXPrYEs4+BZR0Awmvz97uamcxIM0lY7rjQqDtxqWwkZz?=
 =?us-ascii?Q?RtyQWU+nIn/+m5S9ZvgQKo76XXIYmXCT8DiFdk8VuDoqEQxCJ+8Y6DOcwjja?=
 =?us-ascii?Q?ORpTEdOjTmeoGtpmEmffMaLTZVX4dLYQt9bjhfxobGjjOp8+MIkInCrQJIyD?=
 =?us-ascii?Q?uSNLkZvk7ED58bpks83u9ZU5pWi7mrD2k2zUHLTETBZuozFUY2fLw/Ikyh+B?=
 =?us-ascii?Q?zY0FYCivKLgvtUm/ZE3PPUJqILgFzTUE4P6Jo9nN0ziuYDQqym96Z/VpDm+L?=
 =?us-ascii?Q?tfKg0Ut5am5Cmt9Oe1JDmntrT1ZiWJS67UPuymUZyCx8XWoXzsgRJpyONGIP?=
 =?us-ascii?Q?61VxDj+UWCaz+sYpLjgwCUhm9YTCJQZdiJyqYA4jAXOXPThoPNihg8QvuPIe?=
 =?us-ascii?Q?XCYpDdxbDyY9eh2h7K2m43siJNT/eM9xHrtheH/Dmd0vFnGrzcnOL8mlV90D?=
 =?us-ascii?Q?cTBrHC40mYAKDdZguKgdfmfZWJjXHjij5hFOGXBWnl90yhqaDmMopkCSxaU/?=
 =?us-ascii?Q?DJ7bZCGbsY+oW1QhE3WNtfQQOfP+/bP0jJrHrXzEXtMXql+uWk6kGJ5LmSx6?=
 =?us-ascii?Q?ZQLthXFEOsQsdnAakA4WJLk2+HcJ1mVClObNZmbHmTYfHDaESIFTeEWRH+hU?=
 =?us-ascii?Q?GJ3AP+4LIZsiiEmfeWRpR+TjD529ISaUq1JaJG3qpQHLzNkkBiucBPqQKF3B?=
 =?us-ascii?Q?qA4sc92jAfv3GAmG5/HjUIX/3kpKgXlaZBFbI26Bi0CAf9fZlZCxuiquLbxz?=
 =?us-ascii?Q?e7BfIUroI/c8oYq50+WQYvRFUG0p26DdWti/WeNonkPNEMH7ityPtXlRzom5?=
 =?us-ascii?Q?urEC+zHJ7CeOXlM49dVovrebVBw5kJCfQm1VBWP+nP3K+Qf1EFIbKFmTcrgj?=
 =?us-ascii?Q?wLFQ/+PU5ifF9PhUY9NnKMwYwUolmuaRNFtfp3sJY9X3jApqLX8Tmgjdmgig?=
 =?us-ascii?Q?aBPG3D5/pSVzOSigbrSrz9Oc0PeeZwUNp8w11zXPsblxUdoS2lp67fPRCY/P?=
 =?us-ascii?Q?mmWBx7DTcl5Sy6AhtsrLKLMR7lXwQCZ4L/5JnT7d88ukNkNvp/hrJ3Ale0ig?=
 =?us-ascii?Q?G9qBLv0fTZoChpM6TYJXNkha8/BYM41foE3oWhhGmdYXJJXnYimTKNUB0hUw?=
 =?us-ascii?Q?o0vDNWTwJXxZ1p5n5ptGYXIaBmHHB815ktDbF8zJe0HLmSRASiBaz+FQlPFo?=
 =?us-ascii?Q?2lj3iNLbZ88D+CQd9xJ8EaAWWkzxqFTtLVDQ503+WiTH58CWp6Clb3ED/dsG?=
 =?us-ascii?Q?LYs0hF8SuTZmWH9ksie7kv+bqSDUby0g2OMA1zsDdDzYG/4kWjz90T34tHlw?=
 =?us-ascii?Q?z0auOQa/D+kTZoOZdKNfl7nSwn4/sb0U+SIrgG9xi2lCmuxsoauKDl4JACgU?=
 =?us-ascii?Q?ZNvBhhhHhzKZU+ds9V6rsMT0+pHYiXStlWqq+eaOh2HjxWrFmKXWA5BVQF3M?=
 =?us-ascii?Q?LTeO4UyfH/l8cWlIW4whYIv64keQq3Rn6Mb25TW0wVkOzju/Uk/Am8hQCijn?=
 =?us-ascii?Q?zDHQEa+8HTIXYYGYZC6aoywiY2frthNK60VVO0KzzjFBw1bdoU/FChGccPxp?=
 =?us-ascii?Q?QO4aqce+41DoD3s/V0a708zPgD5clyP5UE/BrWZB9C0Bjq4KvANnHZNk9Qfl?=
 =?us-ascii?Q?PA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 783b5ab5-4960-4d53-ca14-08dc1eaddb27
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 20:32:03.7028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VvmQCdFYpAt0FSO9vwbNyJ6BMToUaBU7QgfKcJac1ODFOgLSJGLLyVrI052CE0OP/oHTUgjNFoTS8+cysPheQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8407
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

Every IOCTL is already protected on its outer bounds by
xe_pm_runtime_{get,put} calls, so we can now remove
these.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 9b35673b286c..86222c80a874 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -147,7 +147,6 @@ query_engine_cycles(struct xe_device *xe,
 	if (!hwe)
 		return -EINVAL;
 
-	xe_device_mem_access_get(xe);
 	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 
 	__read_timestamps(gt,
@@ -159,7 +158,6 @@ query_engine_cycles(struct xe_device *xe,
 			  cpu_clock);
 
 	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	xe_device_mem_access_put(xe);
 	resp.width = 36;
 
 	/* Only write to the output fields of user query */
@@ -437,9 +435,7 @@ static int query_hwconfig(struct xe_device *xe,
 	if (!hwconfig)
 		return -ENOMEM;
 
-	xe_device_mem_access_get(xe);
 	xe_guc_hwconfig_copy(&gt->uc.guc, hwconfig);
-	xe_device_mem_access_put(xe);
 
 	if (copy_to_user(query_ptr, hwconfig, size)) {
 		kfree(hwconfig);
-- 
2.43.0

