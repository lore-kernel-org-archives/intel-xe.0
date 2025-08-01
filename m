Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03ACFC87FCA
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 15:29:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0FC210E8C3;
	Fri,  1 Aug 2025 15:29:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mOxJNvHI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ABA510E8C3
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 15:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754062176; x=1785598176;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=P8PL4Cu7yzMnyya4we6okF+ZgVdRfXQXx+hDOsdT6kc=;
 b=mOxJNvHISv9aVd4f3oOVqefhPO4NHRl5nIRR9+J2ctjCtdswlloFwBCp
 ONykjxezT8ToIcMu2EBCwr0Mh68GOCUb40a3tazyAHUtdohZOh1HQHG1X
 JzTFehDukPb93jsutOz1ULbYPvWrnBlXoQ7p4qKVJs7+MDNxUicj0TPCP
 f6zv6XGQ2Ja3JyXlXu/pqM3V4w5EhwpdoGUn5P8MD3aLUWcVQAkoADmeU
 yyZVbysxCYplH/tThs19A4UfnqdAXkHCMNS2hVQ4tnZktfH+9tVjVPRnE
 HvwR6Pm/S/ESNUCDehyrQM25pcfyDZMlAMJmyk5lJH1t9JnzJVxIysxZU Q==;
X-CSE-ConnectionGUID: qTyfi79xQDyCn3qy7HxGYg==
X-CSE-MsgGUID: 4GvPsrV7T566H/KSJyFV9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56370786"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="56370786"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 08:29:36 -0700
X-CSE-ConnectionGUID: 4xfPjVsBT+CtGtJ/Aq3rgQ==
X-CSE-MsgGUID: xmFsHFBvSxC2tdXFFKLBkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="163518788"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 08:29:35 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 08:29:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 1 Aug 2025 08:29:35 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 08:29:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H42LkNM/7hZWesp3sfhrO21XfxJyoLnhZlq9wakT7M7W8GFKtp5zhSDXjGHWztpDRR7JW911bXG8n/gu1EXSlMiqQQj229fanLSCpozlaByaxcym1cYl/KwtstOSNtRZejwaG8s4F43qWDpU6ca7MtVib2pLDc8jM1vDM8FNZ8I07Lf1CFNdB3hC9dUaM97BVRsrC8xxHsxNpxnjCOrF7qXnfIGPNt8cmzp4iR+gU0BJrVx7UrN2EAqehR5YOb6ki+nGTMmcRG6WZA15+xxEVRel3L8VnR2xghMoHfyB0PGfLMrFl4HCpH6X6mj7hm77d/Cr4rsBS52yBLgc9I4NXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwPPZDpPA/ZKjjBcME5zszyijUSW62YETZswiP0pZSA=;
 b=brbrKIBnE3PSmpoXkZmibxRSiKLrB3QdMcSu8aebCsPq+2sRqLXnkqkcRz1TzAooSRZP3gCxY+wcXSG7L00sEG5hNhgSnsoYHfYXHWYRNdmdg+Xff9OGs4FtDSUcJ+EOxI6aP5toQXuKsS4oU+E2BsJ/oJQCUCc+FbOkqFqxZYlCTnomhLV/eXyS3HV4F5AVCo6ClV86jcmkKXxamMLd5UGtjf0FC4iqOOYae1J8Q+xCDkzk5x/LPBivVtH0lFkrTX9pENmH0+hzbY/Fyy+oVSbN+CD/Xwdp69nC0JghWDREbutMsqzWfvFkeAIHqu7GBtrBqdeH/coGfvUSlMPY/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by BL1PR11MB5977.namprd11.prod.outlook.com (2603:10b6:208:384::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Fri, 1 Aug
 2025 15:29:16 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.011; Fri, 1 Aug 2025
 15:29:16 +0000
Date: Fri, 1 Aug 2025 11:29:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Stuart Summers <stuart.summers@intel.com>
Subject: Re: [PATCH v4] drm/xe/devcoredump: Defer devcoredump initialization
 during probe
Message-ID: <aIzdSdvk7QwcnPSO@intel.com>
References: <20250801052356.21885-1-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250801052356.21885-1-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: BYAPR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:74::17) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|BL1PR11MB5977:EE_
X-MS-Office365-Filtering-Correlation-Id: f89ce2ec-7410-46db-112e-08ddd1102cd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hW6W/2NWQbUbPfP7MW8SRiXO/RWLp1HVPZzbE/uI8jZG5jOswKk6gNZ7wJdj?=
 =?us-ascii?Q?TYlTVuxKtvg4IL2kQ6AYcPNbpkZ/hYtQWl/a3AU7U/P1Lt2RFFiPTfxsLzoj?=
 =?us-ascii?Q?jmZZrNr84ZbSKajd0V3QBALXb7iH/LRqxkQJik4sV+tO4B3pIMtLb6o3i7wW?=
 =?us-ascii?Q?C0GD2ptCo9r09QAugvxFtu8KopQkzwBtBIVi6GwDZLqMwcx034AtUeVNHrvg?=
 =?us-ascii?Q?5g28xQ+IbGBoUn4pz1oexmhOENjM1jHbqy6O353bQLxzAiSy318+k088f6Vm?=
 =?us-ascii?Q?nFSUxYZQ206yYu3nR6rz9//cu2RxuDgEDD1ll3ek1fUVpgxdWiZddt/aVz/f?=
 =?us-ascii?Q?t5Y+3+INGaVJNbnYYtGI40EpaOWDNG5IuINgziQETKWOMHecceKWF3K9eDd0?=
 =?us-ascii?Q?lIVBXV5m7vQUyp5J0B2b59qAxOwibJZOTYA4+9iR1UTk7Ltza0xLf/JPbpdI?=
 =?us-ascii?Q?0xCHoOCMzqRL51VD+cdSCfpvumMFN+WHnnLvYbtNOEfjEhSS0/OkW4tukfdP?=
 =?us-ascii?Q?9k1CMbdKUYG6JXMCuKutXIUZ3oxH1jyDDAJpMPLX3nAyiWSypWRO1IJdbdpe?=
 =?us-ascii?Q?qSQZFIBHQdCyaZNO1nrHTC3FifNjUCF+UwVo1R8ES5iBb+EpMBlczem+YVAf?=
 =?us-ascii?Q?kSy3KaI+usD7OxRWGI/49wMnD/bknBGfm7uAFKhWpQaKYm/KNPjeODMLcWaK?=
 =?us-ascii?Q?gzcYLEVTrxOW/v5Q/1csbDwn6RfagwDwj2MNndPNggcyreIE2+F0/cvUWRL2?=
 =?us-ascii?Q?TGCoUJZSyVoO3fjgGeW4ctN6mrg67anwWnQuJq9IKgMR6wl5QNs/ZYyrPAyr?=
 =?us-ascii?Q?ateQ8siSlcjLOhXsb2lDV9v9PS/l9+rUIzjSZkn3vvUD5yBqe3+/163y1uTt?=
 =?us-ascii?Q?xZz5lF1VdlMNC7h9YNddVcyk1hmc6AQ/zKOzaPiKGwSky5RWMN13BAI7w9Xm?=
 =?us-ascii?Q?uKG8k1qjvTXk8s2q/EFujLZbGb36uPr+IXNN9/QLoCwgkakOort86NcxVzh6?=
 =?us-ascii?Q?rCl4UdLh4WH7xhZvz8VzL0qQY1XXHHiYHJhGltal4s7JeWTUf6d9x0+YnEe4?=
 =?us-ascii?Q?Dyk/IRMbC3k3Y8YeM3egTzfx7j0HGdOxd2+YyhP+U+NJXrXI/ynfT5hh7t7r?=
 =?us-ascii?Q?0NISxKjfWkHnehbRSrzA1FGbBIyxbodsdJd7hhVEV4nehmiIwHFri7RBy/gm?=
 =?us-ascii?Q?HAwrTkbcGDrWEHMyssEdxrrDvx3RvtOv60YC3hRPZwrdKX90YLIJs8as4IVj?=
 =?us-ascii?Q?GjwqJ+P6FXuIheSJEgjVQSwr46NY431HE+yBaMQHojZBEL06qyHMxFmurAze?=
 =?us-ascii?Q?Njr0JVolW6pxrB6lguvwwzz185W4kmp/kegJPgCO6DUp+iaSYXdqOgN6tMWy?=
 =?us-ascii?Q?NvlxSLK8eHsEBmCZI85hMhDrT+lOae96UN1Qp5E0p2Y+EGIU3yGDv460LXNw?=
 =?us-ascii?Q?Eh1IY8uCikA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5u0f3LcPRVvgjjDb9At/PcytUJsx4Mz/y2nY5/GIfZuqKY7QySt4yb0grsPr?=
 =?us-ascii?Q?DzUx5kvN1QrNoYhKM5Ts3rwzDf1YsVQqy6K8qxkXg1qzxmVJ3XnOD28iU/pv?=
 =?us-ascii?Q?xv0A60v/2CzJ7WR6mUMrBO+nUhRES3ou7Xbq+kxl58N7teI8b4TcivBNIXW1?=
 =?us-ascii?Q?1SFPSy+1i2SUs5t2skzWV6++lchTiM5uTYuWOE4vFIgX7EelmgodScXPR97d?=
 =?us-ascii?Q?EcJB4Pa/AK1XpJ3BNZOfDcoJ8aMKbdDhj9sJSTPtIR0tVsr19t+hNlf3t+Xd?=
 =?us-ascii?Q?+r4GWl9bFsNiYCTf1JmldUlO+10YPULvy0RWx1WpruWP8AjbkRyr4/JxRnDE?=
 =?us-ascii?Q?clqq4DeDf0/y1x3KvmNY5iNfSPoFSPE+OvTEuJADm2+zpyyeR+t83U38deup?=
 =?us-ascii?Q?6/9hOoLFNjQbtsiC9r+N4tP61ZTUjLbzIpLa3U7WEehDjuCrr6x7GN1uSRVi?=
 =?us-ascii?Q?dZHnjv39MReRfm6CgyvQ275Zo5rY2PWMT2hHgA0F0sqHmc2GmjnkJ9AfoJAr?=
 =?us-ascii?Q?SD3vBxCfK3bdisnsUpyOgvfz2V+UFao7A9SmfQrPoTILG5KCqpu8LVSdzUxt?=
 =?us-ascii?Q?uqkzbaV2qBSSlLHR3AOw94M5si0+JAp0LKWfM9r7tOHpZpicWizt8RalzUoH?=
 =?us-ascii?Q?kGaEJ64HRc+3/BtgmPOlS8fWf7p+TL+Y1runvBj2dLor3kpaH/1u6y4MFV9l?=
 =?us-ascii?Q?1h/N5o8BXJDVzmi5rbpbfEMdH2e7+kuaO7NYlAFP0yzqlbJLitWCa7d8TJdy?=
 =?us-ascii?Q?+SHL/rfGK15tcI6ENkh/GW2xyY0o6FTozZxJD+MC+KFcaof9xN5SuHUf/VC7?=
 =?us-ascii?Q?en51kti6nEyfzGRe1NE0Fm/HE3XsYVlsm7pys09zdxeMj3zZ7VECXYGRqZKU?=
 =?us-ascii?Q?8iyBDYKzdHIapsHnnW/tCT+8Quo/Z+x4YAXf22xu4ooZRCVTn7XFaVezYjuJ?=
 =?us-ascii?Q?QmqOV+kVyNevlbXmyeB1MFkWDYJ35qyi/WVdYcOfdK5Gm2j91coxXy2YVUbo?=
 =?us-ascii?Q?vsh/oRn55LJUPXqoVGyaR5djhWGBByX9O8Qs2ykX4JfTeBIm5cJDbCBP87AD?=
 =?us-ascii?Q?nlck5AWmm/yAnJQSEt3t4HN3tnaUVu9Gf916w4uqodz+aoEO/m97k2DET6RK?=
 =?us-ascii?Q?ioBiikcpKlrvNRwq1OGEWselr/xkubN4JagezcMTAtq+sLOX0tOVI3ou05X+?=
 =?us-ascii?Q?2xCm5djWsCSwaGXkTAOZtoeFgYP3trD6gfdw3OLpIsxAbbddFPWBTiOZbsMg?=
 =?us-ascii?Q?zEM2q209mjGUmlkyHlSy3MRFSAOWq0RgCapzpUZVncbWSvXv6uvpxAbBxz1j?=
 =?us-ascii?Q?OYwIg6/2ZeCkOYx1Z2py6nhZJ7CMixhg/Ec6X7AAqcbyrcVW7A1Vzb4zrX2+?=
 =?us-ascii?Q?Y4gw/n2ZM5ERqqSbSzzDFt3rVY6iTlolYfdkPOhz9cE0q6p9JyF/6ponmdKh?=
 =?us-ascii?Q?VSPXbIpYunMU6VzGgLMNxa0NWetJgqM/yA5dG73XGZIXVlA36e4Ou/x7823J?=
 =?us-ascii?Q?dvhG1wlCKBrwabNHao71O++GPfetJnbsIs/OeJRz/UIOH/htmcqLzN/baT4e?=
 =?us-ascii?Q?VqbT1v2YjN5sDiDyS7lK4gIyZxniMJtGT8eYX8FhvBOz5uemQltHOw9/59L7?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f89ce2ec-7410-46db-112e-08ddd1102cd2
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 15:29:16.0075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zXIYy51PMZUKt97BY9NypHT/eNZtjl3Ut8XUKPfCYkB+R6yoRJVTEvPW7pcqRKqVl223ZmLNZDAzG7rLRc8aIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5977
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

