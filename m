Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD181C44525
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 10:04:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737F810E177;
	Mon, 20 Jul 2026 10:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CfIWu+s1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B97710E16B
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Jul 2026 10:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784541874; x=1816077874;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=hYkjQ9PqCqon1qe7HdvdJVT8HPiSG6jYjfmXl1QgPok=;
 b=CfIWu+s1G6A1oJjwXhRpDJCwYOAYHNoUW6+/fSsfVz/ll2eipcs/2TYd
 n9hQFqO3ye04XVsa3GOCHSlN/IjcZBRsdyZKVfV++uztqz1/04TcW3za8
 wY7OqLpN5KYK1oxzcspF/V6b88lfI7Cx3EsDxO31K9Ayiz8dKUTAZdSys
 FzE/m1yUOvhakHTXdTm2IcsivM47quA7s3BEE7uAjebtlJpKoW4Zz4PcB
 InqnizthfelppWi3jQoVuScLK5vPzzzP2qEpZdvDSkcdovLyUmB5exHYV
 vlqisExjouoKRfdoaDbv6SWjQ5O83wy+V4KUG6Kh5QDHb0E4zzQjOiV1z g==;
X-CSE-ConnectionGUID: g2Q7zCgOQ/mmo6EjibolVA==
X-CSE-MsgGUID: ClOOc1q/TQeZWsGRcrtk4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="85068598"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208,217";a="85068598"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 03:04:33 -0700
X-CSE-ConnectionGUID: o1FV7U+BQ0m6nx/1KkEK/g==
X-CSE-MsgGUID: 9BLbLcERS+2GVm2erDStUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
 d="scan'208,217";a="281882537"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 03:04:33 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 03:04:32 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 03:04:32 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.16) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 03:04:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pwAAgfJCUbOTdI15o/BW8htDi0muWyH9vBS8R3/LK9zyW1NSvi8lRXvMkpSVCTbyUKfs/VlyEDUhji/mBJZSa97td3xaRF+P7nSWXxi/2o8SzhCR+ZArix4dEGEFj/NoOtcvsRjb57y2pKrwPmSA5rIRyvvrRO2zQu5D+tW5RFeioRjSaaRjixN6byfhrC4d5V2MtXYt+C6ky7a3mVNxsCwGZL8sCQ4eZg5QgX1VFp4r9gYl69FiRy5xdkzorFyi14CMRL0yPYqooISsmXRso2EzGXrYdHqq7EU+yYZv/+GwvoySh8dRWVmawFwNCgmPyrDtLca+ahOEOsQC0VpKww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7D0bmSmV1XWudwPXSWVgaSdvs3LvXFi5N5DE5ZAQQYY=;
 b=nGwlw5729MaSmhn1Bm8GAT+09MF+nbkBli2nDP9E6DYMgDSmli9nUVvDSiuvvCWFDhwvoiqAGqJ7TU+d3qOwOnsvqL1WuEd5jj8JzT6W1tAbY1Nk16+o55CMqATQBSBlLYlhBfpEKVDI4v9Ash/Hz/gBEC5s7wr5dQqsbzs7nA2UcnuOjo1+tUfbP0/x7dAjtVuStrxpj01FlmlhGmOPC/DCWyqiBxaIbti06fgs19zcbhAJjIuQ5tyRngl3ulLLAaXBtHjt6XbQ+ZxdNvYanbPVT1uwpm5ybXXq4NYC7Mt9nRHkBh0Hn9UZDDE71yAoU2KuLIvOaOIf03n+apJdaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7556.namprd11.prod.outlook.com (2603:10b6:806:31f::21)
 by SJ0PR11MB5813.namprd11.prod.outlook.com (2603:10b6:a03:422::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 10:04:29 +0000
Received: from SA3PR11MB7556.namprd11.prod.outlook.com
 ([fe80::3b95:cfb:be21:788c]) by SA3PR11MB7556.namprd11.prod.outlook.com
 ([fe80::3b95:cfb:be21:788c%6]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 10:04:28 +0000
Content-Type: multipart/alternative;
 boundary="------------PzR9RG0x4ymr83CAzLYtCZhH"
Message-ID: <24c4bc8e-bc86-4c98-83b9-9d9d345c6dc1@intel.com>
Date: Mon, 20 Jul 2026 15:34:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/xe/sysctrl: Add helper to query application status
To: "Tauro, Riana" <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <umesh.nerlige.ramappa@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <anshuman.gupta@intel.com>, <matthew.d.roper@intel.com>,
 <michael.j.ruhl@intel.com>, <paul.e.luse@intel.com>,
 <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
References: <20260720091410.4153002-2-anoop.c.vijay@intel.com>
 <17a0b00b-92f9-40de-aef3-86fea7fdab73@intel.com>
Content-Language: en-US
From: Anoop Vijay <anoop.c.vijay@intel.com>
In-Reply-To: <17a0b00b-92f9-40de-aef3-86fea7fdab73@intel.com>
X-ClientProxiedBy: MA5P287CA0153.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::8) To SA3PR11MB7556.namprd11.prod.outlook.com
 (2603:10b6:806:31f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7556:EE_|SJ0PR11MB5813:EE_
X-MS-Office365-Filtering-Correlation-Id: f017236f-b5c8-4a18-4daa-08dee6464942
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|6133799003|18002099003|22082099003|3023799007|8096899003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: k099gM2EfxGXqLZKS5ZMJkebywVCOgrDJruwhXpqQfcXSam61Y76oIgKX8wzycqiCkKq1+s8L2ah59XDTt8MripXcFQDW5s9UdxCl2a+UJvHD0M67abAKixq8PVkyHeu2b4VRsxPcz8Dl4To4atbUW0JJUO3GHTyQP2XdcZg5r/PSbMYHr95T7zEGyqr8vY3kdck9QfSfLwMMqBjMaSpZKgNQnuGPDffP4E1GLyOk0zIau8WlQ8XvMOgyXYcqLF5v7EpUskyvsWa9KFjLWRUvlHSQ/ktcuGWLPP+E6GATzACoAmbFwGw04DpokZJ9vC+V5YHkYeXHJUR5Bq2QuZjpWWmj6ORA2C5SR8+jc1xV8REq5/q3FrHgMMKI3gE2sCkYd/vCkNNS4VOcP+5Sfm7vSTwWZ3OldBvrxjeNa80XL0MTGMiFHe43Jp9DDVaSmR0f8fvtLihSGlQPIP4U4+AuaXAc+9iGK5NTMJI5kwwddczBllTnvphZ3IRr0x33nJHTouLNMWiMgk+XsOHp0fEBgcSsObPDzuP7X4SoLlcy+yr8I6zxvA0ykF7Uz4AgQbnK/C8OuqhWAXlntoUz3uLGbYJPIfL03YD5M2F8LwRCGzMFICq/PC9XLIVZ0f4ZgDJgO2jbpa+D4TVkxmNaqawHwN9yXdr7HfWytSxksihkDU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(18002099003)(22082099003)(3023799007)(8096899003)(56012099006)(4143699003)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmR2bWJyYkRaNEp2R1lYNHNoZHpHNHZLSG83SE5rekZ4V1A1L0RqUVVMSzRk?=
 =?utf-8?B?SjZzZGdQNEhYZmZYK1JoRjZBbFFLVy91TTNWdkZlZkpjNjVnb2toOUNDRFJl?=
 =?utf-8?B?Q09kcklQZmpjRk9rUkRieGtkb2tpYitFa3JvR1hKKzBMWEpuRVBUUUF4cnda?=
 =?utf-8?B?Y3lSNmNLSXhSc2xncGx5STRnS0VNUUxUOXdZQVh1aHRLYk9rT0k5Y3NZZXBp?=
 =?utf-8?B?NW1ZM1RqK210UnUwam13YUV2bjI3aXRVWjRxaG1RVU85TlFNajlQOERmcUY4?=
 =?utf-8?B?MTVFdDZZaFNVaTZmem9qZlFNK0QvN2IxS1FvWHZiZTQxY0w3TW5zK1VuZUto?=
 =?utf-8?B?UWN1K3pJNlY3eUV1UXE4a3RIT0tyblVlRmpMcmpwSk9paFp5YUhVd1l6MGNp?=
 =?utf-8?B?S1V4ZHllSEdZYTJpY0kxb0M3M0pVM1g5aDFEQUFuYVZWM3pjbzdtaGxTdVhZ?=
 =?utf-8?B?WTMweHBWSU9xZ0dGWCs4aW9xbnpHc0tyUktkMHJDL2JidnRuOHVHZ3NONndh?=
 =?utf-8?B?RVRWcHJacExieUdXeFh1OXpaS1hqTG9QVmN0WGdqQ1ZMSDJwMUVZNUZZNmNk?=
 =?utf-8?B?amY4ckk5R3JLdGFCeUxxT0ZINk1EeHpzN1B3Z3RMcmM2dG9YcEdycXRGNyt3?=
 =?utf-8?B?eG5JY0k5a0k4WHpNaTFHbFhRTXkvRXVTRW4ySmVzK0pKOHE5bTF2WUVHM0d0?=
 =?utf-8?B?azhDd2R6MjdMQitsRXFUMzZBL3pITDlhTmRIMEtWdVpRdnA3OW13bFFsNnRX?=
 =?utf-8?B?UlZ6aVA1eUExZWlzVnBQYzRZVkdZV1pjWmZtK3pYczUrTXhJSjlXamg0b3hI?=
 =?utf-8?B?WUM5NzlTOS8xZCtlZTVmQW8xZzdvQWJveTVXNTBNK1NVZDhqOE5vS3BsekQ1?=
 =?utf-8?B?bDZsUEo1M0xndFFYNjVqZG55Mjk2YUZBK2tLUWFOMjNmTDRsaVB6Y2QxUEpm?=
 =?utf-8?B?MGQxN3JPVWN4QVFkOGwxb0R0TmFNOUVuR01BR24zTmJDdGx4eWhQZ29Hanlj?=
 =?utf-8?B?M1Zuanl0TGZtREswQ2VDdStraGJ2TVlyeS9LVHorM3FDcExXdEplbFRjOXVU?=
 =?utf-8?B?Z3ZuV0Y3SEZPOWRQc0JHOEZ0Q1ZGM3RCdXY1OEFicWVQbkNSUXlRODdpL0M3?=
 =?utf-8?B?dzhTRWlteWVnMHR1aTZXU0p4Tk1CUGRMMFRmK0d6bWUwb2NkdHh1MGp4MmdU?=
 =?utf-8?B?dzU3VUFvc2oxYUV2TWU3cFlhQ1pjOC9FYkkyYmxzSk43eUY5Uzl2OENlYUZB?=
 =?utf-8?B?Ny9DM1BwandsZllZMUorUUVpcWdXcDJGeHdsL005VXNaeUpWT3pSeURrNTdQ?=
 =?utf-8?B?SWo2cURDbWJHMWk0QzhLaHhkTXR4cFRGM3ZxNmk0aE5XaElMMEpjQndLWVBr?=
 =?utf-8?B?c21HemZ3YjZrSUVzeDhsZnMrT0ViRlVUVHZsQndRVndDNE1RVWdnUTdMQldx?=
 =?utf-8?B?QVUxK2RvYW5HbUhJSkN0U2pYUnhxVkVhcWlkeG16a0N1L2RkYU8vcXF1R1Rt?=
 =?utf-8?B?QVUxSHh6MXhONS84VEU1dHlOZVpGbkFZZDRvU1B6RCtZdDBnd1Q0Z2dPZndl?=
 =?utf-8?B?cHBqZVh5dzIwWmI5WFQ3ZWlKNHlzVkVidmEydDk5N1dBanl2YkhEc2EzY1JF?=
 =?utf-8?B?OHdOdHlDN2NSNmczVXhzU01MaVlvQkVvM1JLcHlZcUhQT3NCTDJlUlplSTRZ?=
 =?utf-8?B?bHoySHJ0TkJFUnhyR2xRWWt1cmx2ZnA2WUJoVzFWQVBGU2JkSXdWQzQ0OHQ3?=
 =?utf-8?B?dk1SbldEVVFBOTd2QVI0MXVDZTkyY2ZVaHlMeEYyREltSTdvZm81TFVGbnpF?=
 =?utf-8?B?M0V2LzhPTmhwR3hIdzFjOFNvL0VJMk5iZTZ3SWw0M24zdkgyQnlJZFJuU1Iw?=
 =?utf-8?B?QlBZUWlzclBjQXVxZ2JHMFdMVUxSTHJ5MzM2ajUxdTBwSkxvR0NyaG5UMm9q?=
 =?utf-8?B?RkdtM1pxQzJ2K25HaldhdGMxd3hDRzY4YzJaUXNIOWN4L2ZlcWE0aGxvQ1kr?=
 =?utf-8?B?QzBkU0VmZktpZG9ReGUzbUkyWktuQWp2aWRpRDFVWGtTWjNncTdXanRPRS9T?=
 =?utf-8?B?dnNlTjFSeVNtemZpYkRCejhuSnFUbDFhZkcrL3B1NHlyaElZZGthcWNIL2J6?=
 =?utf-8?B?a0lNNTAvVXdkckFxNU1lWDVTSUlVWmFVQUwzeDQ2MGIwVkV5ZWEvMW1aWGlP?=
 =?utf-8?B?elJ3SGJXNlBCbEFQM2pFSW9qREFFczJxam1IdnpkdUhwS2RDSEYzNEhjRnZQ?=
 =?utf-8?B?czh1NDFCcmFHNEZWdDlJR3NNRk13QWd1WnhTWWFBSGhrOTA4RVV1aEtlRE55?=
 =?utf-8?B?Rzh4L1h0bDg3dStnOG5kN2hMLzZ6UzFQRFdVYVpNYzBlOWhrdndmdz09?=
X-Exchange-RoutingPolicyChecked: qTz9nPKHmJJOKeNA/LDu5+/qZJaSS1eD4NwjDHjnIvrDc1IbZos4G4woTcdJt1spLauUMBrvxMSGAolMLnSFaG2Yqflpd9S8TnJWu+cwspGJKhw1H/N0Fyqh1N7DaFF00GyI9xo1r04E4lnqBE7TD7f+K+1LIO02fJSPqvEfzCYY7hANCGzK7Kth/hYv64T3HEt557MJoQODNVH8hFOlfZ8YsQ7jTNLFfUfdLTHZLBBVBwkGXcJZsgf2MIdF94rvpDvA38bKdmk8t427aVBZpQeNLqilFTT1kFGec2vEeixFdwTUPFnJ3brYpOF+dMQ3HJ038e+qZ8do+vQpo75FuA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f017236f-b5c8-4a18-4daa-08dee6464942
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 10:04:28.8848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mCkaDhD9LF2oIeJZDiN9+BR0nYgwpopirLU9UxaC2opQTVVWmGdgJwat8aER96MAggGPVnddLDcYv1OU7tBeTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5813
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

--------------PzR9RG0x4ymr83CAzLYtCZhH
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 20-07-2026 15:17, Tauro, Riana wrote:
>
> On 20-07-2026 14:44, Anoop, Vijay wrote:
>> From: Anoop Vijay <anoop.c.vijay@intel.com>
>>
>> Add xe_sysctrl_check_app_status() to query the state of a System
>> Controller application using get_app_status_by_id mailbox command.
>>
>> The helper maps xe_sysctrl_app_id values to firmware application
>> IDs and returns the reported application state. Add a convenience
>> wrapper to check OOBMSM application readiness.
>>
>> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>> ---
>> v5: (Anshuman)
>> - Rename OOBMSM status helper to use xe_sysctrl_* prefix
>> - Remove xe_is_diag_fw_ready() helper
>>
>> v4: (Anshuman)
>> - Make xe_sysctrl_check_app_status() internal
>> - Remove unused app identifier
>>
>> v3: (Riana, Badal)
>> - Replace string-based app identifiers with enum xe_sysctrl_app_id
>> - Use get_app_status_by_id (opcode 0x05)
>> - Move mailbox definitions to xe_sysctrl_mailbox_types.h
>> - Return enum xe_sysctrl_fw_status consistently
>> - Map communication failures to COMM_FAILURE
>> - Add INITIALIZED state and status helpers
>> - Fix Diagnostics typo
>>
>> v2: (Badal)
>> - Return SysCtrl firmware application states instead of errno for 
>> application lifecycle conditions
>> ---
>>   drivers/gpu/drm/xe/xe_sysctrl.c               | 70 +++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_sysctrl.h               |  1 +
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 63 +++++++++++++++++
>>   3 files changed, 134 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c 
>> b/drivers/gpu/drm/xe/xe_sysctrl.c
>> index 1db20be8158b..9406df029322 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl.c
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
>> @@ -13,9 +13,11 @@
>>   #include "xe_device.h"
>>   #include "xe_mmio.h"
>>   #include "xe_pm.h"
>> +#include "xe_printk.h"
>>   #include "xe_soc_remapper.h"
>>   #include "xe_sysctrl.h"
>>   #include "xe_sysctrl_mailbox.h"
>> +#include "xe_sysctrl_mailbox_types.h"
>>   #include "xe_sysctrl_types.h"
>>     /**
>> @@ -130,3 +132,71 @@ void xe_sysctrl_pm_resume(struct xe_device *xe)
>>         xe_sysctrl_mailbox_init(sc);
>>   }
>> +
>> +static enum xe_sysctrl_fw_status
>> +xe_sysctrl_check_app_status(struct xe_device *xe, enum 
>> xe_sysctrl_app_id app_id)
>> +{
>> +    struct xe_sysctrl_get_app_status_by_id_req req = {};
>> +    struct xe_sysctrl_get_app_status_by_id_resp resp = {};
>> +    struct xe_sysctrl_mailbox_command cmd = {};
>> +    size_t out_len = 0;
>> +    u32 flags;
>> +    int ret;
>> +
>> +    if (!xe->info.has_sysctrl)
>> +        return XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
>> +
>> +    req.app_id = (u8)app_id;
>> +
>> +    cmd.header.data =
>> +        FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_CORE) |
>> +        FIELD_PREP(APP_HDR_COMMAND_MASK, 
>> XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID) |
>> +        FIELD_PREP(APP_HDR_VERSION_MASK, 0);
>> +
>> +    cmd.data_in = &req;
>> +    cmd.data_in_len = sizeof(req);
>> +    cmd.data_out = &resp;
>> +    cmd.data_out_len = sizeof(resp);
>
> We have added a helper as part of RAS. Please use the same
>
> void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command 
> *command, u8 group_id, u8 cmd_id,
>
> void *request, size_t request_len, void *response,
>
> size_t response_len);
>
>
>> +
>> +    ret = xe_sysctrl_send_command(&xe->sc, &cmd, &out_len);
>> +    if (ret)
>> +        return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
>> +
>> +    if (out_len != sizeof(resp)) {
>> +        xe_err(xe, "sysctrl: unexpected get app status response 
>> length %zu (expected %zu)\n",
>> +               out_len, sizeof(resp));
>> +        return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
>> +    }
>> +
>> +    flags = resp.flags;
>> +
>> +    if (!(flags & XE_SYSCTRL_APP_RESP_VALID))
>> +        return XE_SYSCTRL_FIRMWARE_APP_INVALID;
>> +
>> +    if (!(flags & XE_SYSCTRL_APP_RESP_BOOTED))
>> +        return XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED;
>> +
>> +    if (!(flags & XE_SYSCTRL_APP_RESP_INITIALIZED))
>> +        return XE_SYSCTRL_FIRMWARE_APP_BOOTED;
>> +
>> +    return XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
>> +}
>> +
>> +/**
>> + * xe_sysctrl_is_oobmsm_fw_ready() - Check if oCode firmware is 
>> fully initialized
>> + * @xe: xe device instance
>> + *
>> + * Returns true if oCode firmware has reached the initialized state, 
>> indicating
>> + * it is ready to handle requests. Returns true also on platforms 
>> without System
>> + * Controller support, as there is no firmware gate to wait on.
>> + *
>> + * Return: true if oCode is initialized or sysctrl is not present, 
>> false otherwise
>> + */
>> +bool xe_sysctrl_is_oobmsm_fw_ready(struct xe_device *xe)
>
> This was mentioned earlier. why is a unused function added?
This function is intentionally exported for use by 
|drivers/gpu/drm/xe/xe_vsec.c|.
It is not unused; the caller exists outside sysctrl implementation.

Thanks,
Anoop
>
>> +{
>> +    enum xe_sysctrl_fw_status status =
>> +        xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_OCODE);
>> +
>> +    return status == XE_SYSCTRL_FIRMWARE_APP_INITIALIZED ||
>> +           status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h 
>> b/drivers/gpu/drm/xe/xe_sysctrl.h
>> index 090dffb6d55f..325334509a03 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
>> @@ -20,5 +20,6 @@ void xe_sysctrl_event(struct xe_sysctrl *sc);
>>   int xe_sysctrl_init(struct xe_device *xe);
>>   void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
>>   void xe_sysctrl_pm_resume(struct xe_device *xe);
>> +bool xe_sysctrl_is_oobmsm_fw_ready(struct xe_device *xe);
>>     #endif
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h 
>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> index d0341538ad05..c7ba6d69f4a7 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -14,9 +14,11 @@
>>    * enum xe_sysctrl_group - System Controller command groups
>>    *
>>    * @XE_SYSCTRL_GROUP_GFSP: GFSP group
>> + * @XE_SYSCTRL_GROUP_CORE: Core group
>>    */
>>   enum xe_sysctrl_group {
>>       XE_SYSCTRL_GROUP_GFSP            = 0x01,
>> +    XE_SYSCTRL_GROUP_CORE            = 0xFF,
>>   };
>>     /**
>> @@ -38,6 +40,67 @@ enum xe_sysctrl_gfsp_cmd {
>>       XE_SYSCTRL_CMD_SET_HEALTH        = 0x0C,
>>   };
>>   +/**
>> + * enum xe_sysctrl_core_cmd - Commands supported by Core group
>> + *
>> + * @XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID: Retrieve application status 
>> by ID
>> + */
>> +enum xe_sysctrl_core_cmd {
>> +    XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID        = 0x05,
>> +};
>> +
>> +/**
>> + * struct xe_sysctrl_get_app_status_by_id_req - Get application 
>> status request
>> + *
>> + * @app_id: Application ID for which to retrieve status
>> + */
>> +struct xe_sysctrl_get_app_status_by_id_req {
> use a shorter name
>> +    u8 app_id;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_sysctrl_get_app_status_by_id_resp - Get application 
>> status response
>> + * @flags: Application status flags (see XE_SYSCTRL_APP_RESP_* 
>> definitions)
>> + */
>> +struct xe_sysctrl_get_app_status_by_id_resp {
>
> same
>
>> +    u32 flags;
>> +} __packed;
>> +
>> +/** XE_SYSCTRL_APP_RESP_VALID - app_id is recognized by System 
>> Controller firmware */
>> +#define XE_SYSCTRL_APP_RESP_VALID        BIT(0)
>> +/** XE_SYSCTRL_APP_RESP_BOOTED - application has completed its boot 
>> sequence */
>> +#define XE_SYSCTRL_APP_RESP_BOOTED        BIT(1)
>> +/** XE_SYSCTRL_APP_RESP_INITIALIZED - application has completed all 
>> post-boot initialization */
>> +#define XE_SYSCTRL_APP_RESP_INITIALIZED        BIT(2)
>> +
>> +/**
>> + * enum xe_sysctrl_fw_status - System Controller firmware 
>> application lifecycle states
>> + *
>> + * @XE_SYSCTRL_FIRMWARE_APP_INVALID: app_id is not recognized by 
>> firmware
>> + * @XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED: application is known but has 
>> not yet booted
>> + * @XE_SYSCTRL_FIRMWARE_APP_BOOTED: boot sequence completed, 
>> post-boot init pending
>> + * @XE_SYSCTRL_FIRMWARE_APP_INITIALIZED: application fully operational
>> + * @XE_SYSCTRL_FIRMWARE_APP_NOTSUPP: System Controller not available 
>> on this device
>> + * @XE_SYSCTRL_FIRMWARE_COMM_FAILURE: communication with System 
>> Controller firmware failed
>> + */
>> +enum xe_sysctrl_fw_status {
>> +    XE_SYSCTRL_FIRMWARE_APP_INVALID,
>> +    XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED,
>> +    XE_SYSCTRL_FIRMWARE_APP_BOOTED,
>> +    XE_SYSCTRL_FIRMWARE_APP_INITIALIZED,
>> +    XE_SYSCTRL_FIRMWARE_APP_NOTSUPP,
>> +    XE_SYSCTRL_FIRMWARE_COMM_FAILURE,
>> +};
>> +
>> +/**
>> + * enum xe_sysctrl_app_id - Known System Controller application 
>> identifiers
>> + *
>> + * @XE_SYSCTRL_APP_OCODE: oCode application (firmware ID 12)
>> + */
>> +enum xe_sysctrl_app_id {
>> +    XE_SYSCTRL_APP_OCODE    = 12,
>
> use hex
>
> Thanks
> Riana
>
>
>> +};
>> +
>>   /**
>>    * struct xe_sysctrl_mailbox_command - System Controller mailbox 
>> command
>>    */
--------------PzR9RG0x4ymr83CAzLYtCZhH
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 20-07-2026 15:17, Tauro, Riana
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:17a0b00b-92f9-40de-aef3-86fea7fdab73@intel.com">
      <br>
      On 20-07-2026 14:44, Anoop, Vijay wrote:
      <br>
      <blockquote type="cite">From: Anoop Vijay
        <a class="moz-txt-link-rfc2396E" href="mailto:anoop.c.vijay@intel.com">&lt;anoop.c.vijay@intel.com&gt;</a>
        <br>
        <br>
        Add xe_sysctrl_check_app_status() to query the state of a System
        <br>
        Controller application using get_app_status_by_id mailbox
        command.
        <br>
        <br>
        The helper maps xe_sysctrl_app_id values to firmware application
        <br>
        IDs and returns the reported application state. Add a
        convenience
        <br>
        wrapper to check OOBMSM application readiness.
        <br>
        <br>
        Signed-off-by: Anoop Vijay <a class="moz-txt-link-rfc2396E" href="mailto:anoop.c.vijay@intel.com">&lt;anoop.c.vijay@intel.com&gt;</a>
        <br>
        ---
        <br>
        v5: (Anshuman)
        <br>
        - Rename OOBMSM status helper to use xe_sysctrl_* prefix
        <br>
        - Remove xe_is_diag_fw_ready() helper
        <br>
        <br>
        v4: (Anshuman)
        <br>
        - Make xe_sysctrl_check_app_status() internal
        <br>
        - Remove unused app identifier
        <br>
        <br>
        v3: (Riana, Badal)
        <br>
        - Replace string-based app identifiers with enum
        xe_sysctrl_app_id
        <br>
        - Use get_app_status_by_id (opcode 0x05)
        <br>
        - Move mailbox definitions to xe_sysctrl_mailbox_types.h
        <br>
        - Return enum xe_sysctrl_fw_status consistently
        <br>
        - Map communication failures to COMM_FAILURE
        <br>
        - Add INITIALIZED state and status helpers
        <br>
        - Fix Diagnostics typo
        <br>
        <br>
        v2: (Badal)
        <br>
        - Return SysCtrl firmware application states instead of errno
        for application lifecycle conditions
        <br>
        ---
        <br>
        &nbsp; drivers/gpu/drm/xe/xe_sysctrl.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 70
        +++++++++++++++++++
        <br>
        &nbsp; drivers/gpu/drm/xe/xe_sysctrl.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +
        <br>
        &nbsp; drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 63
        +++++++++++++++++
        <br>
        &nbsp; 3 files changed, 134 insertions(+)
        <br>
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c
        b/drivers/gpu/drm/xe/xe_sysctrl.c
        <br>
        index 1db20be8158b..9406df029322 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_sysctrl.c
        <br>
        +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
        <br>
        @@ -13,9 +13,11 @@
        <br>
        &nbsp; #include &quot;xe_device.h&quot;
        <br>
        &nbsp; #include &quot;xe_mmio.h&quot;
        <br>
        &nbsp; #include &quot;xe_pm.h&quot;
        <br>
        +#include &quot;xe_printk.h&quot;
        <br>
        &nbsp; #include &quot;xe_soc_remapper.h&quot;
        <br>
        &nbsp; #include &quot;xe_sysctrl.h&quot;
        <br>
        &nbsp; #include &quot;xe_sysctrl_mailbox.h&quot;
        <br>
        +#include &quot;xe_sysctrl_mailbox_types.h&quot;
        <br>
        &nbsp; #include &quot;xe_sysctrl_types.h&quot;
        <br>
        &nbsp; &nbsp; /**
        <br>
        @@ -130,3 +132,71 @@ void xe_sysctrl_pm_resume(struct xe_device
        *xe)
        <br>
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_sysctrl_mailbox_init(sc);
        <br>
        &nbsp; }
        <br>
        +
        <br>
        +static enum xe_sysctrl_fw_status
        <br>
        +xe_sysctrl_check_app_status(struct xe_device *xe, enum
        xe_sysctrl_app_id app_id)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; struct xe_sysctrl_get_app_status_by_id_req req = {};
        <br>
        +&nbsp;&nbsp;&nbsp; struct xe_sysctrl_get_app_status_by_id_resp resp = {};
        <br>
        +&nbsp;&nbsp;&nbsp; struct xe_sysctrl_mailbox_command cmd = {};
        <br>
        +&nbsp;&nbsp;&nbsp; size_t out_len = 0;
        <br>
        +&nbsp;&nbsp;&nbsp; u32 flags;
        <br>
        +&nbsp;&nbsp;&nbsp; int ret;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; if (!xe-&gt;info.has_sysctrl)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; req.app_id = (u8)app_id;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; cmd.header.data =
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FIELD_PREP(APP_HDR_GROUP_ID_MASK,
        XE_SYSCTRL_GROUP_CORE) |
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FIELD_PREP(APP_HDR_COMMAND_MASK,
        XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID) |
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FIELD_PREP(APP_HDR_VERSION_MASK, 0);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; cmd.data_in = &amp;req;
        <br>
        +&nbsp;&nbsp;&nbsp; cmd.data_in_len = sizeof(req);
        <br>
        +&nbsp;&nbsp;&nbsp; cmd.data_out = &amp;resp;
        <br>
        +&nbsp;&nbsp;&nbsp; cmd.data_out_len = sizeof(resp);
        <br>
      </blockquote>
      <br>
      We have added a helper as part of RAS. Please use the same
      <br>
      <br>
      void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command
      *command, u8 group_id, u8 cmd_id,
      <br>
      <br>
      void *request, size_t request_len, void *response,
      <br>
      <br>
      size_t response_len);
      <br>
      <br>
      <br>
      <blockquote type="cite">+
        <br>
        +&nbsp;&nbsp;&nbsp; ret = xe_sysctrl_send_command(&amp;xe-&gt;sc, &amp;cmd,
        &amp;out_len);
        <br>
        +&nbsp;&nbsp;&nbsp; if (ret)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; if (out_len != sizeof(resp)) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_err(xe, &quot;sysctrl: unexpected get app status response
        length %zu (expected %zu)\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; out_len, sizeof(resp));
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; flags = resp.flags;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; if (!(flags &amp; XE_SYSCTRL_APP_RESP_VALID))
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return XE_SYSCTRL_FIRMWARE_APP_INVALID;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; if (!(flags &amp; XE_SYSCTRL_APP_RESP_BOOTED))
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; if (!(flags &amp; XE_SYSCTRL_APP_RESP_INITIALIZED))
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return XE_SYSCTRL_FIRMWARE_APP_BOOTED;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; return XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
        <br>
        +}
        <br>
        +
        <br>
        +/**
        <br>
        + * xe_sysctrl_is_oobmsm_fw_ready() - Check if oCode firmware is
        fully initialized
        <br>
        + * @xe: xe device instance
        <br>
        + *
        <br>
        + * Returns true if oCode firmware has reached the initialized
        state, indicating
        <br>
        + * it is ready to handle requests. Returns true also on
        platforms without System
        <br>
        + * Controller support, as there is no firmware gate to wait on.
        <br>
        + *
        <br>
        + * Return: true if oCode is initialized or sysctrl is not
        present, false otherwise
        <br>
        + */
        <br>
        +bool xe_sysctrl_is_oobmsm_fw_ready(struct xe_device *xe)
        <br>
      </blockquote>
      <br>
      This was mentioned earlier. why is a unused function added?
      <br>
    </blockquote>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
      <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">This
        function is intentionally exported for use by <code>drivers/gpu/drm/xe/xe_vsec.c</code>.&nbsp;</div>
      <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">It
        is not unused; the caller exists outside sysctrl implementation.</div>
      <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px"><br>
      </div>
      <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">Thanks,</div>
      <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">Anoop</div>
    </div>
    <blockquote type="cite" cite="mid:17a0b00b-92f9-40de-aef3-86fea7fdab73@intel.com"><br>
      <blockquote type="cite">+{
        <br>
        +&nbsp;&nbsp;&nbsp; enum xe_sysctrl_fw_status status =
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_OCODE);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; return status == XE_SYSCTRL_FIRMWARE_APP_INITIALIZED ||
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
        <br>
        +}
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h
        b/drivers/gpu/drm/xe/xe_sysctrl.h
        <br>
        index 090dffb6d55f..325334509a03 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_sysctrl.h
        <br>
        +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
        <br>
        @@ -20,5 +20,6 @@ void xe_sysctrl_event(struct xe_sysctrl *sc);
        <br>
        &nbsp; int xe_sysctrl_init(struct xe_device *xe);
        <br>
        &nbsp; void xe_sysctrl_irq_handler(struct xe_device *xe, u32
        master_ctl);
        <br>
        &nbsp; void xe_sysctrl_pm_resume(struct xe_device *xe);
        <br>
        +bool xe_sysctrl_is_oobmsm_fw_ready(struct xe_device *xe);
        <br>
        &nbsp; &nbsp; #endif
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
        b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
        <br>
        index d0341538ad05..c7ba6d69f4a7 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
        <br>
        +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
        <br>
        @@ -14,9 +14,11 @@
        <br>
        &nbsp;&nbsp; * enum xe_sysctrl_group - System Controller command groups
        <br>
        &nbsp;&nbsp; *
        <br>
        &nbsp;&nbsp; * @XE_SYSCTRL_GROUP_GFSP: GFSP group
        <br>
        + * @XE_SYSCTRL_GROUP_CORE: Core group
        <br>
        &nbsp;&nbsp; */
        <br>
        &nbsp; enum xe_sysctrl_group {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_SYSCTRL_GROUP_GFSP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = 0x01,
        <br>
        +&nbsp;&nbsp;&nbsp; XE_SYSCTRL_GROUP_CORE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = 0xFF,
        <br>
        &nbsp; };
        <br>
        &nbsp; &nbsp; /**
        <br>
        @@ -38,6 +40,67 @@ enum xe_sysctrl_gfsp_cmd {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_SYSCTRL_CMD_SET_HEALTH&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = 0x0C,
        <br>
        &nbsp; };
        <br>
        &nbsp; +/**
        <br>
        + * enum xe_sysctrl_core_cmd - Commands supported by Core group
        <br>
        + *
        <br>
        + * @XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID: Retrieve application
        status by ID
        <br>
        + */
        <br>
        +enum xe_sysctrl_core_cmd {
        <br>
        +&nbsp;&nbsp;&nbsp; XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = 0x05,
        <br>
        +};
        <br>
        +
        <br>
        +/**
        <br>
        + * struct xe_sysctrl_get_app_status_by_id_req - Get application
        status request
        <br>
        + *
        <br>
        + * @app_id: Application ID for which to retrieve status
        <br>
        + */
        <br>
        +struct xe_sysctrl_get_app_status_by_id_req {
        <br>
      </blockquote>
      use a shorter name
      <br>
      <blockquote type="cite">+&nbsp;&nbsp;&nbsp; u8 app_id;
        <br>
        +} __packed;
        <br>
        +
        <br>
        +/**
        <br>
        + * struct xe_sysctrl_get_app_status_by_id_resp - Get
        application status response
        <br>
        + * @flags: Application status flags (see XE_SYSCTRL_APP_RESP_*
        definitions)
        <br>
        + */
        <br>
        +struct xe_sysctrl_get_app_status_by_id_resp {
        <br>
      </blockquote>
      <br>
      same
      <br>
      <br>
      <blockquote type="cite">+&nbsp;&nbsp;&nbsp; u32 flags;
        <br>
        +} __packed;
        <br>
        +
        <br>
        +/** XE_SYSCTRL_APP_RESP_VALID - app_id is recognized by System
        Controller firmware */
        <br>
        +#define XE_SYSCTRL_APP_RESP_VALID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BIT(0)
        <br>
        +/** XE_SYSCTRL_APP_RESP_BOOTED - application has completed its
        boot sequence */
        <br>
        +#define XE_SYSCTRL_APP_RESP_BOOTED&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BIT(1)
        <br>
        +/** XE_SYSCTRL_APP_RESP_INITIALIZED - application has completed
        all post-boot initialization */
        <br>
        +#define XE_SYSCTRL_APP_RESP_INITIALIZED&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BIT(2)
        <br>
        +
        <br>
        +/**
        <br>
        + * enum xe_sysctrl_fw_status - System Controller firmware
        application lifecycle states
        <br>
        + *
        <br>
        + * @XE_SYSCTRL_FIRMWARE_APP_INVALID: app_id is not recognized
        by firmware
        <br>
        + * @XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED: application is known
        but has not yet booted
        <br>
        + * @XE_SYSCTRL_FIRMWARE_APP_BOOTED: boot sequence completed,
        post-boot init pending
        <br>
        + * @XE_SYSCTRL_FIRMWARE_APP_INITIALIZED: application fully
        operational
        <br>
        + * @XE_SYSCTRL_FIRMWARE_APP_NOTSUPP: System Controller not
        available on this device
        <br>
        + * @XE_SYSCTRL_FIRMWARE_COMM_FAILURE: communication with System
        Controller firmware failed
        <br>
        + */
        <br>
        +enum xe_sysctrl_fw_status {
        <br>
        +&nbsp;&nbsp;&nbsp; XE_SYSCTRL_FIRMWARE_APP_INVALID,
        <br>
        +&nbsp;&nbsp;&nbsp; XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED,
        <br>
        +&nbsp;&nbsp;&nbsp; XE_SYSCTRL_FIRMWARE_APP_BOOTED,
        <br>
        +&nbsp;&nbsp;&nbsp; XE_SYSCTRL_FIRMWARE_APP_INITIALIZED,
        <br>
        +&nbsp;&nbsp;&nbsp; XE_SYSCTRL_FIRMWARE_APP_NOTSUPP,
        <br>
        +&nbsp;&nbsp;&nbsp; XE_SYSCTRL_FIRMWARE_COMM_FAILURE,
        <br>
        +};
        <br>
        +
        <br>
        +/**
        <br>
        + * enum xe_sysctrl_app_id - Known System Controller application
        identifiers
        <br>
        + *
        <br>
        + * @XE_SYSCTRL_APP_OCODE: oCode application (firmware ID 12)
        <br>
        + */
        <br>
        +enum xe_sysctrl_app_id {
        <br>
        +&nbsp;&nbsp;&nbsp; XE_SYSCTRL_APP_OCODE&nbsp;&nbsp;&nbsp; = 12,
        <br>
      </blockquote>
      <br>
      use hex
      <br>
      <br>
      Thanks
      <br>
      Riana
      <br>
      <br>
      <br>
      <blockquote type="cite">+};
        <br>
        +
        <br>
        &nbsp; /**
        <br>
        &nbsp;&nbsp; * struct xe_sysctrl_mailbox_command - System Controller
        mailbox command
        <br>
        &nbsp;&nbsp; */
        <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------PzR9RG0x4ymr83CAzLYtCZhH--
