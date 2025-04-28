Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0210C369D5
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 18:13:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6522F10E67B;
	Mon, 28 Apr 2025 18:13:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dYjIRzWH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E18A10E67B
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Apr 2025 18:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745863983; x=1777399983;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=A6cMmHdF2zmmc4MXwn6lCS7tTI+IXPquVPs+1ag/Liw=;
 b=dYjIRzWH5peG8UFX20+FzwNXDp9S7cJcsQ27lO0uwMbGEk8LA+fk9fDL
 W+Du+dj5WV0EB0PA0r/F6W6OoNUwgFLwUX1iJuCf6rSJr3n0Eg3oYO4WG
 HAVhEfzfNP+L6r4QHgZzw8Z5Tm/Cr5KlM/lkQvGxGfJmYz9ibSRl5oRik
 P0+CH+8pZeWWuCt0RhO7zrGaCmV3ljI+AOayUGJbFdEIYJHlKirjadGE3
 sW/9Zgvgmx+atG8hvo18+u8gQL7Zpwfq+3xj1soXmTpk4H/fRTvncjht5
 K9jtGNeYW3o5UFspNxyNRNGR7MxFydfg7tpXmNThERr26Zj2QtfPqbHxL Q==;
X-CSE-ConnectionGUID: howy34ZgTsyT8/h2klZsqQ==
X-CSE-MsgGUID: pHCKdUVuTcSo95zP01fjjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="57667916"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; d="scan'208";a="57667916"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 11:13:02 -0700
X-CSE-ConnectionGUID: 7Bjjsh75Sk+3puCSkOZJ9w==
X-CSE-MsgGUID: v5QbH/7RRuqO7kBkexl2cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; d="scan'208";a="133493722"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 11:13:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 11:13:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 28 Apr 2025 11:13:01 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 28 Apr 2025 11:13:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uaCj2l5qXg/bfYjv2mKmSLqNMwCFX3UYx2hHY0aQ4pV9yqEepXWMDeGdQqMc6pW5boOB2Pv2I1ikPdHERLAW7BUm+T95jrliITx1GrAiweCMWFbqGNNcXY8TnBQ8twG1Okrpa7xvO/9C1sfpXqZKD2j5/xA7mt2BhLKxr4is2hPsRBGuJSyXRuEIdwMM5k2pfsLgXe01Ts2H4eyfzeM5/2bECLRoJNCxssLWXLNl8lr0/5M/sVeiWDGSktVuImtZrPLaXDtE0+UItHVXCFy0hMPfFNjC8oc2BIEZRMFpi61fB/6ymLm2jA+2UJ2iEpAkratwQVQzkCrjUh7A1gATqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpdma7JplMUloz6Tqks7Q1nXYtFRxyJqA2iIHoC/gxs=;
 b=lkwUjPNTL4TO4i5q+YvqnYXS58J7F8e2Bx2d7BMXNoP/BX7dHXZ17vbJaLxPH3DgRx/kgczUXfKTjZc1/u8jMQz89wOwidvPbjqwhAA6/P38SjKiEuVKjLo1yvhaG3hFdPGBrfmIu1o50z1Pjgm5DaDZH84odIxCgI59T/go5oam/DnanKV5/O+YwykXOWVecdzA88aC0XkzTZLhpK5XX6nf8dNyZMj8gbtrks4RPC3XZAI37llKS6iTVuALUnVXBt+C3HnHNRRafsFzJeus4Z+uVRZ4Yz3ZMTSC5JeSQIViP4KNyg2EWrb7SpdFzCXfBS4Qm7wIGn/zrTWlMb6POA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV8PR11MB8770.namprd11.prod.outlook.com (2603:10b6:408:202::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Mon, 28 Apr
 2025 18:12:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 18:12:52 +0000
Date: Mon, 28 Apr 2025 11:14:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 11/18] drm/xe/vm: Update xe_vma_ops_incr_pt_update_ops
 to take an increment value
Message-ID: <aA/Fdnyl6sMdw0Nf@lstrano-desk.jf.intel.com>
References: <20250428103224.69534-1-himal.prasad.ghimiray@intel.com>
 <20250428103224.69534-12-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250428103224.69534-12-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BY3PR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:a03:217::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV8PR11MB8770:EE_
