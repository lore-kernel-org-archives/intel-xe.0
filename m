Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBA0C5DF7D
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 17:41:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC7F210E522;
	Tue, 18 Aug 2026 17:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MmM0tpCr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B0F910E514
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 17:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787074890; x=1818610890;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=qAWZ/gGaL+D+vVJyfgEMkLP2jEk+6YbIGfEqMzLejI8=;
 b=MmM0tpCrQhJ5fWrLh5MpLhwcCRn+PgKpV7eXKw9OxW2fpkT1oLoC+WWi
 /yT7ki2jxVcI6wQIjrMmMLa7oMEG3tfM+t00OT3XmGg0R4rbdIMrLWlOs
 soVrIPvi8ESk5dHb0x9qgVDLVDPAvgFZSqikoc638o/gtUkhYgxkLVTzd
 ZxxzvNotnPhCfz9G5vh98iXTYveAr9zGGvE0zYcu3p7hqpTrKF9hIj0AV
 QiI0qr1UbKFNvD2Xgy0yuoxbdXkIXt8Buhr8rkb1Rrv8VTgj0CRZJRnYQ
 8P/Cq8c89jjwq884z3WBjf6lGxBJ9TfV8zwW4UZkjuj20EEDl4gkJHXu2 g==;
X-CSE-ConnectionGUID: /f8MMORYSO2XqA2dUN6yPg==
X-CSE-MsgGUID: tdjCF/2dSrWdedcIjGCpvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87780852"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208,217";a="87780852"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 10:41:30 -0700
X-CSE-ConnectionGUID: K7Ael/XNSzyrDkhNqlH0wQ==
X-CSE-MsgGUID: YRK9RY9cQSKR0Wkl+ifQkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
 d="scan'208,217";a="261083232"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 10:41:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 10:41:29 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 10:41:29 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.50) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 10:41:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rpn9nrlytYFXMTQEzxAHrSEztNelRx2i1JN4hqaeyOTHWitxpH5Iz2fRAmzKckl8vauokIPQCnAYCMY1cdb64fiQNEbRRMVIFo8mMCHhxxIpNfgyBPClZs4x5Q9yaEPnVZ9lWnWS3ob89IQnIAC/DsotwQVZUOX2As9LCR43kk/03fnyhJhVFvfn7dTycKxtZ2hSPXVWLGwvv1Sfg2zK9sy0qSfKtNwWcCMraosAfCi4YkxrQ1M3fqNq2iejlKRW27BuuP0iRnzHVaGlJItay8jTDQJXINbaQj9lAAqIzceTcKcoj4mQ9nUc51Ib7FGIZo7bj8dFR9PbpB+byIISQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K555bGPpeifjXvxOah46D8rLC5kBxz+6lG+CXWaY/S4=;
 b=r/s7M7H21O5vqPLef08qIVT/M2rLapMMFIoO0iQ2Tc+0lyS0sgINOcTjpL9zpJ3P/5Hbbd/vYwcTKjFYWbjpcIhy/IyC4lkjeSnY1nbWkYmQVsNq8FKTymjw3vPvFLe80d80W17jhkwO4C+ia4L1tygaDLbMmBmnqHHJ1nKprecdYeQl3+DV+UR66C4h3+7KDYI5ylwC6Q+1os06YENEDBLrTeV7EbbEFDxOU5D0wwjAJpoMDYcXL69XK5OXUU6rW8/9HplMpSXAGq7x74qvAmGxxZEw/ahewwKcKtVVwf7UtEs+jMjwHbu6QYSMLGcBnQY9Wz3aUDtvGa7FoS1BZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7556.namprd11.prod.outlook.com (2603:10b6:806:31f::21)
 by CH3PR11MB7723.namprd11.prod.outlook.com (2603:10b6:610:127::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 17:41:23 +0000
Received: from SA3PR11MB7556.namprd11.prod.outlook.com
 ([fe80::3b95:cfb:be21:788c]) by SA3PR11MB7556.namprd11.prod.outlook.com
 ([fe80::3b95:cfb:be21:788c%6]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 17:41:22 +0000
Content-Type: multipart/alternative;
 boundary="------------n65QOvVZNh3gtg0UXHL4wnYS"
Message-ID: <026e7bf1-080f-4d95-965b-83c2afaf6660@intel.com>
Date: Tue, 18 Aug 2026 23:11:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] drm/xe/sysctrl: Add helper to query application
 status
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
References: <20260814095306.2482289-4-anoop.c.vijay@intel.com>
 <20260814095306.2482289-5-anoop.c.vijay@intel.com>
 <an+G21kQjK+AUI9K@soc-5CG1426VCC.clients.intel.com>
Content-Language: en-US
From: Anoop Vijay <anoop.c.vijay@intel.com>
In-Reply-To: <an+G21kQjK+AUI9K@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: MA5P287CA0232.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::16) To SA3PR11MB7556.namprd11.prod.outlook.com
 (2603:10b6:806:31f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7556:EE_|CH3PR11MB7723:EE_
X-MS-Office365-Filtering-Correlation-Id: e2cf0672-9d15-4cb1-c094-08defd4feb41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|3023799007|56012099006|10067099003|4143699003|11063799006|8096899003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ec6TtMQ8LIumhIuvqt0BuZoRa4kQ4JMTXeYAmn4byGCTIuslGelLfNEOCAgZ8DcE0a9NVe2G/ksGpcXOs5vRIRn/X7fYvVvSinvz5wRG4HYq5ADbANPOq3Ir1Eh0be5zfUSgIdzccaqOPT1pOT6fAQwmyz1/3QYZg9mmHqbxTPELaIdARSqlzbltMOYyE+pILgI7oWlicwIYkp09+a4FGl3V3b4/p0lVAVett+ce/JqsqxI/zvSL0PEQfxqOVCqwCbV/4UrmuUBe/Ub0eLBt0pqkZf3azxNEtTuU8gVf/smWkwElBz85Sx7D82jdd0WTYOwGrCerR3RA31SGWKoCgjBN4Y5zfekPp/zcNUwI/yklOhXDvhmAZMNFR2Hy4+HrDCmEtuR4kBMbOq6GljE/cYD8No/MXRGM8NORWoh60U5HBa8OGKi3K3JLFcf4h8InyVMttnZICDpCqhG4XcEKi1RYilxbeB9W4Puool5Hj1y9AGLR4F7TQ3ADns/O2PJwMJ/IKzICCygwCVI+4RMbFWSMj0/jtB64pw+cFXvMfFAEc+a9VgoRaT70C63rBuOuDvQzVr4FQjFWLX1Qd78Naod48VO4XeALQnlBD2WmJPyOnVLl96d8VM8BjbR6vGugz9OBNACTwyY5kT4KN7VqmbH9Hnon9CfLD1u982TlwXM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(3023799007)(56012099006)(10067099003)(4143699003)(11063799006)(8096899003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmUxbUcvcFlkUDh6dXlIV2ZiSDkxODRITE5LSEZMMTczZ1hZcC93akZsWit1?=
 =?utf-8?B?M0ZOOUpOTGdwK2lBY3ErNzFjcnFOaXVLR0liQlFEZVBDaEtqVjhjWU9aMXRn?=
 =?utf-8?B?dEFoZy9XWDVIQ1hLcW5MZ3NrTjdaZWs3ZXRkdTFWYmpuRTF6NUN5SW1abkJO?=
 =?utf-8?B?UzlsTkZJOEswWW8rWFlxZk9HdzdZOGUvOG45U1JseHJNSDgyZ2hsRnJQRVJj?=
 =?utf-8?B?bW9KZjJDMXdIT05SNHpydjdiVXBSejZsdVRKcjhxNzhDd3JUY3NENEgzdWhQ?=
 =?utf-8?B?enhqazIxRURuTzVveHNhUHNXUHFVeHdvYWJWK2NjU09jMHpKTHJZM205Z01l?=
 =?utf-8?B?cjIvTGpzVUdETFFRa0dMSjVxU0c2Y0Y3VlkyL1FrMTV5ZWZnM3JES1ZjdU1s?=
 =?utf-8?B?Q09BQmpaTjl4emJVRGRHTFFyYUQzejY2WlJDcU00N2daSTBaRnovN21lQUs1?=
 =?utf-8?B?ZDY3SHlrVEovYVh2RXplTjVLR3RKRTVkdGNpMEFhR21vVGJFODlKRU5Qc1Yy?=
 =?utf-8?B?WStVa1RrQ0d1QTRjRlMrVnNRSUxpcEtjaTVBSXlWRlZJTDBSVlhWVC9vQzk1?=
 =?utf-8?B?SUk5VzEyTEllcFFDdWFEY1g5K3MvUzdKZVBGNXcxRWFaL1RYVEc4aEtSNzlJ?=
 =?utf-8?B?N3dEWVkxUG95ODFmK2tPTHU3VUJuV0V0MFdMbHJuemxscFcwY0h2SG5EaGlQ?=
 =?utf-8?B?TnRJOTZTMm45L2xPRzYxK2JDZUJmWkJOaW12Z3JSSHFWNHZiQ3l2SjVEUzlX?=
 =?utf-8?B?MHFxS3h2VkZ5aDU3cG44NGh0YTBVaVovd3FlWGU0d3E3a0NjZmhkOUo5bnhC?=
 =?utf-8?B?aldvL3pDZXhZQlJ5NHdwSWIxa0diWitpeDBoQzhhOVRHT0Fkc0dJZmRoVzhx?=
 =?utf-8?B?TGk2b3BhekpXZmNhbEpUa0liVEZ5NG5XZmtXdTBpcGRIcUZMb2d0bXVCY0lr?=
 =?utf-8?B?cU45YjhVTjViVmxMdTMvdlJ6Q2tDM3A5ejY5bmN5SnNjOWxqRUlnVVBnWElw?=
 =?utf-8?B?N2tvRmNIZHFsQTNaU3U4NDR3YUZ1c1htYk1RSDJSQ2ZxNXRiZmFnUmRGWitp?=
 =?utf-8?B?amVkZjAxT0xtblk3SzRZZ2pkVUtDbmFlc3k5cmU3SE9keFhoam1pekhGSTAr?=
 =?utf-8?B?T1U1dFdVWUszOXg2WllOZ0t4Z3dQQUdnejZxdUVneEMwQzJycEJheUFwN2dl?=
 =?utf-8?B?TnZhYmhodmZ1MDdNS0JZeXZxWTdmWmtUdElwQ1MrOWQvS3RMdS9Ld0V5TkhR?=
 =?utf-8?B?a2FDTlAwdENoeHZLeSt0VnpyK08rblFINDVod2NRaWlIQlVZNHEvamtqVDhZ?=
 =?utf-8?B?cVowOUdhNUJOZDlOK0R1encvb0VTWmJPZmIzQjU1MmVKTlRrclBBTDVQU1BV?=
 =?utf-8?B?TFZhZmdlZWdQUGRVaTBsNGlXNlpaNTMrNEpadEpjVE5UUW5UNjZ1cGhCaDBx?=
 =?utf-8?B?TEdBNHN4UGMzdEpGU2trWHg3N3FCWlBNOUZwQStTU21rbmxScWVNTGlBUGda?=
 =?utf-8?B?ZDRxd3NPcDhKaGN4bGxkQkZyVHIrbW9KMGEvZDVhT3JpVStjWkRpZEV0dzV0?=
 =?utf-8?B?cDhGdXd6OHdpYmFzK0lRS0R2SFVRUWZ1dngwRmxpdHR4WWdmSTI2bkRlZFdm?=
 =?utf-8?B?djhnQStHdU1kZE1tcnZ3UzlRdmtmb1g0Q01VSDY3WUY0WjdwT2dWY3NCSVh6?=
 =?utf-8?B?QStyRjEvVE9IekZwSHkvejlJV0xsbWtoQkhZdkJvQlN2bVVBV2xJOHhEeXly?=
 =?utf-8?B?QWppUlBrS1dyRlBEeElrYVZmTGJvRzJ3dUhMcW01MGlwd2d1Ni84SEJMMkJL?=
 =?utf-8?B?YS9MTXZXSTFQS0FjSHlld2RQeVlrTGlBbGZGQW5tc2dKWk90TnV1MGFQaU0z?=
 =?utf-8?B?aExlWStMQlI0Vy9wZVhpQmlLVzZ3Mm4zV3dsTGo5QXQzaG9UN1hKWjQwZC9j?=
 =?utf-8?B?OFVkS20vU1lITmlvZWNYWloreTNaSW1seUM3YnNmM2J5aWFRekdrY1lQYWV0?=
 =?utf-8?B?VEtMd0xVZFpHcDdybXg1L0xESG54OXhVdVl4MDRzaXRMV2lDSWY5R05TZWJN?=
 =?utf-8?B?T251cXpDaHdGVEhBMzA3UjdEckJySDd2dWEwZ3RuNWdJU2FJUDc0U3Q3bitl?=
 =?utf-8?B?bWZmQ2lZdHA2SlAzMXhScE9zOFp2dzN1ZG9RVTJUMFJybDBNMnhHUlBZcmkx?=
 =?utf-8?B?bytrcG1Pb2U2a3FKQWhLMWltMElVNXJRNU1CY3Zaa0tocE5GSU9jY0RXNk5x?=
 =?utf-8?B?TmR1SldmQWk2TEZlMENqY1BXSDJ4dVVBQzZIZTk1aWJCRUZDVUZ5SWlUOUw2?=
 =?utf-8?B?NElCYzRlQUY0SWJaODR0NStpM0hsY0gvc2EwOXlpY2dkcnZ2TDk0ZG9xVThh?=
 =?utf-8?Q?LfrqAinfm/3gIq8c=3D?=
X-Exchange-RoutingPolicyChecked: CpyNZAdq/img89HA/S4pQLRAOGUjxuvsZq5+vgMnmN0bfOJrRqPDQot8c1DZQYgvIQ5HAm3tlTG5PfxaCjw1syWlX/7TGd1xU7Cl3L6g+leaTGe3vV1H0vcQoo+tU9wWXq9RQBRcM0ExgY2QCjX/XTQRia5N2jzoAtibsjRrz5uCdvpfJUFaMZiTXT7hYG9osUerz6KPqgIfvawJtRIQoXXVz4XronbmUluKlPQ2YKOsONiuR9K1bqIWlWPWcEEJYjS9jEKw/L3v1uR77KVebJ1G3x+vrMJi7y1HWIT2M7wTdKnxuttRbfIkhdLpSCC3ujKKp1nDepBAX8VR7waLPg==
X-MS-Exchange-CrossTenant-Network-Message-Id: e2cf0672-9d15-4cb1-c094-08defd4feb41
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 17:41:22.8055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iZoNO4NP87zaOHHhALe/s7qA5212JawsUMCksCYdZfmx7mTwrpJPCPbDH29+CT6OPMV2ISPEbZLe6L+sgGhbKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7723
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

--------------n65QOvVZNh3gtg0UXHL4wnYS
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 15-08-2026 02:51, Umesh Nerlige Ramappa wrote:
> On Fri, Aug 14, 2026 at 02:53:06AM -0700, Anoop, Vijay wrote:
>> From: Anoop Vijay <anoop.c.vijay@intel.com>
>>
>> Add xe_sysctrl_check_app_status() to query the state of a System
>> Controller application using get_app_status_by_id mailbox command.
>>
>> The helper maps xe_sysctrl_app_id values to firmware application
>> IDs and returns the reported application state. Add a convenience
>> wrapper to check diag firmware application readiness.
>>
>> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>> ---
>> v2: (Badal)
>> - Return SysCtrl firmware application states instead of errno for
>>  application lifecycle conditions
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
>> v4: (Anshuman)
>> - Make xe_sysctrl_check_app_status() internal
>> - Remove unused app identifier
>>
>> v5: (Anshuman)
>> - Rename OOBMSM status helper to use xe_sysctrl_* prefix
>> - Remove xe_is_diag_fw_ready() helper
>>
>> v6: (Riana)
>> - Use xe_sysctrl_create_command() helper instead of manual FIELD_PREP
>>  header packing
>> - Rename xe_sysctrl_get_app_status_by_id_{req,resp} to shorter names
>> - Use hex constant for application ID
>> - Move oCode application readiness helper to a separate patch
>> - Add xe_sysctrl_is_diag_fw_ready() helper.
>>
>> v7: (Umesh)
>> - Clarify xe_sysctrl_is_diag_fw_ready() comment for sysctrl-less 
>> platforms
>> - Move XE_SYSCTRL_APP_RESP_* flags and enum xe_sysctrl_app_id to 
>> xe_sysctrl.c
>> ---
>> drivers/gpu/drm/xe/xe_sysctrl.c               | 80 +++++++++++++++++++
>> drivers/gpu/drm/xe/xe_sysctrl.h               |  1 +
>> drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 47 +++++++++++
>> 3 files changed, 128 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c 
>> b/drivers/gpu/drm/xe/xe_sysctrl.c
>> index 1db20be8158b..c53a26af3189 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl.c
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
>> @@ -13,9 +13,11 @@
>> #include "xe_device.h"
>> #include "xe_mmio.h"
>> #include "xe_pm.h"
>> +#include "xe_printk.h"
>> #include "xe_soc_remapper.h"
>> #include "xe_sysctrl.h"
>> #include "xe_sysctrl_mailbox.h"
>> +#include "xe_sysctrl_mailbox_types.h"
>> #include "xe_sysctrl_types.h"
>>
>> /**
>> @@ -29,6 +31,20 @@
>>  * This module provides initialization and support code for interacting
>>  * with System Controller through the mailbox interface.
>>  */
>> +
>> +/* Application status flags reported in 
>> xe_sysctrl_app_status_resp.flags */
>> +#define XE_SYSCTRL_APP_RESP_VALID    BIT(0)
>> +#define XE_SYSCTRL_APP_RESP_BOOTED    BIT(1)
>> +#define XE_SYSCTRL_APP_RESP_INITIALIZED    BIT(2)
>> +
>> +/*
>> + * Known System Controller application identifiers, keyed by firmware
>> + * application ID.
>> + */
>> +enum xe_sysctrl_app_id {
>> +    XE_SYSCTRL_APP_DIAG    = 0x0D,
>> +};
>> +
>> static void sysctrl_fini(void *arg)
>> {
>>     struct xe_device *xe = arg;
>> @@ -130,3 +146,67 @@ void xe_sysctrl_pm_resume(struct xe_device *xe)
>>
>>     xe_sysctrl_mailbox_init(sc);
>> }
>> +
>> +static enum xe_sysctrl_fw_status
>> +xe_sysctrl_check_app_status(struct xe_device *xe, enum 
>> xe_sysctrl_app_id app_id)
>> +{
>> +    struct xe_sysctrl_app_status_req req = {};
>> +    struct xe_sysctrl_app_status_resp resp = {};
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
>> +    xe_sysctrl_create_command(&cmd, XE_SYSCTRL_GROUP_CORE, 
>> XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID,
>> +                  &req, sizeof(req), &resp, sizeof(resp));
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
>> + * xe_sysctrl_is_diag_fw_ready() - Check if diag firmware is fully 
>> initialized
>> + * @xe: xe device instance
>> + *
>> + * Returns true if diag firmware has reached the initialized state, 
>> indicating
>> + * it is ready to handle requests. On platforms without System 
>> Controller
>> + * support there is no System Controller mailbox to gate on, so diag 
>> firmware
>> + * readiness is not tracked through this path; the function 
>> unconditionally
>> + * returns true so callers are not blocked by this check on such 
>> platforms.
>
> I am still not clear how the caller will handle the 2 scenarios - (1) 
> SC is present, but diag app is not initialized vs (2) SC and mailbox 
> are not available and hence Diag App is not supported. The caller will 
> just see true in both cases.
>
> Instead I would see this as 2 helpers:
>
> xe_sysctrl_is_diag_fw_supported() that returns
> status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
>
> and
>
> xe_sysctrl_is_diag_fw_ready() that returns
> status == XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
>
> That would be clearer to the caller.
>
> Thanks,
> Umesh
>
All current/planned callers of xe_sysctrl_is_oobmsm_fw_ready() / 
xe_sysctrl_is_diag_fw_ready() (xe_vsec.c retry/gate logic, 
xe_sysctrl_debugfs.c RAS injection gate, xe_sysctrl_fwctl.c capability 
gate) only need a yes/no answer to "Can this functionality be used now?" 
  and treat NOTSUPP and 'not yet initialized' the same way.

Folding NOTSUPP into 'ready' is intentional. It lets sysctrl-less 
platforms skip straight through.

Splitting into is_supported() + is_ready() wouldn't change any caller's 
behavior, but would require every caller to do '!supported() || ready()' 
check. This risks a caller checking only is_ready(), resulting in 
unnecessary retries or failures on a NOTSUPP platform.

Given the current usage, I'd prefer to keep the combined helper and add 
a more granular status/support helper in the future if a real consumer 
requires that distinction.

Thanks,
Anoop
>
>> + *
>> + * Return: true if diag firmware is initialized, or if System 
>> Controller is
>> + * not present on this platform; false otherwise
>> + */
>> +bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe)
>> +{
>> +    enum xe_sysctrl_fw_status status =
>> +        xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_DIAG);
>> +
>> +    return status == XE_SYSCTRL_FIRMWARE_APP_INITIALIZED ||
>> +           status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h 
>> b/drivers/gpu/drm/xe/xe_sysctrl.h
>> index 090dffb6d55f..8dc576796890 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
>> @@ -20,5 +20,6 @@ void xe_sysctrl_event(struct xe_sysctrl *sc);
>> int xe_sysctrl_init(struct xe_device *xe);
>> void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
>> void xe_sysctrl_pm_resume(struct xe_device *xe);
>> +bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe);
>>
>> #endif
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h 
>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> index d0341538ad05..f1e4253fda4b 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -14,9 +14,11 @@
>>  * enum xe_sysctrl_group - System Controller command groups
>>  *
>>  * @XE_SYSCTRL_GROUP_GFSP: GFSP group
>> + * @XE_SYSCTRL_GROUP_CORE: Core group
>>  */
>> enum xe_sysctrl_group {
>>     XE_SYSCTRL_GROUP_GFSP            = 0x01,
>> +    XE_SYSCTRL_GROUP_CORE            = 0xFF,
>> };
>>
>> /**
>> @@ -38,6 +40,51 @@ enum xe_sysctrl_gfsp_cmd {
>>     XE_SYSCTRL_CMD_SET_HEALTH        = 0x0C,
>> };
>>
>> +/**
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
>> + * struct xe_sysctrl_app_status_req - Get application status request
>> + *
>> + * @app_id: Application ID for which to retrieve status
>> + */
>> +struct xe_sysctrl_app_status_req {
>> +    u8 app_id;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_sysctrl_app_status_resp - Get application status response
>> + * @flags: Application status flags interpreted by 
>> xe_sysctrl_check_app_status()
>> + */
>> +struct xe_sysctrl_app_status_resp {
>> +    u32 flags;
>> +} __packed;
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
>> /**
>>  * struct xe_sysctrl_mailbox_command - System Controller mailbox command
>>  */
>> -- 
>> 2.43.0
>>
--------------n65QOvVZNh3gtg0UXHL4wnYS
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 15-08-2026 02:51, Umesh Nerlige
      Ramappa wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:an+G21kQjK+AUI9K@soc-5CG1426VCC.clients.intel.com">On
      Fri, Aug 14, 2026 at 02:53:06AM -0700, Anoop, Vijay wrote:
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
        wrapper to check diag firmware application readiness.
        <br>
        <br>
        Signed-off-by: Anoop Vijay <a class="moz-txt-link-rfc2396E" href="mailto:anoop.c.vijay@intel.com">&lt;anoop.c.vijay@intel.com&gt;</a>
        <br>
        ---
        <br>
        v2: (Badal)
        <br>
        - Return SysCtrl firmware application states instead of errno
        for
        <br>
        &nbsp;application lifecycle conditions
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
        v4: (Anshuman)
        <br>
        - Make xe_sysctrl_check_app_status() internal
        <br>
        - Remove unused app identifier
        <br>
        <br>
        v5: (Anshuman)
        <br>
        - Rename OOBMSM status helper to use xe_sysctrl_* prefix
        <br>
        - Remove xe_is_diag_fw_ready() helper
        <br>
        <br>
        v6: (Riana)
        <br>
        - Use xe_sysctrl_create_command() helper instead of manual
        FIELD_PREP
        <br>
        &nbsp;header packing
        <br>
        - Rename xe_sysctrl_get_app_status_by_id_{req,resp} to shorter
        names
        <br>
        - Use hex constant for application ID
        <br>
        - Move oCode application readiness helper to a separate patch
        <br>
        - Add xe_sysctrl_is_diag_fw_ready() helper.
        <br>
        <br>
        v7: (Umesh)
        <br>
        - Clarify xe_sysctrl_is_diag_fw_ready() comment for sysctrl-less
        platforms
        <br>
        - Move XE_SYSCTRL_APP_RESP_* flags and enum xe_sysctrl_app_id to
        xe_sysctrl.c
        <br>
        ---
        <br>
        drivers/gpu/drm/xe/xe_sysctrl.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 80
        +++++++++++++++++++
        <br>
        drivers/gpu/drm/xe/xe_sysctrl.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +
        <br>
        drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 47 +++++++++++
        <br>
        3 files changed, 128 insertions(+)
        <br>
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c
        b/drivers/gpu/drm/xe/xe_sysctrl.c
        <br>
        index 1db20be8158b..c53a26af3189 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_sysctrl.c
        <br>
        +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
        <br>
        @@ -13,9 +13,11 @@
        <br>
        #include &quot;xe_device.h&quot;
        <br>
        #include &quot;xe_mmio.h&quot;
        <br>
        #include &quot;xe_pm.h&quot;
        <br>
        +#include &quot;xe_printk.h&quot;
        <br>
        #include &quot;xe_soc_remapper.h&quot;
        <br>
        #include &quot;xe_sysctrl.h&quot;
        <br>
        #include &quot;xe_sysctrl_mailbox.h&quot;
        <br>
        +#include &quot;xe_sysctrl_mailbox_types.h&quot;
        <br>
        #include &quot;xe_sysctrl_types.h&quot;
        <br>
        <br>
        /**
        <br>
        @@ -29,6 +31,20 @@
        <br>
        &nbsp;* This module provides initialization and support code for
        interacting
        <br>
        &nbsp;* with System Controller through the mailbox interface.
        <br>
        &nbsp;*/
        <br>
        +
        <br>
        +/* Application status flags reported in
        xe_sysctrl_app_status_resp.flags */
        <br>
        +#define XE_SYSCTRL_APP_RESP_VALID&nbsp;&nbsp;&nbsp; BIT(0)
        <br>
        +#define XE_SYSCTRL_APP_RESP_BOOTED&nbsp;&nbsp;&nbsp; BIT(1)
        <br>
        +#define XE_SYSCTRL_APP_RESP_INITIALIZED&nbsp;&nbsp;&nbsp; BIT(2)
        <br>
        +
        <br>
        +/*
        <br>
        + * Known System Controller application identifiers, keyed by
        firmware
        <br>
        + * application ID.
        <br>
        + */
        <br>
        +enum xe_sysctrl_app_id {
        <br>
        +&nbsp;&nbsp;&nbsp; XE_SYSCTRL_APP_DIAG&nbsp;&nbsp;&nbsp; = 0x0D,
        <br>
        +};
        <br>
        +
        <br>
        static void sysctrl_fini(void *arg)
        <br>
        {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;struct xe_device *xe = arg;
        <br>
        @@ -130,3 +146,67 @@ void xe_sysctrl_pm_resume(struct xe_device
        *xe)
        <br>
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;xe_sysctrl_mailbox_init(sc);
        <br>
        }
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
        +&nbsp;&nbsp;&nbsp; struct xe_sysctrl_app_status_req req = {};
        <br>
        +&nbsp;&nbsp;&nbsp; struct xe_sysctrl_app_status_resp resp = {};
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
        +&nbsp;&nbsp;&nbsp; xe_sysctrl_create_command(&amp;cmd, XE_SYSCTRL_GROUP_CORE,
        XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;req, sizeof(req), &amp;resp,
        sizeof(resp));
        <br>
        +
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
        + * xe_sysctrl_is_diag_fw_ready() - Check if diag firmware is
        fully initialized
        <br>
        + * @xe: xe device instance
        <br>
        + *
        <br>
        + * Returns true if diag firmware has reached the initialized
        state, indicating
        <br>
        + * it is ready to handle requests. On platforms without System
        Controller
        <br>
        + * support there is no System Controller mailbox to gate on, so
        diag firmware
        <br>
        + * readiness is not tracked through this path; the function
        unconditionally
        <br>
        + * returns true so callers are not blocked by this check on
        such platforms.
        <br>
      </blockquote>
      <br>
      I am still not clear how the caller will handle the 2 scenarios -
      (1) SC is present, but diag app is not initialized vs (2) SC and
      mailbox are not available and hence Diag App is not supported. The
      caller will just see true in both cases.
      <br>
      <br>
      Instead I would see this as 2 helpers:
      <br>
      <br>
      xe_sysctrl_is_diag_fw_supported() that returns
      <br>
      status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
      <br>
      <br>
      and
      <br>
      <br>
      xe_sysctrl_is_diag_fw_ready() that returns
      <br>
      status == XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
      <br>
      <br>
      That would be clearer to the caller.
      <br>
      <br>
      Thanks,
      <br>
      Umesh
      <br>
      <br>
    </blockquote>
    All current/planned callers of xe_sysctrl_is_oobmsm_fw_ready() /
    xe_sysctrl_is_diag_fw_ready() (xe_vsec.c retry/gate logic,
    xe_sysctrl_debugfs.c RAS injection gate, xe_sysctrl_fwctl.c
    capability gate) only need a yes/no answer to &quot;Can this
    functionality be used now?&quot;
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
</style>&nbsp;and treat NOTSUPP and 'not yet initialized' the same way.<br>
    <br>
    Folding NOTSUPP into 'ready' is intentional. It lets sysctrl-less
    platforms skip straight through.<br>
    <br>
    Splitting into is_supported() + is_ready() wouldn't change any
    caller's behavior, but would require every caller to do
    '!supported() || ready()' check. This risks a caller checking only
    is_ready(), resulting in unnecessary retries or failures on a
    NOTSUPP platform.<br>
    <br>
    Given the current usage, I'd prefer to keep the combined helper and
    add a more granular status/support helper in the future if a real
    consumer requires that distinction.<br>
    <br>
    Thanks,<br>
    Anoop
    <blockquote type="cite" cite="mid:an+G21kQjK+AUI9K@soc-5CG1426VCC.clients.intel.com"><br>
      <blockquote type="cite">+ *
        <br>
        + * Return: true if diag firmware is initialized, or if System
        Controller is
        <br>
        + * not present on this platform; false otherwise
        <br>
        + */
        <br>
        +bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; enum xe_sysctrl_fw_status status =
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_DIAG);
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
        index 090dffb6d55f..8dc576796890 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_sysctrl.h
        <br>
        +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
        <br>
        @@ -20,5 +20,6 @@ void xe_sysctrl_event(struct xe_sysctrl *sc);
        <br>
        int xe_sysctrl_init(struct xe_device *xe);
        <br>
        void xe_sysctrl_irq_handler(struct xe_device *xe, u32
        master_ctl);
        <br>
        void xe_sysctrl_pm_resume(struct xe_device *xe);
        <br>
        +bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe);
        <br>
        <br>
        #endif
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
        b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
        <br>
        index d0341538ad05..f1e4253fda4b 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
        <br>
        +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
        <br>
        @@ -14,9 +14,11 @@
        <br>
        &nbsp;* enum xe_sysctrl_group - System Controller command groups
        <br>
        &nbsp;*
        <br>
        &nbsp;* @XE_SYSCTRL_GROUP_GFSP: GFSP group
        <br>
        + * @XE_SYSCTRL_GROUP_CORE: Core group
        <br>
        &nbsp;*/
        <br>
        enum xe_sysctrl_group {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;XE_SYSCTRL_GROUP_GFSP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = 0x01,
        <br>
        +&nbsp;&nbsp;&nbsp; XE_SYSCTRL_GROUP_CORE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = 0xFF,
        <br>
        };
        <br>
        <br>
        /**
        <br>
        @@ -38,6 +40,51 @@ enum xe_sysctrl_gfsp_cmd {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;XE_SYSCTRL_CMD_SET_HEALTH&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = 0x0C,
        <br>
        };
        <br>
        <br>
        +/**
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
        + * struct xe_sysctrl_app_status_req - Get application status
        request
        <br>
        + *
        <br>
        + * @app_id: Application ID for which to retrieve status
        <br>
        + */
        <br>
        +struct xe_sysctrl_app_status_req {
        <br>
        +&nbsp;&nbsp;&nbsp; u8 app_id;
        <br>
        +} __packed;
        <br>
        +
        <br>
        +/**
        <br>
        + * struct xe_sysctrl_app_status_resp - Get application status
        response
        <br>
        + * @flags: Application status flags interpreted by
        xe_sysctrl_check_app_status()
        <br>
        + */
        <br>
        +struct xe_sysctrl_app_status_resp {
        <br>
        +&nbsp;&nbsp;&nbsp; u32 flags;
        <br>
        +} __packed;
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
        /**
        <br>
        &nbsp;* struct xe_sysctrl_mailbox_command - System Controller mailbox
        command
        <br>
        &nbsp;*/
        <br>
        --&nbsp;<br>
        2.43.0
        <br>
        <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------n65QOvVZNh3gtg0UXHL4wnYS--
