Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962E4CD8CB2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 15:31:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A82A10EAC3;
	Wed, 10 Jun 2026 15:31:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ktkhAlGG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F04FC10EAC3
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 15:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781105480; x=1812641480;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+zGpTmKF36TSiymVUrIt20hRBVyHwfyW6ybELJpbjVw=;
 b=ktkhAlGGZp9T9S+vjLdPnH0pceJHYXRE/MF++bL4G8fm7jsGxWEaz84X
 fhZq4lJVa8DwvAQ+5zQhGilNXqOGZACgCFpKevSnb8/pIp6aV/8OavDug
 Oc+nZtAb61j20DN0rwnpoSVTKorjs9J3M+uW3GLvbxZsEMO10Ib7QgzFS
 5eeoJtoycuDx1eVsdpCoucaH9KIqXJe3JAFS0i4nrjwyTtqMVFvUjOxsx
 7+khsokPCDIuk9U5kV7wBbyPNcME6/1MLQtnr2tJZxPl5lWGrlcqx1X9X
 1jEO7I9nE1ky3CUuvBGSroeKhg6enpz6/uSIJOjWpU0+XEKOiWuW7UE4L A==;
X-CSE-ConnectionGUID: 24MfQaphQNKHhkh8RHAuWg==
X-CSE-MsgGUID: btlx5bQqSpWPcpZUq6mqJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="107339000"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="107339000"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 08:31:17 -0700
X-CSE-ConnectionGUID: 7qOHc36mQqqeGj1LAbST2A==
X-CSE-MsgGUID: nCOu56hoQqqaL/rp+sC4HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="242071423"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 08:31:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 08:31:09 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 08:31:09 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.23) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 08:31:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mgu9OSWXVQpHjD6fC5L1ImP5MIeZ6qaHr2NErY7JEs2cOJs98pbbOYfa8Jr5Bv1CYItftn/7KkpztSoh7GRj1rU6IEWZ2/FWweok8zDkDLIls9u7+YfQP35n0jI8NGuxw0sF678mGNut36eY9meOg8yfM6SMlBrEpSpxhwYmxF0nkzLvZjJcVyoblI00Vi9+WzSsUWJpr90XkCs5k1fY6MLYRlVChfU6Bj7oE4O6knMMRaWF8T9xkF64QlgJPEdo2HM2NgEq3WkIsgfKCEkf0jvuaVy3AuNEn79qYnPU10K+4WCNDBcAJrdowZrwuU2a5Bm9ea17n2437HnQTVBajA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UI3BRCSihHILKFAdD3goQbJpSAnHwQqgQEeQDg3+ieM=;
 b=E9kaUoB8C7c2fXKOeLEJj6HUZ7jTt5hOxGHC5dIOOrt4zIJN3RLvPts7UPwKk4UesvyFFdDMbsLHvScXfRQ8Ht5dnITvyWdwl8pI66fD6ujWsLx+KfrxlpD8/Gdu0Kl30Vvs0C0tndSyZXcKo7+oD95bEwqsT24eJoA6NO3cZ0g+sjKAkSrSxydhBw74A5/tdnEbPPlrFOn2FBur+xMMLd68nWWGMkxT5WT5py+rTw8r0n4oMJUocUILzLq7jq47ZmkOxi4oJdWiCHmtVnT+SCABqiWlAfhfQMYk6PzRR32OwrXndn2XrDu9k9LuBfQg6HGItV+UQzmCwG3YvP3rqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by DS0PR11MB6520.namprd11.prod.outlook.com (2603:10b6:8:d0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 15:31:04 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 15:31:04 +0000
Date: Wed, 10 Jun 2026 11:30:59 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "Souza, Jose" <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Brost, Matthew" <matthew.brost@intel.com>, 
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>
Subject: Re: [PATCH V11 11/12] drm/xe/uapi: Expose ban reason in
 EXEC_QUEUE_GET_PROPERTY_BAN
Message-ID: <aimDM0CpapzxZP9n@intel.com>
References: <20260605123839.236021-14-tejas.upadhyay@intel.com>
 <20260605123839.236021-25-tejas.upadhyay@intel.com>
 <543ed281612b0f8b1cd289448ae917896f18200c.camel@intel.com>
 <aidgZ1zsihvCPGqq@intel.com>
 <DS0PR11MB8718ECA4E0D9067E4C41EE51811A2@DS0PR11MB8718.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DS0PR11MB8718ECA4E0D9067E4C41EE51811A2@DS0PR11MB8718.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0195.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::20) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|DS0PR11MB6520:EE_
