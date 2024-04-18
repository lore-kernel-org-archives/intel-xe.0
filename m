Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52945C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 10:44:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B75113B75;
	Thu, 18 Apr 2024 10:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L28Dd8bN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9862C10F219
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 10:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713437083; x=1744973083;
 h=message-id:date:subject:references:to:cc:from:
 in-reply-to:mime-version;
 bh=vgrAKBZFzFy8woB+fb5FgV2G+O4EAHxqRIzZ0wxTv+g=;
 b=L28Dd8bN5jrs11bragq6B1Aq0JHYicSArK/OYnFPtNToHrNXFQuTDLJu
 MbDEvIrFzah5jfX8qQaxp1dis1MCk7/yM5pVHE7dyWEemEIaeqa4rG8XK
 FvsleJmKSoA8ZgigPUYuE+MXI3RsLoCuXKoks1A23SagZHrOt8rEUZCjX
 HAzCphCCV70NL3FNk5zj6/L0lOSzTemyQlRLCubYCiiWDos5NLMMwZxEo
 wunRMc0cUXf0cs+T7lXk4JQCCJ0ahwraPWJlfLp1CM2JWBK4LZv1+m6Dz
 EGU5H52bQZoAxMHfsRVtDqJiJoZ2wBDCwW3B1ncTN6oC9Uddv6mh6S7L1 Q==;
X-CSE-ConnectionGUID: RW1e3mqVQjO8W5C92mr6mQ==
X-CSE-MsgGUID: ZFpXXbP8SxaCzMALepDshQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8848932"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208,217";a="8848932"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 03:44:42 -0700
X-CSE-ConnectionGUID: ihiBwNidRSuhqerpXD3J9w==
X-CSE-MsgGUID: 2hrRyH8eQIG/M+xgTx/YXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208,217";a="23034681"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 03:44:33 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 03:44:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 03:44:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 03:44:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPWKhTkBTzkZZvgERSSqDkAvwV9knudEglyVC0lPxkP3CQjPgnZV7bEaVwhnFh/BT5Mwp0L5buPsDi4BDPHkH+D15RFjuCBh8SELQIv+y4luCcBHgQAixYhXVoGx7gT5xMy+NaEVYa3afKo6mndXJSmxwHbn+QOPZqrWXbUPLAtPvSWfOEguysPBboxjq3R2YzIcvkLsUqIqtFH+rWVn+Ap11le4ZRRXW/tLvwo/huQDYQzLMfvOPPKc29P/FDBQf1WxzwobOMw0JAZ9+esjmcMV/PbhaOZjRxvHmR6VzAheX3FbkgX+q0Rfzx4Bf/9GAJnUzyyKeRU4tYZIIr08Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=erWeFbi2ZbgAZ1fbBdrM/MJPmwKJKncKhoSDX65FMJk=;
 b=fi6Mpu3+ITzf+k0gqV1Ra68dI9xoFbqSE+GHDkFmQpm3MhauXCY7np8JcWc6CKuzGXcwaNg6D5kuv2+k4epBKSdwDP/Gwm8uJ9PiWRnfw7wgPGBCxxw1gYKqEGpzrNoFV1slT8VGox9i5+Z88gf150srsGnUQw1rcCYHHFDEJ/aV0LUxhwIaNto62ouip+KYWT52UNgi4PVvxZcFQ0M9T5i1UO+KtpPgnUdxFADdFVDYuHuaSAAwzMLbV6bIuJUnHMsjtsgCNK77E1LqTlOisps2+5w3Vx449WWiCmL38gb8+J4OCVWET/sdAmLA8QvQL5Hyx1byTu0aRxN39mruxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH7PR11MB7516.namprd11.prod.outlook.com (2603:10b6:510:275::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.12; Thu, 18 Apr
 2024 10:44:30 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 10:44:30 +0000
Content-Type: multipart/alternative;
 boundary="------------y2IH6I5DbUynyJL8myjPD26q"
Message-ID: <8fc9bf18-f3c1-402f-82b3-65e8268cce02@intel.com>
Date: Thu, 18 Apr 2024 16:14:23 +0530
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/4] drm/xe: Introduce the wedged_mode debugfs
Content-Language: en-US
References: <b8c12b29-ecc1-42e6-9329-0c8e466472fb@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Alan Previn
 <alan.previn.teres.alexis@intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <b8c12b29-ecc1-42e6-9329-0c8e466472fb@intel.com>
