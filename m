Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B96C83F1A
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 18:12:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2124710E08C;
	Wed, 23 Jul 2025 18:12:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VM7GLepc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B746C10E08C
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 18:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753294361; x=1784830361;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FLd/vmFQt6ndUWB8DwTHSeOD1p4JDEWa5+523zVW4LU=;
 b=VM7GLepcH/2wESCvxAtV3mrLQSbLso+luReb2t1eN9pxyz+AqtBMz0TY
 Hpf3Ar3bxE7+F+i2bwtc50TV60wPNRDQrul64U0kZj8mmYjIUv5eFaP5c
 XgPNFO3rt030ruUdfqkSKjTMo307TASPjdBy+8YfLomCa7o/xTIqx65Gu
 bK/Zu/FLK0xnzHqm/GV1cdBTQ82ccIsajqKGrnoxxioyJMSkfTvKS3FV0
 2TkBcQnBqkYWeZPZnSnokPBvZuwo0wIBuL3wJuuTPTtukDc2/sukeA5Hs
 JB8SpMlFa3mzT8sYpbJwBELkoI8hVCgHmsfbLZUdxWU/52vk47XsnUK90 Q==;
X-CSE-ConnectionGUID: haUlr1S8R2G8X6gUscDGoA==
X-CSE-MsgGUID: WTSGb9tHRNKM4r8Iiiq9vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55685857"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="55685857"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 11:12:38 -0700
X-CSE-ConnectionGUID: jPv8SwyBTTWrY8jB8tR8qg==
X-CSE-MsgGUID: cgzbi87STc2yKWayd49xLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="165136031"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 11:12:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 11:12:29 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 23 Jul 2025 11:12:29 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.55) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 11:12:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w7vKcyyDm3V3LiwPZ1RSf+IbFCoHHdtlbRxhTyufXKhRiFNeHbfRU7Vjve6q1e5VMCucaICcpPgrFeKcENe1D5AZWIJ6DuuaEo8nct1nTqQUeVCU6LqEMIY3fn/Gtgn8fQfoJISkdDlB3z+AyEtd0Bw/RtXZTdFHKGhWbFrde5xAg173QRv64zXILdJ/xzne5VPe4qbEmSHiiGajswwgzDRZe2Cv6YA0ZT+ix5F8FBWRBIN/uD+GWcrJ7tw9k05Q2PYI3g8IPAvqVsB+Obc07yr5vwMZX3x9k+EEJtNU8J0g0EVw6rkdHOfkB+vb3J7WiUBGz6cuB90t3SnSDLspDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FdE0kIMFtsiALElviLsUuV4YG7YewXsnxhZiYjcbees=;
 b=P9+ayRsV2gdJVtmNfUx9Lp5aThAs44RLVbCQkEkEytJFzIF78bedY8hbOiGJh49WwyEhzEoAEMbulqvBy73xJTD/5rmcs+SMyUP+pbOWy7UCyDfkEIEO+taBXWMsXqJHLBHzW+EO7Uha8HLch7Cff0o7vsu5McY+CQZvbSKBfVdRFgEJeURAJIOmlYByynkn4v2Id4rhQWgm0NbAOGIVO76xclhP2n0fZfyxIdtajOS8NX+zx4Am59IGS80H2CKIKJp2qH9xHySIcU0nZwyW9iqF/4qQP59nEVwBp6jbSeb/laF0lhHP0Pyr+57aIIWBmR0NmQAc0FWYZaSdnSOrwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5197.namprd11.prod.outlook.com (2603:10b6:a03:2d1::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 18:12:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 18:12:27 +0000
Date: Wed, 23 Jul 2025 11:14:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH v2] drm/xe/guc: Clear whole g2h_fence during initialization
Message-ID: <aIEmd5zAqMtVMPIB@lstrano-desk.jf.intel.com>
References: <20250723165717.206730-1-michal.wajdeczko@intel.com>
 <20250723175639.206875-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250723175639.206875-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW2PR2101CA0025.namprd21.prod.outlook.com
 (2603:10b6:302:1::38) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5197:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f62227a-9ad1-4283-57f2-08ddca147b2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZiN6WF12oGzXfh7eUhLOkd4DFstdBaMNPYANx+95K7zy+WhoAFTASlf926FQ?=
 =?us-ascii?Q?OuuOXvIVc0nfwsFYEfbJ/z1NY0pJ2Q/jjiCxjrcEQEejovezWkUhokr/vIZO?=
 =?us-ascii?Q?EQqKLw7DaPBoTQpl4Hpgi2Ham3c6UfAnT7Qnkm7W04RRHuFrmFggGrwhHdRj?=
 =?us-ascii?Q?FQB03xaqUYKxcdqQcqt7+fLb8l2iahJS0R6dpopfmAQqLxuBfMKRUMmPiMUI?=
 =?us-ascii?Q?4APqbo96zRjzpA0ptrfNPmnks3k3aTH+fgjceXfIguGU+YPMWp+AutBeXcFt?=
 =?us-ascii?Q?Z0A4icloXs6Ktv9S7mL/3aHgYqptu9xG+NUGS4kpI2OwW11R7/DISl5kpEXF?=
 =?us-ascii?Q?Z06PtCcVwerwXUmqAJNlalmwZNT/tA9E+vDcuF6eQtDhzGFL5M8Rv77DylGq?=
 =?us-ascii?Q?Eq8oxmHupGhDUu8i4x2+qKPoXrOY6aiienSMXN+DIMbANln1VivLZc+ZWrsk?=
 =?us-ascii?Q?1e5y1NLvYtKT5sXPMujjAnyxI0rolDtWbd2VlQ9AsgXDnQ91eJy1kzVXOuVD?=
 =?us-ascii?Q?+8FEULQ33kTEJsb4feSeqXp361jgTkgUSheSI/IhDrzfWC84gi956PDUqEnw?=
 =?us-ascii?Q?DfA+kbhUui/7jhoZCdNHK+38cqn0QGSCon4CdQLpXw/7S+wiHGuE4QrC1DpO?=
 =?us-ascii?Q?8g5l98XqsS+tprkcDp80kMfPZpxuYg/dFKYd9TF1YX5QdRL9CZLi4DB1iw+w?=
 =?us-ascii?Q?pHdnfI9eE9YgYpKMJBDdHq318mEv6xwMCNOqKu4duyHZ9AbUFVZ2HQlhzTY7?=
 =?us-ascii?Q?ydxgQSkGTCllECeLC+UF12RO3gS104VTJUONPY+kTYjR+4Nh8nQ1j4p9apn/?=
 =?us-ascii?Q?wjLyL3m8hDoO4BL8HO4HVi5exWbrdhbBzdm8tONjo+f3WNPdZdwf1fuv/mSZ?=
 =?us-ascii?Q?1gPqpH30QbV5JCMDqt367AzRQkNnvt1UY4B7geGGl79pyvLwoyl13Tp1naT6?=
 =?us-ascii?Q?qDn7/OSijLn9wl0TOzKr7DMg7TAElPgo/1lgH2esymsyO9I28GJgY0LQ/5s2?=
 =?us-ascii?Q?5TzTpokVLHtgetiR3BGjDgGqHEZ0kCr6RDc/psk9iC+tARN0AclG/Sr1venh?=
 =?us-ascii?Q?Knx1/+s3zJSCHoiPrzSHshNrid1MfVV+EJsS6GLvPZKFlP4qrbA7O2NpwhbP?=
 =?us-ascii?Q?aWRJMK/yxEp+H1JGM3iRiXu6cDP8qKXMrgRpe4JFz3rm0xbSI6+IJQsR6/2M?=
 =?us-ascii?Q?TDYEMCAZYdq/yakXQBY+bI8lAD4LDJKHWb8X+A2MN4uP2lSdcFlZjP2Ub7pp?=
 =?us-ascii?Q?7+G+yLaI+mNzAk/Ziwd4PydKn1pqv0vtN6n5RI2KT1r0Q9ABj9WcZvavG3Kl?=
 =?us-ascii?Q?08bXYX19iHyfRc/Mu04allGkf/HyIzK6Nl8slcZ63jrfjuNOlmNGc0zwMM+c?=
 =?us-ascii?Q?WdL9tzjd9DJqu46GrNqGWiP/FjT0BZFbN0Vag/cSdrbLFJmivxqIvS4lkMPt?=
 =?us-ascii?Q?1UGVxIAzpZs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uHNSaGgF3ZyCt0Kf/4WM93axr3b6HsWh0ssEWVxyf1Y70hVY8/b908RzTeJi?=
 =?us-ascii?Q?SJWqxVDSAUsZDS5DZPzZMkNgHFKF2V2mt6laD2fnEk8mrWO23L0FzUMT4Ibh?=
 =?us-ascii?Q?jwHUsMpezpE+Ko2nozl21R5bsq/axpusL5fyIrF5A7rTVBxWD8jb5lEQ5rUP?=
 =?us-ascii?Q?ziI3Sl2h3lCn7K0FxVYGpKN5gVnlXiEWV2Epz//FB2xgPDmHCEXKS4vP0rjV?=
 =?us-ascii?Q?fPzW5h31CSDuftYd9t73t10jQ/TEqCPEbZQzFjzjGsI8fEyu9L1nonl70Zz6?=
 =?us-ascii?Q?BMjwrtU0rvtQqodZlMrERJvUliNgdT8mMXHLiMgPLBHFhXhAbXhmgsgEhVxc?=
 =?us-ascii?Q?cqwhfErCXhOnk/mDwchxvpfBXpWfCmF9ZZQ6qo2xyivDNwE58zVdU5IvJhoI?=
 =?us-ascii?Q?+9w9aHYL1hmZw6XRUK8+uFeTvNsoqFn99OtjkxavclR3nznrSIiu13gS1X3B?=
 =?us-ascii?Q?EhgwzLsW6i4O8XJZmuCUkeOIB5nwZDEx0UbanUKZWkPWblihy2qmnT+vyURE?=
 =?us-ascii?Q?5Xm2Lu9RTxui00Eis7I1AlspQFoJBUp98NwMgCyX6JvuYrH8I2vT90M7YBq3?=
 =?us-ascii?Q?qshGmF66Tvx2IxvljnpaLbuoFZCQsPPz/Xy5ZOts2gN+3Mug0K5AhTlPaOMN?=
 =?us-ascii?Q?vXAxmSxTQ+WrXbbWgNZbiPYVR92WW3wVgfJ0mf15mFh65WGjq/PER33WaL1p?=
 =?us-ascii?Q?q4iqnWlobx1cojo1bP7JFoDiWGZUTU0ZvOIGLJgH17VH8BYmeZXBYEw7d45L?=
 =?us-ascii?Q?O0bEzw0hkCHPdGbT08nDOmkSdOJHybiAdFYgHYPu+sHor8qG0PCUvY8pWQDC?=
 =?us-ascii?Q?DUz0vVtWPndTZJjFmA+kuWzWTR/uVCrBfhUp+mSdKBZ10MfCvafAJWwndm4x?=
 =?us-ascii?Q?IxJyUJEymPgbdp6/GqJjFgTEz6rrLFo4Ian4xQbN59eHhc9dwrSRFbu4Vqd2?=
 =?us-ascii?Q?+bvSRSfayncbrzF7YvyvRPznDJtxPol0NaUDIPJaRnzFgvutjrY5QGqjcI+S?=
 =?us-ascii?Q?GzAcUsttHh7meGIRGEFloZ3JRWkQBdf+/h3AP3ljIs46MIZviusc/NeiNe2R?=
 =?us-ascii?Q?1bSoc1wZrQ02SUhQPmDNdaJsOqjzsReU+oAfGyRBqk+tIbeImUf58fR60L97?=
 =?us-ascii?Q?7WuUzmX4sc3JNIvAlDHKU6ByyrKWvPKE26X+ynyvoXbnZlWcu++sxhNp21pP?=
 =?us-ascii?Q?uOm2R/vE7XZUl48Iln4gR17TL8fzMqIsOFpmRHqJcsgE5jqkoXe8W8Hg+fhZ?=
 =?us-ascii?Q?LYEWpDJaoVV4z5p33fjpJOK9Hxg+ZetX+OGKsoJKYX6z1kbrL9FeOUe322Nm?=
 =?us-ascii?Q?3x90e4w3IO5VDFGBOfWG34G0m4oMd75vzWMPao8ttgRM4fC8k8IM1IFd1THG?=
 =?us-ascii?Q?OP0fp9BURE3jXISwqPoYMH2dO1u4WqZr1JKe5swAmG2mKOLJHGZvQpWw1wAE?=
 =?us-ascii?Q?3Y0e3yAFDxhdCw0WStbIvecHLUeNQYpcFC6yLPsZDJLJN7j3uq8Qd3Voti4f?=
 =?us-ascii?Q?i2MDdQMW+yYwyDmZvcydN1JQZDzAWs9uL3/ZJlhSpk9zHtvUhsHzmaJIW4ku?=
 =?us-ascii?Q?jqcIrLP1Fz5irb8JZ+CNo8jElncejjOLYYcVIEqvp2+XGbvXikhuVrYyOLYT?=
 =?us-ascii?Q?HQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f62227a-9ad1-4283-57f2-08ddca147b2d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 18:12:27.2372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tyypkGjftwtVAEwacMLXV10Gvu02IoM3hnUmmjIAarH/ug8dd+pn696KfowG1pdW99vnJ5eyRtOJJESC//z5Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5197
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

On Wed, Jul 23, 2025 at 07:56:39PM +0200, Michal Wajdeczko wrote:
> The struct g2h_fence must be explicitly initializated using the
> g2h_fence_init() function to avoid trash values in its members,
> but we missed to update this helper function with the new member.
> 
> To fix that and avoid any future mistakes, memset the whole struct
> first, then update remaining non-zero members.
> 
> Fixes: 94de94d24ea8 ("drm/xe/guc: Cancel ongoing H2G requests when stopping CT")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
> v2: use memset right away (Matt)
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index b6acccfcd351..3f4e6a46ff16 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -95,12 +95,8 @@ struct g2h_fence {
>  
>  static void g2h_fence_init(struct g2h_fence *g2h_fence, u32 *response_buffer)
>  {
> +	memset(g2h_fence, 0, sizeof(*g2h_fence));
>  	g2h_fence->response_buffer = response_buffer;
> -	g2h_fence->response_data = 0;
> -	g2h_fence->response_len = 0;
> -	g2h_fence->fail = false;
> -	g2h_fence->retry = false;
> -	g2h_fence->done = false;
>  	g2h_fence->seqno = ~0x0;
>  }
>  
> -- 
> 2.47.1
> 
