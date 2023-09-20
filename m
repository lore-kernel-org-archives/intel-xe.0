Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C82C04FF1
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 19:31:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E7310E54A;
	Wed, 20 Sep 2023 19:31:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3C310E542
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 19:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695238283; x=1726774283;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=H20cS+m3KO3506tsuOwrKsew57ZJt62PUaj09KSUsUo=;
 b=cT2+JLciAVUhdv+7AkbrcrMMBcdZl5zPdYKNBznXhOe8dfxJ1P9xyVP4
 Bl0C+uN0PCNllAws5p5HPbpv9W2G6Sb52si2gH/5f2tQBGX+hnSHsk9iR
 ag8Uto+D14PnN3yMXCSlcfHlwiumvUgclW1ouxg0z9POj+clxDwFRKVjY
 lSIR6ZIVRu5D9zvBh+K4FsMgQfnKXksH8mFI4f9+zVgakZvCXH5syGEwD
 tqve/pluQx0DvfkbKaTIJndVojGW787r5JILSpwUtjP2hxkppoh3sskvi
 ZzJUJxnyXNkwrmlizskd+y1W4DwHZghXwcxEy18gOr40B//UdrfVAMcKi g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="359701453"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="359701453"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 12:30:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="870498927"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="870498927"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 12:30:55 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:54 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 12:30:53 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXpacXoTovPVusuclgjMlXO9T2DwPmEja9dXTBr9z9z4/hctXroMfCeGmvOTz9uqjxNdycfU6rDuwXw8MVumu7O7QmSDlljIZmC30lU3Z7cG+djwgsnrukJ3FCwhy8sJoxAIaEJycyv0q1qADPEkmrqTBzL/f4D6K0rdaFvqYO3yYk8mS91qoaZVDioU8JPiMLftfBFurtZ4VfTwfNqlOMbowb+i0gELokYeOwuHpeyeBh7JMDxLYJJFAlkKonfyPw5t/o0pgC3z01oR7QJ0n3WLx+6isFTbtt7867DhwvggvfKm7/KveqeUBxUfwSj8FPdyr4Rk060JX5e9XL52MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jp34zBMHSqyJH/P7i3A8eUHuHELTbmoiefu6/V97zEo=;
 b=S/eP2n57DuYTapY0+rq3XOTN3uGmqVmCkmwJfrIC3eT7iIJFFVZEH4QYd+PElixwpgp//seIovsGzoRRmiKeqQuPf8M6DvTIqnu5Zi27J8KeXora4V82VwgrVSaTG6Ll1oXJL+gf9lxqu/zFVxziSwulZQMF7Ej6i3KDq4BJ512Gt7eAVPmS48YoO2iP0aJM/FqluNqXDEZe0TlkeA5GDRoTGC9/QYxPUpMuIOC++sBnxfsRS5+IIia2WYVVIhrJWtIFa+DV7ew11iRzD8i2K58dyWCIzzeWvJ3pW9+MHrjmCu8umNL3n7lK1HCDqYlv1rU80xrrI69uz2YvLil9cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4951.namprd11.prod.outlook.com (2603:10b6:510:43::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Wed, 20 Sep
 2023 19:30:50 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Wed, 20 Sep 2023
 19:30:50 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 20 Sep 2023 15:29:37 -0400