X-MS-Office365-Filtering-Correlation-Id: 3383282a-b4ac-4957-a20a-08dd86804a7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/DDfh4B63E54qZNPZfZ5yIYXzx0bvmK/Xt6dM4pQo5Y/D/QNQgDEQ/cKy4rO?=
 =?us-ascii?Q?HHVb9tERUvkxFOxEgF9ZQj98xewFb3HqlMD7UIngTNjSmzd+oW/hypEHMe0f?=
 =?us-ascii?Q?34GwCkQsuxa5vom9ppHex9n+quA0f816XZtXFW+4WkFIsrQkNvBHbf1XsXvD?=
 =?us-ascii?Q?4NC4ZLLj9cpMAqwZX7Fnq8p0cA2czzdbNV0xS2g2ffkC/WUrJH1nG1SkGQc/?=
 =?us-ascii?Q?fuz3+3iMox1zKu8B9CIVktBMBhlaoS6OustioYpTtdkR6TMLMHUIHjmNhfdP?=
 =?us-ascii?Q?uCkWWeBoox5Vffq0N4EOqPJzU4HNFI4aqS39KutALsDkT2ceFxk6DQF655ct?=
 =?us-ascii?Q?z47Ur+aWRyNZN0EElEIDBg3cxQ6yYrco/+c48pr8wNgp16mKbjujsR9RxwkC?=
 =?us-ascii?Q?kYB91aM4O8dVS2rpudpNkHJFYRsTaiscd3jUrrwCw5f7qXVkZpBvIIAmHtCm?=
 =?us-ascii?Q?qoi/+vWiI0zSy5DsValc3aFVIGr8d/1npHF3QeXWUoV9A+uOcjVqszZkafc6?=
 =?us-ascii?Q?opRP7jZLfUQN6H/TpBOxBhWWQWOrDEmQQ1grTSzdiQ3Cwge5MmgD7PKGOP6c?=
 =?us-ascii?Q?h0b674fMUF8tS45qHUxb9/NjfEXJGQ5C92OVQG9rOD8Xrb6LWzAq00dnpywf?=
 =?us-ascii?Q?04g2wwFRMR84ayMRzXmQhWBm0kDIY7okHhOYepObKtd/IbVskfe9weOLSkUi?=
 =?us-ascii?Q?KOkO5dYQBdEHJ+fQ+lleqRabTuVoGuw4hOerr5sbCsZ45jV2KCGPPGjIx2rB?=
 =?us-ascii?Q?oaowEhAMXN9ewM9dr+/Xxet/WUC+3Il+GY10pjJwRoVDs1IouCz/+InTHD/J?=
 =?us-ascii?Q?yT88WHMdoHJjac2hDSMFJjzTC0L/N4s+xdflFIFDpJBLocNI3ldfkQuZC7hy?=
 =?us-ascii?Q?jJnYLaE4CFzYhq3BINxXQJ8NOrNK2T4OzRw9WvwlVpZ67FV44rAfEZqD7s72?=
 =?us-ascii?Q?Ou8wPVR+6R2DAHgQsJkEgjWtdjk2v5n7tQDPRPSJBWWk1fSqs/h9nf4gxr0G?=
 =?us-ascii?Q?HZTrZw1zN3IsaeKa1UCMVnfQwBuVld5GphiEzmR7pEvwC6oH7jLwmYpkNiBC?=
 =?us-ascii?Q?ZqZqTdXbhZ0TmYSRKvMqfgBRsphz39mdFAJcd7p18IHa+TqFTFEdBBplLsYz?=
 =?us-ascii?Q?h7Tf5mwp7mm0Gs+CNAJkk8WvCjvzPrn4WJwM2+aAeg9BpQSacx8VNtjgch0U?=
 =?us-ascii?Q?1N9/zZehubFjjtRQwfgKYryRvqLgUTE0KF8JUM42JTCLrq3KnkYXcbgOQ2fN?=
 =?us-ascii?Q?bM7DiXoE4DTC4BqY2SuBK7N+tQDjU4INzhDlULK8PsO5bxUh2I6HZit/6UKK?=
 =?us-ascii?Q?vTWtCdpvZm3D42p1RCBFBBB3rWH6fV9U0eUUdjjBQbuawwMoCKw60YA+S58v?=
 =?us-ascii?Q?2TgDmqmFXzMCbHnnqDhHYoAzaSdgcw69hyUwb+W7vk1u1923MBGKC2EACBJh?=
 =?us-ascii?Q?nlpt0ucqBIQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fYBjz9SQ3HvqHkCm0qv/hzRLpRg1cw8ZU1TAHicVa5DwGdGBeAJjPTN0Vb46?=
 =?us-ascii?Q?KvU6Sw0HZkvLWX8R4S7+DwE9VxXylwEmocbE5LeNYZPmTADg+n8Ouu/qAlbI?=
 =?us-ascii?Q?I+SArqZWNNpDh1hztxLsqS1gsfEdVYqiQDWU1CkmKSnXBQfxtatYO2Fy4U0U?=
 =?us-ascii?Q?7KJPpvuJt9J4bg89RWJEFZf/7azp57HFvCdw3v79SqEHbPWsvRdGZmHtzBw3?=
 =?us-ascii?Q?dQD1v2uvJZE1J3AAnZBKdW4x37elVPVKpxVDSB9WYNF6hDw8gISb3i9ZYXJc?=
 =?us-ascii?Q?6BhMMy49Rar1qWOBdZ42PCAusn2UsKILwbRgHGQrgqcc7GK7a0TRHiUQpMV+?=
 =?us-ascii?Q?hVDXdNOI1ckOdNOqMEPZyVugs4R9TXrBtqizwslnV7ud33zTcgfVnNINYo3s?=
 =?us-ascii?Q?DjLTCAbGyGh2b7EzEWTT8kZdOfWZNx4PvOZj/V4JoG/HoRuKGzNd6J7x49pR?=
 =?us-ascii?Q?Zj50ufPGhyuyv3iI1LVHJQs/BsroAPzJfEX2EYSNCht76tTZYw8pwyhPTzi4?=
 =?us-ascii?Q?uLFQn+Wc9YVp+1QL4xqXI2LmklmgRewoQyhCKlgAf3djxmzeld0Q2lDq5WIf?=
 =?us-ascii?Q?rYELlCRQ1JipyKO5grFEygWS8inejyK+AZYcCCTt0Krz20PbnSki8OYbuzS9?=
 =?us-ascii?Q?SajBhEEXFSyFVyWHDtVlxcowxeZxPZkZbqsMweBblntGn/KH+jsKg7p0cHwL?=
 =?us-ascii?Q?7PF8MOr0kR1k9pnfJF4T1rlhlfxfEwysooctBeaIuSmKarBOC/1L6TYkI12Q?=
 =?us-ascii?Q?MIORrb6kc+jFFN60fGvII1LMfUhvC6h1vzlZi+PExNK24SRFc7OFhdDISnr1?=
 =?us-ascii?Q?qQL08YT/+d5xomq4U2smKDiH+3TjwQh2AqFOzSlvF5czlci/Jn3uEZaqiyag?=
 =?us-ascii?Q?2kSyMTSl8TWDIfGer3LIDfw6slCD0ptAMkFYntSFWpCID5uLM/Jmiz2iXpE1?=
 =?us-ascii?Q?YBTfQXNeZAwikO4PYXqfr5y+VmPORcQ+ODk8XvBDrP+V+KfvVwPaFqFQgymH?=
 =?us-ascii?Q?x8znc5PVtFkWsMbS2BxGF52A9zBnzQlygz4njDIpYwcSxbgoLiLRklOIY22B?=
 =?us-ascii?Q?XPx5NJgGQXIwGkqE+PCp3iJjIddImze+b5H0j3FHOM4WZ2rPGZGb3vj/iP2A?=
 =?us-ascii?Q?hJYZZlgiwcQOvXm5kY/pIfrOmHyCK4wc6g8bXhRrQvBYuWmnbDj1hVMysmaI?=
 =?us-ascii?Q?S+3uYJXJRRGV+wwKzra/J6VmB5kD5QyxzIK0v6n8qQCWT2HJx6B3HOQ8LPZg?=
 =?us-ascii?Q?Hf90lTTdmGcwqhp4C6uTFzhx32MpSvKtHfnd9FmlSyBojBin83YZEBe9vYr+?=
 =?us-ascii?Q?FxRkLpLh45p4IZFcXLtet8KwE7nTUI5fLdSI9LJe+FOTrx34zRmybrK0MP7+?=
 =?us-ascii?Q?xFJuKXzQP4qZ1mWWbFModQ9hY8zgrRixiQTYv4vxY29VqM0KK794PUy2USqA?=
 =?us-ascii?Q?ynoBuDMAErwD0h9yw2vhCANbyJlKIO8qoIPtHT4BREC+OFuxeYHmURhKABKu?=
 =?us-ascii?Q?d8dKuGvDqT/+N1pspdyP3cvLsgUB6Jg/IV8gk/Gw9WWCp+g8Q+wOqSBkkJk7?=
 =?us-ascii?Q?Qgk6H8+hUTMhIGOj1gVDcOdNo5IdF5sugF+VF+yQMQxNA+A0Da0IWMqsXYvM?=
 =?us-ascii?Q?MQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3383282a-b4ac-4957-a20a-08dd86804a7f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 18:12:52.2079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nqhkdsVml+gUoatezrwspERvekf8Y1kPVzkSkMfkldG795e220b3E6dbmDmSuaeMmRtH2/jRO4vXOElUfYAPnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8770
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

