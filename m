Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261EAD11195
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 20:43:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDDE910E008;
	Wed, 26 Nov 2025 20:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ld2xjaEC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0614510E008
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 20:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764189779; x=1795725779;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lnr/O70sXABW9RA2DcMxe3V5pNUqO8FzHzf03U/P9XE=;
 b=ld2xjaECuuQm2uTzJ1rNfTx5tXPk0VOpMZI203iYsraivgFWFfsGu2j9
 PbioKkB+8iU7LU8tht7m1ovgjgyMsRjy1NiTAFUPtOUlZc6AbnN5GjA3y
 rOWEcHv2O5upehOEFTjqKxwxv4wLLEDnYHZ4SZzSkON1GBdow5XbDD6Co
 erByfTofe7Xew41nwRptsN3ig/wWmQdb3BW7xY3avwn9Gea1QWkh+yEnu
 qWqEtfqXMXGT06wbBRwPdDQhi9zsPU1ra1tR/81z6tSeq/6yAuLbn7pI+
 FoT0axhcZh9oXMHJvURu94YEOZ7G4Ti6Itco9iQBUZm1i6JIdv0om7cJN g==;
X-CSE-ConnectionGUID: yYYhTXg9Q5uBrWN6tDTQhA==
X-CSE-MsgGUID: oEfktW/yRUWjZ+8orKtTbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66312940"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="66312940"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 12:42:58 -0800
X-CSE-ConnectionGUID: j0O3LuWOS8+fcUwzmhwWHQ==
X-CSE-MsgGUID: TOpUrIfZRkCjvdm86p7yVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="192295172"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 12:42:59 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 12:42:58 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 12:42:58 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 12:42:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jpJzzGEXRBjEOOJfQoXbFbU8cDpDgQNPIiAuEIfrDP5GKjDanOg5+DivLv45rtqm+1ogunOXmI56HdLyAB/B31abcO9lMOY1aSdj4ZiZ1+X27BQ4JWtL6T/kGKRg4LQR9GBKnjSf7YtIqnTUIvA2Q9JEGGdZuFdu0nT9dd10vS2pjNQ2HH7+H+Hkypq1YmzqOdM+5ZCtUYwPqvpJyUwoabOD54mnK7nNSodvh4wK5tFPTqC0rtUc5Iew/jOVlvUEbockVSo/oxJR28QsH1TDQnkMb7NQ+SqI5lXBNvspuz9FeQVoAEtukkp44rxHqko0tF1jOG+NDetRSQqNuSuT9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5Kcvhmh24i2bClXSdrk3Z6gNyOlfiVdyS7gUBCNRa4=;
 b=GYqqVW+harhYqTcLSlJQQtAojGQkUlMHzIZBRRSNiz/gsBFYEDAvxwuT3WnaMolOhCQQbGdACNOcbZCf8+UqNr/CmLp3gBckPc4zVlYPYXP+6a+7rwgSAetLjUEI9LWkZ9RuOA4sRMFx8i8lK8/FFvixxVEXHm7C4kElFAF4DRrj1cKEZ5MSakrIl4SZp1jDqg8i61RzHDx79xmgdYrFcUGc75xFq0/Gbba6f0fnbw6Te+VxLmHMVujLCcDUG8B2m/pHw4hbH0OwOVMrHfPi+EsNjkdIfSIspBug3ryp1cu39799NkO/cTlR+16IgMCV559QbSnppNIz2MfqI9WgcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB5234.namprd11.prod.outlook.com (2603:10b6:610:e1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Wed, 26 Nov
 2025 20:42:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 20:42:55 +0000
Date: Wed, 26 Nov 2025 12:42:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH 2/5] drm/xe/oa/uapi: Add gt_id to struct drm_xe_oa_unit
Message-ID: <aSdmTbYbOiJv4i8r@lstrano-desk.jf.intel.com>
References: <20251126035220.13089-1-ashutosh.dixit@intel.com>
 <20251126035220.13089-3-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251126035220.13089-3-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0095.namprd03.prod.outlook.com
 (2603:10b6:303:b7::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB5234:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fd3da22-cdfb-415e-cd22-08de2d2c60af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9JzTaRTa0724ufUkExseWhOcOxR5ZXtuWiMXFzIKwqMfByoU7HUpEzMdV/gZ?=
 =?us-ascii?Q?XwhRHhHFp5jnCqRGaVVt600SfOkYysQLBDljqxtWE9SPjPXdKyuDLudLcfQd?=
 =?us-ascii?Q?txUn8Bvlg9C4ctiPcwBLToETAa/oU2AOlbkKG7Ls3T0vHBXYI63ywSKble02?=
 =?us-ascii?Q?/39oxv472LTlEFKb0pXjUWF+5f0n3Ga4BEb+FlsmmUf8VyCRDaiuGdCRut4i?=
 =?us-ascii?Q?atl3TS/E7gC4mG3rnY3Hyr8/y2kZC9VktjP32eI4feMr/Ahp6Psv/h3yh5H5?=
 =?us-ascii?Q?HOXoybhmUywo2hrSYP6EWo4wK3w+59UXZz55MAmKXqm0NYpnrE2oAKSqJrhn?=
 =?us-ascii?Q?gPdWi/Crg/rYkIW9fsT5tcyi9gt5N+IsLTbZav5PuD95+7uPqR1bNQh3HqBW?=
 =?us-ascii?Q?DRVVmbJj3H2C7YKA8GU7arH5MJi7hWodmCGaeVR2/NIY0dhpCTx9Qu5O67Qc?=
 =?us-ascii?Q?A2E6lbWrblJhRnzxNViCQ0Brkgr3JiwpQg5vVuSKeoR/sdPite9TWSIW9G/l?=
 =?us-ascii?Q?tC6x3IS5uUdKG3DTLyDHde5t+Q6S4WnwTgi4ECYfcs5jrcVx/ElRkN48DjP5?=
 =?us-ascii?Q?t2JIF9g/86nPTgRJodacn3BB6ToQZZmxy5pb1sTME1Idfz6NkTJmkiWOb1/+?=
 =?us-ascii?Q?30QTgsAf+gBJ7fejlgh6NjYYkxPfXvzbZ4IqnI9Ghy9Lk6jT5r7ackvLGKp2?=
 =?us-ascii?Q?0BghgnPMEnR34PkaESOW0yIJbDOtpflPphxOFjiGGRRopT9M/IkB48Q0D6yD?=
 =?us-ascii?Q?a29181ko9wXGCcUd8yQ7W9OBZlETx4rggCb6Klr3oVSyP3eWcHsilrDa3Uk3?=
 =?us-ascii?Q?QU3Oc0/dUw1lOlHpK1XE1G9JUWuOfmglYa3QI2SoQbn71OP6TdYCxS48tIyV?=
 =?us-ascii?Q?y6usgX+wZ1OV7qWbcgiKLCBStlgb6pkkSd1y19CSBD2vQdfF09gavQp6dffI?=
 =?us-ascii?Q?I08J1enpOqG6s7Zg5NHh5C+1xMl5ovK8+cN5IEyifInfJQSa78HHO49mSMVB?=
 =?us-ascii?Q?ycDXt+AkcMFuKE5y5rs7fG9yDCpMRbQ7eEestcsxgwiWtAEJc/lXcRCfOusl?=
 =?us-ascii?Q?D7VW95D1uUWR+rFfH5MSTTBS6JQJiCd7rUpeJyLvs5oFjlkYsCqPnbBrSg20?=
 =?us-ascii?Q?hVFrCNUM84LwDAC0CyQ3BYBGBkKvKHGaMWoZ14IKSykWN8eKxm+4u1mcEJLG?=
 =?us-ascii?Q?rv5ZJVxUh2aG8zEfdcbxbZyJZij/kXBOLGuL81EX+0hiBiFgS8X7R9oYiIKQ?=
 =?us-ascii?Q?0wDmQ/FennZfQa61nACTI9IBjPt2VXVTb4AR1x8mXQgnOy1qn9iOhtxU2R4W?=
 =?us-ascii?Q?TJseFySwuzu04Vrfj5pDvegrxvYqGrBTkJ7EqtXhCm/8pg0gF4QLR7uEw1jU?=
 =?us-ascii?Q?fr+UmVJPu4chSv+dxv0uBzpR18xf7KPMFwNQgaf0jXYx84esT0CiP/L11Yj0?=
 =?us-ascii?Q?OLHnNbICfkJyhmfeYgTHUB7u6WhZfz6V?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/uB0lYrTdTUzg99V7c42PVt9wYQA8B7jPgU4z0RyXrm61eu+SV0xcYAZU/I6?=
 =?us-ascii?Q?lvxrFnHIL/iY62EEe+YN8FY8DTLFRAhgGUAYTf9HA0YOhpYa8w8bX3P9tpXw?=
 =?us-ascii?Q?QZ7B+PwFAo0Liz5/gLc6flJFBVjvqSR+3D280sPJy+GdHSvHMWi7/zkUdRDg?=
 =?us-ascii?Q?65vyk1poa+QJJQhaCbqD3lGd1uWhC/ReqpWoUud5b8rvwg6wGi88kKUaROyh?=
 =?us-ascii?Q?8jOZDBizS23CEcHZmojFS0h6MHXPw55y0V8lEtfeyGUSa4Ie81sDpEp606rT?=
 =?us-ascii?Q?KWKSBcAjGKzP4Ti/38UYPUhseXvyOapV8bfUNu3ZWkokCD/fcpeQBjBtUPuH?=
 =?us-ascii?Q?ID6BvkHxr4Yj7KhhO4xutcuUJg9S5s9aqLLxsN2SJwCFkCIIU0Dxw5iUxESP?=
 =?us-ascii?Q?oafBz+NXTft6gEI3gJBu+uCRCgQmJHu18c2kb1tAZ+v4GvZwiNtH3y4fhrhm?=
 =?us-ascii?Q?PeKC4sPbY+EaER5Brm78FaVKKTxD8+S16MzoOc4lu4HmU28XxABSDLNGrORr?=
 =?us-ascii?Q?C0thBlHToiUcU8lLTVkTqn4fqGxnvCCJ8ZqekzCPjyoqaZ+Cg9V9sv3TzYZm?=
 =?us-ascii?Q?5y3J35hOL4kg36phMniqLkkuH++4wHvY+jyQojgcfyfKKiAhJ0rygv/LS09M?=
 =?us-ascii?Q?cBS4FAF+J68FYcveVP7oKnzkv/Ta7ssFYxqvZ86R8DPQieKeVwz/i/Iw8U01?=
 =?us-ascii?Q?Ds7WNJQGEunUlaM+qDwPILkkySbnBZWFgbtOWxKZAhiFTqeMQbd5nu4z29MM?=
 =?us-ascii?Q?McnXJGz3i9EzLf/5ucVHwpQAWOMl3GgZSaeZ0ZMF3cZADiqAL8DJlFpmPLdN?=
 =?us-ascii?Q?h3hmvdefbkUK2rt50d4krpINUmNr+k2QI/bMCVGQtOC/QxhvQIYeucsADqW7?=
 =?us-ascii?Q?MbhqQqR1AEm7E9D6m/xd5pfv5IT/KTHkjoqAFIWH9pdjYY0fji3FC3UldW4/?=
 =?us-ascii?Q?dqasyyVK5qBSyjKaMMkCoHw7zlXYI/HofAN9z/36Kf0hYZj/49Ag6Bp3q6oN?=
 =?us-ascii?Q?FVShk0eXnuKMOsLFh6/nAOvH25OTuFXch6qNbY8mQvesqUgDQtMX51idWGay?=
 =?us-ascii?Q?o0y8iIFtctDFl6QFzclXkZqOArfx3ajWbzshoRbFcVCMrgdAFS4EdrkrqGQ3?=
 =?us-ascii?Q?70tq/vkLxmu+pr1oWHwDGHN6MHehOU9gm7beuapovT4VJ1RH9Tgsa+bcLloN?=
 =?us-ascii?Q?mKwrfXoM1XCfZaBxvdORi0JVDouAh+nLNBAQBYTPmOjV7neP2ZK8hmEygA8A?=
 =?us-ascii?Q?Nt55aMlNlnZxOGM0fIWbu5SJ/A48rWLmAxgSq/+4DYSd3COpgrl57nMB61cH?=
 =?us-ascii?Q?plr2w28Hq0ReMvEHfpE0xXqTUtYB1kABJ2uGHe8caCZ6c7m+HoxMJYFeZ+OT?=
 =?us-ascii?Q?yqCieDluDEfxSlrhQufaM4soAj8ehQm5R2gWnpMW59CG0oIniy5KeO8Rys/T?=
 =?us-ascii?Q?A61Fjy4HiCW2AataT4mqd1VqpuR2LgfUUg4RRiDwhRjyzjYubXL0lnLaLqRW?=
 =?us-ascii?Q?B/LdXqqiOAZ9+3c1OFN28+nGE7ZU7xatoi1StGYNYWnSmpLocyco80HyhGFB?=
 =?us-ascii?Q?V7fyXox9rC2cB9FQg1S4EV4pX6l3U5Abou68TDkp9pRPbhbjS4ocV1Z/pT96?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fd3da22-cdfb-415e-cd22-08de2d2c60af
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 20:42:55.8458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kKyCHW59zHdlgq9yisM2UerYSdXYj3fMc6lGIavhaPyknv+OVdSeJ7nyat9+MN4bEkzTSbNJIlZ1XeMjxjVlpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5234
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

On Tue, Nov 25, 2025 at 07:52:17PM -0800, Ashutosh Dixit wrote:
> gt_id was previously omitted from 'struct drm_xe_oa_unit' because it could
> be determine from hwe's attached to the OA unit. However, we now have OA
> units which don't have any hwe's attached to them. Hence add gt_id to
> 'struct drm_xe_oa_unit' in order to provide this needed information to
> userspace.
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_query.c | 4 +++-
>  include/uapi/drm/xe_drm.h     | 6 +++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index a7bf1fd6dd6ac..18bd8047ebfdb 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -682,7 +682,9 @@ static int query_oa_units(struct xe_device *xe,
>  			du->capabilities = DRM_XE_OA_CAPS_BASE | DRM_XE_OA_CAPS_SYNCS |
>  					   DRM_XE_OA_CAPS_OA_BUFFER_SIZE |
>  					   DRM_XE_OA_CAPS_WAIT_NUM_REPORTS |
> -					   DRM_XE_OA_CAPS_OAM;
> +					   DRM_XE_OA_CAPS_OAM |
> +					   DRM_XE_OA_CAPS_OA_UNIT_GT_ID;
> +			du->gt_id = u->gt->info.id;
>  			j = 0;
>  			for_each_hw_engine(hwe, gt, hwe_id) {
>  				if (!xe_hw_engine_is_reserved(hwe) &&
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 47853659a705e..ec09b281eafe7 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1676,12 +1676,16 @@ struct drm_xe_oa_unit {
>  #define DRM_XE_OA_CAPS_OA_BUFFER_SIZE	(1 << 2)
>  #define DRM_XE_OA_CAPS_WAIT_NUM_REPORTS	(1 << 3)
>  #define DRM_XE_OA_CAPS_OAM		(1 << 4)
> +#define DRM_XE_OA_CAPS_OA_UNIT_GT_ID	(1 << 5)
>  
>  	/** @oa_timestamp_freq: OA timestamp freq */
>  	__u64 oa_timestamp_freq;
>  
> +	/** @gt_id: gt id for this OA unit */
> +	__u64 gt_id;

u64 seems like overkill. Maybe a u32 or u16 to save some bits for the future?

Matt

> +
>  	/** @reserved: MBZ */
> -	__u64 reserved[4];
> +	__u64 reserved[3];
>  
>  	/** @num_engines: number of engines in @eci array */
>  	__u64 num_engines;
> -- 
> 2.48.1
> 
