Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 729A6C10DAA
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 13:54:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423B410E6FC;
	Thu, 30 Nov 2023 13:54:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01DF910E6FC
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 13:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701352460; x=1732888460;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ECQNvDEdFag1xVcv3RTxbOvACDMoEW0+wc6x4uBvDFM=;
 b=F2ytPA+tBwRh7asmASM7KQPUsZU/6v6TqLWWoIXd5BO3JDobrQxW/JXM
 cDNidh4JZfwq2VDQH6pggesnusFo5+XJ9tS3cTcOxArxpt8M0wOjbMPic
 0gc4CbRtDmXNFD8ne54stbthOXNCsHbhajQSNILJcUxu6kv9p8jQ7PN3J
 eMxBiaxSJ5bEobUGSAuUJwOzrkKLLbs3urnksKvWf02E1qqpPfPIejf5Y
 wfyowIDv9S3XhuptujBV0iiQP64vFripmE7lx0nR1T9lQZX5oGD2ZrHX3
 4hX3jb5fim6vMFmyw+CvZsuvkJsBWwS4iTgWl/zHE8/dDuKbbVS/cocBs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="457646845"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="457646845"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 05:54:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="803704132"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="803704132"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Nov 2023 05:54:20 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 05:54:20 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 05:54:19 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 30 Nov 2023 05:54:19 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 30 Nov 2023 05:54:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxtV2nJrOjvTCCyia8C1HK0bcIv3hZYo4HkbSQkwRomjae93p8T3M0ZTcxWBWF/ES5SgMb6u7H5anfTq4C8HW8Eljdi9FpjnFlQE89jmx8gaNtLXm2xhGJ0rItLH+e3oxgE4wnio8ITpgk2PByywQmP0BiuXqgjCEfBWtomh1rPfeP41r/OiD+W/gqOKnMAQGsNZdgNedbHg87l4qD3TgIpvKTQTIZjTYLcINw4qB7sDw7nrJDlWNqSvRVsOc0ofpZL9QiG3fJ6yIYU3At4EREJJa0faldabiPWWBwgc1XgJuUPhRtYBAm3ap5z9M6By3210wEO3UNUH/bscz2NrHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1K38OgACkYNGRyxb9rnCx78tiVjstcPr9kj4cGXr/Fk=;
 b=XS4dziAaM5v+7uJY0I+wrYp/h6jXZBlJzEruC2yaOvLaTnqLrjSvFD/mjK/lrXD7EwWDzoG5O7wvQrdzzNTfhRC+ZrKZwOgCBtUlGTx36b/CLY91bH3cAonZmCSduABBIWlfzQb8mltMRDTsU+jZ1XekkRg989EiKG2dktxwlLx2F9RRaUVIQ+zcaxG4idTIFSc7WQpV63gT55pq/D+qoeO36RXj9Kwid04oreWOmi+9oDDW3jQWM9qzHTnPG0ARqGmEKHrEnz1WO6kASID1O6zn6JX5LwQjHK1G2X2QyWY8FiO6uYqtuXa2bZIJoO8HMaakIpBDoCfU0ugrhNaTLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM4PR11MB6017.namprd11.prod.outlook.com (2603:10b6:8:5c::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.29; Thu, 30 Nov 2023 13:54:17 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 13:54:17 +0000
Message-ID: <fcb63598-16c1-4b4c-af2c-2980aec14629@intel.com>
Date: Thu, 30 Nov 2023 19:24:09 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231009062209.4009360-1-riana.tauro@intel.com>
 <f70be810-bd1c-fc50-fa6e-5ee00ef4d962@intel.com>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <f70be810-bd1c-fc50-fa6e-5ee00ef4d962@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::19) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM4PR11MB6017:EE_
