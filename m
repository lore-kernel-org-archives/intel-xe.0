Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE25C77B7A
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 07:49:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0187C10E082;
	Wed,  7 Jun 2023 07:49:04 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A509910E082
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 07:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686124141; x=1717660141;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=URBQEc26xuzGBdq5u66Tp9YWNtdvi95VEM2Hj/Zioe0=;
 b=K6K+l/r9HWhFnEpNCH0mpBbH80TZjgDBsPYP8/S3rmWN83xVI7xo/wLD
 jsObHoL8940JY/5vwhXgauHS1qZ/lsImIkuWfjfPkxnxsly63iD38gvIj
 LiaJzvrXPfB7DvWlGBU98TJ4e7f07526IX5ZrVT1459EkZUUb5GD+fRPJ
 09BJVf4wG/X1Fjh10ov8UYizuOkAecgn+R5ZJ7XbZe/e5WZx5HRW5GzAu
 oGWDw8RnNjn8tws40VQ4M8mBVX71cksoPg+qa1EQJCXoM7bZ8JTDCg1zr
 pN/KzzaT+mkNw3aTS+X67CqRcbNy1PQG7ASwul3qoqzBNbplZOwD4CLUN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="346528880"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="346528880"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 00:49:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="774405183"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="774405183"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 07 Jun 2023 00:49:00 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 00:48:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 00:48:59 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 7 Jun 2023 00:48:59 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 7 Jun 2023 00:48:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UvF1NQd0mMnxFvlIr67nylx/mNwYmdGd2fx7pFRu2vxAmCh+cdqTPUesBXrtPqhDo3UbCR04REQHz/5pxWQduhr2DueJ9NOh37ymqsw/Ypg3gca1sKlvyq3IyNJU+pj4DZhKqwPgMcWFVhVcm9Px5OFPhnL/HS1/J/2SVpCng0tt9QP0WXrVJ+PAwECtg6XWJIEH/bPuCdjt2lyaMyQji9joPDXYaRRYNESTQvJWkjU4STovMIwQ55F1hZ1I65J/jv3t/X8JEtuou3QMNW+7c2ylLCjk5TnRDzmZhV7WKQ2W6fJTqs0TOHlTN8cVz5BJmXaTaFq6SmgH9KLFJIFD3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KPvwUugLp6C9uvdALf+NSmTVOAwWdrEXug3gJO+8nu4=;
 b=aTUAchrKmjDX/+iR7LJkqjnUuSTnlneayT1noNet/Mw1Au1GxnqcWjDUP2T+56KiYI+bWWrNQHvZM1pOYlgLnUdMnDTowNAXVPQ9D1LuJ1b9yBx4WFUI31vss5bYkDWyuAGDsN1/5AqlnUJmnS7cxxsgQugU/aVuWg2vkgjj89w8AgsFv8vV0lp6+4YyDaMBZAfIz7DZeos5ibzRrCbH/0NByQ5TxUU2QF9Uz9XW20K9ZBTOLwcQoUqM3nWmpJXMKD/OZ0noD3XXGKY60DBpmjf5CYrgKLHcItDVFvk92GKM34Sff4I+8LgqBEOGgsEqHpX/Jm44WuXQUUMyKPdg7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by PH0PR11MB7446.namprd11.prod.outlook.com (2603:10b6:510:26d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 07:48:51 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::3fa8:dede:a9ab:fc5]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::3fa8:dede:a9ab:fc5%6]) with mapi id 15.20.6477.016; Wed, 7 Jun 2023
 07:48:51 +0000
Message-ID: <820cd0f9-f205-5736-ff15-ac690b3d0061@intel.com>
Date: Wed, 7 Jun 2023 13:18:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230524060020.2054682-1-riana.tauro@intel.com>
 <bba56f1e-e255-b716-13de-33c7340ff88d@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <bba56f1e-e255-b716-13de-33c7340ff88d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::13) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|PH0PR11MB7446:EE_
