Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CEF8C072A2
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 22:11:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE98010E27D;
	Wed, 15 Nov 2023 22:11:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C58010E27D
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 22:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700086272; x=1731622272;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zZKW+oOl1jYSf2I5Y5hdLkVj0+5aNFvglV6xJkuz8RI=;
 b=Rhj3k+4W/Aj8ZdT3PksEAzZ+BefL/JhJCupVk8+LNI/7NyQUd/lWSZ8G
 EPM2l3QZxFButEIN6+1bdyUqzrFRJoighzDa2LuhYvcCzEAtRbXV0tb7z
 J08jBUGaDVVtSZHOSxSkKtOF+PMTunxIWB7E3+k+kDCSE8Tcws9cQv3+f
 AQhnW+cXTf/lL9rM4sSGSLb1je+rtWMbxQp9GmX6PYYWqAQ1i8c/x97ts
 3TZwoMz7YOsJRgYq4vOZMzMFiKYeyHBeQy4zq1zv4I40cMwDoBuZipFRc
 pno4Orq62Oexj8/TenylNY7D/9GHVj2vFE67ZqRcUItpsckFxwVLfabz6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="4086645"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="4086645"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 14:10:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="855783071"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; d="scan'208";a="855783071"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2023 14:10:52 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 14:10:51 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 14:10:50 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 14:10:50 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 14:10:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRcAe0n93+y1wcW8CNJ2JkG31ep874bnWjSpbXwjm/QirY8qt79SPLl6ODeX4eOVI44WTMOuf8KN5Il/nrqfq53Y6IREozz2/PrgmKLIZw1LW7fruaf8qiqMTJEGjAktE9Ue2QtSsz/2gfHG2F5WPaQiAzzzwNxDbFF2/7n7DWIIB5Gj8IW6Vq0nax1Rb6dKkAYZgdLyjKI5p1ukSKjH5tf0vsstIKYZzvduorzXBpzvnDQvXAe6gqO0QS6xMwIgPi+bkI8p4q7MJq+QZt6MG3pRDf596W6JJetuv34SK0jWofJm4pn8ito2st84IUxmHgYFZK49ibFImIb3/zqclw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NTCFPfJUJ9HrXCAa3yjDOw0djuo3GhhCgJ4yzPkfrc=;
 b=I1x1XTff0BVZFoWKXoSZvbA0+V6XJUD0TUnixC80WOulBcWIfq4Lm/z6ZcC8pss3m/fCCSewNwnJ6O3bEZmfXWIv7MCug4MFl5LSHfd1sndToPwMsx7g/zG1fiXztoS8oOd05DErjQto0SO+K5LLSijAqs3Hm80DrJQIZG4+9MWidonii07KUy6t2aBOZZwEBZPsRXrrRBQlPysNsmmXEBiaH9Km7U5p3zHZpwQjGnuEvH3bfJA5t6NrRXHnLKGUo5ZTPJdkEOkxcKIs2r0M+TSntfhIotSoUE+PNLirgQp78XKzM2cgKFQIDtaFFY6d+Y7GCfTWIn6g26A/Wtf0KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5807.namprd11.prod.outlook.com (2603:10b6:510:140::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 15 Nov
 2023 22:10:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9%3]) with mapi id 15.20.6977.033; Wed, 15 Nov 2023
 22:10:48 +0000
Date: Wed, 15 Nov 2023 15:09:31 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <ZVTfK2Z3xUND4DZA@DUT025-TGLU.fm.intel.com>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
 <20231114130231.2299661-21-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114130231.2299661-21-michal.winiarski@intel.com>
