Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1C2C282D1
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 21:36:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B9C10E838;
	Thu,  6 Mar 2025 21:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dEn4wvx/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA8210E838
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 21:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741296983; x=1772832983;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=uulwj/VCWEed9GoakH41rQZXW7FDVQoNyUtSB0haxns=;
 b=dEn4wvx/Ssy6YmdtS+VlwPG4ChjS3Z9JyG7iAJ2JjMITD98C8a9xwt+u
 KJKEd/mAeKhJdbn0ANyTH/vMdCwgaJd7tMaTgBCSGkVmYYF/IXYrjMANF
 zx5/CmrJwfgomGvd+ocAt8CdHWI7wy7OIq+7AspmuuaFtuayUjA0kALSs
 qvR5COK4O7Y+1QgKm3UQ8ylKrr1BAdAtkpT6eQ4fW5AbTaYchjUu3b7ic
 GhY0clPOjrIXGgulKwK4HrUQW7I99kpA4UZ7MCCSII2MLATjaRGhbRuVl
 aI8ncXOgOrAIwFoXLF8BUOPPD9VwfvfGuRTqxKCZlhX7oQkiwSYKuVkdD A==;
X-CSE-ConnectionGUID: KyU/3KQ9TNWdJd3CmdSaeQ==
X-CSE-MsgGUID: VoJGzMLMQh2oad2vVTFr+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="67708073"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="67708073"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 13:36:23 -0800
X-CSE-ConnectionGUID: sTGQdk0iSuedHJeozVKOFQ==
X-CSE-MsgGUID: dDY/w1FqQPGaFLEcNKoO6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120055574"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 13:36:23 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 6 Mar 2025 13:36:21 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Mar 2025 13:36:21 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 13:36:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EPdwqOvyxuiSsUeLloWM3AMEfhq3EwMe+MChv0LqeVhvzvpwwJu2wmeb++XpdA3vN6yGEXO9OuxmGb98LtgMJphzjvowNWAituMJa72Wcop+KwcNA0yKhuPJnG5ywhu5L/o2KwoJTXZZ/cR0e+cmCLzowoWwc+j0YlfiJYGdVz5Q0CUrRwnjYeHiVi4k0qwdlJXSA95yAMykk4rawh03u/k7N3jRmLJHSddLAVQ0a0cPvFDPQsJrp9AaffLIf2inhn8DOA5spfokxom1Z7X9WSHViu0KV2Z0sSj4qNmcoJ8fzfhDj5uOU+k8yTFaZ48hlVxTkEtGjw9JSzWhDYOtNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssR2u9IPD+TSdbCE6hXC5IpFtVDFPY/3kmA9zJKwI24=;
 b=fzK3gKIRu+xP8svOdu2bsnyzz5JLXCCauPgTGZ2y6QDLbzjTCOdlZRVi7mHTUHJMjlexwEqvBFDWXyT7ZC0hqMvPDWGfNtJtVpqYA1IIhsEAk3LQ+JNq7KHfA2E784yGMnrb1S0TLHIDEbNzonV8PYGONz6yUMpIA26v+gjWcGgqVErb7k1pNE9wXF3Nof2YQ5Yi//O0W5exyJK+jmjkzaGY/bycjCXjtgztu9qvhTECFiXygPj+f8ZFaT+fWERx+N180MN+mZto2lxJ8c1qvXSZEqlFJqiUxRq02VXFzrjjEbhllO1pUonZpQzlfptH6DrRFt0bnzIEzogSwMlpdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 21:36:19 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 21:36:18 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 0/2] Battlemage D3Cold issues
Date: Thu, 6 Mar 2025 16:36:13 -0500
Message-ID: <20250306213615.1004502-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0388.namprd04.prod.outlook.com
 (2603:10b6:303:81::33) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB6006:EE_
