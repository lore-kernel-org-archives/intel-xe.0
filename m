Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DFDE8FDBD
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 22:29:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7801810E052;
	Tue,  3 Oct 2023 22:29:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4FC10E052
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 22:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696372166; x=1727908166;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QDeG3p2xvMjqyivdaqv5ccm8E3U/CWdqg9ZSLi4RQg4=;
 b=d1cTHVQx0IrA8MeDqIHUpFU/t02tqhmpKjtzVG1rVqMXDA/0pt+7d1cV
 VCo+gaNvbyeGRaIB2QPUCsEnI/KxH4zN5wL1XC2FqveNMPSFBPzBFz8QS
 aeNUFp9l+nhdqLvtNLDZ4SsNlk9zsWklV6ORNEtvxVNSogkhdxHMU4OC/
 YkhYuzvEfPJREowlVdD7Fw5RoU4JKaqcuWS4HHWZelQzcW3c8kPdHC/IF
 YOkIlfC45A2MUVqluuhUzBDeX0+rKJ4jV7H2RGlQuMch+GPLMz5rJidUB
 c5xh6Imh8ax5bB1C+2wVc+fkVXZgZUioZxhzfruUhRtmLDhsD28ySZ9f/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="382900235"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="382900235"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 15:29:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="998202445"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="998202445"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2023 15:29:26 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 15:29:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 15:29:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 3 Oct 2023 15:29:25 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 3 Oct 2023 15:29:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=crGGnkxNSTLtJ1UKSZPVkBokombhy0LzsLnCVdZXVxPbSkJXa440jrHydHVAcROsOQnqLDJuxk02bzuGZLz7D3XIU6UmGvZGgmPW7KTX/OWzyTSMeU4BTue6HdUSPZk/MajKsLt56CD/GgfLYBfBdQ697x5f/pKZOBgf8gauH9J9/qa1FAqEkEQ5M/YnToS0geOSl5DX4yAaUWauIH3FKWt/0F7rJUN2xBjcdg3uYjl45W2ObFFuvfy/qLGIDVnVKlSrf41dsyOKUmcZWLrx3GyjbRrgQvuIX0bIK4w9KIvvxik86Zcbp3rysCGW+fc9IhPqEzNRz2Nai/oG1q3jZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5GqcYuBcJgGQ2XkTUfLfV0c3l446o9mc0S8HZ001MxM=;
 b=k16vVWZ6E0ylzdmGvKM4qCcp9QWJFx/gqWT+RpUZPd79uwzGx8Q2KBoW1XSduaF4vgghckI6a92jfxwAZlEPFVaY6El04ZvylUlBeIBCctVEqEZsnrZiuZ14/2INPMXI78O9aTEBTrDQklprpSi9jNjCbMGo9/o6pdwlTgwP2+2yfAvRYTwDqNWugOtwz46a6MOAMgm3/QgxhyTvoQROc8W7mP+B47gZvb7qWwOvsJzRU3xDFHq4OXBcnz39yQ745GDWgr/vWns+E/8MpqxNXcgzYEqgRlkfgK0uRYFg/g/r3XmAxvVX+SKodPnk/oCqdVUOQntZ9Ib77+O7gMX3bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by PH7PR11MB5885.namprd11.prod.outlook.com (2603:10b6:510:134::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.27; Tue, 3 Oct
 2023 22:29:22 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::42c7:cd4a:ad29:f97c]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::42c7:cd4a:ad29:f97c%7]) with mapi id 15.20.6838.024; Tue, 3 Oct 2023
 22:29:22 +0000
Message-ID: <3d0d9b76-1a17-fd49-5e31-9015c62b2ff9@intel.com>
Date: Wed, 4 Oct 2023 01:29:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
To: Lucas De Marchi <lucas.demarchi@intel.com>, Matt Atwood
 <matthew.s.atwood@intel.com>
References: <20230414193355.143875-1-matthew.s.atwood@intel.com>
 <pvlaxodbiqhygobzzr6mlhmd3olalqsevsrqendc2tzds3qvlz@b5paj6w74nyq>
 <lphv7flakz3kbvlucsi36algthnlien4dbdlk3nlbobibnsunf@hm4s6nanxybb>
