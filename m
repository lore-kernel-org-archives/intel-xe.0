Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF6DC531DC
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 19:39:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6510810E6B5;
	Wed, 21 Aug 2024 19:39:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T/cvRhyi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1BC610E6AE
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Aug 2024 19:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724269151; x=1755805151;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=gMJjRGH5Z6J/3SmEUaMim6hHooSLoRjEbTga0XzZW70=;
 b=T/cvRhyiy9HOSAbOdxwZ+2vHHlTjjEdxzq7InfAtJvGs9eSgMo7hw9fv
 tIJ4grO8whEARIXq23pm1c3IJsGJOPHEgZ3s9hYWxDDz5vByKxfCC/MG7
 6MRv3QT3MRbNOLLIQn0ZGXouzJE1KObiNB4j5JuhtkrqdlgrC+GoTyVRm
 XYQ74gG13y28vSb/nm9hy0ZuTjHT0LQ+wh9zGEph1u30G0KqxJBg5aPPK
 zdJZO5YeL6d0iNOxnG9lbu8r3AanKLLTV9lZHmx0R7p1r4njyMIGNJmPc
 Az0IYQb71DKNC+C0jg0321itEStXE9kdljKEucnimIpuj5r3nNr9utvOL Q==;
X-CSE-ConnectionGUID: rP0wWM5QQO26dBFSCxz1bg==
X-CSE-MsgGUID: Ukz67TdXRBeEcStmTegLjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22835727"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="22835727"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 12:39:11 -0700
X-CSE-ConnectionGUID: cptCoWC5S7GzIUU0Z/y8Aw==
X-CSE-MsgGUID: f8rq74IFTsevUK6CrEy74A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="61055390"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Aug 2024 12:39:11 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 12:39:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 12:39:09 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 12:39:09 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 12:39:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jn6gOvHWiU4iw3v+pjZdfxplvIbHf8EeXyoFg28DHH2drOgR18GKddmwo7E6Gshd3j4R8ehbgc92QJTmDhZNNjpK2gPkBF5ol1dc6mgHCB/TTk5On0hRMOV9uN095BmwlHRQbReO4GxR6UiRdCnX/HtFxWIW1n/CD8jjAJX7Qm7RWhNWkqGmYrtZ8YhEb+eeWP0SDiVKoFY5/EQEf214FoOXU6+g2cp50wbI1pvfZ5HesOanJaE3RzSzX6xODok93ESlIsNoKcp9cq++czdEmjmYjPAyWSsI0Sw0sNi8M8Hy9pgmkKTrK8NbsBzofSXH9iHXs3FDDBo2oobNHFcv2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FO50NkjQ9brq7QhWbHrKdEgDDiYvjYMwBB0ERjvPwG8=;
 b=v1NttRqveJNWcX08IZ65kttWoVsS6X11tSKsqvkSZ7byEv1t98Dlji71lN/13Kt21ti7W2MD1Jodb0haZKeJzgrzMzRcTI1U2JlbcTmCQGOYHFntWlg1qGSgy9AgNvC5tzZeyUqwUyH7RmzbhVJi5C/pP3Qqr35/lDU+n/lnF3rZX2xPoMBfJ3n3MkhQbmg1C23WwhmjoDC7JQ6q8bqpXiy3/mzV2QgFuLGiIxrYeFp1TQEoTMmV0GKYpqQ6LNU+tuRhBzJidwmXQjkOlOiSyLd0906PECRdh/ku5TxNk3z/To936MJZaXARw+HRW0aKPZ7OGUKl7w9mkrm70G+jJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH0PR11MB4790.namprd11.prod.outlook.com (2603:10b6:510:40::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Wed, 21 Aug
 2024 19:39:08 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 19:39:08 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH 10/12] drm/xe: Refactor xe_ggtt balloon functions to make the
 node clear
