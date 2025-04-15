Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF35C369AB
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 20:12:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D78710E384;
	Tue, 15 Apr 2025 20:12:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PpJBvcEA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC9110E384
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 20:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744747954; x=1776283954;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4CPA7Na48afkWzd0VDnVQpPE8wi4dwvygDkBlm7zx0o=;
 b=PpJBvcEAgPpJSkUzIChl6PSVpJVbM4pUuniTkvmaz9H66mOs36OnOyiD
 M/wItMlCA+YNsbxt+I51mK6XDH181mKIgkmb2ET9ln9QsYRYVR/hTRV/e
 fqtPSfCgpRpfTWE4hBzkqnthZEnYiux13motbGKj+OGNZKfv0+KqWTQQq
 uomZf2WohVxEgVOaYKZD1xnh1fJie6acJLK1lajE775CMeUaXJsaWf4KC
 +hZBJhI19i/51ZwxoM0uuUvhdYFLyYZNsGmjui4TUI/aK9RzJRo/XS5t7
 qMV3Wt9Ag3UyNJkV/vhjuflHtlPO7hHDfid1BGCWCcgqfpE2SXyUFQoHj A==;
X-CSE-ConnectionGUID: IB25JT0gR/KhWfx5B5sHAg==
X-CSE-MsgGUID: B6rZQ/5sSFaOKQj6AUS5Cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="56939239"
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; d="scan'208";a="56939239"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 13:12:33 -0700
X-CSE-ConnectionGUID: IZWPR//WS/madpQIbB+KyQ==
X-CSE-MsgGUID: QJ/cvyU7Sv6YkTF5sOG02A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; d="scan'208";a="161180131"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 13:12:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 13:12:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 13:12:32 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 13:12:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RhzqTksMK5ccK9M8IakgLIHM3J1vK1JdcbLQVELXsgTl8OfQ3vjcCXKXRuURsxm5SjhRgbZDhO30EmGdBXUwnKP03+ZHrCwaPAqJMXVxZfWk8Iz6/FzHuDbscQzDwzS78pAAtglHAGe4C/IIGqdcRe9Nn6RSVWnXvLZVfhiJiy3t3WdZu+U7RQD8nJlsR+NO5dI3nCHAYRw2Ri6iOMHBgl9FfiVOJvW2qNvJifyi4Rpn2W3gqWAF6vXltwqkGITD6vXyVSWJwJijJZSyCQ2vJUfx2cUcffsmiXIxCgsDPwqPTC8ae/5KOR01satfkwB1nPnpOO+GI5P62lUNWM3c2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dSE8eQ5ekrJdGmayMr90pTFQ844zXRYQ0+y5o7rAEXU=;
 b=ERDLFIY1L3dLr3jbCZfA/9BCzxaDQFVNpAPwBHsIMKNfLww7capa+Awl7qy0bu/hFgNygvP6YPsaF1oVtMyFw03Js50vjM36Q27i/ahysZKQtUutekxUEP2MaMRmJVLWjXzvqG7DcuOtvYzvtyyLta/ejW6Bok1VAmnNOtE7SlpWlQ5zswjCIZb3LRSfoJZYz+kY+zJi+7TvFj81O+8aL+VIfCmw7vbGeecgmFGlTjqKrVFceb40nh969y8stJXrTUyPiQQS0UgXo64Gz1xvH4YcoHfuvURJoUOzEYtdfM0Yu25ERY19UanKs/kPiyi4Y/1d5edp90L/VPl/evKEIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB8478.namprd11.prod.outlook.com (2603:10b6:510:308::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 20:12:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8632.036; Tue, 15 Apr 2025
 20:12:29 +0000
Date: Tue, 15 Apr 2025 13:13:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: Tvrtko Ursulin <tursulin@ursulin.net>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/ring_ops_types: Increase MAX_JOB_SIZE_DW
Message-ID: <Z/69/JK5XC8Rqs6W@lstrano-desk.jf.intel.com>
References: <20250415111523.149214-1-francois.dugast@intel.com>
 <7f71ca43-8b14-4dbe-8225-5ee58e93d22a@ursulin.net>
 <Z_5JqVAicIiZqaC-@fdugast-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z_5JqVAicIiZqaC-@fdugast-desk>
X-ClientProxiedBy: MW4PR03CA0202.namprd03.prod.outlook.com
 (2603:10b6:303:b8::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB8478:EE_
X-MS-Office365-Filtering-Correlation-Id: e1702ea2-003a-4c47-2dba-08dd7c59d916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bkQNqX4rRcutvYOMk3Ng8FvuwKQtJCqTrbR2ojmVG8FhCbSiz26bAXTFqf7s?=
 =?us-ascii?Q?o4HmS6anNY760VXlOjP0wPPDQL2s7gOobT8BkjGGBL8H0lYJm1tvE18qb70s?=
 =?us-ascii?Q?DmyY0326vh9eKKaH1gvm5fv5tv5bqTLvU5fJ3Hm+73khEEFXlZwV92Ty9yaV?=
 =?us-ascii?Q?GlnEgN4VY5j0Ij4kZxty9Xlt7SERnM4vayGT6RpswvYtoYFSeuomQ5gP1N6+?=
 =?us-ascii?Q?7W4nSnmioRHf8QtrLM8dWPX20ED7Mb7ggvWLNAAajG8WKgxKQo0mk6qLXL98?=
 =?us-ascii?Q?Dqv2XnakqyUE1/WR6D7z0klCGWAVHCzu48wchBkLlvfQ7F1pGVVIMQ4ZBpJC?=
 =?us-ascii?Q?Fop4UMhv9x6RPrBxcSHTEjulMn8t5gc2YdKeWlctc4ekCseV3x+Lq43Y5CXG?=
 =?us-ascii?Q?s1ak6taHqBFU1ZuMmNYkq0W0R371rNEIuSzHVUot4ps74ePZCARw2rDMMywN?=
 =?us-ascii?Q?AZ5A4/8maQu0AvtQeY1TFVmITjauOjYwS/HTYbqyfXavwe3oud3HRlN7zcXB?=
 =?us-ascii?Q?uOdlvKS0CuRAyM2BQuNKSsQxflGR+5BqflJSiyFyqcAaKb57Ypp8TwOfcjKR?=
 =?us-ascii?Q?HCDF3wb67eu/kk3DB48w3f3CT5h7DZTE5dsKgHanvwKXzCKd4RStGpqHqrMm?=
 =?us-ascii?Q?DJdE7xStxlUTV2TTQgq8mjetqVs9wLho+d/xDbfrBkF0YYFfG14sV/FPuQKS?=
 =?us-ascii?Q?hycFVqRIde9BQkd+37+wg0h/krJb2c4+ufIQBiPRLUGG0rkM72pZs4zAHhmQ?=
 =?us-ascii?Q?kECSFGd79FW++7T8lPT5jsgXfQEaXKRDVxrHbkGqoIwJbqQ9YtwMhQQ/UbR3?=
 =?us-ascii?Q?uiKJhkDdM55ntdFvFCg78dEncTvO5TiLQ3qJWiu7UnkCxTbm/g1K7n4J48hM?=
 =?us-ascii?Q?IlPXIMi0MGcVa3ed8O43JTH9hKGU6joUbZnbwEdZwqK9vRM9dJozEwQt2juT?=
 =?us-ascii?Q?uPtdkFuCv4B1M91i+ETE5ic4KP0b1CrRoUqqTIsuniVkDalSQ7qxkZZ+fLyP?=
 =?us-ascii?Q?3xQ55cuUbAp3i8M0850V4KDYdMhhMqoQcNHBWHXQBvE1vMzcnhM3iCE4/kw9?=
 =?us-ascii?Q?o0NaIh4ku9bvKFmXJ2CqZf7zu4U5eZUO0vuXTxW+HbRLd4NAA1ymoQa/MW6l?=
 =?us-ascii?Q?ZyBWQkeD/4b421DNq3Kr8ROvODeOnn8XfbxVLxZb/toa/xC21YQ3U7CeoSOc?=
 =?us-ascii?Q?2izUl1KI+qeXtZFAa4EE6Rq/UQjEzTk8vyjpAycCy5sy3h98+YRc4QVvsLdZ?=
 =?us-ascii?Q?w4YUr0fPF/kinVcaVJW5h5y5J/r4MVtCSPOx8k/mkR0cZ+r5Lj4RBG2XgxFi?=
 =?us-ascii?Q?D2mGBAhJZz2SuLoO3M2DQFqegXaHnpGDgbudpQiEyoS/SBJi5eQBozAFLqvl?=
 =?us-ascii?Q?+4dTCeE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OtEBNg/sAVT+zcPDRUeZgRbiOl0coDfAyBEO1i4g1ImpBQtJK9mMJPhA5phE?=
 =?us-ascii?Q?pmYarz8A7XdC+fcBD4I3WOKHxxSQtIVf1YaTvsDD/6jPJuoWhdIeTgvA859O?=
 =?us-ascii?Q?7ikGKE2UYytsE7eWA6sL2iJrS1MCY/G4b6aTB//liu0JhbjYO0X/Y7wGGa0/?=
 =?us-ascii?Q?bteR5YGds4vqtoYzwSy8n5tvmdkOgKLXszBoTWwIV4S8YKWvG3Yy2ENWoXEU?=
 =?us-ascii?Q?yXM0HUMUio/egJawNYeH1huUzab3aMjIQbL6wA2nrC4f1KIgUlZobuRR3HT1?=
 =?us-ascii?Q?5UAiyH0xZxrNTAv++xn9J5OTNOSMPZLmKr3A2j1QDEjUoBgD2/Onw4r8wucT?=
 =?us-ascii?Q?F6v8yi0rblNyFu1llFMHS4wgcUirtI7QMGhOafdRc9j3fAaKnyeGsYLSKqFB?=
 =?us-ascii?Q?8vNbbAVf8F2jwvunWrDRVG9p69Drjylz0WoyQCxxWKU+iuoaR0d2lvzJqa9F?=
 =?us-ascii?Q?dPs1E1IotFN3x8lBVtwPDmNQ+gCSOLTeonurFC1e8BOcpYjIgekaFsDXpYSm?=
 =?us-ascii?Q?3+JmvdlQy9Ml9MTcZdOsMY/ddlhxrWDTw0mkYnxlWpUD9xP7yOZ6FiQDrsjL?=
 =?us-ascii?Q?OfvmQMAdREnrD/pgo0QGRMwS+ZfKdwvVaBgix/6hSwBpDoac1yJASIPyHVpH?=
 =?us-ascii?Q?5KglxC8OyxSkX1ikcYD8VuAVdnwgy5NKGuzJCBb2cgYZa28Te6zTiBem4f5R?=
 =?us-ascii?Q?QUcMvd/HZgxcemQAqFEe1xhLmjrBRX1MswMbx4RQoJ0S92e6X9EkW0NdkMi+?=
 =?us-ascii?Q?/CrZunFo+0NkisacTDI2t68iw3n5dYlVur5GqHbiogFmOuBPY9zJ/rcV88hD?=
 =?us-ascii?Q?p82NRf4CiPiu3aaiZ30R9Wy/I0pzeYUlMcBQQm6D0KQ042hwpzUclOvBT4ji?=
 =?us-ascii?Q?4UCKZbtkGgz/z/lkW4OTG3mOIXMYdQPBQPaJYcWTGM0xmQX/aF7jPqG97FfV?=
 =?us-ascii?Q?CNYj+hcPei6A+rVsp8XcVsCAuLVjJZV2dDKYT9qzvMkLAsMDM6u9PFnlySU0?=
 =?us-ascii?Q?vop7RTjmhR3/FsDoDbYOHrjdx6tO/tuMRoxG4uLCfgQKm+3/yai4n9crZQqq?=
 =?us-ascii?Q?dl3cIh3Pw8sGavUMDdU3sqdRBPKqT2QD67tG2BO9LFTUd5wWUOISngw9CwLW?=
 =?us-ascii?Q?9pP/kGdsUMpU0ITKgZ0w9Ns3CZL53X52dxn6p5LHPsfSwyXaigz0T36Y6KG/?=
 =?us-ascii?Q?VynL7cUQXld2ZbI40UzOVpnCI70rn1Y0cP7WKttdrofkbB4HBA5Je84+dNCz?=
 =?us-ascii?Q?vNxi9RuLP+Jq+X35bZzKm7ua7uNihRl0MJRCrDBmGSSQ0jbAYzI8N/CehdHL?=
 =?us-ascii?Q?wTsTg8pn0Hs5i2Un3P3ImgNkGPOEH40po1vUwlaK30vUJlGivjLGYInhRzwG?=
 =?us-ascii?Q?VhjRGj1Cmu1W071rHGlI1Dr4JG9TUeL/hXBT74QNM8V9stSdy/WyGIb71WVk?=
 =?us-ascii?Q?yKKvRHo1kaky6SXrQEDno16EfbByfMXhGn0mquTDUh/JiZUP8QMZyTLOHDsM?=
 =?us-ascii?Q?b49Xa4EyDANP8Qu/CmpUYBvPbFUgKtqF/7KG8ZmhI9uZNtjcfz1AMMx705ys?=
 =?us-ascii?Q?t8pFL6XZbYUhYXZvfoq4KfHBEOnZDYJkSymSUQnzPB1OZYhuINaRiBy2Pzjp?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1702ea2-003a-4c47-2dba-08dd7c59d916
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 20:12:29.6604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PrW5d2MSEqPvQsI86ax8i8JDRwJfT9ZstEnS8jqfnhIOidgjE0JZDipVX8m/T7eqC5j7gx5DoXkNtUe1CGCXYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8478
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

On Tue, Apr 15, 2025 at 01:57:29PM +0200, Francois Dugast wrote:
> On Tue, Apr 15, 2025 at 12:45:04PM +0100, Tvrtko Ursulin wrote:
> > 
> > Hi,
> > 
> > On 15/04/2025 12:15, Francois Dugast wrote:
> > > This limit can be hit, for example when running IGT compute-square on MTL:
> > > 
> > >      [   63.582385] xe 0000:00:02.0: [drm] Assertion `i <= 48` failed!
> > >                     platform: METEORLAKE subplatform: 1
> > >                     graphics: Xe_LPG 12.71 step B0
> > >                     media: Xe_LPM+ 13.00 step C0
> > >                     tile: 0 VRAM 0 B
> > >                     GT: 0 type 1
> > >      [   63.582408] WARNING: CPU: 0 PID: 2439 at drivers/gpu/drm/xe/xe_ring_ops.c:395 __emit_job_gen12_render_compute+0xa7c/0xc70 [xe]
> > > 
> > > Increase the value to allow this test to pass.
> > > 
> > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_ring_ops_types.h | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_ring_ops_types.h b/drivers/gpu/drm/xe/xe_ring_ops_types.h
> > > index 1ae56e2ee7b4..121279c826eb 100644
> > > --- a/drivers/gpu/drm/xe/xe_ring_ops_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_ring_ops_types.h
> > > @@ -8,7 +8,7 @@
> > >   struct xe_sched_job;
> > > -#define MAX_JOB_SIZE_DW 48
> > > +#define MAX_JOB_SIZE_DW 64
> > >   #define MAX_JOB_SIZE_BYTES (MAX_JOB_SIZE_DW * 4)
> > >   /**
> > 
> > I've sent the same fix two weeks ago:
> > 
> > https://patchwork.freedesktop.org/patch/646815/?series=144186&rev=5
> > 
> > I hand counted 58 dwords is enough. You think I undercounted?
> 
> This seems right and I confirm it is sufficient to solve the issue I
> described in my commit message, so let's go with your version.
> 

Either patch LGTM. Do we need a fixes tag though for backporting?

Matt

> Thanks,
> Francois
> 
> > 
> > Regards,
> > 
> > Tvrtko
> > 
