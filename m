Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61728CCD1A5
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 21:48:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0412F10E34D;
	Tue, 21 Oct 2025 21:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xe6YsdQm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DC210E34D
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 21:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761083290; x=1792619290;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9S3UxHBMAyhMJJfAniLpNyXxNYEcxD5+Mbq4GIcXhIU=;
 b=Xe6YsdQmX5hSCr7TyaU2CqBTiMGUz74b+CczZAMD9KbpFZNZ+Su+O9ec
 4wPpWJNH2GzbuKhZCcA0ihDn/Nn6Iv1V+GM5ffQ6taoEbhHuD6GOmP2IL
 FDZp92FFKWkoy4x/LnIIdYGTpZfzlo87D4Y0+SbquOSVQQpbqbKwvqZOa
 VHRacoBqPQSHWp/qQXwLNrl6zsUH0t0PkhOv1zx2IoYqS8zguD3qrMGw5
 4XZ3IHF7rclLjZI/OS0QxyaVAYL8CBo0ZmN/3ZFXrmDeWacnNi8UrpXYi
 j+fDzzF58anbTcvaaPdn+vOC+Wq1nPcWAX5Gh6piT2Vz1XYh+Xm8I9LNG Q==;
X-CSE-ConnectionGUID: kE8tSEeRQomPmRlPe9vCDg==
X-CSE-MsgGUID: IcfM3XrKR0e9fcaor4oOmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74341147"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="74341147"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 14:48:09 -0700
X-CSE-ConnectionGUID: ya0SesXfSXChHMy6kF/8Pg==
X-CSE-MsgGUID: kFcbONz4TZaKfYmhyxN2OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="184182206"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 14:48:09 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 14:48:08 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 14:48:08 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 14:48:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wFLsM1H+NXHE0tA04y1ZoZ+zPOCGMdwFTGPIOSbrKVra6ljvtVknULJNw3NEUBFfz9i+JLJJvw4415knEgtsesW9PDuPiErE4ShvctehK2DvFCKyLalXMD5AlBE3Ky8ICNfgQhuGjm5Ra5oxW79My6HHnnEbmXs3TTjujOwCui9SS0n/RVEFVCzbaJpubBbbv9USPstggyvDiPIr9fnKocxd7fMc6mgysBJDumrfOQB9dx9DJSklFby6qKWjL1qmQLvY7tnSpVhOoroWNNIXXxD1xy8HAEsFb1hcM5ytww3p+lkr+rsoX2LUSJBqedecCee/RHEGRVwYojQ8Gz1j3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9iWLtD2zcUSksUml8NqzQ8lOKKJqCO9H3g2epL2bzDU=;
 b=wz39mZ9mQF+g/lB2V9UV0SB0PN0HKfWOtrJ+JycQ2PQyusMDbD0qAIarJAcYagB54xXonSxbYzQel448z8T49oDZaX2vUdz9uEzyRLvwABjmLY21yZ+1kYWhu41NUhBaNXNp4nJqfyQ7l+CTIzEF1/zDM5dRZJ6B4VLsYq9OAWYGfIpnGjLwq8IMh7O2n5QakHovLcyosEB79BglFWpSEGkmN9wfM8yoRBwuab0/KNcHwXaya2aXjQU3mElqV0ejMYfYuUyJNVULVAAJsAbjgI02Utmr/uTreB2+U7YHuqoNhkNAYTrZ2142PEwOHCP7VY9YIIi9pdGq7VRpK/vVkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4606.namprd11.prod.outlook.com (2603:10b6:806:71::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Tue, 21 Oct
 2025 21:48:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.015; Tue, 21 Oct 2025
 21:48:06 +0000
Date: Tue, 21 Oct 2025 14:48:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe: Fix spelling and typos across XE driver files
Message-ID: <aPf/k227kIoDDgFM@lstrano-desk.jf.intel.com>
References: <20251021132054.840023-2-sanjay.kumar.yadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251021132054.840023-2-sanjay.kumar.yadav@intel.com>
X-ClientProxiedBy: MW4PR04CA0070.namprd04.prod.outlook.com
 (2603:10b6:303:6b::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4606:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ffd247a-2dc6-4242-def9-08de10eb8491
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bElEtU6QgmWGFdJo4mzy2ZCgU9VaHQmSqreGxaLNej3B+m26S2WQLart5JHW?=
 =?us-ascii?Q?GoSc4MLjILOnIUquqM2Eh/voWylh3nGlLPsB0rUndYfgy3C2gkFOvMm1ocpF?=
 =?us-ascii?Q?HY3ctezby1pOqYoVspAOG2vnLvC935FKbZHdavvYeRsnTRGbqQq4s0mHeczN?=
 =?us-ascii?Q?LPmKvLc37iOZh1KaOioZNzL/I5flNuPsIegPb5R9FVkFulfLSjNMH3zsR91o?=
 =?us-ascii?Q?Bt9pW7+qoKQPqnXV/UrT8lzCOD9qmsOx6gP3rZiD+uUL80bwRHmzvP7/d17y?=
 =?us-ascii?Q?aaHTQnhdUTD/eMDA5Bhh3dIeAw5/ybEnybVwVqRLU5Qi6bs8F7sp0pjuIb71?=
 =?us-ascii?Q?3O7CdeBfCpnjvhVr6HFSfjQH4rSUdH1mKqmeMIFbJmtFLMLMZ69bdLutHNMX?=
 =?us-ascii?Q?ZsKC8xVq9LyqH4jpj8NVEAJVIYZiVQFuk0Vnkf1zcK8mZLznF8yTcjayUAZI?=
 =?us-ascii?Q?+6U1cejFZgNyM5wB+JegGqiQN1XWA6tR6vBlVfYF4yQEV3/ul9pd+973EvKr?=
 =?us-ascii?Q?QvEQkuHv/Txs69D1OnvbXvQMZ75bKKifEDl+wIlSPlY2fyx22HVGA9wZH3fv?=
 =?us-ascii?Q?+68PvA57bAXQn5oKoaSz6l35a9XmId7eXP8dXCC84ws4rfsz6eBjitua4Osy?=
 =?us-ascii?Q?c6ry4+Sl8A7MVKLU2+RYoXBbxiGI+DEyvSCH3kdA0PpQC7bGtcNu9VfoATiH?=
 =?us-ascii?Q?oAYCQPKMdd9jSgwq8gvq90nst5ubZNeFEEe35njAdHNKCYYRxsxd6K7soRxj?=
 =?us-ascii?Q?SRHs9knSOsSRr+MTp6bchZrVraBAcqVCK4GAoYmHEj7Rs+fUqfPz8PHrIQhX?=
 =?us-ascii?Q?iAgXoN6EwSf/1ONFgth4f7gzXXhn/IqY6Lw0RkA7S1AM+/JwMuT/KPu4mSEb?=
 =?us-ascii?Q?1yPDYX50xitPcgmuS0fyEVlT36HWWlLz6sq8W5ljEG/txbF3C5A3K7lVXrnd?=
 =?us-ascii?Q?Qw4P5+5BjHR0NSKqVSMFptD10NI0W9CYtCgOkXXA7W42x57WXeimWCSqq2DD?=
 =?us-ascii?Q?hv4aZCqc+tAs7mLa5INHCMcU8wSzQyrzUl/Z+YVK6pBeAuUCwB61ayOCtNWi?=
 =?us-ascii?Q?LQAR/b4BOSHY8mqH33SN+5X1dFDe7DBKxYvKv6nK4GazCKC3mmnRX3IDKXg7?=
 =?us-ascii?Q?wFRGz0hqSRYs+yfiRhzXA/g3Z0AKhNDlbGvMuFAxMJppcFg4MbkuCWNYReWc?=
 =?us-ascii?Q?sP9CGqycCjDXfvMfX68sIe5XNQ9oZ2J0ycHXMp0aRJchsd2Xezy7wC/VkCkt?=
 =?us-ascii?Q?jIJ14/co5vp4vzCX0N/C3pOOHW+c4HvjPTWZ6lGmBfC9SWtD7chQ63ZKXYS+?=
 =?us-ascii?Q?vJA+21ctiKUBu+ebGBNZrY0cdS65jut0K3OybbV3kofZUq6iWAQ+r2SDN6cU?=
 =?us-ascii?Q?UxzLCbU7ALs7zqFbKx/RS5gBmzKcTxyv3KZZ1Q+IYvk/kxONt2gCY6MYx1TJ?=
 =?us-ascii?Q?ls7VztBvqjL+3rKbQvMYBogqoRLc0u/9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?guXDO1nhJnKoQjX00UxyMvUhdhNeKO++459ZGndI7IjcisyPJ4WCK27pPo9I?=
 =?us-ascii?Q?4QB2DjwfpALyzlSH+BLbZTTJtvF4r6Ds9Ehl27t1ic1ytjjxxC/kCEjUkNtd?=
 =?us-ascii?Q?dzgNsl3MHn4gmeo+WRL/3ZpT3FqAh5NfrMrg+ClYvNe64WCiPaOtbQv6pgXX?=
 =?us-ascii?Q?sA5XCNNJhdpVanMlhaDvR0OHgqLV/k+Lo7zp1tOPJVfIhsSSGKewD1RknTHh?=
 =?us-ascii?Q?Ip5Fnhlkjbt97+mlFc9ZtizXJm7bJ6tdpOphsKeXk3HtErq7Kktd20d1epsi?=
 =?us-ascii?Q?PmLh3yGGlt+2Xp+exanwljV2OGSEnlW0ZdyJHzUYoHbu2QqTa/8F8khqxEjW?=
 =?us-ascii?Q?RBJ+1Jwal8BkVf8EmAInF5QJSwHLrnJyuzRXlHooHBU0t48HEKxxHDYbLMpI?=
 =?us-ascii?Q?EnyQJKnOEFvDXHU7zH+xmKpugbq5X2gxXgCkBWw14nDxX/Yq8IaBoUpEnVLg?=
 =?us-ascii?Q?XR4dNMiEnOvxg7gtUeWcnK4s3XNGjhHQ5BkaGKGWDKl0MAeHUOIIa4o5YZ9l?=
 =?us-ascii?Q?iywPMe8dB5yAS6nztWitUkFPNeb6cazcnFJySmqMXyaH7NsLpxJBMFXOvJoH?=
 =?us-ascii?Q?j73nrs7mVxXu/L54LTsCX5qLDHtoJUO1D74InH3KLNur3Peb1s6xWUQjyAkZ?=
 =?us-ascii?Q?GCQ6+cCBZKd6jHiT9CFEnYjCo/0bXH/Y1jWzUGeK02/UIbIBnfiW6XBpN73a?=
 =?us-ascii?Q?2nGDP1hG5BGHOeZfJKVBRQYcz98cs3JKABDywN14cKQqe8lKGSpf7FMciZNc?=
 =?us-ascii?Q?XifvZbZ+ADCegO/6ys2jIQqcCtfqrr2CcarXEVvAHK0abp0ZgPUhNUKiItnk?=
 =?us-ascii?Q?uzIcH+tBH+ggdS7ayKNcgyV17Yg4a9YyiTkbKtyX7hvB3cYEc7kIuS8yZjRC?=
 =?us-ascii?Q?JZ2F5XpOyvA6iS9164Ta8GHYEOhhir/dpV5Fhr2xR/2FXNNcqzjXN3gKw2DC?=
 =?us-ascii?Q?uos7qpMZyjlo7RMWm1onjMR3YjODI4XiDXzWf6pLXIqkUwd4Y1G/W9MhcRgs?=
 =?us-ascii?Q?0fFZ9ngUEjGHjunih8y90iLX8fZJpGe6v1sks/JJHhtCfD0XISL8c5IBIbG3?=
 =?us-ascii?Q?78Lid9CEabSlWL1j+qdvel0tPzxsPR+d8xloZr2B/pu4c7fXhm3JbLgYBZdf?=
 =?us-ascii?Q?g/pjCRsnwJa6EkXeyCjBPnkGEmt/ZSiTxTgdYiB4mU6IRsenCiqLQiwG8xn3?=
 =?us-ascii?Q?4YeRYpFaohkDdi1q9gtS1VCGoFL4lYVEjjxWOSAO+LG+0unsihEw1GbuzydP?=
 =?us-ascii?Q?TeaC4+LHfMkwbRVbebQlwyMjNbkLKdkcyK4sOxOvXaBCugD1SdQGOp9qOxUd?=
 =?us-ascii?Q?SSKNs9OQJ/Bg0DS5cqugoTiHClY/KQyAlB9VW9PY4QtHb2D856l/CKdKq1Cx?=
 =?us-ascii?Q?l1qSRhzS8AEmRZWZArSX2mjEj3EVj5CFGAezQ+V5WITGXoIFuB3Ba/iBQHCT?=
 =?us-ascii?Q?io8DhzKG9MBJlw8gHedLxA8R4DMljO49bblI9uKAM69LI2EKn1tv7Y6IVkkV?=
 =?us-ascii?Q?4vv+t0kFmEt7RcsgBUyXCJbRTvKVBRwvqOxiRETCcl+0AbVJ8F66O0uqLzZR?=
 =?us-ascii?Q?pN3bGt7BdBNKO+H8IhnL2VqxM7JRPHEInKBp5CVndnC5P6gKo8/clRk6S/x6?=
 =?us-ascii?Q?tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ffd247a-2dc6-4242-def9-08de10eb8491
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 21:48:06.2364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g/7VAtVpfI7fd0LhQb1sfnnsFGc7Zuycmc6ggRTVoIDhXopHGIZB+DOJ/T2U7UksV7PhCD32aNKr09RMewil2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4606
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

On Tue, Oct 21, 2025 at 06:50:55PM +0530, Sanjay Yadav wrote:
> Corrected various spelling mistakes and typos in multiple
> files under the XE directory. These fixes improve clarity
> and maintain consistency in documentation.

s/XE/Xe

This how we refer to our driver. We likely have multiple instances of
'XE' in doc too, perhaps clean that up too.

Matt

> 
> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c            | 4 ++--
>  drivers/gpu/drm/xe/xe_device.c        | 2 +-
>  drivers/gpu/drm/xe/xe_gt_freq.c       | 2 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c   | 2 +-
>  drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 2 +-
>  drivers/gpu/drm/xe/xe_migrate.c       | 4 ++--
>  drivers/gpu/drm/xe/xe_pm.c            | 2 +-
>  drivers/gpu/drm/xe/xe_svm.c           | 2 +-
>  drivers/gpu/drm/xe/xe_tlb_inval.h     | 2 +-
>  drivers/gpu/drm/xe/xe_validation.h    | 6 +++---
>  drivers/gpu/drm/xe/xe_vm.c            | 8 ++++----
>  drivers/gpu/drm/xe/xe_vm_types.h      | 2 +-
>  12 files changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 7b6502081873..c899a895492e 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2105,7 +2105,7 @@ void xe_bo_free(struct xe_bo *bo)
>   * if the function should allocate a new one.
>   * @tile: The tile to select for migration of this bo, and the tile used for
>   * GGTT binding if any. Only to be non-NULL for ttm_bo_type_kernel bos.
> - * @resv: Pointer to a locked shared reservation object to use fo this bo,
> + * @resv: Pointer to a locked shared reservation object to use of this bo,
>   * or NULL for the xe_bo to use its own.
>   * @bulk: The bulk move to use for LRU bumping, or NULL for external bos.
>   * @size: The storage size to use for the bo.
> @@ -2629,7 +2629,7 @@ struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
>   * @size: The storage size to use for the bo.
>   * @type: The TTM buffer object type.
>   * @flags: XE_BO_FLAG_ flags.
> - * @intr: Whether to execut any waits for backing store interruptible.
> + * @intr: Whether to execute any waits for backing store interruptible.
>   *
>   * Create a pinned and mapped bo. The bo will be external and not associated
>   * with a VM.
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 5f6a412b571c..47f5391ad8e9 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1217,7 +1217,7 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>   *
>   *   /sys/bus/pci/devices/<device>/survivability_mode
>   *
> - * - Admin/userpsace consumer can use firmware flashing tools like fwupd to flash
> + * - Admin/userspace consumer can use firmware flashing tools like fwupd to flash
>   *   firmware and restore device to normal operation.
>   */
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
> index 701349251bbc..e88f113226bc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> @@ -36,7 +36,7 @@
>   * - act_freq: The actual resolved frequency decided by PCODE.
>   * - cur_freq: The current one requested by GuC PC to the PCODE.
>   * - rpn_freq: The Render Performance (RP) N level, which is the minimal one.
> - * - rpa_freq: The Render Performance (RP) A level, which is the achiveable one.
> + * - rpa_freq: The Render Performance (RP) A level, which is the achievable one.
>   *   Calculated by PCODE at runtime based on multiple running conditions
>   * - rpe_freq: The Render Performance (RP) E level, which is the efficient one.
>   *   Calculated by PCODE at runtime based on multiple running conditions
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 46518e629ba3..382083675021 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -739,7 +739,7 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
>  		gt->sriov.vf.migration.recovery_queued = true;
>  		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
>  		WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, true);
> -		smp_wmb();	/* Ensure above writes visable before wake */
> +		smp_wmb();	/* Ensure above writes visible before wake */
>  
>  		xe_guc_ct_wake_waiters(&gt->uc.guc.ct);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> index 6bf2103602f8..a80175c7c478 100644
> --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> @@ -207,7 +207,7 @@ static const struct xe_tlb_inval_ops guc_tlb_inval_ops = {
>   * @guc: GuC object
>   * @tlb_inval: TLB invalidation client
>   *
> - * Inititialize GuC TLB invalidation by setting back pointer in TLB invalidation
> + * Initialize GuC TLB invalidation by setting back pointer in TLB invalidation
>   * client to the GuC and setting GuC backend ops.
>   */
>  void xe_guc_tlb_inval_init_early(struct xe_guc *guc,
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 3112c966c67d..7d60c7c09f33 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1981,7 +1981,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>   *
>   * Copy from an array dma addresses to a VRAM device physical address
>   *
> - * Return: dma fence for migrate to signal completion on succees, ERR_PTR on
> + * Return: dma fence for migrate to signal completion on success, ERR_PTR on
>   * failure
>   */
>  struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
> @@ -2002,7 +2002,7 @@ struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
>   *
>   * Copy from a VRAM device physical address to an array dma addresses
>   *
> - * Return: dma fence for migrate to signal completion on succees, ERR_PTR on
> + * Return: dma fence for migrate to signal completion on success, ERR_PTR on
>   * failure
>   */
>  struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 210298c4bcb1..4f8688fd3f00 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -102,7 +102,7 @@ static void xe_pm_block_end_signalling(void)
>  /**
>   * xe_pm_might_block_on_suspend() - Annotate that the code might block on suspend
>   *
> - * Annotation to use where the code might block or sieze to make
> + * Annotation to use where the code might block or seize to make
>   * progress pending resume completion.
>   */
>  void xe_pm_might_block_on_suspend(void)
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 129e7818565c..13af589715a7 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -633,7 +633,7 @@ static int xe_svm_copy(struct page **pages,
>  
>  	/*
>  	 * XXX: We can't derive the GT here (or anywhere in this functions, but
> -	 * compute always uses the primary GT so accumlate stats on the likely
> +	 * compute always uses the primary GT so accumulate stats on the likely
>  	 * GT of the fault.
>  	 */
>  	if (gt)
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.h b/drivers/gpu/drm/xe/xe_tlb_inval.h
> index 554634dfd4e2..05614915463a 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval.h
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
> @@ -33,7 +33,7 @@ void xe_tlb_inval_fence_init(struct xe_tlb_inval *tlb_inval,
>   * xe_tlb_inval_fence_wait() - TLB invalidiation fence wait
>   * @fence: TLB invalidation fence to wait on
>   *
> - * Wait on a TLB invalidiation fence until it signals, non interruptable
> + * Wait on a TLB invalidiation fence until it signals, non interruptible
>   */
>  static inline void
>  xe_tlb_inval_fence_wait(struct xe_tlb_inval_fence *fence)
> diff --git a/drivers/gpu/drm/xe/xe_validation.h b/drivers/gpu/drm/xe/xe_validation.h
> index fec331d791e7..1699b9ea16a9 100644
> --- a/drivers/gpu/drm/xe/xe_validation.h
> +++ b/drivers/gpu/drm/xe/xe_validation.h
> @@ -108,7 +108,7 @@ struct xe_val_flags {
>   * @request_exclusive: Whether to lock exclusively (write mode) the next time
>   * the domain lock is locked.
>   * @exec_flags: The drm_exec flags used for drm_exec (re-)initialization.
> - * @nr: The drm_exec nr parameter used for drm_exec (re-)initializaiton.
> + * @nr: The drm_exec nr parameter used for drm_exec (re-)initialization.
>   */
>  struct xe_validation_ctx {
>  	struct drm_exec *exec;
> @@ -137,7 +137,7 @@ bool xe_validation_should_retry(struct xe_validation_ctx *ctx, int *ret);
>   * @_ret: The current error value possibly holding -ENOMEM
>   *
>   * Use this in way similar to drm_exec_retry_on_contention().
> - * If @_ret contains -ENOMEM the tranaction is restarted once in a way that
> + * If @_ret contains -ENOMEM the transaction is restarted once in a way that
>   * blocks other transactions and allows exhastive eviction. If the transaction
>   * was already restarted once, Just return the -ENOMEM. May also set
>   * _ret to -EINTR if not retrying and waits are interruptible.
> @@ -180,7 +180,7 @@ static inline void *class_xe_validation_lock_ptr(class_xe_validation_t *_T)
>   * @_val: The xe_validation_device.
>   * @_exec: The struct drm_exec object
>   * @_flags: Flags for the xe_validation_ctx initialization.
> - * @_ret: Return in / out parameter. May be set by this macro. Typicall 0 when called.
> + * @_ret: Return in / out parameter. May be set by this macro. Typical 0 when called.
>   *
>   * This macro is will initiate a drm_exec transaction with additional support for
>   * exhaustive eviction.
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 10d77666a425..4eefe902f8a4 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -824,7 +824,7 @@ xe_vm_ops_add_range_rebind(struct xe_vma_ops *vops,
>   *
>   * (re)bind SVM range setting up GPU page tables for the range.
>   *
> - * Return: dma fence for rebind to signal completion on succees, ERR_PTR on
> + * Return: dma fence for rebind to signal completion on success, ERR_PTR on
>   * failure
>   */
>  struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
> @@ -907,7 +907,7 @@ xe_vm_ops_add_range_unbind(struct xe_vma_ops *vops,
>   *
>   * Unbind SVM range removing the GPU page tables for the range.
>   *
> - * Return: dma fence for unbind to signal completion on succees, ERR_PTR on
> + * Return: dma fence for unbind to signal completion on success, ERR_PTR on
>   * failure
>   */
>  struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
> @@ -1291,7 +1291,7 @@ static u16 pde_pat_index(struct xe_bo *bo)
>  	 * selection of options. The user PAT index is only for encoding leaf
>  	 * nodes, where we have use of more bits to do the encoding. The
>  	 * non-leaf nodes are instead under driver control so the chosen index
> -	 * here should be distict from the user PAT index. Also the
> +	 * here should be distinct from the user PAT index. Also the
>  	 * corresponding coherency of the PAT index should be tied to the
>  	 * allocation type of the page table (or at least we should pick
>  	 * something which is always safe).
> @@ -4319,7 +4319,7 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
>  			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va), NULL);
>  		} else if (__op->op == DRM_GPUVA_OP_MAP) {
>  			vma = op->map.vma;
> -			/* In case of madvise call, MAP will always be follwed by REMAP.
> +			/* In case of madvise call, MAP will always be followed by REMAP.
>  			 * Therefore temp_attr will always have sane values, making it safe to
>  			 * copy them to new vma.
>  			 */
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index d6e2a0fdd4b3..afde0e34eab2 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -52,7 +52,7 @@ struct xe_vm_pgtable_update_op;
>   * struct xe_vma_mem_attr - memory attributes associated with vma
>   */
>  struct xe_vma_mem_attr {
> -	/** @preferred_loc: perferred memory_location */
> +	/** @preferred_loc: preferred memory_location */
>  	struct {
>  		/** @preferred_loc.migration_policy: Pages migration policy */
>  		u32 migration_policy;
> -- 
> 2.43.0
> 
