Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9F4CCA470
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 19:22:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9140A10E88C;
	Wed,  8 Oct 2025 19:22:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BnqvwfuY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4DC10E88C
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 19:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759951331; x=1791487331;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/LNlFkP7Pb+mq1Q9cJiqmqnti2fWE9WrVVBcidTRh7I=;
 b=BnqvwfuYLsWn7+pVAdFcxvnc7u6YR5FxJlSr+b5pnp1SPu7HDSJ1LZ3J
 DptoTlInTq6GVfCbhjPVh/rxpXk1SObDfLHjnS9v8uorOaH+26VCD0pbh
 V/M2hVtSyNdCcUBzHB9Tv/q/2OfzQ+5IrTGGwjJqfsDAd2zHMQWaQ3hM4
 cWGmPNVAfoFK741uTvJ9WJkRQjfKuIuXjlIZffKB0ahIy4X1zxbRoUeqv
 LC0QK/E1kdq+znUEqShGI9L7Qj7BfV1jeRljT2BoFzIs3i22lAFoCMPAu
 4T8/5dVqAIznEmrPIhC92lzuT1vMwZV1wwcVVfWloHGGy2NdtKJO0/fB4 A==;
X-CSE-ConnectionGUID: gUmS4qUtRKGbg5fmsBbkyA==
X-CSE-MsgGUID: 4cjoiJcbQEqGHenlda/UYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="62063185"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="62063185"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 12:22:11 -0700
X-CSE-ConnectionGUID: a0Y6Ils4Q2ibWefLIW9A+Q==
X-CSE-MsgGUID: wBV6VYHuSg21ttNQCQfwng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="179777735"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 12:22:11 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 12:22:10 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 12:22:10 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.5) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 12:22:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r61+3XZ0xpe+AitZnXZy9CxyLohd/RqE3go5kZFqyHQhHhW6YjJgy8QKmmAH14Mrp2tDPKTgfM9D9FqNMaOStSjqQ2iPxBBKb3l39LAXIhJJVjkbH3EofBYPkbRH7wcd1JKNx6BXrgVyTgV3RZlQ20EgxqrfQguq1Rob8OlaUvkkIqyI/XI3Xgxlr/f453Ry99QvX6wWq5Ecjx66MjONs+IwXh/1sSNKhekhWx2lSP9Yk1COLiv9FJK7F+yxIbDtRuHDt+Uua+i65UHMvlQ9DdkQ0YC8lUs9HwW2mfoNK8xyensi2ciHJpkU7tf2b1VR7S541ximOCVoyDSVCMv48w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5HJ77DGYEdnTGWLMaoJfziVWUH/c7B4hteDo26wiME=;
 b=POXoeDJPc0Wt513Osv8vTIe8r67p5v7HLmg8Mi4ErbH+TVckmZE4PNzYfFoi4eYNfQi4nF1MQHFZqcVRX5Url3yPvvDibC0Ys+mGyPeCzNsyv/ZHhwaK6j5beRvYOBqZJX7Zt7oBW9JoZ7TXJtA9sMD+ZdMli/R+BkvlbzOPeM/GSiFcrkqhHWPKHuEsfbl/BuHXTo8m7kMFSsSwMTDX8VaPgt+VF2SPU46bhmohZIULbIZJR3cOi9teBSEprqLjoxpHCPwTUdMiwZAIeaFaMo/opbNHyvmGLAkf1VWOkMvty2SCHx03YkD1othxBlbz7+0DwGN4tM8xp2tQHZSaHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4545.namprd11.prod.outlook.com (2603:10b6:5:2ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 19:22:06 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9203.007; Wed, 8 Oct 2025
 19:22:06 +0000
Date: Wed, 8 Oct 2025 14:22:03 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH v4 22/23] drm/xe/configfs: Add attribute to disable GT
 types
