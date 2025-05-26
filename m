Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDF8C54FB3
	for <intel-xe@archiver.kernel.org>; Mon, 26 May 2025 14:57:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37DAC10E38D;
	Mon, 26 May 2025 14:57:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZhZedGJq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D444C10E38D
 for <intel-xe@lists.freedesktop.org>; Mon, 26 May 2025 14:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748271444; x=1779807444;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=M/0bjgjEmcDQrlH0QQC9ZzsPD676w0ILl42RBhJXjPM=;
 b=ZhZedGJqWHV80ElN8PTVR4F9kn+m7C30RI/mQp9+XyYZYGZDqRQCokVk
 S8fwHCiXVaZajzcetS2+vERx/+g7oXw3J9wdUJCXyzdD5wP6QtOvo9jdc
 XB00j3S7Wa+pEq+ttrPC1A6IsfInpsimXWy3ArBa/w0p+9uYahoFqhBXS
 6sogV+aE4aIPJ4Je8T+5vs3FCQzNsqVjM8gtGERQeJAFfj7Gw2xQz2u4n
 rWI9ysJ7qnuIAFpuYv125xhcSOE9DVKpsgByJgOq+JV+dC/A0gXZ+xfIS
 /IEFk5n+Lnm2J6HAomqKtO0uQiQranUqpNDJE7/zveiO5DBSVNlxTOKuS w==;
X-CSE-ConnectionGUID: GxXGmGNyTweVQQ+HntOwxQ==
X-CSE-MsgGUID: L4wmV7baRRiILGA+BYAhlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="50134024"
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="50134024"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 07:57:24 -0700
X-CSE-ConnectionGUID: 6XeixhjjT9W5XiymLbOGQA==
X-CSE-MsgGUID: qwScA1s1Tr6mMxwEP3gwzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="143374012"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 07:57:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 26 May 2025 07:57:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 26 May 2025 07:57:22 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.51)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 26 May 2025 07:57:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TUYpMdFRg2BCMSXhix34QOjkay4V2L7Oetudhf40n5mjgPewuZeS7YGYVUUlWcP+adrk6bcTCEIi07g5sULLNtzTJcCyeSLadME/XIc0Y82+lsllTpHgF9+/0IFDaNoE9CqpqrwIFMfARuO6DJeDmJt73erYF/rOSOfjICvQJUkht1ubrFHFeFsp2XDXm/o30O0VDFPznXNpVK+tTmIkzjMb3+wW76jvNmR14b2xH+HpZGfpMYLrqOmOTtkqiO4SG915aIvFVEwwZLA/kBTA7xcGBeYiceHwWET9FuNunqzeKzdptjdaBHx3E2UILzEyswy+ntYsz6UQ4L1NbVjWzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16Ev+E1FwNS/cB3J6hbnp4JhrqmRtVchSjTQbxrb8J0=;
 b=Y0x1iC8heA+PwQnav9fQiwOwBkEPlFOxt0fPPTxp7L/RpGynHTPi57vYxhTVUwnhca3v+zJyOyJnCIO5Va+/t5ROt/ngYRmkimPLgwbF2AmvTEhuhjvt8kBIATtFf8K5yM0rV4dwftbQfsKonBzkHLEScKUnG/+wm3sc1qYnWXxoMaqXq5yS96hztjwEVT8CaMqZHdYVeZfQnNRUmFLbtNDqGg033Ln90k9H/axKbO1rt7bmXYnWIT2A+KjU4onWA9Mwmmhz6FAeWh7OJMMBWHpTDgdyuIo/JgqdzpiCuJYFI4kznKJbrWtkhCgHGXgZxs4/boZ0wCBOdlHuF55vUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA0PR11MB4640.namprd11.prod.outlook.com (2603:10b6:806:9b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Mon, 26 May
 2025 14:57:21 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8769.022; Mon, 26 May 2025
 14:57:21 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>, Stuart Summers <stuart.summers@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 0/2] Cleaning up code related to VRAM regions and its
 initialization - part 2
Date: Mon, 26 May 2025 16:56:45 +0200
Message-ID: <20250526145647.1958756-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0072.eurprd04.prod.outlook.com
 (2603:10a6:802:2::43) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA0PR11MB4640:EE_
