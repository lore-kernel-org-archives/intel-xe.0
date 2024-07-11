Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115CFC3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 17:12:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A7E10EB17;
	Thu, 11 Jul 2024 17:12:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i2W/wog8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 004A910EB07
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 17:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720717964; x=1752253964;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=cA/C2gMd8d46xHjNM2Waj8aVY8AFL4t+4GXy3ddmeGM=;
 b=i2W/wog8z6+3/I6Y/vvwez7AInooErqSKEIGH0/FuB9avWK1wp1fVEsH
 bt8EcQMYcj/IwNRd7EtuzSXtfSOCc8JSlPFMnXKDU7a0+kyEbh1cBE1lE
 xUrzyBvVV2JPzhssa21Erkx1Ejz5v2UqkYrhGOehOJ/0AtSUSo8ZfPJgz
 YO/XdAJKfsJ0MAxt5okyueMBdxvNfalYAwZnnq8Z1cKGttmDp9JoFfM2j
 O5ZXutJGLIJK3Duo0q2d7EVzlPniDuKxqCChi4ciIh+oQr/k/nWeJBODw
 RBH9wVVV4YhL55CUZXs1bc5PlQytIUMj25hR10U/5YU36d0LTppLYKMHz Q==;
X-CSE-ConnectionGUID: 654Adwo5QhGLu7QbGpos7w==
X-CSE-MsgGUID: TswSyEVQRpWSo9F4Kt0UUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="35553861"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="35553861"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 10:12:44 -0700
X-CSE-ConnectionGUID: 13ctAPQ4TqeQBq6VSTpg+A==
X-CSE-MsgGUID: VSoGqdzcToK6p81V00ASGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="48633236"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 10:12:43 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 10:12:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 10:12:42 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 10:12:42 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 10:12:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yWWaFCNI4pbuTLRk29YDASJDjFq6ogEhp/uDZsmvZkPqBpfHeOUXlSV+keRMP6DDGkwu+hTmBIb56ToSENKZgUbLIYZg7xVWhjeUHcY3fMXEJheEqAmHHjmXT+ZKJ3VwLG550iXEX7qVUQBdyx7jmCQtPOr2tl84TGAYHoD0uIixpfJ4Pb99mPaz/dMLIIZ/KWWZ/gqstmnwTtkKXmC7lAvfGV+vh7rx7nukhvRk5HhfZyKBIuwDtKRZN1dWHx/1zLlvJ4w5zsSwvEwxc/UrUJatDEcXzyB8GY8HwoE88uJOHomRXCAmaqzUohd9mntlNLoBbYJAgtIYazmfj3+Nmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=doPJZbsSzJwQIvdvxouC7GzZZwt+/PCxRyGDaxOZdcs=;
 b=Epjads0SgBBDprdkqY9Y/8foat4XY0rzGHdRnc129RiuJIpPDkByvatOBfIqpTTRD+5JFuWeHdR5GXoNlYJMl5Y+P7KWV3e8Cc93ckN/i89MelNve/xgP9Eo68rn+wxr5BOnbD8nLl2o9TM5TOOyjHFSbKCeSsVCCkH9zJZX9+acRME0JpJU2T/6dMNNkX8qgYuAtNQcfmZE5TGapvVcirrfG3kyhpBGjSuQuSsL/bvG2+Hh5a02JrLp7T5/uV+RQMtk84dcnLz55wcWlxetEYEepXc0a3bkMeqx7feE0t9WN9iojz7oTNr+5toCHJDnKDTs4Ci0c/yjZeWvK4y4Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 CY8PR11MB7107.namprd11.prod.outlook.com (2603:10b6:930:51::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.33; Thu, 11 Jul 2024 17:12:40 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%3]) with mapi id 15.20.7762.016; Thu, 11 Jul 2024
 17:12:40 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: [PATCH 09/12] drm/xe: Introduce xe_ggtt_print_holes
