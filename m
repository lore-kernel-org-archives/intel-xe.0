Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EAC3C44501
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 15:55:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB0F510E038;
	Fri, 10 Jul 2026 15:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kFcYGH6r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62DFF10E038
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jul 2026 15:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783698898; x=1815234898;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qIlxcamDrK+wUJY9w00WaS8TlvkJTkSObnk1MfKUgcU=;
 b=kFcYGH6ryz1vTgqZjsSdijDT1Rh03SHBPLY9/QYs+RSG3TRTRX4LXJpE
 E40N+h+khQplLG6bpi8mhmJu6TmQWXydomjimLE4FgrkLp3v4UczlHOWR
 aTjNJC24HErLZkn82aWFsOcpSkIi2M3a278S3VQLgGDK3tEj/7eLpCdT/
 5vABJJM6O559b2H/c8k7yqp0xhIS2Q16rAp9sYfmgxw1pqn06CTPJyyrS
 93GzI3ezbeasrEWCbRSrK1ZjiwycATs5atuYMxkO/Z37yeGjMhEmsAKV+
 Bw1LDCPVTdnDBBhiBRYVYN2h0n8CZqVqAYi3C6Is1AqX09jRMwgWXdGpL g==;
X-CSE-ConnectionGUID: dpnmgydjSumLKyENdls4sw==
X-CSE-MsgGUID: stunJiWVRXK6wIEpGIxXOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84450498"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84450498"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 08:54:58 -0700
X-CSE-ConnectionGUID: /3wtBzv6RPqmsux1r2QoWg==
X-CSE-MsgGUID: g/YIj7esQL+dzVqKKipXUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="251548691"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 08:54:58 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 10 Jul 2026 08:54:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 10 Jul 2026 08:54:57 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.11) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 10 Jul 2026 08:54:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t4tCtDLTj95MYMbnQkkP3njtswPCTEbYORkfU5T1PZ2gymIynoMwdMflIn7Ft/Rrre7/cLgJ5AtkKOQR4jG9P1xCBlU1QUERZNoYduu2feD8OYtPkbIKVZLsT8krczheXpgD+nIxNm5yxV0StXs/MulZswmzj9KhDS8B6KPAXVRZgWU9DkgDNe20D24DiX9sXHO6ehH6KpdNtGTgeAy5QI/ThMMxcgJfnpRaVQIQC7fM04cn/6ReSw0kRjSrq0vrLY317CUnnNXqDCbxFvm7KmxG6pSFCmfCrwX/NXBs0FFENOm6pH1DRLhbmJBIJmW5jh7eq2b/w2dhwFLByBnjDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2+ZKHgTCHersysg4UMQCvmfQIvg04Sr+9B/G6a43Wqs=;
 b=kvsr+9WEDhLiylgzMtWQxLYWP+Z4YZwhVaOrzNh2posCLfDvocljg2h07MrilMmIxX/AkYq8/qVpFTA3cBCJEikjiOB+/McES5gOXjm43ErnNe6Awzb4EV00gXG9e2sYOYgKJ5gK9Cli1x7idNMXy++FYPyoz3JtigcwZdRqtMWjRvWFJ3kYEMp2VSVyt3yaQqpMnw+tdN37PlkNzffaSer1n3yuecTWFtnKtukzbY/FsxvMvdPax+kiP1mmRFHLMUsBdZJrtPRfEO5EKxOvJNMWfdLrMh1/naOIIr6AWdwCGenamdirRNk4+8hzpWKnHMJWDX6hvxhtsz3zvHvV5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by CH0PR11MB5266.namprd11.prod.outlook.com (2603:10b6:610:e1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 15:54:53 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 15:54:53 +0000
Date: Fri, 10 Jul 2026 08:54:50 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Reject PXP usage on multi-queue exec queues
Message-ID: <alEVyj-c_Heoxe60@nvishwa1-desk>
References: <d17f069c16b9e07dfbfae730914b1c095739fe4a.1783626140.git.jagmeet.randhawa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <d17f069c16b9e07dfbfae730914b1c095739fe4a.1783626140.git.jagmeet.randhawa@intel.com>
X-ClientProxiedBy: SJ0PR13CA0064.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::9) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|CH0PR11MB5266:EE_
X-MS-Office365-Filtering-Correlation-Id: 99104a84-9d46-4195-27c7-08dede9b9503
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: Czj6ojygYK8pBArQjSSjeU9/Q1MwjQjVKtrdUSYs6Ctt5AwdMrtaixpYbmVKUld4NV/ndl9SEHrSoAqLCKxAEoFJElSDRRnzq7Feyc7+oeCFnpdrHcMlWrLHeanOZOdrNuOMxxh+Kj3eCMAchu9LPpIjJbRJOl9sz9dlAO3t1U8SFVOm5YV6ddcH3wbyoYCvu/Pb8UVVkG9peHCqtDCgFkpUBddd8y/SXDprSuhuTS/846vdymbim478EU9DkbpoRBzPCgcMEKOX1qxf3UD62O5jg+aMzTl1Gy0ZSxZIu2JCLGFSuOO/gNErSM8Y4QzLxcaB8z71eB2BXBgiINF34kQI/jSjum657LTUnTzjHaWWzGuguRZxj1I2KwS26/iX7/tcXntfQqyhUmdzLL7o3uJZa+A6DAT9jr14nRYBsGe3Zk52misxLdYQBKqbT9WcamdXsciVsH/TfCA72e/ufWDHvR1RFvZt/1IjIZquazdP7pj5Ub7w68X8NqYNDKV3l5AfqHENgogq693O0l9uDGPpLIREq2dFtMFOOTFbAjPPzcgORPbI1zazgAayZHkdA8YiaoKUaDGNYXarV/v8O7kBAWv3MbisW5aGPe/aYNl4nmWbUtKIfw3um8EtGxtmiVJ/PABvbanByCQ6xd5AHIfb253EvF/7JQRY85TV4Ik=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xbHNk9PxU2Yuw+Zsc4XhfchME5FfjVZqD1tOtEI1Bo0RmsBYaU6UH33c5Xbs?=
 =?us-ascii?Q?PHCRk2DmKFaOIzF7TCMBKJ6wpNjk43onJ+b9Ow6wYa97UMuJcBEYEiWCZlAf?=
 =?us-ascii?Q?sdy6ePDliwhf4fJmiH/q+5tepsSFkA9vv7yfDMGrB7qRmr/pbuz9OklzsS+m?=
 =?us-ascii?Q?3xKDa/XcUjNevkTUvGsl5ekkxFedSGD3ATEmu6/i4Chr2p80zM9WThbZYAvA?=
 =?us-ascii?Q?W3eCmRmp/UctCSnUwGMfNtG3TIatf5hAsJt+k34swdoj/X0QcEb0hytDpnhv?=
 =?us-ascii?Q?vPS8kjokycWtYoWAiIMIoiLBAnTxfiP3iFqr3o/WOWk+IzIsUOR14Rqr2hCL?=
 =?us-ascii?Q?DB5cCTAKfE7CtD+hfUKs+r03t3cBVKCJkKKYATleQ1m31yBakWPdqhzKGvV7?=
 =?us-ascii?Q?v5qx5b/+VcDfxlWRXEUfmhWT4V7YJRtm/Fu8kmgzraRsoIMZJKE5BDaJMkt9?=
 =?us-ascii?Q?j7RIL7rl0Wm6xwJaJr77mqumBSsBSyYoPJgQtA/Mrdw4lc5mcdz8QnxilN4W?=
 =?us-ascii?Q?xJwM5wYp3kCcZF2b78+wJTI+ONhbVRCTgvjBEZgVTEtSEcdlR4bSvohu3d29?=
 =?us-ascii?Q?DOWw1H/B0QkHMe5KfXKulZa6MueYQks3IIr2fnL9h8dMvFC8ZX2ed1GtwtqH?=
 =?us-ascii?Q?DgJ5jKCzCNBU0lN7qSc238Pr2kEuhuZYhZsWOkACiHU+xt5i2ZErJA1eXUEh?=
 =?us-ascii?Q?MNs1kOJIvP0KXvAxb565YHXiiJZumom+ZtrSSMCIOgeMl8rQw2qDK2KKSQIh?=
 =?us-ascii?Q?v6ogJySQfEFCLQfbRS1GhjgEUmB+TqKOY/7kyQtq1D33R0YXepOE0CQqYHi5?=
 =?us-ascii?Q?CbWlT0nm0smM7GDIvn+qOBLdfkJKVAK557KWc2a1ETNxrAak8F7RjN4ts0fO?=
 =?us-ascii?Q?daES3UelX3F9GFneYYIWylMAf7nH96jqcuvoYj6vVhADGzqOSJK74pddXENK?=
 =?us-ascii?Q?oo64T49rwaMwKRgTfc69wxU5MvnR+4YSYZM0S1I9ueC/XOC2KGV9ilr9wLQN?=
 =?us-ascii?Q?Tv/EaqcURyluFbaW5+oDGGepfZwFgkE+kmRgHweYIf+u3iplDSV+IXHkYVjT?=
 =?us-ascii?Q?MCpTczi2NC+W8M0OOvP1SCZF8e6dnEqyuohlEoPgkLKgbYvJppuZOQcZvOn4?=
 =?us-ascii?Q?RF/QHMsP5vCMulJ8hApeKHiLNtnReKLKXD0JzvqAL5m9SLQ/ITorRdgjiWVL?=
 =?us-ascii?Q?4DVMXawIObpaaJ0DPq7MNlDJglNuqpct9YhOvzu0p7BW/LLhtUWXSBifEhq/?=
 =?us-ascii?Q?peAaZ0torRl9wnFww/5h0pnQbVjTUnJSz6KDTfXmEpvxYVIu3KwstvzVI1o9?=
 =?us-ascii?Q?OpVL1d6RWMzyOAv6FC0L86BieNGSxxmrp9nZZnhRUPbXLAhlS5kb8Jd2I9/7?=
 =?us-ascii?Q?wml/OjDHBF6BbHnM+FkCrGlZF7tev7T3wEkL6r79PVEB6nbd0VJ/eSgh9TZ8?=
 =?us-ascii?Q?GWmeli2LXIMzSyLpZJbiEKe+lTEtYPURbqfFzHfqkzD+54BfPneen7xP9QJv?=
 =?us-ascii?Q?URtGVohOn91nvRejEdOFmHDyhqtcpO9ySlOGn/YlxyBhg/XGz7bHcP21JP8S?=
 =?us-ascii?Q?5JwcWy3hj1+8mqc7XK/LTIMDWPi/7PW8JI20XnIxVhB56rlSvaYw1rJu/RfO?=
 =?us-ascii?Q?si74b0dxrFhonU0AMP7HpGwCHmgRfCVDlc2MwhPPGJ7/bv884os4gg0H+72e?=
 =?us-ascii?Q?9pULJLXcwJPCA2aZ73uSRUmKKpIuDw1dAyRR7BuOyywhi6R4LhSWVQFNJ9KK?=
 =?us-ascii?Q?lHkk2iD2iOutFg5XjyBKSVXMGdM0NM7cVtaQY7+Hc3TOkPk5NsQZ?=
