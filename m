Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3854D6AB16
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 21:50:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01EE10F5A5;
	Thu,  2 Apr 2026 21:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KOIzfNxI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7DBB10F490
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 21:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775166649; x=1806702649;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XRu0887gGvracscShBD8HAw2dYj8E02/JkuR1Zb803A=;
 b=KOIzfNxIDll4dJ0KDWMc+Mt5MW3O/JRf2uUCJ6Av+p9ZZObqDYgh4I5L
 T6lugEcYeTjLLCin4y3Z7BA9rQcdKUYf5X3juzpd9QMahao7HQHpF/7Aw
 ch4BnLELbvpT9O2bI3wkAfaxxYOztTKc7pGiwCQuKrCL19X1jVoNmdJLA
 bFEQZr1M548yp3UhqwzV3F6RNbX6ipIj5NzwBN1NJRQR2iENi/H5jTR4h
 W/PmUJbZQPp4AGc4uuUETMY/gFp8IV0qBGjMFUkpin5L6vAPH18Hpi7t4
 qD+pSZxFrE5GqHmI5Su+G0g3+XDR72P9kavu0kp3P8wXB6d3gK8VgFBkR Q==;
X-CSE-ConnectionGUID: LcwhDetjQbWBooawF9g8Ww==
X-CSE-MsgGUID: 96WPvS6iROiCLRipx3B1mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76127165"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="76127165"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 14:50:48 -0700
X-CSE-ConnectionGUID: EQ/LSnEETqeIqnrk97w8Bw==
X-CSE-MsgGUID: JBwgEeSaSUCrzR12YIAP+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="223815003"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 14:50:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 14:50:47 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 14:50:47 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.11) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 14:50:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kf+w40G86shu5uUh7BI5l0Aib542SVPiNQC9AMdXeuY6G10096xvBMVYAKhq77SqxktMj0pjOAvMwS2RCeA/EdQsGh171Z39cf3WF+Lclyyc5BHRVorJ4JYj3qOExTOl+TcPNn3Az7JSRc8+jHCdJmTo5n4jkEQ+D1bJ408Par/NcyM4dSXo9/6eqsht1UwN3Eomdl6YLBmh3LhLl8skpHnDHJogsvvjSbIYuOHy/6ote3cvKxfWkVYpfyAlkXpTZdFoKlKeJS3hwrxPXGapJgfvJIW7g14AEjxdC/PGbKi7o5MTSHrwAgMabkgyj2+FLlyiD8/KxLOMi1dPPSHToQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LrT10VdPuoUqetQyDWVMnNcA6C0FQY1Ch/ZuTQZg3Cc=;
 b=hJOrCDv6ts+M55yXDbq6YbBBPd5k8JvX/4GEjASdRh7IWGCncVHHYWRAb6phe2tO0+V0C8GzK2/AmCAS5eHhJz0FDlh9qAnfUryT5wmvF48ZNPYgjzqxYYmrdugGnSa0lPtKVM3a4r9acM+uqA4mXMGvFLnzTtbYgjn/X31EBtCjyfPW9nK4oX6uO8dx9/SkoTRim2M5NmVfdNMH++cNSNNq1DH92UYeQmvz2TnGCp/mBEhKdrzDn3u4FCZNQJUydxr1cO6QBSAuJlnjCpyPd/O4W+Ob6goDU+CLsXd+6trRXNjKLwPjf7/5UiLJIVvxL0oYobM5eKOTaqxvf6oh5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM3PPFBADCE1465.namprd11.prod.outlook.com (2603:10b6:f:fc00::f48)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Thu, 2 Apr
 2026 21:50:44 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 21:50:44 +0000
Date: Thu, 2 Apr 2026 14:50:41 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <stuart.summers@intel.com>, <arvind.yadav@intel.com>,
 <tejas.upadhyay@intel.com>
Subject: Re: [RFC 07/15] drm/xe: Move ASID to FAULT VM lookup to xe_device
Message-ID: <ac7ksb6r259ILaR/@gsse-cloud1.jf.intel.com>
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
 <20260318074456.2839499-8-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260318074456.2839499-8-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0109.namprd04.prod.outlook.com
 (2603:10b6:303:83::24) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM3PPFBADCE1465:EE_
