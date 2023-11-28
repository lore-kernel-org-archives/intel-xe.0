Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997F0C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 09:30:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 669AE10E469;
	Tue, 28 Nov 2023 09:30:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4880B10E469
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 09:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701163854; x=1732699854;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=PNowf5GJeaXTr8UEa6XFd4unkwhtZRcRdWNIGPwvV2I=;
 b=e+D6HZ2GqnxBuWvViy/W45SltKgQQokLhcL4ER63OS8gcDekgQnEqOQL
 jKffJhSVxkmHj5sbqzK1UKclrbwcW5ZDK3LeaqX8J7SERarnDxyghrra8
 74ajHCgkANrf5Juc7aL0S4u1OaKJ8Ix2VyizrRqC2KSrHDqZ1j53ZnclX
 n26lJIJmwVonz5L2/QRITEExWaOaHgYoGG7QmY2Kq9hW4L7ZTzdzcOJ9y
 GMUzPe47MEw+SJxZ+ng0veDqe1NIlV2TKV7AhlQoNHzK6gUBjyxOoDJaz
 RmGsmLIIOU0bU5wfwf0STcih4mye2UTW/ONXiBhdXg6pFtGA8Nu9X4kmG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="390042652"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
 d="scan'208,217";a="390042652"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 01:30:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="941859741"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
 d="scan'208,217";a="941859741"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 01:30:52 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 01:30:52 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 01:30:52 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 01:30:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LnSqvTi5/vMw9igu3VBVbXstUO8bfZIzEgkMUEZ6Tvdy9fpAR/V8mjF9KQSv8UNig4k+wrdtzc9xdoafDRFuHAfRH46blHfcZrKhC/z2aZc33zzrye4a0ZkBBcwNtVANi5a/VfCYfRS12ytUg9Unek1RViIPvpjvMlMmYLKZgT05qtuBOlOwJhf/sEGChHHk0T9gkg1dJ+FXrPca2D0u33axJHi2E5HVpgi7x7dsq+ELMyuGOJzP5vs3z0cNqHf95Bo8qDeQBwLN8mk4aQ/3Qrq8cG+48ZiCc6cOx/jpO2rsKUvKC8a3MySnf0JwTNqXMuI8ajnQZLYkpAMc0fTwNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvzTuHRUhegGUp3MmDB/cBRP1MRVw84VqTP0VIacTlo=;
 b=NIbKazfshS5zfPmMb0G2/af32eRuJ6pt7ZI5uoPoeBkiICX7KfHYup+hoEUJkFRM6ZdfRXvPE1/2vjQuSfQWME1rmiULsYfIUdr2GxDxYLyWVegIDdZIGXeGbiOdm0BK3xnhX99VdHvzQM64i8U18wXdfpwOPwT3J7BogseLCOa09DPYZxaOKR4vELM2JG4Zk70TBtXUqND9JfQUDjt5I0paIoXMuMTyEg6wtbem6F2BDRUD5BmeuvktwEaaZga8f67bBYvppfnOgTiBubdw8fE9OdQsfZ8s0nhvy5/5AlRFWz0ANAFwDg9kkNj5TEX6MSKQIrR0dIDF3dIn1zFYUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5293.namprd11.prod.outlook.com (2603:10b6:5:390::20)
 by SA1PR11MB5802.namprd11.prod.outlook.com (2603:10b6:806:235::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 09:30:49 +0000
Received: from DM4PR11MB5293.namprd11.prod.outlook.com
 ([fe80::e480:1717:8a53:1406]) by DM4PR11MB5293.namprd11.prod.outlook.com
 ([fe80::e480:1717:8a53:1406%6]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 09:30:49 +0000
Content-Type: multipart/alternative;
 boundary="------------XLDNTLe0oNLCIkM3nehhwaZy"
Message-ID: <acfe2062-ab3d-44e0-b16a-97f116dfcd5c@intel.com>
Date: Tue, 28 Nov 2023 15:00:41 +0530
User-Agent: Mozilla Thunderbird Beta
To: "Zeng, Oak" <oak.zeng@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20231122042142.6648-1-krishnaiah.bommu@intel.com>
 <SA1PR11MB699147D9656046AFAD1D303192B8A@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>
In-Reply-To: <SA1PR11MB699147D9656046AFAD1D303192B8A@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: BM1P287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::13) To DM4PR11MB5293.namprd11.prod.outlook.com
 (2603:10b6:5:390::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5293:EE_|SA1PR11MB5802:EE_
X-MS-Office365-Filtering-Correlation-Id: b2fe9a2c-7224-4cb2-fad5-08dbeff4b4ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bEINhsfD+Az7MjJpHzNY08qoR3Pc5LdfYSLc0k+aHcYSBuwfjDqQQwHwjZS4173YHN3js9M6O2krStMbGFMIBB8hzeO3ihJJ/D5whRIdKxxlTGpUuvXLvCILtgX1K5eaOb0KBYQOj6xVgrUmphsnf7ppHRnYVcsPNTsaDW0K3P2vKCnU4z2rRUhXOVlXT6SL3CAO4XbBSapg17soF4yi01/cdSqwYhOCAfipxBudxdyj5eFdObyl5CDIFEcXPwPigFOSe1IyP+ovDZb/poa5zeBBplcPWws3zU5kdy4fXXkXSZINLpbk4egZtURgg5xIs2mESHI17Cljb/cIijgjAFLSOf0YzKzaeQEEeOoU9e1a1aAg9uEdmXM/0zn90ZOIEtrz6ARKLtt4YtGMgvm6t24COcS2P1bnJ8xomdLWXhkysvXuwP1MPLSAkc4EkUUVivhd+fx1RqEeiGG4GLc1sIqYWNLMeN2hCzSIc23Jz4ckBcn/wOpycnQ8TpFRQJnlVNWQ4ia2SaR6Ed8AyLm26UHe5xPE5DgWFPnY2g4Mg490JgI1VirMTQfA1Myx6AhuTyp32S6J5RCxjtY2l76lBBoQXbqKIIrDPRRRiZGIscegSCDy+nzb/psxNxQMYAqEAvN6GDxSiaapR43n8B3dqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5293.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(136003)(346002)(396003)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(41300700001)(31686004)(4326008)(30864003)(2906002)(8936002)(8676002)(53546011)(6506007)(6666004)(2616005)(86362001)(33964004)(31696002)(6512007)(316002)(66476007)(66556008)(66946007)(54906003)(5660300002)(478600001)(6486002)(26005)(36756003)(110136005)(83380400001)(38100700002)(107886003)(82960400001)(45980500001)(43740500002)(559001)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjh2ays5OGxKVXdBckZTb3VqdG9tU3hLU3F3WjczRHQwTVB3UWIzZHl6NXNh?=
 =?utf-8?B?dTc3eVdNempGN0xzaEU5dnFTMVZlbHl1NTNRbnU4ZUtORW9adm5uS2hCb0ps?=
 =?utf-8?B?eTNmcTVTbUg0MUdkMi9FVVNibTlIZjFDVkQ4cDBMUHg2RFc5ZWNWdGo4V1B0?=
 =?utf-8?B?K0Fyd1Y3VmU2am5tOTZtT2diVGcwZnJTL2hod0FleTdMYVRGRytDMXE1QXhn?=
 =?utf-8?B?d3RYejJ2OE80YTFhS3hYVDlOY2h6Mk0rb0RLbUFFYXB5ZmNEMmh4YkZEZVIx?=
 =?utf-8?B?a2dldzNGTE16WWhldEVrM3M1d3RROE12cFlkcmtxVXdFOWRuN2paK1dTUk0w?=
 =?utf-8?B?aktrdnROZW4vWFBxTzRXdjNBQ2RwN05jbEpLV3VYSml3Z2NlbDZXYTB6QzU3?=
 =?utf-8?B?VGxQN1grT3VwZEtOU0RUN1NCeXQ4ZG1pQXJ6emtYRVVUODNyQk5YaXVYbmJT?=
 =?utf-8?B?U05DSGZQVW40dWI0cXZKS3pUd0NmYUg4c0UwQUV4SFh0aU1BcGVrYkJUTm5U?=
 =?utf-8?B?aWR6TjBqRlVHOUZmVEZub3JaNWdhaS8zc1hOUWo0T08zdHhyU0s2VjVESTNL?=
 =?utf-8?B?V054ZFVmT2svS1JWdmk4ZHVZVGduaDRuZ1QrUVhFdXgwVmZoUnAvR1IyQ1Vm?=
 =?utf-8?B?T3Q0NENuTSsrUS9MU09lTTZmTHY3NkFVQzRyd0FwdGkzcldNWnZJZ1J6Z0ZI?=
 =?utf-8?B?VTlLOVZkTjVncW9wWEdzQzdkV3pRaTcxWGp0L2svaXhTZ2JkY2REK1NpdHlB?=
 =?utf-8?B?Umx6ZjZNejhteG5iQjN2ejJMMUV6bEw1NENHNEhkZm1TcndTYWsxQnNwajFo?=
 =?utf-8?B?R2JaVEZ4S05GL3RXYnFuUE5xQVNSbGVPdUN5S0lkZkFxMmpWb2d1MWl5eTNv?=
 =?utf-8?B?dElVVlpkTk5SVkJPZ3F6OUd5SHJoZ2ZSOWxrLzNHUDJBSVYxWThGK1MxQ0xE?=
 =?utf-8?B?T3pKb2NicGZvS25RVHh1bjB5SDJjVFRPK0VtbVpCc1RPM2REcEc2TlZyWS96?=
 =?utf-8?B?NVpKYm1uNzU1b3kwSlVyVGJ4aytvWDh6K282dDlCdUlCNy9lY29RZnBHb3NM?=
 =?utf-8?B?R1N0MnlaM2FOeFNNUE1CTHUwM05kV1h6MHNIL2c1eE5UWEgrZlJoNmxjRFFO?=
 =?utf-8?B?RVhsUXlIZjhlNnlvcGUzTk12RzJzYlRoTkF2eHE3REpTYVl2bU9OMlZCaGgx?=
 =?utf-8?B?RWYvaUl0OEg0Mktqdzc2TENna0FMYlpleFhYdE9RWEdwVWsrd2lzVHFIRzdN?=
 =?utf-8?B?aUlESHJNZ0l2RC9pcXhTRWYzSmZNZ2lRSCsxaERXeUxYb1JEZHhxRnZxdU5N?=
 =?utf-8?B?YlRaV1ZDN3U5MEZmKzR2c25nK3hXNWVKaUI1cFpyN0R6QVh6OVMwSHVQbWVj?=
 =?utf-8?B?b1l6ZVZyQTIzNCsrK2pOOFlWdFBVNFFkQ25hcVVMWnF6eExxaElpMzBNKzlt?=
 =?utf-8?B?M2dFbkRMelRSVkJGWVoyeUgvMnkrOUpLNTBGNEc3dEZIWGtUSkRPS242MEZB?=
 =?utf-8?B?ZXJqeHRxVFFRVWtDYjRuVk9ZNjhvSE15UzdMRTE2KytFaU5IckpHS1ZXalkw?=
 =?utf-8?B?c2N5cjlMeFNDb3M3dFZ4QzZyVUFlV200SWhKdmFBSE9xcDU3cHhIeXFGbzk5?=
 =?utf-8?B?bE1OeW1OZjMzOFVDNkNvL0lyYzJWYXA0WjVhdkZBaFNHU0d6QjVtQm5CRG1q?=
 =?utf-8?B?c2FMMlZ5TjZPZlJZNVJPRlR0Zno2dkE2Q25ocGxiVklVcCtlQTNNb3dUSkJX?=
 =?utf-8?B?Zm1uYXdQUUhvdlV2bG9QL0xmb21kV0VGZHdMSEFsUXBjc1MxZTUvbm0wU1pj?=
 =?utf-8?B?MndjYTYxZ3RPN2xldmF5QitKQ2UwOUJ6K2p0bWF2eWh2UDN5RmJWOGIrS2pv?=
 =?utf-8?B?cEVRRnVQNHpiVk5xQVRaNFp0RUVLN3hhT0VTdms2L2NGMDViUjhhK3Y0Rk9O?=
 =?utf-8?B?b2MvK0pNRVcreEIxb0JvTWFFY1EzVm11NHFoQWIyYitoZXRwbUE0S0FwbkFo?=
 =?utf-8?B?THhucVlZcFZLR05QWW9wSDkrT1E5c1ZKOTJoVGhyL0xHblNUMDhDQmhmQ01Z?=
 =?utf-8?B?cS9sdkNHd25LYXBzZkJGTjRscFNJeWlxdlE3ZHRPUU96V1hlY21aRkxBd0dF?=
 =?utf-8?B?RTlVdmthYldtUzFLclRqb1NOS2JRT2laOUZta0dqcGd4Tyszb0tZTUhYZ1ZZ?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2fe9a2c-7224-4cb2-fad5-08dbeff4b4ec
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5293.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 09:30:49.3796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5RGDeokiWFj1CSaJj8UuL1HZlzBmU7a7ITVtwBmUh+1W8gN5TtYnw5//rTSKONCDefbO3kwSZ5eEHW7DHtzhJehZ2MU/ZG5mvNwwq69LRt8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5802
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] RFC: drm/xe: Return correct error code
 for xe_wait_user_fence_ioctl
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

--------------XLDNTLe0oNLCIkM3nehhwaZy
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Thank you Oak for review, I am writing IGT of this change, I will send 
the new patch after testing with addressing your comments.


Regards,

Krishna.

On 24-11-2023 23:48, Zeng, Oak wrote:
> This version seems good to me. See two small comments inline.
>
> Oak
>
>> -----Original Message-----
>> From: Bommu, Krishnaiah<krishnaiah.bommu@intel.com>
>> Sent: Tuesday, November 21, 2023 11:22 PM
>> To:intel-xe@lists.freedesktop.org
>> Cc: Bommu, Krishnaiah<krishnaiah.bommu@intel.com>; Zeng, Oak
>> <oak.zeng@intel.com>; Kempczynski, Zbigniew
>> <zbigniew.kempczynski@intel.com>; Brost, Matthew
>> <matthew.brost@intel.com>
>> Subject: [PATCH v2] RFC: drm/xe: Return correct error code for
>> xe_wait_user_fence_ioctl
>>
>> return correct error code if exec_queue is reset/engine is hung
>> remove the num_engines/instances members from drm_xe_wait_user_fence
>> structure
>> and add a exec_queue_id member
> You also added a reset_status interface to exec_q_ops, need to mention it in description. Or if you want, I think this internal interface change can be a separate patch in this series. A small patch each only do one simple thing always help people to review.
>
>> v2: Addressed the review comments
>>
>> Need to validated the changes
>>
>> Signed-off-by: Bommu Krishnaiah<krishnaiah.bommu@intel.com>
>> Cc: Oak Zeng<oak.zeng@intel.com>
>> Cc: Kempczynski Zbigniew<Zbigniew.Kempczynski@intel.com>
>> Cc: Matthew Brost<matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 +
>>   drivers/gpu/drm/xe/xe_execlist.c         |  7 +++
>>   drivers/gpu/drm/xe/xe_guc_submit.c       | 13 +++++
>>   drivers/gpu/drm/xe/xe_wait_user_fence.c  | 60 +++++-------------------
>>   include/uapi/drm/xe_drm.h                | 13 +----
>>   5 files changed, 37 insertions(+), 58 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> index 5ba47a5cfdbd..84ccf7242247 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> @@ -206,6 +206,8 @@ struct xe_exec_queue_ops {
>>   	 * signalled when this function is called.
>>   	 */
>>   	void (*resume)(struct xe_exec_queue *q);
>> +	/** @reset_status: check exec queue reset status */
>> +	bool (*reset_status)(struct xe_exec_queue *q);
>>   };
>>
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_execlist.c
>> b/drivers/gpu/drm/xe/xe_execlist.c
>> index e8754adfc52a..3b390f047108 100644
>> --- a/drivers/gpu/drm/xe/xe_execlist.c
>> +++ b/drivers/gpu/drm/xe/xe_execlist.c
>> @@ -446,6 +446,12 @@ static void execlist_exec_queue_resume(struct
>> xe_exec_queue *q)
>>   	/* NIY */
>>   }
>>
>> +static bool execlist_exec_queue_reset_status(struct xe_exec_queue *q)
>> +{
>> +	 /* NIY */
>> +	 return false;
>> +}
>> +
>>   static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
>>   	.init = execlist_exec_queue_init,
>>   	.kill = execlist_exec_queue_kill,
>> @@ -457,6 +463,7 @@ static const struct xe_exec_queue_ops
>> execlist_exec_queue_ops = {
>>   	.suspend = execlist_exec_queue_suspend,
>>   	.suspend_wait = execlist_exec_queue_suspend_wait,
>>   	.resume = execlist_exec_queue_resume,
>> +	.reset_status = execlist_exec_queue_reset_status,
>>   };
>>
>>   int xe_execlist_init(struct xe_gt *gt)
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
>> b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 9e9e925c7353..e13792e49a67 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -852,6 +852,10 @@ static void simple_error_capture(struct xe_exec_queue
>> *q)
>>   static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
>>   {
>>   	struct xe_guc *guc = exec_queue_to_guc(q);
>> +	struct xe_device *xe = guc_to_xe(guc);
>> +
>> +	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
>> +	wake_up_all(&xe->ufence_wq);
>>
>>   	if (xe_exec_queue_is_lr(q))
>>   		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
>> @@ -1392,6 +1396,14 @@ static void guc_exec_queue_resume(struct
>> xe_exec_queue *q)
>>   	guc_exec_queue_add_msg(q, msg, RESUME);
>>   }
>>
>> +static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
>> +{
>> +	if (exec_queue_registered(q))
> Do you really need this check? If a queue is not registered yet, how can it be reset?
>
> Oak
>
>
>> +		return exec_queue_reset(q);
>> +
>> +	return false;
>> +}
>> +
>>   /*
>>    * All of these functions are an abstraction layer which other parts of XE can
>>    * use to trap into the GuC backend. All of these functions, aside from init,
>> @@ -1409,6 +1421,7 @@ static const struct xe_exec_queue_ops
>> guc_exec_queue_ops = {
>>   	.suspend = guc_exec_queue_suspend,
>>   	.suspend_wait = guc_exec_queue_suspend_wait,
>>   	.resume = guc_exec_queue_resume,
>> +	.reset_status = guc_exec_queue_reset_status,
>>   };
>>
>>   static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c
>> b/drivers/gpu/drm/xe/xe_wait_user_fence.c
>> index 4d5c2555ce41..97af879ee923 100644
>> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
>> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
>> @@ -13,6 +13,7 @@
>>   #include "xe_device.h"
>>   #include "xe_gt.h"
>>   #include "xe_macros.h"
>> +#include "xe_exec_queue.h"
>>
>>   static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
>>   {
>> @@ -58,27 +59,6 @@ static const enum xe_engine_class
>> user_to_xe_engine_class[] = {
>>   	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
>>   };
>>
>> -static int check_hw_engines(struct xe_device *xe,
>> -			    struct drm_xe_engine_class_instance *eci,
>> -			    int num_engines)
>> -{
>> -	int i;
>> -
>> -	for (i = 0; i < num_engines; ++i) {
>> -		enum xe_engine_class user_class =
>> -			user_to_xe_engine_class[eci[i].engine_class];
>> -
>> -		if (eci[i].gt_id >= xe->info.tile_count)
>> -			return -EINVAL;
>> -
>> -		if (!xe_gt_hw_engine(xe_device_get_gt(xe, eci[i].gt_id),
>> -				     user_class, eci[i].engine_instance, true))
>> -			return -EINVAL;
>> -	}
>> -
>> -	return 0;
>> -}
>> -
>>   #define VALID_FLAGS	(DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP | \
>>   			 DRM_XE_UFENCE_WAIT_FLAG_ABSTIME)
>>   #define MAX_OP		DRM_XE_UFENCE_WAIT_OP_LTE
>> @@ -130,14 +110,12 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev,
>> void *data,
>>   			     struct drm_file *file)
>>   {
>>   	struct xe_device *xe = to_xe_device(dev);
>> +	struct xe_file *xef = to_xe_file(file);
>>   	DEFINE_WAIT_FUNC(w_wait, woken_wake_function);
>>   	struct drm_xe_wait_user_fence *args = data;
>> -	struct drm_xe_engine_class_instance
>> eci[XE_HW_ENGINE_MAX_INSTANCE];
>> -	struct drm_xe_engine_class_instance __user *user_eci =
>> -		u64_to_user_ptr(args->instances);
>> +	struct xe_exec_queue *q = NULL;
>>   	u64 addr = args->addr;
>>   	int err;
>> -	bool no_engines = args->flags &
>> DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP;
>>   	long timeout;
>>   	ktime_t start;
>>
>> @@ -151,35 +129,17 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev,
>> void *data,
>>   	if (XE_IOCTL_DBG(xe, args->op > MAX_OP))
>>   		return -EINVAL;
>>
>> -	if (XE_IOCTL_DBG(xe, no_engines &&
>> -			 (args->num_engines || args->instances)))
>> -		return -EINVAL;
>> -
>> -	if (XE_IOCTL_DBG(xe, !no_engines && !args->num_engines))
>> -		return -EINVAL;
>> -
>>   	if (XE_IOCTL_DBG(xe, addr & 0x7))
>>   		return -EINVAL;
>>
>> -	if (XE_IOCTL_DBG(xe, args->num_engines >
>> XE_HW_ENGINE_MAX_INSTANCE))
>> -		return -EINVAL;
>> -
>> -	if (!no_engines) {
>> -		err = copy_from_user(eci, user_eci,
>> -				     sizeof(struct drm_xe_engine_class_instance) *
>> -			     args->num_engines);
>> -		if (XE_IOCTL_DBG(xe, err))
>> -			return -EFAULT;
>> -
>> -		if (XE_IOCTL_DBG(xe, check_hw_engines(xe, eci,
>> -						      args->num_engines)))
>> -			return -EINVAL;
>> -	}
>> -
>>   	timeout = to_jiffies_timeout(xe, args);
>>
>>   	start = ktime_get();
>>
>> +	q = xe_exec_queue_lookup(xef, args->exec_queue_id);
>> +	if (XE_IOCTL_DBG(xe, !q))
>> +		return -ENOENT;
>> +
>>   	/*
>>   	 * FIXME: Very simple implementation at the moment, single wait queue
>>   	 * for everything. Could be optimized to have a wait queue for every
>> @@ -202,6 +162,12 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev,
>> void *data,
>>   			break;
>>   		}
>>
>> +		if (q->ops->reset_status(q)) {
>> +			drm_info(&xe->drm, "exec gueue reset detected\n");
>> +			err = -EIO;
>> +			break;
>> +		}
>> +
>>   		timeout = wait_woken(&w_wait, TASK_INTERRUPTIBLE, timeout);
>>   	}
>>   	remove_wait_queue(&xe->ufence_wq, &w_wait);
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 88f3aca02b08..ae2457dc30ad 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -962,17 +962,8 @@ struct drm_xe_wait_user_fence {
>>   	 */
>>   	__s64 timeout;
>>
>> -	/**
>> -	 * @num_engines: number of engine instances to wait on, must be zero
>> -	 * when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
>> -	 */
>> -	__u64 num_engines;
>> -
>> -	/**
>> -	 * @instances: user pointer to array of drm_xe_engine_class_instance to
>> -	 * wait on, must be NULL when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP
>> set
>> -	 */
>> -	__u64 instances;
>> +	/** @exec_queue_id: exec_queue_id returned from
>> xe_exec_queue_create_ioctl */
>> +	__u32 exec_queue_id;
>>
>>   	/** @reserved: Reserved */
>>   	__u64 reserved[2];
>> --
>> 2.25.1
--------------XLDNTLe0oNLCIkM3nehhwaZy
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:AllowPNG/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:TrackMoves/>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-IN</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:EnableOpenTypeKerning/>
   <w:DontFlipMirrorIndents/>
   <w:OverrideTableStyleHps/>
  </w:Compatibility>
  <w:DoNotOptimizeForBrowser/>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="&#45;-"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"
  DefSemiHidden="false" DefQFormat="false" DefPriority="99"
  LatentStyleCount="376">
  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 9"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 1"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 2"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 3"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 4"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 5"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 6"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 7"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 8"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="header"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footer"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index heading"/>
  <w:LsdException Locked="false" Priority="35" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of figures"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope return"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="line number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="page number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of authorities"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="macro"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="toa heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 5"/>
  <w:LsdException Locked="false" Priority="10" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Closing"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Signature"/>
  <w:LsdException Locked="false" Priority="1" SemiHidden="true"
   UnhideWhenUsed="true" Name="Default Paragraph Font"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Message Header"/>
  <w:LsdException Locked="false" Priority="11" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Salutation"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Date"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Note Heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Block Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="FollowedHyperlink"/>
  <w:LsdException Locked="false" Priority="22" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" Priority="20" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Document Map"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Plain Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="E-mail Signature"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Top of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Bottom of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal (Web)"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Acronym"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Cite"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Code"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Definition"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Keyboard"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Preformatted"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Sample"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Typewriter"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Variable"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Table"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation subject"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="No List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Contemporary"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Elegant"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Professional"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Balloon Text"/>
  <w:LsdException Locked="false" Priority="39" Name="Table Grid"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Theme"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" QFormat="true"
   Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" QFormat="true"
   Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" QFormat="true"
   Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" QFormat="true"
   Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" QFormat="true"
   Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" QFormat="true"
   Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" SemiHidden="true"
   UnhideWhenUsed="true" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>
  <w:LsdException Locked="false" Priority="41" Name="Plain Table 1"/>
  <w:LsdException Locked="false" Priority="42" Name="Plain Table 2"/>
  <w:LsdException Locked="false" Priority="43" Name="Plain Table 3"/>
  <w:LsdException Locked="false" Priority="44" Name="Plain Table 4"/>
  <w:LsdException Locked="false" Priority="45" Name="Plain Table 5"/>
  <w:LsdException Locked="false" Priority="40" Name="Grid Table Light"/>
  <w:LsdException Locked="false" Priority="46" Name="Grid Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="Grid Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="Grid Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="46" Name="List Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="List Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="List Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hashtag"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Unresolved Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Link"/>
 </w:LatentStyles>
