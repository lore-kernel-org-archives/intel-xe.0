Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086DEC7EE24
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jun 2023 15:01:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C471D10E2B6;
	Mon,  5 Jun 2023 15:01:04 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562BE10E2B6
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jun 2023 15:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685977262; x=1717513262;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VdXOQ98xgGKJBXnbfJGbpoOejrqO4R4chNKD+JEsDPA=;
 b=h1TPQJ6Xw1GEv1jhAXLv6/dtZ38ZevN64lTIXyvgicbQW9kRt4noX9/l
 fpeqfiB4Cysr3wQcdXEBEWZCvJUT72F8Qy+vhHq94rcfNBOJqxcry9BMz
 JeluOpao5YTd7EAsCJBb4UgKYHl4Zp3r93LQM41grh0q2KnQ+AJvJIT88
 8NID/CyJPOqcSHA+WzmzxSTMFJnDJtvJLqVliSc2ZexUHpVVhi5PY0yq9
 +f77bpJv19HagxoxdBP2HBiOT5ZJ5I/H1k87ZeF2nR2TPAWa6I0kSftpr
 zc4e4foexAC9cO0ROZQLQ1MDaVky3nst5cnHhVmPiE6nVFMyo8tVl2OHv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="336741879"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="336741879"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 08:00:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="955356736"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="955356736"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 05 Jun 2023 08:00:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 08:00:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 08:00:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 5 Jun 2023 08:00:51 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 5 Jun 2023 08:00:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OfO2wHsizw/bhQandknIhQte/QKXeK625paRu5R1qXdJtAHpR3bPVnySo0Q7nlnlD/1rDKjuXNoqd3gX5Z/0ZkMpnbI3LazazLxi7LZ5JTWG1KlgItLnr1pbRcslDL32NIpmrrgGKFh2TLuEdZIpFWCWD+E/B9trYmlaSjOe10IPqrYzlTyP2IEPhDvawn7m/cJTdryc0fW+1tF7o/uEWs7YaXwsOkyJa++rdgzrjoiqw5Cd9anwt+QKIQNRQXLM4sRePBXM0KOgGPnSMGXkJ+UOLjSbZWzErlR8aPIdpGhLCGrIJ3Izq9MIRwMdHiWqkjsHpzhS7KmU6xRnxlIQzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCzapaYmUOR8kiodQWsvfeiDHEDJc2qTZZs8C0sd3gY=;
 b=NxrOfqrqSAT566OEGQR/UJSP+iN5CsZvs/6YU69EhlYYSINoaG+galwfd4T8nrs9viJiQmEU/q0pHfQmqheQyOpDIQk3Qxcv3FW7cKoyxiqfrrJcT3uQniVDWKEGQUiP0k5mY4v+0ikrMLLWriRvOTBAED4wNT/BMRP75MkbLVuhBFRDx0+8kjbne/j7aQlnuol0BYWdYFZqiGVOqwLcu3J2BsqSugRW5npTipttincG3t8lkHftDevQy1UQYfv6DQ1nuab+irQfCUcNVWOZE2MOoyo1dZDUjv48ODKvZzHLqkbtzkt0vFXGx5ImGVTixxvRxz2JIaV2uhSNNHDqmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by IA1PR11MB6075.namprd11.prod.outlook.com (2603:10b6:208:3d5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Mon, 5 Jun
 2023 15:00:47 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::86c9:9683:a842:7d07]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::86c9:9683:a842:7d07%6]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 15:00:46 +0000
Message-ID: <f9f14ee3-32a0-22bc-038f-eabdd47dd605@intel.com>
Date: Mon, 5 Jun 2023 20:30:38 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
From: Riana Tauro <riana.tauro@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230524060020.2054682-1-riana.tauro@intel.com>
 <CY5PR11MB6211DCB0D973C5FA6163F4E4954B9@CY5PR11MB6211.namprd11.prod.outlook.com>
 <5e1b25fa-b636-4431-ad5d-a8828c826578@intel.com>