X-MS-Office365-Filtering-Correlation-Id: e9c479be-b0cc-4958-136e-08de9101e443
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: G9v9ReAcGZyr8rVAxDpNsqQljG56miWaSKPcV8zmKovwXXoQjhotEQ2tml57QYjk8Q8aVhSjdPI8haU3BSXBh1DcOnbqCm6+EbTZjLX8n8aEB1UFRyxdx+6eMhaaqFIYoUhgoTQZ1O2BClx0UDKH8OFUDb7xaSGEhSYf4yMrmF3tsOlKoWSxNCVRxqK+2dbLQ5xbxZowlR/obeVVw7iGUBNgtee2tz1fNRx2CZO+bGrg40gYLpYiaI9GOlUbAwKk7JeKzW2K+ERNYB5XLZ82Qo0clkTVlWmlZmImxenL2xSEJXoYChnGnzxSvahD6g4j5zoOfrgtL6nUe1b7C/+MpFPMsKO60ctC3ikefTT0FfFnbaaWdxV4VK+Cci3xSIzUeUZ7RiN8mbxCRt1GndW9b172UW0s/0CxdX85PoLJSiXFqVMcvtVe4ahHKyh9MFJYRDQ9bxtL0SR3ZjQ29FIFlVMEbVeb60Ph5v6EEr8eUvWS8NleeP2+gTw1n7CYYsJlk6OkWqshF4VJAOKwrHMSoJPsv8R9b7PZ77uxiJPMGXsmf3YtnvbCoeVsi9bgsU1FIIKnhEcrMV3/OWOr5obFs2ZPiIKOtpEQ5zR1TVgx++tKyDvqFK57i0Fg+p5LWXRHu5f8pBUvAVk4uCxL3Qn1+FlT59Yl6g08hgXKJnh3uzhckg3Nv7VIUms9bp+ksY+dnAvcMcV8JY8KlYA5IB0Uz0LIiZPMFse77ZtuGLUIBwg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?02R0VSo1oUF+/kxF2XBjKHZOTbLYktXiCpfZVSN+5GFwZJqW8/fp8dKpGQN4?=
 =?us-ascii?Q?QFhTn/WhtntvExBvEYuo7AcZOGqcTDAZyepAVgYwz0MTVHV/htGqERhUN6MZ?=
 =?us-ascii?Q?Sq7EeNqk42i+HXawPPYdvO6x5XMpIjQXuyZUIA9HDbAWdhPdTkAULMdpJaGw?=
 =?us-ascii?Q?qsJuNpBLJf7HIqFwq0kcYMybTM6oU2qSlgISadHLDoy6LQCn+tZY3gDHYckk?=
 =?us-ascii?Q?8zOCtP29HIO9XGB7KpRiE7wfxOsdjIaHqS3sxXUkboHs0rMc7B1SdVBRQoN+?=
 =?us-ascii?Q?Cie7BJpk1F835ATVYZR4s4RhDBfTnBGgBsGavbJ/Kxd9mvdZbTfFrUVEiOSI?=
 =?us-ascii?Q?b3jUuiSc0qlSHuObt3EUePSS2v8kyaw9nl5ftLAJZVQ0+29J6KV5rHCN+G9I?=
 =?us-ascii?Q?yZaD/IJSNqEi6WOwqO1xIaOLiQ5OdgBjVBKigTbQ0kA88heT0jF9Y3v/Pdz8?=
 =?us-ascii?Q?zeOaUZMrIl4qGVQCZSCWqRji20YCfWDXCddD0yUjPYCpD2suEccTucm15Vhb?=
 =?us-ascii?Q?zmEg7y4tk9CuAHCYaA3auGn3Rgtu2VrKe76DGycB/khPYkuFt6iKKBsvrREF?=
 =?us-ascii?Q?zlBIMgw8638EjcPKrDi/0guuutNwOA8eiomxHjASNK0IoNa9XHHZvcCQ1QBN?=
 =?us-ascii?Q?jC+yyd9jyBF+ML+a+XRZQhqroakW72qQQobQ/pu2SpwGtvKkiQWvsJxjbZdA?=
 =?us-ascii?Q?J51F6U7ragaw+T54jeYHVM8dUjwl5HgXVfUgpcmefOFmQGIV4XqF3q9gpXpm?=
 =?us-ascii?Q?ZV1wMO+HpWea50uvpwmtiPuaPb+KZYbroYpUueLLXwzNfeiHt7rL/Hcf/fsn?=
 =?us-ascii?Q?X+j6mfMQg7hzoqbdRygjMYkWXr8BBXLnveCa1dqvJVRhUuITPhO4ZPUDWLOx?=
 =?us-ascii?Q?26u49wCP7O1ibugX/j+cpHXCAVmh50LeTfdVZZ7azPGNrWl0ur4Y0ka/WTRV?=
 =?us-ascii?Q?7ColFy2J59az4X8yyO1sRnyfJT5DKl5wGXNArnzRS4epOEuyw+B8Kg5L28Rl?=
 =?us-ascii?Q?e20Iu47be684Ph+DJwSh3lUGnSu3c9ttF7pH+4bqknocmdER7Wgz3BCbJ0Ub?=
 =?us-ascii?Q?lEtRQ4LANGucgk64zN/ej7wQfRqpy77CYi+HkRkVYNEyz4iIi/YCUc+oi0Hl?=
 =?us-ascii?Q?/7T+AcYmAX6rZ6HjD6NMfVTKxoto/6hRrZDl7ijK8etXgUKrzeBaXdf+Y/wj?=
 =?us-ascii?Q?zJnKR2Br2iv10oO2z0j3mNUE1bsBnzz2Izqa3ryMCSSUbbHybifnflzSoQvx?=
 =?us-ascii?Q?NtiYXEfxdCg8+MJjXB43mY2ewMOaAI7kJAMGEPvm2ct00mO0My2oSyL9J60/?=
 =?us-ascii?Q?UUC+pmEAIF80Dh/j7nx2npjOM6Ez0dVS74/wFOH6bCLDvc+Xg20VXwlzFRZP?=
 =?us-ascii?Q?+ca1yeli5g7Zu0t8r7Tz3+/2Zs4EFpGBgmhk+5P3BaciPMuVrKR7jLgMqHEL?=
 =?us-ascii?Q?LizBM+brX2qa0kCFiz1zl8fCvMCSzN8nx8PdFf0dSbaKeTNGhRrQiYg+Naos?=
 =?us-ascii?Q?fSl0tMaFFAoVX7yo9gfEASVHI4WC5wQj3lcurFZuqIncik5oHF/cd1qeKZHZ?=
 =?us-ascii?Q?224BrbL0fz8gIabTnIGXi2SYMjz8iFOaSQgvrgtzHN1EM9T4lMVoigVp5r2g?=
 =?us-ascii?Q?Q/QaRXBYYb5pBiPL2bHjkU0HM769h+1dgMzU+gWLnueDM3uft6XXodvW2FRh?=
 =?us-ascii?Q?yeGMlzhZnrZAervJXx1CG+vtCg31fVWFwrmMqZN4AYe7jsFvNR84v2zw2zIu?=
 =?us-ascii?Q?wh24VWotGQ5ToYWDCR0paIcdPDVqF1M=3D?=
