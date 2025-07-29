Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A45ADC83F26
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 04:40:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE7210E5C9;
	Tue, 29 Jul 2025 04:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZXsSxpgG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D4910E5C5
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 04:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753764032; x=1785300032;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=01sSx/ieLyKpdfF7eQIiaUZfwvSvwKkMTBGWiqlKVuU=;
 b=ZXsSxpgG9bVpW9gJwZApqBHWYyrKr3JwntjXkzAsWGVRDP82+Wb3Fo+q
 FjV/2UgYqQlzcg3zD/hN2qs+0bLgamjk1KD0ATtWCbEHFFs/vnLFWt9lF
 Kjz+2lzIFksV+eWWA+yPYlQYbJU0PIJ0cAecjgyhAakSziyDT/oG9wj7u
 4gh63RXt/PYZ041oekW9+F7+hDx/VT+OZLCK4GuoqAZZrSjGkGRAdxykQ
 pwQ+t0YMF+uXbXpT+8NUwTtXVSjq8hr+nkidN0s/utWQoOW2eNLKSC4+q
 L9T2kca6lGvzFVgHXE8Jp7MkL9fHKHJRZQ103nIkRQe3/sHciZjOkX+mW Q==;
X-CSE-ConnectionGUID: sCjJBaWuQK+DbVwn0pa2OQ==
X-CSE-MsgGUID: NuBTextgTBqrz+wqS1uUDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="66729206"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="66729206"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 21:40:14 -0700
X-CSE-ConnectionGUID: IzGPHAFzSge2iZIWRftQQQ==
X-CSE-MsgGUID: 4wP87kjcTa+XdgXVLto/Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="161855730"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 21:40:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 21:40:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 21:40:09 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.61) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 21:40:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCmeZyqbWkFrIiWBEs3XXDufHWWq1DlnEegoCr4Kl9XOOPJPSKvg0I9Ao6c+0b8JW26XInjzQjKAfTEWZ2VJbiePK/FKmpS6QpShZv1Gyz86sQq3BEJUY8tgp3yla4LpHRL19PpvbjvGQ/1matMcFXk9h9BsRobSrshTwc19D6iBIz2C2sUECWX2Ai/gHXeG/2h8wo/6f2O07WNgBHreOEvkHKIKxgBKTJhKBRiBzT5h5dLUxmISPC9WLm2REPIG72I2qSQUenVRiY1jx245ijqx3lm22HEQpor/o1Zk3I1+tlSGQkNvXIQV6aJy4R0ZU0CGG+fAFLe47J/mDUPK2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0GYFZ0q2zn1ZtAyeFkH0IJXIR9oyQ8EMdRsXclpq/0=;
 b=vWyrfW5GldsXdvtzd/T4auyd/j9qqnNfdxb3oRK6vFASCxWsh09uheRhUCaSCPlPsbIDvDgcqLHtpBwU033dArUZ1NJkxb+lyV3SjKYMBO7OZKBFKq6kn8n2uAFsGbMfkO8Yha9QuBb91gnqvghhtcds2cweFdH4vxYxfCceLIoPDujBwelmpS9u3QQUNDrcGc/0uzUTDNKQ/M1ecg3/PwPoxbfEo7vRDjg1OMuak99tok+32k8xzCU6Wuhffcn8sRqhbk19fE3/ta9bC4jXnTXKnnJMy6R3nC+759ArwQHF+vnw7Ye3wxO524a5q6GjLIUMs8H5vHbTAlUUlC0ejQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6487.namprd11.prod.outlook.com (2603:10b6:930:31::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 04:39:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8964.026; Tue, 29 Jul 2025
 04:39:53 +0000
Date: Mon, 28 Jul 2025 21:39:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v5 21/23] drm/xe/vm: Add a delayed worker to merge
 fragmented vmas
