Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF91EB64DD
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 06:48:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8ACC10E604;
	Thu, 13 Jul 2023 06:48:09 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061.outbound.protection.outlook.com [40.107.101.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04DC10E604
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 06:48:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LKxybDaxzv1sNstjmJaJsDk6ARj/EX/aIZC9ngPKCCt+pFs4K93fFa644b1nDAj0YNsWgv/hxGjhEDodvmyGhPqzMgbp6Ajbu5koN2qV2UJl2R0p2ymlutNloqOrP1onNeoviA0Y1dNrwlxNoo5DXNKsVvW9vjVUsNs+Vkb8fz4FASY6zJUhWG7fDQ0jKbh6xFjmd+PYwrRqtKfUi6L9y5hEsY8Gq1QHPgZWnIY5sr/OfYbODxB4XeqkAhGCeeORyNQWnni7Z9H2vJotV1ZsfDwcMQZuF7zQReJdKQpGdyTvP+os5IsbqBTOCLtcvuNmUGuA4Iqbcxh9DHelzNWixA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avtrlsz4AV3LgSP41IMRWd9IxF6P9+Tcm7metPlMYYs=;
 b=CCBJZxo7TOluWvTx2tUTA3vGfQDz5TLY6zh0KAOwp+tSFEPMgNpSUTy+BOtfJ63eH9WOUm50R2w/JNtG9Tw9YCNTf8qIA6RbOfvGVDU1NrBDaADXDurELnBl5JtoXAoxScfHkA7wNfhekjXloPDX2gfmLag8nbej4mRdgN4rkLOSWpyvF+KF1mAy055tSk1matQyxQJqRWFHafV2JgnvcElfr96TauEfSi6Z+HFajaOjZn6oyRnCv2tzuQGwJ35Ovliwv5iMaXRGBcCJAsGBZc0USS2DNav8LJ8qN5blJ8O1SPKtxK9PJG3N1kaw178+4NZt9gbOecrKCOWw8sx+2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avtrlsz4AV3LgSP41IMRWd9IxF6P9+Tcm7metPlMYYs=;
 b=w4YYa9km+HXydGMZoTmpgbuJ2I167sGkYWm/OXsjJIFOQE7IlpsyS774QL3ZwA6aGklFUjODZaaJP4MCgeKhtTmGTaTHMhCAuWoHP1M1ZvmgWUlquZpFBjxC3Vg/iFPNXsNNK3uM3mvh5CKcVt4Fjo581NZAIs5UsP4Btn+4ZQU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by LV2PR12MB5822.namprd12.prod.outlook.com (2603:10b6:408:179::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Thu, 13 Jul
 2023 06:48:05 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921%4]) with mapi id 15.20.6588.024; Thu, 13 Jul 2023
 06:48:05 +0000
