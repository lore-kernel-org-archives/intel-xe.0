Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482E3EB64DC
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 13:42:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1430310E05A;
	Thu,  6 Jul 2023 13:42:44 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B594D10E3FF
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 13:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688650961; x=1720186961;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=E/dBaGzvcPZlBnDiZ9Mn5pdzfqGtWxEFy1My7gCO0Gg=;
 b=a4K/gXbzHMJgMWkjgFNRBsXBK3VCiPIh1aZDTpYwB/B4JsDcz9pM5v+9
 6ciPAufyeuKylW9AMTZzkn3axrErjm3XBV1eQA5j09ffvICJ7IF6XMcEK
 RRiwrwrTC0nPCYwFd0XPBDNwicOs0dYy/U2tc6L01VSw5wJxBhsunM2NG
 OLKTb7i/ue51tvEepE82q0Og6C/L83BuqQDkD5biDpukRKfvQi6nhgRKW
 dJTD6S4GVfqqGutgwKMx4KvUG4yAeyCdu6x0zjWJZ3dHWY2U4fI9j7bXg
 B4Jpvrnhg4UvrTNPRTfEQtMzxKKDO5GMLSHr/q6mQwHPtvBPn98Mk0sMS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="363639668"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="363639668"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 06:42:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="1050101101"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="1050101101"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 06 Jul 2023 06:42:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 6 Jul 2023 06:42:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 6 Jul 2023 06:42:40 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 6 Jul 2023 06:42:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/iZUeuUqtYhjFOhB/6KWuTr7M2BoVM+oM9Uy45AXy7vrd+u5zlAzvnfuABRurc/HWsi1MXdmH1/4dTEwp/P7Ujv8CBUMZmVvl4rvVlXp3VbGudBMC9Zb86iwV56bIBtLgQqcqxQyESCtxTRKYLG8oarb28eYFjdo2PaKL1tSJOwIJNj100WnQWi81ksKUSys2JtQ7R2cB8CM40wWYG0rKIkLNYpOwbGFUI7yGjrYh54oXf3fOpQQbFn/nbEZQmKjZ8tkfXBc5IqehdnuW9wIncLVRyd8owA76QDSMSLR4Ypwe4XVjcmS8rBCs69N/oTklpdfxiVsm0AAdlXqPK6RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1MEoN48MHMe99vYTnziz2jb80lFo+iXADtETf+a/XVw=;
 b=MvEnx7aLEQeX3hfsODxFhprZExKQI+89cMEi5fehefcND3GK9yq9FuDl3115pqtaFudcog3CdXzXK8bu9l/3OpOntJwWl4fQTlgOzsYmIe5xy3b0GhNy+AbCwIPPYChte/Hgxtyf3eZq8p/Zz4KkdZO92pMgPI9DldjywpZLko7R02xi4D5d7yEeJjOgefVvSvgSKw8MFDRwm2Sy+UQ1rOaYzfaD4+tVQLA2ZzB75NjeonFZmhpz4rGw/YsBGThrqS5Dd/NDSy0ECfAelpuxpkKOs9dARw/jB+8zV2iUgDapkIOyvv9cJXOnnwGgG9XYayiv0cp+Sn9K6y89HQgqKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by PH7PR11MB5981.namprd11.prod.outlook.com (2603:10b6:510:1e0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Thu, 6 Jul
 2023 13:42:38 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff%4]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 13:42:38 +0000
Message-ID: <a6fbb435-6383-772c-703d-183f26a8144e@intel.com>
Date: Thu, 6 Jul 2023 19:12:29 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230627122113.1472532-1-aravind.iddamsetty@intel.com>
 <20230627122113.1472532-3-aravind.iddamsetty@intel.com>
 <87mt09daqu.wl-ashutosh.dixit@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <87mt09daqu.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0045.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::20) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|PH7PR11MB5981:EE_
