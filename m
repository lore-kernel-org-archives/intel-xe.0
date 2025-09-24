Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DA1CAC5AE
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 20:35:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F16A10E130;
	Wed, 24 Sep 2025 20:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DzgqMGZv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD57210E130
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 20:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758746154; x=1790282154;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=07DNdo8wZJ1wjtrN+gzjeQxThvO5RTIYdolKCJngZ8o=;
 b=DzgqMGZvpfOJ14HCIH6EHj6vim4iXq2BnHNEk0qUdLxUlGu6vO724hC7
 aOpHZYgD5HHGVQgFzUDDImRmFUEJ9hcO9C4qWLkQuCxsESpk7v7C+ldgb
 iS9M4E0wUOtcFSwbapgf2AHGJ3+EPA5/Kkpn94X8Fo+oKluVtP+fSxX49
 ma9T5i+DKPMoVlnW4nwfR/ufDViNNxPW99WbPIhpGS/hjOwBHQglqkC6b
 DUPCdNB/cjMa0UZQUaylDVGYD/fGtcToW8Hf0eSL4ezP6iX13cmFW6FIu
 wwuKihWVl5nVWImFUdbUsqT05wnhXmmlb7f+mqWvNQe8xanz9kAXNMEja w==;
X-CSE-ConnectionGUID: JPtSi1t3RRaVOieJtk0S4Q==
X-CSE-MsgGUID: CF36heT5Sw2aq5E6pu82oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="48619461"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="48619461"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 13:35:54 -0700
X-CSE-ConnectionGUID: 831ZmhudQSO8pp5adhA9Pw==
X-CSE-MsgGUID: bclfNYXETP+AyQe0gV8r8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="176973250"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 13:35:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 13:35:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 13:35:53 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 13:35:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hLLDvUBevfiJmcYZoi3S8Fe3fTMCZIv/GBjJC+fQQN9J8kNSh9nVgtwYnpDDxcAS2l0hCSCZ4slUA1C4n47cQB1mTtm5ipXRV60ai/OWlExP0n0vSWg1NpIVaE6H6fhZjQQQXk/Nv1KLvYo4gSEJZ+lMwH7PaAeX0dzvzgC6zZ9qBhGlaxbRGxXHpQamN9fVSmP238a/6SHbez6NktIAM58fUI2+otNutYBxwRTwLdypgYDp7P3A8thrGDn2NPq8bQYHH2DtC8JFCuPlbhVgS1x+jiyEQVNcD8b66C0PqryVf2T4+QF67LAMUUOXrjHv/5NBEzQOCAYm+VYiDTlyuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+itqFEk+dw3N+FG666s4MdHFrfZ+iVDXN7u+bc2f5ZA=;
 b=brbBKuwHPHFqoY5UUiW4BfuorL9KOBN3vrNbn3C+d2nCy5sAvVgnj4ywMeJetswMbwOMgJamWsxfFpt7+SgolosmTu6BqmFv3X1w64DXR6MGjeMpwp6SvNHSsdCCq8aDlCqdn11D3FfJadMKkzyp70r8XW85tAH19qwPeCNdRtjmMSUKoWqsSJsZM3Pw9VfQ9N0lM3YfgEBc9YpjX3z7xNiAHakXhlhqWuWOPsgHdoiAd/qQs/KDjntsWZUOixRFoC/2seh5RfQUobUfbV0hKfzlb7c6DHYvrUhxvpgTlrkW54x5vTtUbMEPs92Bk7wSeFCU1VubfiPUshcXkJQ3sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB6866.namprd11.prod.outlook.com (2603:10b6:930:5e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Wed, 24 Sep
 2025 20:35:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 20:35:48 +0000
Date: Wed, 24 Sep 2025 13:35:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 12/34] drm/xe/vf: Make VF recovery run on per-GT worker
Message-ID: <aNRWIi9MqEghc4gM@lstrano-desk.jf.intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-13-matthew.brost@intel.com>
 <55c5e870-6823-4fb3-80ab-0e6914d054d2@intel.com>
 <aNRLmmK5yqXa3xNb@lstrano-desk.jf.intel.com>
 <dab8b427-41eb-46b2-929d-436b3866b7b5@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <dab8b427-41eb-46b2-929d-436b3866b7b5@intel.com>
