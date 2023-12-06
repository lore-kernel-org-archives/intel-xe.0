Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEA9C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 12:10:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4101310E0F0;
	Wed,  6 Dec 2023 12:10:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D27410E0F0
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 12:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701864611; x=1733400611;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0PUjgoI+1PbQJ9QPfBHIFuFFZkd8bqkBIAu+GBUknfU=;
 b=YklliLxzjV4rO5s2gX0Z7+TwxNXISg6RoIKpiHjqVWtGkXdl3qSjiXKX
 SlZLx1cuZw78gj14axSokvGsR2661SNlnVpN4j5v1VMon6pAV3bBJOleI
 dcBBH5uNKQ298Xf2CXsENxDnMT6L159bqj1Z/894uSLFDeQDgOYzCrMRF
 80/TIyZQAlq+f1WeyWewRTv9RUZ2dWUDXc8SdLKHFqfpe3t/2OnwilnAd
 A6hehSx4ZsU9BAtvn6SBW9jHBmCOMjTkubhnbAeRjpdIzgAqoopoZ8Xwg
 Qu9mdnKpGZS0BU8J38H/eVOKvb2SoLDg3lmAsZ6OCJVc1wIH5IjrKNX/E g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="393780940"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="393780940"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 04:10:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="771282551"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="771282551"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 04:10:10 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 04:10:10 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 04:10:09 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 04:10:09 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 04:10:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Krmp3s0GHp+CAWy6modI76qa/Kc7UXPweCS2HnfspghD2xDRxI8KEta5zAFfchvfgXBKr5nRbECKy5dfUjhLW+VgDERk7fPIpi6eJvGFPxHyo5l38a1oxAXfGCYqO7Fr2aCIjOV3KfxBvrm0f5bZxs6/MAtumqRefSf4M1xhLu6m4mRsdXgJabm+TzalkSVycyeOD6WGjA3a+09IUtKwGCZIvoB4g98j65WIo+BLJxjFXAcAnPYgspXeveM14Une1pBc+H2g7eYAsQd4d+1mDpdn7aUOBOyHTV6k2RokHqeKAfDjs6YyM/dPsIpWRwuMmjYKO27dCbL/XsG1qQbNyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dIfwYq7Odnj8hVYMmea03jP1NcFynKENiGvb7Poig0U=;
 b=K69Cupc7uVTOA8FsmJBfmWP2maj9foUYI4QOdoaxy2fx2OKvXutDeZEU796mqF5xaaQpLNWtsnfrkmrl6H0/APOk8xs1mYp8RfOGKcte+5+35QRYux1AC7CbL472DHJP6o8gEHvD0JTiZ21DWNIdApCBqF8odj60Xyti1k3pnREIF9WMWSaoz9gnPWY9e04rxRolhUPn42owetsMmpqhRPQ9p1HkakMy77GEy9Y09/hmXiMGHHe8TnGdDw2yPNiAzaKaOTwBaq6/WSMAJcfrunIVBKFSSuP3emDRBtwEvtEJrITV+3Trg2fiv1BTpEFKnwvAJ32Rt/KBGDQCV+MhRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 LV8PR11MB8745.namprd11.prod.outlook.com (2603:10b6:408:204::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 12:10:07 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.7068.025; Wed, 6 Dec 2023
 12:10:06 +0000
Message-ID: <2f788935-b301-4f9c-b0c6-2503485e6089@intel.com>
Date: Wed, 6 Dec 2023 17:40:01 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20231206044735.966213-1-sujaritha.sundaresan@intel.com>
 <20231206044735.966213-3-sujaritha.sundaresan@intel.com>
 <CY5PR11MB6211A0355A82DE0B8C9229119584A@CY5PR11MB6211.namprd11.prod.outlook.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <CY5PR11MB6211A0355A82DE0B8C9229119584A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0130.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::19) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|LV8PR11MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: a1f3dc76-64ef-4395-b11c-08dbf654490c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A3m+VtjLEtzM5pwJjMesJoDdjviGR5rVnppM68lOvyVX4nGXC7EHS2HSVNlF19lg3qyuGoFBdaPXG2m+Y75IA8VQMLtg9vjP2ucPti4Lt3BuvxEXCPadSVWNs3Mz3sp/eWxc9zv7ERSksiLCtmKj/STQzQP+bM5jLVlWZbhWyjd10Noaqb+zdsbgRT5OHLpCOsgGAA9+vBmy3aVkG+a6gW3hhyZfpnFfzj+uGZUfbQCXvmbYXqUB/pfwrnuSrbNV6nJu/eXsh1l2rndoZXMwc9pv9Rp3vbKAcYHxHaJDasw8CuYZMFNhoXigpyStVwO708fZTXvp7KvXf3mlNgXLwX3FQMPqEVAZfbx5xQylLQIzmMu6XYqFDbzUbfYE9KuDV0SVbendLEnc+GFOl01tOD7JlQspqzYFsO7WQp0YztsnmrLEwZMbrYUNK8EE52pz5fY4RFNT80LxhUs7JhDf5zQoJtsbBXKY24G43RE0pBZWQvzwwH5yCW5fjEx6v9vhac7Qvs4lIt7P/LLd+t+KkjJD4UmEWzjnvKtaqxA4MXj/ri69eiUPTdcGGZB3oV4+9SlFgIt5QqhRSfBrtsJq5JJLlSEKcUAPFS0fUMlP++779HUz+mjuPp6KpmEwKU10ZgtjbN6DgvI9f5ZXtY90eA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(136003)(39860400002)(396003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(41300700001)(4326008)(8676002)(82960400001)(38100700002)(86362001)(31696002)(36756003)(83380400001)(2906002)(8936002)(5660300002)(6506007)(6666004)(53546011)(26005)(107886003)(478600001)(6486002)(31686004)(2616005)(6512007)(66946007)(66476007)(66556008)(110136005)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFpBWFZzQkVTWitkem9DZGNPR0ZrNjUxd2ZoenJHNVRCZFZjZEQ5c2ZwM296?=
 =?utf-8?B?Nnd1cnY0UjRWZlBzSVFlSkNleFoyNzE4L3VvejZoMDNBclFObUZvUHhRdm01?=
 =?utf-8?B?SzFKYlhFSHE4VHdCUW5hRlJqVDYxZzA3V29TaThkb2NLY1VlcVhyaXFQOXlB?=
 =?utf-8?B?QTB2VWF5bDREcWorblppVE9qQ2Z4QW9jdG43RXo3Tlo0QkJTUENkM2k3TjhE?=
 =?utf-8?B?d1VKRnpUSFdOaGlsWDJ2eGZsWUdndkdqYW9Ha1JJLzlNOTI4ZVJyWW1TUGYv?=
 =?utf-8?B?SXZKNXB1YXdGNm1BMGY0YXE4c0FMU0JyNmZnRXk3akNwcTVtNXJud2JKd0FJ?=
 =?utf-8?B?U0Q2UnNzVEJLbmxwdlk3N1JpblVib0JvQWRvMVpNaVZTanE2WG5wMWdLelpM?=
 =?utf-8?B?dUkyK1VQWVdObmNZUzJiSzlpcktFMzBOU2JSVDlsUHZ5VGQvWjhtZHAxTW9r?=
 =?utf-8?B?cHY1bFdhZUNKUGxrWHhXTXJqd0hxaU5reUNHQ2FndGQ3bTF3TE1SZFozaUJw?=
 =?utf-8?B?UHIzYUZCSWcwcmhaSU9RcmhuU3JsSGEySmtBYjJaZHNucXE5UXR0TGgybmMr?=
 =?utf-8?B?K0lxbEF1T20vUU81ZU95ck5iVXJFZnVCTXJnRmJaM0dNc3U0L1FLa01ZOFNC?=
 =?utf-8?B?VDRPdnlDcjcvYnB0aktiRDRSVDRSdElYNnNrU3F6SEpsSCtHMVRPSWJLRkE3?=
 =?utf-8?B?ZGJjTThKMXgvekFXdnV4Tk1DekhUSXpoNi91WHltcVZuRFhPYzFYSDR3dkVr?=
 =?utf-8?B?Y2REL1NycXhNeStmQWJVOUFucU1ibmp4RGlYQUplVldkanJYRTcyL2dkdW5J?=
 =?utf-8?B?WWRmd3J5K3l1dGM2VmdwWGNQUWFCMksvcWlrUVpPSDFjNTkvelNIWE5VcUZ5?=
 =?utf-8?B?UWtRVXN2dGNoMGlSbGhqTWgxNDRnQWg1UHJMOThmR3FZV0Y1MW1SZ1JDSnNQ?=
 =?utf-8?B?cVZiM0c3dTdJVmpCekhWR3lJTC9vNmYraCtQdWc5emJ1TVpoWU0vZWdOM0tO?=
 =?utf-8?B?WjlnSGhOazNmOUJ5ZFdRaUk1Y1hwOXhkTDBRMjgrYmpnMERQT0ZCcHhUNXBC?=
 =?utf-8?B?R3BlN21MZnM0a3dZMTEvRWtnbk1yaUVCS2JHMUY3RkhsVjB3ODNlV2VEUSt2?=
 =?utf-8?B?QWZPK0dYR3kvenNkRk43TTBYemlZZHB1VTdsV2RybGJzcTd4eG9IVVFYUWZp?=
 =?utf-8?B?RFE5TUFWQ2NsejRnRnN4anNpb2xhcnp3RUZzTWVSZ2EzRGdVTlFDRzJNWlJ0?=
 =?utf-8?B?dHdvZEFZZjhnOVFaM2NMQmVFV0k3Q0JTTWFacnkrM0ZZWW5oMXdFOTZSMDhz?=
 =?utf-8?B?aUoxTk12eE1WNHN3TURQMGZ1WGpydThVaUh3TkNkR0xtTUsrdUc3cUJGdEpt?=
 =?utf-8?B?ZUp3TFVjaHBGcnRVVEJ0K08rZWV5QXljaC9sNGM3ZENVWGF2Ty9IOHk2UnpD?=
 =?utf-8?B?cGV1dUtubUZPZjhhbG1DVUNQSGtLYXBRZ2VwNjhQcmhqbjFiRG5oSTN4NWMw?=
 =?utf-8?B?QlpuRkgvU1o0V2x0RGRzL3pkVVowcUhEOXM5RDlDcWU3aWpNV3k3aHFDaXFD?=
 =?utf-8?B?TFRBRmw3cVpBa2UvdVlvZGE3bEtqY2ZyMzFOcWZ4bUVRbUZhTEw3bTZqTVJC?=
 =?utf-8?B?L3hGR1lUUjYyLzQ2NEd0eTNrQzYyTkR2NE5aeC91MHJxTG05M2VJeWhKMnUr?=
 =?utf-8?B?WjR0ZUMreXVIZ3Q0WEhRTVVpeHhISXN6Sk5PV2VOMDhlK1ZYVkgxeWJUbnUw?=
 =?utf-8?B?Ukl4bG9jdWRMVElzaHlINFNZaVlkNGh6S01zeUhnSzdoWTE2ZjRDYW1KNVZj?=
 =?utf-8?B?VTB6aTRtTzFDZ0t0YjJyaVAza2kwa2laenhtUG15YVQvelJ3TzFQc0tRcDlr?=
 =?utf-8?B?ZE5iL2d3T0NuS0xrVEI5a09tbFF2NzJ1d2N3MXRISWNVTE9IY0hBYm9ReUNr?=
 =?utf-8?B?bk02MVBMUkl0b216THFlVVFQdUQwY2JscTRYcm8yUE1iZmdFTHJlbXZTcEM0?=
 =?utf-8?B?bk9DTVJVVHRrRTVNWVlwKy94QlNJMS9kYWJhem9rZHZIdWRQcEFFempTSndO?=
 =?utf-8?B?ZHFnbmtiNUcrbmxMNTBseENKY29FWExmdzZGQUFneG9Db1FWNVNRSFdXZW1K?=
 =?utf-8?B?aTlBREE4am1tbndhY1J2WmJvYzBXUndRaDRpMFk1cEVVRTZIdUJMRWpSa3JH?=
 =?utf-8?B?Mmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f3dc76-64ef-4395-b11c-08dbf654490c
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 12:10:06.9448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: skHL13fYTVjNqKRHy0lqZUYWs2ML8rOfjdoBBnZjz4/EhZgHpN0pmguCFxTIZ5wvTeSoRQevzZPL+3lsxOWeUoDzXqDlKqAHPGakZk2G+CQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8745
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [v2 2/2] drm/xe: Add vram frequency sysfs attributes
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


On 12/6/2023 5:25 PM, Gupta, Anshuman wrote:
>
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Sujaritha
>> Sundaresan
>> Sent: Wednesday, December 6, 2023 10:18 AM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>; Vivi, Rodrigo
>> <rodrigo.vivi@intel.com>
>> Subject: [Intel-xe] [v2 2/2] drm/xe: Add vram frequency sysfs attributes
>>
>> Add vram frequency sysfs attributes under the below hierarchy;
>>
>> /device/tile<n>/memory/freq
>> 			|-rp0_freq
>> 			|-rpn_freq
>>
>> v2: Drop "vram" from attribute names (Rodrigo)
>>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pcode_api.h  |  8 ++++
>> drivers/gpu/drm/xe/xe_tile_sysfs.c | 72 ++++++++++++++++++++++++++++++
>>   2 files changed, 80 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h
>> b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 5935cfe30204..edde5335bdb1 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -42,6 +42,14 @@
>>   #define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed
>> point format */
>>   #define	    POWER_SETUP_I1_DATA_MASK
>> 	REG_GENMASK(15, 0)
>>
>> +#define   XEHP_PCODE_FREQUENCY_CONFIG                  0x6e    /* xehp, pvc */
>> +/* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0             0x0
>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN             0x1
>> +/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
>> +/* XEHP_PCODE_FREQUENCY_CONFIG param2 */
>> +#define     PCODE_MBOX_DOMAIN_HBM                      0x2
>> +
>>   struct pcode_err_decode {
>>   	int errno;
>>   	const char *str;
>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> index e8ce4d9270e6..38d334833594 100644
>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> @@ -7,9 +7,14 @@
>>   #include <linux/sysfs.h>
>>   #include <drm/drm_managed.h>
>>
>> +#include "xe_gt_types.h"
>> +#include "xe_pcode.h"
>> +#include "xe_pcode_api.h"
>>   #include "xe_tile.h"
>>   #include "xe_tile_sysfs.h"
>>
>> +#define GT_FREQUENCY_MULTIPLIER	50
>> +
>>   static void xe_tile_sysfs_kobj_release(struct kobject *kobj)  {
>>   	kfree(kobj);
>> @@ -35,6 +40,65 @@ static DEVICE_ATTR_RO(physical_vram_size_bytes);
>>   static const struct attribute *physical_memsize_attr =
>>   	&dev_attr_physical_vram_size_bytes.attr;
>>
>> +static ssize_t rp0_freq_show(struct device *kdev, struct device_attribute *attr,
>> +				  char *buf)
>> +{
>> +	struct kobject *kobj = &kdev->kobj;
>> +	struct xe_tile *tile = kobj_to_tile(kobj->parent);
>> +	struct xe_gt *gt = tile->primary_gt;
>> +	u32 val, mbox;
>> +	int err;
>> +
>> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND,
>> XEHP_PCODE_FREQUENCY_CONFIG)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM1,
>> PCODE_MBOX_FC_SC_READ_FUSED_P0)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM2,
>> PCODE_MBOX_DOMAIN_HBM);
>> +
>> +	err = xe_pcode_read(gt, mbox, &val, NULL);
>> +	if (err)
>> +		return err;
>> +
>> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
>> +	val *= GT_FREQUENCY_MULTIPLIER;
>> +
>> +	return sysfs_emit(buf, "%u\n", val);
>> +}
>> +static DEVICE_ATTR_RO(rp0_freq);
>> +
>> +static ssize_t rpn_freq_show(struct device *kdev, struct device_attribute *attr,
>> +				  char *buf)
>> +{
>> +	struct kobject *kobj = &kdev->kobj;
>> +	struct xe_tile *tile = kobj_to_tile(kobj->parent);
>> +	struct xe_gt *gt = tile->primary_gt;
>> +	u32 val, mbox;
>> +	int err;
>> +
>> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND,
>> XEHP_PCODE_FREQUENCY_CONFIG)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM1,
>> PCODE_MBOX_FC_SC_READ_FUSED_PN)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM2,
>> PCODE_MBOX_DOMAIN_HBM);
>> +
>> +	err = xe_pcode_read(gt, mbox, &val, NULL);
>> +	if (err)
>> +		return err;
>> +
>> +	/* data_out - Fused Pn for domain ID in units of 50 MHz */
>> +	val *= GT_FREQUENCY_MULTIPLIER;
>> +
>> +	return sysfs_emit(buf, "%u\n", val);
>> +}
>> +static DEVICE_ATTR_RO(rpn_freq);
>> +
>> +static struct attribute *freq_attrs[] = {
>> +	&dev_attr_rp0_freq.attr,
>> +	&dev_attr_rpn_freq.attr,
>> +	NULL
>> +};
>> +
>> +static const struct attribute_group freq_group_attrs = {
>> +	.name = "freq",
>> +	.attrs = freq_attrs,
>> +};
>> +
>>   static void tile_sysfs_fini(struct drm_device *drm, void *arg)  {
>>   	struct xe_tile *tile = arg;
>> @@ -78,6 +142,14 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>   		drm_warn(&xe->drm,
>>   			 "Sysfs creation to read addr_range per tile failed\n");
>>
>> +	if (xe->info.platform == XE_PVC) {
>> +		err = sysfs_create_group(kobj, &freq_group_attrs);
>> +		if (err) {
>> +			drm_warn(&xe->drm, "failed to register vram freq sysfs,
>> err: %d\n", err);
>> +			return;
>> +		}
>> +	}
>> +
> We are missing to remove these sysfs files.
> Thanks,
> Anshuman Gupta.

Hi Anshuman,

Sure I can add this. Assumed wouldn't be needed when we are 
un-registering the tile directory.

Also noticed some alignment issues in the show function. Will fix.

Thanks,

Suja

>>   	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
>>   	if (err) {
>>   		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed,
>> err: %d\n",
>> --
>> 2.25.1
