Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8114CA0FF0
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 21:27:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94FF510E2EF;
	Tue, 26 Aug 2025 21:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZDJSJCHu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F6C10E2EF
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Aug 2025 21:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756243640; x=1787779640;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bz02r1rkpDDykRuzaqYxDWC8zdNjl4hFu/r9/C3chBo=;
 b=ZDJSJCHu9OhEvV3b3WroDvGsyy2im1A2osfRv6TaDmtPfMYWs4ICzm3x
 0JcLjqltgWy/sZZzK4VK1FgsSWuiQAxjJ2hTF3jDmL2UTY+1MZgh908Wu
 5MtMO/k6sQ4ebf2ooKtmPj+2KNv2/xUwbkNekSUsWam2/JX28BDjy5feR
 aKlz7bOkH5HHRnCUJA81EGab1sa28gms6GhTOHYvv+MsATIod7p3oa8OK
 xHoq8A1hmD2M/AQevmJPhvsu2HMHpbCS+aL8jbh88mNSr5nMYF5Ji55vJ
 4rpM9Ty4nYVUnjCUUORUcJbN+bNMLD8S+3kBWm+B81Y7tO9/azvBHIbmn w==;
X-CSE-ConnectionGUID: +PbcgutIQ3WhLSj7kPSApg==
X-CSE-MsgGUID: EaWHcr2ZQrWmx5PCjmTyIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="83897917"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="83897917"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 14:27:19 -0700
X-CSE-ConnectionGUID: ieeYrTCYTgK4qaZ/43zO1g==
X-CSE-MsgGUID: AUbyuq5cQ5aJ7a2rbt2cMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="170079725"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 14:27:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 14:27:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 26 Aug 2025 14:27:18 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.57)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 14:27:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tVh4iHixbyuwnWIupCfmBrhPzEsYOPmSiMZTXFLxAhaTUVOYB4WBENsHMUnLozI6lchjUEjJSBK9KhLopsNMeD+IHad2K/wMpfUY5DvIC1j2XoK2SxCHkPaQ+dyGgsGbPIoCuy3rbYeg3c0Hg8/PNAGJq4j0WwUy3u3UPIFQWDY93SRqntz0sLe7c7L2WuT+VwrvGm7puhSFMAG7lF1HC4VNS/0AmXpzOxSDhVNVA8KJs2tagnfJlE+eWOSD0/MjoT1sk24OLZplKgO1xSGglYTHsMI6/CpPWScEQTF/YLkkLCN3VuNJLmr+1LjcTheQS8Auhjz/W7pCE9Lglo6CvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZ2EsCaHmabAMS734s2RRZAMayJS54faS+g++8SXEY8=;
 b=wAOjMnK9Mx5yxy0seCLozLJhwKlyjo65BE3Gy8I89eX1rbMtBdhEuspAbQHywpLT+W9c1517xuHTRxb5GjxFWLqT5L1GqEg4lPqjfdpEbPbxg1zlIheFaltEVEvkm06gJVgI5Nwil82jmhx1MD2WDP8MEUgDAd7zXvDDN95EBrLOkcMsX6R3esvhLk/FfGTJ+LzyXuBKlsrDEZFdSbMA39JKunS0sD230Zc7bcanBQOSnwn8EkJdc+aprMhvggn2cT/l06Ab3W93eLaJXL7b8gz291/ba929kz/uAVt02vWSIzkfWwpFLeGUWYaTouzfk5wAxt51i8F+FvBURQ0BUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.22; Tue, 26 Aug
 2025 21:27:16 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 21:27:16 +0000
Date: Tue, 26 Aug 2025 14:27:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH v2 13/16] drm/xe: Convert xe_bo_create_pin_map_at() for
 exhaustive eviction
