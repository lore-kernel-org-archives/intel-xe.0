Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A884EB107E
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 21:47:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC1D10E19B;
	Tue, 10 Mar 2026 21:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ld931xP5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C19110E19B
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Mar 2026 21:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773179239; x=1804715239;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=J8jOlbonmNXmpI+kod/qfTmC9oDBfYQnVUQLX/XGOME=;
 b=Ld931xP5exa1+nnwpopUUiRHBqKRTkwAZzx+z6p+YaOEEXuYOwW44cFG
 gbBZ7yIGkjSy08dCojddn7aEJXO+0KRSp6yYMF+u6EWffKLPdIKCMOFCh
 XeiKrcrlDeKD2ZkpLjxTIq6WKlc6VA31qxEtVvPMyf2R8xruM6b2ETnfV
 1cbFiFqz5H3WUPIuNXyNGK5W6ehMYca5OKAoUBOqZh177Oc7IKc/snvRT
 X3CkxudMdvTh7C7GfDhzyFH1BmnhN1GGkCCLCucmGfHeRoRpNrtkhDm+R
 npCnoeeuqcOTzFsbXDCoPgVhrUUFyFNKXZjS1Y7H4vewHJZuZVfHv1+yT w==;
X-CSE-ConnectionGUID: bnNaKQUpTQeLrFw9uqbw4Q==
X-CSE-MsgGUID: 7lxLjbYQRxmT8D4SEbRm8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="73262467"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="73262467"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 14:47:15 -0700
X-CSE-ConnectionGUID: S8H5SRs4Tf6LjxnWleJbkA==
X-CSE-MsgGUID: IIb7kPAeT4SlUFVm+SojsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="219497732"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 14:47:15 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 14:47:14 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 14:47:14 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.31) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 14:47:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XPTvBFaC5WyKCWAF5lKVKGnPuTs7nJ1E2/InRztiTog2EVzxkixgjWZyj7wvuQ4NT5W8D6dvFrdYjVCTPUNSD4tBmHwzbITeXsvsoAS0HZFZg0xgVOdZFFHL0cRZunB9OWPO4uFHqp3htSUA3Ouplm8ijZaisXsnPRkR+TuS/swWNhk3zqXUk/lZFWbofaFVVWlu13SM1mOYXwjo9RvvCL5GpQ+YZUSe5nRjkTkCKWnUsW2WaUZtMjgIEL/eDEZKSsL6b8sm0ow+sLiHy6b9Odo39XWnX6zhyXBKlq3BVU71oFb1ocbjLwXMOhQhOijs9YTdrozaizrEDbMVlVS1Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOLtWV21+kE6JZwjsZ09WzueRl4OMhByLDYq/AVZF3c=;
 b=SWNmjOldcWMA4SYrq7A7Q0sSvgNDzjrS6j5LXu+VeLN6KREMifhu+4fKTvPt3rUiDSxVanwcC6EREA/XzIISn+iZbX5amAIdkZxqSxykL7cNrdfNLNGtN52K5wZ8Ye9mGNxO+8r3jxnkFn94x2yslMMWlfxs9FBX8h15lQYw4HKLCvJenGrh25UaMZ2LCoUWcaNDdkQnkix62dHf3zygpcDQOXnGszlqHlWU2ULGwQ38vtRsYDTsZ73taMdSUcluWfcJqMZrWUAysPwBnu7sk0gHQ+Obw6GXnChbBSRYvmfI7MhIohlWbIQ4w27M50WTtq0rvx7o9YcFwSs30rOk8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CYXPR11MB8691.namprd11.prod.outlook.com (2603:10b6:930:d5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Tue, 10 Mar
 2026 21:47:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 21:47:09 +0000
Date: Tue, 10 Mar 2026 14:47:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v21 6/9] drm/xe: Move aux table invalidation to ring ops
Message-ID: <abCRWxBx9nHsByj6@lstrano-desk.jf.intel.com>
References: <20260310123453.54346-1-tvrtko.ursulin@igalia.com>
 <20260310123453.54346-7-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260310123453.54346-7-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: BYAPR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::40) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CYXPR11MB8691:EE_
