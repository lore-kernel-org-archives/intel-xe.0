Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB69C531DC
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 19:39:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 189FF10E6AC;
	Wed, 21 Aug 2024 19:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dFWM0bC/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD39E10E6AE
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Aug 2024 19:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724269144; x=1755805144;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=VzSiYljYX8AgmHFI5CtXv7iZUSwOmiaQTnAkCiaKuv0=;
 b=dFWM0bC/pYxAMc+U6BHZpvw8gcanObjc8raJyS1+qjA+an6ldMEU5IN4
 YNlzdf6PH4H+MjJjZGymK5HrOxax2PJn2FKLncg/b1ekdnMzqhzqpW+Nz
 4FAd/AU/lfreMpTQ+jb8BmYO/qc3COIlBzroX85FAMeGdNZToOplf1CMi
 rpDlyOHRVbU80pOZc5yCrLywDw8+LikM+TmAk0wuxnDnxVmEuqYQEztPe
 lJj0LQ/Efymx+KqRMjwxMRfchKOLBEj7Hz3u/lwDCN1xWgRF7hWFPynE2
 uKjS7QU24rQMWDbex7zJpRP71qEA++th5h/lTmC9+LYg/T+IZKrinvCq6 Q==;
X-CSE-ConnectionGUID: xm4PONKuTq2pxNT98FxCAw==
X-CSE-MsgGUID: gvT1d07FRXa2njQBduBovQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22805286"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="22805286"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 12:39:04 -0700
X-CSE-ConnectionGUID: ckGwfHvSSMGTA1gIEPcs9A==
X-CSE-MsgGUID: 8BxOdAgyR/iQgEn0lEZNbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="60907580"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Aug 2024 12:39:01 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 12:39:00 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 12:38:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 12:38:59 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 12:38:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KpWBkwsqINWrfkdUgFIPVJzYturbSjyUSFcwhMisuAYtx++pOQ+qq+lRtPugEyVcgZsNTHcj/L+NlluGQTdqoLdQCMrxIsO/kuvGSLSRQnqAA+HnJL4/qo8BQ3B4MGd6Qz5l+LCnrc/6CkqFC1vRGDU+MB5fjPdxXc2KhW9NoSGvU408av7UfFJHZjfV1rajsVMXYrJP/8Gw+vDaGv6pfUsIUWNrVVbmv57Ed92KVaVI2AnJ+DieFEr6ATVyUHixcJwGLQP15yxn56eoSvpJxESIRfndxgf7kPr09J8F+tFk91YgXDYxcUymocrdQPCOV2CMQljCqlqkJZg6TsPvBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVJCjNogDncuDE4OuwLFEzLj8N0KMbBT5xInlRdCffo=;
 b=kvYmfFik4DJjCUORQcDT36YE9qLWxaRqmBpaKeiSdmhLPb6YuYaAPNSv/OtGaI6zKwRfBGANdQscbgrkJ0PpbAlWmISheCTHAsQHs+jMcJxI4j2beBnpnDl7vCJiSbiNrY10VKN78BZz5w+VpHUiMj/A1RRW9YDjPkoDx5Vke1nysdmu1PH2QwaZuLYbF+NxQjPKxcwj1DbxiKxey3MndmWBPXYpNEh1ALT0tDFdIGTVpCbSdn4my4/yRH1MKY7P6GgwhsRtdtk0kj4uaYw0qaU9MtELBjybsd8f6ygnuIbjIUdgglrxBoDeNM1cxszoomXUijy8aCHeA+SbX1xgOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CO1PR11MB5041.namprd11.prod.outlook.com (2603:10b6:303:90::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Wed, 21 Aug
 2024 19:38:53 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 19:38:53 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew
 Brost <matthew.brost@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 04/12] drm/{i915,
 xe}: Avoid direct inspection of dpt_vma from outside dpt
