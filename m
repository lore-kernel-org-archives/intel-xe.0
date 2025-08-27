Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC76CA0EFF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 03:48:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D605D10E06F;
	Wed, 27 Aug 2025 03:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TvcZyi4S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BFC610E1A3
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 03:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756266520; x=1787802520;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rCvyvbBziFpe4uMae/2l1Q3+BZfBW+xXtvXY/HANFbU=;
 b=TvcZyi4S3yiExhRGGHd/aUj2mahhoDVYm+Ps/pjGN4MohYWUiluapXhX
 inYIy8BwYdjfG70tk7R9qzRri7v30eECyFOcER/BcTPURAMm5r1UyC/sC
 oOywXi45wyJzrT5f+j4GdHfIMETZrh08gi/Yt1inTZtXNIpGPiMj88DWB
 c7taV29ivNPoRukohoD9cabwzRH50AfAgI6GEXD4TWgMTORQeoZdOGBfh
 1DrgLu12FJZdsX5/yR9cQqPVEWA4pBhGMK54yeBV0a9J4R610xlvVYfk3
 NumiJe6lQEGj1ndqrwWGs7p5IBrqxvSH6sLFE6KfEXxvt4qOUVk2Gp6Aw g==;
X-CSE-ConnectionGUID: Jl99M5xtSHSDjFotEO/Emw==
X-CSE-MsgGUID: M2ERDaJXQqOccq54m8whLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="69612729"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="69612729"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 20:48:39 -0700
X-CSE-ConnectionGUID: gomdkih5SrmhwzYu5+/67Q==
X-CSE-MsgGUID: TAfFZ5mfS4W+9zxD0b0EMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="169252472"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 20:48:39 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 20:48:38 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 26 Aug 2025 20:48:38 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.64)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 20:48:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jgBT7APVZJDwMLrnKuMs0Ou7kXei/CY2bTzWimm17XG5sW+jEyBNSmPOe7s82fi+3sRkzCIIb2V+0l3IJCQrEbORssyUwagV0SitVRTsJUaOaooYI+WrpjjSnHRDEKQtighdcduxIKIabgyZaE2KXko/QaKK3ZoRKfl29gVaR05rR+WSNPZXSKvJTiC8em1rCMOTJ4bjxWtk27NwmavpwQIVfM99V0BI23RB2F7cUkRIVobbSZx/sy89gNVoqyEo5peELpiR+ifCaw1WP4FB5Fpd6XViKrLmlzXRHiTR8IC4u71FjB6wprm17vUbzqN69QSLEHJmJHxxFxCgqh0Daw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/+DkvCVDNrKj2YO23L7X26Yqoi09rIWBpPVVP/nWR0=;
 b=ioIiEOPHZFhYxICQuZx2cOwuRyNAl2emrSYJ0vXj7YFJ6XeY0pLW+fz7jNm+w9BZAAtQUwgZY5IN4dobywxlaLpIP7v/anCXMRmsRqH05PoGnpp1h4/7YMRDF0DGTwcl6yWN76K+lj0PVkjFeLDzSYn6A+eMxNuvPK1C3xQthHHpAk81CnQ67BENOAIIr5vg21S5fNVrH85hFOkmFD0f+aJAaDX4XqFX07RE81FwaQ5M1yG2Ux7tnlITvLC6NJmzZiAuNs3t7DwIfikSvQKvTwvRORmS7dnqeyuHkLEUepNaJv0C4laG2AmIYhbEiYxmyvmyyWQ3tq0Yfb202TBYEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 03:48:35 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 03:48:35 +0000
Date: Tue, 26 Aug 2025 20:48:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <john.c.harrison@intel.com>
Subject: Re: [PATCH v3 3/3] drm/xe/xe_vm: Add error injection support to lock
 and prep
Message-ID: <aK6AEBFR6Qevj5Ju@lstrano-desk.jf.intel.com>
References: <20250826205758.235606-5-jonathan.cavitt@intel.com>
 <20250826205758.235606-8-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250826205758.235606-8-jonathan.cavitt@intel.com>
