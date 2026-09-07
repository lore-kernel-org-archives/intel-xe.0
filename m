Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5884BC79F9E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 14:07:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0958C10E850;
	Mon,  7 Sep 2026 14:07:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bdJi/z1M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F8B10E850
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 14:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788790059; x=1820326059;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jDQ/QnAbQdJjutZJTArq96J9FNydlY7LiSUw5idEVoA=;
 b=bdJi/z1MwsKQlna0irapCa+sITZFapzBBKbrxnklu0XrkKU6SQxX6PJl
 i9G+NRgQwg1Ti1EqvRNEBPsl7j7PqFlaE4k0eG/KJL85ALrB3iqCaVQLG
 1Uw6o9dMbFu+Oa9nJILZ520Ts9MV1tK+vPzTanrYsJ92RZlevFuamonaf
 3az1umuR++PyO/K7Y2cfRa8Q/StrFgrUvpqsiT8X2IuFM3D1G1Nearf7F
 ScdZF833nf5znsfcekTcH8kWFaiEL6y6dVMdoGGiFrOshf3nWm+9whi1t
 UFc0tLon+e7/8OF3AurQsayquGPfK3HUGa2cMO2hDc+pe0L9mRDcyvXxA Q==;
X-CSE-ConnectionGUID: lulwTXWmQMSVxFXLolh+6g==
X-CSE-MsgGUID: L7qwb5NkSAyo+HBqyBpwHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="111968568"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="111968568"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 07:07:38 -0700
X-CSE-ConnectionGUID: 5ZV7/a/yQB+zPgbrd43uwA==
X-CSE-MsgGUID: M2gI7X3TQzidmm+2zGvRgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="268997864"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 07:07:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 07:07:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 07:07:37 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.59) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 07:07:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aCo4h+nTEoSrn3SGmLRu79sr/3Nf2h7I/qoDmgUz+jigqmcFOw5eE10HpbOG+sNqfU8OLoyU1jah1SmhwG7sJ1EDcvHtRlsaKr+7ehvG6GbHL6JmYIveZiGl1GpKfeLAahAXXcKGB6ev8NlymwhaJFm4mrbsN0s1x3Xu5BXebLNCan4jUFMNK6ZFJ0qI4yRQpkmnVUYpcWZBDyxlDEkE3vrHG3gOYbncSZ85IeZ1fC6H0mCieBYkzoxide239yD+AJ9+xwPSWbcf06kKQ2soLbFuG82/UwaNqqSMW4xyv+jt4L/cM9f15sh60wLSpORrgWXKjOkJtPOQ7Pb1qLnUsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/LDb7twLuEOGmuTRITvNgrY+HXaFU3iTEccNhaFdFw=;
 b=uEg3RMakTDTxDwtRKd4TyoG2CniVuQlQLah+GlACwFXS+BTvvoaGR7BV3zmQn7xoj9UDWwOgZ/KdN6nqe9K+LybeIVLXEfIMVaoCYrUZBUR3OGguQQgoR4mgKNH6Ndko0WJ4cbZ7neIHuRJSCHihVRDnbOrRTnQPcMppy4BCy/WoYoDdDjjJoWh0rWgPuNNrGFavyjLu9JhkAR6PCIwL6a4nWJf2KyMRJHpo+sKnAPsBpWnpanfQChMPsP2NnoshWWhxoUYdIBOCBagoO3UcMvif0PChCws4VPvl71w7o+bojdyVym5yYvqL6xA2OEh78lXDipBQ8KNb+bqDrztGQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by MN0PR11MB6085.namprd11.prod.outlook.com (2603:10b6:208:3cf::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 14:07:35 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 14:07:34 +0000
Message-ID: <f5cf7284-f9b8-4e80-af35-aa02a99bdac1@intel.com>
Date: Mon, 7 Sep 2026 16:07:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/9] drm/xe/sysctrl: Replace FIELD_GET() with
 REG_FIELD_GET()
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <anoop.c.vijay@intel.com>
References: <20260907105313.2208003-11-mallesh.koujalagi@intel.com>
 <20260907105313.2208003-17-mallesh.koujalagi@intel.com>
 <3be73c89-0ad9-4299-8c6e-ed55120f6b64@intel.com>
 <6ea0523c-0a37-4fdb-be63-ff0f2b8d0774@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <6ea0523c-0a37-4fdb-be63-ff0f2b8d0774@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIXP296CA0036.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:36e::18) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|MN0PR11MB6085:EE_
