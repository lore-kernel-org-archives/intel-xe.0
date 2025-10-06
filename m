Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDB9CAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 16:03:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFDAB10E413;
	Mon,  6 Oct 2025 16:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XSzOTV50";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 576E910E413
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 16:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759766585; x=1791302585;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hyeVMlm2rNStR09AAW+FMP2EMmPvMCOayYY2yBDSXBQ=;
 b=XSzOTV50s91tT5oEX0bDfobzbwgeuCSkxUvLi/XkvCo29rlz8FhfDIz8
 PqygqZGy6Jp2wwm+9dHjAcAM5nVvQsFATbOEnXr0x6nqt9SrykAzSoLdB
 IPQHr5G7Nq1pzaM7l/ChymQx+rtBj9FWuaHTvMJ8pzfgBHaDbdQrvZKU1
 m3MbBHdLVjsETCrwM1t1rAzqnd/BaxPyDrTK/hovKNpuIzvfBphRaYCeM
 6v1tEtymjq3Wz8ZG/PHLS7bG8lq2pR2JQL4Vo8AE35uYW0y0jEgHrY5e8
 uclqEMB/WZ6g721XfDUZgiS1hFkPj+gAh7PQhFLr1xZaf1ySKgGGKTBO4 g==;
X-CSE-ConnectionGUID: RaHoF57VQkSRGhC2RXwN2A==
X-CSE-MsgGUID: U88u4EeHSBi9CQ5eyiETNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="73043244"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="73043244"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 09:03:05 -0700
X-CSE-ConnectionGUID: ee/E2hSMRiWoVbX9bvYc1A==
X-CSE-MsgGUID: DfIVGmvzQp2dy8qIbuXwMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="179956791"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 09:03:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 09:02:59 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 09:02:59 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.54) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 09:02:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N1DPQV5V38VZyAL4XG15WvnySXPe51pD5duclDDOsm3blu5aOB3+ziNYYv3UdaCbLs5ycDlXi4zZVLEzV+Gp7Nts5E+LYt+n9C3dcrrAHW9mRTKuHzvOLpZJ6ctsQ16548ykaXr7xyOtimCiIlty64nFAvtl7vYrtcNrDokm05r5+spVvnThFWbT8+gBVdmgjR9smLA3+dv24IXAzmBQkPoxA1pKpsx4h5pW5kHn2DOTcN5UOifjIblSogUtWpaRrLzAH3LTbOXvPStm7y/iZCV293iSYHxbMcZc+Z57F21qZPG/uMIZ2q+5oMYKmoJ+8sN9zCI3Pg+whUsK1s3rxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SVYxEejgjP5+zk6sPoQFyg5dhAFG0qsfAuZSqdCo3kc=;
 b=dp7Yx5pVCNKGS0mT8QTl4rKdb1BlKh/1KZ5OCmK3uftymwLRNr6tpLur1ip1zH2yvy1kr4r2xvwTviYsqQzenRNqNOSeJqb1iL+jAxy3a7EDUjFFDtP443bbBZvqOO60woIgSoVA0/BgcpaFM1PTNuyQskLmjIjl+ti3z0HOuqRaqDnIG4YZ45XBpJvjqzRdmgD4eolB97vBf1TpsANJ46AEhY2qcCElVIdEvnIV4HPDjfmoTYRjUy6WZAbgfuM6eiyGXMcHUitThUVK7S/67CkWnJ9DA9JUVNrsalDrsYPPrinFJVZbDnu3oQvhiU9FLz5cCvAkLBCqdJ2s3+1HsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7277.namprd11.prod.outlook.com (2603:10b6:8:10b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 16:02:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 16:02:46 +0000
Date: Mon, 6 Oct 2025 09:02:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 16/30] drm/xe/vf: Use GUC_HXG_TYPE_EVENT for GuC
 context register
Message-ID: <aOPoIu3s1gJTYmHZ@lstrano-desk.jf.intel.com>
References: <20251006111038.2234860-1-matthew.brost@intel.com>
 <20251006111038.2234860-17-matthew.brost@intel.com>
 <4eaa265d-0ee3-4f5d-95b0-7a9b4bd3af4b@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4eaa265d-0ee3-4f5d-95b0-7a9b4bd3af4b@intel.com>
