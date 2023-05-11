Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A7EC77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 05:47:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507A410E5A0;
	Thu, 11 May 2023 05:47:07 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C676B10E5A0
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 05:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683784025; x=1715320025;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=b1yHbr5UyNvDYEXWKxbK7YNj0xWJ6XgkKgR6JzR/CeM=;
 b=ROMnVhNcdCgUtq38ynf8isfaPIGVU9HinbXx6UnEYV9I0kGAPQ8N1DFB
 9bnkR0J1AFwvrfaINTAnR1BoaDFajwnrN4hM83HTEerxCmUm8QYAJURxI
 bDL4CJzGDZWDRw/Lr33DDz2kNuhba9RxK++uF0W0wrudD7z9h5w9Xi8Zr
 NpRdw1Hk1sPZSHaj54fR1XlGaVgwsEdPmGLLvh6v9JRp6AbyqpQb3xEJM
 Cf9ahbRj06ph0rrurWCaSJkEs3q8mrAdPmU+h1Bvanx1zqFMJiCPuTcLV
 00kV3don+HluI9PwO89o/tR3tvARkXYFZptZelBcn2CEj8xKm5soO4lyL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="413725686"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="413725686"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 22:47:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="732439940"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="732439940"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 10 May 2023 22:47:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 10 May 2023 22:47:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 10 May 2023 22:47:04 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 10 May 2023 22:47:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LSsfa9Hfv5a9lq4KMx80MpZMe10/s+GZXWo6PJuh3XQThQMkV6WOUeqYMK02cSdZN5YQtamdRr2pARn+ue/OucBGQcgv9gtnUEp/gUCGdzXkoEAG2n3wbPXv/i+cn3nw3z7lAognKxw1GMsWTtODqawJZ9ov6QyXGPdMqOWgSh1ZF2YwTWhIc+CZcyk3CHlvtdwUkoQtHGrK98pI/aQx1uU639XqQoF+iXQdxol8qfBVLpBh98B7fp1o4lE8pJhhHRb38Og8N1dG8E3teY2AWiMEz8DwJCJ9L0whglzIFQZaTvzAO6GvKZcZS82Wtg9dhO3BmFwngKblOR3xYcUOEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wc+ZCj/b8RJo9fBNtHHxB4sUYdGRH+uAFrUOPuif638=;
 b=kRXN4K63XHHr1Xe+Rb08KJjuCLklBDVDk0ZOSL3ib80HiCVAcoHpqScc7vRLqbmYb0VUo//5wPYVK4kuLdKCmR8mOf8tZ3PWVkQPgs/EyoD8nj7SzpOeZ4tk+1+Js1ckSd3VC3SLBe5uoMcsTex/gl/wN5q9Gymylxz88ywmYhywQj8JnKrib5ZxLHUyx+NLOXPGEq//9bt4kndEft6vIpIFHdjrLyYo+SeFBJ+AZ8WtZUjNP3YOVPFHDAPqkZ5XCcO9Bd3T0nnIXCEd+eAV70dQzclqqoUfPnS1h6ZUoPB5gJlJLSMpPvRGnMYkepNkPi+xe4yeT2zDNX+C0GDyyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5264.namprd11.prod.outlook.com (2603:10b6:5:38b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.19; Thu, 11 May
 2023 05:46:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 05:46:49 +0000
