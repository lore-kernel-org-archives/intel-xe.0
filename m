Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285F2C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 06:07:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27E210E7DD;
	Thu,  7 Dec 2023 06:07:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6603610E7DD
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 06:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701929218; x=1733465218;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L0j1spxisEsKX26KFuPRqSXmCJaq/+2LzrEfp7SSw3A=;
 b=QDX9eZFa026mICAgE9NgjdcBtwcUQCrIxKCsWX/XDkEPOFhXb+maTsVG
 Kz2M9KSEmyT01dcxo+ylOOQEkzlzq5bcy6opx8xy5oKFkz4ot+56rGn8s
 XghseXK6DzUAe6wpI5Ta44rtrH7joDHg8NcvKnYnlwXdhJVmtHEjx0Bss
 jCeVjaJohnVcilmw2BuPAn7/ADLUFxogr5AZD4EhLnkHtdAZeYXJMUQo1
 fJ0S/8qxBRWQ5rLFPCg1ON4A0cZhp8WnQSsRUUkltI0gCyvFf7BSpc2k+
 f35yhMTqe6hZrgJA04MBBMxJrLgdIz3CyyNNcqaD0ea1e8Bxtvvx0XDO+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="460672707"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="460672707"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 22:06:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1018829599"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="1018829599"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 22:06:56 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 22:06:55 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 22:06:55 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 22:06:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fesl2kQ3Mg3erW4WsTK0LDFNJop/Dmn1CNs3oDIbRsfJN8m7ckvYxsTBpqugcPHb6WWiPRaVMihO/WxCWU8lOlod9nN3OsH9SXV/DugwNuatLc9P/BGowaR54TzRMBVMkPww2lKMDP9GTjoum8CP1fZRmLOB/yL8xyUiL48+axco3DPFBFhZ3bVuuNhS4az8kl9BTqcXCuhlxWNp1sLeExLjgyEigq4EhiTK+wFEnhu7yvGLlpI+ZFqqDozVZeP0oTTnQQqAKj3ZCWeKzIJRnOmhsDAOkUMvmJ1soh/ZdK6UldKqKnJtCWg26pVlIq2KM1bG5FQ1zHxT02ixmVZxbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUaQPT+9o+iwMQ//i0pjlaQiUmBb6IJfEwORsWyEhSg=;
 b=N2prBba4fib8TbFUBecqrVHiOLBYCxy5fcAAuspKvWOaUspXG1U61UNM6FFxSjz5gqoqM2o/LyA7FVX+xoM6hpyI7xVwxY6gyvd7lE7yLHuCRNKa0cl0nDNdMC97V74E5t9GpLyLkSVzOpbsfTVdUQvlJ3jWAE/DC8TVX3sTW6GmTDDL9xwzsWI96i+D+i52saIMTNbQLXkeZIAFw93f78rAnq4XbgMRoEDjsnsQoWn9QcyMMWnR4yu7pL4wg6cOi5wxaj253FjYWjlxdvhuW46Ic15lz2TExghhvXAtkOgDlH9EL6bLFwGgil/AGclwS6syQO5eqM5/IUsqm8eSqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MN6PR11MB8170.namprd11.prod.outlook.com (2603:10b6:208:47c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 06:06:53 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7046.034; Thu, 7 Dec 2023
 06:06:53 +0000
Message-ID: <a4be4be8-700e-44b4-b0af-1d847774054a@intel.com>
Date: Thu, 7 Dec 2023 11:36:46 +0530
User-Agent: Mozilla Thunderbird
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>, "Upadhyay,
 Tejas" <tejas.upadhyay@intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20231206044735.966213-1-sujaritha.sundaresan@intel.com>
 <20231206044735.966213-2-sujaritha.sundaresan@intel.com>
 <CY5PR11MB62113FC5A386520506F9912C9584A@CY5PR11MB6211.namprd11.prod.outlook.com>
 <d9e06457-ec98-46b4-9235-8e9b3b71ffa0@intel.com>
 <7b70c647-6fb6-46ed-98e0-8e898625b5a3@intel.com>
 <SJ1PR11MB62049D5B2C629111948A668E818BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <65cbe85b-30a2-470c-974f-ba811ec38b52@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <65cbe85b-30a2-470c-974f-ba811ec38b52@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0235.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MN6PR11MB8170:EE_
X-MS-Office365-Filtering-Correlation-Id: c96fc821-5005-4917-f114-08dbf6eab5ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZXIVXeqK5osLN1bTH4dkNn3oZXB/2p+f0kwo6h5iW4C0H5yfis6RxTXpO5MDT7M4E2U3cJ+De9Ns3zvYPOZipk+EtdX+/IzPpGZP3EYmSYy37XJUiT2p5aQRTdo7qQOekUXId25LJ4bBLHGcIe5aQmrhEv/55gNtPYYq8qqpYJy+LUhAgIglwBGR/jz1aWlOWZ56CXpUzgnp2AOSEGLUB7p8CO75d85q4tvX52GFAVwOD5wybKTaj1iDtk3F1kWC/NfbmGVEDfdf/QoNitMdILVSiebtiBzQ471HFy4Dm2oIhtySq1cz/8qbcTRGSUeH+l4tvSqk0we3T6auE9TAXSo19+i0jdFPD+9ie+Wyzv5NJiwHbNPFdq0qnXR9cSrcbggcj//hf0/Guzc3U4PvSmMxqYuQH3RHQ+bxPjeVgTzPKdRyx31io85X/755G/V9gAHNmxt0XVaTaENegdAmpbtjDxfrXwFScrKx1QhU4FTwBcl6mtFeQCW2aKftE+tG+NS6M9msKBqVzpWHeVwj4iMu0P65vET9Dp2h8WdUVjgHR2EOiTrihleT2jXgplSsIFdpAwOo7oZBihYmAE3sSAgH6X8k5zaKSlt3vchACaypHi6KL1gXfSu/X5zXaCRbIdWZXnAooUFu5NV5qlBVuw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(376002)(366004)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(4326008)(2906002)(8676002)(8936002)(31696002)(44832011)(86362001)(5660300002)(36756003)(41300700001)(83380400001)(82960400001)(53546011)(6512007)(6506007)(6666004)(107886003)(2616005)(26005)(38100700002)(31686004)(66556008)(110136005)(66476007)(316002)(66946007)(478600001)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGUzbGhMVUJHTWNOekJzQmsvUklCb0w0NU5ybnAydjRDbGJMVFJEYS81eHBv?=
 =?utf-8?B?NWJVblFoeERLSEJrWG9xbGxjSm1TUnBhUkFQRWpDcWtOb0I0a3Q4S1FXYkxF?=
 =?utf-8?B?VHlJNGY3dHJNeTEwOGwyUWhOeDlnVmNEWkwvMzQxL2dtbmNIWnl0MHBHbHlB?=
 =?utf-8?B?SHFXT25xRzB2dGtTckhXdHFsZjBERXVxM3NyRC9oZ09Zd3RjOTdTNlBQanBK?=
 =?utf-8?B?UVFUN254bTZ5cXVRVlEydHBDaDdQK1NYVmUvSXRJNjh6WHFuSFVlcUltV3ly?=
 =?utf-8?B?NlJhTXI3TW5LcmxXR3Y0SkxtUVBSZzJTTWRiUW5DTkg4dWVtU3JydTVGSzFP?=
 =?utf-8?B?eXBXVGpzUzlUb3FoMlVBMzVFR05uSnY0RXY3Y3MzTGdTOFlxZjJRZm92YTV3?=
 =?utf-8?B?UUNHL3JJRFhpVzFZeFIxNHYzSlhQeWgyMmVueVE0bEdtbzlXekZQampJQkdy?=
 =?utf-8?B?d3d2RXlZQkQ3NjZRM1FKZ054aGFhSktQeXduVXZkRGd6cTFTY2M1T2hEaHBk?=
 =?utf-8?B?a3JKeENEc2FIOUx5aWQ2YkgyQmNnZWpGOVpOVHVWdUcwQ1hKQlJEWWY2WHZ1?=
 =?utf-8?B?S2tEbWZzTWovMEZFZlBXQk1rajhOcjBwS0l4MG1lRm15L2g3b1VMM043VWVL?=
 =?utf-8?B?RXZuUklYRmcwTGp5OXRZc3dUY0xxNVM4aklZK0NMTlRoWmdZc1V4REt5ZE1u?=
 =?utf-8?B?dTZBbTFTNUhKVTZvU2kxRlVIUWRDbHRORlZQczBVTVo3VGd4UW5Eb0NJYTlp?=
 =?utf-8?B?WmE1M1N4U3VObmt1Nm1tdXVab0RpU2s5NXB1WnVxTS9aOWUzN3UvNHlKMnlt?=
 =?utf-8?B?WGtrblVVK0Q0cUhTUUNVVnFUdlRYK0lmblZwUlY5ZUtpYnlIMHVyL3ZSV3hF?=
 =?utf-8?B?R3M0LzhEelMvTStaNzNUQU9UZUxmOWlOVDB6V3dCZHFzTzBUMmZ5MEp2dFNX?=
 =?utf-8?B?OUd6UGR2SWdNd1RjMCtJenNYWUV2aE52bUZwWVAvM3BnTWRyQXF0RWpDeGM5?=
 =?utf-8?B?eWU1Rmd1WDY5VFlRWDI1Vk5QMml3aVJrL0JmaitaaWhtNkgweGpDc3VDcUZS?=
 =?utf-8?B?T2R4K0o5RElxT1FmWWt3emFpNFI5UnV6bjRKRHI5RG1zNGFqb1RIc1FZclNC?=
 =?utf-8?B?cFdvNTJXbThSK1pQSG1SVWwzdVcwaVdwV0RMNGphdVdKcEsweHhvOGJJMGk1?=
 =?utf-8?B?NjBmc3E1MzJsZzFLY0NEU0huVDA1RjcwZ2NDM3hXNjJybXljTXlJR0p4ZHhj?=
 =?utf-8?B?T2lpK1d6OVVwK2xvQmxzZDArSE9EUFRHbnQyT204dGNmd0ludnNzckNjM2N6?=
 =?utf-8?B?V2RMOGpnMXFXb3NBcUM1aXVnbDNXTTZLK2lqb3NGQ2Q2c0ZqOFBSbDdTSERs?=
 =?utf-8?B?Qk5qdGx2T2NHTFlyNHFDbnl3Vk5oU1hqRlRkQmtubkMyekpIQmVacll4WkRX?=
 =?utf-8?B?K1RDakdFSVlibDgycWI2dUVhTEFBcjlxNCtNN3VRMU9ZYU5aOGMvQmVDODhO?=
 =?utf-8?B?b3dzRGg4YkJzWnBQUVREd2dhSEdsR3lpYkpVbG9QdlJqdU41VEJaUGNFK05q?=
 =?utf-8?B?dy9ob0NwbUVEcDhlcGpIQlJuZ3ArMHgzaTl1N0pmU3RFM1FQRVRPbFRXbmVv?=
 =?utf-8?B?MFkvKzR2c2hYQTRIeFl3QjUxYmZVUFZvT1RhajgvbkNsdWJvMVhXTGVtanhS?=
 =?utf-8?B?dG5HZkkrbW1VLzJ1Rm45bVVXMlY1clhqWC96Vkd1c1FvZG5ZYjFSKy8xay9R?=
 =?utf-8?B?QXNGVkE2WlhieURSZHVPZnExZUwwaU8rc0QrcnIxK2dlaFh2bGJHMXE4UWlz?=
 =?utf-8?B?Z0Qva1EyZlp6ald1Z2xpaUdxckh2Sk4wZG83YUVnM0h0dnY1WWE3NXBVQW4z?=
 =?utf-8?B?VGZTNGJVOC9wajAzTys4QTFRTEJ0dnkwVXVFK3ZmaVlKQ0JUSEJmZUV5Y3RJ?=
 =?utf-8?B?MTIzdXpCNjdlcFZYdTJRNzlKS1Eyd3UyM1pyMUtMVlhmVS95SkhqUS81TjdT?=
 =?utf-8?B?TlFQM1ExTGFLYkVWR1FLVUEyZWN2S2UxTlNHTWh2RjJIdTdnN3JTZmVKOGNB?=
 =?utf-8?B?TWp4ZXJIZnZibW05YUdHbmhLUVkycmVza1BzU2phZWNqZnNyOHlGbVVnNzdp?=
 =?utf-8?Q?FsnxxeNl4WsPNLtO/hwn+sCI5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c96fc821-5005-4917-f114-08dbf6eab5ab
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 06:06:53.5020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XssAGBCgdp1+fdiEYPamGBx9Z+EBpVV2lSm6WiL1a81KpbtW5lkltIYoflQVwW9dYZqlKvgaJ7VEwlDYQvGNEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8170
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [v2 1/2] drm/xe: Add a new memory directory under
 tile
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



On 12/7/2023 10:51 AM, Sundaresan, Sujaritha wrote:
> 
> On 12/7/2023 10:42 AM, Upadhyay, Tejas wrote:
>>
>>> -----Original Message-----
>>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>>> Sundaresan, Sujaritha
>>> Sent: Wednesday, December 6, 2023 5:44 PM
>>> To: Gupta, Anshuman <anshuman.gupta@intel.com>; intel-
>>> xe@lists.freedesktop.org
>>> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>>> Subject: Re: [Intel-xe] [v2 1/2] drm/xe: Add a new memory directory 
>>> under
>>> tile
>>>
>>>
>>> On 12/6/2023 5:38 PM, Sundaresan, Sujaritha wrote:
>>>> On 12/6/2023 5:23 PM, Gupta, Anshuman wrote:
>>>>>> -----Original Message-----
>>>>>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>>>>>> Sujaritha Sundaresan
>>>>>> Sent: Wednesday, December 6, 2023 10:18 AM
>>>>>> To: intel-xe@lists.freedesktop.org
>>>>>> Cc: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>; Vivi,
>>>>>> Rodrigo <rodrigo.vivi@intel.com>
>>>>>> Subject: [Intel-xe] [v2 1/2] drm/xe: Add a new memory directory
>>>>>> under tile
>>>>>>
>>>>>> Add a new memory directory under /device/tile<n> and move
>>>>>> physical_vram_size attribute to the new directory.
>>>>>>
>>>>>> New hierarchy:
>>>>>>
>>>>>> /device/tile<n>/memory/physical_vram_size_bytes
>>>>>>
>>>>>> v2: Fix heading typo (Riana)
>>>>>>       Fix cleanup error on unload/reload cycle
>>>>>>
>>>>>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/xe/xe_tile_sysfs.c | 15 ++++++++++++---
>>>>>>    1 file changed, 12 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>> index 16376607c68f..e8ce4d9270e6 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>> @@ -24,7 +24,8 @@ static ssize_t
>>>>>>    physical_vram_size_bytes_show(struct device *kdev, struct
>>>>>> device_attribute *attr,
>>>>>>                      char *buf)
>>>>>>    {
>>>>>> -    struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
>>>>>> +    struct kobject *kobj = &kdev->kobj;
>>>>>> +    struct xe_tile *tile = kobj_to_tile(kobj->parent);
>>>>>>
>>>>>>        return sysfs_emit(buf, "%llu\n",
>>>>>> tile->mem.vram.actual_physical_size);
>>>>>>    }
>>>>>> @@ -38,7 +39,7 @@ static void tile_sysfs_fini(struct drm_device
>>>>>> *drm, void
>>>>>> *arg)  {
>>>>>>        struct xe_tile *tile = arg;
>>>>>>
>>>>>> -    kobject_put(tile->sysfs);
>>>>>> +    kobject_del(tile->sysfs);
>>>>> Why kobekct_del instead of kobject_put?
>>>>> Thanks,
>>>>> Anshuman Gupta.
>>>> Hi Anshuman,
>>>>
>>>> Basically when sanity checking, after reload we see that we are not
>>>> doing a proper cleanup.
>>>>
>>>> kobject_put will only decrement the ref count and possibly free the
>>>> kobject.
>>>>
>>>> But that is not happening in this case. There is a duplicate remaining
>>>> of the tile directory.
>>>>
>>>> This required a clean unregister of the parent from sysfs hence the
>>>> use of kobject_del.
>>>>
>>>> Thanks,
>>>>
>>>> Suja
>>> As a continuation of the above response;
>>>
>>> I can probably add a kobject_put call as well to ensure that we are 
>>> cleaning
>>> up the memory side of
>>>
>>> things as well. Will add.
>>>
>>> Thanks,
>>>
>>> Suja
>>>
>>>>>>    }
>>>>>>
>>>>>>    void xe_tile_sysfs_init(struct xe_tile *tile) @@ -46,6 +47,7 @@
>>>>>> void xe_tile_sysfs_init(struct xe_tile *tile)
>>>>>>        struct xe_device *xe = tile_to_xe(tile);
>>>>>>        struct device *dev = xe->drm.dev;
>>>>>>        struct kobj_tile *kt;
>>>>>> +    struct kobject *kobj;
>>>>>>        int err;
>>>>>>
>>>>>>        kt = kzalloc(sizeof(*kt), GFP_KERNEL); @@ -64,8 +66,15 @@ void
>>>>>> xe_tile_sysfs_init(struct xe_tile *tile)
>>>>>>
>>>>>>        tile->sysfs = &kt->base;
>>>>>>
>>>>>> +    kobj = kobject_create_and_add("memory", tile->sysfs);
>>>>>> +    if (!kobj) {
>>>>>> +        kobject_put(kobj);
>> Do you mean to put kobject_put(tile->sysfs) instead of 
>> kobject_put(kobj) ? as there was no Kobj created by the time you 
>> reached here!
>>
>> Tejas
> 
> Yup this should be fixed.
Hi Suja

Removing tile won't be right, as there are other directories (gt#) 
dependent on it. Simple return should be good with a warn?

Thanks
Riana
> 
> Thanks.
> 
> Suja
> 
>>
>>>>>> +        drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -
>>>>>> ENOMEM);
>>>>>> +        return;
>>>>>> +    }
>>>>>> +
>>>>>>        if (IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
>>>>>> -        sysfs_create_file(tile->sysfs, physical_memsize_attr))
>>>>>> +        sysfs_create_file(kobj, physical_memsize_attr))
>>>>>>            drm_warn(&xe->drm,
>>>>>>                 "Sysfs creation to read addr_range per tile
>>>>>> failed\n");
>>>>>>
>>>>>> -- 
>>>>>> 2.25.1
