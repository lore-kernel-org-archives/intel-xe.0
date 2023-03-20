Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E00C6FD1D
	for <intel-xe@archiver.kernel.org>; Mon, 20 Mar 2023 12:09:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B3E10E3FC;
	Mon, 20 Mar 2023 12:09:13 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F0410E3FC
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Mar 2023 12:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679314151; x=1710850151;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yGiHHGruCxU68iJNt/yUe7di54jukDEkkOMKTzjoZFg=;
 b=TPQ/sK5oGTLZRurbA5BdJoU//7F3x33gItIMUGtgZBh4hEs9UF5FdAye
 Uc/qzX4jyoRi/UkHdBYfjBeOSWAktartlMNytbZIL09Nl5kOmaBCZUNhA
 HS+7hczIgKOhOlPi8YeU8mbaRBQNavA+uGD9/D7eLQcdFmNG0al4YB0sI
 lOYTL0sA1LZGvYL/hyhj25aEdTwF6uPaVNOilfJ+xFwji6e8mKW3kWInE
 i7qH/8pvEE/iYfDQaFT/srN9BnG5O7oulmavmXiNznRmvpA5qylCB1C0A
 Kg61+gCF7M5nFFwoZN78NtmB5m9t3wowZ23Uf7J7ldBQ7jItTWHqjlqjE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="327015484"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="327015484"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 05:08:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="713539648"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="713539648"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 20 Mar 2023 05:08:45 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 05:08:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 05:08:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 20 Mar 2023 05:08:44 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 20 Mar 2023 05:08:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LXSHD9KkC7eI/VLZq86QEz9MTdAlo9+djuv87i5xPqV7Jr2KUz3wgcXJUTqxVedCh1AVhlifLNNAlNjCpY68HspXWng/LOrUenKLhIUeE9PNQwx86h5g2+K+Qg9weJ7/D5/IeZURBrjw5Jb2MGd6wt7nmFi2T21T5+lNipopQRXvH0Uyhg62o03ug45JjPqPm7qmoBG8HaePbXzuBr4jnHxPzwX5UkBgxgMzZ/0zQIhionrIzdoExdC1XxBXpJfWxNlr7EQ5qxVJphlDw/7sZSEzTXkdr7nG5uUKrFbE/poqZu8PTzbQzwuWbdcu2/APITfYkevwOOdhpSd2IWD7KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3LEso3Wv+ZnhrEAQp+8jzGLYIU3uq6BnbFXDw2dMWE=;
 b=OdTUfjqMMmdbdFEmP28Ro6oNbpcMTMJRsgIwDfp2a2aQOBCQbCBqAZtQ6410THvrZv7ZFbDXHN1SEiRlRSObTAqk6ivfQj3sYR/Gi8h+SGETI1gq3jz1uEZP5cpIuN1HoqvH37A2K15r23GVyIvbMGXUp/G40iIjgJ33Ldy4ZSupkBjFUNRKZ3VdWKbKtmWX85MjknfGzks7a8FDuwAanJkzpe9Fns/ccKKuJANZQR7rNuVZt2FGRMLBQrT7qcRwYgwvRQi6sC73Y+ZSKu18GZl/siCd42ONtVLAcCQNlZ17exJmLhEk9X56tm2YsKae6/CBmHwA6XCHV7NiLXq/zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7539.namprd11.prod.outlook.com (2603:10b6:806:343::6)
 by DM8PR11MB5670.namprd11.prod.outlook.com (2603:10b6:8:37::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 12:08:42 +0000
Received: from SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::d94d:4bb6:a568:a2bc]) by SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::d94d:4bb6:a568:a2bc%4]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 12:08:38 +0000
Message-ID: <15701e64-9d2a-bd62-7628-c37b31152654@intel.com>
Date: Mon, 20 Mar 2023 14:08:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230308101745.217120-1-matthew.auld@intel.com>
 <20230308101745.217120-6-matthew.auld@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20230308101745.217120-6-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0187.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::16) To SN7PR11MB7539.namprd11.prod.outlook.com
 (2603:10b6:806:343::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7539:EE_|DM8PR11MB5670:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d37691c-0cd6-48f2-537d-08db293bd687
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LDrDS4rDSwc5MsaiowchbRLN24T+CPQosRd2LebPEdMLvik0GFEDqlklvGfa+3PLNTuoxEWuQDzC6GYTnNBGWdp31Jmz52hZLnNHOPF4erZmRzFlEZYxD+e2xQDA+XGOzN0cPJancLqmnAkXrXgR47Fo4Hn31gGffiqgGt2HOT+fxKDnjTAD7KtAcQezW3hwKr3c9MkQFS8MqQ+P4mdnzJHZV1/Yrsqzyahgtm+ciYYycz0SJvmvN8eFJIJ0dIGeoEhk5tefZQcIqHtJsDo4wlx99ifU6AMSjWnolfMIVEDiAVBf7iGUYuYKA3R4o2LT+NX/DFHxU2I2+b2b50xjec48OXLrl4YE6aUQiruuNPT+P6Arv0r9CVs1lW9wAoiasRIWgQBESl6PjOwm6vFSz/TKZJDYcsQpJU7w2M9M/5szfKMWOoOLWI9PJ9O/7qOA8HAJOLnbqvQkD+o6J/Hn/IXVlZ2m06vgq29oQa9eE6Eaz4ppy251iAvlYlEiYB12jLLG6QADgxfUrV8rv2GjdkbgMeiB8xTWXlvE/CR/hCjswI3JQfDAnDuON8ekPpJglFOkj2yfgBxJuY/6Fyk+jfVF2xNdXpxa6hzJuiAwzga+/f/QQKUlGwx/ZlAMZrMkq+lyO89rV+36u7q/WVsTHa2tWHE8Dfu1EN9oTu4zRHQTWr0d935qQUDUgSj1TAUJlBNxvbAhGQ6NhHkADJJ+WyDtDlNK1I3kRaLjX8mk960=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7539.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(39860400002)(376002)(396003)(346002)(451199018)(66476007)(2616005)(6512007)(26005)(6506007)(6666004)(107886003)(6486002)(31686004)(8676002)(4326008)(83380400001)(316002)(66556008)(53546011)(186003)(66946007)(478600001)(5660300002)(8936002)(30864003)(82960400001)(2906002)(41300700001)(38100700002)(86362001)(31696002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWxVWndqL0w2VjVHZjJyZlIyQVdjd2ZiU1RnUDh0SE1WVVFtZ2pGMURqV1hl?=
 =?utf-8?B?NkZvWU41dktjRGRVK2lyTzdtVmpCay8wRWY5eGhGaXFDNWpXTEdDSU1pSnhR?=
 =?utf-8?B?SG93ZzJhOVNFazhIMmVMZVN0QzFVcXkrZE5MT3RpQmNJUW03SSt3S2t3ems5?=
 =?utf-8?B?cy9LRUVDRjNma1VNWGRTWTYxbEdOMGd6MURsVnpxZDFhTjZYeCswdnMvMmd0?=
 =?utf-8?B?eDIvdHZiUFJZMjcrREYwenFuMUxnTTdicDV0TEQzQmQ0ZTJpdW5wdmwzUTJG?=
 =?utf-8?B?dFZ5MGszUnc4K3YwYU5xYktza2NDRlpLRnhEdzVBYmYreGtWbWJWTWc0Sy9K?=
 =?utf-8?B?TXBRU3g5WndtQ3RJK0VLMTdkLzA0bmQ0L080RU8rbmxzSWdqTXNMNmJtMlJN?=
 =?utf-8?B?cFpOTlU4clYzV3YyTTdKVmxVK0wvb1ZSb3RFM1B4VThOTyt2TjJCcnlyZ0VG?=
 =?utf-8?B?WGF6MGl6M2xDZko1TXdEMFN4aUxqeGFObWpXSkFMdWsvMTNzOXAzSERlUHVE?=
 =?utf-8?B?ZkhNeVVPYk5lV2djcDRVVXBYR2xpVjM2ek8ySTNPd1M2WXZkTTlJdnV4MFZD?=
 =?utf-8?B?L2JyNnhvYnIya2pSL1FzZms4NGN3MjRlTUNoZ2NhdWVXU01zVklmbEFBdENO?=
 =?utf-8?B?N01TTktUdmR2cmcxWitHYUlxZ0JTcnhIa0VtZ2tTeGUvbjBxcUhSR0pmTmdh?=
 =?utf-8?B?Z3g5cEsyOXJHM1pGM3E5YTErQXMrZVM3NnR3ek1FS3BVZDhOa3d6Qld4YnJo?=
 =?utf-8?B?MlF6Mi9uWEJwZTBVUWJLdVYvbmVncTZFa3NOZ01JMGhlVnNZeHVpdkpWMzNw?=
 =?utf-8?B?TmlvamlxamZlcWVQbUNrOFJlUU9oWGMzaXg2aWhOdWhFVDFCR21TS0JjZ3RL?=
 =?utf-8?B?M0YrbjVQWGxRWjFrTHpVTzBoT202OTlSblFtaDNzMzJLM2ZqMlN3czhUOE5l?=
 =?utf-8?B?V3k3c2hwUmZWUjZSNmI3d09xZXZSdEVkdmZURWFuZ3lHRm42Y2ZONlVDdCt6?=
 =?utf-8?B?MG4yVlV4RVc4Tnd2T05pc21yY2hZeDBzU3Q5bkFMaUUwalhuWExocldRUjRp?=
 =?utf-8?B?eUhMdGZZTG5EcnIzSDk4RmtCRzR4LzQ0Y1hQWjV4UUtoMGFUamRxTW1EWHpL?=
 =?utf-8?B?YjRqSlJXMWR3Wm1UMmluaWlMblcyU3oyQUsxVVd0OEFKd2RWWXJ4QmYzNVBx?=
 =?utf-8?B?LzFRRmRhSXRiY250ZjA2TTcrdmtuNnNzNXZEYzVSRlkvOHMrTTlYMUc0SUF3?=
 =?utf-8?B?aXMvaFhZcTNnTy9hRUNKWFlFcFhnWDhMRW1zaC9Cc01sTFNjRnB2WFprckpz?=
 =?utf-8?B?RmRiN283VGVqR3RraTN6bi9RL09idCtWdDJlSnJjSzZ3Qjh4c003MEFVZ3lo?=
 =?utf-8?B?bWpDK0hJUUJEQU5sNlJqWS9tWWdxOXc1VUE5WWE1S3ZSREdGTU9zL0xEOGpp?=
 =?utf-8?B?Q3Z3Q1V5U1M5c3RTZnN5VFlWaG9lZW5Ib2tUSlcrcWV3UGc1VzFkWWRURmZ4?=
 =?utf-8?B?eitTaEZKNlRCRlZJa2NCb3NmRlNDVmFqKzNoS2JOcGE1SlY2L29VaVB6Z1Q1?=
 =?utf-8?B?bW1TY0lUWmJPenRNU0FyNEtDaUlROXJsVUZLUkJCWGR3WjBCR1IyRllaYS83?=
 =?utf-8?B?K1BpcnFaSVVEeUxPUUpFdWVEUG9kL0V4b242b0JOcU5RcjAwaHRGL1JWWlVF?=
 =?utf-8?B?dmJzbHFHUTYvY2dIbmduekRFdGIzZmFFVFhERXNEaUZPa1ZmVXpvbmJQZTlq?=
 =?utf-8?B?M1VBUUNpcElRRFhsVjZ0eHdHVTdrbWFOdE9KM3hIRzYrdVQvR2U3QnMvZldI?=
 =?utf-8?B?RElSVXBvT0tQTDVPUVJYckt6bUpRSE5EenZtNTVoaitVTlZyUDRQR2swS1VW?=
 =?utf-8?B?cE5UUzVTV0NOY0FkNVozSDZyaWJVK0JhRUs4ODJCZ1MvS1ladmpEYkMyQ0h2?=
 =?utf-8?B?dStPZDdHSktLNkQ0a0d1WFp0TWs5RURRYk5UMXBSWk5hWG1JblRTbXRENXk1?=
 =?utf-8?B?a0ttOVhjQVJiemowS0tqMW5BOGJRRXB1WGNlakFBcTFpSmo5YW1uRm5Jb08z?=
 =?utf-8?B?R2NXS1pPQTUyNjBGcnBPYkVvdFpCbVNKVDRLK2F6YS9obEZjc0tNa3NQRTZ0?=
 =?utf-8?B?MkM2VG1mZlBoWW9BUXFMa0pCV0phUDRGajZTMFJMS1dFaGxTQ0N0UmwzQlNh?=
 =?utf-8?B?NVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d37691c-0cd6-48f2-537d-08db293bd687
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7539.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 12:08:38.3309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HP0AOUU/sQnm3jONvQJyDgAHEYqSChxA/y/EKZzLG2/it6FrkQUKFGUW/BbPqxmYrwrWRSG4ZYUMdmGUBGYTpvDhEhYqiJml4+Kq+K5anT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5670
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 5/6] drm/xe/buddy: add visible tracking
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



On 3/8/23 12:17 PM, Matthew Auld wrote:
> Replace the allocation code with the i915 version. This simplifies the
> code a little, and importantly we get the accounting at the mgr level,
> which is useful for debug (and maybe userspace), plus per resource
> tracking so we can easily check if a resource is using one or pages in
> the mappable part of vram (useful for eviction), or if the resource is
> completely within the mappable portion (useful for checking if the
> resource can be safely CPU mapped).
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c     |  18 +-
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 201 ++++++++++-----------
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   3 +-
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |   6 +
>   4 files changed, 118 insertions(+), 110 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index e608b49072ba..35e6bc62766e 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -158,7 +158,7 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
>   {
>   	struct xe_ttm_stolen_mgr *mgr = drmm_kzalloc(&xe->drm, sizeof(*mgr), GFP_KERNEL);
>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> -	u64 stolen_size, pgsize;
> +	u64 stolen_size, io_size, pgsize;
>   	int err;
>   
>   	if (IS_DGFX(xe))
> @@ -177,7 +177,17 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
>   	if (pgsize < PAGE_SIZE)
>   		pgsize = PAGE_SIZE;
>   
> -	err = __xe_ttm_vram_mgr_init(xe, &mgr->base, XE_PL_STOLEN, stolen_size, pgsize);
> +	/*
> +	 * We don't try to attempt partial visible support for stolen vram,
> +	 * since stolen is always at the end of vram, and the BAR size is pretty
> +	 * much always 256M, with small-bar.
> +	 */
> +	io_size = 0;
> +	if (!xe_ttm_stolen_cpu_inaccessible(xe))
> +		io_size = stolen_size;
> +
> +	err = __xe_ttm_vram_mgr_init(xe, &mgr->base, XE_PL_STOLEN, stolen_size,
> +				     io_size, pgsize);
>   	if (err) {
>   		drm_dbg_kms(&xe->drm, "Stolen mgr init failed: %i\n", err);
>   		return;
> @@ -186,8 +196,8 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
>   	drm_dbg_kms(&xe->drm, "Initialized stolen memory support with %llu bytes\n",
>   		    stolen_size);
>   
> -	if (!xe_ttm_stolen_cpu_inaccessible(xe))
> -		mgr->mapping = devm_ioremap_wc(&pdev->dev, mgr->io_base, stolen_size);
> +	if (io_size)
> +		mgr->mapping = devm_ioremap_wc(&pdev->dev, mgr->io_base, io_size);
>   }
>   
>   u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset)
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index e3ac8c6d3978..f703e962f499 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -49,45 +49,26 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>   			       const struct ttm_place *place,
>   			       struct ttm_resource **res)
>   {
> -	u64 max_bytes, cur_size, min_block_size;
>   	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
>   	struct xe_ttm_vram_mgr_resource *vres;
> -	u64 size, remaining_size, lpfn, fpfn;
>   	struct drm_buddy *mm = &mgr->mm;
> -	unsigned long pages_per_block;
> -	int r;
> -
> -	lpfn = (u64)place->lpfn << PAGE_SHIFT;
> -	if (!lpfn || lpfn > man->size)
> -		lpfn = man->size;
> -
> -	fpfn = (u64)place->fpfn << PAGE_SHIFT;
> +	u64 size, remaining_size, min_page_size;
> +	unsigned long lpfn;
> +	int err;
>   
> -	max_bytes = mgr->manager.size;
> -	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> -		pages_per_block = ~0ul;
> -	} else {
> -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> -		pages_per_block = HPAGE_PMD_NR;
> -#else
> -		/* default to 2MB */
> -		pages_per_block = 2UL << (20UL - PAGE_SHIFT);
> -#endif
> -
> -		pages_per_block = max_t(uint32_t, pages_per_block,
> -					tbo->page_alignment);
> -	}
> +	lpfn = place->lpfn;
> +	if (!lpfn || lpfn > man->size >> PAGE_SHIFT)
> +		lpfn = man->size >> PAGE_SHIFT;
>   
>   	vres = kzalloc(sizeof(*vres), GFP_KERNEL);
>   	if (!vres)
>   		return -ENOMEM;
>   
>   	ttm_resource_init(tbo, place, &vres->base);
> -	remaining_size = vres->base.size;
>   
>   	/* bail out quickly if there's likely not enough VRAM for this BO */
> -	if (ttm_resource_manager_usage(man) > max_bytes) {
> -		r = -ENOSPC;
> +	if (ttm_resource_manager_usage(man) > man->size) {
> +		err = -ENOSPC;
>   		goto error_fini;
>   	}
>   
> @@ -96,95 +77,91 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>   	if (place->flags & TTM_PL_FLAG_TOPDOWN)
>   		vres->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
>   
> -	if (fpfn || lpfn != man->size)
> -		/* Allocate blocks in desired range */
> +	if (place->fpfn || lpfn != man->size >> PAGE_SHIFT)
>   		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>   
> -	mutex_lock(&mgr->lock);
> -	while (remaining_size) {
> -		if (tbo->page_alignment)
> -			min_block_size = tbo->page_alignment << PAGE_SHIFT;
> -		else
> -			min_block_size = mgr->default_page_size;
> -
> -		XE_BUG_ON(min_block_size < mm->chunk_size);
> -
> -		/* Limit maximum size to 2GiB due to SG table limitations */
> -		size = min(remaining_size, 2ULL << 30);
> -
> -		if (size >= pages_per_block << PAGE_SHIFT)
> -			min_block_size = pages_per_block << PAGE_SHIFT;
> -
> -		cur_size = size;
> -
> -		if (fpfn + size != place->lpfn << PAGE_SHIFT) {
> -			/*
> -			 * Except for actual range allocation, modify the size and
> -			 * min_block_size conforming to continuous flag enablement
> -			 */
> -			if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> -				size = roundup_pow_of_two(size);
> -				min_block_size = size;
> -			/*
> -			 * Modify the size value if size is not
> -			 * aligned with min_block_size
> -			 */
> -			} else if (!IS_ALIGNED(size, min_block_size)) {
> -				size = round_up(size, min_block_size);
> -			}
> -		}
> +	XE_BUG_ON(!vres->base.size);
> +	size = vres->base.size;
>   
> -		r = drm_buddy_alloc_blocks(mm, fpfn,
> -					   lpfn,
> -					   size,
> -					   min_block_size,
> -					   &vres->blocks,
> -					   vres->flags);
> -		if (unlikely(r))
> -			goto error_free_blocks;
> +	min_page_size = mgr->default_page_size;
> +	if (tbo->page_alignment)
> +		min_page_size = tbo->page_alignment << PAGE_SHIFT;
>   
> -		if (size > remaining_size)
> -			remaining_size = 0;
> -		else
> -			remaining_size -= size;
> +	XE_BUG_ON(min_page_size < mm->chunk_size);
> +	XE_BUG_ON(min_page_size > SZ_2G); /* FIXME: sg limit */
> +	XE_BUG_ON(size > SZ_2G &&
> +		  (vres->base.placement & TTM_PL_FLAG_CONTIGUOUS));
Hi Matt,
What scenario is the purpose of testing? Is the purpose of reporting an 
error when it is a small bar case at the current stage?
> +	XE_BUG_ON(!IS_ALIGNED(size, min_page_size));
If it is not aligned, can't we increase it to the aligned size and 
allocate it?
> +
> +	if (place->fpfn + (vres->base.size >> PAGE_SHIFT) != place->lpfn &&
> +	    place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> +		unsigned long pages;
> +
> +		size = roundup_pow_of_two(size);
> +		min_page_size = size;
> +
> +		pages = size >> ilog2(mm->chunk_size);
Why did you use ilog2(mm->chunk_size) instead of PAGE_SHIFT here?
> +		if (pages > lpfn)
> +			lpfn = pages;
>   	}
> -	mutex_unlock(&mgr->lock);
>   
> -	if (cur_size != size) {
> -		struct drm_buddy_block *block;
> -		struct list_head *trim_list;
> -		u64 original_size;
> -		LIST_HEAD(temp);
> +	if (size > lpfn << PAGE_SHIFT) {
In case of DRM_BUDDY_RANGE_ALLOCATION, shouldn't it be compared with 
size > (lpfn - fpfn) << PAGE_SHIFT?

Br,

G.G.
> +		err = -E2BIG; /* don't trigger eviction */
> +		goto error_fini;
> +	}
>   
> -		trim_list = &vres->blocks;
> -		original_size = vres->base.size;
> +	mutex_lock(&mgr->lock);
> +	if (lpfn <= mgr->visible_size && size > mgr->visible_avail) {
> +		mutex_unlock(&mgr->lock);
> +		err = -ENOSPC;
> +		goto error_fini;
> +	}
>   
> +	remaining_size = size;
> +	do {
>   		/*
> -		 * If size value is rounded up to min_block_size, trim the last
> -		 * block to the required size
> +		 * Limit maximum size to 2GiB due to SG table limitations.
> +		 * FIXME: Should maybe be handled as part of sg construction.
>   		 */
> -		if (!list_is_singular(&vres->blocks)) {
> -			block = list_last_entry(&vres->blocks, typeof(*block), link);
> -			list_move_tail(&block->link, &temp);
> -			trim_list = &temp;
> -			/*
> -			 * Compute the original_size value by subtracting the
> -			 * last block size with (aligned size - original size)
> -			 */
> -			original_size = drm_buddy_block_size(mm, block) -
> -				(size - cur_size);
> -		}
> +		u64 alloc_size = min_t(u64, remaining_size, SZ_2G);
> +
> +		err = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
> +					     (u64)lpfn << PAGE_SHIFT,
> +					     alloc_size,
> +					     min_page_size,
> +					     &vres->blocks,
> +					     vres->flags);
> +		if (err)
> +			goto error_free_blocks;
>   
> -		mutex_lock(&mgr->lock);
> -		drm_buddy_block_trim(mm,
> -				     original_size,
> -				     trim_list);
> -		mutex_unlock(&mgr->lock);
> +		remaining_size -= alloc_size;
> +	} while (remaining_size);
>   
> -		if (!list_empty(&temp))
> -			list_splice_tail(trim_list, &vres->blocks);
> +	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> +		if (!drm_buddy_block_trim(mm, vres->base.size, &vres->blocks))
> +			size = vres->base.size;
>   	}
>   
> +	if (lpfn <= mgr->visible_size >> PAGE_SHIFT) {
> +		vres->used_visible_size = size;
> +	} else {
> +		struct drm_buddy_block *block;
> +
> +		list_for_each_entry(block, &vres->blocks, link) {
> +			u64 start = drm_buddy_block_offset(block);
> +
> +			if (start < mgr->visible_size) {
> +				u64 end = start + drm_buddy_block_size(mm, block);
> +
> +				vres->used_visible_size +=
> +					min(end, mgr->visible_size) - start;
> +			}
> +		}
> +	}
> +
> +	mgr->visible_avail -= vres->used_visible_size;
> +	mutex_unlock(&mgr->lock);
> +
>   	if (!(vres->base.placement & TTM_PL_FLAG_CONTIGUOUS) &&
>   	    xe_is_vram_mgr_blocks_contiguous(mm, &vres->blocks))
>   		vres->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
> @@ -213,7 +190,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>   	ttm_resource_fini(man, &vres->base);
>   	kfree(vres);
>   
> -	return r;
> +	return err;
>   }
>   
>   static void xe_ttm_vram_mgr_del(struct ttm_resource_manager *man,
> @@ -226,6 +203,7 @@ static void xe_ttm_vram_mgr_del(struct ttm_resource_manager *man,
>   
>   	mutex_lock(&mgr->lock);
>   	drm_buddy_free_list(mm, &vres->blocks);
> +	mgr->visible_avail += vres->used_visible_size;
>   	mutex_unlock(&mgr->lock);
>   
>   	ttm_resource_fini(man, res);
> @@ -240,6 +218,13 @@ static void xe_ttm_vram_mgr_debug(struct ttm_resource_manager *man,
>   	struct drm_buddy *mm = &mgr->mm;
>   
>   	mutex_lock(&mgr->lock);
> +	drm_printf(printer, "default_page_size: %lluKiB\n",
> +		   mgr->default_page_size >> 10);
> +	drm_printf(printer, "visible_avail: %lluMiB\n",
> +		   (u64)mgr->visible_avail >> 20);
> +	drm_printf(printer, "visible_size: %lluMiB\n",
> +		   (u64)mgr->visible_size >> 20);
> +
>   	drm_buddy_print(mm, printer);
>   	mutex_unlock(&mgr->lock);
>   	drm_printf(printer, "man size:%llu\n", man->size);
> @@ -262,6 +247,8 @@ static void ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
>   	if (ttm_resource_manager_evict_all(&xe->ttm, man))
>   		return;
>   
> +	WARN_ON_ONCE(mgr->visible_avail != mgr->visible_size);
> +
>   	drm_buddy_fini(&mgr->mm);
>   
>   	ttm_resource_manager_cleanup(&mgr->manager);
> @@ -270,7 +257,8 @@ static void ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
>   }
>   
>   int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
> -			   u32 mem_type, u64 size, u64 default_page_size)
> +			   u32 mem_type, u64 size, u64 io_size,
> +			   u64 default_page_size)
>   {
>   	struct ttm_resource_manager *man = &mgr->manager;
>   	int err;
> @@ -279,6 +267,8 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
>   	mgr->mem_type = mem_type;
>   	mutex_init(&mgr->lock);
>   	mgr->default_page_size = default_page_size;
> +	mgr->visible_size = io_size;
> +	mgr->visible_avail = io_size;
>   
>   	ttm_resource_manager_init(man, &xe->ttm, size);
>   	err = drm_buddy_init(&mgr->mm, man->size, default_page_size);
> @@ -298,7 +288,8 @@ int xe_ttm_vram_mgr_init(struct xe_gt *gt, struct xe_ttm_vram_mgr *mgr)
>   	mgr->gt = gt;
>   
>   	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + gt->info.vram_id,
> -				      gt->mem.vram.size, PAGE_SIZE);
> +				      gt->mem.vram.size, gt->mem.vram.io_size,
> +				      PAGE_SIZE);
>   }
>   
>   int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> index 78f332d26224..35e5367a79fb 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> @@ -13,7 +13,8 @@ struct xe_device;
>   struct xe_gt;
>   
>   int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
> -			   u32 mem_type, u64 size, u64 default_page_size);
> +			   u32 mem_type, u64 size, u64 io_size,
> +			   u64 default_page_size);
>   int xe_ttm_vram_mgr_init(struct xe_gt *gt, struct xe_ttm_vram_mgr *mgr);
>   int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
>   			      struct ttm_resource *res,
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> index 39aa2ec1b968..3d9417ff7434 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> @@ -23,6 +23,10 @@ struct xe_ttm_vram_mgr {
>   	struct ttm_resource_manager manager;
>   	/** @mm: DRM buddy allocator which manages the VRAM */
>   	struct drm_buddy mm;
> +	/** @visible_size: Proped size of the CPU visible portion */
> +	u64 visible_size;
> +	/** @visible_avail: CPU visible portion still unallocated */
> +	u64 visible_avail;
>   	/** @default_page_size: default page size */
>   	u64 default_page_size;
>   	/** @lock: protects allocations of VRAM */
> @@ -39,6 +43,8 @@ struct xe_ttm_vram_mgr_resource {
>   	struct ttm_resource base;
>   	/** @blocks: list of DRM buddy blocks */
>   	struct list_head blocks;
> +	/** @used_visible_size: How many CPU visible bytes this resource is using */
> +	u64 used_visible_size;
>   	/** @flags: flags associated with the resource */
>   	unsigned long flags;
>   };
