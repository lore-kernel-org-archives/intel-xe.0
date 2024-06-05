Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4214DC25B76
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 07:30:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E77BA10E6B4;
	Wed,  5 Jun 2024 07:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WEhAWWd7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C4E510E181
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 07:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717572613; x=1749108613;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/ftZszghsfM2ZMZ3kpjHvBlCGxKr5ee71nI0bSzKZXc=;
 b=WEhAWWd7iauFPAOSbIYrnjwmfsY1AMSDiBE6MdALmK60RazkTE4f7m/+
 GWINNWWbVUm2QUqyqrQlbYkxIm2utBUGpfJPZPMWfeT8HTTnnQNwbbX2t
 9PpCZ4MdmA7i6wnhJUlZ5qJa91+W1lYoi6Z1nHFHwlo8MtaTvH40kTwOy
 SbFmZFgzBthY9NSHLJSikgf1KH1q1BycaKUEmEeE1Co8ryRXUcmNCSMO9
 qk3iouqoSiVAWMg8F/rbhL+oywT5axSnuneChUki6pWiFmk8tgskM0mys
 5Qk40qmk1AKHZDKymIsacF+H969g3snvnFdux9N+BvczAuViWScHivzik w==;
X-CSE-ConnectionGUID: 3RA89/AyR0qq6zrIpkpiBQ==
X-CSE-MsgGUID: qyXSd3njRIaj4miBz+xhEQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="24788985"
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; d="scan'208";a="24788985"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 00:29:42 -0700
X-CSE-ConnectionGUID: 5VpKdfl/QN+uPjueOFnp9g==
X-CSE-MsgGUID: tIR/Ou3pQSyptktvrnlVxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; d="scan'208";a="42453118"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 00:29:42 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 00:29:41 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 00:29:41 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 00:29:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O7m7KaEN0js86Z2eYrKqQqTIKFi5QNFXpW+E1HUkXBZ+60NqoUPYOJ5jkJ5odeK6yHAHvaW93iT5aeJFby6Xgsa0SVf4W7+lKyDl+LzU0wv0jD5bOwIYcuHPPcGbuzaZvdwg/znXyJPBEXq87ejZhGSbzeLR1WSfswavYQIDzAJ2FSiUuYHb1twnpMhDdDZXnMDusX4ZHaL83QLqWtLHzGZHaMYqVVQZ3rSeTkN/wDMWCyw+NUQFyJ1nu2XzJSrPDHzZdsu4QtSUb8CuAUZK2eBP5gdJGNaZfyo4B1NUIjlNKnCKFe+0FzD4raLpUpHQtChncDckmsF0VNVqb7FkRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7J4Dx5oyGQZ/0Xd3ZIp3WJfjYxxCfNFfryQDTOeGMyc=;
 b=UYOa0FPzifqdwuejsB3TcDHtDcrE6U4Ru6wmzyTuFzS64vksWZFbSoC63nkYodp0k9kBOoaKr2RinRg89w71YxEYq25OvHbH1MaEMbFu//i0azAhkisieqEa38wCrlcN53tWewAqFdsRQV0DJTIoTuSvwj+/8VGKvn409t6tbWxJo7rTHHQMSAfL6clLemmam2t4F+omIrzY/8fv4JIFnfXLEPy1UC1UDGkcLANZN1atN5mTkrysdsglXFo3DXCEaMcQsS2/apYTcfzU01xOAnQxU2xEqMXSYWNl73nX08omNj8Je7Fqg5ElpYGD7SbTVDM23WD4tq6W/YXPFMN7qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CO1PR11MB4930.namprd11.prod.outlook.com (2603:10b6:303:9b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31; Wed, 5 Jun
 2024 07:29:39 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%6]) with mapi id 15.20.7611.030; Wed, 5 Jun 2024
 07:29:39 +0000
Message-ID: <fd9fddca-9208-43e1-80c6-cfdf1c2d9869@intel.com>
Date: Wed, 5 Jun 2024 12:59:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: validate client of BO inside lock
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240603142823.720213-1-tejas.upadhyay@intel.com>
 <f900e005-1ea4-4896-a51f-72f069612eb6@intel.com>