On Mon, Apr 28, 2025 at 04:02:17PM +0530, Himal Prasad Ghimiray wrote:
> Prefetch for SVM ranges can have more than one operation to increment,
> hence modify the function to accept an increment value as input.
> 
> v2:
>   - Call xe_vma_ops_incr_pt_update_ops only once for REMAP (Matthew Brost)
>   - Add check for 0 ops
> 
> v3:
>   - s/u8/int for inc_val and num_remap_ops (Matthew Brost)
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 28 +++++++++++++++++-----------
>  1 file changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 80e56e232685..2ce91aebf39a 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -806,13 +806,16 @@ static void xe_vma_ops_fini(struct xe_vma_ops *vops)
>  		kfree(vops->pt_update_ops[i].ops);
>  }
>  
> -static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_mask)
> +static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_mask, int inc_val)
>  {
>  	int i;
>  
> +	if (!inc_val)
> +		return;
> +
>  	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
>  		if (BIT(i) & tile_mask)
> -			++vops->pt_update_ops[i].num_ops;
> +			vops->pt_update_ops[i].num_ops += inc_val;
>  }
>  
>  static void xe_vm_populate_rebind(struct xe_vma_op *op, struct xe_vma *vma,
> @@ -842,7 +845,7 @@ static int xe_vm_ops_add_rebind(struct xe_vma_ops *vops, struct xe_vma *vma,
>  
>  	xe_vm_populate_rebind(op, vma, tile_mask);
>  	list_add_tail(&op->link, &vops->list);
> -	xe_vma_ops_incr_pt_update_ops(vops, tile_mask);
> +	xe_vma_ops_incr_pt_update_ops(vops, tile_mask, 1);
>  
>  	return 0;
>  }
> @@ -977,7 +980,7 @@ xe_vm_ops_add_range_rebind(struct xe_vma_ops *vops,
>  
>  	xe_vm_populate_range_rebind(op, vma, range, tile_mask);
>  	list_add_tail(&op->link, &vops->list);
> -	xe_vma_ops_incr_pt_update_ops(vops, tile_mask);
> +	xe_vma_ops_incr_pt_update_ops(vops, tile_mask, 1);
>  
>  	return 0;
>  }
> @@ -1062,7 +1065,7 @@ xe_vm_ops_add_range_unbind(struct xe_vma_ops *vops,
>  
>  	xe_vm_populate_range_unbind(op, range);
>  	list_add_tail(&op->link, &vops->list);
> -	xe_vma_ops_incr_pt_update_ops(vops, range->tile_present);
> +	xe_vma_ops_incr_pt_update_ops(vops, range->tile_present, 1);
>  
>  	return 0;
>  }
> @@ -2493,7 +2496,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  			     !op->map.is_cpu_addr_mirror) ||
>  			    op->map.invalidate_on_bind)
>  				xe_vma_ops_incr_pt_update_ops(vops,
> -							      op->tile_mask);
> +							      op->tile_mask, 1);
>  			break;
>  		}
>  		case DRM_GPUVA_OP_REMAP:
> @@ -2502,6 +2505,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  				gpuva_to_vma(op->base.remap.unmap->va);
>  			bool skip = xe_vma_is_cpu_addr_mirror(old);
>  			u64 start = xe_vma_start(old), end = xe_vma_end(old);
> +			int num_remap_ops = 0;
>  
>  			if (op->base.remap.prev)
>  				start = op->base.remap.prev->va.addr +
> @@ -2554,7 +2558,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  					       (ULL)op->remap.start,
>  					       (ULL)op->remap.range);
>  				} else {
> -					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
> +					num_remap_ops++;
>  				}
>  			}
>  
> @@ -2583,11 +2587,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  					       (ULL)op->remap.start,
>  					       (ULL)op->remap.range);
>  				} else {
> -					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
> +					num_remap_ops++;
>  				}
>  			}
>  			if (!skip)
> -				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
> +				num_remap_ops++;
> +
> +			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, num_remap_ops);
>  			break;
>  		}
>  		case DRM_GPUVA_OP_UNMAP:
> @@ -2599,7 +2605,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  				return -EBUSY;
>  
>  			if (!xe_vma_is_cpu_addr_mirror(vma))
> -				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
> +				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
>  			break;
>  		case DRM_GPUVA_OP_PREFETCH:
>  			vma = gpuva_to_vma(op->base.prefetch.va);
> @@ -2611,7 +2617,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  			}
>  
>  			if (!xe_vma_is_cpu_addr_mirror(vma))
> -				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
> +				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
>  			break;
>  		default:
>  			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> -- 
> 2.34.1
> 
