Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6B7C27C55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 14:11:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FCA210E0DA;
	Mon, 10 Jun 2024 14:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ScIDw+Kg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E9510E0DA
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 14:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718028672; x=1749564672;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Xfqq6HmHy+s9mdbNIlUWXbChX9DgkEHJBFSSFk+TTqw=;
 b=ScIDw+KgMlXc4XnbR1wraii/4n9b31cYNonD/933wUG/r5ZjZg0Vvc0M
 gYnEz/UizV7SMqGvWcQbfKH7V6dqFXJs6acVNKtabafgw+MiPOy4hh1ZA
 YM9OGsaW48BpRcl6SyhIS+MNHLIGt8l7lZPuO3HjoCQTtmPIo1wcRd3Pj
 LNX3snalnihprGLd/2IqKfZTNwDM/2TZRCmcvFI7OsIvK71tWBFRtkRkc
 SO6dAIeHsotqq5aqw8075sWX1u93veynUkLtQS6kXJ6VXSM6Zi0DljnGF
 tHXxFBdK/78Lx5L/zPUQsaPahaI/MQs+a7K6iz1an/+Z2SVol5OM/cC8u g==;
X-CSE-ConnectionGUID: vEBTIJNQSr+KJKcxLApU1g==
X-CSE-MsgGUID: /Y7GjXVgRGakOMMb0c5T2Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14569396"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14569396"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 07:11:11 -0700
X-CSE-ConnectionGUID: VD7+F/fBSmmKUJvi8+z4PA==
X-CSE-MsgGUID: JclzuUKWTHanfj4b3gEbPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="44012132"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jun 2024 07:11:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 07:11:11 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 10 Jun 2024 07:11:11 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Jun 2024 07:11:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LkDcIHYYi9+q1V1E5nfXkDLjNb9TXw0srvDcVhvkNL7Y8JXZd+BLSvC6HPTsFfT0+xllrptMCRGl0Jj0Vdq8tq/Av9jSMx31xg3bdckV9FmYnI7fsEwJLF49QIt0RUgqT9S1vwpJmbQVi/O6QANInjJdrDFDc3P+6j2F8cs8rPZlKehhgw84XOT1wkfW6wteMY8yD5lofaGU3O8R6g/F98SuDf1WqNNeDBMniGjnXlajzgAoR6wU05Bz1wSaGvoa3m+4LjTGa+IZJEJ/JTPo/v3n26+4I3HHrCYOXihzr+H2A7utagABdMm1bWLZOMVt41KZuvT7HGhA0zI1ZbY8ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kxci5Cd48csylHVqA8Z1Wec7umgX8JogATk5Bvwd3Mc=;
 b=JtzAoW6D/DCcfNJmqYnfAtVqAywneFQxrN1iI8kytmDrO9e2cYpQip4bR8Lv7+K36B/AvU/+/NtoPttzazR7Y5sK3SHEYjbHPgl8bweIQ4ugx6XlcFrb8ZtyDDDp9bVUOIBi7VDOeSlbb3dLdLydwgx9zXLJRzq0pYJvM4WSHF1/mGN8VsN7+k/UCnvsqEVDuzwDg0ft5jYJ+fpOFsmRZzNsLb9QbuguW+89Sf1/qK1qoRRSPoCTNwh4psJsbpCDE9wxCqs3UWKfFwHh4SVockk2HsbQT8aoyPAXCs7mfGG1/eZUplh4esZgpj6rvrBw6VKWxdYKt2w0gvlFBWiUTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0092.namprd11.prod.outlook.com (2603:10b6:510:2b1::6)
 by SA1PR11MB7112.namprd11.prod.outlook.com (2603:10b6:806:2b7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Mon, 10 Jun
 2024 14:11:07 +0000
Received: from PH7SPRMB0092.namprd11.prod.outlook.com
 ([fe80::2ad4:4a5:b333:6ff7]) by PH7SPRMB0092.namprd11.prod.outlook.com
 ([fe80::2ad4:4a5:b333:6ff7%3]) with mapi id 15.20.7633.021; Mon, 10 Jun 2024
 14:11:07 +0000
Date: Mon, 10 Jun 2024 14:10:38 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/6] drm/xe: Add LRC ctx timestamp support functions
Message-ID: <ZmcJXuiaOBGvH7R1@DUT025-TGLU.fm.intel.com>
References: <20240608002103.2371696-1-matthew.brost@intel.com>
 <20240608002103.2371696-2-matthew.brost@intel.com>
 <dloqxdmjpfyppmq57mxjbm3rpviu54uu43nykl2kq64oifc4mz@wa7jy3wqtlgw>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <dloqxdmjpfyppmq57mxjbm3rpviu54uu43nykl2kq64oifc4mz@wa7jy3wqtlgw>
