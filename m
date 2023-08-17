Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30C1C3DA70
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 18:21:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8791C10E576;
	Thu, 17 Aug 2023 18:21:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6568F10E576
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 18:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692296477; x=1723832477;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=T5eFYe947A71+/fMgJP5Q+nTAuBZ7TEG5DN9HyZ0TYk=;
 b=FZvOB8hsgi7FNvfPvPgj54OI3EPrdhFWZVuRnMqN9PDVYjx53k6eS2V7
 izosa5WShuEXTxdVmOlRGLFadAHanFI7NpwN/BUhb3bVSBXcwngjEVfWN
 0cfKMC/ZBcFROtKNbFUqefOvwXrWcsXgPaDjTjC+Z6H8BQQ73mPCgiEbJ
 6WW/BjqYzJGVoS6dvgTXqmqezxAXDwp9tpfQNRAloZNmsmdIZllB77V+6
 MP9vLp/0mwvDOyeKO2K6J3/s51mm6hr4HsgbiK8DyCghd2sL7oqZtBlT4
 bAfX47Nhc7ahVTgqzX4Ru0vYegHmGCKsQAqPLmYYP3/MrvKu4NGttz6o3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="363050859"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="363050859"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 11:21:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="1065388286"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="1065388286"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 17 Aug 2023 11:21:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 11:21:13 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 17 Aug 2023 11:21:13 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 17 Aug 2023 11:21:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDdnUaZWyGgGUCsqRPs7aWhcQDh93H66UPOvmjP18pj3clB/OgKhwvQybjF5uKDB4ZCj0js4neXz+RU88w/W5fLJAibgAYooHFQPKef62yuLtijqBxq1TYsvVX/zLxa8WFw4dhZ8qYBkaNLmXyf1XD+hS6o90QAPaZjPreoZXDU81SYVd81365waB33odH78puEKHpxRV+OWZizG/6ckq0W8jEhnIFXXvvCXKxjAcymxJDzTr7ZYbU9o5NS3tSA1NQ2lxEILgiuBHjcvAGB8MYhPi3atImFDlvWN7/cLBzB/0kcnGaL1C8fApVmHylFZeklKBr3GqiImL9pHziPG1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ls4+trXhSAnq2n2VMaHg3LZ6KhwPE2wZwF3DLK6i1sc=;
 b=Uq2cjzRcTeupK81Kk+gUFnnaNNg72MBhTUggX+neHaUdfc8ixFbF4EMCssJW7VbT3NlfeyLptK3/rBmQRZD2N6cjzXZOAGGhy9mD94Q49E72w54XiPBl4FlsT7POSXGtJhtOk+QneFDErAIW0iR+m7gTQxZdFge5IQFUESs0cQWuUv/AmaGo+SbBFoskwyoYJNIv5snLOcCX4dYJOYDDoz32vsV3Kd32nPoXfqQrNc40P1QRL5K4zd1NFaMfQPFUh0/jvseVQdkQ99wQK813yiOnh5aZBfV3Fkq42i50cyht2wfc0NQc3eE5jvJuLryQyYU2bUV8n9h+cUCXvQgXvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7617.namprd11.prod.outlook.com (2603:10b6:a03:4cb::9)
 by CO1PR11MB4899.namprd11.prod.outlook.com (2603:10b6:303:6e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 18:21:12 +0000
Received: from SJ2PR11MB7617.namprd11.prod.outlook.com
 ([fe80::a014:919b:81d9:3e2f]) by SJ2PR11MB7617.namprd11.prod.outlook.com
 ([fe80::a014:919b:81d9:3e2f%7]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 18:21:12 +0000
Message-ID: <fefe30b6-8e85-d839-dbdf-18d78df10910@intel.com>
Date: Thu, 17 Aug 2023 11:21:10 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20230815235606.804366-1-zhanjun.dong@intel.com>
 <5bda2666-6354-c351-6b5e-4118c7397295@intel.com>
 <SN6PR11MB2622115F88C78A2CEA8A2F538F1AA@SN6PR11MB2622.namprd11.prod.outlook.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <SN6PR11MB2622115F88C78A2CEA8A2F538F1AA@SN6PR11MB2622.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0059.prod.exchangelabs.com (2603:10b6:a03:94::36)
 To SJ2PR11MB7617.namprd11.prod.outlook.com
 (2603:10b6:a03:4cb::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7617:EE_|CO1PR11MB4899:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c07c6e5-9cd6-424d-4048-08db9f4ebc57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KiAHhjjJ4XNhRXXkItwEaEKVPST6tS7ul+zB2BCCInsJvfAhhZCv6SOyi+7tRnNSRNaVbs2thrTmq9e+x1nZ9uaG7Y+6yE7EDaw5h1fT8Mj+aq1VYnjUllu9JYyCbXDHy1Dd9QBEdB5AWTz+0Yg96uGEQQwHAS6b86X2dfAxN0FiWKHFdVSj/BzUrqyo9zFxbdPWBvEbqFDsx3XQUBMpQCr576MMB25zND+uqo12WR5mQ6uSHPfhX8V/7hTH9akNO3P9DlqTw+SmdS755ju6RRw8DnBGuqNMAc3KAfr9Y5fz29H+WPu41RoUyAzG+QTVdWh8bNohIrfZpGIs9T/qkUencBVXJYUOMZT1amofchpdFIN4wwB3HBJRbdIuw0KeTdtMOz66f9P1lnBui+HCh1+nH5Ew45A3xrNKekh23RHpv8/D6s3VmJitaOU3XHX3V6RYDhIGhgd/g+FYKa6XAOGNjyuirb3a2TXcJdBw6nuLVD0lwaBC8RzC8z9mcsPqeNsatttCiBTFU16mp9reTt61gc3RCyCCUK8BqWWgHTWjePnRklqBP+esJP09IOL0IMTn8XMPX0IFheXT4efeeXpxDi7WJu3nQ8n7/59nvrjqCmcohatl16lZTBeHC4HHzhaQN/rU8TBGqqdTtZc1kQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7617.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(346002)(136003)(396003)(39860400002)(1800799009)(186009)(451199024)(83380400001)(2906002)(66556008)(478600001)(6506007)(66476007)(66946007)(6486002)(316002)(53546011)(110136005)(5660300002)(2616005)(6512007)(8936002)(41300700001)(8676002)(26005)(86362001)(36756003)(31696002)(38100700002)(82960400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2ZmeEI2eDMzTlhzb2FrT1ZoREVPeWo4MEZZSnFyS1FMT0Rqa3NmelhTMHhT?=
 =?utf-8?B?elhMUVJSeGdHRXN2NFNPWUxEKzZFZTJHWVcvQmlNcWQ2VXYwUUExUjlDVkdI?=
 =?utf-8?B?N1VITTRNSk84bFM2UGltemFUcWpLeEF4WSt6VnQwZkZGSEJPL3RGOU03RUNG?=
 =?utf-8?B?ZDRFc0hORU9aV2s1RzkwSUMrSU5QMDhIY2w1RGg5aE93d3NBazl0QndTeTJu?=
 =?utf-8?B?K1lONWZvNDhTaHhyY2p2Q1hCRExQNHZXblB2dVhmSEdFTmRHa2ptaVI4TU83?=
 =?utf-8?B?cjhmT21ka21jTHB2dGRiKzFKTFVRL2g2R3Q3UzhyaEZJVG0raWRQazY3alRF?=
 =?utf-8?B?aEhvRkNxUkdjVmc2ZjdHV0s0M2FDUXlvbU1ncHZhMmx2MGpLbXorN2tPbTVy?=
 =?utf-8?B?NjRhekxsL3pYaTgzVnJvUGVJN0NCZDBLSkVZamd1WWVYYUdBUlIrM0RwdDhk?=
 =?utf-8?B?Uk5IdDR6VnkrVlFycnpZMzA1SVA2TWpjOFQ5dHcxRHJ6WVVhbGI2dWtWd3pV?=
 =?utf-8?B?MmN0SHo1T3p5WXlhOFlGR3Y2OUFDcm1ZUm1jUld2OHY5bVBxL0pyaDAvUFd3?=
 =?utf-8?B?ZHBoNHNBNCs2U3NxK2g1R2NCNGJkK1hpQi9mK0d0RElJdDdKYW1iUXpTR2J5?=
 =?utf-8?B?OTFiUjBZK2NuUW9rS0FmNTd4K0VKQUhLbVhubGNuY1JWMm1sa2gyU1pRenda?=
 =?utf-8?B?YzVBZEx3UmZ6SUpBeWxsT3ZPTlQxWlJZcHFGbXoyNGVEZFFGMGVGS1ZtdUZH?=
 =?utf-8?B?MVFsN2JWU095RWh5RHAxeGFsWmh1NkhVZ21zVFVBWUtXSm5ycUVMOTNoZE9s?=
 =?utf-8?B?VG9xSkVTRWd2M2txQmxSWjBsQjkzQU50QWt2OWpaSyt2Z1p1M1FBdkJaSUFj?=
 =?utf-8?B?dkYzMXV5OUFsakxZVXFZSVkrckJmYURmVVRJZTlXSEgrMStaK25tTEs3bGFz?=
 =?utf-8?B?Qk5va3lQcGdWZk5YVzFQdTdLdGlFd1hza3V0bWJrVThDSEJyYW9uWFlwS2Rl?=
 =?utf-8?B?cHlHY3BDNFNTaURjOHVHWFBjamMwMzZUR09ZbXV6TVRKVUNBakFFN2VHZ0dK?=
 =?utf-8?B?WXdYWVFtR21DS3dmTUxLeDZyQXYwaEhpaER0R05BZ0xWc1lvVzZKS2dZdHBN?=
 =?utf-8?B?S0M1a1FWT3hlemsxOTZhYkZHc1ZlYXIyYks3NXFTekJpL2tLd3MrOFM4WThI?=
 =?utf-8?B?VDdyZmk4NmxlcUUxMzBVcVZmcGZkYUdWNHZqUk9KTk9kazNZN1RpS0dtaTk5?=
 =?utf-8?B?cmVMdlA5cVFYYW9rZ2VKMWpkS21TY3AwQWQ1bWs3UTFFRkZGa3BXSDQ4ZHVa?=
 =?utf-8?B?RStYS25jRENOakRaN3g1Sk5RYjNQb0JrN0VZZDVjN0puazRIVVFnWUxoQnBU?=
 =?utf-8?B?ZWpndzRaRS91M1VEVHFRangyOHRRckphZ0VMMWI4MmIxTW5jaFZZZGtXRWtE?=
 =?utf-8?B?Wjd6WXRCNnVkM2lJaDlacVIxSGJ3ZFZCQ2hCTEpkSnVTaXc4UmNxTEpWUHVX?=
 =?utf-8?B?b3A0KzhPUTZBQjBFQjRaZzAybk9KeCtpNCszd212SjI0NkRpM3hROFh4YW5i?=
 =?utf-8?B?eWZhNGVJZlZseE5Gcm96R1d4dE9IQkJaQVgwSnJsY2g4aG03ZGlxN1RrUklY?=
 =?utf-8?B?SDRMV2NURElZdXkxOVFZaEtGUEF0ZVBFSHNRV05wVG5Jdmg3M2hPRGtEUnZz?=
 =?utf-8?B?QmdnM2Y0NnVkTS83VTVvRUFhYUlGU1Zzcm1wejJhaGphNll6Szd2eTN3TzBy?=
 =?utf-8?B?TzB2akU0QjdaeGJZUC92dnpZSk9RVTdHVHgxVlpnWE5NVVZQQmdKQ1BHVlQy?=
 =?utf-8?B?M0FrM0c0YjhXM2NJUXptZ3FXVVBianlNeTRwR1BCTVJZdm1Wb2FZWmlBSDFE?=
 =?utf-8?B?SHREWVFXMGh4azdlWUxCZG1mU1NZZXdwVVlibjdiQ2l4SzFScm1sWTZaTkp4?=
 =?utf-8?B?dVh0N2JCU2VtZlNrMytValZwV3cram1SdG01Y09GT01PaWVXaGlCVUZ0UnB3?=
 =?utf-8?B?a0NiSVU3OXlvM2pEVmtwbUpvR1l4VGp5U2EwY1lPREQ0c2FLSUcvNXVGYnlj?=
 =?utf-8?B?Ym81QXExMnBqeDJ3OGcvS2o5ZEJ4LzdoMUM5cjM5NmFtTkdiODF3OGk4RkhC?=
 =?utf-8?B?Ukt4Q0tib1ZQeWxRM2RSUnFreVBuSVBqMytWSU1jaHNMUW1pTFdIcmRVdk1a?=
 =?utf-8?Q?UtilbqQHC+YMHmnvudiQW8s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c07c6e5-9cd6-424d-4048-08db9f4ebc57
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7617.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 18:21:12.0133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LK9c4FSMFU0Ps/byKRgECPizrkJ0oKJYEEkTvw+FAVTJVl+4yJLydLdZrgfW2Vycv6fcJK+mXMCfpAvoyXrMwDv8xp+uQfeY5YKqM6Fyhss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4899
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Add patch version on guc firmware
 init
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



On 8/16/2023 5:48 PM, Dong, Zhanjun wrote:
>
>> -----Original Message-----
>> From: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>
>> Sent: August 16, 2023 4:47 PM
>> To: Dong, Zhanjun <zhanjun.dong@intel.com>; intel-xe@lists.freedesktop.org
>> Subject: Re: [Intel-xe] [PATCH] drm/xe: Add patch version on guc firmware init
>>
>>
>>
>> On 8/15/2023 4:56 PM, Zhanjun Dong wrote:
>>> Add patch version info on GuC firmware init. This is required info for
>>> GuC log decoder.
>>>
>>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_uc_fw.c       | 7 +++++--
>>>    drivers/gpu/drm/xe/xe_uc_fw_types.h | 2 ++
>>>    2 files changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c
>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>>> index 6c95a3e4c3f2..408b816f9e40 100644
>>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>> @@ -403,11 +403,14 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>>>    					   css->sw_version);
>>>    	uc_fw->minor_ver_found = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
>>>    					   css->sw_version);
>>> +	uc_fw->patch_ver_found = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
>>> +					   css->sw_version);
>>>
>>> -	drm_info(&xe->drm, "Using %s firmware (%u.%u) from %s\n",
>>> +	drm_info(&xe->drm, "Using %s firmware (%u.%u) from %s
>> version %u.%u.%u\n",
>>>    		 xe_uc_fw_type_repr(uc_fw->type),
>>>    		 uc_fw->major_ver_found, uc_fw->minor_ver_found,
>>> -		 uc_fw->path);
>>> +		 uc_fw->path,
>>> +		 uc_fw->major_ver_found, uc_fw->minor_ver_found, uc_fw-
>>> patch_ver_found);
>> Why log major an minor twice? can't you just add the patch number where
>> major and minor are already logged?
> Yes, it log twice. I'm not sure if there are any test case is looking for the existing format of:
> Using %s firmware (%u.%u)
> While the decode is looking for the format of:
> version %u.%u.%u
> So log it twice will make both side happy.
>
> Of course, if no test case or test script is looking for this format, we could simply switch to typical i915 FW version print format to avoid output twice.

If there are any scripts they can be updated. dmesg output is not API so 
we shouldn't try to keep it backward compatible. Just log it once with 
the 3 numbers

>
>> Also, do we need to update xe_uc_fw_print to include the patch number as
>> well?
> For this line printed in xe_uc_fw_print:
> drm_printf(p, "\tversion: wanted %u.%u, found %u.%u\n",
> 		   uc_fw->major_ver_wanted, uc_fw->minor_ver_wanted,
> 		   uc_fw->major_ver_found, uc_fw->minor_ver_found);
> As long as we have the FW bin filename is xx.yy and the above format follows bin filename format, I think this is fine.

This is going to end up in the debugfs info. If we don't have dmesg from 
boot then having the patch info available in debugfs when capturing the 
GuC logs would be useful IMO.

Daniele

>
>> Daniele
>>
>>>    	err = uc_fw_check_version_requirements(uc_fw);
>>>    	if (err)
>>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h
>> b/drivers/gpu/drm/xe/xe_uc_fw_types.h
>>> index 837f49a2347e..444bff83cdbe 100644
>>> --- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
>>> @@ -106,6 +106,8 @@ struct xe_uc_fw {
>>>    	u16 major_ver_found;
>>>    	/** @minor_ver_found: major version found in firmware blob */
>>>    	u16 minor_ver_found;
>>> +	/** @patch_ver_found: patch version found in firmware blob */
>>> +	u16 patch_ver_found;
>>>
>>>    	/** @rsa_size: RSA size */
>>>    	u32 rsa_size;

