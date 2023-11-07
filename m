Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0D1C4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 23:59:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7E010E6C2;
	Tue,  7 Nov 2023 23:59:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8330D10E6C2
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 23:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699401577; x=1730937577;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=xdo57WwwA8F3e2FWIyNi0YDl3xbChZC8ulJzYw9UhJI=;
 b=bufsOZQOSpURtG4X265QG9ESDZlSaT9h+5e7lJ9kWvc4psWLa3+i/97y
 XqaU6IuNKZyt/J83EFfi1MBynsg7n1DtVCZ79uuC1BIWNRJfUdwtQ8gXd
 a8j4TU1vIedoN/21Y4CotlIJ0Bp04HEVQthTXa1j73J5VHO+Yglz3uJr1
 lnR2gzNcWLpARzHHIqLVMUqLRcn7uPZnBjhKV0562OvfXxG5UwbLoonDL
 3Fmmsv7CX5BOjKJQ0l9u8O5fsTgkJxlydD3Zyz9J0eg8RZ1IrYzzS/ubJ
 Hv/la1pS5Cdi/e7I+8f9prRaUVMkEBJ7LMiH7LE/u8eK/0YqK1rGaX/XA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="392520074"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
 d="scan'208,217";a="392520074"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 15:59:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208,217";a="11001958"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 15:59:26 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 15:59:26 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 15:59:25 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 15:59:25 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 15:59:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwW5x5HJYGdU3PeAmQlygEAHpqo4C1YaOTiKX9HeIG1JfPW0jeWyp+RoAb90MArVaRTnLzBZPKyBJg5436iKpw1IDDRcIA4DsRVUjY8WiyCz9KJlYVs2fX9HYYNRra4XL6MGKwyIhZZFf5bg1YkQQAvuPxGS56xOt+2MDU/oNDAb1DEJYZ9+cbDwAqC4NEwI7HWgIveYuWPHJP7U4ZrBihId5X+960Xia7GUyTbGYlaHNdoqCWpEE7HE3fStLn7GOiOOkB468P6oXsHVDRq6Pw3Dt7YLsRave66qAz1O4TLdWOlLZCs22rLmYnGSOUn4bI+q3E7v5TefEKGltQQDkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zD41pNwKtBpyB9nzd7b4/Eb+6x34YTiVNRDpH0jKY+k=;
 b=RrFYlcD1Huptm8MsGiVfPyOZMOOSx4Hmyx6vGfvSFeJV54zrLWOko0lYniodx/IKug0vxYIQ13h4909NWtVKnVWlfDat5aQ8ozdR5D1w9TgWPabpVHEHKRbs2vga0+iUPuXtlfxr4ei5hZ4bB8M+McbPMYcLxHAQjV2CPYDwSW+U8dEW/SCLgYzXl8CxGsV9o6PSGQy+x6lU0YWCaktAnOOo2yZ2cuPmj0tyGG8I87KRzn0cGOFHWS5fVyIh5TikRGTSr29LyllDwcGICpty+8N5tEqG1AUscK7Qy9buHrzUgQu6OdmqHhGq8zqYw10jyB/OLJ4gang6vUl0YXe4jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SA0PR11MB4527.namprd11.prod.outlook.com (2603:10b6:806:72::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 23:59:22 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::588d:b37f:130c:9e86]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::588d:b37f:130c:9e86%6]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 23:59:22 +0000
Content-Type: multipart/alternative;
 boundary="------------6QVOoUM1uEA4hkoaS3Ugj9Xr"
Message-ID: <e9c261b1-9b7c-41b3-8334-2f8ccccf38a8@intel.com>
Date: Tue, 7 Nov 2023 15:59:22 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
 <20231027222928.1981633-5-daniele.ceraolospurio@intel.com>
 <db3df54c-47f7-4a8d-9ad3-9ddb2e1626a1@intel.com>
 <b60165a0-923f-4ed2-a8b4-aeb3f7a0c87a@intel.com>
 <828ccf67-179f-4615-9bf3-cf70f807abb5@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <828ccf67-179f-4615-9bf3-cf70f807abb5@intel.com>
