Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E22CDB470
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 07:41:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3AB910E9A1;
	Tue, 23 Jun 2026 07:41:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j0U5mR0f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125C710E9A1
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jun 2026 07:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782200476; x=1813736476;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=E4QtaokrXWaZMBnzNik1snBEk+XQW/c6hRZi02M7Vvs=;
 b=j0U5mR0fuLaxTOvntLG60oZLi/Dfr3cl4yCmrtgU6QGb3OHGIYgFawMu
 pYmWzkkyNLfz+aFz/OzsJc+J7oMUVk7oJ1tdCweAeINrRfvU49PNZ/PTS
 /b/vb8LKzPYGCG1G5X4fpB6i+KNyDhC/IU7b6T8Ca/b2uYucH54KrGHdJ
 TOTVWL+2dJuXu3eZAVxWuMyD/hs6jmehhKGc4j2CoxMhRSb60YgIgCatM
 g25R0nbhbeHcSJj1TV/Zgplvn0BtDR9RRI9hr4YRkdHyUZkKRH2nJ0qos
 Ck/z06GEWhqNBWeX3yavgTLiz8OuFn/Zzj7aC5Hs1xzLO+GfcYqItwFZw Q==;
X-CSE-ConnectionGUID: LzahqyPZSD++llPS8Iwj9Q==
X-CSE-MsgGUID: g9c/+dUNR5GhmLmQzE4OeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="81915865"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208,217";a="81915865"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 00:41:15 -0700
X-CSE-ConnectionGUID: 1j6zooyZR6eT3fx5dfm2jw==
X-CSE-MsgGUID: utsXflH0SUCLQyJsCqAeHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
 d="scan'208,217";a="273138614"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 00:41:15 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 23 Jun 2026 00:41:15 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 23 Jun 2026 00:41:15 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.27) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 23 Jun 2026 00:41:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BlDHZOqRU6rmfw3fZHyNg/HnzCzKlbaTvVxpnZ4QMTUBnpyu3oz9Hox2vEcKux9OZpXG9RiT/0GcBu2ONedCQQPfxp37+I3e0DkFRBh+gNffyGDti2N5Pr4Pa4fOPeXjUWkBsBOUgdGGAp7t6nZg9flwcn0Tb0a/aeGZmkibZVLNQhtL415zTupg/xDRjsNNc3CEdfACpFbn6yAjYxOgJPC54ZqouxfjjUx+z1agaiyQVR2ovrxIbWC75b2CimCCKa/elN4w4GqvUFSFHt7FIW7+RnjLS1wFpriXYoED4bd/Z4dFsZCiGrZSg/2cYvKiOzJNQOd31AMFLnwawfzeBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rqzuKZmpgiYte3UTsKMHLaQ7ldCYN3I5PEHtco25Lg=;
 b=QzCBwpuVJrcBrxLh4aBzmJVJDi7MlfuFlGuvckOMMnY/6IRQdtZTkkbdFohAD1ifv3LEJB9vBYemaSbpHAmJxiAPChLQEvS3303xaAvUl6pV/mwZFOztmraSmxGsnBqLd5l1Whc/IUtC0Ol7qHdPHvgVLyLVWo0zVlNp31FuVVb0nvKfEDZ3FKXxMgKQMNxHpyVDDb75YwOjDIYofvO/P1xX5jM6yRG5zbMxouwgtyB+6qM9XBSaf/S1BHGKWNs3QEp7IRp0dMgZV+br39PJ+W46b1eqvEt0VJJ96UX+Xcq1ZKoBJFN3qpxkJuUCXzjowbrUZ1KoQLSfj0en9eaxgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by DS3PR11MB9671.namprd11.prod.outlook.com (2603:10b6:8:38e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 07:41:13 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0159.012; Tue, 23 Jun 2026
 07:41:12 +0000
Content-Type: multipart/alternative;
 boundary="------------bH0rpxe0PwcxMYtx0Z7T4YsR"
Message-ID: <3188fbea-985b-4336-8503-4b235f33beab@intel.com>
Date: Tue, 23 Jun 2026 13:11:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/3] drm/xe: Add error Signature IDs for RAS logging
To: "Tauro, Riana" <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <rodrigo.vivi@intel.com>, <matthew.brost@intel.com>,
 <thomas.hellstrom@linux.intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <aravind.iddamsetty@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>
