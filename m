Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390ABEB64DA
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jun 2023 15:23:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09FB910E49B;
	Fri, 30 Jun 2023 15:23:46 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB2C10E49B
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jun 2023 15:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688138623; x=1719674623;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yDiWmSxdc+7C7Q4BkC0GOyogfl1ajRzbses1/P3/e1o=;
 b=ZTQ68czPAgbkFYdIAKEXmqCx4BdhWEDsL31AtQYPT1APhidqczq3OR36
 WR2tL79QGUBfWEKIk//J08z+CcSwfB70a3OMb5VG15dg5tz0XfGOgaxHk
 ZnroFVBYve23nMSGbvzQcAHWzN2cZA/FpYNBrCGgjpj7IU7OvtAeQOKuL
 GdNaiSaMb1klAlfpwKX0djx3KaqSkkMCuE9bXaIkx0Ew5Tc97OiL2PQws
 xxnAOCBQm6yDcEeW+SMM5C+mQtJdXDeolmzs1GxHFX8sYqS8EwKp4NDx5
 HOjuNEDOT2sLZzUjQbRzdGNju1+bN6NkKHOc8Cf2AeJ8+MiHTbZHjHPcT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="426105097"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="426105097"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 08:23:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="667983046"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="667983046"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 30 Jun 2023 08:23:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 30 Jun 2023 08:23:19 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 30 Jun 2023 08:23:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 30 Jun 2023 08:23:19 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 30 Jun 2023 08:23:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fXOxxpWRZCg2qpHBepfrH0Po8R3PAk3ZMQLFG90CEIK+nI/HiJkjmEZLvn2gVNfsTNcWps5KjieoHOj5vfmC15qZ9m/6HDEqYoqf1EL2eLYFAo7Mo9G6PNM4q7q9JjT583EQdOPvDKDFNU6Kcv2jPgnQwnmoBvP+oHbCqtWO2vek20XMFBmtXzkxor9DY7223bSU6r6W7rCNMs19S7/aCsltaD1DUl0pGpBY2OOpZICZ6BUubXkc8slAHD2GxswDMEcCZjWUgkivawVjW6rbtcZIuPSnMPITkTGBEXULmVlY55PAqckuWYtTTJlaY0rntJdVzw5TMCyPS6FR3/1/sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYgkATJD1O0gsQ2TUVH4aZdBLV5PlJKJaNIoD8xJat4=;
 b=AtEeBcyxQ+B/9jwgD346H1xhY+7c0k4TEbscFlXknZ81OGo9/OPTDApuFPeaS1bxtzvR1wG0D051+BoY1ZDkeJHfmgV7vNYsum6DTk1+VCDPqlEp/HV3VPvR0FtYfGucPrkhs3Y2uZ8mGEpUgF6WBHl7maltLmy8PmpIKlvG12vs1zVh66YQn10K4FUgwMgThGJkn3Lo/0gtrFBpy9uDeJQEbc/rK0LS/pF4X9lVJ64ijAFHkxpGvG0Lr8oXHsnrQJbc59amzLUMFgTrRIobXLspdhYKIYKbHQ5RXf2viBSRYB/sTMsSLJQnxc09m5KfCrQIhmCODkSS+FReNlUI0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by SJ0PR11MB6693.namprd11.prod.outlook.com (2603:10b6:a03:44b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Fri, 30 Jun
 2023 15:23:12 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::347c:9286:96c4:cf61]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::347c:9286:96c4:cf61%6]) with mapi id 15.20.6544.019; Fri, 30 Jun 2023
 15:23:12 +0000
