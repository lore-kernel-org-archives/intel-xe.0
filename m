Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AC7D44162
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 14:44:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD33310E666;
	Tue, 19 Nov 2024 14:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aIpIVv4f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E05F210E666
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Nov 2024 14:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732027460; x=1763563460;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6hMJApDRm8dx2bmcF2QsL1rXqvjQZQUK9JpYU+EwP4o=;
 b=aIpIVv4fN0YSqTcba1z62ziOFzhk7V1VLPg4UNWGFExqqw1nywXoekNK
 a3ha/Tkfce7xFQKpV/x250i2SSRwLOGUlg1yYzoH3WzONX8eCr8RD73FF
 I4ATAp0mk2nA55S8wqF7ElLYC/WHHHc31x47ISCQ6Ij6ejzWr/vFq+TDq
 OyjbsykzJ8UGvjoyvBgXnYQB1+V0KgI4dXdEgfPaccvwSfGdoF5z+ICL6
 wBXvCUOVlhYkUqe875iJG/0oM8MByb2bqEOkb3S9W25wDI80190JiTT5X
 WI6y9SzYts8wlYrm6t3U81Gn2VqLZsLjk0legdKhUxc4HV5dZ0amtt2cI w==;
X-CSE-ConnectionGUID: LBFVBnTvSyy0Lxz2BpWs6Q==
X-CSE-MsgGUID: iSwNity3R5+biIlZpYytbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="32090446"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="32090446"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 06:44:20 -0800
X-CSE-ConnectionGUID: CilvJ1ZvQbuw5tiNU9kP4A==
X-CSE-MsgGUID: TzNjHn++SYaiqOA0L/T+DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="120517993"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Nov 2024 06:44:20 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 19 Nov 2024 06:44:19 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 19 Nov 2024 06:44:19 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 19 Nov 2024 06:44:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nGPQU89xMbFilcLVkoIuYKGk6JoBO19N7xjmnOIezliQDcmzgj9q+qOvFCI+j4+gR4/bUOgJarwF8s8B+2LYjAgQ/SFjDlQQIw+x8YXl7AeWdVEmD0ER85TGH7YRNYFV+UbsAO3NyTuUVm9otFwZk87eP5M8YQjS/5zpg5EPSqxTFPB+nkKgGTGnxsLXYcS3rBZTYUgqtSMN5s2N88EnPLFt+TvZKmw7LZVhSyCldk3WLK9IIig77RE4JltZsjVzCwbhTOU6y9/Z377JORLD556gQ0wA1ALFCCyzdoqBe/Fb2LJk2bGvQV2rP7e7D8oo5+xHAYHgb4xwNbxRvplzvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xsrCjORkehirAkAW5ZpIhoR23Q3Ea8M+ZlGDgGPN2Pw=;
 b=DK5wkio+CGWKN5sF6axSi0qaGbOKJqMqvNNHSAV6kPX+wADMpaA9cW8sKXNVGaFZbIkds0Xav5a7KpVNCqmmYFU5mO3fe9sQ++TSGWyy5DBV9q2Gk8FSHieexqlsLFpIvDBvjRhS8rkICnBICTLU2augWeaql0giP3BZ6/KcRuVVmJo69FJJvv3CL9/Jm1ruYHXYFYti/9uscwiGPioVwC7q6kMnvXSPf88Fb1Xy7d1cw3GFbjMU9qofG8pKuXEDxX9xOG8+e45FoT2anbPMgH8iriwsXeo6OcrI0hLlCfbTWX02ENopNzhcgQj2V5MJT/9uwpCRjRUBOFiw7GWm3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4766.namprd11.prod.outlook.com (2603:10b6:806:92::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Tue, 19 Nov
 2024 14:44:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 14:44:16 +0000
Date: Tue, 19 Nov 2024 06:44:51 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH] drm/xe/oa: Disallow OA from being enabled on active
 exec_queue's
