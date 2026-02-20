Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DDCC5ACC1
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 16:44:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D7D210E1D0;
	Fri, 20 Feb 2026 16:44:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X+kDktBM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3008310E1D0
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 16:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771605844; x=1803141844;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=DtuD0AooK9NaxUIMc8bjsaVmpzJ2oKRhdxNIDaNaDHI=;
 b=X+kDktBMnNCP6z+FdsmLJm2UEf8lC6fIQYowxJbf+lJAsdqg237YSOel
 jyHHnUQuaeLqhQszBsYNHCGqsOjaFZu1i+EsrUbUHmIH+8OIlnPEb4IVo
 9bqxqesbU2Jza9t0MEMcStQ8/zdg8OOQrNiFtjTu1sXFdJeWovs/4UDyp
 0KGCoarCsVuFT8TvqJz1ySfsf3F0L8BoapHMl8km8MUOgiCT+LVKzcMBJ
 rxwm9om/1B7JidiLszd1ljpkSluGLPIO2P0qtHOYhS5sCn+W0Q5pbL+xC
 rCy3a8TkLIMcmhvyc9cY6Eo4zObUAU/9dJxYrw2kElW69ckSGWGEU0Mmh w==;
X-CSE-ConnectionGUID: 8M3ILARLQaCO6AeV1ZNKbg==
X-CSE-MsgGUID: kmxSfWyVTCiPPlbUxxnVDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="83018717"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208,217";a="83018717"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 08:44:03 -0800
X-CSE-ConnectionGUID: G08GMbLdRpe0da8X4e/z8Q==
X-CSE-MsgGUID: vc91iFY0Ram6XQzaECTeJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
 d="scan'208,217";a="219036943"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 08:44:03 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 08:44:03 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 20 Feb 2026 08:44:03 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.21) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 08:44:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GUlQEbBmMtE97m8WzpbQFcwBOdiuwYkZx9wdpPZApoD08F3Hr++t+D6lkQ3yH1CD/eylr7hxwIoY22+rTyJSdv4ql+XUiIwNqeArhKqUVGjuvjtWhGKT3PWsu/kuDn23rQDSa+ec++el5gwGLNfEkXh8pkrEWsGAPNzd9g/sv9xr6fjsGOnjOx+X5B/RGRdJQE+DiVHlAmw1yne3rZow93X9jWSgO10kP9MrnYPmvharHA9188FL3XiEkaH3X3vPGvqhdWAyzelYIskesep5sinoA7Wjn5AfBWPkbPraFpKBNJzU+rT1yXQkcmpjwaoYpJq2orrNQV4Pg3QGHY0/XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtGpyDqDWX4m363aX3uM5ADKpqtoBmtYV7FZpjOhdqQ=;
 b=U5jsqJ8KU6yLB82YtfEgWrvVHMoXZq37Rs6Rj75V3MRgd8RBfSPunjaUVME7PSPdWl54OfTJlETkCgPF7cGXZC3vMTFokasK2KWiJKQ2RdnNte25Qgx0ezIuwNLipmyp5QtcBMaSWXnXO4mL5j/92higOF7yAd/jIfbG8mwuwzFeM8mKA/L8zurKoNxvbnuC9M82edk63p+lKkazlc54QBgsRqBeQI20/DHKB0d+GLD1Rt0RfB1Dt31S83lH68WPcO69qci2kADNQg5N/QZ4g7X0/6v67uUIzfaZ6Lnrwx0+5YD+k6RYXTJMLVdJ1H6u4piu1YDVleHy5rpV62Y6ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by DM4PR11MB8091.namprd11.prod.outlook.com (2603:10b6:8:182::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 16:43:54 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70%6]) with mapi id 15.20.9632.017; Fri, 20 Feb 2026
 16:43:54 +0000
Content-Type: multipart/alternative;
 boundary="------------LASMkUdF0AeNSHDIHCCZSnrD"
