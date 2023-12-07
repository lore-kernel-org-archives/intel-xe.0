Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413D7C10F05
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 13:04:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B40310E1CD;
	Thu,  7 Dec 2023 13:04:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A806F10E1CD
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 13:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701954259; x=1733490259;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=07+1XrvCyt9s+73U/rswOrd7ywdC1N3tidIaqyjPGps=;
 b=ZBpmULUmqXKFa1d6vwris6h+WvOOy9HVMsfp2R21XuwsipBt1UASlHGo
 W4qwZUQSlvixQIDUZByp/CGcLRzJ09RnkJDKcJYOcMJct3uIfZHLyfve+
 5j1dimVAUpPKx8PVQ9E63SXwfrjzyz2/JB+ltKhWF3Z5DpNbGBJK/PeQ5
 ztFMnDY0xIk4e01qqMWZdzMfmzXgzMH7p0J6Gfn3pZAuOjcgyw+DvCIMw
 LfY5gQ01cDCwERMjVh/COGHOaSeWRnUyrzZvZXDiVS3YZht9k47uZ+Lzw
 HrnuL3584yJTpokJIuPBV+29FIYx7oveszNyyqWu0imcDyPrAdfKcyM2B g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1296039"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1296039"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:04:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="889738324"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="889738324"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 05:04:17 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 05:04:17 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 05:04:17 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 05:04:17 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 05:04:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ezk47H//UWsUqhKzIDv8zaysgYOIVYRt3r6eNJbRBNmYYRpWtyIazk5A9VT09wX87r78rvIV1pHPGSDX8mrlfTcve4Ga0QXs8mte/GE4WIYwC6Tu7OqVCEz7Mn4lFMDb34XN5hRNimFAS6jC0hPogJHy00I9RMt1vOmbskHzAZjWxixs8bHsn/3c9wRcS75wKKSMbVa4UzpITojjMh5E6XZvwjIfg5PC1oT7luu0xZhdpH9ZsIdyZTGuykMOKa4mzz3sGpU/UYToweVbfEazswByCHLOyzVxhDfF7eGmgW77qdsIASpwUmP+KAQR4JlRSCOhl2mW3xVsoIHIxvd1qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gYTrI5GiP9owXXSd90J/AKbCX7ksVUDpHfyJsmm4vzQ=;
 b=AG00qgN106s6wsAZpSlft/rWa0xMWqUUO6iOyrmh4xwyLgoP44DbHyAm3jr+oErsA0IgZOjj3+Ca3+LPVIdWQ+N7yiBEEgq2Hkovl9KV5A3GSORibo95dAze50V8q5z3hVCpo3S+i7Vux6644/yqI3sHJROUiV6GhutQo6HiNYDNFTMaJKqBPI1FkgYoDeIEJJ5Ro2tFi7TKPnSdLu7cvm5hPWpNzMshcPBw6jK6QD1A59BcIUvWtJueyi3UZCFXkUr6pAG0mXOS+cM0TcmHQEdFDGqThH7AcsDdrkLWOt709aKlLgyvfD0/uQBwASGovFfYRDn4uXBkW0A9H65spg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 SA2PR11MB4875.namprd11.prod.outlook.com (2603:10b6:806:11a::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.27; Thu, 7 Dec 2023 13:04:14 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.7068.027; Thu, 7 Dec 2023
 13:04:14 +0000
Message-ID: <a2272c15-d97d-485d-920d-df04898701c6@intel.com>
Date: Thu, 7 Dec 2023 18:34:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-xe] [v2 1/2] drm/xe: Add a new memory directory under tile
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20231206044735.966213-1-sujaritha.sundaresan@intel.com>
 <20231206044735.966213-2-sujaritha.sundaresan@intel.com>
 <CY5PR11MB62113FC5A386520506F9912C9584A@CY5PR11MB6211.namprd11.prod.outlook.com>
 <d9e06457-ec98-46b4-9235-8e9b3b71ffa0@intel.com>
 <7b70c647-6fb6-46ed-98e0-8e898625b5a3@intel.com>
 <SJ1PR11MB62049D5B2C629111948A668E818BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <65cbe85b-30a2-470c-974f-ba811ec38b52@intel.com>
 <a4be4be8-700e-44b4-b0af-1d847774054a@intel.com>
 <d6d0fd1e-3c13-4992-8969-ea6533b7128a@intel.com>
 <38a32c29-fd64-4770-82cd-6e3660d14191@intel.com>
 <SJ1PR11MB62046759B76BE89DA0672809818BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <e1516fa5-951f-430a-8f7c-4ffb911c050e@intel.com>