X-MS-Office365-Filtering-Correlation-Id: 795b664b-2f0f-4631-0f8e-08dd9c659dd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZjRYVzFia053Y0dQN0s0dmRwcUJyNktpYmx3OS96bXMvdmFLR2tsZ1crMG9u?=
 =?utf-8?B?Wld5eElGRm82cDFXMzdVcGlSakZucXdxT0FHVEE3TEhwMVcyMHRmTFBDUlFr?=
 =?utf-8?B?VjB2U1o2Ni95NmcwbUdVTmF1YjdLL3VHRDZHOUlUM3hGTEt6cCthQWNGejNP?=
 =?utf-8?B?UEY3YU82RGNZbThVTzZEbDV0OUFiV3g2bHZRWjZQQVpwNGlrN2dYSW93T242?=
 =?utf-8?B?cHFodTBmWVdaVVhlaXRVVGgwVStUaFl2dC9SWUZBQTRhcDhPQmhzeHptLzAy?=
 =?utf-8?B?SnR5WU1pdFBlNWxLRmx6ZjR0WGxEdnVqVy9Rc1hiQ3BUV0tkT1ozODRmQ2VR?=
 =?utf-8?B?VkJ5SzdiSEo4VDFQSVVxNCs1NFQ1QVNQK210SytxcndneUxZdW9UZGFub09E?=
 =?utf-8?B?NDFLN05Ld2hIRXhmY0dOd1pVL2pQL0VTelllYnZrYVpRcGFUa3BCdlY2TmNM?=
 =?utf-8?B?QVYrc1o5VUIxUDlvSWlEenJrK3pmaGJRQmt2TU5hT0ZwczdvM1VFVjBmSnhh?=
 =?utf-8?B?SkljbHM0TDFOTXFFYWpvRjNGd25iOWFPZHBiZllBc0tIUEJ5U2c2Y09xL3NY?=
 =?utf-8?B?RURVYUpWcW1HSk81SlNnOUQwdnpJd1lFK2xWYzIyazMvSURtQXM3dzV4aWc5?=
 =?utf-8?B?UWhaZDQ2S25SdUMxS256R0RpamdxZXhuSzhyN2JBOVVUNGhXTGdINXE3dVhu?=
 =?utf-8?B?WVBTd2d5dWlRYytUNjAyMEdNdVpCeVE5RGErMVN1RXNGdXNiWmQ1a2dNZWhY?=
 =?utf-8?B?anVGd3JrS050QnZrakk4UnM4cmNOYlZLWGVkTmh3cU1jZ2VqakhpMGUvd0Jw?=
 =?utf-8?B?VHZrVHRxSElSNzVzcEh1VStJQ240bUtLdm9rTm1BUjY4b0dNZGJvZXg0TndU?=
 =?utf-8?B?SkVHbzZFNi9pVXBURmordHhNaGJVQzBMUVNrWUc4dUN4V1VFdGVPQUxTWm9U?=
 =?utf-8?B?Wnpkb1BJSGxFMk1aQmllVDY3VjE5N0E1ZmdEZGxtUlFjTFlJSE5pY0NWeXg1?=
 =?utf-8?B?VVVLTnFINWliOFQ2WlpuQWRscDM2M1NuM3RvLzByaUpBK3ZCdDc4N3hKZE5N?=
 =?utf-8?B?Sk1YWis2Q1RzMTNUYXhDYWZiZDRUdW50OTE4Z2IvSFV2MmdNV1VFYXpqdUI3?=
 =?utf-8?B?M0pqQzBFZkRvZmNKZGtuek1JZFJ4cGQ3NFI4V05sVFk1OUI2VS9VVGs5aVYx?=
 =?utf-8?B?NkwrTEszZWNSclg5L1lyQitsODBmVThSc0trQUpZalVNQnVQSnc2L1FXd1R0?=
 =?utf-8?B?cjJjRVMxamErSHhoMTJHVElnRGtqV0daakxQWm9iZFZoWWtxRzVRd0J3Ump6?=
 =?utf-8?B?MlBVSFNIVFhUazFiUzJTaDJPTDdWQVhxN3pxZlNxckFNWE5PemdCVURjMFp0?=
 =?utf-8?B?bHhWalM2QmdPRWxHY3Z2cnhtMnArWkhOdW9OeXJLMmxTV2RRc2VFVHV3Z3Fr?=
 =?utf-8?B?eDA4VndSVWpGbjBHVTQvQkNvZHFaMit5U21rWlZMVlBjY3VrTS8xYjVmSzRo?=
 =?utf-8?B?ZGliMS9FQjFSaXltYk1oTDA0Q3hwaEhRb0ZtTWdlcHFEUFA1a0k5dU1KMkls?=
 =?utf-8?B?djZTNWhRNUVFaDcyODkxbmZ4U3c2dXBacXR6WHh0NVRYbytHSUc5b0J2eG5K?=
 =?utf-8?B?M3IzTmU5MXV1YzVGWmtRZGwwN3J0d05lM3FUMC9lMXd0dlAyalVmbjMxeUtp?=
 =?utf-8?B?enp2RUtpS08zQStmdm1TdktuNmhWOWF3Y2RSRjZsWGxJc2lQUDhKMDJHV3k2?=
 =?utf-8?B?ZXEwM3dKbjlWc1QyclBGM3U3dWZhbEJMQUt6NnhRYk1tMzZNckhnMVB0WG1h?=
 =?utf-8?B?QTFncS8yTXZpZ2pGS1RaUWM3NmtENm0zV2RuWVM2NHRPdzFNMmhWRFp4TkZv?=
 =?utf-8?B?Y2FHKzJqeUdWVlkyTzlVakZQK1pkM3JUUkJsemFiWDZhYTdyYWk1WnZJWEJn?=
 =?utf-8?Q?ld6I4adjnuQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDduMjJSMUg2SjRBY1BPWWVqMFE0Qm9rN2VSVWhqN3huL2l2VGlETmxaMjV4?=
 =?utf-8?B?bzFUaVkwUmZzQnNUc2NOK01OeFh2dGczR1hQY29aait1a21Na29McGFqMkRv?=
 =?utf-8?B?QjBSMlZTaWkxbHFVaUhaZ3hzNW8vZFZRNTRINkMxc0xoVGhaL0hqclRTcERz?=
 =?utf-8?B?bVExV21ZWnBJbDhMVXNmbmhWYjArYmRUcXA0SGVsZFg3OE53QTFCNElRSXlp?=
 =?utf-8?B?aFNpQXRnT1ZST2tTNVpTQ2lxMk5mK1BsYlZIWGRJQVBqMnozRm1uY3RJRCsv?=
 =?utf-8?B?MklEUUp5ZjQwS1kzb3FZNXZISXRpYUZydHhPZ2EwdlpWL0pmcW1hRmxFOTM1?=
 =?utf-8?B?NHMzU3RKWm80ZzVDZW1HQTFZUFhUcjdOaTJmVVJxYjNBb1ByWXp0U3VQZ0Fy?=
 =?utf-8?B?anhDWFQ1eTV3dXBHQ3lGaXpaQi9jeUFRNk4zeVlrT09UMW5QU2dRazZYMUpk?=
 =?utf-8?B?TXc1WUFrMk5IRU5XN0IzMkNLQ0RPZGU1NnBsZCtpaXNuTG9uRHBURThXUFpa?=
 =?utf-8?B?SUdOclYrYWYvVXp2VGl6L1dDa1hKNXpPcktsM2xyaTdDdjJlQnhRR1FZTFQy?=
 =?utf-8?B?S1lzOHVnS0VSRlhHK0g2OGJvM3ZjYUoyN2V5QjZ0VDBoa1FFb0c5TDZ4aG1m?=
 =?utf-8?B?M2lIMFlnd0FDb0JDMU1RR0lodHd2cTE4N29vTkZvazFVVXlOT0EwazA1MEpi?=
 =?utf-8?B?VmJYVFBDUmZ1WTNSWGN1dkFUY2ZHSXo3aE42TEhQdHFVTVFKMkpDVjVBSGww?=
 =?utf-8?B?dmM1aGdJb3FscXRaQllSTEtiUGFzTUIzUlhidnZqZ0cxMVUwRzVKY2hteXNO?=
 =?utf-8?B?ZnA4TTd0RzBTRWRUai81SzFwRmJxZzlqekZUd2kxRTZSaXlFd1NsTDkvRjFs?=
 =?utf-8?B?NXJaV0xZQzFmdW12REFUSW9WSS9PM1NJUDRlS0IxbHFEbEpDZmRSWGM3NmtT?=
 =?utf-8?B?ZWtvRTg3cDVBSjZzRFRXQ0g1a0x4VEJLTkxPbWpTZjBuSGxkTVJwbCttLzNR?=
 =?utf-8?B?d1ZhMWxkbE8zNk1uMEJ3QWs3V2R1c3RWODlzUVVCS1lHUlB5YlpoVWdGN0R0?=
 =?utf-8?B?dTBWcEN0YkZid3gzUFJ3M1puQXhjQlZqbk1pdEVLWWU5TFh6d0RCZjVTbnNx?=
 =?utf-8?B?Ri9vTlZtTEE2aEdVOG1rT1JsMExvM1o4QVAzMjNOTEV5bDNKaW9yV3pxVE5C?=
 =?utf-8?B?QzRFanhvUCtxcjRMUGFkcklzWmdSVWc3cHkyVDVXSnR6b3Rhc3ZXTHJHVzdj?=
 =?utf-8?B?cGNUSHM4MThTN085clBqTk9NMFVLYXhKSk4rNS9RNGkrSUROL3BPRlRzd0R2?=
 =?utf-8?B?Qm1DN3BUOWEvU1ArdEFhTGV5UFUyTjlmU1pBNVRpK1hTTGliSTZNM2k4STJa?=
 =?utf-8?B?VFdvRUdud3kvVThRQzBXVDdBV3lGSmR4NW9WQktqVGdSZWZROHpweE02VGJr?=
 =?utf-8?B?RU1VQXJTblN1cjhDckFQL3NrMkZOU2JDMldod2ZHY1RqVVloeDRmNy94ZVhr?=
 =?utf-8?B?U201NmQ4UzVuUkRwbjNzNU15NW5NZkJFNFhxYk1JMlExdXdtbCt4QWpDd1hy?=
 =?utf-8?B?K1JoODhIQ3dMcUwwSGpkVUxyQWszcjZha2krNURXZXJ5U1dDaWpCaGxvSGc5?=
 =?utf-8?B?MU0yRFp4OUhEbUM0enhrUWlNWDYzeElWZXJodTNIdmVkRk1oclFKb3l6a2lR?=
 =?utf-8?B?bVFOSC9xWEllSmxUQTVzbWEzemFUcDlLdjlGeXIwQzN4aS8vaEk5MXFiLzFq?=
 =?utf-8?B?OFV1cFNULy9aUVM3a2Z4NWk0c3NCaEIvcElieFlMSThCa3hOYVJVcm9rSkZk?=
 =?utf-8?B?cVhqSG9BQjh0UWhiUks2UDQvVUpPODRFOEVXQUFlamFoTk5jL3lyN3p2NmVX?=
 =?utf-8?B?Q280bEVHci8wNTNTRmRaeWNKeGVIZFpPU08rL0VEcXI0dGRaL092bUdUUkNK?=
 =?utf-8?B?K3Ztd0h4RmdiZExYU28yWXlNTCt6WXo5SVNEVUEva2psUGNxejRPb1RpSlcy?=
 =?utf-8?B?QzAweFFCYWV4R3BSYXlXTERJL0syYys3aE5wdmZHbFc0M2twaU1OWExtYVUv?=
 =?utf-8?B?NEZ4QkZEcE9KaHZmTjFNdXV1NTdIZlZ1NWJneXBUWjBXb0dYR2xhaHBBWlFT?=
 =?utf-8?B?U3JkMS81blVRQWlPWG5kZzhOb3hxemhpQUMyRGRIQjFSb3I5aU5BN3V1Rk55?=
 =?utf-8?B?aHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 795b664b-2f0f-4631-0f8e-08dd9c659dd5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 14:57:21.1601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sniv6WzhthOHXrOBU3irU4LbX4HH0zAqcWZWimANa0Qi0D67Rq/h23vt556CmLXFet8ar3CKPhfYUrzgr6e8qQkMviG84VfIifKeKac80Ms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4640
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