X-Exchange-RoutingPolicyChecked: kCIdL4hO4A6aWFwy7u1wy59cnten4rUwoUe/OD5zAl9AWhPMBig2AXSriDmFT19Y+Hi/tWl4MWpwjix+38C8VCa+B4KXQ004gEp2vUhQJSbUlF85YERF0LlI8lW/F/dCpvPts7aBYeRGxtIgCZAcuZBDGuE1go3OA8GmSRzrluP7c9VX86Ss5uDO5KI1xLZx2Uf/zk4bea/ap7AbjAIf/P921uCnaW54au6Gy5tl7R6XwJFLg4rc9iLbuEw66RDW+T1b0mO8Qdc/0+G32AM3+Ef3DSewT9kFykV8K7uSROEn+u782ngSqUsLr/8/bCPWUUIydVHdathhnWgkwwjM2w==
X-MS-Exchange-CrossTenant-Network-Message-Id: e9c479be-b0cc-4958-136e-08de9101e443
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 21:50:44.5461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9yhx28Rsw9kH3b92Rr4gi/LTgSag64L4N3rVb74JhlsHhR3HgEOEqV6qKVEASD77268Soa5JjflVdvncdR0ykQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFBADCE1465
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

On Wed, Mar 18, 2026 at 01:14:48PM +0530, Himal Prasad Ghimiray wrote:
> Move xe_pagefault_asid_to_vm() to xe_device.c as
> xe_device_asid_to_fault_vm() for reuse in access counter handling.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c    | 25 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_device.h    |  1 +
>  drivers/gpu/drm/xe/xe_pagefault.c | 16 +---------------
>  3 files changed, 27 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 8773c2d2f69a..ba2f0e345257 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1399,3 +1399,28 @@ struct xe_vm *xe_device_asid_to_vm(struct xe_device *xe, u32 asid)
>  
>  	return vm;
>  }
> +
> +/**
> + * xe_device_asid_to_fault_vm() - Find FAULT VM from ASID
> + * @xe: the &xe_device
> + * @asid: Address space ID
> + *
> + * Find a FAULTING VM from ASID and take a reference to VM which
> + * caller must drop. Reclaim safe.
> + *
> + * Return: VM on success, ERR_PTR on failure
> + */
> +struct xe_vm *xe_device_asid_to_fault_vm(struct xe_device *xe, u32 asid)

