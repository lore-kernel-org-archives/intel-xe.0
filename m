Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A14CC25B75
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 21:40:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66DD511A5C7;
	Wed, 29 May 2024 21:40:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P2T4hl00";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 063CC11A669
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 21:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717018836; x=1748554836;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qC0ikqtJE8Ae+pqL0JPIbaMHUSR+WoyHL7GyjWMK84g=;
 b=P2T4hl00ZMEmnSoncqIBkT54QQivENRIhsHb8EB9ZQ4FG5OZR7TxlzK3
 iC6DbmCIgTVFqFiHKJhAH11+sWsil+4oV7MBGF1OaHNI8/TnBZ3nKf38/
 5ZIiAV3gXwu1SzC3nRrgASq1stQB2j4yuCZeXd+gnxVTLge6V/sIe6Z7C
 +PZ9M5W5AIsxiuLim21AaPoBs/MwnywhEtQhWNVPnr19Q3TP+Q7FWToIT
 sX2hpIKo2kHHOSWkEPvgMp1mIn+kC2kBjbSWl6uGkiMFd36RdBkoApuru
 WuonomtnvPJNO6vIBitOrRZnXuAfCAI+O7cKEYqABowyKUY8Q5X4Tbmun w==;
X-CSE-ConnectionGUID: O5Kt+RmQRHaSC1u2Bo/V6A==
X-CSE-MsgGUID: o154RN+iSQSVGbz+7stnwg==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="30980770"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="30980770"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 14:40:34 -0700
X-CSE-ConnectionGUID: CnP2z+4wSpOIrYvCgMkwdA==
X-CSE-MsgGUID: spM+tPpZSqqbqlI0I5l21Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="35646409"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 May 2024 14:40:34 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 14:40:33 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 14:40:33 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 14:40:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EGghZderzokjfBIYAbHhCCWtgpqbdqOskHG4R6uQ47fd3IVzXEB/9NWpi5bqRwiNob0WB8w4No52Odb8UhCXAneIhFUgY28JkkvsgUhsiRStaKOaDNIcgltl/mEJUCfU/NZcfW3gvss9v4517NfQrHSpclY2TV/Geqlniq9fe+6Eo7C6Yy9SnCSW13g4X92xHI0wMIsaNae3tBw53tXLUkYkMc2PPoRKYOoCWxZXFx92IYSg4Pj+yjdDTJopkSJ7Yv9gkMio0hVPocgHpukClnaRMSEqk0ZZ6SNLRpbvzq1Lf6IQliwFiaynjKq1Xd3Zb47vXYeWQ4SvGdYj5BPmBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8t8icjIkJi4hKF+Rhf36U6fo8IIWLuPjNWPLNlvSO0w=;
 b=Mjpeu5OxbaFttLJCVLlhd8bFIaxWnft2Snog6w5PsJvrCeiXd4M0xJxpFf2OUeuypwMDZUNtpDN8tWIfa+s9xdr+yhJR75bKfE/yfh7oELMhtAjKYtq5X7nthx+uP3bxmXDIazHjFiCSj8zOfFRxahkquoulBJqM8qZdtisE2No9ERabFELksuse/vLp3HsDlb807R+0utx+I50i1Ac3HD6k/tGlZuTUsMrWyGZ4/hPQL97eglVk0HTEFg592hrwvq14YIwq1AGaBuY/OW+TeLV8dn+QOFxTukXV0P+BZP4T4otImmAQkeCDfummT/onnKoBApd63x8D+mnktgK6yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by IA1PR11MB8247.namprd11.prod.outlook.com (2603:10b6:208:449::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.28; Wed, 29 May
 2024 21:40:31 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0%4]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 21:40:31 +0000
Date: Wed, 29 May 2024 14:40:28 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: Re: [PATCH v2] drm/xe: Remove unwanted mutex locking
Message-ID: <ZlegzD73FXOFBH2U@nvishwa1-DESK>
References: <20240529183319.19731-1-niranjana.vishwanathapura@intel.com>
 <ZleUz3Ep14W6LRJs@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZleUz3Ep14W6LRJs@intel.com>
