Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E85CDE00C
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 23:12:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC4F10E18D;
	Thu, 25 Jun 2026 23:12:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eh2Ys6sf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA34410E18D
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 23:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782429147; x=1813965147;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+tG/U9OSH3pumLpFlDRtM97x6Eom8ZoG/cOqEtPdEd8=;
 b=Eh2Ys6sf5WqyM5JyebOsLOQnoJ9t39hx0QO/EzlZuCb8P3e6mwQmlq3i
 31j0kgerTeLBJl+W//DeJAQldmUtEdTYJjCvLqQ122AbHDtDFbmkCDLfq
 bJQuaFGteVNad0vWhSMmpJQQTyrn9hW8gFk+NDAInVxBZFKtY0e7yvC8Q
 Y7pwE6MYyETDGytXeQakW/7ki3U7k8NkTNEWjio5DUq26hHMbQ/UaZZJ9
 X6SrPtAIMibYSlO1JsckXO8zZl56vi0DhBkgEODZTXn9QImrSI+JrIUEy
 C5piRBpGAm22L3LF9eLcjPNvRiWx7FEKd2tSZtsg+RdipBo8T2g5JtH5Y Q==;
X-CSE-ConnectionGUID: Mw/VP8pDRxW0YNSacyEzcQ==
X-CSE-MsgGUID: faxA6XFnT1GnlCt9fGDG8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83284102"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="83284102"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 16:12:27 -0700
X-CSE-ConnectionGUID: nPb5ZVrZTRCEKKU8pg1BuA==
X-CSE-MsgGUID: F4Fr6YsfQfefYRFdiXJlzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="255135795"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 16:12:27 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 16:12:26 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 25 Jun 2026 16:12:26 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.23) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 16:12:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Upca6LWvzKKM/drkW6YIKzLM4+lAvf052K3cFS249tdagKjWHxSm+KzyGMUoaIP5ICvccB8PycJ6KbA8Oa27Y8p8LMOzUjj1Eor3mqR/cGRDRyKEDR83itc5OLVuA8cIGE8VYa1xcbXZe67iBzW/A+QYDoTRRC6uinPBYH7/1x1UALTe1FoXaz6Q4MhQyk5Y1TyBEwbZOgMzL4rZOH1Gdp2qaAdTDWil+2P+PFwfLc6mcdwsHBHem3I5cSNGA9IEJF7bQ/kW9ajcRrM+VP5GwXRvqeT955at0HgoID3dKGb+PKrqJJPEYc5N9UvChR0NIG+19D482OoHjW4AH9Jlng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cnN1gIFFGXRoko8mYYoClTR2GISPENaG1Qs4f7lu4Qo=;
 b=Z8FlF5Yay1d7EHkE4LayB737FnqvF2spAuM67oM71CY55EyNi1n8XYtNRzAfc4zCi6DgMsQ4eqOoFaqPnqk+PSBXFGPa1S83gv1sS+BFj2/OJxh8cWgKArrQgsMYtnk3ZL0qgYwTg9AprVio/WCPtPwwAPpLCJit4dUkUgpQYXhzwsKqGrIxKiHIxmIbwlVx1mkekc90r3iEjvOv5O6dQQukfYZcJGBbyEq25fHMbw9OoEsD2nQGpI5uRqmWsnA4VeoZRwJrIughPpUzcOFJnY+cGO+datdHfC27xlZpB/2Da6qmQXCUTKcoPCD/0aBCXeOrnBUdEgHskwMHdkmQPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS3PR11MB9795.namprd11.prod.outlook.com (2603:10b6:8:363::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 23:12:24 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0159.016; Thu, 25 Jun 2026
 23:12:24 +0000
Date: Thu, 25 Jun 2026 16:12:21 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 4/4] drm/xe/oa: Stop whitelisting OA status register
Message-ID: <aj211R3NTWPh4Rtw@soc-5CG1426VCC.clients.intel.com>
References: <20260617015422.226177-1-ashutosh.dixit@intel.com>
 <20260617015422.226177-5-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260617015422.226177-5-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0291.namprd03.prod.outlook.com
 (2603:10b6:303:b5::26) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS3PR11MB9795:EE_