Message-ID: <ZzykYzGwr1GXSqoV@lstrano-desk.jf.intel.com>
References: <20241119013256.680030-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241119013256.680030-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0108.namprd04.prod.outlook.com
 (2603:10b6:303:83::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4766:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e986195-2bd8-4224-f5fc-08dd08a8a45d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+jPALNPs4rbKGelWp7VPD3CEcKvUhrHLJzKQ00jK82xu2YyJ6MoZP1PWQd3c?=
 =?us-ascii?Q?CJoREt1jAlBt6iUFwxVSCCsQK4EOo/4vyWwm3Sojpxl/bZEIGGv9sUdQH2gZ?=
 =?us-ascii?Q?m3uuIungvRELI4Z3PenwodwDP9BuXfI3sanf+jtHQQ1nnN2CLxsxZ1SQimHv?=
 =?us-ascii?Q?fOvIx91XGr5r8kMUsx+grbrI2CdOoTk5wRIw4jST7YrPEAV4fvgQS2MAhqpC?=
 =?us-ascii?Q?2QpbKDzuEUy7rJw4z2brQYzL+GG9CnwhypboHZKQJ3AJpF02IkkWUxdCx3sZ?=
 =?us-ascii?Q?WCQo8g4gwOFtvJI9dPHhBeuhO2oJd0Fxa4y0DdkNum1A6UwIcM5oU9ylQx+b?=
 =?us-ascii?Q?cFYrL/Mbe7ZuzIWShDttJ1DraH297NHTh5+2u9QP3cKlnNlZec/zKRq/Dfys?=
 =?us-ascii?Q?hearLwHXktyvIF+WXbWSBvrCNVCm3UL/daVGLhHhvkzeMcGe83Qc240Zb6xm?=
 =?us-ascii?Q?sgTtR6AbD2RgW1sVLaNiSRGzsJZRe7YZj2fpYakm5Y2imXbxvTo/qPx+jciQ?=
 =?us-ascii?Q?OTFn4WFJ3QBi1rVYqC2ml1vuRE04tKGJX7OGzKGi//eOMsx7Hje3On2ieORZ?=
 =?us-ascii?Q?qu4TPMUhnCN11+qO0fu/ftUaazM+f1LYGy0/MYOYYHaqeB2Khf/XcK9Txn4S?=
 =?us-ascii?Q?DjWbl2CmBzKNmDt86LcKiUthm/DwedkvJVp060Jseuq7KqcFPe8tfQwT7BzH?=
 =?us-ascii?Q?r8GFBazRF72w4W8/DeiZS8LDpJTSCLaLsywyo6Gp+1FfavpG151nZocgocOK?=
 =?us-ascii?Q?aKuZNVODi84CivwOlUPXpII0oIL3dDepYM5tyicd5CXA9pbTXLzAPGQJgPUw?=
 =?us-ascii?Q?zTrQ973g+tdbMut5Y61NDZKDohIRzcGR57JwivRzQg9J3gk/0PJqJUIFI+vu?=
 =?us-ascii?Q?iM8IRI96f0qPfHTqtusFHwyCaXjnl+sI17EHlUxv8ly5p8SKxZ3V5SeICW4e?=
 =?us-ascii?Q?HGKDO5o4rV1hFJIlvX8Hm6HKH6V2s90EzJoYhgFYgp85N5n9Zk+hJocU859g?=
 =?us-ascii?Q?TuYSkRxOTfHNPU4kZdZFDqH+BVCDgcHvg6iFe9CGN/57ihyJEjbBzz8KsgXG?=
 =?us-ascii?Q?MztIhsBehtD26VDq3w138UD0jNRMuKcCirG/UdjPBp2q0BCKnlS86zVc/hsa?=
 =?us-ascii?Q?Pu0Pn80Ftv62upr1V3chH1dVy5Z3HQkmi69C/Xdi8NeV0PxMdQH9ToAiD1O+?=
 =?us-ascii?Q?LRcJT0sW+DwrB6CxOgyYNx7b10gNUrtV1zDPjL1WtbiqhY0E3NH6BYvA63/O?=
 =?us-ascii?Q?3zzEQNnF6kHvZ0wgX8yvekqizKPrzeM3xgcT94l+kOUl447agJtHoa4onMyI?=
 =?us-ascii?Q?knOVE1TWJI9mSIuxx36VvU1O?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3u6cXsp0l4hqa+sC0dVh10pP5+rRzgD95REVRsIKNsqWBq45tjr0UGOw9I2B?=
 =?us-ascii?Q?/IbhJNEborowi7Z4oc+PV6oF4UXHyhLR0EK2K33CodV4SNG95NMRBmS0AjFB?=
 =?us-ascii?Q?GugT1zFPoNrTBNuduS7qTDsvYG0fYCponVYCWZga7YsbpMr+dhxfSqBXzVS1?=
 =?us-ascii?Q?jnJ8x/n4f/c/lKx3YO1uxBvF+R6PAlYnDBGIs9EO8qf7/LYL+r0f1fcabsF1?=
 =?us-ascii?Q?Qv/jlGdHNORdK08LWIpfnS8f37QrVsb67wTs+bI57zT4KeH89eRbeq4oAE1i?=
 =?us-ascii?Q?tPM2pJMH+6d7TndvSRTe2SR8C89Z+vXQgdrnJAJlWXcm+3mLuUCG4zFf665k?=
 =?us-ascii?Q?w/NAUvUSbwcHC9+GiMsor3zqe+IEZwL+4A4L3rnyOi5JuhHUiibSU3jPqkL4?=
 =?us-ascii?Q?1pEbn0G5SlZ3Wt6ldZAaDsPflZUnPTNFDkqC5BVeCS4P3Yj1MYJAsv3Vbl4N?=
 =?us-ascii?Q?uwyov4BEEUJim2dqcB93YISilXyoBdmMO5lsx4+o7wa65PkrUQnamVvEj8PP?=
 =?us-ascii?Q?oPm9SwuI0pZSKbZMW7g6fpOwKZZsLbVQbIc7+FLgfKTi+zHCCZf3k3N1ovNC?=
 =?us-ascii?Q?VIunTaG53RMPXJAkEdVAGT9QXV9DHMfZMK6idWwydbWlsO4roY81T1N3PUfk?=
 =?us-ascii?Q?MIxD3NuJQUvGsHqJNVq/um8Ljf28l2B/8ToEdbAC8x//AEOeCqhcx8QJDGmh?=
 =?us-ascii?Q?6qUkOqS9+Qy8rbDoEMKCqRLM3e0woMQcp/4+l9wCBJ4FDvoTxsokBVfBAQOc?=
 =?us-ascii?Q?8H3D+ey7+NGsOog1BLsskze1W6DoFIx5XMVWH6pVqF9KhnnqgK28SdrRYbXm?=
 =?us-ascii?Q?lPUATg26A/1LQGDpGeo+gEeziSrVP9I212UECnnIP3JDalf0O0Hrt5XLl7jS?=
 =?us-ascii?Q?2vI6fIdKhcOchRXoUKpfxV3xSer0hc8quhwO3e0z+EosY78RPVkR2FrTv6vX?=
 =?us-ascii?Q?g0/f3c98LRNdylwiIkXUiPbzUsHNk6zBRR6rdEOpMaimor8kqcxODTtYYI5H?=
 =?us-ascii?Q?rZ2btFPVsk28N2FzKEKkK4HLu0uxinzqbpa0bt+jeCMhXqEUCt9U4zRwKPis?=
 =?us-ascii?Q?NC9lneXHQwmq3MZiDCJj2vKjlkpUMI1HSxcn1r2fD2M+a1ExA+eQ3jsxeZlM?=
 =?us-ascii?Q?NHTipP4VMz/BPyT9IGfAvdjciQgF080hqA/6Al6+RGx3R8G+8eaLF6TER27s?=
 =?us-ascii?Q?07hlcIGj6HJQ7kWJ3153ZfqehLtEhgL0ewFCrtjhjoAtzahP9/zXLB1y0Gav?=
 =?us-ascii?Q?UJFa+OZ8wc5d6WAjvAZtcgstRYyCnoou/HU1hTXR9a6fStvg2BjbKHd0OBKO?=
 =?us-ascii?Q?4/w1oOVxpX8ptF4AatT4HTLlqKDs5iIumtO7/NP0od2wFkz311aonegAOfPB?=
 =?us-ascii?Q?G5fagL22idHWVOwidS050GcxN5RVFYbf0aaJcE4BFtxBBST0gllqLuJRTK/0?=
 =?us-ascii?Q?ggIUsWfBdkfiUAwFexnFctSAYoTIQCiNAU5adb4LJ99UHeO+RPqVifVk0mar?=
 =?us-ascii?Q?Dy2QARbZdUITOhIVjFVtlNl3fqnltm3IdBi6eQ3HhVR6uNCVl38w/f71PoLS?=
 =?us-ascii?Q?49l7P2iANLQr/Shig86UiqFnxbVIRZH1dkFhfiTyHK9cVjm1pt5T8bnfUuxl?=
 =?us-ascii?Q?ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e986195-2bd8-4224-f5fc-08dd08a8a45d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 14:44:16.3394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fJRsmNzVSYN5lU5wuHTU1u/rOWSi54nzG/iM2IN1N9rxsAPEWMmv1rA536fPquADTol060kwqRx80EFEmYs+ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4766
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

On Mon, Nov 18, 2024 at 05:32:56PM -0800, Ashutosh Dixit wrote:
> Enabling OA on an exec_queue toggles the OAC_CONTEXT_ENABLE bit in
> CTXT_SR_CTL register. Toggling this bit changes the size and layout of the
> underlying HW context image. Therefore, enabling OA on an already active
> exec_queue (as currently implemented in xe) is an invalid operation and can
> cause hangs. Therefore, disallow OA from being enabled on active
> exec_queue's (here, by active we mean a context on which submissions have
> previously happened).
> 

