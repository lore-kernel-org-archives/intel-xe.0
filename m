Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A4FC55167
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jul 2026 09:45:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB5810F1EA;
	Fri, 31 Jul 2026 09:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JemZd2f9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3083910F1E5;
 Fri, 31 Jul 2026 09:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785491143; x=1817027143;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2tk81G4WpnwwoxQeDYJO+lGXzvuoKwY2JWRjEqKbv4A=;
 b=JemZd2f9hoHlRshyseEsCagmwOohsE/gp7LJfGlfut8NL0OXgYWpPtWh
 Xtl424aWGLVOurnoTfNCBopqHyjgsrZ5+Z5trI2erQKymfeVRZUFZi5DJ
 SYv1JhkPzW7mulD4ctgcgOQmF4Lpg6AbadpD5nvv1kUngCtzOuFmiAPQR
 JveN8Jpl6uRdUxolUSESmEyWwmr8sxlvvsmeEMv4+E+iyio/WJvm9umtM
 51D4rrBPOdDvRmEFvSPb4lwXESruBrT3D7MqA8tYMDRBPPf6pTepXwnZC
 wW9OgNE7jd6kXEKF4q8X8PGkdQcBpWwWCdly2rCjDFCm+U79BVcYjtedA A==;
X-CSE-ConnectionGUID: c60ZRcbUTc6pvwyzb4tqeg==
X-CSE-MsgGUID: ZoIp1bXoSiCYwLZg+wWWnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="85990099"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="85990099"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 02:45:42 -0700
X-CSE-ConnectionGUID: kcGWn1oCR82GuKcNjVdzpQ==
X-CSE-MsgGUID: ui2bxgHkQyac9jHTwn4rPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="254229967"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 02:45:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 31 Jul 2026 02:45:40 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 31 Jul 2026 02:45:40 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.38) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 31 Jul 2026 02:45:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSopSGUaU/jmDm0NifssUFx5W9Df/oEdFzOqxO3fTeKr8RFHkGjq7DOkQjth7v1f49Dwvfsyt259K/FmXljnUSnmXX05agrghXsDASgS61oPmWs4odozlhnz9zfNDflJnrYS3DMUFIC5KN9Nipib1CVXcgSC8CoMQIJ1n7LWgsVOMoWcxLw05VMk0qyX3WtBD3+XIXu44z3q5VyCDZvY/CB/ILkw9E8WDtjZnkpSDFW8/AGuZ0Jswt+HsM7K4QGLR5VSzbh0CNk+8XSIjBoDnCwNjwrLIspZeeNg1EynF/2fxBU650iivZo2GXK4NAXfnJOjQSTQAdVNX6TzuI1xFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/DYXLoF1dvW4sq1eDwQ1BNhCyObPlODETs8A2DKE0B0=;
 b=Glz8XHhKGu/b2DCL2olsPfc4aG7TDe+azXg8+i3v8OKgGKJW66gaVdlcpQlsGk8/mQNxY4p6J+qATSxvTruZb6POYYfIy9Y4dHE73PILTmCFqjnzzv8t0F0lI94JPX9AZ52KiU3CYO3XBavt5Zn/lEW7WAb7sliPpTl4J5KTvs8VyFi6mGhN9ljValnH9G/V9Sl/KoMYuXtrAj8DWEt9lCP9qXykryRGekAXLMHS/jNbeTqvf2p2Cw5ybM/P1rVrdUba4a/XqCwrU6Z631shYbCJiGo/DjYbRs/v2Yoq8trttiB5bSqOeyNySHg7Ypkofh93A4rqbgJh3L4SLn9RRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by IA1PR11MB6396.namprd11.prod.outlook.com (2603:10b6:208:3ab::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 09:45:33 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 09:45:32 +0000
Message-ID: <3d359be5-aa63-4f38-b547-aabc96466321@intel.com>
Date: Fri, 31 Jul 2026 15:15:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/10] drm/i915/vrr: Enable cmrr
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, <uma.shankar@intel.com>,
 <ankit.k.nautiyal@intel.com>
References: <20260730105919.3913412-1-mitulkumar.ajitkumar.golani@intel.com>
 <20260730105919.3913412-11-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260730105919.3913412-11-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0169.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::21) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|IA1PR11MB6396:EE_
