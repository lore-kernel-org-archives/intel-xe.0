Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DC7C10F04
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 05:36:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B2110E7DE;
	Thu,  7 Dec 2023 05:36:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E00110E7DE
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 05:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701927393; x=1733463393;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Bp20RuualpRcFYlGRooAN2DNP3Zqm0IkjV9WWYo6nAk=;
 b=kULNn32dZXCQWaJzXMHyy8+KEXpUEm0z3Mtxx+phD58Uz96THB1Kcg3J
 it1AI+2VhrGDuqA6zFvv1evyD0MdhQXHLH1VG2rDBGE4JMm+0keNxZsy5
 b3l+EZOJuoDqnBMbgrDpq/5OxlblIDPBq8CbwdLrfmb3YJhywnDblLz2q
 hKW8Y6dSOQHBAnGp/6bj6zxBWPkR3HReo1WRIQK5mrk1i3PZ5lESfe8b5
 ghH6dex711zXVzKuP0NoWbnJuUpOrxMNE48xM5PW+ZEsrFJwsLa/LDjaT
 Doer+jN/whaDovePAfam2J535I6wQjWUbGi9tOnhBFlWZX/gvwkfd+drN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="391344895"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="391344895"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 21:36:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1103082178"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="1103082178"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 21:36:32 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 21:36:32 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 21:36:31 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 21:36:31 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 21:36:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+XBHBFVR1dIClJzTYdqn2TcwHtN9FDkXXSNSI6EfGt+G1GSYAFDGNqjVAlnjM2C9whZZUyGBKfgpMHCZcxavfVbQ2STdhk7WXgrAFXFUK5LrhrJZwupQqM3QJkVH3FDjIr5T0Netr0MMEhNsfTKty7mH8yILUhX783gsnHGDpRR3hTbe7mueyPbKDt7GI48KUrWQShI4vREMZzjZiqZEkSua+B5DbvbMWnJNh27P4jpgOpH4HPJSTTWk/PguEM4KcwFs07J65BNEnRe33qASp36KNAG4D4UB27wtjXUWiv9wOL5eBK91wev9AIZFfWuPEWudTFdJ9Vbkg3fmOneiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybGeif0sbYeWSVyxOe4dhhkNbhQdV9eUHrvzJiD+JbQ=;
 b=JUCmv/hYXYKoMbFVDqX9kyRVQUeIBKNr/VrpW7CNQN70dYPHryBegBxxx9+UH3TWVCc/Hu5hVmNfo8baFcENEdjTD/MW6BmmsU6jjOZc7KRa+zTxg/YCddil0lo/HdmAY/OOGW4LiCnoWAYcngMLY4OzAejXRFP1nLnaWZGKqAMLEtxCjlpJ88JZGZgfPebb4fGziQeklb5Y3mWWTCbS4+GA+VRZaV0BCMlH6ll27T9+4rgtyUA9aK9IkRvL9YrHg2ZZUudFEJ4Z1nO9QuFxx1c1UT27YVoftaPtrIuO5MRLwfC+rk1C84YfZL1FiB0nusLT8wRMzJENM/ljtGw0Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 05:36:29 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.7068.025; Thu, 7 Dec 2023
 05:36:29 +0000
Message-ID: <976810d6-2e72-4d3d-b654-87650386cdb1@intel.com>
Date: Thu, 7 Dec 2023 11:06:22 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20231206044735.966213-1-sujaritha.sundaresan@intel.com>
 <20231206044735.966213-3-sujaritha.sundaresan@intel.com>
 <CY5PR11MB6211A0355A82DE0B8C9229119584A@CY5PR11MB6211.namprd11.prod.outlook.com>
 <2f788935-b301-4f9c-b0c6-2503485e6089@intel.com>
