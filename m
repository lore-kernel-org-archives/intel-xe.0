Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10D7C48260
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 22:27:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD3310E249;
	Tue, 13 Feb 2024 22:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DLt/Uj1z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97B310E249
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 22:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707863277; x=1739399277;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=URMe4J9F3skihedYr622V26Uub7LM22Omg0JYhYeMcw=;
 b=DLt/Uj1z9dg8Yb8tCt3PTcwkMa0fWxRLdhLgdrej9Eo7djeHktVYro9J
 V09PUFvjrPQbQgnXcj1bWHtE/dV6ppaDu1RXFpxUHODzTM0T+286Qr91S
 5SiUYeVPXQQLO/97prKj2D5yx2M0Y1BpQ6VHQPa+Ol5HQZfPD24awmTUG
 /dVhJdyEBbdhE7nky4+DHzC7cY8DXfXZr/6FGFHE6AKHqoLft+QlXusPN
 8wSW5xkAeCdMgr0LF31N0S66KOWsHvQnM5+9tuF3AgcSLD/7tmvVclRvt
 Y0HickrEZZCAf1q/FinY2UIdHxRta0EfWFtl6r1+JeCdGl8hXgZ6u1PcF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="2252281"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="2252281"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 14:27:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="3367281"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2024 14:27:57 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 14:27:56 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 14:27:56 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 13 Feb 2024 14:27:56 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 13 Feb 2024 14:27:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C2mW+O/FJmh/+YEHTU96Fe2PwHIUReyGj8EoJy3t+bpKi72KJpwY6Mcrd5Gp3i47pWV9Os6UfDXoRPDIDYCQSRynPez5GjrLPrQcXYjeQRO0TUKK9G/fSCPjOsKyXtUHF8gFf0Dy+UfzY1XxdjskoASvOiCVU/GbUXgMEguJOZS3jSPK8L2wEd1+ZXuifZ1wQC+tI/4wSkfOCRkN47Kz4xNJM7cylzkH/eSv55r1pRwtEfrRX9GqzdPkSCQ46lt/BsotPHNeCOPd6vwDAFJ6yZHbZJaI1jVSiqr/ijLI5vUc4BvXkP7ageci2b45LXQ9OjkLwg61TE3RUsFK80sEkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HmothMBF8Iua/pGa6V4gV6ujTZODaVNTVpdZ9CIVowI=;
 b=CdAGmXB1bFBlp0f4VQpfCxNeffJrcZ7MrE38lxvCDfnxoyonOhd+r9q7LKRnKsOdWCNt+Gskk2aUgINjYvg6tRnJnPpQkWdvbLJY35X63fsH9JXSutnBlt+drdZvEgmgmZJsZiRJKs+pd2/s7B/uqCUtlN38oktkLYhYBeWvIoDur7FN2vcBHUUsUn9GLfAWupgU1APW1Qaq248O0gQTRVzrGcrzWQNz4PH0W61QQd+kM8lKsZDZz2kYajyMSBHzAEkZrQun7+H/xkqwqaZiMm8uFyK6jleNJt107nKnD7ujjsjg7zDmnE+Q3j6pwQ/0Xj0b8E1FeVX9y9o7sGTkcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ1PR11MB6154.namprd11.prod.outlook.com (2603:10b6:a03:45f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Tue, 13 Feb
 2024 22:27:53 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7270.036; Tue, 13 Feb 2024
 22:27:53 +0000
Date: Tue, 13 Feb 2024 17:27:49 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>
Subject: Re: [PATCH 2/3] drm/xe/pf: Request 64K aligned allocations for LMTT PD
Message-ID: <Zcvs5ZPVcKv9Z4bW@intel.com>
References: <20240213212418.1309-1-michal.wajdeczko@intel.com>
 <20240213212418.1309-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240213212418.1309-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0207.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ1PR11MB6154:EE_
X-MS-Office365-Filtering-Correlation-Id: 69b39fa2-7928-43df-24c9-08dc2ce304d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aW5RunSEm38iI+r69kS0Sz0+q+0hb1/VqXITnwiMibLWL6RwX4cBcdJAokUlwQvMsnH1l0SG6/MGFj9vCKr2ueuCFCrYlbxt9r12up7tM/dKrC41uOhHBvj8ZJaBDyy9VdzLI3eUGEEdQgUlXFTBCO5+dydLbDaoB/TWT8g3Ggak6m8T37LRfrcGJn+U4sYKY3wUFRTlJ+MCkoOoG47NshK/qnTq9bRAa2hpagXLknRlr3kp1GDxYhS33JVqgoWs8xI23SByFJwHykyS9I5HF8LPNvdT6+RFXxxjevFrgZ7hfruGo/cD6sofByNUaC0Di5EUk55brC+j4GqNLsNFTKduYMgLW7VdieCDKDq4kGXG5HHG+suvw+km2Merl4orD2mw1/sQFHbAW/95GAWj6ztHoF0YaoUaKGjX5aWI/aAwx9H1fRuBQdM3FY4cjKy0ySgOxowh/YHP9JD+rQucNSsYGaHOy9OfB9UrD7qEs/8sVK0ht9Gb1E7l6iW8vfQ4w9rHd4nv2lKpRCbHi24oX4KAEGwje7MbbKj+GDGaYFUwQor2uuQ3y3Tf6VvmH3qP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(346002)(136003)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(2906002)(5660300002)(44832011)(8936002)(4326008)(8676002)(6862004)(83380400001)(2616005)(86362001)(26005)(36756003)(38100700002)(82960400001)(66556008)(6506007)(316002)(66946007)(66476007)(6636002)(107886003)(37006003)(6666004)(6512007)(478600001)(6486002)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3FLMXNVMGJIZHR2Y01kNHE2Qm85QURVQnNCMGNYTlJKS2FqQldseE9qUUJk?=
 =?utf-8?B?dGtzMEdLVHRGZ2x2OWtIaDRTTEE0L3c2TVlPbzRvZXp6OUpPZlNjSSt1Z2Vj?=
 =?utf-8?B?cHpvUGo5Uk5EcEVYZGc3Z2U2M0dhR3djR0lEWHFINXZhdnczU1pXcExuSTQ2?=
 =?utf-8?B?SmZlVGRzNVB0M0daRWU4ZmJmS2czbk56b0M4UC94ZjdrR0FBVHFRYStLck5C?=
 =?utf-8?B?dVgraDNxSks5aGtmZU90dGdTd21ySjNOQW1uVzdZS25SZjIzck9SUVNNY1p3?=
 =?utf-8?B?SEo2S0piVkt3WlBXekxpTUt1TlpUcUtjZ240S1gyVGo4NGx2eVBQQXFxa3Mz?=
 =?utf-8?B?L0dodmtZeVVrYzA5Y0Fqd1ZCcUh5Z1hwYk1XVk1iZ08vL1NtaExRcEVvSm8v?=
 =?utf-8?B?azdVQ1RvUGFyOHdtNGxpVHBhS0grT3NMVlc1LzNCdnQ0dFhUWGJPazFSYk10?=
 =?utf-8?B?NzNMRXZjd3I3QjR0UHl4Si8wR0tyWXBGcGowMTFlZEJIeUN1WEQ1RlFQSDhw?=
 =?utf-8?B?WWMxaGg3ckhTRytBUm9CcVJZRUc3TkozY2ttTE9acWxHRTc4YUkxQUIra3VB?=
 =?utf-8?B?cjZMSE50OFhXZVhkOG9IUlVyOTRzb0FVRUMrZzBLSE1ka3Rqc0M3SU9tZzVR?=
 =?utf-8?B?SDNSY0FsenlOT3VHZm9XN3h1ZjAxZkZ5L2FGSmRTc0ZXVEpYUmxGVjBZWmVu?=
 =?utf-8?B?OVB2TFpXNlRaVktYUXU0YjVCN0hCWHNHVS9sWHpxQkpzSzMvajY2YU9WWDJj?=
 =?utf-8?B?WnhWZlpDYU5ZRmZ6VG0zN3Nia3Zqc2NyVms3MHlGMXV1ZTRYV3JSZnAza3I5?=
 =?utf-8?B?bkJOOC8zK1pNdmJ3RGJRZHJrODZDT1NHNTl1U2RtaG1BekcxRk50dW85Wmcw?=
 =?utf-8?B?MFhpa25Idm5ZRzd6QjZiNThkdXZUR1BXazZPdTROQXUyL2hRdWtZby80WjRr?=
 =?utf-8?B?KzcwWlRXUVN6WDZZZlg3NGJnUTJ5WUdMTjFac1lYNFVPNWhaNTR4QlNIWXUr?=
 =?utf-8?B?ekJaQllYenpDZzY4dUZrQXlPa0s0RDBOL2x2eTRPbFh1aDdrOXZhN0E4eUkv?=
 =?utf-8?B?bC8vQWtMWHowTmhQR3JoR1A4VUF5UXgxbFRPTzVoZVVrSXpQWXd6bkVVZUlB?=
 =?utf-8?B?RUhiZkxUVlVmRjNFb3p1OTFuUVV2VlRXZmxZVmpmSDhobERWeVJvNEdOaVhN?=
 =?utf-8?B?WGpMY1lUamUrNFYwRTRJS0lyQUw3cXg4TkJrbENWaUpNa3o1VWw1eE9YQ2E3?=
 =?utf-8?B?ZlpTRG9HVElYMW14amJIOTVqa3YxeGxDd0tmQ3FaZ21hOVptS2tRcFE0SHp0?=
 =?utf-8?B?M293ajMwSEpTNmJoN3VLdlVkalk4T0VDeXIrVmErcklFd3BOdGFITHMvQ1NH?=
 =?utf-8?B?akJhSXRNV2lNM3B5NGh4ZmI5SkFITXhsWC9ES0JiRmpMWEJYYVg4eGtDZUhp?=
 =?utf-8?B?V29RbUlwdXh6Y3EzYW9zaENrS0VvakFHN3FLMWNHZkZ5RW1aYTU0dXNteDJq?=
 =?utf-8?B?Qm9GUlVzYzhDU3lFbFRPMjd1QWFTZVErWTlsS0E1K0Z6SUdQdHJ5aTBGUlRw?=
 =?utf-8?B?N2NzS0JWZ0RIMEQzV2E1ejcwUTIzRXBNNHh5Y29hSk0yVElCWUZRaElUc0VT?=
 =?utf-8?B?WTZWZ1JLWWFhT29DQ0FaU2t0aHpQWDhHb3I2SmVUR2Qza0lSMXczWkk5cXYz?=
 =?utf-8?B?ek1HR01ETGQ3ZWkwYUUzM0JjdmsxN0svb0I4ejNmUUtUU0crMFMzVlpSNFE0?=
 =?utf-8?B?VkFXSVpNUFNBNEdpdkpJK09IQnY2azhhbEExNHVkNkVNVVJTSEEvNSt6TDcy?=
 =?utf-8?B?T09VcEZkSGo2U3g5TW15QjN0NW9PbkxuWUdQb0t1RTc1U1lZL2FoZmRKeWNG?=
 =?utf-8?B?QTRhcGJVY1lKQmsxV0hSdWduTGtJcjByL09LN1ZPRktHUHhrTndERlRpZ0l3?=
 =?utf-8?B?NGc1OEZzWkdwZVM1RkU2WjVHaHJTVGtRVmxqUHB4ZDdGakxpWWc4a3Rqd3I5?=
 =?utf-8?B?K2FDNWtVZ3BnOUFLd2lmWUQrR1VFTFgvdGxvalJ6cjVPU2ZZSHMyUm4zZFNS?=
 =?utf-8?B?RUYzL2Fwc1RnVEVoMTFDa2t3bUFJVWJ4ZUNXVCs1ZkU1SDcraXFhK0tTb1NC?=
 =?utf-8?B?Y0tzQ3EzZktRVXZIRXpNNkVsTXdGV0hBRUVMUnZhUFFaNUhsd2dwVEdVT3BS?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69b39fa2-7928-43df-24c9-08dc2ce304d6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 22:27:53.2087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: agIxqtf4TQ2Q3tgQdq7g16kISjS8kFOH/y7TgUD4zqB/AvqLnJVuulxfi0+Y7xu/2O2iqQgbDZJtf7Bb+0jLfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6154
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

On Tue, Feb 13, 2024 at 10:24:17PM +0100, Michal Wajdeczko wrote:
> Use explicit alignment flag to match hardware requirement.

Probably good to add here in the commit message:

"LMTT Directory must be aligned on a 64KB boundary in Local Memory,
as well as the directory entries for SRIOV."

or something like that.

But the patch itself looks correct to me.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
> Bspec: 52404, 67468
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_lmtt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
> index 0d7c5514e092..dfb0e1887615 100644
> --- a/drivers/gpu/drm/xe/xe_lmtt.c
> +++ b/drivers/gpu/drm/xe/xe_lmtt.c
> @@ -71,7 +71,7 @@ static struct xe_lmtt_pt *lmtt_pt_alloc(struct xe_lmtt *lmtt, unsigned int level
>  					     lmtt->ops->lmtt_pte_num(level)),
>  				  ttm_bo_type_kernel,
>  				  XE_BO_CREATE_VRAM_IF_DGFX(lmtt_to_tile(lmtt)) |
> -				  XE_BO_CREATE_PINNED_BIT);
> +				  XE_BO_NEEDS_64K | XE_BO_CREATE_PINNED_BIT);
>  	if (IS_ERR(bo)) {
>  		err = PTR_ERR(bo);
>  		goto out_free_pt;
> -- 
> 2.43.0
> 