X-ClientProxiedBy: SJ0PR03CA0123.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::8) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SA0PR11MB4527:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f6fd74b-5765-408f-6f2f-08dbdfed9054
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eZ15wo7t6WAzdozaapLYR9GU5aHnXm6/zLOFUGkrFC5plA+I8S8LeUximwfqON8iK3u8MmnluDFY+IysG7EIUPcjo7z6tieB1pPg3MsxT+Vz26yEpLVPz+kQH+6yEZe+1FEpRJvwoZz9dXtxIF1wkayRtcTU70wToLXmPajVVqXSJTYJ6sCIXrOeyBphYvSBxo0PTzYl8lcGGcYI/h5l+Kfgcy+2MrYY9fGkcVR/A+/TxSiHW2AuFbNgi9riG1HqG6GTpI7mmpyX9Ap5O7CtQZXmnREFnZukVbMbGh2olqt/vKpppxYHL9Ki54OeSqi+4rerXnIPfUBrZ2xWA5+SaVnQYjBpyF2ZB8RnfuxoM3RLP05+Y1ZWKhcT3/ZJ/4upQoz3PMIZKP6D7eXnVKzV0nT35OLZm2Az0nBkJU35iI9RZ388HP9RoB2fe0u27lIe3COXcN3XxxxKo9xDJHkiwDl5qVibhMiZrEMhOmh4T90hlVaBS5Xf7u9VRM7u+HEtMOVvB1L1i0RZpGbDHOr9cWi0K1/gn/yH5qaiyiuvKJ+tkIKVTGEqEfG8JIXHNPA+jMQ9yJ3aqJn+9PbMHI/ZCo5lGF++B1m4M0yVU1tLxui8iMs53A1GVEs0CWRGmGRFMCWBce3rKCrGKLruQKlu4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39860400002)(396003)(346002)(376002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(38100700002)(33964004)(6506007)(53546011)(83380400001)(31686004)(6512007)(82960400001)(8676002)(107886003)(2616005)(41300700001)(316002)(86362001)(2906002)(30864003)(31696002)(5660300002)(4326008)(36756003)(8936002)(66946007)(66556008)(26005)(66476007)(478600001)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2dpc2pNL0EwcUM4TTlncUxYMHlWMjhxV3UwVGx1MUs0UjQ4WlFBZ0NQakhk?=
 =?utf-8?B?Slp2VXRHYmFubE04WStEQ0tkVHZGUGxzT2krNjMvZHJDRzUvRzRTRklBdTFD?=
 =?utf-8?B?NHhWeXVmZWZiTzJEcFN1N0FxaU53ZzEvblp1ck94dmZ6WUliaFBidmkvVGhv?=
 =?utf-8?B?OEZxTUl6VDFVcXdYbDhVdklyYkdudy9od1pESGM3VXRmRmxNMFZ6bnVDZ1Iz?=
 =?utf-8?B?bTB4OEFxeDExTnJpZzVvQWhyLzdTV1RhSC9MWDExVXFpU2s2dzRrTitSWlZt?=
 =?utf-8?B?VVJjSURJU1kvdDNBVHd2THROQ1Fmb0pvdmJiTUdORTZOTUZ2RkwyVjFwaDlN?=
 =?utf-8?B?S1d1d2cydlQ2Mk5sakp1WS9kek5JZWIzUmNFSVhpb0JZSzJ0eFJRVERDKzhE?=
 =?utf-8?B?MzR1MGwyOWpSV082KzYzZUFKSGdicGtFYm1SWU1PaFhPZkFiZFkwT2ozc3ov?=
 =?utf-8?B?NmRCWS9JK1d0dUFWanpTTFJtM0RscmQrelFkNklDOHJzT0dCYTlpRDBIVnRF?=
 =?utf-8?B?aE5mM1dtMUN4NE51UjVCcnNQRTVXWjVEWXc1dWw2dE0rbFI1a0lHOWFVSlZZ?=
 =?utf-8?B?SzU1M1Q2SjlDNk9zOHhEbDJ1bVlRUEhHT0VqQU9Cbno2UHhDWC90TkNpQlBM?=
 =?utf-8?B?UXZuTUZhRzI2R1EzQXdNRzU2cjdDTDlRcUYwNU5QSnY5WHM2VmEvNTVyNnhn?=
 =?utf-8?B?dE11WnJ0VTA3ZnJ6WFZGQTN6bUdaTkJRSkVYcVgvQWdLOVJsUzQ2YzFvV0Jy?=
 =?utf-8?B?L0NrOEw3bHNKZWduUFpGS1ZYQkgrS3I5Q1hITS85alpNYlNPZ1NGK2ZybHow?=
 =?utf-8?B?d3V2RWZYZ0JHUTN1N2RUQ0wxcnpabnVXaDJRRFhtNmtqTlVWQ1BmS1p5ZXJF?=
 =?utf-8?B?UHlHZktXUU4zMy9uSGJjZGg5MWpXNjhEd252NVVkVW91MlhiY2hNUUI3bWFG?=
 =?utf-8?B?dDJyU3dUQ3dDTU13U2JkU0FnVzF1L05EajJGRU03OXRYTFlscEtKSDhqZVU1?=
 =?utf-8?B?a0p4WDJ1QlpZYjBKcFpVYTVUYzhWUDRKTndrYmp1K2l1YVFZT2tkelFZWm0z?=
 =?utf-8?B?Sy9BSmc3akd0a0NFeUU5UVZuQ2tQRjlrWUt4SDkwY01FYlF3ZkpuSWRlQnBU?=
 =?utf-8?B?MXpIKzhtN0k0dWt3Yk9RK1VadFNJN3E2RkExZDkvckkzL3pBRWF0M2QrVDVq?=
 =?utf-8?B?WWZvOHhCMno2RENxOFBPV3Y5TGp3eWl5OXg1UXR2anhObE41cnR0V2FmeXoz?=
 =?utf-8?B?ZDdrU1NyQUNPemZDUHJGdmpaQlJsVjhKSFlJMk40aGNycTI2MkxmVXorY1Q2?=
 =?utf-8?B?SFhlQXF1bzdUZDlzci9BWHF2MU0zbG82b2VEV3BRdCs2aDgvYUNzd1FsMTNh?=
 =?utf-8?B?eUhMTmFWczlGV1h4U2R5SWhxS2RKZDRjeG16T29zcnMvK3VOMG5nTnE5NUFZ?=
 =?utf-8?B?VTF2M2p4SktIWE0yeTNRL1BlWW5zN1p0YWVsN2xJSzI1ejNLcmQwQVJaN3h1?=
 =?utf-8?B?M05wVXRUanFNQTA4bmpidXNYeUdPRVBQM1BLQ3BCWjQzQUh5Wm9UU0Q0WFJu?=
 =?utf-8?B?T2ZLN1JabjQ4M3VNVk9NSXVpNVJFbnBHZzd2czJaQ2RRT0pKdUJXUjVRVmpW?=
 =?utf-8?B?ZW1ia3BQaEozd29xRURjb1NxK2hBUWNLQVY4SmRVQVF3SUp6WHpOME55Tm9T?=
 =?utf-8?B?KzY4dTdOTGFtOTV2ZXYvbmNUU01qemJuaVo1bFdsbUgwQy9FOHlVU0ZqbFZW?=
 =?utf-8?B?dGJINEJ2N2JXTzZyL3pCeFNEcEtmL3VjWTdhRlpNRU1kNUVzZkdTUG5NRStX?=
 =?utf-8?B?OEFLNkxSOEZUTCt1SFhVOHNpMmNXcEJ1b1Z2Yzd4QTFRWFRYNGk2b0MvZXRP?=
 =?utf-8?B?eEhXbzZxL0ZjUkM5MTVoWXhJSmRVMHczN0lxTEdvbWFCRC9xVldxbk5yMnRQ?=
 =?utf-8?B?eWhSTnp1c0pTaUg1WC9xZEhSc0pkdzlCY1BUKzlFUmU4VEdyVUFGOVlOaitn?=
 =?utf-8?B?bmVPcXBlRGI2c1I2SDQyZGgvVnIrdHpPcGdSS010cncxU3kzL2lzditzRnBF?=
 =?utf-8?B?eHN4T3hmbkV0U1JzeENyN0VHN3YvbERNems4WHd5Vk1KRE9ua0h5ZGd5SFpr?=
 =?utf-8?B?RmErWnBDT1dPbmQ5cDk4QUFMcmwvZ1lrU2tsek9nMFo2cDh6V1lCVE5HWWRQ?=
 =?utf-8?Q?TPgIqm57utbOEPL2uaAigQk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f6fd74b-5765-408f-6f2f-08dbdfed9054
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 23:59:22.5828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5no6NaIBh/pJuZ2cw4BgUUo4ecSf0TQQEQvtUV0shKyPKzw2R1RK7CL7UMujjYGTa3CjLIw+ROxfAtXwRw0RJJYRCDBSj/g4SRRf6LrrhPc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4527
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 04/12] drm/xe/gsc: Introduce GSC FW
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

