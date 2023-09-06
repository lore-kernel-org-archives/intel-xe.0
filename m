Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391AEEB8FAF
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 04:15:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D1210E030;
	Wed,  6 Sep 2023 04:15:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2E510E030
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 04:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693973711; x=1725509711;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=g/ydrr8MY9A5Ig1NXWrQ5OW33kErdvJ213BD8HYJ7qo=;
 b=W5SDdtz8KD16KToxXxghDgPJyedZ6VnThTLG4YZdvWiV73DhzMdgf1We
 8Vmh+O8CABqcc3UrP720tj9cSYkQpHP2qdEDv6JKV9Ibmbjaq9pANBBr2
 6jEaTMBeTtZFYpGi+1qcTl6EF/1Ds1Z5rKpeI1a1lzLRQDHv2UEM+6gul
 22fAhOZQQmgA2lYlQEFKIJhKzUI5kW5a1kNy6+oh/QAfIBwAvynI23TAn
 dco4fNAEu0TGdslZr6+dKTHSU4QXJvZYb0E1mkpBz/yL3U8abK1vG4MaQ
 DamKpXMFhcjl3CwEqg2kTRXyPv3Jz4HEey1r3J1HWVzpBRfOoqLLdjxC1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="357276077"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
 d="scan'208,217";a="357276077"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 21:15:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="770608233"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
 d="scan'208,217";a="770608233"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2023 21:15:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 5 Sep 2023 21:15:09 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 5 Sep 2023 21:15:09 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 5 Sep 2023 21:15:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kY1ogLbDqXMBWB2mBXHnhMc0cyJm8rLzoV4Y6rLfbzwCS5kRXnBiwg7QRPuXj/ZzUC2VxUB1vopLl+xrfAvMZG3Lbp6XN7DE2koUeiwf0sAEzwz5QnOe/gdJf00iD9DC0J0Ms8esEI8UrcDVcVRIMDSCiMolfiPRFkT4EAwSCjgS+zTKS+oNvlXs4TP6KExW3nUTdZt9zYdQ6E6rufwjyD59y3bsE+sqdzh+WN0KuT7YiFLe6IJgZSfTipuTS0bTqvBIxfS3GG9a0oePUkPwCc7rBiyQ6dYpYUtyGHid8LMdwrFEoiAux5qep/6EYALQ0uS++aQGBDqjLupjT/nWOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RtTurq6Ry7trdr4iuRtOpjYG8Wr1iSzJ60zHk7kq5A8=;
 b=kpXmWmt7oLTycFIWwh24PKeYFdH7aAixcd5PuZKDLYCHnzDDt9JyNUD4tH16lndL6YTTGlz9vZYAfR9icY8xch+Z131xpCp+ZbFa5liEmrhpCPvmQzswKjMVUhmUVsGrMd0t6TZxVrjOfqZZHnXwwSyxCym/rHdD/YKn6a4dpCxPiqZTvw3XoaCUEiNdSHskM/YUFZULEbQalwMaqLUTq/yMcEMD1Kq/0CDspObqrnr0V+494M2WGEyEAWxlSozdiQCmv/LsYszOxGYkxN8Tf4MYLD/PtH3j48XsB6QoGBMmw2ViA5F925Pe+/3n87xvpVDPSEa2Ok7Z0c96iLAxiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ0PR11MB5616.namprd11.prod.outlook.com (2603:10b6:a03:3aa::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 04:15:02 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25%6]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 04:15:02 +0000
Content-Type: multipart/alternative;
 boundary="------------d06P1n7bLMBQ2uwTzOQGCowt"
Message-ID: <e49fc045-2a05-47f1-9278-7bc5a417cf9b@intel.com>
Date: Wed, 6 Sep 2023 09:44:46 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230831090536.2949934-1-tejas.upadhyay@intel.com>
 <20230831090536.2949934-2-tejas.upadhyay@intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230831090536.2949934-2-tejas.upadhyay@intel.com>
