Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C540AD3F2B0
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 22:03:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F4910E9CD;
	Fri, 18 Oct 2024 22:03:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S7wF4Uty";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25EB10E9CD
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Oct 2024 22:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729289027; x=1760825027;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=yhQXl1mY9mq9t3ZnGaM6SHVy3oymAxS0RYlW+WHOrXc=;
 b=S7wF4UtyhlLt8UJ9sx1+LOU45vNmiJDTjdVeMZNOhv35CHdaX2efVuTu
 2jSIqORByL10xmBM29U0x3IsKJGfp7KsMWK8oyP4LAWPHpEf8y/x5frwr
 iwhbTVju17bZYuvBtCZEn4f82o4XNXVppxwR86yeyIVygvlcDMfk3e7wo
 aaM89fZaaFVaSAiA0GWIihE528idDlcgMqKYnG3U4Kfu05ixEdvQC51gB
 KEyXQMwfj4hBbo5fTtFiTlBATO3xAXbo7IuCuP6JMJ7N2PuFY3CKWV/3Y
 DEUCv5VckKRw/4P1a51Xhy84sjI5TmbD9KzjbLTeXMxatQtq+Wm1NJF2y w==;
X-CSE-ConnectionGUID: X4B9STgbT1SDBkkBsCEdYQ==
X-CSE-MsgGUID: zrBAGUyaTUiqlMvswfJVLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="28265931"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="28265931"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 15:03:46 -0700
X-CSE-ConnectionGUID: yY9N3kH4T6ODpSI+kusX/Q==
X-CSE-MsgGUID: 3pn5XlpFSgeSIntmf2tCYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="78946790"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2024 15:03:46 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 15:03:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 15:03:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 15:03:45 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 18 Oct 2024 15:03:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 18 Oct 2024 15:03:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0X9JZ53wOU1cHpoT0bw5fN3UfVDkSpia113QwekfiF1KnD2kuJOVZkVjxumjSi/PTnR/3NTM8CGTNtXgzrUXhGk6hd61pIPjQxAFvW0ZfCgKLWoFcaDG5hjRM4QaE9iMJIe3+jfSkER/3PqGzRGJaaW88f7TlCHr15V09ykndyh1ayGtq0Zo8bI2/N8VGYpdQ+Ikfq/8quO1to6dWfckU8S0dtOWizeLaID7R72WPF2Qfm2is249fq5FATurp1JcIHNQTA2n3WseyOGM8NHWv6qfEuxFHTTnZD8PIkyKC7QN1RNAQ1YZliZJBCsz+OEmPs8akU/Y4522sYx4qJX7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PgrZdbYxJE6kmiXpxEOWdkyTQUdtHQKi/5tU06pR6fU=;
 b=rph2E7j7Df5omquPviABJ++kBxf3l0v0KOKUqtVP9e7GT9iGtjGTrP2hpR62F4vTgN3S56+EUyEdHQNrFtl5BmWf/lsOPi1FTVyyeJTAIbhODf9baqxdGxeE7hthq90mxnhGmrQW5sY25kuS+fK6U7GmmXpcrBQUmuOnLW7xR1R/nnF1afE5c+aWP0MSRNGWirzC/tcSmfeG2rwSBN82e/NCxpAJvnN9/wBiWkOZxzGe4iQNU9Q/IyLif67vWFlj9MOKlbY9O8dTlZkBI2cAcZ/EoTXmg2Oeurm7aGzvj94wWdeVFhjzeeQGeQ/dIm56aLRCjPuKYsbEVgGVP2qYOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7266.namprd11.prod.outlook.com (2603:10b6:930:99::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.20; Fri, 18 Oct
 2024 22:03:42 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 22:03:42 +0000
Date: Fri, 18 Oct 2024 15:03:39 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Harish Chegondi <harish.chegondi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <ashutosh.dixit@intel.com>,
 <james.ausmus@intel.com>, <felix.j.degrood@intel.com>,
 <jose.souza@intel.com>, <matias.a.cabral@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <shubham.kumar@intel.com>
Subject: Re: [PATCH v4 2/5] drm/xe/eustall: Introduce API for EU stall sampling
Message-ID: <20241018220339.GC4891@mdroper-desk1.amr.corp.intel.com>
References: <cover.1728884074.git.harish.chegondi@intel.com>
 <a4ca443e9dc0e25ff4d77908f785cdfdf6c80f7f.1728884074.git.harish.chegondi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a4ca443e9dc0e25ff4d77908f785cdfdf6c80f7f.1728884074.git.harish.chegondi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0078.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::23) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7266:EE_
