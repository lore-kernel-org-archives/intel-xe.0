Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B177C54E58
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 14:24:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0460110E64F;
	Wed, 13 Mar 2024 14:24:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gGkCi56P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E2A10E64F
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 14:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710339883; x=1741875883;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KBKDM2v767AkNzWH+7DdUXVheYFEGW4ssGKLbqhi9HY=;
 b=gGkCi56PVDT97oVcfcA9gNDp+IMDFAnmLIrmwu/o2oyj/Yxz7XFg76Z1
 UA76ORGbp+q6EWb32aTXwo+y2nZpv703qgSEQmFCHWTpiaGb1I3GCgP8D
 gIljPTpUOEM0AnJsZPVh3z8G2v32YQFr7htQBKfVBYCNHG7Dt64kdT9qS
 p0RkRClq+O7xXLfr8p2TTGVSQ1c8YJzfEQJHicX5WKJu8j2OWmieMEcjH
 997HWEOfL/A/Hie33fXdN0lHOrIiQmCm6GBkZ06SP5ht20z2LjSPMErtk
 Z6CWu685zzv+ZGHSl5lAMeudYJi7nj4uic9m2+sktAJHbb6NV/1tWUPnD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="16256627"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="16256627"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 07:24:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="12514461"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2024 07:24:42 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 07:24:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Mar 2024 07:24:41 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 07:24:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PaljZnJkvICPUzr0TDEe/kaxnPpm4Wvku1U+NLD75wa/q/VC7MdnjBZekvfxKQDZ1Uf4scsSX96dwIA0TeTMMZEmQX9cEdXxNb8FS44sjjryPlYzZ1fNXPTd8k56OIQ8Kp047QidHzJ0uGyIsQRYu5+Om3SMOFo5y3CPv2dFPN/qyvQ82IPIdf8TxpVv6wW0lS3autIubnyIt0lAUv2h7Ms+BY9DV3ScACR3jjop+PQNevTaCw4xE6Md4WXO6xHjkg7EGULTei3VNN6XKDOX4nyz5AOLTuMC7L3AHDj+PCnLEP+n3jIGq+6TozXdkfBuOmlfAMM0fPK8FgR4IgWOEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9DlsvQB0Np5NJL4Xzf672Wk6WywqOrQP7A4Xjb2hEZQ=;
 b=AwwMiVt1dBXlYlXAq34OSRrd6r4dC8PjeepW0yreMnY676rVBO8f/OHER/biQvTwiYfMLPCCPS1tRy4KjqFm28fP6m0jeqpsjQvKFkxQORXZKQu7Q9LGuFNKVoBoNrjLoukb7jtqpHfqe7DlgcqhXdJFdYn5xiTtnX6pGWK3Sdg2YI8ewWj588WfHRWT38fjx5k8odiZl7Ok30sJj4eo3a+rJCV9h6ZUPeAw7lw3d7yohcAFOMGbjn4kO0V8T8TtBW+6hqZpqW1014pXu523/PBsF88H/pCQyiZ9GZmJb+n1FofRiaSkckN/G4tA1I7BdeaL9D+Qni0jQ78+7EHY/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SJ0PR11MB5053.namprd11.prod.outlook.com (2603:10b6:a03:2af::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Wed, 13 Mar
 2024 14:24:39 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::5144:aca9:5cd9:42bf]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::5144:aca9:5cd9:42bf%3]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 14:24:39 +0000
Message-ID: <76b70dd3-794b-45a1-994a-020525954d9f@intel.com>
Date: Wed, 13 Mar 2024 07:24:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Always check force_wake_get return code
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, <intel-xe@lists.freedesktop.org>
CC: Tejas Upadhyay <tejas.upadhyay@intel.com>
References: <20240312194256.965685-1-daniele.ceraolospurio@intel.com>
 <87h6hasfbj.fsf@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <87h6hasfbj.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR06CA0008.namprd06.prod.outlook.com
 (2603:10b6:303:2a::13) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SJ0PR11MB5053:EE_