X-MS-Office365-Filtering-Correlation-Id: ed4e7dff-f186-4e20-af6d-08ded30f3741
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|22082099003|18002099003|4143699003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: DuTMIr95zI2dulO+FFQ9aO+QjgwHigceJE4j7kT3deJhh+b05dvrHImsoAMNQ8D7diW3zldMlQed4muhlXnitcurIIzsLkOrjM9rma6zVn+kHoiTg0FY2hPcTTYQ0kVoHIj8pI+u64N+8dljSi9aubvtSECP/kZYBQlwlYM1ySH44CJIl1ht0rddxslMU6atHGSzmIpl2bGmBswErVKWUYdeJAmLcZztcbdrMwXGBFUN1C7iTMhVXPzEfYYBzP6R/qo3FgOeseF3JQ3f7CoEu8N5J6firC2O4XV2XNwMhkXD1WGjy3gwdSnKN1L7o+OnygoxWDviHuSvrxIVTH4thRXER7QsCSl7DgDC874dFOhMNOcqJ1OOEAY8vG2mjKzUy0YVbM4PrqJ57/MS4tQ0vwd2jwk6LYiluz+14zQYvjD5X5elDGDQXZZ3XzKkeb7Yf9LwMNMH77bMiaep9pFP72pycY48Clg0i+IQ1QFFUHEPk/yzRJe3EoMJrcVrR+yw01ZcZb9yAyFXxQvJ0k+KGtMBa+PlHBhVv5vIRjG5/o1T+gqEwN6aMjgZsvqRrSJGFv8m48APL+ZjsFN4tuDCO+6+d2/JFP3tby5qr+LV4uH9mOUZe0R3jDct+3DRu+EKQq0Kk8y3WPp6srcMmttqJkR3Iz/bMtekpyavPsTeCqA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXlkTW9IL2JKanNQcTc2M0t5WWJ3UlVxZDBHK0RBWXJhVGpMSWx3bGdONDJJ?=
 =?utf-8?B?TWVsRUcrRUdlZmcxL0xlWG1WK3NzOEpjTlFWQko5SG05VWVON2U0ek5BT3pO?=
 =?utf-8?B?aWZFV2N1UXg5MVVzVzk4WnhDTTZjZVJ1RlpTM1BlL0orMy9sQkN3MWVzR05V?=
 =?utf-8?B?anJMcitvYXVjK2tnKzAzR0pEcHR0WldyNzVVRmdpdjlhSUsvdWo3dVJHODhO?=
 =?utf-8?B?S25LbTFSNmI3NVZZc2xUSVdGeHZHRmhsZUdVbHlmYjFQQ3hSdlNyR29iZ0Ja?=
 =?utf-8?B?Y0IralFHemZvSTBnQkl4WUhzMmJwdHd1UWtsSXMzSFRKcEZ2c2JyVlhoVGVi?=
 =?utf-8?B?c1JoT3FjYjQrZWdJeU9iOVpRSmtsYjR0WUdOdERXeG5VZEd6eHdQWnY5MUw5?=
 =?utf-8?B?ZzRZNVdMMXM5U0xmUEpaMmR3NHpZZTBEYmg3QjVxWmpMakZtL1BXMXplYm45?=
 =?utf-8?B?TlVuZU5pcDdYZHEzaTE5R3hkelVpQ2VjQ2dnTGpBRG44dzRXWWU1S20yaEs4?=
 =?utf-8?B?WkRpdXRKT3JxWjhVRDhOby9zY25SSk5rM2FyRGpsRDJOdCtBSTIrZXV0Q25n?=
 =?utf-8?B?QTlPOEo1aVA1YWVTMEZlUlFBaS9qZzc2N3FkQVdYb25pRlNXN0VOano4VkRH?=
 =?utf-8?B?cWlqS0R5RUx4TUpMYkFJUjhhZHdESHYzTFFWYVZaVElYRnpKb1dJTU8zZXVj?=
 =?utf-8?B?WFljOHpBZ08vVHJHOUk0L2x1QmlYRkloRGJmS3FBMU90MGRUcXpZOVIwZjlu?=
 =?utf-8?B?eG4vTS9Oai9HVVBBblZ3R0sxdlE3eUpFTHExeVBjNWY5aGJQalRVZ2lqd1U2?=
 =?utf-8?B?MXRxT1lkQytNU1VrdGI4b3lJdlVEY3h6aUszQXZLRy9ieUFlZzdHaE1DaWJ6?=
 =?utf-8?B?bzZIa0ZjM3RtcXlPYVQvak5UMXMydDFsVmNPS09vV2lTaFVpTytQamhBRk5w?=
 =?utf-8?B?dWY1cHRDbTRHZDhHU0trd0hIcEllL1lxME5wcDdzUU1Tb3l6ZEJpV0I0Q2NG?=
 =?utf-8?B?bndLb2pMQ2NRSWd5MThzTi9aQS9MWDlZVzE0SFd6WjZFUHQ1Umx0em13aDVn?=
 =?utf-8?B?RW5nd25Ca0xOSFZzRzh3dVl5NDlhb2c2UWp4K0t0SWkzZ1RJWk5JOEsySkZZ?=
 =?utf-8?B?TTlYMmlMRGdGMFhHak9ock5CNXg2RVJjQjNYdnBjai9lYTRhTUZ0cWxBZjVz?=
 =?utf-8?B?Y25PeUQ0ZVJaR3JpUExvZFdEZkZMVnMwbkx0ajByYVhhcnhCVFVpQ0xWQ2U1?=
 =?utf-8?B?amVSVzB3dWgvOGRWcVJvOUN6WGluNEN3MXpLVmZkaXZKSWZLL280Q2JQTytE?=
 =?utf-8?B?ZlBzNDg2ampRODFoY0x1K0J0Sis4enVLUU1NSVN0cjByQ0RKck5qT0RobjN3?=
 =?utf-8?B?b2pVajJXb1FIYjNOZWRlaHRwYzJRZlJlU21XUHFscHBNM2xIODFDQ0lnNllL?=
 =?utf-8?B?RTdLZC9xRkNXNm5WeWJjaEdGckhHOTRpK1Z2SDRtclpZc0Q2a21wWUJSazhx?=
 =?utf-8?B?NS8wbjFHM1hOMmxBeDdDc1JXc2hWZTB4ZDdBWGF4R3BPQ3VXaklmZjZ4RWhy?=
 =?utf-8?B?b0JDSmg4SW5GSkZjakYyamRGaW9mSmczNjJaV0NnalVKZGFGK09oOGR0alRn?=
 =?utf-8?B?UUtrUW5XelJsZmt3QjNaU1NudStZUWdCSFAxenFyODhma1pYTVlLWSs4emVv?=
 =?utf-8?B?aFBrM1VqWWFYNXl1N0NQeGxRUVlRMGJRSysyWlFnSHUvZkkxSkQ2Wm1WRU1o?=
 =?utf-8?B?OWpyYWZWeXd1enFkQnJ5b1ZRWnRiaDBCU1Vsajdna2JlV3kwQnFEQ0t6aEds?=
 =?utf-8?B?RmpIMVMrTGE5NnVTanFKMjg4MDY1V2hHd0JodVFndWRpZURXdEFPVDRIRDNH?=
 =?utf-8?B?VTZYbytlVVpEV2tTd043aWFlb1VNb3JJQnlOVVpQQTY3WklqVzk4UENoeXNh?=
 =?utf-8?B?TndhQzNGMlR6ZzJzOTQ1K0VaNXA2b3pjZTVxbFFlR2FCMXFyVTZ3NGczQlB1?=
 =?utf-8?B?T3V3SkJxZ2pJWnBQZjM2d3IwT3pDQWFiSTlPV29RSTdSWXBBak1xTTFlRlAx?=
 =?utf-8?B?Q2lXZTY0bWt0RG5qdkpYeG4xdDRyMHY3b1dORFdjSFRQNEpmdDE1KzBEckJB?=
 =?utf-8?B?QTYvakpoTmJVdFBGVytWVUllUURWdjIzTXhVSU9kdDhsSmN0cVZzMlNUNUNX?=
 =?utf-8?B?YjY2WnVHN3o5Q2RLbzk2K29yL3Z1ck5JQURKSTBKeWhHcFZSTmtaazA3OVNQ?=
 =?utf-8?B?Yk8vV0Nkb052eFl2ZFFzS1ZvSWFYUjEzenEwWTBDNHFFbkRJWXFwVk5SeHZ4?=
 =?utf-8?B?WDNlRWszT2ZvSld3Vjloa0ZJM2tPU0lnQ1pRbGtPZGVvckhCNlpvMUVaRm9s?=
 =?utf-8?Q?hKpZZ3loHe8x14mo=3D?=
