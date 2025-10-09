Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76446CCD184
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 18:08:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 398A710EAC7;
	Thu,  9 Oct 2025 18:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XSorFi7c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE2010EAC7
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 18:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760033302; x=1791569302;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rhDttvATcF+ji2M8fpn8F1G9iytWReJBNFObpaTjp+o=;
 b=XSorFi7c7wARwHwOJpAyHQA68+K3eoo83ne8ZtgRlZ8WrQVHU1kJwn9H
 KSzmHXl8ZznPkqe8RbNp8GW/o/ur7rXPuTu1gQt8bMCzSCvYgkoof0rtX
 aw6B+O/MlzRVkPCXjZlVFgUZATj4NjArmL7WpMNW3Kk55soeicQ2BsYTH
 5uGX2lqLmLj7y38Otih13niNZpk9hTIOu9Ieeqp4uYmDNA+6Lm+v8Cko4
 PgJ9GM1mc6EzirIgW1GNEdV7faIc0ZRuFOx23bCe884ypkgnBqd2Fk8Yp
 fgGw77qV4ABWTBvVYWOcLuE2MHkQIARBKeOb7mICASW0I26eMlKEQ7DuF g==;
X-CSE-ConnectionGUID: 6cYLxB0bQ4CG+VlIQXPGSw==
X-CSE-MsgGUID: bWidgwlOTkOY4JgN7BpnCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62279759"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="62279759"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 11:08:22 -0700
X-CSE-ConnectionGUID: Ydv1e8N6TiaQoJXHPFF6mg==
X-CSE-MsgGUID: 7OQcQoh1QuGdgfpVz3pkig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="181195262"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 11:08:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 11:08:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 11:08:21 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.21) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 11:08:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=if26NM02gJ6QDn1LOOTyc5AltaHIj2D2ylaAJDZno60l0PffIqDy1WRG4FtY8Bioeqoj+2nl8gu3GFf6+sGwOUVbi1+HFpSsXKhhKyVsCI5PwxCV7ta72dMBtbmBIgA+l3/RVNjC7yNJeJW1dxTE/PVykX/tUc356u4UdYjl9tmzJuRRU+YytQ8t5hv4TmE1HCdW6S4FUjZ6a40e8dQBgllvKMgYFr0pE1qNQq9V3cGWKE2Tznd5DnRlOkeG6zo97EhLt7msl25eoPvyv2MUF7NtRwC9PpRn4leJLRpmu8TZmV7PN2ucD6FchRUfAwSaY+Yy+unUy22eOy28PPXgnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbk9pgiRlq+GjKpeC+ShJwmBrpa30gCbvRhfMzFk5xs=;
 b=qjeVqBvNkh8wO9knsh2HW5HtfxEuz6gO6hcBcrE0Olu5c9pbaz5frFEO36Z7JAbV2vg6yavlqV3GlTQx4/gwFTs0CAa04VMFa1O19P0km+ateMhDJCniPaRfGps+R6t1s8N2O4ND5DI5VEOCzWTxt8GHtkxOwU7UKPA7gu89HwPT04deC95XeieDzpyWPpNjDxldfg4bVNuMp8tMdYQGr1AuYZ9A02Stc0d1x/TF1ZplGd1u+URemCuZ8QPIHhTv2LXvDEvTNTzwRwWeOxudk2JDKaNriE06cTmxHPgGB3npU+2+ODDqkqaExEsWNlpAyKD+3/JdWokfXAZNHXyF9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA0PR11MB7329.namprd11.prod.outlook.com (2603:10b6:208:437::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 18:08:19 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 18:08:19 +0000
Date: Thu, 9 Oct 2025 14:08:15 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe: Fix copyright and function naming in
 xe_ttm_sys_mgr
Message-ID: <aOf6DziReTI-l8MH@intel.com>
References: <20251006201339.2603160-5-shuicheng.lin@intel.com>
 <20251006201339.2603160-6-shuicheng.lin@intel.com>
 <aOfMyuuHVj7hIP5o@intel.com>
 <DM4PR11MB5456ECEE94845266FA13734BEAEEA@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM4PR11MB5456ECEE94845266FA13734BEAEEA@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR08CA0028.namprd08.prod.outlook.com
 (2603:10b6:a03:100::41) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA0PR11MB7329:EE_
X-MS-Office365-Filtering-Correlation-Id: d6928a92-8f24-45d8-b229-08de075ed358
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3/3rr9YfNU83a3hEtKkuNvAsDG9Q4URWu04tR6S6u2ONC3HFv6Cb1Wj0nxY1?=
 =?us-ascii?Q?bYTWttmJhJ5JPI6exSa7eYzdxmttTKu3p8ZsilH6sQSiHmeO3JjpxVjUuJLu?=
 =?us-ascii?Q?VqSLx9XpEqz8K4GRtQvwubvem9RoIBi1qGqBsN9H/J2Xbn1TS+IUwXVC8wAW?=
 =?us-ascii?Q?AB6zyvg/W07bWlRJnADU/stabNKYAwRxkbOZmwMCxKZ/cdFo6N4vSrBxnWjy?=
 =?us-ascii?Q?U7qV+tLYYoy0or/x5DLqUHK/d9c50s94xzfY9wVCPy5wGVXM2HeOm4FBrwan?=
 =?us-ascii?Q?DCfLGEoJXsHtYaTmZAQulNT/TlAktiTs6bk/iDn3aXlefln6YwKeMhQG1VFt?=
 =?us-ascii?Q?CLyrgxv5z3ocEO9AMwYTzzvQoxyuNblvjST0dIwm93EpEfTbadKEmb5v3MGW?=
 =?us-ascii?Q?/bq2OK6f7CRunda2EzL+m1zG7/y2byZ1audCEHfwww7wg1bP6kvEG7ARCzW6?=
 =?us-ascii?Q?96l8T+irMlJcwNS+SFHcGqR3RkINlXQKfeqLjdvubeNYmm4LjaOvHC1oYkmf?=
 =?us-ascii?Q?4jKwKD+Wl7+CTjJ8eBrZNtjjXI4tcORqhgbzqLRBmqaaR8xvyGzCMf4poJ6V?=
 =?us-ascii?Q?w5s1h+iGdNCJhKZ6WI8/d1j36O4Asihh9eHKkfKcoDFND5lZx7mnnUIVPO2K?=
 =?us-ascii?Q?d1KIgUirzgWM2ZStZzQUl2b4RdzkTrjj/yPeR6ghmy2uN0p1TLs9ZW9cAu4F?=
 =?us-ascii?Q?2xskwfYLlSFOduKGRPUiGA6I9J0hqhPh9HtZnqVNY3iuv5Uf0oX7UIcY+h47?=
 =?us-ascii?Q?5WxuYyXeL5bwY+1RP2ZJpaJSCOnjq3P+dDYFOGELw0mG3ab9lTJnYZkEbkdp?=
 =?us-ascii?Q?S2cUS/pjzHGPk+sflvx7sdQ0ZNXfT3mLGAWhx/9kTRmZuRMYUJIXwOh6BjQ0?=
 =?us-ascii?Q?jROPsIIH20GJPcF1VTnfEK9tFio+IgynCuFGXBni0VzvMaiCCGoOaTQkawLd?=
 =?us-ascii?Q?KQKWRzKwKCPr3YGr6HpYjNOHAk3So6sjzvQczPGwbk09E/hCjPTuSbi23QWk?=
 =?us-ascii?Q?E8WHLMBwXTvzKnijE5vtxpsOZVCS91LSgpoldWUu5IBXFSO7usAy9OJhI5jV?=
 =?us-ascii?Q?Qpt6ljyK6jVOlEEUU1qtQoFF52BQmeSHyjaNmw1n3jHtJsOba2L6TY1SVT69?=
 =?us-ascii?Q?qdGzcNBiSmpispaIloSXpgEaml1oc3QK4AscRoHQWBmWo5v1QKBfb9k2bKQp?=
 =?us-ascii?Q?Sr1eAUO9alMzux0iVC53u2o7DbA2/FwZjHLhrpUCJujwZFZ3AByVHSVMpHgv?=
 =?us-ascii?Q?SWZUMmPfP+bT1HD/1OrcY0YUU7++0NhNkB4Zt7J7kOAfhHGtiZUwhcBT8UCO?=
 =?us-ascii?Q?FxBLDDQHMfWeYZNoD5sPKIwMNdZBS6oTP8AD02HyUJmWPxgMcGbsf0SsQ9i1?=
 =?us-ascii?Q?ffgeMC2xcxNklS3H7zcIZPgciphiZtp8qZhA1GLMan+Kgi5qD8XMpRScuPM6?=
 =?us-ascii?Q?jFSvaAVQOUdMrcDNi7HADaexVcITgnd2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DqntcgYwp84ZybqUa9Yzo4SPSHdpAYO+Pk96PujXgW1vQKr/DXGN1m2/ny1j?=
 =?us-ascii?Q?BKu7Xpe0dgJP0YbB0itJLOI+9dymD4PzJEk6iqSBGZa8sbDxZxSFd8xQPyXY?=
 =?us-ascii?Q?ED3xVeWOFV0OofVs2pgBfLtc2y/puKlga+31ZiqvZhn/GACXg2mc1W7CAHWw?=
 =?us-ascii?Q?DYhIttkYN6KWM7n70EFFAgISUDq7Wv60iowTWt5jz1RU+3lvXOSNgWZ/hcNp?=
 =?us-ascii?Q?6c35kp1MbmdRa1FngqDUwdxMLzWTim62AI7ejG8szSXGq/GimTqxwtqiBTg9?=
 =?us-ascii?Q?5lxd/BzjcKcXHhBqU76G/9ErlxT3rLrSPURFtAQkqTtDkSQ64Vr7rjTrNfdI?=
 =?us-ascii?Q?XV7+y8U5Hua/WB14M6OFP1VlDsu4xnMyPCBmQ73FwYQkskP9le/+vYe1kyZv?=
 =?us-ascii?Q?ADUa6gYnqGihFCUSag3DtimrZSroDfN3BqG7+n/6ISW4baV1qNSOMd4TlH2N?=
 =?us-ascii?Q?EY/tc5n9J/KfPIMmpPDCRaArpr8MI6FbL0pwjHjas/C6T/ZS7AjIqh36KjOc?=
 =?us-ascii?Q?bqosco4d5x29/80lEE6EfKQktlQd+gVdihec1/5P/c+ADF9+gyG0hcJIAJhR?=
 =?us-ascii?Q?WeX8RUpNPMnTCI5T+Q3ng8sYUlKz1I2E2oea1JWbCTRSNtUCw+57bf3mg4O6?=
 =?us-ascii?Q?O2Lur/9TvmPsPentLwKRalEcVBUiouI2A4vcaeCvDXwwyi3yoJPaROBOUICs?=
 =?us-ascii?Q?sb5eH+2WTVH9BI5bibG+JFQaC8TNHmvhUf/M/gGkLHkJFnimr5ZbPSkbiG9L?=
 =?us-ascii?Q?gyTB1VmFnoTqAXr5o6Uqx5a6dgN2QaByz6A8EPFgDcHQIfYgBQqg9aTVvoT0?=
 =?us-ascii?Q?HxVw+cLjjMqI/syV+yiVI1FGzPnfSd+ywS1aOkrfsbn4F5PyVQwebZztGKDZ?=
 =?us-ascii?Q?QDytLFt/xoiYS47oLXadj5syRLwnYczsJEzL5FOYTb3SjhYQ2nxKm5glrnvy?=
 =?us-ascii?Q?sx+h9GpTr3v7QQXGLGnbVFrAXKA5LQEFedenH6qqA6JahCfmKyoL/uNGM3YF?=
 =?us-ascii?Q?h8PwC9sGbAaNeauBSsA1gYUTLB7YdPzRD67FuqOE/viDVna4evLObEsubOWd?=
 =?us-ascii?Q?Dx4/5S6uD1UUrRt74z3yzJUJAh8vVu8PB+VzhZkW+31/t5HS+y+W0gxloEST?=
 =?us-ascii?Q?w50ZyRIyAen6nMfurZeD7ZKIEbA7lJjRtL6pIYr1/ltL/P8TUWkvygEeIXWu?=
 =?us-ascii?Q?PyKrYi79b8Hy7Mjcr4sSn72q2gk2bTzv7jqx+uYAwh0PNddmcBAwwEvp6Azy?=
 =?us-ascii?Q?/MaPKkymy3LII8yEWHRSR3p7qV22EK6HBup1POGc3YE2B8I4/3hQcUzEu3Od?=
 =?us-ascii?Q?9SiSsF+gYBmJXFD9et7BkwXUHUH3vatQYmxtmLW5mSCUfqBz6cUTrdh11w0K?=
 =?us-ascii?Q?7g2jI/d6y5vvq+9Ldz3ZWcA+d1JydMUmh2sMiIRs08kTBoRQuqR90gzMdUoc?=
 =?us-ascii?Q?CGxt9VI/93HvYSGrI2W1qnC6SxAKwXPUIZLCg3xEhFZabpIw6SZjHvpw1Lq5?=
 =?us-ascii?Q?4WnsDoWWvXaJWA7i4RQMN5wfgLkalb7bhoJ4C4hveEwAXTzRWFHXuwhMz4NI?=
 =?us-ascii?Q?GLfW6EKTtSLGugvXHDQbVwNT9TWebfVoMEVYwpz9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6928a92-8f24-45d8-b229-08de075ed358
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 18:08:18.9989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JSbImzJ3iiLRxgJnADzoaIYG/Pw1SeNWk95T4zemGYC5J4ycIycF+bovS3mGDHQhOqQr6W8id/VRGDc+HDMyGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7329
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

On Thu, Oct 09, 2025 at 01:53:06PM -0400, Lin, Shuicheng wrote:
> On Thu, Oct 9, 2025 7:55 AM Rodrigo Vivi wrote:
> > On Mon, Oct 06, 2025 at 08:13:25PM +0000, Shuicheng Lin wrote:
> > > - Correct Red Hat copyright year from "2002" to "2022".
> > > - Rename ttm_sys_mgr_fini() to xe_ttm_sys_mgr_fini() to avoid
> > >   confusion with generic TTM helpers.
> > >
> > > No functional changes intended.
> > >
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > 
> > I think you had already gotten a rv-b for this patch previously right?
> > if so, please add it here now as response to this email, but next time add to the
> > patch before resending it please.
> 
> No. I don't get r-b yet for this patch.
> There is another patch with very similar name and already be merged.
> " drm/xe: Fix copyright and function naming in xe_ttm_vram_mgr "

doh! and I was the one who merged it! :)