X-Forwarded-Message-Id: <b8c12b29-ecc1-42e6-9329-0c8e466472fb@intel.com>
X-ClientProxiedBy: PN2PR01CA0012.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::17) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH7PR11MB7516:EE_
X-MS-Office365-Filtering-Correlation-Id: 29bde2dc-69ef-4105-fe55-08dc5f948688
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: n9z1vYdiP2ffLTLVDRLUezFbci2xvWH0PoOskFnf7HRI32VBEbMtW3eaNInsFr5jtN9WJ7wLex8smMZg7FZ4IHVViVZqcWfwYYCDnuMctQeVfAXtsd2qgxoUdgTkzsalnRwQTLYbrxnxeb7LLt5GX53ItO/cHDxGfWGbgzW5StKwTrhkyVCTCNVTMxj9GlRhalW0NXVcIOUl0Nyz969mkry3uztW5e61bzBZkcKCnOQCx0GnKYoD5M5p1CWw3NqeKEOwX6f/oOvjWV6jnir+pSOmKQ5SS9PXIIhmK4vL5oNdDjKgEHkQhLiSPL28SK8+NZesDO1fxUydR0c47rgezwmIUyt5iTb5J22wLm+dw6bUCrkCMXoukR0muPmfTCeiK5H+8OIRq/vY1VKWnwRJPk8S+7+ZLzH1g6KKyHS1KiNE+DxQ63bSOn3XL5foW4Tj9iDSqljlhtClEK6twnborKkmf842VfoK60Ge6T5+YXLXRLLW6pScmz5skU3QMuamV8i1kaT2zgN8ogvnkd6Erus9uFlbQ3YTfl+N1dhoFNSKNWoeW/OMkIZd1bM/T/s6o4hxT9XvLNk8AZwENqHG+7kblffLS6RhnOjzUHA476nEM4bLIwP+O6Bo/0vYKL1aWKNzh8MMqAAZD1mOC1jcA+Zv4yfiWscSel0q9a+Vh+Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUljY1dETU1hS0UxeUZ4M05ndWVrSzVvK01UNXMwWHBVZk1FRlRoZW54V29x?=
 =?utf-8?B?Ukhza2xBU1pMVGFrYjlXS09xeWFWYlYvRm5zM1NCY2o2LzFpeXZUU2Uwbk8y?=
 =?utf-8?B?d0dJOG9jOGNDNXhiNHhPVW50ZUlSNkl2NGxrN3BMaHcza3ZWMk00dDJuZkZP?=
 =?utf-8?B?OVVhMVY3S0RHT0VDWmlXeHdsVVJUMzFkSTJtNWxSVjRFSzI0QWFQVUJENWV5?=
 =?utf-8?B?ekhyRXM1VkJNM0twN2x6VDJYU3BHYnM1Zi9kT2pFUS90clB6QTBDSSthOTd2?=
 =?utf-8?B?T0IvcVIzeHRaT0FaZDdudzZyRFZITGQvSkpKSEQvZ0xBTWpzaFp3Q1VFLzZT?=
 =?utf-8?B?dmtEQ2d3UllXRXpORGU2RGt5TlBZbU9pY0ZsbTkzaXlla0Q3cEdHSTIycFVv?=
 =?utf-8?B?UnFqanpPOURXMkM0b0g0OWhWcjBJc2lTdGtwTjNJak9iTGRlT0VWb3U1emtj?=
 =?utf-8?B?clZwdGpnQW4xWk5Wc2RVazFrdG9sRnROUGlXSmlHem81aktTTDVMUTNEZEkr?=
 =?utf-8?B?Skx3Skg4dUpqWmg1dXFrMXhma29haVNkMHRvUktzYnN5MGFWL2NLUi8xQ1JK?=
 =?utf-8?B?OUZLSXc3TndEUVlzazFnL29mdHp1VHVPWUszaFd0V24rMzYxK3JrVXNGZmtU?=
 =?utf-8?B?dkVLbUF4M1JiUGxHVzk0UTJPdDBPVlJsRUtTY0dSRHoyZTcyZVU5VllkcENt?=
 =?utf-8?B?SUMzQnR2ZVBVZEg0aXA3Mmx6MWZOWVN1aUZPRlo3NXZ2N051MTRDbXlWNjl4?=
 =?utf-8?B?Z0ZqTGJmeENESjN0Ujh0aGcyQldTRXpSM2hRY1hPalVhZmJmT3VvK2dLQjR0?=
 =?utf-8?B?L256dUZJT1VxSTkxLy82UlEyK1gzR1gyRm5UQVpZc01qUnl6a1gvZlZmcHo4?=
 =?utf-8?B?ekxJczAyQ1BnZS9RMUtCUWd5M285OTI1QlQwRmt6UjNnQmFPV2N2Sm4vR3R5?=
 =?utf-8?B?dE16aDJDL0RJVW1XWGk4ZDN6WUd3amhiSWcwVU9PTC94N2c0MCtFYUhvSjMw?=
 =?utf-8?B?SDFUQVdhU0hRVDBwa2RISVFhV2JMQ3JITC8zY2N0M3VYZzBXLzdITGFPOSs0?=
 =?utf-8?B?WFJMWEdqMUxSWTUwSm8zL0VsRkQ3QVNPT0lGMFJ2SVgvT1R2NE1BU1h2cHVi?=
 =?utf-8?B?bnhaNzZhL3JjbWs2OWM0dG1SMWdmcmw3RUU1MEhOZ0hFWUFxU29SSERlZ1hj?=
 =?utf-8?B?REpnZnNrNDdYak1JMlY3R242ZVQzRmJqV3NRL1JhdE9uTW1jTktPWjV3UVZZ?=
 =?utf-8?B?RzZiVktINGJud3d4N2U1L3VuTGJwQTNMcld0QUd6MkJKbURUYzFDd01uZFNu?=
 =?utf-8?B?T25zYlNaTUc3RlpoaloxK28xM1RKbUovdUFCWGRUT2dRYjNoM0FIZlhicFZS?=
 =?utf-8?B?RWZnSGdSRS9PMXBzdndGeVA4cGZpWkRzblQvaHdDelJWc21wOHJnTDJpWm9N?=
 =?utf-8?B?RFNrNWx4UW9uSlhHd2ZSaEV0UDdkOUtjWDl0OUx3VjN5TWJNZ1p2Z1BBazFP?=
 =?utf-8?B?SFhscjBMcGNsaVZJMEhaYlFCNU1uRVRrMHdHWWlwZU96RlZZREcyMXhwQ1Vh?=
 =?utf-8?B?V1QvZVJnQjRMU1pDbzNsdnQyQTVrSERsRzc2bk42YXc1SnJIYTh4TUIraXdV?=
 =?utf-8?B?dGRIYjBPMngxYW5JQmZlZFZsRDNOVFVwbzNhSWpLbkM4NStqZzY5YmRJcG9a?=
 =?utf-8?B?VzZpa255Ums0cmRmZWdhSHpBTGhXZ1Rnb3NKWXd1d044WWpzT01RdkZubm9u?=
 =?utf-8?B?dUI3ZUswb0pMZE5QVVF5SWhGN1ZPVkxYRTF2cm5nQlFKM3c2Ui9kZnh0S2FB?=
 =?utf-8?B?ZmVKamJ1QmRHVVlVNXVDdkNUQ3A0b0l4WCtkQnZxK2tKOHo3aUo1SFZuZVBJ?=
 =?utf-8?B?T0hjdEhPaytwRWZXOVVXMDZpdCt1RHJRSVRHTlhkZW95Zm13WkVsRDR6MjJs?=
 =?utf-8?B?SGJqSUt6V2Vpbk9tcmVJWVMwMGlwcWpEUzR6WXlTWEhwZHdoVk5rR0lpbEU2?=
 =?utf-8?B?OE1VMkdTNzE3V2pOaVNvdndLZFRvWFZoV1NxK3U4eFl4eTY4OXVsaGJZajRs?=
 =?utf-8?B?bFFJYTY2djlTaW4yVWlMcXVFNjNGa0pDUElOWDFvdmFDd1JGT1VNRG5OdDI5?=
 =?utf-8?B?TGcvb2ZrWXM0YXB2Nnc2NHRBR3JlNHk3UHlBNk50aVJVUStxNHNuZjdtK0xD?=
 =?utf-8?B?WXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29bde2dc-69ef-4105-fe55-08dc5f948688
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 10:44:29.9725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wg41xS/SASSBz1HALaFhS1MvGIdT1Q34F/tcPeRGMlkOpgIkcGIFGAzt+1teP/Tasg1hgZNVTN325vtJegyh3uCAeQyEU577G7H/tAQmuUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7516
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

--------------y2IH6I5DbUynyJL8myjPD26q
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

It seems my previous response was only sent to the email list.