Date: Thu, 11 Jul 2024 13:11:52 -0400
Message-ID: <20240711171155.173717-9-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240711171155.173717-1-rodrigo.vivi@intel.com>
References: <20240711171155.173717-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0028.namprd10.prod.outlook.com
 (2603:10b6:a03:255::33) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|CY8PR11MB7107:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ac35018-8f44-41b3-05a6-08dca1ccab6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?M8v2NbfO7F3s7jgxv/ESbmYABz3pgw8/PhhiqRItMAQDnC1pikIxi/j88lMn?=
 =?us-ascii?Q?IDGlr4s5M8Sl+K1VFLVUOSEMNTXE22fm360Jjaj+Mu8MJHxU+D9t5kNFq2ns?=
 =?us-ascii?Q?ZAtKPw+26KkxjQlxsKxCWsVns61Q7QEe37+h8h6HDQluCJvNWgQGtwDKFrKA?=
 =?us-ascii?Q?S+dcgIoG+soJcalNgQxn3e/bFtZM3m/QuZ/TIOhQalKJyhlMsJvJCagTJQLm?=
 =?us-ascii?Q?cB1I6hGfyDu+llBQHo5DdCYO69wyVwAX3X3cxdXrDcPe+Oc3p2ljEvfiddkB?=
 =?us-ascii?Q?wxKASmujjLLFe50zENwBc47N0Yu/KSufakjCkymkVAImSX13K7luP+dK6Pd5?=
 =?us-ascii?Q?HoRM8F7b963LZWlUGFIdQl57ydwPzPNzlFTGetU666Yh5Xyjy927rMu4HQlY?=
 =?us-ascii?Q?+07PSCz3xUIO+F1KmOXF2XXcojXw8z0LhsgwX3WY6jXsMbIctvk1Zm7U+028?=
 =?us-ascii?Q?GIJZeraS0+SdxXEHy1nV4Ro3FNP0SqM0xRJTlU5RQ6cv2UH6jPk0qdQYh/pA?=
 =?us-ascii?Q?ddBfm80rGr8LRtQU5WQAtXWByfORGwPKHY5o94Gs+WJJ6j85XXI7EfL9aDXy?=
 =?us-ascii?Q?QLslJ0k3GVGHBF0/o0jOKrCNJyXITD1Iuhr9XpuQLXWKB3Rey/I7HJjkHcFj?=
 =?us-ascii?Q?cRHddF8IQ+MMHQE6jCd48o0qDXNEbfTiZjXeh2L5yakIHUd2+1S/FzwEs/ec?=
 =?us-ascii?Q?bfxlKalgeEpmpcVtGyhgfbXrnRLb+Eh1WxG2zQMGl8l8ziVuLAWJ59oNk70f?=
 =?us-ascii?Q?wJMCo5yIRA8oJXXNCBQfK384Qm1jnuiXn3OAUgJAnhNxIxxJi7um5jU+2Bwd?=
 =?us-ascii?Q?eSPgFvGTnIKuWMtVB2CV/FLTz9MLHGxnCmHf0hzdPDgakkqTnz1hs5UwD2rO?=
 =?us-ascii?Q?WHmpcVMFq7JjuyTS1Ev96joxEBOr3OgdzcUi+SwD+beMWvIGddTfitPFC2qk?=
 =?us-ascii?Q?nLnIGl18yrVKO5A/PVFMjPv60fN46rjwb0jBuUFYBdLS5dVheIQX7kJI+/iE?=
 =?us-ascii?Q?501UB3Y+eD7XZOAANblZHbGSG0K/0TkSL0odsdLcV9DZuyClrYWseKEdIPid?=
 =?us-ascii?Q?0ON4dEFQwX24i5OIBiY3gqmOUCpPF9mmc+QGU5YJEh+K4BHpLdQJyM/vXtYp?=
 =?us-ascii?Q?ljCC3iqOuKOrOdw92ZQQTvU5xWt9cFpKCqhvpPnu5FR9Nu1y7ybupnRfbGTi?=
 =?us-ascii?Q?HBEZBYotGiC89ibYfeps9SHZyF8kSnKstpeA+9x2ljGy4xmacTTIdUp8j7l6?=
 =?us-ascii?Q?2X4XRRp9K+owVeICFvJCxct0M4Dg8SHTNVa62O4PEkmcC2LcrX4gXen7pMqh?=
 =?us-ascii?Q?7qcpg2UHe1sMBSFaOwcgh2hYuQ/HizjSRmLw3vPmz6LfhA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zGwDpzwtcrrncvah8UQj/9culMAg/v3adMoB1tNCRgJsQj8pVooUv8Z6PFwZ?=
 =?us-ascii?Q?uKjzB2T5mzjRZeTTUmBgJTTRXDyJZVi0MqHUi56QEOYx2DNXc4OE9W6o0jZi?=
 =?us-ascii?Q?bt9iVFCsvMuK4CT2cKhb5iOXM2VZ4y7L7mhQpZCp+T8WQ9Rhm4ilS2hikvCo?=
 =?us-ascii?Q?Nih0+qZtlx0+9b3TgVAdtTZGDo9tyAGLT5+f0c7bfkMvgRMAGCoTEbBggsNk?=
 =?us-ascii?Q?7rmbqLmNGAXK09Wrl4BdixBTO0+9BMIGHIW5kvZoyfADY+uuY5MmhfR11Wjf?=
 =?us-ascii?Q?s/6fRRwksQ7Rn6iMs+9HkcdOciiEMSvqPeB/4hVo86tm23kPWEmbxjJED0k4?=
 =?us-ascii?Q?WN0rCgigpLocHakd27bGcTYNBbz8jztCOJf89C6MrTYAPFztG+BxnsgcB7p9?=
 =?us-ascii?Q?JZ6U7ZKcK6P3J0UqCb++5GFP9ZOrPGWq+Et40aTR37wtg37vkgJMUK5RMjkq?=
 =?us-ascii?Q?dJyPdU/Z255+AiSGNN5yqba8OMxGDzfHUrVMZ+OJhJNvGCGZTpCh5am8oh/K?=
 =?us-ascii?Q?NWVyu4AICI7K0jEWjykp54xUzAQYb1sSKLnDsSS+/FHsQ1oaE7XnwOwJBwaZ?=
 =?us-ascii?Q?YX7MFMS+/+bYTfTA8KnmQrqWzm4PrxzlEqfB3NJVsTr1484qTpFHd0d2NjCG?=
 =?us-ascii?Q?rPJQBO4ZEs727y9QSmOWtaFiM5LBXu72+S9dU/13whAg9tehIgyc2+cXA71l?=
 =?us-ascii?Q?bAYsEyjvQepTQIdNd0xkxfkcyp9ikCVVkFQzrhnNipkeqWGiytR5dm4zp4q1?=
 =?us-ascii?Q?cnqksl+6XKD5qeolUEAQTYUUn8zpAay02ECf93FgFXCTFqFm/+T6j4yzAGKh?=
 =?us-ascii?Q?bRSRvN8Cuw5VMxQd36FJX9iB3hvfMCcx2m0071fuOYNsRreTpwhHdoNqf9eA?=
 =?us-ascii?Q?7j8EtmH4JV7f/vqO9Em8lnLU8xYZX1H4QnkzO6ggy6TY3+xNHod65LisIe2Z?=
 =?us-ascii?Q?mJK51j1T28AhMdnUdWvevuZ4Um/nHnZupzfEJHx3Rfkrh3c9t9i5Ftwpz7k0?=
 =?us-ascii?Q?sDHECQiqVBYLvHQR4oGT7hporJhI8v6J+8Vx2qRCq7ie3KUUpca4YDa3m8R0?=
 =?us-ascii?Q?32pSZg9RvjaVLT6nbL1+ayHtUHdwo+tIk5zOu51L48yKTHbnKSX7lDwqMKjc?=
 =?us-ascii?Q?8E0JmuADpVCzF6G1nDWpJCD3gNRlHeh5nCwUfAiz4HwnNdpPVWJTQkGaWn7U?=
 =?us-ascii?Q?wQxlUqP1bnw+KC/L3MBPXs2DLMyDgpu9jJ9A1F7cLLRAFvjqUxkXGKmzvwA9?=
 =?us-ascii?Q?aLN9yBwQKFI3CV50AfXjaHkNRKR1qqxe/bRFC4EMqaNua0Nwn5KzwPtBCVQm?=
 =?us-ascii?Q?7QJWCDgloTt1MRsTW9uBoG7yfYi5H2e954FvW8Ekl232TDH43XPxZsOa0Rtd?=
 =?us-ascii?Q?eglUQ5U30CIkG1gY3DIRaoIO4Ws6zDU5Z64Ow1x/KO/YgyrMW0RcRmCN6q4q?=
 =?us-ascii?Q?4PISuktEB6PAabqqaf5WXER7jVDYGRvW0kbeE/0STdrjDvWXu4vNWAyyRiMt?=
 =?us-ascii?Q?5M2WcvcIrzTCN8GZthoKnworMd0ABSZaBHmsmyYu+nVZF/2Z+RCbwAQHdLOX?=
 =?us-ascii?Q?YvCrMjTQPe0E1BzlvP/fl1fWHUzuZIzoqNFZZOkKqD+eftmUGp27ouNd7lY+?=
 =?us-ascii?Q?Pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac35018-8f44-41b3-05a6-08dca1ccab6e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 17:12:40.3519 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vB0T2u4WJZZFz1MZ0Z8oYl9DZnwRJRAjlyvrqDsIWsqKh8NpYsFhvVZHCEFeRWrwrTUybsCoC/fqMVdhEjF2ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7107
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