X-ClientProxiedBy: BYAPR05CA0069.namprd05.prod.outlook.com
 (2603:10b6:a03:74::46) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|IA1PR11MB8247:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a38b904-4ea8-45d0-cd33-08dc8027f690
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MeMyREB0beSZC77ijSlObuU1B64KplPIuUI3Tkjqx539RjvF2uym9INw9peh?=
 =?us-ascii?Q?E27MkPJLTJYBacnKl4ipETQUj6XHIcuFlW7MQ8PDVkXpqIRHrgAA89wpOC5A?=
 =?us-ascii?Q?4Ae/I51TLF6ta18ipsuumuU5P5gkyg0aZZ5OsVSWsr7ji/kE4ArRe0DAmKSA?=
 =?us-ascii?Q?xaqogFG+y2FxCUIRbq4+JRLc2O0XBVbwOssdhVIaTeuZiQKSKQU+b30gASkQ?=
 =?us-ascii?Q?q9cUlifpaw2kXg45oOjX3gnfpvAu6a99lkwiWq/AHVaGUayUT1X4hCBNFM9M?=
 =?us-ascii?Q?vzXbzDTuW4oA8lBsjUgp4YN8Qy5JNcvMwB4kpUwtg94ISYJSu1nZ8D317xgC?=
 =?us-ascii?Q?2k7Sbrj138SF1qyZXYrY5nCiSKkWasz6hDLDkfW5oD7xUfvf3GCKGOTK2Pf/?=
 =?us-ascii?Q?z7L5Al0X9f6dPUbKFYIAiS23y8WfF8xq5siLkrut2QK3JQf2nCj9DBarlXiI?=
 =?us-ascii?Q?TWSae2C5TNh2ahbt1VYxrUFfRDlSbIxqVCB3pIm+YA5KLgtYuG+u8yRFXxbb?=
 =?us-ascii?Q?OE7NoQ1QOIhOdJgBkLZn4ZKsYV5JUCPZTwT/Sd+5BL0LoErqapzuJ20LReI2?=
 =?us-ascii?Q?GRtNSZmHUUYTw2I9kPekTRoFrueOW8fNFZuu9dY8TH1g/keKEBzEvWAgPGAy?=
 =?us-ascii?Q?KmB2XZiDBn8neeWyo5KKQIxuqt5vxSkaYHIUwYnxfQMt65ZfCaJYjEJdqY9Y?=
 =?us-ascii?Q?lRD7+WazcP2kQMedaHcX0thqzB/WWCXqYtLo2hv0xS/CVpyXnPUAYA7Vsq4R?=
 =?us-ascii?Q?yiszk+v5NGiYDNme2ljWmzlYaVrkjTA7tV2V37Q0CohahmKTb0t7tiO2M/Pe?=
 =?us-ascii?Q?B4pau29pqt9J4scfoGSRuhVRlJtF73SW9hcmOBNh1P9LrUBd4QdVF0M1pOUS?=
 =?us-ascii?Q?woD7BywVcCuuwSomJLSTHiW38va+krcvH1BmYY3cGiTX9qUPbrpCpL99rjW9?=
 =?us-ascii?Q?xOmgOGx53rz99m9TEtHJRyjXbzW/6LjkRy3RLajaBQUGURqLWURenO5Rl3eY?=
 =?us-ascii?Q?1FjL7Yrsn+3mNxN6Kp5fJ6dawnloRXoqZNQ4IVyVTKUB7irIW8Lu3mRHQORP?=
 =?us-ascii?Q?Hy3GDQTVfqReUyYZYtzsZQOd2fCx4WT2Bq7tRey3J5Oo/VxdxHg8TFXP93rM?=
 =?us-ascii?Q?DqF31awj7zePENre3fZBiecWwUuUITvyPojc2U/+jnJ0yC4Y31DnsIacIsFR?=
 =?us-ascii?Q?7csPwyrGwilumfGGo5uwV0LGMMp6so+G8VMjsPHgQtM+Ml2SuYJWkMk2u2Xm?=
 =?us-ascii?Q?qwzbFPcQqnpKiz3N/l4RwVEUeleP36UBZNUPAx3ZEw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0jofOFwPxdRmvA1kZ/Q/t5Efbl9AY57wte+SbP/fhtJLC/Jea1/MhzhUWaw3?=
 =?us-ascii?Q?MrnDdBTwLA6gBnsuqAAQ4NHO01bJndpboPb+bTtkFinchBvQ7HGNVkVfP2B8?=
 =?us-ascii?Q?wsM/jp/i7xu90L5SxtLIu4zykckAK5jWBV1WfwGZFxCIgZhKaD7H7Os8u6kZ?=
 =?us-ascii?Q?PBOwJiGn+BkP2IPHcHH9Bb7zcmULwUCuujoPufdktY1CjwUfFmEkHY5shYMe?=
 =?us-ascii?Q?JkUc+p8kyT3eETTR1ZHq3EYxzI9q4JjWTDbM3Gamj0tGxvrO42IG2cAGlhvm?=
 =?us-ascii?Q?ZpfYbXTm8wHGc4ZDbQn747MGFpsDFBE0RG/A2/1Pdh+aBlhoVkCR87hhaFNQ?=
 =?us-ascii?Q?9JDLgQuxCG9ACGrifHu/kVsaxVlYI82MMf46gsfuQu0yoQrSLmYblUxgfZ6j?=
 =?us-ascii?Q?UtCmBPnJ/i1l5hw4wfmf/ONcD1ogjnumIlTFSOn58lteYP3L4A/V8IFMITNQ?=
 =?us-ascii?Q?IuR3YzXB46hqNlqm2zOuhGQyYgmInjTFebc1LcIadPckJ/9ywVq29z9dHrx+?=
 =?us-ascii?Q?gI8BLyKd3MqViM5tt0SXmPl6Vqfa9BVZm3JiizL4wKJ0krOugAELqygrMenx?=
 =?us-ascii?Q?ytGkquOa0OStJ6hPllQqTpdEyxBFmvVE6VAj05UEeUA5bECnm5eGNce2TidG?=
 =?us-ascii?Q?5zCtw8KGWKe/FMs+V1QRZZtOlC3NlUyyXdiwKkB5AN2vMksRV+Hd0ZSauuXN?=
 =?us-ascii?Q?kEzOWY3EV/qqx19dkWncpZlUdh9QVYSk14UcketH0UjKm5ThjWabeHnkjXJ5?=
 =?us-ascii?Q?4ISj+/4Ra1Wm/SYU8FrJuL1XumA31WVFLLiBBTR4tKj0Ge+zW9zXX8K/kl5d?=
 =?us-ascii?Q?QT60jXqTCWtcBO9esmJ0W6QhO3gQux83N4RieEFPI90CGq7msMLCktfJ61eu?=
 =?us-ascii?Q?L2qGiqlLDWQaMB5Wr25LB23UHQO/K7FbBnTupNjQXmUhTH98xcWl385Kj54X?=
 =?us-ascii?Q?6v8XuYY2iD/VlPCBQ4CwwWKJDb5hbxar5KTXUuivS5ftZuPpLH1Zq3gEXiOf?=
 =?us-ascii?Q?iIglX0nKMRHgKvlLvpAJHHeyBqLGOHuzo/0N2SDE/6iAOZacJInSTAam4L2g?=
 =?us-ascii?Q?1ABa8BShMWaQxj9mQ+8nj7iWtEuihzzyMpEoYEWoR4BFCnsxQM1RXYdJTIiE?=
 =?us-ascii?Q?WohIstQHBdapb2ShxLvkrWIYNxMtZUbS0kD5bXyUC8KdSDEpYwLzBFNgSscq?=
 =?us-ascii?Q?0J9aPVtMvxfbFC1FP/J6kNNDGcRpiy/OHdl7LCZQyMkSocXKTz66KWI7rcoW?=
 =?us-ascii?Q?TeSG33unOhZyVhoBHMXntuDWJUWEJ2seVK3X++BRtewKAIDb2HaycyRDun39?=
 =?us-ascii?Q?Tjp7KMNFeCyeSS6BJQ3BLzkMg9eanjAYcRncgFdOtwlMUv6MePX+/lXBXmIu?=
 =?us-ascii?Q?XKoSdz8S6T0Gz0lCFevJ7ZuiSJyoXikDtZY5JNLfK2ihJn78sS34wIYPP9q0?=
 =?us-ascii?Q?6A6a1IlewxmUpUPawLzRZcoIwXALyktv5lvwXrXEFYb0pcfGiPrVpTsrbgbh?=
 =?us-ascii?Q?VjZ6Xrynmpl6Oi8Li/p7SdronrsM4U36/l/KdsPBnyovXA6f6JM8RQGojRIQ?=
 =?us-ascii?Q?kPpWtZK5cH2M7LYfmk+COIgLnXyyCYDS+PP213yXhjMf76xKvaocekANbpdn?=
 =?us-ascii?Q?0mYhrQdrTFBuCGaGY+D6wKI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a38b904-4ea8-45d0-cd33-08dc8027f690
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 21:40:30.9882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ldgez0NV9XmI3QHU+l9DwvVlLWYk3683GyhMF5LJgfDvE760rv4U/X/o3+7nZZ6CBfdd0C9Sp7zLLGxONdUG6kcV5MMXJtOxmvhWNgY7sBslmjOr2ZV9X+JKGLBuTSq8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8247
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

