Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04031C5B56A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 09:26:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B502610EF10;
	Wed, 12 Aug 2026 09:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ceGwgjhW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC3A10EF10
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 09:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786526773; x=1818062773;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mLZ37nGCtbf8Ik0yQSbIjaIkbhQRHZHejsTrh+XuIjw=;
 b=ceGwgjhW8h6l+STJQgxGylqBbaAmDbOf17pRkVuvsciHZCFGvPQAG5Un
 FWkuOH2aUiFMp4Z9TWZco5vEB8LKE2xR85OrQYs7gF00tBlN9dc42TLob
 ok2qmPXTOtW40+vVTamSizjA/X2MB8s5JyfyZZ3oYlTextg9N6Re5yQ+t
 Z806SxFbqj/FBxD3UJV83V1hTbZ2aOUcboIf/nysMLkqGUP/8ndailM3p
 l5l0Z+hPmrH1lcD+sbcpg5dcDboGXzIrzc9TxR8exrjN+jjJDi2O7bwtn
 tYltx0M5YUQuEt+2P4j5hrUtxWAUCxM/zEsG9m7WKCs3Jo6kAhg9XLUQh g==;
X-CSE-ConnectionGUID: 7ojtfgLJTe6VXffmLqLN0g==
X-CSE-MsgGUID: EFeBHS4FRZigvjSI42pHdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="90887126"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="90887126"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 02:26:13 -0700
X-CSE-ConnectionGUID: 0V9PSaORQX2kwzMjOyG3gQ==
X-CSE-MsgGUID: n4a7Qv2+QpWLldzvIr7bvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="265590759"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 02:26:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 02:26:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 02:26:12 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 02:26:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RjhvjwsgmzlZbanMBT4aJcXTqe+Ugnq7q4+SBctxCBWLagq85g1YynTz9UFxCGgFw6WCnmDNgrQ6V/OneubivMPbQP3dLl0Y8KCub+ezaC60wT61AiIMnuKaqGfPXhQ4f6yiuwHJYW4vPP5SauZomjXVpvIaGxxxld5C7lNlczB6F17X74yY+WQWyceepPldyDJWlOPTnd+16E3XZcSuwKIsQ/X0ukJhWZYJHRaHu5mKnYG6nXwDVecsJx8jCtHrnIbgJQpfLtttVCK0n9oURO9dbBtYPBo0FLIEQYtiTPcxOL//5g8wI1T8ADDMwx3VCX8llhqXygKgPPMyf9VBNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CdrjhK21WZEbPyyxlgGfwX8JRvQwGl7ztT0UzJNThBQ=;
 b=n+ubXNUZSeX2Y/DSW9MuNxbLEketQFbS+Fa7r6pJtkYAlL9bDljp8zeF+Mby3lRMfiQDKEGSLehMTf06opvzuA9HBP8SR6Y5fn27h5GC4Kn7MpZg6VdNJxOVXmeA++kQEYPmmUxyVLKQtBqdAwyGmueUi2fnc7tVvvkK8eVU/aVl+1Xrv1zv0dZZ8jVDU6O75IsNT6d2WGq/g9DNsARFdcse/W7gU4mkFzfsAs7P5/x18KOxrGcu5Wg0pLIzzUKVeEJ3HTW4mHLytMMbUcg08fY7w0JpxYpRxbTlibQW8J20LyGhbQDnMQkafpCwH7oxfSwPyG7NAkII5dzZPBRtPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 LV8PR11MB8463.namprd11.prod.outlook.com (2603:10b6:408:1ed::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.12; Wed, 12 Aug 2026 09:26:08 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0315.011; Wed, 12 Aug 2026
 09:26:08 +0000
Message-ID: <3a62d55a-2f57-424d-9015-ae2e4f151803@intel.com>
Date: Wed, 12 Aug 2026 14:56:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/23] drm/xe/log: Extend components list with hardware
 items
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, "Mallesh, Koujalagi"
 <mallesh.koujalagi@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-12-michal.wajdeczko@intel.com>
 <f70d047f-021a-4ac0-892e-3af837aca082@intel.com>
 <ce505796-9927-4b5c-86e4-4657d51f30b7@intel.com>
 <c17e6b21-89f2-49ae-9353-af7d99140eeb@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <c17e6b21-89f2-49ae-9353-af7d99140eeb@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0211.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::17) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|LV8PR11MB8463:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c487830-7416-4063-c232-08def853bdc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|22082099003|18002099003|4143699003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: GuuHxmPXpcNPQA1nfHvWi7nUZ917YWpbZW3RMjvSgRIyMhaFcqNq8Va9MBsiW8R2c0ZOD+jddvGlbI9huEyT7LKX3hcQ19JdQWQbFh79tJW/JVwLED+xsvB3rbElkCo/PLKa4k58QQ/2l1m8utgkuAAGuudq+rRryv7IbCngHd6YTeOXgyUJrxNpzZXOJNMgK4re0Skr8wGOyD9JTjlxCZBumxIgzf7xSjuoZIaDJXmsROcJGWNFl6oHrjTqHum2m0LE7FvEHs7n4Ml+sQ5FQciy64c0GRIwsrrskLUQFYOryOEURf3hYPEpo/qv05J4RS16FxQtEOJEFJNGaBTvDl8pi35dKSefVHBbE4aG1IgCu1SMdCACAE9VkXW0x5TPbJ2cFSzVS2QgG3PjcRRMLis2iRhZWzHmT58cQdgowSvSnZcXpgHZX5Hb6l+4T8loFlMmwoQ2kJDEFGfHQUMUnN2pRqIP4AiePOS0eWjvyvBV3akOA21r0irBPFcpZxao+lzrYtf8voWwriwLOQWWxUSjSNh6+ohxEbfjz80lNMfnBVvvzVU4/ZFfssjGqxVOyPI+ue70JEey49mtp6Y6cjfd466Qy0gnDacrutNJWq3HM6EnE1ALK44P6eFle07c4ZCr96Ij9ibQBRYeVXfJWdovocIfFsTh4XihL0Mlt2U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTFIYzhiL2o4djd2ZXpMakZFVE5rQXpBekxuZzB2S3AwUFQ0aDZHMHZsVUJK?=
 =?utf-8?B?c1Q0bncyWXJabWx3a21RL3E4NTNza0hXOXVPRWptQ1ZDbXVPeG9wZXN2Q29z?=
 =?utf-8?B?N2tXL29XQzZsS29uTDhGemxIZ1ZtcUVYS3V1Wjg3cTdFWEZRWHRiTjV2Tito?=
 =?utf-8?B?QkkxYjlab1hkSGJsTU1TN0ZPd3VqZWJ1dG9lN2YyMHFML3VMbVV4ZDdnd1ky?=
 =?utf-8?B?bjdDeU1SbjduQ3RTYzlrcDc2OFQyYmN6NzJFTkpFak4wZ0lIYkxwTkl0d05T?=
 =?utf-8?B?SHc2eDViRkg3bFNVVThyRHc3VFFZN0VqM3V0VUtoQy9IN0ZNQ09BZjI4WW40?=
 =?utf-8?B?UmMwNlZ0Rk03V0E2UmlFenZzSVVKTHZ2RytsZHVJT3o2NURBeVNENEU3c0V6?=
 =?utf-8?B?THU4VTlVYnljR3lRL0pvT2ozVzAwZWtSQUJkVXFPdit3RlhQTXpxcVBzb0hG?=
 =?utf-8?B?Vzd5ZVh5TG5hd3FHSkJjemN5czlYZGhCdDRUeHpoclNsNHJvcnovQU83Wmo3?=
 =?utf-8?B?aUJZZ1paWlpwaW93Mm1aUi9la3l4T2xkQlBodzJsK2REVFJRVUd0bUp1cTds?=
 =?utf-8?B?OWk3R3pXSUFmZkR5Y0pkcXlnMkQ0bS9vNUVBOWlsZ3MwbHdHKzBLRDNCbnYz?=
 =?utf-8?B?REl6dEJ1MFVIdDZZc0RqV0FWNFBMOTcvNlE4eFA4ejJ5S3N2WEJhOEd3MmZ5?=
 =?utf-8?B?OVc1ZERBc2Zpa1RucCsxcGJGc0R1c1JHRHkzRDJBTCtyMU1rNDRvWVY4QTBN?=
 =?utf-8?B?dmRPSVcwWjRpSkNiOUFxQkRRZzdHZzdmWHc1NGQ2aVNlQlJUbFFZY0NURXQ0?=
 =?utf-8?B?VVpTYVdWNEFCNmJmbGdTaFdrTGpBZWo3Yk12OGx1MFZJOXcyTFVwcWZWTzlC?=
 =?utf-8?B?OVArSkR6Q3ZMclgyZDFic3hzNytMYmVkRm1BU2R6MDRzQ0JsalczRlRpUEdw?=
 =?utf-8?B?T1FLZFE1WHlUbEFjU0daQXpWUGVTYkQrc3lIaWxZblBpWW0rNFBSUVZZdFFU?=
 =?utf-8?B?cSsyaGNFcmRNZ3Z4S2Zzc1FUdERtbW9IQkcybFQ3c2tGRWw1bk1BYVQ2eFJm?=
 =?utf-8?B?dGlBZC9kKzZyRnkzakVlbFhYekFKdS8wOERybGdsK0lCbHI1VmFleTEvSG9Y?=
 =?utf-8?B?TnhRZWxRNVU4WXlrM1lEeXhzQnNyS2Rubk00TDJ6ZDh5NzZZQkxRYldwQnlj?=
 =?utf-8?B?S2JBbkNVR0hxdmt0N1JDQzVVUHV2amZsbVhBS3EwcVZYOFRiaVg3SUJXdU5l?=
 =?utf-8?B?L0tuRlBvRm1YRjk2NlhtcEMwTFErYlUyWktheHlTZDlVelRUMmxWajZ0TVIr?=
 =?utf-8?B?ZXB0VmVCV0pPRkRXOFl2Y210Vit0aEZFNTNmcnE1VWlhZzVmR2JSa2Z0UURa?=
 =?utf-8?B?aVFLZEw4cnRWbFVldm9teFY4dDRtRlhjK011alBZUE83WVAxMDcrbEwvM0FY?=
 =?utf-8?B?K3RJMy85a1VmNUJhb3RUbjRVWmpUN3E0YWhjVlRvN3dzenZDMmU3YnVwYldQ?=
 =?utf-8?B?VFJLa3hvRG5SRGVib29YbFhpM00zeHFZcEtOWU1CZkltVUQyd0Y0TlFMMXJq?=
 =?utf-8?B?VnhralN0MFJNVFg3NDNuc0J5NnFnb1hIakdMdUdNcHp6SmFuanQvNXNaby80?=
 =?utf-8?B?RGJNZjRiZFdDNlZraDJMVzlWRDhieVVOVnRlVGFsVkxtMnh4Y0JmT1dXNmdy?=
 =?utf-8?B?YzZZZ0NPZDMxNGJNOW45ZjVTVm91VjNWMlF3NEsyQVZ5enJwY05xdGdwUC9N?=
 =?utf-8?B?UE43MDQ5OWhwUFlZb0IyWWxIOWRRekZ0LzRCM3JWd1hIRktCaFVGUXFBVTVI?=
 =?utf-8?B?ZzFGaFhiOW5XYlgxRHpScC9GZkw2aDAzZklBZk9RSEMwNFd5TG5LWlVoSmx5?=
 =?utf-8?B?WmNFSTljZlFJb1dKeWRkVGZzRjBITW1VYmJXelhuTVhWMlhLMWpnUTV2UkhG?=
 =?utf-8?B?Rlcrd1BMNVVmaU9kZVN2Qmx2SVRYd0lPZWNCSnQvMnZHYlFNZTBQUncxTFVw?=
 =?utf-8?B?WHlFZjIzcXpCeUFvUWNtVi9WNW9id0thNldibHJ0Ymdnd1gxYWRUbUNhRjZJ?=
 =?utf-8?B?SVM2cm9ITGgxYnJDTFJMenJCbnFoNkpETUpBWHRtZzFpRUpHRkhJOXpNdkxI?=
 =?utf-8?B?akZvVE44V1NBbmtCdzk5eXFkOW5adzdkcGUyL3E5NTY5QkxJdzRxOTRUcW5a?=
 =?utf-8?B?OFo2YnF5Q0o4Q2xVWnRaRmd0UkY1RUNHcVNmYmhacWNidllIRzR4QkRkMysv?=
 =?utf-8?B?OFMrRXRkb3d5dzVtNURxcWNhZEtWTXFJdGFvTFM4aDRpTVUvdHlpSmxZbTIv?=
 =?utf-8?B?cHhwbFdYczFKNW9aQktTbWw2dGtib3E2dlBnSFVXZ3dDcklDSTY3QT09?=