Introduce a new xe_ggtt_print_holes helper that attends the SRIOV
demand and finishes the goal of limiting drm_mm access to xe_ggtt.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c               | 40 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h               |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 25 +-------------
 3 files changed, 42 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index dbaf1ce87fb4..5b51753fe1ba 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -682,3 +682,43 @@ int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p)
 	mutex_unlock(&ggtt->lock);
 	return err;
 }
+
+/**
+ * xe_ggtt_print_holes - Print holes
+ * @ggtt: the &xe_ggtt to be inspected
+ * @alignment: min alignment
+ * @p: the &drm_printer
+ *
+ * Print GGTT ranges that are available and return total size available.
+ *
+ * Return: Total available size.
+ */
+u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p)
+{
+	const struct drm_mm *mm = &ggtt->mm;
+	const struct drm_mm_node *entry;
+	u64 hole_min_start = xe_wopcm_size(tile_to_xe(ggtt->tile));
+	u64 hole_start, hole_end, hole_size;
+	u64 total;
+	char buf[10];
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
+		total += hole_size;
+
+		string_get_size(hole_size, 1, STRING_UNITS_2, buf, sizeof(buf));
+		drm_printf(p, "range:\t%#llx-%#llx\t(%s)\n",
+			   hole_start, hole_end - 1, buf);
+	}
+
+	mutex_unlock(&ggtt->lock);
+
+	return total;
+}
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 31060fe7644b..67ae5f1602a3 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -32,6 +32,7 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
 
 int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
