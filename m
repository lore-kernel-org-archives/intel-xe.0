Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C422ACCD183
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 20:12:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA9010E509;
	Mon, 13 Oct 2025 20:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GWZnyPoo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C6810E509
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 20:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760386333; x=1791922333;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=q0i8faenGjBwRv78FYjaf93pD0dZfrvkY8w4+/iiXbI=;
 b=GWZnyPoojPhGTXAcQHtteiUjpLWoO/RgW1MMnSLT6i+jCGRZ9MCvPDoN
 8GLZUadzWkCgQLZlVeoWkR5FRHWTjAfBxt14l6PzWWTyVujTT0WwN3LD0
 /uUwatKdH9pOqEz5wv7CnbvlwBIaXGS3Y0of7ev/BNEKbdUveTTllBUrS
 L2lJgGfVwGXJmWvzIYkMYVnBNgIG6JbrHDs27GehuRNhmZ0geOe6dlVYQ
 L7Z2QhkgZQs+Qev300Eaxq+Me759xMoPhVV1gnRk1nRTpxD6Ozg/yf4V/
 F2r6E0pkk4T+CL7rGGVc9ggyn1haYzusJH41HEdTNN5Av3CY5s6px5tIc w==;
X-CSE-ConnectionGUID: VAKNis1cQyqQQ96lJzzNjQ==
X-CSE-MsgGUID: hxkQkCd6TvqanoCGTFTrdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="61745897"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="61745897"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:12:13 -0700
X-CSE-ConnectionGUID: kQy2SQxaSca7xjsZtGmrTA==
X-CSE-MsgGUID: QeiKi6SIQy2Z4pw1KE0SEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="181494646"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:12:12 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 13:12:11 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 13:12:11 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.69) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 13:12:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uhG5J0YkBWvxml7TIeXIuuJHk4yOuC2yhCOZ4KAZwSmjFwOQ/El48XPBwpw4K7tRIdEMrcbxFSMAePmgUHTsAMfcqpKqMmDye/CLBVedJz7q1oBaItgv2frEllkV/Z9A0ywIywekLXixHZgf0Q9ix46ckFxMxjIw4Y2gscDD0zP2hQY839pZ7e7wTrrxqRdWhh085ltFOD8s4p0Osv3w2VgbD25bO+MEdFFLgSpJcI+Ww9iHzPkzYqydjBvE+ihH64G2qtRe3u0k+woq6jHPzuj3YvYQQvIKYraxt8icFKSJuWN0HgX0OzP6ruSJvJjJ8l3XS0OtSh4M4qRVkRLg3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iJk0MC3EvF8BDr1MmzMViotFLI2khkLGpREH/8A2Vlg=;
 b=d+gr65lsfPvgXMVggnwHQvqp+bYd6huNpItCNp5u6w9tqHBAcZKfGo5ZQmG9ANeBM2VkaCsPo0CEgyvAtuYLlKxuqL/Hi/+JW4+qGYjSOxye8hDLHs17ADcLYTrnfLL889ggShMEdnsZb8P9xSP28Nj/X2Q667VB04FFuvcr7OjYSYLTChNr5PmBHnduMK+8pc0Illz3zPuKV81zlYSj+vwy+1NQ/ivOGgNehHu9KHt76BpJtgfZiM4HsDN9+kn2iomO1lYYX4R7a/ikEGArATkFe3yWnEOGbV+4uSl3Fhiy3qdJln1uVBjPDry/nm7Q3P5sZ5p0qK2Bf3eT4hW5Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by MW6PR11MB8338.namprd11.prod.outlook.com (2603:10b6:303:247::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Mon, 13 Oct
 2025 20:12:06 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 20:12:06 +0000
Message-ID: <258491f7-15a3-4ec0-960e-cd132abe5b84@intel.com>
Date: Tue, 14 Oct 2025 01:41:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Eliminate RPe caching for SLPC parameter
 handling
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <vinay.belgaumkar@intel.com>
References: <20251013064214.926115-2-sk.anirban@intel.com>
 <aO1bl1mk5CL7uP6i@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <aO1bl1mk5CL7uP6i@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0010.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::9) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|MW6PR11MB8338:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ad73062-7fc0-436c-3aad-08de0a94c81e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MCtwRjBXOEkvaUJQcFB2cTZrS094anl1Q3BqeWZQMzh6YnZZNzRvY2JHdHN5?=
 =?utf-8?B?ZFI0dUU3S0xpanh1NTJmMFdvdm02YmE0cXBVQlAxL1R5bEZodXU5cW5ZWDVC?=
 =?utf-8?B?My8yTGJDN21lQ3MyeWQrZ2tZOE1OUzA2Ukc0TkNMYzBsQytaeE1uNmR2TkEw?=
 =?utf-8?B?Wi9QcjZFZjB1NW1YcjMzeEtzQWcrTndzdW5YcDhtZVBWckpyR1daemRyT2NG?=
 =?utf-8?B?Vjlid1RkTER4cTFuQmlTUDNPbGJpTzRrMkFZQmJyR01VV3N3M3I1MHFaQlBl?=
 =?utf-8?B?dE5wQkZqS2I0M0V1dzFmVnl1MjJtTU5FQUNkaGx4WnFpaXU5WkkrQlMyeWM5?=
 =?utf-8?B?dkZ6TVNWU2lwYmFBNi9EVDBXUENZQ3BwWXJsL2RBZ3V3ZXNzWE1ZanJoSnRP?=
 =?utf-8?B?VTh3Rm84Q3dtUkZ3ekhCQ1N2aGl1aEV4eWx3YnJEa0pJUEFuQkRNY0daMXdE?=
 =?utf-8?B?a3lxNDNiWmZ5bkhkYTJ3TFArdGNYN0FwNUxFZWZqcWxmZGN4YkpSVGo4UUZv?=
 =?utf-8?B?Q0NYejZaWlU4R3FBbnJycXV4VXNkVDlOSW5OcU5objBSMXY2dlRvRWppb3pp?=
 =?utf-8?B?SXJHd3pHTm1FTHk2WkYwTW1UQ0FBVXZXcGF6M2c2aHlzQkx0YmFWL3J1Vi9M?=
 =?utf-8?B?MnF1MmFBQTN4NFRhYmRHOEJpSElPYnJmaExJSmcvWDZybktvdDJQWHRPWXpu?=
 =?utf-8?B?dyt6NHV2WU9kSW1ubWhMTVRQYlpReHdIS2xQTHNDdW5qVi9XUmRDZTMvaVFo?=
 =?utf-8?B?V3VzWWNMTVI1U0x3RWZ3N0hpZ1dtRHBidEQ2WHBpQ2oxMHRFbEhGRk5rYUQv?=
 =?utf-8?B?eUtDZzM0VlU2ZzdScFJGZDFzaFpJYjFXZHlyOWNEZUlZRHJjcXpmMGMyaW1s?=
 =?utf-8?B?VnVieGpNdVRPbUsxU1dMallBYk03eVkrOE9ldlFxU0JWbTlodi9vcXhJRUlV?=
 =?utf-8?B?QnlodjhzTGRscTZ4MFRVR21XMy9PV2c0clFHbTcxSFJxdTRtUnNZQWdIZWQ5?=
 =?utf-8?B?SG9CY1NiQmZJbmgxNTZUbERtUmdUUWs0V29zWEV5NklwM3dDN0Z5aTk3MEZ2?=
 =?utf-8?B?dFZGdHVMVVU3bVpsSjlYQy9tRzRLbTh5clYvenhUdjVvTWVXK1VoY0FKc0Ez?=
 =?utf-8?B?by9SSG5MTmpvMGFUTTI5Y2MrbkcvZ0JhNHczVm5kMkxQYUQ4Qjl4MzRtbTZY?=
 =?utf-8?B?d2YzTHFWdy9lVVg0QXc1OWlsOVc4bkFUc29CZE1PQnVyUHg4Z2xyRitpYnpE?=
 =?utf-8?B?S0VhRTczZFJHWGJyRWc3NXlOa1h2cTlrSkZsVGJ5Q2ErMmQvc2lZcjd3d0RY?=
 =?utf-8?B?a0cxeHJEYzRlcFZuSWFHb0VjUGozbkNZZEZVL29HUVdtbDRFL2J6dlRuSnhx?=
 =?utf-8?B?U1hDZlFNZ1JJTnVWa25DSGxueFhScmduODc3Y1dGL0szaUwwaUhybEROQVJq?=
 =?utf-8?B?a3pkOVJoRC9jZ0tnc0xIZUFqdWZ3OUg1Z2xIeWIveVViS0xiRVQ3ZFpCZzJ4?=
 =?utf-8?B?M2JvK3F1MU1GNjhFQit2SElUeGhlQm1JUXJaZURaQzFvL0l4dkFFZVIzTXBV?=
 =?utf-8?B?ZUxzR1NNTi92TlVBNy94VnFiaXVlNW5xNW83eXV6Z3NUU1FCSXRpaXEvTkM3?=
 =?utf-8?B?UlE0WGxsbjBDcVdZVW4zckZYZnVRSjE5VlMzaGE4QzN1UExVazk1elRmd2dI?=
 =?utf-8?B?N2ZuRHplS2NGSUxabjAzS1RxZjVHQ255Y3JwUVVJUDNodWI5ZE5SMzdScWVF?=
 =?utf-8?B?Vy8rM2ErWnZReThER0dCNmFPRXJ5eXBRYmhrYjBybWtrU3duVmp6bFYwcjF5?=
 =?utf-8?B?dUNldXA2cDdoU3NaajBuQW9qTUo3dG1YN0VPbHgvZlpWdEJTUExrQ2dlQ3gw?=
 =?utf-8?B?Q09LMTI0QXRhczBZMHNxczhRVTNnTEx3RkZGWXZXWi94N2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekZHaFlIeXZOTkp5TDhYRXQ1YVNrTWtaOEFwd2t2WUJQcGZBUXl0bnBHMzBt?=
 =?utf-8?B?alZ2N0NOalVEa2s2ZnlIMG52WFZISStpZHZPMHlNa2ZNZ1cvT2ZrdmJiaitx?=
 =?utf-8?B?aVFFc0xreEhaTjNIbzl4LzFiMGpnMlN3MGQzOFRGUVBpVmJ2UG0zaXNQRW5t?=
 =?utf-8?B?dVVBTCt5V3hWVmpvbkxKbjBrWStsaS96Zm9TaHVjUTdnRVJERFJ5WEF5UTJm?=
 =?utf-8?B?NG9pOHQxSXI4WlhETEdUQmdzSXpTSWIrS1JodnFqb1A0WGtaVE1oK09tOHhE?=
 =?utf-8?B?ckp2d1VaRU1mZnVHSDVIQjdJVytVcDZld3ZZMkdoOHdQRkZLV3FqQnJCNTA4?=
 =?utf-8?B?SEl2NURmaFB3d1dwSThRNldHSkhRN014aGFIdlY2aGc3WHhnbmNDdEx4bUFm?=
 =?utf-8?B?MHVJWG54YWs3SEI2aCtIZW5NRzVLaVAxUWdhYkxzbmV0Mm1mUENlcXZrL0or?=
 =?utf-8?B?dWhMbUZ5NlY2L2F6dU00ZlBUS3NCcGVZUE02c3BOblZ0QmovVnU3NUNLeUZF?=
 =?utf-8?B?ZEl4K2NNVUZUVU9NOXppRzJrQWZ6aDIvTGNaQWN3bi8rdGtKRHdZbHV0REJM?=
 =?utf-8?B?UFg5YWxXZ2RVQlpZQ044RTFIcDBSMnBlOXRFNEM4YWlTbXdWcWVNUkQwcmxH?=
 =?utf-8?B?TTVqTENjam1ya1ZmaU9manRRMmdBYVRZY2tYZmRXUzZWeXBQdmh2ZWhuN1Y4?=
 =?utf-8?B?UW1IdXV4M2hGZVlWaW5Mbk55VXpBckpxaUNsdEczN1F1UVZ2SnUvNGdZUWcx?=
 =?utf-8?B?ZG4razg5NklEdTBySWZYeVRTbkc5NFFtK1Z4T1pSVmNpUXRCK2xXN3ZVUjBn?=
 =?utf-8?B?cm04ZTZJSytZSm5ZY0wvcWtPcWdUVkkrM0U4T0VydjBmVVl1akNzaXVLUjBL?=
 =?utf-8?B?OGdieXFIQlYvTmtJM2gySDJYQythWVNWMjJHd0lRSFdFM2x4RE16RkdQczJE?=
 =?utf-8?B?aXY0eTBOb2hYWnJtdzNnQjlGTVVNNzRLalpZSG9EQklIajZjZGZVaXhjMnh3?=
 =?utf-8?B?eG5xNmFwUm40dHVKWEpGNHJrM1cwTmR6bkZBdkZKMFVucHJYVEowVlB4U2oz?=
 =?utf-8?B?cTFZYXlTTDhEN0hicFpNZHBpdEhRc21lVElMSEdUeXFYTXZCNFV5dkY1a1Bs?=
 =?utf-8?B?UXBhSG1rWDZhaHFEcXlwdXFPamhCVFFqK0xaOVNOdHFPQW9mb0dSaEtMK1Ba?=
 =?utf-8?B?TWFUNmVNaFZZdktWRTh3QkEzaGRyVUZ4dmtwdS85RnA3L3RTSmhPR3M1ZGtD?=
 =?utf-8?B?TDFvQm1JZU1xMUlQdTNub0lxRUV1dk50cUVBSDZTUnJ2dzNXVVBOMEx1MjBy?=
 =?utf-8?B?OVZFTmlHbkpWYW1HTWI0ZDdaeGxvRHpVZDBybEN5ZnZTUjlhUE9tbGJTNHNm?=
 =?utf-8?B?NzdONjhSQkRPcnQ5cFBWK3Q1MW9RUXYyREV1NzJvSjk1aGdXN2NGMktIdUxB?=
 =?utf-8?B?OHZITmtDbjRCT0pWK1JwOFFNQlp2ejRqckI5VEpFcGQ5VU55R21KajI0K3B6?=
 =?utf-8?B?Vk5JR2hOZkJNRzVoVVdiVVZRUzB6T0ZiRjVMRi9SSW85eEF2b1hlVjBxWHFo?=
 =?utf-8?B?NFpvcktaNmpudGllN25VVWtIV2UyRHQ5clVrMFVwOTd5VHk3bFhrdk5NQXls?=
 =?utf-8?B?cndmWHhkdmN1RjlHMHF6S2gxeUtjSDJwNTRkTnNTQmZYZnN1dktvS0R6OE0y?=
 =?utf-8?B?ZWo3bjJVbjdwYjAyK3hxNTdFRU8xUnZnWE1EVEdQT1llSko4SHMraGw2TjRS?=
 =?utf-8?B?c3lUY0pKY05tSUpHUytsSXdrdVlLY1FVTGl2TEU0aEJGYWliWWwxa1RnWmJY?=
 =?utf-8?B?c3lIV1ZuMDdjQXVtSXVJZlZVNjlrYzFtTFZNWHJvUW1FbWZjZWJyY2lKQVpj?=
 =?utf-8?B?VUdEQlFYdUhYSC9GQVc0WDRzdXNYV0VtUUNXZWdKYTNRMHpRZGdYMjQxbW9Y?=
 =?utf-8?B?VlZpclQrQ2srVTExd1hiOUQzNUNlcHJpRjZHK2NpbWcxbWdzU2JzK2dJency?=
 =?utf-8?B?WjZDUTlOQkc4MWJrLy9KMGZaelVtOGsrSG5hZHdIeURLRE9TODZFS1FOZnVB?=
 =?utf-8?B?OFN6VEhnS2ZXeXRkYzNqYW9YWVFTN3RaRFpNRG12cjZNQ1VYZW8zR1k1RHVl?=
 =?utf-8?Q?tH7yq74ePoiXBP2WdYzvA5Tzw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad73062-7fc0-436c-3aad-08de0a94c81e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 20:12:06.3698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PdInFa+wf4h/8kyVT1UiNcNSV2X/4q8G5kZ0MzVL5WGa3uk5itTa0kkvtv4iEgD1Kb7YsPImCEd05P7PGYGEuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8338
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

