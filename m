Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F6EC4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 03:23:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC1910E419;
	Tue, 28 Nov 2023 03:23:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B7210E419
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 03:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701141824; x=1732677824;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gfgWp3fqTNWLqfGNP40jKJitt5H0uhDiCl31/wMLVyM=;
 b=BWnCUowWR5DZ5XURC2/lVEu/wv47NAqtQ3xHyYVpmPKSDzo7XFY+hG68
 MggiZFpRBikOGF7E5bS9/FrjK5qFJSY8YKBGYe/oQJLR8s9FH1Ksq1PW0
 uB3JuAL+DnK1g6Z3DAyRDPiqrQJD1zqprHV+ISmwkdB6cJFAUpZagfZzJ
 d2uP9ApttmO9BMETsWJei1zaA8ryT33bmPcopAoLDuI4mr6lNtu+TjLAT
 gjb1y8j9j5VSIt02ceFrCtgsJCOI09hHDdqmNwBw0/cTHk6NhYHmiiaoP
 3JRJDR9mynxC+WHzHhqgBfCRPM5RScTKLxIf0IlK86pvgue+hYFRWGYH8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372213789"
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; d="scan'208";a="372213789"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 19:23:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="768396265"
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; d="scan'208";a="768396265"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Nov 2023 19:23:43 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 19:23:42 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 27 Nov 2023 19:23:42 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 27 Nov 2023 19:23:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GuLumcinCqiSTU4dV7Wi8IXbPU8K5YjoMdyPpuao1xXjPqefNM+WHmJw/v9Iw25qLYO6hyFCCTYHrs91pHvAKsYMW3Nzxe8JHc9nTMMewQqos685rIwGjvsfF/9LpZan7vgDLItg1tjWfNQE+5isZPGbCWUaj1WGQRRPOstL42SfjhRAk/nsNs7pBbhRQ682hgKnd6EvuvgI6ouS/AzaGYKOo3ZTEya8YNlw/cdxCWLnxj+GfaZJv2DAUgqILsf3jL/uJY3xWbYozGKTM+ubMLSmfBuyo/aZsOA1IEG41dx7Sm0tPs3yX0PYByJ7XROjLK1sbtyPwPUuD4e6aEmOkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eHjAHdVUmyLK5F7TFTGE8xZVUNkBro3RnAUtwUUzBVo=;
 b=nKr77qFEXwZYlBLOmoNsVNzChO1axZ2GjAEr6TZzTA2FBgOhXod+aenh7Cezo0cgJwFrh3QNmoo3ooeX2Y1mcSLSwRiLl/y6h6IJ1kzAib7PqUsUuBtC9ouMOe4OATBy3/DfIqimrn+Dmm3IhEOCrHR/S+KijPmIVlf1t1B2nWGHTGQhw4iO3px6Ahf1kylHUD/ZpQAYzE3xG+uGnOaBAkDJERl/8IDCqRhdDmkvG14X2m6Ef7N6LP4Jv76vYj7KqvGwy2NCshPaAoo54o7PgmTvMrZx2Klyvby1LNAZUQHEtcQPamdwTVMJs7j/u8p71r8XFu506mSf+h9eXmgU9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 PH0PR11MB4824.namprd11.prod.outlook.com (2603:10b6:510:38::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.29; Tue, 28 Nov 2023 03:23:39 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 03:23:39 +0000
Message-ID: <fa857f65-ac95-42ed-a571-5d427ebf5ca0@intel.com>
Date: Tue, 28 Nov 2023 08:53:30 +0530
User-Agent: Mozilla Thunderbird
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, Riana Tauro
 <riana.tauro@intel.com>
References: <20231124122755.91279-1-sujaritha.sundaresan@intel.com>
 <20231124122755.91279-3-sujaritha.sundaresan@intel.com>
 <ea1d4d72-b609-4181-bb26-9e0c89ce8dcd@intel.com>
 <87edgbywye.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <87edgbywye.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1P287CA0024.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::25) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|PH0PR11MB4824:EE_
