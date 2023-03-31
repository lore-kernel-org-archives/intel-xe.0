Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1DCC6FD18
	for <intel-xe@archiver.kernel.org>; Fri, 31 Mar 2023 13:43:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A633A10E099;
	Fri, 31 Mar 2023 13:43:42 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23E1E10E099
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Mar 2023 13:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680270221; x=1711806221;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5uqPK/bW0DOEEgYTBHly2RYekl9OzRkokYJ/tGmjhNQ=;
 b=jmN35dJHJnA8Hgy96a19wUkg0RdD7mbmuyssQ0PZC1E4H6SfB4Dw5hfC
 yO+/t5uJDCxq8RTVFZOPKpfj6DIl8SFCp6xLMF9EGXtB51Vg/IKjIpPlY
 eTKdmKDkTdD6zVui1q1PqmYnJ5Zm57wQ/W8zromTyRJ+q/n848hTfvS2O
 XJwY+6y88dMMLXCf2FTU0e8s/A0DyeseXxHCeBZsOke2PXKyp7/5nKVCv
 fzOtfU51o8O+gG7xWS06CmhCofhVrXX1z/C4oRsBySVtcilrP2vKg+84h
 ZbAphq30hddmVMyIIdrmCH2k0bHsDjEboMlZVE44ViirCuM7KOYeZCqjU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="340177076"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="340177076"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 06:43:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="809046982"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="809046982"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 31 Mar 2023 06:43:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 06:43:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 31 Mar 2023 06:43:39 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 31 Mar 2023 06:43:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TfSoO4mP1qrrxCCC3Yl90fhfCM/1P6MTk43MuU9Hc2vgo4UuE+hlasAGK2EL3aVrdnjxCeoSK2fmqwYJEcBehb9pCbVrtsh64Obm7vanE5fbNxKYGNgO+BktuTxzGJyTkChj5oQx88sC6j57pDTlOsspfhI4qahp4C2yA73vy3Z8TCaYWFHmG6lEaRbPWox1yYkAqc0LVC8IZebPiKVukTGtGdsaOXVi6qA8MVxhSGjvZQpMMRNL8rw5c1pF43COOtaDN3aC6jHYr47CASDA3zYRDrEUi65sWXo/B1vmmqnYMMdrO1bfxqRrwm4Kx2tWE0K/XKS1wVtmKGQWeam8zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sEdbjpyPKMy/o2PkHfHxxLFLgldnMSBxpWNJovcq904=;
 b=K6DIDlpwdyMr1IcJv3oYp+XuKdcsZ5kwa7IU8QhGCAZ2QXMpq4hyRMGDXYUD1t10ViTbMgUDdAQ6wxSOK4F0Fn7aiLcJLcO8/h6vkMtLxRz7XPBAysWtkjv7fPmGnqjj83TRqas22Sn4kqrB1kPrn09UHOhdACQgru/OIdUTFsVF4JR749AwuSvXSCDo1H9KVPHEzzpqj97ctKIoXl+WAUzPsjJDzor2nWNWfLZh16izUx/JPR5pZDX6EJQgHwwpbXmcIt3To6z/KYSM10pqY15rB/Vlb4m45p7M/xYszCXLoB9uxK3CXl06BdVM2CmV6pJ71doh2ZCyLGzAVABzhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB7048.namprd11.prod.outlook.com (2603:10b6:510:214::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Fri, 31 Mar
 2023 13:43:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6254.022; Fri, 31 Mar 2023
 13:43:37 +0000
Date: Fri, 31 Mar 2023 07:43:34 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal@hardline.pl>
Message-ID: <20230331134334.x5u5ixt7nnr666mc@ldmartin-desk2>
References: <20230321220527.595462-1-lucas.demarchi@intel.com>
 <20230321220527.595462-2-lucas.demarchi@intel.com>
 <adnojpupaqnivif7aqblxkuiwyiexskk4h3b36bsktbpifoip3@b7xazecr7exv>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adnojpupaqnivif7aqblxkuiwyiexskk4h3b36bsktbpifoip3@b7xazecr7exv>
X-ClientProxiedBy: SJ0PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB7048:EE_
X-MS-Office365-Filtering-Correlation-Id: acf0ee3d-f33c-4e7d-0db3-08db31edee00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A5ykVHOgL/kSrUgqZ3vk2UU4vEW6XtFwsG0YZ8mjx9loQexNrWysxdIgjrRFOX8Oloe+3LN9H+t3Qd2GabYfVbGhC3ZO1EyqRjg1IlBiYoq8dbqRIiVg3ZXcQLvZyxxCFStko8PKKmZfIXcynRfGsL8Bh0rqmfD/0l8wIx/ZaFSCbgZf6lGpL/tmIcVC6xYEDa8zZupzjrF2Y6nsRFcELF6U/JLX3FYMwpKr8gWy0yyE4BCkjkAfp/zpLt3MzjBT2rEzXHAhG0Qi+l+RWBeWX2tQwQiA3y7fEqLFosCqRwrTgPbILkc2cX0HuPhFOZGREmjepa/t5vJuLS+p7NKBrsIpeOETEATF8wVvu3Pp6/NT1+9y0oAzLMyXUBjOoN9k+s8oSfHWWC4j8qahCrlA1nTYlod1yCOtPlQhJchfRa94WYg8mlZvmsARaarlbf2EUu/CwVXiAc9LKCKBeORpB06lRC7aJGZPXv3cDY+cK7R4yB83nVZn8B6elzoV2AsuUKVgmnigyS33p+vC8xurGVHI6IK4B0Ab5wjZTXXp8xvqSOAAk5nBxGkOt0xVJKhx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(39860400002)(136003)(346002)(396003)(366004)(451199021)(107886003)(478600001)(6512007)(1076003)(6506007)(6486002)(6666004)(6916009)(316002)(26005)(83380400001)(9686003)(66556008)(186003)(8676002)(66476007)(66946007)(41300700001)(2906002)(8936002)(4326008)(5660300002)(30864003)(38100700002)(82960400001)(86362001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlAvY2wrY1NYeWRGbEs2dWlLdVpmSno0ejRscFFNVmg5d09QbnNEWklZWVU5?=
 =?utf-8?B?TGl2VTRMY2dUOHdEUlpXUXNWWmJlTyttSGhTNlU4SGdUaUsvNzBWU3JUc1RG?=
 =?utf-8?B?M0g5b1hRcTJoMVVnRDNvcjRuMlpKMm80RDdtNnRxT2dSR3dIL3FZeDdUZGl5?=
 =?utf-8?B?Q0hDVExieVVuVE94K2VJYjQrWTl3Q3N4cVRrRDErOVQyTFlDb3B6UjY5eUdt?=
 =?utf-8?B?bGVEcC9MU3FDenRMOUs5anVINmVSY3Z2Z2pXcnVUcVIxN0l2cFVqSXBZN2lS?=
 =?utf-8?B?SEMrOGdFTlFOdFJnNm9IOEkvWFVKS1U2aTFIVTErL2psS1VJOWJPeU1aa1pH?=
 =?utf-8?B?RFRFcFpVVWpucFF6L2JDNlBVWWlSS0hlM1VWK1lSSDdYZHRyRUQrOWxSNUNR?=
 =?utf-8?B?Z0x6RkljRTNITzNrb3NrbDBwejJxR21XY2Z4ZS9GNklBcUFPejdOY1hoSURi?=
 =?utf-8?B?ODJwMWpkNzRCK1hJa1ZjdSt5RWZmU0w4T1pVSDFLZkdQdm1ucGU1a2JlYys4?=
 =?utf-8?B?aDVHNUxtTGxobWRiN244V3RjR0pCRjBqd3lZK2djdktiTzZZVjJoNGRlbTlR?=
 =?utf-8?B?aFFJb0NjU0NCN1lhU0NYWE96UjhvSkJnWGNKQXJWbHowemdsWG9BWUdVUmdG?=
 =?utf-8?B?N1JMd0RFMXk0Q2FFM2x0eFBIeXNOcndqN0xqZjJvVXN6R0JnOTVKY09jZUEr?=
 =?utf-8?B?SXhVSTZZNkV2akF2R1VxbENiL08zWUNVMURvUkIzd1JnV1RMZE9OS0ZieGNS?=
 =?utf-8?B?Q1Nsam5WQUlDdnZ5YXhTWEhGa1dSQXJ1b3ZsbGMzcUJQSkJWUlFJMmZHNmIz?=
 =?utf-8?B?TmtXRGtBRmFTWEo2UVlQZHpweGFkRlEvY0czU2pWK1Z5dFZZQUxOQ2pPRkZ1?=
 =?utf-8?B?VmovVm0zRWNVQ1cxZ1JET2VWeHhLeCtEMFBUL3FmbzZYeGNLQjI4SlI2V1Fq?=
 =?utf-8?B?TXB2Zy9PQXhUMDRjNnRtVTdEb1V2RGQ0YWNuUnFXWXEvVnkvVEhUL2RNWkV2?=
 =?utf-8?B?ajlOWDJBREFwRVE0bHRlRTFycmJ3YzNGNXFyMFo1Z1o3b1VtQmpoUjFQcGJD?=
 =?utf-8?B?L2x6MmVFZ0hZdHJtWFNLZ0x1cEwvT3JaMjVTWlJCbUtZREJjeC9vUW9Fb3RL?=
 =?utf-8?B?ZFN3b3BDYUdmcElYb1Y3QnoyejVEYlc5VkZ6ZDB3RUhCOG5tVFJhQ0Q0SitD?=
 =?utf-8?B?a2p1TVRhL3FJSThGNzJJMFVQckY1SWVtRGZMVXVjaDJqVVhtL3VCSk5nOEgx?=
 =?utf-8?B?UzFqb2FweGJweDZ1d2U5SXdwWkplQlE4a1dQNUVxRXVhaWtGTk1ZWFFnMXdN?=
 =?utf-8?B?ZlduTFNHTWJEcG5xNmJId0N4VkVieDl4cURjSjRJUEc3K3A0NkRyaE5VOGs3?=
 =?utf-8?B?dmhhV0xwNTlhQTRLUDl1WXB5ZHdkV3FJcGhoQWxwRlFjUjFNK1BBRnQ5bERR?=
 =?utf-8?B?ZmNKMXVWZGxqVzdPb0FVeGRuOThmTk13L2cyRE1lK0F2c3o5RDVneU9NTnNx?=
 =?utf-8?B?YmdDVFBBQkRjQWtFRmFoZ3VrUGFvOTFRREdkOTZzNHY0Y2pGV2oxUm5xdWlJ?=
 =?utf-8?B?ZW1sc1lxRHZobEdBVWpVVko1Mmo1eXhwK0lCVjBJL1VjUGVydys3dTU3Qjl0?=
 =?utf-8?B?V0Z4WkJLS1BYZ3dZZWlKS0RVNks2U0xSVHdOOFp2WmhNYjJMNWFiK0NKQ0Vm?=
 =?utf-8?B?YWVyR3FncmFXRjVPUkpUUUMrUko3QzhjQUFHV2FnaU5YOEwvb3NwbW5nZmVo?=
 =?utf-8?B?S0U5L0s4N1VZRVpZcFNzYTQ1aVhuSmd3UWQySHFaazdBVFZwQmd6VzI2S1Fi?=
 =?utf-8?B?VG11cXZFZ0ExSnB4NlNIL3k5OGZSKzljQkphUzRzUGMrY2dnRFVDTHFOQ2Z4?=
 =?utf-8?B?SVBwTGllUmk4M2pnWU8vVU81ZE81K3FjRzlsaHpocURxUXhFZVBIRmU1Rmd5?=
 =?utf-8?B?SEhFNXZQMGViWkpadnZvaURmQlVLYUJXako4amswellnM3NGYStvUS9YanJE?=
 =?utf-8?B?VTRFeHExeHdlTnF0SmFpMS9TcFVaZVM2OHBicEtoSE5jUFo4V3hFeWlhWTVE?=
 =?utf-8?B?N280Q2Rpc2oyaVBxclEyc0V5aHVMNk1yUk1wb0gySkxtVGxBYkFzakZ6cjZ3?=
 =?utf-8?B?ZU5jR1lzbHV5bjFPTlZNWVBpQllDblVVWkQ0eDYybU96a1FRMkRuaUFGSExO?=
 =?utf-8?B?RUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: acf0ee3d-f33c-4e7d-0db3-08db31edee00
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 13:43:37.5775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d8dQ4oSLOj5Vp4/6Oa+bjou55Ui2eW2qZ9jcqGdea2cNBDDKQAGCBFouj8/hs5omv9OSVTYoPnrhi1QOJhGXEFKZuzBIAjAVbWYB1Ne8k+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7048
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/7] drm/xe: Add basic unit tests for rtp
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
Cc: intel-xe@lists.freedesktop.org, maarten.lankhorst@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Mar 27, 2023 at 07:56:01PM +0200, Michał Winiarski wrote:
>On Tue, Mar 21, 2023 at 03:05:21PM -0700, Lucas De Marchi wrote:
>> Add some basic unit tests for rtp. This is intended to prove the
>> functionality of the rtp itself, like coalescing entries, rejecting
>> non-disjoint values, etc.
>>
>> Contrary to the other tests in xe, this is a unit test to test the
>> sw-side only, so it can be executed on any machine - it doesn't interact
>> with the real hardware. For that a mock was provided with the minimum
>> initialization needed. Running it produces the following output:
>>
>> 	$ ./tools/testing/kunit/kunit.py run --raw_output  \
>> 		--kunitconfig drivers/gpu/drm/xe/.kunitconfig xe_rtp
>> 	...
>> 	[13:46:14] Starting KUnit Kernel (1/1)...
>> 	KTAP version 1
>> 	1..1
>> 	    KTAP version 1
>> 	    # Subtest: xe_rtp
>> 	    1..3
>> 	    ok 1 xe_rtp_process_basic
>> 	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000001, set: 00000001, masked: no): ret=-22
>> 	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000003, set: 00000003, masked: no): ret=-22
>> 	    ok 2 xe_rtp_process_dup
>> 	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000001, set: 00000001, masked: no): ret=-22
>> 	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000003, set: 00000003, masked: no): ret=-22
>> 	    ok 3 xe_rtp_process_incompat_types
>> 	# xe_rtp: pass:3 fail:0 skip:0 total:3
>> 	# Totals: pass:3 fail:0 skip:0 total:3
>> 	ok 1 xe_rtp
>> 	[13:46:14] Elapsed time: 6.800s total, 0.002s configuring, 6.682s building, 0.073s running
>>
>> Note that the ERRORs in the kernel log are expected since it's testing
>> non-disjoint or incompatible entries.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> Reviewed-by: Maarten Lankhorst<maarten.lankhorst@linux.intel.com>
>> ---
>>  drivers/gpu/drm/xe/Kconfig.debug       |   1 +
>>  drivers/gpu/drm/xe/tests/Makefile      |   7 +-
>>  drivers/gpu/drm/xe/tests/xe_rtp.c      | 201 +++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/tests/xe_rtp_test.c |  64 ++++++++
>>  drivers/gpu/drm/xe/tests/xe_rtp_test.h |  15 ++
>>  drivers/gpu/drm/xe/xe_rtp.c            |   4 +
>>  6 files changed, 290 insertions(+), 2 deletions(-)
>>  create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp.c
>>  create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_test.c
>>  create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_test.h
>>
>> diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
>> index 93b284cdd0a2..11bb13c73e7b 100644
>> --- a/drivers/gpu/drm/xe/Kconfig.debug
>> +++ b/drivers/gpu/drm/xe/Kconfig.debug
>> @@ -66,6 +66,7 @@ config DRM_XE_KUNIT_TEST
>>  	depends on DRM_XE && KUNIT && DEBUG_FS
>>  	default KUNIT_ALL_TESTS
>>  	select DRM_EXPORT_FOR_TESTS if m
>> +	select DRM_KUNIT_TEST_HELPERS
>>  	help
>>  	  Choose this option to allow the driver to perform selftests under
>>  	  the kunit framework
>
>But now we're mixing proper isolated tests with HW-interacting ones.
>Can we move the HW-interacting ones to a separate Kconfig which is not
>included in .kunitconfig and doesn't set its default value using
>KUNIT_ALL_TESTS?

