Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66352C64EC4
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 22:39:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA5E10E0B5;
	Wed,  8 Mar 2023 22:39:35 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1865E10E740
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 22:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678315174; x=1709851174;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=My8BAGvNsE3kAhdtVkkaK15DXNJ1SR5Iif2r/0halik=;
 b=DOewIRGfifhXfslIX+yjDMVNIPrwwYADxEZywXVB4P8vs68iuggW9uod
 ZNVRob60QQRi2jN+K67EIDEtSrjf64HzLps4WS1ydOtG2VK2RIlFaU5aD
 MQsosFn0Bigxi0AnLfxmSoDy+MG76fxkoymmmTFcEcy0sEQRs61yn2z/D
 vZOH0zSXjFFOF1YfBb2eVy4CFmRiC8ihlqPTIca4oT5VX18qbJd/nFDGp
 BvalauOwA3U2EAxB9nmtA8BPwcxT4Pe1lyNi+0nQQ8Kn4T87bfrXh9x0T
 tBM+1VtPCZNEVSw76Tpqffo9Eg6Cd5i0GgPOmLUqwWvTZL8QLg+mw6lh0 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="315951661"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="315951661"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 14:39:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="627117844"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="627117844"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 08 Mar 2023 14:39:26 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 14:39:25 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 14:39:25 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 14:39:25 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 14:39:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1iLc1vqWzhLH5w7u6BJfzQSOJk9VmgMYUpwbqce0W2BNg5bFvqYfmSn+qQxQ0dtlJxijjM3jxdVFF40vggk9oXsmJr5ovGurQdlggyXP5X5oLR5ujfmRtKcYUFat34FMmO6BxtkcTegWv5+OUgmYSyCAoIbvwywNvw1uX/Yrv+Abo7BbjT/EnKQVqQwZJU8MsTnaD1aXfj3KFhJj3Wn/H4Y3WNT8tuqLpDFMr6vcf5SbAx1ixuVPk9gFHbgT1OeXlI+Qlva8AGAUTegzvSFp39iRU7tufwUCnXIXq4uyhGr6n/iMKobZKZsLrwNU2gCdqjyLItKyAAKsVIS+KrCUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oOBS0xhDWKoE5hqbhXcRsxOYV9S+7UJPYnfdJZAPoX8=;
 b=bZsdxhBVmUlwxI0qOPaThUb1FSC+8eFRXR+PUrcwlvUc6LPJ6XYyGOY0Lt36Dk1IdwuTACEAh20hcBdDTXtJ3wKMPshI3NzvwkyUlHCK3FdFm/udpLfAW1yzdE49CNfT6mXgdu20i678lcc7dkX98g80r9kAujM1k6MZZTRUZEHUDO64VYjeiR5Upe3bqKE9FZaTjzTRfySQWoRbVTigVyHS3bFpqWE0zmlbpiinlHRBgsxrdFaaJZLBiTugFqHoyEuy2ChrS758QcLpCrBsn2c7KgegaXlzxY1u8veVKKTxxGVtcMvMl+njwJnZSl0Z2N4ZR3/PclCwFj0bxaj/hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5902.namprd11.prod.outlook.com (2603:10b6:510:14d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.25; Wed, 8 Mar
 2023 22:39:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 22:39:22 +0000
Date: Wed, 8 Mar 2023 14:39:20 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230308223920.ooyw54ufsbiynnsi@ldmartin-desk2.lan>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
 <20230307092446.1263266-10-lucas.demarchi@intel.com>
 <20230308221622.GD1543793@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230308221622.GD1543793@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR13CA0039.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5902:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e0e7fc5-f75c-4403-552f-08db2025f682
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QL8Tof31tj5GUyiN4bg2w2v/ouO1I+dVKNsYuU9OSsX3Z1t/dMK0YBHTs7g5jsvVZnPrgxdk8EBSv+UrjMswx7qT9x9xyhGDq2cDV32JDJr5+IkDUXTuCg0j5P9+zvfm1v0G1f7uL7IOKcr3IEk6IqrNTRp4WapSMgzdujfQ9qZnKQwrhG1Ve6Elg2Po+zah3e870Mzs6s4XpaeTbpWLsnjxu4YrgrX28tFKR6/0MUeXgomdXZ6QQJYfJO3LjnMVGgInCdeQjh3bSTbuQVmiRC72468f003tKm6Yonkmqf5QWJlMQQCzJiw3O6UU8WVxtlayIOz5JvcX/Jny4Yax33xwdMRBYVdm0b3ddbUoUF+xccLUtgSsaQc1GTVIvc+FzxgJ52flEFrq/H4WAV2ADOByY/+jsn3DAllFc8O96biufA2SixucnyRrRMdo3XCCsW2J6/ZTmmr3GCMI3BG1NljPafFvz3tt80cSZ0VmSdNOwrtenfmlAGXQzVu2ZPhk1JXCK0wHjKv5InQhVU4nl79EslpmyGAtOO9vrtuTHvgZPBwnwrwyrv8kJnoPfNtG4fNx7M8wukb/T2FAXs1f+HWcGOZlXA3Xyo3VmMCdhms3iWEggGqMzbsH9HG/X1nde0rzSRirW+GEF0rNszisVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(366004)(39860400002)(396003)(136003)(346002)(451199018)(82960400001)(2906002)(38100700002)(5660300002)(8936002)(6862004)(86362001)(41300700001)(36756003)(83380400001)(26005)(8676002)(9686003)(66946007)(4326008)(66476007)(66556008)(186003)(478600001)(6636002)(6486002)(316002)(1076003)(6512007)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KAV4BMrrS5waFRuYes45p6/3feExYNhfKTFRyXKinh3o0UnxkyVKHm4ayfRr?=
 =?us-ascii?Q?gZjzPi63WHcKRH06EJbtJjgneYBsOpt1odm9pDB+fgJAvNlsMqrOKYhQ5jsy?=
 =?us-ascii?Q?7raATAiM1EmroxWLhulJvXJtB0FeI5RMqC7gsrEwmJkJX0yHtBytNsGO7lGs?=
 =?us-ascii?Q?bVpjaqIJw27wn9TwIwZOvjOHBQ4K2LdCXn03SYpMRdW8FJioRostYbynM1AS?=
 =?us-ascii?Q?xQAAIZ97jnpEkxotlFfSw7LZQ929rlDPFID5nTVK0xEPpRu2s+1jcZz7wUz+?=
 =?us-ascii?Q?rmuYUiiatsWLioK0cwilUA5X28MYg32mRECcSGMlbH+IzCYTPSgmKzGzsyIh?=
 =?us-ascii?Q?FGORCNHnf+4bI+rZjRSs3gO5+I1f46qYKcdIpT7fP4tOIh398sO9eRI55mxp?=
 =?us-ascii?Q?wkRxxmFn5LeMIrg8GAnNq3P5L63QJwQ/wIAEP+nNX08OUgWeoPe0B6k5ro4T?=
 =?us-ascii?Q?A1SHqQF62n09ItgEpO4s6zZv+d3c/Gl93Yq/ib9lhq2jKL/6zwINSWOosYyS?=
 =?us-ascii?Q?91u1H/1JXSiD/oqXqNDSQjfBRlvfWIcxDh/IOPUB9HM1VhAlUi1IAKQrVxYz?=
 =?us-ascii?Q?pBFqIFWbin+EGmB+lW2w3R2IA+1i8Suwcyz4535rBAiWRVxAdqboV0mNj8Tx?=
 =?us-ascii?Q?A1WRrbK4FgcTe6SPMriDE8dSxkN6GOiE68rE0k1NZgc7ioR1pNgyCN7tIixV?=
 =?us-ascii?Q?x5fB++VuCVXWGkC9zy4yWhktyF0sUt9LrBtM0J/tAV5pr04/5TrqXT2mVe61?=
 =?us-ascii?Q?Tn4tOXgSYy7+2l3zU7Y0p7U+h9uQBDKpEDRJdR12LzS4XefOjfVdWIiz890G?=
 =?us-ascii?Q?YqIKncswA8yOAzEaYYs3sqMcDnm+9JGGpQoMKYx0lAb6kIZkxUJZ5Ng+t8AP?=
 =?us-ascii?Q?9WJ70/Ay3wjgYhXe6TKStxVljsXAytTaXHmIES0qo37KqCy6n4e1vA+mnmt8?=
 =?us-ascii?Q?ubaYrleGVdBhElWGh/3093dqhCBxmfbYvcz2hGhCjC+0DQnnkBMsb8XwCZj7?=
 =?us-ascii?Q?igR7W3xzhQkc4FqMf5iffRmCBPoctwn0lXNXOfwnw6V41POn1gSZFJd284fv?=
 =?us-ascii?Q?pcDMXtcTQKYWjoqMh6oOodxoBEXbIS7IO0+OMTvBF3n7WeoMrwDyyF0ZiY1i?=
 =?us-ascii?Q?bl4NzdAS5bnizvZHwk5mSH5PY4bpgpoWWlhPpfz5Ly5WolXBayM1Ip+tXRj7?=
 =?us-ascii?Q?5UWzAuXcfbY1si5ncGsa2SeF3Ua54v56LlWQI2XkryYJKiL/33V9Po0R/uCa?=
 =?us-ascii?Q?G1+RjrQhJjJftAwzc4YmYp7s78GeOd7d+TEmrZDeUnHtqPFSHpyEq/k2LNYS?=
 =?us-ascii?Q?pgDyk9C8AddByXEo1kgM0w5dMXBDFbHTltFcP3kBJw4h+jmXHpi0Da4NB50S?=
 =?us-ascii?Q?Jwrddtq/EOFpzKBfs9LtdMCxMxCdmJv/Ijqv2tQ242kpJqvuXIBDPdcV3Wtd?=
 =?us-ascii?Q?VLxHyLR6ppulVcmAC+sxV5WFioCmNkOGQsgKJXv6XmpBF5R6dwDUcL9oJyq+?=
 =?us-ascii?Q?wYFLvvJWhORM2wIUURukt7TCEa900drh4hncoWZUUSQhZpvTANya1lT44weW?=
 =?us-ascii?Q?cXwXDoRX9MCG3yuSBbZIvQTqAznfswDdiwWUxBdMoe7gDuFCyvZtOAl1gyne?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e0e7fc5-f75c-4403-552f-08db2025f682
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 22:39:22.6703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pa48gUdg3//SR5zNHUU9i7ewsVC/up9q1Opjk0cHiNooGzaJUb75uamfr3TZ+wrgoLv6jigEFoSqyWJFUDvNzZlvWq0hMQjgxrGcJ8A/9IA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5902
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 09/19] drm/xe: Name LRC wa after the engine
 it belongs
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

