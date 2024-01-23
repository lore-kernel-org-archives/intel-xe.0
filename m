Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139FAC47258
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 23:24:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C41EE10EF49;
	Tue, 23 Jan 2024 23:24:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB3C10EF42
 for <Intel-Xe@lists.freedesktop.org>; Tue, 23 Jan 2024 23:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706052292; x=1737588292;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5l6x9pm5yyu6iREuH6BKJWLESQ7MinFbLjzuNZ84ROE=;
 b=eWo6jxQ4AnSD/ltCOlrDStLr3RrOxEoc4yDGTefUvN9ACVNvu/l3aQQT
 O9dFE99BaQIt3fBp4hq4rnl9DjzR7rKMam+l5yxlL+ks/zjtw6qVs6AUt
 /j2nB76ZpZWl3JEnznhiR6BL16ivfM7T9IfenQ282pYyUI/2suqzLqs9c
 kQSj9Ev8fjsMKdKJgdlzzBXvwFXVtr9uZcH7eglI6uQBkTpj4Mb/DNVXG
 IX4475n6c+JdrwmihaJQC78HrEOS4Rm7xFscylhQsJDYnHPZZILpjHiAT
 dWNtopuI45n/x5IBcgtZW/xuBxLWGW+3FJDKGdTYHUlF52JzsV6NEImuH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8799363"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="8799363"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 15:24:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="1692395"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2024 15:24:51 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 15:24:50 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 15:24:50 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 15:24:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ehBhWiEsSoGOeEUBPw8U95mAKSq4KZRMKt0oBuHVNZzFsVbsVR6sh2Dcczuj+PKbryfQdhb9TyTICqgg8VVu0RUJKSTod8ndTHoY860z4kIo5t/SORZEoOUh2t4G4YlyoUSXAmIrrO5o9vmhcg2xxG4wePJqEp+1wYYpa1UspZ42rvIDrumK//guU+ILbdbNkUAlPGZrBvnjR1RD0OMM6+iGYLMyLSa/Gqzb9hcuQEgYKlwC79BPoterz8vDMj9feeKmvGsvS+9SsMsYGeIo0Lt06VxDs/A2K3vexriJ2I3XddfNKjFW/QI9FPz081eunyVvrLVGPDYFxQrJvfGUog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+i2nESgwxtafUFgULhzHQ5DSCBUNIv90aXN1QeeSMQ=;
 b=euHIBfze/3Ej7y88yfs88nE7QltoHV+g9cNqMINF3WGywfL/XKwy3dQVKh0GAlriwVLBtF1fGYUvOOI0EiD1ecDSgFPyhikZEVXN3r6780+0l75Y76i46ZiEYnWZTAjD5he3+YGTh0M62jnDGhO2OBtqun6mH6/IoxHMvopMSSfI3ZbHDKYpy76qFRIAoc16KsmeOuto+ecGH89Hq+pMIWNvYgwhzNp7574z2tz2EZvQsA5mXH0S0ZlUbNxt50JqqZ1BFTUmmuyy1m5SnXAlUxnYn+8oWpw3HcB0oSDLsrJig9ynWrPvduhxxl+DzokYIc/m/OjXYjfBKlTZ4C02WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by IA1PR11MB7824.namprd11.prod.outlook.com (2603:10b6:208:3f9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Tue, 23 Jan
 2024 23:24:48 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f%3]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 23:24:48 +0000
Message-ID: <773deddc-54e6-44b4-9ea1-16a314474abe@intel.com>
Date: Tue, 23 Jan 2024 15:24:45 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/guc: Update to GuC firmware 70.19.1
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>, "Welty, Brian"
 <brian.welty@intel.com>
References: <20240122213708.1841488-1-John.C.Harrison@Intel.com>
 <20240122213708.1841488-3-John.C.Harrison@Intel.com>
 <069f1653-d286-4bce-84f7-e2198ba0c5e8@intel.com>
 <wqlmadoyl4ifwavwaihupuc66nygylkxijofftrphjc4bv5djz@63tydn37unxg>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <wqlmadoyl4ifwavwaihupuc66nygylkxijofftrphjc4bv5djz@63tydn37unxg>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::15) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|IA1PR11MB7824:EE_
