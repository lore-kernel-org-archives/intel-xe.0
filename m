Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599F4D26D94
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 19:10:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C2310E931;
	Fri,  9 Jan 2026 19:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IThQs2k3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392D810E931
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 19:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767985848; x=1799521848;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iWMMO/t3gedlbb5BrKz+wWkJk3Ow3DZygC4bPMYrAsg=;
 b=IThQs2k3BHyKm/SjVwZpRXnyfvnSSMfke9TZ7iqUTOi7vrNJHhXPBldg
 Ll8W2omDDp92YT9ibGHv8xYgWOyGbknaHuFj5p/11FN1Bw3UAptIS4Xlc
 xqYH7EuWEc56xk60cEofLEAfkesOAXwcyg0784WIW54zYIGLE3txFQ4JF
 hpqydhKlowAoJg9eA9X0PvTM/x7pA9dP0ozaOHAS3mbVzq3JU4RH4ymDC
 OJh2/hSiLB5lKluqb5xyDy9md6n8le9ha7wsTfJu1Ol/ux4UgBv7dfNTf
 TziD4vQxSb8YiUmQ3EOU12cioPt1tSR7C7KxVLioIPF9QWeOVYN7ujj/w A==;
X-CSE-ConnectionGUID: a35XfDmsRa+u6W/QUv5kCQ==
X-CSE-MsgGUID: y1PJMTJ3TaWeUJQuBFMY/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69417594"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="69417594"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 11:10:47 -0800
X-CSE-ConnectionGUID: dH0qbcbwSxmc+PEL4bHBFQ==
X-CSE-MsgGUID: fCPOVRhDR1KjvJAW+uX85Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="208073384"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 11:10:48 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 11:10:47 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 11:10:47 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.48) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 11:10:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dviZXvnZPRsuPSRE04g8IXHXwa/SIvVpNKUiwTzdJk7wGUJgJCb2mUCV89D0l+JOXAxeE9pXOw/RHuNm5dHi4rlWveF4tnFAhDYxC3zUtU3w+Omn9gwCXZpOBN9AwxDPDC4KTOMCr8pmXXWByofbao9eRbTtSw8uICCnVxb08hfZeIMPZGfpb62BgslOdDHpbx6lmaE9NxVT6DsXemwLi0rc/Twwt5ixX0WkxrnGysjxNSRoM9nBEPr8Uj+ZK53D0LcsCVcO1lWb5PQLVVMgoflgDaZM1D164X1+8xSgpBuWdpUzYmYi4K85MBC8ItT8jUsHaG7Qg3Whldp3mb8rug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIJ7dHWUJ8HhE3MIwO3new+1ospkdPR4ZMumRZikKIk=;
 b=VzioidB9Uzns8GtpEHN/IkhxzKDbcrKh06SX0q5TfJvfj0A3/qTGmqj5WNoH1BQNuhvji9BOJb0XNkz4EXECSp99lb+oipdeUAksmIM79lo5f2Dm4zwPt2EVo8zzzMvZzhs2kJkvhr9fxiJIXEGY5FJtc1dKFJ86BjyRdoPgop/AzkXS9tcAlx+53PwRsJUOhjaViVwWTGqzQuF79gBnmXy1bqSqlI4A+kjYCNj4vZLCuy/dfueQJJUdT+RUHIsJ6jbHl7QgoCKWrIWtS+znT2YtwhjJqyoixE/9uiKN5yh8Jw3/mNPmamE9P3WUKs92zPEw7GHsOg4scLLfVcL0Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by DS0PR11MB7410.namprd11.prod.outlook.com (2603:10b6:8:151::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Fri, 9 Jan
 2026 19:10:42 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4%3]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 19:10:42 +0000
Date: Fri, 9 Jan 2026 11:10:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <umesh.nerlige.ramappa@intel.com>,
 <badal.nilawar@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@intel.com>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v3 1/6] drm/xe/sysctrl: Add System Controller register
 definitions
