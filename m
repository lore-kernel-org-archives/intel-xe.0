Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94B2C25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 22:40:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5753510E3EE;
	Mon,  3 Jun 2024 22:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="da2CcI3G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E2F10E3EE
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 22:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717454446; x=1748990446;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kBicD6oBe9iI0TLsg72Hmnw19aSb1naJ0SYfZLieaok=;
 b=da2CcI3GLoeQwtGZnYIzz+04aRTpUAhl2k2XiwKlTv50G4r+puVnJezP
 xNytn14DsWHMpUn3H9SuYPwJEMo00rGbV/5a4jVPmaXaycvvyNFEMXHUS
 KyrEoaIiESIaHb02UKDjHKNOxELReRSEQ++NvH1/N/WriMNgKjU42l5d9
 J6npFDjdXiDkfXZhQaNdphoPmwNS1Vnr1MjRAZifdSUv9pzIE9ZaaPvjX
 Ziobjv698NYBBW34DnQyRVxa/n7jZaeC15PZjSDTtWBmP+h9v7fdJ2Yox
 8v3I2ZdO9f4nuGo96qX71tOYzsN5v8y9oMycus/ltmVWXiSZcWSongkqz Q==;
X-CSE-ConnectionGUID: M8LFw+NEQjiyntLPf+eV5w==
X-CSE-MsgGUID: ryM8kQXvS2ixDp0+srtkJg==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="39380421"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="39380421"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 15:40:45 -0700
X-CSE-ConnectionGUID: SoUFAVhfRa2CwhYQ0ju65g==
X-CSE-MsgGUID: b2C8NiGsSJuH8AltCrcU0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="37141091"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jun 2024 15:40:44 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 15:40:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 15:40:44 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 15:40:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GkDsR8KRAuUg5lXzHgq29GZjmjip2H8CpzqOcrVxlfzcSUoHFTeRGH0lb231b8S+Zx6kFT/Da1XtoX7aHd5GV8Ka64KQszn76DNfQNXclYQ4GTZQ+c27aWDDuP1SQJAnHOcNK6oq3tnMQcB1errM+0aTFwB5Exs6GpDE4ulBI+hbQdI1vxdeIQSCtXKgR/GPHYYyDfwUa++owSSxyONwvjbov9irnCzHi50/OGaTv5bs7S9gjPZaoDa1XtpFwbwoXb/l7ZsoFExtCBXaLMP21srustBKrg6ZdQOkwdHdIOywVLUGc+orVN+SiaAw/2FpDHjiIkJrveKqKGjW84tU5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vKTevZ6a1YElsIiuHhrIwmTb6pJ8lPLW88Qx/lBBbsQ=;
 b=SMkWZV5LSMdLw77fTebNFPFQX4YbrLVh19RR8nQg8M5r4culvA8ppYUSDfoxfubT3fXmnOEgu0JP83scTo0tDQSUTW1L5PkzOlK9Idz2zfCL+CJ/kjxmGoVoVHp0pLZsf2kVfIhXeM+Lgd4r47SdZukJTxV0Bo72H9FIwpGwhW5QBWwhTWFDL52n6TwV3ccXeiFwsz1K5G8+ieWkNneaGMVH9WymG8TFmWVsSpRWlkZHwfEEI/iuuu8uScaIgusswaSv6HwV7uted8kwL6KY1+zclLNVBKwkuafvThl3xTob1Sgf3zYNOL1BHWhKJ3wGcAgR+EJ+gl9Lz/HUrkftQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by MW4PR11MB6935.namprd11.prod.outlook.com (2603:10b6:303:228::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Mon, 3 Jun
 2024 22:40:41 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7633.018; Mon, 3 Jun 2024
 22:40:39 +0000
Date: Mon, 3 Jun 2024 22:39:55 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <john.c.harrison@intel.com>, <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe/xe_guc_submit: Declare reset if guc stopped
Message-ID: <Zl5GO9ETvpzwfwbs@DUT025-TGLU.fm.intel.com>
References: <20240603210554.2458942-1-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240603210554.2458942-1-jonathan.cavitt@intel.com>
X-ClientProxiedBy: BYAPR07CA0065.namprd07.prod.outlook.com
 (2603:10b6:a03:60::42) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|MW4PR11MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: 7736088f-81ce-4277-5524-08dc841e3136
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U1xQm+jD1PsYYz9tQVdNYP6FBAEagRUHI5aDdaum+CV1/XZPyYlmrM/5Kyz1?=
 =?us-ascii?Q?CBCPue1gCxKbSgENtx3pRRhShBZF+gIkt/npx7OFLBd9nd6TRIIxXdRQ8nH3?=
 =?us-ascii?Q?9phn+8VtutCmWNh4FEQN1Z6qHD+UgzeOZWE23JlEAgH+Pqt7D9UXi/VC2FUy?=
 =?us-ascii?Q?7w6U56306EEMasSdAtByEUcb+Rh1xTzmAXjJlYgXzFDYeNTLampTeTRDaVWk?=
 =?us-ascii?Q?hwK4h94ECmHuVekB5DpHgoZlvaNxwiCgONMYA2mzn49/d/RAPkBtLyL+6KZA?=
 =?us-ascii?Q?HCButhheCxRPwgYl60hAGJydhDq93xrxACIxymJwAN3Q7ciJcuKQ8SxTlrVF?=
 =?us-ascii?Q?+N2Zqux1WEcm2Nyy0NBjTdN0UAl/9CAPz/esiYZMIY23f5ckhbiG6HdCziQ9?=
 =?us-ascii?Q?v1qN644J8hxVZvUA2L3xcwYY48Pr0dLVT5VvRp8hJ2885LN4I2ZiS5mrm9fi?=
 =?us-ascii?Q?aYTt8JqSSSKH8Q0qiLK93h6/HjWiV0mCdvkqJVKPeKfXeR/iRkL6W6YSfzbK?=
 =?us-ascii?Q?dwrX5POucp6UaPhOvr0j9BaFRYsRKG99FqsDsDHiAQREtvS8c0pTQ7yV3jDX?=
 =?us-ascii?Q?kuC+Lyn+ejNBBUi/3zkwKxwk6DUj/hZ2vJbGUTdnTIufafGLfyMwtDRgkoSd?=
 =?us-ascii?Q?MX9j7DTUzrw/O4HYhZIoUq0SQIy7eiSCDyblN1jsAoxLWVXV/dPrRDMMcaYZ?=
 =?us-ascii?Q?QL1eL65YVRHRW+PT4GvXQQug53Vvk1BJguQ1mEZnA89JyQ42eA0NQxbgxxEA?=
 =?us-ascii?Q?822pi3Ei+FlkyMPr/mVrCAa26Zr5s+nsfHy9uwcL9bNYwYSNULwuUrE1DkKp?=
 =?us-ascii?Q?ybldm4HDeawiWSe8JpukH41SfAbxGcxYHz69IVkqi6+rD1dcYFzolq0v5JDI?=
 =?us-ascii?Q?aOn28Nh5QAptVa+A9Bq+68ijCc6H2c1LnPJbGzckJn6B6/U5mmyElEwiC+jx?=
 =?us-ascii?Q?dPNxuQ43zBzDlGBzb3XAla5bG94I3o5XB9sf6ATPhnYmDjP5VUbCnZXw2U3G?=
 =?us-ascii?Q?qipttLaKgIpTfkCPNTxGjMkf4YMlxzCPbTuGSkoAypX0BHac7rONKNMoEwbp?=
 =?us-ascii?Q?E5lS0HcF3y8hvL0Z0NFyXGnCKsQ++KTe4uFWW6nOh7sAAMdpS6PaCFL3lsmI?=
 =?us-ascii?Q?eXHOmQcbF/jrFoYtz/CC/459vVzK3WoNTq5/6w+C0i71tf/FU3T6nB/e2yGv?=
 =?us-ascii?Q?0jzFFRJOm8SKcujU9rqziyJRhj5iVqC8fjWFBP6Pdt6O6fNjLzONvgZBdnt5?=
 =?us-ascii?Q?DAJ5u4mXeqanG5avivwaWYNzuERPyhM0Wkiyr8ZAsg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xr7TUjTlIRH1TcVfMeqZg34cmSQE/6eRkyVcBvBBhGW5LtLJJiL9Dml68hzF?=
 =?us-ascii?Q?TVbS3o9X8Lk42DbnaaKYI78VKWPISP+sbb+wK9Se7/HRKo2qtI1MZVPqF0on?=
 =?us-ascii?Q?MEtWTTK4N/5Eag82MAXjjo3Zi2rPdSgobZcxQ0CRkwfODq5gConKc9J0ogx5?=
 =?us-ascii?Q?vsCXJGGW6kTj9SNnxNBvSjng5uwPevwK/zrdvg8X2WpgjxX1oMrfRc4+FS9x?=
 =?us-ascii?Q?NJyLw1/YCoyZLZFG6Pv5fjTRoNNi/SLI/7vwDV0v8xsWhvT+I8m7RJJUq5Rt?=
 =?us-ascii?Q?07iFwIqOzzqg5vjh/UpaRNhFu/O/mz+fEOeephjwxRRbcxHW2mcNNHxD7igJ?=
 =?us-ascii?Q?kVHUgh6udb2sj4kB6TZeZbFbN3tIQKcYXSVlZ4C3zDwHEIFnTdML4cOp2/pV?=
 =?us-ascii?Q?Fu/HijatpCxsuLtAyNsyFTFek+F92N86RR/15pLR2Oegs7twAukVjwXB0jxd?=
 =?us-ascii?Q?Jwk/OBaxib1UtQXJ/fOtYbMS55PUQNejWR7FSyrZTPFsSOPNAvHBUgFa1B2y?=
 =?us-ascii?Q?KLKdFnro8XvkYp42cMZupNLIPuN1KsjWqF03Mt5K/l4/xjDrDG74ZyuIYW9x?=
 =?us-ascii?Q?ON27FuQ84n6brW4zE/OYJe4+F2LvJ/QjolYcduNuP1PQH3twdCNC5TCs3lDd?=
 =?us-ascii?Q?pYMFnhuJx4Jew7faGhPjyD0Ua6hd0d67zDY+j/jnDQn7q2obhUTrV9hC7tFN?=
 =?us-ascii?Q?NO5meKPMNrDsV5nG4ddfMc0rwkVgbUb8/3IZEysfv4obNiiU4Vr2u63GxKe1?=
 =?us-ascii?Q?7dMjgnhscqo80zxfld+dm3j0wUFnOj95mvJs5H3sij13HYTI1IBARQ2JvwCF?=
 =?us-ascii?Q?qL6v1Lmz2lnE7+XfbL44NaIQC3J4UbD2OfakSSMUnof3eCl29RIVxzD1ZeRV?=
 =?us-ascii?Q?gDnRwDEzk5Xf3DlmkeV4+CO03GkvIzDKKbEACQF24LgHdVWjnW7gjyDB4Ynk?=
 =?us-ascii?Q?jKcUq8Yx6hcKYFNeajOPG4V18qXEMM6YwhsJDfOjvn49EJok8LhtVMJ5N9RT?=
 =?us-ascii?Q?veVkUWL5b67XsXla/YDCG6zM3tI/pMha3HOTalF+oGV8eFi3WPNOGY/3527Y?=
 =?us-ascii?Q?2yrcsHXXWWlg5d52PdvXra4Ff5Wmf1qWwwAc6ahU5CE5vSi2E+aKBTxiGVKn?=
 =?us-ascii?Q?Va+O2SeeOdGIeGUs2GSR6K8sojbdvZ4F3wgeoQ83qQJQTnwZveoUlr+5jWux?=
 =?us-ascii?Q?G1EYlQVC5zoNGELSdcqWTQlltBiT/UeMq0TKRVWB9VmCVqpJOjdUQLHMvbP/?=
 =?us-ascii?Q?gMf5TD1OicCtGpv6+V+SowKibd9VLUla6BMrtLOVfU1cm4IYDn4NXsnkDFZI?=
 =?us-ascii?Q?MVw1BqB2sshE5+ZW2+CY4Zd8mIZYNKG4ixaFMVeNyL8Upog8Yex6nXkL8ZSw?=
 =?us-ascii?Q?CwCYdVTepVVKcTIlzC3so+Y6DTaY7b/vjKKSC1QDNRP2HrOgzoRmqrfLzNBB?=
 =?us-ascii?Q?xEo24aqqDd35Yh8fb/JvRhdJVqiZzDIzJDwf7hN1h0oooGBqX1DMR6Xgh8sd?=
 =?us-ascii?Q?E9I44iAUgSb6BKh6i4zb8iJx8bL9N6vnf0fcYyyKVMFgZENmG0UONwzRU5Tf?=
 =?us-ascii?Q?qTPzha5RXy2JhbUc1JcBzgu8hnUvHavZ0byoy1sYW1w90M7YhATChA9pgJ4R?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7736088f-81ce-4277-5524-08dc841e3136
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 22:40:39.0170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f3dWVm3bfUzGeIGfBk4cKVkGlhvw3E1sZasKCU/etmgACzvmLDs6qKbJFQfJS9kLzfBhDdWWOsQFCM3dA3iCUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6935
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

On Mon, Jun 03, 2024 at 02:05:54PM -0700, Jonathan Cavitt wrote:
> An exec queue should be considered reset if the guc it was running on
> has had its submission state disabled, as this normally only occurs on
> a reset.  So, add the condition to the reset_status guc_exec_queue_op.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: John Harrison <john.c.harrison@intel.com>
> CC: Matthew Brost <matthew.brost@intel.com>
> CC: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index d9c159e3c5320..8c0b0c70fa5ea 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1414,7 +1414,8 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
>  
>  static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
>  {
> -	return exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q);
> +	return guc_read_stopped(exec_queue_to_guc(q)) ||

I haven't wrapped my head around this issue completely but will take an
in depth look shortly but this patch is not correct. We only ban exec
queues which have jobs started but not completed during GT reset whereas
this patch will report all exec queues as reset during a period of time
when GuC submission is stopped (e.g. during a GT reset all exec queues
will being reset).

Matt

> +	       exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q);
>  }
>  
>  /*
> -- 
> 2.25.1
> 
