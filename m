Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C19C04FFE
	for <intel-xe@archiver.kernel.org>; Fri, 26 Apr 2024 15:07:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A924710E55D;
	Fri, 26 Apr 2024 15:07:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xu9fv4Zi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C4010E55D
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Apr 2024 15:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714144051; x=1745680051;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kjkP2bqCcSBqrUCxp5RZDLtgK3MxbLck7n8L0lDVrCw=;
 b=Xu9fv4Zia8tthRrPfodpx7m/oezRTzJTXtRR+L8UaOEnsu7NxPm9Q4dy
 nKKgvcZbIBt8ageFMRuYV5Ron1YgBW052aLJPaCRPLyKgZCj4ZiwrT2wL
 77WzNmuPVLK9UyoTyFUyZspf1Wp1PGFFWxCJMcuFdPBfi5JcVoPT5zShD
 vECF+TakoB5T3Vfg/l+7CpT0+SMBBYr2l/OIxxReCdfkTDldVWUxEwKX+
 IlEDa1P8FtrmdYqdD/JWTIebZOJse1T/fXgyW/bU7AFi32hFaEyEKXAiv
 GmVz/DwR3sj2Bc2nrq575VEfvf9UqHafWHyGOw2fd7o8IY4qMOR4Hnw4E A==;