X-MS-Office365-Filtering-Correlation-Id: 25c49e63-ab4a-4c71-698c-08dbefc169c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ce5OFw3I6EWSX8xrKYdCNW+/Q/ye29KBU2UyprOOuNT5Phom3d3nAZ/Qz3xRQzsoqpUoYL3oD49HrW5/NFTl9tyhU3f/bl37hLOI4R+B21FbFJolMiqeTHySGSgxkJuy4xpA27wJ0olmjQ4Nu6UkZn+cA92PG9OvKNCuAEPZ3I2YFaPSAWXb9VWIuRc82GrnweVLTXRmV+qqA0GyKqEw95+uBQjoTDSHeZX/7z0pSoqv+76wQfVvsGrHU2Pa35e1wzhYs2e+gTY2u7HN6PqotPmrsqR9Dt2pxDOY5hZcM+80G9nsNRMt9+2r2LzOwiub48rjTyb/7TgQ3UNdJPwXhiKIS5s5YhBdvFEOsUJWkaM6FtPrrXyJZXG6PsdEwk5zwQsvp57E4CiXedaoZq8BUEjk3u9jD9SQtpP39Vu/JuThw/hd0+YxtxCSQ88uOP8k1ZTK7x531PbhurToHM2tJDDGrVfbTdYNAhzxwiJ3GAqB1j3Nt5jXCsGON7QafIPAviSIlZS94g0pxZXFQ4PawvetQCy9mBuImbjc9nEvkGfEBu2OrSdBLsxzt+MnZnyny/hgiOfyswI9lEEZxoArMVAJtgaHHEi6Z46oilRDi49MB4gWraDIoBO/9Wz53Lm1xM/zhWLzkgFImaV5sNEPBZ5Hb7eCBdH/x2D8SeqQGfci5V6RC6jEiAX2azpn/0MM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(346002)(376002)(39860400002)(366004)(230173577357003)(230922051799003)(230273577357003)(186009)(64100799003)(451199024)(1800799012)(316002)(31696002)(86362001)(82960400001)(38100700002)(36756003)(478600001)(6486002)(66556008)(66476007)(6636002)(66946007)(110136005)(26005)(6506007)(6666004)(2616005)(53546011)(6512007)(107886003)(5660300002)(2906002)(4326008)(41300700001)(8936002)(8676002)(31686004)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGtXRGF4SC94a3NOVGVJOGdFODRxWXNPQjNtbmIvYzZDQmowRGxuZTErOW5O?=
 =?utf-8?B?SWxrZUdkWUdtU0F3ZXpvL2xwQjdQbE5leXlPWmR5d3VWeFpSaEVXVGdVVC9G?=
 =?utf-8?B?aWxVMml6Yjlid0M2cXJTcjZ5UVk4Y2wzakR1OFVheEJCTlpQTFUrTmpNQk4x?=
 =?utf-8?B?aVFzU0hGUnZ0RGZIdWVrNHg2ZUhYN0x1NVhJVXljWGpuWktndGU0QWtoTEl5?=
 =?utf-8?B?MTFhWVZQeUJud2MrUnRxSWdkM3hickdJZSthWVFXRG9CNkxOQnBVSEgxOXdI?=
 =?utf-8?B?NjZoandlSnJ3b21PQXBxVU8wSVhyeWl6YitkNVU4Y3JHelg1YVE0bXg5VVZk?=
 =?utf-8?B?NXRBcW4ycVNXemdwbm9mVzAwZXJVQ1ROS3BvZDJiNFl4eU44aGVBNXdMcEN4?=
 =?utf-8?B?UC93eDdrYyt3ek9IdHJ6ZW5NUzFvZHpTZ2V4Z3JtWi92R3RRSEtFTWd0VVd0?=
 =?utf-8?B?bnNiSlI0YUpabDhpZVJlbUw0Ynk2MlNWc3VZTDk2UmwrUGp5R3NXM3dWQkZq?=
 =?utf-8?B?ZWUzbWVSWi9IV3FUMUJnZlVPRFNqNkw1YTRjZ3o2Y3AzTW5OMzhSbkZwL2lq?=
 =?utf-8?B?Wm1CdkEya3NjU1lLL202eFJ4LzVLaGt5U3NiMnpoV0I2V0k5U2NXZGtHMndm?=
 =?utf-8?B?ZS9FTnFDYStZVE14TDdvdmw5eklIRlpCZlJiSmtYYnIvUy9kbEFEL0JIamRV?=
 =?utf-8?B?Q1NzVndibUMvQWg4YWdrSUhHcXlZVGdIOU5uMGg2VjUwNll2SkhUNVJOZ1R1?=
 =?utf-8?B?Ni91L2FaMzIxcXZrSU12d3NNZnpPRnRtQ3VUSVVxMDVJYkJWUUFwMkY4Nytr?=
 =?utf-8?B?UFVnYnJ4SzlCZ3Z6c2tFS3o2T1hwTTB5T2poZHRSS3pXL1M0SXpDcE5rM3dZ?=
 =?utf-8?B?K2pXUkNXQ0tnamZxT2tMeVBlZXBMcE53TWhQWGJ3T2gzNU9HUXVUNGY3SU9H?=
 =?utf-8?B?TW5ubjExajdQYjNLejYwcWFhL3VUYWNQSUtYSkcyUUlVbjU5djNMdlliQWJ3?=
 =?utf-8?B?djdVcHh2NWptRGpWVkJrSWRlZjMvcGZiSmpycnBXc0hOcWg2UkVNL1djMU9S?=
 =?utf-8?B?ekpoU2RsVWxCRnNDcDZuUzE2eWoySkkxQ0pGY1M4cHFDd05keUpXOG9LbUF1?=
 =?utf-8?B?SlloMGp0N3BzRWVvMEZaYlN3aGZYL3c0UTF2dUhVVTFDQ1RrcVpZWTN0T2s0?=
 =?utf-8?B?VjZRMFArVktQbjJaTkoraWQ4RnVrRktVclNKY1pvOTlLY1dmNm1hZFdENE1G?=
 =?utf-8?B?OVd6d0IrTVB2SWxxTjlHVXg4NDVFdEtuVitXdENSNFMrSW5nbGl3RE8zdkdz?=
 =?utf-8?B?UUxpYzYxWkw2cWtjWURXWldLcFFzMnJxczB0ZEtuWU5JMXFLM0RRa1E5VjRm?=
 =?utf-8?B?c1VWRlY3bEJuc1RqSExEeis2RjJ6V1lpZ1BFcU5BNTIwS1haU2ZhR1A1N09G?=
 =?utf-8?B?aGxoSm15NGhqemovL1l5eXFjQVN2SDEwTmpRUS9rWE9qc2NHTmhDbEdjZ3Jq?=
 =?utf-8?B?cmJFb2dBUEFHaUt3OFpxN3hvMVlnQzRqMjl3SnI4VGduODYwZzROZnJzbTlB?=
 =?utf-8?B?NzJUZjdkcTJwKzFqMmlZZnFBRS9NMWFveWxyZENUYzFhZ0liZE94dURJUXNT?=
 =?utf-8?B?NXl1NTZROTJnbEhkVlBZaFRKaEpKQXo5Tm5EOTgvQmV5RlZIT3NBWlZPVjBq?=
 =?utf-8?B?bUJZcEpwTytFelBOb1FyWE5BakhVb1Q4d1E5d04xVld5VkhNZ00vRTVZU1Ft?=
 =?utf-8?B?MlU2UWs5d1pCTGxoUnIwS25PNkNTQXc5WlFod0wvL2tEVG9odWlCYWVubGhX?=
 =?utf-8?B?U3dpSUNqU2M0UTEyUjRidGVRMzNNckJaanRFY215cFpvM2E5b3RNbVlzZ3Ny?=
 =?utf-8?B?Qk5QSU9NTVVJcnJia0Nxb0FJdkpsalQ4eHpoQUZCK3dwRDdkQ3huZEtJdC9z?=
 =?utf-8?B?c05lK2Q5c0x0RTREaTFIUnpzbG93KzErTmVLcHFYV2J0dG9UODlETVlZdHdi?=
 =?utf-8?B?WnlQamNoVXRLMW9KbzhuTnNoZGNEeE9FWUtsVE9wa00xYmYxZGloQUtheXZr?=
 =?utf-8?B?eE53VDZFa2ZpcmR0NFNIOHBMTGpRSkFJMUNHTXVzaFVaQjdLa3hCUFpKNGVs?=
 =?utf-8?B?bWtSaDIwQmVFN2h3TGY4Sk4wY2hlL3cySWxWYUtBcGs0WkE0b2xzSXdhcldj?=
 =?utf-8?B?M0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25c49e63-ab4a-4c71-698c-08dbefc169c2
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 03:23:38.8392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QkgUBE5J0gK/CW5eLdec90iHFX2kCFVA0djSqSCmwyd51RryrcVxxZBWhJASjFIqIUUl8V80fhnUOvsZyk7GKjfKVwLr57jCEUvhQOC/lFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4824
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
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 11/27/2023 10:06 PM, Dixit, Ashutosh wrote:
> On Mon, 27 Nov 2023 02:00:10 -0800, Riana Tauro wrote:
>> Hi Suja
>>
>> There is an error on module unload.
>>
>> [ 1042.525614] ------------[ cut here ]------------
>> [ 1042.525622] kernfs: can not remove 'physical_vram_size_bytes', no
>> directory
>> [ 1042.525641] WARNING: CPU: 3 PID: 2234 at fs/kernfs/dir.c:1662
>> kernfs_remove_by_name_ns+0xb3/0xc0
>> [ 1042.525965] Call Trace:
>> [ 1042.525970]  <TASK>
>> [ 1042.525976]  ? __warn+0xa5/0x200
>> [ 1042.525986]  ? kernfs_remove_by_name_ns+0xb3/0xc0
>> [ 1042.525996]  ? report_bug+0x216/0x220
>> [ 1042.526011]  ? handle_bug+0x3c/0x70
>> [ 1042.526018]  ? exc_invalid_op+0x18/0x50
>> [ 1042.526025]  ? asm_exc_invalid_op+0x1a/0x20
>> [ 1042.526033]  ? __pfx_tile_sysfs_fini+0x10/0x10 [xe]
>> [ 1042.526275]  ? irq_work_claim+0x1e/0x40
>> [ 1042.526288]  ? kernfs_remove_by_name_ns+0xb3/0xc0
>> [ 1042.526298]  ? kernfs_remove_by_name_ns+0xb3/0xc0
>> [ 1042.526310]  tile_sysfs_fini+0x1e/0x40 [xe]
>> [ 1042.526515]  drm_managed_release+0x117/0x250 [drm]
>> [ 1042.526626]  drm_dev_release+0x49/0x60 [drm]
>> [ 1042.526723]  release_nodes+0x59/0x190
>> [ 1042.526731]  ? lockdep_hardirqs_on_prepare+0x136/0x210
>> [ 1042.526739]  ? _raw_spin_unlock_irqrestore+0x51/0x70
>> [ 1042.526752]  devres_release_all+0xf8/0x140
>> [ 1042.526761]  ? __pfx_devres_release_all+0x10/0x10
>> [ 1042.526779]  device_unbind_cleanup+0x16/0xc0
>> [ 1042.526788]  device_release_driver_internal+0x10d/0x160
>> [ 1042.526799]  unbind_store+0x98/0xa0
>> [ 1042.526809]  ? __pfx_sysfs_kf_write+0x10/0x10
>> [ 1042.526815]  kernfs_fop_write_iter+0x1bc/0x260
>> [ 1042.526828]  vfs_write+0x553/0x770
>> [ 1042.526839]  ? __pfx_vfs_write+0x10/0x10
>> [ 1042.526850]  ? do_sys_openat2+0x266/0x350
>> [ 1042.526867]  ? __fget_light+0x9e/0x100
>> [ 1042.526882]  ksys_write+0xc7/0x170
>> [ 1042.526889]  ? __pfx_ksys_write+0x10/0x10
>> [ 1042.526895]  ? mark_held_locks+0x24/0x90
>> [ 1042.526906]  ? lockdep_hardirqs_on_prepare+0x136/0x210
>> [ 1042.526920]  do_syscall_64+0x3c/0x90
>> [ 1042.526929]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
> Thanks Riana.
>
> Hi Suja,
>
> Let's follow the steps below to test these sysfs patches before posting
> them:
> * Make sure sysfs entries appear in the correct directory
> * Make sure read/write works as expected (using cat/echo)
> * After doing these things please unload the driver and make sure the
>    driver can be unloaded without crashing. Then reload the driver and test
>    again.
>
> Check dmesg after each of these steps (leave 'dmesg -w' running in a
> separate console window) to see if there's any sign of crash or kernel
> oops.
>
> Thanks,
> Ashutosh