Message-ID: <ea61756e-0dec-244e-d47e-0fe199061686@intel.com>
Date: Fri, 30 Jun 2023 20:52:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230626105037.43780-15-matthew.auld@intel.com>
 <20230626105037.43780-16-matthew.auld@intel.com>
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
In-Reply-To: <20230626105037.43780-16-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0130.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::19) To CY5PR11MB6211.namprd11.prod.outlook.com
 (2603:10b6:930:25::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6211:EE_|SJ0PR11MB6693:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b537e26-bbf3-4602-4c3e-08db797dea95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q4NH8moItQw082+XxpNCIAZwhxwnL4LGr7hO5kF4X0q8hCq9Ayevgrxd9wHBJOW2a+hI8yNN4veR0ZktLtY9qtqxiuvsq6kG6PbiKYPGTVP/ejazvnISGeSMtf1apI0foBwTnv3nD6mqvP/RobGdji8Zjd5zOpS56qnXdekSYT+RI+k0+lZabHY4gzzKY7ni22EjnhWkWeFS5gvYo188seft8JYA+VSr23kkL2lQSPEDRyovAR26cVNvKpGEXivBJYT64lCjqYDhtylWXLQuNcBfn3LvqmWh+VDfGNhS53dZ3qrN0DrZh5PMlaDYIFc8Y9HjqXErXw2ViZ3adOq7/xNMH1uiOrsvBUrPaIr/6kr5ib5Ccc5F2sYrqJ9rKBjpjEkEE7fwLDSO1SWL4a3lEJd2turJjSFW8XUOb7mkIr7Tgtyh7YBSwssIY588KAR/r4qrrmEVTizZukR8RSj+MmWJZ/gDy/wJkuYVo0dW0J4LqKsVElFvX0JOfNiwhYvLIzlaiqEutWC/a8AuP+d2EduUzpz90+bhWEtpBFiCxFJs15+UOZd3IeUP5cnNmgIkqCkH1zrLlZeVD1mTY4inM/ULUGA3dNDLyI084CTpz6Hx6pvMkmyZ8aY7rQL54FhqphD4RaL2aTzi51xTjz9ejg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199021)(31686004)(66899021)(6512007)(66556008)(4326008)(66476007)(66946007)(36756003)(86362001)(8936002)(41300700001)(316002)(8676002)(82960400001)(5660300002)(31696002)(38100700002)(966005)(6506007)(478600001)(66574015)(26005)(2906002)(2616005)(186003)(6666004)(83380400001)(53546011)(6486002)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1AzSTcvc2hsOHNEOXEweElJSmhUU2ppN0ttVndQL2plRFFtaVhMbS8vRUt1?=
 =?utf-8?B?THNlNG56QUlXQmNqTVN3d2huSXhId3NtZnJXZmk1b3NnZEhLN240S01RVzBm?=
 =?utf-8?B?K3VoQnB4clpPSFlKYmkrdWhrV2IydHNwbEorWWdid0EvQ0pEamRXR2JMNXM4?=
 =?utf-8?B?eGNPc1lobG1RK3hmTDRjVEJSTXd4SkFJcDNaM3pkOXlLNzFidUpySXMwWUgr?=
 =?utf-8?B?cDU1MEtQdDhoa0MvN29RT1VZZHlQcjlZRjcrZ1czM0pTL0ZicE1vdzhLYWZt?=
 =?utf-8?B?SVBqYnF3cnI4VW1vcE1EaUFhM3lxam1aTnlld1FQbkU0Mm4rRkNBYWJmajZI?=
 =?utf-8?B?TlRra2VNVzJaNGEyRHRndDBjVC9XaVY3V3drRjZTMXF0RXhCQUkxSkIvUXhR?=
 =?utf-8?B?aDJ5TzhUZE80eVArTFRVTC8zbzFyOENLbW5vdnRYOUV2b1lIbEpVMUNzYUhR?=
 =?utf-8?B?NzV6TE5mT25BbDFiejB6QzFRQkRkOEVHRnU1c0p5cHBPZUNqTFJ2c0t4RVk1?=
 =?utf-8?B?ekdEUFJTUFVTbngxdi9xZ0JvQTlQMitwK1A2RU5Oa2V3a0psYnRMV1dOaTdM?=
 =?utf-8?B?SGp4N0dNZTVpNEhUUjZvcnlBM0xyemQ1TXA1OG5meXB0eVFCTFBNZEZvS1Nn?=
 =?utf-8?B?T090dG11UnYwZnp2SldXVm96K3JvMHg1OHdvTVpqaDYwWEozVHcwWkRCZjVs?=
 =?utf-8?B?SHZHckt0ZTU4a3Yza3VsK2F2VXVCQUluZGc1aVRMbUZ0elNsbzh0Qzl2L1pC?=
 =?utf-8?B?YkJyYS9GNjVJQkgydHZ6R09mVDNwN3lVRkx1aDMzSTNGMzcrZ1o1bFJsYXpK?=
 =?utf-8?B?aGNhQXRDRCtqZU5kUFNvU2pMcG1nZEloY3Y2K3QycTFHQ3ZUS3hOdWtsM1lQ?=
 =?utf-8?B?Y1RTR1BrcFNSMmo4K1piU3JmcTBtQjhGRm1QUGxreHVjaFZNS1hzZGVMakFJ?=
 =?utf-8?B?VXhGaWxtNG9DN2FMejdyN21NTEdBNzBrdktsVllyK0FicG92RU5HalBIcEdi?=
 =?utf-8?B?aWxBUmVPTUlwUW9lL1dZNDhjUEdnengrMFIvS1o3eVZFL0tQZk5adW10Sldo?=
 =?utf-8?B?YjhBbElwUWhkKzErQlloc0lKOUVCVTFScTZOMmpQcHF4OUdTeDNxWmQxM0Fl?=
 =?utf-8?B?b2FZMVErSHJ6Q251dTR3S2l6a1lmYVNZVzYxcExnNXNLcVN0U0dSbWhucWxa?=
 =?utf-8?B?czl1R3d3Rkh6eTZ2NlJpZll2Nmp0eGRXbWsxRHVvTVd0MVpTZzlxNmdUL2oz?=
 =?utf-8?B?TjZ5NThpZ1ZGY2x6WEtBSmZJdUV5cFpZZWZQZFBLaVFaVGNiV1g0TDlVcDhU?=
 =?utf-8?B?NERSYmVXcThEUmdLWEg2OS9XOGM1YTdNcG8remNsSFpqUmFNOHl1NlJsOFV0?=
 =?utf-8?B?MzV5UDBxTS9ZbldRUE9kZzRPNWdzQWNINjZYVmtybkpBODFEdGRoWWhRY0Y3?=
 =?utf-8?B?WWJvY3FTb3hTSk9waDRYbjMzbXZaK3A0Z2ZIZXlWSko3aXlIQ0hoQ0VzQy8w?=
 =?utf-8?B?OUszajVjeDdUYy95cWZPNGxCamxISEFMMWt4b242aGthNDJFaEh1YndHOGNx?=
 =?utf-8?B?OXh5bUlpOEl0blZqN09yTUU2alJ5UFZ1UXppMjYxNmZrTjZwdkV4dUs0aktK?=
 =?utf-8?B?Y2dZTlR1UXppOUZCL3JXd0xpRk03VnFGYS9KWkNvQ3dqQmFLb21CNmVpbUY0?=
 =?utf-8?B?Y0NtUjY4aEpKM1lLeTNrTUZtWFVPRkRQaE9QL282TkN2ZmJLZWRhWG9DNzVj?=
 =?utf-8?B?S3k1eWNzSGkvam41RXBpM3F1eUNHSktsZWRsSDNkNmFidVR5TkJGNTlFZnJa?=
 =?utf-8?B?cCtKUXFGNFZYKzZDSTJaM29KS0d5VFVHMnc2NEFYcy9DaHNwb3hvbjhSR2FB?=
 =?utf-8?B?OGNzaTVmN0l1clJVY29OQ21UcTlVL3pzSHBob2hBOGxKSW54WmlXc0lwOGM0?=
 =?utf-8?B?cUQ0N2hUdlk5bjR2Sm85NTJNNkVoTTViMFdyOEFOVGxCZ2tlSEltUG1xcFpW?=
 =?utf-8?B?cFdBWHg4d0lsMlM0ZkZaNUM1V1V5Vlp0dndmU0d0Q3ZIcHowRldXSVQrdHJw?=
 =?utf-8?B?ZSt1YUJrb3VPelB3Q2RYU3llY3ZueUQrZDV0aHY2Syt5YVZRUHFEQ1hSR1pD?=
 =?utf-8?B?QlV4NU8vZWh1bjZjZHdWcVhNdVdySmh4ZEhDN08zRHpWMzlTZ242c3AxblUv?=
 =?utf-8?B?QXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b537e26-bbf3-4602-4c3e-08db797dea95
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 15:23:12.0430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ltFk8EZ9hZPbgNMKKxaS/tn84sR0E7yBGfqBddEsXSnPQM0PelrfNi7a5gZdHztv2AV+cXxHtSkUgDcdWHQA+MBb3vwFSXWh6nRrObuVnk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6693
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v12 01/13] drm/xe: fix
 xe_device_mem_access_get() races
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 6/26/2023 4:20 PM, Matthew Auld wrote:
> It looks like there is at least one race here, given that the
> pm_runtime_suspended() check looks to return false if we are in the
> process of suspending the device (RPM_SUSPENDING vs RPM_SUSPENDED).  We
> later also do xe_pm_runtime_get_if_active(), but since the device is
> suspending or has now suspended, this doesn't do anything either.
> Following from this we can potentially return from
> xe_device_mem_access_get() with the device suspended or about to be,
> leading to broken behaviour.
> 
> Attempt to fix this by always grabbing the runtime ref when our internal
> ref transitions from 0 -> 1. The hard part is then dealing with the
> runtime_pm callbacks also calling xe_device_mem_access_get() and
> deadlocking, which the pm_runtime_suspended() check prevented.
> 
> v2:
>   - ct->lock looks to be primed with fs_reclaim, so holding that and then
>     allocating memory will cause lockdep to complain. Now that we
>     unconditionally grab the mem_access.lock around mem_access_{get,put}, we
>     need to change the ordering wrt to grabbing the ct->lock, since some of
>     the runtime_pm routines can allocate memory (or at least that's what
>     lockdep seems to suggest). Hopefully not a big deal.  It might be that
>     there were already issues with this, just that the atomics where
>     "hiding" the potential issues.
> v3:
>   - Use Thomas Hellström' idea with tracking the active task that is
>     executing in the resume or suspend callback, in order to avoid
>     recursive resume/suspend calls deadlocking on itself.
>   - Split the ct->lock change.
> v4:
>   - Add smb_mb() around accessing the pm_callback_task for extra safety.
>     (Thomas Hellström)
> v5:
>   - Clarify the kernel-doc for the mem_access.lock, given that it is quite
>     strange in what it protects (data vs code). The real motivation is to
>     aid lockdep. (Rodrigo Vivi)
> v6:
>   - Split out the lock change. We still want this as a lockdep aid but
>     only for the xe_device_mem_access_get() path. Sticking a lock on the
>     put() looks be a no-go, also the runtime_put() there is always async.
>   - Now that the lock is gone move to atomics and rely on the pm code
>     serialising multiple callers on the 0 -> 1 transition.
>   - g2h_worker_func() looks to be the next issue, given that
>     suspend-resume callbacks are using CT, so try to handle that.
> v7:
>   - Add xe_device_mem_access_get_if_ongoing(), and use it in
>     g2h_worker_func().
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/258
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c       | 58 +++++++++++++++++++-----
>   drivers/gpu/drm/xe/xe_device.h       | 12 ++---
>   drivers/gpu/drm/xe/xe_device_types.h |  6 +++
>   drivers/gpu/drm/xe/xe_guc_ct.c       | 34 +++++++++++++-
>   drivers/gpu/drm/xe/xe_pm.c           | 66 +++++++++++++++++++---------
>   drivers/gpu/drm/xe/xe_pm.h           |  3 +-
>   6 files changed, 134 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index c7985af85a53..1dc552da434f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -411,27 +411,61 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
>   		DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE) : 0;
>   }
>   
> +bool xe_device_mem_access_ongoing(struct xe_device *xe)
> +{
> +	if (xe_pm_read_callback_task(xe) != NULL)
> +		return true;
> +
> +	return atomic_read(&xe->mem_access.ref);
> +}
> +
> +void xe_device_assert_mem_access(struct xe_device *xe)
> +{
> +	XE_WARN_ON(!xe_device_mem_access_ongoing(xe));
> +}
> +
> +bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe)
> +{
> +	return atomic_inc_not_zero(&xe->mem_access.ref);
> +}
> +
>   void xe_device_mem_access_get(struct xe_device *xe)
>   {
> -	bool resumed = xe_pm_runtime_resume_if_suspended(xe);
> -	int ref = atomic_inc_return(&xe->mem_access.ref);
> +	/*
> +	 * This looks racy, but should be fine since the pm_callback_task only
> +	 * transitions from NULL -> current (and back to NULL again), during the
> +	 * runtime_resume() or runtime_suspend() callbacks, for which there can
> +	 * only be a single one running for our device. We only need to prevent
> +	 * recursively calling the runtime_get or runtime_put from those
> +	 * callbacks, as well as preventing triggering any access_ongoing
> +	 * asserts.
> +	 */
two runtime_suspend() can run in parallel for two different pci device 
those worker thread pooled by pm_wq workqueue, it is not guaranteed 
that tast_struct will be different for two worker spawned by same pm_wq ?

> +	if (xe_pm_read_callback_task(xe) == current)
> +		return;
>   
> -	if (ref == 1)
> -		xe->mem_access.hold_rpm = xe_pm_runtime_get_if_active(xe);
> +	if (!atomic_inc_not_zero(&xe->mem_access.ref)) {
> +		bool hold_rpm = xe_pm_runtime_resume_and_get(xe);
> +		int ref;
>   
> -	/* The usage counter increased if device was immediately resumed */
> -	if (resumed)
> -		xe_pm_runtime_put(xe);
> -
> -	XE_WARN_ON(ref == S32_MAX);
> +		ref = atomic_inc_return(&xe->mem_access.ref);
> +		if (ref == 1)
> +			xe->mem_access.hold_rpm = hold_rpm;
> +		else
> +			xe_pm_runtime_put(xe);
> +	} else {
> +		XE_WARN_ON(atomic_read(&xe->mem_access.ref) == S32_MAX);
> +	}
>   }
>   
>   void xe_device_mem_access_put(struct xe_device *xe)
>   {
> -	bool hold = xe->mem_access.hold_rpm;
> -	int ref = atomic_dec_return(&xe->mem_access.ref);
> +	int ref;
>   
> -	if (!ref && hold)
> +	if (xe_pm_read_callback_task(xe) == current)
> +		return;
> +
> +	ref = atomic_dec_return(&xe->mem_access.ref);
> +	if (ref == 0 && xe->mem_access.hold_rpm)
>   		xe_pm_runtime_put(xe);
>   
>   	XE_WARN_ON(ref < 0);
/snip
> +
>   int xe_pm_runtime_suspend(struct xe_device *xe)
>   {
>   	struct xe_gt *gt;
>   	u8 id;
> -	int err;
> +	int err = 0;
> +
> +	if (xe->d3cold_allowed && xe_device_mem_access_ongoing(xe))
> +		return -EBUSY;
Not related to this patch but We should return -EBUSY even for d3hot as 
well.
Br,
Anshuman Gupta
> +
> +	/* Disable access_ongoing asserts and prevent recursive pm calls */
> +	xe_pm_write_callback_task(xe, current);
>   
>   	if (xe->d3cold_allowed) {
> -		if (xe_device_mem_access_ongoing(xe))
> -			return -EBUSY;
> -
>   		err = xe_bo_evict_all(xe);
>   		if (err)
> -			return err;
> +			goto out;
>   	}
>   
>   	for_each_gt(gt, xe, id) {
>   		err = xe_gt_suspend(gt);
>   		if (err)
> -			return err;
> +			goto out;
>   	}
>   
>   	xe_irq_suspend(xe);
> -
> -	return 0;
> +out:
> +	xe_pm_write_callback_task(xe, NULL);
> +	return err;
>   }
>   
>   int xe_pm_runtime_resume(struct xe_device *xe)
>   {
>   	struct xe_gt *gt;
>   	u8 id;
> -	int err;
> +	int err = 0;
> +
> +	/* Disable access_ongoing asserts and prevent recursive pm calls */
> +	xe_pm_write_callback_task(xe, current);
>   
>   	if (xe->d3cold_allowed) {
>   		for_each_gt(gt, xe, id) {
>   			err = xe_pcode_init(gt);
>   			if (err)
> -				return err;
> +				goto out;
>   		}
>   
>   		/*
> @@ -182,7 +210,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   		 */
>   		err = xe_bo_restore_kernel(xe);
>   		if (err)
> -			return err;
> +			goto out;
>   	}
>   
>   	xe_irq_resume(xe);
> @@ -193,10 +221,11 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   	if (xe->d3cold_allowed) {
>   		err = xe_bo_restore_user(xe);
>   		if (err)
> -			return err;
> +			goto out;
>   	}
> -
> -	return 0;
> +out:
> +	xe_pm_write_callback_task(xe, NULL);
> +	return err;
>   }
>   
>   int xe_pm_runtime_get(struct xe_device *xe)
> @@ -210,14 +239,9 @@ int xe_pm_runtime_put(struct xe_device *xe)
>   	return pm_runtime_put_autosuspend(xe->drm.dev);
>   }
>   
> -/* Return true if resume operation happened and usage count was increased */
> -bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe)
> +bool xe_pm_runtime_resume_and_get(struct xe_device *xe)
>   {
> -	/* In case we are suspended we need to immediately wake up */
> -	if (pm_runtime_suspended(xe->drm.dev))
> -		return !pm_runtime_resume_and_get(xe->drm.dev);
> -
> -	return false;
> +	return !pm_runtime_resume_and_get(xe->drm.dev);
>   }
>   
>   int xe_pm_runtime_get_if_active(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index 6a885585f653..e92c508d44b9 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -19,7 +19,8 @@ int xe_pm_runtime_suspend(struct xe_device *xe);
>   int xe_pm_runtime_resume(struct xe_device *xe);
>   int xe_pm_runtime_get(struct xe_device *xe);
>   int xe_pm_runtime_put(struct xe_device *xe);
> -bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe);
> +bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
>   int xe_pm_runtime_get_if_active(struct xe_device *xe);
> +struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
>   
>   #endif
