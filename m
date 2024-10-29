Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40062D3A679
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 17:45:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE60110E6CD;
	Tue, 29 Oct 2024 17:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ETwhGwB1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF41D10E6D1
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 17:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730223946; x=1761759946;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bOhF9xK2IfMp5ZWtxV38vHvw68aicG0TNSj+YNesr0c=;
 b=ETwhGwB1mjkt1izLkHYLQnOjxQlVzeoSH7drRP5gyP2EvgHeVXtHReEP
 NCFyoQ+ZocqWofgAVUvaacMX8betGIuAJjrSnK1grtXXfS6RVA9XtlEyV
 BsxYwLnjobK/GFCF/caLQlXC/evOiq7MiQ6uTZ2doV8ZmKtLogQDhiPCD
 RqHI0hNGAz1xCa2kmcUNqVDvIRA25c28myD6NCbRGSCNLsFBMwVpjPcXM
 AC0zvdnYoy+LnUCJI2Al9VLZLmzxeJe4/Oiw1IofeWnp2t97+qGryx992
 ZSz86R7PjmVw/3QW0Nvu7OynhOoq20UXOF4BgC7OiWno8A/v5HESW20JL w==;
X-CSE-ConnectionGUID: RjXvJAImT6K2tPXOrtip2w==
X-CSE-MsgGUID: nl9k2H32SKesJVHFVY1osQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="17518641"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="17518641"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 10:45:44 -0700
X-CSE-ConnectionGUID: 1B5hyNEzSBqtGYdwZ34tKg==
X-CSE-MsgGUID: Y6GrPW7QRJCYVIcKBJ3azg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="81593594"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Oct 2024 10:45:42 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Oct 2024 10:45:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 29 Oct 2024 10:45:40 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 29 Oct 2024 10:45:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tQY4OolCwsGOsRtEnHDJNYbHyR+yMTrYhtAL3c8vim//O8/nif3EHGdTYXAXIJUYU1lTOPO6gi72MpzwtoJI03Cg+aHF3R4OxiecO0BRU0FmCRxxVobDPJuT5i2Yi+ddPhwlrJ2ydbO1Tt2pfXJCBzXtY5yKeej9COh/h37soU1nk+c3P5s3Eg2dWYSAmPsDgCsxTgMaZ5x/n2yZ5FP9tKcbKC6Xya3AV9+WTxFlfzhsWfMI3I6DEYzryXQhaPAm3pBH493Mnw7tP6ryFcJOIXZsDWNbyLegnN//6NrJI/tuqW/MIjOfQn7EwzLTIoxY9ordKDDeczELo8A3nak/9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZNwFCNBExiuEeh3P/GrsJ3oOEbO1ULPGj0E4IOp2OxE=;
 b=AI9dp3GDVwRFXsiwCcyniHUw9/Qq+zsgO82YJvow3La2EQhO3E1KCWtcPyCgETjFe4cxlrQXT4xfsQyNJ124Jm0oiFyGitkb5fxrto1FCRzCXO/DvTMjSl1zXSguma6zPp26RVTkxKipKFp/IJhn3V1S0ysQuhROhM0bNft2N3DfSgo/6q9KzbO3nuCIuuRUSXQfTuH5imfJotndCDuI4NIsKniL1fOqM+5ZIa0c/kpsss+de3VzFQJzWs/0YgHDGsEeIArlQlRQ2WDExXu1yoSKVi2fB0uO2hasog5z1j0VqHae/08AWIRUNzwTVS4yZirgmAF2Q9B7glAo7RiR9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7923.namprd11.prod.outlook.com (2603:10b6:930:7e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 17:45:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8093.025; Tue, 29 Oct 2024
 17:45:37 +0000
Date: Tue, 29 Oct 2024 17:45:14 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <paulo.r.zanoni@intel.com>
Subject: Re: [PATCH v4 2/2] drm/xe: Upgrade job timeout message to warn
Message-ID: <ZyEfKkVfQNmC2rAl@DUT025-TGLU.fm.intel.com>
References: <20241025214330.2010521-1-matthew.brost@intel.com>
 <20241025214330.2010521-3-matthew.brost@intel.com>
 <dbcc0ff8-fd93-4cee-aa5d-c6a023768626@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <dbcc0ff8-fd93-4cee-aa5d-c6a023768626@intel.com>
X-ClientProxiedBy: SJ0PR13CA0201.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7923:EE_
X-MS-Office365-Filtering-Correlation-Id: ab9ddda8-d6d4-455a-d451-08dcf8417f40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jbr0jGZW19A+0JVrsqlooa7QlnhodOFA1E9iUYafzpBXT1z5eSghDd7FUEXk?=
 =?us-ascii?Q?ifazzeo+xIhNd2cgZeYQv0W8oghTQZz8HH+pXjSCWsQpzyku8wbtfnU/3iyi?=
 =?us-ascii?Q?4iGvj7OzXZCs1gd45TcKLpCTQNoh/DPUihzUOLqBcmbWLLtdXbnVuhIaRCxM?=
 =?us-ascii?Q?vi1oBFlqE5WZWAfMz+aTPUcHjonAIDCVFjE+NwWJEk9d5jYqbGVTCWjmLusZ?=
 =?us-ascii?Q?/3GdckkheY4BbBqaCWT/EW3VcT80kF38L8M6zvGdY/wbsCmOW9GxwPW2RBXv?=
 =?us-ascii?Q?XQFcAvHC7RJOUmqoh0DHhQCp7RUYSqzmgOpC36O88J4+Z/p5BuYEPRs9gm6n?=
 =?us-ascii?Q?g0mZDzPtyf9DwH44aQ9Kw/a4BvPtYV+yhY9dOEW3Jm1qbMCXbMBTGq5FUf0F?=
 =?us-ascii?Q?gA6hkUlsKZYPdZQIx2RJztRvGMZqsXBDRpD8uiIgA/c8XSvxnAAkXUIkvRlQ?=
 =?us-ascii?Q?SczEok74f7HLgwEMXW7GrXXkd8IEg3TH9brFtFHGB8JaWNvyT7mPh4OxCn5I?=
 =?us-ascii?Q?gE75or7pnY7l4i/fjVfmvTLbVgKWFIxU1xtMvwVLjzT2Mj9rgiT1nPnaj22d?=
 =?us-ascii?Q?J58vRJI/Wd1JxQWg7aMmJ2RxT5doD2Vsy6SaeNS+2XG6wGi4ck9afxsdx8jU?=
 =?us-ascii?Q?NaAH5rbe4Hwva7e581oUWayl6J+V9tpYl7JzguCdyYtjZzeO1/SAE47oHXCC?=
 =?us-ascii?Q?EpkOE4wlK0NiHD+TUYLgsXdw3j7yQnCoSmjGjQMHLcSSOXPuvo3K+qsvVSrx?=
 =?us-ascii?Q?SRjSl7lxbXWJDtNOw+6vKrI1CVjfwWssVfFNZn6lZNpU5uoszlK/5BeZ32Eg?=
 =?us-ascii?Q?9tav445kHqhzu+fB/vnm56igNSHgiVTb1UpEUd0qVBiRMiFMGjqsdfn5aXml?=
 =?us-ascii?Q?3pBLUdPJ793dml4COrczbJiWCA3F/ePNMmkMv7G7IoVNpgjwrU2X3GSGhys5?=
 =?us-ascii?Q?Ob/2BbGps/dxcwZjClMGKRqBhdklQAq6kUng28XQYZdDDHcBQrVPw03QMVwN?=
 =?us-ascii?Q?Y7+5N3DeXWcx8Jag3X3NGSu4Ve0ESzI0WofgZvJ34KdZQgZzZr70N2FdBYDu?=
 =?us-ascii?Q?sD3fuUPceBCgsE87o5XBBJSzaFex5MRWEXaV83lKiJ+72RFIWjwXC9O6rxK2?=
 =?us-ascii?Q?wxQYBZV+H3xJqzBW8kFb863iYla5OA70N9uRTi9doJ/93cuXKoLtYqynco7e?=
 =?us-ascii?Q?IxxhBXI+MGQBtRrQsXzRU+QEm4VAhPa7qIJR2qDlp591PNTtfmmV0b/1LGlt?=
 =?us-ascii?Q?r2ZrvGkylXFkbtwP/xF4dtFZNAguWgelRY2/h5WDA5f5t4W1Xg+jGkZ3z88D?=
 =?us-ascii?Q?ktRqwGvAfpW+TCSRFC7z6Yv5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5J801hb1WIxg9+pOM/Sm+mEC8Yzi3b5XRxeT6Oj7Lp5YG1g+jHOC0YSUnoJs?=
 =?us-ascii?Q?+3OYLVRKmQ5qcf2zJKulL22Q5nQi5SqWz+g3wqoalW3o9xJNr7EPecrnm56Y?=
 =?us-ascii?Q?TEibLr07uzgwwj7Cfg/RVZaBzBhO9MOn+Rcpz7et/7nqvhANI2b5+EWBZeo6?=
 =?us-ascii?Q?559ZlZe3vCxxKbu+0djxAXKy4XDfTwwEZK4Cm+vVIuGo7+W1A+zos7Cb2JXe?=
 =?us-ascii?Q?zK9kzsN+GRa5dThHW272TQLkWY/IQ1OGQ6M6KSTy4ttCsB02Y5q2eUihVQuu?=
 =?us-ascii?Q?Zs4kW87iYMh3Y9m/bhuWBZFUcLhrbPTFoHlF/MkarkJ0eo3j06G6UtW4klxS?=
 =?us-ascii?Q?uOVMVVZ4hbjtVzHNQmlCdla2WEhvLw53KlCwKwbKdpSCAF6MLckeux+2HG1C?=
 =?us-ascii?Q?VYwPA5q8n50yWkl+3AhbgMF9GKQnDJ3LMEwercau2HEV17N6GZgwdgI+40Eo?=
 =?us-ascii?Q?IYDVkRyPzOEirRBqd2dyHp2Ml/jf0kIdjz8uVqL9H3rs0DoVrreIqCEauBbP?=
 =?us-ascii?Q?bwkoWhdMPnusG/RC1uaNcQy40mGooRhgB7jnRyh/GjZziNBBQuMXi2b1pNxl?=
 =?us-ascii?Q?7l3Tal76vS/6Xz0tkiR+qyFbogAtxxfeAFsCNwV+8B1VlWFsrvIynWDAEEnG?=
 =?us-ascii?Q?3ITOhaNTyi2x3xM3HVFeZBFPV2fskN3Ccwx5xnnYw4IX7xKxb1AEEuVsegKN?=
 =?us-ascii?Q?uyJVupg8VxxWgujzVvcJDlGIZbpqgOuVExomFkdoOjQkz6mKZsx8EsZPFOHb?=
 =?us-ascii?Q?diycZmuos1KqOb5qON3jzL4bG7aaJrKsVCjgUFQ+WDJnCAkAOYvvFCMX+Pqj?=
 =?us-ascii?Q?eXn3/g01zoRPv1rFoP4JiAHiM3ztCQkM5NNouo8DUWXEqyJpTY6dd8yh3yLZ?=
 =?us-ascii?Q?FsgDNveKoCaOzKoi5N0dJ4gFYuRSZL1bsuBAlo5HiMZFbW9Epd6Wg2oKmN+z?=
 =?us-ascii?Q?8BOucmQ7N+vLkj18H9Qn0qD9M3QxXH4sA0C0GfMA5PXTHDfcmIIby87oN+fm?=
 =?us-ascii?Q?0tSv5SbrdyceV1OHYcm1OVb3gZ10ZOUK2cRZ18OOLzVuBqSKzhtsQZbawsQJ?=
 =?us-ascii?Q?5wPI8pRrlAE2fFEU/jvcYVfEHQn0M+CLItoQEd7iCaIxhSaOaoSCHAUXZRja?=
 =?us-ascii?Q?CBo0F0CKNtZ0/azA+QgrNi764x68FKDouGTgiJshVtHCLDrxZm6xGk54Sfl8?=
 =?us-ascii?Q?1mNVFYkCEYgJMZ+YHh4Sqe+Jyt+JnFLdczoLPscL6dFvE7wPCteEc0M3/Ub+?=
 =?us-ascii?Q?SVFQ56QDnibawLUsfSOdy1mqz+CzXaVnD7fxpIGd1ViiVJ7oPe+BL/x0ZWgG?=
 =?us-ascii?Q?VqlEBvrReYn9xRFfqVRejDLkgLSucjR7t7ZhYpLo3D5rguahmr56TLyrbrkv?=
 =?us-ascii?Q?q7KD8EXloONq5lq+og9ztDo6jScaOpmkD1rhmQ8ArRSNZ2dp57gLoRgkyzkM?=
 =?us-ascii?Q?1ernZC6IJh4V4oi4hkDsaKvlSCe8QsfrVyeBj4+QwjBx+vdMmxfHrfbZoSqG?=
 =?us-ascii?Q?3SgaKVMoLlDpVwJu7ji87ntvD6maB8NGEQqAzYtJq0/Z61Yj/vWkazhP5YEh?=
 =?us-ascii?Q?I0DLkgBcfsvQwP6iKra8bvzchN20Vu9jW/kpfYZGdbFX/FSBg5hk4h9dSLfd?=
 =?us-ascii?Q?7Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab9ddda8-d6d4-455a-d451-08dcf8417f40
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 17:45:37.3062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KnU8FEqBaNJBGo7lQzCXOqlnb0LfpQzuFBRkkQlFMiEp5wPeU1sTfdkFhxrnWYaVpLQAJVA7SPrb4L3ZCI+yvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7923
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

On Fri, Oct 25, 2024 at 04:24:41PM -0700, John Harrison wrote:
> On 10/25/2024 14:43, Matthew Brost wrote:
> > Ensure job timeout message shows up on distro configs for user bug
> > reports. Change job timeout message from notice to warn.
> I don't think you are allowed to do this. Job timeouts occur when the user
> submits bad batch buffers. They are expected error handling for untrusted
> user programs. As such, they should not generate warnings or errors. Same as
> passing dodgy data into an IOCTL should not generate a warning but just
> return EINVAL or similar.
> 

Yea ok, will drop this. I think the warning in the first patch is still
ok though as that indicates some sort of scheduling problem.

Matt

> John.
> 
> > 
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > Cc: stable@vger.kernel.org
> > Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_guc_submit.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 7afcc243037c..067cf2bfac1e 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1154,9 +1154,9 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >   		process_name = q->vm->xef->process_name;
> >   		pid = q->vm->xef->pid;
> >   	}
> > -	xe_gt_notice(guc_to_gt(guc), "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx in %s [%d]",
> > -		     xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> > -		     q->guc->id, q->flags, process_name, pid);
> > +	xe_gt_warn(guc_to_gt(guc), "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx in %s [%d]",
> > +		   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> > +		   q->guc->id, q->flags, process_name, pid);
> >   	trace_xe_sched_job_timedout(job);
> 