Date: Wed, 21 Aug 2024 15:38:40 -0400
Message-ID: <20240821193842.352557-10-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240821193842.352557-1-rodrigo.vivi@intel.com>
References: <20240821193842.352557-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::23) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH0PR11MB4790:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ea588bd-2f09-4b04-8e69-08dcc218ec32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?84krPVjvk8nNyj3hVSfHARBFXNrMfko7njQ71IYPAhETpeIIPcVZoyeLX3Rz?=
 =?us-ascii?Q?7KGkvvTu/7LAkqL/ptlH++/OhojbFFRDyCEvqoFe29M4Td9zLR11pEzn0T0g?=
 =?us-ascii?Q?SUeqRXy0gyrg+DTML/O+k8oa0PINcT9Hm1n0g+mZwNQTYx+oJ7RXigBVOUon?=
 =?us-ascii?Q?PRCUZSXbSvIPszZuB25Jy7aWJtkDLSU4e6pm7ia8QcWFlrArXXS7ML+G4MJ2?=
 =?us-ascii?Q?/NddQBHf6EltfteTPbcw91Qpgb6KdmW94z+f7SE0ExJcoI7+P0YbvRKXt3h6?=
 =?us-ascii?Q?MUyvq2EpdKtjTtj6nmMJ/EyavO4f31DiDCk0L5dfEITUOdVrw41hdOFJBSx0?=
 =?us-ascii?Q?V1r7m5XgJO8paOVt9QxiVyIGha/tgj/eSypsACamSZwv2MetcavC7TUOVH6I?=
 =?us-ascii?Q?P8b9TjFDi97GJRoqnJyKvOldEIbUobsDMj3rHd01EUKnfljpl3ckuru7AeX1?=
 =?us-ascii?Q?U+9miyT9QE2ZaFPMt941ktkMIMgwHC9sFN7txBmlW34Vif05ehYkhvGWvceF?=
 =?us-ascii?Q?PU8NF0QJ+w2SIxp0QcWWNEATzbe2xhlSNZULXAY8H+UljnFyCZfPVCV8UIcv?=
 =?us-ascii?Q?PRlqCk+Co0wjf4FYWef2t335gAXI2YJu3OMhorlhPRJ3lSiYIVmjCZ40Q9Y5?=
 =?us-ascii?Q?GnX0RsZYjKpjp+82bdEO3dPueVjAPbBxMYNRfOdFCuKDhRWkMNyDCQrCw/rs?=
 =?us-ascii?Q?Ll22+m4UjoPx7kFly9Cqk+n7ZO7+1XlRidLJQlBQxEJamFSaQBcoDhWD3g+4?=
 =?us-ascii?Q?I8Rj6TzNFfSrobeqcuXbwJnkExmxGX2RUrBf8o/PZYMAOaAbjcuDUX0BwFF0?=
 =?us-ascii?Q?nE0D0/TgRk2+V2AbdsVLMT3KajkkaO32MfjnVbmf0ocxmmbn9OxrATLWzp8L?=
 =?us-ascii?Q?daBVCIEm/nuJ+XkR6v1R6UnMqqizhWWB2Z957ahXcUpgjcc1l2seADRudSDh?=
 =?us-ascii?Q?KzK78oyoqacDO1eEXoxeAshKxK7QF1d+g7f4AqaJSqhkw14GinAFTRzfwYWN?=
 =?us-ascii?Q?xC0/FBvWOo7VE2dFqL3XxgibZZvr4oupmSUpOFErkqOG//79JPJpzi2f5m2V?=
 =?us-ascii?Q?uR/fUh6hnTTEknq+5V3en8U00sUhXSCqtc0A+ofGFWlK0VWQqNiPne8BZmnz?=
 =?us-ascii?Q?W3dwOhzZtLtjI7MBz8/NncQNWsIZ9MydQyEbZD0uUzAkOr0PA/ZJIN3nnLVE?=
 =?us-ascii?Q?SzW30QswQ6E/PMyco8F87vkMgQ8xGNyGUOvkv9mQfXuHeLrVZhe+j6EbLvLz?=
 =?us-ascii?Q?i2rRc1jtHUk5GiKdAXUSSvszm80NxdHsq5An25fgE4jooDHxdtN6+9KwMkY/?=
 =?us-ascii?Q?tOHI+t1JvTIsQQCdJCDJ0/48B/41BDeqT0rF7jGHTTkrfg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f4us+Cn9bofK+BPGvhQVKcJNksGgVIJs9s2x2tYG8jvluXdtzJPUy2lHJ1RA?=
 =?us-ascii?Q?QXnVWCS2kO+OITcNLBU4XFm0SGYQIjv3QnoAnCyE66nF937jlihNJN9+e8JG?=
 =?us-ascii?Q?J+vhbIS+LhxSfLu5X0PZ1+bVXI2vzJ7NG680M5Pve5D+Qzx1778NNZBZ5qL9?=
 =?us-ascii?Q?7N4U27BiyW4wNYlmNkYPY7BoC8ite0Z3TPFNZabItBCe5dZkIuIIxRHYJA+8?=
 =?us-ascii?Q?HUWGP2EqpldHgk3VoYrzJmI7SB1asTjM0PUN8HwWli0pmiDhO0wzs14+dg0q?=
 =?us-ascii?Q?Ttu6+PZSCPekP4GanwRfBywsvtJJx93ijV70xhXZ1EiZoC7funaxwN3QG0Y5?=
 =?us-ascii?Q?HlxjwYBtDyIXDNbrn0C8tozFXDr3KAFag9zDWzeL2U/61oFPKRRacGVO4/NL?=
 =?us-ascii?Q?b8wMV1G6opu2eT8Q9DsYl/qaIMIXt9AIC8VdTk4S8OB7weGSIMHiIVa9UHK1?=
 =?us-ascii?Q?AXiuLgAXUWPY59F0ikM0nxC4JzZ+Xhzzk0WHnv8Vzz/0jgDNDMRXKMTcfAK/?=
 =?us-ascii?Q?hfQ0BvWfRs9AUPAcbLQHNIkvZ6ueKD2sW8MDy0htEPeGnDWvccNBcAMdIE01?=
 =?us-ascii?Q?rTalHxVVoGFR55u4KacXuxf1wDn6Ek3ZvpWxoGX9wzTXrWbZ2XxwOfWe1v4a?=
 =?us-ascii?Q?85AccnNZYPrr5vPVOm6tTLzwdYXLQpz09Fd4yVBF3Xnk2A52or0v3BZon5QP?=
 =?us-ascii?Q?bNSvWq5Git4D+bUaYtaZz6hBkmwBIhVxANGDWb32+GP0KTd9AViNZofI0t8k?=
 =?us-ascii?Q?zgwYGiYexDCyYiM9vydv8mzgfSfVg5Ppq3wJsu7v4UtkjKrRFeVi17JIXseM?=
 =?us-ascii?Q?N+LljiXjqGUZH7gP8WRKG+USV463v0mdM4lyGWVcCGdbFId2gL/+EjzenszC?=
 =?us-ascii?Q?Tp4cDUgZ08EwCkcP2L9F4lEV0L9kHauV38ZX0XOXFDK1pMoKq4yy1tsMNfMB?=
 =?us-ascii?Q?dO9sazuul7N9cK1JsC4fRERrPRH61lAEXisPsbRYeuKJQjC8HJopU4cwiTlZ?=
 =?us-ascii?Q?LwbiTvhF0L6lWAdET8flP/tgPJ2UPkY1MFzklnJic3Vv+TQd7R85YlnjS/fM?=
 =?us-ascii?Q?8YPchTcwNJDvwhnuXHeExvtF6A4GGBHfOhSZndjs9dU0QLCXZNF0Jgr1bH5T?=
 =?us-ascii?Q?VR4n3BhiBXGJNwTpeXHy9sucn21qQbqfbyL1QaexygwYNZlHOnO4ftmp8kbh?=
 =?us-ascii?Q?Wg8krRp03gvGs+Y/L6mCYDqZydgwkysvV1JCb1YzjLv/utxODR1aCvAdcNS5?=
 =?us-ascii?Q?hujr70zJ+u8fPOAitNBt6H0yWxeOFWcNbMenk+UVp6ZxDZcPYmc6iKYuHKBH?=
 =?us-ascii?Q?nG31X5jESyaqgIPEP/8o5uwQVU/22usLk9dNZZJt5vkRtofOa9K4LP0Cn5cu?=
 =?us-ascii?Q?+b9iLgYr8mJINojQajUyFzlBHTNj1MUYd3satQPZPZdKilwnulhXtccOoneQ?=
 =?us-ascii?Q?8SHKvpwl0pTg/xsM9juHIJzO9Hi2vSA2Ib7t1k5s75Jkl1hV4YJldcxRC7bV?=
 =?us-ascii?Q?fi4ziAiKePNFW88nODnfLp86Y4Ufy9wpkhPrK5zpBnZABqRpp+PookrUj6TY?=
 =?us-ascii?Q?0uhI3qYNcwOAYd63SeGURo/1TXbXu0IwbJg766ULQLq5gXOZOVJ6ciHjF53a?=
 =?us-ascii?Q?Fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ea588bd-2f09-4b04-8e69-08dcc218ec32
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 19:39:08.0539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qYY8WzHI/7DGyTPiPwRLWx7FaEUKfRZsa5uyeHIntltlXlC4rq8eEoaIjPwGyjFRtd2FcakrjigrOt1ehCYbTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4790
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

