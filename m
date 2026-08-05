Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EF1C56201
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 11:04:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65C410E1E2;
	Wed,  5 Aug 2026 11:04:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NjXgEQ2H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 732B310E1E2
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Aug 2026 11:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785927848; x=1817463848;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8v4fc9uhpDr6ArGRvGpI5dpcAEn1Jt1oyu6H1gl0siI=;
 b=NjXgEQ2Ha+B7fhwIlZoFDg20OzRH8g/UMlkww0jTCRK+3+B+9Kp4KyLq
 0Qwp/jh1q+gC9K59YKxHqd/xoojyqRFY9pMtgXcMOmVUib68Q2NDOODbw
 JaGmYIJaxu5iyOkLtBiMUiLlTkpS2qDFl2MyFJsmCrlB2N1dAAhtCtQ2F
 QEQRbVBO/9lfCIvnf5zx9xpBio0A3HzcrmwJqTFpGW8qI8bVIksFWibam
 kpej/KhuuWoU+1bP5asPYu69BHuf9uMwzEFfY4+GqDrwDou3QTJvlTaQO
 Z0hLRl1mhviZhIG9YTWWXtbvkaCFJ3Zfqt36JSQX0GPzDleWqYZD68m/f g==;
X-CSE-ConnectionGUID: noswI+IWS8qn16RbgIGQuQ==
X-CSE-MsgGUID: FysGOIwFSJu4M0r/58XqQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="104035846"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="104035846"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 04:04:07 -0700
X-CSE-ConnectionGUID: nocat/8iQAeT4u79S66iig==
X-CSE-MsgGUID: dHo9lzUXTCyT85cZZw1gLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="285151097"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 04:04:00 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 04:03:59 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 5 Aug 2026 04:03:59 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.47) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 04:03:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DlfC0G4HWd2QJItzXK4en6gGDk5ScD9rH2YUMymHfPiFB0PUmBMTERdhzlAdnJiPq9rqKOfDi79Hn8dHQDTp4OtgdsjYv2y4Oy94EL0ExiP3cNUttMfBBeEEn2G4NeSGwhYZrRy2SnPicIO37UalQk8fIe9zuReT/09HQwj6yPIZI7eVFqpmLE4ZHO8GYxtr3pV0GxCZOwD2wsVxpSfCThEVWc2jDXJnaNib53AYgQi19/V75fEHHWG/WNsftpV1SBd5BttjetGoB6FrrP31fdtG1lNU43F/7iijnF1Ni3DmfINMJybWM+h8dKRE7rXxZqslqoh19kVU1TVMgzpxzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Py86UeOxQI7M9bEKsiLaFSvPOGFPQgKFQJv+QE9FmE=;
 b=YQcKAiBRfctyzT5zoqmtfVehrwtWMGVgIGNUVZf0bPVCZvGF4w/PRCe1dKfvsFkrAlhBNfRHOhpBushRnpx2DTWbGFg9/H1X78XX1o6/SVDhjIEdj08X/cfPm4pmN0J/ABsGy2EHloRATU7l4jQ7g6UOlfjnXhQp7qQhDFykcVffWnQnTM04AnCER53JQzDKdFDi9dF8lM5EygU+UYUT9RAsjZXFfbfwcWRzyNQtNDmjwhT2+OvovnJ6P32r0Bz617EpiZzt2BOEG+jlO8uPPynKTn4WaB9+VGcxgFB7Vi+4v1NMEyKwN8to8NzJu+fFuudj7Nc5WZJvBbeCJTdFfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ0PR11MB5791.namprd11.prod.outlook.com (2603:10b6:a03:423::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Wed, 5 Aug
 2026 11:03:50 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 11:03:50 +0000
Message-ID: <e2d5be8c-287f-4024-9313-0023eadd18cc@intel.com>
Date: Wed, 5 Aug 2026 13:03:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] drm/xe/guc: Add KUNIT stub for
 xe_guc_mmio_send_recv()
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260728095026.2197333-6-satyanarayana.k.v.p@intel.com>
 <20260728095026.2197333-7-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260728095026.2197333-7-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::13) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ0PR11MB5791:EE_