X-ClientProxiedBy: BY5PR20CA0006.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5807:EE_
X-MS-Office365-Filtering-Correlation-Id: a8e8f1ef-965a-41ce-1dc9-08dbe627b8ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UbYw0pBXlauqaItgrwPoOrqbsgGSdMW+N2Dhr8yA2AmC+Sdll7jS2UsJaivmK3dtdaXz4nqBXyT+VY7DZC0VPT9zcl89Mi9tcINVpNp31p++TqXiLWuW5ypDcrLRWWgi+BEQ2In1Hd7TN5GbRt6EDK1FDe0XdZ0rhUdB7riVEdkK3xPAPTQCLoj0HVP46dsMbCyGYN28QpNyxW4PMnN/JyjzcwgDsTuCkM9mO+Rf9YeY6jlQHTCpvKB3sT7FkkEh9HJtAHFEZYbh6d6H1VyUz7E+bpneUKh1xDAAaWrhrD6WY3FZOmWX1CRqT1eCbtsXzqYtYhl6UEoqu8x8nI1/rRDLJCq66f47T7plJnMy6dTiMnyMY0DUpHf6j7QcLBEkSjROBf1Vl/aRhpXn14BE8IT5nWuRhiPw/hwDLTdI5oiug62wUF2rjqvYk98LNBo04mUT8Y+6hePvfX/jRa9eoN2tZt/B8wpQRv0hDc87Esi02RgS6m3hV4CpRKy02clfmhQ1P0uxKHvStbRsHhc7spX/e47jXW1vE1ZQg2/eD9uzc4b1AeSGCK1za7O5TkB46ZJUJ17DKH6xhSDfAM3iD9CQ7RaOTC3EsR6NGEA4KMs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(376002)(39860400002)(346002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(66476007)(41300700001)(8676002)(4326008)(316002)(8936002)(6862004)(38100700002)(5660300002)(6486002)(2906002)(6512007)(6636002)(86362001)(44832011)(66556008)(83380400001)(26005)(66946007)(82960400001)(54906003)(6666004)(478600001)(6506007)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0xneThwUmRaRG9xNURONjZaS1dOS2hXSm1FOC9KN3ViQXZJVUhaK1I1Q3dl?=
 =?utf-8?B?TFkxWmJVVDRTemJBd2lJQUJ4MzBFTWc3SmVEMEM0UXd5SWRxdEdIdXlQaW45?=
 =?utf-8?B?Z0F6SlFiMEFyUGdSUkRiTlN2WFpHV3Z2ZHRXbkNab3BNNHFzckZWSHkycWtN?=
 =?utf-8?B?dW8xb20wMkM1WEx4c0lSWlhQaTVZRE1ycnlhYmRIV1VRd1A0RkpoM3A3UExD?=
 =?utf-8?B?d09JaEFQb0ZlWVFBU0RsWEhWQ0x2NHlMWkF2bzQxNVVoc2VTNk1iM2Y4dHRq?=
 =?utf-8?B?dDFYUDBxRDYvUFJ6RWZJdGhjVnNiNkZHMlJLKyt0V1QzNlBjWFRTVVR3S1dB?=
 =?utf-8?B?Q0M1eEFiSXY1cjNXdkM1Qkl4VjJ1TG45bkZ2NnVlU0JJZ0tsbHpkYzR3OHQr?=
 =?utf-8?B?ejdQYWdsVC9qYU5id3lsQ0R1L21HOE1yNWRjckRtQkdEdk83M0hMOVAvajdN?=
 =?utf-8?B?VmVIVzlyNTVWbTc5Zk9YVW05YUthSG1EMHRZTlg3eEhGV2lsVU5zckw2VERK?=
 =?utf-8?B?OFg2bVViRXYzMkRCQS95Rkg5K0NCODRmYW9ZWW9MNFR3cFdSbTFhQjcxMGk2?=
 =?utf-8?B?YkZZZWdHVVMyNUxKZHNSVlJIOTJxZG1zVVErQzMyVmJZY3gzVUNyTUlTcVJw?=
 =?utf-8?B?QzBTcFZCMDZLVk5ZdzhKVzI4Z1JtK0R4V1dRemVvdXNQWU1qKy9zWDY2NmY0?=
 =?utf-8?B?bjlZak1VOTFOVVd2UElBZUVKSUMxNUFXeXYrR3k4V1I2NnFTM0hqV3N1VjBz?=
 =?utf-8?B?b3BzNDgwMmd5WCtDeVNZUGVCaW9tUklDTE9jc21RUFhFRXUydVczMHl2cDlr?=
 =?utf-8?B?Vi9CdUdjMnNsbmtlS3hxSUovSE9ZMi9keG4wd0F6Vlk2R2hsVFJ5NjVwK3p3?=
 =?utf-8?B?R1RYdWhnenY1NVdYbUZLY2JMblc2Y1NIR2dFK3BjUUhucW53cTZYYjdZamgz?=
 =?utf-8?B?ZkhrN0VYQkRCVHFITnIvblZrUUpyQ3FyWTFlNDA0dnhlenM4NlcrOGt1VTFw?=
 =?utf-8?B?YitKMnRLY1ZSODRWeWZHWmNFR3h2ZzBHTitsdDg0ZFkwaTZCRTBzMVZKVHFm?=
 =?utf-8?B?MEwvcmNpQmhOUVpNZmFGTldBMUJCQnZXNWx1RVRtMUI0aWFaaEJMaitoTU1i?=
 =?utf-8?B?R0xSWjlaTTNPNDlIREY5WEJ4Q3E5TnBYemtlWHRDV1o0WEsrd1FWYlMyYlZa?=
 =?utf-8?B?RTRYcThwYkF2U0Jpc2ZiRmhnSFhkK3VFWmVWTi9CYlpIUnpNNnFnRFIzTE5V?=
 =?utf-8?B?bjhCVlZRMzJuOXhHTG5rUUhFZXhXenh1c1RpU1RWN0p6MGgybnRueS9Cc3c3?=
 =?utf-8?B?bDdCb2NrcTJJajhyK1Rwd043aDd1SG5KUTVGNUhRQUJpaWdDbEhiVGtIdkdZ?=
 =?utf-8?B?eU4xd0JYbG9IelRObWNrekRhc2x0cEVVemZKRzdjaUxWUkN2Q3hUdEVUMFJE?=
 =?utf-8?B?bDMwYldPTzJraUs3TWMrV1JTTTBYWDhmc2dqOXgrQ0lYa21CWW5kTUV3MUJU?=
 =?utf-8?B?cGoxbnJmaDNWQnNrVkREVnIraVkxeTE2cHZqMDJ0OHJ1NWcrU01IVzM2WmF0?=
 =?utf-8?B?SHVPejNiaHNzQ3RZbkl2emU3VzFzVm9oUW5COTlaUGhXZEpxcjNZblNma1Ex?=
 =?utf-8?B?N2dLdDRNNjcwL3FRZFNpL0k4NFAvOE5jajlITysrQVo3Y2NCL3NQeGJVcVNU?=
 =?utf-8?B?WFNLWS9iZ3V1TzFRY1ZmU1RabC9qWjZhemx4QkJBYXRoQU1GMUlyMmFGYWxt?=
 =?utf-8?B?K1lweCtjK1JaNW1YZVJyQ05LbmhYNXVVZm1XUm1xcXF6OU9kMWdrdDUwSjJt?=
 =?utf-8?B?NHF4YzFmdEtxTHA4V1pjdkhqcDdhSlkzdkV6eVZDMGp3TGFLYjNWUFR5ZFhJ?=
 =?utf-8?B?RFV0SHJJbEpWTStKby9xMURUcDRXb245MWxaNDhnUUFrQU0ySS8ySU84d0x0?=
 =?utf-8?B?VGlITG1sT1FiWW5kK3UxVHErRW1EaHlkZ0xScnVRdWlVQWJBRElNbXoxSmla?=
 =?utf-8?B?N3VZNFRrazJaSlBaV2JpS2Y2YXNpNWc4bW1GdmZpRmtHeTFMZ3RKYVd4bjN1?=
 =?utf-8?B?N1FrQXJOSnJVcGY5dWZGdGJXeVZVUTBlU2pWU3VKbWtOUjhTVXRZM2piR3JP?=
 =?utf-8?B?NG5GWFp2aERTdHJOc0NzTG1qdHZvUlpzVndSeHBhMlZRV1RlVEgvUEU4T0Jm?=
 =?utf-8?B?MFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8e8f1ef-965a-41ce-1dc9-08dbe627b8ca
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 22:10:48.2923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9WroaDd5QEnYXxifQbpu7eUEXHZkSkfaL4ys33S3xSCrU24BFP/sEGjtYYoR+kRjTbkxh/hx962a3CAXWhNe4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5807
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 20/20] drm/xe: Initialize GuC earlier
 during probe
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 14, 2023 at 02:02:31PM +0100, Michał Winiarski wrote:
> SR-IOV VF has limited access to MMIO registers. Fortunately, it is able
> to access a curated subset that is needed to initialize the driver by
> communicating with SR-IOV PF using GuC CT.
> Initialize GuC earlier in order to keep the unified probe ordering
> between VF and PF modes.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_gt.c     | 16 ++++------------
>  drivers/gpu/drm/xe/xe_guc.c    | 15 ++++++++++-----
>  drivers/gpu/drm/xe/xe_uc.c     | 35 ++++++++++++++++++++++++++--------
>  4 files changed, 52 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 531aca74e8eb4..ecbf1effecc41 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -32,6 +32,7 @@
>  #include "xe_pat.h"
>  #include "xe_pcode.h"
>  #include "xe_pm.h"
> +#include "xe_uc.h"
>  #include "xe_query.h"
>  #include "xe_tile.h"
>  #include "xe_ttm_stolen_mgr.h"
> @@ -414,6 +415,16 @@ int xe_device_probe(struct xe_device *xe)
>  			return err;
>  	}
>  
> +	for_each_gt(gt, xe, id) {
> +		err = xe_uc_init(&gt->uc);
> +		if (err)
> +			return err;
> +
> +		err = xe_uc_init_hwconfig(&gt->uc);
> +		if (err)
> +			return err;
> +	}
> +