X-MS-Office365-Filtering-Correlation-Id: 04580942-6a79-4234-d192-08dc1c6a7d9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Se245v3gGE96HG3Z/MQ/dTsotoM96JV5NJOLnXF/oRhZLCFeWfaG9KAifBWukWhfXJLLkeA9jxAl6DAVTb0j/muBnq9HzHB0FY05fbKOKoqpSe0xEXJYMqIFhJOTWxJ6TeYcve67T+WStjd7buLm0YPdDvjK06sulNAIAnFR33pTn6XQ/pefp0+y7lKZrSkQVft94gKzrrxkMxvc44ZxgOgmJ4lq2h9r5V7a74udMIPO+8VaaXWtUgHuj+kxgrdcxjN4SITpilFsnRKr06So+hG84GCq7AGORvpGjVzIVFzl4CZMToKBbhQgQkyUoL/cQ/vKckoklO2m8ZfLJ9kf1g7u7lvmlZd4StZ41rBxbtRMrz5fL1hQUNajp/O3tC2b7GXcIvl5SbBhns4UhJdkV5jTXnC7aeBOMPea4Ou2dvFl59rgxqfe2yYM4Nx0bQIuUb4bUEPwAZIqPRM0SvvUGJJmGNdQ8E08/1ohSjjYdMjYWHd5U6L81yrmUhf/RqNQ67E9SykWI/IexlA7nUU0D/9sLj6DZkCskS34YBzZXRJpEPSiTci8ClR8oilfvPEw5y+wsu+PxpOQ/5ZQqOyJ61GL+N6BsS8W6qyfzv5M7SyTXoZI6ST3dvadUuZHzbVmwJ6TCRp1tB4aLiMA7nUjpw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(396003)(376002)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(31686004)(36756003)(86362001)(82960400001)(41300700001)(31696002)(110136005)(38100700002)(478600001)(6512007)(2906002)(83380400001)(6506007)(53546011)(66946007)(26005)(2616005)(66476007)(5660300002)(6636002)(66556008)(6666004)(316002)(6486002)(8676002)(4326008)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dW5RQmxZZEdZMVA2dnR1MlA3ajFnRVBIU2srN0FFOWRlU0tuYXU4VjRFS3BT?=
 =?utf-8?B?SXVubU0yN0p0M3pxUTE1ZjQrNkYzakRCV21KV0Vrd3pKelQyeGJ2RTZTenI3?=
 =?utf-8?B?elJtZ2tXOERYNkxxc29PS0ladkhGL1JHdWJHZVNCV05YTWVGRTF6a0dDK1lM?=
 =?utf-8?B?UEJlUjhvYUtCdnNWdnczU2toaUhhZFptck8yM3FCT3VnV01HcmszSmN1eHZ4?=
 =?utf-8?B?ZnRqQnFIaTRPbE0wMzJUQzhFeHNNLzZMK21WdnVnYXEzNXAvQXB3UDBockpG?=
 =?utf-8?B?c251SWlxb2pYcWhxZVJwSEk5cnA1RXNwdm03ZTdSMm9hSTBDOXNFMUE0cS9W?=
 =?utf-8?B?dmxKVTFEaEg3MUJQcDMwSXRrbUVlZjFxemRYdmd1L2lISldwVUNkV0JNSVNh?=
 =?utf-8?B?WC90R2RXMmJiNUVRSTlvU3EvRFRENm1IMFlPeW9Ja1ZacjV0SFUvRlhkd2R6?=
 =?utf-8?B?akZaM0pWNHA0UGZRNCt1S2dqSGNCdjM1OFRqL1R1UFN3M3A2cFNjaGM5Tlcv?=
 =?utf-8?B?RWo2bE9BclF2bEgvbTR2aUt1cE9SZXRzVDJNSUVPK1cxcEh3cmdOaVpyWHor?=
 =?utf-8?B?OHYvay9hR1dRVUV4L1pSV1NRTXlGUlovOWdKQWNZYTVjVWUyWTBTVjZHbnNi?=
 =?utf-8?B?NHZlWWtRa0YzV3VXakRCbjI5K2gzNXdVek1TQXVJZEdZQXZqUW9aK0FmWFg3?=
 =?utf-8?B?SFl0VFd0ZGdEVVFNVDNBTVByYzkwYStpbDg4UGZxVU9jQWNVL202NGpISVdm?=
 =?utf-8?B?eTNlUVRvZ3ozU3BwaTRSOHF1TU5TZFRDK0Z3dUpmQnRuVU9LZ3RCRSs1cmNK?=
 =?utf-8?B?UUw2ZmM5S2tsVXJyN2NmV2xJNDcvcHlBWXlYbDgvbEtXaWh1eTlWYmFTODBt?=
 =?utf-8?B?RW10dFpwbUxXcVVsQjh0OWFsQWp6NXlNb2o0OTFDcSs1RURTOGZjaEtWWFN1?=
 =?utf-8?B?RGMzZUhJVEFNa0dONm9oRHZRUVF0VnE3K0dwNWlyaDk0bTVWTWdWNVN3YkNt?=
 =?utf-8?B?cnoydHF5R3pFTGxyUUFURmZWVzdDZVljcTR5L05EUHJRbGNrb1FpSGRSSnZn?=
 =?utf-8?B?MzVSRHB6NEsxc1JOYjJlYWpGMUx6bXlJUUs3YURnUjJQVnltM3d4Z20xMkM1?=
 =?utf-8?B?THU2UDJEeWk5VjEwRlJ6N2FsYnhKODFOTUxWNWEydUVJMTNia0xpYWRrTXpX?=
 =?utf-8?B?TjRlZGZaSU1YNktzelhhdXVWQmt1NE5EdkZpbjlUdkZLeHZGcEt2eEY5RVFZ?=
 =?utf-8?B?Z3lOUjhabjJZSWhmMjdhSjZPeFgvNE9NNS9lNGp0TFJSZVp3VUw5U0VyMzVj?=
 =?utf-8?B?N2Z3U0NNSUE3K2gxZnFyZDhRRFVzYWJVUWQ1TExJMDBqeUhjTXhDUW8wUzJS?=
 =?utf-8?B?WHp6SXF3dHZOTjVYWWd2ZmZoY3pzTjBXSURjcFNVc25UZVB6em1tUHFVM2pU?=
 =?utf-8?B?N2VDdXZKMFR0V2FkTG5ob1VZZW94SzlGY01hVWJzNUJQMlVaTVFXY2FsUzhR?=
 =?utf-8?B?UHE2V0FnMlZycFh5Z29UeVZ0cXZvTytvUjEyTkErT0MrcWUwWEE5NXNTay9z?=
 =?utf-8?B?cU9yVTE5cVMxWE1kOVZHZjJueVppbHBiZ2c0UmRXaUNQV21VMWtTNDQybndJ?=
 =?utf-8?B?OEtTZkhpNkI5YlVQUXhzSlNsOXkyZ3EzaXQ4dHdySW8yNjkrcWpLby93ZTNx?=
 =?utf-8?B?TmR3Kzc4bnVXTTlzRU8rbGRWWDZKVGh2K0lqRlJhR0djdllBNTl1Tk5RUFZ0?=
 =?utf-8?B?TlRhUjhaUGlBTnlmU3cvZ3RaT0Q2Z0lpQnA0RzVvRS9WRndBNjVmRnYvSjAz?=
 =?utf-8?B?OU5hN3hqaW11eDlzdk45ZW9LY1lYcEhBTGl0TkowRytKZTNJRTd0Q3luUk9L?=
 =?utf-8?B?TzFVU2VmV1BJM1lyM3RtaEUySTBLSk9WWHhSNXhlS0tLczJkTmZlMWo5bnBv?=
 =?utf-8?B?UzkwcS9YSHN1UiszMzg3VUpiV0h2aVNUVVNLY1gxSlhCdWhxNEw0d0VSSGFi?=
 =?utf-8?B?ajNLTmxkRTZQbU1xeVNuNVBQNUU3elA2WTFhWEVwcHRuc3lOUlM4Wm82ZXhI?=
 =?utf-8?B?dW1hQmU5UHpaSDdUYVRmTmRZbzR4dW1Vb0p1czJ0bW1QTjJITm1sd0d3ZGZI?=
 =?utf-8?B?VENqZXI1UGNQL2lmdndnOU1ValNhNXQzK09GUDRtMUhLd20rMmxpMVRpL1Z0?=
 =?utf-8?B?TlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04580942-6a79-4234-d192-08dc1c6a7d9f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 23:24:48.1015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jltLZ9WhEKNanPzWp10QPRuKOCkuEqWpniHOkuk+liGcqc3mC9OhpW81p/zkj3NIkQ+vWbIs3/LNpB1KPw83up5vpZnn0TaMVSP2uDrsXBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7824
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
Cc: Intel-Xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 1/23/2024 08:41, Lucas De Marchi wrote:
> On Mon, Jan 22, 2024 at 02:14:56PM -0800, Welty, Brian wrote:
>> On 1/22/2024 1:37 PM, John.C.Harrison@Intel.com wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> UAPI compatibility version: 1.8.1
>
> what exactly is this? We don't seem to track it anywhere in the driver.
It is XE_UC_FW_VER_COMPATIBILITY. This is the version number that should 
be looked at for tracking what features are or are not available. The 
raw file version (e.g. 70.19.1) is XE_UC_FW_VER_RELEASE but that is not 
accessible from a VF and cannot be exported to UMDs because again, it 
would break in an SRIOV type scenario. The file version should only be 
used for feature checks when actually loading the GuC itself (which can 
only be done by native/PF), e.g. what to put in the ADS, what load time 
w/a's should be enabled, etc.

