Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53083EDB7D0
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 21:47:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B5210E4D9;
	Tue,  7 Apr 2026 21:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MxmCcYr8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF20610E4D9
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 21:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775598450; x=1807134450;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=e9woFF0RPdu6SUlVNRhrwIHxOWYgz9Ew+QwGpIz57ac=;
 b=MxmCcYr8A+UxVNcCg36DHT6bGwjWSAmeAFmqmedhKExlz+vzMVi3su8M
 vGuiA0h1Id91+swa9XDG9cFe90MttaQXx98SKz0m1tiH4KuqvneGkvCk/
 3bqmlmS5xvCZv7wYR8SBG08oF5/AhPxHQNRv2mDh2HfjJdt6ZIFW97azp
 3W2MBj5ta9SO/rdEihOYj13e25a5NUMd7+Rya53YuVnHQAKOZsqjmIaTp
 OzrSZNi9i1CFdS9OiAm6xuF1H8/zPnH3XVwL36awlqSviAKiof+WMzg2i
 fOAbX556xUSgF4fe/04pGynX/CaVSwjU/jy3vsDZ0ECgbOhkhXqctoNI+ A==;
X-CSE-ConnectionGUID: JarPZhJtQL6sBPBTZu1myg==
X-CSE-MsgGUID: 725DB9QlRiK9PcAH5NfNYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="79163217"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="79163217"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 14:47:24 -0700
X-CSE-ConnectionGUID: utgFPd2KQMKMDuso9yRcwA==
X-CSE-MsgGUID: wcIl3W6XSPm43mYftvdQew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="228220704"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 14:47:23 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 14:47:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 14:47:22 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.23) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 14:47:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FQxfQUGAby/E7elzTgl+BsFzgoPBYKxhL3+N2e0o2BCSX7bUMkODzDak4H9wpU8p3U+RjGOx55x58xUH1q8bqUNdRBltFo8bcGplEDPS6g19S2ITzBr+uxHpIrW+AYD4Pvb+SYpuX5W6yvnVILy6sA+hw9sKRd4GC+0g1Y+EBvB1Sw1c865PBKPrlRjrpmVJbBIQay+AmxqzmnHq6Vsdq31Uqo6gJRUcx2qhbMdvtz3jD/scZV34a+JR8yNZXcJq9bKwPYouAd7KRyh18qURKA0rdOAp32CmXfYHb+0wT2LPAvAnXbLAfuOYF569Bdd/ukT/z9IoaYCuSisjQkrT5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8gSv8tkoQ7ZkMwzYQv9Sk8PiGfKX6ilaZNqSweUMQag=;
 b=Y6KIph+Dsssu3rRLanuKrlfD58Dh80NvPOxvfbmtxBs6Ovjg+Y7bmPE1i9sWn8sfj/2tCjYxqkD+Sfuqy2CszQ/M7qNR4C4Lz+Yh1tfRw0+0XSUtmrKsKoOfCY2j0/kksnleJlbGqsIX7eGqr3e8wm2sHOIcsJ7zQPKCQLQWHSwxGdTUtDPzRZ6+Va0G/atxvsxslLQYDBnP1qQSUBjHXcysLvnm+GCfCso3hSRNaShionowJu/LFjCOGB7CfC9hhdG+TIZVFkMcMAdjF4COg+Wjo65KFnpfo02xaleZG2m2X0yh4hC6MqBp2IkK4UzrfwbU+gbArgrPt7pZQDPmuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by CY8PR11MB7194.namprd11.prod.outlook.com (2603:10b6:930:92::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Tue, 7 Apr
 2026 21:47:20 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%4]) with mapi id 15.20.9769.020; Tue, 7 Apr 2026
 21:47:20 +0000
