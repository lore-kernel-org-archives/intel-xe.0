Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86C5CD5BB8
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 19:29:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73B5710E155;
	Thu,  5 Sep 2024 19:29:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hk+B68gP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227A010E155
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 19:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725564590; x=1757100590;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hyrtKJuHCzKXb70WE8ais5rvnRBZSoizb60YRxiCrCg=;
 b=Hk+B68gPXodIwfT3N5t2K2ZQPMfHElu2M+oNrXUAWnoaqEl7tZOJa2u2
 sDNiP+ZgPEBZScBzUTxpfx+vdlxcCT6sCGbm8CGziv2Hsl6mSn6o8gyGo
 DKFBbCWMJ2Z4J2pLyTIOeaJQOFuxu1mqqtj/hgds67E7tQIGASrKZkzYf
 lYfhnKdvc2CZWwqzRcfHIfTA9RBpDcbHzTUgcTvncADPsG1KIFrDH7tPz
 SPgx8v0gvrUiIBjunQMwOI9bylXS4QPQSvRg8NUVuC68DIUG47iP+nIGX
 OqU5rk6+7SAUpc8Rs5fCbPyy+VjG0LOhbls8ovsw9nM9/sTKYyH5W7tlt A==;
X-CSE-ConnectionGUID: o7GSy7klQkSv/xSj813eLw==
X-CSE-MsgGUID: SLDXGmP5R/uw5LPM/F++Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="35661242"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="35661242"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 12:29:50 -0700
X-CSE-ConnectionGUID: VdBXvaLvRS2n1G/CX/BqoQ==
X-CSE-MsgGUID: aLlxTHI/TZmNby5lXUhYYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="66454681"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 12:29:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 12:29:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 12:29:49 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 12:29:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QIHeZctLH86Df3XM2TgBD9fK2KYsVYO6hfN1w+ZFN9Tz5voHINMoZ7hmGfKVJeQbi2/fi1QXbgOsca4WYQ1gLBaPTsFF8gc5iptTTsjHvVZJ66ZALEUk3R/ibpqnVaPiOa1rjZAPQND+MR3f6mKgeGe/Kk26DA5aeY4l4ZN89VqxpBbBdHsRkiN00H7U+h9RKY+ypZoUmWzpd5HlYBh75ZNduLc110f+N3dp4UfoPia0nQdgkMN4WVzUdLRfs60Gg8fI70Ske7t2oCp4b3uZu2qZgYMHG9mP3rfE0aoFPUOgef7Lf4uBDLpBYnVhZ4yCcapQ09ZYDPJ/ulv5izSgkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29ukZquaDWEa8A50TiyA+lzczXgiuax1gLxUxqsXoj8=;
 b=C1/JhN+y5e+DuFeNMtv74Xi1sp5jpx1LHt/2xPPT8mOVNaSXlFcgEmBJ+yCRbYNZipZ5e9Q9HfIjNuK3qwwd4YWnuy8wi8YVMpY/wnGw0i/ZGfEF/h9EFCPOc2VeMjMxQ+wi5Tgjz7UIwgBBA+CBw6tMhu8qHv9DqFlgZqZ/W7ls4meByh7joZpKt0xFBqcQbiryg/UPtTq3uLSjBibp6iqI4P9K1xsptBSThxYE4cA8vqm+jDpXstsT+AbQ/lPs43zQs7otDRciZhuUDQvuWjF1HDXSJ/2N7nA03n8sSsBtRPYMLsF9QIj7h0dWbpdl7jr5Pxy1RA0Wt1CZ972fug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CH3PR11MB7322.namprd11.prod.outlook.com (2603:10b6:610:14a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Thu, 5 Sep
 2024 19:29:46 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 19:29:46 +0000
Date: Thu, 5 Sep 2024 15:29:42 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [RFC 1/9] drm/xe: Error handling in xe_force_wake_get()
Message-ID: <ZtoGpjVmZbwLsD1s@intel.com>
References: <20240830052326.3707019-1-himal.prasad.ghimiray@intel.com>
 <20240830052326.3707019-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240830052326.3707019-2-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0072.namprd03.prod.outlook.com
 (2603:10b6:303:b6::17) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CH3PR11MB7322:EE_
X-MS-Office365-Filtering-Correlation-Id: 96af71d3-1492-4052-64e9-08dccde11958
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XC1rUdxq0QB6hhX/fkY7oSjla8+iMDSIDmgIIgIXavdCKg6ms6i61edAt1bf?=
 =?us-ascii?Q?8G2pk5K6IXx2tfTLN09vTgkUaEACbFJ51guhaHZO/W1pX4Qy5ZZwJgmNmtEj?=
 =?us-ascii?Q?/SOizZsZh3gPzsNU1dWJiGcPAuvsSmw/rWPx9N059QvjfeSPM3PA5mSNVCqo?=
 =?us-ascii?Q?Y1Q1ahczXb9puznkZGQJyEj1ZWsnWk/T6fTD26tVBa4IMdYQ/X93jxzP90mw?=
 =?us-ascii?Q?qEdXhieik8LsHasGcpnJkdcaUpwX8+Nkuw5cxmfSMKG4KXBTy+YPN7/YZlWE?=
 =?us-ascii?Q?4OmXd9cUtDEnIQ6t3ZEUC3GLXhTDmIx/nk+0qwtmfUxz3IQUWe7QhwvNL4Oq?=
 =?us-ascii?Q?S6mCqikVSLdZGIbCwk3yKwOL5Pa7R4Kt0pP+U1zFghlk9goAhvjmW6QDeNjT?=
 =?us-ascii?Q?5it108AgwpPaIZVOsStaEQbtg1TdlyqEEK8PsnmMksjVLfmRaBC2FKf+wTa+?=
 =?us-ascii?Q?bisZxwSRm9sn24VXrBXlUabUe85dIdkdiIJBPbghYMPtSnrkjcvFHYgarCNJ?=
 =?us-ascii?Q?Yq/vCnOmp3Xfv9Zu/sezgA3KMhIpeI/Ww/zdrBNY5d+J5U/OvIWvBp0+dgYt?=
 =?us-ascii?Q?Vg5tN8boZxYuOp0iWkcTNo2rfQ0VCgFDvs16hvDdNVuM3k1i5TmvHKoJ5vFd?=
 =?us-ascii?Q?OEsx1eu81KG8Ld5G4pxfTzY9Lclf9Baz/dl9ukG1OLxAmDYzUMsvh/0uYdZw?=
 =?us-ascii?Q?iF6Da+20lJ2hacOX6yMCvm3Vn1eZ6+Ngy5OQE2zmirjjyi4hraz7fTsZM8FA?=
 =?us-ascii?Q?G66DzWsDQeRrgcKns2/javY5+HOdttviFmaclh2c9OMt5BiwM1m91dKSQk5K?=
 =?us-ascii?Q?DpSoSMF0bN4Q/aF5WrkfG2x9UM1/tms5kBp5Yz2t+I0h7HU0da6b8eGZSJ+1?=
 =?us-ascii?Q?atEoLEl/oNW68aRcNiSJizTyG2dTFsGlPCBbSwx8IR8zkIUgzb8GL1Z/s1hU?=
 =?us-ascii?Q?A4KKmLLFXE8n1uwcCztmhYtb/TWAe0r/tp2C+rQXAenMn2SHUkhkjV4FLpX3?=
 =?us-ascii?Q?YP+lOMhk2VLc81zVAV1pzZOx0qd7R0RfxRpLUHqM89COOp0oYi6fr7TulDbN?=
 =?us-ascii?Q?bpI/3k4zcQTlALTxd6b+Rn8NwDSfOknHPWQh3ivI6OrbnBlVhmJ7tm2wdX8w?=
 =?us-ascii?Q?L+EkCR+ni2x2uC1OW8ex1kQTMIoM3ZsMF2WzabT0wJWAeUzIARE6R3mSXK1L?=
 =?us-ascii?Q?R5vrU75a6i8eLCDWAcr7PGy5DSs93FKKv+zgwAf81ZCLR07PBxe7UhqisWl1?=
 =?us-ascii?Q?K9v+aqJD9+6sGvb3boR/JBFOEOUeZLc7vTmIjM7tDY58islrJm+gICAl1y2Q?=
 =?us-ascii?Q?QqI6koOihmOJR5WF0r/q9N/hFDj4/zdQ7DykmHGjQ8PeCQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EY6ryYw6Cq3AIj1gxVjk0RRQVjUWTYh9zL+5IOwXCZfzQe6xPdQi0EvwzlRw?=
 =?us-ascii?Q?hIheSm+qtAEzeBGDdamx+ejJAnki1HiLE76rT4WhdkzpSPhM/o+H2HrM/Rg1?=
 =?us-ascii?Q?RpqVgreDjYWT8Do+1w7Kjtc8cquaYkUribGcRwRcoYMI3RWhovQ2i/0QL2lp?=
 =?us-ascii?Q?hRDtmarbq+jPVY6LyNQvELdj39CrJkR3P1O9BBKMhs2MIA4gP6VTgzIgDtj/?=
 =?us-ascii?Q?8mhj5QuMyDBstUKr8Y2r5FuC7ACtuW5RRtE0hPTN8xfSF0RCFmQo/zpjqzqU?=
 =?us-ascii?Q?9cCzKTTvi2QBK0JJIqJOo63SPf4GoDsSENpyyZ+jzI2LR3SuWvaStmsrBTV6?=
 =?us-ascii?Q?qnM706aWCamku1a5lLWrUnp+PZU25iHN+g9D/u3OO0yLi/uEP3zQc59WNrPy?=
 =?us-ascii?Q?ugCw0skGAprtO9OWtJcwsNCjo4/5gU6R1rJ01PLKRKe3BGXfMOAWSFSWlIkh?=
 =?us-ascii?Q?a5Uu4YT2QqOPv3TTpgrFoNZudjbJUjlU1HilFEb1jwoRb7MUPjwrFNvb7NgC?=
 =?us-ascii?Q?TEitbBzDf523VWVzxRso4zXTaSgHQ2w+3TSRoTbQuziMLcmaByhO6GMnfbhM?=
 =?us-ascii?Q?ZvF/nwyFu7az2XvIEqdcJMyLQAjeXn+MZmamIFDuEBj04N6MK4I7aG2+X9eL?=
 =?us-ascii?Q?NGQX72wQWcV0IH8JL91QfTftnIOTZhl4fyXdFWO5U8S11vILqAUWgCzdHsHa?=
 =?us-ascii?Q?h4CWfhWiYn7sX94r+EXyqFODS0sVhEZg8MTX0LRT9I8kX0iNlmAsNS/XEPOo?=
 =?us-ascii?Q?PLWAaDvOlddfWCJ3RkULyJ376yKhSaVE0otSP9kr7oV2Slm2UgxKN2y/ORXC?=
 =?us-ascii?Q?bDw/4p9o1c5cDfUbOMMFERPGtSo4XUGqr5SFfwZYy1RwQHljgYB8V6zuDXwJ?=
 =?us-ascii?Q?DU9y3IWx1ZOqHq0nB3+Jt+YvDEzZg3V3hjR6D5DB6x3Sb9IU5CO3Kl8MHMfc?=
 =?us-ascii?Q?FQynuTnbU+HSSWVhD4RYeOUvihTg5Um9YbQXIkwiPpgrZFy1hfCcfboFR9k+?=
 =?us-ascii?Q?bI+i6eBJQRi9y108HL1ENm0R5xuopSrRDVm9mt//jjrqZhWE6qfubCWT6YD+?=
 =?us-ascii?Q?CqDKB+SjtVQ0UyMNJAEp309I9RaEbddudWu0pyQPVBjL5XRptIx4TtEvIkad?=
 =?us-ascii?Q?l4ZMbYSI5t39WyMHBwsTMvfuy+A6jkcxI8vFWPkrOG7brzX0nnHOcbTk1syM?=
 =?us-ascii?Q?qFq53sBeCmu2PBRImEu/h3hZs+Am8YPhNQrO1UU8tUsp6o9HowOSsDOFt0ro?=
 =?us-ascii?Q?fKJHuC+QxkDHgHGz7xKfrY+NhfIw5gvBA0lQnApqVw06rlBRm9p4pQ5AkiEY?=
 =?us-ascii?Q?NIIZxa7pX3MVfq438RZCgmG5ErvX6pKyeP1rkV0o2c/vNcLZPHihdCpRjs5K?=
 =?us-ascii?Q?Da3SHhK86ORaKKm2ml0dqcDtcnulY9ZVzDOsGjV/SDajKcYhMTjAOhj+T2XM?=
 =?us-ascii?Q?UGeo9aGqn87lVgPv2ooWzI46iNvsTFS9qXfKiZu6ni7XC1Q/fLgSnqTqCpnw?=
 =?us-ascii?Q?u+EtqRbXZFmdm+Qr/A+Cj6aYEkHFIt0AtgXEIOsl+BJq1mE/b8Km5DU1DFom?=
 =?us-ascii?Q?uDOOqMHnR8nx4kf26tETEWmKV8iwlK4wD9We9X+ZQc54fZZQNWBb9luHU5bj?=
 =?us-ascii?Q?sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96af71d3-1492-4052-64e9-08dccde11958
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 19:29:46.3407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IhUimu8HSga1zdJDlCaMh9ROYj+BtVS4azB7dYR7HFHgaK6suEfRO0lHk89242KicLmwp0IpoeJhHb61KW6hTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7322
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

On Fri, Aug 30, 2024 at 10:53:18AM +0530, Himal Prasad Ghimiray wrote:
> If an acknowledgment timeout occurs for a domain awake request, put to
> sleep all domains awakened by the caller and decrease the reference
> count for all requested domains. This prevents xe_force_wake_get() from
> leaving an unhandled reference count in case of failure.
> While at it, add simple kernel-doc for xe_force_wake_get() and
> xe_force_wake_put() functions.
> 
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_force_wake.c | 52 +++++++++++++++++++++++++++---
>  1 file changed, 47 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index b263fff15273..8aa8d9b41052 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -150,31 +150,73 @@ static int domain_sleep_wait(struct xe_gt *gt,
>  					 (ffs(tmp__) - 1))) && \
>  					 domain__->reg_ctl.addr)
>  
> +/**
> + * xe_force_wake_get : Increase the domain refcount; if it was 0 initially, wake the domain
> + * @fw: struct xe_force_wake
> + * @domains: forcewake domains to get refcount on
> + *
> + * Increment refcount for the force-wake domain. If the domain is
> + * asleep, awaken it and wait for acknowledgment within the specified
> + * timeout. If a timeout occurs, decrement the refcount and put the
> + * caller awaken domains to sleep.
> + *
> + * Return: 0 on success or 1 on ack timeout from domains.

* Returns 0 for success, negative error code otherwise.

> + */
>  int xe_force_wake_get(struct xe_force_wake *fw,
>  		      enum xe_force_wake_domains domains)
>  {
>  	struct xe_gt *gt = fw->gt;
>  	struct xe_force_wake_domain *domain;
> -	enum xe_force_wake_domains tmp, woken = 0;
> +	enum xe_force_wake_domains tmp, awake_rqst = 0, awake_ack = 0;
>  	unsigned long flags;
>  	int ret = 0;
>  
>  	spin_lock_irqsave(&fw->lock, flags);
>  	for_each_fw_domain_masked(domain, domains, fw, tmp) {
>  		if (!domain->ref++) {
> -			woken |= BIT(domain->id);
> +			awake_rqst |= BIT(domain->id);
>  			domain_wake(gt, domain);
>  		}
>  	}
> -	for_each_fw_domain_masked(domain, woken, fw, tmp) {
> -		ret |= domain_wake_wait(gt, domain);

now you suppress the mmio error code...
should be better to find a way to propagate that.

> +	for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
> +		if (domain_wake_wait(gt, domain) == 0)
> +			awake_ack |= BIT(domain->id);
> +	}
> +
> +	ret = (awake_ack == awake_rqst) ? 0 : 1;

s/1/-EIO/ ?

> +
> +	/*
> +	 * If @domains is XE_FORCEWAKE_ALL and an acknowledgment times out
> +	 * for any domain, decrease the reference count and put the awake
> +	 * domains to sleep. For individual domains, just decrement the
> +	 * reference count.
> +	 */
> +	if (ret) {
> +		for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
> +			if (!--domain->ref && (awake_ack & BIT(domain->id)))
> +				domain_sleep(gt, domain);

wonder if it would help to extract this in a separate function to be
used here and in the -put function.

But more then that, I have a question here...
Do we really need to sleep other domains if we are not getting ack from certain domain?
Doesn't it generally means that we are busted anyway?

But also, if we really need to sleep, then perhaps shouldn't we also
call the sleep function even from the guys who didn't ack? perhaps the ack
timedout, but it really woke-up? how sure we are that this is not possible?

> +		}
> +		awake_ack = 0;
>  	}
> -	fw->awake_domains |= woken;
> +
> +	fw->awake_domains |= awake_ack;
>  	spin_unlock_irqrestore(&fw->lock, flags);
>  
>  	return ret;
>  }
>  
> +/**
> + * xe_force_wake_put - Decrement the refcount and put domain to sleep if refcount becomes 0
> + * @fw: Pointer to the force wake structure
> + * @domains: forcewake domains to put reference
> + *
> + * This function reduces the reference counts for specified domains. If
> + * refcount for any of the specified domain reaches 0, it puts the domain to sleep
> + * and waits for acknowledgment for domain to sleep within specified timeout.
> + * Ensure this function is called only in case of successful xe_force_wake_get().
> + *
> + * Returns 0 in case of success or non-zero in case of timeout of ack
> + */
>  int xe_force_wake_put(struct xe_force_wake *fw,
>  		      enum xe_force_wake_domains domains)
>  {
> -- 
> 2.34.1
> 
