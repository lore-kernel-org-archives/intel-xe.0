Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 681B9C001DB
	for <intel-xe@archiver.kernel.org>; Fri,  4 Aug 2023 20:51:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C2710E12C;
	Fri,  4 Aug 2023 20:51:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1338910E12C
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Aug 2023 20:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691182284; x=1722718284;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=81oW9Nj6PuHbbSUf+lfEOlA8yZju0hPEZ2wwA2uvJz0=;
 b=mvE9X5YNzW1TD/89eDa7SgeYrnf2rPVnW44+/IcPlggZ29YKoWX0PW15
 gblAQuQD3E24w2Y6aMKwdXOe4n8zE8are+AEkT64IrqPKvtO3RgiTyIhX
 cDvEYPxjQ5GymapyO1mOD3sXgsDnQjLFp7nGIwDF8SZPLQp5XnQZo3+Kd
 Dwge+2AwQZmHWhfDvNSt/QptPxFThopooimbfs3aq8weBie1OKjgWTFNe
 Iurr+286/Lw0HzQPBG2ErFmBCC7xljiSdcgv7miBn6Ai6ueUleDobLvHf
 qCgcsskO5N1nfu+T1uJ2GrhGJ3pYBM1Ear37xRmkQ3omsT80glpnEjSPQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="456623234"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; d="scan'208";a="456623234"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 13:51:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="680093484"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; d="scan'208";a="680093484"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 04 Aug 2023 13:51:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 13:51:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 4 Aug 2023 13:51:22 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 4 Aug 2023 13:51:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KrnLz7/r5pNsc5y2TB4jiNiKKpjd+h07eD5mU9h9IdIC7lvF8VsDsObRJmgDhsirx2cUqVnhc7e/8JKByk6slIr3NhHh1DQl3ZdWwTP3m33Z4YeNGLVc0ZAnwlzmFQfZjTasXXgb+fy4fNTVoguIipQ8/AVKUCDKKGtEa/rlsL/JwjgdMKI+qK145/4XCvfB6I2bbPIHnr6Y2E9xSne1GWoRcrSIJfN907HU37yF+Ws36nFB31rOgowNLu4+d89Z8l8kC4lOWSceLr+k0UXYckCzBJCpDiFR4IZdeh5aHivywOujUQKH2wCMdloY7StbmoD7Gjg34yRwBSj/WVmKqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L+T3ZJkEOztg7euESje5apRRigmLJ4YlsZ0nS1XskEI=;
 b=e4CMQUqGeO2FCb98uGdddudE78zEmF0NqLFg/BE0C9oFXV1Nw4puSKpyRXh4PbJfny9SmkrccBGcXCksyNBBLgJmXKmLux8+tbMKMgxml9LBx9XbpHFvvFisHqtE5d6tn0GB20Vej+yqcZz5vX3OlLltDZNPlFIGrsJetShuS3tY4iBp5FVUjA7KeyyLexqsuCEDLMhwirBEeKg08gaI3HDfMRUUj+Kad3MJNugZYKTHpBJLnazs9wOLYHk26IJn3t38Krubpk+KtglLosLMLO5hhfTNWskKc0hBFYlEaNdR8qfa+jVL9nNliiP8/CuOBjCzslO0l7hsHpADNpVnRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by PH0PR11MB4855.namprd11.prod.outlook.com (2603:10b6:510:41::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Fri, 4 Aug
 2023 20:51:21 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::32cf:820f:a18b:422d]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::32cf:820f:a18b:422d%7]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 20:51:20 +0000
