Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84ED8C77B61
	for <intel-xe@archiver.kernel.org>; Fri, 21 Apr 2023 23:41:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E20010E02C;
	Fri, 21 Apr 2023 23:41:51 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A2710EF28
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Apr 2023 23:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682120509; x=1713656509;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=C8J0EWHbYfMuWc2nqh49xLGGbHzSWzyDsmtcKZ2Klng=;
 b=C1G6JFGTNQ19HcbHuvkQ180O7dMuAMN15owNF7wYaEgC5kSZzVh7GdGP
 VLI/WSTeY5eImCreqL/yctzAjNElJWcNE6m1DmWH53C25joJdwDgSRuQR
 xwhz8uqSIo5a4mfbdfOPbBi+XYq9NMFIRQa9sLBBmNe42PQ65LQ+N+opC
 3F5An1pYV7yN6VpTW5i/FCjFtoDZbNOF9G9exQ//MOUdYUwWs/jB3VwxI
 HN7d8LtCXgTf1N2SBTUPv7jTuHe8aiE4eqV3EECPRkB5j9+d1ZPyDAGhe
 XRp+1+uYNj3diDqMeMYz7RGfFnjiUQukPpP1RAf1OUD5FSiDVCX3hXq4h w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="325702729"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="325702729"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 16:41:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="761738529"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="761738529"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 21 Apr 2023 16:41:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 21 Apr 2023 16:41:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 21 Apr 2023 16:41:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 21 Apr 2023 16:41:47 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 21 Apr 2023 16:41:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b1s9nb/eAMZaIGqtOAarqDpPAGaCzqWSOlc9odm/I25NeyUkmfAjx6+2qLLSO8YV9N+Y/zIVkHuOVqnxBK7r3w1AWOsKmDP9fhVBbWJqHsniubQqvAP2gyTHz8gE5QXqIMvGEw+TxQH9A2sVh5Y41nS1eK5MkyNn85OLqjVCfmklQ1vaBzXkTWtDr4ry+OE8KjKC3bL88uXb1iYzLGUlKSocx5AvYnm/alJ6Vh6/Wea/bbMKKAS7Se8RtUIzPkNtqLHgT/nvRFr5Z8OoxTdWYRytlKsFV8uClSq6y0uVaJLjKcM/SiLUdlwVqK4D1ha3LOIji9dQHH9BmT18scXAtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/WZYMIRZS/jwAMwy1BsTxYBdUbG1Q19/9xtL82LBEs=;
 b=ahVjPbsrbJAZ+Fpe80iOcfCE2Qeu8CMu3y9XkVGclNMf5nHNXJCPMnn1mHWdEsKFG1zurYlcFUey91s0nS7kjKAFwqbuIM413CUp8GS6AzcaBS1rpq8CmeAh+MZnE6TJEO5vZ97FxXW9fYe7KtuJ63Zy5mTOn1zWMNdfeoQKzp+h/UIzyBl0AeQhgWS/OREN1Gh+R4PIoJ/XrCGyzPR9fzVjcb3ipn5wZ5T3cL3lj5rMT5b4oQyBh8bRTJqkbgHZ1aJyDuXlFLBKLpi3y14xJMFaCWCPaW0L8SM9wQfXkTdK/Bc6OReHtMzQfiNamdZFexOXMihaDIBtbPo21aK2uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ0PR11MB4797.namprd11.prod.outlook.com (2603:10b6:a03:2d4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 23:41:45 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6298.030; Fri, 21 Apr 2023
 23:41:45 +0000
Date: Fri, 21 Apr 2023 16:41:41 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230421234141.GP2825255@mdroper-desk1.amr.corp.intel.com>
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
 <20230421223258.128781-6-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230421223258.128781-6-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR06CA0052.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::29) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ0PR11MB4797:EE_
