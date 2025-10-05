Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE0CCAC5BB
	for <intel-xe@archiver.kernel.org>; Sun,  5 Oct 2025 06:53:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C30A510E0A1;
	Sun,  5 Oct 2025 06:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z2nCaf/x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2B010E0A1
 for <intel-xe@lists.freedesktop.org>; Sun,  5 Oct 2025 06:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759647216; x=1791183216;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hO09sKaS9Hqt0aSWn0LCldGzGgjlAeVZwNBYxsVI8Bc=;
 b=Z2nCaf/x7KtYFPvdYtvPUxSNZxbYskMnf+eTRXf1EK/lB8B2D10rBsfS
 ZXo2i8n9OopjUUbN92eWwgsMfjdydAjNLmj4DcAmQ2YMp7W20kX4ccUNE
 A3NlHg0CRzLSkAZVX3GUDL7f73B8y8H2ep9RUWsxJsVcSau8RWHdrk3lq
 ivg9jirLFTpnnfqEpOOnlubaZtQocwZtFvXCuDA9NdUsvB/CdY6d22cxq
 Q7qPGjzrNEljigxfMqRRiMbdjaC+KEULs5f/SO4DNjd5KSH7p9rRf4FRc
 CtJP4hHO0z4oF2aHn02uMUG3KPkO97U4ASDn7nSc3Db4KXVTmJ8ZOGKfy Q==;
X-CSE-ConnectionGUID: t/wRjEoDTHCb9J5ObjUu4A==
X-CSE-MsgGUID: i5BiuOJCQVSetf16Y3+xhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11572"; a="72108777"
X-IronPort-AV: E=Sophos;i="6.18,317,1751266800"; d="scan'208";a="72108777"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2025 23:53:35 -0700
X-CSE-ConnectionGUID: FW+H5VGuRTujs7ZPK3+cYQ==
X-CSE-MsgGUID: 065XO5gpRfiKKqngmt1zxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,317,1751266800"; d="scan'208";a="183998901"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2025 23:53:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 4 Oct 2025 23:53:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 4 Oct 2025 23:53:34 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.10) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 4 Oct 2025 23:53:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l8bYVJt2oJXr1/wfUkwW9nCMRwpqAccH8kMyt/JopEVSCHvKE/KVuQSlCphiksuNBsE3NTd/JYOEWbCVCiSaNK5coetHwLYiF+YuvZIQCcMwqHR3p02ZJWfGb0A4jtZ0dF16OrVmp7ruKBFF8UXFhwjxrLO9tj8X1OxNJYjohPjaH66GRebiYNPLnsZxeAMNsq0XXTkB++hI92YqO7D1uX4tOkgDIi7hp0ib/po4CwkOft2Wep4RBQmVnX8Sdc2h8rlrQkZTU3uMiBh5lsJM7tgDx8kmHy5GhfFxpM97dJM7mZTy64FWqcEDh9PANKb/7/+16x1E1CL33lnkWxFtnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pi6zzAgem6EHVRLTSNDXCbBeiFwAk6evk+0L8MFB8ag=;
 b=bzQHB/BPFCLYeMSxDBYB8bOtCR0WZ4edXMvX09aVZ8V0D7RsaKMahoy7JSC5dGIqdHWj2bRsCqysvrsENErgbnVsYZhJDkiHhL4QeHKhFk+kUEe4P1jdWaAaj/W8XQqa0W0SbunjwkLpFJWuCwPLyvqHuNyE6CBiJEZwJCBTqvYJykyXsZzJYcSSqYZALngWJk9kfxDEq0kHvL/pGAAJwHRU7otzAuBX/6CF1JLw1T3G1IW2YnK39lYK/NQze+dmHP8t+kCKrR153mwkNvXH7vBKQP8V4Pu3z0632MpUhMEu43259o77QVw5kS57cKeQ3WXNC/UPBvzx/vhs8PMRPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7861.namprd11.prod.outlook.com (2603:10b6:208:3de::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.18; Sun, 5 Oct
 2025 06:53:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Sun, 5 Oct 2025
 06:53:23 +0000
Date: Sat, 4 Oct 2025 23:53:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 08/34] drm/xe: Don't change LRC ring head on job
 resubmission
