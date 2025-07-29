Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AD6C87FCA
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 03:41:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 933E010E5BA;
	Tue, 29 Jul 2025 03:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ClcKB9Ax";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DADB610E5BA
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 03:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753760482; x=1785296482;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Fcs+SOaeBxMsPJBMIOnpQ8kGVgkH0CyUgc4zRRn/liE=;
 b=ClcKB9AxuNuD0L63T5gzJ0mMOwxjT5L1Q+pRBjt+XjSDmop2qqcmmkIc
 7H1s0RTsLe/X3oqwNHyD7gp80PrN23DVA7WGcQCwir+KhfhgbMJJbmmlr
 pvGAvYWE6vecysoyzmNznpFGvIVTWPrtC1SstdcmXo/rGrMqshYnqHocO
 3Bf4zxnzLbiTpw/e0CwTGWrnVb9Mlajo93vLBrIn0572R/R8iqj9A3ni/
 QHOtMF9T7gQPrtFnNfMZmHNh68vn/b4h3vtrWnxOc2DWuhAX32FaxH4pW
 6YgM1XJqDPJHm+l/mOnBxtDTHTGnL8wESEygvjE5YxQwim4XS61l+4X0l g==;
X-CSE-ConnectionGUID: k1kv+2gjQHScFj9UZ1Z20g==
X-CSE-MsgGUID: Vw/qqbBASGq5Qr9JdfY49Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="66293153"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="66293153"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 20:41:21 -0700
X-CSE-ConnectionGUID: yhbbyYhNR1yVF+JMWAKKXQ==
X-CSE-MsgGUID: pT1djUeOTyGmsndro+yZAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="166789032"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 20:41:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 20:41:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 20:41:17 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.75)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 20:41:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NwGrzZ+80AY0sMzvPbIgqQ3eEyghieQtA1xOWVZKYjTmPkk7sa55qeBfCtCaVRaxrXbo0UZGYMcHzHB0dMh1cf4MsEbF3Qxkua1+pCAlytjk+CvuC8epvi5BO9Xmild44QxbdwwHpyEuZUDXbWTkJBZuJUZkWGeE5hVaLUKeeapxLLgBep0YqlPbmnG2QLlg+19LGMBQ4woWOSBDCz2yl5YXizDLHrXr0jWX+jjvwYXluOcL0aqwEWODIC8SNIJTXzl2Xs+y4H+H80xh9lihShojibcMQKVrrfSUzz1dUEeCd1B90r/DPfmry46zPFNLrb2dyrW74q0qt9LcNXGxUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4AO87rZC+pfCFZ2nZbzZ35k+Dlzta0eiEAVcek3Cav8=;
 b=s/HKi3QVCMmrpJZ1GPhPFu4lSvsOhQALHMykAJwOZChsoVRCpZePpXFGXDxfhWY+QCkV/kYIhtOY3A50G64hScjer+1BKcwqUfSmJesRiswBSyiczjF7I4n0AUKEs3zXUgMxz+EAczLYGtKnM81lh4EbUfhVtpi7179cY4EL02zYt9lDrz9SAV5tf6VsCTtMT2CzT6xlmUQfZlxo/YrcA+Pz+4D19vCBDwhL3XrSU5Wx47+XNdYN6E3zaJ1Kl0Crjv11gjpDaNUaHD9sFlLEttSOsnKdeDIk63dq6kOSqJnMNNoJxxdWpUdN5unfP+3TRlqrPBxh++SSZ8Fws/p1bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB7102.namprd11.prod.outlook.com (2603:10b6:303:22b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 03:41:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8964.026; Tue, 29 Jul 2025
 03:41:00 +0000
Date: Mon, 28 Jul 2025 20:40:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v5 08/23] drm/xe: Allow CPU address mirror VMA unbind
 with gpu bindings for madvise