</xml><![endif]--><!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-para-margin:0cm;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-fareast-language:EN-US;}
</style>
<![endif]-->
    </p>
    <p class="MsoPlainText">Thank you Oak
      for review, I am writing IGT of this change, I will send the new
      patch after
      testing with addressing your comments.</p>
    <p class="MsoPlainText"><br>
    </p>
    <p class="MsoPlainText">Regards,</p>
    <p class="MsoPlainText">Krishna.</p>
    <div class="moz-cite-prefix">On 24-11-2023 23:48, Zeng, Oak wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:SA1PR11MB699147D9656046AFAD1D303192B8A@SA1PR11MB6991.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">This version seems good to me. See two small comments inline.

Oak 

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">-----Original Message-----
From: Bommu, Krishnaiah <a class="moz-txt-link-rfc2396E" href="mailto:krishnaiah.bommu@intel.com">&lt;krishnaiah.bommu@intel.com&gt;</a>
Sent: Tuesday, November 21, 2023 11:22 PM
To: <a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>
Cc: Bommu, Krishnaiah <a class="moz-txt-link-rfc2396E" href="mailto:krishnaiah.bommu@intel.com">&lt;krishnaiah.bommu@intel.com&gt;</a>; Zeng, Oak
<a class="moz-txt-link-rfc2396E" href="mailto:oak.zeng@intel.com">&lt;oak.zeng@intel.com&gt;</a>; Kempczynski, Zbigniew
<a class="moz-txt-link-rfc2396E" href="mailto:zbigniew.kempczynski@intel.com">&lt;zbigniew.kempczynski@intel.com&gt;</a>; Brost, Matthew
<a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Subject: [PATCH v2] RFC: drm/xe: Return correct error code for
xe_wait_user_fence_ioctl

