Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9AB3CAC5B8
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 02:31:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E55510E653;
	Wed,  1 Oct 2025 02:31:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DnghoW2c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8467C10E653
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Oct 2025 02:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759285884; x=1790821884;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VRk3qsn7XrMzuxsF4+Ajm6HHY8ocm6QN+MRRetiwWrU=;
 b=DnghoW2cAdtlgDBPLHOybYRZa98ynyvDmk4KNogx5d+9fndswwU/ynx1
 LJq508aWHWK7OJaKz+etJnBshryDWMKFnvTOVUmYVL4tlRtJlAN/99Fn5
 b3VC2ABK3hXnDuW80ziMM8gunosgoDNWkov5jo/nYPnAXdR8YC9U72qRB
 BsaFXKEOziOP77G0Wpl3WSvU22isQHfpZQa9aimLeTQYxzZjWN8o1th+P
 T00JwuVriAuMzP+NE9RP+/H7C658P2h2gUkd3ks+zkN6M3Z79Yvs9YxDH
 kjkJCojkjxafUXg16Mkq3FKk8LIdsetO3FKG/NoxLQjQ8BuoedM99RPV/ g==;
X-CSE-ConnectionGUID: V7Yz3LWKTKq0aA68+F1vWg==
X-CSE-MsgGUID: b7vgW3UgSneY9va6MTDkoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="84175934"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="84175934"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 19:31:23 -0700
X-CSE-ConnectionGUID: nqiM5jvJR5OJP0DfbFrIeA==
X-CSE-MsgGUID: f9Cix06sSNaUNdT+mTXDWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="178271964"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 19:31:23 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 19:31:22 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 19:31:22 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.32) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 19:31:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nxLX1/Yxq/E4xJm1lFuFUzWvfOu5ZhjvS3lDckagnftNAjcxxBqIBBJxI3ouHupTUpxrRIjYochabaVwHaaDivSPnOFTW9xaRAzE0AtYPbMse8sPsqlY0Kco1wPCMJU6WvRHw7Hc/jZpQSdL1Wb5DKDp0TFFuAvlXK8ZaU7D7s34VVEnZmvAErH4xTTUUGk8Vg9BhfswWTzZSqbQ2FMzWuJov0KddWdWDrtDKZl9yV8R3Ip56Ga2v724LWC6DDUnHXvUJnoaOIJw4vN5FL5CpJRyPFimETWQgnWnDhaf4+qr0S1xs+uXuH/z2F/iZy1WzJoXoUqQ5qNk9+Fxs5HYUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXd3u01rReS9XLCEVDRvci2uJ49LL9hppA+BHBHPX6k=;
 b=yw+SDeS3PZeAZOcw3ZkHT3zar1tibJgt/OqXb+KN+Ysi/tXcTFDRvlQA6dAOhfrGV/C+vNKc52RQSSZMJDy1GIgJ6L9iwP4c/Vhfc5GffWV/S2A2CV8CWhnuLrCOV41dfUvmLLBJxG/1DOjElRWRMuJijGiNAGvp3ewd8ckkLVxaRzODSOA4iR//PxzFEdpGh/i6f1wCpCAT3sdrT/ag/IS8GhbYqLE8ZQZ8rwbtpUHYYK4ZWQSap2ejE891DNZYbZ6kZjGgEVLBZHX+UKCHP3UBbNJFQ9uuhwZNAyvR2QkC7mH+zcs6cc8ncZTGaBsqOv8FTbQzmVOEAEp+jzrYXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB6915.namprd11.prod.outlook.com (2603:10b6:930:59::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Wed, 1 Oct
 2025 02:31:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 02:31:19 +0000
Date: Tue, 30 Sep 2025 19:31:17 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v3] drm/xe/migrate: Atomicize CCS copy command setup
Message-ID: <aNySdUl0Kjg6VCX3@lstrano-desk.jf.intel.com>
References: <20250929164507.2593639-1-satyanarayana.k.v.p@intel.com>
 <bfd90d42-0b06-4e3a-82d8-08c7bd1c390e@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bfd90d42-0b06-4e3a-82d8-08c7bd1c390e@intel.com>
