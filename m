Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47685CA0EE4
	for <intel-xe@archiver.kernel.org>; Fri, 15 Aug 2025 01:33:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F83810E0BF;
	Fri, 15 Aug 2025 01:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IJ4NylFl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A261710E0BF
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 01:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755221609; x=1786757609;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jp9j/EIA3dTrmq1L7JzwDlzqkEjU9mININJkJ4ZFWkM=;
 b=IJ4NylFlZA6tMZIDnHftFnFerQ9RBsLw08qOEZb4qXnsplHPxsvjRQfh
 VDAG0lC6m7nzfC+nWQzspW+C76pgXYS7th8etxiwVVT5wosmFNBd5yqdf
 7GNJcUzK1zEZMv44duO7GOa66i/tMM4xsqqXLzsIfOp2ZlqJB2yA5R/5/
 oTKdK8M61XazlyFKVUx7EhoUman0a4Yz8ZWI1HMaroxaYzpex6x//McTZ
 1zs27ED7M4o+S3Pr3+x5u6NLia0MEkp9bqma8jDD8E9vV3tirPZ8YWnzn
 xdYjWEGKc9uIM2gvl3sMnMti7uqY4wAJzHXGjTwV02hJmOOFARkv5ABKq A==;
X-CSE-ConnectionGUID: 0CHHLHwlRoK4lkIveha8bw==
X-CSE-MsgGUID: 9rbIxXenT2uOxUMac/nz4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="61390903"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="61390903"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 18:33:28 -0700
X-CSE-ConnectionGUID: S5TCWZ1YQJSUJqdvGEXFEg==
X-CSE-MsgGUID: UXmApvcTQ3uAvMyIudiN6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="166874183"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 18:33:28 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 18:33:28 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 14 Aug 2025 18:33:28 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.87)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 18:33:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=icB2Ami4GZ8LwgdbEcr70+lfl/Ko/W0LnYmqPospY+jIC/Q2jhCXUHjuGSWypyOD6U9vnbsrdOT0LCVSEUZTLjWohaJxfbjhKtV5JxA72CcP48K/U2FlUZrAOacKXWRDzMX44UVTQSMhj7lsVAnE5iL4BEitIyobwgGMk6XRxPSQ/dLHluvQRg6r6miJXdVG9LzVtCz0Tjd8JNGX0BBLfVK7eYR+P+JPtGcUIer2eRtLXy1RCc+dP4fQ89odsV+AGjU+w24ZfHut1euwN8rC640ND4/ClpfGDCk6oML7mgo1C5WK+v0+/2+s7Sdj6nQZfwJiM0EK5yg8Zf/smi5Lpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75uOEyEfepdLCfk27KLW5Lp4obKzm+PNaNjNmqKiqSg=;
 b=tIs6nHkF6cEV/R17oq054SuydGUo8G39zJZEVBlbRFimLy5VWyYHMiOsdGZW+z4wmhBFhBBog7heI57qUIw3MyGk/2xWP7/7eQioJgvfqUl1WogB9cIx8LevwgxEjLwChI7F5DBnGOXWHNzYEOOXmB/jm0wIy/VDHkRDWn2flKSHtheGuDa12rGe9VC3c5L6aOpGzTRvbIMoMf7fmn1TmNxKAnt2buQzCB8zg71CYQP0WQrrhXAf4Q681LoIR+IeF6F2PL3pvwkZfw9cqj256EShaxC8OFv8T5Tf/qnslpUGrydesKdQjoWfg9fzWw9XkI7rNHWr1d9cCMxCSx13mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH7PR11MB7074.namprd11.prod.outlook.com (2603:10b6:510:20d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Fri, 15 Aug
 2025 01:33:25 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 01:33:25 +0000
Date: Thu, 14 Aug 2025 18:33:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe: Take preemption into account when resubmitting
 jobs
Message-ID: <aJ6OYhe5gA8glSXy@lstrano-desk.jf.intel.com>
References: <20250809043421.1982541-1-matthew.brost@intel.com>
 <d2b91034-ad76-40eb-a1bb-577cb0dd3fdd@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d2b91034-ad76-40eb-a1bb-577cb0dd3fdd@intel.com>
X-ClientProxiedBy: BYAPR07CA0048.namprd07.prod.outlook.com
 (2603:10b6:a03:60::25) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH7PR11MB7074:EE_
X-MS-Office365-Filtering-Correlation-Id: db928380-9357-4bb9-2495-08dddb9bba7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0esGjYjmBxZjoS4WzSurERWxKeIOEM8z50glGAoyw+7F1j5gpvxnEoPfjvCf?=
 =?us-ascii?Q?JAGk8uYIbWSr/2hnKzCkeztWjLhfzA3yfxDdCnv7tM9tK1f6z2gnAqhQOWO0?=
 =?us-ascii?Q?cmqn8GB5xBwGNdREQzwF4qFaAFiFC+6BMKQ/HLXJp3OP7ZcfSL18FIIf38go?=
 =?us-ascii?Q?X4mYS9BCg5ZZHg8hVoNkndRD26l4b09b7vleXScxFMcDANrn4sdf8Pa4NFgI?=
 =?us-ascii?Q?I/CiYzOvzXlwiEZq8jqjIwS99G6rVWoVTRb+FVJJQPp24PRyl86tX2gzTYLe?=
 =?us-ascii?Q?mMSAFDk5mE0jC9/dnY3CoWGJLq/mB3hpqX8dEDrCX+tkMs5x/NyJoRmQtnTn?=
 =?us-ascii?Q?MTX/t2kYGN6gYmGl6t1G9FyrXtsaebGZWCRjn6FhaxSgXWJ55zz7HCkI8HYn?=
 =?us-ascii?Q?quxKIXcWNVyEa7fR13c4jrVSGWNLS4WDD4mlpwTmP0CMX3/kRfYXXD1gW7UU?=
 =?us-ascii?Q?ykYAkeskZHi9+aB5vAs6amx6OMTgCYEMHOJH9LBfhKMgHiUMN5UjY9HfVRW8?=
 =?us-ascii?Q?O0tKth7vI++y3t8syM1ubGuoSuhPrpEbo+iZZPzJNcMO/uc0RcMEFlfVurWM?=
 =?us-ascii?Q?7gMG602lJ/nDOKm1fBawbAA03TjXuouI+PWwSl+lbP24tOBiPtpCFegQzZ0u?=
 =?us-ascii?Q?HBbvDrf1bp27PHl5a/KYxp4Lggf5yBwL9l5R6XlHlDICWPDVjDlUPX5+D+2v?=
 =?us-ascii?Q?AZWdOF+sIfMqmc7IWx0XsORbfqS38y9bk3PI7OHFC/ATGBX/VVBa3OIMGpeX?=
 =?us-ascii?Q?gQGxdIA5boF3o0++OInJaZeOkDEqe872WkMhHttbLn0NYwl4rtBI93ysK8qc?=
 =?us-ascii?Q?Sd5BWHMbgaAVchtSJrIs/Wrr2Pd5UkT0DfavV66W0vJoUBXTKbDXdzotiObs?=
 =?us-ascii?Q?4vL+vk6mlYou/FhLJD3OeDsf2HYb7lgrsdZ5TRg2ltjX5QjsP5NpM03Wu81z?=
 =?us-ascii?Q?8m/T4XZLTL97H7SQ1uBUUBrgwhb2nJhNcVW+yx/R1R+aALblNqEG6poBKLas?=
 =?us-ascii?Q?B+t0gRWb9RO2yWm4CLoexGnmKpb/BeYDSNbBDsBHZbeUi/Ndj2BtnlRPxjhR?=
 =?us-ascii?Q?pIEbqfUojRKhYTogXG6rReLeUG5BJCP0br6c15HBSZAfDXvHFdswRLsEWeSW?=
 =?us-ascii?Q?ukI1cNzI41stts9nACOEg6g9TI2IGzWDhZXGMkd9ZjQ6YDQmct1owoGEXLFK?=
 =?us-ascii?Q?MF5e1jtO8itOAZ2QKpDZzDcNelqlBBcR0CnGSTAxQX7BX1WgKTZwyEnUttk0?=
 =?us-ascii?Q?d4TNNwf11mU/lKz/BlJOLhDkQsI+rhbygF9inH07qs9WpIfYnFJEfaGQnZpp?=
 =?us-ascii?Q?9SEcrZwVfaK8OEbXIuOPIGON5AcoNQrQEpv2qnwVGUw/maIrZvzEu23tc3sm?=
 =?us-ascii?Q?DwhLouBuDxcjaVlHlFsNfCTosJCJGXUx+RZDuikG3mF482sTjA38weUdVgL3?=
 =?us-ascii?Q?AqlPAX9du/Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sZee+RoiMMkLx1o9+b4rKiO8VKYnBrn//uiyNB6fbPI/1dgdJ7Rgn/L2Lf1L?=
 =?us-ascii?Q?8pt9JKicobfY+nKFPEs0+/NE0Nvq6XFHSLJaLyroqE7oTZKqc342l1Wj/yvT?=
 =?us-ascii?Q?1DOulFNfGtqEk3fW3Ozz3rF63aE5ysoKcuZpzLehxcItZF+fyaolz0Fy28BT?=
 =?us-ascii?Q?ckL08N76CEmapJEqWg0kF0qlTKVhrVk1A5bt4d2qicgnV9MeiAYxc8SACWl2?=
 =?us-ascii?Q?sd8CwRuvaC4RkRcqkBRn1R+yH4vFHmwCwZlQoo37LZGmCUBbm4fpTxn4chSQ?=
 =?us-ascii?Q?ZEdQYdfDCpEX42BxGfOmlBjJMtlks3mTKkCarh0jgW9ozTAjJjygVRE/ZfZN?=
 =?us-ascii?Q?slDIRt266rUtkLnxJQjm97ri7IHKRAXxr/vdNhOk0M5LK3LsuwupZtUz6lo+?=
 =?us-ascii?Q?guTqGslMCd4ocsEice6NUCyqaU10Jy8RHZ9pnKMTEzk3dqAh387ri2s2qRAd?=
 =?us-ascii?Q?AmIPH70dV77XAlroaphf9dD3WPBKK+4j1elKaeqADpwO4V2tKHKWNP3p8pOi?=
 =?us-ascii?Q?hb3/dkXDmJxpiwB2wHTVr8qACjcBmpsV3Jrf3TBE7cHZ6Rg/M7bE0v7J5vR/?=
 =?us-ascii?Q?JIZrtuoVZlOUJrhGmDMzvFLpLEojkTOJZzh3/ymQahkyTCpba94b5dggsK6u?=
 =?us-ascii?Q?VYDi3Xd7uaUVEeszX9ZTcAg+Off2GGzicjiNzVzb14LbvKdoNoRtMI0ujP+2?=
 =?us-ascii?Q?n9/IxOASdGLH9mXOwPo6qh3PfmSO/lmi0FIh8FQ8fQDQM9Z6VGMXg0QJnA9J?=
 =?us-ascii?Q?h6KyKcuOEZaXn4rDI2kCpqcSvIhcwBSIF7C4FEXP9sGKgOeinGfvv51m0ADo?=
 =?us-ascii?Q?/qpoxkiElMQE48S3dL1B7RmbJDiQ+IcPykurXUvcd8VoyoBlWSS83jthHS7N?=
 =?us-ascii?Q?qrniUG7nGYPZFzITqZN24fS3fzI1/GU7QnkOW3tCnO8olwJxv9Lm7yPcOyNN?=
 =?us-ascii?Q?/BrazbmKTIVOHt/iAfIfn8NJqlyv92Iro2UMH0/lKhR/DFDsBL49XoENWTPa?=
 =?us-ascii?Q?WI2/HqAmzIX0Dqgfme+8AwvwBeplsiABXF9WKZlXH2HxoSSSY6XmeUwMQiEQ?=
 =?us-ascii?Q?V+5pGpWTnVfOx46RlhKJkR459ClyFaP8RAb82KlEef2uI5BtWupjezh9Zqji?=
 =?us-ascii?Q?R++7o2bSp40F3gNmvWPMuaWyWwLK5uSTB99E37wxhhRbq8AR/nMAOajSh84y?=
 =?us-ascii?Q?cwU6ySj9+evHB3uOx3tcuPRJ8lxik90K3P+s7fiQOK40Ev3az7eUtQuOGywn?=
 =?us-ascii?Q?n5FntyGhNXeyF1X7+4SUG/sznErNfgjRy3gdaBirHh4QY279tFPw9B67W/DN?=
 =?us-ascii?Q?HpiGVgZOHkkmTMzNM+2dKQusjzm3x0mJAMbIBLhQ7RwuwIpv2XWV84kaWt6c?=
 =?us-ascii?Q?263Wud+c5lJawaEkUEwgLXZ3PHPYveeVDzU2kt08GXP59rjReg4NKP9hhqMV?=
 =?us-ascii?Q?vIcy7spgzf+u8CY0wYmD4nobjSFFthxmo7PPLryv111+i1Fef0NIyQi2F+V6?=
 =?us-ascii?Q?21Sa0iSBmPyb2PDlh7Bpn7MoAVu5bAV4YfOV/fXTjWi6CHZhK8VfFkATB8kb?=
 =?us-ascii?Q?I49mC0rhzMhzlUbmuHfEe+pydfCB6f8kSmTZL542K8VNqWoMPheBwqu7ICok?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db928380-9357-4bb9-2495-08dddb9bba7b
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 01:33:25.4680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hwDr9o7diQ8I11EiKF0E5tR4nZ2gXcXbMOK7xUsuf4A9VK+eaEdX8dcOqONnwpXtm9RulaHX4vp8p3p8PMlnYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7074
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

On Tue, Aug 12, 2025 at 08:54:23PM +0200, Lis, Tomasz wrote:
> 
> On 8/9/2025 6:34 AM, Matthew Brost wrote:
> > Take preemption into account when resubmitting jobs, and adjust the new
> > LRC head pointer accordingly to skip over previously executed parts of
> > the job. To support this, save the head pointer of each job when it is
> > emitted.
> > 
> > This code can either be leveraged or reused for VF recovery.
> 
> Right. VF migration recovery.
> 
> This will help in amending the jobs ring fixup code with ring position
> control.
> 
> > 
> > Signed-off-by: Matthew Brost<matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_guc_submit.c      | 23 +++++++++++++++++++++--
> >   drivers/gpu/drm/xe/xe_ring_ops.c        | 23 +++++++++++++++++++----
> >   drivers/gpu/drm/xe/xe_sched_job_types.h |  2 ++
> >   3 files changed, 42 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 1185b23b1384..3ba707bbb74d 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1954,16 +1954,35 @@ void xe_guc_submit_pause(struct xe_guc *guc)
> >   		xe_sched_submission_stop_async(&q->guc->sched);
> >   }
> > +static int guc_lrc_offset(struct xe_lrc *lrc, u32 job_head)
> > +{
> > +	if (xe_lrc_ring_head(lrc) == job_head)
> > +		return 0;
> 
> not sure why we've singled out this condition rather than putting (job_head
> <= xe_lrc_ring_head(lrc))
> 
> below, but that's just a matter of individual style, so can be both ways.
> 
> > +
> > +	if (job_head < xe_lrc_ring_head(lrc))
> > +		return xe_lrc_ring_head(lrc) - job_head;
> > +
> > +	return lrc->ring.size - job_head + xe_lrc_ring_head(lrc);
> 
> I don't think it's a good idea to read the head value from LRC multiple
> times,
> 
> this is vram access. Also if we're assuming the value in LRC is kept
> unchanged,
> 
> maybe a comment would make sense, to avoid incorrect reuse?
> 
> But instead, since it is used 4 times, a local var is fully justified.
> 