Message-ID: <20260109191038.GA458797@mdroper-desk1.amr.corp.intel.com>
References: <20260108120548.1015154-8-anoop.c.vijay@intel.com>
 <20260108120548.1015154-9-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260108120548.1015154-9-anoop.c.vijay@intel.com>
X-ClientProxiedBy: SJ0PR05CA0151.namprd05.prod.outlook.com
 (2603:10b6:a03:339::6) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|DS0PR11MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: 215a3e4c-5dfa-45dd-1ed3-08de4fb2c82e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?f7aPofOtYr325Z4LKkkxNOkeXHlnX7Makwpa7D2pSSDL2f5WxoboOYSOLF?=
 =?iso-8859-1?Q?HxE9C/umTz/3ArtxRwzlcdVLApEvZg3MgWeQOLthX2ql5gkr/LM58oQrYN?=
 =?iso-8859-1?Q?bsJfX6QVIay7SifGezGz/rujcanLGuBenzaXJrHbDSe2ZugXLAePgWCZbM?=
 =?iso-8859-1?Q?sUuxKGiOXkHcYkUQW0KDivb9bGCIqxDNjQufL1V3lzLp12KplbNrXemKHm?=
 =?iso-8859-1?Q?LKXtvjpB2+EQoYTP+AiPZhNGQIuR8n0pAoQ/iwzHmFN/uBdMV+2GLEjsuz?=
 =?iso-8859-1?Q?oJECSPyBFze+FLLol8KAPSy5quRCr3YpGoqBaWKti7FhOBJvXoXgiAHL+D?=
 =?iso-8859-1?Q?meE88Cb3lW44qnrFtphycrrb25UMOF79E/7sJPy+XxQenJj0TOAAvatBt/?=
 =?iso-8859-1?Q?ORMVUtebGu/l5vqwc7GN4JUljGOUWSVX8ZObDONSY04TdY6VnT73i2A7+c?=
 =?iso-8859-1?Q?oK0xd0hLsAl3h0xsOGe0CtrxfFCTUVGEBO5e2GxDkgKBe7+q0Onjxqn5tG?=
 =?iso-8859-1?Q?HtM83+isFW0iIJ4k77rj5XpZv7oOM3Rcvn9VhUIY4UINg9eaFNP1jsZsv6?=
 =?iso-8859-1?Q?+4FNbHkYXtDxRNqetU8/xUazlPwT34RPoc/69/1RHYlOUGde2a4AS+m2Xd?=
 =?iso-8859-1?Q?b/9ADOKBggsy2GM5YFc3cCqZjj/bPTG/I/FiG9A8BG1/P5VMn9xrjG2EkS?=
 =?iso-8859-1?Q?qrXToK4a2xn0wuZm/ba06R84dJ8/JsW4zu3lutbFVqRBEa2k6UHRhPWsXr?=
 =?iso-8859-1?Q?tKfCcmlk/1Qga5cf8REKlHNNgo3fBNLNj8jYzxgvUJq/F1Vh5n4Xcc/aN5?=
 =?iso-8859-1?Q?jGE+TPGdip+u/xktC2c1AFTjHVXhSIAiYF6koiqzKY1Yq0KvKJBFQUQtxN?=
 =?iso-8859-1?Q?hSI5MrZndL7foyjwfVxX5rKOiN80RNF2Xm/4eSZw6veUH8743isUaP6wbj?=
 =?iso-8859-1?Q?ul3Fv1iRMFUQ6YfiAJQ9/4CzX7ZHawT70Y80nofY9fStJerT60PH0sn+rW?=
 =?iso-8859-1?Q?iuJ2e3uHW3T6vCZaPUCe2VVbhrsqcfsLDe5VV+eS/J2x5NKmwrJZdXsYFQ?=
 =?iso-8859-1?Q?Z3O/tjPRqgyKhKwcAREDWkwBZV0cyzzttd3olRRkFWqlVHRCTNs/45lKNT?=
 =?iso-8859-1?Q?xTdG0FMjCYlqwEjhqOz2Op3BZHZvlkdjMY4J09B3lxTBI3e2WKYq2sTJz1?=
 =?iso-8859-1?Q?1K6Uznpx+W+R2mApYp+3Z8Ivow3PhGNuHpuuSIUQhj6R0PoqCcheN8Bp/U?=
 =?iso-8859-1?Q?fe6szZpT/JAxGQPkqZwi/mZXrlFglblL4bnhlEZIsAusja1Vv7bal6qQLA?=
 =?iso-8859-1?Q?RpaVM5w3zp7+anBAuluVW+Udok8gXzWgXav+tBzqIJ5x2I+aLSkvLmqVdI?=
 =?iso-8859-1?Q?hjiO6dbLEgpu6fvWlykS5p/zSLMEs7RM4rfu8Qb6AWsrDuPyHViOHZfcQ8?=
 =?iso-8859-1?Q?hMCyMYQF1MzH65S7Eqgzs8ZG9OdFvCEW1CORNu4RJqGmuAQVQgbSCoyWqa?=
 =?iso-8859-1?Q?Ci2axGVdUE/A2+GEl02+PQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?YzJZYKgnDmk4BbZQqvcbtPQAI8yGXgTab1iQWMCf0ScZUjm7quZIo5AW+X?=
 =?iso-8859-1?Q?iJUyt2Z9qbEawLNIVksa9bPDJrCpKPrBmI1RGC/bV2PswvPYxiYbQk5/Gz?=
 =?iso-8859-1?Q?YGQQqN7ztVs4FxOQJWJrBrWbuFrEU1cviwjFCXPkDycGkspmZ4VpP8SRMh?=
 =?iso-8859-1?Q?JHupYH8DjGa2Ld3K9M7Js0uzr9k++TvGIpnCiEAAricBytpwwkCu754uPE?=
 =?iso-8859-1?Q?idR7qYbEYjvRLBiuP7nek9+rNRkc5Fs2ODGl8GMk3u7fp5qhaDUe2RisGe?=
 =?iso-8859-1?Q?1eBWx61FDH1yiw77Ij7bxbyUdMPrMTsFj2tk0vxkL4jHtzP5t7GHaGTxDt?=
 =?iso-8859-1?Q?Yura+T0n/VeVu8gipKz2zyOp9VYTgMAuQZYbbvONua+ogu3jIIrOEWairr?=
 =?iso-8859-1?Q?CrLFDG34QvzVoQtuIsQ1S0mR1W64ksgLah1p1HKME8FqHl277eCEnQxwyr?=
 =?iso-8859-1?Q?nPytTgMvx7t6Q2Yaiq7xElp6muA5aw8o23Nxbf/C/iH6ZZ0EZzZTNxukmt?=
 =?iso-8859-1?Q?CWqKaLnPKJ6LVGfBe4JDT8qI0DAAaLKtLdkL7VvdYvDq/YeIvFORQjA0bu?=
 =?iso-8859-1?Q?Rt+y8v/yP91C5q9fB/8/b1JKM2y1GtAEhqrI32KYrxb57xVpHCpYEFxt3y?=
 =?iso-8859-1?Q?xEFjdjnBsmDGlGSzDjmV4hBM+PVlgvv/RsM3oFsWS7ucNwphlAQ3Vrx1jm?=
 =?iso-8859-1?Q?EFCeFtBxHQisKM9VtOwvACSARzzKe4Gb0DNIWkx8pYBo+cpjCTMTjlPVvr?=
 =?iso-8859-1?Q?9B9dMojXpp0pjWEGLSMt/A5qMguXNMhakF/c2u4jeNALndNDoMVS1gNiS0?=
 =?iso-8859-1?Q?a7mF4oDjnxVyrc26tItj48lQj3G9gJovxaMlPg1wCaHHb8a/YVvCTtjW3/?=
 =?iso-8859-1?Q?4ieZekY07nQ/965yfkaBv4spz++yIzd2ojgk4g4PiXOXBzSrsvHRVGX/tK?=
 =?iso-8859-1?Q?Qh9pQqK027PbkNcaUPECjl6xXcXDHxMSBcAsdgz6TvJwtqndHBNKeMSckW?=
 =?iso-8859-1?Q?qPVCfu5/ZlVUfdzOTLNgTTaGdmQLLhfMemlbxgvLaAyGeUPotb3zN9AgHj?=
 =?iso-8859-1?Q?EhXwMtz1EZZsyjEeIOXAWJjwl2ougZjY9yQ3o3BjqHIKECg//Mda7PM+R9?=
 =?iso-8859-1?Q?VC5CGyR9lDZlD0HXcNqK2YFzZiYrgIu92KsSyStYuamFwTOYtLVqQIqdvT?=
 =?iso-8859-1?Q?F3zREjhsx5l/1SxeigL6JYl833ZlEbH45+WCJnF/8Jph3fWlmfLavmxpg1?=
 =?iso-8859-1?Q?8TWazERWwGBp98j5RFdvAHEIPKRrh3ezwmLmUJSGUQRx676U60ZnjxArA2?=
 =?iso-8859-1?Q?K/Nhtzs2rjxk/nLDk5m54QinmU3cz6uGhL/ipS2U7c62kHaOwCevlV0Q8n?=
 =?iso-8859-1?Q?uUJlNgCLz24GqQp41XCfSWvSD89NNrybyxc3s/75kae5DDpbCMrvumQQ7x?=
 =?iso-8859-1?Q?Zr65IRFqSUHy7Uue6AnvHxWSPtMMhlVk2diqfeDkT6bJTJV41wOa5jgnZC?=
 =?iso-8859-1?Q?vDZ6Cg/sMfPw2S/QfvugJbGu+QYO2COP/8Xvm3/xF2vIXM+bHpvz31J+D0?=
 =?iso-8859-1?Q?d9RrH2sEER3Wr803KwxlRu64phHXZ59ZPvyFJhBIJotOC5o7mIOX1TKCRv?=
 =?iso-8859-1?Q?+LjVQkQ6dnnEf/yqubmdgUATNpvT2WLULvbRFbexX6NLFZoCkx08MUpfYi?=
 =?iso-8859-1?Q?gNGRKeU7IIRYCW5+f9ClA3j7nWju3zYjKdu3CAqfzwrT/BtUUqhj10Ysu8?=
 =?iso-8859-1?Q?Yr04NHspeuoPzPpOofmSBRyhZBPuqxOwJh1Q68Ux+S+cyz/EpV0bUNIO2v?=
 =?iso-8859-1?Q?8mXq5NejwW2j+poopiLYFKL9xTO5jNM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 215a3e4c-5dfa-45dd-1ed3-08de4fb2c82e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 19:10:41.8368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hbsqO35XbIEdKcBEZwCKBk/YLk1d5/kNZeMXH5U4xmOt2MrF1/1yuQlVHCMnATepJwddVcieuZfEkcO9Svgig1vnzxoi9b2ibyawi3NDLno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7410
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

