Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E52C5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 10:08:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B6710F264;
	Thu, 13 Aug 2026 10:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y6bNPk0O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A3910F264
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 10:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786615679; x=1818151679;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pqjz6I7dqCwJugOUrjtmOFAjqhTeDixNDfX5Ykd8CQc=;
 b=Y6bNPk0OAi7GmW1J7SSFXnAsoBBaoyRFfeHiCDpRalEMY0HSe24Qve4+
 QVTmYSmw7KHbJ/9Lq1m3QOGlHCGnmcrJZsImMfMMdazgSEd+DYWdUluQp
 sHwsR6TyovkMa1cIpb1F/0aAtpy3e2LF383BbywLeHLJ/0AMBvv5/x4xV
 0KV0k9kGg1/s7VSnFsWaW76MAnNokyiB1BNZAalmTMstP6rAHXUp7BCiU
 OGSLLQuMeG+EayUnvX6SCRv6avmYnv5B8FoDmbik6ObOlM8DZpTqfK/Ci
 8jK59G0sNJlb9mqTJaLTBWq7VXz0cRsftMlkE9X4nJ2ZjZ0IJP53qu55t w==;
X-CSE-ConnectionGUID: Z17NjVqySziSJynAbCfytg==
X-CSE-MsgGUID: NyhlDBt/Qn+8opcaz3vBNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86950036"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="86950036"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 03:07:59 -0700
X-CSE-ConnectionGUID: 8YzXQycdSsyKsMzz/JdTZA==
X-CSE-MsgGUID: 1bxOJOIMQuW1NONxzEuumQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="293846239"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 03:07:59 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 03:07:58 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 03:07:58 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.71) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 03:07:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jpmn+N5BA9DA58f3ndv5ZyWj7ddj/WiRRAGYXjUe9yKWC7EQNX7bAIjxWZK3HMtpa0BcDz9+OmllZGbNjjjZJKHMYNF12iVZqyVDqiQ3GCzHPJx4/WLhXOiUxXIP85Zwuw9fGaZ5QITDllOs4ASyqcRGHg3ewYiCdVv0W//f/cCWJ8dLL3vIxkYHt1DBW3CPY8eyCyKotepKDYDVVJvEvQe0iBgis69Mvkl+EnduRo5n9CYYhjlYYEFS/Qdviso04Bi4eqYFIbIRWLIinZX+MMY94fN614PC7ykfkJprR+2wOiLX06xa0I9wChZvRH4q3hYoliFAjM3yB4MbyNcnvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+k5vW6VXwxB4DYXVkEdk7sux2ogkTZ0wBlqEGtvELo=;
 b=kayvdRHBDD7AOhF7/zLMwA0iJbc0/eWkDu/bTGUWzVqzZxFG3y26cXslJ88OjA+xEtGKqbugMlLuOsFHEDZrXiKUtwfGn2Hc0DObBdtvsdaULwW+8g3y39Q4Ai1Tm0S+AsChfLU2XaSxHrZQhgQHcs+MHa6Ml5lYlRUhuEyY67cJbx2AD6BcD5ccyN0IYCQM5ewTyHji2GHUrT+NHEzlKPDCOQRY6oPeQNz+mlYR49AxYQrICIy9SwVuSAiFCFceOiYcCi5/ML5YNq1IlTGzDmoATFu/e+PGXu5FwdVsJyKPJfz9iUUvsf/T7Bd8tSbhbbT5pgYP++5/EHTk+pVUmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by DS6PR11MB894442.namprd11.prod.outlook.com (2603:10b6:8:529::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Thu, 13 Aug
 2026 10:07:51 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0292.024; Thu, 13 Aug 2026
 10:07:51 +0000
Message-ID: <b0d83bf9-a060-4593-b040-7988b91bef79@intel.com>
Date: Thu, 13 Aug 2026 15:37:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 20/32] drm/xe/survivability: Report 'boot status' using
 SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro
 <riana.tauro@intel.com>, Aravind Iddamsetty <aravind.iddamsetty@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-21-michal.wajdeczko@intel.com>
 <d587a47d-003b-4d20-9412-0ca47c8ce5b3@intel.com>
 <9658c1e5-03ed-4521-94c8-c8bd23e65c99@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <9658c1e5-03ed-4521-94c8-c8bd23e65c99@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0237.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::13) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|DS6PR11MB894442:EE_
