Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF26AC7EE2F
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jun 2023 15:12:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B395810E2A4;
	Mon, 12 Jun 2023 15:12:35 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D07E10E2A4
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jun 2023 15:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686582753; x=1718118753;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sj5gloPoocEUZlK7ThuaeORdXPDEfsGxThIl2NyNFsg=;
 b=TBsmLwWZT6aMAK7XLwMt/kJWBM9pmI8masCmbFNYFPq/1RT4j52JF7Uo
 R5ERmZoctn0JuHn62zCWh7SuR+89LZXJM+4mu0CVyj+y35pzC3Dw4qbvx
 KtCyM7fytKZgJYdzAjeIepviZcONba5SOUWQmkjAgiseKcvamyoDN+Az7
 nrlKHd4R1MfjQJ7b5HJ/NFrZY827DeN6x2QqB0+CAki2PXJfaoc96T8G8
 9FdV6iavSfYVfhJntPo7PB09N2ksYQoUKgF/AMyqkB4ShG6cD+jRjnWpH
 LjwsQpm8+QmAWsJTNI8wRrLJaL1Hdq/ViCQFeuCHF/XHuPeyjUbjwD6Oz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="355568269"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="355568269"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 08:04:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="1041379267"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="1041379267"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 12 Jun 2023 08:04:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 12 Jun 2023 08:04:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 12 Jun 2023 08:04:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 12 Jun 2023 08:04:52 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 12 Jun 2023 08:04:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I1xv5SLbGEp4DkIVbu2j9pJoNGswJypHpyoLDwceOc56kzaYu5QC1ny2U5bDLdCF/haq/+QoqLFk+VeBC48nOyN50gY6saCjxEev2UNrll3ufjGGNRu6ZjupCv3zfSq5yJ9K2yyaN0BtxA0itO2JpLH7jm79USH4/tWb/cuClUMR15BWdLYWfpSVfb1GE021O6XgNY3n4RTEFxCir+epj4KmLHG/A628feDQn1gxjOTxBGkLtuZLRjsKCDQBHEOu4QPfuCx54FjPenppTITIWejG/lFUZ2aCXyf/MX+9Q7yUqiEK/+87aAabKg7QSke1FUVRlYINM4TFojkUq+7crQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gP4Hfjb0cX/3/WVyEblUuuEU1A/ulUMeqwbJmJUe3/s=;
 b=EyFjR3V3+cGJ4ndMzVRW56Ryary5QegLiWajJVTCHeB8oj/0lgJ06/V9hB37UOwIW9fOCC5x8dG1wcUsCgJvXi6l+3qDmpVsSD9y+Ko5el4PcTsHcyfH3x+ifEjEkzzvbk5RxErq8kz4ez0Ez9SCjLa3GiKgzivXyzsoqRcTQBOxb3z/s4/kVjVUm2RAilaB/a/zJtcDZjw0hCOTe1Ugr91NdUQPrGcrotGH1ZVoZ0l3dMqfoUL8Ayx+hrbCGyFuxd+7u3tAmzEDgJ19cSjYT4PxR2Ez8+oQuuZKgI+/xOsLRFgGrt1oLRJVZJCFwG8BTBGbzuMSP5eN3TUamYthrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by CO6PR11MB5587.namprd11.prod.outlook.com (2603:10b6:303:139::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.46; Mon, 12 Jun
 2023 15:04:50 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff%4]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 15:04:50 +0000
Message-ID: <bfa7f6cd-3cca-7c3f-413b-25f8c50b41dc@intel.com>
Date: Mon, 12 Jun 2023 20:34:42 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230609185249.2032370-1-aravind.iddamsetty@intel.com>
 <20230609185249.2032370-2-aravind.iddamsetty@intel.com>
 <IA1PR11MB6418E0AF6621EE62DF042E06C154A@IA1PR11MB6418.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <IA1PR11MB6418E0AF6621EE62DF042E06C154A@IA1PR11MB6418.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0040.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::18) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|CO6PR11MB5587:EE_