X-MS-Office365-Filtering-Correlation-Id: c44a8ef0-da49-4a80-de40-08df0ce95d8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: IdWBxyWuDnXzfos3m62AaHJL4r/etNWYBNf21hNJzEs/OgAbP+q8+t863JuiJ8eX7IUEstUFD9iYXAWZum4d0urbVxe/6EGsACfhYzhS1XnJ7jOSAme10ajhX7E1iilSaiaybi3GofijVKbxAtLIE+iKDWsHQn8rzqJSsQTVToGgIl66G143ajHy8J5f6SpmzNOA3lPZa+tBu5hAscdOHAYxAkN0Tkr3htV0kNbN7D3/UGsoL/Rl8su88jEXft+5lfZ4eMLulBIyLotHDwTzLJk12WLzxmiHzF8SVjugJh/DGM3J1fa6k54zf/qnjJoip8Zu5sq4Z9KQudRDrE78Sl099is24G+IKrAO+9lPoPtG/VjMZ6JZ3O8cpVJtnNEvaIt632Qkjqr+mQyWliiP5qsUzsu8Z3BDz2xWM6JqcZhwAJTPCunu8UuKBKKg8JT4wSm5VXEOEabeF/NtZMwuobIqQYZBCZ0GfY7YTKO5jdDeVu1/q7DM87+bgKbyIdUeX9rkAlfCZX/o6Pvkxb1481tb8LEwt97v2lwyLEf+/kFlHzvFjfDIi3OjnS/a1yH4WsoMZkcue1pbK3CxEUMUznXQ8HsdcwGUyqdeK+q8Yjk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUoyMndSOHVTVUtjN1ZwbnUxcnJpTWFWQ3l5aldMd2VkV3FkZkZPVkQ1R2k2?=
 =?utf-8?B?V2ZxbFRDTUZMak5WOFo0TTFOdmF3a3h3WDd3M0ZoTW1abW5OVHEwVzRwZWg4?=
 =?utf-8?B?YUZCYzZnSWYvMnR3UUw1SzAvY1hIOWVmbk0wVGF3Q3RzMTRJR0ZxT2JVMTBJ?=
 =?utf-8?B?cktoMHZEYXZMaXNBN3ozWERhOFVvSDllb1ljaENTQTJ0M0JicnpiL2Y4MlN5?=
 =?utf-8?B?SzMrRG9FZHBNTUQwV2phRnRZb1lMQWtCb2tiQ0Z3SnJJcTJ3Nks5TEhuWXIw?=
 =?utf-8?B?RnZHWjAvUENuTEkyRjQ3cmR3L25rOXcvQlQ1eTd1dkJCNXZnNU5BUmNxTDBz?=
 =?utf-8?B?d2NXZHQvc3FobzRkRTgycWVYR2NYSXNmemI3UHd4cVpyNHB5LzhmSFR4bGF0?=
 =?utf-8?B?Zk8xMmxvbDFWV2FwUWh3TWV0d1dpNnZuNlh5N1pyQ0NtQlAyY29FSUlMSWZF?=
 =?utf-8?B?bVp3L1RFNlQzS3ZXbXBJVWFYNUZQOVVjZ0N1WXdNdEdYdkdNT3Q5dEtQMkZh?=
 =?utf-8?B?UlNQNkpxUC9BUDFWWW5aUWU4ZkdtVHY1U0tHVGMwSUhrZk94U2h5WlVUQld5?=
 =?utf-8?B?dVhBM0c3RTlkaGFIZVlVUGowUVN0TzlFVXgwL0NxODJ3UEd5TXJYNEJ6M1Bt?=
 =?utf-8?B?MElpenRpYmI3OCtIMFRrQ2MweElZTDJpbzVPNmhWWjBFZFhtZE9FWW55Z2VR?=
 =?utf-8?B?UzJBMFd4dS83N21rRUlONkkyNEMxM3drZEd2UWhEd2k3L3RtcU5RNlJwdlZN?=
 =?utf-8?B?V3BMN3FXQlVsYzliWjNrZGd3aE9NeDJ3TlhnODNOOHRvZVQ1RWRRWUJUM09V?=
 =?utf-8?B?L3JWRHNXM05nZGN6QlhiR2psK3RVOGtaUkM4MWRaUk8rd3RqV1pVQ0o2aXRs?=
 =?utf-8?B?NW5McUpLdjNRcFNjWkgvNTVSbmEzc0s1a1dwT1Z0R3ZuQlJKRkJvSHpYTzZ4?=
 =?utf-8?B?ZllPNkM0WEtKSWNScTVHYXZrM2xBVWswZEg5ZkwwZTQ2SW5DRzRYaUZKVGlQ?=
 =?utf-8?B?VDVQUWRYNHdscWhQRllXanpISHZSNDhMam11UVBUSFVGVFVqZU5ka29aL0ZM?=
 =?utf-8?B?dVBxOWJZdzBXblJ4L1ovQzRSZjl2QUZ6RTVBUDE3OTh5WnNnY3FFWWxUL1g3?=
 =?utf-8?B?b2VCdkJKUHpVeUNNK3RyRWxTVTRidHZnSUpXMFY2RjQ1QlJYbW9VMFlUd0sv?=
 =?utf-8?B?MjBkQ2ExOHByUlBTZmJ5THJhUCtzenlZWFU3eEZpL0cvRzRYRU5hYjRFaUox?=
 =?utf-8?B?SkRzYzVyL2dlNkFiYVh6QXN2TGNpVFhCRnZONXBCZkljT3BFeUczdTF0alVq?=
 =?utf-8?B?U2R6c3liRmZBUjlUTllRSEw1aEdzbFZWWktqdTZGU0pMV3dxNjlVQU44WGhr?=
 =?utf-8?B?RXdMZ2dZb2JKUjNmZWY5Q2NOWTFNS0ZWU0RnVEk0Sno4aFA1dVZHS2dudjI4?=
 =?utf-8?B?bGxhTFBqSENvOThsdkcrZnA4bDBPWGU1R0U2TzVMYkI1NGV5a050TUVuRmlI?=
 =?utf-8?B?S2ptSGxMS0lZU2didU9jWmI5S3NBNno0NGFDZzBiaEo4MFc4c2ExOXNRcEtB?=
 =?utf-8?B?UWk5SWhKd1VaQnZTUGk1eFgxRWt0UmVaVmlId2ZMd2tnamtPK0lhVDdVWVNW?=
 =?utf-8?B?VnVGU2prMmgyZW5LK0hrSWZzRC8vdlBoNHY3VzNZcmFLVmJZYjJPUVROTEo0?=
 =?utf-8?B?dUxIcDdzUjFiSE5BcmltN0ovRnQvZndrSE85YTZHTzZPKzFGdnZLcG5kRjlD?=
 =?utf-8?B?d2x1R3loOWRzUmFFZWx2a29FOS81QUg0a2Q2ZDUwc2kvNUl3U3FaaW45NEVn?=
 =?utf-8?B?WGpJZnJHai9FVldvS3gvSGNZaDlBby9XYTVzbVRia0huZ2FNRW92MC9MeXlS?=
 =?utf-8?B?MWR5TThpYXpvTnR5UzFrdU96UFIrb2VXem5FUFJpTUpsQnBJL0FmU1BHcGFM?=
 =?utf-8?B?ODZGMFNBaFZLTlpSS0NSVmYvTUo3ZWxMY0JZNE85cmF0cXVIS056VUZHWEVi?=
 =?utf-8?B?RkZnLzFvVXI3bGtYRk5Wb25HbW01NFJOZWRxbUg2LzRpemRCTTRBWXpIQzh4?=
 =?utf-8?B?SlVEMjN5Q01Ld3NWc0QzakRJRWxEaytNU1RnTHJjTjljNyt2S3ZWNTI3aFpl?=
 =?utf-8?B?eEc2SkFkRUdGc0s5SHEvZkt1NlNVd25BQng4cWdnTUFXYTd0OFE0eUptMThm?=
 =?utf-8?B?V2F2QVorRlUyM0pMc2VoeUR1YmxlMnNwSnFmejNzcnc1WFNEMXphWFhRaTBy?=
 =?utf-8?B?eFR5VitTcFNtSUNxdjd2Uzd0Z1NFTnp4SkRjSlZXMzdYSUx6QVNhdzN3UlIv?=
 =?utf-8?B?dXlBN1k5ZGFmeHd2QTZ0U2VLMGZBM2ZYVE9HZk02My9TMjZzSnhsWE12VmhF?=
 =?utf-8?Q?8Ij0Q9Wi/ivLepMQ=3D?=
