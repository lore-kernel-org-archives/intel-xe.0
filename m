Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97A6C531DE
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 22:08:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924CB10E4AA;
	Thu, 15 Aug 2024 22:08:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ir4qK0PU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EDB610E43B
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 22:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723759687; x=1755295687;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=7kX0GwVjQ5y557raWwm1xU+GiTUNkJV21VQ2XwxSVlA=;
 b=Ir4qK0PUTVtpL5f3xj1MwtywNJ/SbzgIG6Locs0Lrk8pces36gBqVAt5
 26aA/JYu2JXUYgzU7Wg+5OmObKVxXEETG3UMgxS34Qhs/Jh5eVUqAnteH
 AV5qG+G7r2a7wgLXgK0gWHqleXjgB20flF1ltG5GEi0MJ2UBKtrETBirC
 cJ1/A0UTiPuoS2rorg1gBTpqpVdsHfLeX/Vy2RmoBNcwZIPvQpm+nroP9
 sH2xiXGhmbCifCqXkhisRO30K7i9jHY8UKVxlWCE94mQSdFx4wr4ZTW+v
 71dhLK4YhcS+OiC+kSdgNAwfwzQr2B6IHRI5uuXohdpXz7GlvNcXwD0kG Q==;
X-CSE-ConnectionGUID: riVVjH62T5q9NXPyKiGCHA==
X-CSE-MsgGUID: tKLtfFyhQaSJmNtMhu72ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="24943256"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="24943256"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 15:08:07 -0700
X-CSE-ConnectionGUID: lEXdBmWcQLutImyELEXJuw==
X-CSE-MsgGUID: tIPPiFg8Q5mZMhTejyl9jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="64335970"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 15:08:07 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 15:08:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 15:08:06 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 15:08:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PuqQtSRODBk8JOKPN8OaMKx5fPW2DNLcUux55g1PZFDqsoOt1SeJyS+O4LEOSBKy/qoFplcYEXL9EcQmsVGwFHA5Fx/r7zsY/DsSjrPcbM5sWwDHSG4Q81yvL/U7yR0xMH//EqGG2pDHnrGaPoVEDMGZSBoEbuDv4BHmB8cjNAFJhbDmNIjwP48xnBORwIrNzfvkwxgEAUZ4hbzDRrQZxiYFywm/KQwvdrsC+QJt/O3YbIavUHTjRfMlQgFsKvJ0tLoX/7yfzRxDoX9fLX9VXAu1LKS3WFMxpLKH7w9aqKVF3o20iaE5oS7fPmpGWpZPseLKUoMuqW6Q66cf0vN+wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxaM2/xb/CH0YB12J/dhVCOCtzobKdI3ZRJw85bNLIg=;
 b=tYuBJzhqsacjduxdbwftd6IjIZUHgNWCE+ZSNUzSYQYjQhJ//h66GMb6wROVygvRnLFGt1vqtkwW3JIspOAfcR+599przYvM2uTnNPl2MKoQGqYRoQZgCjBbVIMvqbyC0I/vTzP/0G0kMEsW1yY8BViiS/ix9nIA3qCN3fTGEWVIQ2nc7gR2tFINMjuUpEHCcaBlT+Hgfsif5oJEZekmUFfF7v1gf6c7PG6PLxPSCnGDOEe+51o0EliE0dt7U97ljx925KJmpMHj5acp3eqlDQtKzRjoenjqpmaMjTYT5R4drHqTrHAUd290Dy3xPOOd633RVFyVRb9PJ6t+TE21Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CY8PR11MB7133.namprd11.prod.outlook.com (2603:10b6:930:63::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Thu, 15 Aug
 2024 22:08:00 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Thu, 15 Aug 2024
 22:08:00 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <jose.souza@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 10/12] drm/xe: Rename xe_ggtt balloon functions to make the
 node clear
