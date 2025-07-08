Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A321C83F09
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 23:22:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294C910E6F2;
	Tue,  8 Jul 2025 23:22:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pl3GSJFx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE4910E6F2
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Jul 2025 23:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752016920; x=1783552920;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fKqzpx/oq+wTOdBZ4H8o7pJU87QTrQdnEY77ha1FSAw=;
 b=Pl3GSJFxsn4Cua+va7+uvrgq7hDCUZUbkbOTFlEu53uZtpXlhbb6Pvti
 M9wJNsra4BWbjaU5smB0WtktbSynBMjsrgfrEQjwkxjA2XzlhgnxytUwD
 sFwGam5dK+Jw2LSNrmD2iovwly7hmk2N8r3mq7uO/K6lbmc1IYB0BHrto
 rmYf13EiGTEqc5Cu3LA4lB9hZcQWmcMy+f/ykM5i5k5u6cR8ySMpq0TBQ
 IMC9pnvMVLjbfNqbaIfeGH8JuC7VrG0jPYGJn0uVsLTRDEta3vKhUjWZe
 CPTgEuqkh2kKQS2rj1fj2IbdKEURYd6MXkYFh1CJWU/SJC7nuBwS+IJSx Q==;
X-CSE-ConnectionGUID: qSlZp9eKSeWhNW8RcCplkg==
X-CSE-MsgGUID: FauYLsIrSMGtvhW9RaK53w==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54411614"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="54411614"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 16:22:00 -0700
X-CSE-ConnectionGUID: CJcD4zPJT8mtSUpT7kiuJg==
X-CSE-MsgGUID: z3Ssrpb3Tw+q3pJ9DWGTgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="155738210"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 16:22:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 16:21:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 16:21:56 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.60)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 16:21:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OXAq1DL9Vh9pj3Ic/tOiE0Y/oOW3sspZB1UF8bwGxpcycM/r88iXmDEMmcJtBpkhVTRSWz4LQ1d9LQ1SelPHiK9IC4cDk1XfwYxoU4GKIVfX2u8CipTrHRwC9yEELOBCmx4KB5spGzYXU+oB4kkwpvw3HD3xrAmDgRe+jW+rb1Otk9F20CKHAXw5RmZmc4OZLFQI4pk4fpyvhOkt8epQ6VRz+l62d1VoOSb5uyTH8euZdyUxy3J6x/n2hQtJ8GNbC1cEyAH1u236dfc+M88HGKCw4B2NjYYg2S6/KKqZJxPXINJuJv0d2rhVH1PJw4Z8KD82RbRh3VPfBT9FM7cjGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKqzpx/oq+wTOdBZ4H8o7pJU87QTrQdnEY77ha1FSAw=;
 b=XgliawUmCH3XHcW1TGISYfu8xqvmPFCUAyqieM6F8ODqXPa9I8LsrloigekrcFbBItguwP/Y5YBVk3QMzj5YfUJvzW2TpDYnXMmH+B4/3LNg5XuwpfQ8W07iXCfsCzlUanEdN5hKGY+3TAttO0pOXcJqCzT32V0ytj3AJa5SJQ91ZaHgjLRS7CBNVWUNNO7clIJFSHm0s5ao8SW0jCWGspF1M+4Pta3i4xvmsho9lwhQRUChwv1SW5Ka4/jhMGnuZrbIqIEkOcq03o0zeZynNst1z4MqBu1+3lmBBIZxcAXi/CoLv1O8Sjdpsz/heUqZxSmQGJWAOh6xubhPAwetEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB7724.namprd11.prod.outlook.com (2603:10b6:610:123::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 8 Jul
 2025 23:21:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Tue, 8 Jul 2025
 23:21:40 +0000
Date: Tue, 8 Jul 2025 18:21:34 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v8 6/7] drm/xe/xelp: Implement Wa_16010904313
Message-ID: <nsjsykie3vxairexo4emiyu4ntma76krzknerwenbzzvzcyblj@3lnuuhfdbuux>
References: <20250703082059.61597-1-tvrtko.ursulin@igalia.com>
 <20250703082059.61597-7-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250703082059.61597-7-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: BYAPR07CA0009.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB7724:EE_
