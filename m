Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6488ED3B9B6
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 00:32:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180DF10E56A;
	Wed, 10 Dec 2025 00:32:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PiVHey3K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E6410E56A
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 00:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765326770; x=1796862770;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XcC1dqx5TlZGHzhK6DNChv4J+Blp4gbbQD4nJsBncek=;
 b=PiVHey3KCoAAsZyojGHJtrn5p7NaL/A0wEQQ7QVOzjg6lAYHioLd0mjp
 YFhlyrdUeL/Csiy02Pxl+4ePKZSjHyrU5r3VAQF4bQlDo6mVwF/PmWdyH
 AMMFjb5lxX2fS3QI5AeOf/VGAlIbIxjA0H5DjV544jqGZc0INXW0NTqr3
 xXjgMGx/hz35IV5rwCgI4PISomrO9rRK9An0xS6FvnMw9EQA5ub/3vUIG
 xBpedWoQ5hvqDYwiIRYyrt5gOKfVVs2PeXYqs1KMHKrWR2h0TLeNohf61
 vjMJ9VM2wKUpaT15WygpyOEyWODU4ddUAykiGuf8egIVp7AcfSJpcuPq5 w==;
X-CSE-ConnectionGUID: 64rE+S7vRp+pnt3UFzhOvA==
X-CSE-MsgGUID: P1GMixPfRCyvPnwmo+37Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="54837938"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="54837938"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 16:32:44 -0800
X-CSE-ConnectionGUID: dp4U0h8JT5SN6ZEyfJXJkQ==
X-CSE-MsgGUID: GEF480asSfGOPbpMOOB0nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="227028898"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 16:32:45 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 16:32:43 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 16:32:43 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.45) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 16:32:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZztaKVMSIuyiKU07Gj4niwTEmdRglGmwSy1Wl2LexTchPAXcAHpvdtdskxT7gyTydQDUHP46d8+4mBOH5tnvTlwKB9IfQc2hoE+EztUpXUBPPgcsGDjknEkfXG45mfIuM6YW2KTimcdHRP9Ti5ym5ensIbr02ZM3vIoIBey0BxvU4Ll7kvUXfhY5N8zRuDQbYGnjk7OCsOs5+H7CC7qZJ5bHrDbVy0H7SKMn+Nko7AiyucK0EBEVuLvocwqxDt2yewIIt03aeMn2ovGA1nvcTucFSjxL3FXCraMJkGTL8jvfTCzdK/CkdeRZJoeAqNGW9FgZPOX5SkjWpkoiOYVb9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UWeg5C2mxtl4DhQVIQgoXujzVXep6dP6URnlV0t0HSo=;
 b=I2fcIBBwLru3oZ0VxX3AZfLwAoNf9KwV0fa3P+g7kHPMZhl5cMmMu5pTxFMc0mbdOYJJJoEyyrgW+a0UlKTnOcwP7qbxTw+mMF4fuaeQBwi+IJa73mxvZWLdfi4H9a8Ef8e0c0rziom3EJL7woZ59EBZ/XsxjXT+U8oxtn0OR7IwCexZzjVIFVedLs1L833bB2QIKKRIIkJgY5Ss0u7QFoGS34KacE9G2wbMrjjNxL3TM/z6kaG/P0EGsANgV2rirAJZXwBi2iEEYg0pxHQ7BvZQdq4g4dXHAvd4NHPIkHgfi+GjPmRLueSmewEIzrYMUWs8WZMnlXzMqPKdOMKBqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by MN2PR11MB4598.namprd11.prod.outlook.com (2603:10b6:208:26f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Wed, 10 Dec
 2025 00:32:42 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%5]) with mapi id 15.20.9388.013; Wed, 10 Dec 2025
 00:32:42 +0000
Date: Tue, 9 Dec 2025 16:32:39 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>
Subject: Re: [PATCH] drm/xe/xe_guc_ct: Prevent compiler read/write
 optimization breaks
Message-ID: <aTi/p4KgMsWQLxW8@lstrano-desk.jf.intel.com>
References: <20251209212535.159493-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251209212535.159493-2-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW4PR04CA0373.namprd04.prod.outlook.com
 (2603:10b6:303:81::18) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|MN2PR11MB4598:EE_