References: <20260617104711.79646-5-mallesh.koujalagi@intel.com>
 <20260617104711.79646-6-mallesh.koujalagi@intel.com>
 <2c2b5167-97fd-49fb-88f4-71e1dd1b3122@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <2c2b5167-97fd-49fb-88f4-71e1dd1b3122@intel.com>
X-ClientProxiedBy: MA5PR01CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::10) To CY5PR11MB6209.namprd11.prod.outlook.com
 (2603:10b6:930:27::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|DS3PR11MB9671:EE_
X-MS-Office365-Filtering-Correlation-Id: dc72e8de-6f4c-45ac-3d62-08ded0facbce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|4143699003|11063799006|6133799003|56012099006|8096899003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ycazE0MfZxfcNgSYuipMX5/jLRKYzfnhFycrZDwF+IlRWsa8YJ0pz9M955qYNAx6ArTHJFZfqjKPgP8yWNfdgXc3WX0lKWN05t0ppATrBqn7DjsgxcbsNk7/WYEkRMXtkeYpzQ/qeotOOprb6/wxaYSxmG/BOoDn/xziq5pSkBHpmct3G4I9vvyW0AQfxUxURmwc5AhS69tEVLo64E3XpYLihXOmkopSCk/iEHbVaIBaDCokQyy20Owc4ewtRBPUBMqLO6zkznWeNX1DCmPk/mwzACty5agoidFasdBTo3PY+RfPd+6inrmSyMwvTTXjdkuYiABEunO1QyrETZzHStsc45kj1bp3drQ5KSWZjjZFDOm7j76EkwQhWF0X3eiZZ640MrbP2JnpbLXtOIaiqKJHqULXeA6D907qKw3UEgJs1IW/aai+XRhX+iy2U7Rx/YEXlXitU3oc88gAh2P4QeHwRg+EFT5hAI0VDHKEGeIIzpuxyZrJ6vbTW2ZkeFXRtNnsnOod+S5bPUi8QUHAoCrgsNXJSCcgYaMXNXh8Sh4zDUh/6m3MCb9HiA3n2mvDWHFBMG6zATXYHMDyIn4Hz9PIG+2PPhfUrupqmG7DNygN8m8+GEIwD66w57Be3dwKg7zB74QR283kIm4pyn8mgDLgPc5mTHGDhp+N1luTmrA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(4143699003)(11063799006)(6133799003)(56012099006)(8096899003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzk4TGdHTDFtUnEyZXpLeDFtVjVHY1VpNHVMMWpGZi9MejlzYzRYWWxNcURq?=
 =?utf-8?B?d2RTaU83dXFXM1J2U0ZRc0JzdHVGYkgrV3h5eS9PRDVSQ2NmRjQ5MFBtUVYr?=
 =?utf-8?B?aXlrdVExQm0wMnZQSlJHUmYrcDJtMTdxS0pXbEJHbUV0SU5ETlNvTmNJdUtU?=
 =?utf-8?B?VzFTUVdiOU1nd3NkRnlKWCtmb2V1aE5QTWlXU3BGT2Zkc2xqekUzeVczN0gz?=
 =?utf-8?B?ZEljSUNYSVExQXExSU94V3pVWEEzZ2VhTmlmSzZHcXVnWTZLOGpFaVVTbk52?=
 =?utf-8?B?aWZzL0Z1eC9DOFVYcGlKNHRnRHdNYW42NHNIZWhIaElVbGtQUjZEQ0hac2lY?=
 =?utf-8?B?bEwzem9HeS9oMk9HQlZSOVpUTEZRQ0ZJZ01XSlBjbGloOTdaSFQ2Q3VlY1lo?=
 =?utf-8?B?bmc4RmRSMko4RmpQZnpENld3bXNiY0w0WWtsN3BHakZUVnlXTm9HZjA3bHVQ?=
 =?utf-8?B?UGRzNmltaEloMm9KcldhdWNsZktGK2FUR2txbndPUXF5YlV2Qis1OXpmZTds?=
 =?utf-8?B?bStyTWxJZ0M3TElnSHZtemVNTktEOXhHV3lTV0hkQ0haOFpUZmE4b2U2Slk0?=
 =?utf-8?B?RndMTGRGVm1ZbS9ETnJpR2U4THBDVzZkY3RVSHlTazVZMWR6QXgyK1p4RUF3?=
 =?utf-8?B?TGhLTjNOYm9LMWJPcER0UjFNaTJTWEZncG04N3J2R0swMFgvVVpySkpLZXU1?=
 =?utf-8?B?ZnFFYmJsT0N4NkJwN0pPbWNaMkJ6ZlhBYldtNnpqemRzSWJEWWlPNEExMDZH?=
 =?utf-8?B?U0l2YnBrcHU2SFB1alpWVFhJRjloWHNNRUpONUhvU2hiMHRJT01qdzg1SEJx?=
 =?utf-8?B?dVFaRTlsTGhlV1F0VzNJeUV4Uk56bEpQdU9UbzNVQnYyU0ErSXpNcGwwQTJn?=
 =?utf-8?B?b3ZwMGVHTyt6ZXBHUmFBSzY0c2gvaWh5aGNYRUNpNWJQNjZKMWpweXArSDgv?=
 =?utf-8?B?MzZFcTBoTW4xYm80eGMvaldDTlNmdjlaeXRPZmZ1TGMreVh3TEV6QmtBRXJR?=
 =?utf-8?B?bzEreU00S3Z0TnlINktPeVZqa2dSTGtTUlVrSWFKbWxDYXUxcUxPZ3Z2b0Vp?=
 =?utf-8?B?cnBUMmJmR3Z3SDN3OXhVYlRXeTFyMGpqbk1jZThzUTRmcGU2N1hEVlhRNWp6?=
 =?utf-8?B?UDdZTEp4a0FUNHIyZ053TUdUQVJHNWlWaDVVT1BwNm9PbE9wMjZaeEhjZFFp?=
 =?utf-8?B?VUxycUZBdFFLZktWYUFOQkxuUkEyZ2U5dGgzRWVHWk02dHg3VVh1d2E5aEhZ?=
 =?utf-8?B?MUxYWVFIUklSSXU5eXZJdGhjS2ltM2ZsOUxaL0tMY2xYRDYrNUdvM3FNK0gx?=
 =?utf-8?B?SFFFNmhhSzZFZEZwT3BSOEpPN1g3REJrby9Db2MzNVhNWjB3K3d2Um42ZTMr?=
 =?utf-8?B?d3pHMys4ajJxeHUrb3FSNDJkSzRlR2xEYVVIaVIrdm45cWxudGcvdXhuSGxv?=
 =?utf-8?B?KzdMVDZhUUxCMC80RDhwLzhGWmQrNmRMenVBMmNOUG5OWEhtanZqN0N3bzU1?=
 =?utf-8?B?d3RKTzh3Nkd4Y3BNQlNsWWpWTzBXbVZTQk5QRnhGVDFqb3pUTjZNQyt6V3Yy?=
 =?utf-8?B?TWJGWWljdjBNQ1dqdDFvaTloZmtnUjQrTU1HTUcweFVnOTNad083UEVtbHVL?=
 =?utf-8?B?d3BycXJmT1lQNWcvZjBYZllxNVRuRU1lVFY1cGpLb3VXb0VYcEljTnVzOTBH?=
 =?utf-8?B?OENCbUlIM2FYWDZKNEdDN0pFRHcyT1h4eHNEdDE5TmxDUGtDL1RvYmpYcE5P?=
 =?utf-8?B?cStyZ1c5K2Q5L2pNUlNJTUdQbnUzRDYvZHpwTzZFam00Q0VJbC9MVEZrZWto?=
 =?utf-8?B?bWJIRkVBTzZWbWc4MWdMWlBPYm05TndJeDNMUE4weXJKQ2U3MHZReGp5TFkx?=
 =?utf-8?B?dlpqTUt1VnY3TnNLWSt6aVV2ZnV1eFJNS2ZES0xCaDlFVkQ4SGdvd0RwMFFV?=
 =?utf-8?B?YTdwRlc5YUl4ZE1tekRzZVQyRlNiSXVxRURwRFRoa0RuZndRUWVXRnZmaGR0?=
 =?utf-8?B?d21qYndDZ0tOWVdid0FwWTR6YXR0YWxiWWp5UXY5dGdJNVFEVmV6K0tjMWs5?=
 =?utf-8?B?b3QrOTZVS1NReE9kdmZyeEt3QzRVdXNERjlQTkhQRXZnbU55MFh2V1VtUFhm?=
 =?utf-8?B?VmEzOEZoNjBFaFdKVDBUSmV4VkFTSDhTNVBoVnpPSUpNN3p1dS8ydG9TdGo1?=
 =?utf-8?B?NWFWVlovMXRESEg4L1VsNHdLMSt2Z0pUd1RSMHEraG1uZGxnMXZrUlJuTHFi?=
 =?utf-8?B?YjR5TlNiUVBQelRJdnBTZUs2N2xOREdiVlcreVRieDZUWHR4R21NU3JnUmcx?=
 =?utf-8?B?dVF0TkZjN0FYcTgxbVRLSE9uN1h6dUpTY0ZaeUx2N050RWxUOXJsdzZibTg5?=
 =?utf-8?Q?nCMC0apVRMbumJ5I=3D?=
X-Exchange-RoutingPolicyChecked: cn6G++t/LvAGtrBZKidgRVROxBNthqPplmY1Kiw73lSiuTGYvXCETN3KhzfCj9Jqa5B9ZnyoM4V+JoL0EeUuvTqsRL6lP4/VEQtOB4D/7ymJeuQ7YTjIF1zt25Pqt4sJHHuRUfrT3MFL3sYKZ3PZIBipavO0+pUnllTbzcztm+moEfrXS6/LZzvTzwjPmwQLpZmpB8VuoXqv9PaxMX9dMxEB7Yu9Gp6KXq5aUL+u+YOlUmziSw5YFXUsH/R81eY04MBqf7e7TMp9+tGerOoKTPzlt0RJFg8ZGiZachtjhIYKiGJixgvKGUHl0ucPzpOx9dTX8WtuJfxR7RJS26VsTg==
X-MS-Exchange-CrossTenant-Network-Message-Id: dc72e8de-6f4c-45ac-3d62-08ded0facbce
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6209.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 07:41:12.6560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /7PV8+JF4Ag2ZLD3ZKyFes4CkZK38aA0XmvoGmakGHQXjfzfqio7p0EpbKw3tjskiwcD8JwM0HWW1hPR25RMsHqsiYIBsZbHhjQ0xkXXfME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9671
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

--------------bH0rpxe0PwcxMYtx0Z7T4YsR
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 19-06-2026 11:18 am, Tauro, Riana wrote:
>
> On 17-06-2026 16:17, Mallesh Koujalagi wrote:
>> Every GPU fault needs a stable numeric label so monitoring tools can
>
> GPU fault does not need a label. This patch introduces so it's easy 
> for tools /script to monitor.
>
You are right. I will update this in the next revision.

>> identify what went wrong without parsing log text. Add xe_sig_ids.h
>> which defines those labels, called SIG_IDs.
>>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>> v3:
>> - Add HW SIG IDS details. (Riana)
>> ---
>>   drivers/gpu/drm/xe/xe_sig_ids.h | 29 +++++++++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_sig_ids.h
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sig_ids.h 
>> b/drivers/gpu/drm/xe/xe_sig_ids.h
>> new file mode 100644
>> index 000000000000..7badd0d7ad72
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_sig_ids.h
>> @@ -0,0 +1,29 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_SIG_IDS_H_
>> +#define _XE_SIG_IDS_H_
>
> Document would be more relevant here
>
Ack, I'll move here.
>> +
>> +/*
>> + * Driver SIG_IDs
>> + */
>> +#define XE_SIG_PROBE            1  /* FATAL: probe failed */
>> +#define XE_SIG_WEDGED            2  /* FATAL: device wedged */
>> +#define XE_SIG_SURVIVABILITY        3  /* FATAL: survivability mode */
>> +#define XE_SIG_FW            4  /* RECOVERABLE: 
>> GuC/HuC/UC/GSC/CSC/PCODE */
>> +#define XE_SIG_GT_TDR            5  /* RECOVERABLE: engine hang / 
>> reset */
>> +#define XE_SIG_MEM_FAULT        6  /* RECOVERABLE: VM bind, page 
>> fault, GTT */
>> +#define XE_SIG_IO_BUS            7  /* RECOVERABLE: runtime 
>> PCIe/IOMMU/MMIO */
>> +
>> +/*
>> + * HW SIG_IDs
>
> Acronym needed? Mention Hardware error
>
Good point. I will update the comment to explicitly mention “Hardware 
errors” in the next revision.

>> + */
>> +#define XE_SIG_HW_DEVICE_MEMORY        8  /* Device memory errors 
>> (e.g. ECC) */
>
> example not needed. If required please define
>
Agreed. I will drop the example and keep the comment concise

>> +#define XE_SIG_HW_CORE_COMPUTE        9 /* Compute/shader core 
>> errors */
>> +#define XE_SIG_HW_PCIE            10 /* PCIe interface errors */
>> +#define XE_SIG_HW_FABRIC        11 /* On-package fabric errors */
> on-package?

It refers to the high speed interconnect between dies/tiles within the 
same GPU.

I'll make the comment clearer in next revision.

Thanks,

-/Mallesh

>
> Thanks
> Riana
>
>
>> +#define XE_SIG_HW_SOC_INTERNAL        12 /* SoC-internal errors */
>> +
>> +#endif /* _XE_SIG_IDS_H_ */
--------------bH0rpxe0PwcxMYtx0Z7T4YsR
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 19-06-2026 11:18 am, Tauro, Riana
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:2c2b5167-97fd-49fb-88f4-71e1dd1b3122@intel.com">
      <br>
      On 17-06-2026 16:17, Mallesh Koujalagi wrote:
      <br>
      <blockquote type="cite">Every GPU fault needs a stable numeric
        label so monitoring tools can
        <br>
      </blockquote>
      <br>
      GPU fault does not need a label. This patch introduces so it's
      easy for tools /script to monitor.
      <br>
      <br>
    </blockquote>
    <p>You are right. I will update this in the next revision.</p>
    <blockquote type="cite" cite="mid:2c2b5167-97fd-49fb-88f4-71e1dd1b3122@intel.com">
      <blockquote type="cite">identify what went wrong without parsing
        log text. Add xe_sig_ids.h
        <br>
        which defines those labels, called SIG_IDs.
        <br>
        <br>
        Signed-off-by: Mallesh Koujalagi
        <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com">&lt;mallesh.koujalagi@intel.com&gt;</a>
        <br>
        ---
        <br>
        v3:
        <br>
        - Add HW SIG IDS details. (Riana)
        <br>
        ---
        <br>
        &nbsp; drivers/gpu/drm/xe/xe_sig_ids.h | 29
        +++++++++++++++++++++++++++++
        <br>
        &nbsp; 1 file changed, 29 insertions(+)
        <br>
        &nbsp; create mode 100644 drivers/gpu/drm/xe/xe_sig_ids.h
        <br>
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_sig_ids.h
        b/drivers/gpu/drm/xe/xe_sig_ids.h
        <br>
        new file mode 100644
        <br>
        index 000000000000..7badd0d7ad72
        <br>
        --- /dev/null
        <br>
        +++ b/drivers/gpu/drm/xe/xe_sig_ids.h
        <br>
        @@ -0,0 +1,29 @@
        <br>
        +/* SPDX-License-Identifier: MIT */
        <br>
        +/*
        <br>
        + * Copyright © 2026 Intel Corporation
        <br>
        + */
        <br>
        +
        <br>
        +#ifndef _XE_SIG_IDS_H_
        <br>
        +#define _XE_SIG_IDS_H_
        <br>
      </blockquote>
      <br>
      Document would be more relevant here
      <br>
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
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">Ack,
      I'll move here.</div>
    <blockquote type="cite" cite="mid:2c2b5167-97fd-49fb-88f4-71e1dd1b3122@intel.com">
      <blockquote type="cite">+
        <br>
        +/*
        <br>
        + * Driver SIG_IDs
        <br>
        + */
        <br>
        +#define XE_SIG_PROBE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp; /* FATAL: probe failed */
        <br>
        +#define XE_SIG_WEDGED&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2&nbsp; /* FATAL: device wedged */
        <br>
        +#define XE_SIG_SURVIVABILITY&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3&nbsp; /* FATAL: survivability
        mode */
        <br>
        +#define XE_SIG_FW&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4&nbsp; /* RECOVERABLE:
        GuC/HuC/UC/GSC/CSC/PCODE */
        <br>
        +#define XE_SIG_GT_TDR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5&nbsp; /* RECOVERABLE: engine hang
        / reset */
        <br>
        +#define XE_SIG_MEM_FAULT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6&nbsp; /* RECOVERABLE: VM bind,
        page fault, GTT */
        <br>
        +#define XE_SIG_IO_BUS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7&nbsp; /* RECOVERABLE: runtime
        PCIe/IOMMU/MMIO */
        <br>
        +
        <br>
        +/*
        <br>
        + * HW SIG_IDs
        <br>
      </blockquote>
      <br>
      Acronym needed? Mention Hardware error
      <br>
      <br>
    </blockquote>
    <p>Good point. I will update the comment to explicitly mention
      “Hardware errors” in the next revision.</p>
    <blockquote type="cite" cite="mid:2c2b5167-97fd-49fb-88f4-71e1dd1b3122@intel.com">
      <blockquote type="cite">+ */
        <br>
        +#define XE_SIG_HW_DEVICE_MEMORY&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8&nbsp; /* Device memory
        errors (e.g. ECC) */
        <br>
      </blockquote>
      <br>
      example not needed. If required please define
      <br>
      <br>
    </blockquote>
    <p>Agreed. I will drop the example and keep the comment concise</p>
    <blockquote type="cite" cite="mid:2c2b5167-97fd-49fb-88f4-71e1dd1b3122@intel.com">
      <blockquote type="cite">+#define XE_SIG_HW_CORE_COMPUTE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 9&nbsp;
        /* Compute/shader core errors */
        <br>
        +#define XE_SIG_HW_PCIE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10 /* PCIe interface errors
        */
        <br>
        +#define XE_SIG_HW_FABRIC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 11 /* On-package fabric errors
        */
        <br>
      </blockquote>
      on-package?
      <br>
    </blockquote>
    <p>It refers to the high speed interconnect between dies/tiles
      within the same GPU.</p>
    <p>I'll make the comment clearer in next revision.</p>
    <p>Thanks,</p>
    <p>-/Mallesh</p>
    <blockquote type="cite" cite="mid:2c2b5167-97fd-49fb-88f4-71e1dd1b3122@intel.com"><br>
      Thanks
      <br>
      Riana
      <br>
      <br>
      <br>
      <blockquote type="cite">+#define XE_SIG_HW_SOC_INTERNAL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 12
        /* SoC-internal errors */
        <br>
        +
        <br>
        +#endif /* _XE_SIG_IDS_H_ */
        <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------bH0rpxe0PwcxMYtx0Z7T4YsR--
