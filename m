Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0B8C55174
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 17:23:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5075210EF65;
	Wed,  5 Aug 2026 17:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UT6zHKfF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E424510EF65
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Aug 2026 17:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785950625; x=1817486625;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NHc6IHu9EwVDuhbMc1NcpoH1I6EJcnAas+3WUHfTr90=;
 b=UT6zHKfFG/ynVUxIvLWpSEjCQmn+1i14kYP6Xv0cyWETmuCMjJvLZ6E8
 h3FdJMZbri47QhKsey4LB+d8RhzaJFlAw+MvN+Ef6UFOsqE4t5o7xJ7+3
 uJiW2TMMAEaSilK2ItpQRGSQ3JoQYqfzQiKeD+wLoejGTsj0mF01pSJZM
 RI+fQsy8HkteAfkcTNyzZdcpI68FJA8HdVmP2cuk2XyXGc1H+pmszBkT2
 Nb4mbTX8UnC9KVqh/zOD9A3Tc1fU/MreBXCRfRufyCAI1S1ePSbse5CHg
 Mk2Gs4GhS+RP5uJL6jU76n8P+IZ6cg9H3lXYP7AIuZtN/qmRHimNOdJoj Q==;
X-CSE-ConnectionGUID: HaD8MOoJQxCZz67Ija6qlw==
X-CSE-MsgGUID: kJAVVtUYQiaerZNzwRv5xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="97181362"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="97181362"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 10:23:44 -0700
X-CSE-ConnectionGUID: jL9zs3YtTnSDq4VeIapr9g==
X-CSE-MsgGUID: MqoJithtSiCAwP8xOz7xxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="259238425"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 10:23:21 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 10:23:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 5 Aug 2026 10:23:20 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 10:23:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SXPCiObr/TY29l9GapfL/4Igu632RYK1t96Ghm1oWfw3HYm+3sQvFqnlUuwKlbq8IvAkHPtZWjzgX9OSyN4Ds2bfFDJzVzD9ez8Cb3Par3vV7s5p2K28mPSh4wHDkc7FGB23SiXQxM60BnllKKM14vUWwPWp0sS84jOBxMLzyFqmxI+7HYTFPzm9OICZVuXNUcMaY1pJlVKT9eMHXJhIJXhmv5sFp2GBJjKfCr9eY/4ZSzPCcdKe2GOI00dK3Qh/ik25UD/HhwWC621cdZ2btephAplAobOwGQ26UExDC3DIlofrTT3fSBy/60B182/97jrtJlKSihscEU6r7gZTew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8wreqvdxxPR6oXglYqpGjCD23zFqKpvkQN0SlLNcep8=;
 b=YrhqHnQskyyDWh/lhxDuJdJLDLmPDVOCrto0ACdTuQyrofbH/835Rzdg6hqPNyk8WTwwyMro0I0AwJuJvMQ7gJl1rUJhOSEJdkFiOGxjWIRrdkYHdkGY7boe5BuaYhJAydTiedSDnt4YCruGjPn06GdTNJfLC54eBq7FB2KN7zqss7Fbo0qHQ//2T1I+2Ff4Idw/P29Nba3EgHmLLJA3440sCJAbt8Qi9oIdtTPeooHB1AKEOkFZaQqQZ6DuOApN0ng493uKlH+ait6qutWfW+805OFhjhwAJWFnMd+h4qCsbaZ2aN83rxC1hoT5L1LccAI3J+ES8DTGecEpzOO6FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by BL3PR11MB6315.namprd11.prod.outlook.com (2603:10b6:208:3b2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 17:23:14 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 17:23:13 +0000
Message-ID: <7767b6c1-9695-4d1b-a492-e4fd1be3f410@intel.com>
Date: Wed, 5 Aug 2026 19:23:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/23] drm/xe/log: Add structured SIGID error logging
 infrastructure
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>, Yoni Levitt <yoni.levitt@intel.com>, "Raag
 Jadav" <raag.jadav@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-3-michal.wajdeczko@intel.com>
 <ef2906e3-1070-4de3-9de0-ed651fc7cc82@intel.com> <anI08vDXBbEIL94j@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <anI08vDXBbEIL94j@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1PEPF00005B7A.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::616) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|BL3PR11MB6315:EE_