These operations are related to node. Convert them to the
new appropriate name space xe_ggtt_node.

v2: Also move arguments around for consistency (Lucas).
v3: s/node_balloon/node_insert_balloon and
    s/node_deballoon/node_remove_balloon (Michal).

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c        | 16 ++++++++--------
 drivers/gpu/drm/xe/xe_ggtt.h        |  5 +++--
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 12 +++++++-----
 3 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 960f5a28b7ed..d21474715bdb 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -347,17 +347,17 @@ static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
 }
 
 /**
- * xe_ggtt_balloon - prevent allocation of specified GGTT addresses
+ * xe_ggtt_node_insert_balloon - prevent allocation of specified GGTT addresses
  * @ggtt: the &xe_ggtt where we want to make reservation
+ * @node: the &xe_ggtt_node to hold reserved GGTT node
  * @start: the starting GGTT address of the reserved region
  * @end: then end GGTT address of the reserved region
- * @node: the &xe_ggtt_node to hold reserved GGTT node
  *
- * Use xe_ggtt_deballoon() to release a reserved GGTT node.
+ * Use xe_ggtt_node_remove_balloon() to release a reserved GGTT node.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct xe_ggtt_node *node)
+int xe_ggtt_node_insert_balloon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node, u64 start, u64 end)
 {
 	int err;
 
@@ -384,18 +384,18 @@ int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct xe_ggtt_nod
 }
 
 /**
- * xe_ggtt_deballoon - release a reserved GGTT region
+ * xe_ggtt_node_remove_balloon - release a reserved GGTT region
  * @ggtt: the &xe_ggtt where reserved node belongs
  * @node: the &xe_ggtt_node with reserved GGTT region
  *
- * See xe_ggtt_balloon() for details.
+ * See xe_ggtt_node_insert_balloon() for details.
  */