Message-ID: <f38856fa-fa4c-4b32-83a3-cf78e9a08528@intel.com>
Date: Fri, 4 Aug 2023 13:51:18 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Oak Zeng <oak.zeng@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230804204422.2656586-1-oak.zeng@intel.com>
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20230804204422.2656586-1-oak.zeng@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0097.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::12) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|PH0PR11MB4855:EE_
X-MS-Office365-Filtering-Correlation-Id: 4264d78c-4e2d-45ce-b69d-08db952c8e62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YSs9zb/66jHCzZXz3xrgZFdOOvCMOFEq5r70sv189b++X9mu3DBKVjtXSYfYGM0BJUn1UCJNXgiqkFjMsCKSWR4nKgRS+i7EyGhRvUOaBWfZLC9BuhMwSndLyszwDdUJVLfUanyMXNLhQVgz5PgjyGuoB+VutGm/PpjkTw7K1GFdEzgcBDubq/C+EU9lV3N7uq0Ci3UmyCo5utxFdNXF7gFLukljRVaAzPvMsntR95+RTrQxBwllGc/4Nc4dkrKkoq9etUdGzzAjXUrrFxjcpM7eESaDSJveMIA3QHcdPYhgSebaO0TIddiS41cwV2Mi8Q7P4sFZMTdRhxw6I1MdwPsx9Axjkxb8b5xliLmWLYibxo7hWCIM0pV+CcDm6+8SYJUlszql/Xkrd4yVpIfZXw9i0CroeGBR3HH2xE5Nn/VEYa/lXs9G5//YJI92ZSAFAWF2xsvRLzzsug+YeuIZnX7fe7M9/nlD0R9tAT9KFsGFVWGhD0I94j2Gu56z1MO54GSNez5AfthZBk8q5OfR0ZhDjq3T+Wu9YB1707+DLoFiAdgXX1i0KZPNpWcfPbBhSbMg7mjCw7XWmvkLcrAM2uy1DKnV2wE4QHeFYO3YIuLif7JvFzkJ4mgrZbp/mValJxl1CduzHGi64h7KrZYsaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(376002)(396003)(39860400002)(366004)(451199021)(1800799003)(186006)(66556008)(66476007)(66946007)(2616005)(316002)(4326008)(5660300002)(107886003)(26005)(41300700001)(53546011)(6506007)(8676002)(8936002)(31696002)(6486002)(6512007)(478600001)(31686004)(38100700002)(82960400001)(2906002)(86362001)(36756003)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHZxWGp3alpUSEExSGdVTGxpeUoyclB5eTFHYmN0R0srR21IZ2Y0NjVzYU9U?=
 =?utf-8?B?SUpPZGVqVnJySDcvNjhiaE9wNjh6S1dBQWp3V01Cd0szSm9BWHc5OWY5RW4r?=
 =?utf-8?B?SGM1TEZtM3dMZVgyUlg2WlJJMjV3WFEzR1BFTzZGVW5JMlRRczRwdkZzZ1R5?=
 =?utf-8?B?d05yUGxQcVh2emZFK0ZTVUlER2JsbGlsc28yTjM4MDJtdjdnWXoyNUgzcnEy?=
 =?utf-8?B?MGNuVUJCU0pad0dnSVhmRVJqcVhHWVZ0RGkydmxqV2I5VlB0ZXBEbnlyTUlj?=
 =?utf-8?B?WWJ5S0xBWnZtMUpYbnNEeWplRUZIQWErVlpmSlRuM2F2NEtLYUY2eHM3OHVC?=
 =?utf-8?B?a2NyZHpvbXk5ZmQ0UUZPL2RqMktjc0hhV3pDVGVCdGM1SXZXcUFjSG4zRlhu?=
 =?utf-8?B?cW54WXo4dEEyNjRaMms1cHVHSWlSejhGdll0dThrNlFxZUlHdXZyRDg2NGEx?=
 =?utf-8?B?Nm5TRHMxWEZOeUJjNWt4K2FFZE11T1UvazBXOXRSVFdlQjhyRlY1NE1Lckdx?=
 =?utf-8?B?U3lCNmpQMjdSMVprWWd1U0QrWUFDWTdhVG4zRTBOMWhQVmZqTUdaWEpwYXFY?=
 =?utf-8?B?WHIxczRMYUI5Vk11dWE2c3JDbmVNd0ZIc0VFU2REVWlYU2E0SHpXOXY3Z24y?=
 =?utf-8?B?V1ZKMlgybzNzaFZ4b3FORHZ5YnZXR2hNNVFVdEZpTGtubjhOanNXUEI5bUFx?=
 =?utf-8?B?RzVEc0NYbTl4V1k2UG40WXpNVkMxajVjYzl4SWVLQTRISGdHOFFhMEtmdzhu?=
 =?utf-8?B?ZFlXU0RBck9vNklXTTIrVWtkNFNxREtNZ0J4YU0yY3huT1N0Q3M2RThkaWlh?=
 =?utf-8?B?bUxEdlFmdzhSc3NzZGQrNktNVXd1MTVOUzMrcmJGU29oQnFqQzNRclhtT2Zl?=
 =?utf-8?B?aXpKZm9DUkV5NnZEd2txeW5pRm1IUVdocFFZdzZnQkpKOElycncvUmxBcS9n?=
 =?utf-8?B?RzRoYktYa2RIczJZaWtOaDNRQmd2cEZ1bWVKNGJzeCs3ZCtXZ0QrRGtEam5B?=
 =?utf-8?B?cGdVYlkxQjFLNEFPckFObUlvYzQxcER6VS9hMExEM0Z5NHVrdVA5anlsMnZ3?=
 =?utf-8?B?Vk1rQWRJZTAxNDV6ekNaS2NMZ2wwZ0dtSlZLMVBObk1CN2h4WXpaOUJUL05D?=
 =?utf-8?B?QTNRZS9YaUF4MEcyYU5OemhDZXhJbkxCU1RMak5zbEErVTlRQ3RNOHlabUox?=
 =?utf-8?B?bXVyVFNDT3ErSy8ranpvOTl1THlCOFF2WnFiaUtROS82N2FSQ3BHb0lVNU5S?=
 =?utf-8?B?clliaTVGNHBJaEtsN0Q4YzFZZ2gzemlLZTdhL0hqQ2JRYURBYnRrQ3J3RkNz?=
 =?utf-8?B?eVNUVzdNL2tvK3AreTZGSzJSUUdhRVlSeVZPRVV5amhaS25IczQ5ZHdHQnhz?=
 =?utf-8?B?TUMvNkJxZzJLQjZvL3ZRTGRSTkNkckw3TjBTUDVYcXgvWGRCb1lFSHJYeTVB?=
 =?utf-8?B?Zm9RWHFwUEVub3NWM1VCMXBhNGZMRy9NU2VWd0J6dEd3M09PR3Z5bnp3SHNN?=
 =?utf-8?B?a2JFZFc1SG1CeFZoZ1hsei82dTR0SEt3Tnp5VnRSTm9rRUtrb0NFQ0dnY1RM?=
 =?utf-8?B?c3Z6UEdERXErODFNeGFSbUVLb2p0TDZPRHRDaTZyK1R0MHl1ME53bjc5cDcr?=
 =?utf-8?B?TEE3QVgxekxKVGNlc3N4RDlYaXVVQ1lWS281SjlFYWlGVUpOZWVQODdzZVVs?=
 =?utf-8?B?d2d1cGFkRHlabEhhSVJKaE4xVytTSCtFTlB4d2IyYXdNUjdWbkcrckY5Mkxt?=
 =?utf-8?B?VjNtUjFSWkpJSnpBNXRrTk5BT2lySUFjR3hycmdhUnRCN2l4V05WZkpicmRO?=
 =?utf-8?B?MmprV0JGWjUxVjk2T3llcmMrQzY2K3ZsNUplV0ZTZjRzMGF3emdyVFJoVk91?=
 =?utf-8?B?dzVHYS92QUJMcFVSTHRRNU04aTVYZHFsVnNFMXlENVFjTE00NU9HcEgya3RU?=
 =?utf-8?B?ek5iUlI3TVhIMXBjd3hiNStDVCs4Qk1zcWZma0dQclVSTjBjZjBYbjhUbnNG?=
 =?utf-8?B?cjgrRDJRbDRaUFRmNVV0S3o5Uy9Gc21FM1AwMXJ2d1VZdDRMUm10YzkxVUt4?=
 =?utf-8?B?cTFHMlBBLzluV0EzVmtiZDErOFlMazMwSVVUZ2VwSEthYWt3V3A2WHl3QWNR?=
 =?utf-8?Q?HCmyt550CrRVsFjdugcT+i8Fh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4264d78c-4e2d-45ce-b69d-08db952c8e62
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 20:51:20.4582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: loUQ3IQqQpxU09BP2yYU4oFTnZlCc/hExgNwjuKYwBiqf+EjVBzwivhJXZsBNKjR3Cwci8iIe8DTN3AD0N0dAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4855
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Implement HW workaround 14016763929
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
Cc: matthew.d.roper@intel.com, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 8/4/2023 1:44 PM, Oak Zeng wrote:
> To workaround a HW bug on DG2, driver is required to map the whole
> ppgtt virtual address space before GPU workload submission. Thus
> set the XE_VM_FLAG_SCRATCH_PAGE flag during vm create so the whole
> address space is mapped to point to scratch page.
> 
> v1:
>    - Move the workaround implementation from xe_vm_create to
>      xe_vm_create_ioctl - Brian
>    - Reorder error checking in xe_vm_create_ioctl - Jose
>    - Implement WA only for DG2-G10 and DG2-G12


