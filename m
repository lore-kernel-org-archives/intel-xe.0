Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30181CAC5B0
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 20:25:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F2310E2DC;
	Thu, 25 Sep 2025 20:25:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XfFKuPTW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980EE10E2DC
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 20:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758831926; x=1790367926;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AMi+fEk9eaJczLPf5LplySvwm9NHFxQNZ+TXnTWwpLg=;
 b=XfFKuPTWuQuywAB8iTbENvMvaVpOTWtfzkNBmd0uWxLeK/6hI2CDuLms
 pnvSoS66kjGkYvUmgCX5i9n9s/PabuoVuQdmT7DWaxX5hxMrch9Mp0E3z
 HOO/jsODeoZTDMgcVbKRu9H0pHbQxswOx8E7PP75iQ2Bkh2QK4M+BnaXJ
 7MAMrJwtrEAY7+snS33MJbU0+3ftyibf97/nV2ttcGsXblwfDekxRhr1k
 sJXpFoPoJBh9ePAkukF57/F5t7EzT9LOq0KjiOlk/EdfHPLaBaYYRuI6O
 3sbBhNStJ7Q/O0GG92zMYlkRuA691IXfKvHYq2kSJ9fGhf2KKFtRRe9Iv g==;
X-CSE-ConnectionGUID: /4SzOLfJRLWaoHQPeT13Jw==
X-CSE-MsgGUID: KUvVyBemSAGtoO4Bzd7Olg==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="71784899"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="71784899"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 13:25:19 -0700
X-CSE-ConnectionGUID: Qi54QdH0QW2fnd0sNdc4Cw==
X-CSE-MsgGUID: 1gslfotsS6O58yxz9qz9WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="177269267"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 13:25:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 13:25:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 25 Sep 2025 13:25:17 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.4) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 13:25:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eNvOmslVWmE0dVmQ2QJuJcJNyEMDJxdwUhG6JY50z7j1U+kBgOZBqTTKIeO6j8q2gFQ74hKjliZDJISEN/hcvQzsADmv28/vyucJXPeeSuYjf+1u5yrs3uaLaOkOUBvVfA1ydMHElImMOQCtLZYiJ4stqLPoYKQahXaLWlL3r1UqEFOG4DQdUo1MX5SpQWFreFghmyHSPVJE8g0u+zLUliuDP4mslOlSibEq7DESvLH6v1PI1I8nkHM4FLMSgWIN5KFnyB9345nq0XAgF9znJ6SUpevJysuo6OBNFV9lW73Ja8ImNdH+mD+ZOleYSvu+LtvGlLib2tXiojX22oodhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=klraUCE4tLADYNMcwDbWuSNtiCQ23Y5I/ByHcB4XCFE=;
 b=cPzkCOImOSoqSFqg7nUMqAzVh99Ur4xYHPlvJk1PWxiwpwGc7IOxXCx2UWXJW1UhhUBKDD3syBjF5P1xAchtFWNG1iaU/rkcavajtA8Pyzl7UNF9/n26zKJafgunY6OmoXvJ3JyiIF4BJD5nMF+yJHkqnSy31eXOGHw3+3QDrmeUBdUexZ5ZYh5nnT5p1ewFpHqlGlg/hdHkf8jG3FDj6R6YWeKp8XSqWQdATR9mzNAkUUoaWUsZZyajhTbbgZFT0JINMxRtcOe3ooyK9xiQ9HkLYgWAFASiRxQoFxen8p2JdINuSWp7dD4DkDxRab87Gudq1JDoFHsrXQZHU8worQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL3PR11MB6433.namprd11.prod.outlook.com (2603:10b6:208:3b9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 20:25:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Thu, 25 Sep 2025
 20:25:09 +0000
Date: Thu, 25 Sep 2025 13:25:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 09/34] drm/xe: Make LRC W/A scratch buffer usage
 consistent
Message-ID: <aNWlI7bOPDEeuFKx@lstrano-desk.jf.intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-10-matthew.brost@intel.com>
 <omdbtumxxnuo2uahn6szbe46s3lu5v3r3ogcundfuxenkupsbg@nmcvhza2bewr>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <omdbtumxxnuo2uahn6szbe46s3lu5v3r3ogcundfuxenkupsbg@nmcvhza2bewr>