Message-ID: <nrch4nmurevalpg53thninluzh7qm2pehry4escqbuqvftcyws@eeqg7nrd55ro>
References: <20251007204829.1468209-25-matthew.d.roper@intel.com>
 <20251007204829.1468209-47-matthew.d.roper@intel.com>
 <ibppcxcdcx3wxqxxccxun6kru6fr7mtnaddvxfbjzfaoxss65s@n7btsnxddgub>
 <20251008191014.GG5409@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251008191014.GG5409@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:a03:40::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4545:EE_
X-MS-Office365-Filtering-Correlation-Id: 202eca13-6910-44b1-e2d2-08de069ff7e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0RueTJmWUVJbEJESTg3Q04wUFVPU0tsaXlscTZLVlNQRDdUcElodkNha21S?=
 =?utf-8?B?ZXVJM3NKSHhabE1WVklIamdobUF2OW5JL1JuNHF1SzZnQnhoYVBnV2E3S05x?=
 =?utf-8?B?WVFpR0RZUG5NeEQ3UVdKN2VLRHA4c3FVQ053WGNDUFRWMUQyWmNaMk8yc2gx?=
 =?utf-8?B?M0J5UmZ1cEgvSUVmZDJHZDNDMEdlRFppaldyenJWOHhuOVJUZWhodXFnOUYw?=
 =?utf-8?B?Uk5PcmNEV2t4VnRyUExKY3ZKNk5KdFRad2hoT0l1N2JGMUtKT2c3Q1lqcSsz?=
 =?utf-8?B?a1hCb2RUaW8yb0N2UmlSek8vUExLNWFPYUMzMUZtWDRCSU84dnFpUERWZzFn?=
 =?utf-8?B?WCtHUVFTT2t0NDQyMWl5eE1LemJ3VHIxbmtvdjVFWGVFbmdsYU1pQmswaEtq?=
 =?utf-8?B?VHdWclBuWEp4VS9NT2xuRjlueU1YM0wzN2hrbVlmUURqWUk2Z2VhTWxDcWZK?=
 =?utf-8?B?WndJaU1HVENnK2xyUGlta0tDNktJOHVkWGl5V2tQK3J5bVNwL2dVNkN4czZK?=
 =?utf-8?B?dXBjeHg1MEZDNkNHRWpPTVRoOXNuNWwwNjMyaGswMkRIZlNBT05pdkxxdHdD?=
 =?utf-8?B?aWg5L2xHQTgvRDBvVWh4dC9acUpxOWQ0Q2x4S1dQYWRua2J3cG1mRUpZUHM0?=
 =?utf-8?B?YmxqZjBDM2FUSlVVU0xBVXBDSGRIay9RckVncHpGVkk4WHgxcjFtWVF6bVVj?=
 =?utf-8?B?d242V25oaERjQXdDb3l6eUd3VitCRkVNaTFIT2FqcjdoOG9zZWZDcmcxaVdr?=
 =?utf-8?B?TlJUZ0tFelJNMDZPUCtwb2h3WEw2c2Nkamg0Y2tnV1YyKzVNcFExSWZHS0dN?=
 =?utf-8?B?NU9aaUhkUGNTbUdFVE5ZQlZOeWsxSlFCb0t0amVQRTA0TzJZZGxzRFpWOWRz?=
 =?utf-8?B?WkQrbEhOZ1QzTGxJenBKSHZHYmx3WXUyamlWT3VNaXA0M2UvZUY2Ulpab1Bt?=
 =?utf-8?B?dXhSWDJPNTN2Z3A5OXg5QlBEdnE2dDZQcE5GNmp1WWNsK3MyQzJxYTJiQnZ4?=
 =?utf-8?B?T3Y1V0NBRU9XV1dua2IwaklKUFNvYjNpaTlKV1pwRVZYMTJxMWRMeWs5TXp0?=
 =?utf-8?B?QW9SbDZ5KzRETGtEa1VQU1dFYVZ6UUtHcDVZMDNCS29rY29SbWh5Yk54cDUy?=
 =?utf-8?B?OWEzWk9UTGJ3aC9Qd0pYT29SS1JQQW9tbmdhZjZ0Yk9TNlJGNFdYRjl4S2JC?=
 =?utf-8?B?QjNFU1BoZlNxeDRTeDJKTk9LeWJGUGNxVjNXMFg0NzJab0ZuUWFkeS8wcThv?=
 =?utf-8?B?MkZaN3RsVFZ4TjVLdXRUNXNYYlNkNnhPTzl3OUJseDkxcGxVbEVvalhtUGov?=
 =?utf-8?B?VDhGL3JoWk9CMUN4OG1XMTNSZW5ySzRpZTZrVTBOalRKRGpLa004SkVNSGE4?=
 =?utf-8?B?Z1ZVR3Q5Nkg2eUlzOXF3WFNtV3hFZGNQd0ZjUWxWbWRMcWVNUHBGZU9FTGxr?=
 =?utf-8?B?eHkvc3YrYWtnWnJoZlBOUW9JK0ZOV1BKOVVmeDFNOHZTSEN0TEhuNUtJRkJC?=
 =?utf-8?B?eWczd1d6RFkzb3ZKSG5jaHlPVjRiQXA3YlRLZHlUaFhlUGpiU1MyalBZMHFG?=
 =?utf-8?B?ek5qd2NnTFNqZUJqOUh5VktrYk9JS01FUTV0NHFkTDJNMDdrNjVKNlBqbU05?=
 =?utf-8?B?Rks1WG9rZmg2eXNoSm9HMkpxS0M1R0RhcWgvSzNMSksrekJSV1BWZ0tVOHFo?=
 =?utf-8?B?amtxRzBWZHIyeFVVaVhhMXVqZUVMWXJMa2lrY0laMlhxY2ltakt4VkVuUXNM?=
 =?utf-8?B?VVpGd0MvN0FuVjd3aXJQL2Nnb3ZHMlV5SVdQbnZKbzk4OUp5bjFJbmZVY0E0?=
 =?utf-8?B?MTMyZSsvTmc5QzQvY2xxclhoOTVjRGJ2Szk2anFmOXlYWk5zZzZOeUM3MnFm?=
 =?utf-8?B?V1VtMUJzVnRwU2hXTDRaRFoxUU8wMUJmZTQyYVRib3NxUXlrY2thMWp3enhV?=
 =?utf-8?Q?WSGQ70DHnPKE9YBdJv+9wq0iOpni+D2s?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q21EVkJ0c0FsSm4zVk9oaDlIdmd3RlhFY3U0L09HN1VWN1VIQmcvaVM0aGhu?=
 =?utf-8?B?RVJPY0FVU2VxVWpob3ZtemhBc1ZnQzhRbi9rcFdXRnhIQjFXVlVuVXQwVE9z?=
 =?utf-8?B?NmZGTU5QL3NHUGF5R1VuM3BpeEhjQlNsVi9YTUxuMjF2YmgyUlFmU21uRERT?=
 =?utf-8?B?Sno2RkhnaGV4TjcyZE42T2U5S3hPU1k4dHM2WnNLaVgzSUEvd1NDbFBtcXBK?=
 =?utf-8?B?OE1QRi9uRHM3SEx1OXZtWSthcnQ4TEF0enU5ZUkwMjA2S3ZNUVdaL29CaTdz?=
 =?utf-8?B?OUNFODZadmhHb1dObm5wS3pzN08vZENoN2FOZTJSQkJqRkEzU3o2MVFwQXQx?=
 =?utf-8?B?bXpGeEQ2VzUwRUFEelVuL0xXUlFoRnNac05nMnVkMUcwV01YME5nQUZoWXU3?=
 =?utf-8?B?UHpaTWlIUUNNb1VVNGhpc1FNUmxra1JBTU5iYWVtVzdpYW8xZ0d5bWpvZTVT?=
 =?utf-8?B?Y1VjODNLSk16WnJ1VzUxTHVGUk1QV1JlT05CSFZsWGw4TGdQdkpCQmtUMEtt?=
 =?utf-8?B?dWFZK3llNG4xTXEyaXo3cjhhcHh4SnF5aHZjTDlBUVRJZGZ2VHIwMGNNUDZt?=
 =?utf-8?B?YVIzU1B3WDBSWkJoWGlHQkZiQitLbXA5ejc3Nnc5NFlLVjZCTGk0VUtadlY5?=
 =?utf-8?B?YUdObjkyZXUxVzFubXMxZXlBVGhXdmo4V1NnSjIza1hJMWl3eDNiQzFjUU5X?=
 =?utf-8?B?VkpCV1JZVldlMGdXR0FqUmRHaG1qZklVRllBeldXR3JWYjE2WTFKR3FXU1U4?=
 =?utf-8?B?dFIrSU55WmJwQ21WTnZkNGFYdlFkWDRQcFJYWGVMbWk3MTVJWVRPdElBb0Vo?=
 =?utf-8?B?Uk9ibkswRGl6elVDaWtIYTE1TGtnbE1LRi9BZFVnbm9WZExqUGkrTkxnKy9U?=
 =?utf-8?B?YUhqWHJocjhCWVVJVjM2TkpTMlJRMVJMV3lIVnRVcG82Z2E0dTNjZVZOVFJr?=
 =?utf-8?B?dmdKemozdTh3UUpqYitsTnJSMEQyQWZ6OGUwZmFzMnNRY01KSDk1OFRtaUdR?=
 =?utf-8?B?SzVGTThGZkt3aWdkTStTL0x2QkhqNWF4cEIyRGNmMEpyNjRmVVkxQ0FKcjRw?=
 =?utf-8?B?QVlQdzlJMnhjd1RPakZ1MzlHSHROQVNZSmEyTG1FRHpZMUJrZE4xcXBLYmp1?=
 =?utf-8?B?NURNalp0YUxOZVUzNmE5NTJFUThTQlQzTlpjRFV5WUlvVUMwRDJqL3hnTlhs?=
 =?utf-8?B?YXd4TWxRSFg0Q1gwYWZRclliNFE3RG8vRlJ3WlA0OWVvK0V2NDFOaEtCUWQx?=
 =?utf-8?B?clJjK1FjNk94OC9JUHBkT2pCM3V5VFEwNGxOK2ZVaDl6R2tTbEZFNjlaTmpF?=
 =?utf-8?B?UjlEQ2ZkNVpLZDU5akhIakVRdkt5Mmo0Yml6c3NLOE9OM3NWTnZtK2FCQ2tY?=
 =?utf-8?B?WFAxalkvYm9DRnRlL3BIWXRuTm5LOTNRRURYbzJWM053WENFdVJoeXdiYll2?=
 =?utf-8?B?MzBTSTcrRUpnRzNhTWVsaHFueVdMSCttWitLN0liK1gySEM1NEZraWcvMWhx?=
 =?utf-8?B?SVFqTVgva05scytRTmJzOXI3dSt0R3NuWFFkWG5MRjBMUHNTQTVRNzFBLzR2?=
 =?utf-8?B?dUxibTlsMlJ0cy9sYlVoWkhBWkFHeWZ0cndDMjZhdTlNMlFveU53cTFyd1BG?=
 =?utf-8?B?UUFxaHVMWWtGNUgxK2cxclp3Qmx0eGxBZ3M2K0Fac0w0Ulc4VGJZWTRZY3ds?=
 =?utf-8?B?RU8xS3RWUW53UTU3a01hcWxvZTBZVTVDTktSUVQ2a2E2MEQ5OGo2VmIyeFlr?=
 =?utf-8?B?UjFuSzhQQWMrMzFkbE8yYjNnQ1gwTVNQRTNBNkQ2aW9FNHNRK3BaQ2hlbkNw?=
 =?utf-8?B?K0ZiYmQ1cWlNaFAxd041R2lSampXSXZ2anVoaGNPUGkrWDRxNHA3Rnk5ZGhT?=
 =?utf-8?B?ZFdmWTdTMFAvUFZjdThWYml2YnFzZTdQUlNaNlpNR3llYXFQcjVSRjYwTmhP?=
 =?utf-8?B?VG5iSW9tWFRPNDgwWU9Ybjc4TWw2Y2prb0REUExyM09XUlJTRWJuOEZKZkdr?=
 =?utf-8?B?R0hMSDVjWlYzdGhlUE1wRDhTS0VzK0U4WStBc3VTbk05NGsvaFRVcnp3UVU3?=
 =?utf-8?B?NCtJTGs2TldOUkdleEVqNkFuQ251aUhLNHdNdy9DMEhNTDFtbWM4YUV4bjgr?=
 =?utf-8?B?NkNCT2JDWENkSm04MTUwZURIZkNLeVFMcTVzazFNLzkvMGRONkRQQTFhTG1T?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 202eca13-6910-44b1-e2d2-08de069ff7e5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 19:22:06.4420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9l+U5LI3nJZDoJPOEDnDV6PBOlmuJDyaAuYNOexijxuOYCGDFRvt09aj1z5nvq8uR1RTmaFv4Rcrp1YydWSCtTW6mmFGRe7/IhWe8kaCZTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4545
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

