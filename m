Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F597CA0EC6
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 00:03:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B22F10E237;
	Tue, 12 Sep 2023 00:03:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF4A910E12F
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 00:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694477030; x=1726013030;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LE3GuoYaB9o474NH+sOY06sFfCO4UJkiaCcgTHMcGMA=;
 b=T5y36QN+15S+1Mag/ZO+orsv2c9/AEq9YdQriQ6qGuWlKZo1u8Jolg2Z
 lkuvqiV2SC4VYbyBYN/20cVbWmO4OVrc+VeXNHA98sUYuahJ/5BqcZ+8K
 h/XUBeQflm98wAU40RcYvEkQnCTujWTy+nrw/ILznGtGhTztpYS4OJ2nG
 JCKD65blfthAUJf8vv8/y1YwMAOyzmfyHzQHHlKbUa5lAxOh7IQBjRvnI
 +ZKVoLTvcUBahhuZqE0haNWfQz9OxAhq3sQIm9/SZ+KqNgmCTCQpLU7AE
 IaS1HZWy/GKjdmgxlekRtD+R9ETKoYgeUvMpHPGOaJfxF5RmSa/UDDLtr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="378145186"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="378145186"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 17:03:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="867146048"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="867146048"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2023 17:03:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 17:03:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 11 Sep 2023 17:03:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 11 Sep 2023 17:03:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WGQ0RpUx9BpN5H/gkfsuXFWJVlVz0aZd5HK0alqqpyuA9LTGMi8E6snMTec2IkhZSGcD11h32qPPtZmoPNWSwjjLFYQKZpT9F/dQTQSiW6Biyrqs1HU3MUt6dxFpoxtO1Y/l6y3leqZTwLT+QXxbmnFvBR5sBJCXdp41cywcmTQjkJr7R3KGUMK2oFVh/8Hh8cdl2WRZlg1v6zZNqINg/CiM8rkaEpVabZg4v9RYEGI8X1nN0CNJ0IfGKd8u+vGSNjzpu0ZiyNHh0DQc/01G+BDQOS+GBR4RMC8B5+ZGfsxwCf+AnlVj0oIghZlAbVWz/J3BgWU376H/VjrzPrsA1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=no0OToIxLkshL/OWbPIiC6nxZQB/IikncI9TlDWTBg0=;
 b=YDfY6tFxtIXUUrFOyl7NpsAxZceOqUcV3g/EMyE1qf+jlynCJY37wnB9FssaRGMVUbFGy9ykcSkOl2ANONGwfAhEZ4S462+zN4B4zsCpX0ANftRoCxJ33W6xBaE6GU923AwU8pJnRO8jDawmgIaYxiugBCI2KwmsXdxUO3LUU2eymKufA58YlmFGp00X6sodTJolUBp4hGQw9msIPVWHkd+LAwB+VHjoa3PWCOmRXCoZJ97PIORMXA3X/zbwEVQBGZf/BwCCSuXL7cBP22/HV0lkHRc30EWIVFg026WaPgj2mBasIfa8IpfLDhY8bx2lPIvU5eaR7SjeI7a3/NNtnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by BL3PR11MB6339.namprd11.prod.outlook.com (2603:10b6:208:3b3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Tue, 12 Sep
 2023 00:03:41 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::4b20:e34:71f:139f]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::4b20:e34:71f:139f%4]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 00:03:41 +0000
Message-ID: <54ec3096-452c-4eba-982a-b36fc8e7d7c6@intel.com>
Date: Mon, 11 Sep 2023 17:03:39 -0700
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230802212646.838717-1-daniele.ceraolospurio@intel.com>
 <ba6018b2-ba65-99be-ab77-2b1b2b663fca@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <ba6018b2-ba65-99be-ab77-2b1b2b663fca@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR16CA0012.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::25) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|BL3PR11MB6339:EE_
