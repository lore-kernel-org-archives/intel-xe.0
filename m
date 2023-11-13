Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9F8C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 20:30:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A4010E17C;
	Mon, 13 Nov 2023 20:30:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C8F10E419
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 20:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699907433; x=1731443433;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=APrcdY2Ng3BTeH/d+Q8y5I7zGZ3AoDbOqLqKJ3n+tlA=;
 b=gqIENeHyWYG/qmUQvim2s7cVKe2dr11MORSwBH4vTDe27hUPJybW6Cy+
 sJ8dCr09qEJO5wVZ/gF018NW3HxcpMwDQxZS7Hiq0AipvzOKZ/GG3Qhy0
 +683AS36fP5iWZWAs1PMsC13i9zjao2XGmXbjZGTIWsi2MVDmqxTPnqeX
 OS6cfC48ryUPxV0MC8Bdu5vYvRfkn5krIOKfz6x5DZiBXzbZiky/jDTFC
 MbexxQqqRlqlJEy2R6gE0HUoaVcy26dEWD794i1zAroE89G39PNNkluBL
 pAXwBrViwgQuEYWXhnziv7hzxKy4a5Vc9VJ1KpYi/TvpmS9jqlJEz1tL3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="3593594"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="3593594"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 12:30:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="5571905"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2023 12:30:33 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 12:30:32 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 12:30:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 12:30:31 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 12:30:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HdB5Dx191xcLUy1BxLe/k2bXxoSayBGMzz4TRcT1C9beXvnVGVa/YZ2LcSz2v4kSDaXKtHP546a9csZIPnE27rpi5w8wC5vm8gJ62ae2qv9KmlO+WkZVbHxoqEmo8GdBc+42H6e5iKHoLm72hA9JzTpm1no4uPUR0LfW7h6k1fq9KzGszSssWilv1xk97/h2gh3KOVcq25Y8UmA8ZsBbdE3Tg6oHkm02/BJbsa8ER4b80bbTMB8RF8uEmi7R8hGlGZUCPq5vADj9m+d2AAqOksvoTewciZi4Nff2sTABfGB2Dj7ZxFGfMFrOpHZP2Som/3dQPl98/qLTqpMK1Fo6+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15L/ER/sle2G9wphXKAK3R1/XasnB7+bDmcrYRGDXnE=;
 b=Bg0cbxLUMmsMisGm7Q75xZs8+1bWuYgKnOnqAvhdlN63Z8FgHN/zkVV5lVoQWnnsW5AdVaEgtk4cvM4kT2rHWk5D/iSGmxRnaKh1SPaC6LibR5pIpp4aAk2zjMQuOs1JNFHiFJcCU3PwjV9h6E4VDeGmLCP41K7EoJY3FDn68lxipiVuU//Olw1y+gPKIju014dU0709NDlzVs3Xwu2iPmedPmHPLSvVtOm8UYNBeeiVej7E9PUGmhTG8seqpOhYagXr7DbJhKjrsumCcxTYnw7Lch5d1QRmyPYG0QkwzOYCOQmJ1w1tQfozp5CKUvI/vApTGlpc0CGAph8s/7L95Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MW6PR11MB8412.namprd11.prod.outlook.com (2603:10b6:303:23a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 20:30:30 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54%4]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 20:30:30 +0000