X-MS-Office365-Filtering-Correlation-Id: 37bf9c0a-5f95-47d6-07a7-08dd5cf6ee5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QEtsnr5D+KoLo2gzjmFwLDjN6KodGCeoq/70RFW8ggFWzriQ2zCksRwh35Mk?=
 =?us-ascii?Q?RG0/QywbfIvsw9d1x8bksUh2sXpfdxnkqCwjbnVp37q5/9ORjDBmwF62+YCt?=
 =?us-ascii?Q?kQqbhdIx2FNdCcVj/LPdMTZtfmjhrjyW2Y877FEgReziHNx3aXKYcFVd8F08?=
 =?us-ascii?Q?JJZVNTabX8asn6CLNsssMRy4YGxva/N0cyrBw2jWZx6iHszHh8Lst5IpLnfF?=
 =?us-ascii?Q?U7XzWXvan/IGMeMVKB8EsmQ2XUR4tYpVNWx/KQCRwoPXg/A7lJBostiGIchc?=
 =?us-ascii?Q?cNbVHf41zvGmeI3uLsHg3iBPj0Hwma7DmUndjc/ntUl2FQkA/xSjTConqy7J?=
 =?us-ascii?Q?tobv27Al9QS6pGvkTld9skJWQHUCV/e4aMVFG9pFjOamBs6arQGkJ+ptfxYw?=
 =?us-ascii?Q?j8a/avrqG6SVpGYt4Ked800MuiGnFCemKdMnxjbZJiS0VMvPq5jVWtdHtYjK?=
 =?us-ascii?Q?j01Ijz4BXnEYmjnlHRveal7gb9eamoAb913/AYxBFhVhkJqeVMNTO8MNpHkK?=
 =?us-ascii?Q?A1c6f+ZEkM4CKY3DgctPPfYYQdkGIFkP/dgbDgagyRP3Q1vL1A/7zpIbBs60?=
 =?us-ascii?Q?p5Bzn9sLxAS5iyaCN2cCUHOL5QyYKBezEIYEzgoxOd0ZSbCRHo0gK3+/Pt+N?=
 =?us-ascii?Q?+MGrnAX1quui9Zxun0VNOJwMJOILYod8nWC+4JRxXTWwWQP2uLnLgWvtavuD?=
 =?us-ascii?Q?jmJYNCTrYwgPIzLCwLJDqqlw9MAxnqJgMT7XNVrBFEpKLbeQL/fOsc0Ho6Vd?=
 =?us-ascii?Q?lHXZFLEprHhhrEH7JyLu+W+LkIjBMi0j/49rC2I/Neb34h44eJwZc89RVTKf?=
 =?us-ascii?Q?/Ega/Pw35wY3zYmDB0rZl7i8H/mtAgWHR0KZuuN/0l0e2dX+XcCxPJRf8g1d?=
 =?us-ascii?Q?DIBI+rcSlMb9XVzkeRmU1LCTt2FjHo921bfeYM15WsuECFcJ5hZk6j+i8VYJ?=
 =?us-ascii?Q?UKteOu32/FRgoQ+5kPDYI+fUdzX5xyizp38/kYOVxds3ntY8TLr1LKGObXfJ?=
 =?us-ascii?Q?+I4sNm0bxtvSfKHLKgND4vkAOEjeQHaQ5oLad5J8wkljKgqzEVK8Wm7EIu0O?=
 =?us-ascii?Q?rdXW3hdQ0pB3b6BONch4fnR+djCwfqTIoyJt+Bf7HoYPJMGyCrU2YApUP7Zb?=
 =?us-ascii?Q?8rrWRpAqCh50ExX03jnM3QzosCoTTaq51IwsfPxGP352unHbWGQ6N/c+cWRP?=
 =?us-ascii?Q?MJIWuv+/B7ndtTsQi2gV/kNcoLpVjyddqosi/U9TdV7y7uoIlJwMqV2r91WN?=
 =?us-ascii?Q?f3x39f+ltaJUfAz18YA1Mv/rGzqEW4F+MEa5grII4YSFg+EmGJn0RnAYvIZo?=
 =?us-ascii?Q?moy3Rk0QApAdjhxm7y5Uk7emcGNy9ct9tWJRDOzLL76ioP91HlcUqxDSC9yr?=
 =?us-ascii?Q?i5RVePoYjvJZ/3+WArQQSKB/ylCL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u6/56kA7RXZS0mR38KUYb75YWL/xwp+ChA9+xFL91O6QXJwmNQ8bLMJn9lL0?=
 =?us-ascii?Q?pa8ahyuK9cXh0xDPzSpn/+hO9ROzNpWb794vjnLxYh2gPTLNrtDTuYqZjbxp?=
 =?us-ascii?Q?t6WBF4IIj7PKnFi2HMMnD/aK5gCmVCWhafcHqiWU9E909b46G9mrKxx16+Pj?=
 =?us-ascii?Q?crlnAuSW2/pH9ieBT9kAvZjI+1SRx3PJio45HqDSdZdbbS0e3dQFgMgiu1FS?=
 =?us-ascii?Q?UV2a4cbDXVJzrr80zc1pk6ZP0taa45/DQXUoHpd0Y/NoNil/MB1N2/sFQRbR?=
 =?us-ascii?Q?J6+4J8ce2HMPM16S/w+nUCa+5SV9kC5COKNL+gF3j3VoBIgyHo3ddYN8RbEi?=
 =?us-ascii?Q?Ps5c9YGlEgdYpiORtxlPX5qvdWzhE09ff+I+2/4jEVcMkBjQ01RevNYFrHvU?=
 =?us-ascii?Q?OYN2RjyynNH3u0SXT1KJU07OZPDe2/feBIRx6vqb4rcE76Sqy8kovPXGcIYe?=
 =?us-ascii?Q?X4bBCyUhbiTeixTyhsp5QRRIkgK5QXksidaqESPnUKlqjPJwOIRBYREJF+uP?=
 =?us-ascii?Q?LZ4CIdjBpMQ3TGW8ru3PYkXCBYR84l5Eu0o3C8/5zEJVf+r2pAe6+WXzktVx?=
 =?us-ascii?Q?EPfcR32T5nWC7Y3kWxrey34k4cbFeb0Jn/FQkY8FtOLFS2BGYv+eXZJHzk0w?=
 =?us-ascii?Q?QWoDfr37n7KAol1DoFcCLBq/7PvhGnKyDWCugLCft5ciNW1IL/JauGMcJXH3?=
 =?us-ascii?Q?GIC01ZoYA6vzotEVCypeeP1r3m/zhaZeCQLeXyi7BKctlwTMgAYnUvU8T0J3?=
 =?us-ascii?Q?d/lafjQYp7idqLlViDqM6/xfm4iT4HG9PhHEMKUDMh7Rfp4nC3GXy1aI5Ox3?=
 =?us-ascii?Q?EODtwi/mc5f/o8uwPvli84vPHEkBQFd7HHwyOnWVtsSMXWKNNfD3mvIFuK4W?=
 =?us-ascii?Q?2WwH4XRsfplJiuVTPYQrC4dO0TormftBkB2zb7I596+y9ADEqENZFo7C6G2P?=
 =?us-ascii?Q?84CUqxXa+oU452ULC06XQGK87STWSrh2FAkJLvMXELo+8UWCwCr2RoVtJLcE?=
 =?us-ascii?Q?XebE/O1XyT5FD7yX4Wq+mecCwP2JtS9UPOy6VRIZVOKnTUzRQMY7m8RNGYN3?=
 =?us-ascii?Q?pEVleyOiqavENZ7KA2eARRSrxFDwbTv+a+o36x0VYffS1hnb/o4eJxvcEmYS?=
 =?us-ascii?Q?qFdjQCp71Jvfk30lukFZPCJcBFgbivoVpXL90UqPPFmBqfZKScGkRdKKpSLR?=
 =?us-ascii?Q?YzCe7MDGYIFvG5WZRfuZ/bRt47+k2Hi2YCdOzjDxc8/Y9LJfOXSrMzK+mYnH?=
 =?us-ascii?Q?+RyrwV4M3cpuRQFh5o5buIlr30pK+BLXmRsTMkVWBe+Fq4sannkqQufyXF7v?=
 =?us-ascii?Q?+G/EMZnw+JhfATjrgvo6lpqRMelKDH+E7u7b60yoDLNITYzGRf+iFzcLItPr?=
 =?us-ascii?Q?TJn4X93CSijcQGRe4hcpnnuoPgH1JQmX/hPNf2PqA8GrISTzsRnLAbKcyixE?=
 =?us-ascii?Q?s4tWNRecUgjLe1AqPmYpO9AkaClwDOUld0agyhjSmtXE0Z9vQpoJHEdXypIA?=
 =?us-ascii?Q?6+ns8J0GZPFXxK85k9hODg2TpWc18iLEwuBGBVJUnpHr8jS2OPEGLxkva5IN?=
 =?us-ascii?Q?GGTAkg6OxgrkKU69Z7pS0T/EijSJzMcHqt5lvU5CrUWPTKqIsJAUJCHJzssK?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37bf9c0a-5f95-47d6-07a7-08dd5cf6ee5c
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 21:36:18.9200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5n8PQ4Yn5gwvVPaKmgUxSSleKChWNqN4yjrf4Vjf51i+uDczwlkNThoSsKmNlOqD2+BBe9fX+uLq9axBIXfq8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6006
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

