Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCD0EB64D7
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 18:13:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B5E10E025;
	Wed, 28 Jun 2023 18:13:31 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A4A10E04F
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jun 2023 18:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687976009; x=1719512009;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0H9WtDjYzQlJWt4cKonURTWFbHmsROvzKFVzD0B15lA=;
 b=A4F9IlKK2QSQkc92PX+8Jges92+ZHKNkEzy+sAWepZm9uvN03puGLueZ
 CzGn8mP89w4+c6tGvSp844n3E/Pa7rKtEREfkkzrzNCn5gwpb0C8scc9k
 8/QhNUsYykkuJPCd3U/IGS8KtocTSyuZMOCZM+RFqesGlAe2vbwaqTjeu
 dx9Pr6cX2Rgx5b+Ltd1lAdSBp4V8U0Kx5orFLNTt66fB8qo3M+dv7CA/w
 QTLOtyn8CBSRdG+KxhP4LbwTJEoXa9OaamvCIG+uxVCBEsVqMxdjUckVV
 0xPhRrgoTVffIMeLm4qiUpoMQU8NpzWt+v6NVlxe5Mf2cbbiiM67oTaNu A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="392646381"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="392646381"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 11:13:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="694371349"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="694371349"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 28 Jun 2023 11:13:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 11:13:26 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 28 Jun 2023 11:13:26 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 28 Jun 2023 11:13:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLzHawCcfthpoz0q3RwjsBZvrYcx0yrSOdP7fqV9zoWadQ6JHpJbvlC2aHFq8wVt39/SvCG2LdA6pQl5YxgNl64kd+54rdYa+ZU8gmeTRMrSGsX/utxwuy9Hl+DQ5PyyecbKLgiU4WrUj7m9R35Jcrd21o7Ik4POOfm9GpdinHPJQ38tfbX6VdCBTJUWRTnRfmvHQnVJs+NHhclBVyqZK/HWpvSPiJzOKPmsnHzgr4ro4XKYkkD/DAWcd71aOahFnS5NBPtriEdbB3sWmCc55hAwUWI1xDGxaBCZwWmBxbBag/PpAdE3U0C30qkXUZSEuBCiGG8USDyHcG6Y+MGFYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HF/PPWd5/DZU3l70lMKSLWuzT5X6Cs7tLuAq+rGSG5U=;
 b=HsnGRqJ7EaTsQDGhw5SvQfiUfx6cBDkrLh6gCwAMeOQCEif9c8JOQXnc7Z7WfgvbVrfvJNyhF3ZVKQJGw+3SObse5xh+cSju1ABqvVpdcqxOkbuSi3/CjWJuFOa41ID/5R6gpEf14XyabvoXscv+6zebWpmrWP2DMwiRkB1unD0S5eL+HF6bh63Ad4A5ZiTBh3WoDBB5UwQM+c9PrOAfRW+dF0oKukR+FtHboknZ0VfGhqUeBiLBK/UUDFs0dEgqzVnbZYN4zVzOVc9ljJcjITx+MLgx8jU2jryTkduAEWd4MdmQTfJ+hcBhhNJl4AlwgUFFACfFVgX2tpf1MSZlGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by IA1PR11MB7295.namprd11.prod.outlook.com (2603:10b6:208:428::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Wed, 28 Jun
 2023 18:13:23 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::5ec8:e1d9:fbae:5b2a]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::5ec8:e1d9:fbae:5b2a%5]) with mapi id 15.20.6521.026; Wed, 28 Jun 2023
 18:13:23 +0000