X-ClientProxiedBy: SJ0PR05CA0210.namprd05.prod.outlook.com
 (2603:10b6:a03:330::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB6866:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f5f8ee1-0edc-4575-b6aa-08ddfba9f218
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rUoWZmuh6gVj0aWFIjdcvCjFZFf5/9iqczpw8uYFXr8LL87rLA0eJCD4wynu?=
 =?us-ascii?Q?OSSyLnFhTGs+myjvm20g7xDOGVjQ2bh11o3oiz50akvJeyYF+D5jhZ0WAF5t?=
 =?us-ascii?Q?mRI1uCA9l1azw9I/WBurxR5doFk3QFdezXZAFLRMjY0YaiM7+mUSetNefpiS?=
 =?us-ascii?Q?HL6/cTWOQWzS9X4GOhGqLqiDLfER33QZhFXi6cW3NKkyaJbSUfglN0p+cuSE?=
 =?us-ascii?Q?Hh1J6Bw/Mh6ISY2ldP9TaJL4xN9zNs1gdwXaJiIOOk41zE1XWygr4okkOl+5?=
 =?us-ascii?Q?mT+3NSSZo8jF7LFRZE9oS54B45ieNnoHaCpjlVZeGKuYoH8XU4XzVtwh4EXH?=
 =?us-ascii?Q?83Yapf6RXzkz9zEjqr/g7K6AXH6wGOSiPfvgo5AHcQtg5rPO9WY0JI9sTBnD?=
 =?us-ascii?Q?wBAc6AzGNcnlI7oHZH8w45QEWQGuoPGEfcTXF/eIoelyV3kfWeZZ+Dkz1oFi?=
 =?us-ascii?Q?MOAbuZRt/+MCKv3G1NoQpjyajAC2AkAAySbGmmJ2sN4C3SpcADMD+35YI0EX?=
 =?us-ascii?Q?I0NqvUYoPXETstksVWZQMJv3ahxmMiNpryK/qflV1I7dmTmu9yUnDjDShAXI?=
 =?us-ascii?Q?nGd0L9xRN5e6VEcbrqtoTGxSsHvKDip12RmqKTYHHjaMswfaDINYoTKURw3V?=
 =?us-ascii?Q?/yYoqnfhWFQSDmtVCc6xvUWvH8bJBkPPoTQxJ5ehvn11fjq0VIQ1rcYVCznW?=
 =?us-ascii?Q?bqvPFDXopOM83Ln2UT07OoZvjj9plFLWybLo8f7zr7Z+ES11v3yDhBUECuBu?=
 =?us-ascii?Q?1bNSAZtGzMoHO5tp/CH4ApGm8UEn2B50yZKJE9W0H4O/hhJXTZNIM6l6qMSk?=
 =?us-ascii?Q?hOVYWtA1y9ptC0vZo18GD7yiePukIiwSPuov25OYWoqMqYDibjs/Uz3CwG8x?=
 =?us-ascii?Q?hZuZfA3RatozWRxzs1MhucS/enxye7M0ytjEJ8gvWSlh1wqYBe52OwI5Rg7g?=
 =?us-ascii?Q?pkS0WRF+++6LSI+yM5OGccdRWxdFFR3f97z7WOw6DaOOkcrbGbu23EV5/1Ix?=
 =?us-ascii?Q?ubVoPWqqGdL4hFSxya7YDArwNcWAD8hdsvAmF74Bsotr9hF5kWinUCvAQKX6?=
 =?us-ascii?Q?lDYXTJhvaNtU+gosjbt7PjwDi/gBYdc48MRx8uiodOzv+5zieQiXu5/0oNWb?=
 =?us-ascii?Q?Yqp29JkbAIsKW2O38yPK7K3k5pKwmssIB0Qze785c6ICVdsgn6CSPm8hm8sm?=
 =?us-ascii?Q?UDUxxRrapNWTKBnnO0NsqknSvVuEoameqh751iGrHsblwvra+DckZqgv60Uk?=
 =?us-ascii?Q?eTPfZ36xoqc+OiHOs8j2FCAs/DcYc0cCfjjG40DVnKRFfGKM86ayab86dCF3?=
 =?us-ascii?Q?1IKDg8bcdYOXgBPclxPm/+yFg6ph08ug1fvC/iiaqyxvxF45WtPUcBHY2FtT?=
 =?us-ascii?Q?+c1r+4Nuf00UMLReT0ZXcxmpwvJf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QdrFXltf6cvx44Zv+C5hqIBTj7+0aFcR1/1VyPaO2Wu7ksa326RL3n3+e++h?=
 =?us-ascii?Q?znSsyQ2qNgk67mF+VAX3Ia0pNmaIRyiH2HIaUnJ8TvemCfnqUsjlf8jDZXpG?=
 =?us-ascii?Q?6Dzf0n6YvPHz5c8x6Bv5eA2TwMFq8JbDI03+kOuT3RrU5bO8/vh3w/ui2WSx?=
 =?us-ascii?Q?FZieut6seaCn2egJE2NV6sNPNlskeQBnlqeVsVUKXTdnZLrXHwXfUyENqrB4?=
 =?us-ascii?Q?rtl+V1K+oC6fKWTMtLGb6R9KP7FnHPeZ2IqXkL8+0M4lNkcUTd6j4p+h8V7Z?=
 =?us-ascii?Q?lxHK9W+y0oVsHvcjx0fBye1gQC/7M6A7CDbs2V3Y9IrDYAnp0NeUePDqihN3?=
 =?us-ascii?Q?zD7ETj2d4/y5LLqwquq0U8vpj+dyHCtx0+9Ag4jncmSU3Te2Pc/95eTVPu+g?=
 =?us-ascii?Q?eloV7DXXuj2r6scmuryax3P4VtuZxT/EZIf3MRUQVoqNhtArAc9KPtj6SOhO?=
 =?us-ascii?Q?bQlPlQfws0mDoRbeFv3Wq0DHlooGt5c1BsqKcIVpo1TyKXvb1hHtSlCPAn8u?=
 =?us-ascii?Q?MZaYoU6XSt61sdu2NpqCofWEYsGPOkZxsTFBUkIQ+5oezuVe3mPzr5rcNzlc?=
 =?us-ascii?Q?l+X4vMg/9HwavZXonirfLWeq+zxPv1axYnsQ+UB8n578jduvG0z4vzGvJC/K?=
 =?us-ascii?Q?HCZySIhQXc5mVZlgwzrLkFmIMLjjM02lPAgwQBrmnTWDfUMsJCBXCijeQKbT?=
 =?us-ascii?Q?3JdriymwG/zc/vdICZqZBWHMhJxuGPs45OzAwuS85i6IjCchslhX6142ipRx?=
 =?us-ascii?Q?ZChsl3BAb47G7HXLM7QXpBfoafOs4DWT3/Z2f6ITgeQB0wUQoN98CpM0fBOL?=
 =?us-ascii?Q?OO1B4vhOTzE+AOCZ+kHrAfRm2zrgp5Te52xmoQJAazypuhR4E1JT3JKLb9Wa?=
 =?us-ascii?Q?WSN4wvgss9UHZAQx0IuoiVWikysfjb6m9wcVw6K1PJCXi0I+UnLbIi7xIIgs?=
 =?us-ascii?Q?8kQSvJLyIqH+Kbetc0ITngLoAZmRfSayyjLnlxM115kO3YKpseWsm0Eck+Gs?=
 =?us-ascii?Q?tiK8F1eJYX2X2li+EEDQDInqLniMQAK6Pv9RggQywvitlE1GejSfeMV+gPt6?=
 =?us-ascii?Q?qZz3B+M0uFb8NL1rU2+tFECEejAxLtjSLNghQVkoScFdO/OqQoI5ycm8pJZO?=
 =?us-ascii?Q?CnF00jLZ744gg2EgumL6HDV6BpB4RaniiS7y8W/sRh7vuxnVk8cNa7WlUAeD?=
 =?us-ascii?Q?23kBaIRl6KmcWs5qtY9G4XzdsaJ06jdmGMUCQxT8S+7nvf9sOlfZ027Jv1Me?=
 =?us-ascii?Q?XdRec2e72ZLpei1Th7B3zSK8Rt2LAb59HyWz2jeSkHAJrU8dP5PRReK2faM0?=
 =?us-ascii?Q?afNM+gvN+M5wkRb1Xodf27X11wBYvGQMZ4dy1BLmbz8HFpB9Mils7YjwKpFH?=
 =?us-ascii?Q?FCKc0ZZh7iPG8QIhlHdYBw66UhU+vxogFbkhydD6d2SoRMdZZ9BKZxPuyaXe?=
 =?us-ascii?Q?ln5b7PtfxMmZG007g4h/7GpnDGZOp1FmerV7hdKTxYB3ywBgpMby5lFxNZjX?=
 =?us-ascii?Q?UC4/bNwPd1sCXIdbnszNIE/InOzVcuSx9y9KIv98+F3LyKC/8DVWAet8rohf?=
 =?us-ascii?Q?F3hPiuzpH4I4q5mFqPfhOHBIr2rHHhuhCrhKs7W1TrAByqby2utajYrjrQLG?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f5f8ee1-0edc-4575-b6aa-08ddfba9f218
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 20:35:48.7830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3XnC6+CNbDtKKYnQiTLutdwcVhvACp2JhmqoZZHQKioY6lVEoOr/ObhqWyQKTBxOHHkkmPeK/01d//OUjbnIGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6866
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

On Wed, Sep 24, 2025 at 10:21:32PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 9/24/2025 9:50 PM, Matthew Brost wrote:
> > On Wed, Sep 24, 2025 at 12:49:25PM +0200, Michal Wajdeczko wrote:
> >>
> >>
> >> On 9/24/2025 3:15 AM, Matthew Brost wrote:
> >>> VF recovery is a per-GT operation, so it makes sense to isolate it to a
> >>
> >> that was also my suggestion to make it per-GT, good to see it happen now
> >>
> > 
> > +1
> > 
> >>> per-GT queue. Scheduling this operation on the same worker as the GT
> >>> reset and TDR not only aligns with this design but also helps avoid race
> >>> conditions, as those operations can also modify the queue state.
> >>
> >> but while the recovery is per-GT, we should still protect against that
> >> one GT starts the recovery sooner then other GTs notice about it
> >>
> > 
> > Yes. There is shared state in 2 places:
> > 
> >  - The GGTT shifting, this handled by [1] in my series.
> >  - CCS restore on iGPU (PTL) handled by [2] [3] in my series.
> > 
> > [1] https://patchwork.freedesktop.org/patch/676394/?series=154627&rev=2
> > [2] https://patchwork.freedesktop.org/patch/676393/?series=154627&rev=2
> > [3] https://patchwork.freedesktop.org/patch/676397/?series=154627&rev=2
> > 
> >>>
> >>> v2:
> >>>  - Fix lockdep splat (Adam)
> >>>  - Use xe_sriov_vf_migration_supported helper
> >>>
> >>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >>> ---
> >>>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 170 ++++++++++++++-
> >>>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |   3 +-
> >>>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |   7 +
> >>>  drivers/gpu/drm/xe/xe_sriov_vf.c          | 242 +---------------------
> >>>  drivers/gpu/drm/xe/xe_sriov_vf.h          |   1 -
> >>>  drivers/gpu/drm/xe/xe_sriov_vf_types.h    |   4 -
> >>>  6 files changed, 169 insertions(+), 258 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> >>> index c9d0e32e7a15..cfb71b749e52 100644
> >>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> >>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> >>> @@ -25,11 +25,15 @@
> >>>  #include "xe_guc.h"
> >>>  #include "xe_guc_hxg_helpers.h"
> >>>  #include "xe_guc_relay.h"
> >>> +#include "xe_guc_submit.h"
> >>> +#include "xe_irq.h"
> >>>  #include "xe_lrc.h"
> >>>  #include "xe_memirq.h"
> >>>  #include "xe_mmio.h"
> >>> +#include "xe_pm.h"
> >>>  #include "xe_sriov.h"
> >>>  #include "xe_sriov_vf.h"
> >>> +#include "xe_tile_sriov_vf.h"
> >>>  #include "xe_uc_fw.h"
> >>>  #include "xe_wopcm.h"
> >>>  
> >>> @@ -314,7 +318,7 @@ static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
> >>>   * Returns: 0 if the operation completed successfully, or a negative error
> >>>   * code otherwise.
> >>>   */
> >>> -int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt)
> >>> +static int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt)
> >>>  {
> >>>  	struct xe_guc *guc = &gt->uc.guc;
> >>>  	int err;
> >>> @@ -808,7 +812,7 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt)
> >>>   * xe_gt_sriov_vf_default_lrcs_hwsp_rebase - Update GGTT references in HWSP of default LRCs.
> >>>   * @gt: the &xe_gt struct instance
> >>>   */
> >>> -void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt)
> >>> +static void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt)
> >>>  {
> >>>  	struct xe_hw_engine *hwe;
> >>>  	enum xe_hw_engine_id id;
> >>> @@ -817,6 +821,26 @@ void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt)
> >>>  		xe_default_lrc_update_memirq_regs_with_address(hwe);
> >>>  }
> >>>  
> >>> +static void xe_gt_sriov_vf_start_migration_recovery(struct xe_gt *gt)
> >>
> >> nit: if this is static then could be just:
> >>
> >> 	vf_start_migration_recovery(gt)
> >>
> > 
> > Sure.
> > 
> >>> +{
> >>> +	bool started;
> >>> +
> >>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >>> +
> >>> +	spin_lock(&gt->sriov.vf.migration.lock);
> >>> +
> >>> +	if (!gt->sriov.vf.migration.recovery_queued) {
> >>> +		gt->sriov.vf.migration.recovery_queued = true;
> >>> +		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
> >>> +
> >>> +		started = queue_work(gt->ordered_wq, &gt->sriov.vf.migration.worker);
> >>> +		xe_gt_sriov_info(gt, "VF migration recovery %s\n", started ?
> >>> +				 "scheduled" : "already in progress");
> >>
> >> with this .recovery_queued flag, can we hit "already in progress" case?
> >>
> > 
> > This was existing code so kept it but I'm really unclear how we can get
> 
> I can't find "recovery_queued" flag in upstream code
> 

This is akin to comment in upstream code. Again, I'm not really
convienced this is something we need to handle as I suspect this is not
possible.

/* skip asking GuC for RESFIX exit if new recovery request arrived */

> > multiple resfix IRQs without the prior resfix flow being completed.
> > Maybe Tomasz can clear this one up? Ideally I'd like to remove multiple
> > resfix IRQ handled code if this is not possible.
> > 
> >>> +	}
> >>> +
> >>> +	spin_unlock(&gt->sriov.vf.migration.lock);
> >>> +}
> >>> +
> >>>  /**
> >>>   * xe_gt_sriov_vf_migrated_event_handler - Start a VF migration recovery,
> >>>   *   or just mark that a GuC is ready for it.
> >>> @@ -831,15 +855,8 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)
> >>>  	xe_gt_assert(gt, IS_SRIOV_VF(xe));
> >>>  	xe_gt_assert(gt, xe_gt_sriov_vf_recovery_inprogress(gt));
> >>>  
> >>> -	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
> >>> -	/*
> >>> -	 * We need to be certain that if all flags were set, at least one
> >>> -	 * thread will notice that and schedule the recovery.
> >>> -	 */
> >>> -	smp_mb__after_atomic();
> >>> -
> >>>  	xe_gt_sriov_info(gt, "ready for recovery after migration\n");
> >>> -	xe_sriov_vf_start_migration_recovery(xe);
> >>> +	xe_gt_sriov_vf_start_migration_recovery(gt);
> >>>  }
> >>>  
> >>>  static bool vf_is_negotiated(struct xe_gt *gt, u16 major, u16 minor)
> >>> @@ -1175,6 +1192,139 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
> >>>  		   pf_version->major, pf_version->minor);
> >>>  }
> >>>  
> >>> +static void vf_post_migration_shutdown(struct xe_gt *gt)
> >>> +{
> >>> +	int ret = 0;
> >>> +
> >>> +	spin_lock_irq(&gt->sriov.vf.migration.lock);
> >>> +	gt->sriov.vf.migration.recovery_queued = false;
> >>> +	spin_unlock_irq(&gt->sriov.vf.migration.lock);
> >>> +
> >>> +	xe_guc_submit_pause(&gt->uc.guc);
> >>> +	ret |= xe_guc_submit_reset_block(&gt->uc.guc);
> >>
> >> this |= seem unneeded
> >>
> > 
> > This is existing code copy / pasted and is removed in [4].
> > 
> > [4] https://patchwork.freedesktop.org/patch/676382/?series=154627&rev=2
> > 
> >>> +
> >>> +	if (ret)
> >>> +		xe_gt_sriov_info(gt, "migration recovery encountered ongoing reset\n");
> >>
> >> is this the only possible reason? maybe worth to add %pe ?
> >>
> > 
> > Again this existing code and will be removed in [4].
> > 
> > So with above statements, I'd prefer just to leave as is.
> > 
> >>> +}
> >>> +
> >>> +static size_t post_migration_scratch_size(struct xe_device *xe)
> >>> +{
> >>> +	return max(xe_lrc_reg_size(xe), LRC_WA_BB_SIZE);
> >>> +}
> >>> +
> >>> +static int vf_post_migration_fixups(struct xe_gt *gt)
> >>> +{
> >>> +	s64 shift;
> >>> +	void *buf;
> >>> +	int err;
> >>> +
> >>> +	buf = kmalloc(post_migration_scratch_size(gt_to_xe(gt)), GFP_ATOMIC);
> >>> +	if (!buf)
> >>> +		return -ENOMEM;
> >>> +
> >>> +	err = xe_gt_sriov_vf_query_config(gt);
> >>> +	if (err)
> >>> +		goto out;
> >>> +
> >>> +	shift = xe_gt_sriov_vf_ggtt_shift(gt);
> >>> +	if (shift) {
> >>> +		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
> >>> +		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
> >>> +		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
> >>> +		if (err)
> >>> +			goto out;
> >>> +	}
> >>> +
> >>> +out:
> >>> +	kfree(buf);
> >>> +	return err;
> >>> +}
> >>> +
> >>> +static void vf_post_migration_kickstart(struct xe_gt *gt)
> >>> +{
> >>> +	/*
> >>> +	 * Make sure interrupts on the new HW are properly set. The GuC IRQ
> >>> +	 * must be working at this point, since the recovery did started,
> >>> +	 * but the rest was not enabled using the procedure from spec.
> >>> +	 */
> >>> +	xe_irq_resume(gt_to_xe(gt));
> >>> +
> >>> +	xe_guc_submit_reset_unblock(&gt->uc.guc);
> >>> +	xe_guc_submit_unpause(&gt->uc.guc);
> >>> +}
> >>> +
> >>> +static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
> >>> +{
> >>> +	bool skip_resfix = false;
> >>> +
> >>> +	spin_lock_irq(&gt->sriov.vf.migration.lock);
> >>> +	if (gt->sriov.vf.migration.recovery_queued) {
> >>> +		skip_resfix = true;
> >>> +		xe_gt_sriov_dbg(gt, "another recovery imminent, skipped some notifications\n");
> >>> +	} else {
> >>> +		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, false);
> >>> +	}
> >>> +	spin_unlock_irq(&gt->sriov.vf.migration.lock);
> >>> +
> >>> +	return skip_resfix ? -EAGAIN : xe_gt_sriov_vf_notify_resfix_done(gt);
> >>
> >> nit: this looks cleaner:
> >>
> >> 	if (skip_resfix)
> >> 		return -EAGAIN;
> >>
> >> 	return xe_gt_sriov_vf_notify_resfix_done(gt);
> >>
> > 
> > Sure.
> > 
> >>> +}
> >>> +
> >>> +static void vf_post_migration_recovery(struct xe_gt *gt)
> >>> +{
> >>> +	struct xe_device *xe = gt_to_xe(gt);
> >>> +	int err;
> >>> +
> >>> +	xe_gt_sriov_dbg(gt, "migration recovery in progress\n");
> >>> +
> >>> +	xe_pm_runtime_get(xe);
> >>> +	vf_post_migration_shutdown(gt);
> >>> +
> >>> +	if (!xe_sriov_vf_migration_supported(xe)) {
> >>> +		xe_gt_sriov_err(gt, "migration is not supported\n");
> >>> +		err = -ENOTRECOVERABLE;
> >>> +		goto fail;
> >>> +	}
> >>> +
> >>> +	err = vf_post_migration_fixups(gt);
> >>> +	if (err)
> >>> +		goto fail;
> >>> +
> >>> +	vf_post_migration_kickstart(gt);
> >>> +	err = vf_post_migration_notify_resfix_done(gt);
> >>> +	if (err && err != -EAGAIN)
> >>> +		goto fail;
> >>> +
> >>> +	xe_pm_runtime_put(xe);
> >>> +	xe_gt_sriov_notice(gt, "migration recovery ended\n");
> >>> +	return;
> >>> +fail:
> >>> +	xe_pm_runtime_put(xe);
> >>> +	xe_gt_sriov_err(gt, "migration recovery failed (%pe)\n", ERR_PTR(err));
> >>> +	xe_device_declare_wedged(xe);
> >>> +}
> >>> +
> >>> +static void migration_worker_func(struct work_struct *w)
> >>> +{
> >>> +	struct xe_gt *gt = container_of(w, struct xe_gt,
> >>> +					sriov.vf.migration.worker);
> >>> +
> >>> +	vf_post_migration_recovery(gt);
> >>> +}
> >>> +
> >>> +/**
> >>> + * xe_gt_sriov_vf_migration_init_early() - VF post migration init early
> >>> + * @gt: the &xe_gt
> >>> + */
> >>> +void xe_gt_sriov_vf_migration_init_early(struct xe_gt *gt)
> >>> +{
> >>> +	init_rwsem(&gt->sriov.vf.self_config.lock);
> >>> +	spin_lock_init(&gt->sriov.vf.migration.lock);
> >>> +	INIT_WORK(&gt->sriov.vf.migration.worker, migration_worker_func);
> >>> +
> >>> +	if (!xe_sriov_vf_migration_supported(gt_to_xe(gt)))
> >>> +		xe_gt_sriov_info(gt, "migration not supported by this module version\n");
> >>
> >> we likely don't want to repeat that message on every GT
> >>
> > 
> > So move this to xe_sriov_vf_init_early?
> 
> hmm, maybe it is even already there
> 

Let me check on that. Either way will remove this from the GT layer.

> > 
> >>> +}
> >>> +
> >>>  /**
> >>>   * xe_gt_sriov_vf_recovery_inprogress() - VF post migration recovery in progress
> >>>   * @gt: the &xe_gt
> >>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> >>> index bb5f8eace19b..2ac6775b52f0 100644
> >>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> >>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> >>> @@ -21,10 +21,9 @@ void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
> >>>  int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
> >>>  int xe_gt_sriov_vf_connect(struct xe_gt *gt);
> >>>  int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
> >>> -void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt);
> >>> -int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
> >>>  void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
> >>>  
> >>> +void xe_gt_sriov_vf_migration_init_early(struct xe_gt *gt);
> >>>  bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt);
> >>>  
> >>>  u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
> >>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> >>> index 7b10b8e1e10e..53680a2f188a 100644
> >>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> >>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> >>> @@ -8,6 +8,7 @@
> >>>  
> >>>  #include <linux/rwsem.h>
> >>>  #include <linux/types.h>
> >>> +#include <linux/workqueue.h>
> >>>  #include "xe_uc_fw_types.h"
> >>>  
> >>>  /**
> >>> @@ -53,6 +54,12 @@ struct xe_gt_sriov_vf_runtime {
> >>>   * xe_gt_sriov_vf_migration - VF migration data.
> >>>   */
> >>>  struct xe_gt_sriov_vf_migration {
> >>> +	/** @migration: VF migration recovery worker */
> >>> +	struct work_struct worker;
> >>> +	/** @lock: Protects recovery_queued */
> >>> +	spinlock_t lock;
> >>> +	/** @recovery_queued: VF post migration recovery in queued */
> >>> +	bool recovery_queued;
> >>>  	/** @recovery_inprogress: VF post migration recovery in progress */
> >>>  	bool recovery_inprogress;
> >>>  };
> >>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> >>> index da064a1e7419..7d91553c4acc 100644
> >>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> >>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> >>> @@ -6,21 +6,12 @@
> >>>  #include <drm/drm_debugfs.h>
> >>>  #include <drm/drm_managed.h>
> >>>  
> >>> -#include "xe_assert.h"
> >>> -#include "xe_device.h"
> >>>  #include "xe_gt.h"
> >>> -#include "xe_gt_sriov_printk.h"
> >>>  #include "xe_gt_sriov_vf.h"
> >>>  #include "xe_guc.h"
> >>> -#include "xe_guc_submit.h"
> >>> -#include "xe_irq.h"
> >>> -#include "xe_lrc.h"
> >>> -#include "xe_pm.h"
> >>> -#include "xe_sriov.h"
> >>>  #include "xe_sriov_printk.h"
> >>>  #include "xe_sriov_vf.h"
> >>>  #include "xe_sriov_vf_ccs.h"
> >>> -#include "xe_tile_sriov_vf.h"
> >>>  
> >>>  /**
> >>>   * DOC: VF restore procedure in PF KMD and VF KMD
> >>> @@ -158,8 +149,6 @@ static void vf_disable_migration(struct xe_device *xe, const char *fmt, ...)
> >>>  	xe->sriov.vf.migration.enabled = false;
> >>>  }
> >>>  
> >>> -static void migration_worker_func(struct work_struct *w);
> >>> -
> >>>  static void vf_migration_init_early(struct xe_device *xe)
> >>>  {
> >>>  	/*
> >>> @@ -184,8 +173,6 @@ static void vf_migration_init_early(struct xe_device *xe)
> >>>  						    guc_version.major, guc_version.minor);
> >>>  	}
> >>>  
> >>> -	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
> >>> -
> >>>  	xe->sriov.vf.migration.enabled = true;
> >>>  	xe_sriov_dbg(xe, "migration support enabled\n");
> >>>  }
> >>> @@ -200,238 +187,11 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
> >>>  	unsigned int id;
> >>>  
> >>>  	for_each_gt(gt, xe, id)
> >>> -		init_rwsem(&gt->sriov.vf.self_config.lock);
> >>> +		xe_gt_sriov_vf_migration_init_early(gt);
> >>
> >> still, this should be called from gt_init_early kind of functions
> >>
> > 
> > Kinda a nit that I'm not convinced is worth while to have
> > xe_sriov_vf_init_early and then xe_gt_sriov_vf_migration_init_early
> > called in gt_init_early...
> 
> we have global xe level initialization, something like:
> 
> 	xe_device_init_early
> 		xe_sriov_vf_init_early
> 	xe_device_init
> 		xe_sriov_vf_init
> 
> then per-gt initialization, that follows the native flow, something like
> 
> 	xe_gt_init_early
> 		xe_gt_sriov_vf_init_early
> 			xe_gt_sriov_vf_migration_init_early
> 	xe_gt_init
> 		xe_gt_sriov_vf_init
> 			xe_gt_sriov_vf_migration_init
> 
> IMO we shouldn't jump in sriov code from xe level to gt level init on our own
> 

Ok, let me refactor this. Easy enough to do.

Matt

> > 
> > Matt
> > 
> >>>  
> >>>  	vf_migration_init_early(xe);
> >>>  }
> >>>  
> >>> -/**
> >>> - * vf_post_migration_shutdown - Stop the driver activities after VF migration.
> >>> - * @xe: the &xe_device struct instance
> >>> - *
> >>> - * After this VM is migrated and assigned to a new VF, it is running on a new
> >>> - * hardware, and therefore many hardware-dependent states and related structures
> >>> - * require fixups. Without fixups, the hardware cannot do any work, and therefore
> >>> - * all GPU pipelines are stalled.
> >>> - * Stop some of kernel activities to make the fixup process faster.
> >>> - */
> >>> -static void vf_post_migration_shutdown(struct xe_device *xe)
> >>> -{
> >>> -	struct xe_gt *gt;
> >>> -	unsigned int id;
> >>> -	int ret = 0;
> >>> -
> >>> -	for_each_gt(gt, xe, id) {
> >>> -		xe_guc_submit_pause(&gt->uc.guc);
> >>> -		ret |= xe_guc_submit_reset_block(&gt->uc.guc);
> >>> -	}
> >>> -
> >>> -	if (ret)
> >>> -		drm_info(&xe->drm, "migration recovery encountered ongoing reset\n");
> >>> -}
> >>> -
> >>> -/**
> >>> - * vf_post_migration_kickstart - Re-start the driver activities under new hardware.
> >>> - * @xe: the &xe_device struct instance
> >>> - *
> >>> - * After we have finished with all post-migration fixups, restart the driver
> >>> - * activities to continue feeding the GPU with workloads.
> >>> - */
> >>> -static void vf_post_migration_kickstart(struct xe_device *xe)
> >>> -{
> >>> -	struct xe_gt *gt;
> >>> -	unsigned int id;
> >>> -
> >>> -	/*
> >>> -	 * Make sure interrupts on the new HW are properly set. The GuC IRQ
> >>> -	 * must be working at this point, since the recovery did started,
> >>> -	 * but the rest was not enabled using the procedure from spec.
> >>> -	 */
> >>> -	xe_irq_resume(xe);
> >>> -
> >>> -	for_each_gt(gt, xe, id) {
> >>> -		xe_guc_submit_reset_unblock(&gt->uc.guc);
> >>> -		xe_guc_submit_unpause(&gt->uc.guc);
> >>> -	}
> >>> -}
> >>> -
> >>> -static bool gt_vf_post_migration_needed(struct xe_gt *gt)
> >>> -{
> >>> -	return test_bit(gt->info.id, &gt_to_xe(gt)->sriov.vf.migration.gt_flags);
> >>> -}
> >>> -
> >>> -/*
> >>> - * Notify GuCs marked in flags about resource fixups apply finished.
> >>> - * @xe: the &xe_device struct instance
> >>> - * @gt_flags: flags marking to which GTs the notification shall be sent
> >>> - */
> >>> -static int vf_post_migration_notify_resfix_done(struct xe_device *xe, unsigned long gt_flags)
> >>> -{
> >>> -	struct xe_gt *gt;
> >>> -	unsigned int id;
> >>> -	int err = 0;
> >>> -
> >>> -	for_each_gt(gt, xe, id) {
> >>> -		if (!test_bit(id, &gt_flags))
> >>> -			continue;
> >>> -		/* skip asking GuC for RESFIX exit if new recovery request arrived */
> >>> -		if (gt_vf_post_migration_needed(gt))
> >>> -			continue;
> >>> -		err = xe_gt_sriov_vf_notify_resfix_done(gt);
> >>> -		if (err)
> >>> -			break;
> >>> -		clear_bit(id, &gt_flags);
> >>> -	}
> >>> -
> >>> -	if (gt_flags && !err)
> >>> -		drm_dbg(&xe->drm, "another recovery imminent, skipped some notifications\n");
> >>> -	return err;
> >>> -}
> >>> -
> >>> -static int vf_get_next_migrated_gt_id(struct xe_device *xe)
> >>> -{
> >>> -	struct xe_gt *gt;
> >>> -	unsigned int id;
> >>> -
> >>> -	for_each_gt(gt, xe, id) {
> >>> -		if (test_and_clear_bit(id, &xe->sriov.vf.migration.gt_flags))
> >>> -			return id;
> >>> -	}
> >>> -	return -1;
> >>> -}
> >>> -
> >>> -static size_t post_migration_scratch_size(struct xe_device *xe)
> >>> -{
> >>> -	return max(xe_lrc_reg_size(xe), LRC_WA_BB_SIZE);
> >>> -}
> >>> -
> >>> -/**
> >>> - * Perform post-migration fixups on a single GT.
> >>> - *
> >>> - * After migration, GuC needs to be re-queried for VF configuration to check
> >>> - * if it matches previous provisioning. Most of VF provisioning shall be the
> >>> - * same, except GGTT range, since GGTT is not virtualized per-VF. If GGTT
> >>> - * range has changed, we have to perform fixups - shift all GGTT references
> >>> - * used anywhere within the driver. After the fixups in this function succeed,
> >>> - * it is allowed to ask the GuC bound to this GT to continue normal operation.
> >>> - *
> >>> - * Returns: 0 if the operation completed successfully, or a negative error
> >>> - * code otherwise.
> >>> - */
> >>> -static int gt_vf_post_migration_fixups(struct xe_gt *gt)
> >>> -{
> >>> -	s64 shift;
> >>> -	void *buf;
> >>> -	int err;
> >>> -
> >>> -	buf = kmalloc(post_migration_scratch_size(gt_to_xe(gt)), GFP_KERNEL);
> >>> -	if (!buf)
> >>> -		return -ENOMEM;
> >>> -
> >>> -	err = xe_gt_sriov_vf_query_config(gt);
> >>> -	if (err)
> >>> -		goto out;
> >>> -
> >>> -	shift = xe_gt_sriov_vf_ggtt_shift(gt);
> >>> -	if (shift) {
> >>> -		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
> >>> -		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
> >>> -		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
> >>> -		if (err)
> >>> -			goto out;
> >>> -	}
> >>> -
> >>> -out:
> >>> -	kfree(buf);
> >>> -	return err;
> >>> -}
> >>> -
> >>> -static void vf_post_migration_recovery(struct xe_device *xe)
> >>> -{
> >>> -	unsigned long fixed_gts = 0;
> >>> -	int id, err;
> >>> -
> >>> -	drm_dbg(&xe->drm, "migration recovery in progress\n");
> >>> -	xe_pm_runtime_get(xe);
> >>> -	vf_post_migration_shutdown(xe);
> >>> -
> >>> -	if (!xe_sriov_vf_migration_supported(xe)) {
> >>> -		xe_sriov_err(xe, "migration is not supported\n");
> >>> -		err = -ENOTRECOVERABLE;
> >>> -		goto fail;
> >>> -	}
> >>> -
> >>> -	while (id = vf_get_next_migrated_gt_id(xe), id >= 0) {
> >>> -		struct xe_gt *gt = xe_device_get_gt(xe, id);
> >>> -
> >>> -		err = gt_vf_post_migration_fixups(gt);
> >>> -		if (err)
> >>> -			goto fail;
> >>> -
> >>> -		set_bit(id, &fixed_gts);
> >>> -	}
> >>> -
> >>> -	vf_post_migration_kickstart(xe);
> >>> -	err = vf_post_migration_notify_resfix_done(xe, fixed_gts);
> >>> -	if (err)
> >>> -		goto fail;
> >>> -
> >>> -	xe_pm_runtime_put(xe);
> >>> -	drm_notice(&xe->drm, "migration recovery ended\n");
> >>> -	return;
> >>> -fail:
> >>> -	xe_pm_runtime_put(xe);
> >>> -	drm_err(&xe->drm, "migration recovery failed (%pe)\n", ERR_PTR(err));
> >>> -	xe_device_declare_wedged(xe);
> >>> -}
> >>> -
> >>> -static void migration_worker_func(struct work_struct *w)
> >>> -{
> >>> -	struct xe_device *xe = container_of(w, struct xe_device,
> >>> -					    sriov.vf.migration.worker);
> >>> -
> >>> -	vf_post_migration_recovery(xe);
> >>> -}
> >>> -
> >>> -/*
> >>> - * Check if post-restore recovery is coming on any of GTs.
> >>> - * @xe: the &xe_device struct instance
> >>> - *
> >>> - * Return: True if migration recovery worker will soon be running. Any worker currently
> >>> - * executing does not affect the result.
> >>> - */
> >>> -static bool vf_ready_to_recovery_on_any_gts(struct xe_device *xe)
> >>> -{
> >>> -	struct xe_gt *gt;
> >>> -	unsigned int id;
> >>> -
> >>> -	for_each_gt(gt, xe, id) {
> >>> -		if (test_bit(id, &xe->sriov.vf.migration.gt_flags))
> >>> -			return true;
> >>> -	}
> >>> -	return false;
> >>> -}
> >>> -
> >>> -/**
> >>> - * xe_sriov_vf_start_migration_recovery - Start VF migration recovery.
> >>> - * @xe: the &xe_device to start recovery on
> >>> - *
> >>> - * This function shall be called only by VF.
> >>> - */
> >>> -void xe_sriov_vf_start_migration_recovery(struct xe_device *xe)
> >>> -{
> >>> -	bool started;
> >>> -
> >>> -	xe_assert(xe, IS_SRIOV_VF(xe));
> >>> -
> >>> -	if (!vf_ready_to_recovery_on_any_gts(xe))
> >>> -		return;
> >>> -
> >>> -	started = queue_work(xe->sriov.wq, &xe->sriov.vf.migration.worker);
> >>> -	drm_info(&xe->drm, "VF migration recovery %s\n", started ?
> >>> -		 "scheduled" : "already in progress");
> >>> -}
> >>> -
> >>>  /**
> >>>   * xe_sriov_vf_init_late() - SR-IOV VF late initialization functions.
> >>>   * @xe: the &xe_device to initialize
> >>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
> >>> index 9e752105ec2a..4df95266b261 100644
> >>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.h
> >>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
> >>> @@ -13,7 +13,6 @@ struct xe_device;
> >>>  
> >>>  void xe_sriov_vf_init_early(struct xe_device *xe);
> >>>  int xe_sriov_vf_init_late(struct xe_device *xe);
> >>> -void xe_sriov_vf_start_migration_recovery(struct xe_device *xe);
> >>>  bool xe_sriov_vf_migration_supported(struct xe_device *xe);
> >>>  void xe_sriov_vf_debugfs_register(struct xe_device *xe, struct dentry *root);
> >>>  
> >>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> >>> index 426cc5841958..6a0fd0f5463e 100644
> >>> --- a/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> >>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> >>> @@ -33,10 +33,6 @@ struct xe_device_vf {
> >>>  
> >>>  	/** @migration: VF Migration state data */
> >>>  	struct {
> >>> -		/** @migration.worker: VF migration recovery worker */
> >>> -		struct work_struct worker;
> >>> -		/** @migration.gt_flags: Per-GT request flags for VF migration recovery */
> >>> -		unsigned long gt_flags;
> >>>  		/**
> >>>  		 * @migration.enabled: flag indicating if migration support
> >>>  		 * was enabled or not due to missing prerequisites
> >>
> 
