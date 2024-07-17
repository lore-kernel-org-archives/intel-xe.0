Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C64C3DA5D
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 23:06:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BBC610E494;
	Wed, 17 Jul 2024 23:06:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BAuyyOOB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C9C10E492
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 23:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721257599; x=1752793599;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RzOgnj2p055UjiC498AeurN1Xwd6DOk9x+U6SnfUR3s=;
 b=BAuyyOOBCPvV3CEtHYB05SsRyKvl+zcONlNF4jSeYt0fJkn27Yt8ClaI
 ntuQnEjaevLhl5/Z22eNWBsZPEsKPRcWzsE1g22QttNIDQ0dKnN3jGvQF
 8gdFTTOa5wZi8Du9Be0dFvl+JQ4GzlE+eFTLWEs8RTswkp7ORZJzmjuyU
 0+QcgwTc/DHBU0hEiXlD5kWw4da6kQJt0QIEzxDQFZAbMIGycH1vQw9sh
 6uvJDpVlS44oliZu8EXgCovLr9R2ZdBfTFegTqC2vn1sbDNUlxJlISYhZ
 L7bKlv4tSW/9p/Wv9VhJhIoGTAR/pFeP44Sep4vBNzANSKQsC1IMHal7p g==;
X-CSE-ConnectionGUID: RCIxAVRxRRGlI24ub+sO3Q==
X-CSE-MsgGUID: arV6T621RlGB8oZBantY0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18981139"
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; d="scan'208";a="18981139"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 16:06:38 -0700
X-CSE-ConnectionGUID: 9SyrO1I+RDiFbWSNjaCdMg==
X-CSE-MsgGUID: HdQx5WuhRSio+CYwxgM6cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; d="scan'208";a="50276909"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 16:06:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 16:06:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 16:06:37 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 16:06:37 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 16:06:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RrW5kcX3D8YFBMvuiPUZWOpTOT23UwScKOhVkuhOPYaVg5rZTqMXI9eKgVbGiKLqYCdtcxuudbY1MI6q1RhHAq2jUWih58Afde8kGxUTw1z7vV9tgn8sgsISvE/dsFiYbDjY8IXOx5srVM/+aXevsY9Wfv6iaPtnDI88ie8V3LMjy5+/uPwZkfuXN2446NX5mSdsB0TmPZH+j6oJcBrZFa8Paf3H8STBRzUydgfzEYvvo8+IZnUrRfv1c5uDh3c5t1gdLoIXP0wcuL4BgPxwy6htzP7XS6JIdwTdAyaABPdvNzXqclB83pV9GzjyRCy6adykrHwJDYZNyWcJPXpcbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Li6BPbgvHdazXSB0CPJ8MrJQdt5ydUFbIZiwhqF1Ex4=;
 b=nmEYKTwb8rg27LqhWUq5EpfSqEcWWCYlkURcMsGOAxngY/VtMdacglCZzq0RCSo3VEd3tUAs6Nt5HEYHzwL5JhNualyZ8EnubiIjzCXLA9RNmOZnAGxhNrUD5zFpj9CoKNYBKqyzoip/On926b6YhJkyYV6rpZdAxuozBRq9cRRtAVJd5+TZRVCWPypHTgy5BK06vZkKTemWWRmZvQ63yDBDgbmdimJqt+O2K/oD7CZ1+8h++JdBrENUQ3rRgUR/Nh+g2E+FsgBMyzWXl1Hx036B5gQ57s6gn+ywi12X+Mog7ToiF6jEH2bs1QE+pHoM++h+66NaUESmnq2RR696Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB8356.namprd11.prod.outlook.com (2603:10b6:208:486::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Wed, 17 Jul
 2024 23:06:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Wed, 17 Jul 2024
 23:06:35 +0000
Date: Wed, 17 Jul 2024 23:05:44 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC v1 9/9] drm/xe/vm: Remove restriction that all VMs must be
 faulting if one is