X-Exchange-RoutingPolicyChecked: aOLURn33gOZ3QOCWf/lppS24tEKGPrd5Daak5eSOjIhCrs/t7ul8locqczHpEGFECf5N4F1Nxhdw60ASSLv5uuHup70xr0WCm3EKdtiJOR1DbHxO7iIfgMASZEPrpHi+hzmdWnq1wpAyNyT9eatV7/HnbUSs6BjXuQihM9gV4mLWRNffEQUvAJBvpegqb0lbyVS3vW7Ak6fOoeGFXEriTF6wL80ETEVf+2v9CoAZ4EAsxs98inJNC7wu9IRzH/epuBL1DDhHkBuKHAwea6hQIYx5jZ/u1hqgCxtKxKwfyj17HTfpBzqbbTxsLOn4wsDQ27PgYiLrSGnuTxSMmz6gVw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c44a8ef0-da49-4a80-de40-08df0ce95d8a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 14:07:34.7901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ol3XoshTRpmk4bKigtsWIsQRsbiKXJ36wTttXP2OFZ82Sq8BjzXqcnWmg5e29tIM64NodJg0PFW8ngMvHQ0U35qu8AdQpWK1kDH+gGa7W9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6085
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 9/7/2026 2:07 PM, Mallesh, Koujalagi wrote:
> 
> On 07-09-2026 05:17 pm, Michal Wajdeczko wrote:
>>
>> On 9/7/2026 12:53 PM, Mallesh Koujalagi wrote:
>>> Use REG_FIELD_GET() when extracting fields from SysCtrl and
>> nit:
>>
>> Use REG_FIELD_GET()and REG_FIELD_PREP() when working with fields
> Sure!
>>
>>> application headers. This better reflects that the masks
>>> represent register-style bitfields and improves consistency.
>>>
>>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>> ---
>>> v7:
>>> - Update FIELD_PREP to REG_FIELD_PREP. (Sashiko)
>>> - Update FIELD_GET to REG_FIELD_GET.
>>> ---
>>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 20 ++++++++++----------
>>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.h |  6 +++---
>>>   2 files changed, 13 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>> index 50bbdab072de..cdd929ebed4a 100644
>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>> @@ -24,16 +24,16 @@ struct xe_sysctrl_mailbox_msg_hdr {
>>>   } __packed;
>>>     #define XE_SYSCTRL_HDR_GROUP_ID(hdr) \
>>> -    FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
>>> +    REG_FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
>>>     #define XE_SYSCTRL_HDR_COMMAND(hdr) \
>>> -    FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
>>> +    REG_FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
>>>     #define XE_SYSCTRL_HDR_IS_RESPONSE(hdr) \
>>> -    FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
>>> +    REG_FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
>>>     #define XE_SYSCTRL_HDR_RESULT(hdr) \
>>> -    FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
>>> +    REG_FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
>>>     static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
>>>                     unsigned int timeout_ms)
>>> @@ -112,8 +112,8 @@ static int sysctrl_prepare_command(struct xe_device *xe,
>>>           return -ENOMEM;
>>>         hdr = (struct xe_sysctrl_mailbox_msg_hdr *)buffer;
>>> -    hdr->data = cpu_to_le32(FIELD_PREP(SYSCTRL_HDR_GROUP_ID_MASK, group_id) |
>>> -                     FIELD_PREP(SYSCTRL_HDR_COMMAND_MASK, command));
>>> +    hdr->data = cpu_to_le32(REG_FIELD_PREP(SYSCTRL_HDR_GROUP_ID_MASK, group_id) |
>>> +                REG_FIELD_PREP(SYSCTRL_HDR_COMMAND_MASK, command));
>>>         if (data_in && data_in_len)
>>>           memcpy(buffer + sizeof(*hdr), data_in, data_in_len);
>>> @@ -186,8 +186,8 @@ static int sysctrl_process_frame(struct xe_sysctrl *sc, void *out,
>>>       }
>>>         ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
>>> -    total_frames = FIELD_GET(SYSCTRL_FRAME_TOTAL_MASK, ctrl_reg);
>>> -    curr_frame = FIELD_GET(SYSCTRL_FRAME_CURRENT_MASK, ctrl_reg);
>>> +    total_frames = REG_FIELD_GET(SYSCTRL_FRAME_TOTAL_MASK, ctrl_reg);
>>> +    curr_frame = REG_FIELD_GET(SYSCTRL_FRAME_CURRENT_MASK, ctrl_reg);
>>>         sysctrl_read_frame(sc, out, frame_size);
>>>       sysctrl_clear_response(sc);
>>> @@ -295,8 +295,8 @@ void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command *command, u8 gr
>>>   {
>>>       struct xe_sysctrl_app_msg_hdr header = {0};
>>>   -    header.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, group_id) |
>>> -              FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_id);
>>> +    header.data = REG_FIELD_PREP(APP_HDR_GROUP_ID_MASK, group_id) |
>>> +              REG_FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_id);
>> hmm, shouldn't we use le32 conversion here?
>> other sysctrl cmd/hdr parsing/prep seems to use it
> 
> le32 conversion is not required.
> 
> le32 already removed in the code, find the change: https://patchwork.freedesktop.org/patch/717045/?series=164526&rev=1