return correct error code if exec_queue is reset/engine is hung
remove the num_engines/instances members from drm_xe_wait_user_fence
structure
and add a exec_queue_id member
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
You also added a reset_status interface to exec_q_ops, need to mention it in description. Or if you want, I think this internal interface change can be a separate patch in this series. A small patch each only do one simple thing always help people to review.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
v2: Addressed the review comments

Need to validated the changes

Signed-off-by: Bommu Krishnaiah <a class="moz-txt-link-rfc2396E" href="mailto:krishnaiah.bommu@intel.com">&lt;krishnaiah.bommu@intel.com&gt;</a>
Cc: Oak Zeng <a class="moz-txt-link-rfc2396E" href="mailto:oak.zeng@intel.com">&lt;oak.zeng@intel.com&gt;</a>
Cc: Kempczynski Zbigniew <a class="moz-txt-link-rfc2396E" href="mailto:Zbigniew.Kempczynski@intel.com">&lt;Zbigniew.Kempczynski@intel.com&gt;</a>
Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 +
 drivers/gpu/drm/xe/xe_execlist.c         |  7 +++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 13 +++++
 drivers/gpu/drm/xe/xe_wait_user_fence.c  | 60 +++++-------------------
 include/uapi/drm/xe_drm.h                | 13 +----
 5 files changed, 37 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h