X-MS-Office365-Filtering-Correlation-Id: f3115bd4-f364-4639-7975-08def2e13b03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: fZvMr4jaIvOAmX0pvfBwKDApC5NcXieqFs5q+fvrkmUMnKMqYn+z6VQLS1+iaM3UoNFL7q1YnCZeOD/9r8vaFAmbNSjOxCeC+zOD18VLA1QUeB1kU8VYABT5FO5nSr6NwkQhwGTGwpWESnsVOTcPZMio5l7fFOMRIsrUo5XDytCALdLy7mSpMX/uP3P5klfoUUKzoYQncEVYI2WKd/xBUfi9ZzMtAslWNVZPgIfAo7nyzARoEC+MJRObXqWVSbrMgRxst7YfkPczbWXXlFUc/1dr+krZXpYoRX4ZvmbV1zpw4VF0NyxOP604pn3umUPcw6F4PK7t/LJANkgyEUSZFli9SEibAjMCx1ctkPHwUp7RcGTqQCux1MdvmOVhqB1SbcoL/b+DD9iWylN+A1sNk9IBRf/vyBr9r7nj0nPWhQ9gyac3u61KEH599xyB6rrsxGT55Webi8NR5iQLELrGHXWNXOxfhKfB3hRoBoyEJC4b/aAvg7gdOhmGmFwoXnGMiGiqcs9hYtvuknbXyb1fJ+lSlUR05654+eUjT5t73HrN97qTs+mOcNQFnVKanJ09VYm4VSESVVCcYILxlZNVFVUIZHQWAqnAYrKpDK5h9dy64DvYdfPvxINopX48yGmUpa8N4+naFmaYIeGZ7Kx1kg2iI7Og/Yg6pv8oGGDKFkw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2dLU3hsNitFT3ZqTGdDVVNaV1RwN0lHL0NtOHVvVTZqV2piU3FWQkhNSW1k?=
 =?utf-8?B?YkxXaFVpMGZzMFFHTWpHbzNXUFBacS9qTTVHRHlHb3ErWlV3bS9RZStYWHVB?=
 =?utf-8?B?TVZ2UjFoSVRUOG5DQ3R2OHE3dmxuUlVDTFh1VGFYdTFPNVpzS1I2SWg1NVpk?=
 =?utf-8?B?Mm1YTGRZK0NFNGdVM0NUMzV5Mmdpcm5BZS9iR21laTN1b2MvRUNYTFVUVStX?=
 =?utf-8?B?czRBb1Z1RTF0WmZSUUlpb20zc2NrOHBnY0hFQjhZTndOMCtoZWlaRkd3d252?=
 =?utf-8?B?QjBlOWFCTFhZc3JoKzI0K1FLY0F2SWpYaXVnbjhOYW81ZWNnZktwbTR0UVA4?=
 =?utf-8?B?Szh5d2pmNEQ5dHUvRWdqUEVFNlZzdi9vLzdrRzdRMHpPYkFzNzJQRDFuMm5W?=
 =?utf-8?B?YkFYUysyNTBHMGdQSys1NkZUbjJ4a0dWRStpcTZQTmtXVTZaalp2S25YY2ow?=
 =?utf-8?B?UWMvUWZWQlRMeDZSM2xrNGVLVHlDRmtndzJ0Y3YwQ3U1MUVXOTh6cU4yWkpp?=
 =?utf-8?B?VHJSZDZNYTk4N29WQ1E5V0tKekVYMk5uNGp1OU9HdTNHTkVLaDNESWJsNSsx?=
 =?utf-8?B?SFk2QVF1cFBXTHN3M1FoMHliVG9JWTltQXZmZUFZRkJqeVliaHhGbWlPWTVq?=
 =?utf-8?B?SUI2MHpxaW9hclZ2bkNZMjhqRVB3NURGMTFtczBielFmRWwzaWMzeGxRQ1pE?=
 =?utf-8?B?TCtDWW15SSswb0VMbUE3NGUrazFvSlR2OEgrU1BZMjBVYk1SY2JkRzAvNU1R?=
 =?utf-8?B?ZVAxNlR5NGlPWWg1dDREV0drd1NqQ1BQR1ZzRHBBYzNwMm5DRlZlQVJTV0dl?=
 =?utf-8?B?KzJLL0J4M2xVVmJNMUVRMWtWRm8zV2x4VHVac1NYZC95MVA0V1JYVnRySTM4?=
 =?utf-8?B?Tnp0VVExMGxnV003RE9PS1BENmxEUXFmalpqdStCb2VETHdFZ3VrZDRhVktu?=
 =?utf-8?B?Wi9sUTNJelhOamdJVU9xVlljazJ6bG1MMWJoUkpZWlBUZVhJdjhzVk53ajNE?=
 =?utf-8?B?T2Zyb01SaFhXTWE4UENEL0pWT1hUc2Z3UEJvRFdjTTF2emsxS0hKVjBKNk5y?=
 =?utf-8?B?ejZUZk5EZGJTdUVvaVVrYjdPdkx2UmJLOTYzQ1RUU09PSjArOEZuZ203eTBp?=
 =?utf-8?B?NmZMYmVnT0c0ME92N0lXeXUwYUpkd0o0V3gzaXZ0VzNGc3Y4L0g2UzVIZXhp?=
 =?utf-8?B?ZzVQR0pINUdkUWkxV3B5MDFTQlFmT2lCL0pMTm8ySU8zc3hWQ1NLN0VxSWhK?=
 =?utf-8?B?N0V4YW5lb0x4S1k0Nkd4dmFoRGd2V1BrUTBmUGtZY1A5Qnl1ZkI1WHdDL2Rz?=
 =?utf-8?B?M2VIbTltNDRuWHlHd2ZubG8zbitSREI1MFZybUtLaHZwcFFwY25rZzc2cmNU?=
 =?utf-8?B?c0xkd0c2d1JKdzhsOEtvTUg0cTJJa05UMmZ3UTlVUHB2Z0U2YXZnajNFRlFT?=
 =?utf-8?B?WStUWHFLODA2cytFNldjTjNTb1BtUXF6ajI3cExCZUF1RjZRWnJYMTJiNmRv?=
 =?utf-8?B?RE8vUjhCR29NMGxxUnRNN0hxU1BEQk00NjJEdU1SSGZaRkh0cFZyenl3VW5U?=
 =?utf-8?B?TnNUdFVEcGJhMk50R1duWDgzRSsrOTkweTN5TFc0WWpIbUJiU1puR01FYnBj?=
 =?utf-8?B?TEJZanZCY3J4YmpmL3FFQ3hEdTM1YTBjZDljMmcvbm5MREU1dnJ3TzdRUXB3?=
 =?utf-8?B?LzAyejNDZU9UaVJoOW5rZ1daUmlvekFVOUVXL0x4YXpTUEdqelBuSEpIWU9w?=
 =?utf-8?B?aEg3WDVsUXNNVDdPSStYa2lVTUlEQkdpM3ZYZEJkbWpQZTFTbm55Yy8ybWFr?=
 =?utf-8?B?WlZjK0NqZjdabFBtUzBqeEVJbmNsTlhTTDlkeWg1QWxiSVNITklrY3k3TFMr?=
 =?utf-8?B?UFFBL1FDNHhXSWZrMHgxVmx0eDZqcXJwRFNuL1U4OVNwckhiRjN0RkFlR2t2?=
 =?utf-8?B?eDh4QXJsS0ZKYzRaTHdTS05hQ0FXdmxPWWQxelpxaUVFK1lNYnBjOG12a0tq?=
 =?utf-8?B?cWdVQzZoZkwzcmczRkhyMVZ3MUtydnlMd1E0VmFQRVZCK1gzYWFwRmxCQUVP?=
 =?utf-8?B?MWRheDdDbFJRM0pZaWxzWEtlQkg3UXJ5QnVuV1FPREVRQk5LbDZiS2x5MEdp?=
 =?utf-8?B?Lyt6KzRMZnNPQ1pvdXk1L1JpUUtGdk9sVUJnV2hvT25oOFp5dkJuc2NWU1Za?=
 =?utf-8?B?ekFUTG02c1UvTUlyVk95TXAyN2NsSmwraFpTNEM3TG5nOVMySW9EQlBqUWI1?=
 =?utf-8?B?bFJxdDU2c3VQaFlvV0RuSXhMQjc0MEVKOFlGMnR1a2RqOUNMOUYxU2U0VGFq?=
 =?utf-8?B?dXJzS0hob3YwNGM5UXZhcHVqUGhNeVV6Q2RmbUpUcmxWV3lDSno3OE1mU0R0?=
 =?utf-8?Q?GZIWZfAsQ3wVMb1M=3D?=
