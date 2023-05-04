Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BD1C77B78
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 12:30:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D14F10E3B6;
	Thu,  4 May 2023 12:30:57 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ADEC10E3BB
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 12:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683203454; x=1714739454;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=673P6n8qGM9lNMHfniQc+odCOWEHDck1rSucGqN9xl4=;
 b=MG4DkiWWJcv5O32AMtobx61LZw5xKBVJzp1sHr5wp/u9yzDgs2i2XKrZ
 UPDvGFiKn3RT8GsZDoU54WgeOO38dVjp4bSlTx2h2DvqioV8n0Wlj8eX0
 uZ+aW57MXXQhi93vs3yHLO0XOH2UZXfmtxXXYY1zRB8W+CSHt/BqpjZn7
 aYhPkMYWbRR/Rc0tI6Sb5kKGYFtTGdUZ2Q1k6e6IXyJactb2qDbcgJxpk
 CoLufgRlhMRZNrixSQkxHYO8YA3nodAxATiEMwyFp5m2Z/OUEwd/iLYXE
 p/80Sa5J834UOe2MhVSeljpTf2k0swtHVr4BlBQxqzNM3HIhbTg1wsXJ0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="333295649"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="333295649"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 05:30:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="808692664"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="808692664"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP; 04 May 2023 05:30:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 05:30:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 05:30:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 4 May 2023 05:30:53 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 4 May 2023 05:30:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cmGYrTVQ26uRxCjfCyc9V/Ys0FqBaeFbaPK4MQnupKTNElaczv/5YvQ1INZsYpPAealeeJRiM+ZmfrDmwUlwsWsQbQuweaGmHrFrNxMpsK0xT3n/CmF3gUCvEl2IVoq0yL5GUsoWtGDf6weu1aMwfKuS7e6Lv+Ap8wAb8ZiqLUKPHtmudy0/FBD1MKrpIJ8+fFJhJCBD/RYh/AUDQytzMa8vQOPpait7Juse8FGq/nC6mPeE9n3m2a3L13lmBvc5TTrrKHn2rQEE1nu2Ff1tWNa+izy90bo0VOCbM3b5KA6/XChqw3ft2NabrpAuj6t9Nkl9bXESwj+ci16Wa6fMjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJPEeiAPwtKd2VFw72hXpml5qdGvYvaLQiNdeJ7CeJM=;
 b=g3W5QDZ4PUJaiZXKV1T2iMrrK+IkXg5IvWZ5OkB9yniLp08XEJHpJxYIGnN544LFiqeJZhEw2C6MFM97ftz2uxjJvzGpq6RfmnLvdn/7BJkGr309faBFYkkm1y0IcuacOBZC4VJFIU3xH3Z0mWBAOmya/Qc8WF1OhZYnEVwBvnkcCmBKUxtR7RjzP25u44fzh2eXJ6eu4yNXPzR2dHNYNn4F9HkCYmSj93gZSvODUAEhd2pCIYTNyc8hoRw0vmah6jetsGQXH6EA5rEsDyeblCIIij4J9iGaBMo622mcXKquyM0LY0qSKrzFB1BvCEnmULTamBHqz88OfyWgwwI2EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SA1PR11MB7132.namprd11.prod.outlook.com (2603:10b6:806:29e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 12:30:48 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::2e91:4229:bc5c:cb31]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::2e91:4229:bc5c:cb31%3]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 12:30:48 +0000
