Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAC1CD5BCA
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:26:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 247C810E3D3;
	Tue, 19 Sep 2023 14:26:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0486F10E3C3
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 14:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695133586; x=1726669586;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ul1LShvQZiX9ZuDmfb2iV1KNSD/7eyfmuIU8b9EXz0Q=;
 b=iU/E6SgXD6Z/3xRCm8S9ZGwWqH2z3+P4bjYlXapwdKdklCV23hbU/x+P
 zO3Y+ZdijwYNkFQv3DKh3s0FjMqFZ0JTuj+f1OeTsTRtPySqSe3envwdf
 MqE7skBr6X+YZw1SwZ/5rQ0X13zZM/YpKV3pP0S5hjwRHWo6ZiEF7A6E9
 rQ55nX7ibR569bV5kPtlXfl+1s49BCMuyE3WnDuLA/OLG7Nc3GWerL+oC
 sH2MIOd8KmS6s8EXOEJb+ptVxw5KaK6E0IQzvjpefpNX7AExAGc3ExBkj
 PaiOpvTXBYVVgVuYcEdlwOqjFpwL6wSyRLLJQ/sQE7uyu+FgSfhYGpPB6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="383786071"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="383786071"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:26:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="781319661"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="781319661"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:26:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:26:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=huaMAc3K8gPVJy8mxYhu4aWQsrDSoEB5wh4AKHHW8oq3vzz6f2Xbp35TPclm1kACwtL4T2/xy/+i1Pjzn65BnNMLagpX6/fIuAAjK9Lr/P0qXrMiYdMbsVSm18oWPk7kCv2QSuGG32l5lmFpEIfInMHr4EfjnusKgQ0n5w272IPCA1i3lL26+R0irgGrQavns9F2XXUYvXkHtfVh8dE0DtVYFr8w7Hb2SxzykaYimnTJHV3Fsp4h/6sb7nMf8ENa8/bpa3BqQ6mPQ+zVO9gmyL1Cwpfghb3qIzobB8v/hTk9wvg8UGWjpJRqPXXny7luTgT+lw+xSvLfVILHm4q59g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNF7ewGsFUKXklwN/MOnFQE5eRvIt6hb2D8qc7wUrWA=;
 b=is6R50q29oqbK0OIDU2c/ELQS4JhfgtK2Ifu5UQtDhToGV1dlatHWBLWcEypMBczgON5VCWqbwoe+5rChwO2eH1fxgl+QWmDVBOIsiieQ6DlU4lgC5IgJoCNR59EjmaHZvC9ITlXcMPVa5fHRedQJcNxLsz2X99DjagZ/mMzKNJMPZ+3Xrn5pxmMZk9rwavSn+AuPegpK3/06sMwYZeNLe2K1ShoWqd9aLU4lnSQAK5iCAG2Z6V3EtIf+tG6aKapANrXfAoCuY2HRun//98ENm4J0RoAnmtM/OM6CNSml/s4hU3ol0AfUoNmY5ngHYSlpNAVluhorKQFPvqRyUaHDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO6PR11MB5585.namprd11.prod.outlook.com (2603:10b6:5:356::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Tue, 19 Sep
 2023 14:26:07 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 14:26:07 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:24:54 -0400
Message-ID: <20230919142504.91652-8-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919142504.91652-1-rodrigo.vivi@intel.com>
References: <20230919142504.91652-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0067.namprd05.prod.outlook.com
 (2603:10b6:a03:74::44) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO6PR11MB5585:EE_