X-MS-Office365-Filtering-Correlation-Id: 31a18131-a85b-404d-901a-08dcefc0ba92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?brPYk04MlW9TmrQS1rWzrIPc93VNKrby+0PKzf/twQ6ZoquCHQns45M/j+?=
 =?iso-8859-1?Q?CnCzILEeF5LfcfxBbjUBNLqjj/2DUoJK3Nq/W6LtY4WdxdnUrOFHm4qNI7?=
 =?iso-8859-1?Q?ufJbS5YenielFqtPBK3kG36U94wby44XIV6+iAINO+FXlpdV9QqtKeI9H4?=
 =?iso-8859-1?Q?KuvA4yBQy4nK8ngfVA1GcZ5YnxnNIHBjPXYv1XwgwVM+NG/DHInUSPHgzj?=
 =?iso-8859-1?Q?a05wxOc0jc5rnrFUnlGTCpLZ1IeN5vfKSn6tgw9eaUqMpHtbsh8SbBMOw1?=
 =?iso-8859-1?Q?gynaKZ2Rj1UYEKmK/iP280uGGPIZmTSeyxvvuC2SlGqKAHC+o1yxN6ZmM3?=
 =?iso-8859-1?Q?y/TpJl2LnbmVWF3i6u2tPZyUPQqCnCdR8DAQpNjHDJQ6PtGGYYVRx31qvW?=
 =?iso-8859-1?Q?P5ap6GL+B3Kirrx7ZwHQgTRHGxy0TNGuf5WKGegkS8dY8SjJWGEbVEqmJ1?=
 =?iso-8859-1?Q?P+uFmMknOnw6nWo7R19m27TyimKT/R6TrRFpq4+TONoA1OfxoREN7y/H8e?=
 =?iso-8859-1?Q?U2zGQQK7Qz5zzQPLJTTaWAUjgHdmeJGDOoLQmm2WZP1kFd6IO56q/E1bjo?=
 =?iso-8859-1?Q?ABAsyLa2ej158lHZk7NKA6zHomNhKZ+Md756ExPyIE7n7/7xTe5Cxv04vK?=
 =?iso-8859-1?Q?KaTOssOvrrbqdmKv/HiYHP6czZV+XUPKZCzqskIk1DfjjnlZ4jG58HBDls?=
 =?iso-8859-1?Q?8GLVZWcW4psCfbZVaZCfyeNCoIu2WxeR8swygTqmRugDPGZeFvdCl0t4cS?=
 =?iso-8859-1?Q?CNcgzdu6mlSc+dPl8QgHbcNv3ruQwXTvKkVTMoagwbDsene3dNTUmjFZyB?=
 =?iso-8859-1?Q?gVxQusUt7vSbxz7x690VHivgC0VfUlayPcE7LI8mHLCiwX/RXhYs2kEsH1?=
 =?iso-8859-1?Q?Fv7Mf3HZ9XDfXAU4bKkgSf0OlIUSEAtLeb8SShLLjbXJglbuFFIxSviIK/?=
 =?iso-8859-1?Q?DRGthEt6zJfGtRZIlvhinFQygkzkJuQfXj18Gfw/OVFrtl5q5LRkOccF9M?=
 =?iso-8859-1?Q?d+vnK1tK5n22Y2kNrxmLMYT4BwFv1SBppjZ0tP8bNWDSl/CRJSgEPPDL+A?=
 =?iso-8859-1?Q?as7EZTPC4jZ0GKpJKQWPRVWwkVw9QKD+sujXE6rYgm8LbojUsHmkc//Xws?=
 =?iso-8859-1?Q?ZkKjqak52i7wGQqnQXZBnF9gZMbJGD7Gw9XR1VcGu3ve/yMfDQ4Np2uW39?=
 =?iso-8859-1?Q?GBTiJB4LS3Gfl6oidCtxdnzd1KVhfJk5GpR93yE0OMM3bPCk8JTnHDBWFu?=
 =?iso-8859-1?Q?Hql43G2M822xooIi5Z4bmpLnXMcIYRYa5E9MW2B/GQHP4SM4scPr21dx8y?=
 =?iso-8859-1?Q?DnsgUrIJIU9XcEdd9Pgtrjk9Xgekg0xa8oucUWTAi3RdVQnTyPt4ljQGQb?=
 =?iso-8859-1?Q?HgM7jbAMLj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+QUWgLJHwp1GPNac4eroyQsDFC9kGzksKRko7IJTA7Qzr+KaVKivTKXyMX?=
 =?iso-8859-1?Q?f9OVdr4hrg8QKyWlYGgR+Jd3OX3Ee3h25smzgjLUvi7aYzvDZHkG2Lq9TJ?=
 =?iso-8859-1?Q?Ey1IUwWTJVGMPF7a04cIKBmuaeG4sUnG0lLygIuWrKjUw4VBo7OSQ+3Y5Q?=
 =?iso-8859-1?Q?J8jsMs54jvMO/t/kdzx/kNJlsO4y0ePLzVDiFeESL95611hxa26Rozi/DG?=
 =?iso-8859-1?Q?C/s9YSJzSwPFk2w5UM19hEB/QyCRrwAImF3JuhvapZw9JAoksJbShKvax+?=
 =?iso-8859-1?Q?9eeXpXVBEnOyQue2n2sr3m70VQuReKQOWar1iK8mUr+pYdSnxtZGgbeYw+?=
 =?iso-8859-1?Q?4KPLZ4b/y/55LA6Rruqna85KlYiqIChZr3ml1ny/O5oE5HOqI/YqLI7BSp?=
 =?iso-8859-1?Q?BcULpPtPr0upJHFF7w2GdcQKBlbLXQc2VMAMXX8M8Tz2YoeoWCgNIpWea5?=
 =?iso-8859-1?Q?TYB/7LsrVKGYTWFe8vfNMvvSNQnK2LfEB6Fxi8yP6RIbCGnVPhooaxBk2q?=
 =?iso-8859-1?Q?JzCA6JmP8xSSDIRGLjUUZ9KBy+tCBFwke200rvNOTsW1iqrBn9UYB2+Rbk?=
 =?iso-8859-1?Q?A2HiuKRr93xyAWxbZPDjZ0114F0EK9IjF+H/qYpkj9fbpHcDLy1rrqAqFp?=
 =?iso-8859-1?Q?Cj0saJ9RkSRJRN+0SXNSUaC7p5vdnJXKEfRqtHdW60Qvkg3pXgj2lgl/am?=
 =?iso-8859-1?Q?2l7HG3L/G86GHxbGibRAsru+3GY50m3AjaOoodxMISi+LhXH6QgC/JWRb7?=
 =?iso-8859-1?Q?/7wPZiYjrB6y6WKl0XshmU3vPc1nLktFDqcGnOs7XlGCNMaTF3cMtcP854?=
 =?iso-8859-1?Q?4ChlgWlqUZJu286aPSusD8qJRYUK7ANWSekGRdsAWkLp7Z2PbWeE5mUwQD?=
 =?iso-8859-1?Q?a440pXfYQqJKCm0sOE78Ff8Lr3IkOqEr610TsxsnYoAucZD6euEBbQ0VIx?=
 =?iso-8859-1?Q?P+p0WiXAoyzlZR8qDcp4NtcwofP32IXz3sz0t11Q3LT1P8NP56tC7qhkyz?=
 =?iso-8859-1?Q?7YMwXSV8KUddQYBxaqkcanQG+RXVo5bGpqrwaQB2pk+bqd7VLm/zVOe0yJ?=
 =?iso-8859-1?Q?oSLIEl02poKCtJ1SL5if2bksRLosvagx1flFQTyW8vuJVxtyYRehZGoNhH?=
 =?iso-8859-1?Q?2zagf/QkntH2EnGNgOt+13iNjRzsUvyadCtYmukMvZB+twaLuRF05c6QfA?=
 =?iso-8859-1?Q?Zb03mlb4mbGV28XWXE8XMr+2LbtGGhwYOl9BRsOeWRqyjbtaFD4QnUgClU?=
 =?iso-8859-1?Q?vfQ29AlHpejoN9kaV+MwBkooS+WFHZTuuthXUmc48F/GsEVsqnvZXTSOA9?=
 =?iso-8859-1?Q?uAQoRTsegQozO7F2BozblmGe+fx7nAR/nDGXwY5v+lmZQMehbTXkEeHttE?=
 =?iso-8859-1?Q?GECFfuJ8u5C8GD6kVCO97F2Jt4hDWYpmXpt4vZxP/cs4xEpTg7ALbPpxiE?=
 =?iso-8859-1?Q?HzQ/DEnesRI0HMcad1WWyrn6xuVTqSk6EtqejoQpbENeVGthD1INJtrcdr?=
 =?iso-8859-1?Q?4P1ClSsDzTWJKGTn0zQfmGMqjojS6sD3WY4Dt7FT0kOl34+euSxvzA/glt?=
 =?iso-8859-1?Q?G6cOf6Ox9VW7m1bTUwlNS74PjJ8JkMZ1Pc+bDd2S3x7IB63ALuwOywSfrr?=
 =?iso-8859-1?Q?k1IqJdFtGyqns32zqoWB6IhhIj7+EZDZW1wGJElW1YBNCV/oQr+Xu0qA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31a18131-a85b-404d-901a-08dcefc0ba92
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 22:03:42.4232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d5gHR7xWQEsOifQdCe3o2NDzr+SZxl7OQqiI/ebyA4kAOj1N8QECcEqVarDa/xIQcYJ8RFBQi+3gr0pPEjrvwXfrRl6SFt9QIO1mYadp6Co=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7266
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

