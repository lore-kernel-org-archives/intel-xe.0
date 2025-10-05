Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FB8CAC5B8
	for <intel-xe@archiver.kernel.org>; Sun,  5 Oct 2025 06:35:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59DCC10E03E;
	Sun,  5 Oct 2025 06:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FT1F/qUU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3A710E03E
 for <intel-xe@lists.freedesktop.org>; Sun,  5 Oct 2025 06:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759646150; x=1791182150;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DKaHJD8iR7qAb1fIk+Sjsk5ceQbk2iy8Jj/CiNl35zY=;
 b=FT1F/qUUFZXdHp7hKMvApmQ3zxlHewo3WonG/maVYW4MmtSW2qYaan6C
 zQDc4MNyzxN/zeV1EL+5k4PSIIu8DSHyDGdDuGMR2GxFjaRC2fLlhpNq8
 GQsBUol/bezneJY13+LpYlbxsKYMev/xQHkyew5acmcJ4/OSWvRXhYS/f
 m58juskKbYPqKDjYnCqdyf1z3kff73BKBvEGCuvKSLRLnU0SSybdMmqVP
 Al0j6rFX97YqC27ZXC45XOgzbZndVhGlC1orTtQVcLdwKukaZ8Q72PrZb
 NrhjsPqn75mrFttzG6wqRx+OF3qLP7zV92vh+5L5fsnh1iSyay+TBdXd4 w==;
X-CSE-ConnectionGUID: B8tVA/VfRRiNTBOZnUgQnQ==
X-CSE-MsgGUID: UW3YQU23Q4CDIOT3kaS8+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11572"; a="61905579"
X-IronPort-AV: E=Sophos;i="6.18,317,1751266800"; d="scan'208";a="61905579"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2025 23:35:49 -0700
X-CSE-ConnectionGUID: 7lfuyDCsS9KvjZiAKHdOvQ==
X-CSE-MsgGUID: xGlo+9KgQ0OS4Cel7N6ptA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,317,1751266800"; d="scan'208";a="180047852"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2025 23:35:49 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 4 Oct 2025 23:35:48 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 4 Oct 2025 23:35:48 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.40) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 4 Oct 2025 23:35:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tCxhh3n1cwxSllIe1Gbc5D28iAUc+F/qxPzoGl02JvJZYFMSu3/IGGyqBDfUJovH3Ietrm2dowF4fPJiMOwIOk0le6E78nXc1Q9ZaJfgNe1WxyVPQXvW9oxYNZ2GVpIA6Yb4zy5eXiGQYJvCvscceugCeHLc8mnTLVWML93HEdbmeLUaFFlyqacJftlXCcd7NXnJBc0HIed3UE5antPaeSdOVj8R8qTSoyi5rJmDcXyj2IaVIfi3evrwJoF7H93zNpe3HE0NLAcUzxHmvfHSxAdg1SyKpk0oItoylamI+GCTcxLpMdCc2N6HZwU7ZTMX4oxS5Q98rhGNAPPCxdLTXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6JXC7z7NqHbQQJS8CfeMLlnFEH6i8VqaEJJanKIBXY=;
 b=pjryL/XqAW+dX2mP88UoIhEVtbAUJhtcMzYzWgzOz7Plwltcpj1kve0CxEI5o26fz9Emlbdi9QUL5bMXYzNPwWIXuD2T/UW1j+vOalzcV37NAO0k7lNhQLdnLW6jp0pb1fyHVZR33rBhJUWEek2I8fau7TtyH9WHBLYuFHbG6ishD/tvWgPZwpOU4bKcHciTGXRs5kdGX4osjSMuh9ni3L3osloQvNi7t4X4gmkpjU1m5PsfGe86wGbwf98SXp2qIqmSWB6y2cvF4IUOt4AiGz9dk0it+9SEB7OuitH9Ux6c+UgOJENmZkjnWWOC6Lu7rJsHbBxXeJfQqV3qRjhphQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BY1PR11MB8053.namprd11.prod.outlook.com (2603:10b6:a03:525::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Sun, 5 Oct
 2025 06:35:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Sun, 5 Oct 2025
 06:35:43 +0000
Date: Sat, 4 Oct 2025 23:35:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 18/34] drm/xe/vf: Wakeup in GuC backend on VF post
 migration recovery