Content-Language: en-US
In-Reply-To: <f900e005-1ea4-4896-a51f-72f069612eb6@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0179.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::22) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CO1PR11MB4930:EE_
X-MS-Office365-Filtering-Correlation-Id: f5edd8c6-1fe2-41b4-df9a-08dc8531420f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SEM4TWNNZWM1dnpsS1lncFR0VXgyUjNGMG4vak43b3JhcU9nTEltS1VLYzVz?=
 =?utf-8?B?b2xQelIxOURVVW95ZkRXN1p6RE96L2daTzBoVThtczVid2hHT2xKRnFYVDV1?=
 =?utf-8?B?VFh0R2dQV1pxQm1MQUx3YmZseVJINWdvcEJBdVVIc3FMMmRKckxVamcwYW95?=
 =?utf-8?B?aTJRZFFVOWpQRDhnRWZoVGtFSUJLWjd2eU1naFl3SDMxa29ybU40R2FKWkVj?=
 =?utf-8?B?S3E2RXRLZHUreG1GdThoWHo4UW8rbm1YN1R0UWxMeGk0SHFrTFM2bzZlOC82?=
 =?utf-8?B?UjkyaDlrb053T0ozRnR6R2I4Wmora1U0eVNPMTcrb3V6Q0N3Q0xaQkk2MW95?=
 =?utf-8?B?V0U0Mko1ZGRaUW5lRDcyOUdZZkFyNktNUlJGdkZaUEYzZGpYWHhwMGJ5MGdR?=
 =?utf-8?B?alZSR0pYbkRBR1E4cWRBYVdHVlZlUEFmUnRDR00wSElHRERwZ2xIc0pZWW5X?=
 =?utf-8?B?VHVOR0RlbTJxRXVONTdPdHp6d1FJZUZlNUFMamRhbjl4MXN4T0JzTVNZY1hL?=
 =?utf-8?B?Qk93aHo5MmMvSDZyMTZ4MG14RXczUkw1Y0VNakdjb01XR01FT2h6Ty9iUUg0?=
 =?utf-8?B?MjR3Q1hFNjBvRTBZMnQ0bFBwa1JQSFRoZ0RYNmJmcUhIbVBHWDkzREc0dk14?=
 =?utf-8?B?WkNaTWlUUjFlcSt2QWErcWY0cUM4bzFFMVlIbFVjejFlalAyNlpFRWFLeGNt?=
 =?utf-8?B?UDVtckw5OFU1TlUvUEVIblI0Zk9LanRoRG03ZnArZ3VLRTZxQ01vYnhaV2tm?=
 =?utf-8?B?Q2U2Y2MvOGxuZ2ltSnlFdU5nZXl1UmtIbHZNK2RkTHlseVY0N0s1OTVJZk5k?=
 =?utf-8?B?ZUxnVVRoQUtVbEpFRGVpSWRBbmdKREp3TE16R1ZHVy91bVBUUTFPM2sxVlRh?=
 =?utf-8?B?UTFicnZTemtHZldpbGVrQlNVbjdsQXRvZGY1V094a3VMZ3haZG5NU0Q2R2tI?=
 =?utf-8?B?ODlJV3J6QXpqS0tIRFdwOW9qOVVOckRWd3grWEY1cFg5bUhSWC9XNDMvK2Zk?=
 =?utf-8?B?b3VxdjVoS3BVQlNIZUF5MHBIL3FpaUdwa1NZVzF4eFNheGlmMjFVNXIzbmlr?=
 =?utf-8?B?ZDJ3Um81V2t0aXpmVGRMUWpQNUoyaWxGak9jR1hWYlU3N0E1d3pqTjQxVkw2?=
 =?utf-8?B?NGlxd2VNbmFjOXIrSmtUc3VWQmZlQmR5K2RsZEhQaU5XTi9pMDRCaXBUbXUy?=
 =?utf-8?B?eTd6NTdwSERQZWJDdXNCNkFwcFdRSmMxVXlyUTFXWHlvcThQWTkrRVFyQytK?=
 =?utf-8?B?ank1K2h0U1BYcSt0cUxHbVNieDRicjQ5cG5VL2tDYktackpKczFsNlNMRVFE?=
 =?utf-8?B?WXprS1RLSmp6QU4wdVE3ZXNWeWtlZXNJU0lRd0plOWEzWXhFWGlsR2tMK09K?=
 =?utf-8?B?MnpwYzNwcU9CYWNzYjJmSHoxNDVTbHdXVHFjL1MzUFFHZUphSk9CZVA4WklD?=
 =?utf-8?B?R1cvVjl4Rmc4cXhramVQakt4aC9jdGovVjVTSDQzRU1jSkZCWjV2OTFBRW1Q?=
 =?utf-8?B?dFJPWTVvQ0xBOG5mK0JhMTdGOHNvcm05bU9sNythbU1vWHZOTGRZYmZydjZr?=
 =?utf-8?B?T3JvNlczWVl4ZFRVdGlZb3pkWG8vNkhLeVI0d1Z3OTkzdXJNSWRKV3o5UVJ3?=
 =?utf-8?B?OXdDeCtCQXFLNVYvNnR4WUxzZjl0M1VBNTAwTFZzMUdJMXZybzAxQkplcGRz?=
 =?utf-8?B?NWJ0YXYxeTZxaDZ1aEU5dDV1UzFBQmpDbmlvK3U4THBsM1B4VG05bmhRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rkoya0dveDgweXhXU3RwZ1dKV2Z5SStlQi92a3pmS1dITXZ6WUczZUxsTlM2?=
 =?utf-8?B?RmJCalhDR1hQUlg1TzdNN3ZqTTdpMjUzbWhZRVNVZFpJQlJ6L09UK0d5YUg0?=
 =?utf-8?B?RzVjMitUdmI1aC9IOEhnM1lYR0orUXlzenZERngzV3owWGMzN3pXODhQZnh5?=
 =?utf-8?B?RjNzT1R2QWo3K0l6Q1ZHbFNZSEVYRVBWNDdPZ0kwMGtOOGxXejNZNzZLMHR3?=
 =?utf-8?B?VEJ6UUphblVRanJDZEcxa1F5dGt3dEttRllOVDl6NFlmd050TUtUZVlhdFp6?=
 =?utf-8?B?emZpTzdiZUtUMGFYcldTdWVtS1MzSjRvV2pXNDRneDhnUHVVdmFGaTRBQjgr?=
 =?utf-8?B?MFkvci9TMzRXZ3NhTkR2eWNxMXIxK2hRdm1sTGt5V0hZL0hacVZsNjFXblN4?=
 =?utf-8?B?dDNmVGtSRjdVelpaNlpBaFgwL0tiTjNDYVl3bDYvWFdaRThRdlYxemNydW5D?=
 =?utf-8?B?UGpRclpMMDZGSXVXL3IrZDh2eG13bVJaSW85RnM4YTlmbng4emtVY01ya3Rq?=
 =?utf-8?B?ci9vblpVd0x6K0srQkJkMk54aDA0NzAyS0gyV2xCZGYvYWpsRFJHZDM2UnZ5?=
 =?utf-8?B?UFpaSkUzWXo0ZmxBL1RhcGRXWmczVVFhZjVKSzA3OVNYclkzRGFIS2ZzS09a?=
 =?utf-8?B?cU1wTS9rZFdERlU0cGNmL2ExR05YWVlEVG1OYThxTGNJRVN3NTFzK3gvanhZ?=
 =?utf-8?B?S0tHcnprTllpNytUclV0SWRaZnpLaHQ1OUt2Nmc3VWIyWmx6R25jQUVQL2pp?=
 =?utf-8?B?TWZ5ZFFUMmRhRFpteTEyTi84RGxTSXdBbjdrK3lZcURJUS9iS3RmS0hNZlVt?=
 =?utf-8?B?bjQ2d2krenlCRStTaFVDbnRRM3JHQXVpZVpiSEFjVVVBTmdDdXFLWHRjRWFM?=
 =?utf-8?B?cnZ1Sll6MjdSakErSWNvQkV2THhXblZ4Zi9YbGpWRVBtY0thYXVzMzU5LzVx?=
 =?utf-8?B?ckE2L1FNTDJvak1UUnJWUGFUZ0JOM0xEZlh2ZnJiYlQxcEpPU0NXdlJKNmxt?=
 =?utf-8?B?emhJREYwbzd0R1dDS1YwQmJDVVQwWG9kV0taNVVoM3ZQWnIreDdNa2NiUFBJ?=
 =?utf-8?B?SnJwLy9HcGpGVFNWVzFLbzFubXZlejdkMVBmQ1ppbUR0dFlGTHZHelVwMHdi?=
 =?utf-8?B?QXN5VTh5RVZ5VFM5Rml4MjVMUXVOT3N1RC9DNXR6QXpKWEd2K3UxTVpCZEtQ?=
 =?utf-8?B?STllLytCei9hV2EyNWdSSW9VaFNaZXpWcndzckRreVdMbmlXM2pCWW5SQVRL?=
 =?utf-8?B?M2p1d0NJNGZGVnZvM0lwTDNoSkV2OUFjYWFYcEZibzdGNS8rTTgxVW5jalN1?=
 =?utf-8?B?UmszUXNtU2RtZThPNjhrNXhaY21RZHp5YjB0TVJINGMrOVpkekd0Zjc4aFdv?=
 =?utf-8?B?TmhSOTY5aTd3aEExZ25aWTUvYTd4T1U4QzlucmVMVW1NYmkzM0JXTyttUGpa?=
 =?utf-8?B?VVpUNE9NcmJmNlFORUVabWpzQjNCckg3NU5vY2NiLzN6Y2tjdzQ4bW5ydkpH?=
 =?utf-8?B?Qi9nSEdRNEJhSVJPa1hVNVJhMG0xbEdNcmdTSFc2UGFBakZFV3ExWmNKOEtY?=
 =?utf-8?B?eFJIbWxxc3hNMlRjdzQvakc2SDg4QisrdWFFWFc0NnNhYWh6WTdmTW11K0pq?=
 =?utf-8?B?MmIrdEFCOThYRE8rUU41cWVYSnFvWVB5NEUxamp2YW9OR0ZLdUEyV1pCbk5s?=
 =?utf-8?B?alNSMXdSYU9MRloyU3hVd1hTVHpIZllGYjh6cFBrbXBRb0dpaTk0TEd3dzBv?=
 =?utf-8?B?OUZKd1pjN2lBbTNZcmdYOTRKSm9FbDVmbHBOU2ZCYTFsU2REMms0S0xPMW9B?=
 =?utf-8?B?UGQwQkpuYUhibGhiRnRBalo2NzZ5WVlKK3FlL0MzQUE4QXhGZzZWTzdqaHFJ?=
 =?utf-8?B?L0JwOUhXVHM0UmxXUGVLN3U0L0Zlcm1DVVVkQlZiakF4eHloSHMwQWMybVVC?=
 =?utf-8?B?M0J2VVBtSlZGS3hUYmtBeFFHYjhtYnhnTmxJR1prRXF5dm0zVmlaeXlFckpU?=
 =?utf-8?B?V0FUdzJuWEJnVFlON01mWmFLMEdCLzQ5cXVnRXFEYmhkUUMvZWlHb3ozSmt1?=
 =?utf-8?B?WkxiQmJDdDYxUW96WG1UdVducUlPMnMvNFpOM3EvS2RBWk1ZeGgyWmovLzMz?=
 =?utf-8?B?VWxJRkNUWVJua0U4L2p5dWVzeGtWS203WUg4SG1USmtEdmlWdHJNek9MeUU1?=
 =?utf-8?B?aHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f5edd8c6-1fe2-41b4-df9a-08dc8531420f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 07:29:39.1117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kVdxPibUFI5uSORiIt+KV4UzvzP6npAEld6/cmO3SBY7EcJQuw41/EjcAAxCIjXmDFm5F8kxf0scRmf2g45dnOcUzp8O6Hwv3BGf+MBQqIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4930
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