X-MS-Office365-Filtering-Correlation-Id: 28671abc-5bb7-4e1e-54ed-08dbf1abd7d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VFEKuvoh9qqJVdziNc3bM2mkRjVmXj5T8XvlKJmI2OqZrxL420afDvzS5UzkiJbihiY+zhmes55BW+YiCo9Z6AG6Y1ce+VqpH+/HaVKth+iiA6ctrB/8iHCIyKxQ1tqENgw8mY2q7iRzKAs2qceH6oakoXpfMFdgKd2afkHNPl1akS61N+O1jSxEuDAkl3Bjqi7FVyw1RbqcubJzqt4hS31K3UhNI9O8Z8jkjMNf+i3XaVbLRdEU/LVhoYMYnWrcZzlaRE+0JRiKXKhUJS5yxm8oEUR1uMqWi4HUa4LRpB5kzT/OtwtUoJNw1u6IWmhz4x4reNtJk6heF2S53unYlN1nfqfBszBcY5VEuufFkqKCZ6uNnSwBJs+GHSPgQZiL46IFB0Xkq7gZE/ru6+FysCbhoEU+277eekfUfeKFpTXivK2ihncNyEcLrTyNJLiEP/c0OrgK1kuNTmRhV2cewkogMGyPsrfjK3kfnspvMgQGfBxY0UFW5OQ3Cx1n3wi4x39hci+8ViVd8IHhYtSPcx08WI1ECYkc+iSdAtxKKCfLNhDT+eJKL2IuctPCo09Qh2Xv2AgZFHz1TPzxJ44yqgeqenIZYhQkHdxFKJX8eJqw8qWUCGr+BOR0f7r4Sqb6V1JEaJJEgugPcATr0pT47Cotm1FSqXew+3z/soVM4Otnuy8KsAe4wUo55kpD8h8M
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(136003)(376002)(366004)(396003)(230173577357003)(230922051799003)(230273577357003)(451199024)(64100799003)(1800799012)(186009)(6512007)(316002)(6506007)(66946007)(66476007)(83380400001)(31696002)(478600001)(6666004)(53546011)(26005)(107886003)(2616005)(38100700002)(82960400001)(36756003)(86362001)(6486002)(966005)(66556008)(44832011)(2906002)(5660300002)(31686004)(41300700001)(8936002)(8676002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnl2aHU2azF6ZWhDdFVnaGQ1YkR0ZDBzYWJvUm5IWmUvM0t6d0xwdXB3OUsz?=
 =?utf-8?B?NTJTMThkREpuZXVqM2dOdkw3MlBYRmkzUnNwMGFFdDgrM2kyS0V6Vy8xaVV3?=
 =?utf-8?B?VWdTZkhPanM5RzJqQ0tnek85TVgyMXZkbE1tdzg4b0h3R1Z3ZTM5R3JtM3hs?=
 =?utf-8?B?ZUpZaFVTRFN1L0hJSjdlbnNPMU44c0psZzMxZHlTTmdLSkR2aUpEamhjd0o1?=
 =?utf-8?B?ZjBwV29GOTRtWk5vSG1rU3VKTlBQQjFNWlBrZUJaQmtRMUlhU1AwOHlsUkp6?=
 =?utf-8?B?aGlWaldHSG5nRkpGejkzTEN4V1lRcm1ibGc1RDFIREsxWGRMcjhpMkd3SlYy?=
 =?utf-8?B?RjE0b09hWFlyZG5TNjhrRXM2RTNLVm5FSUFiNDg1eEtCQ2ZHRlFsNlNjaGxS?=
 =?utf-8?B?RStPRzl2dGk3dmxPL3Z5QUptaWFjdjRtdjhLTnVkMlhjUlRGcUZJWnQrWEpZ?=
 =?utf-8?B?SFVBUUpaRDVxM3hIMVZiM1Zldjc0ZDU5TmVGRmVFTFlNbHkxZkVwUTYxdjBZ?=
 =?utf-8?B?NW8zTzQ5NkhaSDVnejlRL2I3aEc5K1l0VnVwNS80SWF3VDhXbzg0R2tIL0h1?=
 =?utf-8?B?TkFvMW0xeE1iMnpDUk8vT3k3WGRWd01RTWd6TEI2T2pVaGhQOGZTQWZTcXhE?=
 =?utf-8?B?TEJ4a3V0WVlHd1d6WERPbGZ1WElKVm5rWkJiVWpjNFZFQXU0NW9nemdLNGlP?=
 =?utf-8?B?MnFFN1gzTVZpemZEMTlnNndEbjQ0OUNEMjkwd2RrQ1YwUGF2WXFoUHliMVFE?=
 =?utf-8?B?RzNIOVlXVS9BTWtYS3g1d1h0M1h3dFExSGRNTnVWL0xtaUZzZ0pnT3FZdU5S?=
 =?utf-8?B?SnlUVGQ3NzNEWU5jY0hJbkkzZHR2Ryt2N0lkOVJPd1NUeit6NEhQU1BpUndp?=
 =?utf-8?B?Z3hyaWE4bnFHRDBTejI3NXhTSEx4RVpFclB5ZCtFR3MzNEZpdFhGNDc0cVRk?=
 =?utf-8?B?cGhJUW1IcUVjRlRUK1JaaVZJKzY5ckpMQXdneTNpSkY4UUpEVDcvNlVhV1J2?=
 =?utf-8?B?RnVRZVpYbnc3RHBsY1ZZelk1c2dMWVpFY3I4NzBqRlUyUXlVaGtvaWtkdm43?=
 =?utf-8?B?cHJZcTBzcXQ0ejBNRlA1aFUweGZMODczYlRMcmltaWhWak9BVHh6RmhsU2l1?=
 =?utf-8?B?aVg5UEdjUTcwcUd1emtsT0pOMFdIczNUU2FNaFNsQndYWHZHVnVhNmlKazJX?=
 =?utf-8?B?N1RxS0NrTkpocEpBdExRLy96UE5MR3QwVTNlZC9RclZjOGtiakdiSXF1bEhs?=
 =?utf-8?B?RWhpWi9makNqQThNRzNsZ2FWb2RsVENOd2RYd0cyWno3VGJXQW1uczFXN2t1?=
 =?utf-8?B?SmVPWVdXN3drVGZTZ1EwUEFxU2xmZW1nbW5neGxYSHVubUZWYnBSOW5CN01U?=
 =?utf-8?B?bGZjNmM2dVUzeWsxa0piTVorNHAyZVhNZDhUekxzdXdscmZTVTc3VkdzUlNz?=
 =?utf-8?B?VWE4MnN0ZlBNc2VLSVFyUGs5OFNrUlRzL3VTVXAzL1V0Vm45Q2wybXNZT1Bo?=
 =?utf-8?B?Z2NnSWxRMzRUSmlrYWpRVXJzT2NScHNyMmw2OGRzVllsK2d3Mlg1Y0oxblpn?=
 =?utf-8?B?WkNJcE5aNkxQcFl1RXRza2I3UTFpTU1PRWRwS0VLOEducm4yUGZiTVpPd0F3?=
 =?utf-8?B?N0xBSzFIUGVuWHdrZXM2VEVGQ2F6UkVtT0ZEaytVTlZqbnFCbWJTTFAvRFE3?=
 =?utf-8?B?cDd0QWVjSzFoNWcvTUpaVGlIR2dvZjZJby9kSldjenFlTGVuTkZkWFMybWVl?=
 =?utf-8?B?VUxwRDB3cWxxVWphb3lBSEpVTHI4OURBTW1iY2ZIR1JHUys3eHRrZ2NaWGJl?=
 =?utf-8?B?aDNidW5RZ3JOQWxGb2RTV3A2RzZWanlKMDdEOUpQLzc0ZzhoMmd1anlsTjV4?=
 =?utf-8?B?b0hqZU5NN3RwTUEzS0RaRmJLbnBQOHJ2dkU5TmQ4bkE1cGJ4WFhQRWlxalJ4?=
 =?utf-8?B?YlhBbDhLVmRXM3V0eEhoYUVPb1IrdjJZNjNtcUpYOG5yU2JjZnNNUXJwejVC?=
 =?utf-8?B?NEhtNGxSTHgvcTlxakJVdnE4b202OWtQSDc3anhld0ZDUkpRd2F6RC9hRUFm?=
 =?utf-8?B?dXFXdi9iSkFzRUNXbWRLVXg2YnBEZkRPU0RnMVF1cUE2ME5FUmN5aTY0L3o3?=
 =?utf-8?Q?mGL5JkISwnmRmpc78F8cyikI/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28671abc-5bb7-4e1e-54ed-08dbf1abd7d7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 13:54:16.9777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lB5eSFB8pPDzNeDFWoXaqbh6hEMlM/2EMih1SdobusybN2oDxwTocqFqfa2c4CXc8k3v0HBao5g6+Q6GrmHapA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6017
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] RFC drm/xe: Add mem_access_get in
 gem_create_ioctl
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

