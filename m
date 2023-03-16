Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67277C6FD1F
	for <intel-xe@archiver.kernel.org>; Thu, 16 Mar 2023 14:48:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3486810E22F;
	Thu, 16 Mar 2023 14:48:34 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C1E810E22F
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Mar 2023 14:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678978111; x=1710514111;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ES9IoTnbmiMo4QWr9GDjGOQ/wIG9h8KywrnjZoRjp9c=;
 b=eAJL5MMkG562Xj941gilZ0ROzJdJ2qBNZ2y8apF6WoR/wtS7qQphixFd
 mKJQhCcLbBWpXj4kaQxRT4pw2Ib+OvKUeIpT/OPMLQRIPZG/qvvJcByYN
 3n0pgM9AVuGxUuOpAbDZjH4mEWz6gIOtdRFSO60xs0c0OVqxCmr74FD71
 6FL3oIzuP7YbN47twav/K+EOo6pjeERcCMUfKQo3rls25DGqF5hdtgWz5
 S0Aza99b/CYWEE4kJb9wwb2Prdoc+fCYGWAeF4OPSnQtFD+Itriu5ucBO
 fH/7mNzlgkgbtP1o1XBakx5aMth1qLeN+2fumHDxZIKz//Ir/DCCOuIxt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="424280495"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="424280495"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 07:48:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="790334063"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="790334063"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 16 Mar 2023 07:48:30 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 07:48:29 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 07:48:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 16 Mar 2023 07:48:29 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 16 Mar 2023 07:48:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDeYlnj4M3+9xudSlKpt6VIj/Q4ubJrQjDfB/gGoSKP4++EBP5JZstTDcbOrQIgW62XW8fMKAwXGTKoQ1l49go5KKECLy+7oTEbOsYJFatTE0CcONG9La68JfujhcxThGgsKpai1Wk12KvSJ7cWAlQDLJVrW38lwxJg76X3SO7gtMXqw0dzM2o2TdTvwE0egPFE+qJ3GerSE5/2ltpMre5e/KyrjeH30oVyax6rUpVi3oRt3hAduqZFrTqPaZvO2+k0TsukvbFqsV9y0KVvQnj22FVOyeVBqU9RqCfj4351p4cBQNvlYBrPXDL87oQhdpjlrrJKJtP+XQXuRgOJeQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+oKIXQoqXfKN9THCRiggMs3iUdzwcZULCZcym7WpsuY=;
 b=dlGKNiLGY6a3jaWe6Wj6D8cjOthxe6IgtUvv+sXrhq61ToreFgBQFTzQer+1ueBr2QoA7IVteJfG3h9YJOLowYXbKuTsUCi/T/WxrooI/dfHFn6d8iD4FM+DjwBJYTaVVVSSbr72636HVNv0yFnAW6nDuODApzW81ab7jEHPWRrUfq6r8rbhBquLSVNqryq4bMLY1nZuFRPzasuWRgUa1jGb7Dsc1/spbK5NS/vOXtkTVOlKyr/BJA4bw5X9Ii8iDuOAdy6ZckS0uMkglLq5heMx+VoAVfm+45BHkuytXNG7SPJl9uG7IV+kQHh6L7hkD7r227RrfAS5M9WnQqEARg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by CY8PR11MB7395.namprd11.prod.outlook.com (2603:10b6:930:86::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Thu, 16 Mar
 2023 14:48:27 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::de64:d1fd:cc87:a040]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::de64:d1fd:cc87:a040%6]) with mapi id 15.20.6178.033; Thu, 16 Mar 2023
 14:48:27 +0000
Message-ID: <325eb584-0986-eee9-4e3f-4a677226ea2a@intel.com>
Date: Thu, 16 Mar 2023 16:47:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230314085842.134239-1-matthew.auld@intel.com>
 <20230314085842.134239-4-matthew.auld@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20230314085842.134239-4-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::12) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5409:EE_|CY8PR11MB7395:EE_
