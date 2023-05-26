Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338E8C77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 22:37:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C161F10E0DB;
	Fri, 26 May 2023 22:37:14 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A04F10E0DB
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 22:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685140633; x=1716676633;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DjBPD4AqkhFgTRAJ6bkZ8q3Fs69LCDhJPWwt/zS2tEw=;
 b=ixduZ0xeGmUjbrdna6C0YOmOipI0i6cyeQN3wwCQLt+cMtqO8gwGNyQW
 MFPd8Of093zv4ihA/k8k9GaRX1hiUo3WlZlgaZk2QmkWrKsKAppw8F8lu
 1xpDDXCnmRoFtKvJ1hYg1w7MpmXSloTWcOdqdRfMeeYuTCiivrcxjIpL7
 bYU9ra1E4JGYot/FG1sAzfg61shAI7YRMl22ojxuJDRcwdYRvfOXYsygr
 uckCfiTlurS43u5NrOcwXAKAwycFm1B7/7qzOSID5jLnbh+Yvb+x4mXLi
 wsg5VJU3OFZxs0zVQc53ovKTGKiG2W7LvRY0aeBVxnmZuVRF3Xz3UXXAA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="353166466"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="353166466"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 15:37:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="708552507"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="708552507"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 26 May 2023 15:37:12 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 15:37:12 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 26 May 2023 15:37:12 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 26 May 2023 15:37:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cOJhRnrXsoFNaLYktuLUG0+znh0nQ5OKCmqlhDIFsfDCP6md08C6ZN9ot2Q9/birOfZrNTpOwTeX3WRrdh+2JJfRm+c/PuyCPzugGp0UYuE8KnHqD6skCnTAj9kfJ6u+q13ojkc3kvInjKXvV/6OqMqGT7/FLj+zniImLTQDq+CmoHMh+VUfUGOqZaKBIrjZqvJDDRiQya8/W2tgmRB7TfJPEzAN6PzPMJr2q5hdwswvmP6NlmhAWstKWRyrjxXViFrxqo024RrvUeiohklXGyNCNMf8JwLaoH/mqR0PY0ypdRHYU0PdNXcjMrjOtEEWEhhz0TTnr/BrKVAGD4z32g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2O/uZa9Mb9JrnuIweb8n6Zz5kEOQF4LQEC4zvEQ328=;
 b=UIPwIskO3nbwMjOJFB2proRWypSOVQ1MqgPrGBrK0OGE4RWGlXQHwMN8JE3iStl4HHV+NfOrGF+l2ZP3zsGfWq81ziwRG+SIdj+Tr+TTM/u0YBQ/7o7axCdSuunp3C0YcmftjxiKnI+m234dRRZuGogUcvxrjsqfxQYv+gJfTvFYxFtwUhQsdO3erV6e8pKnC6a0y9ZH0pnht7azujS4X1zVUe3aydOZ3IlAYM7tyluhoBL5bhfKEZOs4Bat4pHxvcj/0xXCADoFjjLV4wzCN3NmyJwbaL+f78YUlfZuFBa7aee3wYh1EqP7YVhtOa15ANXUshp3NNYyEi6ciq+SAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB5779.namprd11.prod.outlook.com (2603:10b6:806:232::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Fri, 26 May
 2023 22:37:09 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6433.017; Fri, 26 May 2023
 22:37:09 +0000
Date: Fri, 26 May 2023 15:37:07 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <reveed2jnv7va6gqe32yflgcvg2qkd6vea3xfy6cgwspswottb@qq7crr5htie5>
References: <20230519231827.3572452-1-matthew.d.roper@intel.com>
 <20230519231827.3572452-28-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230519231827.3572452-28-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR13CA0081.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: 806bcd6f-a465-4f1d-cab9-08db5e39bd81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lsaiF+wxpokZZ7g4IU2sMQktqz/43+OZ1r2j0ccpHGx9RjM2I+FFLaTSzVtaBayVkNsFipybF+G7pUXBLIsBIV8w57Jt8LYH4Jd193MSV4J8CWlO5gjBArFsqmD/WzecHgcIjqoHM/6W22g9EgtNvWENoaROyx2xK9p5BrIa2/6meo80vlGS/TxQjQtEDn6XQBBRei66o/kspJ8C0GlWQ1YBl1LRt8QjbHdH5qhQ1uCtel8iW9+lNo7Hlqlgp4RXrM8xaFTXJU/ERKd7mv8Pn7ul4O4DQxfLYRxLURG+vUVy7lTAaiktToB3FyFDgdfv8S3Uz1m0eGcjUCxTvp1aaBJsEaCMFYXdOPWLTuJiNanh1Qvz2/xP6yVoJly5EE3i9eY9Mb2mOyMdpIzIUpP6K0r1W3LmMEGBTVtI8JPlaxnVrkg4a8OXI7zcV6dLd9hw6hYuXLfBnuB4xlDTT+JWindUxAsJPR10zaEaVjvjI2VePO/8T1maeauj9w+kbv8auJrhGPt43iBPcbFJgNsfTCEdQRtJYpW85NOtgTIdSUHECeHFqiRQ7sieYU5qolxx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(366004)(376002)(396003)(39860400002)(136003)(451199021)(66946007)(478600001)(66556008)(66476007)(6636002)(41300700001)(8936002)(6486002)(8676002)(4326008)(6862004)(83380400001)(5660300002)(2906002)(316002)(38100700002)(33716001)(86362001)(186003)(82960400001)(6512007)(26005)(6506007)(9686003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ieWDiXMmgbBjgFr8LwuPojB9JAZ6vv2fyRYwBjvMmob6tVhMBN2y2W3qNTBq?=
 =?us-ascii?Q?dBdiJEQA7lR79dIS1zwtBoU/T1TAUuseTI9qLh0rWC1irIJKrvqtH2o89AUt?=
 =?us-ascii?Q?0zM9qpmqZqE2414t2tDvkBSyBM4ZMa2RSw/IB68uWMaaCFZR7ANohR87bZW3?=
 =?us-ascii?Q?dlIYrn/cz/NRV+hmFGOpk1FIHKc/mnJ0pYxeUwATF4oZtX29+ypHhGd4XlWo?=
 =?us-ascii?Q?5T5nWouLSpt4PM9voMcCZ+96kZoKW1Ymqkl+w3wkw2UDVBXLYN1PEWTLH4Ob?=
 =?us-ascii?Q?ex5cOAFcg4wWMFujFKdJBnwxZmsTB3BSHBireDzK3qma3n/TVh9ky6oAVp6y?=
 =?us-ascii?Q?gsJZ8qVBtrbGOjDC2XxnOZcmUmFRIzSfCtOJAEaoI5cNwohnXyRPQFjG1bEX?=
 =?us-ascii?Q?MO8+xry4ahwWkJOw0V+owe4FAoNg+H2IRzTMfp6jHzCaivXbAwQ9l1OiEslJ?=
 =?us-ascii?Q?dKCSF6L3tOhVZkFuJTLcbzN57xBj5ZSIxYyEoULk7tLtOuq+QDoK8N+/ts3T?=
 =?us-ascii?Q?3+wYOWrzPphELs99dNeFYV3PX834RTgonSGK/vgBrINMRgz3uIrdLovH9wcV?=
 =?us-ascii?Q?CZkGVjCBPU482AyRw6hYd1ZR+ksXg7yw2uyn5+h8pa7hFlSDGAADLTmClFBT?=
 =?us-ascii?Q?FSA52Zh2gMzEFsve7/h+QBaJw4dZwpEniSQg1IL8Tm1Id6HeJ+oAYsDyAM1f?=
 =?us-ascii?Q?LaTBUCa/3HZKnflz3g73bTQV78D1xd87K/SKc849lMn6p1CGbGi+2l3hTcdY?=
 =?us-ascii?Q?gZaP0S+Y856ZQ76pYSRyAOMfZpAnyjlbGMah4k5mNrtyuhzNMRA+ZehJIJDx?=
 =?us-ascii?Q?sJ/D2eEF484vv87Yy5ESVvxuhMj7KaA2g+GQ8AhY5mFGHMognS4L1f8McRlT?=
 =?us-ascii?Q?35qjBWhg/NoGL2TuGphYpuNpiQfrjWnUeWg9dXIndte9oBJ2Dcl9WusZtieO?=
 =?us-ascii?Q?TIqXpQnSyerw+56/sEuY7Jrck7DjaMOLLBmkDIP19VRml+HDnu1MPrp209NF?=
 =?us-ascii?Q?cfgfLbbELUF9s87R7q9UgR6v7Fcxeit9mQnkho8yDsHt1GBN7KArVXxiwmKN?=
 =?us-ascii?Q?Z4acdWnu3LwrjRZ2ONt9uKgW73UcvuArvt+XGITjnzVf8EMwCBuC0CUdlP1z?=
 =?us-ascii?Q?WQUapIWW3KGi1hO+Z0VOu+a6Ixfe0kOZLOr3vHEkmsZ9VJBsuHuSFaz0ITuC?=
 =?us-ascii?Q?oFbNkWplLKhriDG0usfEciHd0ha+mRCrEIpYary2HihLFf84BHXQXlvltPMJ?=
 =?us-ascii?Q?7dcuPm2A9YOCeRyAtb642TmP/skKuCVItCG+Tx888GNGV7n5VTs7jYAllUUC?=
 =?us-ascii?Q?tx9iHAY48seoVaZm4/dhVuiur+WX4ibyZIVMC9Vw6hoZsOvOBT3n50nM6rvV?=
 =?us-ascii?Q?3ZU2UKlVEhzJ/M5m1zLxJJ1odrVQtr7CzCDzZMS4J6FCF8/KPvnMjUygECLH?=
 =?us-ascii?Q?FW3uCniU3Q82ygBKQ5CW6dmoDoVqcCbuXN7coEuXF376AEaImsnJpgXjIe76?=
 =?us-ascii?Q?NMm+hm8lHeW5BGt5oyf4gzIzGjG3DE5YOEwv3tM7p1mlhE2PE+YP9x71rWMg?=
 =?us-ascii?Q?4cmOETTiNKrJz8GXMpUCX2pYE+gfr+lz3FVFgErgtegTAgY/cLFDvrJ84Sgr?=
 =?us-ascii?Q?ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 806bcd6f-a465-4f1d-cab9-08db5e39bd81
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 22:37:09.1412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wj+VB4F+3lw9og+4m+miTdvdYXeRzRbsRaI3TupTql6Zt8Ohd5XuNCxhTPYL2r0wP71oL1t411+M3jurahR93wPt7eaDJkORKh1Zjm0fF/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5779
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 27/30] drm/xe: Allow GT looping and lookup
 on standalone media
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

On Fri, May 19, 2023 at 04:18:24PM -0700, Matt Roper wrote:
>Allow xe_device_get_gt() and for_each_gt() to operate as expected on
>platforms with standalone media.
>
>FIXME: We need to figure out a consistent ID scheme for GTs.  At the
>moment our platforms either have multi-tile (i.e., PVC) or standalone
>media (MTL) but not both.  If a future platform supports both of these
>capabilities at the same time, how will we number the GTs of the
>platform?   primary-primary-media-media?  primary-media-primary-media?
>For that matter should we even still be exposing the concept of 'GT' to
>userspace or should that switch to tile instead (and keep the hardware's
>separation of render and media an internal implementation detail like it
>is on i915)?  If we only expose tiles to userspace and not GTs, then we
>may not even need per-GT ID numbers anymore.

is this something to leave on the commit or something to solve now?
I think userspace may care about what tile the GT is located, but not
much about the order... I think just making it a depth-first on each
tile would be ok and we can have a tile as a gt attribute.

>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.h | 27 +++++++++++++++++++++------
> 1 file changed, 21 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>index 156c62ac0381..e0085fcd3f47 100644
>--- a/drivers/gpu/drm/xe/xe_device.h
>+++ b/drivers/gpu/drm/xe/xe_device.h
>@@ -55,16 +55,27 @@ static inline struct xe_tile *xe_device_get_root_tile(struct xe_device *xe)
>
> static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
> {
>+	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> 	struct xe_gt *gt;
>
>-	XE_BUG_ON(gt_id > XE_MAX_TILES_PER_DEVICE);
>+	if (drm_WARN_ON(&xe->drm, gt_id > XE_MAX_TILES_PER_DEVICE))

this condition is odd.

>+		return root_tile->primary_gt;
>
>-	gt = xe->tiles[gt_id].primary_gt;
>-	if (drm_WARN_ON(&xe->drm, !gt))
>+	/*
>+	 * FIXME: This only works for now because multi-tile and standalone
>+	 * media are mutually exclusive on the platforms we have today.
>+	 */
>+	if (MEDIA_VER(xe) >= 13) {
>+		gt = gt_id ? root_tile->media_gt : root_tile->primary_gt;
>+	} else {
>+		gt = xe->tiles[gt_id].primary_gt;
>+	}

I would expect something like:

	for_each_tile(...)
		for_each_gt(...)
			if (gt->id == gt_id)
				return gt_id

which could be optimized by reserving the gt numbers
with XE_MAX_TILES_PER_DEVICE

#define XE_MAX_GTS_PER_TILE 2

	tile = gt_id / XE_MAX_GTS_PER_TILE;
	gt = gt_id % XE_MAX_GTS_PER_TILE;
	return !gt ? xe->tiles[tile].primary_gt : xe->tiles[tile].media_gt;

but hey... why are we not keeping a gt[] to make things simpler instead
of calling them explicitly primary_gt/media_gt?

Lucas De Marchi

>+
>+	if (!gt)
> 		return NULL;
>
>-	XE_BUG_ON(gt->info.id != gt_id);
>-	XE_BUG_ON(gt->info.type == XE_GT_TYPE_UNINITIALIZED);
>+	drm_WARN_ON(&xe->drm, gt->info.id != gt_id);
>+	drm_WARN_ON(&xe->drm, gt->info.type == XE_GT_TYPE_UNINITIALIZED);
>
> 	return gt;
> }
>@@ -98,8 +109,12 @@ static inline void xe_device_guc_submission_disable(struct xe_device *xe)
> 	for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__++)) \
> 		for_each_if ((tile__) = &(xe__)->tiles[(id__)])
>
>+/*
>+ * FIXME: This only works for now since multi-tile and standalone media
>+ * happen to be mutually exclusive.  Future platforms may change this...
>+ */
> #define for_each_gt(gt__, xe__, id__) \
>-	for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__++)) \
>+	for ((id__) = 0; (id__) < (xe__)->info.tile_count + (MEDIA_VER(xe__) >= 13 ? 1 : 0); (id__++)) \
> 		for_each_if ((gt__) = xe_device_get_gt((xe__), (id__)))
>
> static inline struct xe_force_wake * gt_to_fw(struct xe_gt *gt)
>-- 
>2.40.0
>
