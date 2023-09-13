Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED04CA0ED1
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 04:10:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98F3D10E0E4;
	Wed, 13 Sep 2023 04:10:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4A510E0E4
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 04:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694578221; x=1726114221;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A+p6O47Byc7FvrOWYbYrlCsdTfXxv4x8L6KejJtPha8=;
 b=eSkBtTxdTA3LQEM5d6Ru48SK31vzFPm1z2jENrl8eP0dkTvgvgHK2J03
 4Z3hxboFCScKXIVkdlrhpLZfcIj4TBfuv32VxEi2qwU3MB4fM9xvJaV06
 PsT/9Tfb15aRVtmjDIPrbp6O4QS7hPScd24a3Yzlwtd8WRHxDyOdSXIgp
 3kLVTbEw5uZwTs/M6KQ0XGnGwCP9Aflo3BTNKW+7+RHaPlbegqeFVtxLs
 maBW/64+Opjp1Yqm89uk1FhJZT/lFxJUqPNZlpITU+W4oEJ89hTI6Acml
 srnDfBLLg5YUNhd+sUaTxrgKk0ab5sCj5kprA9ml0kfNXmQ9MAOQCmlMq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="358832838"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="358832838"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 21:03:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="720668524"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="720668524"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2023 21:03:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 21:03:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 12 Sep 2023 21:03:53 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 12 Sep 2023 21:03:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YoyGuVDJDMbricst6RJg7XwvkhK7Xm/iZrv38legsbSde1UGXuv2XUi9h2qub8QJGdLK+64vygGMIqtuMzEtI1j2JxlJMgPiDAF9CY9/Yrg7Q7havk7dWVxphO3DX7BrEAH2Vfz2ZnSLqy/Q18S96lE7ZNcxmd5LVHDP9ZNfUoeQOXEAsXmipM53HkUuNGOQUD/GbDnkGLF6KPiTp97Rwz0Q3gJn8doFq2QN7JRoed4OOXfV+wTaXhDdYFx/QJ8RzjQojHUknbAQXw70qYKJt7+LlO0i7FIoW6HrvngkiK0fOywytKu6LUvF/4u1joy8DPvq9y29e4kiPDVZBYYrNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3tfL3hSV+uwRKKdVod3+kXsmB8649zcEYEGTejohuO4=;
 b=lsPmFviAmcCiB9gNO/dXg+ReJvvJnxFBECTu+JSZtspKqKUMGPyVErTxVF704GKLmoS1+Q0YGJgaH4UIe/wPPVrPLoS2+g2lUlJ1Xh1YNCQ9R2SKTeCB8kHh6Q2SCBBU9GNxVZMosvaRU3xIVBaAbJSLdkf2FZANWuL8BAEus4rAYBoCrjnGpOHZyzlhb8BPb67VzByVZhMXpF4tot3/cJgvy1W3r2GGyUckNh3u9TO89ih6CR68M2QqEZi9VDuYGMQJ94j8d46bGnXJCp8jEc0g9DiFkDiqB/uVVikDb+uHrbPLNVFvxG3W+ly5ORHYEVsM8PaFORtSLN8gI73xrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 IA1PR11MB6124.namprd11.prod.outlook.com (2603:10b6:208:3ec::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Wed, 13 Sep
 2023 04:03:46 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::c5ac:9134:7e53:b45c]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::c5ac:9134:7e53:b45c%7]) with mapi id 15.20.6768.036; Wed, 13 Sep 2023
 04:03:46 +0000