Message-ID: <6ae97384-9960-48e4-8188-7ecb24d7e5c8@intel.com>
Date: Tue, 7 Apr 2026 14:47:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] drm/xe/uapi: Fix code examples in xe_drm.h
 documentation
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260407030046.3394004-1-shuicheng.lin@intel.com>
 <20260407030046.3394004-6-shuicheng.lin@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <20260407030046.3394004-6-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0030.namprd08.prod.outlook.com
 (2603:10b6:a03:100::43) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|CY8PR11MB7194:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ec4500b-2e3c-49da-0cdf-08de94ef3e71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|42112799006|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: Fv/qZ1Vh2f1MT/RKaZEoQzgHEXhKuOGbwKzbcTD0HomS1exYPOhRQ+jnJEfd81UzVYViuWFKE9d4rv0zPfN3TTnHGWf+Q4/gsjjDvsZbiQ+PBzXU/zZ5i+RNYZtlsO/7RY/g/T1y1PjVZuvqkCofrzrH//ahr47xcLqaQ2F8GleCiJ8L9blhC5FyyimFju7DkMFNPv2n34delnEysxn1sSF7NIwpK2SbtLfIEmzsAbr1JoZp/OgirmFbUSbI3qbNSCmOLq3nyjNYCE2aQx6FprNLygVJlu6Vd9PPxNRBT9phZHkpcogoS/wQIoaoBbeqFa9Yu5pSt3W+w6/q9pg4ZPZe0u7+ehGDGsUEZuti0IC4T63ybabAIOCczw7YCoa2q61WMTVPRuLfj9FD842ipoe9muAg98hrH+ABpBxIspgHC+BnvxPY0UtcEZWckF9KHVeoTMzpUr0Xbvi7mS72uO62SYGCZj0CQ2SykcSMGBWT28iWaAanbKZbkQrru2PtNgpXnusboV2atuK24oNRZszeo6naMgAb6WBsO3z5T4bvsWQ0nfPSislM2Xiit58T7EpaGvAAYcjuHwBERCcp2que/+8x6NN/PTv7f+CGKfmhrMuIvFZFZXAUQH9vBq/Wp2XlVgGAyD9Vrcio1EJscl/omPWZp4b70YSCHfqO0ci6xD6DnNoCEkzM42i5FRdbz483Z2Lh+6B+TSgR1aPZFN1B06y9Dw+oEb1CVkX8KJ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(42112799006)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1l5MWlEbEc4dnRoNzduaEpRYnNSZUNIWEY1MVNsR0xSdk1xNFNuNUUxTm9v?=
 =?utf-8?B?WmVJdmg1VGlUUmFHK0E0YmZYQkxFWTZkUW5wSEM1T0UwdllDbGdHVzBmQ1dF?=
 =?utf-8?B?Q2xxOWVvL3dlNnBmVmtJYU5OcFBWY1lLOEtqK0VVMGNBbXBKK3Z6ODl2M0hk?=
 =?utf-8?B?WmxnUjVOWXMraEZHZVdRVW5nZUZFdUxSMVlFOUYrZjBQa1o4Y1owSTdZZ3oz?=
 =?utf-8?B?NWFacGxOZzlUcEZtWDR4YWthZE5Va09BV05DMWordHJYUXYxZ1kveXB1OUNi?=
 =?utf-8?B?VWJpNCtzR3JHeEJseGIxUDFiZGlGOTVZbHJSeGVmcEZUYk5YN0RSVUE1ZEE1?=
 =?utf-8?B?SklFZ1c0ZlV1VlpqT1NBMjV2R082VUU2Wk1iRXRsMlZKdHR3V1dLUDBKQUZZ?=
 =?utf-8?B?WDU5SlhwdzRLRFhTOUV4a0pHRGNMcUQycVRDQXBCMmZDRUdzQlBqSlpNeG1P?=
 =?utf-8?B?KzZzMVVDS21GU1BMUXpUTDVNbmdtalVva3V2bjNGbnVJLzFxNVh3VzBBM1hm?=
 =?utf-8?B?dXA3Sm1qanlmQzIwbXl5SnRSQmZsYXk2TVVnYjlUMmIvS1BIcDU4YlVlanpv?=
 =?utf-8?B?WnhHdDVQcDlwdFNTeUlDRjhwRVBSbXR3b1BVVUhjbEV6eUo5am5mQzJUN3Fu?=
 =?utf-8?B?V2FiSUxUZ1F4cnVoRUM0VFFKb2NsL09pSHhDbHZQN24rRGJoRnZXK1RVM2NI?=
 =?utf-8?B?QldtSXJkVXc4MjlRWXN3NS9sUjUzN1pjclFFaStHMG1sMjJYMEFqKy90V29T?=
 =?utf-8?B?emZsV0pWUlRuSFphOG5wcUptUnRNTyt0R0xvbk1mR2ZLaWNjSGNtMkNHeStB?=
 =?utf-8?B?azdUVTNVM3BYRzRUcGU1ZUpIb3B2WnM1cjhJRVFYdlBpQlh2K3BFUzg2SUN5?=
 =?utf-8?B?QWFFbjZFT3k4YmI1Ry9mcXJEaCtoRjRZbkdVVGVqcjJjNmZZZlVkU2R3Tjd0?=
 =?utf-8?B?a0NhUzJ3QnNQa0pOaHZsYXlvU2FKUjZvdXRKVVIrWE9SbktiWFBhd24vcC9j?=
 =?utf-8?B?VVRlcTZlLzVjemVoaUIxb084VEtZUFJkKzV1QnA0cWw0TGNxZzlJSlFjeU5y?=
 =?utf-8?B?ZUJBY2tialdXQ09OdDNpMkQ3ZUJSVHF2OFJ2OWFkc1JmVVdoWFU2ekZWNnhX?=
 =?utf-8?B?WHhMNy9HWVNjcVNvQUV6RklCQUN3dnU5ZGwrYWJQTEhYRlgrU2F6MUhxek40?=
 =?utf-8?B?ZkJwank3VDh2WmJtaUxRR05oQVlIMVFPckVETXRITTBxS3AvN3dyclkrR1Q5?=
 =?utf-8?B?NVpDWit5VjRiOXJzOVNaVjNiQjY0ZDcva0ZkUTQxSmIrcVlncDNISFNTUXg2?=
 =?utf-8?B?alZtZEIwUzlJcDY3TGJiQTZlYWlSbDlscWdCV25pRlBlZFBYc2lIRkJRZi92?=
 =?utf-8?B?ZEsyemdwUGN5NnBTcE1RMEdPZTZnTUVqMVZYc2ZzclF6SnI5NWVPOEVBWXM5?=
 =?utf-8?B?dG93MS9qaHo3cEhTRTBNc0RJcTJtUzBWWk9HNzdJbUJIeFJGUm9ib052bVM3?=
 =?utf-8?B?amdyWmM0cDVhL280djdrOWo1QnhzcjBEWHJNTEpOdW9YZ2wzQTM4UGpiVWNv?=
 =?utf-8?B?Q3lxcDZNQk1LQWJSSnI5ZE03WithTGIxK0JKV1hzamtuU3FLYThaNjRtZ0RM?=
 =?utf-8?B?RFErVjFhNkpnZ3pHVHNKQTA1Y2V3b3BHWDNzM1diYVUyUkFlTmMwNnRTR2NQ?=
 =?utf-8?B?QUtpNkRSYldMSkF1anh4dmlFTm9zeFRoVkR1RWkyMlRVck5OQm1hM2U4aUMy?=
 =?utf-8?B?T1FKeWFEeGFwMnQxQ2E4WmxqVmFpcC9ES1BrT0d4ZW9RUlVJeEdMWXcyMTBS?=
 =?utf-8?B?aHdrRHZqMnJibEJ5cTRHMjUwVmpmTEZqRHdpbm9ZS0VUSitrZWpKK1JaQTk4?=
 =?utf-8?B?a2NjTTBiYUROR0Vwd3lqdDFDbDhyYTNrWVJvU3ZzMDhmZWtmTUxxUkZyZGZZ?=
 =?utf-8?B?aWpFWll2YUZiS3VRM1psaFZiM3h0ZllQSmJrQkdSeFhQSHh2ckdDRWpXNkU5?=
 =?utf-8?B?andkR2JqU2ZKQ1BJVHBPVmt3T0pySURKSmdtOGJ4QldQUVZnd2JEZXRnUVdF?=
 =?utf-8?B?N3p5TzUxUXJLWk9pVUpOQW1RODIyWG9YWFZ6VGZTNVZSeisrRkNSdCtRVVgw?=
 =?utf-8?B?WVpVOVhzbWdGaStsdnRqczN6OE9jakMwUWx1OXhsQ1pxSGZUd1V6d0xnSmVY?=
 =?utf-8?B?WlBjZ1lNdHdxclZSc0RxWUVOL2J2Z3gvSUhOdlV4RG1nQ3VndUNIUnhrcGpv?=
 =?utf-8?B?VUh2V0ZmUUJtQ3J3M1NHNFhpajhrQnk2cFpHd3NETml5TzB3V3hMTzlnSUpZ?=
 =?utf-8?B?YkkzbTZ0ejBZejVUTjVycXVHMzRWZ2hqMW84QXAzS2VaUUpIdDJLQT09?=
