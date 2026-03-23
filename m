Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79D8F4612B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 14:46:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F1B10E4A4;
	Mon, 23 Mar 2026 14:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="asQF5ZKM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3802410E49B
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 14:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774277200; x=1805813200;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nrb8ySaxoF6nSVdUa9b/fKXUv2GXaDrDKGMyskG7LUo=;
 b=asQF5ZKMQfmuaayVWea7L6oYKFCQafTPubEIYyKonshQdS5HaWxettnr
 6ulyaLL0a8Z24mfX1jwPQN1z0aT2kDeatIWkoZqN4puiIXxbfhV25LifF
 bhvr9HhI0hYW6LW7e69h3D7JVIvtiwrT5F0U6HKsAjbLe3b18OJ10ndlk
 y1pNNBfbFVrfnd5Y7vWj7PPJRSQeZUppmZuW/MjJJX3yBT0dvFdUBuxPx
 Fr0iqqWM/uUc9mIvUcPqSG/mQAhOZlG4cGvW2wOfgSJa/It8zEIi0JGOI
 rPIVFZ1ZznYwcC4kPPw5ZQprGZ6Gn1iFb1gzQomJGZ9T6jKUiDMI3Y5Sn A==;
X-CSE-ConnectionGUID: cVFyUhqIQMS8jkJThbFetQ==
X-CSE-MsgGUID: YN50sV3XSMyZTNcHPJqc/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86642548"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="86642548"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 07:46:39 -0700
X-CSE-ConnectionGUID: KxrJm3uUQvGOgNCRfP44YQ==
X-CSE-MsgGUID: XGSGdNdZRI68zKAdaIwp6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="224004204"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 07:46:39 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 07:46:37 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 07:46:37 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.17) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 07:46:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NjUor6JIfKB+OiC7EGz11OQGf6PtNKGCa+SQzsWfN8+JjU4HT0qNqmUrPiKD60kMAUU5OWNS1faKuVxXRI4miOTmsP/YhI5mF3YWn8JLzk/phqupVdlhvfuO3dJLZ5Ib0Kl0i9531HENEhJ4IKqQlfixgg7c0jO+orUu1vGqEWnuDbL8edhhf5TntdPjcgNYgmzbCEX83TaCINwH6NXLm2gUHrluRIGstV1uo3trFglwloY5b6HaoClkj1Bbjyo6xc9a2DcrZSLd1pdXae8jJAEYFAa/wqkJDI2d/wR6vtL6kYd17Vqq9U1CSgyYc8kxDz2gl8ItVM+ogERrP++mXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKioCsaa6HFR3Dd40vQai5tDj1yptPedW1i7n6+OCqU=;
 b=Z3yvgxHgsvE9TfjudmyXoa4SRoy/yeWE4cl2JxplavF5DoZIH+MNZAtXhawLGMhUJ9AZVQEvEfkHJRh6DOmxuofD0629XHWa3R4gNXSZ9RRVAVqufqpmFZ7Wogy15jazF53q2sJNImHQx4YdIeUpmRneUVfEXHir3d+iro72AwyeXz8TepkrX9knj8RSC9KMRZ61SP4Y6cB2UZpeeOBo43ZjP2QcF/wWfprXBRsOC96zmMH00KLUHO0o5EPEsAkHPFJmnTLk4gPuxE6AOa/PPBjGDU1qdO0Spct2G+k84NzsKHcQzlgOachSgb+9MkeYjIHLmxlxwrMTnl7Jm0s8IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by MW4PR11MB6739.namprd11.prod.outlook.com (2603:10b6:303:20b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 14:46:34 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 14:46:33 +0000
Message-ID: <760c7a68-2755-449a-b1ca-8e9ef3bd9886@intel.com>
Date: Mon, 23 Mar 2026 20:16:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] drm/xe/ras: Introduce correctable error handling
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <rodrigo.vivi@intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <soham.purkait@intel.com>, <anoop.c.vijay@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, Riana Tauro <riana.tauro@intel.com>
References: <20260312090657.4026013-1-raag.jadav@intel.com>
 <20260312090657.4026013-5-raag.jadav@intel.com>
 <3aa996d4-1ae2-4bdf-9a07-0c6c345e9328@intel.com>
 <acEn7YTv53VZL6Jj@black.igk.intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <acEn7YTv53VZL6Jj@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0038.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::18) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|MW4PR11MB6739:EE_