X-Exchange-RoutingPolicyChecked: js++kEXS8z1YdmN9KBUHjxMViynloE9K2V05XV4ghO8kmQxgJyg09lMwi+OOcO1PNyk7O1BBgm3Q2MP+E3+s9zQZA+B4gO6adqVGiYHAbsdpalQAYtrDRbnvFciuCX7G9Y/ebaj64w/l3XjDxNgocccHKpHb3tNUJPkbbLASTNrBtMyP+MgAwB1K8LuGDzr6F1Lk1CK0NZIN/NOrvSAy3ZZvKisnRW8ExbLaILNZH+Dtwltq9GV5rbi1VgzOdcxL/vEAT5mM55MqiLN6EtMxiSp0/XaCzGGOisF34HuxWle7xvMsXeh01FmTkGr3vWygT16GzoX9fjVHVwRYqAfwqw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 99104a84-9d46-4195-27c7-08dede9b9503
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 15:54:53.6743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OLfKXga7DEy0yxlTJI96gf555hWnuw5Rz8r++8iRRqr0C3jyCzxA4bTCJv5c6DGcH0709l2+RR7/Dytov1bPL6WQw+s8JMKw++uZSpvUqQ0CigSBZYLR5KLlvC1DMmnr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5266
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

On Fri, Jul 10, 2026 at 03:44:16AM +0800, Jagmeet Randhawa wrote:
>HWDRM is currently the only supported PXP type, and it is display
>related, so it cannot be combined with multi-queue exec queue groups.
>Reject exec queue creation that requests both multi-queue and PXP,
>returning -EINVAL.
>
>The secondary queue path already rejects any PXP property, so this
>adds the missing check for the multi-queue primary,
>which would otherwise allow the combination.
>
>Validated with igt@xe_exec_multi_queue@sanity, which exercises both
>the PXP-unsupported (-ENODEV) and PXP-supported (-EINVAL) paths.
>
>Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
>---
> drivers/gpu/drm/xe/xe_exec_queue.c | 11 +++++++++++
> 1 file changed, 11 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>index 1b5ca3ce578a..d5bc8994a756 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>@@ -1072,11 +1072,22 @@ static int exec_queue_user_ext_check(struct xe_exec_queue *q, u64 properties)
>
> static int exec_queue_user_ext_check_final(struct xe_exec_queue *q, u64 properties)
> {
>+	struct xe_device *xe = gt_to_xe(q->gt);
> 	/* MULTI_QUEUE_PRIORITY only applies to multi-queue group queues */
> 	if ((properties & BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY)) &&
> 	    !(properties & BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP)))
> 		return -EINVAL;
>
>+	/*
>+	 * HWDRM is the only supported PXP type today. It is display related and
>+	 * hence can't work with multi-queue. Reject the combination. The secondary
>+	 * queue path already rejects any PXP property, so this also covers the
>+	 * multi-queue primary which would otherwise allow it.
>+	 */
>+	if (XE_IOCTL_DBG(xe, xe_exec_queue_is_multi_queue(q) &&
>+				xe_exec_queue_uses_pxp(q)))
>+		return -EINVAL;
>+

Looks good, minor comment.
I think this check can be moved to exec_queue_user_ext_check() instead of here so
that we can bail out early instead of after processing all the user extensions.

Niranjana

> 	return 0;
> }
>
>-- 
>2.53.0
>
