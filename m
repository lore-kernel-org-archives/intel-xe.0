Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C34BC77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 21:01:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B855B10E52B;
	Wed, 10 May 2023 21:01:28 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F39C10E52B
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 21:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683752487; x=1715288487;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6wH34GD494Pr/r9oCZUks8OuImpLtfdnloPgPY0Yt9E=;
 b=SIgUnE6bSqchyEEw10r9jM8Ar0Yo/Raz324GlF+bW4gdIYHGKYTFXdy3
 +wZxmQD3jE43ILF1JKBETR9YaMOLoR5l6uIjcUIOfqgfTVG+xJCeLAChH
 fUSHoRACQeljNBGMCCiXjm33/AHy9arZ40oFdlAOEublPvmL79g9aN0Qr
 2V8mAAMk+OUzeIPL4KaYCkkfzI/OY/V8rb3OGhsH3t6LXd/rXVuqzUXak
 oMC3J7lODhyLLPqXR2nLLaAq5xEggek3FfkM7hfnNXYHWHSMxvdd++0lD
 dxJ4yD6Jb3aRg3/eJPrnPqoeEXhJx3mZiRWkW++5ZD8yltfAcmDG2joKf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="413634398"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="413634398"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 14:01:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="732289681"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="732289681"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 10 May 2023 14:01:26 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 10 May 2023 14:01:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 10 May 2023 14:01:25 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 10 May 2023 14:01:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNAo0LWHQXR5SYmsL3LmZzhagpqPC9j4LV0rG/DskFzpBa40BCeN1HEwF2u+HwVcELTT2ovNupQL803G6KlIqkHfHRoEFrajxngpzv7rVSYfWLlgRI7MEl5VWjueblWDImBWqVV4FY2s9Mev7FQtV1z22uwSixPYVEuD61RBawF+k2oTMtZEbxAgb5uYva2Q4NaHhn158O4k44iM76sum0DHF6DU7L73ez4/V+qDNKdjCo9KpBGECLRTiRD6SmK5bKwozalpJArzUKpPibsWzfuSBEembQNRQZekwl8D/rCAfKPhzOOa+uVPlRoaLKP5X9FPZxeqHVJEyY0vDWFGIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZXO2tIddQwXYOabhWVeEbvhpUQICAdym9clJnobX/GI=;
 b=CPSDL0nIQiqsZ/hzhKEI/bkCD/sGI8kfZbNfQLtevMCzk14JTNPiZDoFF4kDpP+M0UfOjpjNO7ZAwTHtIPN9GVCZ60RnTxhcUJfiT29PJDUo7TFsJCetDPUYNfVJLDzfhJrS9HOJhA/gpTrBsh7rhgpaUwXL/SHiImWC5BH1FRqHAfXG8+MnMQj47ijiX30T4vuKHz1yPH/tbHcjv+QIaystyL3tYFeEp0XR62cea5RmZMZmdPjcswDOKigKBL3aye7ysuXTueufm/UIIqUaY9dSUm0wSe6zLd7x5hbbC9ieUnYI/5GZN+xiQ/5+UvMg8olK1pTZXVXcDU3m678Jrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB4239.namprd11.prod.outlook.com (2603:10b6:208:192::20)
 by CH0PR11MB5235.namprd11.prod.outlook.com (2603:10b6:610:e2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Wed, 10 May
 2023 21:01:23 +0000
Received: from MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::e585:1863:208d:7e7b]) by MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::e585:1863:208d:7e7b%4]) with mapi id 15.20.6387.019; Wed, 10 May 2023
 21:01:23 +0000
