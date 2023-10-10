Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BB8CD68ED
	for <intel-xe@archiver.kernel.org>; Tue, 10 Oct 2023 05:17:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F63A10E15A;
	Tue, 10 Oct 2023 05:17:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823BA10E15A
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Oct 2023 05:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696915072; x=1728451072;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=HkTYTPPcgkCXnoFG4Pan8G37/gSqOJEUPVIdPQkXNrw=;
 b=PkB0YJfpHQ84qtqiZ0h5dBYm9uglPKtRrlx2r1fPVLGCXvEQjNHp1YhW
 /vSr/YTEz35x1VeS5YTYGm8BO1CCkHTt8SeP+AxT1KBKSrpfxfnjCbEYF
 5MDzYfexcO5TBB98vAHdFBR9texE1D0hAfv/Blk7vwOA/PJ51D/DWxqH0
 ckhahGWYnFF+sJf0ZYxrKwAxK8aWBvBoXuwMzzv7Poyn7gY9PdV5ev6Hd
 cjuylYeXPCf6bRP8xTRgjVxZcTsl4YEzzSAqJM4WRBw95iJc9ZzEafZK3
 rSKxsnDFrt2D8sOE+Z9uMJ7+rf1+TtXvPvUMO5KrdUyoHasn3+2nDnQTB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="387149302"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; d="scan'208";a="387149302"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 22:17:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="788438583"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; d="scan'208";a="788438583"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2023 22:17:48 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 22:17:48 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 22:17:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 9 Oct 2023 22:17:47 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 9 Oct 2023 22:17:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7vCkv4Sl9+Qi/o9UKyI9xzLRU26sbpyx7xZBS7myn3Em5NYmWGK6mZe6eRdNxEU5DeDqjfJg2j9FfOVCLZQAEHFMF3SPNJYZsMBigeykNdQNwK0Pt6dvJ5f/QV/+0PAcCc/eYFVC46wm/jKy3OxS3lpRuHaBy35xja7lXUOU+6eTCdhp5W8TVUNCa5qTbMks/tMB/04SVLpLz2by+xgPRfJl5usl6uwD7UQF30LOeF44IDVsz1LFQBPSsqy/bLhd5tiN82LjTvViPl5XiS1zAR+dd6WmX0tp2MnMym0aDhKCGmKAc9Hj7FTbo+k4aXq12dDt1I/7DUy5CXhncDMmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d2L/7G2PellL2J1ue5d5BKqc79u7gyBuEZTL00DzSKg=;
 b=CCL+pvipghj59QbazLbiLdUO2x9eF0p3DWi9XoZUAMJTu5xvo2XpreIYOeo/6btUxCvMrO9iKhStWqyRZVrho1RfpMR1VUu/p1j35cAZwBo8B40wQcpmPIjJe4BOuDiYVJ4S/22joNUsOMVzLJDA9o0RkqnZywec5EkfGL4v5XTIthLcEJvx7X2EL+Kg88IwIhK7yvsIts12ygT3vZ4Y8UV1natkMDoXzrpXKKPpd/2DcFjII7toLVFWeBfFiCYyi9GfFbIs2gEGC2Q3xO9IjbQ9HO/4JgxrYwvVfLt36uElZoBw/FmAQFDEotuCXtNqatrmYhkhh2RcaX9mTsP+Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SN7PR11MB7993.namprd11.prod.outlook.com (2603:10b6:806:2e5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 05:17:45 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::c555:e954:7fef:f646]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::c555:e954:7fef:f646%7]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 05:17:45 +0000
Message-ID: <ed0e85f6-5149-1c91-5af8-bb40ee7826de@intel.com>
Date: Tue, 10 Oct 2023 10:47:36 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231009062209.4009360-1-riana.tauro@intel.com>
 <7c044a59-be46-4945-961e-1fb42dc28d6a@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <7c044a59-be46-4945-961e-1fb42dc28d6a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0010.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::11) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SN7PR11MB7993:EE_