I think the recently merged xe_pagefault_save_to_vm() function can reuse
this function now too.

Patch LGTM to though.

Matt

> +{
> +	struct xe_vm *vm;
> +
> +	down_read(&xe->usm.lock);
> +	vm = xa_load(&xe->usm.asid_to_vm, asid);
> +	if (vm && xe_vm_in_fault_mode(vm))
> +		xe_vm_get(vm);
> +	else
> +		vm = ERR_PTR(-EINVAL);
> +	up_read(&xe->usm.lock);
> +
> +	return vm;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index c4d267002661..e746f5c7cce0 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -209,6 +209,7 @@ int xe_is_injection_active(void);
>  bool xe_is_xe_file(const struct file *file);
>  
>  struct xe_vm *xe_device_asid_to_vm(struct xe_device *xe, u32 asid);
> +struct xe_vm *xe_device_asid_to_fault_vm(struct xe_device *xe, u32 asid);
>  
>  /*
>   * Occasionally it is seen that the G2H worker starts running after a delay of more than
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 8c159e3512ee..a4ee9393e4af 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -121,20 +121,6 @@ xe_pagefault_access_is_atomic(enum xe_pagefault_access_type access_type)
>  	return (access_type & XE_PAGEFAULT_ACCESS_TYPE_MASK) == XE_PAGEFAULT_ACCESS_TYPE_ATOMIC;
>  }
>  
> -static struct xe_vm *xe_pagefault_asid_to_vm(struct xe_device *xe, u32 asid)
> -{
> -	struct xe_vm *vm;
> -
> -	down_read(&xe->usm.lock);
> -	vm = xa_load(&xe->usm.asid_to_vm, asid);
> -	if (vm && xe_vm_in_fault_mode(vm))
> -		xe_vm_get(vm);
> -	else
> -		vm = ERR_PTR(-EINVAL);
> -	up_read(&xe->usm.lock);
> -
> -	return vm;
> -}
>  
>  static int xe_pagefault_service(struct xe_pagefault *pf)
>  {
> @@ -149,7 +135,7 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
>  	if (pf->consumer.fault_type_level == XE_PAGEFAULT_TYPE_LEVEL_NACK)
>  		return -EFAULT;
>  
> -	vm = xe_pagefault_asid_to_vm(xe, pf->consumer.asid);
> +	vm = xe_device_asid_to_fault_vm(xe, pf->consumer.asid);
>  	if (IS_ERR(vm))
>  		return PTR_ERR(vm);
>  
> -- 
> 2.34.1
> 