X-MS-Office365-Filtering-Correlation-Id: 32a3c090-2c26-4a82-71e1-08dbb91c5c47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l38Ngb7QKe+zIWwjjCdCxdJs6JKaKh8FSM1mIndowNrZEW5UGX9GzW1ioGIDANLcUGzZ4JOvqh2n1gv+cmSnwXmHcwzGaqcr0k1/Fz7QlXtgbrY/THlrHBCq00GvvuEPeGW8wiG/KwRcJy15d5Vb8pzPXoFLRQotGXoIGlnOwE46Q01fxekqLNhjYchKZ+sQP0MGL8mEPhpmjvnQbIWfXielzoy6+JFwWb0Ez9W/Ceo7Rj1hUe1efCIAn57y9cDGb/ruHdHVEo8vTt+q6aHITDpby9cFJCrWuqHVT8T1buztOY8QaIJ+ScZkar47mpvxQL5PNep6gG3oq3+PhFMGVKW4OcWOdg6eOEobEy2SMiU9Q5NQR+x1NnNNdrldyyUMxoHr7yVZMtKDtjE+rzjNvvxg97ge5N1M5O3J4trrR4oGYtNz2QxPypJDL/aKOVaut0lC4crPphbXMfPf1aIWs8hv/40xvdP5jr3KoyT97VB0LED0g32/+2Qmcc33hdw8As6hVblhl9VaGMT+cCsm5HlJ6lSAfJAsEopTc6Qr0KkxjROgKEr5NAW0sdfjbHvJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(39860400002)(346002)(376002)(451199024)(1800799009)(186009)(36756003)(44832011)(5660300002)(83380400001)(86362001)(4326008)(8936002)(8676002)(41300700001)(6506007)(6486002)(6666004)(82960400001)(107886003)(26005)(1076003)(2616005)(6512007)(66946007)(478600001)(2906002)(38100700002)(6916009)(316002)(66476007)(66556008)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uMWfBDDLsXVmJaanU2AxYRKnY4kbnxPnSEau7+fHF19Bpmjy5rtbA3uw4r5U?=
 =?us-ascii?Q?rOpz6sWxjajkYZQsuAAbpZxHfI3PPbqByqVnqiadnLrWfJEF6AcFVWLaKMOL?=
 =?us-ascii?Q?qtZvqu6iWZVTx+g7p7M5fS9jK+gPSm/bFIv2qUVrbASxLyYVANq5s7PNRegt?=
 =?us-ascii?Q?JTDYCykvsNHzkwL/Mws2lUcUFoY2wvgqIV0gD4KzUim0v9t0pYLIDHyzJOkA?=
 =?us-ascii?Q?fZ1xwv45qOTpYgv2Tb4Ei2Id3ejFM7L7IYO6K7JKB02GGIGG41D80pyofmOj?=
 =?us-ascii?Q?0hYrtC8SA/C8B3rtEj7lVWHQ0rEcexPtv9Qh1Gpc1cW6gKcJMdEniG4fIb3W?=
 =?us-ascii?Q?Yqpy+MAFVrfTP8x91i2svOhNzu4HEwCYuv/ab0ErEQgRKDNUXrcgyZgEb9j+?=
 =?us-ascii?Q?N4i9SM79qtcCzi95ubb65HXZvUNzZV2QcxTbyYNO/TUKJoN1F6Q6KRRc7qU9?=
 =?us-ascii?Q?kNJs06XPejRc/+79Pa/BcdpBo9i1eEddldjyzxkKikrhgI+CBfCLFMIxNVp1?=
 =?us-ascii?Q?uFTNIUKtjkhvijAaBm1zkijHm2oIVNdOi0PWcTbtNIQi+RlmoGDh1jYt4Fyg?=
 =?us-ascii?Q?n8P/GEq3V8c6ygt1LXldGMqHLKlC3WG7eA+OyZHFpTD7zwg/bE/ztFDNAgGv?=
 =?us-ascii?Q?DlWacfCQdlHdReiL/e7WcUlfHOtRJF7xfl8y+OpQNvV0zI743JzhxOr4sOYd?=
 =?us-ascii?Q?D5BYRM71ziJH3QXoCmQBbfHIybumT6h17HBeKyd0WueMILzDRz5+ijeyDJDe?=
 =?us-ascii?Q?pUG+TUuFRZExACOxsy4WSRbYO1ZMAfkYziLn3VqwirSCw+EtaGhqdqVE+lpZ?=
 =?us-ascii?Q?ekw2pG2xAfXlfh3hXWWUdBu3We9lUJ2hoIkiEJJMXGe7UzmNclTHAcOkwQlw?=
 =?us-ascii?Q?5e0mA84DbKmGCCfn1+0LBVEkYTNShbSK//avMrq0KNJ/YsOsf9DDqNawiAxt?=
 =?us-ascii?Q?Ie20YpGTA+yAIfyhsiKyJz4G8V+ST1UNn67sHzWbbt6JmDxF1emhhPRSAFX+?=
 =?us-ascii?Q?2GhNH3RtGUneiLUr6QP4fX3z31eY+XoHVDC0pYVf/zPj6WDoekN3jYa50tZk?=
 =?us-ascii?Q?Zgm+yPSibmUemhuAqZJvaU1AWRF/v7t5j8J18k42P/rPySO8JcACjUj8tHAV?=
 =?us-ascii?Q?ASE2CzaNV06yUIRUHeL3M1VjlwmA83NbSYRSqS9U/CiVjR66zSErbMu3OZvp?=
 =?us-ascii?Q?uniQ5HiGfb87Ykb6/QmonHgXQEeHHSeBdTPWmwJfaRqr9hNyklIfsXDcKSWY?=
 =?us-ascii?Q?haGAiqXbuWtELgzF8u7ITkAV30kp/XlbAhXRHqs8yt1FGlGW3IKEVwvSHXT5?=
 =?us-ascii?Q?6N7HcUTnbn+C2iIpLkPzE+jr/5j9tZRhbqKRE2yNa0hzhzoBvdo2nt9C0KPH?=
 =?us-ascii?Q?DdCcl4V3m6vOyMkGZFuZAp7uZ6ZM6yTQ9MEoH3pZu31dLxXZTwqZoawtvtTU?=
 =?us-ascii?Q?yi3cswp6Cj320T7JQfhS3BaQwaCJruk7DqmA39gOvk1D5xnOXRspTkIiBDDd?=
 =?us-ascii?Q?b6dGXAokeMhJ3igCTzrcOMcovRBlEvfmj6U0iwO44YizbOSzTyxr8g/39o7E?=
 =?us-ascii?Q?mHIthmvwdNS+4tZjBobnjdZW20jB9fzrSvZJuq4BNG4l3LeHk7qnbAUy48f3?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a3c090-2c26-4a82-71e1-08dbb91c5c47
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:26:06.3957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pYjykybKJ+i1XkwAM7d/jvLTAVsHREnhVAx90WAr0lf+sBL4n18Mpm/NQKN2Nn+Q3W/wcVNR7qVebwhLx4kRlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5585
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 07/17] drm/xe: Fix xe_exec_queue_is_idle for
 parallel exec queues
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
Cc: kamil.kopryk@intel.com, filip.hazubski@intel.com, jakub.chaberek@intel.com,
 effie.yu@intel.com, bartosz.dunajski@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, carl.zhang@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

Last little piece to support parallel exec queue is compute mode.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 744be293fe37..6f1e64896a2d 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -867,8 +867,17 @@ bool xe_exec_queue_ring_full(struct xe_exec_queue *q)
  */
 bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
 {
-	if (XE_WARN_ON(xe_exec_queue_is_parallel(q)))
-		return false;
+	if (xe_exec_queue_is_parallel(q)) {
+		int i;
+
+		for (i = 0; i < q->width; ++i) {
+			if (xe_lrc_seqno(&q->lrc[i]) !=
+			    q->lrc[i].fence_ctx.next_seqno - 1)
+				return false;
+		}
+
+		return true;
+	}
 
 	return xe_lrc_seqno(&q->lrc[0]) ==
 		q->lrc[0].fence_ctx.next_seqno - 1;
-- 
2.41.0