On 10-04-2024 03:45, Rodrigo Vivi wrote:
> So, the wedged mode can be selected per device at runtime,
> before the tests or before reproducing the issue.
>
> v2: - s/busted/wedged
>      - some locking consistency
>
> Cc: Lucas De Marchi<lucas.demarchi@intel.com>
> Cc: Alan Previn<alan.previn.teres.alexis@intel.com>
> Signed-off-by: Rodrigo Vivi<rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c      | 56 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_device.c       | 41 ++++++++++++++------
>   drivers/gpu/drm/xe/xe_device.h       |  4 +-
>   drivers/gpu/drm/xe/xe_device_types.h | 11 +++++-
>   drivers/gpu/drm/xe/xe_gt.c           |  2 +-
>   drivers/gpu/drm/xe/xe_guc.c          |  2 +-
>   drivers/gpu/drm/xe/xe_guc_ads.c      | 52 +++++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_guc_ads.h      |  1 +
>   drivers/gpu/drm/xe/xe_guc_submit.c   | 28 +++++++-------
>   9 files changed, 163 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 86150cafe0ff..6ff067ea5a8f 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -12,6 +12,7 @@
>   #include "xe_bo.h"
>   #include "xe_device.h"
>   #include "xe_gt_debugfs.h"
> +#include "xe_guc_ads.h"
>   #include "xe_pm.h"
>   #include "xe_step.h"
>   
> @@ -106,6 +107,58 @@ static const struct file_operations forcewake_all_fops = {
>   	.release = forcewake_release,
>   };
>   
> +static ssize_t wedged_mode_show(struct file *f, char __user *ubuf,
> +				size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	char buf[32];
> +	int len = 0;
> +
> +	mutex_lock(&xe->wedged.lock);
> +	len = scnprintf(buf, sizeof(buf), "%d\n", xe->wedged.mode);
> +	mutex_unlock(&xe->wedged.lock);
> +
> +	return simple_read_from_buffer(ubuf, size, pos, buf, len);
> +}
> +
> +static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
> +			       size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	struct xe_gt *gt;
> +	u32 wedged_mode;
> +	ssize_t ret;
> +	u8 id;
> +
> +	ret = kstrtouint_from_user(ubuf, size, 0, &wedged_mode);
> +	if (ret)
> +		return ret;
> +
> +	if (wedged_mode > 2)
> +		return -EINVAL;
> +
> +	mutex_lock(&xe->wedged.lock);
> +	xe->wedged.mode = wedged_mode;
> +	if (wedged_mode == 2) {



The transition of |xe->wedged.mode|from 2 to 1 indicates change in 
wedged state , yet the GUC policy still retains engine reset disabled, 
which seems incorrect. How about calling 
|xe_guc_ads_scheduler_policy_disable_reset|for both modes (1 and 2) ? 
For mode 1, this function will reset the GUC policies to default settings.

If we agree on calling above function unconditionally, it might be 
better to rename |xe_guc_ads_scheduler_policy_disable_reset|to a more 
suitable name, as for mode 1, it won't actually disable reset.

> +		for_each_gt(gt, xe, id) {
> +			ret = xe_guc_ads_scheduler_policy_disable_reset(&gt->uc.guc.ads);


Given this debugs, where users have the option to choose whether to 
disable engine reset before submission, is the modparam introduced in 
[PATCH 3/4] really necessary? This also ensures post rebind we have 
default policies.

> +			if (ret) {
> +				drm_err(&xe->drm, "Failed to update GuC ADS scheduler policy. GPU might still reset even on the wedged_mode=2\n");
> +				break;
> +			}
> +		}
> +	}
> +	mutex_unlock(&xe->wedged.lock);
> +
> +	return size;
> +}
> +
> +static const struct file_operations wedged_mode_fops = {
> +	.owner = THIS_MODULE,
> +	.read = wedged_mode_show,
> +	.write = wedged_mode_set,
> +};
> +
>   void xe_debugfs_register(struct xe_device *xe)
>   {
>   	struct ttm_device *bdev = &xe->ttm;
> @@ -123,6 +176,9 @@ void xe_debugfs_register(struct xe_device *xe)
>   	debugfs_create_file("forcewake_all", 0400, root, xe,
>   			    &forcewake_all_fops);
>   
> +	debugfs_create_file("wedged_mode", 0400, root, xe,
> +			    &wedged_mode_fops);
> +
>   	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
>   		man = ttm_manager_type(bdev, mem_type);
>   
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 7928a5470cee..949fca2f0400 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -445,6 +445,9 @@ int xe_device_probe_early(struct xe_device *xe)
>   	if (err)
>   		return err;
>   
> +	mutex_init(&xe->wedged.lock);
> +	xe->wedged.mode = xe_modparam.wedged_mode;
> +
>   	return 0;
>   }
>   
> @@ -787,26 +790,37 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
>   }
>   
>   /**
> - * xe_device_declare_wedged - Declare device wedged
> + * xe_device_hint_wedged - Get a hint and possibly declare device as wedged
>    * @xe: xe device instance
> + * @in_timeout_path: hint coming from a timeout path
>    *
> - * This is a final state that can only be cleared with a module
> + * The wedged state is a final on that can only be cleared with a module
>    * re-probe (unbind + bind).
>    * In this state every IOCTL will be blocked so the GT cannot be used.
> - * In general it will be called upon any critical error such as gt reset
> - * failure or guc loading failure.
> - * If xe.wedged module parameter is set to 2, this function will be called
> - * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
> - * snapshot capture. In this mode, GT reset won't be attempted so the state of
> - * the issue is preserved for further debugging.
> + * In general device will be declared wedged only at critical
> + * error paths such as gt reset failure or guc loading failure.
> + * Hints are also expected from every single execution timeout (a.k.a. GPU hang)
> + * right after devcoredump snapshot capture. Then, device can be declared wedged
> + * if wedged_mode is set to 2. In this mode, GT reset won't be attempted so the
> + * state of the issue is preserved for further debugging.
> + *
> + * Return: True if device has been just declared wedged. False otherwise.
>    */
> -void xe_device_declare_wedged(struct xe_device *xe)
> +bool xe_device_hint_wedged(struct xe_device *xe, bool in_timeout_path)
>   {
> -	if (xe_modparam.wedged_mode == 0)
> -		return;
> +	bool ret = false;
> +
> +	mutex_lock(&xe->wedged.lock);
>   
> -	if (!atomic_xchg(&xe->wedged, 1)) {
> +	if (xe->wedged.mode == 0)
> +		goto out;
> +
> +	if (in_timeout_path && xe->wedged.mode != 2)
> +		goto out;
> +
> +	if (!atomic_xchg(&xe->wedged.flag, 1)) {
>   		xe->needs_flr_on_fini = true;
> +		ret = true;
>   		drm_err(&xe->drm,
>   			"CRITICAL: Xe has declared device %s as wedged.\n"
>   			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
> @@ -816,4 +830,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
>   			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
>   			dev_name(xe->drm.dev));
>   	}
> +out:
> +	mutex_unlock(&xe->wedged.lock);
> +	return ret;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 0fea5c18f76d..e3ea8a43e7f9 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -178,9 +178,9 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
>   
>   static inline bool xe_device_wedged(struct xe_device *xe)
>   {
> -	return atomic_read(&xe->wedged);
> +	return atomic_read(&xe->wedged.flag);
>   }
>   
> -void xe_device_declare_wedged(struct xe_device *xe);
> +bool xe_device_hint_wedged(struct xe_device *xe, bool in_timeout_path);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index b9ef60f21750..0da4787f1087 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -458,8 +458,15 @@ struct xe_device {
>   	/** @needs_flr_on_fini: requests function-reset on fini */
>   	bool needs_flr_on_fini;
>   
> -	/** @wedged: Xe device faced a critical error and is now blocked. */
> -	atomic_t wedged;
> +	/** @wedged: Struct to control Wedged States and mode */
> +	struct {
> +		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
> +		atomic_t flag;
> +		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
> +		int mode;
> +		/** @wedged.lock: To protect @wedged.mode */
> +		struct mutex lock;
> +	} wedged;
>   
>   	/* private: */
>   
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 0844081b88ef..da16f4273877 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -688,7 +688,7 @@ static int gt_reset(struct xe_gt *gt)
>   err_fail:
>   	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>   
> -	xe_device_declare_wedged(gt_to_xe(gt));
> +	xe_device_hint_wedged(gt_to_xe(gt), false);
>   
>   	return err;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index f1c3e338301d..ee7e0fa4815d 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -495,7 +495,7 @@ static void guc_wait_ucode(struct xe_guc *guc)
>   			xe_gt_err(gt, "GuC firmware exception. EIP: %#x\n",
>   				  xe_mmio_read32(gt, SOFT_SCRATCH(13)));
>   
> -		xe_device_declare_wedged(gt_to_xe(gt));
> +		xe_device_hint_wedged(gt_to_xe(gt), false);
>   	} else {
>   		xe_gt_dbg(gt, "GuC successfully loaded\n");
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index dbd88ae20aa3..ad64d5a31239 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -9,6 +9,7 @@
>   
>   #include <generated/xe_wa_oob.h>
>   
> +#include "abi/guc_actions_abi.h"
>   #include "regs/xe_engine_regs.h"
>   #include "regs/xe_gt_regs.h"
>   #include "regs/xe_guc_regs.h"
> @@ -16,11 +17,11 @@
>   #include "xe_gt.h"
>   #include "xe_gt_ccs_mode.h"
>   #include "xe_guc.h"
> +#include "xe_guc_ct.h"
>   #include "xe_hw_engine.h"
>   #include "xe_lrc.h"
>   #include "xe_map.h"
>   #include "xe_mmio.h"
> -#include "xe_module.h"
>   #include "xe_platform_types.h"
>   #include "xe_wa.h"
>   
> @@ -395,6 +396,7 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
>   
>   static void guc_policies_init(struct xe_guc_ads *ads)
>   {
> +	struct xe_device *xe = ads_to_xe(ads);
>   	u32 global_flags = 0;
>   
>   	ads_blob_write(ads, policies.dpc_promote_time,
> @@ -402,8 +404,10 @@ static void guc_policies_init(struct xe_guc_ads *ads)
>   	ads_blob_write(ads, policies.max_num_work_items,
>   		       GLOBAL_POLICY_MAX_NUM_WI);
>   
> -	if (xe_modparam.wedged_mode == 2)
> +	mutex_lock(&xe->wedged.lock);
> +	if (xe->wedged.mode == 2)
>   		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
> +	mutex_unlock(&xe->wedged.lock);
>   
>   	ads_blob_write(ads, policies.global_flags, global_flags);
>   	ads_blob_write(ads, policies.is_valid, 1);
> @@ -760,3 +764,47 @@ void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads)
>   {
>   	guc_populate_golden_lrc(ads);
>   }
> +
> +static int guc_ads_action_update_policies(struct xe_guc_ads *ads, u32 policy_offset)
> +{
> +	struct  xe_guc_ct *ct = &ads_to_guc(ads)->ct;
> +	u32 action[] = {
> +		XE_GUC_ACTION_GLOBAL_SCHED_POLICY_CHANGE,
> +		policy_offset
> +	};
> +
> +	return xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> +}
> +
> +int xe_guc_ads_scheduler_policy_disable_reset(struct xe_guc_ads *ads)
> +{
> +	struct xe_device *xe = ads_to_xe(ads);
> +	struct xe_gt *gt = ads_to_gt(ads);
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct guc_policies *policies;
> +	struct xe_bo *bo;
> +	int ret = 0;
> +
> +	policies = kmalloc(sizeof(*policies), GFP_KERNEL);
> +	if (!policies)
> +		return -ENOMEM;
> +
> +	policies->dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
> +	policies->max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
> +	policies->is_valid = 1;
> +	if (xe->wedged.mode == 2)
> +		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
> +
> +	bo = xe_managed_bo_create_from_data(xe, tile, policies, sizeof(struct guc_policies),
> +					    XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +					    XE_BO_FLAG_GGTT);
> +	if (IS_ERR(bo)) {
> +		ret = PTR_ERR(bo);
> +		goto out;
> +	}
> +
> +	ret = guc_ads_action_update_policies(ads, xe_bo_ggtt_addr(bo));
> +out:
> +	kfree(policies);
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.h b/drivers/gpu/drm/xe/xe_guc_ads.h
> index 138ef6267671..7c45c40fab34 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.h
> @@ -13,5 +13,6 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads);
>   void xe_guc_ads_populate(struct xe_guc_ads *ads);
>   void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads);
>   void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads);
> +int xe_guc_ads_scheduler_policy_disable_reset(struct xe_guc_ads *ads);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 0bea17536659..7de97b90ad00 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -35,7 +35,6 @@
>   #include "xe_macros.h"
>   #include "xe_map.h"
>   #include "xe_mocs.h"
> -#include "xe_module.h"
>   #include "xe_ring_ops_types.h"
>   #include "xe_sched_job.h"
>   #include "xe_trace.h"
> @@ -868,26 +867,33 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
>   		xe_sched_tdr_queue_imm(&q->guc->sched);
>   }
>   
> -static void guc_submit_wedged(struct xe_guc *guc)
> +static bool guc_submit_hint_wedged(struct xe_guc *guc)
>   {
>   	struct xe_exec_queue *q;
>   	unsigned long index;
>   	int err;
>   
> -	xe_device_declare_wedged(guc_to_xe(guc));
> +	if (xe_device_wedged(guc_to_xe(guc)))
> +		return true;
> +
> +	if (!xe_device_hint_wedged(guc_to_xe(guc), true))
> +		return false;
> +
>   	xe_guc_submit_reset_prepare(guc);
>   	xe_guc_ct_stop(&guc->ct);
>   
>   	err = drmm_add_action_or_reset(&guc_to_xe(guc)->drm,
>   				       guc_submit_wedged_fini, guc);
>   	if (err)
> -		return;
> +		return true; /* Device is wedged anyway */
>   
>   	mutex_lock(&guc->submission_state.lock);
>   	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
>   		if (xe_exec_queue_get_unless_zero(q))
>   			set_exec_queue_wedged(q);
>   	mutex_unlock(&guc->submission_state.lock);
> +
> +	return true;
>   }
>   
>   static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> @@ -898,15 +904,12 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>   	struct xe_guc *guc = exec_queue_to_guc(q);
>   	struct xe_device *xe = guc_to_xe(guc);
>   	struct xe_gpu_scheduler *sched = &ge->sched;
> -	bool wedged = xe_device_wedged(xe);
> +	bool wedged;
>   
>   	xe_assert(xe, xe_exec_queue_is_lr(q));
>   	trace_xe_exec_queue_lr_cleanup(q);
>   
> -	if (!wedged && xe_modparam.wedged_mode == 2) {
> -		guc_submit_wedged(exec_queue_to_guc(q));
> -		wedged = true;
> -	}
> +	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
>   
>   	/* Kill the run_job / process_msg entry points */
>   	xe_sched_submission_stop(sched);
> @@ -957,7 +960,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
>   	int err = -ETIME;
>   	int i = 0;
> -	bool wedged = xe_device_wedged(xe);
> +	bool wedged;
>   
>   	/*
>   	 * TDR has fired before free job worker. Common if exec queue
> @@ -981,10 +984,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   
>   	trace_xe_sched_job_timedout(job);
>   
> -	if (!wedged && xe_modparam.wedged_mode == 2) {
> -		guc_submit_wedged(exec_queue_to_guc(q));
> -		wedged = true;
> -	}
> +	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
>   
>   	/* Kill the run_job entry point */
>   	xe_sched_submission_stop(sched);
--------------y2IH6I5DbUynyJL8myjPD26q
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><span style=3D"color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui-s=
ans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, =
Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, A=
rial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Sego=
e UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-styl=
e: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-=
weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-in=
dent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text=
-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, =
255); text-decoration-thickness: initial; text-decoration-style: initial; t=
ext-decoration-color: initial; display: inline !important; float: none;">It=
 seems my previous response was only sent to the email list. </span></p>
    <div class=3D"moz-forward-container">
      <div class=3D"moz-cite-prefix">On 10-04-2024 03:45, Rodrigo Vivi
        wrote:<br>
      </div>
      <blockquote type=3D"cite" cite=3D"mid:20240409221507.1076471-4-rodrig=
