Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4F0CA550A
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 08:39:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AED610E486;
	Wed, 13 Sep 2023 08:39:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E3F10E486
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 08:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694594376; x=1726130376;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Bo7yVzTPnZjl2odtEQjvawRJOgAMJczWjZ29xCNAZww=;
 b=NdKJSkTIJr6fvYDXIRFPzaux/J+Z50/9wge19rXNPcrJR1ZjsCiPisOD
 rLrzi7sizZYNLpQstfKsdkCKCJhrEEPTcfVKPq1Q9srJRZaavx7YjlwNS
 RVcqggCubax8+JOAxmOWzVvfGPy99NtvFldslyezpJ72mku6KYqbvPKTO
 /BpY4ooQNcUJvt0H7H+0NUsvLRay2QUGaurDQOkRbXjDTZ/5bEp8OYbs6
 ROcUb43KpdCm2FkqnAxuiWf+bIQNWjoYlR/PmcMmvpgsVf4YkMgDRmsK4
 lzb/ocHO8TqyErtgRmCICVDzVDrdGg+/3cMVgKerG6ufi+BXnPvBio0BR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="442632590"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="442632590"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 01:39:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="747219428"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="747219428"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2023 01:39:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 01:39:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 01:39:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 13 Sep 2023 01:39:34 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 13 Sep 2023 01:39:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R3thU8by+hmIiHPjvzeV+JDkszQtEMdUh4BsDNQJ0PDq5cw1FUuEMS0prTnqSxnw6BVZ07rCj4FWcGNCpSPI+P2qgmP3MDpEUPYqV3Su1yXltUUC8rzRjYIfesMnGSK/yu4AnTlaobuX1LKqtObCLUyoqGc/0VhFnGSGendnjLBegTm1QsCn07GYQMqwVaaJibsjt2e7NAOToGxQtABZ/WGITb8oZW4muG3Kn3NPG4VfHSTNJFzqgEyDP4OLaiLD52KOm/+hyckVOW3+UDwQkE8h46M4bArIbOvfC6s95Q+RAN6W78sKnoVI4rwTSkgvORBqSMIU5wCrrcIfmA5YjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78I1lhwLGkRfYxA7Ka+tNf9FnlconzChFyRVhQIJERE=;
 b=fmfjSF8GbcERYNQ+2YpttIgvd+VE+QpbRnNNLZjwkcXDv44bLotiYii9G1kgGDhfPDL/rc/kLdMn0+P+Xmmr4N6skRSJA8Qkhiv5rt99fu9RQUd6INpgD+ZBmSScwW7vxetUvjg0KiHwqrEMM/eERwNNP4ibAZ0Dxs81u8+Mc3cg0UaNbhX7lk2RAn3nk+yUMgJpatr28/J7iIdy9/ElcNUatNkeSD7kw4Ttt9qA5vAFuAmOnKHftacnqlRcqauWgBHq8KAqEIy9YbjqH/qCDjUKeAkg5mv9NiD0qmq1oDoSivp6GpGRMDrviFLsAKCR3YZMT2Uc+kXaERyRYJdmow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS7PR11MB6248.namprd11.prod.outlook.com (2603:10b6:8:97::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.35; Wed, 13 Sep
 2023 08:39:32 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25%6]) with mapi id 15.20.6768.029; Wed, 13 Sep 2023
 08:39:32 +0000
Message-ID: <dcc9a6bd-c6c6-43ca-97f3-4b0bd35aa0c7@intel.com>
Date: Wed, 13 Sep 2023 14:09:24 +0530
User-Agent: Mozilla Thunderbird
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230912115239.3554341-1-tejas.upadhyay@intel.com>
 <20230912115239.3554341-4-tejas.upadhyay@intel.com>