>
>>
>> I've wondered for awhile why was lagging behind here....
>>
>> Reviewed-by: Brian Welty <brian.welty@intel.com>
>>
>>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_uc_fw.c | 16 ++++++++--------
>>>  1 file changed, 8 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>>> index d3f0fe2101a7..8da6cbb8c9e2 100644
>>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>> @@ -103,14 +103,14 @@ struct fw_blobs_by_type {
>>>  };
>>>  #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)            \
>>> -    fw_def(METEORLAKE,    major_ver(i915,    guc,    mtl, 70, 7, 
>>> 0))    \
>>> -    fw_def(DG2,        major_ver(i915,    guc,    dg2,    70, 5, 
>>> 0))    \
>>> -    fw_def(DG1,        major_ver(i915,    guc,    dg1,    70, 5, 
>>> 0))    \
>>> -    fw_def(ALDERLAKE_N,    major_ver(i915,    guc,    tgl, 70, 5, 
>>> 0))    \
>>> -    fw_def(ALDERLAKE_P,    major_ver(i915,    guc, adlp,    70, 5, 
>>> 0))    \
>>> -    fw_def(ALDERLAKE_S,    major_ver(i915,    guc,    tgl, 70, 5, 
>>> 0))    \
>>> -    fw_def(ROCKETLAKE,    major_ver(i915,    guc,    tgl, 70, 5, 
>>> 0))    \
>>> -    fw_def(TIGERLAKE,    major_ver(i915,    guc,    tgl, 70, 5, 0))
>>> +    fw_def(METEORLAKE,    major_ver(i915,    guc,    mtl, 70, 19, 
>>> 1))    \
>>> +    fw_def(DG2,        major_ver(i915,    guc,    dg2,    70, 19, 
>>> 1))    \
>>> +    fw_def(DG1,        major_ver(i915,    guc,    dg1,    70, 19, 
>>> 1))    \
>>> +    fw_def(ALDERLAKE_N,    major_ver(i915,    guc,    tgl, 70, 19, 
>>> 1))    \
>>> +    fw_def(ALDERLAKE_P,    major_ver(i915,    guc, adlp,    70, 19, 
>>> 1))    \
>>> +    fw_def(ALDERLAKE_S,    major_ver(i915,    guc,    tgl, 70, 19, 
>>> 1))    \
>>> +    fw_def(ROCKETLAKE,    major_ver(i915,    guc,    tgl, 70, 19, 
>>> 1))    \
>>> +    fw_def(TIGERLAKE,    major_ver(i915,    guc,    tgl, 70, 19, 1))
>
> are all of these in linux-firmware repo?
Not in the upstream repo yet. I'm about to start that process.

John.

>
> Lucas De Marchi
>
>>>  #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)        \
>>>      fw_def(METEORLAKE,    no_ver(i915,    huc_gsc, mtl))        \