o.vivi@intel.com">
        <pre class=3D"moz-quote-pre" wrap=3D"">So, the wedged mode can be s=
elected per device at runtime,
before the tests or before reproducing the issue.

v2: - s/busted/wedged
    - some locking consistency

Cc: Lucas De Marchi <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:lucas=
.demarchi@intel.com" moz-do-not-send=3D"true">&lt;lucas.demarchi@intel.com&=
gt;</a>
Cc: Alan Previn <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:alan.prev=
in.teres.alexis@intel.com" moz-do-not-send=3D"true">&lt;alan.previn.teres.a=
lexis@intel.com&gt;</a>
Signed-off-by: Rodrigo Vivi <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:rodrigo.vivi@intel.com" moz-do-not-send=3D"true">&lt;rodrigo.vivi@intel.=
com&gt;</a>
---
 drivers/gpu/drm/xe/xe_debugfs.c      | 56 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.c       | 41 ++++++++++++++------
 drivers/gpu/drm/xe/xe_device.h       |  4 +-
 drivers/gpu/drm/xe/xe_device_types.h | 11 +++++-
 drivers/gpu/drm/xe/xe_gt.c           |  2 +-
 drivers/gpu/drm/xe/xe_guc.c          |  2 +-
 drivers/gpu/drm/xe/xe_guc_ads.c      | 52 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_ads.h      |  1 +
 drivers/gpu/drm/xe/xe_guc_submit.c   | 28 +++++++-------
 9 files changed, 163 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugf=