X-MS-Office365-Filtering-Correlation-Id: 9197440f-fe0d-4e9b-e595-08de7eee947a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: rAiquaP4oMKu0z28PT7dG/QLExSsm3E5ooGOZPGwwHV6Saen5/A3Mna6HIeNmCM+XpAMboy654lDWlQ/2BNuAafr9ArUj4F60oDH7ezOBgUuOtNukxWlsD9uOsxTkCjb7iY3LO+xx8+FuLjxv8vxrsX6HgxVp7kAyWMp7kC6YHaQQtRWwHPhqgRQu5gil3pYbxRTqy5NVKJHkvLzyTT3Hj1XTTOjcz9gKRXyGu6hiBrVaqD83gcTVeCjlPf7SXvA0NvoO7nNCXSkGG3jQachi7+yoSd5dxkJmaQDSaazdB09ZG1WoRlQZ4Ka73p70ojJ5AqC0qNcJvxvZTPCYam9C3lXH3aix6XrqtGKaHOlJ77efcPc1fK+XDqJUU75mE1ND+DcnJdFbcz1QXP01hu7+1C9WAhJ2UQM3ip+6UNSPee0mc5II7kBbhqMhozUG3UbS7BAAvFcTUCyQUGcBEOvtECEkzsbYu1BZsBo9RK26jOxdReFwGds2Kg4fEehhWSk0B+aXwG2VOPVc0uPxJxLgny/Ja+DdiKO90b6wX5ywwll+JIokVyIz5EkeZ93NwGZ/JCwVxRrA/l9dpkeDG8Ge3thULW1cfeRlCLTiwLKlusNNgseucRmLTBDvqdEqVplm+8RqkanUb7LGPDxVgAAu8HxsXeh2KPViVrgwSnG0xnCp+NK75fI3aM2K1aEzH/TnIEi0y5NFFQVMM8dbvxO1LxKWlOF8a7SS38Zpx1mPQA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sfmsLEpiU4/tTiiP/0uAIaYaD8LS9p7vs68NjPNse3BeG+uMzDnfhO0QWhhI?=
 =?us-ascii?Q?VpOwPKJuBsqsR2O9vJ3wLoJZLIocgODBvwaxYAiPFXkA/sdh75JJRKYaPD9w?=
 =?us-ascii?Q?Vo3n1FWMfAhO1h8GizlwSWnrHodhqbB2kYwvtDAh6Mx1wN7TLCdHC+eBrvjb?=
 =?us-ascii?Q?7e/LllJjox1p85Ibo4fSL1UIjXTBljhjsF99n7xbkAySP0qf93Nm0MeGhvZp?=
 =?us-ascii?Q?P7tUAgSUW1xEeOmyiYUeCr+23LdKuc8Anu50dCsoxK1KTl1bPLAU0MgIhQbc?=
 =?us-ascii?Q?yhwIGg5jrB78HDNfqmnvFQ+gdHFbtFNWwh/VvTBG+x+EpWAzabMCbhN3TG+d?=
 =?us-ascii?Q?3c70FYDtwhds/2yY5GPpq7eQlwuGkDrLxm9lKoo5cyYN5ux6HAV+sc1eTdQW?=
 =?us-ascii?Q?RH45HGCSiswahvEYsdHR72Qnp406/V66bn7+WaLzKLksyeH0DVY2jkTa1yAH?=
 =?us-ascii?Q?gbrNi2UblSbeL65rNj+7jRwvPBax9apxevRPoblnjWblQSqIucnxHIW61NHN?=
 =?us-ascii?Q?DwQrj54IGvrCQS7wYXkNqMGiWbTntf5egL3qEJY60LK4Yj0zOa/e5r43T6cq?=
 =?us-ascii?Q?p/IsGujrCTvIxZJe6+vqjViOWy4OU0yFl/d269JFNgB4rmAYxDGidi/ReUgN?=
 =?us-ascii?Q?bDtkCH3osi5Z7YqsGdNlkEFSKqzvK/MURyIWZzRV+Mgh5okyQYokJFYiK+lX?=
 =?us-ascii?Q?jIyrlKFvVQzNLRMVS48YEDYbjIvl4+NdV7pcyTMolgQSvaiKHX9ttONbr/Mx?=
 =?us-ascii?Q?0GaqFFhK0HalThCijACAtyxlgDYljcB5766+J/PdZly9Z1JcX3t705rH2OYR?=
 =?us-ascii?Q?DXU2GinQuIDjwXWky6gJnT0WGMWMIs2dKfkk7S4OX8Nx2OM7ueaIQonZ78NX?=
 =?us-ascii?Q?YSFDA1xBC5KDDUjRayvdBvCymdVGbF62bXlg+0bvAj1APgmAj9vfegT8KuEQ?=
 =?us-ascii?Q?juzy1xxwq7LqOyzrS3XHpd2F1JIgjU1NhxRhcBRSyjsc/KPvFQzQfIU+0r69?=
 =?us-ascii?Q?tpbJ9NjcAt3r7Q9LP1WfETBIZWYHtl6KjqtP4L3Potp+PfQ4GMFm+dCavlgp?=
 =?us-ascii?Q?yW1Mi+W0Ds3V2qbyXgIWOI1duppKFySrdW/Ms5SW8gX8b8xMKgKnrMUAEcs6?=
 =?us-ascii?Q?XJFpStF7tWJganCOK1ey7C9SqMLXOT3Gh8Kis7HUrNylKJSzQacl6RDncX2B?=
 =?us-ascii?Q?NlgHs5gfGjtou9N1j6s7p1TdRYO5xhbEvKLBVRlNyBr1rDVMT8AvNvG13B+N?=
 =?us-ascii?Q?HzVQtwO2h6PWhjG+UtEy9g19F3mi1Uq4nekvCVNdCa1H7ThJcRAvpEcqGmAH?=
 =?us-ascii?Q?98t03LyjkxifXCKoq59FWTpzyY+xaeMBp88XblSWmY5rrM7T5Hpy3th+ZefL?=
 =?us-ascii?Q?XLkMmjCRO/j5xVrj/tHQu/qXY70qCbFSiTgdXRfHGNIe94Tb0dWtsV9XQ4KW?=
 =?us-ascii?Q?kbWW2WgY6dIxkbW+YJ6XVMBQwz85i7eXZSPGwem8ig/u9TZYIS6zAsrpe4t5?=
 =?us-ascii?Q?9sWLjFvcF9SjKdLD0gL2ykQwe0mj0tIbCm6iAYQh912yBqH57TBFN9NP+azD?=
 =?us-ascii?Q?bkCsMMoZhPwlP6x9PDBGg8DdczblTeTT+LuerwrUxVffnU6Yoxaj+NgbZgTO?=
 =?us-ascii?Q?nKzG3AjB/FWNMfqUNmBx+yfH40n+1hOFbJtoTsr9pP9Jesxb7DVxJNKFiYKX?=
 =?us-ascii?Q?83tnV6lZYVx7O+3O3aaDfnEukHhNluo3fIfNGBnbiEHy/gWUq/z7iP8jLeLo?=
 =?us-ascii?Q?lhPLmG5Y8gdrzhY/Spz7KmcnBmc/oqE=3D?=