Date: Thu, 15 Aug 2024 18:07:30 -0400
Message-ID: <20240815220732.49675-10-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240815220732.49675-1-rodrigo.vivi@intel.com>
References: <20240815220732.49675-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0034.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::47) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CY8PR11MB7133:EE_
X-MS-Office365-Filtering-Correlation-Id: 104f0e08-c650-4faf-92c1-08dcbd76b9c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RMcx5z+WaMLsCsLivVqIE+JVt164qqy7U3aGIkx4h1Ws7Yl1a9W2rtdBeBEj?=
 =?us-ascii?Q?idWxd/0+kKMH5lKRMNU8/nxyK0CFxGbAzlgkbvz+phV2LEhhoRoRgph1C2bt?=
 =?us-ascii?Q?NaPKg1JGAQrf5/yx+tSLFUEsNw0XfRdKuwr0Hk7seTSTxow/6UM20AQkadaZ?=
 =?us-ascii?Q?SY6ju9DusxJDT9DOM/24wIuUfrPQlQi6cvINTsN1icImUSs44hzt/VSEyOHt?=
 =?us-ascii?Q?A9XLfYmhdrBHC/GpF1wkU4NgNHm2eEB2GuskiFUuZ4qAFuuQDQ9T2QZtaNsv?=
 =?us-ascii?Q?o+5J/+us2m/OQPuh7/JMY/UzBQewITDjVfOM2FoZJUg0GowYcikOvEIv807Q?=
 =?us-ascii?Q?h5B8f0hC/KwD7FcV8Ln2XUddjatGpFtHu+L2ygKDvWeGsmSFX1CKhe3LXdPc?=
 =?us-ascii?Q?YG/+DyoYeyGIU3PBvAeg6WAEQQL02B0biwXT9/u6Zh7NWktZo3U4kuOQJikx?=
 =?us-ascii?Q?hxS7u/rzjOdDAvLlLWhMFGBQCyDPhiCyWF/u53RyYPSPOuTr8LgjQhdQAAPJ?=
 =?us-ascii?Q?PtSD9Znrd09KVDA9vQ+uQGwqZwqEKpKI5e47WgGU0O58+J2qzBDfh9+IWmbv?=
 =?us-ascii?Q?NVgI91/8HJDZ0yhxCN1eo3+/SbpvtxvIgkx/8m8QnUrPEiafsG9lAfaSC6hK?=
 =?us-ascii?Q?nm2QEWS1fKC5+4ALDqUgNCAfmHdi67W4wYxaIYFzTuZT+B73hVSLLQtxlfRB?=
 =?us-ascii?Q?e0HcaHlXuMEMDly3tkQwEi3AmuvWM+9WfMWnqNgT9Xb4k7IEnx6NiluHpif0?=
 =?us-ascii?Q?rOVgLkvs+av6i9jy7zNl/dJh+uZCXcE7wwyIEMmc26VrR33CMbVErB5ILEfF?=
 =?us-ascii?Q?aVYSsY11UVilCWcOioojQuBpVzapXldMeSCni7Wg21gitNx21w8kSWD3QgDd?=
 =?us-ascii?Q?3CrxAd7W4pL2Nwak+OBCZBskb3zSDmuLoUv0msz6Ge3CjLf74ZkBq9VWobBn?=
 =?us-ascii?Q?0O8zfCRXeSzr2e0y1ieXHHIFe3W0gX7fv1zfF3886VUk2jCxAuE3Ht5+C9sm?=
 =?us-ascii?Q?O2f5ETAv8u7/0D6tAeA+xHv2iB4gTUDE7vq2zU/VWQo+ojCyZcOhzDslH71H?=
 =?us-ascii?Q?OGu+eHW566qbN9D0trbV6UhPc909bcsnN5/AFOnO2eXOdAeuufbFcvut/i4I?=
 =?us-ascii?Q?t/ZcFDaoTsOAK91BpE+TK8u1kkMbjAUcOTGkfwvmxuMNR7GvDLz9A1jPai7i?=
 =?us-ascii?Q?j6rQsgEUYawkngWQdynJIqKgQDSt66fbGc0+xU+RpNGJWx29NFIrRxSbbSQE?=
 =?us-ascii?Q?+B2xOx77KxeClMgulrHG3AnDzmiweQAr/5VQIHyY0wufuoHuJRTyurGRoa0T?=
 =?us-ascii?Q?CnrA4sh5uUrqgzn/2uf2U+PgDmTNAHlr0vLXYTa6gyVL8A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kk0w77yR8tNJkTCrhhkjaZdDqnMsZeZQ/n6qyvK0QI5Y1vDPVBxwOwqXV91t?=
 =?us-ascii?Q?9ctBKE6ft0BCy5eUHas7ndvr/EvBkebaziQAh1MIUT1zOMJC+8KKV1qnsI/P?=
 =?us-ascii?Q?2x7M0rJLu2OtLdvrVDQ9Z4yYmYrMXOGFJHO1Tco9gN/COA9kkxFjuIE6HOUh?=
 =?us-ascii?Q?ZxAaUytckLlBkfQ8eaMDtOklZAQ79crNjJslqjahcemALTVyHQwMw9s6Fd8/?=
 =?us-ascii?Q?s8ylbv+ZUf2czRSJCvIGm6QVkJtGiZrv1fAsdFCA0gXjXjy2XEO0/gAteARq?=
 =?us-ascii?Q?BmNbC2IYA+InVn0VMMGoTq00pGqAuRbVzZsxTRcD/uvarZ+OYnJoCC/iBi40?=
 =?us-ascii?Q?9FtQkaSPyjRe06g59HL3chHroJogB391n1JRrlFetkcGGJqy1F7E7artkxBd?=
 =?us-ascii?Q?5sdYRWTvYVExK7xFnq+1MQye5rBw2AU3rg8GoJC7lPJMkZfga+wg8jauOcNp?=
 =?us-ascii?Q?6m0hXe6V8XuFhL7a3eMNE8QCQijFnPl/FdiAdUMbxxomM5z4q9N4IyhF50Te?=
 =?us-ascii?Q?Tt9uzzN/vFMZanyRJT3wUSKatagARsl2HOCCyXmzIW5ch4uu5ICD8jPJJ4h3?=
 =?us-ascii?Q?gaidSG/bgLWA8FZRDyysQrD0xjeqaT/3NOpymf63MzPRw/uEyocei6u33XuQ?=
 =?us-ascii?Q?kQCIuRM1At2Oqjak8cJNF/24QHt9ClpRJjmypIV7XONbnWacweVBn5DBSrDb?=
 =?us-ascii?Q?ydBO8ThbvuxMn3qJ2dc6n3aRP72Q6kCgOEEGhMTBY8HxqRnm1NKkpiU2DgKr?=
 =?us-ascii?Q?mf2f6zbYApwNSoc75VOA9VZjvbxqnTybIAlKdTgjmszrl4isDDmw2rkGN6g8?=
 =?us-ascii?Q?ltvfBp46UoAAmHuA7RrXqjJktLZW4L7+ViPaq2ivYdESFYE5xtEUuiCvRxz9?=
 =?us-ascii?Q?WzsDuvaGBzJbSj7cs3BI281nX9YqNO7GabqN9Z3Gxb8PQOGvwhkGDeYaxFlm?=
 =?us-ascii?Q?Yrk6L3rw3tuNdyziZXT0O+9cqw87Xm2QlumBwsAtReeC8CHayI2AXRtTlx5K?=
 =?us-ascii?Q?BmBD34c6xWJ8m2q/Ax03dNZEQYYAGOFQQoDO93Z5ubLOkxtxRzJIDksXktr/?=
 =?us-ascii?Q?qpDN4sMnvNyhCc8PW4VAaC51hxFFgOmbbZcaGIGWgoChr+0GcQo8S+9yBx3Q?=
 =?us-ascii?Q?moexwB46gM6aB/qxTnE/N4ckVe2nZWOnkpltlfHOlNWKc+aXdo//mot2mfPK?=
 =?us-ascii?Q?MGc3fCPBOYKsoPkhYrhwWVVqbbZYBKXDJ7HJat2DC2LMuUW/u97ZXZNVyJeh?=
 =?us-ascii?Q?I821WcZSPfuhFOc0vwtc+lUTHpWKR3W4j7pkPEWnhNkWuknw072knsDcY9xG?=
 =?us-ascii?Q?PbjWrk/g6HZl38qOwZLRv7NOPRbPBZpPXpXibdMEwCPgcXAYOhYk0ngK9Lbs?=
 =?us-ascii?Q?hLzyZRcmHZocYzMMFE1hoO5kNtI+HuMX6fWEoM276IG1P4iTOcGmpsVEtexj?=
 =?us-ascii?Q?3ishCyLvrPxnWjvAsqpWFswxoUegxtoUg8kSg1mTlpfaSYNwPd7Gc/LF9fR8?=
 =?us-ascii?Q?aeMZc3GgSyrOWPS7Vp4cf/xX87ppPIHnDvQA9hTV/tcPTikeDhmu2cVpujLz?=
 =?us-ascii?Q?ljc2V0OX8BsBEiJUwTas2ByDiSEeja1/+gFSAXQx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 104f0e08-c650-4faf-92c1-08dcbd76b9c4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 22:08:00.1958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nQBOrvbkzkhFbkV+6lpr2BcNBB3dcspLHQm5nEJkqFCu9w35prVdg+YJW0T6SmhVb/xUiR0H6deuxyNW2Bai5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7133
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

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c        | 12 ++++++------
 drivers/gpu/drm/xe/xe_ggtt.h        |  4 ++--
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 10 +++++-----
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 960f5a28b7ed..05c3e6e929ae 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -347,17 +347,17 @@ static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
 }
 
 /**
- * xe_ggtt_balloon - prevent allocation of specified GGTT addresses
+ * xe_ggtt_node_balloon - prevent allocation of specified GGTT addresses
  * @ggtt: the &xe_ggtt where we want to make reservation
  * @start: the starting GGTT address of the reserved region
  * @end: then end GGTT address of the reserved region
  * @node: the &xe_ggtt_node to hold reserved GGTT node
  *
- * Use xe_ggtt_deballoon() to release a reserved GGTT node.
+ * Use xe_ggtt_node_deballoon() to release a reserved GGTT node.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct xe_ggtt_node *node)
+int xe_ggtt_node_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct xe_ggtt_node *node)
 {
 	int err;
 
@@ -384,13 +384,13 @@ int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct xe_ggtt_nod
 }
 
 /**
- * xe_ggtt_deballoon - release a reserved GGTT region
+ * xe_ggtt_node_deballoon - release a reserved GGTT region
  * @ggtt: the &xe_ggtt where reserved node belongs
  * @node: the &xe_ggtt_node with reserved GGTT region
  *
- * See xe_ggtt_balloon() for details.
+ * See xe_ggtt_node_balloon() for details.
  */