X-ClientProxiedBy: SJ0PR13CA0074.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::19) To PH7SPRMB0092.namprd11.prod.outlook.com
 (2603:10b6:510:2b1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0092:EE_|SA1PR11MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: f0d30591-c388-41cb-6805-08dc89572c14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Nn2I1bjzFPbw3ev1Ilja4V1xM8N4EH8lNQeryY4qrbFXLPxzuj2cHCbtEG2A?=
 =?us-ascii?Q?jJbgSVvjcnmCYkjtzFtivnZzO9kE3B0lUXnIBZUWVfNpopMTn8ck1hNziTrH?=
 =?us-ascii?Q?2PDlsy7lU1CGWJwJtaXXXbqfAHOdquuEpoo0qWG3y6qw7UJZc4rnAVMZiekq?=
 =?us-ascii?Q?mmwpdfVrfNOaj0MQMzumnHqbPJzkhQMp6pV3TatzKprMbhNwiYVuhBDVSqih?=
 =?us-ascii?Q?KEgR4ewXauLnRDRja+baoYJ6BlvRkxOfLcIfwt3zboKOF3Xi5F4DBmrwn+BQ?=
 =?us-ascii?Q?fEsM0fRlmqriRDMdgDrkOPNsg1pcclaF4yRNfnixZThh8DvZsn5OtYyl7+ha?=
 =?us-ascii?Q?bzEu7G81tpB8W0avePC5QfZk1iHr6CCWSlHA5gXdEBzs0r9wX/Eb/nkg8O+y?=
 =?us-ascii?Q?2MmZdfJnEhF6Lcqsfg0NhdTJpnbb9W5QutBwfaVWP1BRbhPREE7bunWrsRtb?=
 =?us-ascii?Q?Dgzn0oWxblzmRqU+C2DEiwoSSG0b46dH5w8+qGxM0W++TGncGNu3Qs9S2yBG?=
 =?us-ascii?Q?QTivtloLQjc2Unq6WymZcYb04udF9P4v5KRUo2Yz7zFVtO32tOfyignAMtFS?=
 =?us-ascii?Q?ePIHuOJxw74KgW22lFQ2C+5RiM927e3gswdu/L8NDl+E9AZXsXRXzIiU1wP1?=
 =?us-ascii?Q?Lpt+GWWNQZBTTsmKxDii0qEl0mqUQqExRlg0sC1je1HFsnajFMMsxJ3jvKT4?=
 =?us-ascii?Q?vxc4SkglLoMnRLQbCbLuibIdEWqphPa82peAe0ecD5yenhT4hlOOZN7ZFDCr?=
 =?us-ascii?Q?KJsUvjcjubwH8+xHvCLp84lLDK9RKkFfkNestqD8suN5RpNYZY1NRrw3z/UJ?=
 =?us-ascii?Q?a4XRbtIdzXdQO44irXI1rlMfaRjylH1gh1BaVIIfcakEM9mBfd7zs6y3TnQ8?=
 =?us-ascii?Q?+XHZCznyL14X6Rxv2zCr+NR7Mf2M7iM2ImYk6QvtTorJVlGaeGJANcG6v85n?=
 =?us-ascii?Q?oEOett5lFIS4wr3lToXti6eVynCXsIugtVHWNBz3fTC1AWJOzce7kC9nGC7k?=
 =?us-ascii?Q?MdMIGY7F9Svfv/Mf9eX+9L1BD+1IE5Pp+CCnekyuF9bbXM3CF699EbrQHex/?=
 =?us-ascii?Q?IXg/EarpPMClv/gtSiUR7OIyXF0jSwRO4GE6mOcs5DY+k3OQoCthvMwuE5BO?=
 =?us-ascii?Q?Dk5BDfcr1vFfJ5e3ONmUDerPMKbouCafYlSnEFnWxQ9J50pTkkqfYT4+/C29?=
 =?us-ascii?Q?+AECou0A7m/WJYgO1UZrlvFwX2g/kLLecxIS9HTuo1eeep726wel9knU8EaG?=
 =?us-ascii?Q?qLz1mlO0+GRCudOtwck5DTytRFEreQT3QYXE8xf0gTOOXM6CftsMN4GlhqQG?=
 =?us-ascii?Q?un5Prxh2UqvIBuVJ3faJ5K0M?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0092.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J16/VtYqwQluM94UbdrdhQ+QKVQSjzoAlWs9oX5up6q7IrHm5ncpRY9UtrkG?=
 =?us-ascii?Q?5LKjzTK0ijRmpOPtUonYPjaVOfv4A9KrxoqgKKcCWPwSxjozBfKS0yIg9vYh?=
 =?us-ascii?Q?pnbWYtd8bIWnBaROatmT/tXYgS0GyEJGCM2kHtEG8R2aoIes9zirPbG/4lw4?=
 =?us-ascii?Q?Q8iCmWQmsUNYnjDwl2Ww2LFp/FI3wEwJjaduu9c2wcaxu0/1av4PE4b1MVWa?=
 =?us-ascii?Q?ZIGV0V64LppS0xcGQpXEVaMEmldzLqCXd8CvPTNb9SuS4MdKAM0QfoHfTKM8?=
 =?us-ascii?Q?Zknd9Nb4LGizCgKd5GskWKpXTs86AF+eo2ITTk+JzlQbzszAzG5ahYpjgSlE?=
 =?us-ascii?Q?BIto5ccg5+/IFK1xV7e7CyQyl3md3jZ84a/nx9gJdFsgPBpwT0kX7Es/KFWo?=
 =?us-ascii?Q?9Wd8oFnSjjHSI4f+oQEV8hBFCqfKf5qasRm+HYtRKS296NQgwBm2NsTRhUoE?=
 =?us-ascii?Q?pDaCQLlKFgAZh+T5C+hJ6fYkJ+y0zePoY/1cZeMTWP7dj/wzjL7Uk9NsRR4R?=
 =?us-ascii?Q?TTqztH+VBMuAf9LNRpmkigZULVgczMJKQVfM+ok3Bm6/S2JmCdPetuMGLz1l?=
 =?us-ascii?Q?RzNgTZaYgvFUopLCEVll1kNSnxOofclPyp7s+7dp3l9uWn5mVb+3+KGnGnTd?=
 =?us-ascii?Q?eR+nSiv6+Ut2d5XNlusRh0I6mcQENcNETkOPX5A1XtulFLO4OgfWIHI+yQHZ?=
 =?us-ascii?Q?Cm4nEeGAICRnxsWFm7XQoPr72P5+I6ctwlijHs1L/UfttA/rtY3ldxow4a+V?=
 =?us-ascii?Q?Q6JQjYA8VHXxRDxEOeo8pkcrLRcF5AaRJDF/TgH2hlijGZk6/5PooEZbGJq9?=
 =?us-ascii?Q?us0BP+8oeHVCgnUL2LxOvFEoO0WLEO2uLvmaRnCo67t3ABgzW5S7g7mtLAAW?=
 =?us-ascii?Q?SwX5r+sGo/YAYuUNHLK6jvyLJ2Ucb9B/93w6pQHCVXSoTBRYG/xAGfJO3d8N?=
 =?us-ascii?Q?y2wQ0Vv68WVvAq9bsOALAWcoyzsFDK060AIlFLNFCAXANIsvIbY6JVswwK4p?=
 =?us-ascii?Q?wLSJXtCop5MO6lU9jGpVeDFCG3Vmh67qBQZ8XjLU3cefKfgCV46vRSzrcW5R?=
 =?us-ascii?Q?crya8manU/6lmIVbq/76WolWWh0w3R6Fq1MdV0OhbKXQGmUNYOz3XMZDWmoF?=
 =?us-ascii?Q?eM1WG0hmuKNj2pkLXeepXW7mBWUFQqV8uaaMR+NoPcuxQ/X38mqhEwyPc5sF?=
 =?us-ascii?Q?qVxRigSvZTruPXN8spkz3P5B15s5PXIbfnpTGl2/+3GOHCC3I1GCIUa1mv/v?=
 =?us-ascii?Q?Qi68q0QtMeE1pakqeQYTjLQhxpudpSFoXk8mBQ4XnLL+Irhtt6cMWbqgEAnF?=
 =?us-ascii?Q?q0tFKByu3ql+lGHkAXfr/HYAghB5zwuiSPSp4Outf3eqfLzUWD2QHOyPRpX+?=
 =?us-ascii?Q?3z3oUtHUZuM8lCS+iiFrER6jadSHVfsK8t/2Zy9HxdjkaDKLVr18sJFOUjDx?=
 =?us-ascii?Q?K6g8BC/Kubf7msIja4Gbih1Q0wErdVc+Y6wpMbRblHOwvtEOWN9e/JGammy/?=
 =?us-ascii?Q?Hh7UP/pjMrS45uBe941HVst1ykynDD8+P+LPeUgW90H+nbJ/ukkCoPr4CT31?=
 =?us-ascii?Q?3vkW9F7Uu0JFQq1b/6NK1CbPTk+CTMhbmRsZ7lKKfuHw2jJTydeM256RJECL?=
 =?us-ascii?Q?ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0d30591-c388-41cb-6805-08dc89572c14
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0092.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 14:11:07.5400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zxGB/JAg/HfxssFz3W6j/xFz2Gg8q6c8m28uf8/Ro7qtJt3sAiQulU6uzBIycsWBI8Td8sMCXtUKBQseuAmiZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7112
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

On Mon, Jun 10, 2024 at 08:49:57AM -0500, Lucas De Marchi wrote:
> On Fri, Jun 07, 2024 at 05:20:58PM GMT, Matthew Brost wrote:
> > LRC ctx timestamp support functions are used to determine how long a job
> > has run on the hardware.
> > 
> > v2:
> > - Don't use static inlines (Jani)
> > - Kernel doc
> > - s/ctx_timestamp_job/ctx_job_timestamp
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_lrc.c | 66 +++++++++++++++++++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_lrc.h |  5 +++
> > 2 files changed, 71 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > index c1bb85d2e243..0fef354c6489 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > @@ -652,6 +652,7 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
> > 
> > #define LRC_SEQNO_PPHWSP_OFFSET 512
> > #define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
> > +#define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
> > #define LRC_PARALLEL_PPHWSP_OFFSET 2048
> > #define LRC_PPHWSP_SIZE SZ_4K
> > 
> > @@ -680,6 +681,12 @@ static inline u32 __xe_lrc_start_seqno_offset(struct xe_lrc *lrc)
> > 	return xe_lrc_pphwsp_offset(lrc) + LRC_START_SEQNO_PPHWSP_OFFSET;
> > }
> > 
> > +static u32 __xe_lrc_ctx_job_timestamp_offset(struct xe_lrc *lrc)
> > +{
> > +	/* The start seqno is stored in the driver-defined portion of PPHWSP */
> > +	return xe_lrc_pphwsp_offset(lrc) + LRC_CTX_JOB_TIMESTAMP_OFFSET;
> > +}
> > +
> > static inline u32 __xe_lrc_parallel_offset(struct xe_lrc *lrc)
> > {
> > 	/* The parallel is stored in the driver-defined portion of PPHWSP */
> > @@ -691,6 +698,11 @@ static inline u32 __xe_lrc_regs_offset(struct xe_lrc *lrc)
> > 	return xe_lrc_pphwsp_offset(lrc) + LRC_PPHWSP_SIZE;
> > }
> > 
> > +static u32 __xe_lrc_ctx_timestamp_offset(struct xe_lrc *lrc)
> > +{
> > +	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP * sizeof(u32);
> > +}
> > +
> > static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
> > {
> > 	/* Indirect ring state page is at the very end of LRC */
> > @@ -716,11 +728,65 @@ DECL_MAP_ADDR_HELPERS(pphwsp)
> > DECL_MAP_ADDR_HELPERS(seqno)
> > DECL_MAP_ADDR_HELPERS(regs)
> > DECL_MAP_ADDR_HELPERS(start_seqno)
> > +DECL_MAP_ADDR_HELPERS(ctx_job_timestamp)
> > +DECL_MAP_ADDR_HELPERS(ctx_timestamp)
> > DECL_MAP_ADDR_HELPERS(parallel)
> > DECL_MAP_ADDR_HELPERS(indirect_ring)
> > 
> > #undef DECL_MAP_ADDR_HELPERS
> > 
> > +/**
> > + * xe_lrc_ctx_timestamp_ggtt_addr() - Get ctx timestamp GGTT address
> > + * @lrc: Pointer to the lrc.
> > + *
> > + * Returns: ctx timestamp GGTT address
> > + */
> > +u32 xe_lrc_ctx_timestamp_ggtt_addr(struct xe_lrc *lrc)
> > +{
> > +	return __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
> > +}
> > +
> > +/**
> > + * xe_lrc_ctx_timestamp_addr() - Read ctx timestamp value
> > + * @lrc: Pointer to the lrc.
> > + *
> > + * Returns: ctx timestamp value
> > + */
> > +u32 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
> > +{
> > +	struct xe_device *xe = lrc_to_xe(lrc);
> > +	struct iosys_map map;
> > +
> > +	map = __xe_lrc_ctx_timestamp_map(lrc);
> > +	return xe_map_read32(xe, &map);
> > +}
> > +
> > +/**
> > + * xe_lrc_ctx_job_timestamp_ggtt_addr() - Get ctx job timestamp GGTT address
> > + * @lrc: Pointer to the lrc.
> > + *
> > + * Returns: ctx timestamp job GGTT address
> > + */
> > +u32 xe_lrc_ctx_job_timestamp_ggtt_addr(struct xe_lrc *lrc)
> > +{
> > +	return __xe_lrc_ctx_job_timestamp_ggtt_addr(lrc);
> > +}
> > +
> > +/**
> > + * xe_lrc_ctx_job_timestamp_addr() - Read ctx job timestamp value
> > + * @lrc: Pointer to the lrc.
> > + *
> > + * Returns: ctx timestamp job value
> > + */
> > +u32 xe_lrc_ctx_job_timestamp(struct xe_lrc *lrc)
> > +{
> > +	struct xe_device *xe = lrc_to_xe(lrc);
> > +	struct iosys_map map;
> > +
> > +	map = __xe_lrc_ctx_job_timestamp_map(lrc);
> > +	return xe_map_read32(xe, &map);
> > +}
> > +
> > u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc)
> > {
> > 	return __xe_lrc_pphwsp_ggtt_addr(lrc);
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> > index 882c3437ba5c..001af6c79454 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.h
> > +++ b/drivers/gpu/drm/xe/xe_lrc.h
> > @@ -94,6 +94,11 @@ void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot);
> > void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer *p);
> > void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot);
> > 
> > +u32 xe_lrc_ctx_timestamp_ggtt_addr(struct xe_lrc *lrc);
> > +u32 xe_lrc_ctx_timestamp(struct xe_lrc *lrc);
> 