X-MS-Office365-Filtering-Correlation-Id: 17d2ec97-4143-4b6e-703e-08def922bc11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: wVHFu4npA1bkUZsX2bS9fYk6sUH1nQ2NZbRyA4dXOmep6CAbVD7iGtUZpet01Zf704ZdbE+QJ8+vaNViS31CYiBkB66Bg9Z94bFwQ36bnLu5F2Kh0AUSxp7LlJJvd/5lykL4Ai2MG48REMqOxVq5bfUc/MHNNlU9EPEDblreYMhv8qdRUKvYMbk82Aje2Ens3FWKc81wqcM0Tp3gK9gwzPq2LkLlUGaKLUb05vG2ebV0to2GIYU2F7Fw7B2aI3HnSRfmcOHFetuZzv43RiAWSGEVMRjnox3r1f4eX9QoDRDQANaDIFRpd1Y4HcyhsfeWnCzn/2lQg28bRy+r64YSmSm2ghbwq6ovLIb3DjhkXQwF1ieIHOsQ53u9Ppa87yQ2j27BW+BYOwqwbu/UP9s/Tcsj2xsSkCtWaiutcrpTuA5cWnpzg2AcPRmmP1v3at05oJHtarr5Nqfdtp19HLft1K6L1JVcErF8TuUHwEapNop45RfVGrZ6uWxeJIyZGvMIqn7UtjSBi3zyJmAxr9VPcx/PQT2lUC5+WNCwzF0q0fQrg1VQ++o7ATSmlys3A+nhaJWFZ9OY3kRxAf/3hjhVE03nfkcXeBp1mgGmIacLejCC67m46797QOVkg/3+R9HrKp/ch58Wy0A0rCTKFEOo95ziaHB3yn4qoUC6bwtxYGU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVpNdjVnMURTSWE1SFE3MkVuZURSY2NTZE02QlYvTmF0RDA3YkFoVjUxZ2pt?=
 =?utf-8?B?SVA1RzdFaXdWUFNuSk92RVlyUURBa2VSYmtQYStoMGtvSHBuTm1tMm9RTndO?=
 =?utf-8?B?Ri9pcFJWZmNhOWw3eTNXaGN2STdlWlJvWGYwOFVwV2NXN1d5OHVjMGtHblQ2?=
 =?utf-8?B?VEpxdk1ndGNrcDlOdHlDTWxvVTNLaVVOanBkRXJpeHlFMVMzV1lxN0pNVEZU?=
 =?utf-8?B?b3ZIdGJBbnBnTk1XQmpHeGdvWEpoS2hyTjdpZXpUVWxObm8ySGc1K21CTnRM?=
 =?utf-8?B?aVhGWWsvTzVTUWRmalFpeFRwdFY3SitvRjdnQ2FzRExFYTloZUs3a3pId3B4?=
 =?utf-8?B?UUdrOXdvWlJ1NDhKNFpuRzB3OTljRkxBUC8rbnFwYjhyWkRCQzRYeVBqZU9K?=
 =?utf-8?B?SEk0ajZ6MzgxN2RyeHVhdGVER0k5NUhZNFBVM2hBb2UrRGk1NTF4a0J3SC9B?=
 =?utf-8?B?c1o3dGdwNytzRjdFOERFUVp1SzY3cEpUcnZHc3dFeU5VME11VGNFZWVGd1RS?=
 =?utf-8?B?SnF5dzUzSWZmVlFZZ3RrOG5FT0UyQ0grbkY2c2FmT1VVUnAxT2toNG43L3VK?=
 =?utf-8?B?d0tjVjcxSG9Sdm5rSzY2anZVN1hWenF3SGFGZ3UwQjA1VlNDUmxPVDUyYTRK?=
 =?utf-8?B?VGRoWTBOYUdabUpXd0NQL0RkQ2VGaStEcUxycUpLQ3owbTF2T25QOHM3YWpk?=
 =?utf-8?B?OS9KSzZTeVpRSmRJV3VPNGNsWHZvZGV0TTFSUmpzM21oTzNhTUtpQXVFQ0Q2?=
 =?utf-8?B?L0kxLzRmNGJ1azNBRkN4THpiNFp4N3hBdEY2WDB2amRkTjFyeU92NXpoaFZK?=
 =?utf-8?B?VlJWL2xMMHlGRk5vdDVuQ3lQK09YQlhVd1pNZWNYd1NxNzExZjJURngvdkdK?=
 =?utf-8?B?RG9lQS9uR2kwWksyRkJONFgxSCsySXJEQlNsSTk0Z2dXRjY5cHdtSnhrM3Jo?=
 =?utf-8?B?S2FCMVljbXVUQ09pYy9QUDltZFVmVXJlUitvZE9FZmI3QXFhVEhFSlFLQnYz?=
 =?utf-8?B?VVlsaWNXUU1PYmp6QldMSG5wbitHT3RseTl4TzBnYWJROGRhS3JaS01BVVRI?=
 =?utf-8?B?QU5yRFBxYXNSRHIzTFRXM2FYV0p6VStGay8yZEIrbWRRcXVvQWRNQlZuV1ZL?=
 =?utf-8?B?MUt4NVhpSU9uSEcwMlMvaHhyNEwzQ3oyMklqZ3hnR2pmdHhqRFN2UVpvTVR5?=
 =?utf-8?B?cGFSdWcxU0ZMV2pyRHo0OVBMaG9XYjFHTU1hbE1rQmtPa1JPMXlDckhUTFJk?=
 =?utf-8?B?Mzh0UjlWK2MrWVpSRm9EQjJTTDdVV2xSbnYxa1ZCODR5Q3BnYXdUM0c1bDJT?=
 =?utf-8?B?WUlIbEJSek1QRHhpYWp5YmVkcE56NWNWNm8xYjRscXhvZm9sWUFQYXRzNkFD?=
 =?utf-8?B?OEVBM09jbUJvamd0bVgvc3g5SUZ6azA2dnh1Z010dlorR3M3SnloS3NvYVpN?=
 =?utf-8?B?ODB1Q1VaVDJHK0ltT2FzV0R6OXkyMU0yYkhVUjhzODhwbW1sUmFkWmhzbjBT?=
 =?utf-8?B?bVFWTm0vL0RzeXZKZG9JdExWaldRaEU5VW1JRTN4ZlBNdmpSSUJmWE40M1px?=
 =?utf-8?B?dEllZGNqYmtTMnp2MkI1d1gvOEJ3WVU5cUlhN0pjQW1uNkxlUEhVa3c2bFNz?=
 =?utf-8?B?SHdwU0NVUVVuNS9SN282Mm9oamNyMVVsYjgwWDJub2VPTnZuV21hYlRTWEc3?=
 =?utf-8?B?OS9IK1ArTEN6ZkpGcGc0T0trOTlIWjBPSWZsNHZXOWNHc1dOR2Y5TFhMeWZ6?=
 =?utf-8?B?VmU1MlZPWXJjQ291eURYVWtGM2c0d2Z6TDdrWUkwRStlMld4NjFCbWlRSG4x?=
 =?utf-8?B?N1lUb1lnN0p2SnJZRTJhT1lFOWduYjFSeTdma3psajJHbXhudWc0dDFrUnBv?=
 =?utf-8?B?NklQTlNMdFZwdnNYWTBlQWZxUXNmdDdJT2NmUVhnOXU3aFNBdW5YTWROSUR3?=
 =?utf-8?B?MHQ1alcwK1hHREJ3dU1mMGRNaDFjMTlpbm8wUzQ2RmVPeFpCb2pNTjZ2WDZo?=
 =?utf-8?B?RGZ4cFFHYnN4RGYzTU1pR2lISlRyYmtRQlhzZmhMMHR6U0hYdmRZZ3AwMXFo?=
 =?utf-8?B?RFk1cFdIaHFEdmpRbG9LbllWQjlyQ3JDVWJiYnVtR0g4ajF6QUdFWitHZjI0?=
 =?utf-8?B?ZTQrMVBtMktVT2FZdG5ybVZzaUgwcTVONmxUYUFSOGZhMTNCRFFHUjdpTFZK?=
 =?utf-8?B?d0tQRElwQU90N1RJYitwam9YVGlPUkltR2xySVFZcFRRVTcrWXViNnhiU3Jo?=
 =?utf-8?B?aTkveW50L09yQWFTL3YyaXdubHFZSmJUcTI2RnFiM0lnZ3E1a3JLUllta0NB?=
 =?utf-8?B?Ny9PS0cwMkZTZFpkTW1QK0JaTjd3dWgzQVB4TWVWQm5sMk5uYjhGbHVMUEZs?=
 =?utf-8?Q?1Aow9eNt1ZgPzrIE=3D?=