Message-ID: <aK4mrwKGo9Et1n+6@lstrano-desk.jf.intel.com>
References: <20250822094030.3499-1-thomas.hellstrom@linux.intel.com>
 <20250822094030.3499-14-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250822094030.3499-14-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0090.namprd03.prod.outlook.com
 (2603:10b6:a03:331::35) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CY5PR11MB6344:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ed43205-2a51-4f2c-2707-08dde4e753f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?FW/2mxzzldlBddjvioUTKNDOK2VuYlMvDP7J+nDL/z7DHHofZCen6MHu3q?=
 =?iso-8859-1?Q?I8pkeqt7C40Aj8/C4VBUNxCMSoiNeYxi+riExxwrWwRa9CS6c9ZgpUqMwm?=
 =?iso-8859-1?Q?00c3P/fFp6LGl2g7K/x9vMv1IAl53KHtQuycM66vnckPK3wAfWH3Yseb5C?=
 =?iso-8859-1?Q?tBt+TIw09LrrIZRHXIDZGk8K+I/bcVmai5rsrZ4X8wrRpakfkNfRuCyF7i?=
 =?iso-8859-1?Q?TL3vgH5bp67K5aZZHS1IDQBXFEzoNB4M0LWaYxxJb3cEx+qy0Imk7g3iS7?=
 =?iso-8859-1?Q?9NMCkZRIuRZCXdc9UVp2gkVyBMt8Io9O0coNDxUGXvxsHC2FbD/wqJo+8M?=
 =?iso-8859-1?Q?8UG19+eDXPBMXCMoDknXBJkkjof/mzq/KwyZ0va+j/4LwPz2S1y5teAWVd?=
 =?iso-8859-1?Q?rI4kCv9O/AVAklmGoMtqXpFAZ+vlv8P4607/X1wNq6VuNFjPO7pcfM80on?=
 =?iso-8859-1?Q?xOcL01gxMXvat1wv1AhhsipEOQhB08KWQkTYu4Zw2Djjxujc7ctp+HOY5s?=
 =?iso-8859-1?Q?BdsHBnrVJ8P7IaApMEG92z1X/BMCDyRTjMKlqcUCS6Qz7Jnu8NVfGb3Rqg?=
 =?iso-8859-1?Q?ssuEI5tN7Ygv/XVTgeaV4W2qw4A3AAbA6UMMSgXpYcR58se6Xr5mR7WYSZ?=
 =?iso-8859-1?Q?cPAE3ObNmbgRWnb7zYj/SvVNf63s5XGLUXnjfo0s8Mt9Qh4qAbzRrOwkge?=
 =?iso-8859-1?Q?rvGcleJcupQhbDO19zxV3+tksZL/7/10JuefDcTb+yCKjMsvtcGoI9MaZA?=
 =?iso-8859-1?Q?8BjvjvWRxGKVju4mpBR+GujdHej8RdNlnCIe3gbvx7aiw5damrU5kxzQsM?=
 =?iso-8859-1?Q?0UHHrSMRycLEkExTbMAwQe6VIL/lqVerJvqkSozOqb9d82tSaGuJEB6U1B?=
 =?iso-8859-1?Q?vHOUs+ZU5kDt0/uZNlk+HbVN018fiEqOWF/x0SqFEH/noAaSp+DpxTjV7Q?=
 =?iso-8859-1?Q?vu8epYQ2kNZ3/bAYzfCvvA9PQIA1XpIgR4XS5Vc61G/mnaM74I4RRuBJFt?=
 =?iso-8859-1?Q?ORM7MCwDXh17GxPebulCKMesx+x3xUqW1Otilgpaq9kPKX12nOhFqnc02O?=
 =?iso-8859-1?Q?AuJGA6A4KGtBTHmpJBzGBlYxtnU0tJtlkpT2EjX0eV1zVNBVzVT7EhqDNL?=
 =?iso-8859-1?Q?4iWyCh4u8VdIu0DkZkRNqMdB74vys7iU63Ss8DEpeSxfL80M21MJ14q63m?=
 =?iso-8859-1?Q?mN8a/MYf12fiireG0ufvGjCJsSDfpGPHeYTcG0WFEQL8jAvymYt6mddb3A?=
 =?iso-8859-1?Q?EZtrcrJcqIFN1Gt5swUAa6MpcUOQ+yaKUF631O8r4aT8GI9EGXPL5Oy7uu?=
 =?iso-8859-1?Q?b7UDprHOcjBU88LNlZ/YnLD+I67WRuZv5JJXvMOhPw/q5qojdgMje6k0+a?=
 =?iso-8859-1?Q?Ameht+2LyOWy+fcBW/QcOW8gdrBhEDIdUkTi/DWurzbvLctt9dA6H80Hcz?=
 =?iso-8859-1?Q?cQs0zHh+/UW9A8EdAdz3IiE40ftlHb2Fp78q1g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DKjfcZs+gfj2odaIGlW+htZ3Hv86448ZHn/oCmF9hb787wTXEQJOPT+IO5?=
 =?iso-8859-1?Q?S68E9gr8gCujadC9tqCu5Z+2o3dgwk0IpnfcsRn8xmMt2HjFWtSN6f8kbP?=
 =?iso-8859-1?Q?RYX2sQAYKeqnjJ7Y/Pp3j9NDoqG5dOoQHJAXOYNb9B7KiucW1I5f2WpvEO?=
 =?iso-8859-1?Q?4sn+e4M+UvfBPdb5yf3TVLNLYDef+GfFsDBl0MQs9b3Sfoq9T3vuOZwuWz?=
 =?iso-8859-1?Q?7xIeWFKPrZvo+VXIuEKky3L/pLvBg8d/hDnGRVm8StO9zsB5E3BRrGcHpB?=
 =?iso-8859-1?Q?hhE9ZqrHLafv+Hzih2q4ib+bwh/dN8o0WGwE0q07M/KZHsut7qcZIiYQ7S?=
 =?iso-8859-1?Q?W83hX+o5aezYuk4VX3rG4c3jwXYM97YDuwNYvTGgPBhIesmZmbjr1j/6dE?=
 =?iso-8859-1?Q?2yMdp1fIjGy5Ky8RpctYaTQSA7NJkBeNEpJExpx/pCkQB13HkrW/zzviEk?=
 =?iso-8859-1?Q?6f3ISZeltxi6uksc7Ulyx46dIPXWJgHKJW+knVaBCZGqLABW1MFeR5VEdX?=
 =?iso-8859-1?Q?+TrIeOQ9sBlgK2eLyJ0rRgFUpZSuXXNp2aXUk7ybVvrjRFAz56kictWkOX?=
 =?iso-8859-1?Q?iUDVUt3xsQhZ6HUs7z8AKuLOt/cPN5UFI1pI2qB+iUl04Ngv1iR75yi7lA?=
 =?iso-8859-1?Q?IP4K6g3jP2lBpilgksD62sb/6G1kd2f50SIxj69G2mqVdq9heHV2GsgdiV?=
 =?iso-8859-1?Q?ddHbt5cjAXvoTzwEj2KHefvfXtF8nBVq8ts2i29vTgKed10yfoK++XVJ9l?=
 =?iso-8859-1?Q?hJt6LnkUjPFE5GOZeDXUCFkyYb8zt3Rg4gc3VsEb/UPPznJv6Y3VotO4IN?=
 =?iso-8859-1?Q?znSLW+JQcYhoa3cCVYWHaUnS5FnoS0U0oegTRaybA4LQOCCxrv+Bxsqi5K?=
 =?iso-8859-1?Q?kNAvXRZIFcUwrcB6HrET8xU4YwWrkJpULVi3bQoKRCYt8CHWl2HC+2DdQD?=
 =?iso-8859-1?Q?jPCHvG0oobuxd+eiW7aXf37YCN4EEV2ukpIYC7+M/OgnU3F7N6ioCg7XPx?=
 =?iso-8859-1?Q?6FhGGpa9uqgF+u4BgWvjTLoAFsa1181xgiB+2Dfi2LsN0riy5cSl4jtqsz?=
 =?iso-8859-1?Q?fTqH766FK7S07UwLKEhlA1f9cfmm1XXCjTCnSRPlv/PElcFCjMLD29EiYF?=
 =?iso-8859-1?Q?1vY9vzZ9e7QvYEx6DHHmxc+2HPPj6Mh39lrmcs5NHMvpu54XzJlCV3hr83?=
 =?iso-8859-1?Q?nYDrQbr7vpp746oR5OarejIvo5qfeKV85vxZEurwSXYtQN0v4yA8XMe8e5?=
 =?iso-8859-1?Q?JsPGPksK8SMLPabrdg9iKalP3w8Mywke/J+hacr5tt6R4XgUGZpVWFayYh?=
 =?iso-8859-1?Q?7ngQkClQpMlEG+BFVe2fw4dG2oPXSzlgdxieaJXPB+h9L4M4BK9w5cz6Om?=
 =?iso-8859-1?Q?PgVYunO+3ujT0dTvSLli8d0m8mtWp+08noBGxlyBbpEJ4Z/O+IpfU/ANrT?=
 =?iso-8859-1?Q?Zf6o3hEoG4C/7ua9Ie8ID+0sxo6WL9RR/ANtZZAm2QqpRYvCrTMXjwhd7y?=
 =?iso-8859-1?Q?QY7+B6f8VhnMVmhNDw8dzqs/39htcRh9E/iAbj9X8fTiEI+yRu4sABxyHc?=
 =?iso-8859-1?Q?RCodOQt+Q2n2yjvK7drHY/BmSxdVnpsy3kt/nMsprrwsy22vsUkrP5+I2y?=
 =?iso-8859-1?Q?lOIx7zL+whmMhsWz2Hm5L3DwtJB48tT1Isvp795KIAr202WfQitD9NYQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ed43205-2a51-4f2c-2707-08dde4e753f3
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 21:27:15.9558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ///4ebIy8Qtajj4MRBMspCkI1PyT5ey2vpBWe5gGEcNb4taN+hOaOESxn+yvFFiVMKcZV/ZlrewEWUtEPcNqSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6344
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