Message-ID: <aOIV4E8WqXnGF4AU@lstrano-desk.jf.intel.com>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
 <20251002055402.1865880-9-matthew.brost@intel.com>
 <0f7ae66b-1272-4164-9b41-faac00f42f73@intel.com>
 <aOIBTgubs5rRHIvS@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aOIBTgubs5rRHIvS@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0258.namprd03.prod.outlook.com
 (2603:10b6:303:b4::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7861:EE_
X-MS-Office365-Filtering-Correlation-Id: 09b84591-2910-48f7-22d5-08de03dbe054
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YxDAyiPFyVRmsZyzDEa+57ei7XIZUrgOtYLUGTK3eYLTrfeoeWeK3X/dsa/i?=
 =?us-ascii?Q?9qQgkBaEYtqyzFuSa7xrJ8UxW3zWl3AoNGCZ1ndFOMhj0/WnWox6wr3fscuC?=
 =?us-ascii?Q?9lNyIo/xY6009kRuy4hsihKcrudxDPJu/0QC5RkiVyxl5dNN/OdNUCuAEsAj?=
 =?us-ascii?Q?E7SviyXmofCif94+v5UqAsR8bnMhu/qn+ReU65zBOqibXfoN2rDZxBvk1JGA?=
 =?us-ascii?Q?qRb7eOqqTYcPi8ODkLnurVY74N0CgD7XW+9bCjSqvMq8DpPpsd+CGM/1pc2l?=
 =?us-ascii?Q?32Yljzph5INC/64qTQj7OJeT4Eoafh/XTOvnFCBka0rxjAejuISgNYVO6N1n?=
 =?us-ascii?Q?Jft+EHg3gEespJ1QFIACmCyasidm2Omd2rz5f1OzJM4Cz9D5l6Jp1/wDERAp?=
 =?us-ascii?Q?1EjO7sYnJjKZbVUH5/KAcevCyLoP8oZpMzsX1gqR/BPN0UBnmY/DHp0uZ1P0?=
 =?us-ascii?Q?l+tX5fBKWO62G3KSU8EBO6NoumjQdvTyYnPRlQZtWFXaBy9ygpDjR8nHX9W+?=
 =?us-ascii?Q?NgBYDxWcNnh4bpdBYh441PcYdHwkEwK0pIHpbQIbDPgkeQ+nlNGmVS+QRHBV?=
 =?us-ascii?Q?IgtMpvODhF30P5kMLGDfN+okPbD20M/0ZYpUNWwuwcwH/bQRjmYpU1oiRC5i?=
 =?us-ascii?Q?ppIQWzhjADlMvn6KkszXklpOh8Fk0Uj3e5ZPvR7zig6gh4VwirMITzoNb7Fl?=
 =?us-ascii?Q?xM1U5K25gIxMVxc8r+deMnuwzlfk135NAb4yf9dAZhIMoslDGQIXegTnRkXe?=
 =?us-ascii?Q?w/PR8FVl8kq5G2tLtcIAL/0s3vYfmyOO4hpPyDZwr6eLfIYer4wmpBYnTwMz?=
 =?us-ascii?Q?sdMqTmx0xYQwRvh01s+T/XcncCFRiIMdEUakg8gyZVAG1wSRWHrc1bXVp3xs?=
 =?us-ascii?Q?TJQyFRAC00G+iOG3xLvikuRijl2kVpOff6cHy06IiGyWkDgJoxLf1EO/XMC5?=
 =?us-ascii?Q?WRVQl4lMnR0E4Xnix+TWj4wQZew+uZA7eVgVK7YYCuhoPapVkMrgyNkolQ2s?=
 =?us-ascii?Q?D6/kmzrzIRuL/Rksfy39jHzDQl50tw2nS/WBnIAOn+nAnmpDcOH36tkfY40Z?=
 =?us-ascii?Q?ZD5JADilw0sXCSpOPrPzgYqLM93OyCVJmix9lv1tOGFbG4/CX+bvnOvNf8XU?=
 =?us-ascii?Q?yzehXT6q6ViELaAE58jrKhL4InjD4Gi/c7v4Kfgarlb1ahhJ8diZ2qRoIlko?=
 =?us-ascii?Q?lblShghRTn2rMV1U/pEIFvip6wsKBspCcDivjdXYfxHybJcbpWKzBWyKc2UJ?=
 =?us-ascii?Q?rvb3+oFMESDRNqQQ/R21bKpUF6XUlToHzOvA1cRHUfYYu3UDQTeYdyh6FfFB?=
 =?us-ascii?Q?zAKZDoutVFZ6RJK4Q8RP5nZWI/VBjdUlRATtqLuuIxtmpScfQ4O8kEUULKqq?=
 =?us-ascii?Q?dPTgIH4vgO4LAv6wyXWJchuV0eSi9hfZ7J+r1mtlY+Ne4nMgnUWRuSsfEhqv?=
 =?us-ascii?Q?ucG2kiK2955a5dHoSJC2AjQDGkiHtfgX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p+6BOxPR+99gaK3PrYFQiGJ+c+x+/BLSBna46KkDi+UAcZaoOO+PqNvEyy6K?=
 =?us-ascii?Q?mxpwkQZob536uliTRNatci44dXmXDvQrdPdPgMjKj7bU/m2zxBgIkzPqVbLC?=
 =?us-ascii?Q?e+6FOi3PdbFySoCqjj4nR42MEcMM+Pg4Z0W3r3ttHbHZmXVFVZhqQXb5Jkt8?=
 =?us-ascii?Q?bvfFdJ6HD9ONZDoq9ZwVQ+yKgYlIO6jS2tWYW2KpoeuQqrVkoKdaWVEHfHLF?=
 =?us-ascii?Q?qIXmc4MnyXDSuWC+L8BRl/nttRbpY0nizRkidCwYARL8qFTxkctyE5S7Vg8G?=
 =?us-ascii?Q?n8/r79NbZ0rL8fv7/xaJ/Fb1OGJDujLqz88HvF38hAmdHBl94FUZxApbcc0l?=
 =?us-ascii?Q?5EayHfhQh7O8tQF9YMrb40V+R1BUOPlOlMmMSVAP8AYAP194yOsHiAT7PbpB?=
 =?us-ascii?Q?HORb1J4Ca0NUoICG6IMdUm4Yz5gb2Q017KpXYxKnEveU5K1OhdtC5u/BNyx/?=
 =?us-ascii?Q?ZicSiBaBltD+YLKxTtzkoLHbilef6jqwwl4HKgQMwGDaHcZ9z1/hOysZYz2i?=
 =?us-ascii?Q?E46So4uC5+kqQHSBt1AZbquZJvvgkNysMliBgdjbkbpCy/fk/BO7q0DFynVc?=
 =?us-ascii?Q?/qbXPpq8og/vm/qypVjXQwyWruHUM1ovOwL06SA+W0Fjbly0DVjE/ed0l7N1?=
 =?us-ascii?Q?3aM8Uc6BhzfwRgp87K9DTNj7TppJ5s2AmjZltkFdK80GtVAHEOWJnYw1gVCl?=
 =?us-ascii?Q?kxt7JZrnAQItFuwi05haW0bJewHwMEbDIr7Zmyo3ItIaAFpBOLwCU60u6aUn?=
 =?us-ascii?Q?O9DewsD39HrlbFeuQED1vKrCyaQL3KDZejwF26T8/AnqFjWAbTqoeb1tZGB4?=
 =?us-ascii?Q?dtzXnnYEwz98fgTW3WqL++7qdoYNm3pOTxtKvrUO7l/9pH1UEOf54xmlh3U6?=
 =?us-ascii?Q?kOJiTW8NfygZmZfnPF3mrJCcSbOH9r3AT2o6iFRRCmjDDPLnFTj+Yz2EmpN7?=
 =?us-ascii?Q?PsSREfZwz7x/e/qzsVVTieVlNHTSxnf9zW/GlgVaqmgXkq8ZoU8hlKQGQQw9?=
 =?us-ascii?Q?2SbM7i4w6TuC9ytfHZpb56lYNwspcQ2+YLrOFoHUynIdUKGLhtFEpP8yZuOg?=
 =?us-ascii?Q?KUaDXQiDD6kHn/hhvPMJUbFEA6qTy851aCixD6p76UEZcwG7PAVHzOS09grW?=
 =?us-ascii?Q?aGbRNAUpDx1DpNFmNJUSZoSg5/goTSbbNSTPrhbsBPxzz4NyxEEWnDtB53ph?=
 =?us-ascii?Q?GkEFEXm2haKku2fAoztzWBnY5JGjbrSNoqcxi8GFa4eEOncfd139/JQ0X5Un?=
 =?us-ascii?Q?DZF7ON8H07uhqfDpC5k9gdQtHvMzrZTtPkWwnBQ5DHYKxZ56OgPoylcBF3lk?=
 =?us-ascii?Q?9Ax3RtIUMb5idU6a09bpYYWh50BfRt2l98EcF2OI9HDrTCh8ZUFCfg2JMH0D?=
 =?us-ascii?Q?0wKu385MLd+OoioqcqKWZujEE83BWhcv+qU8SfiKwecb7Shd98hg75DXaimx?=
 =?us-ascii?Q?2HNCVDAWWhHiGch5lGvzpn5YOi1Kycl4IWD1jWSd41JGtmBHhYfb+p2G/EUq?=
 =?us-ascii?Q?JWMrSMpU81xbZrDsLAjV/JtUpjqz4EK7wkqjXxB9myrNsx8/WbFgUujE9pho?=
 =?us-ascii?Q?gItxQ8w3AX0bQpmvusqu4Pn2Rk2OBjuGBNrMS28o+YSMy1oD7vSclpGKmQKt?=
 =?us-ascii?Q?zA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09b84591-2910-48f7-22d5-08de03dbe054
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2025 06:53:23.1238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tsrE0g4C+ahxqUdeulOB7di79oTIJg1T/BT5XHiuxlh4lamO1ahhlxOFGhzIsBQdkesr4H2rh5O9PcM2OC7RDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7861
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

On Sat, Oct 04, 2025 at 10:25:34PM -0700, Matthew Brost wrote:
> On Thu, Oct 02, 2025 at 03:15:13PM +0100, Matthew Auld wrote:
> > On 02/10/2025 06:53, Matthew Brost wrote:
> > > Now that we save the job's head during submission, it's no longer
> > > necessary to adjust the LRC ring head during resubmission. Instead, a
> > > software-based adjustment of the tail will overwrite the old jobs in
> > > place. For some odd reason, adjusting the LRC ring head didn't work on
> > > parallel queues, which was causing issues in our CI.
> > > 
> > > v6:
> > >   - Also set LRC tail to head so queue is idle coming out of reset
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_guc_submit.c | 10 ++++++++--
> > >   1 file changed, 8 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index 3a534d93505f..70306f902ba5 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -2008,11 +2008,17 @@ static void guc_exec_queue_start(struct xe_exec_queue *q)
> > >   	struct xe_gpu_scheduler *sched = &q->guc->sched;
> > >   	if (!exec_queue_killed_or_banned_or_wedged(q)) {
> > > +		struct xe_sched_job *job = xe_sched_first_pending_job(sched);
> > >   		int i;
> > >   		trace_xe_exec_queue_resubmit(q);
> > > -		for (i = 0; i < q->width; ++i)
> > > -			xe_lrc_set_ring_head(q->lrc[i], q->lrc[i]->ring.tail);
> > > +		if (job) {
> > > +			for (i = 0; i < q->width; ++i) {
> > > +				q->lrc[i]->ring.tail = job->ptrs[i].head;
> > > +				xe_lrc_set_ring_tail(q->lrc[i],
> > > +						     xe_lrc_ring_head(q->lrc[i]));
> > 
> > IIRC the sched pending_list stuff can also give back pending jobs that have
> > completed on the hw, but are still kept pending until the final free_job()?
> > 
> > Suppose we have a pending_list like:
> > 
> > [pending/complete, pending/complete, actual pending kernel job that never
> > completed/ran]
> > 
> > IIUC the sw ring.tail will actually go backwards to the first pending
> > free/complete job head in the pending_list, with the hw tail being reset to
> > the current hw head here. But on the next submit the sw ring.tail is where
> > the commands are emitted to, and on the next update
> > of the hw tail it will be synced to the sw ring.tail? But if that happens
> > won't we get hw tail < hw head (since we used the head of an already
> > complete job for the sw tail), which will make the hw think there is a
> > massive ring wrap, so it will execute garbage until it wraps back around to
> > tail?
> > 
> 
> Let me tweak this flow to use the skip_emit / last_replay flow
> introduced later in series to avoid this issue.
> 

Actually this flow works just fine. The GuC state is completely lost
during this flow - the context is not even registered. By the time
contect is registered - the LRC head will be at the original postition
of the first pending job and LRC tail will be at the end of the first
job.

Matt 

> Matt 
> 
> > > +			}
> > > +		}
> > >   		xe_sched_resubmit_jobs(sched);
> > >   	}
> > 