X-Exchange-RoutingPolicyChecked: k3iIzmFTqq6ttRzAMvBVNZrk2zr+MtBxYNnmCTg+gY0UuH6PCQkPdp60CEdiGo4gbjOQIdqUExkNQ9Q4zXh9sR4HQb4GW/oDFYbpi/lORgFHGfv/0zF/QhgDVyRvWWv7QhcxMEL0e6oXe0TiMFiVKhQ0EwNwz6vGn+n9zG5I4EkSW29g0+fDt1od3G5K9enQC2WZlcJFLaSYzsUt8C4EssGRcaVob2uyTQ3emP1tukkMTvDxEQ9563MuGmTO8rb002VAQWp3/lolWae27vut86vm0OdhxvPUW0QB6IMFTw684AXZ459ORGyx32LiAvO+1X19/KbDn4oqxcwJ4u1FSg==
X-MS-Exchange-CrossTenant-Network-Message-Id: ed4e7dff-f186-4e20-af6d-08ded30f3741
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 23:12:23.9392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OmiJaHhtSkEB8l/wzxGHEeg0XLa/f6RBmdWSxsXZ1aG0PD13xYkR7vsU93fUAfPCbfkA9dA4YlNeKyfOyRqJYDcg0RbuGWXyL3efQuyYLG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9795
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