--------------6QVOoUM1uEA4hkoaS3Ugj9Xr
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 11/7/2023 3:52 PM, John Harrison wrote:
> On 11/7/2023 15:32, Daniele Ceraolo Spurio wrote:
>> On 11/7/2023 3:26 PM, John Harrison wrote:
>>> On 10/27/2023 15:29, Daniele Ceraolo Spurio wrote:
>>>> Add the basic definitions and init function. Same as HuC, GSC is only
>>>> supported on the media GT on MTL and newer platforms.
>>>> Note that the GSC requires submission resources which can't be 
>>>> allocated
>>>> during init (because we don't have the hwconfig yet), so it can't be
>>>> marked as loadable at the end of the init function. The allocation of
>>>> those resources will come in the patch that makes use of them to load
>>>> the FW.
>>>>
>>>> Signed-off-by: Daniele Ceraolo Spurio 
>>>> <daniele.ceraolospurio@intel.com>
>>>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/Makefile         |  1 +
>>>>   drivers/gpu/drm/xe/xe_gsc.c         | 50 
>>>> +++++++++++++++++++++++++++++
>>>>   drivers/gpu/drm/xe/xe_gsc.h         | 13 ++++++++
>>>>   drivers/gpu/drm/xe/xe_gsc_types.h   | 19 +++++++++++
>>>>   drivers/gpu/drm/xe/xe_uc.c          |  9 ++++--
>>>>   drivers/gpu/drm/xe/xe_uc_fw.c       | 21 ++++++++++--
>>>>   drivers/gpu/drm/xe/xe_uc_fw.h       |  2 ++
>>>>   drivers/gpu/drm/xe/xe_uc_fw_types.h |  5 +--
>>>>   drivers/gpu/drm/xe/xe_uc_types.h    |  3 ++
>>>>   9 files changed, 116 insertions(+), 7 deletions(-)
>>>>   create mode 100644 drivers/gpu/drm/xe/xe_gsc.c
>>>>   create mode 100644 drivers/gpu/drm/xe/xe_gsc.h
>>>>   create mode 100644 drivers/gpu/drm/xe/xe_gsc_types.h
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>>> index cee57681732d..474b6044d054 100644
>>>> --- a/drivers/gpu/drm/xe/Makefile
>>>> +++ b/drivers/gpu/drm/xe/Makefile
>>>> @@ -57,6 +57,7 @@ xe-y += xe_bb.o \
>>>>       xe_exec_queue.o \
>>>>       xe_force_wake.o \
>>>>       xe_ggtt.o \
>>>> +    xe_gsc.o \
>>>>       xe_gt.o \
>>>>       xe_gt_clock.o \
>>>>       xe_gt_debugfs.o \
>>>> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
>>>> new file mode 100644
>>>> index 000000000000..3f709577d73b
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/xe_gsc.c
>>>> @@ -0,0 +1,50 @@
>>>> +// SPDX-License-Identifier: MIT
>>>> +/*
>>>> + * Copyright © 2023 Intel Corporation
>>>> + */
>>>> +
>>>> +#include "xe_gsc.h"
>>>> +
>>>> +#include "xe_device.h"
>>>> +#include "xe_gt.h"
>>>> +#include "xe_gt_printk.h"
>>>> +#include "xe_uc_fw.h"
>>>> +
>>>> +static struct xe_gt *
>>>> +gsc_to_gt(struct xe_gsc *gsc)
>>>> +{
>>>> +    return container_of(gsc, struct xe_gt, uc.gsc);
>>>> +}
>>>> +
>>>> +int xe_gsc_init(struct xe_gsc *gsc)
>>>> +{
>>>> +    struct xe_gt *gt = gsc_to_gt(gsc);
>>>> +    struct xe_tile *tile = gt_to_tile(gt);
>>>> +    int ret;
>>>> +
>>>> +    gsc->fw.type = XE_UC_FW_TYPE_GSC;
>>>> +
>>>> +    /* The GSC uC is only available on the media GT */
>>>> +    if (tile->media_gt && (gt != tile->media_gt)) {
>>>> +        xe_uc_fw_change_status(&gsc->fw, 
>>>> XE_UC_FIRMWARE_NOT_SUPPORTED);
>>>> +        return 0;
>>>> +    }
>>>> +
>>>> +    /*
>>>> +     * GSC can be "not supported" where GuC is instead supported, 
>>>> so we
>>>> +     * don't want to fail if xe_uc_fw_init() returns an error due 
>>>> to that.
>>> Not following this comment. Can you explain more?
>>
>> xe_uc_fw_init() is going to fail if the GSC FW is not defined for the 
>> platform. The uC switch is global for all FWs, so either all FW init 
>> functions are called or none of them; since we do have to handle the 
>> case where GuC is supported and GSC is not, xe_gsc_init() needs to 
>> not fail in that scenario. We do still have to call xe_uc_fw_init() 
>> as that's where the FW selection is (and therefore where we find out 
>> if it is defined or not), so the solution is to check the enablement 
>> status first before checking the return code.
>>
> Maybe go with this instead?
>
>     Some platforms can have GuC (and HuC?) but not GSC. That would
>     cause xe_uc_fw_init(gsc) to return a "not supported" failure code
>     and abort all firmware loading. So check for GSC being enabled
>     before propagating the failure back up. That way the higher level
>     will keep going and load GuC/HuC as appropriate.
>

HuC can also be "not supported", but apart from that I'll switch to the 
comment you suggested.

Daniele

>
>
>>>
>>>> +     * To avoid this problem, check the FW status before the 
>>>> return code.
>>>> +     */
>>>> +    ret = xe_uc_fw_init(&gsc->fw);
>>>> +    if (!xe_uc_fw_is_enabled(&gsc->fw))
>>>> +        return 0;
>>>> +    else if (ret)
>>>> +        goto out;
>>>> +
>>>> +    return 0;
>>>> +
>>>> +out:
>>>> +    xe_gt_err(gt, "GSC init failed with %d", ret);
>>>> +    return ret;
>>>> +}
>>>> +
>>>> diff --git a/drivers/gpu/drm/xe/xe_gsc.h b/drivers/gpu/drm/xe/xe_gsc.h
>>>> new file mode 100644
>>>> index 000000000000..baa7f21f4204
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/xe_gsc.h
>>>> @@ -0,0 +1,13 @@
>>>> +/* SPDX-License-Identifier: MIT */
>>>> +/*
>>>> + * Copyright © 2023 Intel Corporation
>>>> + */
>>>> +
>>>> +#ifndef _XE_GSC_H_
>>>> +#define _XE_GSC_H_
>>>> +
>>>> +#include "xe_gsc_types.h"
>>>> +
>>>> +int xe_gsc_init(struct xe_gsc *gsc);
>>>> +
>>>> +#endif
>>>> diff --git a/drivers/gpu/drm/xe/xe_gsc_types.h 
>>>> b/drivers/gpu/drm/xe/xe_gsc_types.h
>>>> new file mode 100644
>>>> index 000000000000..135f156e3736
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/xe_gsc_types.h
>>>> @@ -0,0 +1,19 @@
>>>> +/* SPDX-License-Identifier: MIT */
>>>> +/*
>>>> + * Copyright © 2023 Intel Corporation
>>>> + */
>>>> +
>>>> +#ifndef _XE_GSC_TYPES_H_
>>>> +#define _XE_GSC_TYPES_H_
>>>> +
>>>> +#include "xe_uc_fw_types.h"
>>>> +
>>>> +/**
>>>> + * struct xe_gsc - GSC
>>>> + */
>>>> +struct xe_gsc {
>>>> +    /** @fw: Generic uC firmware management */
>>>> +    struct xe_uc_fw fw;
>>>> +};
>>>> +
>>>> +#endif
>>>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>>>> index 784f53c5f282..b67154c78dff 100644
>>>> --- a/drivers/gpu/drm/xe/xe_uc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>>>> @@ -6,6 +6,7 @@
>>>>   #include "xe_uc.h"
>>>>     #include "xe_device.h"
>>>> +#include "xe_gsc.h"
>>>>   #include "xe_gt.h"
>>>>   #include "xe_guc.h"
>>>>   #include "xe_guc_pc.h"
>>>> @@ -32,8 +33,8 @@ int xe_uc_init(struct xe_uc *uc)
>>>>       int ret;
>>>>         /*
>>>> -     * We call the GuC/HuC init functions even if GuC submission 
>>>> is off to
>>>> -     * correctly move our tracking of the FW state to "disabled".
>>>> +     * We call the GuC/HuC/GSC init functions even if GuC 
>>>> submission is off
>>>> +     * to correctly move our tracking of the FW state to "disabled".
>>>>        */
>>>>         ret = xe_guc_init(&uc->guc);
>>>> @@ -44,6 +45,10 @@ int xe_uc_init(struct xe_uc *uc)
>>>>       if (ret)
>>>>           goto err;
>>>>   +    ret = xe_gsc_init(&uc->gsc);
>>>> +    if (ret)
>>>> +        goto err;
>>>> +
>>>>       if (!xe_device_uc_enabled(uc_to_xe(uc)))
>>>>           return 0;
>>>>   diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>>>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>> index 1f7dac394a1d..af3e5cba606f 100644
>>>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>> @@ -158,11 +158,18 @@ XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
>>>>   static struct xe_gt *
>>>>   __uc_fw_to_gt(struct xe_uc_fw *uc_fw, enum xe_uc_fw_type type)
>>>>   {
>>>> -    if (type == XE_UC_FW_TYPE_GUC)
>>>> +    XE_WARN_ON(type >= XE_UC_FW_NUM_TYPES);
>>>> +
>>>> +    switch (type) {
>>>> +    case XE_UC_FW_TYPE_GUC:
>>>>           return container_of(uc_fw, struct xe_gt, uc.guc.fw);
>>>> +    case XE_UC_FW_TYPE_HUC:
>>>> +        return container_of(uc_fw, struct xe_gt, uc.huc.fw);
>>>> +    case XE_UC_FW_TYPE_GSC:
>>>> +        return container_of(uc_fw, struct xe_gt, uc.gsc.fw);
>>>> +    }
>>>>   -    XE_WARN_ON(type != XE_UC_FW_TYPE_HUC);
>>>> -    return container_of(uc_fw, struct xe_gt, uc.huc.fw);
>>>> +    return NULL;
>>>>   }
>>>>     static struct xe_gt *uc_fw_to_gt(struct xe_uc_fw *uc_fw)
>>>> @@ -197,6 +204,14 @@ uc_fw_auto_select(struct xe_device *xe, struct 
>>>> xe_uc_fw *uc_fw)
>>>>       u32 count;
>>>>       int i;
>>>>   +    /*
>>>> +     * GSC FW support is still not fully in place, so we're not 
>>>> defining
>>>> +     * the FW blob yet because we don't want the driver to attempt 
>>>> to load
>>>> +     * it until we're ready for it.
>>>> +     */
>>>> +    if (uc_fw->type == XE_UC_FW_TYPE_GSC)
>>>> +        return;
>>>> +
>>>>       xe_assert(xe, uc_fw->type < ARRAY_SIZE(blobs_all));
>>>>       entries = blobs_all[uc_fw->type].entries;
>>>>       count = blobs_all[uc_fw->type].count;
>>>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h 
>>>> b/drivers/gpu/drm/xe/xe_uc_fw.h
>>>> index 1d1a0c156cdf..d4682b0276e2 100644
>>>> --- a/drivers/gpu/drm/xe/xe_uc_fw.h
>>>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.h
>>>> @@ -96,6 +96,8 @@ static inline const char *xe_uc_fw_type_repr(enum 
>>>> xe_uc_fw_type type)
>>>>           return "GuC";
>>>>       case XE_UC_FW_TYPE_HUC:
>>>>           return "HuC";
>>>> +    case XE_UC_FW_TYPE_GSC:
>>>> +        return "GSC";
>>>>       }
>>>>       return "uC";
>>>>   }
>>>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h 
>>>> b/drivers/gpu/drm/xe/xe_uc_fw_types.h
>>>> index e4774c560e67..239256bfdb07 100644
>>>> --- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
>>>> @@ -55,9 +55,10 @@ enum xe_uc_fw_status {
>>>>     enum xe_uc_fw_type {
>>>>       XE_UC_FW_TYPE_GUC = 0,
>>>> -    XE_UC_FW_TYPE_HUC
>>>> +    XE_UC_FW_TYPE_HUC,
>>>> +    XE_UC_FW_TYPE_GSC
>>>>   };
>>>> -#define XE_UC_FW_NUM_TYPES 2
>>>> +#define XE_UC_FW_NUM_TYPES 3
>>> Why is this not just a sentinel entry of the enum?
>>
>> No idea, I'm just updating the value. It is the same in i915.
> Seems like a good opportunity to fix it.
>
> John.
>
>>
>> Daniele
>>
>>>
>>> John.
>>>
>>>>     /**
>>>>    * struct xe_uc_fw_version - Version for XE micro controller 
>>>> firmware
>>>> diff --git a/drivers/gpu/drm/xe/xe_uc_types.h 
>>>> b/drivers/gpu/drm/xe/xe_uc_types.h
>>>> index 49bef6498b85..9924e4484866 100644
>>>> --- a/drivers/gpu/drm/xe/xe_uc_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_uc_types.h
>>>> @@ -6,6 +6,7 @@
>>>>   #ifndef _XE_UC_TYPES_H_
>>>>   #define _XE_UC_TYPES_H_
>>>>   +#include "xe_gsc_types.h"
>>>>   #include "xe_guc_types.h"
>>>>   #include "xe_huc_types.h"
>>>>   #include "xe_wopcm_types.h"
>>>> @@ -18,6 +19,8 @@ struct xe_uc {
>>>>       struct xe_guc guc;
>>>>       /** @huc: HuC */
>>>>       struct xe_huc huc;
>>>> +    /** @gsc: Graphics Security Controller */
>>>> +    struct xe_gsc gsc;
>>>>       /** @wopcm: WOPCM */
>>>>       struct xe_wopcm wopcm;
>>>>   };
>>>
>>
>

