Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCEAC76196
	for <intel-xe@archiver.kernel.org>; Tue, 28 Mar 2023 18:05:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7309810E96F;
	Tue, 28 Mar 2023 18:05:50 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1732E10E96F
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Mar 2023 18:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680026749; x=1711562749;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1WnSCK00v3MCrMo9sBQDYmPpqZzfrx8nrlMElc2Lca0=;
 b=YUc2wNmC/II32WfO3Mq/AwFqZUSz4JZ9RfsB7pLIWXZVtsjzb8QUeU8z
 plLRTCg8Tgpn8UUigxohqXLQ9VR6IQKIpCYVl3e9GcfKbcJ4Ey+xJ9iVc
 5OwHbJ5GYqa2VI2chaKiZTNtYXE3vCPOuaQ5tWAVVTxfZpVryUMHOUH6Y
 osCOlJzHhWkXMfU3pRYAplR4rYhna5Po3VBFdh4Uv214Lyc0Hpxi66ol9
 GdbQMD4cyOxZhPKZ7KrqaOoinEljYioDl2FK+7cAXerynKiV0r2NcjpwV
 s5HP4j3pdC/vIDmwhckBIPUdHko/qAIecA2pCsB1is+ADr+8SmoqGeVTn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="368417320"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="368417320"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 11:04:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="634155827"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="634155827"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 28 Mar 2023 11:04:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Mar 2023 11:04:56 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 28 Mar 2023 11:04:56 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 28 Mar 2023 11:04:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YWvBAHP+B8RLzotCTN6mPG2Y2FKXOdlxDrxPV4xRk7v0doLtYwuPw3hRnv4pX5tZGBCevxYBUsktHCKo2dluZSZOjbhE+NRldOiIq27JNfeCLIoI9uBwtEY09ow68gNbUnRwoPondfY+w38xPjsMSqvOW2EiY1HgKZtQ6oCRmjXHOE51eFDn91sNRwaESw62KWN2yb/w+JC/yQF7z4ArWsbPwNi3jI2xXjBiC7RcTwf1VTETaCUMBA96gD0Z4YcIIbKYI05gWlONXZhk7d2G2KdWJ90l17oFpd7P3q1KzSutw55SfSqQHzn4nJ0d9sxO7ZPzotLFZ5iDwzwtqXerKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+MfSi7ABNuTKEbHep0INmCvCVjE5PUdsm2dJd2y4Xs=;
 b=GRuNCrA4t1HGDwArMaLX8C34BhE5mG6OmiwPCV+qBLo+JtRp+2PahXvVvOHBUJU59JJGwOLr1ctXChvilLF1s5qfa+lsBICpdZN7HapKML7YkAEqPPjPtoLH303HvvXQ8xmfxtImgqBsoHqPjpRPg0KQ0hWAqfkhwFIXljqURQYp36pbzVgwH/jucgONBslaKsLLrkqWiQZZd+nzMPW46df8NKATixQ0kAsndM+Vdg8w2cZgANBwGzpCLm8YmVb3FqICXGJ+P5aQScwlKbStcli+gkSfdDKWHe0/TB52S/wx1R3pzdPiB2orgk3UagPhoOtDlZMlMrYRui6fjNSbjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6032.namprd11.prod.outlook.com (2603:10b6:510:1d3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.40; Tue, 28 Mar
 2023 18:04:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc%5]) with mapi id 15.20.6222.033; Tue, 28 Mar 2023
 18:04:52 +0000
Date: Tue, 28 Mar 2023 18:04:09 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <ZCMsGWf6YHBwLydU@DUT025-TGLU.fm.intel.com>
References: <20230328130826.61029-1-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230328130826.61029-1-zbigniew.kempczynski@intel.com>
X-ClientProxiedBy: BYAPR02CA0072.namprd02.prod.outlook.com
 (2603:10b6:a03:54::49) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6032:EE_