Content-Language: en-US
In-Reply-To: <e1516fa5-951f-430a-8f7c-4ffb911c050e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0140.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::12) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|SA2PR11MB4875:EE_
X-MS-Office365-Filtering-Correlation-Id: db719d5b-3b0e-4c8e-7055-08dbf7250330
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kzRXt/5eeQS97hu6uZZRujHoxBuuWGNExraVaXHD0OSNRMk3cIxt5+irHKp+0fZDxDoeGrGI8vnP2PiVbz+3JjmqOiuIbGSQBG7dfJkm+fMr15K4jPjFh71c5giz4fMrRAfcvPMH3Jh7T5aComKKfZfxCnkxgSgjP5UYkoEPX4vgKHiezzU36AC1oFT3ZUf/3VllRQSrG4y9/ydcVGglJYA+8iuYjlZkxYXPZzTeS9NtXSbiak624446Pj6tHicj61jl1B/HMJmhoblCy+wtF0UvpOov8neoFcyy0N8TcsCzFMKvLmKGNzVecRaekdf4fUeTMotblMJ2aI3nDYNxwt1xaZi/Y64vdSKe+3S+KtrP0fSRrS31FgZnPbLr7LY4YN7NR9qx1chfjexBaAW6uF8q8qcMRE4FUQHCV3e2EZAz61xaI6c+nKMwLDjKSxJpxtgu0+w3UzyUhXKDa0f7Ul3NzSBdnYPvwe+idiVOK1y8v0jQSOU4Qu/WSuB19J3ZioX5CQ4p6QXGuA82xoDMNcL5U/TX6Vhy0B2LTxiEx9gl59zC3ZnBSUyrYiagTw0Lhxz/hpoUMg9tWBgbtIv8j4rzm03eIOEBbxpFzi/s7T8L0r/gUNiAogdt5SMrPCzv+reb9Gi5WpRcJa4tXfj3DSwpjpYPFlBeNkrzqRMQJJz7n3OXXwJwwj4KTZN8kyg7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(376002)(346002)(136003)(366004)(230922051799003)(230173577357003)(230273577357003)(1800799012)(451199024)(64100799003)(186009)(6666004)(53546011)(6506007)(83380400001)(8936002)(8676002)(26005)(6486002)(31686004)(2616005)(6512007)(107886003)(478600001)(38100700002)(110136005)(316002)(66946007)(66556008)(66476007)(86362001)(31696002)(41300700001)(36756003)(5660300002)(82960400001)(4326008)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djBtK3JiUE1Db0ROVUFRVXZiUGFnUkFET2xTcE93Z1NEamt5VnBvQ2FhZ08r?=
 =?utf-8?B?L0twYkR4RnZjdmp2blZnNkxUL2lKWnBidXB4amozVW4rOWRUaEV1WmNjaFl4?=
 =?utf-8?B?M2VkTExWWkJXZ1VsOWsydGRZR2s1VldzTnNZMm1MWDJzUzNhY004MXRMQ2w4?=
 =?utf-8?B?UzRHU3FGL2pmMWEvWEZjbkR3RmgxbWkwdjRWZXZtVnNIbXdxRkJqWDdRays4?=
 =?utf-8?B?TXJCWmE3YmkyQ01ORmlFVzhFTnhxeC9ma1luakNEV05tWWU3d29UN1YxTWVx?=
 =?utf-8?B?enNNelFiK1RaTWRNd0YxODN6N2hYaVBPRWlkRWRERURkdHFwRVZERWdMZnJI?=
 =?utf-8?B?dDBxekQrNEs1R2xSVi9XZUtBeTJuR1BFckJnbUR2dDRkbG5rejFPdXI3eEp4?=
 =?utf-8?B?MC9qVVA5bWU3VUlTTFZWSkZWVWttZDNEUWJpNEhmeUJ3aTRzeGN3WGdMUy95?=
 =?utf-8?B?VDFpVmFyNE5GZGRzNVNNeVdTdk9NM0JzekJwNXJEM3pCWXJYbENuMzhvRFFh?=
 =?utf-8?B?bG9uWmczZE10Yk5FY1Q4eEdsMmt3c203U1VCem5MQzdJWUJVTGRDekpVZnhT?=
 =?utf-8?B?ZTBPMm5MVFg1MWg3djdJMTV5bDZIV2RxRUlJY3E5UldGM0g3YlYzWkdKaXdZ?=
 =?utf-8?B?Q2ZqVTl1TlZqRk41UWxnQ0JtbTZBNjc5OWFYZHRXUko4bmFNbWxKNUtjYjR3?=
 =?utf-8?B?YnBhcy9QOVdSVk1QQ0xIRWk1TzFCdXFrM2NYY2lTaWhkV1I2UWtYdFh6VUR6?=
 =?utf-8?B?NFcycXdWTnZnVVRXeUQ2aDlYNDFKRWVWakhoNjNVek9mdTJXdHlXWXNvcjRD?=
 =?utf-8?B?TXNuQng4elFua1QzRmhXNENQUCtRVTE4dE81NGNVYXQrMkc2V3NaY1ZkZVBC?=
 =?utf-8?B?d1gzLzN1K1NBdDJJU0FlYUxMelVEamVRWnZ2VmdhbWJoTmhheTVGdjRXbGU2?=
 =?utf-8?B?Y3BCOVBWQUdrSU1nUTNnc0pQRDk2N2xJTWwwS3N5bG5taTdkOStpZXd3SGsw?=
 =?utf-8?B?RndoTEozd3lTemsySndudmJiNWtteFR3Mzg2VGd2YzhiNXUyVmJlUzFRK0NW?=
 =?utf-8?B?a0tNbC8yWFRCYWVYbXJRL3FXR1I3bDJZNGVZb3loMXZSQ1hUcnhIbHdKN1Jz?=
 =?utf-8?B?MWFaVGxpaGhxWWk3bkNGWW5ESHZmTkpOcVZ1VTROSjBCcWJWa3pPSyswc1VX?=
 =?utf-8?B?TXZ6Ymt4aDZQNXdxMlltODJUMFNUMXRjdDk0bDZlZHVQN1plVFNMRi8zN3R0?=
 =?utf-8?B?c3V4RUpwMXZYT3Nkd2UxQlVETC9vSWRnK2hDVXNlaGZVNlpBL1RaVDJvZ2F6?=
 =?utf-8?B?Ym4rY3NuVitGWUloZ3RKVTU1dzcvU1lrbzNENU5SWjY5VFlCOXJUVFRmaGx5?=
 =?utf-8?B?RTVlWFFyV3VKbGRWTG9pVjZrWWFDK1lJN0JJS1VBM2FNSVlLem91Z3MrVEQw?=
 =?utf-8?B?R0YweUdubDBsS2pnSWF4V3JZUjMwVlVaNDJveGxIeUdwS3cxK1Z5dnBENmg4?=
 =?utf-8?B?dTdydGNTSDQyNzR0eitYSnZoQ1NmdTdsUEMyZE9ZVWNuSU5QSWx3MWw2TDd5?=
 =?utf-8?B?NDF3VnkwZnlNamE3ZEpkRDNKQUFYSmhUMTFxMzcxblRGS3licjd3TWVCYmt0?=
 =?utf-8?B?aVRKL0gxcVdKcWx5ZlpMNE1HVnFaMGVuV3FYTTNkaWwwV0U2Q1g3c3hiZTgr?=
 =?utf-8?B?eGU0TjFnZDNxejk4ZGVEUnB6Tld4S3pmNnR0ZGRRaFlEUis4aVZWaCtxdTE0?=
 =?utf-8?B?VW9NT2ozL2g3blJvNmRKUnR1cTJEMW4vT1d3bURNNzY3V3Q0RjdnN0pURGlN?=
 =?utf-8?B?NC9yTXZJamNiWFpUOWdSQVV4cklheFh2OENtQWtodXUwWUIwa1dUd2tkZ1Mz?=
 =?utf-8?B?V2tMRGZmZXVmN1ZIK2dTUllvaGVrVzMyME1BYkVxdkl0dzlGYTl1d083UW9u?=
 =?utf-8?B?cXlPYXlodjZ0ODdlTGNiVXk0OStoSFN1eGR6LzJ2bVhyWVV1ck93aEpOL3pJ?=
 =?utf-8?B?NUVBRmVrcE9ja3BoeWx3b0UyNmZxVlpvN2l3RE5MS2ZCTHpFazhpWFlEVHk2?=
 =?utf-8?B?djlsS2RGMHpPN3MxZWFDR0ZtSDR3UW5mRFNzWGdQMldnWXVZUmx3RXdvQkVu?=
 =?utf-8?B?aGdSNFpIYVZVTXdzMVprZTRVeUxkWUJCLzZqRzF1WUgvM0IvNzFNS2tkNmFO?=
 =?utf-8?B?UlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db719d5b-3b0e-4c8e-7055-08dbf7250330
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 13:04:14.6019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MZUiX/mG424gtINEZKuNrFGYyUKB4nmBTaQhIgrDCCwFk+aTZGI+tR6H1yyhVXwjVadlOH/UK+Yn381oLQ3wjnfw4dVKw2DuqSQQLSX26wM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4875
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 12/7/2023 3:25 PM, Sundaresan, Sujaritha wrote:
>
> On 12/7/2023 2:00 PM, Upadhyay, Tejas wrote:
>>
>>> -----Original Message-----
>>> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>>> Sent: Thursday, December 7, 2023 12:58 PM
>>> To: Tauro, Riana <riana.tauro@intel.com>; Upadhyay, Tejas
>>> <tejas.upadhyay@intel.com>; Gupta, Anshuman
>>> <anshuman.gupta@intel.com>; intel-xe@lists.freedesktop.org
>>> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>>> Subject: Re: [Intel-xe] [v2 1/2] drm/xe: Add a new memory directory 
>>> under
>>> tile
>>>
>>>
>>> On 12/7/2023 12:08 PM, Sundaresan, Sujaritha wrote:
>>>> On 12/7/2023 11:36 AM, Riana Tauro wrote:
>>>>>
>>>>> On 12/7/2023 10:51 AM, Sundaresan, Sujaritha wrote:
>>>>>> On 12/7/2023 10:42 AM, Upadhyay, Tejas wrote:
>>>>>>>> -----Original Message-----
>>>>>>>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf
>>>>>>>> Of Sundaresan, Sujaritha
>>>>>>>> Sent: Wednesday, December 6, 2023 5:44 PM
>>>>>>>> To: Gupta, Anshuman <anshuman.gupta@intel.com>; intel-
>>>>>>>> xe@lists.freedesktop.org
>>>>>>>> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>>>>>>>> Subject: Re: [Intel-xe] [v2 1/2] drm/xe: Add a new memory
>>>>>>>> directory under tile
>>>>>>>>
>>>>>>>>
>>>>>>>> On 12/6/2023 5:38 PM, Sundaresan, Sujaritha wrote:
>>>>>>>>> On 12/6/2023 5:23 PM, Gupta, Anshuman wrote:
>>>>>>>>>>> -----Original Message-----
>>>>>>>>>>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On
>>>>>>>>>>> Behalf Of Sujaritha Sundaresan
>>>>>>>>>>> Sent: Wednesday, December 6, 2023 10:18 AM
>>>>>>>>>>> To: intel-xe@lists.freedesktop.org
>>>>>>>>>>> Cc: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>;
>>>>>>>>>>> Vivi, Rodrigo <rodrigo.vivi@intel.com>
>>>>>>>>>>> Subject: [Intel-xe] [v2 1/2] drm/xe: Add a new memory directory
>>>>>>>>>>> under tile
>>>>>>>>>>>
>>>>>>>>>>> Add a new memory directory under /device/tile<n> and move
>>>>>>>>>>> physical_vram_size attribute to the new directory.
>>>>>>>>>>>
>>>>>>>>>>> New hierarchy:
>>>>>>>>>>>
>>>>>>>>>>> /device/tile<n>/memory/physical_vram_size_bytes
>>>>>>>>>>>
>>>>>>>>>>> v2: Fix heading typo (Riana)
>>>>>>>>>>>        Fix cleanup error on unload/reload cycle
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Sujaritha Sundaresan
>>>>>>>>>>> <sujaritha.sundaresan@intel.com>
>>>>>>>>>>> ---
>>>>>>>>>>>     drivers/gpu/drm/xe/xe_tile_sysfs.c | 15 ++++++++++++---
>>>>>>>>>>>     1 file changed, 12 insertions(+), 3 deletions(-)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>>>>>>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>>>>>>> index 16376607c68f..e8ce4d9270e6 100644
>>>>>>>>>>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>>>>>>> @@ -24,7 +24,8 @@ static ssize_t
>>>>>>>>>>>     physical_vram_size_bytes_show(struct device *kdev, struct
>>>>>>>>>>> device_attribute *attr,
>>>>>>>>>>>                       char *buf)
>>>>>>>>>>>     {
>>>>>>>>>>> -    struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
>>>>>>>>>>> +    struct kobject *kobj = &kdev->kobj;
>>>>>>>>>>> +    struct xe_tile *tile = kobj_to_tile(kobj->parent);
>>>>>>>>>>>
>>>>>>>>>>>         return sysfs_emit(buf, "%llu\n",
>>>>>>>>>>> tile->mem.vram.actual_physical_size);
>>>>>>>>>>>     }
>>>>>>>>>>> @@ -38,7 +39,7 @@ static void tile_sysfs_fini(struct drm_device
>>>>>>>>>>> *drm, void
>>>>>>>>>>> *arg)  {
>>>>>>>>>>>         struct xe_tile *tile = arg;
>>>>>>>>>>>
>>>>>>>>>>> -    kobject_put(tile->sysfs);
>>>>>>>>>>> +    kobject_del(tile->sysfs);
>>>>>>>>>> Why kobekct_del instead of kobject_put?
>>>>>>>>>> Thanks,
>>>>>>>>>> Anshuman Gupta.
>>>>>>>>> Hi Anshuman,
>>>>>>>>>
>>>>>>>>> Basically when sanity checking, after reload we see that we are
>>>>>>>>> not doing a proper cleanup.
>>>>>>>>>
>>>>>>>>> kobject_put will only decrement the ref count and possibly free
>>>>>>>>> the kobject.
>>>>>>>>>
>>>>>>>>> But that is not happening in this case. There is a duplicate
>>>>>>>>> remaining of the tile directory.
>>>>>>>>>
>>>>>>>>> This required a clean unregister of the parent from sysfs hence
>>>>>>>>> the use of kobject_del.
>>>>>>>>>
>>>>>>>>> Thanks,
>>>>>>>>>
>>>>>>>>> Suja
>>>>>>>> As a continuation of the above response;
>>>>>>>>
>>>>>>>> I can probably add a kobject_put call as well to ensure that we
>>>>>>>> are cleaning up the memory side of
>>>>>>>>
>>>>>>>> things as well. Will add.
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>>
>>>>>>>> Suja
>>>>>>>>
>>>>>>>>>>>     }
>>>>>>>>>>>
>>>>>>>>>>>     void xe_tile_sysfs_init(struct xe_tile *tile) @@ -46,6 
>>>>>>>>>>> +47,7
>>>>>>>>>>> @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>>>>>>>>>>         struct xe_device *xe = tile_to_xe(tile);
>>>>>>>>>>>         struct device *dev = xe->drm.dev;
>>>>>>>>>>>         struct kobj_tile *kt;
>>>>>>>>>>> +    struct kobject *kobj;
>>>>>>>>>>>         int err;
>>>>>>>>>>>
>>>>>>>>>>>         kt = kzalloc(sizeof(*kt), GFP_KERNEL); @@ -64,8 +66,15
>>>>>>>>>>> @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>>>>>>>>>>
>>>>>>>>>>>         tile->sysfs = &kt->base;
>>>>>>>>>>>
>>>>>>>>>>> +    kobj = kobject_create_and_add("memory", tile->sysfs);
>>>>>>>>>>> +    if (!kobj) {
>>>>>>>>>>> +        kobject_put(kobj);
>>>>>>> Do you mean to put kobject_put(tile->sysfs) instead of
>>>>>>> kobject_put(kobj) ? as there was no Kobj created by the time you
>>>>>>> reached here!
>>>>>>>
>>>>>>> Tejas
>>>>>> Yup this should be fixed.
>>>>> Hi Suja
>>>>>
>>>>> Removing tile won't be right, as there are other directories (gt#)
>>>>> dependent on it. Simple return should be good with a warn?
>>>>>
>>>>> Thanks
>>>>> Riana
>>>> Sure. We can probably have the original cleanup in fini.
>> If you just give warn and return then you will never register 
>> tile_fini function and it will never be called on driver 
>> unload/reload. So either you remove tile using kobject_put() before 
>> return or don’t return and check kobj before creating files under it 
>> to avoid crash.
>>
>> Tejas
>
> Let me test out everything and see which approach will work the best.
>
> Thanks,
>
> Suja

After a round of debug with Tejas, was able to fix the cleanup cycle. 
Will send out v3 asap.

Thanks,

Suja

>
>>>>>> Thanks.
>>>>>>
>>>>>> Suja
>>>>>>
>>>>>>>>>>> + drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -
>>>>>>>>>>> ENOMEM);
>>>>>>>>>>> +        return;
>>>>>>>>>>> +    }
>>>>>>>>>>> +
>>>>>>>>>>>         if (IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
>>>>>>>>>>> -        sysfs_create_file(tile->sysfs, physical_memsize_attr))
>>>>>>>>>>> +        sysfs_create_file(kobj, physical_memsize_attr))
>>>>>>>>>>>             drm_warn(&xe->drm,
>>>>>>>>>>>                  "Sysfs creation to read addr_range per tile
>>>>>>>>>>> failed\n");
>>>>>>>>>>>
>>>>>>>>>>> -- 
>>>>>>>>>>> 2.25.1
>>> Hi all,
>>>
>>> So after all of this discussion, here's the final results after 
>>> testing the cleanup.
>>>
>>> Regardless of anything we do in the init function, it looks like 
>>> without having
>>> the
>>>
>>> two-step kobject_del and kobject_put cleanup in the sysfs_fini 
>>> function we
>>> will
>>>
>>> see an error on reload with the tile directory not being fully 
>>> cleaned up and
>>> reporting
>>>
>>> duplicate creation.
>>>
>>> The solution seems to be just to add a kobject_del before 
>>> kobject_put in the
>>> fini
>>>
>>> function.
>>>
>>> I am only having warnings and simple returns on the init side.
>>>
>>> If there can be a consensus about this from the reviewers, I can 
>>> float the next
>>> version
>>>
>>> accordingly.
>>>
>>> Thanks,
>>>
>>> Suja
