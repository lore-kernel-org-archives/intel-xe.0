Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4541C77B7F
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 11:23:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 704A410E383;
	Mon, 23 Jun 2025 11:23:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JTmOc3sz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A32A10E371
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 11:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750677810; x=1782213810;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1g+KTEOquZf2kqC4gFS4TLOgsZoeRtnLL/e2lkX1b14=;
 b=JTmOc3szXzf/kM84Brs8xoz/j9QhbuJe4VENyBUwnJDjTWvX23rlnCWj
 1qLIEWGNk6+GruiKLQnZI9j0qikaG3zjEe4Yx4djwxGNq3uwmPO9UwcDC
 gi74yetazfqWBjRJsVe2ZK98Vqw6df/mIMVQdxmAFRCU5KAbIVQcdyOMn
 QnjZGnbZ2ljuY+93DI2hefkgV+KEH7dfNWXC1nslwYU5ccZCm0/NeCWFA
 LCN0I+VXOfm7cZ28jvfls0/Euzn74OSDdzIOzQB8e7FFyiIgk1Mtgo4w0
 ieUFG2LjCn/mlJ7SlROwAiLHBuUTDR3WNbV9z8moHQX3+loxd483DfDGv A==;
X-CSE-ConnectionGUID: Qx9H2xMBQuum/qZNEf8YCA==
X-CSE-MsgGUID: zVRD3ozaQxuQh6q7evjEIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="56552921"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="56552921"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 04:23:28 -0700
X-CSE-ConnectionGUID: Snop7C70R2G3c/Ync0Esvg==
X-CSE-MsgGUID: Ndkr/ivFSZWirlfAz3TMoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="151046891"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 04:23:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 04:23:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 04:23:27 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.62)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 04:23:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ql05dtTCTdmgWoIRn5TWtrBPqIGo2HC/jCh1uq6TImJ6gFCgBECZzw6LFjg8CSs2193d2j2Xb2XsnM7Qtk8dW0onLCoY//F0aHHx4GU6B0wJulFVuZ2EDZPESS85VGXa3hjWfwajpix0bGfBHnTvsmBejLtTt/T9fF66OpprGDGPGCTnPV7SyyZPXAJJgu9F/wp87ZETRShUj/yj1sNgNoTXbEBWuDu1pl1WFjTdYF9cxk3NQGTw4nAfbQ0zPZokqmFbrW2vVJSSQzi1ch5jlFsGunPBBeMc7JlwXf0a1+DkKBL1mn3k2YLplZWPT0ZsGBINnSTRf0BcMgrje3/L1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWrTuwflWpgRVBSWyCPU+GVO6ES9v6Ksd4UazZu0hLI=;
 b=Yn1j/E6ZXRVptnc8liDmwNCBVyjb6enpL3o8MCQbdR98ZHv4mlwFl+oxEs60WVSHl5udkI7/CUTFNIAqg8WNbVbe1Bq1SfKHe8Ij5mV8cEbPqn+aQUhz6Z6r0dc5wmMe4vELlHAkxHl1CMyDTlFzsahSYVfoaFRXmzmih9WhPzpVEprlINw/noQfsZikZHOHi70U/u0Cr5T+8/5Q/Iwysab432vG18byt26OjVTsQRZOTnJTObDXNfoOy89UISE/WDBRlq8pIhsq5Yyq3ineid+wpT0CbLAVby+Z4681jGXfoQtTjxxGACIHx39/eJhDc5yZ9HspHgs5axqdr05sZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS4PPF6EA6DD735.namprd11.prod.outlook.com (2603:10b6:f:fc02::2d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 11:22:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.016; Mon, 23 Jun 2025
 11:22:58 +0000
Date: Mon, 23 Jun 2025 04:24:37 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe/migrate: make MI_TLB_INVALIDATE conditional
Message-ID: <aFk5dTinjFYcZKjt@lstrano-desk.jf.intel.com>
References: <20250620152446.239699-2-matthew.auld@intel.com>
 <aFWIS3/rlAWSlF6K@lstrano-desk.jf.intel.com>
 <530d502e-165d-41fb-9ce8-b6bbbbb8107a@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <530d502e-165d-41fb-9ce8-b6bbbbb8107a@intel.com>
X-ClientProxiedBy: MW4PR04CA0372.namprd04.prod.outlook.com
 (2603:10b6:303:81::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS4PPF6EA6DD735:EE_
X-MS-Office365-Filtering-Correlation-Id: 3562851e-e10f-40e4-ba4d-08ddb2484e66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?gmk1my2iboqBHfU4R4PummMK/Wi/7XAZfq04RmjolKkxcke3d+B/bL2mh4?=
 =?iso-8859-1?Q?l65XuTcjMF6ADzQdrSjQv/ewFFaYm+r+rlzvkpuKBl7/gus7zHtwO9T1eI?=
 =?iso-8859-1?Q?euEEpgWb0WmmR+w38wLb8neHHF6qhVt+r8e7bu7pzGsGEepKEFkKiAbRHO?=
 =?iso-8859-1?Q?ix6flW9YMyUTaXCvkQrh/2W8/pkfYsohKBVx67YJbdXXHLXMFSWrcu9tOx?=
 =?iso-8859-1?Q?oVTZD/YKUARkMD+mxl/lmn7/D9eZdAPQJYc7uTz2g9lk1JbI7Lo2rgYz2b?=
 =?iso-8859-1?Q?tMB/CriFCHeIie3Bs+CBU/07BHfrQNz5qMU3qUIOY87hayI/AdLhwoC25v?=
 =?iso-8859-1?Q?H+5iNuyJThlVaP6srLVuMRNFNKIz/2b0v1t3Qe6E+zob7dvMD2pX9sdxjb?=
 =?iso-8859-1?Q?NIKnbjL197ADjH7JgAzVUjj7blUqyUHa4/PtSdnR/HSodZm8r0H5mmhBg1?=
 =?iso-8859-1?Q?9n9XDi+/T0JBtPZCwz4TMx0lhOxF5HjjWr8fRDAOeuXxqG1X+6GQu8qgyV?=
 =?iso-8859-1?Q?CZ7kCW0GoQ7VJJ3I0bSOreEjiQvIqCnxy4IPpbaMpSpAJPsQsoSSLxHc0m?=
 =?iso-8859-1?Q?I9L9fAE58kJXuufWjTay8FkyDfjVrctfgOLb2A6fpTCSbCKjo78BQBwzrG?=
 =?iso-8859-1?Q?NROzxHqmuly3yl75vGIObNFxjxp/OhrdZAWnlmdVFrXAq2biwtwcUZXU8W?=
 =?iso-8859-1?Q?+TaepIPGMmZUs0CQwKRUjVwZtCDW2uHabLZmuSzcPWdF+osJpp8wJgrvJS?=
 =?iso-8859-1?Q?ACBRPr5GUmuuWm3GhILWo72wZlMs3DeDIu8TeW9SEcBqnhszYRjqIK5cU+?=
 =?iso-8859-1?Q?mGt2Rw4IEpcg4KUiJkRBnMkPA4TEuX9Hmw0kbO4t+/m+/t08rh4o3FOG+E?=
 =?iso-8859-1?Q?j92m80qIyUduxnJruDSTJLzjgOF0Kcl9X12OOeVhU37vgM/qUqaeKxQaKo?=
 =?iso-8859-1?Q?HHsF7HEHZmo+jh7XjAI3vdwyFWrs7WC+bTPOxPRY1j1y6PM9prAwnxJmjg?=
 =?iso-8859-1?Q?AgwYWzpg4HfMEvdk/SHXmDaI5vvl9+llcC/zfGusKMPQezFnoEquaGRHfN?=
 =?iso-8859-1?Q?Q+gjx22NNtJjMRSZCFGpNLTiUPNaxMUULccVHwYSXRiAvVnWUK7IoigECb?=
 =?iso-8859-1?Q?0w9hxun4Oe2OQBQlMEuzrGuL8aF2CEiqq8cjAmR09BH0Bj9SgmrBZVsGbe?=
 =?iso-8859-1?Q?gNN2shbiCemJUC1lPdFg0X0gQ9/xl4uc//r8V9xp4SOhTs2GrTCjS/+TkM?=
 =?iso-8859-1?Q?fu9gkVB8hnvaoPIzTCiFB5YPcANkW21VIsubRdArPp+bOv/OXZx3Q/gdal?=
 =?iso-8859-1?Q?AOD021ZbmGwkrNGmWZEJ3W41J2wWZUlSi3BYhrGkb2P31RClNeSLFyzi5M?=
 =?iso-8859-1?Q?RbkcIxy+lbZA5D5g6kzRCCdKoElbjR4cqJHroG+eSRd+8vlMjURCaAGBJv?=
 =?iso-8859-1?Q?AJm94tKqDoFFk4XeUmaxhzvR7JFsW9k+bzohwNEPJHo83bG2TM8dGK43PQ?=
 =?iso-8859-1?Q?g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?SL5nyIVETmqZ74746Vpyc+Z1BvM6jq4RWimfkspR7Y0FbaHYBl6W830+GR?=
 =?iso-8859-1?Q?ZDXElrij2hq6fDn9uV1RHJn4WvKvfkR6SX7ZsgJqMCwvUatYy2h2UsUEfb?=
 =?iso-8859-1?Q?44ci3H/b5ybdwt+lts3z3T/GNf7sd6e8Ha6t5bDNH/e5noDL7W19alZcoS?=
 =?iso-8859-1?Q?S0sZ/Xl+Pi76EePj4qgoMqt/PmSzoEswOfKfoIDDF4KIFwg6C0sAUA71/r?=
 =?iso-8859-1?Q?z31ImeYxmg0Lb7IbsKNEqhDsunkv5LFuJI1E29LWrJ4gbeT7IN948PW3dp?=
 =?iso-8859-1?Q?bo6w9BwKWb4TmnHl/PqwKTS7o8eOOFCoakvWf8DuTiMniakREW/S6NGrrN?=
 =?iso-8859-1?Q?9z4kL+76vD9Z6SEsZpkzMI4YiFUCYyqcklVyRzViPVGMdfbcswbbLlMNqc?=
 =?iso-8859-1?Q?0UNWCs0gHFPEEs5wSMnCN1g1ConfV/ggabFAweRKLYvSMQzYJ1Ig7cGUqk?=
 =?iso-8859-1?Q?DIY6J8Q+uxcn/W7z22EElYtJyYGBRJbQbh3LpClMonuFvTd8pIucQuTsRc?=
 =?iso-8859-1?Q?li3T9rq5hvAUY8/TqikmEYprg00lUtVskpwQrGcmcFI9Ay6l9rRATbm/s+?=
 =?iso-8859-1?Q?3UYFGKUMY1IN5oiNLC81EVc0cSeyqSobDV4pqBnwZVPC0UicolxfLI7YVH?=
 =?iso-8859-1?Q?HEwArVeHuxZNbUTnLluU71HSLeq0RVdweX8PPy0nWfwbIUASVcxAQgnBzx?=
 =?iso-8859-1?Q?bhuztiD3cdVCn43W6D9rPNGJNv0vHaT62rFkDoodmi45XpN383WOaLss0O?=
 =?iso-8859-1?Q?7X/XY9S8sbTQfj5pWP1A6x/TJQiHceli1vs2lGpsXjMd7yh/9GF2sO5rPN?=
 =?iso-8859-1?Q?jU9JZs2MX4Ru/W1Peu8AbYAadZLbFV+GE+h0QABRXjBd8Phcb39WMGnYjR?=
 =?iso-8859-1?Q?VG7l6TJ8+DXUomlW5+vGMPmreFkzAFfwiQFStpsEeQE+sX3VPlXQhRCfh0?=
 =?iso-8859-1?Q?et1OPGQDoGQNRvcoS106lGrDGwVWIKJ0VzMjCMjrEO1EMVdMaqALqacGAu?=
 =?iso-8859-1?Q?9vdkQcf6jA4UdI0qsqfyCRpt6vtUtVinO8cNxEQgutbOiAJfGrKIQydojW?=
 =?iso-8859-1?Q?QIqe4yNtM3cl8yvqQ9YoAwrMIi326OzpgjoNXcpqqWeVO0pwSziBBBumuv?=
 =?iso-8859-1?Q?oVb+apSKwoidGe/2U8ML1RAIZNA/cHXMx02phERa1dt464v4IRtRX3N6Je?=
 =?iso-8859-1?Q?ykNGhzO40PNbdPz3SY2SuNLBsZWkM8B/Hv6lRZu17l6gwNA3TbhUvBZ/Tg?=
 =?iso-8859-1?Q?btIgk1EImHhGXhkhHJL+QuK8sBOVfWb770NPLimo3vFGR9ICV29bUvgcI9?=
 =?iso-8859-1?Q?+aB/swgzryzABkYdl6T+OX0AIzzNpSAqDVTvl9/GJ8XWEM2Y/RupojG9nL?=
 =?iso-8859-1?Q?4nqmwlkxz6arFNSte2qS52Tz8Kb6XehAE7i/C5rmjcSap+kFGRV99/It8M?=
 =?iso-8859-1?Q?Z3JrZbIZJMyJf7F8V4pVWlePTR17/S8yEnU+ZGqA1a7qei88dro/xLYOdt?=
 =?iso-8859-1?Q?HXCAFEDxRX4hy5sG7+ikpZRWICYqdEjD6Bg++AHftQKYgqw/Slu+fUFeF9?=
 =?iso-8859-1?Q?YdMql1iMr5TnZ3DjQaQ05UKwJK3Kay5cHZDQChymQl5LHU/nMtUhDWj47w?=
 =?iso-8859-1?Q?WWc/An71WBBcoifaHx/g7cfSPpg1AaqLabonTQzUc9bKrCftKVstC7uA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3562851e-e10f-40e4-ba4d-08ddb2484e66
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 11:22:58.0745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LW3yQaeRyeyf/GpyBxsTCMSC4guWm/68K7qu++Ty4Y8PxKs6u9aIl5J0BMX/5m7iy81jKNgdp9hxl9pkzPN9Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF6EA6DD735
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

On Mon, Jun 23, 2025 at 10:33:13AM +0100, Matthew Auld wrote:
> On 20/06/2025 17:11, Matthew Brost wrote:
> > On Fri, Jun 20, 2025 at 04:24:47PM +0100, Matthew Auld wrote:
> > > When clearing VRAM we should be able to skip invalidating the TLBs if we
> > 
> > For copies, we always program SRAM PTEs, and need a invalidate?
> > Maybe mention this in the commit message.
> 
> Yup exactly that. I don't think we currently do vram -> vram in practice so
> I didn't bother with the copy path. Will tweak the commit message.
> 
> > 
> > > are only using the identity map to access VRAM (which is the common
> > > case), since no modifications are made to PTEs on the fly. Also since we
> > > use huge 1G entries within the identity map, there should be a pretty
> > > decent chance that the next packet(s) (if also clears) can avoid a tree
> > > walk if we don't shoot down the TLBs, like if we have to process a long
> > > stream of clears.
> > > 
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_migrate.c  | 18 +++++++++++-------
> > >   drivers/gpu/drm/xe/xe_ring_ops.c | 10 +++++-----
> > >   2 files changed, 16 insertions(+), 12 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > > index 8f8e9fdfb2a8..a76363740a12 100644
> > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > @@ -896,7 +896,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
> > >   			goto err;
> > >   		}
> > > -		xe_sched_job_add_migrate_flush(job, flush_flags);
> > > +		xe_sched_job_add_migrate_flush(job, flush_flags | MI_INVALIDATE_TLB);
> > >   		if (!fence) {
> > >   			err = xe_sched_job_add_deps(job, src_bo->ttm.base.resv,
> > >   						    DMA_RESV_USAGE_BOOKKEEP);
> > > @@ -1119,11 +1119,13 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> > >   		size -= clear_L0;
> > >   		/* Preemption is enabled again by the ring ops. */
> > > -		if (clear_vram && xe_migrate_allow_identity(clear_L0, &src_it))
> > > +		if (clear_vram && xe_migrate_allow_identity(clear_L0, &src_it)) {
> > >   			xe_res_next(&src_it, clear_L0);
> > > -		else
> > > -			emit_pte(m, bb, clear_L0_pt, clear_vram, clear_only_system_ccs,
> > > -				 &src_it, clear_L0, dst);
> > > +		} else {
> > > +			emit_pte(m, bb, clear_L0_pt, clear_vram,
> > > +				 clear_only_system_ccs, &src_it, clear_L0, dst);
> > > +			flush_flags |= MI_INVALIDATE_TLB;
> > > +		}
> > 
> > What about the if statements for dst_it / copy_system_ccs? Do we not
> > need to set MI_INVALIDATE_TLB there?
> 
> You mean for the copy path? We unconditionally apply MI_INVALIDATE_TLB when
> doing any copy.
> 

I was looking at wrong function (xe_migrate_copy) - I thought there were 
a couple more calls to emit_pte here but on 2nd look, nope.

So patch the LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> > 
> > Matt
> > 
> > >   		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> > >   		update_idx = bb->len;
> > > @@ -1134,7 +1136,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> > >   		if (xe_migrate_needs_ccs_emit(xe)) {
> > >   			emit_copy_ccs(gt, bb, clear_L0_ofs, true,
> > >   				      m->cleared_mem_ofs, false, clear_L0);
> > > -			flush_flags = MI_FLUSH_DW_CCS;
> > > +			flush_flags |= MI_FLUSH_DW_CCS;
> > >   		}
> > >   		job = xe_bb_create_migration_job(m->q, bb,
> > > @@ -1469,6 +1471,8 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
> > >   		goto err_sa;
> > >   	}
> > > +	xe_sched_job_add_migrate_flush(job, MI_INVALIDATE_TLB);
> > > +
> > >   	if (ops->pre_commit) {
> > >   		pt_update->job = job;
> > >   		err = ops->pre_commit(pt_update);
> > > @@ -1667,7 +1671,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
> > >   		goto err;
> > >   	}
> > > -	xe_sched_job_add_migrate_flush(job, 0);
> > > +	xe_sched_job_add_migrate_flush(job, MI_INVALIDATE_TLB);
> > >   	mutex_lock(&m->job_mutex);
> > >   	xe_sched_job_arm(job);
> > > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > index bc1689db4cd7..b5548e0769f4 100644
> > > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > @@ -110,10 +110,10 @@ static int emit_bb_start(u64 batch_addr, u32 ppgtt_flag, u32 *dw, int i)
> > >   	return i;
> > >   }
> > > -static int emit_flush_invalidate(u32 *dw, int i)
> > > +static int emit_flush_invalidate(u32 *dw, int i, u32 flush_flags)
> > >   {
> > > -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > > -		  MI_FLUSH_IMM_DW | MI_FLUSH_DW_STORE_INDEX;
> > > +	dw[i++] = MI_FLUSH_DW |  MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW |
> > > +		MI_FLUSH_DW_STORE_INDEX | (flush_flags & MI_INVALIDATE_TLB) ?: 0;
> > >   	dw[i++] = LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR;
> > >   	dw[i++] = 0;
> > >   	dw[i++] = 0;
> > > @@ -411,13 +411,13 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
> > >   	if (!IS_SRIOV_VF(gt_to_xe(job->q->gt))) {
> > >   		/* XXX: Do we need this? Leaving for now. */
> > >   		dw[i++] = preparser_disable(true);
> > > -		i = emit_flush_invalidate(dw, i);
> > > +		i = emit_flush_invalidate(dw, i, job->migrate_flush_flags);
> > >   		dw[i++] = preparser_disable(false);
> > >   	}
> > >   	i = emit_bb_start(job->ptrs[1].batch_addr, BIT(8), dw, i);
> > > -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | job->migrate_flush_flags |
> > > +	dw[i++] = MI_FLUSH_DW | job->migrate_flush_flags |
> > >   		MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW;
> > >   	dw[i++] = xe_lrc_seqno_ggtt_addr(lrc) | MI_FLUSH_DW_USE_GTT;
> > >   	dw[i++] = 0;
> > > -- 
> > > 2.49.0
> > > 
> 