then,

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
> Shuicheng
> 
> > 
> > Thanks,
> > Rodrigo.
> > 
> > > ---
> > >  drivers/gpu/drm/xe/xe_ttm_sys_mgr.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> > > b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> > > index d38b91872da3..3e404eb8d098 100644
> > > --- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> > > +++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> > > @@ -1,7 +1,7 @@
> > >  // SPDX-License-Identifier: MIT
> > >  /*
> > >   * Copyright (c) 2021-2022 Intel Corporation
> > > - * Copyright (C) 2021-2002 Red Hat
> > > + * Copyright (C) 2021-2022 Red Hat
> > >   */
> > >
> > >  #include "xe_ttm_sys_mgr.h"
> > > @@ -85,7 +85,7 @@ static const struct ttm_resource_manager_func
> > xe_ttm_sys_mgr_func = {
> > >  	.debug = xe_ttm_sys_mgr_debug
> > >  };
> > >
> > > -static void ttm_sys_mgr_fini(struct drm_device *drm, void *arg)
> > > +static void xe_ttm_sys_mgr_fini(struct drm_device *drm, void *arg)
> > >  {
> > >  	struct xe_device *xe = (struct xe_device *)arg;
> > >  	struct ttm_resource_manager *man = &xe->mem.sys_mgr; @@ -
> > 116,5
> > > +116,5 @@ int xe_ttm_sys_mgr_init(struct xe_device *xe)
> > >  	ttm_resource_manager_init(man, &xe->ttm, gtt_size >> PAGE_SHIFT);
> > >  	ttm_set_driver_manager(&xe->ttm, XE_PL_TT, man);
> > >  	ttm_resource_manager_set_used(man, true);
> > > -	return drmm_add_action_or_reset(&xe->drm, ttm_sys_mgr_fini, xe);
> > > +	return drmm_add_action_or_reset(&xe->drm, xe_ttm_sys_mgr_fini,
> > xe);
> > >  }
> > > --
> > > 2.49.0
> > >