X-MS-Office365-Filtering-Correlation-Id: 4672f1b6-4185-4ee6-a677-08de88eaf9be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: /AU7/DeVJ/+jgD6K/L6Vu4TLTqF8BsU+6BCE3qTR22EkTLFkwmab5JBhYwL5a4b7CBI/LZQG4HOxn/bci0SY0Usnf71b4XABqi3KqLC7Ju8iOjz3rmr/OwSIbIfD23s2YPMQnDr5qlp9E24QvkANROUxsLfqH96Ll/B9miH0bZhXa+c2A9VmegrDJta3xOMbVjXROeuuaLFa+/nmek2DBzeHKjnC52q9yUCj1PJBESWFQKulmjG1HaLlTtVsUzJ1qGj1zhcdZj+maJ9jpSUBqXKYsRd1gZ7a4Li27hplVL6mhlEIj+ZlzzNNI+v7p38vT31kcNYjgSXynfHlfjB93dXavGV9DpiNKLk+UC7T/LYslVWGjaj51UxWUWuTjxhh4Dj6Ws22Me2wHu/ofW1Et1tfwJb5e+2FsORlVRSkO3CiIsxnG/yxuEPDi7F044cvPsp3V2Ix+qEbYg5d+5Zo6VYCs3wEkqcyDbkahPt/qCviUXCVrwbYKxu/ky2lyvzSrOJ2gdRDPO0LW58X8ACZHjO/+0Bi74g5jvlKHniITS3CZ6efwG++JP9v2rddXMpQw0ciCUBJtmbsQKOOysVtqF+SRc9gKnxdbkg5zxrZZqfYkZ6eRRkb2saUOGIOM0WfjLth5ws1ppVsVa/AGNJp7+RhEjGijb9DGwzcq55kL640TP5K17PHOmPRcx7vbXu8Si2CKkyUd7MJCGsjmScC4khEBV9kyzgm1hqFIV04rxI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yy84M3V1ekplMFFhVWs0OVpvU3IzYkQ4N01NYm9xTUpkbDVrRzNKVFRZRWQw?=
 =?utf-8?B?RGZtS0JRVitMYTFhMXBVYzVKbWV4ckVHTlFwMnZzbVNLQ0FQOStwN2lxM0Na?=
 =?utf-8?B?RUxXQzNTVnovb3hDWDNNSC80NGc3NFhTUG9PdnBiQmlKUG9JNUdZZVJpcElu?=
 =?utf-8?B?dUNnNW1PRjNKNDRQVlpHWjdsZzRZTXRIV0JmcUwxMkpnV0krakdRZko4RnFY?=
 =?utf-8?B?WE9qYlRzdGowTHA0dmY1MGlhM0Z4QytRVWV6b1FOK0ttak5xRjlnY1ZtWEVn?=
 =?utf-8?B?T1p6NzB0Q3QzVjJOQ3VqTGJBUVpUQm51Qk1LNENCQy9wcUIxYVFmMFdDQms5?=
 =?utf-8?B?VEFCczBDdzVrWndyOS9VSmNuK3lBbTdXUnFNSDFKeXY4YjVka2kvNkI3NU1C?=
 =?utf-8?B?alR0a1JGUGJic2VydGxNRWFXV0VHaDVYa0tqdFJmQ2VmUDljSncxQ2ZpR1VE?=
 =?utf-8?B?OGVCd2FNdGVVQ3lJRWdVZ3dFVFJ4TUZ1eEtXd2pqaGk4dWVwS2FhUlZ5OEJl?=
 =?utf-8?B?SFRSNTNtcVB4NVdNdGcxKzZxdkVwOW45eVIrTzZ1enNmY0h0MjIvYm9SSGpD?=
 =?utf-8?B?bXgrMkN6T3dwYjFFWk5GQlR2by9uelRKaFptUi83MDFrM1NxaUw3YklaTmht?=
 =?utf-8?B?UzlmNUxJT0RQZlRIc2RTdDdsY1d5eUxNbDdpY0FIWmtUYzlaTnBHVUoyczBX?=
 =?utf-8?B?M3VoT0xDVjVHcklRajNHcVBpRGZudGVrcWRZTnB0cTRnM3RXRHVPaEhHOXcx?=
 =?utf-8?B?RkxhU1hYaFVnck04ZkZ2aFZVR2NwQ1VvMHgvWU1pbVlrWlF6MDJZNzlKMEtV?=
 =?utf-8?B?ZFdXenc1cnlJSG1hUE1Wb09rQmUreHJlRFhwaXRDNjFkZzhXbzNmc1hYMmhL?=
 =?utf-8?B?WWY1RjNqMzE0VGdyK3B0dWhpVlRCNjZha0YvcmRjNHBhb29BOTJiTlRDcTVZ?=
 =?utf-8?B?Mk5HWnJ1U2xFZDB0UHFtSVBLa2lIOHd0Y21vNU9DdTFGejZOM3l1Q1RnQUhN?=
 =?utf-8?B?SENNcjVUR2pFRlNlbHNuT2M2Q240K1JnV3B5c1NteFJlemZzRUtaaFJ2bktM?=
 =?utf-8?B?V2E3aW5JYWVlWUlDb3UvdzF1VnorTldRRXdpQWYxYzZFajB5UTlwLzR0dGsw?=
 =?utf-8?B?TkRxNXMzQk1ZQWNGVjF3MmJDMG8zRG1IVVVUbVppU2JGSCtCMUFnbjAvendy?=
 =?utf-8?B?VVZSZlRHcmE4Tm16NGRsNkVESjBmZkkwV29rK3VFZmZoR3B5UmkzczNPZmVT?=
 =?utf-8?B?ejA5RS91WERsVWY4eExuRk8zNWVmZ1RjVnNBcDhrYytQREdBbnNjbXljb1Vn?=
 =?utf-8?B?K2JWZzNta0ZPU25GUDVOeC9WU3A0a21jajVEcG5DVkFWdU5YZ2NIcHdrN3BN?=
 =?utf-8?B?RVhSVjVyS3ppT3dPUldtdy9HUUpSeSt6dUhrekwyTmVncTJ4SS85Wkp6SVZE?=
 =?utf-8?B?VEdjdE5ZQys4d3pDMUI4a2l4dEZnVkp4cEU3SVhHaGxMZ2t1VjdPZUM3UFg3?=
 =?utf-8?B?R2F0ZUFmdHJTMW5PWlRuR1FGK250MmllUjlNTUtJU0IvVFdHWFc3di9nZm5k?=
 =?utf-8?B?ako2N21VWlZQOVRQVVJhNVZRSTg5aW9vZVZTZTFvRnVhcE55alpzdWU1Y3dP?=
 =?utf-8?B?ZWljNStYelZwdFdpOWJoV1B1c0dncS9NdVYydFc1SkVLaHRudWgxZ0J2bkM5?=
 =?utf-8?B?Z0hldk1RRmZTZkdyMjVpTXE2UkVFb0ZIeGpmdWlTT0Z1UGh3dTB5WDl6SXJE?=
 =?utf-8?B?MGY2aGxmNnZOU01FNDM2NWdzQ0pNTk5kSHU2R1dPVXc3ZEtQWHEwcWh5SUVj?=
 =?utf-8?B?R00wNmVHNUJJWXhGKytTaVU1K1ZPcjlHbXN0YmNha1d1Nzh3cC9ZZVc2SE1i?=
 =?utf-8?B?L0dQQmhIUUEvN2dJT2V6WUJWTG9jd2kwRkhNd1FnNm01VTVxTENqWmtONVZv?=
 =?utf-8?B?M2swK3JwWHJ5ZlVBSDd0M25yR1Z1Sm9zK0p0ZnpCQjByNU05Nzl6WnhSUDBQ?=
 =?utf-8?B?OFRxZHNlOUNucHFUVURxQTB2b2t5c1JwUkU4cjV3d3RoQldDSElycnZETWsv?=
 =?utf-8?B?V3pGdzNLMmxTTVlTQ3NoRTdHNUhIZjRPOElPKzl6Z3I1R1hoS1JyZnpKUEVq?=
 =?utf-8?B?T1N5MkpKZDVwamgyd2dGaHFJOEpFR2lRREFaS1Y2T1FTKzBOSHVaTi9aVmdY?=
 =?utf-8?B?bEdlRXEvSmh2ejN5QWRmcSthUWRMeFY0OW1jN0QwT3RzaHYzWlV4eFdiV1p5?=
 =?utf-8?B?N0h4WE9yOHJrT29ZRHNjOVlJVUt3K05YTW5Ra0xmVGFRTWtVdzVSUXdqeVdv?=
 =?utf-8?B?WG1WSUw2VGdCeHdNR0xXTU8zSFJaWmU0TE1hbHZkUWg0cmVBYTlSNXFydGhz?=
 =?utf-8?Q?3aOkUyZG078PwR8E=3D?=
