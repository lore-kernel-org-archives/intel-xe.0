Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62989C83F09
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 12:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E24310E7BC;
	Wed,  9 Jul 2025 12:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bYFrF8zr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB8D10E07F
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 12:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752063382; x=1783599382;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=pCFn+cs4RG2O8GzEQ3m/Z8mzd1fQYoTbq6sf0XGao2I=;
 b=bYFrF8zrarUUjuisao0WKRd5NlyxDcAsn7/7QYGT8vU+w7yDaANSTpCn
 cGswxngOsHbxtKktX78olcnh60bwHLqPntmZ2mfWMd/PoEjImeIglj7jM
 eltUHvPSnd6029etX7OIDQZqjLcQoa5P+PU9oaikTMnKCWm8qOtO6I9Ds
 P1HRgFcI7Au+LDug5jUqfFwbbPBROQe5rUQG8JSVEYkBoHdUaNjXfUaZo
 At1u3PMK5KXI4xkSQRQG5IqXkTHFuiMdtQnx34ma5tJevOJc0qRoSXcl6
 zEKy0qutbbP8grd/OLR+REVGj2gaUETiROTu+Hs8ZpVIBB9hPqmWaVOIY g==;
X-CSE-ConnectionGUID: qj4ypYtESH+EZAWrUOWGMA==
X-CSE-MsgGUID: p70PJtCMSqaiYymtVkHeXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54466523"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="54466523"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 05:16:22 -0700
X-CSE-ConnectionGUID: +hs3TWw5QiG3Nn63gFkNPA==
X-CSE-MsgGUID: 2M/T9e4NTWu9dUAQB/eonw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="155848500"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 05:16:21 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 05:16:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 05:16:20 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.50)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 05:16:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jJL2nGJJMZztVsKeJBeaxK2RsUuJpGoZOwUu37xYj4gw5txRSU6KLOhBjtHHX6G/Pz9ieiEyD2t2V3KqorP9HwXgjIGNhFCqrPEejEJuKh2gOzNusyTMZz3hQoX075aWrb7puTHnan9AVLOpxHWHyenZx7tbCTpJcUHnVQfL/6ZxKfOCGkahmAM1SQZ5HMd5PEAZtxmmrQcJVcwREvjeGrEjUnnDCWWVG9tHnQCmYZYOg+4lVjSKB6+SGiDP21Kw+BlOfmJRKRV64EXBQhOY6OlHcq/6yENkYvCIZkMPdVHLGW0U3NevcVX+wc4o9tp8AlZL6wnK5RPSrdfmNLbAJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1+SSPjh6ph7uRmQw77cLJ/laMGM0Opo+PyOo8Gb+DQU=;
 b=AaCadFfXsc9MFsyYAg0nmYrMB4wig3XcJHcuios4buWBXfIBc3zwvkXyoS87OyM3Ps4TNqVeOT7DxuazUXVY8X8hLAxrAluVfypgKkUlyp4FM7Rjme2cnNRFmSWZmxdl7dGIaUIxG1YQYbIlLxNXhNZQsvnCcgT94o+mDhV08qcwtqpk+X4lBG/AS7a0A/QMFccJhJ41itKFkr7G2dtTZyUsQRQkfTSeBiMUbCe3X6Md2vJBygVALil4DXd086+tLLOHanQ8F1GF3XB0aX/AU0poEs2YyQ2ZKgfM8USZG0LfHeEeGVWh0GZq0aaxvcJwO9YhDLIEyBu/PP4zy+hFng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MN6PR11MB8220.namprd11.prod.outlook.com (2603:10b6:208:478::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Wed, 9 Jul
 2025 12:16:04 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Wed, 9 Jul 2025
 12:16:04 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Stuart
 Summers" <stuart.summers@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v10 5/5] drm/xe: Unify the initialization of VRAM regions
Date: Wed, 9 Jul 2025 14:15:43 +0200
Message-ID: <20250709121543.4129807-6-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709121543.4129807-1-piotr.piorkowski@intel.com>
References: <20250709121543.4129807-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0237.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::20) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MN6PR11MB8220:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f3356c9-24df-44e5-0a01-08ddbee26039
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RjJCQ09DTGxuTUIrbytGdkRDcWJOSEdzaWEySW5CUW9zbms5VnBkaUtVZlBs?=
 =?utf-8?B?cFZCZkJZeGJqZ21SVXNsTlQrY0xDTGFZSUViL2RPaEdCSkZtU1U3Wmh6WXJY?=
 =?utf-8?B?RUFmb09XT1YreUdxSnZ0aUFpQ1N4TWVGTDFmNjFWdVF0YW1vcGVnQjNPNXhK?=
 =?utf-8?B?T3R0STJlTjBaelovOU13ZWpGaElLV1gyUU9qK3ZxWlpmd3p4VFQzTWFwOXhB?=
 =?utf-8?B?NWFOc1dpcHVMcllMZmxFQUxMa0hRSHNtdXhkZnVVaWZnaGlqOFBFeHBrbGhi?=
 =?utf-8?B?aDFINzdZc2ZVdFBOclA0RFEwYXhMeDBjci9XT09QU293aFRRK0ltZ0pnU2Ex?=
 =?utf-8?B?Wm8zZ3Y2WktLMEgrL2M5K3lpTFFnNlJEM0tvVngxZ1crN0trc3d4VEI2Q051?=
 =?utf-8?B?SmNOMnBkNHM2RnJCb2RtUzl2OGZXb01aWFBiUWFveVJhbjNvekw1MzNkNTlO?=
 =?utf-8?B?OEhmUjgzY2RmWEJMK21DTnMxN2xKTjJkQ0NNZUV3ZjJCTnJtMnpHZmE0dWMy?=
 =?utf-8?B?Wk9jMzJVaEFTdDlmNG1IUUQrWjN3anBRbDNid0pVUUhGdnVhSlF0cTdRT1Zn?=
 =?utf-8?B?YkVqajU3eGV6b2c3SndMZ2pPQ2llN3BpbzdCdkc0WVp6RXZPczRoYW10Z3F4?=
 =?utf-8?B?ZlZlRTd2aXRHVEJyNGdoMlllVXZNZlNjY0Nob0l2OHYvR2x4djRxRm5EbC8w?=
 =?utf-8?B?cWMyeWxzSjU4bXNoejdyQTNvWjlsR1VweHQ1Q3pieU80N2ZDSW5ZYTIzcUxq?=
 =?utf-8?B?RXlIQ1RWSDNyYzZZUG8vdXhZeFJpZU10RHM1VXFSeU5rUTdWOU4zT2xCNFFn?=
 =?utf-8?B?Nm00ZHIrT3dGM2NYL0FldzdkVFJOa0JweThMeXVjK3d4bnY0Qnc4MmI2eThm?=
 =?utf-8?B?Z3FYbmJ4czY0K1YzaUU5QVZWQy9HQ20rRjhuZ092QjZTdGhhazJ5ZmJ5TXRx?=
 =?utf-8?B?cEExOUljb0tKUkg0SER4NkFyc2toaDQ1VXpsRkhMNEJyRkdteDk3Q3VSVlcz?=
 =?utf-8?B?b2pzYjcvQWxIV3JUQld3b1ZEOXNHQURLanFyT0p2WFNPVGxGR3VrOE9FcVEr?=
 =?utf-8?B?TkZIWGNhME4wd0w5K1JWaU1hYStCOGNsRmpnTjE1aG40dnJrcC9pQkQ2ZmhH?=
 =?utf-8?B?UURNT1U2WHhLWFAxa1dMMkV1QWdaTW1hRlQrN1YvQUV2UC96Tjd3S2NYWDEr?=
 =?utf-8?B?NHJqeXJpMVpGRFZ5MDkzL0FvdlR2c0Q0UkdCRjF5U1FOYXluYmt5c3BCQkt3?=
 =?utf-8?B?enVFSEFuNmZiSjB6MjBoSTJpT0FJTEpsMktTNnpjTTJmTWtuYWNBbXNwOE5I?=
 =?utf-8?B?My9Pa1RJV3J3VlIyc1FUdUtqMkZveGNhZWMyUnp3VEI2OFQwV0M0aXdNUlI4?=
 =?utf-8?B?RXN1ZlBWTHp5cU02WWpZTk1hRkkzcFAwWUtiMFdqRzg2dFpqVXNRbzRJdXF1?=
 =?utf-8?B?Y2xxL20yYUVubWg3UVpRWjJJb3htN2JEekIra09URGw0djhvTWNndW9WRm5h?=
 =?utf-8?B?S0Y1QnVreFBiWFB3eU02ZmlQTjZ1UGpOSEhFSjBvMnlmckNQalRvNGdtQm9R?=
 =?utf-8?B?STdRNTExL0FZRkxRdkl0clNuOWQzTnd0bHVCZWV5cTR5VnV6Z3F1MmprY0Zn?=
 =?utf-8?B?Z3lKTzNBaHU1K0tmM3VlL3J5ZkVVMmhuY2FkSWQ1L0ZEbUt5cnhmdmVISHlW?=
 =?utf-8?B?VkNpVTBBektyRzRaNXhZaEdQVlExNmNDWmhpV3MvWVpuSFRXSE9JSFYwdmpR?=
 =?utf-8?B?U2IybzFXZE91K0w4bEoyRFdNelhJTDc3SDBvQlBzU0RqZXRXNU0zeWdOY3px?=
 =?utf-8?B?em4rRk9VVERSYi9DQXc2YnUzTjBzbzlUOXgwajVxSWpFcDhJaC9ZTGl0b1Zh?=
 =?utf-8?B?VER6L25sYXJKek9VWUcvSC9wYmR4YmpNb0ZCOUFGeUFmVTJSQkhibmxmbnhR?=
 =?utf-8?Q?VNq+15m4zls=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emVDeHBSVmZlMnFhY3JTQ2lkbkNQcFBvbUVYVWh1cW9INDZnWjlwc3dKNGcz?=
 =?utf-8?B?cjNwcU9BNVVCOVhLVGFvSW1WdzlOT0owNjlQSnhpZFdVSlBDUWs2U1kxWTBJ?=
 =?utf-8?B?REJ0QmhJMm13MUV3M3JyclR6Mk9TMmRxT253YTdvRXozeVVheGxNZ2UwTFQy?=
 =?utf-8?B?S1lYUjNGZ3hGQVp0RW5kdjlSRmFyWmhDQk14d1N6RHQ2bEhQTjZTdVVPRnYy?=
 =?utf-8?B?QlZnV0o4M2RhVnBjb2RVa1UyMGRBV0U3OTBOWkI1R3BnRkdBZzh0RUxYODYz?=
 =?utf-8?B?czl6N3daaUQ2bGY3cGlpRzVLUy9VcnpaNmwvc09RUDFzaXVCeEtPYWhjNXVh?=
 =?utf-8?B?M2VpL0JVV3ZLSWY5RElOdEhRQTFENzhUVVZWY2NaWlpNVFZOeDN6ZTlrbVNM?=
 =?utf-8?B?TklCdUZ1OHBSM1c2ZEpva0tMMzNJcU5BeGpjRE9zNUY5OFlPTUlqcFcrS0x5?=
 =?utf-8?B?NkVYQnBYdHE0MUNYNjFFRG9TekFCbjRncUtFMFduUlNzL0d4T0c1cCtXZXhV?=
 =?utf-8?B?cmpXNzBTdGY0ZXNZbmdaYmJaOSthWHV0YlRUMUVvVWZJS3Z3cFR6TnplRElu?=
 =?utf-8?B?d3pTYjFHeThmVXFham1FTk8ySjlGR1NZWk5pZ2hxVGlYVzUwNjh1M2s1ZjZh?=
 =?utf-8?B?ZFpJRjE5Wi9TOTdkQ0kxdmo2OWxMcTlHak5XZjFKTmF3UnpGeHdmQmZtbmFs?=
 =?utf-8?B?R2p1VXhFeDF2QnRiQWZ6aDRkQmtRT0RWcWQ3RXQvelZQMU01N0xoTFdsK0J1?=
 =?utf-8?B?Qit0RmpFOG5FcVBza3hSbzFMKzBPRDhSZDZkb3RQME9iemU1R20ycG53cnpk?=
 =?utf-8?B?cmJoWnk4SWovNmQ3SFNlWEl5V25aTCtLKzhUSC80NE03eUlTQ2VwV2lQakw0?=
 =?utf-8?B?Q3QvUnFNTGExeUFXVnlCb2pKVTh4VmNDZTBTNWF3MU1qTWhFanhzQzBaRmI1?=
 =?utf-8?B?MDNldGtvVS9rWUpZZDFoQUwyN0dYSjBkclM0RU5mYmkzRU43bTYyUFRiWnBj?=
 =?utf-8?B?WHNqMENDMlJsT0dBeHRkNEpMakZrUFQ4NlQ1WGsxWGNEYzY0R1lDaG9EcUpk?=
 =?utf-8?B?TU45QkUrdnlCdzVvWDJYYUdBSDZFazhvbXpVNUZrT2xKNEZ2UTdpQ2dFWVEr?=
 =?utf-8?B?SXZJYjAxSzhHeHdCb251TTIvZ3V5Y2NGUFY1R1IzelZvazJyK0lQTmVRUUlD?=
 =?utf-8?B?NVI3bjNNUWlNclVzYUw0MUxNZXhCUlhCcTUrdXVXaEt3VUdpVm0yaUdwdDA3?=
 =?utf-8?B?Tno3U0pGbi9NWXp2Sm5wM0d5eDd2Sm82TFdjVndZS3A4UUVHTTJqd2Q2Szd4?=
 =?utf-8?B?YjBKM2ZLU3d5OENLU3F6ZmNvQkZBTFlOREp5LzFzNXlzUHVSYkJtS0p1cUo3?=
 =?utf-8?B?Z3o5T0lOZHVkb3lzYm1VdXBHc0x5YWlZbkJRQjNObjRUWm1QZ1Q1Q1BMVkZq?=
 =?utf-8?B?dUhRUlJFa2sreGZHNnlLZ0xGUEJXT3REalppVG9hUEZtMW55VTBQUWpJWkdm?=
 =?utf-8?B?MStMeXZ2ZkdwaWhSMUdTL1EvK0FMSE9xNGkxdk5Eem96Y1dMUmFhMzZjcng0?=
 =?utf-8?B?UTRRbktYVWM2KzZLZmhlQTA0VVZNQkd6QlB4aERLUGNlMmRXS1JiZkRhQ2Q1?=
 =?utf-8?B?ejlQYVdwb2taNFIwcmdkNFFTcUNac05sODU0ak1wQnY3UW5CZklUTGk0K3RL?=
 =?utf-8?B?S0RXQ0hOTzNpa0tvbEJrUTNuL1dFQ0txRzNoKy9EdE1tREp0ZHoxeXhyTzA1?=
 =?utf-8?B?Q1RZL2lrQXRNU3lSRFhLN004MlFLazFFWHY3ZU5JRFdDOHlpVFBmTHVVK1dw?=
 =?utf-8?B?ZnM4TG0rbDh3N3ptbXpnZXRoamZTenV5OEJtSzM2eGEwVFpvYVpjNXJ5REtu?=
 =?utf-8?B?UERsWVZuWjhQZmw4VGpHemgrNytPa3d6TngxKzhjTk1QQlI3KzZkdVFEaXV1?=
 =?utf-8?B?d1hyTFdGa3ROVEo1UENrdWRrZ1VtMGVqL3pjdm1iWkJ1end5M0lKYmNtdldZ?=
 =?utf-8?B?MHJVcm9HbG15NU80TWJla0c2dzJFcFVHMXpXbmhiUkgxMktBZHRoblpLY1Ix?=
 =?utf-8?B?RFFHOHRJUjMxSVRnVE9VV09VL1FQN3JBRzRTcGdlVVZhV1RvTnMxRlhPZjYr?=
 =?utf-8?B?UnUwQjVBdkowZ3YrRXA4RFNXMkJ0L2dqcm9aL09oMWtiUEFEdzkreitFa1RD?=
 =?utf-8?B?VEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f3356c9-24df-44e5-0a01-08ddbee26039
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 12:16:04.4454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: thSPx3j4FIC+UrNrgpMIs8loSsEF4vjkFwKA+jzHSP/vb7HmNtbwiU3Onzc275d3t83UP/3zbdD7i6KJsJRaUJOYWkverTl2wo221u1TT/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8220
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