On Thu, Jan 08, 2026 at 04:05:49AM -0800, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
> 
> Add register definitions for System Controller mailbox
> interface on Xe3p dGPU platforms.
> 
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h | 44 +++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h b/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
> new file mode 100644
> index 000000000000..e0b630654fe3
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_SYSCTRL_REGS_H_
> +#define _XE_SYSCTRL_REGS_H_
> +
> +#include "xe_regs.h"
> +
> +#define SYSCTRL_BASE_OFFSET		0xDB000

For consistency, we should make sure this header follows the same
style/formatting as our other register headers.  I.e., 
 - lowercase hex values
 - macro values start at column 49 (you're using 41)
 - field names have two additional spaces after "#define " (you did this
   for the ctrl fields, but not for the data fields)

> +#define SYSCTRL_BASE			(SOC_BASE + SYSCTRL_BASE_OFFSET)
> +#define SYSCTRL_MAILBOX_INDEX		0x03
> +#define SYSCTRL_BAR_LENGTH		0x1000
> +
> +#define SYSCTRL_MB_CTRL			XE_REG(SYSCTRL_BASE + 0x10)

Since all of our registers are offsets from SYSCTRL_BASE, we should
create a domain-specific xe_mmio structure for the sysctrl region and
use that to access these registers.  E.g.,

        xe_mmio_write32(sc->mmio, ...);

The SYSCTRL_BASE value can go into the xe_mmio itself (either by having
'regs' point to the start of the sysctrl region, or by placing it into
adj_offset and setting adj_limit to U32_MAX).  Then you can just define
all these registers like "#define SYSCTRL_MB_CTRL   XE_REG(0x10)"
without adding the base into each one.  This has a few advantages:

 - If future platforms/IPs move the sysctrl MMIO region to a new spot in
   the BAR, but don't change the layout of the registers within the
   region, it's easy to handle that by just setting the base properly
   inside the xe_mmio with some conditional logic and all of the
   register definitions will continue to work on both old and new
   platforms without changes.

 - We plan to add extra validation checks to xe_mmio accesses in the
   future that will help us catch mistakes (out of bound register
   accesses, mistakes in offset math, etc.).  Once that arrives, having
   an xe_mmio structure dedicated to sysctrl will ensure that our checks
   are as precise as possible.


When creating a dedicated xe_mmio structure for sysctrl, it's up to you
whether you want to recycle the same underlying iomap from xe->mmio (as
we do when we set up the gt->mmio structures today), or whether you want
to create a dedicated iomap of the exact sysctrl register region.


Matt

> +#define   SYSCTRL_MB_CTRL_RUN_BUSY	REG_BIT(31)
> +#define   SYSCTRL_MB_CTRL_IRQ		REG_BIT(30)
> +#define   SYSCTRL_MB_CTRL_RUN_BUSY_OUT	REG_BIT(29)
> +#define   SYSCTRL_MB_CTRL_PARAM3_MASK	REG_GENMASK(28, 24)
> +#define   SYSCTRL_MB_CTRL_PARAM2_MASK	REG_GENMASK(23, 16)
> +#define   SYSCTRL_MB_CTRL_PARAM1_MASK	REG_GENMASK(15, 8)
> +#define   SYSCTRL_MB_CTRL_COMMAND_MASK	REG_GENMASK(7, 0)
> +
> +#define SYSCTRL_MB_DATA0		XE_REG(SYSCTRL_BASE + 0x14)
> +#define SYSCTRL_MB_DATA1		XE_REG(SYSCTRL_BASE + 0x18)
> +#define SYSCTRL_MB_DATA2		XE_REG(SYSCTRL_BASE + 0x1C)
> +#define SYSCTRL_MB_DATA3		XE_REG(SYSCTRL_BASE + 0x20)
> +
> +#define MKHI_FRAME_PHASE		REG_BIT(24)
> +#define MKHI_FRAME_CURRENT_MASK		REG_GENMASK(21, 16)
> +#define MKHI_FRAME_TOTAL_MASK		REG_GENMASK(13, 8)
> +#define MKHI_FRAME_COMMAND_MASK		REG_GENMASK(7, 0)
> +
> +#define SYSCTRL_MB_FRAME_SIZE		16
> +#define SYSCTRL_MB_MAX_FRAMES		64
> +#define SYSCTRL_MB_MAX_MESSAGE_SIZE	(SYSCTRL_MB_FRAME_SIZE * SYSCTRL_MB_MAX_FRAMES)
> +#define SYSCTRL_MKHI_COMMAND		5
> +
> +#define SYSCTRL_MB_DEFAULT_TIMEOUT_MS	500
> +#define SYSCTRL_MB_RETRY_TIMEOUT_MS	20
> +#define SYSCTRL_MB_POLL_INTERVAL_US	100
> +
> +#endif /* _XE_SYSCTRL_REGS_H_ */
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
