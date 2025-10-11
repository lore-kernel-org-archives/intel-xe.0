Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D284ACCA476
	for <intel-xe@archiver.kernel.org>; Sat, 11 Oct 2025 15:13:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 816A910E098;
	Sat, 11 Oct 2025 15:13:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HXS/KEIH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E94110E098
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Oct 2025 15:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760195594; x=1791731594;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Wgzcls21X3TtvOs7KofKDT3NzAdRzNWtZYTUm4sKIs4=;
 b=HXS/KEIHOgeN8L+MT5Ay+IBToA3/38P8VMY1gVsX0LX2XL72ZVZyEvkI
 DmO/21fickSE5SHXSPT9kWBf0SRXQcFxXcoZiXXpFMVIPPVFpOFCJG3Lh
 +DZdZrAsWIgdfWHqnthkLhP6lCRpwALCrjutsx0gTd0SQUg2ntLQG8/zG
 9TXw0v8H/tzW3Yv2c3amXfOYSAYYbcJRxkhl8Yk1rrWkxB57o88SuNg6Q
 C2MOCtgXaHRtIUZscPKWDdFFMGFc7/0BXKdYewn7jBiFd4jkO745kug7I
 ZuRwOChJsRyba5BiOzxmgGGEDkj0K8fjy3oOIGcLTWHxwNgcQl0Lo4ZMp A==;
X-CSE-ConnectionGUID: K71F0MDxTei/kEUfQin8gg==
X-CSE-MsgGUID: 30+0aeAzSF6DzLQCFimg/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="73733144"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="73733144"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 08:13:14 -0700
X-CSE-ConnectionGUID: pWRGmdIxReOe3y2kSDQpdQ==
X-CSE-MsgGUID: hnZedkiATtGuwDXN7oLa8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="181158964"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 08:13:14 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 08:13:13 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 11 Oct 2025 08:13:13 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.42) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 08:13:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dtkTXb1M/UIbwjBQafMiCdvoNlnHdm3tySvqXjtd9FX2ZzasHVALy2k7RNGdWA0Grcsr8V8stLrbpMGUtUu/ApWFSiHyqmDm4m1rQ7MIc/w11J7g/hqMcyW0ih1hIpsfgfgb6+MgrX9tBEDwkhX6na2GrbD+htOklw3rovAhIhRZNN0+G0VfSq094RzD7FsizFglK6hgfpGDQXPgSFVUX/EoJspj+cQ8HKoal4oZfOBMR394mVUN39O9Bc2tPK/M/gBLHBxx/u7a3KsOIccqU7msGu4wmr8vilXkQJy7cKQNfuZWJiGyhfPePa7ODRuvxCl5kMj4XSilL4eB6VuRCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQ/DLqCYjag3qr3DgGXp4NQ+4CyYGRnbf5ewP37fMHA=;
 b=thgoaDTKF6NJR98ZOsBX/8JVBXJ0qXWbbXbLx09OfxaaAM2RfJnJ7EkwjiUuMNs+DGQQoGLsiXv5lMqAVOGMW4gwu0CW4LrrZzdX7UcyGJV3nDYNDHyYqALY1hpahEBGsx5Wgnk76xOGs+UAqZGs9XLcO0KeHssq+jKPYAtjdZuzY8Jz6sUAfS0t69/v2qgEVSFcBupqsvcDNnyykThxAeYX4lczi1+pzCnZmL+v5+WG0CEprpmbzb/P9mW4ryrtoKMVTwJ8S77HPCXLIVABrKTuUV3Rz06Hv1FInfusEUpoxlYq3IngNnNQJoRuhrzqD3etj0+l3xpRnEMSi0uUNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS4PPFEE549A404.namprd11.prod.outlook.com (2603:10b6:f:fc02::60)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Sat, 11 Oct
 2025 15:13:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9203.009; Sat, 11 Oct 2025
 15:13:06 +0000
Date: Sat, 11 Oct 2025 08:13:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>,
 <matthew.auld@intel.com>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2] drm/xe/guc: Check GuC running state before
 deregistering exec queue
Message-ID: <aOpz/xRmpC+zQsrI@lstrano-desk.jf.intel.com>
References: <20251004173033.2511250-2-shuicheng.lin@intel.com>
 <20251010172529.2967639-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251010172529.2967639-2-shuicheng.lin@intel.com>