X-MS-Office365-Filtering-Correlation-Id: c126f509-8054-434f-7866-08deeee876c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|3023799007|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: /UId5SXMhrABGw2LbbrrO1aWH7Ge+GzmrsQzoA8OYxpDzfvXepgqSW39L+DnYExd4Rt8yNnF1vAWqb9Ph5ZJdFrhrsqX4otvoNXmnvrgiO23BNbWG3ik7cMEGsF491wg4vfc3kmi2hx3pBqzEjohYtjyw2V7OmFNn5O8PsFwm9dGyhlMXDLzIc0AiLgc4YbDsXfFswrexKBOXhWIGxHi658bIPXpMxE9u8w5Zo0jePxsp2NbChcbVbMNB44A4C6v8LTvv4s7X63mpRJViqwUpaF83KjSF9dQRy2m1Y9r4cGh0Y9qlXmMdlBZ5J8v/YuNU95HSKW4MGuY6wRp284XUv/8jc3L6cKrDQUaGvQoAgUw2liF8O5RdiA7d2+t0WQqBDC86SiJYGXcjomQfjebAtl5+jq1FUWoKc2rmYttyhIP6aAB78wH4i4mG231qAahN3ulE7aQDssZR+9wJqjGlvGnJY3lGYkH53X0tbkxH0M94UIPIP0jb5yrLvqohsERJd98U7QUWsTQQIWWM8fWkLizobuKQDNcMDHa2nO3Bb07FS3lk0YuTK/zoEKl04+yrDiW0Bv5F1QpsxJdl5XjlTqgX+8dGTHppICxhYNnEr273n2b/V24fyNmq1HXlo7OGaI3+m+sLnf/Fgt6CLaZPMc9noBrTSJIyHI6KIvxDDQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(3023799007)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEp3VmQyMVh5OWdRckE2Q3VYSGlBNGpYTzhsU1NFemF4Z0xuU2hsbitocUN4?=
 =?utf-8?B?aHBLcjFaemhIbkE0UHlLSUVEUG9aVFVsS0VnZlZNQzN2eFA0a1ZPQUI4V2lU?=
 =?utf-8?B?Qm9kYk9URUhIcFJaMnBZMFNibTlwdHdKaVFlZ21KQitWdnYraU1oZTZnanRD?=
 =?utf-8?B?aGE3RndqV2JOQ29vZmVuN2JFQlRJZFJBMGNMbkxnbVJZMFhxQUtSMVJub2xi?=
 =?utf-8?B?K1lIeHZVRnI0b1R2Y21LMkhLNStQK1NlNWlITnl1STFON1B6K3ZUQzNHaDBW?=
 =?utf-8?B?dHF3NjJyODVBYlROMHJ3K2ZrMTFJbVUwa0R6UUh4aXFPNTNUYVVreUxJaTRK?=
 =?utf-8?B?SlNCbnQybnZTbjZQR2RsYWlWME9sR3g4RzJDcVV0STJSUkw2dWtYVXArdnIv?=
 =?utf-8?B?djBZTGtaYWtkSVBaQzNhUzlYT0h3TVZpdTg5dHF4c2FjeGNsSFF1ZDlabHU1?=
 =?utf-8?B?WFErWFVyS0VwRkdldDBMcDB6QlhETjdHalVqMG5wd3ZhUDJoZllnbEtGY3c5?=
 =?utf-8?B?NzdtYjZBVjdlaUtqc1hob242dEEvbXd0NkxaUEt2VitrTDJndEJCeG00WUs1?=
 =?utf-8?B?K05JU0RNRzNPcUVJTENsbFFYRmh3MFU0SmtNVFU5SVdvRW1iT0VSUk1XVE4y?=
 =?utf-8?B?bVpUS3ZMMXBNblltSVB3Y3FML1JIcjhuU1Y1My9VZGEyT1F6eTg0NjJDT3pO?=
 =?utf-8?B?K09XUnF5bXRGeElwczduVXIzYmF0WEZoQWtEZDJnbHpidGlsSmtqSjlVdERr?=
 =?utf-8?B?UkZXNEczZ3QvdVZtQ0tDWk5QWWFQcmozcVRuK1ZvNndxKzI2N1RMa1IwUGtj?=
 =?utf-8?B?ZVc4VjcxK0Y4TmRSbUJYb3BVMlprdWlzZ0dIeUhFeDhHeDhMRnVsbzBYQ2Zk?=
 =?utf-8?B?RmMwZGhmelNpWTBCemdkUE9KeWdnNlIzZGRQTktLWnFuWVdhV05sU0RDK3Ju?=
 =?utf-8?B?emlqNjA1VGp0TVZuOTR1YTd1OTRuZkZEbU14WXpkaXdkNXdoU0E2bzhXNUhO?=
 =?utf-8?B?V0xic0J0ODk5aGJYM05GUHVYU1MyT0RjWjNSQTUxYUZrZFV0RE0xNDkxREV3?=
 =?utf-8?B?QjdNRksvVzkxdnlBUmxmcmlEbmJEcnY5ZkxUVC9rVzExc1Z6dnZCUm5waHky?=
 =?utf-8?B?SlJnK2ZyWXQvdHo2N1kvc3QxQ2VYa3VOTGFlVXc2V3QxYjlzWU9VZ1ViV2gy?=
 =?utf-8?B?QmtUT0NTVG1kRFY2UVZuZTJUc1RqMlA1NFhXcHUwVXRkblZlQTZGWm53emVN?=
 =?utf-8?B?d25DNGR6QncySzFrT2dTanlUZ1oveDVZa2tnbmlPS0pXYVhKR0piQWlNTkJr?=
 =?utf-8?B?Tmp4cnlOUktxWHh2cXhRSy9SNStPTFl6c0FLL25HcjBja2hSUmFubEkwMmJL?=
 =?utf-8?B?LzJhWE1GU2NORDQ2Z094NUVab09mbVgxczFyOVowMUc1K0Zpb2M4QVM2L1ha?=
 =?utf-8?B?YkIxRWZTbTJIMVBiZDdqWTd5K2pBNTZ3dFcxN3ZvOHgxNERERGl1L0N2dkpS?=
 =?utf-8?B?M3pwWVRtaG5aMjZ0RHN6WlMvenptSFdnbnhNbGd4N0U5OUJ3b1VOMWNPOUxO?=
 =?utf-8?B?OS9STVhaNHlHbzhFeXdsV2VQa01VV0lBRmdaM1laTitIU1N3cHZJZnk1NXVN?=
 =?utf-8?B?dzVEUFBjeEVhTUZtZXZENTNuMXM2U2k1MjBJQnc1OHplU2RGUlQ0Y2UrOHJy?=
 =?utf-8?B?b1pjTHAxM3pzNDlwVFZOSDI0SjZZU3NmSC9kU2doSHB4QVAyTDlwQ2ttQzNp?=
 =?utf-8?B?b0ozOXBmb2V6QXdWbzc5M3NoVE1kZEI1M3lSNktxRDBTa3VQNHpQUUh1Mkcw?=
 =?utf-8?B?cEJSekxaLzVXUEluYlhnWTIvcFlHaE9tMmEwTkk1RlVUU2IzUFp4bktJd2Jj?=
 =?utf-8?B?YjNFZG1XbmNkRDlVZnpUb0gwazY3NE9zZmpmZTErN1QwNU9DdzhmN0w0UUFQ?=
 =?utf-8?B?b0UvRDRCb0FlOTR1aE5UOENBUFJwSEQvdk5pNjBjUDNXdklTWS9uV00wQ2M2?=
 =?utf-8?B?Z1JNS2tpRGNEcWRHMWl1eW5oa24vNHBIcXlNZmhJYjg1RHUwTzRxN1ZGbmJI?=
 =?utf-8?B?SlRkaVBJT0hjejY3TmtNN0xyLzhySmNodlRQNjRteTVYMjRFZHZrQk9RL3Zh?=
 =?utf-8?B?M3VqSkFlOVo4eVIrK3pqeG1kbVNwbGRFcWErVmV0TGVpUWt5RzNweTZVZlJM?=
 =?utf-8?B?UXNqMExYL1k5TlNXRjBycHF4bUdHbzVpOWh5WWM5c2lnNXJ6RzlsWDN6d2I4?=
 =?utf-8?B?TTh6VklYakRtMTVjVjArRXhuU0xLeVpSaEJXaGxGdHpSTUR5RUk4T2FNVXpv?=
 =?utf-8?B?b01jOWZxRjkvYUo1M2liZUV1ZG51OUlrTXZaNkRRamUxVlBBTFVCRUJ1WHRp?=
 =?utf-8?Q?M01n5HH6bdEuuYdk=3D?=
