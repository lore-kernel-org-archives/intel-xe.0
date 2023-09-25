Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D08CE7A89
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 08:13:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1987710E1CF;
	Mon, 25 Sep 2023 08:13:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62BE010E1E1
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 08:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695629604; x=1727165604;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vXvCz1UBv2g7MdXO8/3cqrYWq1noh/hJI29aEVJJ52w=;
 b=ZTtTGxVuRB5fvdQ/GBR8B0HsCE/jBD6dEFg0NTg8OyKkL95n4bXB9BJD
 +peTAm4xYFpStMsQTBVws+oT9Vh8Pxkbhv3COHoGknqmkhMnzEgj3uq2o
 nuJ9JQWy8UuYPIYUx66kXi9i7mRv1tezd+pkTzaqCio5+Jy7Bk1iQERBU
 AjHLZphsei4CKJ2HwblK+9PX4ydiFGrqeOFH12XJOWwUL7N56ANymfbx9
 2tllBhrEUuGqKrNtfYAfrN2li3SNzB5Q1aExV5z2UIDA1vElAJ1PLMy+o
 Y3MaRBA/SqWG7wwy1ApuMRyP+93s5lIRWHjkEPtvcZ9+5RVnQB6r+cJmM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="361449888"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="361449888"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 01:13:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="724906900"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="724906900"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2023 01:13:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 01:13:18 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 01:13:18 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 01:13:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=agF41s/IOt/SZ40Yw8nRQmXsiPBOpkY5ej4RngwnTDh+bWYj2CWF/ir6FLPeyqDL4wJcAKUNZW3ERaFVlgE5ZwkibwaXSfyaI+ztRue8TX55vwwTX8eQo5YrmSubXAS9pdJTS3yLbat3N9Kq43Zea8U1Bkh/iX7hbwizr1jUtxmm3rFW5lP8lDXn0KM5ZXx//AVLAwIXS1xVeOx3LRzfjzSCbQmw07uNJDXtvJXGqn0XTfNktjAkJkhwkA44XlrMjJif8Mx/AHDZXQkdpuS0sBN+VcHa2TMUAd7C3ezJY70tT1PnsxUsQUlNBPbMiOjcu8WPfVPpsSyFL89uatAOKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44umFcHnz1G5JBY0SyfIeU50XdK2aTBIuFbjhZwDhjc=;
 b=bLLt0rYz386J8/iv4worIdMjiW4J0wbqNMxBVcJUT8a+sdmXj4fHYfpChdBWTYxbB5vlwEVesGP96u3USD+5Y4JbhwXRHhiDsOUEb0PZThWHedUi5IacYq+zQQW2rnbfggApimGq1a7QwYqXL161Mi+8UElVVMTfiHSZu4DGmINLJt1YLSXJwSrtGQksf4lZf1+RuLR88RChMxvl2nCOwSKESOn7NHnGUFDJC2WTGrg1Rzqk2rLe2npe3ypeSoBa2Q4F6NysKXhXlNigZaeK0hVa/xe7+ye6X+iKwKIjtSTa7WHFotxUN/yPdyxk3ljZ8czhS7JDJMbICGlAQGGVXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 SJ0PR11MB5054.namprd11.prod.outlook.com (2603:10b6:a03:2d3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 08:13:17 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::c5ac:9134:7e53:b45c]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::c5ac:9134:7e53:b45c%7]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 08:13:17 +0000
Message-ID: <38cc4b43-788e-9680-c416-8cd02831624c@intel.com>
Date: Mon, 25 Sep 2023 13:43:07 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230901121545.361436-1-sujaritha.sundaresan@intel.com>
 <20230901121545.361436-2-sujaritha.sundaresan@intel.com>
 <ZPJK5iahuG41pvcF@intel.com> <42c5b687-7827-9ca3-abc5-66d094e726e6@intel.com>
 <27a95bc6-59de-42ec-5633-3b82cc09aedd@intel.com> <ZQB20IN6ngi94/Oh@intel.com>
 <f4e47704-6a12-db83-084d-a529a3988597@intel.com>