On Fri, Aug 01, 2025 at 10:53:56AM +0530, Balasubramani Vivekanandan wrote:
> Doing devcoredump initializing before GT though look harmless, it leads
> to problem during driver unbind. Because of this order, GT/Engine
> release functions will be called before xe devcoredump release function
> (xe_driver_devcoredump_fini) leading to the following kernel crash[1]
> because the devcoredump functions might still use GT/Engine
> datastructures after those are freed.
> 
> The following crash is observed while running the IGT
> xe_wedged@wedged-at-any-timeout. The test forces a wedged state by
> submitting a workload which hangs. Then does a unbind/rebind of the
> driver to recover from the wedged state.
> The hanged workload leads to a devcoredump. The following crash is
> noticed when the devcoredump capture races with the driver unbind.
> During driver unbind, the release function hw_engine_fini() will be
> called which assigns NULL to hwe->gt. But the same data structure is
> accessed during the coredump capture in the function
> xe_engine_snapshot_print by reading snapshot->hwe->gt.
> 
> With this patch, we make sure the devcoredump is stopped before
> deinitializing the core driver functions.
> 
> [1]:
> BUG: kernel NULL pointer dereference, address: 0000000000000000
> Workqueue: events_unbound xe_devcoredump_deferred_snap_work [xe]
> RIP: 0010:xe_engine_snapshot_print+0x47/0x420 [xe]
> Call Trace:
>  <TASK>
>  ? drm_printf+0x64/0x90
>  __xe_devcoredump_read+0x23f/0x2d0 [xe]
>  ? __pfx___drm_printfn_coredump+0x10/0x10
>  ? __pfx___drm_puts_coredump+0x10/0x10
>  xe_devcoredump_deferred_snap_work+0x17a/0x190 [xe]
>  process_one_work+0x22e/0x6f0
>  worker_thread+0x1e8/0x3d0
>  ? __pfx_worker_thread+0x10/0x10
>  kthread+0x11f/0x250
>  ? __pfx_kthread+0x10/0x10
>  ret_from_fork+0x47/0x70
>  ? __pfx_kthread+0x10/0x10
>  ret_from_fork_asm+0x1a/0x30
> 
> v2: Detailed commit description (Rodrigo)
> v3: FIXME added (Rodrigo, Stuart)