b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 5ba47a5cfdbd..84ccf7242247 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -206,6 +206,8 @@ struct xe_exec_queue_ops {
 	 * signalled when this function is called.
 	 */
 	void (*resume)(struct xe_exec_queue *q);
+	/** @reset_status: check exec queue reset status */
+	bool (*reset_status)(struct xe_exec_queue *q);
 };

 #endif
diff --git a/drivers/gpu/drm/xe/xe_execlist.c
b/drivers/gpu/drm/xe/xe_execlist.c
index e8754adfc52a..3b390f047108 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -446,6 +446,12 @@ static void execlist_exec_queue_resume(struct
xe_exec_queue *q)
 	/* NIY */
 }

+static bool execlist_exec_queue_reset_status(struct xe_exec_queue *q)
+{
+	 /* NIY */
+	 return false;
+}
+
 static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
 	.init = execlist_exec_queue_init,
 	.kill = execlist_exec_queue_kill,
@@ -457,6 +463,7 @@ static const struct xe_exec_queue_ops
execlist_exec_queue_ops = {
 	.suspend = execlist_exec_queue_suspend,
 	.suspend_wait = execlist_exec_queue_suspend_wait,
 	.resume = execlist_exec_queue_resume,
+	.reset_status = execlist_exec_queue_reset_status,
 };

 int xe_execlist_init(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9e9e925c7353..e13792e49a67 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -852,6 +852,10 @@ static void simple_error_capture(struct xe_exec_queue
*q)
 static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
+	struct xe_device *xe = guc_to_xe(guc);
+
+	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
+	wake_up_all(&amp;xe-&gt;ufence_wq);

 	if (xe_exec_queue_is_lr(q))
 		queue_work(guc_to_gt(guc)-&gt;ordered_wq, &amp;q-&gt;guc-&gt;lr_tdr);
@@ -1392,6 +1396,14 @@ static void guc_exec_queue_resume(struct
xe_exec_queue *q)
 	guc_exec_queue_add_msg(q, msg, RESUME);
 }