X-ClientProxiedBy: BY5PR17CA0029.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::42) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS7PR11MB7859:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cb109d6-fd1c-431e-d2f9-08dde51c997b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Wj2EM21vCZANgSUUqmhbrh/kGprzcX3mEqlLEWVy8ECbfefVhMtFNfcQchEf?=
 =?us-ascii?Q?S2AXzns5vTbibYAzvlN9S/W/v75yj5N5KKn3OiPsE4CybjO7FdbbqxoaMNDh?=
 =?us-ascii?Q?O8GUg0CAfwWhszWupP4zg1Rooh1e8D8wBnTfXqgNFqU544OfliwUTIB+zQ+U?=
 =?us-ascii?Q?JE5jzyCT1YT+vrAsIWigaDqFKokvKF2lYxqHmE7EgHBpu7CoBbclOxAymNVW?=
 =?us-ascii?Q?7PnKoFs7IyhB913Uwo7n5vMkx+2lljVLRZ+J99XdCYEL/z1iKb2EtZ4kFBcE?=
 =?us-ascii?Q?oXdEioISTFygSkoHt2deB6/a/ehC0AjzMOIcztXABjHE6qRgMXwf54IdqCmH?=
 =?us-ascii?Q?rl9fO/qM76b9Z3RA1FeRIbWtURCU6VgPBrKC8zubLRsw9H2ZIiP2Btpy9igT?=
 =?us-ascii?Q?can47wbfWacrAT2a1G0nHvkP5sLc227k9HLocbF7bkjNcxawlLJD6ATS/T0n?=
 =?us-ascii?Q?YpyI/ow2eSG1EF1REG7yHlaBPgtreNqymmsezp0e7rFgOgPOipCVyHUDOKOF?=
 =?us-ascii?Q?GNS1VSo8cT98FgF/AN7s++FGBvnUGdT0qpEIw2wSsa7dIjx8AgBd/NkY4JJE?=
 =?us-ascii?Q?N6LqPEtSKqfWzVVXtuF651h02jOVYDWYFTMk+OHOTeXtrBatL9idHbyQZhCU?=
 =?us-ascii?Q?JxwtKaAFfQY/y/SA78w8D2QEZB2/R7UxjktyvYQSRzLoxKL/asDbUxq9JSoy?=
 =?us-ascii?Q?ZkufGlRdjy6zZ7ZxPf8KBte1lvZ/30Bv+yKQtFGzmIfLEmVWdHySOj8i7C6v?=
 =?us-ascii?Q?Ts2B8/AXzC1hJikv1mMVv0a+Dko3velILUgErTJhXe8vNbNRnwTtRwdGjo3/?=
 =?us-ascii?Q?gG1hhqHAM2oi/0e9hbb16Ru8Mj/sf3Q7EPEmBixoFPjw7Szr16Q7DOkQqhdE?=
 =?us-ascii?Q?BoAxrO4+cGhRDywwSU5Ra0NYwVmIL0GSieZ3VZyXs3pxkYXX3eRPm1CR1T+0?=
 =?us-ascii?Q?Mlixs7iCjpMNUs5iQJxzI2xDVWXBTqMSqwUrWRbGucXTzyE2dz5Qs3YEwwLq?=
 =?us-ascii?Q?FaNebeWndMw9iGbWYzQtd+NzH5enKmVrU11Hu6JBH+SdCFrJunVCzoDf+4W4?=
 =?us-ascii?Q?wabVcReIQ+BXouAnMXsdiyh6R9GuuiYhBUoZsditks0sLFJqQlnHWTnBJ4Y6?=
 =?us-ascii?Q?C+jU2cm8jUXBD/xdonucgVkNvbT9PgEW+IdohZ2uMpbQAuNxMSMPrF3n8Lte?=
 =?us-ascii?Q?l27HLbYvZKJe5zJWl5Yh6m7QiK7PN5waN2JQw28GnK6ZfHbJN6RBDMZxDkSY?=
 =?us-ascii?Q?C//1Af1r+BSWAy0Vh/b00LWQp+yqMbFGjmBDaTapsK9JkJIcMIiUtzOwSh/z?=
 =?us-ascii?Q?9RcpsPYwDZbQVeUE9yCYA9lVk85wIjGnikyZK60zae8IGq+ebRpGTH1hHsgu?=
 =?us-ascii?Q?Z7UJV8u2r8ZHqCA5qWcbl8oDI9RGbxwq08NaTlTZts9roMtVFHwryi90I9/g?=
 =?us-ascii?Q?lmZPzSN2+nc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZHbnhVX//ohWQ5eTthlpRUn4z0JzXZisAEyKM0GGJmztn6rpueLx7hMjawTo?=
 =?us-ascii?Q?MuOEZXkK7hXX6Kl0YZbV0SB4DXTdL4o7paBjEiIkYObsM4A3rOaapYBKeRe7?=
 =?us-ascii?Q?PsSCluH1wByw4Lzd+z/+H/uzVSq/2R8SK+HelREdu6ae9Ui5+WGUUfTOJgUN?=
 =?us-ascii?Q?o6LstjwInGm1h1H8I2AID3wAC+T16SLwWf0JPiTejpltryU68y/MCwr/Al/S?=
 =?us-ascii?Q?HeWBoyv1qHr5FSIdY3mMwl8LiRS/8886l87IFIWd5GP7THaCEbezovDC7+Vt?=
 =?us-ascii?Q?qK7VWPRnQRdPFQh7knObnjt4KLGqxAvk8Nx5qdO+WuxfQ9dhGrl6mDzSw6fD?=
 =?us-ascii?Q?x//Gh9o4mIisc7g2fw13mAQv4UjcJB1BMLzG2vrpLhCd0eizpU7dX9gUUDhW?=
 =?us-ascii?Q?kbiGTK+KBKmDgcH2B1Jy/L4soDJq6D3zcWmA1/rXBKkE/+FSFspjTLaTG470?=
 =?us-ascii?Q?z8AgeTkJEATo3Ak16QZe/LUB4grQPjLmDAUZFMwjlAryZ/twtQKcJszLp4nX?=
 =?us-ascii?Q?c7FXbSikQhR3m9xmp8GMI7pDmW0TrxUzg/ZX5vrNUJle6hKRNxBwwMloadTU?=
 =?us-ascii?Q?3kuUWzE5MSY6fZocmJZ5Pf1wnMZw3v+gKQ13k05CA4IJbDTOG4fbn52K/TRd?=
 =?us-ascii?Q?yAVZVMolz9uQcHZhPQCgJRFwGpt17U0il1sIerJ/N/uLbgtVgOaAh9urmq8n?=
 =?us-ascii?Q?VfN5ifrGiP3megZVvjp78opetHlGwH8BjeOmhlwvMKD+juiQlzbkGc2RM0bf?=
 =?us-ascii?Q?3jcKscL1NraJnn5Z2ZtgAkaP04mmgzLRXO/2fxxkU6+9p6lX3WIrvDORjQMK?=
 =?us-ascii?Q?yGpoLhqubQElqYF/NOiaou6D2a4DYjM7oi+Irm0OkejeKrqEHvqcmiCC8+Fn?=
 =?us-ascii?Q?hDoYojLw5goJAKGv2hOqzmq6oCiT4Mj4dTWG153PVVoGw2DCX+OB1PB2lXzi?=
 =?us-ascii?Q?efed9cHfIGEtOcDM10/aF3zk14vYHqiCtZsUm7sUvxLrBdeJaMUpKla+lQT7?=
 =?us-ascii?Q?3Psbnzo8VSdWzh9AfULdxJri8+6aQBnCuWsCyR8pnAkuZq88jux/J7nEByKq?=
 =?us-ascii?Q?liOn6E9RJDPow3CCBT+bnvm3eojEBfbfcLImdubSVkTjVsOv1/1Nmt+nVvt4?=
 =?us-ascii?Q?ejpAEwFctnKJkdo9WOAAh5SCSsZcsM8KOG+HSMMw/2mFzL2ZzAJLVHGh1m1I?=
 =?us-ascii?Q?Z/QINZfDZSD4VWj//MW6eryP+m21AqipNSViUOvxhlk+eCTnJ4S7wjXXSUSt?=
 =?us-ascii?Q?+8lO7asGvh0yGe61IBh6LLtjsRCh41TWVE5sfQnVSHjQP3IH0pQ23no4xbQO?=
 =?us-ascii?Q?qIDAbBAe4XWH23CfLbysHwz+Lres9obqiSmTr7QqdXmxwtFqXT7ZN2j3+OFZ?=
 =?us-ascii?Q?H4I5chQAGtGzaTsgiiq9n3keA7u7PanwhBM/ljWBBNuyTmEuKrdEb/ZmFn8L?=
 =?us-ascii?Q?7ZVwKS6FEiYJMaChJpCWWo924RM5+Q+ZYmv4dZNCQPzZW+zAVYNhntIoAeoA?=
 =?us-ascii?Q?bOl8SvuVuixINGPakMJs4ftECoDik7b4RrrLZSmWdXBKgT7jrKY6AEQv/H9t?=
 =?us-ascii?Q?R1RODT6jI+aE+fJgwP5uiHWNnCqpQ6JABEh4p3VAr5sEROFu7m9yepURYBnf?=
 =?us-ascii?Q?nQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cb109d6-fd1c-431e-d2f9-08dde51c997b
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 03:48:35.5334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iNYaXO2/fVmmpU3E5hWAEFdWHf5Wf3cEA2PNXzE4Y6KLzwAZupTcrLnduugJlpCX3AzPT6ywfqQkaLgZhWNmTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7859
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

