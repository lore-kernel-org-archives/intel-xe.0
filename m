Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15C3C25B47
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 14:21:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B6D410E5B7;
	Wed, 25 Oct 2023 14:21:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1528C10E678
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 14:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698243708; x=1729779708;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=GiNdbWGhxZCI9Ugpm4DqZoTCyReuhIRq+utDIc0xSWg=;
 b=QqQhzhc9aVckwhRNSnStjTRAWRfZziO6/A10AdMV+zcM+ELFm7wr3131
 p0zfRoKFydSV5Klth2cv3rS1j3AVEuHWdr8Uub/y4rfzQvXeaEIHdsI9f
 UcWRu43DaBjgFL9W81yUzL1oJKCGg+aVESfE4fQB4E90nGsAwcOZey8j1
 ClgQMqdiZwnF5jrhLM/G40bYo1n/EEQ4RTP7b4sZ+lA+FkM6jfzHhVdNB
 3tps13l6fOrcjatfMF7PFY9VhUcsaDSEAQQ46r9dNJdUF6EY5kvpGfHgQ
 kNE09mids212MYkRTNOVPF4PCc3pev/CJ3n0xtp8NLSN0Vs4EwIBXsYaA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="387136187"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="387136187"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 07:21:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="824658486"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="824658486"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2023 07:21:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 25 Oct 2023 07:21:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 25 Oct 2023 07:21:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 25 Oct 2023 07:21:46 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 25 Oct 2023 07:21:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NyrFP7KFbZC6qzfRTwUKG20vZf3P+ByEu85cCaREDhMDZoHdmQcsSXzwP0BdBA79evd77hM6sh+SLNdpQKq1ycXtpW0aRqeSCQ8OEoTZGqEw9Nyb5TEQHOGWIhbEwfkvg7m/8eP0RgoNKX4K+aQIICuoOAPmD9WCGP7TgrVucID+tTZymK5XIDtD5Rfrn2scG9TcyRkgTZGrbGAWa82xBW3v5r/IAWCG83BhnoyyySMCW32gN7K+tmN61gEhRr7VBsm7nng4K+z7qHQi77nCVcxoBCuW0DPyFzof4KPkWlRjqs+zR3p9bViHequ8ttqkvAN+0k5/1nwzd7TiuossAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mR8EOCRoOvGF5iXGtirq6/V9lPETOGKB56m94GVsGdk=;
 b=AmssUZc+QRmoXe5wSs6T8BHw/Z/lXKuH3U27W6ZKAaoT/dAzY8yy/AXXcvXSK1KL4JjjPq+tOQB3J4WBpncpIL4sQX+choPh9D7F2PXa36HdZilaWeosD3CQGBt3iUZbzirzEC7JE/+GloxKmFhGQNulf/1RpcZf5LD1fe8yxw1fRxKp7jhkdIDaZWTGpjLVT9Ah9kRTmqlnchqxdUTt09EaruC6BWmtQQqn81CGQWZn3FWiVCbnEoCdvK1MkqRHpvAYKUDTkNsHxgtn3Fm8wbTz3kd+nnClQi2yZ03al0bvhzI6XRv0NhToondiJSvs6/GJFF6Iju3eAly7L4U6gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by PH0PR11MB7659.namprd11.prod.outlook.com (2603:10b6:510:28e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Wed, 25 Oct
 2023 14:21:36 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf%6]) with mapi id 15.20.6886.034; Wed, 25 Oct 2023
 14:21:36 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231024220412.223868-1-lucas.demarchi@intel.com>
