Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E2DEDF17E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 17:23:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862AA10E301;
	Fri, 13 Feb 2026 17:23:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gdruj8Ww";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C261F10E23E
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 17:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771003411; x=1802539411;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=n4yLRn+/nxAbxa6HvfyGuoHToGmi/T1jnWLsQLdnvfQ=;
 b=gdruj8Wwnr1tBYPAtLyMjBme1M7riFq2BbMYALmldlQH0Z5GzcAqZ0Gv
 dq0p9wm8tyZs3vN03AkpqDn5UpWypWTf0QwYGwrGKEEP16X0bJSdr06nY
 e1iUeqDlo2hKfPJidYVhnL6mrr47iP1QFvH+088hYf0tG1NSF+wuIpbgD
 mKP9QOA8cmujAphynhiorBM1RfViKidYbxPwaYaetgoEDN7MEBYbiu1Ft
 tznJBcz8vOVUGQXDNDFAjgIq6SIPnnTn1jhtWDq0rQ2MuCaMQYyVHt1Y4
 29dHYy29XEjEwb8U9FzDGO8HTJMpj1M4renf/T4ceApFJmdPKVNoSWgHU w==;
X-CSE-ConnectionGUID: VWXRmJI/TlqW8+MfdifXQg==
X-CSE-MsgGUID: lF2Lchv6SXiCe24iEXa45A==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="89779828"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="89779828"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 09:23:31 -0800
X-CSE-ConnectionGUID: EloSnBsZQOmhsnsuFJWiRA==
X-CSE-MsgGUID: Kxpy3P/TTUiBjXimHKkOBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="250634062"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 09:23:31 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 09:23:30 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 13 Feb 2026 09:23:30 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.29) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 09:23:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sia7Cr9OWWK8YtPosdaFhjoBXX0mI00HPpeR4ugQt6dE/jOdRUnYyWwdKVm6336aqEOHHWjPSNYTMCmQs+YfooG/ZqgrOoUU456XPmg0fgcLMzC8dHvks9H8JiMq5/+GBNKKm6Rw+iT7rygGhp74VQJ0mDnldvSypUHyqr9VORXn4q255lemjx1HqMM4YWC+4IY81eteHYNkmLExHBvZdjd2zg7I7MdS++WxeXcr64tBA18HJ2dw+2jklWCjtEQ+FOmnxFXqEuBCnIEuDfB76omntEfqCve5XWtJY9TogrToIhdvly4qnzDE5s2SsY+TFhfTMNKJmt+5aM+h1xMcJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qvPZUnu0qq4PFBNdQ69SNva3EF9gRJZHi4WVJDuqpfM=;
 b=y80hNhXRcMKApvTBTCg6bhfrOhax03gPHJ5nHNpV81lChxJELuDCEew9pi5BDOFfcGszNllXAzgGDQr9Ucgr2yZwDdV4hZ8nJNLKbdK8cLQupb1DxnQ1hq25pRq/Pwj2LgGxDnG4Rx9ZmOfB39eBfZlJLyBglfyOzqLQkOaFjpciQ4jdNuWU1UnruDPIyFSeUezZ/uzmAvwu+rwdZOD4iNxxO/svL2DShwRM3TMBCJne8ye+NwiamkfaHc0oUG6ay17PCV/Yl2xK24LIlIO3YppcFnVE5lyWZzumys3+V3E6v98J9RDOaXJBD5x0MpWIgyvKylREWD/cdEHrnFNPNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA0PR11MB4703.namprd11.prod.outlook.com (2603:10b6:806:9f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 17:23:28 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 17:23:27 +0000
Date: Fri, 13 Feb 2026 09:23:25 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?=
 =?utf-8?Q?re_for_drm=2Fxe=2Fbo?= =?utf-8?Q?=3A?= Redirect faults to dummy
 page for wedged device (rev2)
Message-ID: <20260213172325.GD52346@mdroper-desk1.amr.corp.intel.com>
References: <20260212055622.2054991-1-raag.jadav@intel.com>
 <177097538306.251530.10825145589741737132@a3b018990fe9>
 <aY8420-5ptkTn9Ly@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aY8420-5ptkTn9Ly@black.igk.intel.com>
X-ClientProxiedBy: SJ0PR03CA0147.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::32) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA0PR11MB4703:EE_
X-MS-Office365-Filtering-Correlation-Id: a026778f-cec1-49ab-de09-08de6b2499b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r/2ug0KV57sKAYT+Sn54JgMy8w+r0FXtC2YzuOrbxUe1XuCoS7cc+vbeG2Ia?=
 =?us-ascii?Q?HcR8lFuWrP5n5YE3hMwMIOjDhvdy8bwFDD1IjpPcCa+3xo3zK1nCGCJ8PqWH?=
 =?us-ascii?Q?2n65msClGVQff1TGlr7E1U8gMO+i1bBmV/7hrkFDmaEEMkkEQFMaV2mOn9KR?=
 =?us-ascii?Q?v57n+hvfgxhzHDATcHCvjKRbXdwFVrS6UgA9AZoGF6FX/5gZ48MSR/djww25?=
 =?us-ascii?Q?T+M3qYfLoAmrIGZODx34mdcpCGTNEOlNqjbn7JW3aB2ZQqbB4433rBLUeLEL?=
 =?us-ascii?Q?izRKSIj+wzTbSz3xNRvE4QahcnQnZ/4D413guBvCt1ejCKB+q4LGNTKdUEV2?=
 =?us-ascii?Q?bGEEy9AGjl5vw2PqAM7H6RiYJwptZlCdlGVcdevD8G6yp2R8aAE3kCwgGWmx?=
 =?us-ascii?Q?lC/JTZSqETHwZVnWzKYOma6PZz/TNODQCRDliyum9GEI1iZZ4/Nh90FzkVcd?=
 =?us-ascii?Q?fzca3m3K1Do2ixedXdooDBNetP+oIKklziX1JVDl1hnnk5Ys+tp7qbnb/zI3?=
 =?us-ascii?Q?3uF291CIVA6AG8z/MsA2R08TMUS38ia2GDpnPBcSLYOIhMbTyxPrT06Eyr9l?=
 =?us-ascii?Q?DkWDfRQni4P0ILj/rW+bVb2jST6iStn42G0ev2Zmp+UtUgAxvr6o6O/V/L3/?=
 =?us-ascii?Q?ieupSLCFm2Q1tOgzw8v4bbM5/n2Ru2u9xKFN6+hVo2jMU+61pJY8kDYyIWpz?=
 =?us-ascii?Q?MbdWdnfBF93BA94F54AmdWo8pD6KwWNIQWECLdeOlD5Hd0W98Ji0j0vEHkMK?=
 =?us-ascii?Q?L0YNMv9h/ZwWbUKasNkkal0yPUvDNoC9On1OL/E0IAIqk+uNgIGejwPDWAd3?=
 =?us-ascii?Q?1FWHTUT6/Cgm2d2JqFJvQUBkQpggAkDUA/noFVeAq57k1z48XJ+LXvf5RJbM?=
 =?us-ascii?Q?HUEamojhdBI3L/j/heawt4C980v37lXUevLNEzQg+2xex4miapjnjqd7QMGI?=
 =?us-ascii?Q?WAIJV4kxTbOVCWyMXpCXPn48IQ+Miy1xPzeqnACzWVEkRgISqRHdHpnuwmH8?=
 =?us-ascii?Q?Z73/z3KTLFpZvTH3MGAqiZxkwkAMrmXlHWsUmY3Bj3vMFsmLcLNmXQJye5+g?=
 =?us-ascii?Q?pwUkHAN40AiygrUA8tlTittm3umw2mvEwU0EFhDGjoTg1RLkhzLs32lZfXAG?=
 =?us-ascii?Q?neJt0g1//J6kLpofPwLsK44+EPYc62kgNlkFXkHpJhbdAT9S/Yez9tVnifIc?=
 =?us-ascii?Q?UWzIoWnM1DgOeef9DdvNoLfyIo4rfeIlNZdpRAvl9Hl3Yuf2kjkTtt5iz2pU?=
 =?us-ascii?Q?T3Aq1iG2nOHp58GwNRgHS1UjEiJgnmyTrEWhLAWUBfpZdgMcR1NEYzT1umLq?=
 =?us-ascii?Q?iFaqsrFQlNBAB5jmghqhc2LhKWVfsQvS/xMyxvREYUzT/7VMg4PhLRW+XER+?=
 =?us-ascii?Q?B935K5Uttmbo+HclCBkBjpbUjLnbwSoOuhe0HcTw0oyQKdhI77LYesI0P8Da?=
 =?us-ascii?Q?4M3tAZJ4tVccW7l4PnoH8Aj2jsn0o7Y2T+XEjvu/2PEWKIT4tbwmImLxRmIv?=
 =?us-ascii?Q?LdDVAshUYMy4B5gT6/J8Y7fXNUhcb6IFkHpP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MhJIpU1msOjNiWD0/dqTf+W0nqxyg5OjSok7g7Hdg1z/ROA6wdjim/ZCJtXh?=
 =?us-ascii?Q?MWsV5KCHgvQppF2VLbA3SYH7v/7BKQI1rwXkp466A0aTtDYuT4ymGlwNBdld?=
 =?us-ascii?Q?buAqKFvrSv5prRGdLDXm0I2/pqQQsGX15StgeyVjinza+pQ1CWSqepai8/Pw?=
 =?us-ascii?Q?Y5y6/LrZfQvvV7LgC3dQdPdZpR/nHj8eJeD3vMaBfVMKIBjg07WjQvSinpXK?=
 =?us-ascii?Q?HQhudW25AruMjKlzThZQjo32BGoMXvYlDBDIz7rnZV4o5r1O4ytBFaLIs5ic?=
 =?us-ascii?Q?sZKTY3PESa7VtUVEOQ2JmJTWaxSPn6SBJzPZjhcYsTIsKfwIpSBbo0fgJG/Q?=
 =?us-ascii?Q?JBjt3hWR6czdVcILtPUXhuBXBsa0lcroCxZQI5GZ8h6ZkPatF215juEVnrb5?=
 =?us-ascii?Q?Icr7LF6mLtX+rSsnoUyagJyEDWzrV0F9DRnPjZQIyoBaoqPeECoAUhbGXmS5?=
 =?us-ascii?Q?PP79EKjynAMaWRluyVPqSwK7FXWnsHPzzZil17n3BcpUoCimc3+Z0eskKz9R?=
 =?us-ascii?Q?MULzmR66RKwNTFRD+znwo3NiTMiCRZFEsHx+ekgsgPbVLVU5MOco1foBqchY?=
 =?us-ascii?Q?V2AXna44mcUxZ9vR9TEua+BX4OxObtaySs/vy+lYUEovoEjKl76aJgMjRwQc?=
 =?us-ascii?Q?HZasUmNWeVZ7ddoR0VjyvLl0EFyPXRhqsYBVodapj3lZFMqG8GkMe4+sPtv2?=
 =?us-ascii?Q?W5aRYPEn+qeAzHRxDLQsL0gdBT2us0EuBhFPHo6nuCW1HMx1OS8M6G3KtRbj?=
 =?us-ascii?Q?1vIrxx/u46DvcZADYuSiZvwTUU1MaKI633RFhgW7CKxLchR4PJEW2+VP9+03?=
 =?us-ascii?Q?PjANQ8bAyj/nNax7QjJ57xHFVKrLAx93s0ufr4Tp1oZsXnd06T2x/UlOmV0s?=
 =?us-ascii?Q?Vd9IJ3yBWsVDv26vGoNJi7DwFUQVbUgV9g8pcquaRGK+uBnWbKYqsByzD7Dm?=
 =?us-ascii?Q?T0Opy+wXstAJj5lwUO79T5KMTua7Got/I+W5rmnHhOl86dRGeNAlpEB1a2b7?=
 =?us-ascii?Q?02xZvB6JyAs3a+yTPAA6AxmS93FiIrLHTAC4/f7FLYVsId70MyAtQSn8xpQB?=
 =?us-ascii?Q?8A+4Gc4PK71fWSBECsluVO3u3i1CbCm8lnv0WOFck65r5K6vKKrZ5D3yTukE?=
 =?us-ascii?Q?uSpHnJVqpISdt0zibQ7A+bpA4Ffq8+SMQY/Vr2akI2qtNLkXohxHw6pbtRiV?=
 =?us-ascii?Q?vkoGKy+ikS6vK7sJy/NdQqvVUo42KeCGJJLv8zGqWxKLw8Tfd1wVtS4Bpx0b?=
 =?us-ascii?Q?qYVRKB0D+db0eg6LyVo21fdLdiyPBH8vBB/wQzzYcKmQ3MsVlb8u2wnz4CKf?=
 =?us-ascii?Q?H8tmHMoKN9ww9DAmI25d+6A21QGs+1bCQtIK0rlfRSC7c3zxPizlaDDnrb85?=
 =?us-ascii?Q?WPty4dp5nh5aU7knzzXq97dCRQ+sZwuia4Z5WHFYzm2BYu/NgqHN7atgWwZN?=
 =?us-ascii?Q?9HGySVGUTNZy3GV/YRpkfI3hrTpjQrFF6MJSCeiVd38+3EqnFc1bAzgM18n+?=
 =?us-ascii?Q?Jn2DIIYYCpyrRJnWdGh/C+NgTUT4xih9gr5U0VMtRTY5QkLpCfjHQiXLgQSY?=
 =?us-ascii?Q?INOe00KtVP3S6RTFK8IrruAjve+bSyelZHpfowb9WAK1EI1dAALF4FnMs1Wd?=
 =?us-ascii?Q?PjETfwWtfM+Lx28j2UeMDQwa8dU1k8GuqCjk4jqsNp/NyNIeYmrxlKNdK7nL?=
 =?us-ascii?Q?300MuunKN0+KvBf6qtOwkc2x4Fr4maLZ3v1RCdV6Zr+mINlsPJReup4mwYAI?=
 =?us-ascii?Q?fc4yCXj6pcin8JkftvIKX6uY5t3ajUA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a026778f-cec1-49ab-de09-08de6b2499b1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 17:23:27.7456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RkhiFEWXtVzi6MnnFA7SlGmNXLuBNM/F7kyfhfn7hOgH862k9PJh75+pwJ43Ke9IbkQjx6IMo4P9fXTvQt82GtUF1ADethNLAIrf9b0cFgs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4703
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