On Sun, Oct 13, 2024 at 11:00:33PM -0700, Harish Chegondi wrote:
> A new hardware feature first introduced in PVC gives capability to
> periodically sample EU stall state and record counts for different stall
> reasons, on a per IP basis, aggregate across all EUs in a subslice and
> record the samples in a buffer in each subslice. Eventually, the aggregated
> data is written out to a buffer in the memory. This feature is also
> supported in XE2 and later architecture GPUs.
> 
> Use an existing IOCTL DRM_IOCTL_XE_OBSERVATION as interface into the driver
> from the user space to do initial setup and obtain a file descriptor for
> the EU stall counter data stream.  Input parameter to the IOCTL is a struct
> drm_xe_observation_param in which observation_type should be set to
> DRM_XE_OBSERVATION_TYPE_EU_STALL, observation_op should be
> DRM_XE_OBSERVATION_OP_STREAM_OPEN and param should point to a chain of
> drm_xe_ext_set_property structures in which each structure has a pair of
> property and value. The EU stall sampling input properties are defined in
> drm_xe_eu_stall_property_id enum.
> 
> With the file descriptor obtained from DRM_IOCTL_XE_OBSERVATION, user space
> can enable and disable EU stall sampling with the IOCTLs:
> DRM_XE_OBSERVATION_IOCTL_ENABLE and DRM_XE_OBSERVATION_IOCTL_DISABLE.
> User space can also call poll() to check for availability of data in the
> buffer. The data can be read with read(). Finally, the file descriptor
> can be closed with close().
> 
> Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>

