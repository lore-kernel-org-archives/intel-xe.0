Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F279C54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 13:55:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C04D910E194;
	Mon, 25 Mar 2024 13:55:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WxAbO7xI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E8710E194
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 13:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711374915; x=1742910915;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZNXwDV4QMctisd7/uz3SYrdnbBMGtLOYfVjFfLlQS9c=;
 b=WxAbO7xIcua1kFX/InvOmQKDRfq0kFyMKjK2CMufyS5EK8VbS6IZd0GE
 kZW9wiyXkUUpFggW837Ctgl51Eh8CaERr/1fsLCWGm+tjfX47k1DLRc7o
 mUesB5LuZPSQJdibe5Blo3gHXb90+aebeL4B1B3Udkew4rYm9Ukf+6bW/
 0fEIhLZkZKJPB31g37dlYmyFVBzVQ+9EF+CE9KZjQq/ERC4GEuxMQr+rX
 lDcDDnn2mK52/qy8GsH3MEVwhG63IJc7Z2u7nogN4IlBf2xrvbv6lgISh
 RFQFuQUkrZcx7Pd3hjvUSFlCjObWmMhUQ4KDegWcCx0xbRNNV81hQsl+C Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="23825228"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="23825228"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 06:55:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="46606584"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 06:55:14 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 06:55:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 06:55:13 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 06:55:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWil7Mi55oPAR2Fv8ZViWqxDTLMX/ZO0H/qBbCLeDUhIMeSdmJz8XYy4n+ZTB21OKTzMwzqHPDNHfmFtJ5VY4HY38JiaJCooL3/5LL6v3MC6p6SZ61diGG6G9gG5bDC4RzpU3eCZSL7oLNRf6GnYcF7bgTUFbSaYIUIKpuIouR8sLjmivLRdOQhHrl8jXgwLbqdpMOMy3lNVo2ff3Zavq5Ir3SZZNlQDqrcOJXoIPzTE1wAWlnFlaQCdxQBNfyFbvDYqDQHamiXt0hiBEnYYGS+DNlrZNOe9w+jB4t+qmpYEbVUMRDUTGraNh+CRbpqdE/Ud9TBRGoS+3JDOr+6/dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FKPGxlmZycL/eUzhO6XYrCzcjyuQLTdICbQh1MjXTlk=;
 b=QXerLBQihX2aythYW75TvBUUUA6RrUDlEblyNNahlU/3s0S55FZBWHSzHleNHKGwZjTVaqP6EitY+IxyYFUEDvgi8V9UgWVf16nQsyBYSJBlbGDvDmXAQc9pVkuxUDzMtrtBrA2gr4MZJtjg3lzvNPpfwW/ybXoarvuiXBTW08TX2wylnkCQTFVAgydGcdGKgLQtU94ITwpNATpXZi8/O7KDGh4WOC9kv6L17huFSn0ccWFtRbQebq7NGhoskq2VNxzwpO6ljz3y4LgSUvAS97V+tvBlAa5skr3n1xt74B/hVXMEYsjfRhq9CjdIT3N68Jkl6RmajjdnFIkTRxgfJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 DM4PR11MB8089.namprd11.prod.outlook.com (2603:10b6:8:17f::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.31; Mon, 25 Mar 2024 13:55:12 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::79b7:da48:ff3b:4c78]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::79b7:da48:ff3b:4c78%4]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 13:55:12 +0000
Message-ID: <78307859-a7af-43dc-ae9d-86816d22910a@intel.com>
Date: Mon, 25 Mar 2024 19:25:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix static analysis tool reported errors
Content-Language: en-GB
From: "Poosa, Karthik" <karthik.poosa@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>, "Nikula, Jani" <jani.nikula@intel.com>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>
References: <20240325080550.3217836-1-karthik.poosa@intel.com>
 <0e0355fc-c10e-4e65-b193-6b5858c9da87@intel.com>
 <9e022654-96a8-4b3a-80d3-fd3ba3a22697@intel.com>
