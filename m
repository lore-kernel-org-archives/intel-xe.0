Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AF1C43458
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 07:52:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA7789811;
	Wed,  8 Jul 2026 07:52:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BsCzo5nm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1773B89811
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jul 2026 07:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783497171; x=1815033171;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X7M6sJbJGKP213yEC82LfJ/5ggEXZeFyfS3MVGPw/P8=;
 b=BsCzo5nm5kZlo+N6cfe8r5fi480b8uKIMaysu7NCgWVotitC3g5RbDoj
 dvI45y7nORBuR8NpwO65qoTPLtnqpVyRSASgXSe6w39WOupwSY9YDyDtR
 on7Gzx56iXmnaXBQkZKyQa4MFutQrYc1b4OS/pGDIZrCmWs+0nMkVDnUV
 15odKchw/jECsNIFB2/WN+8PrB+ynhoF+vP6e9mncgByjYMNvoCaVNKcV
 k46dh5Wy7r6spHtkLcc0nPNxw5JWalXE6uRv7tA9QGfq6i6bMZGj/09qi
 c/l+3u0ADo/n+96wbTJgRq9wSK9c5Fhb9z19ILO8PTTm6sK1aLOPZaKcQ Q==;
X-CSE-ConnectionGUID: i+SspANASeCQS6Xg+dCUQg==
X-CSE-MsgGUID: +g+8hzywR7+Dx4ufqJ4tVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="86701534"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="86701534"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 00:52:51 -0700
X-CSE-ConnectionGUID: mht5ezgSSeuUOnsnqfHZxg==
X-CSE-MsgGUID: 6wIs1mNlQY2Y4yu+yjaK+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="250232544"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 00:52:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 00:52:50 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 8 Jul 2026 00:52:50 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.16) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 00:52:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g1Ho9TNNzwP5Rkny43KYDntMrL9qRQ3dR5eDba1p0YbPTyfXSVqXn6HITOEY5NvCWEPrDNNhtUQxLc+C4EPE02y8LjfKN+Ra3prdn31a/2JKK0MnjyvW1Iv2V+oDUccl8Ay7zc5hr+CLJYV8h/jRzy3GFj5mzGNrJbi32Jb4vLFy1KfLQqLdwt61e84kBo1puePL46+SPaOy9v+EfsgRwE3+o6tnRSdKJzHdDJGi7LZjQutDGhR2EUDYsbaIUpfn741o8N3ug2zoyGpGJ7JV2c0Zm1tcjuVsM1yldN05XeYwNkdbsE7qAAQCrhOf4lqU0Lyl41GRMZ2gqcjqoWD5Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/WEoOVqeQClQ4oKuUrvJfenEpoESH+xFu6YlpIXslzY=;
 b=uLns53DimmyGN+R0Ba0t7c09t4lHlQWFlg7bpCTW8yQtFHHP1Xbv7M9fS5rT2Ul1XactzZf7WasBb5n355QhUOPAkwumJNLXVOH4nthYt3BAyCcy7uTalWyCvlqyyhr7ghl1QskgiJm5W2VajBNuuoIPUBA2ju/KBdI1RvNyF5HuCKWIfMbHS6ruKb5pTIgi4GRnvnTnqEJfHPzrdBXUAME7HmuYj2LCtsX1aZ5ALLUzs07XMlF0uYRZ/xoGjMnGxI/bJxsY2b7xLxG/eoD/iJC0Cln/Tjmt6h4R9I69dS8LssZwc0+hk2SRp2jw32r91liV1UFTzsUm2PlQy7qM9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by DM6PR11MB4659.namprd11.prod.outlook.com (2603:10b6:5:2a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 07:52:43 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%6]) with mapi id 15.21.0181.009; Wed, 8 Jul 2026
 07:52:43 +0000
Message-ID: <83b661a0-f730-474d-a5ba-5d8606929e54@intel.com>
Date: Wed, 8 Jul 2026 13:22:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/1] drm/xe/xe_ras: Add RAS GPU health indicator
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <andi.shyti@intel.com>,
 <rodrigo.vivi@intel.com>, <anoop.c.vijay@intel.com>
