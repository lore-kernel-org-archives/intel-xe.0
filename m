Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6DBC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 22:18:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E771F10EC69;
	Tue, 23 Apr 2024 22:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z8pvDPe0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7674A10F7BB
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 22:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713910712; x=1745446712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=suWrvPa07F7WYUYn0jSoP54rp48M2+stN0rNhev5EH4=;
 b=Z8pvDPe04sU2Q1doT8bo+/1a4sLB0Tvdn8wOWx8M0rXVxcXj1LszeU2k
 bh43MvNkkcp7rKFY8nqUEAbo4Mo6Yr/Qro47HUZsXkXV5oNNd0Rbk97PU
 1X5dah+M43jEw91DGn2+Ua1vmYdA3q1Eph7aWM3vnxHlrVelhjqPNP44m
 liPqK2cTsQdufyYg+H9l3jyykGNLfxEHQHpXHVfWjBitoiOIIVyUcMtMx
 +26q3S9DWex27lQGW1LrHYfkK8Zlm5kdxRd1d+h7nSQoP3EvHSlECKolb
 4qbrPwY0DV1rfB7UV6H/OqD/0w02AtCvJDSP0RG6X+9S69KM/A6wTqLzV w==;
X-CSE-ConnectionGUID: 10TVblvVR1WASy6CDXeB+A==
X-CSE-MsgGUID: 6W72L3bGQT6KzrjFHB/6Nw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="10059503"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="10059503"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 15:18:31 -0700
X-CSE-ConnectionGUID: dML1ihH+R22LVSXjajI+aQ==
X-CSE-MsgGUID: 9A7OPLeZQ/yczQD0Uophpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="25020649"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 15:18:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 15:18:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 15:18:30 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 15:18:30 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 15:18:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zw9lgoaRN0MBqiZv1mvJsJnHIhKS3GIrpIr074s5ABBnzjk2KaznaBp7kLC/lqNIQcyqQztPYcwBE+bHn/rlaFNvvgJGi983Y31qwdlsjRvR9fKbGMw5kK1LpNyy4isE6PwUd2hooeFm2Ob2LQ+aGQoVFh4ys8deT9DqiAqFWqyPIdvFexkv3fIn23+8/hJ5YLYFePnbeOHb5HkbiqjQDQXaZkCRjnen6Yq6mMCvr/sRxXc1K1L19szw+UuBdO6A9kTIoOKbAhE4YisGgnQeEHOFK9fU5tonUi8O5UbPwDSw5QMX7saJDrduFmbh+YUsiowrB31x3QEKdmvWrgmbug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HrdftD8iyoOTCAEf5yvGAaCBuiXyJiPFyzxXnSDAuAc=;
 b=dDVsNKCZqnO0+yKPqQEBT21UoI6rRfQmdr2FHT8WA3h0B7hrWQlQlQMdoWS5/Lb8d+CaVYA167gSs2tMJvuGxRAVYFLC5D9Td22N/tiTCfzGwyzNz7tqaehUeWFmFEYREDQf3AQHTAvanNJpQcTYVcYba0xfX0ALLagdGFsMIlrD/qN6bj7x7bbZljTlfonoq3QkDUWX/NZcym+oIR5VXyPT66Ukxnbk11Oam3IkcyNCrZx2gP3zhda+W0WUrS/8rmXiGLE3mkb38Il7I7cVKsVFLTxCKToLaNFVoyAZDjdP70OAIKfWeRUDFm+WtLqUh+xh0rklFMvZoffedrxsjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB5080.namprd11.prod.outlook.com (2603:10b6:510:3f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Tue, 23 Apr
 2024 22:18:28 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.018; Tue, 23 Apr 2024
 22:18:28 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Dafna Hirschfeld <dhirschfeld@habana.ai>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, Alan Previn
 <alan.previn.teres.alexis@intel.com>, Himanshu Somaiya
 <himanshu.somaiya@intel.com>
Subject: [PATCH 3/4] drm/xe: Force wedged state and block GT reset upon any
 GPU hang
Date: Tue, 23 Apr 2024 18:18:16 -0400
Message-ID: <20240423221817.1285081-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240423221817.1285081-1-rodrigo.vivi@intel.com>
References: <20240423221817.1285081-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0051.namprd11.prod.outlook.com
 (2603:10b6:a03:80::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB5080:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cbe9b5e-f808-44d6-ff1d-08dc63e34cd5
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?u8ZrXLK5axO1QtPIkEVaoOOjZ/A/oOIva8axp1YIMhzztdh10zBp4wX7vCQr?=
 =?us-ascii?Q?56UblEflXuy6ncsOtnb3elN9QK6Yyf3hWRGvjKBj0tyvYyJFu7U3Ib2vaDJ7?=
 =?us-ascii?Q?knqRl0KRw48sLJjElHCeT0HC0a3BBLD/srI7Vonc9PQcDfDu5zCY6h3jas0t?=
 =?us-ascii?Q?evhQpalw5eOVIyPMTXiKsM22iJRHM9D5Hr6bqd/W1mPm9YtO34E/AhDWqwFz?=
 =?us-ascii?Q?Eq80JgEo/KsYJal4vnhGFOk+/Aj7BABO+Ob8xIkMpwUFiTEv0BiX6JX81EUp?=
 =?us-ascii?Q?6odj5086yECoUg7XKDAzT5Ej99ZO/w1+iL4oJKvOwD+XYQVr6RZZf4dH+169?=
 =?us-ascii?Q?2JASlP1cqU+qC3DqzuezNkx/US5s7eE/XlQBxmTvD534XAG/jQ/jVEYo0M89?=
 =?us-ascii?Q?lylHizA7JVeJi5cax/Qy2R8dtyHW1j0oXThtD0y0d5kQRvCn5ucRRPS4+HKG?=
 =?us-ascii?Q?yf/4/duYfp9JH0YreIufez6vq9B8NDNJCInG9U3fqZx2WKd4Sg5v+oQ9bogb?=
 =?us-ascii?Q?chP/kfHDCfqPw3D+mgSZbWENqvsw5yq8FXEAHQ4rLmROsHPEFnHUvAbq1hpX?=
 =?us-ascii?Q?DIIwtv42bu3acsKnqNhoHaOQJu0TUDYW9Pnej6o41nQdJ9qrusChpfFGLPXS?=
 =?us-ascii?Q?aHj7L4IfOG2nTvOOS4Ki20tu+6TK093s3EboNc5lZv1mA/i5uBJJW9LxPag2?=
 =?us-ascii?Q?5PDifaFVJKWtbES9ycwI6z/eStxZ1CiwGxhwPgJSgBq/BKfUiwo9XHznVS50?=
 =?us-ascii?Q?s190IXJ0smaxMWe7uzuYCEoRht9sq8EOpis8eBfdpZnBvHo1fsBw7CSRO0dn?=
 =?us-ascii?Q?4J7HBVnXMab9ss+JyY4gCarouFIDKPYUXLXBf251G/kfP+6uE/4p3yanWvJD?=
 =?us-ascii?Q?PaKDqQ/+qE6bcorNFlwxCQpegulLyBtpLlyfru1C4VzJHk2dIaqe1lDNpVhw?=
 =?us-ascii?Q?Qv54NCl01HKAvAEv7cq0nxMfJpMIabS9gzm4B3t0exXICBgmpI3q6xuet3uT?=
 =?us-ascii?Q?lA4u6SQmcnFylk02t7lVQG3xVZsMCZ6jxH2rJqSukoSpVshFlMBXWiCBF3W9?=
 =?us-ascii?Q?XIUfS1xKciCa7jfRmTNhJjCdzOpdqftKcOd99vXqyX+RjRVN41IdvnGRL0Tp?=
 =?us-ascii?Q?H6d0iMB/C9L+Z7L1fZSAo8tx6Tz3FLdGlgTGtyVVtv1qlg3oQnYNE28HpUbT?=
 =?us-ascii?Q?KaOuQZigAXCHx8v21g5ZtfApJ3mN6JsorRTqPQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HyfkUZBSklRrMBYvcaMCJvUH0AynzyBIECQctSM+D/8ZyzZx329orgpHWge1?=
 =?us-ascii?Q?+rSujZMi9ENLFrHQhaOLJ4T1TLFyOjMP5CicnUva0Kn4O9YgcCtV8XtN0i4n?=
 =?us-ascii?Q?4EJwAs/abvyJeXqaTB8uxjT5d3TijFbx7cBXIsY1Sy0l6WDRjyx70vWbqNWl?=
 =?us-ascii?Q?f1gVa9a/xN4wCz8XJ/GYrRJgj8We4rjcThO0XCgw7TDnTvma2hV28vXewlJ8?=
 =?us-ascii?Q?gv83VKVfF3195ScIIljRo9cKsKqqfp04Y5WO5jVKeqRa8lRMSkCXJOWXFdgA?=
 =?us-ascii?Q?vm88WRj2CM4l0Q6uxCVfXRPiVRjWPk6xP9xIytjPEJIbtUtGFkR9NX1xEyGA?=
 =?us-ascii?Q?Wy/YYSkVkA99Gbn7SteCw8bhtP7B/6lJUVkinbEKXu8hEGvV5xzsdaG2pBr3?=
 =?us-ascii?Q?D8iBFeUp9uOwOFXJRS1jgAw1/clVPqm6SQ7CQj3lcLUAuqBMfpHDdZQUtwTw?=
 =?us-ascii?Q?wo83K/q97YxDT5LI5j7ZdP2tF9MC7VgvAs5IvNCvYIREbzHVr7Vt9DjmSwni?=
 =?us-ascii?Q?oQyppZTrd1hVdl0rNHbBr1JpKjPviHcdbY98BX2QOQLx333lPO92Ko0xSOBz?=
 =?us-ascii?Q?wCYUYgX8AjrL61MzIYsL9rVaAOA6BLozESdTvr/bkhaQ8KlCma9+7snJnMN7?=
 =?us-ascii?Q?xy/6PBZeBbP30A9k1xd2wAN50vldD7dasrA8VqbXMOJHxVjbYTnzNfg9X1uG?=
 =?us-ascii?Q?gLG54Ck4hRbfays2IDQ1Y8onHkZa3ryNTXoL4bw/kTE0vsQoMaHFExblFup4?=
 =?us-ascii?Q?GXQpVCZhcZXsz1GHwPLq/+AnveUZt6A7AvA5dwjoS2LDE64gb6Nb1hshq0Bn?=
 =?us-ascii?Q?Bp1eOn+kjYcx8owWermHolwyMTA2w3UqkE/FPlxFsUSgEMOR/XpHp7kEtsOp?=
 =?us-ascii?Q?+jVDA5/DF2RH3dNQ14bH2+nmf8xr+jeTFzMcyxoJqM+zlMdCUfyxfuYfvvud?=
 =?us-ascii?Q?jXonlrKJLaSbgjYdGsWYb+pazPg4NxVHsvNRmGUiK9DhWyAE9klwDoVdrR9e?=
 =?us-ascii?Q?yJR3MicJXHUu2OMDw7U8Z9Y6yMViiZa18CS3VZxX2biaQaHGL70mZGQ1Gjll?=
 =?us-ascii?Q?NFhBUziqubEKsNFwwTtlKUSBrogxoheNCnpiYS3wNoWzgW9gqT9TmPLjNEcq?=
 =?us-ascii?Q?p3JysUTawL7I31K0k4KUzJsReuy6IpXeWh7zqg03pRo+3pHgSSHuYw3BDwzr?=
 =?us-ascii?Q?No/OnFSJxnIrLT3fJnGmRm+jvjzm+PrXY2Q9GUmScR+whR5/k6kgbMJl4nRP?=
 =?us-ascii?Q?Y3ss+pQR9oe/nGl3N0WdwQODNG2O1aFvWtsraLd55WJN8j5B3YUx78ByS81O?=
 =?us-ascii?Q?UNYvF/C3ZOkR/U+qzxnXFIf/xvqbnId70l5ELh2ctAt6uIHrZU/mOwn8g5JK?=
 =?us-ascii?Q?wRjF5Dgc7H8o7fG6YVeBbLqQfGFDuG4kkNTTDbqn2Efqt3B+giAiaobIOoWv?=
 =?us-ascii?Q?0MUMehAXh+NPe5xNsCg5vquXRDfBi1mzuY1IvkIuLWS15liK4gOZ72O0vIdb?=
 =?us-ascii?Q?L4m6mNZfaBEaISm4Ky1pMKmjWNc2VxHJ6uUoyY8g9yAQ+ZpnMw5xsLzPyM9G?=
 =?us-ascii?Q?TRG6vJgsiQDR7tSBP7413GRVyiRx0kyw0wNO0rNAuTf7Zrkj6Yh+/oRgW3aS?=
 =?us-ascii?Q?rQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cbe9b5e-f808-44d6-ff1d-08dc63e34cd5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 22:18:28.0596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ryzVTuYAUo7DWM0mxLNxBoWvgXTbqhctasy8MKPxMPf1PT0LqgZTTHQFp5wpoLQfXIvRwEP0zJTB4rL4/yUEHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5080
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

In many validation situations when debugging GPU Hangs,
it is useful to preserve the GT situation from the moment
that the timeout occurred.

This patch introduces a module parameter that could be used
on situations like this.

If xe.wedged module parameter is set to 2, Xe will be declared
wedged on every single execution timeout (a.k.a. GPU hang) right
after devcoredump snapshot capture and without attempting any
kind of GT reset and blocking entirely any kind of execution.

v2: Really block gt_reset from guc side. (Lucas)
    s/wedged/busted (Lucas)

v3: - s/busted/wedged
    - Really use global_flags (Dafna)
    - More robust timeout handling when wedging it.

v4: A really robust clean exit done by Matt Brost.
    No more kernel warns on unbind.

v5: Simplify error message (Lucas)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Himanshu Somaiya <himanshu.somaiya@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c              | 29 +++++++
 drivers/gpu/drm/xe/xe_device.h              | 15 +---
 drivers/gpu/drm/xe/xe_exec_queue.h          |  9 +++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  2 +-
 drivers/gpu/drm/xe/xe_guc_ads.c             |  9 ++-
 drivers/gpu/drm/xe/xe_guc_submit.c          | 90 +++++++++++++++++----
 drivers/gpu/drm/xe/xe_module.c              |  5 ++
 drivers/gpu/drm/xe/xe_module.h              |  1 +
 8 files changed, 129 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 76a7b37a4a53..d45db6ff1fa3 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -764,3 +764,32 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
 {
 	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
 }
+
+/**
+ * xe_device_declare_wedged - Declare device wedged
+ * @xe: xe device instance
+ *
+ * This is a final state that can only be cleared with a module
+ * re-probe (unbind + bind).
+ * In this state every IOCTL will be blocked so the GT cannot be used.
+ * In general it will be called upon any critical error such as gt reset
+ * failure or guc loading failure.
+ * If xe.wedged module parameter is set to 2, this function will be called
+ * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
+ * snapshot capture. In this mode, GT reset won't be attempted so the state of
+ * the issue is preserved for further debugging.
+ */
+void xe_device_declare_wedged(struct xe_device *xe)
+{
+	if (xe_modparam.wedged_mode == 0)
+		return;
+
+	if (!atomic_xchg(&xe->wedged, 1)) {
+		xe->needs_flr_on_fini = true;
+		drm_err(&xe->drm,
+			"CRITICAL: Xe has declared device %s as wedged.\n"
+			"IOCTLs and executions are blocked. Only a rebind may clear the failure\n"
+			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
+			dev_name(xe->drm.dev));
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index d2e4249d37ce..9ede45fc062a 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -172,19 +172,6 @@ static inline bool xe_device_wedged(struct xe_device *xe)
 	return atomic_read(&xe->wedged);
 }
 
-static inline void xe_device_declare_wedged(struct xe_device *xe)
-{
-	if (!atomic_xchg(&xe->wedged, 1)) {
-		xe->needs_flr_on_fini = true;
-		drm_err(&xe->drm,
-			"CRITICAL: Xe has declared device %s as wedged.\n"
-			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
-			"echo '%s' > /sys/bus/pci/drivers/xe/unbind\n"
-			"echo '%s' > /sys/bus/pci/drivers/xe/bind\n"
-			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
-			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
-			dev_name(xe->drm.dev));
-	}
-}
+void xe_device_declare_wedged(struct xe_device *xe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index 02ce8d204622..48f6da53a292 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -26,6 +26,15 @@ void xe_exec_queue_fini(struct xe_exec_queue *q);
 void xe_exec_queue_destroy(struct kref *ref);
 void xe_exec_queue_assign_name(struct xe_exec_queue *q, u32 instance);
 
+static inline struct xe_exec_queue *
+xe_exec_queue_get_unless_zero(struct xe_exec_queue *q)
+{
+	if (kref_get_unless_zero(&q->refcount))
+		return q;
+
+	return NULL;
+}
+
 struct xe_exec_queue *xe_exec_queue_lookup(struct xe_file *xef, u32 id);
 
 static inline struct xe_exec_queue *xe_exec_queue_get(struct xe_exec_queue *q)
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 93df2d7969b3..8e9c4b990fbb 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -245,7 +245,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
 			return seqno;
 
 		xe_gt_tlb_invalidation_wait(gt, seqno);
-	} else if (xe_device_uc_enabled(xe)) {
+	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
 		xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
 		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
 			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 1aafa486edec..db817a46f157 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -20,6 +20,7 @@
 #include "xe_lrc.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
+#include "xe_module.h"
 #include "xe_platform_types.h"
 #include "xe_wa.h"
 
@@ -440,11 +441,17 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
 
 static void guc_policies_init(struct xe_guc_ads *ads)
 {
+	u32 global_flags = 0;
+
 	ads_blob_write(ads, policies.dpc_promote_time,
 		       GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US);
 	ads_blob_write(ads, policies.max_num_work_items,
 		       GLOBAL_POLICY_MAX_NUM_WI);
-	ads_blob_write(ads, policies.global_flags, 0);
+
+	if (xe_modparam.wedged_mode == 2)
+		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
+
+	ads_blob_write(ads, policies.global_flags, global_flags);
 	ads_blob_write(ads, policies.is_valid, 1);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index c7d38469fb46..0bea17536659 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -35,6 +35,7 @@
 #include "xe_macros.h"
 #include "xe_map.h"
 #include "xe_mocs.h"
+#include "xe_module.h"
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
 #include "xe_trace.h"
@@ -59,6 +60,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
 #define ENGINE_STATE_SUSPENDED		(1 << 5)
 #define EXEC_QUEUE_STATE_RESET		(1 << 6)
 #define ENGINE_STATE_KILLED		(1 << 7)
+#define EXEC_QUEUE_STATE_WEDGED		(1 << 8)
 
 static bool exec_queue_registered(struct xe_exec_queue *q)
 {
@@ -175,9 +177,20 @@ static void set_exec_queue_killed(struct xe_exec_queue *q)
 	atomic_or(ENGINE_STATE_KILLED, &q->guc->state);
 }
 
-static bool exec_queue_killed_or_banned(struct xe_exec_queue *q)
+static bool exec_queue_wedged(struct xe_exec_queue *q)
 {
-	return exec_queue_killed(q) || exec_queue_banned(q);
+	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_WEDGED;
+}
+
+static void set_exec_queue_wedged(struct xe_exec_queue *q)
+{
+	atomic_or(EXEC_QUEUE_STATE_WEDGED, &q->guc->state);
+}
+
+static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
+{
+	return exec_queue_banned(q) || (atomic_read(&q->guc->state) &
+		(EXEC_QUEUE_STATE_WEDGED | ENGINE_STATE_KILLED));
 }
 
 #ifdef CONFIG_PROVE_LOCKING
@@ -240,6 +253,17 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
 	free_submit_wq(guc);
 }
 
+static void guc_submit_wedged_fini(struct drm_device *drm, void *arg)
+{
+	struct xe_guc *guc = arg;
+	struct xe_exec_queue *q;
+	unsigned long index;
+
+	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
+		if (exec_queue_wedged(q))
+			xe_exec_queue_put(q);
+}
+
 static const struct xe_exec_queue_ops guc_exec_queue_ops;
 
 static void primelockdep(struct xe_guc *guc)
@@ -708,7 +732,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 
 	trace_xe_sched_job_run(job);
 
-	if (!exec_queue_killed_or_banned(q) && !xe_sched_job_is_error(job)) {
+	if (!exec_queue_killed_or_banned_or_wedged(q) && !xe_sched_job_is_error(job)) {
 		if (!exec_queue_registered(q))
 			register_engine(q);
 		if (!lr)	/* LR jobs are emitted in the exec IOCTL */
@@ -844,6 +868,28 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
 		xe_sched_tdr_queue_imm(&q->guc->sched);
 }
 
+static void guc_submit_wedged(struct xe_guc *guc)
+{
+	struct xe_exec_queue *q;
+	unsigned long index;
+	int err;
+
+	xe_device_declare_wedged(guc_to_xe(guc));
+	xe_guc_submit_reset_prepare(guc);
+	xe_guc_ct_stop(&guc->ct);
+
+	err = drmm_add_action_or_reset(&guc_to_xe(guc)->drm,
+				       guc_submit_wedged_fini, guc);
+	if (err)
+		return;
+
+	mutex_lock(&guc->submission_state.lock);
+	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
+		if (xe_exec_queue_get_unless_zero(q))
+			set_exec_queue_wedged(q);
+	mutex_unlock(&guc->submission_state.lock);
+}
+
 static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 {
 	struct xe_guc_exec_queue *ge =
@@ -852,10 +898,16 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_gpu_scheduler *sched = &ge->sched;
+	bool wedged = xe_device_wedged(xe);
 
 	xe_assert(xe, xe_exec_queue_is_lr(q));
 	trace_xe_exec_queue_lr_cleanup(q);
 
+	if (!wedged && xe_modparam.wedged_mode == 2) {
+		guc_submit_wedged(exec_queue_to_guc(q));
+		wedged = true;
+	}
+
 	/* Kill the run_job / process_msg entry points */
 	xe_sched_submission_stop(sched);
 
@@ -870,7 +922,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 	 * xe_guc_deregister_done_handler() which treats it as an unexpected
 	 * state.
 	 */
-	if (exec_queue_registered(q) && !exec_queue_destroyed(q)) {
+	if (!wedged && exec_queue_registered(q) && !exec_queue_destroyed(q)) {
 		struct xe_guc *guc = exec_queue_to_guc(q);
 		int ret;
 
@@ -905,6 +957,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
 	int err = -ETIME;
 	int i = 0;
+	bool wedged = xe_device_wedged(xe);
 
 	/*
 	 * TDR has fired before free job worker. Common if exec queue
@@ -928,6 +981,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 
 	trace_xe_sched_job_timedout(job);
 
+	if (!wedged && xe_modparam.wedged_mode == 2) {
+		guc_submit_wedged(exec_queue_to_guc(q));
+		wedged = true;
+	}
+
 	/* Kill the run_job entry point */
 	xe_sched_submission_stop(sched);
 
@@ -935,8 +993,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * Kernel jobs should never fail, nor should VM jobs if they do
 	 * somethings has gone wrong and the GT needs a reset
 	 */
-	if (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
-	    (q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q))) {
+	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
+			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
 		if (!xe_sched_invalidate_job(job, 2)) {
 			xe_sched_add_pending_job(sched, job);
 			xe_sched_submission_start(sched);
@@ -946,7 +1004,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	}
 
 	/* Engine state now stable, disable scheduling if needed */
-	if (exec_queue_registered(q)) {
+	if (!wedged && exec_queue_registered(q)) {
 		struct xe_guc *guc = exec_queue_to_guc(q);
 		int ret;
 
@@ -989,6 +1047,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 */
 	xe_sched_add_pending_job(sched, job);
 	xe_sched_submission_start(sched);
+
 	xe_guc_exec_queue_trigger_cleanup(q);
 
 	/* Mark all outstanding jobs as bad, thus completing them */
@@ -1028,7 +1087,7 @@ static void guc_exec_queue_fini_async(struct xe_exec_queue *q)
 	INIT_WORK(&q->guc->fini_async, __guc_exec_queue_fini_async);
 
 	/* We must block on kernel engines so slabs are empty on driver unload */
-	if (q->flags & EXEC_QUEUE_FLAG_PERMANENT)
+	if (q->flags & EXEC_QUEUE_FLAG_PERMANENT || exec_queue_wedged(q))
 		__guc_exec_queue_fini_async(&q->guc->fini_async);
 	else
 		queue_work(system_wq, &q->guc->fini_async);
@@ -1063,7 +1122,7 @@ static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
 
 static bool guc_exec_queue_allowed_to_change_state(struct xe_exec_queue *q)
 {
-	return !exec_queue_killed_or_banned(q) && exec_queue_registered(q);
+	return !exec_queue_killed_or_banned_or_wedged(q) && exec_queue_registered(q);
 }
 
 static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *msg)
@@ -1274,7 +1333,7 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
 {
 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
 
-	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT))
+	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && !exec_queue_wedged(q))
 		guc_exec_queue_add_msg(q, msg, CLEANUP);
 	else
 		__guc_exec_queue_fini(exec_queue_to_guc(q), q);
@@ -1285,7 +1344,8 @@ static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
 {
 	struct xe_sched_msg *msg;
 
-	if (q->sched_props.priority == priority || exec_queue_killed_or_banned(q))
+	if (q->sched_props.priority == priority ||
+	    exec_queue_killed_or_banned_or_wedged(q))
 		return 0;
 
 	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
@@ -1303,7 +1363,7 @@ static int guc_exec_queue_set_timeslice(struct xe_exec_queue *q, u32 timeslice_u
 	struct xe_sched_msg *msg;
 
 	if (q->sched_props.timeslice_us == timeslice_us ||
-	    exec_queue_killed_or_banned(q))
+	    exec_queue_killed_or_banned_or_wedged(q))
 		return 0;
 
 	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
@@ -1322,7 +1382,7 @@ static int guc_exec_queue_set_preempt_timeout(struct xe_exec_queue *q,
 	struct xe_sched_msg *msg;
 
 	if (q->sched_props.preempt_timeout_us == preempt_timeout_us ||
-	    exec_queue_killed_or_banned(q))
+	    exec_queue_killed_or_banned_or_wedged(q))
 		return 0;
 
 	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
@@ -1339,7 +1399,7 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
 {
 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_SUSPEND;
 
-	if (exec_queue_killed_or_banned(q) || q->guc->suspend_pending)
+	if (exec_queue_killed_or_banned_or_wedged(q) || q->guc->suspend_pending)
 		return -EINVAL;
 
 	q->guc->suspend_pending = true;
@@ -1485,7 +1545,7 @@ static void guc_exec_queue_start(struct xe_exec_queue *q)
 {
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
 
-	if (!exec_queue_killed_or_banned(q)) {
+	if (!exec_queue_killed_or_banned_or_wedged(q)) {
 		int i;
 
 		trace_xe_exec_queue_resubmit(q);
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index ceb8345cbca6..3edeb30d5ccb 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -17,6 +17,7 @@ struct xe_modparam xe_modparam = {
 	.enable_display = true,
 	.guc_log_level = 5,
 	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
+	.wedged_mode = 1,
 	/* the rest are 0 by default */
 };
 
@@ -55,6 +56,10 @@ MODULE_PARM_DESC(max_vfs,
 		 "(0 = no VFs [default]; N = allow up to N VFs)");
 #endif
 
+module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, int, 0600);
+MODULE_PARM_DESC(wedged_mode,
+		 "Module's default policy for the wedged mode - 0=never, 1=upon-critical-errors[default], 2=upon-any-hang");
+
 struct init_funcs {
 	int (*init)(void);
 	void (*exit)(void);
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index b369984f08ec..61a0d28a28c8 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -21,6 +21,7 @@ struct xe_modparam {
 #ifdef CONFIG_PCI_IOV
 	unsigned int max_vfs;
 #endif
+	int wedged_mode;
 };
 
 extern struct xe_modparam xe_modparam;
-- 
2.44.0