In-Reply-To: <9e022654-96a8-4b3a-80d3-fd3ba3a22697@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0025.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::10) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|DM4PR11MB8089:EE_
X-MS-Office365-Filtering-Correlation-Id: adca06c1-b524-4386-bf5a-08dc4cd330a8
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: akD8NUCA5DNHRFjxJRZ+/nUItBaCBPfHGqKPt7WSZRQW3JhCtNfWdxCP3rn6CVxpU8hwetiyNUdtBLuaoB2l9D+ivsL0gzGNQNMbKCCotiLtBLEDJ3optkoVrpj6RS49s1LeunAKtBExTZBp/Hox1QUBn2c+4fg3fVEppGHvUpvlXHxCR+wzoji8BPxg15Po16PFXr87w0R0PLfoPCFRCdFGR5as13w933fIiJXksZCUTeDaaxD2N+R6n21eZdXj4y7w+buv+I5QyUz+gyUhg7roWH+umc4BwSrvceemhbqntqdbKBUZ5SlgT+3OWrhI2zzQoLRA2m416igczE01zgKzX3cqlep5UXh4EdMOgKOiiUFJ9x7AaI9GKx8/pvyJTN6bSgoTI7cjDKp6mVCBfbL2EypEWuGDPIWPq5yzCq3GF6aBGOFNngH1pZHUPXSo6Y44MX+nQnkXVbW9HyniXNdcHC+6aB1MtL3wurGaBPSF2ODEjVUxE0bpEkbhyLa8fmc9h8mfMQb1rHv83U8+P7H/vlaRHuvR963QJF38wmpOvyVV5tskUyE7qtDQ2XppCpUL6Os2ifma0SyIQeJ2gsZA7vlbLv9RKyvJx8NJse8zI5BwIyUV7pUJQtUOsEvGJnqQTywmdqVWb/ihOTkL+9sr5nP+fRdzheMRIH59NKI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emJrQStJLzF1a3YwRFVoQytMd1VrWnh3RG5sNXNlRk51U0Q1Z1FkVW1Tc2E1?=
 =?utf-8?B?Y1BkdWNyV1FNbWhnYWZnK0ZCTUZyUzhiZVB5TGwvR3BSL2lWcVpHZElPd1g4?=
 =?utf-8?B?bVROcEU4WHp3dHFBb3YzMEV5YWUwMERacHlFdDJCaWdHaG1NUGMzeE9SSENt?=
 =?utf-8?B?bHRMSWoyOFRjR3FEWDFCM3MvVUhSWUhaNDhRVExaZmUwcmNKY0RSdW1LVCtl?=
 =?utf-8?B?NlhkelQ3U0pzL1B3YWxUbDZ3MEttNTRpbG9MZTFCbVFpVTh2ZUxsVUd2THJq?=
 =?utf-8?B?aExjL3ovUEZWOTVhMndFVVYzR1I3SEEwK2YrOUNoMGZUd0JwbnZHOGVqYWlO?=
 =?utf-8?B?dzh4MkNuU0J2Z0RBSlNPQzVtcTR5NjVYeGZXU2FBWTNQOEFJa21Dcnk3Rnc5?=
 =?utf-8?B?TDl1QlRxR0RvU1huM2lRSXlPalpqK1VJR3VjREoreEY0MEo4aGpoUXovUXJn?=
 =?utf-8?B?V2ZjTkpabWU4VXZ5Znl0a3N0ZGN0MkZIWG4yeFJOMzIyQ2ZMZXNNQ0pISFhn?=
 =?utf-8?B?czlaeWU3Tk5kU2p3UHFnZkxIRVBVL1o5WFg4RXF0bXF3SVluZ1BiTCsxbTRD?=
 =?utf-8?B?U3ppVlIwUUZOVVNuNFg0QXlHTUFKOXFGejZrcUZCNG1OdlhqRmNybkNBWENH?=
 =?utf-8?B?alhXVUp4dDc3cEVEWTlVM01nL0VUSEVDd2ZmT0ljbWtGYVQyTnE2NnFnang4?=
 =?utf-8?B?ZnN6RGFNWEwzUXVEQ1kvSC9jclhYT052c1V3ZVFremhUaEo1MFRwZDh3aDla?=
 =?utf-8?B?NW9GdXZ6Ym9kTjNnR3Q5WC9XOVFFV0ExRkdKUStTZWJhQXZ3ZHFqM0VBR041?=
 =?utf-8?B?Mzk3QzA5Tkgwb3M4aFdublZ5SHA2emlleWFLYjlUZytVUW04b3NmTGZvMjR0?=
 =?utf-8?B?bHR3czM1R2VHY2twU00zb3JMeHJmSW85RHJLWjMwU3dZUFBFbHV4cDhObG1o?=
 =?utf-8?B?WTBLalpmZlJLb3MxNi9IVVBSTytxNlR6R0gvSEtQaXdzUithUHB1OVUxVjBy?=
 =?utf-8?B?WVZOS20xbjBLenozOG9jZHJadXNENGtXNHdaNXQvUHNYS3lSU3laSEwxcDZS?=
 =?utf-8?B?TTVRMnRrSC9HS2FINEp6d1dJM0VwYWFVcUM5azlWc0ZUS3htZ0trUDVjSWtP?=
 =?utf-8?B?ank2N2hDQ1dIRU1Cbzh2UllrMW9yazh5SGw5Z29Tb3I5MFhqQVJudmZKbndj?=
 =?utf-8?B?R2hhbXA0aUVuNHBza3BiWlQ5dm9WdXloenpkUnZxTXRMenc1eDFCWmVzN1Jh?=
 =?utf-8?B?SzRIbGFra3k5SG8raDFyelhpd3dXT3c4U253anNlZ0V3T3hvV2dmWDlUaVdM?=
 =?utf-8?B?M0FaK3ptek5qMVFoRjUyeFpJL3ZCZjdLZjNDWUlJT29uRk5kbDkyU056ZDhT?=
 =?utf-8?B?V25NMTBNWFRPYTFONnl1ZGZjbE9aZis4Ui9iMmdhTjA2K2NMZWllOW50L1g4?=
 =?utf-8?B?cnB6dnIwbTlKSnJrQU9YNjFndlpWZXNXelp1OStGNDRjaDdwbVprYW14bzlw?=
 =?utf-8?B?YzIrc1NHMUEvNXBEZmlHZXRQTnVoRGd6TTh2NDVxc2ZTaE5URllRMUxpWThl?=
 =?utf-8?B?ci94Z1lrZHpRdk9NQ1FaSEJ4WkV3WU5ES0RFbUVKOVF2ZTlsTlhhT091cVlB?=
 =?utf-8?B?UExRRUw3ZytNWGx4Y3o5SHRYVFNITVpPOWZjOVoyYU9PYXY0aXpkMmpTUFV0?=
 =?utf-8?B?VnphSThaT1ZsSGI3UWhOUmcwaXdjQStLelcwYTJVVHB3ZVVjbm9FUEhTMVU3?=
 =?utf-8?B?dTJDMmxLMEZ6RTR5STF5MUNuYzh0bDczdS8waElkczlxYnpmbTdFTjY1WktK?=
 =?utf-8?B?THRKUEE5UVJERys0bSszaTFaZzBXaVVQRktBL1VxclYyY3VTMnJHRmljV3Rx?=
 =?utf-8?B?U2M0SE44Vm1NSkhQdyt1VGJtdjA1Nnl5TGVyamVqOGxJWU4vcTVSRjViK3dL?=
 =?utf-8?B?QXI0NDJHZi9LRGZmbkRrMzZ2QzZyMDdIZ0t2SUYzOG1JNTRBQ2Jwa3hWWXBR?=
 =?utf-8?B?azhCNEJHRkdYZFRRZ01ieUp1NWx6VlErY0ZSdG5TR2dmRklyYUFacmU1c3M3?=
 =?utf-8?B?TEdKdytmNWV5Z1pOWVdianhGVXJqa2pZY00rWUdFRWpEQXViUVZXeVpuY3k0?=
 =?utf-8?B?clNteWthVllhS0lDQVdhcnByTWMvU3pqS21JS2R2YlFxd2dKcVlqMzdreWdB?=
 =?utf-8?B?VEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: adca06c1-b524-4386-bf5a-08dc4cd330a8
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 13:55:12.0859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dm0nlRcKXFACvUdwkbjYtdf/PikXKDYJtCzRNdJcred+BOwZuyyfjgzdEYqxDqMi3Z2/TpKxlDylaxsYLbuf3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8089
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

