Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89701C71135
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 07:32:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A1E810E031;
	Mon, 16 Jun 2025 07:32:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FpkyRkzZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C94810E031
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 07:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750059145; x=1781595145;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=szySAC6j+VfzYeRRX8TuyhLp/ksebwpuwQxdt6+ZlLw=;
 b=FpkyRkzZF1Cw888+zD+TPlB+LXUQ/Bk2nvn/ztAuBreKFLS098H0MEve
 V8N7IYOmQn1ZPBQCHb3qbODJD8MuEAZUebT9jsODDQBtisjp/+ukIBxxu
 IzlKZqM/mX30Eoic9GhCR+EYCYI/DxOCxpYjEOlfp0t/TI9ZcQ85XQCXE
 ZgbOVGxoaVnfYoF2R6Vfs8S6YsFJ9aaAIiS9NbzLmu4vHcIM6mMTzLSxH
 lYuQP2+YhtYeOo5c1wtF5s1GaRNtk2HwZt0uw+G0GAZX30V/Q/Fz5MMAF
 Qo716VdEkMkUzQ+hk56WU2af8iIsiyo8GygniRnOl+0oRn4iUj70h3me0 Q==;
X-CSE-ConnectionGUID: I1wqB2NcTBycjLXSPBy0eg==
X-CSE-MsgGUID: sPHx5knVSwO4O0FVX4cY2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52064060"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="52064060"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 00:32:24 -0700
X-CSE-ConnectionGUID: 5cz2VjeiQouGSmmJrKw8YQ==
X-CSE-MsgGUID: TJwaS8cDSgObSvum66lLfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="152225452"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 00:32:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 00:32:19 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 00:32:19 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.45)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 00:32:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mZ92OkiGgBVnsshYB726fJc5r4HSi1R5cRrorSOBad88on+WWPDFcEu8CAijPQUOMEkoTo1cwYhYFnJJUO6pbPOYnEgQA3KtkhIqjm2rFRRjIt62R7eQhdUIqkbxXGW88M000vvITvQizC6TB9dwKoz0gHPZjMi0RPbi9is4LG1RH3QBU4da/qWanibB8EnogF6+NEa1E03+sc1b0B0Ttb20yaFlah403X4ry80Efc+33l+wFiMfuH1YYka386gl7PWm0yg5FiyDgSexk2evQIY3BvJEhfEpEbgahTXxybkA+qzy/uti39CYTt8ZdLjhOexqIV4y0qmfqOvjd4/38A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rno+8vyGziqKtzm0KvI7jS0Vn+MRKBbGfDvyR2nIoaw=;
 b=eRaI2zjQkIfGgF642qO2Vh4T1ObaZrIUva7zhckXnYVh1h4WA+Y182iJzSU0nzupZfmqgLerRP7jhy2c/l8Ihf2DXmIbcDXlz0s6YTIH3PEroq7/3qq0Hi/yU64yobLQ4UI54nvpzQv9QcQySnEpDnYyBV5nl6EepkQU41Cc4vy+b7NDQ6S42ojM16/rOB/msXfODJCOF+eWjJFV86TmzwEC7KVxLioNb/iQ7q3RZmA5KoILIxyaKdaL1wTKxI2NKHiDerCN42KyJ8naBeBupgGl9DXMjR0VyomZUIdHoIiNbsqurrMF3Q5r1JX3pV6LVGn/TA8ZaVnhX6qK793crg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6539.namprd11.prod.outlook.com (2603:10b6:208:3a1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 07:32:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 07:32:17 +0000
Date: Mon, 16 Jun 2025 00:33:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3 2/2] drm/xe: Opportunistically skip TLB invalidaion on
 unbind
Message-ID: <aE/I4T51X7GYc7ZE@lstrano-desk.jf.intel.com>
References: <20250616063024.2059829-1-matthew.brost@intel.com>
 <20250616063024.2059829-3-matthew.brost@intel.com>
 <6c3ce96c-7817-482d-835d-3925b9b52111@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6c3ce96c-7817-482d-835d-3925b9b52111@intel.com>
