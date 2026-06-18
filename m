Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA788CD98F9
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 04:46:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D5B510EBFD;
	Thu, 18 Jun 2026 04:46:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WwlwfKSb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F44E10EBFD
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jun 2026 04:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781757991; x=1813293991;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tcbT6X/py3dP7er6mX1G21/66WaaIYnNDExsDaCbkIc=;
 b=WwlwfKSbVitnxi1Mvf1fKEeUbwzzk1VxwYfJyrRvwGmFVeZN9iJY8d4b
 p+Th8QtIjhSCGTy4ZIoCYYIgOnAOe2UUt75zvFoOVnqkF2GnXGDNbyFVy
 w4b6XIOzykrbRtvuBQIGvkcdM0yhkte+u90frUQFynTXjCnV30P/Xu+bH
 HMEHQKH1P8Kex0W5oDVVE8/qwZxrv9SMuiu78AdnAxCZAAe7NejB6UHdO
 xvR4is7xaR50KWF9OFXAUpBm+txZ/jzvjbLtLlJqQvBSGbgHTIV+11/op
 q4dAwcB/2+RuodeYIUSdf03Aja8Wwv5uimUcmXptl9xl7qqnYrQ8IBFIL w==;
X-CSE-ConnectionGUID: Y6GYobFVQ8G5aABqZI82hg==
X-CSE-MsgGUID: eePpCk8ZTqOmQWlWKGcUDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82692856"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="82692856"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 21:46:31 -0700
X-CSE-ConnectionGUID: 4dMGTxIYR3C3wsJ6qvtiKg==
X-CSE-MsgGUID: Unrb7tORTSWyXek0apsWaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="248323412"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 21:46:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 21:46:30 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 17 Jun 2026 21:46:30 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.66) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 21:46:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=stVzrM8sbxgrDg1YFAhTTw5mrmpaWqt5J4poJ+ACcwCYTefg0zolamMboauXBCjjuZtJj4AU8rQth10EVvqlLhNMkg0Ek2hoSMhub5EdEn5SY+uwL2cct4AZ97LIAG5ure9CShrpBe9a9v4XUYFZrFpkxDaNxGI5Ci84e8DjqdnHWHY8fZOhhWrf/C/qRUEXLUkCIKoUhIzAkEq6A0FonyQSLIHm9PLbCbxF7s74pZLl6nmDn80c8+gCm4P77JS8D0orLgQwyVQUPYCa1RIiRLnuEjZx/cefB5kb3mYuZXU1qlnA3RYkDuUMR9TJj4s643Gmbwj2jymG4L1dNRW2Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/T4YvBTwt6KPk4A1hoyXPNxXP5t46OvqHU59guB8nc=;
 b=FPsntQiOu+SZnH80XLNgMQuWSFhEGIIKWJeONvUblCJySWJBRjaNDFxjyt/DPX0HHuK5uHx538IDwSNMM6XDCHKWvZvP/byBfdLe1do78BPxDnc8Z4AyhDkFDr6dUj5R8vCPqzrO5fk054ELRqY40nhYSa/ZgQuoxSCj6HYafZyGqbiXL/1Z0NcbeSUBU+rRFd7Y/idZO4C8dBJHaPSI3FZ7oMcHCRg0BRa1oY7kxjrZSwHAjAlva3LoKHpEASI5kKAO/TnUPPuv0hgpS1rQu4LfffBICGDPaAH5gOwa8AxJSMoJCFPxc21ofAQNlx9pyFKjQmeDyxYpSaR0C1hYWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by CY8PR11MB7169.namprd11.prod.outlook.com (2603:10b6:930:90::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 04:46:28 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%3]) with mapi id 15.21.0139.011; Thu, 18 Jun 2026
 04:46:27 +0000
Message-ID: <f2539d40-9d1b-4689-93cf-e770a74628f7@intel.com>
Date: Thu, 18 Jun 2026 10:16:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] drm/xe/xe_ras: Add RAS GPU health indicator
To: "Purkait, Soham" <soham.purkait@intel.com>,
 <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <andi.shyti@intel.com>,
 <rodrigo.vivi@intel.com>
CC: <anoop.c.vijay@intel.com>
References: <20260610093353.2538576-3-soham.purkait@intel.com>
 <20260610093353.2538576-4-soham.purkait@intel.com>
 <3467c712-8507-45c7-8ac7-2a32265ceb29@intel.com>
 <7cef02f0-059f-46d5-923c-04a61e0ce720@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <7cef02f0-059f-46d5-923c-04a61e0ce720@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0327.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::6) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|CY8PR11MB7169:EE_