X-MS-Office365-Filtering-Correlation-Id: 358327e6-7051-4f1e-97f1-08db262d7fbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uhUUMWoOvqUMfYrfsu0IA3iozbu7p9OdO8aNlIScjnj2aXiYAhbnl7GQOrXdpYEdbH2PuNtXBbILcWxr8X7ufXZXtvWQbDKaYGcTnWqI94vlio0xApaNNvqJJyH8WMP9djj7xcLNMz+Ln6MITtmOXkUIwhSagkMPpgMbICuq7TLc1AWuUo/4RG8soLtoljIGLUYIQjjSe8/DNR4tWQHbXlPBmKIfPAynbqzzqwOqKbBlcYhpj4YPQB4NNCTH8Mx9qjcXU01exd3sFJJ7zeg/B+Vr8bTF/af0YJmpmLlXOpa7j/XTkdd6/3DUDzaVsW8xfAov7jaFPluWNhkM3YxyVO2w0gwg+SVtBJghDWgagcffMQ/DbIzeWJfeMqtt4LOUmY0xy1LQIih+D7ZkkuVf5kmupRDfrhTvk4PudHw6+3/LkQcHX1IFMOOrOnGObC5L+LcBv6g/RVEflYILZVhcxQ75Sptfy4lLON/mbx/tkDklHnClSKIvFWDKH8k1yAGneZ5qlz860EgJKO3Sv0dmrZ0Gds5v2naC9T6y4IyyqhxXS5NZaZfG9GulnwjbpRQ7FtYnFZUVzgZ744bEfzHUm1/GATzNR+pSLEv26o+v5wDfTxynkzHOmUQh/5zoHa+51b7jBau/ulMRgEgecmrZdNZgE9SubqGMi5jgs/n8lPQt5VdEAOl7RNycUBmNJ69p5yz3N7wWIkDCYMGmnNfoX3SZSwlpz76JQQNEe+PqhlHRLiZqeVbC98zDUIY8M2q6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199018)(8676002)(6486002)(4326008)(66946007)(8936002)(5660300002)(66556008)(31686004)(66476007)(316002)(38100700002)(41300700001)(82960400001)(83380400001)(478600001)(54906003)(31696002)(26005)(36756003)(86362001)(2616005)(6666004)(2906002)(186003)(53546011)(6506007)(6512007)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ykx0UVB6ME1sTGlNRklLYVY2bjFOS2xFbU5TNTBNb1hmeG92cEJWZWg0eEEy?=
 =?utf-8?B?blpsb3JBVUdlOTArenJsWUluSklRa3hZaWw3ZDk2QTVvS1B6RFU0eTl6QjNw?=
 =?utf-8?B?dTRGUEUxL3M2cE96N2FveXY0WDBWSWo4OVJFNUdjV3FOd1p0eDI2WEtoS2h0?=
 =?utf-8?B?ejdtQ3JYeVN3aHdRNXo5SlZxbVNSb1FvK1ZpSkI2K1pJYkJWYlIwM1lwbFI4?=
 =?utf-8?B?dE5kK3VkRFBBT21Yc3ZsUUovZ01RbGJvR2kvenF5NzZIdU9vUk5kOWZDLzVm?=
 =?utf-8?B?OGNwSnZ3WlNxYXBPOGNiNWJTcDRRU1AxdVVYSkVGSWo3RGtiVWE3TDhXbjdo?=
 =?utf-8?B?b1pzQzVWVXd2c3pwSTlBV1dKVk05VS9ZRlRhZDhydVVDV3lUWFUrZXc3UkpQ?=
 =?utf-8?B?OFhNMTZ2UHQ4cGVFNmV4My93bEVsdVlxRzJ6clJRaHAxVFI2NGx2ZjVPMU0x?=
 =?utf-8?B?SmZadzk2R2J6Sm8xT2VYME5ONWdWZkhoN0gxQnZMZ0xPZEVUbFIzUUNDNHV0?=
 =?utf-8?B?bHgwaVNubWFpWFJ3ZGh6MEM3Y1B3OUhVbFhhSWVUYkVES05VczBjdnVCNU1P?=
 =?utf-8?B?dkhRM08vamhkT2VZRENOOXJaNmJFb1VocGlZS1lwUkVBYjhDV0d2aWhjZUdM?=
 =?utf-8?B?T0o2dTIxcHRZY1pFc2tKSVlqbHY2MGdmRHozdk5Ydll5UTZPZU42Q20vdjJ6?=
 =?utf-8?B?d1Y4N1N2bVVXbW5yN21GN1VzMVJSYVk4MTl4TzVGejdqNzZwZkt4c1pVYVdn?=
 =?utf-8?B?a0prOEdaaE1vdlpqcUo2S3JBK0VQRU5ycFd3cWhDaTVzamk4ZU9FWEQzQUJK?=
 =?utf-8?B?a3AwV2RMT2FyNGp4ZVIyR1dWcXl1RE1wUGRDMDVzTmVONmxyNS9HOVpCYkNG?=
 =?utf-8?B?RTVKSXBQSjZmU2RGMWtpMUJQeWZlQnMyVUIzdDBlWXZrUTdxZE43RUZ0MlRI?=
 =?utf-8?B?ZTIzaHdpWFJlTEIzUEQ0ZFg3cW52bmV1YitGcVR1bmRpUDdBWlAzeGtUYldy?=
 =?utf-8?B?eStVY1FIQkx3ZWdxa2ZuQnhOT1o0anRUcndIaWtkWTIyNDJvOWljQXhkMGQ5?=
 =?utf-8?B?U1JZOFFNUXkxMWRmSEVMRVRiUU00OVlaMGxiMkRaTE9wOTdYU0FqdFl3bGN1?=
 =?utf-8?B?TkMwMnpmU3Rnd2tmbVhQa0RKVVh5ZzU0VUxXbFFkU3NINnBhRTluVHlsUW1o?=
 =?utf-8?B?bkxVMEszYnExc1VGeGdxYUpOODNoT3RYYUkxSDIxTm82Skc0R01FaG4ya2pu?=
 =?utf-8?B?RkZpR216T0VzNGdsK3J3azlkMGI4TjBtMUgvZFR4N0lIbzFhLzl0dCtFb1R4?=
 =?utf-8?B?S0s4ZUNXSU9qVWpBdVpoRWlqcDRhZGlNOEIrRUtuSEJ1cmZNSk95ZWZETS9q?=
 =?utf-8?B?b2dPd2oycFg1ckg1UWlqekZiY2dVUmQzaGZzMWh6eDBSZE9LcDVRSElPS2I5?=
 =?utf-8?B?aGVRZVJaRjh2UjE0UzIzY2srN01LZTcvM0hybVJJZGlzVDVPVTBVTUhwZXA0?=
 =?utf-8?B?dmE3UmxTZFFuOGZRR1BMeHlOSjJGZ2xRSkpHWHZnVjZwbkV1QmNJTFBLZ055?=
 =?utf-8?B?b3VsTXppcFJTeFI2STI4NERLQ25TSXFEeU5CU0RBWGNIUnFZQTE2dkxBN2Za?=
 =?utf-8?B?RXdWTVVKb1JkWDhWTmxQQmx4TWtWc0xEZkt3VVV4RXNoOGdpL2g5TTZNVngr?=
 =?utf-8?B?eTI2MG1NYkZHbjJTQ3ZML3c1MjRlZnlWRUo4VUdrY0JnekNvY2JEWWU1L000?=
 =?utf-8?B?N05HU1Y1Nnlza3FHVFYxRTAzemY5dVVZK2RIVTRUVFlvb3dlM2dSRUNpRFRU?=
 =?utf-8?B?alNJbEtRZFlsK0czbzg3eGpBUjNVR29BVlNDTGJkSzNZMXRObk5id0lTckxJ?=
 =?utf-8?B?OHVxNVlhVkNCTlMvWHVQREtmYXJ1dzVTR29lRFFDZlp2Z2ozd0tvb1A1Sm9Z?=
 =?utf-8?B?azVWcXY5WXk5Zmt1N2dZbVBPSmxXMTV0ek13WFlWbFBWTEs3NVppVy8rNEJU?=
 =?utf-8?B?N3hHU0pqckhzRUtJeDNCbFNhVExTZ3ZTS09oM0dRUjBMNXdDRTVWZmY3TE5R?=
 =?utf-8?B?MkxscllCUnlRUmtmSkhKQXF3eENJV2NPV0lSZXNKT09LRzVxY1RpQ0JKZHhC?=
 =?utf-8?B?NkhSQTQ2R3VKeXF5WjhPK2RHbnFSNWtLTzk0ZjZKa2M2U0tLbTYzd29GT3lR?=
 =?utf-8?B?Vmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 358327e6-7051-4f1e-97f1-08db262d7fbb
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 14:48:26.9279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3RpTf3VcanSmjR8bKP6IpCqkpuCw1ypcvARUwdZgw7ePIm4EYGsC697Rp4rr02CzvRSaBJWNObmLm2j7CjZ7B8ZYoi3Etcq1YYil73fykuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7395
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 3/6] drm/xe/vram: start tracking the
 io_size
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Looks good to me.
By the way, Is there a test case in igt to test smallbar on multi-tiled 
hardware?

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>