Content-Language: en-US
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <lphv7flakz3kbvlucsi36algthnlien4dbdlk3nlbobibnsunf@hm4s6nanxybb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::19) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|PH7PR11MB5885:EE_
X-MS-Office365-Filtering-Correlation-Id: 577fbe68-b313-4540-d4dc-08dbc4603126
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HONL7TRT7/I7gPXbWLZNUj0x4dq/69+MlLyCWGfRMuef485fmZtrLajqpOTT9dW4oAna3liMP8ku0RSIoUfE5ZQH8MOF7q3/cQQTrIEHJ+LOtYbZd6QiT5YfMvPQNr5waiah5orpNe2lDPJPLLMz7XeoeD7AXFJIAOWE4uQ8xuAamKmuWwXLrDbqH89PthscNdGZ1vokrBdavyABgXu4B9biuTYWpO8tXbpv1SOZrCcMX9hjAR+qnyNia88LbDj1Q1++DLcqiQ3K23WMutJjmn9xtI3rOKVQSZjydG2TetTToa1Ekf34/00VSRVpb8xkU65mR2Dl/xR6PdfAv3L9WlqLebr2UOJr/6gzVa80TxZz0/QCSGtWxl3k2zC0+JbyYwHy/QgAq+1c4+zasq5io+4CNyrsCJnTTVfaM2PIiEqhK9UwqlWM9PCi5bh6uMpCJGxDR5hFK0joOE/m37bF0Adrv0q9GyupFNSPQwfjBujknYtrtyoUmUjZknDCStESSectM8erwXtp1mtpf6/rSRBTiwioicoddpPqbJx8p1KzjR1qabOi3SqajsNGDlHQtrvFJQ8QLBWV7HtVoGjCi96KysOgq1+BY0xSVOAulAuy5Pd41QngZaf8rkEDQ8q5QCjfvy6slnP6ZbV5eswrTQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(366004)(136003)(346002)(396003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(83380400001)(478600001)(6486002)(31686004)(107886003)(26005)(82960400001)(6506007)(53546011)(6512007)(31696002)(86362001)(2906002)(5660300002)(8676002)(8936002)(6636002)(4326008)(6666004)(38100700002)(316002)(36756003)(66946007)(66476007)(66556008)(41300700001)(110136005)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkJKczUvUXozMkFVQXRjVDI4YkpGaEtDTG9EaEVsSHdaalNKaFhnZG1hY2pK?=
 =?utf-8?B?SjFSMWhkTVo1cEE1Z29BODhYOUdudnZESGp6OVZsc3VYUGZxQ09nSm5KaE5X?=
 =?utf-8?B?SVdpaUx0YUdnYXNCRzRjSXYrTnY3SEd5dnZhZmxmZmtRT0o3OEN3eDkvQmVx?=
 =?utf-8?B?dFBpWlFZOHBUbzBuN1ljRzJ2bGdDUWtaOC9vN3F6amlmNzA5YmpxVzRvSDNB?=
 =?utf-8?B?a0tENXphaDFBeUh0L3ZKT3RMdEZWVkttNzVTZHJqZ2FMd3gwemV0b0IvMUZ1?=
 =?utf-8?B?RHZtU2VLNTdIK0ZVYW1ORi9mSEpheU1FTnh3NDBiK2VNVEdVTmsxd2d5OVcw?=
 =?utf-8?B?Vzc4cnpqTTByaVFtV3A2VlhBekxYcTVzSmdBSVZPL3oycWVKTDRvRmRDc01j?=
 =?utf-8?B?UkQ3STNqV1BNa2hQRGlWM3B2aUkvSVBHSFFGVDdXVE1FdSsxUGtGNmZBbVVF?=
 =?utf-8?B?NFcvdmdaSm1Uc1BuTHhZYTRVYlhCcG9wcXppUit5bVd5ZzZ6SEVVK2FIRDNo?=
 =?utf-8?B?TzE0dUpta3VMdGM3UEZCNnNaUXErQUk1UmRiR1FZVGJYcEhJTnYrZXYzYkNk?=
 =?utf-8?B?NVk4alhzQm5OQm1qTXMrNTNUZFMxSEsvSEh5ZHhPVkRMbThOMm5oQk9pSXph?=
 =?utf-8?B?RjUzS1FKM3BLQzFuZ2dXR3ozeFg5UzdVdXJCT3AwK2tlQ09mcExQR1d5Z01j?=
 =?utf-8?B?N0hEcXQwU2JGeVVJdllwMXdTVWNYdS9jd3MwMG8rUE5VcnFvREpZVmEwTWlr?=
 =?utf-8?B?U05rbUJ1cll0dkJaSXRuaExtOHZLZmtuK3dkU2ZxSFVRbmpkd0N2czQ1S0tT?=
 =?utf-8?B?OGFiajlYVGROckFJRHoyUWJLWW9MU1RQb2F6bUhqNEhiemhpN0RlMjBvNm9n?=
 =?utf-8?B?OS82eWw4R2ExV1crSVNkTjk0R3I4MXpMZmhZeWF4UCszeEp6d1poRUZrdGNx?=
 =?utf-8?B?WVo4ejNjQ3NidXhDMmZ3aDNJejYxalBLdzU4RE5pT2JtcWtScDFPN25yNnpW?=
 =?utf-8?B?UWJ3ZnQ2SDdISWQyNjVIN0ZqbElZTFVvNDNTMWxYUGhMNUlyZWVhYVZLK3VS?=
 =?utf-8?B?eks5ZnFUcG54VjJsVWlDTklUbC9YME54a1BNZVR4dEZGRlR5TGk4OG42S3Y5?=
 =?utf-8?B?Qzk3OTl6MElpN0NNTXRMMkg4SHZxSmRYTG9nc1g1Z1VIM1NBaGRweUpJeVdQ?=
 =?utf-8?B?RGJIUFA0TXo3NXI2TGpXM01oRTRrRExDVndFcC9sYlhFUEFLTWdrNk9Fa09Z?=
 =?utf-8?B?RGxCcTVZN245S1hEZzY3RlBMODhyVFloWWxub21BYkFCOGpNU1FtbW5Qck1j?=
 =?utf-8?B?dFNmMzhFRXRHRXlyUUVCcjgydTcvVUk5YWoxSmJTQitKdGNORVlNemNMd0pE?=
 =?utf-8?B?cjBpMDBDTjRJU3M2QzQxRkExdU53ZlRpdEJBa1g2MHBWL2dXYnRxSkZPeGZ0?=
 =?utf-8?B?Umx6V28ydUhGc1lhUEpYMWllTzZKQXpwc3prSnR4bk9sSUZMRDZFQVlQQ3BQ?=
 =?utf-8?B?RFl6K3Zpc3I5YXFZSmxPOGNweVF5YXBFN0lZVTF0ZyttbW5SbHdZMllrZ1V3?=
 =?utf-8?B?bFRiSlIyaE9nRlhYaEtKeEh0MlczdkUvQXFPejA0TUNwY1QrSktWNFFDMHAy?=
 =?utf-8?B?OFF0M2xmaXREZXFlWXplSVZNNHVGMjdLT3h0dXB1bFRnV3hjM3h5VjFZWGlN?=
 =?utf-8?B?bld0MlVJdXQxNit6UWRENGh1ZWdCakIySGFQb3pSQUtUS0l2VVBqTWF1L2ZC?=
 =?utf-8?B?aXFsem1BMVh3dFRWdWlXNS9MWUlFcHZJVXFXY1lCekJ6amlhblQrM0tHRGw4?=
 =?utf-8?B?QlpmWFZzODRHUnQ1Tm13OUwvZE16TnI5TXcxYW9pNFNhN3ZIZlNZQVpjUW8r?=
 =?utf-8?B?a21QSHNHVTdEa2VpOFdnTkNCSkM4TWVxZTNzYUVTTXFaZG1hUm1pT1locjF4?=
 =?utf-8?B?T3poZnBMdUhFUkc4andHd0R4MWQ5NUtKdG8wWStoUml6Q0QvNm5hQ1M3Y3kz?=
 =?utf-8?B?QW1xT1I2QVBFTlJ5dGtsZ3J6Z0xBNms1d2FWTDNGMVdHdGd0alg1M1hjQUFK?=
 =?utf-8?B?SUd1YmJYaXFMVm9ZNXZJK2ZZNUIwbllwZlhJanVYTUtLek9BWS9LNWRINW9y?=
 =?utf-8?B?Mmo4Z1EyaHVwM0VNT1YybWo2bHF5NkkrMnZSUmlwcm5jT2NzOUw1NEpudmI0?=
 =?utf-8?B?a1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 577fbe68-b313-4540-d4dc-08dbc4603126
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 22:29:22.5094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PcZWeYlEyplwfejet+Ytaw1pGvk0j/L3CiLrP/d+j7kn5W3tLq+JXzJDBRdfbI1BAhfKhOMQl1paqUokKuil+qgTvwgJBynEiKdMC2WnmR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5885
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/: add gt tuning for indirect state
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
Cc: matthew.d.roper@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 15/04/2023 01:11, Lucas De Marchi wrote:
> On Fri, Apr 14, 2023 at 02:59:55PM -0700, Lucas De Marchi wrote:
>> On Fri, Apr 14, 2023 at 12:33:55PM -0700, Matt Atwood wrote:
>>> Force indirect state sampler data to only be in the dynamic state pool,
>>> which is more convienent for UMD. Behavior change mirrors windows
>>> behavior.
>>
>> Better than the last sentence would be something like:
>>
>> Behavior change mirrors similar change for i915 in commit 16fc9c08f0ec
>> ("drm/i915: disable sampler indirect state in bindless heap").
>>
>>
>> BSpec: 46052
>>
>>>
>>> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
>>> ---
>>> drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>>> drivers/gpu/drm/xe/xe_tuning.c       | 5 +++++
>>> 2 files changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h 
>>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> index f174758d8307..b7324aede6b6 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> @@ -286,6 +286,7 @@
>>> #define   ENABLE_SMALLPL            REG_BIT(15)
>>> #define   SC_DISABLE_POWER_OPTIMIZATION_EBB    REG_BIT(9)
>>> #define   GEN11_SAMPLER_ENABLE_HEADLESS_MSG    REG_BIT(5)
>>> +#define   INDIRECT_STATE_BASE_ADDR_OVERRIDE    REG_BIT(0)
>>>
>>> #define GEN9_HALF_SLICE_CHICKEN7        MCR_REG(0xe194)
>>> #define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA REG_BIT(15)
>>> diff --git a/drivers/gpu/drm/xe/xe_tuning.c 
>>> b/drivers/gpu/drm/xe/xe_tuning.c
>>> index 27cf1330facd..5abef45a10fc 100644
>>> --- a/drivers/gpu/drm/xe/xe_tuning.c
>>> +++ b/drivers/gpu/drm/xe/xe_tuning.c
>>> @@ -26,6 +26,11 @@ static const struct xe_rtp_entry gt_tunings[] = {
>>>       XE_RTP_RULES(PLATFORM(DG2)),
>>>       XE_RTP_ACTIONS(SET(XEHP_SQCM, EN_32B_ACCESS))
>>>     },
>>> +    { XE_RTP_NAME("Tuning: Set Indirect State Override"),
>>> +      XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, -1)),
>>
>> as noted by José, since we have that define let's use it:
>> XE_RTP_END_VERSION_UNDEFINED
>>
>> with those changes:
>>
>>     Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
> taking that back, sorry. Just noticed this setting needs to be
> re-applied on engine reset, so gt_tunings is not the right place.
> Please add
> 1) engine_tunings[] array
> 2) xe_tuning_process_engine (to be called everywhere
> xe_wa_process_engine() is called.
>
> This can be done as a preparatory commit so we don't mix the addition of
> this workaround with the additional infra.
>
> 3) Make sure to add FUNC(xe_rtp_match_first_render_or_compute) to the
> the rtp rules
>
> Lucas De Marchi


Do we need to fix i915 for this too?


Thanks,


-Lionel



>
>>
>> Lucas De Marchi
>>
>>> + XE_RTP_ACTIONS(SET(GEN10_SAMPLER_MODE, 
>>> INDIRECT_STATE_BASE_ADDR_OVERRIDE,
>>> +                 XE_RTP_ACTION_FLAG(MASKED_REG)))
>>> +    },
>>>     {}
>>> };
>>>
>>> -- 
>>> 2.39.2
>>>