In order to merge this new uapi, we'll eventually need to have Cc's for
the various UMD developers here, as well as Link:'s to the corresponding
PR's in the UMD codebases (fully reviewed and ready to apply on their
side).  I'm not sure if any of that is available yet or not, but
something to keep in mind before we can merge this.

> ---
>  drivers/gpu/drm/xe/Makefile         |   1 +
>  drivers/gpu/drm/xe/xe_eu_stall.c    | 275 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_eu_stall.h    |  12 ++
>  drivers/gpu/drm/xe/xe_observation.c |  14 ++
>  include/uapi/drm/xe_drm.h           |  42 +++++
>  5 files changed, 344 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.c
>  create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index cb6c625bdef0..bf21feae6950 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -33,6 +33,7 @@ xe-y += xe_bb.o \
>  	xe_device_sysfs.o \
>  	xe_dma_buf.o \
>  	xe_drm_client.o \
> +	xe_eu_stall.o \
>  	xe_exec.o \
>  	xe_execlist.o \
>  	xe_exec_queue.o \
> diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> new file mode 100644
> index 000000000000..5e4c90f9614d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> @@ -0,0 +1,275 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <linux/anon_inodes.h>
> +#include <linux/types.h>
> +#include <linux/poll.h>
> +#include <linux/fs.h>
> +
> +#include <uapi/drm/xe_drm.h>
> +
> +#include "xe_macros.h"
> +#include "xe_device.h"
> +#include "xe_eu_stall.h"
> +#include "xe_gt_printk.h"
> +#include "xe_gt_topology.h"
> +#include "xe_observation.h"
> +
> +/**
> + * struct eu_stall_open_properties
> + *
> + * @eu_stall_sampling_rate: Hardware EU stall sampling rate.
> + * @event_report_count: Minimum no of EU stall data rows for poll to set POLLIN.
> + * @poll_period: The period in nanoseconds at which the CPU will check for
> + *		 EU stall data in the buffer.
> + * @gt: GT on which EU stall data will be captured.
> + */
> +struct eu_stall_open_properties {
> +	u8 eu_stall_sampling_rate;
> +	u32 event_report_count;
> +	u64 poll_period;
> +	struct xe_gt *gt;
> +};
> +
> +/**
> + * num_data_rows - Return the number of EU stall data rows of 64B each
> + *		   for a given data size.
> + *
> + * @data_size: EU stall data size
> + */
> +static inline u32
> +num_data_rows(u32 data_size)
> +{
> +	return (data_size >> 6);
> +}
> +
> +static int set_prop_eu_stall_sampling_rate(struct xe_device *xe, u64 value,
> +					   struct eu_stall_open_properties *props)
> +{
> +	if (value == 0 || value > 7) {
> +		drm_dbg(&xe->drm, "Invalid EU stall sampling rate %llu\n", value);
> +		return -EINVAL;
> +	}
> +	props->eu_stall_sampling_rate = value;
> +	return 0;
> +}
> +
> +static int set_prop_eu_stall_poll_period(struct xe_device *xe, u64 value,
> +					 struct eu_stall_open_properties *props)
> +{
> +	if (value < 100000 /* 100us */) {
> +		drm_dbg(&xe->drm, "EU stall data poll period %lluns less than 100us\n", value);
> +		return -EINVAL;
> +	}
> +	props->poll_period = value;
> +	return 0;
> +}
> +
> +static int set_prop_eu_stall_event_report_count(struct xe_device *xe, u64 value,
> +						struct eu_stall_open_properties *props)
> +{
> +	if (value == 0) {
> +		drm_dbg(&xe->drm, "Invalid EU stall poll event report count %llu\n", value);
> +		return -EINVAL;
> +	}
> +	props->event_report_count = (u32)value;

I don't think we want to just silently cast this down from 64-bit to
32-bit.  There may not be a legitimate need to ever pass in such a large
value for this interface, but in that case we should have some kind of
check and error rather than silently allowing bogus values through from
userspace that we're not truly going to support.


> +	return 0;
> +}
> +
> +static int set_prop_eu_stall_gt_id(struct xe_device *xe, u64 value,
> +				   struct eu_stall_open_properties *props)
> +{
> +	props->gt = xe_device_get_gt(xe, (u8)value);

Same as above --- if userspace passes in something like 0x1000 as the GT
ID we should flag that as an error, rather than just silently treating
it as GT 0 and moving forward.


Matt

> +	if (!props->gt) {
> +		drm_dbg(&xe->drm, "Invalid GT ID %llu for EU stall sampling\n", value);
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +typedef int (*set_eu_stall_property_fn)(struct xe_device *xe, u64 value,
> +					struct eu_stall_open_properties *props);
> +
> +static const set_eu_stall_property_fn xe_set_eu_stall_property_funcs[] = {
> +	[DRM_XE_EU_STALL_PROP_SAMPLE_RATE] = set_prop_eu_stall_sampling_rate,
> +	[DRM_XE_EU_STALL_PROP_POLL_PERIOD] = set_prop_eu_stall_poll_period,
> +	[DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT] = set_prop_eu_stall_event_report_count,
> +	[DRM_XE_EU_STALL_PROP_GT_ID] = set_prop_eu_stall_gt_id,
> +};
> +
> +static int xe_eu_stall_user_ext_set_property(struct xe_device *xe, u64 extension,
> +					     struct eu_stall_open_properties *props)
> +{
> +	u64 __user *address = u64_to_user_ptr(extension);
> +	struct drm_xe_ext_set_property ext;
> +	int err;
> +	u32 idx;
> +
> +	err = __copy_from_user(&ext, address, sizeof(ext));
> +	if (XE_IOCTL_DBG(xe, err))
> +		return -EFAULT;
> +
> +	if (XE_IOCTL_DBG(xe, ext.property >= ARRAY_SIZE(xe_set_eu_stall_property_funcs)) ||
> +	    XE_IOCTL_DBG(xe, ext.pad))
> +		return -EINVAL;
> +
> +	idx = array_index_nospec(ext.property, ARRAY_SIZE(xe_set_eu_stall_property_funcs));
> +	return xe_set_eu_stall_property_funcs[idx](xe, ext.value, props);
> +}
> +
> +typedef int (*xe_eu_stall_user_extension_fn)(struct xe_device *xe, u64 extension,
> +					     struct eu_stall_open_properties *props);
> +static const xe_eu_stall_user_extension_fn xe_eu_stall_user_extension_funcs[] = {
> +	[DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY] = xe_eu_stall_user_ext_set_property,
> +};
> +
> +static int xe_eu_stall_user_extensions(struct xe_device *xe, u64 extension,
> +				       struct eu_stall_open_properties *props)
> +{
> +	u64 __user *address = u64_to_user_ptr(extension);
> +	struct drm_xe_user_extension ext;
> +	int err;
> +	u32 idx;
> +
> +	err = __copy_from_user(&ext, address, sizeof(ext));
> +	if (XE_IOCTL_DBG(xe, err))
> +		return -EFAULT;
> +
> +	if (XE_IOCTL_DBG(xe, ext.pad) ||
> +	    XE_IOCTL_DBG(xe, ext.name >= ARRAY_SIZE(xe_eu_stall_user_extension_funcs)))
> +		return -EINVAL;
> +
> +	idx = array_index_nospec(ext.name, ARRAY_SIZE(xe_eu_stall_user_extension_funcs));
> +	err = xe_eu_stall_user_extension_funcs[idx](xe, extension, props);
> +	if (XE_IOCTL_DBG(xe, err))
> +		return err;
> +
> +	if (ext.next_extension)
> +		return xe_eu_stall_user_extensions(xe, ext.next_extension, props);
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_eu_stall_stream_read - handles userspace read() of a EU stall data stream fd.
> + *
> + * @file: An xe EU stall data stream file
> + * @buf: destination buffer given by userspace
> + * @count: the number of bytes userspace wants to read
> + * @ppos: (inout) file seek position (unused)
> + *
> + * Returns: The number of bytes copied or a negative error code on failure.
> + */
> +static ssize_t xe_eu_stall_stream_read(struct file *file, char __user *buf,
> +				       size_t count, loff_t *ppos)
> +{
> +	ssize_t ret = 0;
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_eu_stall_stream_poll - handles userspace poll() of a EU stall data stream fd.
> + *
> + * @file: An xe EU stall data stream file
> + * @wait: Poll table
> + *
> + * Returns: Bit mask of returned events.
> + */
> +static __poll_t
> +xe_eu_stall_stream_poll(struct file *file, poll_table *wait)
> +{
> +	__poll_t ret = 0;
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_eu_stall_stream_ioctl - support ioctl() usage with xe EU stall data
> + *								stream fd
> + * @file: An xe EU stall data stream file
> + * @cmd: the ioctl request
> + * @arg: the ioctl data
> + *
> + * Returns: zero on success or a negative error code. Returns -EINVAL for
> + * an unknown ioctl request.
> + */
> +static long xe_eu_stall_stream_ioctl(struct file *file,
> +				     unsigned int cmd,
> +				     unsigned long arg)
> +{
> +	switch (cmd) {
> +	case DRM_XE_OBSERVATION_IOCTL_ENABLE:
> +		return 0;
> +	case DRM_XE_OBSERVATION_IOCTL_DISABLE:
> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +/**
> + * xe_eu_stall_stream_close - handles userspace close() of a EU stall data
> + *			      stream file.
> + * @inode: anonymous inode associated with file
> + * @file: An xe EU stall data stream file
> + *
> + * Cleans up any resources associated with an open EU stall data stream file.
> + */
> +static int xe_eu_stall_stream_close(struct inode *inode, struct file *file)
> +{
> +	return 0;
> +}
> +
> +static const struct file_operations fops_eu_stall = {
> +	.owner		= THIS_MODULE,
> +	.llseek		= noop_llseek,
> +	.release	= xe_eu_stall_stream_close,
> +	.poll		= xe_eu_stall_stream_poll,
> +	.read		= xe_eu_stall_stream_read,
> +	.unlocked_ioctl = xe_eu_stall_stream_ioctl,
> +	.compat_ioctl   = xe_eu_stall_stream_ioctl,
> +};
> +
> +static inline bool has_eu_stall_sampling_support(struct xe_device *xe)
> +{
> +	return false;
> +}
> +
> +int xe_eu_stall_stream_open(struct drm_device *dev,
> +			    u64 data,
> +			    struct drm_file *file)
> +{
> +	struct xe_device *xe = to_xe_device(dev);
> +	struct eu_stall_open_properties props;
> +	int ret, stream_fd;
> +
> +	memset(&props, 0, sizeof(struct eu_stall_open_properties));
> +
> +	ret = xe_eu_stall_user_extensions(xe, data, &props);
> +	if (ret)
> +		return ret;
> +
> +	if (!props.gt) {
> +		drm_dbg(&xe->drm, "GT ID not provided for EU stall sampling\n");
> +		return -EINVAL;
> +	}
> +
> +	if (xe_observation_paranoid && !perfmon_capable()) {
> +		xe_gt_dbg(props.gt, "Insufficient privileges for EU stall monitoring\n");
> +		return -EACCES;
> +	}
> +
> +	if (!has_eu_stall_sampling_support(xe)) {
> +		xe_gt_dbg(props.gt, "EU stall monitoring is not supported on this platform\n");
> +		return -EPERM;
> +	}
> +	stream_fd = anon_inode_getfd("[xe_eu_stall]", &fops_eu_stall,
> +				     NULL, 0);
> +	if (stream_fd < 0)
> +		xe_gt_dbg(props.gt, "EU stall inode get fd failed : %d\n", stream_fd);
> +
> +	return stream_fd;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_eu_stall.h b/drivers/gpu/drm/xe/xe_eu_stall.h
> new file mode 100644
> index 000000000000..70fc89480df2
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_eu_stall.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef __XE_EU_STALL_H__
> +#define __XE_EU_STALL_H__
> +
> +int xe_eu_stall_stream_open(struct drm_device *dev,
> +			    u64 data,
> +			    struct drm_file *file);
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_observation.c b/drivers/gpu/drm/xe/xe_observation.c
> index 8ec1b84cbb9e..cca661de60ac 100644
> --- a/drivers/gpu/drm/xe/xe_observation.c
> +++ b/drivers/gpu/drm/xe/xe_observation.c
> @@ -9,6 +9,7 @@
>  #include <uapi/drm/xe_drm.h>
>  
>  #include "xe_oa.h"
> +#include "xe_eu_stall.h"
>  #include "xe_observation.h"
>  
>  u32 xe_observation_paranoid = true;
> @@ -29,6 +30,17 @@ static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_observation_param *
>  	}
>  }
>  
> +static int xe_eu_stall_ioctl(struct drm_device *dev, struct drm_xe_observation_param *arg,
> +			     struct drm_file *file)
> +{
> +	switch (arg->observation_op) {
> +	case DRM_XE_OBSERVATION_OP_STREAM_OPEN:
> +		return xe_eu_stall_stream_open(dev, arg->param, file);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
>  /**
>   * xe_observation_ioctl - The top level observation layer ioctl
>   * @dev: @drm_device
> @@ -51,6 +63,8 @@ int xe_observation_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
>  	switch (arg->observation_type) {
>  	case DRM_XE_OBSERVATION_TYPE_OA:
>  		return xe_oa_ioctl(dev, arg, file);
> +	case DRM_XE_OBSERVATION_TYPE_EU_STALL:
> +		return xe_eu_stall_ioctl(dev, arg, file);
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index c4182e95a619..50ad6b2e1450 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1397,6 +1397,8 @@ struct drm_xe_wait_user_fence {
>  enum drm_xe_observation_type {
>  	/** @DRM_XE_OBSERVATION_TYPE_OA: OA observation stream type */
>  	DRM_XE_OBSERVATION_TYPE_OA,
> +	/** @DRM_XE_OBSERVATION_TYPE_EU_STALL: EU stall sampling observation stream type */
> +	DRM_XE_OBSERVATION_TYPE_EU_STALL,
>  };
>  
>  /**
> @@ -1696,6 +1698,46 @@ struct drm_xe_oa_stream_info {
>  	__u64 reserved[3];
>  };
>  
> +/**
> + * enum drm_xe_eu_stall_property_id - EU stall sampling input property ids.
> + *
> + * These properties are passed to the driver as a chain of
> + * @drm_xe_ext_set_property structures with @property set to these
> + * properties' enums and @value set to the corresponding values of these
> + * properties. @drm_xe_user_extension base.name should be set to
> + * @DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY.
> + */
> +enum drm_xe_eu_stall_property_id {
> +#define DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY		0
> +	/**
> +	 * @DRM_XE_EU_STALL_PROP_SAMPLE_RATE: Sampling rate
> +	 * in multiples of 251 cycles. Valid values are 1 to 7.
> +	 * If the value is 1, sampling interval is 251 cycles.
> +	 * If the value is 7, sampling interval is 7 x 251 cycles.
> +	 */
> +	DRM_XE_EU_STALL_PROP_SAMPLE_RATE = 1,
> +
> +	/**
> +	 * @DRM_XE_EU_STALL_PROP_POLL_PERIOD: EU stall data
> +	 * poll period in nanoseconds at which the driver polls
> +	 * for EU stall data in the buffer. Should be at least 100000 ns.
> +	 */
> +	DRM_XE_EU_STALL_PROP_POLL_PERIOD,
> +
> +	/**
> +	 * @DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT: Minimum number of
> +	 * EU stall data rows to be present in the kernel buffer for
> +	 * poll() to set POLLIN (data present).
> +	 */
> +	DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT,
> +
> +	/**
> +	 * @DRM_XE_EU_STALL_PROP_GT_ID: GT ID of the GT on which
> +	 * EU stall data will be captured.
> +	 */
> +	DRM_XE_EU_STALL_PROP_GT_ID,
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.45.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
