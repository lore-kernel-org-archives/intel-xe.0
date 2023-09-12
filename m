Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21074CA0EC9
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 05:09:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA07510E2CA;
	Tue, 12 Sep 2023 05:09:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 817D810E2CA
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 05:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694495350; x=1726031350;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dBJZt7BWAuM4Ckcm1NPty/zKrM2f0bpoSGu7NEANCeI=;
 b=abc+YRGmJESWoyk1vPWy4o2aduzMVakZ5qx0uottiamKefGjN6RIzzSa
 hfuMWNYJnOaoihm3oAGjAnMdLd5fdJn3EfxmSb2IM+jnVO8xp03p62CaK
 xhA7IQVdxl4gnevuYlOw3Es/wYLyCWr22QqEhpW9HSGuGdG3z/AMblL5Y
 nkdp9E7YkmbunF1K6hd7G937whZXqhzqXHKsbrd8m6pvO+yg6AwxG4jzv
 mAWv3gY77BH7sA9rXChrhBePn+XVWLiMbgFfITUYgQFd05b6GFInROXxJ
 fHeVbU3FRtqNj9Rsom1NLGm6pwdzYmUNWvC5xjEnceblmZ5mpZKTIjdkq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="380978076"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; d="scan'208";a="380978076"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 22:09:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="778650521"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; d="scan'208";a="778650521"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2023 22:09:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 22:09:09 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 11 Sep 2023 22:09:09 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 11 Sep 2023 22:09:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iaJlVk6AfmLXb73hb6UON9vVUZ2t6vdHVlVgvrdb7Hp3XxYgWC8NLZK3BmgmL8eqPK+Wmqth+2gZe0BAcUA71xnM6PuZJSoBPP1sqpa4/6EuhI2Ad+oOziPE4AaGxWpPD18lGPYTVVDgOwG8eTH9lBaPShSSGSv2rzjfv9Mqobt1+zc0DQWoQ6oGWwdyJuGidZus+46NmsFOZfkAqSV31N1JI5rlJJboXuABDrxUw3ek4SFUriejivk97G7xeCSQ2NwthRxaZRXPMpc4cUw+lyRUgBL9Q/MdhHw0qorMIpuLRHtR6uypVL2YBlvZdoDKcfg9erkGHAu/Tz9Rf5g+Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nBj0PAWXE9rIxJd/ldMCz+h33Dh7qJ+sY0TdEKDXjr8=;
 b=YnhyJ2OUP2AubXeFcx7lsmYf08ynFYNuHGhmqep+No7RP+7x5cxa8O1sTtxBoLta5QhrDsiTfCw/gaab8goIpGcqvMd6Gx1MP+gB/cTS86c/+/7TZB0tLqzg4VfbgYQwfUL6poMu9sunrhhhP6+5w8C95OSvBNV2Bs8lj+ATI8yNCnA1Ct1CT8h+KGbY8jLIeTptTSub3I09oypYQpIOjc64PezUm6YXI4O5yMBbP1qyN2HZfPmDl6i5S16rjkqoCMfE2enwE5dRr72dRKfedMiHDByw41XBgEGJWud7sIy7QP9xB2xONa9KvNeTpBTYRdApRiIlnCnth1aifnsy1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 SA1PR11MB6823.namprd11.prod.outlook.com (2603:10b6:806:2b0::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.30; Tue, 12 Sep 2023 05:09:06 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::c5ac:9134:7e53:b45c]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::c5ac:9134:7e53:b45c%7]) with mapi id 15.20.6768.036; Tue, 12 Sep 2023
 05:09:00 +0000
Message-ID: <27a95bc6-59de-42ec-5633-3b82cc09aedd@intel.com>
Date: Tue, 12 Sep 2023 10:38:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230901121545.361436-1-sujaritha.sundaresan@intel.com>
 <20230901121545.361436-2-sujaritha.sundaresan@intel.com>
 <ZPJK5iahuG41pvcF@intel.com> <42c5b687-7827-9ca3-abc5-66d094e726e6@intel.com>
