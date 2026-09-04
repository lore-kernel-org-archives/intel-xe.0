Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D840C624DE
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 17:33:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2BA10E0EB;
	Fri,  4 Sep 2026 17:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VAM8zlmr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAEBF10E0EB
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 17:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788543206; x=1820079206;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=n/h3uBAbNjMgGuZvxmPJxM+gO1LF7tzcSEue2XuNoEg=;
 b=VAM8zlmrw+/XGU8lFanUTuSml+buEfCzv7xEasisZzQwO3z796U6+MfT
 7rggeBV8GrPlzJFTELwOBrik9nsiwu4MfpVuJzXwbjdUF68yO8moBez/H
 mPTLoslQcQDffX4q4kbO0zz1M9l3tWQN7rbTQSD0w5dGIk5yv8Fe69ovM
 +XiCpdBKNEW+re0jwFOXTgr32+/e9YGfz4JclNp84ObOQiP9UNKWP6eIS
 aXweyiAFsHwhQWuGI29BqhC/WRowE5AAf3chohVcoM9aow9WObnAOykOX
 thJNQElK5HHO/TTch8qpYHQvHWdUUhXpqTXzLwQH93ynaqwMyij7Qwk5C w==;
X-CSE-ConnectionGUID: nJMIVNnjTzmiMdlv7Y98Eg==
X-CSE-MsgGUID: WgXXdjtKTcO3xld72HhibQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="91560550"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="91560550"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 10:33:26 -0700
X-CSE-ConnectionGUID: l2A0XSq4RNCmBIN6Zm50bA==
X-CSE-MsgGUID: 5J3nXTWcTqKEXccN+EenpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="273887808"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 10:33:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 10:33:25 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 10:33:25 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.51) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 10:33:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FwfPo1dZltaLq0bId7hrw9Mz7qz5yjESXUq60nZqm6m2wIbG6O4cL3m6UJxe/0IlmcKP/RLOpMoUujmhT9ehWPUwxr3MPJMfqOrq8DjhyKZztzqmI9uUADt0zcjazljwOKGwToStR80AV1slaACC3nheW+jx5SZelSnKzRviDB6ING8Bs3CGU3nneBd2xLmTtUStKUVwnlNFSGTv1kJ/yqBdVq0LcudcbF6h9W9hXw+bqTadJzkqAzp1wizxV5GgCioKelYNTMqTkrXhu4zXLimMQk7H2L9CNmn8zqrbm89u6p3vaTIoaVBgpgKdSQXXCbdR5jFSQbFv+5QYg3oTtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0WZaHebSoYwd5B2D2h8X8ZR49opgk15a7m53eC39MyQ=;
 b=UcZ4hDH55PXDfnHb3KTgR2viidKzwh6qbz0vsRH7/VigQ3s/uWFf4CR13eHkfSTHhQ+Oktt3Mq34jKKJhZ3hwSVhjp1/9z6/f84X7HqVnGRIPUhUTCh5H/a5yN7juIdiDdrWEYjSg0XOwiC3UVN4KJVl3w2xJbk9xIQWozrRFg/8yaXZL43b/SkwQ/BLd8cfUH59BsbigRqaoqjcygiQy2TUyPDqHRAdtxj+iWGtWijJ2pNu+Vwp9BECVkob9ugT1fw+j06vU+BNwp85NLuY/sETBD8+WFgyDbKFXAFrcjmZUHCCXtVNqfwCkPoIi9H2x3OKoZZQTV9wRQQEZEYgbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH3PPF310D5CFFC.namprd11.prod.outlook.com (2603:10b6:518:1::d14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 17:33:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 17:33:14 +0000
Date: Fri, 4 Sep 2026 10:33:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] drm/xe: Skip clearing purged page-table BOs
Message-ID: <apsA10Y3sCF8zQqL@gsse-cloud1.jf.intel.com>
References: <20260904122121.806122-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260904122121.806122-2-tejas.upadhyay@intel.com>
X-ClientProxiedBy: MW4PR03CA0198.namprd03.prod.outlook.com
 (2603:10b6:303:b8::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH3PPF310D5CFFC:EE_
X-MS-Office365-Filtering-Correlation-Id: 504a5b1c-df56-4f25-373f-08df0aaa993b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: OFcT1YE4LWMu7c/QoP7GgCEDtUdo+a2CKzWughbo26rH3pET+ppjJ+U7EB183Kpa9tte5GuvLDIyENJLmFWHFu5bzycrUO4llUd9VAMd4Va8mIKqe4Umbzkq7WCcepY1KDLS3n6+TL08pFR/G0DddXDzCVT330VuTlDwxtgMnZJl2ybAwav/rbtOF1jzkpO/dj7yeFFC3XyunjfTCBQeIMEgHHOEOaIL3Mi0wfhG2kkH9ln31fw2IQMoRwNPjmempBuxJokRcQEX5oqRdM3pb5MdHFiE4yuONTE0dF7t3lit0wrd8WXZLDYpnlO+xBMViJssusGEd0KFjdJ6kZjmR1b5ed//0L0O+5NhhB+QgD/54tss3YuCOht9BgyBS6oBwX/Xtxlp+c742wSZLN5UHLzeXBkj1PWlaUdJtIYqxf/aQKJ+Yvt7qksEeozu5sNLKIZABByPNe7XFnYVIUyWaoHtHWiRONbbsicMGo4hpM75aBw0KB3xbCb3OPC4WpmSBDxt6mKKBzkq1TO6ytvw9NaCBLMgb4x/4zyEH1ZFNgZtxmDnB9eycdHTzV2gbalTJB6CACvfuyqBsvDinaZwxhxoK8K1WZyb+DIP1/d8DgyhaB9VNPHVAYQvalUap78G
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EimZOnbiZgKvW6CfBATRLsjiTzUb2BhZUROhqoOCi9seFo6uQxqmVXrZKohz?=
 =?us-ascii?Q?AzeBUu7wftlgvu7lKyBKkBEasp3nxI5oVl+5ArMRJSkJ5CC50g7XA3JUnRDJ?=
 =?us-ascii?Q?EjwE85FhTncP6sHHBcsFGW/m1XPGxJWz6sYhKp98yNw10Mv+6K3sASfO8IXK?=
 =?us-ascii?Q?8O/7S/F5Un7Ge+3/odh8BYlMmOjKfN3/xjjg09u9FM0TxDeLn0lbeNt0FbI4?=
 =?us-ascii?Q?Z8yVlUpemF+u23dd1t9DFFcNpePv7qIqYsnyQdI0OGVFQCeNJ56/gZzwCrCS?=
 =?us-ascii?Q?2QKyw1FJVkBRisy8Z6Xk3iI3rWjAlPA0JKyCfZz+FvvXnPlkIcxLNrMwt8nM?=
 =?us-ascii?Q?/bQ6XrinPTQTQ0++0+g818btgWrZaPWd2QEluFlRQO3qVpwksPKYa7bVwznH?=
 =?us-ascii?Q?HSNbM9+Q9gT6Wz1H91xi4zpKo+lqZXwPyfkzog8mAvjc692Hsth4eDNu84eh?=
 =?us-ascii?Q?kHcTaB9K64gyvzTK79KSOAA5X8JMyDZgUdjno47VzO9v6l2WR72NYHKcwvBi?=
 =?us-ascii?Q?J3GTvNS9bb6Lghc6KCksQL2pHwYzwh3Lib322iYt9gBw/4xLvKjHG5RBRlC3?=
 =?us-ascii?Q?aR8oSn6i4r+U7kDZTYlkWypKJ63+ekQgYPqZShcJhLtJxSOR2vqkR0tmkpjw?=
 =?us-ascii?Q?4NsaTrMoKGHbiEy8iyPRjpPSnDX4EbJz2SEgZBJTTDuN7XV2rWvaK51efKh8?=
 =?us-ascii?Q?R45vxqosi8/Yb4FuwHY3B6J6iE6DlN4Pl12EnlCGkcsuc1hQOpGyQL09t53T?=
 =?us-ascii?Q?LwAr13ZTDydv7/d39IRMrpfAvP68h4UZ5XXojze01Jffp2LZpdq5jxayL1lS?=
 =?us-ascii?Q?5jJS7CxWMbQrs+oke3w39bjtk5sJCVvL4PRsevxTt3MVdWYrUsj/3Sw8xsmz?=
 =?us-ascii?Q?0ffTaFnVbc7j6F6egZQXjXXzG+PiybbKye7Z3nad1KvlJWaK1C9nDJpumCoh?=
 =?us-ascii?Q?n77WFSwu7uEUj8qFsrIk8919iCyC49h4kQ/bX1uIMTyvtkUVMWGlJ0FSH+nq?=
 =?us-ascii?Q?b9gHDdK1bQYXdIpvTgiOZDtT/6nR8DmMO5AzZXBEzwRR5RsbXnPl5igGWFxM?=
 =?us-ascii?Q?at9Fu4zhrIoby9ro5ClhgT1nT/ejhdbEUK/wSSxQLx+czwvTea+o/xGpb8c0?=
 =?us-ascii?Q?Rs+4txgJIrjLrBqkrYbgtcthndAdLbdKhJ/r/fHMdkKsMEMif6MV+BF6CQDH?=
 =?us-ascii?Q?Xe3COmyUV5de6nCIFvlYF0mF/OvseZJupkye3qH9480EpkNvp9R+eDMnVIPv?=
 =?us-ascii?Q?GEHBd2Olr8wSk97c8RfWF9V0LYOM8mEGjqHz5DFeL/dHotyelYbVCJARa21Q?=
 =?us-ascii?Q?2XOJr7Wp8T6es4q+OwBgSP7w5NOAcuE+iMn+StQjXAEx4CoUuDWkn9JDnXRW?=
 =?us-ascii?Q?gfjmUfPtxwX1ImWisjdmq0ECfLDGtgyEQUAWTwK2NRVFPsNcQIk3mDe2OZUp?=
 =?us-ascii?Q?pcONQ83uljU3YMcPO0IBNzbpJSHIfzdJUBW304tc03UJGQuSWlGRiWewUEIC?=
 =?us-ascii?Q?7Cq2LsbtqRBy1+36szojXNw2D7CB5w+txfwHzbgSIWDXPDutVcRq/dqcLbIm?=
 =?us-ascii?Q?5AWi0I7kiKS+H1UQCqifl0x56agLWkp1pOsQz9/ri0Sv0jnneAzCTNnEC94M?=
 =?us-ascii?Q?li7bxYcsPTjBGlOvAjOT1zf5PNDGVft1zq+Af5e8Wvm/JbU6pKxxbX0DBIXm?=
 =?us-ascii?Q?+2xDIoCVRHHBjPEv/ZNgZCZyDWEzaGw6Z2gnGm4d9Ueu3Hm7w6s05aLqnK3z?=
 =?us-ascii?Q?D6ncYyZwA0L9UQJO6pGHrVotMwp5Lwg=3D?=
X-Exchange-RoutingPolicyChecked: TeClNEEZiieT79Hhn2zvgK4mMteNYbO+HQ/3gmawfGsjFsGH4/VnKo7dCI0/uXxofcasrBhan6sxPnkN2utXXMRKMHbeMQ/zltp8gvd7O8S0oS7bzKbcbgztG38OgLxAo9hmZbNpVJg/s000qIrWgKYlHQaAr5dFxr+/UWRMAr+B233K3wl5vlEHH9RTtJkEOicsupv0PzjseGSf3wK5SvpiaooLywSU3hArqksrJ43qnmlY2zYKBA1wLNODJdbSeKPgy3zBsoue7qiLYbBOgRHYA12VqdbxkLc7DBbM99ZQC+DZufkfEyAsIgdn7foAEo9DlkwjuJOHYBNdz3w7ig==
X-MS-Exchange-CrossTenant-Network-Message-Id: 504a5b1c-df56-4f25-373f-08df0aaa993b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 17:33:14.3491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BRt/4DOtLIjrmR57z7c5D3gppUQ4xu6m6KEloBHoTurGEYRSz1f9wmvB+17eP5DEkV2GYBPolWOFHsLXhlSi2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF310D5CFFC
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

On Fri, Sep 04, 2026 at 05:51:22PM +0530, Tejas Upadhyay wrote:
> VRAM page offlining can clear a page-table BO's vmap before VM teardown
> calls xe_pt_clear(). Check for a purged BO under its dma-resv lock before
> writing to the mapping.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 5d990c1c3740..23bc74ba02cb 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -236,9 +236,12 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
>   */
>  void xe_pt_clear(struct xe_device *xe, struct xe_pt *pt)
>  {
> -	struct iosys_map *map = &pt->bo->vmap;
> +	struct xe_bo *bo = pt->bo;
>  
> -	xe_map_memset(xe, map, 0, 0, SZ_4K);
> +	xe_bo_lock(bo, false);
> +	if (!xe_bo_is_purged(bo))
> +		xe_map_memset(xe, &bo->vmap, 0, 0, SZ_4K);
> +	xe_bo_unlock(bo);

You have inverted the notifier lock and dma-resv [1].

The PT's dma-resv is the VM's dma-resv, so in xe_vm_close take this
before the notifier lock and drop the lock here.

For full clarity - assert dma-resv is held here via xe_bo_assert_held.

Matt

[1] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v1/bat-nvls-1/igt@xe_compute@compute-square.html

>  }
>  
>  /**
> -- 
> 2.52.0
> 