X-ClientProxiedBy: MW4PR04CA0303.namprd04.prod.outlook.com
 (2603:10b6:303:82::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6539:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bf62971-9337-4bb2-0dda-08ddaca7ebcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NDqpwGwsBCTaZi9kvtzz+wOKXsKNLo5ClV+7Vy9B3AhKM8gEDY5T72eo3qNb?=
 =?us-ascii?Q?GdvVuSCPG/Snm4PvUUFIAaBcsy3nwlhauBhICmhm7OuRhQ45CgIIOoq4A06r?=
 =?us-ascii?Q?6xs2Vq1qV98P5/PM0yobRsurHNHe/PMg9N0VqQRnMYNoLpUCE0HWZ4E07Cgq?=
 =?us-ascii?Q?6fWBEIcdMxCPHd8KWqKYe1l4nDC9ryULQG2fZ19DZ0NtUVfYt/wob8Jef4PJ?=
 =?us-ascii?Q?EmaASVlRbp12/on7Eg9spG42qTINNw8btXAfzSfUxYIr8yBV6/xe0kxKToIE?=
 =?us-ascii?Q?nUq9lng5aS2iNbObya4LhVgFZK8ex74L2Ogwx+ZCNSQTS/jrVqJNhbov5MXE?=
 =?us-ascii?Q?3VQFblPktWF2Fpr+/VDfxRjlCC6opAyAT1clTVMifG6Ko5BVaLN/vsoRc7OJ?=
 =?us-ascii?Q?LRPTZkJZ7ufE+hGj4VHQCwuRDvoN+EO+/78KQYr5zYeo24q0ZXUeHGWNiS9c?=
 =?us-ascii?Q?6A0PBPNpnwrIOS+19SUaV8WLS4jpEFTouTDryQPVpFZF5XjJT1Lzhp0n8xGE?=
 =?us-ascii?Q?ySAqQ0svsVzvYsZ5ieNiHaEBySmHhwgvmEUA3fmYwM8q2mKnzglg6303Mrhl?=
 =?us-ascii?Q?RxsPa0lRC3DpEOS4g5PtOhsUpRwon9Dmo6OdpcgPeyK+9MgwMuhTabPfGIAQ?=
 =?us-ascii?Q?r1XQ0VMPfj9P7vc6fbofm6i3VDUzfi4gKfivuxpLdw9MWTDZSaAkjRXjg2Ev?=
 =?us-ascii?Q?qHyrndFQNL2Czje9eSDnOroTwFi3xh0sw+sGU1zxOfM3fJbt1SeuU+J39aft?=
 =?us-ascii?Q?8mx6UE1pPxnsSgUQcDxMOosTVspbHMFPwZgHawn8rNwU2t43b2FRc9crI2Un?=
 =?us-ascii?Q?mF3csX+1OBLcnDwhVu6ZBYQyxTTswK0m6ubhy5fazPpb3RPh3YDsfXDkwsMh?=
 =?us-ascii?Q?JEHDWLHL+IR5PaOvnG0bjOuxx4NrhdZjoOBoLfSyi95OegY0SEWQk0PTJTOL?=
 =?us-ascii?Q?ItcGSyui6qq3yEnFPSBqno5QBJwQJz7a/6zIzJAWiz2cuvr4jXXf+LQLx3ZM?=
 =?us-ascii?Q?mHcHPctxfn5iqnvS9O8O4YOoNjMTBSNMSm3gn9X2S8NPBtn7hXEOKGJhmd9i?=
 =?us-ascii?Q?RYcrWyHg5qWKdHsb21bmWb0gwM1rU8SXWIKz35ci0PVHAe9gzrFt36fHcrSY?=
 =?us-ascii?Q?nDLqTCr2qsKUusPah88tgb3fcjya7P8IDlyUNQVaolx+N1K5bmhy5vj1Th6q?=
 =?us-ascii?Q?5rL+N0wCVqSQt7BZJwUaxparKQ2d4UcQSZIySz0l55Mk8T0YJeyvpDvWIjM4?=
 =?us-ascii?Q?VawXInIv/xyhM7XiMOfu4v3mE8wfrsyypDgJdDRnaJ0IEwZQy45OUpIvFsrx?=
 =?us-ascii?Q?9ghGX4tNYlTa4Xry5T8JrHlMK8ocrsGx2qOgnlTL4kCmu1f9XxfJLk9uiY16?=
 =?us-ascii?Q?B2wKwwtrtB5dG/ynVxL/TWfRJNNgIGaQtDiiriNuey85+uDo5+uxqENgJvsw?=
 =?us-ascii?Q?0b2sP+g9rTw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?srW/4vPpiUJBJYouo760IWbeF43yD6LR7quudQLtFKZXpYJIUqVhwxJqnGKw?=
 =?us-ascii?Q?Syxa4gIhFA1+iMgEjq5XvqWGS3e5uHSwldqSmqP402sS6RRd5PiLyQSlzpD1?=
 =?us-ascii?Q?6jnZkoLQN5+oAUg59LPGj41oVKpEZmTulVJR+9T5M730dI5YjALJZ9y9sL81?=
 =?us-ascii?Q?UjlFzB964UMjInsNPLWmpAoceNx5zviywRcBnoeef7C3uMDS9DCWzXmwNGV6?=
 =?us-ascii?Q?f4xM3x7wsrNxpR/CclNaC5kqv2cqpGXlwIFiTvAR7tMnnPePuzeLxzTz5y2E?=
 =?us-ascii?Q?qClozam8cPdIay1id0iGdC3L0670iRXpJWSzUIfVftJ7wTba1/BwD52y9Qop?=
 =?us-ascii?Q?NLziMVTMGstXhin5acQGzg8XdsNkOrT2cyadsgr0aYqE26KJ83g/FCa8X/e1?=
 =?us-ascii?Q?Fyd3B3S22Re3R+VHj1cC985EFcc3WtVuHFzW8VzAMMALNgcwHsP0+aZ2S3UO?=
 =?us-ascii?Q?lQWWoh2WGyrtxw50CD3DrzSGHg/dRXdwZ9GpbWNgoo8j1GpqQ1Em5p/dwUre?=
 =?us-ascii?Q?1/KBvWxiFulbWqRCVZdQFoEecJb066oJfm3wewKPJknpr1lHuwqfQfH5p7HW?=
 =?us-ascii?Q?N+Mt/3YwvEz4YVk0XzYTDuVI8vsdwiFUvSwbhPn3nBVioo6ROtLb0GGwtgVu?=
 =?us-ascii?Q?L1ADp+8EHftADj3i8YgVVKnEDq8QPzWpUgVjhcIp5q49Pu3YgHCFuYhL+x5H?=
 =?us-ascii?Q?n6WsoHLlhQ6l4uuicw1B7Q6huvGt1WOoYj5jkhqNbGb2GaNAjNQOMoxslTJN?=
 =?us-ascii?Q?phcqNpkErmzFjAh10AX3kmMFc6u4PYROEtfcrucf1kLsDjQb8jpMosnNz0tT?=
 =?us-ascii?Q?K99/YhcrvKx/ZU/PQazhj06AijU4/trvwI48KcP+tJxQAvYM3o1svHKP/Y0W?=
 =?us-ascii?Q?uSfEs//jGoy0UVZfx6koiMqeetLKfTI0AuSi8QxiB84SOde1pgowFeTv14Lc?=
 =?us-ascii?Q?cURzCBUK2veiTkLHF/BwybOWiqOCSOY6oxpsghTc/b8zKVlbvuBdwSJPbHed?=
 =?us-ascii?Q?A/ANWQN2DxQuRT5tAhFeviER+Apk0eHyEsCrpBuli/A8D6nFgEM95UZv2Vek?=
 =?us-ascii?Q?CN5qavb3IdhafSA/ZctZdb7zL4BBu7WSSEpW2AJfamv26UheRIG7X84fyYHb?=
 =?us-ascii?Q?7PjWsAFN0VhvOfYDjj+Py81OsPFx7RhoOTvmgK53bDZur5LnwHrgZT71wgZ0?=
 =?us-ascii?Q?/V9lk7uH1q/olUMmeaqlRa7E3umhakNxUn8VPzxm2tdR5BppoGSQ31NVK6rl?=
 =?us-ascii?Q?yHG78ubPCt6G24EKnIgun1nkfavzI7dhqg7uN9TIPMt9K2GEs7QbaoXmiZb7?=
 =?us-ascii?Q?ZG4ix6jeYRFDW0N09NidvsIAP9oGKnayEGddjQqbACnpht3X4ZcQhRIVCERz?=
 =?us-ascii?Q?HXHGBLX515zU9j5RglHOmPwnmryFlCpGRZARQ0x+fpyZaNossqEvOjGijDn5?=
 =?us-ascii?Q?N/tXxqLmuDNiwCtp196znU1XUglkt8MsAHamtisidWNglngVUrkAZY7gxW+L?=
 =?us-ascii?Q?EMyj6Ol0VltoQL8Dkd1VO5w6DirH4zxIEO9BGCtXLijD9hdNZElKVt9KZ2Qo?=
 =?us-ascii?Q?xOVWx4ogSCPO0zFx5Y56cK3Wd/NbORxCHJpnoLUgxEQ2Sk+0qwSwxIqSHiO4?=
 =?us-ascii?Q?mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bf62971-9337-4bb2-0dda-08ddaca7ebcd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 07:32:17.3040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pkyn4oKbqJ75EnXQSkT0QhWsNcUj3K9ENoy1SO5wh0zCdWd8qKPcuLpU4npTxqI/Cy2zAdFl+EGUG+zVq/aUMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6539
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

On Mon, Jun 16, 2025 at 12:44:38PM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 16-06-2025 12:00, Matthew Brost wrote:
> > If a range or VMA is invalidated and scratch page is disabled, there
> > is no reason to issue a TLB invalidation on unbind, skip TLB
> > innvalidation is this condition is true. This is an opportunistic check
> > as it is done without the notifier lock, thus it possible for the range
> > to be invalidated after this check is performed.
> > 
> > This should improve performance of the SVM garbage collector, for
> > example, xe_exec_system_allocator --r many-stride-new-prefetch, went
> > ~20s to ~9.5s on a BMG.
> > 
> > v2:
> >   - Use helper for valid check (Thomas)
> > v3:
> >   - Avoid skipping TLB invalidation if PTEs are removed at a higher
> >     level than the range
> >   - Never skip TLB invalidations for VMA
> >   - Drop Himal's RB
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_pt.c | 31 ++++++++++++++++++++++++++++++-
> >   1 file changed, 30 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 9c30111e8786..b6df8995e8c1 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -1995,6 +1995,32 @@ static int unbind_op_prepare(struct xe_tile *tile,
> >   	return 0;
> >   }
> > +static bool
> > +xe_pt_op_check_range_skip_invalidation(struct xe_vm_pgtable_update_op *pt_op,
> > +				       struct xe_svm_range *range)
> > +{
> > +	struct xe_vm_pgtable_update *update = pt_op->entries;
> > +
> > +	XE_WARN_ON(!pt_op->num_entries);
> > +
> > +	/*
> > +	 * We can't skip the invalidation if we are removing PTEs that span more
> > +	 * than the range, do some checks to ensure we are removing PTEs that
> > +	 * are invalid.
> > +	 */
> > +
> > +	if (pt_op->num_entries > 1)
> > +		return false;
> > +
> > +	if (update->pt->level == 0)
> > +		return true;
> > +
> > +	if (update->pt->level == 1)
> > +		return xe_svm_range_size(range) >= SZ_2M;
> 
> >= or == ? Dont think ranges can be greater than 2 MiB.
> 

This is future-proofing. For example, if we add a SZ_8M entry because
profiling an application shows it helps, this code won't break. I also
assume we will never fault in 1G ranges, so there's no need for a
level-2 or 1G check.

Matt

> > +
> > +	return false;
> > +}
> > +
> >   static int unbind_range_prepare(struct xe_vm *vm,
> >   				struct xe_tile *tile,
> >   				struct xe_vm_pgtable_update_ops *pt_update_ops,
> > @@ -2023,7 +2049,10 @@ static int unbind_range_prepare(struct xe_vm *vm,
> >   					 range->base.itree.last + 1);
> >   	++pt_update_ops->current_op;
> >   	pt_update_ops->needs_svm_lock = true;
> > -	pt_update_ops->needs_invalidation = true;
> > +	pt_update_ops->needs_invalidation |= xe_vm_has_scratch(vm) ||
> > +		xe_vm_has_valid_gpu_mapping(tile, range->tile_present,
> > +					    range->tile_invalidated) ||
> > +		!xe_pt_op_check_range_skip_invalidation(pt_op, range);
> >   	xe_pt_commit_prepare_unbind(XE_INVALID_VMA, pt_op->entries,
> >   				    pt_op->num_entries);
> 
> 