Content-Language: en-US
In-Reply-To: <5e1b25fa-b636-4431-ad5d-a8828c826578@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::11) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|IA1PR11MB6075:EE_
X-MS-Office365-Filtering-Correlation-Id: 64f677e7-3107-4d9e-b681-08db65d5a496
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wMunLlmHUb22gL6kDwVJkZ7ajlFOtl0lBuh453McDOoefGolc99d/ckzIC6cwIi/Qdie/V87FJ5lj8ramOvUCD15YfnGZDLYB0KF4Sg4mPz4GGVIP/HHf85qJUFaUgZYpF98eYq4gD5mN/eyncf7Olm2dJNHPCuHneYq9Np+ts3AdZRkZSVuzdzQcc8zM1RjBhLU6MfuMtH7enpHJok8UVrPtYpNK1zkNLlDMrANgck0F8vWmjzCnw/CkFlTGifWQw7ijNOb/brUDrvJsXx+oz7Dj6L19GPicb95FTRJV8uj2ydB3JkJr2yPtWGoFdjkYFPL7lVKC6QdLh0KAy1pZflQVzSgntjUpwUcxX54H/uKEDdECnD/4pftrwPbipkP2Y6sI7hyAKdq7L4fMrOVDbMdahaf+CDU3JZdLJB08o8s15w7ylUsepuSuhpeUwP0KynQ1viAO4sOgnuQ6qwZTE1Oy9j74nS7bm7SW2Bx6r+n6PxEZbHz4z/jDlabcFydM1h0HvNJFxExrkU7u7eqyYmUPoCzpVoWNx5idHwZ01vtUTaMxMC9pikLZ8XN/hnmSeUXsH6sykIH4vvVUcc2oMQH7qIq5LtyJcunKqz/oXtRO6gRJE4Pzo5X9LyjtT2O0VMiF+HyBVZrXvaGe9bMyVPzd/DVzwMHGpkzVL0A3kM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(376002)(366004)(39860400002)(136003)(451199021)(66476007)(2906002)(66946007)(8676002)(66556008)(5660300002)(31686004)(44832011)(4326008)(316002)(30864003)(41300700001)(54906003)(110136005)(8936002)(6666004)(6486002)(966005)(82960400001)(478600001)(107886003)(26005)(36756003)(83380400001)(6512007)(2616005)(53546011)(186003)(86362001)(6506007)(38100700002)(31696002)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUI1cHNrSmg4S2pCcitRQVJmczVSbzllN0s1ZEVrRnp4bDNVR1VCamZvU1FC?=
 =?utf-8?B?VkxnYzIvcXJsenRSV3BSSVE5SGlPVjFBdTFkTkYwcnQrd3gwM0ZaaW5NMWNH?=
 =?utf-8?B?ZmVtZjI5WWtzcEtUVVVYQ1pSdEExZ1RBTFhhMzFrNnB3YTgzczg4TGNKK09P?=
 =?utf-8?B?NEVWdXZZOWxtZjRHdDQ4bVVsdTczZ2h6UDI0QTZ5aEI2a3U1cTRVM0hDQk1R?=
 =?utf-8?B?YTk0ViszenM1b2hpRGJ1SEtDMFNHUUhCcTZrVmdwL1JuVUhqbzJYY2tLOEJL?=
 =?utf-8?B?cnNwSk96ZUlHN1llYjNTaC9Mb3U3dGpuU1AzMWk3UDBGdmNDQlBDb2gycElx?=
 =?utf-8?B?QzJuTkNMR3NCa21WZDJ1VnNrTzRCcktqdmhTaDgxMHIxWVhnS2lSMDlrUGlD?=
 =?utf-8?B?OS9NcjRqVm95R2hBVmlJUmQxamlMTTNNcWJNL1ltWXNkK2RpS1JJZktuelQ4?=
 =?utf-8?B?MUtsS25wNjlDQXFnWDNsbDhmbE1UTzdNUmZIam4xMm9UMGtyNUhyL2ZsRGh3?=
 =?utf-8?B?d2thVUZHbEhOckdXNnNFa05CV3hTQTNiem9pbzV5QUx1akNzdzdtTStDcmtB?=
 =?utf-8?B?RW5Pck1ialZ5YjBjRXBWdklUZ3B5Q2ZqdTdwZTV4c1NWbFJEZERLLzZleEN6?=
 =?utf-8?B?K0ltTldmZHpQYVZSN2hEeUJ1TE9rMUE0ekhKaldtMzA5M0pDYlZjK3hwTkZU?=
 =?utf-8?B?ZDZDK01HTTYwMmhIcWVjaU12UGh2U0c2MmpETTBzMC9aeEVmTW94elZhanoy?=
 =?utf-8?B?akpLOE5hTnBLS1R6aUFIZS8waTRnM1QyaTFNVEQyZmY2LzNxd1BMS2pESG95?=
 =?utf-8?B?YlNvMCtnMWkzU3R6S05keXNONWFNdzhDdlNJK3hWVU9neDRvRnJhTEV5cFNN?=
 =?utf-8?B?NzJleUo2aTM2VXduTDFmY2xqeitDQks3d1lYMVdGYndZQnkvZm02cFdpZXli?=
 =?utf-8?B?cVdCSW92ZW5scVdFejhZS2thZWhMUiszZlN6SmM2VExUL3c5TzhGbW5jMzZw?=
 =?utf-8?B?em41OVA2N0F2SVdEMnp4UGhLZlhjZHlUUzZubW5QYm1IaVBKY0F0enlBQUJh?=
 =?utf-8?B?cWFKekI2elp0TWxLeUxMcEh6TEg2UmEyM3pmeS8ycDhlYlJxdnFyUWk4cUNh?=
 =?utf-8?B?ZkRGR3Q4WDFaQmpRWnNMMHdJQUZlOUFFaXJHb1FaUk9YRFg5TDJIYkhkS0tu?=
 =?utf-8?B?cnFLUjhLRmJuQkxNd1B2WCtYcFZiNGRDWjhyclJQN3IxaWJWR0RCd2IwTXNT?=
 =?utf-8?B?SkcwZEFSanp2S1c2NE5LUi9aOTVnWXY5V2EydGNySmExRWZmVlFzaFIva2Ft?=
 =?utf-8?B?dFRqTUdHODBNL0hNMkJscjVvajV2ckxRbDc0aG5STzd2L2kyaUpHY0szWUxP?=
 =?utf-8?B?eUpWbks0ZEprbythNVVQR1ZaOFNZQ2FhQkdYSHpLNXdabEhnYUZVbWtocFlY?=
 =?utf-8?B?MWg3NFcwRlkvQ0t1Ry8vcEVoQW0zYUZndTYzNjFja1dNM3pGVndrbXFtaGNS?=
 =?utf-8?B?M3J0YlhMSGhFUFlpaG5IMEE3QnNRQnd5WjVzL2kwdExFaHVSYi9NSk8yUndG?=
 =?utf-8?B?M2VDLzlYOWQvZ240ZWk4dk0xeTdGd1F0aDV0MW9ocmRSMW5sQXU4cHRmV0w5?=
 =?utf-8?B?cG42cXdyTHNjRUphT3hqdDhjOWN5SVEySlhFR0hCUVpWcTBrNHM4dHVHRXhW?=
 =?utf-8?B?SDNrd0drdEhaZ0tCWEdKcDlvSnptYms0RjUyVUtoMExBUjBvTnY5dlZ4UEpr?=
 =?utf-8?B?QWlNVmt1MzBBM1FvcVRUSHZ5Ynp5cWRNOGd2UkI3TFlEWjgxemwvbEJINERP?=
 =?utf-8?B?Um9ENWg1VDdjakVvTWxUcE9zRGhzTjFWQ2RoSWhvRk4xZ21nSE95Yk5BSXJt?=
 =?utf-8?B?UlRkaVlrZVlxUWtuNUNwb1Z4QnFlckRxdWZPVExpYzhIZlZzUS9GRlh5ZmdE?=
 =?utf-8?B?N1Vqa0RucnpFaUxSRTlCQmg2NDFZeTdoQUNZd3hieEROM0Q3ZEczbFN6YVRG?=
 =?utf-8?B?TjZqOFI4anlUNSt5M09hQS81dlVZNDdYd2IxelJreGc3eFFvMmxqdVRPWGJq?=
 =?utf-8?B?WGp3ZlBQTDhYU25LL2VUVGI5akczckxKTmVMQjc3Ry9rQmxCLzNLTVgzbUlY?=
 =?utf-8?Q?QTnN7USUzH5ne0XiHN6A7lCSw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64f677e7-3107-4d9e-b681-08db65d5a496
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 15:00:46.8526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wrawP8w3G2+0GeZs95p5ZP+ehgVdFMAOZVKVvqnUtTgStqUNuIrsNaWfTco2kVvqcQ1mQVaeFiXleIyebCWprg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6075
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: add a new sysfs directory for gtidle
 properties
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