X-MS-Office365-Filtering-Correlation-Id: 493595d9-41fb-4889-62f3-08de3783a162
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AFFYsJyzSg28MjVntxV00c3GrwsszrbBIhYnLvSgdll764PQPK30+sx2FgTZ?=
 =?us-ascii?Q?mfp7+u6+wBMm9vey87R7NwcveFDitc2A3zrCHWIrM0WvADc9yGihozifP0jg?=
 =?us-ascii?Q?qWlka2Rpz9ImdWmcXLlenqeMV5AJsqgbOTBNok3jNhqJfP25FsrdKVwIpk3s?=
 =?us-ascii?Q?bruvXzW1s8bV6LdUuLPv52QHCsYRiXlkOhnV1E39FMnGHoYHIocQo62S7+2s?=
 =?us-ascii?Q?fiJHkJcy6IbrEh8YXluWD28KTFNgigWhxtdu4yF3ZlUHFxZb8wygKXQh5mO0?=
 =?us-ascii?Q?tLgiL7qI+F+kwA30qGIhYlr0av0OqEKlhSMx3pXZyDY6DcTsdenKRPydgS4L?=
 =?us-ascii?Q?fzDyy4dpyrEiq/4QAdwJ+OmX53M1HF+39Rv3kNQPiaBiWcHXldYkPbVYngNs?=
 =?us-ascii?Q?lGEPv/N3BOE+q7Ln93c3n008je56yy+FZGi79iRmy1/yx/089pMAOHJYuTs7?=
 =?us-ascii?Q?Hro6dQHPEIr0Bq+so+9rtQYA99ocQDLHhiI+aIbZu2UMGy+D83KTnrY+GDrj?=
 =?us-ascii?Q?j/jheSNpBxa4WmI/TSW+CSdsFi9VG0Kc+6EyyPzDsJ3YQmPi1+67f8QsNA64?=
 =?us-ascii?Q?gmdC90becbc8SsrkJ0fGn0F3jEL5C6c9D2eZNc34fiqFC1tePq8NZUXaoGWc?=
 =?us-ascii?Q?1vtAMVx0Hz+ou1AUR8OI4C0iLVg8EYbS3t3npel8gqPDtqTihw1ryOFvdp08?=
 =?us-ascii?Q?8D7qVjVy+YNLwCss9yXKGrLWS+0doSEoEPCC8Av6xR655C4rCVXg8Qp8vbJv?=
 =?us-ascii?Q?pw9RrH0KCmWi/6kBm6Br02bzy4H9jL0WV9xQ5i/v4FuejWQoPRA7hTuluUyD?=
 =?us-ascii?Q?peg46Oafhe0DG9ydc2rPHO1BAU+XBxyZ/NWEu9WJz3rxXj2t34CPNNJB+5G1?=
 =?us-ascii?Q?/JEyzteYVUcG4kloju9xAz8SxaiyEiRaP7RD3TPi2j40gfFnF1D/L44shPMP?=
 =?us-ascii?Q?qF/RbrI2LV5bt/KuoGxFaPjos+p++jf9MjSSv6libMBoUmOvQmObAUUJ39Kk?=
 =?us-ascii?Q?MvPgA6sLoOMnJ5EuUx5xxxNvdFWJ6S54AVq8MX4PemGDda7ef1jR5lgQnIm/?=
 =?us-ascii?Q?rBFQlslEfeSKpIVw8IQwmJA/kfriUuaWKUcDZGuniARM4UorcIs8xNPHbc7A?=
 =?us-ascii?Q?7e/MSt9CUeFRh59cLhsaxmbncMKo22f5gzKeyRIDjMbJeiBeAH+LsSAS3WUu?=
 =?us-ascii?Q?0WKYFW52vfX9RoOITcG50Uw2bHGDls3BIjEOOzu0tRYJyyqPYXoxNUi74Nzz?=
 =?us-ascii?Q?WymlfVIMfUhUd+4AxhXFCp4uTtdrAeht0cBWxPQghsoT5fCYWuFwiI5eV2XD?=
 =?us-ascii?Q?XIBAcimg/eOguLwce5CJ04kuPjw7eJrBHXFNWpj6DB7S/GldpnsX8s8wH+AN?=
 =?us-ascii?Q?jacvxEuC640adgC6hAy8u0W8j6nx7xPgF8pK/pEQfMG1QtMg+J2PPTXT35j/?=
 =?us-ascii?Q?Kmkd+0Lgg+/1i59+Ro3pBbmIbGV64zJ9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rH3qLOqmtVKEKRDyCqcHyDmp9aGQgy2KIMTQRaJvEWI9yfoUiFoavN4fzQfZ?=
 =?us-ascii?Q?W2p9j9AR63Mcsq5K3rKr5YrlT0p6yYJXV3b8OEjbo6Vfi6i1dAaPOqFFJTFL?=
 =?us-ascii?Q?u3wJ3uH96pNpT1Kw6kJQqtQUBhjuwVTUADyPSE54oqLxWwy34ntxnRdVAJk8?=
 =?us-ascii?Q?GvUHjP0lytH0Nk9HdeEF3snwRb7cZJgZvemVBzUnlXPWS25b4yH1ER2+gOdF?=
 =?us-ascii?Q?yoacyrya8wTIYfrsLL9Ol3hSkf847S6rMF0mAv+rIZXoUU/ELSn02BOPZKsW?=
 =?us-ascii?Q?HKkX9wV353mNWNafx7V6LFdUBbB2rOe+vX/3F9u+c5LrTi5CL7NBJbrtAKE5?=
 =?us-ascii?Q?DgvcTGd+O9zT8BN+w354182NLHfL9FJKzNj1ydVHp9OM81l8IEss3jlrlLO2?=
 =?us-ascii?Q?Bpzpt8XjpRyE0zNyTsnJWIfyAhuGlzfOeA340ARg9OfC0R2ErpAzCaX82sI7?=
 =?us-ascii?Q?1/QX4zqS8rpHXTNMSL1oSfWiRX9bzTAiTqpeEHDQR+c5iBtkP/DEcLzNqu7J?=
 =?us-ascii?Q?sCWfVcV2+KyjhxpptA3o0aT+NkI1p1xZ8Pc24C/6POSQrmV2qjftvOGg37Qp?=
 =?us-ascii?Q?8t92bNe6n+gwP/nxlsvMKYRdq9f3ki3Mv0IJaZeimFwA4ZG63TR0i0g1in8C?=
 =?us-ascii?Q?U7e20CDjJfTUxXrVZoXx6ruTrD/QNpLv/i3E5lzT1K7Q1EeM3qUy5kD2ZUVP?=
 =?us-ascii?Q?mx6e/8sC4XiFTDftajOjJjaEz8kwYod6qHpxtB8bHZVkyA1nNISIm2LjfFyG?=
 =?us-ascii?Q?dTQcCXZ8ORX1rUnG7EoIthOKbGG5F9jHQn/brAnwhfD4YjBTgYLGIy4x08g9?=
 =?us-ascii?Q?O0N1C3Ix2v1r/ZqchwyITNWBSh4Orzlxot7XbPmoZGIkX7R74NJMUgTw5GmH?=
 =?us-ascii?Q?PhXqyTOa80fLB+fW7r7NHmfeNaqy8bLgH+o2Fh/hNWjS3T/hEVch3zApzvoR?=
 =?us-ascii?Q?O5SiSGshxKSWKtRbKoYLFWxDYG08eqrBB3bCgWCt40m4kkwBc+vJsj9RIWWc?=
 =?us-ascii?Q?VdTV2t7IXiSJCS0xHbz7AJPyqiPR/VrMY9x4alf38UWCCh1vFCce3IZ8PQmV?=
 =?us-ascii?Q?AhkqBbb9q6/rtSjOS/4oTm7rNK7IuPPhJoTbRy/czgXaXB7NuAOycZO4NJl8?=
 =?us-ascii?Q?pRIDrZ0rGY0VbhrfYbrBAvE8QOM8VefPy+sH7cruF20a77ybj26xwMm7kNBR?=
 =?us-ascii?Q?G1uXUn9k/7fFlSk+GSAPngUJPNibwbYQ+qDW6L+ZqVLCLTV+PRbJoaw7v92k?=
 =?us-ascii?Q?V7qxl7wVwlnD2n8vLPfx8Hlxy34LaX/kDNl5sBWCjoBVWrXshX8amjGKCwVf?=
 =?us-ascii?Q?sJAkHyQiYYHLceot0T1//H3332HfwjtrwwbYHDHohVMJXKZIJQ8e2ibnr81f?=
 =?us-ascii?Q?PAGTt1J64uXl37Y2gohxLTR84gfh+Vp+Wgyz10ZKDu5ifXDehxF5HDM1LqAM?=
 =?us-ascii?Q?wOOzODdufBCz44vQIHtDR9A7q6GsfVswPHWKhDz7A7N1wuB+FVG2dPqQOhe0?=
 =?us-ascii?Q?Unf4EfO1SD4Pm6Y6xF5qSKxdfEYCtA1SiVjC24ibPvX4od+zLdYmgE2Rtp7/?=
 =?us-ascii?Q?fn1erpn3OrRMjSCWdMyMw01TyizgYYlZ95t7LNwVhJQIpcpTiUaOZ45lazG/?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 493595d9-41fb-4889-62f3-08de3783a162
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 00:32:42.2508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S60FiClsmqnMsOW/dn5XvIb5IOD7xNa3q9+OYg0sgVPmo3dq5JUqLRcU6MAygX7LjjOxiHKVB4i2SW2llgLpsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4598
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

