Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8107AC0015E
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 01:12:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5359110E2AC;
	Wed, 16 Aug 2023 01:12:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D855810E2AC
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 01:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692148328; x=1723684328;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=v8NsxOXaLS6cRq728wqxWBELye4RPj161gGdfV+MrH8=;
 b=GroLEnYtVZC40T6KbKNnwmWVOV91AnLaelfZzPJ0/IWiE7pFBVIG5w67
 jOQ7ekVkmjxvPGzulz+4KsCKN2qtmIk7yiYT4TgDr3PmU7zqX8JOqFYio
 Vx1gXPDovuLr8aykzNvol+yY5PQiAL16cUckgf89k49j9wlXj/4AsozYG
 XXAPQcJ1EiPkE1lz39k0INl+IR2rs3w6QveuWVrgvGEAS5AWAmUYDTWDs
 6N5d3O7nPc8gql5ckkMIPIimwvXFSIhkyXXN3BkCkfBCFfWFrkWMU8iAP
 WaB4v6+sBowpG5F+T34pCzOPQUvjU2cvZoZnNNZpIWKi9S+7iSbI+satH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="376145004"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="376145004"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 18:12:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="1064633153"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="1064633153"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 15 Aug 2023 18:12:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 18:12:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 18:12:07 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 15 Aug 2023 18:12:07 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 15 Aug 2023 18:12:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JdM14X2EYbfmBZToZqeCRskHIJVFV3yBpANzmhcLMf0OiCGR88xF3/3Gx8iDWjEwDz8tRWqfvLL96rjuYW0VH6m2ftdzv7Rj08+QwjuvOhcEg5oZDiNy+iymWekPiiTqYN7Le1jxqGJRh0l8zi+OWtqCJMCfN/FYNhtz6y1ohZiIMFEwYZOXaOvM4pN+rQreJcJjTM4Yx9b44Eyl4k98wv9wZIONBDkO59jwyB/z8NUKH4fT1uY2tZyjFEG/xi1JNyZRaOgGs59Y7IzStKBrI7DxZZJE2Rl1AnERsbpYmhKKifmNbiBORMp9rzyQw0h4JHM9Cqq3OTlKg5RLxBOQQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NBFmC96cVKagkZeXG9DdyScIcowJkC0r7maaTqeTIAc=;
 b=RMMtH1hhLz+S2VlwQm409U9ajRzOl0PnYq85eDt496s85KPZrNCLUKLVmKCMxDDGEBPvD1gKFBpwSPTICOHRj+yMxkIBfNL2+fizzArP1EBuSWSUbgHCpv27gzQk4YqhRJq/A2e2KrAjsA/m6/Qmnd0chdzePtd/qVgfHs346ix6olPg+YArJ2BU1PWX7faZZE+XMizYH/Kup83zBNkq0wY+Wk/C3r1C62Y1jaVz+cvLuIkFxiozVJS6tlXFQwyGf4RvzYCFkF4+Vy71BB9QQ7jAVaONdJlW7kyzcGr4Q+6soIW8MiWHpqW4bRKg+0VVDhGIpNxlSbIpKLyGq2kMWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 CH3PR11MB7300.namprd11.prod.outlook.com (2603:10b6:610:150::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 01:12:05 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::5f98:c6b:6aa8:4a8d]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::5f98:c6b:6aa8:4a8d%2]) with mapi id 15.20.6678.025; Wed, 16 Aug 2023
 01:12:04 +0000
Date: Tue, 15 Aug 2023 18:11:55 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <ZNwiW3GZmvcS+pqP@orsosgc001.jf.intel.com>
References: <20230808013159.38811-1-ashutosh.dixit@intel.com>
 <20230808013159.38811-2-ashutosh.dixit@intel.com>
 <871qg4t132.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <871qg4t132.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0264.namprd03.prod.outlook.com
 (2603:10b6:303:b4::29) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|CH3PR11MB7300:EE_
