Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5255CCA471
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 14:38:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8414510E12F;
	Fri,  3 Oct 2025 14:38:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R6Xw034F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC4710E125
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 14:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759502335; x=1791038335;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=7/KmFk04Uitm1xAP742L95vSwaUr15Ljuq4zvzaTxUs=;
 b=R6Xw034FLdFdNsU5JSeQ5guwKLc/4cv77aqVE+aocGGC3c55O4FOdGfM
 gQV+y7l/hKH34tkSMBXCweTX3UDLdubM+685SJOQqvFcx/lFdl6lE7v98
 DmOLwYLK5dIQ21OYO2/eWtKoGi7PSe7W+FQHJwru21T2pvOlkOc6/6VJu
 +u6cE9a6O16nyodewGdEewu9DU2juksTBn6Ax2WESi99DAT2Kbo6Y0hGI
 Y6UUjFwRWIHAR1Jbh2B0UzIyMZgE8SIiKW1At+seIreAzskKqUK/S3ntm
 nQ/ZadWY7oGFs4MQ4dH5+k/AgjrrBmjBsxwko13V2gqr0v8a9LdUC4VVf w==;
X-CSE-ConnectionGUID: m0pZ7haxQ6Wt71O89Lm/0Q==
X-CSE-MsgGUID: NplwfRNfTC6dY7pwfc+Nqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="61949496"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="61949496"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 07:38:55 -0700
X-CSE-ConnectionGUID: 6kzlyFINTXyzIL1IuR9Wow==
X-CSE-MsgGUID: I54CKdq9RRakYturli+5PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="178944474"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 07:38:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 07:38:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 07:38:54 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.23)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 07:38:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nec5pZ69RoEI3TLFa/NpALAXN15Kn3uaIRko8KlCuWSpxzc2wz4wuhHvwPmY0JiNyZ1rjMefdkOmsb1MBFkkpxi8jcgTF7EpFpcvEBuCH70TCw4BnostH5dXz6cjAApfouKBEOcMTXS6p4H+IO3mkRm3P9T3U/BhIi1/7VhYxotO05lByg0gw05DeV7Dm77GyVOqXKplk5RxL7FASVUlsHhC2fdp71RSUNUJ/Bnn5FVr13YkIdPG+3pCFDeKht4qy9O78kQyRbziXIokeEYfz1pirAuFSGGrKSaIHNH6NrJctf1nf7THHFA2qmBFlS27IYB6J8tDIHhUgSqO9RspFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zevoMscOs6qzW79bDr24r9K+QfNiMujT23AR1QV5k6I=;
 b=JWecR8GX2eZ1icfZRJex74069lZEKWGbzC5mEamTyxhvnOZ1mW1mjoY7H3csQIPW/AmSOT99PK8x2gUn8sgok842vIvLodcNrnJJYnRZQefRp2J/WZK9zgfn9dc2v4NjtpbHLmXJtED50G4Y6DmOSU+tEmOQdxx1+J9lldOTxgZVffJCO0IM0AYops1TDE2WUU8xI1qTeXNLyAeSmFkFXTI1gZu7KazzaV06mFpxawlcBGkerT2gdvIMkEtwjavLz0CsIAVCHE8uIie1sOHdY4bHlwMsktU37rJq8AVgDj5LKOKdGhwxPVPLCW0oeeAqlM7dIszRmuI7tXryg37QxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM4PR11MB5295.namprd11.prod.outlook.com (2603:10b6:5:392::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Fri, 3 Oct
 2025 14:38:48 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 14:38:48 +0000
Message-ID: <f3805b48-f9b2-4b56-90ab-c62bacb86784@intel.com>
Date: Fri, 3 Oct 2025 16:38:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/34] drm/xe/vf: Wakeup in GuC backend on VF post
 migration recovery
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
 <20251002055402.1865880-19-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251002055402.1865880-19-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0044.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::20) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM4PR11MB5295:EE_
