Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BCEC4706C
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 10:10:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05EE210E187;
	Tue, 16 Jan 2024 10:10:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B86D10E187
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 10:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705399807; x=1736935807;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NAoCMOPBg7Kc6dWSOlyjZkNelh09RyxblyqSbsKTmZM=;
 b=m/5UzOtVZvHtC9RjmOi2hMvwgOATzL6JN1XVbNOKsdmhCZmdUKqoebOd
 o0JDBaWIGvD9irGvC/BP3L9fRDU8D4Bw6lm24nwf3mpvmKsUoBn9b5AYc
 hTJx2lwitm2d0ItsSQZbDPivaN2Y8l9scdh84fhvqMgctU3CEWE6JeuQ6
 nzExwTA2cZnPuwGsDC59INnRs8apIyZI03z8+SZzrN3Deij9VOvHjdUKP
 lj8MVD2znDXl2uAzo+1DOFumt8+APaCs+0Zf/YIZNAI21k71xz906T9wi
 3v+EL5C+/mnHC4ra2oB9/MNBY6AYVE/ww3pqE3vCIkEazEZOxUXAYomNT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="6530024"
X-IronPort-AV: E=Sophos;i="6.04,198,1695711600"; 
   d="scan'208";a="6530024"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 02:10:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,198,1695711600"; d="scan'208";a="32409766"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2024 02:10:04 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 02:10:03 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 02:10:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 02:10:03 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Jan 2024 02:10:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Het9AkXz7Lr6tSnFsTyPzIwJ8mbw6mYIdv2eEF7Uktax2HIOjXDPkOKVJiaus8eDGlJgF028vIBXHFZ8ON+uZXMJp0vNJKVNxnmmDdiaZc9mrnPAkIj74y1RFRJcPCz7//4jlVvOBmWwKSzQq6Qat0KpVIPZx8bkIQZXynZvhkwKUTw/HpAHnNdaQEVF77gGHwXNmBPh0eBIdW1acN4jqrZSAtAH5oQHD6Vut3IY8CE2/h744e+PieoXuSkm9Pc/cQsBayrQAXOCwpibw+H4+by3r6lMIO9C4sfPgyE+Z6q01QYwr8WHunsB/3XC8Z2FneAzGskXUf18ELELxI49dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lh1munexRSgeNEOenk3DtYwIz01/zZfS13tj7GAQBsk=;
 b=f+FRk6ax3nY6Wx171SVGJz/Vv1qvoKScvleFVBltyVNg1YM1uCmETfSbiUWyx3lcKvEFJrjQu8OmM8zGRNWmXpM6y0A4P2RAINR31WMTq8XTP7tyL6/BDs8ndL1xnzI4Ntp8mf6NNNA21iU6LiukEXsp0aFwL2uhlBwcxTjQXA7h5cb4Uen2nLqjpuDbRi+FtzJR8fcPErXnN+Rw/sE2l98+40of5+pkl8p1ytyzPDvnBT823jeNH3YkklwwX5xSMD7cH+8sOreU1JcL5PuDN1YrTWVpPowwjRbdt3PAfZXtSB7EriyQmygB2JiErzGhmC2UrG0vOgIRPEpu/FAKbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5664.namprd11.prod.outlook.com (2603:10b6:a03:37f::18)
 by SJ0PR11MB5813.namprd11.prod.outlook.com (2603:10b6:a03:422::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.24; Tue, 16 Jan
 2024 10:10:01 +0000
Received: from SJ0PR11MB5664.namprd11.prod.outlook.com
 ([fe80::bf36:21c1:688a:f392]) by SJ0PR11MB5664.namprd11.prod.outlook.com
 ([fe80::bf36:21c1:688a:f392%4]) with mapi id 15.20.7181.027; Tue, 16 Jan 2024
 10:10:01 +0000
Message-ID: <d8bbf3ad-0c20-474d-a0d1-ba17f93bad99@intel.com>
Date: Tue, 16 Jan 2024 15:39:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix typo in vram frequency sysfs documentation
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240110074203.2169233-1-sujaritha.sundaresan@intel.com>
 <cyt4suev4duu5vgiwurootcxklz3jdxdtdq552ggkbwqtqdh6i@snb34eaejk7i>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <cyt4suev4duu5vgiwurootcxklz3jdxdtdq552ggkbwqtqdh6i@snb34eaejk7i>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0159.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::14) To SJ0PR11MB5664.namprd11.prod.outlook.com
 (2603:10b6:a03:37f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5664:EE_|SJ0PR11MB5813:EE_
X-MS-Office365-Filtering-Correlation-Id: 001ff822-bf0d-43bc-bb1e-08dc167b4cdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mf4/RJ0gFASCcD/1xwWDWWbc+AVD/9SAGnkdmX352GOC23X+DP/QsXMxdilIixauYzzAoqqhJgmh58twxLqwgFwgqDTlk2txgLbMNxkQf3qeJwH/IQ9ga+ULc/9pivXrxxm3WGBJRIiBXNWTsLPfCgzzu3J2XLsue1SovQB+8Ould92qX6M21gzfwD8vps48/LvZ/wxHJ1OElTuSr7UWfFSidLVRD+4bq6pN+STZ1h8Typ4sMrxPRSDjco4Y/Qy76ut++3WkAmy1W+CuWriQjg5gCk9YkFTwt3uE+VERDoIf1TV+o8KVTfldJscTknS6q/CNAKLlcxb0hKh56qc7RLzvLY5g1Mjz8dWxRD91I/BwsAXDxqo9T7sLwHPYpQZFg8VYhXgF/qMOTS6WkGW9UpUZTbdHkzgid2iEEGp0rkVTpgCNbKHxXcwcBLs6KsAiWV4ydwfYPxbwkYFKgjFztpKY2R3pYd888POSnS+wCediEnHFVzXkwjUg8q+b05tUCLkKoIDEt1kPODTlZX1baygsxQlH5zICajKCmEZ45BPrFderAZG+V5nRbrOOzY7bPGUPpspchnEpbRp4nipqWxhtdLnlJzoEmPiNT/pmBoB5mr4/2OZ6uiehGh4SULHAG3Q0IkhMbz3D4tbBCUEK9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5664.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(396003)(376002)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(31686004)(66556008)(66476007)(6636002)(66946007)(2906002)(37006003)(86362001)(6666004)(8936002)(6862004)(4326008)(31696002)(316002)(8676002)(41300700001)(36756003)(38100700002)(82960400001)(2616005)(53546011)(6506007)(6512007)(478600001)(26005)(5660300002)(6486002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTBvc2NkTEZBQUFFQkVuakZNdXFNMy9HM1p2ZHRLT1lKbTRJR2NMTmM3Sisy?=
 =?utf-8?B?d2JhTHJybDZZY20zQmlWZDUvRFlDOHJaZjVyT1p3U1BDTisvTWhDNno1Mlk2?=
 =?utf-8?B?QkpaQVc0Y1Nqd2NzVmVHTzFFZDhKR0oyN2pYZ0t5cTh2MVNucC8xdmNmci9w?=
 =?utf-8?B?SFdCRFhjKzV5c05Pc3EzL3BmcS9naU1ZMlRtbytwY2Q2eXUweVgyTnIxd3Zz?=
 =?utf-8?B?SEQ3ZVFMWXk5WXFyeVA1eTlPNC9LOTN0SWNocnk3eTVIamxCZFJjTld3Kyto?=
 =?utf-8?B?NElkcm1Ha0JGdlE4MlNUS2JqRHJmWFhsKzlQdlhsTk9iWGNtWUdvYUpJeU5B?=
 =?utf-8?B?WGRYMktWVlN3ZklZejBMbSsyODFVT052RHFwNEdJU3duWVVlb2lZOTFVZkJY?=
 =?utf-8?B?SmNxNzhiM2czUFBNalV1L3p3NXg0bURqaTBWNzFNN0h3SDNlUzRwdlpDVGE2?=
 =?utf-8?B?eFo2K3hRd1NOZHp1ck85QVhMdUlWMUF6L3piL2FTeTZZeVc5bXd0Sk1VM2xL?=
 =?utf-8?B?S2dma1NSSktiMGhwbENXVjJNUjBKYkZab3QrMExLM3pPcjA3aUplQXpBV0Jm?=
 =?utf-8?B?Mk9qa1dBdURhSGUrVWZuYzQ1aWRyMGlHSlM0NVppbTNNY2NUNThpMUlBaEo4?=
 =?utf-8?B?REV6Y2d1WUJpeHU3RThqUmZtYVo4MnJFR2l4Vm1Ud1hWOGUrYzV6V2FVV3po?=
 =?utf-8?B?RmRUS21DU0dPVVR6RmMvRGI2L0ExN2NiZ0ZWdEMyUGhVNEg1NkdGSmE0bmta?=
 =?utf-8?B?ajI5Q3kwWnZUU0ZvbjZhSnE5SWM2NUlzeFpkeG1DZDZrakQ0TVlBU1RYMHhS?=
 =?utf-8?B?dm1LQitrMTNIbi9BUXhPakZQZ0dUZEYzdEJGelhKSi9Kdlk3dTh5L3RGT1dx?=
 =?utf-8?B?QVNJY1V4TW1JMko5R2RoQ1RjbzBXS2lkOWgrVEJ5UkRuU1BzOUMrUThzYWgv?=
 =?utf-8?B?MVlYWmpLOVM1OGgxWE1sdGJUNFpUT3hxbytJcEIvSVFhcGh2Lzk2cE5tR2hN?=
 =?utf-8?B?d3QzZWNTdUFPc0VLb2lNNjhET1BQZ2VCb2ZWSGh1OGxQTGlIYzAvdWN6bnRV?=
 =?utf-8?B?Tmd0RnNLSHVTcHljSXFZR2dwRGFqRmVYWFVZd2F6Q04zaUVickVtazAxZWdq?=
 =?utf-8?B?UEZSNGwzRTN6azAzaHRvV0twVUtCSjhpek8wdUk2LzdmcEZ2SUlHNGcvd0FS?=
 =?utf-8?B?U25zbnB5UGNZSFJZU2ZMYlJXaFM5Zjkxa2NmcTU1RmpNaGVibTBNT0lQQ0l1?=
 =?utf-8?B?RTR2enVYemx3b001WjlFbDYvZ09DVjBLVzlEeXgwNmllN1FoT3RrdytSbUtt?=
 =?utf-8?B?M01WZk9FSjdPa0JtNkJLdXlEVitkQlM2SHBxek51d25zd1lLOUx0ejg4Rzlw?=
 =?utf-8?B?K1dCUzEwcndtaTk2cUovQWQ5NmxsN0drRGk5UEVwTmhuV3hCclROSXBtdjAy?=
 =?utf-8?B?V2MxbjJTSHlKRkNYbU5iSTRhbXpKME9PRFdFb0F3ZmFFWGdvR1ZndGc2dytH?=
 =?utf-8?B?Mjl2SlFWMTYxQU1HWnhtbHVBMkNYKzdHdU1nMU5zb1dnQk5sd213UnpNL3Zw?=
 =?utf-8?B?SjJCWlFBM1FFM1pRSGxZQUFvVWQyN0t0ekxtOXJwWmJDUm5tdnp2OTBCOXhK?=
 =?utf-8?B?alJoUDVCVjRiTnV3TnNXQmxDVmpucFhRMTRKS1EvcGxtY1J6aWtOLzN2ZTlV?=
 =?utf-8?B?Y2tVbmxFeG1VUmY3RXZpQkF0SFV3TTExTnlOL2w1bE5qSWtWVzB5T0V1NzBo?=
 =?utf-8?B?NzNUZ3lCeU1oR2dQSDFwalh0WlJVanJqN3JGSlNxWWhvbnQyNjhkbEtyTml6?=
 =?utf-8?B?Y1dyeDRGbzRHK0pBWnQ1MkRudk9XQkhDRERuUlZDNkh5aHlYQ1orTnRnaEtI?=
 =?utf-8?B?T0FBd3dPYzZJdHE4emRBeGRXUEZLOGJ5SEcwaDlkS0NxdGRRckZGM3NNeG5S?=
 =?utf-8?B?dE83OFRBRDZZenU5QjgrS2VIWnJ5YzNYRlMycjNiQXhPYTJnL2pXeEtkYTMy?=
 =?utf-8?B?ZE5rcWhpeEg5T0o2VE1kTWx3bElnQnlIQmRhRy91dlZUV0tUYnZCRzF0K0F1?=
 =?utf-8?B?M1NqSGk5alR5cVlMRnMxQjlmcDU2MUx6UmZiNVlpSklDcENaZHkveTRndnNj?=
 =?utf-8?B?K2ovWG1EN3JMSHk4NzNuM3pGUVFxZHFWdHo4MGVNL2RQMSt3S1JIUlhaOWRE?=
 =?utf-8?B?TXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 001ff822-bf0d-43bc-bb1e-08dc167b4cdd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5664.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 10:10:00.9622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PPqfPNyBw98gJGxAvU4Xu2mC/aFOxRwOCqiJJEwvwjXq4r1LQs/5gy77u0/TyzHgSS/pgeybHhSzpDDUIQwDGnSB7s8fFezFxjIECYzm1nM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5813
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


On 1/11/2024 2:13 AM, Lucas De Marchi wrote:
> On Wed, Jan 10, 2024 at 01:12:03PM +0530, Sujaritha Sundaresan wrote:
>> Fix function naming and description for xe_vram_freq_sysfs_init
>> function.
>>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_vram_freq.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c 
>> b/drivers/gpu/drm/xe/xe_vram_freq.c
>> index 733146293307..838f582e5632 100644
>> --- a/drivers/gpu/drm/xe/xe_vram_freq.c
>> +++ b/drivers/gpu/drm/xe/xe_vram_freq.c
>> @@ -96,7 +96,7 @@ static void vram_freq_sysfs_fini(struct drm_device 
>> *drm, void *arg)
>> }
>>
>> /*
>
> should be /** to make this kernel-doc, too?
Sure will fix this.
>
>> - * xe_vram_freq_init - Initialize vram frequency component
>> + * xe_vram_freq_sysfs_init - Initialize vram frequency sysfs component
>>  * @tile: Xe Tile object
>>  *
>>  * It needs to be initialized after the main tile component is ready
>
> there's a trailing list after this comment that should be removed too.
>
> thanks
>
> Lucas De Marchi

What's the trailing list ? Didn't get this. Could you clarify this a bit ?

Thanks,

Suja

>> -- 
>> 2.25.1
>>
