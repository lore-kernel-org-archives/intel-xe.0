Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F98CCA550A
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 08:58:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE2B10E05D;
	Wed, 13 Sep 2023 08:58:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4A610E05D
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 08:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694595506; x=1726131506;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=8Ux8u+3HLsisp4oP3FJTJhC/ZZYjvXN51v/W8O+h3DE=;
 b=A3AtSK/b0wZWx8b4c69p3fYutmjfol+1A1+pFC6RHun0i7ZqVXJPisbC
 ISkD+hz6AboWFhF9jNwWMYsVXvYeyg6Qbq50R48i/jSi8TUhJfqqta99O
 AG0VP5SiEx1beENM2uaZSP6WvMRlj02ller0ARst/J1/s0byjkTywgC7Y
 VKEpnebYCtRmezpYOrYBSFNcuSptC2r5BxU7wVcXZhUftw5NV1echG7nR
 ntPYkqYkGKABkqcv4DyIBXDrZvzyO052tW56ZICv5vo/83UT0spP062as
 AWqBuRdk2bWYy5lfp0tuWFuhCaRKW5cvz34sMTnsHhzkNw9BrEmU+THCc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="358876487"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
 d="scan'208,217";a="358876487"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 01:58:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="744050038"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
 d="scan'208,217";a="744050038"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2023 01:58:24 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 01:58:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 13 Sep 2023 01:58:24 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 13 Sep 2023 01:58:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dc16ZW3/CpM2t13sZ22DmZn4zcOnTCpoAyo7eligXq0ZtKV9ZdxMiQleUY/iErFYkH+Ljx5vFA3VbOg7qNC9vGBrENN3WRxCa69wPTIV+qnTabIcTQwTph3WhFbwwwtEw3QSHnUlqzFLZLp+sDjUK7GPRM44Z6xXs7THNkcPsbJ/RNF19tw3rQNkQXobpzm2GQ8ykfC5eRQaUppDZr9xCKdr58mGtDh6OM7WiV9jVr4OvkmrZ2HkR2GJeEj+omxvHOtAKoHVnSP3sbWjHbFlSblSXX85HWo97164oFmXpdT/E8afNBV8rbAx8jogGPbfYmDYN02R2/XjjtJcepZ+9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FuFsc7yQaGiEs9Mh6AQFzQcb3+eXcVWx91G9RX3jXFg=;
 b=lVgnA5saNAB6Kk9kdVTBjIA0RIAsfZh6fMmAROjhtphRlSt1ArwwJctXVMhZlfRxpU/4Ucrk1tyn5GOePN52j8rea/yv8pOownoL2fUXVnGUDO0n+7fkDhv1oDEeFOPZJAMRQZeKwFle10oJg9HRhE+bAaJlU4exhWRPabSarUDPswpuzPfvYlUwWAN1C9XronRH2/Iq07g/ycUgipfUAIpdG/FEJgiXT0nzp//VE1s3HIL63lvKhibaMm5sVF4V6bXP3PbMKPr743iTsKYRBMTXzV7/B2ItzgY+iD5Wg145ukbC4/oq3TNnxaXy/bBs0Q+ZmwM3D2d+DGNI5h5udA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CY5PR11MB6092.namprd11.prod.outlook.com (2603:10b6:930:2c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.33; Wed, 13 Sep
 2023 08:58:22 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25%6]) with mapi id 15.20.6768.029; Wed, 13 Sep 2023
 08:58:22 +0000
Content-Type: multipart/alternative;
 boundary="------------fKFD4nmQ4hiOCRyP0zBV8EKg"
Message-ID: <f441acbe-c4de-4e2e-872a-648b97ecaa33@intel.com>
Date: Wed, 13 Sep 2023 14:28:13 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230912115239.3554341-1-tejas.upadhyay@intel.com>
 <20230912115239.3554341-5-tejas.upadhyay@intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230912115239.3554341-5-tejas.upadhyay@intel.com>