--------------6QVOoUM1uEA4hkoaS3Ugj9Xr
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 11/7/2023 3:52 PM, John Harrison
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:828ccf67-179f-4615-9bf3-cf70f807abb5@intel.com">
      
      On 11/7/2023 15:32, Daniele Ceraolo Spurio wrote:<br>
      <blockquote type="cite" cite="mid:b60165a0-923f-4ed2-a8b4-aeb3f7a0c87a@intel.com"> On
        11/7/2023 3:26 PM, John Harrison wrote: <br>
        <blockquote type="cite"> On 10/27/2023 15:29, Daniele Ceraolo
          Spurio wrote: <br>
          <blockquote type="cite">Add the basic definitions and init
            function. Same as HuC, GSC is only <br>
            supported on the media GT on MTL and newer platforms. <br>
            Note that the GSC requires submission resources which can't
            be allocated <br>
            during init (because we don't have the hwconfig yet), so it
            can't be <br>
            marked as loadable at the end of the init function. The
            allocation of <br>
            those resources will come in the patch that makes use of
            them to load <br>
            the FW. <br>
            <br>
            Signed-off-by: Daniele Ceraolo Spurio <a class="moz-txt-link-rfc2396E" href="mailto:daniele.ceraolospurio@intel.com" moz-do-not-send="true">&lt;daniele.ceraolospurio@intel.com&gt;</a>
            <br>
            Cc: Alan Previn <a class="moz-txt-link-rfc2396E" href="mailto:alan.previn.teres.alexis@intel.com" moz-do-not-send="true">&lt;alan.previn.teres.alexis@intel.com&gt;</a>
            <br>
            Cc: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com" moz-do-not-send="true">&lt;John.C.Harrison@Intel.com&gt;</a>
            <br>
            --- <br>
            &nbsp; drivers/gpu/drm/xe/Makefile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 + <br>
            &nbsp; drivers/gpu/drm/xe/xe_gsc.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 50
            +++++++++++++++++++++++++++++ <br>
            &nbsp; drivers/gpu/drm/xe/xe_gsc.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 13 ++++++++ <br>
            &nbsp; drivers/gpu/drm/xe/xe_gsc_types.h&nbsp;&nbsp; | 19 +++++++++++ <br>
            &nbsp; drivers/gpu/drm/xe/xe_uc.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 9 ++++-- <br>
            &nbsp; drivers/gpu/drm/xe/xe_uc_fw.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 21 ++++++++++-- <br>
            &nbsp; drivers/gpu/drm/xe/xe_uc_fw.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 ++ <br>
            &nbsp; drivers/gpu/drm/xe/xe_uc_fw_types.h |&nbsp; 5 +-- <br>
            &nbsp; drivers/gpu/drm/xe/xe_uc_types.h&nbsp;&nbsp;&nbsp; |&nbsp; 3 ++ <br>
            &nbsp; 9 files changed, 116 insertions(+), 7 deletions(-) <br>
            &nbsp; create mode 100644 drivers/gpu/drm/xe/xe_gsc.c <br>
            &nbsp; create mode 100644 drivers/gpu/drm/xe/xe_gsc.h <br>
            &nbsp; create mode 100644 drivers/gpu/drm/xe/xe_gsc_types.h <br>
            <br>
            diff --git a/drivers/gpu/drm/xe/Makefile
            b/drivers/gpu/drm/xe/Makefile <br>
            index cee57681732d..474b6044d054 100644 <br>
            --- a/drivers/gpu/drm/xe/Makefile <br>
            +++ b/drivers/gpu/drm/xe/Makefile <br>
            @@ -57,6 +57,7 @@ xe-y += xe_bb.o \ <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_exec_queue.o \ <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_force_wake.o \ <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_ggtt.o \ <br>
            +&nbsp;&nbsp;&nbsp; xe_gsc.o \ <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_gt.o \ <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_gt_clock.o \ <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_gt_debugfs.o \ <br>
            diff --git a/drivers/gpu/drm/xe/xe_gsc.c
            b/drivers/gpu/drm/xe/xe_gsc.c <br>
            new file mode 100644 <br>
            index 000000000000..3f709577d73b <br>
            --- /dev/null <br>
            +++ b/drivers/gpu/drm/xe/xe_gsc.c <br>
            @@ -0,0 +1,50 @@ <br>
            +// SPDX-License-Identifier: MIT <br>
            +/* <br>
            + * Copyright © 2023 Intel Corporation <br>
            + */ <br>
            + <br>
            +#include &quot;xe_gsc.h&quot; <br>
            + <br>
            +#include &quot;xe_device.h&quot; <br>
            +#include &quot;xe_gt.h&quot; <br>
            +#include &quot;xe_gt_printk.h&quot; <br>
            +#include &quot;xe_uc_fw.h&quot; <br>
            + <br>
            +static struct xe_gt * <br>
            +gsc_to_gt(struct xe_gsc *gsc) <br>
            +{ <br>
            +&nbsp;&nbsp;&nbsp; return container_of(gsc, struct xe_gt, uc.gsc); <br>
            +} <br>
            + <br>
            +int xe_gsc_init(struct xe_gsc *gsc) <br>
            +{ <br>
            +&nbsp;&nbsp;&nbsp; struct xe_gt *gt = gsc_to_gt(gsc); <br>
            +&nbsp;&nbsp;&nbsp; struct xe_tile *tile = gt_to_tile(gt); <br>
            +&nbsp;&nbsp;&nbsp; int ret; <br>
            + <br>
            +&nbsp;&nbsp;&nbsp; gsc-&gt;fw.type = XE_UC_FW_TYPE_GSC; <br>
            + <br>
            +&nbsp;&nbsp;&nbsp; /* The GSC uC is only available on the media GT */ <br>
            +&nbsp;&nbsp;&nbsp; if (tile-&gt;media_gt &amp;&amp; (gt !=
            tile-&gt;media_gt)) { <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_uc_fw_change_status(&amp;gsc-&gt;fw,
            XE_UC_FIRMWARE_NOT_SUPPORTED); <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0; <br>
            +&nbsp;&nbsp;&nbsp; } <br>
            + <br>
            +&nbsp;&nbsp;&nbsp; /* <br>
            +&nbsp;&nbsp;&nbsp;&nbsp; * GSC can be &quot;not supported&quot; where GuC is instead
            supported, so we <br>
            +&nbsp;&nbsp;&nbsp;&nbsp; * don't want to fail if xe_uc_fw_init() returns an
            error due to that. <br>
          </blockquote>
          Not following this comment. Can you explain more? <br>
        </blockquote>
        <br>
        xe_uc_fw_init() is going to fail if the GSC FW is not defined
        for the platform. The uC switch is global for all FWs, so either
        all FW init functions are called or none of them; since we do
        have to handle the case where GuC is supported and GSC is not,
        xe_gsc_init() needs to not fail in that scenario. We do still
        have to call xe_uc_fw_init() as that's where the FW selection is
        (and therefore where we find out if it is defined or not), so
        the solution is to check the enablement status first before
        checking the return code. <br>
        <br>
      </blockquote>
      Maybe go with this instead?<br>
      <blockquote>Some platforms can have GuC (and HuC?) but not GSC.
        That would cause xe_uc_fw_init(gsc) to return a &quot;not supported&quot;
        failure code and abort all firmware loading. So check for GSC
        being enabled before propagating the failure back up. That way
        the higher level will keep going and load GuC/HuC as
        appropriate.<br>
      </blockquote>
    </blockquote>
    <br>
    HuC can also be &quot;not supported&quot;, but apart from that I'll switch to
    the comment you suggested.<br>
    <br>
    Daniele<br>
    <br>
    <blockquote type="cite" cite="mid:828ccf67-179f-4615-9bf3-cf70f807abb5@intel.com">
      <blockquote> </blockquote>
      <br>
      <br>
      <blockquote type="cite" cite="mid:b60165a0-923f-4ed2-a8b4-aeb3f7a0c87a@intel.com">
        <blockquote type="cite"> <br>
          <blockquote type="cite">+&nbsp;&nbsp;&nbsp;&nbsp; * To avoid this problem, check
            the FW status before the return code. <br>
            +&nbsp;&nbsp;&nbsp;&nbsp; */ <br>
            +&nbsp;&nbsp;&nbsp; ret = xe_uc_fw_init(&amp;gsc-&gt;fw); <br>
            +&nbsp;&nbsp;&nbsp; if (!xe_uc_fw_is_enabled(&amp;gsc-&gt;fw)) <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0; <br>
            +&nbsp;&nbsp;&nbsp; else if (ret) <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto out; <br>
            + <br>
            +&nbsp;&nbsp;&nbsp; return 0; <br>
            + <br>
            +out: <br>
            +&nbsp;&nbsp;&nbsp; xe_gt_err(gt, &quot;GSC init failed with %d&quot;, ret); <br>
            +&nbsp;&nbsp;&nbsp; return ret; <br>
            +} <br>
            + <br>
            diff --git a/drivers/gpu/drm/xe/xe_gsc.h
            b/drivers/gpu/drm/xe/xe_gsc.h <br>
            new file mode 100644 <br>
            index 000000000000..baa7f21f4204 <br>
            --- /dev/null <br>
            +++ b/drivers/gpu/drm/xe/xe_gsc.h <br>
            @@ -0,0 +1,13 @@ <br>
            +/* SPDX-License-Identifier: MIT */ <br>
            +/* <br>
            + * Copyright © 2023 Intel Corporation <br>
            + */ <br>
            + <br>
            +#ifndef _XE_GSC_H_ <br>
            +#define _XE_GSC_H_ <br>
            + <br>
            +#include &quot;xe_gsc_types.h&quot; <br>
            + <br>
            +int xe_gsc_init(struct xe_gsc *gsc); <br>
            + <br>
            +#endif <br>
            diff --git a/drivers/gpu/drm/xe/xe_gsc_types.h
            b/drivers/gpu/drm/xe/xe_gsc_types.h <br>
            new file mode 100644 <br>
            index 000000000000..135f156e3736 <br>
            --- /dev/null <br>
            +++ b/drivers/gpu/drm/xe/xe_gsc_types.h <br>
            @@ -0,0 +1,19 @@ <br>
            +/* SPDX-License-Identifier: MIT */ <br>
            +/* <br>
            + * Copyright © 2023 Intel Corporation <br>
            + */ <br>
            + <br>
            +#ifndef _XE_GSC_TYPES_H_ <br>
            +#define _XE_GSC_TYPES_H_ <br>
            + <br>
            +#include &quot;xe_uc_fw_types.h&quot; <br>
            + <br>
            +/** <br>
            + * struct xe_gsc - GSC <br>
            + */ <br>
            +struct xe_gsc { <br>
            +&nbsp;&nbsp;&nbsp; /** @fw: Generic uC firmware management */ <br>
            +&nbsp;&nbsp;&nbsp; struct xe_uc_fw fw; <br>
            +}; <br>
            + <br>
            +#endif <br>
            diff --git a/drivers/gpu/drm/xe/xe_uc.c
            b/drivers/gpu/drm/xe/xe_uc.c <br>
            index 784f53c5f282..b67154c78dff 100644 <br>
            --- a/drivers/gpu/drm/xe/xe_uc.c <br>
            +++ b/drivers/gpu/drm/xe/xe_uc.c <br>
            @@ -6,6 +6,7 @@ <br>
            &nbsp; #include &quot;xe_uc.h&quot; <br>
            &nbsp; &nbsp; #include &quot;xe_device.h&quot; <br>
            +#include &quot;xe_gsc.h&quot; <br>
            &nbsp; #include &quot;xe_gt.h&quot; <br>
            &nbsp; #include &quot;xe_guc.h&quot; <br>
            &nbsp; #include &quot;xe_guc_pc.h&quot; <br>
            @@ -32,8 +33,8 @@ int xe_uc_init(struct xe_uc *uc) <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret; <br>
            &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* <br>
            -&nbsp;&nbsp;&nbsp;&nbsp; * We call the GuC/HuC init functions even if GuC
            submission is off to <br>
            -&nbsp;&nbsp;&nbsp;&nbsp; * correctly move our tracking of the FW state to
            &quot;disabled&quot;. <br>
            +&nbsp;&nbsp;&nbsp;&nbsp; * We call the GuC/HuC/GSC init functions even if GuC
            submission is off <br>
            +&nbsp;&nbsp;&nbsp;&nbsp; * to correctly move our tracking of the FW state to
            &quot;disabled&quot;. <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */ <br>
            &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = xe_guc_init(&amp;uc-&gt;guc); <br>
            @@ -44,6 +45,10 @@ int xe_uc_init(struct xe_uc *uc) <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto err; <br>
            &nbsp; +&nbsp;&nbsp;&nbsp; ret = xe_gsc_init(&amp;uc-&gt;gsc); <br>
            +&nbsp;&nbsp;&nbsp; if (ret) <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto err; <br>
            + <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!xe_device_uc_enabled(uc_to_xe(uc))) <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0; <br>
            &nbsp; diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c
            b/drivers/gpu/drm/xe/xe_uc_fw.c <br>
            index 1f7dac394a1d..af3e5cba606f 100644 <br>
            --- a/drivers/gpu/drm/xe/xe_uc_fw.c <br>
            +++ b/drivers/gpu/drm/xe/xe_uc_fw.c <br>
            @@ -158,11 +158,18 @@
            XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE, <br>
            &nbsp; static struct xe_gt * <br>
            &nbsp; __uc_fw_to_gt(struct xe_uc_fw *uc_fw, enum xe_uc_fw_type
            type) <br>
            &nbsp; { <br>
            -&nbsp;&nbsp;&nbsp; if (type == XE_UC_FW_TYPE_GUC) <br>
            +&nbsp;&nbsp;&nbsp; XE_WARN_ON(type &gt;= XE_UC_FW_NUM_TYPES); <br>
            + <br>
            +&nbsp;&nbsp;&nbsp; switch (type) { <br>
            +&nbsp;&nbsp;&nbsp; case XE_UC_FW_TYPE_GUC: <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return container_of(uc_fw, struct xe_gt,
            uc.guc.fw); <br>
            +&nbsp;&nbsp;&nbsp; case XE_UC_FW_TYPE_HUC: <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return container_of(uc_fw, struct xe_gt,
            uc.huc.fw); <br>
            +&nbsp;&nbsp;&nbsp; case XE_UC_FW_TYPE_GSC: <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return container_of(uc_fw, struct xe_gt,
            uc.gsc.fw); <br>
            +&nbsp;&nbsp;&nbsp; } <br>
            &nbsp; -&nbsp;&nbsp;&nbsp; XE_WARN_ON(type != XE_UC_FW_TYPE_HUC); <br>
            -&nbsp;&nbsp;&nbsp; return container_of(uc_fw, struct xe_gt, uc.huc.fw); <br>
            +&nbsp;&nbsp;&nbsp; return NULL; <br>
            &nbsp; } <br>
            &nbsp; &nbsp; static struct xe_gt *uc_fw_to_gt(struct xe_uc_fw *uc_fw)
            <br>
            @@ -197,6 +204,14 @@ uc_fw_auto_select(struct xe_device *xe,
            struct xe_uc_fw *uc_fw) <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 count; <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i; <br>
            &nbsp; +&nbsp;&nbsp;&nbsp; /* <br>
            +&nbsp;&nbsp;&nbsp;&nbsp; * GSC FW support is still not fully in place, so we're
            not defining <br>
            +&nbsp;&nbsp;&nbsp;&nbsp; * the FW blob yet because we don't want the driver to
            attempt to load <br>
            +&nbsp;&nbsp;&nbsp;&nbsp; * it until we're ready for it. <br>
            +&nbsp;&nbsp;&nbsp;&nbsp; */ <br>
            +&nbsp;&nbsp;&nbsp; if (uc_fw-&gt;type == XE_UC_FW_TYPE_GSC) <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return; <br>
            + <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_assert(xe, uc_fw-&gt;type &lt;
            ARRAY_SIZE(blobs_all)); <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; entries = blobs_all[uc_fw-&gt;type].entries; <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; count = blobs_all[uc_fw-&gt;type].count; <br>
            diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h
            b/drivers/gpu/drm/xe/xe_uc_fw.h <br>
            index 1d1a0c156cdf..d4682b0276e2 100644 <br>
            --- a/drivers/gpu/drm/xe/xe_uc_fw.h <br>
            +++ b/drivers/gpu/drm/xe/xe_uc_fw.h <br>
            @@ -96,6 +96,8 @@ static inline const char
            *xe_uc_fw_type_repr(enum xe_uc_fw_type type) <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;GuC&quot;; <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case XE_UC_FW_TYPE_HUC: <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;HuC&quot;; <br>
            +&nbsp;&nbsp;&nbsp; case XE_UC_FW_TYPE_GSC: <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;GSC&quot;; <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;uC&quot;; <br>
            &nbsp; } <br>
            diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h
            b/drivers/gpu/drm/xe/xe_uc_fw_types.h <br>
            index e4774c560e67..239256bfdb07 100644 <br>
            --- a/drivers/gpu/drm/xe/xe_uc_fw_types.h <br>
            +++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h <br>
            @@ -55,9 +55,10 @@ enum xe_uc_fw_status { <br>
            &nbsp; &nbsp; enum xe_uc_fw_type { <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_UC_FW_TYPE_GUC = 0, <br>
            -&nbsp;&nbsp;&nbsp; XE_UC_FW_TYPE_HUC <br>
            +&nbsp;&nbsp;&nbsp; XE_UC_FW_TYPE_HUC, <br>
            +&nbsp;&nbsp;&nbsp; XE_UC_FW_TYPE_GSC <br>
            &nbsp; }; <br>
            -#define XE_UC_FW_NUM_TYPES 2 <br>
            +#define XE_UC_FW_NUM_TYPES 3 <br>
          </blockquote>
          Why is this not just a sentinel entry of the enum? <br>
        </blockquote>
        <br>
        No idea, I'm just updating the value. It is the same in i915. <br>
      </blockquote>
      Seems like a good opportunity to fix it.<br>
      <br>
      John.<br>
      <br>
      <blockquote type="cite" cite="mid:b60165a0-923f-4ed2-a8b4-aeb3f7a0c87a@intel.com"> <br>
        Daniele <br>
        <br>
        <blockquote type="cite"> <br>
          John. <br>
          <br>
          <blockquote type="cite">&nbsp; &nbsp; /** <br>
            &nbsp;&nbsp; * struct xe_uc_fw_version - Version for XE micro
            controller firmware <br>
            diff --git a/drivers/gpu/drm/xe/xe_uc_types.h
            b/drivers/gpu/drm/xe/xe_uc_types.h <br>
            index 49bef6498b85..9924e4484866 100644 <br>
            --- a/drivers/gpu/drm/xe/xe_uc_types.h <br>
            +++ b/drivers/gpu/drm/xe/xe_uc_types.h <br>
            @@ -6,6 +6,7 @@ <br>
            &nbsp; #ifndef _XE_UC_TYPES_H_ <br>
            &nbsp; #define _XE_UC_TYPES_H_ <br>
            &nbsp; +#include &quot;xe_gsc_types.h&quot; <br>
            &nbsp; #include &quot;xe_guc_types.h&quot; <br>
            &nbsp; #include &quot;xe_huc_types.h&quot; <br>
            &nbsp; #include &quot;xe_wopcm_types.h&quot; <br>
            @@ -18,6 +19,8 @@ struct xe_uc { <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_guc guc; <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @huc: HuC */ <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_huc huc; <br>
            +&nbsp;&nbsp;&nbsp; /** @gsc: Graphics Security Controller */ <br>
            +&nbsp;&nbsp;&nbsp; struct xe_gsc gsc; <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @wopcm: WOPCM */ <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_wopcm wopcm; <br>
            &nbsp; }; <br>
          </blockquote>
          <br>
        </blockquote>
        <br>
      </blockquote>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------6QVOoUM1uEA4hkoaS3Ugj9Xr--
