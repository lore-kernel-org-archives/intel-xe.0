Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F890C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 31 May 2023 04:58:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E00910E47C;
	Wed, 31 May 2023 04:58:55 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E283410E47E
 for <intel-xe@lists.freedesktop.org>; Wed, 31 May 2023 04:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685509132; x=1717045132;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nQ/9F87JpTjNBajmpBBBgVcCty7uy0bRZ/bniIC+ld0=;
 b=OBW6/6MORhuujtvXO+tUy5rUfMbMLljIEkSg+IB4rQbjqw1JRwX5lr3W
 u0a+A6TxFmhN+9UzosogDMxSfuA3RQs9613CvHbqDjHD7lmMWS+eqABfN
 Cfwa0oTuHbcfbsEbA5aVmhFrqwOIYmkrVLB2oJtZljCy2guWk3mWS1IuK
 IQ1R8eorUE/VAbMsxbaGJvf9Xb11AgsHB1/h3s6A1g+aVqP9r9fZqODO4
 pOu5YW9RXKkf5dh++IWfUsCu7wA3/5rUwJj8Q9y9YSajw0sWQezDsimfg
 wWC0JC9eoptUyWQHudMWdBWNszJWqIJYRImgNOB5cfxiHciyxdJwyQ+OR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="344643044"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="344643044"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 21:58:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="700945974"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="700945974"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 30 May 2023 21:58:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 21:58:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 30 May 2023 21:58:42 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 30 May 2023 21:58:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ShsjSZwKdJCiCelC2usnZ3P2wKUxX37Q70tLOpKlMefKWxasxkqeSk7cjY8Tki5GC+hJPPwOhyMTKCqfgeZbeciFd67sC0Oa9Na3d3xyurVK/+P5/1Qcj5Lkx1rWb30EsHDdEPDYEcM+10lhLfD6ShLF8FTmUofCcSt1O+/QuIAzog6AQznujkeJbiDPFwEMSyZof8kj3FdqXfn4W93J0EgyiMj4E6Qyn7oakGUX91pK2V+fKogNot0HmBQr5fUXAkTsTEUo8HMZJavyRgNc5CD7oMdj016jspmRkr//X0XY2isBw566NEtQ2NxMLjBMAj8WvIR/8Xx+Zb3K6U44AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHU5V5ej3zt6oAiesSBuQ8S6UsgUUqWMaqoCNuB1RhA=;
 b=OTDmrxaetFq3Wv5CI8d8u8cNq9mP3cvcDFbW8ZMpZDREQVUqq/w799pXfeaDXUKHCXOFZv7pchMciLti61FDvl41fzZj+a3z/s/VCxWlURQ5HN1KCF79gX5In6KA+XjjHxj4MXEgNiEf2n0VSUVsGjU7vxhlxiHjpWHZQhppJOYgNJVLvygoWfLisKQ2N2+ryHXkq21adVIjCvacJM8JykUSoBaKNIogrK4GEz9L4Y0pmnwft2+cRGV5S+kV3ir5eopvjqSQ/kZNf69A+HOXfgZlepSnISE66vrtQsxd0PY6WYGui7rp0qOwxDDnjF7E95Qwlg95BTNTZxdNOWgWIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SJ0PR11MB5008.namprd11.prod.outlook.com (2603:10b6:a03:2d5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Wed, 31 May
 2023 04:58:37 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::83ef:7f2a:478f:b807]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::83ef:7f2a:478f:b807%5]) with mapi id 15.20.6433.022; Wed, 31 May 2023
 04:58:36 +0000
Message-ID: <5e1b25fa-b636-4431-ad5d-a8828c826578@intel.com>
Date: Wed, 31 May 2023 10:28:28 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230524060020.2054682-1-riana.tauro@intel.com>
 <CY5PR11MB6211DCB0D973C5FA6163F4E4954B9@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <CY5PR11MB6211DCB0D973C5FA6163F4E4954B9@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0161.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::17) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SJ0PR11MB5008:EE_