X-MS-Office365-Filtering-Correlation-Id: 41896241-fa78-48cb-b900-08dbc9503c99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K1XYDkQKFRh+CJcTFjmYexm+6/F1TMu/7xc1FbW+srf55NIDsFcCuvCAscuKiMuRfYQvaQxYZwguMrYjcJYfn9DCdY/IhJ5uL1Z7Ja6iNMsU0pUu5NHV+t8QzecSF8YVf+7bVAbiymhSpFR+xTIEm31ijDYrarpMzD2TKliKJfOWxG+E0R2YCSHpNOC285PlOT80IHnthleDgdCPSAXMH4s8V299c9TpVVYi0VQCCdBwVPSexiNLiyibORlhFZcbsZKMCRlkUaD1KsP+3JKG7BgBwBuVY4l5HI+zoXW1gLTqOhMSAQQC1cgLOHzr8jP1tbwQU2MU4qvxyWgIb7otTXrmZECSAdzxZdf2y/8HFZZJarzD21Em55XxWEcrL5Q2fnFcWpQb3CqW7VWi7U8fLqujPN9VYmf459b2b05BbmQ4WqkRxdrDnsmuCdJatDub2lEz3PVO7nBlltxCK3fCGFdBeNf4wbEKNmFJZkm0JD5OzSr2TKusdTukfQ64Jd0pxJgzwCWjNzQAI+DbsZjaXaHx3li7bBDHZaI0cKHzDXha4Z8WKyK05H1BZS/io3iW8sP2mNmRkJA28++T0sPb1ktlg2bHuU/1o5pC48153TZ3JD/1KzYkMQZvmPXX9rdc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(346002)(376002)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(2616005)(83380400001)(5660300002)(26005)(66556008)(66476007)(66946007)(8676002)(6666004)(53546011)(6512007)(41300700001)(2906002)(478600001)(6486002)(316002)(6506007)(8936002)(36756003)(82960400001)(86362001)(31696002)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUlDSk1hRkdFbzFBc0R5WGdiNjFXMG14Y3ZvL3B2cmZ6Y0hxMnp5Q3IxMlVz?=
 =?utf-8?B?eExjQXg3WDIxQVRlY2tqMkNBSE0rN3dScnRuOEt5UTJZZUx1dUJ4dUdDdG9i?=
 =?utf-8?B?c2Vld041UlJPL0VxQ2NvV2R5bjNWc1A2VUYzTkd5WXppWHV3YkxEb25GTFRw?=
 =?utf-8?B?VTBGZGVCL3dmeHJySVVYWnhCUEU3Mm1sV0N6c0hJOWh1bTFTREY0allLMmpi?=
 =?utf-8?B?UzJIa0tHSlVmUHpubWRkNlFKMTQ0cGN0MFYwcTYvQzRtenAzT0xrNW1ncmZC?=
 =?utf-8?B?N0ZQbkdudFJKenE3NUx5cHlqaDdER0ZkSkthQ05UZXNuTTRaZFd1ZkQ1N3RM?=
 =?utf-8?B?ek9DQ3BNR2JZcmRSaFdCelNmTWJBWTBFTXJQUkV5Y3llcEtFcnB2N00ydVhZ?=
 =?utf-8?B?bjdHVWxHaTBuVWtVU0p5aTBJQ1pETW5hYTFhZk5ZNUZxK0s4MkRxRjlFVmg4?=
 =?utf-8?B?dUg3UWhiTCs4Sk9RVGxaOGxhNHA3UU5LRWo0Mzc0TWJtd3VwSjk5OGw2MmNN?=
 =?utf-8?B?QnFpajVYKzFWeWRMaUE2UjZYU2dGY1R6alVLa1JKZlY3b2xsUFEvM2pCNEZX?=
 =?utf-8?B?bk9tTWw4dHM0cUdhcUdpdUt1SE9zNjF1VS8wcGJWdi8xQll6UU8rTU9YaFl4?=
 =?utf-8?B?UjFlYVZzTkNrSytTa3c2R0dwS21uaHY5aWxKbmRnbWRLT25La3BGRS9Ca2Ez?=
 =?utf-8?B?bzdLZ1lXRWw1V2o2YStNQjN0RFY3TmVjVEtLR1FaeTFId01IcXZKSkpZR0Y5?=
 =?utf-8?B?elBYNVFITlE0VEQ0TDl4c3ZmOThFNElxWG1FdDR6MCt1bFlyejkzZlp5U3Zy?=
 =?utf-8?B?UkRtdXlvUDRVSUJSWm1HSGtQWFJVQ0MraXMvUit1QmY3UUxBNzhHNVoyT2JO?=
 =?utf-8?B?NHFPZERTT20yeGk5eWYxZjhZOUE5VWxaQ0QvQW9hL09GNzcraFk5SGxxbkhE?=
 =?utf-8?B?ZlR1YlozNEl3RnpoaWNkWEZDTFQ3SEkycXIzbFFTVXYvVmsySXR5WHRnaTFy?=
 =?utf-8?B?NHVPM3JHU2NYcnYzajIwWnFIc0NIMDU0Q3JKVkNsUDI2b2lxdC9YRDkvcGFl?=
 =?utf-8?B?aTQ5YjdzL3hrYkxNQTk2MVIyNEJFSEVUL0FKNk5YVDZYQzZBVkZCZGJVenN6?=
 =?utf-8?B?c3BudFY0OGVtcmlYd2FDK0tacldSdVJJbGl3cEhjdjFlOWhYbDcwd0dFV1Nz?=
 =?utf-8?B?RHp1RkJQTTA1RGpNZEMyRzVtRlI0c2VQbWFWU2czakRZQ3E1ekl2azdNVkt2?=
 =?utf-8?B?TUp5dUNXb1hNVkRYM3lzVWJxYnI2Zk9YUzMrZkJjaHUzWUwzT0E3bkxHbmRQ?=
 =?utf-8?B?Z2NacThWQWlkYWl0OWF1WjhiUmxMdXU0WWYwelZBNmFWZ1BZYnFxeDhyQnJs?=
 =?utf-8?B?REJrVFF1UGdRK3YvdTU2K1YxSll2Ly8vczRNU3Y5MStnNExobGFLSm1vQzhn?=
 =?utf-8?B?dVhTeS9CSnNDUFZvZnR5T2Y1cG96Z3pvNHE2cTVmelRnK0FqMklzMVpOOUZZ?=
 =?utf-8?B?a2ZCT0kwakVqbnd0UkE5MG13MHVXbDZPNERKOUo4NmVFdWdJV3RZNmgvR20z?=
 =?utf-8?B?N3VBalZsbHhCd2JHVUJaMGxQQUxXQWp0Z1ZiQUN2cHNJcTV2SVpsZ3ovcVBq?=
 =?utf-8?B?dlV1R1dkYS9lSU91bDFhbGRGMy91dk1lRTZucmUyTDVuV2tDODlseW1MMXJm?=
 =?utf-8?B?WmhUUFM5NWpaRzBWN3l2TTVMeTZLL0JxL0QxZGk1MVRGaGpWOFdVWUk5NUwx?=
 =?utf-8?B?aHZtam9uSlJHZkJSQTdFdW5XZStGaUVHQVlFNjlKSmgwc0N2YXdOL3VRYjRw?=
 =?utf-8?B?SzNMR3ZjUkFnbTZwRWczTTZPZHhTVGRka1ZPcEp3eCt3U01aMkpVV0tBS2ow?=
 =?utf-8?B?Wm54RjJrTkl0WlY5ZXFvc1N6SGlZbEYwdDFodys2UW9Wb1JTWERwVjhOZFpS?=
 =?utf-8?B?NW9odUREeUtvTW92di9IdnhFbHVjSDlkQXFGQjBneWl2ME5kbUlFbE05V2FT?=
 =?utf-8?B?clZwQzgzS2J2S284MmJmcXlPOEIwd2RhRU45NVFMcXNNbVFKUEFjdmFFYTIz?=
 =?utf-8?B?dlRDUXNxWG9SRk1Gd2RSUW5UVjVyaXBLeTFVVyt3OW9xWVlUcXZ1dVpkUWFK?=
 =?utf-8?B?RllDZFpCSnZzTUx2a3VQNWRIekNQVk5vczZjWUdJcEUxSFJiTlNzVVNtakty?=
 =?utf-8?B?bFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41896241-fa78-48cb-b900-08dbc9503c99
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 05:17:45.7234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iw9J36CvAa2p5NrStdoNMMSL17Xf0uHOe5SJFbHhPKy7qw5nXdFynu+GTu5afo+Ovoe0ifZBMtI0W6AhsKpDOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7993
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