On Fri, Feb 13, 2026 at 03:44:43PM +0100, Raag Jadav wrote:
> On Fri, Feb 13, 2026 at 09:36:23AM +0000, Patchwork wrote:
> > == Series Details ==
> > 
> > Series: drm/xe/bo: Redirect faults to dummy page for wedged device (rev2)
> > URL   : https://patchwork.freedesktop.org/series/161507/
> > State : failure
> > 
> > == Summary ==
> > 
> > CI Bug Log - changes from xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68_FULL -> xe-pw-161507v2_FULL
> > ====================================================
> > 
> > Summary
> > -------
> > 
> >   **FAILURE**
> > 
> >   Serious unknown changes coming with xe-pw-161507v2_FULL absolutely need to be
> >   verified manually.
> >   
> >   If you think the reported changes have nothing to do with the changes
> >   introduced in xe-pw-161507v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> >   to document this new failure mode, which will reduce false positives in CI.
> > 
> >   
> > 
> > Participating hosts (2 -> 2)
> > ------------------------------
> > 
> >   No changes in participating hosts
> > 
> > Possible new issues
> > -------------------
> > 
> >   Here are the unknown changes that may have been introduced in xe-pw-161507v2_FULL:
> > 
> > ### IGT changes ###
> > 
> > #### Possible regressions ####
> > 
> >   * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-multi-fault:
> >     - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
> >    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-multi-fault.html
> >    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-multi-fault.html
> 
> This test is passing locally.
> 
> $ ./build/tests/xe_exec_system_allocator --r threads-shared-vm-many-large-malloc-multi-fault
> IGT-Version: 2.3-ge0961900c (x86_64) (Linux: 6.19.0-rc2-xe x86_64)
> Using IGT_SRANDOM=1770993370 for randomisation
> Opened device: /dev/dri/card1
> Starting subtest: threads-shared-vm-many-large-malloc-multi-fault
> Subtest threads-shared-vm-many-large-malloc-multi-fault: SUCCESS (7.664s)
> 

