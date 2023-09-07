Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F3BEE14D3
	for <intel-xe@archiver.kernel.org>; Thu,  7 Sep 2023 09:22:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD85510E063;
	Thu,  7 Sep 2023 09:22:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA8D910E063
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Sep 2023 09:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694078571; x=1725614571;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0rOPDsqjQqbnAIFv3I4IRBXzwtr/hbkKF8AcuMWkVdI=;
 b=LB2G2xAsC5HFvi2RdDS2w7B1VyxlN42yIgYJ+NQzLhf2e9hemlVoJJ9+
 LKNT/l6D/8cTxOlLrav9nhfRILu6Bp2UzM4dAFOXeEwLAG0e4evEBRxyP
 iJO+DYvmtOgZ+aMTLASJE2+WlaWLFgefiRtCIIjmsfC/Amipe4zv2DpL5
 mvG0yyW7dbTdnBFdPvqkiEPWaj7kghNMGotY/Hd5tH/rlD/GPFo1yRlDX
 pcwIm/QZ9dY/9QqE8KFiG+84Rvii9fFZq+P/qnntNwNCDfPMoC0kQi9FB
 +lOnE+dkNzzs75BMtTAABD2hwZ2598t2al6r463Amr6/K1oftlWXKjzs3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="362333893"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="362333893"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 02:22:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="865555992"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="865555992"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Sep 2023 02:22:51 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 7 Sep 2023 02:22:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 7 Sep 2023 02:22:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 7 Sep 2023 02:22:50 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 7 Sep 2023 02:22:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQEeUO+8x3XfXOkoKI+uKR1KbHoyGZgsOl+/EKX8Ewj417mGkW8kGvBcRXMuRHmEzXBPfoaBXbDxh7FJkS/WdiDBZAPUZ5yS+EjR5MFXQDpVQ0T/Hl8atyWbaSUSAQ26T5Nh2iAWhxoIxZo2r2sjZo76INAt/x57spxN2X4I9z9LCXGrmuy/qWFDmk/Qn+K5V0fuyyiu9KWn3PF999GfoIUxJHJxrvr0hPmXbRrek06KW4+eL/NGzjYWcLb7jqM3C8apy9QGcV5Ogib5XIq23uPeRhrxpg5w6qf2C3+7xxhgyXbxWenXFedEW++QnfuhrXrpW5o0HRoUROLK/r33Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/hykDlbvdJjdtNMGV2557FbbW0AW06wGdIl3pPRzk8=;
 b=foMXNGHpjC7GHkM2BhS1GfdIW3/KaEbwsM5USlNBICGr9gKoq6Moqrss/YrLYJx6QrlQOWTosdYeEpQpxK0ES4QNPmjouyRVmnmxk8q1GigGLsV4asghmgobczXlNKRrBag3ENr9ivPzZkEhxPrBP5jqKfQxeVbbhX+JGMNGe5qryxwCJX03eHgaRBb/3Pc7FMmcHVKL3DZVBTw5IEyyJ0MMTunccw2W3X+HaLQE5JZN5kzvv8CCGyTWfalWwyVQREwPiepxuM/A8kgLnpUNTwrTzo3blSV71ZNPdZi4Chi6yNN8N3D0i6TPE3cMw+qGUrXhqVU4lEjvVuG8UDdWcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB8341.namprd11.prod.outlook.com (2603:10b6:610:178::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 09:22:47 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25%6]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 09:22:47 +0000
