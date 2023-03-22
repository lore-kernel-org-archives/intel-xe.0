Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62598C6FD1C
	for <intel-xe@archiver.kernel.org>; Wed, 22 Mar 2023 13:07:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2656F10E943;
	Wed, 22 Mar 2023 13:07:25 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81DDF10E943
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Mar 2023 13:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679490443; x=1711026443;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=7DNLfwT66B3eVXHjk5G2xFUUTXzv1po733sy1bT5uA4=;
 b=fT6ZF8yblaELJr107yz5PiRf5lsID4bhn1K0UbB6eeb0kZh5FICaeH//
 lqD1O945Vu+b0c0Bv/sGf3ItJF6Dqqb2zye/cMbszS+w8SyAW7Yet0pVK
 /O2yjHYlM0vjSgGHlxaYA+YKxR6AF4mVS0DZCKCnp3O1InGL5Cc8s3YBP
 lKzRm4oapvI57NmLpO/bZrS5M2xUOwt6tgta6zWirQ4xJ+BQ4gbIUFOKP
 QY93U+GsRyjQUcELhlDWRyM4WCFO6TTyKY+neZx+fn/+J/nzCLkL3w01Y
 VJ7bQuMyResvHdlj30Wht3sZLD0JXRRCFV65iK6gkVl5ClXNeADXxWeWx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="318850963"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="318850963"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 06:07:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="792553010"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="792553010"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 22 Mar 2023 06:07:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 06:07:22 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 06:07:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 22 Mar 2023 06:07:22 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 22 Mar 2023 06:07:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RkCfFyFdVjRbzkBrHAJ8wlfHCSsaM+ABaAAj5AakV86jU4qhfRmRet7vCdG7Ekb9MJI+ZAQYrwY0z7rn0wvIsrUc80X6bVycuhxK96xvctTGloaHS04HODIwxlzBxBrRccmAZIFgAhxY1XQUO0YrPEOzUYm1iCt9vXNLRvmISiB8v+/aCCRUJsZ1fdl+QBEwZNy28Gv2+FvT1+/VkboCC+m1ePTJ+tDjdZdOlQi7Y6u+Pc8hQ6/AddSvDNJwd9KgcmkOHWVmCDCqSjOa/fy8eFVJARdgaKPLReXoqgSrrWm9y8TdzAZ3yIB0H/dasPB3vpKXArkkTXpRmhlysq+BiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wFuy8tRlcnv0KP+NGqHWGaTibCde13KLIj4p4JoxpVk=;
 b=GnyXIKwBZgfbFilwjkIlT7GZmKKutHnydZUopslf9DVwKoqH+ilLePR84TNZQ8sCUX86RPZmbnur3knTYDWd2tGsFeKa+zGvoaB+jB3qboMBmWy2bm1vI3cHkX+eJKRM5gEXoo1gj+3PO6Z3m/pdN57h7eggrg/jlIjTcipz11kPTKIrzQ6p6E2L6QrIwzm4A/YPkQoABCtvCwLhg+wBpil4+5D3gGxUiWZVFf+u66pPgHk6HPFk2CVuZtx3TlW2fjQnLmFZPnpEI277X+fsLL7/6yT+twsa7/20btgApFqGa+4WWb0/t0PIb/KDmO5VM1V+xcgA4pb9WlAYAf1OSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7539.namprd11.prod.outlook.com (2603:10b6:806:343::6)
 by SA2PR11MB4826.namprd11.prod.outlook.com (2603:10b6:806:11c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 13:07:20 +0000
Received: from SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::d94d:4bb6:a568:a2bc]) by SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::d94d:4bb6:a568:a2bc%4]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 13:07:20 +0000
Message-ID: <0fa3fc5c-1d5a-b313-75e0-018ae34d5999@intel.com>
Date: Wed, 22 Mar 2023 15:05:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230322103545.272048-1-matthew.auld@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20230322103545.272048-1-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::14) To SN7PR11MB7539.namprd11.prod.outlook.com
 (2603:10b6:806:343::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7539:EE_|SA2PR11MB4826:EE_
X-MS-Office365-Filtering-Correlation-Id: b50201ec-68f5-4018-4640-08db2ad65e4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9WjLjgc3iI4ovqHmMf/bV4VFPd7cvDTuGMuUUXc7oUwM3XKgkubS12bSSTdJ/MUNYNnClTotjiNxd6LudzgPscQEVXhlQ1hOePHYjDMvB+12joM987KJvdvEBZ6OSlvi9hDQDQjLHz6ZHHS4yG3PJc9dYEDz/WWof83fhDsCh5Qp6YNk/ce0t5SDj8/maPkqtSm0hGm7A91/STvQXkRPuWExBAy32i5JfkAyM9OlwCHpocxnJSNTLYRPAWICsnnWuK1OJRjdqWIfd4+Qqn0g3iEPaJDQGUpVhGXrchfduc99t73ivXr91JcKdAHpP9vLM09Aomi9XurPmZUraKpvwx1x0pVESIU0tIG6jczT25tZf7G6C5yMFgjSGynXcIF+lCp/0KhWLjVSTd4wPCik3cBlX11GK+JEctMczHPDYNRx5bW4+YE9f1u6EjpRuiig3zu7JmytI568CTnprQ+h0aPC0cnfthRPB8EIyK/OzxD63jBXhKGJQz4Yobvo5JfqKODXjDPqR+5HxLIGsJ0VXkf1iJ/kPeMGUnwvetW8KoqDg/Pdk2xFwkdwOGioIKVoQPYwh9GVA+BKeLLsRDXWi47H4Y0ZnXRZTVL7k2s7C/1cBUbpC/zFrg6ZnT9jgH1FYutZUyGr5z7FKgtHbTckQ/g3eVUHajAbuvIWQ0naLsPXud7wFUtx6bVBmQOFiVkmDGAUm7y8yDKHM6caJjLYGYIzY0cKZI685PUWft+YJafUbbrCf62xH8u2HcNHwQ+3e76vygk5itppwHHkj5J8bLvpke/nu2J3BQcETEhLsLM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7539.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199018)(66946007)(41300700001)(38100700002)(8676002)(66556008)(66476007)(82960400001)(36756003)(2906002)(8936002)(6506007)(6512007)(53546011)(6666004)(6486002)(31686004)(186003)(2616005)(26005)(86362001)(5660300002)(83380400001)(316002)(31696002)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nm5UbGc2dWJ5dmdQOUNoV1k4OC9tQmd5V1E4UytZalBCdEV1UXcxWi9Eb3pa?=
 =?utf-8?B?dTdxaUtMUVNGYkVJWkI1M1c1M2R4Ny9TNjZxenlnWGx4V09pR0NaYlQvTk41?=
 =?utf-8?B?ajNwMXA1VmJjVEphVDlDODZYWk5QYlJVY3JueUorQUgzL1FvLy9obTNIOVI2?=
 =?utf-8?B?bmRDTUwyYThTaEFLM2gyZloxRjRNRUJaSE05TTMveTJKTE5nbWw3MElsOVZY?=
 =?utf-8?B?U2lic3Z2eXRuSSt1SlJMeWlSeXNnbDRrVTc3UTdRWWNGenZ2U1V2a2xOa054?=
 =?utf-8?B?QlF1S2lpc1dPUjhDSmZ6aUNkRUduRnRabGtwa1hDczMrRGZadisyNXZqWUpH?=
 =?utf-8?B?RHJxV2VLdnJrS2xLM1JqVlNRajA5b2p4SUtGTUE5eWhWWDk2WGxJL0FHa3VH?=
 =?utf-8?B?d3I3UytoYWQxNTNScjY5dVdKZ1B6MXQvSGI3SVlxSTFDM3VEVitDQWd4OGEy?=
 =?utf-8?B?MlJvcnlreGlLT0ZMN2tjK2hVaEFSVlh3cWdrbUlQazljMC9maXpvVW0rd3RK?=
 =?utf-8?B?cWQ0ZWhZck1uYi80anNiWlcrYzRXa3VDbThjTHJnN09iMTFEa2lUclRLRnJs?=
 =?utf-8?B?NDNmS2xNeDdJU0lQaWxUYUF5Q1VZVUd4R1JRZEJMMXJ5b3hTUUpuOVhOZjlI?=
 =?utf-8?B?RCtqN0dHTXlVdE1xenJBS2c5aDBjUGtRSy80aFprcitxSWE1NDlEM1JLd2hn?=
 =?utf-8?B?MytEODJ4Nlp6SWdpWlJ3b2t0UE1wTFRiUHY5K0IrNm5uRk1iR1pXbnJrMHYr?=
 =?utf-8?B?SGFLR2tHVGlZSU9uYUF1d0g2ZU5ERk91OEpaV0haTTBOTGxGLzh6T000MXhL?=
 =?utf-8?B?SnpqVFMvcFNxeVpham8xRmlZWVZaSEFRSmNOL0JKVk1zekdIazhuQkVRNlRK?=
 =?utf-8?B?WVZzT0UvRExNcXlOVTk0SEVHaTNFNlNHbjRnQzEyZ3RMTUZGSTlIN2pJY25p?=
 =?utf-8?B?QkZ6RXUraGdvUnhTNjd4K2JueldlZjJpVEVaanJHRGZrek9PU055VVN2VDAw?=
 =?utf-8?B?YTFGMS9PWjlieFBPd3lUclZ5SWNWaXVTTURrQVhYWjVDZEdkNHd2cDB2a3hv?=
 =?utf-8?B?MER3Rk9ZVzkzT2lZK3NiT2NZMFBLSHpsRUo2SHZyV1Y0WXV6RlRFaStoeUs1?=
 =?utf-8?B?VjlYV2ZMVWxFamErbVRCU2xlb1ovcmtXc05iaGFsTm1jRXEvOERCYlVXeUNp?=
 =?utf-8?B?WjRvUVF5ekdaengyVGU1OEU3cHFZMVRNc0QzR3EwUUJKYUZpSGtTdm1GRXRV?=
 =?utf-8?B?L3ZlQlErU2NXQzhZNjF5ZG1yRXdLU3pkTW5YRlIrZk1wNHJNc09nVE94eU1C?=
 =?utf-8?B?aGN0R0hFUjNOK1BEYXJub2JETkFJVXp0aVk1UndYOHFyOTZDb056b0hFVnV5?=
 =?utf-8?B?eHJZQXUvMXV2dHhKN0IvalBHZmdNMHZJbkVybFVkSUdWMDNxR2ZsTUY5UFJH?=
 =?utf-8?B?RzBYS0VOdnUySWpSRmozV1FPU25xUGZkY0toSXcxOTBNOEZheWE3K3gzTlNY?=
 =?utf-8?B?M3JhcHlwWmdhS2ZRZTM4MFlwWm4reUdJR2xRWUhsTEVNVEQ3NnY0RUU3NE1B?=
 =?utf-8?B?L0ZSdDRWdUVoWHB4NFI3N3FWamFDUzNHQm1Ud1hXanRpTk90NlBSR1k5OFA0?=
 =?utf-8?B?QWZjeGkrWUQ3Mno5MzdVOVhzNFdKbHFtMDBvdmpmaDgrdzdiRy9KRUQxcUE3?=
 =?utf-8?B?cXI5clU2V3RpT2hVN2ROeUsyVWNhSkNWMVRZYTZMeUduTWV4QjF5eTIwVGdU?=
 =?utf-8?B?WWsrNUVhN2JQUjVWYyt5Nzc1d2ZDNXRxR203RFBsbEMzREUra3NiKzhEeTJp?=
 =?utf-8?B?SUtQV01TWmI0R0JoeFozQkhqSFh5R0xGYWtyUnNBNHJMNDNLbkt0L3NOeTda?=
 =?utf-8?B?akVkL1BtU2VZQXpUSkNHVnh3NkRDbThQRXkwR1c2eGF3ekZ6S3pSUjBSMmQr?=
 =?utf-8?B?Ym1iNmx4VkZyMzRQSWY3YXJnSkd5aXFFejVZeWhBUkVQQ1NuMU01L1RDUkRi?=
 =?utf-8?B?NTBKOHpzbHRoeHZyajJEMDI1V09ISEJBUW1Xb1FjSStBUzBSQTh0U0E5LzIx?=
 =?utf-8?B?YlBWbHVRQUhLUjVseWFWeHFabFA0ZDJZUkYwTS9UbjFlQStxbGtuS2dDUEtw?=
 =?utf-8?B?WGhadnh0ckVSbU1RQldOb3picElKS1BOVEZJRFZ6MGtIK1IzN1hvTkxLMG81?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b50201ec-68f5-4018-4640-08db2ad65e4f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7539.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 13:07:20.1377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KNPjXxqYgqqfX+snOx4gD/uOmJwHhoiUWw/8MosrYnOSNEJhBaeKu9K8OEwnjBNgjzoglkeNMNJiBZNxFCgtGWX+NB5Y198p/5DVj90tbQw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4826
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/gt: some error handling fixes
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