X-ClientProxiedBy: BL0PR01CA0006.prod.exchangelabs.com (2603:10b6:208:71::19)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7277:EE_
X-MS-Office365-Filtering-Correlation-Id: 69fda4a1-b9ea-439d-393c-08de04f1ca18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tcCYznu337UjYvHf/GD1xS3B+ONEk54DRs3x3ttqKAN6/7EUQtiKLeztsX1C?=
 =?us-ascii?Q?jkntzOsg6VG/SOhbxz/df0xOB2iGhD6BnyxCRtD68bEpk7hRrqYZGZuA2Za+?=
 =?us-ascii?Q?ViYCRWKAbtzqXaJJBTvmNj6I/D+9ZuJLctmAfdduiKg7k1i8saitQRX+x7ez?=
 =?us-ascii?Q?+QM3kSh1k0j0wZNBy3iZLlgsSP8zTrgw+Mxq/5zP+Hx1+2e17lQH+5T/6WWH?=
 =?us-ascii?Q?P/Uoy4FIpNvw9EXfpAOi0e7qjFYNJgyY7wGxg1OLfogUls2YG6ox4KZbrPlf?=
 =?us-ascii?Q?fvFsOAKOe4qK0wYaD+aKezGC4Sm6AeVUK5G1IZbilO3K1Mv2KMRiyLRqFhF4?=
 =?us-ascii?Q?T3qchXPGhP+/1YuITOOAWg83wuNtvFOA4Ed/ozCVbCqkKKkzUcFvsv5qvkMK?=
 =?us-ascii?Q?85pWT+kNoeK8ygeNuipyBA2E8Im84UBxUQbO4B2XZzOuWXagcpZmD8rx9xqr?=
 =?us-ascii?Q?aPVNhJf24yakqg6o77f7Cd1XzzmWYg1VYk/aw+2QPg6Q1M6M0blwyHSA6nGW?=
 =?us-ascii?Q?HPDvG9SMaejPDgJOscFP+omEjYhob33YSeHVgwfGmgRXNtzWOoxqMnQyl78s?=
 =?us-ascii?Q?qlmm3APmCxMbbREGdrHCo1GW71fObLQJGQ8kWiQmreqme97IlxqgxjVHKGfP?=
 =?us-ascii?Q?CeefcEVP+RIR9QL7qCd8rjHP0FlVcTQ8q/aS+xZ7MzEJoc6aekioE67K0cxn?=
 =?us-ascii?Q?SLTwaUneQZzZRYkMJEcUlU3Mj3C9px1KB2pVWZspWCo9m/OR5N9IHl0j3ycZ?=
 =?us-ascii?Q?6vxot2nwFDfAmd0cy67MEs99UKokoyXYpOmIZh3RXkecr36wQ47Y9/KcGLb6?=
 =?us-ascii?Q?fyWzvGazkKcCUMzKbldrhBVnUhO6E7hwihpcmHxYN3tfFusF8WK2xYudj+sa?=
 =?us-ascii?Q?NEbwGtOQL1ejzBJWZx+ZBy5dv995NCE5MI5bhcOZ1dxp+wiqjEpza/sAMBMA?=
 =?us-ascii?Q?FtBH6X0AYS1R12BXHlUnwQE/hzyLs2EjnVnT8WMeLWbtgCre3b653EFhsIrY?=
 =?us-ascii?Q?ufyHWgz0BSvEL6qzLFnhVK5lv7BNHGsrC6vgu1I3JXZzSJ3tYT8tBYa4na60?=
 =?us-ascii?Q?b/BhrhVHy1SPqB6az18cw2r5kFPiEh9BwcFXuaz64hMmj2TUg+U4AACAfk7H?=
 =?us-ascii?Q?V3vmIs7rK8oRy8zlZ4v2qSuzq0rhRvny2juEyV6D+AS8l8qu2bvSH/SX+j/o?=
 =?us-ascii?Q?TyiM6wdlO3o4lA3qQUvpi8ALPq553rX9wDkeCedJiDpdBlTmgK/RmtddMxR1?=
 =?us-ascii?Q?wb1E+MBCYp/R83Tega32wP6yyVAzRDYM+Y8DH9oCykE0LixOw0KAfGaYd6jt?=
 =?us-ascii?Q?hKodDrCJYoho5slbGKHUd7pADR9CEsb9iUat6sU34UXInJMk8BpS4wO0S20c?=
 =?us-ascii?Q?AO6A7VcbtoJMsGrwRKs7f+46FVsu1B38OFwVAxtVnTjfHhkj6JRGqzU46Ent?=
 =?us-ascii?Q?yO4/HTpK4K3lZ/FztFE8obVebqWOkxoa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kndoY16SoX13u/y5ndWMn2jQkqZd4bisRmqAKdSdfQfiO05sLMamE+1WZlK0?=
 =?us-ascii?Q?i3QbhEHFrggjVHDO9BJ7D+ejZsJPGD3HD6vSNpWOqD9LoLqf7NgEwee+HtX6?=
 =?us-ascii?Q?yto3bU4junPf0o+ge1E/f4+hITTz8Nyv+qM3tGvzGv49ek7lDimzJFB/50M4?=
 =?us-ascii?Q?gcSPp6DGWIxkuL/g/vGhn3zHqwLYTdYO+j6Kutl3gVTUsX7O95lVoq/5wXDs?=
 =?us-ascii?Q?VyBbngsEpzv/GknWEBG7b7Mo4szK5j+HenKZb443rVBQcQBVsXQ3OyfBe3Ig?=
 =?us-ascii?Q?9WaUOlYML6AI9uEM3om1+AaDboDWMINitujeild89nGmAfPlT0cV7ULRsYMK?=
 =?us-ascii?Q?3iJoeP5Qa2ysHbOt8OCjKRnVuv5WXl1CQCnOgmIjIzmJU2T3ShHfuof5HC9D?=
 =?us-ascii?Q?t3RQT/r+fRwH71XoC5vJ+sKIIY0iZ67e0c2x3hy4ifEFazgzZr/Rbb8giCJC?=
 =?us-ascii?Q?4Evu/qB+CLcqBvH0/9EF6dS4RewNH7Ypy0qB0i0cewb6GNy+ilFFitdb+1TD?=
 =?us-ascii?Q?wuNmVasIDXfZhX3EQWk+9tnp5A+id6xMquCmqwCJY3ZMmtwc8G44eqzEVIJP?=
 =?us-ascii?Q?EwWdCgKuHGOmmejzadxjgkPhSfICAwZcPmR5sFMBNPlHtO200dPtmFfVg8l7?=
 =?us-ascii?Q?AJttqtOJnxNfwjCV4aecX/u1HQ1AxeWnukxgWQ2QUA9lMrosntsHRYLKRALh?=
 =?us-ascii?Q?NrkCQyxqdSm0JgCARunPe/wKCORHKrpo+PxCW1g7/Q2lBT7jLAdrWiBepIff?=
 =?us-ascii?Q?/Do83zEZ9a065FvlhKb5VxU/JBpBvbdGkscmwXRagw7tOw2353HAsLTfGUSN?=
 =?us-ascii?Q?uVeXML8yxScywwK//gE9KV2SkR9V7rAtAC2F3cmTfN8HnQHNcc8uZJCKj/T1?=
 =?us-ascii?Q?Js1sq/s9fLlzR0XM94recGgWig5ab+CotQrXWx9V3hu9dU+fnaDxX2Ix+4gN?=
 =?us-ascii?Q?C3E9stbLRTicdpIORiNeSwVNbn498BtIOQhbFEdDXA/5bpGyTJF5PEC8rV8T?=
 =?us-ascii?Q?J+D+6U49BaTdJs8D8q1uuwFBVPNyTvmfVtIHgRk4KrUrUY3O1QmkzLw6f9B2?=
 =?us-ascii?Q?Gz7RVyvVZ85fR4OcALRkNpnRQnrYVTvpfanorrVDEpe/wFxVpTdqGBT4Z5Ed?=
 =?us-ascii?Q?at+CliV7ZqytLQ/i6h+1XJb2eiioKRbmt8AcAOw87c2/JAGimkeOyRKi0KcP?=
 =?us-ascii?Q?lwbmK/U6AjdFaWwdX+gPgxvoJiyEvrOIjbv1lx26rcBIr6mRD4YndHMzAk/i?=
 =?us-ascii?Q?/AEeXBzr076ROfXA5tjyAUZs4e5PYvWMkSrpKJr7HanQfEFpUbMJUmlCnChm?=
 =?us-ascii?Q?y6eqoy8JiQUw0Re8fLcRkwl152LSifPHewK5eIsWxZpHJZifuJ90tVlQrftp?=
 =?us-ascii?Q?bqnUqn0kVVVp1XLNmot0/9Xg5FrpUBGULe2Hzv416QIcG40/rRz0vZ9iw8Vv?=
 =?us-ascii?Q?9SVHJ2/n9cgEBkCq3Da+p71Gu6VSlBkFQX/oFa2gHoFDR8AZDNQK7DM3i6xB?=
 =?us-ascii?Q?m588fKegCmdgbp6dvDnp0hbv9JCoPUhY6uc3sx3sKmhB+JVTyE3ZYyI905kz?=
 =?us-ascii?Q?pWGAP6i89W6hTW12r8QgISlj8VOe4ywi5v+9ky/I1uE+S7rd7Wh+bazBhDOT?=
 =?us-ascii?Q?Kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69fda4a1-b9ea-439d-393c-08de04f1ca18
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 16:02:45.9332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3aa7ulsiaDaeWehPTySaSAcO0PmneZQ3KBMHgmeXi9k4wiaQEfdZhE9J3GQRU8eO4KJZzrGymevTJg9rK8C4dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7277
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