X-Exchange-RoutingPolicyChecked: JTHmhqbO+UOsobeaZ2Fd0eq2Cy5VBTrUlsT500onDjk9J1Jx/nHqWaJhq5kQGF2O+/DjK6mNxUCw1LrT80rGnei2IoieDDgD/67/+B9aJarf4/CTezhEhMUnB2sdyy79zjuIMUeOLlu+n1WXfsAp2f61DNSPufKsuTfvQukN5Mm5TpwdNtzz3M0Ce+UJ/tvK3dOw3D4cKPbjkJfMUZT4ybnkLs7cQMcwZBG22RlTGHNKj4GH89NQLbKY5CLiBuO+R2VV7eLhaRZ0V7/guCikm4hTUsc9EEXToFfdirDfX72WuEgnB1qPTeMx2hTcpJzU0OWNcDfcQmbBiQpU4QTT4Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4672f1b6-4185-4ee6-a677-08de88eaf9be
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 14:46:33.0737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s4taHiITiJ2XN2UWrE9As+R5hzJgqiO1TRjqMcb1SymUgRD0wazJ0VcCPh3lvvKY0fePnnTZBCfgTFYEZiiG1b9iO+5kFMrtjcpEH1B0ZPQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6739
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


On 23-03-2026 05:15 pm, Raag Jadav wrote:
> On Thu, Mar 19, 2026 at 07:30:06PM +0530, Tauro, Riana wrote:
>> On 3/12/2026 2:36 PM, Raag Jadav wrote:
>>> Add initial support for correctable error handling which is serviced
>>> using system controller event. Currently we only log the errors in
>>> dmesg but this serves as a foundation for RAS infrastructure and will
>>> be further extended to facilitate other RAS features.
>>>
>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/Makefile           |  1 +
>>>    drivers/gpu/drm/xe/xe_ras.c           | 89 +++++++++++++++++++++++++++
>>>    drivers/gpu/drm/xe/xe_ras.h           | 14 +++++
>>>    drivers/gpu/drm/xe/xe_ras_types.h     | 73 ++++++++++++++++++++++
>>>    drivers/gpu/drm/xe/xe_sysctrl_event.c |  3 +-
>>>    5 files changed, 179 insertions(+), 1 deletion(-)
>>>    create mode 100644 drivers/gpu/drm/xe/xe_ras.c
>>>    create mode 100644 drivers/gpu/drm/xe/xe_ras.h
>>>    create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h
>>>
>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>> index 373adb20afb2..9811cf732260 100644
>>> --- a/drivers/gpu/drm/xe/Makefile
>>> +++ b/drivers/gpu/drm/xe/Makefile
>>> @@ -113,6 +113,7 @@ xe-y += xe_bb.o \
>>>    	xe_pxp_submit.o \
>>>    	xe_query.o \
>>>    	xe_range_fence.o \
>>> +	xe_ras.o \
>>>    	xe_reg_sr.o \
>>>    	xe_reg_whitelist.o \
>>>    	xe_ring_ops.o \
>>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>>> new file mode 100644
>>> index 000000000000..37a996a6abf8
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>>> @@ -0,0 +1,89 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2026 Intel Corporation
>>> + */
>>> +
>>> +#include "xe_assert.h"
>>> +#include "xe_printk.h"
>>> +#include "xe_ras.h"
>>> +#include "xe_ras_types.h"
>>> +#include "xe_sysctrl.h"
>>> +#include "xe_sysctrl_event_types.h"
>>> +
>>> +/* Severity of detected errors  */
>>> +enum xe_ras_severity {
>>> +	XE_RAS_SEV_NOT_SUPPORTED = 0,
>>> +	XE_RAS_SEV_CORRECTABLE,
>>> +	XE_RAS_SEV_UNCORRECTABLE,
>>> +	XE_RAS_SEV_INFORMATIONAL,
>>> +	XE_RAS_SEV_MAX
>>> +};
>>> +
>>> +/* Major IP blocks/components where errors can originate */
>>> +enum xe_ras_component {
>>> +	XE_RAS_COMP_NOT_SUPPORTED = 0,
>>> +	XE_RAS_COMP_DEVICE_MEMORY,
>>> +	XE_RAS_COMP_CORE_COMPUTE,
>>> +	XE_RAS_COMP_RESERVED,
>>> +	XE_RAS_COMP_PCIE,
>>> +	XE_RAS_COMP_FABRIC,
>>> +	XE_RAS_COMP_SOC_INTERNAL,
>>> +	XE_RAS_COMP_MAX
>>> +};
>>> +
>>> +static const char *const xe_ras_severities[] = {
>>> +	[XE_RAS_SEV_NOT_SUPPORTED]		= "Not Supported",
>>> +	[XE_RAS_SEV_CORRECTABLE]		= "Correctable",
>>> +	[XE_RAS_SEV_UNCORRECTABLE]		= "Uncorrectable",
>>> +	[XE_RAS_SEV_INFORMATIONAL]		= "Informational",
>>> +};
>>> +static_assert(ARRAY_SIZE(xe_ras_severities) == XE_RAS_SEV_MAX);
>>> +
>>> +static const char *const xe_ras_components[] = {
>>> +	[XE_RAS_COMP_NOT_SUPPORTED]		= "Not Supported",
>>> +	[XE_RAS_COMP_DEVICE_MEMORY]		= "Device Memory",
>>> +	[XE_RAS_COMP_CORE_COMPUTE]		= "Core Compute",
>>> +	[XE_RAS_COMP_RESERVED]			= "Reserved",
>>> +	[XE_RAS_COMP_PCIE]			= "PCIe",
>>> +	[XE_RAS_COMP_FABRIC]			= "Fabric",
>>> +	[XE_RAS_COMP_SOC_INTERNAL]		= "SoC Internal",
>>> +};
>>> +static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
>>> +
>>> +static inline const char *sev_to_str(struct xe_device *xe, u32 sev)
>>> +{
>>> +	xe_assert(xe, sev < XE_RAS_SEV_MAX);
>>> +
>>> +	return sev < XE_RAS_SEV_MAX ? xe_ras_severities[sev] : "Unknown";
>>> +}
>>> +
>>> +static inline const char *comp_to_str(struct xe_device *xe, u32 comp)
>>> +{
>>> +	xe_assert(xe, comp < XE_RAS_COMP_MAX);
>>> +
>>> +	return comp < XE_RAS_COMP_MAX ? xe_ras_components[comp] : "Unknown";
>>> +}
>>> +
>>> +void xe_ras_event_log(struct xe_sysctrl *sc, struct xe_sysctrl_event_response *response)
>>> +{
>>> +	struct xe_ras_event_threshold_crossed *pending = (void *)&response->data;
>>> +	struct xe_ras_error *errors = pending->counters;
>>> +	struct xe_device *xe = sc_to_xe(sc);
>>> +	u32 cid, sev, comp, inst, cause;
>>> +	u8 tile;
>>> +
>>> +	xe_assert(xe, pending->ncounters < XE_RAS_NUM_COUNTERS);
>>> +	xe_warn(xe, "[RAS]: threshold crossed, %u new errors\n", pending->ncounters);
>>> +
>>> +	for (cid = 0; cid < pending->ncounters && cid < XE_RAS_NUM_COUNTERS; cid++) {
>>> +		sev = errors[cid].common.severity;
>>> +		comp = errors[cid].common.component;
>>> +
>>> +		tile = errors[cid].product.unit.tile;
>>> +		inst = errors[cid].product.unit.instance;
>>> +		cause = errors[cid].product.cause.cause;
>>> +
>>> +		xe_warn(xe, "[RAS]: Tile:%u Instance:%u Component:%s Error:%s Cause:%#x\n",
>>> +			tile, inst, comp_to_str(xe, sev), sev_to_str(xe, comp), cause);

Please fix Severity/Component Parameter Swap.

Thanks,

-/Mallesh

>> We can have minimal logging here with only severity and component and add
>> additional logging
>>
>> in following patches.
> I plan to remove it entirely once we have cper in place, but until that
> happens (and given the fragility of things) it'll good for debugging.
>
>>> +	}
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>>> new file mode 100644
>>> index 000000000000..22f035fa498d
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>>> @@ -0,0 +1,14 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2026 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_RAS_H_
>>> +#define _XE_RAS_H_
>>> +
>>> +struct xe_sysctrl;
>>> +struct xe_sysctrl_event_response;
>>> +
>>> +void xe_ras_event_log(struct xe_sysctrl *sc, struct xe_sysctrl_event_response *response);
>>> +
>>> +#endif
>>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
>>> new file mode 100644
>>> index 000000000000..2982c4696b6d
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>>> @@ -0,0 +1,73 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2026 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_RAS_TYPES_H_
>>> +#define _XE_RAS_TYPES_H_
>>> +
>>> +#include <linux/types.h>
>>> +
>>> +#define XE_RAS_NUM_COUNTERS			16
>>> +
>>> +/**
>>> + * struct xe_ras_error_common - Error fields that are common across all products
>>> + */
>>> +struct xe_ras_error_common {
>>> +	/** @severity: Error severity */
>>> +	u8 severity;
>>> +	/** @component: IP block where error originated */
>>> +	u8 component;
>>> +} __packed;
>>> +
>>> +/**
>>> + * struct xe_ras_error_unit - Error unit information
>>> + */
>>> +struct xe_ras_error_unit {
>>> +	/** @tile: Tile identifier */
>>> +	u8 tile;
>>> +	/** @instance: Instance identifier specific to IP */
>>> +	u32 instance;
>>> +} __packed;
>>> +
>>> +/**
>>> + * struct xe_ras_error_cause - Error cause information
>>> + */
>>> +struct xe_ras_error_cause {
>>> +	/** @cause: Cause/checker */
>>> +	u32 cause;
>>> +	/** @reserved: For future use */
>>> +	u8 reserved;
>>> +} __packed;
>>> +
>>> +/**
>>> + * struct xe_ras_error_product - Error fields that are specific to the product
>>> + */
>>> +struct xe_ras_error_product {
>>> +	/** @unit: Unit within IP block */
>>> +	struct xe_ras_error_unit unit;
>>> +	/** @cause: Cause/checker */
>>> +	struct xe_ras_error_cause cause;
>>> +} __packed;
>>> +
>>> +/**
>>> + * struct xe_ras_error - Combines common and product-specific parts
>>> + */
>>> +struct xe_ras_error {
>> error_class ?
> I know that how it's in the spec, but it's full of needless verbiage that
> doesn't add much to the meaning. I'm fine either way.
>
> Raag
>
>>> +	/** @common: Common error type and component */
>>> +	struct xe_ras_error_common common;
>>> +	/** @product: Product-specific unit and cause */
>>> +	struct xe_ras_error_product product;
>>> +} __packed;
>>> +
>>> +/**
>>> + * struct xe_ras_event_threshold_crossed - Event data for threshold crossed event
>>> + */
>>> +struct xe_ras_event_threshold_crossed {
>>> +	/** @ncounters: Number of error counters that crossed thresholds */
>>> +	u32 ncounters;
>>> +	/** @counters: Array of error counters that crossed threshold */
>>> +	struct xe_ras_error counters[XE_RAS_NUM_COUNTERS];
>>> +} __packed;
>>> +
>>> +#endif
>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
>>> index 47afca586bd1..1833ecadd9a1 100644
>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
>>> @@ -6,6 +6,7 @@
>>>    #include "xe_device.h"
>>>    #include "xe_irq.h"
>>>    #include "xe_printk.h"
>>> +#include "xe_ras.h"
>>>    #include "xe_sysctrl.h"
>>>    #include "xe_sysctrl_event_types.h"
>>>    #include "xe_sysctrl_mailbox.h"
>>> @@ -38,7 +39,7 @@ static void xe_sysctrl_get_pending_event(struct xe_sysctrl *sc,
>>>    		}
>>>    		if (response.event == XE_SYSCTRL_EVENT_THRESHOLD_CROSSED) {
>>> -			xe_warn(xe, "[RAS]: error counter threshold crossed\n");
>>> +			xe_ras_event_log(sc, &response);
>>>    		} else {
>>>    			xe_err(xe, "sysctrl: unexpected event %#x\n", response.event);
>>>    			return;