X-MS-Office365-Filtering-Correlation-Id: f3161218-d1ff-4ff5-17cd-08db9df5cd9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VnaLUef3zyUbDim3U85ufbkiVPrE7fxcicm6gC25wnOWRUkKIZz+jlZlAMayeJVRXOss/80WRWAX+iuBGyphnqDQzNehIFhC854ocZ0fqVU2U98tm/kSZaUfF+a8ABuJg8oBVAneqRF1JoTsjLhfjcdhuobynvUkeCoXD0cZr+r1Xouaa+yPcKLOP209cyunsA7vcSbwo8qin7kIwrnETJev8gMtgKp5hI1FIOS4+JicY2/5IcARjPlQbKeO7eZODeznZIcy5FkkKSNr5/k1G3EsJYCYooCBYgjtcZKpuvQQ615I1i2D0Pg0Xi5FWAddOV/bNi0mJ/j7M8l8eI0fCcOk0poAzlK9wcorb4JWypWWdFOINZp/C2aLU4p3h+tcsZTpLccAUgVyTkdSaMAl/IjMjIkRWYpXUnf+z9xm6ioLeKp5gywRMdQymxlWJ8vQ9APCewM0eM5CVQaAC5mf0s5TIcV7H46uecrARPX/1Afg1Uk+Ayka2a3LXJ8nquDlviylMXi6dJ1ChfiqJfJy3jaVPQ6cDI0MXgLrTYyQKZJKx4epW5dgEqBNuBesxSvBpDTzmrtNLYDB8RtwldhHxnhzjsXOuSsSK1sWEu0iwg0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(376002)(366004)(136003)(451199024)(186009)(1800799009)(6862004)(316002)(6486002)(5660300002)(478600001)(82960400001)(86362001)(66476007)(2906002)(4326008)(6666004)(8676002)(26005)(41300700001)(38100700002)(6512007)(6506007)(6636002)(66556008)(66946007)(8936002)(83380400001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEQyOEo5cCsyWlBNMUFTNkVuUUUvVGtNRlBrUjhZRzZqbEptVUNjeVJ5Q3cr?=
 =?utf-8?B?bjhQazFlamdiRTNPN1JwVHQza2k0R24vTXpiV2V3dmVWYmxLSjM5SDE4Wkk2?=
 =?utf-8?B?bnBHaUh2OVIvbCtqT1ZoM3pSdnFwc2h4U1pyVW1CS1MrWDdydzNTQ3VsakNw?=
 =?utf-8?B?amJkVk9iTHJ4S1Nnci9YUTJ3ODhXMWZOME54RTd0MHI3ZUlSaHRuUGJJWWVJ?=
 =?utf-8?B?NVIwcjVnRVlTSUFKVWNDdWcxb0paWmhrT25ETExHL0plLzRjTmxDNTZ1MFlh?=
 =?utf-8?B?TlVkRVppMkN5SDNoN1l5SWo3amJtd1NkQkNoeitsZWNCMFkvTVJKeHBJVk0v?=
 =?utf-8?B?bVNrV0E5ZkdxbnA5SnRsRzFUbnROSmpvM2ZhVDZLSlFmVFYwTXFMQUNDdyty?=
 =?utf-8?B?SzR4RnJVVlZhSjBXRlBYRXhJajFqSk9xNkMzVE9UZlV6WUp4a0lkcmhFVk8y?=
 =?utf-8?B?bzEyNStZUFF0UnAzYWJTZ1VoanNPZHZvRzc1M1d0OTNab0drUHo0UlBlRUtm?=
 =?utf-8?B?cldnVzQ3Tm9hWFFNbnk2LzErZEw0TC9OZHJkQm9ieVF5YXZvVng3OGNreE83?=
 =?utf-8?B?Myt0QUtjc243aXFWRktoVlQ2THdqeXBxN3Bpa1c5WUs1WWZzLzcxUFpjZFhR?=
 =?utf-8?B?ZGxQWmdRVm12S1MrOVVDYzgxdVY3YWhUUmJNMDkyOU1DYmJEQnI0NlJWVDNm?=
 =?utf-8?B?OExrUEkzOStJOFN3SFdvc3pjdzROVmJvcXhhR2wzZjhyUS9Kc2dVeTRLdzZW?=
 =?utf-8?B?ejZuUVYrcTBMZnprUmJRRmhKb3VVSEx0MjFTTmc5NCsyOVNkMnpSVnd2RDNv?=
 =?utf-8?B?ODZ0Vkcra0ZGZElMUXlJZVlQZEFuQWFyZjZWS0RMYTNsbXBJU0xVOG1Cblph?=
 =?utf-8?B?UzhlZWZzL01HWWdSTGJoa21ZOHlJcXYyeTNtQnR4V0locHJVcytUanN1ZnVK?=
 =?utf-8?B?eTdwNnlFcCtIdEdndnQ4Z2RhbmY0SUp5Y0hZdUdlbURqYnl0ajgyblNsc2dp?=
 =?utf-8?B?dUZYMzdvbUJ4UlVncEc4RDNDazJoVlAvZk9CY01CNHlGYXc5cTBXbE9sWlB6?=
 =?utf-8?B?Szc1VGFjZDRiTDVuaTRnQXRPclZHS3cydVBSdkNxcyt6QzZEVGdnNnVMdTFI?=
 =?utf-8?B?U3Z0QmVVckZ5Z1lGelR1dDY3QUFXeUZiZmt0UnAyZ3dNVVcwRTdpVGlWMFlM?=
 =?utf-8?B?Sy9FUHltbG93cFZsdlk3c1psQ0gvNXdlWmpkMXpibUZGVmM3VGZObWx4UUYy?=
 =?utf-8?B?MHZQbGtLMStNSDNNMzhZVFIvbVRBMEFEWHpXTXpEOW5KeTdJWFZHS3A2ZG1W?=
 =?utf-8?B?dXVZUUVjZGZ5THN2N3ZEb1d0aVBpbUtDcW9MckEwN2E3WTE5SmZVcURJMkN2?=
 =?utf-8?B?WnlEVGhkbGpRalFZKzNpZEtYdDFFM2lBbkJFMDF0OVIzU2tVUDNiSVRXUU9C?=
 =?utf-8?B?ajUxY01VcllKKzlBcWhiTk9NaUwzWTZoaTlHZ3VGMmI3UEs0Qm8xcGF3VWl0?=
 =?utf-8?B?Z21teUVCZmR0Rk1pUDJtcGFtU3FSMXh3a3NiUDNROVhyNHhXUWFhSVFrTmQy?=
 =?utf-8?B?TUY5M3lnTXNHSGxRRWFhWnM0aFJ6WitXSGUxUHhLNUovbzZXYitMNFcyL3dX?=
 =?utf-8?B?QzBNZWlsRXIvVitBYmI3S041QlVNay93MzhLb3BDOVhsOWtVVEliWXdQMzNI?=
 =?utf-8?B?akhqWGp0Vy8xQWZnTkpGb3NIQTFDakZBV3g0VEN0and2aTU5N0xwNFo5WHVl?=
 =?utf-8?B?bmpFWkE0VXhPSkVzVGxCR3VtelVkVkhnN3RZajVhUm51cXB6c3ZEUlhqYzhU?=
 =?utf-8?B?QTZmM2srSFk0NmgyUGl3M1BJNUFBS0FIV08zRkxrdURlMWI4RnI1M015WmxJ?=
 =?utf-8?B?UjJkL1hYYVN5cUNyV1NkUHR1R0UyZHRYLzJEak55UzFLL3YyM3ROSERFMHFk?=
 =?utf-8?B?N1lYNHpPYVN6MnZpcm0vVGhxOEdRTytJbmhuN3NyTG0vNzZ1Q3FkVk13SzBx?=
 =?utf-8?B?NW9kR3MzYnNXdHcrbGc1T1YrKzR5REt2b281UElpTnNvWW12dlNPOHFpSWoy?=
 =?utf-8?B?bmlCb2ZneVBvRkQvT1AwM1hBSUtWN1RORzZmdytCRUdOZDFxTkM1TFdwK2JW?=
 =?utf-8?B?ODYxUXdlN2ZTRU1vaTF5RmtORFh6akRVSEFwKzFNZUFyM3J6bW5LRkFHdm5p?=
 =?utf-8?Q?jgWSJ5II1XVoSKB7HFHUfbw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3161218-d1ff-4ff5-17cd-08db9df5cd9b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 01:12:04.6877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hHB9RT+lcQW+o9ufwWY9g3sUhNlTebOFy8zKtiw1g4UdqnhwaidDY5eZK9qpUy+cO5sXGT8dswCh9JueeyoLcOofNZYL2ABH43n/MMcwAi0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7300
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 01/10] drm/xe/oa: Introduce OA uapi
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