X-MS-Office365-Filtering-Correlation-Id: 25843a61-8925-490c-0e4d-08ddbe76316a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FvgTdIF71ABxw/cH1oCcC3VQRPkIXeeNPJ+AjwwjthZ9OXRw8ZJS1ED59LY/?=
 =?us-ascii?Q?7ho7LjX2rKDXCL+PEvJU5B22eVPYYFAAGuSEWPhq1RD0weezmQPWVAIsc9Q6?=
 =?us-ascii?Q?OLPTQ7OaAwdX0AuOP66hd8HEioDB8KjnATrLotxadysfx++CcwXFPPbJ/B62?=
 =?us-ascii?Q?Ggl9c6vydQ+EDQviq3jMxzTHcqf1LBo9ZUbamhzWqrYI+R5+dcrcXACbYsi0?=
 =?us-ascii?Q?UaHvHJ8TjsuMB0mE8WblEOa3Uy1DOJWbjAZo/STio+1dIda/iVbcS66SJlRe?=
 =?us-ascii?Q?XxfnF4yl+bs77GkBBEf7gbSYIzmvoy0UOU9X7jj3mf2DwOAd5MY+un8iaKZr?=
 =?us-ascii?Q?To4k93PU8bEG2GVPVkd0cQa9RRPFWlJHSpyoH7EGR+fLSXI9BfsfUTbOIu5Z?=
 =?us-ascii?Q?9mw3o2EQb6tlT617UjyX6+/Tw86WFg3mTJ3BPTp489CvY2hPp1Cn7vI7Oraj?=
 =?us-ascii?Q?lbQjfiy0321ltwHJGydSf6CDyyPZiijV1pET9E0uFEBNQN7c7sMXQSmlIpCo?=
 =?us-ascii?Q?kPF1dv42CwL8411KDwtV71mO9yEZO79JmEH1Lu5sg1AYzqetT3ULLE8PScFN?=
 =?us-ascii?Q?fI1acAw+SJLoz6FpNtgUVV93c4LDENQgi+LlX4EAplIs2XzEaHU1rV47AQPs?=
 =?us-ascii?Q?gaN4QNuVWPPBpKwv6+BvFvNxuO31mMo7P4nDAwekrTq0xh3Y8Hlz38Eioo95?=
 =?us-ascii?Q?u8cAxrYmmRecTr+esTuKTgz404AiT5ShKfY2qNzpfVHmRsugdeB3CTMPErwx?=
 =?us-ascii?Q?UGkYMmVQFWX6doYyLhqL3bGcUsokZWHnrnyLe5d0D6nigEW8NYv0q+HqzTKk?=
 =?us-ascii?Q?ZydFKQKeCgmMKem5xaJtDSH3UriILKLVlWrchu0PrsSxDzXnUB/RntjtMg+c?=
 =?us-ascii?Q?VDbnkQB/IvmHA+nXpwdEX7BEr/rkrInnP4U8ks59purOmgLTkAtBJbK7V79p?=
 =?us-ascii?Q?YRseTMIo3VFbFPlwoe71c7iKJPIL1qoecnrBxi/C95I1ge+Az4DuqvzOLlFQ?=
 =?us-ascii?Q?C0M/Ym+LpY+afemSYgrcpQsFBe+A/Pb9NsiDhB9V/RLFt/X5Qc3HHd0jYYu7?=
 =?us-ascii?Q?sHy6wKQ25o+IvDJ9l2LzpWGvE3PyjLCE/TJQMV4ma+/TLE9VqU4ulb0roWJN?=
 =?us-ascii?Q?IcAfaLSX6lgS9Z/CLKzetbYBfVURQjbVIMh6WAI0oEOFhiDfSZYfGSEadPFe?=
 =?us-ascii?Q?vv/MhDmNOAf55af4XwVRj4IEsFoZPZZPMCQxMUOyzEo3TgbaDX8DEyQxOKws?=
 =?us-ascii?Q?g3+wD1hO3XkWdbPT4ohzZm+QOKrxXQ8+g1G9kc0z6y60xkr1cW4SNw0aR+f5?=
 =?us-ascii?Q?4K3yEZB0Kq5En8d5H5YHJDnSzeMM2GYEFkcHn2wAkf/wGpHKkuD1AUYlxyEn?=
 =?us-ascii?Q?Ti4fuup59ITzXMdk6ZBiBgS3SHgKQSrmA9sFK3SlJyrXXHgcK1WjBv/me7dA?=
 =?us-ascii?Q?rT5MQSnZlmA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bV4RTLajBmbN6SW2f4W9g1CwCUeJ+CpwC3g/tRCQews/FKQ/4527myt/veHE?=
 =?us-ascii?Q?wkfm8JjGSpckgLMtcLEl1veME5Tw1LR+dnpLyIPvSPGTp8C0bwYvDHK2yDtH?=
 =?us-ascii?Q?Utn3NPXi0u1A+3csjzunCFTyEKZSoe6oQGgRBbJMDyIwNqs3/DAGDviLTu0y?=
 =?us-ascii?Q?+TABGlRv3q129YrmDz7L3E4ebgiY+z2TEqI5FTTJqFmXt/xp95yEZspwXbqM?=
 =?us-ascii?Q?elivKI7le2yfLbMzIw1Rma5Y+7BUo0ZZh/x0U9SVvByvixp+KwWaJ85lS5ue?=
 =?us-ascii?Q?2W/mSTZlASauaMa20KLpHRb5TjBWl5Zl9QuhtDd1xfvoBGBbKxacN1+zWp0j?=
 =?us-ascii?Q?EM8xOdiWSGguFRUKyRZU6NXOiICF5WJs8BB3QQOuccEdaeJ+HaKXkFrj1la6?=
 =?us-ascii?Q?8m0uWUY5ovWgd/pdtdkD2m/dcmI60VN4RK1Ro2E0g/RNZ97W9AB+N3esERP9?=
 =?us-ascii?Q?lGBIPjd5rEsdmEq1xZFQlHPIlZv/FNpw4ArIWg2hcBI9JXbFDRniItKC+U3k?=
 =?us-ascii?Q?rcQqjIjXrVuB/LWZB2UUaEDXDwbmjplYkovIhfZRUYubraA6IcvzgbmLoleX?=
 =?us-ascii?Q?9JMCAPVCn5bbi4R8ErrEjh51ucCp3Avmj7098SsK0uYQ3V9tfmzzKX/n5LgC?=
 =?us-ascii?Q?/gaZyk9xa6RXUXxK37eMuC41tjxrD6Su8VRCBxk62j14ROZyzE7Mvsv6qyze?=
 =?us-ascii?Q?ucSrCRborNn6fP47Hxq4h0gFuGg2XBcHYNGAoKHhFfbxu1e3pio13hTNQPDb?=
 =?us-ascii?Q?5A8PqR4KLrMnEGgCTIsqbOSF2hU6M7AI6EywDfi3fG8UVWPD9ua25rAWBrIC?=
 =?us-ascii?Q?kMnIdL+DIv2s/iMs9PIZLThV6OTEzIdIy77f7OsVV47K2wJjhbo99yLHXmMy?=
 =?us-ascii?Q?jBjcTfCpfdtV7VC6bOETOkiGTjpw8x9XX2Dmg1STgUOyOIjYDs3l+gCqeLvB?=
 =?us-ascii?Q?ZjJ+t7L9/OQ8225+k2pMif4Tipz8/HbXyaWnPbVgIaQyfSPam8hnMyUyJU7x?=
 =?us-ascii?Q?rxxiN9dWnMsACY+0BAX8zGyFudQdeJM7ejk86y1c4dlk28OaturNomgG2/nO?=
 =?us-ascii?Q?dGjspynClxiZYsl1OmFYB/wFU8GsVKnMUFB/Yh+IUr6BW/izJx5qSbUjCwUW?=
 =?us-ascii?Q?B32+ofknDAWlXXeSZFm4EcsJKoAt2lAgaI85SCaHzCLfhRQ0hqCgsp2MocyM?=
 =?us-ascii?Q?pAylldtqfZ0qcRZGlYWL89iSWt22Sm2whTn7fmxjfgbT1INXNluim62uNCDv?=
 =?us-ascii?Q?Ofir6mN5OyoK/4j7cSvUtHHTjRdOoFGwuu4OjD1jlP9qqiAcgJ0k7p3F9qd9?=
 =?us-ascii?Q?Vsctd0aScskM7RcLZralrt17xn33lroUToFXLKyI/0C3KGJj29KldsWY4d0b?=
 =?us-ascii?Q?uClVK9cCeNWvX7zutn5HQs+xWgWl10+cWOPcE+5bfG/kNEyUQQrEZIIoYxuW?=
 =?us-ascii?Q?A2Qduef+Aj94dROD9pw5DAGuL26pDpCDu3W5vTobI7TvKOgiQXyTuyIJknUR?=
 =?us-ascii?Q?bW9uEXBha3LEmmvWv9lHSZr7eIsmJxE06TRKskh98WVrGKuXBOF/b69l6FGQ?=
 =?us-ascii?Q?80BgEIvNIh53q5Zr4YFaU+HVc0Rw9uBPIY/qFfHDmusLcW+39XGy4udoQaL3?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25843a61-8925-490c-0e4d-08ddbe76316a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 23:21:40.2487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wGLtEBN46RRZjMZSdeVmbZVLKWr77c9YuJemJ0lr14wT273ChDOC8+yz/RD4CqpoH+yLd/qQz5M1hP9sRamXZdvzIaIvgyRMlzSdymIJch4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7724
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

On Thu, Jul 03, 2025 at 09:20:58AM +0100, Tvrtko Ursulin wrote:
>Add XeLP workaround 16010904313.
>
>The description calls for it to be emitted as the indirect context buffer
>workaround for render and compute, and from the workaround batch buffer
>for the other engines. Therefore we plug into the previously added
>respective top level emission functions.
>
>The actual command streamer programming sequence differs from what is
>described in the PRM, in that it assumes the listed LRCA offset was
>supposed to actually refer to the location of the CTX_TIMESTAMP register
>instead of LRCA + 0x180c (which is in GPR space). Latter appears to make
>more sense under the assumption that multiple writes are helping with
>restoring the CTX_TIMESTAMP register content from the saved context state.

I'm requesting a clarification about that to hw/validation. Because this
doesn't match neither the i915 implementation nor the PRM.

Lucas De Marchi