X-Exchange-RoutingPolicyChecked: Rf9Imd0HHUn+AOmFevPIkLbRabDmiKEQEYY0IHC6DVeC3EMSLZ+isoImMRP5UeckjHDq6ofkt08cTo0NWaHljKDnIQh3dXOuidwf63Mpwu9zo/U5vfIgOiwH5HPoIHXtvCx5SBcApokjkqLWR9kLAMPGLakreUkiZqfCgDpvmoHL/UYDBOKC00iL0vVKCQX1fmKRWiuV2DFR8mJ2CyphYytog3JtfsjpULkXsHURXONxDxZOKN/bBCEDWxklLqQtk99dV9jFlVExJwb7ATH0eN+sDaLmPO2qz+ywRLVmRCL6/XI7hlW/oLeBlSTQSnR/CbewRbJtqb9UNbieiAxWtQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f3115bd4-f364-4639-7975-08def2e13b03
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 11:03:50.7197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NjrdKQpvxITKD6XPzjf7CWrhc6q88WYf7fjL/YI8DY/MLT5FlE6tbVMOD0K/1NEnDWdV1SDLtdWylbdQKZwjnz+CYudJj3p1qTGsGWfoKrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5791
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


nit: we are not adding any "stub" in this patch, we are just preparing
xe_guc_mmio_send_recv() function to be replaced by the test specific
stub/mock in the follow up patch

