Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1300FC021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 05:32:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E4310E13F;
	Tue, 25 Feb 2025 05:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gvSPuhYX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E106910E13F
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 05:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740461554; x=1771997554;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gINciIvPkca59AqWS3/509/bj4xTUED2TdBuTYC5ls4=;
 b=gvSPuhYXJTYdPbihoy8BPksN2x7dxm8KTMpHEQUwQ0baa3CVECQZrbbS
 t7TK3+kyWnT1X6FuHhab1680+JZQ2oBkzEJStzjdk6YtIKaXhWD2HQ68s
 v/faRauraodFXOkAODoTCLyHqZ33yo5+HGS1eBW7STYlqKmUvzyP9zB5F
 25dWX3qJ+SYTTF4ersFYASjgbkxA2h+0+ItZ0B7Pba5jHM1O4QI5vP/uu
 qf3T1ug1+mm/CG8oDqetTAIkQ76oX/adikGkyCRoHZq423N9y2NN4OAJf
 3SW0oMNChnJUVCwZJnsDVDFzSCBRIV+yI63ZITX2l8pocHw/bSOgDVnFg Q==;
X-CSE-ConnectionGUID: Hokfbk0BQDS3uvxHdu558g==
X-CSE-MsgGUID: j5Jy8qttROStMjsx8nvkRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="41386612"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="41386612"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 21:32:32 -0800
X-CSE-ConnectionGUID: GGHbpKgdTeeIg+liKcnb7A==
X-CSE-MsgGUID: XO5oLWFiTEuEbA8TkVvYuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="147164971"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Feb 2025 21:32:32 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 24 Feb 2025 21:32:16 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 21:32:16 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 21:32:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KyWEQmuy85k1VI7eVchI4z1Q2B4Iqs5NB+LGFd90NJSCEWnPIViE57yyCWG50A9XXd1tTwsYv5BBWI44KJph7BLMgLOppWnEfJKUfBuIy7Qcd91KHz1EaA0VFA5pNDw53EoM0fT+hoIEzcBPk7LlFvLn/IDv3h8a/PXSmtT4YWjyaKggydOdPpkxwSPbI8vaWg5B2IMOupnqiHcMU09QrWXGJKMuRkQU8oyKy7k1FaCLpS/uC65/bC509hDy5NHjtkrkjocBbLQH95SNWu5x0gI6xLXOMLTGNKJh/HTngfN6V4m/UszulbY+DSmA9TFWx9gb7Y6sM0gF4vX4XZrs+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=adlQDJmJqUsT9hi/fy1euqm3ZYxsQaQK/3zGLtRQGM0=;
 b=XoDqjc2KZO9QEIBTB9UpWK0ydcOg6fPLYhTLXe+QQB4an0LHH0ONsZgQ7dZU9N7PlKMvXSvPY728MDql2syAHLfqzsNbRhnH6+7s7HNoertidlz/aNQu1c3lKmZMqczE0XXBz2G7iUUAHJU8AQcIXHiZHdCg1O4xOJVmpK3zKLk6lDtaIk3y+qIZ9cgXawOBrWXDJ/cjvXX0ZeD4M+a9Maf6mhLAQveCQkb2UzrUhis9Qa/R7QOgslh9Coupp//YG+RCZPUlN2l17dMTp8u+SFOq7Tmac+Axo9jwivWSZpZGl316Olv0Yxzz7O+Ob3Ejad13L8M3zH5ZBb4mKQzXcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Tue, 25 Feb
 2025 05:32:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 05:32:13 +0000
Date: Mon, 24 Feb 2025 21:33:17 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH V3] drm/xe: cancel pending job timer before freeing
 scheduler