Message-ID: <e97a2cce-2b78-4b59-9b72-561ca24a58b3@intel.com>
Date: Mon, 13 Nov 2023 12:30:29 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: <intel-xe@lists.freedesktop.org>, Patchwork
 <patchwork@emeril.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
 <169844600642.19711.12449247381862472728@emeril.freedesktop.org>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <169844600642.19711.12449247381862472728@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR06CA0018.namprd06.prod.outlook.com
 (2603:10b6:303:2a::23) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|MW6PR11MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: 2899184c-5409-4cda-2a8d-08dbe48760c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OC+LfmjsqTlzcBehpmLew+cVtflObPuJCNjl4OJyudjUFqTaiOvse4bImCjwq2T68jR7LXhh85h5eOJS/JMo9PWzz6B0KVYtp+D+ZAI484dk1Ly16xAZ62ZCXvN4dPksxZl3YcOhjYxNBQbQ5w3mP44PDZzCQNIfcYAbAUq0RmjVOZ+VuGha3tIoZ9psu/1oXtCqrU3MmEkxx6MmHrDmCIja6XiyN1wFbP7RmmiDCJzPuhP9scc5oDGK8C1p1UNcF0WesZFJwIlUdhpVKPhsIOjd89qDehBPRys/F+DAIFdUXZn3qtC1dUQnu5dSAZSpTqyv3EA7zBmnDAMVkXbLHB9hnitn3MAooyIcEsgn8tlUXTNCKFgbIyFq3DmzMxWZoCxdEoy/iTRuAL3D4/pXQwad5NA+EvuLJ0pecl2uki9ng/QnY6T++jZpZtQETrKmBc+m6Nm5NTR2UuWNphY96Cm/14UCkkiDjDBT7TZ3NK3Ig8HmZoyLUqkMsx/kBuUgUI2F9gzdg212m0TnsbSX8z31mmBoLh4FnjAY6FG0I5koHyaffvETEHdv4/V8innB8bzN8Lzw6ZwNjDQv2BE3Hn3xCDZjBoum1KhRRKOXcQYfa3rZ3D0dTocrvN1Zk/QQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(376002)(346002)(39860400002)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(110136005)(66946007)(66556008)(66476007)(6486002)(316002)(478600001)(966005)(6636002)(86362001)(5660300002)(31696002)(41300700001)(36756003)(8936002)(2906002)(2616005)(26005)(31686004)(82960400001)(38100700002)(83380400001)(6512007)(6506007)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzFkZ2ZQVkFzY3lqb2R4Wmtkam04OTBoMER0U0FYYThraHh5TkRFZnpxSnR6?=
 =?utf-8?B?dTlIOGtuZFp1ZTNuYXZjR3dhQURKWGxuNWsxN3k0akk3a2J6MDBmcTczaXRW?=
 =?utf-8?B?T3NGVVR3dmk3WmRpbWVOb29aanpiWE90cDJIUDRaRFIzWmQ1UWc4TVJncGhl?=
 =?utf-8?B?cGNSeHdLeGhVUytJUHM5aTk4K3B6Y21ZY1YySGkzS3RQNVNnYTNVYzBWcU4w?=
 =?utf-8?B?aXJTd21pd0RtQWpNSkpqa1d6bzRlWERyN3FTaTVVVldoSWlrVGY1ajFlRVZk?=
 =?utf-8?B?NE51L0FVNTRjT0ZkZWFSdkJSckpqRzVJUUlXcEVOMXR5VmlTUVBDUGNEK0VN?=
 =?utf-8?B?bEFKdWloaUFzcmhjd0xxM2RxTVl4Q2poMFVoWGt4NFF4TXdrMjJ4WE9iVSs5?=
 =?utf-8?B?UDFiRDA5MzhCN1dGNzRFNmw1WE9vYVpZOGNEdzBHSlZBWFZ0c1BmKzQ1ZWlX?=
 =?utf-8?B?ME9iek1qa2s0aEI2ckdudWtXZGZNM1NjRDcxTTlsTzZGYlRoVkJkbldTL1pQ?=
 =?utf-8?B?bXNFYlNQTm9XSUliU0xSS1NSbTZwaUc3TnNJeU5sWXl5dkhkQzJFaWdNZktv?=
 =?utf-8?B?c0V2TUlpeDJpSlJIaWQrcG5ISUk2bkpxMHpHa3lGRDR6QTY1TnJXMjdMRUJZ?=
 =?utf-8?B?QmFtWkZOZm5IQlY5ZzgvNFlTcHZZSVJ0alJJaHE2Zk80d1NVWFIzTk1tZk5n?=
 =?utf-8?B?QlZkUStFb0hJZmxGbjlnbGNaVjlLbnpZQUVMMm9mQ3hqaE16L2d4NVhReWVX?=
 =?utf-8?B?R25rYXBRZ2VJd0toTzNERFpDNFdudzFzUjZGaXdsU0JFdUgzeU5CS2FYYThG?=
 =?utf-8?B?Tm04b0dDR29hQTc5a0Z1akJZY3ZvOEJiQWRSS1pSTmJIQmVzdTBYeHd6dzFx?=
 =?utf-8?B?aVE3ZVBRMFhUNW14UmIrbjg5bzhFclMxcnJDQnNaa25VQWh6SnMvWXUrWlNh?=
 =?utf-8?B?cGdpTWxEblMwMmJ1UlRBOVdnSVUybTVLV3g3U1NnM0UzWnoxTWRRdENNMnFt?=
 =?utf-8?B?U3l1TUxtTkoxbUJNamlsMnlPYkNpakRFK2dEUTJldmFCTWpzUFdBRkVnQS85?=
 =?utf-8?B?Wi9tOVlQcE5EL3JQL2hBT0pJWHNQSHdtRjBPSyt0WlhTRXU3Y0VKTHJLWnBJ?=
 =?utf-8?B?TkhqV3dhREJnVUR4R2NCOU5IZWkrTkViRVZuQzQxK28zWHBzeU5tWnZ4NGE0?=
 =?utf-8?B?aElwNUtYYUFyL2xRR25tT2FxVVcvYXhGSDFEb3VBUy9SL3VYaHRpakJ4eWJu?=
 =?utf-8?B?WWQzYmxTZlJHZnE4ZWpSY2pMRGp2V2cvYTZNUjhUZWhZVWJGSTV6TzJWSitF?=
 =?utf-8?B?bnJRcVptV3N5TEpnOEVMZ1BhZ0ZtS1NsbG5XTmZUNzFERnl3UGdWeWpvQzhr?=
 =?utf-8?B?UitndkYvakd4T0N0RjZXTTVuWU1oTzA5ak9pWjg1ZUd3SXhscWNTVlJrN0JN?=
 =?utf-8?B?SnBRRkcxb2h6bFd5N2dKRFJoNG1XQyt4ckF6T0RpWGUySzlIaThLNEIzYWdX?=
 =?utf-8?B?dFI2Q2V1dlVNLzlRa2dGTEMwQy9mQWovc1FUQjR2cU9TQ1pucThnaEZzNEJt?=
 =?utf-8?B?QTlEcUYvcU4zTTYxZnRsV2RjTnp0eitBb0lMN1E4Tm41NUpnNXAydzhsSVF6?=
 =?utf-8?B?bzR0UEMvbS9sRVpwYzd0bm81NDNvaW53WmxHWGd5NVZYamFhVW0yK0I2VzNG?=
 =?utf-8?B?S1pWcjlwZFdjQ3lLVnR1REo5Qkt5VFpVSnZsVzNQdkxTV1pYTjBsNXlYdDZZ?=
 =?utf-8?B?aXIvclRVQ2M1OEFTeDV1RWRscThGYmNBb1NXR2ZaQWJqSG5mdGYybTU2cWpz?=
 =?utf-8?B?bWZjRUJEY1FRNmo1MllLNUdvVDRYQnFYQ2l5dVNFV1lpNE81WnhtSWxObnNM?=
 =?utf-8?B?cG9vYTNSaUt2VGhJdVQrbnZsOGpMYWM1RTU1N3lYdFZXNTdVdFUvMksybFJR?=
 =?utf-8?B?OG43ZE1WWjBlU1dHeDN5MW1tSkNMS01wNld3WnlJTFlhZC85Z2UzVU42MEVK?=
 =?utf-8?B?K0R6c3dDeFRDR21XQ3RYWWxUSWx2OStWbUV6NEs4OVlTQmI0NlFOME9nRnd6?=
 =?utf-8?B?T08rMitOdjlWRHAwV0d4RlRFQ1dDOGFmNTJ5QXZ3NWg2SkhuZW9IbEh5ZGFU?=
 =?utf-8?B?Y0FNdi81cjZpdTNUVmI0aGV1N2FDYzZYYjZOV3JqU2FoZWNseUdKMkRYVUFu?=
 =?utf-8?B?VVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2899184c-5409-4cda-2a8d-08dbe48760c8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 20:30:29.9801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: siHake06fmXfBQEsVFIZZZpaHMgOo294GTh6XTCNB6cSUleLgsUqCcsv1RwfrwePUaONrL8AwDoKfm5hzLf1vQgs4Mb3GiV0l9h178yVEp0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8412
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_GSC_FW_?=
 =?utf-8?q?loading?=
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

