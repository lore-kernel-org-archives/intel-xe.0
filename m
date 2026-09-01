Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17F8C61DD3
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 15:13:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C04610ED54;
	Tue,  1 Sep 2026 15:13:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZsknK612";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74D510ED48
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 15:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788275584; x=1819811584;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SyTrEWU92puJfLF8eV/5vkw1ZCijv3/8CHsBXQM3EL0=;
 b=ZsknK612xoOx1c1+/9JUHIhrx1j3bip7lEthIfw3n5yTpIZZ8jaSPjcd
 bEFazwAZhg6YPJyt2lO5/+1r8O0iHSXhJTVfEQgIAKInrhqikje7ucnhF
 PtiMyhJKS54W9lvVQT/BiZ2cIMplt3/Wf7eE7R0itliHyAiyNaKFGMoM5
 5OV5M9Aqnq+e9gHAiwC3O7swXcfunyj260X+Ng28+prTfMJQ8dpfPeoSp
 13UH8AiYDDNnyNOv03+Ba/o5x6pyxhmAw6ZuvZWPUJKL5Thc+oTxxJfYe
 FSdIZ2/k00ZOvwzZNCFauUsbNXCplOj07zeLJcRa0+OezQZ1kWNvzr0Z5 g==;
X-CSE-ConnectionGUID: 45QNkuzzQmOcSjwXyXlJOQ==
X-CSE-MsgGUID: s2vAw3NsTYWeD/eLMVr//A==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="87843838"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="87843838"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 08:12:59 -0700
X-CSE-ConnectionGUID: 1bqsatBpTLGcbenbktNItQ==
X-CSE-MsgGUID: B+yu7M6PTsu1lH5wroItXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="265413300"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 08:12:59 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 08:12:58 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 08:12:58 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.12) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 08:12:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1jJVumbfQjcU1BLwispDF9Irb1BhGeDVy4GHKj2tVQOgniXBqLQzOnxvhoLkf9InND472V6Fu2gHMzRmnlHtJ/vOePUHt0NT+kXuQI9a3gdDd9QQ8U0ASF5FIuPI/+OcbXd5AIIWulpzFL9A7S4Wx871uqhsbz9buYz31PIVeECFDAvstzMroN30YBtD+R5gjUYh9zxqIgd1auuPK5DjJhKBPNExXZEqR7g2E2pgNlQM6lIFvAPaD3lEenyCz2PigyzY61lpp+W2cl4MFGITUmuXDCQd1n90tYzEEKdBBhFnH5ZJCL0ManWRJw6EYUIBwyZm9XwXHyo903QXT+vgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vtCl4MYRVoUqYWvaU7nMzpoJrd/95ObasG0cSn9DQGg=;
 b=rHiSo6YEDftrQaByPOuJ9KLefxVw93xAfBQ9SwuZveAnPr7EK4fqaaQ9WH6qN9gji0Bw7HUJOXpMxdoSw1F9qMzUr9LwQdQ1hzgypMMmPRYUTS3b+THYi0H+cZfOrv507yhFD0hhhEui+sHGOCYtBBTGcmmiULN+1YywKFgPhV444btudhR9JkH7ykqKAnZDUMaWExHW9SA0FNDB9sP43nv8hiY78UlHu5JIEcbIxDxx8CRT4b07clbXwCJBcA1wvMzu7lqFdSREGoe8hYMp3kvdpnjw097+i1FFQy8F82xDoZyYBMhkEZdnSeVrDIIXiVltylY+ziOmu6o30Afeew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by MN2PR11MB4535.namprd11.prod.outlook.com (2603:10b6:208:24e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 15:12:49 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 15:12:49 +0000
Message-ID: <d4cff797-ed1c-47c6-a25a-43547641af4d@intel.com>
Date: Tue, 1 Sep 2026 20:42:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/debugfs: Expose per-engine idle status
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>, <mallesh.koujalagi@intel.com>,
 <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <michal.wajdeczko@intel.com>
References: <20260723194303.2507234-2-sk.anirban@intel.com>
 <ecfc0273-eab7-4d5a-8937-53da468a5a73@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <ecfc0273-eab7-4d5a-8937-53da468a5a73@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0092.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::8) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|MN2PR11MB4535:EE_