Date: Wed, 21 Aug 2024 15:38:34 -0400
Message-ID: <20240821193842.352557-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240821193842.352557-1-rodrigo.vivi@intel.com>
References: <20240821193842.352557-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0025.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::38) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CO1PR11MB5041:EE_
X-MS-Office365-Filtering-Correlation-Id: cac776b5-d806-40ce-e808-08dcc218e338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?w4EVIgPHGu1RaclGuiHX/mYA06vhZeS15vMiv7rcGS5crs366/wYlGc21wQQ?=
 =?us-ascii?Q?t/5QiNRDBHkRMMn97CG5goyAkgKz0KY4ppuGwRUpsYb12Gf4lJboQcWGPj83?=
 =?us-ascii?Q?rGozSLRo3dIhxzGORUgk2LaxHPG3rdZTw/Mv5JbtUS3XWk/NwPyD0Xp82A5E?=
 =?us-ascii?Q?3VU6iLa1uxKvuQi+o0LR1708fEhP75UcfpDBAWXbTSqflQTIXc8C61+oB8Kk?=
 =?us-ascii?Q?M1mlCN2+BtbWn4pcJYOqVLkV1hPYh4HZBUMhuiH/TvoqRKBoHindcQgPJTTF?=
 =?us-ascii?Q?qusds/+aeB2sckIkl2Lw7Vo1elXkIJiUjSgPDVFfW4zPD7lpnl7FT9b01BeC?=
 =?us-ascii?Q?QmE2+ZCs6BqUdpxprryi3OHBQje+QcZrvLpya/rVnevRP/0Xtvs9m922QNP7?=
 =?us-ascii?Q?sMoDuVGqK1iW8eT7Zu4cRKo/q64FZcwvSa/lN9/t1NfAAWMd3jYTCC5ICK6y?=
 =?us-ascii?Q?r8RC4tRxkG0VoARyYgnel2caQ1l9k0AJ6Fr4oXwbqm0WXIHPxaz4Yx+GzlQh?=
 =?us-ascii?Q?kETHIRSsc8/EUWRta1+QlfTbzHVqLgEJ8EU858EfBJ9H/nMC1H5ccW5ryeBn?=
 =?us-ascii?Q?BQAJaqZEp/PfK6Eg8my9ZRKq1KBhaIIKETNDiF7VVeU7WRePkv+AaSy/mteW?=
 =?us-ascii?Q?i6ti4pVoSlsV7R9Xy3Vjf1mL+x2UILF3t0KW7ZGs6Actjkoa/+4GiqHhQGUm?=
 =?us-ascii?Q?G1iDRxqN7AKh32Tp186Kx5kGCSFv65g6eb+CfvjpUD1GDrZxAXDG395m7XRh?=
 =?us-ascii?Q?7bDQ5I4XjVJveiDNQByES5Q8yfxMZZ6Y1t0wRA2DHed9/Y8IPasnSFvIU/Vu?=
 =?us-ascii?Q?DYM6OkohZTC9U6dZdgSymoHTC1eib6L3CvZuXhLsQDCohxhZ3yMA33xczRll?=
 =?us-ascii?Q?lcu03CIsJMkx5o9/Fo+KnF8nWotMbHe+/acPh6bakn6WqvY5ZGHJYd5peIPK?=
 =?us-ascii?Q?fKvWrdpcdvncGTE+lIRrYv+ulCYNFN8QZzNev8WvPBrCvY60Dl34twsOLs0a?=
 =?us-ascii?Q?2Secw1TVo0ghvtJE0ahLKancAefI+5NIlW6/nbUJNNQgWTqUO3b/A/e8LdEg?=
 =?us-ascii?Q?Do4F8wBrj46l3lo6fdiA3MRSs8iqvRulnEdpKIr8Qb4czI9adWGnVxnOEe8G?=
 =?us-ascii?Q?xw3I1opjvTKbWMWTMs4g3a9lZyMw88SmkRzk74osds1vp3mzfabJA/d8F5A3?=
 =?us-ascii?Q?bR7df88ZIJ6LQDpzuGpdCRUWEQI7/621Ya8qq317kBT88k4i/btoMLgLWzhf?=
 =?us-ascii?Q?F5Nm/VE7/GXMKj/cEud6xEzMm5qLa3upB6/IUoJR142TxjLnow2uABDojhfZ?=
 =?us-ascii?Q?lYQSdFbIqZ/cRp19ym2/+wiM0aLNYWm/MO27Pi21hoxzzg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nIGe16/XA/5y9yggzw7H9ur8OXtOWn/hWEMIzieSXpuvv9WZNxfWADdp3qza?=
 =?us-ascii?Q?M4WcQEai3wC8/scEQCu0g3a5l/PIh2UU2whHranbLeWBRDMzvjMrylhgvyJ8?=
 =?us-ascii?Q?lFGOTr6HDbXJ743/2y8Zc+t3UXITAg14KKFxxFY4phGIQdQsOjoT9SGre718?=
 =?us-ascii?Q?3LgQrnAhCZy8CBlHA98DcvgpFPit6qUMoQ6Jl+8VMSJwM63fQZpt+WcDitrI?=
 =?us-ascii?Q?buCzV6MUDdOOvNmWcEqzr8MIuiEIhFVJYGYgKJLorLjbms/FQhv5uA3XTl8H?=
 =?us-ascii?Q?cj1s/mRhFp7Bt8RkOO/aY0BjObWp9iT2OYTFIKIMFBha5l9cK0wG1AyhnG2q?=
 =?us-ascii?Q?+iANu2aEkCytqdjuLX5PcE3kMzpP0YYbJ9GuBLkV9M832ZhACfHh/lJ7p0u/?=
 =?us-ascii?Q?uiYZ+QpW6Sp8gJ/Wlm9DWBeM5N6/a1LG4aO6tEn2bAsFWby+b4xgNVdogv7V?=
 =?us-ascii?Q?c4XrWJYX4vB8jefgCZbIU0Bd/bHIDx77+xGWs2NrexCACb6p97FGyWTNVA3T?=
 =?us-ascii?Q?RrAv+wW22IA2DZdp5Y0rXFxD3QF+3vP2sRf+s0jrxgusVNMY3yd3hLnmxZlz?=
 =?us-ascii?Q?h58DilcPNYcJJun8KYixlF5NILowkKng9JE4H6zu0Ega2dPbC2211SO5u4fZ?=
 =?us-ascii?Q?E4U2b1RHNYtxLzoVO78sZ3duJeMCz9pP38mAgmOn6YLidGDVx7Idccalrf1V?=
 =?us-ascii?Q?pD5Q1RZjfpKk6PJ0N4xLM6E9BOe8vRhSlBMROfVx9xrNKn+WTanATVC6RjDi?=
 =?us-ascii?Q?2oHa6EsEobqyPOSRLVFEj0zdLe3ENa9tla3aMTXrwfNJlnZoSawsAScfg5IQ?=
 =?us-ascii?Q?r7r9A0N8PjKCPid+RXJVUbP65VVZ6jFWbpoYcS84Wl3wD2I9SlVvOlYnn5ai?=
 =?us-ascii?Q?nhBh+x5j7SpbnrXAwnetXhjT4eaLxeg7yQtwK7LMrGlPkFK0zf2OiguHNWL2?=
 =?us-ascii?Q?LNzpfpbRaw2ktkyoiyOWoPSzsoc/XDAjQJb3LIbaRWTcAn66N4KTBccLwQ3N?=
 =?us-ascii?Q?52Kf0Th3AxaOLOCu7DS6cgu2B2GbUUBxmF6Ur7DVcfbz1GDmUSTRuugnu4IQ?=
 =?us-ascii?Q?qtGeKc1u7+kcGZrFI3Yv6+7h1QT5fQXIMpR3u9J4+XKhueG3/gLoOMRE6mch?=
 =?us-ascii?Q?NgiF/BZYDr0h1bmALaPH2N57zkzyIS8NQEgESgAUXH3rFZEE0bXTg3EfNTV7?=
 =?us-ascii?Q?sbs2Iw3zhYWl0K/t7+5GvHyHX855soZP/ySbn0lhSu3DcTgBF+chWkkBkQRF?=
 =?us-ascii?Q?Zxuji4RV0JnG4ui4RO6de/YM1PSh7rXgve9Df1U1AoIUbycg16zG5wr5UcXF?=
 =?us-ascii?Q?O+IjIxQ7Q6Pbp3dLmqQDRxSWOGgwMzNxBjqWzb+69I4166QkhQnajb4BveJP?=
 =?us-ascii?Q?maD+2KgHaEV+I4AnIwi0CneW78F1my5NXU3QKgHyqB7eeBdW4JQRBuz8iu7m?=
 =?us-ascii?Q?EASP2CSQybHHmQkh2m/LkVCno3eOXy3hHDHqMKT4SM2gHjS/URN7pav7P12C?=
 =?us-ascii?Q?LlpkvuF1dmplxg0XZ2ME9iTK59SdbSzkcgs7F93Fxs3qkCQ9nCOYq7xkpROM?=
 =?us-ascii?Q?jUjPYG7Kwi6c0C35egw6xsvoMt69pkZPwdx/O/iqZgM8SPaXeMEMgHubssJ8?=
 =?us-ascii?Q?/w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cac776b5-d806-40ce-e808-08dcc218e338
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 19:38:52.9509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kc7QhKOymJ+pgEPZW+GpPX9l391OLSYgopv6buvA37wUlKCG+2mcjF7Svz9YPq/QfFcs0dcuuwLNcigbzK1kVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5041
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