Looks like CI just lost access to the machine while the test was
running; there are no error messages and it doesn't appear to be related
to this patch.

Applied to drm-xe-next.  Thanks for the patch and review.


Matt

> > Known issues
> > ------------
> > 
> >   Here are the changes found in xe-pw-161507v2_FULL that come from known issues:
> > 
> > ### IGT changes ###
> > 
> > #### Issues hit ####
> > 
> >   * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
> >     - shard-bmg:          [PASS][3] -> [ABORT][4] ([Intel XE#6652])
> >    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
> >    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
> > 
> >   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
> >     - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#1124]) +3 other tests skip
> >    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
> > 
> >   * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
> >     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2314] / [Intel XE#2894])
> >    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
> > 
> >   * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
> >     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2887]) +3 other tests skip
> >    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
> > 
> >   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
> >     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
> >    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html
> > 
> >   * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
> >     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#3432])
> >    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
> > 
> >   * igt@kms_chamelium_color@ctm-0-50:
> >     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2325])
> >    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_chamelium_color@ctm-0-50.html
> > 
> >   * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
> >     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2252]) +1 other test skip
> >    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html
> > 
> >   * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-1:
> >     - shard-bmg:          NOTRUN -> [FAIL][12] ([Intel XE#3304]) +1 other test fail
> >    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-5/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-1.html
> > 
> >   * igt@kms_content_protection@suspend-resume@pipe-a-dp-2:
> >     - shard-bmg:          NOTRUN -> [FAIL][13] ([Intel XE#1178] / [Intel XE#3304])
> >    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-9/igt@kms_content_protection@suspend-resume@pipe-a-dp-2.html
> > 
> >   * igt@kms_cursor_crc@cursor-offscreen-128x42:
> >     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2320])
> >    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-128x42.html
> > 
> >   * igt@kms_cursor_crc@cursor-random-512x170:
> >     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2321])
> >    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_cursor_crc@cursor-random-512x170.html
> > 
> >   * igt@kms_feature_discovery@display-4x:
> >     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#1138])
> >    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_feature_discovery@display-4x.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
> >     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#7178])
> >    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
> >     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#4141]) +2 other tests skip
> >    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
> >     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2311]) +7 other tests skip
> >    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
> >     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2313]) +6 other tests skip
> >    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html
> > 
> >   * igt@kms_hdr@static-toggle-suspend:
> >     - shard-bmg:          [PASS][21] -> [DMESG-WARN][22] ([Intel XE#3428]) +1 other test dmesg-warn
> >    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-10/igt@kms_hdr@static-toggle-suspend.html
> >    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-3/igt@kms_hdr@static-toggle-suspend.html
> > 
> >   * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-5:
> >     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#7130]) +8 other tests skip
> >    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-5.html
> > 
> >   * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-5:
> >     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#7111] / [Intel XE#7130]) +1 other test skip
> >    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-5.html
> > 
> >   * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
> >     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#7111] / [Intel XE#7130] / [Intel XE#7131])
> >    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html
> > 
> >   * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-5:
> >     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#7131])
> >    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-5.html
> > 
> >   * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-5:
> >     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#7111] / [Intel XE#7131])
> >    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-5.html
> > 
> >   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
> >     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#6886]) +4 other tests skip
> >    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html
> > 
> >   * igt@kms_pm_backlight@fade-with-dpms:
> >     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#870])
> >    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_pm_backlight@fade-with-dpms.html
> > 
> >   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
> >     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
> >    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html
> > 
> >   * igt@kms_psr2_su@page_flip-p010:
> >     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#1406] / [Intel XE#2387])
> >    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_psr2_su@page_flip-p010.html
> > 
> >   * igt@kms_psr@pr-suspend:
> >     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
> >    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_psr@pr-suspend.html
> > 
> >   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> >     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2330])
> >    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> > 
> >   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
> >     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#3414] / [Intel XE#3904])
> >    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> > 
> >   * igt@kms_sharpness_filter@filter-scaler-downscale:
> >     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#6503])
> >    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_sharpness_filter@filter-scaler-downscale.html
> > 
> >   * igt@xe_eudebug@discovery-empty:
> >     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#4837]) +2 other tests skip
> >    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@xe_eudebug@discovery-empty.html
> > 
> >   * igt@xe_eudebug_online@pagefault-read:
> >     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#4837] / [Intel XE#6665])
> >    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@xe_eudebug_online@pagefault-read.html
> > 
> >   * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:
> >     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2322]) +1 other test skip
> >    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html
> > 
> >   * igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind:
> >     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#7136]) +2 other tests skip
> >    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind.html
> > 
> >   * igt@xe_exec_multi_queue@many-execs-close-fd-smem:
> >     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#6874]) +7 other tests skip
> >    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@xe_exec_multi_queue@many-execs-close-fd-smem.html
> > 
> >   * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:
> >     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#7138]) +2 other tests skip
> >    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html
> > 
> >   * igt@xe_multigpu_svm@mgpu-migration-basic:
> >     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#6964])
> >    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@xe_multigpu_svm@mgpu-migration-basic.html
> > 
> >   * igt@xe_pm@s4-vm-bind-unbind-all:
> >     - shard-lnl:          [PASS][43] -> [DMESG-WARN][44] ([Intel XE#7161])
> >    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-lnl-1/igt@xe_pm@s4-vm-bind-unbind-all.html
> >    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-lnl-4/igt@xe_pm@s4-vm-bind-unbind-all.html
> > 
> >   * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
> >     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#4733])
> >    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html
> > 
> >   * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
> >     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#944])
> >    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
> > 
> >   
> > #### Possible fixes ####
> > 
> >   * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
> >     - shard-lnl:          [FAIL][47] ([Intel XE#5993]) -> [PASS][48] +3 other tests pass
> >    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
> >    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
> > 
> >   * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
> >     - shard-bmg:          [DMESG-WARN][49] ([Intel XE#5354]) -> [PASS][50]
> >    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-4/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
> >    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
> > 
> >   * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
> >     - shard-bmg:          [FAIL][51] ([Intel XE#5299]) -> [PASS][52] +1 other test pass
> >    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
> >    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
> > 
> >   * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
> >     - shard-lnl:          [FAIL][53] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][54] +1 other test pass
> >    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
> >    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
> > 
> >   * igt@kms_pm_rpm@universal-planes-dpms:
> >     - shard-bmg:          [INCOMPLETE][55] ([Intel XE#6891]) -> [PASS][56]
> >    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-3/igt@kms_pm_rpm@universal-planes-dpms.html
> >    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms.html
> > 
> >   * igt@kms_pm_rpm@universal-planes-dpms@plane-134:
> >     - shard-bmg:          [INCOMPLETE][57] -> [PASS][58]
> >    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-3/igt@kms_pm_rpm@universal-planes-dpms@plane-134.html
> >    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms@plane-134.html
> > 
> >   * igt@xe_evict@evict-mixed-many-threads-small:
> >     - shard-bmg:          [INCOMPLETE][59] ([Intel XE#6321]) -> [PASS][60]
> >    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html
> >    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html
> > 
> >   
> > #### Warnings ####
> > 
> >   * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-5:
> >     - shard-lnl:          [SKIP][61] ([Intel XE#7131]) -> [SKIP][62] ([Intel XE#7131] / [Intel XE#7250]) +13 other tests skip
> >    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-lnl-8/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-5.html
> >    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-lnl-7/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-5.html
> > 
> >   * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:
> >     - shard-lnl:          [SKIP][63] ([Intel XE#7130] / [Intel XE#7131]) -> [SKIP][64] ([Intel XE#7130] / [Intel XE#7131] / [Intel XE#7250]) +13 other tests skip
> >    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-lnl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html
> >    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-lnl-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html
> > 
> >   * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-5:
> >     - shard-lnl:          [SKIP][65] ([Intel XE#7130]) -> [SKIP][66] ([Intel XE#7130] / [Intel XE#7250]) +25 other tests skip
> >    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-lnl-2/igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-5.html
> >    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-lnl-1/igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-5.html
> > 
> >   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> >     - shard-bmg:          [SKIP][67] ([Intel XE#2426]) -> [SKIP][68] ([Intel XE#2509])
> >    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> >    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> > 
> >   
> >   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> >   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
> >   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
> >   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
> >   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
> >   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
> >   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
> >   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
> >   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
> >   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
> >   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
> >   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
> >   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
> >   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
> >   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
> >   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
> >   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
> >   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
> >   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
> >   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
> >   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
> >   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
> >   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
> >   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
> >   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
> >   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
> >   [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
> >   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
> >   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
> >   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
> >   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
> >   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
> >   [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
> >   [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
> >   [Intel XE#5993]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993
> >   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
> >   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
> >   [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
> >   [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
> >   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
> >   [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
> >   [Intel XE#6891]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6891
> >   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
> >   [Intel XE#7111]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111
> >   [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
> >   [Intel XE#7131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7131
> >   [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
> >   [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
> >   [Intel XE#7161]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7161
> >   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
> >   [Intel XE#7250]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7250
> >   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> >   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
> >   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> > 
> > 
> > Build changes
> > -------------
> > 
> >   * Linux: xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68 -> xe-pw-161507v2
> > 
> >   IGT_8751: af788251f1ef729d17c802aec2c4547b52059e58 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> >   xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68: b4bfe7d753afaf6ea4950111a309a4e2ef5aef68
> >   xe-pw-161507v2: 161507v2
> > 
> > == Logs ==
> > 
> > For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