X-ClientProxiedBy: MW4PR03CA0205.namprd03.prod.outlook.com
 (2603:10b6:303:b8::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS4PPFEE549A404:EE_
X-MS-Office365-Filtering-Correlation-Id: aa07cd82-0bf1-4513-4e73-08de08d8adf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E0Qyxcl62rZmpWLwwfziAlf1Am/ColcdnWnTiDLw7j9Lo927zJHESVHxCNm2?=
 =?us-ascii?Q?Z968G3MsSabCWMT+VM0m40nc/SwQwMB8+TccmDYpmLsGsyoOpgk1+Yya3tMc?=
 =?us-ascii?Q?h2eXpPJCHrofa8u145s0fJ9VHXBCw+N+jbycLYzg7dR8KFs1sevRepH4vM8U?=
 =?us-ascii?Q?sPyTyohOiTtnEyaaz1WNarTj6kmne5eDzBidLS/LqOEJHQQWtefX9nRApP6Z?=
 =?us-ascii?Q?tBfwTPMdbagrxStnt8orH7w7FjjrbrqW1TQdhzHOZs+S44oHNvE9PUIowNqb?=
 =?us-ascii?Q?ChHKx0oO5XhN8gGxY5vyUWyaR20l0GTUItCPiPz4Kx0FysWKcfIGm9GdYG6W?=
 =?us-ascii?Q?ojX0zD5TL7VSmNGQLs9RnnUgdcBwtHKgpeJQTNqjnZeD/ORGw3/jhGHFWjnu?=
 =?us-ascii?Q?ivres3dWzu0TJSja5Q/SC8g+g8gZb/CeSL+WajwXZvCDJStupcrWkJp/OfOr?=
 =?us-ascii?Q?++jlzsgrIBGqFn2cVgbbQguFYdQhzW9+vKLeD6Giq/Z6E1bchQrDh0bocs+k?=
 =?us-ascii?Q?FUkuZ6vJwuKiZ/5PjJcC1Moub/pWurgiqeqYG4oLU/W8KWweZFwA/DuCEkoP?=
 =?us-ascii?Q?xFGReiZVoDRv6cyyj85eV8fOoYDCHhgSa0PKQYGKAGuOjS/rfZyjPBBg5sUL?=
 =?us-ascii?Q?kBwnVoC0IY7KVjpIIjd7VOAUQ1+NYKE2jyUb+Y5qd4Ve5FFbX+4wuTHwUYRU?=
 =?us-ascii?Q?L76myIaetfMcFxrJ2LXtDQ+qT+nVebwBqLlXaZYYYWnVPbAEsga24aKMv8Wt?=
 =?us-ascii?Q?R3tsO6QKDBdUsFVkvhb6KQ2AHACarJXkIElmIuVXCl/drC4VQh3j2WFU2f5H?=
 =?us-ascii?Q?OGxso+qPwhyHZnVQuYTfeP73lHnHK7voHkkBzi3ug7lUs64hSrDVHTbvwpKV?=
 =?us-ascii?Q?feZGTi2Ix1uFvI9oSXK1bvtOv0vswOeCor36TookKBRNcBM2o2aWkZF0XPIS?=
 =?us-ascii?Q?VTV2mVO+6PxVe1Cahe+wKbS76lrOljoqfm+iS7EcGGLZrNkoon6302+S2Maj?=
 =?us-ascii?Q?oQ1sUnSXZQp237+zMAIIu3hbCMztoBydwi84nGhHL5NxGGaJbbwOapb9xrYf?=
 =?us-ascii?Q?ZkH2BiuTI3ELhSfL2lqGjl2r7KT0744nUwSnHTO7NWyhv2m2U1S7qq/BYkVg?=
 =?us-ascii?Q?NKTemhIlIy/bDZkJAN7r3eW3PYVWdk3ZlAseuflbHkdkQnvH8yDAKsbOzUQ1?=
 =?us-ascii?Q?iFjBkSDoD3UL8E3hHU8s8IfQ/F/RBqC25lq3+gYijk3Gpx5In4SICKJHHZUb?=
 =?us-ascii?Q?81e97ZA27+osTUia/3e6WtYqZtvG4+1aWVP+QmrNo2+IXiYLWzKJkCgrCivE?=
 =?us-ascii?Q?6dFJyjQDP7hBt2Jwwm3R6uUdKfx6uS8UhuqDLX3g8mtJ397IV3dI1luUfVbd?=
 =?us-ascii?Q?1a+inpqHmrj2E8ePUDmb/CH9rn6Lse6kKrtcgWA+OAaYIMI3F59rYMXA9LfE?=
 =?us-ascii?Q?ACP7ySioQTSSF7biOKFI49+HEImhNl0c?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4uQZXD1O4aGNojc4WzLQcFv0P9Sz7lddlhuJDIhVUYBV3LhN5YL7Dlp5cPXk?=
 =?us-ascii?Q?adQGdhQVyE9dI85qS/sNGFk9NY4QZ0T7HaU0rNbUz2pUmHhgg6Az2Mbbl8B1?=
 =?us-ascii?Q?6S86uAE4mcxCLd24yperP4mIt9gUgcBMnNy25sbs74lgb1qbN9/AhaHx3V9T?=
 =?us-ascii?Q?Aj39DXx/GhsnLBjjj3jEfLC6y4ZudF3MjZWN4sfqc1GQwb3YonYr6LBhyJ+I?=
 =?us-ascii?Q?oLzAzZ+qcDwqn3Jt3cCpYzeg2nv79aQK4Jm69DeQi1w0ZcfMexti7GEEu8LZ?=
 =?us-ascii?Q?0JRcJrstHh3TPwDjgHRNByQJuIhOUi/6wKTOwg/Bl55yhrPwq5dPevJ1bc6A?=
 =?us-ascii?Q?CYCGjNhEzSem9M0/x4qbB2Te6xfpR1rA9bFxFh14zs7ztRbO9jktxKKEWu64?=
 =?us-ascii?Q?QJVGGLbSi/KVi/nHMNsm8X1fxVCOs/9h4qLe+aIktgNa885anUBg/MgpVm9Z?=
 =?us-ascii?Q?CKs27xKHVAIRrh1wuP8LjG2Cf18YUAnyYm7+EHyyLxOS+KnP/WC82N1bTVW1?=
 =?us-ascii?Q?389mDBVvbjThAXupwS8xxE0Wz67Sha1bq07956KyVCU8GRzTmzOaP8evcIRR?=
 =?us-ascii?Q?kGxtyXmW31oxLmf3VJ0DUHw74WoBr5UVGMgtiV04+1yGUw6UQr9ep67IEMtI?=
 =?us-ascii?Q?CQaBIggvpcCTISlbqQ8Ia8GYkwnqKbxCo7KkLxFg3ufA7qiu4CEsoDlX0Z/2?=
 =?us-ascii?Q?cmQARuJIyVg7kjgF3C4DxpBs4xvNKxyVbphc5fl1aOkSkDJMiKcNX7w7ZumT?=
 =?us-ascii?Q?Wjne/oABFUWlk6TkuKhVqqevBwbznM4LeMe35sSWPlnfCxQOoMPjs7y2qFmf?=
 =?us-ascii?Q?Bfsb4xKLjXt3yTv3taVWGGVnxVOB3ehN0yaRx+OLy8GsXV33X1NgKRiWzd/i?=
 =?us-ascii?Q?Q991kFiSPAMuwtsU9kYC/3E+y+nFIm328JuCA/DxxVje38Cg4d6HE1xaIPkA?=
 =?us-ascii?Q?bP5g7eb8M4zofMzCuqWGLWfyKZTWmzNAqYSK6e1rH8Tpl4G9VQMuvJyGfyBK?=
 =?us-ascii?Q?esJvhTpO7MlDIC1RETM5t73VbDUpxvq6hKuKPYfQ2EjqNE1rUPJ4bpT/EB2e?=
 =?us-ascii?Q?BDfZR0dLH2Mae7unDEl4qIyGeozHBqE4OXA2hrxWrd+aMG+nq4PXRVC//IuW?=
 =?us-ascii?Q?jYOIANw8nPaHiGFD1USskNB+IV3TdN6Gc/W4imOqsX4K0AAnIAzABEwsU6J0?=
 =?us-ascii?Q?0A1ABWtxBKy2uFZeQ6eg2QWu5cdEb9C+LDGs7zJgc26+q9VUYxHb80VW6S+k?=
 =?us-ascii?Q?wyyz1wvr9JNHbOdmxVW8OAiIiHpb2D3s85CoTnDZIQkzsnwFTIVpqO4R6VMB?=
 =?us-ascii?Q?2t9HPcVESmK1mHu5BwzkHbftzomFLr0FvJR+8oAWpM6ef1IozxJcu07Z3gYy?=
 =?us-ascii?Q?j3fr9a9KgcTkFEAvQXM1Vu8C2J8xBUwc+wHMYQZLCz790K41yf8iptuhbRdm?=
 =?us-ascii?Q?6EAUUrv/EySfJ6JdGBjFNZ0WhtvmRaxFtwhMhL5nPxvqDCEt4zHBCV1BY8wi?=
 =?us-ascii?Q?d27YvabgYkaoBeeEnqzIRMaPDqbbai14GbMLQNoieHJHfvdZP02Ubt2SpNs9?=
 =?us-ascii?Q?NBGtAuT85aakwXaN5Ae5SlOeXtoc6yjrs26A1dEfkq0xUlInrhf4libiXWe6?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa07cd82-0bf1-4513-4e73-08de08d8adf9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 15:13:05.9274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RJbeAOeDbGaoYVV5ONcai+ajTs+1oJ/J13Xf8pFbIPu8ESMLJuNZyDj50tgzXltpBfsfq4njXZflFITN12rgIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFEE549A404
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

On Fri, Oct 10, 2025 at 05:25:29PM +0000, Shuicheng Lin wrote:
> In normal operation, a registered exec queue is disabled and
> deregistered through the GuC, and freed only after the GuC confirms
> completion. However, if the driver is forced to unbind while the exec
> queue is still running, the user may call exec_destroy() after the GuC
> has already been stopped and CT communication disabled.
> 
> In this case, the driver cannot receive a response from the GuC,
> preventing proper cleanup of exec queue resources. Fix this by directly
> releasing the resources when GuC is not running.
> 
> Here is the failure dmesg log:
> "
> [  468.089581] ---[ end trace 0000000000000000 ]---
> [  468.089608] pci 0000:03:00.0: [drm] *ERROR* GT0: GUC ID manager unclean (1/65535)
> [  468.090558] pci 0000:03:00.0: [drm] GT0:     total 65535
> [  468.090562] pci 0000:03:00.0: [drm] GT0:     used 1
> [  468.090564] pci 0000:03:00.0: [drm] GT0:     range 1..1 (1)
> [  468.092716] ------------[ cut here ]------------
> [  468.092719] WARNING: CPU: 14 PID: 4775 at drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:298 ttm_vram_mgr_fini+0xf8/0x130 [xe]
> "

Does public bug for this exist, if so we need a Close + link in the
commit message.

Also I believe this warrents a fixes tag - I can add one when merging
this for you.

I'll wait on answer to my first question before merging but this LGTM.
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> 
> v2: use xe_uc_fw_is_running() instead of xe_guc_ct_enabled().
>     As CT may go down and come back during VF migration.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index e9aa0625ce60..0ef67d3523a7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -44,6 +44,7 @@
>  #include "xe_ring_ops_types.h"
>  #include "xe_sched_job.h"
>  #include "xe_trace.h"
> +#include "xe_uc_fw.h"
>  #include "xe_vm.h"
>  
>  static struct xe_guc *
> @@ -1501,7 +1502,17 @@ static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
>  	xe_gt_assert(guc_to_gt(guc), !(q->flags & EXEC_QUEUE_FLAG_PERMANENT));
>  	trace_xe_exec_queue_cleanup_entity(q);
>  
> -	if (exec_queue_registered(q))
> +	/*
> +	 * Expected state transitions for cleanup:
> +	 * - If the exec queue is registered and GuC firmware is running, we must first
> +	 *   disable scheduling and deregister the queue to ensure proper teardown and
> +	 *   resource release in the GuC, then destroy the exec queue on driver side.
> +	 * - If the GuC is already stopped (e.g., during driver unload or GPU reset),
> +	 *   we cannot expect a response for the deregister request. In this case,
> +	 *   it is safe to directly destroy the exec queue on driver side, as the GuC
> +	 *   will not process further requests and all resources must be cleaned up locally.
> +	 */
> +	if (exec_queue_registered(q) && xe_uc_fw_is_running(&guc->fw))
>  		disable_scheduling_deregister(guc, q);
>  	else
>  		__guc_exec_queue_destroy(guc, q);
> -- 
> 2.49.0
> 