References: <20260708061221.4006706-3-soham.purkait@intel.com>
 <20260708061221.4006706-4-soham.purkait@intel.com>
 <ak3ydOjMXBrOVKbC@black.igk.intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <ak3ydOjMXBrOVKbC@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0168.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::10) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|DM6PR11MB4659:EE_
X-MS-Office365-Filtering-Correlation-Id: fe8e3f0f-4a5b-441a-8472-08dedcc5e43a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|56012099006|4143699003|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: qi7gFV8doNcz6yeNjtSeZghMBoayiTFBLbjdI9EpmbicJpExj0//CHeUoiubc9CH7RDZm/q3UquaODtNtkQ7gdmHfoo6wdcjF6iNnVF4f2dGXi4zNcEyBIIgSo2h3jgxiSQsTYFDE4AQnPRmT/NsNpRJ8yZooAjZmoX6xCjDKYeIUP2/T0YVsA7yDJi574QxaURQ49ux3z14R+YKDIOpt5SLeuD/G5L0OpoNRT802Vc3zZ0+uSCEo/B2TXsVGmWV2Aujz3dQ/U+3w/Y4++p5x5EN4wKRf3T+PVO3AZv0yigzU6kQjaLsTVkHihqv+ODVMbBW3Gc9CIkNuQgCnjVmjFx+zxrDIcxc0FeXl82GDvDlE6MhQCk5RR67rhxB3IyKjOQP9+tpVeu7RKlq5Ua+WPsR4MOM4dqS5ifXTSp1LbSoVCjWhAU3AeGtz4gDeDUTA547LTIpVtuhYU4t75Qt6jxI50bTtaEkAw784gyTDvuYynpAuG64faNA8MtKd74FVg5bK0W6ZzW1rYDbNigte8oNWSEJFY1i6oasYrqxGCRD1L9i1iJkYE5wij/Oyu8JSzgofGmmgNghRuOUu4YwbbYKqPmQ1Biv///RNVX6IXs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(4143699003)(11063799006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjNFTXluV3ZFMmQ2R3UrMkV3N1daRkQ1V0FnR3VhRWExV2FBN01PdGJNSU9y?=
 =?utf-8?B?ZzNlTFhVUDc5U3owd2dPcDN1Nks4UU92V2x5Q2E5K0NUNTQ0NTQ3Yk55bmtK?=
 =?utf-8?B?TVNDbjF2bGpka1ZuYnlEYk1uUzlFeGxPQk5EVHZiTzBWSGcxTkUrWlZ6Vitt?=
 =?utf-8?B?a3FBWERBZ1h1YUw0UmgvNk9IYVg3VXdHV08xYkZiNGVFTy8vcU5KZnlHSFlU?=
 =?utf-8?B?Rm0rTW03dXdiWnFQQm5CUEcwbnZPVW1vbE1NREY4TktQMENZalY5UzJ5T0Mw?=
 =?utf-8?B?OERYaEp0RW9icm1qeUdxMXRKWjRwWWE3MTVENjdkMkZyWlFmV0hvQ2ppcERV?=
 =?utf-8?B?ZG5BWHhocUNhUlNTSk91T3hyaHZ3VTBsZ29FaVY0cjV3b056cWlQN2x6ZVg3?=
 =?utf-8?B?eFFURHJHZEgxVWNGSHJOSHRzVmlKNU80MkNEV2dIMk1OTzd2OXVRQ3lITEV0?=
 =?utf-8?B?S2JPNlQwN1ZkWHFVQ2xtMGt4NVZ0U2ZROE9mci85SUFqSjRPM1RoOVQ5aUlF?=
 =?utf-8?B?VnFoY0lzWUMvdGpJclV2Qkd3azc4aGpiY3g4TnBEVUVRWWpYbEFQQXVvTTBD?=
 =?utf-8?B?TVpHZzhEbWVWbjdtQkRGQkRNbzJpQW91dno5cjZDenczZzBzckFtalJlN25Q?=
 =?utf-8?B?QkhvWnhNS0ZabE0wMmNocFk2TW5uMG85WUtWYk5OMWpCWHUxenA5UC9rMTRr?=
 =?utf-8?B?bDY5RkJmQXMxdVVkMjlVaHFvWUlyYjhXSDhLay9RbXdtV3FNMGt2WlFFNGpK?=
 =?utf-8?B?bXM2ck1BcmdhbUEwTTVMOUdaMGVCb1N0Q1NibDdnbkVXSFp6OUoveXJDakw4?=
 =?utf-8?B?V1ZJNkpCMHZXUzRBVGlKM29od2xYZ2U2R3A4QldpRTR0U29FcnE1TkJSMGxo?=
 =?utf-8?B?cnd1WHdtL0FIUUVINGJDTUJ6WWFlSHNoTlZ4M3pacE5VdGhJeFIxQ2pWSHdW?=
 =?utf-8?B?bFB3cUxiL3l5b0o3aDZDYTlzdXFtb2lTR25ibGxkT2dxeEZ3WG91RElGdnBW?=
 =?utf-8?B?TVVuSk8wSEx1SlpPVTZQWHlCVElzMFNVMTdJa2djTHhNdDE5QkwyWDFwaG1K?=
 =?utf-8?B?Mi96V1V0WjFLbVJqWnJlYVlNbTI0N0UybHNjUVlPM0syQ0Zma1VKYWQ4WnJQ?=
 =?utf-8?B?azJNSXkwbUxDMU16bUhlWEI2YXRWaWpwK3ZrSG5ldUdrNXhVdmNKSnJVQlBQ?=
 =?utf-8?B?ZFA2bzZGdDJza3A1eFg3NXdleE1iWmZPRTN5QjdnYmhjYWRKYUdmLzlmR1ZU?=
 =?utf-8?B?R0lJWjFvL3p4Mi9kTG1SZWFkS1ZRVFRDQzl2VjkwTDhPeWtrUVBBamc0QjMv?=
 =?utf-8?B?WWFLSk5CTFpWUDhzUDdvOU1lMHJIN3BESklVZFhmTHRGR2VPWEsxVkFhQlFY?=
 =?utf-8?B?Mm5OQWY3Um8xVUdQT2pTWVA5cENqQU9RYkRXMzhrRytyUFVBMUxhTmlvK1kr?=
 =?utf-8?B?R0VaamVzbXYzaVpTbkpWSHBMVTZJS0lybXhTY3ZiaTArOGNKY1ZiQ2YzUUtw?=
 =?utf-8?B?cGg3TGlkMEV1TGQ4MDhlck9mMmFFV2dhNjkwMjNFdnlGLzZKVG4wWDlkOVRP?=
 =?utf-8?B?QUVPSjlkUWFjUVZtMTZkS09JZk0rOVJnYTAwUTV3cDBiTnhLL0VzeXZLZXgy?=
 =?utf-8?B?Nzl0aURSNDVGZFVpY1BaNDRELzM0VTdzMXFob1FaRUpVb1hwa1pZbEt5K3BP?=
 =?utf-8?B?VmtwRWMzb2ppM3pzT01wMGpKMWY0STlRbnBpTmJ2blpRZWx1R3E0ME9mN2RK?=
 =?utf-8?B?eVRQV3REaklvZnQ4RmZ3TjZiQ1g2STBtanJDVkphL29nc2puYm9Bbk5RTHVO?=
 =?utf-8?B?Nk4ybmViN0UweVlmWGFOSGRON3ROZUwvb1RrVjRyeUVEQXlCQ2JSeFJOQWVw?=
 =?utf-8?B?SGk2NDJTUXZCUGJETkRXcHJLbm9qNytzR0ExOWNCTjhGTFNiV3Z0dEtQY1J2?=
 =?utf-8?B?OXNjSzhKU2tzR2RoTGt4ZmV0OWFOalBqUHVwa0pZc3FIdGNoOTMrL1czRG9I?=
 =?utf-8?B?UXVmMktLcU5pMGJ2T1lXMDVRejJBRnV4MzlFYm54czE4SVZMKzhYT3hmTjM5?=
 =?utf-8?B?bkUrKzV2dWI2SzB5Q29OTWRySm5jT0NrTk1vN2dmOC9taXkvcmVabEpGVW1Y?=
 =?utf-8?B?dkRBcFdqampPSmU3enBlSUlPelhkb1QzVGx6TkVqVnZOdGc0SDZRVWFJNUVj?=
 =?utf-8?B?aFNGNFpuOGlzQ1gyWFU4VU1zS2NLTjdJWnQrT1dRU2p4MW82emJCZ1VUeGtk?=
 =?utf-8?B?Vk9xNlVpQ2taTVhRcXRiMWpUZklieDRVSG1xU3J3and4UVdldFh6OTJ0MVRh?=
 =?utf-8?B?N3pPaUFjVEMyRmR2YzROVTgySGtuVkhUejJHNEVTRk9sc052QTJnRXk0dDh0?=
 =?utf-8?Q?6xRD8MR61lc0HadI=3D?=