s.c
index 86150cafe0ff..6ff067ea5a8f 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -12,6 +12,7 @@
 #include &quot;xe_bo.h&quot;
 #include &quot;xe_device.h&quot;
 #include &quot;xe_gt_debugfs.h&quot;
+#include &quot;xe_guc_ads.h&quot;
 #include &quot;xe_pm.h&quot;
 #include &quot;xe_step.h&quot;
=20
@@ -106,6 +107,58 @@ static const struct file_operations forcewake_all_fops=
 =3D {
 	.release =3D forcewake_release,
 };
=20
+static ssize_t wedged_mode_show(struct file *f, char __user *ubuf,
+				size_t size, loff_t *pos)
+{
+	struct xe_device *xe =3D file_inode(f)-&gt;i_private;
+	char buf[32];
+	int len =3D 0;
+
+	mutex_lock(&amp;xe-&gt;wedged.lock);
+	len =3D scnprintf(buf, sizeof(buf), &quot;%d\n&quot;, xe-&gt;wedged.mode)=
;
+	mutex_unlock(&amp;xe-&gt;wedged.lock);
+
+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
+}
+
+static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
+			       size_t size, loff_t *pos)
+{
+	struct xe_device *xe =3D file_inode(f)-&gt;i_private;
+	struct xe_gt *gt;
+	u32 wedged_mode;
+	ssize_t ret;
+	u8 id;
+
+	ret =3D kstrtouint_from_user(ubuf, size, 0, &amp;wedged_mode);
+	if (ret)
+		return ret;
+
+	if (wedged_mode &gt; 2)
+		return -EINVAL;
+
+	mutex_lock(&amp;xe-&gt;wedged.lock);
+	xe-&gt;wedged.mode =3D wedged_mode;
+	if (wedged_mode =3D=3D 2) {</pre>
      </blockquote>
      <p><br>
      </p>
      <p><br>
      </p>
      <p><span style=3D"color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui=
-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu=
, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;,=
 Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Se=
goe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-st=
yle: normal; font-variant-ligatures: normal; font-variant-caps: normal; fon=
t-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-=
indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-te=
xt-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255=
, 255); text-decoration-thickness: initial; text-decoration-style: initial;=
 text-decoration-color: initial; display: inline !important; float: none;">=
The transition of </span><code style=3D"border: 0px solid rgb(227, 227, 227=
); box-sizing: border-box; --tw-border-spacing-x: 0; --tw-border-spacing-y:=
 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: =
0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan=
-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradi=
ent-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-positio=
n: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numer=
ic-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-=
width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.=
5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transpa=
rent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -=
-tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-=
rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ;=
 --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: =
; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-inve=
rt: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepi=
a: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw=
-contain-style: ; font-feature-settings: normal; font-family: &quot;S=C3=B6=
hne Mono&quot;, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, m=
onospace !important; font-size: 0.875em; font-variation-settings: normal; c=
olor: rgb(13, 13, 13); font-style: normal; font-variant-ligatures: normal; =
font-variant-caps: normal; letter-spacing: normal; text-align: start; text-=
indent: 0px; text-transform: none; word-spacing: 0px; -webkit-text-stroke-w=
idth: 0px; white-space: pre-wrap; background-color: rgb(255, 255, 255); tex=
t-decoration-thickness: initial; text-decoration-style: initial; text-decor=
ation-color: initial;">xe-&gt;wedged.mode</code><span style=3D"color: rgb(1=
3, 13, 13); font-family: S=C3=B6hne, ui-sans-serif, system-ui, -apple-syste=
m, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, =
sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot=
;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Colo=
r Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures:=
 normal; font-variant-caps: normal; font-weight: 400; letter-spacing: norma=
l; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; w=
idows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: p=
re-wrap; background-color: rgb(255, 255, 255); text-decoration-thickness: i=
nitial; text-decoration-style: initial; text-decoration-color: initial; dis=
play: inline !important; float: none;"> from 2 to 1 indicates change in wed=
ged state , yet the GUC policy still retains engine reset disabled, which s=
eems incorrect.  How about calling </span><code style=3D"border: 0px solid =
rgb(227, 227, 227); box-sizing: border-box; --tw-border-spacing-x: 0; --tw-=
border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate:=
 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-=
pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: prox=
imity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gr=
adient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-fig=
ure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; =
--tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color:=
 rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-sh=
adow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0=
 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grays=
cale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --=
tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-ba=
ckdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; -=
-tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; -=
-tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-cont=
ain-paint: ; --tw-contain-style: ; font-feature-settings: normal; font-fami=
ly: &quot;S=C3=B6hne Mono&quot;, Monaco, &quot;Andale Mono&quot;, &quot;Ubu=
ntu Mono&quot;, monospace !important; font-size: 0.875em; font-variation-se=
ttings: normal; color: rgb(13, 13, 13); font-style: normal; font-variant-li=
gatures: normal; font-variant-caps: normal; letter-spacing: normal; text-al=
ign: start; text-indent: 0px; text-transform: none; word-spacing: 0px; -web=
kit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(25=
5, 255, 255); text-decoration-thickness: initial; text-decoration-style: in=
itial; text-decoration-color: initial;">xe_guc_ads_scheduler_policy_disable=
_reset</code><span style=3D"color: rgb(13, 13, 13); font-family: S=C3=B6hne=
, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ub=
untu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&qu=
ot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quo=
t;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; fon=
t-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;=
 font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; t=
ext-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webki=
t-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255,=
 255, 255); text-decoration-thickness: initial; text-decoration-style: init=
ial; text-decoration-color: initial; display: inline !important; float: non=
e;"> for both modes (1 and 2) ? For mode 1, this function will reset the GU=
C policies to default settings. </span></p>
      <p><span style=3D"color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui=
-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu=
, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;,=
 Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Se=
goe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-st=
yle: normal; font-variant-ligatures: normal; font-variant-caps: normal; fon=
t-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-=
indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-te=
xt-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255=
, 255); text-decoration-thickness: initial; text-decoration-style: initial;=
 text-decoration-color: initial; display: inline !important; float: none;">=
If we agree on calling above function unconditionally,  it might be better =
to rename </span><code style=3D"border: 0px solid rgb(227, 227, 227); box-s=
izing: border-box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw=
-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-=
skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --=
tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from=
-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --t=
w-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spaci=
ng: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0=
px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw=
-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --=
tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur=
: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: =
; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-ba=
ckdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-b=
ackdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --=
tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --t=
w-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain=
-style: ; font-feature-settings: normal; font-family: &quot;S=C3=B6hne Mono=
&quot;, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace=
 !important; font-size: 0.875em; font-variation-settings: normal; color: rg=
b(13, 13, 13); font-style: normal; font-variant-ligatures: normal; font-var=
iant-caps: normal; letter-spacing: normal; text-align: start; text-indent: =
0px; text-transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; white-space: pre-wrap; background-color: rgb(255, 255, 255); text-decora=
tion-thickness: initial; text-decoration-style: initial; text-decoration-co=
lor: initial;">xe_guc_ads_scheduler_policy_disable_reset</code><span style=
=3D"color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui-sans-serif, system-=
ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;N=
oto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple =
Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;,=
 &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-va=
riant-ligatures: normal; font-variant-caps: normal; font-weight: 400; lette=
r-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-tr=
ansform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px=
; white-space: pre-wrap; background-color: rgb(255, 255, 255); text-decorat=
ion-thickness: initial; text-decoration-style: initial; text-decoration-col=
or: initial; display: inline !important; float: none;"> to a more suitable =
name, as for mode 1, it won't actually disable reset.</span></p>
      <p><span style=3D"color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui=
-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu=
, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;,=
 Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Se=
goe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-st=
yle: normal; font-variant-ligatures: normal; font-variant-caps: normal; fon=
t-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-=
indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-te=
xt-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255=
, 255); text-decoration-thickness: initial; text-decoration-style: initial;=
 text-decoration-color: initial; display: inline !important; float: none;">
</span></p>
      <p><span style=3D"color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui=
-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu=
, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;,=
 Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Se=
goe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-st=
yle: normal; font-variant-ligatures: normal; font-variant-caps: normal; fon=
t-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-=
indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-te=
xt-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255=
, 255); text-decoration-thickness: initial; text-decoration-style: initial;=
 text-decoration-color: initial; display: inline !important; float: none;">
</span></p>
      <blockquote type=3D"cite" cite=3D"mid:20240409221507.1076471-4-rodrig=
o.vivi@intel.com">
        <pre class=3D"moz-quote-pre" wrap=3D"">+		for_each_gt(gt, xe, id) {
+			ret =3D xe_guc_ads_scheduler_policy_disable_reset(&amp;gt-&gt;uc.guc.ad=
s);</pre>
      </blockquote>
      <p><br>
      </p>
      <p><span style=3D"color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui=
-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu=
, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;,=
 Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Se=
goe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-st=
yle: normal; font-variant-ligatures: normal; font-variant-caps: normal; fon=
t-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-=
indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-te=
xt-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255=
, 255); text-decoration-thickness: initial; text-decoration-style: initial;=
 text-decoration-color: initial; display: inline !important; float: none;">=
Given this debugs, where users have the option to choose whether to disable=
 engine reset before submission, is the modparam introduced in [PATCH 3/4] =
really necessary? This also ensures post rebind we have default policies.</=
span></p>
      <p><span style=3D"color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui=
-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu=
, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;,=
 Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Se=
goe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-st=
yle: normal; font-variant-ligatures: normal; font-variant-caps: normal; fon=
t-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-=
indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-te=
xt-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255=
, 255); text-decoration-thickness: initial; text-decoration-style: initial;=
 text-decoration-color: initial; display: inline !important; float: none;">
</span></p>
      <blockquote type=3D"cite" cite=3D"mid:20240409221507.1076471-4-rodrig=
o.vivi@intel.com">
        <pre class=3D"moz-quote-pre" wrap=3D"">+			if (ret) {
+				drm_err(&amp;xe-&gt;drm, &quot;Failed to update GuC ADS scheduler poli=
cy. GPU might still reset even on the wedged_mode=3D2\n&quot;);
+				break;
+			}
+		}
+	}
+	mutex_unlock(&amp;xe-&gt;wedged.lock);
+
+	return size;
+}
+
+static const struct file_operations wedged_mode_fops =3D {
+	.owner =3D THIS_MODULE,
+	.read =3D wedged_mode_show,
+	.write =3D wedged_mode_set,
+};
+
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev =3D &amp;xe-&gt;ttm;
@@ -123,6 +176,9 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file(&quot;forcewake_all&quot;, 0400, root, xe,
 			    &amp;forcewake_all_fops);
