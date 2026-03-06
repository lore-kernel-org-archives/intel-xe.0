Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1ABEF513E9
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 00:49:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915E210EC95;
	Fri,  6 Mar 2026 00:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iRNFYTyu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B236F10EC95
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Mar 2026 00:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772758196; x=1804294196;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ry9KKtHEiN8EL93kiAYmMZ3WEylTIaAQf88AmAS1NKw=;
 b=iRNFYTyukyZjLkSIeSDMk2UMCcs2hrWFMgIe0kko/pjjTto50Cfs8cSr
 sJawWuC/4sOv1HOBYAwhn2ekP1+WCDhrBuY8cC0pkm+naVxRQfAPWgN9q
 DBMfOMMTjd3u773LGp3N7x+oLCpYg+3aR6dWI9qyGnkzLGisagF6GCnim
 rTpJCRrIhfqtLnFL6BhmlcZ3UznNHtMnodK7FVsPm4qCFvx6ssM3xbRch
 gIBnt/wekm+CSkHlrvVGGHnv4HqgFwdGn73K8VrbPNbnBDRt4rEoQdyvA
 YsmyqVjkJErtlF6XSAQhPF/ljKgHmKOBxF3CXyYoMLVuYTHa1lAkjjoNH Q==;
X-CSE-ConnectionGUID: X2CHB/mETlW6eeFGXEGmtA==
X-CSE-MsgGUID: EwmxdN4/S8qnNzxgJAb5ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73777836"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="73777836"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 16:49:55 -0800
X-CSE-ConnectionGUID: rCrTwhK/TRuZWnOumq93Vw==
X-CSE-MsgGUID: bID/qnXOQPSSU9yDDCvWrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="215588410"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 16:49:55 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 16:49:54 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 16:49:54 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.8) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 16:49:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BJIM5V9iOXc1/mP61zSIyyQAOy7piDbSfPaxF8eoz4JEWfzMAJ3qdifTBBrSpStNaZ3wQHHKkSeMkuuLpgGkJspXiRKrbkUBqZsZG1aGxPDjdRyblm6rf6g+OIJvr+u6Nj7XALP0jA+/vrSZTR8dI2QCD+vU2QaBmHIf6ogzUm8k5pvJ/xFRUgqYOzDcKWDfQP3iIRrgg2JGa1zsBW1UN/Y52oXhsTWAAAum0rrHBdFXVs8IEMXFqppmHZ5K4UIF4cRNq4uNysh43CtQ7l5DH71/qV73Gh7o5gckc+NpaE4tTo7f61hZe48BidcjRzhIVLT7bYh616cCOpJUtoWIIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LuZ79Sv9mT05/PDUFlXgsn478tzWgSeemB2gL8BACew=;
 b=eRXwzDvUCOYc5Fgdm7jrjO4qmK9HcolhFtoRLPoIinSHo5GGrbfboMy/8ENTLo8HF7sO9s51W5YRAfKgV60gUarrMXTbjY1sGkq1Yag1UdsU4j5GTbF3sieZZG7WxzIkS66PMZxuZufOK6vwMoIl6Zjn30GFtPn/A1d0txq39lQcATFEZ1iEdOMZNMJBJ7meZtWSjYDyGCMZpV3V8QJMmL33asP/JRKeO3oRUffPyblBCt/5Ux+NzT3hJwqfl0LBX0c/qOqPX30gDcZRH44CAjT/wjCAXzJ06uQGCj1aLi7Tv/No7PWmqTIx6GL3wTJMfdBaLHgDByLOdNtGq2Bc3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB8667.namprd11.prod.outlook.com (2603:10b6:8:1b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 00:49:51 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 00:49:51 +0000
Date: Thu, 5 Mar 2026 19:49:47 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Farah Kassabri
 <farah.kassabri@intel.com>, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Utilize for_each_gt_with_type() for
 type-specific GT loops
Message-ID: <aaokq4-hAJBv3VaO@intel.com>
References: <20260305-gt-type-loops-v1-0-aa42e9fc3f06@intel.com>
 <20260305-gt-type-loops-v1-2-aa42e9fc3f06@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260305-gt-type-loops-v1-2-aa42e9fc3f06@intel.com>
X-ClientProxiedBy: SJ0PR03CA0252.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::17) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB8667:EE_
X-MS-Office365-Filtering-Correlation-Id: c546af01-c4b7-466a-980b-08de7b1a464e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: OK+CAqBU00QLpU2QQPeLqn7RUJBZ+N8XF89AcSmEnkIw11AhtNgzcZs3bKrWI6CtgCQFrFInjjmeZFJQerwBpYPd5F5nsXttU7XxkRU9zvc/Q4qNP42rVNQE9BbxJBXIQR2+1LjsH5YsiSxf401r/Dcr4DWFlwG0URreSzgaUBhulk9Spjt/Zqvfe6TG6tfsB+oD6WFaEtlXlKQJYBa/WDaDX5XxupXU2D/jY0D8DKnBSZgIHkExHAYGu4P9KOzfrWF0STl1MFKmsGtrKbT4e0QKMNZFBK+Mt4bAS8EXFLGA5LALv7b/Yu+haBPrIFEVNMYiahGOiF5D3eXcg2uUwZtiL2h2D0cIcjybM/PFxVF4gnHROSHtNaqmPg+CXYQ94uVQVm3rQ+RUCHcAjCHAYFvRqccF71NTmoTmK8LTrKYoqY0WcdCJ9HA/CrklayGs1MjwWHnJ648sqqdLWvkbOGgLn8LIoYGrXDzA4E5WPOdY3I60D3/RpujHUxqW1L2SeIsBkwRjXfnoaaZZgm6b1hvnPOOwaIDyUZG2Iq7M0KqS0YIQ6uC32SQzxqnDB+X5iZnjNif19E6emfC9IhNOn8K/BUf9AYXM+x1ONYb5Y3WNcs85qa65RERjqth3bnYsrvSR3ylmeV1TLQJ8S77x55JLwYVnJf8zvHFe0w2mHEs0bjUQ9hCXk5XWsbTv1NqY+iJcRUB0699O2shWk0v9myQCz8bhJXnmGSvNiECFPqk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6uEoHEJD7rDgjvxYdxK8e5RXhUaMc/bXxaa12yWgwyTK/hAI5N0pcJa4vvii?=
 =?us-ascii?Q?MidKPEsgsSjwtRZ69NhDeiQMxuuazY863xVmNcLFy8OqXRhRptu/J/FBfD+U?=
 =?us-ascii?Q?DFBSi+KSiZ9jGRuwjB5C2p+q67zK6RAAU1DHVKO0f+xsDSv5mX9032187zbb?=
 =?us-ascii?Q?BTopIJve49EmQT+XvcBZcYkNen8X/U8HOGfmel/LROocvNtkJcfWJbEDa2eJ?=
 =?us-ascii?Q?UtHvGt+5oaxkoDTzy4zu0mRe/6hYMMGkJJXzjcFTbqXnexyY2rkZiBZtuOOa?=
 =?us-ascii?Q?RHmTeqKeX4mztLPSn4KGwHy6KnPMfSKg1nitunIj7OmHDvcOLUOIvfU2gCZi?=
 =?us-ascii?Q?BtL+BAkrYHyHIplBzNXNNfSi5scUAmQTWI6mjBA3ein69/Z6JV2DtUIPIvK+?=
 =?us-ascii?Q?oeI16p98zjlCiJR+qgheXV/v7YSLQH1WlyNdxFQBxjzuh8K45xNymsE7nt9s?=
 =?us-ascii?Q?rNB0d3h2uf0FEu7Bb+9IdWBcp2OOLb/oKNr3+2Kh5Cz7jYzQGHF/WBcA0VzZ?=
 =?us-ascii?Q?xLo0t+ua8/xntiONKWlzNhR7H/XUHkF9maeCKJaqWeWVPWYgVqPUQwUD8vzO?=
 =?us-ascii?Q?J7Xb5X9Hb264uAqUonKi91iDu1dSb9yKR6KgSj3mYfxs10B78J2j1f1uKgYK?=
 =?us-ascii?Q?HUYDXmCALiRe+hjsrxAQ+Qkyz1J5qGMk61Mh58RP8TQ8vTkMnBlKccnsa9t9?=
 =?us-ascii?Q?ndAUGLK7QJszsXqdCC4/EN+WcEtaU7qLFELBblIdLPVtPFtjvtWzDSXkOn4y?=
 =?us-ascii?Q?bc19JcBRw7yGQ6ltdr6LzuqhrkbvDlNJqyrDG+HN4O/D6SWlM26fkDKuXaK9?=
 =?us-ascii?Q?j3PE5XYVOuTHKRtOnPAh7x8X+I5IPVQqJDryrhSTVibRXqB++RW6ylEC97l7?=
 =?us-ascii?Q?zkBt/ngY7hBtZBe0oMd6P0e9t3xcyw/TYLh+EPhoXWDnNi/SJnzNRqR6UTgT?=
 =?us-ascii?Q?lC3EIQ0/BirOHgw1Z5viaUCH2tC3E1Zc0lx3lxQ1PDzLex5N9yUgbMI0hyq8?=
 =?us-ascii?Q?5D4HdlB1fg8INPsv3wwOmRIvlewCRAc3KfotQxRTrWOcVeX/5D3PDn5t8+P1?=
 =?us-ascii?Q?kWBsB5tv1hFYypLpMiMvLZmjvvp9FGiwcW2VeQ4e+do4mFpHEuFGTAtQ96Sw?=
 =?us-ascii?Q?mCSdv+khkuOlMHi4rLUvsFt0sDjFZfSnpzj9765Yt1bR2y5SgEiJsFDk2cqZ?=
 =?us-ascii?Q?8MuyJjULxNLK25x6NQL98Ylijci5XhqtKVuul09vt/DucdsZ7v4NsDRjbRL6?=
 =?us-ascii?Q?KttXx0h2Emyk42UjmKISHt4nLQZkUQNlvrdF3ROqAeiEF4JuDeVKwWR1Dz7e?=
 =?us-ascii?Q?0F9RooIlf0y4MO8tLIRKM7dbCYZz7eByNG+PQDw9PZ+ueJaVSgGn3lUiKb67?=
 =?us-ascii?Q?SeDbeGoPZtzEuFoLfrFNRFueKRvE8a8x8lLjJEFNph5AgOOAS6S43Ry8+Wnv?=
 =?us-ascii?Q?m9/+68ZSrQabRiin7W7Ae3mzaot45vv8/qfvnkA1eMyd75Y9PmkaUyL0GBC7?=
 =?us-ascii?Q?KDFkpN5+yGncetk3pp4jTuAA6n9sfjSU8vKLFJt01MgPGbeYW1y75VW1CIKd?=
 =?us-ascii?Q?DRfl4MBQJ4Cq6MCuliYUSYEFADmHXcV/YQuhakNrVWgYe6BgBq1MwHI7oJA5?=
 =?us-ascii?Q?lzP9yHdPYRNT6k1qlPKuqXa35Rbg/YekuErnrfoUZzWyGcTe5BYwcpnwtYnh?=
 =?us-ascii?Q?BQhVEpIz3qir5++lJ4WhntS/lafMm5R7cOPPvx07ijYcOWapCIdQSMpsEUye?=
 =?us-ascii?Q?J7acaMU2PA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c546af01-c4b7-466a-980b-08de7b1a464e
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 00:49:51.4127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lJ/s+iePTSRDLGwuDfxRAcBgDMLqRYWkXe0QjfkKJX0AAsU2VDXyuU/7WMk9vW0FoEzN7ddn0gi4YujM4Gc+ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8667
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

