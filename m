Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBECBCEFC31
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 16:35:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B759110E591;
	Tue,  8 Oct 2024 16:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZQc+UAAK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2798B10E591
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 16:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728405308; x=1759941308;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tckEE0VEAbVqVTGh5PEZq4kYqiZU2Aj8RwgDsLVEnsE=;
 b=ZQc+UAAKffHAEhEHxOPTR1oE80zIwFZ030rvUECNGUSl1FueSYJ2ptXp
 4GHzYGyOSHFQsEJQPaLvJ/G8CkNkLSzq6FxA3GxUCKxI9SP79m2+rMHvF
 Sqq5eNNXusiobQrroZyTsGFnXVTExslwiHFFBlVJbBbYmFeOeU0KnSleF
 vupdRcS0PSx0WJj2so8cOjDrOIMlNgRnpcOQ3Ywk1MO8QHLQgBC2UxoTs
 mf3ZecSrijGc4jtlBWt+VUmS7FQ/YDidLjPCu6kKkWBWGg2YimNWOVwyp
 PnTHzaHe+0iqVDmDrjnPSqKgqkPdAN6e1d5sXxyP0w6XHfQrQdq4Lll75 Q==;
X-CSE-ConnectionGUID: FHnMyCOoQQmNAHrqLhAk3w==
X-CSE-MsgGUID: CMnGDvCzSD6nLiFGfB6NWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27711155"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="27711155"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 09:35:08 -0700
X-CSE-ConnectionGUID: J8ggICf7RiGZjbhly01nWA==
X-CSE-MsgGUID: 2q+RZXyaTrqsr+LNjdUuWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="80748472"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 09:35:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 09:35:07 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 09:35:07 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 09:35:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ELrIbJcnrGXApLPNAdYaa4nBZIxOSfFVVYlKWrZlfVleFbwavoZKvpiE0UY2uM5Ec7EDGyNE3RM58nABjp4biQn9tVAZ4eIA1UsY5Ry/JTlRUUaRxJcGeUn2b9sOB1KrV9gOEpJ918vTyMaS7rEHdO71QVo4XOZgJJ4Jz333S45q4TG4Pv8A4irQNrHmplemc9XCaw+oYv/C9Exwx9dGd9QJ2JiK1GhfLjqceEs9Hxj4uazR5AoWLQXHh4G+lyUribx/O1Vr6vfJGvzKLGUJZBfh1L+CNeR/JsOwI2Xj174hd4EGSRdTOFHH6CgUls1SPwJyuRXZ42H4zuQYchRbSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6MvO7fte7b8l1fknSSqfNe3OdyhYSHKxlOY72v7+TA=;
 b=WwiQ3NXEMnKQdhv9rmlpQnElPT/oWmVGoqCqomDiNzViqDyyswY73uQj2cgVL/yicvjumWDQTFXfM0JDt9I23vD5EAV1sBPaiPXI7pYuTLnN4IShg0S9Ed0/Qf6Qra3yIp55c/lpl7oNAqo3V0HZo+X3pXm3ibanUgfBlYHZ2T3Um7cfLphIjcM8ubV9B6QSP93lzBGszg9VUoyzN36/Pe8uOwB8Tuf2NVz+6in7xP6JG8UqnO+pKCSw4yLTtn5HgTPRjDeC9y8xV3+wjaA2bzm2pSEOJCEWx1CCTW91EBSc/j82WCw6rVer2Hwb9Fj62NblxNcp5d85Ah6qW1D+Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7241.namprd11.prod.outlook.com (2603:10b6:930:94::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 16:35:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 16:35:02 +0000
Date: Tue, 8 Oct 2024 11:34:59 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe: Set mask bits for CCS_MODE register
Message-ID: <ebjfdpufgjiby3sv7jc4kogtv2jtvdgi62i67dsoo2ujxkevit@rdjbimol2nb2>
References: <20241008073628.377433-1-balasubramani.vivekanandan@intel.com>
 <20241008073628.377433-2-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241008073628.377433-2-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: MW4PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:303:8f::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7241:EE_
X-MS-Office365-Filtering-Correlation-Id: ad8309ea-88d0-4b14-9a78-08dce7b7283a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?55dKsfw6tb/BPgSy/aXNYxfh5Fvvt4pPYcAIDiEsfgOEPOPZ5C7uHcJ3kRPx?=
 =?us-ascii?Q?mPXwQ1yXyX3ucLm4hgpCbFGUNIc6PFU4mK8XelHm/1lfZneMBE+gPGS2PZ77?=
 =?us-ascii?Q?upm3SH9SzisSGXeNT+LTSklqsdKhXTaAvRi8XYzgUH0qrX+DxUyGARyuwmvy?=
 =?us-ascii?Q?bbJ4evChAd+0Hdot4AJlbCoy33PxM1cSGlj2zFVeyir3HBdovG+CKB6kIzkI?=
 =?us-ascii?Q?PZUMMCUlVmOKxL9RAW1Ss6gEGag+G5tquFZjyqmtNc6AsmndupdFWM5GLD2Y?=
 =?us-ascii?Q?kk1HGcdCypHbF/t5prBC4hyXKJgfQB4afBlfxEPD5vnpJoljTN32utSjoUKd?=
 =?us-ascii?Q?YJ+M+LG/cBKxgFgH7DXLQBjruohHyQ03nXpaArbPpJzpJHAc7HjKf46G4o8r?=
 =?us-ascii?Q?7a28dFiRCamoo6f4AsOM/HfRQlN/d8Bq3iQvdTrqNoCq60cs3jqZnsCi8a89?=
 =?us-ascii?Q?crpmnS3vfq3Yj7Ob0sdrFmevn8ykafOSFdZf2zJAJTKuSnyplkiGlBaV22R1?=
 =?us-ascii?Q?46eGqG6g0FVKPopvRxZw70riU0nuHieBdDkEOboQCL7ZafwEwnZQuqPdoea5?=
 =?us-ascii?Q?pw+CDwz4xrSOCQFxfY32Ov0BU7nCcgcXrdePYiTQDAaxtbd/S/HPCLSuCd2K?=
 =?us-ascii?Q?IsIwjZUZNIzEIumvAJJw5pfmKmRydXECr3my/MR5rgyyhuGxV61kMuxEDWq6?=
 =?us-ascii?Q?vXKOKijcIHfhLUexb3fFdDGgtvt+xGlNGwCnJPb9eFSbxtoijPSZVnl6X6Np?=
 =?us-ascii?Q?3HiqGo1NPB/h/5yrhXHRZVReVYbN1/ik+5YbqQvg8NF955qKekWi20H9QaVK?=
 =?us-ascii?Q?h+298NC3fyiBaHmlYLNU0J7iuFIlPRB9kUBnIKEB9YbiclIbj2D0W2O+pNzy?=
 =?us-ascii?Q?gRhrybJqSOzwngLhgkWzsBN/43z3wSp8Mg+LG9xponeozfFDmvc8AX5OS5Et?=
 =?us-ascii?Q?VCf8bOONcPFgdl5AN4jEaPI0GhYyCqPHibe3QvdMynfc74s2ZY2ovjx/PGg1?=
 =?us-ascii?Q?plT4j5EOvn9dWOOvD3kSZtad21XewltWSG0FY3BT3I/hDXBqds0DfKi2lX5o?=
 =?us-ascii?Q?6Qq72Ggth945Je+L/RLTGs531xJaJkiCrMBLtQFQzB7JBd8ZEDhPied4zPmS?=
 =?us-ascii?Q?kzfVgFUMkiI5yAl5BInMd3bxREb/3Ws4TZsUsHwTE7lIEpU71g2wdh4euEXn?=
 =?us-ascii?Q?DsmnZref7N7Iy225dJn5GP9e3Vmm9H4FKkM87XitsSz2RmfHNtaNZdTy5r+A?=
 =?us-ascii?Q?EzmRfsLZJGBeKwr1JFR5NtKfMZ47q31Eulzjw0HG4w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ExSnAuVlmHeS7fIRlranPP5k5LKhKgDZCFblY2nsqDtvi1B7TpMxBWgi4on9?=
 =?us-ascii?Q?2mwrh52UcjLW66S01+pvVvGyxGEFCNH75ZuutSTESlTKE4muHvG1qrPvBMHY?=
 =?us-ascii?Q?H/7Hctc3Pm6T5KsHelw9Kyw2m2AiLBzUb/Qcte2DcQqpF/m2Vp7KXuhAZvbS?=
 =?us-ascii?Q?E184dWRRnKucKf6Ou9ODq4I5bxnCIhUudBaAgEEcHbbAkCOYTPFQ5TgKq4lK?=
 =?us-ascii?Q?2kMoeOe8hlZuVILVMSAk+rnFC7UxRpPwEtNNI3e6+fJhV4UftmvWQ8rVxCXN?=
 =?us-ascii?Q?+2TbqgLimIwhUJNufI6uY/MaYhrw9fJ/TZcU4SbY2m1XbyKQ3WihqkrTwzW+?=
 =?us-ascii?Q?2GWGF6M+qpstP7Malm8mXvPjZjzlURq6YnUGyOLUWuO/3xD+c8HSHNtN6bM4?=
 =?us-ascii?Q?iZRQhzm0wL6ObIti8SqvGQMK+dRTPXeVJdV6AAKpqfScJCSpV0d4+XLFDswi?=
 =?us-ascii?Q?Av4lplLyNb3lCTm3YjuelJ73IG4nH8and9i76S9gP9AEQs3lTmbNeedjwMEe?=
 =?us-ascii?Q?4ixI5IoNFzXccvC0BY+nGp5rYzYJbEeVBiDj1x9hAzpjTyuBDmpqx80ZmmbF?=
 =?us-ascii?Q?9cFfbVKG1ovZ2RkNCy/fi8gR3TCImknu83TgDmI5ILhwBqPymJlRW0Yg9IOv?=
 =?us-ascii?Q?7pNQ6RrdQl3j8PpoPdL14U9L18jautjPx+n3kJ5/JHP0cEOsuaSj+lmvqmFu?=
 =?us-ascii?Q?oay87cd7l24FgIgAJrnuSI9QUJ6l4smlygnAqjdBanDi0EvJ16P4l3sNt64R?=
 =?us-ascii?Q?wDpPL40xX3dl20El6qnJBXch6JMr6unPHjR7+P44E2vGbFJsqSp6qUIr/0Bi?=
 =?us-ascii?Q?A+6RvrYAK5hgF8TdhTCAbA9oa4eN5Vo1Vdmub7sQ/YRgEQ80ciNFs/0s6+BR?=
 =?us-ascii?Q?pZv6ZXywj44nw+yITCGVDctUrAR1wwcbSbmk+seZBSdJ4M+b3FQtp1wKrebK?=
 =?us-ascii?Q?2dZIniVsuNai/QI42AXmMlfG+Yk3ih49xVKkmwbNqUvDn0FvujpXgWhNaNen?=
 =?us-ascii?Q?PpDcMQjPXiTJ9QVfYKy7j/6WE64nXIYgrDQ0OHBe2GANk8jfbZgiyIKwQCEZ?=
 =?us-ascii?Q?aujg7ng66hlAJCgYd1ldCnrGQRUwUGOm6Z6DwV1ElCklczy3z+4PIg+OkJdy?=
 =?us-ascii?Q?KxDrvSPwtKU2XykSVYgXbey1c4kG8gXzHakXE/jIvnKeJ2i4YLrEs5XyDWRp?=
 =?us-ascii?Q?2VTPLA48kTOAj2goLxeQi7rjrm3frzUM5hfCCyWCqu8/lC+VAMmjZsgfaHmL?=
 =?us-ascii?Q?tpYR479UGnvSuLbG4JHwF2ATn/tChdyl/B6gzdJab5rrLNW3HYZACK3Ce0Ss?=
 =?us-ascii?Q?MsYndgONd1EJefaMCUCzFfxdTlqUyrO+ngwd50I5+hcIxRQdSlSaC2AtcA2k?=
 =?us-ascii?Q?gByMv4ldbBvuUqPZZF06oC80Y//el35/VpRnPXtCaynIqB+4N9SDSIofSGuo?=
 =?us-ascii?Q?peIDDFGuUFDYRKGJp9Z++zkIrGMJhYmr8p6ws7i296/ebqejgnkIUpGyWL4i?=
 =?us-ascii?Q?008YEE9Sg84ge74amEC/0CQfLteGlnwEE6eCFTtJyzg1qCmxxYMgvEosCvqY?=
 =?us-ascii?Q?LZ8mPut0nUJqStfy8x1E8f1UXjl2cJbsQr0iXeSpBWC0/9XI1Q9HjoPHmQF5?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad8309ea-88d0-4b14-9a78-08dce7b7283a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 16:35:02.1628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lDKGBin6i8L/d1KkBpbZ44S12HOP36UpI5ZnzU6qBGgm8KSBK1Fxt2CsqsamQHTLsEXyWSGhBt1hazZkWIt8CU5U0dGaWUu8a1BvUNQqBgE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7241
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

On Tue, Oct 08, 2024 at 01:06:27PM +0530, Balasubramani Vivekanandan wrote:
>CCS_MODE register requires setting mask bits from Xe2+ platforms. Set
>the mask bits unconditionally, as those bits are unused for older
>platforms.

xe_gt_ccs_mode_enabled() doesn't agree with this statement and
we do use PVC and DG2 for tests.

Lucas De Marchi

>
>Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 +-
> drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 6 ++++++
> 2 files changed, 7 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>index 9dd70934ca15..e136b663af98 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -562,7 +562,7 @@
>  *   [4-6]     RSVD
>  *   [7]       Disabled
>  */
>-#define CCS_MODE				XE_REG(0x14804)
>+#define CCS_MODE				XE_REG(0x14804, XE_REG_OPTION_MASKED)
> #define   CCS_MODE_CSLICE_0_3_MASK		REG_GENMASK(11, 0) /* 3 bits per cslice */
> #define   CCS_MODE_CSLICE_MASK			0x7 /* CCS0-3 + rsvd */
> #define   CCS_MODE_CSLICE_WIDTH			ilog2(CCS_MODE_CSLICE_MASK + 1)
>diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>index 9360ac4de489..246190b3e2bb 100644
>--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>@@ -68,6 +68,12 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
> 		}
> 	}
>
>+	/*
>+	 * Mask bits need to be set for the register. Though only Xe2+
>+	 * platforms require setting of mask bits, it won't harm for older
>+	 * platforms as these bits are unused there.
>+	 */
>+	mode |= CCS_MODE_CSLICE_0_3_MASK << 16;
> 	xe_mmio_write32(&gt->mmio, CCS_MODE, mode);
>
> 	xe_gt_dbg(gt, "CCS_MODE=%x config:%08x, num_engines:%d, num_slices:%d\n",
>-- 
>2.34.1
>