=20
+	debugfs_create_file(&quot;wedged_mode&quot;, 0400, root, xe,
+			    &amp;wedged_mode_fops);
+
 	for (mem_type =3D XE_PL_VRAM0; mem_type &lt;=3D XE_PL_VRAM1; ++mem_type) =
{
 		man =3D ttm_manager_type(bdev, mem_type);
=20
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.=
c
index 7928a5470cee..949fca2f0400 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -445,6 +445,9 @@ int xe_device_probe_early(struct xe_device *xe)
 	if (err)
 		return err;
=20
+	mutex_init(&amp;xe-&gt;wedged.lock);
+	xe-&gt;wedged.mode =3D xe_modparam.wedged_mode;
+
 	return 0;
 }
=20
@@ -787,26 +790,37 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *x=
e, u64 address)
 }
=20
 /**
- * xe_device_declare_wedged - Declare device wedged
+ * xe_device_hint_wedged - Get a hint and possibly declare device as wedge=
d
  * @xe: xe device instance
+ * @in_timeout_path: hint coming from a timeout path
  *
- * This is a final state that can only be cleared with a module
+ * The wedged state is a final on that can only be cleared with a module
  * re-probe (unbind + bind).
  * In this state every IOCTL will be blocked so the GT cannot be used.
- * In general it will be called upon any critical error such as gt reset
- * failure or guc loading failure.
- * If xe.wedged module parameter is set to 2, this function will be called
- * on every single execution timeout (a.k.a. GPU hang) right after devcore=
dump
- * snapshot capture. In this mode, GT reset won't be attempted so the stat=
e of
- * the issue is preserved for further debugging.
+ * In general device will be declared wedged only at critical
+ * error paths such as gt reset failure or guc loading failure.
+ * Hints are also expected from every single execution timeout (a.k.a. GPU=
 hang)
+ * right after devcoredump snapshot capture. Then, device can be declared =
wedged
+ * if wedged_mode is set to 2. In this mode, GT reset won't be attempted s=
o the
+ * state of the issue is preserved for further debugging.
+ *
+ * Return: True if device has been just declared wedged. False otherwise.
  */
-void xe_device_declare_wedged(struct xe_device *xe)
+bool xe_device_hint_wedged(struct xe_device *xe, bool in_timeout_path)
 {
-	if (xe_modparam.wedged_mode =3D=3D 0)
-		return;
+	bool ret =3D false;
+
+	mutex_lock(&amp;xe-&gt;wedged.lock);
=20
-	if (!atomic_xchg(&amp;xe-&gt;wedged, 1)) {
+	if (xe-&gt;wedged.mode =3D=3D 0)
+		goto out;
+
+	if (in_timeout_path &amp;&amp; xe-&gt;wedged.mode !=3D 2)
+		goto out;
+
+	if (!atomic_xchg(&amp;xe-&gt;wedged.flag, 1)) {
 		xe-&gt;needs_flr_on_fini =3D true;
+		ret =3D true;
 		drm_err(&amp;xe-&gt;drm,
 			&quot;CRITICAL: Xe has declared device %s as wedged.\n&quot;
 			&quot;IOCTLs and executions are blocked until device is probed again wi=
th unbind and bind operations:\n&quot;
@@ -816,4 +830,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
 			dev_name(xe-&gt;drm.dev), dev_name(xe-&gt;drm.dev),
 			dev_name(xe-&gt;drm.dev));
 	}
+out:
+	mutex_unlock(&amp;xe-&gt;wedged.lock);
+	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.=
h
index 0fea5c18f76d..e3ea8a43e7f9 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -178,9 +178,9 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe,=
 u64 address);
=20
 static inline bool xe_device_wedged(struct xe_device *xe)
 {
-	return atomic_read(&amp;xe-&gt;wedged);
+	return atomic_read(&amp;xe-&gt;wedged.flag);
 }
=20
-void xe_device_declare_wedged(struct xe_device *xe);
+bool xe_device_hint_wedged(struct xe_device *xe, bool in_timeout_path);
=20
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_d=
evice_types.h
index b9ef60f21750..0da4787f1087 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -458,8 +458,15 @@ struct xe_device {
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
=20
-	/** @wedged: Xe device faced a critical error and is now blocked. */
-	atomic_t wedged;
+	/** @wedged: Struct to control Wedged States and mode */
+	struct {
+		/** @wedged.flag: Xe device faced a critical error and is now blocked. *=
/
+		atomic_t flag;
+		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
+		int mode;
+		/** @wedged.lock: To protect @wedged.mode */
+		struct mutex lock;
+	} wedged;
=20
 	/* private: */
=20
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 0844081b88ef..da16f4273877 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -688,7 +688,7 @@ static int gt_reset(struct xe_gt *gt)
 err_fail:
 	xe_gt_err(gt, &quot;reset failed (%pe)\n&quot;, ERR_PTR(err));
=20
-	xe_device_declare_wedged(gt_to_xe(gt));
+	xe_device_hint_wedged(gt_to_xe(gt), false);
=20
 	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index f1c3e338301d..ee7e0fa4815d 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -495,7 +495,7 @@ static void guc_wait_ucode(struct xe_guc *guc)
 			xe_gt_err(gt, &quot;GuC firmware exception. EIP: %#x\n&quot;,
 				  xe_mmio_read32(gt, SOFT_SCRATCH(13)));
=20
-		xe_device_declare_wedged(gt_to_xe(gt));
+		xe_device_hint_wedged(gt_to_xe(gt), false);
 	} else {
 		xe_gt_dbg(gt, &quot;GuC successfully loaded\n&quot;);
 	}
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ad=
s.c
index dbd88ae20aa3..ad64d5a31239 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -9,6 +9,7 @@
=20
 #include &lt;generated/xe_wa_oob.h&gt;
=20
+#include &quot;abi/guc_actions_abi.h&quot;
 #include &quot;regs/xe_engine_regs.h&quot;
 #include &quot;regs/xe_gt_regs.h&quot;
 #include &quot;regs/xe_guc_regs.h&quot;
@@ -16,11 +17,11 @@
 #include &quot;xe_gt.h&quot;
 #include &quot;xe_gt_ccs_mode.h&quot;
 #include &quot;xe_guc.h&quot;
+#include &quot;xe_guc_ct.h&quot;
 #include &quot;xe_hw_engine.h&quot;
 #include &quot;xe_lrc.h&quot;
 #include &quot;xe_map.h&quot;
 #include &quot;xe_mmio.h&quot;
-#include &quot;xe_module.h&quot;
 #include &quot;xe_platform_types.h&quot;
 #include &quot;xe_wa.h&quot;
=20
@@ -395,6 +396,7 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ad=
s)
=20
 static void guc_policies_init(struct xe_guc_ads *ads)
 {
+	struct xe_device *xe =3D ads_to_xe(ads);
 	u32 global_flags =3D 0;
=20
 	ads_blob_write(ads, policies.dpc_promote_time,
@@ -402,8 +404,10 @@ static void guc_policies_init(struct xe_guc_ads *ads)
 	ads_blob_write(ads, policies.max_num_work_items,
 		       GLOBAL_POLICY_MAX_NUM_WI);
=20
-	if (xe_modparam.wedged_mode =3D=3D 2)
+	mutex_lock(&amp;xe-&gt;wedged.lock);
+	if (xe-&gt;wedged.mode =3D=3D 2)
 		global_flags |=3D GLOBAL_POLICY_DISABLE_ENGINE_RESET;
+	mutex_unlock(&amp;xe-&gt;wedged.lock);
=20
 	ads_blob_write(ads, policies.global_flags, global_flags);
 	ads_blob_write(ads, policies.is_valid, 1);
@@ -760,3 +764,47 @@ void xe_guc_ads_populate_post_load(struct xe_guc_ads *=
ads)
 {
 	guc_populate_golden_lrc(ads);
 }
+
+static int guc_ads_action_update_policies(struct xe_guc_ads *ads, u32 poli=
cy_offset)
+{
+	struct  xe_guc_ct *ct =3D &amp;ads_to_guc(ads)-&gt;ct;
+	u32 action[] =3D {
+		XE_GUC_ACTION_GLOBAL_SCHED_POLICY_CHANGE,
+		policy_offset
+	};
+
+	return xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
+}
+
+int xe_guc_ads_scheduler_policy_disable_reset(struct xe_guc_ads *ads)
+{
+	struct xe_device *xe =3D ads_to_xe(ads);
+	struct xe_gt *gt =3D ads_to_gt(ads);
+	struct xe_tile *tile =3D gt_to_tile(gt);
+	struct guc_policies *policies;
+	struct xe_bo *bo;
+	int ret =3D 0;
+
+	policies =3D kmalloc(sizeof(*policies), GFP_KERNEL);
+	if (!policies)
+		return -ENOMEM;
+
+	policies-&gt;dpc_promote_time =3D ads_blob_read(ads, policies.dpc_promote=
_time);
+	policies-&gt;max_num_work_items =3D ads_blob_read(ads, policies.max_num_w=
ork_items);
+	policies-&gt;is_valid =3D 1;
+	if (xe-&gt;wedged.mode =3D=3D 2)
+		policies-&gt;global_flags |=3D GLOBAL_POLICY_DISABLE_ENGINE_RESET;
+
+	bo =3D xe_managed_bo_create_from_data(xe, tile, policies, sizeof(struct g=
uc_policies),
+					    XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+					    XE_BO_FLAG_GGTT);
+	if (IS_ERR(bo)) {
+		ret =3D PTR_ERR(bo);
+		goto out;
+	}
+
+	ret =3D guc_ads_action_update_policies(ads, xe_bo_ggtt_addr(bo));
+out:
+	kfree(policies);
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.h b/drivers/gpu/drm/xe/xe_guc_ad=
s.h
index 138ef6267671..7c45c40fab34 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.h
+++ b/drivers/gpu/drm/xe/xe_guc_ads.h
@@ -13,5 +13,6 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)=
;
 void xe_guc_ads_populate(struct xe_guc_ads *ads);
 void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads);
 void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads);