X-Exchange-RoutingPolicyChecked: ZR0nFLU1K5jGX6PIXFgyF6PBvSXfOeVa6TeCtVXnktmf2s7WywTvTTdnCkvaVb1kTLiULsnzEbqnUIeMVS2CSmTLijJWk+eb6izcUPV6aN+M4sjwZDRNsPtsjU+Qq9oXjzR5vd71aWUSXT45/C7cMC79H62M4UROGA2wMgTiUeJmYIAZq4OKvO+Fz+HKOLNL0pby6kmkpc0m6+66Fg2HB6vmb6/FSd+o/ip1IySdLPw9DKZ/UoHgT1vCCs3mtfw6HBLDvObIliwF3+pPx2PmrLiCIsMUtDttlybYA0SZ9lGjMi/N0uUj4zwLac6DODIEbEobLdXjPdzE8MxUg1WBlg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9197440f-fe0d-4e9b-e595-08de7eee947a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 21:47:09.3569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1aow6SIf5Fbx4LcekZR2KcP/K/Ow1gfcYseKUbUx8bJFBGFtdsC3eUjHg8SZq1fTXzED3QE4jtcTErVm8Qa8zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8691
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

On Tue, Mar 10, 2026 at 12:34:50PM +0000, Tvrtko Ursulin wrote:
> Implement the suggestion of moving the aux invalidation from a helper to a
> ring ops vfunc, together with the suggestion to split the vfunc table of
> video decode and video enhance engines.
> 
> With this done the LRC code will be able to access the functionality via
> the newly added ring ops vfunc.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> v2:
>  * Removed stray hunks from v1.
> 
> v3:
>  * Include header for u32.
> 
> v4:
>  * Forward declare struct xe_gt.
> ---
>  drivers/gpu/drm/xe/xe_ring_ops.c       | 105 ++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_ring_ops_types.h |   6 ++
>  2 files changed, 83 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 596379e6d742..8947b3091873 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -48,22 +48,48 @@ static u32 preparser_disable(bool state)
>  	return MI_ARB_CHECK | BIT(8) | state;
>  }
>  
> -static int emit_aux_table_inv(struct xe_gt *gt, struct xe_reg reg,
> -			      u32 *dw, int i)
> +static u32 *
> +__emit_aux_table_inv(u32 *cmd, const struct xe_reg reg, u32 adj_offset)
>  {
> -	dw[i++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) | MI_LRI_MMIO_REMAP_EN;
> -	dw[i++] = reg.addr + gt->mmio.adj_offset;
> -	dw[i++] = AUX_INV;
> -	dw[i++] = MI_SEMAPHORE_WAIT_TOKEN |
> -		  MI_SEMAPHORE_REGISTER_POLL |
> -		  MI_SEMAPHORE_POLL |
> -		  MI_SEMAPHORE_SAD_EQ_SDD;
> -	dw[i++] = 0;
> -	dw[i++] = reg.addr + gt->mmio.adj_offset;
> -	dw[i++] = 0;
> -	dw[i++] = 0;
> +	*cmd++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) |
> +		 MI_LRI_MMIO_REMAP_EN;
> +	*cmd++ = reg.addr + adj_offset;
> +	*cmd++ = AUX_INV;
> +	*cmd++ = MI_SEMAPHORE_WAIT_TOKEN | MI_SEMAPHORE_REGISTER_POLL |
> +		 MI_SEMAPHORE_POLL | MI_SEMAPHORE_SAD_EQ_SDD;
> +	*cmd++ = 0;
> +	*cmd++ = reg.addr + adj_offset;
> +	*cmd++ = 0;
> +	*cmd++ = 0;
>  
> -	return i;
> +	return cmd;
> +}
> +
> +static u32 *emit_aux_table_inv_render_compute(struct xe_gt *gt, u32 *cmd)
> +{
> +	return __emit_aux_table_inv(cmd, CCS_AUX_INV, gt->mmio.adj_offset);
> +}
> +
> +static u32 *emit_aux_table_inv_video_decode(struct xe_gt *gt, u32 *cmd)
> +{
> +	return __emit_aux_table_inv(cmd, VD0_AUX_INV, gt->mmio.adj_offset);
> +}
> +
> +static u32 *emit_aux_table_inv_video_enhance(struct xe_gt *gt, u32 *cmd)
> +{
> +	return __emit_aux_table_inv(cmd, VE0_AUX_INV, gt->mmio.adj_offset);
> +}
> +
> +static int emit_aux_table_inv(struct xe_hw_engine *hwe, u32 *dw, int i)
> +{
> +	struct xe_gt *gt = hwe->gt;
> +	u32 *(*emit)(struct xe_gt *gt, u32 *cmd) =
> +		gt->ring_ops[hwe->class]->emit_aux_table_inv;
> +
> +	if (emit)
> +		return emit(gt, dw + i) - dw;
> +	else
> +		return i;
>  }
>  
>  static int emit_user_interrupt(u32 *dw, int i)
> @@ -327,7 +353,6 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>  	u32 ppgtt_flag = get_ppgtt_flag(job);
>  	struct xe_gt *gt = job->q->gt;
>  	struct xe_device *xe = gt_to_xe(gt);
> -	bool decode = job->q->class == XE_ENGINE_CLASS_VIDEO_DECODE;
>  
>  	*head = lrc->ring.tail;
>  
> @@ -336,12 +361,7 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>  	dw[i++] = preparser_disable(true);
>  
>  	/* hsdes: 1809175790 */
> -	if (has_aux_ccs(xe)) {
> -		if (decode)
> -			i = emit_aux_table_inv(gt, VD0_AUX_INV, dw, i);
> -		else
> -			i = emit_aux_table_inv(gt, VE0_AUX_INV, dw, i);
> -	}
> +	i = emit_aux_table_inv(job->q->hwe, dw, i);
>  
>  	if (job->ring_ops_flush_tlb)
>  		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
> @@ -384,7 +404,6 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  	struct xe_gt *gt = job->q->gt;
>  	struct xe_device *xe = gt_to_xe(gt);
>  	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
> -	const bool aux_ccs = has_aux_ccs(xe);
>  	u32 mask_flags = 0;
>  
>  	*head = lrc->ring.tail;
> @@ -395,7 +414,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  	 * On AuxCCS platforms the invalidation of the Aux table requires
>  	 * quiescing the memory traffic beforehand.
>  	 */
> -	if (aux_ccs)
> +	if (has_aux_ccs(xe))
>  		i = emit_render_cache_flush(job, dw, i);
>  
>  	dw[i++] = preparser_disable(true);
> @@ -408,8 +427,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  	i = emit_pipe_invalidate(job->q, mask_flags, job->ring_ops_flush_tlb, dw, i);
>  
>  	/* hsdes: 1809175790 */
> -	if (aux_ccs)
> -		i = emit_aux_table_inv(gt, CCS_AUX_INV, dw, i);
> +	i = emit_aux_table_inv(job->q->hwe, dw, i);
>  
>  	dw[i++] = preparser_disable(false);
>  
> @@ -534,7 +552,11 @@ static const struct xe_ring_ops ring_ops_gen12_copy = {
>  	.emit_job = emit_job_gen12_copy,
>  };
>  
> -static const struct xe_ring_ops ring_ops_gen12_video = {
> +static const struct xe_ring_ops ring_ops_gen12_video_decode = {
> +	.emit_job = emit_job_gen12_video,
> +};
> +
> +static const struct xe_ring_ops ring_ops_gen12_video_enhance = {
>  	.emit_job = emit_job_gen12_video,
>  };
>  
> @@ -542,20 +564,47 @@ static const struct xe_ring_ops ring_ops_gen12_render_compute = {
>  	.emit_job = emit_job_gen12_render_compute,
>  };
>  
> +static const struct xe_ring_ops auxccs_ring_ops_gen12_video_decode = {
> +	.emit_job = emit_job_gen12_video,
> +	.emit_aux_table_inv = emit_aux_table_inv_video_decode,
> +};
> +
> +static const struct xe_ring_ops auxccs_ring_ops_gen12_video_enhance = {
> +	.emit_job = emit_job_gen12_video,
> +	.emit_aux_table_inv = emit_aux_table_inv_video_enhance,
> +};
> +
> +static const struct xe_ring_ops auxccs_ring_ops_gen12_render_compute = {
> +	.emit_job = emit_job_gen12_render_compute,
> +	.emit_aux_table_inv = emit_aux_table_inv_render_compute,
> +};
> +
>  const struct xe_ring_ops *
>  xe_ring_ops_get(struct xe_gt *gt, enum xe_engine_class class)
>  {
> +	struct xe_device *xe = gt_to_xe(gt);
> +
>  	switch (class) {
>  	case XE_ENGINE_CLASS_OTHER:
>  		return &ring_ops_gen12_gsc;
>  	case XE_ENGINE_CLASS_COPY:
>  		return &ring_ops_gen12_copy;
>  	case XE_ENGINE_CLASS_VIDEO_DECODE:
> +		if (has_aux_ccs(xe))
> +			return &auxccs_ring_ops_gen12_video_decode;
> +		else
> +			return &ring_ops_gen12_video_decode;
>  	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
> -		return &ring_ops_gen12_video;
> +		if (has_aux_ccs(xe))
> +			return &auxccs_ring_ops_gen12_video_enhance;
> +		else
> +			return &ring_ops_gen12_video_enhance;
>  	case XE_ENGINE_CLASS_RENDER:
>  	case XE_ENGINE_CLASS_COMPUTE:
> -		return &ring_ops_gen12_render_compute;
> +		if (has_aux_ccs(xe))
> +			return &auxccs_ring_ops_gen12_render_compute;
> +		else
> +			return &ring_ops_gen12_render_compute;
>  	default:
>  		return NULL;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops_types.h b/drivers/gpu/drm/xe/xe_ring_ops_types.h
> index 1197fc0bf2af..52ff96bc4100 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops_types.h
> +++ b/drivers/gpu/drm/xe/xe_ring_ops_types.h
> @@ -6,6 +6,9 @@
>  #ifndef _XE_RING_OPS_TYPES_H_
>  #define _XE_RING_OPS_TYPES_H_
>  
> +#include <linux/types.h>
> +
> +struct xe_gt;
>  struct xe_sched_job;
>  
>  #define MAX_JOB_SIZE_DW 74
> @@ -17,6 +20,9 @@ struct xe_sched_job;
>  struct xe_ring_ops {
>  	/** @emit_job: Write job to ring */
>  	void (*emit_job)(struct xe_sched_job *job);
> +
> +	/** @emit_aux_table_inv: Emit aux table invalidation to the ring */
> +	u32 *(*emit_aux_table_inv)(struct xe_gt *gt, u32 *cmd);
>  };
>  
>  #endif
> -- 
> 2.52.0
> 