Message-ID: <58217dd8-e733-47e1-adbc-95186f01ba3d@intel.com>
Date: Thu, 7 Sep 2023 14:52:29 +0530
User-Agent: Mozilla Thunderbird
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230831090536.2949934-1-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230831090536.2949934-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0001.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::6) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cd8102e-48a8-4e20-ae72-08dbaf83ff53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B1/w0JJvoFdTAUsYvtj88xuyZpHqzovU4oCZqHlHmfQMUyMZXB1acIJB11dBm9Q1wuqNgt8WdbmvfqK4a/y+t4FBKOe8YVFWCsshACWHEZ4ZVP6YfG4MnZ9Y2Ibf3QCXHYlTyyZbh5ifBSG15/TRZnyuPHq13yLw3kow0tq20A/1jSegjLhkXtu39Yb+v81+A/m97znvG2qZ/iUSpbmaIRHssemO1DgF392w8nSkpb1ioIrkPIq8L6HaOu2qWq4dtealURMybTYMk2u3nw08+AFIEBCwwqvT+ZoseqNDfmkeObQP1XK5WvtA865BCpKbbC1CC4xJgIukxTJO9Z+o9wJwDpx2ByTyuTHTBjB4XZQAHlHjlr+wSs72nr/qIwlqbSrQmv8aCq64pnRK/jGJI+eqFuTGcvIGNO3rH8SJABWYP+oMkipAK+th5UZ1SiTBuJqt5RQdvGcV5BPV2jEYUVFZY6FdBELvYf7FphU0UJ4Jc2EDGLZsnT1HE8YUW2gbt/FKZFY2zCoAmZWdAm1f79YM5rSh4+Q7I6PClUCqZIucn3BViGciVoHL6zgKg9Q8Ycad40C/bxqMUfECcEOemrSbxfIOoM0OTsERwUrzcGzna0zZZUMn44PCJSsy1t2yoUDIWcF+U3dACeMCbyuUYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(366004)(346002)(39860400002)(451199024)(1800799009)(186009)(53546011)(6486002)(6506007)(6666004)(6512007)(478600001)(83380400001)(2616005)(26005)(2906002)(316002)(66556008)(66946007)(8936002)(41300700001)(8676002)(66476007)(5660300002)(4326008)(31696002)(38100700002)(107886003)(36756003)(86362001)(82960400001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjhzYkI2bXMxWEkwWU1pS1pSMnRvRmVQcWtpZnkzeDE2TVlTODY1K2F2N2xk?=
 =?utf-8?B?WDRTM2VsRFJlRitNZmFWaSt0UnJtUzVjVnZyM09ZeGxlRGowdGMwWWRFSmQ2?=
 =?utf-8?B?NXU4bURQVXRVbW9zOE9oVEZDZE5LclBsK1M1QStlbkZERmk0cUlVVzRhcjIx?=
 =?utf-8?B?SXREQWJ6azNjTE9jTzBGbktuOUs1anJhK0dhRzNMQUFpRkljT09GK3I1cHRh?=
 =?utf-8?B?VGF6V0FuZzR0QnRjUTZyUWtVaFg3VWQwd1pETU9TYlkyRVFvR1pUUDV1bTNL?=
 =?utf-8?B?YW91UnpmRm1lU3VQN1VwbXYvT0E0YkJuUVhhN3pYdG14Z3NHMFFHSkpxVldR?=
 =?utf-8?B?QWdwMURZMG9ISVFOVW1NSUxyTWN3UmM5b2VCa1hyakxxeFlGbU1BMlR1cHUy?=
 =?utf-8?B?MVh4YXliS1FxMkJJUmdtUnoxMHU5dHZJNk85c1FqV3VaUHhyQWRvZTJoNTNm?=
 =?utf-8?B?b2xKWC9nUVZCR2ZUQjdaN1JpaUhnQmh1TXhnZ1BIT3FuOGtINTZjdFNVd1E2?=
 =?utf-8?B?T2JROUxRU3Nxb29ZMlRiNDFvOERoNGVpcjJnMXJucHp1SnFlKzdRSTZsNTQ5?=
 =?utf-8?B?L083bk9uSysxdEVScmlRM2tZYWYrOUxWRTFwMitiNi9RODk0cHh1WFRkRE5S?=
 =?utf-8?B?RGdSenNkV0lGYnZKYVZ4T0d3c2laa0g3R2haU2FCVkF1Y1NBaVJCSUNNdEFW?=
 =?utf-8?B?R21wcTlRN25WNDkrajIwanJlZWFxRUc1ZVE2d3dFS1Q1OXVlRFJyVGowbUU0?=
 =?utf-8?B?Z0M4TTdxMy9FVjBZTkQwZFhQTnp4dU9wNWVBdm9Mb0VjSEtLUGt1WXpHY0hV?=
 =?utf-8?B?WnJOcnMvSk5BWVZHTHc0MDQvS0xlbHdCSHJpMXhCa2ZCMURPamEwZDhjUkNX?=
 =?utf-8?B?ZmFySGJNSlRrUWZkVi92YzJTQndZUmQrZVkvUW5wdEdNeDZveEkxUFNwdFBi?=
 =?utf-8?B?UytSUi90MEp6K2FheGFub3pjdnFSeVhPSlFSdWZoRmVxUVdPdVhIS0lkbU5P?=
 =?utf-8?B?S3FlWjJjUG5QT2ZkTnhnaUhxKzJVaDAvVVl0cGc0ZmQ5MG05ZFBOa245YkdL?=
 =?utf-8?B?eWcvQzZENXZrb0JHZ21ySmpJL0hBZmxYbFFWM3ZtbGNNWFVXc2Iyalk3RGtt?=
 =?utf-8?B?bnI3KzVuNWVmV1F1ZXNtVHVWMHRuOXN6dUQzVUxzNXFWV0tGWnplOGZrMFFP?=
 =?utf-8?B?NkRBRnZ1YXNHRzFHWUZOZGhwZEVtM2sySmtqZVV6NHNmWUwxN3dQcFlQMUN2?=
 =?utf-8?B?aml3RHNTbktGeWh4Z1FBZG5mTDJQV2RUbld5Y3NtbHBWK2tXN2lIUXhQSUpu?=
 =?utf-8?B?WjMxVWlxK204REkzTTMvSHhWaWFoK29aTG8zTGdwSENyZkFpbGNBZ3ZoSThv?=
 =?utf-8?B?cm1PWmNlQzZXbnBvZG1IRXRrenBOd0VJSEJtTmZ4TWRhUW9LaUxjNWZhQUly?=
 =?utf-8?B?Z0hEUXlRemtndXA5cFpwUk55ZFdzRW5WVFJ3SHNiMjF1dkpoMGcyOEcwMjlE?=
 =?utf-8?B?RllCY2wvL1huZk5pdjhBTElTbTJQM0RnWTIvT1drYUl0SHZwSnY2YndQL21y?=
 =?utf-8?B?eFVoQ011MXJBUXg0aHVoMStLR2FqRGtKdDNYWUZsbS8ycThsMHJlNVE1VCtr?=
 =?utf-8?B?eEpaMGdOUDdUN0d4NW1vRlhjMDRrUklPRmpaSmJxcldLeHJOcy9SWTZkMHpE?=
 =?utf-8?B?L0dWYzNoc1dTc0kxUUdsL3p4WkVZSHpDZ3kySi9sQVl6azJqUUZJTUhVL2FR?=
 =?utf-8?B?V3pyZXA2ZzlXTWU0T2dTNTkxMm85U0FsMzEzaXEwTnBTTEFxb1pPczRrZ0Fl?=
 =?utf-8?B?UHE4UHFSSG1DQkJMeXRpWXozMUdiY2REZ3ovWmU3TmkxZUtSVDloVmF0RDN6?=
 =?utf-8?B?Q3Q5KzZXMFlzcU53MWY0MDZETVFKdzBxTUZtazlkUVJzeXBEdndtdHd0TENM?=
 =?utf-8?B?c29ETklIV084NUttcGFnRmFXelFzSzZjTnl4VmRqZzF2dXlwT3VLVmtnOTNE?=
 =?utf-8?B?TURHRkpJMVhURXVYZTcvUDdiS05BckdaTGhRM0RoekYyZ2Q2aUE0S1JxZjJD?=
 =?utf-8?B?YWpLYU9pdEdUM293Wi9KaEVRQUh5SjFpTlVsWUhmMmtUOVZ5K0p2M0UvelNB?=
 =?utf-8?B?dmdzZXRORU82WWExRm11aGNsVHdpZWNhSXBXTm1xSURkL0hZeHA2R1RHYVBW?=
 =?utf-8?Q?HYsRz9KYufOm6YG0RTAoYTI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cd8102e-48a8-4e20-ae72-08dbaf83ff53
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 09:22:46.5601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Sh/eJ2D/3RJGwsGmfz2OE/zSJFXa8ej3PCOR53mfvX4H5VX3FtgtBU8CBWMjtudxFkl4KdTtAKLJaOigqdr0z+daqDFUoCtjBiAzf+epRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8341
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/7] drm/xe: fdinfo memory stats
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