pushed to drm-xe-next

> 
> Fixes: 4209d635a823 ("drm/xe: Remove devcoredump during driver release")
> Reviewed-by: Stuart Summers <stuart.summers@intel.com>
> Link: https://lore.kernel.org/r/20250731061300.14320-1-balasubramani.vivekanandan@intel.com
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c      | 8 ++++----
>  drivers/gpu/drm/xe/xe_guc_capture.c | 6 ++++++
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index d04a0ae018e6..ae48cd3c7bf0 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -821,10 +821,6 @@ int xe_device_probe(struct xe_device *xe)
>  			return err;
>  	}
>  
> -	err = xe_devcoredump_init(xe);
> -	if (err)
> -		return err;
> -
>  	/*
>  	 * From here on, if a step fails, make sure a Driver-FLR is triggereed
>  	 */
> @@ -889,6 +885,10 @@ int xe_device_probe(struct xe_device *xe)
>  	    XE_WA(xe->tiles->media_gt, 15015404425_disable))
>  		XE_DEVICE_WA_DISABLE(xe, 15015404425);
>  
> +	err = xe_devcoredump_init(xe);
> +	if (err)
> +		return err;
> +
>  	xe_nvm_init(xe);
>  
>  	err = xe_heci_gsc_init(xe);
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 859a3ba91be5..243dad3e2418 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -1817,6 +1817,12 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
>  		   str_yes_no(snapshot->kernel_reserved));
>  
>  	for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_STATE_CAPTURE_TYPE_MAX; type++) {
> +		/*
> +		 * FIXME: During devcoredump print we should avoid accessing the
> +		 * driver pointers for gt or engine. Printing should be done only
> +		 * using the snapshot captured. Here we are accessing the gt
> +		 * pointer. It should be fixed.
> +		 */
>  		list = xe_guc_capture_get_reg_desc_list(gt, GUC_CAPTURE_LIST_INDEX_PF, type,
>  							capture_class, false);
>  		snapshot_print_by_list_order(snapshot, p, type, list);
> -- 
> 2.34.1
> 
