Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A1C8C46CA0
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 09:55:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C393510E197;
	Thu,  7 Dec 2023 09:55:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5465410E197
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 09:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701942944; x=1733478944;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=W2CvrzJ5dphC1qrzxFXwEdG3sRZnAaJ8HTBoVlHoJk0=;
 b=Hbdf45WmjafuIw2vE0oeKq634113wxUqv6CI+BpgwONsqLl8tbdegN0K
 nL+DbPwheBb9KdxuAlrGDJaLSD6WsOmgbVAq/669fX1vpSLbB0bnNPmRv
 6uS7GjFQLiWl+qMz9NWJZfsD7MkOTdaM+T8uJ68zS+JHrQg0CwSjAIvP4
 clD4A4s7L/QflmJ3BuB1+eFCqlEmR4yyUX2m3LHS63OCDN0EOYMderhRU
 wjAYlwzhGO2X9J6NzOX7Y0hmFzF361N8cKNEvSKg4RFutVMh+UfKjFEbb
 Xvs6SqAiUUIhASpeK+FoSAHcBjmKrIcdghBXuuIFcS3BPxyo1Tztd2Nii A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="458530047"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="458530047"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 01:55:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="765061527"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="765061527"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 01:55:43 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 01:55:43 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 01:55:43 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 01:55:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EPhWu7QQn1KC1kzO5QZwiVQtiw+ZQ153Q7lYcn3G2voYGBwClhzOAmE0hbejH4Qqkg2elpy7DOG3EJIEg0gzBBw/s+9nRwI/EkH2Dr59fddn/j0QCaP+WC38KjG+mAb5Jr8+POeuTDT4SfJrovpLWkFC/X5EpRsWV8BM+ndGqIc1JDl+LzzIN+SWhS12u73uMaNmp6AHA6rHZuL7M+UtsHwsfCr540bh7qY1Kt10pR4Nvl0gD65i3Kku2rm2Cw7SBsAWvQnvSI6WZGq8gHZscZDPfCVV0GH7zy29Usm2sL4lO0gk6T/fXQvOTALO7ILVGjzaSLwX79ZA0v7AC7R7GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lz9MH52n1Z64QG3l9aSZZYP6EeAj7uohlkO8g9DFJoY=;
 b=FzY31qUmzLK+wLXVq9483TBrYdCWM72wfQXcyOadb90axguCPvZ8CT9KEd/sLkZD6F0Mq3oeOAtJMSG9rsOJxI1mexLgWS1ho8Uq42HSvMjAKJrjsKUgwAJvhRb54+wbWUMofIWGJfDFjusEwaXlBCr/kG9S0gyBNMNcRU3sExaPNRqeqzEYkJN82njW9I1sixJOVBmdS5Cz3We5HDbQ6yZADGBaK9woO2Z5ig5WgKqEqXl8dKQ2hh7HE3t5K3KlCX6HQFnapjqyG1j71bz2v0K+kJpe+FgJDbFYXx/D3m3WxEuEhrjrnoFHiBA0fefMNdzFdQgRjyZpD54fm7huog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5664.namprd11.prod.outlook.com (2603:10b6:a03:37f::18)
 by PH0PR11MB5032.namprd11.prod.outlook.com (2603:10b6:510:3a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 09:55:40 +0000
Received: from SJ0PR11MB5664.namprd11.prod.outlook.com
 ([fe80::4cbd:d777:1e37:e6bc]) by SJ0PR11MB5664.namprd11.prod.outlook.com
 ([fe80::4cbd:d777:1e37:e6bc%4]) with mapi id 15.20.7068.025; Thu, 7 Dec 2023
 09:55:39 +0000
Message-ID: <e1516fa5-951f-430a-8f7c-4ffb911c050e@intel.com>
Date: Thu, 7 Dec 2023 15:25:32 +0530
User-Agent: Mozilla Thunderbird
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
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <SJ1PR11MB62046759B76BE89DA0672809818BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0190.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::15) To SJ0PR11MB5664.namprd11.prod.outlook.com
 (2603:10b6:a03:37f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5664:EE_|PH0PR11MB5032:EE_
X-MS-Office365-Filtering-Correlation-Id: 44079274-3b14-4dc8-a839-08dbf70aaaa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iWdrNq7Z4ABrYC0cgGx1atusvu43HFMWXz5nXFXka5DZ0EjaGktkcfd3OUgs+vu5pd/b5SQDSZAbSCyG8SQNZ+JXkeHc+Tu5mM3E2HgnHoz8tbG3a+UE6+FtkGMWlttDuMYn4lU7+4PwaVRhjczKssj+Z7rh3YM3vY6gnrMIRWc73H0D4TfzTj+poE+PicJdRGCHVUUb8h40gDpykVKeg1Y2+wnWa9YwG8J6m12S5LGt9g/4jqP2cH/fo9ryTYcSMDeVcyxMJq+HT0gRFoDzTfA3sx8OSwXiOhTymCo/7OmoejNZFoM7qceq7Tw8m0ni6LaxxVq5R8gPPMT/OFGRdhJAbC0Ptw/MGKXB0Wc/8J7fTIWaJG6j4P+tcG/ZjOe2olM5QPY24xvg9efcrFJGtHgjcJqsORHJh7hvSXdUpYOt17mhb7UjJvUxyNoBUxQPF8ImIgUBracbu5wmUD+rkG/FXcNNvZgpZaMBbtpewaZSNdeYbmtUoaS7D0lBrCWtHFP6NTtoquFo6zpCCG8P1NlvKuSgz1uCp6XrNOuutscgmm2uzBsH09iI6TtDIAnpBnZasktk7Z3ziC73U8Pf+/aHmmu1DVtOAOMvanOtnCc4vihJOyG6ydBjywi8CNH+oFaLKDijIz0r7gF1IzGfjNeYegJWFuIiDAS7w9kn23yi9edq5KrW9VXGDxEk/GkR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5664.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(376002)(396003)(39860400002)(230922051799003)(230273577357003)(230173577357003)(186009)(64100799003)(451199024)(1800799012)(31686004)(6666004)(6506007)(478600001)(82960400001)(38100700002)(6512007)(26005)(107886003)(83380400001)(2616005)(53546011)(5660300002)(8936002)(2906002)(8676002)(86362001)(4326008)(36756003)(41300700001)(31696002)(66946007)(66476007)(110136005)(316002)(66556008)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1J5T3VSK0ovTXordjJxaEZIZXpjd085UWF2cTZxSmEyNFlwbWQ4TWVQOFJL?=
 =?utf-8?B?SWFKM0pKdEwzS3kwMXkxQjJhL21qVUFsY01BUVhPUjNQdjN4MFpKeS9OOXpF?=
 =?utf-8?B?TFpzeDZJQkxlZmhsMWhnYVFablZ6cDAxS3N4MnE2NjY2Z0lrZFV5bzhGNE5M?=
 =?utf-8?B?N2wrRDFPR0ROenAxUjhUVWdUenJDenh3Vy9VWTRiWndoditIaU9qZXNDOERG?=
 =?utf-8?B?NHduQnIrOWYwY1lKY2VqTEFyN0F4S2JLb0tNbmt6eVVGSkZqZDVvREFjTFo1?=
 =?utf-8?B?RTI5NzhiV0RvcjlNSlF3MlBrNUk3OWIzSGtWcjVwb2xjQSt5M3BYd1hXbUtq?=
 =?utf-8?B?V2JlZFp0emY3Z013UlNkbUd2MWpnS3o2M3FUSEZQb3NSSHpUTzlmenNKVVdH?=
 =?utf-8?B?SXdTNnUyeGZQYTEyTnlwc2dISERDNlQ3NmN6M2VYSzUvUHN0L0FZQ0lNcmNv?=
 =?utf-8?B?TXlhUmZ3RjBsSXNxQ2hLWDgwR2c0aFEwNjdJY3lkNCtuWWpBejVuS244QW5N?=
 =?utf-8?B?MWt0bWxoLy8yU21rVFBHak12M0FHYkM4UkV3V256TmZrVWRzZXVKTmhkZFVM?=
 =?utf-8?B?MlRJWXpGeUVsajVRODVVbDF3RmJHZWFCTGJ1Mk5WdVZsNDM5aVUrcmZPTUJl?=
 =?utf-8?B?U0N1MUhwbzY4eTA4NTBZb2Y2eDdpNHRUMTNsNmpiSnY3ZmtLYSs1SnBkQ0Rz?=
 =?utf-8?B?cWFCS21HY0VvUVBodmhkaTk4aDJUZHRIVzhHUXdTVnBOTHJpMXVDbnVmRGk0?=
 =?utf-8?B?YmhxczdHL0RNaGpoRUd6RTErdk5PdlIzRW1aSVhUYWlFa1doNVVoYTIra2Zt?=
 =?utf-8?B?MkNLVmdMbWFPVlYvZ0oyVkFTRHc1WjJtc1ZKME5oQlA1ZTdXaENpWDdZZU0z?=
 =?utf-8?B?Q3h4QW1zSlk0SFpQMVVIYjEyTTY2WmFLeHVTdVJkQnBpZ0ZpMklrZmw0S2tQ?=
 =?utf-8?B?QWRQZFI5YjJ0YXpyallDSWI1d1FYdFA1UWpJQ1l0VU5NQ0ZUSFNwYjhDbUFk?=
 =?utf-8?B?VGpocUhFb2ZTcGxkaDBJdU1NT2xERGZIVUVUd2lvMGM3bkJVZ1hES2VmeDFG?=
 =?utf-8?B?V0E5Sk1Ud3FZTW5EVHA0WUNqNUVhQkxvZWptclg3TEVxdElHbEllK2xkNXdy?=
 =?utf-8?B?Q2MwWFk0dGpLd0p6ZVpiRFdqSXFNVXVvYjJtU2NtTUp5QXJWSUZ3WjZuWXFl?=
 =?utf-8?B?SHZJbWRCN2RnSVhCbEd0MS9EQXV0ZkJxdUZBcmZUTTRxc01xWU8rOHY2VDBm?=
 =?utf-8?B?M29PdDdBV3h6a2JZcW05MTNnY05mdWJDYzZQeXBqbUhOK0w5cEFsSVVjY3M0?=
 =?utf-8?B?NXlLZTFrRHdvQ0VRVmhNYXRCYXlNMEZIcG9zUGNuenFzSEFoU2QyNkZRTWxO?=
 =?utf-8?B?NFdGRzZ1M2FPT05XMDUxZWc2cURGQWJjMDhESWFPS2xPQWpkK1NDTlAzN3lw?=
 =?utf-8?B?MjRRcHVVeW9YdnBKM253cVVtV1BjVnJ5bk9YWWhmS2JtUkRPM2MxM25wbHlX?=
 =?utf-8?B?YjhqRmZJdnpMcVhZdi9QYkp0R2daTGFSOEZmd2FtSEpzR1NQQnYxcUpnRkpK?=
 =?utf-8?B?S2ZHdExZYXVmMG56eFRqZ0hIN2NUalhYRTlwS0duZTJra1Nza3VBMlhIeG1t?=
 =?utf-8?B?Zk81KzBtQnNWR2RkVVRGM3NnbEhaR2xMU3VTTjhNQW4rc3B6d0JNS2REZFk3?=
 =?utf-8?B?QmpmaDdGNmU0MUwxUGZrZUVUSkN6RVpXZnBqNU5uSk81YTBpT3JpLzkyMkRi?=
 =?utf-8?B?TzNDc3k1OW5yUldEak5zV2FJRUQwV0RRK2ZKc0QxajNyc3l6L05NWUpoSGdX?=
 =?utf-8?B?UlpjY1V5U2lmcmk2d2hSVGZTay8xVExrQmdBbEF2S0xIQ0g3KzN2WXA0S2U1?=
 =?utf-8?B?enk4QmFxeXhJR0pWMkJJN09KS0M2NHdkK0NVd2VzdU0rRzZzUTlxT1Zzb2t4?=
 =?utf-8?B?MlhiM3hSK1JaYVd1am13NlEzdDFHT2h2Q2pNQ1ozQ3dQTjJDdVlTT21HbURV?=
 =?utf-8?B?aC94UGQ2UFBOVTZVeFJUb1h1TFNYMWhhZElYK2VZV2Q3aXBIaHlhclhGc2ZG?=
 =?utf-8?B?VG92NWRPRXZlWHBJdWZYcFFBSVlHelJvN0lYUnVpdkdudzE3dlk2VWNwcFdG?=
 =?utf-8?B?cWRNOXQwdkpVVCtEWlpPTW54bGdaaVNGRTRMZ2pTNU95M01jYjNzMkRSQW5C?=
 =?utf-8?Q?QXGVlLYfMtjuwPqUVWfg2lg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44079274-3b14-4dc8-a839-08dbf70aaaa8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5664.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 09:55:39.1248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y4ZdhWQJXIJYZdAhlp1VcwlK2HFVNgCK8lVoS6a5MzbKh5QFCAbaykLLoGQAGcqsIiUiwRJPT/7RT4zkeZlWA8HvHyY70PZzr6Ygy/FrorE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5032
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


On 12/7/2023 2:00 PM, Upadhyay, Tejas wrote:
>
>> -----Original Message-----
>> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>> Sent: Thursday, December 7, 2023 12:58 PM
>> To: Tauro, Riana <riana.tauro@intel.com>; Upadhyay, Tejas
>> <tejas.upadhyay@intel.com>; Gupta, Anshuman
>> <anshuman.gupta@intel.com>; intel-xe@lists.freedesktop.org
>> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>> Subject: Re: [Intel-xe] [v2 1/2] drm/xe: Add a new memory directory under
>> tile
>>
>>
>> On 12/7/2023 12:08 PM, Sundaresan, Sujaritha wrote:
>>> On 12/7/2023 11:36 AM, Riana Tauro wrote:
>>>>
>>>> On 12/7/2023 10:51 AM, Sundaresan, Sujaritha wrote:
>>>>> On 12/7/2023 10:42 AM, Upadhyay, Tejas wrote:
>>>>>>> -----Original Message-----
>>>>>>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf
>>>>>>> Of Sundaresan, Sujaritha
>>>>>>> Sent: Wednesday, December 6, 2023 5:44 PM
>>>>>>> To: Gupta, Anshuman <anshuman.gupta@intel.com>; intel-
>>>>>>> xe@lists.freedesktop.org
>>>>>>> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>>>>>>> Subject: Re: [Intel-xe] [v2 1/2] drm/xe: Add a new memory
>>>>>>> directory under tile
>>>>>>>
>>>>>>>
>>>>>>> On 12/6/2023 5:38 PM, Sundaresan, Sujaritha wrote:
>>>>>>>> On 12/6/2023 5:23 PM, Gupta, Anshuman wrote:
>>>>>>>>>> -----Original Message-----
>>>>>>>>>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On
>>>>>>>>>> Behalf Of Sujaritha Sundaresan
>>>>>>>>>> Sent: Wednesday, December 6, 2023 10:18 AM
>>>>>>>>>> To: intel-xe@lists.freedesktop.org
>>>>>>>>>> Cc: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>;
>>>>>>>>>> Vivi, Rodrigo <rodrigo.vivi@intel.com>
>>>>>>>>>> Subject: [Intel-xe] [v2 1/2] drm/xe: Add a new memory directory
>>>>>>>>>> under tile
>>>>>>>>>>
>>>>>>>>>> Add a new memory directory under /device/tile<n> and move
>>>>>>>>>> physical_vram_size attribute to the new directory.
>>>>>>>>>>
>>>>>>>>>> New hierarchy:
>>>>>>>>>>
>>>>>>>>>> /device/tile<n>/memory/physical_vram_size_bytes
>>>>>>>>>>
>>>>>>>>>> v2: Fix heading typo (Riana)
>>>>>>>>>>        Fix cleanup error on unload/reload cycle
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Sujaritha Sundaresan
>>>>>>>>>> <sujaritha.sundaresan@intel.com>
>>>>>>>>>> ---
>>>>>>>>>>     drivers/gpu/drm/xe/xe_tile_sysfs.c | 15 ++++++++++++---
>>>>>>>>>>     1 file changed, 12 insertions(+), 3 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>>>>>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>>>>>> index 16376607c68f..e8ce4d9270e6 100644
>>>>>>>>>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>>>>>> @@ -24,7 +24,8 @@ static ssize_t
>>>>>>>>>>     physical_vram_size_bytes_show(struct device *kdev, struct
>>>>>>>>>> device_attribute *attr,
>>>>>>>>>>                       char *buf)
>>>>>>>>>>     {
>>>>>>>>>> -    struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
>>>>>>>>>> +    struct kobject *kobj = &kdev->kobj;
>>>>>>>>>> +    struct xe_tile *tile = kobj_to_tile(kobj->parent);
>>>>>>>>>>
>>>>>>>>>>         return sysfs_emit(buf, "%llu\n",
>>>>>>>>>> tile->mem.vram.actual_physical_size);
>>>>>>>>>>     }
>>>>>>>>>> @@ -38,7 +39,7 @@ static void tile_sysfs_fini(struct drm_device
>>>>>>>>>> *drm, void
>>>>>>>>>> *arg)  {
>>>>>>>>>>         struct xe_tile *tile = arg;
>>>>>>>>>>
>>>>>>>>>> -    kobject_put(tile->sysfs);
>>>>>>>>>> +    kobject_del(tile->sysfs);
>>>>>>>>> Why kobekct_del instead of kobject_put?
>>>>>>>>> Thanks,
>>>>>>>>> Anshuman Gupta.
>>>>>>>> Hi Anshuman,
>>>>>>>>
>>>>>>>> Basically when sanity checking, after reload we see that we are
>>>>>>>> not doing a proper cleanup.
>>>>>>>>
>>>>>>>> kobject_put will only decrement the ref count and possibly free
>>>>>>>> the kobject.
>>>>>>>>
>>>>>>>> But that is not happening in this case. There is a duplicate
>>>>>>>> remaining of the tile directory.
>>>>>>>>
>>>>>>>> This required a clean unregister of the parent from sysfs hence
>>>>>>>> the use of kobject_del.
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>>
>>>>>>>> Suja
>>>>>>> As a continuation of the above response;
>>>>>>>
>>>>>>> I can probably add a kobject_put call as well to ensure that we
>>>>>>> are cleaning up the memory side of
>>>>>>>
>>>>>>> things as well. Will add.
>>>>>>>
>>>>>>> Thanks,
>>>>>>>
>>>>>>> Suja
>>>>>>>
>>>>>>>>>>     }
>>>>>>>>>>
>>>>>>>>>>     void xe_tile_sysfs_init(struct xe_tile *tile) @@ -46,6 +47,7
>>>>>>>>>> @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>>>>>>>>>         struct xe_device *xe = tile_to_xe(tile);
>>>>>>>>>>         struct device *dev = xe->drm.dev;
>>>>>>>>>>         struct kobj_tile *kt;
>>>>>>>>>> +    struct kobject *kobj;
>>>>>>>>>>         int err;
>>>>>>>>>>
>>>>>>>>>>         kt = kzalloc(sizeof(*kt), GFP_KERNEL); @@ -64,8 +66,15
>>>>>>>>>> @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>>>>>>>>>
>>>>>>>>>>         tile->sysfs = &kt->base;
>>>>>>>>>>
>>>>>>>>>> +    kobj = kobject_create_and_add("memory", tile->sysfs);
>>>>>>>>>> +    if (!kobj) {
>>>>>>>>>> +        kobject_put(kobj);
>>>>>> Do you mean to put kobject_put(tile->sysfs) instead of
>>>>>> kobject_put(kobj) ? as there was no Kobj created by the time you
>>>>>> reached here!
>>>>>>
>>>>>> Tejas
>>>>> Yup this should be fixed.
>>>> Hi Suja
>>>>
>>>> Removing tile won't be right, as there are other directories (gt#)
>>>> dependent on it. Simple return should be good with a warn?
>>>>
>>>> Thanks
>>>> Riana
>>> Sure. We can probably have the original cleanup in fini.
> If you just give warn and return then you will never register tile_fini function and it will never be called on driver unload/reload. So either you remove tile using kobject_put() before return or don’t return and check kobj before creating files under it to avoid crash.
>
> Tejas

Let me test out everything and see which approach will work the best.

Thanks,

Suja

>   
>>>>> Thanks.
>>>>>
>>>>> Suja
>>>>>
>>>>>>>>>> + drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -
>>>>>>>>>> ENOMEM);
>>>>>>>>>> +        return;
>>>>>>>>>> +    }
>>>>>>>>>> +
>>>>>>>>>>         if (IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
>>>>>>>>>> -        sysfs_create_file(tile->sysfs, physical_memsize_attr))
>>>>>>>>>> +        sysfs_create_file(kobj, physical_memsize_attr))
>>>>>>>>>>             drm_warn(&xe->drm,
>>>>>>>>>>                  "Sysfs creation to read addr_range per tile
>>>>>>>>>> failed\n");
>>>>>>>>>>
>>>>>>>>>> --
>>>>>>>>>> 2.25.1
>> Hi all,
>>
>> So after all of this discussion, here's the final results after testing the cleanup.
>>
>> Regardless of anything we do in the init function, it looks like without having
>> the
>>
>> two-step kobject_del and kobject_put cleanup in the sysfs_fini function we
>> will
>>
>> see an error on reload with the tile directory not being fully cleaned up and
>> reporting
>>
>> duplicate creation.
>>
>> The solution seems to be just to add a kobject_del before kobject_put in the
>> fini
>>
>> function.
>>
>> I am only having warnings and simple returns on the init side.
>>
>> If there can be a consensus about this from the reviewers, I can float the next
>> version
>>
>> accordingly.
>>
>> Thanks,
>>
>> Suja