X-MS-Office365-Filtering-Correlation-Id: 75ac1ffe-968f-48d5-ddf9-08db6193b108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N56euRpFmcVTpzipRd5Rd9ACt7g0EwJi2af0stZ3VN5PzGDn7g4c8ctgX7CCTTVYqdvLILrDtIqyqKYgRIEs7RBp3Ysvi7e25ON7e7QyGK54fnn5G8uriv0JOASyljITK++7trrXiTX+gdFurMXdKoQNJUpEsCcMSh9HMHJcen9qoBQ5KbqjiA5cpl0Pw9Ts2ySapF85s4Dc8jauRCmffObbXiy64jJ1aY6c8bNg3F6fCuAwTStA2G0Wku6dmf3qmdV+HirIIFFaCs5bwtQHs/kGrTCfuP33fTh10NHECXF0F9p1dIfIxUHkbYFRXFI0TrFZpxRi6LH3/HIJWrJlPLMsODpoDpgeqDoVrI0OhJ9eUoXx2qBhV4oGh9nzIekakblc9ZmCoxDhO1MIikdZkbff6FNrzfAHqA2PM0j4NPmEv7+lMOof+Y5bcTFjgYSzYSIasB/cywTpxEpiHhXZ031n+sR5R+HG/UMOOR5awDB1o3GCzV7N3ELWrI4fn6Z7Pe3vITZ5DhuYJCrWPGY3zOfW6jDlAbrJl/JNdQQ9MBPSC45PsRITARypwR8PsQErOzkX9yI3eYSb5zROXyRrNAMghSE1ZOORVETo2VbPLrf8a6k+cQzUgzEbeJNt7c9mHuTpbDH6nEC30w9wDCuRs4vikptmhTL7O8p8HdxBpWE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(39860400002)(396003)(366004)(346002)(451199021)(26005)(107886003)(38100700002)(41300700001)(6486002)(6666004)(186003)(83380400001)(6512007)(31686004)(6506007)(53546011)(2616005)(110136005)(478600001)(54906003)(66946007)(66556008)(82960400001)(4326008)(66476007)(316002)(5660300002)(8676002)(8936002)(44832011)(31696002)(2906002)(30864003)(86362001)(36756003)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enFmc3QxSGxDWUM1UHdNTE00WGQyMlVQdzhBczNkS1hyRzJKMXlnWEtXZXlj?=
 =?utf-8?B?bVJxZzc2di9DZ2x6L0JYc2Vqbmw3QnJwbGVLeEduUnRIWDZzTWlUT2ZTRVJr?=
 =?utf-8?B?YXBmYU9QYjZEbWlGY3h0Q2VENTV0YU44cENJVDdWYVFUd2o3SVZONE41Z3pk?=
 =?utf-8?B?d3JZUG1CS3lvL0VwQWhKVEsvMU1VMHdlVi9ncFB4ZTN6Rlp0Rkgxb1FEckE1?=
 =?utf-8?B?emljbjdaTkl3ZzNHTDlBSHhTU1Y0WE4vTFFYM3ZDQjY3RE1naXRaY2JxVndv?=
 =?utf-8?B?a1FJVXVhMHhZbG45RmJlWlZQM2lnT1FZN1NKQmR0RUoyZVdhS05aVklkMC9n?=
 =?utf-8?B?RnpvaVBHQm9XZnM4cWg0Q3MxR3dzVFBKblEwOVlPQ2I1N080ZXUxRFFYazVW?=
 =?utf-8?B?c21KVTB3TUNCRzNScVFOdm9tRzBLRC9BbVRFVXlFM25BWmpTcWJ1VHNMZi9D?=
 =?utf-8?B?bTUzSzhuU1FjbTdxT2FpMFNuL3NrT05XV00zeE9Oc2JldC95S3g4TnpzSnBB?=
 =?utf-8?B?aUpIWVJWYUFtME5QVEoxZVh1YXk5aTlzZnMrZkh3aTFaR3FPclVJNzViYzRD?=
 =?utf-8?B?UXg1cFMyNk1IM1kyanI1NGV3Tko2ZXpQQU9HY0lGZjlLVmlTSzBiMDdmZ1E0?=
 =?utf-8?B?dEtQV29nUHFCM3JuNmdITkh6dVhKOEh2SDFUUkZNbm81MVVUbzhyeGVIQzRT?=
 =?utf-8?B?TXVZd1pvSXFBS1dHMkFIcDZrVHNlbElXbzNPcWl3TE51cVE3eHFxK3F0L2dR?=
 =?utf-8?B?UWVncUJ2cU1Oelh0OXF6ZVJmQnBKU3pPMHhaM3hlWXYwb09rQUQ4UTArSERM?=
 =?utf-8?B?cHFuTUQ2UUQ2UWU4MndhVm1LTnY5R3VBUm9ZMEJLbXZRV3diS3MvQjQyellm?=
 =?utf-8?B?UkU4b2Z2QlQrSE9lTnZhRXpqTm1lbUVhUDQ0RDViSXdUZ1I0OG4rSXVEOFVu?=
 =?utf-8?B?dkdlTkhMbGpQUzdzNFUyWmJnWlh3NHVoWFBxVUJPeThKV1JhWW5NTkJaQ1g3?=
 =?utf-8?B?SVQ1S1hjVDc1aHZtL2wza0h3ejkyaWJpYUUrOGorVTlxNUpIK3JVME9FTTZi?=
 =?utf-8?B?dUVocW5oQ2d0VlVvR3ZoMWQybXlWZFh6NWpJeHk2UjFPbkJIOTltK2J6Z3h4?=
 =?utf-8?B?TEMzUnk1OGpMQXY1ZEdSTEJEZ2VLNlg2RFhYZDlPOEZoTFRyVmowS1d0TGtr?=
 =?utf-8?B?eGZzbXowelRaaWxOdVpCYkgzSGlDMlJMclVrNEkyRkJsQmY3NWJMSWtQNmRW?=
 =?utf-8?B?cFZMWDlUQmUyODQyVENsNjYxU0ZUSTFGd2had1ZuL2ttVHZPQ3E1MlVEcG1V?=
 =?utf-8?B?MUxhRUtpbGY4VzlKbWNUUW1LWkh2SkQ2aWZBNWlPb0R6engzM2dGR29zNjhR?=
 =?utf-8?B?M3V1ZEd0M2NuWFFxekRyamJuOWpRZVdPb0I5Z1FGNkRXdVMxWVNXazZuRDBa?=
 =?utf-8?B?ZmlqYlNTNjFFb2phZEV5b1gwai9ZakMremNwaENWZ0dqSkNZVmQ3TGZndi9V?=
 =?utf-8?B?QUhoMlZ4bG1HZmYwYmkwUytRU2VucitrZXBiektqcGs2VzdMdXdvdWl6cHNX?=
 =?utf-8?B?b1lxU2FkK3NhTWxxbm5SanF5WW92V0lzRkU0dHAzWUZrM1FZRDVBRnV3TWcy?=
 =?utf-8?B?MmNkcUp4eXdLVWl3ZVllSWM2Y1dEL3R1dGpsZHBpa2JPWGpkdmFuRW9PWEFw?=
 =?utf-8?B?b2s2eUwyakRVYnMwRXhTOGhzeXJTRTNHYTd5eVg5R2V4WVQ3RGVyZnFObFZS?=
 =?utf-8?B?cjZnbHhUNlh6NkRWWUtoeTNQeloyQjZyakxLN09neGJWNkpIUHZBYm1EZDJZ?=
 =?utf-8?B?OGZoS3hSNFZrSVhGMnN1RzFYUHRGa2VvUlpiVW9Fd1JHNExKcWRQdHR2MEVr?=
 =?utf-8?B?eXBrZEdTTktwU1VtZDRUcTFPM2w1eW5mL1NCNHlmMTBnOXB1eW5QMFpuYTdK?=
 =?utf-8?B?TWNGT3dGNXJzNFpYcE9CYkY2ZXlFRmVrYlZCcndBODhlbzlDd1QwRGNBQVB2?=
 =?utf-8?B?UlIzQmtST3Ayc0FNOXJWUVNId0lydTRWVkR4VDhIVU5mbTdwSTBhbVdXT2ZL?=
 =?utf-8?B?bERLVWp6ZHY2U3NrUVZXVEdGb1k5cXE3QU5XbVdRS2k4Zy9lbmQxRjVvb25Y?=
 =?utf-8?Q?AGZ45Oc6Frii6+l6nrOa7Tuf+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75ac1ffe-968f-48d5-ddf9-08db6193b108
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 04:58:36.4943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GzFGUAfrgd7ItEnUvXqRzQNkDrmpsf6l0U/swmFf9Oq2+3PTxbJoykeuGP80Bbk2VIZG84K+MFPZQS17BQXKCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5008
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Anshuman