+int xe_guc_ads_scheduler_policy_disable_reset(struct xe_guc_ads *ads);
=20
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc=
_submit.c
index 0bea17536659..7de97b90ad00 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -35,7 +35,6 @@
 #include &quot;xe_macros.h&quot;
 #include &quot;xe_map.h&quot;
 #include &quot;xe_mocs.h&quot;
-#include &quot;xe_module.h&quot;
 #include &quot;xe_ring_ops_types.h&quot;
 #include &quot;xe_sched_job.h&quot;
 #include &quot;xe_trace.h&quot;
@@ -868,26 +867,33 @@ static void xe_guc_exec_queue_trigger_cleanup(struct =
xe_exec_queue *q)
 		xe_sched_tdr_queue_imm(&amp;q-&gt;guc-&gt;sched);
 }
=20
-static void guc_submit_wedged(struct xe_guc *guc)
+static bool guc_submit_hint_wedged(struct xe_guc *guc)
 {
 	struct xe_exec_queue *q;
 	unsigned long index;
 	int err;
=20
-	xe_device_declare_wedged(guc_to_xe(guc));
+	if (xe_device_wedged(guc_to_xe(guc)))
+		return true;
+
+	if (!xe_device_hint_wedged(guc_to_xe(guc), true))
+		return false;
+
 	xe_guc_submit_reset_prepare(guc);
 	xe_guc_ct_stop(&amp;guc-&gt;ct);
=20
 	err =3D drmm_add_action_or_reset(&amp;guc_to_xe(guc)-&gt;drm,
 				       guc_submit_wedged_fini, guc);
 	if (err)
-		return;
+		return true; /* Device is wedged anyway */
=20
 	mutex_lock(&amp;guc-&gt;submission_state.lock);
 	xa_for_each(&amp;guc-&gt;submission_state.exec_queue_lookup, index, q)
 		if (xe_exec_queue_get_unless_zero(q))
 			set_exec_queue_wedged(q);
 	mutex_unlock(&amp;guc-&gt;submission_state.lock);
+
+	return true;
 }
=20
 static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
@@ -898,15 +904,12 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_=
struct *w)
 	struct xe_guc *guc =3D exec_queue_to_guc(q);
 	struct xe_device *xe =3D guc_to_xe(guc);
 	struct xe_gpu_scheduler *sched =3D &amp;ge-&gt;sched;
-	bool wedged =3D xe_device_wedged(xe);
+	bool wedged;
=20
 	xe_assert(xe, xe_exec_queue_is_lr(q));
 	trace_xe_exec_queue_lr_cleanup(q);
=20
-	if (!wedged &amp;&amp; xe_modparam.wedged_mode =3D=3D 2) {
-		guc_submit_wedged(exec_queue_to_guc(q));
-		wedged =3D true;
-	}
+	wedged =3D guc_submit_hint_wedged(exec_queue_to_guc(q));
=20
 	/* Kill the run_job / process_msg entry points */
 	xe_sched_submission_stop(sched);
@@ -957,7 +960,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_j=
ob)
 	struct xe_device *xe =3D guc_to_xe(exec_queue_to_guc(q));
 	int err =3D -ETIME;
 	int i =3D 0;
-	bool wedged =3D xe_device_wedged(xe);
+	bool wedged;
=20
 	/*
 	 * TDR has fired before free job worker. Common if exec queue
@@ -981,10 +984,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_=
job)
=20
 	trace_xe_sched_job_timedout(job);
=20
-	if (!wedged &amp;&amp; xe_modparam.wedged_mode =3D=3D 2) {
-		guc_submit_wedged(exec_queue_to_guc(q));
-		wedged =3D true;
-	}
+	wedged =3D guc_submit_hint_wedged(exec_queue_to_guc(q));
=20
 	/* Kill the run_job entry point */
 	xe_sched_submission_stop(sched);
</pre>
      </blockquote>
    </div>
  </body>
</html>

--------------y2IH6I5DbUynyJL8myjPD26q--