Message-ID: <32a24f8a-582a-49e3-9d6a-5f5bd91e22cc@intel.com>
Date: Fri, 20 Feb 2026 17:43:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] drm/xe/vf: Use marker to catch fixups during LRC
 creation
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>
References: <20260218232159.1726873-1-tomasz.lis@intel.com>
 <20260218232159.1726873-6-tomasz.lis@intel.com>
 <aZdznFXPHUm6QxYD@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <aZdznFXPHUm6QxYD@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: VI1P195CA0093.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::46) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|DM4PR11MB8091:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dc32190-4748-4286-71a1-08de709f3c3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHg3Q1d3YzRXY3VpWDZZZERvQ3lUNkJyVjUzRmZSZ0M0eVhHZm50V2x1OTBC?=
 =?utf-8?B?amNRRWNDQUhHTVlydkt4UjBaMVRUMldBY2dmUmZieGpDdjhTUHJLVjRhNzl6?=
 =?utf-8?B?ZEl5ZlFLUTFQbGVWaVNIYUFBSzFKSkpET3lENklURlhRZm1DT3ZvWnRVRWhP?=
 =?utf-8?B?OXo3aTJ5ZTdjYk1MZWJ6SzBwMlZVMitTalV5V2hHWWtJSXlOTEdoTmNVNjdY?=
 =?utf-8?B?NTd6ZUlodWNDSHRsdlp4aVBvUTlDeWoxN2FQUWJFQzBNcVRIa2c1NG5FVDl4?=
 =?utf-8?B?bE1CRFJhRzI0K1R5dXltNFljbjVyc0NESGhsd01Id0RxdktNNXpNMDdwZWVa?=
 =?utf-8?B?SEMxeHArdFdaMmdJU0NBblZtb0l6Tnk4NzNoWS91MS80dkhpR0FHdlZGWko0?=
 =?utf-8?B?UWJyeUk4MXZqZ1l2d2FiU2xTRmxmbEFIOUkzNFhVbWkwWW5YQ083dXlSUjZD?=
 =?utf-8?B?THFyL0lkSWplcW5yT2FiYzdTbEZPVVZkSmdqTUh5dWNRRHlRTkFyMkdmSDBa?=
 =?utf-8?B?YXdEc2lmNVJwNjUvaWttc0hIdTdYM05ySWNMbHVENGZMVGxlbDFVeEZCUEFq?=
 =?utf-8?B?cWVsNEZZQmdKMy9BeVJxSHBTWkF0dGNKRmxUdm1GTXJFenQxYUVIOThnUlVz?=
 =?utf-8?B?b2QxUzNXU01oWU9ER1llYmpTZks2aFJlZjZIWm8ydzlGZXc1SkxOZTV0dkVz?=
 =?utf-8?B?T2t1VzhTRktpOGRMV1JTa3gyZ1pTSEhYR0R2OWpZanhQTS8zeStQeFhhdkVi?=
 =?utf-8?B?NDgrWk5JT0VxUC9SQXNsWVV0ajIwNVZrREtvVCtDZmlPODg2djdiaVhVcDZh?=
 =?utf-8?B?WFVIQTd4WE1LYWFCRzJUMkE1dk03alVKNTNJSVN1NEg1TitGdjNHS05Ud0Ex?=
 =?utf-8?B?VGFSSjUxS3A2d2trOHI0ZzMxK1c5YWFoN0ZPS3BTd0JmeEE0cENzMnp6L20w?=
 =?utf-8?B?TEtWbktSbnVtbEVoQVlmL1NSVzN5akVIQVlvbElZN0pQR1V6ZGNaTDR2V1M2?=
 =?utf-8?B?eFdFdjJRSmI2VGk1T1pKNVFScDFIeEhycjBkRDBaUzg3cmQzdFZnU1BhMUZu?=
 =?utf-8?B?cWIwRldObjcvaDR1RzAwblhzSXc1Z3NSSmZEK0t0NFNYQjNVUC9kK0Uxdllh?=
 =?utf-8?B?cjduL0xWb2Q4REt6T08rN0tTVzJnUE9qbXBUTWhHTE1sMnpBdHo3eHdzVE1P?=
 =?utf-8?B?UmRKb3ZNbktLTkNydWgyNWwvMXhaMk5Hb0hxQ1M4VXVVVk5FOVNHOGQwcGJL?=
 =?utf-8?B?aE9lck14N1NvQnJrbGNaWGtJajBSajRXYW91YW5TaVY1WWtBZGZFVGU0YUli?=
 =?utf-8?B?WGNCNmI2RGFyMjBxQU52S1IwcEhnelBVRno5QVdaTFpSai9sdUo5R29VTkJm?=
 =?utf-8?B?ckFMbG1hWXVqT25Zd0JLeTM0M0l0K2duRzl3RmQ3MDBPS0xISDd0WVhEbnpx?=
 =?utf-8?B?dWkxOG9JQUd3Y2Y3cm1FOG9pQXR3NzV5dHdtazBJUVlkVXVFNEdkcEdmNzR2?=
 =?utf-8?B?ZW9Ja0VJeWUvdTliZDdlTXRiR0hOTzlycU96VG51K2VjS01zZ05xd1RWc09N?=
 =?utf-8?B?MThLQnJCek1za2VZbzMrYXJhWmR5ZDgyWUFzZGwrU2ZGN2Y5Z0dKdW5DemtH?=
 =?utf-8?B?NEhCcmRmWVd6aUl1SzluMEluRHBvcjl0MitmbXJtdGdOb0djQm9qUnQ3ZzN5?=
 =?utf-8?B?azdDS2V4VnRRWDhyNkg4UCtrWW45RHBrRVJZdXpzVWpPam5MSElqTWlrUTla?=
 =?utf-8?B?TWJ4K3cwU25kWjhoUE91UUNhWEdUYTdtc1hISytrTzk5T0lOQnBLcW1kYUM2?=
 =?utf-8?B?RkhxNGRUS2lkOEZCMmZ4bDJxMVZ3V1pCblRtTllsbzFYNDlDMlZPakxqRi9J?=
 =?utf-8?B?dmIydUF6U1BFdXJYMndqWW53bFlXUVFJZmxxMXhIQzdFL3N6KzRaelNNRzZB?=
 =?utf-8?B?WHpxUytCVHl5a09BeFJ0NTRrWFh2MUFEblkrR1k0dFdsNEpUUldQcllYOFdw?=
 =?utf-8?B?aUgvMmJPNEd3dWxMR0p1UlZ3Y1hRSDlvWUFMU1ZuOGx4S2UyL25KVGsrd3M4?=
 =?utf-8?B?Uzg0TUhpbjNJejgvY0dESjVjbElUc0R2eFpZbk91MmMrUHhvQnNhZjFFSFpG?=
 =?utf-8?Q?vo8o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3NGSEwzdTU4czFkQU1OZ3FaUGpEbm5paHl4QlMvRzg5U0RhRGs0clc3OEd0?=
 =?utf-8?B?bVk2LzRlRGJ4cVcvekFjL0Judk1sZ09YbXJ5OHFhVEt5SFhYR2xPUHVUYjE5?=
 =?utf-8?B?UTlVN0UxMHN3czdQdmF5ejFMcHpxWXhJcW1ScE9ZaFg4amVKcVc4c3E3S1Zn?=
 =?utf-8?B?MzlkRUh4WXdGN2ZwNWRkbFBKbHArL0ZjTE1hdFVCdjY2R0FyKyt6b2QzTnM1?=
 =?utf-8?B?MXZ3b29ncTc1RHUvTHlLL2dySDFIMVhZcGxEdDVyOE9wdy9xTUJ1RVIrdTQv?=
 =?utf-8?B?cUVta1BTaWhUeGRrbzFnVWMzclAydUVEWWxwZHpZVDI5Y2ZFczl0WFFzMlN1?=
 =?utf-8?B?VzF5dUk4blprNGRSazlzeGNWREQzZTJLRVNNVVRyWEtlTGtUMlh2U3F5d0Zm?=
 =?utf-8?B?MCt0eW9MUEE5M1RSNm5CTDRPcWNRb1E1aGV2Q3BjZThKa2FsaVpNNkI1Nlkz?=
 =?utf-8?B?TmpqSnpDQUxKMkFiY3NmelZXK0ZCM284elltODh4U2JaaTBVZkI4OVRncEwv?=
 =?utf-8?B?TUxtcjJMNXE1aFJJRGQrQWVMaGRheWEvVFB3SWtKWEhPWDl6SUtqK2hHdE5m?=
 =?utf-8?B?N0ErM3N2SXkyZEs3ZkdUaVFPc1haOU1uOFVreWJvWDZ5OFVaMmFNTDJYbzVx?=
 =?utf-8?B?eDF1NEZ0UXRLT0dXM29WMFJQeU40bk1MTUh0bUlaQjZjSk5ZWGxWblkweVcw?=
 =?utf-8?B?TVBrMDVXWFd5bDVjU04xenZiUXMvUjY0ZmhkOGgzZzd6eHA4WFNnK05xcDha?=
 =?utf-8?B?bDRSL0NtdjVaelJsbWUvTVAzNkpqVlN1OVk5VUh6dVRoWHdLSzhGbDVoeUFq?=
 =?utf-8?B?aWg4M0tuMFRXLyszS2xOTWFkeHd1K0V4MERhY0hxWnN3WVNINEoydnJIRzF3?=
 =?utf-8?B?ZkEyb1l2eGh6TjVUVWovOEd2L0FVdTBwOVZoRnFBQndnT1VwN0RHQS8ydmZZ?=
 =?utf-8?B?UFpWUnZLcGdCQ3ZDaW9sbWhYM0tDbFVnS2c2dnBUZ2NNbC9QbzdFVW1aYlN0?=
 =?utf-8?B?OUtDY3VBb2ZoRmd4NUYzbFZQQjVGN1UxVmpVRmlzQnZxQU94bmRvR3lBdjIv?=
 =?utf-8?B?d1h6UXYrT012TDlqekJ0cEp4VDY1dVlBeXFPazhycFlqR1cxVTNwdkw3OHFm?=
 =?utf-8?B?SmkzWnhyY3pBSUlXNEJFa016MXJaakptWkIzaDhGcC84enE1UFdjYTJYaVdy?=
 =?utf-8?B?VjVuZG9aT2I4dVFvZHlCSjBBSkJGRWY0d3V4N25VL3hlOHY0Q1FFL0lCbE1V?=
 =?utf-8?B?TTdPanp1dFVicnZZNnQ3RnM1dUpVREM1Q3VZRlJzdVZ3NTVEa3Y0QmJzUFB1?=
 =?utf-8?B?VTN2R2oxQmkyc25kRDBnRUNxU29aUGhmMThPOTk3TTJuOTY4b3FLeE9QWWVt?=
 =?utf-8?B?S0JuN2dXbGpyYS9NMUU4YnRpajBKUk9qTWwzOEFOSjFreTBoU0JqUzNDUmhF?=
 =?utf-8?B?ZHhJYjk3d3gyYkJUdWJ6SlgrSlJiQUdKaXdhenQ3MWp2TW9LSkQ5a1JKK1l6?=
 =?utf-8?B?WW82MUtGY01tZDJvT2tkQUlhUlVlWjQ4bXk3bHZwOS9LV0FzUXhPYnMwMEM2?=
 =?utf-8?B?cStQbnZCUjErOUs0VE9aaFh4dGtMa1NWN2RjMkpXbHhLUHkyalk0eitvMjN1?=
 =?utf-8?B?R0xJM01FaGM0Wit5bnhCMHdXMUtBcnNVMVpoK1Z3TFRjY1pnRjZsaGxoc3hX?=
 =?utf-8?B?WmFla3hPTENEazcrT0ZaRnFjSlhHRjN5WFQwUk9OdHZjOTFJajdmM252VnRi?=
 =?utf-8?B?L2k2RHhjME1wVVdsWDVQOUhxZUNSN3QwL3ZiQStFQ0JrQ0diNHVHSS94ZWQz?=
 =?utf-8?B?djU0NVMxa1VqQ2grRk54MC9SVGZuRVU5YjNacngwb3BMOFJlOFlFc1ZkWFVk?=
 =?utf-8?B?RmY0emxiaEZ5bHE5RmtjcmlTTVRyY0NuaHJYWklkTHdGM3FMT1NDN2F5NGdG?=
 =?utf-8?B?c1QrSk1UVHVVZU5pQUd2Z0txWHNVSXQwcTNWbzVzVk5Wc3hkamF1cktZdkFU?=
 =?utf-8?B?dHl4bjdDTEhkTjhEMWQxcCtXeWNTbW5nTzJCQTZWR2loRXM4Z2tQSWp3YjhU?=
 =?utf-8?B?TVp6MXhUTnB1dHBLWStSL3IzUndncFA0QlB4czJKTmRVb3JoY2dQeS95Tkc0?=
 =?utf-8?B?cjYrZENLOTJKMUhydWp6R3NVMzlhU3VwSWxWZDMvTDZPL2lrVmU3cWozajJq?=
 =?utf-8?B?U0dHWDR5cURsczdwOG1pM3VaeU5XbWFXL1FyQSttWUlnZkVkRUJ1ZklJSS8z?=
 =?utf-8?B?Z1FIV0pCZE41cHc5MXRrR2NPLzVMZ3FDQStibFZjRzc1WEVJL2JPZ1ZqWHFx?=
 =?utf-8?B?a1h1TnE3VW81YlY3QzhzNlE1Z0w5MUVrNjdzdGNzenlBRWV6bmZjZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dc32190-4748-4286-71a1-08de709f3c3f
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 16:43:54.7336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YfXeOkew/s91Oa9bR0vp2CDazmfpn/k8XTnLWqO9fTatXPJG2TvGoi109ztvBWTLc0DJyDcId19YSY7UxVWw3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8091
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

