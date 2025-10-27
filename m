Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EADBDCCF9E5
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 02:13:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B10110E330;
	Mon, 27 Oct 2025 02:13:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HJ7CDKBu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA5910E03C
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 02:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761531202; x=1793067202;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Wp/Ejis7m1I3UMWcdb6CIbWy7ITi0DwyUNzFodV1Mr0=;
 b=HJ7CDKBuvnKi/51FX58MZvk5ZZj6zt4cI2PKFfRnxNYSRmKFFAcN0Qit
 0KBiIryZfCAtVTCcSC4X5r/gduLacsJjomC0W01/c9DX2WX7y1CXTG1vX
 jb53nk3QHv/RwipH0ISH3G88bsbYwW/jDztGaAAcBECMh+r6KyVh91TDE
 amCiFjYFg0qhwfXFcUAbFHXCztzhGj594USWfRcsAhZMwC3nicDoQlu+N
 Pv4IUUfQ1ShamJvSOFMNBVXTe2W13z8ADrvP7bVot2bNDlRLti0RWuiHw
 Hb1og6V4DIIt+vVkZtT3lCTMlkg0sug2fwrIo/F5omGZ0KbKvr4fk4uRI g==;
X-CSE-ConnectionGUID: gjg24k34QL6S5iTA1tmcJw==
X-CSE-MsgGUID: E7OMjovlQCSgXjkmCKXWfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="86237331"
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; d="scan'208";a="86237331"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 19:13:19 -0700
X-CSE-ConnectionGUID: eObA54hdTJmx/OhaduCERA==
X-CSE-MsgGUID: F0s+NagdQ86x/6QP9rrYfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; d="scan'208";a="184101731"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 19:13:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 26 Oct 2025 19:13:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 26 Oct 2025 19:13:18 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.32) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 26 Oct 2025 19:13:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sFm2ani/bhk33a/Og8skrHWQ1HOCDtwP1WV3ComVVmuchgmHQ4ioDvvHUqJSl/9bKXGkIUjffteBvwNUHM8Zh7SlBAzNFq4lQ4u4ISreP0S9TCTvEuO5bsXSp2oTz3SF2CwSdFjrHsU44g0rBTw1mJutsNGrK3VG3fpVLKgD4jdjLPLKAxZX1RYZ7ecS8DaiWkELnb9+/E8xXXElvN5KghySEiyc1/f3dOEYKa4/lVNiEib8ln5+r5q+DAbzlAJ/hHctsEJSQpL9X0Ujk+mwwZfOt/mmEs+JQl+2iJ/PsDGKWVUM3TgNjjWbNH/mKneQbX0+GJ+7uIKc+rfqIy57aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TSRDqgQfBsl1dBO8l45REMQH2M/w088Tdg3VFKitwck=;
 b=DS7PH+MLhob1KKzpJyDG9Klh5aiYOZh5WORBouDhYZZDVm1jYODUX7WrsipVHgSuks/czUcliqqcstbUZ1hiBpEcJA67TAHVbzE7Cwp1Zr1kgFMg2sEMM/DSYGM+EDY8+eBs0Rmyi/yX9PHF+mWE73PrgdeFHrtVKhiv1LFjoDiaCCy+v9wBS4VsrDNBBT8Y2PPafybyaZmbbye8jPQCYodexM04a8tUcQ2zKJy5xgL7tcGXU6aGBPe4B8S88bOadzEB5UxY1eXjiYZ8KR9wr64YgPNwcE14196/RXolrPjPg2lHA/bf5K33/Ga3V7DRuiSHAyOqoW4tGf5VqCIIOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB8802.namprd11.prod.outlook.com (2603:10b6:208:598::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 02:13:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 02:13:16 +0000
Date: Sun, 26 Oct 2025 19:13:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3 0/2] Fix serialization on burst of unbinds - v2
Message-ID: <aP7VOn81hrFqnhN4@lstrano-desk.jf.intel.com>
References: <20251024222047.1481039-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251024222047.1481039-1-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR06CA0039.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB8802:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dab926c-b19c-41cb-bedb-08de14fe63a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2w3Y3d2d21EanoyVklHVW9kdXdQeVJtWjV1ZlI2ZVh3am9PdDAxVlJWMm9q?=
 =?utf-8?B?dXB2cGpGNEJFaWNyQnFiUlVyM2tYU2hjLzRNdWR2R2dOdTFMckN6NWxJM1FU?=
 =?utf-8?B?ajh1MkM3WitjSGpvSUxFS2tCZ0lvN0JLK1NVOXByc1AwWFNMYktPTkFsUXNS?=
 =?utf-8?B?UzMrM3ZuZFFaQWYzTE01Y1o1Zy9kckljbXJsbHpTZ0FPclNya0dWdm5ORndm?=
 =?utf-8?B?OWY3OHR6L21GZVYxclZIMTFhQStWMkhWME56MG1nS1dMc0M4b1JRSlVScmZV?=
 =?utf-8?B?R01nM0w5eHJxNytPL1BCc2xXS01obXcwOThZTVg1aVRha2hpWE53RWczM2Nh?=
 =?utf-8?B?SHF0emNUZS8rQkhhUVFsdUFzNHh0dTdsbTFzVlBJMG51bU9GMXpHUFF3RUZ4?=
 =?utf-8?B?ak5NQ2kxRVNwTlBWVm0ydWRJMnJXaGptaVlKSFIwWmxGQjhmSVZrVzdjZ1kx?=
 =?utf-8?B?cXArTmhCeVByaklKVFdFazZKWVRxS1NYalowNFVTZW05RXZtOHRMVlprcjRp?=
 =?utf-8?B?RVlBZFhFT2NGUlNldlRLekVZMTNncEVia2llL3JJODUvWFo3M0c2aGx6eFh4?=
 =?utf-8?B?N3c5ZXBJelNjbUo2LzJmWnZRTVNxVEgyNWRSQUlNalU3MFNUSWFQRmZFcjFs?=
 =?utf-8?B?NStmU0RqRnBrWGVlZXBRcURvZWJKNEVuTm9JSnJmSWVHZitobjhXKzFoSFBS?=
 =?utf-8?B?bnhlOFhTNzJZYUlueVRLRHlVMnBrZ3Y1UmdFa0FNY3JOTG9BZnNJWS9MQ2tY?=
 =?utf-8?B?U292d0VTaEVnN1Y5Um9FMVZ1UXdiL1orN2hVUlF4L0lBQ0RHVnJYQmhKV0RH?=
 =?utf-8?B?aEo2VFUrUkdxRDdlNkxFbXlqVzdCcXRrejRnU0FLVndKVU5DMHdENk1hNC8x?=
 =?utf-8?B?d2JCZEtWZVFyT2txd0I3MHNmWmtMQ2NHZHdPTDBUSUp5YUNBWUFKb3F4ZG93?=
 =?utf-8?B?WDFEM0o3OUI5aWtib0J5bUltVk5CcXpRc3NoV1FsU3hxQzl0L2c4ejgzZDJy?=
 =?utf-8?B?K1hONjlLKzVteWd4Y0FHOTF3WjFKems3RjV2MHpxSXFscjF3dVVxV3VKRHVI?=
 =?utf-8?B?KzROSDJsS3ZwVU9KYTFVN2tRZ3VtWnRSOUFSNVVqWDNvdGlrSFNyazBzWTZ5?=
 =?utf-8?B?ZG5MaTExeTZvZEJkZUt3RWlGZEwxclZTZVllS0VmRGRZS1pNdFlKdHBZeXBE?=
 =?utf-8?B?MFAxZkNMYmZrQXA0ck5zN1VINWZjbk1aWDA5V0Q3Ri9iNUlmaGVHemVPQWF6?=
 =?utf-8?B?VFliZmhQQU9zT2RTb3VRcmQzREZUT3FCdnhBWTB6RWMwTFArZm4ybzk1cVRL?=
 =?utf-8?B?YjByUWNFY1hCRDI5TFg0VE1Gb3UySURtK1pnanhNUEUzMjhPZzgxUitwMEE3?=
 =?utf-8?B?NWMwUkg2bVQvNGgwT3JRQUtuL1ljMTJWcTlmWk1jREl5RUFwR2dvZkxjWU8y?=
 =?utf-8?B?c1ZJdGUzTWdYek1OVzBYTitxZEZOZXh2MTdMUktqUnpJRTBmUHdVajdFWVR3?=
 =?utf-8?B?aW9PeXo3S0QvTGdqaTBiTmpwUXU0UFVQY0I4eTVNRkdSdUpXZS83SWhDK2tZ?=
 =?utf-8?B?LzdqL3p1bnA2Tm5oRjdNTU1YZmZmbUJMT3dCVCtpMlNGT09DVzZjSHUxU0R4?=
 =?utf-8?B?ekM2cWdhNzltazI4V3ZiWjFUZktSN0c1SEZ3NnVYK0YzOEVjNjRJV3oyZUdH?=
 =?utf-8?B?QXFRWTg2TDNXR1NCc1d2d3l3by91dXpwT3VYamgwTXJpWWZaczRXT0VVK1Nn?=
 =?utf-8?B?TmxTRWZ4aExpZjBOa054ZHNmc0ZnT0VZenUxR2lxQlJ6cE5uNjJuYnVLWjl3?=
 =?utf-8?B?U3BSQ0JPSGtuT1BKWEduZmpuVUlFMCtpa1Y5T0QrUVRrN1c4RFUxZk5UUVFM?=
 =?utf-8?B?RmtYcTZyYmlGOTZ2YVQrQXhZY3EzL3NVamUvVWVUendpdlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0ZXbVlBczdHNlc5cm82K2J6bDB6UDlWdVpBUXYvVzRyaWRrdXpad2FlZzI0?=
 =?utf-8?B?VUNYWlRrQk8zL2pUSVhad3EwS0xKbytCamc1Ry9mN1FXZGkyYVFvTXc1cUdh?=
 =?utf-8?B?TUViY2tOcU9BQ01jWm44UklSOXgxeEUzZEN2ZnQvOHpJd1NxZUJDbzRTZUlw?=
 =?utf-8?B?SXFjVDM3TFROYU1IZmRXSGRxeW5GNEM3T3lSeXBzOU9EREZUZUNnV25rRXVO?=
 =?utf-8?B?dXVJNWZHWVhNMCtFVTRPc0piZmR5OUpZejhkdGVHcFVkUTQ4bzd5QmZYOUpw?=
 =?utf-8?B?VnFrbmlSbmN1VDQ1aHA2S2htMEFxVzFTR2p1aUo1VXVncEQwVW5iLzNycTRX?=
 =?utf-8?B?dmg2a2w3b2dtWkxGcXFsZFVyWXZleEhwdUtOdXY3U09uSHlaczhBVUdkVUtx?=
 =?utf-8?B?NUlMczRHbjN3OUZCbGFrZnd5ZmI4d2Jjb0t4MVViYU11eFJrcCt5Rlg2a1Zp?=
 =?utf-8?B?V1B1a3l3ZlkxNjFzSWN5UHkzSG9oT2tVRUpGeDU4dHNMTDEvbFFVM3ZKQkxX?=
 =?utf-8?B?dkcvMWtGa0lObElzaVZPcHIyREt4T3FWWGdReDcyS2pOZzVMTEZnZEZhQmVh?=
 =?utf-8?B?S1k0a1h3WllTUUthekRGY2NwMStuMjl3aUt1M2lSc3ZCZkFTdDd5WEx6YmRL?=
 =?utf-8?B?Z21rL0FFQkMxTi85dWhjYmd1bnRZSUN3SjlUT2k5Sm5HejBrOW5NYVFFU2tD?=
 =?utf-8?B?by8xVnMxR2V0QVVUYWQvWlM0UGllaEdhb1k4TkJUZThUbEUrdjhLM0FiSDVQ?=
 =?utf-8?B?UklHVTdXMEdsRDVaRmJYWHhHeTNJMTV5dmRXSk13NUQrNDBsWFNKeWVkL204?=
 =?utf-8?B?RWNwL0hGUUhBNTFrVVE3a2NocVVOcXdXYk5EdEFjRUlEcFl1TGpQQ3phWGRJ?=
 =?utf-8?B?NWdud3E4RzZYdVR4ZUxWUXg4VG9lZDhHeVRMK0czUmtZZkZ4bnlGZFAwUEJ3?=
 =?utf-8?B?bGRoRTJFSzVBbDRKcXZtTEM1d2VRdDR2SVlHY3ZOb1pTckpKUjBrd2NqTkFR?=
 =?utf-8?B?cUdRS29DK2pqc1o0VVpueXU4V3RBODNPNlpDdU5Wa01sKzdxaXFCeHByaDZk?=
 =?utf-8?B?NmkzZlVYd2FoYnFKbUl2R0c0SVp0SDFMUEZYdndvZU04MXJab3FQWkNmak5Z?=
 =?utf-8?B?Nm1ydjRPSlNwZkhLcGVYbk4yVGFVb3ozZDlGZi9FdmRHbERCcVFhS3hLZUlW?=
 =?utf-8?B?Q1hvaXhtOVRoRUFXSlVucUd3bXJaL2c4dktYMXpScXZBL0ZuWkNPcGpJbFdj?=
 =?utf-8?B?MlJTdE9aZEMycndjTEtiMGN2Sit4aFZObC9rQW1rb2NvdEZlVk5aU0hUN1NN?=
 =?utf-8?B?TWNMZ1c2SkRTNDYwdkdkOERvQ2xSVzQxRmVvNjBtQjZwalRiVmdOS3gyMmhO?=
 =?utf-8?B?T0xOVjZGWVQ4cTF6UG9FbDdGWjEzMmVoaUg3SVh2OG1nTW0rbnFFSEU2K3lE?=
 =?utf-8?B?bVk1eHEyVWhkWjI1cG1wTDhxdE5zQ3h3bzFYSGpNajJEdnBoWUU5V2xGTXlL?=
 =?utf-8?B?bGU3WkxTYlNGbzIwNWREZVF0VCtibzZ3Z2JQc0NsWUR3a29EV2VycVExd3Fo?=
 =?utf-8?B?Z3JuVE9nZmc1YncxSHE0NTZqKzV1OGFTbHlsaW53Z3FQMUVYcjgvNmd1R256?=
 =?utf-8?B?akI3L256bis2TVArVnlramU2Z00zeVBmRU9RM1daZXdDMGJrWThGcnk1L2lx?=
 =?utf-8?B?S0NWL2FNSjhuWm9oRkVNNFNXZFd3SmJEMno1ek1XejI3NzZKbGdvNUJ3ZjlP?=
 =?utf-8?B?QnUyUGtUWW5jcTRPZjZnaFFhUUduQ3N1WWI5cUp6TjJJWCsxTkQxa3VzMlQy?=
 =?utf-8?B?VmloTHk1Q2orNDB5eXdQNG5oOHVvc0dLNERXUWc2enhXd2IvWUpZbS9TUkFR?=
 =?utf-8?B?ODhMbVJxNXNFT09MUXg5WXVXSExpdDBla2s4THd6dS8zbklqZmtvbFhXdGhk?=
 =?utf-8?B?c1FXR0dWdmJzVWw0Q00rRVhRRjErcGs4bkx5L2hxanVYR0s0WENIV3Zxc0Fm?=
 =?utf-8?B?U0JDS2ZpQWV6a2VoTHA1ZkFzVXNsQlk0ODIxZjVLUnNTZzNQSE9oVW5hTmRh?=
 =?utf-8?B?NWpuMkd0N2paUmtRWnc2bTVQWjk1NnJkaVVPRkp3T0lWdE5jYkxHUEYrQVd6?=
 =?utf-8?B?OWlsSzBRZk93aERwZExZT2c4WEtaaVl3NlZleGs2QWV3RGd1YWE1UGxhcXVC?=
 =?utf-8?B?Z2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dab926c-b19c-41cb-bedb-08de14fe63a6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 02:13:16.0914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BuZ9/+b8+slV6FOCTHCEMQBxOLp611XpEFvwxw4EE05n5bEkuWBg7CP7tnc9RWGj7/glNb6WSn854GPfFevieg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8802
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