-void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
+void xe_ggtt_node_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
 {
 	if (!drm_mm_node_allocated(&node->base))
 		return;
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 67ae5f1602a3..e68cede2e6b5 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -13,8 +13,8 @@ struct drm_printer;
 int xe_ggtt_init_early(struct xe_ggtt *ggtt);
 int xe_ggtt_init(struct xe_ggtt *ggtt);
 
-int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct xe_ggtt_node *node);
-void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node);
+int xe_ggtt_node_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct xe_ggtt_node *node);
+void xe_ggtt_node_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node);
 
 int xe_ggtt_node_insert(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 			u32 size, u32 align);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 47222bd9988d..9a1be23ae71d 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -528,7 +528,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
 	start = xe_wopcm_size(xe);
 	end = config->ggtt_base;
 	if (end != start) {
-		err = xe_ggtt_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[0]);
+		err = xe_ggtt_node_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[0]);
 		if (err)
 			goto failed;
 	}
@@ -536,7 +536,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
 	start = config->ggtt_base + config->ggtt_size;
 	end = GUC_GGTT_TOP;
 	if (end != start) {
-		err = xe_ggtt_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[1]);
+		err = xe_ggtt_node_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[1]);
 		if (err)
 			goto deballoon;
 	}
@@ -544,7 +544,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
 	return 0;
 
 deballoon:
-	xe_ggtt_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
+	xe_ggtt_node_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
 failed:
 	return err;
 }
@@ -555,8 +555,8 @@ static void deballoon_ggtt(struct drm_device *drm, void *arg)
 	struct xe_ggtt *ggtt = tile->mem.ggtt;
 
 	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
-	xe_ggtt_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[1]);
-	xe_ggtt_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
+	xe_ggtt_node_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[1]);
+	xe_ggtt_node_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
 }
 
 /**
-- 
2.46.0