X-MS-Office365-Filtering-Correlation-Id: 11bb7087-013a-414f-b7ff-08db6b565e91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q2KW0ABUHP1ALwWMuFe5qXNdfTQHfp0NWXCtAX1h3HIZ2WCEyB4MtBP8sRROUdQTKpaLAstvMXfvUfp/a0jkNQcPfskXTVo5le/V2AQrJcRuMbirLxdfWDFD/sTb4l0cpshjH2IceDn6XLHfm3lfLFdj99RxvVKxm4D6Wgc6b6JIBcxOgawUyxd/N+bKEUknUIvD2byLlvxfthY/iN8yMhkd8hzM2qO7bM4HcJuDeqlopTFDdN0gxVnN5/AGma43g+V8cnkfYVcgffe6Cp/8hwEQv5QEhnaKKwgaXMDyiz0L1Zj2Od++RyfbgXNInMbWW8eYDCi+AUbWd+jG0daLAgO4rtabLKHCDN5IjXS8AUxGy6H/LUpUyprdapuBYJnuhMM5QkUHBTmmC2FFBMjT+0BLZEWl5KhM008oq4xkB56CxQkZLW18ePr/sY64HEXa/ds6Z53bPKptIWCkUvYyhe5mSb04NDRBO3ENWMPx1IDgilCs2zYcx079QvUsEitJ+JEyCA/LH/HLua+dexE0fQrA213c8ZualpWYYMMK0W0POU2k0LYYXrjCE+ZTsd6SjLd4Trk8MMnc6k9lghprM0/voACnancGiPtYOCw+6TCMwhwqKn+yrzAjrAIqDfR2o205xMR9J+nOmyRXTOGEJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(396003)(366004)(346002)(39860400002)(451199021)(6666004)(6486002)(478600001)(6512007)(26005)(53546011)(107886003)(6506007)(83380400001)(186003)(36756003)(2616005)(38100700002)(86362001)(31696002)(82960400001)(4326008)(66476007)(66556008)(66946007)(316002)(8936002)(8676002)(31686004)(5660300002)(41300700001)(2906002)(110136005)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnFHWUkwcUs0bE13MDdOUW1HUFI4czlzaFBhK1Jvc05VdzQ0VVdzUFdaNUJ2?=
 =?utf-8?B?RU9ueGtRRS83NXNGK3hlU3c5VkRjUmFrYjRRaWZYM2dlL2hCdU1zZWZMYk9w?=
 =?utf-8?B?TVBPRDg4dmNLZTZVNk9EanVZNCtHY2x4SGorL0wxbVovNmR2UEdOcm9vOThC?=
 =?utf-8?B?YTlVY3cydzRHeVlwNkd0K0JwOWRUVUtzS0R5cXljWU11N1d0cFpHWlNXalRS?=
 =?utf-8?B?c0l2eFBUK08zQXpFR1VyUEZjcVZ3QmRvbHNYVTNiTjlrUUxvZjBmL2wzeXZn?=
 =?utf-8?B?L3pwT2VGcGZqQ0MzUGxwY2VoMVMxa3hwV2srcE91bnRnMXJGaVM2ZnJ0azhh?=
 =?utf-8?B?dGY5ZEtIbnZYVVhpaHpKVkc0RUxoTTREZGYwbjMyODV0ZVF5T3VwdzMra0NY?=
 =?utf-8?B?ZXl5M1FiV0lwNFVoNTF3endRVFlsR0Q5M05nNkFDUWQxWHQydmNsdDl5OGVS?=
 =?utf-8?B?KzFzSjlRM0JzWGZJMEVYRjBBU3J3Ry9lQTVKdHR4dzliNkd4UG12ZE1XYThp?=
 =?utf-8?B?Zit1NG5IRmI4ZGZBTDYrWmYwRUpVdkVyYUJjdDllY3pXSjRJMnZ6Qng3UVJU?=
 =?utf-8?B?TVJMM002UGE4d3A0NktpRFU0ejM0eWovSVNVbWlIckRnNTNpbkd0OEEwZkNj?=
 =?utf-8?B?SVU1d2p2NFhyeDRhWXF0MmY1bk5QNzNtWjIrOXFONWIzaUJKTVhRSklIU3Jn?=
 =?utf-8?B?STNKcldvNDFsM1gzN2swM3lFREVKZUJWR1F3WTREb3JIejdqTVRnNzd3a2JT?=
 =?utf-8?B?MWxJZ1A5NWtMckU4ZFhZRWl5Y28vUDF0UnhmNXl6UFZ4NzVsYU9mNXlsS0xN?=
 =?utf-8?B?WnV0WmVqL2NMbkhGY1k4a0dUM2pIcTBHK0Vta3dOTlNDWG5Id2poMk44ZWti?=
 =?utf-8?B?Sld4VzBTM084R21FdHNyanowUzJ3MEN0U2RuUkZUZER0ZFMzMVhxdEhNTFM5?=
 =?utf-8?B?Sy9PRlc2UjRSNi95UVVOb3FsaG0rQmxLRE9aYjVVOVhDQXg4bm9OR2wzU0Fv?=
 =?utf-8?B?MmNTWnJCbWxHRmlpRzNwMWw0aFlXT09XZkFxRXBjcXlPUlljSjFTY2NVcllS?=
 =?utf-8?B?dzFqRStuTG1JMGhMaEc3MHAvM2RLUmgzMHU4WXd0SDZJVFlvR21HSVNBVTQz?=
 =?utf-8?B?bUVBVnljWER6NVZSL1pneGZsaTFHbU9UYXZTcXdoMFJ2dUVodGJIbEhPeDJv?=
 =?utf-8?B?ZXp3OXU3U05kQjd2VktweGhtWWVSS0xxZSs2YThIUW94L3dqYTVrUHc3VXJ5?=
 =?utf-8?B?RGZzcFlJakd4bExRakFPbjZRTTFaMWRwb2lxQ2d6bWo5SVU1Z3lEMHlYOVF1?=
 =?utf-8?B?WXJ1eXFVQjZhbS9MOER4N0JvMjB1QUl6ajJGVFBkYXdLRnZDZUZIZVg1UmNG?=
 =?utf-8?B?cnJ2ZWdSd2RUc1lSSDhhMFJ0SUdYeVRXWDFDVHMzYnFnVU5BWW9HbDhNbytG?=
 =?utf-8?B?Y2F2TmtMdGhxSE9hT0lPTHc0ZnlZQVNCTWE1d25iTXRlcUlyb01ZNjZkbHdw?=
 =?utf-8?B?R3ZFd0dJbm9mVlV1UkkxcHp1S202cTVNSjVpMlkxRUtjQVRtclZNQ2tQUkl1?=
 =?utf-8?B?cUJOK1dyWnpFcnhyY01XVUtzdkdydG85ZnhaZ1dEaEN4ZVN0dzcyZTRMT3Qv?=
 =?utf-8?B?bTlDYXBiNlUyeWozK2Jra3pYc0FETmtPS0FZdDhWU3FJWnppODBodzJvN3N3?=
 =?utf-8?B?ODR3UDJNUXhYR1FBbnFQc3ZaNUZ3YS9rT3BaREdPMlo5ejlqVG5ucmt2VXd6?=
 =?utf-8?B?VENyeWZtaXFCVnV6UWMrWnVBcytOaTRVSE9zbm1na1VXdTQxRkgzZllKaXZZ?=
 =?utf-8?B?VnBmY3dydGR6aHkwTmtwMW1qS0NDQjFYUjVFNUpmS0xqMXZhNjZNN1VLQXdJ?=
 =?utf-8?B?bUhzOEEzemhsZmRDZWwyUUlPWGxlSmw1NzdHTmV3bWRqZkNZaDV4RGR2d21m?=
 =?utf-8?B?TzNCREk2bWMrY2dtK2hoYW1JZllVd0RVUXVvY0d4RmVGZnVmL0UrRTZzanR1?=
 =?utf-8?B?N3pvVEN1aUVQUWhhWDJXZkFoZERGZC9RWWcxTlBkVElubFhYbzZVM1FtdW4w?=
 =?utf-8?B?dzM0L2lRcUE0ZjJReWZJcEJxSyt4VnJKc3ZUSjkyZTVDZjROMm85TmRmSW55?=
 =?utf-8?B?bkFkblMxN0FCTFB4RVJxQkpGbVlrV1Ercnp0UnNMU1pKRXF5V2ZQUjBQMWlQ?=
 =?utf-8?B?clE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11bb7087-013a-414f-b7ff-08db6b565e91
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 15:04:50.4512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: snBtERN2hWnkqFfLNW8ejtVY8GBUm5qskPlAaEgoC1JqhbtDpNXLEL3smiczMdm30EfkxUymMgn7AOhRsp89fb29bLoZXYgucYIe4b+ZXtE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5587
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/1] drm/xe: Fix stolen memory size
 calculation
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Auld,
 Matthew" <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 12-06-2023 19:59, Ruhl, Michael J wrote:
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>> Aravind Iddamsetty
>> Sent: Friday, June 9, 2023 2:53 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Roper, Matthew D <matthew.d.roper@intel.com>
>> Subject: [Intel-xe] [PATCH 1/1] drm/xe: Fix stolen memory size calculation
>>
>> The stolen memory base should be derived from GSMBASE or
>> FLAT_CCS_BASE_ADDR when flat ccs is applicable.
>>
>> Fixes: acf067c2f5a5 ("drm/xe: Implement stolen memory.")
>>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 7 +++----
>> 1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> index 21ecc734f10a..29ce69bf8200 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> @@ -54,7 +54,6 @@ bool xe_ttm_stolen_cpu_access_needs_ggtt(struct
>> xe_device *xe)
>> static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr
>> *mgr)
>> {
>> 	struct xe_tile *tile = xe_device_get_root_tile(xe);
>> -	struct xe_gt *mmio = xe_root_mmio_gt(xe);
>> 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> 	u64 stolen_size;
>> 	u64 tile_offset;
>> @@ -66,12 +65,12 @@ static s64 detect_bar2_dgfx(struct xe_device *xe,
>> struct xe_ttm_stolen_mgr *mgr)
>> 		return 0;
>> 	}
>>
>> -	/* Use DSM base address instead for stolen memory */
>> -	mgr->stolen_base = (xe_mmio_read64(mmio, DSMBASE) & >BDSM_MASK) - tile_offset;
>> +	/* stolen base should be at end of usable vram */
>> +	mgr->stolen_base = vram_size;
> 
> Hi Arvind,
> 
> The stolen memory in i915 is not calculated like this.  It uses the DSMBASE for the offset like the
> current code.
> 
> The lmem size includes the CSS sizing, but that is for the LMEM memory region.
> 
> This is calculating and creating the "stolen" region for use in kernel space.  If the offset includes the CSS space,
> won't the DSM usage be in the wrong place?

I didn't realize until you mentioned here we wanted to carve out usable
stolen in which case what I did is wrong, makes sense.

but why is that we are doing only on root tile even remote tile has
stolen area right?

Thanks,
Aravind.
> 
>> 	if (drm_WARN_ON(&xe->drm, tile_size < mgr->stolen_base))
>> 		return 0;
>>
>> -	stolen_size = tile_size - mgr->stolen_base;
>> +	stolen_size = tile_size - vram_size;
> 
> The tile size was picked to work with devices that do not have tile information (pci_resource _len used).  vram_size
> can be wrong in those instances.
> 
> My original patch set used the vram_size, but that was not accurate for this usage.
> 
> Are you seeing an issue with the current code?
> 
> Thanks
> 
> Mike
> 
>> 	/* Verify usage fits in the actual resource available */
>> 	if (mgr->stolen_base + stolen_size <= pci_resource_len(pdev, >GEN12_LMEM_BAR))
>> --
>> 2.25.1
> 