Message-ID: <7d9f2e0d-2223-cda9-30ff-a0b4392fcc52@intel.com>
Date: Wed, 28 Jun 2023 11:13:05 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230628001642.3170070-1-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20230628001642.3170070-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0101.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::42) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|IA1PR11MB7295:EE_
X-MS-Office365-Filtering-Correlation-Id: a8e5f5db-bf9f-46e4-ea9d-08db78035c57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PmpOyjWC15Qm14Z6KbGwx476PmwxpG3resmWgMETQlNgBIIkBqLEet1euJNC0Wy/m8uBUNzoKvrjPM2A9Kt6bzsiXCzPGGSO3QJtguP1le0vt+L/WW9hFpgm00PnNSlXkGb8tE9rCxq34tnrPUkpUP1Dv8dL/qpGHwACxgwv22RJmqhDhPnhFdXq4tv5/AfOolKVvSCcBQ1OjgjBaKoOLqhvGTTYlJzAo4wfSEJ+PgBx2esztD2SYnyaY/euaE9rHv+/Md6Q+U7pPkNp3yppmZcsSCLzRevOZqlzorhKsWTzKM2TkWw4mrdZ7GzxaVSGy3+y4bxUXKsi6BrhUZK971hCreLAw6W0tEsFExf5UevbzaHNeOjXbu7+ct+IzgobEDV0nJf2lIbvsBs/6wCkZoWks9PV1nd4x+orjyqDO93pywrje5N2nhAkwXZPH2NAc2X4/kMcVBLYLAEh7L9iBAekSEz8Me8uLcXBBq0FIlOjwI8h9ijh6uQFS2LZCELkJy+0Js1XyrirNRgp7LopZh6Kr1ifwJh8MVRQQczqa3lS428kPbTvN36MYwiVn+q7szVF6t/xjq/KASVf4xBLnrFmDgcLs0M8PP+D1Qg9EQIUugzrpS2CPVP36+qZKncp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(376002)(346002)(396003)(136003)(451199021)(2906002)(186003)(6486002)(107886003)(83380400001)(2616005)(38100700002)(82960400001)(6506007)(6512007)(53546011)(6666004)(26005)(86362001)(966005)(31696002)(41300700001)(478600001)(316002)(36756003)(31686004)(66946007)(66556008)(4326008)(66476007)(5660300002)(8676002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cm5lOGxkZERiME0zOEp2dk9WMTYzMCs0MTBRa01zMHh6ZEN5dmxYcjBpWm9n?=
 =?utf-8?B?TzExSzNBSVdaZ2Nub1dPZnhkTW9XS1Z5MEdwQVdhc3NicUI4aEpCZm5vc2hz?=
 =?utf-8?B?NG9XMWVUZFUzVk41eGdPYkErOG1qV3I5YlZyWnV2K1BjUXUzWkVyamhkVWRX?=
 =?utf-8?B?L1ErVWM0WU5uSXpnd0hhazdrSHpyNmZxc3ZFNjZKbE56MzFBTmxaQkNyczdN?=
 =?utf-8?B?TkFxV2tkWmF5K1kvYTVySGYzZ20vWUJnOWxBTEZtQ0UreDI5czlBbG05ZGZP?=
 =?utf-8?B?R2oxT2JkYmJ6Ymg3ZFpyYWp5N1Q3RWVJOTRCNmJRSWU2UGhkZVl6UUxNQzQw?=
 =?utf-8?B?TUI5dnVuVEw2OERaV0M0NjNBSmh5aHdvWU5ibGxNeldRSHFrQWhjakVhSzBJ?=
 =?utf-8?B?Wk1PdUVHWEZmb2VDaWFtUlJGaDJEMHBBYzlZeEZOeXpYUWFiT01WbGFBd0Y3?=
 =?utf-8?B?MWRVSG9NRkQ4L1NrWEw5aVhSMTM0YkY1Z3diZ2M0Z3RTMGZiVHlwbDVzMWlX?=
 =?utf-8?B?RVllZ29rZGRYa1N3eDRYSG81MXRRekJ5ZEhYRTltZ1VMQkU1cnVkTzRsNmZn?=
 =?utf-8?B?T3NjN1VFZ0ZLU0tscTVwWDVieTFuV1Y4R29mQ3N1Tk8rcm1hbjdwTGFYaThB?=
 =?utf-8?B?RXQwNHRaRmd1WlEyZWZYL0ltUVFWcGh0LzdtWmRiWi84QlhtMVZ5M1BCcG14?=
 =?utf-8?B?TXp6WTBURDBzeVNPT3hGUkNaaXBuT0lhR2dydWNDOUplRHJFM1A1ZGZQN1E4?=
 =?utf-8?B?VW50U2Y1b0tFVm1xU3JnUzErZDlxdlVya2pTdzU2bXJzQ2krS3kxbEhJZStW?=
 =?utf-8?B?OGVuZmlpTko1Q21iRm9uR0dXMXp3eWVocmJlVlhVYjhEVnMrbEh2bGNaYXBG?=
 =?utf-8?B?YkY2RzIvVFdkVnpnRWhNYXlyQy9xeEphZXMyU0syQzN4aXBpNkJmQVpFUCsx?=
 =?utf-8?B?TWpSL0xXaGg0Rm1TTFdNQ2d3RGVOd0pXbWlpaGlQUGV5dllQZzBGekxveFdl?=
 =?utf-8?B?SFVDT3c4TENnMW9ndG42QURJTk4vVG1uSjI1Z3ppUDMraEUrbE1wZHlpbmcx?=
 =?utf-8?B?cVJRdWswSnlZUXovNGJpUkpvSlRFQWZMU2JNaDFJSjBKdGZKcjl3TnExeGxx?=
 =?utf-8?B?Y2FWVnFnaUxpMTNMSDhuYXhwWk5XTVlSckpsaGViQW1YdDg5NWFtdSszbzM3?=
 =?utf-8?B?cHNjOWRFaFI3aFQzbnBydmlVZUZkdnFpTEFWamVtR1JPaFEwelhBNUN2cjds?=
 =?utf-8?B?Vi9ENEtlUkFzN3pwN3lkS283Nkd0QkU4a1pQN24xb1JuZ1gvMVBLUGNLeElC?=
 =?utf-8?B?RHYvSHpTSk5VdTZ1bnBzaHJRNnVtY0Q4eDhEdCtBWEdOdVlsRVc2Y1dtSWU3?=
 =?utf-8?B?cEZMNDlFZ3Y3YjdQdG1kOUlyVE12WGNaOWEvL2taMEdKR2Q3OFNRaUxoNTll?=
 =?utf-8?B?UnhTRGNRMkJVbHBXYW15U3BhY1YzUFRKTXRKQVNBZ3JkRFFDZFZ2V3hhOFdX?=
 =?utf-8?B?d1NnQUJaWXVUNUlPSzFWRlZxOWpoU0ZzRzcyWlRieGhEZ3JjYkk0MjlBcXJr?=
 =?utf-8?B?bHRlQzJ4VGQ2TkVGcU41VCtheno5RWFBazI0RFFyVUVvNnJ0cW9VV3VGMFl2?=
 =?utf-8?B?aG13T1N6bG5zWjdiYTR1N2U4cWJKczdSNVl5VlQ1MDhRdWYxMHpxWnFidVV5?=
 =?utf-8?B?K1hlMFRaU3NDdldBY3NnVjlSa09FY3BJRFZub3k4Y1dyTEM0SkNweXRNK1NF?=
 =?utf-8?B?WGQyR1JSYncrSm5xaUpTZUtKaGIrS3l2UzZtOS9rVmk3bFE4amtsN3RDbnhs?=
 =?utf-8?B?RTYySUdibFZlUHVXSVN1cFhwU0hqYkJXWTFaT0tROXJWS0cwQmczUlFjbGV5?=
 =?utf-8?B?UjI1cmRYVFJCNHd4Y1U4WW9PdWozL2tPNU5tYXRqYzVoTG1hNG9UUktMQ3ZV?=
 =?utf-8?B?ZEcxaUdESjVNRW9uQ0F3Lzl2KzdxRTR1VjNOWlU3WWFnOWp6RThJVVN2TVp5?=
 =?utf-8?B?MVU5QVlGSjRLTTR4TWhtc01KRWg4enVJM3lsMzVlTG5sTmRIUmgrWW1lUCtt?=
 =?utf-8?B?dzNzUyt4STVncTdOc3BmYmhMRUxyZ1JrZW9Tbmt3QWFveGN5VGhCbWFmanVB?=
 =?utf-8?B?bzJHUHlFenNuZmNmdVRmRVVsRE5pOTB2dE93a0VFaUxHNzBINXBzSWFTQ0Fu?=
 =?utf-8?B?cHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8e5f5db-bf9f-46e4-ea9d-08db78035c57
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 18:13:23.4329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qP4c0cOuoxDu2Rsjl6R+PELgwKlMzh0GMNxtU7Ssmc11mK0RImWf+zdXC9UQWprW45R5qLg0i15/cijH6x7BkfxkCwkwNg6UAS70cADJ7KY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7295
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/slpc: Start SLPC before GuC
 submission on reset
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


On 6/27/2023 5:16 PM, Daniele Ceraolo Spurio wrote:
> The SLPC code has a strict 5ms timeout from when the start command is
> queued to when we expect the reply to appear in memory. This works if
> the CT channel is empty, but if the channel is busy there might be an
> extra delay that causes the process to exceeded the timeout. We see
> this issue when a reset occurs while userspace keeps submitting,
> because the submission code is re-enabled first and it will start using
> the channel to service those submissions.
> To fix this, we can simply start SLPC before re-enabling submission.
> This has also the benefit of not allowing submissions to go through with
> an uninitialized SLPC.
>
> Reference: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/375
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 43f862aaacbe..8a9857c78309 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -802,14 +802,10 @@ int xe_guc_start(struct xe_guc *guc)
>   {
>   	int ret;
>   
> -	ret = xe_guc_submit_start(guc);
> -	if (ret)
> -		return ret;
> -
>   	ret = xe_guc_pc_start(&guc->pc);
>   	XE_WARN_ON(ret);
>   
> -	return 0;
> +	return xe_guc_submit_start(guc);;

LGTM,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>


>   }
>   
>   void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