X-MS-Office365-Filtering-Correlation-Id: daea2e70-e315-4508-e34f-08dbb323b8dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UjE9cTEW7dQSj866lbbsZ0+DLk47DaDSvj1cmWNajhBDWJPCBGBD/b3vjI1odoBvcIgKSk1P7yzTXNeOcRlN0Jvn7XRItSvHxtyaEZx7199DzsOVk/Jv909k1UJGkOjCKlrk9LQtBuMJJ02BKOHS4/8E7GFg+5YDCNzADCPNnrGuZbqFtlQeoRmcf1pQaIVdME/WtunMuZiUtsCaf/Lp1E8X75bvUv63cW7zJV4/Z9wDkjqqwrMN7xRWPGZ1Ldh8Hurap+5pOZqsfVdwV2Byyquma71+F79wHNpdGzxnRClHZ37I4KuZfbXCM9JZ6kd/7DKyQl38QT9GCKxHWjEK7jYNDqnLSAFpEF5kSHe6g1vbHGB0S0j4Q/uytmqckxKfl5s/PIfYmhTB3xxIEF+L+bzOIQjrZenOea3xoG8pGGIu7gtqEgmX7SZ4QodinalO8J6KvvghzhprZnhTRINmjw0ATUsad+X7jui2VqeT7kDr4qdIscUO+zikBJgtgve/6a3kBHsgetRdsVwBREiMlm8M18VbvqZX+8LbgaSJjZ2FzlySuIggWtkCJUsEKA/PqSolAaTuyJlRrYcBTYqBHHMTmCdFnYtLYM4QDe4uVQH2peMD03s+dhgXi9bF8PnO+EynQDEGpXNKCQN4n8CYIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(396003)(376002)(136003)(1800799009)(186009)(451199024)(53546011)(6486002)(6506007)(41300700001)(316002)(478600001)(2906002)(36756003)(86362001)(31696002)(38100700002)(66556008)(82960400001)(66946007)(66476007)(83380400001)(2616005)(5660300002)(107886003)(26005)(8936002)(8676002)(4326008)(31686004)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFA2RUVIR1o1cWdRVXYwNThxOU1SY0xQd3g2eElmaVhoS1ZXbzI0eGJYcFhL?=
 =?utf-8?B?SjBzU25aK2VMU01janhCYVpFRk1SYmhKME84dTRYbW13L1lsNXBsNW5QSThk?=
 =?utf-8?B?dnZpbk9PelJPYU4vQ0VOa3BSQzFtUzJab1NlZEtmTTJCazdSSXlKYXVQQjN4?=
 =?utf-8?B?Tm0yaHJHaWRZalgvQ2ZzYjZnblBoSUU5aVNHa2x0ZGcrbVJveGEyN1ZnV285?=
 =?utf-8?B?bVNTcklPV2Vid3lzbWEyWlRIZWJGYkVWRGRyendGK0NkZEVlYjdoZ3RxSytL?=
 =?utf-8?B?VXBjdFo4cEZYMUF6TW9uRUxQQUVIb010VnhsOC9ZZHllOTY5UVhCcUFLTXdY?=
 =?utf-8?B?Q0NNZjgzbHp4cWdQMENydzVwcDFwWjV3YkNMZDRVZWhTUkJ4cUp4USsyaEFY?=
 =?utf-8?B?L0I1SEZmSzZJdFJjL2REK00zVlpCbVRqRkE5ZkgyTVYvK1o5MEI1UmxCYUZ3?=
 =?utf-8?B?RGtWWk4rTFVBVmVDS1ZsRmx2MjlLTjY1Q1NkR1R5dk5BZTh6RkRQK25PTk5B?=
 =?utf-8?B?eGpOcUJJcXN5WVRIc2ZvOW5GNWc1RUZxcUxUaUcvWlk0eTZpRCtNYTNrenI4?=
 =?utf-8?B?eVR2dEVWOHV2RzBvQ2N4cFJhRDREaXMxZ240b0k4Rks3N2RQWi9JZ1JjVWl4?=
 =?utf-8?B?cENGUld6bFQyRjBtUlhsc2VpRitpejdpMHFCSTErQUNOZ3hhOXpKKzF1VHNQ?=
 =?utf-8?B?d2J2bHI0VlRqNkR2N0FYSGMwRjhUNEZqb3BET25sazgvR3U3NGF1cVBIcXh4?=
 =?utf-8?B?SnViWWZxZG42SDVGV2ExSjR0czl1YjFuZFYwWElmdUpRYWtvRUhWY2UxcjY2?=
 =?utf-8?B?ejN5T1oxb1VMZW54T1czclM5MytnZmVTUHlZNVRqRTdqellvRXMyZzVQL3hp?=
 =?utf-8?B?bTRCNk5jQnFkWW1ZTzR5VFcwa2ZMMVBrYUZsdzlOempBOE96dGVOUUhMS0hU?=
 =?utf-8?B?RmpaUWNreUxsV1BRbEVvYTdxYk9TVzZyL09QZTZzUE1hdS8wUkV0ZDVkcyta?=
 =?utf-8?B?ejFwT3ZwY2tNRnlyU040UGNXc2h4cy85Q20yZm1EekkzKzVyN3RTR1M1eVh2?=
 =?utf-8?B?dTFNQ2MrVms5NEhLMHZNT3pUcld2UzdKNzdDSjI1ckRqMHdQNFlQTU5UUjZ6?=
 =?utf-8?B?aWozSFE1Q212OVIzVzFubTdVSDF2S0JVU0NuZ1lFbHBDK0k3QTJuVmI0Q3Ix?=
 =?utf-8?B?ZnhvTS9aNlhvS1g2Zm83ZDBRUHlqYkpIQnp5Q2hMQkUzYW5vTy9Zbm9MeFBY?=
 =?utf-8?B?cG9LMExEK2RtNnY1R0tGdUlPQjVqRWowa0h5K2h3Ny9uQTE1R3VjYzJ3dGFi?=
 =?utf-8?B?RDR1UXdKTDdXUnlIaUJtcXF4UzNzRVNjUWhHMDFQUHJHeWZ4ZGhvL2VyVUdr?=
 =?utf-8?B?ZGlCMFB3ZUJhOUc1c3Qzc2dNUDdsRXlpZm5RM21aSjRGZ0ZyTFRmRnk1ZHhO?=
 =?utf-8?B?VlBQbXNibTRIQTdLVVNUV0tSZkdsTW1xcFAxMUY1bUxESnYyOFliMWRpQW1w?=
 =?utf-8?B?cVNnSENwTXVBMjVSUDBGVnFKVXBHcjM1OE1IUzMvQ1BNOUF6Tmxvb2trNngz?=
 =?utf-8?B?M3hxTTNON1hrUUhSTkltNjVGQ0Z1QlNVemRGVGRCK3NMSnpYYnU0RUtxR0Np?=
 =?utf-8?B?L0pUTWt3VC9NcXdoWUhvK0FyamV0aCtQVUVSVWk0L3VBTTZCcTVHeldXOFh5?=
 =?utf-8?B?T2RxSkY1MDBDeU9YeUg5N1ZucmZNclQrOXpNcjFUWTBEQ2RjRkJibDBETHVN?=
 =?utf-8?B?LzRyd0FCTXZEREVoZWFMQ0JFT3c3aG5nMzRYMkl2SUpWTTF2SHlLbDVBT1py?=
 =?utf-8?B?eUVFMWJ4ZHNOT0VBWDUrY2VsTnJCOVpkUVVOdFhBN3N1RlB6ZG5FZWNJYUZW?=
 =?utf-8?B?YWZLeDNyQ2l0SWljcWR5Z0tEaTkzUjdXbGtnSldMYTU0Nmg4cG5WTzJwUGJV?=
 =?utf-8?B?ZkdKNTFZamFldmJqYmErSDNBWWc5ekI5cm10US9PMlIrYTF5ejcyZXdDRGRv?=
 =?utf-8?B?YVhRYW1jZHE4aW9EdkxESnQzbUFRWFgyY0NuYW5SQmxzR2tERkpWV0dpYlRi?=
 =?utf-8?B?aXFOMHhKV1cwekVCdlFrM3RxNThYZFViOE9sVjRqeFRLMGZGVjVxYldJRXcr?=
 =?utf-8?B?cnRoeFFadUg5SlZ0ejgxM2xEdHdPZmE5U3diUUxPNitNdk1CSmdjMnNIMklC?=
 =?utf-8?Q?u9Frj/aqWmlP4m69Kl23HkM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: daea2e70-e315-4508-e34f-08dbb323b8dc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 00:03:41.1148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MHrlyjvK0OvWUNiJbfuW2ONtZQbdbKsu2J4YsvBUog/VIiE18jwuKNo9qHMbawuq+HaWaBrBn0CfQ9PtcyFmAWxXJFzC6YIprkvAyNnT5zQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6339
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/uc: Fix uC status tracking
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