It checks but still returns NULL if gt is NULL, instead of XE_WARN_ON.

Should that check be added there.

static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
{
         struct xe_tile *root_tile = xe_device_get_root_tile(xe);
         struct xe_gt *gt;

         /*
          * FIXME: This only works for now because multi-tile and standalone
          * media are mutually exclusive on the platforms we have today.
          *
          * id => GT mapping may change once we settle on how we want to 
handle
          * our UAPI.
          */
         if (MEDIA_VER(xe) >= 13) {
                 gt = xe_tile_get_gt(root_tile, gt_id);
         } else {
                 if (drm_WARN_ON(&xe->drm, gt_id >= 
XE_MAX_TILES_PER_DEVICE))
                         gt_id = 0;

                 gt = xe->tiles[gt_id].primary_gt;
         }

         if (!gt)
                 return NULL;

On 25-03-2024 19:09, Poosa, Karthik wrote:
> This check is not needed, already xe_device_get_gt internally checks 
> gt for NULL.
>
> On 25-03-2024 18:59, Nilawar, Badal wrote:
>>
>>
>> On 25-03-2024 13:35, Karthik Poosa wrote:
>>> Add a NULL pointer check.
>>>
>>> v2: Release resources before returning error. (Riana)
>>>
>>> v3: Update commit message. (Badal)
>>>
>>> v4: Change drm_err to XE_WARN_ON. (Anshuman)
>>>
>>> v5: Fix XE_WARN_ON check. (Riana)
>>>
>>> Fixes: 09d88e3beb64 ("drm/xe/pm: Init pcode and restore vram on 
>>> power lost")
>>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_pm.c | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>>> index cc650a92c2fc..f6837bd6f9a3 100644
>>> --- a/drivers/gpu/drm/xe/xe_pm.c
>>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>>> @@ -383,6 +383,11 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>>        * really lost power. Detecting primary Gt power is sufficient.
>>>        */
>>>       gt = xe_device_get_gt(xe, 0);
>>> +    if (XE_WARN_ON(!gt)) {
>> Is this check really needed? xe_pm_ops will get installed when driver 
>> probe is successful and driver probe successful means root tile 
>> primary_gt exists.
>>
>> Regards,
>> Badal
>>> +        err = -ENXIO;
>>> +        goto out;
>>> +    }
>>> +
>>>       xe->d3cold.power_lost = xe_guc_in_reset(&gt->uc.guc);
>>>         if (xe->d3cold.allowed && xe->d3cold.power_lost) {