-void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
+void xe_ggtt_node_remove_balloon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
 {
 	if (!drm_mm_node_allocated(&node->base))
 		return;
 
-	xe_ggtt_dump_node(ggtt, &node->base, "deballoon");
+	xe_ggtt_dump_node(ggtt, &node->base, "remove-balloon");
 
 	mutex_lock(&ggtt->lock);
 	drm_mm_remove_node(&node->base);
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 67ae5f1602a3..e258a4f381b4 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -13,8 +13,9 @@ struct drm_printer;
 int xe_ggtt_init_early(struct xe_ggtt *ggtt);
 int xe_ggtt_init(struct xe_ggtt *ggtt);
 
-int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct xe_ggtt_node *node);
-void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node);
+int xe_ggtt_node_insert_balloon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+				u64 start, u64 size);
+void xe_ggtt_node_remove_balloon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node);
 
 int xe_ggtt_node_insert(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 			u32 size, u32 align);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 47222bd9988d..39ff4e7f902e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -528,7 +528,8 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
 	start = xe_wopcm_size(xe);
 	end = config->ggtt_base;
 	if (end != start) {
-		err = xe_ggtt_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[0]);
+		err = xe_ggtt_node_insert_balloon(ggtt, &tile->sriov.vf.ggtt_balloon[0],
+						  start, end);
 		if (err)
 			goto failed;
 	}
@@ -536,7 +537,8 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
 	start = config->ggtt_base + config->ggtt_size;
 	end = GUC_GGTT_TOP;
 	if (end != start) {
-		err = xe_ggtt_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[1]);
+		err = xe_ggtt_node_insert_balloon(ggtt, &tile->sriov.vf.ggtt_balloon[1],
+						  start, end);
 		if (err)
 			goto deballoon;
 	}
@@ -544,7 +546,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
 	return 0;
 
 deballoon:
-	xe_ggtt_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
+	xe_ggtt_node_remove_balloon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
 failed:
 	return err;
 }
@@ -555,8 +557,8 @@ static void deballoon_ggtt(struct drm_device *drm, void *arg)
 	struct xe_ggtt *ggtt = tile->mem.ggtt;
 
 	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
-	xe_ggtt_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[1]);
-	xe_ggtt_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
+	xe_ggtt_node_remove_balloon(ggtt, &tile->sriov.vf.ggtt_balloon[1]);
+	xe_ggtt_node_remove_balloon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
 }
 
 /**
-- 
2.46.0