X-MS-Office365-Filtering-Correlation-Id: 9de19c9a-4613-438e-e4d0-08db42c1f72c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iiwuftm8yYHqB7vNPtzaCvXEGnrjcS1vH741BH23ofk3a5m2/9RqUjBMAr4nOGeDHK6gSTEiqlew4Og5VSX73mimnuBX8TOVsgLKu+JZXAD7eZtXtK0AtXH1QgG8JpsDXuQy1tBjEPH8y/P3DG81vUaMW0GPwjnQMO4QqDU9eNYqbE6lw/amVmOVWmRpIkgdtKs/mhqLx7gUjSAWOcHixTz4qZK05ow8gVYFMrz0pmmEkDojesQf260yfttJz6uKnEdHwv8p2C3je3Pkeg9zAbVR6qakkfVDwF9J16S5+XEtp/nrVF2QKD9IiHknXTjCHULXj9Jg1VHoGrKA/nk+pTpmM0e9jCz+KeTy+4bA2Re/VwJcQ0GU4VGXT9PieFuLmjXvtsIk+8EjCZa/LYkeOgY702nyMrRD1ppTfakrvhU5yOqY+esAEptQNalRy0OnaLUA9ADmowkKl7ROhvGAGk/hOW/PO9kx1RQWXIGj08FvSMxzkdOUDMuuFW+/pZSs+DFDl5lfbP5XGkI1J+nPyfvdQaBjRxzOFG/4UY+XLwW1+vYChb76H8u14uzUlypR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(346002)(136003)(39860400002)(396003)(451199021)(2906002)(8936002)(8676002)(38100700002)(6862004)(5660300002)(33656002)(86362001)(6506007)(6486002)(6666004)(6512007)(1076003)(26005)(54906003)(6636002)(83380400001)(478600001)(4326008)(186003)(316002)(82960400001)(66556008)(66476007)(66946007)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TdV/XuHFTmhBugpwoevCz3Q78JZjocUJKastbS9iPkPZTVV7D0KHfebykTxt?=
 =?us-ascii?Q?Csc5wHUm43wWteQqJtFxvt7AXUjDTpx1Kipqfdxi32pexrsJTNDN7LRNXju9?=
 =?us-ascii?Q?nf0cgu58AKPYEcF8o71zg5XkKpxZLTB2Rs62ygaHaj4kgl2jX/ykmnwKoymc?=
 =?us-ascii?Q?4LbI1Yd7VAFKsC7bwNU2Cm/pUSKp17VM80xFiJTjmoSL81Zufp7/BVWWMBfY?=
 =?us-ascii?Q?uE6hPoCyQzKrgcZ6DSfJdfArpsm74AIaCovF+w5sf7Ozins1s3NGauTcN10B?=
 =?us-ascii?Q?dUDCGIwGlPUNmgFuaJD6ppqRnMD2vW26yybaLOj6hLl5R4VrT3dxf5MjpPr3?=
 =?us-ascii?Q?oqdxr580sbs1Z26eeddO+z55KwV+z+mHmZShO/6GfQ3oTutMCibeBafgvTPO?=
 =?us-ascii?Q?DcL3NTdj9z0iQWqNycgZhenQncebxtk6IF2HSnWSCQ5KTfKOZF9GmpiUFcve?=
 =?us-ascii?Q?vCCd2U7fGte+YIleuj40p3SigFITUJ1vnFvciYOTehenaMb2lR75X634IO+A?=
 =?us-ascii?Q?TXZLNxGi8/kyaREfc+fdORKlFGmQWT2I3GP8RnPM7OCAhxvS7lbQwsaEH3fi?=
 =?us-ascii?Q?IIhMY7cTn5lW0yG8HocxhSBkBZPdItz+fthYxg7WdDuB9dXQ6GTD35FNO2gv?=
 =?us-ascii?Q?Cg54GlrHfblKrB1V/vH01qet9uzlOVpnCrnzzbQAM/e7ByveKTAQ6XPiKuD8?=
 =?us-ascii?Q?OV8EZvpwvTpKziXmhevUcLWx1NcFO/H8M1g9AbHuNNNg+Bet6+ebcph82tcF?=
 =?us-ascii?Q?5qE38gjEtMt/85Pc5fpRGVpR4VHQCRTtdxdJS7KSOBNdZJRHM+eKKrC3TDlA?=
 =?us-ascii?Q?+AeLWLDZjG0Ub6taxU/HkGO3tctmHNiAS8z4pieUXXIZa7+7cs8iMAP00Brh?=
 =?us-ascii?Q?xzrS8RkIIwhfY/uzEbxc7jZW42DrMXR+YZHNb0UsNq6kik+TqJGHqE03ferr?=
 =?us-ascii?Q?gi8PZGZz7EySltKdrC6/GXayjnJeLXLYCk7DmvSbHz19gRb8tGbfOdYT0lRV?=
 =?us-ascii?Q?zA4obLZ0wxOH5sFummc+oFSmwQlSfHIdL3s8B82QQxSXaWGXCqaYdbcDKC9Q?=
 =?us-ascii?Q?OlVOgGPStU/OfmV+rwFenkXkvdKNLs5bZWxHKg6xQTFuNZA4fAbdxZLGmd/N?=
 =?us-ascii?Q?zC/3moEeeASTLlKc2LXNlZl6zoS5m9iO7oqReB88bSgdlK+Rza9AMXRHUn/L?=
 =?us-ascii?Q?iWIBq5ahQ5Ym7CukFGWvjVrGU8r8snapI7sNEdBGjblYXfwHPMw+lcNFkbWE?=
 =?us-ascii?Q?0gY5Y8vaJKyHSgaEkLskUEstQ3N0iVLJXqthBCcBdbK1qog5vjyLl9ISnD1p?=
 =?us-ascii?Q?H0lFHBSA4deqrvpJhqtMbwhorYalhdKnpz+LroJjoUuoZVbDs9J2SFZ+GLaI?=
 =?us-ascii?Q?fMT/ZbDQYpfg4QQ9Vk+K3luKgSFQln9ljlaywgEde8Ua9p4bBVR2UhXe289B?=
 =?us-ascii?Q?a9gEni3toNkyaqvsOO6AYvcWD2yj4iSbj5vdzlCaB2d8NHPs+2yL8PstnBYl?=
 =?us-ascii?Q?zjuEx9ZAijDiFkZjK0ZY3Ar+3vSwa7AqfQn/6h1vaX6cuBf0oAoImX0vYIdA?=
 =?us-ascii?Q?whM4Iau44Sb1j8odIki6qOfIM03eC3lfQsohdjeAtIcYtldQNrk0NOVO1oVK?=
 =?us-ascii?Q?dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de19c9a-4613-438e-e4d0-08db42c1f72c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 23:41:44.9276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ccuzwj3W2JaMaTzsUFsKTIMcv2EXvm+Py/8os/D6TCsjWEUNhPblsHTfUd3OZ63PFLSTG6eaZGTYFCWHa6mBUu6Erry71OWTvI6RlT37ZVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4797
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 05/17] drm/xe: Rename instruction field to
 avoid confusion
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Apr 21, 2023 at 03:32:46PM -0700, Lucas De Marchi wrote:
> There was both BLT_DEPTH_32 and XY_FAST_COLOR_BLT_DEPTH_32 - also add
> the prefix to the first to make it clear this is about the FAST_**COPY**
> operation. While at it, remove the GEN9_ prefix.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Looks like i915 (correctly) uses the same definition for a bunch of
different instructions (XY_SRC_COPY_BLT, XY_COLOR_BLT, XY_FAST_COPY_BLT,
etc.).  But Xe only uses it for XY_FAST_COPY_BLT, so this rename matches
the usage.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