Message-ID: <aIhCyZKx1edN1JMf@lstrano-desk.jf.intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
 <20250722133526.3550547-9-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250722133526.3550547-9-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0257.namprd04.prod.outlook.com
 (2603:10b6:303:88::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB7102:EE_
X-MS-Office365-Filtering-Correlation-Id: f54f901b-a1d7-4e22-1aa3-08ddce51bc0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ch1VOnqjNXDvt2MFsqEBZrXEeikp5Q1IGt+E7eShZ4yDUKg9PQsat3j8ZT2S?=
 =?us-ascii?Q?3KK764OP15NI4X+meWBlD4vgbL+9py7RZhKcySnGNy3+/4rtBbv8ZNy9sI86?=
 =?us-ascii?Q?d1zwClhV5MrDroElFMwe8P5xgHZaumtJ2Ui0BhX7YjqgcWjYp1DePE9gtN09?=
 =?us-ascii?Q?IR1JmuMnPPNKX6dOeYs7YYW7wAFUi7j8E7/Y+D5TFZWc88dSrXOM2aEK0uQu?=
 =?us-ascii?Q?CQGbzNxivo8rMvFRfppYmb3hk07hRp01kYEkb/9r/FdR1XSTzLgo/BO364sh?=
 =?us-ascii?Q?VMDC9P9etxBNse7WMKZKsqKEFiTnzE7uJIHUndK1dkpox29xILusMsLdAnjH?=
 =?us-ascii?Q?k++n2Ml+GMYqA+Qhdo7HlRicaCCnVwdCvTdVs2QX60Hr4hIp22zibkGsv3pT?=
 =?us-ascii?Q?C6sibb/hdeadjXd1lioLrJtu4d0C0VAvM+35zSUBejoH2mhw5L3ONkVWt2su?=
 =?us-ascii?Q?wO3WoAgJLqM6+F421tOLBajGLz2QTV8FvqguNRoziIkZGDsWM73PxFVkpunK?=
 =?us-ascii?Q?vSKpb4VBJXCR+tyO5YCCIoKxQNFHs9tTSMfVEYuNGZpVfQ/8jw0rgGTWwUz4?=
 =?us-ascii?Q?h3Nm8UC1+2DwgQcjKDfBLi2ShB5lsjggybBpqCL8v2iyzBft/2+urbWGk+Sv?=
 =?us-ascii?Q?CBuO8Lo4Gq8ANZvOJXVGTR8l0wTpQ01TT0WuPQiyKGm0SCDthT6fBape7sA5?=
 =?us-ascii?Q?L4vlND7HtYxCCeDagCAG4YqAu/+fsLgk+OVSzAvk8pmCJBUND2iabPjc3v/B?=
 =?us-ascii?Q?ZDuZ3WcL4CirEqC6ghI8aefu0JBL4B/lzNdHoJCHbJA+TsFbizx589R/FrJJ?=
 =?us-ascii?Q?8y6DnMkqPPIn9gGRuM0Dn+ylBmfPacLCNq/rKPVw7hptlljvt2TMDUjaTD1l?=
 =?us-ascii?Q?IaWb7H5RcgSnY+HrtHsyCQesZzD6ov5b6LAP1WsS4z4sFKfsGGFKITN7J/3n?=
 =?us-ascii?Q?5FxVJMlke38iC6FE21av1l3zol+weX0SpbO2LlXLSvrGrFooAt3Qcp7jHrjh?=
 =?us-ascii?Q?LoK01REXalY6vu+oIiQp2ozYZ7LJBpZUP8/zwWUypK2ZOpLHTKpN4xGeVLpv?=
 =?us-ascii?Q?GE+2ilM3wdyog8UYGrqUryEDWOy6nUyPrdOHCczrRv3H9vmxr3hJDfXhe6KA?=
 =?us-ascii?Q?G0Rki1fLrXlIk0t499QPui5c44BoVrO0NXMCMReQm9riPlPDAeA5n6e5s7dx?=
 =?us-ascii?Q?MZRHdk9Mbc5XOncmT+p4A7DE2X+Wew4LYXQzmxBvle4E6ZorFRNyTWPTX62L?=
 =?us-ascii?Q?bZEFZcfo1VK2ofIiyFvkaOIN1TxjfJE4YEj2MDs+qPd8BWLOnSjnI4oiHsdv?=
 =?us-ascii?Q?SoWPgtAA7HE+r5dR981ZhMcqthD7Cc0sCIM2xd6FkR909xxEslE8P4TcZz9E?=
 =?us-ascii?Q?NEyNOcLg5fyxQ0i9MUt3LHWluEj6UfM3xN8ie2YF9KlitcIHAdv47xrwIWMb?=
 =?us-ascii?Q?00zc9kx+o2s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xStPj0XyZARkezYB5glYkTkIOAehQhX8xTPnVC48V8SLfAxhxiAo+Ca0hTqm?=
 =?us-ascii?Q?EMeAg8EtFxkPWHMjY4lXJ63cKfGHvIHTm8A9wPlhCT5U8aiWjeJZIfJLATK2?=
 =?us-ascii?Q?PBCCRIMSpnNW0IqTDRdGJhigYO1PKsBfyb/cI/hgg9ZeU8qtoERN3aIb0J+F?=
 =?us-ascii?Q?7bVgAI5sGZmc8DEhlgnokP9ILaII+8yoEjQMU5ptVZ6Xy/KGh7T4LiYYvliX?=
 =?us-ascii?Q?St/O3d6gc2Wv57SSu1XCSBIBti8lZzUD7gh6dfwzo688rFZ40Q6QneLX1NOW?=
 =?us-ascii?Q?8MUCzE06/z3rDio9xtcds5Yz967SjoOuahycw6a7Ym0xcw5UiaSyUM0R9q2E?=
 =?us-ascii?Q?P99Z1pWlucl03Zu9htvgLJyIKhG0Roua1n77fX18cWqs1kjJDgalbxbfr0pH?=
 =?us-ascii?Q?UxvCo3gDS7qKicXBgJ/pouo87Z/Vk4n7zz3bbpMgfYhPMtxRzAtOFfmlo3+S?=
 =?us-ascii?Q?4n5NFE41JercijtmH27RdgLMPWVU0jburot7fqtT8jK3JGGxQj+n2tgHsYiU?=
 =?us-ascii?Q?1Z4yn+cL9zbbqOCqpyCmdP23rQgCukPta3Nm+eyjy8f4k+aOUhgoNATxOlry?=
 =?us-ascii?Q?mHWnMuCCZi5JcjE5cF6yxHm6K8y9DgxGdcHY5gXfh3XNA06nUVIwHAcj0uWx?=
 =?us-ascii?Q?+BYYTrTaZMRujobhKHeG8j9kX4T/23oUunWI1xZYpioggQsG6e63TllAQ2v3?=
 =?us-ascii?Q?Oa2UqNsOWyEDIedjttDGxkeUAy1edxx0Kqe9rVfiWC7NBaFi4fq1HQeYADhF?=
 =?us-ascii?Q?07NPjiGeDWCgtANgC8b3yVknXoppUxpi3IY8StxTUKBYGokeombIC7Zd52oW?=
 =?us-ascii?Q?zqYy9ymFl2ILekXxgTe9CiJrpq++8pS//sDMj0Jq0Fvvut/Yd3BVfvALzUuO?=
 =?us-ascii?Q?M7JfTtNIBZFcut1XuLIGBHhTLyjPnhJSKcZHfBsklgb4N6sLpp/ma95nUKdY?=
 =?us-ascii?Q?QZW5d7q9E6wdIc3OLeMcTiC+m4U52tSwdx6stVJHjOHMCsb+9tqAEMtLICKq?=
 =?us-ascii?Q?2RCPa8hiMeRdpGe7XHb8oKMtlUcq0DD1WaTRpjI8g92eZ/3M1ihmcnnQq/mP?=
 =?us-ascii?Q?agyn3OIPur/GmqNKmgADNMq01s43xj2oLMbHQVloEynhOa8XnNXgCoghvxOo?=
 =?us-ascii?Q?CgQyFBbBA36TBlnXpaGsf6PfUNxpb2WoI87c4nX7MeGIUbjf+eXl66BYT7Yr?=
 =?us-ascii?Q?O+YL7K4OEhvajKsANWHtcdd9bSOhJJBlcYFlc+bcnDStynHx/r3HORUOVLtM?=
 =?us-ascii?Q?Xjq2BLxelsVnpveBVpy5cPoZ6rJI1qsiAtlj7kojFPbcQ4qW7FeF1FJqwifk?=
 =?us-ascii?Q?R5NhDBg2y9yKWqfBRkkzxQa5CdfYxOptRI8YWjoXtNTLrE+sqYSlZeuxBmRc?=
 =?us-ascii?Q?BA19nxpgC45Wetr8Es/pFuV0M0Z8+aX63/ddjhD9kEKn9a9X7fBd1Tsjsks/?=
 =?us-ascii?Q?ODdqTrDBEhgEqcboA04BtsmWpPZcIbG1qd97bjFa5woJlNNjO6A2hBPigRI+?=
 =?us-ascii?Q?U35uXoLXxFQlB4jI+qQ9ofk7PoIcFhOFTL0tne9Uq26goyF//nwiJTjntAGS?=
 =?us-ascii?Q?7f54Uz0be59FVK8Jet52xPMb/2hFL+kN0r90wsWUHMudTR1M22hfJFLHuLTv?=
 =?us-ascii?Q?QQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f54f901b-a1d7-4e22-1aa3-08ddce51bc0f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 03:41:00.0604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pCsgW9sunk9vGOxrAJ+H4sBsmyvEd8Y+5h/XdHJLdxwucTeNGKqgDwdqPx80EyDAXHx8ZcROZdltQX+eslGi4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7102
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

On Tue, Jul 22, 2025 at 07:05:11PM +0530, Himal Prasad Ghimiray wrote:
> In the case of the MADVISE ioctl, if the start or end addresses fall
> within a VMA and existing SVM ranges are present, remove the existing
> SVM mappings. Then, continue with ops_parse to create new VMAs by REMAP
> unmapping of old one.
> 
> v2 (Matthew Brost)
> - Use vops flag to call unmapping of ranges in vm_bind_ioctl_ops_parse
> - Rename the function
> 
> v3
> - Fix doc
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 28 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_svm.h |  7 +++++++
>  drivers/gpu/drm/xe/xe_vm.c  |  8 ++++++--
>  3 files changed, 41 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index a7ff5975873f..ce8a71b80811 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -933,6 +933,34 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
>  	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
>  }
>  
> +/**
> + * xe_svm_unmap_address_range - UNMAP SVM mappings and ranges
> + * @vm: The VM
> + * @start: start addr
> + * @end: end addr
> + *
> + * This function UNMAPS svm ranges if start or end address are inside them.
> + */
> +void xe_svm_unmap_address_range(struct xe_vm *vm, u64 start, u64 end)
> +{
> +	struct drm_gpusvm_notifier *notifier, *next;
> +
> +	lockdep_assert_held_write(&vm->lock);
> +
> +	drm_gpusvm_for_each_notifier_safe(notifier, next, &vm->svm.gpusvm, start, end) {
> +		struct drm_gpusvm_range *range, *__next;
> +
> +		drm_gpusvm_for_each_range_safe(range, __next, notifier, start, end) {
> +			if (start > drm_gpusvm_range_start(range) ||
> +			    end < drm_gpusvm_range_end(range)) {
> +				if (IS_DGFX(vm->xe) && xe_svm_range_in_vram(to_xe_range(range)))
> +					drm_gpusvm_range_evict(&vm->svm.gpusvm, range);
> +				__xe_svm_garbage_collector(vm, to_xe_range(range));

There is a corner here - the range could be in the garbage collector
list...

I think to fix you have to do this:

drm_gpusvm_range_get(range);
__xe_svm_garbage_collector(vm, to_xe_range(range));
if (!list_empty(&to_xe_range(range)->garbage_collector_link)) {
	spin_lock(&vm->svm.garbage_collector.list_lock);
	list_del(&to_xe_range(range)->garbage_collector_link);	
	spin_unlock(&vm->svm.garbage_collector.list_lock);
}
drm_gpusvm_range_put(range);

A little convoluted as it is only safe to check if the range is in the
garbage collector list after it has been removed from the notifier,
hence the need for extra ref counting here.

Also I believe this code path will need an IGT specifically to test this
code path.

Roughly...

buf = aligned_alloc(SZ_2M, SZ_2M);
fault_in_buf_on_gpu();
madvise(buf, SZ_1M, some attribute);
fault_in_buf_on_gpu();	/* Ideally showing different behavior between 2 chunks */
read_buf_back_via_cpu();

Matt

> +			}
> +		}
> +	}
> +}
> +
>  /**
>   * xe_svm_bo_evict() - SVM evict BO to system memory
>   * @bo: BO to evict
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index da9a69ea0bb1..754d56b4d255 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -90,6 +90,8 @@ bool xe_svm_range_validate(struct xe_vm *vm,
>  
>  u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *vma);
>  
> +void xe_svm_unmap_address_range(struct xe_vm *vm, u64 start, u64 end);
> +
>  /**
>   * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
>   * @range: SVM range
> @@ -303,6 +305,11 @@ u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end, struct xe_vma *vm
>  	return ULONG_MAX;
>  }
>  
> +static inline
> +void xe_svm_unmap_address_range(struct xe_vm *vm, u64 start, u64 end)
> +{
> +}
> +
>  #define xe_svm_assert_in_notifier(...) do {} while (0)
>  #define xe_svm_range_has_dma_mapping(...) false
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index a56384325f4d..7f3d0ad04b3f 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2663,8 +2663,12 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  				end = op->base.remap.next->va.addr;
>  
>  			if (xe_vma_is_cpu_addr_mirror(old) &&
> -			    xe_svm_has_mapping(vm, start, end))
> -				return -EBUSY;
> +			    xe_svm_has_mapping(vm, start, end)) {
> +				if (vops->flags & XE_VMA_OPS_FLAG_MADVISE)
> +					xe_svm_unmap_address_range(vm, start, end);
> +				else
> +					return -EBUSY;
> +			}
>  
>  			op->remap.start = xe_vma_start(old);
>  			op->remap.range = xe_vma_size(old);
> -- 
> 2.34.1
> 
