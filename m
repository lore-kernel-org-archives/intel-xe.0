Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B3BC25B7C
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 20:48:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1403A10E270;
	Tue, 28 May 2024 20:48:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WP5KmC/W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9338610E290
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 20:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716929325; x=1748465325;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Vt3qrNivZszlVhSEuJULJq4oCVf392B6HcX3RobmwaI=;
 b=WP5KmC/W5gihC7CSvErFwF38MCPXBZA2EtLhgOPTG/dLmr5XSTtlZ3dn
 H6jLuqq4FIzuvwnqXrjAc6BKkMJdeY7L9DY5XaCXPFcZkCSK5oakrJrq0
 RMhx7uwfluN6X6UqlmXksGB5XmSXA3K4R65jAbCLrfHUBcBAxFQAeKl3v
 7HXSoVAyHSXW5TlF2CcRgdjVgWy3+TRYJfTiUoKc2KAAENC54eJXup4MQ
 rYBNU5dbp8j+ehsnFaUcH9XWGv4kTzDBzRivdpsxWj8PKqOJwMxF8Ptny
 n9CCOjt113xu23ijOOjQ4OGTdPBZ1gtidHqt4mYaVJbdTfK0D4j19eMJ2 A==;
X-CSE-ConnectionGUID: R+08AiTKT4CpAxfRE3K1FA==
X-CSE-MsgGUID: 8Ghr4bsfTGqGvprRRIfGqg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13431497"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="13431497"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 13:48:43 -0700
X-CSE-ConnectionGUID: qzNPKzw/Tpe5FUGdbLk3BQ==
X-CSE-MsgGUID: LT3oHMPET06cZFalZo07qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="35714280"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 May 2024 13:48:43 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 13:48:42 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 13:48:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 13:48:42 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 13:48:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+CVuBCek7TURhbx5WG5vL8wF3YGZ0kSI2NbiyLCSRDLcqzOZWVav9nK/fJUauAwUQ8WQD/Pu6P6NWoHthGSXOVNfuJutztBTUjV5PncjzAckWdzqHEd/4V3TZf0z+XHj6dQ5JwcE22isYLyWrjZP/Xe6JSYm7yCOr0YQwyuxUuuFrjSbW+/eStv+UaQVuNjGdJ2xBSiA+pchZaySAF/9I717N9su3AFM8iCBbbxySwvXm+94Bc91J/3F+30PWfj6yvKC+Pi+VlTDpu4Tastq2XcRJBgHJoTHLCL9ADvBItIQb7fJy1+8daey2q3kbFaT6y6nHIhDH6cXl55IEJGWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SZZSaWDcnXfe72D9zQen0cIjFldQ5pgvBdSqLQziKms=;
 b=hM5PJvDbZeaZMxe+sEa0zRvbCnbkxJYWi1Kj7lh19aomjS9t9AgeDa0LIQtZOUv6+eFHBbn84Gbpc2Jrkm5Vjh63VQgz5rucJt1/F3xqWCS8tOcu5lbhlX7j0iyg5NFlSblo6P4k766W5HYxKCZu1cmICADwP6KQUIQPSx27BVn6YoFn4MV2D3d9Vsrtu/y+MTjP57BeeEIORRV1dg2H/JmOn7JsCme3Fo1c99y4IRVvNZ1IuJv1FiWl1rOcm8yNkKp3CEoFlo1Yt4GJVt2sWH++hS7rAsM6N/mmOe3J63I7kiLpOxk+ppk9fl9ziPxNaHkwlm5ZrqEBAnpYbLPMQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CY5PR11MB6317.namprd11.prod.outlook.com (2603:10b6:930:3f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 20:48:39 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 20:48:39 +0000
Date: Tue, 28 May 2024 20:47:55 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Add engine name to the engine reset and
 cat-err log
Message-ID: <ZlZC+0NtpDeaJKEY@DUT025-TGLU.fm.intel.com>
References: <20240429153018.1520-1-nirmoy.das@intel.com>
 <20240429153018.1520-2-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240429153018.1520-2-nirmoy.das@intel.com>
X-ClientProxiedBy: SJ0PR13CA0134.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::19) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CY5PR11MB6317:EE_
X-MS-Office365-Filtering-Correlation-Id: 395bf87d-be4f-463e-8118-08dc7f578d98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gPTXfY1VslMoZMVjbW4aznx/a9l+1Tox+18gKgt1WyPbb0hN4cWIyfUoYpk1?=
 =?us-ascii?Q?AdXRrl5iMH6c4rf58TG8jhvsV4DXdDzkiiCq+jlpTNBmxFjV7oxcE3VJcysE?=
 =?us-ascii?Q?5b9eL++7lNx03Ep7LZxQyavVpXaFh/a3iyJ37hBZRci6J5fIUeZYlwy7klom?=
 =?us-ascii?Q?OpztONZZr0Bkc0QF+8xptcnDKTm3EzPfLje0aFGa6RPr/KhbdRRlBLnZrh7J?=
 =?us-ascii?Q?k9yGefrQ8tBZtTFWH2xqmPJrCBq65C5tRPHgmPSn0B3dztkq8quzsrWPg/+d?=
 =?us-ascii?Q?4sskI6koccByU7KxidA4TmyF7dFXt1Zxbh8H/1mE0N0Xq2aPpsRVjqlhxSpl?=
 =?us-ascii?Q?glQgatHTdWjj6589xvVPkmVsV7TyC9G/CC5QUkqa52jEaaW4yjK1OfYTLH1+?=
 =?us-ascii?Q?1Z87siiQkYJevelrOdVC0041yiZbt20HKxy+WmKfO0Rz4wV/aoZmAEFs68AY?=
 =?us-ascii?Q?+ahCGf17/0NwGG1mV2nNpuFKX2hMb8USxMyKDb/cbv4snxFzmbSP4A/fG6eM?=
 =?us-ascii?Q?nuBqSy4OJU+xDwsLYQ/Gyy0YYczIpvJXKCOZcBiPvc9VjVY1PctcuProNYaU?=
 =?us-ascii?Q?65FfYidXVjPbXeiBJ5PQ5Tmb8hokHw+jxKZlC8NJXd6dNeXXr3ntglH1/v3o?=
 =?us-ascii?Q?SgHSmF1hR3vgdlKMCOr/HjNpo7O7DPL2L8bsiDvsww8DwtVRk12KKldYOTci?=
 =?us-ascii?Q?Njq7x12YzLW6WR9mnSG2x9bukFPFVu0LOnAOf1uK5hc+GaqZFGpaQKWn2IT8?=
 =?us-ascii?Q?tlWnsAPy35HgQt4iz6HZA1Bxpo7F6jmdaZJL/aCDi5uIlBBkGKnCwKvPyQvn?=
 =?us-ascii?Q?0L7/hBHKgu/d+gTSlvRCxMV7s8O4LI1iG894HqntEONE4YK2yl42JMHUELnt?=
 =?us-ascii?Q?K4zxDiXsp4Nv4wV76xy9/YnnGujqHKshLlEw2L5oGlMKnx4pvsMsCU87+bR/?=
 =?us-ascii?Q?7sKIOqW2g+wrbzGmGk0nAP2iKhFUc0y0cgkgcutCMFydAlIRRjRFivSpJNZw?=
 =?us-ascii?Q?VsteMj7BD974DXBmsfYZf6RNeDLvyNWmXljvNrpgOn2d4fKTYjdorjf5JOL/?=
 =?us-ascii?Q?oKnzQLvj7A0ohp77zPwmh9frCDdf08Auwzcyk2YVSdeiRkJl+aRmf34AZY98?=
 =?us-ascii?Q?RneH9S0mSmgZfz+7z6GTYRZ5zr8isL5fb/207XlgCJzQGjw3qVQ9Qr9idzFd?=
 =?us-ascii?Q?PSNl44vz79RBepakbWi+OPMYI2w/EUJ/PW2Cr7b4v4OLPMRnRMiyohjDdhO4?=
 =?us-ascii?Q?5I7v5iyT0kS7Fsc+VnACiOKL7mLEjajYJ0mGeUTccA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Qie+2RZlJeIAqUVdB87Q5szdKTDO3RzWeX6ltD/bt/yoahcwPJvKEHl8bE1p?=
 =?us-ascii?Q?NEn3PVmzdb4TiQ+l5uSUqey2kOGxNKr2SRu9vv4p//P0NQjTx61L8BQMMqMH?=
 =?us-ascii?Q?MtSpJngsQRJQ5hp2BtlmI9er2PZkAGdxfyUu9LS7NEhqMBkuMgej26/El6yg?=
 =?us-ascii?Q?20XOPjySnjt3wkLuOLhGB0PrGB+Eszp0Eqi0R+0+P7axoVklklnOQrcqtLLC?=
 =?us-ascii?Q?n6VawdNruBCmg/i8NZKV30nseFk9ySv4bZR4Kt6rNXrD2cWUvo5B890jEPfj?=
 =?us-ascii?Q?GeSQOufdIwE5o9GgDJ6NYZPT5IA84irCUpCAFwkHAEtd03598PcmQYbG9+0X?=
 =?us-ascii?Q?udge92pX/Zg6/tqKRGnQO2ioZc8R8yAbj6sR9MRA0aCz0weGyUFP14zz3+/N?=
 =?us-ascii?Q?JICeA6A0A3i112vahn21H96Cy3F4PEkjVbLh/bnSB6/bx+Ydes+ffV66bPt5?=
 =?us-ascii?Q?i9rI8qR3aDat7rNQd+RQiE0DFvC2kCUFgh+Ao/JcPUMF8sW5Ky+7r7I05p4B?=
 =?us-ascii?Q?Ba4CEGjn2tlMprlrNWve9pNhpAYufGwnOc2Iqdzn/0RvhUuIdX0K+2WqRRQ7?=
 =?us-ascii?Q?Rl6dpbsqlpYjMy3sk3hNZqut2QWzxfYCPTntNDfTE3eyBV1/NnRilNxbppfY?=
 =?us-ascii?Q?c/coo/oyazIfYINIpAWxfLJGS/U89YmPIxTR3gTwOhYr6MQvDh0OsdhXY/dx?=
 =?us-ascii?Q?M37LznyYQNaF2WHb8UwQooOj3FA/+ukJlHnESJI+Aw8676sdfrVvNiTvaE7f?=
 =?us-ascii?Q?Mn1NWmI/R9zP4kx5rZMf+bJzmdhWSAkA8/6RYz5de9SM5wamZY60hypwok1R?=
 =?us-ascii?Q?d2vnxCt6PSKjIjZaCkukUn+kYFNze9RW0F7vVmZi+70fmfnxQIQ07f+mU3Oo?=
 =?us-ascii?Q?cF0G7VoYXjfW4A4t0L51ldiPMKORPly4EmzbNguKCmGae6oCzjljOJzQP6oA?=
 =?us-ascii?Q?xMoT3pHnNgikfvdHcvk5+gwUqzeNhNhaGY7H6X/6JdKbsbfQNKa6W0jcbQ/b?=
 =?us-ascii?Q?quHPutw8sX/Y19Mkz3WYfqScFh8Wv+p9nyOvmJVAzfDbQxOvMrFVNc/p3VOb?=
 =?us-ascii?Q?i/WR6DNJWSJwWy4d1howXRlOD66XGcj9nmPn5Evbg1dWAaCUpXwwu0TohE7Q?=
 =?us-ascii?Q?+AMZz9E/cqklU5Su2yHRELhWCKckAweONpjoV97pX/M8tWCmaZeL/l3GQdqG?=
 =?us-ascii?Q?o1W6RvjsGp6jIqq82wq95cQR+9EQgGo4P+4eRmMWN55LDHo6Nu5SQx90XQEB?=
 =?us-ascii?Q?60Cfu/sqoNqAhwUxWy/xj1wpmXIqCsuWTXDwjILd1DEXKWEYdVqnpwNh4en6?=
 =?us-ascii?Q?DXtdIsmzZKfsEqG9Kni1FeWUSr/1fM5+0Y1/mK+BHOjBlc/jZS/R8FB53e+2?=
 =?us-ascii?Q?qE7Y5oZ8+DMrxFtZReXyFo0rg5VbGOyD7JHSbTkH+Au61YEAbeZphZf8h61C?=
 =?us-ascii?Q?jWyLIDqTeSzC/xehEta3jPvWjz6ShP+aeqBRL7BANk7e4pvoxFSMG7XrOm6G?=
 =?us-ascii?Q?vN5W4Dhnw94w6KLTc73kkwSpXFHDOxhOCvQaArNfE1g+hOWlxVkkeHGExWZX?=
 =?us-ascii?Q?QX78r2riJYEuS8F7lML1U5vEjwgQCL19fntOCM7ipAUSgNFSb4JSOm8FdYqI?=
 =?us-ascii?Q?SA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 395bf87d-be4f-463e-8118-08dc7f578d98
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 20:48:39.5600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5qkePswHme2z/pJR0UbSEJuP4qMPZ7/Dl24lXhsa+PZuI8c4LeBjqQzTw4pMcGDUsZTZb14aQ8xU5JR0hFaWjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6317
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