On Tue, Aug 15, 2023 at 03:03:45PM -0700, Dixit, Ashutosh wrote:
>On Mon, 07 Aug 2023 18:31:50 -0700, Ashutosh Dixit wrote:
>>
>
>A couple of other comments on the the uAPI.
>
>> OA uapi allows userspace to:
>> * Read streams of performance counters written by hardware
>> * Configure (and reconfigure) which sets of perf counters are captured as
>>   part of OA streams
>> * Configure other properties (such as format and periodicity) of such
>>   captures.
>> * Query associated parameters such as OA unit timestamp freq, oa_unit_id's
>>   for hw engines and OA ioctl version
>>
>> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> ---
>>  include/uapi/drm/xe_drm.h | 257 +++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 256 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 86f16d50e9ccc..b4ab07c285245 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -111,6 +111,9 @@ struct xe_user_extension {
>>  #define DRM_XE_WAIT_USER_FENCE		0x0b
>>  #define DRM_XE_VM_MADVISE		0x0c
>>  #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0d
>> +#define DRM_XE_OA_OPEN			0x36
>> +#define DRM_XE_OA_ADD_CONFIG		0x37
>> +#define DRM_XE_OA_REMOVE_CONFIG		0x38
>>
>>  /* Must be kept compact -- no holes */
>>  #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
>> @@ -127,6 +130,9 @@ struct xe_user_extension {
>>  #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
>>  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>>  #define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
>> +#define DRM_IOCTL_XE_OA_OPEN			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OA_OPEN, struct drm_xe_oa_open_param)
>> +#define DRM_IOCTL_XE_OA_ADD_CONFIG		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OA_ADD_CONFIG, struct drm_xe_oa_config)
>> +#define DRM_IOCTL_XE_OA_REMOVE_CONFIG		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OA_REMOVE_CONFIG, __u64)
>
>In current and future HW, there are other HW blocks which generate
>performance counter streams. There is an ask to expose these streams also
>using the uapi introduced here. Specifically the ask is to replace "OA" in
>these and the ioctls below by "PERF" (similar to i915) and support OA
>streams as only one of the perf counter stream types supported under
>PERF. But the PERF interface would be able to support other types of perf
>streams too.
>
>We are planning to make this change in the next version of these patches.
>
>>
>>  /**
>>   * enum drm_xe_memory_class - Supported memory classes.
>> @@ -261,7 +267,8 @@ struct drm_xe_query_config {
>>  #define XE_QUERY_CONFIG_GT_COUNT		4
>>  #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
>>  #define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
>> -#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1)
>> +#define XE_QUERY_OA_IOCTL_VERSION		7
>> +#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_OA_IOCTL_VERSION + 1)
>>	/** @info: array of elements containing the config info */
>>	__u64 info[];
>>  };
>> @@ -298,6 +305,7 @@ struct drm_xe_query_gts {
>>		__u64 native_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
>>		__u64 slow_mem_regions;		/* bit mask of instances from drm_xe_query_mem_usage */
>>		__u64 inaccessible_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
>> +		__u64 oa_timestamp_freq;
>>		__u64 reserved[8];
>>	} gts[];
>>  };
>> @@ -753,6 +761,7 @@ struct drm_xe_engine_class_instance {
>>
>>	__u16 engine_instance;
>>	__u16 gt_id;
>> +	__u16 oa_unit_id;
>>  };
>>
>>  struct drm_xe_exec_queue_create {
>> @@ -1056,6 +1065,252 @@ struct drm_xe_vm_madvise {
>>	__u64 reserved[2];
>>  };
>>
>> +enum drm_xe_oa_format {
>> +	XE_OA_FORMAT_C4_B8 = 7,
>> +
>> +	/* Gen8+ */
>> +	XE_OA_FORMAT_A12,
>> +	XE_OA_FORMAT_A12_B8_C8,
>> +	XE_OA_FORMAT_A32u40_A4u32_B8_C8,
>> +
>> +	/* DG2 */
>> +	XE_OAR_FORMAT_A32u40_A4u32_B8_C8,
>> +	XE_OA_FORMAT_A24u40_A14u32_B8_C8,
>> +
>> +	/* MTL OAM */
>> +	XE_OAM_FORMAT_MPEC8u64_B8_C8,
>> +	XE_OAM_FORMAT_MPEC8u32_B8_C8,
>> +
>> +	XE_OA_FORMAT_MAX	    /* non-ABI */
>> +};
>> +
>> +enum drm_xe_oa_property_id {
>> +	/**
>> +	 * Open the stream for a specific exec queue id (as used with
>> +	 * drm_xe_exec). A stream opened for a specific exec queue id this
>> +	 * way won't typically require root privileges.
>> +	 */
>> +	DRM_XE_OA_PROP_EXEC_QUEUE_ID = 1,
>> +
>> +	/**
>> +	 * A value of 1 requests the inclusion of raw OA unit reports as
>> +	 * part of stream samples.
>> +	 */
>> +	DRM_XE_OA_PROP_SAMPLE_OA,
>> +
>> +	/**
>> +	 * The value specifies which set of OA unit metrics should be
>> +	 * configured, defining the contents of any OA unit reports.
>> +	 */
>> +	DRM_XE_OA_PROP_OA_METRICS_SET,
>> +
>> +	/**
>> +	 * The value specifies the size and layout of OA unit reports.
>> +	 */
>> +	DRM_XE_OA_PROP_OA_FORMAT,
>> +
>> +	/**
>> +	 * Specifying this property implicitly requests periodic OA unit
>> +	 * sampling and (at least on Haswell) the sampling frequency is derived
>> +	 * from this exponent as follows:
>> +	 *
>> +	 *   80ns * 2^(period_exponent + 1)
>> +	 */
>> +	DRM_XE_OA_PROP_OA_EXPONENT,
>> +
>> +	/**
>> +	 * Specifying this property is only valid when specify a context to
>> +	 * filter with DRM_XE_OA_PROP_ENGINE_ID. Specifying this property
>> +	 * will hold preemption of the particular engine we want to gather
>> +	 * performance data about.
>> +	 */
>> +	DRM_XE_OA_PROP_HOLD_PREEMPTION,
>> +
>> +	/**
>> +	 * Specifying this pins all contexts to the specified SSEU power
>> +	 * configuration for the duration of the recording.
>> +	 *
>> +	 * This parameter's value is a pointer to a struct
>> +	 * drm_xe_gem_context_param_sseu (TBD).
>> +	 */
>> +	DRM_XE_OA_PROP_GLOBAL_SSEU,
>> +
>> +	/**
>> +	 * This optional parameter specifies the timer interval in nanoseconds
>> +	 * at which the xe driver will check the OA buffer for available data.
>> +	 * Minimum allowed value is 100 microseconds. A default value is used by
>> +	 * the driver if this parameter is not specified. Note that larger timer
>> +	 * values will reduce cpu consumption during OA perf captures. However,
>> +	 * excessively large values would potentially result in OA buffer
>> +	 * overwrites as captures reach end of the OA buffer.
>> +	 */
>> +	DRM_XE_OA_PROP_POLL_OA_PERIOD,
>> +
>> +	/**
>> +	 * Multiple engines may be mapped to the same OA unit. The OA unit is
>> +	 * identified by class:instance of any engine mapped to it.
>> +	 *
>> +	 * This parameter specifies the engine class and must be passed along
>> +	 * with DRM_XE_OA_PROP_OA_ENGINE_INSTANCE.
>> +	 */
>> +	DRM_XE_OA_PROP_OA_ENGINE_CLASS,
>> +
>> +	/**
>> +	 * This parameter specifies the engine instance and must be passed along
>> +	 * with DRM_XE_OA_PROP_OA_ENGINE_CLASS.
>> +	 */
>> +	DRM_XE_OA_PROP_OA_ENGINE_INSTANCE,
>
>Because oa_unit_id has been introduced above in
>drm_xe_engine_class_instance, should we remove these engine class/instance
>properties? Since it seems OA streams can be opened directly against the oa
>unit identified by oa_unit_id. And the driver can itself figure out the
>engine class/instance from the oa_unit_id?

Agree for the OA buffer use case.

For query, we have used the class:instance to enable query support for 
specific engine instance. If we can work around that somehow, then we 
can do away with these 2 params. More like enable query for all engines 
that belong to the OAG unit. For render, it is straight forward since we 
have one render per OAG unit. For compute, multiple compute instances 
can map to one OAG unit and only one instance can support the query. So 
user may want to choose which instance that is. Although, I would just 
simplify it and support only instance 0 of compute. If UMD is okay with 
it, then we should be good.

Media engines do not support query, so we should be good for OAM.

Thanks,
Umesh

>
>Separately, there is also the question of whether we want to share the Xe
>OA IGT code with i915 as was done for this series. Since duplicating the
>IGT code as well as all the perf tools seems a bit much.
>
>Thanks.
>--
>Ashutosh