On 09-10-2023 14:08, Ghimiray, Himal Prasad wrote:
> Hi Riana,
> 
> 
> On 09-10-2023 11:52, Riana Tauro wrote:
>> gem_create_ioctl does not have a mem_access_get till it reaches
>> xe_bo_move.
>>
>> When the device is runtime suspended (in D3cold), new bo created
>> as part of gem_create_ioctl steals the buddy block of the kernel objects
>> that are yet to be restored as part of runtime resume (D3cold). The runtime
>> resume triggers only in xe_bo_move. While trying to restore the kernel
>> objects it finds the buddy block is not free.
>> Tries to evict the new bo which is already locked causing a deadlock
>>
>> Prevent deadlock by taking mem_access get early in the ioctl
>>
>> 	INFO: task kworker/1:1:44 blocked for more than 61 seconds.
>> 	"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>> 	task:kworker/1:1     state:D stack:25272 pid:44 ppid:2  flags:0x00004000
>> 	[  +0.008395] Workqueue: pm pm_runtime_work
>> 	[  +0.004068] Call Trace:
>> 	[  +0.002486]  <TASK>
>> 	[  +0.002161]  __schedule+0x6f5/0x1640
>> 	[  +0.003702]  ? __pfx___schedule+0x10/0x10
>> 	[  +0.004133]  ? __ww_mutex_lock.constprop.0+0xf4f/0x1e60
>> 	[  +0.005330]  schedule+0x92/0x120
>> 	....
>> 	[  +0.003922]  ttm_bo_mem_space+0x46d/0x490 [ttm]
>> 	[  +0.004586]  xe_bo_restore_pinned+0x200/0x320 [xe]
>> 	[  +0.005007]  ? __pfx_xe_bo_restore_pinned+0x10/0x10 [xe]
>> 	[  +0.005503]  ? __pfx__printk+0x10/0x10
>> 	[  +0.003791]  ? __pfx_do_raw_spin_lock+0x10/0x10
>> 	[  +0.004597]  xe_bo_restore_kernel+0x2e4/0x470 [xe]
>> 	[  +0.005521]  xe_pm_runtime_resume+0x20a/0x750 [xe]
>> 	....
>> 	INFO: task xe_mmap:1836 blocked for more than 61 seconds.
>> 	"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>> 	task:xe_mmap   state:D stack:23600 pid:1836  ppid:1831 flags:0x00004002
>> 	[  +0.008395] Call Trace:
>> 	[  +0.002486]  <TASK>
>> 	[  +0.003271]  rpm_resume+0x341/0xad0
>> 	[  +0.005269]  __pm_runtime_resume+0x53/0xc0
>> 	[  +0.004152]  xe_device_mem_access_get+0x2b/0x60 [xe]
>> 	[  +0.005172]  xe_bo_move+0x2ef/0x9f0 [xe]
>> 	[  +0.004131]  ttm_bo_handle_move_mem+0x15a/0x230 [ttm]
>>
>> Link:https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/256
>>
>> Cc: Matthew Auld<matthew.auld@intel.com>
>> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c | 22 +++++++++++++++++-----
>>   1 file changed, 17 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 61789c0e88fb..e453a5264c82 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.cxe_device_mem_access_get 
>> @@ -630,6 +630,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>   	bool tt_has_data;
>>   	bool needs_clear;
>>   	int ret = 0;
>> +	bool device_awake;
>>   
>>   	/* Bo creation path, moving to system or TT. No clearing required. */
>>   	if (!old_mem && ttm) {
>> @@ -712,7 +713,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>   	xe_tile_assert(tile, tile->migrate);
>>   
>>   	trace_xe_bo_move(bo);
>> -	xe_device_mem_access_get(xe);
>> +
>> +	device_awake = xe_device_mem_access_get_if_ongoing(xe);
> 
> IIRC xe_bo_move is called in eviction path too. Won't it be safe to use 
> xe_device_mem_access_get here too ?

Agreed, xe_bo_move is being called from ttm_bo_handle_move_mem which is 
again called from multiple places. To cover those places its better to 
keep xe_device_mem_access_get.

Regards,
Badal
> 
> BR
> 
> Himal
> 
>>   
>>   	if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
>>   		/*
>> @@ -735,7 +737,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>   
>>   				if (XE_WARN_ON(new_mem->start == XE_BO_INVALID_OFFSET)) {
>>   					ret = -EINVAL;
>> -					xe_device_mem_access_put(xe);
>> +					if (device_awake)
>> +						xe_device_mem_access_put(xe);
>>   					goto out;
>>   				}
>>   
>> @@ -753,7 +756,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>   						bo, bo, old_mem, new_mem);
>>   		if (IS_ERR(fence)) {
>>   			ret = PTR_ERR(fence);
>> -			xe_device_mem_access_put(xe);
>> +			if (device_awake)
>> +				xe_device_mem_access_put(xe);
>>   			goto out;
>>   		}
>>   		if (!move_lacks_source) {
>> @@ -778,10 +782,12 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>   		dma_fence_put(fence);
>>   	}
>>   
>> -	xe_device_mem_access_put(xe);
>> +	if (device_awake)
>> +		xe_device_mem_access_put(xe);
>>   	trace_printk("new_mem->mem_type=%d\n", new_mem->mem_type);
>>   
>>   out:
>> +
>>   	return ret;
>>   
>>   }
>> @@ -1810,13 +1816,17 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>>   		bo_flags |= XE_BO_NEEDS_CPU_ACCESS;
>>   	}
>>   
>> +	xe_device_mem_access_get(xe);
>>   	if (args->vm_id) {
>>   		vm = xe_vm_lookup(xef, args->vm_id);
>> -		if (XE_IOCTL_DBG(xe, !vm))
>> +		if (XE_IOCTL_DBG(xe, !vm)) {
>> +			xe_device_mem_access_put(xe);
>>   			return -ENOENT;
>> +		}
>>   		err = xe_vm_lock(vm, true);
>>   		if (err) {
>>   			xe_vm_put(vm);
>> +			xe_device_mem_access_put(xe);
>>   			return err;
>>   		}
>>   	}
>> @@ -1845,6 +1855,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>>   		xe_vm_unlock(vm);
>>   		xe_vm_put(vm);
>>   	}
>> +
>> +	xe_device_mem_access_put(xe);
>>   	return err;
>>   }
>>   