Content-Language: en-US
In-Reply-To: <42c5b687-7827-9ca3-abc5-66d094e726e6@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::12) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|SA1PR11MB6823:EE_
X-MS-Office365-Filtering-Correlation-Id: 9895db4d-2f76-44b2-94e9-08dbb34e6018
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gf/PYBDI/FErAzRDujrBxwhcfsrLsoeeW/Lt167YE/tEDkmg5BQ+quDDsMZ5pt3c1Op6YJiL+jTnSZlYlGujM3wCaodpxleEzXcxlDSguLVsahGF8GQUpuH6bbsotluzcS9EVQ/Wr/NG+0ZbTt4O7U0AUZSp3JhF7/hKDYGZyY4opWsl8bGay5+WZkeYH3yU1QPeE0jzgV/FRJADbMQWBRt/bU2ASJ1ptKWLi9/0iCuujT+AXlYU3ITzKUve9NYLI2r3MvCyWSa/+N38baH4lnkR/mxV5R0dtihynCrLnwLur2iGsopx5CB8xyXHn4SuZ9036OBt/iMYFXQVVAq8u0Mf6w6H6vKLsDZ3lmp/2l5DC0mql1u9ZO4MJY/sfXH54K3U7+aUPg649OllBR8eMegXv7+Jx7dNCYigBOuDZXffxVSRzncX5JmvnQPtx6Q5xD1H0dRSqikjO5UEHi+Ys0SSfHGgE2yYHI4FfjQ/2ZPfZnNMGx1npfGGaIUMgwT+KNQvQmLZKP9XKxkWovIdEj83VBCQ0l/USA9SC+gim/D8GZRYMUuqeK4JC1wBjbeW8VMlUFjdrPjml5ojMXGVocC5wb55/tezsLGLwKLICm+hRftEZZ1mBMveqO20CMoQqUQVqO5czwE2SaeWXfcfWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39860400002)(346002)(396003)(366004)(451199024)(186009)(1800799009)(8936002)(6862004)(4326008)(26005)(8676002)(5660300002)(83380400001)(2616005)(31686004)(6512007)(53546011)(41300700001)(6506007)(6486002)(66556008)(37006003)(38100700002)(6636002)(66946007)(82960400001)(66476007)(6666004)(316002)(36756003)(31696002)(86362001)(2906002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlBGT2ZodGZJaWFqWjUzQ2JMQmgzdWhwQWhUVzdRci9tdlltdm5KZ3pYRVdS?=
 =?utf-8?B?Yy9RVnZLWXlGZzY0RS8zMmp6U20rVU53djJJcmVEZVFmUkNtTEVIbXRQU1lv?=
 =?utf-8?B?d01SdENjR0p2Q0lGUnhVNnZMeTlEbXBjT01pRW9saXQzVDUraFBId2NYaUdw?=
 =?utf-8?B?eVh0Uy8vWEFMQ05XRGttdXhGaHZQZXQrbXN5REJJM2dmUjZqbFdabTNvK0xo?=
 =?utf-8?B?MFZpVmU4U1Zjblg0NHRjQURSOEN5K29neUZzTStOcU9mRWpPZjB2ajlPSzU0?=
 =?utf-8?B?UGhKN3FOM3BmV0NqanlCd3V6TmRlSjRtUzdpcTlnVW9ueVp3ZGtMeE54RGJq?=
 =?utf-8?B?VlRFN01Ud0x1R1hLRVFUT1lXTmVUTFlibi84MkVJaDJ4OVNvNUxwd2d3R015?=
 =?utf-8?B?ZS9ITWJLY1hNTlFMendyUnZsbXRxTzh4cTAzTmtCVUlLclUvcFNUYXpVaGRl?=
 =?utf-8?B?RHdmTXhJVXFIRURlNytLMW1xVkJoUElKeWo0WGYwU000R2RlMVlBc013UWhV?=
 =?utf-8?B?dGVTcjJPNTZtNEJLQ0EyWE5qSVhYdytVZmhxYThJTGRid0tBa0FHMHAxNmo0?=
 =?utf-8?B?aXVtbWJaU1JBQVBDVXpaWUFndmE4bEdOZ1kvYS9uQkR0Y0xtbUtBenpSK0pL?=
 =?utf-8?B?SExlZ1M4TStma1dRT2F4akxYdVBvNWs2MjNqSUdpTXlxWm1xTFY3UG0weDdq?=
 =?utf-8?B?NFB1RlJ4WjlqU0ZHNUhGTUlxR3Q4Y0hmZkU2dTR4Y0QyUW5zSkVIdUtyUzFD?=
 =?utf-8?B?NFZWVmNmdXdSL3dwUkZtaWIvenQyUXNWcyt4WDlPQTdFdndoaW5SNmhtSTMv?=
 =?utf-8?B?ZzJydUtnYXhyZm9FbkVxVTE1VitIWjZhTGxaaU5WOE5EQ29Pck9ONkhtRmtX?=
 =?utf-8?B?V2trRHNKSWJrOXNFeml4TXZhSTF1d2dzbWl3MStzVDAzcjlwUWt4Ykx1d1pD?=
 =?utf-8?B?aDBNRXQxMGVudHZSMW1RbzNNMkZ3V3F4OUhKOStlTG1VVGF4ajk1N3FCa3Nn?=
 =?utf-8?B?d0krMGxTYStLcEhMWmhjNFJMWlBGdkVTcUtpK0o4K3NCYmwvbU0zdGRVYStI?=
 =?utf-8?B?cmdtUTErZXU0bXZFNlJybnQxQnZ3eXFEZXpqckU1ZVZNLzlDSi81cU14NE5L?=
 =?utf-8?B?dnZSMDdzSlFxU3pSU1lzVDZFbTZMRlRsaDdVYVRxM3FpV3diTnNPZHZZT1hQ?=
 =?utf-8?B?Wk4vWEhOcmpGWnlvcFNLczlmL3hDQWs3SEFiazJZU3loeWc4T1VzZXNlM040?=
 =?utf-8?B?clRxbCswTGI3eWRySG0rVHhSd3hHSld1enAwU2FwMWFIdDduREV5WmREMmhs?=
 =?utf-8?B?ZTNHblNlS1g1TUkyVk0zRzlJYnlqVmVhandSRzVaQWI3d21LaDZkeUYxdjJU?=
 =?utf-8?B?MTNrOTU3M2c1dGYwNWR4TlZKekt5d0RnT1BBOTRWWjUwY0Y3MDYwTEd1MWVK?=
 =?utf-8?B?NjM2aWdLZDNkbmtGbWEwNytTZFV0T0tRemRMcWlLTFc4empaa21aWDdYeFI5?=
 =?utf-8?B?WkdqVmRDU1NxRHBZUWM5MGVkTHRGazNBZ3FmOTN5S2FKUjRjbXFkMjhCL3Fv?=
 =?utf-8?B?NnhxUlFicE43QjRmcGpLbFUxZ1BiUm5rZjhIZGwrQjRmQXFaL0Fsdm5GVVZs?=
 =?utf-8?B?WDNFS3MzUElPSndQRkpuL3RMZml4bEtUUzRqTFVkKzhGTEhZejVTeWxYNWtl?=
 =?utf-8?B?VzJQKy9BMTRnUXNodWdjbXg5d3E4bVVjb1lXaWxHWHZUeUlSZndMb0JLNnZz?=
 =?utf-8?B?YWZqaDVhNkFpWVcwV0Jkamwva2VuS1BiQW42SzJhZ2FDZ3hZc1BLQzl1MHNl?=
 =?utf-8?B?NGgvUTRtZEZDcklBU0pHUkxkWjNLNVVSVWRXNnpTb2RKbHlwTTNZSlhBTlJ3?=
 =?utf-8?B?MVlEUk5XaG9hQ3h1bDNjUEhoeFRCM2RnQndxa2szVGo4ejN5N3g0WmIycUdK?=
 =?utf-8?B?dVFNM1JlLy9LNWJoVTVpZVM4eGRDS3EwMDFEbUo2TU9WWW1KVjFHUkJzRDIr?=
 =?utf-8?B?Ym5uOXhwaTFuV3Nna0prS1RXZWRkVzRrVWlxUUovUUVTdllMQyt0aVhIbWFk?=
 =?utf-8?B?LzNGaW5Ta1ZiZnlqMU1aaUtKNFNDMGZvOUhnb2FYQXRRVG1zN2t3dVhZc0M1?=
 =?utf-8?B?SElyb0hMYnNkbVg0eklJd2VTN0FwQWc4RG5PWS9BOW9rVjVaNnJRenVBWUEy?=
 =?utf-8?B?OFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9895db4d-2f76-44b2-94e9-08dbb34e6018
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 05:09:00.8422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5V4zIP+aE3uut/9EuEX3zeiJa/WJmMn7GSYZBkSbZtsRHyjHzMYR4/rU79ZEO++7FrpubVJnQm0xp1B6m4MtMlPgf71xSKSk09AQEazrJQw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6823
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


On 9/3/2023 7:00 PM, Sundaresan, Sujaritha wrote:
>
> On 9/2/2023 2:04 AM, Rodrigo Vivi wrote:
>> On Fri, Sep 01, 2023 at 05:45:43PM +0530, Sujaritha Sundaresan wrote:
>>> Some pcode commands take additional sub-commands and parameters. Add a
>>> couple of helpers to help formatting these commands to improve code
>>> readability.
>>>
>>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_pcode.c | 28 ++++++++++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_pcode.h |  3 +++
>>>   2 files changed, 31 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pcode.c 
>>> b/drivers/gpu/drm/xe/xe_pcode.c
>>> index 7f1bf2297f51..e45169f47500 100644
>>> --- a/drivers/gpu/drm/xe/xe_pcode.c
>>> +++ b/drivers/gpu/drm/xe/xe_pcode.c
>>> @@ -104,6 +104,34 @@ int xe_pcode_read(struct xe_gt *gt, u32 mbox, 
>>> u32 *val, u32 *val1)
>>>       return err;
>>>   }
>> a doc would be required...
>>
>>> +int xe_pcode_read_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32 p2, 
>>> u32 *val)
>> a better name would be nice....
>>
>>> +{
>>> +    u32 mbox;
>>> +    int err;
>>> +
>>> +    mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, mbcmd)
>>> +        | REG_FIELD_PREP(PCODE_MB_PARAM1, p1)
>>> +        | REG_FIELD_PREP(PCODE_MB_PARAM2, p2);
>>> +
>>> +    err = xe_pcode_read(gt, mbox, val, NULL);
>> but why not simply modifying the existent one to accept 2 params?
>>
>> int xe_pcode_read(struct xe_gt *gt, u32 mbox_param1, u32 mbox_param2,
>>                u32 *val, u32 *val1)
>>
>> and the equivalent write...
>>
>> oh, and while doing that, could you please add the missing documentation
>> to these 2 functions?
>>
>> Thanks,
>> Rodrigo.
>
> Sure that would work. Will add the docs as well.
>
> Thanks,
>
> Suja