X-Exchange-RoutingPolicyChecked: MYiuawMDHVgG1x9PtCM+j6Dk4Rn8HafL2zfXj2Ajl+SBsYgdTEAmJsxvV6h6l7e6QAdjgscxsSnMk/4Yp3J0kbzVxi6+FuAoFotIMZEXC9cfzRcIzcr7gN+smhPgVsOF142FtT1ajiVUh9v2yvokcfKoo8xYye9sCxYZvl6hNSR2VyhugXxe69V2faml0JQETW0hPui6A0UC0Z6YJVm+5vGZMiBjsxr8b1tcTLrM5Foiy1lkUOh7XJaqjQ55jyBI5Xb3pXVXONwaJFn3AsdeBdBF3Bxm7IU9jjd8jM9T6LGxslqMn6zMCenE1eTppiFsKlV+VZmNT9+1alcXV+myqw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d2ec97-4143-4b6e-703e-08def922bc11
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 10:07:51.3858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6wDVvdNHR7q+o7N7YixioKnvZs51KfVz/5LhbzAtIRugrRNFDFBVmbSlcDd0h1bYr+T2mmC0Z/259gCkPp27vPyPvFFlgChXeDpsTj1di+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB894442
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


On 13-08-2026 02:58 pm, Michal Wajdeczko wrote:
>
> On 8/13/2026 10:38 AM, Mallesh, Koujalagi wrote:
>> On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
>>> Report 'boot status' details using xe_log_err_fatal/info() macros.
>>> While around, move static helper code closer to the caller and let
>>> it take xe instead of pdev.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_survivability_mode.c | 35 ++++++++++++----------
>>>   1 file changed, 19 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>> index 4c506027fa94..85b4c125a217 100644
>>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>> @@ -14,6 +14,7 @@
>>>   #include "xe_device.h"
>>>   #include "xe_heci_gsc.h"
>>>   #include "xe_i2c.h"
>>> +#include "xe_log.h"
>>>   #include "xe_mmio.h"
>>>   #include "xe_nvm.h"
>>>   #include "xe_pcode_api.h"
>>> @@ -172,21 +173,6 @@ static void populate_survivability_info(struct xe_device *xe)
>>>   	}
>>>   }
>>>   
>>> -static void log_survivability_info(struct pci_dev *pdev)
>>> -{
>>> -	struct xe_device *xe = pdev_to_xe_device(pdev);
>>> -	struct xe_survivability *survivability = &xe->survivability;
>>> -	u32 *info = survivability->info;
>>> -	int id;
>>> -
>>> -	dev_info(&pdev->dev, "Survivability Boot Status : Critical Failure (%d)\n",
>>> -		 survivability->boot_status);
>>> -	for (id = 0; id < MAX_SCRATCH_REG; id++) {
>>> -		if (info[id])
>>> -			dev_info(&pdev->dev, "%s: 0x%x\n", reg_map[id], info[id]);
>>> -	}
>>> -}
>>> -
>>>   static int check_boot_failure(struct xe_device *xe)
>>>   {
>>>   	struct xe_survivability *survivability = &xe->survivability;
>>> @@ -429,6 +415,23 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>>>   	dev_err(&pdev->dev, "Firmware flash required, Please refer to the userspace documentation for more details!\n");
>>>   }
>>>   
>>> +static void log_survivability_info(struct xe_device *xe)
>>> +{
>>> +	struct xe_survivability *survivability = &xe->survivability;
>>> +	u32 *info = survivability->info;
>>> +	int id;
>>> +
>>> +	xe_log_err_fatal(xe, SURVIVABILITY, -ENXIO, "Boot Status: %s (%u)\n",
>>> +			 survivability->boot_status == CRITICAL_FAILURE ?
>>> +			 "Critical Failure" : "Other", survivability->boot_status);
>> Since log_survivability_info is called when survivability->boot_status == CRITICAL_FAILURE true, so please use "Critical Failure"  string directly.
> well, that's the current usage and function name didn't strictly say "log critical failure" only
>
> btw, printing fixed "Critical Failure" string followed by flexible %d also doesn't make sense IMO
>
> that's why I decided to make this function more flexible and reusable if needed

Totally agreed, u made it generic one, however current usage, we never 
going to hit "Other" case, which is dead here.

btw, "Other" is "Non Critical Failure" right?


Thanks,

-/Mallesh

>
>> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>
>>> +
>>> +	for (id = 0; id < MAX_SCRATCH_REG; id++) {
>>> +		if (!info[id])
>>> +			continue;
>>> +		xe_log_info(xe, SURVIVABILITY, "%s: %#x\n", reg_map[id], info[id]);
>>> +	}
>>> +}
>>> +
>>>   /**
>>>    * xe_survivability_mode_boot_enable - Initialize and enable boot survivability mode
>>>    * @xe: xe device instance
>>> @@ -452,7 +455,7 @@ int xe_survivability_mode_boot_enable(struct xe_device *xe)
>>>   	 * v2 supports survivability mode for critical errors
>>>   	 */
>>>   	if (survivability->version < 2  && survivability->boot_status == CRITICAL_FAILURE) {
>>> -		log_survivability_info(pdev);
>>> +		log_survivability_info(xe);
>>>   		return -ENXIO;
>>>   	}
>>>   