On 5/31/2023 10:28 AM, Riana Tauro wrote:
> Hi Anshuman
> 
> On 5/30/2023 4:00 PM, Gupta, Anshuman wrote:
>>
>>
>>> -----Original Message-----
>>> From: Tauro, Riana <riana.tauro@intel.com>
>>> Sent: Wednesday, May 24, 2023 11:30 AM
>>> To: intel-xe@lists.freedesktop.org
>>> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
>>> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; 
>>> Dixit,
>>> Ashutosh <ashutosh.dixit@intel.com>; Nilawar, Badal
>>> <badal.nilawar@intel.com>; Wajdeczko, Michal
>>> <Michal.Wajdeczko@intel.com>
>>> Subject: [PATCH] drm/xe: add a new sysfs directory for gtidle properties
>>>
>>> Add a new sysfs directory under devices/gt#/ called gtidle to contain 
>>> idle
>>> properties of GT such as name, idle_status, idle_residency_ms
>>>
>>> v2:
>>>      - abstract using function pointers (Anshuman)
>>>      - use device_attr (Badal)
>>>      - move rc functions to guc_pc
>>>      - change name to gt_idle (Rodrigo)
>>>
>>> v3:
>>>      - return error for drmm_add_action_or_reset
>>>      - replace file and functions with gt_idle prefix
>>>        to gt_idle_sysfs (Himal)
>>>      - use enum for gt idle state
>>>      - move multiplier to gt idle and initialize (Anshuman)
>>>      - correct doc annotation (Rodrigo)
>>>      - remove return variable
>>>      - use kobj_gt instead of new gtidle kobj
>>>      - move residency_ms to gtidle file
>>>      - retain xe_guc_pc prefix for functions in guc_rc file (Michal)
>>>
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/Makefile                 |   1 +
>>>   drivers/gpu/drm/xe/xe_gt.c                  |   5 +
>>>   drivers/gpu/drm/xe/xe_gt_idle_sysfs.c       | 157 ++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_gt_idle_sysfs.h       |  13 ++
>>>   drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h |  38 +++++
>>>   drivers/gpu/drm/xe/xe_gt_types.h            |   4 +
>>>   drivers/gpu/drm/xe/xe_guc_pc.c              |  46 +++---
>>>   drivers/gpu/drm/xe/xe_guc_pc.h              |   2 +
>>>   8 files changed, 237 insertions(+), 29 deletions(-)  create mode 
>>> 100644
>>> drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
>>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_idle_sysfs.h
>>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h
>>>
>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>> index cd1614b68734..84f0985054fa 100644
>>> --- a/drivers/gpu/drm/xe/Makefile
>>> +++ b/drivers/gpu/drm/xe/Makefile
>>> @@ -45,6 +45,7 @@ xe-y += xe_bb.o \
>>>       xe_gt.o \
>>>       xe_gt_clock.o \
>>>       xe_gt_debugfs.o \
>>> +    xe_gt_idle_sysfs.o \
>>>       xe_gt_mcr.o \
>>>       xe_gt_pagefault.o \
>>>       xe_gt_sysfs.o \
>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c 
>>> index
>>> 80d42c7c7cfa..eb1e1e3d2d71 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>> @@ -18,6 +18,7 @@
>>>   #include "xe_force_wake.h"
>>>   #include "xe_ggtt.h"
>>>   #include "xe_gt_clock.h"
>>> +#include "xe_gt_idle_sysfs.h"
>>>   #include "xe_gt_mcr.h"
>>>   #include "xe_gt_pagefault.h"
>>>   #include "xe_gt_printk.h"
>>> @@ -383,6 +384,10 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>>>       if (err)
>>>           goto err_force_wake;
>>>
>>> +    err = xe_gt_idle_sysfs_init(&gt->gtidle);
>> Can't we keep this simple to pass just GT and inside function, 
>> initialize the GT ?
> This was to keep consistency with other files having struct specific to 
> the files as parameters. IMO gtidle as a parameter is appropriate as all 
> the functions in the file use xe_gt_idle
>>> +    if (err)
>>> +        goto err_force_wake;
>>> +
>>>       /* XXX: Fake that we pull the engine mask from hwconfig blob */
>>>       gt->info.engine_mask = gt->info.__engine_mask;
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
>>> b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
>>> new file mode 100644
>>> index 000000000000..b7de53287f6b
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
>>> @@ -0,0 +1,157 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
>>> + */
>>> +
>>> +#include <drm/drm_managed.h>
>>> +
>>> +#include "xe_device.h"
>>> +#include "xe_gt.h"
>>> +#include "xe_gt_idle_sysfs.h"
>>> +#include "xe_gt_sysfs.h"
>>> +#include "xe_guc_pc.h"
>>> +
>>> +/**
>>> + * DOC: Xe GT Idle
>>> + *
>>> + * Provides sysfs entries for idle properties of GT
>>> + *
>>> + * device/gt#/gtidle/name - name of the state
>>> + * device/gt#/gtidle/idle_residency_ms - Provides residency of the idle
>>> +state in ms
>>> + * device/gt#/gtidle/idle_status - Provides current idle state  */
>>> +
>>> +static struct xe_gt_idle *dev_to_gtidle(struct device *dev) {
>>> +    struct kobject *kobj = &dev->kobj;
>>> +
>>> +    return &kobj_to_gt(kobj->parent)->gtidle;
>>> +}
>>> +
>>> +static struct xe_gt *gtidle_to_gt(struct xe_gt_idle *gtidle) {
>>> +    return container_of(gtidle, struct xe_gt, gtidle); }
>>> +
>>> +static struct xe_guc_pc *gtidle_to_pc(struct xe_gt_idle *gtidle) {
>>> +    return &gtidle_to_gt(gtidle)->uc.guc.pc; }
>>> +
>>> +static const char *gt_idle_state_to_string(enum xe_gt_idle_state state)
>>> +{
>>> +    switch (state) {
>>> +    case GT_IDLE_RC0:
>>> +        return "rc0";
>>> +    case GT_IDLE_RC6:
>>> +        return "rc6";
>>> +    default:
>>> +        return "unknown";
>>> +    }
>>> +}
>>> +
>>> +static u64 get_residency_ms(struct xe_gt_idle *gtidle, u64
>>> +cur_residency) {
>>> +    u64 delta, overflow_residency, prev_residency;
>>> +
>>> +    overflow_residency = BIT_ULL(32);
>>> +    /*
>>> +     * Counter wrap handling
>>> +     * Store previous hw counter values for counter wrap-around
>>> handling
>>> +     * Relying on sufficient frequency of queries otherwise counters 
>>> can
>>> still wrap.
>>> +     */
>>> +    prev_residency = gtidle->prev_residency;
>>> +    gtidle->prev_residency = cur_residency;
>> Multiple user threads can race against each other while reading this 
>> attribute.
>> So probably we need some sort of locking ?
Hi Anshuman

seq_read_iter takes a lock while calling sysfs_show
https://elixir.bootlin.com/linux/latest/source/fs/seq_file.c#L171


Call Trace:
[ 1079.006358]  <TASK>
[ 1079.006363]  dump_stack_lvl+0x92/0xb0
[ 1079.006373]  idle_residency_ms_show+0x34/0x110 [xe]
[ 1079.006563]  sysfs_kf_seq_show+0x14f/0x1e0
[ 1079.006571]  ? __pfx_kobj_attr_show+0x10/0x10
[ 1079.006582]  seq_read_iter+0x3b6/0x880


So locking will not be needed

Thanks
Riana

> Thanks for pointing this.
> Will add this in next rev
>>> +
>>> +    /* delta */
>>> +    if (cur_residency >= prev_residency)
>>> +        delta = cur_residency - prev_residency;
>>> +    else
>>> +        delta = cur_residency + (overflow_residency -
>>> prev_residency);
>>> +
>>> +    /* Add delta to extended raw driver copy of idle residency */
>>> +    cur_residency = gtidle->cur_residency + delta;
>>> +    gtidle->cur_residency = cur_residency;
>>> +
>>> +    /* residency multiplier in ns, convert to ms */
>>> +    return mul_u64_u32_div(cur_residency, gtidle-
>>>> residency_multiplier,
>>> +1e6); }
>>> +
>>> +static ssize_t name_show(struct device *dev,
>>> +             struct device_attribute *attr, char *buff) {
>>> +    struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
>>> +
>>> +    return sysfs_emit(buff, gtidle->name); } static
>>> DEVICE_ATTR_RO(name);
>>> +
>>> +static ssize_t idle_status_show(struct device *dev,
>>> +                struct device_attribute *attr, char *buff) {
>>> +    struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
>>> +    struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
>>> +    enum xe_gt_idle_state state;
>>> +
>>> +    state = gtidle->idle_status(pc);
>>> +
>>> +    return sysfs_emit(buff, "%s\n", gt_idle_state_to_string(state)); }
>>> +static DEVICE_ATTR_RO(idle_status);
>>> +
>>> +static ssize_t idle_residency_ms_show(struct device *dev,
>>> +                      struct device_attribute *attr, char *buff) {
>>> +    struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
>>> +    struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
>>> +    u64 residency;
>>> +
>>> +    residency = gtidle->idle_residency(pc);
>>> +    return sysfs_emit(buff, "%llu\n", get_residency_ms(gtidle,
>>> +residency)); } static DEVICE_ATTR_RO(idle_residency_ms);
>>> +
>>> +static const struct attribute *gt_idle_attrs[] = {
>>> +    &dev_attr_name.attr,
>>> +    &dev_attr_idle_status.attr,
>>> +    &dev_attr_idle_residency_ms.attr,
>>> +    NULL,
>>> +};
>>> +
>>> +static void gt_idle_sysfs_fini(struct drm_device *drm, void *arg) {
>>> +    struct kobject *kobj = arg;
>>> +
>>> +    sysfs_remove_files(kobj, gt_idle_attrs);
>>> +    kobject_put(kobj);
>>> +}
>>> +
>>> +int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle) {
>>> +    struct xe_gt *gt = gtidle_to_gt(gtidle);
>>> +    struct xe_device *xe = gt_to_xe(gt);
>>> +    struct kobject *kobj;
>>> +    int err;
>>> +
>>> +    kobj = kobject_create_and_add("gtidle", gt->sysfs);
>>> +    if (!kobj)
>>> +        return -ENOMEM;
>> IMO ENOMEM does not suits here, How  about EINVAL or ENODEV ?
> kobject_create_and_add returns NULL if kzalloc fails or when the add fails.
> Most of the files  return -ENOMEM when the function fails
>>> +
>>> +    sprintf(gtidle->name, "gt%d-rc\n", gt->info.id);
>>> +    /* Multiplier for  RC6 Residency counter in units of 1.28us */
>>> +    gtidle->residency_multiplier = 1280;
>>> +    gtidle->idle_residency = xe_guc_pc_rc6_residency;
>>> +    gtidle->idle_status = xe_guc_pc_rc_status;
>>> +
>>> +    err = sysfs_create_files(kobj, gt_idle_attrs);
>>> +    if (err) {
>>> +        kobject_put(kobj);
>>> +        return err;
>>> +    }
>>> +
>>> +    err = drmm_add_action_or_reset(&xe->drm, gt_idle_sysfs_fini,
>>> kobj);
>>> +    if (err)
>>> +        return err;
>>> +
>>> +    return 0;
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.h
>>> b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.h
>>> new file mode 100644
>>> index 000000000000..a654561fda19
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.h
>>> @@ -0,0 +1,13 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_GT_IDLE_SYSFS_H_
>>> +#define _XE_GT_IDLE_SYSFS_H_
>>> +
>>> +#include "xe_gt_idle_sysfs_types.h"
>>> +
>>> +int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle);
>>> +
>>> +#endif /* _XE_GT_IDLE_SYSFS_H_ */
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h
>>> b/drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h
>>> new file mode 100644
>>> index 000000000000..b9cfb37aae75
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h
>>> @@ -0,0 +1,38 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_GT_IDLE_SYSFS_TYPES_H_
>>> +#define _XE_GT_IDLE_SYSFS_TYPES_H_
>>> +
>>> +#include <linux/types.h>
>>> +
>>> +struct xe_guc_pc;
>>> +
>>> +/* States of GT Idle */
>>> +enum xe_gt_idle_state {
>>> +    GT_IDLE_RC0,
>>> +    GT_IDLE_RC6,
>>> +    GT_IDLE_UNKNOWN,
>>> +};
>>> +
>>> +/**
>>> + * struct xe_gt_idle - A struct that contains idle properties based of
>>> +gt  */ struct xe_gt_idle {
>>> +    /** @name: name */
>>> +    char name[16];
>>> +    /** @residency_multiplier: residency multiplier in ns */
>>> +    u32 residency_multiplier;
>>> +    /** @cur_residency: raw driver copy of idle residency */
>>> +    u64 cur_residency;
>>> +    /** @prev_residency: previous residency counter */
>>> +    u64 prev_residency;
>>> +    /** @idle_status: get the current idle state */
>>> +    enum xe_gt_idle_state (*idle_status)(struct xe_guc_pc *pc);
>>> +    /** @idle_residency: get idle residency counter */
>>> +    u64 (*idle_residency)(struct xe_guc_pc *pc); };
>>> +
>>> +#endif /* _XE_GT_IDLE_SYSFS_TYPES_H_ */
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
>>> b/drivers/gpu/drm/xe/xe_gt_types.h
>>> index 7c47d67aa8be..8dec660f5fc6 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>>> @@ -7,6 +7,7 @@
>>>   #define _XE_GT_TYPES_H_
>>>
>>>   #include "xe_force_wake_types.h"
>>> +#include "xe_gt_idle_sysfs_types.h"
>>>   #include "xe_hw_engine_types.h"
>>>   #include "xe_hw_fence_types.h"
>>>   #include "xe_reg_sr_types.h"
>>> @@ -287,6 +288,9 @@ struct xe_gt {
>>>       /** @uc: micro controllers on the GT */
>>>       struct xe_uc uc;
>>>
>>> +    /** @gtidle: idle properties of GT */
>>> +    struct xe_gt_idle gtidle;
>>> +
>>>       /** @engine_ops: submission backend engine operations */
>>>       const struct xe_engine_ops *engine_ops;
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
>>> b/drivers/gpu/drm/xe/xe_guc_pc.c index e799faa1c6b8..31c56a0dc210
>>> 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>> @@ -76,12 +76,7 @@
>>>    *
>>>    * Render-C states is also a GuC PC feature that is now enabled in 
>>> Xe for
>>>    * all platforms.
>>> - * Xe's GuC PC provides a sysfs API for Render-C States:
>>>    *
>>> - * device/gt#/rc* *read-only* files:
>>> - * - rc_status: Provide the actual immediate status of Render-C: 
>>> (rc0 or rc6)
>>> - * - rc6_residency: Provide the rc6_residency counter in units of 
>>> 1.28 uSec.
>>> - *                  Prone to overflows.
>>>    */
>>>
>>>   static struct xe_guc *
>>> @@ -580,10 +575,12 @@ static ssize_t freq_max_store(struct device *dev,
>>> struct device_attribute *attr,  }  static DEVICE_ATTR_RW(freq_max);
>>>
>>> -static ssize_t rc_status_show(struct device *dev,
>>> -                  struct device_attribute *attr, char *buff)
>>> +/**
>>> + * xe_guc_pc_rc_status - get the current Render C state
>>> + * @pc - XE_GuC_PC instance
>>> + */
>>> +enum xe_gt_idle_state xe_guc_pc_rc_status(struct xe_guc_pc *pc)
>>>   {
>>> -    struct xe_guc_pc *pc = dev_to_pc(dev);
>>>       struct xe_gt *gt = pc_to_gt(pc);
>>>       u32 reg;
>>>
>>> @@ -593,37 +590,30 @@ static ssize_t rc_status_show(struct device *dev,
>>>
>>>       switch (REG_FIELD_GET(RCN_MASK, reg)) {
>>>       case GT_RC6:
>>> -        return sysfs_emit(buff, "rc6\n");
>>> +        return GT_IDLE_RC6;
>>>       case GT_RC0:
>>> -        return sysfs_emit(buff, "rc0\n");
>>> +        return GT_IDLE_RC0;
>>>       default:
>>> -        return -ENOENT;
>>> +        return GT_IDLE_UNKNOWN;
>>>       }
>>>   }
>>> -static DEVICE_ATTR_RO(rc_status);
>>>
>>> -static ssize_t rc6_residency_show(struct device *dev,
>>> -                  struct device_attribute *attr, char *buff)
>>> +/**
>>> + * xe_guc_pc_rc6_residency - rc6 residency counter
>>> + * @pc - Xe_GuC_PC instance
>>> + */
>>> +u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc)
>>>   {
>>> -    struct xe_guc_pc *pc = dev_to_pc(dev);
>>>       struct xe_gt *gt = pc_to_gt(pc);
>>> -    u32 reg;
>>> -    ssize_t ret;
>>> +    u64 reg;
>> Why do we need u64 here as we are reading 32 bit register, caller can 
>> do the implicit type conversion.
> Will change this to u32
> 
> Thanks
> Riana
>> Thanks,
>> Anshuman Gupta.
>>>
>>> -    xe_device_mem_access_get(pc_to_xe(pc));
>>> -    ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>> -    if (ret)
>>> -        goto out;
>>> +    xe_device_mem_access_get(gt_to_xe(gt));
>>>
>>>       reg = xe_mmio_read32(gt, GT_GFX_RC6);
>>> -    ret = sysfs_emit(buff, "%u\n", reg);
>>>
>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt),
>>> XE_FORCEWAKE_ALL));
>>> -out:
>>> -    xe_device_mem_access_put(pc_to_xe(pc));
>>> -    return ret;
>>> +    xe_device_mem_access_put(gt_to_xe(gt));
>>> +    return reg;
>>>   }
>>> -static DEVICE_ATTR_RO(rc6_residency);
>>>
>>>   static const struct attribute *pc_attrs[] = {
>>>       &dev_attr_freq_act.attr,
>>> @@ -633,8 +623,6 @@ static const struct attribute *pc_attrs[] = {
>>>       &dev_attr_freq_rpn.attr,
>>>       &dev_attr_freq_min.attr,
>>>       &dev_attr_freq_max.attr,
>>> -    &dev_attr_rc_status.attr,
>>> -    &dev_attr_rc6_residency.attr,
>>>       NULL
>>>   };
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h
>>> b/drivers/gpu/drm/xe/xe_guc_pc.h index da29e4934868..976179dbc9a8
>>> 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>>> @@ -12,4 +12,6 @@ int xe_guc_pc_init(struct xe_guc_pc *pc);  int
>>> xe_guc_pc_start(struct xe_guc_pc *pc);  int xe_guc_pc_stop(struct
>>> xe_guc_pc *pc);
>>>
>>> +enum xe_gt_idle_state xe_guc_pc_rc_status(struct xe_guc_pc *pc);
>>> +u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
>>>   #endif /* _XE_GUC_PC_H_ */
>>> -- 
>>> 2.40.0
>>
