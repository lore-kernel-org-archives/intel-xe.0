Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A55AC3DA45
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 17:13:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D3B10EB1E;
	Thu, 11 Jul 2024 17:13:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M6iu85RV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE69710EB27
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 17:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720717994; x=1752253994;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=AfgLMzFJ1mQyXx1ZkYyvii8FaRMWsvPBikLq5nbMHPA=;
 b=M6iu85RVgvlynmFvXNycCf/aVh9+OUGj6qtzmBBw1WFnFGozKTqu2Xvh
 Np3Zs6kdrNqbUPQLPGI5Kb7W+dwZkghmvoLExJL9SKRFKsu7sYnGHc6Ep
 XaS2UH38lAx646chdsLMoA4+z/6ehWGn2c1H82MqF1zmww2/v+GCIG1Xy
 pS6M9O1ohoKfnEZBg/sApxU38Ynp35nZe0BjAx5IvGvVCAwcpqvKd4Q1I
 43bT56kPBJXyM4Gja7DzAygcicnMott1Cfa95XAVK5wI7lfRwbO01N5JV
 aopt3sKu1qaQIbdCONJbDLruz0l0fEKBz1K6mxORn3N8SjNM5vnSXISEx g==;
X-CSE-ConnectionGUID: jMIJk+O+SOq/sOuTzGSWAw==
X-CSE-MsgGUID: 8Gc2SdrkQqWcC2/eR0bNug==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="29518966"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="29518966"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 10:12:50 -0700
X-CSE-ConnectionGUID: fxgsfM+HQPSWeqMJI3AlYw==
X-CSE-MsgGUID: wNicDjDkSLy5tf0mXB2kWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="53821229"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 10:12:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 10:12:49 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 10:12:49 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 10:12:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QELFuGWNc7KsnimpeOvu9hEWdE8dNZN4Z2QfCelF1J6XYPqSOKh3t2yRXotNkS5H1SmQWPV8E0Wzj+CcItht+o5Om63jWBAla8fvLz2OchczGTv77q9Kz2kFvQxjUDDaTaUSRpajWTYdz8O9gx9RGArkbvZiGLd0TtyYF9KvNPe3FMEvDSjRt7BMPjbIX/RzFKga7p4VOXcBrJmd7PawnkVXekNaUPO61agmG4e4E445HePzJpupTWqGiWgpjZmZRs7q7qviKwllxkkky8OCshurYwHKEduGB1XXDCMOsQJQHJVTSF0lG7/TzWKL4ftEt3SogHGD0FzQdtjeIGoT7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2kx+5qR78uC2s+as0kueSSUtZ3F6rL/VaAQhHYlRyQ=;
 b=oSixOfXng4bewmIjgZ7LYnUE1mpepiFg85c7b5YPZB2AIETczTcV46p6njT67eqDmQdMCQw8wS3leaHCpNgfwh7qs8e22QlCWGRAr6fGuD73TenaNQoId0u9ndTMXGLMWcVuc6JlUpx0Zmuqz8Wr98im5cftDofwRBouDBHsWvQ7gSOX/2bl4gFAYH7S//7C7W9pPPp3qVkVguS7GJIJpWf1pJawgnsEKm0bcisKC/0lCPlOMs1NQcrmObs4YYKEl650edieNbzxiHetyfNYYPWTiBBV11nLCw9hxfejJ7nCa47FZP/0mq8SsJ6WNwt8BxVXj2IhvXTBgAfL5QAC7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 CH3PR11MB7202.namprd11.prod.outlook.com (2603:10b6:610:142::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Thu, 11 Jul
 2024 17:12:43 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%3]) with mapi id 15.20.7762.016; Thu, 11 Jul 2024
 17:12:43 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: [PATCH 10/12] drm/xe: Rename xe_ggtt balloon functions to make the
 node clear