Date: Wed, 10 May 2023 22:46:46 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ai6z2lb3q6cicweao5pmxyuoqvvfsfaqq3ft6dr3xwn3w2y2yr@zvhbqmtyhp5w>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-3-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230511034722.1929038-3-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR03CA0122.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5264:EE_
X-MS-Office365-Filtering-Correlation-Id: b8e16a17-3fcf-4631-683c-08db51e31ce8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JJ6xWRi1/ihueTwJTHlC9Fq1zROgsyiirjiaPTCoxjE6P98pgfpe+L2/1e0jt5798JxChGa+BrF77dT1RHSyAx05O0lRKZ+SM74xV1Q7rc54pfuzo9KJwC9U6KP6CU1fIXPqTt3vfLvl6yKcO6smytlSnWfjmpI36ooiRnttFLYo8/Wq5kHBEZjpThFKGi+02U2JTdPOBpDJ3HJrD7gxF2euH/mpcqP+3Vwt5ow2ZQB9lDB/DITpJmeEHONpLIPNHDO6Z51t/O+u8fSKWrloE5yO4MaxNFu75VoLBEO2icSqO4IX2ez6xDytsHIt6A6SpAZ3hQb/0PmzPDewYRmnz4+t1Q6xoHp7UdXvc8OvXH2pF/gM6ejVLLrq9npvtt9X5gSUQjpnREFveHNH4OYe5pZSXK5ixcG3asByqrQeAOKz+hdoX4ty/MT8Xq8gIwnE2SGVA8Jb9HUorzbSqRno3CPEp9lG/9AoNGB+oHjXnoXH1VOTr3rUtSykxcf8D+3ZcpOTL93VwkoNGDiLhLbxX4Zn7xN1KtH+9i36di792WZyyR1y/vXTxRYOmbhMXfy5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(39860400002)(136003)(376002)(366004)(346002)(451199021)(6666004)(66476007)(6636002)(6486002)(4326008)(66946007)(66556008)(478600001)(316002)(41300700001)(86362001)(83380400001)(186003)(6506007)(9686003)(6512007)(26005)(2906002)(8936002)(5660300002)(6862004)(8676002)(33716001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PiXVgTPJz1aL+XvYJoG/ZEU+Ytq7n54tFWqSr3MhtOEDjE0SjVmfj9nHH0u0?=
 =?us-ascii?Q?UWDQ1wgYA9rZV0vKCqloFkGrOkGgbhsmLd8tD1Ba7An7yYXOgqeOQuNYEo2G?=
 =?us-ascii?Q?ful8P+dcLabt2yormAAmmDddoxINYM0CpURJx4HdM85t4VlaDZIwSm2Z72ZF?=
 =?us-ascii?Q?tzI+YIBDUtXGgQq4ByMjp7lhf64wyXLwAfp/UhLOw5HDCNRlJeATCB+FyJ7x?=
 =?us-ascii?Q?bYbEddr6JqdQf55SmwzX2ov0K7UYeqTJy29BB/ifPeHKu9f5K4rIM8pf4Kfr?=
 =?us-ascii?Q?Tjjwtdo31oSTjhxutgw4UqlzYM8DUZQI5PEEE0qLbRqz2DDlMFp2MFGzUywQ?=
 =?us-ascii?Q?+0VqWJxtQJz/pzGvZs0F1/jAbh3zM3SC7Ci6l0mkOKg+1Y6J5WILGL/pSEKn?=
 =?us-ascii?Q?4NRRSDfGj/5tqDxjSMVY+lngwC3MTTUIFgWI2RnG7MyHagHcMMfpotCiKmhf?=
 =?us-ascii?Q?gjarbwlqFr7hyENh25YxRM+8FYYhwJoFB4MDNMXe/dKC/rtid8onR+guWH0w?=
 =?us-ascii?Q?tQDd3ao6GyiHmKBCqYpFDfc/H6js004xJTzUCgpxZab1jP4mtAmg3Vs2kM6s?=
 =?us-ascii?Q?wb7UFBoTlLQISe6vHiVvkPaqa4KJBaC+HSIU8cS7bPuWTVfcGPFua00FxHyA?=
 =?us-ascii?Q?bPzfLS5M9MFY+4lYPJWbOdTHzf11zq/uqfvQpW/DKvRAu/7KEzmsfXuutzNb?=
 =?us-ascii?Q?ykk6rZSrkGmBXgKLLEe55ZM/bsyAj5n87xA9qgfSNjQWG2GZ4DjZPFATbvjo?=
 =?us-ascii?Q?5dy1cizwWXc6EdBmkHwpIqXNnuLQX2wlBlWS5N7GvZ0tO2XHztMtUOPTp//L?=
 =?us-ascii?Q?t2AzfM1IVxZKO7NKLUFaGyn50bd85J+50zhmUF4nhC3ocwskTkxjtA70OZ4d?=
 =?us-ascii?Q?zjfSSSjxA879XftFSumbBuORVFf9w0qer/Kv9tgK3GF66E5JxHxgo8bD60Mm?=
 =?us-ascii?Q?LAYL7Yt0rCk0EI7KxukZkN24rLTmS2iA3IXH8j/yjBv9a24bPgd2oozfg+vj?=
 =?us-ascii?Q?htUNyvCDdxeHqz5idbVu7OdiLzAyRdAFnBUA4Sn3PLA20ddQ4VuIh+G8F4wo?=
 =?us-ascii?Q?rQ8Si6rCP0Rp9brSwmQFcLPbsPWCkP/4Wq6LtAY4NII8EdBhx13T+pGZLXDK?=
 =?us-ascii?Q?pUxtqclEA626svcKQEtxhKpB1nbRgWn/eBFBiQNOxx6WofvXK2tPeDLk0oUJ?=
 =?us-ascii?Q?KIU91MGFJGwKlblatfouCZqIAOBVU5QaiMLIP8sF3mFleQw4cxsZbwKpLKIG?=
 =?us-ascii?Q?kr8qMvC+tmg+neomCodZIKcUSvyTUkN5GV9rEh9f4gUDnPXe3zF13jMjh+Jw?=
 =?us-ascii?Q?ZB8VKn1EP/YNjei7KvlvCUzFVfNE6wBJH1fpMoWYzq+Z2hbplrt4zMIeB+Cy?=
 =?us-ascii?Q?UQy0z52dFpPBd58O/ondfBvKuhRtv+aBLms5W70nhg7+M1iRsCN6V8ms4dIU?=
 =?us-ascii?Q?Ni35fy4oRiuNxyhUgECU65QhfrIkzRfp3pg1UcVonYbVEnfC+D63yXLjaBUY?=
 =?us-ascii?Q?QPaVczr+jsYkfib6Qc2bXq+CIbDuVUle3DGOvxasJRKjmXf0Na+w8Qx5zwUM?=
 =?us-ascii?Q?oAUY4oi046Tkk+B7xhRXi+DGZGJtUyaRSKULWiknGS9GsNQbojZpZltYZVQ+?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8e16a17-3fcf-4631-683c-08db51e31ce8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 05:46:48.9394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roeQafPqPyShkKXs8VPg18ApS39262hjHvO6XA4h7WjUN2aiXCDGxoBuozsj6y+SbU9BmWD9eP2wJ82zwGpuCJCwtRkNW0BKmFePV2HUycc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5264
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 02/26] drm/xe: Introduce xe_tile
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 10, 2023 at 08:46:58PM -0700, Matt Roper wrote:
>Create a new xe_tile structure to begin separating the concept of "tile"
>from "GT."  A tile is effectively a complete GPU, and a GT is just one
>part of that.  On platforms like MTL, there's only a single full GPU
>(tile) which has its IP blocks provided by two GTs.  In contrast, a
>"multi-tile" platform like PVC is basically multiple complete GPUs
>packed behind a single PCI device.
>
>For now, just create xe_tile as a simple wrapper around xe_gt.  The
>items in xe_gt that are truly tied to the tile rather than the GT will
>be moved in future patches.  Support for multiple GTs per tile (i.e.,
>the MTL standalone media case) will also be re-introduced in a future
>patch.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.h       | 11 +++++---
> drivers/gpu/drm/xe/xe_device_types.h | 40 +++++++++++++++++++++++++---
> drivers/gpu/drm/xe/xe_gt_types.h     | 15 +++++++----
> drivers/gpu/drm/xe/xe_mmio.c         | 13 ++++-----
> drivers/gpu/drm/xe/xe_pci.c          |  5 +++-
> drivers/gpu/drm/xe/xe_vm.c           |  2 +-
> drivers/gpu/drm/xe/xe_vm_types.h     |  8 +++---
> 7 files changed, 71 insertions(+), 23 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>index cbae480a2092..f7acaf51a1fc 100644
>--- a/drivers/gpu/drm/xe/xe_device.h
>+++ b/drivers/gpu/drm/xe/xe_device.h
>@@ -48,12 +48,17 @@ static inline struct xe_file *to_xe_file(const struct drm_file *file)
> 	return file->driver_priv;
> }
>
>+static inline struct xe_tile *xe_device_get_root_tile(struct xe_device *xe)
>+{
>+	return &xe->tiles[0];
>+}
>+
> static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
> {
> 	struct xe_gt *gt;
>
>-	XE_BUG_ON(gt_id > XE_MAX_GT);
>-	gt = xe->gt + gt_id;
>+	XE_BUG_ON(gt_id > XE_MAX_TILES_PER_DEVICE);
>+	gt = &xe->tiles[gt_id].primary_gt;
> 	XE_BUG_ON(gt->info.id != gt_id);
> 	XE_BUG_ON(gt->info.type == XE_GT_TYPE_UNINITIALIZED);
>
>@@ -65,7 +70,7 @@ static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
>  */
> static inline struct xe_gt *to_gt(struct xe_device *xe)
> {
>-	return xe->gt;
>+	return &xe_device_get_root_tile(xe)->primary_gt;
> }
>
> static inline bool xe_device_guc_submission_enabled(struct xe_device *xe)
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 6490a04614ce..5dcf1695925f 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -34,7 +34,7 @@
>
> #define XE_GT0		0
> #define XE_GT1		1
>-#define XE_MAX_GT	(XE_GT1 + 1)
>+#define XE_MAX_TILES_PER_DEVICE	(XE_GT1 + 1)
>
> #define XE_MAX_ASID	(BIT(20))
>
>@@ -48,6 +48,40 @@
> 	 (_xe)->info.step.graphics >= (min_step) &&			\
> 	 (_xe)->info.step.graphics < (max_step))
>
>+#define tile_to_xe(tile__)								\
>+	_Generic(tile__,								\
>+		 const struct xe_tile *: (const struct xe_device *)((tile__)->xe),	\
>+		 struct xe_tile *: (tile__)->xe)
>+
>+/**
>+ * struct xe_tile - hardware tile structure
>+ *
>+ * From a driver perspective, a "tile" is effectively a complete GPU, containing
>+ * an SGunit, 1-2 GTs, and (for discrete platforms) VRAM.
>+ *
>+ * Multi-tile platforms effectively bundle multiple GPUs behind a single PCI
>+ * device and designate one "root" tile as being responsible for external PCI
>+ * communication.  PCI BAR0 exposes the GGTT and MMIO register space for each
>+ * tile in a stacked layout, and PCI BAR2 exposes the local memory associated
>+ * with each tile similarly.  Device-wide interrupts can be enabled/disabled
>+ * at the root tile, and the MSTR_TILE_INTR register will report which tiles
>+ * have interrupts that need servicing.
>+ */
>+struct xe_tile {
>+	/** @xe: Backpointer to tile's PCI device */
>+	struct xe_device *xe;
>+
>+	/** @id: ID of the tile */
>+	u8 id;
>+
>+	/**
>+	 * @primary_gt: Primary GT
>+	 */
>+	struct xe_gt primary_gt;
>+
>+	/* TODO: Add media GT here */
>+};
>+
> /**
>  * struct xe_device - Top level struct of XE device
>  */
>@@ -248,8 +282,8 @@ struct xe_device {
> 	/** @ordered_wq: used to serialize compute mode resume */
> 	struct workqueue_struct *ordered_wq;
>
>-	/** @gt: graphics tile */
>-	struct xe_gt gt[XE_MAX_GT];

kunit is now broken and needs to be fixed.

othet than that,


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>+	/** @tiles: device tiles */
>+	struct xe_tile tiles[XE_MAX_TILES_PER_DEVICE];
>
> 	/**
> 	 * @mem_access: keep track of memory access in the device, possibly
>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>index 7c47d67aa8be..e0ed4508269b 100644
>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>@@ -77,12 +77,17 @@ enum xe_steering_type {
> };
>
> /**
>- * struct xe_gt - Top level struct of a graphics tile
>+ * struct xe_gt - A "Graphics Technology" unit of the GPU
>  *
>- * A graphics tile may be a physical split (duplicate pieces of silicon,
>- * different GGTT + VRAM) or a virtual split (shared GGTT + VRAM). Either way
>- * this structure encapsulates of everything a GT is (MMIO, VRAM, memory
>- * management, microcontrols, and a hardware set of engines).
>+ * A GT ("Graphics Technology") is the subset of a GPU primarily responsible
>+ * for implementing the graphics and/or media IP.  It encapsulates the hardware
>+ * engines, programmable execution units, and GuC.   Each GT has its own
>+ * handling of power management (RC6+forcewake) and multicast register
>+ * steering.
>+ *
>+ * A GPU/tile may have a single GT that supplies all graphics and media
>+ * functionality, or the graphics and media may be split into separate GTs
>+ * within a tile.
>  */
> struct xe_gt {
> 	/** @xe: backpointer to XE device */
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index 4804616a3c44..254b4a63d901 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -399,6 +399,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
> 		  struct drm_file *file)
> {
> 	struct xe_device *xe = to_xe_device(dev);
>+	struct xe_gt *gt = xe_device_get_gt(xe, 0);
> 	struct drm_xe_mmio *args = data;
> 	unsigned int bits_flag, bytes;
> 	struct xe_reg reg;
>@@ -440,7 +441,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
> 	 */
> 	reg = XE_REG(args->addr);
>
>-	xe_force_wake_get(gt_to_fw(&xe->gt[0]), XE_FORCEWAKE_ALL);
>+	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>
> 	if (args->flags & DRM_XE_MMIO_WRITE) {
> 		switch (bits_flag) {
>@@ -449,10 +450,10 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
> 				ret = -EINVAL;
> 				goto exit;
> 			}
>-			xe_mmio_write32(to_gt(xe), reg, args->value);
>+			xe_mmio_write32(gt, reg, args->value);
> 			break;
> 		case DRM_XE_MMIO_64BIT:
>-			xe_mmio_write64(to_gt(xe), reg, args->value);
>+			xe_mmio_write64(gt, reg, args->value);
> 			break;
> 		default:
> 			drm_dbg(&xe->drm, "Invalid MMIO bit size");
>@@ -467,10 +468,10 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
> 	if (args->flags & DRM_XE_MMIO_READ) {
> 		switch (bits_flag) {
> 		case DRM_XE_MMIO_32BIT:
>-			args->value = xe_mmio_read32(to_gt(xe), reg);
>+			args->value = xe_mmio_read32(gt, reg);
> 			break;
> 		case DRM_XE_MMIO_64BIT:
>-			args->value = xe_mmio_read64(to_gt(xe), reg);
>+			args->value = xe_mmio_read64(gt, reg);
> 			break;
> 		default:
> 			drm_dbg(&xe->drm, "Invalid MMIO bit size");
>@@ -482,7 +483,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
> 	}
>
> exit:
>-	xe_force_wake_put(gt_to_fw(&xe->gt[0]), XE_FORCEWAKE_ALL);
>+	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>
> 	return ret;
> }
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index bf2c234c4f6e..e79b16d8bf7f 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -525,7 +525,10 @@ static int xe_info_init(struct xe_device *xe,
> 	xe->info.step = xe_step_get(xe);
>
> 	for (id = 0; id < xe->info.tile_count; ++id) {
>-		gt = xe->gt + id;
>+		xe->tiles[id].xe = xe;
>+		xe->tiles[id].id = id;
>+
>+		gt = &xe->tiles[id].primary_gt;
> 		gt->info.id = id;
> 		gt->xe = xe;
>
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index 0a4becdf4675..fe6abb6ed6ca 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -3347,7 +3347,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> 	struct xe_device *xe = vma->vm->xe;
> 	struct xe_gt *gt;
> 	u32 gt_needs_invalidate = 0;
>-	int seqno[XE_MAX_GT];
>+	int seqno[XE_MAX_TILES_PER_DEVICE];
> 	u8 id;
> 	int ret;
>
>diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
>index fada7896867f..203ba9d946b8 100644
>--- a/drivers/gpu/drm/xe/xe_vm_types.h
>+++ b/drivers/gpu/drm/xe/xe_vm_types.h
>@@ -159,7 +159,7 @@ struct xe_vm {
> 	struct kref refcount;
>
> 	/* engine used for (un)binding vma's */
>-	struct xe_engine *eng[XE_MAX_GT];
>+	struct xe_engine *eng[XE_MAX_TILES_PER_DEVICE];
>
> 	/** Protects @rebind_list and the page-table structures */
> 	struct dma_resv resv;
>@@ -167,9 +167,9 @@ struct xe_vm {
> 	u64 size;
> 	struct rb_root vmas;
>
>-	struct xe_pt *pt_root[XE_MAX_GT];
>-	struct xe_bo *scratch_bo[XE_MAX_GT];
>-	struct xe_pt *scratch_pt[XE_MAX_GT][XE_VM_MAX_LEVEL];
>+	struct xe_pt *pt_root[XE_MAX_TILES_PER_DEVICE];
>+	struct xe_bo *scratch_bo[XE_MAX_TILES_PER_DEVICE];
>+	struct xe_pt *scratch_pt[XE_MAX_TILES_PER_DEVICE][XE_VM_MAX_LEVEL];
>
> 	/** @flags: flags for this VM, statically setup a creation time */
> #define XE_VM_FLAGS_64K			BIT(0)
>-- 
>2.40.0
>
