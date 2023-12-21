Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7883FC35274
	for <intel-xe@archiver.kernel.org>; Thu, 21 Dec 2023 05:14:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A7110E646;
	Thu, 21 Dec 2023 05:14:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8F510E646
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Dec 2023 05:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703135679; x=1734671679;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A6ZdUwlO37aHOWgNYIwmM+/ifSOIOWRWTkZd3T7IWyk=;
 b=lHJOJ+2//O4PEG02BXLyr/pu3MxVnkxaaYLNvipZV0vbosvEZBTp6paY
 nBNHloc2hPvGt06qMkyCz7mexExFdFPEn3NH6y3U0S0g4/zQOSZZ7DFVq
 d7xxOD/Owi2tHvYdmvzK28QGrjioyq3OxQU+PcH1Us2BBD9qi9Ee1vnDc
 DYDcksgAWJBrKmQS2c0w+qYb8dWe0MXl9Nf5TCpZONWqNOMCvBLjmSSVd
 aIYm64sppEBICRoijIALV/Y1ot9ZO3XtYeo+2PWafFklLFpUAyIsWWGFJ
 1+UPdtThzkc/AJOq7LSw37mxFi/ubt7WbecD9L+oGUAOJS3LVZ06F0WEG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="14604290"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="14604290"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 21:14:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="18568312"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2023 21:14:38 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 21:14:37 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 21:14:36 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Dec 2023 21:14:36 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Dec 2023 21:14:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KhHHLmti1REE1DSuq4wwpzCpknoCQ2OFJUvtqTjVZtSLSf8JeX+yg5gqzRiSvCd+RCAzLXd3AOQf4yH4PgSM+49CGqaKIVSFHfcXwdJFtXW1ATJAhr7J2E91dFWj3l47adr45vhnhOTtrOcYr4ZFPQCxsHAe9EAjs8YijpG/MV392HuW4olIgoPZmajw0vT+JNK9Ic8hQT5NigOHEqFOsDiqXPXIrEL3mnnrKxq9asDq5XIdATvMlW7/HBdiEpXKjfgK/HD3A2SFA7IrUg3KYO0Ipfzq0LZM71euJ4N3I5qQ6nLFyd+4gE9FQnni1mu8WwPbfoDGkbJHxcKqDylz4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJpnUDqnonEB2BIVguMaMq+XkZtuGVzV4Nco0ketkHs=;
 b=DgVrNaeMFK0X6IeerTUcwOX4KZv2kqqRGFsVqkcNFue+mRC7aVxHOQXtnQKtGoEVXKoMLfNcT2+aw4Yqxf7X2KwPvSxmku083m+wbeWNkutdOvOWr1r/jgvFC4i2yYQhIlMgOpXg21wKk2a+CPjZdt11bf7fWjcQqhjqPnFxkqvsfmKhZPA77MN6aieTlaVFy7pgjJS7j57qq5QO6gdUHZzninrmPRMg62gSbhpL3YArn37BZ9vGg2TFOK5jmlDB2SJPgOJ+/zsHKUmgD1czjWqsWneG4uvQzTxsWC1l3RnvfAebDhiAgwcX4qRYU4fLZU4Y50aGpMkJ7Pfb6KL00g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CYXPR11MB8692.namprd11.prod.outlook.com (2603:10b6:930:e4::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.18; Thu, 21 Dec 2023 05:14:34 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7113.016; Thu, 21 Dec 2023
 05:14:34 +0000
Message-ID: <1ce7ce30-e65a-4e5c-82f0-152df5bf73ad@intel.com>
Date: Thu, 21 Dec 2023 10:44:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] RFC drm/xe/guc: Add interface for engine busyness
 ticks
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20231207125802.3730165-1-riana.tauro@intel.com>
 <20231207125802.3730165-3-riana.tauro@intel.com>
 <ZYOLtyll4gC9RHyh@unerlige-ril>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ZYOLtyll4gC9RHyh@unerlige-ril>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0232.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CYXPR11MB8692:EE_