On 31-08-2023 14:35, Tejas Upadhyay wrote:
> This series enables enables fdinfo memory stats for xe.
>
> I added tracking of most classes of bo (user bo, page tables, ring, lrc)
> which contribute to client's memory usage. This follows similar lines to
> what Rob's msm code and tvrtko's i915 code is doing with some xe way
> of showing and tracking/fecthing objects which adds to client memory
> stats.
>
> Example fdinfo format:
>
> #cat /proc/4620/fdinfo/3
> pos:    0
> flags:  0100002
> mnt_id: 23
> ino:    1116
> drm-driver:     xe
> drm-client-id:  13
> drm-pdev:       0000:4d:00.0
> drm-total-system:       0
> drm-shared-system:      0
> drm-active-system:      0
> drm-resident-system:    0
> drm-purgeable-system:   0
> drm-total-gtt:  4 KiB
> drm-shared-gtt: 0
> drm-active-gtt: 0
> drm-resident-gtt:       4 KiB
> drm-purgeable-gtt:      0
> drm-total-vram0:        20 KiB
> drm-shared-vram0:       0
> drm-active-vram0:       0
> drm-resident-vram0:     20 KiB
> drm-purgeable-vram0:    0
> drm-total-vram1:        20 KiB
> drm-shared-vram1:       0
> drm-active-vram1:       0
> drm-resident-vram1:     20 KiB
> drm-purgeable-vram1:    0