X-MS-Office365-Filtering-Correlation-Id: e789d799-0772-46b0-9c58-08dc4369513b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bZTeiAsizjglxvGXKKV0Jw82UurJffRn4545akY6uPLs8vkQ9cqNmE0WPv6kXWG28e6PeDXwDGpFtqADRuZwzQ4hIxBJ4Zv7n3ztaZWPOgtDut3KGEUPyfxGd4rDk/DuBUazCy6KIba78LgwBvbL8k1wnIMtVmbvkYVRmjF4crHKrdTpwFdVJFWNOC9Wlp0R7iJom158k58kmXm2H20lKLc6y7KmhUsbjxPv2xyCBCYQsdMwgEtFhbgUWzQQaTbX+uOODnARC8LzTFFUvK9KBKvAnQVME+IRUdIlZYau/k75WXWWcGPCCirkRcoCakNNNrwpQfsxXt3uikL0Dk9FE0tuh8xeQBW2RrIi7huhTnVDf2CuGm32KMS5Jh7evgmjP0+hrvDmkDYfU6Abo2n4dSjFWugYIy1NKCdchz8nSMyoyG/0qqusPE1JsRVnNIMwUeyT8FVmv2ZlcactqS1KdY5kQLhR6Kec6V5Iqw6nTxgXkodRfBbRY07FwRgD/v5t9W1uyxCD+FpDvthDIfSrsmrotl/Al/tedfX7KRuumUjDD8+R4pJXm3x3H2c1xe42U7V28qpzTuLLZzI4U39ypB+BbXryMzjk15exCw7b3kk+PKBSuWeCmu1MH3k65WqXItF9m3km75GDd1P2Rvmt+oAtu8dgCzAGncM+/rA8hRQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlpROHVoTzBGZmJ6ZGRGL1dyMkJtK3hmVmlEMDBTWTFRUC9qOXlZQlRBcjEx?=
 =?utf-8?B?QllGN1dKZ044MWhZdWQ0NXkzeFBhN2NPQjBVVTYxem43ZUpwTDlCZWRhaUVV?=
 =?utf-8?B?WEtCdlltSVZYNzlQRWROK1ZlamdpdTNpdnZlcXpCUzlWbFZYeUVFelVDUTJB?=
 =?utf-8?B?V01EWVl6VnNpYm8zWTFYR1k4RVpTaFlqYyt2S3FxZWltVGM2dzF3anRWVVJp?=
 =?utf-8?B?OHV4bTV1RHpqbS9kdzF5emZlZjNONVVNY1NVaHNVOEs4eDUxZGJON2pYMHFJ?=
 =?utf-8?B?L3ZpWDYzL0laQ0R6UUlkN1dzNG1Dem13em5lS2Nrd2lqeTNBOW42L2plVzZq?=
 =?utf-8?B?aHhRZkMxcWpNRklXMklHU0ZtL2FNUUh1STRUcWN0RW5qYXg0Qnh4RkR1Zk5O?=
 =?utf-8?B?NEdhOHBNa0o0YnNFaTVLREVsRy83VEIvbkc5cE1sbDM0bGxiUWpkR29saVY3?=
 =?utf-8?B?QS9qN2YrTkkvdFUyV0U2Z2E4WWRZK1VGNWJ0WEt5bkRSbGZiWUUvZnZzS05q?=
 =?utf-8?B?cDZnb0s3aEdxRDY1anQrNTBPRCtGa2krNG1hOU52akREbW5haFdSWFVEZytu?=
 =?utf-8?B?a0RCKzlCTGM4WWdiZWRydWxTN3VWTy9xd3hDYlJPeTBOcVU4cTRkdGxLdmtL?=
 =?utf-8?B?WDJWTG1QZWNuc2d5R01ZMGFyVmNZMWJ5M0IvUFZYR1RncTNLaTZnQWthZnA2?=
 =?utf-8?B?TTI0dEU0MkN1UzdaNVRMU0lUSTBnWFkvMW5CTXNnQUFEd1R2dUYrZjBTUStZ?=
 =?utf-8?B?bVZabFgrbHBJSHBoOEtmREFFcTBhTmYyNHkwNnpCcjZQckRNMnJENktneUNL?=
 =?utf-8?B?WnlTVmJxYlNKYlRSd2prNHhJVjFSWHZtQlQ4elN2Q0N6Y1FrL01mWGkwcDlL?=
 =?utf-8?B?ZnZaNkFPTWRzeTBLQlNBRWlFelUvTmlrWWE1U0ZGT2Q0NnZPRlhwUy94SzJm?=
 =?utf-8?B?cG02TjFOaExMRFFrb2VSaTZUbWt6ZXdtUW1aVVRzaW9wNlV1NW55amtZeGdR?=
 =?utf-8?B?bU1zZmFUcmNORzczQ1ZEUkdZN2hza2c0VktDVFpET2xlbGllMThhQ1BnRzNy?=
 =?utf-8?B?cnM1SXlVYkc2MkY0UDlQaUgrQklIRG03d0xTQ3RWVWVVczV3dmw1YVdqeDEy?=
 =?utf-8?B?Kzd4WFNCT1RLM0pSVmJOWU9LelVGeDNZeVZCUWI4K00rM01PeWpCRy82K2xx?=
 =?utf-8?B?b0hNL01ZUCtLZGNlQlF3bFJmY2ErZ0hvS3F2ek9ZV3ZYc1BnUXEzNDRTblVz?=
 =?utf-8?B?OVpMNmRnTzRMcUp1RStYbzcwbXh0Q3RScmZQUnd0WnROVStNazd5bVBXRUNx?=
 =?utf-8?B?SlJYaCtaUEtheWlVZDFCQ3hrcytUMlAxUnZCSTV3ZnRXdkp6cy9jaUdObWlv?=
 =?utf-8?B?d1ZrRUlESDhqSU5KRzhHelhxellRMlA5Wmg1QVJKZUhyc1BhS2xkNUpjYXF5?=
 =?utf-8?B?YjBUeWE2Ukp1V1g5N1ZvL25SdEducENqbkhWR25MQkdab1VuZi84YlIxUGw5?=
 =?utf-8?B?a1ZqOVRXQUUzV0hmODRpZXRGbUpuZlh6czRlT2VyOFZ3ZjhvQUpwOGlZQTgr?=
 =?utf-8?B?dXJzZmpnQUFEN2kzc2FwVWszL2JndWk5U3pUcjArZjNYT1hLUlJWUlpESElw?=
 =?utf-8?B?K3cxZEl1WDcybG5mTFFVTStwRTUvTTlYMFRNTk9COEVYSVdRenlzdUptbkFB?=
 =?utf-8?B?cVBpTjZoUm10RUU1dmoya3hEVXR5MlNXb1NnbTBBTEt6OFRIVitWdXM5cXFD?=
 =?utf-8?B?cE50R0lRTkVtckY3aGQ0Y29Ma1FjNFNrVUx4SklEUVY1bzhVNEdVZkt2MnQw?=
 =?utf-8?B?dDVzMFkzUWh5RU1rMlkwK0xmTjB2UHJ4SEVNaENBbE5NdUZXNmIvVVZYUDc1?=
 =?utf-8?B?ZXN2WkE0ZXB4MmIvNVVRZVJlWEQzMDdoUlBJay9LMHh6UGNVODAyWitsdHJ0?=
 =?utf-8?B?YkUzR2pWUDV6MDBhNzRIV1g4bVFRaUphMnJ5cHp2YWpIdlRBMC83aFpFang0?=
 =?utf-8?B?R0dLUmhwZzIrelIwdG9xUm0yNnE5Tkx5WmVUVGF1QmVETzB0V3dlYW5rV1Jk?=
 =?utf-8?B?TlJNeVRVU2Jkb0lJVENIZXUzQ0ZRZGpoMDZUYTAyKzE0ODVMNWhtQ1REaXc3?=
 =?utf-8?B?N1BkT0xyeHNFT3Q5SHVFcFh2RmhySDc5cFpZc21MSjI5ekRPbEw0RmVzbDNY?=
 =?utf-8?B?cVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e789d799-0772-46b0-9c58-08dc4369513b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 14:24:39.5205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v720ztukb+nKel5aPRxkg/ncY3dd4DpJrBsM/T5HGZHovH70QN4rjZxW1xw5S+gy1n1N53FzSGpEAMOjHAGYnGVdxhZw9Aqa3d1VmgPtXJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5053
X-OriginatorOrg: intel.com
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



On 3/13/2024 1:31 AM, Jani Nikula wrote:
> On Tue, 12 Mar 2024, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> wrote:
>> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
>> index d9aa815a5bc2..902c52d95a8a 100644
>> --- a/drivers/gpu/drm/xe/xe_gsc.c
>> +++ b/drivers/gpu/drm/xe/xe_gsc.c
>> @@ -287,7 +287,7 @@ static void gsc_work(struct work_struct *work)
>>   	spin_unlock_irq(&gsc->lock);
>>   
>>   	xe_pm_runtime_get(xe);
>> -	xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
>> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC));
> Up to the xe maintainers to decide, but I'm really not a fan of hiding
> functionality inside warn ons. My approach usually is, would it work if
> all the warns were removed? If yes, it's good. If not, maybe reconsider.

The code works even without the warns, they're only there so we know 
that there was a forcewake issue if/when some other error crops up down 
the line (which will be handled appropriately). There is nothing we can 
do to actually handle the forcewake failure as it can only happen if the 
HW is in a bad state.

Daniele

>
> BR,
> Jani.
>
>