X-ClientProxiedBy: MW4PR03CA0356.namprd03.prod.outlook.com
 (2603:10b6:303:dc::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL3PR11MB6433:EE_
X-MS-Office365-Filtering-Correlation-Id: 38ce379a-db1f-4b8c-6ea2-08ddfc719fbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SjMbP1lgQUkj4Y/JvQh+vnsh8qlTYx5npf54x/B3rkQJvuSVzS+rVUpEORau?=
 =?us-ascii?Q?+NavMMt5U2JvXUaW31GXuYIoSBZIkwVodYSKQEsbVFwqSdBUwZ1Tz7/GrYF/?=
 =?us-ascii?Q?oVAVdtVbZ/4TOsYgSanJlOIOxNH2STpX4vOxKKZ4W29R+jfFHur3TyCKc0I0?=
 =?us-ascii?Q?B0pca3CFm0c4A5io7/yHoSDnXVrWaroKVV6jj6tlz6rS+20lMJQCU3BLFhFJ?=
 =?us-ascii?Q?drx/N3x2ohnX5bh4WrAf8gait1EIk61GlaUTwKQTsePpGJb1+DIuW+qzhAUd?=
 =?us-ascii?Q?+qfpdeBE4QhUkYVKjCyRXdVZNebPDcay8kg6Ox+ahhyorwC+nrVe5sihk2o4?=
 =?us-ascii?Q?xusS/Z50iZGHGDE9NbTatCwbKVyLwvR5JTYTXgd4rOXpiqUjU9cYZn15mABd?=
 =?us-ascii?Q?8KZZavFxeH/y9YuNWZASdswvTn16Za188K3DnIpP2xJlh+wXBtDQQRQP7NyC?=
 =?us-ascii?Q?w2xhRdsSp91eBiz4Sc/8VcweuOHKF6Fz9O7MkeYNdJpqd8VDDfUPAKGymnQU?=
 =?us-ascii?Q?Ao3peybDug5jZbExbOwr6E5AcaQpPQVHMNhkuuufr0x4aJcKNMVqNKxfXOrO?=
 =?us-ascii?Q?vpGOqbXdmQ2ShnDcZdgXXVoCkV+I69cEFc+ZR5NYUwnWrT7Tb+qt3iVBAGVy?=
 =?us-ascii?Q?+5t26dqTZeOCZCw7Vvf5nOWGmGrxXBiS6UR+N8Sof2XazMz1FKv9mVjlDtSy?=
 =?us-ascii?Q?Xa/+5cyoqeB14OB/FRI2USWT5U1jCim6OCUbkIc66pATuG4ZvMD8kSg5BIcM?=
 =?us-ascii?Q?hA2z/OVN+9ZK9fz+Y/TOADmgz1ebZZxEnUJ0IUE8Twfgnplgw1v0OMsgXyD6?=
 =?us-ascii?Q?NvSWKjyWV4KLQTzJgKYMdFl0xsHYyuGTzlGzTAd8qmC32TAsUc/ahEcRzW5C?=
 =?us-ascii?Q?9Ted4s9IaGFXJcdzGiNns7Dc00h1Z2QH6nZKcyAfJpzsUkRYevkZ3NM/4u65?=
 =?us-ascii?Q?nz792atBIqBQ4eoOJzrfGaWi7dgyYsdoNZ4xqf+xAzP4K0Eu8kBCE3JY+cKa?=
 =?us-ascii?Q?ZwobI5Ow8D56zrsUZPBhtZhgdG7dGHQETKL0GRv+8/7rbN6TOlqWFDQoTGb4?=
 =?us-ascii?Q?VyBKYaGR3Q0/MfGQbfaJsMcM/P/q+wYqBXjQheyKMUOK5UtcvYEzkpZCTE54?=
 =?us-ascii?Q?5vyvpF9/+DVKxCyLHPzAW4HK8H7Z54qJruLY1mSER2bcW5wCfU4PrYwJ6sBG?=
 =?us-ascii?Q?EbpbB0/Jf7nxi1w4z1oWN6lOH7sOFSB1JqN76g9JJziVyBA+TNkAXZjCaqm4?=
 =?us-ascii?Q?TrSlNMTI6mjn4Xl6y5cSInSOqb9kpdDEa2U0vaVq8iVLZkoCiUpuhXSU7ZuV?=
 =?us-ascii?Q?TwQRUXk4AfWK1Bhial8+NpEFxr8N0tMc42DzMAgYFJ4a7XMykbOmlsMdbcoI?=
 =?us-ascii?Q?eJXYv4WxvJh6bI3G2FcEZZNR8NN5fCVze5Gr9xz9V/7rrSvXXO7geMLlRZUi?=
 =?us-ascii?Q?r12rY5PlGbQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?86mVHdgVUGTdcjaYHHQespR6JZEmjBkw61FiTAQ3IF4F7ASFQRI6RHchI/aB?=
 =?us-ascii?Q?LNg2D2r4MiimqUCaTY7OAXvbbmG1m3GmEWTbdBKSHhqoBpVw86HVyXZRDwPk?=
 =?us-ascii?Q?M4MlhKh2X8GE8/cCz1CUl6wTHk+sYBJFK4DFOrfLrWDYB9f6lHyACLpOXn26?=
 =?us-ascii?Q?pO4AzhJAf25gUCXLwL+lLf+Jbg7wxs7N3ud+xxwxwFf/Q3nlUP6toOEgW4R6?=
 =?us-ascii?Q?ddzM6C/7oTf/5gWEIeQEgakFHYOyx56hTxD74+TkHPE57OuVGKh+p5YshCCD?=
 =?us-ascii?Q?scD0hhhyRMN4c2gM+/J760D1IxY0k2oRQGNC9Q9/ViSxcDCqoTEgka4ZoJwt?=
 =?us-ascii?Q?uKPA21idh0elom7XOhIuffcLjGhX6mC2hl4SxWwsuw0LXQg1ipRuWgxakbL3?=
 =?us-ascii?Q?TGiXlnuefy/Avq+9paxmBMbWS+Cidui622WA8X6bA23CF8B3eqQFu0y1g713?=
 =?us-ascii?Q?8eRItRTBu8zFNvQ79ctEOMBc/+y380deaDX7dM9JLjQ8sCER19BJ5bwKw00H?=
 =?us-ascii?Q?SZFfrShzYVb41tOOwLoD5v5UdbCpVXgYjf7emN37Fp/PLxFb8jERus6NLmez?=
 =?us-ascii?Q?bXToEXnHvwody8650mruEDMIb31GAVtbXbM8Wf7W1yFeiT1JQ24JOvNG8+x9?=
 =?us-ascii?Q?W4bairJOtQLBqwd5kzkP4bTWxm600hE5ePWFuurWoNWKsMVGTjrttjU34Tyl?=
 =?us-ascii?Q?B8jjTBhE1pDktSEaz+rzdGuvpPAu8hdF9xODoPQ3czYIJl5VAIFRX2h17eh+?=
 =?us-ascii?Q?Zh249raejumG+DjGmJEXa12ZLt5r2lJsoLStFfslQi20eHI4M11V6RWkjb7W?=
 =?us-ascii?Q?6eWlWUm3jXaXp3rEtzgM0AAEHvx3B1+zRv3FIaCM9rzmjUQW5EmPMCsY3Jj/?=
 =?us-ascii?Q?a8UlD7zLMAWwpW36uO99WftTANSTwmUSu205mxGB1FhC7d+br0OO2d4ja63s?=
 =?us-ascii?Q?7YskkX5KynXi5d+tc71yB7b+0yB1xTtNjbrWaxUacl8M0Z07vEzMRwGwgRfo?=
 =?us-ascii?Q?zFD4pokyS1tJT6bFlBMP5POawp+NDiN4oten2vurpe8zfiGcqMy3HRMlp7Zg?=
 =?us-ascii?Q?I2ebtJP66Im6qbwlKQdKnpPnQ7flFoLVU08xxcWGfTlnm1MkgH5207LHiBPB?=
 =?us-ascii?Q?SRlc3pb59DEhhwEuBaMCOOM/v+Wa8ChjuMaoFl5c1SLwqQlU3/YOzjAWJa3C?=
 =?us-ascii?Q?Genfm2Rz9guSlyAatetziv/EtCYBiKArfeQYSgpZgw06pLaXOw3RMoGsjQVn?=
 =?us-ascii?Q?s/OBaPmYmoJUlegM4mcYcM5wk4GcxrCCyf2p6ifD1dbmCfy6gMqLjYNAMKEP?=
 =?us-ascii?Q?E3CHOyaHgY8civ77QatfCgJW+U32GBQ/jdcxYP6XdDkI0Ihg8vVCvB4h/H1R?=
 =?us-ascii?Q?z4v3grugUPjbk5F84M9+e/zS/a1Gw3zX7HsoZ5tx63wL6vP6Kz97G2Pt50bu?=
 =?us-ascii?Q?SR0nP9CHQ4L+roXIPLkHgpsju2HrINIJt4idy7iaTPvScgssWruKI/tbWatZ?=
 =?us-ascii?Q?U3GxI8CV+EXFLnd2g9zm1cRZEF4HAr6J6/M+XwWnACEglJMq4dw3T7Bp1KH+?=
 =?us-ascii?Q?AxZkkYPWE0JGP/BqKaz6epIs/tYaEmNvMDY4YR+THzA4k8O2kg9n5w8xomGf?=
 =?us-ascii?Q?qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ce379a-db1f-4b8c-6ea2-08ddfc719fbd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 20:25:09.9117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fJkqFwA85ieHGaA9Tr0+sfJmF+69R0U97KT8kvxXFy7xy/ZjQGtDerUC+Sxwe7lv21faJnKwD7nKNdiRPyj5Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6433
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

On Wed, Sep 24, 2025 at 01:01:15PM -0500, Lucas De Marchi wrote:
> On Tue, Sep 23, 2025 at 06:15:36PM -0700, Matthew Brost wrote:
> > The LRC W/A currently checks for LRC being iomem in some places, while
> > in others it checks if the scratch buffer is non-NULL. This
> > inconsistency causes issues with the VF post-migration recovery code,
> > which blindly passes in a scratch buffer.
> > 
> > This patch standardizes the check by consistently verifying whether the
> > LRC is iomem to determine if the scratch buffer should be used.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_lrc.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > index 47e9df775072..aed0a3155d1f 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > @@ -1248,7 +1248,7 @@ static int setup_bo(struct bo_setup_state *state)
> > 
> > static void finish_bo(struct bo_setup_state *state)
> > {
> > -	if (!state->buffer)
> > +	if (!state->lrc->bo->vmap.is_iomem)
> 
> Please add the fixes as the first patches and find the commits they
> are fixing so they can propagate to drm-xe-fixes. With that, for a

VF migration doesn't work at all upstream, so I don't believe this
warrents a fixes tag.

> palliative fix:
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Long-term thoughts below:
> 
> The fact that we exposed xe_lrc_setup_wa_bb_with_scratch() to users
> outside xe_lrc seems completely wrong to me... it explains why
> indirect_ctx was completely forgotten.
> 

Let me add in indirect_ctx fixup in my next rev for completeness.

> And the ENOMEM handling is in a completely different place than the
> allocation which makes this a code smell.

I have a fix for that, we will needs fixes tag for this one.

> 
> I think this change is a palliative that we could accept, but going
> forward I think it needs to be better handled: we shouldn't be
> recalculating it on every lrc init, it should rather be handled like the
> default_lrc and just copied in place. Then on migration what really
> needs to be fixed up is the ggtt address, i.e. only these calls:
> 
> 	xe_lrc_write_ctx_reg(lrc,
> 			     CTX_CS_INDIRECT_CTX,
> 			     (xe_bo_ggtt_addr(lrc->bo) + state.offset) |
> 			     /* Size in CLs. */
> 			     (state.written * sizeof(u32) / 64));
> 
> 	and
> 
> 	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
>                     xe_bo_ggtt_addr(lrc->bo) + state.offset + 1);
> 
> 
> without re-allocating and recalculating it over and over. I will take a
> look at doing this
> 

That is not a bad idea but also not huge deal with the way the code is
written as this isn't really a critical path anywhere it is called and
unlike default LRC which we need to save off for the GuC ADS / W/A
issued during driver load it is perfectly fine to regenerate on each LRC
init.

Matt

> Lucas De Marchi
> 
> > 		return;
> > 
> > 	xe_map_memcpy_to(gt_to_xe(state->lrc->gt), &state->lrc->bo->vmap,
> > -- 
> > 2.34.1
> > 
