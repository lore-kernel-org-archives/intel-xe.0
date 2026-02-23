Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC96E98DF2
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 07:13:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F55A10E24F;
	Mon, 23 Feb 2026 07:13:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kn28A+9o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3677B10E24F
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 07:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771830832; x=1803366832;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ug0AmOzT2T4C+vfEc1jEUeVhglvVLf7alSisa6rGT5w=;
 b=Kn28A+9oOAzAmFks1DFL2HDifePJhwXnTJu7n+S4MwNU9YidBMQExaE8
 kFsLZvLrF2tjY/vzi+fUNG9gwvbw6jJ76Fx+DA5b98lX86Uq46iJGrABc
 Ec2K4vsfJ1JcE5pehl3XJNfRjBj04N7YxZPmVcMfYyT8IHuSwGZ7HZMBo
 SCAENC/ADBG1hknk7MwHYkYxb/lZG0BSws6O/0mgKg514MERUd2f2VuOC
 wXKTo+oTZBWWWshZSHV49oWjpTtb0GAthttmOAQLwEnbkNBbBns4VYxRx
 ANLq3iiMpmP/IREXhVEc5nF2C1ci9udllioR6EKgqzvioz2DbIMhfdSyv w==;
X-CSE-ConnectionGUID: 8CD2O0MERj+10Jj2sqgdYg==
X-CSE-MsgGUID: dPlmDhwQRkSbz0YhEHzuMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="76680886"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="76680886"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 23:13:52 -0800
X-CSE-ConnectionGUID: XQTUTOJ2SgSy2T596wRrNA==
X-CSE-MsgGUID: C55pI+DRQ1S6mbPsuHcAAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="246069373"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 23:13:52 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 23:13:51 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 22 Feb 2026 23:13:51 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.36) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 23:13:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rxqA2DIBwyP4FxyfqqHOEuYlC2JFQYwXCjLsKyh/HsXyeZPLAUWEdwEPc1uWQBbWVNH7hicjS2DHgZ/RU9isqfT04iGNZxQ0iFwW3ugypARYy7Tt7B3JE7UAg3OYDDkCc3TklhVsGe7L2dtc2fBFthV4rbjYVJvjBGZhFHzAi0tetdDwn7IaYHDspSrlh6lEyF/Lx9c6LxlShJE543ATX+jfqvtOR2WwmUmg04hb3HJgSeanCtwfiYPaD8I3aZmyqgcruFjuJy1ycB/avnfIkRNOxL1U1vCW/11HukqQXYWSHL5anLR9jQbg68+m5O9LOSr946u8YzRrgrPw1CfUdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OeSfN84pzx6rN4RQ7MOZMJc/kBTeQg6pNWGHP/eTKdo=;
 b=hkwMhhede3xBk1IPJ0uqyhAgQqBOpZQYKdwnLahf9VCekBn2y5U0JyZSqy6sOnGoDojsBK/3Bim/zMSE9eLiQXsXQcqJAAeNNBc/RWgHgy4Ga7VhjjWYadMnPp0IEkxnNe/3uWoqwqTNPbbZsxwymxqFq51uhg/d+SAXEcYOIAYwJgAFIriC3/u1o7BNCXFVSZxgLe7alNCJaNYoN6QWcQRLlNAS6K5MbwN463d+Z4LAvrd9dLHLfAL9wp2IzX2cgloz87yMppcmj8XzsHhedW0DZVPMkNQ7f+JjSgi0hYT3AYjpopRxKwPrFdpugyZeElGpv4w5uEDBcKugk64TZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB6985.namprd11.prod.outlook.com (2603:10b6:930:57::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Mon, 23 Feb
 2026 07:13:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 07:13:48 +0000
Date: Sun, 22 Feb 2026 23:13:46 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Varun Gupta <varun.gupta@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] drm/xe: Fix memory leak in xe_vm_madvise_ioctl
Message-ID: <aZv+KodX6rh4+iCp@lstrano-desk.jf.intel.com>
References: <20260223070837.1444335-1-varun.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260223070837.1444335-1-varun.gupta@intel.com>
X-ClientProxiedBy: MW4PR04CA0307.namprd04.prod.outlook.com
 (2603:10b6:303:82::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB6985:EE_
X-MS-Office365-Filtering-Correlation-Id: 135460a2-741a-4e1c-fd7c-08de72ab16fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?t3glk6XqB7D2HgLeIOIaD2m7qgxLje7qIO1OpJDwyTebr0g2qR4aQwCOGhDS?=
 =?us-ascii?Q?VqIf+rSxYP1R/GNMvhy+bwkusCa8F6up9TfYJ/YJXQly/O9Bq9Xug17wTN1G?=
 =?us-ascii?Q?dJVFL++K0syg4j45n0uwzO4/yDIhgIuC5dN9APAv5T2nwMZJdgf6BRZrvUr2?=
 =?us-ascii?Q?NLN2PMcAxiuJgVpzb4927inGCQi7Y4OXLq9s9jfqDZKfOvNKjZwdDaR1uglc?=
 =?us-ascii?Q?6SzSr1fY2gGYuJjiVUmtAeaBjglAo+5DbPk0cWUikLGg9FMt1JJoJ4nbYHxL?=
 =?us-ascii?Q?6iiZl5ojSAUCBClkjJE5mHJijpqvHJ8FehTwjn1t7QVonyt/6/aekQoB6tyx?=
 =?us-ascii?Q?X55ylwP1bCB21nTz2OyiRbQYC/D8SWItnJdG/CMMv0RTILzYBAlmm9bE6uXT?=
 =?us-ascii?Q?1O+lWIRD2ES7d055sfHTYSPNbm+4HCIv7tWoOlUQqgai+RlyxRFN0HMwcLl6?=
 =?us-ascii?Q?6yQaLVl/4rS3GGcP/O0qynUsq9z7IyYIlHMjAv79tB3BrXYX+S+4vPwcePgB?=
 =?us-ascii?Q?PSVpjMIeeCq9hsVmS+DU6u+WXFazRVVIsJ3Fd8UUetURink9X8PPka9AnUAw?=
 =?us-ascii?Q?H4Y+jZdEKE1WIBx0UilDtGp5F1sQzmtbk05FV9YxZQl/MXzk5fIFzFmpbIrR?=
 =?us-ascii?Q?JaoyeXtuPQp4Z4QwW5bLtNNsO6bB7d5Iiw91tVfXRyrsaUoVrJtStRMw8ZkW?=
 =?us-ascii?Q?h7XDaOJRMWx+AQkDY0VpeWACJvtTjZ3AisutcwrJYupJPzO34laUUMYVekpO?=
 =?us-ascii?Q?NHrQwmGriYxwcNuUNzky8eN9gq720dPE9bQ4m1e9751AwwcZd/7MuNDDRjHX?=
 =?us-ascii?Q?SmhWYnm5os9gTmM3RSNFNzwz5UX7iSeHR+WlTHNVbO4g8zOH0nLqR43SuEev?=
 =?us-ascii?Q?Wf81/lzQy/DEfpOKFECO5M8nVBqXHCHL7pRA7M1cbpvGIvxYgDCps7BQ2yI3?=
 =?us-ascii?Q?MnqqqDGPc+/mVPyGp2s2K0jt1b2gOOUtu7S9kiU9OEMI0RC2T10vvWV3qJFO?=
 =?us-ascii?Q?e9gwrGP/PspEJLvq2IwmT0ljpx2NXQT4qWt3p9ie9fxnqYGFIGw+oOXb0cOn?=
 =?us-ascii?Q?GC07aTwygswmDB3r1tjni7UcMMdGxzxQFR08Hg9rs6/wgRfLumlU8nbvT11S?=
 =?us-ascii?Q?8sWiXSxFYQ/RWOUDj70rb7rtopmvN5CzQznsdAfuhmwQ+Xl8lg/gMrZ4W85p?=
 =?us-ascii?Q?ci5H3dTY5gigIlGwWMoVQLB0CC+iKZnfIfJG8eKulbEabmJ8yrZxpm5iP489?=
 =?us-ascii?Q?80KxRD6rntNSUxg70fLTRgkeZwPbP9gMq+QJY2Oiynm7VlBkXypoRDRdTTDW?=
 =?us-ascii?Q?ngIZ3jVetBQKE+jZxY3X6ubn7peGgg+eQytXacGAUqGdtBeNLBD5SnkzDDO7?=
 =?us-ascii?Q?CTwLtxLdgqRHDX7+0zAl549U27fHS9NFwSzg1q/pY+EBas+C7lixJJ/ixQcu?=
 =?us-ascii?Q?VFl/eegukWg73e670vUSh0yMFkMcFXAds9o+D6PITMbwj0obMhpQUoHDhblw?=
 =?us-ascii?Q?YkkNNYMNvhytAdhhtzAztXbvucKz/33dsK4yo5TJPv4r8jkfxgnabuExKq8t?=
 =?us-ascii?Q?+tuLnu5Y/9fmWSaq0eg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/opLGU+GsH/y0VWMAzSOJVqU0DP6E1scFpI0Ppcou4MjeHLrKPCJuXz7BT87?=
 =?us-ascii?Q?s41kIIdu++jH0GgKhkxb2HzRCj1v8OIX6oFzux0xW0qnfUeEeO4l19N+yAer?=
 =?us-ascii?Q?w0qxR/FS8lrNJsKw6jVpUy5BmfOXzScDlOK9jHTUny4CI1XPG6w30PF8UkWm?=
 =?us-ascii?Q?XzupFY3WLnhVWt/9PQ5lSeSBotdoxxOT/oX7ey7aiCcRfQq0VeHHVrDCiw9s?=
 =?us-ascii?Q?PpBo5J49aSfpM5VSvpdeG4mkJ6kLoKnDuqj6Uw+rYBoagkuaRh6b3BZqv9v+?=
 =?us-ascii?Q?JPTN55NZaca29cRoNTuqnwFLFVrO+oguOwGZftgvv5oEaHgx52jFex4syPq6?=
 =?us-ascii?Q?cM6GIZFz+AvvXgPjndz7qleJG3DhbgHUlffSOhbmwwEGHLok8LnlHFgy/PGw?=
 =?us-ascii?Q?z5h80r1QFfyfpsxR8oP/ALCUcnz9xvM/WtbGipaD833dPtrNK8pS7gaHQwxd?=
 =?us-ascii?Q?FbsjhekTRmhILwDNG8VP+ElI3bmact/zeIHi9EvpzaDtj7/1X0+l9o/qxXj/?=
 =?us-ascii?Q?Plz5KLpXdXQdsKZyvzX72N4dOfV3uSnCTjzY0EfBtILx79sc84qH+CijnBv2?=
 =?us-ascii?Q?6BFO9HqMr/6halAJX7JIndp2dkcG900LnjLwvfoYeRJpM86a3YVsj23P6ylH?=
 =?us-ascii?Q?N5UdtcpCvLx7EqBKSv2/pT5vOm+xTSHs5nuy/DOE7ua4CPCksF3/AAWvk6dF?=
 =?us-ascii?Q?MtZ5HW83B8IIJgE3zdDuvblPuLqEjKpQBQEmMlJoXcipRcVmJmds3EzD5lIP?=
 =?us-ascii?Q?/V4tjGPq56aOtjODCujFDTniQz0dLiV9z3mEoTxcMpQ1S7t1zH+8AjCYFNq/?=
 =?us-ascii?Q?CyW8snPu7b3WcPy0Zxt9DXeO9hMIfhTqzPlMYCH9bL/Z3EOMr7Srg4GYJIP1?=
 =?us-ascii?Q?bYpaJi2hJsgQ6i74afGIiBpN2B1bqSwrHli4XgGJoOtTbqMVHvzT/OkJm5uL?=
 =?us-ascii?Q?EiccKmacvDB0on2wCwQQ6s0GYWxflUP2mVXldcWPOoc1mqnaSz1GKvA2BdeU?=
 =?us-ascii?Q?e/5uZMrElaDVkq2weWMtTfzJ6T+dAIIFIFGOGop6/EnxPrrkcsjl5NP0Oq0s?=
 =?us-ascii?Q?1u+yE9uzwlP4sT9rMgG3c1hpcTyRPWe1y3kxf8QP3wKm24g97Ya2dZiBXs25?=
 =?us-ascii?Q?5OgCtVmtyIgeAEMLc8hPtsutq6iuNCvp1AIshOnpViq+q+6yg/OAn+pJ6l6T?=
 =?us-ascii?Q?FGNFtuPL/f5rXBxY7l9s/NXCRLhSeJj7l16QahuwNqy5PgjL1ekTLI5/cQ5Z?=
 =?us-ascii?Q?gGxBGsfz7zDVWuljzj97NYAA1TbD7ghS7TUGqvV/WbYnnuiXzfTjOoncPL6D?=
 =?us-ascii?Q?XCIu2juQAqrQ3Apzp2DQUzkWn97bQDkA+fSIQk5ZuID3l3VhwU0PSMtgqEz1?=
 =?us-ascii?Q?yYgy1goOBwc2vsoGs19emJEXA36g5x6FlqK5p3zsq444sx+ZhOuYSrZDT59q?=
 =?us-ascii?Q?z5jiwIzEIdQQ7Z8+JDp994tolcp4ZpC/PelrLjLmIuQRu7vBxVlLpQNx1/mq?=
 =?us-ascii?Q?7HSyJfqKBOgcAgMDIGzje7tmOtR0PL3xRcx7E9JnqRdEcDC3Mi95Dx6LcWOt?=
 =?us-ascii?Q?MJlA9lD/YH2t4OJu37zctU9xpDsJ49uR7bqUpu303ux2T2+Ak0KI1LOs8+ut?=
 =?us-ascii?Q?9XeXQZlJMfFURJEBxPPYgBOk4GmszzA99oYlhrTG2RNXiWa05ZWHd7+fB4YY?=
 =?us-ascii?Q?TbJsg18CajedVjA6TDVsEjFrp1efQE/HFVmNmavQi0i4KQYqiMKU+R341ikD?=
 =?us-ascii?Q?DqmuF5qhK6l0HnAhueV2JXafvMIJFjk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 135460a2-741a-4e1c-fd7c-08de72ab16fd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 07:13:48.5323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZrL0APWE5hRT7eWyiC+MJ+dSiajBvkVlbnp7/+td7Ncf8eLxjhxdzsPgjJeZVGFoN7hsQIRII5cup3SSYNZFcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6985
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

On Mon, Feb 23, 2026 at 12:38:37PM +0530, Varun Gupta wrote:
> When check_bo_args_are_sane() validation fails, jump to the new
> free_vmas cleanup label to properly free the allocated resources.
> This ensures proper cleanup in this error path.
> 

Fixes tag, CC stable.

Code looks correct.

Matt

> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 52147f5eaaa0..0c92fed6c6a6 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -453,7 +453,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>  						    madvise_range.num_vmas,
>  						    args->atomic.val)) {
>  				err = -EINVAL;
> -				goto madv_fini;
> +				goto free_vmas;
>  			}
>  		}
>  
> @@ -490,6 +490,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>  err_fini:
>  	if (madvise_range.has_bo_vmas)
>  		drm_exec_fini(&exec);
> +free_vmas:
>  	kfree(madvise_range.vmas);
>  	madvise_range.vmas = NULL;
>  madv_fini:
> -- 
> 2.43.0
> 