Hi Matthew

Thanks for the review. Sorry for the late response

On 10/10/2023 2:41 PM, Matthew Auld wrote:
> Hi,
> 
> On 09/10/2023 07:22, Riana Tauro wrote:
>> gem_create_ioctl does not have a mem_access_get till it reaches
>> xe_bo_move.
>>
>> When the device is runtime suspended (in D3cold), new bo created
>> as part of gem_create_ioctl steals the buddy block of the kernel objects
>> that are yet to be restored as part of runtime resume (D3cold). The 
>> runtime
>> resume triggers only in xe_bo_move. While trying to restore the kernel
>> objects it finds the buddy block is not free.
>> Tries to evict the new bo which is already locked causing a deadlock
>>
>> Prevent deadlock by taking mem_access get early in the ioctl
>>
>>     INFO: task kworker/1:1:44 blocked for more than 61 seconds.
>>     "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this 
>> message.
>>     task:kworker/1:1     state:D stack:25272 pid:44 ppid:2  
>> flags:0x00004000
>>     [  +0.008395] Workqueue: pm pm_runtime_work
>>     [  +0.004068] Call Trace:
>>     [  +0.002486]  <TASK>
>>     [  +0.002161]  __schedule+0x6f5/0x1640
>>     [  +0.003702]  ? __pfx___schedule+0x10/0x10
>>     [  +0.004133]  ? __ww_mutex_lock.constprop.0+0xf4f/0x1e60
>>     [  +0.005330]  schedule+0x92/0x120
>>     ....
>>     [  +0.003922]  ttm_bo_mem_space+0x46d/0x490 [ttm]
>>     [  +0.004586]  xe_bo_restore_pinned+0x200/0x320 [xe]
>>     [  +0.005007]  ? __pfx_xe_bo_restore_pinned+0x10/0x10 [xe]
>>     [  +0.005503]  ? __pfx__printk+0x10/0x10
>>     [  +0.003791]  ? __pfx_do_raw_spin_lock+0x10/0x10
>>     [  +0.004597]  xe_bo_restore_kernel+0x2e4/0x470 [xe]
>>     [  +0.005521]  xe_pm_runtime_resume+0x20a/0x750 [xe]
>>     ....
>>     INFO: task xe_mmap:1836 blocked for more than 61 seconds.
>>     "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this 
>> message.
>>     task:xe_mmap   state:D stack:23600 pid:1836  ppid:1831 
>> flags:0x00004002
>>     [  +0.008395] Call Trace:
>>     [  +0.002486]  <TASK>
>>     [  +0.003271]  rpm_resume+0x341/0xad0
>>     [  +0.005269]  __pm_runtime_resume+0x53/0xc0
>>     [  +0.004152]  xe_device_mem_access_get+0x2b/0x60 [xe]
>>     [  +0.005172]  xe_bo_move+0x2ef/0x9f0 [xe]
>>     [  +0.004131]  ttm_bo_handle_move_mem+0x15a/0x230 [ttm]
>>
>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/256
> 
> I think we should mention that the overall idea was to first attempt to 
> move all xe_device_mem_access_get() further up in the hierarchy (like 
> ioctl level) to ensure that dma-resv lock is never held (potentially 
> other locks also) when trying to wake up the device with d3cold enabled. 
> Any async work pushed out from the ioctl should rather use 
> xe_device_mem_access_get_if_ongoing() and attach to the work item, like 
> in xe_bo_move(). Currently xe_device_mem_access_get() is called much too 
> deep in the call chain in various places which is going to inherit loads 
> of scary locking dependencies making d3cold very tricky to implement.
> 
> The secondary issue is that kernel BOs need to be restored to the same 
> place in VRAM, and with d3cold that means that any VRAM allocation can 
> potentially steal the spot from kernel BOs which then blows up when 
> waking the device up. However if we end up moving 
> xe_device_mem_access_get() much higher up in the hierarchy then it might 
> that this is no longer possible.

