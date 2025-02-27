Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E811C021BE
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 06:57:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B97310EA56;
	Thu, 27 Feb 2025 06:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lwxiGChM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4271B10E303
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Feb 2025 06:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740639445; x=1772175445;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uWUAaFqZzRWxx+91mjI010sPM50SsQ9nzpBlPanHT9w=;
 b=lwxiGChMbJDrltMeXD0AY4QAP6EHbgALrBhI6ntb1lFepLt7hpSsZ0C6
 0+bWjUjERMC9cGWlLu6oiea/kuhMDDp9549DIoObNGlTHJwcWVp40jwqO
 zuRcK3UzOInvLkP9aBYJ8kiGH8cI1WT2C3O5jjvrubBUcmUIoaznl6e1G
 PBxP0qfToZPCySuyVu/5EIgwgMZil+KE8nHkaWQAzXI2iNZhiPulFyUD1
 MzdUwd34bHtOh5kPTMqh4ULyvCQNlM3phWVfMvWVYtBnx1Zx8nozKtmJn
 wbh86vhbnwEmgegV2WGKuug8Xx9nZKNHxtK0joO9uHFTGVSPV9CFEbVAA A==;
X-CSE-ConnectionGUID: tS2ciaDSSdiT6C5WqTbcMA==
X-CSE-MsgGUID: 4a2A9bktTg6oMJlAKLDwFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="29119047"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="29119047"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 22:57:24 -0800
X-CSE-ConnectionGUID: cMWpr5sKTfek4DoGZD+8Fw==
X-CSE-MsgGUID: ufinkVWDTBaj1lR/2gK/Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="140164709"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 22:57:22 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 26 Feb 2025 22:57:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 26 Feb 2025 22:57:09 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Feb 2025 22:57:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SEZxC9PK6NVAXtXcM6XgYOqH745aLFO5Mn/6lS7JSxDPHTHpof0lzRqlTSDOoZYhTClfBX5Bv6M2MPkzteGsE9SoZqWZKPJ3iU/2Xt8Q8lINMwM32YNVNZTUu9dcBJqayLzNoC+ptVzX32HDNFLXZKkekMndwKluKbBx8xpmUP/Q2tU/CiLTyqcw+XNIEuDPBAYaIK4fM3xf5On/EoyJIAyhSvbbI8Q+e/NXgm27Zb6oWCeVEwwNxZ5S5pLMrzEcVQj9hdMFa86lq734a4cdQJaWYvAeXk5PrJlpwdXr0wel30QYybJNINc+RhZ94GAX2wqB3NrmE1rYpWvqfLCigA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+fRoMpHpRkPr8yOi9cFQOenPfpzkkoibPCzpFLi8MKI=;
 b=K/WpDsKY/arpE69ZEiqNzg4S3XPdDh2chsPapFugH+YqXHqGSEX7ask4jwtYlyA68apBcHXbd53RShwwqfY6fTdKXs3ocJLWYPlO2imCV08IB5ePgaGTH/nGcUXVJA/I/ZhIlTfL4N2llZJrFO/IhMfu3who98+DAtofScAbl+5fTaUoyCBdRXXc7EekOpGPD/ror+iGtpi+AEpt85Bl94FJbT816AJ7d2uoGNBKrmAjl6DNoDg/bgkkWbkcpkzgFyrp5ftKuim5qVJ0zA1bEa164LQiWlWH1OWDA7eszYmxZ7JjCEM+KUUDuXBHPMBkgScxnQzv9InSTvxs6/FaJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.20; Thu, 27 Feb
 2025 06:56:51 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8489.018; Thu, 27 Feb 2025
 06:56:51 +0000