+u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p);
 
 #ifdef CONFIG_PCI_IOV
 void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct xe_ggtt_node *node, u16 vfid);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 1d17c34fe5a4..d0995680f53f 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -6,9 +6,6 @@
 #include <linux/string_choices.h>
 #include <linux/wordpart.h>
 
-/* FIXME: remove this after encapsulating all drm_mm_node access into xe_ggtt */
-#include <drm/drm_mm.h>
-
 #include "abi/guc_actions_sriov_abi.h"
 #include "abi/guc_klvs_abi.h"
 
@@ -2096,11 +2093,7 @@ int xe_gt_sriov_pf_config_print_dbs(struct xe_gt *gt, struct drm_printer *p)
 int xe_gt_sriov_pf_config_print_available_ggtt(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_ggtt *ggtt = gt_to_tile(gt)->mem.ggtt;
-	const struct drm_mm *mm = &ggtt->mm;
-	const struct drm_mm_node *entry;
 	u64 alignment = pf_get_ggtt_alignment(gt);
-	u64 hole_min_start = xe_wopcm_size(gt_to_xe(gt));
-	u64 hole_start, hole_end, hole_size;
 	u64 spare, avail, total = 0;
 	char buf[10];
 
@@ -2109,24 +2102,8 @@ int xe_gt_sriov_pf_config_print_available_ggtt(struct xe_gt *gt, struct drm_prin
 	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
 
 	spare = pf_get_spare_ggtt(gt);
+	total = xe_ggtt_print_holes(ggtt, alignment, p);
 
-	mutex_lock(&ggtt->lock);
-
-	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
-		hole_start = max(hole_start, hole_min_start);
-		hole_start = ALIGN(hole_start, alignment);
-		hole_end = ALIGN_DOWN(hole_end, alignment);
-		if (hole_start >= hole_end)
-			continue;
-		hole_size = hole_end - hole_start;
-		total += hole_size;
-
-		string_get_size(hole_size, 1, STRING_UNITS_2, buf, sizeof(buf));
-		drm_printf(p, "range:\t%#llx-%#llx\t(%s)\n",
-			   hole_start, hole_end - 1, buf);
-	}
-
-	mutex_unlock(&ggtt->lock);
 	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
 
 	string_get_size(total, 1, STRING_UNITS_2, buf, sizeof(buf));
-- 
2.45.2