On Tue, Aug 26, 2025 at 08:58:02PM +0000, Jonathan Cavitt wrote:
> Add error injection support to the function
> vm_bind_ioctl_ops_lock_and_prep.  This necessitates marking the function
> as noinline.
> 
> v2: Only noinline vm_bind_ioctl_ops_lock_and_prep when function error
> injection is enabled (Brost)
> 
> v3: Use error_injectable to apply v2 change (Brost, Harrison)
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index ce8a35418357..41006d355468 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3201,9 +3201,10 @@ static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops
>  	return 0;
>  }
>  
> -static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
> -					   struct xe_vm *vm,
> -					   struct xe_vma_ops *vops)
> +static error_injectable int

I'd keep this consistent with my suggestion patch #2.

In this case you could write this as:

error_injectable static int

Slighly different from my suggestion there, but in case return variable
is on its own line so no need for below given this is considerably less
than 80 characters.

error_injectable
static int

Matt

> +vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
> +				struct xe_vm *vm,
> +				struct xe_vma_ops *vops)
>  {
>  	struct xe_vma_op *op;
>  	int err;
> @@ -3220,6 +3221,7 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
>  
>  	return 0;
>  }
> +ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_lock_and_prep, ERRNO);
>  
>  static void op_trace(struct xe_vma_op *op)
>  {
> -- 
> 2.43.0
> 