X-Exchange-RoutingPolicyChecked: RSDhT9X3z0M3VbP3z5/BiGAYx+RsfFlxbjjxxN6whAzKMO+T/PddFYMGw5GhLje+J2Zr+0mK6hBLhaoXCbi3FeuU9X2DpfB9pCZeRWiZHAPQMDqUpP1dx23+Z4dUzwCarDiGzSHP/ztIZizs48aBp16oY7u3TPauXQhLwP4W9uprCbf7rL6D50gFb3ZiUdUViVhbMVetSADxdj/Z3DR8WqixbdLjiANR+UTQEoDMaged/uJqBYXsVbTFJqi9LVqPVdWcBrThmUnj+BjMmikz40our7IIJBWoPFZL+VoGZCPLaSkcUiP2iXH5xyAAtXl1k7U2qfMoSZDaRh3ewZaWrQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ec4500b-2e3c-49da-0cdf-08de94ef3e71
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 21:47:20.0201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cte8j2MjkQVuU7G8qYwaqKLyrr/oB5mIPjSoqFBUybEJ/fwLKX6Hna6oiJAv+8+y+P0yVduJarbNx+TzAbBoPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7194
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


On 4/6/2026 20:00, Shuicheng Lin wrote:
> Fix incorrect field names and formatting in code examples:
> - .num_bb_per_exec -> .width (renamed struct field
>    in exec_queue_create examples)
> - .num_eng_per_bb -> .num_placements (renamed struct
>    field in exec_queue_create examples)
> - .atomic_val -> .atomic.val (correct nested struct
>    field access in madvise example)
> - Remove unnecessary backslash escaping in UUID format
>    string (%\08x -> %08x)
> - Fix descriptive text trapped inside code-block in
>    exec_queue_create doc (split into two code blocks)
>
> v3: one more fix of split code-block in exec_queue_create doc.
>
> Assisted-by: GitHub Copilot:claude-opus-4.6
> Cc: Xin Wang <x.wang@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>   include/uapi/drm/xe_drm.h | 22 ++++++++++++----------
>   1 file changed, 12 insertions(+), 10 deletions(-)
>
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 8751ad7b845f..58614f62d65b 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1401,23 +1401,25 @@ struct drm_xe_vm_get_property {
>    *     struct drm_xe_exec_queue_create exec_queue_create = {
>    *          .extensions = 0,
>    *          .vm_id = vm,
> - *          .num_bb_per_exec = 1,
> - *          .num_eng_per_bb = 1,
> + *          .width = 1,
> + *          .num_placements = 1,
>    *          .instances = to_user_pointer(&instance),
>    *     };
>    *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
>    *
> - *     Allow users to provide a hint to kernel for cases demanding low latency
> - *     profile. Please note it will have impact on power consumption. User can
> - *     indicate low latency hint with flag while creating exec queue as
> - *     mentioned below,
> + * Allow users to provide a hint to kernel for cases demanding low latency
> + * profile. Please note it will have impact on power consumption. User can
> + * indicate low latency hint with flag while creating exec queue as
> + * mentioned below:
> + *
> + * .. code-block:: C
>    *
>    *     struct drm_xe_exec_queue_create exec_queue_create = {
>    *          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT,
>    *          .extensions = 0,
>    *          .vm_id = vm,
> - *          .num_bb_per_exec = 1,
> - *          .num_eng_per_bb = 1,
> + *          .width = 1,
> + *          .num_placements = 1,
>    *          .instances = to_user_pointer(&instance),
>    *     };
>    *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
> @@ -2019,7 +2021,7 @@ struct drm_xe_oa_config {
>   	/** @extensions: Pointer to the first extension struct, if any */
>   	__u64 extensions;
>   
> -	/** @uuid: String formatted like "%\08x-%\04x-%\04x-%\04x-%\012x" */
> +	/** @uuid: String formatted like "%08x-%04x-%04x-%04x-%012x" */
>   	char uuid[36];
>   
>   	/** @n_regs: Number of regs in @regs_ptr */
> @@ -2181,7 +2183,7 @@ struct drm_xe_query_eu_stall {
>    *         .start = 0x100000,
>    *         .range = 0x2000,
>    *         .type = DRM_XE_MEM_RANGE_ATTR_ATOMIC,
> - *         .atomic_val = DRM_XE_ATOMIC_DEVICE,
> + *         .atomic.val = DRM_XE_ATOMIC_DEVICE,

Reviewed-by: Xin Wang <x.wang@intel.com>

>    *    };
>    *
>    *    ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise);