Date: Thu, 11 Jul 2024 13:11:53 -0400
Message-ID: <20240711171155.173717-10-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240711171155.173717-1-rodrigo.vivi@intel.com>
References: <20240711171155.173717-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::16) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|CH3PR11MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ab32406-19c1-4acc-1208-08dca1ccad15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3Z/TfR4juoe2PuK/YFGZIPFVWNrVyO3l/oYbrp4tK3PTUbO5KqI8CrUSEE7c?=
 =?us-ascii?Q?H9Fv4TrpTqfA/ZxpCfAFWAvj9kNfw72VxGNJlLFftbPwaBZ3LTLJ6LGKB1XF?=
 =?us-ascii?Q?7MRa9LSIIhA0phMSa39X/br8v/qkwLAI0anpwnOBaKq9Gbb5scMjh2/FiMPZ?=
 =?us-ascii?Q?Cd1qdvmChQZawp610natTmTA4LdIYDUYQaDi9BI1xzM/QI9zTGd8d9pT/Kia?=
 =?us-ascii?Q?HRsV0jNxbYsD58xleCBNILBscx5yIWULGvXPzYgqewO/HGt1fflY+yy7qyf4?=
 =?us-ascii?Q?0V/UnYykLVXxuyLemgDWy7QenuhliJkTgpBzU0bmZ5WIGU30PIA+jz27ClS0?=
 =?us-ascii?Q?2DBaCMruklfLmY0D8KDJtKS/e5bsH6Di7ri0Z0RlYLIlGGxCQZsZAx3dN72I?=
 =?us-ascii?Q?hHlf8wbCBBzM/l0CyUxmBqyYIMs/r/1aSXlvjCAdZ7Ev5ojHDriE6zuyNH/X?=
 =?us-ascii?Q?aPwW+5NaeVot81cX6efX81PkaIlVZ8qC6x8kNueF4ypOPF/MbVkby4QvGTDW?=
 =?us-ascii?Q?3jq8xwwJ0kMsINVk/mgCPwJU5a1/dykYn6xffFcfqKuhWzu/g8gjQUD9pED1?=
 =?us-ascii?Q?iRkVw6yF78cJDdc/OvueN9XCiedt2CvnlD/n4B0Xygi2oX/edj2gHZ7xRkjX?=
 =?us-ascii?Q?QF+Kgyao4DJ0Ub3EHUxl8zLKQXbenSs5uBYMjIDRmvabKvh91lgZxD2hQv2c?=
 =?us-ascii?Q?zMNnvof4SPVedIavKF/0hr9jTjG0GRGmarpOl9zE6PXJgFdlNBW5sRgHDjlq?=
 =?us-ascii?Q?6IJie7KuUJVg60ekCXJD0b58ONGdRDadyfuJOWQxbZ8IY21f57tiKWWYUz10?=
 =?us-ascii?Q?B20x8ngyaW98k0CNXyGv+0I7tM4PLll4pnarTuhphhs7ZaKbFwua/7Owa0Qy?=
 =?us-ascii?Q?3BLTGc2B6Fm6oh7XEvEMJ9rsIFnKimrJhnlTsydnTIbo/TcdXoRaV96C6IJM?=
 =?us-ascii?Q?siRxt0LetEtKd1Idy21VWQop5/j/Fa2D+RZe8KtaJNw1xUvXo1BayU0Mq4R9?=
 =?us-ascii?Q?jE2cCqLN9jO2IHSimvUWS811433NIjjOuWJRFv0fOZdZocodAO/CbirfC3G0?=
 =?us-ascii?Q?nknJXw79CvGcHvd46D7Nu+9yPmg3aSrfPZPtAyZuRoYexHfvixbv7KHjqlta?=
 =?us-ascii?Q?FCsMnOpax3gatxxTF+i/tbcWnwcw2G7Y+qyE0nUA6gupTV27fuMYFf2qEoRU?=
 =?us-ascii?Q?G3HDmdUg3AxHCRHtKwTm6EWlOOx6u1vP60QQ+qXuCeQm6pfePjPlMZ+0Iat6?=
 =?us-ascii?Q?zQX4o3Zj0MuyzIfBHD88QJu0ggaW1TeTT/XLB65q/18wDPmU5/MnSvzUEu9s?=
 =?us-ascii?Q?NWRGpUVzAetuXWBqW61TPSovEq0XkpN9QZ7AcQEamL72jg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OS41FC26fwyNUYP8mYGH0Gy/x6SjBbhu6/CmPeuhrOndSCadLVvgtGoHF0em?=
 =?us-ascii?Q?pqARR8L5r8YJw0m6HR20vxEACjNiGp8e4OyocwEqXaHeRMlqiX4Imhyr+TCN?=
 =?us-ascii?Q?/Hh1lKPY7ro7NfyRdguSIzXH9CCtn+Buxpk3puIJmgxkk67pxBCceyBYUbcf?=
 =?us-ascii?Q?zGi8EzkizCBk3DbsNYJEC/ba5S3qVcdQCcLNcBM+LWTyyfERmye38KioHYEh?=
 =?us-ascii?Q?yQNLsbMSymMMKMDCsA1snDPtqSoLRGw13TIWQZFAObvCBaIDgJkZnNXuEjuS?=
 =?us-ascii?Q?nQfzEDC9QjmGgQwXBltOPnCOY3cmZe3U5cpgCS6KjlXwRLfHFyb/FBDaCp0e?=
 =?us-ascii?Q?sFko8PhE5kvhimH342bgKNlXb5hLwcEgK9+TsUrbmhqIM3/eKU9gDB4w2Mkt?=
 =?us-ascii?Q?Y7gdvtdajZn6SdsHXB2QuqppRfnhx3y9+r3fWWVeCCljuv5UTCOEJ5KxNmZX?=
 =?us-ascii?Q?Jux8Qlh5cTdPBELraQwOGVBbQUx6ueXiEf/30iqXZ2yzDdjSI9mzeJn+tsUs?=
 =?us-ascii?Q?7bjyNsPIdcikvGOBlhELQMvIGnodQd2Pl9fI+p7gRJXLde9Kc/9QvqOFZznH?=
 =?us-ascii?Q?IzHK4GUjS7CEAN/3KX7STtuDF/KrL7R8xGRKqrIJHt9NJgdl9F58pkpP3f5Z?=
 =?us-ascii?Q?ZJl1WCjRRF9KpKQbuYWVTX8PzBb77yKj9qWEGeFU+bCJz+x3hJUWkTGzvHAq?=
 =?us-ascii?Q?zJbijVXHJoQK8BMwoAr/0EyrjDMwCvcQESQp0x71j151/rDX/7x2ZXioSbzf?=
 =?us-ascii?Q?YyYZ+4Dp6qEltkACJaMv15drPEWsvRUfOlK6FuvromnmMR1+CMLf83EvQGF1?=
 =?us-ascii?Q?Ao4Xf8TY1WEOIDBBkpHuIwn6oPnYwzaXVIBuCpP7DQleGLPlz8DvX7UuWn9e?=
 =?us-ascii?Q?FP8fuv3SuU1jEEcOO3mW1pxO26cgee0PREv/Ih9AD1W12tY/Jr9c7G2pmKSm?=
 =?us-ascii?Q?KMfWa0SlvC90/v0m5jpcyiA9A5Bo4D1RJt2pF7J2B04ujnvm7gvJ+CBbfOgl?=
 =?us-ascii?Q?wNnSdKqCYtkokWKZcFEEc+E93L5xLkrtYv1g5sGeDm6IA7RNA/Pbw9g9ApsH?=
 =?us-ascii?Q?TRq1mcBfUb2VRLfBvD+p8XohMX6NIodnkVqpj8dOOT3CnVuTppC1KN6uls0I?=
 =?us-ascii?Q?inHWcniYY1Pqx7oWeHTFKjnUR0wrQ9noVJ3Mpc0ixpRw3q1WYUCfYyQ4CVc/?=
 =?us-ascii?Q?VxY7q/BUS3bqF//LeWGBzttMDNGuns2FfESdEZ+cqL7k5nLfSNm5apmbxcdw?=
 =?us-ascii?Q?Thhf5Iaui4kgpN8gewjkbCqChOXjuRrp4NTKNvHotDzgZpG9pfAGzmy1JptR?=
 =?us-ascii?Q?TIckXbxOTihvKPUPBPJAWPpvEivqGcXfQubyFn5pHZX8oBju1RMkrwha2hAY?=
 =?us-ascii?Q?NNP24t3DL/JLhCja1InsGWlPI8h0lKuD9YANx1YUKm3KfgE6bWVER03zSh84?=
 =?us-ascii?Q?RR1kSeqXK7G5TbQN9hGa3vH5nklFqtDsTa9nnBchGIHX3Hgb9jmMg7b9QUaT?=
 =?us-ascii?Q?GHy7W4DVKqHONe5btnmuR3HTvE7DnCAf8kpnv9FeY3vZMI1oiWcCaPrloXXG?=
 =?us-ascii?Q?39+0nD5Dbxvwy5H+pD6uXDhjWavdcrPpp2OM+n9X8Off62LFwlpPuAeyKvh2?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab32406-19c1-4acc-1208-08dca1ccad15
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 17:12:43.0811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xbAk3Pkjb9Rc7d5mhIvNEcoPA2J6tXG0i/nQRULNtc5KtvdJuPgFJubN2SD0joZzwQdV0CBzlYOV0RlmNb9gjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7202
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
index 5b51753fe1ba..928c01f9e212 100644
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
index 41e46a00c01e..a478e6e1b20e 100644
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
2.45.2