Message-ID: <ZphOSFAbVtj6lSIL@DUT025-TGLU.fm.intel.com>
References: <20240717130821.1073379-1-francois.dugast@intel.com>
 <20240717130821.1073379-10-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240717130821.1073379-10-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0180.namprd03.prod.outlook.com
 (2603:10b6:a03:338::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB8356:EE_
X-MS-Office365-Filtering-Correlation-Id: c81bb6e7-8db3-48b2-d558-08dca6b51b53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7OAyVAi0a/t2og6e+UF5HzjqB4JM1tqrHPHnWRxW1iuC2ECvUyNhXHL6CP6i?=
 =?us-ascii?Q?3nH8W3rdzo+4LM1169Y27k8jpb7SCoqoRRHc9uE/0wX80agiZPnAnwwGMZdC?=
 =?us-ascii?Q?H24Idtx9yLPeNee3HJD2oT/yU2yaPoRckvWVtgwAT92ozoNiLaV/BbrBIWcm?=
 =?us-ascii?Q?JnG1IIzOg84SOIugcS/PJhTgs7nxxZK1ZMRodxBYHabeDWKfS8z7SDKCdTQ3?=
 =?us-ascii?Q?FzI6f8WU+0GQH8WtGeEIfsLqpUEat+iXRD2UcxCUAjiDHniR7aKVEoFXNlIi?=
 =?us-ascii?Q?eZ22o0jqGK5yaa8jZ46hE4+06ihG8oBid6toPED5+QDgkCYQ/wn86QOYLqCF?=
 =?us-ascii?Q?0HfxxIO6GbI3SUZ2ue7UbXrE14oYWhLwVYNiBjdhtdY+54eA6hNm+qzi0/ua?=
 =?us-ascii?Q?xh1HfQq+/esztH/oCPT1tWLRYhFI1P4yPhnkKNTA8awHLsDch+wJp48ZzbPz?=
 =?us-ascii?Q?wZHM43RrrMA/xu6ox+4xOMKeSNMl8AZg5gRGZKWF80LYQ5m+VCLw/ji09XPM?=
 =?us-ascii?Q?bm8pa3L2LMzw2ojArt4psskHBjy4P2dXaBuEIRTifULEbLwgz99h1Uk0wLvH?=
 =?us-ascii?Q?w8titpZqyLCE47CQ1WuD3pb3hASuYYwgekr2SYpeq6MC3Job8wiqoHZs3K3X?=
 =?us-ascii?Q?TkbR+DlCBsP7AM5EH1A4pTqFAQWETIknssNGg9SY51h7ZKfqH20cWujFWPc3?=
 =?us-ascii?Q?qxdLcD5dr56oZUP4PyuPK9OZMDWVJjMovVI4k8Zj0aB2YhuP54BeTpWLDWFr?=
 =?us-ascii?Q?xxvmXalxerOjWMvYnvBFQ5RGkbn7vBbXY2wjqPnosva2conYNF+4lPx2jSEu?=
 =?us-ascii?Q?vBf1C8BKktq7vnQkyXkSTs9WcdqUzmnOyiF+aLqS/y9NIKjlLzrSL4bG556x?=
 =?us-ascii?Q?x3nJQ5FzYlEtRigtc7jXq62q6w4BPYgf+ParKRkjKvl9N6tMUJ+V8iMb44b9?=
 =?us-ascii?Q?y5tLzYm6oqVJry38L6CarYALI12a2eVnPJqKN9OJuSuEOppE5yQDCBr6jhU2?=
 =?us-ascii?Q?XR1VGPnFGG1lZJQxLazRWhOhNCfz/qC1rzftAMvHFiP8aE62CcnMZGZ6kuMc?=
 =?us-ascii?Q?GT+ITT8gSMNAAuhDcfh5dnAjKkKYH6eAGesu0rPGZLQGAWpp/o6oe5BeJWkR?=
 =?us-ascii?Q?erCcDeVeoGK9mqRFDDBujRw8EenL2rD1+KV2BYnr5PKkqCEDFLQo+hOf/9Ls?=
 =?us-ascii?Q?dOJSzO3WAIUAN2bP6X+quxEkE9vP6/MUBXSNb20c5mMrs+/Qgsk0K2iTGKz2?=
 =?us-ascii?Q?FtxFY1W8MrW3NtNesTcSoaXQX+K8uVD2Mxqp3MLD0mVgoS8ipHawUJsriIc/?=
 =?us-ascii?Q?l29v7QLcf15mYc90Cm4LXupz9IWT6olYtWH3kTdpz6av/g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ImeTevgAA9kY5jc0s3kE2XhRS5o6Mr8wuejlKQRl+8I9OZLy6O52z0ad0y0g?=
 =?us-ascii?Q?JwgtG5B+Sn7S87yF8UMB1XMqgR20E73SmGdGQZIgEebgSgEwxv28tuwdlrpw?=
 =?us-ascii?Q?PnAOuauibKHNvS4yH7fS/WbstL8tatpALjs2gUkp4AnGAF7w3p/zRZtmZORr?=
 =?us-ascii?Q?v4/WYfdRGAvUjko91rzLvfXo6RR8YdAahQMhA29nlpbzRxSn3yLljOeN7SSV?=
 =?us-ascii?Q?fDCYJgofvoAoKTUS46cF3bLzesU5X9jfp5irXb2qJ7CyuQ0LusnFmjbOBTgK?=
 =?us-ascii?Q?/88kc+dPMj43CtOPg2/jTagQlpBTFBA6QfCtb35lhY9o1W9198rnuuJygwIt?=
 =?us-ascii?Q?5Mq5MmgtGa50bD1Xxzm/9jnPttbBCjpHJmGOsdCSCHyT90d3mgmBUQc3Lp/g?=
 =?us-ascii?Q?dKLsV/s5jYlVUXUqxFO45yyrvLhjdmGSsFgKBvjC4xNWWtO5QQkgLNt2FtMg?=
 =?us-ascii?Q?ChX/sGjVX5EKH7YMyh25y1aDMgrt9IAQHWKgKVBc/AEyEvHdzJo+T88kYnuq?=
 =?us-ascii?Q?NqjwKnIU15Oyo4u0lnTkUBUr8DsG7eJd27ukBR86DudVUk4ucb9Mttft79KB?=
 =?us-ascii?Q?/8itjLt+gMVddAUY76qGxtNQ2g/0zCexpTzaq5ZuIUplXa+s6PO0TNylwHua?=
 =?us-ascii?Q?hsmYN/ZVrDgogMptwZXWaPtjxgsxaVQjbmKwnEleA2Rd9pZRg5KSeONuHRNT?=
 =?us-ascii?Q?zXPOmJuPy2MQQfQ6PY0QifpPzoCqxfELbWT+v/DwqJFY7hJhnvqr0fO75Dby?=
 =?us-ascii?Q?gDljUfb1S47YWjit3GEVKl2gXy6uoyDme6y52d0Pn9q+twoW2ckdvVTe6KpN?=
 =?us-ascii?Q?WuRkFWE3Ob02EskJKt2CuX11Rql0XpOTK4j159+ZAH2C9USWwHuMKUM7gx11?=
 =?us-ascii?Q?XFmOPig4wnJpTYM0zqW+q8Cz9uzUH587TPRruspW3ITdP84F+mtmfnh0sVcC?=
 =?us-ascii?Q?3dETt7i7GM4LKty0/AmTEcPwYBpOrHpMhY8fzlupQbIv98tyN9zG0DBx7DPe?=
 =?us-ascii?Q?MXZ78zUCBitrn2xcNuJsuzBNoGaIsAWnqb56yUQmPmCduwZuMDhWhAA+D530?=
 =?us-ascii?Q?u/Wv/mv7JiSCNagjIa6jvRxS/q23DiF7pcZOIV/PSY8gwbjnGOM6McCX6o9n?=
 =?us-ascii?Q?zHuA0CSo7RRMjDIpOEXWThafEoWVxSpMCS/fN2UxCwu4r6pRApuxtCS60xov?=
 =?us-ascii?Q?+A+o41KmVhh4JKtVVycddYlqj6HsaiTjAicPHmPGWMKnobVMutQ9req9ZYp3?=
 =?us-ascii?Q?8SwK4VWeCshXxVAEuQzD/frMZs2lb8hY06/3aWHQbB+0S6oRJaBhNuDFOYft?=
 =?us-ascii?Q?Wr6I8TqNcPHOVylLZLlAYP6JqzlkMgYzaP8x0uJWVuhLMxCxbkxlgGTfoBya?=
 =?us-ascii?Q?jr/ZH6Gnwgc8xFkhxCM5XizGbj/T67wouCD+drDLzUHcQbCjX6XH0OiU1idv?=
 =?us-ascii?Q?PhnWHPzvW1WMyxIEXnTHis8yeu8uX8wAZiZw0eaOyh36qLfi/ScXnIYcPZKP?=
 =?us-ascii?Q?Ahmgo6Ppd6G4uWgIAjC08tF7zbPkuvojuIoMKVnnfhvNiHrYBy7cdRHLfxqu?=
 =?us-ascii?Q?D5Mj4rPBFDTVdV3Swyj3IHSGn8NZM+2KoUlGOticiKJQJjA9peZ+JPHQp91Y?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c81bb6e7-8db3-48b2-d558-08dca6b51b53
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 23:06:35.8248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wIwUswKioFHUkP5AOoRPcOJc3rRNYjEZV6jXM8InTkOKknSEhXo+CwgpE1k3Stct8m179HKG+SkeW4QgQc7uuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8356
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

On Wed, Jul 17, 2024 at 03:07:30PM +0200, Francois Dugast wrote:
> With this restriction, all VMs on the device must be faulting VMs
> if there is already one faulting VM, in which case the device is
> considered in fault mode. This prevents for example an application
> from running 3D jobs for the compositor while submitting a SVM
> compute job on the same device.
> 
> Now that mutual exclusion of LR jobs and dma fence jobs is ensured
> on the hw engine group, remove this restriction to allow running
> faulting and non-faulting VMs on the same device.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.h | 10 ----------
>  drivers/gpu/drm/xe/xe_vm.c     |  8 --------
>  2 files changed, 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index bb07f5669dbb..cb69ecf02c25 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -129,16 +129,6 @@ static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
>  
>  void xe_device_assert_mem_access(struct xe_device *xe);
>  
> -static inline bool xe_device_in_fault_mode(struct xe_device *xe)
> -{
> -	return xe->usm.num_vm_in_fault_mode != 0;
> -}
> -
> -static inline bool xe_device_in_non_fault_mode(struct xe_device *xe)
> -{
> -	return xe->usm.num_vm_in_non_fault_mode != 0;
> -}
> -

These are used in a few other places:

mbrost@lstrano-desk:xe$ grep usm.num_vm_in_ *.c *.h
xe_vm.c:                xe->usm.num_vm_in_fault_mode++;
xe_vm.c:                xe->usm.num_vm_in_non_fault_mode++;
xe_vm.c:                xe->usm.num_vm_in_fault_mode--;
xe_vm.c:                xe->usm.num_vm_in_non_fault_mode--;
xe_device.h:    return xe->usm.num_vm_in_fault_mode != 0;
xe_device.h:    return xe->usm.num_vm_in_non_fault_mode != 0;
xe_device_types.h:              /** @usm.num_vm_in_fault_mode: number of VM in fault mode */
xe_device_types.h:              /** @usm.num_vm_in_non_fault_mode: number of VM in non-fault mode */

Remove this usage everywhere.

Matt

>  static inline bool xe_device_has_flat_ccs(struct xe_device *xe)
>  {
>  	return xe->info.has_flat_ccs;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 5b166fa03684..f0d2dc41a25d 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1875,14 +1875,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
>  		return -EINVAL;
>  
> -	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
> -			 xe_device_in_non_fault_mode(xe)))
> -		return -EINVAL;
> -
> -	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE) &&
> -			 xe_device_in_fault_mode(xe)))
> -		return -EINVAL;
> -
>  	if (XE_IOCTL_DBG(xe, args->extensions))
>  		return -EINVAL;
>  
> -- 
> 2.43.0
> 