X-MS-Office365-Filtering-Correlation-Id: a3e02b9b-54c2-4194-260f-08db7e26dc84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nOi3fChyNv3Uy6LAUsCJRjzfRbPlgWLOsuI7hczeLTcxoo/3HFZdP0eyhvyoxFDv4MLPW9WDj+Aj+dYM09g9pkojHRZCIw3H92vQumOCSZx7dK4ii4PcFqZSBzNZ6suhJoz2MRT4jfBz/Lukq4FNhgtRRNIOp8yDHiVH35XXRzlU36+9OaDeqsu6SNnbNo88KTWudsXgX09tZJUr8Jj6Ey34ft9QBNxKJeeHiblDHz3fqhfVGZ1DySK0tuQ1Z5mOocEIq/nk9gHWuJzOh7EzGo9yJHbSxvvaBgweOE4gpVq7mh7ISrzXdJrepyVtRXupfFIXo5ByUTmrOQOxq2tWhHhFqQ6zqP/5osc2fmc0hR6ym7x/0fsfazOVMBDfOzfmUtp+bq/ercZvLNBPesStRgDrnJ+pBuOUUzNXnmowD45IUz+YSI8hpJLQ8A3yt7oyeoGPdoa6VqJfa9RYMpsPqdM4mvw4iHiPMN6PY5ViAjNf9yTX5TFK6cc7bX7JvvLM5eglxaSAF8KR8+UCnUoxXr8Mrk3eETQHyqgp2LAOWqC00eX+FR9z6wp/7mJxHapv87aGTIL2wYMr9ei0hYnDOBboh4msCvNeNMMGXzeJHsuthf3SjeLuMzuT3YZEQ8F9pV+7jvxlaAQ7ajDh9O2XLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(136003)(376002)(39860400002)(346002)(451199021)(31686004)(316002)(66946007)(4326008)(66476007)(36756003)(2906002)(66556008)(8676002)(8936002)(6636002)(5660300002)(6862004)(478600001)(83380400001)(41300700001)(31696002)(86362001)(54906003)(6512007)(37006003)(6666004)(6486002)(186003)(26005)(53546011)(38100700002)(6506007)(107886003)(82960400001)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aElDKzBIOUk2bm5HNFZiYkF2UHEwd3phd1JJTVBDSnQyT3k2Wi9ndXVTN2E2?=
 =?utf-8?B?QjZFb3FPeVV2L0lIRytFdkRiRFE5VmM0SmxGUk5KU1Nld2h0dW43anh5ZmRI?=
 =?utf-8?B?Ykc1MGNqL3NBbjYwQzd6SmNtV3NocFc4OWtDZXdjV29OY0JXZnlBcEtUdURx?=
 =?utf-8?B?S0ZaNVZ1cWQyV1Y1UFU1alV6bU9zOWp2UmR4VkZ5Y3MvT2dWRXdiOVJaWFY5?=
 =?utf-8?B?S0R5WVJJMC9ETkVPbmhlMjBuYVlPSEtrdHJERUI2QTdVR0ZoMENVUzd6VjR5?=
 =?utf-8?B?a24wQnZHWWs4LzZUSTJWU280YlRleVdZWWsvTlgxeTVrY0NielVJcGkvMVpN?=
 =?utf-8?B?YVk2VytJR3NMUUJWRy94VjBtNnpGU29xdTdNNTlYS0gvdXhvM21wK3dPRkg5?=
 =?utf-8?B?SE9lU2xUeFFjYVBtUEpPQkhDMVphenVoenRveHR2WkxQek5GZHdpejhiU1lt?=
 =?utf-8?B?Ui9OeFBIS2tRd3U0bjdJQlVCY2liTE9ZZE5mL3VKV0lZM2UzK1l3cVh3OHN0?=
 =?utf-8?B?UzEvR050QlJrbk41TUZsdUNINnRjb0Z5bUxoU09qRER1RWZRbGxZaVFFNVhE?=
 =?utf-8?B?RHI1TSs4MFlwNUtOaGxmVU00Z2UvWnQxaWJUMFFudWw1MDd1N1NYd21XbStQ?=
 =?utf-8?B?cXI4VEJYYkFlVGJiSi82L3RpdDllTERJTElJZjVVcU9GeCtlOUd2SXNIMWpZ?=
 =?utf-8?B?RllsTGNXU05nNGxTWTRoRlBUTFVXZ1pTNzlrUDVmUHdrNjRXYndtUkN5bW5B?=
 =?utf-8?B?OTU5UUlQWHR0Mm9uSjNWcm1XR3g0Y1BmbVo1QldOaXZzWGVHZjhrQ1lsdWpE?=
 =?utf-8?B?RTl2SWwzZ2RxQ085YnpNdEFHcDZYMnZ4TFptdWJvUkFxOUxSZUQwd1BqUDdB?=
 =?utf-8?B?MjY2UFgwMElBYzdnSUl2Z1N1aWpnVVlCb05rN0t1bzNKLzNYcVVyTmQ4aDZB?=
 =?utf-8?B?ZlJzaVdrNjVoSy9XTXJPd3VIQTdCMkszZTZyMDRqYW9vaW8xeEdiNkl0dXRn?=
 =?utf-8?B?WlIrYVljMXlIUkNXYWZYUnVGMVd0aHVqNks3MERiZitSYjgvUGdBK1ZTNFpH?=
 =?utf-8?B?NzhQUUlSOW1MaitmSUMwbjBhdnVuNVMzZkI0SHc5ZkdCZWZFZUwvaVBNUFlX?=
 =?utf-8?B?cXV3bEs1UGFuWFVtNzVReTlqQ2ZZcFFQN1lQSG9aWE1MT2Q1eGYrZ000Y0hR?=
 =?utf-8?B?U1JLRGRYQTlBWGtNeHlDbW5HUnAyWlpxNTU1dVBXM3MvOWpZL2hleTVyME5D?=
 =?utf-8?B?bUVUa1JoMGRicWtSK2dzcFhpNVB3WmVsbmVCdWJ0QjdyNm05M1JxUlhweFd0?=
 =?utf-8?B?c1FWYm9heFZEMnFobFhtckJSdlZqT0dDZHMycEJyUkRYU244VkdWRDIzc0Ix?=
 =?utf-8?B?bEZZY1JYNzgyWXFPV0ptL3p1TkhXZlpIbmc0WmZXVG4vWkdnYXo2Ynl3UDdU?=
 =?utf-8?B?UURzeDN4cEJWQ05sb0VJL280RmxLeWpiV3R4eUl3blhxOS9vSWg0RVdZQ3BU?=
 =?utf-8?B?a1Z2bWVXUUVKYUQ4TnA4TlB3enhYdGhPeHA1Z05jcENBanVtUmxXV2N3WmEw?=
 =?utf-8?B?eThQNHF3bVpGcDVPTVZTa1Jsb0V1cFVOMXpwV1hCS3NEc1lsM1BEVTJzU0Rj?=
 =?utf-8?B?SWJEckhLSzFLUmJvTmpJVFYxNFpUd0xCMnIxUWNoZlFDQzZTZGc3TEJ5dmkw?=
 =?utf-8?B?QmVqQnpEYW8yU1hXTDJJQVg4MlYwMTJUUU96WGZVV0Y4RFRDamprZ0IzbnY2?=
 =?utf-8?B?TUU2UmVKZ1hsblVKQnErSWszZ2NsWkJ2d2svMmJnNXE3cFlmYUdsMjlSU1dN?=
 =?utf-8?B?U3k5bEJxalBkZFdWRDNsR2t5d0xkaVkvcDRLTnlwOUFSTkdWUmZkZ3VrSWp1?=
 =?utf-8?B?UklOSzEweUFuWmk1L0pkS2haRldFaHFmYlhqdnpUY0tnL0VKdFdQbXhUek90?=
 =?utf-8?B?S1ovenB2K2lYVnNzVUhWZDhGQjdxNEF0SW9wem5Ia3hzUjNteHVMUmdWMWJZ?=
 =?utf-8?B?Y1BZQkxlVExGYXM0TDNBa3NTS2tnc3AzdUI3bGloMDVBU1o2bFppZ3VSdmZy?=
 =?utf-8?B?NFBPMFp5NWpuMDdrR0QvbkRYMnVBclhXdTV4L3JRKzdTWnlOK3ExU1VXQUZH?=
 =?utf-8?B?THhOQkVJRkppWm5HbURoVW5DUTVPYVBsTTNDSG56QTVuaTEyRFE5MGNNRnhw?=
 =?utf-8?B?TlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3e02b9b-54c2-4194-260f-08db7e26dc84
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 13:42:37.9826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h2P4tTFANZIyfTvtR3xYIFVIcPil8ggAk9TH8TKIUXZhKwG3OikS07F96sy+oDZyeUUc/6ZhJXVu8bidDkhsuayV+teP/eExTx7lad/nmdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5981
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe/pmu: Enable PMU interface
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
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 intel-xe@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 06-07-2023 08:09, Dixit, Ashutosh wrote:
> On Tue, 27 Jun 2023 05:21:13 -0700, Aravind Iddamsetty wrote:
>>
> 
> Hi Aravind,
> 
Hi Ashutosh,
>> +static u64 __engine_group_busyness_read(struct xe_gt *gt, u64 config)
>> +{
>> +	u64 val = 0;
>> +
>> +	switch (config) {
>> +	case XE_PMU_RENDER_GROUP_BUSY(0):
>> +		val = xe_mmio_read32(gt, XE_OAG_RENDER_BUSY_FREE);
>> +		break;
>> +	case XE_PMU_COPY_GROUP_BUSY(0):
>> +		val = xe_mmio_read32(gt, XE_OAG_BLT_BUSY_FREE);
>> +		break;
>> +	case XE_PMU_MEDIA_GROUP_BUSY(0):
>> +		val = xe_mmio_read32(gt, XE_OAG_ANY_MEDIA_FF_BUSY_FREE);
>> +		break;
>> +	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>> +		val = xe_mmio_read32(gt, XE_OAG_RC0_ANY_ENGINE_BUSY_FREE);
>> +		break;
>> +	default:
>> +		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>> +	}
>> +
>> +	return xe_gt_clock_interval_to_ns(gt, val * 16);
>> +}
> 
> A few questions on just the above function first:
> 
> 1. OK so these registers won't be available to VF's, but any idea what
>    these counts are when VF's are active?

VF's cannot access the registers but the counters will be incrementing
if respective engines are busy and can be monitored from PF and that
will be across all VFs.

> 
> 2. When would these 32 bit registers overflow? Let us say a group is
>    continuously busy and we are running at 1 GHz, the registers would
>    overflow in 4 seconds (max value 4G)?

Based on BSPEC:52071 they use MHZ clock assuming the default 24MHz, it
would take around 5726 secs to overflow.

> 
> 3. What is the multiplication by 16 (not factored above in 2.)? I don't see
>    that in Bspec.

These counters are incremented based on crystal clock frequency and we
need to convert to CS time base hence a 16x mul. BSPEC:52071

Thanks,
Aravind.
> 
> Thanks.
> --
> Ashutosh