On Tue, Dec 09, 2025 at 09:25:36PM +0000, Jonathan Cavitt wrote:
> Use READ_ONCE and WRITE_ONCE when operating on ct->state and the
> g2h_fence->done values to prevent the compiler from ignoring these
> necessary operations.
> 

Maybe a fixes tag to guard against future compiler changes breaking
older kernels?

> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 6 +++---
>  drivers/gpu/drm/xe/xe_guc_ct.h | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 648f0f523abb..9129c50f5370 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -206,7 +206,7 @@ static void g2h_fence_cancel(struct g2h_fence *g2h_fence)
>  {
>  	g2h_fence->cancel = true;
>  	g2h_fence->fail = true;
> -	g2h_fence->done = true;
> +	WRITE_ONCE(g2h_fence->done, true);

Peer Thomas's feedback can we get pairs with comments around READ_ONCE /
WRITE_ONCE usages? Grep in Xe for READ_ONCE / WRITE_ONCE and you should
see comments that are an example of this.

Matt

>  }
>  
>  static bool g2h_fence_needs_alloc(struct g2h_fence *g2h_fence)
> @@ -527,7 +527,7 @@ static void guc_ct_change_state(struct xe_guc_ct *ct,
>  	if (ct->g2h_outstanding)
>  		xe_pm_runtime_put(ct_to_xe(ct));
>  	ct->g2h_outstanding = 0;
> -	ct->state = state;
> +	WRITE_ONCE(ct->state, state);
>  
>  	xe_gt_dbg(gt, "GuC CT communication channel %s\n",
>  		  state == XE_GUC_CT_STATE_STOPPED ? "stopped" :
> @@ -1496,7 +1496,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  
>  	g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
>  
> -	g2h_fence->done = true;
> +	WRITE_ONCE(g2h_fence->done, true);
>  	smp_mb();
>  
>  	wake_up_all(&ct->g2h_fence_wq);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 5599939f8fe1..cb1335f1d66f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -30,12 +30,12 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
>  
>  static inline bool xe_guc_ct_initialized(struct xe_guc_ct *ct)
>  {
> -	return ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED;
> +	return READ_ONCE(ct->state) != XE_GUC_CT_STATE_NOT_INITIALIZED;
>  }
>  
>  static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
>  {
> -	return ct->state == XE_GUC_CT_STATE_ENABLED;
> +	return READ_ONCE(ct->state) == XE_GUC_CT_STATE_ENABLED;
>  }
>  
>  static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
> -- 
> 2.43.0
> 