On 10/27/2023 15:33, Patchwork wrote:
> == Series Details ==
>
> Series: GSC FW loading
> URL   : https://patchwork.freedesktop.org/series/125717/
> State : failure
>
> == Summary ==
>
> + trap cleanup EXIT
> + /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
> stty: 'standard input': Inappropriate ioctl for device
> [22:32:58] Configuring KUnit Kernel ...
> Generating .config ...
> Populating config with:
> $ make ARCH=um O=.kunit olddefconfig
> [22:33:02] Building KUnit Kernel ...
> Populating config with:
> $ make ARCH=um O=.kunit olddefconfig
> Building with:
> $ make ARCH=um O=.kunit --jobs=48
> [22:33:23] Starting KUnit Kernel (1/1)...
> [22:33:23] ============================================================
> [22:33:23] ========================== xe_bo  ==========================
> [22:33:23] [SKIPPED] xe_ccs_migrate_kunit
> [22:33:23] [SKIPPED] xe_bo_evict_kunit
> [22:33:23] ===================== [SKIPPED] xe_bo ======================
> [22:33:23] ======================= xe_dma_buf  ========================
> [22:33:23] [SKIPPED] xe_dma_buf_kunit
> [22:33:23] =================== [SKIPPED] xe_dma_buf ===================
> [22:33:23] ======================= xe_migrate  ========================
> [22:33:23] [SKIPPED] xe_migrate_sanity_kunit
> [22:33:23] =================== [SKIPPED] xe_migrate ===================
> [22:33:23] ========================= xe_pci  ==========================
> [22:33:23] [PASSED] xe_gmdid_graphics_ip
> [22:33:23] # xe_gmdid_media_ip: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_pci_test.c:45
> [22:33:23] Expected mask == 0, but
> [22:33:23]     mask == 67108864 (0x4000000)
> [22:33:23] [FAILED] xe_gmdid_media_ip
> [22:33:23] # xe_pci: pass:1 fail:1 skip:0 total:2
> [22:33:23] # Totals: pass:1 fail:1 skip:0 total:2
> [22:33:23] ===================== [FAILED] xe_pci ======================
I assume this failure is not related? Not seeing it could be connected 
but GSC is media tile specific...