X-ClientProxiedBy: PN3PR01CA0040.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::9) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CY5PR11MB6092:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a4c33a1-28f2-4ba8-c120-08dbb4379500
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h26BquopTDNSwHPPTIatXKxEwOEAlPHaEaa5IniCkzOUd9uJKNSWqxjF1zfbfDjETvks00G7xZESFoCJrzqV0qlEktdqxry2tlD5Mk6+Vn5bQDplrO2et4Egm+2Y1zn1cJU8YyQW2a5UfjReqUdg3Dpangw9d/aHsCA3jaNF+d3Se+W5lZ9LT3r/YauezxJORAFCPiM7b1lknOL4tUfc5zVy9/D/RFzqsc9+sWeg6W9ndSS/cq30vt22Exbim1wIN2xYoXh3FoC1eZ9ipggEBuNDGf1h8DGDG3ufFBC2SYUKcDXX1l0jzScNOP2Ty0W90/fpVWhleqPCX3bm9fBTgZLbrj1apyzDt2I9WQ/h23ZdsWsP/SmTZd7YAco+JD73BQcRnLH0YzalvWSVn9XW56lNQAP/v0lW//tfLeRtc7au17NRZhlIdVqO76Jol2JKMnBCNh3kllvYKlXUfq+OrEy0sQoa8CexcNI4FabKELSAAhDIOhh2Jg1riPV3fzj1y1kOIGMN/JCRr1SI13Z0L+xNUdXTOoeKZpyv+w6VTWCzVzHoXmGYFzCrCTBmdyZy1pFBNUEYESPJaRmpn/uQrgtow3/DRRwm6wrycywuIoHqNC3dR3Ia2FbXpc6DmSCKfB6ZqQarsWx3ctB3pTWuxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(346002)(39860400002)(396003)(366004)(1800799009)(186009)(451199024)(5660300002)(33964004)(53546011)(6486002)(6666004)(6506007)(2616005)(83380400001)(26005)(478600001)(6512007)(66946007)(2906002)(316002)(66556008)(8936002)(66476007)(4326008)(107886003)(8676002)(82960400001)(36756003)(38100700002)(31696002)(86362001)(41300700001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTFxZVVhalFWbUF2Nk0rUDVWMlRCSDlBTzlqTGNZYWJRM0pPMlk2Snc0eldW?=
 =?utf-8?B?cGJ2RHlFV2txL2dvVEN3YzRYZGluWmtBcnZZNEVXZ2swUWV5dDc5OHpHai9H?=
 =?utf-8?B?NVUwVG9NaDNDQkY3SlZJamZySVFsb2NzQ050RUVQQlNESkRIcUJCbXhzc1VH?=
 =?utf-8?B?RXRGN3BYRnFDUk4zR3piMEVyeEwxZ1hjYi84YUcxRjJkc2UzVGV5R3dkemc2?=
 =?utf-8?B?VmNYV3k2a0k0WUdyQUpBNHFxcjNFamhKLzdialc3R2FqMmNuc3JTQ3h1YXdH?=
 =?utf-8?B?ejNtSmlTV001bXhUSTl0MFBJTWt5WTBTTGhZRm01S25UV00xUktUTDBJMEJ2?=
 =?utf-8?B?SnlFbThyVmVPYlFtbjUyQ1IzY3g3R1NFQXpBbzBJeTZ1YnRZekhUbUpEa0pQ?=
 =?utf-8?B?dnROUis3NXE4d1N0ZzBiRml2SGw1RU9OUjlTaWpMZnFmUkdURVROdSthL2V5?=
 =?utf-8?B?dmpOcDEvaVBsdnprNDQva1NESnU0TXdxQ0VtZjFLVUJ0cmpqS2wrd3ozdnhR?=
 =?utf-8?B?WjU0aEtkeDFMQ0pER0F1OUpFbWl2RWdrWGQwcWxEaWJrUnRlZmhCc2JXTzNG?=
 =?utf-8?B?dVEwVTBCTUVCYVFtV2Y2Z1JzK3VHdmJNOHR5ZTg3SmFHczBRYkRLSTlwZTk0?=
 =?utf-8?B?cUE0K2JVMjlXdVNKei9OaUZiaHpIMHJ1TkhnMjdhdFBzRFo3SDRoNlFLNUw2?=
 =?utf-8?B?RjRUU0xyQVZGdlF6VjRYTnE1cEVuZTlqM0N0MFpZY1N1SXBOc2ZFMklqRVhQ?=
 =?utf-8?B?OFJqWUZybnBaRm5TaTVKalQyS2syUlJMbkJWTnpkK0JHSUpDSnFsWXR2c1Y3?=
 =?utf-8?B?MVJIRk40VGNlUG5GWTJyNmdlNy8rTk1pNUw1czdCTnpZck1SV1laemUrV0lk?=
 =?utf-8?B?ZUxCRlRBL3BzS2RCZnRkL1YyQ3lrVUV1SUttM1p1RHNiMUFycWJoQU1WT3lL?=
 =?utf-8?B?eUN0K2srZWxEeE1nZkdWRVN4aFdGYXhMNFdhZFlLRXdud0k4czh4Ukp4V3hG?=
 =?utf-8?B?RlBqeXd6SE8yb1VXS2Y5d1Z3SHVXb2thQWk2SGVoN2JwWUhja1BYMVBRdzdB?=
 =?utf-8?B?UDFZVEs1UCtseWJwalBxMUpRWHkxK2dkNjMwNkFSZ0JqZTl5dnE0SWZ5QkRH?=
 =?utf-8?B?VG1wK1BqRWVGSGZ5aiszK0IvZkpwTjI3cTJPRmtSVHpUdklJcmVlMmpRQVds?=
 =?utf-8?B?MFdYT3lSaGNuaC9wNEFYcW84V2IyK3hjNEpsakRNd0FCY2l3WWdHamY1UmNN?=
 =?utf-8?B?aHh4dGRRakJob3ZOWEN0S1c5QWJNT0pYdUZjMkRHa0plYUZlSldZWkRZM1B5?=
 =?utf-8?B?dVpoQkZPc1JPZUtNVUtYYVVOak5UTEdRZDNhUDUvdXNicUpuZEpib0hZQmVa?=
 =?utf-8?B?VHBzSUtZVXRWaWEzTVlHTkdzTTI1YythY1diZVI5clBadXNsU3doZDdmWWY3?=
 =?utf-8?B?cFRrbzFPUzlzMHFyQlBtN0pURHlQRWZ3QzBScWYwZmY1TGtvNzBDUjFRbVJn?=
 =?utf-8?B?VmdxMjJRTTJqYllrQzc2S1B6U1hCSE1OcHN1SGhqQkxPVStRb201SHl2Z3FJ?=
 =?utf-8?B?RGFJUWlSelN0SjNHQ2pUUFhWRmViYnNIRFIxaG4yWndJUFNGZUUwTW53Y3RM?=
 =?utf-8?B?bzNwZkVqdWwwcVhZakNzNmZwOE1IVENKWmxESnB3NnZsRExlQ0t0UTBNSVdl?=
 =?utf-8?B?RTVaWXZRak9JbkhMT1N2WGN6R05BMjJXSGlWZ3BMT2xsOWs0dTNoY29OUjJ6?=
 =?utf-8?B?NDl4aUV1NWVRaXlMMlhUL3h0ODNuQ1lLa0lWd0RDZVBCcUJjNjV5NmcxV3Zy?=
 =?utf-8?B?amM1ZGl1MGxrTEJmMUJETjIwRlNzTm5ZUk9iRWpzb3JrRmNkcGpSV0RObVZp?=
 =?utf-8?B?aXhMK003eXptdTlCOThoelk3bXVvdWhwdUxuczZ4RUg4S1BXNE1yME9JdXdZ?=
 =?utf-8?B?d25WdTJVV3h3RDhXUHFOQ01sc1oxWC9vZzlYU00zYnE4NFNRSy9oVE51VTJy?=
 =?utf-8?B?cEFhalRCbjBrRmpSRE5nVUczVnQ0UzZqcDloa0tvY3RmTCs4U1dTV3JyQ1dI?=
 =?utf-8?B?b3QvdDZUZm4zM0JEWGlrVUJxck85L2JHQXJ2WWxwNFJsMTFuMVVEWUNaeDM3?=
 =?utf-8?B?YkNGc2l6bE5PTkdKSHhLWEpsNVVrRUZnbUNnZElPODhMZmc4V2RoUnA1MUND?=
 =?utf-8?Q?Q0Fs4YYbdQFbQNg6saN1wqs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a4c33a1-28f2-4ba8-c120-08dbb4379500
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 08:58:22.2500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j7B9xpKmUTvD6Tw0qUTE8vwTi9IS2qLY3cCpo6107VcthAJzhtNMOR0CSmzk1tQRBT7VddE9ntziI6FRm3/Kgblq2XrISqI0W3UB85H98BU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6092
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V2 4/7] drm/xe: Record each drm client with
 its VM
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

