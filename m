Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E626C77B7F
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 11:27:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E5E010E0DC;
	Mon, 23 Jun 2025 11:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dd7L3fgu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F7410E0DC
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 11:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750678027; x=1782214027;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Xz4DgYYkwpH0sFSuHPBBSbsoWYp6uJNcjUHklb/53g0=;
 b=dd7L3fgu8NMdlHu2JSQs2l6C/quKu+pzCL/B/2D28bI0zH5cZAxC+Q5l
 WD8wVBArBBHh6XunmShHRy4wi8ZslNHqZk1NeWTs2CGVxalpJ+fgxqRMV
 VKcjRwgUGdm5DB8zZqedgXW2FoCyz9sbNVP4fYfqRg7j+JHGUbCFeXX+0
 UfxZ17sn4aAwUw8O00ZYYLtZBUqoria7D/s1uP7kWHoyw9ZTMzTe8ufal
 5BfqKSpwk9amEuKx5gbYULVHvzrjY1sj0kRi/pzzI/zRuGn4cdJZSfTlO
 PuWeYjGYp3xR2Zub5pdTXQdaIOlWFiIkiY26Tm3nKxVZvGioUNGCoqSXB g==;
X-CSE-ConnectionGUID: AzMPoERLR6+6OwUmR/z4mQ==
X-CSE-MsgGUID: 3XciHPnnRfaPUZefWWZOTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="56660490"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="56660490"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 04:27:07 -0700
X-CSE-ConnectionGUID: MJe09JpmQnC2THwS1GLf5w==
X-CSE-MsgGUID: PHKwU+Y6QsahCjfA5wKbGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="151348648"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 04:27:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 04:27:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 04:27:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.69)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 04:27:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VW2mNXroFb7NZd19x697LfwkDv+PKHM3lbsHo55Up+2zVETOJ3mSuJuWBqkFqpgT7rvS84O1OZbTM8YCC/mY/L2kcOCZe2D78hJgqc/EVnxAJSRN7NUMcU3UTpM4B9LJuPMfZEj5o3tcU0Dr8qndipyo1ZSycqX1F9ryS3J80jX0+eYXm1oWfVPCA92qsjKWMRkSq2FI1miYhyq4PCtefKxHo8B/0k5qDH4P7MuIHH7X+8HjCiYj1jbOUFEdSPVrVzjWEi5+RrxyyJARvcxE3J7nFY7mNh31OzO4xeU7r161xuCm6p9oC69NKkAdp0N6g3gXs81SVyOooNf9WH8gtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVfUiA9hQkm9rcFLl88nHtRiyzu0fDLoWzCX3ME3oms=;
 b=c4tegzai7E3YlqBdbbNyXY/heSj0IkOp8wOizCkOPwsIImtRF5WTWzBB9/NB1ICtoz+B/RgjU98Z4S0opz8SYntpKmJXN7s+I2zGBhCpN03i1JEWyCKJlzKzvAy5IGgez0AzHtS4fUcdpYzOoWJJDk631rPn62l/0PWM3HClolP7ASPA3VawbAbGS9saWi7+Cn1suvID/YrEpyfDpMJqpgvWn6WrkzZj3XewV5csur31jvcSN2nGJdzyTTU6+W7tQgoEJ61P8DU5LSiManW/5BbbquvNdxhWYyMe5/MPIPA/nwzpfMpG5EtpSFvKLDnLCoQrG/WuBJkgB6yHuwExUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS4PPF6EA6DD735.namprd11.prod.outlook.com (2603:10b6:f:fc02::2d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 11:27:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.016; Mon, 23 Jun 2025
 11:27:04 +0000
Date: Mon, 23 Jun 2025 04:28:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Implement clear VRAM on free
Message-ID: <aFk6awqQSGi7W/dy@lstrano-desk.jf.intel.com>
References: <20250611054235.3540936-1-matthew.brost@intel.com>
 <52e8452f-cad6-47c0-9a4c-0e7ff333641c@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <52e8452f-cad6-47c0-9a4c-0e7ff333641c@intel.com>
X-ClientProxiedBy: MW4PR04CA0112.namprd04.prod.outlook.com
 (2603:10b6:303:83::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS4PPF6EA6DD735:EE_
X-MS-Office365-Filtering-Correlation-Id: e40ba0f5-6afa-4157-f1b9-08ddb248e134
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QFaSB/NcEFUiGUbnxXAH5tzC1DQYG2XmkxUMPXOQ/ZO2Wv4RXPxEFCoieAyE?=
 =?us-ascii?Q?I61MHJeDVc0CLJ3ME1ymA67TYf40YlGjVgd0k0TVSXwF4vUGiGifVq1oEIdO?=
 =?us-ascii?Q?U06Z/Pcz6UIe1tD+slvQE6I7m2bvdUSZyxa0kjpexnbsI5H1atuMR2YkddA/?=
 =?us-ascii?Q?y+NygK7raH0l/3dl4SQR2mpzj+aeOZ8xuhD/Ut68UN8UJLijl5Kea6deCqKB?=
 =?us-ascii?Q?WrKckPuHlP3ZbQ+d+ooNKdQZwv7lxG9fbNhZdRmwDQ888OY5ffYjA2N6Op2r?=
 =?us-ascii?Q?iKn+dYEQCwmjlnAbWT8J3ZQRQH+6jGMQ0eCY1pSMgiyfWfykZelYOObY1c0h?=
 =?us-ascii?Q?8JmwkFwdNAmIkbtmWtLhX4ztOhCEhzkGRJ5DGDCSccm+JuqOJgYL3FAtt02L?=
 =?us-ascii?Q?W2VP9aHUdSLeeCt4hjs4d79kzxPYJVyJs0CVRwhgidOYJRl94c8FmO0ywQCl?=
 =?us-ascii?Q?Rijc8qQy+d4mR64GJkDLVm7Ej6ZvKArRjf+cqdkHbebntU97ocYLCcW/5iSw?=
 =?us-ascii?Q?6nTX2644F6Dq/+DvvZqzT1I2Ufsz0J2Zyh6Um8U4hu1uBcCsSKlI/hg7oI6W?=
 =?us-ascii?Q?jn4mrqOp2bZp++dOckz9r2tLFVpjBhuLnYFkF5R7gnpAsHweQiuAxeVy8rvc?=
 =?us-ascii?Q?n1K02JrADCiCiSL0PYq0U5gZ7l0lVTLiANDQ2ToRDwCsvSCd8JQRu9XBz0Cf?=
 =?us-ascii?Q?OAp7YlJX4LFg/9FtpYT44yXmaUdttMCYZ3VtCMFkNZAl4DY4stw23/9ATOYC?=
 =?us-ascii?Q?nKlWhzaxHmjmm9ztRc0rivbyIR6fttvSlLhO1dLSTVn8StM63AYqJPElxY+7?=
 =?us-ascii?Q?2zJxfXvNPisgkgtkwGIKWQiG4hMoIih32uVfBXHupqWjI87pXKWz23q5lNhS?=
 =?us-ascii?Q?I0ZIOB1rO+1S0EadYiFSie3Tb/r16Yoro/rUg/xYYiYarF7t5HYZAxcrd79L?=
 =?us-ascii?Q?S14TdgGnPUWEOJdEzENo5IN0BsihrBiGm7BQCNOWfqm/AmbW+iBUAQp19Cpw?=
 =?us-ascii?Q?KMLqCqgXghEfOhHCDIWgrDhWGYui+KcXlgBBXWZpi15TZb0lyt5RYNGjUGpM?=
 =?us-ascii?Q?L2qCD9IPK7kCR2uTseT3LfqdEXYQ/D/AnKLqNvHzRLifV270SU69D3YTPzSU?=
 =?us-ascii?Q?Bic1o3LU7UFelIeb2bV66eKCrCcAp0dq/zSi1Q01zmcsHojvZemXLcEpOrb7?=
 =?us-ascii?Q?KgvdYm/XUTuTfY1LMwPfVQIC3e91/mrNdlxgwnUL9/36YMfZ9YP6sQ9pzAA5?=
 =?us-ascii?Q?10upVBIg271N3Re9l9CrqY0TsgLEMEb1/SvPx8EfdtSEybXWrXMoLxW+8bYX?=
 =?us-ascii?Q?964GsJ9DnPleRG/lwZxZmx+ZqowSnFNYxVfkcSY1QzR5vNfVj0foyg9idHjK?=
 =?us-ascii?Q?JQi7RpBVAXJXG6eIg2aUYDx8kCAKA+Fu8INVv7g4nztun+VufINNlp51lck/?=
 =?us-ascii?Q?bWQDMoBeoVM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?75fFfrJQJnvZLYP+0UWS0xcp02NuNvgODhzsh+FtORaSHakzlq5x1fZzEgMz?=
 =?us-ascii?Q?xwBwdXwNlz9VQB+/lownhvEbexRXWvD907TDAsBQ3OQwofDrlVEoy7eTs1EE?=
 =?us-ascii?Q?Pdhf4oZ5P2YhB8un55CTBqqd5H7OZKnaYA0xEeniu6xJJh7nLLOPTxE5g+fE?=
 =?us-ascii?Q?MiYnARWL9GJUi2eBXs87PVNMCRYolZE2UHNdOC3zCDKyj0w/ZMK5gONezh46?=
 =?us-ascii?Q?EewyiPwKsoXAWZ3k1jI5womKffHFrgWOQs50/BiU72eTn0hJ5PJT9vsZB5u1?=
 =?us-ascii?Q?Z4Q2YXxWre6FJAbbBr8j+lTLkLm0bfWYVuXbvbLKcAPnUV+gHmPlSz6cD/xc?=
 =?us-ascii?Q?YVvVYeGrPHlq//S01dTawzutvK/5W9BxSyL63MYuiVE/oLN2/ls95g5rKv96?=
 =?us-ascii?Q?Y6iXusgGf5QKBtR6gaX4X1zZxsBvHPM14rCdCznh/lKdZ81caLhI/OwJ8av9?=
 =?us-ascii?Q?Y/bXtxH4x0jXhAuuah7nibPa3PAkPRrU7DsaxSDiFQbF4vO4KC3xr4FTLZaL?=
 =?us-ascii?Q?NhgAwkjlodtzFmc8HeFJqU7V0H7GBIC6cXAh/rnaoj+CSgvK9xRcXc4ZnFDu?=
 =?us-ascii?Q?ppkf55kXV/NvnBXaFU/531OTbBpXtWOBDRHHtxQa5uznm1pTq2+d2lUBLfwS?=
 =?us-ascii?Q?de12VPPA6Up1ksAFBzmz6jArdnxlxGu3U0NboCPcQD9hKT81QAyvBEZ8WFqm?=
 =?us-ascii?Q?5i8hUKaq0xuwtOzXusjJSVv8hQdDliyxj6X1d/mxBOVp/jMlRllXDKd5jjo1?=
 =?us-ascii?Q?Ko84qiidW5bKd8qcd/Ouprl3TodgqBPU2FqREtd7gg8nvsCACMTYEqnqmTig?=
 =?us-ascii?Q?FMAH2tYoj2bp3wqYhYPoyd0id+i6pD7JlUmyRBcpc2nZBDszzQ7u7mcWZJw3?=
 =?us-ascii?Q?/W2+kDiPZpNS4eRshRsqO4tkEI86/VmnU9dUC3U1RFB4gEVWtXdx6eNgMKdt?=
 =?us-ascii?Q?H/2ACtV2XNT9rNcXQGDmg8PxKcTWb/NujoYSqT+CcnjXxeFsNq7og3D57CE8?=
 =?us-ascii?Q?NfwsIoVo9sZ6P7IWwpw5tP8Q4W69F5P2aWqjZGXNuEDzzrQE5hVeJ1lyPC7l?=
 =?us-ascii?Q?X+WtRjoghPCDGaMezVVzoHzUgM+Dpo2BTIYda0SLGK7RKajELotGXcqhwWwo?=
 =?us-ascii?Q?ymYBAVoPI1fYwapMvD2hWYTeadLmOGkkSIDGIwakEzpBLBenHJyWR7veCciS?=
 =?us-ascii?Q?Glyyw375FoQ6gkB6MUIjdC1Hb6F008ec/ClWH3aGSQVhUWBPTfde5tAiNAuG?=
 =?us-ascii?Q?QqixBjAUJ5+cp0c3xkl66TKl1+WJCiT39ScZ7KtPxGUR3052AMF+8ltoY+9Z?=
 =?us-ascii?Q?ppL66s5ntndZhVJi/7HsITI2j+fM+xsZ4f3AWH3/dGYuTYzYHh5ssIecHi10?=
 =?us-ascii?Q?WQ2ffthvuvb16Lzhk0atxFFk8mzqfOyQfykZEI+6Yr2zlOhbhx9qlu9APXfo?=
 =?us-ascii?Q?ZwJ8ZuVeAzCfh+ROmDPOo654B4pT7WDctFBsseHYLdkfKT2IFJvYOkUmvkWC?=
 =?us-ascii?Q?Y8WvV784b+2JyYrQRQGc6YuXAdWCT1H0gQoiAfIxnqK6HpufUVkGCwKzGYpy?=
 =?us-ascii?Q?4/iX6p+yadJ9IwTi29bL5dIcvRHEytmdCOEMw7emIHLns9+3XNK9KrjSBfVp?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e40ba0f5-6afa-4157-f1b9-08ddb248e134
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 11:27:04.3742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jMq758pCRnZhHdsXCEg/cgZskJcnvYk5cn1heoah7KlCmav743O7a4jI0HvH8pldSZn/RIiOo01TZiHOsurYgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF6EA6DD735
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

On Fri, Jun 20, 2025 at 02:08:04PM +0100, Matthew Auld wrote:
> On 11/06/2025 06:42, Matthew Brost wrote:
> > Clearing on free should hide latency of BO clears on new user BO
> > allocations.
> > 
> > Implemented via calling xe_migrate_clear in release notify and updating
> > iterator in xe_migrate_clear to skip cleared buddy blocks. Only user BOs
> > cleared in release notify as kernel BOs could still be in use (e.g., PT
> > BOs need to wait for dma-resv to be idle).
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_bo.c           | 47 ++++++++++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_migrate.c      | 14 ++++++---
> >   drivers/gpu/drm/xe/xe_migrate.h      |  1 +
> >   drivers/gpu/drm/xe/xe_res_cursor.h   | 26 +++++++++++++++
> >   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  5 ++-
> >   drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |  6 ++++
> >   6 files changed, 94 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 4e39188a021a..74470f4d418d 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1434,6 +1434,51 @@ static bool xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object *ttm_bo)
> >   	return locked;
> >   }
> > +static void xe_ttm_bo_release_clear(struct ttm_buffer_object *ttm_bo)
> > +{
> > +	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
> > +	struct dma_fence *fence;
> > +	int err, idx;
> > +
> > +	xe_bo_assert_held(ttm_to_xe_bo(ttm_bo));
> > +
> > +	if (ttm_bo->type != ttm_bo_type_device)
> > +		return;
> > +
> > +	if (xe_device_wedged(xe))
> > +		return;
> > +
> > +	if (!ttm_bo->resource || !mem_type_is_vram(ttm_bo->resource->mem_type))
> > +		return;
> > +
> > +	if (!drm_dev_enter(&xe->drm, &idx))
> > +		return;
> > +
> > +	if (!xe_pm_runtime_get_if_active(xe))
> > +		goto unbind;
> > +
> > +	err = dma_resv_reserve_fences(&ttm_bo->base._resv, 1);
> > +	if (err)
> > +		goto put_pm;
> > +
> > +	fence = xe_migrate_clear(mem_type_to_migrate(xe, ttm_bo->resource->mem_type),
> > +				 ttm_to_xe_bo(ttm_bo), ttm_bo->resource,
> > +				 XE_MIGRATE_CLEAR_FLAG_FULL |
> > +				 XE_MIGRATE_CLEAR_NON_DIRTY);
> > +	if (XE_WARN_ON(IS_ERR(fence)))
> > +		goto put_pm;
> > +
> > +	xe_ttm_vram_mgr_resource_set_cleared(ttm_bo->resource);
> > +	dma_resv_add_fence(&ttm_bo->base._resv, fence,
> > +			   DMA_RESV_USAGE_KERNEL);
> > +	dma_fence_put(fence);
> > +
> > +put_pm:
> > +	xe_pm_runtime_put(xe);
> > +unbind:
> > +	drm_dev_exit(idx);
> > +}
> > +
> >   static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
> >   {
> >   	struct dma_resv_iter cursor;
> > @@ -1478,6 +1523,8 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
> >   	}
> >   	dma_fence_put(replacement);
> > +	xe_ttm_bo_release_clear(ttm_bo);
> > +
> >   	dma_resv_unlock(ttm_bo->base.resv);
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index 8f8e9fdfb2a8..39d7200cb366 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -1063,7 +1063,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> >   	struct xe_gt *gt = m->tile->primary_gt;
> >   	struct xe_device *xe = gt_to_xe(gt);
> >   	bool clear_only_system_ccs = false;
> > -	struct dma_fence *fence = NULL;
> > +	struct dma_fence *fence = dma_fence_get_stub();
> 
> 
> >   	u64 size = bo->size;
> >   	struct xe_res_cursor src_it;
> >   	struct ttm_resource *src = dst;
> > @@ -1075,10 +1075,13 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> >   	if (!clear_bo_data && clear_ccs && !IS_DGFX(xe))
> >   		clear_only_system_ccs = true;
> > -	if (!clear_vram)
> > +	if (!clear_vram) {
> >   		xe_res_first_sg(xe_bo_sg(bo), 0, bo->size, &src_it);
> > -	else
> > +	} else {
> >   		xe_res_first(src, 0, bo->size, &src_it);
> > +		if (!(clear_flags & XE_MIGRATE_CLEAR_NON_DIRTY))
> > +			size -= xe_res_next_dirty(&src_it);
> > +	}
> >   	while (size) {
> >   		u64 clear_L0_ofs;
> > @@ -1125,6 +1128,9 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> >   			emit_pte(m, bb, clear_L0_pt, clear_vram, clear_only_system_ccs,
> >   				 &src_it, clear_L0, dst);
> > +		if (clear_vram && !(clear_flags & XE_MIGRATE_CLEAR_NON_DIRTY))
> > +			size -= xe_res_next_dirty(&src_it);
> > +
> >   		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> >   		update_idx = bb->len;
> > @@ -1146,7 +1152,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> >   		}
> >   		xe_sched_job_add_migrate_flush(job, flush_flags);
> > -		if (!fence) {
> > +		if (fence == dma_fence_get_stub()) {
> >   			/*
> >   			 * There can't be anything userspace related at this
> >   			 * point, so we just need to respect any potential move
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> > index fb9839c1bae0..58a7b747ef11 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > @@ -118,6 +118,7 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
> >   #define XE_MIGRATE_CLEAR_FLAG_BO_DATA		BIT(0)
> >   #define XE_MIGRATE_CLEAR_FLAG_CCS_DATA		BIT(1)
> > +#define XE_MIGRATE_CLEAR_NON_DIRTY		BIT(2)
> >   #define XE_MIGRATE_CLEAR_FLAG_FULL	(XE_MIGRATE_CLEAR_FLAG_BO_DATA | \
> >   					XE_MIGRATE_CLEAR_FLAG_CCS_DATA)
> >   struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> > diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
> > index d1a403cfb628..630082e809ba 100644
> > --- a/drivers/gpu/drm/xe/xe_res_cursor.h
> > +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
> > @@ -315,6 +315,32 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
> >   	}
> >   }
> > +/**
> > + * xe_res_next_dirty - advance the cursor to next dirty buddy block
> > + *
> > + * @cur: the cursor to advance
> > + *
> > + * Move the cursor until dirty buddy block is found.
> > + *
> > + * Return: Number of bytes cursor has been advanced
> > + */
> > +static inline u64 xe_res_next_dirty(struct xe_res_cursor *cur)
> > +{
> > +	struct drm_buddy_block *block = cur->node;
> > +	u64 bytes = 0;
> > +
> > +	XE_WARN_ON(cur->mem_type != XE_PL_VRAM0 &&
> > +		   cur->mem_type != XE_PL_VRAM1);
> > +
> > +	while (cur->remaining && drm_buddy_block_is_clear(block)) {
> > +		bytes += cur->size;
> > +		xe_res_next(cur, cur->size);
> > +		block = cur->node;
> > +	}
> > +
> > +	return bytes;
> > +}
> > +
> >   /**
> >    * xe_res_dma - return dma address of cursor at current position
> >    *
> > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > index 9e375a40aee9..120046941c1e 100644
> > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > @@ -84,6 +84,9 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
> >   	if (place->fpfn || lpfn != man->size >> PAGE_SHIFT)
> >   		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
> > +	if (tbo->type == ttm_bo_type_device)
> > +		vres->flags |= DRM_BUDDY_CLEAR_ALLOCATION;
> 
> Would it make sense to also somehow check if the bo has tt pages at this
> stage, and skip asking for cleared memory? If we have tt pages, that would
> mean we are moving to vram, so we are about to copy over the memory anyway,
> so ideally leave any pre-cleared pages for another user?
> 

I think so. I assume because the ttm_buffer_object is an argument here
we can safely fish out the tt pages for this check. Will follow up on
this and if this works, will add.

Matt

> > +
> >   	if (WARN_ON(!vres->base.size)) {
> >   		err = -EINVAL;
> >   		goto error_fini;
> > @@ -187,7 +190,7 @@ static void xe_ttm_vram_mgr_del(struct ttm_resource_manager *man,
> >   	struct drm_buddy *mm = &mgr->mm;
> >   	mutex_lock(&mgr->lock);
> > -	drm_buddy_free_list(mm, &vres->blocks, 0);
> > +	drm_buddy_free_list(mm, &vres->blocks, vres->flags);
> >   	mgr->visible_avail += vres->used_visible_size;
> >   	mutex_unlock(&mgr->lock);
> > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > index cc76050e376d..dfc0e6890b3c 100644
> > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > @@ -36,6 +36,12 @@ to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)
> >   	return container_of(res, struct xe_ttm_vram_mgr_resource, base);
> >   }
> > +static inline void
> > +xe_ttm_vram_mgr_resource_set_cleared(struct ttm_resource *res)
> > +{
> > +	to_xe_ttm_vram_mgr_resource(res)->flags |= DRM_BUDDY_CLEARED;
> > +}
> > +
> >   static inline struct xe_ttm_vram_mgr *
> >   to_xe_ttm_vram_mgr(struct ttm_resource_manager *man)
> >   {
> 