X-ClientProxiedBy: PN3PR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::17) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ0PR11MB5616:EE_
X-MS-Office365-Filtering-Correlation-Id: f6a31044-6ed5-440f-a034-08dbae8fd740
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EWWxXfCPJzPC80fkmgcY7wuIYo/3z1/tFLYT6fUFkqnowVcCVJPQyqM9u19LCP6ih4ijaTNumhTJhtZKZMKapkayuN4LjKUmUKRNR2GlJ+8vAqpcrhO4dF1prSChATL8gLwaeIdXDbc1jz9YVYtPg0fY14w7J0UuSoyqPzRqNEQEE0OjQw6K67zWp7MPjc3lk9wAViPGd1ZXiSWMJL2dTuRezM1wHneNvEGVU2Kf9ZELXAcM63jfh3OMI6/ss2oi/PXQZLNtwNeKktD5q5snU+wVFvbD+cOTBv8KUefV61K3ba5vOeayKOuGPzq5xWfBmZ++ssLZnm/HIpGe3JtCPPzaCFCEu+CmPRSlMhS05hRk2LnsMPvje3pjkMLOXY9ZnV/ZQXM+33jHJtXd8/MLwJitC0egLj1XTm10B4wJUQ9diYPZN6BvLdZuusllGJFVaXiuuVk7dKzIK4WReCWBAxen1ZKD8Q7ayobhqAWFn1DMLOMZ/BrF1cDDgMhiPGYd12hGR2hgSeF4r3F+X48Rzz2XuMcfCqj5sjBQKxOpOeBiqFAdkeY+F17bqgbBXfUyKKSdxE4lTP8L0neDUQS1eEtNAf/sOtKTDU5mKWo6O4wsWDCeM6kp/4pcG9iTVAF2MHhvUJkDXrdGRsHurcBXKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(366004)(136003)(346002)(396003)(1800799009)(186009)(451199024)(2906002)(30864003)(83380400001)(66946007)(6506007)(53546011)(33964004)(316002)(6486002)(66556008)(66476007)(5660300002)(478600001)(6666004)(107886003)(26005)(6512007)(4326008)(2616005)(8936002)(8676002)(41300700001)(36756003)(38100700002)(82960400001)(86362001)(31696002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkFxQUEyd3NUeUpkZU9WZVliOGtPRlA1N3NJQXFJS1RMTVJCTG5uaDN3ZXVt?=
 =?utf-8?B?cllCZldxdWNXV1M2OW9NejJhM2NIUENZU2RKSDBUTFV1d09nRDJkc1JCS1Bs?=
 =?utf-8?B?dFVrY24wT1VMUVdlR1NwbUFRbUhYekFFUmE2ejFMaTNUQUkwS1l5VCtUa0lz?=
 =?utf-8?B?TVZ1OXlicG9ML3NSQUp3RWZycTR1RmllTGNMUlNWbDNUYVFVcExIdWI1ZGFl?=
 =?utf-8?B?L2ZSUE9KdlZTNTJJWGNVdjJFZWRFRGxZellpenJrL3h3TXBaSjc3YXNUYUZU?=
 =?utf-8?B?bFRRajdRYnNDQ2t0T0lOTG9DS3NEcWRTNEk3R2E4YmRpL3hSc2dGdk96N3ZU?=
 =?utf-8?B?OW5YMWJUKzNySmtSeHhBWFFOM2plQUZZT1RmbUVGY3J6eVAyVVpxZmRmYStT?=
 =?utf-8?B?N1JYVUdkK1NuSVh1OGgvTFp2MHBQYmNCcC9GL0lTRk9NSlhuNEN2M2RHY3pZ?=
 =?utf-8?B?WTh5eUV4YVVRZUJUZVhyK2xEVXpnNnVzOFVDc1FQZzFxRDBxaU9yM3FITWdB?=
 =?utf-8?B?N3lObGV6MTNYUHhHcllUeHlrcWFublNwc1pUQ3UwQlFaZUkydk1ldTFRMG9W?=
 =?utf-8?B?cUtVSmRIKzZvcVhNK2V3ay9LeGtxSmVzai81eWl0dlB2U0wvUnhOb3BEaFlz?=
 =?utf-8?B?bCtFaHlEMW5nS09PZFdETTdibGFCKzRrTG92RUs5RHF6bUdOK3lqRC9qaG11?=
 =?utf-8?B?OS9oYzJMTFZHc2FHZmd0cmQybFJtWTVZSERQWElnWlhmZnJPSEJVQUlScnlh?=
 =?utf-8?B?TkNCU2Y0MmtCMXFGUTRxOHo0VkhjVS9TWVFXL2V5NGlaTy9zeXhJa2F5VDFx?=
 =?utf-8?B?K2dmRG51Mkpub1M3U0Q2U3ZiWUF3bU02NXF0ODRad1YxMkpjOFlSbUZoR2xW?=
 =?utf-8?B?TEo0bmRXUjRtTFZBWEIrSGVQK3pFRUE1blpuK1o5ZVpuR0RFOEN2TjU3enU2?=
 =?utf-8?B?VktIcGJkK1UzbkZDWUl2Vk9pR3Q5YlcxZXJLcks4UThwYUV3TEk1czgxZ0pv?=
 =?utf-8?B?OVFPbjd2ZmJjaFZJekhUcllSMk5Pb29pMXVyUi9tYW1hVGc5S2xtSGZFYkEw?=
 =?utf-8?B?aUZTUStEeGp1Y2gvUnV6eTZsVElybFJBM0RzSUx6czAwVU03bTkvY0JTZTkz?=
 =?utf-8?B?L0pyVldGbXpjdm9MZE12SENGWlZwWVBkVjl1dE5NYUo5Ry83Z0NzUzVPcUxI?=
 =?utf-8?B?bTFKMXAxd08wbDg2SVN6cUVRL2dadnBUTzhEMUdpTDRzNVJEZFQrWmRmZEMv?=
 =?utf-8?B?SGd5bzRnY25JV3B4QVBQUDB4OS90TWs1MU1DRitkYWxONHd0VWJtcUZwNWkr?=
 =?utf-8?B?QkdNKzN3c29LUU5sdzgyNnh0Y3RBb2Zsc3R1WUVYMFZBUU5kZmNSOWRvOFM2?=
 =?utf-8?B?TXlxY3lYTjUrNUlqZXJzSEJ4OGhOLzlwSXNhZ2Jhb3J6TDZacUtGMHNNN1FH?=
 =?utf-8?B?UUpkWjdyVTl6clZNK0xkVGl5VnRuemRaSGFhbnltMmRDai8rcUpESVdaMEVW?=
 =?utf-8?B?UHl6UFdycGFURHFDUE9TSFB6NFREckFOVzQybDNzMmkzdnRMV2poSHJEVHBH?=
 =?utf-8?B?aytQYitSQkM2NnhIL1VxT0lWU1VGemhQMWhzTG1VRFp5Z2VkbHJaTSthbjhx?=
 =?utf-8?B?T1NTYUtsMUlraVJIMHpzdVZtZ0w5QW1jUVJGR0JFeEh4V2VWeEkrbm9HVzJI?=
 =?utf-8?B?MkgvcE5QRkRyc1l4ajg3M3l5VFZEU0ZoYVUweUpCOFlRSEEvK2d3WmFLRGRh?=
 =?utf-8?B?WjM4VktGcFM5MnpWSTJHRzlFMUZFV0w2VnZIbDFIQXRpSHlpTlNlQU9KdEI0?=
 =?utf-8?B?cmRZRStqQysxbXJHNWN0dXpnK1RobTdNN3J4dldMVmkrdVk1TStscnBKbGxr?=
 =?utf-8?B?OVFWZ2hKeVMxUVNpUld0UzhOcXhJYjE2Wk9GZ0ZOWWFRZDNkR3pJM0lldlNI?=
 =?utf-8?B?SmNpZ3oyZGxzbEJGR3dFakdoOHRjZW1zVEdFMTFncEZPb0tGK1kyRHRWRmJJ?=
 =?utf-8?B?UXhMQ3FRc0YrcFlxaWVxM0VvcFpZQ21uZHB1blRaMWRLV2psemZVMlUrRTFP?=
 =?utf-8?B?OW4wV2ZyYWU2bUswbFJQdWZ2WUVMbEo4U0VtMkpMeitqaUJ4TGs2c0U4K3p3?=
 =?utf-8?B?NGVERm85ZmNQYUJPTHJTYzgvMWFaS1cvazZTY2I4cjFaY1U4TkI0b281Ungz?=
 =?utf-8?Q?0YZfJpJFK19CLaSgsd8/3XA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6a31044-6ed5-440f-a034-08dbae8fd740
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 04:15:02.1709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FZgIQmevZIsECf+EAiNgTGENCDg2VHU3tpTvrdk64YZQe2F8C33zYRxjhq/+1mvnrI4AIxmBO4xtBB0KM4ap837RO2tX+/3T7kr/Gf+Zdio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5616
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/7] drm/xe: Add drm-client infrastructure
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