Hi,

On 14-10-2025 01:35, Rodrigo Vivi wrote:
> On Mon, Oct 13, 2025 at 12:12:15PM +0530, Sk Anirban wrote:
>> RPe is runtime-determined by PCODE and caching it caused stale values,
>> leading to incorrect GuC SLPC parameter settings.
>> Drop the cached rpe_freq field and query fresh values from hardware
>> on each use to ensure GuC SLPC parameters reflect current RPe.
>>
>> v2: Remove cached RPe frequency field (Rodrigo)
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5166
> Is it passing cleanly the igt/tests/intel/xe_gt_freq ?
>
> Thanks,
> Rodrigo.
The CI did not run all the tests on this patchwork. Re-testing  WIP.

Thanks,
Anirban
>
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_pc.c       | 36 +++++++++++++++-------------
>>   drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 --
>>   2 files changed, 20 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 3c0feb50a1e2..2d1d5121555e 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -330,7 +330,7 @@ static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
>>   	 * Our goal is to have the admin choices respected.
>>   	 */
>>   	pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
>> -			    freq < pc->rpe_freq);
>> +			    freq < xe_guc_pc_get_rpe_freq(pc));
>>   
>>   	return pc_action_set_param(pc,
>>   				   SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>> @@ -375,7 +375,7 @@ static void mtl_update_rpa_value(struct xe_guc_pc *pc)
>>   	pc->rpa_freq = decode_freq(REG_FIELD_GET(MTL_RPA_MASK, reg));
>>   }
>>   
>> -static void mtl_update_rpe_value(struct xe_guc_pc *pc)
>> +static u32 mtl_get_rpe_value(struct xe_guc_pc *pc)
>>   {
>>   	struct xe_gt *gt = pc_to_gt(pc);
>>   	u32 reg;
>> @@ -385,7 +385,7 @@ static void mtl_update_rpe_value(struct xe_guc_pc *pc)
>>   	else
>>   		reg = xe_mmio_read32(&gt->mmio, MTL_GT_RPE_FREQUENCY);
>>   
>> -	pc->rpe_freq = decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
>> +	return decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
>>   }
>>   
>>   static void tgl_update_rpa_value(struct xe_guc_pc *pc)
>> @@ -408,7 +408,7 @@ static void tgl_update_rpa_value(struct xe_guc_pc *pc)
>>   	}
>>   }
>>   
>> -static void tgl_update_rpe_value(struct xe_guc_pc *pc)
>> +static u32 tgl_get_rpe_value(struct xe_guc_pc *pc)
>>   {
>>   	struct xe_gt *gt = pc_to_gt(pc);
>>   	struct xe_device *xe = gt_to_xe(gt);
>> @@ -421,10 +421,10 @@ static void tgl_update_rpe_value(struct xe_guc_pc *pc)
>>   	 */
>>   	if (xe->info.platform == XE_PVC) {
>>   		reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
>> -		pc->rpe_freq = REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>> +		return REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>>   	} else {
>>   		reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
>> -		pc->rpe_freq = REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>> +		return REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>>   	}
>>   }
>>   
>> @@ -433,20 +433,17 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
>>   	struct xe_gt *gt = pc_to_gt(pc);
>>   	struct xe_device *xe = gt_to_xe(gt);
>>   
>> -	if (GRAPHICS_VERx100(xe) >= 1270) {
>> +	if (GRAPHICS_VERx100(xe) >= 1270)
>>   		mtl_update_rpa_value(pc);
>> -		mtl_update_rpe_value(pc);
>> -	} else {
>> +	else
>>   		tgl_update_rpa_value(pc);
>> -		tgl_update_rpe_value(pc);
>> -	}
>>   
>>   	/*
>>   	 * RPe is decided at runtime by PCODE. In the rare case where that's
>>   	 * smaller than the fused min, we will trust the PCODE and use that
>>   	 * as our minimum one.
>>   	 */
>> -	pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
>> +	pc->rpn_freq = min(pc->rpn_freq, xe_guc_pc_get_rpe_freq(pc));
>>   }
>>   
>>   /**
>> @@ -560,9 +557,16 @@ u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc *pc)
>>    */
>>   u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc)
>>   {
>> -	pc_update_rp_values(pc);
>> +	struct xe_gt *gt = pc_to_gt(pc);
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	u32 rpe_freq;
>> +
>> +	if (GRAPHICS_VERx100(xe) >= 1270)
>> +		rpe_freq = mtl_get_rpe_value(pc);
>> +	else
>> +		rpe_freq = tgl_get_rpe_value(pc);
>>   
>> -	return pc->rpe_freq;
>> +	return rpe_freq;
>>   }
>>   
>>   /**
>> @@ -1021,7 +1025,7 @@ static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
>>   	/*
>>   	 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
>>   	 */
>> -	ret = pc_set_min_freq(pc, min(pc->rpe_freq, pc_max_freq_cap(pc)));
>> +	ret = pc_set_min_freq(pc, min(xe_guc_pc_get_rpe_freq(pc), pc_max_freq_cap(pc)));
>>   	if (!ret)
>>   		ret = pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));
>>   
>> @@ -1339,7 +1343,7 @@ static void xe_guc_pc_fini_hw(void *arg)
>>   	XE_WARN_ON(xe_guc_pc_stop(pc));
>>   
>>   	/* Bind requested freq to mert_freq_cap before unload */
>> -	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), pc->rpe_freq));
>> +	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), xe_guc_pc_get_rpe_freq(pc)));
>>   
>>   	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), fw_ref);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> index 5e4ea53fbee6..f27c05d81706 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> @@ -21,8 +21,6 @@ struct xe_guc_pc {
>>   	u32 rp0_freq;
>>   	/** @rpa_freq: HW RPa frequency - The Achievable one */
>>   	u32 rpa_freq;
>> -	/** @rpe_freq: HW RPe frequency - The Efficient one */
>> -	u32 rpe_freq;
>>   	/** @rpn_freq: HW RPN frequency - The Minimum one */
>>   	u32 rpn_freq;
>>   	/** @user_requested_min: Stash the minimum requested freq by user */
>> -- 
>> 2.43.0
>>