On Wed, Mar 08, 2023 at 02:16:22PM -0800, Matt Roper wrote:
>On Tue, Mar 07, 2023 at 01:24:36AM -0800, Lucas De Marchi wrote:
>> This makes it easier when printing the register-save-restore values
>> to know what is the engine.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 343370b44506..daa433d0f2f5 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -318,7 +318,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>>  		if (gt->default_lrc[hwe->class])
>>  			continue;
>>
>> -		xe_reg_sr_init(&hwe->reg_lrc, "LRC", xe);
>> +		xe_reg_sr_init(&hwe->reg_lrc, hwe->name, xe);
>
>Does the LRC sr's name actually get printed anywhere today?  I'm not
>seeing it from a quick skim.

in this series: drm/xe/debugfs: Dump register save-restore tables

Intention is to have a register-save-restore in debugfs to go through
each of the sr's, dumping them. The name itself is printed by
xe_reg_sr.c, while the type is printed by debugfs. I skipped the
whitelist in that patch, but I can add it there. It will match fine
where I print this info.

>
>Assuming we do start printing the name at some point, we'll just need to
>make sure the message is different enough from the ones printed for the
>engine and whitelist sr's since they also use the same engine name.
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

thanks
Lucas De Marchi

>
>>  		xe_wa_process_lrc(hwe);
>>  		xe_tuning_process_lrc(hwe);
>>
>> --
>> 2.39.0
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