In-Reply-To: <f4e47704-6a12-db83-084d-a529a3988597@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0184.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::13) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|SJ0PR11MB5054:EE_
X-MS-Office365-Filtering-Correlation-Id: a1ee2857-8c10-4daf-909b-08dbbd9f4558
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SCq6P7OoDI+kkL8tookLXGJH28i5M4uUErcWo5hX1HM2+NmgGwOzdeJdI/P3/h5gmvREk54htp332Y2QoptFHzHwzhvBxEO4lgTKvXPJXY61M9NO73unPMQ4nCyxhbnuSRmKEPsq/kq6OjkKFrEsU43tZVQpCHW7GMlgynYHceVGYfcQSVO0Kl13vHJi8x0jC/zOkCD9+ws5mUv25hT+c4d0qnUyoEcKaJAMJ1mRDto9dZZeoEsdTGqcxb1eTyBGplsdPxn9Cb4jL6H/7VdHPryqK24+zfSF03gKCg6zqkOCnp+omYxni/ok2tjvakJgEypYhI9aHP/asJiqQ89kUKwx/DD5U/73omio6Df00dvyKdrgYNCuwimGorLtm9gW6adv+lHC5LAKtnnZ8aoee5NaF4Uw/z6ehw82ddf53TnmFwDNDtLJBeoEYzjK0WW8Hsc4OAhEIxpAD8maVHaPaayKr3hWP5Hgz8P8AUodozUj2Us+m0jpmzBhRvqSWrKmmQrlG50ORdYGzQk5OtknNqL2ZTlJZsdnAesnyoLAAtg+EhHUVBKKYkRZQckrYbdBp9Vb+TpYFfkYSTzxLXxBotwaCtIfL/L9S6f+GOhGbYcHDGSBELU1930veD9GLY1bP3d0xoWGCyyrxSSYBVqQcQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(346002)(396003)(39860400002)(230922051799003)(1800799009)(451199024)(186009)(41300700001)(2906002)(86362001)(31696002)(36756003)(6666004)(53546011)(6486002)(38100700002)(6506007)(478600001)(6512007)(82960400001)(2616005)(6636002)(37006003)(66556008)(66476007)(316002)(66946007)(26005)(8936002)(8676002)(6862004)(4326008)(5660300002)(31686004)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjNkT24zRWZ1SUowNTNDdko2UEhjSEpuS1Q5WloxazJJR0F2ZTR5YmljNTdo?=
 =?utf-8?B?dnZaN202NzJKa3pzR0tlbHFxNmhLTGhSV0tQZFdaeG5lMXZCcGtoM1p6YjZL?=
 =?utf-8?B?dWFWZDNSa0hlV0ptaEtObWhBbDZSM1JSOE1hckJMdVlGQ0x4T2dZcjRIUDVy?=
 =?utf-8?B?a3ZwNnhUTkdicDlpSHFlZElhOVpvV2RXY1lJNmh0YWRPR3dRdEFFczk0bndr?=
 =?utf-8?B?Z2NRYk4rTnpmeHBPRTRFeVhKcjFQTm5HVGZxLytLbzJGSmpOR2N4eHBTd2xF?=
 =?utf-8?B?bERwZTJZYXd2Y2tldEZGQVBOTGk3YjlZVDBOeFZTM29sS3BkVU1heWVjNktz?=
 =?utf-8?B?V25FaUtSUjc2MXhNWlZ3WjZFcXlkeHByMmNZZXFBOWc5RWlZbzBiWU05ZnBH?=
 =?utf-8?B?TUEzQkJlU3JaVk04RHVMTkVrZW1hZngzbEpGUWtvV2FKN25iV2JvVU9Fc2I0?=
 =?utf-8?B?bmJCUjRKdUl3NUNwMnAxOEtadld4TkhLamdXQ1AxZUpENDJadXlhRXl4b3FH?=
 =?utf-8?B?UVVOMG8xaGYyVXhxSmtGY2FWZXlJY2s5Z2Q4eUJTZ2pELzBicHlPZGFsSTNL?=
 =?utf-8?B?UUV1SUo2NVhmVzhqTzZFK0tWL0FuNWx1blA2eFFuZTdGWVNpcnM1SXpHZ1JQ?=
 =?utf-8?B?ck11Nk16UFFKVHRhaW82cXdlUWdJZGkzaUw4V016b29RQkdha3RBcFBsQ3hy?=
 =?utf-8?B?WFpKYzN1RjNCSTREUDRJZWdEajF2TjBFd3hFT29DUWZBOFB0MFNHYUpTWHZh?=
 =?utf-8?B?eU5WdXl3ekxieWkvUUdRSUJkWFFPV1hseW94MjJHL2loZmkyNGRDQzVkTzBh?=
 =?utf-8?B?d3RNUnJmSEtPOFI2a1FEeXZxbld5TDFkNXpNanl6ZjNNYXFQcDRQL0owaEVt?=
 =?utf-8?B?SE4zakk0S0R2U3pYaTN6WHFoSzlqTHdUNHVGb3FHM2xXb011UjAwNktKS2ZK?=
 =?utf-8?B?MVhTYVJpcnY2Q21LQnBXVlhnMnF5Y1VWY1lQeGpnN0wrTVV1RGFHS0Q2Nmdj?=
 =?utf-8?B?Sy9jV056djBoRVlNN1RMZDNNY2kyYTFmRHJqTVYzWEZXdEs1VDAyRTB5WHhV?=
 =?utf-8?B?Zm11UVpMSGJwa2hkM3AvYktQNkNpRzVDTEtEWTBRMHFOaXpwRHpKcDI4Y1Mw?=
 =?utf-8?B?bWRzK1c2TVROSzArdG9LU1VZNFYxZ2ZsbkRVQXBnR2IyZXBTRnBWOFdNcW5Y?=
 =?utf-8?B?dUxtQW5WT1hieFVhY3JKU3B3OTg0Qk1oOTZkUXltVzN0WUZacmJIaUZRUUNm?=
 =?utf-8?B?K2hVNUhnZDJDUyswVzlGcTRPOERJUEpTUlBsWTJVby9EQmxRSkNBNjF2MkNn?=
 =?utf-8?B?dncvWFA3UFdFY1JVWGlHTkFoUzU2dkJkdHlGZExnTk16SVRPRDRuYnNSQ3ZP?=
 =?utf-8?B?ckFTQ3ZDakxvTVM1N1Z5ajY5V1NqTStmTDc4MFZGZWwrN1c3OGpuWm9ldmZr?=
 =?utf-8?B?Q3Y2MHM4d3Q2eVdzcnV5d2Z5czNZSXNYb256TkczbHdmRytNVXgzNGRTZ1No?=
 =?utf-8?B?MTdoWHh5MTd1aTRzcmMxTjVmWTV0MzZQcCtOZUswMkNLM01WbVNmajBuT1Bu?=
 =?utf-8?B?TDF3ek5YenFOd1dDUmNPT1lueFdmSUxzYUQ3K3Ard09WRFhER3Y4eXdpM3Yx?=
 =?utf-8?B?d2kzeEFEcDJSWGtHSlRNQmdXNDhyUkt4WGluRzY2OUxIeWZCajlmS3htdWdT?=
 =?utf-8?B?Y1NPSTZ3dGFwbDdENUpPYVlBZW1xWjAvNFRCaFFITS9Xb0tLOEMrZFhPdGM0?=
 =?utf-8?B?WlgvV01vZVVkYU82eno4WTFSY00rMXpZYjI2U2RJOFlGbVdVaEhjT3MwM3RG?=
 =?utf-8?B?VFJTcXVTd1I4bzVCZ1JjeE9kMlF1RVpGcjA2dnNIVFpHSmtybUtpbmh5Q3dO?=
 =?utf-8?B?Mk9uQkVVOFJKMUliVFBhcEgwWURQOXJpRFh2aWJ6eVZOTmU2SUpnK0RKRnlV?=
 =?utf-8?B?WGRpYmJwVFFpNDBRdmc0L2MxRi91ZDM5THJHYU85UkxCa0xRZVRkZkFJTGVu?=
 =?utf-8?B?UU54K2U2dThnSjJ2WW9xS3M3ejVXMUJrSkgzZGNGSEtud1g5dG5ZZXo4WHBo?=
 =?utf-8?B?RVpUMjBYaGYrMDBPNnFtbzBSRFhpSkFzbW9BdzZoSXBGNmVOUFlxYVlkNlZP?=
 =?utf-8?B?cHhqemxBMmZxMjNQSm1hOFhlWUhTK0RxYVQ3bVhwRHdpV1lpSDVWNFNFVXBw?=
 =?utf-8?Q?07nletEX8tpx05278K0ux3g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1ee2857-8c10-4daf-909b-08dbbd9f4558
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 08:13:16.7850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/tWo1aYa7Iq6D9WKHO5TcwOwwR4dARFhCwFo6VOrD/2Dil2a/V0ABPDdW5iZoIng38xXsIkGVahtJc1Ng54VBzvcj/xrT61riwr/Ze2BrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5054
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