X-MS-Office365-Filtering-Correlation-Id: 325967e4-43e2-45e8-737f-08de028a8ff5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1Z4OTB6UGl5SjNsMklFS1F6dXN6OHp4dzZ1Y3V5bmJTUHJvakJ4MnNaa0Vj?=
 =?utf-8?B?a0ZqMEtlamFlYkNQSFZMK0VFRFJTdTkrcG8wTDlsU3RVR0toK092QjRGU1ow?=
 =?utf-8?B?aFVtMEh3WnZRVzhtY2tqOFg2RENyUHJ4dlRPcFo3Nmt0ZjVuS3FJcFpnc1dT?=
 =?utf-8?B?dlBiTC9KekFVNWFpeWRvVVBsVmVYU0UxUk1qcVF4MXVsZGJITXhuUHV2NHhC?=
 =?utf-8?B?RzhKT05VQUQrZmxPVTdKU0JMaVROeVc2NlJTdnQ2d29jVTA2TnRhZkhyVnY3?=
 =?utf-8?B?aFN2bjVIT2F0eU5Zb2VQV096UmxHay8wbVVleU5kWVBEVnZMUXhRSnNEa21T?=
 =?utf-8?B?Q0lSakpoWmQ4RlRwZ0dsWlRhWWY2WFlpV3hTVWxWc25LYnY0S3J3VmtUNlMr?=
 =?utf-8?B?eHBJeXNrSnpvQUR0MW1UR09qcXdaVmhNbllwUUdqU0JsL1FWZ2VFa3EwVzRV?=
 =?utf-8?B?QU1yTzFDZXY0Y3JXYThLc1hMYXVqMFNQcGZVR3JvdmNUT0QyMmNTZTkrTjVy?=
 =?utf-8?B?b0N0eW5DTzI5NHpQMEMrQlRzMDVpNWdLYUsyNXpLYzEralRjV1RWKzAwd3Vs?=
 =?utf-8?B?M0dwcS82QklzeGRuWTZacTJVOHhoR3dWSC9lamZQOVBMNFMwandJbjBuYVhr?=
 =?utf-8?B?cGhVWEdHeHZVUHRkRHdIYWRvemFyUHZVNitxN24wMDFiVlJMdlN6WXZGWFU3?=
 =?utf-8?B?ZitZRi9EbHhGMUZ3SWg1ekpLaEp1aHQyNitDcitsZUtlYlUxOE9qVkhGbk9p?=
 =?utf-8?B?TFA5SERHTmtoOWZJMXNCWHNPSUVyZ0RzTXo2bTQ1Q1JrV291MnBoS3NaakNU?=
 =?utf-8?B?VW9HLytxV2RCWTY1UmJjWkhxMHorejlGKzFrK1NrODNvb3BFK1U3NGFVZVd1?=
 =?utf-8?B?cWkyMC9aS3VlVllaQ1lxSjRKUGg4T2VUL3JhSmJVZTUzR2JsNXlWVVdkK2Nk?=
 =?utf-8?B?QkFiendsSmZDaGU4MmVhczJQNmJTT3daUXJDODJpNmVCTk5rMkVEMTRNZEdt?=
 =?utf-8?B?ZWN3OER5ZFBmTm9zL28rSWdRQVpGVzNtTW9tczdPRkNBWXlOZGZWbkozbXM2?=
 =?utf-8?B?OVdtVlRhUTlvR3A3eUNVdWd2QytZQll6bUltWHVaWHBJTWZNT053RmE3NnZ0?=
 =?utf-8?B?ZjEza0JFTmpWdVpZTDk2Zk5YWlVDcG9JYUVnZE01SklTcVNKc0NMZGZrazBG?=
 =?utf-8?B?N045Skcwc2VIeml4akkreVA4RWFSZjNPZHlPa2xzdmFZUTExdFdEWjBVNWJx?=
 =?utf-8?B?dlFtd3czQzB1NUs4dmxCNlpOSEtCM2tnbFNMU2tmRFd2NjhTaUszN0hEZXBP?=
 =?utf-8?B?VDh2a1plMUlWQzhkT01hdDFvZDVQajMyR3FmRmFoTnI2b1l1WmRkMkVsbHNR?=
 =?utf-8?B?bGxxRkVaMzkvV2xoS1FPUnhKUHUyS3g5UmdtbG1pRTVlb1R0QkI2U2NscWF2?=
 =?utf-8?B?Q0swR1VOSUhDczh5ODNLZGFHQU5JY3NmTGgzckNUc1B6TWlEZFVJaWVRelM5?=
 =?utf-8?B?QzF1NlNGZWFwYlhjcnJ5em1DV3ZxUWxkcWJMTFQyc0FHM1JBY1lESTlWdmww?=
 =?utf-8?B?NkVOV0RPNDlPOVdtVFRvSVVPVFdFTXI0NUdZbjAwVEc2NFQ3b2FYS011SVZy?=
 =?utf-8?B?SHA4RzJxN0dlUEUxNVhubXY3d0FNM29QNFZzQmVWRU5PTWZFSTBDY1JYdlla?=
 =?utf-8?B?My9LV0QvRFJHdzRvUkdEcERzdVRaWmpKaTZlRjRHM1BVdEFlaXRCZ1JXUzdJ?=
 =?utf-8?B?ajZZV2ZzTkx1bUoyOTRDR0JNU2U4dDVRNDlBTFdaQ2tTQ3l2cnZ0eVZUVEg4?=
 =?utf-8?B?RXh6UUFJV2ZodldaWExZb2pTYUppdHhaTldkMHJEaHhsZmpaNHNrOUswd3VV?=
 =?utf-8?B?cHFtNi9XNlhjZDlydTJFbGN0OGRkdTh3clF2VDhGbVJlSlF3WlV6WGx0M29W?=
 =?utf-8?Q?QUpXcDi4H4dGlPbSHJMH28WqaBqj81E/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YngwRDgyeXJFKzh5NklWWDhkUXpIVjRrWDU1bzhDVzNjSVpUQ3BSRDZaZ2M5?=
 =?utf-8?B?c01kdVlTY2hJSXEyek9mM2ZwZ0Y5ZkcxRUNvdzBJaGFnd0krRjI5UmlDUzFy?=
 =?utf-8?B?ZlltaUVpV1ZjWDNHODUwS0M4ZjdQR0g0Zk01enMxKy9rVzQxWWl6djFQMWpT?=
 =?utf-8?B?eU0wTnlrYTZlMjNFU3dZbUxFS0pWcGFTNnUxQ3BrL3JYdEJERithZnBKam8x?=
 =?utf-8?B?emMrQkQzQW5xeTRISGNQandveGpCRFQrRWh1K3Q3aWhMOHVmeTh4b1ljSjUx?=
 =?utf-8?B?YjBWcEtyL2FZTHRFODIwdmRheEFWZ01aUktLVkdDQmh5TjBUNVFNK2l0ZTgz?=
 =?utf-8?B?Nzducmp3SGFvcE1UWVBGNGpLMGQ3UFBnQklYcmZLL0MzUEZXdnh2dVJ0L1Ry?=
 =?utf-8?B?REt3ajczbFkrMnFFY2Z4Y3Vkc0dKWDNLejZYVXhQdWduL2xwMjkwVGR6R0ZF?=
 =?utf-8?B?cE9PQVdydG1iRWNEMW51NFpqQUlLaWZNWW1QcmZubnNKclgwQUNNT1RkcTFl?=
 =?utf-8?B?N25pdk5MRStMcXE4eUxlVmZyS1VnNDNqalNxUXh0UXdlQ3V1RnhjMGl3U0pI?=
 =?utf-8?B?TVYvNXlFUUg5LzU3VENTbVFmeVJTQ2V1N0h6Q0lKY2dSbmJVUzR0d0w0dmNL?=
 =?utf-8?B?Rytkck5UYVFjN1Z3MEE5Y04zcGlBbVNua0E4OWpHUVVLZnVBdWJYQmxyZkl2?=
 =?utf-8?B?TUFGMmN3Rm45ZU40ZjgwbTFYa3FzYnNueTRqd1dTSjlIL1dnem1tSTVwUEVk?=
 =?utf-8?B?d1NzQndJOENDSmVRVENCc28yNzhXVENocHd6Y3pEa1ZKVzJXVXpMbDRpL3lJ?=
 =?utf-8?B?QnIxZFpZeDZUUVJ3cU9nUk9Qc0UyUUhqaG1VS01sZWQ5ak8zTnBxVFRDdm1C?=
 =?utf-8?B?dU9jQXpUY0MyUUQ1TlpZSWVsZUZ3bkFkVjV3TjZMNlRlQnRqQ3VFUUNHTDhW?=
 =?utf-8?B?ZmExS3g0NTdGd010MnFFeWkrbE9ybjA5VzRSKzU0b1dTTWNabGhCSDlvdWlq?=
 =?utf-8?B?S2daOG9CS1N2eTZydnRBditseWFSVExSTmxWTEhCdVY4b3F6dzRYa0xleE1T?=
 =?utf-8?B?TnozLzN2WHVLWU1ib3RWNlF2K1dBSFE4VVdlbjc2M3RxN0QyeXJJMlVBOHhL?=
 =?utf-8?B?QW1JbElYSC9xcXJxaFh2RnlIQjJrcnZnOVdta1o0MWVKUGlFNHE5dVdLQTV1?=
 =?utf-8?B?RmgyVGlHTWpoRGdkckFnbGRKbXh0dUxtcTVUL3M1T2hJa1JQU2xVekRyRldm?=
 =?utf-8?B?ZEZpMHN3bTBlZHZOa0JpSWZFWUlxOC9UenRCSXJtVUQ3ZW1ONU5qeExTbUxs?=
 =?utf-8?B?YXpTbCsySmJuUDJ3N29BdnFIbENJS2p5bUZxVTkzY3ZMS2RrY2hIWW52d2ZZ?=
 =?utf-8?B?YUVHbTNqdG5JUUl4QmxEd1kwckt2NnN1Yk5UMVgyVTMwMFBrSWptNVlEb3ZQ?=
 =?utf-8?B?a1VneGFaTnoxTk8zL3JMV1g0M1F2NVh3MXliOUZTa0NGVGFzallWbjF1MWJW?=
 =?utf-8?B?eExXWUUzdk82cGlJOWdDUnVKcjJVOTQ5TndscnJCU3FSSGc4Y2F1SkVQaks3?=
 =?utf-8?B?NDRKbkQ2QXhKd3JaaTFmOGtGV0tGZjZmNGdaZ0Y3WVBMcDJEVExGUG1ZbUVP?=
 =?utf-8?B?ME1wTy9IU0tlaVBMOUo4YkpqYXdFZFkrNVV5SC9TUURIUFQvS25jTWlTRkxp?=
 =?utf-8?B?VGRBQXV3cmVrT1BqS2s0blZQWDdZTE5qSzUyYnVNRGwzdHVTZGxlZ2ViYVlU?=
 =?utf-8?B?ak1qSjE5cmlZUitUcUNiYy9vNzBpKzZDNUJmWlYvVDhvZitHUjZJNHFnUjlG?=
 =?utf-8?B?WExndUhrWmk1d08xQ0pndTBja0xMelozYjhkUXNKR1ZVVGlrcTZueFdadDV1?=
 =?utf-8?B?cXQ5S0tCeEU2cGpKbWlST0dPbjcwZ1VZN25IQmRrVENpM2luSFU5K3J5dkxV?=
 =?utf-8?B?cHpVWWZoTXFGRDQwY0o2SDFtek1lQVNEdHhmVlZ6dnI3Q0J2WktoTkc1RDdo?=
 =?utf-8?B?VjU5WTVxUE5kYWhYZzYvYVF2cGlnMWdZV1lsanc2OFNDT0VGMXpRUDUyMFVO?=
 =?utf-8?B?NC90eEp4VjZvZGllU25DeEM1QXgzRG5XSG9tYXdJbHJPWnhwLzRYUXk1ZUhT?=
 =?utf-8?B?d1JTeUhqU2syTndsOTkxV3hJSnRiejN5S09vV0luK1NkamJVTU9uVkNpemhs?=
 =?utf-8?B?Y1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 325967e4-43e2-45e8-737f-08de028a8ff5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 14:38:47.9477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5PyOOfGz9EEHAJMMkPh35zrXU9t9zDNfc7y8LmhegBzgMDrK5Gbszh6XH0KeRr6fE7Rk3ZDbTLlUvZhsEnZD8BSNtwwKRjx+TyIe6Wo4wEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5295
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