Message-ID: <150b5a97-2774-4bf7-2a12-b0577dec05dc@intel.com>
Date: Thu, 4 May 2023 18:00:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230503064252.830641-1-riana.tauro@intel.com>
 <20230503064252.830641-2-riana.tauro@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20230503064252.830641-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0189.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::11) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SA1PR11MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: 94dc1b6b-72dc-485a-6598-08db4c9b6411
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SEho1G8U4oktnwkCl0qluhpxg059JMKKHvMstbUyCoYriGWjdWv1RjvLoRBOtuOe2pSRhgWUE/vIXPAxHQk4xIC72BHgFKpJ/5tJ3ZlAEP4uBlaAHOmL+CLhQEKOsGfFd2h39A3ew4KpvbgyEJoG0qXpwSJc+FtFpr0xk5NKEpxcAUjaGeLBKoLHQvCi8LfAZix+QYlHutvB1SK/WaBvO5IFLdOqKpoSHeNz8mtOPv6O5xHC4RDKrhmhcgnDGWuntElHL8sXgzbasvusxh4f9V/bg/tuvb1x8DP+J83vWRZTxvtGKTCBO3Pw9zkdollPfsDqbkRHiuA9IfjNJIHnWmtUaKbZIQiu3HIi9ZAL1YINDa+bAm2UIc+bztrgcn+P+XO3TLAnNuKw1yCk+eq1JxQRavuHvl7dsbeTDuZRKDDNzLSY7WaWR9BofXc4DLFmk9LIrr+tQRoSmx7XVr1Ydm9c8P6GGn2w4fforGcLLugBKU9RKt4wUy1QehcxFi+xSg4lQHw67INEi51YjTJbUBVb/9uNiekAkl+XSDjcQJJmSWZFQM75H7mYBzvzjtS4p1Src5HviB+BLA7oQkT+Vqb6egcBFIM3u5cGLmo4mCPBWPab/R3/QyFo6YdAkzMaw5cMV9IciBNmfZEY7N9keAmZwv59JxDyoYm6E/boSC0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(136003)(346002)(39860400002)(396003)(451199021)(5660300002)(8936002)(6486002)(86362001)(6666004)(36756003)(31696002)(316002)(41300700001)(66476007)(4326008)(66556008)(66946007)(82960400001)(8676002)(478600001)(38100700002)(53546011)(31686004)(2906002)(6512007)(2616005)(6506007)(26005)(107886003)(83380400001)(186003)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXRWVG9VZy9paEpPek4zbWNGMlgvT2tuUk9yT1VhTUE5MndRdXZjSTdsMzdq?=
 =?utf-8?B?WmovNXhqdnl3OEVtYVZwVDVZRTlLQ0k3M0hicWdDdmtlTi9CcHBaM3puNE5n?=
 =?utf-8?B?anhjMTE2cC9Wdk1BeGNOeU9zT0p5RVBaK2J6aUVyMHVHTS94akpIWGRNRndB?=
 =?utf-8?B?VGVYWmgvb09XMmpOWllQbmtzbk5oZXFFVlJuSUp3N0s0bVcxeDV6NHRWWXR0?=
 =?utf-8?B?L1JNbnpOblYvZkV3K3BiUmdHTlpoRGtwdEJpaEtXRjRyT1E5Y0NNQmp3NGJP?=
 =?utf-8?B?bytrNGMxNzhaZlFCY1VTYW91VDZtaDV4NXFsWElKUEtBVUxIcEszY1VONHU3?=
 =?utf-8?B?T25TVzEwbTNUYVNBajVMZGd2TzIvazJwMjI1SGVyWEVTSllrclUxQWg0S1U5?=
 =?utf-8?B?Ulg0aW1pRHN1aVB2WEFXYWlBV1B5TFpJanRCSjZrcW5ucEIxS1ZKSUYzWkY1?=
 =?utf-8?B?RnNFWjlkRkFYWjBmWUkwaStjSUFKOHFTNkdxOWZXM1dlYndMVjNwSlVFbXVN?=
 =?utf-8?B?SmVZV25XZExVTDJzMU5OWnJ5RWZLd0ZpOEpCQ3RTQzBMSVhGU3h1OWQ4SFVR?=
 =?utf-8?B?YzN6NlBVMG1sVFplaHltVGJ4c2t5UzJwaEs4N2VJZjNPaGtWWEdMWVFMWUMx?=
 =?utf-8?B?d2tGblJ2eC9nOXpzdGdxenVsMjE5Q2R0Y1RyNEw2NkdKQkMwS2pQS2VtOVpi?=
 =?utf-8?B?WjFGa0syNUlJeEY1V3JVMWJvY01oV0k3aTY4MFlkZ1QzNjJBK1BpOGx0RmV1?=
 =?utf-8?B?WmNIVUpQN2E3VGlLZXIwcHZqdVpnMGRJOStaSmFST0RFdEVBU1dRQ09DZkdM?=
 =?utf-8?B?cktocXhQYmVaVS96WkxxUEZwMzA3NTF3L0krMmthMTFuZTZ6a1lqc1Q3ZGtv?=
 =?utf-8?B?Q2xDSUx5QkJ2aUtYZW55bGNkQ0RicGNONkNHZVVRNDA3ZHRHNmx0QjU1eVV2?=
 =?utf-8?B?eGlCWXBLN2p0YkhNV2UvSm1vZlhBQ3RBTS9mbjdmTnQrcHpMSitwWk9jN01H?=
 =?utf-8?B?NjFRU0pjTjJXYW5oek4zbjNJWVNoa1Q3MFA3M3VoSmFvT2h5K2dIM3UrOXBr?=
 =?utf-8?B?cUl6UmxTb3I1QWpFVVNQZW82dEFmZ0lpV0lNQWNFOVNGOXVMWVBHSHVJRFlV?=
 =?utf-8?B?MmdYTUlXblJrN1ZjdnRucWZQeHQ0WGNPcE9zSVdTQXZJRlZZZ1BadnVsa0pu?=
 =?utf-8?B?ai9TbzI5VWo2OTJWV2J5aXgzNWRtS0daUWRqaFpSbW1lazFQWDBTOTBkU2R4?=
 =?utf-8?B?ODhLdU9qTlZHdk1tdld3ajFUb2d1ZlJ6TFpBRDdKQ1B3Rzl5eFc2d1VuQS9t?=
 =?utf-8?B?ckM2bUVOdFp5QWNUMk9tYjRIa3puY1puaEIxYnc5WXVDbkdSeWhxcmZmZE85?=
 =?utf-8?B?ZnZObVh0dDE5MmI4T1RYR2t1bFBzOER2KytlRmQ3UzI4K2E4SnVVUmdHZmhC?=
 =?utf-8?B?UkVFU3BKWmRIYTZabDVRMUFod2J6cUhqVkRnN1Y3QTdHRlJ4ZThXV0N4bXlj?=
 =?utf-8?B?S1lhUmdCdWdwcUZMWThnSlJzV1FJUkhieGJ6aHo1WlBJSnJnVlVYMVZFQmZI?=
 =?utf-8?B?c1MyNnViaGdFOVZTcW11NDZ3SXA0NmFKbTdobkFBcHVGa3QvcHJVdGt0QVg4?=
 =?utf-8?B?OFF6ZHRlVGE5NWN0WU9lb3ZGTENuQ1pMbzhxNWVVZG9HdkJhNUtqZ0ZlV1l1?=
 =?utf-8?B?M2EwZzRJS0pFYW00dEc0eHJzVnE0dGVaNWEwcm51SGljMm9CaHdxTkZXME4r?=
 =?utf-8?B?SEdBVWlOSjNUMGZ2TXIxa3hEOGtjTEpLL3FOeVJmbkRPSWpmbzdNVDkzZmJt?=
 =?utf-8?B?a1kxeVVxWU91ZW9NVHZuekg1V3BteW5ydTQrYzJObDFsZTRXNFNMZmw2TktD?=
 =?utf-8?B?T3o1QVV6UXJienJ1QXdBY0F6M01lSjhwbUJMOGZmUDNDR2hDSm53WFEzcUdJ?=
 =?utf-8?B?MllFY0JGNUk0cEdPY0s1cTZ0cG85bGpvMDhmSzVGVTZremY3NkNydS85ZEZj?=
 =?utf-8?B?RlhMRWprdCtYZzRDQzJKOWU0WHJXVXhrbE1JNzRXWUVhTTlWS2JIWnBoOGNn?=
 =?utf-8?B?Nk5XWmhYZ1lZNUl6eFBVVVR6Z3F5S1NQYzhZWlk0N21ZRHVZM3k1bFB1ZlhP?=
 =?utf-8?B?UnlJVzh4TG0wRXRSb05xOEN5a2Rzb2t1QkorN3FoY25ONFZ0UGFmOVJqSElJ?=
 =?utf-8?B?R1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94dc1b6b-72dc-485a-6598-08db4c9b6411
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 12:30:48.7509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vYT7v2KgCRjgY0ysZ8Ge9HfqDv8xQ33riSSXAw2KfcIK+mmvlYV/apf80GjE83o617qYRYTIEqf+pMSd5oZuog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7132
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH 1/3] drm/xe: add a new sysfs directory
 for gpu idle properties
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
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Riana,