Message-ID: <f4e47704-6a12-db83-084d-a529a3988597@intel.com>
Date: Wed, 13 Sep 2023 09:33:36 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230901121545.361436-1-sujaritha.sundaresan@intel.com>
 <20230901121545.361436-2-sujaritha.sundaresan@intel.com>
 <ZPJK5iahuG41pvcF@intel.com> <42c5b687-7827-9ca3-abc5-66d094e726e6@intel.com>
 <27a95bc6-59de-42ec-5633-3b82cc09aedd@intel.com> <ZQB20IN6ngi94/Oh@intel.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <ZQB20IN6ngi94/Oh@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0200.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::11) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|IA1PR11MB6124:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dfe08c8-e46a-4dd7-8424-08dbb40e6d96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f2CoG5O4634J1Up/ErfnV+R6Sh/GobHzyPF89C9UzhK6rhIWpro0CI1FdVM/awdP3h2XCxjjmp89NcsBjULvd0qhtGIz1RRcItwA6cvmV+5KETEmJVMw5Zx7hzjsLYsMNq35HRrJA7zGxKtXQ+Me7OnHAKf5spoyG8LQOw8Cg/SkSgPtT8rDePOpt5DYouEhwjR7lOONgtsvR5ijq6QoRezgYjYMXVNCwk0QICg8e90yGKBMZWHPhRtixuAx0Mi5U/rz5+n4SDgS28IPHLc5+JeUHUQV0/ioxrwe6HygKFCdtPy8WNgixluIMK/PnCijkFlGcPR898LsFqy3i6tkIGPNUimnBeafoYCThH177yt85Xk4kwhQfQBAD9DJa2ly9kP6veSOLmPGR8bnwbWsxwxldugCTHC4TIWt7CgCQbXyXDnOUviuHYOnXPFx0mdpnyp90/fkt6+qPF1ziIZu2gkKL/guVn9sxSBl9Y6N866PINxKOrgk2vqrYiI5BvEli4SPCVWS88R/2tYQYj0DS443QAj7oMBh+glCa6vTUhf856ydr62XwyjBAKaRwq9Nsx7UkuC/NXbNKP3aYsT8vqbDMnvVAjLZ1rf4ubHDGV3ierUW9L5vPwvaMAknQPMJnJgQWNs1JYgklKXkkiEWpw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(376002)(366004)(346002)(186009)(1800799009)(451199024)(41300700001)(6636002)(316002)(37006003)(26005)(31686004)(8936002)(66556008)(2906002)(6862004)(8676002)(4326008)(66476007)(66946007)(5660300002)(478600001)(6666004)(53546011)(6506007)(6486002)(6512007)(2616005)(36756003)(86362001)(38100700002)(83380400001)(31696002)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUlDUkZvYUxnKzExVGxCQlVCcFFYUm9FZjNFNHZJdy8xZmszbFdEdkg0MUJK?=
 =?utf-8?B?SG5ldUNyak0vOWloemhYUHp6NVRLek9ldGlSMnZiNnVlM2t1T0swZzA5WWN5?=
 =?utf-8?B?MjBHTCtYRUdXcHlSSE5LN3FrMFhoNzJScm45QzlQYnIyK1V2WW5kRFlETG9U?=
 =?utf-8?B?YTNabnp5cUtmYnZ2dzBYRHY2azJaSlp0dWdRYjZpamRuNUlaZ1VBZyszcDNY?=
 =?utf-8?B?bVdSeHZ2WVZ1MUt3ZkpYYUY3dWdiOC8rWERZMDgxV1FaVDVhMlgxUUVRdmt1?=
 =?utf-8?B?RXdkUzUyMVI0OWZCeUlKZ3ZqNXBqSE1VNzFvT0FUblBURFFFRmVOOXptTG1Z?=
 =?utf-8?B?U2ZlTHN0aUtKdXUzMkRQSWFFSmpIQVhEN3B6T2VZVG5FSzJLa0xrWUw0TmFI?=
 =?utf-8?B?L1ZKMVhOMXJOYmJWcGtraUcybWRGZGJzMUJpN0pRZnVwR3dmWFFaK2p2TXRu?=
 =?utf-8?B?NG9pcjJLWnF1SXhBNjZtZWk1NWdkZVJlNXhXdEhIb3IrV1I1dmlHYzQrUDFY?=
 =?utf-8?B?WVJwaXB2ZDhwK2l1Y0QvbXFjbjZJZy96STNNZkdaV2ZoMlIwWWh5QVlPa2Zj?=
 =?utf-8?B?VlQyM2dlbUpjZmhhYy9TTjZiTHFReDNwbDZLMWV6Tm50WFhqN1Jlb2Vmb1FB?=
 =?utf-8?B?dkt0WmIrUEdwZXlTUmtOT0RManhITEc3YVlKRXlJZmRKaTUwOHJBcFBvSEp5?=
 =?utf-8?B?MWtHUlQ2ang4SzJ2K2JsSkN6T2s3WlorRG94US9pM1lnUWhWU2oxcWxWeVJl?=
 =?utf-8?B?RWxHM0Rrb3BkUWRrRW5Rb3NFZElHUU1XazB5UTdPRVQyVlM1NVhydVpQOFlh?=
 =?utf-8?B?RnAxMERWdDhrcElKbGdvY0NOajBQR0hJNmpsRzBoYzB4VERYM1VDZHVnb0Fh?=
 =?utf-8?B?L3FkSFJ3bmc0Z0JFbzBzWHRjellqKzdpYS9RUFp1QVNPT3FxVjczZFl2dVNL?=
 =?utf-8?B?eEp6UDl3VVJNb3QycTBKZlhOYm1VSElHcThFejl5Tm1aZ3ladUJnSXowbEYy?=
 =?utf-8?B?enhmYml1eThkTW82cXNCVUFZS2swRzRncGtnT2t6YXNCaWlUZTJnYlRiN1Z6?=
 =?utf-8?B?cUljZFBMb1I4QW1KK3VDMkRLZjRmeW5ad0s2M016cUJWTDl4YXhWeGVUZEdp?=
 =?utf-8?B?c2xyTHVzL0hqNzJsZ2djVlVwcjQ3QW5iejRURklVZUxPelN2a3plMnBwVThl?=
 =?utf-8?B?RVFLeFlybE83QlhPY1NwMUttNnU4R29tbWszTUJpMFFaZ0YwcHhsWXZtSDR5?=
 =?utf-8?B?OFBPQVNaL3RxNkpmSWI3SWNoTlU5aUd6akFwTDdEVUJMUG1tMjJ0QXIrbEIy?=
 =?utf-8?B?SG9ZRTJXbjlyeWo1UElYM0lVVHJQKzBXY1Y2bFNjbGRwRGVKS25uUWIwd3ZC?=
 =?utf-8?B?RmdUak9DN0xyc3czcXlWbkRZUXM2ZW1XRzRxMThSbVBQd2l0ajU5N2I5bHhl?=
 =?utf-8?B?aEV6TDRwUEVwdDlleVBnUGJEV1RkeVQ4c0h5TEJmajNuNjlTL1Zvc1poUmFQ?=
 =?utf-8?B?OWVCcEFsbTRBaHg3ZXVuUDJSajlyZmlzMDZpQ3BvSmd5VEd5ZURWVUQvQ3Ry?=
 =?utf-8?B?aStPdVVUQ1lWWXJOY2l5QXF6ekwxSFE0Y0JFZE9VcXJ3aGJLc0ZkRExBU0l2?=
 =?utf-8?B?ajZGK1p6QjVXSnhGUFEzaUtZZFNsZHZBK3BXU2xZMWRtZk5mZ0llZUhwdDJz?=
 =?utf-8?B?Vm9yOTcvQkxxMUpRa3VuOU1ia0h2UHhDVGU5NHE4M0preFVjdC93QUFRSy9H?=
 =?utf-8?B?OTQvMFZDM0VBVTBNQUdrZ1pBVThEUlU2Mnh2Z0thdmFjNTEvMHp6YjFzYjBS?=
 =?utf-8?B?STJCbTYrZWJBL2pDWk9neVpsYVBPVU1vSU5UZUU3dU5WS0E2MFZEK3V2TmJr?=
 =?utf-8?B?TXhtM3dELzJBbUxwdnpsK0NQYjVmQm50RC80b05rcllRUjJLSkVQTFIvQXQv?=
 =?utf-8?B?b1ZWbE52Vno2RnltK1V6WmdOY0NBUUlqTHhyejNPTXNSck1RcmhqV2k2eW9X?=
 =?utf-8?B?bmYyL1c1MldETkVYU3lhMDJqVTRHTFJ3R3E4dmsyS1N4NlVlUlZXNC9JSkwz?=
 =?utf-8?B?WW1wdVdnRVBQMVdhcjQwQkZMaHpQVUowODd6UGJlSDZaN3huTWFwMzNSRjBv?=
 =?utf-8?B?Wml5Qkw1aC9LQ1dvVHphc1ZXMGI4d3FQR3pxdDVsWG4zWGZ2cFU0S0ZRQmRn?=
 =?utf-8?B?NEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dfe08c8-e46a-4dd7-8424-08dbb40e6d96
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 04:03:46.7584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F4Hwhh5saXLqhi/RlCyg4hxemNjaBRNxjNUXFRDrQVTm+ryM78hpON4n1lpIImVnhsjQCqZRDBHrZOcKN+jOHoFtO+dtL+L7GySdoogZwIQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6124
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Add a couple of pcode helpers
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