On Tue, Jun 16, 2026 at 06:54:22PM -0700, Ashutosh Dixit wrote:
>We are now providing OA status through DRM_XE_OBSERVATION_IOCTL_STATUS,
>even for mmap. So we don't need to whitelist OA status register and we can
>save one nonpriv slot per OA unit.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> drivers/gpu/drm/xe/xe_reg_whitelist.c | 10 +++-------
> 1 file changed, 3 insertions(+), 7 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>index 880079473c26b..c07e0a38c0a4c 100644
>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>@@ -104,27 +104,23 @@ static const struct xe_rtp_table_sr register_whitelist = XE_RTP_TABLE_SR(
> 				   RING_FORCE_TO_NONPRIV_ACCESS_RW))
> 	},
>
>-#define WHITELIST_OA_MMIO_TRG(trg, status, tail_buf) \
>+#define WHITELIST_OA_MMIO_TRG(trg, tail_buf) \
> 	WHITELIST(trg, RING_FORCE_TO_NONPRIV_ACCESS_RW), \
>-	WHITELIST(status, RING_FORCE_TO_NONPRIV_ACCESS_RD), \
> 	WHITELIST(tail_buf, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)
>
> #define WHITELIST_OAG_MMIO_TRG \
>-	WHITELIST_OA_MMIO_TRG(OAG_MMIOTRIGGER, OAG_OASTATUS, OAG_OAHEADPTR)
>+	WHITELIST_OA_MMIO_TRG(OAG_MMIOTRIGGER, OAG_OAHEADPTR)
>
> #define WHITELIST_OAM_MMIO_TRG \
> 	WHITELIST_OA_MMIO_TRG(OAM_MMIO_TRG(XE_OAM_SAG_BASE_ADJ), \
>-			      OAM_STATUS(XE_OAM_SAG_BASE_ADJ), \
> 			      OAM_HEAD_POINTER(XE_OAM_SAG_BASE_ADJ)), \
> 	WHITELIST_OA_MMIO_TRG(OAM_MMIO_TRG(XE_OAM_SCMI_0_BASE_ADJ), \
>-			      OAM_STATUS(XE_OAM_SCMI_0_BASE_ADJ), \
> 			      OAM_HEAD_POINTER(XE_OAM_SCMI_0_BASE_ADJ)), \
> 	WHITELIST_OA_MMIO_TRG(OAM_MMIO_TRG(XE_OAM_SCMI_1_BASE_ADJ), \
>-			      OAM_STATUS(XE_OAM_SCMI_1_BASE_ADJ), \
> 			      OAM_HEAD_POINTER(XE_OAM_SCMI_1_BASE_ADJ))
>
> #define WHITELIST_OA_MERT_MMIO_TRG \
>-	WHITELIST_OA_MMIO_TRG(OAMERT_MMIO_TRG, OAMERT_STATUS, OAMERT_TAIL_POINTER)
>+	WHITELIST_OA_MMIO_TRG(OAMERT_MMIO_TRG, OAMERT_TAIL_POINTER)
>
> 	{ XE_RTP_NAME("oag_mmio_trg_rcs"),
> 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
>-- 
>2.54.0
>
