Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7F6C4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 01:56:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F2210E16B;
	Thu, 14 Dec 2023 01:56:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5CB10E16B
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 01:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702518992; x=1734054992;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Qj22coVjqBVneAg48qBrquNfd6PAvAMEO4yyNX11WuU=;
 b=GJY9SVxpkA74jl5Jrre6zWB2tW5KCpuxlLlAuiRVoprp43fdAG6huG3j
 OrCbCaeONkQrhPm14pW0c6MTqWGkOaMUxID+eFylTMGea0FPn8xIljD5N
 TaKRPEyt6HR3kUr3ZJIqjJwjNXzE3Nk4BYFO3/SsPCXf2Q133lDACxShr
 oDv/5r6HomwR4FR3/CIZgZ4G5g46l+SBSCLv0K1XPV3CBHyHCg0mhv8mP
 VoGal20OxGlS8tqNIjy2l8yGUVLCUzgw66baqs82xLxMVgsicpvDImzmx
 gEsNyT5l1IHS57/h4i+Q/cgSiUMqOvZGuxLFyrWD2sXFUVOCXciV7+Vyf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="8450289"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="8450289"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 17:56:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="844534128"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; d="scan'208";a="844534128"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2023 17:56:31 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 17:56:31 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 17:56:30 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Dec 2023 17:56:30 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Dec 2023 17:56:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ippr6MZ/epYTuNO9aOMkH3ZNzOgYzxJVdE9ehV9DHpaSoUI99PgXIw7m6f/58SlMnz2zrm9VzHXCyXL0am3KWm/cjIY6Lr3RHWGHwwfrO/KwIG9N0qUnTc5X5Bk18VtgfQlYM/eOud943JViuOuCm+6x0gL0O5ZSc+k63EBthM6YHUsJxCwVZHS5hrSYAXcCzsY7mkbTNY4ig/chrFl4IbZN9HSFaEFe+RquY/IzHS6QzJi3wkJjEzCa6Vu4gC5y5fSaojQ40vtdacrB447bZiOFxaDLSyHj21u2AaytWEoMo3laqKoHgdFETf+3Jqp0JmOG+wpYmVD4SFa2NWFBPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N9nQVB7Hzyf0yKoFBaaSQJPQxVZjAyphCypDejXIF1c=;
 b=JRnm3sQtUDrGmy7QrQAswXjmtNBQDOXUnfWBLtmZCoaHng/F6H6Tv5V5OqgUGj5PT9RvUXG7l1WfUDgHXa63umuqQZYXnPZHGy+Dfac9UAOPIvsTKBB60LRcsUYP4qxANZ5ci59N24huIxMX/CXzb77FyTmF64+J0RU9Uv3C90UP/xu7hNuP57XyJdSt2jNkeEWSvqfG5YnJWIrA/Nbfka0VC76nPF4UX36eKwVYvZxWnamGjnR/MBN5df9rfTRnxy0F0hV0FQ5no6Kz4QQN6oVQEN3CMqLau4BGDItYjSrY/HbIdtN1fI8yDrv7lUk+w+4EUCnspPFJQuxseUm83g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 MN2PR11MB4549.namprd11.prod.outlook.com (2603:10b6:208:26d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 01:56:28 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9%7]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 01:56:27 +0000
Date: Wed, 13 Dec 2023 17:56:18 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v2 0/8] Engine Busyness
Message-ID: <ZXpgwiRQ7z3cTE3V@unerlige-ril>
References: <20231207125802.3730165-1-riana.tauro@intel.com>
 <4c5c2902-9503-465e-8a59-d17d75d8781f@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <4c5c2902-9503-465e-8a59-d17d75d8781f@linux.intel.com>