X-Exchange-RoutingPolicyChecked: pz2iqVqrzD3myEoyBm2ud806hV+Ubb/AyyHVjmtIkcn2dlsv3dYJTX5a1Wh64NirRovyLrpDxuaRcpaiBOLpEsqBdKPXzLw6BGBaDLdpEznEaCtWdoj50OnFVUue4cyvYfC4gb/O28VvK0E3kzo5QaTVX7ydpfcLjhJIjqGjJfZe6sMpuu1lrNzhM7RsIDo0zFqrhhk6jlVUZ9oJsJv7YVclSgj7jMYMe7APAqbG1BUtprN1jrSAaLWhO8pedPuzzF3hQpS6Gthth5jTwdl/F+qUoiAjbDzXna8aJJh5y0QceLynT8fW+9R6VJCxzunIPnvZYBN8Yz/g76iw6Zfwuw==
X-MS-Exchange-CrossTenant-Network-Message-Id: fe8e3f0f-4a5b-441a-8472-08dedcc5e43a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 07:52:43.0958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LgG3sizTrX0e94zdsGwB43oMfiLbJOnNQWC883fmZel8AyEuXExkSrbLcoy3P0Th0FST2SD2IypgBuDaV7S7wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4659
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

Hi Raag,

On 08-07-2026 12:17, Raag Jadav wrote:
> On Wed, Jul 08, 2026 at 11:42:23AM +0530, Soham Purkait wrote:
>> Add a sysfs interface that reports the current GPU health state and
>> lets admin users and management tools update it but is readable by all
>> users. Requests are routed through the sysctrl mailbox. The interface
>> is present only on platforms that support the GPU health indicator.
>>
>> The interface is a single read/write file at the device level:
>>
>>    $ cat /sys/.../device/gpu_health
>>    ok
>>
>>    $ echo critical > /sys/.../device/gpu_health
>>
>>    $ cat /sys/.../device/gpu_health
>>    critical
> ...
>
>> index 000000000000..9612b97b0f88
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
>> @@ -0,0 +1,30 @@
>> +What:		/sys/bus/pci/drivers/xe/.../gpu_health
>> +Date:		April 2026
>> +KernelVersion:	7.2
> Unless there's time travel involved here that I'm not familiar with, we
> should consider using correct[1] date and version.
>
> [1] https://jnikula.github.io/linux-kernel-tea-leaves/
>
> ...
>
>> +/**
>> + * DOC: GPU Health Indicator
>> + *
>> + * On Intel Xe platforms that support the GPU health indicator interface,
>> + * the driver exposes a sysfs attribute at the device level as:
>> + *
>> + *	``/sys/bus/pci/drivers/xe/<BDF>/gpu_health``
> The attribute is already under device <BFD>, so I'm really unsure of "gpu"
> is needed here. IMO it can simply be 'health' but I'll leave it to you all.
>
>> + * Reading the attribute returns a single line containing the current GPU
>> + * health state. Writing one of the valid values updates the same. Reads
>> + * are available to all users; writes are restricted to administrative
>> + * users only (attribute permissions ``0644``).
> Why is it readable for all users? Is there such a requirement?
> Yes it should be readable by all users.
>
> Thanks,
> Soham.
>
> Raag
