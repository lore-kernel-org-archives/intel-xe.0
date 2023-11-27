Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2262AC4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 10:16:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF1F210E216;
	Mon, 27 Nov 2023 10:16:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F22C10E216
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 10:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701080204; x=1732616204;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CRuCAIobYJayZK+gUy4yinczMAUk8lcxax9XKPIJuG4=;
 b=BaGZguJ5qOlFUGJYbEHgdgF7Z5azbz+9q+fB8HrwiMwRWIJ6HOaKeex1
 5I6rMcVB/ZtbhT23aV7YCklutDi3n+F1rHYbzw6ZAhYCuUcMf83CNZmZX
 oie+CcY/6fnLWARAEAtswgnK2fe88AD7GsK5ciQADYoal4qXRwnW5vc1W
 HSGenC/TIxE9rK+XgirLGTNMOSmQxuKQeHvBY8uaU7lz0ijLhITQGEYNU
 a2shn6t23eto1iDLivJDL5ZPyldklwzmTqcbk91s6tBvSgKlzkg6nuUPo
 SHz4eoHImHM5+wy0cK0zHkH6VZwtfY1PDy2qM7A57LnoiOfJTbctK7Wie g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="389821444"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; d="scan'208";a="389821444"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 02:16:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="858998327"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; d="scan'208";a="858998327"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Nov 2023 02:16:43 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 02:16:43 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 02:16:42 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 27 Nov 2023 02:16:42 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 27 Nov 2023 02:16:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C2LL+vj5W3zLHQorwLbrREoir/aFgK5bfZ/QdDmlqUZr3q754sKxizNSfggVb9k1SAT903JajaTy+tgb8lbtWUH4qiWXpgUpR0Q6q8KRm5WpdVzS0G53ideE3wteNndcO5DJUqyv6Olv+ta0oXnorkQBQlkB63CdXk5cr9vSxy/21kux/hVjoGyI88cHjAxlN4bE3NA0gQZUheKBli52EBxboGBNvpl4OEu3JcF1ekUwdiupNZ1ED/KxmUHkg3KldFgolDOVMj7MYhAMmIQGPh7hNNNEVMQl4+DJwd30D7wEwo7K+i1VSyCLDBUqrPSA+0j+MgQZis3s4X4jrtFfsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4EWJMT9HIZQx898bjMCxfrEInZS7MuwObhWrVHzA9A=;
 b=Z3UcOQiNFTSDYjpevCQHNAIqAdqUMxUlvxjDaXwoE8KN/MTTHWZLibbqXKyLCnHcl1e77vIGzomswFV0u1dfiad+mOAJoHPy0LBbESrIcYrYU3CaC2m9F+3+8QCWo5fhLKQaYtDSfDbKWK7sMnpiQ1FK4ubnSpaE6BaJTFwQydMwi95dpzc3PKbILx/1bv24gUcxC76J54lqX2fWqMZH79Mew8aPqbdVtZcDd2rv6ZpYXa6mOaGiA8p5MwKvJ/0Z36ZpPdKL17F20cBJyn6uzu8EuxkCT1C8I0JFZ6jDiBot0hw/9Hq4ARFHBf2CNOls2EqsD/uix68IP14QIZPPFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 SA1PR11MB8522.namprd11.prod.outlook.com (2603:10b6:806:3b1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Mon, 27 Nov
 2023 10:16:40 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 10:16:40 +0000
Message-ID: <4344d0ab-d5a4-4c5f-a104-49df08829ab6@intel.com>
Date: Mon, 27 Nov 2023 15:46:33 +0530
User-Agent: Mozilla Thunderbird
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231124122755.91279-1-sujaritha.sundaresan@intel.com>
 <20231124122755.91279-3-sujaritha.sundaresan@intel.com>
 <ea1d4d72-b609-4181-bb26-9e0c89ce8dcd@intel.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <ea1d4d72-b609-4181-bb26-9e0c89ce8dcd@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0157.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::19) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|SA1PR11MB8522:EE_