Currently in the drivers we have defined VRAM regions per device and per
tile. Initialization of these regions is done in two completely different
ways. To simplify the logic of the code and make it easier to add new
regions in the future, let's unify the way we initialize VRAM regions.

v2:
- fix doc comments in struct xe_vram_region
- remove unnecessary includes (Jani)
v3:
- move code from xe_vram_init_regions_managers to xe_tile_init_noalloc
  (Matthew)
- replace ioremap_wc to devm_ioremap_wc for mapping VRAM BAR
  (Matthew)
- Replace the tile id parameter with vram region in the xe_pf_begin
  function.
v4:
- remove tile back pointer from struct xe_vram_region
- add new back pointers: xe and migarte to xe_vram_region

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com> # rev3
---
 drivers/gpu/drm/xe/xe_bo.h           |   4 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  13 ++-
 drivers/gpu/drm/xe/xe_query.c        |   3 +-
 drivers/gpu/drm/xe/xe_svm.c          |  43 ++++----
 drivers/gpu/drm/xe/xe_tile.c         |  37 +++----
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  16 ++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |   3 +-
 drivers/gpu/drm/xe/xe_vram.c         | 151 ++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_vram.h         |   2 +
 drivers/gpu/drm/xe/xe_vram_types.h   |  17 ++-
 10 files changed, 164 insertions(+), 125 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 8559901e4088..3ddeac367060 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -12,6 +12,7 @@
 #include "xe_macros.h"
 #include "xe_vm_types.h"
 #include "xe_vm.h"
