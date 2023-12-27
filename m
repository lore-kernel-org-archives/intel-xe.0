Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA297C46CD2
	for <intel-xe@archiver.kernel.org>; Wed, 27 Dec 2023 09:31:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E557310E11E;
	Wed, 27 Dec 2023 09:31:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B522C10E11E
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Dec 2023 09:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703669489; x=1735205489;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mJOu6tbOinnVJNYO/vu+xF7RLzDaM0YDpOWfTWNN1w8=;
 b=ZYzGp6t8MUd7CxAK6gxyAw2mTjHDGu2YfSXw/qMBx4upbFsesahqNMRE
 nW1wVSBA4chQk27ooulaFYGgtSvj1tXux5Qf+kGJAlRzSKEDBeeqaoSzq
 9o7W4CjVxAD6VC8rR7j4v021TmfoDUfjq9wr0d3Lib5druW5c66a00K1D
 fV5tOITxJ67kUuRGxVK9ytfz+5N66i7JcOCXiJWDaAnsJu9ommD1hoZo5
 DCq48FJUCgFE72gnSNyFfd1SDoy1HHoy2A+aQhNlbAWmf5PEmqph1eIVw
 mz2WPmRTdm1HZcQ5yF5RRBLmTwvZh4nRVA+8yLVDlwBDt1obBD0wQRVui w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="396157730"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="396157730"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 01:31:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="1025353408"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="1025353408"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Dec 2023 01:31:29 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 01:31:28 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 01:31:28 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Dec 2023 01:31:28 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Dec 2023 01:31:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hkzzzq7Jj89p82mV9emZf1gKVx528lVaRqFaWrxNJEgrl/RnwU0GMlruTnQy0DzIZpJo2/I92SHqrb/H+Z/W/6c/aoo9i1V30l3Y549rkeVUefMssib3nUBSrttilPwZdRuq8dNVa0y7eBujUWjsm2c4JwLiSdV0GmLONntaYhRRb/EaILd4Onc/CjBHcg3Y+V5u7rVCluj4RZusy778qBVMqc5Hr9wnrmKH9qCvso1eDEJ2D6kJ2fMg/BUEPr9zNXS5VfWTkqWBAOX5LjSRs9XT+It6LSkaskbkON8JDohcmsWv8zQG37JrAdG9E5EbssIgqDQTbRDZ2zl6QWt6JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BG6hu6ySr7AF2U08XgFJFkFMNZqnI1IorC3/nRUEnJA=;
 b=XILvQhdHT+35g9a607wHI9wfeksyGrSL/NlAmVzah2+pi4TiVUSnNYuU4SLS5dkD2p8arOTvVluJMFjitkY5OU6O5mFgq+yVqTGrDHRmZMvd9lGDXedzcifl+Zr6m7Rq895LsCElkTHEQrLskJML2ztWkgARw0FpSX90+podzpthvahPyenL6leD/WgS+qa6a3MCr3VKt1CB5IjsvwpgQs6x/3cqUiHiEYtnVSuHj9pJPxggD1KQjVdwjDE99gGNIOcI7Nw4df11t6SW9kjitow400RekWNvWVvU5n2cb3o1r3pX9iXQkY4jdsztH0uf0MaHbXgxpKPYSbaHjhfyMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5664.namprd11.prod.outlook.com (2603:10b6:a03:37f::18)
 by SN7PR11MB6602.namprd11.prod.outlook.com (2603:10b6:806:272::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.26; Wed, 27 Dec
 2023 09:31:25 +0000
Received: from SJ0PR11MB5664.namprd11.prod.outlook.com
 ([fe80::4cbd:d777:1e37:e6bc]) by SJ0PR11MB5664.namprd11.prod.outlook.com
 ([fe80::4cbd:d777:1e37:e6bc%4]) with mapi id 15.20.7113.027; Wed, 27 Dec 2023
 09:31:25 +0000
Message-ID: <9c0e0cda-5768-4c0a-973e-74ecfdf2ce8b@intel.com>
Date: Wed, 27 Dec 2023 15:01:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v6] drm/xe: Add vram frequency sysfs attributes
Content-Language: en-US
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20231222110631.999517-1-sujaritha.sundaresan@intel.com>
 <CY5PR11MB6211B2AC3B3E3B1A926252219594A@CY5PR11MB6211.namprd11.prod.outlook.com>
 <369acab0-b07e-48d3-ad90-c28969e8957e@intel.com>
 <CY5PR11MB62110361C1C67AD8ABA5AA259598A@CY5PR11MB6211.namprd11.prod.outlook.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <CY5PR11MB62110361C1C67AD8ABA5AA259598A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0134.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::22) To SJ0PR11MB5664.namprd11.prod.outlook.com
 (2603:10b6:a03:37f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5664:EE_|SN7PR11MB6602:EE_
X-MS-Office365-Filtering-Correlation-Id: 907f48f5-d7e6-4b1c-1c68-08dc06be983e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lg8uzA3zhFIxppSD38IrTK7AEjkabbk3L2TEE/kCqOcIr+pN0NFSG9t3XZ2NQ63gte9Nzrnl9pcRuj+cUtaSsID1c7F3HTvw89CUk1x17U69z9lce8JR0PQlFqMCCCn23m2bKUh1sZxeEJ/SL0Wq6GbgNpYkMo8ofKs/e8Av1RS+pwXrP1bQxLu4cSGkJiP40TIOqdvKed+vkUT4k+PxJhJqAmO+W/NWB2Q5D5A643RzRc6M4LjrbF1WAk6WfDYHagj+PnAd6n6jtYPh9yPmtls7hYwWC/rCFZXzO6UK2MJPusnEFInYoefRMWJZH5ERcQtU8CwbGLGgSq9VGzSX5scSdC72Xc9XJjxXxk71eZ6KIsmlHhzpZ8a7Fgr4hLtZqTAudHsreINQNPsbU3lRIOfWtgmcNkcF6aEsRaCv5muCBd4a8ucjf2gp5wwz8//60YIhhaCX3gCsY9VMu3MBCUo3NI1586EKCyhvaG5Qy93QXOfF9I3dFS3rCdzYDPOUMJdQJUNGECGHYK5+30VtjURuUSsOf/kqb706PtvkaOOc0+g7bjamzNzBt5VmgsQ6VCUEgmxSG6llE7A87+YKqGgj5zkncw+Wt3APC1y8EtlzOFR15zW3Nu2JoKWAZ9ivpP6Ojaqb488HaPeBlBn2Wg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5664.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(366004)(136003)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(8676002)(8936002)(4326008)(66946007)(66556008)(66476007)(316002)(83380400001)(6666004)(53546011)(6506007)(2616005)(26005)(478600001)(6512007)(5660300002)(107886003)(110136005)(31686004)(6486002)(82960400001)(2906002)(86362001)(31696002)(41300700001)(38100700002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEFPZ2ZLRldJbXk0aXp5K05KNmVndnRqUmVCdzR6QldQWW9ickR2Q25NYlRn?=
 =?utf-8?B?dmFrczZOanZaUC9RYWtiNDYxUklEMnNMUzZiRHpNWkFERkw0V1VMaGp6eEVl?=
 =?utf-8?B?ekZ6dHo2SkJoMDRIRGFWMFB1Z3MwMWtZSUtYdkNKaHltZENzWkh0NjRUbHJI?=
 =?utf-8?B?aHN3Ry8xaUNmNFV5SWQ5Lzg2eVZsYWFBNmxhTlN0ZHBxU1JSZC9STVlYWnlh?=
 =?utf-8?B?MWNCV2VhR2hnd0s1ZDlPL3dSd0NYeHRBR0ppUjUrQlJHMStSQStoR214eXVa?=
 =?utf-8?B?TlNvMUdscml6NW1saUkvZjdla3FTYVg3aWpEUGhsbFA1UTFmMEpXSWx3bWht?=
 =?utf-8?B?WDF6ZjN5djgzTEgrL3o1aEZZZEU1aytiR3FGY2IvTmFZVEtFdTNJcm5nNkdE?=
 =?utf-8?B?Y3I5Ymhwc3k1b0ZnM2RVaVhMcC9TNFNaVndYbHByQ0IvODFSQmJEbVVyZEhy?=
 =?utf-8?B?UnVJcmNwTmdSeUhDWnNwbjhWbmpGUWlDRGZIMWg4SGd6eWdOM2VrNmd4eU1M?=
 =?utf-8?B?WUVMT0pLV1VnQk9zd1FrNjhhTllFY1YxUzB2Sng4SDlidlIyM0NEeUpMc2I3?=
 =?utf-8?B?eUtieEJZTTdXYzF6b21KK2w5Qk04ZVlPa29wUWJzRmFhTkd2Q3d4LzNzVHl2?=
 =?utf-8?B?WDdyWWJkanFtVW9JNG1ocmFhZGdMNVZqeHFjZGowdkVoa3M0Uk1xWStOcytE?=
 =?utf-8?B?UjJXUFBZSWpPRjd0bU03WnRMa0FESEFCOWVjVENONm9aeHcrdGozVUw2bS9i?=
 =?utf-8?B?RGREZGs5ZVV6VGdmYTRZSGVFVmc4K0ovMmQyNjRPMTlBMFRJdTh5bWJYR0Y3?=
 =?utf-8?B?U1FuY0tiZGoxeEhScnhhK0t0a1NzK3NDZS9NUHNUVHNXU0pSdStPSEx3UDZk?=
 =?utf-8?B?M08wSW1MblkyenpEemU5ZFNSbmxTNVFXcDc1N1laTW1ZbllqMHdpa2JCNEUw?=
 =?utf-8?B?NURVTDBEbDZvTnpoRTRwSm5YNkRFeDdSbWd4dEUyU3JyZGkwN0NOMjdKeDdl?=
 =?utf-8?B?OUU1TTVOUXVCMW5GM2hOb3J2WHFxQlpTTE1xT2hnd2xRd01oQW5jNzQvbzh5?=
 =?utf-8?B?U2VoUEN1cXFBYnBRT3VmMlMyUzZENUkrVk0zNVNVZHpZMlBXakxySWpJUHdZ?=
 =?utf-8?B?WnFJeVJvbEprSlJydGxRSnhRUXVIdnZTYlVHT1RiYUFRemFNVFBUWk9CaEJk?=
 =?utf-8?B?N3hybHRLKzFPUWM0aWV3V3QvRHBqazhUVWU5UHNoUUhXRVR3ajNXT2VtWVYr?=
 =?utf-8?B?dXpHK3M3bTZlbmk5emJGZ0dsZXhJcEVzQUhFN3RuKzBvekJEM2E1SjJjenNI?=
 =?utf-8?B?THVDT2p2NGZxQmIwbDdiMlkyNW9KcGxtRWNycWFnNWY2d3pCTlE5MXJhVW9G?=
 =?utf-8?B?L29hSjUrNjRHOGZHRURKa2V2OHlDWDJwdUVWOHFYQnBFdmd3cUt2d3FpYXk5?=
 =?utf-8?B?THovOW4vclA4NU1zaU1pQ3lRMDNtK29zRjh5TFhoZG5hWXBxa1cvZVlaWXpJ?=
 =?utf-8?B?ME5veC84QkVwb0tkQXFWaHp5MTQrOUhvaDZmSHgwVjBDSlh0TDFOMzVkRDhW?=
 =?utf-8?B?ZGNLZDJxZ0s3VEwxNmIvZmFRNjBCYkhMdzNkNUVVanZKWEY2WXF2b2k4KytZ?=
 =?utf-8?B?SHNMUjc2RWJXUlJ5ZXpNNXhpWi9IamNRVTR5L1pUVngzOVRVSUlnYnBuaTdG?=
 =?utf-8?B?alkvS0RWZERLSEIxYTUvdThjSkVwdi8xWlZpNkdIY0E0T3lkREIyNmE3N0lQ?=
 =?utf-8?B?WExhbmhnVWFqb0xmaWlraWp3NXRsWVMvaDh3VC9NZkdqazFYR2oxUVhqTHZD?=
 =?utf-8?B?ajNyYXh4eExFSzZ0aDJTNk5TcnppTzRNaldaS2xmS1ZqSTRKTDJ1dTVMbVZs?=
 =?utf-8?B?RGxXMy9lRXJ4Uk9obkordGpXblYvRFMxOEROKzBBYmIxN1dkWU9uZnlXU2dp?=
 =?utf-8?B?K3BPWHpPVnBiUWEvOUUvenVJQXBaOWlIeGpyVllMYVBqMDlnVzBsOVlwcWVu?=
 =?utf-8?B?N1oyR1p0UldnaWdGai9JTllvTmprWWU0TnlJdm5jamlKenJHelBjb0FTRFdU?=
 =?utf-8?B?d0FWU1QzS2tFL3pVcUFpNnduTlVodCs5Z1RQZmZ5SFpQYnd0VVNRUnFmWktq?=
 =?utf-8?B?VjZ1M2x2Q3NhQzFSMUNKSGI3L3dNRHBGdVFQNkZvLytTMTNsU3RvNnFOd1kv?=
 =?utf-8?B?Vnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 907f48f5-d7e6-4b1c-1c68-08dc06be983e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5664.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2023 09:31:25.1065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Iarf+CKrJb5nSPSUEoc1keOzt+ULUsE+4nq9+oy9EGQm5P/ilAaFOsPhhNk3YhpZG8Igco2ItgJF1fVOnaL6+YwxAVJyxcvUsGOVa8/nwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6602
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


On 12/26/2023 7:58 PM, Gupta, Anshuman wrote:
>
>> -----Original Message-----
>> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>> Sent: Tuesday, December 26, 2023 10:02 AM
>> To: Gupta, Anshuman <anshuman.gupta@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>> Subject: Re: [v6] drm/xe: Add vram frequency sysfs attributes
>>
>>
>> On 12/22/2023 7:34 PM, Gupta, Anshuman wrote:
>>>> -----Original Message-----
>>>> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>>>> Sent: Friday, December 22, 2023 4:37 PM
>>>> To: intel-xe@lists.freedesktop.org
>>>> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Gupta, Anshuman
>>>> <anshuman.gupta@intel.com>; Sundaresan, Sujaritha
>>>> <sujaritha.sundaresan@intel.com>
>>>> Subject: [v6] drm/xe: Add vram frequency sysfs attributes
>>>>
>>>> Add vram frequency sysfs attributes under the below hierarchy;
>>>>
>>>> /device/tile#/memory/freq0
>>>> 			|-max_freq
>>>> 			|-min_freq
>>>>
>>>> v2: Drop "vram" from attribute names (Rodrigo)
>>>>
>>>> v3: Add documentation for new sysfs (Riana)
>>>>       Drop prefix from XEHP_PCODE_FREQUENCY_CONFIG (Riana)
>>>>
>>>> v4: Create sysfs under tile#/freq0 after removal of
>>>>       physical_memsize attrbute
>>>>
>>>> v5: Revert back to creating sysfs under tile#/memory/freq0
>>>>       Remove definition of GT_FREQUENCY_MULTIPLIER (Rodrigo)
>>>>
>>>> v6: Rename attributes to max/min_freq (Anshuman)
>>>>       Fix review comments (Rodrigo)
>>>>
>>>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_pcode_api.h  |  7 +++
>>>> drivers/gpu/drm/xe/xe_tile_sysfs.c | 86
>>>> ++++++++++++++++++++++++++++++
>>>>    2 files changed, 93 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h
>>>> b/drivers/gpu/drm/xe/xe_pcode_api.h
>>>> index 5935cfe30204..f153ce96f69a 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>>>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>>>> @@ -42,6 +42,13 @@
>>>>    #define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed
>>>> point format */
>>>>    #define	    POWER_SETUP_I1_DATA_MASK
>>>> 	REG_GENMASK(15, 0)
>>>>
>>>> +#define   PCODE_FREQUENCY_CONFIG		0x6e
>>>> +/* Frequency Config Sub Commands (param1) */
>>>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
>>>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN	0x1
>>>> +/* Domain IDs (param2) */
>>>> +#define     PCODE_MBOX_DOMAIN_HBM		0x2
>>>> +
>>>>    struct pcode_err_decode {
>>>>    	int errno;
>>>>    	const char *str;
>>>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>> index 0f8d3e7fce46..cdc9dbbc97b0 100644
>>>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>> @@ -7,9 +7,21 @@
>>>>    #include <linux/sysfs.h>
>>>>    #include <drm/drm_managed.h>
>>>>
>>>> +#include "xe_gt_types.h"
>>>> +#include "xe_pcode.h"
>>>> +#include "xe_pcode_api.h"
>>>>    #include "xe_tile.h"
>>>>    #include "xe_tile_sysfs.h"
>>>>
>>>> +/**
>>>> + * DOC: Xe Tile sysfs
>>>> + *
>>>> + * Provides sysfs entries for frequency in tile
>>>> + *
>>>> + * device/tile#/memory/freq0/max_freq - Maximum Frequency, not a
>>>> configuration and read-only.
>>> Let's increase verbosity of doc something explaining it is a fixed fuse point not a
>> configuration.
>> Sure
>>>> + * device/tile#/memory/freq0/min_freq - Minimum Frequency, not a
>>>> configuration and read-only.
>>>> + */
>>>> +
>>>>    static void xe_tile_sysfs_kobj_release(struct kobject *kobj)  {
>>>>    	kfree(kobj);
>>>> @@ -20,6 +32,65 @@ static const struct kobj_type
>>>> xe_tile_sysfs_kobj_type = {
>>>>    	.sysfs_ops = &kobj_sysfs_ops,
>>>>    };
>>>>
>>>> +static ssize_t max_freq_show(struct device *kdev, struct
>>>> +device_attribute
>>>> *attr,
>>>> +			     char *buf)
>>>> +{
>>>> +	struct kobject *kobj = &kdev->kobj;
>>>> +	struct xe_tile *tile = kobj_to_tile(kobj->parent);
>>>> +	struct xe_gt *gt = tile->primary_gt;
>>>> +	u32 val, mbox;
>>>> +	int err;
>>>> +
>>>> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND,
>>>> PCODE_FREQUENCY_CONFIG)
>>>> +		| REG_FIELD_PREP(PCODE_MB_PARAM1,
>>>> PCODE_MBOX_FC_SC_READ_FUSED_P0)
>>>> +		| REG_FIELD_PREP(PCODE_MB_PARAM2,
>>>> PCODE_MBOX_DOMAIN_HBM);
>>>> +
>>>> +	err = xe_pcode_read(gt, mbox, &val, NULL);
>>>> +	if (err)
>>>> +		return err;
>>>> +
>>>> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
>>>> +	val *= 50;
>>>> +
>>>> +	return sysfs_emit(buf, "%u\n", val); } static
>>>> +DEVICE_ATTR_RO(max_freq);
>>>> +
>>>> +static ssize_t min_freq_show(struct device *kdev, struct
>>>> +device_attribute
>>>> *attr,
>>>> +			     char *buf)
>>>> +{
>>>> +	struct kobject *kobj = &kdev->kobj;
>>>> +	struct xe_tile *tile = kobj_to_tile(kobj->parent);
>>> If you are missing to create a kobject for freq0 , then this should be
>>> kobj->parent->parent.
>> I don't think a kobject is needed for freq0, since it we are only using
>> attribute_group for it.
>>
>> Similar to throttle_reasons.
> Sure,  thanks for explanation.
>>>> +	struct xe_gt *gt = tile->primary_gt;
>>>> +	u32 val, mbox;
>>>> +	int err;
>>>> +
>>>> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND,
>>>> PCODE_FREQUENCY_CONFIG)
>>>> +		| REG_FIELD_PREP(PCODE_MB_PARAM1,
>>>> PCODE_MBOX_FC_SC_READ_FUSED_PN)
>>>> +		| REG_FIELD_PREP(PCODE_MB_PARAM2,
>>>> PCODE_MBOX_DOMAIN_HBM);
>>>> +
>>>> +	err = xe_pcode_read(gt, mbox, &val, NULL);
>>>> +	if (err)
>>>> +		return err;
>>>> +
>>>> +	/* data_out - Fused Pn for domain ID in units of 50 MHz */
>>>> +	val *= 50;
>>>> +
>>>> +	return sysfs_emit(buf, "%u\n", val); } static
>>>> +DEVICE_ATTR_RO(min_freq);
>>>> +
>>>> +static struct attribute *freq_attrs[] = {
>>>> +	&dev_attr_max_freq.attr,
>>>> +	&dev_attr_min_freq.attr,
>>>> +	NULL
>>>> +};
>>>> +
>>>> +static const struct attribute_group freq_group_attrs = {
>>>> +	.name = "freq0",
>>>> +	.attrs = freq_attrs,
>>>> +};
>>>> +
>>>>    static void tile_sysfs_fini(struct drm_device *drm, void *arg)  {
>>>>    	struct xe_tile *tile = arg;
>>>> @@ -32,6 +103,7 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>>>    	struct xe_device *xe = tile_to_xe(tile);
>>>>    	struct device *dev = xe->drm.dev;
>>>>    	struct kobj_tile *kt;
>>>> +	struct kobject *kobj;
>>>>    	int err;
>>>>
>>>>    	kt = kzalloc(sizeof(*kt), GFP_KERNEL); @@ -50,6 +122,20 @@ void
>>>> xe_tile_sysfs_init(struct xe_tile *tile)
>>>>
>>>>    	tile->sysfs = &kt->base;
>>>>
>>>> +	if (xe->info.platform == XE_PVC) {
>>>> +		kobj = kobject_create_and_add("memory", tile->sysfs);
>>> How freq0 is getting added, I am unable to see the freq0 kobject as per the path
>> "device/tile#/memory/freq0/"
>> freq0 is being added as an attribute group. It is similar to the throttle_reasons
>> implementation.
>>>> +		if (!kobj)
>>>> +			drm_warn(&xe->drm, "failed to add memory
>>>> directory, err: %d\n", -ENOMEM);
>>>> +	}
>>>> +
>>>> +	if (kobj && xe->info.platform == XE_PVC) {
>>>> +		err = sysfs_create_group(kobj, &freq_group_attrs);
>>>> +		if (err) {
>>>> +			drm_warn(&xe->drm, "failed to register vram freq
>>>> sysfs, err: %d\n", err);
>>>> +			return;
>>>> +		}
>>>> +	}
>>> Don't we need sysfs cleanup and kobject_put in tile_sysfs_fini() ?
>>> Have you made sure kmemleak won't complain here on memory leak ?
> Check the kobject_release() , this will only get call , when all ref count of that kobj is being put.
> Here you are creating a object and it will never be released.
> Also  we need to call  the sysfs_remove_group() as well in fini function ?
>
> Thanks,
> Anshuman.

This is a bit of unique case. In this file we have two issues that keeps 
us from cleaning up like others.

One, we need to cleanup the base tile directory here. And second, we are 
creating the kobject only for PVC. If we add the "memory" kobject 
cleanup to fini, we will be defining tile using kobj. This is causing an 
error on unload, despite adding platform conditions on fini.

After testing multiple iterations of the fini function, this was the 
cleanest way with no errors that worked across platforms.

If needed, the only way to accommodate the kobject_put(kobj)  and the 
sysfs_remove_group is to move the vram sysfs creation to a separate 
file, similar to throttle_reasons and gt_freq.

Thanks,

Suja

>
>>> Thanks,
>>> Anshuman Gupta.
>> I have already checked for mem leaks during the cleanup. The kobject_put is not
>> needed.
>>
>> Thanks,
>>
>> Suja
>>
>>>> +
>>>>    	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
>>>>    	if (err)
>>>>    		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed,
>>>> err: %d\n",
>>>> --
>>>> 2.25.1