Message-ID: <20230920192940.135004-18-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920192940.135004-1-rodrigo.vivi@intel.com>
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0377.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4951:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ca07d6e-d7b9-4af9-07c0-08dbba1018d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hLowvPSHmVFoiYQUIxSlikHQ5rQzH99sfIK+f11Z7LHW0LfBcs2Au4p6n2vT9lnW7FQ1JCOnyYpB3qtOB529gl8zcXXHGw817zllXCSiAtzYb2eSv+XFZ1LY1LvO8DLM2fFSxe8llf5C6KlWyppkSf92IxyObyx9HgN3J92//u/gmQHn1UYhSuv39iuAMnPU1si8cdJIg8dwC1hWnUK0ACv3kJFWpPJwVT4YeCfI4Xp2lYt087wi3grIAk9AYKsJsb1XdZOD8xDRv7XrLHIva4JdGJodrvhtQPpBC8QtZ2Q3Y8N3ZaWD+pnlCCFZNzRLgpVa9/Ec5bmiBn0JI/akM78VEr3Z3v9udQbGe+AR20BqaNfNTG61LCDP3g2RJEbCXzliJMhtyaZ1w9FQVFvHiaeTdMv5UKm4Rt1/nbgd6o8eXlLh9Q+Ejnax7qGqULxF5YUhYNyQWttyqJdasZUxLGcimgkIO2an67vhxjmbZ8EVijT0+Hhz8SWFjYaIcLZSm1cpQWvs46L3X9UnBa8MI3R7w84SBVpcrPsaJBShqQLDsxGyD9fVyyHVATAZwzkt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199024)(1800799009)(186009)(6512007)(6486002)(6506007)(36756003)(82960400001)(6666004)(83380400001)(38100700002)(86362001)(107886003)(2616005)(26005)(1076003)(66946007)(54906003)(66556008)(66476007)(316002)(6916009)(41300700001)(2906002)(5660300002)(44832011)(4326008)(8676002)(8936002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t7H/eqnoV0uh8F3x2IojN0vaq3TJLUbwNdt89+WgNDanp3+owXl3GOY4jMEC?=
 =?us-ascii?Q?aDWR8j1n5L+ZjkyqD8MQtDDaPrtYydtSKX2Y5iCSgIVKnhmE+8k6Zhv3Ct65?=
 =?us-ascii?Q?5kJkXtINgG09dTfd+HVWOavcBHNcDXoSuvI26BRr6xg6srgLgkXvImBWxHZF?=
 =?us-ascii?Q?59HiQPeB6eaJaprQt0jyW49Gbq5HAURS8i2cqV6B1p+KtG3Bqf/pBbqWjxVO?=
 =?us-ascii?Q?YAeiQf3FV+SEJkOb6JccvUVDIYRC7YFUhoBqta56bbLKV3kx6qhcpcHvlNg5?=
 =?us-ascii?Q?IkrYHayLgAoihTEjKPUUjdU+//M+J/eORfqNDCe5Mp8214AjnpqCkPvxqWOL?=
 =?us-ascii?Q?FOPtu8H6d6sU0t7sD7D6yaGdr1yNcynfD8Zwmw9mDopHS2xbpLXIKpG9ARml?=
 =?us-ascii?Q?Aqz9jXMkcwfejtLYS9QmInDwcfIDX1Uar8Jz75SC0UuXbs9H1IW1b2CAG+Lz?=
 =?us-ascii?Q?u0qqsnN0j3FF3llOUnO7hemDI50S2Lan0ipGvWTJDNjyuzOeD81E4IOnPqDC?=
 =?us-ascii?Q?4TCBzmNWVM5oCOSaB3IPpL3O/G9zInrb/MfB7arf2PthbZcLd5fYpcH53/Kr?=
 =?us-ascii?Q?/aq23SoEqRws4y1lxIbQuwpvfomcxytCkC29VA6+L0pEp5VhOLM14zcMi1Ih?=
 =?us-ascii?Q?EPus7Inn1juwjpROrSONOmtat5lYhpjFL7msPebLK3oP+jJVsH4DX285WWlg?=
 =?us-ascii?Q?RLma/UNwgItuxiKTNiqZcM9j2tNGTm8rQxk5oqpdaP/nTe1jSo5hxtAXEPDP?=
 =?us-ascii?Q?IFXq5vFYB0+NqsFAiIbry0hmTfHQrOuhDZIFdc+sVADFTXoV/3ueZNrwlaNX?=
 =?us-ascii?Q?8Wq7IGuhpH2VQ7cVvTPIKwq4d6f5UAXEgCzMbcd7YeYodJHDiSWzxOvoZxCA?=
 =?us-ascii?Q?raz4yxXpkUq+80Pd6o1yC9NVQqtVD4S0x1sUqbep1nZj2N9vsLEByjmyW22Z?=
 =?us-ascii?Q?C23soSHbednWgg8vd/ZL+jfJlI13rR8WWhdKZc9F8IQiBwNIo0fwGCESmkCN?=
 =?us-ascii?Q?6LklnK2UiM3/l+4yC4Km7zZUJGbc1sUd9hLL2c/D64JAL7ev86tuJJFoBpoK?=
 =?us-ascii?Q?kOHtTzKOaxRa5rU3zd7xTzyauHCBVynxPCIdBm4f7SlKU8u0qQzkSEqOl01T?=
 =?us-ascii?Q?FhtOBDhq8y6H6zr9Q+/sebwK+lMpi2Qp/2szWOFzBV8dIJUK70r0P3/OI/GT?=
 =?us-ascii?Q?2GAV4nq853/Ip2ovo02lN7TOvFQ1LMJoVgYplV4BVBItjHzVQlz1XbM7VgIU?=
 =?us-ascii?Q?J1HGhvU/8jvGPDra+CV7q3OPHyM5SFL/WEL8BI81aJqv+mmRafPrDKWUNcKQ?=
 =?us-ascii?Q?jIPcjLr+L5fYxQtM1LaFpNMDQmKMdayQo0orbFNH56UIGYN6wZYa37Bj3al+?=
 =?us-ascii?Q?lbz453PAIcs3EBkgE3lZtWONL35+0iUGsCsQjCrnDH2ALuUKVc/pkf85FkmB?=
 =?us-ascii?Q?9v72WgZuRhlSWBXIUfy37pqUsusIkUQFyqbxiPFqOMAQFA5vzMzOFxU8QI5P?=
 =?us-ascii?Q?MKrIBosiFhzb0Erpkq+4bwptecoUaXPsVo+f8Sq+0qHR3gsoRo0MeaXwtC8W?=
 =?us-ascii?Q?H2ZxpQWYI/Xhfh5F8Ge6mmE8EWitL2v+XaCgesa9JHRXcaLzFFfeeXUc0XqK?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ca07d6e-d7b9-4af9-07c0-08dbba1018d6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 19:30:50.4262 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p1Ubnz3lRS/aH08RYdVBJkfdElbTHIPvdPtyufiFyoCaJVsBKINewhhZGPaf6B+teCJbcg/2uOITnPKh23VMYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4951
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 17/20] drm/xe/uapi: Fix naming of
 XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Francois Dugast <francois.dugast@intel.com>

This is used for the priority of an exec queue (not an engine) and
should be named accordingly.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 2 +-
 include/uapi/drm/xe_drm.h     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index f7a374c28fa5..a27b10583f5a 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -338,7 +338,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	config->info[XE_QUERY_CONFIG_GT_COUNT] = xe->info.gt_count;
 	config->info[XE_QUERY_CONFIG_MEM_REGION_COUNT] =
 		hweight_long(xe->info.mem_region_mask);
-	config->info[XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY] =
+	config->info[XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY] =
 		xe_exec_queue_device_get_max_priority(xe);
 
 	if (copy_to_user(query_ptr, config, size)) {
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 43155d2c01d9..83d9bf644e16 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -330,8 +330,8 @@ struct drm_xe_query_config {
 #define XE_QUERY_CONFIG_VA_BITS			3
 #define XE_QUERY_CONFIG_GT_COUNT		4
 #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
-#define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
-#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1)
+#define XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	6
+#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY + 1)
 	/** @info: array of elements containing the config info */
 	__u64 info[];
 };
-- 
2.41.0