On Wed, Oct 08, 2025 at 12:10:14PM -0700, Matt Roper wrote:
>On Tue, Oct 07, 2025 at 10:37:32PM -0500, Lucas De Marchi wrote:
>> On Tue, Oct 07, 2025 at 01:48:52PM -0700, Matt Roper wrote:
>> > Preventing the driver from initializing GTs of specific type(s) can be
>> > useful for debugging and early hardware bringup.  Add a configfs
>> > attribute to allow this kind of control for debugging.
>> >
>> > With today's platforms and software design, this configuration setting
>> > is only effective for disabling the media GT since the driver currently
>> > requires that there always be a primary GT to probe the device.  However
>> > this might change in the future ---  in theory it should be possible
>> > (with some additional driver work) to allow an igpu device to come up
>> > with only the media GT and no primary GT.  Or to allow an igpu device to
>> > come up with no GTs at all (for display-only usage).  A primary GT will
>> > likely always be required on dgpu platforms because we rely on the BCS
>> > engines inside the primary GT for various vram operations.
>> >
>> > v2:
>> > - Expand/clarify kerneldoc for configfs attribute.  (Gustavo)
>> > - Tighten type usage in gt_types[] structure.  (Gustavo)
>> > - Adjust string parsing/name matching to match exact GT names and not
>> >   accept partial names.  (Gustavo)
>> >
>> > v3:
>> > - Switch to scope-based cleanup in gt_types_allowed_store() to fix a
>> >   leak if the device is already bound.  (Gustavo)
>> > - Switch configfs lookup interface to two boolean functions that
>> >   specify whether primary/media are supported rather than one function
>> >   that returns a mask.  This is simpler to use and understand.
>> >
>> > Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_configfs.c | 145 +++++++++++++++++++++++++++++++
>> > drivers/gpu/drm/xe/xe_configfs.h |   4 +
>> > drivers/gpu/drm/xe/xe_pci.c      |  22 +++++
>> > 3 files changed, 171 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>> > index 139663423185..e36cc5e1bc8f 100644
>> > --- a/drivers/gpu/drm/xe/xe_configfs.c
>> > +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> > @@ -15,6 +15,7 @@
>> >
>> > #include "instructions/xe_mi_commands.h"
>> > #include "xe_configfs.h"
>> > +#include "xe_gt_types.h"
>> > #include "xe_hw_engine_types.h"
>> > #include "xe_module.h"
>> > #include "xe_pci_types.h"
>> > @@ -56,6 +57,7 @@
>> >  *	:
>> >  *	└── 0000:03:00.0
>> >  *	    ├── survivability_mode
>> > + *	    ├── gt_types_allowed
>> >  *	    ├── engines_allowed
>> >  *	    └── enable_psmi
>> >  *
>> > @@ -79,6 +81,44 @@
>> >  *
>> >  * This attribute can only be set before binding to the device.
>> >  *
>> > + * Allowed GT types:
>> > + * -----------------
>> > + *
>> > + * Allow only specific types of GTs to be detected and initialized by the
>> > + * driver.  Any combination of GT types can be enabled/disabled, although
>> > + * some settings will cause the device to fail to probe.
>> > + *
>> > + * Writes support both comma- and newline-separated input format. Reads
>> > + * will always return one GT type per line. "primary" and "media" are the
>> > + * GT type names supported by this interface.
>> > + *
>> > + * This attribute can only be set before binding to the device.
>> > + *
>> > + * Examples:
>> > + *
>> > + * Allow both primary and media GTs to be initialized and used.  This matches
>> > + * the driver's default behavior::
>> > + *
>> > + *	# echo 'primary,media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
>> > + *
>> > + * Allow only the primary GT of each tile to be initialized and used,
>> > + * effectively disabling the media GT if it exists on the platform::
>> > + *
>> > + *	# echo 'primary' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
>> > + *
>> > + * Allow only the media GT of each tile to be initialized and used,
>> > + * effectively disabling the primary GT.  **This configuration will cause
>> > + * device probe failure on all current platforms, but may be allowed on
>> > + * igpu platforms in the future**::
>> > + *
>> > + *	# echo 'media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
>> > + *
>> > + * Disable all GTs.  Only other GPU IP (such as display) is potentially usable.
>> > + * **This configuration will cause device probe failure on all current
>> > + * platforms, but may be allowed on igpu platforms in the future**::
>> > + *
>> > + *	# echo '' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
>> > + *
>> >  * Allowed engines:
>> >  * ----------------
>> >  *
>> > @@ -187,6 +227,7 @@ struct xe_config_group_device {
>> > 	struct config_group group;
>> >
>> > 	struct xe_config_device {
>> > +		u64 gt_types_allowed;
>> > 		u64 engines_allowed;
>> > 		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
>> > 		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
>> > @@ -201,6 +242,7 @@ struct xe_config_group_device {
>> > };
>> >
>> > static const struct xe_config_device device_defaults = {
>> > +	.gt_types_allowed = U64_MAX,
>> > 	.engines_allowed = U64_MAX,
>> > 	.survivability_mode = false,
>> > 	.enable_psmi = false,
>> > @@ -220,6 +262,7 @@ struct engine_info {
>> > /* Some helpful macros to aid on the sizing of buffer allocation when parsing */
>> > #define MAX_ENGINE_CLASS_CHARS 5
>> > #define MAX_ENGINE_INSTANCE_CHARS 2
>> > +#define MAX_GT_TYPE_CHARS 7
>> >
>> > static const struct engine_info engine_info[] = {
>> > 	{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK, .engine_class = XE_ENGINE_CLASS_RENDER },
>> > @@ -230,6 +273,14 @@ static const struct engine_info engine_info[] = {
>> > 	{ .cls = "gsccs", .mask = XE_HW_ENGINE_GSCCS_MASK, .engine_class = XE_ENGINE_CLASS_OTHER },
>> > };
>> >
>> > +static const struct {
>> > +	const char name[MAX_GT_TYPE_CHARS + 1];
>> > +	enum xe_gt_type type;
>> > +} gt_types[] = {
>> > +	{ .name = "primary", .type = XE_GT_TYPE_MAIN },
>> > +	{ .name = "media", .type = XE_GT_TYPE_MEDIA },
>> > +};
>> > +
>> > static struct xe_config_group_device *to_xe_config_group_device(struct config_item *item)
>> > {
>> > 	return container_of(to_config_group(item), struct xe_config_group_device, group);
>> > @@ -292,6 +343,58 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
>> > 	return len;
>> > }
>> >
>> > +static ssize_t gt_types_allowed_show(struct config_item *item, char *page)
>> > +{
>> > +	struct xe_config_device *dev = to_xe_config_device(item);
>> > +	char *p = page;
>> > +
>> > +	for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++)
>> > +		if (dev->gt_types_allowed & BIT_ULL(gt_types[i].type))
>> > +			p += sprintf(p, "%s\n", gt_types[i].name);
>> > +
>> > +	return p - page;
>> > +}
>> > +
>> > +static ssize_t gt_types_allowed_store(struct config_item *item, const char *page,
>> > +				      size_t len)
>> > +{
>> > +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
>> > +	char *buf __free(kfree) = kstrdup(page, GFP_KERNEL);
>> > +	char *p = buf;
>> > +	u64 typemask = 0;
>> > +
>> > +	if (!buf)
>> > +		return -ENOMEM;
>> > +
>> > +	while (p) {
>> > +		char *typename = strsep(&p, ",\n");
>> > +		bool matched = false;
>> > +
>> > +		if (typename[0] == '\0')
>> > +			continue;
>> > +
>> > +		for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++) {
>> > +			if (strcmp(typename, gt_types[i].name) == 0) {
>> > +				typemask |= BIT(gt_types[i].type);
>> > +				matched = true;
>> > +				break;
>> > +			}
>> > +		}
>> > +
>> > +		if (!matched)
>> > +			return -EINVAL;
>> > +	}
>> > +
>> > +	scoped_guard(mutex, &dev->lock) {
>> > +		if (is_bound(dev))
>> > +			return -EBUSY;
>> > +
>> > +		dev->config.gt_types_allowed = typemask;
>> > +	}
>> > +
>> > +	return len;
>> > +}
>> > +
>> > static ssize_t engines_allowed_show(struct config_item *item, char *page)
>> > {
>> > 	struct xe_config_device *dev = to_xe_config_device(item);
>> > @@ -672,6 +775,7 @@ CONFIGFS_ATTR(, ctx_restore_mid_bb);
>> > CONFIGFS_ATTR(, ctx_restore_post_bb);
>> > CONFIGFS_ATTR(, enable_psmi);
>> > CONFIGFS_ATTR(, engines_allowed);
>> > +CONFIGFS_ATTR(, gt_types_allowed);
>> > CONFIGFS_ATTR(, survivability_mode);
>> >
>> > static struct configfs_attribute *xe_config_device_attrs[] = {
>> > @@ -679,6 +783,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
>> > 	&attr_ctx_restore_post_bb,
>> > 	&attr_enable_psmi,
>> > 	&attr_engines_allowed,
>> > +	&attr_gt_types_allowed,
>> > 	&attr_survivability_mode,
>> > 	NULL,
>> > };
>> > @@ -846,6 +951,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
>> > 				 dev->config.attr_); \
>> > 	} while (0)
>> >
>> > +	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
>> > 	PRI_CUSTOM_ATTR("%llx", engines_allowed);
>> > 	PRI_CUSTOM_ATTR("%d", enable_psmi);
>> > 	PRI_CUSTOM_ATTR("%d", survivability_mode);
>> > @@ -896,6 +1002,45 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
>> > 	return mode;
>> > }
>> >
>> > +static u64 get_gt_types_allowed(struct xe_device *xe)
>> > +{
>> > +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> > +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
>> > +	u64 mask;
>> > +
>> > +	if (!dev)
>> > +		return device_defaults.gt_types_allowed;
>> > +
>> > +	mask = dev->config.gt_types_allowed;
>> > +	config_group_put(&dev->group);
>> > +
>> > +	return mask;
>> > +}
>> > +
>> > +/**
>> > + * xe_configfs_primary_gt_supported - determine whether primary GTs are supported
>> > + * @xe: xe device
>> > + *
>> > + * Return: True if primary GTs are enabled, false if they have been disabled via
>> > + *     configfs.
>> > + */
>> > +bool xe_configfs_primary_gt_supported(struct xe_device *xe)
>> > +{
>> > +	return (get_gt_types_allowed(xe) & BIT_ULL(XE_GT_TYPE_MAIN)) != 0;
>> > +}
>> > +
>> > +/**
>> > + * xe_configfs_media_gt_supported - determine whether media GTs are supported
>> > + * @xe: xe device
>> > + *
>> > + * Return: True if the media GTs are enabled, false if they have been disabled
>> > + *     via configfs.
>> > + */
>> > +bool xe_configfs_media_gt_supported(struct xe_device *xe)
>> > +{
>> > +	return (get_gt_types_allowed(xe) & BIT_ULL(XE_GT_TYPE_MEDIA)) != 0;
>> > +}
>> > +
>> > /**
>> >  * xe_configfs_get_engines_allowed - get engine allowed mask from configfs
>> >  * @pdev: pci device
>> > diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
>> > index c61e0e47ed94..5624e965b911 100644
>> > --- a/drivers/gpu/drm/xe/xe_configfs.h
>> > +++ b/drivers/gpu/drm/xe/xe_configfs.h
>> > @@ -17,6 +17,8 @@ int xe_configfs_init(void);
>> > void xe_configfs_exit(void);
>> > void xe_configfs_check_device(struct pci_dev *pdev);
>> > bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>> > +bool xe_configfs_primary_gt_supported(struct xe_device *xe);
>> > +bool xe_configfs_media_gt_supported(struct xe_device *xe);
>> > u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
>> > bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
>> > u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
>> > @@ -28,6 +30,8 @@ static inline int xe_configfs_init(void) { return 0; }
>> > static inline void xe_configfs_exit(void) { }
>> > static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
>> > static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
>> > +static inline bool xe_configfs_primary_gt_supported(struct xe_device *xe) { return true; }
>> > +static inline bool xe_configfs_media_gt_supported(struct xe_device *xe) { return true; }
>> > static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
>> > static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
>> > static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
>> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> > index a5932e4f4a23..9c8ab2b41737 100644
>> > --- a/drivers/gpu/drm/xe/xe_pci.c
>> > +++ b/drivers/gpu/drm/xe/xe_pci.c
>> > @@ -695,6 +695,11 @@ static struct xe_gt *alloc_primary_gt(struct xe_tile *tile,
>> > 	struct xe_device *xe = tile_to_xe(tile);
>> > 	struct xe_gt *gt;
>> >
>> > +	if (!xe_configfs_primary_gt_supported(xe)) {
>> > +		drm_info(&xe->drm, "Primary GT disabled via configfs\n");
>> > +		return NULL;
>> > +	}
>> > +
>> > 	gt = xe_gt_alloc(tile);
>> > 	if (IS_ERR(gt))
>> > 		return gt;
>> > @@ -720,6 +725,11 @@ static struct xe_gt *alloc_media_gt(struct xe_tile *tile,
>> > 	struct xe_device *xe = tile_to_xe(tile);
>> > 	struct xe_gt *gt;
>> >
>> > +	if (!xe_configfs_media_gt_supported(xe)) {
>> > +		drm_info(&xe->drm, "Media GT disabled via configfs\n");
>> > +		return NULL;
>> > +	}
>> > +
>> > 	if (MEDIA_VER(xe) < 13 || !media_desc)
>> > 		return NULL;
>> >
>> > @@ -829,6 +839,18 @@ static int xe_info_init(struct xe_device *xe,
>> > 		if (IS_ERR(tile->primary_gt))
>> > 			return PTR_ERR(tile->primary_gt);
>> >
>> > +		/*
>> > +		 * It's not currently possible to probe a device with the
>> > +		 * primary GT disabled.  With some work, this may be future in
>> > +		 * the possible for igpu platforms (although probably not for
>> > +		 * dgpu's since access to the primary GT's BCS engines is
>> > +		 * required for VRAM management).
>> > +		 */
>> > +		if (!tile->primary_gt) {
>> > +			drm_err(&xe->drm, "Cannot probe device with without a primary GT\n");
>> > +			return -ENODEV;
>>
>>
>> I think "fail to probe" should be ok. Advanced user using this interface should know what
>> to do. I was thinking about blocking this at the configfs level, so the
>> user is not allowed to do it until that path is cleared. Any particular
>> reason to do it here?
>
>You mean as opposed to doing it somewhere like gt_types_allowed_store()?

yes

>The main reason is because I expect the condition to eventually get
>relaxed and need to be combined with other device-specific information
>that we don't know pre-probe (e.g., dgpu vs igpu type).

ok, fair enough.

Lucas De Marchi