On Thu, Mar 05, 2026 at 02:59:28PM -0800, Matt Roper wrote:
> Convert existing loops with Coccinelle via the following semantic patch:
> 
>     @@
>     identifier GT, XE, ID;
>     iterator name for_each_gt, for_each_gt_with_type;
>     @@
>     - for_each_gt(GT, XE, ID) {
>     + for_each_gt_with_type(GT, XE, ID, BIT(XE_GT_TYPE_MAIN)) {
>     -         if (xe_gt_is_media_type(GT))
>     -                 continue;
>               ...
>       }
> 
>     @@
>     identifier GT, XE, ID;
>     iterator name for_each_gt, for_each_gt_with_type;
>     @@
>     - for_each_gt(GT, XE, ID) {
>     + for_each_gt_with_type(GT, XE, ID, BIT(XE_GT_TYPE_MEDIA)) {
>     -         if (xe_gt_is_main_type(GT))
>     -                 continue;
>               ...
>       }
> 
>     @@
>     identifier GT, XE, ID;
>     iterator name for_each_gt, for_each_gt_with_type;
>     @@
>     - for_each_gt(GT, XE, ID) {
>     + for_each_gt_with_type(GT, XE, ID, BIT(XE_GT_TYPE_MAIN)) {
>     -         if (!xe_gt_is_main_type(GT))
>     -                 continue;
>               ...
>       }
> 
>     @@
>     identifier GT, XE, ID;
>     iterator name for_each_gt, for_each_gt_with_type;
>     @@
>     - for_each_gt(GT, XE, ID) {
>     + for_each_gt_with_type(GT, XE, ID, BIT(XE_GT_TYPE_MEDIA)) {
>     -         if (xe_gt_is_media_type(GT))
>     -                 continue;
>               ...
>       }
> 
> No functional change expected.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c             | 5 +----
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 5 +----
>  2 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 3462645ca13c79b9cfed0de86cfffe150b51942a..e77a3a3db73dbf8509d857b58a2dc3964d9aa0ca 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1074,10 +1074,7 @@ static void tdf_request_sync(struct xe_device *xe)
>  	struct xe_gt *gt;
>  	u8 id;
>  
> -	for_each_gt(gt, xe, id) {
> -		if (xe_gt_is_media_type(gt))
> -			continue;
> -
> +	for_each_gt_with_type(gt, xe, id, BIT(XE_GT_TYPE_MAIN)) {
>  		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>  		if (!fw_ref.domains)
>  			return;
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index b867203b49977537a31c1a1780c0409d5541c83d..2f376b5fb08827d81a070735c4b4a35338723552 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1579,10 +1579,7 @@ static int pf_update_vf_lmtt(struct xe_device *xe, unsigned int vfid)
>  			goto fail;
>  
>  		offset = 0;
> -		for_each_gt(gt, xe, gtid) {
> -			if (xe_gt_is_media_type(gt))
> -				continue;
> -
> +		for_each_gt_with_type(gt, xe, gtid, BIT(XE_GT_TYPE_MAIN)) {

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  			config = pf_pick_vf_config(gt, vfid);
>  			bo = config->lmem_obj;
>  			if (!bo)
> 
> -- 
> 2.53.0
> 
