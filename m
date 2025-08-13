Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D98AC87FCF
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 17:45:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9FA410E025;
	Wed, 13 Aug 2025 17:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KQ+1MgBa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271C110E025
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 17:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755107107; x=1786643107;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JvtzVigy3kjIlx1RN2fcVvVD2YHl+CXgJJ8GJzfLrmI=;
 b=KQ+1MgBaaJeHRsniWAL3GmB4MENuIrbtv2icwW/RoKMxfz4l6+hHom2F
 kHEyD+jw0XoNq0JikHilZv4EyeKRx/pLjTJU9ekgwGnCrH9xmeaSISLnH
 91LAan6OBCgy9p/NIcEyvGfdtjcyb3cBS55XJgyL1PStiFW44keWvANDh
 Q9zHFpyb7/esi3ZVeFqKLK5wTb5bwToArIQnBLa+O80EqArqearCA9Dzs
 oL5oy0suQMXqu9DoV/UWx///P4l3xA4Ub9GINond2FOrvo+0sjrs/0okv
 /R6U3gQVfO9MdVTa0vs8J5A2prhOe4vguiHv2LWl57RJbhsjXulksfePi A==;
X-CSE-ConnectionGUID: oFGcwdJEQPq8+DIMre2J1g==
X-CSE-MsgGUID: 5QcK3NRWTjShkblv5VAqdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="82849069"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="82849069"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 10:45:07 -0700
X-CSE-ConnectionGUID: ZFJ9lQGCTg2aQgjoeVwf0g==
X-CSE-MsgGUID: rfykR3sMTYq5tc2vVcgRJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="197389228"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 10:45:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 13 Aug 2025 10:45:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 13 Aug 2025 10:45:06 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 13 Aug 2025 10:45:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GE82VjFK+tUZqs14ZDVOZna5QoJihTF46jdl71WJFCsui2pWznMTRaOjHQ9K7WJaB3bQce9HnJHAEyGz4DiBmjKyFUNsHDLuKn730FJNcvZjHLz+W8KbN1fOWivOVp2p++5Me8E2bee91QfJUiZoiDreTmHRduYVM8GetjcRPRnP/QSJ6JJ/N2S+2G30G6ndGaKd1tfAJyCqDoJ99HNJ7fOfL1mhq2jv5gD1Qt8Qabo03JZEiUGvksIFI8cExJ2GhHDc4n8MQLdLXGrq8UYLHE6jGfw/HoqYH13GW0VS5lbYBUN8hwAg8Ex4DOyvyA87TK0cP/SOxLOpUdfcui1d5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OsQCRL8a59xfySq94VkRCDnLZy5HkhRNNZDhIcfPmKM=;
 b=VuD98JVNXirFQeY/S0EnXFa8SAjmYxrJCEQ5TppWmkJvZi9ciDTxmdeTn2orLhy9dUtCk9IAU3dlPsGLTV8FzmmdXuJvD6Fz4dysjCgP+CtuHGjsRSleifrDy6Kd5qUApQ6PHx+CWCTkY+gMmrWRdoh8mBia0a/HxHEqgfDFEfH8hE4eX0wDjyBjy/yC5u5ANUV9MCmX0mvzS4JH+IUlDXNrO+wJ/BNiH84GJXfr+DXwPQ/dAHe7dyp2T80gkWmEvi1NOauQywf+jIM1FC7b9/tUXo4ey/h9fWjuYkBuqSQV7gRujKHNq7ePgePTcpnxzs2+vk7R29ILtUgvgZVxlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ0PR11MB6767.namprd11.prod.outlook.com (2603:10b6:a03:47e::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.13; Wed, 13 Aug 2025 17:45:04 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.9031.012; Wed, 13 Aug 2025
 17:45:04 +0000
Message-ID: <785763f2-7d3d-4c53-b12d-62ef345249e5@intel.com>
Date: Wed, 13 Aug 2025 23:14:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/13] drm/xe/psmi: Add Wa_14020001231
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <prashanth.kumar@intel.com>, <dnyaneshwar.bhadane@intel.com>, "Badal
 Nilawar" <badal.nilawar@intel.com>
