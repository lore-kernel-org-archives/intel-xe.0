Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC69C43327
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 14:28:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 198E110E1F9;
	Tue, 30 Jun 2026 14:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HbXb+jLv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C013F10E1F9
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 14:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782829687; x=1814365687;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=US3YGgMmtoUMFytT6dsT1fp9nlsuWQDyfegpGF+QAb4=;
 b=HbXb+jLvH6wRcAaPqFCea1wKfxsQRbCS9tyhPRmmKmfwBuNvacE/P3YY
 kCkpVI/XvesfHgbV4ZSD0Mg68hi1hhpvLv6E80FyaUQ4eiT7EU6kLw2Pg
 zRHBGpy73UoKX2Gf+LikjA+jlqc2ucCjfU87Okg6WJBW8s3z2JaaLfhC5
 B+A+KCWDUzOLQ17WAX4XbiAcAk9lqPtjnbV7YBmqBMFXV/wXs2U15moTk
 yGPRQaKZYK8lfMAaBTBb74cL68dQiTKFkAjYHGeqLUp2DH0VhxhrWjN3t
 mZBk+/hlqoJr18zilEy08tsCr4u2w2UdRTNY3l6wEFSGKZKDqXIdl33u5 g==;
X-CSE-ConnectionGUID: 0l+38dzlSPKmorBvjXi4yQ==
X-CSE-MsgGUID: rn5KokBtSHWJntnK3MIf6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="82533562"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="82533562"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 07:28:07 -0700
X-CSE-ConnectionGUID: cld/UV/5ShSx+uiphgAbLg==
X-CSE-MsgGUID: zPnUDga2Tv2wtEmS/RbSPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="247812996"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 07:28:07 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 30 Jun 2026 07:28:07 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 30 Jun 2026 07:28:07 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.18) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 30 Jun 2026 07:28:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oIKoMml3KBYKXp3v2jexeAxlMSIujXyf+cxphMmUZ+fDgOVrqeoEKH2Hgf0a9/NlrtEOoczPzoGCDLbK21LlCstaJaxk2LLKoXSZmW/KXgDKSSVa+N7GtQpeyiAXKH1Gq6Y////a+4jyBkXBEy92e8aOUnqcCTnm4ZC2Tad7bx1naglIWTc2FyPxxzibGDXMOowEml/GSeAYXoU/g5L+d3JS9YqFJImpL41E9KicI7g81NhlqKQtpKifQx8KyUmEdXVIWqtR9UPJi9tMTKGUjPKdPVbJ3vKTA8cXEtFE5QEkZYk6wdjV94636mawiDP0RdtB2Oqegnqc2UxRuM803g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnN7y3v0jGGfBcSfwl5+JW5LAiuHht+9t0oUDPLzuzA=;
 b=cmlDuTam7qwtDwZkVyjlu44pt2aODvTm7VNathONqek6H08cN0hJqiM9sLk2X29SN70IiWwqY+hL0W9r0WYE+LeDQ92vGDphDkb+B5v12Z9Bnfoci7kBl0bADoLMMkmeY/8/l56liL0WA5vFKRa2ZcjuSvjiW2lvCabjYgvHnQvPuEc2kI89njLkkzinqhlHqG0IIMTEfgIfJRjRAMgAPSk5q+PPas2gahrmezLhS/j3LjCMFYDB3nrKptDlvJj3b12aBFM5aHhluK7/ajXOKX+1sXdaEoM40QSngN0qlWl3mdTw+J3y4E0FROrziCwSbA81g+OKX40axVqKm6CwUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4611.namprd11.prod.outlook.com (2603:10b6:5:2a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Tue, 30 Jun
 2026 14:28:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 14:28:02 +0000
Date: Tue, 30 Jun 2026 07:27:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Sk Anirban <sk.anirban@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <vinay.belgaumkar@intel.com>,
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe/guc: distinguish wedged from recoverable
 cancellation
Message-ID: <akPSbhNTu9iMA4J1@gsse-cloud1.jf.intel.com>
References: <20260624194618.2793571-4-sk.anirban@intel.com>
 <20260624194618.2793571-5-sk.anirban@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260624194618.2793571-5-sk.anirban@intel.com>
X-ClientProxiedBy: BY3PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4611:EE_
X-MS-Office365-Filtering-Correlation-Id: 88cdf413-fd43-4ec4-0bf6-08ded6b3caa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|11063799006|4143699003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: jipCyBY5YRjZsjcO7b6ezUGAzq7SkFSFuIZ82EnBtrsmY8Lu3sD6/Bv2idfpb70LmCPrkh+zOUdhAYCVDDRzyX09yYRVFgomqlxYOIJ8hB0mdrhlJCDDHdKPhxC8yOCM4wgmpim3e2yA6l53f0Rz03KFlmMBe5LPlRewc5Dq5rELHDeX1T5wRvoVkGBzR8gEOESybd5RVNn2Ww5qKrnM+LpGPpbftCjqZWPQsi+Mzb8uRKl4pMazqa9/MdwCA0DtBVXsQVNywkTkYmi8SeQw6ZtjVh6GZ2VfMumsM153CEE8irg6CKuoLf/KsOeTJxPBKS3NVSzBNH88cYtEQKNbgvV6CDCS7UCt/I321D+LvWrsmqpcjF5N/lTQpnsI7Li3GBKDGkwHO44UmZfegfuvuWzuLg4o39QfSD5AmsN/2MVz3q3PG2e+6rkXqM0AcZKdtj30nhJTdsNQaM5OL6Zi7E/Pj/HSGbymDrmHPKJiBes/OjBBdaxJIuaaqh/FBpOGhH6I17fkVAvDEGdHWoaTnPEt/h+HOtKXPRmZEyXvJgUhUn8yIHjcVRErPJtJWnNkQqBLkobtwp/i3eEiw8BP4h1yUpaFbEHle/fsepjmVIO7GR7QZIcfjKHdhjzu7qG3DAoxtE/ZIXQJPpPxGFS7Z9QX26KileyUpUmMnXbEDvU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(11063799006)(4143699003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P7yU35NxQ8Rwuc5/K50G5cMmdw+csm9AJ4INc1izOGz59HNqUn4RObUeGX4Q?=
 =?us-ascii?Q?OnSc2M7HLaPop/jZftmDAjkhneqRbBBeIpNHDw1as9Uw6i9Rzu8o+zOfctTN?=
 =?us-ascii?Q?vLmrOBf39E1Z+YGBIlz53uCtt3uTGga4tj+Chcmw2YG0k/LDVTCivjne4fqb?=
 =?us-ascii?Q?WfW58moacqbeAxehVSeXY8zLbDGCxrD+Ar0CoP+TaE+aouFzh3rGvreXsrOd?=
 =?us-ascii?Q?Wzf9eN8jwYDR2IfP4TWiC0NL9hUC8CgguLmques24fvFPnIEtbxdeducXelC?=
 =?us-ascii?Q?JcIPXM2yXHc113NOt1kLJEQyKo9auDx/m5cl5vakZV7VXcHRFK1rkDSVu5sE?=
 =?us-ascii?Q?FXF+BQGJLI3nf43ZCHiKy20D6uTtm9jnKugB8G5Vsqhdq3dR+rZyGUE9k58B?=
 =?us-ascii?Q?BwFYsQdbYIzF8XrMs0Dk1Ay4J5QWCen1LLEnHL8ZOI1OTYXgEZB/4y1yjCoz?=
 =?us-ascii?Q?kPuyiPuigpipqL/B4lFyJlbznghi9k8krkvbpWfQu84n2FhB0ONK3USk+HRJ?=
 =?us-ascii?Q?Guta053yS8i94HSij3V4mMiz2RIRRsOgXlI/g8Ud9Xs4uJ4pQz/47a+ikbon?=
 =?us-ascii?Q?RatsuY/zcJJTHb47op8Dwf4T1ITmeX+wohwUli29WYsOrebvg20UfmEASXkh?=
 =?us-ascii?Q?Kp3uagBLQaPZoe66Z27MojivhlvcGydeh2vhRZsgundZjY1EO+/zAcJsmHF1?=
 =?us-ascii?Q?XRTE1YVDJKA0KmpPigpiiOuv6V1Arfj/y8EfJno1v2S5JobTD9QL80eQz2pX?=
 =?us-ascii?Q?orpzbi6ZtxTPdYwBZhW/md32b7BdgIgUa5YaneyaEW9n94F4UG9qJyeXrWui?=
 =?us-ascii?Q?81GCZ6W6t5653p8kJuV0xW3DB8/+wnfdCbizdyNg482Z1/w3SmTF2qV95J/a?=
 =?us-ascii?Q?2VNBFKTvEFBEmsTE0Wp9dv7IIK9SI6mmqhIyqpVOkzlNi48ScIfRFQMVk9UV?=
 =?us-ascii?Q?qSG002TMbr/wI7uUqJUs+mJ006/8+RBWdxjjBv2vm4r85ZTRDnqZx4GAT6pq?=
 =?us-ascii?Q?xyGyx9sh9iMpXfuAY742AXR0kj1cv4M9XxYAT+nxhWM8Hxf8n/t2FSvENveW?=
 =?us-ascii?Q?EzaVwXVj/4CgSXxvgSE0DSxDfesY6wQaGCzZLhglrlkdtuHwf0saAQbeNYVm?=
 =?us-ascii?Q?+Ac31bVT+hODsXo0yMYpCqkl4K6jqNWViAl0zNn5svj3mYRVhiA5sImje4Pm?=
 =?us-ascii?Q?0svDkyPQDzYjePfwXcOhu/Z0CWOV3chPcWydAbmeHDI90Cy0f4j2Nsb/iKqm?=
 =?us-ascii?Q?iENj9NgkG+wj44e+fpgogTsYf+UpKVgVqeS8T8D+V0ZNphyCDHwR0PpWPtXP?=
 =?us-ascii?Q?eMxhgUxI1hnI2Tgh4qU5CbHhha2GCq8vcDEJFgV1whSbZyPDWiCBuwNYea6k?=
 =?us-ascii?Q?Ylyt6grepII7SGwu97tLXxBtfkwHJtZ5Hy7BEqRUvJTIlxHgZF3x/yB9zfUI?=
 =?us-ascii?Q?37MV0LPVdkA9UxtTUlrqv2qcyojWFxqAb5UXh+tG4tAIwY5Rik7JOifWA+++?=
 =?us-ascii?Q?yQkSdX2NMROKjRWRobCWLvpB8iOXRvttljFFF2nbqZQF5mpBUaB19I1aGWWb?=
 =?us-ascii?Q?fCY5QXvP9RXMI3buYHWja4x4pJfQph0kIKceO/Qv9rI1CAv2gwMtjixpkwPD?=
 =?us-ascii?Q?CkdDmMRKKyJACcEgeW7nh1vKPUGKWegTosl/faqnusTkdNBmny5nB6Tr+EKw?=
 =?us-ascii?Q?a5j64npYTQrf1q+vNm5b9C10yF0CbJv6jTiKCiJq9wk3Z6RBlS2GrevvxvJb?=
 =?us-ascii?Q?PFqnKISmUg=3D=3D?=
X-Exchange-RoutingPolicyChecked: asXgPxZW2wFlvDoPH/JBV4KDi2q906BTRhKcGvh95hlPSUVgnQ6GvcbVHoWtQQrlfBHO1TDbQlET88VStd1OOjKAsq4xZHKb20R2MLa6sYDVqqzcRLOl5wxn3kztLzEafz8sJnyEQt4nMel9z7dZ1OERC3H9O3GK+zKgFEa2HrULlOQeOXT/+DFIAIt8GtHDmPyKv72Dmqix6YwTZ6vT/nfMUMudVo+o4nvrR5Ju+MbXKTiLf6VXwfdTm7fwmVxE8e8BNWrSCXr7T7zQED+LDIQ7ijpCrM32kgdaxT6zt878oZqk4ErxpEvrw70c6DqchlmCd3mIIZN99tEtUoz6IA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 88cdf413-fd43-4ec4-0bf6-08ded6b3caa5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 14:28:02.2440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lVjL4R6jeZk4CKgBLGPWP9hXEK71wNv0lEQXhGXHLD7moiNLqQfoiHW1Pw3YjYsvCdHFhSK5vl9HDnOka8xb/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4611
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

On Thu, Jun 25, 2026 at 01:16:20AM +0530, Sk Anirban wrote:
> The CT layer returns -ECANCELED regardless of whether cancellation
> is due to a GT reset or a wedged device. Return -ENOTRECOVERABLE
> on wedge so callers don't need xe_device_wedged() checks
> to suppress spurious error logs.
> Also document the return codes of xe_guc_ct_send() in kernel-doc form.
> 
> v2: Fix -ECANCELED description (Matt)
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 40 +++++++++++++++++++++++++++++++++-
>  1 file changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 21e0dad9a481..8ca7d37c79b6 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1065,6 +1065,11 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  	xe_gt_assert(gt, g2h_len || !num_g2h);
>  	lockdep_assert_held(&ct->lock);
>  
> +	if (xe_device_wedged(ct_to_xe(ct))) {
> +		ret = -ENOTRECOVERABLE;
> +		goto out;
> +	}
> +
>  	if (unlikely(ct->ctbs.h2g.info.broken)) {
>  		ret = -EPIPE;
>  		goto out;
> @@ -1236,6 +1241,36 @@ static int guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	return ret;
>  }
>  
> +/**
> + * xe_guc_ct_send - Send an HXG message to the GuC over CT
> + * @ct: the &xe_guc_ct
> + * @action: dword array with the HXG message (can't be NULL)
> + * @len: length of the HXG message in dwords (can't be 0)
> + * @g2h_len: G2H response space to reserve in dwords, or 0
> + * @num_g2h: number of G2H messages expected, or 0
> + *
> + * Return codes from the non-blocking send helpers are:
> + *
> + * * -ENOTRECOVERABLE: the xe device is wedged. Stop submitting new GuC work; the
> + *   request cannot make progress until the device is recovered.
> + * * -EPIPE: the H2G CTB is marked broken. The channel stays unusable until the
> + *   CT is restarted, which clears the broken flag.
> + * * -ENODEV: the CT channel is disabled, messages not expected in this state.
> + *   Don't retry until it is enabled again.
> + * * -ECANCELED: the CT channel is stopped or a GT recovery is pending; the
> + *   message was dropped. Often benign. Cancel-tolerant callers (e.g. TLB
> + *   invalidations, GuC submission) rely on the stop/start flow to recover;
> + *   others should retry once the CT is re-enabled or the reset/recovery
> + *   completes.
> + * * -EDEADLK: no CTB room and the wait for space timed out. The send helpers
> + *   have already requested an async GT reset before returning this error.
> + *
> + * -ENOMEM may also be returned if an internal allocation fails; the blocking
> + * xe_guc_ct_send_recv() path retries that allocation. -EBUSY and
> + * -EAGAIN are internal flow-control results handled by the send helpers.
> + *
> + * Return: 0 on success, or a negative error code on failure.
> + */
>  int xe_guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  		   u32 g2h_len, u32 num_g2h)
>  {
> @@ -1388,7 +1423,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	if (g2h_fence.fail) {
>  		if (g2h_fence.cancel) {
>  			xe_gt_dbg(gt, "H2G request %#x canceled!\n", action[0]);
> -			ret = -ECANCELED;
> +			ret = xe_device_wedged(ct_to_xe(ct)) ? -ENOTRECOVERABLE : -ECANCELED;
>  			goto unlock;
>  		}
>  		xe_gt_err(gt, "H2G request %#x failed: error %#x hint %#x\n",
> @@ -1724,6 +1759,9 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
>  	lockdep_assert_held(&ct->fast_lock);
>  
> +	if (xe_device_wedged(xe))
> +		return -ENOTRECOVERABLE;
> +
>  	if (ct->state == XE_GUC_CT_STATE_DISABLED)
>  		return -ENODEV;
>  
> -- 
> 2.43.0
> 