X-ClientProxiedBy: BY5PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::32) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|MN2PR11MB4549:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a9abf0e-52a6-4f99-6b77-08dbfc47e283
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IaHnOmB7xFc0iZ31682ppcqrIr6bmXbdYo9rUpzUUaxVjvFvxwFWJqS1wljQ24uRg/XTIeAcMD4KqAl0e7UjN/4aXihYog+umghWWkm+h5FKOduu3gKUBTMRkuy85jB4gFga97RXzgVdvB4HB0RgvPq+V8DZV/nAXY/Q/QrYqogKYBTrXmnpQOJuBthETIPizMdjNku620sC5CPJPji8hxNhRNpdyf6craCKdrbuxy3TjNeJyu63THlzNGPBNFBq+o9h9ZxSLOF1KAVN/2DANJWQP0RzBqKE1VSk7I5c8NH0RsmHdbABfYa/0uYAAYl08+2ZW7nloA9V3/y3W6ULOt+jgNIHXQTxIDPdcrpoZWshguiGv0JlBbOpTALz3pwkTSI09v8yxzVq1zSpocf8exSQwHecachM7/UH9KXYoXuCRRrFmxXsA0tt8t4PpOcjd9ZRV9328DAlvtW71PEBlBosejxHVDMb7+KT1TUUyeEau6KPe2a2GzIk43mNo2Eoq1OUhbe3nkrzuiwSrRlWE+++NTuZCeslsBAYlcrVdRl2hBxNY0vQaBtSVP56NPv0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(346002)(136003)(376002)(39860400002)(396003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(86362001)(82960400001)(6666004)(478600001)(41300700001)(6506007)(66946007)(66476007)(6916009)(66556008)(26005)(6512007)(9686003)(38100700002)(33716001)(83380400001)(2906002)(316002)(6486002)(5660300002)(4326008)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1hVazkxSnhiOUd0T1crVEVtb0NZMjhhYlNlQlkwVE4vSDNldDhOL3ZmQVJQ?=
 =?utf-8?B?OW1zb2JFY3RKWlk0amxVcHkwRzA3L3Y0d3VOQ3c1cFRMYU5OcytrVTdRVTZT?=
 =?utf-8?B?dHg1RGJvaVZmSXBrZS9EVTNTWUw1YUNISVh3Vno3YisrT1Yzb0dySUFsTHpN?=
 =?utf-8?B?cXVoR3B3MGFvdHhNS2huakdiYWxNNC94TjR1MVdIOVB0YjVEV3RDUDVzQ3pi?=
 =?utf-8?B?STlicU5EYWltR0NUbEthUVdib0NMTzcyUEg3V2g1YlJHdVNkYi9laXF6UzE3?=
 =?utf-8?B?ZVplZEQ1MENmbGZmWVNaZksvaEg5ZjJXSlkrZFU1VGdFTytENDBQQjBlb0VK?=
 =?utf-8?B?S0dFQUdyN0FXVWpMTmtSRGNheCtlU0FJajdpWitkVEtMUFZIcnpPVmxFbis1?=
 =?utf-8?B?R1hVclZrU1Z4WUVtUXJzZ2MwbE9TeDhZR1ErZWdCTXl4UnJ5Umt2YzJEOVZB?=
 =?utf-8?B?TTRaWTFQcWw5akozUG9XbzMwREIrSHFhcFBObktQVlhQMWZZcEdaL2xGWjZX?=
 =?utf-8?B?cEwrN0MweW9YbUdsRmtKZndqWWNVWkQ0S1JOcjJjcjVCdTVlRDlXQVlsZGI3?=
 =?utf-8?B?MllyRUJ0WUdnalovcDBaQkFjU3hLT3RDUVhiS1YvQkE1S0x0ditVcVorNTVO?=
 =?utf-8?B?anF5VnZPYXhxVGt2bklnMDd5QlN2bW1qcHE3dmxBY2M4OThhU24zVW00ZHNI?=
 =?utf-8?B?WXZ6WTNTV3dab2N2UWNTNEtDNkJnREYrZ2N0c0pjazBUWklwajVwWmRyQytR?=
 =?utf-8?B?STR4dUM4dTFmeURWelQ4UlpkdnRibU0xMEwwYWVRQlhaUnMrNWhCTDFZZ0ZM?=
 =?utf-8?B?Zm1jQ3JKY0gvcS95c0ZSSlVMN1JteTV4THFuS2dLSU1qdjc1M1FpeG1Od2V3?=
 =?utf-8?B?dVQ3NklZcXppVEJwT0dHZVpiZUxZZ1dEd1NTQTQydDIrZGFCNnk0YlNHMXM4?=
 =?utf-8?B?dm0zNmpNNkczd2RzQ1B1aTFHSDJkMEVGeWdqVVV5T1pIOEI4Z2JWQXdvdXRK?=
 =?utf-8?B?R1phajlyWmRwRkoyY0NiNGx2SnMveGgyM0Jvc0dVMXl6YXRXRnhYQjVOZnVP?=
 =?utf-8?B?R2VnYTB1d1R1WnZ6QkwwN3U1R2ZpOXpHYlFod2h3WWVOWHBZeUpaclhsMkxx?=
 =?utf-8?B?aHlweDh3c0tHUXd4cXp1ZmdZUUxWblpNaW52RHYvSlZRdlNPRllqWUw2M3Bi?=
 =?utf-8?B?Z3lOWWxWdURtU3lBQXcvT3VyNkRtUnpkUWl5aStneXI3cE53UGlvQUt6Mnl6?=
 =?utf-8?B?blFzU1pzRW02WE9nZkRrNnlzNkRNN01hQ0hsQXRYY3dsbWp1MGN5RkVDanZ0?=
 =?utf-8?B?ZW9uRXdnRmdOYmFKNUthUnNKQnRNV1AwLzhOd2tKcEtpR3lVZXRJZXhNZ2tl?=
 =?utf-8?B?YXA2VmRKdG53Tm5aOVpoNDFHSUp4cWd5SmVETnppSUlocVNORm1HTGxKZzFB?=
 =?utf-8?B?T2RWSTNuSVVRWmYwaVFQNTFTMk13UCtxc0tTU0E4TlFtVFFzcml5dndqaGJW?=
 =?utf-8?B?VDltbEJzUjFSY1QyWU8zUUo1b2ZEMloxVjFyUTU4Q3FSeVNqTWVXRGIvcWU0?=
 =?utf-8?B?WXpoemh0dU5NRy9neTRodmtPWlBrbFNHRHlmMjFRbzkvTWZYRGNWbGpIQ1Y4?=
 =?utf-8?B?bHF2b2E4M2FnbzFtQXowazFDTGhDYXVhM2JrMWtDUkg3SUxzZ2tJSktWMksx?=
 =?utf-8?B?UllkN1pPWTlES3NLanh3T2xNYjN0TldsbHYvTDZmcFNqby90N1FXN1REajhr?=
 =?utf-8?B?dGlLNkV5Vi9wZU1hcHdVNTVJTVZCVXI5ZUlNRnBxaU1zRDBXNWpHL1hHWnp0?=
 =?utf-8?B?WkQzaWp2RURuMFVOZ3pMeThCanU4VzhoMnVyRm9WUmFqZjhTTUMwNmhMbEpl?=
 =?utf-8?B?SzVqbEtSMytLMmtDU1ZhbW0vWVJjcHcrZHBmdFhscEYzQjVwdGRDSm5OOE9q?=
 =?utf-8?B?TkFmT1g0Qm83TUZLWGcxVHBYTVJyMy85d0lDcVF6MkhBbDN5VUdCWXdPdllD?=
 =?utf-8?B?aUVIWERQUUhpU2ZSU1c2empZQ0dyVm1tVjB2SnVTeFlYR3d2bTFRMi93ajNG?=
 =?utf-8?B?ZXM3ZEc2eE9sVFlpblVLSG9XM0RIVmlnQVlFUzNZbGJPYjBrc044OUF4K3I2?=
 =?utf-8?B?SUpLbG5MSDZlSW41WjJXNFZ0UWFDWEZvaVRSSE1CUngyaUgrTkorNE0rTmdO?=
 =?utf-8?Q?eU5O2dpz/zyl+jh0vdfmWrM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a9abf0e-52a6-4f99-6b77-08dbfc47e283
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 01:56:27.8517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ox8oStaWbnHkoD0+hqV8hfvtohOtIDagmx74mtpHcSMX5cR2Du4wxF/XcZ/wZmgpmCdskSVJTAz6qrZe9hw/sAFNTNc0Pb/q2OA7tf5HTu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4549
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 02:45:47PM +0000, Tvrtko Ursulin wrote:
>
>Hi,
>
>On 07/12/2023 12:57, Riana Tauro wrote:
>>GuC provides engine busyness ticks as a 64 bit counter which count
>>as clock ticks. These counters are maintained in a
>>shared memory buffer and internally updated on a continuous basis.
>>
>>GuC also provides a periodically total active ticks that GT has been
>>active for. This counter is exposed to the user such that busyness can
>>be calculated as a percentage using
>>
>>busyness % = (engine active ticks/total active ticks) * 100.
>
>I think I've asked this before but don't remember it was clarified - 
>what are the semantics of "active" with total active ticks? In other 
>words considering activity timelines like:
>
>1)
>     0          1s
>rcs0 |xxxxx-----|
>bcs0 |-----xxxxx|
>
>2)
>     0          1s
>rcs0 |xxxxx-----|
>bcs0 |xxxxx-----|
>
>Assuming 1s sampling, would the above formula correctly say 50% for 
>both engines in both cases?