--------------LASMkUdF0AeNSHDIHCCZSnrD
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 2/19/2026 9:33 PM, Matthew Brost wrote:
> On Thu, Feb 19, 2026 at 12:21:58AM +0100, Tomasz Lis wrote:
>> When LRC is created during fixups, it may have invalid state. Ensure
>> that all such situations are caught, so that LRC creation can be
>> repeated.
>>
>> Due to VM having arbitrarly set amount of CPU cores, it is possible
>> to limit the amount to 1. In such case, there is a possibility that
>> kernel will switch CPU contexts in a way which makes previously used
>> detection methods miss a VF migration recovery running in parallel
>> (by simply not switching to the LRC creation thread during recovery).
>>
>> This possibility is not only theoretical, it was revealed by testing
>> that in a small percentage of specially crafted test cases, the
>> resulting LRC is damaged and causes GPU hang.
>>
>> With the additional atomic value increased after fixups, any VF
>> migration that avoided the usual detection during LRC creation will
>> be caught.
>>
>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_exec_queue.c        | 6 +++++-
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 7 +++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h       | 1 +
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h | 2 ++
>>   4 files changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 2ebf25a35557..a8d26fece38a 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -308,15 +308,19 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>>   	 */
>>   	for (i = 0; i < q->width; ++i) {
>>   		struct xe_lrc *lrc;
>> +		int marker;
>>   
>>   		xe_gt_sriov_vf_wait_valid_default_lrc(q->gt);
>> +		marker = xe_vf_migration_fixups_complete_count(q->gt);
>> +
>>   		lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
>>   				    xe_lrc_ring_size(), q->msix_vec, flags);
>>   		if (IS_ERR(lrc)) {
>>   			err = PTR_ERR(lrc);
>>   			goto err_lrc;
>>   		}
>> -		if (!xe_gt_vf_valid_default_lrc(q->gt)) {
>> +		if (!xe_gt_vf_valid_default_lrc(q->gt) ||
>> +		    marker != xe_vf_migration_fixups_complete_count(q->gt)) {
>>   			xe_lrc_put(lrc);
> What exactly does this marker buy us? Couldn't patch #3 just signal
> 'gt->sriov.vf.migration.default_lrcs_need_fixes' where
> 'gt->sriov.vf.migration.fixups_complete' is incremented in this patch?
>
> Then just drop this patch?

This solves an issue which was found by test fails, so it's not 
theoretical (though it is a rare sporadic):

Consider a VM with one-core CPU, where migration happened while __xe_exec_queue_init() was executing, during creation of LRCs - so after xe_gt_sriov_vf_wait_valid_default_lrc() has finished, stop was inside xe_lrc_create().
It is possible that this queue creation function will be preempted and will remain without progress during the whole migration recovery. When the function finally gets back to being executed, it is already past the recovery - and xe_gt_vf_valid_default_lrc() will return true.

This means the whole function will run as normal, without any code flow change caused by migration. In particular, a LRC which was partially created before migration, and partially after recovery, will be kept.
There are two problems with that: one is that depending on when the CPU context was switched, this LRC may have GGTT references and may have skipped fixups. The other is that LRC created during VF migration is sometimes damaged even after fixups, so it needs to be freed and re-created - and we did not detected that, leaving the LRC as is.

The `default_lrcs_need_fixes` tells us the recovery is still in 
progress, but it doesn't tell us whether it already finished before and 
we've missed it.

I originally didn't though it was achievable, as GuC communication is 
slow and something will be always executed while the VF recovery is 
waiting for GuC. But it turns out the CPU may get switched to other 
tasks, leaving the queue creation starving for the whole recovery.

What can I improve in the description to make this clearer?

-Tomasz

> Matt
>
>>   			i--;
>>   			continue;
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> index ff9fb9196486..240c53b07eb3 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -1254,6 +1254,11 @@ static size_t post_migration_scratch_size(struct xe_device *xe)
>>   	return max(xe_lrc_reg_size(xe), LRC_WA_BB_SIZE);
>>   }
>>   
>> +int xe_vf_migration_fixups_complete_count(struct xe_gt *gt)
>> +{
>> +	return atomic_read(&gt->sriov.vf.migration.fixups_complete);
>> +}
>> +
>>   static int vf_post_migration_fixups(struct xe_gt *gt)
>>   {
>>   	void *buf = gt->sriov.vf.migration.scratch;
>> @@ -1274,6 +1279,8 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
>>   	if (err)
>>   		return err;
>>   
>> +	atomic_inc(&gt->sriov.vf.migration.fixups_complete);
>> +
>>   	return 0;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> index 8c21b8ab2f16..4651c7f3335c 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> @@ -41,5 +41,6 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
>>   
>>   bool xe_gt_vf_valid_default_lrc(struct xe_gt *gt);
>>   void xe_gt_sriov_vf_wait_valid_default_lrc(struct xe_gt *gt);
>> +int xe_vf_migration_fixups_complete_count(struct xe_gt *gt);
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> index 8be181bf3cf3..41d6199e3508 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> @@ -54,6 +54,8 @@ struct xe_gt_sriov_vf_migration {
>>   	wait_queue_head_t wq;
>>   	/** @scratch: Scratch memory for VF recovery */
>>   	void *scratch;
>> +	/** @fixups_complete: Counts completed fixups stages */
>> +	atomic_t fixups_complete;
>>   	/** @debug: Debug hooks for delaying migration */
>>   	struct {
>>   		/**
>> -- 
>> 2.25.1
>>
--------------LASMkUdF0AeNSHDIHCCZSnrD
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/19/2026 9:33 PM, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aZdznFXPHUm6QxYD@lstrano-desk.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">On Thu, Feb 19, 2026 at 12:21:58AM +0100, Tomasz Lis wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">When LRC is created during fixups, it may have invalid state. Ensure
that all such situations are caught, so that LRC creation can be
repeated.

Due to VM having arbitrarly set amount of CPU cores, it is possible
to limit the amount to 1. In such case, there is a possibility that
kernel will switch CPU contexts in a way which makes previously used
detection methods miss a VF migration recovery running in parallel
(by simply not switching to the LRC creation thread during recovery).

This possibility is not only theoretical, it was revealed by testing
that in a small percentage of specially crafted test cases, the
resulting LRC is damaged and causes GPU hang.

With the additional atomic value increased after fixups, any VF
migration that avoided the usual detection during LRC creation will
be caught.

Signed-off-by: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_exec_queue.c        | 6 +++++-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 7 +++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       | 1 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h | 2 ++
 4 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 2ebf25a35557..a8d26fece38a 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -308,15 +308,19 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 	 */
 	for (i = 0; i &lt; q-&gt;width; ++i) {
 		struct xe_lrc *lrc;
+		int marker;
 
 		xe_gt_sriov_vf_wait_valid_default_lrc(q-&gt;gt);
+		marker = xe_vf_migration_fixups_complete_count(q-&gt;gt);
+
 		lrc = xe_lrc_create(q-&gt;hwe, q-&gt;vm, q-&gt;replay_state,
 				    xe_lrc_ring_size(), q-&gt;msix_vec, flags);
 		if (IS_ERR(lrc)) {
 			err = PTR_ERR(lrc);
 			goto err_lrc;
 		}
-		if (!xe_gt_vf_valid_default_lrc(q-&gt;gt)) {
+		if (!xe_gt_vf_valid_default_lrc(q-&gt;gt) ||
+		    marker != xe_vf_migration_fixups_complete_count(q-&gt;gt)) {
 			xe_lrc_put(lrc);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
What exactly does this marker buy us? Couldn't patch #3 just signal
'gt-&gt;sriov.vf.migration.default_lrcs_need_fixes' where
'gt-&gt;sriov.vf.migration.fixups_complete' is incremented in this patch?

Then just drop this patch?</pre>
    </blockquote>
    <p>This solves an issue which was found by test fails, so it's not
      theoretical (though it is a rare sporadic):</p>
    <pre wrap="" class="moz-quote-pre">Consider a VM with one-core CPU, where migration happened while __xe_exec_queue_init() was executing, during creation of LRCs - so after xe_gt_sriov_vf_wait_valid_default_lrc() has finished, stop was inside xe_lrc_create().
It is possible that this queue creation function will be preempted and will remain without progress during the whole migration recovery. When the function finally gets back to being executed, it is already past the recovery - and xe_gt_vf_valid_default_lrc() will return true.

This means the whole function will run as normal, without any code flow change caused by migration. In particular, a LRC which was partially created before migration, and partially after recovery, will be kept.
There are two problems with that: one is that depending on when the CPU context was switched, this LRC may have GGTT references and may have skipped fixups. The other is that LRC created during VF migration is sometimes damaged even after fixups, so it needs to be freed and re-created - and we did not detected that, leaving the LRC as is.</pre>
    <p>The `<span style="white-space: pre-wrap">default_lrcs_need_fixes` tells us the recovery is still in progress, but it doesn't tell us whether it already finished before and we've missed it.</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">I originally didn't though it was achievable, as GuC communication is slow and something will be always executed while the VF recovery is waiting for GuC. But it turns out the CPU may get switched to other tasks, leaving the queue creation starving for the whole recovery.</span></p>
    <p><span style="white-space: pre-wrap">What can I improve in the description to make this clearer?</span></p>
    <p><span style="white-space: pre-wrap">-Tomasz</span></p>
    <blockquote type="cite" cite="mid:aZdznFXPHUm6QxYD@lstrano-desk.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">
Matt

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 			i--;
 			continue;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index ff9fb9196486..240c53b07eb3 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1254,6 +1254,11 @@ static size_t post_migration_scratch_size(struct xe_device *xe)
 	return max(xe_lrc_reg_size(xe), LRC_WA_BB_SIZE);
 }
 
+int xe_vf_migration_fixups_complete_count(struct xe_gt *gt)
+{
+	return atomic_read(&amp;gt-&gt;sriov.vf.migration.fixups_complete);
+}
+
 static int vf_post_migration_fixups(struct xe_gt *gt)
 {
 	void *buf = gt-&gt;sriov.vf.migration.scratch;
@@ -1274,6 +1279,8 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
 	if (err)
 		return err;
 
+	atomic_inc(&amp;gt-&gt;sriov.vf.migration.fixups_complete);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index 8c21b8ab2f16..4651c7f3335c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -41,5 +41,6 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
 
 bool xe_gt_vf_valid_default_lrc(struct xe_gt *gt);
 void xe_gt_sriov_vf_wait_valid_default_lrc(struct xe_gt *gt);
+int xe_vf_migration_fixups_complete_count(struct xe_gt *gt);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index 8be181bf3cf3..41d6199e3508 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -54,6 +54,8 @@ struct xe_gt_sriov_vf_migration {
 	wait_queue_head_t wq;
 	/** @scratch: Scratch memory for VF recovery */
 	void *scratch;
+	/** @fixups_complete: Counts completed fixups stages */
+	atomic_t fixups_complete;
 	/** @debug: Debug hooks for delaying migration */
 	struct {
 		/**
-- 
2.25.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------LASMkUdF0AeNSHDIHCCZSnrD--