--------------fKFD4nmQ4hiOCRyP0zBV8EKg
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 12-09-2023 17:22, Tejas Upadhyay wrote:
> Enable accounting of indirect client memory usage.
>
> Signed-off-by: Tejas Upadhyay<tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vm.c       | 1 +
>   drivers/gpu/drm/xe/xe_vm_types.h | 2 ++
>   2 files changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index a6a0f17fec1d..92d8c78c9284 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2051,6 +2051,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>   	}
>   
>   	args->vm_id = id;
> +	vm->xef = xef;
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
>   	/* Warning: Security issue - never enable by default */
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 52e5eaed91c3..af2ba4acf1f9 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -336,6 +336,8 @@ struct xe_vm {
>   
>   	/** @batch_invalidate_tlb: Always invalidate TLB before batch start */
>   	bool batch_invalidate_tlb;
> +	/** @xef: XE file handle for tracking this VM's drm client */
> +	struct xe_file *xef;

LGTM. Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   };
>   
>   /** struct xe_vma_op_map - VMA map operation */
--------------fKFD4nmQ4hiOCRyP0zBV8EKg
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12-09-2023 17:22, Tejas Upadhyay
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20230912115239.3554341-5-tejas.upadhyay@intel.com">
      <pre class="moz-quote-pre" wrap="">Enable accounting of indirect client memory usage.