On 3/14/23 10:58 AM, Matthew Auld wrote:
> First step towards supporting small-bar is to track the io_size for
> vram. We can longer assume that the io_size == vram size. This way we
> know how much is CPU accessible via the BAR, and how much is not.
> Effectively giving us a two tiered vram, where in some later patches we
> can support different allocation strategies depending on if the memory
> needs to be CPU accessible or not.
> 
> Note as this stage we still clamp the vram size to the usable vram size.
> Only in the final patch do we turn this on for real, and allow distinct
> io_size and vram_size.
> 
> v2: (Lucas):
>    - Improve the commit message, plus improve the kernel-doc for the
>      io_size to give a better sense of what it actually is.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device_types.h | 14 +++++++--
>   drivers/gpu/drm/xe/xe_gt_types.h     | 14 +++++++--
>   drivers/gpu/drm/xe/xe_mmio.c         | 44 ++++++++++++++++++++--------
>   3 files changed, 55 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 034e0956f4ea..b98ffad45064 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -176,9 +176,19 @@ struct xe_device {
>   	struct {
>   		/** @vram: VRAM info for device */
>   		struct {
> -			/** @io_start: start address of VRAM */
> +			/** @io_start: IO start address of VRAM */
>   			resource_size_t io_start;
> -			/** @size: size of VRAM */
> +			/**
> +			 * @io_size: IO size of VRAM.
> +			 *
> +			 * This represents how much of VRAM we can access via
> +			 * the CPU through the VRAM BAR. This can be smaller
> +			 * than @size, in which case only part of VRAM is CPU
> +			 * accessible (typically the first 256M). This
> +			 * configuration is known as small-bar.
> +			 */
> +			resource_size_t io_size;
> +			/** @size: Total size of VRAM */
>   			resource_size_t size;
>   			/** @mapping: pointer to VRAM mappable space */
>   			void *__iomem mapping;
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 74b4e6776bf1..8f29aba455e0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -143,9 +143,19 @@ struct xe_gt {
>   		 * (virtual split), can be subset of global device VRAM
>   		 */
>   		struct {
> -			/** @io_start: start address of VRAM */
> +			/** @io_start: IO start address of this VRAM instance */
>   			resource_size_t io_start;
> -			/** @size: size of VRAM */
> +			/**
> +			 * @io_size: IO size of this VRAM instance
> +			 *
> +			 * This represents how much of this VRAM we can access
> +			 * via the CPU through the VRAM BAR. This can be smaller
> +			 * than @size, in which case only part of VRAM is CPU
> +			 * accessible (typically the first 256M). This
> +			 * configuration is known as small-bar.
> +			 */
> +			resource_size_t io_size;
> +			/** @size: size of VRAM. */
>   			resource_size_t size;
>   			/** @mapping: pointer to VRAM mappable space */
>   			void *__iomem mapping;
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index e5bd4609aaee..5cacaa05759a 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -182,7 +182,6 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>   	u8 id;
>   	u64 vram_size;
>   	u64 original_size;
> -	u64 current_size;
>   	u64 usable_size;
>   	int resize_result, err;
>   
> @@ -190,11 +189,13 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>   		xe->mem.vram.mapping = 0;
>   		xe->mem.vram.size = 0;
>   		xe->mem.vram.io_start = 0;
> +		xe->mem.vram.io_size = 0;
>   
>   		for_each_gt(gt, xe, id) {
>   			gt->mem.vram.mapping = 0;
>   			gt->mem.vram.size = 0;
>   			gt->mem.vram.io_start = 0;
> +			gt->mem.vram.io_size = 0;
>   		}
>   		return 0;
>   	}
> @@ -212,10 +213,10 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>   		return err;
>   
>   	resize_result = xe_resize_vram_bar(xe, vram_size);
> -	current_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
>   	xe->mem.vram.io_start = pci_resource_start(pdev, GEN12_LMEM_BAR);
> -
> -	xe->mem.vram.size = min(current_size, vram_size);
> +	xe->mem.vram.io_size = min(usable_size,
> +				   pci_resource_len(pdev, GEN12_LMEM_BAR));
> +	xe->mem.vram.size = xe->mem.vram.io_size;
>   
>   	if (!xe->mem.vram.size)
>   		return -EIO;
> @@ -223,15 +224,15 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>   	if (resize_result > 0)
>   		drm_info(&xe->drm, "Successfully resize VRAM from %lluMiB to %lluMiB\n",
>   			 (u64)original_size >> 20,
> -			 (u64)current_size >> 20);
> -	else if (xe->mem.vram.size < vram_size && !xe_force_vram_bar_size)
> +			 (u64)xe->mem.vram.io_size >> 20);
> +	else if (xe->mem.vram.io_size < usable_size && !xe_force_vram_bar_size)
>   		drm_info(&xe->drm, "Using a reduced BAR size of %lluMiB. Consider enabling 'Resizable BAR' support in your BIOS.\n",
>   			 (u64)xe->mem.vram.size >> 20);
>   	if (xe->mem.vram.size < vram_size)
>   		drm_warn(&xe->drm, "Restricting VRAM size to PCI resource size (0x%llx->0x%llx)\n",
>   			 vram_size, (u64)xe->mem.vram.size);
>   
> -	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.size);
> +	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
>   	xe->mem.vram.size = min_t(u64, xe->mem.vram.size, usable_size);
>   
>   	drm_info(&xe->drm, "TOTAL VRAM: %pa, %pa\n", &xe->mem.vram.io_start, &xe->mem.vram.size);
> @@ -239,7 +240,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>   	/* FIXME: Assuming equally partitioned VRAM, incorrect */
>   	if (xe->info.tile_count > 1) {
>   		u8 adj_tile_count = xe->info.tile_count;
> -		resource_size_t size, io_start;
> +		resource_size_t size, io_start, io_size;
>   
>   		for_each_gt(gt, xe, id)
>   			if (xe_gt_is_media_type(gt))
> @@ -249,15 +250,31 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>   
>   		size = xe->mem.vram.size / adj_tile_count;
>   		io_start = xe->mem.vram.io_start;
> +		io_size = xe->mem.vram.io_size;
>   
>   		for_each_gt(gt, xe, id) {
> -			if (id && !xe_gt_is_media_type(gt))
> -				io_start += size;
> +			if (id && !xe_gt_is_media_type(gt)) {
> +				io_size -= min(io_size, size);
> +				io_start += io_size;
> +			}
>   
>   			gt->mem.vram.size = size;
> -			gt->mem.vram.io_start = io_start;
> -			gt->mem.vram.mapping = xe->mem.vram.mapping +
> -				(io_start - xe->mem.vram.io_start);
> +
> +			/*
> +			 * XXX: multi-tile small-bar might be wild. Hopefully
> +			 * full tile without any mappable vram is not something
> +			 * we care about.
> +			 */
> +
> +			gt->mem.vram.io_size = min(size, io_size);
> +			if (io_size) {
> +				gt->mem.vram.io_start = io_start;
> +				gt->mem.vram.mapping = xe->mem.vram.mapping +
> +					(io_start - xe->mem.vram.io_start);
> +			} else {
> +				drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
> +				return -ENODEV;
> +			}
>   
>   			drm_info(&xe->drm, "VRAM[%u, %u]: %pa, %pa\n",
>   				 id, gt->info.vram_id, &gt->mem.vram.io_start,
> @@ -266,6 +283,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>   	} else {
>   		gt->mem.vram.size = xe->mem.vram.size;
>   		gt->mem.vram.io_start = xe->mem.vram.io_start;
> +		gt->mem.vram.io_size = xe->mem.vram.io_size;
>   		gt->mem.vram.mapping = xe->mem.vram.mapping;
>   
>   		drm_info(&xe->drm, "VRAM: %pa\n", &gt->mem.vram.size);