On Wed, May 29, 2024 at 04:49:19PM -0400, Rodrigo Vivi wrote:
>On Wed, May 29, 2024 at 11:33:19AM -0700, Niranjana Vishwanathapura wrote:
>> Do not hold xef->exec_queue.lock mutex while parsing the xarray
>> xef->exec_queue.xa in xe_file_close() as it is not needed and
>> will cause an unwanted dependency between this lock and the vm->lock.
>>
>> This lock protects the exec queue lookup and reference taking which
>> doesn't apply to this code path. When FD is closing, IOCTLs presumably
>> can't be modifying the xarray.
>>
>> v2: Update commit text
>>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index f04b11e45c2d..4cca16f2d4ed 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -96,12 +96,11 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>>  	struct xe_exec_queue *q;
>>  	unsigned long idx;
>>
>> -	mutex_lock(&xef->exec_queue.lock);
>> +	/* No locking needed here */
>
>could you please expand this message here to avoid git-blame+git-show
>when trying to understand 'why not?'!?
>

Ok, posted v3 with added code comments.

Niranjana

>Thanks,
>Rodrigo.
>
>>  	xa_for_each(&xef->exec_queue.xa, idx, q) {
>>  		xe_exec_queue_kill(q);
>>  		xe_exec_queue_put(q);
>>  	}
>> -	mutex_unlock(&xef->exec_queue.lock);
>>  	xa_destroy(&xef->exec_queue.xa);
>>  	mutex_destroy(&xef->exec_queue.lock);
>>  	mutex_lock(&xef->vm.lock);
>> --
>> 2.43.0
>>