Date: Wed, 10 May 2023 14:01:10 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Message-ID: <ZFwGFmwJseFPGwIv@msatwood-mobl>
References: <20230510195424.3045127-1-lucas.demarchi@intel.com>
 <20230510195424.3045127-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230510195424.3045127-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:74::17) To MN2PR11MB4239.namprd11.prod.outlook.com
 (2603:10b6:208:192::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4239:EE_|CH0PR11MB5235:EE_
X-MS-Office365-Filtering-Correlation-Id: 6af29f4d-d22d-4454-cad0-08db5199b657
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kEqiiHy2Uiduro6gMZT5dA4Cein6MpBpBxCD2jcQEKvJYeUWXS23x9gq4jQt7h2vu+0excIsFIFnuVn7MOudleuDCBOGYOn4UW0Zbm+T8Le/Bmx2ekdfXfkugfnq+eBqea60D8vk32Yu6iRrlMrZ9E+fVhotSv45cbXpB5TqfqpaP8rcektxsu/kp0iCp1GhCxs70lLd5WEk2MUUrTReQ9s3/UAHJZW9EL1dibMwoDHX2IKh/IMx6RDCkybK2oyVGtnnJeTG+JzfNdbHaufXU5vr24ilUulzED9r/cJATYocrsYjkCYMa/qJfijbNo/SLME6L60Zh2N5zCFyNvxYasIxUxMVW5Tv8aDBypzXUrnxh4W/NgKHODmt/Vi9aKhUVa6ZsOHBAgbIQ1Q8wZZLe3kL+iMvHsJk59/aLU4H6DC5daLLINg1d08CxCQDcd4qaQxDeg09KtomKqcu7X/BQDqcq4CvI1Xpleg+pmsppImWuDUV6O3bTFHmLqDe2y411aqLLcjfQrQi5zgnERxQZR0ADEj5He1EnAt8TWS61BmKVAgvvVG8uWKc6/MZKtEqtbAosaO9vlkXyaULScHzXh0R2POOATNVeQCsY7sLUoI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4239.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(376002)(136003)(366004)(39860400002)(346002)(451199021)(41300700001)(186003)(26005)(2906002)(6512007)(6506007)(5660300002)(9686003)(38100700002)(82960400001)(8936002)(8676002)(478600001)(83380400001)(33716001)(6486002)(6666004)(86362001)(66556008)(4326008)(66476007)(66946007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enNaTHZUellCOVNVRSsvU0hzcjhvdVkvRVZrbXIxeU9sUnRUdURlVldCR005?=
 =?utf-8?B?Qjg0a1grV2dLRDRMcGdDZXp1dUpEaGdOcjhkZ2RLcjg5K3FKZzhKSlpNMWov?=
 =?utf-8?B?bzM4NWRKZ3NxdFFzemNwRFRzV1JOR01ERnUyS1N4N2F1K0lXODVncVZtNXVv?=
 =?utf-8?B?Rjk0SmE5Q2hreWFaWm9uR0VJR096V1NvcXZuNEtjR0FLeHNMbDE1dExqamEy?=
 =?utf-8?B?MFRFV1o5N2hOUEYzTkNLZ3ZxS2crTSt6blZvUFR4cWgyTFlXNU1ydTRkNHA4?=
 =?utf-8?B?T0JoNGVvdUQwaEpkaFJKVmpsSzNVTTVnRjlsUUJEcXR5emM0Vm5wMHhjSGZt?=
 =?utf-8?B?K08xUkRVRFNScElvSnRPVDJucWJiMmhEbXduMkpZU0Jnb0RYTFFQdGVFek9p?=
 =?utf-8?B?d0dUOE9mSUoyemdOY3FEUnB2VGlGWEt6cGUrc3JXQjNQL1BxeFQ4bVRsWWVJ?=
 =?utf-8?B?cGpEU1dnRzExQXdSTmF1UHRQY05FWWtxVTBxUjZQLzZkMFZKREN4ZnYrUE5x?=
 =?utf-8?B?S0cwM2lFWnNjRzFJSEpOaEI0Yi9rZHBnaURwTDZBY08wbE9pdEFtQ29KMGF2?=
 =?utf-8?B?SFZocDdzSWtOSGIwcWtzN0ZrT0dmVnRRRE5XbVgxOG9JT3JKSW0xQXJuaFBq?=
 =?utf-8?B?eURCU0E2N2VJOFRrbDYrSVU5cy9kNkEwNVJ1K251allzaVdwTGk4RWZDVit2?=
 =?utf-8?B?cE9jSUJrclF2RzhVWTM1M2Y3MU93TmlDaVN2K1hhODdXU0s3RzNnbXFxVk9k?=
 =?utf-8?B?ZEg1d2wrVk1sLzZlSFMxdXVadEJHK29jTFVPM0pXWFRBbEFOYXd5OHltZ29u?=
 =?utf-8?B?SmxDTk54NjRaamxjQWNFRS9wRXV5L3FMek11VWpQaHdTOXlLTW40eFNwL2JX?=
 =?utf-8?B?V1cvcG1wOUdVSXFBckdHNGJaYitiOE0rbnROZEtNcFY0ai9QeEpPVUhDclVt?=
 =?utf-8?B?ODBBSUxQSnZBSjhXOEcwaWtzZ0tNZ0s4emJlSVFyRU1FRmlPcjNmRExKaDVS?=
 =?utf-8?B?MVhTTlVaM1hKdjBWVFo4N2ZVell3VlVDYlM5ZTBZcm5sT1N4SHk4NVJCQW1R?=
 =?utf-8?B?VFR1Sys2UFd5Wm9aWXVVbmlpZG9TOXQ1czdCbzJpV1lrUEhKcnFZQTZQTDdO?=
 =?utf-8?B?bW92cGtOYktvNnZYREpUZFVMemlQallMY1M5TTArRHpZRElOcmU5WlJtSmx5?=
 =?utf-8?B?OUtIdWFuTVNjVGVtM3MzZi9lbnpuMUVpVXJ6djhGOVIzakFPOU0wcVhoVzlK?=
 =?utf-8?B?QnV4MkI1MDdUQ1dZeEJWT1RPaVE5THFjNG5GUktJSFpUclQ5VEhiM05Sa0xu?=
 =?utf-8?B?OUpQcHBpUzRvZWdHVTFtOFNSTjBDYkVleHBZaElmeFpBQTZiMnkyZTdUZjVN?=
 =?utf-8?B?QlpUVHdVcCtCWUpteXJ3Rkwxa0VFQ1RPNFRKSjdka2JoQnJFU3c0Rjg4UkpQ?=
 =?utf-8?B?MUVuUU5yUlpwcDBZbjlRV21NaE1ubkNWRDBWaldwcmlpclJzN0RSOXFTSzgv?=
 =?utf-8?B?aFdWS3ZTdFp0SUlCQVpTckNocFdSTmozNTNybWxIRy9PNEZ5eU5TeFlkYVVk?=
 =?utf-8?B?SFdEU0VYT1E3OTNMMzdmSWJJYXo0NktyU2JLcmxJVnMxdUhqVmtIRG1pWUNW?=
 =?utf-8?B?UXZLSENZSUUxM3RpUjJEejlsR0k5NUZVN2pVSTZFVmdNZW84R1h3QmdTaHlL?=
 =?utf-8?B?bmFwL2oxYkxscDlqaGE3K3FWWThhZVMzL2ZXZXFveFFaNmw4ZkZXdnN2WTlr?=
 =?utf-8?B?UWxjVjRvMGVMTEdEclc2V0MwdlFrVHhZTWlKcGRJQXhkcU53dFBwdGFQVzJB?=
 =?utf-8?B?MllGTC9VS3FweVR3S1FqK0l6T3ZmNjlZNjc4RzcvbzdkYzdHK1hDRS9xdjZC?=
 =?utf-8?B?TzNDT296SmI0T2VoMUhQY0RjcFZJSS9RT1lld2ZZNktMYUFBRUx2aUs3aFhZ?=
 =?utf-8?B?V243c3FXN2czSjUwamlhbGlXMVk5cUVSWlh5Rkx3T1NvTm9GVFB3MldPMEk3?=
 =?utf-8?B?L2xIczJUWkRxMk11WDJZR0dVWFpRSXdJTFNoNkUxRjVtcXlvY0xWQmpEMGRN?=
 =?utf-8?B?ckRpSE5rNkxZOW9uMlFaM2dWd0EvZlpacDhjYjhTRDd2dWl5aFZHZU9Uck9x?=
 =?utf-8?B?S0h0ZTBCckNkSTJjcFpwdnJHY1pQZnErMHNXNWVpQkNMTHY1cjNkWlBQZGRi?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6af29f4d-d22d-4454-cad0-08db5199b657
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4239.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 21:01:23.6673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: guhocJVJpHmCrjPA0+EG1DI/cmyJ0iKn9IuSXuXBQoGpPdnDMXOkNI0ZvYPShsrQxfx5ICN1L+5bTO2FIf+W3SXcfdGsroxjdUc5R670bhw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5235
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/4] fixup! drm/xe/display: Implement display
 support
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 10, 2023 at 12:54:21PM -0700, Lucas De Marchi wrote:
> Remove a bunch of ; that shouldn't be there.
> 
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_display.h | 38 ++++++++++++++++-----------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_display.h b/drivers/gpu/drm/xe/xe_display.h
> index d1af8e3a5c0f..84c556111c91 100644
> --- a/drivers/gpu/drm/xe/xe_display.h
> +++ b/drivers/gpu/drm/xe/xe_display.h
> @@ -56,36 +56,36 @@ xe_display_create(struct xe_device *xe) { return 0; }
>  static inline void xe_display_info_init(struct xe_device *xe) { }
>  
>  static inline int
> -xe_display_enable(struct pci_dev *pdev, struct drm_driver *driver) { return 0; };
> +xe_display_enable(struct pci_dev *pdev, struct drm_driver *driver) { return 0; }
>  
>  static inline int
> -xe_display_init_nommio(struct xe_device *xe) { return 0; };
> -static inline void xe_display_fini_nommio(struct drm_device *dev, void *dummy) {};
> +xe_display_init_nommio(struct xe_device *xe) { return 0; }
> +static inline void xe_display_fini_nommio(struct drm_device *dev, void *dummy) {}
>  
>  static inline int xe_display_init_noirq(struct xe_device *xe) { return 0; }
>  
>  static inline void
> -xe_display_fini_noirq(struct drm_device *dev, void *dummy) {};
> +xe_display_fini_noirq(struct drm_device *dev, void *dummy) {}
>  
> -static inline int xe_display_init_noaccel(struct xe_device *xe) { return 0; };
> -static inline void xe_display_fini_noaccel(struct drm_device *dev, void *dummy) {};
> +static inline int xe_display_init_noaccel(struct xe_device *xe) { return 0; }
> +static inline void xe_display_fini_noaccel(struct drm_device *dev, void *dummy) {}
>  
> -static inline int xe_display_init(struct xe_device *xe) { return 0; };
> -static inline void xe_display_unlink(struct xe_device *xe) {};
> +static inline int xe_display_init(struct xe_device *xe) { return 0; }
> +static inline void xe_display_unlink(struct xe_device *xe) {}
>  
> -static inline void xe_display_register(struct xe_device *xe) {};
> -static inline void xe_display_unregister(struct xe_device *xe) {};
> -static inline void xe_display_modset_driver_remove(struct xe_device *xe) {};
> +static inline void xe_display_register(struct xe_device *xe) {}
> +static inline void xe_display_unregister(struct xe_device *xe) {}
> +static inline void xe_display_modset_driver_remove(struct xe_device *xe) {}
>  
> -static inline void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl) {};
> -static inline void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir) {};
> -static inline void xe_display_irq_reset(struct xe_device *xe) {};
> -static inline void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt) {};
> +static inline void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl) {}
> +static inline void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir) {}
> +static inline void xe_display_irq_reset(struct xe_device *xe) {}
> +static inline void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt) {}
>  
> -static inline void xe_display_pm_suspend(struct xe_device *xe) {};
> -static inline void xe_display_pm_suspend_late(struct xe_device *xe) {};
> -static inline void xe_display_pm_resume_early(struct xe_device *xe) {};
> -static inline void xe_display_pm_resume(struct xe_device *xe) {};
> +static inline void xe_display_pm_suspend(struct xe_device *xe) {}
> +static inline void xe_display_pm_suspend_late(struct xe_device *xe) {}
> +static inline void xe_display_pm_resume_early(struct xe_device *xe) {}
> +static inline void xe_display_pm_resume(struct xe_device *xe) {}
>  
>  #endif /* CONFIG_DRM_XE_DISPLAY */
>  #endif /* _XE_DISPLAY_H_ */
> -- 
> 2.40.1
> 