Yes. What is the significance of case 2? Are you saying rcs and bcs are 
executing in parallel?

Either ways, when total active ticks is queried it would provide the 
latest value of the active time (does not depend on gt park/unpark since 
the value is either obtained on demand from GuC or is a value that is 
frequently updated by GuC.

The duration of context (in to out) is accumulated for the each engine.

>
>I am also curious if there are plans to add support to intel_gpu_top 
>in which case please copy me on the required refactorings.
>

Certainly. It's in the works.

Thanks,
Umesh

>Regards,
>
>Tvrtko
>
>>This can be listed as
>>
>>sudo ./perf list
>>      xe_0000_03_00.0/total-active-ticks-gt0/            [Kernel PMU event]
>>      xe_0000_03_00.0/bcs0-busy-ticks-gt0/               [Kernel PMU event]
>>      xe_0000_03_00.0/ccs0-busy-ticks-gt0/               [Kernel PMU event]
>>      xe_0000_03_00.0/rcs0-busy-ticks-gt0/               [Kernel PMU event]
>>      xe_0000_03_00.0/vcs0-busy-ticks-gt0/               [Kernel PMU event]
>>      xe_0000_03_00.0/vecs0-busy-ticks-gt0/              [Kernel PMU event]
>>
>>and can be read as
>>
>>	sudo ./perf stat -e xe_0000_03_00.0/bcs0-busy-ticks-gt0/,xe_0000_03_00.0/total-active-ticks-gt0/  -I 1000
>>
>>v2: rebase
>>     fix review comments
>>
>>Riana Tauro (8):
>>   RFC drm/xe: Move user engine class mappings to functions
>>   RFC drm/xe/guc: Add interface for engine busyness ticks
>>   RFC drm/xe/guc: Expose engine busyness only for supported GuC version
>>   RFC drm/xe/guc: Add PMU counter for total active ticks
>>   RFC drm/xe/uapi: Add configs for Engine busyness
>>   RFC drm/xe/pmu: Add PMU counters for engine busy ticks
>>   RFC drm/xe/guc: Dynamically enable/disable engine busyness stats
>>   RFC drm/xe/guc: Handle runtime suspend issues for engine busyness
>>
>>  drivers/gpu/drm/xe/Makefile                 |   1 +
>>  drivers/gpu/drm/xe/abi/guc_actions_abi.h    |   1 +
>>  drivers/gpu/drm/xe/xe_exec_queue.c          |  19 +-
>>  drivers/gpu/drm/xe/xe_gt.c                  |  26 ++
>>  drivers/gpu/drm/xe/xe_gt.h                  |   3 +
>>  drivers/gpu/drm/xe/xe_guc.c                 |   7 +
>>  drivers/gpu/drm/xe/xe_guc_engine_busyness.c | 367 ++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_guc_engine_busyness.h |  21 ++
>>  drivers/gpu/drm/xe/xe_guc_fwif.h            |  15 +
>>  drivers/gpu/drm/xe/xe_guc_types.h           |  25 ++
>>  drivers/gpu/drm/xe/xe_hw_engine.c           |  50 +++
>>  drivers/gpu/drm/xe/xe_hw_engine.h           |   3 +
>>  drivers/gpu/drm/xe/xe_pmu.c                 | 189 +++++++++-
>>  drivers/gpu/drm/xe/xe_pmu.h                 |   2 +
>>  drivers/gpu/drm/xe/xe_query.c               |  23 +-
>>  include/uapi/drm/xe_drm.h                   |  24 ++
>>  16 files changed, 726 insertions(+), 50 deletions(-)
>>  create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_busyness.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_busyness.h
>>