Content-Language: en-US
In-Reply-To: <20230912115239.3554341-4-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0093.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::21) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DS7PR11MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: 1beaaac3-0adb-4c94-e579-08dbb434f3d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mrddfLehgv6+TCBGdlw3sVlUptqcpsENxqsUhlGlDucFvFThq6VV23af6VbCk20HLUn/nFqkX37swRClJROVANz8FzTgqLkSVr3AnbbB79tk8PeTaTBBw2tP++HM89sEexH1ha78TyNwIwr/WzlwC8F97CHgKgDGrScnS24FSCcl1XPl6xOJoz9MM5bsRPx+4x5pJUbO8OGt08zBcyeTWYANqBVKgb7UviArPu4+TfyahMKCEpDzZjZtx4d9KA1ELvIMJREYy35d4d7DWoclit6M/iVilwQWQCPRwHjmPM/u0GVWEY1/V8R1lLwTh5XR5eP8/NgD/gcSU8t7kQ0t1O0F/cF6JlRK8CMWGuj4FnL2PFemNHMgb5MWaYpKb/602sasRr+tlXLXmkIPG5K18Gf6ypVj49j8WUpRWPjYDSU94RdRb8rU4CBMckkJZH/NXA9CXpEICd0xJkEE/x2sMnBSEEX0uedRoXBlVKKB5wWDkthjpGTG7FusbrN+MTFLqAo1fcjJrcs7f87Spf+lDOHCrCM93fRBE7P2pGfoju50n9VenSANJlN5M8mDGBZSI9mf+sZOjsOIddJgtbYC0W9MjOkmwv4uMe8RL7qGaV53snjHIQNxuT8O/Ms8/bmAKSXai8oHgd6XHdK/pTLggA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(366004)(376002)(136003)(346002)(1800799009)(186009)(451199024)(478600001)(53546011)(2616005)(107886003)(6512007)(31686004)(82960400001)(38100700002)(36756003)(316002)(41300700001)(66946007)(66476007)(66556008)(6506007)(6666004)(83380400001)(6486002)(26005)(8676002)(4326008)(8936002)(31696002)(86362001)(5660300002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnpVWEo1SDhsaDhjV20xK1E4U21HVzhPNzFHbjBXRVJ4ZnJuNEtZV0ZPSkNx?=
 =?utf-8?B?VnFOS3ZhQ2F5R2JYOVVWUVpjWWkwakh3MG9sdkdmUmN2a3h3VGU1c3loVWdG?=
 =?utf-8?B?S0pDRS9MUktXRm03dXdpUmJ2VkYyK2YzMmhhTGN4WlZ1T0hJV2Rta0hVV1Vw?=
 =?utf-8?B?L0VwR3NMZEtHYWpRVnZ3NXBTeHZKeG9rSXRHN09VRjBDVE5GMHhMT01CV2pU?=
 =?utf-8?B?aEd1UnluWjgvaXNJMlE0R0Q5RkxsUkZrTllsamtZZGZ1NStIeVRMckFBQUdn?=
 =?utf-8?B?anBmV0xVS0NZd1F1eVRUSDRjeS9RdU5uUnd4YzdSVE9oT1F3MHhkQmQ3MnQ5?=
 =?utf-8?B?Z0YrbHlrZTBxYVpQNE5oTS8rNWpZNFhPdVdVYXJodyttVE5VaEZBWnY2Zy8y?=
 =?utf-8?B?bFM0U3B5blp0V01tdnRtbjh6UzQ1d1h1N2dTc1krMG1rd1BRYmJJaTFON3I5?=
 =?utf-8?B?djNUZXJTemtxWnd0alE0cVp2ZjRXSS8yTDZzMEZxOFU3T0R4NGhPdjJGMkNh?=
 =?utf-8?B?ZmVxaFBGQWVsQVVOTm5FSkxDR3lHSGdHNFF6SUFYTytuYTVYb2M4OFBqNDFo?=
 =?utf-8?B?YUJ4Tm5QNEw0azFsS0dpSnV3bGZ1YVhQczhhNnZEcDA0YTJWYkRsMm1SQ29H?=
 =?utf-8?B?VkVibE5PckRtYmpvUzVTNGRUUHB4bjE3ZkZ2TmxuTjZOYU9XRTlZNzJYS1Bt?=
 =?utf-8?B?NkllVFI2ejBjWnltbVQvMVdocjIzTEozUmJBYXNjZmZwZFBWOTc3Qy9nVVE5?=
 =?utf-8?B?YU9YMzVQOWo0TERTR2FaQ2YyUUtpV29ERHhNSDMyZ3Nla05VaFRyK0FQTGxJ?=
 =?utf-8?B?LzNkN0pocE5GQ1BJRnNNdWlaRG4xSXVObWNtSW8xSWZ3MXYxYkFWRXJRMEZi?=
 =?utf-8?B?NEk2UGM4ZHZnT1hJa3daZmJDNkpyb1ZJY2oxMVZSL3phMkJmTDk4MGhrSmR4?=
 =?utf-8?B?d0pPUk9QWXY3UE1wNjYrRVBJN2hhdkFRM29CREZxNUMvSjBoY0tFRDFJcklQ?=
 =?utf-8?B?eXdBek0rVVFmM1NmazVGWXBYeVovR09CNVRJZVVPN2NrY05JQys2UHRWbm5x?=
 =?utf-8?B?ZFBDb1MvVjNhRXZpNnU2eUFIWmVtc09OVWZiR0FjUzJaUHF1V1lNTEdhbnFZ?=
 =?utf-8?B?R3JBWDdkdG51d3RxNnFFdjJzRWFoRUdrbFMzVkZWVlRubDUyU1BRb0pTcGdt?=
 =?utf-8?B?RGFqQlJ4VDRReGVXL2pqenBCMXJUb2haS0JmdWFTYmF5K1NZdkFXS096bElB?=
 =?utf-8?B?TlZQT0ZQWDFjeXdqT2plZG9jVUtYSXIzVXNQR0FLSzNQaEF0bTNPa1NxL2hm?=
 =?utf-8?B?WlF2NVdkc3hLZFRPeTB3K1JGWlZ6MklyWG5UelpQOHVnRHJIcThtNURpUVlU?=
 =?utf-8?B?YTVpdmJoTHMvb0VmMzYxbUs3d2oyMVJsQngwTUdpM2UyNFdCUm5iYUJPcnps?=
 =?utf-8?B?RlBwRDlpZTgxMTVKUUx4R21QYjhhVktEcWVoNStRajdiMGZ3T2htUGg2dEhU?=
 =?utf-8?B?VS9GbzV3dFVEZVVLdGlObWdIdDVlMWxpaHAwMENXb3UvcWJFS3IyTCtCZE1m?=
 =?utf-8?B?OFZkZHV2L3pHZ1djYlRtM21sRUxPSUs0dnlvdk1HZHQ5MDc2V3VoNGRWNGJU?=
 =?utf-8?B?Wm1xQmovKzkzUDBJUEZoYi82aGpsbm9JWjRtSEtYNHNjUHlIamlaS0FMTUFs?=
 =?utf-8?B?RGg0NXUvZTZVd1BoSVNqSkp2cktCQzRYaU1rSDRQa1h2UFdRSVZ6Sk5ZQTdE?=
 =?utf-8?B?dlpVYnVDL0JrSWczUW5UMU5TdDZLRFJkNXFSa0hOMExWR1MyeWxEMGxnSTZu?=
 =?utf-8?B?TWhnUyttZy8veS9HcTA4a3FUUWo0SjYzQmNDd29ldmpFQkVlNFI5QUZZYi9I?=
 =?utf-8?B?M25SR2hqdFpzUk44VG0vdnZKSTFrbUV0Z01MdlRZOGlSV1U2UVlpRHIrcEFa?=
 =?utf-8?B?WVhNN2dIS3czdGxMYUpmMXBqeU81WXdiZU0vME9UYUhiMnRoYjdNQ3F6YXdP?=
 =?utf-8?B?SkNWcUR3NVBINDErY253OWY0bm93SGhZQzBpaTA5SWhCSU15am14VGVQWFBj?=
 =?utf-8?B?ODJVdmpHOFVYMllQSUtsbjdLMU9TL2s1TlJYNmtDMnhlQ3l5MmNVeXlOalAr?=
 =?utf-8?B?a0NaTjZBdEx4cFRDK1FQc2s3bXJabXE5WFBRYzdXWERzV0h1b0REK01WSUdO?=
 =?utf-8?Q?deZf5BNXcQWSKKNDlM1p5lI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1beaaac3-0adb-4c94-e579-08dbb434f3d6
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 08:39:32.8153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wCKKkokT85cxUzZ/bo/kr2F3VmvH+LftoAkWdZg8uUrXYzENvVJNjBXusN22wuGC/3xwDA38ROuYG2OHAMpkGS8A+9btSZSVxB5CcNog068=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6248
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V2 3/7] drm/xe: Add tracking support for bos
 per client
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