Message-ID: <35909d7f-4885-f4bf-00a5-5c3e00cb82c3@amd.com>
Date: Thu, 13 Jul 2023 08:48:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
References: <20230712163740.7-1-francois.dugast@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230712163740.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|LV2PR12MB5822:EE_
X-MS-Office365-Filtering-Correlation-Id: ba056208-3ce7-4323-c5a6-08db836d1c0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U/Nlu5NrbpWKhO2Hun7fFisizVdFDIiROUjgCbt6KpSTU61C3uBe4iSzHGwsikmTqscU1C7kbeeuiXjYzdCuAYPMY0c71CD3gdKW7hBuG+m1b2g5EYvtWvUO17ezQHx/wQQmRMAUuULE1ptuJOd976dT8dFihHuMbdV/HKgbMxoiXwzz7/41ejxlCZ97AQ0GTNyBaGiXyRLxx355mK2IZd7/VrAk3MZ1ynrNv7FPS/TdZr2qYafX/3zgw2cyjrKYwBiB8ASLtKRBIxLbEiAHxCHnidLZDCFDuEljVKqUrv4+Z4UjABGBygJPHKY/NPpoADYHU2LiFQGiertpeeXKB/AHa1/j/bRJ7tn6xyBMR76hxhXtiUtqY+Xvvvb8qY4UCcHZYgSQGjrMtA7JM7076914dk0uAHQChFaoRncLs15PScWlDvQzJPwMjB9708br4nJDqx3RUCGdVi7U571904WSdv9YDp16/flRCqWgIhtAwWWV/HLsi1x4zkVXLmDJ7b6+apHxegPUH0F3N6/KHvBAPGeSnzm8LCOHCZ0ctJp9zVgdoSxNSTGkR9xXSUIgL9yT59iFHIa/nxSj0tXNeHeZbfzAHzdFPZVWs8ZYQFvBpjzykh6l1Jy0AKJXRwXit0UTV4eC+pynWyZdKrK2ziW4xhSpRWU5wDaMl/QuaIc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(366004)(136003)(346002)(396003)(451199021)(966005)(6512007)(316002)(6666004)(6486002)(66556008)(4326008)(478600001)(38100700002)(2906002)(36756003)(66476007)(66946007)(2616005)(83380400001)(5660300002)(8676002)(8936002)(31686004)(186003)(31696002)(41300700001)(6506007)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXBCWThQSGgxUkw5UTE3QzdRMStadW1nVUtJbFV0VEVxcUY5bkNGY3pxQ1JE?=
 =?utf-8?B?RzB5bG9jaXNSVnlwZjNVU0hnZUVuRlZIYjA3N1o2L002eGJSc1Y0Umx5SEdE?=
 =?utf-8?B?YVFqM09aaTVWbkxGNkdPQlcvUDhHL1h2dG56MkZBTkpjRnJhYUI3L0lVNkFt?=
 =?utf-8?B?U1hObGxqUFFMeGpIeTZrTTRtQlZKZlozdjBDajN6Njd3ek44aGZZTzBGc2w0?=
 =?utf-8?B?S0daSWtlYlB3MEZYeldJNkZTUk44Wm9HSVM5VDMwM09nbmZMejZSWTU3a28v?=
 =?utf-8?B?OE13WFN1ajliYVAzRGNac1ZESkRMbkxRK3NuYjNGZWtmN2k3c1dxWE9VcFBo?=
 =?utf-8?B?NU1SZUo0SWdlM0J4QlE4RGRuQWs4MThKaUtRTXFHNUE1WGVFL3ZVTzFzQTBn?=
 =?utf-8?B?aFBrS0crTndaWFRhSC9lSjVtcHBNSEUxRlRFSDRHajNIWTArOEQ1N3pRRHph?=
 =?utf-8?B?WEpsZDNoUzJIVG5vOTVTdVZZeG51Z3FpTmhaZ0E1Q1pEaHk1NU1VMmhCN2Rn?=
 =?utf-8?B?K1YxUW5ZUm1OajFaTHVFZ25OOWE3UVFZb0lYRGJGT25sUkR0WDVjN0VSQVNH?=
 =?utf-8?B?YlVISmViQ2o2MnNGaXVSb1k1b2NUekN6TlpYanAxenF5M0FtYnZESFdDYW8w?=
 =?utf-8?B?VDEraGZJVmpmc2UrT1R6aUxocmtwNy9mRTkwb0JTZW90V3hRSGdYNkwxTHpZ?=
 =?utf-8?B?VjU2NWhzblYvQWF4dVBrY1lYYnpsVERHcGZiR1NacC9jVDhSdHdnSHRxL1o4?=
 =?utf-8?B?aHBPNTJ3S3ZOaWlJMjhZanFxZHpMTFM5ZUY0ak9XMTZJQVQzK2ZYL09xeXVN?=
 =?utf-8?B?Rzd3Vm5LZVlXK3NsdSs3VXA4NGs5U1F3QUFkbTJxVE5xc0RyUklOcmJpZG95?=
 =?utf-8?B?WkNLbFp0RXBNdjMvOFZOeUFheEtTQnR4U1ZOM1k1eFlINTVEcTFVNDhValVH?=
 =?utf-8?B?VTQ0cERIWVJISFlhcy9qOVRvNVJndVdTYkNBL1hYTW9oYmpMUStKYVVzUjJo?=
 =?utf-8?B?cjNBR0ZZL1V5dTdodW1yNXROdEdpbGRHdXczTWJpcThWeUMzTlRoMUFTSWRY?=
 =?utf-8?B?Ujh2KzJIZUxtWkZIWnh3WEcwRExVQ08vbzZOc3N3T3BzRjlGRklYeFhvbFlY?=
 =?utf-8?B?Wkg3TDFub2VhKzU4TEtxMEdheUQrb2FxaHdJc3pneW1TOFE5TVNuUEIxbTBW?=
 =?utf-8?B?bmNScW5KN2pQUW5aQUlPeERDME56N0M3cnljM2hRbGpVRk9YYWxUdFlkL1lP?=
 =?utf-8?B?MG1pZUI1UUJwUXFxbkJ3UW0yYU5VVitwWUx2UmE4MW96TFRPcGlPcXlFMVFZ?=
 =?utf-8?B?SEIwZ2hqM1VoYndUQ2hZOHFGYWRGb24wTURaU1dEa0dQTVVydVpoenZiZGlL?=
 =?utf-8?B?ZTQ1bzFaek9Ld3hieGVNUlhvN3lGS1IwQ3hTbnU4cElSNUJoNERmdDUxTUc1?=
 =?utf-8?B?QlN1d3JEUHc2YnNzb2E5U09FbTZmT1c2NDdYTGU2MmN6QnB2TlFBQ1JjSStO?=
 =?utf-8?B?Y2JWL3BNUlhGZGJqVkIrVUN5Rm0wSk9kMHlVUWZVaFpnYnRRdHNES05oMDVq?=
 =?utf-8?B?VUFIUy9SVVJ6L2ZlbzN5bDFiSXhmTDJCaFFyNWU2V2RSbGxPVWo3dU5CcVFF?=
 =?utf-8?B?NEJzaUF5TjJMZ1R1NnlOR1gvRVdCR20zMENEQzVRbWpMWlJjVm10cGxKcVhh?=
 =?utf-8?B?ZmU5akYwaXV5R2JpblMvTldTOTc2aHJkNmFvMWJHdlZ6SVBDWU9VNkJFTGNO?=
 =?utf-8?B?TllxRkpVenhHQ0F6b01WWDJ3ajBNMGNRV2hTdGFTMTFNY04rbnBkNFVjdmNN?=
 =?utf-8?B?UzcxOUEwalRXUThzR2xkcUZWRmhtaENKcFVqZGRCd2c3TnMrYlVhYTF0Y3Yw?=
 =?utf-8?B?a1dDN1EyVW5FdWlmSWhuekJwS1l1bERnRXVmUXZnRFAxMFRKNDgyMnJsYzZK?=
 =?utf-8?B?WmsyWHdRS1o0blRpeWJDZmdFL0E2QjZrU1Vid0dVdFRNOWVEa1ZpNkxXbVhP?=
 =?utf-8?B?dmNiOVdqNVFGUjFIWEx6d0pFS3BDR0g5cnU0cEZkaDNKRmJqUkJPUitLMFlD?=
 =?utf-8?B?VFRFck90MTVjeEUyeWNoRCt2d2NLZkJvYUpUZWg4aFcxczhJSC93SkdjM2ZU?=
 =?utf-8?B?b2p3U1BFSnV2aS82cE5VVWxGc2JjNXVKOWNTZ01yRzJ4TDcvU29tUVZZNFgr?=
 =?utf-8?Q?6xEfU7xs228YONu/eL3Jh9JVnj1MiKWINsMtGJICEUln?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba056208-3ce7-4323-c5a6-08db836d1c0b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 06:48:05.2865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C9wfJPnn5xcFI8iS7tgch3Hm5MoojK9+lydVq98iD4+vvx0PvgXMNbhDhFeL4RSn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5822