I do wonder if we should think about changing how we emit GPU
instructions at some point.  Even when we get the bit shifting correct,
there's still potential mistakes if you OR the definitions into the
wrong dword (which has happened at least a few times in i915 history).
Maybe we could do something like create a C structure per instruction
(e.g., "struct xy_fast_copy_blt") and fill in its fields to build up
these batchbuffers.


Matt

> ---
>  drivers/gpu/drm/xe/regs/xe_gpu_commands.h | 4 ++--
>  drivers/gpu/drm/xe/xe_migrate.c           | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> index 9d6508d74d62..05531d43514f 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> @@ -55,8 +55,8 @@
>  #define   XY_FAST_COLOR_BLT_MOCS_MASK	GENMASK(27, 21)
>  #define   XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT 31
>  
> -#define GEN9_XY_FAST_COPY_BLT_CMD	(2 << 29 | 0x42 << 22)
> -#define   BLT_DEPTH_32			(3<<24)
> +#define XY_FAST_COPY_BLT_CMD		(2 << 29 | 0x42 << 22)
> +#define   XY_FAST_COPY_BLT_DEPTH_32	(3<<24)
>  
>  #define	PVC_MEM_SET_CMD		(2 << 29 | 0x5b << 22)
>  #define   PVC_MEM_SET_CMD_LEN_DW	7
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 5acb227f2b5a..f40f47ccb76f 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -518,8 +518,8 @@ static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
>  	XE_BUG_ON(pitch / 4 > S16_MAX);
>  	XE_BUG_ON(pitch > U16_MAX);
>  
> -	bb->cs[bb->len++] = GEN9_XY_FAST_COPY_BLT_CMD | (10 - 2);
> -	bb->cs[bb->len++] = BLT_DEPTH_32 | pitch;
> +	bb->cs[bb->len++] = XY_FAST_COPY_BLT_CMD | (10 - 2);
> +	bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch;
>  	bb->cs[bb->len++] = 0;
>  	bb->cs[bb->len++] = (size / pitch) << 16 | pitch / 4;
>  	bb->cs[bb->len++] = lower_32_bits(dst_ofs);
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