John.

> [22:33:23] ========================= xe_rtp  ==========================
> [22:33:23] ================== xe_rtp_process_tests  ===================
> [22:33:23] [PASSED] coalesce-same-reg
> [22:33:23] [PASSED] no-match-no-add
> [22:33:23] [PASSED] no-match-no-add-multiple-rules
> [22:33:23] [PASSED] two-regs-two-entries
> [22:33:23] [PASSED] clr-one-set-other
> [22:33:23] [PASSED] set-field
> [22:33:23] [PASSED] conflict-duplicate
> [22:33:23] [PASSED] conflict-not-disjoint
> [22:33:23] [PASSED] conflict-reg-type
> [22:33:23] ============== [PASSED] xe_rtp_process_tests ===============
> [22:33:23] ===================== [PASSED] xe_rtp ======================
> [22:33:23] ========================== xe_wa  ==========================
> [22:33:23] ======================== xe_wa_gt  =========================
> [22:33:23] [PASSED] TIGERLAKE (B0)
> [22:33:23] [PASSED] DG1 (A0)
> [22:33:23] [PASSED] DG1 (B0)
> [22:33:23] [PASSED] ALDERLAKE_S (A0)
> [22:33:23] [PASSED] ALDERLAKE_S (B0)
> [22:33:23] [PASSED] ALDERLAKE_S (C0)
> [22:33:23] [PASSED] ALDERLAKE_S (D0)
> [22:33:23] [PASSED] ALDERLAKE_P (A0)
> [22:33:23] [PASSED] ALDERLAKE_P (B0)
> [22:33:23] [PASSED] ALDERLAKE_P (C0)
> [22:33:23] [PASSED] ALDERLAKE_S_RPLS (D0)
> [22:33:23] [PASSED] ALDERLAKE_P_RPLU (E0)
> [22:33:23] [PASSED] DG2_G10 (A0)
> [22:33:23] [PASSED] DG2_G10 (A1)
> [22:33:23] [PASSED] DG2_G10 (B0)
> [22:33:23] [PASSED] DG2_G10 (C0)
> [22:33:23] [PASSED] DG2_G11 (A0)
> [22:33:23] [PASSED] DG2_G11 (B0)
> [22:33:23] [PASSED] DG2_G11 (B1)
> [22:33:23] [PASSED] DG2_G12 (A0)
> [22:33:23] [PASSED] DG2_G12 (A1)
> [22:33:23] [PASSED] PVC (B0)
> [22:33:23] [PASSED] PVC (B1)
> [22:33:23] [PASSED] PVC (C0)
> [22:33:23] ==================== [PASSED] xe_wa_gt =====================
> [22:33:23] ====================== [PASSED] xe_wa ======================
> [22:33:23] ============================================================
> [22:33:23] Testing complete. Ran 39 tests: passed: 34, failed: 1, skipped: 4
> [22:33:23] Elapsed time: 24.485s total, 4.192s configuring, 20.173s building, 0.098s running
>
> + cleanup
> ++ stat -c %u:%g /kernel
> + chown -R 1003:1003 /kernel
>
>