+static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
+{
+	if (exec_queue_registered(q))
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Do you really need this check? If a queue is not registered yet, how can it be reset?

Oak


</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+		return exec_queue_reset(q);
+
+	return false;
+}
+
 /*
  * All of these functions are an abstraction layer which other parts of XE can
  * use to trap into the GuC backend. All of these functions, aside from init,
@@ -1409,6 +1421,7 @@ static const struct xe_exec_queue_ops
guc_exec_queue_ops = {
 	.suspend = guc_exec_queue_suspend,
 	.suspend_wait = guc_exec_queue_suspend_wait,
 	.resume = guc_exec_queue_resume,
+	.reset_status = guc_exec_queue_reset_status,
 };

 static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c
b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index 4d5c2555ce41..97af879ee923 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -13,6 +13,7 @@
 #include &quot;xe_device.h&quot;
 #include &quot;xe_gt.h&quot;
 #include &quot;xe_macros.h&quot;
+#include &quot;xe_exec_queue.h&quot;

 static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
 {
@@ -58,27 +59,6 @@ static const enum xe_engine_class
user_to_xe_engine_class[] = {
 	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
 };

-static int check_hw_engines(struct xe_device *xe,
-			    struct drm_xe_engine_class_instance *eci,
-			    int num_engines)
-{
-	int i;
-
-	for (i = 0; i &lt; num_engines; ++i) {
-		enum xe_engine_class user_class =
-			user_to_xe_engine_class[eci[i].engine_class];
-
-		if (eci[i].gt_id &gt;= xe-&gt;info.tile_count)
-			return -EINVAL;
-
-		if (!xe_gt_hw_engine(xe_device_get_gt(xe, eci[i].gt_id),
-				     user_class, eci[i].engine_instance, true))
-			return -EINVAL;
-	}
-
-	return 0;
-}
-
 #define VALID_FLAGS	(DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP | \
 			 DRM_XE_UFENCE_WAIT_FLAG_ABSTIME)
 #define MAX_OP		DRM_XE_UFENCE_WAIT_OP_LTE
@@ -130,14 +110,12 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev,
void *data,
 			     struct drm_file *file)
 {
 	struct xe_device *xe = to_xe_device(dev);
+	struct xe_file *xef = to_xe_file(file);
 	DEFINE_WAIT_FUNC(w_wait, woken_wake_function);
 	struct drm_xe_wait_user_fence *args = data;
-	struct drm_xe_engine_class_instance
eci[XE_HW_ENGINE_MAX_INSTANCE];
-	struct drm_xe_engine_class_instance __user *user_eci =
-		u64_to_user_ptr(args-&gt;instances);
+	struct xe_exec_queue *q = NULL;
 	u64 addr = args-&gt;addr;
 	int err;
-	bool no_engines = args-&gt;flags &amp;
DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP;
 	long timeout;
 	ktime_t start;

@@ -151,35 +129,17 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev,
void *data,
 	if (XE_IOCTL_DBG(xe, args-&gt;op &gt; MAX_OP))
 		return -EINVAL;

-	if (XE_IOCTL_DBG(xe, no_engines &amp;&amp;
-			 (args-&gt;num_engines || args-&gt;instances)))
-		return -EINVAL;
-
-	if (XE_IOCTL_DBG(xe, !no_engines &amp;&amp; !args-&gt;num_engines))
-		return -EINVAL;
-
 	if (XE_IOCTL_DBG(xe, addr &amp; 0x7))
 		return -EINVAL;

-	if (XE_IOCTL_DBG(xe, args-&gt;num_engines &gt;
XE_HW_ENGINE_MAX_INSTANCE))
-		return -EINVAL;
-
-	if (!no_engines) {
-		err = copy_from_user(eci, user_eci,
-				     sizeof(struct drm_xe_engine_class_instance) *
-			     args-&gt;num_engines);
-		if (XE_IOCTL_DBG(xe, err))
-			return -EFAULT;
-
-		if (XE_IOCTL_DBG(xe, check_hw_engines(xe, eci,
-						      args-&gt;num_engines)))
-			return -EINVAL;
-	}
-
 	timeout = to_jiffies_timeout(xe, args);

 	start = ktime_get();

+	q = xe_exec_queue_lookup(xef, args-&gt;exec_queue_id);
+	if (XE_IOCTL_DBG(xe, !q))
+		return -ENOENT;
+
 	/*
 	 * FIXME: Very simple implementation at the moment, single wait queue
 	 * for everything. Could be optimized to have a wait queue for every
@@ -202,6 +162,12 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev,
void *data,
 			break;
 		}

+		if (q-&gt;ops-&gt;reset_status(q)) {
+			drm_info(&amp;xe-&gt;drm, &quot;exec gueue reset detected\n&quot;);
+			err = -EIO;
+			break;
+		}
+
 		timeout = wait_woken(&amp;w_wait, TASK_INTERRUPTIBLE, timeout);
 	}
 	remove_wait_queue(&amp;xe-&gt;ufence_wq, &amp;w_wait);
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 88f3aca02b08..ae2457dc30ad 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -962,17 +962,8 @@ struct drm_xe_wait_user_fence {
 	 */
 	__s64 timeout;

-	/**
-	 * @num_engines: number of engine instances to wait on, must be zero
-	 * when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
-	 */
-	__u64 num_engines;
-
-	/**
-	 * @instances: user pointer to array of drm_xe_engine_class_instance to
-	 * wait on, must be NULL when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP
set
-	 */
-	__u64 instances;
+	/** @exec_queue_id: exec_queue_id returned from
xe_exec_queue_create_ioctl */
+	__u32 exec_queue_id;

 	/** @reserved: Reserved */
 	__u64 reserved[2];
--
2.25.1
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------XLDNTLe0oNLCIkM3nehhwaZy--