X-MS-Office365-Filtering-Correlation-Id: 37ceffc4-97fd-42f0-f206-08def3163aaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|6133799003|3023799007|22082099003|18002099003|5023799004|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: NwoFxezUajXvJILgjuHJ1haFYnbRgZW4Mgidh1yMy40rehuC5gOzAvtFqBnFJilBMdwQhhS/7GKcQREsNtXapVWvITCulZ+Rzkxg9PGgQ1XC2ZAjwljLvRgBWkQmEAha+iM0rgN4S4yzeSxG8WFVh/Z8s/Noq7yg9T+Z9utCfLGLjjxn2GFIayYzba606sP/eaG6wcTKOq6nmKTu5YWnjQx+wc8lJ/Z+Om0RXEMotXqRxTVYDP1EfUg5SwIrcuRshdDFlXvb4oFpGn0c92ipaKi/8C3r74qQgpeX02EzCCrf+OeoSaDRCAP5coh44guFFw3XvQYjCm+UqBEr8X/FogKEr4pCOuxmgY+JDw6M1Sg3NCHcLBMUzttuGnVwL809FB2jMvJulYLY9kp5c4FVGivWHLIxJF4y5fXtEAW5eIxYlaB6KBOBM8AidbT1H4Q2kP+2vYATil1PR2+j3O9NNp0koA6Ov0R/CjAy7u8BN91YfkNMl9NdUL+GOlJNkDbJydVAUuHw4wivGhjgaDzhDVxIe6akpmm4/+ka9z2aOwi9W2cdnJNQZnLhh8PiTVa3dl7+cpHTswhD4yk7uBv9EoiGjxArROCy20/CsE8H8lLfkqq/PBp/mm5yo6yYU/O9Hcg9ji6sOeZndtYARnRY4tzotarSZUIVTs1s1n1s8CI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(6133799003)(3023799007)(22082099003)(18002099003)(5023799004)(56012099006)(11063799006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkRQTWU3U25PUXY1THZ2M3VyNUpJeDZSanlrNTZWa3ByNkJpYUNiVFNnMFJ3?=
 =?utf-8?B?Wk5UUVUxTWlqQmxkcC9DZzNQYkhKMzJQNldkcjhvYnN5Ky9zeG82eTlWbE1p?=
 =?utf-8?B?bGoySGZRb3I4blNwSk8rNVBuTjB1b1V3Y2V1K1FpbUFHejVTLzN6cm5MLzNs?=
 =?utf-8?B?d3JUZTAzc0N2UEphODdDVFp4aGF5RWowK1dmVEExQ21JREVtTTNmNDAra0o0?=
 =?utf-8?B?Vlc2NWJ6Ulk3YUpzS1dJbkxUbkxRUlBvYXhjK3I2YnZlaFFyTk9IR0M0TVM2?=
 =?utf-8?B?ZXpFSHNMM0M4WFF5UFI5WjlrdUxTdWZwYWlNZ0NEQy9YUUo5YlNwNnhyS3V2?=
 =?utf-8?B?Q3ZFTGtLYUU1cXFseEVINm1GVCtCNzVpeGNNUDhtMHpYNkVpSUpJakE3TEE2?=
 =?utf-8?B?c3E3NHdaWmxsSEJNNUswQkFiWVJwWGlCalNlOFZLWlFpNzB2bEVOZVEvMTJt?=
 =?utf-8?B?Mmkxb0lPaWNlSlY5K0dDTlZHMms1RW4rSUpxTWhiMk1tcmpsWEZNaXAwaDFZ?=
 =?utf-8?B?b1B2YkFEWVZ2VVc3WHg4eGpJZ0pLWFVKRXZiRjRYUmZBOTdyelp1N3cySFpk?=
 =?utf-8?B?Q29GbVdBSytJMnJRdHlxNkNqWFY3TjRJbk9TaDJwTTJNbXZZM2wxNUxwRlBR?=
 =?utf-8?B?c0FBNWFzcVRrdzR6dWQvZ0phemsrMHRrM3JHSmlMUS80Y3JWREx5b0t6TTlI?=
 =?utf-8?B?cGYvczZKc3EwZTZYUkdkWEl3QVdTeHI2K0ZtSWZ5bUpUaFhpblFWbVdwY3lz?=
 =?utf-8?B?QXRHRGgwQ01iR3czdkt1M3oyV0J6OFZCSlF0a3NsN0VUZk1BUkkzNUJQQ0Ur?=
 =?utf-8?B?ZzV5ZU1MS2RLbmdSWHJOaUJXYzZvRVFwaW51TGlTa0QxbWZnbTVaL0QvbUFR?=
 =?utf-8?B?SWRjSDVyKzJ6dFhsaTBJSE13L1dJS1g0dzA4Z2dQWnZnK1A5anQvK1hFQkVu?=
 =?utf-8?B?anVCNDJ1WG0rTmpBQ0dwU2lVM2U0ZFR3bXJjY0E2aXN3cHNxK2VuRS9DaVAy?=
 =?utf-8?B?U0U2aURkemlnVGRRQmtzaTFYK1Q5YitzZHdWR2F1RW81L3VPRFFXcmMvQkox?=
 =?utf-8?B?a3JpRlhGeEJRZFFSWGRRVTJTbElxaDJFYXFDVmtvY0ZYQ1Y1Ry91c080RlRo?=
 =?utf-8?B?MXIycFl3dWsweWtqSUtUdzFkR2FLc3hvRm5MUXA1ajRNT2x3NVh2dU94VnFw?=
 =?utf-8?B?K2hQZjNTekRwQmI4T20zY0Y0STJpWldYSEJSSW52Sys2dXJTbUo2aFczL1o5?=
 =?utf-8?B?WWZ5Nnh2T0gwSnJVQ3RjUlJUM0NKWGMzd1lwSDB5YVA0bGJ6VGNHRDlPNnJz?=
 =?utf-8?B?bTljSmx6REhuU2dCbHExS3EybDh0ckYyYkQ1bWw2ZGR6RklMaVhjQnFwRml0?=
 =?utf-8?B?NGpjMXBkbXE1UUE1MHdHSFJzZW9ocFZqSTd6bHNJZlpIZlhlN0kwYmlzWW4z?=
 =?utf-8?B?UjN4ZlZ2QmZNVkVObDQ4UStHUHBaUWVHZ0RqTjB5eWVPTWl2SFE2R1JzUFVH?=
 =?utf-8?B?YWMxMFo4NmZTc1d4dWQyR2d5c3UzQ0IxS1BNbVpCcmkrWHZ0NE5qUHJOYWh5?=
 =?utf-8?B?dHJmZ05SM29vdmFHelBRcTMyN3lFLzVrT05vbitRaGV4aXoyQm9ZeU1LY3dn?=
 =?utf-8?B?TG9iQVFYS2tMdGpyR1BySXI2bzUza29kZHRhbHZnSUNYZEkwcWJIOUUzaGZU?=
 =?utf-8?B?d0R1ZkltR0I1YmkyWHRTK1doZlB4dXV5dHNYdng1Nk9iVW03bldrS2luQjBZ?=
 =?utf-8?B?cWwzV0VZZEE0UkpGSi9rQjMzZE9aNzUraC9ydDJWT2lBRUtRcGhmOVhWaSsx?=
 =?utf-8?B?VWphT3A0MlhwYldxaE5kdUVkWkpkWDVjcm0zNk0zQ3V6TmZMZEZNV0FWbXQy?=
 =?utf-8?B?YkdlbkovSC9NVDg3clVadlJwUlpMNEFrNUY4K1ZjYVloY2NuN0NXUVBtMXQ5?=
 =?utf-8?B?S21KMjJoOEx5SlBDZGtRWUNkZTRVbmVHTXExRWtQZ3U5TzN5VEdHeFFWMkQr?=
 =?utf-8?B?dXVvZHJub1oyN0xGdzZKKzVIRFVOOS9qRTJGQTVramVYZ0I3N2syTGwvYUFj?=
 =?utf-8?B?NEF5RGRwNWpkTGJLNVpOYU84T3QwV2pUVVY3SnVIekM5V3ExaVNUZE9qQ01k?=
 =?utf-8?B?WkFuN3VrWU83cFlZQXgyK292MXh2VFFrR1RYQVAwaWNudE5nR2RLaDRyditY?=
 =?utf-8?B?WDUzYmVwNXVuWjh6bE9DY2JmRzlwdmZWWkJOTUxNNUJSc3dmWVEyNUFHOXkw?=
 =?utf-8?B?QXFxQlVsVlVJaFI4L3ljNmd6SXBjVmJyMHVMQ2hvZHZuWDhSZ1FadmZOckRm?=
 =?utf-8?B?ZEV2Zy9aNEU2SmV0YUJNcVNPU05nblZNM1pGQTZBNmRoM0d6M3cyUnlvcGJk?=
 =?utf-8?Q?mp2SkqnU1CMWgfNA=3D?=
X-Exchange-RoutingPolicyChecked: Hnx3xEi44F0QSraAzHd2w29elg27oYe1oEzvU0n6b3XeGv8tHZAe9kw0t2PwKihtNXcVzXh/gcUPMtAf+L/nM8SyffJOiW29Uy8oScm7+Lmufd4pHmVcw1j3RG0MtDyLuq/OOy1w3CZAr6r6VqWNwZzwE/TMqBSZ++iPHz95A5fQ18oMybCKgth1p1cgBQE6upx+I8ivF6Mn5peFteb7QMwCTlWPa2X1JKmDChb+Vqa2u76MTUH5YoLJHibY/Q6UtH3OPcnLD1vKoXJ42BDRInNQFxmey2Z1vzl4gW7zy43J6uV4D/VmmPl8QS82NhC2/6HZFUuzN0XbF5O4NMPAAQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 37ceffc4-97fd-42f0-f206-08def3163aaa
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 17:23:13.6133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6trWoN5tPEktG9uiH/lIqlcdviTdpqAr8XyJQv1WtP1Ozmwx1hnlXe0rbKbFUk2qDpjYLYrtoQBq+G1fgUtzcCn+G9kvaNhLKgK9bY+ieX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6315
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



On 8/4/2026 8:52 PM, Rodrigo Vivi wrote:
> On Tue, Aug 04, 2026 at 08:30:47PM +0530, Tauro, Riana wrote:
>> Hi Mallesh/Michal
>>
>> On 30-07-2026 20:50, Michal Wajdeczko wrote:
>>> From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>
>>> Today the driver reports faults with ad-hoc drm_err()/xe_gt_err()
>>> strings that have no stable shape. That is readable for a human, but it
>>> gives fleet tooling nothing durable to match on: the wording changes
>>> between releases, lines can be rate-limited or dropped under an error
>>> storm, and there is no consistent way to ask "which recognised fault
>>> just happened?".
>>>
>>> Introduce a signature identifier (SIGID): a small, stable integer that
>>> names one recognised Xe fault situation and serves as the primary handle
>>> for triage. A SIGID maps, through published end-user documentation, to a
>>> description and a recommended action; the driver only has to emit the
>>> right SIGID next to the usual human-readable text.
>>>
>>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>> Assisted-by: Copilot:Opus-4.8
>>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Co-developed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> ---
>>> Cc: Yoni Levitt <yoni.levitt@intel.com>
>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>> Cc: Raag Jadav <raag.jadav@intel.com>
>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>> v2: CORRECTED is still an error (Michal)
>>>      prepare to decorate dmesg with comp/loc (Michal)
>>> ---
>>>   Documentation/gpu/xe/index.rst        |   1 +
>>>   Documentation/gpu/xe/xe_sigid.rst     |  14 ++
>>>   drivers/gpu/drm/xe/Makefile           |   1 +
>>>   drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 183 ++++++++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_log.c           | 135 +++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_log.h           |  20 +++
>>>   6 files changed, 354 insertions(+)
>>>   create mode 100644 Documentation/gpu/xe/xe_sigid.rst
>>>   create mode 100644 drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>>>   create mode 100644 drivers/gpu/drm/xe/xe_log.c
>>>   create mode 100644 drivers/gpu/drm/xe/xe_log.h
>>>
>>> diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
>>> index 665c0e93601c..0247a255f7e6 100644
>>> --- a/Documentation/gpu/xe/index.rst
>>> +++ b/Documentation/gpu/xe/index.rst
>>> @@ -35,3 +35,4 @@ The display, or :ref:`drm-kms`, support for drm/xe is provided by
>>>      xe-drm-usage-stats.rst
>>>      xe_configfs
>>>      xe_gt_stats
>>> +   xe_sigid
>>> diff --git a/Documentation/gpu/xe/xe_sigid.rst b/Documentation/gpu/xe/xe_sigid.rst
>>> new file mode 100644
>>> index 000000000000..45d84a62f185
>>> --- /dev/null
>>> +++ b/Documentation/gpu/xe/xe_sigid.rst
>>> @@ -0,0 +1,14 @@
>>> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>>> +
>>> +========
>>> +Xe SIGID
>>> +========
>>> +
>>> +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>>> +   :doc: Xe Error Signatures (SIGID)
>>> +
>>> +Signature Identifiers
>>> +=====================
>>> +
>>> +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>>> +   :internal:
>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>> index 67ada1d6c2fb..7ac3954737f9 100644
>>> --- a/drivers/gpu/drm/xe/Makefile
>>> +++ b/drivers/gpu/drm/xe/Makefile
>>> @@ -87,6 +87,7 @@ xe-y += xe_bb.o \
>>>   	xe_hw_fence.o \
>>>   	xe_irq.o \
>>>   	xe_late_bind_fw.o \
>>> +	xe_log.o \
>>>   	xe_lrc.o \
>>>   	xe_mem_pool.o \
>>>   	xe_migrate.o \
>>> diff --git a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>>> new file mode 100644
>>> index 000000000000..99717fdf74a6
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>>> @@ -0,0 +1,183 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2026 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _ABI_XE_SIGID_ABI_H_
>>> +#define _ABI_XE_SIGID_ABI_H_
>>> +
>>> +/**
>>> + * DOC: Xe Error Signatures (SIGID)
>>> + *
>>> + * What SIGID stands for
>>> + * ---------------------
>>> + *
>>> + * SIGID is short for *Signature Identifier*. A SIGID is a small, stable integer
>>> + * that names one *recognised Xe fault situation* -- nothing more. It is the
>>> + * primary handle used for triage: a SIGID maps to a human description and a
>> The SIG ID maps to a report site as mentioned in "How to pick a sigid" not a
>> human description.
> 
> Indeed, perhaps with simple:
> s/maps to a human description/maps to a report site/
> 
> we get some consistency?! 
>>
>>> + * recommended first action. A coarse first-order action is documented in-tree
>>> + * per SIGID (see "First-order action" below) so the id is actionable on its
>>> + * own; published end-user documentation refines it with finer, cross-product
>>> + * detail. The driver's only job is to emit the right SIGID next to the usual
>>> + * human-readable text.
>>> + *
>>> + * Why this exists
>>> + * ---------------
>>> + *
>>> + * Today the driver reports faults with ad-hoc ``drm_err()`` / ``xe_gt_err()``
>>> + * strings that have no stable shape. That is fine for a human reading dmesg,
>>> + * but it gives fleet tooling nothing durable to match on: the wording changes
>>> + * between releases, lines can be rate-limited or dropped under an error storm,
>>> + * and there is no consistent way to ask "which recognised fault just happened?"
>>> + * A SIGID answers exactly that one question, identically across driver and
>>> + * firmware versions, and (eventually) across other Intel devices in a node.
>>> + *
>>> + * What a SIGID is (and is not)
>>> + * ----------------------------
>>> + *
>>> + * A SIGID names *which situation* is being reported. It deliberately does not
>> This should also be consistent with "report site" instead of situation.
> 
> Agree.
> s/situation/report site/
> 
>>> + * encode the detailed reason or the outcome. Those are carried alongside it::
>>> + *
>>> + *   SIGID    -> which recognised situation is being reported
>>> + *   severity -> how serious this instance is (see below -- not fixed per SIGID)
>>> + *   errno    -> the failing operation's error, shown with %pe
>>> + *   message  -> free-form human-readable context
>>> + *
>>> + * Severity is independent of the SIGID. The same situation can be reported at
>>> + * different severities depending on the instance and the recovery taken, so a
>>> + * SIGID is never tied to one severity; the reporting site chooses it by calling
>>> + * the matching xe_log_*() helper (see xe_log.h).
>>> + *
>>
>> It'd be more intuitive for readers if section "When to use SIGID logging" is
>> moved before how to pick one.
> 
> It makes sense to me.
> 
>>> + * How to pick a SIGID (the uniqueness rule)
>>> + * -----------------------------------------
>>> + *
>>> + * Pick per *report site*, not per incident. Each site emits the single most
>>> + * specific recognised situation *for that site* -- so the question is never
>>> + * "classify this whole failure", it is "what does this site detect?", which has
>>> + * one answer. A single underlying failure therefore legitimately produces a
>>> + * *chain* of reports from different layers, each with its own SIGID -- e.g. a
>>> + * GuC communication failure is reported as %XE_SIGID_RUNTIME_FW by the firmware
>>> + * path, the failed recovery as %XE_SIGID_GT_TDR by the reset path, and an
>>> + * aborted bind as %XE_SIGID_PROBE by the probe path. That chain lets triage
>>> + * follow a fault from origin to final effect; it is not a duplicate.
>>> + *
>>> + * If a site does not match any defined situation, keep using the ordinary
>>> + * ``xe_err()`` / ``xe_gt_err()`` logging rather than forcing a SIGID: a wrong
>>> + * or over-broad classification is harder to retire than a missing one. When a
>>> + * new situation is genuinely worth triaging, add it to the list below.
>>> + *
>>> + * Scope: software-emitted signatures only
>>> + * ---------------------------------------
>>> + *
>>> + * This header enumerates only the situations that the *driver itself* detects
>>> + * and reports from software: probe abort, wedged, survivability, driver-
>>> + * detected firmware failures, engine TDR, memory faults and IO/bus faults.
>>> + * These are the only values the driver assigns.
>>> + *
>>> + * Signatures that *originate* in firmware or hardware are a different thing:
>>> + * they are produced and identified by the firmware or the hardware itself
>>> + * (e.g. via their own records or error counters), and the driver merely logs
>>> + * them as they are given to us. They are deliberately *not* enumerated here --
>>> + * minting a driver-side id for a firmware/hardware-reported error would only
>>> + * duplicate an identifier the reporting layer already owns. The two
>>> + * driver-detected firmware situations below (%XE_SIGID_RUNTIME_FW,
>>> + * %XE_SIGID_DEVICE_FW) are software signatures: they mark that *the driver*
>>> + * observed a firmware problem, not a signature reported by the firmware.
>>> + *
>>> + * Numbering
>>> + * ---------
>>
>> This section also needs to be on the top. It can be missed if it is at the
>> bottom of the document.
> 
> Also agree.
> 
>>
>>> + *
>>> + * SIGIDs are a single flat list numbered sequentially within the assigned range,
>>> + * in the order the situations were introduced. Values are stable: once assigned
>>> + * they are only ever appended, never renumbered or reused.
>>> + *
>>> + * A retired situation is deprecated in place, never re-purposed.
>>> + *
>>> + * First-order action (resolution buckets)
>>> + * ---------------------------------------
>>> + *
>>> + * So that a SIGID is actionable on its own, each one is tagged with a coarse
>>> + * *resolution bucket*: the first thing an operator should do on seeing it. The
>>> + * bucket is a stable, driver-owned hint; external documentation may refine it,
>>> + * but the in-tree value always stands on its own. Every new SIGID must pick a
>>> + * bucket, which forces the question "what should someone do about this?" to be
>>> + * answered up front. The buckets are::
>>> + *
>>> + *   COLLECT  -- capture logs and open a bug report
>>> + *   RETRY    -- transient or already recovered; watch for recurrence
>>> + *   UPDATE   -- a firmware update / flash is required
>>> + *   RECOVER  -- an explicit recovery step is needed (rebind, bus reset)
>>
>>
>> Do we actually need resolution buckets defined here? RECOVER or UPDATE seem
>> a bit vague since states like
>>  WEDGED/SURVIVABILITY have different ways to recover depending on context.
>> Wouldn't detailed resolution steps in another
>> document be better than in logs?
> 
> Fair enough. I would prefer we have some recommendation for a consistent
> end to end story without depending on external docs and all.
> However I do agree that the vagueness in some cases here can defeat the
> purpose and mostly the conflict with the wedge.
> 
> Aravind was already complaining about these buckets. So, perhaps let's just
> remove. But also for consistency we need to change the rest of the text above
> and below:
> 
> - drop "maps to … a recommended first action … 
> - Delete the whole First-order action (resolution buckets) sectio
> - Strip the [TAG] from all nine enum entries.
> - Drop the dmesg note "the bucket … is not printed on the dmesg line.
> 
> Michal, what are your thoughts?

here is updated DOC section, please check if I get it right

/**
 * DOC: Xe Error Signatures (SIGID)
 *
 * What SIGID stands for
 * ---------------------
 *
 * SIGID is short for *Signature Identifier*. It is a small, stable integer
 * that names one of *recognised fault site* -- nothing more. It is the
 * primary handle used for triage and maps directly to specific report site.
 *
 * Numbering
 * ---------
 *
 * SIGIDs are a single flat list numbered sequentially within the assigned range,
 * in the order the fault sites were introduced. Values are stable: once assigned
 * they are only ever appended, never renumbered or reused. A retired fault site
 * SIGID value is deprecated in place, never re-purposed.
 *
 * Why this exists
 * ---------------
 *
 * Today the driver reports faults with ad-hoc ``xe_err()`` / ``xe_gt_err()``
 * strings that have no stable shape. That is fine for a human reading dmesg,
 * but it gives fleet tooling nothing durable to match on: the wording changes
 * between releases, lines can be rate-limited or dropped under an error storm,
 * and there is no consistent way to ask "which recognised fault just happened?"
 *
 * A SIGID answers exactly that one question, identically across driver and
 * firmware versions, and (eventually) across other Intel devices in a node.
 *
 * What a SIGID is not
 * -------------------
 *
 * SIGID deliberately does not encode the detailed reason or the outcome. Those
 * are carried alongside it::
 *
 *   SIGID    -> which recognised fault site is being reported
 *   severity -> how serious this instance is
 *   errno    -> the failing operation's error, if available, shown with %pe
 *   message  -> free-form human-readable context
 *
 * Severity is independent of the SIGID. The same SIGID can be reported at
 * different severities depending on the instance and the recovery taken.
 *
 * When to use SIGID logging
 * -------------------------
 *
 * The xe_log_*() helpers are for these recognised fault sites only --
 * important, operator-relevant faults and events. The driver's only job is to
 * emit the right SIGID next to the usual human-readable text.

 * They are not a replacement for ``xe_info()`` / ``xe_dbg()`` / tracing, nor
 * for one-off diagnostics; using them for ordinary logging would dilute the
 * fault stream. Not every ``xe_err()`` needs to become a SIGID report -- only
 * those that correspond to a published fault sites.
 *
 * SIGID log output (dmesg vs. the machine record)
 * -----------------------------------------------
 *
 * The dmesg line stays close to a normal xe error message so it remains
 * readable for admins; the only stable, machine-matchable token on it is
 * ``SIGID=<n>`` (``dmesg | grep SIGID=``).
 *
 * The full dmesg line is not an ABI: the surrounding text may change freely,
 * and lines may be dropped. The durable record for tooling is the CPER record
 * carrying the same SIGID (generation is a planned follow-up).
 *
 * How to pick a SIGID (the uniqueness rule)
 * -----------------------------------------
 *
 * Pick per *report site*, not per incident. Each site emits the single most
 * specific recognised SIGID *for that site* -- so the question is never
 * "classify this whole failure", it is "what does this site detect?", which has
 * one answer. A single underlying failure therefore legitimately produces a
 * *chain* of reports from different layers, each with its own SIGID -- e.g. a
 * GuC communication failure is reported as %XE_SIGID_RUNTIME_FW by the firmware
 * path, the failed recovery as %XE_SIGID_GT_TDR by the reset path, and an
 * aborted bind as %XE_SIGID_PROBE by the probe path. That chain lets triage
 * follow a fault from origin to final effect; it is not a duplicate.
 *
 * If a site does not match any defined SIGID, keep using the ordinary
 * ``xe_err()`` / ``xe_gt_err()`` logging rather than forcing a SIGID: a wrong
 * or over-broad classification is harder to retire than a missing one. When a
 * new report site is genuinely worth triaging, add it to the list below.
 *
 * Scope: software vs hardware emitted signatures
 * ----------------------------------------------
 *
 * Some SIGID represents fault sites that the *driver itself* detects and
 * reports from the software POV: probe abort, wedged, survivability, driver-
 * detected firmware failures, engine TDR, memory faults and IO/bus faults.
 * These are the only values the driver assigns on its own.
 *
 * Signatures that *originate* in firmware or hardware are a different thing:
 * they are produced and identified by the firmware or the hardware itself
 * (e.g. via their own records or error counters), and the driver merely logs
 * them as they are given to us. They are deliberately enumerated separately.
 *
 * The two driver-detected firmware situations below (%XE_SIGID_RUNTIME_FW,
 * %XE_SIGID_DEVICE_FW) are software signatures: they mark that *the driver*
 * observed a firmware problem, not a signature reported by the firmware.
 */


> 
> Thanks,
> Rodrigo.
> 
>>
>>> + *   IGNORE   -- ignore if the SIGID severity is INFORMATIONAL
>>> + *
>>> + * The bucket is documentation only -- it is recorded per SIGID in the enum
>>> + * kernel-doc below and is not printed on the (deliberately lean) dmesg line.
>>> + *
>>> + * When to use SIGID logging
>>> + * -------------------------
>>> + *
>>> + * The xe_log_*() helpers are for these recognised fault situations only --
>>> + * important, operator-relevant faults and events. They are not a replacement
>>> + * for ``xe_info()`` / ``xe_dbg()`` / tracing, nor for one-off diagnostics;
>>> + * using them for ordinary logging would dilute the fault stream. Not every
>>> + * ``xe_err()`` needs to become a SIGID report -- only those that correspond to
>>> + * a published situation.
>>> + *
>>> + * dmesg vs. the machine record
>>> + * ----------------------------
>>> + *
>>> + * The dmesg line stays close to a normal xe error message so it remains
>>> + * readable for admins; the only stable, machine-matchable token on it is
>>> + * ``SIGID=<n>`` (``dmesg | grep SIGID=``). dmesg is not an ABI: the surrounding
>>> + * text may change freely, and lines may be dropped. The durable record for
>>> + * tooling is the CPER record carrying the same SIGID (generation is a planned
>>> + * follow-up).
>>> + */
>>> +
>>> +/*
>>> + * Top level Intel Error Signature Identifiers.
>>> + */
>>> +#define INTEL_SIGID_INVALID			0
>>> +#define INTEL_SIGID_GPU_START			100
>>
>> why does the sigid start from 100?

there was an offline agreement with Yoni to start GPU SIGIDs from 100
with the limit up to 999 for any future GPU SIGIDs we may want to have

>>
>>> +#define INTEL_SIGID_GPU_END			999
>>> +
>>> +#define INTEL_SIGID_GPU_XE_START		100
>>> +#define INTEL_SIGID_GPU_XE_END			299

and for the XE we should use range 100..299
>>> +
>>> +#define INTEL_SIGID_GPU_XE_SOFTWARE_START	100
>>> +#define INTEL_SIGID_GPU_XE_SOFTWARE_END		199

with the explicit split for SW/HW originated 'fault sites'

>>> +#define INTEL_SIGID_GPU_XE_HARDWARE_START	200
>>> +#define INTEL_SIGID_GPU_XE_HARDWARE_END		299
>>> +
>>> +/**
>>> + * enum xe_sigid - Stable Xe Error Signature Identifiers (SIGID).
>>> + * @XE_SIGID_SW: Software component failure. [COLLECT]
>>> + * @XE_SIGID_PROBE: Device probe/bind was aborted. [COLLECT]
>>> + * @XE_SIGID_WEDGED: Device was declared wedged and is no longer usable. [RECOVER]
>>> + * @XE_SIGID_SURVIVABILITY: Device entered survivability mode. [UPDATE]
>>> + * @XE_SIGID_RUNTIME_FW: Driver-detected runtime firmware failure, GuC/HuC/GSC. [RETRY]
>>> + * @XE_SIGID_DEVICE_FW: Driver-detected device firmware failure, PCODE/sysctrl. [RETRY]
>>
>> Pcode or sysctrl errors cannot be retried. Pcode init failures cause
>> survivability mode.
>> RAS sysctrl errors require a secondary bus reset. We could have other
>> firmwares in future with different
>> recovery.
>> That is why it would be better to drop resolution buckets in logs.
>>
>> @aravind thoughts?
>>
>> Thanks
>> Riana
>>