On Mon, Oct 06, 2025 at 04:51:52PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 10/6/2025 1:10 PM, Matthew Brost wrote:
> > The only case where the GuC submission backend cannot reason 100%
> > correctly is when a GuC context is registered during VF post-migration
> > recovery. In this scenario, it's possible that the GuC context register
> > H2G is processed, but the immediately following schedule-enable H2G gets
> > lost.
> 
> hmm, isn't that the other way around ?
> 
> We should know whether schedule-enable was processed or not, since we should receive corresponding DONE message (or not).
> But if it wasn't processed, then we do not know whether context registration was processed or not (as we look only at G2H).
> 
> and the schedule-enable H2G is not "lost" by GuC but rather it will be made void by our explicit CTB clearance

If isn't clear - we use the pending schedule enable state to determine
if context is registered - i.e., if a pending enable is outstanding we
assume the context didn't get registered as this is immediately sent
after registering the context. The race would be register completes but
the subsequent schedule enable didn't get processed. Let me see if I can
clear this up in the commit message.

Matt

> > 
> > A double register is harmless when using `GUC_HXG_TYPE_EVENT`, as GuC
> > simply drops the duplicate H2G. To keep things simple, use
> > `GUC_HXG_TYPE_EVENT` for all context registrations on VFs.
> > 
> > v5:
> >  - Check for xe_sriov_vf_migration_supported (Tomasz)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_ct.c | 33 +++++++++++++++++++++++++--------
> >  1 file changed, 25 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index 9f0090ae64a6..3ac654cebc79 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -32,6 +32,7 @@
> >  #include "xe_guc_tlb_inval.h"
> >  #include "xe_map.h"
> >  #include "xe_pm.h"
> > +#include "xe_sriov_vf.h"
> >  #include "xe_trace_guc.h"
> >  
> >  static void receive_g2h(struct xe_guc_ct *ct);
> > @@ -736,6 +737,26 @@ static u16 next_ct_seqno(struct xe_guc_ct *ct, bool is_g2h_fence)
> >  	return seqno;
> >  }
> >  
> > +#define MAKE_ACTION(type, __action)				\
> > +({								\
> > +	FIELD_PREP(GUC_HXG_MSG_0_TYPE, type) |			\
> > +	FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |			\
> > +		   GUC_HXG_EVENT_MSG_0_DATA0, __action);	\
> > +})
> > +
> > +static bool vf_action_can_safely_fail(struct xe_device *xe, u32 action)
> > +{
> > +	/*
> > +	 * If we are VF resuming, we can't exactly track if a context
> > +	 * registration has been completed in the GuC state machine, it is
> > +	 * harmless to resend as it will just fail silently if
> > +	 * GUC_HXG_TYPE_EVENT is used.
> > +	 */
> > +	return IS_SRIOV_VF(xe) && xe_sriov_vf_migration_supported(xe) &&
> > +		(action == XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC ||
> > +		 action == XE_GUC_ACTION_REGISTER_CONTEXT);
> > +}
> 
> not a big fan of this hack, but since it may work and speed our goal,
> with re-checked/reworded commit message,
> 
> 	Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> > +
> >  #define H2G_CT_HEADERS (GUC_CTB_HDR_LEN + 1) /* one DW CTB header and one DW HxG header */
> >  
> >  static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > @@ -807,18 +828,14 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >  		FIELD_PREP(GUC_CTB_MSG_0_NUM_DWORDS, len) |
> >  		FIELD_PREP(GUC_CTB_MSG_0_FENCE, ct_fence_value);
> >  	if (want_response) {
> > -		cmd[1] =
> > -			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> > -			FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
> > -				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
> > +		cmd[1] = MAKE_ACTION(GUC_HXG_TYPE_REQUEST, action[0]);
> > +	} else if (vf_action_can_safely_fail(xe, action[0])) {
> > +		cmd[1] = MAKE_ACTION(GUC_HXG_TYPE_EVENT, action[0]);
> >  	} else {
> >  		fast_req_track(ct, ct_fence_value,
> >  			       FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, action[0]));
> >  
> > -		cmd[1] =
> > -			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_FAST_REQUEST) |
> > -			FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
> > -				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
> > +		cmd[1] = MAKE_ACTION(GUC_HXG_TYPE_FAST_REQUEST, action[0]);
> >  	}
> >  
> >  	/* H2G header in cmd[1] replaces action[0] so: */
> 