Yes, even though this is not a hot path, better to have local variable.

Matt

> -Tomasz
> 
> > +}
> > +
> >   static void guc_exec_queue_start(struct xe_exec_queue *q)
> >   {
> >   	struct xe_gpu_scheduler *sched = &q->guc->sched;
> >   	if (!exec_queue_killed_or_banned_or_wedged(q)) {
> > +		struct xe_sched_job *job;
> >   		int i;
> > +		job = xe_sched_first_pending_job(&q->guc->sched);
> > +
> >   		trace_xe_exec_queue_resubmit(q);
> > -		for (i = 0; i < q->width; ++i)
> > -			xe_lrc_set_ring_head(q->lrc[i], q->lrc[i]->ring.tail);
> > +		for (i = 0; i < q->width; ++i) {
> > +			int offset = !job ? 0 :
> > +				guc_lrc_offset(q->lrc[i], job->ptrs[i].head);
> > +
> > +			xe_lrc_set_ring_head(q->lrc[i], (q->lrc[i]->ring.tail +
> > +					     offset) % q->lrc[i]->ring.size);
> > +		}
> >   		xe_sched_resubmit_jobs(sched);
> >   	}
> > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> > index 5f15360d14bf..4dad28f0614d 100644
> > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > @@ -245,12 +245,14 @@ static int emit_copy_timestamp(struct xe_lrc *lrc, u32 *dw, int i)
> >   /* for engines that don't require any special HW handling (no EUs, no aux inval, etc) */
> >   static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc,
> > -				    u64 batch_addr, u32 seqno)
> > +				    u64 batch_addr, u32 *head, u32 seqno)
> >   {
> >   	u32 dw[MAX_JOB_SIZE_DW], i = 0;
> >   	u32 ppgtt_flag = get_ppgtt_flag(job);
> >   	struct xe_gt *gt = job->q->gt;
> > +	*head = lrc->ring.tail;
> > +
> >   	i = emit_copy_timestamp(lrc, dw, i);
> >   	if (job->ring_ops_flush_tlb) {
> > @@ -296,7 +298,7 @@ static bool has_aux_ccs(struct xe_device *xe)
> >   }
> >   static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
> > -				   u64 batch_addr, u32 seqno)
> > +				   u64 batch_addr, u32 *head, u32 seqno)
> >   {
> >   	u32 dw[MAX_JOB_SIZE_DW], i = 0;
> >   	u32 ppgtt_flag = get_ppgtt_flag(job);
> > @@ -304,6 +306,8 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
> >   	struct xe_device *xe = gt_to_xe(gt);
> >   	bool decode = job->q->class == XE_ENGINE_CLASS_VIDEO_DECODE;
> > +	*head = lrc->ring.tail;
> > +
> >   	i = emit_copy_timestamp(lrc, dw, i);
> >   	dw[i++] = preparser_disable(true);
> > @@ -346,7 +350,8 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
> >   static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
> >   					    struct xe_lrc *lrc,
> > -					    u64 batch_addr, u32 seqno)
> > +					    u64 batch_addr, u32 *head,
> > +					    u32 seqno)
> >   {
> >   	u32 dw[MAX_JOB_SIZE_DW], i = 0;
> >   	u32 ppgtt_flag = get_ppgtt_flag(job);
> > @@ -355,6 +360,8 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
> >   	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
> >   	u32 mask_flags = 0;
> > +	*head = lrc->ring.tail;
> > +
> >   	i = emit_copy_timestamp(lrc, dw, i);
> >   	dw[i++] = preparser_disable(true);
> > @@ -396,11 +403,14 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
> >   }
> >   static void emit_migration_job_gen12(struct xe_sched_job *job,
> > -				     struct xe_lrc *lrc, u32 seqno)
> > +				     struct xe_lrc *lrc, u32 *head,
> > +				     u32 seqno)
> >   {
> >   	u32 saddr = xe_lrc_start_seqno_ggtt_addr(lrc);
> >   	u32 dw[MAX_JOB_SIZE_DW], i = 0;
> > +	*head = lrc->ring.tail;
> > +
> >   	i = emit_copy_timestamp(lrc, dw, i);
> >   	i = emit_store_imm_ggtt(saddr, seqno, dw, i);
> > @@ -434,6 +444,7 @@ static void emit_job_gen12_gsc(struct xe_sched_job *job)
> >   	__emit_job_gen12_simple(job, job->q->lrc[0],
> >   				job->ptrs[0].batch_addr,
> > +				&job->ptrs[0].head,
> >   				xe_sched_job_lrc_seqno(job));
> >   }
> > @@ -443,6 +454,7 @@ static void emit_job_gen12_copy(struct xe_sched_job *job)
> >   	if (xe_sched_job_is_migration(job->q)) {
> >   		emit_migration_job_gen12(job, job->q->lrc[0],
> > +					 &job->ptrs[0].head,
> >   					 xe_sched_job_lrc_seqno(job));
> >   		return;
> >   	}
> > @@ -450,6 +462,7 @@ static void emit_job_gen12_copy(struct xe_sched_job *job)
> >   	for (i = 0; i < job->q->width; ++i)
> >   		__emit_job_gen12_simple(job, job->q->lrc[i],
> >   					job->ptrs[i].batch_addr,
> > +					&job->ptrs[i].head,
> >   					xe_sched_job_lrc_seqno(job));
> >   }
> > @@ -461,6 +474,7 @@ static void emit_job_gen12_video(struct xe_sched_job *job)
> >   	for (i = 0; i < job->q->width; ++i)
> >   		__emit_job_gen12_video(job, job->q->lrc[i],
> >   				       job->ptrs[i].batch_addr,
> > +				       &job->ptrs[i].head,
> >   				       xe_sched_job_lrc_seqno(job));
> >   }
> > @@ -471,6 +485,7 @@ static void emit_job_gen12_render_compute(struct xe_sched_job *job)
> >   	for (i = 0; i < job->q->width; ++i)
> >   		__emit_job_gen12_render_compute(job, job->q->lrc[i],
> >   						job->ptrs[i].batch_addr,
> > +						&job->ptrs[i].head,
> >   						xe_sched_job_lrc_seqno(job));
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
> > index dbf260dded8d..359f93b0cdca 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> > @@ -24,6 +24,8 @@ struct xe_job_ptrs {
> >   	struct dma_fence_chain *chain_fence;
> >   	/** @batch_addr: Batch buffer address. */
> >   	u64 batch_addr;
> > +	/** @head: The head pointer of the LRC when the job was submitted */
> > +	u32 head;
> >   };
> >   /**