On 03-05-2023 12:12, Riana Tauro wrote:
> Add a new sysfs directory under devices/gt#/ called gpu_idle
> to contain idle properties of GT such as rc_status, rc6_residency.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile        |   1 +
>   drivers/gpu/drm/xe/xe_gt.c         |   5 +
>   drivers/gpu/drm/xe/xe_gt_types.h   |   4 +
>   drivers/gpu/drm/xe/xe_idle.c       | 151 +++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_idle.h       |  13 +++
>   drivers/gpu/drm/xe/xe_idle_types.h |  32 ++++++
>   6 files changed, 206 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_idle.c
>   create mode 100644 drivers/gpu/drm/xe/xe_idle.h
>   create mode 100644 drivers/gpu/drm/xe/xe_idle_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index ee4a95beec20..5d1b837ad001 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -61,6 +61,7 @@ xe-y += xe_bb.o \
>   	xe_hw_fence.o \
>   	xe_huc.o \
>   	xe_huc_debugfs.o \
> +	xe_idle.o \
>   	xe_irq.o \
>   	xe_lrc.o \
>   	xe_migrate.o \
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 4186f7f0d42f..be802e6a0054 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -25,6 +25,7 @@
>   #include "xe_gt_topology.h"
>   #include "xe_guc_engine_types.h"
>   #include "xe_hw_fence.h"
> +#include "xe_idle.h"
>   #include "xe_irq.h"
>   #include "xe_lrc.h"
>   #include "xe_map.h"
> @@ -381,6 +382,10 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>   	if (err)
>   		goto err_force_wake;
>   
> +	err = xe_idle_init(&gt->idle);
> +	if (err)
> +		goto err_force_wake;
> +
>   	/* XXX: Fake that we pull the engine mask from hwconfig blob */
>   	gt->info.engine_mask = gt->info.__engine_mask;
>   
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 7c47d67aa8be..1f2a55026c0c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -9,6 +9,7 @@
>   #include "xe_force_wake_types.h"
>   #include "xe_hw_engine_types.h"
>   #include "xe_hw_fence_types.h"
> +#include "xe_idle_types.h"
>   #include "xe_reg_sr_types.h"
>   #include "xe_sa_types.h"
>   #include "xe_uc_types.h"
> @@ -287,6 +288,9 @@ struct xe_gt {
>   	/** @uc: micro controllers on the GT */
>   	struct xe_uc uc;
>   
> +	/** @idle: render c state properties of GT */
> +	struct xe_idle idle;
> +
>   	/** @engine_ops: submission backend engine operations */
>   	const struct xe_engine_ops *engine_ops;
>   
> diff --git a/drivers/gpu/drm/xe/xe_idle.c b/drivers/gpu/drm/xe/xe_idle.c
> new file mode 100644
> index 000000000000..231bdb45a6b7
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_idle.c
> @@ -0,0 +1,151 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +#include "regs/xe_gt_regs.h"
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_idle.h"
> +#include "xe_mmio.h"
> +
> +/*
> + * Render-C States:
> + * ================
> + *
> + * Render-C states is also a GuC PC feature that is now enabled in Xe for
> + * all platforms.
> + *
> + * RC6 : RC6 is a special power stage which allows the GPU to enter a very
> + * low-voltage mode when idle. This stage is entered automatically when the GPU is idle
> + * when RC6 support is enabled, and as soon as new workload arises
> + * GPU wakes up automatically as well.
> + *
> + * Xe provides a sysfs API for Render-C States:
> + *
> + * device/gt#/gpu_idle/rc* *read-only* files:
> + * - rc_status: Provide the actual immediate status of Render-C: (rc0 or rc6)
> + * - rc6_residency: Provide the rc6_residency in units of 1.28 uSec
> + *		    Prone to overflows.
> + */
> +
> +static struct xe_gt *idle_to_gt(struct xe_idle *idle)
> +{
> +	return container_of(idle, struct xe_gt, idle);
> +}
> +
> +static struct xe_idle *kobj_to_idle(struct kobject *kobj)
> +{
> +	return container_of(kobj, struct kobj_idle, base)->idle;
> +}
> +
> +static void xe_idle_kobj_release(struct kobject *kobj)
> +{
> +	kfree(kobj);
> +}
> +
> +static struct kobj_type xe_idle_kobj_type = {
> +	.release = xe_idle_kobj_release,
> +	.sysfs_ops = &kobj_sysfs_ops,
> +};
> +
> +static ssize_t
> +rc_status_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_idle *idle = kobj_to_idle(kobj);
> +	struct xe_gt *gt = idle_to_gt(idle);
> +	u32 reg;
> +
> +	xe_device_mem_access_get(gt_to_xe(gt));
> +	reg = xe_mmio_read32(gt, GEN6_GT_CORE_STATUS.reg);
> +	xe_device_mem_access_put(gt_to_xe(gt));This can be abstracted by adding variable xe_reg to xe_idle structure, 
to hold GT_CORE_STATUS reg, which can be initialized xe_idle_init 
function. > +
> +	switch (REG_FIELD_GET(RCN_MASK, reg)) {
> +	case GT_RC6:
> +		return sysfs_emit(buf, "rc6\n");
> +	case GT_RC0:
> +		return sysfs_emit(buf, "rc0\n");
> +	default:
> +		return -ENOENT;
> +	}
> +}
> +
> +static const struct kobj_attribute rc_status =
> +__ATTR(rc_status, 0444, rc_status_show, NULL);
> +
> +static ssize_t
> +rc6_residency_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_idle *idle = kobj_to_idle(kobj);
> +	struct xe_gt *gt = idle_to_gt(idle);
> +	u32 reg;
> +	ssize_t ret;
> +
> +	xe_device_mem_access_get(gt_to_xe(gt));
> +	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (ret)
> +		goto out;
> +
> +	reg = xe_mmio_read32(gt, GEN6_GT_GFX_RC6.reg);
As mentioned in other patch this register does not fall under any of the 
forcewake domain so forcewake can be avoided here.
Abstraction is applicable here has well.
> +	ret = sysfs_emit(buf, "%u\n", reg);
> +
> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +out:
> +	xe_device_mem_access_put(gt_to_xe(gt));
> +	return ret;
> +}
> +
> +static const struct kobj_attribute rc6_residency =
> +__ATTR(rc6_residency, 0444, rc6_residency_show, NULL);
Good to use __ATTR_RO or DEV_ATTR_RO here.