On Fri, Aug 22, 2025 at 11:40:27AM +0200, Thomas Hellström wrote:
> Most users of xe_bo_create_pin_map_at() and
> xe_bo_create_pin_map_at_aligned() are not using the vm parameter,
> and that simplifies conversion. Introduce an
> xe_bo_create_pin_map_at_novm() function and make the _aligned()
> version static. Use xe_validation_guard() for conversion.
> 
> v2:
> - Adapt to signature change of xe_validation_guard(). (Matt Brost)
> - Fix up documentation.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  .../compat-i915-headers/gem/i915_gem_stolen.h | 24 ++-----
>  drivers/gpu/drm/xe/display/xe_fb_pin.c        | 42 +++++------
>  drivers/gpu/drm/xe/display/xe_plane_initial.c |  4 +-
>  drivers/gpu/drm/xe/xe_bo.c                    | 72 ++++++++++++++-----
>  drivers/gpu/drm/xe/xe_bo.h                    | 13 ++--
>  drivers/gpu/drm/xe/xe_eu_stall.c              |  5 +-
>  6 files changed, 89 insertions(+), 71 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
> index 1ce1e9da975b..51afdf2ee98b 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
> @@ -21,9 +21,7 @@ static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
>  						       u32 size, u32 align,
>  						       u32 start, u32 end)
>  {
> -	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
>  	struct xe_bo *bo;
> -	int err;
>  	u32 flags = XE_BO_FLAG_PINNED | XE_BO_FLAG_STOLEN;
>  
>  	if (start < SZ_4K)
> @@ -34,25 +32,15 @@ static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
>  		start = ALIGN(start, align);
>  	}
>  
> -	bo = xe_bo_create_locked_range(xe, xe_device_get_root_tile(xe),
> -				       NULL, size, start, end,
> -				       ttm_bo_type_kernel, flags, 0, exec);
> -	if (IS_ERR(bo)) {
> -		err = PTR_ERR(bo);
> -		bo = NULL;
> -		return err;
> -	}
> -	err = xe_bo_pin(bo, exec);
> -	xe_bo_unlock_vm_held(bo);
> -
> -	if (err) {
> -		xe_bo_put(fb->bo);
> -		bo = NULL;
> -	}
> +	bo = xe_bo_create_pin_map_at_novm(xe, xe_device_get_root_tile(xe),
> +					  size, start, ttm_bo_type_kernel, flags,
> +					  0, true);
> +	if (IS_ERR(bo))
> +		return PTR_ERR(bo);
>  
>  	fb->bo = bo;
>  
> -	return err;
> +	return 0;
>  }
>  
>  static inline int i915_gem_stolen_insert_node(struct xe_device *xe,
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index fe0000b211d9..e73994dd4126 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -102,29 +102,29 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>  				 XE_PAGE_SIZE);
>  
>  	if (IS_DGFX(xe))
> -		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
> -						      dpt_size, ~0ull,
> -						      ttm_bo_type_kernel,
> -						      XE_BO_FLAG_VRAM0 |
> -						      XE_BO_FLAG_GGTT |
> -						      XE_BO_FLAG_PAGETABLE,
> -						      alignment);
> +		dpt = xe_bo_create_pin_map_at_novm(xe, tile0,
> +						   dpt_size, ~0ull,
> +						   ttm_bo_type_kernel,
> +						   XE_BO_FLAG_VRAM0 |
> +						   XE_BO_FLAG_GGTT |
> +						   XE_BO_FLAG_PAGETABLE,
> +						   alignment, false);
>  	else
> -		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
> -						      dpt_size,  ~0ull,
> -						      ttm_bo_type_kernel,
> -						      XE_BO_FLAG_STOLEN |
> -						      XE_BO_FLAG_GGTT |
> -						      XE_BO_FLAG_PAGETABLE,
> -						      alignment);
> +		dpt = xe_bo_create_pin_map_at_novm(xe, tile0,
> +						   dpt_size,  ~0ull,
> +						   ttm_bo_type_kernel,
> +						   XE_BO_FLAG_STOLEN |
> +						   XE_BO_FLAG_GGTT |
> +						   XE_BO_FLAG_PAGETABLE,
> +						   alignment, false);
>  	if (IS_ERR(dpt))
> -		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
> -						      dpt_size,  ~0ull,
> -						      ttm_bo_type_kernel,
> -						      XE_BO_FLAG_SYSTEM |
> -						      XE_BO_FLAG_GGTT |
> -						      XE_BO_FLAG_PAGETABLE,
> -						      alignment);
> +		dpt = xe_bo_create_pin_map_at_novm(xe, tile0,
> +						   dpt_size,  ~0ull,
> +						   ttm_bo_type_kernel,
> +						   XE_BO_FLAG_SYSTEM |
> +						   XE_BO_FLAG_GGTT |
> +						   XE_BO_FLAG_PAGETABLE,
> +						   alignment, false);
>  	if (IS_ERR(dpt))
>  		return PTR_ERR(dpt);
>  
> diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> index 826ac3d578b7..94f00def811b 100644
> --- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
> +++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> @@ -140,8 +140,8 @@ initial_plane_bo(struct xe_device *xe,
>  			page_size);
>  	size -= base;
>  
> -	bo = xe_bo_create_pin_map_at(xe, tile0, NULL, size, phys_base,
> -				     ttm_bo_type_kernel, flags);
> +	bo = xe_bo_create_pin_map_at_novm(xe, tile0, size, phys_base,
> +					  ttm_bo_type_kernel, flags, 0, false);
>  	if (IS_ERR(bo)) {
>  		drm_dbg(&xe->drm,
>  			"Failed to create bo phys_base=%pa size %u with flags %x: %li\n",
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index a3b7288f6b3d..d5172cb05078 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2379,27 +2379,17 @@ struct xe_bo *xe_bo_create_user(struct xe_device *xe,
>  	return bo;
>  }
>  
> -struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_tile *tile,
> -				      struct xe_vm *vm,
> -				      size_t size, u64 offset,
> -				      enum ttm_bo_type type, u32 flags)
> -{
> -	return xe_bo_create_pin_map_at_aligned(xe, tile, vm, size, offset,
> -					       type, flags, 0);
> -}
> -
> -struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
> -					      struct xe_tile *tile,
> -					      struct xe_vm *vm,
> -					      size_t size, u64 offset,
> -					      enum ttm_bo_type type, u32 flags,
> -					      u64 alignment)
> +static struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
> +						     struct xe_tile *tile,
> +						     struct xe_vm *vm,
> +						     size_t size, u64 offset,
> +						     enum ttm_bo_type type, u32 flags,
> +						     u64 alignment, struct drm_exec *exec)
>  {
>  	struct xe_bo *bo;
>  	int err;
>  	u64 start = offset == ~0ull ? 0 : offset;
> -	u64 end = offset == ~0ull ? offset : start + size;
> -	struct drm_exec *exec = vm ? xe_vm_validation_exec(vm) : XE_VALIDATION_UNIMPLEMENTED;
> +	u64 end = offset == ~0ull ? ~0ull : start + size;
>  
>  	if (flags & XE_BO_FLAG_STOLEN &&
>  	    xe_ttm_stolen_cpu_access_needs_ggtt(xe))
> @@ -2431,11 +2421,57 @@ struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
>  	return ERR_PTR(err);
>  }
>  
> +/**
> + * xe_bo_create_pin_map_at_novm() - Create pinned and mapped bo at optional VRAM offset
> + * @xe: The xe device.
> + * @tile: The tile to select for migration of this bo, and the tile used for
> + * GGTT binding if any. Only to be non-NULL for ttm_bo_type_kernel bos.
> + * @size: The storage size to use for the bo.
> + * @offset: Optional VRAM offset or %~0ull for don't care.
> + * @type: The TTM buffer object type.
> + * @flags: XE_BO_FLAG_ flags.
> + * @alignment: GGTT alignment.
> + * @intr: Whether to execute any waits for backing store interruptible.
> + *
> + * Create a pinned and optionally mapped bo with VRAM offset and GGTT alignment
> + * options. The bo will be external and not associated with a VM.
> + *
> + * Return: The buffer object on success. Negative error pointer on failure.
> + * In particular, the function may return ERR_PTR(%-EINTR) if @intr was set
> + * to true on entry.
> + */
> +struct xe_bo *
> +xe_bo_create_pin_map_at_novm(struct xe_device *xe, struct xe_tile *tile,
> +			     size_t size, u64 offset, enum ttm_bo_type type, u32 flags,
> +			     u64 alignment, bool intr)
> +{
> +	struct xe_validation_ctx ctx;
> +	struct drm_exec exec;
> +	struct xe_bo *bo;
> +	int ret = 0;
> +
> +	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {.interruptible = intr},
> +			    ret) {
> +		bo = xe_bo_create_pin_map_at_aligned(xe, tile, NULL, size, offset,
> +						     type, flags, alignment, &exec);
> +		if (IS_ERR(bo)) {
> +			drm_exec_retry_on_contention(&exec);
> +			ret = PTR_ERR(bo);
> +			xe_validation_retry_on_oom(&ctx, &ret);
> +		}
> +	}
> +
> +	return ret ? ERR_PTR(ret) : bo;
> +}
> +
>  struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
>  				   struct xe_vm *vm, size_t size,
>  				   enum ttm_bo_type type, u32 flags)
>  {
> -	return xe_bo_create_pin_map_at(xe, tile, vm, size, ~0ull, type, flags);
> +	struct drm_exec *exec = vm ? xe_vm_validation_exec(vm) : XE_VALIDATION_UNIMPLEMENTED;
> +
> +	return xe_bo_create_pin_map_at_aligned(xe, tile, vm, size, ~0ull, type, flags,
> +					       0, exec);
>  }
>  
>  static void __xe_bo_unpin_map_no_vm(void *arg)
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index a625806deeb6..decd601c802d 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -109,15 +109,10 @@ struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_vm *vm, size_t s
>  struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
>  				   struct xe_vm *vm, size_t size,
>  				   enum ttm_bo_type type, u32 flags);
> -struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_tile *tile,
> -				      struct xe_vm *vm, size_t size, u64 offset,
> -				      enum ttm_bo_type type, u32 flags);
> -struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
> -					      struct xe_tile *tile,
> -					      struct xe_vm *vm,
> -					      size_t size, u64 offset,
> -					      enum ttm_bo_type type, u32 flags,
> -					      u64 alignment);
> +struct xe_bo *
> +xe_bo_create_pin_map_at_novm(struct xe_device *xe, struct xe_tile *tile,
> +			     size_t size, u64 offset, enum ttm_bo_type type,
> +			     u32 flags, u64 alignment, bool intr);
>  struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
>  					   size_t size, u32 flags);
>  struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
> diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> index fdd514fec5ef..f5cfdf29fde3 100644
> --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> @@ -617,9 +617,8 @@ static int xe_eu_stall_data_buf_alloc(struct xe_eu_stall_data_stream *stream,
>  
>  	size = stream->per_xecore_buf_size * last_xecore;
>  
> -	bo = xe_bo_create_pin_map_at_aligned(tile->xe, tile, NULL,
> -					     size, ~0ull, ttm_bo_type_kernel,
> -					     XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT, SZ_64);
> +	bo = xe_bo_create_pin_map_at_novm(tile->xe, tile, size, ~0ull, ttm_bo_type_kernel,
> +					  XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT, SZ_64, false);
>  	if (IS_ERR(bo)) {
>  		kfree(stream->xecore_buf);
>  		return PTR_ERR(bo);
> -- 
> 2.50.1
> 