Message-ID: <aIhQlxdb0778u1ad@lstrano-desk.jf.intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
 <20250722133526.3550547-22-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250722133526.3550547-22-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0340.namprd03.prod.outlook.com
 (2603:10b6:303:dc::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6487:EE_
X-MS-Office365-Filtering-Correlation-Id: f834415e-b202-4556-021b-08ddce59f639
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DTvNgRa3wI4mIAal4CO85g+rnssRiAogbJE0cLLblLP6FoRSK91DJG1emyel?=
 =?us-ascii?Q?GIgAMe4trOmdt0c5ZP4G5c/hG9WSU3kBo6zIvGBFHxlk87Zd31PW334+pGDv?=
 =?us-ascii?Q?Mfmb/aAxQLwvaH3RboY8FJoMUL/mm7AdJvE3eeOOffCgILQRFgnsl4Nl5etI?=
 =?us-ascii?Q?anfyRf2ZOSO+NUmV77Q/yMGFi25/6TGug17CpNRa0k47au3FoWCp3Ja864Ti?=
 =?us-ascii?Q?8/L9GqYkeQYFU1TTLOjm2yPYG3hpxvugMBbdOTjPmMJVCMt4TcLkT6DEK803?=
 =?us-ascii?Q?z0iRG/PIh1PwqGeTkagkvuyQ0TyOMXr64b6smHiWOB62kg4HgEAGWAA60X68?=
 =?us-ascii?Q?kahUg8wydgLrgj5WLsixKPWFM2aWBn40K/JPVtjcUqM37urTVV5ktaf32Fcj?=
 =?us-ascii?Q?WRBd+gh1rECsAi2/a7Ink06IYc0XSd8iHTNbQiO3PbAZlxpoL4q0AHQScOBq?=
 =?us-ascii?Q?ZkaMdBYXTAoQ6bxzadDxll28/KR+Ju2SWELB+F4JQri7fReiL0yzO2exxk3w?=
 =?us-ascii?Q?PcMmGvOkKvxtgkjSkwbXJU7A0nSMgdjiR7yYQ8TN7vvSOJ/Xs2ciCZgufsYS?=
 =?us-ascii?Q?ibPq03Kd8KyQKoBFlRLijYOa/v4poilmUbJ4xf79JEwdpVsUwIFNfGgSJOZD?=
 =?us-ascii?Q?UqQLQGgtVNo70d9IbLouq/h4emfr+SOiXGbhChCyeUesYPaiy3yqv4ox2Y3R?=
 =?us-ascii?Q?F4AfYwvyDryO7KSWtXBGSlX6eml3EIeTj7CRHZOH25lWIeaMbPIV/ghpUzmK?=
 =?us-ascii?Q?DTqJMWHfYu5jOstquMRhNmf5bGEnfrd1bvbvAx9fCkX9gZ+neCn2jDRZ1QpS?=
 =?us-ascii?Q?FgLhH96/1v6QNe5cTm7ifFOplGaWqoeKKzzfyomLxUfYfWwJfuBCyg2qEw2a?=
 =?us-ascii?Q?MvqV0qafFeZ58/blmM9fBe0tNPqtg59DrJ4D02YQybgn9Bd1VgIzDAqkkLfQ?=
 =?us-ascii?Q?nsz7B/nux5mGmPoqfL2SLUMZkZGecTCVTsVEcu8VQJJD5E819sHvzdR/dIel?=
 =?us-ascii?Q?TXrp6AkOqls4HOW9aruM+VvEfOOoAmhjhhOl8wjPVMWAeGMAFmlaZ14qRS/k?=
 =?us-ascii?Q?nGI4L4EXWx7IAYXTKRri50eweItNr7FeovviWMESQTRGro59BIWXCoilBIbb?=
 =?us-ascii?Q?WGyHvUG/3PE409uGq2oog73eqS6ZuX+Rg2FpnNDvcxns3jt9FCDJXw4KGC0V?=
 =?us-ascii?Q?yq3JfBYiSU9l8QclLbwJqOoBudhuHcc+C6sDuy+pZ//Eg7eIrpUrOTjx9PLi?=
 =?us-ascii?Q?pX8neJCZtYPnPqRcJ4w73+Qao3o4r9vArGp+caxrhhVVxUwk+AwH36Jh/ZHL?=
 =?us-ascii?Q?GQBLyL5MzzcgY5KpfrOSv8B0lC0u72D11y3r63euf+8+ARkLUzFK1lNrtiUN?=
 =?us-ascii?Q?AaeuqW+Te4j2EhTfWMJCxaXfMWjne9kp550N8V2txZmdgBczfnuTYrnBIiLN?=
 =?us-ascii?Q?udPzC9Fl9yU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L1e9uiDJvabuWWwqE0nepeaPHz4e1G7EvH26RcSfIjxEup63ObDkRcebO8qJ?=
 =?us-ascii?Q?VsHKNt+DLjqRLIr40uGzAGPEKlRb+bJhFelNXY6/gmTF0UYIhoX9lEhvn96Q?=
 =?us-ascii?Q?bcMzl8vS72DbYzK0EiSnmqJZiBRrm0RRuWbq3vCkbvB5W2cRITe9XTJC4EI1?=
 =?us-ascii?Q?qGmwj3wTR5SGRAgC2QJKUc9V+hCS5zlDcQl2xitCqSuyZiIfr8HDdLSywdys?=
 =?us-ascii?Q?j5f1jUieUxmm6RGV1yD6kyTHnOO38eaB0lW+MEoLrD+SBEVrsw5sMes2YnOe?=
 =?us-ascii?Q?aBLp0Oowk2YRQgc3/tA2f4fKEtapnjwdaI0ugR7QiqMp2Z6J0/hD20jjSf1O?=
 =?us-ascii?Q?6qBwFGeNHY69M2RES2waWmVdfrymO6mLWPrOR3+CQ1ruf7XzI3i6GqhexfYg?=
 =?us-ascii?Q?BOXIVRh0Fp2z6xVRh1tyG+2A4IifTFPZqnXJSHRlKrCjaR5yJpA0G0l5B96k?=
 =?us-ascii?Q?+jMaJrjcjQXqrXndn5BaMKnklOOCSTT99MeP5Lb+hSCElXxeV14pq9kj58+U?=
 =?us-ascii?Q?jHuDix59G+aFfg5hfTuWPhTdmiEMzGS/E2cAJO1dojVF/TxApD1Hbruf5DQW?=
 =?us-ascii?Q?YQtCFMwDovgzCJAsJOqG0CIVCGi+bOn+suFDk3xvLhK47bHg9uMA/Cy0J/RD?=
 =?us-ascii?Q?KHilS/2UhR7qdMdWwWjQUk/DO7xncEcsYQiTMrsJksBdagbmHAjva313lyaj?=
 =?us-ascii?Q?Aqf2OrR2MDclJ9H3KShBA0UetL8GGdvJiW4rft4oXKt10Egt9BgP/BvAgvoQ?=
 =?us-ascii?Q?fl3IY3vymUGatNsKp/SfLYXIXGpkS5Mo+w+iGYTt/P3UHeU9zG7g5QdBDUxq?=
 =?us-ascii?Q?IrYsFjVIvLyfcfnyVWMbDZn/hNaGVXTALU4YDLGf2bd+nvXgcYAiM/w3BcgE?=
 =?us-ascii?Q?uSxQCZB03xarbrjoIv+0HXSfvkHM/DA72aZOD7U1ah/J4MbVy7myljgiDYEo?=
 =?us-ascii?Q?SwK7BAbEYY6VetiD3nNlurHSZ8CxnbOxxMXfBRa5dvyd6eF9+s391yUjqcSx?=
 =?us-ascii?Q?gxRjW9sXaoz5DW6FAcnpp35fOAtp5mdQZrRwwdGy+xBA0vwalujkJrgk1zi1?=
 =?us-ascii?Q?gCL0ieYEmi7sIxsKof4/Xhtl22AKx6/g7zyoPgwKqEZAYvUSRu+SwCgZhzlU?=
 =?us-ascii?Q?pabML3DURajg2Mmp2l6XiBqf/c+SGksRgssA2Kz+yCGSe6A8PWR89suFdEUh?=
 =?us-ascii?Q?Zpx/kolN8KNDJnukFHGYoRGr0MUhPWk44LwAlQ6SIxHxqscP4mmFhpFzZiMc?=
 =?us-ascii?Q?mPtwyPkOdAyTEJOwS3uym3mb+SVxJ+45FVm+uobELb2k4+fucqjlhpBq9Wul?=
 =?us-ascii?Q?JT1lEydX7gtaosCHO2YhVf5FIB4rF3MIByg16/IZ9uqKc9G2ihvVMtZSjxoc?=
 =?us-ascii?Q?vEcPUv6VMXOIBiU8ytjurMV3eu2ACiwXs5Wx6ymnSqDZ2+AmtSp2oqVasjc9?=
 =?us-ascii?Q?U1GnPUjaoyfw46o6BOI5eXSH9BoZFc7JlCXNdZ9xXNDX3T6NOR/xSy5bI+g6?=
 =?us-ascii?Q?Ui/BxGDYmdRD4L4edmjqkLaV17CvwymXLhEUOp7/R6racepsfOWM72Dfj/UY?=
 =?us-ascii?Q?HAcQ1rSL2Vf7PXjTk1b3kMdbaPrQR3zA3J6riLqgqZ60ZCmiP5vf0H2dJmxg?=
 =?us-ascii?Q?yQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f834415e-b202-4556-021b-08ddce59f639
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 04:39:53.6373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iwklcppA0b19vpRj5al+AnGGJG7QxUP5dGQIlV9obMbuDkDBHl0t8jvuhVHkVPQTeY1QP9qJbuPttdP9pFimOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6487
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

On Tue, Jul 22, 2025 at 07:05:24PM +0530, Himal Prasad Ghimiray wrote:
> During initial mirror bind initialize and start the delayed work item
> responsible for merging adjacent CPU address mirror VMAs with default
> memory attributes. This function sets the merge_active flag and schedules
> the work to run after a delay, allowing batching of VMA updates.
> 

I think we will need someway to defragment but it might need more
thought. The trade off between defragmenting on every insertion of
mirror VMA (binding a BO back to mirror) and every unmap restoring the
defaults vs. periodic worker needs to be carefully considered.

The trade off is more time up front (plus perhaps some additional
complexity) vs periodic worker which blocks out all memory transactions.

Since this doesn't affect any functionality, perhaps table for now + we
run this one by Thomas to formulate a plan / solution.

Matt

> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c       | 126 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm_types.h |  15 ++++
>  2 files changed, 141 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 003c8209f8bd..bee849167c0d 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1160,6 +1160,127 @@ static void xe_vma_free(struct xe_vma *vma)
>  		kfree(vma);
>  }
>  
> +struct va_range {
> +	u64 start;
> +	u64 end;
> +};
> +
> +static void add_merged_range(struct va_range **ranges, int *count, int *capacity,
> +			     u64 start, u64 end)
> +{
> +	const int array_size  = 8;
> +	struct va_range *new_ranges;
> +	int new_capacity;
> +
> +	if (*count == *capacity) {
> +		new_capacity = *capacity ? *capacity * 2 : array_size;
> +		new_ranges = krealloc(*ranges, new_capacity * sizeof(**ranges), GFP_KERNEL);
> +		if (!new_ranges)
> +			return;
> +
> +		*ranges = new_ranges;
> +		*capacity = new_capacity;
> +	}
> +	(*ranges)[(*count)++] = (struct va_range){ .start = start, .end = end };
> +}
> +
> +static void xe_vm_vmas_merge_worker(struct work_struct *work)
> +{
> +	struct xe_vm *vm = container_of(to_delayed_work(work), struct xe_vm, merge_vmas_work);
> +	struct drm_gpuva *gpuva, *next = NULL;
> +	struct va_range *merged_ranges = NULL;
> +	int merge_count = 0, merge_capacity = 0;
> +	bool in_merge = false;
> +	u64 merge_start = 0, merge_end = 0;
> +	int merge_len = 0;
> +
> +	if (!vm->merge_active)
> +		return;
> +
> +	down_write(&vm->lock);
> +
> +	drm_gpuvm_for_each_va_safe(gpuva, next, &vm->gpuvm) {
> +		struct xe_vma *vma = gpuva_to_vma(gpuva);
> +
> +		if (!xe_vma_is_cpu_addr_mirror(vma) || !xe_vma_has_default_mem_attrs(vma)) {
> +			if (in_merge && merge_len > 1)
> +				add_merged_range(&merged_ranges, &merge_count, &merge_capacity,
> +						 merge_start, merge_end);
> +
> +			in_merge = false;
> +			merge_len = 0;
> +			continue;
> +		}
> +
> +		if (!in_merge) {
> +			merge_start = xe_vma_start(vma);
> +			merge_end = xe_vma_end(vma);
> +			in_merge = true;
> +			merge_len = 1;
> +		} else if (xe_vma_start(vma) == merge_end && xe_vma_has_default_mem_attrs(vma)) {
> +			merge_end = xe_vma_end(vma);
> +			merge_len++;
> +		} else {
> +			if (merge_len > 1)
> +				add_merged_range(&merged_ranges, &merge_count, &merge_capacity,
> +						 merge_start, merge_end);
> +			merge_start = xe_vma_start(vma);
> +			merge_end = xe_vma_end(vma);
> +			merge_len = 1;
> +		}
> +	}
> +
> +	if (in_merge && merge_len > 1) {
> +		add_merged_range(&merged_ranges, &merge_count, &merge_capacity,
> +				 merge_start, merge_end);
> +	}
> +
> +	for (int i = 0; i < merge_count; i++) {
> +		vm_dbg(&vm->xe->drm, "Merged VA range %d: start=0x%016llx, end=0x%016llx\n",
> +		       i, merged_ranges[i].start, merged_ranges[i].end);
> +
> +		if (xe_vm_alloc_cpu_addr_mirror_vma(vm, merged_ranges[i].start,
> +						    merged_ranges[i].end - merged_ranges[i].start))
> +			break;
> +	}
> +
> +	up_write(&vm->lock);
> +	kfree(merged_ranges);
> +	schedule_delayed_work(&vm->merge_vmas_work, msecs_to_jiffies(5000));
> +}
> +
> +/*
> + * xe_vm_start_vmas_merge - Initialize and schedule VMA merge work
> + * @vm: Pointer to the xe_vm structure
> + *
> + * Initializes the delayed work item responsible for merging adjacent
> + * CPU address mirror VMAs with default memory attributes. This function
> + * sets the merge_active flag and schedules the work to run after a delay,
> + * allowing batching of VMA updates.
> + */
> +static void xe_vm_start_vmas_merge(struct xe_vm *vm)
> +{
> +	if (vm->merge_active)
> +		return;
> +
> +	vm->merge_active = true;
> +	INIT_DELAYED_WORK(&vm->merge_vmas_work, xe_vm_vmas_merge_worker);
> +	schedule_delayed_work(&vm->merge_vmas_work, msecs_to_jiffies(5000));
> +}
> +
> +/*
> + * xe_vm_stop_vmas_merge - Cancel scheduled VMA merge work
> + * @vm: Pointer to the xe_vm structure
> + */
> +static void xe_vm_stop_vmas_merge(struct xe_vm *vm)
> +{
> +	if (!vm->merge_active)
> +		return;
> +
> +	vm->merge_active = false;
> +	cancel_delayed_work_sync(&vm->merge_vmas_work);
> +}
> +
>  #define VMA_CREATE_FLAG_READ_ONLY		BIT(0)
>  #define VMA_CREATE_FLAG_IS_NULL			BIT(1)
>  #define VMA_CREATE_FLAG_DUMPABLE		BIT(2)
> @@ -1269,6 +1390,9 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  		xe_vm_get(vm);
>  	}
>  
> +	if (xe_vma_is_cpu_addr_mirror(vma))
> +		xe_vm_start_vmas_merge(vm);
> +
>  	return vma;
>  }
>  
> @@ -1982,6 +2106,8 @@ static void vm_destroy_work_func(struct work_struct *w)
>  	/* xe_vm_close_and_put was not called? */
>  	xe_assert(xe, !vm->size);
>  
> +	xe_vm_stop_vmas_merge(vm);
> +
>  	if (xe_vm_in_preempt_fence_mode(vm))
>  		flush_work(&vm->preempt.rebind_work);
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 351242c92c12..c4f3542eb464 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -374,6 +374,21 @@ struct xe_vm {
>  	bool batch_invalidate_tlb;
>  	/** @xef: XE file handle for tracking this VM's drm client */
>  	struct xe_file *xef;
> +
> +	/**
> +	 * @merge_vmas_work: Delayed work item used to merge CPU address mirror VMAs.
> +	 * This work is scheduled to scan the GPU virtual memory space and
> +	 * identify adjacent CPU address mirror VMAs that have default memory
> +	 * attributes. When such VMAs are found, they are merged into a single
> +	 * larger VMA to reduce fragmentation. The merging process is triggered
> +	 * asynchronously via a delayed workqueue avoid blocking critical paths
> +	 * and to batch updates when possible.
> +	 */
> +	struct delayed_work merge_vmas_work;
> +
> +	/** @merge_active: True if merge_vmas_work has been initialized */
> +	bool merge_active;
> +
>  };
>  
>  /** struct xe_vma_op_map - VMA map operation */
> -- 
> 2.34.1
> 