This is something we will need to keep on eye on then because in various
experimental code I've played around enabling exec queues upon creation.
e.g., If we want to allocate a doorbell. I seem to recall Habana wanting
to enable exec queues upon creation too.

Just curious if it was ever explored having exec queue creation
extension which enables OA? It seems like this is something we may need
at some point if our exec queue creation semantics change of course
being careful to not break existing flows.

Matt

> Transition from 1 -> 0 for this bit was disallowed in
> '0c8650b09a36 ("drm/xe/oa: Don't reset OAC_CONTEXT_ENABLE on OA stream
> close")'. Here we disallow the 0 -> 1 transition on active contexts.
> 
> v2: Don't export exec_queue_enabled, define new xe_exec_queue_op (M Brost)
>     Directly check OAC_CONTEXT_ENABLE bit from context image (J Cavitt)
> 
> Bspec: 60314
> Fixes: 2f4a730fcd2d ("drm/xe/oa: Add OAR support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c       |  1 +
>  drivers/gpu/drm/xe/xe_oa.c               | 13 +++++++++++++
>  3 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 1158b6062a6cd..b88d617c37b33 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -184,6 +184,8 @@ struct xe_exec_queue_ops {
>  	void (*resume)(struct xe_exec_queue *q);
>  	/** @reset_status: check exec queue reset status */
>  	bool (*reset_status)(struct xe_exec_queue *q);
> +	/** @enabled: check if exec queue is in enabled state */
> +	bool (*enabled)(struct xe_exec_queue *q);
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index f9ecee5364d82..b9b9cdb6f768b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1660,6 +1660,7 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
>  	.suspend_wait = guc_exec_queue_suspend_wait,
>  	.resume = guc_exec_queue_resume,
>  	.reset_status = guc_exec_queue_reset_status,
> +	.enabled = exec_queue_enabled,
>  };
>  
>  static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 8dd55798ab312..4a7440c40978c 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -2066,6 +2066,19 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
>  		if (XE_IOCTL_DBG(oa->xe, !param.exec_q))
>  			return -ENOENT;
>  
> +		/*
> +		 * Disallow OA from being enabled on active exec_queue's. Enabling OA sets the
> +		 * OAC_CONTEXT_ENABLE bit in CTXT_SR_CTL register. Toggling the bit changes
> +		 * the size and layout of the underlying HW context image and can cause hangs.
> +		 */
> +		if (XE_IOCTL_DBG(oa->xe,
> +				 !(xe_lrc_read_ctx_reg(param.exec_q->lrc[0],
> +				       CTX_CONTEXT_CONTROL) & CTX_CTRL_OAC_CONTEXT_ENABLE) &&
> +				 param.exec_q->ops->enabled(param.exec_q))) {
> +			ret = -EADDRINUSE;
> +			goto err_exec_q;
> +		}
> +
>  		if (param.exec_q->width > 1)
>  			drm_dbg(&oa->xe->drm, "exec_q->width > 1, programming only exec_q->lrc[0]\n");
>  	}
> -- 
> 2.41.0
> 