On 10/2/2025 7:53 AM, Matthew Brost wrote:
> If VF post-migration recovery is in progress, the recovery flow will
> rebuild all GuC submission state.  In this case, exit all waiters to
> ensure that submission queue scheduling can also be paused. Avoid taking
> any adverse actions after aborting the wait.
> 
> v3:
>  - Don't block in preempt fence work queue as this can interfere with VF
>    post-migration work queue scheduling leading to deadlock (Testing)
>  - Use xe_gt_recovery_inprogress (Michal)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c   |  3 +
>  drivers/gpu/drm/xe/xe_guc_submit.c    | 79 ++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_preempt_fence.c | 11 ++++
>  3 files changed, 73 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 6ba8b5703ff2..e8fd2fe98076 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -741,6 +741,9 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
>  	    !gt->sriov.vf.migration.recovery_teardown) {
>  		gt->sriov.vf.migration.recovery_queued = true;
>  		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
> +		smp_wmb();	/* Ensure above write visable before wake */

shouldn't this be in separate fixup patch ?

> +
> +		wake_up_all(&gt->uc.guc.ct.wq);

shouldn't this be wrapped into some CT level helper ?

>  
>  		started = queue_work(gt->ordered_wq, &gt->sriov.vf.migration.worker);
>  		xe_gt_sriov_info(gt, "VF migration recovery %s\n", started ?
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index b82976f031e5..9320fe9fbb29 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -27,7 +27,6 @@
>  #include "xe_gt.h"
>  #include "xe_gt_clock.h"
>  #include "xe_gt_printk.h"
> -#include "xe_gt_sriov_vf.h"
>  #include "xe_guc.h"
>  #include "xe_guc_capture.h"
>  #include "xe_guc_ct.h"
> @@ -984,6 +983,9 @@ static u32 wq_space_until_wrap(struct xe_exec_queue *q)
>  	return (WQ_SIZE - q->guc->wqi_tail);
>  }
>  
> +#define vf_recovery(guc)	\
> +	xe_gt_recovery_inprogress(guc_to_gt(guc))

use static inline helper instead

> +
>  static int wq_wait_for_space(struct xe_exec_queue *q, u32 wqi_size)
>  {
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> @@ -993,7 +995,7 @@ static int wq_wait_for_space(struct xe_exec_queue *q, u32 wqi_size)
>  
>  #define AVAILABLE_SPACE \
>  	CIRC_SPACE(q->guc->wqi_tail, q->guc->wqi_head, WQ_SIZE)
> -	if (wqi_size > AVAILABLE_SPACE) {
> +	if (wqi_size > AVAILABLE_SPACE && !vf_recovery(guc)) {
>  try_again:
>  		q->guc->wqi_head = parallel_read(xe, map, wq_desc.head);
>  		if (wqi_size > AVAILABLE_SPACE) {
> @@ -1192,9 +1194,10 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>  	ret = wait_event_timeout(guc->ct.wq,
>  				 (!exec_queue_pending_enable(q) &&
>  				  !exec_queue_pending_disable(q)) ||
> -					 xe_guc_read_stopped(guc),
> +					 xe_guc_read_stopped(guc) ||
> +					 vf_recovery(guc),
>  				 HZ * 5);
> -	if (!ret) {
> +	if (!ret && !vf_recovery(guc)) {
>  		struct xe_gpu_scheduler *sched = &q->guc->sched;
>  
>  		xe_gt_warn(q->gt, "Pending enable/disable failed to respond\n");
> @@ -1297,6 +1300,10 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>  	bool wedged = false;
>  
>  	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_lr(q));
> +
> +	if (vf_recovery(guc))
> +		return;
> +
>  	trace_xe_exec_queue_lr_cleanup(q);
>  
>  	if (!exec_queue_killed(q))
> @@ -1329,7 +1336,11 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>  		 */
>  		ret = wait_event_timeout(guc->ct.wq,
>  					 !exec_queue_pending_disable(q) ||
> -					 xe_guc_read_stopped(guc), HZ * 5);
> +					 xe_guc_read_stopped(guc) ||
> +					 vf_recovery(guc), HZ * 5);
> +		if (vf_recovery(guc))
> +			return;
> +
>  		if (!ret) {
>  			xe_gt_warn(q->gt, "Schedule disable failed to respond, guc_id=%d\n",
>  				   q->guc->id);
> @@ -1419,8 +1430,9 @@ static void enable_scheduling(struct xe_exec_queue *q)
>  
>  	ret = wait_event_timeout(guc->ct.wq,
>  				 !exec_queue_pending_enable(q) ||
> -				 xe_guc_read_stopped(guc), HZ * 5);
> -	if (!ret || xe_guc_read_stopped(guc)) {
> +				 xe_guc_read_stopped(guc) ||
> +				 vf_recovery(guc), HZ * 5);
> +	if ((!ret && !vf_recovery(guc)) || xe_guc_read_stopped(guc)) {
>  		xe_gt_warn(guc_to_gt(guc), "Schedule enable failed to respond");
>  		set_exec_queue_banned(q);
>  		xe_gt_reset_async(q->gt);
> @@ -1491,7 +1503,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	 * list so job can be freed and kick scheduler ensuring free job is not
>  	 * lost.
>  	 */
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags))
> +	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags) ||
> +	    vf_recovery(guc))
>  		return DRM_GPU_SCHED_STAT_NO_HANG;
>  
>  	/* Kill the run_job entry point */
> @@ -1543,7 +1556,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  			ret = wait_event_timeout(guc->ct.wq,
>  						 (!exec_queue_pending_enable(q) &&
>  						  !exec_queue_pending_disable(q)) ||
> -						 xe_guc_read_stopped(guc), HZ * 5);
> +						 xe_guc_read_stopped(guc) ||
> +						 vf_recovery(guc), HZ * 5);
> +			if (vf_recovery(guc))
> +				goto handle_vf_resume;
>  			if (!ret || xe_guc_read_stopped(guc))
>  				goto trigger_reset;
>  
> @@ -1568,7 +1584,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  		smp_rmb();
>  		ret = wait_event_timeout(guc->ct.wq,
>  					 !exec_queue_pending_disable(q) ||
> -					 xe_guc_read_stopped(guc), HZ * 5);
> +					 xe_guc_read_stopped(guc) ||
> +					 vf_recovery(guc), HZ * 5);
> +		if (vf_recovery(guc))
> +			goto handle_vf_resume;
>  		if (!ret || xe_guc_read_stopped(guc)) {
>  trigger_reset:
>  			if (!ret)
> @@ -1673,6 +1692,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	 * some thought, do this in a follow up.
>  	 */
>  	xe_sched_submission_start(sched);
> +handle_vf_resume:
>  	return DRM_GPU_SCHED_STAT_NO_HANG;
>  }
>  
> @@ -1769,11 +1789,17 @@ static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *ms
>  
>  static void __suspend_fence_signal(struct xe_exec_queue *q)
>  {
> +	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
> +
>  	if (!q->guc->suspend_pending)
>  		return;
>  
>  	WRITE_ONCE(q->guc->suspend_pending, false);
> -	wake_up(&q->guc->suspend_wait);
> +	if (IS_SRIOV_VF(xe))
> +		wake_up_all(&guc->ct.wq);

so now for the all VFs (without recovery) there is now no need to wakeup suspend_wait?

> +	else
> +		wake_up(&q->guc->suspend_wait);
>  }
>  
>  static void suspend_fence_signal(struct xe_exec_queue *q)
> @@ -1794,8 +1820,9 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
>  
>  	if (guc_exec_queue_allowed_to_change_state(q) && !exec_queue_suspended(q) &&
>  	    exec_queue_enabled(q)) {
> -		wait_event(guc->ct.wq, (q->guc->resume_time != RESUME_PENDING ||
> -			   xe_guc_read_stopped(guc)) && !exec_queue_pending_disable(q));
> +		wait_event(guc->ct.wq, vf_recovery(guc) ||
> +			   ((q->guc->resume_time != RESUME_PENDING ||
> +			   xe_guc_read_stopped(guc)) && !exec_queue_pending_disable(q)));
>  
>  		if (!xe_guc_read_stopped(guc)) {
>  			s64 since_resume_ms =
> @@ -1922,7 +1949,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  
>  	q->entity = &ge->entity;
>  
> -	if (xe_guc_read_stopped(guc))
> +	if (xe_guc_read_stopped(guc) || vf_recovery(guc))
>  		xe_sched_stop(sched);
>  
>  	mutex_unlock(&guc->submission_state.lock);
> @@ -2068,6 +2095,7 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
>  static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>  {
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
>  	int ret;
>  
>  	/*
> @@ -2075,11 +2103,22 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>  	 * suspend_pending upon kill but to be paranoid but races in which
>  	 * suspend_pending is set after kill also check kill here.
>  	 */
> -	ret = wait_event_interruptible_timeout(q->guc->suspend_wait,
> -					       !READ_ONCE(q->guc->suspend_pending) ||
> -					       exec_queue_killed(q) ||
> -					       xe_guc_read_stopped(guc),
> -					       HZ * 5);
> +	if (IS_SRIOV_VF(xe))
> +		ret = wait_event_interruptible_timeout(guc->ct.wq,
> +						       !READ_ONCE(q->guc->suspend_pending) ||
> +						       exec_queue_killed(q) ||
> +						       xe_guc_read_stopped(guc) ||
> +						       vf_recovery(guc),
> +						       HZ * 5);
> +	else
> +		ret = wait_event_interruptible_timeout(q->guc->suspend_wait,
> +						       !READ_ONCE(q->guc->suspend_pending) ||
> +						       exec_queue_killed(q) ||
> +						       xe_guc_read_stopped(guc),
> +						       HZ * 5);
> +
> +	if (vf_recovery(guc) && !xe_device_wedged((guc_to_xe(guc))))
> +		return -EAGAIN;
>  
>  	if (!ret) {
>  		xe_gt_warn(guc_to_gt(guc),
> @@ -2187,7 +2226,7 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
>  {
>  	int ret;
>  
> -	if (WARN_ON_ONCE(xe_gt_sriov_vf_recovery_inprogress(guc_to_gt(guc))))
> +	if (WARN_ON_ONCE(vf_recovery(guc)))

xe_gt_WARN_ONCE is available for use
>  		return 0;
>  
>  	if (!guc->submission_state.initialized)
> diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
> index 83fbeea5aa20..7f587ca3947d 100644
> --- a/drivers/gpu/drm/xe/xe_preempt_fence.c
> +++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
> @@ -8,6 +8,8 @@
>  #include <linux/slab.h>
>  
>  #include "xe_exec_queue.h"
> +#include "xe_gt_printk.h"
> +#include "xe_guc_exec_queue_types.h"
>  #include "xe_vm.h"
>  
>  static void preempt_fence_work_func(struct work_struct *w)
> @@ -22,6 +24,15 @@ static void preempt_fence_work_func(struct work_struct *w)
>  	} else if (!q->ops->reset_status(q)) {
>  		int err = q->ops->suspend_wait(q);
>  
> +		if (err == -EAGAIN) {
> +			xe_gt_dbg(q->gt, "PREEMPT FENCE RETRY guc_id=%d",
> +				  q->guc->id);
> +			queue_work(q->vm->xe->preempt_fence_wq,
> +				   &pfence->preempt_work);
> +			dma_fence_end_signalling(cookie);
> +			return;

I'm not sure this chunk matches "wakeup GuC backend" commit description

> +		}
> +
>  		if (err)
>  			dma_fence_set_error(&pfence->base, err);
>  	} else {