+#include "xe_vram_types.h"
 
 #define XE_DEFAULT_GTT_SIZE_MB          3072ULL /* 3GB by default */
 
@@ -23,8 +24,9 @@
 #define XE_BO_FLAG_VRAM_MASK		(XE_BO_FLAG_VRAM0 | XE_BO_FLAG_VRAM1)
 /* -- */
 #define XE_BO_FLAG_STOLEN		BIT(4)
+#define XE_BO_FLAG_VRAM(vram)		(XE_BO_FLAG_VRAM0 << ((vram)->id))
 #define XE_BO_FLAG_VRAM_IF_DGFX(tile)	(IS_DGFX(tile_to_xe(tile)) ? \
-					 XE_BO_FLAG_VRAM0 << (tile)->id : \
+					 XE_BO_FLAG_VRAM((tile)->mem.vram) : \
 					 XE_BO_FLAG_SYSTEM)
 #define XE_BO_FLAG_GGTT			BIT(5)
 #define XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE BIT(6)
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 5a75d56d8558..ab43dec52776 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -23,6 +23,7 @@
 #include "xe_svm.h"
 #include "xe_trace_bo.h"
 #include "xe_vm.h"
+#include "xe_vram_types.h"
 
 struct pagefault {
 	u64 page_addr;
@@ -74,7 +75,7 @@ static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
 }
 
 static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
