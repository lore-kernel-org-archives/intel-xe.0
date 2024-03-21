Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3C3C54E58
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 19:42:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1B3D10F9F8;
	Thu, 21 Mar 2024 19:42:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TJxABeqB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B683410F9F8
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 19:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711050133; x=1742586133;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ib29BqOY/oLyfLgM9GOL48e1Tv09y22LcUwEe5A5txI=;
 b=TJxABeqBdSpDt5FCNiMKS2HEPCmsX/i9YPxnk6+vFydtfCf3HK/6vlGD
 foAmB91GZ6LXChamDu1fX0Ht8Sq17mHptEkTSoWGiC6SntKmZktDC/mfc
 i7Ug/X6QU5gyqxMmfH6gz9INZ2UX/qZXcxJdrUvvT4oAQnfVCEt4P1etS
 czZhgvCKXmHAdTce8Nd27Ym99uuKWqOM9WiGO++nNJy4x9Pr61dK5X+DZ
 w99AW4kzBmC7x5fgs17I4CkTd2PEKBu99Bcssen4lDmZQ9ZdXEyGpg59u
 gjGGkzD5T0DFHQLWJA0MdMBkKZ5hVK6QC19TUtKzgXrK8F38N39+jKRM7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="5922593"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="5922593"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 12:42:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="45741934"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2024 12:42:13 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 12:42:12 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Mar 2024 12:42:12 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 12:42:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f8jYalwxgd0Zv0wJcY0aSxds74qBJMeBKPU4/+carIgr9RCXy/MsyhwvcLrumbdUIIeEhG0HeGGn4tdJkZVx+/rj2rkY4EDHcuzOk0hG0fGdHMm4Unl6PNz+AqgA82kbOO3g3v1F1UMcPEvGcjyUFYndsc5YBuaOg3yCHceHIzKv+rKatNExjQUpxSdsHj9xfDgePohrbcxjwW4xKUzki2pg3T+O2Y1GlITGWD/bei4hauMfT8HZqbO3+u34pbb3Lr5yR+0vlglyGsU8oViMDvNUmL5cOTgmpGdNDjkWnbXydC0J+bjeNURyyWfkOGSiwMtrWrcbk/Ip7TyuyqPZSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOTYGlMV3EwwOoYegS9usU5+k5d5oAK0Qv8KKrwVjbs=;
 b=JH47EXgcYJLIONiLd0jYZ1cT6e3RPqIZBSjkTwaJ+r4GS0VifNYrFb/NjnTH/qCIvmVQJr16ZVrJg44qLMT0/uLH4Kyo4c1P7OsgtOceHuWe4BjC9ZButseXnnmscje9ov+dAIamaB5Htyh3+qHQgYWe5WHdcct9nUOdnAWyaGnq2WJilQsi4A7eswcP3dSCyFVk0VrwtwzIjEec1qhoFcUOeNLfnDnAvaMjWzI0NXX8RxByYK73u8HIMJ62nA9SydqFnMCYvQL/o+Z8Tj6V2fTuYcwy3tPWQrtRpzJ9RFrkfoNrDd2IJkJXMfApTAeFp4iB9myVdyKhGvG96VvjRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7914.namprd11.prod.outlook.com (2603:10b6:610:12c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.23; Thu, 21 Mar
 2024 19:42:10 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7409.023; Thu, 21 Mar 2024
 19:42:10 +0000
Date: Thu, 21 Mar 2024 15:42:07 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe/xe_devcoredump: Check NULL before dereferencing
Message-ID: <ZfyNj45WtMMztLsH@intel.com>
References: <20240320052239.3249222-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240320052239.3249222-1-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR13CA0240.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7914:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e042765-fe8d-4e2b-e93f-08dc49deffc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q4/GtYkvzOaCaM4CM4d2YPagFHes1Sr7k9hHfpy8dYNKs0uHdsR0eAlnjzZUAQVnRwFbZoKq8afrZw34prJ/bqlIc1t2JUIB3Y/AVC58K1yzIyXC2Eahh3+Hg9xKkJR+HaC9Amie4V3f+1m++ceC1NNorakriPOjEDZQeYmq2ZH7c+xV0Qn2R3xiRf1QcM+Xxd0tVkgctHsYursf6CFW5qP9KqtSrgfK75ty2uwdh3zBLwUvRC0HQBtKDVjPezh3bZdBjYyUXorda3vZ3k9MIQyssNIousyXm25fK5aJl2zdDTNe8JxwWGv8tqhmNVN9+2Z/XWFE04xTjYUG6hR7AGDfu5423hRUIqgGxdm44Csib5H3CjbgU90KOnwCBqY8nYWE8bRHWSaqmr3BS864+CKtWpHrXXiY/pzCObpcxORykfdk9DABcPu000gFrmr7ICbMdzJqhN57DHNnUaSkmOAIH39z/3SkDoPVtFDDJBzERAoblKDBZuoj/rPwow/sTCeJ4D4uQ4GPs9L5PdaFb3iPD2f323MkOIb4lyAgHINKtnv2WXD6iWEP49KsELKVVpYKlqTTQhUjCtLqKoCRHdw9hai2ybT9cGaW6BCxvXcV6mSAWA77zMDT+8+6kSbaJwAjN3uKnHQab7zIGqJvudk+HVpyWhLlFIaLEj55rvI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A+m36Fc/R7mikSpRa2qMvm2SMTPkrK3fLFTbrbIk+uvgoLCOEmnKqQZJuuWa?=
 =?us-ascii?Q?kuAx6GLz2K3GcenVTBzKMnkJjtQI6h3GEiMnB7qyF1reiMeIwcixJ2ku2vxt?=
 =?us-ascii?Q?oAAcND9Pdozjqrjh3Lw8Zi2bZ0ggOv1M2VPxgvWPdNeSVKNrC0RLCq7+6AEX?=
 =?us-ascii?Q?RCd9AaGBLoEt62iI+WSBgF4hRgcPKjyTZmxmetCP+dzVm+rrGfvj2AnMT83L?=
 =?us-ascii?Q?xi7rtIa3Qtr8b39SXDOKUObu1b3wAcuhDBQcRSJtQMuWfhv/3mtzKuL5NDoG?=
 =?us-ascii?Q?WCUrpRiuOlM8dbrEBL/K/oG6HE6pnijgX/ICwHqczLH1ZCzPn4j2a4SxKWC8?=
 =?us-ascii?Q?pCyXb8mOHidmJmbHE1VSB7UW8xP50BHn+hm3OIVUsJnVWQny2xblTylC1SFu?=
 =?us-ascii?Q?qClnL89bmG4VfZkQ7SVxTJIaj4I+V0n1Gb6++kw9gGudmZu5P+9vU9b7Dy6H?=
 =?us-ascii?Q?6Y0vdmdgWfvu0wtv51jdfXNOfhxNctSBfv4NesGLBrmXCAbF32PbSu6L2HzV?=
 =?us-ascii?Q?SYcNFR0IgDanjKvNbR3Z1X+XRn1t3bVQlE0A1RZpVQOOJ2yQ3Dh7LytqARle?=
 =?us-ascii?Q?AdbRGdgSJyMIlcdz2fomkqwNDKb58CpFCy5Pa8Z0SjTCfLkHqAv8hi5+Ado1?=
 =?us-ascii?Q?jQN1Rore3zqf3ndfHMNXGch+8p9aYmf9LVkcOClR7BAIhXG39VU+ODN6o3Ij?=
 =?us-ascii?Q?PSJoc0bvqh0CgVyNKxve31ZSLRfyrPUotp1VTVwUJPUwpqDUJhqPr5X8/D17?=
 =?us-ascii?Q?PyhNaAsO2S1R8mJ4Z57kPTLA1CF5iaVHdQ1bunpkOJCOOBbC4VSUwMw+TH4W?=
 =?us-ascii?Q?ZRl7zIS/Lo5QyR2xQX7WbTlwBxDrBdHc3wwdNMPKDyqGlr5DlJ+MO2Q8tz7C?=
 =?us-ascii?Q?J1jw0t6qjTpp3O42AGJZbmKQU2Ew52TDfq8gKWm5uPuRV12xwUTrVuWr3zUF?=
 =?us-ascii?Q?JFd6Ecafwh6Ah3YmUpkDr4kNyAlwSOelkWrAgYv4flcoBvoIG/6by8LL1v9G?=
 =?us-ascii?Q?KxkOSXUwMFxC4lioSHv3Zkn0pQuLt5Oa7IVkogrb5VB5lQQJSuAni8992sZn?=
 =?us-ascii?Q?j/KXM+m3Za+eeSD8N4Lnrx2gZ1Nw8p11CCox7PHfHcWXSRlQ1Kopx0yc/Mtm?=
 =?us-ascii?Q?TxWwLm7cYmQ3207XjUdIsg2xfVwa3PfjLbXxbp6kExmCfO1blzMiXbTiAyJz?=
 =?us-ascii?Q?0SBqw6GLs2IdVqhhA27NbQAH1WCXc/98a2kdLu1WADE9zztSTDzSWT5umEDq?=
 =?us-ascii?Q?fK/obxCPyZO03qoklyduDy5k3Ogc4xOpiYmFopkV8c+og2bxd3urr3NTj3fE?=
 =?us-ascii?Q?bTKFd6y41OhmOlSdLA4EkHF0r6kDpI0/S63CRzv/2r4Atgckq5W5Kun1/JHm?=
 =?us-ascii?Q?2hacef+QmB4FKCkKuZJGjyi2MDc7oMxJ89rVNfdXMogbYiBcznZpUxceXN1M?=
 =?us-ascii?Q?3obgN+3a+J79nbMvu4Bb0Zt2jTHa3TQFNCAxQEmGLAfeGocXUM/6x5ICcddd?=
 =?us-ascii?Q?MFo92w2YuFDqsWs98u07FDGmqlh0QMjjd0vRmZVMZFOB8Sh6/+b3EqYhY8rY?=
 =?us-ascii?Q?qJ340J1huDlj/keksN0hjoknxtDZYeFSnn0yGYz0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e042765-fe8d-4e2b-e93f-08dc49deffc5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 19:42:10.4913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0UjxnhElqX4bamRAr+shReVQNnyA4Xep1yLFd/zF6KoHGVkPE5DfXg7rsvPo5XiYzlYBc2pvDS7hL8smc2L+QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7914
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

On Wed, Mar 20, 2024 at 10:52:39AM +0530, Himal Prasad Ghimiray wrote:
> Dereference 'coredump' to access 'xe_devcoredump_snapshot' only if
> 'coredump' is not NULL,
> 
> v2
> - Fix commit messages.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 0fcd30680323..83a1f3cd37cf 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -74,17 +74,20 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  				   size_t count, void *data, size_t datalen)
>  {
>  	struct xe_devcoredump *coredump = data;
> +	if (!coredump)
> +		return -ENODATA;
> +
>  	struct xe_device *xe = coredump_to_xe(coredump);
> +	/* Our device is gone already... */
> +	if (!xe)
> +		return -ENODEV;
> +
>  	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
>  	struct drm_printer p;
>  	struct drm_print_iterator iter;
>  	struct timespec64 ts;
>  	int i;
>  
> -	/* Our device is gone already... */
> -	if (!data || !coredump_to_xe(coredump))
> -		return -ENODEV;
> -
>  	/* Ensure delayed work is captured before continuing */
>  	flush_work(&ss->work);
>  
> -- 
> 2.25.1
> 
