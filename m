Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3C5C77B7C
	for <intel-xe@archiver.kernel.org>; Fri, 12 May 2023 08:18:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D5BB10E1AC;
	Fri, 12 May 2023 08:18:52 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5FE10E13A
 for <intel-xe@lists.freedesktop.org>; Fri, 12 May 2023 08:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683879529; x=1715415529;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GldSSGpA8ZMirYGa1arGo/XNelilhAn9lttI+U4psgM=;
 b=ippA9I8WBCv+8O4JhDQLLw1z7KKmmUzxgaBvCsnlkUJipFcLLx/IQnBO
 3AIMW03yu84IJaQ4RdC/3guswl60P+oGaPpNs0/09NuZhUZn3PWbrAkme
 mpxV4oiOzAhmafanzvUaHzWZ/v2NrM49oIXPuM4EGvrD0kTSGdgGLmmM9
 HhzkZ3cLAKrNROjXzbBjJOsIJ1pl1auUQR3NWjat1tlJofqQ++Wk8KHGf
 0k9CShD54hYUv04H3EaRk4VCahxlMhEliyWC7kVoBWvcxSHEVKS6Eptep
 s8Iml8mq4BChvdR2jaP2ze2bKn8UlXj8J1E5R2SJHGHg1jIR+/vjIGyGg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="414103363"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="414103363"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 01:18:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="694143883"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="694143883"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 12 May 2023 01:18:44 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 01:18:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 01:18:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 12 May 2023 01:18:44 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 12 May 2023 01:18:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VLQX8T6VU+ClPYU8D+3gkuKZvFmhM0/CHDWxGsMUGrsayhCVEpxL2Kv2OqQfSoVwMSwJYE74fAldHi1JMf1udSlPXA7nu3cZa5wfhot2tefiJUsdv6l7LlyZIgo/hKWU8udV8AvosEMhc1S9tAL7EFeUB4XBf8UBgX8RkxcsIQ0pU0DOh4uw1TNxd08u2Msq9ovPsAsBLivNVjuM1DB6DunVd7+TTdMzXaBQM6oWOjLQwgfDVxRWqlLacfsebv67e5hNbdAM+UNgt8r5L5UhTkniFQs0Cfnp7VVXazb63fzabd7y8pw8Ex8oz1E6k1OFq4STJ+YSt7RB1DlV0iAW1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bdu7b8n+gfBVQD+b1hYHa9aPb030ocSEgkm3I5yMGEw=;
 b=MFUVqEYqlb5Gyc7Y9myCJa1IaOl337KikIwMirt6yIASGjltmbcIf2vHa+nkv01f/uXfv+2oWDJnFpvS5mzA9d7XOBcUsHaFDWXV86Qmsl/chQ1XAEk/vVypEMXrOmjTCMrpAyyiEgloMZ+itKMEfRDXEfjeYhhpXVXXlIEflhW7EGM8t08sJwBCoZboOssrEc/RWJAPy8exD2/qZ5B0a1kGqDD1PJoyF1e1jRHfyFXL1bxpnfzq0p19w6b+YyiM5k8C+uhH55F5Y9fXdTFUuBrXiCuKhrO3KiRjAYdHxJj9OPbQx8Y77HUJ92BciAD4juA8nDr3EckWA+bLDsAbSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by MW4PR11MB7080.namprd11.prod.outlook.com (2603:10b6:303:21a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.31; Fri, 12 May
 2023 08:18:41 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::962f:b14d:4e3b:63b3]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::962f:b14d:4e3b:63b3%3]) with mapi id 15.20.6387.022; Fri, 12 May 2023
 08:18:41 +0000
Message-ID: <2c577747-632f-1fa5-a689-525b66a67d7e@intel.com>
Date: Fri, 12 May 2023 13:48:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Content-Language: en-US
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230512052050.1308879-1-riana.tauro@intel.com>
 <MW4PR11MB7056296C37C1951DB18C978EB3759@MW4PR11MB7056.namprd11.prod.outlook.com>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <MW4PR11MB7056296C37C1951DB18C978EB3759@MW4PR11MB7056.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::19) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|MW4PR11MB7080:EE_