X-MS-Office365-Filtering-Correlation-Id: 75c595ed-8c05-45ca-3b23-08db672ba290
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XRzRc8zhg1MSJPdeQahYTYR3e+Ad6i8SV+dfDuGH+zIigHKpdhkF3eVkzUSBw1Z+4cnYBrEN9Q/gN7q2mjS/nmXvsxo3wEY3I8DEO6rGD3NRSy11o/bnuxBvkII1YHjEi6I+0/VIhAYZTc8YNoebWdVG0N2Mc1/CoNgG+LE2vl2atl9cCdb4zZpWBJdLAaq2jCJ2CPDIoh2NQe7RX1+HpYeh3Ts4FlHKlfkoPiBLhUxfKsarGt0UDJDaqbaEpM1EZ+JHMmzJyblWNlPiy9lB6IdiZntZbAvSgAEscbw9m9O/F4RbpHpq7OD39MiGRUR5Oq5p5/nUOMnsxAevTgPpdg2H15CDyNxZZxyElqXwXBsmtyllBecnsZC3Ch3JkQK3plSzxojULkY64S8kP2cluwRdDbB+yaCtVMoptoz4equlObFzXxlVEhFmkKhEJCCoxBpVbLauJk65E5Bxb3xo4iwT3f3II3JAey1CgdArj+hHmtkJ7Sc+zk53RG7XdHO2crr1d/YgYY8uIlgVBkjewsJSd7LH/wivKJHCfu8oGb43UBjVzb+uzYnRh9aRX6jFllUlrSScAS0fJ1DOvWb+mY1qIZSozya8FPsUijTEoEp05w+8r5ozbOGSQ6UwLJ98LdkxICAabmbytfG8PBMz7+tKjupSvSAJCtp9pdfDYeA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(346002)(396003)(136003)(376002)(451199021)(478600001)(2906002)(30864003)(6486002)(107886003)(36756003)(6666004)(83380400001)(2616005)(6506007)(86362001)(53546011)(31696002)(186003)(26005)(82960400001)(38100700002)(6512007)(5660300002)(316002)(31686004)(8936002)(8676002)(66946007)(4326008)(66556008)(66476007)(44832011)(41300700001)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3g4N2VmYnRFZE1GaHloNHR1Qm1FTGFLa3dHSnQ0YkprL0YvT3NiYkxmZzlO?=
 =?utf-8?B?WitrUEpqVHNwVlJxejVXVmZRMENRVjcreVVqNGZrc25CM0xGa2JqMG9CVEhs?=
 =?utf-8?B?a1dmcVk3ejJ3eG4wMUZnTmFHNjFBSy9ERzQ5dE1lRmt5bGVyOXlQc0JXMDBK?=
 =?utf-8?B?RWN4Nkk3ai91UU9RSVFmNlNnZ0w3TlNYQWhFaDMxdHBkOGRvdVJ0M0toWnQ4?=
 =?utf-8?B?K05IUG5YMnNJVVl3V3FkbXUwR2ZRZUtwK1V0SUFrTUdOUlBTUmtZRDlad3pK?=
 =?utf-8?B?U2thV3hJQ05kckxHQ1FvcG5iYVRjaEVvRlhjUE90Z1dnbStjdzhiT3NHSmZ3?=
 =?utf-8?B?Q2tPbEVtSDF4NEdVQTBqMkhkdHZLWmx0YXZMMXI5VHd2MFM3RGErMERRZ0RZ?=
 =?utf-8?B?ZFA5WEpUY21BcXk0WFI3L1JWR2dqUG51VEkzR09EZmlHbXZXUnhUK3pKWU1a?=
 =?utf-8?B?MWx1eURCdXk5U3J4TmxEdmhDQXpYN0YxOUdQN3NYTFBnSnF6NFAxNnY5V2kw?=
 =?utf-8?B?NlUxRkh5cnpLVXZuSVRtdkEzQVlMOHJUYjljL0pVZ1ZZeURWZHNNMlpCOEk0?=
 =?utf-8?B?eGhURGhibE5CUVdOeFgzT2ZBMlNmNS9XM3VSQnlId3BocXdMMVZ5M1NiZUJT?=
 =?utf-8?B?M1dWQ2FDL3dqblFmeW95Y05nY3NBTnpHMGdadU42ZkVDSUFqRSs1WGYvMHo3?=
 =?utf-8?B?SHAybFp0OE81ZXRQSVQxVlR4L3ZKYlQ0cm5ldUZnZGhZSmorOWJ6cnFoUWxO?=
 =?utf-8?B?NkdnemlkNUxjeVVjbVRoa01YZ1JRZTJxQ0J5K3IzWmdXUmNwN0Q4UEFiOVBk?=
 =?utf-8?B?MjZoSlBDdVhRM2FwWTlid29zTmxQVW1MRE5EVjJJOXhkd1NmVmR3SUdBWlVt?=
 =?utf-8?B?U2Z4WnR5WW9pQWZQUE1Ca0ZrMG15dHRkM2ZheEdwL0U5VnNJZnNSbUxtcktM?=
 =?utf-8?B?RVkrOVRvekJkdjhLN21FR0ZPRVROdDNjQ1FIMmlqc2tDOHdGSDNjOTVqbUNx?=
 =?utf-8?B?WWxwTGNyWnYyR1ZhcTBqOFkycEZ1K0tNcGxaaU4xUE9zQzBlMERIZWkrMzZM?=
 =?utf-8?B?QmNwbGZEMXU0cENQMUdoK3ZLbGVMM3hFV2UyZFBlTHJiNFkvaXZIaWg5QUJl?=
 =?utf-8?B?Tno1RTZLR1Q3RG9QSWpQVWlMeVJtMU0yYy8yNkhoek1mVGFacU43S1B3RjBB?=
 =?utf-8?B?SDlzRWVxWE5SdTUveFpuWkJYOEsxMVl2bDM4MFNJbVI4c3kzZGcya1JlQXR1?=
 =?utf-8?B?YzFJbFZ3NUo5ZDBxSXFHVzY0MWtoOEFyS2FraGNGVTRSOHVka1Q2VDdZZlhU?=
 =?utf-8?B?SlA3d3ptY2xocHpubm9kakI1NDFiWUNrT1ZvZVFxODlVN1dpSDQyeUVVdFFv?=
 =?utf-8?B?MC80QmpsVFpZMEFVODhxWDJBek0zMlVGQkEyc0hsSnZaRG0xVlBJeUFiV2VC?=
 =?utf-8?B?VEN1VzJHYmNITXdWQVNXRU1xYlp1cC80REt2SnBPY0k3bnl0RWEyNzdsR21E?=
 =?utf-8?B?akcwNGhBeWhpaTdCZ3NJUnJ2MXd0bUtTYWR6cUI4M25QU1R2S014NGVTaVZY?=
 =?utf-8?B?OFF3SXZXWTRjN3ZyUytSd1ZQWXJya2RzWERPSk16eXJTTHhnQXdMTm9uSWln?=
 =?utf-8?B?M252VEZpaGdva2FIVkx4d0l0b3FKT1E0TXRzZzJGbFEvVTUzaFR1S09WbW1l?=
 =?utf-8?B?T1crTWxia0NvcjJHNXNIblI4Y3lIT0V4RS9WNGJXM0Q2eDFGYmdDK092elo0?=
 =?utf-8?B?cU9Fc0JWaGtscEZHR1NXZFFqd0Z1Ly9lLzhmUkhDSTFnalFDZkFXOU0zK3Zj?=
 =?utf-8?B?ZlRBVldCMTBkaVo2ZUVuQkgwSm55YWRqUnFGTUc0YzlXNlJHVGlKcWNqUElX?=
 =?utf-8?B?NFNlMlVvSzM4djNsSGp4ejdCRklUWjN0dUFkblAvNE1UdnJVenpRYi9JQXFh?=
 =?utf-8?B?amJqMTBoNTNualRaRHB0cVppNzdoMmRBNHVLcnRyNkFsMjZ3OXNGTmQ4bUpL?=
 =?utf-8?B?VmFNaXlrc2pUYjZiSllLVW1jN3VRQzN4Mlp6T282U210WG1yeTRvOUpGdm4w?=
 =?utf-8?B?OVBoaFlrT1lRc2VjNjBMVjBSK0JsQ1NpM0orSmJ3c0FVWkxENHB5RlNaUVRU?=
 =?utf-8?Q?DZiOt2HLBWrxkKGLk0G/zNI7V?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75c595ed-8c05-45ca-3b23-08db672ba290
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 07:48:51.5329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++F0vcaxI9+VychW/TsOkfjicwzXQAMtsdtEnJxWNxcuGei11oeMHZiHnhGdO0dieJp5Y0LMkbCvvQ3ZlM/Dig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7446
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: add a new sysfs directory for gtidle
 properties
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 6/7/2023 10:39 AM, Nilawar, Badal wrote:
> Hi Riana,
> 
> On 24-05-2023 11:30, Riana Tauro wrote:
>> Add a new sysfs directory under devices/gt#/ called gtidle
>> to contain idle properties of GT such as name, idle_status,
>> idle_residency_ms
>>
>> v2:
>>      - abstract using function pointers (Anshuman)
>>      - use device_attr (Badal)
>>      - move rc functions to guc_pc
>>      - change name to gt_idle (Rodrigo)
>>
>> v3:
>>      - return error for drmm_add_action_or_reset
>>      - replace file and functions with gt_idle prefix
>>        to gt_idle_sysfs (Himal)
>>      - use enum for gt idle state
>>      - move multiplier to gt idle and initialize (Anshuman)
>>      - correct doc annotation (Rodrigo)
>>      - remove return variable
>>      - use kobj_gt instead of new gtidle kobj
>>      - move residency_ms to gtidle file
>>      - retain xe_guc_pc prefix for functions in guc_rc file (Michal)
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile                 |   1 +
>>   drivers/gpu/drm/xe/xe_gt.c                  |   5 +
>>   drivers/gpu/drm/xe/xe_gt_idle_sysfs.c       | 157 ++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_idle_sysfs.h       |  13 ++
>>   drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h |  38 +++++
>>   drivers/gpu/drm/xe/xe_gt_types.h            |   4 +
>>   drivers/gpu/drm/xe/xe_guc_pc.c              |  46 +++---
>>   drivers/gpu/drm/xe/xe_guc_pc.h              |   2 +
>>   8 files changed, 237 insertions(+), 29 deletions(-)
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_idle_sysfs.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index cd1614b68734..84f0985054fa 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -45,6 +45,7 @@ xe-y += xe_bb.o \
>>       xe_gt.o \
>>       xe_gt_clock.o \
>>       xe_gt_debugfs.o \
>> +    xe_gt_idle_sysfs.o \
>>       xe_gt_mcr.o \
>>       xe_gt_pagefault.o \
>>       xe_gt_sysfs.o \
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 80d42c7c7cfa..eb1e1e3d2d71 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -18,6 +18,7 @@
>>   #include "xe_force_wake.h"
>>   #include "xe_ggtt.h"
>>   #include "xe_gt_clock.h"
>> +#include "xe_gt_idle_sysfs.h"
>>   #include "xe_gt_mcr.h"
>>   #include "xe_gt_pagefault.h"
>>   #include "xe_gt_printk.h"
>> @@ -383,6 +384,10 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>>       if (err)
>>           goto err_force_wake;
>> +    err = xe_gt_idle_sysfs_init(&gt->gtidle);
>> +    if (err)
>> +        goto err_force_wake;
>> +
>>       /* XXX: Fake that we pull the engine mask from hwconfig blob */
>>       gt->info.engine_mask = gt->info.__engine_mask;
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c 
>> b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
>> new file mode 100644
>> index 000000000000..b7de53287f6b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
>> @@ -0,0 +1,157 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_gt_idle_sysfs.h"
>> +#include "xe_gt_sysfs.h"
>> +#include "xe_guc_pc.h"
>> +
>> +/**
>> + * DOC: Xe GT Idle
>> + *
>> + * Provides sysfs entries for idle properties of GT
>> + *
>> + * device/gt#/gtidle/name - name of the state
>> + * device/gt#/gtidle/idle_residency_ms - Provides residency of the 
>> idle state in ms
>> + * device/gt#/gtidle/idle_status - Provides current idle state
>> + */
>> +
>> +static struct xe_gt_idle *dev_to_gtidle(struct device *dev)
>> +{
>> +    struct kobject *kobj = &dev->kobj;
>> +
>> +    return &kobj_to_gt(kobj->parent)->gtidle;
>> +}
>> +
>> +static struct xe_gt *gtidle_to_gt(struct xe_gt_idle *gtidle)
>> +{
>> +    return container_of(gtidle, struct xe_gt, gtidle);
>> +}
>> +
>> +static struct xe_guc_pc *gtidle_to_pc(struct xe_gt_idle *gtidle)
>> +{
>> +    return &gtidle_to_gt(gtidle)->uc.guc.pc;
>> +}
>> +
>> +static const char *gt_idle_state_to_string(enum xe_gt_idle_state state)
>> +{
>> +    switch (state) {
>> +    case GT_IDLE_RC0:
>> +        return "rc0";
>> +    case GT_IDLE_RC6:
>> +        return "rc6";
>> +    default:
>> +        return "unknown";
>> +    }
>> +}
>> +
>> +static u64 get_residency_ms(struct xe_gt_idle *gtidle, u64 
>> cur_residency)
>> +{
>> +    u64 delta, overflow_residency, prev_residency;
>> +
>> +    overflow_residency = BIT_ULL(32);
>> +    /*
>> +     * Counter wrap handling
>> +     * Store previous hw counter values for counter wrap-around handling
>> +     * Relying on sufficient frequency of queries otherwise counters 
>> can still wrap.
>> +     */
>> +    prev_residency = gtidle->prev_residency;
>> +    gtidle->prev_residency = cur_residency;
>> +
>> +    /* delta */
>> +    if (cur_residency >= prev_residency)
>> +        delta = cur_residency - prev_residency;
>> +    else
>> +        delta = cur_residency + (overflow_residency - prev_residency);
>> +
>> +    /* Add delta to extended raw driver copy of idle residency */
>> +    cur_residency = gtidle->cur_residency + delta;
>> +    gtidle->cur_residency = cur_residency;
>> +
>> +    /* residency multiplier in ns, convert to ms */
>> +    return mul_u64_u32_div(cur_residency, 
>> gtidle->residency_multiplier, 1e6);
>> +}
>> +
>> +static ssize_t name_show(struct device *dev,
>> +             struct device_attribute *attr, char *buff)
>> +{
>> +    struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
>> +
>> +    return sysfs_emit(buff, gtidle->name);
>> +}
>> +static DEVICE_ATTR_RO(name);
>> +
>> +static ssize_t idle_status_show(struct device *dev,
>> +                struct device_attribute *attr, char *buff)
>> +{
>> +    struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
>> +    struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
>> +    enum xe_gt_idle_state state;
>> +
>> +    state = gtidle->idle_status(pc);
>> +
>> +    return sysfs_emit(buff, "%s\n", gt_idle_state_to_string(state));
>> +}
>> +static DEVICE_ATTR_RO(idle_status);
>> +
>> +static ssize_t idle_residency_ms_show(struct device *dev,
>> +                      struct device_attribute *attr, char *buff)
>> +{
>> +    struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
>> +    struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
>> +    u64 residency;
>> +
>> +    residency = gtidle->idle_residency(pc);
>> +    return sysfs_emit(buff, "%llu\n", get_residency_ms(gtidle, 
>> residency));
>> +}
>> +static DEVICE_ATTR_RO(idle_residency_ms);
>> +
>> +static const struct attribute *gt_idle_attrs[] = {
>> +    &dev_attr_name.attr,
>> +    &dev_attr_idle_status.attr,
>> +    &dev_attr_idle_residency_ms.attr,
>> +    NULL,
>> +};
>> +
>> +static void gt_idle_sysfs_fini(struct drm_device *drm, void *arg)
>> +{
>> +    struct kobject *kobj = arg;
>> +
>> +    sysfs_remove_files(kobj, gt_idle_attrs);
>> +    kobject_put(kobj);
>> +}
>> +
>> +int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
>> +{
>> +    struct xe_gt *gt = gtidle_to_gt(gtidle);
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +    struct kobject *kobj;
>> +    int err;
>> +
>> +    kobj = kobject_create_and_add("gtidle", gt->sysfs);
>> +    if (!kobj)
>> +        return -ENOMEM;
>> +
>> +    sprintf(gtidle->name, "gt%d-rc\n", gt->info.id);
>> +    /* Multiplier for  RC6 Residency counter in units of 1.28us */
>> +    gtidle->residency_multiplier = 1280;
>> +    gtidle->idle_residency = xe_guc_pc_rc6_residency;
>> +    gtidle->idle_status = xe_guc_pc_rc_status;
>> +
>> +    err = sysfs_create_files(kobj, gt_idle_attrs);
>> +    if (err) {
>> +        kobject_put(kobj);
>> +        return err;
>> +    }
>> +
>> +    err = drmm_add_action_or_reset(&xe->drm, gt_idle_sysfs_fini, kobj);
>> +    if (err)
>> +        return err;
>> +
>> +    return 0;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.h 
>> b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.h
>> new file mode 100644
>> index 000000000000..a654561fda19
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.h
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GT_IDLE_SYSFS_H_
>> +#define _XE_GT_IDLE_SYSFS_H_
>> +
>> +#include "xe_gt_idle_sysfs_types.h"
>> +
>> +int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle);
>> +
>> +#endif /* _XE_GT_IDLE_SYSFS_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h 
>> b/drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h
>> new file mode 100644
>> index 000000000000..b9cfb37aae75
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h
>> @@ -0,0 +1,38 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GT_IDLE_SYSFS_TYPES_H_
>> +#define _XE_GT_IDLE_SYSFS_TYPES_H_
>> +
>> +#include <linux/types.h>
>> +
>> +struct xe_guc_pc;
>> +
>> +/* States of GT Idle */
>> +enum xe_gt_idle_state {
>> +    GT_IDLE_RC0,
>> +    GT_IDLE_RC6,
>> +    GT_IDLE_UNKNOWN,
>> +};
>> +
>> +/**
>> + * struct xe_gt_idle - A struct that contains idle properties based 
>> of gt
>> + */
>> +struct xe_gt_idle {
>> +    /** @name: name */
>> +    char name[16];
>> +    /** @residency_multiplier: residency multiplier in ns */
>> +    u32 residency_multiplier;
>> +    /** @cur_residency: raw driver copy of idle residency */
>> +    u64 cur_residency;
>> +    /** @prev_residency: previous residency counter */
>> +    u64 prev_residency;
>> +    /** @idle_status: get the current idle state */
>> +    enum xe_gt_idle_state (*idle_status)(struct xe_guc_pc *pc);
>> +    /** @idle_residency: get idle residency counter */
>> +    u64 (*idle_residency)(struct xe_guc_pc *pc);
>> +};
>> +
>> +#endif /* _XE_GT_IDLE_SYSFS_TYPES_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h 
>> b/drivers/gpu/drm/xe/xe_gt_types.h
>> index 7c47d67aa8be..8dec660f5fc6 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -7,6 +7,7 @@
>>   #define _XE_GT_TYPES_H_
>>   #include "xe_force_wake_types.h"
>> +#include "xe_gt_idle_sysfs_types.h"
>>   #include "xe_hw_engine_types.h"
>>   #include "xe_hw_fence_types.h"
>>   #include "xe_reg_sr_types.h"
>> @@ -287,6 +288,9 @@ struct xe_gt {
>>       /** @uc: micro controllers on the GT */
>>       struct xe_uc uc;
>> +    /** @gtidle: idle properties of GT */
>> +    struct xe_gt_idle gtidle;
>> +
>>       /** @engine_ops: submission backend engine operations */
>>       const struct xe_engine_ops *engine_ops;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c 
>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index e799faa1c6b8..31c56a0dc210 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -76,12 +76,7 @@
>>    *
>>    * Render-C states is also a GuC PC feature that is now enabled in 
>> Xe for
>>    * all platforms.
>> - * Xe's GuC PC provides a sysfs API for Render-C States:
>>    *
>> - * device/gt#/rc* *read-only* files:
>> - * - rc_status: Provide the actual immediate status of Render-C: (rc0 
>> or rc6)
>> - * - rc6_residency: Provide the rc6_residency counter in units of 
>> 1.28 uSec.
>> - *                  Prone to overflows.
>>    */
>>   static struct xe_guc *
>> @@ -580,10 +575,12 @@ static ssize_t freq_max_store(struct device 
>> *dev, struct device_attribute *attr,
>>   }
>>   static DEVICE_ATTR_RW(freq_max);
>> -static ssize_t rc_status_show(struct device *dev,
>> -                  struct device_attribute *attr, char *buff)
>> +/**
>> + * xe_guc_pc_rc_status - get the current Render C state
>> + * @pc - XE_GuC_PC instance
>> + */
>> +enum xe_gt_idle_state xe_guc_pc_rc_status(struct xe_guc_pc *pc)
>>   {
>> -    struct xe_guc_pc *pc = dev_to_pc(dev);
>>       struct xe_gt *gt = pc_to_gt(pc);
>>       u32 reg;
>> @@ -593,37 +590,30 @@ static ssize_t rc_status_show(struct device *dev,
>>       switch (REG_FIELD_GET(RCN_MASK, reg)) {
>>       case GT_RC6:
>> -        return sysfs_emit(buff, "rc6\n");
>> +        return GT_IDLE_RC6;
>>       case GT_RC0:
>> -        return sysfs_emit(buff, "rc0\n");
>> +        return GT_IDLE_RC0;
>>       default:
>> -        return -ENOENT;
>> +        return GT_IDLE_UNKNOWN;
>>       }
>>   }
>> -static DEVICE_ATTR_RO(rc_status);
>> -static ssize_t rc6_residency_show(struct device *dev,
>> -                  struct device_attribute *attr, char *buff)
>> +/**
>> + * xe_guc_pc_rc6_residency - rc6 residency counter
>> + * @pc - Xe_GuC_PC instance
>> + */
>> +u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc)
>>   {
>> -    struct xe_guc_pc *pc = dev_to_pc(dev);
>>       struct xe_gt *gt = pc_to_gt(pc);
>> -    u32 reg;
>> -    ssize_t ret;
>> +    u64 reg;
>> -    xe_device_mem_access_get(pc_to_xe(pc));
>> -    ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> -    if (ret)
>> -        goto out;
> It would be good to mention in commit message about removal of Forcewake 
> calls.
Missed this. Will add it to commit message
>> +    xe_device_mem_access_get(gt_to_xe(gt));
>>       reg = xe_mmio_read32(gt, GT_GFX_RC6);
>> -    ret = sysfs_emit(buff, "%u\n", reg);
>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>> -out:
>> -    xe_device_mem_access_put(pc_to_xe(pc));
>> -    return ret;
>> +    xe_device_mem_access_put(gt_to_xe(gt));
>> +    return reg;
>>   }
>> -static DEVICE_ATTR_RO(rc6_residency);
>>   static const struct attribute *pc_attrs[] = {
>>       &dev_attr_freq_act.attr,
>> @@ -633,8 +623,6 @@ static const struct attribute *pc_attrs[] = {
>>       &dev_attr_freq_rpn.attr,
>>       &dev_attr_freq_min.attr,
>>       &dev_attr_freq_max.attr,
>> -    &dev_attr_rc_status.attr,
>> -    &dev_attr_rc6_residency.attr,
>>       NULL
>>   };
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h 
>> b/drivers/gpu/drm/xe/xe_guc_pc.h
>> index da29e4934868..976179dbc9a8 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>> @@ -12,4 +12,6 @@ int xe_guc_pc_init(struct xe_guc_pc *pc);
>>   int xe_guc_pc_start(struct xe_guc_pc *pc);
>>   int xe_guc_pc_stop(struct xe_guc_pc *pc);
>> +enum xe_gt_idle_state xe_guc_pc_rc_status(struct xe_guc_pc *pc);
>> +u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
> As xe_gt_idle_sysfs.c is the only consumer of above funtions, how about 
> moving these functions under xe_gt_idle_sysfs.c as static functions?
These functions were static in the first revision. Based on review 
comments all low level functions were moved to this file

Thanks
Riana
> 
> Regards,
> Badal
>>   #endif /* _XE_GUC_PC_H_ */
