Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45978C7113E
	for <intel-xe@archiver.kernel.org>; Fri, 18 Aug 2023 12:39:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5BE810E05E;
	Fri, 18 Aug 2023 12:39:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EEE410E05E
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Aug 2023 12:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692362396; x=1723898396;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DIQXihfiEt1OjZ7eo+8BiDjDbCx9OkzYJqo7namWYn4=;
 b=RzVTORc7TAGOcZkKu30UpF3n/0uRlahVtQ4daKT3of4sY+l0rXrrjwhm
 8NPO0afs85Dh/5dLv3NVjPEdyzLRpDrZfIcAlftyqmhvOvS66suWut4B3
 c4Js5pmrrCT/FEwTvJZFCYlWG0XahKi0LOppWwTKO8pQHkc15jMJF0cn4
 FB/szHDlBC003NjWbdupZMRf9gqBNoZqFlCyNlm6ce30p7tBG+dRvkJ6J
 QuBgjMFO6+kI0vaNPajojSTyJQgaFEuTZwp+jbGa5X7pW0n2An3gKprhE
 6HHjJkXK7dVrJZxb2C4CoNK53sx8yqmvjJSM1LxHd7TtbBKF6+oSkT3b3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="375871910"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="375871910"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 05:39:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="825107861"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="825107861"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 18 Aug 2023 05:39:55 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 05:39:55 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 18 Aug 2023 05:39:55 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 18 Aug 2023 05:39:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SpJLdaRzGWsPB1CiPqmsq3IoF5Vrsg1qGEgM7PpGXIaWFAFngmM1M3Txd2656ZzFof4Mf50nTzAIdZV/as5mrKJQy8AfAsNqIyB6tSjlRcAi3QmaZI/4MLIIPNvQZKt8VUzXebq6MTCQ3IXjZl+EJqV14VKKYqVu0AgtNKKdU2uV6aSUxF+4g4+bAUe1gXbebkwnH/C+vUqpwOqg7EPkvWCucBNyN/DPolz0fbdRunmojqUarcGXSSjVMVk9qfZzReK7ZQ8z8Fmsm8hpSUD9B5kVkPm3CIHG4kKY/Sd32HtRoQWb0DvSmKEB13jaUPQuBMv0wAOWLROJjAE2CXfydQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8YBCB410LfFvkuZ+XC4l3pfGXdAtkEQBqdg1H7201cs=;
 b=iEBdAmYEpRSrlezGeCJCVgEQjvKXj5360ut+iTZ6xzcOnO/UWOm//ahkwmtC/GvX5lokeTU/rW3i1yDr9ghy3dBGhyW0zZN3nYr5VP9rTD/+uh7e0FY2o9tC23iceGfVj4KQfuNS4cgvWFkY0Zpplss8BsJMyLDdM1DwlrktW2VMtp5eM4Xw8yA793DdRbKH/5NpwTq2NIlR+ETqSuGebJH0RVnQCA3AKzMman/Xavo602+PkY9lSaHFFrBf9pb7LtLRGQmf/rk9k+9gs6gRG4u7OROsyhE5tmX7jFrslEOb/6wPvBJcjf/iak1CGemZG3KaMwfEMRVuHazqm5LnTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB6945.namprd11.prod.outlook.com (2603:10b6:806:2a8::19)
 by PH0PR11MB4951.namprd11.prod.outlook.com (2603:10b6:510:43::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 12:39:52 +0000
Received: from SN7PR11MB6945.namprd11.prod.outlook.com
 ([fe80::9716:fa94:b58a:9a6a]) by SN7PR11MB6945.namprd11.prod.outlook.com
 ([fe80::9716:fa94:b58a:9a6a%6]) with mapi id 15.20.6678.031; Fri, 18 Aug 2023
 12:39:52 +0000
Date: Fri, 18 Aug 2023 05:39:49 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZN9mlQqMuInWLcdu@nvishwa1-DESK>
References: <20230817110352.7601-1-niranjana.vishwanathapura@intel.com>
 <20230817110352.7601-2-niranjana.vishwanathapura@intel.com>
 <20230817161628.GB3375865@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230817161628.GB3375865@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY5PR17CA0068.namprd17.prod.outlook.com
 (2603:10b6:a03:167::45) To SN7PR11MB6945.namprd11.prod.outlook.com
 (2603:10b6:806:2a8::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6945:EE_|PH0PR11MB4951:EE_
X-MS-Office365-Filtering-Correlation-Id: fe9648d7-75e8-42de-c80f-08db9fe837d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5D/wtq1mBv3k853Z7vn617a0Dx2gd0NEAwwn5mA/uSwGLDV0g+Kz/zod0x1tpJEp23czsIvKYb0maBBwqZuvAue7Mcq9XUlF4cKZUyIKzbRp/+HaV67y8QvYAaNyvWV9bZMoL7h3o6+MlS6hS/RyQkYqCycJhQYD3r41LwkqkELz5008TLix40mzROZiiUumdZSW6H9xfKlDLcAuETkyuQyPrLGUAe82cLXCW9iVtvm9j8bq1SaJlskfur+nGdgzgMtxcMHp21ljTaKi6IQ51TceHbEMdKs3nIU+mpaN/QcwOXfH3ot0bGetR3rB/YL6j+CxuwZM3vHM6orgYRqmS0opiHbPUP9ofyPcqNWko2U4G5NfGjwHUBopQkc+awNnByu8D9w41mWWppPw5YMcL4UqSRXoLgm85Ijq2w1UbUnuhRXeHD2revfzvtSULqx1WoxIHmSPbSy4+E8EDjOUFpCNRLRttN3eDcjF+M3PV+raz4mPQUKI6i8IxD7aDq0MjZT1jVtnsVyDlMATDGYMrmjl18pZNLtgZ35SVkUEA06aavl2rzbDz0Gb9P2xegy2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6945.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(136003)(39860400002)(366004)(376002)(396003)(186009)(1800799009)(451199024)(6666004)(6486002)(6506007)(38100700002)(9686003)(6512007)(82960400001)(86362001)(107886003)(26005)(33716001)(2906002)(66946007)(66476007)(66556008)(316002)(6636002)(41300700001)(44832011)(5660300002)(8676002)(6862004)(4326008)(8936002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N16DGKYz8A3N8ZZCZG+0kZ1sOh/sQDcnbzC2+F/ACY+ldzTEuBC0ia1GHsRW?=
 =?us-ascii?Q?PH3WtQ86o/ZMS+8wEUXQ/UOj51NdFomP7wjL2Bqt/u8fCqR2T+gdBaQ5pFS6?=
 =?us-ascii?Q?cbom+RA4DxgTkVg1ooFOWRYSg2MCIpUI/SZ8ivPUPwlMN6VWQiDb4Xo+e8lk?=
 =?us-ascii?Q?7DG/wLs6b5Y4FUtdVyBIrHDnASWPKA30rge4lJCDH/jQCcqjzF2rnLL8zznP?=
 =?us-ascii?Q?h3k1IRAKCSc88UmeOehYqg+qoIzes3Z5oJWblL7F+AN7kr0z7KOyCufok4BT?=
 =?us-ascii?Q?dq3Fm9/whUYAPdxb1N0S61jqQGjoJzDntPm0CqpNfOqLWvs19WGGf3eNCgzb?=
 =?us-ascii?Q?py62gH34V0dednGMSaxr6FxvADb8jjFLFKjdF7AWjqNnObPmpAgfHrQeu+NT?=
 =?us-ascii?Q?vCjT5K/sT6wp8vP7RdjxPUH4jYu6h0brs05az91h8lnvAlazmA/fMwad2xKd?=
 =?us-ascii?Q?cAy9/SN2je+rscg19P3vXWAxykGJKlzECJavB4hPLPycWBl0oxpuKeBEghbf?=
 =?us-ascii?Q?vF/GuPy3RBx35Y0HoL4q7emZ/g8aUXdSHYiVAL0dFjdaBwEmAyuJNhwJrBcU?=
 =?us-ascii?Q?x+x2TFTYjcOONhT/GO92N0zeqH0htchWmeNOtrYWvXJbKyMMXZiJ6iMLLu2+?=
 =?us-ascii?Q?9O5gCW6NbGaTv6woTCDTJRzmjG8tVMp/Nc4FkmwlTnrbCsz2UXZYCOWOPz9t?=
 =?us-ascii?Q?creMU8IhFxyxwI/zwwN9PhQEU6WOsBNFitzoBbiN2l/p+Isj+A8hqL+03SAk?=
 =?us-ascii?Q?Sv8Vr7QoPQAue1342lZbzEfKIvqGoCu2zGREd5fXhfEYyGvbdqJ4xSGH/HeG?=
 =?us-ascii?Q?UbVuGHTK6jMKLlahIIoYgpDpal2av+rM2zkQjOPrJwVLe69ZSK2JXJlPVaim?=
 =?us-ascii?Q?8ETh0Iis39I/SM3hesEkW2mN6AGRMRvoG1juLQIH0Ui1aAR0rK8RdT1akwG5?=
 =?us-ascii?Q?Cp78ZyvcEueGZSEp+BOr6lf3B6TKsU27ZlJhJwkqAFdGJPy9ZvNxfxVgYtzA?=
 =?us-ascii?Q?8cb0u7uUXfUTd/cLYnmEcHuxDP/+no7O/0O5yUeeVg8gWej8A3vv4NJF6T6C?=
 =?us-ascii?Q?iW69V1YEqvgDYvuIOfyFBkZ4FHfXcjHedW407eUhbfEEm470fiFIZNOTq0Of?=
 =?us-ascii?Q?BksYWnbvTXzE0tqrr8EyS4u70qY3nWdPB2YvOziNa4CHYXLXzOz7qWwEsGen?=
 =?us-ascii?Q?Z9d9j+xMGxad6jjDrlP3q95oKi+Kv1J/zhqTiEOJ+ePRgahZ8+V0O+dbWzW4?=
 =?us-ascii?Q?UaeTdrhO653Omw1NhDsqXUqhbeyoc7QpUTP5oikTeB0pGcv6aRv+LxdtFf17?=
 =?us-ascii?Q?+yvr26bDpMJ/uuB9GcJAlrBfwC9rbUQdI8y9Ofbl/Td5NZyZQGv5mEepfXHT?=
 =?us-ascii?Q?rh37KV7ThpmEkwHc42kWUY66lV2rH4FT4lcuZkFMfpZ9aoI4SkDFxE+ZDIww?=
 =?us-ascii?Q?bAD0tLIlEJx6dtoLCZmibsRKSZSqaBlmipewvAVpo6dsJ5jqLu9u+Zuf4ZMq?=
 =?us-ascii?Q?38UvgfYaeBVM6ryYtIQ0lcSYxlISHpQGpG/iozXeiv6x/IeMfE+zejApBw/8?=
 =?us-ascii?Q?yn473ZOUVNtO724QTbcmZJb0/N/FFUmRqUmf9yh8oM/yBO58ZQI7noAh96t1?=
 =?us-ascii?Q?fetoetNMhSQcPsFOVC0aVjk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe9648d7-75e8-42de-c80f-08db9fe837d9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6945.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 12:39:52.7576 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ytohfm2RQDGKd/3kDBzK1l/mcEFwPRzKyYkpmuvVzdztpGvz/VRKsLvZWUwOnOaWnIC0sv94rhPiLLp4O52/KS5iJ2VGF1wzWSXmQYuh+brYWUtOIqMpGovFc1QRGDcX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4951
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/3] drm/xe/pvc: Blacklist BCS_SWCTRL
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Aug 17, 2023 at 09:16:28AM -0700, Matt Roper wrote:
>On Thu, Aug 17, 2023 at 04:03:50AM -0700, Niranjana Vishwanathapura wrote:
>> Wa_16017236439 requires the BCS_SWCTRL to be privileged.
>>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_reg_whitelist.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>> index e83781f9a516..94a2228bf873 100644
>> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>> @@ -50,6 +50,12 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
>>  				   RING_FORCE_TO_NONPRIV_DENY |
>>  				   RING_FORCE_TO_NONPRIV_RANGE_64))
>>  	},
>> +	{ XE_RTP_NAME("16017236439"),
>> +	  XE_RTP_RULES(PLATFORM(PVC), ENGINE_CLASS(COPY)),
>> +	  XE_RTP_ACTIONS(WHITELIST(XE_REG(0x200),
>
>Rather than open-coding the XE_REG here, I'd put a definition for
>BCS_SWCTRL in regs/xe_engine_regs.h, and then use it here, similar to
>what we do with the RING_CTX_TIMESTAMP whitelist.
>

Thanks Matt for the review.
Ok, the next patch in the series has it. I will move it here (and rename
it to BCS_SWCTRL)

Niranjana

>
>Matt
>
>> +				   RING_FORCE_TO_NONPRIV_DENY,
>> +				   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>> +	},
>>  	{}
>>  };
>>
>> --
>> 2.21.0.rc0.32.g243a4c7e27
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