Hi Rodrigo,

Another question,

I can change the existing pcode_read function, but would it be better to 
have a separate new write equivalent ?

>
>>
>>> +
>>> +    return err;
>>> +}
>>> +
>>> +int xe_pcode_write_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32 p2, 
>>> u32 val)
>>> +{
>>> +    u32 mbox;
>>> +    int err;
>>> +
>>> +    mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, mbcmd)
>>> +        | REG_FIELD_PREP(PCODE_MB_PARAM1, p1)
>>> +        | REG_FIELD_PREP(PCODE_MB_PARAM2, p2);
>>> +
>>> +    err = xe_pcode_write(gt, mbox, val);
>>> +
>>> +    return err;
>>> +}
>>> +
>>>   static int xe_pcode_try_request(struct xe_gt *gt, u32 mbox,
>>>                   u32 request, u32 reply_mask, u32 reply,
>>>                   u32 *status, bool atomic, int timeout_us)
>>> diff --git a/drivers/gpu/drm/xe/xe_pcode.h 
>>> b/drivers/gpu/drm/xe/xe_pcode.h
>>> index 3b4aa8c1a3ba..8d4103afd7e0 100644
>>> --- a/drivers/gpu/drm/xe/xe_pcode.h
>>> +++ b/drivers/gpu/drm/xe/xe_pcode.h
>>> @@ -19,6 +19,9 @@ int xe_pcode_write_timeout(struct xe_gt *gt, u32 
>>> mbox, u32 val,
>>>   #define xe_pcode_write(gt, mbox, val) \
>>>       xe_pcode_write_timeout(gt, mbox, val, 1)
>>>   +int xe_pcode_read_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32 p2, 
>>> u32 *val);
>>> +int xe_pcode_write_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32 p2, 
>>> u32 val);
>>> +
>>>   int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
>>>                u32 reply_mask, u32 reply, int timeout_ms);
>>>   --
>>> 2.25.1
>>>