Subject: Re: [Intel-xe] [PATCH 0/2] drm/xe: switch to using drm_exec
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

Am 12.07.23 um 18:37 schrieb Francois Dugast:
> Make Xe use the latest version of drm_exec (the execution context for GEM buffers v5) which is not
> merged yet, see: https://patchwork.freedesktop.org/series/112995/#rev6.

v7 of this patch was merged to drm-misc-next yesterday just a few hours 
before you send this here out.

Not much changed technically between v5 and v7, just a few typos in code 
and documentation fixed.

Regards,
Christian.

>
> This series is a follow-up of: https://patchwork.freedesktop.org/series/116774/.
>
> Early tests seem ok but please review / test thoroughly.
>
> Christian König (1):
>    drm: execution context for GEM buffers v5
>
> Francois Dugast (1):
>    drm/xe: switch to using drm_exec
>
>   Documentation/gpu/drm-mm.rst                 |  12 +
>   drivers/gpu/drm/Kconfig                      |   6 +
>   drivers/gpu/drm/Makefile                     |   2 +
>   drivers/gpu/drm/drm_exec.c                   | 330 +++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_display.c |   7 +-
>   drivers/gpu/drm/xe/Kconfig                   |   1 +
>   drivers/gpu/drm/xe/tests/xe_bo.c             |  26 +-
>   drivers/gpu/drm/xe/tests/xe_migrate.c        |   6 +-
>   drivers/gpu/drm/xe/xe_bo.c                   |  41 ++-
>   drivers/gpu/drm/xe/xe_bo.h                   |   6 +-
>   drivers/gpu/drm/xe/xe_bo_evict.c             |  24 +-
>   drivers/gpu/drm/xe/xe_bo_types.h             |   1 -
>   drivers/gpu/drm/xe/xe_engine.c               |   7 +-
>   drivers/gpu/drm/xe/xe_exec.c                 |  30 +-
>   drivers/gpu/drm/xe/xe_gt_pagefault.c         |  55 +---
>   drivers/gpu/drm/xe/xe_lrc.c                  |   8 +-
>   drivers/gpu/drm/xe/xe_migrate.c              |  13 +-
>   drivers/gpu/drm/xe/xe_vm.c                   | 292 ++++++++--------
>   drivers/gpu/drm/xe/xe_vm.h                   |  32 +-
>   drivers/gpu/drm/xe/xe_vm_madvise.c           |  37 ++-
>   include/drm/drm_exec.h                       | 120 +++++++
>   21 files changed, 734 insertions(+), 322 deletions(-)
>   create mode 100644 drivers/gpu/drm/drm_exec.c
>   create mode 100644 include/drm/drm_exec.h
>