On 05-06-2024 12:11, Ghimiray, Himal Prasad wrote:
> 
> 
> On 03-06-2024 19:58, Tejas Upadhyay wrote:
>> As client of BO getting referenced inside lock of BOs
>> list, its good practice to move these WARN_ONs also
>> under same lock to validate existance of bo->client.
> 
> Nit: Use Imperative language.
> %s/existance/existence
> 
> With these addressed:
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

My Bad. This patch is not needed.
You dont need to protect bo->client or bo->client_link.



> 
>>
>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_drm_client.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c 
>> b/drivers/gpu/drm/xe/xe_drm_client.c
>> index 4a19b771e3a0..7881b02fa117 100644
>> --- a/drivers/gpu/drm/xe/xe_drm_client.c
>> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
>> @@ -131,10 +131,9 @@ void __xe_drm_client_free(struct kref *kref)
>>   void xe_drm_client_add_bo(struct xe_drm_client *client,
>>                 struct xe_bo *bo)
>>   {
>> +    spin_lock(&client->bos_lock);
>>       XE_WARN_ON(bo->client);
>>       XE_WARN_ON(!list_empty(&bo->client_link));
>> -
>> -    spin_lock(&client->bos_lock);
>>       bo->client = xe_drm_client_get(client);
>>       list_add_tail(&bo->client_link, &client->bos_list);
>>       spin_unlock(&client->bos_lock);
