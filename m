Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F8BD185FE
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 14:35:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C53510E753;
	Thu,  8 Jan 2026 14:35:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TlQ/wBXm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E2F110E752
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 14:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767882931; x=1799418931;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DW5rH1jFfBCLhmB7MAYId44o257OQCCIWec7+85cBVU=;
 b=TlQ/wBXmFi+NmwhXyO5r0rpyCcRI8Or318j/PdI2Hlh1YbPc2q0yphsy
 6cUOTyo4J/H3Zrx5W1OyTrCzteM56TuoTZ0KkwA32XWaKh3lsTjXKy2eN
 8ubybpWSjhfC9vIwaQijFR5MGSGwZuOVqOb15FnGU2Nxx8ZJwWqfzD0NU
 SQOtUN6IsAEa19hubB33caz5mdaD7V/UqroW5YbV9S2hfwpFivKCLv1yF
 V6mUMcEfT46vocCi2717RmsC17UY2uhpHTWCZ9XcpJAXlLFNiqQbeAw6u
 22cJxI0/7JAsc/cFgSrZpz/1gzwZzyksDWGymftG1DPvh8vFNtFCnYuJL A==;
X-CSE-ConnectionGUID: ljgyOZWcQDmQMLtMUDXl6w==
X-CSE-MsgGUID: bnBJfnBzRPSE3CBXRhYEOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="68455566"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="68455566"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 06:35:30 -0800
X-CSE-ConnectionGUID: lAMpu96KRj+o4uwdDXXBmQ==
X-CSE-MsgGUID: pQBntI3aQEyNupSUveX+lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="208059479"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 06:35:31 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 06:35:30 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 06:35:30 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.61) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 06:35:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d7z4dvqxq0ezLEOEemSfiRJPWDkcyv4qs+42yTQIPaLC5QylDO6+a0knnKA2/GcJfBpwDDvTnlX3ahzGkPuQ6M9PRJoLaT420X7PG7uAeK4ifyDTd+faohXUApY/fD4hqzc3C1KMeQQ/FvYvMo4ULhURnaheYPJMA8ZBLZqEFKqzAkv1TlkaEppjk6BIYzoeEe0rD+xFHrRhjx10oHiU+WNFqjZOwkD1RzyfqUXIwehNDbz/GZI6PF8YITDEuKXPkCUMfn4YpFdqKxz7Kxaz4H/qYgH4bZAEw4Ll1n8t3yU7J5bCcOJszYPxiWCQxUN9P+2sisBoAtjuJhgOwyIt7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQ2+9722BwMlLW7MQNQnI3IGSrLFXv2vzOheWoUhqXk=;
 b=YamEMddaWs0TQ9flWXou7uNzF74FoMD9HK4XKV2ad3qcMNUCKgvwwHdG14porOzXAl8fUEbijRtNAim08n0IouEtYHyaTCzPL5Thosm/KfB6DT58rjfY/UqSnKa/9LAApUEWBtSMjqmjSGxnHUhRdzYsFI+rpieHCtgrEpk6LpFn1d+4cZXRb/rXw1XHnYan28PYRWvTwnyqUuzcnUcHF7P9tHjWeu5TPSqil2OjpILXqop970oOHlHRCy02sGR1QH697aSjTKDM3UVVcIzizSAZ/bH0hSGK2xGAfCTrnRngdu4bOCsSamSACp1p36hIQpH7VHGkDBhOFVJeK79w3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA3PR11MB8920.namprd11.prod.outlook.com (2603:10b6:208:578::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 14:35:28 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 14:35:28 +0000
Date: Thu, 8 Jan 2026 09:35:25 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Julia Filipchuk
 <julia.filipchuk@intel.com>
Subject: Re: [PATCH 1/3] drm/xe/gsc: Make GSC FW load optional for newer
 platforms
Message-ID: <aV_ArSsLW8jWUgHI@intel.com>
References: <20260108011340.2562349-5-daniele.ceraolospurio@intel.com>
 <20260108011340.2562349-6-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260108011340.2562349-6-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BYAPR01CA0041.prod.exchangelabs.com (2603:10b6:a03:94::18)
 To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA3PR11MB8920:EE_
X-MS-Office365-Filtering-Correlation-Id: b1fec5f9-9b24-4c88-27da-08de4ec32b1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g/qVpZoX+4t+4DR8ElL3ctTYI2xUW73erv2GudEepV10O+Dok0F7ymJBlHNh?=
 =?us-ascii?Q?E1Hcjaqmt9jQiX4pec+CwF7xXK91mudNwPPdoaqWctnP/hf91+DYLVC/zdmt?=
 =?us-ascii?Q?ErBbsHtVP4j0AxZLkEQWp7c9UsBdxh08+vUa0EpaYnKLnP7qXw+yoo0qYFcJ?=
 =?us-ascii?Q?3veIQtW27VSFFLDU8spi0Ocvz+eOGfrMbawSAK9f810p3eKn0RA/HA/ZfnQ8?=
 =?us-ascii?Q?BunThZS42xd8xqL7T/9DQxw3lcmV9LX8L0Gc8wMz/+XnAlSYRGtgd52vuwkJ?=
 =?us-ascii?Q?SY0KN8bDzyMRmW9slX2nQzaknXI1F8VMU8xc7+PsL/r2zVBvtJVlS6vut+NU?=
 =?us-ascii?Q?8XsZheuZxv88QO3vVlzz3tyYLwUFT7IgrS0+bTCQjzNtx/3NsoB/tJy/o3H6?=
 =?us-ascii?Q?mGL1dV/g2w4Ze80cM/vjFlRLQCz5ATLtgApzgvpEvoKcjug7H4Y8JcdM9UW5?=
 =?us-ascii?Q?+z4R2NgcQ0z8+J8qUY+whWvXX2Qx+DrfXjKjJ8e5ZdV67WjG/9M3X3oMKsA1?=
 =?us-ascii?Q?8M8VHyzkoBDihtRwOyludQFClArlA3QgUKjTBLKw0tCN3DwKXxOAAg1SziTo?=
 =?us-ascii?Q?smSBrvmG188sjqeiR1S9jl5JoDposn7ZOIRJUNvDm8boy+bkF9sx05hGOGFx?=
 =?us-ascii?Q?ij5dOWQXGzlU6X3/n2A1fH8e4VN8jsYEwnXaoodhKzPJFIUXGHEgYtjWyikf?=
 =?us-ascii?Q?74ZddAkmzZgeygEGqHfnxTRHcfxR833qbmmk+jvWMnNwN/yyITJJGxvlEBmq?=
 =?us-ascii?Q?JcNAdDrWXqS4e62MNsX9fzrj3zNsO+Xb7TGcan4iNaAp9g7Uw+LvYHOQwAPG?=
 =?us-ascii?Q?EOm+f4lTIDTVXxhusf/UuupXIRv3arELdpuneIiNaqJz8q+tczn/pAa91aoW?=
 =?us-ascii?Q?nCKxgHw4RBvbOhHIqCwF0P6EYRE8nRn5NzkSLwWtsnw7L6gyhw/DPK879qBB?=
 =?us-ascii?Q?l5BAcluoj5IHzbTJiAfLLTPRXlbZzjnTROPxomgiQn5pn4zmHf08uBOnpOHb?=
 =?us-ascii?Q?Y20UY5g3x6Xnpgu0hWTuA20Yczz5GtzPj/MaT60lRtB0k03EKrlTVOCMjmMS?=
 =?us-ascii?Q?Nr1LaW0P7sGio2GAknEEXvcelklNRy7bybLQtDb/gHUtgwnEnZPdOkVZyhwi?=
 =?us-ascii?Q?q6PUuAGmwsFVpyNnDEe6NEkKXYGrWPRrEE4rnHIShyhiwerisOvuWT/0OxDN?=
 =?us-ascii?Q?+V9Ur23C5Ldu0gxUc3MglpOKTkkyiz2lp4eOsQQ4XlWkAoZHcR+W91tcrZsN?=
 =?us-ascii?Q?AAg1HfLHu3xN9t9AYOv4PQkE5mFS/Yyd8DOlATjejxeMcoAhUpkm8TaVNr6p?=
 =?us-ascii?Q?7VAZ8dOnzI8FQpcLW0TSjbegL83f2PjQkvjwuzQsOspEnDtIh/DNlaKCZc17?=
 =?us-ascii?Q?upSgtahnJ14u+IJmeyQxikV9E+W7nAOB5RZQPZOiwYBcn0Q+1kXuhY++1/yd?=
 =?us-ascii?Q?OHk9Is6gwIDEUUwgPK6v1aXhQJMD2eMc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q9BF8CrK206sb5kwQ2IAAa99cjL5/sFUHuMulI7eLIrb1aHYHpgUouWZjrJ3?=
 =?us-ascii?Q?Gxv0c0AEVKTUGuRCPUX1kDZ5aNprGjK/AZeEAtTxhZAdEyjQCifX7HXc1XqF?=
 =?us-ascii?Q?Ct8STUqOAAakLua9PqsBoVoY2Of4BHhvqzNWI/n5cWu7LuHJ2KkGKjfVwvf0?=
 =?us-ascii?Q?anCrjpb+5/rYVegNmTVNzrntH4a97ncO2z0WxfW2Ix5ui5/dkJwGkBT6R6WL?=
 =?us-ascii?Q?Nt119/CsqWR3FXLZItAA4VjE9nQ7/r+5A/CuILtKhOguwwzE+hUCk81OSwVt?=
 =?us-ascii?Q?S9Lk4TT1aNaaoJgWP5ths3M5Yg8mdhBMLb1DOhLidpAggzzy4W5fZjH3k4YS?=
 =?us-ascii?Q?icNPe3N4O2Oi5dNDIXGRV4UGk2G9Gdmbaimo04o3XrQtu75/PRtUQCKa6R6T?=
 =?us-ascii?Q?7e9OB/XEtiDNMJHEEVwUpXmPKjcMU2mTCu1pF4zhq84SlGmtxaSRIx4LuwPi?=
 =?us-ascii?Q?Ce7D+Ion48+Ab64cns/G1P3DWb9bI9kV1VG7g4f0XTFzhbUL43ocDkrKqhmE?=
 =?us-ascii?Q?UU8ZYckoht83FL76DOB/PRy+UK5GTgVH7LaNIutEeZW29CB7nzZE7iw+hDBe?=
 =?us-ascii?Q?HnExB6an5VasnqUKcxHc2jV4nd1yImmlwLuF6PMQViQbyywuRO5iU5t+hYXP?=
 =?us-ascii?Q?ecULBQUdnY/JVZv4S+Bbt9We2ynC9EvZJu4sESZPVUNTnNcbmeIn3WQew288?=
 =?us-ascii?Q?C+RxXVWpHn/sfGxYDYXG1DFkpdlPo1daTGC/cE6/naUDNWNoTsznbdofd9xG?=
 =?us-ascii?Q?GtpjfbRqPAEi9lI6tRJt72dg3kJ4G3P9+iTMWNPJnipTDlkHkRp/NkjXWEjg?=
 =?us-ascii?Q?AqbIQnBLUI52mp6UI8Pr/0PUpVF9pXCGwyh2NvDwenlDnR7Q/uQbqQeMzQJp?=
 =?us-ascii?Q?L4jIiPW1RTMDJOSwOdy8F7xTql4sCq/pGZXQ+8FrT//9BtfAwOBWMHHykyQj?=
 =?us-ascii?Q?uRMkB2jyHjiTt9zcskTp9JSp6yoLmoJ6sSkXq6TUbHRxEeZBrd6BhLrtenaq?=
 =?us-ascii?Q?XFTI/Phx/NAbPmG7h9GNcv+lI5fogoneaFYYu5fPXyOwssx2g8WZ/thcdrfQ?=
 =?us-ascii?Q?C5zNfQQh++BjeoLoGW8cltJW1JCH5w6b7ehhUx63ziTY5is8JotGFCGComRn?=
 =?us-ascii?Q?dBHGUUs63jy0/rvAGjbt6+8F8dK9XB4m0C7Moxju5Tc7CtdHBIV5rf+HeTom?=
 =?us-ascii?Q?ZTMaKGugfomjkqbbXUtbDBQ1x6kQcA0rowt1SUFLktLZV8rKNGkFoXbXjAzH?=
 =?us-ascii?Q?5T0xmDbKeAN6riR7xehKPGMjZUJ38kCUl85xJHhRyZBOSPFVhSTxxQmxP11O?=
 =?us-ascii?Q?VMSrNRHLU/QY8OVtFqAoe5+yHhgjCmg5Szl7i59y+4iekU6Y6Q6PnqfwK0U2?=
 =?us-ascii?Q?lVcs0YqAwOuxG0OcF18SFbZm92O3/+JNvzOIlZ1aPXSt2BFhl7wW3gG2yYox?=
 =?us-ascii?Q?zoibR9XkJrUPt/aCwyFyfHE8vhgSTk5r9q+AdqJh7VQxQCRJ1IWT6FvE+GOV?=
 =?us-ascii?Q?/ZKMy4qW5YhCur89hKrV/ozPG0BuCU+s1o1be5gYjRDCF7JxJYvDCoavlZ5N?=
 =?us-ascii?Q?vXlokNvTe2Z0d5PuCEkdqwo+q3ZGCoYVCPX7R28PRhV1x6g4vQRaSvn3eeRg?=
 =?us-ascii?Q?2NBMCl4DncCF1DopbQCZ/g0l2cU1Bo3OhSFD4zNK34oF/VexEcFOsMlYRzMF?=
 =?us-ascii?Q?Fadre2iRGcn+vEIRDThkmcX3/kFWpm4lT+8lrqXe3B1AdaF3moJRBoZaVXYU?=
 =?us-ascii?Q?nmLdPuoCKQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1fec5f9-9b24-4c88-27da-08de4ec32b1f
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 14:35:28.4819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IB8VUYIeXVD4KA00a5nlZk9OpelLJlDRgHYGgSCHWpJ2hS44+eBj00ExE0twOhqpTjN5DPC0YdQcEGhvwKR4KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8920
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

On Wed, Jan 07, 2026 at 05:13:42PM -0800, Daniele Ceraolo Spurio wrote:
> On newer platforms GSC FW is only required for content protection
> features, so the core driver features work perfectly fine without it
> (and we did in fact not enable it to start with on PTL). Therefore, we
> can selectively enable the GSC only if the FW is found on disk, without
> failing if it is not found.
> 
> Note that this means that the FW can now be enabled (i.e., we're looking
> for it) but not available (i.e., we haven't found it), so checks on FW
> support should use the latter state to decide whether to go on or not.
> 
> As part of the rework, the message for FW not found has been cleaned up
> to be more readable.
> 
> While at it, drop the comment about xe_uc_fw_init() since the code has
> been reworked and the statement no longer applies.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Julia Filipchuk <julia.filipchuk@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c |  2 +-
>  drivers/gpu/drm/xe/xe_gsc.c              | 13 +++++++------
>  drivers/gpu/drm/xe/xe_uc_fw.c            | 10 +++++++---
>  3 files changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> index 07acae121aa7..ed1f65f5ef4d 100644
> --- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> +++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> @@ -39,7 +39,7 @@ static bool intel_hdcp_gsc_check_status(struct drm_device *drm)
>  	struct xe_gt *gt = tile->media_gt;
>  	struct xe_gsc *gsc = &gt->uc.gsc;
>  
> -	if (!gsc || !xe_uc_fw_is_enabled(&gsc->fw)) {
> +	if (!gsc || !xe_uc_fw_is_available(&gsc->fw)) {
>  		drm_dbg_kms(&xe->drm,

should this be changed to a warn or info?

>  			    "GSC Components not ready for HDCP2.x\n");
>  		return false;
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index a3157b0fe791..8ad27c884f68 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -414,15 +414,16 @@ int xe_gsc_init(struct xe_gsc *gsc)
>  	}
>  
>  	/*
> -	 * Some platforms can have GuC but not GSC. That would cause
> -	 * xe_uc_fw_init(gsc) to return a "not supported" failure code and abort
> -	 * all firmware loading. So check for GSC being enabled before
> -	 * propagating the failure back up. That way the higher level will keep
> -	 * going and load GuC as appropriate.
> +	 * Starting from BMG the GSC is no longer needed for MC6 entry, so the
> +	 * only missing features if the FW is lacking would be the content
> +	 * protection ones. This is acceptable, si we allow the driver load to
> +	 * continue if the GSC FW is missing.
>  	 */
>  	ret = xe_uc_fw_init(&gsc->fw);
>  	if (!xe_uc_fw_is_enabled(&gsc->fw))
>  		return 0;
> +	else if (gt_to_xe(gt)->info.platform >= XE_BATTLEMAGE && !xe_uc_fw_is_available(&gsc->fw))
> +		return 0;
>  	else if (ret)
>  		goto out;
>  
> @@ -614,7 +615,7 @@ void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_printer *p)
>  
>  	drm_printf(p, "\tfound security version %u\n", gsc->security_version);
>  
> -	if (!xe_uc_fw_is_enabled(&gsc->fw))
> +	if (!xe_uc_fw_is_available(&gsc->fw))
>  		return;
>  
>  	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GSC);
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 50458d3bdc7d..b1a9ef3f6195 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -741,7 +741,7 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
>  		return 0;
>  	}
>  
> -	err = request_firmware(&fw, uc_fw->path, dev);
> +	err = firmware_request_nowarn(&fw, uc_fw->path, dev);
>  	if (err)
>  		goto fail;
>  
> @@ -770,8 +770,12 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
>  			       XE_UC_FIRMWARE_MISSING :
>  			       XE_UC_FIRMWARE_ERROR);
>  
> -	xe_gt_notice(gt, "%s firmware %s: fetch failed with error %pe\n",
> -		     xe_uc_fw_type_repr(uc_fw->type), uc_fw->path, ERR_PTR(err));
> +	if (err == -ENOENT)
> +		xe_gt_info(gt, "%s firmware %s not found\n",
> +			   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
> +	else
> +		xe_gt_notice(gt, "%s firmware %s: fetch failed with error %pe\n",

shouldn't this be an warn or error?

> +			     xe_uc_fw_type_repr(uc_fw->type), uc_fw->path, ERR_PTR(err));
>  	xe_gt_info(gt, "%s firmware(s) can be downloaded from %s\n",
>  		   xe_uc_fw_type_repr(uc_fw->type), XE_UC_FIRMWARE_URL);
>  
> -- 
> 2.43.0
> 
