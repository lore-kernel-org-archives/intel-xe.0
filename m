Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34ABDCCD1BF
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 02:49:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AEB10E05A;
	Fri, 24 Oct 2025 02:49:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GtYwXIis";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E33410E05A
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 02:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761274187; x=1792810187;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=f2jHlfiM29+ngWpWFDnw9N66Or1tP9yeUPKR0Vc2Pfs=;
 b=GtYwXIismRDDBa05A9N82we2spZuJleqKklLxjGARv3T17hLBX4Rgw/z
 Yn6mb/awHETtHCzos5VXB98fqs9cHV/BQ4z43QxWf2TEtDkWREIuTgSwi
 r+U0oNzp3dxXzbZiL3uq1UL4bK/xORZv/bjztsaAd71zRVpO2VwK3qEaO
 +qJkniVSldYFotzNbAwdeFZoSpqTsA9USumBt/rvnJiMB1kQert5ZJCw1
 J9UlDFb4e86u+fBedsbR23FTmNMHJomRlRHt8oMStw585S/trjXbEN9OE
 Uq2gf4FF9mND7js1tf/EmzlbeC/zaJsBJdM67MEWvMo81tb9IpxqgE32C Q==;
X-CSE-ConnectionGUID: 5LRT3VsRRs+XipiMCg1bIw==
X-CSE-MsgGUID: /FPYNv5USWmncTz34NwUkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74124885"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="74124885"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 19:49:47 -0700
X-CSE-ConnectionGUID: P6wvaL1JTn+HIlRupHZf3Q==
X-CSE-MsgGUID: 9qOuCw7yTxOcidF2pHQy/g==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 19:49:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 19:49:46 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 19:49:46 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.57) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 19:49:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TrBxpFOJWmB66RaVasafzmXXeqZBq5PkgRli7nfwM+I4VhTorl3T8uooPObEar3e0qdDUKx3CG/BxVETGhfSOcpYIua8du/h+OyZoBwYGiV0FsrIAYsmA1tfzllxbrdg1lr9tn52Cj0/Mb36KGKM8bfHClFzuuFBdwAYE9VUsnBTuP38HnZk/OplvwtKLCQlA9nlEs5If9gLOziXvmhibihZrpD0dW6+dbE20fb+zQxcad19IOhVTBkkLhCKT21A0YYItHvpwsBGGS+ZSEk19pv8IcjKfKSL1U7K9Id/mBFgog5wOnHI8wf310HNSX2PFqv9ckH45PZ8F34I8dRRqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSejtVOvp4mspclGUdkXiQxBObxYYV5ay4sz3FqsvQI=;
 b=CoPx5nn4Hxe2YH7Q2zqh3HH+ygeaqxMi3yi7BWZaF8M8wlaLvOhh/zkC/dVQAZms5zbYfA8C9N+BHbmvvNbf8Lebb9WNsvfr6ceeILmU1sWAL933AnIvvLYHt7zxVPp2NjIaUZiLsYNo1ZvYy+g/yKRDhR5cFZkAApA8rSwjS2Zp3AX6183yobS8U9pmOzK+BriwY8tL7P0mzmOYpaanaev9dKvKK6TWKa44QUOmTjLb8kM3aV0r1LsExa4mnrOMz2a5LwCyXwaqnXaJ0wwhIMWKrSngp0dawTvoyPC1vcWBV5S+qPld76+ovRdg6IobIOIuDhdt8Qhl2Hp9j9K22A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4928.namprd11.prod.outlook.com (2603:10b6:a03:2d2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 02:49:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 02:49:38 +0000
Date: Thu, 23 Oct 2025 19:49:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Michal Winiarski <michal.winiarski@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: Re: [PATCH v2] drm/xe/vf: Fix up GGTT on S4 resume under SR-IOV
Message-ID: <aPrpPxQxUq/M/14S@lstrano-desk.jf.intel.com>
References: <20251023064610.4499-2-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251023064610.4499-2-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4PR04CA0193.namprd04.prod.outlook.com
 (2603:10b6:303:86::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4928:EE_
X-MS-Office365-Filtering-Correlation-Id: ada0a9e2-05d6-4f49-1cf2-08de12a7f920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P2l2zK8TPUa0zXF5X3hDIY8W+KoahESA1MgfnIF+/QO7agHlVpeEAUtfa89k?=
 =?us-ascii?Q?44VVW80qKk7m5o3uMvbNXHlDUoICTDgkbLCrBnVfZkA79RGyvZ/G+zJZ2RqE?=
 =?us-ascii?Q?iCh5nvgK386e22dbMHp9TLrG2p/7YPk5g90U0iPCu5YAILlWMfAhILrAPHmk?=
 =?us-ascii?Q?+3YpKIUCnDYu4VV9YSNma6eOwSweLIQ3MvX/9XoVsk/wDp5ZUFOH38LlWcqp?=
 =?us-ascii?Q?jALbzEq7NGyYJlWVQ8y4f+q7uwuMEiFmQ32kNPrUBO4miokUzd9mF2/JEv4H?=
 =?us-ascii?Q?kQf1ar231oqxusCav/UCV1X992P7XIfFzK7jIRTJ7l+BL9ha9b/YK5Ua7UAv?=
 =?us-ascii?Q?gvWT7U1vgPucKonIWMIXohlEutDu7wQpzpnrXv4hxbuiBA7tFbfAaze79GbX?=
 =?us-ascii?Q?It+5IRLRiDplDw24NWItwKvqE6Jsp6888sy0bbz87QpEcwgkLyYVrL4yEk/N?=
 =?us-ascii?Q?jK/VThlRGVuET3T5BtwP5uo6XpZRRjk4wm2orIhNjYm3SWx31/OBpGOW/50I?=
 =?us-ascii?Q?LqJAHPDQ1c7pXPW68nRrIcJ0xsam7C1oQBaTY/mtptC5F3LpRovUBSDnQoIa?=
 =?us-ascii?Q?g0HcieaAyDrXmvNEcIvD5BzMfNp/O6xQxMCFHgXN2Jhz7iE3kayNkmqmO02B?=
 =?us-ascii?Q?S18+uuE/Juic6UKDY7oqnawg2aMcl3dhEfgc1h/mqQr6dAHkPCq6OMuwwsbv?=
 =?us-ascii?Q?q1xy71NNAeDR5Ar9K2nJ5c0BAxN3FiJfPU18SB4ZsiMqsu1TZVdvAQ0Eng2B?=
 =?us-ascii?Q?Qz0eObEqI/bYE7b3OfnVWwtkhoQLTFBcrIdeiDKy4nPxTyNazd10ZcgRvu/O?=
 =?us-ascii?Q?3fVh4UpMeU5mjDiMdkl5xE5+c1D4wZwfgiesqPeVbBrkOHtJZu7vJYn1DB9U?=
 =?us-ascii?Q?JfAGZXGP64l7KiAxYmJ0DBzIoEhXlQ/FQpOO+kB3DzlxZzj1Xuke9InwY/pG?=
 =?us-ascii?Q?R5Ph2/ptachvlvUQZ1oWMaZNs+Rjb/7KQzNPJgchYqAw1LobdDPNcMvsFDsh?=
 =?us-ascii?Q?J0z7ltjkcVxrKI5lwYgdsbg9jcnyp/XQQCwKyxx4qP8gqa82RFRPh6ufy9qQ?=
 =?us-ascii?Q?z7emQYdZ43I9N4fDPC5/atoIdUVqRVXwaa6mMhHrF4elA0/eTbCTK6Gkel8L?=
 =?us-ascii?Q?pufQjbMT6sbSkKdX1C8OmQsjM33Xg2ENTQmyTG5eQZZbdN7znBXzYABM46Fl?=
 =?us-ascii?Q?MOMnj24CgqFwMrB3xBFhIPxBFR03U2CBUz5jMSug1SN5L66NyQAEHr5y+hGL?=
 =?us-ascii?Q?Eb5XuAm7BGxU8vPhj4brIfQIrgvjlqi7lPfWvKW421Vnq4sXwemffki5DOkm?=
 =?us-ascii?Q?2qXcgQfCFP9QCugEnrb/TI4+KSv1c636MtHqEiqozlgvzSxWvzlwQOMrWt8L?=
 =?us-ascii?Q?EzzaiDVWLrzTaocPKcAIth0Z6wv+krdABSclyckgoaf3IaRlIMP8aO5OcHLf?=
 =?us-ascii?Q?39YvwAOPjl8Atq2/6pV57nm2b9xIp+IR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uBknK0sbQuZY4zNDT+Kma+ZMboeSTmelXe+4JuPkm/JDcGMgtVzlPsD1Nmlw?=
 =?us-ascii?Q?YH0qnokCWfFuBcj7z2kgnVRKVQAHIhtYuA+wgXza34mx0I+05OMJq+UGWt7G?=
 =?us-ascii?Q?wWeUKfLs6WV98VQywJVLtUB4TzC8EtdTEkn5uTkn8oiSIw1dFRVt4a3+ms1m?=
 =?us-ascii?Q?95VKODRbIHcyyb4vNwMpNmRM4pzStV/a8BaQKZJEBvlSe+jhmXeBZVCBnekr?=
 =?us-ascii?Q?vOg2+lpSsCXltEH/wuNUfWFHcVjApOP2twE91y2wUerQEAuKT6BFRTiYNh2Q?=
 =?us-ascii?Q?3iF5pmj1RhXTwRwMfRjBjXLJrJMVsdOhcO+S9m9rJ6Y1/pgDEXkNcJjQtJ69?=
 =?us-ascii?Q?vgJlFD5WkYGx6kzL7vOyIvDQHUHQLgM53HfrsAFfKJ5UrF14Ui/LRZmBKIlP?=
 =?us-ascii?Q?9p4Pv1D5fc4h7VlUjkNEE+FFMFXJ4nlulOVKBDY1IrB/zQOkVlT7GCANCvnG?=
 =?us-ascii?Q?bQ/O0RhqFq/52NDjIKUIHPE1QHLG/nk0ghTa9UbJoP559sIFwSiutMaevIP3?=
 =?us-ascii?Q?hfBx5kkaaXEf25INgUaRh9ABJLRJbpuTybKYkM9+vH6scjMl7euqJEGZYFRK?=
 =?us-ascii?Q?ISkgd5dRCOJi2vu8j+JXeXfP2Dab68E1dNkdG7PALd9QBC6FkSiXWJjTf7a0?=
 =?us-ascii?Q?gYdtvcj+9RvxD/2YsXvSNFu6WYIhhIJbIkOacmui95eqJHv4tzF/ZR7SNS5w?=
 =?us-ascii?Q?0sDUqGCx2Wkvic0Vi6xAnebH7QEzs3bB4DqDO1DZZvFYZlAF6hE3bgh47rAo?=
 =?us-ascii?Q?HKqdlj3x2onX4/0tZcIp89dV6AwYVFLHMaiGfG6T+j0QND04Zr00aD5hGmuz?=
 =?us-ascii?Q?TpKdPdxL+VTyial74JaQTSJLc59zaSxfjgEKIDEcXy/57xhQMygvWAPIiifD?=
 =?us-ascii?Q?iv8w/X8dmOuLPgTQXsSrLOnZfZMwlUb+F3M3QvNBj/jwkroJ6k0dzT3a2Vd+?=
 =?us-ascii?Q?0v4wRbi2LyeFXJmW1mlaNvDkEAf/GvDKvLbxi46pfKYm/QoosDW5Da188NwZ?=
 =?us-ascii?Q?8BivGsU239aPw4WMtO7T0f5q09jfwYDKCW6DZK1HN5vQ8BW1e8+SfgcJBwhW?=
 =?us-ascii?Q?y+kr+zh3CILGfxL2DLZPbgTlc/4fJSNNcfK3p4B6GcNehZbcv9XziZZsivNy?=
 =?us-ascii?Q?JRksRuaXXUckpvi6CN7MujV7Jp/QfSco8AdVTpMk5uzVMMID8AMDSOh9MvSn?=
 =?us-ascii?Q?2iFwiSvRIYih++R1Xw+cbe2dOpubAAf2AwEdfDH5xeQKsCHUeOwsPnHPkK9+?=
 =?us-ascii?Q?JQCEs5VBix/esHD5BPUc0iRWJD4d29M11wMB+rJ+icHYnS5mlLtLGJtHDeZu?=
 =?us-ascii?Q?S/g61p7Ag6xKZ7o4nDww5EDK2V9t9jFAzjmR1bKwTMpAArFxbEui/1b48wUV?=
 =?us-ascii?Q?DCRjN4O7mNmB8hjGqTxU18a/Ir+1qc+2sxrZvoddCxxefBlxMiIE2XdDcmos?=
 =?us-ascii?Q?j/3N+FDdBxPaFeflTT/+AWV19WIAsJNQSGYXiUdhD0INpIFGjZQTDDylH5Fg?=
 =?us-ascii?Q?6F9XhrjUOJps3rZBF2GcK2TWLs2eaSd5uwbhl5OpQsJXoDOQ76pgNQZWsQRK?=
 =?us-ascii?Q?DHsBruLK+8WCuoVyWtO7B2JPcULicQcbaEs96J5rd8g5NJOL/URuvVIhbdLu?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ada0a9e2-05d6-4f49-1cf2-08de12a7f920
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 02:49:38.5146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wbY7JqfPwRo8lLYC2vdyLa0lo+VMiKVLUl/ObMsmrbJFV/crhwXq+S+GJEDM/QLJSpUoiqUx4b1eaeTIb/KwVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4928
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

On Thu, Oct 23, 2025 at 12:16:11PM +0530, Satyanarayana K V P wrote:
> With SRIOV enabled, while resuming from S4, there is a possibility that,
> the VM might have been suspended on one VF and resumed on another VF.
> Since GGTT space is not virtualized, we need to fixup all the GGTT
> references while resuming.
> 
> While resuming from S4, check whether the GGTT space is same or not for
> the given VF and fix-up if it is different.
> 

Before I really think about if this will work - quick question, have you
been able to test this out and see GGTT shift after S4 exit? Also with
running workloads?

Matt

> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michal Winiarski <michal.winiarski@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> ---
> V1 -> V2:
> - Rebased to latest drm-tip.
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 32 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
>  drivers/gpu/drm/xe/xe_pm.c          | 12 +++++++++++
>  3 files changed, 45 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index d0b102ab6ce8..38528495478f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1375,3 +1375,35 @@ void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
>  					       HZ * 5);
>  	xe_gt_WARN_ON(gt, !ret);
>  }
> +
> +/**
> + * xe_sriov_vf_fixup_ggtt - Fix up GGTT on resume from S4.
> + * @gt: the &xe_gt.
> + *
> + * This function shall be called only by VF.
> + * Main GT and media GT share the same GGTT space. So, fixups are needed
> + * only for Main GT.
> + *
> + * Returns: 0 if the operation completed successfully, or a negative
> + * error code otherwise.
> + */
> +int xe_gt_sriov_vf_fixup_ggtt(struct xe_gt *gt)
> +{
> +	int err = 0;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	if (gt->info.type != XE_GT_TYPE_MAIN)
> +		return err;
> +
> +	xe_guc_comm_init_early(&gt->uc.guc);
> +	err = xe_gt_sriov_vf_bootstrap(gt);
> +	if (err)
> +		goto out;
> +
> +	err = vf_post_migration_fixups(gt);
> +
> +out:
> +	return err;
> +}
> +
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index af40276790fa..17004223f33a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -39,5 +39,6 @@ void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
>  void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
>  
>  void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt);
> +int xe_gt_sriov_vf_fixup_ggtt(struct xe_gt *gt);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 210298c4bcb1..68bf08ae62f6 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -19,6 +19,7 @@
>  #include "xe_ggtt.h"
>  #include "xe_gt.h"
>  #include "xe_gt_idle.h"
> +#include "xe_gt_sriov_vf.h"
>  #include "xe_i2c.h"
>  #include "xe_irq.h"
>  #include "xe_late_bind_fw.h"
> @@ -248,6 +249,17 @@ int xe_pm_resume(struct xe_device *xe)
>  
>  	xe_display_pm_resume_early(xe);
>  
> +	/* GGTT fixups (if needed) have to be done before restoring BOs */
> +	if (IS_SRIOV_VF(xe)) {
> +		for_each_gt(gt, xe, id) {
> +			err = xe_gt_sriov_vf_fixup_ggtt(gt);
> +			if (err) {
> +				drm_err(&xe->drm, "GGTT fixups failed with %d\n", err);
> +				return err;
> +			}
> +		}
> +	}
> +
>  	/*
>  	 * This only restores pinned memory which is the memory required for the
>  	 * GT(s) to resume.
> -- 
> 2.51.0
> 