On 12-09-2023 17:22, Tejas Upadhyay wrote:
> In order to show per client memory consumption, we
> need tracking support APIs to add at every bo consumption
> and removal. Adding APIs here to add tracking calls at
> places wherever it is applicable.
>
> V2:
>    - make xe_drm_client_remove_bo return void - Himal
>
> Signed-off-by: Tejas Upadhyay<tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c         |  7 ++++
>   drivers/gpu/drm/xe/xe_bo_types.h   | 10 ++++++
>   drivers/gpu/drm/xe/xe_drm_client.c | 52 ++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_drm_client.h | 26 +++++++++++++++
>   4 files changed, 95 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 25fdc04627ca..c90a9615ab98 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -16,6 +16,7 @@
>   
>   #include "xe_device.h"
>   #include "xe_dma_buf.h"
> +#include "xe_drm_client.h"
>   #include "xe_ggtt.h"
>   #include "xe_gt.h"
>   #include "xe_map.h"
> @@ -1051,6 +1052,9 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
>   	if (bo->vm && xe_bo_is_user(bo))
>   		xe_vm_put(bo->vm);
>   
> +	if (bo->client)

Non existent member in case of PROCFS config being disabled.

Shouldn't this lead to compilation failure ?

> +		xe_drm_client_remove_bo(bo);
> +
>   	kfree(bo);
>   }
>   
> @@ -1228,6 +1232,9 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>   	bo->ttm.priority = DRM_XE_VMA_PRIORITY_NORMAL;
>   	INIT_LIST_HEAD(&bo->vmas);
>   	INIT_LIST_HEAD(&bo->pinned_link);
> +#ifdef CONFIG_PROC_FS
> +	INIT_LIST_HEAD(&bo->client_link);
> +#endif
>   
>   	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
>   
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index f6ee920303af..1aef413b6f8a 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -45,6 +45,16 @@ struct xe_bo {
>   	struct ttm_bo_kmap_obj kmap;
>   	/** @pinned_link: link to present / evicted list of pinned BO */
>   	struct list_head pinned_link;
> +#ifdef CONFIG_PROC_FS
> +	/**
> +	 * @client: @xe_drm_client which created the bo
> +	 */
> +	struct xe_drm_client *client;
> +	/**
> +	 * @client_link: Link into @xe_drm_client.objects_list
> +	 */
> +	struct list_head client_link;
> +#endif
>   	/** @props: BO user controlled properties */
>   	struct {
>   		/** @preferred_mem: preferred memory class for this BO */
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index b5dc024b5dd0..f10b13079074 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -8,8 +8,11 @@
>   #include <linux/slab.h>
>   #include <linux/types.h>
>   
> +#include "xe_bo_types.h"
>   #include "xe_device_types.h"
>   #include "xe_drm_client.h"
> +#include "xe_device_types.h"
> +#include "xe_trace.h"
>   
>   /**
>    * xe_drm_client_alloc() - Allocate drm client
> @@ -31,6 +34,10 @@ struct xe_drm_client *xe_drm_client_alloc(void)
>   
>   	kref_init(&client->kref);
>   
> +#ifdef CONFIG_PROC_FS
> +	spin_lock_init(&client->bos_lock);
> +	INIT_LIST_HEAD(&client->bos_list);
> +#endif
>   	return client;
>   }
>   
> @@ -52,6 +59,51 @@ void __xe_drm_client_free(struct kref *kref)
>   }
>   
>   #ifdef CONFIG_PROC_FS
> +/**
> + * xe_drm_client_add_bo() - Add BO for tracking client mem usage
> + * @client: The drm client ptr
> + * @bo: The xe BO ptr
> + *
> + * Add all BO created by individual drm client by calling this function.
> + * This helps in tracking client memory usage.
> + *
> + * Return: void
> + */
> +void xe_drm_client_add_bo(struct xe_drm_client *client,
> +			  struct xe_bo *bo)
> +{
> +	unsigned long flags;
> +
> +	XE_WARN_ON(bo->client);
> +	XE_WARN_ON(!list_empty(&bo->client_link));
> +
> +	spin_lock_irqsave(&client->bos_lock, flags);
> +	bo->client = xe_drm_client_get(client);
> +	list_add_tail_rcu(&bo->client_link, &client->bos_list);
> +	spin_unlock_irqrestore(&client->bos_lock, flags);
> +}
> +
> +/**
> + * xe_drm_client_remove_bo() - Remove BO for tracking client mem usage
> + * @bo: The xe BO ptr
> + *
> + * Remove all BO removed by individual drm client by calling this function.
> + * This helps in tracking client memory usage.
> + *
> + * Return: void
> + */
> +void xe_drm_client_remove_bo(struct xe_bo *bo)
> +{
> +	struct xe_drm_client *client = bo->client;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&client->bos_lock, flags);
> +	list_del_rcu(&bo->client_link);
> +	spin_unlock_irqrestore(&client->bos_lock, flags);
> +
> +	xe_drm_client_put(client);
> +}
> +
>   /**
>    * xe_drm_client_fdinfo() - Callback for fdinfo interface
>    * @p: The drm_printer ptr
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.h b/drivers/gpu/drm/xe/xe_drm_client.h
> index dbe3a083c9df..744efb008861 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.h
> +++ b/drivers/gpu/drm/xe/xe_drm_client.h
> @@ -15,10 +15,23 @@
>   
>   struct drm_file;
>   struct drm_printer;
> +struct xe_bo;
>   
>   struct xe_drm_client {
>   	struct kref kref;
>   	unsigned int id;
> +#ifdef CONFIG_PROC_FS
> +	/**
> +	 * @bos_lock: lock protecting @bos_list
> +	 */
> +	spinlock_t bos_lock;
> +	/**
> +	 * @bos_list: list of bos created by this client
> +	 *
> +	 * Protected by @bos_lock.
> +	 */
> +	struct list_head bos_list;
> +#endif
>   };
>   
>   	static inline struct xe_drm_client *
> @@ -41,5 +54,18 @@ xe_drm_client_get(struct xe_drm_client *client);
>   static inline void xe_drm_client_put(struct xe_drm_client *client);
>   #ifdef CONFIG_PROC_FS
>   void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file);
> +void xe_drm_client_add_bo(struct xe_drm_client *client,
> +		struct xe_bo *bo);
> +void xe_drm_client_remove_bo(struct xe_bo *bo);
> +#else
> +static inline void xe_drm_client_add_bo(struct xe_drm_client *client,
> +		struct xe_bo *bo)
> +{
> +}
> +
> +static inline bool xe_drm_client_remove_bo(struct xe_bo *bo)
> +{
> +}
>   #endif
> +
>   #endif