Message-ID: <Z71WHQu6dKcw7nbF@lstrano-desk.jf.intel.com>
References: <20250225045754.600905-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250225045754.600905-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: MW4PR03CA0045.namprd03.prod.outlook.com
 (2603:10b6:303:8e::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: cc2347e2-278b-4fd8-41e9-08dd555dc22c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oeLv8BBYBup05rdSxbv64GNvN7Dq83XnUsE5+akHzg53okkruyc9R4tvmpGv?=
 =?us-ascii?Q?gh3eRrYs4JmmvJns7BXjRung4vaDyK8NwFkjFCyp/rujUFpcGNuiJJMMPGRL?=
 =?us-ascii?Q?m578R16B9zBpne1Sfx447iKJb5gNBX8VConz9M+Nh/xDplLUMui4GuocMd6Y?=
 =?us-ascii?Q?tMgng1i3SCOqGEV7V98iUX34DmtPJlQ5B473uPPOLY5q83wpf3h7WWvvjZDp?=
 =?us-ascii?Q?8xsTeGlZxP+ne39DeRHB2OGW+ZO48klbLPJXnOFOG1tR9Iaa9OgLbwf7P7d5?=
 =?us-ascii?Q?+mFMNwk+Be94yMDNReYvPn83QG2IZ3rI7hsG1VX0TpxQuD+klZphXTt01vd2?=
 =?us-ascii?Q?lwgH71bKaRNh/uKqOlNNDYByNxw0WufBpbbuhbQQiPv7JkwJ1W6hv/lvmseD?=
 =?us-ascii?Q?ELZ18TM7Nl5e4uPmoA1tpEB/NgE52nGh5ndxgkLA+P5fpme8so+abSw6loZM?=
 =?us-ascii?Q?DCiIKTMOezk+A3camzJovpRrU8nBrdO+7SsmbpvvPbA4XNie4svoZvZh7hDp?=
 =?us-ascii?Q?0r9moAuWGm4/B7t7vtLlYevV2B2DdNcW611KCarzAOX7YnW7HA5fjDM2h4zv?=
 =?us-ascii?Q?Vk87xoIi+GA//sCVYurgON/XWjWOFdFkTBNGXoYhJvNd0No65AS0GjNhj7CT?=
 =?us-ascii?Q?IFm6bHVZ+I+VjQ5jxawFlSeAt67k2KQMRhPjHbEnjkfxvcTcUHQPDqQh2yZM?=
 =?us-ascii?Q?FdDIdTA+9A5lGsjQ8d6POnJ1gNcD1CR/BwSyOEx6jwcWq/t8fN5h/GLJFVfS?=
 =?us-ascii?Q?3xcmPGeQq5B/kw8/Zlk+3mk6pjBlMqjkWofiHP/m/nbKOw5nP8pMJLju/W6J?=
 =?us-ascii?Q?G9oyeZjVXJ4tXklnO0biFQi5zRrHbMRAEDLtHZt+pP+DugVGAsLZU9z0nhwy?=
 =?us-ascii?Q?B8OGpd5XnECjOfspHvJ4cf+YJu1U4CrCKvyvFf8oEk1mKt/aBObSr8lpznRl?=
 =?us-ascii?Q?0t8kZyUyc1C/FYmSZ0pMhIRj9Qki9xssw+zSwjPRZoILW0UO46NMganfcbjE?=
 =?us-ascii?Q?wdam8KsiHdbEHqikVOqeGkbFDqUt0dAaswvyuGsyPH7xM1br5cn7dRTBZWoQ?=
 =?us-ascii?Q?2cbNXkDn+vw0ldlXNCYNiGM7dPyj4IloVJ57ilrQaDVZTgKzbSHfsktu8L7A?=
 =?us-ascii?Q?k/N9zONUbE+cooE5XusXb0I2mk6EKTAm4nZ/ol2kcSuLPTkEEq+1e6AtQl3+?=
 =?us-ascii?Q?7SvrU2jKjQC4rkOdB8jZyWjC9Hj8CHgOU6P+WJluyyo7o1PDFCfIXG8r5VXT?=
 =?us-ascii?Q?T8vRTc9VdhrCF+sK4iCs6C9WxF9B7/Qy+/+//m5ayOILMyytsiHkbpcfnDpV?=
 =?us-ascii?Q?3EUlvMa0dSqnv2od43Fd+rf7fc9x8gqYOsRp7dTgm2k7vFUCyPRxF+MMoKmP?=
 =?us-ascii?Q?6mFBB2iY3fC8sch0Jgworq74W35o?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A7X7jwVoGtQtB/rbFNJSG2M47mNrGa2PqGubwP7XYrgrNtxEByGlcQ5mj7oC?=
 =?us-ascii?Q?fA8dTQMUraOC+Gg41IVbhGa1/gKsqtdu927PhSRhMrOdVMLNa0F7LZBvf9ns?=
 =?us-ascii?Q?BvNxNuQ7zlGPEEiGSFxj0KtBGffByGr8JdWOzxIRN+TwLkBIsLkkcEungp/L?=
 =?us-ascii?Q?QQUKrB/9WVF/G1Bqyv5qZgpGHWS8cSsSuYCxOdhuxXeSdL63YbXHVKlCDv72?=
 =?us-ascii?Q?RiVgcLbKON/QV/HbzQqt9eYdix9hZaJ1vbZJ3utdhh8qahzdZM2kGHw/Rl1Y?=
 =?us-ascii?Q?QM7RpFUuz3J1AtB0J1TWl7CvrYyGdrNLMgBa4+Z4hBNGAGO0GcHUGs1tLFFp?=
 =?us-ascii?Q?d0JKhfv9c913RzZc8QD+4JQ71sHYzW3NuesOGBHruOqlcQnpSN4E5Mhebi+W?=
 =?us-ascii?Q?VwtQ4NpCxRIpWoK82jbCoUEWDwgquWp+kQuYPIe+PtnFUtjiJTo2xUuxYto+?=
 =?us-ascii?Q?o1iI/cKFKsjO7KbzBzdMZjj6/bZw6FkyazjwbovD7PCy0cBdS0YFrybyKa52?=
 =?us-ascii?Q?FrJMV0PYStD+jVr2W5VZ+hPxqy40s5rOKtjdkCk7ET91fJ+T4Rhsd+Zmf0QL?=
 =?us-ascii?Q?4DwqhCt+lRXYwVgWZpet7vENH529hi/fBD1jIx1D0WZu6LzxzeJ4SpYyeu8y?=
 =?us-ascii?Q?NMBP8bNCWO73dhBKcoIm/oQDwh6MTzxht5DBmKZdIYjcAtgqY+IMnHlgLD6Y?=
 =?us-ascii?Q?L+gk3nx+FUHzoxN6/76jh7MrXvFSnHA1u+usf1FN9xZKbt0ATGpzxXZd5+rm?=
 =?us-ascii?Q?30rishgAV+UGZZCYJIYfavQPkdGonhQOGaBhTY1RTG4E9aVkrHiFVV1VdL9Z?=
 =?us-ascii?Q?RGywE3ENUph/68wg5zAb/LS/hiJBqAqWnhLCMmdvXYteY/lvypQz7QdD9Nqs?=
 =?us-ascii?Q?fOlDU47aBa2RNwx1II/PNp38x4Zk5ZVUuaAZfQ4me5MhHZOzFyoL8+yuNeea?=
 =?us-ascii?Q?I7f3VYeIwlLovk4itGu7/EOfp+WXyrmdL0voAuhuD0sZVgCgqnbaLIS5m+E7?=
 =?us-ascii?Q?5+1G73OGc/CfoNA+3BBzVWLZgo5I9V6/VCpSErhuBoJrl4p2XxuOcYPUKGxI?=
 =?us-ascii?Q?hiAeb3W3Vdx/BSBjw3Tg4rQXwLaOzgVMFJgac5HfMKocyEKvRuvlxObhMTvu?=
 =?us-ascii?Q?UR39zYSUVkyCXf3bqm0qjWkgL+780zBX2jqmxOINcWOJTRZNHBcVt7WCh4SI?=
 =?us-ascii?Q?HQh1sWUnbsYCT6VhoiJw7Q0KWz40o4BaxtDWiOYPcw0bhdpNqw7EvUDCV44s?=
 =?us-ascii?Q?qcFmVf5f1fuNUD2Hz4vVdpxMC/a/WXMOdlEVD5vdhr65aFqM7UVTXWeRMCuv?=
 =?us-ascii?Q?nbyMDq0zdU74xnKsxpBPQAL+3oaactcfPoE29AOJmJRNPBFzmW37B5/tHqcQ?=
 =?us-ascii?Q?E3pOVr6RSbwcLu9Fldjt2ExrEm+S4940Rm/wRwIhtWXNRtG7hSTAowICbjIp?=
 =?us-ascii?Q?8QUqPm5d2iQV3TQOxiqAwNyoiqMbFJKX0URrgvlRc9mXsacDC6vnYyGc8Eaj?=
 =?us-ascii?Q?BjSUEyXtxIqjBpfJb8dTV0fnCPTpGJ8E7duLWaxd8SBELXopDUnpf/ft1iEv?=
 =?us-ascii?Q?/06GwSOEyyyK6UilImWU8T9FJ9uFfllXQt4VpTjbo2RkHHOpHBCbtlbfIQ9U?=
 =?us-ascii?Q?og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc2347e2-278b-4fd8-41e9-08dd555dc22c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 05:32:13.5987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JbqQI+4rm753Pyhq9LCoj+vAK9xrmJFHHTPYYBoW+CDSw7gip3YdY3qrNNZ8Z97wC5y+a6vR9ieCLUI+Ck9Kuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6053
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

On Tue, Feb 25, 2025 at 10:27:54AM +0530, Tejas Upadhyay wrote:
> Async call to __guc_exec_queue_fini_async frees scheduler
> at the same time when some scheduler submission would have
> timed out and restarted. To handle such small window race
> case, all pending jobs timer should be cancelled before
> freeing scheduler.
> 

'The async call to __guc_exec_queue_fini_async frees the scheduler while
a submission may time out and restart. To prevent this race condition,
the pending job timer should be canceled before freeing the scheduler.'

> V3(MattB):
>  - Adjust position of cancel pending job
>  - Remove gitlab issue# from commit message
> V2(MattB):
>  - Cancel pending jobs before scheduler finish
> 

Fixes tag?

> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

With above:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 913c74d6e2ae..b6a2dd742ebd 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1248,6 +1248,8 @@ static void __guc_exec_queue_fini_async(struct work_struct *w)
>  
>  	if (xe_exec_queue_is_lr(q))
>  		cancel_work_sync(&ge->lr_tdr);
> +	/* Confirm no work left behind accessing device structures */
> +	cancel_delayed_work_sync(&ge->sched.base.work_tdr);
>  	release_guc_id(guc, q);
>  	xe_sched_entity_fini(&ge->entity);
>  	xe_sched_fini(&ge->sched);
> -- 
> 2.34.1
> 