I'm not sure moving them to a separate kconfig is good, because that
would mean people building without one or the other. The only case it
makes sense to build without the hw-interacting ones would be for when
we are building for UML.

I want to make sure the kconfig from CI includes both and people can
run under !UML both of them.

On the positive side for your approach, we'd be moving the
*HW-interacting* ones to a separate config. This means we can create the
split between the true unit tests and the ones just using the kunit
infrastructure. I will give this a try and see how it looks in the end.

I've been advocating for a split on a name-basis, calling these unit
tests as sw_* and the others as hw_*. Then running just the sw ones is
simply a matter of passing it as argument to kunit.py

>> diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests/Makefile
>> index 47056b6459e3..c5c2f108d017 100644
>> --- a/drivers/gpu/drm/xe/tests/Makefile
>> +++ b/drivers/gpu/drm/xe/tests/Makefile
>> @@ -1,4 +1,7 @@
>>  # SPDX-License-Identifier: GPL-2.0
>>
>> -obj-$(CONFIG_DRM_XE_KUNIT_TEST) += xe_bo_test.o xe_dma_buf_test.o \
>> -	xe_migrate_test.o
>> +obj-$(CONFIG_DRM_XE_KUNIT_TEST) += \
>> +	xe_bo_test.o \
>> +	xe_dma_buf_test.o \
>> +	xe_migrate_test.o \
>> +	xe_rtp_test.o
>> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp.c b/drivers/gpu/drm/xe/tests/xe_rtp.c
>> new file mode 100644
>> index 000000000000..92e2c2b8b44d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/tests/xe_rtp.c
>> @@ -0,0 +1,201 @@
>> +// SPDX-License-Identifier: GPL-2.0 AND MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include "tests/xe_rtp_test.h"
>> +
>> +#include <linux/string.h>
>> +#include <linux/xarray.h>
>
>This test is not using xarray.
>
>> +
>> +#include <kunit/test.h>
>> +
>> +#include "regs/xe_gt_regs.h"
>> +#include "regs/xe_reg_defs.h"
>> +#include "xe_rtp.h"
>> +
>> +#undef _MMIO
>> +#undef MCR_REG
>> +#define _MMIO(x)	_XE_RTP_REG(x)
>> +#define MCR_REG(x)	_XE_RTP_MCR_REG(x)
>> +
>> +#define REGULAR_REG1	_MMIO(1)
>> +#define REGULAR_REG2	_MMIO(2)
>> +#define REGULAR_REG3	_MMIO(3)
>> +#define MCR_REG1	MCR_REG(1)
>> +#define MCR_REG2	MCR_REG(2)
>> +#define MCR_REG3	MCR_REG(3)
>> +
>> +static bool match_yes(const struct xe_gt *gt, const struct xe_hw_engine *hwe)
>> +{
>> +	return true;
>> +}
>> +
>> +static bool match_no(const struct xe_gt *gt, const struct xe_hw_engine *hwe)
>> +{
>> +	return false;
>> +}
>> +
>> +/* Basic entries: same register, only one action, disjoint values */
>> +static const struct xe_rtp_entry basic_entries[] = {
>> +	{ XE_RTP_NAME("basic-yes-1"),
>> +	  XE_RTP_RULES(FUNC(match_yes)),
>> +	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
>> +	},
>> +	{ XE_RTP_NAME("basic-yes-2"),
>> +	  XE_RTP_RULES(FUNC(match_yes)),
>> +	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(1)))
>> +	},
>> +	{ XE_RTP_NAME("basic-no-3"),
>> +	  XE_RTP_RULES(FUNC(match_no)),
>> +	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(2)))
>> +	},
>> +	{ XE_RTP_NAME("basic-no-4"),
>> +	  XE_RTP_RULES(FUNC(match_yes), FUNC(match_no)),
>> +	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(3)))
>> +	},
>> +	{ XE_RTP_NAME("basic-yes-clr-1"),
>> +	  XE_RTP_RULES(FUNC(match_yes)),
>> +	  XE_RTP_ACTIONS(CLR(REGULAR_REG1, REG_BIT(4)))
>> +	},
>> +	{ XE_RTP_NAME("basic-yes-clr-2"),
>> +	  XE_RTP_RULES(FUNC(match_yes)),
>> +	  XE_RTP_ACTIONS(CLR(REGULAR_REG1, REG_BIT(5)))
>> +	},
>> +	{}
>> +};
>> +
>> +void xe_rtp_process_basic(struct kunit *test)
>> +{
>> +	struct xe_device *xe = test->priv;
>> +	struct xe_reg_sr *reg_sr = &xe->gt[0].reg_sr;
>> +	const struct xe_rtp_entry *rtp_entry;
>> +	const struct xe_reg_sr_entry *sre, *sr_entry = NULL;
>> +	unsigned long idx, count = 0, set_bits = 0, clr_bits = 0;
>> +
>> +	xe_reg_sr_init(reg_sr, "basic", xe);
>> +	xe_rtp_process(basic_entries, reg_sr, &xe->gt[0], NULL);
>> +
>> +	xa_for_each(&reg_sr->xa, idx, sre) {
>> +		count++;
>> +		sr_entry = sre;
>> +	}
>> +
>> +	/*
>> +	 * Same REGULAR_REG1 register being used: all the entries should
>> +	 * coalesce into a single entry
>> +	 */
>> +	KUNIT_ASSERT_EQ(test, count, 1);
>> +
>> +	/* Only bits in the entries named *-yes* are set */
>> +	for (rtp_entry = basic_entries; rtp_entry && rtp_entry->name; rtp_entry++) {
>> +		if (!strstr(rtp_entry->name, "-yes"))
>> +			continue;
>> +
>> +		clr_bits |= rtp_entry->actions[0].clr_bits;
>> +		set_bits |= rtp_entry->actions[0].set_bits;
>> +	}
>
>To keep the test simple, we should hardcode the expected value rather
>than compute it inside the test.
>
>> +
>> +	/* implementation detail of RTP - SET() also clears */
>> +	clr_bits |= set_bits;
>> +
>> +	KUNIT_EXPECT_EQ(test, clr_bits, sr_entry->clr_bits);
>> +	KUNIT_EXPECT_EQ(test, set_bits, sr_entry->set_bits);
>
>All 3 tests follow very similar logic.
>I would suggest adding a name and expected values to entries, something
>like:
>
>struct xe_rtp_test {
>	name;
>	expected_set_bits;
>	expected_clr_bits;
>	expected_count;
>	*entries;
>};
>
>static const struct xe_rtp_test xe_rtp_tests[] {
>	{ .name = "process basic",
>          .expected_count = 1,
>	  (...)
>	  .entries = (const struct xe_rtp_entry[]) {
>		{ XE_RTP_NAME("incompat-types-yes-1"),
>		(...)
>		}
>	},
>	{ .name = "process dup",
>	  (...)
>	},
>	(...)
>};
>
>And then we could handle all 3 test cases as a single parameterized test
>with KUNIT_CASE_PARAM

At the time I wrote these tests, it didn't seem worth it as I don't see
us extending or adapting much of the rtp tests. For the WAs I followed
the param approach as we will keep changing them.

Anyway, I will give this a try.

thanks
Lucas De Marchi

>
>> +}
>> +EXPORT_SYMBOL(xe_rtp_process_basic);
>> +
>> +/*
>> + * Duplicate entries - same register register, only one action,
>> + * with actions trying to set/clear bits already changed in previous entries
>> + */
>> +static const struct xe_rtp_entry dup_entries[] = {
>> +	{ XE_RTP_NAME("dup-entries-yes-1"),
>> +	  XE_RTP_RULES(FUNC(match_yes)),
>> +	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
>> +	},
>> +	{ XE_RTP_NAME("dup-entries-no-2"),
>> +	  XE_RTP_RULES(FUNC(match_yes)),
>> +	  /* should be dropped as it's the same as a previous */
>> +	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
>> +	},
>> +	{ XE_RTP_NAME("dup-entries-no-3"),
>> +	  XE_RTP_RULES(FUNC(match_yes)),
>> +	  /* should be dropped as not disjoint */
>> +	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_GENMASK(1, 0)))
>> +	},
>> +	{}
>> +};
>> +
>> +void xe_rtp_process_dup(struct kunit *test)
>> +{
>> +	struct xe_device *xe = test->priv;
>> +	struct xe_reg_sr *reg_sr = &xe->gt[0].reg_sr;
>> +	const struct xe_reg_sr_entry *sre, *sr_entry = NULL;
>> +	unsigned long idx, count = 0;
>> +
>> +	xe_reg_sr_init(reg_sr, "duplicate values", xe);
>> +	xe_rtp_process(dup_entries, reg_sr, &xe->gt[0], NULL);
>> +
>> +	xa_for_each(&reg_sr->xa, idx, sre) {
>> +		count++;
>> +		sr_entry = sre;
>> +	}
>> +
>> +	/*
>> +	 * Same REGULAR_REG1 register being used: all the entries should
>> +	 * coalesce into a single entry
>> +	 */
>> +	KUNIT_EXPECT_EQ(test, count, 1);
>> +	KUNIT_EXPECT_EQ(test, sr_entry->set_bits, REG_BIT(0));
>> +}
>> +EXPORT_SYMBOL(xe_rtp_process_dup);
>> +
>> +/*
>> + * Incompatible types: same register register, but entries trying to set the
>> + * same register passing incompatible types (masked / mcr)
>> + */
>> +static const struct xe_rtp_entry incompat_types_entries[] = {
>> +	{ XE_RTP_NAME("incompat-types-yes-1"),
>> +	  XE_RTP_RULES(FUNC(match_yes)),
>> +	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
>> +	},
>> +	{ XE_RTP_NAME("incompat-types-no-2"),
>> +	  XE_RTP_RULES(FUNC(match_yes)),
>> +	  /* dropped since has incompatible type with previous entry */
>> +	  XE_RTP_ACTIONS(SET(MCR_REG1, REG_BIT(1)))
>> +	},
>> +	{ XE_RTP_NAME("incompat-types-no-3"),
>> +	  XE_RTP_RULES(FUNC(match_yes)),
>> +	  /* dropped since has incompatible type with previous entry */
>> +	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(2),
>> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>> +	},
>> +	{ XE_RTP_NAME("incompat-types-no-3"),
>> +	  XE_RTP_RULES(FUNC(match_yes)),
>> +	  /* dropped since has incompatible type with previous entry */
>> +	  XE_RTP_ACTIONS(SET(MCR_REG1, REG_BIT(3),
>> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>> +	},
>> +	{}
>> +};
>> +
>> +void xe_rtp_process_incompat_types(struct kunit *test)
>> +{
>> +	struct xe_device *xe = test->priv;
>> +	struct xe_reg_sr *reg_sr = &xe->gt[0].reg_sr;
>> +	const struct xe_reg_sr_entry *sre, *sr_entry = NULL;
>> +	unsigned long idx, count = 0;
>> +
>> +	xe_reg_sr_init(reg_sr, "incompatible types", xe);
>> +	xe_rtp_process(incompat_types_entries, reg_sr, &xe->gt[0], NULL);
>> +
>> +	xa_for_each(&reg_sr->xa, idx, sre) {
>> +		count++;
>> +		sr_entry = sre;
>> +	}
>> +
>> +	/* Just the first entry is added, the rest are incompatible */
>> +	KUNIT_EXPECT_EQ(test, count, 1);
>> +	KUNIT_EXPECT_EQ(test, sr_entry->set_bits, REG_BIT(0));
>> +}
>> +EXPORT_SYMBOL(xe_rtp_process_incompat_types);
>> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>> new file mode 100644
>> index 000000000000..4a12aad3f759
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>
>There's no need to have this as a separate file.
>We can move the contents of tests/xe_rtp.c into tests/xe_rtp_test.c and
>include tests/xe_rtp_test.c directly in xe_rtp.c
>
>-Michał
>
>> @@ -0,0 +1,64 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include "xe_rtp_test.h"
>> +
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_kunit_helpers.h>
>> +
>> +#include <kunit/test.h>
>> +
>> +#include "xe_device_types.h"
>> +
>> +static void xe_fake_device_init(struct xe_device *xe)
>> +{
>> +	xe->gt[0].xe = xe;
>> +}
>> +
>> +static int xe_rtp_test_init(struct kunit *test)
>> +{
>> +	struct xe_device *xe;
>> +	struct device *dev;
>> +
>> +	dev = drm_kunit_helper_alloc_device(test);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
>> +
>> +	xe = drm_kunit_helper_alloc_drm_device(test, dev,
>> +					       struct xe_device,
>> +					       drm, DRIVER_GEM);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
>> +
>> +	xe_fake_device_init(xe);
>> +	xe->drm.dev = dev;
>> +	test->priv = xe;
>> +
>> +	return 0;
>> +}
>> +
>> +static void xe_rtp_test_exit(struct kunit *test)
>> +{
>> +	struct xe_device *xe = test->priv;
>> +
>> +	drm_kunit_helper_free_device(test, xe->drm.dev);
>> +}
>> +
>> +static struct kunit_case xe_rtp_tests[] = {
>> +	KUNIT_CASE(xe_rtp_process_basic),
>> +	KUNIT_CASE(xe_rtp_process_dup),
>> +	KUNIT_CASE(xe_rtp_process_incompat_types),
>> +	{}
>> +};
>> +
>> +static struct kunit_suite xe_rtp_test_suite = {
>> +	.name = "xe_rtp",
>> +	.init = xe_rtp_test_init,
>> +	.exit = xe_rtp_test_exit,
>> +	.test_cases = xe_rtp_tests,
>> +};
>> +
>> +kunit_test_suite(xe_rtp_test_suite);
>> +
>> +MODULE_AUTHOR("Intel Corporation");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.h b/drivers/gpu/drm/xe/tests/xe_rtp_test.h
>> new file mode 100644
>> index 000000000000..a2f1437d6299
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: GPL-2.0 AND MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_RTP_TEST_H_
>> +#define _XE_RTP_TEST_H_
>> +
>> +struct kunit;
>> +
>> +void xe_rtp_process_basic(struct kunit *test);
>> +void xe_rtp_process_dup(struct kunit *test);
>> +void xe_rtp_process_incompat_types(struct kunit *test);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>> index cb9dd894547d..f634558b6e50 100644
>> --- a/drivers/gpu/drm/xe/xe_rtp.c
>> +++ b/drivers/gpu/drm/xe/xe_rtp.c
>> @@ -186,3 +186,7 @@ bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
>>
>>  	return dss >= dss_per_gslice;
>>  }
>> +
>> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>> +#include "tests/xe_rtp.c"
>> +#endif
>> --
>> 2.39.0
>>