Bad timing, just sent v4 at the same time.

> I  think we have some clash here. See the function below where we
> read the timestamp and cache it in the LRC. That one does something
> slightly different, but apparently the same thing. Why are these
> functions not using similar approch with xe_lrc_read_ctx_reg() rather
> than defining new helper functions? And why would we return the address
> and then having another function to read the value?

xe_lrc_read_ctx_reg(lrc, CTX_TIMESTAMP); is the same as: xe_lrc_ctx_timestamp(lrc);

I used 'DECL_MAP_ADDR_HELPERS' to implement the 4 exported functions
mainly as I need the GGTT address and that macro spits out a helper
with the GGTT address.

fwiw, also xe_lrc_read_ctx_reg is implemented with one of these
functions from DECL_MAP_ADDR_HELPERS - __xe_lrc_regs_map.

I'd vote, leave patch mainly as is but replace existing
xe_lrc_read_ctx_reg(lrc, CTX_TIMESTAMP); with
xe_lrc_ctx_timestamp(lrc);. 

If you want to cleanup the file itself and drop these macros, that seems
to be an orthogonal issue to my series.

Matt

> 
> Lucas De Marchi
> 
> > +u32 xe_lrc_ctx_job_timestamp_ggtt_addr(struct xe_lrc *lrc);
> > +u32 xe_lrc_ctx_job_timestamp(struct xe_lrc *lrc);
> > +
> > /**
> >  * xe_lrc_update_timestamp - readout LRC timestamp and update cached value
> >  * @lrc: logical ring context for this exec queue
> > -- 
> > 2.34.1
> > 
