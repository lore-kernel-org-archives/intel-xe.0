Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688C2C88E41
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 22:17:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25FE810ED32;
	Thu, 10 Sep 2026 22:17:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BaDQXn53";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E26310EBD0
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 22:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789078662; x=1820614662;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uzi93KI2VtiF/BBJ1w/fQL1p4Yi1zWqB2G3FdpHkUio=;
 b=BaDQXn53dETRiohww2by5sBuOS80XDUxU38nzLHg/CPgd5r3U+1u99lu
 Uf5fckcg9tE9CKM4pXKyl5IJh2GdpeLD6iGl3NKcUviz9R4y8uJ/oqO23
 DSbnKfwoy20hTnqDW+oDmWOj+74hyREiOBIQ7KwA6sv7tm7Lu5c59StzU
 3Lmlwjz+iA2hup6Bb6BvBlHRkpEUA0KrGwiBtfMbi2NjsLtVX/ZND2WhI
 j3O1K7rXs1qR2hhakvF0mG+9cpl8hU1OPqfiP1+opqXYkZ+lLob+3y5PF
 U8RKovQMO42mEaXwmgEVbBCdlrL39Q9Qn2Xfg7UXgbWnAlJtUiv8Iobm9 Q==;
X-CSE-ConnectionGUID: oBgsMlchTEimbkFmAFBzSQ==
X-CSE-MsgGUID: qxZE6PFWQfSt8V4KxBPOfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89381908"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="89381908"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 15:17:42 -0700
X-CSE-ConnectionGUID: BYB7/fbdSFWUEQQGVrVwTg==
X-CSE-MsgGUID: 52fYipLLRl2c/r3r2nqgxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="269164749"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 15:17:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 15:17:40 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 15:17:40 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 15:17:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gCosFdGZyLGB2loNpQ1X3WkGzLA3g0V8nAIZdERYXNqJr3I4kDk5uy8yKjSvq2ffiF/wB97h5zEL0IKAf9GiPLavU4tRq6f4rJC3w5hT/nsHZYY1Xd9RI91hxyDJG6Xv3yPhi/OCIm6G+55MPGW8bjK0LBBPz+Nhw/w/qqCdhsoy5jrsePDBdEbsayywKfgFp5nm5zop6e/6A3E8nTrIZFus7qZYpYft7QYUBnIPqjzavxttRUbcGWOCuERZzOcmEIjvfK6BuS0AP6Ajreh1CsvmG8fjMWitPDXNgOoCKu9PPbAUqQ/8WCCLksaRKRoklekH/gciVzyS2WsGb4DhUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28tK/D17N+RWNNDsRx4/T3SQqBG6OXs988/NhT1apSw=;
 b=OT/CdLi2UKiDRVQBprQFnQ+EehU1Ai2oRCtS3WQs67ErMcuEanH6NENz15qG5jZC+MY0GDNJXoB8xGor1/Fq7IWVZs9buQS9ciWHPryxtsovegVjw66zj5ZP7hryRxG1iv3yrpmC3tM/qawE2oc8/pr9wVZk4E8L+AixoQxzLItrs7kDBoFUSVQ/X42Qc77ZBn6k73lGo0UFmeQhy9/t4KixnKurPZP22j63zgMnHvil+pqOn3z/rj8FEZr9cjuZiWvT6EKwJBwPib85UgKP2WUtE767vYg4TtR9MZO0vcsLH+inLWVhwRkJon3gkWSIJLudf+yf0/sLKAPqA+b2KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by CH3PR11MB435924.namprd11.prod.outlook.com (2603:10b6:610:34a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 22:17:39 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 22:17:38 +0000
Date: Thu, 10 Sep 2026 18:17:34 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe: Inspect all forcewake bits for runtime
 idleness
Message-ID: <aqMsfvRS1Ge7Ke7u@intel.com>
References: <20260910212823.2358362-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260910212823.2358362-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: SJ0PR03CA0085.namprd03.prod.outlook.com
 (2603:10b6:a03:331::30) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|CH3PR11MB435924:EE_
X-MS-Office365-Filtering-Correlation-Id: 02026ce1-1af1-4fa9-95a3-08df0f8952f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|10067099003|6133799003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: sJwcWZQDKpSQ6BkACL9MERdyB3VfCeabwv0H5qwwMU3foeNXXJIRK/6nZuX/x6+omahXKbqjv8Z5ecffR73yOP0Y+zJg/YaKmrRBqHAfBEPd3/G4Wr0hqLINtIk9oZ2oC4WeTuDglejKjvBGg71SeN1XEC/SzzjaapHKcSpPbl1EOXs/8kH6gHhlhRrSCljgZHiiDBGkf3kOZLMm2NEtGITJJ6U/uyhRd8O3PjwJoMEgapudmQKrgb7uX+8huvkY3jjprNZRG5by2fPZCTImBr9gBLPwWkPxcCqxM7Uf+xpH3knQW2fNSX6wWX6JHjcpC/ddVgUyy2JOTlY7n89gZV2lSqX39B4KZpJpAxgX/+c/+xMZgeneUiaXIwqJujg6xQglVVfdC2M45obTkPvg7ol6PMrueDxIPeu5W+vmdNmUxVef1BoPceubj+Q1CLkNbi0bUec+J7ejYg8m9IV/pfHu4El63ENPQa3UOXTe4PqQd6tNi1Faf2f/C71OYAcaYzDZ/gMUhGqPpUumYJRT62lvHRRpscweRXaAy6EebvT8Fux3pwsxvvJTU38kNQ9jh9dMPwvfHD80K8E+TXql1jYnl+wq9hZC/WHg9ARqPArePTSKVf4fLvCAOuNrHQA30iCItQ84uWtF+hkAl/UhAV+7YCo/buzQBpBGKSUAxpM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qZV41Q6OU9HjIf+HvIelsaeIMnScEVgfOmGTkca/F1cUp1lAYiWyGBwaU9yQ?=
 =?us-ascii?Q?WoOzQD9Qym+5G/3Mc6I7hP1Q49RDSshPby84SzMfP0Ls7vt+9EoHfBh7XOt7?=
 =?us-ascii?Q?dxBpqFVru95KJ2fT5UseUF8HvL3yg5r3fSWCfHOIxo1QseCYkz301HiZN5KM?=
 =?us-ascii?Q?3W/S+r0YRI3tyPd1X2DbV82NyqsP84RzmyYXqhgGbJbl9HfTor/EHn9Lu6+p?=
 =?us-ascii?Q?a3Gu1/fL66CZX7LLBNs7eLoboiQJywTotHC4jBK1LFLsJ/fE56osWkctigcr?=
 =?us-ascii?Q?Nu2wGYeMgtlpAJJV2q2/+hKL9PdmwffC+Q5sPX84OFaPWuGUd7G5yQ7GvVvn?=
 =?us-ascii?Q?t9++1+QTL5Ufbo5N8uxpA3cSUWsh/wLmhd0XdvjizZe72IFYvtsuBqC5ffp+?=
 =?us-ascii?Q?/P31QzQ1OG0PlGrNvqXKuco/FtFZuDxZiBRdUGP0HJ8n5ZTypY+JkXiKmuHo?=
 =?us-ascii?Q?H0GM7/sSBIrZU+TXuj/beJMvBa31yIkWbzQee4M4vUl2y+XxN81/wYLwvQ2m?=
 =?us-ascii?Q?zVyPC/ar9ijsGhcFJRMdjWReKb4R/MmnEgqCYLQONxk5UridhBr7eVYeypN2?=
 =?us-ascii?Q?6U2acgDb9LQfc0jRmkSYMgxGS6rsZ/gyA5rakbPx3utuSRgeCXUsZQ9GDkqu?=
 =?us-ascii?Q?XIM7scac0RLc0sgjlDqI5SIi/xokzUSuFVzfhI/KHKaejiNcXMpUKOAkEuYO?=
 =?us-ascii?Q?z8bg/Pq/D9pxWoenZxLfwwuRKDgmflKBUeRc5AviBq7WATkwevqx34SEGmom?=
 =?us-ascii?Q?yML9LNDDHK8M22ERafq18isy7zunFHPvvhOvZmMXe6GB+lbuS9HK2AMwwhTv?=
 =?us-ascii?Q?GPxqH6oG7cINFeIm1i/lLOCryEPPE+uZSh3r5ZlPPfFD6tDlwDqBG9h2zs7b?=
 =?us-ascii?Q?YwqV2B6zaouDxcge2HajTAgnbq3xwBzw+FCYVz1CNmTRgGuqJ6XPTkvOMSow?=
 =?us-ascii?Q?D9ZbhAOHEDjsuTjWbhD5muwzZFSDVybmhEoVmbQ6yXSfW9bqocu5EyhMapdS?=
 =?us-ascii?Q?dq22ajNy9R0hu/9S+54EDygTYMXqKQ4D2mi4jHuVVdiS1Y0aDdXstm1iZJpS?=
 =?us-ascii?Q?xkHSYT0/m5Q/Ot3Uaf4qZDp3ZSgpwIe94flTeYG0B1jOJSbnL3UNZ988YtTZ?=
 =?us-ascii?Q?U+lpt2jPFXKZn4rDOFUUvQsFeMZYer1sDtwYTCokuxVxv5gk9WF9sFlxALhB?=
 =?us-ascii?Q?0OkuPo26VN3bD25g6JE6tQH6/T7a17A6aCmK4Aaq3UeiDx15xLc5G8oAB3nI?=
 =?us-ascii?Q?Ihj5D4a0rmrG1KkntOdlO/IvGehtIhGIbvFlB8CI6v8W5s2/88Lh/oUec1/o?=
 =?us-ascii?Q?N5m/IVFcCBWItBCi+mKhYDXBzSVJYDRSy4f7c2Ll23LjlG1PAXPvKhfrmKXL?=
 =?us-ascii?Q?XvVhqWqKWkVW207L3scSlzP9cfr2CDxfOZ9dw3Pd84VKUmZMUr4fCbkyavkO?=
 =?us-ascii?Q?DmiQ1ClfzlagnAWizviMSZmP6LjJBw/8MTEL9tGLKS/2IcFhqYb/uPYEVt+w?=
 =?us-ascii?Q?102aIoJMQFiEM85lC9xtc7Rxf1iVDprflbkIAwukdpWy2/nbr0ZQw9yE6URy?=
 =?us-ascii?Q?I6qrQenArqnhuxflEhvscVaAxpR3iKwGY+3usD0o18RSwUW4QfGNFpmTDBXF?=
 =?us-ascii?Q?l9Nc44rvolzvqHXdYLLms7fVpOVYXd649x8MuH8ymlFSBU/Uvk0tyJlt8vLv?=
 =?us-ascii?Q?IhT3gIk2G/Y3kwfO0TAVwNrjcde+TGMnM4uJyUmME1+Kxvc6cIURRP7C2V+d?=
 =?us-ascii?Q?OuuFYQ5xeA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 2y53vTvtNLB3+G9/XMndJ0pMqpwOVOQhPIiWcnSAb2pm+nBzbOXtFJM0F4Jo8hblrqvDc3YIWoD5bus+qItpuSzwq0DvfDfHoWEHShOE7XXUOaiB0N+8io7n5hYeYnM9bSFr9RRr8zA2VnDP2qmfnw9qoIQ0raQnIppr0OAbfw/yqYJcDXS8svEYqSG1c7pHM3o7gR+BeREYMzc6VNt2BH1xXE5VpivKcCZcauKaam/PWXmJV3sIb7sL0MQ9j9ocQ/j94Z0Z8jbQxD+lYcdaiUqJ9ywN0eoh5/soLhNgbUEWZ2qIFWqC+eGkwnw0DEAvBU43DsK4xOENAtss/R0pEQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 02026ce1-1af1-4fa9-95a3-08df0f8952f2
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 22:17:38.8466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ONTjUTLJ8HXPLzPW7Agy8yKrkTAavCoa0ddGACDWdPvV0jvfz4Fr4dIa8limD9F0ANW8X5IEb0dK6act4anSrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB435924
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

On Thu, Sep 10, 2026 at 02:28:22PM -0700, Vinay Belgaumkar wrote:
> Inspect all GT force wake bits in the idle check for runtime suspend.
> This includes the ones not typically used by Xe KMD as well. Skip suspend
> when any of these bits are set, since it could mean someone is trying to
> keep the GT awake.
> 
> Also add a call to pm_runtime_autosuspend() inside the idle check. This
> ensures a PM subsystem retry at a later time.
> 
> v2: Only check the GT domain FW register. Other domains require a GT force
> wake applied before we can read their registers. Retry if idleness check
> fails (Sashiko)
> 
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Assisted-by: Claude:Claude-Sonnet-5
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_force_wake.c | 25 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_force_wake.h |  1 +
>  drivers/gpu/drm/xe/xe_pci.c        |  6 +++++-
>  drivers/gpu/drm/xe/xe_pm.c         | 19 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pm.h         |  1 +
>  5 files changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 197e2197bd0a..0acb796c756c 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -148,6 +148,31 @@ static int domain_sleep_wait(struct xe_gt *gt,
>  	return __domain_wait(gt, domain, false);
>  }
>  
> +/**
> + * xe_force_wake_any_bit_set - Return true if any force wake bit is set
> + * @fw: struct xe_force_wake
> + * @id: Force wake domain id
> + *
> + * Check if any multithread force wake bit is set for a given domain ID.
> + *
> + * Return: true if any bit in the force wake reg is set
> + */
> +bool xe_force_wake_any_bit_set(struct xe_force_wake *fw, enum xe_force_wake_domain_id id)
> +{
> +	struct xe_gt *gt = fw->gt;
> +	struct xe_force_wake_domain *domain = &fw->domains[id];
> +	u32 val;
> +
> +	val = xe_mmio_read32(&gt->mmio, domain->reg_ctl);
> +	if (val & 0xFFFF) {
> +		xe_gt_dbg(gt, "FW bit set in domain: %d, reg: 0x%x, val: 0x%x",
> +			  domain->id, domain->reg_ctl.addr, val);
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
>  /**
>   * xe_force_wake_get() : Increase the domain refcount
>   * @fw: struct xe_force_wake
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index e2721f205d6c..53941e5a0fbe 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -18,6 +18,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
>  unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>  					    enum xe_force_wake_domains domains);
>  void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref);
> +bool xe_force_wake_any_bit_set(struct xe_force_wake *fw, enum xe_force_wake_domain_id id);
>  
>  const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id id);
>  
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index ab4da1d9a9f1..a79d928ad75a 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1438,10 +1438,14 @@ static int xe_pci_runtime_idle(struct device *dev)
>  {
>  	struct pci_dev *pdev = to_pci_dev(dev);
>  	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	int ret;
>  
>  	xe_pm_d3cold_allowed_toggle(xe);
>  
> -	return 0;
> +	ret = xe_pm_check_runtime_idle(xe);
> +	pm_runtime_autosuspend(dev);

do we really need this autosuspend here?
I believe this is what may have confused Sashiko.
And if needed it probably worth a separate patch with explanation.

> +
> +	return ret;
>  }
>  
>  static const struct dev_pm_ops xe_pm_ops = {
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index f517bf453b54..e8d4cdbaef88 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -17,6 +17,8 @@
>  #include "xe_bo.h"
>  #include "xe_bo_evict.h"
>  #include "xe_device.h"
> +#include "xe_force_wake.h"
> +#include "xe_force_wake_types.h"
>  #include "xe_ggtt.h"
>  #include "xe_gt.h"
>  #include "xe_gt_idle.h"
> @@ -1030,6 +1032,23 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
>  	mutex_unlock(&xe->d3cold.lock);
>  }
>  
> +/**
> + * xe_pm_check_runtime_idle() - Perform checks before signaling runtime idle.
> + *
> + * Return: 0 on success, non-zero on finding device not idle
> + */
> +int xe_pm_check_runtime_idle(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	u8 id;
> +
> +	for_each_gt(gt, xe, id)
> +		if (xe_force_wake_any_bit_set(gt_to_fw(gt), XE_FW_DOMAIN_ID_GT))
> +			return -EBUSY;
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_pm_module_init() - Perform xe_pm specific module initialization.
>   *
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index 6d5ab09cb769..d1f6a694b7c4 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -38,6 +38,7 @@ struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
>  int xe_pm_block_on_suspend(struct xe_device *xe);
>  void xe_pm_might_block_on_suspend(void);
>  int xe_pm_module_init(void);
> +int xe_pm_check_runtime_idle(struct xe_device *xe);
>  
>  static inline void __xe_pm_runtime_noop(struct xe_device *xe) {}
>  
> -- 
> 2.38.1
> 