X-MS-Office365-Filtering-Correlation-Id: ba282d5f-a0a4-444b-adbe-08dbef31f237
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dG8CXBzjoPyoT1k6ffuKLdG4ObJmmqrRgOJ91Yl8ttmdQ0gbbBpkGkfc5omnpqaRZs1sjm5QbRPdey+vw7t0r3iRfWwhGRvfX+k5LsNJ5OmjJu4plH7c0xmrgIchqhq2JnEtI+xaC64COeCYas/53b4F1g/1Oq8A8i8KJOxaTUNRHl7HzD+L1aK18UyyRvWETzRTMssOH/HvDMeBFjTIqlBpzJmgHtSfjg1KCbQo2sj/LBEqSwD3Q4KZfra/oNXa+bIkBaNaZUesBbBpaYvPtAlxmCKfTx0hD4Dhj4BesoItVSkCjpdi7djWYL89OHe1f3ZdfOEV24HHKrStvfbRTZl7xn1QNKirr2rpKPYqYUWuiYMKoJb8JuvkrNpFBGlnkmga4hmF0oJ3EiX74/yUulr++SEotLjVPEAIK568ROXrXvH2cbwA/tVg3su+lFW0/JF/e4ikBkStAsJrrHfptKtqJE+d0vHh1rahX4XE4dCL3QtLugzXkVLSbj75fy+kLaUlyeSHzARGhF/arPi82Bv63hzKN+FhTfhoHYGayzbnpCcXNFXs529rel4JWe59IfSeZ2lKzWX8j9INSzlZsZLKj3r2UFTF20SZvmTL2aXC3+m8leAOP9yrtRX+PeYjhHFWH2cCqQ6X8iLA+9kxkT2bjUbE4Gz5DGVBLkkrThQeF0xZrdnUFnUG6UhloidX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39860400002)(136003)(376002)(346002)(230922051799003)(230173577357003)(230273577357003)(451199024)(64100799003)(186009)(1800799012)(83380400001)(6506007)(6512007)(2616005)(53546011)(6486002)(6666004)(2906002)(316002)(478600001)(4326008)(41300700001)(5660300002)(107886003)(8676002)(8936002)(26005)(66556008)(66476007)(66946007)(86362001)(31696002)(36756003)(38100700002)(82960400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OE8rbHBXN2N3NDNFZ2s4b3hlZXdGTkErRWlKajRFQTVzWTV4dXBnVzBBRDc3?=
 =?utf-8?B?VUpkbUtSb3ZmdG8ySkhlTzhDdXZlYSt5RWZWMnBGWmw0LzR5UmFSbnVYeFdt?=
 =?utf-8?B?ZndRbnBJdGRWd3QvRklIa0RweGd1Yi9tN0EwTDBXMk9jWFB5a21rSE1BV2VZ?=
 =?utf-8?B?bTkrVTQrVlduMGpycDZ3VElqYVo0SkJLREtUU0RJSkR3SWUvMVBvZE03eFVN?=
 =?utf-8?B?a2dTNUJMTTVHUkZtNEpMSHR6eEdXeEc5V2hWd0wxRkNLUWR2V2QxUTlCNkd3?=
 =?utf-8?B?cEZMSkdWMXA0TW5jdlVqQ0ZNQXlKNUtqd3EwRVBZQmNtOWROdVlRMEZ3dlVV?=
 =?utf-8?B?c04zL2Rsdmk2QUFrcHpsd2FoK21wV1p1clo1bHJ0NlhSdjVBenAveHdPODhv?=
 =?utf-8?B?eGtPUjAwdXFGVUxpdXZIWWlwaFNyUStqOGVZaCtCK3IzT3BkOFR5MHJHendZ?=
 =?utf-8?B?QzE3N1JqdjUzeUh4dTk3S0FqYWFCcVFQMURWby9veWxieU9EZjdqbEpwRkE3?=
 =?utf-8?B?cTBSNW1LZFE1K1RaR2JpbWV3SWxadG1ISmQzUTkrWEZPWFNDZ1Y1RGNaYi9a?=
 =?utf-8?B?UzhtakgyQmJwMUdTdjFHZ1lZNGgrMk9lMk45UmlJYzZVenBoUzEzVXNzczNV?=
 =?utf-8?B?emNKbm8wejF4NE1QSEhVQVJkNkFWT3VncFdscTJqMHo0WnR2SEtJaTQ3Mity?=
 =?utf-8?B?bkQ3aHB4dElxUE80RU5VN0NlaEFqaUNVMk8xMS9WTU81aFE1Q3B1czZVWXhN?=
 =?utf-8?B?RHJVR1BzK0hrRUhVVFc3VnNQWU5hSDRXRDNjak45Z2RUTDhpMys5MXdwOFhh?=
 =?utf-8?B?UWQ2QmRqd3JneG9qZk5VZ2Y0RnQ5cmpjR0I2b2JsT0ZvaExKaEhVMlI1ZkJZ?=
 =?utf-8?B?dGFsZmloSHdLV3U1NVBmV1MvbVVuV282OWNXZXFUS01PaFdNZ1dQNzlZZkxR?=
 =?utf-8?B?RjVBYlJ6SVo1aUZ5USsrSlZTS3N0czdteG0wK2pta2wwR08xcFZtcGFPOXJB?=
 =?utf-8?B?KzlOazBndVAyN3hXTzVMYUVrZjkrMjFVY1ZjMVVMSW1uVC8yeWtKdmhJd2hJ?=
 =?utf-8?B?VnV5eDNFalVjeXp2VDdiQ2dVNzNMcjZYdUk0UDU5OTlrcGdBVXhrQmhCRHRj?=
 =?utf-8?B?QW8rODEwVStMQ3ZyS01pUDBtemF4eW50bEZTYjVSM2FrU1c0NitvVjdvMzhW?=
 =?utf-8?B?VDlOUHpZbTNIQW9qYWYwQTYvU1YvQ0ZlWlR4VXVsRDk4M0IvYlEwK1MrdUx4?=
 =?utf-8?B?dU1ncVBKeWtudDY1OW03cmpRNUxVSGpOd0Y3OHpUN2FYZWpJTUZZcks5UllY?=
 =?utf-8?B?aGpFUCtGWTdjL2xSM3dCWkdPYkY4OGxsdmpYN2Q1OW5ncFJ6bGdKc2I2bzBE?=
 =?utf-8?B?bkVSVFZZdUdKWEFzUHZYc1hpSWFmWnZKY055V2Zwb1FlZDQyUmNqNW1NcmxZ?=
 =?utf-8?B?Z1hZOVYvODlMZGI3L2N1MndzK3JoOU10SjBlVmFZdGFKalh4YUp1NVY2aXFM?=
 =?utf-8?B?bkgrakRuaG1lZWQ2NENMcisvSk56WEZpOG53dHZOdC9vOEN5VEhkLysxQVVG?=
 =?utf-8?B?MjI0Z3g3aGs0OU9rVHdEK2pjWTRHdzlicnlvSTIrWU1iaWdCN2V3OWpVd0Mx?=
 =?utf-8?B?L3k5NWwyeEVBd1BnTlpIdkxhU2JMelovak9QTHloblJMVXFtOXJJZ3Rqa2Ry?=
 =?utf-8?B?QmkyRVo3eVp1RkRSR1RPZjErNmZydmhWYVlQakVyM3AzZ1czOUU0bEw0Ym1U?=
 =?utf-8?B?alM5TUJMcmJ0ZG5Ec24xdmU0enpodnhLVnpyR2h2a1ZuSEVoVCtVQUFoRlJt?=
 =?utf-8?B?cSsrOFRXdUhKQmpNTWpTZnVXRUdrVktDK0lZayt0SStKNG1pNW55THk2amFK?=
 =?utf-8?B?c3QxUFZJbTZBNVVqRVI4Y2M4Y1BUR0JoTnRFT0RFSlJIN0VwT1g0cHRLTTlS?=
 =?utf-8?B?a0R1emJkWXJFajJ2dWRSS1ZwUzFqTUk4RlcydTJseWtnZGQ2K1kwVGZGTzFF?=
 =?utf-8?B?TVIyWGdPOTFFTGJOMmFLUHNuYXV0WGpTNTJJRXJvdlJwa3g3a3VHTTJ4RThY?=
 =?utf-8?B?TklVSndiL1AyeERvdWUzem9KaWR3dFh2TWN6cGFkTGNEMFZjN05rcU9yWE56?=
 =?utf-8?B?WEtrd2p6cW14SzJDZGk4WWpRSUUvTC9HOUVicWYrMUNtdWRFa3BSK00wTEp6?=
 =?utf-8?B?elE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba282d5f-a0a4-444b-adbe-08dbef31f237
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 10:16:40.2674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kbFgfyBwuwQHmwWAUrmtbG7el7hUPQJoR4gWZJ4yfFkAwzbK9Bka8vnvuxoHT5XflEm8vBnTCK/vAG0HLYi0a5RhHVNpr/cPbqHDjtxBFnk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8522
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Add vram frequency sysfs
 attributes
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Riana,

Thanks will see if there is something to fix with the sysfs_remove 
functions.

Regards,

Suja

On 11/27/2023 3:30 PM, Riana Tauro wrote:
> Hi Suja
>
> There is an error on module unload.
>
> [ 1042.525614] ------------[ cut here ]------------
> [ 1042.525622] kernfs: can not remove 'physical_vram_size_bytes', no 
> directory
> [ 1042.525641] WARNING: CPU: 3 PID: 2234 at fs/kernfs/dir.c:1662 
> kernfs_remove_by_name_ns+0xb3/0xc0
> [ 1042.525965] Call Trace:
> [ 1042.525970]  <TASK>
> [ 1042.525976]  ? __warn+0xa5/0x200
> [ 1042.525986]  ? kernfs_remove_by_name_ns+0xb3/0xc0
> [ 1042.525996]  ? report_bug+0x216/0x220
> [ 1042.526011]  ? handle_bug+0x3c/0x70
> [ 1042.526018]  ? exc_invalid_op+0x18/0x50
> [ 1042.526025]  ? asm_exc_invalid_op+0x1a/0x20
> [ 1042.526033]  ? __pfx_tile_sysfs_fini+0x10/0x10 [xe]
> [ 1042.526275]  ? irq_work_claim+0x1e/0x40
> [ 1042.526288]  ? kernfs_remove_by_name_ns+0xb3/0xc0
> [ 1042.526298]  ? kernfs_remove_by_name_ns+0xb3/0xc0
> [ 1042.526310]  tile_sysfs_fini+0x1e/0x40 [xe]
> [ 1042.526515]  drm_managed_release+0x117/0x250 [drm]
> [ 1042.526626]  drm_dev_release+0x49/0x60 [drm]
> [ 1042.526723]  release_nodes+0x59/0x190
> [ 1042.526731]  ? lockdep_hardirqs_on_prepare+0x136/0x210
> [ 1042.526739]  ? _raw_spin_unlock_irqrestore+0x51/0x70
> [ 1042.526752]  devres_release_all+0xf8/0x140
> [ 1042.526761]  ? __pfx_devres_release_all+0x10/0x10
> [ 1042.526779]  device_unbind_cleanup+0x16/0xc0
> [ 1042.526788]  device_release_driver_internal+0x10d/0x160
> [ 1042.526799]  unbind_store+0x98/0xa0
> [ 1042.526809]  ? __pfx_sysfs_kf_write+0x10/0x10
> [ 1042.526815]  kernfs_fop_write_iter+0x1bc/0x260
> [ 1042.526828]  vfs_write+0x553/0x770
> [ 1042.526839]  ? __pfx_vfs_write+0x10/0x10
> [ 1042.526850]  ? do_sys_openat2+0x266/0x350
> [ 1042.526867]  ? __fget_light+0x9e/0x100
> [ 1042.526882]  ksys_write+0xc7/0x170
> [ 1042.526889]  ? __pfx_ksys_write+0x10/0x10
> [ 1042.526895]  ? mark_held_locks+0x24/0x90
> [ 1042.526906]  ? lockdep_hardirqs_on_prepare+0x136/0x210
> [ 1042.526920]  do_syscall_64+0x3c/0x90
> [ 1042.526929]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
>
>
> On 11/24/2023 5:57 PM, Sujaritha Sundaresan wrote:
>> Add vram frequency sysfs attributes under the below hierarchy;
>>
>> /device/tile<n>/memory/freq
>>             |-vram_rp0_freq
>>             |-vram_rpn_freq
>>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pcode_api.h  |  8 +++
>>   drivers/gpu/drm/xe/xe_tile_sysfs.c | 78 +++++++++++++++++++++++++++++-
>>   2 files changed, 84 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h 
>> b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 5935cfe30204..edde5335bdb1 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -42,6 +42,14 @@
>>   #define        POWER_SETUP_I1_SHIFT        6    /* 10.6 fixed point 
>> format */
>>   #define        POWER_SETUP_I1_DATA_MASK        REG_GENMASK(15, 0)
>>   +#define   XEHP_PCODE_FREQUENCY_CONFIG 0x6e    /* xehp, pvc */
>> +/* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0             0x0
>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN             0x1
>> +/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
>> +/* XEHP_PCODE_FREQUENCY_CONFIG param2 */
>> +#define     PCODE_MBOX_DOMAIN_HBM                      0x2
>> +
>>   struct pcode_err_decode {
>>       int errno;
>>       const char *str;
>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c 
>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> index f354c8b2bfc6..ddf5072c40eb 100644
>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> @@ -7,9 +7,14 @@
>>   #include <linux/sysfs.h>
>>   #include <drm/drm_managed.h>
>>   +#include "xe_gt_types.h"
>> +#include "xe_pcode.h"
>> +#include "xe_pcode_api.h"
>>   #include "xe_tile.h"
>>   #include "xe_tile_sysfs.h"
>>   +#define GT_FREQUENCY_MULTIPLIER        50
>> +
>>   static void xe_tile_sysfs_kobj_release(struct kobject *kobj)
>>   {
>>       kfree(kobj);
>> @@ -35,11 +40,72 @@ static DEVICE_ATTR_RO(physical_vram_size_bytes);
>>   static const struct attribute *physical_memsize_attr =
>>       &dev_attr_physical_vram_size_bytes.attr;
>>   +static ssize_t vram_rp0_freq_show(struct device *kdev, struct 
>> device_attribute *attr,
>> +                  char *buf)
>> +{
>> +    struct kobject *kobj = &kdev->kobj;
>> +    struct xe_tile *tile = kobj_to_tile(kobj->parent);
>> +    struct xe_gt *gt = tile->primary_gt;
>> +    u32 val, mbox;
>> +    int err;
>> +
>> +    mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, 
>> XEHP_PCODE_FREQUENCY_CONFIG)
>> +        | REG_FIELD_PREP(PCODE_MB_PARAM1, 
>> PCODE_MBOX_FC_SC_READ_FUSED_P0)
>> +        | REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
>> +
>> +    err = xe_pcode_read(gt, mbox, &val, NULL);
>> +    if (err)
>> +        return err;
>> +
>> +    /* data_out - Fused P0 for domain ID in units of 50 MHz */
>> +    val *= GT_FREQUENCY_MULTIPLIER;
>> +
>> +    return sysfs_emit(buf, "%u\n", val);
>> +}
>> +static DEVICE_ATTR_RO(vram_rp0_freq);
>> +
>> +static ssize_t vram_rpn_freq_show(struct device *kdev, struct 
>> device_attribute *attr,
>> +                  char *buf)
>> +{
>> +    struct kobject *kobj = &kdev->kobj;
>> +    struct xe_tile *tile = kobj_to_tile(kobj->parent);
>> +    struct xe_gt *gt = tile->primary_gt;
>> +    u32 val, mbox;
>> +    int err;
>> +
>> +    mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, 
>> XEHP_PCODE_FREQUENCY_CONFIG)
>> +        | REG_FIELD_PREP(PCODE_MB_PARAM1, 
>> PCODE_MBOX_FC_SC_READ_FUSED_PN)
>> +        | REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
>> +
>> +    err = xe_pcode_read(gt, mbox, &val, NULL);
>> +    if (err)
>> +        return err;
>> +
>> +    /* data_out - Fused Pn for domain ID in units of 50 MHz */
>> +    val *= GT_FREQUENCY_MULTIPLIER;
>> +
>> +    return sysfs_emit(buf, "%u\n", val);
>> +}
>> +static DEVICE_ATTR_RO(vram_rpn_freq);
>> +
>> +static struct attribute *vram_freq_attrs[] = {
>> +    &dev_attr_vram_rp0_freq.attr,
>> +    &dev_attr_vram_rpn_freq.attr,
>> +    NULL
>> +};
>> +
>> +static const struct attribute_group freq_group_attrs = {
>> +    .name = "freq",
>> +    .attrs = vram_freq_attrs,
>> +};
>> +
>>   static void tile_sysfs_fini(struct drm_device *drm, void *arg)
>>   {
>> -    struct xe_tile *tile = arg;
>> +    struct kobject *kobj = arg;
>>   -    kobject_put(tile->sysfs);
>> +    sysfs_remove_file(kobj, physical_memsize_attr);
>> +    sysfs_remove_group(kobj, &freq_group_attrs);
>> +    kobject_put(kobj);
>>   }
>>     void xe_tile_sysfs_init(struct xe_tile *tile)
>> @@ -77,6 +143,14 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>           drm_warn(&xe->drm,
>>                "Sysfs creation to read addr_range per tile failed\n");
>>   +    if (xe->info.platform == XE_PVC) {
>> +    err = sysfs_create_group(kobj, &freq_group_attrs);
> indentation
> Also we are using two different methods of creating subdir in a single 
> file. Should be uniform
>
> Thanks
> Riana
>> +        if (err) {
>> +            drm_warn(&xe->drm, "failed to register vram freq sysfs, 
>> err: %d\n", err);
>> +            return;
>> +        }
>> +    }
>> +
>>       err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
>>       if (err) {
>>           drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, 
>> err: %d\n",
