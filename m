Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B80D116F1
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 01:46:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB2010E501;
	Tue,  2 Dec 2025 01:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gc9XNr9B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E0B10E501
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 01:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764640013; x=1796176013;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Ic1g2pzDY8PKyqInBUobzG1ivkPKxoJNVV+cpQRoTd8=;
 b=Gc9XNr9Biy+AZG4mW/WrrjqI9KB+BoOJnXl8z32CYShwAMxrGi8xBkks
 rR65blV9/gMDm04QgTbPliMR7g2JP2UE5AMs5qXO3ymaQacjors5i4840
 nZCXXIQAjBflt4NrprFB1qx0ryKrElWUbcEwpK9lWKlD5lQwOAuuWpCcq
 gdCN3Zd8QFCnFUEiU7PT8kDyApkxf+ddkeLjQpKBytGiaSm9y02fdTQrS
 fzU4uSoP1fKKVBh59eB7fSgMKANjv1UzxREozAuw+FDek9rtzM3i3aJO3
 /2b0wvAW1VdNbbGdcbMB3RNxwRKKYj5cPpbibPwDqEkFW3Mf2OcfDpf+z w==;
X-CSE-ConnectionGUID: H0mIOC6TSSmw05TFXriWXA==
X-CSE-MsgGUID: gDUOD0tWTwuvsRK3ilFg4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="65783061"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="65783061"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 17:46:52 -0800
X-CSE-ConnectionGUID: W+gbpH2xTzKGBmLzpdEbjA==
X-CSE-MsgGUID: NAhGcwxuQXGlzeZDFbvXFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="217566237"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 17:46:48 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 17:46:48 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 17:46:48 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.4) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 17:46:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=haV/vLM/f9Fzz9fVMzMhwzZNCioEcesyfubZN3i/y7g5vQuJRBlxHw5nY3hqHi3k+YEVFsFzJiBaGgMooSZkXmwVEeqhRZfkK2KTQ3izBpoUoWYil+Jk9G4p/RPDLobyfcwmaD+50B6cJXcIMILwvGII95zDpwidEtmLfVlyX/xaUgWlnMMlL0b0xfNvw86C21BAZqPnNaXAdsWwJG2W2n82Y5OV3TlchWsrNtW02t3Bf+pV0YABIe4i4Xb5+7Mn0+ZVI5doBBjj47Q+jjodaqu5/ENP2xu8X2W/t5MV0lsjywLO0G+94kmGIuRZw0F6ZU7SgGL6KePPBEphGcH/Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKgCdEkOk98PrB/Qg40Gw2kV39YGlBLzF6GL/rlj8MM=;
 b=S2flRQSUK1x3qs0NjayVH9uzbsk3apaBfFMoTBSqxRZofVI/XIbRZ9NxB69ZoY5P1xmJEepdwsz1EjkKU5zzFEqB5U6D5qbPmG0IyD15yJ0Ry/7bvkmTrndf8i3biPAGVgB4VpTFruNcBwauT2jmrfbDNn9NwPmUoKmmZPxjotXSAYcif+zY3e3hAuDqTuPILuf+CCOXTkFRXjp8omu6mTTOFHpsiekJ437p6wGjcr7n5V6EzldM6RXHSOZYdKckzp+s5ZnrIKgt4bS0Qp3qTRCpLzk8Dvj/2bspzuJDNLd/NfmxBMPo8gjlZFyGHUafhdX9DgNQZ7eDFCbp1GwZQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5184.namprd11.prod.outlook.com (2603:10b6:a03:2d5::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 01:46:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 01:46:45 +0000
Date: Mon, 1 Dec 2025 17:46:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
Subject: Re: [RFC v2 4/9] drm/xe/madvise: Implement purgeable buffer object
 support
Message-ID: <aS5FAhlXkBly4a1D@lstrano-desk.jf.intel.com>
References: <20251201055309.854074-1-arvind.yadav@intel.com>
 <20251201055309.854074-5-arvind.yadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251201055309.854074-5-arvind.yadav@intel.com>
X-ClientProxiedBy: MW3PR06CA0017.namprd06.prod.outlook.com
 (2603:10b6:303:2a::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5184:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cb83373-9bb2-42d3-ebfe-08de3144a634
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ZIbtSXZDnvP2MdzIWt6aGnm+xu7ZVREOIZoF/AWp8lV8jXHXsZCOnE9+LK?=
 =?iso-8859-1?Q?Hce2mr+dmrnU1iNNPHF+kMsTYeRKOeJaRRB1P2eVHrJ8Cs6goyzsNwZOiN?=
 =?iso-8859-1?Q?dAQayCD0rlV96pj3GShiEFqbmuCN5IQTJ5QxyOEcQQmDEbe69Ahb5kis9x?=
 =?iso-8859-1?Q?WOtBmKFWCg9DhcRIS4CfR2AVdvf+nicy+RNMrZNHptK+C7KR3yoX7KxgV3?=
 =?iso-8859-1?Q?P/7dQkQqxq8LBl3aRSrdJe7jPewZxUvkNpPi3WsWBsbtEmPAT5IAkQuDh1?=
 =?iso-8859-1?Q?y3SCgdBpTjSeLAmzGA/R9As9lJYZoR0Vw7NP9fv+pfDtBtw+FHQrErEz1B?=
 =?iso-8859-1?Q?yozNqbbfiISgdH8i5VYWyY5oXITtJsfYXzapcJCbSyoK9cZUiEiBT4hk3U?=
 =?iso-8859-1?Q?E5XeEwwZlJHRvjZo8w/6uCqrsC4iOef3ffj97MO/+ZE8NtUcvtmtsBXjzy?=
 =?iso-8859-1?Q?tu3sbTB2KfoXaz2Gofqp9il0HNO2rVB25nIL8YUpUnJ8YRM97jvPDRldWC?=
 =?iso-8859-1?Q?XsfOQn06VQsqoniY+YvOkDuVDntxsnhOIMNRslCtTK/a/YQFMks7sj2WkH?=
 =?iso-8859-1?Q?EVCB+i92BuOSIbloOtZmNTUBma/pmWDolYNy5Zi+xhA7WhFPILnl+5PGYK?=
 =?iso-8859-1?Q?bT9qgF6meEwpeuiwBWviYn7WSnVcbDfltmZAuM89jZi6rHxvqcV1xRsOs/?=
 =?iso-8859-1?Q?GAjstHYTsdK0HxVnABtuK/N1QiRxlTSbcrO4kkKE1CyeLL5gzlBRo256Tj?=
 =?iso-8859-1?Q?bk5oL1Xc471FMkOuSdSO+pJJ/xMqMnlAufQD4cQrhTTjTgHFxZ8Om1mZg+?=
 =?iso-8859-1?Q?oUYefI8/2HSy0p5VQPas2vsiotlmNUNhAL2TnZghul0fkSPBoIfjiJenIo?=
 =?iso-8859-1?Q?732+sOb3iG7ngAeVa9+/TfJad2LFjbG/KZsQPEkSiIDGuMFJ9/exBBO8XT?=
 =?iso-8859-1?Q?m3Yz/xmxvjRxnhGkbQAOHv3TvJiaPqoW4NVlr/qNpfdn1+w81AdsmE0Sbg?=
 =?iso-8859-1?Q?mBAJP15lTkEc/7wFInhbdqYpDJJNvJnVsf9Nvokq9KY8FWstx3OAfSn+Hl?=
 =?iso-8859-1?Q?ME3Luj6954l/UPAHVZcMHYkGzudLSNwbGvO6hpSiYR+K0YqeCsqcRhp7Dj?=
 =?iso-8859-1?Q?0teFF6Fc0/AUtSQ0M2+7xjR9c2pTFpH1C6uyxfBKMXs/ZemDDM85ITNdha?=
 =?iso-8859-1?Q?eJtpsy1kRf7BT5/Ae+W2Q55kpHIfMAjTwmre/8dbFm/5tNgw8R+Cz5AW7r?=
 =?iso-8859-1?Q?J6bSy9cBVdN68Kgw7VhUIeQ4h+xhiCBQRur0t6Ur8QiyHppZrTlF9J265D?=
 =?iso-8859-1?Q?qSrtLPO71j/i8ssnW1Gl1my/avRnc3a+cOXP+0B/R1qxME0aVtHYR1njgk?=
 =?iso-8859-1?Q?TlA0U8kCqDVzfKmgAlb5Z95+DsGBEI2WhlDkFMWef/SYhM+mnEO1F8cKMe?=
 =?iso-8859-1?Q?wLZSnMPR1Oh1nmLM6Sg6F+CrLYiOUMgYmUaEoBmZ/BkQD6TOyVCLc7dpPJ?=
 =?iso-8859-1?Q?um1tq0MYTs3Pk4uuQbHhPH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?t/PEjw4oodsm5vYnSbVI/V7heRwApRbmEaQAvRNJ6aP2INBH4GIL6+4jc+?=
 =?iso-8859-1?Q?2E3CwW+Jn1AafvF+koYdSjYHUUbQJpM2+0em+Pw4kMXqVBgppZz0HYThlL?=
 =?iso-8859-1?Q?KJY9DrWJhYdbM44NlHOpPI6yrCCW3kUtXkWJ92mhTdduQmNWrh53r3gUkN?=
 =?iso-8859-1?Q?2dKK8JATmX1Wa7TAINv5PY0B7CQLGivYGPbcr/DMRUYTkWUPwi6ACjV98g?=
 =?iso-8859-1?Q?idZoPDQxpUZl0CR+Er7W902gZcXuSBnW4v5Im4GaqkL5sie0bI9e6o7GBs?=
 =?iso-8859-1?Q?mgUOw0WJ42xvcdqPbX7nEIhpPs85YYJH/rpgEn5ELDI6USILQ6qAicwLXF?=
 =?iso-8859-1?Q?nN1TPaMVUqJH4UBk1IA5tKTzOB4JDpCt6TGR4qhx4ivr/VF0sr10vnogSV?=
 =?iso-8859-1?Q?lcHFYRfD7hjcT4Ow//DkuU+isReejupksRrknxgD+fy4OuSxVTTwjYphWi?=
 =?iso-8859-1?Q?PNI3IdzuwcwsPWR0XDjni2WmtubDKMz7ssVTKpRHYLRsp2hVQZwWwifb8d?=
 =?iso-8859-1?Q?486/bFC9SgdtQvdzeGdH89MqZ6/CNKBaEbUwuSnHMrl/mDhlHDXAdJtJOo?=
 =?iso-8859-1?Q?Hvg96eNZ86Iiebd94lbMXvHZyFuIH1CkZc9ycFRDMEbdOrkAfiZfFtgwl3?=
 =?iso-8859-1?Q?E5fP8Nlua7xvCAXQIK6H4lbJ0YQzTyfwcTgpyh2ne05vhHgstadh8JcD9L?=
 =?iso-8859-1?Q?6SQJn8SltoLRzYP6JZbfIIbTT/vyDRQOmVd6zb3h7UOnwTbNjSitbaxG7B?=
 =?iso-8859-1?Q?IVXTKE6pzfizl25sKqPk8/2isiJniEU2UuzDcg68tCYDasthDqI9DlgDis?=
 =?iso-8859-1?Q?mEjrc7eRH3EBnbDpKbRVVOGIFnOydnz4NPwPZx3Cr4MGjKcd++vdPBwAu9?=
 =?iso-8859-1?Q?RjzFpdhTilb4F8OKcRm14tt9iDREFAFeJUXj4C9Zu78k7AOqqJk0aylGdx?=
 =?iso-8859-1?Q?2hapMflvhJZnGi8/bEk8VLkOcfOB7Au1HeXxaHJwd/yx0SmRy6Tw3YFRf/?=
 =?iso-8859-1?Q?/yhNQRxgMOPcNFqi6kuSuSLzb2JWZlxJGzQ/uBNaLxlA7XFb24TkD/Z1s9?=
 =?iso-8859-1?Q?Q/u2kVhyUxBHnuRSq7qSioKpjFbI4Yussni1/lI75mRV1NK7QDILEy0jl5?=
 =?iso-8859-1?Q?9icOKe6X/MqNBSkAKtvGnYCYpFsH4io3+WkJV3FQp0sc00kg3CiFUQF2sj?=
 =?iso-8859-1?Q?faPsxaCky6gmAmycv4I5xKyozPtWvFB20vwzng1zGIFea4wRnCFMX7gxP3?=
 =?iso-8859-1?Q?cVqsmkrWQ1gRCFs4OP+Xa1m4BwBGzzm01Gkk5bEJQFev+ojKzyiJSNtAES?=
 =?iso-8859-1?Q?OXIiDV0+IGu8AUt2KVVEyG7d+KPLMXdxSE6cz7y1J+jLBOqc7pUW2Ik8yv?=
 =?iso-8859-1?Q?PuXmt7bwQy5L/stlyMnlwA4KNmfD3F60Px7KL2drjZBQ6D6h3fH+NGFAU6?=
 =?iso-8859-1?Q?yJKcKB7kyTofzsE8AIy2eMfKf5wgmYwSIyVHH98JEpcdtX4SizCqZzZoGL?=
 =?iso-8859-1?Q?w8vP8h7V9vtxBGOD//QXgLLy3fe+2rKoK32OtxPO4REzKJ5SS/r7esEIH+?=
 =?iso-8859-1?Q?j48JfvAX3heoVOLyT8Oh+ObHol0V9jghPR4sZz/viN4hNc60QYHoZlEL6+?=
 =?iso-8859-1?Q?X7l6YvSWV0yB5PpU/LxzfzOjGqToeL48/d/x3mfPRqy4U8LmpaZRoJ/w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cb83373-9bb2-42d3-ebfe-08de3144a634
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 01:46:45.0337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cHi1uvNprGAfmh/CbsPWb7xEa+5A4Wi6KPKa52woVpfzYb7qpYQm8WkZg5uKiXa6zsTu4dHR8faAh3sKNag8OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5184
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

On Mon, Dec 01, 2025 at 11:20:14AM +0530, Arvind Yadav wrote:
> This allows userspace applications to provide memory usage hints to
> the kernel for better memory management under pressure:
> 
> Add the core implementation for purgeable buffer objects, enabling memory
> reclamation of user-designated DONTNEED buffers during eviction.
> 
> This patch implements the purge operation and state machine transitions:
> 
> Purgeable States (from xe_madv_purgeable_state):
>  - WILLNEED (0): BO should be retained, actively used
>  - DONTNEED (1): BO eligible for purging, not currently needed

Quick comment - should we use TTM priority levels so WILLNEED is a higher
priority (less likely to be evicted) than DONTNEED (more likely to be
evicted).

Expect more comments but just a quick thought.

Matt

>  - PURGED (2): BO backing store reclaimed, permanently invalid
> 
> Design Rationale:
>   - Async TLB invalidation via trigger_rebind (no blocking xe_vm_invalidate_vma)
>   - i915 compatibility: retained field, "once purged always purged" semantics
>   - Shared BO protection prevents multi-process memory corruption
>   - Scratch PTE reuse avoids new infrastructure, safe for fault mode
> 
> v2:
>   - Use xe_bo_trigger_rebind() for async TLB invalidation (Thomas Hellström)
>   - Add NULL rebind with scratch PTEs for fault mode (Thomas Hellström)
>   - Implement i915-compatible retained field logic (Thomas Hellström)
>   - Skip BO validation for purged BOs in page fault handler (crash fix)
>   - Add scratch VM check in page fault path (non-scratch VMs fail fault)
>   - Force clear_pt for non-scratch VMs to avoid phys addr 0 mapping (review fix)
>   - Add !is_purged check to resource cursor setup to prevent stale access
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c           | 72 ++++++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 19 ++++++++
>  drivers/gpu/drm/xe/xe_pt.c           | 36 ++++++++++++--
>  drivers/gpu/drm/xe/xe_vm.c           | 11 ++++-
>  drivers/gpu/drm/xe/xe_vm_madvise.c   | 73 ++++++++++++++++++++++++++++
>  5 files changed, 193 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index cbc3ee157218..f0b3f7a13114 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -836,6 +836,53 @@ static int xe_bo_move_notify(struct xe_bo *bo,
>  	return 0;
>  }
>  
> +static void xe_bo_set_purged(struct xe_bo *bo)
> +{
> +	/* BO must be locked before modifying madv state */
> +	dma_resv_assert_held(bo->ttm.base.resv);
> +
> +	atomic_set(&bo->madv_purgeable, XE_MADV_PURGEABLE_PURGED);
> +}
> +
> +/**
> + * xe_ttm_bo_purge() - Purge buffer object backing store
> + * @ttm_bo: The TTM buffer object to purge
> + * @ctx: TTM operation context
> + *
> + * This function purges the backing store of a BO marked as DONTNEED and
> + * triggers rebind to invalidate stale GPU mappings. For fault-mode VMs,
> + * this zaps the PTEs. The next GPU access will trigger a page fault and
> + * perform NULL rebind (scratch pages or clear PTEs based on VM config).
> + */
> +static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
> +{
> +	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
> +	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
> +
> +	if (ttm_bo->ttm) {
> +		struct ttm_placement place = {};
> +		int ret = ttm_bo_validate(ttm_bo, &place, ctx);
> +
> +		drm_WARN_ON(&xe->drm, ret);
> +		if (!ret && bo) {
> +			if (atomic_read(&bo->madv_purgeable) == XE_MADV_PURGEABLE_DONTNEED) {
> +				xe_bo_set_purged(bo);
> +
> +				/*
> +				 * Trigger rebind to invalidate stale GPU mappings.
> +				 * - Non-fault mode: Marks VMAs for rebind
> +				 * - Fault mode: Zaps PTEs (sets to 0), next access triggers fault
> +				 *   and NULL rebind with scratch/clear PTEs per VM config
> +				 */
> +				ret = xe_bo_trigger_rebind(xe, bo, ctx);
> +				if (ret)
> +					drm_warn(&xe->drm,
> +						 "Failed to invalidate purged BO: %d\n", ret);
> +			}
> +		}
> +	}
> +}
> +
>  static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  		      struct ttm_operation_ctx *ctx,
>  		      struct ttm_resource *new_mem,
> @@ -853,8 +900,18 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  	bool needs_clear;
>  	bool handle_system_ccs = (!IS_DGFX(xe) && xe_bo_needs_ccs_pages(bo) &&
>  				  ttm && ttm_tt_is_populated(ttm)) ? true : false;
> +	int state = atomic_read(&bo->madv_purgeable);
>  	int ret = 0;
>  
> +	/*
> +	 * Purge only non-shared BOs explicitly marked DONTNEED by userspace.
> +	 * The move_notify callback will handle invalidation asynchronously.
> +	 */
> +	if (evict && state == XE_MADV_PURGEABLE_DONTNEED && !xe_bo_is_shared_locked(bo)) {
> +		xe_ttm_bo_purge(ttm_bo, ctx);
> +		return 0;
> +	}
> +
>  	/* Bo creation path, moving to system or TT. */
>  	if ((!old_mem && ttm) && !handle_system_ccs) {
>  		if (new_mem->mem_type == XE_PL_TT)
> @@ -1606,18 +1663,6 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
>  	}
>  }
>  
> -static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
> -{
> -	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
> -
> -	if (ttm_bo->ttm) {
> -		struct ttm_placement place = {};
> -		int ret = ttm_bo_validate(ttm_bo, &place, ctx);
> -
> -		drm_WARN_ON(&xe->drm, ret);
> -	}
> -}
> -
>  static void xe_ttm_bo_swap_notify(struct ttm_buffer_object *ttm_bo)
>  {
>  	struct ttm_operation_ctx ctx = {
> @@ -2202,6 +2247,9 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
>  #endif
>  	INIT_LIST_HEAD(&bo->vram_userfault_link);
>  
> +	/* Initialize purge advisory state */
> +	atomic_set(&bo->madv_purgeable, XE_MADV_PURGEABLE_WILLNEED);
> +
>  	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
>  
>  	if (resv) {
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index a054d6010ae0..8c7e5dcb627b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -87,6 +87,13 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
>  	if (!bo)
>  		return 0;
>  
> +	/*
> +	 * Skip validation/migration for purged BOs - they have no backing pages.
> +	 * Rebind will use scratch PTEs instead.
> +	 */
> +	if (xe_bo_is_purged(bo))
> +		return 0;
> +
>  	return need_vram_move ? xe_bo_migrate(bo, vram->placement, NULL, exec) :
>  		xe_bo_validate(bo, vm, true, exec);
>  }
> @@ -100,9 +107,21 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
>  	struct drm_exec exec;
>  	struct dma_fence *fence;
>  	int err, needs_vram;
> +	struct xe_bo *bo;
>  
>  	lockdep_assert_held_write(&vm->lock);
>  
> +	/*
> +	 * Check if BO is purged. For purged BOs:
> +	 * - Scratch VMs: Allow rebind with scratch PTEs (safe zero reads)
> +	 * - Non-scratch VMs: FAIL the page fault (no scratch page available)
> +	 */
> +	bo = xe_vma_bo(vma);
> +	if (bo && xe_bo_is_purged(bo)) {
> +		if (!xe_vm_has_scratch(vm))
> +			return -EACCES;
> +	}
> +
>  	needs_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
>  	if (needs_vram < 0 || (needs_vram && xe_vma_is_userptr(vma)))
>  		return needs_vram < 0 ? needs_vram : -EACCES;
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index d22fd1ccc0ba..062f64b16a58 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -533,20 +533,26 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  	/* Is this a leaf entry ?*/
>  	if (level == 0 || xe_pt_hugepte_possible(addr, next, level, xe_walk)) {
>  		struct xe_res_cursor *curs = xe_walk->curs;
> +		struct xe_bo *bo = xe_vma_bo(xe_walk->vma);
>  		bool is_null = xe_vma_is_null(xe_walk->vma);
> -		bool is_vram = is_null ? false : xe_res_is_vram(curs);
> +		bool is_purged = bo && xe_bo_is_purged(bo);
> +		bool is_vram = (is_null || is_purged) ? false : xe_res_is_vram(curs);
>  
>  		XE_WARN_ON(xe_walk->va_curs_start != addr);
>  
>  		if (xe_walk->clear_pt) {
>  			pte = 0;
>  		} else {
> -			pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
> +			/*
> +			 * For purged BOs, treat like null VMAs - pass address 0.
> +			 * The pte_encode_vma will set XE_PTE_NULL flag for scratch mapping.
> +			 */
> +			pte = vm->pt_ops->pte_encode_vma((is_null || is_purged) ? 0 :
>  							 xe_res_dma(curs) +
>  							 xe_walk->dma_offset,
>  							 xe_walk->vma,
>  							 pat_index, level);
> -			if (!is_null)
> +			if (!is_null && !is_purged)
>  				pte |= is_vram ? xe_walk->default_vram_pte :
>  					xe_walk->default_system_pte;
>  
> @@ -570,7 +576,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  		if (unlikely(ret))
>  			return ret;
>  
> -		if (!is_null && !xe_walk->clear_pt)
> +		if (!is_null && !is_purged && !xe_walk->clear_pt)
>  			xe_res_next(curs, next - addr);
>  		xe_walk->va_curs_start = next;
>  		xe_walk->vma->gpuva.flags |= (XE_VMA_PTE_4K << level);
> @@ -723,6 +729,26 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  	};
>  	struct xe_pt *pt = vm->pt_root[tile->id];
>  	int ret;
> +	bool is_purged = false;
> +
> +	/*
> +	 * Check if BO is purged:
> +	 * - Scratch VMs: Use scratch PTEs (XE_PTE_NULL) for safe zero reads
> +	 * - Non-scratch VMs: Clear PTEs to zero (non-present) to avoid mapping to phys addr 0
> +	 *
> +	 * For non-scratch VMs, we force clear_pt=true so leaf PTEs become completely
> +	 * zero instead of creating a PRESENT mapping to physical address 0.
> +	 */
> +	if (bo && xe_bo_is_purged(bo)) {
> +		is_purged = true;
> +
> +		/*
> +		 * For non-scratch VMs, a NULL rebind should use zero PTEs
> +		 * (non-present), not a present PTE to phys 0.
> +		 */
> +		if (!xe_vm_has_scratch(vm))
> +			xe_walk.clear_pt = true;
> +	}
>  
>  	if (range) {
>  		/* Move this entire thing to xe_svm.c? */
> @@ -762,7 +788,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  	if (!range)
>  		xe_bo_assert_held(bo);
>  
> -	if (!xe_vma_is_null(vma) && !range) {
> +	if (!xe_vma_is_null(vma) && !range && !is_purged) {
>  		if (xe_vma_is_userptr(vma))
>  			xe_res_first_dma(to_userptr_vma(vma)->userptr.pages.dma_addr, 0,
>  					 xe_vma_size(vma), &curs);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 10d77666a425..d03e69524369 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1336,6 +1336,9 @@ static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
>  static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
>  			       u16 pat_index, u32 pt_level)
>  {
> +	struct xe_bo *bo = xe_vma_bo(vma);
> +	struct xe_vm *vm = xe_vma_vm(vma);
> +
>  	pte |= XE_PAGE_PRESENT;
>  
>  	if (likely(!xe_vma_read_only(vma)))
> @@ -1344,7 +1347,13 @@ static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
>  	pte |= pte_encode_pat_index(pat_index, pt_level);
>  	pte |= pte_encode_ps(pt_level);
>  
> -	if (unlikely(xe_vma_is_null(vma)))
> +	/*
> +	 * NULL PTEs redirect to scratch page (return zeros on read).
> +	 * Set for: 1) explicit null VMAs, 2) purged BOs on scratch VMs.
> +	 * Never set NULL flag without scratch page - causes undefined behavior.
> +	 */
> +	if (unlikely(xe_vma_is_null(vma) ||
> +		     (bo && xe_bo_is_purged(bo) && xe_vm_has_scratch(vm))))
>  		pte |= XE_PTE_NULL;
>  
>  	return pte;
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index cad3cf627c3f..3ba851e0b870 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -158,6 +158,60 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>  	}
>  }
>  
> +/*
> + * Handle purgeable buffer object advice for DONTNEED/WILLNEED/PURGED.
> + * Updates op->purge_state_val.retained to indicate if backing store
> + * exists (matches i915's retained).
> + */
> +static void xe_vm_madvise_purgeable_bo(struct xe_device *xe, struct xe_vm *vm,
> +				       struct xe_vma **vmas, int num_vmas,
> +				       struct drm_xe_madvise *op)
> +{
> +	bool has_purged_bo = false;
> +	int i;
> +
> +	xe_assert(vm->xe, op->type == DRM_XE_VMA_ATTR_PURGEABLE_STATE);
> +
> +	for (i = 0; i < num_vmas; i++) {
> +		struct xe_bo *bo = xe_vma_bo(vmas[i]);
> +
> +		if (!bo)
> +			continue;
> +
> +		/* BO must be locked before modifying madv state */
> +		dma_resv_assert_held(bo->ttm.base.resv);
> +
> +		/*
> +		 * Once purged, always purged. Cannot transition back to WILLNEED.
> +		 * This matches i915 semantics where purged BOs are permanently invalid.
> +		 */
> +		if (xe_bo_is_purged(bo)) {
> +			has_purged_bo = true;
> +			continue;
> +		}
> +
> +		switch (op->purge_state_val.val) {
> +		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
> +			atomic_set(&bo->madv_purgeable, XE_MADV_PURGEABLE_WILLNEED);
> +			break;
> +		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
> +			if (!xe_bo_is_shared_locked(bo))
> +				atomic_set(&bo->madv_purgeable, XE_MADV_PURGEABLE_DONTNEED);
> +			break;
> +		default:
> +			drm_warn(&vm->xe->drm, "Invalid madvice value = %d\n",
> +				 op->purge_state_val.val);
> +			return;
> +		}
> +	}
> +
> +	/*
> +	 * Set retained flag to indicate if backing store still exists.
> +	 * Matches i915: retained = 1 if not purged, 0 if purged.
> +	 */
> +	op->purge_state_val.retained = !has_purged_bo;
> +}
> +
>  typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
>  			     struct xe_vma **vmas, int num_vmas,
>  			     struct drm_xe_madvise *op);
> @@ -283,6 +337,19 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
>  			return false;
>  		break;
>  	}
> +	case DRM_XE_VMA_ATTR_PURGEABLE_STATE:
> +	{
> +		u32 val = args->purge_state_val.val;
> +
> +		if (XE_IOCTL_DBG(xe, !((val == DRM_XE_VMA_PURGEABLE_STATE_WILLNEED) ||
> +				       (val == DRM_XE_VMA_PURGEABLE_STATE_DONTNEED))))
> +			return false;
> +
> +		if (XE_IOCTL_DBG(xe, args->purge_state_val.reserved))
> +			return false;
> +
> +		break;
> +	}
>  	default:
>  		if (XE_IOCTL_DBG(xe, 1))
>  			return false;
> @@ -402,6 +469,12 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>  					goto err_fini;
>  			}
>  		}
> +		if (args->type == DRM_XE_VMA_ATTR_PURGEABLE_STATE) {
> +			xe_vm_madvise_purgeable_bo(xe, vm, madvise_range.vmas,
> +						   madvise_range.num_vmas, args);
> +			goto err_fini;
> +
> +		}
>  	}
>  
>  	if (madvise_range.has_svm_userptr_vmas) {
> -- 
> 2.43.0
> 
