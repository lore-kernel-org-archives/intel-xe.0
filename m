Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A4CC021A0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 19:41:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D744F10EB88;
	Thu, 13 Feb 2025 19:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mqla1NFF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6549E10EB88
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 19:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739475697; x=1771011697;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0vua4cjOWbKUj+IRmfGIAVwlfxi7X0HRCk8luNXjMq4=;
 b=Mqla1NFFO9wtwml2Ao9JsvunM+45C/jr5E5qddmAmx/EvNl+4dxxtjYD
 mmtvpijkZG7TAo1Trr+RCyXR/HZFqT4pluUEYRHX+ZRxmUvTcYYzhTyRv
 ttAWu9hAVpjMsUE9q6cW0N4z7WrOFzghJPYv5t2ja7EfHvi9GsBiCn29V
 0pKu0Dv/dkAHMfbPIvsfaI/qbizaRCaRhhlKgHBzEsSQGmtyW1elEnAx8
 9DNKMvJ2Ngt8stUVkRc9l4xZEjmYdZ9X9I08UsOY06khW4fBu+qpRYLjU
 Qabyrc19+2As6TYrlvC1Wevf6PZZ/GZtRI6a9KKZ97imp0mWuOdMVEPKl w==;
X-CSE-ConnectionGUID: o3nX+64YQOO5FAqdEnA1dw==
X-CSE-MsgGUID: xUPpmp19Q4GhbTcv69UgCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="50825830"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="50825830"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 11:41:37 -0800
X-CSE-ConnectionGUID: dWrq7YAsTBinnW5lXwT5qA==
X-CSE-MsgGUID: kLLFSt28R/eAgKaEg4HUuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="118334045"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2025 11:41:37 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Feb 2025 11:41:36 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 13 Feb 2025 11:41:36 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 11:41:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vU1B3kYfpFa8v4+BXBAhYHHWZZU8ABKZtXkXQYLS7zMb12xB5jpUM7ca0zy2HgBQzBk1b/EHcBF/jPBE17GW6WtI9hCmbfTRpqtmAixQMmbUAeaDlK/bcP/Ujr6FceRNL1OAIj/nv079u71sL1d2ZSwgjzM2okM2+FvAN/i0oCuQdLYpo5Z6BMkMmcTqOgQ0P+N77cJvRugNnZuH1Z4LL0E8nnks10tj878dGkadWQGO32c81gW+Xiq4YFDKRW4KtPf+0AIuK0v6zBA4BT0puz1wcMT+/l5CRvsSyT3i7avGr83YsU/35DtW5ItxlJ18ngwPHt1fxZH8MOIBeJZYNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Ziv8O1iS8L6kJeE/Dz+0xkJYUw5fUOOquTvF/nKvNA=;
 b=q2ncWTLL22/qJfHFbfYbIndjJBFSlqKYUesjUKWdpImbTNroOVjOFT0cTDE03KO0rkyK1HHWGCp9qpRqZMVza3hUmE6l8xrxyh6fivtbkLBcToIHABKErQhlBrT6FPsgH1pyyNjHBxqqZUn6Pi2TmMDsnWjesKzeJ6eSh/isUKay9hFdvLWfOBIvn9QGaHFf/MK6h4FmIlh0uRjqgHbrxn25GkS9UqXlklD3YjPsXXELQ4UpDFuqwyzRhUJjsMNpZQHu1ZvxZD6DktvSJyIIhmzKLSlBTo+8iwZUuNtYIbTmTJ6O1NtiHNp4x8Nw3UGINxBQiubH69ZKAayVqFkh6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4930.namprd11.prod.outlook.com (2603:10b6:303:9b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 19:41:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8422.015; Thu, 13 Feb 2025
 19:41:33 +0000
Date: Thu, 13 Feb 2025 11:42:34 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/xe/userptr: remove tmp_evict list
Message-ID: <Z65LKme2r8dgmfxc@lstrano-desk.jf.intel.com>
References: <20250213135808.189144-3-matthew.auld@intel.com>
 <20250213135808.189144-4-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250213135808.189144-4-matthew.auld@intel.com>
X-ClientProxiedBy: BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4930:EE_
X-MS-Office365-Filtering-Correlation-Id: 9da55d82-0ef5-4ea7-443c-08dd4c666b6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?YBoZ2t01GdKg+mAzKjGiMh6ZPJVC19tR/p60VFe7umJgl08j0gSrhLxWIR?=
 =?iso-8859-1?Q?zYtDglGB1BiCIQzbOtfxsIGfhMyRX4ANl2BUyr7ryy60FldBRv1v5VIA8e?=
 =?iso-8859-1?Q?dbIQNRvwhpQIa6BIPkTzRpf4GqC1YcxVYd62QPKWg+nPQnV1hcYrNMQout?=
 =?iso-8859-1?Q?bmVQDPijNlhjWo7ydV0rNjpYKZjfjlC3DMQDNHbOGSt6IpRF4BWCKZdFQi?=
 =?iso-8859-1?Q?6GBxXTwPfiRz3nVuV3G7+3z0dTPYCjmtqP3DXOUbvS4RAMZu3GQt8STRgl?=
 =?iso-8859-1?Q?biW4ZZQ0rl5cWGQOGBeRVovjDqHNtBrB082Iwsn+T86OekoMYPWnGp0gxk?=
 =?iso-8859-1?Q?q8HhGdwzqj2Tb0+65Kk+zCZsoP1KYmO2JyQisYEZGwbw8IWt9/AKkpFxjf?=
 =?iso-8859-1?Q?vnMSA0ccUpeTWjxtQh99x91gPUI4hbwixH5qnfhnn01ECW7zlQjKOT+1Wq?=
 =?iso-8859-1?Q?d+bbQsdwpYj+nz4RLWjSOXS+vt29fMKdZRRPfwHVAFRxk/5tWg5tU8XKrN?=
 =?iso-8859-1?Q?/rXv13L95eBPPTOyR1CCAuKUp7nZWmLFr6Fq5oZJC7Opjny8/EFLLEVXt8?=
 =?iso-8859-1?Q?VZK+F1YFZsdXAk5+1vxTtg+g0TnQ+qZ625toWnknmXz3a/I4Y7HqvXAvqc?=
 =?iso-8859-1?Q?yAvrD0Mhp4+P6j/W4WSwiJfG6FtcKKpcDeul2jdWinyhI3fsioRg01m0kV?=
 =?iso-8859-1?Q?20ah0c9uHAOzp9h+RYfYpdnC3ynu9pNzY8R1sxEZvzXBKVVDzmaP5sj7Bw?=
 =?iso-8859-1?Q?nXnMut3p/Ua9G3czsylL1TKH7iiEeDalIQXbmirAhKW9pGDLJuu0tk3STp?=
 =?iso-8859-1?Q?X/Gv9dh52u1rezTr6nu8hOEBBUUMn5YPU4Gyq1Ma6WceV/hLSdXni/jqU/?=
 =?iso-8859-1?Q?yZzk2rDZycRWOyuK8Y21hPc2e4nK4J3bL26OySKJCzmNtjQp6FsHocuJ56?=
 =?iso-8859-1?Q?kDpjCqeEWfFJAPAze0OS0mjUJ/uVRhFvuHmKGDkGFlcRi3ydstBlbxbJ6c?=
 =?iso-8859-1?Q?bf41EbCy8607vXZfhbpr228vJzi8TpjQtJKeEkkSPdckugBeqDqjBfwXgL?=
 =?iso-8859-1?Q?yFmbPQSQCfUg3ZHtCfGzQ6n22qDzDxugyBkNpqnCnydI74NG9WNqNa3Fbr?=
 =?iso-8859-1?Q?L1J/n9JvkmFSOt9PG+luSGK69DlfuokIauqG6Nvkio7eVJ404ru33qwujE?=
 =?iso-8859-1?Q?sgh1AZZKtAj4NVd34gPKGXjBBUEwsxCw9kv0K3TDGGZHG9vLZRpkP8FZny?=
 =?iso-8859-1?Q?V7GQOs4AQE1IegNfLM3bL9NG0HBnyLuQy+UgurdkJDvzehRBEZ1H6fN4oJ?=
 =?iso-8859-1?Q?+8RWq2HwDlY9ezwWV3ZB4y4W+iBHO3VN36y1FomCkYe3lYzv2l55EdO7X9?=
 =?iso-8859-1?Q?dm/KI5Ncblxn1lcAB8l27uEtSf87q74cEp8EZHD0NqrbvhaC8UVAxLnEmI?=
 =?iso-8859-1?Q?NLeh3t1nfOw5Elub?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?VonSq4xvjpwUqiVvVZ9013m/qrLB5BNfmxSlmWLM9v6Q0oFnSNiVDH1Wj9?=
 =?iso-8859-1?Q?1gbFLkUILy6MmYgXbSur7JnRS9hgZNkzpuvvKAUPUbY02oUPVCPNLAxzU5?=
 =?iso-8859-1?Q?O7S8lhoGr0ZWr4XGdQIgxnnxL67l59Nx9NN69IqTADfHS/K5u7/DxGigav?=
 =?iso-8859-1?Q?4OuUDesrMRSIM0Y1ni6Xz1CQ6YQIn6mlXntfk66CQj7a1NZsSquWS9ZWUr?=
 =?iso-8859-1?Q?JWBkq00l9by7iOV+Ha7EqsBm0TXpghA9WcvSH3Fn25y1DPpnHMzQM9tud0?=
 =?iso-8859-1?Q?P/vRgDs/Pnu/Yz6q4k1M7zTACc0zqRsvDYWEjspiPiGXafLa8ckgFFKJJ0?=
 =?iso-8859-1?Q?HYuBOLBI9PWvhu9wsbzJySYbZbo/OpN0SdEeNKtrTgf/41pseApM21o6Kr?=
 =?iso-8859-1?Q?MkyrXeiDMdK6+WLozbAkL4W/RsLdh8Imx0vjC4aIVmYLn5prVvlzIh/wqt?=
 =?iso-8859-1?Q?Ks+WtVg7fNOk0IuafX44Tqz80vn2SCuz9Es+omYwy43cmcIy2Va5Ch99Iy?=
 =?iso-8859-1?Q?5GqvVWTrTPVFTnYtbFoMqxmbf9UauyDMde7z68djs5XSqLTr6EuZ0lucyn?=
 =?iso-8859-1?Q?T0M/GN9xsOw038N4jqZamETQlG3jzxXjK3BEzDf90iEg6D/YzekyAGfTQX?=
 =?iso-8859-1?Q?KJ/yXmn+dz7WHYpBdcH4PRHwhv5/NB9Dsqx8ZfWgVZ356m6RY26MwIDv6E?=
 =?iso-8859-1?Q?9CtXlK2PEoEEN6miiTE0IPiZIi+OeNMYydLSXtjVi6qZhZ+QW0pi2BLMWm?=
 =?iso-8859-1?Q?CAuCR0f01NomloeafcQpYEqTN12gbeNAYhe5Jz2dSWO2+01JvG4Y+qJyuK?=
 =?iso-8859-1?Q?ZJ1tud6WlsCKzi7w4O/IZ6tfwVM1ZIdrUzfLBIVnxnUJ0+oMjNfC48eDSE?=
 =?iso-8859-1?Q?XjzMbJ4+jGo+xAzvHON3B7bVzRyZD5PrcLb4Znu0ficIPQ+TqYIWKsm4jH?=
 =?iso-8859-1?Q?I/XbEVbeS+gN/x6Z9G7s9Vya36HOkJyWxDysFPll9wur0FIOuRVMs7OwMO?=
 =?iso-8859-1?Q?gnL+Wd9rhB4TmbEuVOOj2HmOD4hdhJCIuTm/P2P+MWgnK0gAw+WGxBVeME?=
 =?iso-8859-1?Q?/oXUcR817pg5HhlMZLkib7d3Fg4s5ni2kY2Bhph7vNyms1U3FOKMsAopkz?=
 =?iso-8859-1?Q?XaHiRBCeFNvUGfdtMtbMv2jIyfLlGUpM297KNAORlIgg/W5dUZq+NG6/NY?=
 =?iso-8859-1?Q?IeMrRKcI6LViqb2EDu5cZKe1ALn9tWsa761d7t2bbidX0gwL2MJqjm6GCP?=
 =?iso-8859-1?Q?naY8+nVx2DPPNKx5DmLGHzzN8V8VAF9T2mFZzmQX9PpUc0GY+UeucRmpKx?=
 =?iso-8859-1?Q?8T9SSp2Ybp/beTmTj7fj5keimJFjVdU8hTXbvRyCXqAOtKw0tA+AEkD8W+?=
 =?iso-8859-1?Q?xoYLrKvrHX9Om4eoIlDd27jOPTjrw6QbzoTxZonmahB7KBu/0wB+YH/Vuk?=
 =?iso-8859-1?Q?ZLAt2qvcf3SXBDRxlbb9wKHZWtWqFse068tA6FD3j6fM4MKZAQ6q3ZO7Wb?=
 =?iso-8859-1?Q?C0XNnroOpUKkw7dfDtWVTGyThCzu5D1h04CQJ5nPTSlFxcPyLuWtZV0AOp?=
 =?iso-8859-1?Q?gsxsV4XDj6tpHQV2lGFBMZC2ismquawEyOVolxQjZXPoYXrDtYuP5uxgTj?=
 =?iso-8859-1?Q?jIm1z1bJzrUvieD/fsEwl2q03WZYRl+AMuLKCklHycOVRuUIIZPN1EgQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9da55d82-0ef5-4ea7-443c-08dd4c666b6f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 19:41:33.0933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bQ06Opgu1god4tZFD/0ubXZ3lqb+T5/qj5R06fkUHaYCI9oF3mwKSDHSV/9NPE7kEbm0mBic/O3qZWHqvKHQwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4930
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

On Thu, Feb 13, 2025 at 01:58:10PM +0000, Matthew Auld wrote:
> Doesn't look to be used.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 1caee9cbeafb..2d8f99c7c3a9 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -660,7 +660,6 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
>  {
>  	struct xe_userptr_vma *uvma, *next;
>  	int err = 0;
> -	LIST_HEAD(tmp_evict);
>  
>  	xe_assert(vm->xe, !xe_vm_in_fault_mode(vm));
>  	lockdep_assert_held_write(&vm->lock);
> -- 
> 2.48.1
> 
