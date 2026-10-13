Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFDADCA9EC5
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 02:18:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 910D710E00B;
	Tue, 13 Oct 2026 02:18:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59ACC10E00B
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 02:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791857894; x=1823393894;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+aYrv5Gzj6OFRwBcLz6L3rH6t89Kfz0kieSmPHN3UX0=;
 b=cjjxFzJkvUvnm9QzMcDtpYR/ONqK6lrCeyujG3Q1KSvywNT0OYM1R0Hx
 98paXyjLLmzFXofpXLwJLUiA1pK26q2YYKpS8eroKV2dttLmt7sClRD5Z
 g+vowmkUEYG09Da1XPolvhawt6Mk6Rfdqea6HT+Ze7PHVbn41Mr6NUGG1
 p3uWad4U5PA4THwL9GL7huh6+O70Ws1G6Y3TodePqUdvlr6LIv3es+3tH
 T3RghANXVyO1wQaydJBMcScVpEjJJDcxPR/Napg0g08g4fA+PoodmhYcU
 ShO5+NEluGJjLhLHzvnsa11omm65ltNMLDHg5ysdLx5hv9vdvTUzwMYkP Q==;
X-CSE-ConnectionGUID: vvVJs9rPSsWj6t4LV3GoAw==
X-CSE-MsgGUID: 3bX0JMb3TF2Uw5gk5fthpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="459826"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="459826"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 19:18:14 -0700
X-CSE-ConnectionGUID: nK55dqFSQFKH3Rb6peW/WQ==
X-CSE-MsgGUID: dPbDBUrSTiKX7rJij5fvVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="999435"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 19:18:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 19:18:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 19:18:13 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.69) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 19:18:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hLSAr+OPXyROt2fNixMd5kEl97DkP2TCLKVrxO/WEy7TF+KEFoYBForyClOTyrqp/SY3f4iGEqYZ8Y5vBiYA+qfrS4T5pcUm71yHIJt1RhKFZNSLzGlUvolkZ453VT5vV2CsUiGyjtfejkVKabe13G/gCIFliWh26Nia93t65iuVPhpoXkeJo/XwvU2HeT6UnkdAoKtAfpHW3RtiGcYFPARXnY5XiUg/MpvjoOM6tUY/uUQtOu02niu57Hc+n6IGuNPs37zOMXqCJXP0d331Bc0CRJB6mbjbx08CJwuBLCM9lUja6sH6QsBcv7ZZGAN8Mgt1EuRvIEXga13GMEPh+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ygQA+VT/cFyJlyX/yLnc0aOj4VOji8IKcZ96U4PPwU=;
 b=Z0hVBMAk+H3D3lp07w9uJlE6ah/lTSOTe5EhIsmapV05QQYMMS7jcSpQdhinQPZ1psUL1yi4NKomurAlCOCtSiJ8sEFtko3cwgV/ugiQuAUKI7d7t7i2eihiM7NRsheL+GbDWVdzSHSmmcremITeLsG97KCxQz/KfZkoTR9inhZFwc0FybjYWiXUnOHOrEaNPruyYH7E0XQ/Dkt8l4TvtO5BHk/7l16Gi3nHX2A/I2ELijsoAPF6Epf0r3vZwVH5eKKAveWoKeYEUrMVaMp4NUmaDXn2bLep1QDdWMKPOGnlom0qKCyxWvuwJqP8Skb9zhwieeTGH8DAz2SpGGkY3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22) by IA0PR11MB7282.namprd11.prod.outlook.com
 (2603:10b6:208:43a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.25; Tue, 13 Oct
 2026 02:18:07 +0000
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7]) by CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7%4]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 02:18:07 +0000
Message-ID: <2dc5e3dd-afd4-43e3-8e3d-4c028c87ac3f@intel.com>
Date: Tue, 13 Oct 2026 07:47:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 00/16] drm/xe/hwmon: Update hwmon thermal mailbox
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
References: <20261012130401.443473-1-karthik.poosa@intel.com>
 <as2B6WPZk4xsCo3_@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <as2B6WPZk4xsCo3_@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0135.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::12) To CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR11MB852307:EE_|IA0PR11MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: b6e44af0-5b49-432b-97c4-08df28d03858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|6133799003|18002099003|22082099003|10067099003|261009223027099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: UV2Gn7DrDNMCD0tx1fgyC6cepVVFYA0Oaw8t979lmYSjDD8Rz6aAn8mT6nVFStmyJl/1yP/twLej0hO3eEKobmH9G4T3aA/7v3he8v6dfEE5XFCaLhZBA1oy39UbwpIxBL9zOTN8ksPE2DUvVYHxZhe3xMzxWY62vAoHAkyX7QVQTpyTsAXrT0dr1BEXOgcgHiI8viAV/Q1FdzTotjwzUzHoKyypQ9UM74sx9JubvP8+BXpZtQy1Cc5gwCtGXrZZ9JFlfYeBCVntnAzoIUuHNPJIT1UsjqQ9UhENvXWWL/BPsUWTNg6RF01Entzsrm+oApImBcDO+jlkqwxVakB63e6YofeBomARoPxwYtXCSYNvf11pvHgMm08pUOocNEvDHZ6fBDIxjPmMrqyi4KD48ZxylLV2jmTz8wClHe9Pbke21i4RgzCJj6oJdC2u/A/3wXkNhZtEtllLksbfJYFqDRgVNAgJwSLqNfc1hAJFd7jeaH5uSI0vqyZJ4tpjBujyQOZNQXRn6NGGq/LTckbIfvlHzc9XN4D1jvbt7koDQGoD5rM/fEsDe675WiUlbd7T00wONVTuCUfwKekiNIFR3yTM9CV3t7MhdD/7OSFNDD3Cgv2rq+bWGimF/hnu5cAr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH8PR11MB852307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(6133799003)(18002099003)(22082099003)(10067099003)(261009223027099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEJVcTZJNllJNTRYMGNvVEp6RU1nOGgwanRoZXJtV1Zjb25uTE5GOEhGc2RZ?=
 =?utf-8?B?cjQyZ0ZCUWg3VzVpRmlaTmdGWmJrQzNDbnZKQWFpM01qQnpFSGFnV1JXOWVV?=
 =?utf-8?B?ZU5la09BUlViMDNNS2U4M0lGd1FvYXp0dTMzdWpCRzZtUG5iUjJWaEZaT011?=
 =?utf-8?B?NzNCeStaRVdxZlZScUMzY29JUUVpcmI0VzNrNnpwSjZmVmNiNVFCMnV2WE9o?=
 =?utf-8?B?RjBFY0ZQMWI2TElsOXdFb0JERWwzSlNGRVY5SXRFYmhmT3lBNGVOM2NKb3Zp?=
 =?utf-8?B?bkJWVkJsR0dieFVtUmNnRDJWYysweXcyQk1JNlFpT09iTDZTZUNTcGczZ0Zh?=
 =?utf-8?B?aS9XZkJYZmVSZUJzZkJrSEN5SW1jc09sQWg5WEpyaDJ3cXF6cUNVNXBmQ3JO?=
 =?utf-8?B?VFpHdHkwaDVlNXdpWWZENGNTNzcrUENCVWFqVVBRaURIb2Q0dlRtUlFocmlL?=
 =?utf-8?B?NVJaSituL2RPc2RYVHdFM3hoVzVjTXVnclJtSitobFQ0WWJMdlZIYldQU3A0?=
 =?utf-8?B?NXV1bEZCTmUvdHJvRE9jRERJUWdqM2tDa0k3TGl0UkFrcWVYMVRjNVJlMUxK?=
 =?utf-8?B?RmZ6WXZ6VXJhRTdtUk0yQUlLUjRWTHdnQ3kvMFRPUGxlR2ZGL0REcmRaTHdD?=
 =?utf-8?B?NHVFV0dqUjNGVzNiQnVKbkJ5Z1NIRjkrRXdDTmVLUWMrUjFXbU01MlFiRWVN?=
 =?utf-8?B?cFVvWGhrcHFRMDJkdlpTTDVhc01pRkQrVFlCV21aK3IvcDdmbG0zZndPcHhp?=
 =?utf-8?B?WHE2NjlQdUFSekpKV2FOSE1qWXJ2K1dndXoxVEdvQ1JMVXBwelFGTlNWbHlZ?=
 =?utf-8?B?UDBRVHQvWUpGNGJlS1U0bS9FeDM1QjR0T001WHYzb2dORW1xTFpUM0hLWmxs?=
 =?utf-8?B?ODhPdUh1NVpVcEo0ZnRPQ3UvMjYvN1hVRS9BVlhMK1pSZVdLcXhHbkoyVjJW?=
 =?utf-8?B?bEY4dlE4QnNDcmlmTzJJbEtBdW1WSWhaUTIwVTN1VEU3SXAzQlhscVNRdFY5?=
 =?utf-8?B?UkJCU2RMeEZxWlhTNGt6Q2JVOTRNSkVValJxaURYbkF5SVZhNGhNVlQ5RlA0?=
 =?utf-8?B?RGlsUml4ako1REZLQzVNNzJKaUpNbUNKTVV6MlFGbSt3bXFZcTNvSjFzSXo2?=
 =?utf-8?B?aGxWRFNXYlNNYWhvMFJVR1Npc2RsVXNIRld4anJ5V2xaNTFvUnNyZU4xNTY1?=
 =?utf-8?B?bUpnSDlGWThpY2pFOFVMc0VhSmxBTUhiZ1B1MjV2YjhCQWIwaGRoN0RLUFRl?=
 =?utf-8?B?TURLQmJUMmxEdXlWYldlS0R2Tk9OV2FUelZ0Mnh5ZDEzZ1ZRSi9odDNHQ3di?=
 =?utf-8?B?bzdyMU9SZzcyUjNIYmFkQjM0WXRHdDZWYnZxTldhZzc2VUMweHR5VkhrWkFI?=
 =?utf-8?B?cStiLzBnNmpDemJzUVdyT25GWVVqclBxaEJXK0NBS1p2RWFlMWt5ekh1bEdH?=
 =?utf-8?B?Q3lKc2xra3NZSXd1WjBUWmNha21QWkR3ZHpLNE5FdU1rZHpzNmluNDJoaTA4?=
 =?utf-8?B?dmZaUURsSnBPbnJ5TzVvdlJTWHlycmJkSFJoTS9FWnBHT041SnFaZUEwZ3ZV?=
 =?utf-8?B?dlBCV21hV1dWc3V3am1SdStlZHROb3djM3ZhTVZ2bG9BRUdSM3lPVkZscjln?=
 =?utf-8?B?Nk9LQjJYaWFycXRudXBnU1A3K2R5S3VoUU9haE85NHFNUkorL2RUbUlyY3pS?=
 =?utf-8?B?ZlR0T1J1akZqbEp3WENLd1ZidDVhdmtqS3hrN0RDd3FIaDRXMWxYRXpJZ2tT?=
 =?utf-8?B?S3ROTXAxVi9jYUhWWFVIRlBGNXJYY0Mza1NycXFXcFd2aE41eDdySkM3V1Fu?=
 =?utf-8?B?cHl6Q09ERy95a3NXYmZpQkxadTV1aVNURTdaQ25zb1FmUjVFTXZiL2FjY1gw?=
 =?utf-8?B?aFc0Z25ZUTJzdzF3TWtKSUZaRVJSTGdJQklnd0htMlQ1bGZoNE9XMlY4U3ll?=
 =?utf-8?B?L1JjTkU1d0NYWnNKdjlqTFhnQ04vOUdVTjJaRTc3Nm9DdG5qMFhTdUNXQ1pY?=
 =?utf-8?B?UzdySjl6R01OckpTaVg0ME5VTktkUXFrZE5tMlp0VUUwSXNzempuNktYZGox?=
 =?utf-8?B?d2hPL2hNQ3k2ZlhpVS9SUTFuV0JYYUhMVjYzWnZqenNmN1RFd09ORHc5OGxk?=
 =?utf-8?B?ZXI0NGFSZWNzbC9ZRUpEamY5YUpJOStNWXl1UVJRSWg4WmFpSWZkdTkzYUww?=
 =?utf-8?B?WEc1a0ZObnA4L01CdllVUkNRUG54ZDV1WEdvWThlWjJCeWQ2aVh1OGR0bEhl?=
 =?utf-8?B?L2t5b0UydE1OTGlBNTBhUTdMZ0VaaGtUWTlxTmZ3SGFCa3k1ak9WMDFOUTIy?=
 =?utf-8?B?Njdib1dkeDZjazNZK3BsM0p4ZXltQUFjTGwwVjB1YnNuSFRVUTZZdz09?=
X-Exchange-RoutingPolicyChecked: KHdM0CaCF+2ZjMykQWIE27Tvq+rtz39N5Sh/t5FBcpMuF0pDizjoRhB75EBmCMPUDUgZ26noXtIGwRujBvrlzMBgVQs6tdHExbgWCEnZGputjPJJ+FR5LGJlhp7N/ofI0TTIQr6BxuNjX4jiAaR2ccv3SilEei6ILNYSTUSJuafKl4QfZGEnoqdvCpli9egSkwT/M0OrOLjbQ2OhGUEXEeSbCR/Mm7jfRhHkgrv2Iji7St3m+8O/mE5vRasX2qydJs/I+d8YUBXNT20LI3tuaKCkQpqNkTW8ar3Zkdq1lg/HLKp1k8Cf082Hm94b67otKaSef0R1gpp5BKg5nbzgdg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e44af0-5b49-432b-97c4-08df28d03858
X-MS-Exchange-CrossTenant-AuthSource: CH8PR11MB852307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 02:18:07.6754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u5WrRmi+9xP7RIEg1Ej0OfuUgR6syS9UkexK5trX69WAWtcRSnYusv6UxqvFSL5i6vYtweBMMBA7CBjyVaVX4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7282
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


On 13-10-2026 06:27, Rodrigo Vivi wrote:
> On Mon, Oct 12, 2026 at 06:33:46PM +0530, Karthik Poosa wrote:
>> This series adds CRI-specific temperature sensor handling to the Xe
>> hwmon implementation and fixes couple of hwmon issues.
>>
>> CRI platforms may report unavailable temperature sensors and support
>> a variable number of VRAM temperature channels depending on platform
>> configuration. This series adds the required sensor presence checks and
>> uses platform-reported thermal configuration data to expose only valid
>> temperature-related hwmon attributes.
>>
>> The series also corrects the telemetry group selection used for memory
>> controller temperature reporting.
>>
>> v2:
>>   - Address review comments from Sashiko, Badal and Raag.
>>   - Enable IEEE 754 temperature decoding for MMIO temperature registers.
>>    - Split sensor validity check into mailbox vs MMIO handling; add
>>      is_temp_available() / is_temp_is_visible().
>>   - Temporarily disable memory controller and PCIe temperatures on CRI.
>>
>> v3:
>>    - Detect unavailable temperature sensors: rephrase a debug log.
>>    - Decode mailbox temperatures as 8-bit sign-magnitude values instead of
>>      s8.
>>    - Use VRAM temperature sensor count from thermal config on CRI: address
>>      review comments from sashiko-bot@kernel.org and Rodrigo.
>>    - Decode CRI temperature registers as IEEE-754: reject temperatures that
>>      overflow long on 32-bit systems.
>>
>> v4:
>>    - Address review comments and issues report from Rodrigo and
>>      sashiko-bot@kernel.org.
>>    - Decode mailbox temperatures as 8-bit sign-magnitude values.
>>    - Cache sensor availability during registration.
>>    - Enable memory controller and pcie sensors for CRI.
>>    - Derive the VRAM channel count from the CRI MSU enable mask.
>>    - Use CRI-specific package and VRAM temperature registers.
>>    - Handle the CRI memory controller and pcie sensor offsets as per CRI.
>>
>> v5:
>>   - Remove the unintended IGT prefix from the patch titles.
>>
>> v6:
>>   - Address issues reported by sashiko-bot@kernel.org.
>>   - Add VRAM individual channel CRI_VRAM_TEMPERATURE_N register for CRI.
>>
>> v7:
>>   - Address review comments from Rodrigo.
>>      - Use ret instead of count in patch 1.
>>      - Return true for platforms without temperature sentinels support.
>>      - Rename has_mbx_temp_sentinel to has_temp_sentinel.
>>      - Add a info flag for pcie sensor offset.
>>      - Simplify temperature channels config.
>>
>> v8:
>>   - Address review comment from Sashiko.
>>   - Revert the unconditional validation of temperature readings on
>>     non-sentinel platforms.
>>     This avoids creating spurious VRAM temperature channels when the
>>     corresponding sensors are unavailable.
>>
>> v9:
>>   - Address review comment from Rodrigo.
>>   - Use helper for pcie sensor offset instead of info field.
>>
>> v10:
>>   - Address review comments from sashiko.
> for some reason I don't see CI results for this v10.
>
> Could you please resubmit it?
>
> Thanks,
> Rodrigo.
Patchwork has created new link for v11 - 
https://patchwork.freedesktop.org/series/175993/
>
>> Karthik Poosa (16):
>>    drm/xe/hwmon: Handle pcode read failures of
>>      xe_hwmon_pcode_rmw_power_limit
>>    drm/xe/hwmon: Decode mailbox temperature as sign-magnitude
>>    drm/xe/hwmon: Fix thermal sensor data handling
>>    drm/xe/hwmon: Add helpers to validate thermal sensor readings
>>    drm/xe/hwmon: Handle unavailable memory controller sensors
>>    drm/xe/hwmon: Detect unavailable PCIe thermal sensors
>>    drm/xe/hwmon: Consolidate temperature sensor availability checks
>>    drm/xe/hwmon: Cache temperature availability to reduce probe time
>>    drm/xe/hwmon: use CRI-specific package and VRAM temperature registers
>>    drm/xe/hwmon: Add platform-aware VRAM thermal channel support
>>    drm/xe/hwmon: Decode CRI temperature registers as IEEE-754
>>    drm/xe/hwmon: Update memory controller temperature offset for CRI
>>    drm/xe/hwmon: add PCIe temperature support for CRI
>>    drm/xe/hwmon: Simplify temperature channels config
>>    drm/xe: Validate thermal sensor count  before reads
>>    drm/xe/hwmon: Propagate all hardware read errors
>>
>>   drivers/gpu/drm/xe/regs/xe_pcode_regs.h |   4 +
>>   drivers/gpu/drm/xe/xe_device_types.h    |   4 +
>>   drivers/gpu/drm/xe/xe_hwmon.c           | 525 ++++++++++++++++++------
>>   drivers/gpu/drm/xe/xe_pci.c             |   4 +
>>   drivers/gpu/drm/xe/xe_pci_types.h       |   2 +
>>   drivers/gpu/drm/xe/xe_pcode_api.h       |   2 -
>>   6 files changed, 416 insertions(+), 125 deletions(-)
>>
>> -- 
>> 2.25.1
>>