X-MS-Office365-Filtering-Correlation-Id: c976e6be-3fee-4aa1-6b29-08df083b7c28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|6133799003|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 1gI0IY9bKtN9hDqy33DVqifv3ziWXo1Nacosu3dG3IFJLf/7IhFAkGyeK+BVW5/EpUGYqicVhwqpCjvre5t2zmeEBCg7EixuGp3sH/O2YZ8+GNo+LZYqhEN7xko6JRe3hfmPjkuvIolPQ/iR0FHdMmHedxJKIdmxkDQyoczK3aewIO2HyGQqFLa51vFINFpkfVAbYmYFfCO2gEn6LpiTeYncApPrxqKW1r6SnLRFkxgjMsrYjzGmD9GftKeS5yGIeIeOV+4nhxFwYCzFURPfFupyt4PNEtNLCFRmKBrhPLpmogYRz0N66RnHuUbKxTTBoeQBFxq8PKz1tLsUGbJXDPtAC1DWMsO7kcMdATCn9GMFyJrtxxxzgU1gdwdpVPMf/8Um1LIdsjXPVhrz7trFSf9gLfvKA9jBu0O1O9UdCpZSzN+DjrW8nrJ+mBvY3TitcFjzi0kUwUzlQt6T0P1BTQm0oemlHGanMCDhp81be5yJn5jHKMzhf+0gh1HeougRGHwHUf/lx75/MGST4CmSjE/3LE99/Gi9ULYZWxgauWYrjdGNcEXVL7jTKNzVV0JpB5IXBcHE9OG8TIIJO81wq0xmO9rnrsWvgcb1NSmJou0yqEDJZ6R2HY4ZYTRDCYmcCxw+K4XDaJnVq+EStWCsUGCHqhtoLrTA+bBPMphrHRE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkVZWmdBMENERUNUSGVkMTFSVWFkRW1QMXFqczBJUVdOSEViM3Q5dGt5c3RI?=
 =?utf-8?B?NHpRdEJHZE9FOXZHTGt6SEYvd05aZTVaeDhrdTVWV1VwanBVOVVxb253Vm42?=
 =?utf-8?B?Q2tvSzVzS3UwL1BxRGsxemhSb1VNZVE4ZktXcHBqUHBoTlplOWFlUGtaR3I2?=
 =?utf-8?B?QlA0VlBDelJyTTlOaGZlY0NnekhvQmpIWmYwSG5xSHB3T2NqTFdoM0p1eGJX?=
 =?utf-8?B?WExKVjQwazA0YmlBdTgvYzV5cm9QeUZ5azRLWHMyV1IvRGNBNkcyWWliSGgv?=
 =?utf-8?B?UXB0Y3hvVlZwQ3lSOEhDZ1VTMXEwMHNxUjdWTVJmdVBsWGloTks3cE1aWG1q?=
 =?utf-8?B?dHFJUlBLTUV1V0NYTGJqYnppaWQ0N1pLZnprc2tueXd1K0xnSEY5MXBLY1Bh?=
 =?utf-8?B?c3o4N0Y5dFpHWEFzMm40aGExcTdrNGNpUElnQXhVNCswS1VUR0thbTl5R1dy?=
 =?utf-8?B?NHJybGZFTi9NeTE1cDg4Q1pPUzZ0ZVZUOXJ4ODA4RjJVUzcxM1VLV0VmbU1r?=
 =?utf-8?B?RTl2ak52dE8wbFJzbUI2VjhGcjZWem1ad0IwOGtMcnF4Mnl5Nkd2dU93TlA0?=
 =?utf-8?B?SGQ0WG45M1M1MkVXbVlFb3RWMkt5MnMzdVhaRG9mQUhvYk9pdFFZdlBQdXor?=
 =?utf-8?B?eTVMVnZxaUx2bUVJamRrMkJ6amFyVUpDOER3MW5hUFFsU1YwaGljMlZaa0ZS?=
 =?utf-8?B?ejhNbzE4VTE0V2I5OXhYaVJ1Vk45S09sVm4vTGNPM1hZSUdTT09lMlQ4NUlN?=
 =?utf-8?B?VDZOMGdyNWRRM3B5clVWVWpodytkTXNuMUlkWmI2NUlsVGkzVUZTOGhQcVNk?=
 =?utf-8?B?TDJiSHJDQjFKTVR2NC9GazAxTW1JeS9VUFI2T2U3YTlRMzVDdU5TZ00yLzZH?=
 =?utf-8?B?YkRpUzZ5VTVHdzg1RDkvT1k3Y1ZYZUFHbEtCK3JrWVVjM2RKVE10RDhkRHhZ?=
 =?utf-8?B?NTNxa2h1d09vci9WS2FxVlh4T0JDQ2VLdnJGUGpJM1ZNdW9oZVI5U1Yxd3dv?=
 =?utf-8?B?OWNRajljVkw2TXVNYmVUd3hnenVYRnNZZHc2b2s0TlluSHBQQWFTVjhhcjJ2?=
 =?utf-8?B?YlhHbUVhaTFncjZqNkVhR0xqWWd0MGN5WnBuOHk0T0E3STJXWE5MLzF3OFB3?=
 =?utf-8?B?alVFaDFOa0EzY1JkczBmWDVWdnB1bG1oaXE4dEhWdEp0cmV2dmVEc2I1OUtm?=
 =?utf-8?B?OUVUeGw4cVMvbzJBUS9LVXlNVkZPcTIwODFmQkFJVFRCWi96WEdWQUhhRE0x?=
 =?utf-8?B?QW9BUGtxK3Raa2U5SWJzdVVpWVNzTnRheGdMcWRHWGVPZlpvRi82MTNBSkFU?=
 =?utf-8?B?ekxCeEYzekhvaUZtUVJyQUZQTmVVekUrL09wbWRKY0VHWGdOZ09Tb3MwL0hs?=
 =?utf-8?B?bmlPTlIyb01ZVEFBQ1RDSkgwVkFJYXVzOFhjTVVteGJZeG5tL3FPb1Bia3dp?=
 =?utf-8?B?VFN5RlFNOENaSm0wYVV3Q1lqdEJFSHJKMStZYTRnNXZ3b1QzbkZDQnp2ck1j?=
 =?utf-8?B?cXo2WkdTaC8wTlFGWVRDVmFPL0lkSWoxc1FoTW9xc1YxdStTelRwcWtobTBl?=
 =?utf-8?B?MkJDcWxOa2J3aGxNaGNrOUlxK3ZEb0lyYmxvbEg2OHdaWHdyZEJHc0FvaVNy?=
 =?utf-8?B?cnpmcGJzRU1Fc05QSml3NW01SzJDVWRPejJ2blBRWVIxWlUrd2xFT3BPQ01D?=
 =?utf-8?B?L3BucDJiOHU5b1h5ME9GaklDeFVHQjF1dGhyK2F5REpuc25qd2xHQlJ2YzM1?=
 =?utf-8?B?KzhqeW0wQnVJKzQwK0hqZWo4a2FRbTBDM20rQnU5bXRqd2ZiVytDWG4ycEIw?=
 =?utf-8?B?cUd0ZEExaVFWL0w3bXVRRnVZQ2tkamJsdi9pdW1ESmRrMXdERnkwK2NxczBM?=
 =?utf-8?B?eEZSU3VlQmp0NkhBT2U0NlVuWkZsYUJFMGRhNmh1eG9nUzJhNGpxSDdwYlpH?=
 =?utf-8?B?VGRuUWpHS29UOWhkeEcrZm9tN3hTVVErR0MyRm9FZk44SWErOXNNZm1DeUhG?=
 =?utf-8?B?OFliTE8yeDhpU3dXeXRsMEZ1MFllLzdHb2hUYzdpOVBVc3B4SlE2SDdxeUkw?=
 =?utf-8?B?bXZzeUI5WnRlbUhRd2xQbko3MUJNUDRoYnlIODJZZlp5TXFhN2ZWelUrSHF1?=
 =?utf-8?B?T1NUTkJTOWlxVnM5K1ZMaTEveTFXUG5NNklBdWpqZjFQSWdGZmxBN1EyOXZC?=
 =?utf-8?B?L3hKNDhJM09uU0RXNmVsK2cvMnV5ZlU0N1Y3VndZcFVqQ0ZnbTVwT2xMbEkr?=
 =?utf-8?B?NHBVUWRTdzV5Y1hhUXhKM3d3QW8zVnJKRHNrWVZEZ3R0ajI2LzhZeVV0SWxI?=
 =?utf-8?B?OWE3Z2tOMXRmTjRwcTlDb2tEVUlnc2oxTXYzcEg3RjErdk5sN1VEUT09?=