I think this should be a GT level function rather touching the UC layer
here. Also maybe combine xe_force_wake_init_gt & xe_ggtt_init_early into
this new function too if it makes sense.

Also a comment of why this located wouldn't hurt either.

Other than these nits the patch itslef makes sense to me.

Matt

>  	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 73665e4e66f22..bee661e1f164a 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -344,14 +344,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>  			goto err_force_wake;
>  	}
>  
> -	err = xe_uc_init(&gt->uc);
> -	if (err)
> -		goto err_force_wake;
> -
> -	err = xe_uc_init_hwconfig(&gt->uc);
> -	if (err)
> -		goto err_force_wake;
> -
>  	xe_gt_idle_sysfs_init(&gt->gtidle);
>  
>  	/* XXX: Fake that we pull the engine mask from hwconfig blob */
> @@ -415,10 +407,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
>  	if (err)
>  		goto err_force_wake;
>  
> -	err = xe_uc_init_post_hwconfig(&gt->uc);
> -	if (err)
> -		goto err_force_wake;
> -
>  	if (!xe_gt_is_media_type(gt)) {
>  		/*
>  		 * USM has its only SA pool to non-block behind user operations
> @@ -442,6 +430,10 @@ static int all_fw_domain_init(struct xe_gt *gt)
>  		}
>  	}
>  
> +	err = xe_uc_init_post_hwconfig(&gt->uc);
> +	if (err)
> +		goto err_force_wake;
> +
>  	err = xe_uc_init_hw(&gt->uc);
>  	if (err)
>  		goto err_force_wake;
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index e04b04be32b7d..895bcc24ae2c8 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -572,26 +572,31 @@ static int __xe_guc_upload(struct xe_guc *guc)
>   */
>  int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
>  {
> +	struct xe_gt *gt = guc_to_gt(guc);
>  	int ret;
>  
>  	xe_guc_ads_populate_minimal(&guc->ads);
>  
> +	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (ret)
> +		return ret;
> +
>  	/* Raise GT freq to speed up HuC/GuC load */
>  	xe_guc_pc_init_early(&guc->pc);
>  
>  	ret = __xe_guc_upload(guc);
>  	if (ret)
> -		return ret;
> +		goto out;
>  
>  	ret = xe_guc_hwconfig_init(guc);
>  	if (ret)
> -		return ret;
> +		goto out;
>  
>  	ret = xe_guc_enable_communication(guc);
> -	if (ret)
> -		return ret;
> +out:
> +	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  int xe_guc_upload(struct xe_guc *guc)
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 13e76e6805ca1..069207a7f2f21 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -29,8 +29,16 @@ uc_to_xe(struct xe_uc *uc)
>  /* Should be called once at driver load only */
>  int xe_uc_init(struct xe_uc *uc)
>  {
> +	struct xe_device *xe = uc_to_xe(uc);
> +	struct xe_gt *gt = uc_to_gt(uc);
>  	int ret;
>  
> +	xe_device_mem_access_get(xe);
> +
> +	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (ret)
> +		goto err;
> +
>  	/*
>  	 * We call the GuC/HuC init functions even if GuC submission is off to
>  	 * correctly move our tracking of the FW state to "disabled".
> @@ -38,26 +46,36 @@ int xe_uc_init(struct xe_uc *uc)
>  
>  	ret = xe_guc_init(&uc->guc);
>  	if (ret)
> -		goto err;
> +		goto err_fw;
>  
>  	ret = xe_huc_init(&uc->huc);
>  	if (ret)
> -		goto err;
> +		goto err_fw;
>  
>  	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> -		return 0;
> +		goto out;
> +
>  
>  	ret = xe_wopcm_init(&uc->wopcm);
>  	if (ret)
> -		goto err;
> +		goto err_fw;
>  
>  	ret = xe_guc_submit_init(&uc->guc);
>  	if (ret)
> -		goto err;
> +		goto err_fw;
> +
> +out:
> +	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +
> +	xe_device_mem_access_put(xe);
>  
>  	return 0;
>  
> +err_fw:
> +	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>  err:
> +	xe_device_mem_access_put(xe);
> +
>  	return ret;
>  }
>  
> @@ -117,17 +135,18 @@ int xe_uc_sanitize_reset(struct xe_uc *uc)
>   */
>  int xe_uc_init_hwconfig(struct xe_uc *uc)
>  {
> +	struct xe_device *xe = uc_to_xe(uc);
>  	int ret;
>  
>  	/* GuC submission not enabled, nothing to do */
>  	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>  		return 0;
>  
> +	xe_device_mem_access_get(xe);
>  	ret = xe_guc_min_load_for_hwconfig(&uc->guc);
> -	if (ret)
> -		return ret;
> +	xe_device_mem_access_put(xe);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  /*
> -- 
> 2.42.1
> 