DPT code is so dependent on i915 vma implementation and it is not
ported yet to Xe.

This patch limits inspection to DPT's VMA struct to intel_dpt
component only, so the Xe GGTT code can evolve.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpt.c           | 4 ++++
 drivers/gpu/drm/i915/display/intel_dpt.h           | 3 +++
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 3 ++-
 drivers/gpu/drm/xe/display/xe_fb_pin.c             | 9 +++++++--
 4 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
index 73a1918e2537..3a6d99044828 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt.c
+++ b/drivers/gpu/drm/i915/display/intel_dpt.c
@@ -317,3 +317,7 @@ void intel_dpt_destroy(struct i915_address_space *vm)
 	i915_vm_put(&dpt->vm);
 }
 
+u64 intel_dpt_offset(struct i915_vma *dpt_vma)
+{
+	return dpt_vma->node.start;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_dpt.h b/drivers/gpu/drm/i915/display/intel_dpt.h
index ff18a525bfbe..1f88b0ee17e7 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt.h
+++ b/drivers/gpu/drm/i915/display/intel_dpt.h
@@ -6,6 +6,8 @@
 #ifndef __INTEL_DPT_H__
 #define __INTEL_DPT_H__
 
+#include <linux/types.h>
+
 struct drm_i915_private;
 
 struct i915_address_space;
@@ -20,5 +22,6 @@ void intel_dpt_suspend(struct drm_i915_private *i915);
 void intel_dpt_resume(struct drm_i915_private *i915);
 struct i915_address_space *
 intel_dpt_create(struct intel_framebuffer *fb);
+u64 intel_dpt_offset(struct i915_vma *dpt_vma);
 
 #endif /* __INTEL_DPT_H__ */
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index ba5a628b4757..1cf1d5c8b9dc 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -14,6 +14,7 @@
 #include "intel_de.h"
 #include "intel_display_irq.h"
 #include "intel_display_types.h"
+#include "intel_dpt.h"
 #include "intel_fb.h"
 #include "intel_fbc.h"
 #include "intel_frontbuffer.h"
@@ -1162,7 +1163,7 @@ static u32 skl_surf_address(const struct intel_plane_state *plane_state,
 		 * within the DPT is always 0.
 		 */
 		drm_WARN_ON(&i915->drm, plane_state->dpt_vma &&
-			    plane_state->dpt_vma->node.start);
+			    intel_dpt_offset(plane_state->dpt_vma));
 		drm_WARN_ON(&i915->drm, offset & 0x1fffff);
 		return offset >> 9;
 	} else {
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index d7db44e79eaf..42d431ff14e7 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -377,8 +377,8 @@ void intel_plane_unpin_fb(struct intel_plane_state *old_plane_state)
 }
 
 /*
- * For Xe introduce dummy intel_dpt_create which just return NULL and
- * intel_dpt_destroy which does nothing.
+ * For Xe introduce dummy intel_dpt_create which just return NULL,
+ * intel_dpt_destroy which does nothing, and fake intel_dpt_ofsset returning 0;
  */
 struct i915_address_space *intel_dpt_create(struct intel_framebuffer *fb)
 {
@@ -389,3 +389,8 @@ void intel_dpt_destroy(struct i915_address_space *vm)
 {
 	return;
 }
+
+u64 intel_dpt_offset(struct i915_vma *dpt_vma)
+{
+	return 0;
+}
-- 
2.46.0