drm-purgeable-vram0, drm-purgeable-vram1 ?
Are they correct entries ? Seems issue in PATCH7.

BR
Himal

>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>
> Tejas Upadhyay (7):
>    drm/xe: Add drm-client infrastructure
>    drm/xe: Interface xe drm client with fdinfo interface
>    drm/xe: Add tracking support for bos per client
>    drm/xe: Record each drm client with its VM
>    drm/xe: Track page table memory usage for client
>    drm/xe: Account ring buffer and context state storage
>    drm/xe: Implement fdinfo memory stats printing
>
>   drivers/gpu/drm/xe/Makefile          |   1 +
>   drivers/gpu/drm/xe/xe_bo.c           |   7 +
>   drivers/gpu/drm/xe/xe_bo.h           |  11 ++
>   drivers/gpu/drm/xe/xe_bo_types.h     |  10 ++
>   drivers/gpu/drm/xe/xe_device.c       |  19 ++-
>   drivers/gpu/drm/xe/xe_device_types.h |   6 +
>   drivers/gpu/drm/xe/xe_drm_client.c   | 228 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_drm_client.h   |  71 +++++++++
>   drivers/gpu/drm/xe/xe_lrc.c          |   7 +-
>   drivers/gpu/drm/xe/xe_pt.c           |   4 +-
>   drivers/gpu/drm/xe/xe_vm.c           |  10 +-
>   drivers/gpu/drm/xe/xe_vm_types.h     |   2 +
>   12 files changed, 372 insertions(+), 4 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_drm_client.c
>   create mode 100644 drivers/gpu/drm/xe/xe_drm_client.h
>