-		       bool atomic, unsigned int id)
+		       bool atomic, struct xe_vram_region *vram)
 {
 	struct xe_bo *bo = xe_vma_bo(vma);
 	struct xe_vm *vm = xe_vma_vm(vma);
@@ -84,14 +85,16 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
 	if (err)
 		return err;
 
-	if (atomic && IS_DGFX(vm->xe)) {
+	if (atomic && vram) {
+		xe_assert(vm->xe, IS_DGFX(vm->xe));
+
 		if (xe_vma_is_userptr(vma)) {
 			err = -EACCES;
 			return err;
 		}
 
 		/* Migrate to VRAM, move should invalidate the VMA first */
-		err = xe_bo_migrate(bo, XE_PL_VRAM0 + id);
+		err = xe_bo_migrate(bo, vram->placement);
 		if (err)
 			return err;
 	} else if (bo) {
@@ -138,7 +141,7 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
 	/* Lock VM and BOs dma-resv */
 	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
-		err = xe_pf_begin(&exec, vma, atomic, tile->id);
+		err = xe_pf_begin(&exec, vma, atomic, tile->mem.vram);
 		drm_exec_retry_on_contention(&exec);
 		if (xe_vm_validate_should_retry(&exec, err, &end))
 			err = -EAGAIN;
@@ -573,7 +576,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 	/* Lock VM and BOs dma-resv */
 	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
-		ret = xe_pf_begin(&exec, vma, true, tile->id);
+		ret = xe_pf_begin(&exec, vma, true, tile->mem.vram);
 		drm_exec_retry_on_contention(&exec);
 		if (ret)
 			break;
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 66ea3403afbe..56ef3ee2806f 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -27,6 +27,7 @@
 #include "xe_oa.h"
 #include "xe_pxp.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_vram_types.h"
 #include "xe_wa.h"
 
 static const u16 xe_to_user_engine_class[] = {
@@ -410,7 +411,7 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 			gt_list->gt_list[iter].near_mem_regions = 0x1;
 		else
 			gt_list->gt_list[iter].near_mem_regions =
-				BIT(gt_to_tile(gt)->id) << 1;
+				BIT(gt_to_tile(gt)->mem.vram->id) << 1;
 		gt_list->gt_list[iter].far_mem_regions = xe->info.mem_region_mask ^
 			gt_list->gt_list[iter].near_mem_regions;
 
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 901f9a0268e6..10c8a1bcb86e 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -311,12 +311,11 @@ static u64 xe_vram_region_page_to_dpa(struct xe_vram_region *vr,
 				      struct page *page)
 {
 	u64 dpa;
-	struct xe_tile *tile = vr->tile;
 	u64 pfn = page_to_pfn(page);
 	u64 offset;
 
-	xe_tile_assert(tile, is_device_private_page(page));
-	xe_tile_assert(tile, (pfn << PAGE_SHIFT) >= vr->hpa_base);
+	xe_assert(vr->xe, is_device_private_page(page));
+	xe_assert(vr->xe, (pfn << PAGE_SHIFT) >= vr->hpa_base);
 
 	offset = (pfn << PAGE_SHIFT) - vr->hpa_base;
 	dpa = vr->dpa_base + offset;
@@ -333,7 +332,7 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 		       unsigned long npages, const enum xe_svm_copy_dir dir)
 {
 	struct xe_vram_region *vr = NULL;
-	struct xe_tile *tile;
+	struct xe_device *xe;
 	struct dma_fence *fence = NULL;
 	unsigned long i;
 #define XE_VRAM_ADDR_INVALID	~0x0ull
@@ -366,7 +365,7 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 
 		if (!vr && spage) {
 			vr = page_to_vr(spage);
-			tile = vr->tile;
+			xe = vr->xe;
 		}
 		XE_WARN_ON(spage && page_to_vr(spage) != vr);
 
@@ -398,18 +397,18 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 
 			if (vram_addr != XE_VRAM_ADDR_INVALID) {
 				if (sram) {
-					vm_dbg(&tile->xe->drm,
+					vm_dbg(&xe->drm,
 					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%ld",
 					       vram_addr, (u64)dma_addr[pos], i - pos + incr);
-					__fence = xe_migrate_from_vram(tile->migrate,
+					__fence = xe_migrate_from_vram(vr->migrate,
 								       i - pos + incr,
 								       vram_addr,
 								       dma_addr + pos);
 				} else {
-					vm_dbg(&tile->xe->drm,
+					vm_dbg(&xe->drm,
 					       "COPY TO VRAM - 0x%016llx -> 0x%016llx, NPAGES=%ld",
 					       (u64)dma_addr[pos], vram_addr, i - pos + incr);
-					__fence = xe_migrate_to_vram(tile->migrate,
+					__fence = xe_migrate_to_vram(vr->migrate,
 								     i - pos + incr,
 								     dma_addr + pos,
 								     vram_addr);
@@ -434,17 +433,17 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 			/* Extra mismatched device page, copy it */
 			if (!match && last && vram_addr != XE_VRAM_ADDR_INVALID) {
 				if (sram) {
-					vm_dbg(&tile->xe->drm,
+					vm_dbg(&xe->drm,
 					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%d",
 					       vram_addr, (u64)dma_addr[pos], 1);
-					__fence = xe_migrate_from_vram(tile->migrate, 1,
+					__fence = xe_migrate_from_vram(vr->migrate, 1,
 								       vram_addr,
 								       dma_addr + pos);
 				} else {
-					vm_dbg(&tile->xe->drm,
+					vm_dbg(&xe->drm,
 					       "COPY TO VRAM - 0x%016llx -> 0x%016llx, NPAGES=%d",
 					       (u64)dma_addr[pos], vram_addr, 1);
-					__fence = xe_migrate_to_vram(tile->migrate, 1,
+					__fence = xe_migrate_to_vram(vr->migrate, 1,
 								     dma_addr + pos,
 								     vram_addr);
 				}
@@ -502,9 +501,9 @@ static u64 block_offset_to_pfn(struct xe_vram_region *vr, u64 offset)
 	return PHYS_PFN(offset + vr->hpa_base);
 }
 
-static struct drm_buddy *tile_to_buddy(struct xe_tile *tile)
+static struct drm_buddy *vram_to_buddy(struct xe_vram_region *vram)
 {
-	return &tile->mem.vram->ttm.mm;
+	return &vram->ttm.mm;
 }
 
 static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocation,
@@ -518,8 +517,7 @@ static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocati
 
 	list_for_each_entry(block, blocks, link) {
 		struct xe_vram_region *vr = block->private;
-		struct xe_tile *tile = vr->tile;
-		struct drm_buddy *buddy = tile_to_buddy(tile);
+		struct drm_buddy *buddy = vram_to_buddy(vr);
 		u64 block_pfn = block_offset_to_pfn(vr, drm_buddy_block_offset(block));
 		int i;
 
@@ -685,8 +683,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 				      unsigned long timeslice_ms)
 {
 	struct xe_vram_region *vr = container_of(dpagemap, typeof(*vr), dpagemap);
-	struct xe_tile *tile = vr->tile;
-	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_device *xe = vr->xe;
 	struct device *dev = xe->drm.dev;
 	struct drm_buddy_block *block;
 	struct list_head *blocks;
@@ -700,9 +697,9 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 	xe_pm_runtime_get(xe);
 
  retry:
-	bo = xe_bo_create_locked(tile_to_xe(tile), NULL, NULL, end - start,
+	bo = xe_bo_create_locked(vr->xe, NULL, NULL, end - start,
 				 ttm_bo_type_device,
-				 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+				 (IS_DGFX(xe) ? XE_BO_FLAG_VRAM(vr) : XE_BO_FLAG_SYSTEM) |
 				 XE_BO_FLAG_CPU_ADDR_MIRROR);
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
@@ -712,9 +709,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 	}
 
 	drm_pagemap_devmem_init(&bo->devmem_allocation, dev, mm,
-				&dpagemap_devmem_ops,
-				&tile->mem.vram->dpagemap,
-				end - start);
+				&dpagemap_devmem_ops, dpagemap, end - start);
 
 	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
 	list_for_each_entry(block, blocks, link)
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 171de6a4ba95..0be0a5c57ef4 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -7,6 +7,7 @@
 
 #include <drm/drm_managed.h>
 
+#include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
@@ -118,11 +119,9 @@ int xe_tile_alloc_vram(struct xe_tile *tile)
 	if (!IS_DGFX(xe))
 		return 0;
 
-	vram = drmm_kzalloc(&xe->drm, sizeof(*vram), GFP_KERNEL);
-	if (!vram)
-		return -ENOMEM;
-
-	vram->tile = tile;
+	vram = xe_vram_region_alloc(xe, tile->id, XE_PL_VRAM0 + tile->id);
+	if (IS_ERR(vram))
+		return PTR_ERR(vram);
 	tile->mem.vram = vram;
 
 	return 0;
@@ -160,21 +159,6 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
 }
 ALLOW_ERROR_INJECTION(xe_tile_init_early, ERRNO); /* See xe_pci_probe() */
 
-static int tile_ttm_mgr_init(struct xe_tile *tile)
-{
-	struct xe_device *xe = tile_to_xe(tile);
-	int err;
-
-	if (tile->mem.vram) {
-		err = xe_ttm_vram_mgr_init(tile, &tile->mem.vram->ttm);
-		if (err)
-			return err;
-		xe->info.mem_region_mask |= BIT(tile->id) << 1;
-	}
-
-	return 0;
-}
-
 /**
  * xe_tile_init_noalloc - Init tile up to the point where allocations can happen.
  * @tile: The tile to initialize.
@@ -192,17 +176,20 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
 int xe_tile_init_noalloc(struct xe_tile *tile)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	int err;
-
-	err = tile_ttm_mgr_init(tile);
-	if (err)
-		return err;
 
 	xe_wa_apply_tile_workarounds(tile);
 
 	if (xe->info.has_usm && IS_DGFX(xe))
 		xe_devm_add(tile, tile->mem.vram);
 
+	if (IS_DGFX(xe) && !ttm_resource_manager_used(&tile->mem.vram->ttm.manager)) {
+		int err = xe_ttm_vram_mgr_init(xe, tile->mem.vram);
+
+		if (err)
+			return err;
+		xe->info.mem_region_mask |= BIT(tile->mem.vram->id) << 1;
+	}
+
 	return xe_tile_sysfs_init(tile);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 8f9b8a1d2c05..9175b4a2214b 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -338,12 +338,18 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 	return drmm_add_action_or_reset(&xe->drm, ttm_vram_mgr_fini, mgr);
 }
 
-int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr)
+/**
+ * xe_ttm_vram_mgr_init - initialize TTM VRAM region
+ * @xe: pointer to Xe device
+ * @vram: pointer to xe_vram_region that contains the memory region attributes
+ *
+ * Initialize the Xe TTM for given @vram region using the given parameters.
+ *
+ * Returns 0 for success, negative error code otherwise.
+ */
+int xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_vram_region *vram)
 {
-	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_vram_region *vram = tile->mem.vram;
-
-	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
+	return __xe_ttm_vram_mgr_init(xe, &vram->ttm, vram->placement,
 				      xe_vram_region_usable_size(vram),
 				      xe_vram_region_io_size(vram),
 				      PAGE_SIZE);
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
index cc76050e376d..87b7fae5edba 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
@@ -11,11 +11,12 @@
 enum dma_data_direction;
 struct xe_device;
 struct xe_tile;
+struct xe_vram_region;
 
 int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 			   u32 mem_type, u64 size, u64 io_size,
 			   u64 default_page_size);
-int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr);
+int xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_vram_region *vram);
 int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 			      struct ttm_resource *res,
 			      u64 offset, u64 length,
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 366e5d8a85ca..b44ebf50fedb 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -20,6 +20,7 @@
 #include "xe_mmio.h"
 #include "xe_module.h"
 #include "xe_sriov.h"
+#include "xe_ttm_vram_mgr.h"
 #include "xe_vram.h"
 #include "xe_vram_types.h"
 
@@ -138,7 +139,7 @@ static bool resource_is_valid(struct pci_dev *pdev, int bar)
 	return true;
 }
 
-static int determine_lmem_bar_size(struct xe_device *xe)
+static int determine_lmem_bar_size(struct xe_device *xe, struct xe_vram_region *lmem_bar)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 
@@ -149,17 +150,16 @@ static int determine_lmem_bar_size(struct xe_device *xe)
 
 	resize_vram_bar(xe);
 
-	xe->mem.vram->io_start = pci_resource_start(pdev, LMEM_BAR);
-	xe->mem.vram->io_size = pci_resource_len(pdev, LMEM_BAR);
-	if (!xe->mem.vram->io_size)
+	lmem_bar->io_start = pci_resource_start(pdev, LMEM_BAR);
+	lmem_bar->io_size = pci_resource_len(pdev, LMEM_BAR);
+	if (!lmem_bar->io_size)
 		return -EIO;
 
 	/* XXX: Need to change when xe link code is ready */
-	xe->mem.vram->dpa_base = 0;
+	lmem_bar->dpa_base = 0;
 
 	/* set up a map to the total memory area. */
-	xe->mem.vram->mapping = devm_ioremap_wc(&pdev->dev, xe->mem.vram->io_start,
-						xe->mem.vram->io_size);
+	lmem_bar->mapping = devm_ioremap_wc(&pdev->dev, lmem_bar->io_start, lmem_bar->io_size);
 
 	return 0;
 }
@@ -287,6 +287,67 @@ static void vram_fini(void *arg)
 		tile->mem.vram->mapping = NULL;
 }
 
+struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement)
+{
+	struct xe_vram_region *vram;
+	struct drm_device *drm = &xe->drm;
+
+	xe_assert(xe, id < xe->info.tile_count);
+
+	vram = drmm_kzalloc(drm, sizeof(*vram), GFP_KERNEL);
+	if (!vram)
+		return NULL;
+
+	vram->xe = xe;
+	vram->id = id;
+	vram->placement = placement;
+#if defined(CONFIG_DRM_XE_PAGEMAP)
+	vram->migrate = xe->tiles[id].migrate;
+#endif
+	return vram;
+}
+
+static void print_vram_region_info(struct xe_device *xe, struct xe_vram_region *vram)
+{
+	struct drm_device *drm = &xe->drm;
+
+	if (vram->io_size < vram->usable_size)
+		drm_info(drm, "Small BAR device\n");
+
+	drm_info(drm,
+		 "VRAM[%u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
+		 vram->id, &vram->actual_physical_size, &vram->usable_size, &vram->io_size);
+	drm_info(drm, "VRAM[%u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
+		 vram->id, &vram->dpa_base, vram->dpa_base + (u64)vram->actual_physical_size,
+		 &vram->io_start, vram->io_start + (u64)vram->io_size);
+}
+
+static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
+			    struct xe_vram_region *lmem_bar, u64 offset, u64 usable_size,
+			    u64 region_size, resource_size_t remain_io_size)
+{
+	/* Check if VRAM region is already initialized */
+	if (vram->mapping)
+		return 0;
+
+	vram->actual_physical_size = region_size;
+	vram->io_start = lmem_bar->io_start + offset;
+	vram->io_size = min_t(u64, usable_size, remain_io_size);
+
+	if (!vram->io_size) {
+		drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
+		return -ENODEV;
+	}
+
+	vram->dpa_base = lmem_bar->dpa_base + offset;
+	vram->mapping = lmem_bar->mapping + offset;
+	vram->usable_size = usable_size;
+
+	print_vram_region_info(xe, vram);
+
+	return 0;
+}
+
 /**
  * xe_vram_probe() - Probe VRAM configuration
  * @xe: the &xe_device
@@ -298,82 +359,52 @@ static void vram_fini(void *arg)
 int xe_vram_probe(struct xe_device *xe)
 {
 	struct xe_tile *tile;
-	resource_size_t io_size;
+	struct xe_vram_region lmem_bar;
+	resource_size_t remain_io_size;
 	u64 available_size = 0;
 	u64 total_size = 0;
-	u64 tile_offset;
-	u64 tile_size;
-	u64 vram_size;
 	int err;
 	u8 id;
 
 	if (!IS_DGFX(xe))
 		return 0;
 
-	/* Get the size of the root tile's vram for later accessibility comparison */
-	tile = xe_device_get_root_tile(xe);
-	err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
+	err = determine_lmem_bar_size(xe, &lmem_bar);
 	if (err)
 		return err;
+	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &lmem_bar.io_start, &lmem_bar.io_size);
 
-	err = determine_lmem_bar_size(xe);
-	if (err)
-		return err;
-
-	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
-		 &xe->mem.vram->io_size);
-
-	io_size = xe->mem.vram->io_size;
+	remain_io_size = lmem_bar.io_size;
 
-	/* tile specific ranges */
 	for_each_tile(tile, xe, id) {
-		err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
+		u64 region_size;
+		u64 usable_size;
+		u64 tile_offset;
+
+		err = tile_vram_size(tile, &usable_size, &region_size, &tile_offset);
 		if (err)
 			return err;
 
-		tile->mem.vram->actual_physical_size = tile_size;
-		tile->mem.vram->io_start = xe->mem.vram->io_start + tile_offset;
-		tile->mem.vram->io_size = min_t(u64, vram_size, io_size);
+		total_size += region_size;
+		available_size += usable_size;
 
-		if (!tile->mem.vram->io_size) {
-			drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
-			return -ENODEV;
-		}
+		err = vram_region_init(xe, tile->mem.vram, &lmem_bar, tile_offset, usable_size,
+				       region_size, remain_io_size);
+		if (err)
+			return err;
 
-		tile->mem.vram->dpa_base = xe->mem.vram->dpa_base + tile_offset;
-		tile->mem.vram->usable_size = vram_size;
-		tile->mem.vram->mapping = xe->mem.vram->mapping + tile_offset;
-
-		if (tile->mem.vram->io_size < tile->mem.vram->usable_size)
-			drm_info(&xe->drm, "Small BAR device\n");
-		drm_info(&xe->drm,
-			 "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
-			 id, tile->id, &tile->mem.vram->actual_physical_size,
-			 &tile->mem.vram->usable_size, &tile->mem.vram->io_size);
-		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
-			 id, tile->id, &tile->mem.vram->dpa_base,
-			 tile->mem.vram->dpa_base + (u64)tile->mem.vram->actual_physical_size,
-			 &tile->mem.vram->io_start,
-			 tile->mem.vram->io_start + (u64)tile->mem.vram->io_size);
-
-		/* calculate total size using tile size to get the correct HW sizing */
-		total_size += tile_size;
-		available_size += vram_size;
-
-		if (total_size > xe->mem.vram->io_size) {
+		if (total_size > lmem_bar.io_size) {
 			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
-				 &total_size, &xe->mem.vram->io_size);
+				 &total_size, &lmem_bar.io_size);
 		}
 
-		io_size -= min_t(u64, tile_size, io_size);
+		remain_io_size -= min_t(u64, tile->mem.vram->actual_physical_size, remain_io_size);
 	}
 
-	xe->mem.vram->actual_physical_size = total_size;
-
-	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
-		 &xe->mem.vram->actual_physical_size);
-	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
-		 &available_size);
+	err = vram_region_init(xe, xe->mem.vram, &lmem_bar, 0, available_size, total_size,
+			       lmem_bar.io_size);
+	if (err)
+		return err;
 
 	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index d4bf1f9c2a72..72860f714fc6 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -13,6 +13,8 @@ struct xe_vram_region;
 
 int xe_vram_probe(struct xe_device *xe);
 
+struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement);
+
 resource_size_t xe_vram_region_io_start(const struct xe_vram_region *vram);
 resource_size_t xe_vram_region_io_size(const struct xe_vram_region *vram);
 resource_size_t xe_vram_region_dpa_base(const struct xe_vram_region *vram);
diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
index a01838236036..83772dcbf1af 100644
--- a/drivers/gpu/drm/xe/xe_vram_types.h
+++ b/drivers/gpu/drm/xe/xe_vram_types.h
@@ -12,7 +12,8 @@
 
 #include "xe_ttm_vram_mgr_types.h"
 
-struct xe_tile;
+struct xe_device;
+struct xe_migrate;
 
 /**
  * struct xe_vram_region - memory region structure
@@ -20,8 +21,14 @@ struct xe_tile;
  * device, such as HBM memory or CXL extension memory.
  */
 struct xe_vram_region {
-	/** @tile: Back pointer to tile */
-	struct xe_tile *tile;
+	/** @xe: Back pointer to xe device */
+	struct xe_device *xe;
+	/**
+	 * @id: VRAM region instance id
+	 *
+	 * The value should be unique for VRAM region.
+	 */
+	u8 id;
 	/** @io_start: IO start address of this VRAM instance */
 	resource_size_t io_start;
 	/**
@@ -54,7 +61,11 @@ struct xe_vram_region {
 	void __iomem *mapping;
 	/** @ttm: VRAM TTM manager */
 	struct xe_ttm_vram_mgr ttm;
+	/** @placement: TTM placement dedicated for this region */
+	u32 placement;
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
+	/** @migrate: Back pointer to migrate */
+	struct xe_migrate *migrate;
 	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
 	struct dev_pagemap pagemap;
 	/**
-- 
2.34.1