Regards,
Badal
> +
> +static const struct attribute *idle_attrs[] = {
> +	&rc_status.attr,
> +	&rc6_residency.attr,
> +	NULL,
> +};
> +
> +static void idle_fini(struct drm_device *drm, void *arg)
> +{
> +	struct kobj_idle *kobj_idle = arg;
> +
> +	sysfs_remove_files(&kobj_idle->base, idle_attrs);
> +	kobject_put(&kobj_idle->base);
> +}
> +
> +int xe_idle_init(struct xe_idle *idle)
> +{
> +	struct xe_gt *gt = idle_to_gt(idle);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct kobj_idle *kobj_idle;
> +	int err;
> +
> +	kobj_idle = kzalloc(sizeof(*kobj_idle), GFP_KERNEL);
> +
> +	if (!kobj_idle)
> +		return -ENOMEM;
> +
> +	err = kobject_init_and_add(&kobj_idle->base, &xe_idle_kobj_type, gt->sysfs, "gpu_idle");
> +	if (err)
> +		goto exit_kobj;
> +
> +	kobj_idle->idle = idle;
> +
> +	err = sysfs_create_files(&kobj_idle->base, idle_attrs);
> +	if (err)
> +		goto exit_kobj;
> +
> +	err = drmm_add_action_or_reset(&xe->drm, idle_fini, kobj_idle);
> +	if (err)
> +		goto exit;
> +
> +	return 0;
> +
> +exit:
> +	sysfs_remove_files(&kobj_idle->base, idle_attrs);
> +
> +exit_kobj:
> +	kobject_put(&kobj_idle->base);
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_idle.h b/drivers/gpu/drm/xe/xe_idle.h
> new file mode 100644
> index 000000000000..77928a31cecd
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_idle.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_IDLE_H_
> +#define _XE_IDLE_H_
> +
> +#include "xe_idle_types.h"
> +
> +int xe_idle_init(struct xe_idle *idle);
> +
> +#endif /* _XE_IDLE_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_idle_types.h b/drivers/gpu/drm/xe/xe_idle_types.h
> new file mode 100644
> index 000000000000..94377610c56c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_idle_types.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_IDLE_TYPES_H_
> +#define _XE_IDLE_TYPES_H_
> +
> +#include <linux/kobject.h>
> +#include <linux/types.h>
> +
> +/**
> + * struct xe_idle - A struct that contains gpu idle properties
> + */
> +struct xe_idle {
> +	/** @prev_rc6_residency: previous rc6 residency counter */
> +	u64 prev_rc6_residency;
> +	/** @cur_rc6_residency: raw driver copy of rc6 residency */
> +	u64 cur_rc6_residency;
> +};
> +
> +/**
> + * struct kobj_idle - A kobject struct that connects the kobject and xe_idle
> + */
> +struct kobj_idle {
> +	/** @base: The actual kobject */
> +	struct kobject base;
> +	/** @idle: A pointer to the struct xe_idle itself */
> +	struct xe_idle *idle;
> +};
> +#endif /* _XE_IDLE_TYPES_H_ */
> +