References: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
 <20250808-psmi-v3-4-a111e9f1e4b7@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250808-psmi-v3-4-a111e9f1e4b7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0179.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::22) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ0PR11MB6767:EE_
X-MS-Office365-Filtering-Correlation-Id: ed06818f-f0cd-417c-d5e3-08ddda9122bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wi9OeFNWNVJtekZsVC9sM3hzQnRRL3V6Smh4TEhGS1FYbU9Pck5OdG5qS3ZS?=
 =?utf-8?B?NDlFR3RIa21TS2pGeGUzL0NEZVVpMmcxOWdEY0NyMkE4NWlQaVMxS3dSb3E3?=
 =?utf-8?B?NU9RWVQ5N21LdzMvR21OTnAwYm9aWTBWS0d1aU4xanFQV2h3SHQ0RGdOT1lU?=
 =?utf-8?B?WXJGd3BpTHo2Zkt1a0pCdHh4WFgyd3IzSnRGcHZTUWd2Vm5ZT01YSm1HdUNM?=
 =?utf-8?B?VFRldEM0U2pNQytoZ1hFTDZCY0VpL1NneW4reWhoMWh4UU0wZUdSZzBwMCtq?=
 =?utf-8?B?WnNyKzAwUHdmTG1MNUdjTnZNWE1QVXdoa0U5VWxDcVgrVmNaZlZCWlRmejBM?=
 =?utf-8?B?dFFPdmpVeTJlMis4Z0RmMEFWMDdzWk01UTZ6dklZcjhlWEc5MWZUdnFuN29s?=
 =?utf-8?B?b2FXMjR6UnNTbHdZaWh6ME5UQ3NTMlZyZkhGUzEzMGpEUWd4dTlxeTYveWsx?=
 =?utf-8?B?SG43WWRUTWcreDhNOU5PUVRTcUJ5VHhBai9qaUJRK2p2c2JxWXluUlgyWmFi?=
 =?utf-8?B?UGpXOHJCMW1UcDBVNGgxb09sTlZleGpJdDRPdEdpMXhTY0MwNmREMTErTVZJ?=
 =?utf-8?B?d2RuNHNFaTBUUDBuYkU1cVJEUU9oOFhTUDNoWUhnLzI2TDh5MEptMkJ3MkFQ?=
 =?utf-8?B?NFdhbW9hR1Z6Q1Vta1k0Qk5ZVEVTT2JsU0Fka3BPQ0drMkxUa2lwL3hYZTlH?=
 =?utf-8?B?VVorRnZDQnJUT3lyR1lsVlVvZlQxSXBqSEJvVlRIRDRlemZQYVhDaEpMSWxQ?=
 =?utf-8?B?cFczMklJNmsrdXpYK01pd2UrTGN0MXJmZEI4UDdnV1g2aFZ4N2dXeXdqSzBk?=
 =?utf-8?B?ZjBwbHIxUjJjVStPOHN3eUZ3V25xaFhuNmhhRFQrNnRXYkNuazhMa09RTzNH?=
 =?utf-8?B?V2krb3FoMi81dVlEdUNBS3Z2WndtSC9OLzVoQmtyWnhiMURtQjVZUDJUR3Bp?=
 =?utf-8?B?UHpmSW4rd0hvY0tDNEtSYzFodDJGTk8yZ2pKVXYxZ21vLzQ1NTdYekg2V04y?=
 =?utf-8?B?Vk83SDZhd1I3OGxGcFdzbkIvQXJXU2RNQmswY2JaMmNUL0lZUUhjTVg3OTAz?=
 =?utf-8?B?Q3U3YTRQQXdhUlQxM2Z3NHpVakxOSjE4SDUyaGx2aG91OVFmeE1JMmoweW5V?=
 =?utf-8?B?VUlydTRZOU9UQ3prZG43dTNSem1wR1RLT3IrV2doY2hqVCtycGh1VXAyNGJy?=
 =?utf-8?B?cVovTjRGdFNvcUhkMmVtOUcrTW1HNmM5SmZ4ajhyUDh2NUYwYjJVVU1wRXgy?=
 =?utf-8?B?cTRWUWE1SjEwWjVVOTRhREc4QUhKZk9QRWZSbDdJNk9mUGZ4K292ejljbEpM?=
 =?utf-8?B?YXgxMjBGMVNySk8wVTZEeXYrZ3R6RVNrMzZYTHErbjRSY01oanBES1Z6Z2RT?=
 =?utf-8?B?QzViQVlvc29haDRFWUJrR1JvZ3VFQ1Mybm5XTGJzMWVsT3NtM0NpcEFRcVBB?=
 =?utf-8?B?SEpKSXhmeHEvWHVpYTVHMnMwcjBWVS9kY05zU0cxb3JrR1FGNEdJUkkwYzZ5?=
 =?utf-8?B?b080UGFlL0xIMFc2UC9sSWJVQndON2tIYkpBNHVPZU1relVSeUJ6cGRnV3U2?=
 =?utf-8?B?OGl2dEU4SGMvZjEwTkFHVFFURk5KdmtBSlJGQlU4ekJtQkR2V29zVEovdll6?=
 =?utf-8?B?SlZJRDRaQzRHYjZ3SWdTd3hYUHVOSDd3Q3VPdkxmSFVoVnA1UmpCbHVqM2xG?=
 =?utf-8?B?dm56OGQ4Zjk3QVduL1hJY3MwUU1mQWpDWkFFTVNkdVlUaUlkMjJvRUYvWXVn?=
 =?utf-8?B?dU05RUFOWnZYN29lbTNubElGLzVacmpxS1JTcXEvOUhiakNaZjBXckdrSTY0?=
 =?utf-8?B?bWMxS1FoSEJ2TWFJVVU1ZUp5ZnNkM1h5aGVwMkk2elRsMXErbTZtRldaNFFP?=
 =?utf-8?B?OFdmUVA0SHROcjM4VXI1RUgyY0pPQjBEdHVvcnVVcld0Vmo1bnhoRXB6ZytD?=
 =?utf-8?Q?Yh/54lv9FrA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmdFOUxqK1VKbTE1Q1RsSU9vOVI4djhLaTRZRjhDSEo4TzY4d2R3dDF5NkYr?=
 =?utf-8?B?Sk9nNjhCZjhsekExK3c2Z3FNM2RyamxJQUVxcTN2RjRhZGdST3Ntd0hHaHMr?=
 =?utf-8?B?TkJTRStrbVNLQUtlQWpEREtuN2NxQ0pmSWorNDhKOHJjS3hZN1hhTEZuTGxv?=
 =?utf-8?B?TUt1c2xrQ0liMDlOd3hidEtCdjE5bXZ2WGdsTm8zZ1pBM2xONmdMbFM0UWhT?=
 =?utf-8?B?QVpOSlRWN21aMlJ0ZWsxcndqM3lGZTRxWFg1RTVZTVl1T2dXTkVyVVY4bG0x?=
 =?utf-8?B?VXk3RUR3aEdJUDhtNkZiYnljN2JZNmNBY0VnZ0FmMXZIVmViTVV2LzBXdW94?=
 =?utf-8?B?VGU3ZWxKdlp3NC82Yk5OcjAxemY0NmlsbWtpU3Jaa1V4c0I2aWxiNk9mODNS?=
 =?utf-8?B?YjMyMm1yT0toWlF2T3dLeXZWRS9EdVpvUnFEeHp3NXJoSytXcVJpYk9xeDY1?=
 =?utf-8?B?L1hxWmZDS0lyNm9waEd1Qjhla3NWcGtRUjNMWEtTVjJ3blhNR0oyaCtDY0pl?=
 =?utf-8?B?MnV3RzFWc1ZQRGNnVWdsNW1ORVZURnZ5M2IxOVdhY0ZjTUVMeVhXay9Gb3Nv?=
 =?utf-8?B?aTdQRlZ4SXh3OHhFdmJQTWM2MU5iNXJGZU9rSFZFQVFsQzRHV291c0J3Y09a?=
 =?utf-8?B?bEEzQStTUVJpbk9KUE5ZZCtpdHBoeVFpSTd5UkJkZHRXSjNFUjdzT3BPbXEz?=
 =?utf-8?B?RWNmeWVOdnNpVzhsS1BGZEdId0hYVitjcWF6NFZvY1MrbGlHa1Q2ZnVzUi91?=
 =?utf-8?B?a3RlOVNUb0h5c1JuZjA5VnlIYkpVcXVzc2RKT1l1Rm4zR05nRUo3ZW9zY2JJ?=
 =?utf-8?B?MXRLNSsrSmxBQW5paUJJME9PQURCbnNvVUVHdE4vb01yMitUMy8rQUpQU0xH?=
 =?utf-8?B?YlNKOEJYak41RGxONHZCUUdYZ3IvNFUyOEJDYlBFM0k1SVR5UUVidkVvZ3Rt?=
 =?utf-8?B?dVBkMUF5dmN2a3U5VjVIWk9yaytMaUdMQ3JCckYzUjRyZjB4V0c0QXJ4dlFJ?=
 =?utf-8?B?c2RTYlJ0MUxWTG9vRlFkazZXTVNyakV5b0xjYjBsaFd3VjBHbFdIY1FlT1o3?=
 =?utf-8?B?S0xGMXZYTmovbk5zdmxpRU54Q205VWUycHgrKy9iQkNMa2kvdmVGYkk0UUZQ?=
 =?utf-8?B?TFc3a0EzRTk3aVQ2ZFhFK2FtN3lvYS8wRXZ5S2dQSDQ5UTlZanBONXRJSUpT?=
 =?utf-8?B?UzBFUEdZSHFmT2FhaXIvNSs5bjZHZ3pGSnVkN2FLWng0UXJXK3lYcjY4NjlP?=
 =?utf-8?B?NGk5Nmp3ckdiR3AzSEhEQlNQWG02ZEx5Sjlja2hZS1J1K3ZHKy9QS0J0NDAz?=
 =?utf-8?B?c0dpQVdpVkp5cE9wNHk4MDZVTmE1QXBCdEhOeUJqZkR4QWhNTnNTbElvL29h?=
 =?utf-8?B?Zi9VV3JDMnhpN1BENEF3RzZEekFKREJXY1JwWVpPTTFiTGp5SW02amlCeEhn?=
 =?utf-8?B?Qy9xdXAvdDlTbTZlTEdQTlM1NXZjd2xYUzFJeGRwbENhNzVzd3V5eHNvSzhK?=
 =?utf-8?B?bDlEOHR4Wlc4U25HQ3RuOEVaaUhDMG4rM0xUNTVCNjlZaFRMRzBiVlJJRnJv?=
 =?utf-8?B?cFlYQjNNaWdwNm1uSXBxZnhOZU83NENtaEdDNjRPTlBMenByWHV3d3dwUGMx?=
 =?utf-8?B?N2syaDkzZjdGRUFYRzgzbmdnVS94WWQ0OVdkc1ZaN250L3prUjBPWjR0bEgr?=
 =?utf-8?B?T3p2L1VPYVZiU053dWh5RndSOXhXY2UwbjNPeXFFZWo0TFNBbytibklhL0NL?=
 =?utf-8?B?bHQwYi9ONUVUc1p3RElqOU5xUFBLbUxkbS84dVVZdkxxdmV1cUxwbEJHNGdG?=
 =?utf-8?B?TWt0dXplNWRldTg3ZFA0YzlmUmtOUFl2NlNTZXhGdUFVWnhSR21iNEN1Smdz?=
 =?utf-8?B?bFVKWlNScFROWlhWQm9QdUsrd0JyMG4wNUw4ZjJrcjJ2THFmbGYzaEkvMHd6?=
 =?utf-8?B?R1RwbVV5WEl1MWVETXZMWm83U1RHRG8xVW1mNVdhSFk1Q2RGSkxieW1odjh1?=
 =?utf-8?B?dlZsMGxmQzA1djg2NS9ibkt4b0dDdGZORTdmbk0xRnJ2dnJxWWYyUHlCeFpQ?=
 =?utf-8?B?ajNYRlRMMXR6UlN3MkFNK0hLNFIzMnFUNkN4Lyt3VTlWaVB5SHd2ZFBlbmZS?=
 =?utf-8?Q?yQ9bRrgMCPjyEl81C30SJ3KHo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed06818f-f0cd-417c-d5e3-08ddda9122bc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 17:45:04.5413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6t1ft0QCS5HmAE0jS/wF951Pza4pEZAeyF158Y4OL0AZ0dzumA2QFawfFY26Lgk9obXhlroR8Kw0O4TwOeeI2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6767
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