X-ClientProxiedBy: MW3PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:303:2b::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB6915:EE_
X-MS-Office365-Filtering-Correlation-Id: a5ea09d9-eb75-441b-15a8-08de00929ab9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?84WAzSR3TR1enPKZUgiKQAzQIIfRHIKdAT955cNhbi8ltVcIihQo06RkEtU/?=
 =?us-ascii?Q?g8WTwx+pv+BN+pNXzb3TPcr59r/ePOzm8RNz1Weu3Ap1HGn0aij9DMv2IYue?=
 =?us-ascii?Q?qp7PIPmbOt/MUrh1W2m/BQowDsQCE2gVxYxCcMFpjXJsHt8IWTH33iRwfe3+?=
 =?us-ascii?Q?tvUAeDM1P1RRsuACPeW4hvY9J5WFDuGn79gK/GeY9vxLi1eCT/dUTakaSEIc?=
 =?us-ascii?Q?RlAnN41be0kRSUxT+UGIsC+HsHjKGlGNvBva6cKbcX2KUGn7EBcw7E/5aYXA?=
 =?us-ascii?Q?QW9hjXJWq8vHSKzXWmTkCpKCiVPb5s4muH6pb8Le0FgjPAgSVoteOwFmA7B0?=
 =?us-ascii?Q?sErZ+V90yo60xPwNEm2sqTlc2kYICqnc9CuLor/wIoPyvYcuk0TGMNdESZ2F?=
 =?us-ascii?Q?ProrBguAtiv6xbJhp2Kb9UDwQBPUH1nKN3zLKJJ6bGdbt66FMcL1ImoITXFV?=
 =?us-ascii?Q?9YTVAk4b6bduPcwvFqcDNhHQOI/7CVYO7xoywHvtpUUe4D0E8cVZpLy3kOZR?=
 =?us-ascii?Q?FS6zplk8t0lGJRAFCnmn45PdFFMF2lPiGTAaJsNWDdksdsb+qw0AIUXO/cE/?=
 =?us-ascii?Q?hJlqvgiQnBfuQYA0YVgGdLbQ+oPN0BZ1GkGIU99cXChkqCBACfBPWIhZ35zJ?=
 =?us-ascii?Q?RgGc3kL8reFeFwMKCcwwTUEU+m379R++dmiBHRfVz949L45jxXO2TqcmWNBA?=
 =?us-ascii?Q?vVhSTf+W3O6ov2c5O4eMo27FHrl/TzhiDWbaY7qfU6io5nQZXtipshqTjhL/?=
 =?us-ascii?Q?V3VpalhHd0XdMDNEUUQFfJ/DZJ+Xjb+P5YfcXTkQPW9Zsv5hzvNYgeeFRzhY?=
 =?us-ascii?Q?Y2hBN7l5HcjdCz3bRE+UYkQaFA+L7OCxVYPMTMZeN4Nl1hxSS5Yjd1okikH3?=
 =?us-ascii?Q?y+J7ndlJb1F2ACkdBp1a255gC5CBCjC214heVa+Btrw10zASp0kSOqZsOOFz?=
 =?us-ascii?Q?bn9JGcknvn9MaBlv98ypj3vs2MeUvPHguLErv503QqIkr8NulGskBWqcwhuc?=
 =?us-ascii?Q?WFBJMiw9cPsbsK+/g5xa4r61P6PnqAl3B/UOgQ8TRJkPbPhEKqFawKHQKl2q?=
 =?us-ascii?Q?xn5zeQeGTpeorNxKy3UcdbVz6Gufa6lK1hjHQgZ2S0mYTJzgZ3PkFPBH/Qsl?=
 =?us-ascii?Q?13ntv4xAOeaOU0RLSC7AlkIygTQuyuu6iSJ0zOVsf9E2aIYZksqskj8tEVaC?=
 =?us-ascii?Q?lHOKobZHgzHUqWQKXhb0ob/NWfbEQ/HOULcFNwq9VL+m6FmilMnzsaV6kk4G?=
 =?us-ascii?Q?SAyOYpzFERaxLw0DSz8CjdHvOch2AQ1Gyln0LofGwcIaKKE1kG/xsf0BitpJ?=
 =?us-ascii?Q?4i8X/LznYU+En+egJMGJJ4SwWHqpuxx1FpuOakj05gN7V6DaIoNGNxhH1Nbq?=
 =?us-ascii?Q?CBfJDRh8cpYPCZVDn8x3Mp5q/w/O6mYcVqAA6Keh8IUaRbZ08+LxOY9aS2ty?=
 =?us-ascii?Q?rFk0OcLw/3Qp71aQng0/KAijFuRiPksx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?givAH5C/qmnLel3njtWGdwQIOEGSCqrbHGgk+iXWPQ4Ic63m/v0FwqkLJSLY?=
 =?us-ascii?Q?PPSBH6GRbPebSoOeXWkwElCSPR1s/eYlKNi/0wYZjbkzjLwWRFKSLomCKmcb?=
 =?us-ascii?Q?af7S880yaDWXbfv1aR40z6XFoNJpBn85ObTBcA1MGbDHAhdoI8E+bpqH9DoH?=
 =?us-ascii?Q?MXr9qiU2JG/suMuyEYDhKcKDykPu/OimW81JE1+IT7ex8/+hPjPoymzTAvwn?=
 =?us-ascii?Q?l3DDCrR4ZuOy+fd2synZLm/566b3zCHtDjRCxf2/fArKD+eEoomxm3ChT1OO?=
 =?us-ascii?Q?0MHj/eXAKe0s/k1eymlXVx2cb8AAsCXY+dUdaKOl/FH/a9Popgg8qeq0jk04?=
 =?us-ascii?Q?KOpLaJplhFvq+Xa2DpjpwG4oCdNGWBL+5wCGDrW8XUHbV8YK8TnjtDvzewTX?=
 =?us-ascii?Q?ag38FqhbraFFDITKg/0k6pl0UfWArFiOzZDBUoXtDzKcnPsROSEWAJl6tIXf?=
 =?us-ascii?Q?S0ScxD7cchMG/nLmxufz6I44lv/Qn/c7AAKzboVtrybveT+qGvKX3Sx/GULg?=
 =?us-ascii?Q?vl+FpHLjE8rkbqu7qAw6dZFuqERtvRDZHigCMGP0rRN12VNm5L29c9KkimUH?=
 =?us-ascii?Q?8TKxn9FV7fWBSi5Q8VjbNppAj+ToFkSw0OMXIraW34plx+jS39NfpXSgHEki?=
 =?us-ascii?Q?LqlE0w45L+Dpo94K7dJTZdjUtB/xngui4MPjGPiTuO8K3LJ0rILhiKFsSZOV?=
 =?us-ascii?Q?ODWdZyNlVr1ehhCbU8CBDe/erbY7mBaSDqbf7vKH0OEOs1znBz8Pu8lTp5BQ?=
 =?us-ascii?Q?NuNGOZYlATtEEHx8ZJoCqsT1uJtASqQIQlvvu8K5+6MDkm2ylYY//sXh0vtt?=
 =?us-ascii?Q?jbHyOMoZmGUxHfBwT+eOTgqVEvk3fxaUBCasDcMV1ivnVDaKWRzcyu53kykw?=
 =?us-ascii?Q?2yfflmhwIucCo5dQRYClS3Lx20ebn2UpxnE0Fo80id+d7God+WQt6j7zrSOD?=
 =?us-ascii?Q?EHZskRvRZLL6S+AU9KdpxL9cuQIyvx3aquU/f+zMCj7TzInw+4+dGE6VM6Tn?=
 =?us-ascii?Q?vX5KcgSt26QPSnAIqQdhiS6eAHVTXyf4eJ/kShi7FiGdIr9tFafU2jZhl7As?=
 =?us-ascii?Q?P6AwVVlA4v5C2B2dfuFFr412H7CsYDNmHGcpsskjk1QCMVj0f+Nw9VIKyvfr?=
 =?us-ascii?Q?uCVtWvi6B5aZCW2bs9Ygor59mTa+HX4PR3xWnJf21NyZi9dgvSs76671vjON?=
 =?us-ascii?Q?fwJwAB3jNnNdHUiyslIAWnLgTrnJcbdUWQsCsrr+Ht/ezzf+WtysTlgdWksM?=
 =?us-ascii?Q?K5gSix8XI5927TZ6HeBGUU+ty/MRmN0ZV/ClpPKSVJwJrhVafCjzofj4S7si?=
 =?us-ascii?Q?aQBSHaQxurEtbs6GE9EffQOZ30D+pvwAEYmp+ge63VBfRGUWjKJfXzDGLyFV?=
 =?us-ascii?Q?066f2H68x0xwBoAmx63uWQxd+1Azi/DgOy/K42HRs7mWPSSvJ5FM1Yk8jooX?=
 =?us-ascii?Q?6Bvu157NHBXCGS/0dSM0uWBNeexxL1nNjiGukFFXhGqu+v/+gMeDszM3KMRe?=
 =?us-ascii?Q?QxMg+1uNjlcdQQu/BnCz0iKaEpMPfsVbKDokGfL8WECcjzA2vL8br1rf9+EW?=
 =?us-ascii?Q?n009znrJoOgHgrx060Wj3OY1GMBhdhRaqQQIRNgz8UC3R1woT94ilUKJWKtW?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ea09d9-eb75-441b-15a8-08de00929ab9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 02:31:19.5467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uWgfi2WhNXh4vRCBkQ25Jdxvms7jv8exhYpuXEFMdPbF+csnmGsV99tHqkCLheAiShTRUkifdHf961Zn3QFRMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6915
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