On 9/13/2023 9:33 AM, Sundaresan, Sujaritha wrote:
>
> On 9/12/2023 8:03 PM, Rodrigo Vivi wrote:
>> On Tue, Sep 12, 2023 at 10:38:50AM +0530, Sundaresan, Sujaritha wrote:
>>> On 9/3/2023 7:00 PM, Sundaresan, Sujaritha wrote:
>>>> On 9/2/2023 2:04 AM, Rodrigo Vivi wrote:
>>>>> On Fri, Sep 01, 2023 at 05:45:43PM +0530, Sujaritha Sundaresan wrote:
>>>>>> Some pcode commands take additional sub-commands and parameters. 
>>>>>> Add a
>>>>>> couple of helpers to help formatting these commands to improve code
>>>>>> readability.
>>>>>>
>>>>>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/xe/xe_pcode.c | 28 ++++++++++++++++++++++++++++
>>>>>>    drivers/gpu/drm/xe/xe_pcode.h |  3 +++
>>>>>>    2 files changed, 31 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pcode.c
>>>>>> b/drivers/gpu/drm/xe/xe_pcode.c
>>>>>> index 7f1bf2297f51..e45169f47500 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_pcode.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_pcode.c
>>>>>> @@ -104,6 +104,34 @@ int xe_pcode_read(struct xe_gt *gt, u32
>>>>>> mbox, u32 *val, u32 *val1)
>>>>>>        return err;
>>>>>>    }
>>>>> a doc would be required...
>>>>>
>>>>>> +int xe_pcode_read_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32
>>>>>> p2, u32 *val)
>>>>> a better name would be nice....
>>>>>
>>>>>> +{
>>>>>> +    u32 mbox;
>>>>>> +    int err;
>>>>>> +
>>>>>> +    mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, mbcmd)
>>>>>> +        | REG_FIELD_PREP(PCODE_MB_PARAM1, p1)
>>>>>> +        | REG_FIELD_PREP(PCODE_MB_PARAM2, p2);
>>>>>> +
>>>>>> +    err = xe_pcode_read(gt, mbox, val, NULL);
>>>>> but why not simply modifying the existent one to accept 2 params?
>>>>>
>>>>> int xe_pcode_read(struct xe_gt *gt, u32 mbox_param1, u32 mbox_param2,
>>>>>                 u32 *val, u32 *val1)
>>>>>
>>>>> and the equivalent write...
>>>>>
>>>>> oh, and while doing that, could you please add the missing 
>>>>> documentation
>>>>> to these 2 functions?
>>>>>
>>>>> Thanks,
>>>>> Rodrigo.
>>>> Sure that would work. Will add the docs as well.
>>>>
>>>> Thanks,
>>>>
>>>> Suja
>>> Hi Rodrigo,
>>>
>>> Another question,
>>>
>>> I can change the existing pcode_read function, but would it be 
>>> better to
>>> have a separate new write equivalent ?
>> I wonder if we should do s/xe_pcode_write_timeout(/xe_pcode_write(
>>
>> where timeout is still an argument but it can be null.
>> And then we merge with your options here and make a single write fn.
>
> I'll see if this works out.
>
> Thanks,
>
> Suja
>
Hi Rodrigo,

As I am making the final fixes, looks like it would be better to have 
separate new read/write functions.

With changing the existing read/write functions, we are having to change 
the pcode_mailbox_rw function.

That is causing issues with other existing functions. Shall I keep the 
new functions defined separately ?

Thanks,

Suja

>>
>>>>>> +
>>>>>> +    return err;
>>>>>> +}
>>>>>> +
>>>>>> +int xe_pcode_write_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32
>>>>>> p2, u32 val)
>>>>>> +{
>>>>>> +    u32 mbox;
>>>>>> +    int err;
>>>>>> +
>>>>>> +    mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, mbcmd)
>>>>>> +        | REG_FIELD_PREP(PCODE_MB_PARAM1, p1)
>>>>>> +        | REG_FIELD_PREP(PCODE_MB_PARAM2, p2);
>>>>>> +
>>>>>> +    err = xe_pcode_write(gt, mbox, val);
>>>>>> +
>>>>>> +    return err;
>>>>>> +}
>>>>>> +
>>>>>>    static int xe_pcode_try_request(struct xe_gt *gt, u32 mbox,
>>>>>>                    u32 request, u32 reply_mask, u32 reply,
>>>>>>                    u32 *status, bool atomic, int timeout_us)
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pcode.h
>>>>>> b/drivers/gpu/drm/xe/xe_pcode.h
>>>>>> index 3b4aa8c1a3ba..8d4103afd7e0 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_pcode.h
>>>>>> +++ b/drivers/gpu/drm/xe/xe_pcode.h
>>>>>> @@ -19,6 +19,9 @@ int xe_pcode_write_timeout(struct xe_gt *gt,
>>>>>> u32 mbox, u32 val,
>>>>>>    #define xe_pcode_write(gt, mbox, val) \
>>>>>>        xe_pcode_write_timeout(gt, mbox, val, 1)
>>>>>>    +int xe_pcode_read_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32
>>>>>> p2, u32 *val);
>>>>>> +int xe_pcode_write_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32
>>>>>> p2, u32 val);
>>>>>> +
>>>>>>    int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
>>>>>>                 u32 reply_mask, u32 reply, int timeout_ms);
>>>>>>    --
>>>>>> 2.25.1
>>>>>>