X-MS-Office365-Filtering-Correlation-Id: a8933af1-21bb-4a96-043e-08dec7054878
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|11063799006|56012099006|4143699003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 63e7xxnqFL89eKJIwW+KVIHJyvHdCfMrI38nMJpH3PEv+D8LWD/2JXI8ittT9hye4H07Md0Be6kp7YEnnDuDdO5i5dyh1rw453LJQMO5J8B70p6BCPzOfV8pGxQELLlAYMVpR76ckU+bmyKneHsJ3ZZ+EoLs7uYSLudzv6+x7zWWdCNiv6UeLv46JAf8v6Qqw2LazVuarGzy76ojjkbo/4SC8OzfZ1HRMminJNLJjcaIIY7Y+Tq9QMCl+GsSyKuYsC0jx0BXno10y07J0ImA+YRLxROK2mKLG4oDw5hUH5I7yDcct86fN3XeukQ84ZEAKSHjXBJ3PDCoyQLissRVbur7FBNNJr4tGGxMf7eGX+Y2XakOhv9cNXl6FPwH/ZFhbofART2VgcqEa24P06pGXLgdoKXtcYdfJog6KNCITL9zv5UVHA+6RMxCmsGMxQrzPk5yVZd8Rfjuc8x5Nj0a1Odz/TPAE21pFeDTSbFByL8O82bc5AwSdRRbP68IN5SNN52411yBKEUMjrnmA9dtjMMwMiymk1bfXmBzLZ7GuDin+1JFyxgt0/nJwPhynun7XXSEDqp5yJQfn/H5tmJ+d0FmQcIrDwFunlNgawa72TSUZxGq1vjxenY9FeMFpc4udHvuXz17tILZ+kDZKk7MLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(11063799006)(56012099006)(4143699003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8jG1E2567ifXuofc73CBsuJYQj9GEhvxp5zt0mRZgsSwN7MtGvBtX/Wjw0?=
 =?iso-8859-1?Q?5nLMnSOR0KtUe+v+OCQSBYpdzLp72624MIXtwCWTig1PBpeJXwCFZ9Vs9w?=
 =?iso-8859-1?Q?kfjk1I/8sZnBdteeusvajYIZtogLNnQf/Rsr1IzXAxRr/3GrWrra0rAjts?=
 =?iso-8859-1?Q?RdTuaRAQSAm/ohK1NiNttmkGKP5/p9B40MuZ1w2/Q/3Uw8b/9Rzlkxm5Hi?=
 =?iso-8859-1?Q?9GDWuTuLfdwMRhfa7s6gCz6ny+2nr4x1uNs7e/FbN3WUEF2E8bV71PsOZq?=
 =?iso-8859-1?Q?4NwgFgKjHjXnYbpeWg5Bi1h3fh3AbxdqaTgom/VGOYgv9ldqI9dnUSfuJg?=
 =?iso-8859-1?Q?LGmmDaiV35AQwOspIWzXOCucjfipTsPCH+0JQ6rQcKGfd3lEoex+2surMH?=
 =?iso-8859-1?Q?zvS6Y5osTyTDerInx4EVR24EsVarxxihyKdPOi+wl92YnqkpTjc5gjGZ5s?=
 =?iso-8859-1?Q?J7MHcrqAwaFQsmAF5Ev1w2A/i9S9HfWRZabS4zRSl3PWWOES1kJ3OUD7HP?=
 =?iso-8859-1?Q?JCElo7uY64kzOt06d/36i7fidtaCQUs/3m/L9q82jOv/S4lmhNhg5Xs3/6?=
 =?iso-8859-1?Q?vKfGEh5VjAZukY6eHvGjOrm3K1d8d4R/DERcRi9rxUQM63d60jOvMumF4A?=
 =?iso-8859-1?Q?DZ1F7UuEYZ9H7YmBwq4+gw4UUT5U8lVktQbuimKfv7WigL/AebU6fBvpL3?=
 =?iso-8859-1?Q?BIlgN3+WyOMbFFbxl5nPb7QZUOVQu5T2bm08yttBiQMmvD+rDVXfN7g2Pt?=
 =?iso-8859-1?Q?r5hKrXatqmBov0yXHkzJfEBnZqoRaQObd5nRSgZSuNz3Y9h9z+FmZ/V3OP?=
 =?iso-8859-1?Q?8odbmpvGhAMlFD5eOHzvxM/GAkCNXYDAkGy9lfRTC3n8aHbwZ3sDUaT245?=
 =?iso-8859-1?Q?HwvwBFlAkJraYMFVXuOEPCwuOthgw/OjTmQLiQuFXSBs2tcXsLIievb88o?=
 =?iso-8859-1?Q?yp2D0QNMMp9xYBtSuwcmuduJD8SVMCzh+jbQ6lWWDL+VosfhjTgI2p/U0D?=
 =?iso-8859-1?Q?jqrE8sA8fZZ/K/2/20mJ8ZrfpXP4NXdjxbgh7ZVRYaKDowZEyiSNAuvvxY?=
 =?iso-8859-1?Q?NshOUStd7Ykns/94mEkQc3xbvmIms7Fcd1utXGf1w70gqvW+MK+fv1NhK1?=
 =?iso-8859-1?Q?5ixiOvLiz0KrXOJcacjgdqkqo0ZAe+FbsX52dR5OkT9K9S03wzmDuaTu1Y?=
 =?iso-8859-1?Q?EFU5gKxQLA7jAuctTP2DQO3S3fl9pwSbkhfXSUPF2D5cSAuMIaZu4IN3Wt?=
 =?iso-8859-1?Q?5pMfMvkRs4e9l8iBWcEsqOPEvaOJZjqtZMnwJxhRR85obMDkuiWL60EOuC?=
 =?iso-8859-1?Q?KU+w8VOjmu2FKUzOhKhxjsdQ7NLKIuMwqgPpvjEp4SkzuGlxYEzfSAaPoH?=
 =?iso-8859-1?Q?MnZLDagrGdY3IyklILzRvogPFQBJRluQJa7dlrCM2V0KU/ilrU/3feeHmW?=
 =?iso-8859-1?Q?2AGum/PXManPdAqeGk3t+VaVm/bkkBfq3kuFNOwVlQv6L6lOfRhtezjPYx?=
 =?iso-8859-1?Q?dX+EZR8iHBSQWarJ+e6iYJlM3eTnBD89f2URk917gX1r1R80Zuoh2x36BG?=
 =?iso-8859-1?Q?W/Mjv2/QQUIiNAKjKgJANjwu2j4/8amLq791Ju1OANNf4dn/tgEpwSqDSQ?=
 =?iso-8859-1?Q?dZIz639i8jFCUOQzrWRDjnTOzZNjuVGjQJdtS9Q2GkGTKssqQgt+LwWy7D?=
 =?iso-8859-1?Q?0S7p0kW3x1dDtCECPWgneiuB+inkRPPew1d/lqvnZ8kpv74Z81Ma17ukhZ?=
 =?iso-8859-1?Q?93zfDNFbzkengs13BhMiK6ERVtBVyxqS+AvNEu9ZM8WA1WDFwqQSm862OB?=
 =?iso-8859-1?Q?bIxI+62zvA=3D=3D?=
X-Exchange-RoutingPolicyChecked: UoyVaCV9MjDWnExrYkaCm9jrqUS80h3wuxEzeBgS69KcxmDqspj4TlnRVOF2vokmOX9111qF3iUkEuZpnAZmT3GM5cw7lAZI+EN0Rfv+6kTahWc8f8SmnNSvc/Oa9NPNH84wo7TE5uqjR/daUChpK5ABpXFCJdE0Zus8ApogwugUPaaYpwIhjffuTuxgqCQ6qDhoh/dCBnSyIIWD7nBATcGcdNDnIRfUhU3SWEkEcp/5zz2XFFJnRoftekGPBze8y3T452cqXnCzLRw/ylJazOE9E28XqrBs717eR2zJyBJUtwkVCgFXstL2cgHDVp7zKfC+suNjLmKDtLSAfcyjhw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a8933af1-21bb-4a96-043e-08dec7054878
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 15:31:03.9441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++qId9FLRrbYAYht8x5gl8Xzjlor5cB9wVEMYnBPGTGaJSpGbO26csiuUMIErUdsnCpRxlMp9b+oBjWP7lHN2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6520
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

On Wed, Jun 10, 2026 at 10:17:26AM -0400, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Sent: 09 June 2026 06:08
> > To: Souza, Jose <jose.souza@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Upadhyay, Tejas
> > <tejas.upadhyay@intel.com>; Brost, Matthew <matthew.brost@intel.com>;
> > Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Auld, Matthew
> > <matthew.auld@intel.com>; thomas.hellstrom@linux.intel.com; Mrozek,
> > Michal <michal.mrozek@intel.com>
> > Subject: Re: [PATCH V11 11/12] drm/xe/uapi: Expose ban reason in
> > EXEC_QUEUE_GET_PROPERTY_BAN
> > 
> > On Mon, Jun 08, 2026 at 10:03:50AM -0400, Souza, Jose wrote:
> > > On Fri, 2026-06-05 at 18:08 +0530, Tejas Upadhyay wrote:
> > > > Extend DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN to return a bitmask
> > > > indicating the reason for the ban, rather than a simple boolean.
> > > > This allows userspace to distinguish between different ban causes:
> > > >
> > > > - DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG (bit 0): exec queue
> > was
> > > > banned
> > > >   due to a GPU hang or job timeout detected by the TDR.
> > > > - DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE (bit 1): exec
> > queue was
> > > >   banned because a VRAM page backing its resources was taken offline.
> > > >
> > > > The ban_reason field is added to struct xe_exec_queue and set at the
> > > > point where the ban is triggered:
> > > > - In guc_exec_queue_timedout_job() for GPU hang.
> > > > - In xe_ttm_vram_purge_page() for memory page offline, before
> > > > calling
> > > >   xe_exec_queue_kill() or xe_vm_kill().
> > > >
> > > > The reset_status op is updated to return u64 with the reason bitmask.
> > > > When a queue is banned but no explicit reason was recorded (e.g.,
> > > > from a generic CAT error), it defaults to GPU_HANG for backward
> > > > compatibility.
> > > > A value of 0 means the exec queue is not banned.
> > > >
> > >
> > > Acked-by: José Roberto de Souza <jose.souza@intel.com>
> > 
> > Do we already have a userpace change with this?
> 
> By userspace you mean IGT or other UMD? I have thought to add simple test to offline and check for BAN reason in xe_exec_basic or somewhere. I have igt tests  https://patchwork.freedesktop.org/patch/714751/for testing mempage offline via debugfs but that does not test complete flow of mempage offline feature so not extending it with this.

I'm missing the end to end flow in here...

could you please clarify what this API is used for? Who is using it and how and when?

Thanks,
Rodrigo.

> 
> Tejas
> > 
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > 
> > Thomas, thought on this vs the watch_queue you have or they are
> > orthogonal?
> > 
> > >
> > > > Assisted-by: Copilot:claude-opus-4.6
> > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > cc: Mrozek, Michal <michal.mrozek@intel.com>
> > > > cc: José Roberto de Souza <jose.souza@intel.com>
> > > > cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_exec_queue_types.h |  7 +++++--
> > > >  drivers/gpu/drm/xe/xe_execlist.c         |  4 ++--
> > > >  drivers/gpu/drm/xe/xe_guc_submit.c       | 24
> > > > +++++++++++++++++++---
> > > > --
> > > >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c     |  7 +++++++
> > > >  include/uapi/drm/xe_drm.h                | 12 +++++++++++-
> > > >  5 files changed, 44 insertions(+), 10 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > index 2f5ccf294675..77a621da4487 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > @@ -143,6 +143,9 @@ struct xe_exec_queue {
> > > >  	 */
> > > >  	unsigned long flags;
> > > >
> > > > +	/** @ban_reason: Bitmask of ban reasons
> > > > (DRM_XE_EXEC_QUEUE_BAN_REASON_*) */
> > > > +	u32 ban_reason;
> > > > +
> > > >  	union {
> > > >  		/** @multi_gt_list: list head for VM bind engines if multi-GT */
> > > >  		struct list_head multi_gt_list;
> > > > @@ -316,8 +319,8 @@ struct xe_exec_queue_ops {
> > > >  	 * signalled when this function is called.
> > > >  	 */
> > > >  	void (*resume)(struct xe_exec_queue *q);
> > > > -	/** @reset_status: check exec queue reset status */
> > > > -	bool (*reset_status)(struct xe_exec_queue *q);
> > > > +	/** @reset_status: check exec queue ban status, returns ban
> > > > reason bitmask */
> > > > +	u64 (*reset_status)(struct xe_exec_queue *q);
> > > >  	/** @active: check exec queue is active */
> > > >  	bool (*active)(struct xe_exec_queue *q);
> > > >  };
> > > > diff --git a/drivers/gpu/drm/xe/xe_execlist.c
> > > > b/drivers/gpu/drm/xe/xe_execlist.c
> > > > index 9fb99c038ea8..35e6e05ba418 100644
> > > > --- a/drivers/gpu/drm/xe/xe_execlist.c
> > > > +++ b/drivers/gpu/drm/xe/xe_execlist.c
> > > > @@ -452,10 +452,10 @@ static void execlist_exec_queue_resume(struct
> > > > xe_exec_queue *q)
> > > >  	/* NIY */
> > > >  }
> > > >
> > > > -static bool execlist_exec_queue_reset_status(struct xe_exec_queue
> > > > *q)
> > > > +static u64 execlist_exec_queue_reset_status(struct xe_exec_queue
> > > > +*q)
> > > >  {
> > > >  	/* NIY */
> > > > -	return false;
> > > > +	return 0;
> > > >  }
> > > >
> > > >  static bool execlist_exec_queue_active(struct xe_exec_queue *q)
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > index 4b247a3019d2..ff28eab7cee2 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > @@ -6,6 +6,7 @@
> > > >  #include "xe_guc_submit.h"
> > > >
> > > >  #include <linux/bitfield.h>
> > > > +#include <uapi/drm/xe_drm.h>
> > > >  #include <linux/bitmap.h>
> > > >  #include <linux/circ_buf.h>
> > > >  #include <linux/dma-fence-array.h>
> > > > @@ -1530,6 +1531,7 @@ guc_exec_queue_timedout_job(struct
> > > > drm_sched_job *drm_job)
> > > >  	if (!exec_queue_killed(q))
> > > >  		wedged =
> > > > guc_submit_hint_wedged(exec_queue_to_guc(q));
> > > >
> > > > +	q->ban_reason |=
> > DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG;
> > > >  	set_exec_queue_banned(q);
> > > >
> > > >  	/* Kick job / queue off hardware */ @@ -2211,13 +2213,25 @@
> > static
> > > > void guc_exec_queue_resume(struct xe_exec_queue *q)
> > > >  	xe_sched_msg_unlock(sched);
> > > >  }
> > > >
> > > > -static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
> > > > +static u64 guc_exec_queue_reset_status(struct xe_exec_queue *q)
> > > >  {
> > > > -	if (xe_exec_queue_is_multi_queue_secondary(q) &&
> > > > -
> > > > guc_exec_queue_reset_status(xe_exec_queue_multi_queue_primary(q)))
> > > > -		return true;
> > > > +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
> > > > +		u64 status = guc_exec_queue_reset_status(
> > > > +				xe_exec_queue_multi_queue_primary(q)
> > > > );
> > > > +		if (status)
> > > > +			return status;
> > > > +	}
> > > > +
> > > > +	if (exec_queue_reset(q) ||
> > > > exec_queue_killed_or_banned_or_wedged(q)) {
> > > > +		u64 reason = q->ban_reason;
> > > >
> > > > -	return exec_queue_reset(q) ||
> > > > exec_queue_killed_or_banned_or_wedged(q);
> > > > +		/* If no specific reason was recorded, default to
> > > > GPU hang */
> > > > +		if (!reason)
> > > > +			reason =
> > > > DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG;
> > > > +		return reason;
> > > > +	}
> > > > +
> > > > +	return 0;
> > > >  }
> > > >
> > > >  static bool guc_exec_queue_active(struct xe_exec_queue *q) diff
> > > > --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > index 35b5eaf590fa..3765e8fcdcec 100644
> > > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > @@ -7,6 +7,7 @@
> > > >  #include <drm/drm_managed.h>
> > > >  #include <drm/drm_drv.h>
> > > >  #include <drm/drm_buddy.h>
> > > > +#include <uapi/drm/xe_drm.h>
> > > >
> > > >  #include <drm/ttm/ttm_placement.h>
> > > >  #include <drm/ttm/ttm_range_manager.h> @@ -537,10 +538,15 @@
> > static
> > > > int xe_ttm_vram_purge_page(struct xe_device *xe, struct xe_bo *bo)
> > > >  	xe_bo_unlock(bo);
> > > >  	/*  Ban VM if BO is PPGTT */
> > > >  	if (vm && (flags & XE_BO_FLAG_PAGETABLE)) {
> > > > +		struct xe_exec_queue *eq;
> > > > +
> > > >  		down_write(&vm->lock);
> > > > +		list_for_each_entry(eq, &vm->preempt.exec_queues,
> > > > lr.link)
> > > > +			eq->ban_reason |=
> > > > DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE;
> > > >  		xe_vm_kill(vm, true);
> > > >  		up_write(&vm->lock);
> > > >  	}
> > > > +
> > > >  	if (vm)
> > > >  		xe_vm_put(vm);
> > > >
> > > > @@ -548,6 +554,7 @@ static int xe_ttm_vram_purge_page(struct
> > > > xe_device *xe, struct xe_bo *bo)
> > > >  	/*  Ban exec queue if BO is lrc */
> > > >  	if (bo->q && xe_exec_queue_get_unless_zero(bo->q)) {
> > > >  		/* ban queue */
> > > > +		bo->q->ban_reason |=
> > > > DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE;
> > > >  		xe_exec_queue_kill(bo->q);
> > > >  		xe_exec_queue_put(bo->q);
> > > >  	}
> > > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > > index 48e9f1fdb78d..904d58b039fe 100644
> > > > --- a/include/uapi/drm/xe_drm.h
> > > > +++ b/include/uapi/drm/xe_drm.h
> > > > @@ -1503,7 +1503,17 @@ struct drm_xe_exec_queue_get_property {
> > > >  	/** @property: property to get */
> > > >  	__u32 property;
> > > >
> > > > -	/** @value: property value */
> > > > +	/**
> > > > +	 * @value: property value
> > > > +	 *
> > > > +	 * For %DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN, this is a
> > > > bitmask of:
> > > > +	 *  - %DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG - banned
> > due to
> > > > GPU hang/timeout
> > > > +	 *  - %DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE - banned
> > > > due to memory page offline
> > > > +	 *
> > > > +	 * Value of 0 means the exec queue is not banned.
> > > > +	 */
> > > > +#define DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG
> > 	(1 << 0)
> > > > +#define DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE	(1 <<
> > 1)
> > > >  	__u64 value;
> > > >
> > > >  	/** @reserved: Reserved */