As a follow-up to the earlier VRAM region cleanups, this patch series
focuses on further improving the flexibility and clarity of
the Xe driver's VRAM management.

This series focuses on preparing the VRAM region handling code for future
platforms, where a more dynamic representation of device and tile VRAM
regions will be required. Static allocation of these structures is replaced
with dynamic allocation to increase flexibility and improve maintainability.
Additionally, the initialization logic for device-wide and tile-local VRAM
regions is unified, replacing the previously separate code paths. This
simplification improves code clarity and facilitates future extensions
involving additional VRAM region types.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Piotr Piórkowski (2):
  drm/xe: Use dynamic allocation for tile and device VRAM region
    structures
  drm/xe: Unify the initialization of VRAM regions

 drivers/gpu/drm/xe/display/xe_fb_pin.c        |   2 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |   2 +-
 drivers/gpu/drm/xe/xe_assert.h                |   2 +-
 drivers/gpu/drm/xe/xe_device.c                |  23 +++
 drivers/gpu/drm/xe/xe_device_types.h          |  14 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c          |   4 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   2 +-
 drivers/gpu/drm/xe/xe_migrate.c               |  18 +-
 drivers/gpu/drm/xe/xe_pci.c                   |   6 +
 drivers/gpu/drm/xe/xe_query.c                 |   4 +-
 drivers/gpu/drm/xe/xe_svm.c                   |  17 +-
 drivers/gpu/drm/xe/xe_tile.c                  |  49 +++--
 drivers/gpu/drm/xe/xe_tile.h                  |   2 +
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |   6 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  18 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h          |   3 +-
 drivers/gpu/drm/xe/xe_vram.c                  | 179 ++++++++++++------
 drivers/gpu/drm/xe/xe_vram.h                  |   5 +
 18 files changed, 236 insertions(+), 120 deletions(-)

-- 
2.34.1