In-Reply-To: <2f788935-b301-4f9c-b0c6-2503485e6089@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::33) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|BL1PR11MB5978:EE_
X-MS-Office365-Filtering-Correlation-Id: 691b1708-8690-4628-624d-08dbf6e6761b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0YbmgQO+3H1cQW+foLS7c4gHJ3jewKsmuGLUyT190ksi8wIzeKSC96DQSJOiSaBgerjkktydSoJWxCP48N/7xrXPB52mPnMU0VHpIXYioMGm7mB+UQziv13okwiP8SpT+sywQ2Jsv/Hyck25Usw2CbcVu69gYIn5UHS4cE1OxudfPGceRfvg1H9+Z+ySpw88aUSGzpVafGHf3KOQC9v4Vfsqw1B96B8WvImLg94Vl7+s8f9aDZGjk2jzv/d+3dzGNCYaNyxAQkb6Evkh0iGUcoRtOIwbl3vZKmfJoaaR4koce8oC6S+5OrCiDbHFMMvsCVRADZDpHmvooLTEDnQ4aP+O1gM4fqZXaJtMCIoilqLpBe+X1ylUnytBOO65ygrCZoDLJCVoyO2Xh34E83NVNV53/fjvmuZz96nER5OkknP+6/MwNY8JV50l9Bfoiye4Y8620QBxaHkouGkdHqUn0b0RDz6u6UxmiUu0qWJIIg+deMF9HpEuakK8hRnC5Q3E6DTJQdiA0jg7CwBaAH3RKSO0rTju4+R3Qk7LbUbQGx2dJptgFt2vXnVrqKKp4RuaTRz+Dh4aMwHygS0QuQPEGkQip8pm96dFwg/LEfD9F6XExrKrOlC0OZjFmqU8XRbMWJQBgurJEsYRJRwkFaXFIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(39860400002)(366004)(136003)(346002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(478600001)(82960400001)(31686004)(6666004)(6486002)(66946007)(38100700002)(83380400001)(2616005)(6506007)(53546011)(6512007)(107886003)(8936002)(4326008)(8676002)(2906002)(5660300002)(86362001)(31696002)(36756003)(41300700001)(66476007)(66556008)(316002)(110136005)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHdPMHhyeXphTEZpZS90ZTh6aXEyWmt6eXh2RTRRR0t4cit6aC9FOU9iUHZj?=
 =?utf-8?B?MjVYQkRoVTY5L2JkdWZIRTU3dTAxL1JZWm1lUnJEZm8zVXdMRzlJdWQ1ZTM0?=
 =?utf-8?B?Y0h4NThuS29RWndaaGpGMzNzUUN5V28zODZXVEhXaUlvVzZvSmQyZTJkdmRn?=
 =?utf-8?B?WUJmU0RudDF2NFIydUk5VlVGNi9kSDNRY2ZCN3EzdE5sMEFWUFRTMi9HTWdY?=
 =?utf-8?B?c0xyZmU4N2pJV29VNzI5NjFkclJzWElydG1yUU5SVGlNczhxMzlUc0FWZC95?=
 =?utf-8?B?OUEzNHNhWGtDQnRaTFZ1TEQ5YTduWXppYjhSTWdRN2NqckxtbFlLcU4wdDU0?=
 =?utf-8?B?Q2Y2bE9BZk5RV3VtNmlMRVYrV0dlSEQ0L2E3bnZFZStmZVA5QzVWQm5aRzQw?=
 =?utf-8?B?Q1ZFMnFCNWpDZEVCY0JwZ0FYSkVKc3U0QXpIeGltWm14N05pb3hGK09QTG0v?=
 =?utf-8?B?RGtnaGZjRFNOKzg4YUIrT3lzOW50andzZVJZdXNvMUVUeXJwS0xuU0g2R1NM?=
 =?utf-8?B?bFJYRkdsMEV3eVZrZDV5ek52RkpuRzkyakpkZmtaTHp1enByOTVueFd6M1JN?=
 =?utf-8?B?MDRCeXF5aVpzdThraTVjU0ZwZEp1YmVnZmJoeW1oUy9NbnV0ODJrbVZtYTRS?=
 =?utf-8?B?V0t3bW1FeXRzZnBINm1VRmxtQVE0bzZYMm9kMUYzSllDVW83RlBUZnR2dklv?=
 =?utf-8?B?d3pxWUQ4TEZQR3dnOEZ0NG9idFM3NHlqZ1FDL01lMER2OUdVMWZoVVNvWWdk?=
 =?utf-8?B?NDRhL3JFbHBua3F1ZGNacnZnK3hqd3NLRm5saTB4WDVsTG5UZ1B1c0VxSmY0?=
 =?utf-8?B?Q2N0NWNxTkNUcHJoMm9OMHBBMWJSellSSVlBUXpGL0V1OGYxZGs3NkVxVklT?=
 =?utf-8?B?b0s2ODkxeWVnQXBiNldmQzhjNFlVTjI4N2JiL0x3WW50eDNPM0c0NkQ2R3Fx?=
 =?utf-8?B?bkhvRTFTcm1meHNUeWxMRzVKZjEvU1dwbHMrbDl4MnZ2V1czbWxEdjRvUk54?=
 =?utf-8?B?UzQrT1BDV0UxeCtpZGxBNjgrekhtNnlPc0hlNjh2blRHMFhNai9wUlQ0ZS9P?=
 =?utf-8?B?N2lXYkFqUS95WUcwd0lmOE1Qam1ENFkxdCtHeGdPVEo5TmI0ZGp0My9Gb1Rr?=
 =?utf-8?B?WG5vNUMvazBIUUptbGo0OG9OdVRCeDlCQ0dyYlhuL0RLYjgrSGNReDNzYmpS?=
 =?utf-8?B?VFNQTVp0ZnhkWndGcEJQRkZRckZEbHIranY0alVlaXdxOUhCWkx4c1ZETmRL?=
 =?utf-8?B?eWIwSytpV1czSURaNGdRQXFyMDVuQXdTdDNOLzh5L0hCVkU5bHBNRzIzclJw?=
 =?utf-8?B?OTFBSkRhZEIwYUwyK0JmdnY2M2JuUm1VbHQ1QnM2dTdWSUZCWjBmSVcwc2V5?=
 =?utf-8?B?N1B0REtmY29CSG1kRVRYZ0IyaDgxTGFqbk5pRWhBN1ducVJDOXdzZlNqSEp2?=
 =?utf-8?B?R29wbWNFNmtvdkpndkRoZDVHTndMTldXNVkzQ2pCTC9wV2dWV2pacUhmWnZ4?=
 =?utf-8?B?WSsvRHJhU2kvZnBlYmRtM0RDTTF1VVZwZ292Y2NTYmtsbFN5UTVXMURCdG1l?=
 =?utf-8?B?K1ZiVUZwc1BGRUwzL2oxa2dRUVplTUZRMkdMUzF4RkRGQVpSUWxwVGZETlZT?=
 =?utf-8?B?NGFJNmZNU2JvZit5LzdQU0FhS2hFSkVUUGdIeTNTVmpWdDFRaXBZY0NiMGVV?=
 =?utf-8?B?M09vL1djTDFDN1Q3UVUzM1BuV21vWGVWOEhTeU95aDQvTk1DYUhBQnI0bWRv?=
 =?utf-8?B?cVY4ZUdSOWhRUjE3T2ptTElic2l3QVd5ajR2aEJQL1VJMVNCczV1R2pzeTN6?=
 =?utf-8?B?MzYwdUIweW5rcjhja05kUG9mYWZBOVFnUmlYeHRQTEk5NHpYV3I5ekQrYVZF?=
 =?utf-8?B?MUtEU2VCZ2liNUZ1aGgxSGRUTFdOa1FoOGc5ZlRSWHFXU2t6VEFJNmJhb3pO?=
 =?utf-8?B?YzRrR2lQb1dTOXNTS000Z0ZFcmI5SitNVjMzNVVpdm1sMFRCSktwSzRwbE1k?=
 =?utf-8?B?Tk00Z3VRU3B2Mk1IZkZUQVJJTHdoSTI3ckJtTW5LWnU5TXNUN3krWFdHVEY2?=
 =?utf-8?B?dUQwQm1MY2VHRlBkOENqK0JtbFZNa09QeGttTFRuZjVCZWtONXllb1g3RVMx?=
 =?utf-8?B?WlNjRmtDUWZ3eVJkQURxeGZnZ3lFNVI1MVBwZTM2TlNMR0FOVGMwMHBJNits?=
 =?utf-8?Q?fh2xSIawtdjEsTl1pUwRIfk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 691b1708-8690-4628-624d-08dbf6e6761b
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 05:36:29.0722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3d0WUSodYy1kTtUd91WDkSx2P/shZgKQg5CTLzfG5SoO43ZIh9yQHbHWHQGP71ub0rFNg9qnxtepE7ZOfWHyckt+gXHDpdYRihkeBqJ7pSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5978
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


On 12/6/2023 5:40 PM, Sundaresan, Sujaritha wrote:
>
> On 12/6/2023 5:25 PM, Gupta, Anshuman wrote:
>>
>>> -----Original Message-----
>>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of 
>>> Sujaritha
>>> Sundaresan
>>> Sent: Wednesday, December 6, 2023 10:18 AM
>>> To: intel-xe@lists.freedesktop.org
>>> Cc: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>; Vivi, 
>>> Rodrigo
>>> <rodrigo.vivi@intel.com>
>>> Subject: [Intel-xe] [v2 2/2] drm/xe: Add vram frequency sysfs 
>>> attributes
>>>
>>> Add vram frequency sysfs attributes under the below hierarchy;
>>>
>>> /device/tile<n>/memory/freq
>>>             |-rp0_freq
>>>             |-rpn_freq
>>>
>>> v2: Drop "vram" from attribute names (Rodrigo)
>>>
>>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_pcode_api.h  |  8 ++++
>>> drivers/gpu/drm/xe/xe_tile_sysfs.c | 72 ++++++++++++++++++++++++++++++
>>>   2 files changed, 80 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h
>>> b/drivers/gpu/drm/xe/xe_pcode_api.h
>>> index 5935cfe30204..edde5335bdb1 100644
>>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>>> @@ -42,6 +42,14 @@
>>>   #define        POWER_SETUP_I1_SHIFT        6    /* 10.6 fixed
>>> point format */
>>>   #define        POWER_SETUP_I1_DATA_MASK
>>>     REG_GENMASK(15, 0)
>>>
>>> +#define   XEHP_PCODE_FREQUENCY_CONFIG 0x6e    /* xehp, pvc */
>>> +/* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
>>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0             0x0
>>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN             0x1
>>> +/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
>>> +/* XEHP_PCODE_FREQUENCY_CONFIG param2 */
>>> +#define     PCODE_MBOX_DOMAIN_HBM                      0x2
>>> +
>>>   struct pcode_err_decode {
>>>       int errno;
>>>       const char *str;
>>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>> index e8ce4d9270e6..38d334833594 100644
>>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>> @@ -7,9 +7,14 @@
>>>   #include <linux/sysfs.h>
>>>   #include <drm/drm_managed.h>
>>>
>>> +#include "xe_gt_types.h"
>>> +#include "xe_pcode.h"
>>> +#include "xe_pcode_api.h"
>>>   #include "xe_tile.h"
>>>   #include "xe_tile_sysfs.h"
>>>
>>> +#define GT_FREQUENCY_MULTIPLIER    50
>>> +
>>>   static void xe_tile_sysfs_kobj_release(struct kobject *kobj)  {
>>>       kfree(kobj);
>>> @@ -35,6 +40,65 @@ static DEVICE_ATTR_RO(physical_vram_size_bytes);
>>>   static const struct attribute *physical_memsize_attr =
>>>       &dev_attr_physical_vram_size_bytes.attr;
>>>
>>> +static ssize_t rp0_freq_show(struct device *kdev, struct 
>>> device_attribute *attr,
>>> +                  char *buf)
>>> +{
>>> +    struct kobject *kobj = &kdev->kobj;
>>> +    struct xe_tile *tile = kobj_to_tile(kobj->parent);
>>> +    struct xe_gt *gt = tile->primary_gt;
>>> +    u32 val, mbox;
>>> +    int err;
>>> +
>>> +    mbox = REG_FIELD_PREP(PCODE_MB_COMMAND,
>>> XEHP_PCODE_FREQUENCY_CONFIG)
>>> +        | REG_FIELD_PREP(PCODE_MB_PARAM1,
>>> PCODE_MBOX_FC_SC_READ_FUSED_P0)
>>> +        | REG_FIELD_PREP(PCODE_MB_PARAM2,
>>> PCODE_MBOX_DOMAIN_HBM);
>>> +
>>> +    err = xe_pcode_read(gt, mbox, &val, NULL);
>>> +    if (err)
>>> +        return err;
>>> +
>>> +    /* data_out - Fused P0 for domain ID in units of 50 MHz */
>>> +    val *= GT_FREQUENCY_MULTIPLIER;
>>> +
>>> +    return sysfs_emit(buf, "%u\n", val);
>>> +}
>>> +static DEVICE_ATTR_RO(rp0_freq);
>>> +
>>> +static ssize_t rpn_freq_show(struct device *kdev, struct 
>>> device_attribute *attr,
>>> +                  char *buf)
>>> +{
>>> +    struct kobject *kobj = &kdev->kobj;
>>> +    struct xe_tile *tile = kobj_to_tile(kobj->parent);
>>> +    struct xe_gt *gt = tile->primary_gt;
>>> +    u32 val, mbox;
>>> +    int err;
>>> +
>>> +    mbox = REG_FIELD_PREP(PCODE_MB_COMMAND,
>>> XEHP_PCODE_FREQUENCY_CONFIG)
>>> +        | REG_FIELD_PREP(PCODE_MB_PARAM1,
>>> PCODE_MBOX_FC_SC_READ_FUSED_PN)
>>> +        | REG_FIELD_PREP(PCODE_MB_PARAM2,
>>> PCODE_MBOX_DOMAIN_HBM);
>>> +
>>> +    err = xe_pcode_read(gt, mbox, &val, NULL);
>>> +    if (err)
>>> +        return err;
>>> +
>>> +    /* data_out - Fused Pn for domain ID in units of 50 MHz */
>>> +    val *= GT_FREQUENCY_MULTIPLIER;
>>> +
>>> +    return sysfs_emit(buf, "%u\n", val);
>>> +}
>>> +static DEVICE_ATTR_RO(rpn_freq);
>>> +
>>> +static struct attribute *freq_attrs[] = {
>>> +    &dev_attr_rp0_freq.attr,
>>> +    &dev_attr_rpn_freq.attr,
>>> +    NULL
>>> +};
>>> +
>>> +static const struct attribute_group freq_group_attrs = {
>>> +    .name = "freq",
>>> +    .attrs = freq_attrs,
>>> +};
>>> +
>>>   static void tile_sysfs_fini(struct drm_device *drm, void *arg)  {
>>>       struct xe_tile *tile = arg;
>>> @@ -78,6 +142,14 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>>           drm_warn(&xe->drm,
>>>                "Sysfs creation to read addr_range per tile failed\n");
>>>
>>> +    if (xe->info.platform == XE_PVC) {
>>> +        err = sysfs_create_group(kobj, &freq_group_attrs);
>>> +        if (err) {
>>> +            drm_warn(&xe->drm, "failed to register vram freq sysfs,
>>> err: %d\n", err);
>>> +            return;
>>> +        }
>>> +    }
>>> +
>> We are missing to remove these sysfs files.
>> Thanks,
>> Anshuman Gupta.
>
> Hi Anshuman,
>
> Sure I can add this. Assumed wouldn't be needed when we are 
> un-registering the tile directory.
>
> Also noticed some alignment issues in the show function. Will fix.
>
> Thanks,
>
> Suja

Actually with adding the kobject_put to the fini function, I don't think 
we need the sysfs_remove

cleanup added as well. So i'll skip adding this.

Thanks,

Suja

>
>>>       err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
>>>       if (err) {
>>>           drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed,
>>> err: %d\n",
>>> -- 
>>> 2.25.1