References: <20231024220412.223868-1-lucas.demarchi@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Wed, 25 Oct 2023 11:21:30 -0300
Message-ID: <169824369018.3082.3331334454197340296@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR05CA0079.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::20) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|PH0PR11MB7659:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a0e81d6-235c-430b-03f0-08dbd565b21a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QaOtqBy+VPvgZbl5PfzkbyjLtml+bJhCk5pIl36sq1dVOsp9wNljeys2Ad/Lj1mhBYs0Ws3EBiqV2x1VkH/2PqeS+QvdbS7ulFrDEBe69f9KZQ8NcxaC3TFUBEBKjFqF3ORxGJ85AucjdmBU+41L7sX7qxd+qabgHdlpbYTMcI5E0KaUhpjR99zwjdb8RPzWL9uaGW9jIJIsg1+qKWP6sPzdauF4p/YRgx0VNhW/B03mmUCA7lwZI+iwP4/2sY3zf0sPbA3tGb7FJ82rzWpxNerIq9vH5s5MhUE671hn5rYhyxRDsdun2DM7xWb40IKAI6+WrA7ldUjNGnOsS8d7n/dmhBtYrkHFUGxaVeL/ywl0AIspV7lXYt6W4/IoUyR8Fq4iA11HkHPo31o70N8Cu7nRqzYKfMNc0RQ0V4jxSmw3tBiZdyiOJGhezlHfFKVyER5V/T9+kYG9D16DPpVWSv8mR7sYA4/+nkY47ZoKnvVEsVv7BKtZeHxL+ApKvKgWo3B+Xo/k+QP/8/AEHMTGebewauTuDe3AszuZYWqTTnzLDZQ9MJp9Zu109w2j40Kk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(396003)(346002)(39860400002)(136003)(376002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(44832011)(2906002)(38100700002)(82960400001)(316002)(66476007)(66556008)(478600001)(9686003)(6666004)(6506007)(107886003)(66946007)(26005)(6486002)(83380400001)(6512007)(41300700001)(5660300002)(86362001)(8676002)(8936002)(4326008)(33716001)(4001150100001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGRBZmZpWEI0NVFvMDIyMStUOVRXUUREMmlvSnNxSVFDVlhlUXoxeXZtZlV0?=
 =?utf-8?B?SCsvU3B6NTJDU1ZUbVFndDJIU3pBb1VWQUFUVlNyVDRRMjVJRnpIS1NlZEhK?=
 =?utf-8?B?SXN5cDlLYkgyQVFiUVNmZ0pUMG03SnRyZjlqakF0ZmZQYk83K3ZRN2YyQm8x?=
 =?utf-8?B?bTZNc1Y2RzFINTY4bWUxakhsZkVtMTlMKy9neGdOM0l3Y3ZzZFVVSHpBRmVp?=
 =?utf-8?B?VVdGNGU5azdVUUdrNXo2bStUU3d5QzZmb2lITjc1bEsrRWhUQ2RRTDBNUHJa?=
 =?utf-8?B?MnBpOFlxUEwyYXBHNVhmM1JrbFFFZHl3VGphUjd6UFpkOWhhMm1Ca01SMTBL?=
 =?utf-8?B?VzFwdFMwSGN5Vm55U1k2L0lyakxIV3VhL2tPT2VVU0pqcjlDbkFKblJlUi85?=
 =?utf-8?B?RTVuQm9pdUFvdUo5eThqeU9XTk93c29aOFNqZldtT1ZuZEliRGpGY1pnc1dH?=
 =?utf-8?B?eDhscVhMcGliM3JKd1BBWGhacFk2NzdPVEJLdW5yaVFZWHNvditGRFZFdWhq?=
 =?utf-8?B?SVhPckU3dzBQYllJdm1TT0ZtZkEyNGY0SmtrSUJGU1VLNHZvamR1LzVEeUpo?=
 =?utf-8?B?T3FzdzhVMGw1Y3d5UHBjVlEzdFZKdVppNzNvQXhDTElDWDJQVUEvVzJHUk1j?=
 =?utf-8?B?WlBwbmR0ZHV3aEVWblZvblQ2aUN5NFY2aTNrUG5aaG4zNzZHdkVrREE2Rytk?=
 =?utf-8?B?di9MSGJHSE5aVkVreE4yemFjZXZFQnM3ZkxROWY5Z3owMmlYVERPUWsrY3FV?=
 =?utf-8?B?WXVQMlh4ZXRQV01kQk9qQlFvZi9KL2RyaW1VaDl4WG40cWtqWVl5UUQyS3FW?=
 =?utf-8?B?aCsvYWdTRGlwU0pzMnJrdHlCT1hvZGcxMTdBVTZ1bjRFWk9LcUZoNGY2VndB?=
 =?utf-8?B?UmJKUWJOdTUwSjNRRTBVWmNpejdKV1h6KzNCaU5iTkNMekZqbmx3cVNRdHVz?=
 =?utf-8?B?clA1K3p0V2poWi83SmkyUkdtdXRHdEZHcXpLTUgxVzkrZURxenY4aGlxVmVC?=
 =?utf-8?B?UVRGOVBHNVVXM3MvTkEwTnExT1NtT1c4cUhseEFmZVpnV2EvN21RSlRySzRB?=
 =?utf-8?B?T2owL3pBTWpaWDA1ZEVaMXZ2aU1ZM3JkL2d0ZC9xeWFTQnRwZGVTelBFRXVy?=
 =?utf-8?B?SnhycGhqRXBsRG5xUUJCZEpyMVNIS2hTVUFIUHZxajlFajcvenBXUDZNYTR5?=
 =?utf-8?B?UHZxUGZxYXdGQnorMHBJQnZlMzRienR0RldXUXJMQldRS0xoamd6WURqWUVJ?=
 =?utf-8?B?aHM0em5aZ1k3bnV6NlVQbnhnNWk0OThZdnV6c1Jjb1R4cURLR3ZQTUd4Rk9C?=
 =?utf-8?B?eE5rMU1qclp3Q21rYndKWUppQ0lFMW90ZjhwOEtaVGtIVVBTSndmeW9EZDZ6?=
 =?utf-8?B?aXRQOEpSZG5PM3U3UWNLZWFWN09GcFpWbmxlamRscVVNZCtiZXF2eVJ0b1k1?=
 =?utf-8?B?UzlRUlNqTDNDQUpGRjMwcXhnR1V2cVUwMTkyUlBXOEtxaXNFK2JZR3cxUm9H?=
 =?utf-8?B?eTcrRW0yZlFBUXhFVVorQlY3a0IrTTVoL0V3OEhWWENiQkZyZnY2cW9GeHdC?=
 =?utf-8?B?Vy9Rd0hKeFptNFpsS09RTGRTbGlySERlb0FaSzZ3UndFRzY1QVFHZm9xaFZH?=
 =?utf-8?B?RUtySjI1dnBsUjhuQzNFT3o4N09UdlcreUVQWkFzbUhZRll5UkpRM2YxK2N1?=
 =?utf-8?B?OVFycldPNENoZmFURUQ4R0JBWmFZL3JYT3cvdlJmcEF6dnBrTzhBVXdRRzMz?=
 =?utf-8?B?UUhxQnNBZllCU2hMcnN0d09Od3JkWWdyNDhReGZBdzZLSTFkY2pXUi9YK3JI?=
 =?utf-8?B?TnVvZG84VDRPM09LcG56d1Q1TVRVUzU4WmJLMHhVUDJNN0ErRmRZaytNVTlE?=
 =?utf-8?B?dDc4bWtpUlFXV3c1NHl4UjRNVHpiZEtscXVrMmRNRXhNVDM2bk5jL3FSR0ZK?=
 =?utf-8?B?UlpERFkzY3NnbHlQaXJ6MWhwZ2xwall5akdzcG5qbnE1d29yRkluWVZzNllE?=
 =?utf-8?B?VW5HL0R2QTZoZ1NaNEw3S0RKaHhDN3ZkVDJZRTQwQzd4VWNxam9JK2h6cmM3?=
 =?utf-8?B?dWlrbnFyb1J2ZFlwVEpHZjl4WjVCV014eG5MeHlJT2lQVzNIZWV1MEJlSkRy?=
 =?utf-8?B?Zm1kNHhnUGsrbTZBNnlhVytZOFRqZ0F1Sy9Dd3pNb2cvbWpXQnQ5MG41Ym1B?=
 =?utf-8?B?Znc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a0e81d6-235c-430b-03f0-08dbd565b21a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 14:21:36.1472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Py99C31PfdBxRF5wJYI7voG5bTMDE5vwUk6Cvx7B5IJk8gMc2KLV1Xfx12Hug55g1plRYJLGFiWEWqEbOkl1jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7659
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix WA 14010918519 write to wrong
 register
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

Quoting Lucas De Marchi (2023-10-24 19:04:12-03:00)
>FORCE_SLM_FENCE_SCOPE_TO_TILE and FORCE_UGM_FENCE_SCOPE_TO_TILE are in
>the up dword of LSC_CHICKEN_BIT_0 register. Also, the 14010918519
>workaround only applies to early steppings, A*. Eventually those should
>be dropped, like they were in commit eaeb4b361452 ("drm/i915/dg2: Drop
>pre-production GT workarounds"), so let's make sure they are annotated
>appropriately.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_wa.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>index 1450af6cab34..b4b13d05ef26 100644
>--- a/drivers/gpu/drm/xe/xe_wa.c
>+++ b/drivers/gpu/drm/xe/xe_wa.c
>@@ -352,9 +352,9 @@ static const struct xe_rtp_entry_sr engine_was[] =3D {
>           XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, FORCE_1_SUB_MESSAGE_PER_F=
RAGMENT))
>         },
>         { XE_RTP_NAME("14010918519"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10),
>+          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0),
>                        FUNC(xe_rtp_match_first_render_or_compute)),
>-          XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0,
>+          XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW,
>                              FORCE_SLM_FENCE_SCOPE_TO_TILE |
>                              FORCE_UGM_FENCE_SCOPE_TO_TILE,
>                              /*
>--=20
>2.40.1
>
