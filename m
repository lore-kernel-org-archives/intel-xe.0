Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29CCCCF9E0
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 15:35:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B914E10E4DB;
	Mon, 27 Oct 2025 15:35:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U/Jb6NYo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4063810E4DB
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 15:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761579332; x=1793115332;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HWURRsnksB//HNuYgcr4wys+Kc69ijtcwh0arxAHhxc=;
 b=U/Jb6NYo9eYemFkirDSiGO5K4R5sVtbJuYzLju+i9TQZcKWzfYWTEfoT
 FH0wAZrttb5nRjGP9ToiKJpXKklfddNmzoaKapcNq4M+uN+A5hAlmhJOs
 yH/w2ydyfCeOTe0s3uSG5CdiI78Z7gq3QO8KyfSrWaRdkLFIyZ5MsJzSt
 JahD0dJ9gRFBZMhabzB9rGeEhKfxmOjVHxxHtalAa0+Lr3soT9Nd07ev+
 BcKNryOT/pAeFvAISqUz+/yIAcMx0bc4hRCEs6fSY+ohsvnZEEzwq2U92
 wECFeTez6nomPaVJVTCiN7NYVHNOa+imYDVq8AO2doRy5CjkGLpDuK4o4 A==;
X-CSE-ConnectionGUID: 7MpBvgkBROexd35EsalPsw==
X-CSE-MsgGUID: g052PRVMQem+GvOH6XGslg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63699099"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="63699099"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 08:35:31 -0700
X-CSE-ConnectionGUID: 4MuZe7PZRoiEdKPavlaZEA==
X-CSE-MsgGUID: 8mjMbq0DTcmMMst7su59og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="185837872"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 08:35:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 08:35:30 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 08:35:30 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.56) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 08:35:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RyBwaHtiT782wTAmWkkdIwOZFq8MbYCaD4bFtcuiY2XV77/Be0KKiW2XI0WDRTzpbFOOKcE4TqHvz4d+uzzUGel8II+9iRidGDxfx9N3o/6L5k368Hz1mIjNYbiz7vyJLDvxiK0DIw7D50EVInB6cuaDNUuVtHSJEW4IFV3pyEAx4tJ4IxwsZQJRhH0XM0E9TNsn5BYiM9svHplAVzmS166s0v7LZLt/g0+50DHpNRV9lx7OV+FYaIlxScLaCMahX3fjSgJ912tFhkOFAJTP3mdFWS0eBjoEteC4sM4lgJITNbGXUv22LUM/3LRVk/+4QmnfQ541TU4FYIVglnEJFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R7HawmCzTk7k3UIAqfPxG93r3m+e8exO0yhwjUORcj8=;
 b=E+23n79kCm9NCI4V5dUNxtf7TyatF7/apLz/fPaK8epxTQbMaO/s+VuvHnC/4p8QxCFRDRCqyXftexqDBiYoAZ+B/RzBWo9Lkv/mfBFoYnOl9ZAKHHDYjnsPPGSVTb5rj+WVcDcFp127D/FberLhKjuhJMOU5GlWuDQ4YlkUJlBjy+SlaapVlTb10vvVSOlYcifAWXXCAMlW0Q5kxZwOvM4AdLKo7fT9norIK+nkyvJp6byOxdcrdU5yaOzsH69SsKB7ELJA0SftiQ989Yv5luPpSfblLrXeqpfy71qrTegi2vQiHVkF66tClNljLeiOGoDVM8mpCGReWR73axxG0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6956.namprd11.prod.outlook.com (2603:10b6:510:207::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Mon, 27 Oct
 2025 15:35:28 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 15:35:27 +0000
Date: Mon, 27 Oct 2025 08:35:25 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <tejas.upadhyay@intel.com>
Subject: Re: [PATCH] drm/xe/xe3: Add WA_14024681466 for Xe3_LPG
Message-ID: <20251027153525.GD5409@mdroper-desk1.amr.corp.intel.com>
References: <20251027092643.335904-1-nitin.r.gote@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251027092643.335904-1-nitin.r.gote@intel.com>
X-ClientProxiedBy: SJ0PR05CA0188.namprd05.prod.outlook.com
 (2603:10b6:a03:330::13) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6956:EE_
X-MS-Office365-Filtering-Correlation-Id: 87e49704-b34b-4ff6-b4fc-08de156e746c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xvAvv/GCweXofOqsKPSnLdWhMhEoEf0i1Oj6UxTS5kbLf225z9dSLknklk+5?=
 =?us-ascii?Q?nHr61QWjBokj30zOHvU1dJz5MxWomzHswqUOCOLPIRyZk9uTl9s99XwQytFI?=
 =?us-ascii?Q?9QawBbJ6LCmD8meg5bZrxPiElndGS65IJdGT+D7ZxD9goFBDk6fn0A4wXjmr?=
 =?us-ascii?Q?xDOY3OXNQVYtT+hY1bYQRTy3BStnTdybfhE5uN+6aDsXv6KUbVjtSWWfJegE?=
 =?us-ascii?Q?oCzMJrMscn7egMUcvZzvyY8e4UZTyXyJepvf55c5G8BD+uwJ1kIP46r5y5u5?=
 =?us-ascii?Q?pXi6fzYi05406MkiWbHsY155suJf0PljrGazU5fYXwY+lYz2RdvkJPTA9MI0?=
 =?us-ascii?Q?1xJsMj8NdD2gmwGWo5n60DrBHLoK5atAb0z6Y4Ngtp7cvR+uprk7qpQlb1lW?=
 =?us-ascii?Q?drC5SykUYkj4S++yXfdngo64AJBh8mV9SBm130Hsi8qHdvgoW+op2/Ka3YWF?=
 =?us-ascii?Q?ZsBYNqNpDUPAPGKDr0jYwHknqe7l26IpWETMeLLNVr/yvF9tCWjwdct499w0?=
 =?us-ascii?Q?SqBYXlCM81JiJvzW8DoXGXMbHtMn/mH9YvutodDwo80BCI2ZCnJQUx0jNP82?=
 =?us-ascii?Q?dhHvC7sAD/Z4Bpv29lgw5zjUXZ3p6oo2X4iwhPm0/cyS/RMFKi2BdOyTjB8g?=
 =?us-ascii?Q?WMEiNKb8ITxZrM10UMgzSfXq+aRnQCay+TYkpUw1AjEnrGfP6QTdGtnyjjXU?=
 =?us-ascii?Q?r6fBIaq4zY790pMWNGesAtrMK2NAE40MffTOWin5gMdRvv+RQxHv9ySVN/a+?=
 =?us-ascii?Q?GRDKLSlE5u9WKff/kxcHP+jEUt6fi052g5gHKN27Q41wFwGAfoMnzoJVXj/i?=
 =?us-ascii?Q?W07pdL+WTQBxVpyK54Lmq/UiJswwQiibuHstemTAcsdTyKiM1frVHGx2jM9e?=
 =?us-ascii?Q?mNPnlV9SxD+WJfn/xXX2uYiJwRLrje+p2ZEkeLzHSwe98TlxF34LMTH3k70c?=
 =?us-ascii?Q?TnJHZblqgX2UAU843jsPwMw4N3fNWZTfOA3YlpT5mQFUomO9FkqWL1dXOIuE?=
 =?us-ascii?Q?laFRpnd0Ln81mNwNmLD3TktcpUTX8P4jwnl6zzzTafMWoBXNuatKMevN2Xyd?=
 =?us-ascii?Q?NIJzX5Q1PLYIrfVwJpOxFMxGUcvdFeyDIpBShttJOKYmOg3S281FcwWRMI0C?=
 =?us-ascii?Q?aWG8UTjswWaRMbgnyMAjmfGgoXtZlckjdcz1MRzVSKxK8lgcaYoqs5qif6zK?=
 =?us-ascii?Q?vZ2HuNP2ZGbwbOKkQ/y4ode8cJ5qVZiEPTHJpFKNIBbJa6PjQFNLevcbnewy?=
 =?us-ascii?Q?llho0mZimtnwXUk6ChCRBp7CjiN6Yi4VWpzeb4AhYdlCUQEOE5ucVvt2HJf3?=
 =?us-ascii?Q?XxvmuCPgreEd9Z505QzQOgk/1jxzkXqzKqZPqLHU3cfdZOipNeZY1Y08u7Iy?=
 =?us-ascii?Q?yHd+D0nrKrYVz+Mbtews2/gfdZYf4Au5jSeJ9ABe4kkSCVo0rabj+2Lt6SJZ?=
 =?us-ascii?Q?ycMvPvk3E/yfcLTUqTd12pZ65LAbXaMZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sUhAQjImQOMD5HyHQy9Z0iow/7c/AyDZr5xbxhboGSUqFeWEyCdnArgtLUlf?=
 =?us-ascii?Q?botfIfNd34DywWK20XQ0kvzjEtiIhO3RPUIw1zq03obShuXymGKFvYuike+S?=
 =?us-ascii?Q?KjEGTW2irFT5CFefDRz4WBe8DArqLYEuinYeAbhJgs6sjSN1n8fJKPNRZ+f7?=
 =?us-ascii?Q?BTzzRuIuCF1LuQdq5ADgS2cYuZUyZAKtcm4aX8h8rCSZNWh0M2NMdfDM+rJ8?=
 =?us-ascii?Q?PuBQvsVitG142APBT3RUqoGK1y87NdogB8auLJ3G/LfNGrzFTseqxBb65niK?=
 =?us-ascii?Q?8W6hau4SNbm80egjUToJ03P7C/zjaSKzE3Q3B7vj1M7opREdoTmDo+t1eWtJ?=
 =?us-ascii?Q?sP2XMYV/qax2479j8/juqzxkk9pGhpMKajqUQqTwNfisw3XXRG7HumshIwg9?=
 =?us-ascii?Q?NAfZTlsEoz470SurQhXLQSJIl4ROpzO/YqHp3hg+UDdU2NrZbbuiUP4BSBkG?=
 =?us-ascii?Q?ohINSvR7FcIZeBbTDNNDN1F1ZBmi1V4c6bQv+Y5IvJfYa7x262bpAFXZfCjr?=
 =?us-ascii?Q?9jWOB9Eac9zGz/H5IcM0l776z6giHe/stXiBZcID+xpaB6JBnSnllvkLyn3O?=
 =?us-ascii?Q?8Y2YSa1PwcmOQkAzXAu2OT9NwfAouuj2cmWrJJumTlHqVROdsrhbNhfqIYqL?=
 =?us-ascii?Q?tgz7TutH57DBVUxUGWrQN4JjKdtLXR0CtbAOhtSoaHqJL+9WDd+JayaeauGu?=
 =?us-ascii?Q?rXdyXy5L9GBcuRrqwaQf3UN+AJpC3pkKfVB6HiXWCDR4kvgmxgHmu9A74LDP?=
 =?us-ascii?Q?JLwFueCzouKmXpdS9mqYqwZQExM4RQqyYf6hbneoY2ZU/xrAfEoWjkIHzGlM?=
 =?us-ascii?Q?UvB4OAvMH5Z4Uc78JPgWbNu0adcT68n/u//v5s5yozVqY/bY86cSL2pI5nyK?=
 =?us-ascii?Q?UhiA71dDsjrjgqyMUNvyQdzO/7Yf3SoXfEHSGwO8CMncSmU45nRUUfJKvrBr?=
 =?us-ascii?Q?SlClot5JBcWN/R4imQZpE6EvTXjnBpFTbVDy76Q/L+BnJ2en1nAaAptJl/Ap?=
 =?us-ascii?Q?cHS/M41aRuxI1/rfIj5nd2akYAeDDw4ClvpbuPNWCvBrNAldyufUHrX9iUy8?=
 =?us-ascii?Q?mfnKSTz++u+Pgw4sLIF3NvNxGRE7idQ+LPze63HM9aRzBQs9lz5OeRBf/4cl?=
 =?us-ascii?Q?OVp+eiZif7qSO8nrUrHufRzmG05KMQN9vtaVhsTatyVWCw53/Qm4Br14K1+w?=
 =?us-ascii?Q?C1k4jYd2s5bWffWaOGflncaOkajRa4xm4vK7yqh1iHB9gR3kOnpZahrBwzQa?=
 =?us-ascii?Q?H2pZRKRFt5+roPTyuCLaTMRXBF3jY/jMPQWIx+mxlUtgNTspnwFOz8oEi7c+?=
 =?us-ascii?Q?r4OFj0BxvctyVFMI5cfshF28OyFHIgjp6dYoFqX7QBPUbzA+VheMKZHjms2c?=
 =?us-ascii?Q?m1ArDfIj9QRkzoZ1DkaWVrBFLWVj5pZ8JF0Hvj0EqnSC4IN0uEVflZslKGKH?=
 =?us-ascii?Q?/bGe89i9y8X0ybjxCTPiUjvXXdVu6kKFkpgAUASmTN9KdJV9kIhCKJbiR9hY?=
 =?us-ascii?Q?gMYVXg6232VpYj3kanZ4lDFgl+K98aKK6T4OSwrkMP4dFP53KENRBfAskMMX?=
 =?us-ascii?Q?B5FapnkiHzE5IwUoO6h53vlnevHuDch8Wzd5EXAK4F5PDr308LEXCNEPwokK?=
 =?us-ascii?Q?PA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87e49704-b34b-4ff6-b4fc-08de156e746c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 15:35:27.8522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9XbVA1H/Ve48J8wZWEMgN8IJhxEBNcqTTb4+zKtuky/MxeKtZU6zFpbaF099DdT9ufOWgLd8U4jy5jMH0BfvYocLsDCTm6rzsAMzraWvfeQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6956
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

On Mon, Oct 27, 2025 at 02:56:43PM +0530, Nitin Gote wrote:
> Apply WA_14024681466 to Xe3_LPG graphics IP versions from 30.00 to 30.05.
> 
> v2: (Matthew Roper)
>    - Remove stepping filter as workaround applies to all steppings.
>    - Add an engine class filter so it only applies to the RENDER engine.
> 
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

and applied to drm-xe-next.  Thanks for the patch.


Matt

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>  drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 3545e0be06da..a895a8e801a9 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -174,6 +174,7 @@
>  
>  #define XEHP_SLICE_COMMON_ECO_CHICKEN1		XE_REG_MCR(0x731c, XE_REG_OPTION_MASKED)
>  #define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE	REG_BIT(14)
> +#define   FAST_CLEAR_VALIGN_FIX			REG_BIT(13)
>  
>  #define XE2LPM_CCCHKNREG1			XE_REG(0x82a8)
>  
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index b6dcd9827354..ec638b431131 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -916,6 +916,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
>  	},
> +	{ XE_RTP_NAME("14024681466"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(XEHP_SLICE_COMMON_ECO_CHICKEN1, FAST_CLEAR_VALIGN_FIX))
> +	},
>  };
>  
>  static __maybe_unused const struct xe_rtp_entry oob_was[] = {
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