--------------d06P1n7bLMBQ2uwTzOQGCowt
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Tejas,

On 31-08-2023 14:35, Tejas Upadhyay wrote:
> Add drm-client infrastructure to record stats of consumption
> done by individual drm client.
>
> Signed-off-by: Tejas Upadhyay<tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile          |  1 +
>   drivers/gpu/drm/xe/xe_device.c       | 15 +++++++-
>   drivers/gpu/drm/xe/xe_device_types.h |  6 ++++
>   drivers/gpu/drm/xe/xe_drm_client.c   | 52 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_drm_client.h   | 43 +++++++++++++++++++++++
>   5 files changed, 116 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_drm_client.c
>   create mode 100644 drivers/gpu/drm/xe/xe_drm_client.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 9d2311f8141f..f9c25cb2f890 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -51,6 +51,7 @@ xe-y += xe_bb.o \
>   	xe_device.o \
>   	xe_device_sysfs.o \
>   	xe_dma_buf.o \
> +	xe_drm_client.o \
>   	xe_exec.o \
>   	xe_execlist.o \
>   	xe_exec_queue.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 109aeb25d19c..cf59c7b74eaf 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -18,6 +18,7 @@
>   #include "xe_debugfs.h"
>   #include "xe_display.h"
>   #include "xe_dma_buf.h"
> +#include "xe_drm_client.h"
>   #include "xe_drv.h"
>   #include "xe_exec_queue.h"
>   #include "xe_exec.h"
> @@ -43,13 +44,24 @@ struct lockdep_map xe_device_mem_access_lockdep_map = {
>   
>   static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>   {
> +	struct xe_device *xe = to_xe_device(dev);

Don't see xe_device being used in this patch. Better to make this 
assignment in patch where the xe will be used to reference ttm 
device.[Patch 7]

> +	struct xe_drm_client *client;
>   	struct xe_file *xef;
> +	int ret = -ENOMEM;
>   
>   	xef = kzalloc(sizeof(*xef), GFP_KERNEL);
>   	if (!xef)
> -		return -ENOMEM;
> +		return ret;
> +
> +	client = xe_drm_client_alloc();
> +	if (!client) {
> +		kfree(xef);
> +		return ret;
> +	}
>   
>   	xef->drm = file;
> +	xef->client = client;
> +	xef->xe = xe;
>   
>   	mutex_init(&xef->vm.lock);
>   	xa_init_flags(&xef->vm.xa, XA_FLAGS_ALLOC1);
> @@ -89,6 +101,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>   	xa_destroy(&xef->vm.xa);
>   	mutex_destroy(&xef->vm.lock);
>   
> +	xe_drm_client_put(xef->client);
>   	kfree(xef);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 750e1f0d3339..d210a535c703 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -462,6 +462,9 @@ struct xe_device {
>    * struct xe_file - file handle for XE driver
>    */
>   struct xe_file {
> +	/** @xe: xe DEVICE **/
> +	struct xe_device *xe;
> +
same comment as above.
>   	/** @drm: base DRM file */
>   	struct drm_file *drm;
>   
> @@ -480,6 +483,9 @@ struct xe_file {
>   		/** @lock: protects file engine state */
>   		struct mutex lock;
>   	} exec_queue;
> +
> +	/** @client: drm client */
> +	struct xe_drm_client *client;
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> new file mode 100644
> index 000000000000..ea7993338076
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -0,0 +1,52 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <drm/drm_print.h>
> +#include <linux/kernel.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +
> +#include "xe_device_types.h"
> +#include "xe_drm_client.h"
> +
> +/**
> + * xe_drm_client_alloc() - Allocate drm client
> + * @void: No arg
> + *
> + * Allocate drm client struct to track client memory against
> + * same till client life. Call this API whenever new client
> + * has opened xe device.
> + *
> + * Return: pointer to client struct or NULL if cant allocate
> + */
> +struct xe_drm_client *xe_drm_client_alloc(void)
> +{
> +	struct xe_drm_client *client;
> +
> +	client = kzalloc(sizeof(*client), GFP_KERNEL);
> +	if (!client)
> +		return NULL;
> +
> +	kref_init(&client->kref);
> +
> +	return client;
> +}
> +
> +/**
> + * __xe_drm_client_free() - Free client struct
> + * @kref: The reference
> + *
> + * This frees client struct. Call this API when xe device is closed
> + * by drm client.
> + *
> + * Return: void
> + */
> +void __xe_drm_client_free(struct kref *kref)
> +{
> +	struct xe_drm_client *client =
> +		container_of(kref, typeof(*client), kref);
> +
> +	kfree(client);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.h b/drivers/gpu/drm/xe/xe_drm_client.h
> new file mode 100644
> index 000000000000..be097cdf5d12
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_drm_client.h
> @@ -0,0 +1,43 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_DRM_CLIENT_H_
> +#define _XE_DRM_CLIENT_H_
> +
> +#include <linux/kref.h>
> +#include <linux/list.h>
> +#include <linux/pid.h>
> +#include <linux/rcupdate.h>
> +#include <linux/sched.h>
> +#include <linux/spinlock.h>
> +
> +struct drm_file;
> +struct drm_printer;
> +
> +struct xe_drm_client {
> +	struct kref kref;
> +	unsigned int id;
> +};
> +
> +	static inline struct xe_drm_client *
> +xe_drm_client_get(struct xe_drm_client *client)
> +{
> +	kref_get(&client->kref);
> +	return client;
> +}
> +
> +void __xe_drm_client_free(struct kref *kref);
> +
> +static inline void xe_drm_client_put(struct xe_drm_client *client)
> +{
> +	kref_put(&client->kref, __xe_drm_client_free);
> +}
> +
> +struct xe_drm_client *xe_drm_client_alloc(void);
> +static inline struct xe_drm_client *
> +xe_drm_client_get(struct xe_drm_client *client);

kref_get/xe_drm_client_getcan be moved to the patch where we are 
introducing |xe_drm_client_add_bo |to maintain refcount.

BR

Himal

> +static inline void xe_drm_client_put(struct xe_drm_client *client);
> +
> +#endif
--------------d06P1n7bLMBQ2uwTzOQGCowt
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Tejas,<br>
    </p>
    <div class="moz-cite-prefix">On 31-08-2023 14:35, Tejas Upadhyay
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20230831090536.2949934-2-tejas.upadhyay@intel.com">
      <pre class="moz-quote-pre" wrap="">Add drm-client infrastructure to record stats of consumption
done by individual drm client.

Signed-off-by: Tejas Upadhyay <a class="moz-txt-link-rfc2396E" href="mailto:tejas.upadhyay@intel.com">&lt;tejas.upadhyay@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/xe_device.c       | 15 +++++++-
 drivers/gpu/drm/xe/xe_device_types.h |  6 ++++
 drivers/gpu/drm/xe/xe_drm_client.c   | 52 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_drm_client.h   | 43 +++++++++++++++++++++++
 5 files changed, 116 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_drm_client.c
 create mode 100644 drivers/gpu/drm/xe/xe_drm_client.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 9d2311f8141f..f9c25cb2f890 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -51,6 +51,7 @@ xe-y += xe_bb.o \
 	xe_device.o \
 	xe_device_sysfs.o \
 	xe_dma_buf.o \
+	xe_drm_client.o \
 	xe_exec.o \
 	xe_execlist.o \
 	xe_exec_queue.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 109aeb25d19c..cf59c7b74eaf 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -18,6 +18,7 @@
 #include &quot;xe_debugfs.h&quot;
 #include &quot;xe_display.h&quot;
 #include &quot;xe_dma_buf.h&quot;
+#include &quot;xe_drm_client.h&quot;
 #include &quot;xe_drv.h&quot;
 #include &quot;xe_exec_queue.h&quot;
 #include &quot;xe_exec.h&quot;
@@ -43,13 +44,24 @@ struct lockdep_map xe_device_mem_access_lockdep_map = {
 
 static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 {
+	struct xe_device *xe = to_xe_device(dev);</pre>
    </blockquote>
    <p>Don't see xe_device being used in this patch. Better to make this
      assignment in patch where the xe will be used to reference ttm
      device.[Patch 7]</p>
    <blockquote type="cite" cite="mid:20230831090536.2949934-2-tejas.upadhyay@intel.com">
      <pre class="moz-quote-pre" wrap="">
+	struct xe_drm_client *client;
 	struct xe_file *xef;
+	int ret = -ENOMEM;
 
 	xef = kzalloc(sizeof(*xef), GFP_KERNEL);
 	if (!xef)
-		return -ENOMEM;
+		return ret;
+
+	client = xe_drm_client_alloc();
+	if (!client) {
+		kfree(xef);
+		return ret;
+	}
 
 	xef-&gt;drm = file;
+	xef-&gt;client = client;
+	xef-&gt;xe = xe;
 
 	mutex_init(&amp;xef-&gt;vm.lock);
 	xa_init_flags(&amp;xef-&gt;vm.xa, XA_FLAGS_ALLOC1);
@@ -89,6 +101,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 	xa_destroy(&amp;xef-&gt;vm.xa);
 	mutex_destroy(&amp;xef-&gt;vm.lock);
 
+	xe_drm_client_put(xef-&gt;client);
 	kfree(xef);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 750e1f0d3339..d210a535c703 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -462,6 +462,9 @@ struct xe_device {
  * struct xe_file - file handle for XE driver
  */
 struct xe_file {
+	/** @xe: xe DEVICE **/
+	struct xe_device *xe;
+</pre>
    </blockquote>
    same comment as above.<br>
    <blockquote type="cite" cite="mid:20230831090536.2949934-2-tejas.upadhyay@intel.com">
      <pre class="moz-quote-pre" wrap="">
 	/** @drm: base DRM file */
 	struct drm_file *drm;
 
@@ -480,6 +483,9 @@ struct xe_file {
 		/** @lock: protects file engine state */
 		struct mutex lock;
 	} exec_queue;
+
+	/** @client: drm client */
+	struct xe_drm_client *client;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
new file mode 100644
index 000000000000..ea7993338076
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include &lt;drm/drm_print.h&gt;
+#include &lt;linux/kernel.h&gt;
+#include &lt;linux/slab.h&gt;
+#include &lt;linux/types.h&gt;
+
+#include &quot;xe_device_types.h&quot;
+#include &quot;xe_drm_client.h&quot;
+
+/**
+ * xe_drm_client_alloc() - Allocate drm client
+ * @void: No arg
+ *
+ * Allocate drm client struct to track client memory against
+ * same till client life. Call this API whenever new client
+ * has opened xe device.
+ *
+ * Return: pointer to client struct or NULL if cant allocate
+ */
+struct xe_drm_client *xe_drm_client_alloc(void)
+{
+	struct xe_drm_client *client;
+
+	client = kzalloc(sizeof(*client), GFP_KERNEL);
+	if (!client)
+		return NULL;
+
+	kref_init(&amp;client-&gt;kref);
+
+	return client;
+}
+
+/**
+ * __xe_drm_client_free() - Free client struct
+ * @kref: The reference
+ *
+ * This frees client struct. Call this API when xe device is closed
+ * by drm client.
+ *
+ * Return: void
+ */
+void __xe_drm_client_free(struct kref *kref)
+{
+	struct xe_drm_client *client =
+		container_of(kref, typeof(*client), kref);
+
+	kfree(client);
+}
diff --git a/drivers/gpu/drm/xe/xe_drm_client.h b/drivers/gpu/drm/xe/xe_drm_client.h
new file mode 100644
index 000000000000..be097cdf5d12
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_drm_client.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_DRM_CLIENT_H_
+#define _XE_DRM_CLIENT_H_
+
+#include &lt;linux/kref.h&gt;
+#include &lt;linux/list.h&gt;
+#include &lt;linux/pid.h&gt;
+#include &lt;linux/rcupdate.h&gt;
+#include &lt;linux/sched.h&gt;
+#include &lt;linux/spinlock.h&gt;
+
+struct drm_file;
+struct drm_printer;
+
+struct xe_drm_client {
+	struct kref kref;
+	unsigned int id;
+};
+
+	static inline struct xe_drm_client *
+xe_drm_client_get(struct xe_drm_client *client)
+{
+	kref_get(&amp;client-&gt;kref);
+	return client;
+}
+
+void __xe_drm_client_free(struct kref *kref);
+
+static inline void xe_drm_client_put(struct xe_drm_client *client)
+{
+	kref_put(&amp;client-&gt;kref, __xe_drm_client_free);
+}
+
+struct xe_drm_client *xe_drm_client_alloc(void);
+static inline struct xe_drm_client *
+xe_drm_client_get(struct xe_drm_client *client);</pre>
    </blockquote>
    <p>kref_get/<span style="white-space: pre-wrap">xe_drm_client_get<span style="white-space: normal"></span></span> can be moved to the
      patch where we are introducing <code style="padding: 0px; tab-size: 8; white-space: pre-wrap;" class="hljs diff language-diff"><span class="hljs-addition">xe_drm_client_add_bo </span></code>to
      maintain refcount. <br>
    </p>
    <p>BR</p>
    <p>Himal <br>
    </p>
    <blockquote type="cite" cite="mid:20230831090536.2949934-2-tejas.upadhyay@intel.com">
      <pre class="moz-quote-pre" wrap="">
+static inline void xe_drm_client_put(struct xe_drm_client *client);
+
+#endif
</pre>
    </blockquote>
  </body>
</html>

--------------d06P1n7bLMBQ2uwTzOQGCowt--