X-MS-Office365-Filtering-Correlation-Id: d56df019-eac7-492a-9fc8-08db52c17e68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jle0wxieqC4KZ5+3/WvvIqzCn2/qO2HcwZ1NFMEHat/AW9jgos8MQwGYNbReKVPqGUA3+HHY6Mpp328kGTLxi5f4yGjl+XzzurezhT3tj8+9+/tE96Rm7uwyseVSxYJP5c5+SOwPC9JKx6k+TY7BnLDbElQbgyocbkpI48jEE899T8sKcwfU+ESaTzgT0z9rx0HAVOxdwVyD6DED60LOMAPB6WTe3AhoFrpP0jbYqbHhmSn5v6v4eczsgTFTdrxP3pIwuNzQ1X/woJnPyrc6ItckFwO00xny+J0LWzhlg5U5EJU+e6CL8twlSI4PS8+xN93zoSP4NjKX8BmZ7oZNKWn29fvOh0vJso293kBgbEiEXOIr9FLK/ZipUPwzaB+OC0BjcV3xtExsyAcL0gcyEkB+sEuI+VgVejXfoupr7I1QpAvMVdijnj+xtwqID7xJpsMR/DUPNLIrsEV1ttzSx3OrVQPmqC8MaMHzlPWEg5OPf/XaLdePa+Ioj4wbbWYNlty+VwQfWn+osHuAgE0P+ibPkZfriL0gUG3+1VxZP+Axfp24dKbecZgJWVeSsGV9FeVnfQUamAnU0wT/eGOndV3VgnUmjmcO1bZBYeu/ey3Q/UtkU826KYoT9q+jFtmg+gznXyriYZPRQU3juMGXn/K+hFBtHVcpm+MGbvLk0yg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(346002)(396003)(376002)(136003)(451199021)(86362001)(36756003)(31696002)(2906002)(478600001)(66946007)(6486002)(66556008)(54906003)(6666004)(316002)(66476007)(110136005)(4326008)(186003)(44832011)(41300700001)(5660300002)(8676002)(30864003)(38100700002)(82960400001)(6506007)(8936002)(53546011)(26005)(6512007)(83380400001)(107886003)(2616005)(31686004)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RU1XMk9XWVVnMzFtSWNRbzRBTTRKUzkxMmhSTzlrNDBsNm9DWFZ4VzFNV29v?=
 =?utf-8?B?MVZpY3VzTHEydzBsbGVoNWR4cmtrK3Z4eHZZTUtSSjZ4WFU3VnJzSlNIVGNo?=
 =?utf-8?B?Um9OODRqNlE5THJlaU1iL29WclVuZDJWYXQwclNzVnZ5K1lzZWhOY0Fuc3B3?=
 =?utf-8?B?NDhINTNwdlBURk14SjcvbkRqMTFtWGZzK1F6dFZ1Zkx2bEpRUURiZnU0S0Nw?=
 =?utf-8?B?KzltWm56VlNTTjk5WG1UMFYyY0drRTFYVzRnNXdYOGdJVjNZdTQyQzdCSDR1?=
 =?utf-8?B?WDBnSSt2U1p2L2taSVNubWZUa0ZMN1Q3TTUwOUY0dGRYbmJJQjJLVWtETkZX?=
 =?utf-8?B?RG0vOGYvVDFDK3N3K1pVV2RGM0Rsanh5ckFRSGRNQS9tSGVjYi9ReFYxNk1v?=
 =?utf-8?B?K2VYL0RobHYzVUZhMkl2QXZjdk5NbzhVcDhCb0dOdEJSWkF1SFdjS3J2RHhw?=
 =?utf-8?B?ajcxclFPcDJ1L1JpcDdyNXlSckVQbXVuMTFWMHlxR2lFb3QxVWgrRWdybUtv?=
 =?utf-8?B?KzRLS2VEbzFtNU85OElOQ2JrVVMweVR1U0xyem5HSFNtSWQrYzMxZkxFSEYy?=
 =?utf-8?B?cXBJakhjRGpVZnhVR2FrbWRYVytTaHlYSGZ4Q2pDK3NFMmdDckpiYUkrWTJQ?=
 =?utf-8?B?R1dCd1ZxNWRLaEprcWxyMncxT0R6WUp1blN6Q1lMbWxsUkdndXhzMGNyNFBW?=
 =?utf-8?B?ejBLMnJCdkZhcTB5OTlqQ1ZaMjczRS9GTmc1ZTFWbFdTRlRZSkRrc3JndW9u?=
 =?utf-8?B?d01HVitDd2RDRWRrWTdoeGszemN1ZmVRak9JeGMzTUsreHB0am5CMnZZQ0tB?=
 =?utf-8?B?RS9jSGYxUkErNk5jRnJ5c3hKbURVdVpJczZuQ0krZWVteVFOeEZ2QnB4em5k?=
 =?utf-8?B?eSt5QWdzSkRmb1Exd1l1anY2eUNoSlNRdVJBdFhKdDdGR0Y0SWJYbUJSU0Fv?=
 =?utf-8?B?K2p2SGVVMDFZSEhZR1Q5Y0NFRHpzODA4TmR5aTU4QSsyRHRxUFoyR2s5NjFQ?=
 =?utf-8?B?YThMWVVlNFJSNnIyWnJwb0ppNEIxd1lxeURBSFJzcGtZU2ZyNE1KTyt4MUVj?=
 =?utf-8?B?Qk4zUHFONG1UaGViUUlZVE5nakFwTW5pVEE1Q2JQTENPdlgvZ0tqb05OUjB1?=
 =?utf-8?B?aXB6aVpiV2ZuL1ZoSjQ5OG1WWnlFL1loTVg2VG5hb1VJRlRVL1FmZkgrRHR2?=
 =?utf-8?B?Vk9RUXhRQkxMODN4TzU4ZFJGa1o4WHN5TlZuOGFzMmxqVmNGVVZUd2NtQ09q?=
 =?utf-8?B?bllTbCtZeSs3N2l2ZTJjTWRxdGhIQW9Mdnk5K1JINFdtcHBJTjJWaE9EaHp4?=
 =?utf-8?B?ckFhOEo4RjlBZlFDQzlRQ2tRd0VXREtuT3o1Nk1DSGh1Y29ncVpPcGZWTFBF?=
 =?utf-8?B?TjlFWVhJTjFqTjJleEl2Umk3TG9wOU42dTBhUHBUaHhYZUxhRUN3R1RYV1VF?=
 =?utf-8?B?THNzcEp2WGhEVzNzZkdCRXpqdllRc0R3SHZ5QzJWbm1UTE5VUWNsMEUyWENC?=
 =?utf-8?B?Y1NjY2F5L0QzZ1czTkFGL0Vka09FZnNpdHpvaFhrVHQxSE1zMHFaN2gvZWxJ?=
 =?utf-8?B?OEdldkp5OWJXVXJjSzNiNTFLQnAzaWM5U2poZ0pOb3hyUjEwdDhwREliL2FY?=
 =?utf-8?B?TjJ4Yk0vYWl6QTVkY0JhemZDUWkzdXhBNlJtd2ZVUzVYV1N4Qml3YTlJN05Y?=
 =?utf-8?B?ckJ3WW42YUM4Q29ZdkphMVUvaDNJLzBPNnNwTUkwcE5XZHJ3MWJ2SGM2WkQz?=
 =?utf-8?B?OW1DUGhySnZ3ZVF3bDJDM3g1ZThacWd4bWdYMnpiV2RmVGt0WVA0aE9Jdm0z?=
 =?utf-8?B?QjRPZHA1cXg0L1VUUmhmdnMvU2wwOTNRRDRqMjlxR2JtbW91WkNwNzdCMWh5?=
 =?utf-8?B?blhhR3RUeHFmK2VuNDNRVjJGK3lyLzFzWWFlSHgybWVyUFVuc0VqVUM5bHlv?=
 =?utf-8?B?dFlhdDV1dmhiSldoTnBzTEhFTzA3Mk9CZ3gwNE4wOGI4RVZKRkZLRUl6UVo0?=
 =?utf-8?B?UGl5dm50V1J0ekg3K2pLaHNNQS84eVY3WFk1UDhXdzA4V1dabXpvQmIyOHBO?=
 =?utf-8?B?RktEYkFxeEh5TjNSSTRIQ0lBdUVMUHk5UXAyaC9PTEpYaW1EQkxUUmJJNXNr?=
 =?utf-8?Q?zmoNgn6yahxRFgy/nEDIMwRkZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d56df019-eac7-492a-9fc8-08db52c17e68
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 08:18:40.9697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lTb64FcW8GubEDwG3NwYjxuwhf9LnN0+5nOAyZtJ+Cric2BX0rxy1lRUaZ2O+CDkVetzBGqgAbv+Pw7OWQfn4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7080
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH] drm/xe: add a new sysfs directory for
 gtidle properties
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
Cc: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 5/12/2023 1:35 PM, Ghimiray, Himal Prasad wrote:
> 
> 
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Riana
>> Tauro
>> Sent: 12 May 2023 10:51
>> To: intel-xe@lists.freedesktop.org
>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Vivi, Rodrigo
>> <rodrigo.vivi@intel.com>
>> Subject: [Intel-xe] [RFC PATCH] drm/xe: add a new sysfs directory for gtidle
>> properties
>>
>> Add a new sysfs directory under devices/gt#/ called gtidle to contain idle
>> properties of GT such as name, idle_status, idle_residency_ms
>>
>> v2: abstract using function pointers (Anshuman)
>>      use device_attr (Badal)
>>      move rc functions to guc_pc
>>      change name to gt_idle (Rodrigo)
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile           |   1 +
>>   drivers/gpu/drm/xe/xe_gt.c            |   5 +
>>   drivers/gpu/drm/xe/xe_gt_idle.c       | 134 ++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_idle.h       |  18 ++++
>>   drivers/gpu/drm/xe/xe_gt_idle_types.h |  39 ++++++++
>>   drivers/gpu/drm/xe/xe_gt_types.h      |   4 +
>>   drivers/gpu/drm/xe/xe_guc_pc.c        |  87 +++++++++++------
>>   drivers/gpu/drm/xe/xe_guc_pc.h        |   5 +
>>   8 files changed, 261 insertions(+), 32 deletions(-)  create mode 100644
>> drivers/gpu/drm/xe/xe_gt_idle.c  create mode 100644
>> drivers/gpu/drm/xe/xe_gt_idle.h  create mode 100644
>> drivers/gpu/drm/xe/xe_gt_idle_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 84ad0e949044..93bec17ee0de 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -44,6 +44,7 @@ xe-y += xe_bb.o \
>>   	xe_gt.o \
>>   	xe_gt_clock.o \
>>   	xe_gt_debugfs.o \
>> +	xe_gt_idle.o \
>>   	xe_gt_mcr.o \
>>   	xe_gt_pagefault.o \
>>   	xe_gt_sysfs.o \
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c index
>> 0d4664e344da..9e1f7343f256 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -18,6 +18,7 @@
>>   #include "xe_force_wake.h"
>>   #include "xe_ggtt.h"
>>   #include "xe_gt_clock.h"
>> +#include "xe_gt_idle.h"
>>   #include "xe_gt_mcr.h"
>>   #include "xe_gt_pagefault.h"
>>   #include "xe_gt_sysfs.h"
>> @@ -381,6 +382,10 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>>   	if (err)
>>   		goto err_force_wake;
>>
>> +	err = xe_gt_idle_init(&gt->gtidle);
>> +	if (err)
>> +		goto err_force_wake;
>> +
>>   	/* XXX: Fake that we pull the engine mask from hwconfig blob */
>>   	gt->info.engine_mask = gt->info.__engine_mask;
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c
>> b/drivers/gpu/drm/xe/xe_gt_idle.c new file mode 100644 index
>> 000000000000..0060d8584485
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>> @@ -0,0 +1,134 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_managed.h>
>> +#include "regs/xe_gt_regs.h"
>> +
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_gt_idle.h"
>> +#include "xe_guc_pc.h"
>> +#include "xe_mmio.h"
>> +
>> +/**
>> + * GT Idle:
>> + * ================
>> + *
>> + * Provides sysfs entries for idle states of GT
>> + *
>> + * device/gt#/gtidle/name - name of the state
>> + * device/gt#/gtidle/idle_residency_ms - Provides residency of the idle
>> +state in ms
>> + * device/gt#/gtidle/idle_status - Provides current idle state  */
>> +
>> +static struct xe_gt_idle *kobj_to_gtidle(struct kobject *kobj) {
>> +	return container_of(kobj, struct gtidle_kobj, base)->gtidle; }
>> +
>> +static ssize_t name_show(struct device *dev,
>> +			 struct device_attribute *attr, char *buff) {
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt_idle *gtidle = kobj_to_gtidle(kobj);
>> +	ssize_t ret;
>> +
>> +	ret = sysfs_emit(buff, gtidle->name);
>> +
>> +	return ret;
>> +}
>> +static DEVICE_ATTR_RO(name);
>> +
>> +static ssize_t idle_status_show(struct device *dev,
>> +				struct device_attribute *attr, char *buff) {
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt_idle *gtidle = kobj_to_gtidle(kobj);
>> +	ssize_t ret;
>> +
>> +	gtidle->idle_status(gtidle);
>> +	ret = sysfs_emit(buff, gtidle->state);
>> +
>> +	return ret;
>> +}
>> +static DEVICE_ATTR_RO(idle_status);
>> +
>> +static ssize_t idle_residency_ms_show(struct device *dev,
>> +				      struct device_attribute *attr, char *buff) {
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt_idle *gtidle = kobj_to_gtidle(kobj);
>> +	ssize_t ret;
>> +
>> +	ret = sysfs_emit(buff, "%llu\n", gtidle->residency_ms(gtidle));
>> +
>> +	return ret;
>> +}
>> +static DEVICE_ATTR_RO(idle_residency_ms);
>> +
>> +static const struct attribute *gt_idle_attrs[] = {
>> +	&dev_attr_name.attr,
>> +	&dev_attr_idle_status.attr,
>> +	&dev_attr_idle_residency_ms.attr,
>> +	NULL,
>> +};
>> +
>> +static void gt_idle_kobj_release(struct kobject *kobj) {
>> +	kfree(kobj);
>> +}
>> +
>> +static struct kobj_type gt_idle_kobj_type = {
>> +	.release = gt_idle_kobj_release,
>> +	.sysfs_ops = &kobj_sysfs_ops,
>> +};
>> +
>> +static void gt_idle_fini(struct drm_device *drm, void *arg) {
>> +	struct gtidle_kobj *gtidle_kobj = arg;
>> +
>> +	sysfs_remove_files(&gtidle_kobj->base, gt_idle_attrs);
>> +	kobject_put(&gtidle_kobj->base);
>> +}
>> +
>> +int xe_gt_idle_init(struct xe_gt_idle *gtidle) {
>> +	struct xe_gt *gt = gtidle_to_gt(gtidle);
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	struct gtidle_kobj *gtidle_kobj;
>> +	int err;
>> +
>> +	gtidle_kobj = kzalloc(sizeof(*gtidle_kobj), GFP_KERNEL);
>> +
>> +	if (!gtidle_kobj)
>> +		return -ENOMEM;
>> +
>> +	err = kobject_init_and_add(&gtidle_kobj->base, &gt_idle_kobj_type,
>> gt->sysfs, "gtidle");
>> +	if (err)
>> +		goto exit_kobj;
>> +
>> +	gtidle_kobj->gtidle = gtidle;
>> +
>> +	gtidle->residency_ms = xe_rc6_residency_ms;
>> +	gtidle->idle_status = xe_rc_status;
>> +	sprintf(gtidle->name, "gt%d-rc\n", gt->info.id);
>> +
>> +	err = sysfs_create_files(&gtidle_kobj->base, gt_idle_attrs);
>> +	if (err)
>> +		goto exit_kobj;
>> +
>> +	err = drmm_add_action_or_reset(&xe->drm, gt_idle_fini,
>> gtidle_kobj);
>> +	if (err)
>> +		goto exit;
> AFAIU drmm_add_action_or_reset takes action in case of failure to add. You are already removing sysfs files and doing kput in
> action.  No need to goto exit simple return of err is ok.

Thanks Himal for pointing this. Will fix it
>> +
>> +	return 0;
>> +
>> +exit:
>> +	sysfs_remove_files(&gtidle_kobj->base, gt_idle_attrs);
>> +
>> +exit_kobj:
>> +	kobject_put(&gtidle_kobj->base);
>> +	return err;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h
>> b/drivers/gpu/drm/xe/xe_gt_idle.h new file mode 100644 index
>> 000000000000..ac0ab970a3f7
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
>> @@ -0,0 +1,18 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GT_IDLE_H_
>> +#define _XE_GT_IDLE_H_
>> +
>> +#include "xe_gt.h"
>> +#include "xe_gt_idle_types.h"
>> +
>> +int xe_gt_idle_init(struct xe_gt_idle *gtidle);
>> +
>> +static inline struct xe_gt *gtidle_to_gt(struct xe_gt_idle *gtidle) {
>> +	return container_of(gtidle, struct xe_gt, gtidle); } #endif /*
>> +_XE_GT_IDLE_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_types.h
>> b/drivers/gpu/drm/xe/xe_gt_idle_types.h
>> new file mode 100644
>> index 000000000000..bc9c59249b6c
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle_types.h
>> @@ -0,0 +1,39 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GT_IDLE_TYPES_H_
>> +#define _XE_GT_IDLE_TYPES_H_
>> +
>> +#include <linux/kobject.h>
>> +#include <linux/types.h>
>> +
>> +/**
>> + * struct xe_gt_idle - A struct that contains idle properties based on
>> +gt  */ struct xe_gt_idle {
>> +	/** @name: name */
>> +	char name[16];
>> +	/** @state: current idle state */
>> +	const char *state;
>> +	/** @cur_residency: raw driver copy of idle residency */
>> +	u64 cur_residency;
>> +	/** @prev_residency: previous residency counter */
>> +	u64 prev_residency;
>> +	/** @idle_status: get the current idle state */
>> +	void (*idle_status)(struct xe_gt_idle *gtidle);
>> +	/** @residency_ms: get idle residency in ms */
>> +	u64 (*residency_ms)(struct xe_gt_idle *gtidle); };
>> +
>> +/**
>> + * struct gtidle_kobj - A kobject struct that connects the kobject and
>> +xe_gt_idle  */ struct gtidle_kobj {
>> +	/** @base: The actual kobject */
>> +	struct kobject base;
>> +	/** @gtidle: A pointer to the struct xe_gt_idle */
>> +	struct xe_gt_idle *gtidle;
>> +};
>> +#endif /* _XE_GT_IDLE_TYPES_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
>> b/drivers/gpu/drm/xe/xe_gt_types.h
>> index 7c47d67aa8be..90b2d34efe5b 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -7,6 +7,7 @@
>>   #define _XE_GT_TYPES_H_
>>
>>   #include "xe_force_wake_types.h"
>> +#include "xe_gt_idle_types.h"
>>   #include "xe_hw_engine_types.h"
>>   #include "xe_hw_fence_types.h"
>>   #include "xe_reg_sr_types.h"
>> @@ -287,6 +288,9 @@ struct xe_gt {
>>   	/** @uc: micro controllers on the GT */
>>   	struct xe_uc uc;
>>
>> +	/** @gtidle: idle properties of GT */
>> +	struct xe_gt_idle gtidle;
>> +
>>   	/** @engine_ops: submission backend engine operations */
>>   	const struct xe_engine_ops *engine_ops;
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
>> b/drivers/gpu/drm/xe/xe_guc_pc.c index 72d460d5323b..e83283cbcb00
>> 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -14,6 +14,7 @@
>>   #include "xe_bo.h"
>>   #include "xe_device.h"
>>   #include "xe_gt.h"
>> +#include "xe_gt_idle.h"
>>   #include "xe_gt_sysfs.h"
>>   #include "xe_gt_types.h"
>>   #include "xe_guc_ct.h"
>> @@ -40,6 +41,9 @@
>>   #define GT_FREQUENCY_MULTIPLIER	50
>>   #define GEN9_FREQ_SCALER	3
>>
>> +/* Multiplier for  RC6 Residency counter in units of 1.28us */
>> +#define XE_RC6_MULTIPLIER	1280
>> +
>>   /**
>>    * DOC: GuC Power Conservation (PC)
>>    *
>> @@ -76,12 +80,7 @@
>>    *
>>    * Render-C states is also a GuC PC feature that is now enabled in Xe for
>>    * all platforms.
>> - * Xe's GuC PC provides a sysfs API for Render-C States:
>>    *
>> - * device/gt#/rc* *read-only* files:
>> - * - rc_status: Provide the actual immediate status of Render-C: (rc0 or rc6)
>> - * - rc6_residency: Provide the rc6_residency counter in units of 1.28 uSec.
>> - *                  Prone to overflows.
>>    */
>>
>>   static struct xe_guc *
>> @@ -580,11 +579,41 @@ static ssize_t freq_max_store(struct device *dev,
>> struct device_attribute *attr,  }  static DEVICE_ATTR_RW(freq_max);
>>
>> -static ssize_t rc_status_show(struct device *dev,
>> -			      struct device_attribute *attr, char *buff)
>> +u64 get_residency_ms(struct xe_gt_idle *gtidle, u64 cur_residency,
>> +		     u32 residency_multiplier)
>>   {
>> -	struct xe_guc_pc *pc = dev_to_pc(dev);
>> -	struct xe_gt *gt = pc_to_gt(pc);
>> +	u64 delta, overflow_residency, prev_residency;
>> +
>> +	overflow_residency = BIT_ULL(32);
>> +	/*
>> +	 * Counter wrap handling
>> +	 * Store previous hw counter values for counter wrap-around
>> handling
>> +	 * Relying on sufficient frequency of queries otherwise counters can
>> still wrap.
>> +	 */
>> +	prev_residency = gtidle->prev_residency;
>> +	gtidle->prev_residency = cur_residency;
>> +
>> +	/* delta */
>> +	if (cur_residency >= prev_residency)
>> +		delta = cur_residency - prev_residency;
>> +	else
>> +		delta = cur_residency + (overflow_residency -
>> prev_residency);
>> +
>> +	/* Add delta to extended raw driver copy of idle residency */
>> +	cur_residency = gtidle->cur_residency + delta;
>> +	gtidle->cur_residency = cur_residency;
>> +
>> +	/* residency multiplier in ns, convert to ms */
>> +	return mul_u64_u32_div(cur_residency, residency_multiplier, 1e6); }
>> +
>> +/**
>> + * xe_rc_status - get the current Render C state
>> + * @gtidle - xe_gt_idle instance
>> + */
>> +void xe_rc_status(struct xe_gt_idle *gtidle) {
>> +	struct xe_gt *gt = gtidle_to_gt(gtidle);
>>   	u32 reg;
>>
>>   	xe_device_mem_access_get(gt_to_xe(gt));
>> @@ -593,37 +622,33 @@ static ssize_t rc_status_show(struct device *dev,
>>
>>   	switch (REG_FIELD_GET(RCN_MASK, reg)) {
>>   	case GT_RC6:
>> -		return sysfs_emit(buff, "rc6\n");
>> +		gtidle->state = "rc6\n";
>> +		return;
>>   	case GT_RC0:
>> -		return sysfs_emit(buff, "rc0\n");
>> +		gtidle->state = "rc0\n";
>> +		return;
>>   	default:
>> -		return -ENOENT;
>> +		gtidle->state = "unknown\n";
>>   	}
>>   }
>> -static DEVICE_ATTR_RO(rc_status);
>>
>> -static ssize_t rc6_residency_show(struct device *dev,
>> -				  struct device_attribute *attr, char *buff)
>> +/**
>> + * xe_rc6_residency_ms - rc6 residency in ms
>> + * @gtidle - xe_gt_idle instance
>> + */
>> +u64 xe_rc6_residency_ms(struct xe_gt_idle *gtidle)
>>   {
>> -	struct xe_guc_pc *pc = dev_to_pc(dev);
>> -	struct xe_gt *gt = pc_to_gt(pc);
>> -	u32 reg;
>> -	ssize_t ret;
>> -
>> -	xe_device_mem_access_get(pc_to_xe(pc));
>> -	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> -	if (ret)
>> -		goto out;
>> +	struct xe_gt *gt = gtidle_to_gt(gtidle);
>> +	u64 reg, rc6_residency;
>>
>> +	xe_device_mem_access_get(gt_to_xe(gt));
>>   	reg = xe_mmio_read32(gt, GT_GFX_RC6.reg);
>> -	ret = sysfs_emit(buff, "%u\n", reg);
>>
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt),
>> XE_FORCEWAKE_ALL));
>> -out:
>> -	xe_device_mem_access_put(pc_to_xe(pc));
>> -	return ret;
>> +	rc6_residency = get_residency_ms(gtidle, reg, XE_RC6_MULTIPLIER);
>> +
>> +	xe_device_mem_access_put(gt_to_xe(gt));
>> +	return rc6_residency;
>>   }
>> -static DEVICE_ATTR_RO(rc6_residency);
>>
>>   static const struct attribute *pc_attrs[] = {
>>   	&dev_attr_freq_act.attr,
>> @@ -633,8 +658,6 @@ static const struct attribute *pc_attrs[] = {
>>   	&dev_attr_freq_rpn.attr,
>>   	&dev_attr_freq_min.attr,
>>   	&dev_attr_freq_max.attr,
>> -	&dev_attr_rc_status.attr,
>> -	&dev_attr_rc6_residency.attr,
>>   	NULL
>>   };
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h
>> b/drivers/gpu/drm/xe/xe_guc_pc.h index da29e4934868..a6abac189c8a
>> 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>> @@ -8,8 +8,13 @@
>>
>>   #include "xe_guc_pc_types.h"
>>
>> +struct xe_gt_idle;
>> +
>>   int xe_guc_pc_init(struct xe_guc_pc *pc);  int xe_guc_pc_start(struct
>> xe_guc_pc *pc);  int xe_guc_pc_stop(struct xe_guc_pc *pc);
>>
>> +void xe_rc_status(struct xe_gt_idle *gtidle);
>> +u64 xe_rc6_residency_ms(struct xe_gt_idle *gtidle);
>> +
>>   #endif /* _XE_GUC_PC_H_ */
>> --
>> 2.40.0
> 