X-Exchange-RoutingPolicyChecked: pT4k0r6Xnl/kMzhy8rsFBocL2OwepVc9m1moSpcDHIVYPQkitzmcSZN145nIuty620QL2REiIgP58tg3EmG2uegjVFpPla8MgCZ5wy3HyiRwm66IMacv/pTECkmcH7lU2yClp/5Q6243PJXzh9vde8m4zJotxtvh3m3OU/JDSXK4kyiv1D+a1Oijhr/WgRQCt17eZo+iryiu2+mb5bxX+3C4AwoKEp/SkqGZJXrpypepi+zpPWmTQg1AcCZ9wHOl0sbrmlYXAp4rZlZr209hkFQL+fw9mit+ayN4S/ciOGcOBNtZ4kPWKaUZpjtT/3rdj/G+/+rZlwaIGHpfpt9XGA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c126f509-8054-434f-7866-08deeee876c3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 09:45:32.8769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yx9zFDdenI+DNwO3gNRcjH9G10Snr5jBJV6qrpV+VaUfIyWbmSaOYty4IDTyt41CxmaWMMaMja+Tk3IupPxvSNa9o7lHq/djmy3wSbwHecs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6396
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



On 7/30/2026 4:29 PM, Mitul Golani wrote:
> Set crtc_state->vrr.cmrr.enable at the end of
> intel_vrr_cmrr_compute_config() so that CMRR is actually enabled once
> the M/N parameters have been computed. This is the final step that
> turns on CMRR, with all the parameter computation handled in the
> earlier patches.
> 
> --v2:
> - Everything else except enable compute to handle before this patch
> (Chaitanya)
> 
> --v3:
> - Remove redundant return from compute config
> 
> --v4:
> - Update CMRR commit message (Chaitanya)
> 

LGTM,

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_vrr.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index 653581ed4e90..e36db1174440 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -269,6 +269,8 @@ intel_vrr_cmrr_compute_config(struct intel_crtc_state *crtc_state)
>   	adjusted_mode->crtc_vtotal = div64_u64_rem(dividend,
>   						   crtc_state->vrr.cmrr.cmrr_n,
>   						   &crtc_state->vrr.cmrr.cmrr_m);
> +
> +	crtc_state->vrr.cmrr.enable = true;
>   }
>   
>   static