On Fri, Oct 24, 2025 at 03:20:45PM -0700, Matthew Brost wrote:
> Attempting to resolve part of [1]; this solution differs than v1 [2] by
> changing last fence semantics detailed in the patches.
> 
> Overview of issue in [1]:
> 
> When a burst of unbind jobs is issued, a dependency chain can form
> between the TLB invalidation of a previous unbind job and the current
> one. This leads to undesirable serialization, causing current jobs to
> wait unnecessarily for prior TLB invalidations, execute on the GPU when
> not needed, and significantly slow down the unbind burst—resulting in up
> to a 4× slowdown.
>  
> Matt
> 
> [1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6047
> [2] https://patchwork.freedesktop.org/series/156144/
> 

Don't review this one, still issues here.

Matt

> Matthew Brost (2):
>   drm/xe: Add last fence attachment to TLB invalidation job queues
>   drm/xe: Decouple bind queue last fence from TLB invalidations
> 
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 105 ++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_exec_queue.h       |  18 ++++
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |   5 ++
>  drivers/gpu/drm/xe/xe_pt.c               |  64 +++++---------
>  drivers/gpu/drm/xe/xe_sync.c             |  58 +++++++++++--
>  drivers/gpu/drm/xe/xe_vm.c               |  60 +++++++------
>  6 files changed, 234 insertions(+), 76 deletions(-)
> 
> -- 
> 2.34.1
> 