Reviewed-by: Brian Welty <brian.welty@intel.com>


> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile        |  2 +-
>   drivers/gpu/drm/xe/xe_vm.c         | 13 +++++++++----
>   drivers/gpu/drm/xe/xe_wa_oob.rules |  2 ++
>   3 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 1b59702cd9f9..c91bb7ddcf1d 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -37,7 +37,7 @@ quiet_cmd_wa_oob = GEN     $(notdir $(generated_oob))
>   $(generated_oob) &: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
>   	$(call cmd,wa_oob)
>   
> -$(obj)/xe_guc.o $(obj)/xe_wa.o $(obj)/xe_ring_ops.o: $(generated_oob)
> +$(obj)/xe_guc.o $(obj)/xe_wa.o $(obj)/xe_ring_ops.o $(obj)/xe_vm.o: $(generated_oob)
>   
>   # Please keep these build lists sorted!
>   
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index cb28dbc2bdbb..394bd23dc18e 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -29,6 +29,8 @@
>   #include "xe_res_cursor.h"
>   #include "xe_sync.h"
>   #include "xe_trace.h"
> +#include "generated/xe_wa_oob.h"
> +#include "xe_wa.h"
>   
>   #define TEST_VM_ASYNC_OPS_ERROR
>   
> @@ -1982,6 +1984,13 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>   	int err;
>   	u32 flags = 0;
>   
> +	if (XE_WA(xe_root_mmio_gt(xe), 14016763929))
> +		args->flags |= DRM_XE_VM_CREATE_SCRATCH_PAGE;
> +
> +	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FAULT_MODE &&
> +			 !xe->info.supports_usm))
> +		return -EINVAL;
> +
>   	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>   		return -EINVAL;
>   
> @@ -2004,10 +2013,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>   			 xe_device_in_fault_mode(xe)))
>   		return -EINVAL;
>   
> -	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FAULT_MODE &&
> -			 !xe->info.supports_usm))
> -		return -EINVAL;
> -
>   	if (args->flags & DRM_XE_VM_CREATE_SCRATCH_PAGE)
>   		flags |= XE_VM_FLAG_SCRATCH_PAGE;
>   	if (args->flags & DRM_XE_VM_CREATE_COMPUTE_MODE)
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 15c23813398a..ea90dcc933b5 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -15,3 +15,5 @@
>   18020744125	PLATFORM(PVC)
>   1509372804	PLATFORM(PVC), GRAPHICS_STEP(A0, C0)
>   1409600907	GRAPHICS_VERSION_RANGE(1200, 1250)
> +14016763929	SUBPLATFORM(DG2, G10)
> +		SUBPLATFORM(DG2, G12)