Date: Thu, 27 Feb 2025 00:56:46 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH V10] drm/xe/uapi: Use hint for guc to set GT frequency
Message-ID: <x23wkwe2xvdpwvftweqdplyccofjbjmibmgmlwxmlo5pswznkb@b7phocfy3knk>
References: <20250226095224.650351-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250226095224.650351-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: MW4PR04CA0390.namprd04.prod.outlook.com
 (2603:10b6:303:81::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB5154:EE_
X-MS-Office365-Filtering-Correlation-Id: 35303591-3824-4753-f68a-08dd56fbe9a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6OzgXU5UCXXaRwdYt+gVU6kO2Tk0irW8f9VGUavrR+MrwDXh9WiHCmbTn6ny?=
 =?us-ascii?Q?x/nudLRQ7DHfT9GijsNz8o3/MplAlvLmA30zWxza5MO72OyA3xInB6MMSSVB?=
 =?us-ascii?Q?N9lA48DvZn497A3nvMnlHKVgSC48d3yBBODDOuYH3EC3jJaPy8fp+GoNuJA0?=
 =?us-ascii?Q?cVyD4JKUKmhh6od1PW4RsnjMFzvwSm+Xnk84NYnABqLdz1SB7dzZQYvnDj6M?=
 =?us-ascii?Q?DDTvZ+blNZ2Ml1Y3gFZvUzrprE/mwxBP9sU90cNQQXQmWK+8VJIeS1jo0sqG?=
 =?us-ascii?Q?8LAWylR6La5FdgrMuJbnRtJoaWj3txEh7OlHFtvobL4zT7klJgtxT/yH9vQT?=
 =?us-ascii?Q?0zOuu1/gC5oa39zzQYbgCIKaXR9xB5tzgt0bICJQumNZ4X55aRnySnk8+EWG?=
 =?us-ascii?Q?J0+syg3WlO2WPC0kA0V8OlvCB0g497yO7fVhsuEWoSDCx/Q+zrsCJwCHlA2c?=
 =?us-ascii?Q?bX3E4fXGKXNF5BBdB1HREgI7ySufzDfRsxt/41FfjHCwsNjB2fXoUyVI/908?=
 =?us-ascii?Q?MOrNC1DNEcFH0poYAT2QD0j0CK/JPE07iQlNcpnzYboW4JTtczcNm/4Cc1JC?=
 =?us-ascii?Q?wxiO4So4saqAmn95PEdBwOnZsY/VHs4AmocML8+gaPtVT3Rwd1J5SUPihp9/?=
 =?us-ascii?Q?rgLFyDDTA/QZEunngBccMaed8e072DCEGAjGeZO3sxKomkf8HOPBh7dmaliu?=
 =?us-ascii?Q?jK48J5x2tmsWXmTsZ1z19c+9lR0Ec4chTG+tIGoxh3l8p4YhosdEsFoRsJGZ?=
 =?us-ascii?Q?x44VRNbEsPzToZTvthDdzCSz5zTOJkuR+hueWSsFVtIymcMs5jM7O3r+B1Sb?=
 =?us-ascii?Q?LvNyu9D//luxiPueH8UtezeffiW0EOS9Z2cyk7bSXvjDQgykM1hGQM+gvh7/?=
 =?us-ascii?Q?q6KfRzRtVWSR5BZudn+aArckdNNWHdL1JSj4592Or0r3ITtXXgYu7N5MXCY0?=
 =?us-ascii?Q?fZQaaNwKOrFdzg44kHuU03aNaLsn85397Pp0ws+nDdm23uVrGYliTPFftrra?=
 =?us-ascii?Q?YKj2J1uPzPS45VVwo2bZNncYI+Uo4pOT21/vBQsN8wEimCznBhXXyuzAH19a?=
 =?us-ascii?Q?R8vLSiGBJ1plFhQ5w6KUQVbwMWB1AQFyb+aebPD2BX/KymMFlFPdcbqd+0i8?=
 =?us-ascii?Q?yfGINv2WkUsTTozjP8/YwO4+l5Jer8r5cYy5GsRVcBS7IjXOD6Z11X5WgIjM?=
 =?us-ascii?Q?OmKf7qhmRKwjoxSFtE6lss9YNU9xC19l53duNiAosRWs1e+OD3jueb6ah1wt?=
 =?us-ascii?Q?gNj6ta/n31sfpGP0s4bDC6ANplwS+w8JfYLFft/EyOzNZJpgvcnM4PVDQsyK?=
 =?us-ascii?Q?GZFL5whUGU0FbqfT1ykrb3A+chUa1QLVdjji9iQP3uFLvA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LCUScCSWiPjkQA7X56EcU4+M18jBTGyDAqZ/tQl71rCQQG2jCszS4zlLdXW6?=
 =?us-ascii?Q?LpKOmJTvOKIpRrgv69YkoOLHQF+kxzmvBS7hY60IT2GtykPsCz/kn/jtlL/r?=
 =?us-ascii?Q?MRoMKMVxKQOK39/eIfCycCPjnXclRLL7i9cD8CVlBkSmo0xf5/6wXRW2DdXl?=
 =?us-ascii?Q?hurZpHnD8X3aSF47UFGWx3gaK/DzVqIP6NgGH51dlVT4po4D+W4DF0Ph2hfR?=
 =?us-ascii?Q?nnAawMVOa/Z/wGw13HbVPZXr5dmoIZbmrGtkORth6m9iGe31FN6KOmY7xUZ4?=
 =?us-ascii?Q?pFQvAwiEUBj4QStTfNonYOyS7BqOLIyg/xmKDap5U1aNxHtqsJRf8o+RHHa3?=
 =?us-ascii?Q?+BI5MVE7MFlG2egS+ap1j84iS73id8OXaJubXUSG2MGA0hP3XZ9fd39wTe3u?=
 =?us-ascii?Q?/vb8Bhl3xufUfRQnXfPS7nZ3OnQl8cV0rjJ2VDzDSaTjW2m+PVSBtgy4HAOW?=
 =?us-ascii?Q?Q4D8A/Qn0bzx+clMc0fgb5nVW+NIwRZw1riML3b0alYfAtIIyfl0OQfQTOQY?=
 =?us-ascii?Q?+NO5SWSCl057lZA4MOdUpQe/Z+PLQKOJppssSr/DuDfzlRLDL2HmZLuQxgHU?=
 =?us-ascii?Q?2HI10s3uxSrDwoXTg20+FjYw2lYw4P9UNIkBlokxAjJee6wRLRJqOYbBwGBH?=
 =?us-ascii?Q?NcDMFSu0/1qLu1i5CxXoyK7i5cPWnBKMd2etYZSSpkqKGPJHRP0k3XuOcMEQ?=
 =?us-ascii?Q?bAnqypW+z/XxuYAS+VNPbQP3ZDGH6sbQQqYWhqkaC849tdGdZD8cOEvDQAMU?=
 =?us-ascii?Q?aY7K9+TTAdmb5EKosowuUoV08DamxoG8EeKJS+oQtsziaxcUwmLDSyiKAcC+?=
 =?us-ascii?Q?O6D8MZG5dBEIFZbFuBqNeH1MSjOdyxgQavRyhE+VKNiQw+oL7AAc1+YIwKAl?=
 =?us-ascii?Q?k+4Uy1odnzPi2AgF0TA4PHkwBFSXU0IGTbsFdojhmbt2uIu32L7RXc7KVryQ?=
 =?us-ascii?Q?RxQaTFZ2WyNYf+3phNy5ue6Rtkalc1hKBBcvRX79+XfOJp2iyCawmv/8Q6sr?=
 =?us-ascii?Q?ii0R3afGaWCGP72RCMAmaTYYVVBfDrNUxqO0jPllrrFC5hqNUoDoxWxjB918?=
 =?us-ascii?Q?uoHD0qACYdO9TOeQxE9A1kCw9aYbb2DCpM1k5RxJMhyo+xBZKkLFn0gmN5Vs?=
 =?us-ascii?Q?6PoPhI0Co2xfQr9RuKnQXJt/uthLMozBbNJNTx8EW74fNTIwVuaizkyooAPl?=
 =?us-ascii?Q?CIvc5oqLKGUxSPkICDGyt6Yy4jrEdyfqw1ys2JRaECSdSwhh61FBN2PS2BKU?=
 =?us-ascii?Q?qE/r3OGz4R23U32eX1JXjPhyEzx6dYuf0Hi/0jOYdbqBrYLINAHgYfqBuqsu?=
 =?us-ascii?Q?hkrFbgEkkdIL+d8YbrsFxsaFV/JHVR3NGfRkZtIeE6NciBNAlWB8MPm2HJf9?=
 =?us-ascii?Q?AppqTWIrgQzc+G81rE3vaYhyjfnqerlDsOk61Fh07GJiK+hfLTmi8gRQjB3H?=
 =?us-ascii?Q?mcdkPXsm6dvDfjWXHPOB3HML9WqZ+FRhDmkk+gwWu+u8Cusus3nV/uY/BGdM?=
 =?us-ascii?Q?4bV8RSKtYRE554vmA0PA9gvNJrmP/gHXAmqGYdFDU8FWdlltjlsJT5fsxJBG?=
 =?us-ascii?Q?O+SvcY9ja9lxQTO6jvBpVSGlplM3bBfcaGvDABpTUFkUK9oIb8HiF+gdFmC0?=
 =?us-ascii?Q?hA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35303591-3824-4753-f68a-08dd56fbe9a8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 06:56:51.5235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4+0gjWnEf9eDlvXVT0U1HjNL6mI8l6ROaW4qPLJEBQ/XVZ+jGFA1wWsX7XbDPVVCJ4+9DLh6R24Sx0OrkLQJElx9k+mR9r/58AYIuo5ndOQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5154
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

On Wed, Feb 26, 2025 at 03:22:24PM +0530, Tejas Upadhyay wrote:
>Allow user to provide a low latency hint. When set, KMD sends a hint
>to GuC which results in special handling for that process. SLPC will
>ramp the GT frequency aggressively every time it switches to this
>process.
>
>We need to enable the use of SLPC Compute strategy during init, but
>it will apply only to processes that set this bit during process
>creation.
>
>Improvement with this approach as below:
>
>Before,
>
>:~$ NEOReadDebugKeys=1 EnableDirectSubmission=0 clpeak --kernel-latency
>Platform: Intel(R) OpenCL Graphics
>  Device: Intel(R) Graphics [0xe20b]
>    Driver version  : 24.52.0 (Linux x64)
>    Compute units   : 160
>    Clock frequency : 2850 MHz
>    Kernel launch latency : 283.16 us
>
>After,
>
>:~$ NEOReadDebugKeys=1 EnableDirectSubmission=0 clpeak --kernel-latency
>Platform: Intel(R) OpenCL Graphics
>  Device: Intel(R) Graphics [0xe20b]
>    Driver version  : 24.52.0 (Linux x64)
>    Compute units   : 160
>    Clock frequency : 2850 MHz
>
>    Kernel launch latency : 63.38 us
>
>Compute PR: https://github.com/intel/compute-runtime/pull/794
>Mesa PR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33214
>
>V10(Lucas):
>  - Remove doc from drm-uapi.rst
>v9(Vinay):
>  - remove extra line, align commit message
>v8(Vinay):
>  - Add separate example for using low latency hint
>v7(Jose):
>  - Update UMD PR
>  - applicable to all gpus
>V6:
>  - init flags, remove redundant flags check (MAuld)
>V5:
>  - Move uapi doc to documentation and GuC ABI specific change (Rodrigo)
>  - Modify logic to restrict exec queue flags (MAuld)
>V4:
>  - To make it clear, dont use exec queue word (Vinay)
>  - Correct typo in description of flag (Jose/Vinay)
>  - rename set_strategy api and replace ctx with exec queue(Vinay)
>  - Start with 0th bit to indentify user flags (Jose)
>V3:
>  - Conver user flag to kernel internal flag and use (Oak)
>  - Support query config for use to check kernel support (Jose)
>  - Dont need to take runtime pm (Vinay)
>V2:
>  - DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT 1 planned for other hint(Szymon)
>  - Add motivation to description (Lucas)
>
>Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>---
> drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h |  3 +++
> drivers/gpu/drm/xe/xe_exec_queue.c            | 10 ++++++---
> drivers/gpu/drm/xe/xe_exec_queue_types.h      |  2 ++
> drivers/gpu/drm/xe/xe_guc_pc.c                | 16 ++++++++++++++
> drivers/gpu/drm/xe/xe_guc_submit.c            |  8 +++++++
> drivers/gpu/drm/xe/xe_query.c                 |  2 ++
> include/uapi/drm/xe_drm.h                     | 21 ++++++++++++++++++-

better now without the doc in the other file.

Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

> 7 files changed, 58 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
>index 85abe4f09ae2..b28c8fa061f7 100644
>--- a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
>+++ b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
>@@ -174,6 +174,9 @@ struct slpc_task_state_data {
> 	};
> } __packed;
>
>+#define SLPC_CTX_FREQ_REQ_IS_COMPUTE		REG_BIT(28)
>+#define SLPC_OPTIMIZED_STRATEGY_COMPUTE		REG_BIT(0)
>+
> struct slpc_shared_data_header {
> 	/* Total size in bytes of this shared buffer. */
> 	u32 size;
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>index 23a9f519ce1c..7c5c003d3c40 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>@@ -604,11 +604,12 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> 	struct xe_tile *tile;
> 	struct xe_exec_queue *q = NULL;
> 	u32 logical_mask;
>+	u32 flags = 0;
> 	u32 id;
> 	u32 len;
> 	int err;
>
>-	if (XE_IOCTL_DBG(xe, args->flags) ||
>+	if (XE_IOCTL_DBG(xe, args->flags & ~DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT) ||
> 	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> 		return -EINVAL;
>
>@@ -625,6 +626,9 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> 	if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.gt_count))
> 		return -EINVAL;
>
>+	if (args->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)
>+		flags |= EXEC_QUEUE_FLAG_LOW_LATENCY;
>+
> 	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
> 		if (XE_IOCTL_DBG(xe, args->width != 1) ||
> 		    XE_IOCTL_DBG(xe, args->num_placements != 1) ||
>@@ -633,8 +637,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>
> 		for_each_tile(tile, xe, id) {
> 			struct xe_exec_queue *new;
>-			u32 flags = EXEC_QUEUE_FLAG_VM;
>
>+			flags |= EXEC_QUEUE_FLAG_VM;
> 			if (id)
> 				flags |= EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD;
>
>@@ -680,7 +684,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> 		}
>
> 		q = xe_exec_queue_create(xe, vm, logical_mask,
>-					 args->width, hwe, 0,
>+					 args->width, hwe, flags,
> 					 args->extensions);
> 		up_read(&vm->lock);
> 		xe_vm_put(vm);
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>index 6eb7ff091534..cc1cffb5c87f 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>@@ -85,6 +85,8 @@ struct xe_exec_queue {
> #define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(3)
> /* kernel exec_queue only, set priority to highest level */
> #define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
>+/* flag to indicate low latency hint to guc */
>+#define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
>
> 	/**
> 	 * @flags: flags for this exec queue, should statically setup aside from ban
>diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>index 02409eedb914..25040efa043f 100644
>--- a/drivers/gpu/drm/xe/xe_guc_pc.c
>+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>@@ -995,6 +995,17 @@ static int pc_init_freqs(struct xe_guc_pc *pc)
> 	return ret;
> }
>
>+static int pc_action_set_strategy(struct xe_guc_pc *pc, u32 val)
>+{
>+	int ret = 0;
>+
>+	ret = pc_action_set_param(pc,
>+				  SLPC_PARAM_STRATEGIES,
>+				  val);
>+
>+	return ret;
>+}
>+
> /**
>  * xe_guc_pc_start - Start GuC's Power Conservation component
>  * @pc: Xe_GuC_PC instance
>@@ -1054,6 +1065,11 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
> 	}
>
> 	ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
>+	if (ret)
>+		goto out;
>+
>+	/* Enable SLPC Optimized Strategy for compute */
>+	ret = pc_action_set_strategy(pc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
>
> out:
> 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index b6a2dd742ebd..b95934055f72 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -15,6 +15,7 @@
> #include <drm/drm_managed.h>
>
> #include "abi/guc_actions_abi.h"
>+#include "abi/guc_actions_slpc_abi.h"
> #include "abi/guc_klvs_abi.h"
> #include "regs/xe_lrc_layout.h"
> #include "xe_assert.h"
>@@ -400,6 +401,7 @@ static void __guc_exec_queue_policy_add_##func(struct exec_queue_policy *policy,
> MAKE_EXEC_QUEUE_POLICY_ADD(execution_quantum, EXECUTION_QUANTUM)
> MAKE_EXEC_QUEUE_POLICY_ADD(preemption_timeout, PREEMPTION_TIMEOUT)
> MAKE_EXEC_QUEUE_POLICY_ADD(priority, SCHEDULING_PRIORITY)
>+MAKE_EXEC_QUEUE_POLICY_ADD(slpc_exec_queue_freq_req, SLPM_GT_FREQUENCY)
> #undef MAKE_EXEC_QUEUE_POLICY_ADD
>
> static const int xe_exec_queue_prio_to_guc[] = {
>@@ -414,14 +416,20 @@ static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
> 	struct exec_queue_policy policy;
> 	enum xe_exec_queue_priority prio = q->sched_props.priority;
> 	u32 timeslice_us = q->sched_props.timeslice_us;
>+	u32 slpc_exec_queue_freq_req = 0;
> 	u32 preempt_timeout_us = q->sched_props.preempt_timeout_us;
>
> 	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
>
>+	if (q->flags & EXEC_QUEUE_FLAG_LOW_LATENCY)
>+		slpc_exec_queue_freq_req |= SLPC_CTX_FREQ_REQ_IS_COMPUTE;
>+
> 	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
> 	__guc_exec_queue_policy_add_priority(&policy, xe_exec_queue_prio_to_guc[prio]);
> 	__guc_exec_queue_policy_add_execution_quantum(&policy, timeslice_us);
> 	__guc_exec_queue_policy_add_preemption_timeout(&policy, preempt_timeout_us);
>+	__guc_exec_queue_policy_add_slpc_exec_queue_freq_req(&policy,
>+							     slpc_exec_queue_freq_req);
>
> 	xe_guc_ct_send(&guc->ct, (u32 *)&policy.h2g,
> 		       __guc_exec_queue_policy_action_size(&policy), 0, 0);
>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>index ebfae746f861..e802bf34c02c 100644
>--- a/drivers/gpu/drm/xe/xe_query.c
>+++ b/drivers/gpu/drm/xe/xe_query.c
>@@ -339,6 +339,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
> 	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
> 		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
> 			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
>+	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
>+			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
> 	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
> 		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
> 	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 892f54d3aa09..6e510287eaf5 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -393,6 +393,8 @@ struct drm_xe_query_mem_regions {
>  *
>  *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
>  *      has usable VRAM
>+ *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY - Flag is set if the device
>+ *      has low latency hint support
>  *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>  *    required by this device, typically SZ_4K or SZ_64K
>  *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
>@@ -409,6 +411,7 @@ struct drm_xe_query_config {
> #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
> #define DRM_XE_QUERY_CONFIG_FLAGS			1
> 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
>+	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
> #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
> #define DRM_XE_QUERY_CONFIG_VA_BITS			3
> #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
>@@ -1204,6 +1207,21 @@ struct drm_xe_vm_bind {
>  *     };
>  *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
>  *
>+ *     Allow users to provide a hint to kernel for cases demanding low latency
>+ *     profile. Please note it will have impact on power consumption. User can
>+ *     indicate low latency hint with flag while creating exec queue as
>+ *     mentioned below,
>+ *
>+ *     struct drm_xe_exec_queue_create exec_queue_create = {
>+ *          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT,
>+ *          .extensions = 0,
>+ *          .vm_id = vm,
>+ *          .num_bb_per_exec = 1,
>+ *          .num_eng_per_bb = 1,
>+ *          .instances = to_user_pointer(&instance),
>+ *     };
>+ *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
>+ *
>  */
> struct drm_xe_exec_queue_create {
> #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
>@@ -1222,7 +1240,8 @@ struct drm_xe_exec_queue_create {
> 	/** @vm_id: VM to use for this exec queue */
> 	__u32 vm_id;
>
>-	/** @flags: MBZ */
>+#define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(1 << 0)
>+	/** @flags: flags to use for this exec queue */
> 	__u32 flags;
>
> 	/** @exec_queue_id: Returned exec queue ID */
>-- 
>2.34.1
>
