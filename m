Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82460CCD183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 19:18:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4738A10E346;
	Thu, 16 Oct 2025 19:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c7zZDIvm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C747110E33D
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 19:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760642283; x=1792178283;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DkK3fxhhiRSlgd/I7hQLFTC6jYCN1SQU6mIOBbT5Q2w=;
 b=c7zZDIvm273KWeQxnjApqO4p679ZpwjpF0XeMPbASiJZSzgAZP46xmlf
 ocd+WqtM4BnUoOUyeF/OpGxSbqmWVr9dZm76ikZcPDvWi1OEXjBIXFJ5s
 Vr15doDSUXbar996+Kk9KSq6hFFj1/Ikjq7mdN9OEdCrJbsVDii8sC1MA
 6iQ9WqsjRezRnQz1i4ajj6w+ohI+N590aW8Pnx/klnIRAOY/UPgdw6ncC
 l9loY9BzDjvEeh7fkBHIuPI9Pj0WkqCHKxcab1N/3egNnpJJChjTGaLj+
 dURKRmpSoa6H3EuWbQIYT3uMIW3SC9ae1XxoBu823osehfPuBUTkd5kFu w==;
X-CSE-ConnectionGUID: pv07RlU4T6WYUh98A3YrqQ==
X-CSE-MsgGUID: 1ypplrYsQLuv+75Dw72Vhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="88318401"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="88318401"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 12:18:03 -0700
X-CSE-ConnectionGUID: A+tpJdAvR5Gc4vC32j5N+Q==
X-CSE-MsgGUID: Pdz8H8HdRxOa9tYX/rw7DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="186805663"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 12:18:02 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 12:18:01 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 12:18:01 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.20) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 12:18:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a+Sf+pFFhSyuCFAXpTSfvJnrX0cgdnH9kmtiQN+Yu/GglObfoR7RBi1i/9Rp8XncOL4BU/zPWNEeFXOwF2TIiz0LjKuCNv9WYheIk+DwvtRQb6/uPLCdSZPOkvJaVlRyV6s6WdUNxz5WTYeMDClzk3lhlCNTNr/F8waF4H/klGbiqX4atsef4t79Sf+71OcBS2Lg+VZqdm+nz9k3JrXd5zUkdC319pQZKd3gTkG/GYliRKEVI4fDlfd5mfHLyEGuFWixO94cXHj4YAFcdr7dDnuOqTPk0JpnwKcQVHrf39raRP5ahv5L/v1C0i+ZRFhStab2a7JUUI7KbNRxZGtwEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8d/QIQYJ/swUmlFvhzRQQHC38uIuZSHurKwNVoZjjs=;
 b=KaFlj0P8TZgt8wfAyFAw06NDYUu8nt5p+eGxgqTM+5m+wUY3tripgfcES6sMcMBs1M0BM59Szd5dLEfB3k3PwGEx2U7mPT/F/oYRa3vhK4Cza0tUUa3C7dsDvN0Bv6YJ6ptadT32NKXzudOG7YqFAgLmBbXFHLOFD/MpUW2dGblq6fs2BmvLpkvs8OoaudffhICVGWLtPA2jDOfekhtB4W92V3k6Gfzt7ranHU51DjZEqsAfGZ16TTGH/jHCuZr++oRJARC20zfyHQn6Y7TC8KqsGUxErjF/Dd9DuMpC8jxZJ0D7tlw3g7q4PNKeV4Dtufd2PhknKXfShUsU+/S9yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SN7PR11MB7567.namprd11.prod.outlook.com (2603:10b6:806:328::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 19:17:59 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 19:17:59 +0000
Date: Thu, 16 Oct 2025 15:17:54 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe/xe_survivability: Add support for survivability
 mode v2
Message-ID: <aPFE4hIJKUKh1pjz@intel.com>
References: <20251014053257.3417575-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251014053257.3417575-2-riana.tauro@intel.com>
X-ClientProxiedBy: PH8PR02CA0042.namprd02.prod.outlook.com
 (2603:10b6:510:2da::31) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SN7PR11MB7567:EE_
X-MS-Office365-Filtering-Correlation-Id: d5041656-cb7f-45eb-acbf-08de0ce8b7bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dMdV2VtRfUV/5sLgLzwzYoMQviG77pztS5IMnUHio6RUUJVC1OyopX15wFNx?=
 =?us-ascii?Q?yhwAA6nzmMfYmuYEl+ljF/p0WOd4bvu/6x+jXvm7SEYQz0sbf0qEqLQETWiX?=
 =?us-ascii?Q?SPY19zW9e09BFyFj72brrvpHk1sGE45gFyj/RJO6h/cXSLO19ArGf/Zh6+sc?=
 =?us-ascii?Q?mIbm+ciRnUdiUXIn9ajYPBkkYDNTCHNTAIVt2Vj6/Y8+PvT+KmC9wuEAaQZD?=
 =?us-ascii?Q?1zEIcI9M2I52IB3YbizYPjMghIijtytSxAEiwwnYgUuLssaR0TQNz7KKkJEu?=
 =?us-ascii?Q?14qz1MRVr1zuJoK7yQ7JE3AoOW68UtHyZdGtky2qsVsXxQFUf6MV7Jp/AEX6?=
 =?us-ascii?Q?JLGqmDHJ3eQcjSfdBukfjKshdvtHH6nuB7KqPe9MpxIYCTVWR7KCaqp4eBuk?=
 =?us-ascii?Q?qCVc2vDcSKLlbwGTIdAObCwDJBEPL7EBxDK1b45TeuWmbOoDSRiC5lIGTXyz?=
 =?us-ascii?Q?ZrGM1JtFTgbHE9uoo3JYyMpRCcbFuDMYmVmRwWD4h49NzjsDzMaE5FRb4Mri?=
 =?us-ascii?Q?a0xar8GLd0KLo253t/xrtqkzONzlLjg9vltU+sVQvbVc5rSDWY0yGTusxgch?=
 =?us-ascii?Q?a9fguR2L18hNWwBBddNrBZC879TDNT5NtM8w9EQ0XxD2obltGz45zhHZl2MR?=
 =?us-ascii?Q?NDsewHFCLTPPj4XbmE8FSRdT9sx1DHhWI79LGLrm/zYwb9C3VeM783DTiJJF?=
 =?us-ascii?Q?XcNwojnpsP+J2UxK9txu3OIgK43nZ3XIeGfwtC7x/ooY7208OkK342pCx9jV?=
 =?us-ascii?Q?/XQmJKYwG01Inj+Kwi94/XpMqtkbZX8ZeZEdSWQq1Y6Y9CG9THqf+zh3W82q?=
 =?us-ascii?Q?FkuiwtHU9LK5euG6Hs6COCP1/mk/PdGP+DxbD08Cy3OT5Nej9K2ndef1kJDX?=
 =?us-ascii?Q?LZWwheBJgHb+5LBCx2MC5LKNC9YJ6/sObwiH8V7Mgavra39bjB+Xa2wKmHWc?=
 =?us-ascii?Q?J2BUpQqf8pQ5ysVsSZDkvSVxUbPLKWDa7w47ccWr+nGHXzWfrlc3/5/D907g?=
 =?us-ascii?Q?pY27OfZ60zJqBu7d0RO9jTL9qDH7OTr0D5VaLyB+WxnUwgaiYvWFBVkqGfkY?=
 =?us-ascii?Q?Ram29tydUfmROvMEmQUqr6YYQNSj1w+bp9eYlk8hQ+mOgu3T3iSj5RzaHlA2?=
 =?us-ascii?Q?HVkuiLNI6aBpABlG0O5FjGjGHj+wN4ti9vdrTugLSdSFzoIVcEQbM2O94e0E?=
 =?us-ascii?Q?SUXRqG7/GgdSqubACHZmr7bScjqAljoQ8aDFloTK/wGz1ULHNwNgchNQVUS3?=
 =?us-ascii?Q?8cLazE8jQdGh0J3iWBVBNarBXNGqkhyJ8B2HPM7LKev7d4MB6d/01VVInyFY?=
 =?us-ascii?Q?hKWUBM0r26hjfeJwqmkUIXAnGY5lGJMuTC1uzr4yUVFl0upX/us2o3vhf9q6?=
 =?us-ascii?Q?lsNb25/ryEDtnwxo5ktdj3eCKSCl2KFeBCcEae3hAB2jdmHGvAM6nSMT9IjO?=
 =?us-ascii?Q?ASGxWEapjfmmZd/FKJojKaljns2avNs7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wk7C6cusEomrwL8bZQjMkTiIRWay3zmEAHlpZLJt0g9mwMkIyGS6GpAO+qOH?=
 =?us-ascii?Q?5brYRD3dkxh2R/snMcFFviw8kXSn9PF73mS8D4fXr3s6f/7khM+rYGjlQdrw?=
 =?us-ascii?Q?FSlbmMOUoWIOODVKRyiMy+CatWbGobYNQOhOOqt6vUIyJmoq8k+DqjzNVvs1?=
 =?us-ascii?Q?Due5TDURC4fjdaP3nhc7dU45qQPWURTX97ol/F8CzUhuCupTp13gf35QUzXY?=
 =?us-ascii?Q?RV3Dx7Iv/y247nCYQo3eTeqYNrbUscyHMtYySfKj11BeysYPjkPgKvrBtWG/?=
 =?us-ascii?Q?3TA2KAk/TwIrnmxx9tzlYDJjWmFjKjUJfwP0n84Ti+i73DIsX6JeDR/osZjh?=
 =?us-ascii?Q?PPqEdWEsc/FWtE8rBfF71YNyw5Aee8eJ6YKBYOM9C64q84I1NbKWND9wgwzj?=
 =?us-ascii?Q?g+QSfjsX0s5SP0i7Ru46QgK02D9EqEE94CrwHwt7B8DjBqYS3OpmX6MpnouX?=
 =?us-ascii?Q?iGreBqvPO26ItosDAHNhCUVNSxtIN03xbRchc62jH0hwq6sbeGK4E93iyzHK?=
 =?us-ascii?Q?lXo2rAbp75nNZgRPS57D/F2I4uy/aP1muZmP6v5tIoepxcMWmppGA9w2jcS8?=
 =?us-ascii?Q?hfC181GXEYy/edp0tJba4sQFWKsDI2FGq3ZPd+rGxynxWKxmmtCvxApcIefF?=
 =?us-ascii?Q?TL9gk3Mvcdvqz1hyvknBDOcaNskIYJBTgTW+rvE/9UdsV05EscMpmP6Rcrjp?=
 =?us-ascii?Q?/eiORmrhlQoMkuaC88Ij+LRf4TU9k0CSMO5kPuINBDlCEJ35brutd6NVBxZb?=
 =?us-ascii?Q?g8aHxv6g983wE3EY+6cyDlFIlL6y0ixBIpxEbPMvycItL1+XoG23N5HLiC1Y?=
 =?us-ascii?Q?CXsnSRRzx6VeaKPp0GqL73JqOX/92o5jkuwJOwpK8krjhm79/1CN3dFK2bb6?=
 =?us-ascii?Q?d4ER5aYLbGDonYsSZW6SgNnCY9dIqmUIxk0O6KFgRlPvOKHWqYiZYwoUnEBn?=
 =?us-ascii?Q?wZeDBhtfMdi9Lp1Ix5NbqK/o4WcECulTL91E9b2gulI2FuR89hWY79dokP7X?=
 =?us-ascii?Q?xtoBfERlV6zR6QwWtddaUEGA39PLvIf2SugUeSfTe6TB+zD2TYjw4RbCJ/hB?=
 =?us-ascii?Q?ufig/t/RQ18kqWzCUI2AndmODG1RCe96G8739qXJxzbYF7sAfWSLwxWIV+za?=
 =?us-ascii?Q?AteGLGFJ/PCQ2CCqmyCFZRdlN2PEmR3hPC/ZwmDPtfAjkXAUORfBFZADS5wS?=
 =?us-ascii?Q?LbmplxN1FMHhm2WiWkPSUYikxbzzPu+7EWS4giJfZpBrBoflas0K0/E4tqet?=
 =?us-ascii?Q?XF6rQLUZh5vWQu16jqcq7Sn0f8mSMVSf8iUMDQikCu8TF3QwbBp4AXAyaXy4?=
 =?us-ascii?Q?YjaARnUenvfrFOVXcsdWDTDBuD3NHV6rrnNl9CHd8Kp3FBqCOvuF/eAyDJNa?=
 =?us-ascii?Q?KEW1MOycg9LHY9SrKI3OZz0QfeGsxK9JhcKr0iEXNl9NyAZJuEGs7NmSuIvS?=
 =?us-ascii?Q?jdjSYjxndsjjz0mccycJFhEhiXOnqPG2r6q9xytByyRlSWEeVIEReMEP2pFM?=
 =?us-ascii?Q?c00u/Z0i++rxhZTjRTeVrWGOQjYCR/dkREKpS0WoyntF0rg9CqGYXadpmEsM?=
 =?us-ascii?Q?DkSoYLcVDK8zOZ0DrFPZQEU22bB1BpSv55GOof26dEm2lAXgbNoPoLfRaKZV?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5041656-cb7f-45eb-acbf-08de0ce8b7bd
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 19:17:59.3021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q2VuVN9mqvmhraEWwBDI+AlIeeElpg4XFlb1NsIVbk8dvEfdK9lJsRUvCslh02F3K9h5goU2b3mlkIeUre7KCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7567
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

On Tue, Oct 14, 2025 at 11:02:58AM +0530, Riana Tauro wrote:
> v2 survivability breadcrumbs introduces a new mode called
> SPI Flash Descriptor Override mode (FDO). This is enabled by
> PCODE when MEI itself fails and firmware cannot be updated via
> MEI using igsc. This mode provides the ability to update
> the firmware directly via SPI driver.
> 
> Xe KMD initializes the nvm aux driver if FDO mode is enabled.
> 
> Userspace should check FDO mode entry in survivability sysfs before
> using the SPI driver to update firmware.
> 
> v2 also supports survivability mode for critical boot errors.
> 
> 	cat /sys/bus/pci/devices/0000\:03\:00.0/survivability_mode
> 
>                Capability Info: 0x138320 - 0x2001ae06
>                Postcode Info: 0x138324 - 0x0
>                Overflow Info: 0x138328 - 0x0
>                Auxiliary Info 0: 0x13832c - 0x0

I am truly sorry here, but although I was the one that designed this,
looking it now, I realized that this is breaking the sysfs rules
of one value per file and no fancy format. This is only allowed in
the debugfs.

We need to change this asap, and with help from any tool that
might be already consuming this.

>                FDO Mode: enabled

After we fix that we can come and add this.

About our options: I don't believe that debugfs is an option
without the drm card right?

Perhaps what we need is to transform survivability_mode in
the directory. Each entry becomes a file in this directory.

Sorry,
Rodrigo.

> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pcode_api.h             |  2 ++
>  drivers/gpu/drm/xe/xe_survivability_mode.c    | 32 +++++++++++++++++--
>  .../gpu/drm/xe/xe_survivability_mode_types.h  |  6 ++++
>  3 files changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 92bfcba51e19..d41f07f9194d 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -77,11 +77,13 @@
>  
>  #define PCODE_SCRATCH(x)		XE_REG(0x138320 + ((x) * 4))
>  /* PCODE_SCRATCH0 */
> +#define   BREADCRUMB_VERSION		REG_GENMASK(31, 29)
>  #define   AUXINFO_REG_OFFSET		REG_GENMASK(17, 15)
>  #define   OVERFLOW_REG_OFFSET		REG_GENMASK(14, 12)
>  #define   HISTORY_TRACKING		REG_BIT(11)
>  #define   OVERFLOW_SUPPORT		REG_BIT(10)
>  #define   AUXINFO_SUPPORT		REG_BIT(9)
> +#define   FDO_MODE			REG_BIT(4)
>  #define   BOOT_STATUS			REG_GENMASK(3, 1)
>  #define      CRITICAL_FAILURE		4
>  #define      NON_CRITICAL_FAILURE	7
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 1662bfddd4bc..1c9421651548 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -16,6 +16,7 @@
>  #include "xe_heci_gsc.h"
>  #include "xe_i2c.h"
>  #include "xe_mmio.h"
> +#include "xe_nvm.h"
>  #include "xe_pcode_api.h"
>  #include "xe_vsec.h"
>  
> @@ -61,6 +62,12 @@
>   *	Provides history of previous failures
>   * Auxiliary Information
>   *	Certain failures may have information in addition to postcode information
> + * FDO Mode
> + *	To allow recovery in scenarios where MEI itself fails, a new SPI Flash Descriptor
> + *	Override (FDO) mode is added in v2 survivability breadcrumbs. This mode is enabled
> + *	by PCODE and provides the ability to directly update the firmware via SPI Driver without
> + *	any dependency on MEI.
> + *	Xe KMD initializes the nvm aux driver if FDO mode is enabled.
>   *
>   * Runtime Survivability
>   * =====================
> @@ -105,6 +112,11 @@ static void populate_survivability_info(struct xe_device *xe)
>  	set_survivability_info(mmio, info, id, "Capability Info");
>  	reg_value = info[id].value;
>  
> +	survivability->version = REG_FIELD_GET(BREADCRUMB_VERSION, reg_value);
> +	/* FDO mode is exposed only from version 2 */
> +	if (survivability->version >= 2)
> +		survivability->fdo_mode = REG_FIELD_GET(FDO_MODE, reg_value);
> +
>  	if (reg_value & HISTORY_TRACKING) {
>  		id++;
>  		set_survivability_info(mmio, info, id, "Postcode Info");
> @@ -171,6 +183,9 @@ static ssize_t survivability_mode_show(struct device *dev,
>  					       info[index].reg, info[index].value);
>  	}
>  
> +	if (survivability->version >= 2)
> +		count += sysfs_emit_at(buff, count, "FDO Mode: %s\n",
> +				       str_enabled_disabled(survivability->fdo_mode));
>  	return count;
>  }
>  
> @@ -179,9 +194,13 @@ static DEVICE_ATTR_ADMIN_RO(survivability_mode);
>  static void xe_survivability_mode_fini(void *arg)
>  {
>  	struct xe_device *xe = arg;
> +	struct xe_survivability *survivability = &xe->survivability;
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	struct device *dev = &pdev->dev;
>  
> +	if (survivability->fdo_mode)
> +		xe_nvm_fini(xe);
> +
>  	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
>  }
>  
> @@ -230,11 +249,18 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
>  	if (ret)
>  		goto err;
>  
> +	if (survivability->fdo_mode) {
> +		ret = xe_nvm_init(xe);
> +		if (ret)
> +			goto err;
> +	}
> +
>  	dev_err(dev, "In Survivability Mode\n");
>  
>  	return 0;
>  
>  err:
> +	dev_err(dev, "Failed to enable Survivability Mode\n");
>  	survivability->mode = false;
>  	return ret;
>  }
> @@ -365,8 +391,10 @@ int xe_survivability_mode_boot_enable(struct xe_device *xe)
>  	if (ret)
>  		return ret;
>  
> -	/* Log breadcrumbs but do not enter survivability mode for Critical boot errors */
> -	if (survivability->boot_status == CRITICAL_FAILURE) {
> +	/*
> +	 * v2 supports survivability mode for critical errors
> +	 */
> +	if (survivability->version < 2  && survivability->boot_status == CRITICAL_FAILURE) {
>  		log_survivability_info(pdev);
>  		return -ENXIO;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> index cd65a5d167c9..379d90759c28 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> @@ -38,6 +38,12 @@ struct xe_survivability {
>  
>  	/** @type: survivability type */
>  	enum xe_survivability_type type;
> +
> +	/** @fdo_mode: indicates if FDO mode is enabled */
> +	bool fdo_mode;
> +
> +	/** @version: breadcrumb version of survivability mode  */
> +	u8 version;
>  };
>  
>  #endif /* _XE_SURVIVABILITY_MODE_TYPES_H_ */
> -- 
> 2.47.1
> 