On 8/8/2025 10:59 PM, Lucas De Marchi wrote:
> From: Badal Nilawar <badal.nilawar@intel.com>
> 
> Enable Wa 14020001231 to block psmi interrupts during C6 entry exit
> flow. It's only enabled if PSMI is enabled in runtime.
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> v2:
>   - Enable only when PSMI is enabled
> ---
>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
>   drivers/gpu/drm/xe/xe_guc_ads.c       | 4 ++++
>   drivers/gpu/drm/xe/xe_wa_oob.rules    | 4 ++++
>   3 files changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 31dbfeee289e7..0e78351c6ef5a 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -390,6 +390,7 @@ enum  {
>    */
>   enum xe_guc_klv_ids {
>   	GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED				= 0x9002,
> +	GUC_WORKAROUND_KLV_DISABLE_PSMI_INTERRUPTS_AT_C6_ENTRY_RESTORE_AT_EXIT		= 0x9004,
>   	GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING				= 0x9005,
>   	GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE				= 0x9007,
>   	GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE			= 0x9008,
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 2ceaa197cb2f0..c42fc78798ca0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -359,6 +359,10 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>   				 GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG);
>   	}
>   
> +	if (XE_WA(gt, 14020001231))


This commit has changed XE_WA to XE_GT_WA. Both WA patches need this change
4d5c98eb77fe ("drm/xe: rename XE_WA to XE_GT_WA")

Thanks
Riana

> +		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
> +				 GUC_WORKAROUND_KLV_DISABLE_PSMI_INTERRUPTS_AT_C6_ENTRY_RESTORE_AT_EXIT);
> +
>   	size = guc_ads_waklv_size(ads) - remain;
>   	if (!size)
>   		return;
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 8d0aabab67773..303a5e05d9932 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -68,6 +68,10 @@ no_media_l3	MEDIA_VERSION(3000)
>   		MEDIA_VERSION_RANGE(1300, 3000)
>   		MEDIA_VERSION(3002)
>   		GRAPHICS_VERSION(3003)
> +14020001231	GRAPHICS_VERSION_RANGE(2001,2004), FUNC(xe_rtp_match_psmi_enabled)
> +		MEDIA_VERSION(2000), FUNC(xe_rtp_match_psmi_enabled)
> +		MEDIA_VERSION(3000), FUNC(xe_rtp_match_psmi_enabled)
> +		MEDIA_VERSION(3002), FUNC(xe_rtp_match_psmi_enabled)
>   
>   # SoC workaround - currently applies to all platforms with the following
>   # primary GT GMDID
> 