X-Exchange-RoutingPolicyChecked: gkiYwKi38nv5e97EvFmG5TvomZ3Yc08SFq4P8fQEt5D/lJr0ueAt6hiRMeO/uxA96YEVMzp5Mhc+405OwKjH6aK8pdejaqEKmbRqHZax9/82TlE+Bne9UMJCmD9eczYvshW0qewn6rUukuCHsZqWnqIN4xW2ibEMi/PnJN+qvod8nPpoavQAUrD/0dX/GvsA0toLSMOxe1lNyacq4i2WUXj8y1+N/O4p89xHjKbyUdrNG/ZJ9o9dfWLdI4jYPrxKWT6szsDO98UldWqqB1cCQ3dafmH/ojU/wKzCpp/UoFzJcPu68b05hl0yOTbsLcfHVtoiI67APSMAiT0lkIxG7w==
X-MS-Exchange-CrossTenant-Network-Message-Id: c976e6be-3fee-4aa1-6b29-08df083b7c28
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 15:12:49.3606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tmypC1LKVcTvFOglkdmCjnwgaxmoOy4xPsMrayqOMG01sO96oqLATdsXzQpEQk4eplBCnDWSaTVWYVDDRKwLYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4535
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

On 29-08-2026 05:00 am, Belgaumkar, Vinay wrote:
>
> On 7/23/2026 12:43 PM, Sk Anirban wrote:
>> Extend the existing "hw_engines" debugfs to iterate over all hardware
>> engines and dump their idle state: whether the engine pipe is idle or
>> busy, whether C6 entry is allowed, and (where available) the forcewake
>> request status.
>>
>> v2: Use existing debugfs (Matt Brost)
>>
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h | 27 ++++++++++++++
>>   drivers/gpu/drm/xe/xe_devcoredump.c  |  4 ++-
>>   drivers/gpu/drm/xe/xe_gt_debugfs.c   | 54 +++++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_guc_capture.c  |  2 --
>>   4 files changed, 83 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 08251c7a1a4b..accf3012bad2 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -196,6 +196,33 @@
>>   #define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE    REG_BIT(14)
>>   #define   FAST_CLEAR_VALIGN_FIX            REG_BIT(13)
>>   +#define MSG_IDLE_CS                XE_REG(0x8000)
>> +#define MSG_IDLE_VCS0                XE_REG(0x8004)
>> +#define MSG_IDLE_VCS1                XE_REG(0x8008)
>> +#define MSG_IDLE_VCS2                XE_REG(0x80C0)
>> +#define MSG_IDLE_VCS3                XE_REG(0x80C4)
>> +#define MSG_IDLE_VCS4                XE_REG(0x80C8)
>> +#define MSG_IDLE_VCS5                XE_REG(0x80CC)
>> +#define MSG_IDLE_VCS6                XE_REG(0x80D0)
>> +#define MSG_IDLE_VCS7                XE_REG(0x80D4)
>> +#define MSG_IDLE_VECS0                XE_REG(0x8010)
>> +#define MSG_IDLE_VECS1                XE_REG(0x80D8)
>> +#define MSG_IDLE_VECS2                XE_REG(0x80DC)
>> +#define MSG_IDLE_VECS3                XE_REG(0x80E0)
>> +#define MSG_IDLE_BCS0                XE_REG(0x800C)
>> +#define MSG_IDLE_BCS1                XE_REG(0x8680)
>> +#define MSG_IDLE_BCS2                XE_REG(0x8684)
>> +#define MSG_IDLE_BCS3                XE_REG(0x8688)
>> +#define MSG_IDLE_BCS4                XE_REG(0x868C)
>> +#define MSG_IDLE_BCS5                XE_REG(0x8690)
>> +#define MSG_IDLE_BCS6                XE_REG(0x8694)
>> +#define MSG_IDLE_BCS7                XE_REG(0x8698)
>> +#define MSG_IDLE_BCS8                XE_REG(0x869C)
>> +#define MSG_IDLE_GSCCS0                XE_REG(0xA62C)
>> +#define   MSG_IDLE_INDICATION            REG_BIT(0)
>> +#define   MSG_IDLE_C6_ALLOWED            REG_BIT(1)
>> +#define   MSG_IDLE_FW_STATUS            REG_GENMASK(13, 9)
> This field is called FW_REQ in bspec, we should stick to the same, so 
> MSG_IDLE_FW_REQ.
Sure, I will modify this.
>> +
>>   #define XE2LPM_CCCHKNREG1            XE_REG(0x82a8)
>>     #define VF_PREEMPTION                XE_REG(0x83a4, 
>> XE_REG_OPTION_MASKED)
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c 
>> b/drivers/gpu/drm/xe/xe_devcoredump.c
>> index 5f2b90b18f97..b918f046ae15 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>> @@ -127,8 +127,10 @@ static ssize_t __xe_devcoredump_read(char 
>> *buffer, ssize_t count,
>>         drm_puts(&p, "\n**** HW Engines ****\n");
>>       for (i = 0; i < XE_NUM_HW_ENGINES; i++)
>> -        if (ss->hwe[i])
>> +        if (ss->hwe[i]) {
>>               xe_engine_snapshot_print(ss->hwe[i], &p);
>> +            drm_puts(&p, "\n");
>> +        }
>>         drm_puts(&p, "\n**** VM state ****\n");
>>       xe_vm_snapshot_print(ss->vm, &p);
>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c 
>> b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> index c38bcacb27e4..621d1e57e997 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> @@ -10,6 +10,7 @@
>>   #include <drm/drm_debugfs.h>
>>   #include <drm/drm_managed.h>
>>   +#include "regs/xe_gt_regs.h"
>>   #include "xe_device.h"
>>   #include "xe_force_wake.h"
>>   #include "xe_gt.h"
>> @@ -22,6 +23,7 @@
>>   #include "xe_guc_hwconfig.h"
>>   #include "xe_hw_engine.h"
>>   #include "xe_lrc.h"
>> +#include "xe_mmio.h"
>>   #include "xe_mocs.h"
>>   #include "xe_pat.h"
>>   #include "xe_pm.h"
>> @@ -111,6 +113,38 @@ int xe_gt_debugfs_show_with_rpm(struct seq_file 
>> *m, void *data)
>>     static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
>>   {
>> +    static const struct {
>> +        struct xe_reg reg;
>> +        bool has_fw;
>> +    } msg_idle_reg[XE_NUM_HW_ENGINES] = {
>> +        [XE_HW_ENGINE_RCS0] = { MSG_IDLE_CS, true },
>> +        [XE_HW_ENGINE_BCS0] = { MSG_IDLE_BCS0, true },
>> +        [XE_HW_ENGINE_BCS1] = { MSG_IDLE_BCS1, false },
>> +        [XE_HW_ENGINE_BCS2] = { MSG_IDLE_BCS2, false },
>> +        [XE_HW_ENGINE_BCS3] = { MSG_IDLE_BCS3, false },
>> +        [XE_HW_ENGINE_BCS4] = { MSG_IDLE_BCS4, false },
>> +        [XE_HW_ENGINE_BCS5] = { MSG_IDLE_BCS5, false },
>> +        [XE_HW_ENGINE_BCS6] = { MSG_IDLE_BCS6, false },
>> +        [XE_HW_ENGINE_BCS7] = { MSG_IDLE_BCS7, false },
>> +        [XE_HW_ENGINE_BCS8] = { MSG_IDLE_BCS8, false },
>> +        [XE_HW_ENGINE_VCS0] = { MSG_IDLE_VCS0, true },
>> +        [XE_HW_ENGINE_VCS1] = { MSG_IDLE_VCS1, true },
>> +        [XE_HW_ENGINE_VCS2] = { MSG_IDLE_VCS2, true },
>> +        [XE_HW_ENGINE_VCS3] = { MSG_IDLE_VCS3, true },
>> +        [XE_HW_ENGINE_VCS4] = { MSG_IDLE_VCS4, true },
>> +        [XE_HW_ENGINE_VCS5] = { MSG_IDLE_VCS5, true },
>> +        [XE_HW_ENGINE_VCS6] = { MSG_IDLE_VCS6, true },
>> +        [XE_HW_ENGINE_VCS7] = { MSG_IDLE_VCS7, true },
>> +        [XE_HW_ENGINE_VECS0] = { MSG_IDLE_VECS0, true },
>> +        [XE_HW_ENGINE_VECS1] = { MSG_IDLE_VECS1, true },
>> +        [XE_HW_ENGINE_VECS2] = { MSG_IDLE_VECS2, true },
>> +        [XE_HW_ENGINE_VECS3] = { MSG_IDLE_VECS3, true },
>> +        [XE_HW_ENGINE_CCS0] = { MSG_IDLE_CS, true },
>> +        [XE_HW_ENGINE_CCS1] = { MSG_IDLE_CS, true },
>> +        [XE_HW_ENGINE_CCS2] = { MSG_IDLE_CS, true },
>> +        [XE_HW_ENGINE_CCS3] = { MSG_IDLE_CS, true },
>> +        [XE_HW_ENGINE_GSCCS0] = { MSG_IDLE_GSCCS0, false },
> aren't the media related idle message registers only valid for media 
> GT and similarly those for render on render GT? Here we seem to be 
> reading all registers on both GTs? So some values are invalid.
for_each_hw_engine() only iterates engines present on that GT. So on 
each GT we only read its own engines' idle registers.
>> +    };
>>       struct xe_hw_engine *hwe;
>>       enum xe_hw_engine_id id;
>>   @@ -118,9 +152,27 @@ static int hw_engines(struct xe_gt *gt, struct 
>> drm_printer *p)
>>       if (!xe_force_wake_ref_has_domain(fw_ref.domains, 
>> XE_FORCEWAKE_ALL))
>>           return -ETIMEDOUT;
>>   -    for_each_hw_engine(hwe, gt, id)
>> +    for_each_hw_engine(hwe, gt, id) {
>> +        struct xe_reg reg = msg_idle_reg[id].reg;
>> +        u32 val;
>> +
>>           xe_hw_engine_print(hwe, p);
>>   +        val = xe_mmio_read32(&gt->mmio, reg);
>> +
>> +        if (msg_idle_reg[id].has_fw)
>> +            drm_printf(p, "\tpipe %s, C6 %s, fw_req 0x%02x\n",
>> +                   val & MSG_IDLE_INDICATION ? "idle" : "busy",
>> +                   val & MSG_IDLE_C6_ALLOWED ? "allowed" : "not 
>> allowed",
>> +                   REG_FIELD_GET(MSG_IDLE_FW_STATUS, val));
>
> should be FW_REQ here as well.
Sure, I will modify this.

Thanks,
Anirban

>
> Thanks,
>
> Vinay.
>
>> +        else
>> +            drm_printf(p, "\tpipe %s, C6 %s\n",
>> +                   val & MSG_IDLE_INDICATION ? "idle" : "busy",
>> +                   val & MSG_IDLE_C6_ALLOWED ? "allowed" : "not 
>> allowed");
>> +
>> +        drm_puts(p, "\n");
>> +    }
>> +
>>       return 0;
>>   }
>>   diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c 
>> b/drivers/gpu/drm/xe/xe_guc_capture.c
>> index 82df19b304e1..5a4d085660a2 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>> @@ -1868,8 +1868,6 @@ void xe_engine_snapshot_print(struct 
>> xe_hw_engine_snapshot *snapshot, struct drm
>>           snapshot_print_by_list_order(snapshot, p, 
>> GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
>>                            list);
>>       }
>> -
>> -    drm_puts(p, "\n");
>>   }
>>     /**