Hi Ashutosh,

Thanks will add the unload testing to the rotation. This specific one 
should be fixed in v2, the issue has been identified.

The other test conditions are clear for this patch. The new directories 
and entries appear and can be read using cat/echo.

Regards,

Suja

>
>
>>
>> On 11/24/2023 5:57 PM, Sujaritha Sundaresan wrote:
>>> Add vram frequency sysfs attributes under the below hierarchy;
>>>
>>> /device/tile<n>/memory/freq
>>> 			|-vram_rp0_freq
>>> 			|-vram_rpn_freq
>>>
>>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_pcode_api.h  |  8 +++
>>>    drivers/gpu/drm/xe/xe_tile_sysfs.c | 78 +++++++++++++++++++++++++++++-
>>>    2 files changed, 84 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
>>> index 5935cfe30204..edde5335bdb1 100644
>>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>>> @@ -42,6 +42,14 @@
>>>    #define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed point format */
>>>    #define	    POWER_SETUP_I1_DATA_MASK		REG_GENMASK(15, 0)
>>>    +#define   XEHP_PCODE_FREQUENCY_CONFIG                  0x6e    /*
>>> xehp, pvc */
>>> +/* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
>>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0             0x0
>>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN             0x1
>>> +/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
>>> +/* XEHP_PCODE_FREQUENCY_CONFIG param2 */
>>> +#define     PCODE_MBOX_DOMAIN_HBM                      0x2
>>> +
>>>    struct pcode_err_decode {
>>> 	int errno;
>>> 	const char *str;
>>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>> index f354c8b2bfc6..ddf5072c40eb 100644
>>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>> @@ -7,9 +7,14 @@
>>>    #include <linux/sysfs.h>
>>>    #include <drm/drm_managed.h>
>>>    +#include "xe_gt_types.h"
>>> +#include "xe_pcode.h"
>>> +#include "xe_pcode_api.h"
>>>    #include "xe_tile.h"
>>>    #include "xe_tile_sysfs.h"
>>>    +#define GT_FREQUENCY_MULTIPLIER        50
>>> +
>>>    static void xe_tile_sysfs_kobj_release(struct kobject *kobj)
>>>    {
>>> 	kfree(kobj);
>>> @@ -35,11 +40,72 @@ static DEVICE_ATTR_RO(physical_vram_size_bytes);
>>>    static const struct attribute *physical_memsize_attr =
>>> 	&dev_attr_physical_vram_size_bytes.attr;
>>>    +static ssize_t vram_rp0_freq_show(struct device *kdev, struct
>>> device_attribute *attr,
>>> +				  char *buf)
>>> +{
>>> +	struct kobject *kobj = &kdev->kobj;
>>> +	struct xe_tile *tile = kobj_to_tile(kobj->parent);
>>> +	struct xe_gt *gt = tile->primary_gt;
>>> +	u32 val, mbox;
>>> +	int err;
>>> +
>>> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, XEHP_PCODE_FREQUENCY_CONFIG)
>>> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_P0)
>>> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
>>> +
>>> +	err = xe_pcode_read(gt, mbox, &val, NULL);
>>> +	if (err)
>>> +		return err;
>>> +
>>> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
>>> +	val *= GT_FREQUENCY_MULTIPLIER;
>>> +
>>> +	return sysfs_emit(buf, "%u\n", val);
>>> +}
>>> +static DEVICE_ATTR_RO(vram_rp0_freq);
>>> +
>>> +static ssize_t vram_rpn_freq_show(struct device *kdev, struct device_attribute *attr,
>>> +				  char *buf)
>>> +{
>>> +	struct kobject *kobj = &kdev->kobj;
>>> +	struct xe_tile *tile = kobj_to_tile(kobj->parent);
>>> +	struct xe_gt *gt = tile->primary_gt;
>>> +	u32 val, mbox;
>>> +	int err;
>>> +
>>> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, XEHP_PCODE_FREQUENCY_CONFIG)
>>> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_PN)
>>> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
>>> +
>>> +	err = xe_pcode_read(gt, mbox, &val, NULL);
>>> +	if (err)
>>> +		return err;
>>> +
>>> +	/* data_out - Fused Pn for domain ID in units of 50 MHz */
>>> +	val *= GT_FREQUENCY_MULTIPLIER;
>>> +
>>> +	return sysfs_emit(buf, "%u\n", val);
>>> +}
>>> +static DEVICE_ATTR_RO(vram_rpn_freq);
>>> +
>>> +static struct attribute *vram_freq_attrs[] = {
>>> +	&dev_attr_vram_rp0_freq.attr,
>>> +	&dev_attr_vram_rpn_freq.attr,
>>> +	NULL
>>> +};
>>> +
>>> +static const struct attribute_group freq_group_attrs = {
>>> +	.name = "freq",
>>> +	.attrs = vram_freq_attrs,
>>> +};
>>> +
>>>    static void tile_sysfs_fini(struct drm_device *drm, void *arg)
>>>    {
>>> -	struct xe_tile *tile = arg;
>>> +	struct kobject *kobj = arg;
>>>    -	kobject_put(tile->sysfs);
>>> +	sysfs_remove_file(kobj, physical_memsize_attr);
>>> +	sysfs_remove_group(kobj, &freq_group_attrs);
>>> +	kobject_put(kobj);
>>>    }
>>>      void xe_tile_sysfs_init(struct xe_tile *tile)
>>> @@ -77,6 +143,14 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>> 		drm_warn(&xe->drm,
>>> 			 "Sysfs creation to read addr_range per tile failed\n");
>>>    +	if (xe->info.platform == XE_PVC) {
>>> +	err = sysfs_create_group(kobj, &freq_group_attrs);
>> indentation
>> Also we are using two different methods of creating subdir in a single
>> file. Should be uniform
>>
>> Thanks
>> Riana
>>> +		if (err) {
>>> +			drm_warn(&xe->drm, "failed to register vram freq sysfs, err: %d\n", err);
>>> +			return;
>>> +		}
>>> +	}
>>> +
>>> 	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
>>> 	if (err) {
>>> 		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