X-CSE-ConnectionGUID: zURmTXRETmyX/DTVh5MDJQ==
X-CSE-MsgGUID: Q4bArAPSSpmsX7qdh9vLhA==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="9732181"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9732181"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:07:30 -0700
X-CSE-ConnectionGUID: 47iqJibqQJ+Mc8LIYbQl6A==
X-CSE-MsgGUID: 6DBObpTSS9K5/YBIk440Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="62921881"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Apr 2024 08:07:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 08:07:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 08:07:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Apr 2024 08:07:18 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Apr 2024 08:07:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E41ZMrvgS2Vak+S/mujBmD8YaeR1Vvn3SK5tkITN26GOUQ2Y4tW/55x0T+AI+qHUAsBYsju/WhpSIepcpDcatgZV0cgQmvHZGxSo7AX4wgzoTwgr671aJtUUVC60aVl1udZC0pWe48cN6dc+tZVrnfaGr/y56uTwjjcy9DaZNtRUxwHrnwUOQaK8o6Lp/8kEwO7loU2yL4Tt8t8n9nujBx9+7ek58N71uwXj9eIdflVDi45gDCtRLR0puEzr6nxWW40sNPoBULET/3b/ywngHpf0VZlb5MwdGKQDUokGr7Up9zFAOZa1zzaY/JOG3jQoUH8KUAKxdLnixtbGeQi+Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5Zibt/MoXn9a8sQLpdmAmzHlXSaLPqb7ATMu0kb4NA=;
 b=CTf3X0vnNYBe95y6xEBhrSDjHBg/uHbZ4e9deko4gKORRBmaeUiiUJdZh0m/DtWum8wgfduJMgbK8sAi0wYwwNLbAMIaC4HLKx2IDpoMCEEK4C5Epq8IM/EdcnTsrr5bMbiZbJHdtLQhdfdRz8u3aPEzx9+fNjyMYzx+89yY6oGAuRyjcV5gEEfpyq51UlGVvier/JXYhgNhbCZx5VFIENJ26FE4zIfF48eZJYcVCS3WR3g7DQaSmK7UhtaYEli2wdy1ubcmq5xTqRIhr3eeEeMcr7Rf0Uu5axXOlytIErZS67rmxZBSG4Ul6pcxOMTXuWRIlrX5RAb9vhGts97D+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB6496.namprd11.prod.outlook.com (2603:10b6:8:c0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.24; Fri, 26 Apr
 2024 15:07:16 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7519.021; Fri, 26 Apr 2024
 15:07:16 +0000
Date: Fri, 26 Apr 2024 17:07:13 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe/pf: Implement pci_driver.sriov_configure
 callback
Message-ID: <20240426150713.ntnegd6r4s3qbpvk@intel.com>
References: <20240426132217.2351-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240426132217.2351-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI1P293CA0018.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::12) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB6496:EE_
X-MS-Office365-Filtering-Correlation-Id: deb15f14-3ed1-495b-6052-08dc66028f42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0VvOVdHSXg3SUE4N2ppOFgxWWp6UmcrQXg3QWptMFBaelNnaDBYT2FlbjUy?=
 =?utf-8?B?YkRralR0TVJVSmxobUM2L25aVk9iNCtGSHEwL01DTjFPanVJNG96QzI2MTIr?=
 =?utf-8?B?MGc1TnRiVkcwU1JDQ2dwNmlsSzllUnBzZXJORm1UbSswSWVQMzBiSmVVQU0r?=
 =?utf-8?B?eDh2aWRoVEhxZnVGTmhkQnI1QU1RMndWdW5MVFpvbTlXZW50ZWhhOVk1dnV4?=
 =?utf-8?B?UStqSTlFMmQ1OUY1akNxc3Jpck9ac2tJYTRyUHdiT3BwQ01nZjEydnVudENa?=
 =?utf-8?B?czFWNm5OaS9HK0EwdTJLcW1YaU9ZbU9vSzlIdVJtMG9hT3NvMUNQd1VvYU90?=
 =?utf-8?B?UDdLKzhrbUFpK2MvR3ZObVpIZ0Y3enc1bVNFcVhnY2NHVjkxSVNPM0dOMnhE?=
 =?utf-8?B?Z1NXaEgrZFFScVdDQU00SmN2K3NSYURtclU5SjR4NWhvY21mZW9lUmZhUEFR?=
 =?utf-8?B?N1I2RWdPYk03R2JLZXF4YmpybndjNWlBNHU0S0ZaUUJ4b3RycTUzVDNMR29t?=
 =?utf-8?B?RGNERlpxNFBpRWxydXNCTHRPTFRscTh0a1A5cXlxNVJxdFIyTFBUcEd4S3k4?=
 =?utf-8?B?Q2NYQkVrM1pibnVZdXU3RENhRmxnVEIraUlwcTZ2bkFGM0x1R1ppMmVnNzhI?=
 =?utf-8?B?SEg0RXVnYUp4Rk8yejl6NC9iSVByVU9uVjVzUTVJeUwrMW96RHRBL0cwMElB?=
 =?utf-8?B?TXJpaGZ0VHE4NjI1SUhORjUrU1p1ZHpNY3BsOFR6WGFod3FMSnJPcVc0d0ho?=
 =?utf-8?B?c2lvZDhuL3Z6eHFsNXYyNlV1c0Vad1lFSW56SS9iT3hCRHFjbkRjSUUwWWtL?=
 =?utf-8?B?ZGhBOTR6NGVBM0VYT3RlVkN2N3VvUXBFWGVuRjdML01YUkQvTU5FWGJJVVFX?=
 =?utf-8?B?b1p5NnAzR3NxZWdGNU9LWDQrWUkxVmUySHFDNEV2OG95RlNicy9lOE1KS0E5?=
 =?utf-8?B?SGRZNjJvMkRqRVRONU5neVA5YnZsTjFOVG50a3BueHZtSG44QS9NV0VzRi9y?=
 =?utf-8?B?RkduSEwwbTAwRnlGdm5jYmYyUkhlU0hicUlIUlc3dk1VbldaZUMzWG1ZZVRa?=
 =?utf-8?B?UTk2QkI5dkx5NmpsS21TNVl5OWFiL002ODlyVnN2UGxuMzdQTXpKTXllc3Vh?=
 =?utf-8?B?TEJtVzZ6RWgxazR5QjlvQ25kcXJrWEl0MFZ2WXpodm9DanZ5cEtkNXdZUVpy?=
 =?utf-8?B?eExTNzdIMFU1QlVDNlgzaWxIandxdE00SVlIMjUrZkdrLzVDMkdsVTl3MDZF?=
 =?utf-8?B?YWh2eWpLY1NGdkNUeFRYS0pIdy9LbWxpTWZFNS9xY3ZaRE9BYitYM3Z6VWxU?=
 =?utf-8?B?WnRXZWludjE0d1JnZWxMcDFzbllsZXIzK1ZCK2FBc1hjUFlrRVF1MXJLZzhY?=
 =?utf-8?B?Ym1sZmlObGxhUFhrYTV0eTRiQUVMRE9LdnNCK0JKSnIyd0VFSDFvdTAvOUVW?=
 =?utf-8?B?dWRiVCsrcEVQT2tlbCtNbE5EVXBWQVpGbHgvOXRUcmtwaElFS0JVVzhOSGpD?=
 =?utf-8?B?TnV3VWNpbmg1L3ZrWHRzellMOGVuZkYzM2VCMzZwOHlhNkxNWjhkTU00cnV4?=
 =?utf-8?B?Ukt3aWhGdmhzRTBPOWh3MlZsRHF5RFJaZHovcnFCbU44ZU1KWVZEczNXQjk0?=
 =?utf-8?B?dFlnclYyeXhmUFhiVGFGMUhpRUl6d05lTmEyendaZUVCOTdmZGZuYlgvWkZi?=
 =?utf-8?B?enNLblYzTXRnU21RalM3bVVyWWlHR1BNczRoRC9tMVJZWHIrNGZrM1FRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekphRTI3RW83WHpxTHBML2pvSWZKYkt0cEM0eFo3V0gvTzEyRWF5T0lTMXp2?=
 =?utf-8?B?dFFvQTBLaEJrR1R0N2JrQklpZUEwOTJtSUc2aXlxUmEzZGR2UW1PY1FYajNj?=
 =?utf-8?B?d0pzS3ZLL01ydlhvMGlkR1M3eWJWYUE3ci9lTnl2UkVScFZzMHNDc3FIM2Zs?=
 =?utf-8?B?Mk0veGh0ZmhUcldSeXRWbEIyVU1QMnhUM1hEeTNUTlc1eGVLYmI5cmhrYzRS?=
 =?utf-8?B?RnZ6RHBhNXp3M3VxWjJsK1hrUG9CRHJYdlNDZ2tydUtVZXlvUVdRQ3RHU01n?=
 =?utf-8?B?V0FuVHg2WFFtNGM3c0t2SklwMEFFN0NZK2c4Tm5kVWNRMklPSTBFdWxvLzVk?=
 =?utf-8?B?RnkxZjg0clNKUzFpTk1lNEo4bjFrSHBFQ1NFK3lWWU9qSXF3RXBaTE5najVP?=
 =?utf-8?B?ZkZ3RllCQVVranBRMGpCUnkwNThqaU85eWtMVksyMzNXT2NMZUo3V0RnL2FX?=
 =?utf-8?B?L3VuSTVoeWhWWEtqelhFMnJ4V1p4NHU5MENLZ2xiaEVROTRWMmFpaHN5TE45?=
 =?utf-8?B?VGFXQmcvTHNrbmdjaWhUdWJMdGFZQ05OalJMOE1BSWhxNDh2bmxKSW5yK1pX?=
 =?utf-8?B?blBGd3pWTUo3eHozYkh6RVVITWl6ZEhqb1F1TTNIWVJBMjBoTVdEdUdEM2ov?=
 =?utf-8?B?UGdsaDZCSzFsY08zTC9iTHRCdVIyZDlZTWNHb1RSd2kxK3NHWVVyK3JsVFlO?=
 =?utf-8?B?MWoweC8yZTNYWm5zekZNd1NmOW1SVVprOXMvZFJia3VCdmNRWmtJTENHLzV4?=
 =?utf-8?B?bUFBUTZpYzhxM1llamI0NDFKNHUzb05KaEcwa0psaU1TdklvWndBRm1WMzZn?=
 =?utf-8?B?SjIxMzRnQkpNSlRiZktiZm13QmpQbVBMaG4zS0ZoU3NsU0JZYk9iVTJnelVh?=
 =?utf-8?B?L0JJdjBnMTZUZnpVQTZXUG1BaWp3TzlKOVRIWW4yUXEwMkU5SkpIV0o3Y1M5?=
 =?utf-8?B?ZVlOemkyWFNVMDNTdno4V2JjdUp3L3Jmb1NSVENPNnp3SXVscWRPbWZySWYr?=
 =?utf-8?B?QnRmV2VSWFBIeTRZWktENDdGREhkS1B1T1pDU3AwOFRwRGJreVhMaFo0dUJM?=
 =?utf-8?B?a3o5TGxRS2JQYmJRWTVmbVpLSC9nVExhY3p2aDZORTQyR3FjUE51ZkxvV1Nm?=
 =?utf-8?B?eUhCZlVURW5NUDZlWG55MGJNSjlzenVaYnczTUM3WkJKV1hXeFVxWnNKbXhV?=
 =?utf-8?B?dzVTSExPWmFiTko4b3Q5WHk4TmVBWDZrM0FXVlJsbVVIU2kxdTc1Myt2Wno2?=
 =?utf-8?B?Ti8xcHUvSGNCdHc0ZGxBOVN3eFR5b0tBaU11THZRWk9kdkFXMjVjMDA2MmFl?=
 =?utf-8?B?REYwY0Jqd1phcEVUb0NMbW9MQ1Fxa2k5cURyZzNZZDlqbzFyVmJNUytDWGtt?=
 =?utf-8?B?dVptTFBIbXBoZ0VPbTFyeE00M0ZZREk4WC9jTWlxaG5BSUVrdkRTNGtRUXFL?=
 =?utf-8?B?N09jWXpjWHc3M1dZd2xnVHZNOVVoQTJJTmY0eUlONDkzUUQ5cFpNbk9nZk9p?=
 =?utf-8?B?S1F0d1REQUNLRnAvTVA3TXQ0a1l4cHpCb1daMlVjS000dkpabVQ2S0U1c3JJ?=
 =?utf-8?B?SXVLSEJtb2J0VUxFdTVmOVBLODB4RGhIRVhGMEd2M29yMmhJMzljN0J5MnVp?=
 =?utf-8?B?UitrRWhodnJQa3J3ZEJ2RHBqdDhiM2Jvb1lMbjFqR3R0RURPdUVTNXB5cTFJ?=
 =?utf-8?B?dm5WTE1xS21uUW9EWWVxMFJzUVdHTHVNSGlaeExURmFJeVJpbGRQOU5ieFp1?=
 =?utf-8?B?ZmhRWU5xSzBDdkNwY0dBWWpUTG1zLy9YMEROZVExblNwT1VwQWxsWHU2Q0xB?=
 =?utf-8?B?aXM0Y0lVNnVURUozTktxaXZ4cTMzbEtpVm1nMzRLTE5lZ0JYeThRd3MrbjNF?=
 =?utf-8?B?Nk5OWDhtWjhrclJncUU4S1hSbUhYaGV0UXNiZXF6WkhjbDE1NzdKbHpGUkJC?=
 =?utf-8?B?Y0YxekNKbkNhTHFIZGhyOU5BS05jaExleUQ5MUNZeThIWnNxTGNsV0x5UWhu?=
 =?utf-8?B?MmR6aERLcDBVYkpnOTc5aTViRkl3YWR5SEpJb1ZGUE94Sk9yRTRsQjM0MStl?=
 =?utf-8?B?SGxKdmJwckFwQ1hTUU1hbVZFSmtIbCtEZStzV1VTcFZQL2htUkpoMkY5QlZ2?=
 =?utf-8?B?S1dUVGpSMTdXalBaVjVnTVcrMVZHb0NQRHRuNGR0Zm1oa256TEhmSFg0YTFB?=
 =?utf-8?B?L2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: deb15f14-3ed1-495b-6052-08dc66028f42
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 15:07:16.0875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ODJeKN19CiCNaXPANHIKEAXc/ZVTc8ZRRVI8ZlCEk73p0I8HGgL/jM03gcwznC8TDtMrnW88cxwiHjmcF65tkZb5O3GnulIl8lhVIc6Krk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6496
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2024-kwi-26 15:22:17 +0200]:
> The PCI subsystem already exposes the "sriov_numvfs" attribute
> that users can use to enable or disable SR-IOV VFs. Add custom
> implementation of the .sriov_configure callback defined by the
> pci_driver to perform additional steps, including fair VFs
> provisioning with the resources, as required by our platforms.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
> v2: check result of VFs provisioning (Piotr)
>     use xe_sriov_pf_get_totalvfs consistently (Piotr)
>     prefer VFID instead of plain a VF number (Piotr)
> ---
>  drivers/gpu/drm/xe/Makefile       |   1 +
>  drivers/gpu/drm/xe/xe_pci.c       |   4 +
>  drivers/gpu/drm/xe/xe_pci_sriov.c | 138 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pci_sriov.h |  13 +++
>  4 files changed, 156 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_pci_sriov.c
>  create mode 100644 drivers/gpu/drm/xe/xe_pci_sriov.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index a67977edff5b..6acde66f0827 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -169,6 +169,7 @@ xe-$(CONFIG_PCI_IOV) += \
>  	xe_lmtt.o \
>  	xe_lmtt_2l.o \
>  	xe_lmtt_ml.o \
> +	xe_pci_sriov.o \
>  	xe_sriov_pf.o
>  
>  # include helpers for tests even when XE is built-in
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index a0cf5dd803c2..f3efde939df4 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -23,6 +23,7 @@
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
>  #include "xe_module.h"
> +#include "xe_pci_sriov.h"
>  #include "xe_pci_types.h"
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
> @@ -952,6 +953,9 @@ static struct pci_driver xe_pci_driver = {
>  	.probe = xe_pci_probe,
>  	.remove = xe_pci_remove,
>  	.shutdown = xe_pci_shutdown,
> +#ifdef CONFIG_PCI_IOV
> +	.sriov_configure = xe_pci_sriov_configure,
> +#endif
>  #ifdef CONFIG_PM_SLEEP
>  	.driver.pm = &xe_pm_ops,
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> new file mode 100644
> index 000000000000..75248fdd6cee
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> @@ -0,0 +1,138 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#include "xe_assert.h"
> +#include "xe_device.h"
> +#include "xe_gt_sriov_pf_config.h"
> +#include "xe_pci_sriov.h"
> +#include "xe_pm.h"
> +#include "xe_sriov.h"
> +#include "xe_sriov_pf_helpers.h"
> +#include "xe_sriov_printk.h"
> +
> +static int pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	int result = 0, err;
> +
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_sriov_pf_config_set_fair(gt, VFID(1), num_vfs);
> +		result = result ?: err;
> +	}
> +
> +	return result;
> +}
> +
> +static void pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	unsigned int n;
> +
> +	for_each_gt(gt, xe, id)
> +		for (n = 1; n <= num_vfs; n++)
> +			xe_gt_sriov_pf_config_release(gt, n, true);
> +}
> +
> +static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	int total_vfs = xe_sriov_pf_get_totalvfs(xe);
> +	int err;
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +	xe_assert(xe, num_vfs > 0);
> +	xe_assert(xe, num_vfs <= total_vfs);
> +	xe_sriov_dbg(xe, "enabling %u VF%s\n", num_vfs, str_plural(num_vfs));
> +
> +	/*
> +	 * hold additional reference to the runtime PM as long as VFs are
> +	 * enabled to keep GuC alive - will be released in pf_disable_vfs()
> +	 */
> +	xe_pm_runtime_get(xe);
> +
> +	err = pf_provision_vfs(xe, num_vfs);
> +	if (err < 0)
> +		goto failed;
> +
> +	err = pci_enable_sriov(pdev, num_vfs);
> +	if (err < 0)
> +		goto failed;
> +
> +	xe_sriov_info(xe, "Enabled %u of %u VF%s\n",
> +		      num_vfs, total_vfs, str_plural(total_vfs));
> +	return num_vfs;
> +
> +failed:
> +	pf_unprovision_vfs(xe, num_vfs);
> +	xe_pm_runtime_put(xe);
> +
> +	xe_sriov_notice(xe, "Failed to enable %u VF%s (%pe)\n",
> +			num_vfs, str_plural(num_vfs), ERR_PTR(err));
> +	return err;
> +}
> +
> +static int pf_disable_vfs(struct xe_device *xe)
> +{
> +	struct device *dev = xe->drm.dev;
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	u16 num_vfs = pci_num_vf(pdev);
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +	xe_sriov_dbg(xe, "disabling %u VF%s\n", num_vfs, str_plural(num_vfs));
> +
> +	if (!num_vfs)
> +		return 0;
> +
> +	pci_disable_sriov(pdev);
> +
> +	pf_unprovision_vfs(xe, num_vfs);
> +
> +	/* not needed anymore - see pf_enable_vfs() */
> +	xe_pm_runtime_put(xe);
> +
> +	xe_sriov_info(xe, "Disabled %u VF%s\n", num_vfs, str_plural(num_vfs));
> +	return 0;
> +}
> +
> +/**
> + * xe_pci_sriov_configure - Configure SR-IOV (enable/disable VFs).
> + * @pdev: the &pci_dev
> + * @num_vfs: number of VFs to enable or zero to disable all VFs
> + *
> + * This is the Xe implementation of struct pci_driver.sriov_configure callback.
> + *
> + * This callback will be called by the PCI subsystem to enable or disable SR-IOV
> + * Virtual Functions (VFs) as requested by the used via the PCI sysfs interface.
> + *
> + * Return: number of configured VFs or a negative error code on failure.
> + */
> +int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	int ret;
> +
> +	if (!IS_SRIOV_PF(xe))
> +		return -ENODEV;
> +
> +	if (num_vfs < 0)
> +		return -EINVAL;
> +
> +	if (num_vfs > xe_sriov_pf_get_totalvfs(xe))
> +		return -ERANGE;
> +
> +	if (num_vfs && pci_num_vf(pdev))
> +		return -EBUSY;
> +
> +	xe_pm_runtime_get(xe);
> +	if (num_vfs > 0)
> +		ret = pf_enable_vfs(xe, num_vfs);
> +	else
> +		ret = pf_disable_vfs(xe);
> +	xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.h b/drivers/gpu/drm/xe/xe_pci_sriov.h
> new file mode 100644
> index 000000000000..3b8bfbf7e1d9
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#ifndef _XE_PCI_SRIOV_H_
> +#define _XE_PCI_SRIOV_H_
> +
> +struct pci_dev;
> +
> +int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs);
> +
> +#endif


LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
