Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F18EC4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 01:14:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA5210E448;
	Thu, 30 Nov 2023 01:14:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5939810E448
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 01:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701306888; x=1732842888;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8pl0XJ8mD1nBA9jisJ/70jOzMgkgNN8UgJ9/gIOpJdA=;
 b=H8YaRjPw0goXEM4NAX+yKcjcLkb6RnksLSSG2wUxyVr/1Fq6s7mR3zrS
 p2cz9vuGhWHkZoD+MVH3oTt6Dv0bg4r81dszg66imP6tIArCQqLnXY8Q1
 nJjHj8cvFW3SzErJz4yEJl6plpUbWxLynY0qgH/GHVavAuTVAfsf/lgya
 DU5L+mOZ5cntUWbEcjocBNEXDDiEvF6N0bsxtyB5utRisy+Qmg1l4dtKf
 iAeNcxaZ4UYCjkKGqpJmti/kzllLaz2p0jnUtCNC7HP4xlOlA3TBNL691
 hCUs4KMnKLfa+dD92TFzR60LnRxrmBOrWcwrdRR/2XnWPHuAzK1bkZt9o Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="383647873"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="383647873"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 17:14:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="1016461176"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="1016461176"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 17:14:44 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 17:14:44 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 17:14:44 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 17:14:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W7+dyLJ2tbt3jZ0ix/B11oV6IJ3vFACBpUFG7PXZlMNkYbAC1hBCfWWwpX/1nM84Dv+UBxasJPg6+Sh+V2rHehpq/sqlcDX/5BfvtRkdbQ+GjySg5ANP8Q+gCk5+aWfJaCyv9ykl/xfEd3qdAYh0JCdkY5/CeCJF09ho1Mz1uQ6yd9jTtp7dGFbSbBxVJ4hma6XihMkLWXaIOL7XwjPONlJ9S70QHmv1ac6NSppEiVQAlXQ62fUCE5kjXEcnAsCyxySvBpGry8ba9uxMEdvI8ngHjcwx3q+5Ctk5Rl91xGDAt+H9XhZORokqvlvzbEuz6gqgd7oA5qbA9ptR20yecg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3lx4qYSMzsq4b+CkMMyxhiSwBhQ/Teh4C7wgC6RbxjA=;
 b=CsG2w30pmtoBqYPuSoCKGgmxr0qVKMqaSS35jTWNiNqsKPt9YiuCrcwlYNlZ8l9vikW+g0HvF8onXCD8XDnmCj3/fvhDyqLr+jYWmR7v85UeeHQaEb651eLRHVxTUy4hpDQ58Vf+tGfgMQC6N2axEvlFdGZkzlxDt1rOrLAD2jUhmBIgeFAutMGWGbo8r8ry4Ed89zgaoKxlvnUkvRCoNfR9IQdOedSUyWhZp3LeHa++KxSwUiFK1H6LvGDB/qt0Dx46oOm5NU0nCEOMjTtWsVw0krC2lgQ/p7VCbpQVI7UJOF56P60Qp3RnBIeBIHhp2wJNs0IuaeV7+NNS1gSYDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4668.namprd11.prod.outlook.com (2603:10b6:303:54::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 01:14:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7046.015; Thu, 30 Nov 2023
 01:14:42 +0000
Date: Wed, 29 Nov 2023 18:13:04 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <ZWd/MBpoCyE5LIRf@DUT025-TGLU.fm.intel.com>
References: <20231129223508.1189461-1-michal.winiarski@intel.com>
 <20231129223508.1189461-22-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231129223508.1189461-22-michal.winiarski@intel.com>
X-ClientProxiedBy: SJ0PR13CA0084.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4668:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c34540d-1be5-4268-7f5d-08dbf141bb01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5ulqZ5xgjlNzy4FIJwxplGpo7YIFHHEvIENrjI32Wo/xMh3JwJXbIZOt73zxiO85VEPgH8CPp7gWFZCIhjXk366xWg04WSKqY0VOHlXZbc5KKkjhzSJ5cw1FzkXqGKDgPG7HPZ3W4zRMTbWAvecE7SFX395+yoYH3zA7tJ8FC0o/Cgtmpd79wQeqMGwnqCCxJ9Q9tXlFfDPK77qIhBE5VgjcdEvzrGKyfqBntUVGe4djeY9MpTn7pVnDNu4WYtRnfg/3hP22a46r0BnC4yE5zk2SkPL1PA31OmuSsH9bB/pJq+OQ/TcCWPFLlnD/PLiPDMk6FXgfdqHcJyMSFZsWjaFjiKY2gTWty9jXrgQKCxcRZKna3rNPrYgzlzuVVAGXkL9562eJF5tFd402W5R0ISskG29O8tUdzIzzXAyan0ImBkR8Q9Uxjz0HF/o9qq0Rf/oyUrrVEBOGIuPE7B825XlNjCS4pYPQ/7njqarrCbKhYiqZi+Ztj0ooJqN1hWdwKPFVfPvQFM4c2LBxw0zHBjlkh2b7VWAo/GHK4QWY4q0ZlUL1BwI5lZN1YwN8JE6pdaDvJwnJKflSPk1WFHmYfxI1JgJdqrzexNH2qIabYjssfEOak+aSEAmou/WET7uywRHiLUNY9vLiodiO8Ur4nA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(396003)(136003)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(6506007)(6512007)(82960400001)(26005)(66946007)(54906003)(66476007)(66556008)(316002)(6636002)(202311291699003)(6862004)(38100700002)(4326008)(478600001)(6666004)(6486002)(8936002)(8676002)(83380400001)(2906002)(86362001)(5660300002)(44832011)(41300700001)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUJCQ1ZUQ1VaWWJ5YzZyN0FVdmx3dk1tRDh5djFJUytpUlNZbllkN0o5YjA2?=
 =?utf-8?B?QUFKSjFWcEx1ajVQZ1JUNkhnZTdmTEdKUTdDMGdRTUt4SStMclcyWkpIYnNG?=
 =?utf-8?B?cVRmYVN4TS9JUllBTkNBVFRyT0Z3S0hnRTdQQ2pLNzNlSVVQbVU1Ty9CNUdu?=
 =?utf-8?B?Y013aEVPcHR3RjUrekE1RjBZa29pTFZqdkFEMkdFNDloT2d5alMySVlwbSti?=
 =?utf-8?B?RHhycks4eVQ4R1BpUjBDekxJaU5jS3NRbFFyVExxNmhnMHIzUTVWOWlzNi9C?=
 =?utf-8?B?RzJaVmFCTkE1STlMZnJ5K3NkcGd3cEZrWkM1VkluK3JtS3VydnhtSndUZTFX?=
 =?utf-8?B?RFZneERVWjVVOG5ycDdjcFJyaWtTZWFvWGwzVlIrM3hsQ1F2ejMzMitOYnlN?=
 =?utf-8?B?blNNTmxoVUZpZU9DcnRqbm02ZUJWTVJYUlJoRmFrcytqeEJCSVlsbDVGbWhq?=
 =?utf-8?B?eHd2bEQzOWx3REV1Mmdqc3hDbWZNcEhqL1hCeHp4R2dxT2tRQzZaOW11Rk5L?=
 =?utf-8?B?VUNVOVpRRHY0eWpQdHFaSjBxaWJjbDhONDVSMGhNdENwVElrRzlwUDBvaEpv?=
 =?utf-8?B?WGtsL1FpSEFoRG5iVUJMME5hZTFUZ3Jxa2t2NjFLNXZUM1F1SkNtUTJRSEl0?=
 =?utf-8?B?WER3QzRUbHY1NjlVRFd1NURyMHVmbWlBR2lBYWVJNVZrNk1WSlh3emNQSkJV?=
 =?utf-8?B?RlpBWW03VlRWWkpNK0syWDdOczRBU1BxSytTR3VCUjFFWUhWSjFNNUxDd1N4?=
 =?utf-8?B?dmVMVTlKZEkwcVVWV0FkeFhhbjBkUVlJRFpOb0RLZzcxdTJ2MktUYkZiNHhr?=
 =?utf-8?B?ZXBGVGtwVThQMk5KTzV6NjEyYTE0RnpBa0ZCM1piMlhEL0RjT0JPSGFNSkxI?=
 =?utf-8?B?YW5MVXR2bDdOWTNVNmV0S3JwK0hUYlFaSXFnNVhwVmdZeTZzVW5nU1BQUHpj?=
 =?utf-8?B?VnhsMzBCSE9PNXFjM1BNa0NYUVNOOGJTSTY1MjliSlhMbGtodUlmTWd3c0Ri?=
 =?utf-8?B?K2I3YXN2N2JURC9jTERmOG9MUUx3MFlWT0dPb0FVVmJLczFydmtPRFJnOXo0?=
 =?utf-8?B?T2JqU2YzVU9rL2o1dENhWE4zYk9hWmRtOGt5R3V0MkpvcHIzUlJ2V2plVE8w?=
 =?utf-8?B?NHFYY2Y1TThJZ04yejlQZjM0aXFxQUFRanpGQjhScnJVQktGMWVjTTloUUV4?=
 =?utf-8?B?UUd3NS8wN1RnWWZONFJsVDFiOGlDMXZ1SGRtaklzZEtOM3R6VUhtV1BwRnpL?=
 =?utf-8?B?ZHNoSkVvWDBmZTFKem01cFRNS1ZPd1ppZVpBaVVCT0s5NUIxSy9rZ24vR1hJ?=
 =?utf-8?B?eUxrcTcvaXRkNWFlWDhzcUd3ZWF1ajk4VGxvUTdDRHhLb0pGOXpHZC9sYU5Q?=
 =?utf-8?B?bEhORXNaMG8wcFU3WkF5WjN6UXBuN3Z4dmFIbjE1V1ZRUm5LWnQ5UXp1UGJE?=
 =?utf-8?B?ak1sNW9CRTJpTEFHQlA1OEZUcGtYZHU5QTY5RU5zNkk4Nm1HM2U1Q21EZHph?=
 =?utf-8?B?Q2R3K2w5c3NjbmNjT3YwVkJLUXQxM3ZtQmhTRWRNV0tRakJ6R0ZBejM2RlRY?=
 =?utf-8?B?ckY3eVJXeHlLQ1g1Q2JDd0gxQ2Q0MHlSMUtDc2lCdEw1ZSt4N2hLaVJWK3JR?=
 =?utf-8?B?YitPaXZreHltQTVtY1NDQzlOYSs0Ui8wVVZEZ3o0RkpwTjZOMWVLQ2w1MCtB?=
 =?utf-8?B?OGVqeDgwMkhIbE9UN0FKbkZPQnhYYWJ5QisrL0FSRnBkODFocnlUYmlVRm1V?=
 =?utf-8?B?MFFrbkY2NnhZVVZ0NlRLVEVYRS95Nkd2RWkySVArMUJ6WkJ0Vzdpb2hjL0Vh?=
 =?utf-8?B?TVdYZGlCbE1RK3hjUHNtdDNLYnpKeHlyTVNyclhCVjM4YjdmRUs3TU5RRXo4?=
 =?utf-8?B?RzU5b1hvWkNsS2lPcHhvTWRtZ0tzaTNWMnRKK3JqQ3VWbXpwaW1vSkVaTlcw?=
 =?utf-8?B?eVQwREEzQ2NVdGp5WmdrQThRb2VNNytQZnM4UkdoTk9FT0s5MVA2NisreDhx?=
 =?utf-8?B?VWlWVDlSOGwrQWYvbk5KQStpNm0rZDZrYy9PdHJnczJBd1JrRmZUVGVvK093?=
 =?utf-8?B?S051WEowUmZRQ2hNazBRd0REWDRtb05GWUptZW5sRVZVRE1MS0t1Y09tQ2VK?=
 =?utf-8?B?dm5wMG1DTkc5RU9QOXk3RWdONyt2K1k1dnlSRlRNTm5jMHZVdFJWS2lhdlcy?=
 =?utf-8?B?RkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c34540d-1be5-4268-7f5d-08dbf141bb01
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 01:14:41.8395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9KcfkhcnNoUqj80DqAioz8dN45GWa7J6s27MXvdVwXtHuQvl+cRf2EFT8q165W1N10yptL4c/rd9H8ptkgV+Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4668
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 21/23] drm/xe/guc: Allocate GuC data
 structures in system memory for initial load
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Nov 29, 2023 at 11:35:06PM +0100, Michał Winiarski wrote:
> GuC load will need to happen at an earlier point in probe, where local
> memory is not yet available. Use system memory for GuC data structures
> used for initial "hwconfig" load, and realloc at a later,
> "post-hwconfig" load if needed, when local memory is available.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
> v3 -> v4:
> - Assert that realloc transisions from RAM to VRAM to make sure
>   iosys_map API is used correctly (Lucas)
> - Fix GuC resource realloc by introducing drmm_release_action
> 
>  drivers/gpu/drm/xe/xe_bo.c           |  5 +++
>  drivers/gpu/drm/xe/xe_bo.h           |  1 +
>  drivers/gpu/drm/xe/xe_guc.c          | 48 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_ads.c      |  2 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c       |  2 +-
>  drivers/gpu/drm/xe/xe_guc_hwconfig.c |  2 +-
>  drivers/gpu/drm/xe/xe_guc_log.c      |  2 +-
>  7 files changed, 58 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 1a7fe62de8122..f8c744bd148c7 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1566,6 +1566,11 @@ struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_til
>  	return bo;
>  }
>  
> +void xe_managed_bo_release(struct xe_device *xe, struct xe_bo *bo)
> +{
> +	drmm_release_action(&xe->drm, __xe_bo_release, bo);
> +}
> +
>  /*
>   * XXX: This is in the VM bind data path, likely should calculate this once and
>   * store, with a recalculation if the BO is moved.
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 098ccab7fa1e8..797d621075bd5 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -119,6 +119,7 @@ struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile
>  					   size_t size, u32 flags);
>  struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
>  					     const void *data, size_t size, u32 flags);
> +void xe_managed_bo_release(struct xe_device *xe, struct xe_bo *bo);
>  
>  int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
>  			      u32 bo_flags);
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 482cb0df9f15b..b85defa941e85 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -241,6 +241,48 @@ static void guc_fini(struct drm_device *drm, void *arg)
>  	xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
>  }
>  
> +static int __guc_bo_reinit(struct xe_guc *guc, struct xe_bo **src)
> +{
> +	struct xe_tile *tile = gt_to_tile(guc_to_gt(guc));
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_bo *bo;
> +
> +	xe_assert(xe, !(*src)->vmap.is_iomem);
> +
> +	bo = xe_managed_bo_create_from_data(xe, tile, &(*src)->vmap.vaddr, (*src)->size,
> +					    XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> +					    XE_BO_CREATE_GGTT_BIT);
> +	if (IS_ERR(bo))
> +		return PTR_ERR(bo);
> +
> +	xe_managed_bo_release(xe, *src);
> +	*src = bo;
> +
> +	return 0;
> +}
> +
> +static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
> +{
> +	int ret;
> +
> +	if (!IS_DGFX(guc_to_xe(guc)))
> +		return 0;
> +
> +	ret = __guc_bo_reinit(guc, &guc->log.bo);
> +	if (ret)
> +		return ret;
> +
> +	ret = __guc_bo_reinit(guc, &guc->ads.bo);
> +	if (ret)
> +		return ret;
> +
> +	ret = __guc_bo_reinit(guc, &guc->ct.bo);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
>  int xe_guc_init(struct xe_guc *guc)
>  {
>  	struct xe_device *xe = guc_to_xe(guc);
> @@ -299,6 +341,12 @@ int xe_guc_init(struct xe_guc *guc)
>   */
>  int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>  {
> +	int ret;
> +
> +	ret = xe_guc_realloc_post_hwconfig(guc);
> +	if (ret)
> +		return ret;
> +
>  	guc_init_params_post_hwconfig(guc);
>  
>  	return xe_guc_ads_init_post_hwconfig(&guc->ads);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 2f5ff090aa6bd..61b443981f99a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -272,7 +272,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>  	ads->regset_size = calculate_regset_size(gt);
>  
>  	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
> -					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> +					  XE_BO_CREATE_SYSTEM_BIT |
>  					  XE_BO_CREATE_GGTT_BIT);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 24a33fa36496a..316e77362a825 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -148,7 +148,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>  	primelockdep(ct);
>  
>  	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
> -					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> +					  XE_BO_CREATE_SYSTEM_BIT |
>  					  XE_BO_CREATE_GGTT_BIT);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
> diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> index 2a13a00917f8c..ea49f3885c108 100644
> --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> @@ -78,7 +78,7 @@ int xe_guc_hwconfig_init(struct xe_guc *guc)
>  		return -EINVAL;
>  
>  	bo = xe_managed_bo_create_pin_map(xe, tile, PAGE_ALIGN(size),
> -					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> +					  XE_BO_CREATE_SYSTEM_BIT |
>  					  XE_BO_CREATE_GGTT_BIT);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index bcd2f4d34081d..45135c3520e54 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -84,7 +84,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
>  	struct xe_bo *bo;
>  
>  	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
> -					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> +					  XE_BO_CREATE_SYSTEM_BIT |
>  					  XE_BO_CREATE_GGTT_BIT);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
> -- 
> 2.43.0
> 