Will add this to the commit message
> 
>>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c | 22 +++++++++++++++++-----
>>   1 file changed, 17 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 61789c0e88fb..e453a5264c82 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -630,6 +630,7 @@ static int xe_bo_move(struct ttm_buffer_object 
>> *ttm_bo, bool evict,
>>       bool tt_has_data;
>>       bool needs_clear;
>>       int ret = 0;
>> +    bool device_awake;
>>       /* Bo creation path, moving to system or TT. No clearing 
>> required. */
>>       if (!old_mem && ttm) {
>> @@ -712,7 +713,8 @@ static int xe_bo_move(struct ttm_buffer_object 
>> *ttm_bo, bool evict,
>>       xe_tile_assert(tile, tile->migrate);
>>       trace_xe_bo_move(bo);
>> -    xe_device_mem_access_get(xe);
>> +
>> +    device_awake = xe_device_mem_access_get_if_ongoing(xe);
> 
> Should this return an error if the device is not awake, and maybe also 
> throw a warning?
Will fix this
> 
> I think there are likely still other callers that might not have woken 
> up the device. What about bo_dumb_create?  Also I guess make sure we 
> also test with display disabled, since that more often triggers rpm in 
> normal runs.
bo_dumb_create is for fb. So with display , device won't get runtime 
suspended.

For other calls I tested out the BAT locally with/without display. 
Didn't see any other failures. CI didn't run on this rev. Will send out 
a new rev and get test results for all igt tests.

> 
> Do we need some kind of assert in the vram allocate path? Pretty much 
> every place calling bo_create() needs the device to be awake, and not 
> all them will reach this point. See move_null() above.

I replaced xe_device_mem_access_get with ongoing at the same location.
If there was a failure, should've been there before the call was 
replaced. But with d3cold will check again.

Thanks
Riana
> 
>>       if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
>>           /*
>> @@ -735,7 +737,8 @@ static int xe_bo_move(struct ttm_buffer_object 
>> *ttm_bo, bool evict,
>>                   if (XE_WARN_ON(new_mem->start == 
>> XE_BO_INVALID_OFFSET)) {
>>                       ret = -EINVAL;
>> -                    xe_device_mem_access_put(xe);
>> +                    if (device_awake)
>> +                        xe_device_mem_access_put(xe);
>>                       goto out;
>>                   }
>> @@ -753,7 +756,8 @@ static int xe_bo_move(struct ttm_buffer_object 
>> *ttm_bo, bool evict,
>>                           bo, bo, old_mem, new_mem);
>>           if (IS_ERR(fence)) {
>>               ret = PTR_ERR(fence);
>> -            xe_device_mem_access_put(xe);
>> +            if (device_awake)
>> +                xe_device_mem_access_put(xe);
>>               goto out;
>>           }
>>           if (!move_lacks_source) {
>> @@ -778,10 +782,12 @@ static int xe_bo_move(struct ttm_buffer_object 
>> *ttm_bo, bool evict,
>>           dma_fence_put(fence);
>>       }
>> -    xe_device_mem_access_put(xe);
>> +    if (device_awake)
>> +        xe_device_mem_access_put(xe);
>>       trace_printk("new_mem->mem_type=%d\n", new_mem->mem_type);
>>   out:
>> +
>>       return ret;
>>   }
>> @@ -1810,13 +1816,17 @@ int xe_gem_create_ioctl(struct drm_device 
>> *dev, void *data,
>>           bo_flags |= XE_BO_NEEDS_CPU_ACCESS;
>>       }
>> +    xe_device_mem_access_get(xe);
>>       if (args->vm_id) {
>>           vm = xe_vm_lookup(xef, args->vm_id);
>> -        if (XE_IOCTL_DBG(xe, !vm))
>> +        if (XE_IOCTL_DBG(xe, !vm)) {
>> +            xe_device_mem_access_put(xe);
>>               return -ENOENT;
>> +        }
>>           err = xe_vm_lock(vm, true);
>>           if (err) {
>>               xe_vm_put(vm);
>> +            xe_device_mem_access_put(xe);
>>               return err;
>>           }
>>       }
>> @@ -1845,6 +1855,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, 
>> void *data,
>>           xe_vm_unlock(vm);
>>           xe_vm_put(vm);
>>       }
>> +
>> +    xe_device_mem_access_put(xe);
>>       return err;
>>   }