X-MS-Office365-Filtering-Correlation-Id: 10b9f75c-2708-47fa-4782-08dc01e3b84c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wF2Q/XMgBxxplYsBRtNPs2NPe43ihXwssCmNwSYHAvdmlpn0Dfuy06qXfUhEqv8mkkB7fcnelmuIWzQdr/c5p9Y8qDjvJWvM/Qvf+y5rLv8VounHt0ciiuAuuenUFHNxZb4rLWN2+hvZb4NbIGWJeTZEL/WmvptL6YsaCufQ6j9sPzIolaD60qBaWJ5mnS18P41YizJJ1+WxJLJnz8V3Q+i3K6dLisSTNWENsyMvxYyyPr4ldoqrEpKGzxnbWBDgd37WV2YdRWRpRMbFpYIkDKT8ErdpMul8fPr6MlLx7NwvRCLXHyKXn2gVzlia4Ol4GZCJYyPjHL33zdMM2B/i5veORCCX2uoyfC5TW+VBzpKCO2T/79DNV0osYpkQ3oTDTgEuoSJjo7ogqXtT8uIvKMWx4YhE1bmKImYeJtAvdz/d6yQY9HJaRjpIGyIaz4NTWAgLY10OyLyIJIGoCHdvcLAbSjexovRcNR13qV1maq5mr24Ob+Sa7tIF2e/Ofsv0CMGYtFTbJMAyThKSDpchH2Ozksg5bZ07wAsnz7z5CjGbGuFOzgtVrglLqZdJcr2fnRRP0+B4YAwGq8aCC3Y6PZiA2wcP65I75oGSeXdZe87W8LfbglvVpcmINHMvOaSM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(39860400002)(396003)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(478600001)(6636002)(316002)(66946007)(66556008)(66476007)(6512007)(38100700002)(6666004)(82960400001)(31696002)(86362001)(41300700001)(53546011)(36756003)(6506007)(5660300002)(2616005)(26005)(4326008)(6862004)(44832011)(83380400001)(30864003)(8936002)(8676002)(37006003)(2906002)(31686004)(6486002)(966005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d09pVVlSaGErWVBob3l1N28yV09vM0kreThaVkR1ZnhpeUFlUHdWL1JHRklh?=
 =?utf-8?B?U0NyRFJBcFZtTE1Jb1hHSU1Ub0FFSVE3S3FXZXNOS0N2QzVKaEpWU2RKWTg5?=
 =?utf-8?B?dkFxZ0hKcmt1SDBKTE1uWi9zOFZpR1RmcGNsaVVzNHIvMHpsQ1NPNVVSREpu?=
 =?utf-8?B?WDB0bndSWWd5QjUyQlRmU0w3WmExSTRnN2UzWFNzaXhCS1J1STRjUzdROEFW?=
 =?utf-8?B?L3VlQWQxbUxpRmg5VlFQQm5pTkN5WjV1c1dLWVdNUi81SktUYUVua0ZlWVhM?=
 =?utf-8?B?R202ZmtXRXVnK09xU3JiR0xjZGtFa2RjdzZyQnYwS3RuZVp6ME9BTUFYRkx4?=
 =?utf-8?B?QWkyd0k1Q0RWc0hQeExGb2ZhcUlrNHI1alpyOWx3OVJpZTludjNFNmd1Qm9Y?=
 =?utf-8?B?aUJacGFqQy9iaU84VG1ucVhmSmFJd0g3OGtQTTJ2TFdxbzhOOXdmRDNpQ09h?=
 =?utf-8?B?R3c3bkkxOThCbE9NYUlqRWhIVCtlVXo4NzRZd0ZPZTYzOUY3dXdQQjRhZWhu?=
 =?utf-8?B?THZKVTM3WjBpNWkxdjdZajR1aWwva2tBOHVBT0hnMGczNkZGZFVVb0xVUXN0?=
 =?utf-8?B?MC94OVhXazlKTWd0RVlqWkRxalRJTUMyZHgydUtBR0xNNHZ5dXFUblA4SEds?=
 =?utf-8?B?cHJUYmoybjd2MEVwSlMzUDIzVkN6QTBuWENETWMvbkFzL0x6a2xNSERrUWNN?=
 =?utf-8?B?c1NsTjV3eCt2bThPUUZjQWVWQk1mUjYzREJZZjNJU0tEalp3U1J6YU9UTDdD?=
 =?utf-8?B?VGN0NnhOcUFhZW8yaHJPVENxOGxLdGlzYkpOcnByWjR1SjlFYmRibHJUTHZR?=
 =?utf-8?B?eThCNUVVd0QyWDlTc2swelFLcjJpcjdsNDFIYWkzUjV4Uk9hVy9KSmxBMEN0?=
 =?utf-8?B?a3Q2dTFRc2ZFOE1iZTlWVEJzYmZreDRWZDRLTk9IT1l1RDY4ZkJ1eE8ySjlJ?=
 =?utf-8?B?bEhFOWVhK0o4YmVrb0xmU2krNk5JNmxaNmEwZ0tEcXJyZnJiM2hYQXVWZCtB?=
 =?utf-8?B?WWJ5VDhWaWlQWWcwOTN4Z1MvbEVURmtHSXBYTk43aXoyZFdhNXNaY3Izazkz?=
 =?utf-8?B?UVpUbzVJTEdTRTJhMVo5YTdBRnJzMFU4NkRGVnlTSTRWTEZ3Y0xnRGNEY2dH?=
 =?utf-8?B?SUhhU3VqRkpDOFZTUWE0Qk9vemhmNWk1YkFnYTIzUUh6SnVtTjY2QVFEZ0RC?=
 =?utf-8?B?VktsMVJ4VHR3d1lzTU5SVTdIQklNMm85dFdYU3ZmNS9sK2YvdmNZanNrb3RZ?=
 =?utf-8?B?Zk51RDV3N2Ewb3hWY2E4QkxOOEdCcURhdEIzQnRvajhTalFUbjYxakcxVnlK?=
 =?utf-8?B?SERQS3A5RkEvc0xhVTdJWXVTUjhkRUZxbTVzSmR3NG5BTkdjQkVNRTR6Ylh2?=
 =?utf-8?B?bHg0Z0dOTXJmYUltSmFYaWlONkQ3emhlVHhCZHU3bjJMcTNLM3hTTjdVWWZj?=
 =?utf-8?B?ZTdGRUZ0SEJpNUFnY2NCaTh6dWFDNFI0K1lqYytrbU55MjZiMjM3eHVPTEN4?=
 =?utf-8?B?Z2k3UXI5cE5xVFd6b29WczBndkxCbWQ5VENFYTc3Ny9ISTBCUnRWeGFUOEhS?=
 =?utf-8?B?SHdLZHB2TDRueG1YK0lSZXV4T0twb3YyNTBJSEsvbkN4bFh3bGdtbXQvUWJD?=
 =?utf-8?B?cTZDU2NJRW9kZGZjdHRYS1F2bUVucndCNHFCcUxTTjQxTEhLREVvUlVWZTlv?=
 =?utf-8?B?K1hVczV4YzVjNUp2N1R2ejk2bXVOdnJIbklWQzVhZk9hSUR1eDlDK1NVVC9t?=
 =?utf-8?B?VHVTV2FSTTFvSHlXSmVDVGI0S1VvK3dMUUU1cG5ib3BuU0RqY2cyb1pubjRB?=
 =?utf-8?B?cHhQUlN0UFA0cVJ4bk8xdnVZNEdITjJnNnpJZC9uWFdJN0gzd1NneXlzQUdV?=
 =?utf-8?B?MmhMdzBOM0dpUUkvaXpMRDFXcUljVWFHd1pSQ0RwVGpraXpLSmRzbFFoRWpX?=
 =?utf-8?B?RHpwYUZ2SVkvaTBrN1cwd1FIOWppWklVRnJYbEVBdFVZZGcxZTk1Tk1SS1I0?=
 =?utf-8?B?TlBUL0Z4ODVLU0dYSWRXNzRSVmh6Y0dZRmNrMEZtN3dSNGFDb0hQa0kvdjU1?=
 =?utf-8?B?NVJLSmFLN2xuSXlYSVU4NXNwNTg1WFk0Zi9JMHJiMS9zUVpHbjBTdEFzWUhR?=
 =?utf-8?Q?hVDGIh0glwk6nYqZwB8iZ1prI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b9f75c-2708-47fa-4782-08dc01e3b84c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 05:14:34.4445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: djmCioEnSBTCIw+DLk54a/z7sRwgm/xsb10ioWGb5BwmsNWEEH/zjD0MKIvjLrftzGcTeLruQjVqPTXvxYqdeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8692
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Umesh

Thanks for the review

On 12/21/2023 6:19 AM, Umesh Nerlige Ramappa wrote:
> On Thu, Dec 07, 2023 at 06:27:56PM +0530, Riana Tauro wrote:
>> GuC provides engine busyness ticks as a 64 bit counter which count
>> as clock ticks. These counters are maintained in a
>> shared memory buffer and updated on a continuous basis.
>>
>> Add functions that initialize Engine busyness and get
>> the current accumulated busyness.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> drivers/gpu/drm/xe/Makefile                 |   1 +
>> drivers/gpu/drm/xe/abi/guc_actions_abi.h    |   1 +
>> drivers/gpu/drm/xe/xe_gt.c                  |  13 ++
>> drivers/gpu/drm/xe/xe_gt.h                  |   2 +
>> drivers/gpu/drm/xe/xe_guc.c                 |   7 +
>> drivers/gpu/drm/xe/xe_guc_engine_busyness.c | 153 ++++++++++++++++++++
>> drivers/gpu/drm/xe/xe_guc_engine_busyness.h |  17 +++
>> drivers/gpu/drm/xe/xe_guc_fwif.h            |  15 ++
>> drivers/gpu/drm/xe/xe_guc_types.h           |   6 +
>> 9 files changed, 215 insertions(+)
>> create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_busyness.c
>> create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_busyness.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 86691f3b9077..7418e6a07bc8 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -83,6 +83,7 @@ xe-y += xe_bb.o \
>>     xe_guc_ads.o \
>>     xe_guc_ct.o \
>>     xe_guc_debugfs.o \
>> +    xe_guc_engine_busyness.o \
>>     xe_guc_hwconfig.o \
>>     xe_guc_log.o \
>>     xe_guc_pc.o \
>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h 
>> b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> index 3062e0e0d467..d87681ca89bc 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> @@ -139,6 +139,7 @@ enum xe_guc_action {
>>     XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
>>     XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>>     XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>> +    XE_GUC_ACTION_SET_DEVICE_ENGINE_UTILIZATION = 0x550C,
>>     XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
>>     XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
>>     XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 154d6c7072b9..3d735b66f60d 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -31,6 +31,7 @@
>> #include "xe_gt_sysfs.h"
>> #include "xe_gt_tlb_invalidation.h"
>> #include "xe_gt_topology.h"
>> +#include "xe_guc_engine_busyness.h"
>> #include "xe_guc_exec_queue_types.h"
>> #include "xe_guc_pc.h"
>> #include "xe_hw_fence.h"
>> @@ -783,3 +784,15 @@ struct xe_hw_engine 
>> *xe_gt_any_hw_engine_by_reset_domain(struct xe_gt *gt,
>>
>>     return NULL;
>> }
>> +
>> +/**
>> + * xe_gt_engine_busy_ticks - Return current accumulated engine 
>> busyness ticks
>> + * @gt: GT structure
>> + * @hwe: Xe HW engine to report on
>> + *
>> + * Returns accumulated ticks @hwe was busy since engine stats were 
>> enabled.
>> + */
>> +u64 xe_gt_engine_busy_ticks(struct xe_gt *gt, struct xe_hw_engine *hwe)
>> +{
>> +    return xe_guc_engine_busyness_ticks(&gt->uc.guc, hwe);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>> index a818cc9c8fd0..2e3cd7031287 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.h
>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>> @@ -42,6 +42,8 @@ int xe_gt_resume(struct xe_gt *gt);
>> void xe_gt_reset_async(struct xe_gt *gt);
>> void xe_gt_sanitize(struct xe_gt *gt);
>>
>> +u64 xe_gt_engine_busy_ticks(struct xe_gt *gt, struct xe_hw_engine *hwe);
>> +
>> /**
>>  * xe_gt_any_hw_engine_by_reset_domain - scan the list of engines and 
>> return the
>>  * first that matches the same reset domain as @class
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 482cb0df9f15..6116aaea936f 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -18,6 +18,7 @@
>> #include "xe_gt.h"
>> #include "xe_guc_ads.h"
>> #include "xe_guc_ct.h"
>> +#include "xe_guc_engine_busyness.h"
>> #include "xe_guc_hwconfig.h"
>> #include "xe_guc_log.h"
>> #include "xe_guc_pc.h"
>> @@ -306,9 +307,15 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>>
>> int xe_guc_post_load_init(struct xe_guc *guc)
>> {
>> +    int err;
>> +
>>     xe_guc_ads_populate_post_load(&guc->ads);
>>     guc->submission_state.enabled = true;
>>
>> +    err = xe_guc_engine_busyness_init(guc);
>> +    if (err)
>> +        return err;
>> +
>>     return 0;
>> }
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c 
>> b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
>> new file mode 100644
>> index 000000000000..287429e31e6c
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
>> @@ -0,0 +1,153 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +#include "xe_guc_engine_busyness.h"
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include "abi/guc_actions_abi.h"
>> +#include "xe_bo.h"
>> +#include "xe_guc.h"
>> +#include "xe_guc_ct.h"
>> +
>> +/**
>> + * DOC: Xe GuC Engine Busyness
>> + *
>> + * GuC >= 70.11.1 maintains busyness counters in a shared memory 
>> buffer for each
>> + * engine on a continuous basis. The counters are all 64 bits and 
>> count in clock
>> + * ticks. The values are updated on context switch events and 
>> periodicaly on a
>> + * timer internal to GuC. The update rate is guaranteed to be at 
>> least 2Hz (but with
>> + * a caveat that is not real time, best effort only).
>> + *
>> + * engine busyness ticks (ticks_engine) : clock ticks for which 
>> engine was active
>> + */
>> +
>> +static void guc_engine_busyness_usage_map(struct xe_guc *guc,
>> +                      struct xe_hw_engine *hwe,
>> +                      struct iosys_map *engine_map)
> 
> indent slightly off
This is probably due to the mail settings. Didn't get any checkpatch 
error. Will recheck
> 
>> +{
>> +    struct iosys_map *map;
>> +    size_t offset;
>> +    u32 instance;
>> +    u8 guc_class;
>> +
>> +    guc_class = xe_engine_class_to_guc_class(hwe->class);
>> +    instance = hwe->logical_instance;
>> +
>> +    map = &guc->busy.bo->vmap;
>> +
>> +    offset = offsetof(struct guc_engine_observation_data,
>> +              engine_data[guc_class][instance]);
>> +
>> +    *engine_map = IOSYS_MAP_INIT_OFFSET(map, offset);
>> +}
>> +
>> +static void guc_engine_busyness_get_usage(struct xe_guc *guc,
>> +                      struct xe_hw_engine *hwe,
>> +                      u64 *_ticks_engine)
> 
> I would swap the _ between the local ticks_engine and the one passed to 
> the function or better just use a different name for the local variable.
Will fix this
> 
>> +{
>> +    struct iosys_map engine_map;
>> +    u64 ticks_engine = 0;
>> +    int i = 0;
>> +
>> +    guc_engine_busyness_usage_map(guc, hwe, &engine_map);
>> +
>> +#define read_engine_usage(map_, field_) \
>> +    iosys_map_rd_field(map_, 0, struct guc_engine_data, field_)
>> +
>> +    do {
>> +        ticks_engine = read_engine_usage(&engine_map, 
>> total_execution_ticks);
>> +
>> +        if (read_engine_usage(&engine_map, total_execution_ticks) == 
>> ticks_engine)
>> +            break;
>> +    } while (++i < 6);
>> +
>> +#undef read_engine_usage
>> +
>> +    if (_ticks_engine)
>> +        *_ticks_engine = ticks_engine;
>> +}
>> +
>> +static void guc_engine_busyness_enable_stats(struct xe_guc *guc)
>> +{
>> +    u32 ggtt_addr = xe_bo_ggtt_addr(guc->busy.bo);
>> +    u32 action[] = {
>> +        XE_GUC_ACTION_SET_DEVICE_ENGINE_UTILIZATION,
>> +        ggtt_addr,
>> +        0,
>> +    };
>> +    struct xe_device *xe = guc_to_xe(guc);
>> +    int ret;
>> +
>> +    ret = xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>> +    if (ret)
>> +        drm_err(&xe->drm, "Failed to enable usage stats %pe", 
>> ERR_PTR(ret));
>> +}
>> +
>> +static void guc_engine_busyness_fini(struct drm_device *drm, void *arg)
>> +{
>> +    struct xe_guc *guc = arg;
>> +
>> +    xe_bo_unpin_map_no_vm(guc->busy.bo);
>> +}
>> +
>> +/*
>> + * xe_guc_engine_busyness_ticks - Gets current accumulated
>> + *                  engine busyness ticks
>> + * @guc: The GuC object
>> + * @hwe: Xe HW Engine
>> + *
>> + * Returns current acculumated ticks @hwe was busy when engine stats 
>> are enabled.
>> + */
>> +u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct 
>> xe_hw_engine *hwe)
>> +{
>> +    u64 ticks_engine;
>> +
>> +    guc_engine_busyness_get_usage(guc, hwe, &ticks_engine);
>> +
>> +    return ticks_engine;
>> +}
>> +
>> +/*
>> + * xe_guc_engine_busyness_init - Initializes the GuC Engine Busyness
>> + * @guc: The GuC object
>> + *
>> + * Initialize GuC engine busyness, only called once during driver load
>> + * Supported only on GuC >= 70.11.1
>> + *
>> + * Return: 0 on success, negative error code on error.
>> + */
>> +int xe_guc_engine_busyness_init(struct xe_guc *guc)
>> +{
>> +    struct xe_device *xe = guc_to_xe(guc);
>> +    struct xe_gt *gt = guc_to_gt(guc);
>> +    struct xe_tile *tile = gt_to_tile(gt);
>> +    struct xe_bo *bo;
>> +    u32 size;
>> +    int err;
>> +
>> +    /* Initialization already done */
>> +    if (guc->busy.bo)
>> +        return 0;
>> +
>> +    size = PAGE_ALIGN(sizeof(struct guc_engine_observation_data));
>> +
>> +    bo = xe_bo_create_pin_map(xe, tile, NULL, size,
>> +                  ttm_bo_type_kernel,
>> +                  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
>> +                  XE_BO_CREATE_GGTT_BIT);
>> +
>> +    if (IS_ERR(bo))
>> +        return PTR_ERR(bo);
>> +
>> +    guc->busy.bo = bo;
>> +
>> +    guc_engine_busyness_enable_stats(guc);
>> +
>> +    err = drmm_add_action_or_reset(&xe->drm, 
>> guc_engine_busyness_fini, guc);
> 
> Wondering if we need to store the busyness values prior to reset and 
> restore them afterwards. Depends on what type of reset this is. Does 
> this reset GuC as well?
drmm_add_action_or_reset is for cleanup action on the last dev_put

The storing of the prev values were added in a later patch based on a 
runtime suspend issue
https://patchwork.freedesktop.org/patch/572090/?series=126919&rev=3
> 
>> +    if (err)
>> +        return err;
>> +
>> +    return 0;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.h 
>> b/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
>> new file mode 100644
>> index 000000000000..d70f06209896
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GUC_ENGINE_BUSYNESS_H_
>> +#define _XE_GUC_ENGINE_BUSYNESS_H_
>> +
>> +#include <linux/types.h>
>> +
>> +struct xe_hw_engine;
>> +struct xe_guc;
>> +
>> +int xe_guc_engine_busyness_init(struct xe_guc *guc);
>> +u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct 
>> xe_hw_engine *hwe);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h 
>> b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> index 4dd5a88a7826..c8ca5fe97614 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> @@ -37,6 +37,7 @@
>> #define GUC_COMPUTE_CLASS        4
>> #define GUC_GSC_OTHER_CLASS        5
>> #define GUC_LAST_ENGINE_CLASS        GUC_GSC_OTHER_CLASS
>> +#define GUC_MAX_OAG_COUNTERS        8
>> #define GUC_MAX_ENGINE_CLASSES        16
>> #define GUC_MAX_INSTANCES_PER_CLASS    32
>>
>> @@ -222,6 +223,20 @@ struct guc_engine_usage {
>>     struct guc_engine_usage_record 
>> engines[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>> } __packed;
>>
>> +/* Engine busyness stats */
>> +struct guc_engine_data {
>> +    u64 total_execution_ticks;
>> +    u64 reserved;
>> +} __packed;
>> +
>> +struct guc_engine_observation_data {
>> +    struct guc_engine_data 
>> engine_data[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>> +    u64 oag_busy_data[GUC_MAX_OAG_COUNTERS];
>> +    u64 total_active_ticks;
>> +    u64 gt_timestamp;
>> +    u64 reserved1;
>> +} __packed;
>> +
>> /* This action will be programmed in C1BC - SOFT_SCRATCH_15_REG */
>> enum xe_guc_recv_message {
>>     XE_GUC_RECV_MSG_CRASH_DUMP_POSTED = BIT(1),
>> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h 
>> b/drivers/gpu/drm/xe/xe_guc_types.h
>> index cd80802e8918..4e9602301aed 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
>> @@ -70,6 +70,12 @@ struct xe_guc {
>>         u32 size;
>>     } hwconfig;
>>
>> +    /** @busy: Engine busyness */
>> +    struct {
>> +        /** @bo: GGTT buffer object of engine busyness that is shared 
>> with GuC */
>> +        struct xe_bo *bo;
>> +    } busy;
>> +
>>     /**
>>      * @notify_reg: Register which is written to notify GuC of H2G 
>> messages
>>      */
> 
> Except for some minor comments above, this lgtm,
> 
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Thank you
Riana
> 
> 
>> -- 2.40.0
>>