On Mon, Apr 29, 2024 at 05:30:18PM +0200, Nirmoy Das wrote:
> Add engine name to the engine reset and cat error log
> which should be useful while debugging.
> 
> v2: Add logical mask and engine class(Matt)
>     Use xe_gt_{info|dbg} (Michal)
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index d274a139010b..72aefabebda4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1702,6 +1702,7 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  
>  int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  {
> +	struct xe_gt *gt = guc_to_gt(guc);
>  	struct xe_device *xe = guc_to_xe(guc);
>  	struct xe_exec_queue *q;
>  	u32 guc_id = msg[0];
> @@ -1715,7 +1716,8 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	if (unlikely(!q))
>  		return -EPROTO;
>  
> -	drm_info(&xe->drm, "Engine reset: guc_id=%d", guc_id);
> +	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
> +		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
>  
>  	/* FIXME: Do error capture, most likely async */
>  
> @@ -1737,6 +1739,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  					       u32 len)
>  {
> +	struct xe_gt *gt = guc_to_gt(guc);
>  	struct xe_device *xe = guc_to_xe(guc);
>  	struct xe_exec_queue *q;
>  	u32 guc_id = msg[0];
> @@ -1750,7 +1753,9 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  	if (unlikely(!q))
>  		return -EPROTO;
>  
> -	drm_dbg(&xe->drm, "Engine memory cat error: guc_id=%d", guc_id);
> +	xe_gt_dbg(gt, "Engine memory cat error: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
> +		  xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
> +
>  	trace_xe_exec_queue_memory_cat_error(q);
>  
>  	/* Treat the same as engine reset */
> -- 
> 2.42.0
> 