hmm, but was this fix correct? maybe the problem is elsewhere?

today we have:

struct xe_sysctrl_mailbox_msg_hdr {
	__le32 data;
} __packed;

and:

struct xe_sysctrl_app_msg_hdr {
	u32 data;
} __packed;

both used during sysctrl communication but only one is using __le32

IMO either both or none should use __le32,
or I'm missing something?

> 
>>
>>>         command->header = header;
>>>       command->data_in = request;
>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>>> index f0d5e3d7f5e3..5a3dd14e3a11 100644
>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>>> @@ -15,13 +15,13 @@ struct xe_sysctrl;
>>>   struct xe_sysctrl_mailbox_command;
>>>     #define XE_SYSCTRL_APP_HDR_GROUP_ID(hdr) \
>>> -    FIELD_GET(APP_HDR_GROUP_ID_MASK, (hdr)->data)
>>> +    REG_FIELD_GET(APP_HDR_GROUP_ID_MASK, (hdr)->data)
>>>     #define XE_SYSCTRL_APP_HDR_COMMAND(hdr) \
>>> -    FIELD_GET(APP_HDR_COMMAND_MASK, (hdr)->data)
>>> +    REG_FIELD_GET(APP_HDR_COMMAND_MASK, (hdr)->data)
>>>     #define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
>>> -    FIELD_GET(APP_HDR_VERSION_MASK, (hdr)->data)
>>> +    REG_FIELD_GET(APP_HDR_VERSION_MASK, (hdr)->data)
>> ditto
> ditto
>>>     void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command *command, u8 group_id, u8 cmd_id,
>>>                      void *request, size_t request_len, void *response,