Signed-off-by: Tejas Upadhyay <a class="moz-txt-link-rfc2396E" href="mailto:tejas.upadhyay@intel.com">&lt;tejas.upadhyay@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_vm.c       | 1 +
 drivers/gpu/drm/xe/xe_vm_types.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a6a0f17fec1d..92d8c78c9284 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2051,6 +2051,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	}
 
 	args-&gt;vm_id = id;
+	vm-&gt;xef = xef;
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
 	/* Warning: Security issue - never enable by default */
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 52e5eaed91c3..af2ba4acf1f9 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -336,6 +336,8 @@ struct xe_vm {
 
 	/** @batch_invalidate_tlb: Always invalidate TLB before batch start */
 	bool batch_invalidate_tlb;
+	/** @xef: XE file handle for tracking this VM's drm client */
+	struct xe_file *xef;</pre>
    </blockquote>
    <br>
    <pre class="content" style="box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; display: block; padding: 9.5px; margin: 0px 0px 10px; line-height: 14.3px; color: rgb(51, 51, 51); word-break: break-all; overflow-wrap: break-word; background-color: white; border: 0px; border-radius: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><span class="reviewed-by" style="box-sizing: border-box;">LGTM. Reviewed-by: Himal Prasad Ghimiray <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a></span></pre>
    <blockquote type="cite" cite="mid:20230912115239.3554341-5-tejas.upadhyay@intel.com">
      <pre class="moz-quote-pre" wrap="">
 };
 
 /** struct xe_vma_op_map - VMA map operation */
</pre>
    </blockquote>
  </body>
</html>

--------------fKFD4nmQ4hiOCRyP0zBV8EKg--