Message-ID: <aOIRvK3+v20DrENH@lstrano-desk.jf.intel.com>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
 <20251002055402.1865880-19-matthew.brost@intel.com>
 <f3805b48-f9b2-4b56-90ab-c62bacb86784@intel.com>
 <aOIOn/qZOOOmsUrJ@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aOIOn/qZOOOmsUrJ@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0086.namprd03.prod.outlook.com
 (2603:10b6:303:b6::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BY1PR11MB8053:EE_
X-MS-Office365-Filtering-Correlation-Id: 46d83970-2c2c-48a2-93b6-08de03d968ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HSLXSDzotliYwSSUdNOpxAbwUGR7eAKc4IVNEsBlXOBbGTq3mT4toFxCk4G9?=
 =?us-ascii?Q?MZnrNDYLsZzYfjTR5VIct1vD+CGG6jEIVGo0zrhMY7BrfvxGuFR1I2wJCVCD?=
 =?us-ascii?Q?EoVzXhWH3Si9hu+wJlWReLxMzZqhBx2BcQkmx5pzFIzyEG+Vq3hpQR5a8nSk?=
 =?us-ascii?Q?GtXDvQzQGGlL0QJprsb0wugM4cC1ksyMZ8bYkNnGrj6D9+ItmoeCPe5MLySV?=
 =?us-ascii?Q?gsjcLsF8z7oZ2lE9COgm5enLjcgszQUKLlxUImJ2jkfmrI9UPoedjKOY7+I5?=
 =?us-ascii?Q?wFBqsfCrRj0zSgCzdM2kBkpk6iaGV8yAJ/zkVgbR2vHgfOMpUB2mkT35p9vg?=
 =?us-ascii?Q?YQXZJx6zd8xkhV8J77f4LE90jV7071+/o0eR1s7ZWpuA/62O46dolWhTtTAD?=
 =?us-ascii?Q?iQaAuOl9KK2Q8r00kCM3Cb/FUQFuNSEEDie9QKrdhglbIuyGk17QZOteNhzi?=
 =?us-ascii?Q?DwDpwYHRaaCaKbVRJpDdbeqj7+U9Sllo6EtnMR3IoEQoqoIYicCMoANGred3?=
 =?us-ascii?Q?UJpVoQsTZx+qBIZJX9Oh5LaCEnmnQsnJofzCVsvNixq/KMwaJE85AQrAaMSB?=
 =?us-ascii?Q?qR3qHsCmPU1FIc4ksZotYsU8QpEzVTJMiEPp/H0iIxC8h7MWZPjUtroQ6QrQ?=
 =?us-ascii?Q?jgt1Yw8vImuhUKhpjlcaev++i7MwugQM9oQF7wdJyjcOBng0E/0rka6Pg4K+?=
 =?us-ascii?Q?6ZDYvuL+EE4FpqSTBLsXwLSIxyivx/tbaSIw4v1CoLa3ZZfTWr3B12bwcK/9?=
 =?us-ascii?Q?w1EynKJx6wTmeU92zJHQYbK5h9dQkJZNyl5XAdM7ZYEX64cDC/+C92I/LX+K?=
 =?us-ascii?Q?D1RNXOpfi0XyfNkZLfuXbd25jyNWo1PI5sLjP2dOc4aBg9XzQKakjSGWPnS5?=
 =?us-ascii?Q?y1liU0NvLF2Sh705age6KR2ryT51ETmHOuGkCJyKEYnHyyW67/jQNyrUu7ly?=
 =?us-ascii?Q?nABnx0Q8UCqnGq5MJFaaiSCxZAc+mu0qZJnrCYc2H10fnrp5PZglf5vH5f/h?=
 =?us-ascii?Q?C21KDIRB65GrEJCAyqtb6tHl5KORdaoh+6A2m6/qWO0mmJ1nMBsW7we2+oDG?=
 =?us-ascii?Q?HSp0nwz7Kn1877gMnGPFncR7A2NQDbOQrtkol5eHjSlrGL8fd96u38w6Ngk/?=
 =?us-ascii?Q?Ejkaeq1hvYkKVmRv8vFH8m5K60u5W7meQ/wZzrp6oO4OkZ94LPlYpwQc8tHZ?=
 =?us-ascii?Q?Obu9uqXqs9hl5eKj85TxLW/AyKfbaWwHBM6WKVimgEt175bQadPmMCB7JBVi?=
 =?us-ascii?Q?s3NAes50AzkNsbhV4r/3HW5EW7pNRwhDo7kr9K+saB7tL/uQTtghrHDz917E?=
 =?us-ascii?Q?Mm2QG4ZlhU15NTyv3kZX7H2u11HaLTvzlGsI5WcCA7LHyudzldlD4N++k7BB?=
 =?us-ascii?Q?ltCmgsCnQ8B8UeKlgOD4sp2o4QKCDZnaMQlKtVFvKEN58k/ZG3Sf+PnMqjmC?=
 =?us-ascii?Q?8LEtfRbjZjztH0og5IxRBmkOxBZmyCW7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qGDrTf3gde7RWkdMCQ8l6AcG2u0pnXGkQoh4CIvRmMVpyXfXzc+YK9O9ue/b?=
 =?us-ascii?Q?Yl78pSrZBwhiudgYMb9C1PSfy/hPHwtI0oPt2ldcJiwgA1p06yZ9yciIzwV2?=
 =?us-ascii?Q?dEGB51ybql3zi3qPEYx0nrKq+wUizFfkYq1W3/Qq4UpCWh+CxGRAMyj55syb?=
 =?us-ascii?Q?5urkBmK/D71Y5GasQgrziyfgmXoPPMeEeYTbwggUdBv6dVw2/ozKDN5RvbWL?=
 =?us-ascii?Q?8YPzywulGEMoM1BwdP56IqxV4Afs89QUiD+Ac8RgX2q3U6GwRA2R87iktHZO?=
 =?us-ascii?Q?fZurz/GXeTOekwh5vfw//l+51xljAXztTSl9jMLNwj0qbPDoQRD56sKeOFXI?=
 =?us-ascii?Q?QjNUfeULNY2GoIZE90EuT2TRiyuGFlW+FlZptJ+hpZElFuOXbv0U8+bisYU8?=
 =?us-ascii?Q?K/GLZW5G5AadcIZuCHGGdzvu8VnYBnPuq7N8TeONJN+5M2xCxxjWCwoMsOOp?=
 =?us-ascii?Q?WQhdRjUgIdsHKRbIfu6qJs+EKKmBo66JRRHNxKEoi1bukixxK65MjtWP9IyV?=
 =?us-ascii?Q?sBF48eB6IoCLmgh44QmHfl6eJhHwRb7lEV0EgkhkeX9sYWEb7iQPGvc8WXkH?=
 =?us-ascii?Q?XTynEU5j01pp6upOG4LPFQgvWT6N5z5FEUifNE9KzlzxgKinyASGM1STBgvJ?=
 =?us-ascii?Q?A98fkH53vI/94TrkzpnQYTXin1YAkDrON9eD0/XbezoErpc41j2xt6EArJnY?=
 =?us-ascii?Q?kNJGtB/hZadj46FncSDBoGhQsPI6IbJEjKOBLM1a4rWDClKNb3JHspyQs+Px?=
 =?us-ascii?Q?8EW2VRR0H+q/4MZml4DRF3ex3gbLargdWqkt0Q79/6xEEIcAZ65wOBd3Hk+U?=
 =?us-ascii?Q?EsqeSwrZkBa3B0ggShMTUnHEoHbsDK2CqlZRF1vKsfOY7B0udsVjMMOb9FxT?=
 =?us-ascii?Q?op9pikWcuT7PHu22WVLKPaaNLdkb39c0ZJHk5pKWrYZwEnA1XYMKbWOw8sQR?=
 =?us-ascii?Q?52uK507PQCujWXKELD0bOzqU+mBzriiGd0fk/PyTnVtZ9AkbsSHbvLIh2Zkz?=
 =?us-ascii?Q?4IONgdFpf6dc1hNTdhuZgpRoWexQED9o6NVjVa0rqlTEoNuzK2g6eMe4Y7tq?=
 =?us-ascii?Q?VYlxmg6AoMrQuJDcKVEW57BqsVI0nxEY5CdzYZcTB1vMmGGIHyLqrhiI74S9?=
 =?us-ascii?Q?F5N5EV3F7RMm4B9Cx6EXZy6LJLif9JneXIE2LPXVB6CyQKsAyki0zcycvyGi?=
 =?us-ascii?Q?k8CcceFZY4HlZhUIvBIgD2ZVqaF5euqWcl2kI2hdVhVip5HC5imRUQZYD0D4?=
 =?us-ascii?Q?KdL7g+QJJoITfieBXAu1pfScnsiu1cG7uVPmqRpCagLARMB2ccsE8QJAFfZn?=
 =?us-ascii?Q?Gd0R6ttMRChyQA5W/ePLIm1UOfrWS4JkgvZnn5WpeUcZ4s2kwPXeotlXhU7B?=
 =?us-ascii?Q?JGZZ0dkWhRpCrRBayCRPeSfKEM/Qnxafh+nA1ORHM6r2a7nSw60s00zAJhCe?=
 =?us-ascii?Q?0AvCa7P2zV6zCJ3o1haSwnIVqljaD/+rnjj/2C/kUUbpjdUoEqyVBlaU2Ao9?=
 =?us-ascii?Q?nhEnLRrEDPDxq1baaCFIjGXcFjxbLfiZnAw24jlJWvaK53tjSLr/kUB/E+2w?=
 =?us-ascii?Q?b/crgDdsY5bXndWM5JHH7mjlqc779KvhS00lUZzvkAX7qdpkzXVcgW1DbDaM?=
 =?us-ascii?Q?AA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46d83970-2c2c-48a2-93b6-08de03d968ae
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2025 06:35:43.4846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6KD+rpBdILnnrd/AjAyyFkyEs7YLQhGWcJCHcxRpi3NZ52jkqwPDZLqo4jHzeGleDu8Y/A3PhpKIp0/QxdKY6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8053
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

On Sat, Oct 04, 2025 at 11:22:23PM -0700, Matthew Brost wrote:
> On Fri, Oct 03, 2025 at 04:38:44PM +0200, Michal Wajdeczko wrote:
> > 
> > 
> > On 10/2/2025 7:53 AM, Matthew Brost wrote:
> > > If VF post-migration recovery is in progress, the recovery flow will
> > > rebuild all GuC submission state.  In this case, exit all waiters to
> > > ensure that submission queue scheduling can also be paused. Avoid taking
> > > any adverse actions after aborting the wait.
> > > 
> > > v3:
> > >  - Don't block in preempt fence work queue as this can interfere with VF
> > >    post-migration work queue scheduling leading to deadlock (Testing)
> > >  - Use xe_gt_recovery_inprogress (Michal)
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_gt_sriov_vf.c   |  3 +
> > >  drivers/gpu/drm/xe/xe_guc_submit.c    | 79 ++++++++++++++++++++-------
> > >  drivers/gpu/drm/xe/xe_preempt_fence.c | 11 ++++
> > >  3 files changed, 73 insertions(+), 20 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > > index 6ba8b5703ff2..e8fd2fe98076 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > > @@ -741,6 +741,9 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
> > >  	    !gt->sriov.vf.migration.recovery_teardown) {
> > >  		gt->sriov.vf.migration.recovery_queued = true;
> > >  		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
> > > +		smp_wmb();	/* Ensure above write visable before wake */
> > 
> > shouldn't this be in separate fixup patch ?
> > 
> 
> No, this is waking up GuC backend.
> 
> > > +
> > > +		wake_up_all(&gt->uc.guc.ct.wq);
> > 
> > shouldn't this be wrapped into some CT level helper ?
> > 
> 
> Sure.
> 
> > >  
> > >  		started = queue_work(gt->ordered_wq, &gt->sriov.vf.migration.worker);
> > >  		xe_gt_sriov_info(gt, "VF migration recovery %s\n", started ?
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index b82976f031e5..9320fe9fbb29 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -27,7 +27,6 @@
> > >  #include "xe_gt.h"
> > >  #include "xe_gt_clock.h"
> > >  #include "xe_gt_printk.h"
> > > -#include "xe_gt_sriov_vf.h"
> > >  #include "xe_guc.h"
> > >  #include "xe_guc_capture.h"
> > >  #include "xe_guc_ct.h"
> > > @@ -984,6 +983,9 @@ static u32 wq_space_until_wrap(struct xe_exec_queue *q)
> > >  	return (WQ_SIZE - q->guc->wqi_tail);
> > >  }
> > >  
> > > +#define vf_recovery(guc)	\
> > > +	xe_gt_recovery_inprogress(guc_to_gt(guc))
> > 
> > use static inline helper instead
> > 
> 
> Done.
> 
> > > +
> > >  static int wq_wait_for_space(struct xe_exec_queue *q, u32 wqi_size)
> > >  {
> > >  	struct xe_guc *guc = exec_queue_to_guc(q);
> > > @@ -993,7 +995,7 @@ static int wq_wait_for_space(struct xe_exec_queue *q, u32 wqi_size)
> > >  
> > >  #define AVAILABLE_SPACE \
> > >  	CIRC_SPACE(q->guc->wqi_tail, q->guc->wqi_head, WQ_SIZE)
> > > -	if (wqi_size > AVAILABLE_SPACE) {
> > > +	if (wqi_size > AVAILABLE_SPACE && !vf_recovery(guc)) {
> > >  try_again:
> > >  		q->guc->wqi_head = parallel_read(xe, map, wq_desc.head);
> > >  		if (wqi_size > AVAILABLE_SPACE) {
> > > @@ -1192,9 +1194,10 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
> > >  	ret = wait_event_timeout(guc->ct.wq,
> > >  				 (!exec_queue_pending_enable(q) &&
> > >  				  !exec_queue_pending_disable(q)) ||
> > > -					 xe_guc_read_stopped(guc),
> > > +					 xe_guc_read_stopped(guc) ||
> > > +					 vf_recovery(guc),
> > >  				 HZ * 5);
> > > -	if (!ret) {
> > > +	if (!ret && !vf_recovery(guc)) {
> > >  		struct xe_gpu_scheduler *sched = &q->guc->sched;
> > >  
> > >  		xe_gt_warn(q->gt, "Pending enable/disable failed to respond\n");
> > > @@ -1297,6 +1300,10 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> > >  	bool wedged = false;
> > >  
> > >  	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_lr(q));
> > > +
> > > +	if (vf_recovery(guc))
> > > +		return;
> > > +
> > >  	trace_xe_exec_queue_lr_cleanup(q);
> > >  
> > >  	if (!exec_queue_killed(q))
> > > @@ -1329,7 +1336,11 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> > >  		 */
> > >  		ret = wait_event_timeout(guc->ct.wq,
> > >  					 !exec_queue_pending_disable(q) ||
> > > -					 xe_guc_read_stopped(guc), HZ * 5);
> > > +					 xe_guc_read_stopped(guc) ||
> > > +					 vf_recovery(guc), HZ * 5);
> > > +		if (vf_recovery(guc))
> > > +			return;
> > > +
> > >  		if (!ret) {
> > >  			xe_gt_warn(q->gt, "Schedule disable failed to respond, guc_id=%d\n",
> > >  				   q->guc->id);
> > > @@ -1419,8 +1430,9 @@ static void enable_scheduling(struct xe_exec_queue *q)
> > >  
> > >  	ret = wait_event_timeout(guc->ct.wq,
> > >  				 !exec_queue_pending_enable(q) ||
> > > -				 xe_guc_read_stopped(guc), HZ * 5);
> > > -	if (!ret || xe_guc_read_stopped(guc)) {
> > > +				 xe_guc_read_stopped(guc) ||
> > > +				 vf_recovery(guc), HZ * 5);
> > > +	if ((!ret && !vf_recovery(guc)) || xe_guc_read_stopped(guc)) {
> > >  		xe_gt_warn(guc_to_gt(guc), "Schedule enable failed to respond");
> > >  		set_exec_queue_banned(q);
> > >  		xe_gt_reset_async(q->gt);
> > > @@ -1491,7 +1503,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > >  	 * list so job can be freed and kick scheduler ensuring free job is not
> > >  	 * lost.
> > >  	 */
> > > -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags))
> > > +	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags) ||
> > > +	    vf_recovery(guc))
> > >  		return DRM_GPU_SCHED_STAT_NO_HANG;
> > >  
> > >  	/* Kill the run_job entry point */
> > > @@ -1543,7 +1556,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > >  			ret = wait_event_timeout(guc->ct.wq,
> > >  						 (!exec_queue_pending_enable(q) &&
> > >  						  !exec_queue_pending_disable(q)) ||
> > > -						 xe_guc_read_stopped(guc), HZ * 5);
> > > +						 xe_guc_read_stopped(guc) ||
> > > +						 vf_recovery(guc), HZ * 5);
> > > +			if (vf_recovery(guc))
> > > +				goto handle_vf_resume;
> > >  			if (!ret || xe_guc_read_stopped(guc))
> > >  				goto trigger_reset;
> > >  
> > > @@ -1568,7 +1584,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > >  		smp_rmb();
> > >  		ret = wait_event_timeout(guc->ct.wq,
> > >  					 !exec_queue_pending_disable(q) ||
> > > -					 xe_guc_read_stopped(guc), HZ * 5);
> > > +					 xe_guc_read_stopped(guc) ||
> > > +					 vf_recovery(guc), HZ * 5);
> > > +		if (vf_recovery(guc))
> > > +			goto handle_vf_resume;
> > >  		if (!ret || xe_guc_read_stopped(guc)) {
> > >  trigger_reset:
> > >  			if (!ret)
> > > @@ -1673,6 +1692,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > >  	 * some thought, do this in a follow up.
> > >  	 */
> > >  	xe_sched_submission_start(sched);
> > > +handle_vf_resume:
> > >  	return DRM_GPU_SCHED_STAT_NO_HANG;
> > >  }
> > >  
> > > @@ -1769,11 +1789,17 @@ static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *ms
> > >  
> > >  static void __suspend_fence_signal(struct xe_exec_queue *q)
> > >  {
> > > +	struct xe_guc *guc = exec_queue_to_guc(q);
> > > +	struct xe_device *xe = guc_to_xe(guc);
> > > +
> > >  	if (!q->guc->suspend_pending)
> > >  		return;
> > >  
> > >  	WRITE_ONCE(q->guc->suspend_pending, false);
> > > -	wake_up(&q->guc->suspend_wait);
> > > +	if (IS_SRIOV_VF(xe))
> > > +		wake_up_all(&guc->ct.wq);
> > 
> > so now for the all VFs (without recovery) there is now no need to wakeup suspend_wait?
> > 
> 
> Yes. VF use &guc->ct.wq (a global wait queue) vs. q->guc->suspend_wait)
> (dedicated wait queue). This allows a single wake up call in
> vf_start_migration_recovery.
> 
> > > +	else
> > > +		wake_up(&q->guc->suspend_wait);
> > >  }
> > >  
> > >  static void suspend_fence_signal(struct xe_exec_queue *q)
> > > @@ -1794,8 +1820,9 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
> > >  
> > >  	if (guc_exec_queue_allowed_to_change_state(q) && !exec_queue_suspended(q) &&
> > >  	    exec_queue_enabled(q)) {
> > > -		wait_event(guc->ct.wq, (q->guc->resume_time != RESUME_PENDING ||
> > > -			   xe_guc_read_stopped(guc)) && !exec_queue_pending_disable(q));
> > > +		wait_event(guc->ct.wq, vf_recovery(guc) ||
> > > +			   ((q->guc->resume_time != RESUME_PENDING ||
> > > +			   xe_guc_read_stopped(guc)) && !exec_queue_pending_disable(q)));
> > >  
> > >  		if (!xe_guc_read_stopped(guc)) {
> > >  			s64 since_resume_ms =
> > > @@ -1922,7 +1949,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
> > >  
> > >  	q->entity = &ge->entity;
> > >  
> > > -	if (xe_guc_read_stopped(guc))
> > > +	if (xe_guc_read_stopped(guc) || vf_recovery(guc))
> > >  		xe_sched_stop(sched);
> > >  
> > >  	mutex_unlock(&guc->submission_state.lock);
> > > @@ -2068,6 +2095,7 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
> > >  static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
> > >  {
> > >  	struct xe_guc *guc = exec_queue_to_guc(q);
> > > +	struct xe_device *xe = guc_to_xe(guc);
> > >  	int ret;
> > >  
> > >  	/*
> > > @@ -2075,11 +2103,22 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
> > >  	 * suspend_pending upon kill but to be paranoid but races in which
> > >  	 * suspend_pending is set after kill also check kill here.
> > >  	 */
> > > -	ret = wait_event_interruptible_timeout(q->guc->suspend_wait,
> > > -					       !READ_ONCE(q->guc->suspend_pending) ||
> > > -					       exec_queue_killed(q) ||
> > > -					       xe_guc_read_stopped(guc),
> > > -					       HZ * 5);
> > > +	if (IS_SRIOV_VF(xe))
> > > +		ret = wait_event_interruptible_timeout(guc->ct.wq,
> > > +						       !READ_ONCE(q->guc->suspend_pending) ||
> > > +						       exec_queue_killed(q) ||
> > > +						       xe_guc_read_stopped(guc) ||
> > > +						       vf_recovery(guc),
> > > +						       HZ * 5);
> > > +	else
> > > +		ret = wait_event_interruptible_timeout(q->guc->suspend_wait,
> > > +						       !READ_ONCE(q->guc->suspend_pending) ||
> > > +						       exec_queue_killed(q) ||
> > > +						       xe_guc_read_stopped(guc),
> > > +						       HZ * 5);
> > > +
> > > +	if (vf_recovery(guc) && !xe_device_wedged((guc_to_xe(guc))))
> > > +		return -EAGAIN;
> > >  
> > >  	if (!ret) {
> > >  		xe_gt_warn(guc_to_gt(guc),
> > > @@ -2187,7 +2226,7 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
> > >  {
> > >  	int ret;
> > >  
> > > -	if (WARN_ON_ONCE(xe_gt_sriov_vf_recovery_inprogress(guc_to_gt(guc))))
> > > +	if (WARN_ON_ONCE(vf_recovery(guc)))
> > 
> > xe_gt_WARN_ONCE is available for use
> 
> Done.
> 
> > >  		return 0;
> > >  
> > >  	if (!guc->submission_state.initialized)
> > > diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
> > > index 83fbeea5aa20..7f587ca3947d 100644
> > > --- a/drivers/gpu/drm/xe/xe_preempt_fence.c
> > > +++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
> > > @@ -8,6 +8,8 @@
> > >  #include <linux/slab.h>
> > >  
> > >  #include "xe_exec_queue.h"
> > > +#include "xe_gt_printk.h"
> > > +#include "xe_guc_exec_queue_types.h"
> > >  #include "xe_vm.h"
> > >  
> > >  static void preempt_fence_work_func(struct work_struct *w)
> > > @@ -22,6 +24,15 @@ static void preempt_fence_work_func(struct work_struct *w)
> > >  	} else if (!q->ops->reset_status(q)) {
> > >  		int err = q->ops->suspend_wait(q);
> > >  
> > > +		if (err == -EAGAIN) {
> > > +			xe_gt_dbg(q->gt, "PREEMPT FENCE RETRY guc_id=%d",
> > > +				  q->guc->id);
> > > +			queue_work(q->vm->xe->preempt_fence_wq,
> > > +				   &pfence->preempt_work);
> > > +			dma_fence_end_signalling(cookie);
> > > +			return;
> > 
> > I'm not sure this chunk matches "wakeup GuC backend" commit description
> > 
> 
> This should be in the following patch. Will move the code.
> 

Actually this is related to this patch. As part of the waking GuC
backend, suspend_wait can return -EAGAIN which needs to requeue preempt
fence worker to avoid deadlock. Let me see if I can adjust the commit
message.

Matt 

> Matt
> 
> > > +		}
> > > +
> > >  		if (err)
> > >  			dma_fence_set_error(&pfence->base, err);
> > >  	} else {
> > 
