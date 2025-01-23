Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D3AC02182
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 17:37:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422A710E2BB;
	Thu, 23 Jan 2025 17:37:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BHGJGIW3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E8FE10E2BB
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 17:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737653847; x=1769189847;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2DOgB30TCt65rWMddkRvOSl4hMajYYXmSFxsC+CHids=;
 b=BHGJGIW3AW/EzOekY0CpS2vDBKvZU4P+4Mp8QUm2wJ7F65Bt0nj0sNpx
 KPuIpMEdOn9RhiGQIDbw0BJ6kOR/obaas8gVcldsJAIvf4A3JSTRLpVTD
 N7eymlZgpDiRrRccCacbH2+EU6uI/mGt5DQDmSvqjdozoYzkwyA4lr3g+
 9QotwZnzbxHS/fb/PsOojMj9LfF9cm9FBJAJR5Jcos0loM3SUflhJF6oC
 J/YoO6xfPHzc2Qw7sjUUBjPbQQuz1qOR3KxHXdD24vyOCULuA5ec/BTgM
 QZb0WeJrZGS5qPzyubVQbOE7DkGeTFtwcLomsujUB0UYNEjgIKiMxmNH8 Q==;
X-CSE-ConnectionGUID: CctKWtv4SSahKyWO+LqpCQ==
X-CSE-MsgGUID: OTODjhP3Si6TpcboW25pCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38420793"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; d="scan'208";a="38420793"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 09:37:27 -0800
X-CSE-ConnectionGUID: yBSZsGFRTYmH35K+uQNbEw==
X-CSE-MsgGUID: rGF4lvdxTQu5u4TDFuIGQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; d="scan'208";a="108130558"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2025 09:37:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 09:37:26 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 09:37:26 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 09:37:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NilHLNUx7eOUvtMkqkZdHvG0KljWdrW3VmfW8dSURQwXIfCvSZ2k3wxGKQT97zQ16TxTHhFAPkSm5U3RTSsVlwaawMw1obaEa7isKEoD5Cm2krurhACSQEd3PVwr4HbBn58OzcO+ctFaOH388Av9ingkz/4dGlIlQaz3aoHpaa2Mk2oUwOwmSrNcbZgzLdJMNCkn71yQViO1vcitDTwBfRjDDQJ0RavjBzpRmgEPKpYXMqYTvFe3g/B4rZtsJobIBNybS6ojDOvuwI1DVcUKKiE6HHDBztgZlcKpq8gu0PKilsg9Ne0AwS1ETnDMKWU9upRc6V8VKcRb7+5+nKDGlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NeFCv0K3ih86AT8YRWIweq2VHyb/Ur6GBngsLnJyBn0=;
 b=OpCBXOU/UdaEGrWGgWxbremvcocrDXNANuTVKY5444E0XjdeiHzZaAB2ndAb0+tLLjUawRzpT9Cs5GzxRnhXP5CQJxepQ/bohenC9ri2XlV+IPBaf3JmB9wTVBC10SqikBeTsw5IMhY+bX+qBDn1dnZjPiNya67RJlLvRdUm1Ep3LbvZ/Ml0vUISqmbi8ySJ8B5sRcxZFWxBlhOKSYp3JGO3nOj+n32nDfB14CAxDayRB1rytp0cZgrIyivzGveillb+Gwx4Uzlpe14f1/5uGE/10qZT0dCp19lPF/JnYfBLUVYCewqKVxzSX1pqgY/jJWg005Nv1xGP+AqzPRa3mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB7144.namprd11.prod.outlook.com (2603:10b6:510:22c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Thu, 23 Jan
 2025 17:37:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 17:37:24 +0000
Date: Thu, 23 Jan 2025 09:38:18 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <jose.souza@intel.com>, <lionel.g.landwerlin@intel.com>,
 <carlos.santa@intel.com>, <rodrigo.vivi@intel.com>
Subject: Re: [RFC PATCH 1/6] drm/xe: Add properties line to VM snapshot capture
Message-ID: <Z5J+ivqDFyI9T2c4@lstrano-desk.jf.intel.com>
References: <20250123011513.362430-1-matthew.brost@intel.com>
 <20250123011513.362430-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250123011513.362430-2-matthew.brost@intel.com>
X-ClientProxiedBy: MW3PR06CA0021.namprd06.prod.outlook.com
 (2603:10b6:303:2a::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB7144:EE_
X-MS-Office365-Filtering-Correlation-Id: 1236f11d-64e3-401a-a67b-08dd3bd498d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?VILCoC74qmpet1qJQloMgD1QBPITpl5erlMzk4RLSrtu8BvpvCU+5AUEH9?=
 =?iso-8859-1?Q?LkbQi1Su9j4572DUqgPJk0i//NFiNUYedkYFmgYE7bDub3I+Rxb4W3Pjig?=
 =?iso-8859-1?Q?FxUse/EIC1YNHM9GZKk02Yt2G0FpDZpSJt3W8nJkHDRVai+R9xFhTDB6H0?=
 =?iso-8859-1?Q?oSxxTb7Rt7nccZTCZ6FO43yBugJKrx84fTRU1RDCF0+GJnWHCU1dHLzzLL?=
 =?iso-8859-1?Q?0qgPlrSnW9s+CzN1Qw7TQLKA3Xztg2hNmOoHPd+P+ZE0wRP7PBjayxzscg?=
 =?iso-8859-1?Q?FxgVCtcjNJgHtkjwc+y+MkzKbDCLXhv0Jaj/0kI/2Ge7OkIinjUhI/MkKu?=
 =?iso-8859-1?Q?AHUCAUqzkTJ3Smi7uUoewmZCyOCE098dsydwxrcmFwPGNFVHaI3pAssnXo?=
 =?iso-8859-1?Q?2w9B4Lc70D48lizQxvnEe7wXc3m6qfN6I/ANpSp6/+XoHN3NBx0Gu8txKs?=
 =?iso-8859-1?Q?v0sNW+efKmxzdrozuzQ1TOsLQyITb/3Ca3WS812HSupJuh9c+DRtgPVa34?=
 =?iso-8859-1?Q?1HuGcnaSrXg5dw3RUjqYkISoabk3X221lrd+uGMkdpftLF10epsK+mCydr?=
 =?iso-8859-1?Q?w0ZbjCXs6VJmt7LPYLthuccli0oA8kWWtzmqYW05N/xbaWl6kyVI64hLbY?=
 =?iso-8859-1?Q?ZoVe9+jn9P2qEG6GplvilrctjbMwwBIcdGOgtvWWAH5B3/ghZPEOIpQazU?=
 =?iso-8859-1?Q?+H4xPSYSM5ZAkkDovoLh+98blYCG0SiJiDen+BHNroJOSEe8XjDqkpv0xD?=
 =?iso-8859-1?Q?+6TcW0Hllv/cYct9Q2xzhMRIpNG5icI50See0T2PXSSEFG42q1w5kAaWKy?=
 =?iso-8859-1?Q?dFppVjdykETHRjg73rpeOvGZWIxynRNC2ZFuDMDPla+OGo4OFlOMezaMva?=
 =?iso-8859-1?Q?ycX0U0nDqlIGczaL0P+K+3iq/6VmNcEBavZg0BtQOTxkdHK6Xe1NfWcLDA?=
 =?iso-8859-1?Q?G8vhvXVwUDewxZctvt/Tylp8H21tBMtxbNVUh+TvE50KENSyVQXs1GpinZ?=
 =?iso-8859-1?Q?l/j8KMhGGJWifKdCoDImL+o9OE5Q142VOL9FzYCuoVFxujvaWBYQ0K95c1?=
 =?iso-8859-1?Q?8wiE/4YSI/vg2wDkbnKLzIU/veSsL7ItO4onRbmAwUBBtZS7BMlots22ed?=
 =?iso-8859-1?Q?/6rV92uB8gtrELLqnbm8G+4ko9w9LOhdHfgZh1pKfrJwohaxpNXb8ZaTqA?=
 =?iso-8859-1?Q?Wy5i/rHQ2+bMntnTZWNEH2WDguH5tBIJOPgt0NxDhrLgkmwsPcLVoGoxnA?=
 =?iso-8859-1?Q?/EDeNdq2mPGPYOuDxdSH16sb66gG864Jjl6BDKMqa8utW+RJFsENFsL0cV?=
 =?iso-8859-1?Q?nCsdL2VB4wAwtdeeXJh8kLsZzWhGhsCEQ0m/9//770gMQZ4CSqyaFhyRgT?=
 =?iso-8859-1?Q?GDbqk692urJyYNcABkRPv+yujDsh65rydvFzShti2AMI36zzQlIKFSenrm?=
 =?iso-8859-1?Q?DRBsvpWYp/Qe3AWE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2n5Xc7wxwhKhc8MM0IA8465n4AAO/RJnbMcVw9FzZ6HKBZbqGw4VsV4K+i?=
 =?iso-8859-1?Q?fAc1ZrU9BziPfzm5HOJlFIt0SxHOsR15zx0glEyWxYEtLyDOWZELEU08rH?=
 =?iso-8859-1?Q?WVUA2B4xwNkCpChY+L80SwGv1CEmTOsQI45CMLj64Qatrj8pKF5PakANS2?=
 =?iso-8859-1?Q?5XO3uN5B9iEHR13WJdtgQn013G678IDSg6gKUM96t9nFsQxV39rKhaL0Wz?=
 =?iso-8859-1?Q?qXqBMosafszWg4SzMK6/VQxbhMxuOoLeuwep8f2bdLuiPZNwm41sE9OqCM?=
 =?iso-8859-1?Q?CRORa4g6p7TRQqzd0o78o6v1KxBbpt7V+0kCT7E0zp3NhJoCloyeJm0S9q?=
 =?iso-8859-1?Q?2ZETfi88sNNmxRugVUmpSUhFGg04lBIYCBMg+VTMVPt+zleaBx3exGeEfO?=
 =?iso-8859-1?Q?q9Xdh2ad9OLCHG13mqYNMQwX+UggjfBs1stwfKzfVoR/gvFfIL1MT3DRbr?=
 =?iso-8859-1?Q?SjjtSRSdLHVjDgH+1WWbopBWoDsCiZprMf9AyukrO++YrVYmjfUPRbm2ZC?=
 =?iso-8859-1?Q?os58B16HoriwFxvifeTfweZRtOM4wWbpbdRB6iPEZ+qq0nX5jvOAs2Gbhj?=
 =?iso-8859-1?Q?ncnLkoFTPm5H3Pjy6xJGd6GSO5uSnsBp9JWbmi3+5zSnwzWfgY1kmEjTdk?=
 =?iso-8859-1?Q?fvRKCwJvv5iwslqKBAk32meutEHkjHbG8DT5qElb4H2eEcAHqSWH0wv+yZ?=
 =?iso-8859-1?Q?mtEF0UQaNw5MYrVTaTVgCB3adwFL5XXw5xEfMDePB5Cx7jze3H3cw2sfzv?=
 =?iso-8859-1?Q?PouilnKyrOeMdphldIDfdl8+dFpqHKhPOoH4r8HMt5p/Y7ffFRMy1mVXMp?=
 =?iso-8859-1?Q?YVVU/9Fuu0p09GK1x9rPR+m57EeEZmfslnuAQP4PPIjCeA/NzRdce8rPAg?=
 =?iso-8859-1?Q?blYLWPV7FhD0J/5Y3HY/G6z2YDaLyH3HUn2EnWAMhO+jUskTNvvERMg7al?=
 =?iso-8859-1?Q?As0vnJWPILIm0xskC2Sfy58rW8dxL+7pXykXgEzX18huEMu2lrbvavXiHA?=
 =?iso-8859-1?Q?zzE8kba0E3+uzRqvw8xivYHKtIuJQKy4xHNIcIm+un79M0FKf4OaRhBICG?=
 =?iso-8859-1?Q?1VmUborXvahLmELqRfGYQbMduPAEElFZhpLgwmlAwMsHLYhJDygvbm+LHt?=
 =?iso-8859-1?Q?lvKIJ+1t2zgo0FPwT2iA7nG3LyEuMbB8dYYYESo1uHWFZ4Sxcfk787wYRY?=
 =?iso-8859-1?Q?tkcZdzkgsl7Hh9p0SkFM6/XnVaTmNrkSBJadH0oIK+M2tRCnsYC6Sqo6m1?=
 =?iso-8859-1?Q?wAfaqsJfqeDp0zzIHI0McE2n6A2ta0jRGB7ya52ZwPz7juOxjVPiFvwVCv?=
 =?iso-8859-1?Q?DnFmM+dI2U1ItPs25AaWROBow0plz31rFUIIrXa7KnNuTSAJ45v4aXoLwW?=
 =?iso-8859-1?Q?Cb8oS15Lvl1WBAa5/foZ6agWD88DRGix9ZbmwAD6NZ38fGHMVxcS70lzph?=
 =?iso-8859-1?Q?hryi/Wnrn6lHoChuOleWNST7dL8xVN5qW2Y8q1yuVAIy9x8xUgoqHVNXrX?=
 =?iso-8859-1?Q?+6uWEf+0ZP+W+DauFhBTk7bUFnKDv/cH/rVD48rn6XRHz/JYijyQ9J9mnF?=
 =?iso-8859-1?Q?PT3cjB1XPl/7HBMi/njklfGRt9yKkc7l0K7d3r6h1V8rcmV1VyhPVjQT82?=
 =?iso-8859-1?Q?BxCHKXK4jxRB9j5ePc09OacmhuOGiPCCMD01eK6hKYJcwFcHnvtVWwAw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1236f11d-64e3-401a-a67b-08dd3bd498d7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 17:37:24.1773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hx6yfHdn+yGBOZXQeGmQvXDgLbRKizWooX1XFAPXG7GDSz4wqnXGqHyZChB9x+HVsXqKtXqazL8epTsimtHD1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7144
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

On Wed, Jan 22, 2025 at 05:15:08PM -0800, Matthew Brost wrote:
> Add properties line to VM snapshot capture which includes additional
> information about VMA being dumped. This is helpful for debug purposes
> but also to build a robust GPU hang replay tool.
> 
> The current format is:
> 
> [<vma address>]: <permissions>|<type>
> 

Typo.

s/[<vma address>]:/[<vma address>].properties:/

Also exists in the next few patches commit messages too. Will fix in
rev.

Matt

> Permissions has two options, either "read_only" or "read_write".
> 
> Type has two options, either "userptr" or "bo".
> 
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 690330352d4c..5f9651a4c364 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3240,6 +3240,9 @@ struct xe_vm_snapshot {
>  	struct {
>  		u64 ofs, bo_ofs;
>  		unsigned long len;
> +#define XE_VM_SNAP_FLAG_USERPTR		BIT(0)
> +#define XE_VM_SNAP_FLAG_READ_ONLY	BIT(1)
> +		unsigned long flags;
>  		struct xe_bo *bo;
>  		void *data;
>  		struct mm_struct *mm;
> @@ -3280,6 +3283,8 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
>  
>  		snap->snap[i].ofs = xe_vma_start(vma);
>  		snap->snap[i].len = xe_vma_size(vma);
> +		snap->snap[i].flags = xe_vma_read_only(vma) ?
> +			XE_VM_SNAP_FLAG_READ_ONLY : 0;
>  		if (bo) {
>  			snap->snap[i].bo = xe_bo_get(bo);
>  			snap->snap[i].bo_ofs = xe_vma_bo_offset(vma);
> @@ -3293,6 +3298,7 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
>  				snap->snap[i].data = ERR_PTR(-EFAULT);
>  
>  			snap->snap[i].bo_ofs = xe_vma_userptr(vma);
> +			snap->snap[i].flags |= XE_VM_SNAP_FLAG_USERPTR;
>  		} else {
>  			snap->snap[i].data = ERR_PTR(-ENOENT);
>  		}
> @@ -3362,6 +3368,12 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
>  	for (i = 0; i < snap->num_snaps; i++) {
>  		drm_printf(p, "[%llx].length: 0x%lx\n", snap->snap[i].ofs, snap->snap[i].len);
>  
> +		drm_printf(p, "[%llx].properties: %s|%s\n", snap->snap[i].ofs,
> +			   snap->snap[i].flags & XE_VM_SNAP_FLAG_READ_ONLY ?
> +			   "read_only" : "read_write",
> +			   snap->snap[i].flags & XE_VM_SNAP_FLAG_USERPTR ?
> +			   "userptr" : "bo");
> +
>  		if (IS_ERR(snap->snap[i].data)) {
>  			drm_printf(p, "[%llx].error: %li\n", snap->snap[i].ofs,
>  				   PTR_ERR(snap->snap[i].data));
> -- 
> 2.34.1
> 