Let's disable D3cold by default on Battlemage for our production
trees while we investigate the current issues. More details on
the commit message of patch 1.

But also, let's not entirely disable d3cold on our development
trees. So, the second patch aims to temporarily live in our
topic branch while we investigate the issues with firmware
teams.

Main justification for the topic branch:

1. The combination of the BMG devices and Hosts that we currently
have available in our CI and in most of our development platforms
have a very good and stable behavior of D3cold -> D0 transitions.

2. If we disable everywhere in development environments and CI
we are sentenced to regressions that will be harder later to deal
with.

3. D3cold on DG2 worked very well on multiple combinations. Even
on Host boards where now BMG is failing, so there's still hope
that we will get them fixed.

4. This approach avois polution in our Kconfig options or in
module parameter.

5. Our developers facing the bad bugs can either disable at
runtime by
echo 0 > /sys/bus/pci/devices/<addr>/vram_d3cold_threshold
or disable at boot with linux parameter pcie_port_pm=off.

Another possible approach would involve a kind of quirk with
allow list of the hosts based on the host bridge pci id. But
that is hard to maintain.

Thanks,
Rodrigo.

Rodrigo Vivi (2):
  drm/xe/pm: Temporarily disable D3Cold on BMG
  drm/xe/pm: Re-enable D3Cold by default on BMG


-- 
2.48.1