looks good to me.

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

On 3/22/23 12:35 PM, Matthew Auld wrote:
> Make sure we pass along the correct errors.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index daa433d0f2f5..07464ba42746 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -234,7 +234,7 @@ static int emit_nop_job(struct xe_gt *gt, struct xe_engine *e)
>   	job = xe_bb_create_wa_job(e, bb, batch_ofs);
>   	if (IS_ERR(job)) {
>   		xe_bb_free(bb, NULL);
> -		return PTR_ERR(bb);
> +		return PTR_ERR(job);
>   	}
>   
>   	xe_sched_job_arm(job);
> @@ -285,7 +285,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_engine *e)
>   	job = xe_bb_create_wa_job(e, bb, batch_ofs);
>   	if (IS_ERR(job)) {
>   		xe_bb_free(bb, NULL);
> -		return PTR_ERR(bb);
> +		return PTR_ERR(job);
>   	}
>   
>   	xe_sched_job_arm(job);
> @@ -545,8 +545,10 @@ static int all_fw_domain_init(struct xe_gt *gt)
>   
>   	if (!xe_gt_is_media_type(gt)) {
>   		gt->migrate = xe_migrate_init(gt);
> -		if (IS_ERR(gt->migrate))
> +		if (IS_ERR(gt->migrate)) {
> +			err = PTR_ERR(gt->migrate);
>   			goto err_force_wake;
> +		}
>   	} else {
>   		gt->migrate = xe_find_full_gt(gt)->migrate;
>   	}