On Mon, Sep 29, 2025 at 08:54:39PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 9/29/2025 6:45 PM, Satyanarayana K V P wrote:
> > The CCS copy command is a 5-dword sequence. If the vCPU halts during
> > save/restore while this sequence is being programmed, partial writes may
> > trigger page faults when saving IGPU CCS metadata. Use the VMOVDQU
> > instruction to write the sequence atomically.
> > 
> > Since VMOVDQU operates on 256-bit chunks, update EMIT_COPY_CCS_DW to emit
> > 8 dwords instead of 5 dwords.
> > 
> > Update emit_flush_invalidate() to use VMOVDQU operating with 128-bit
> > chunks.
> > 
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > 
> > ---
> > V2 -> V3:
> > - Added support for 128 bit and 256 bit instructions with memcpy_vmovdqu
> > - Updated emit_flush_invalidate() to use vmovdqu instruction.
> > 
> > V1 -> V2:
> > - Use memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
> >   (Auld, Matthew)
> >   - Fix issues reported by patchworks.
> > ---
> >  drivers/gpu/drm/xe/xe_migrate.c | 92 +++++++++++++++++++++++++++------
> >  1 file changed, 77 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index 1d667fa36cf3..a37d4cb28aac 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -5,6 +5,7 @@
> >  
> >  #include "xe_migrate.h"
> >  
> > +#include <asm/fpu/api.h>
> >  #include <linux/bitfield.h>
> >  #include <linux/sizes.h>
> >  
> > @@ -644,18 +645,64 @@ static void emit_pte(struct xe_migrate *m,
> >  	}
> >  }
> >  
> > -#define EMIT_COPY_CCS_DW 5
> > +/*
> > + * The CCS copy command is a 5-dword sequence. If the vCPU halts during
> > + * save/restore while this sequence is being issued, partial writes may trigger
> > + * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
> > + * write the sequence atomically.
> 
> shouldn't this comment be near/inside emit_copy_ccs() ?
> 
> > + */
> > +static void memcpy_vmovdqu(void *dst, const void *src, u32 size)
> > +{
> > +	kernel_fpu_begin();
> > +
> > +#ifdef CONFIG_X86
> > +	if (size == SZ_128) {
> > +		asm("vmovdqu (%0), %%xmm0\n"
> > +		    "vmovups %%xmm0,   (%1)\n"
> > +		    :: "r" (src), "r" (dst) : "memory");
> > +	} else if (size == SZ_256) {
> > +		asm("vmovdqu (%0), %%ymm0\n"
> > +		    "vmovups %%ymm0,   (%1)\n"
> > +		    :: "r" (src), "r" (dst) : "memory");
> > +	}
> > +#endif
> > +	kernel_fpu_end();
> > +}
> > +
> > +static int xe_migrate_memcpy_atomic(struct xe_gt *gt, void *dst, const void
> 
> maybe name it as emit_atomic() ?
> 
> > +				     *src, u32 size)
> > +{
> > +	int instr_size = size * SZ_8;
> 
> why signed int?
> and maybe explain where this 8 comes from?
> did you mean BITS_PER_BYTE here
> 
> > +
> > +	if (IS_SRIOV_VF(gt_to_xe(gt)) && static_cpu_has(X86_FEATURE_AVX)) {
> > +		if (instr_size != SZ_128 && instr_size != SZ_256) {
> > +			drm_dbg(&gt_to_xe(gt)->drm,
> > +				"Invalid size received for atomic copy %d", instr_size);
> 
> as this is internal/static function, there should be no need for runtime checks - this all your code
> assert shall be sufficient

I agree here. In general internal functions to a file don't need to
check arugments or if they do, asserts are preferred way to do this.
Even exported functions within the driver, IMO asserts are fine. It is
when expose a function to user space (IOCTLs) or if export module level
functions is where argument sanitization becomes really important.

> > +			return -EINVAL;
> > +		}
> > +
> > +		memcpy_vmovdqu(dst, src, instr_size);
> > +	} else {
> > +		memcpy(dst, src, size);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +#define EMIT_COPY_CCS_DW 8
> >  static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> >  			  u64 dst_ofs, bool dst_is_indirect,
> >  			  u64 src_ofs, bool src_is_indirect,
> >  			  u32 size)
> >  {
> > +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
> >  	struct xe_device *xe = gt_to_xe(gt);
> >  	u32 *cs = bb->cs + bb->len;
> >  	u32 num_ccs_blks;
> >  	u32 num_pages;
> >  	u32 ccs_copy_size;
> >  	u32 mocs;
> > +	u32 i = 0;
> >  
> >  	if (GRAPHICS_VERx100(xe) >= 2000) {
> >  		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> > @@ -673,14 +720,17 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> >  		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
> >  	}
> >  
> > -	*cs++ = XY_CTRL_SURF_COPY_BLT |
> > -		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> > -		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> > -		ccs_copy_size;
> > -	*cs++ = lower_32_bits(src_ofs);
> > -	*cs++ = upper_32_bits(src_ofs) | mocs;
> > -	*cs++ = lower_32_bits(dst_ofs);
> > -	*cs++ = upper_32_bits(dst_ofs) | mocs;
> > +	dw[i++] = XY_CTRL_SURF_COPY_BLT |
> > +		  (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> > +		  (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> > +		  ccs_copy_size;
> > +	dw[i++] = lower_32_bits(src_ofs);
> > +	dw[i++] = upper_32_bits(src_ofs) | mocs;
> > +	dw[i++] = lower_32_bits(dst_ofs);
> > +	dw[i++] = upper_32_bits(dst_ofs) | mocs;
> > +
> > +	if (!xe_migrate_memcpy_atomic(gt, cs, dw, sizeof(u32) * EMIT_COPY_CCS_DW))
> > +		cs += EMIT_COPY_CCS_DW;
> >  
> >  	bb->len = cs - bb->cs;
> >  }
> > @@ -980,16 +1030,28 @@ struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate)
> >  	return migrate->q->lrc[0];
> >  }
> >  
> > +/*
> > + * The MI_FLUSH_DW command is a 4-dword sequence. If the vCPU halts during
> > + * save/restore while this sequence is being issued, partial writes may
> > + * trigger page faults when saving iGPU CCS metadata. Use
> > + * xe_migrate_memcpy_atomic() to write the sequence atomically.
> > + */
> >  static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *dw, int i,
> >  				 u32 flags)
> >  {
> >  	struct xe_lrc *lrc = xe_exec_queue_lrc(q);
> > -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > -		  MI_FLUSH_IMM_DW | flags;
> > -	dw[i++] = lower_32_bits(xe_lrc_start_seqno_ggtt_addr(lrc)) |
> > -		  MI_FLUSH_DW_USE_GTT;
> > -	dw[i++] = upper_32_bits(xe_lrc_start_seqno_ggtt_addr(lrc));
> > -	dw[i++] = MI_NOOP;
> > +	u32 tmp_dw[SZ_4] = {MI_NOOP}, j = 0;
> > +
> > +	tmp_dw[j++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > +		      MI_FLUSH_IMM_DW | flags;
> > +	tmp_dw[j++] = lower_32_bits(xe_lrc_start_seqno_ggtt_addr(lrc)) |
> > +		      MI_FLUSH_DW_USE_GTT;
> > +	tmp_dw[j++] = upper_32_bits(xe_lrc_start_seqno_ggtt_addr(lrc));
> > +	tmp_dw[j++] = MI_NOOP;
> > +
> > +	if (!xe_migrate_memcpy_atomic(q->gt, &dw[i], tmp_dw, sizeof(u32) * j))
> 
> j must be is always 4, correct? maybe use sizeof(tmp) ?
> 
> > +		i += j;
> > +
> >  	dw[i++] = MI_NOOP;
> 
> why this extra noop?

This is existing code but probably could be deleted.

Matt

> >  
> >  	return i;
> 