On 9/11/2023 4:54 PM, John Harrison wrote:
> On 8/2/2023 14:26, Daniele Ceraolo Spurio wrote:
>> The current uC status tracking has a few issues:
>>
>> 1) the HuC is moved to "disabled" instead of "not supported"
>>
>> 2) the status is left uninitialized instead of "disabled" when the
>>     modparam is used to disable support
>>
>> 3) due to #1, a number of checks are done against "disabled" instead of
>>     the appropriate status.
>>
>> Address all of those by making sure to follow the appropriate state
>> transition and checking against the required state.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc.c   |  3 +++
>>   drivers/gpu/drm/xe/xe_huc.c   | 15 +++++++--------
>>   drivers/gpu/drm/xe/xe_uc.c    | 10 +++++++---
>>   drivers/gpu/drm/xe/xe_uc_fw.c | 14 ++++++++------
>>   drivers/gpu/drm/xe/xe_wopcm.c |  3 +--
>>   5 files changed, 26 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 2493c5859948..7cef5dcf571e 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -228,6 +228,9 @@ int xe_guc_init(struct xe_guc *guc)
>>       if (ret)
>>           goto out;
>>   +    if (!xe_uc_fw_is_enabled(&guc->fw))
>> +        return 0;
>> +
>>       ret = xe_guc_log_init(&guc->log);
>>       if (ret)
>>           goto out;
>> diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
>> index 177cda14864e..35e2fdd07f69 100644
>> --- a/drivers/gpu/drm/xe/xe_huc.c
>> +++ b/drivers/gpu/drm/xe/xe_huc.c
>> @@ -42,22 +42,21 @@ int xe_huc_init(struct xe_huc *huc)
>>       if (ret)
>>           goto out;
>>   +    if (!xe_uc_fw_is_enabled(&huc->fw))
>> +        return 0;
>> +
>>       xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_LOADABLE);
>>         return 0;
>>     out:
>> -    if (xe_uc_fw_is_disabled(&huc->fw)) {
>> -        drm_info(&xe->drm, "HuC disabled\n");
>> -        return 0;
>> -    }
>>       drm_err(&xe->drm, "HuC init failed with %d", ret);
>>       return ret;
>>   }
>>     int xe_huc_upload(struct xe_huc *huc)
>>   {
>> -    if (xe_uc_fw_is_disabled(&huc->fw))
>> +    if (!xe_uc_fw_is_loadable(&huc->fw))
>>           return 0;
>>       return xe_uc_fw_upload(&huc->fw, 0, HUC_UKERNEL);
>>   }
>> @@ -69,7 +68,7 @@ int xe_huc_auth(struct xe_huc *huc)
>>       struct xe_guc *guc = huc_to_guc(huc);
>>       int ret;
>>   -    if (xe_uc_fw_is_disabled(&huc->fw))
>> +    if (!xe_uc_fw_is_loadable(&huc->fw))
>>           return 0;
>>         XE_WARN_ON(xe_uc_fw_is_running(&huc->fw));
>> @@ -106,7 +105,7 @@ int xe_huc_auth(struct xe_huc *huc)
>>     void xe_huc_sanitize(struct xe_huc *huc)
>>   {
>> -    if (xe_uc_fw_is_disabled(&huc->fw))
>> +    if (!xe_uc_fw_is_loadable(&huc->fw))
>>           return;
>>       xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_LOADABLE);
>>   }
>> @@ -118,7 +117,7 @@ void xe_huc_print_info(struct xe_huc *huc, struct 
>> drm_printer *p)
>>         xe_uc_fw_print(&huc->fw, p);
>>   -    if (xe_uc_fw_is_disabled(&huc->fw))
>> +    if (!xe_uc_fw_is_enabled(&huc->fw))
>>           return;
>>         err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index addd6f2681b9..368e4feb57db 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -31,9 +31,10 @@ int xe_uc_init(struct xe_uc *uc)
>>   {
>>       int ret;
>>   -    /* GuC submission not enabled, nothing to do */
>> -    if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
>> -        return 0;
>> +    /*
>> +     * We call the GuC/HuC init functions even if GuC submission is 
>> off to
>> +     * correctly move our tracking of the FW state to "disabled".
>> +     */
>>         ret = xe_guc_init(&uc->guc);
>>       if (ret)
>> @@ -43,6 +44,9 @@ int xe_uc_init(struct xe_uc *uc)
>>       if (ret)
>>           goto err;
>>   +    if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
>> +        return 0;
>> +
>>       ret = xe_wopcm_init(&uc->wopcm);
>>       if (ret)
>>           goto err;
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>> index 2e70dd4880f6..fd53ef9e5c99 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -339,17 +339,19 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>>       XE_WARN_ON(uc_fw->path);
>>         uc_fw_auto_select(xe, uc_fw);
>> -    xe_uc_fw_change_status(uc_fw, uc_fw->path ? *uc_fw->path ?
>> +    xe_uc_fw_change_status(uc_fw, uc_fw->path ?
>>                      XE_UC_FIRMWARE_SELECTED :
>> -                   XE_UC_FIRMWARE_DISABLED :
>>                      XE_UC_FIRMWARE_NOT_SUPPORTED);
>>   -    /* Transform no huc in the list into firmware disabled */
>> -    if (uc_fw->type == XE_UC_FW_TYPE_HUC && 
>> !xe_uc_fw_is_supported(uc_fw)) {
>> +    if (!xe_uc_fw_is_supported(uc_fw))
>> +        return 0;
>> +
>> +    if (!xe_device_guc_submission_enabled(xe)) {
> This is generic code for all firmware types. So why specifically check 
> for GuC submission? Can't we still load the HuC even with GuC 
> submission disabled?

This is an unfortunately named function that is not actually GuC (or 
even submission) specific, but it is actually used to track usage of all 
FWs and related features (see e.g. xe_uc_init). I agree that it could be 
renamed, but that's out of scope for this patch.
Note that there is no way in Xe to load HuC without GuC submission, nor 
there is a plan to add it AFAIK, and even this existing switch is only 
there to turn off the FWs for debug.

Daniele

>
> John.
>
>>           xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_DISABLED);
>> -        err = -ENOPKG;
>> -        return err;
>> +        drm_dbg(&xe->drm, "%s disabled", 
>> xe_uc_fw_type_repr(uc_fw->type));
>> +        return 0;
>>       }
>> +
>>       err = request_firmware(&fw, uc_fw->path, dev);
>>       if (err)
>>           goto fail;
>> diff --git a/drivers/gpu/drm/xe/xe_wopcm.c 
>> b/drivers/gpu/drm/xe/xe_wopcm.c
>> index 9a85bcc18830..bf85d4fa56cc 100644
>> --- a/drivers/gpu/drm/xe/xe_wopcm.c
>> +++ b/drivers/gpu/drm/xe/xe_wopcm.c
>> @@ -139,8 +139,7 @@ static int __wopcm_init_regs(struct xe_device 
>> *xe, struct xe_gt *gt,
>>   {
>>       u32 base = wopcm->guc.base;
>>       u32 size = wopcm->guc.size;
>> -    u32 huc_agent = xe_uc_fw_is_disabled(&gt->uc.huc.fw) ? 0 :
>> -        HUC_LOADING_AGENT_GUC;
>> +    u32 huc_agent = xe_uc_fw_is_available(&gt->uc.huc.fw) ? 
>> HUC_LOADING_AGENT_GUC : 0;
>>       u32 mask;
>>       int err;
>