On 9/12/2023 8:03 PM, Rodrigo Vivi wrote:
> On Tue, Sep 12, 2023 at 10:38:50AM +0530, Sundaresan, Sujaritha wrote:
>> On 9/3/2023 7:00 PM, Sundaresan, Sujaritha wrote:
>>> On 9/2/2023 2:04 AM, Rodrigo Vivi wrote:
>>>> On Fri, Sep 01, 2023 at 05:45:43PM +0530, Sujaritha Sundaresan wrote:
>>>>> Some pcode commands take additional sub-commands and parameters. Add a
>>>>> couple of helpers to help formatting these commands to improve code
>>>>> readability.
>>>>>
>>>>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_pcode.c | 28 ++++++++++++++++++++++++++++
>>>>>    drivers/gpu/drm/xe/xe_pcode.h |  3 +++
>>>>>    2 files changed, 31 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_pcode.c
>>>>> b/drivers/gpu/drm/xe/xe_pcode.c
>>>>> index 7f1bf2297f51..e45169f47500 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_pcode.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_pcode.c
>>>>> @@ -104,6 +104,34 @@ int xe_pcode_read(struct xe_gt *gt, u32
>>>>> mbox, u32 *val, u32 *val1)
>>>>>        return err;
>>>>>    }
>>>> a doc would be required...
>>>>
>>>>> +int xe_pcode_read_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32
>>>>> p2, u32 *val)
>>>> a better name would be nice....
>>>>
>>>>> +{
>>>>> +    u32 mbox;
>>>>> +    int err;
>>>>> +
>>>>> +    mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, mbcmd)
>>>>> +        | REG_FIELD_PREP(PCODE_MB_PARAM1, p1)
>>>>> +        | REG_FIELD_PREP(PCODE_MB_PARAM2, p2);
>>>>> +
>>>>> +    err = xe_pcode_read(gt, mbox, val, NULL);
>>>> but why not simply modifying the existent one to accept 2 params?
>>>>
>>>> int xe_pcode_read(struct xe_gt *gt, u32 mbox_param1, u32 mbox_param2,
>>>>                 u32 *val, u32 *val1)
>>>>
>>>> and the equivalent write...
>>>>
>>>> oh, and while doing that, could you please add the missing documentation
>>>> to these 2 functions?
>>>>
>>>> Thanks,
>>>> Rodrigo.
>>> Sure that would work. Will add the docs as well.
>>>
>>> Thanks,
>>>
>>> Suja
>> Hi Rodrigo,
>>
>> Another question,
>>
>> I can change the existing pcode_read function, but would it be better to
>> have a separate new write equivalent ?
> I wonder if we should do s/xe_pcode_write_timeout(/xe_pcode_write(
>
> where timeout is still an argument but it can be null.
> And then we merge with your options here and make a single write fn.

I'll see if this works out.

Thanks,

Suja

>
>>>>> +
>>>>> +    return err;
>>>>> +}
>>>>> +
>>>>> +int xe_pcode_write_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32
>>>>> p2, u32 val)
>>>>> +{
>>>>> +    u32 mbox;
>>>>> +    int err;
>>>>> +
>>>>> +    mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, mbcmd)
>>>>> +        | REG_FIELD_PREP(PCODE_MB_PARAM1, p1)
>>>>> +        | REG_FIELD_PREP(PCODE_MB_PARAM2, p2);
>>>>> +
>>>>> +    err = xe_pcode_write(gt, mbox, val);
>>>>> +
>>>>> +    return err;
>>>>> +}
>>>>> +
>>>>>    static int xe_pcode_try_request(struct xe_gt *gt, u32 mbox,
>>>>>                    u32 request, u32 reply_mask, u32 reply,
>>>>>                    u32 *status, bool atomic, int timeout_us)
>>>>> diff --git a/drivers/gpu/drm/xe/xe_pcode.h
>>>>> b/drivers/gpu/drm/xe/xe_pcode.h
>>>>> index 3b4aa8c1a3ba..8d4103afd7e0 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_pcode.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_pcode.h
>>>>> @@ -19,6 +19,9 @@ int xe_pcode_write_timeout(struct xe_gt *gt,
>>>>> u32 mbox, u32 val,
>>>>>    #define xe_pcode_write(gt, mbox, val) \
>>>>>        xe_pcode_write_timeout(gt, mbox, val, 1)
>>>>>    +int xe_pcode_read_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32
>>>>> p2, u32 *val);
>>>>> +int xe_pcode_write_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32
>>>>> p2, u32 val);
>>>>> +
>>>>>    int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
>>>>>                 u32 reply_mask, u32 reply, int timeout_ms);
>>>>>    --
>>>>> 2.25.1
>>>>>