On 5/30/2023 4:00 PM, Gupta, Anshuman wrote:
> 
> 
>> -----Original Message-----
>> From: Tauro, Riana <riana.tauro@intel.com>
>> Sent: Wednesday, May 24, 2023 11:30 AM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
>> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Dixit,
>> Ashutosh <ashutosh.dixit@intel.com>; Nilawar, Badal
>> <badal.nilawar@intel.com>; Wajdeczko, Michal
>> <Michal.Wajdeczko@intel.com>
>> Subject: [PATCH] drm/xe: add a new sysfs directory for gtidle properties
>>
>> Add a new sysfs directory under devices/gt#/ called gtidle to contain idle
>> properties of GT such as name, idle_status, idle_residency_ms
>>
>> v2:
>>      - abstract using function pointers (Anshuman)
>>      - use device_attr (Badal)
>>      - move rc functions to guc_pc
>>      - change name to gt_idle (Rodrigo)
>>
>> v3:
>>      - return error for drmm_add_action_or_reset
>>      - replace file and functions with gt_idle prefix
>>        to gt_idle_sysfs (Himal)
>>      - use enum for gt idle state
>>      - move multiplier to gt idle and initialize (Anshuman)
>>      - correct doc annotation (Rodrigo)
>>      - remove return variable
>>      - use kobj_gt instead of new gtidle kobj
>>      - move residency_ms to gtidle file
>>      - retain xe_guc_pc prefix for functions in guc_rc file (Michal)
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile                 |   1 +
>>   drivers/gpu/drm/xe/xe_gt.c                  |   5 +
>>   drivers/gpu/drm/xe/xe_gt_idle_sysfs.c       | 157 ++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_idle_sysfs.h       |  13 ++
>>   drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h |  38 +++++
>>   drivers/gpu/drm/xe/xe_gt_types.h            |   4 +
>>   drivers/gpu/drm/xe/xe_guc_pc.c              |  46 +++---
>>   drivers/gpu/drm/xe/xe_guc_pc.h              |   2 +
>>   8 files changed, 237 insertions(+), 29 deletions(-)  create mode 100644
>> drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_idle_sysfs.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index cd1614b68734..84f0985054fa 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -45,6 +45,7 @@ xe-y += xe_bb.o \
>>   	xe_gt.o \
>>   	xe_gt_clock.o \
>>   	xe_gt_debugfs.o \
>> +	xe_gt_idle_sysfs.o \
>>   	xe_gt_mcr.o \
>>   	xe_gt_pagefault.o \
>>   	xe_gt_sysfs.o \
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c index
>> 80d42c7c7cfa..eb1e1e3d2d71 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -18,6 +18,7 @@
>>   #include "xe_force_wake.h"
>>   #include "xe_ggtt.h"
>>   #include "xe_gt_clock.h"
>> +#include "xe_gt_idle_sysfs.h"
>>   #include "xe_gt_mcr.h"
>>   #include "xe_gt_pagefault.h"
>>   #include "xe_gt_printk.h"
>> @@ -383,6 +384,10 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>>   	if (err)
>>   		goto err_force_wake;
>>
>> +	err = xe_gt_idle_sysfs_init(&gt->gtidle);
> Can't we keep this simple to pass just GT and inside function, initialize the GT ?
This was to keep consistency with other files having struct specific to 
the files as parameters. IMO gtidle as a parameter is appropriate as all 
the functions in the file use xe_gt_idle
>> +	if (err)
>> +		goto err_force_wake;
>> +
>>   	/* XXX: Fake that we pull the engine mask from hwconfig blob */
>>   	gt->info.engine_mask = gt->info.__engine_mask;
>>
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
>> + * device/gt#/gtidle/idle_residency_ms - Provides residency of the idle
>> +state in ms
>> + * device/gt#/gtidle/idle_status - Provides current idle state  */
>> +
>> +static struct xe_gt_idle *dev_to_gtidle(struct device *dev) {
>> +	struct kobject *kobj = &dev->kobj;
>> +
>> +	return &kobj_to_gt(kobj->parent)->gtidle;
>> +}
>> +
>> +static struct xe_gt *gtidle_to_gt(struct xe_gt_idle *gtidle) {
>> +	return container_of(gtidle, struct xe_gt, gtidle); }
>> +
>> +static struct xe_guc_pc *gtidle_to_pc(struct xe_gt_idle *gtidle) {
>> +	return &gtidle_to_gt(gtidle)->uc.guc.pc; }
>> +
>> +static const char *gt_idle_state_to_string(enum xe_gt_idle_state state)
>> +{
>> +	switch (state) {
>> +	case GT_IDLE_RC0:
>> +		return "rc0";
>> +	case GT_IDLE_RC6:
>> +		return "rc6";
>> +	default:
>> +		return "unknown";
>> +	}
>> +}
>> +
>> +static u64 get_residency_ms(struct xe_gt_idle *gtidle, u64
>> +cur_residency) {
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
> Multiple user threads can race against each other while reading this attribute.
> So probably we need some sort of locking ?
Thanks for pointing this.
Will add this in next rev
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
>> +	return mul_u64_u32_div(cur_residency, gtidle-
>>> residency_multiplier,
>> +1e6); }
>> +
>> +static ssize_t name_show(struct device *dev,
>> +			 struct device_attribute *attr, char *buff) {
>> +	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
>> +
>> +	return sysfs_emit(buff, gtidle->name); } static
>> DEVICE_ATTR_RO(name);
>> +
>> +static ssize_t idle_status_show(struct device *dev,
>> +				struct device_attribute *attr, char *buff) {
>> +	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
>> +	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
>> +	enum xe_gt_idle_state state;
>> +
>> +	state = gtidle->idle_status(pc);
>> +
>> +	return sysfs_emit(buff, "%s\n", gt_idle_state_to_string(state)); }
>> +static DEVICE_ATTR_RO(idle_status);
>> +
>> +static ssize_t idle_residency_ms_show(struct device *dev,
>> +				      struct device_attribute *attr, char *buff) {
>> +	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
>> +	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
>> +	u64 residency;
>> +
>> +	residency = gtidle->idle_residency(pc);
>> +	return sysfs_emit(buff, "%llu\n", get_residency_ms(gtidle,
>> +residency)); } static DEVICE_ATTR_RO(idle_residency_ms);
>> +
>> +static const struct attribute *gt_idle_attrs[] = {
>> +	&dev_attr_name.attr,
>> +	&dev_attr_idle_status.attr,
>> +	&dev_attr_idle_residency_ms.attr,
>> +	NULL,
>> +};
>> +
>> +static void gt_idle_sysfs_fini(struct drm_device *drm, void *arg) {
>> +	struct kobject *kobj = arg;
>> +
>> +	sysfs_remove_files(kobj, gt_idle_attrs);
>> +	kobject_put(kobj);
>> +}
>> +
>> +int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle) {
>> +	struct xe_gt *gt = gtidle_to_gt(gtidle);
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	struct kobject *kobj;
>> +	int err;
>> +
>> +	kobj = kobject_create_and_add("gtidle", gt->sysfs);
>> +	if (!kobj)
>> +		return -ENOMEM;
> IMO ENOMEM does not suits here, How  about EINVAL or ENODEV ?
kobject_create_and_add returns NULL if kzalloc fails or when the add fails.
Most of the files  return -ENOMEM when the function fails
>> +
>> +	sprintf(gtidle->name, "gt%d-rc\n", gt->info.id);
>> +	/* Multiplier for  RC6 Residency counter in units of 1.28us */
>> +	gtidle->residency_multiplier = 1280;
>> +	gtidle->idle_residency = xe_guc_pc_rc6_residency;
>> +	gtidle->idle_status = xe_guc_pc_rc_status;
>> +
>> +	err = sysfs_create_files(kobj, gt_idle_attrs);
>> +	if (err) {
>> +		kobject_put(kobj);
>> +		return err;
>> +	}
>> +
>> +	err = drmm_add_action_or_reset(&xe->drm, gt_idle_sysfs_fini,
>> kobj);
>> +	if (err)
>> +		return err;
>> +
>> +	return 0;
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
>> +	GT_IDLE_RC0,
>> +	GT_IDLE_RC6,
>> +	GT_IDLE_UNKNOWN,
>> +};
>> +
>> +/**
>> + * struct xe_gt_idle - A struct that contains idle properties based of
>> +gt  */ struct xe_gt_idle {
>> +	/** @name: name */
>> +	char name[16];
>> +	/** @residency_multiplier: residency multiplier in ns */
>> +	u32 residency_multiplier;
>> +	/** @cur_residency: raw driver copy of idle residency */
>> +	u64 cur_residency;
>> +	/** @prev_residency: previous residency counter */
>> +	u64 prev_residency;
>> +	/** @idle_status: get the current idle state */
>> +	enum xe_gt_idle_state (*idle_status)(struct xe_guc_pc *pc);
>> +	/** @idle_residency: get idle residency counter */
>> +	u64 (*idle_residency)(struct xe_guc_pc *pc); };
>> +
>> +#endif /* _XE_GT_IDLE_SYSFS_TYPES_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
>> b/drivers/gpu/drm/xe/xe_gt_types.h
>> index 7c47d67aa8be..8dec660f5fc6 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -7,6 +7,7 @@
>>   #define _XE_GT_TYPES_H_
>>
>>   #include "xe_force_wake_types.h"
>> +#include "xe_gt_idle_sysfs_types.h"
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
>> b/drivers/gpu/drm/xe/xe_guc_pc.c index e799faa1c6b8..31c56a0dc210
>> 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -76,12 +76,7 @@
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
>> @@ -580,10 +575,12 @@ static ssize_t freq_max_store(struct device *dev,
>> struct device_attribute *attr,  }  static DEVICE_ATTR_RW(freq_max);
>>
>> -static ssize_t rc_status_show(struct device *dev,
>> -			      struct device_attribute *attr, char *buff)
>> +/**
>> + * xe_guc_pc_rc_status - get the current Render C state
>> + * @pc - XE_GuC_PC instance
>> + */
>> +enum xe_gt_idle_state xe_guc_pc_rc_status(struct xe_guc_pc *pc)
>>   {
>> -	struct xe_guc_pc *pc = dev_to_pc(dev);
>>   	struct xe_gt *gt = pc_to_gt(pc);
>>   	u32 reg;
>>
>> @@ -593,37 +590,30 @@ static ssize_t rc_status_show(struct device *dev,
>>
>>   	switch (REG_FIELD_GET(RCN_MASK, reg)) {
>>   	case GT_RC6:
>> -		return sysfs_emit(buff, "rc6\n");
>> +		return GT_IDLE_RC6;
>>   	case GT_RC0:
>> -		return sysfs_emit(buff, "rc0\n");
>> +		return GT_IDLE_RC0;
>>   	default:
>> -		return -ENOENT;
>> +		return GT_IDLE_UNKNOWN;
>>   	}
>>   }
>> -static DEVICE_ATTR_RO(rc_status);
>>
>> -static ssize_t rc6_residency_show(struct device *dev,
>> -				  struct device_attribute *attr, char *buff)
>> +/**
>> + * xe_guc_pc_rc6_residency - rc6 residency counter
>> + * @pc - Xe_GuC_PC instance
>> + */
>> +u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc)
>>   {
>> -	struct xe_guc_pc *pc = dev_to_pc(dev);
>>   	struct xe_gt *gt = pc_to_gt(pc);
>> -	u32 reg;
>> -	ssize_t ret;
>> +	u64 reg;
> Why do we need u64 here as we are reading 32 bit register, caller can do the implicit type conversion.
Will change this to u32

Thanks
Riana
> Thanks,
> Anshuman Gupta.
>>
>> -	xe_device_mem_access_get(pc_to_xe(pc));
>> -	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> -	if (ret)
>> -		goto out;
>> +	xe_device_mem_access_get(gt_to_xe(gt));
>>
>>   	reg = xe_mmio_read32(gt, GT_GFX_RC6);
>> -	ret = sysfs_emit(buff, "%u\n", reg);
>>
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt),
>> XE_FORCEWAKE_ALL));
>> -out:
>> -	xe_device_mem_access_put(pc_to_xe(pc));
>> -	return ret;
>> +	xe_device_mem_access_put(gt_to_xe(gt));
>> +	return reg;
>>   }
>> -static DEVICE_ATTR_RO(rc6_residency);
>>
>>   static const struct attribute *pc_attrs[] = {
>>   	&dev_attr_freq_act.attr,
>> @@ -633,8 +623,6 @@ static const struct attribute *pc_attrs[] = {
>>   	&dev_attr_freq_rpn.attr,
>>   	&dev_attr_freq_min.attr,
>>   	&dev_attr_freq_max.attr,
>> -	&dev_attr_rc_status.attr,
>> -	&dev_attr_rc6_residency.attr,
>>   	NULL
>>   };
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h
>> b/drivers/gpu/drm/xe/xe_guc_pc.h index da29e4934868..976179dbc9a8
>> 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>> @@ -12,4 +12,6 @@ int xe_guc_pc_init(struct xe_guc_pc *pc);  int
>> xe_guc_pc_start(struct xe_guc_pc *pc);  int xe_guc_pc_stop(struct
>> xe_guc_pc *pc);
>>
>> +enum xe_gt_idle_state xe_guc_pc_rc_status(struct xe_guc_pc *pc);
>> +u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
>>   #endif /* _XE_GUC_PC_H_ */
>> --
>> 2.40.0
> 