X-MS-Office365-Filtering-Correlation-Id: 6304614c-08d8-4e01-c6b3-08db2fb6eda7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kI/ANQvAwoyM9f3VsnPQ2qTl+NdKUrgvTov4LfDB6DomzijakvIZ7yhZ04l+y0qm3bNlICALUOjvFfaEEEF4sznOOe+BYfWKvxoTi3tb3HJqmOOxKQ/4KWxgFGNANvgVyo0m1nDh+UXW3uPbJQ0AaO8FJiqvGTbWs6DpspNTeWtB77tBiMV4BUZ2mqDEIBMQ+XGaqUEaW8AIctiAG9AgkcoBlykXVaZ0ukYYlcDSz95/rXj0yBSBktV7hHuasGqxqf/OhIlADWacEXD0HDQLdRJaaPPCjNChNAX802Wgp/JbJAcFll/PUuh3vXytnfVP7x6pyf/Rw+yYHWH8rtcFVkwRN+CNItSoz1Q87OI2u+nxsocCz8dn2rAbEQKEctBkIz/6aPC5rkY3XckNFb6iqho1Oiw3uLRmNbNaOcP0uNu2Dgnhea39W7WaEjhBil7j5IPWmBMfmCP7EE/VKx/8SJBhsYu5xhvDB9nEGJP+Qn8DUWLJuSIxTdcTgPhYHHVQkW7bggbpK/DFYoBBEh6XYpDAdv5u3WFg19GmYmS9dDrA7WtLhazgenMzsrQI7p9t
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(346002)(376002)(366004)(39860400002)(451199021)(6486002)(86362001)(66476007)(66946007)(66556008)(2906002)(316002)(44832011)(82960400001)(6636002)(478600001)(8676002)(83380400001)(26005)(38100700002)(6862004)(186003)(8936002)(4744005)(41300700001)(4326008)(6512007)(6506007)(6666004)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWZKTHdFTE5nVUF1bmNvUlJTcDFua0FCUkxBWGl1VUkxM0hKOSs5RU53aHNH?=
 =?utf-8?B?d1kwTlMyc2JTMDZqRGY4b3RxZmhJYXl0Ni9hSWkrTkNJMlpWbldjUTAzVXBy?=
 =?utf-8?B?SWRENlFWTU5JU1kxeWlSdThnS3FBeUhCNVRmd0dlQjMwVmJBd3ozVlRjVjM2?=
 =?utf-8?B?eVV4Z2s4MitTUmNnQ2ZHT1NIMDRBaTdoSVNvRi9MVDU5WHdmekZLUEdBSmZk?=
 =?utf-8?B?aGJqaG9LYU0zTTduZjhMdlJFeDJ2YWNNeXpaekhzRDZ6Z1RDWmVROElIUlZS?=
 =?utf-8?B?UmttRDNEL2czQjZERVExQ2tsbStiTXpaS0NWV3ZVTzh1VVI3bGRJV2dURlE3?=
 =?utf-8?B?a3lmbHNGT01zdU8rakN2eFBoTjVmZml5Uk1HMjVIQkthb2dIMXRXSm5YNEl5?=
 =?utf-8?B?clFwVGF0M3UzK1V4YlpCeUE2THRGam04QkpQdXdRTFBCcUM2NllNMnBpSXNU?=
 =?utf-8?B?SkFiZU5aS293ZDBRTkxtQ0xmKzl0ekdSQ0JTZmZSc1Rlb2RXYmhKYVhBTUJX?=
 =?utf-8?B?cG9OdERWRktjVnRIOC9KRVZHcG1QSWl4OWFqcFJCWVNnWnZpSGhEUzlrbzNi?=
 =?utf-8?B?MURsZDRHbU5lbENrNW1PYU1HbFI3Ny9IZC9NK1pUUGxKdmlVZDB0bnoxNUt6?=
 =?utf-8?B?c1NDV2pnVFozWVZRZGVGc3F5dThaajR0UThlWEFjbGxMbTdRaU5sd1N0M1lC?=
 =?utf-8?B?cTYrbDNONXJFMWp0WDMxYmhyNU1DUUtWaFZNWkZTU2I4NEFJcHRpZWVMemoz?=
 =?utf-8?B?Zk44eGxFWS9WWHg2WmZQV1l6aGxjOERuUVMwUUxlc0dkaGxObGd3WFRsOHZq?=
 =?utf-8?B?NkI5b0ovN29PcHZVZnZ2NE1OOVhHQVJEakVqa2Zrc0pQNTd3OU5qakJzU1Ro?=
 =?utf-8?B?cFZGam9XdkcvNk4rRGoxdEIxZUprZ1BrZGdwdE9jQWF3eWs2WFhRNm5MU3NI?=
 =?utf-8?B?UVBLTUt3YkI1S3pPb2IvS21sZjJKWmJyOXltbnZ5NTVCTVBNMmNPRTVpSDRr?=
 =?utf-8?B?YVEraWR2OFIxd2FrN0FjNm5jZHJOMjhFM2daN2xlM3BPcm9nWFJIL2lpdGRs?=
 =?utf-8?B?ZDVTM2dKUENkcGlDdS9MY1graTFKak0xYkRBSzlxTEcwenEzYTA0ZGhRa0o3?=
 =?utf-8?B?VVEybjVmMkI2NEZRMGRhT2Y3a3I2V21LYzVZVkxNVnY2b2tUYWxFczJJcHZG?=
 =?utf-8?B?ZGJpYW5PZzhTZ1kzVUd5c0lrVDR5Y1A0c01wd3JtMmJERENUSW1XMXF1RmJi?=
 =?utf-8?B?YW9wa1l6bXJVVFFveE45akxnN214MG00YVprQW90TUhWcjdFOGNpSU1Wbnkv?=
 =?utf-8?B?MEpUOUNDNzFhMFAzRDk3U05CSW1sMlVpZ2RnYjkyM1dqcFk0NmJvNm1GdGhR?=
 =?utf-8?B?VVlRTG05dVlzUkdXYXFvem41Qmh6emFmMG5RWDNINE1zSlJWckNvNXA0cnhO?=
 =?utf-8?B?d0dnVnlncjRIVkg4VGJENnVMWGxNWmN3U0ZXWmt2VExUbU9qdTBNODRzQjBS?=
 =?utf-8?B?RUwrU0VqM3pkK1JObFErcVAxczNsUFFOUkVEL0FyNEdObDZSdEh0TFJkRFFa?=
 =?utf-8?B?OTBUcmFENWhYRitib1MvQnZRNUpiNTg4MWJWNEcwUFdnOW1jS3RwVU85SHZW?=
 =?utf-8?B?NXM1bVhjdG1nb3UxczZYNDBQTjhwNXBGTDc1czlISEorYUtnLzZmQjdoUHFs?=
 =?utf-8?B?NDRGV1BQaUdlZ0RFRVA4dEJqYk1LaGZDWTZDbTJiNVRDZ2xoSWpiUHBLZXM1?=
 =?utf-8?B?aUd6cGZUczN2MDkxbDhpeWRuTlVkY21sMThqS2Rtc3Z1dlBOb3F4YitGZ1ZW?=
 =?utf-8?B?Unh3SEJzT2FFZkFzWThsTUlWdGtYbm5kek45dWl2aFk1Y3VxOXVERzdvMXZE?=
 =?utf-8?B?czY4K1RYYUZsT0NHWXBiQWcvNVRwY2M2OWo1T0NCUjJyWEwyY2NmSmFLQTZC?=
 =?utf-8?B?N3NTK2lFSTR6Rm9HR1BmTW9mOXFQeUZIODZQUzdBZWw1UWNEdlFtbUhvMjJa?=
 =?utf-8?B?MC9IclM4QlUreFNLQWtzRjRFY01RWXRtVjdZYjYwZXlDUitLSjROc3Z1cUFv?=
 =?utf-8?B?dmh0Q1d0blVBL1BsNk5acmNhMUlud3hNSEY0UGdBLzdJYnhzNTFpQTlucGJi?=
 =?utf-8?B?TW82VXJvbGR5R29OcWpOY29XaWVKRDI3YUcvZ0dzeGFJaDU5SzFtV1loSkJM?=
 =?utf-8?B?dGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6304614c-08d8-4e01-c6b3-08db2fb6eda7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 18:04:52.5710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w+xG0nJPCAkiV/EiBsFS0NI4lpKrXWdBb5w4oXhXkWqwbvisrX+yQd98MqeBPutOUCr2mRPzhu0obblMzt3UIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6032
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/bo: Return object bo size on create
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

On Tue, Mar 28, 2023 at 03:08:26PM +0200, Zbigniew Kempczyński wrote:
> Driver may alter bo size requested by the user. Return real object
> size to make userspace aware how to arrange vm bindings.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index e4d079b61d52..410e797931ac 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1564,6 +1564,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>  		return err;
>  
>  	args->handle = handle;
> +	args->size = bo->size;
>  
>  	return 0;
>  }
> -- 
> 2.34.1
> 