X-Exchange-RoutingPolicyChecked: GHC+FxO2mryDrnKbG6xDPHiTq+ZKq5SMIV1mwIkUY4J+J2k762QnXqnE1bRu8hAhjjsMWimnOtpsqA615eMgc/rhNcKaCRUYEstNLzfc2lLN871HLfNbnJK4vp7gVrqlsfRnI0EIrxbJ3uxJa0vdVL37EgR9cwRWTOtrO1Fbyh5iODHTPER2/tRaVZJYuVp4Xzs3RtGsaU/mVmllKo87keP5JCKBB2IPiPrwmjVkvK3OguPHLgP/kTOGMmBrbYIC5Tm3rS6Qq1brBftCPVIrTX1sM382VQ9xvb1Lh4OSnihdlxR0yl88A9t1DbeDhHcVURcKWv1npvDJgTtiq7tIWA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c487830-7416-4063-c232-08def853bdc7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 09:26:08.4644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bGsaupzR39tsXWaLVir36npXVGqZMfUtTSoeLMIYs/16ulbAe8f/8oiISg689xorq5fo2+AtorDbXDVwfY+tXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8463
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


On 12-08-2026 14:25, Michal Wajdeczko wrote:
>
> On 8/12/2026 8:55 AM, Tauro, Riana wrote:
>> On 04-08-2026 11:35, Mallesh, Koujalagi wrote:
>>> On 30-07-2026 08:51 pm, Michal Wajdeczko wrote:
>>>> Update our super macro with new top level hardware components.
>>>>
>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> LGTM,
>>> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>>> ---
>>>> v2: follow enum xe_ras_component values (Aravind)
>>>> ---
>>>>    drivers/gpu/drm/xe/abi/xe_log_abi.h | 12 ++++++++++++
>>>>    1 file changed, 12 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h b/drivers/gpu/drm/xe/abi/xe_log_abi.h
>>>> index 4861a5b58c10..b3373d4b29d5 100644
>>>> --- a/drivers/gpu/drm/xe/abi/xe_log_abi.h
>>>> +++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
>>>> @@ -129,6 +129,10 @@ enum xe_log_location_bits {
>>>>     *     @SIGID is the default xe_sigid for the component (without the XE_SIGID_ prefix)
>>>>     */
>>>>    #define DEFINE_XE_LOG_COMPONENTS(define) \
>>>> +    DEFINE_XE_LOG_SOFTWARE_COMPONENTS(define) \
>>>> +    DEFINE_XE_LOG_HARDWARE_COMPONENTS(define)
>>>> +
>>>> +#define DEFINE_XE_LOG_SOFTWARE_COMPONENTS(define) \
>>>>        /* */                                    \
>>>>        define(SYSTEM, 1, PCI, SW, "Linux PCI Subsystem")            \
>>>>        define(SYSTEM, 2, DRM, SW, "DRM")                    \
>>>> @@ -156,6 +160,14 @@ enum xe_log_location_bits {
>>>>        define(DRIVER_FIRMWARE, 3, GSC, RUNTIME_FW, "GSC")            \
>>>>        define(DRIVER_FIRMWARE, 16, PCODE, DEVICE_FW, "PCode")            \
>>>>        define(DRIVER_FIRMWARE, 17, SYSCTRL, DEVICE_FW, "System Controller")    \
>>>> +
>>>> +#define DEFINE_XE_LOG_HARDWARE_COMPONENTS(define) \
>>>> +    define(HARDWARE, 1, DEVMEM, DEVICE_MEMORY, "Device Memory")        \
>> DEVICE_MEMORY
> do you mean s/DEVMEM/DEVICE_MEMORY ?
>
>>>> +    define(HARDWARE, 2, HWCORE, CORE_COMPUTE, "Core Compute")        \
>> Core_compute
> and here s/HWCORE/CORE_COMPUTE ?

yes. We have the same names in uapi for netlink and same names are used 
in firmware and L0.
Adding different naming will unnecessary cause confusion.

>
>>>> +    /*     HARDWARE, 3, RESERVED */                        \
>>>> +    define(HARDWARE, 4, PCIE, PCIE, "PCIe Interface")            \
>>>> +    define(HARDWARE, 5, FABRIC, FABRIC, "Fabric")                \
>>>> +    define(HARDWARE, 6, SOC, SOC_INTERNAL, "SoC Internal")            \
>> SOC_INTERNAL
> and here s/SOC/SOC_INTERNAL ?
>
> (btw, is there a plan for SOC_EXTERNAL ?
> if no, why do we want to keep _INTERNAL suffix ?
>> Let's retain the names same as UAPI to avoid unnecessary confusion while collecting CPER logs.
> but those listed here are our local component names
> and just today there is 1:1 relation between those
> HW components and HW SIGIDs, but maybe one day there
> will be more components that would map into existing
> SIGIDs (compare COMP_GUC/HUC --> SIGID_RUNTIME_FW)

For hardware errors, any other error would be part of existing class or 
a new class added.
We don't expect the names to change as it is already part of UAPI for 
netlink and
used by userspace.

>
> the SIGID enum names are intact
> 	XE_SIGID_DEVICE_MEMORY
> 	XE_SIGID_SOC_INTERNAL
> 	..
> and btw I'm not sure that we ever convert SIGID enum values
> (202, 205) into any user facing friendly names
>
> and the idea for having a shorter component names was that
> we are doing dmesg decoration and print friendly component
> and/or location name (except SIGID, which is a raw integer)
>
> 	[drm] ERROR SIGID=104 (-EPROTO) Tile0: GT0: GUC: blah
> 	[drm] ERROR SIGID=202 (123456789012) Tile0: DEVMEM: blah
> 	[drm] ERROR SIGID=205 (123456789012) Tile1: SOC: blah

Okay for software errors. But for hardware errors it would be good to 
have consistency


Thanks
Riana

>
> having those lengthy names does not look nice:
>
> 	[drm] ERROR SIGID=202 (123456789012) Tile0: DEVICE_MEMORY: blah
> 	[drm] ERROR SIGID=205 (123456789012) Tile1: SOC_INTERNAL: blah
>
> besides, in dmesg only "SIGID=%u" chunk is part of our contract
>
> in CPER, all SIGID and component and location will be stored
> as plain numbers and how those numbers will be decoded is beyond us
>
> btw, maybe component decoration should be before location?
>
> 	[drm] ERROR SIGID=104 (-EPROTO) GUC: Tile0: GT0: blah
> 	[drm] ERROR SIGID=202 (123456789012) DEVICE_MEMORY: Tile1: blah
> 	[drm] ERROR SIGID=205 (123456789012) SOC_INTERNAL: Tile1: blah
>
> (see patch 4/23)
>
>> These names were asked to be retained similar to actual hardware error classification even for uapi.
>>
>> ++@Aravind
>>
>> Thanks
>> Riana
>>
>>
>>>>        /* eod */
>>>>      /**
