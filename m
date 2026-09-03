Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F01DC624D6
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 22:21:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D7810E21C;
	Thu,  3 Sep 2026 22:21:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GNPB8ioU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D50C610E21C
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 22:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788474105; x=1820010105;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UJ3mOhwGb6x7aL55U1feYEOY0XTRwoRebdJIDgpz91k=;
 b=GNPB8ioUfLKctSjYZYSCc5rS8bY7yqcAmbrQeOSKohGIy0f2+IrYnBS1
 APPtkPVrzD2yoMA9BP9igzJj7c7KWPa8CzAwDdtIXf+mad+LgWS18B7qN
 O8b1wd85rWfZvPU0PmuP5ZcFE/DuRSacUKQvDAV08qRtlZupZipCsvHB/
 vAe3tQPgNcIywyyo4dg8OUvw1I+wC+c9qUPZHMINrqEfKN2xmqg2a3SI5
 UsHCnG2azVXjJcfNVhq5MtUy2mzGE3Rz8npuo9ZJLheitXSCRisDMUmud
 85VodlBI0XmXR1eRPmQckEf95fnot5zGXociGKxiewRtxS73t+9OjO6Hd g==;
X-CSE-ConnectionGUID: DW7zFI1qRl+OCNUiUrwu5Q==
X-CSE-MsgGUID: nk95UMgLTAWmj7ALLmJzGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="100331052"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="100331052"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 15:21:27 -0700
X-CSE-ConnectionGUID: KtA+UJ/ORbCivQVeMFkG0Q==
X-CSE-MsgGUID: ehdv5S/RQN2xB/xUVekOZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="266183216"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 15:21:27 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 15:21:26 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 15:21:26 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.29) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 15:21:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lyBASIgNwLQqv6lDw4BMJg69TnVsW3ArMWq0OguMlGfzsOeZfQN2ZoV4w2MWAT2fIgTYBAcVgMClyj+ip2TsPaCzwhucWlsLf8gZcw5ceUCwXC+zncpth3BlTUNItRMTW/gfWbGpOvKQA3ANXzaDornLLkJ73pKDZgB8DskzX3Ay+02xXKyr2eeVQItqVdzIA3NaONW9PgeyL+20gxRmfdNwRMsy7T03C7V5lOKAe1pKEnWrOWDKl7CxZUyR+yBD23EQbuzrzD/leylXzTdykI6tKs1vdB9Nh4v5D7CCpyDU+K24ahI4xXKutuQ5wgQd/Hx+SXu8yGhkUIrAUO6yyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mW44x8kaU0igxaojXmNxgi7sGlBLPrwArHNh0K/8Az8=;
 b=KNQvm+kEz9JPVhiJrVoYoM442tcBl/OWtdMx2mAE8IUQD5CgDqdnLS+6obEDQsG1xlLSbSquZ9a8ulsqvF9NXDjQSING3DUkJYI4L7Jtg9Xx2Ag8fZpCy7LfZBj5daJOUXmr/nJvGKFHHAywn0gd2ALW3dg/dk8HZPIvVFxf29OCpCy+MuwGjeUjWPtDaZPoaAgo+iIfvitbzAaRRUm2jevYAgX+ww+EIPxPYRQbc3z/iToaLR+YO6cES+UkhhqO7vTRcV+xlV5vg45lVU1cGnDRxDFUx2TT8XgzEIoaRj4LVPG/f5l2PetqtAM9cRZD5KbFcYRFV0rFfYNMcarX0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS7PR11MB6102.namprd11.prod.outlook.com (2603:10b6:8:85::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 22:21:20 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0382.007; Thu, 3 Sep 2026
 22:21:20 +0000
Date: Thu, 3 Sep 2026 15:21:17 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, <daniele.ceraolospurio@intel.com>,
 <aravind.iddamsetty@intel.com>, <mallesh.koujalagi@intel.com>,
 <alan.previn.teres.alexis@intel.com>, <julia.filipchuk@intel.com>
Subject: Re: [PATCH v2 5/5] drm/xe/guc: Report errors that cause a CT
 shutdown using SIGID
Message-ID: <apny3VzXzdKkQ6RJ@soc-5CG1426VCC.clients.intel.com>
References: <20260901211204.131972-7-umesh.nerlige.ramappa@intel.com>
 <20260901211204.131972-12-umesh.nerlige.ramappa@intel.com>
 <d0872861-940b-4afe-a027-d476372373cf@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <d0872861-940b-4afe-a027-d476372373cf@intel.com>
X-ClientProxiedBy: MW4PR02CA0026.namprd02.prod.outlook.com
 (2603:10b6:303:16d::25) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS7PR11MB6102:EE_
X-MS-Office365-Filtering-Correlation-Id: fc418606-9d6f-4d32-888c-08df0a09ae10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|6133799003|56012099006|10067099003|5023799004|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 0Fow8NGwoF/XwN3f/ITdypTi4VM/961sxyFkyaVv389guQVkdycOALhwAliZqKX8EuBA90R69tGM1CdTFWilcesYKlGXMrZ0QnhDC/m/Rt8Zm9d/okHjwTfZ2IRr9SmyB4mX8rl37/Yf2Z+tNf4LUxmIjcFWqOwYHH2zprffXUGse+tbY/yrOIeJ+ZIRrYGsyyORawEcggl1yz9OV7nlbpmWKZeXcToq20hoNAVkVuyD5MPXNEAZmKK8GlcJdUHquRikuPjEcccI2hY9g1wRkRl63EaVzOt9nvGeBE5olLjgFHt617kTecUsSVJF4yzSZSp57c5X88QByIXjgRxtehX0Fxl7nB49yxSZDVjHphbhNECEQ6J90d0NIvKH8k/43yhtBCF6EoKlzxGZmWDEjT1Jvw/WTmEzbHpWg5J8waClFrHV+LW01pmll4u7yQ92m/LP+xlPhDMSg7+LTyO7W8Z1ehINj9h5G52QGDc3EkfUUQYm0k9ShAWxLtlw0xUSQPkh3GUW2ijV/GX1MA8sD/Rzm3cSybj2fT4mnJMfuXyIXC7bC2YW6eL8+shXUnpMgYD/2WjSIs26X23ePtFKr/ZxC+nkzOTZUDd+Wrcex2CFUWQYlGijIhJfmGmPlE6kvrls8MES/S6hVWloGdzZ6kIDneIlT+BNzEcFE4cLYhQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(56012099006)(10067099003)(5023799004)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjRCMExMTVU2QS95SWJmemZQYXZTcFZKay9GUHdrcWxnOE9TRmZ5QitFYkQy?=
 =?utf-8?B?d01jdlRmQzdFSGs1U3JYSW91cWtkWW9FTXNTWTA1eEFXWjJucVdDaHVDRVBv?=
 =?utf-8?B?bG14M2hFaVpNREJwNEpkVWZiYzFZc3p6NVV5SnBmSkhnd2xzSEdxdXVJb2hy?=
 =?utf-8?B?c1FhbEdkcnR1VW9KU0hidEZ1Z2Nrd2RKdDg2ak1Fbm56ZHEzdzI1WW9CbjFm?=
 =?utf-8?B?VWZReUVRRDVrZXlOLy9VdkFreGYzVDhYVEwrd2gwQ204WTJRUjJTVVBsVVpK?=
 =?utf-8?B?ZWFlbDNzbW1MM2RjeEhDNFNVVS8yTWFnRTduYnhYUy9wNDVBOENGYytZb24r?=
 =?utf-8?B?dnFycVlvRlEzV24rWks3c25QbHZnRStwTjNlMkJGdFVDdVhHOUJlWUljeXR5?=
 =?utf-8?B?SE9VY2MwNDJuTlV5MDhZSVJBN0lkaEZ3bFV4WHREMno1NXloc013M0o1aHVH?=
 =?utf-8?B?VEd6NlM0eHFOd1Y4SHQ5TnRNTUwwUyttMlEvelE5aFdYQWl2N2tCSlNlcVAw?=
 =?utf-8?B?KzZUS2hTZ2FManE2b2ZueVVUb3BUVmIvWnpkTU5nU2VrQVhDRVNvdVBtaWor?=
 =?utf-8?B?QUErdXNGbDF5REdacmN0akdIRFlBaENWc3N6K2ZNNHZkeE9TMXk3dExZQUN6?=
 =?utf-8?B?eVBsc25iRjJCbm9TTXNGYUNHUGZYRlZmOG40R2gzRXhwdzlNMlhxZHY1dzlS?=
 =?utf-8?B?RXVvenVNaUkrREhzOEh4UXhaMnMrbGo4Rmw3NTE2SURyS3J0cEJrd0w3WkVh?=
 =?utf-8?B?TjNNWXgxTGE3UmIyQnh0di95ZXJwc1ZvNitURFk3cmVsSmQvU0xnOFlXZXFN?=
 =?utf-8?B?bkk3d1JsUk04UzlKUmg5SVNyajZ6N2FBN1EzTEwzY2ZoK1R4elE5cVhFREl4?=
 =?utf-8?B?WGlwMkdvcUZMNVZFSTJ4TmFEV0hVRysweExpcFRzTzJ4WHRBRzBZaHRyS3gz?=
 =?utf-8?B?UG92T3JvOGZlLzVoWmE2RUk0N3lNUGxvVTh2bHIyZ1FaZ0QxVmRoVW1JWVJF?=
 =?utf-8?B?ell4SkE4N2xqbERDWTRBcnVXdXRXYVM0TWVabHdHWkNLdVZwSXRrSzlzdEEz?=
 =?utf-8?B?Q3loSUhsN1dIL3pOSTkzMW9hM1ZDbXo5Vk94bFZxclRNaEdkLzNBVUM1K2gz?=
 =?utf-8?B?NnlGOUJYMUtUaFFtMHBWN29JK0VDbnBrck1DZUZ3WGhXbWwrZTFXTURsYWpv?=
 =?utf-8?B?Mjl4UGwvdE12ZDIwMkRHQUcrS1c1a0psQ3Z1V3dUeUNKQ0RUTXhsRGFQQnNS?=
 =?utf-8?B?QzFlNTVrY3NWNzJFem5obzgwYlRPb2pISjJSYmU0aXppQ292VllCS0FtZkt1?=
 =?utf-8?B?eUt5Snc5S1EycDV0clF4ZUZVL0VSSXY2SStHQU9nMGpPaHBuNTZGL0NocWtQ?=
 =?utf-8?B?M0o2a29XTE5naElCTzhlRFdjUVZmUXRIaEo0OFRvYTl3VmFjSnIyWm1hUDNw?=
 =?utf-8?B?Ri9ya3MrOVNTOXIrZWE2U2xxWkgyN3FBQ3Q2bnIwREdVVXkvYU9HREluSDF5?=
 =?utf-8?B?azB1TSs5SkppL3pBUmo3bjdTQ3ZTSWxWTWk4S2FLNXI0NDYxeTdzLzM3ZkRN?=
 =?utf-8?B?bGw3NU8rdittbXJ6MjNIeUJaakljMVIwdmdJTk11MUhlV2QwcVVRYlZnN2dO?=
 =?utf-8?B?bDRSMHI5THZ5Ti91Qld5dlBtRFVRSC96UFRkUUZ6L0lneVUwb2E5OXAvaER4?=
 =?utf-8?B?UzBXTDNqc0R2S0ZSZ2JXL2swZExhWXJzeVhiWXJvV1BpL3lOMGFUQVY3cFc4?=
 =?utf-8?B?SjNVVnEwVUhlL3lGVXhFaHVWdnFDb1Y4RjZkeGM4SlJIbElEcEx5Tk9WWmxF?=
 =?utf-8?B?cEQzZnFacEI2MEIzSitpQmRtWkZ2N3pqYWpZcFdPdExMNEZOM0lEd3VCSVB6?=
 =?utf-8?B?Mk15R3hFWkNsdUlPL2V0Y1ZNMThoQm5yV2ZYNDlTR0swSTVrYzNBdHBmc1hl?=
 =?utf-8?B?OERDL3l6WkozTmN6ZUVjcnJkTkJPMWkwMEZCSkxzL2dhYWpOWnVlMVh5MTly?=
 =?utf-8?B?a0ZWNzl2WWg3aXJpM1dza1Q1TGtBRXNaSDVCQUI5ODhqL0thTkQrQml3djVo?=
 =?utf-8?B?NHNCeTQwOFNKdW43UHdPZ1U0Qk1VRDExbmw2c2IrdXBiWFNXdHdYT25XN3F3?=
 =?utf-8?B?dUwyZXFiKy95S2QyS05TMVZOUm5jejAyM0REQ1NncE54YVFNdHJJMXM2YnBw?=
 =?utf-8?B?cng2dC9NL1ArREdEWlVuUTlDSi9PZmpTUFk5c3lxQkxHbW9hQzVuRFJYMjNK?=
 =?utf-8?B?M2hWSXNVVzMvVnpsdUtxYzNjYkR5VjhTQUhvRU02MVRrZE5uNnBpN3pNUlNq?=
 =?utf-8?B?UmNiY29jNWswTjBVWUN1VXJQR2Z6YnM2N3NNMXp1RURiU1p0T1BWWWhTbHc2?=
 =?utf-8?Q?yySWDJapC35MfGBqkIB96NJKtxvJn3E9pN3wp?=
X-Exchange-RoutingPolicyChecked: CHaX9CB+MxquqOFW2easQznXdpTF4BIvMdZr28tWArZdF3/Ir5Qq6GeZMx4FROoUfP69cUvFQUxR0gUyi44Fu8nSG82Ak06Jz5mLweO3prgJY9UX3+jGD09apC+ykdgmZPwkdGk2jbZWO63D5+tHk/jDnWziv/mTrFzQOtcfHqUiJIBRmzlhE9Q9SmqrB24jBB8iK4uu955vqCkuZoGtO1jFYU7fQ4cwK0OzwYILZ2pb/Bl9fuCUbMjbPsU40DRn4lDuN65PAdh59onI4JSD1seKsUi5K+ArACHF6bdYeZmRdNHXrlc0TehBELjK8782rzWS4naNv6kZdarrXXJeKw==
X-MS-Exchange-CrossTenant-Network-Message-Id: fc418606-9d6f-4d32-888c-08df0a09ae10
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 22:21:20.3491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CuBy+pXHc6Gh3a2EOqeWEv0vUxB3wefz6DbzdB4qLfeObtEVxSrAroGPy4kQnndBhumBpv2fF6FewtpNr0pHawScPNf6rWNB8b3yW0eVW50=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6102
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

I forgot to include the list on one of the responses and it branched 
off. Here it is:

On Wed, Sep 02, 2026 at 04:45:22PM +0200, Michal Wajdeczko wrote:
>
>
>On 9/1/2026 11:12 PM, Umesh Nerlige Ramappa wrote:
>> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>
>> Convert any errors that can cause the CT to be declared as dead to
>> use the xe_log_err() helper. Errors that are escalated to the callers
>> are left for the caller to report with SIGID if needed.
>> While at it, update some of the error messages to make what went wrong
>> clearer.
>>
>> v2: use different error codes for different errors, better messages (Michal)
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> Cc: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
>> Cc: Julia Filipchuk <julia.filipchuk@intel.com>
>> Assisted-by: Claude:claude-opus-5
>> ---
>>  drivers/gpu/drm/xe/xe_guc_ct.c | 89 +++++++++++++++++++---------------
>>  1 file changed, 49 insertions(+), 40 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index dcd457f38b89..cf347f960166 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -30,6 +30,7 @@
>>  #include "xe_guc_relay.h"
>>  #include "xe_guc_submit.h"
>>  #include "xe_guc_tlb_inval.h"
>> +#include "xe_log.h"
>>  #include "xe_map.h"
>>  #include "xe_page_reclaim.h"
>>  #include "xe_pm.h"
>> @@ -679,7 +680,7 @@ static int __xe_guc_ct_start(struct xe_guc_ct *ct, bool needs_register)
>>  	return 0;
>>
>>  err_out:
>> -	xe_gt_err(gt, "Failed to enable GuC CT (%pe)\n", ERR_PTR(err));
>> +	xe_log_err(gt, GUC, err, "Failed to enable CT\n");
>
>just wondering, if maybe we should add new component
>
>	define(DRIVER, 8, GUCCT, RUNTIME_FW, "GuC CTB communication")		\
>or	define(DRIVER, 8, CTB, RUNTIME_FW, "GuC CTB communication")		\
>
>so the messages will look like:
>
>	[drm] *ERROR* SIGID=104 (-EXXXX) Tile0: GT1: CTB: Initialization error
>	[drm] *ERROR* SIGID=104 (-EPIPE) Tile0: GT1: CTB: invalid head offset ...
>

[Umesh]
CTB itself does not sound like a component in itself, so I would lean on 
just having one component for all of GuC and just use CTB in the logs 
where relevant.

[Michal]
existing messages were like:

      [drm] *ERROR* Tile0: GT1: CT: Initialization error (-EXXXX)
      [drm] *ERROR* Tile0: GT1: CT: invalid head offset ...

so IMO adding CTB tag as official component isn't that bad idea

or we can add GUC_CTB if CTB alone is not enough

note that the SIGID will be the same as in plain GUC component it is 
just for a better/more friendly printout

[Umesh]
I just added a CT: prefix to the log strings. I agree that it can be 
hidden into a new TAG, but I am not clear on what defines a component. I 
thought it is a logical SW entity - like GuC (since everything in KMD is 
a GuC interface). CT is just a means of using the interface.

Thanks,
Umesh

>
>>  	CT_DEAD(ct, NULL, SETUP);
>>
>>  	return err;
>> @@ -803,8 +804,9 @@ static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
>>
>>  			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>>
>> -			xe_gt_err(ct_to_gt(ct), "CT: invalid head offset %u >= %u)\n",
>> -				  h2g->info.head, h2g->info.size);
>> +			xe_log_err(ct_to_gt(ct), GUC, -EPIPE,
>> +				   "CT: invalid head offset %u >= %u)\n",
>> +				   h2g->info.head, h2g->info.size);
>>  			CT_DEAD(ct, h2g, H2G_HAS_ROOM);
>>  			return false;
>>  		}
>> @@ -873,12 +875,13 @@ static void __g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
>>  	bad |= !ct->g2h_outstanding;
>>
>>  	if (bad) {
>> -		xe_gt_err(ct_to_gt(ct), "Invalid G2H release: %d + %d vs %d - %d -> %d vs %d, outstanding = %d!\n",
>> -			  ct->ctbs.g2h.info.space, g2h_len,
>> -			  ct->ctbs.g2h.info.size, ct->ctbs.g2h.info.resv_space,
>> -			  ct->ctbs.g2h.info.space + g2h_len,
>> -			  ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space,
>> -			  ct->g2h_outstanding);
>> +		xe_log_err(ct_to_gt(ct), GUC, -ETOOMANYREFS,
>> +			   "Invalid G2H release: %d + %d vs %d - %d -> %d vs %d, outstanding = %d!\n",
>> +			   ct->ctbs.g2h.info.space, g2h_len,
>> +			   ct->ctbs.g2h.info.size, ct->ctbs.g2h.info.resv_space,
>> +			   ct->ctbs.g2h.info.space + g2h_len,
>> +			   ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space,
>> +			   ct->g2h_outstanding);
>>  		CT_DEAD(ct, &ct->ctbs.g2h, G2H_RELEASE);
>>  		return;
>>  	}
>> @@ -963,23 +966,26 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>  		desc_status = desc_read(xe, h2g, status);
>>  		if (desc_status) {
>>  			err = -EPROTO;
>> -			xe_gt_err(gt, "CT write: non-zero status: %u\n", desc_status);
>> +			xe_log_err(gt, GUC, err,
>> +				   "CT write: non-zero status: %u\n", desc_status);
>>  			goto corrupted;
>>  		}
>>
>>  		if (tail > h2g->info.size) {
>>  			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>>  			err = -EPROTO;
>> -			xe_gt_err(gt, "CT write: tail out of range: %u vs %u\n",
>> -				  tail, h2g->info.size);
>> +			xe_log_err(gt, GUC, err,
>> +				   "CT write: tail out of range: %u vs %u\n",
>> +				   tail, h2g->info.size);
>>  			goto corrupted;
>>  		}
>>
>>  		if (desc_head >= h2g->info.size) {
>>  			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>>  			err = -EPIPE;
>> -			xe_gt_err(gt, "CT write: invalid head offset %u >= %u)\n",
>> -				  desc_head, h2g->info.size);
>> +			xe_log_err(gt, GUC, err,
>> +				   "CT write: invalid head offset %u >= %u)\n",
>> +				   desc_head, h2g->info.size);
>>  			goto corrupted;
>>  		}
>>  	}
>> @@ -1224,7 +1230,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>  	return ret;
>>
>>  broken:
>> -	xe_gt_err(gt, "No forward process on H2G, reset required\n");
>> +	xe_log_err(gt, GUC, -EDEADLK, "No forward process on H2G, reset required\n");
>>  	CT_DEAD(ct, &ct->ctbs.h2g, DEADLOCK);
>>
>>  	return -EDEADLK;
>> @@ -1562,11 +1568,12 @@ static int guc_crash_process_msg(struct xe_guc_ct *ct, u32 action)
>>  	struct xe_gt *gt = ct_to_gt(ct);
>>
>>  	if (action == XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED)
>> -		xe_gt_err(gt, "GuC Crash dump notification\n");
>> +		xe_log_err(gt, GUC, -EHOSTDOWN, "GuC Crash dump notification\n");
>>  	else if (action == XE_GUC_ACTION_NOTIFY_EXCEPTION)
>> -		xe_gt_err(gt, "GuC Exception notification\n");
>> +		xe_log_err(gt, GUC, -EHOSTDOWN, "GuC Exception notification\n");
>>  	else
>> -		xe_gt_err(gt, "Unknown GuC crash notification: 0x%04X\n", action);
>> +		xe_log_err(gt, GUC, -EHOSTDOWN,
>> +			   "Unknown GuC crash notification: 0x%04X\n", action);
>
>note that for the GUC component there will be "GUC: " prefix added by the xe_log()
>
>	"Crash dump notification\n"
>	"Exception notification\n"
>	"Unknown crash notification\n"
>
>
>>
>>  	CT_DEAD(ct, NULL, CRASH);
>>
>> @@ -1599,14 +1606,16 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>
>>  		if (type == GUC_HXG_TYPE_RESPONSE_FAILURE) {
>>  			err = -EBADE;
>> -			xe_gt_err(gt, "FAST_REQ H2G fence 0x%x failed! e=0x%x, h=%u\n",
>> -				  fence,
>> -				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]),
>> -				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]));
>> +			xe_log_err(gt, GUC, err,
>> +				   "FAST_REQ H2G fence 0x%x failed! e=0x%x, h=%u\n",
>> +				   fence,
>> +				   FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]),
>> +				   FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]));
>>  		} else {
>>  			err = -EPROTO;
>> -			xe_gt_err(gt, "unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
>> -				  type, fence);
>> +			xe_log_err(gt, GUC, err,
>> +				   "unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
>> +				    type, fence);
>>  		}
>>
>>  		fast_req_report(ct, fence);
>> @@ -1683,8 +1692,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>
>>  	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg[0]);
>>  	if (unlikely(origin != GUC_HXG_ORIGIN_GUC)) {
>> -		xe_gt_err(gt, "G2H channel broken on read, origin=%u, reset required\n",
>> -			  origin);
>> +		xe_log_err(gt, GUC, -EBADMSG, "Invalid G2H origin=%u, reset required\n", origin);
>>  		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_ORIGIN);
>>
>>  		return -EPROTO;
>> @@ -1702,8 +1710,9 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>  		ret = parse_g2h_response(ct, msg, len);
>>  		break;
>>  	default:
>> -		xe_gt_err(gt, "G2H channel broken on read, type=%u, reset required\n",
>> -			  type);
>> +		xe_log_err(gt, GUC, -EOPNOTSUPP,
>> +			   "Unexpected G2H message type %u, reset required\n",
>> +			   type);
>>  		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_TYPE);
>>
>>  		ret = -EOPNOTSUPP;
>> @@ -1801,8 +1810,8 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>  	}
>>
>>  	if (ret) {
>> -		xe_gt_err(gt, "G2H action %#04x failed (%pe) len %u msg %*ph\n",
>> -			  action, ERR_PTR(ret), hxg_len, (int)sizeof(u32) * hxg_len, hxg);
>> +		xe_log_err(gt, GUC, ret, "G2H action %#04x failed len %u msg %*ph\n",
>> +			   action, hxg_len, (int)sizeof(u32) * hxg_len, hxg);
>>  		CT_DEAD(ct, NULL, PROCESS_FAILED);
>>  	}
>>
>> @@ -1852,7 +1861,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>
>>  		if (desc_status) {
>>  			err = -EIO;
>> -			xe_gt_err(gt, "CT read: non-zero status: %u\n", desc_status);
>> +			xe_log_err(gt, GUC, err, "CT read: non-zero status: %u\n", desc_status);
>>  			goto corrupted;
>>  		}
>>  	}
>> @@ -1884,16 +1893,16 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>  		if (g2h->info.head > g2h->info.size) {
>>  			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>>  			err = -ERANGE;
>> -			xe_gt_err(gt, "CT read: head out of range: %u vs %u\n",
>> -				  g2h->info.head, g2h->info.size);
>> +			xe_log_err(gt, GUC, err, "CT read: head out of range: %u vs %u\n",
>> +				   g2h->info.head, g2h->info.size);
>>  			goto corrupted;
>>  		}
>>
>>  		if (desc_tail >= g2h->info.size) {
>>  			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>>  			err = -ERANGE;
>> -			xe_gt_err(gt, "CT read: invalid tail offset %u >= %u)\n",
>> -				  desc_tail, g2h->info.size);
>> +			xe_log_err(gt, GUC, err, "CT read: invalid tail offset %u >= %u)\n",
>> +				   desc_tail, g2h->info.size);
>>  			goto corrupted;
>>  		}
>>  	}
>> @@ -1913,8 +1922,9 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>  	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
>>  	if (len > avail) {
>>  		err = -EBADMSG;
>> -		xe_gt_err(gt, "G2H channel broken on read, avail=%d, len=%d, reset required\n",
>> -			  avail, len);
>> +		xe_log_err(gt, GUC, err,
>> +			   "G2H channel broken on read, avail=%d, len=%d, reset required\n",
>> +			   avail, len);
>>  		goto corrupted;
>>  	}
>>
>> @@ -1996,8 +2006,7 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>  	}
>>
>>  	if (ret) {
>> -		xe_gt_err(gt, "G2H action 0x%04x failed (%pe)\n",
>> -			  action, ERR_PTR(ret));
>> +		xe_log_err(gt, GUC, ret, "G2H action 0x%04x failed\n", action);
>>  		CT_DEAD(ct, NULL, FAST_G2H);
>>  	}
>>  }
>> @@ -2116,7 +2125,7 @@ static void receive_g2h(struct xe_guc_ct *ct)
>>  		mutex_unlock(&ct->lock);
>>
>>  		if (unlikely(ret < 0 && g2h_err_is_fatal(ret))) {
>> -			xe_gt_err(ct_to_gt(ct), "CT dequeue failed (%pe)\n", ERR_PTR(ret));
>> +			xe_log_err(ct_to_gt(ct), GUC, ret, "CT dequeue failed, forcing GT reset\n");
>>  			CT_DEAD(ct, NULL, G2H_RECV);
>>  			kick_reset(ct);
>>  		}
>