On 7/28/2026 11:50 AM, Satyanarayana K V P wrote:
> Add a KUNIT_STATIC_STUB_REDIRECT() to xe_guc_mmio_send_recv() so that
> KUnit tests can mock the GuC MMIO query response and exercise VF KLV
> query error paths without talking to real hardware.

nit: the macro name 'KUNIT_STATIC_STUB_REDIRECT' might be not known to all

maybe just say: "Allow to replace xe_guc_mmio_send_recv() with the stub
so we can exercise more code paths on the fake xe device during kunit tests."

[1] https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> V3 -> V4:

nit: this is new patch, it shouldn't have this log (prev patch was just dropped)
> - Added stub for xe_guc_mmio_send_recv(). (Michal W)
> - Removed stub for guc_action_query_single_klv32() and
> guc_action_query_single_klv64(). (Michal W)
> 
> V2 -> V3:
> - Added stub to guc_action_query_single_klv32() and
>   guc_action_query_single_klv64().
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 4286bd05c686..c7e28f5c3b7c 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -9,6 +9,7 @@
>  #include <drm/drm_managed.h>
>  
>  #include <generated/xe_wa_oob.h>
> +#include <kunit/static_stub.h>

nit: usually we place <kunit> headers right after <linux> and before <drm>

>  
>  #include "abi/guc_actions_abi.h"
>  #include "abi/guc_errors_abi.h"
> @@ -1497,6 +1498,8 @@ int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr)
>  int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  			  u32 len, u32 *response_buf)
>  {
> +	KUNIT_STATIC_STUB_REDIRECT(xe_guc_mmio_send_recv, guc, request, len,
> +				   response_buf);

shouldn't we place this statement *after* local variables declaration block?

>  	struct xe_device *xe = guc_to_xe(guc);
>  	struct xe_gt *gt = guc_to_gt(guc);
>  	struct xe_mmio *mmio = &gt->mmio;