X-MS-Office365-Filtering-Correlation-Id: 391277cf-e0e4-48f9-9e4d-08deccf48f12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|921020|18002099003|22082099003|3023799007|11063799006|56012099006|6133799003|4143699003;
X-Microsoft-Antispam-Message-Info: RuzlecaP4IKLy4SBI4VEzfURwx7qZiwDUZn/SwrufOrrRVAXpWoK6WAJ6iCPePwqQzzTZedwZOS4XGIRTyxjYAU7KqtDnY0WPYOS2kvoOvvQQMK3YOQmazd5zqOJE0qQ1d8Old4kR2BesjKa6todxPgwP5X6QCX+ymHmgjPFwBtgnn077AhrEpLQt6c1UK9o7VgIuB0tWCIe2QAVRoUT9G7m+J49guJ535RB+gbB7YALrX8VBRF1ojUVb5Cy99+gAVcCDLh6g851cnPbV3F0XkzWft8S0DBJMIf/BXkteUx+EMJZ9swxAjrIG3yUb+06xOrgL9iL/VBOHb1I0WtAxZCvXNqTpsuzp4ZnhNVe9zhy1LXXb3FOPxmyDmnpovnNeA4Pnv6RH88OWzvM11bh95gzaa8fobnmKMFLR/+8b5bOZ8RcBXfhvEqGqquS77LY5UvUqG9tjkz1zoTSfe61rDKisPKuxZvcG93zue4kdLkr32lZ+LjG2G0iQVqCMs5957fcPkmtr5bCrPHOZim4RgVdQ5prbyPFIY/PHnhengYrBjRpigDr19D4gHUgLlvunwtqKc1eePDx29yUAvXNdzoiiLtf9nrqO3uyCvFnoceEaqkNU7PbvdxsyLjsWUz6zvEQXIUzrYD2Qn2a8LFAlPeNxCd8jRi0z9jAdzU2tozQ5h6iySqLNjr8hbHZRhJsaW6JGM/aqH/HFDiDZf3Gd68DrLZeOfuM9e534l3KO3e8Xcbac8UBA4Z5vALsHPFF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(921020)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006)(6133799003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEFpQjFob01DQmFKaXFqeGJlMnlwWVVmejdBbHV4ei9lZDVvVHQzNUFOY0tD?=
 =?utf-8?B?eHR0VHNrKy9zZzhhTW5vZmVTTXQwa0ZBZ1VUbXRkRVZQbkMxYVF5dXNONmJ6?=
 =?utf-8?B?NHB1aityZnB3Q1dhVk9nQkNVbG4wK0YxK2I5eHJ3b2NmRDFaWm0rakNuUjJp?=
 =?utf-8?B?L1ZUS0NpSVY0WXUzd0ZqcUNuaEZ2ajdYMVp2ejg0WERZenJRalg0U3p3QTJF?=
 =?utf-8?B?NmlXL0ZFT052LzdzeW5vVnUvOGJ4a2JVOVA3ekg5NXd3eVNidm54RENPVGgr?=
 =?utf-8?B?bVF5bFUrNkpyRmo1NGtBaktpMzFpMU1VSlAyTUZaV2NLdGhRbUpod3g0Wklm?=
 =?utf-8?B?aHpVRUx1dXJ4QXJUcWJTbWM2MWp1QVNvVzVSTHFUU1ZlNkdVSGwxSEg3emVE?=
 =?utf-8?B?TWcxSUJ1QXNGWFRqamRpSnRla3Rjd0VadHZ4aUY4dFlNY1UvQS8vUkMvRlpp?=
 =?utf-8?B?aEkxQjRVUWtzeVlEdEg1MGl0dTdMbUlvQk4xQlJKODY4Q3Btc3FueFVWelkx?=
 =?utf-8?B?blpYZk5EaC9KV2dWU1RtbE5MSEs3MlBiclRvUGtnTjc4WmZubW5hN3luRjFD?=
 =?utf-8?B?bEhQbkpJMnhQUkxybHhMaUpQcHdMaTkzdUZ5QmpKSGk4aGw1OEcxeEgwVG5v?=
 =?utf-8?B?bk9ZYWN3WEVLRnZENlR1ZHJWYlRycm1Lbi9KN3F0aGw2VTU5cnpGQW1wNEZ6?=
 =?utf-8?B?UCtLNmxxQTdXTWJrMmNSYnZIbFlncXgyUFNWTUpoMHlkTlVqNllrMGVBQ3Bt?=
 =?utf-8?B?RWZaYTlVSlFoc0tuRUxIbGlpV1VHeUI5OVFieGcrSUdCTHZJdkdaRXR1Y0dY?=
 =?utf-8?B?cmthZTNWelEzaHBuWER4SHF4VmlsakR4bUlSRnYvWUhWZytWbUFpRGJwRVBk?=
 =?utf-8?B?SHdrN2lkeGZJY3ZnSGF4MzBscVIyWEw4Q0dKTWY0OXBhSkgvT0VPRFNzTGJV?=
 =?utf-8?B?UTZpZmhSL2JTNHBTdzhNVVNIbzhGQ1F3Z2VXY2FUS2JjTDBHQUQ0N1VlNHZU?=
 =?utf-8?B?TFh5azNwa3RCTHBjVWRDUHJNb1Nvd2hBbGRyckt3ZVhYNGIwdzJqS3dyTVQv?=
 =?utf-8?B?MStGUUJDeCtQSUNGaFgyV0UwRmx3UjR4WHNIK3RYZU9JZkV5OHc1WkU0K0Vl?=
 =?utf-8?B?dWNlY2dBSER4ZDluOFBqaFlRRzVqYnhCRXVHV1FyYnVTZGgyc1NkcXZpNXE2?=
 =?utf-8?B?NUc1SzVUc0c0NmY3WTRybVE5WVpsY3dGZFRtMTBDZUJGWEJiQnF6VllETENw?=
 =?utf-8?B?Wm1TV1VrbE9tTGpQNHd6WVU0VVFFbHNVaHc4MlFleXpwSHplUDM4R3FnaDhS?=
 =?utf-8?B?Zk8vczdyOURLNGdCQ3djWDZsN25STFlHeWU2dU04VDRHbVlKQjhHY0FhTTBG?=
 =?utf-8?B?VGZrVUhaV1dadHRzVzBhRk50TE15ZWpFNWFDYTR5ZlRHTGZCTWplOE5aT1Va?=
 =?utf-8?B?VTZudGk4VFlsLzUzQUNOM0RQdFVtNXpITk54dVh4N3hlWERvNmFPcmVyekdp?=
 =?utf-8?B?bUg5Z1dzaGtleUJxUCs2dHIxY2k5QS8vMGVCZkxuejFmQWdHdWNEb1pGRllk?=
 =?utf-8?B?bnhSNkhqSHpOOUdpYkk5UFI2czg4OC9ibEhMbUlzNWptRmxua3ZPZDVZNUky?=
 =?utf-8?B?NS9HbUdxeElPNEFENVVkWVlTYWgvQkEvUWxuMjJDWW9nMld4OFFKMENxOE9a?=
 =?utf-8?B?N05CYVg0LzBaa1J6VjdaS1FCZlpnemdSWEVsMy90em1wRVZySUFHTUVUNmVE?=
 =?utf-8?B?YWJsTUNVcFZiYTJkZVgvTTdWY2NyWVBYcldIcTRHcmlkU2VFb2o0ODI3Slhz?=
 =?utf-8?B?cEZMVkRzUGpmbU8rVkZkVkE5Y0FXNzNLUU14RFJWUGxMNkJrR0J0Mi9HbVlm?=
 =?utf-8?B?MVMzcnlJdzRNNjVhY0VCTnpIUE1xN281SkQxR2VmNU9EWUdCcmVwa2FsTDdu?=
 =?utf-8?B?Sng2Y0l3MVljZ3IzVUpIRXE4RTJDSlRIRGt1TGUrSG5TK2F1R0F2STFKRER0?=
 =?utf-8?B?bFdLRFVaTFkrYUJFTzI1Vm5oblRXa0dGaDVEL0ZPLyt5djY4VUZETmhHcEE5?=
 =?utf-8?B?SkdFTGlGWmltaTRneHBSNDNFLy92bDMxZDgvZmxJZ1dYUmJSZTdUUXEvVXkz?=
 =?utf-8?B?UVM4ZVlDWTgzQTd6eFNhSmw5SEZuS05rejNvU0czVGtkVmpWK2lGYkJ6MHNP?=
 =?utf-8?B?WGMxK011ZkxWOHRRL0RwS29rZnVCc1BkQ2ppZ1VwcHprMUNadmlEaEdRTjJq?=
 =?utf-8?B?Ym1kTE5WeUhIRkFJU1pITlJhYXQ2ZE5qK3VPZWxabVJsQmtaSkZYY3VnVERs?=
 =?utf-8?B?N2t1ZDRHMW5iRGRqNUFZdk8zY0toK2xMK1hMQTIzNENFVHlra1hScVhBSHRj?=
 =?utf-8?Q?GtNSC0T1VFtEA1Qo=3D?=
X-Exchange-RoutingPolicyChecked: e7aKYhS+r9lHJxcDTi5P8eLEw5Pw+0rJKFoPCzThnp+507KsvZwjpdbAyI29NGId/jyLvskEEy1jZEdARS3Cz7QeZzwLF0NMcOFNeXP1qBnnaWnS5QYwmcEdQ06jpXVicRE5V3al5HHoowvaQv90dYFQjychxoq9vHc1F+cVTyvHGbUvhsMQhRcOt5b4tVSD/WWw0t82aIDA2JRZsDeQiscq6AsSntmTcMRZ+FcFjdsacnXgu1UhVinCtRiY5V9w8RhGnrzn1AMlOOnYhHInJY3MYkKqGLVGeKCkWQD30LmTu5SjX0bJckS81J9JKr8CcVO1xH4uKJ2ykgxNwvk9Gg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 391277cf-e0e4-48f9-9e4d-08deccf48f12
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 04:46:27.8660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nYHnIdXmg5eNbwzy2rna9Pyl6kHds4ZbM+zVo4UsMgclDi8jBOSMU0nkF2k7b2wD+VlD3/mr0uBb1fMaNEtohw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7169
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


On 18-06-2026 00:18, Purkait, Soham wrote:
> Hi Badal,
>
> On 17-06-2026 14:05, Nilawar, Badal wrote:
>>
>> On 10-06-2026 15:03, Soham Purkait wrote:
>>> Add a sysfs interface that reports the current GPU health state and
>>> lets admin users and management tools update it but is readable by all
>>> users. Requests are routed through the sysctrl mailbox. The interface
>>> is present only on platforms that support the GPU health indicator.
>>>
>>> The interface is a single read/write file at the device level:
>>>
>>>    $ cat /sys/.../device/gpu_health
>>>    ok
>>>
>>>    $ echo critical > /sys/.../device/gpu_health
>>>
>>>    $ cat /sys/.../device/gpu_health
>>>    critical
>>>
>>> v1:
>>>   - Add enum for health status. (Andi, Rodrigo)
>>>   - Return error number instead of error message in _show/_store. 
>>> (Andi)
>>>   - Move GPU health sysfs init error logging to xe_ras_init. (Andi)
>>>   - Return only the current health state for sysfs read. (Andi, 
>>> Rodrigo)
>>>   - Add documentation for sysfs interface. (Andi, Rodrigo)
>>>
>>> v2:
>>>   - Make logs and structures consistent with their counterparts. 
>>> (Riana)
>>>   - Drop unnecessary variables. (Andi, Riana)
>>>   - Add correct KernelVersion. (Raag)
>>>
>>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>>> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> ---
>>>   .../ABI/testing/sysfs-driver-intel-xe-ras     |  30 +++
>>>   drivers/gpu/drm/xe/xe_ras.c                   | 177 
>>> ++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_ras.h                   |   1 +
>>>   drivers/gpu/drm/xe/xe_ras_types.h             |  60 ++++++
>>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       |  28 +++
>>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |   3 +
>>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   4 +
>>>   7 files changed, 303 insertions(+)
>>>   create mode 100644 
>>> Documentation/ABI/testing/sysfs-driver-intel-xe-ras
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-ras 
>>> b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
>>> new file mode 100644
>>> index 000000000000..c7f2cf8bb6ad
>>> --- /dev/null
>>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
>>> @@ -0,0 +1,30 @@
>>> +What:        /sys/bus/pci/drivers/xe/.../gpu_health
>>> +Date:        April 2026
>>> +KernelVersion:    7.2
>>> +Contact:    intel-xe@lists.freedesktop.org
>>> +Description:
>>> +        This file exposes the current GPU health state and allows 
>>> the GPU
>>> +        health state to be updated.
>>> +
>>> +        This sysfs file is present only on Intel Xe platforms that 
>>> support
>>> +        the GPU health indicator interface for RAS. Reading the 
>>> current
>>> +        health state is available to all users, while updating the 
>>> health
>>> +        state is restricted to administrative users only.
>>> +
>>> +        Read returns a single line containing one of the valid 
>>> values for
>>> +        the current device health state. Writing one of the valid 
>>> values
>>> +        updates the current device health state.
>>> +
>>> +        The valid values for the device health state are:
>>> +
>>> +            ok
>>> +                The device is healthy and operating within normal
>>> +                parameters.
>>> +
>>> +            warning
>>> +                The device is experiencing minor issues but remains
>>> +                operational.
>>> +
>>> +            critical
>>> +                The device is in a critical state and may not be
>>> +                operational.
>>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>>> index 4cb16b419b0c..b7efd607aadf 100644
>>> --- a/drivers/gpu/drm/xe/xe_ras.c
>>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>>> @@ -4,11 +4,14 @@
>>>    */
>>>     #include "xe_device.h"
>>> +#include "xe_pm.h"
>>>   #include "xe_printk.h"
>>>   #include "xe_ras.h"
>>>   #include "xe_ras_types.h"
>>>   #include "xe_sysctrl.h"
>>>   #include "xe_sysctrl_event_types.h"
>>> +#include "xe_sysctrl_mailbox.h"
>>> +#include "xe_sysctrl_mailbox_types.h"
>>>     /* Severity of detected errors  */
>>>   enum xe_ras_severity {
>>> @@ -31,6 +34,16 @@ enum xe_ras_component {
>>>       XE_RAS_COMP_MAX
>>>   };
>>>   +/* RAS response status codes */
>>> +enum xe_ras_response_status {
>>> +    XE_RAS_STATUS_SUCCESS = 0,
>>> +    XE_RAS_STATUS_INVALID_PARAM,
>>> +    XE_RAS_STATUS_OP_NOT_SUPPORTED,
>>> +    XE_RAS_STATUS_TIMEOUT,
>>> +    XE_RAS_STATUS_HARDWARE_FAILURE,
>>> +    XE_RAS_STATUS_INSUFFICIENT_RESOURCES
>>> +};
>>> +
>>>   static const char *const xe_ras_severities[] = {
>>>       [XE_RAS_SEV_NOT_SUPPORTED]        = "Not Supported",
>>>       [XE_RAS_SEV_CORRECTABLE]        = "Correctable Error",
>>> @@ -50,6 +63,33 @@ static const char *const xe_ras_components[] = {
>>>   };
>>>   static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
>>>   +static const char * const gpu_health_states[] = {
>>> +    [XE_RAS_HEALTH_STATUS_OK]        = "ok",
>>> +    [XE_RAS_HEALTH_STATUS_WARNING]        = "warning",
>>> +    [XE_RAS_HEALTH_STATUS_CRITICAL]        = "critical"
>>> +};
>>> +static_assert(ARRAY_SIZE(gpu_health_states) == 
>>> XE_RAS_HEALTH_STATUS_MAX);
>>> +
>>> +static int ras_status_to_errno(u32 status)
>>> +{
>>> +    switch (status) {
>>> +    case XE_RAS_STATUS_SUCCESS:
>>> +        return 0;
>>> +    case XE_RAS_STATUS_INVALID_PARAM:
>>> +        return -EINVAL;
>>> +    case XE_RAS_STATUS_OP_NOT_SUPPORTED:
>>> +        return -EOPNOTSUPP;
>>> +    case XE_RAS_STATUS_TIMEOUT:
>>> +        return -ETIMEDOUT;
>>> +    case XE_RAS_STATUS_HARDWARE_FAILURE:
>>> +        return -EIO;
>>> +    case XE_RAS_STATUS_INSUFFICIENT_RESOURCES:
>>> +        return -ENOSPC;
>>> +    default:
>>> +        return -EPROTO;
>>> +    }
>>> +}
>>> +
>>>   static inline const char *sev_to_str(u8 severity)
>>>   {
>>>       if (severity >= XE_RAS_SEV_MAX)
>>> @@ -91,3 +131,140 @@ void xe_ras_counter_threshold_crossed(struct 
>>> xe_device *xe,
>>>               comp_to_str(component), sev_to_str(severity));
>>>       }
>>>   }
>>> +
>>> +static ssize_t gpu_health_show(struct device *dev, struct 
>>> device_attribute *attr, char *buf)
>>> +{
>>> +    struct xe_ras_get_health_response response = {0};
>>> +    struct xe_sysctrl_mailbox_command command = {0};
>>> +    struct xe_ras_get_health_request request = {0};
>>> +    struct xe_device *xe = kdev_to_xe_device(dev);
>>> +    enum xe_ras_health_status health;
>>> +    size_t rlen = 0;
>>> +    int ret;
>>> +
>>> +    xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, 
>>> XE_SYSCTRL_CMD_GET_HEALTH,
>>> +                  &request, sizeof(request), &response, 
>>> sizeof(response));
>>> +    guard(xe_pm_runtime)(xe);
>>> +    ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>>> +    if (ret) {
>>> +        xe_err(xe, "sysctrl: failed to send get health command 
>>> %d\n", ret);
>>> +        return ret;
>>> +    }
>>> +
>>> +    if (rlen != sizeof(response)) {
>>> +        xe_err(xe, "sysctrl: unexpected get health response length 
>>> %zu (expected %zu)\n",
>>> +               rlen, sizeof(response));
>>> +        return -EIO;
>>> +    }
>>> +    if (response.current_health >= XE_RAS_HEALTH_STATUS_MAX) {
>>> +        xe_err(xe, "sysctrl: invalid health state %u\n",
>>> +               response.current_health);
>>> +        return -EIO;
>>> +    }
>>> +
>>> +    health = (enum xe_ras_health_status)response.current_health;
>>> +
>>> +    xe_dbg(xe, "[RAS]: get health:%s\n", gpu_health_states[health]);
>>> +
>>> +    return sysfs_emit(buf, "%s\n", gpu_health_states[health]);
>>> +}
>>> +
>>> +static ssize_t gpu_health_store(struct device *dev, struct 
>>> device_attribute *attr,
>>> +                const char *buf, size_t count)
>>> +{
>>> +    struct xe_ras_set_health_response response = {0};
>>> +    struct xe_sysctrl_mailbox_command command = {0};
>>> +    struct xe_ras_set_health_request request = {0};
>>> +    struct xe_device *xe = kdev_to_xe_device(dev);
>>> +    enum xe_ras_health_status health;
>>> +    size_t rlen = 0;
>>> +    int ras_status;
>>> +    int state;
>>> +    int ret;
>>> +
>>> +    state = sysfs_match_string(gpu_health_states, buf);
>>> +    if (state < 0) {
>>> +        xe_err(xe, "[RAS]: invalid health state '%.*s'\n",
>>> +               (int)strcspn(buf, "\n"), buf);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    request.new_health = (u8)state;
>>> +
>>> +    xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, 
>>> XE_SYSCTRL_CMD_SET_HEALTH,
>>> +                  &request, sizeof(request), &response, 
>>> sizeof(response));
>>> +    guard(xe_pm_runtime)(xe);
>>> +    ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>>> +    if (ret) {
>>> +        xe_err(xe, "sysctrl: failed to send set health command 
>>> %d\n", ret);
>>> +        return ret;
>>> +    }
>>> +
>>> +    if (rlen != sizeof(response)) {
>>> +        xe_err(xe, "sysctrl: unexpected set health response length 
>>> %zu (expected %zu)\n",
>>> +               rlen, sizeof(response));
>>> +        return -EIO;
>>> +    }
>>> +
>>> +    ras_status = ras_status_to_errno(response.status);
>>> +    if (ras_status) {
>>> +        xe_err(xe, "sysctrl: set health command failed with status 
>>> %d\n",
>>> +               response.status);
>>> +        return ras_status;
>>> +    }
>>> +
>>> +    if (response.current_health >= XE_RAS_HEALTH_STATUS_MAX) {
>>> +        xe_err(xe, "sysctrl: invalid health state %u\n",
>>> +               response.current_health);
>>> +        return -EIO;
>>> +    }
>>> +
>>> +    health = (enum xe_ras_health_status)response.current_health;
>>> +
>>> +    xe_dbg(xe, "[RAS]: set health:%s\n", gpu_health_states[health]);
>> The [RAS] prefix is redundant here as xe_dbg macro already includes 
>> driver/subsystem context.
>
> xe_dbg  does not print [RAS] prefix by default. This convention is 
> already being used in upstream: <operation>:<value> <component> 
> <severity>

I’m not saying that [RAS] would be printed by default; however, the 
dmesg output will include "[drm:gpu_health_store [xe]]".
If a prefix is required, I’m okay adding one. Going ahead similar to GT 
oriented logging, we could introduce RAS oriented logging (e.g. xe_ras_dbg)
to consistently prefix messages with [RAS]. Not needed at this stage; 
can be revisited later.

>
>>> +
>>> +    return count;
>>> +}
>>> +
>>> +static DEVICE_ATTR_RW(gpu_health);
>>> +
>>> +static void gpu_health_sysfs_fini(void *arg)
>>> +{
>>> +    struct device *dev = arg;
>>> +
>>> +    device_remove_file(dev, &dev_attr_gpu_health);
>>> +}
>>> +
>>> +static int gpu_health_sysfs_init(struct xe_device *xe)
>>> +{
>>> +    struct device *dev = xe->drm.dev;
>>> +    int err;
>>> +
>>> +    err = device_create_file(dev, &dev_attr_gpu_health);
>>> +    if (err)
>>> +        return err;
>>> +
>>> +    err = devm_add_action_or_reset(dev, gpu_health_sysfs_fini, dev);
>>> +    if (err)
>>> +        return err;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +/**
>>> + * xe_ras_init - Initialize Xe RAS
>>> + * @xe: xe device instance
>>> + *
>>> + * Initialize the RAS GPU health sysfs interface.
>>> + */
>>> +void xe_ras_init(struct xe_device *xe)
>>> +{
>>> +    int ret;
>>> +
>>> +    if (!xe->info.has_sysctrl || IS_SRIOV_VF(xe))
>>> +        return;
>>> +
>>> +    ret = gpu_health_sysfs_init(xe);
>>> +    if (ret)
>>> +        xe_err(xe, "[RAS]: failed to initialize GPU health sysfs, 
>>> err=%d\n", ret);
>> ditto.
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>>> index ea90593b62dc..8acfd0ffe48e 100644
>>> --- a/drivers/gpu/drm/xe/xe_ras.h
>>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>>> @@ -11,5 +11,6 @@ struct xe_sysctrl_event_response;
>>>     void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>>>                         struct xe_sysctrl_event_response *response);
>>> +void xe_ras_init(struct xe_device *xe);
>>>     #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h 
>>> b/drivers/gpu/drm/xe/xe_ras_types.h
>>> index 4e63c67f806a..4767bcf315a3 100644
>>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>>> @@ -10,6 +10,21 @@
>>>     #define XE_RAS_NUM_COUNTERS            16
>>>   +/**
>>> + * enum xe_ras_health_status - Device health status values
>>> + *
>>> + * @XE_RAS_HEALTH_STATUS_OK: Device is healthy and operating normally.
>>> + * @XE_RAS_HEALTH_STATUS_WARNING: Device has minor issues but is 
>>> still operational.
>>> + * @XE_RAS_HEALTH_STATUS_CRITICAL: Device is in a critical state 
>>> and may not be operational.
>>> + * @XE_RAS_HEALTH_STATUS_MAX: Sentinel value for validation
>>> + */
>>> +enum xe_ras_health_status {
>>> +    XE_RAS_HEALTH_STATUS_OK = 0,
>>> +    XE_RAS_HEALTH_STATUS_WARNING,
>>> +    XE_RAS_HEALTH_STATUS_CRITICAL,
>>> +    XE_RAS_HEALTH_STATUS_MAX
>>> +};
>>> +
>>>   /**
>>>    * struct xe_ras_error_common - Error fields that are common 
>>> across all products
>>>    */
>>> @@ -70,4 +85,49 @@ struct xe_ras_threshold_crossed {
>>>       struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
>>>   } __packed;
>>>   +/**
>>> + * struct xe_ras_get_health_request - Request structure for GFSP 
>>> GET_HEALTH
>>> + *
>>> + * GET_HEALTH takes no input parameters; the reserved payload is 
>>> kept to
>>> + * preserve the firmware wire layout and allow future extensions. The
>>> + * driver must zero all reserved fields.
>>> + */
>>> +struct xe_ras_get_health_request {
>>> +    /** @reserved: Reserved for future use. */
>>> +    u32 reserved[2];
>>> +} __packed;
>>> +
>>> +/**
>>> + * struct xe_ras_get_health_response - Response structure for GFSP 
>>> GET_HEALTH
>>> + */
>>> +struct xe_ras_get_health_response {
>>> +    /** @current_health: Current GPU health, see &enum 
>>> xe_ras_health_status */
>>> +    u8 current_health;
>>> +    /** @reserved: Reserved for future use */
>>> +    u8 reserved[3];
>>> +} __packed;
>>> +
>>> +/**
>>> + * struct xe_ras_set_health_request - Request structure for GFSP 
>>> SET_HEALTH
>>> + */
>>> +struct xe_ras_set_health_request {
>>> +    /** @new_health: New GPU health to set, see &enum 
>>> xe_ras_health_status */
>>> +    u8 new_health;
>>> +    /** @reserved: Reserved for future use */
>>> +    u8 reserved[3];
>>> +} __packed;
>>> +
>>> +/**
>>> + * struct xe_ras_set_health_response - Response structure for GFSP 
>>> SET_HEALTH
>>> + */
>>> +struct xe_ras_set_health_response {
>>> +    /** @status: Status of set health operation, see &enum 
>>> xe_ras_response_status */
>>> +    u32 status;
>>> +    /** @current_health: Resulting current GPU health, see &enum 
>>> xe_ras_health_status */
>>> +    u8 current_health;
>>> +    /** @reserved: Reserved for future use */
>>> +    u8 reserved[3];
>>> +    /** @reserved1: Reserved for future use */
>>> +    u32 reserved1[2];
>> If firmware wire layout permits then how about combining reserved 
>> fields in single appropriately sized array.
> Regarding the reserved fields, I was thinking to keep it as is (as 
> documented) to avoid the confusion.
Ok.
> Thanks,
> Soham
>>> +} __packed;
>>
>> Missing blank line here.

This you can handle while merging.

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Thanks,
Badal

>>
>> Thanks,
>> Badal
>>
>>>   #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c 
>>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>> index 3caa9f15875f..9507f68bc2eb 100644
>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>> @@ -293,6 +293,34 @@ static int sysctrl_send_command(struct 
>>> xe_sysctrl *sc,
>>>       return 0;
>>>   }
>>>   +/**
>>> + * xe_sysctrl_create_command() - Create system controller command
>>> + * @command: Sysctrl command structure
>>> + * @group_id: Command group ID
>>> + * @cmd_id: Command ID
>>> + * @request: Pointer to request buffer (can be NULL)
>>> + * @request_len: Size of request buffer
>>> + * @response: Pointer to response buffer
>>> + * @response_len: Size of response buffer
>>> + *
>>> + * Helper function to build sysctrl command to be sent via 
>>> %xe_sysctrl_send_command()
>>> + */
>>> +void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command 
>>> *command, u8 group_id, u8 cmd_id,
>>> +                   void *request, size_t request_len, void *response,
>>> +                   size_t response_len)
>>> +{
>>> +    struct xe_sysctrl_app_msg_hdr header = {0};
>>> +
>>> +    header.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, group_id) |
>>> +              FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_id);
>>> +
>>> +    command->header = header;
>>> +    command->data_in = request;
>>> +    command->data_in_len = request_len;
>>> +    command->data_out = response;
>>> +    command->data_out_len = response_len;
>>> +}
>>> +
>>>   /**
>>>    * xe_sysctrl_mailbox_init - Initialize System Controller mailbox 
>>> interface
>>>    * @sc: System controller structure
>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h 
>>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>>> index f67e9234de48..fb434cc165b2 100644
>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>>> @@ -23,6 +23,9 @@ struct xe_sysctrl_mailbox_command;
>>>   #define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
>>>       FIELD_GET(APP_HDR_VERSION_MASK, (hdr)->data)
>>>   +void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command 
>>> *command, u8 group_id, u8 cmd_id,
>>> +                   void *request, size_t request_len, void *response,
>>> +                   size_t response_len);
>>>   void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
>>>   int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>>>                   struct xe_sysctrl_mailbox_command *cmd,
>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h 
>>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>> index 84d7c647e743..f82e3fb9b5ef 100644
>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>> @@ -23,9 +23,13 @@ enum xe_sysctrl_group {
>>>    * enum xe_sysctrl_gfsp_cmd - Commands supported by GFSP group
>>>    *
>>>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>>> + * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve current health status
>>> + * @XE_SYSCTRL_CMD_SET_HEALTH: Set new health status
>>>    */
>>>   enum xe_sysctrl_gfsp_cmd {
>>>       XE_SYSCTRL_CMD_GET_PENDING_EVENT    = 0x07,
>>> +    XE_SYSCTRL_CMD_GET_HEALTH        = 0x0B,
>>> +    XE_SYSCTRL_CMD_SET_HEALTH        = 0x0C,
>>>   };
>>>     /**
