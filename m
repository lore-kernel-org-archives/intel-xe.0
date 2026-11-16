Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BC7606A31C
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 09:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VSC/rpXt;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=WZAZ6Iv5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD4C510EE19;
	Mon, 16 Nov 2026 09:45:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F0610EE34
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 09:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794822334; x=1826358334;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=SnM4j14StC1Rky6UbauAYmsZeGwbc3mX+d6q441wHYw=;
 b=VSC/rpXts7SPwErxggAg+A/nJs859FnuU3lcfjKsCEQtFCNAM1VprNur
 W6nGVYiKjpXWLgK29PNI3Q+oQJLcKAb5xCKAFNXKy6hit1BjEYzLUDmeT
 6ZGHJxP7sv1P2QAlQD9/fZBpM7y5ctvKv8GEP5kvuqhDXyBtUMXgohqxh
 lLzaE8ydFuCZ5eQE51xdNjpPzvp6z2HcRITr1BTRyugdCx7HLE6mWXO4d
 tCw+ybGHSnCYaon0uQxPCryGIFtebCEf7dk/xyDDAI+kmExF+BjQ6OCL2
 AUIHQTYqXwMU1k7ydPNivcZEDrjV9AOfTawfrBL4BwIvNprooSblzQHz8 g==;
X-CSE-ConnectionGUID: VLIWxZG7SouvNFD3xKNBSg==
X-CSE-MsgGUID: JgewFqgtRwS4swJ7oGPjqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3589385"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3589385"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:45:34 -0800
X-CSE-ConnectionGUID: T0Z3sXqdRyWJblMKrNOiNQ==
X-CSE-MsgGUID: PmzvMg4dQ3Sx1fSOTrRg9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9665038"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:45:33 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 01:45:33 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 01:45:33 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.27) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 01:45:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eXwyQlBSXZzvxN+lC8oxqMPMl/yyWUZigGxnDAQQkKpj8Tym6LxNhYQwl4iXFbRoL77TzCvr4s/wbgNF4NdpxZ0xCdF2YDcmNy0lbKcvmAz/xucCFBB/V4n/L7xLQxlvW8Zvg7B5w7QLHftHEwenxmjzXaO9KdLkv3nsGOhc8vEY+peVMgsF5R3p1q0nOvK0kKMGTESEUedBp0U63/NlGMmQxnwg81Kj9NqPkj21mkVmI7FgOx+A3oUBtvBdbiC8SkLLe8k3DAztIYd9wk5EvR0NAyxdSNRZbLLcuY12fgCKgnQUKi+U8SalawJuAw+R9T68rXd/FqIeQCOYhvzU0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2AHpirHAZqx+wO7ybkgQG9OHIbB0+FWMg+PVV+e7qY=;
 b=FC9HsfEuYGa9VkgnanLvyufGMr3PiR+yBNLsyIoLYO5MqYx6YCKuza+HkwzJDI7D8pM7jwX/A3ilMSLoZkRKjiZvTcObs/AJce2rddn8+qEI1JTs7rZnfw3ULDPVt5JAeYcpCbgZxYx/ry+XksaPGQih7+NWTeNIiHXpU5CPy+aMh8N6g1L1XjBeaqn7T+WgPJASl/MiDtQAicR6lDpjSr/8Jc4hywpj4PzWnOAPPhN+DAUYwUdhNuxGqTZGKFIkmzH70A3+yzkQrCWP4BNFXvD3/iHWTapT0OEfj97z4CH0pbcCbJ2xXMWg3l7yVpN/2PzkZrvB0mxqARkPWQ51dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2AHpirHAZqx+wO7ybkgQG9OHIbB0+FWMg+PVV+e7qY=;
 b=WZAZ6Iv5AV2KP03RMQbqM7V9aMqa0exvdBItYfHNGyLJANvI5WaeQsmTIedlzWjg7h0/D4QG6KuRSzz+NQ3K7hqX/ReHmWauTqDZsmL6SFRH+rvzCclEnw8zlEkjngdkbvAWL1SvYizILi0/bq4WdJFB2mCTqi+sfUEkLTPEncc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by IA3PPFED21B01E3.namprd11.prod.outlook.com
 (2603:10b6:20f:fc04::cd) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 09:45:31 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0615.012; Mon, 16 Nov 2026
 09:45:30 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>
Subject: [PATCH v4 0/7] Introduce purpose-specific VRAM pools
Date: Mon, 16 Nov 2026 10:45:16 +0100
Message-Id: <20261116094523.2484301-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0028.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::41) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|IA3PPFED21B01E3:EE_
X-MS-Office365-Filtering-Correlation-Id: a14adb42-7b52-45ab-2a4c-08df43c65a49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|18002099003|6133799003|11063799006|56012099006|10067099003|261022105027099003|261022075727099003|261028144727099003|261026121527099003|261021135927099003|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: klrwyeyq1cNHn+BkfGJjeIW6odRQHNBTr3DXH3xGFVWXv5ENq00yqs2DFYPj09cl36C7WIYMEMrONkEQsGMqPMbzFahB+g/BssabnssUuxW9BUCtRxuakJweXS0q7OTeLYZqrv9+mTwrv04rMynaDPM1YwSXDoT8JeaO9Xml8+/sZitEJrc/lmh1ce+KBed6njU1TUyBj9hv2k00sRBEGYNHYSvbTGVQXLxgVehRWf21LHshKc+HqV8m0fA0nqVJYqhfel7+wvRRDlTHRSucROPS0pSe8ui1WOXz3l6EbbVSu24piXH6DqK/oYMmMTdtDvBTvdyaPWI7RhdavLIX24ZTOrtCIrrrYdzLIL7b8GmGUi+qtJGNLUiO/opq8JHF8E3jMtpM+Ez0Rg+vufejJiz6xOEp6xrHHrMAnQbpWyyHKiMXxTCJaGSE2lhWpxWquKbMiABZklW0gV/3ksM2kfTdSePjGDARwyh7ZdDOkey9cmc6dkU3w0UW8TCPUvZUKYHUZzeerwieD0sLI8p8Vo7j+P6ytvvtvNh/BrZKcC8EXSAbQsPaiGbApYHBx1g7UcPgzqRb3f5oq0HgQfi14rrBPnzYzfq+xuO5uZxxnVxvjmi9ya/zLDs2CfotHDj8lFoIONXs5Nv+/rQTupyOOVoqOCyJEb89EftkLwc3i2I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(18002099003)(6133799003)(11063799006)(56012099006)(10067099003)(261022105027099003)(261022075727099003)(261028144727099003)(261026121527099003)(261021135927099003)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWdueVdEeTJQbVV2amF2MEY1S0pUS244N2hqQmd5dkxiS3dvL1BTdlorOHBh?=
 =?utf-8?B?cmlOOFRHNkd6TmlZWEZjQlJPUWRJVkhzSkhoN1dDTzZSNDFXNW1tTWhxSDRr?=
 =?utf-8?B?RlVxNkpGUmhXUHJjc0JraHRVakhNSGNGb1pCMW9RTHBpeTJPaXJwKzlwU0t1?=
 =?utf-8?B?blU4QS9kaFpDbXVBWGV4RjRLWGR2TWMrT0FUaG1RTEpTVnd6SWlldGp2YVpm?=
 =?utf-8?B?bzlmZ2xvcWNmeWRFZ3lIN01IYXZSTHNublJEeHllZmtNREprRTV2d3hDSHNa?=
 =?utf-8?B?TUNESDk0azJSNkF4S3RlU0xKSDFEajJpSjhKYTk4c0RRTXlsYkRwaTBqT1c2?=
 =?utf-8?B?Vyt4T0FJMkxtV045WVY4NjI3c0hnVjNhOWcxSnlvdjhHNzBERkZEdUdIMnln?=
 =?utf-8?B?UFAvWExEdHFnekJkbmd1dVJETlJZemZzdFp2SXdEVVlHV1J1dmkrV2d1NERU?=
 =?utf-8?B?OFZiUVlQa1kyUnRIVTI1Q0lOdEJ5ZkkvLzdVdXZKejQrbytuZUdUWHdrQjdL?=
 =?utf-8?B?cytjblBpMWNXeFA2T0M1eTNNMFlWbVBxdG81VnA5eW44K3gybW1JRkliME4r?=
 =?utf-8?B?OGV4V1VwTFhVTGJHeHBoNElPQ3psekNXa1dYbDB5bTl6YkRXcjE5SjVxVzkx?=
 =?utf-8?B?K0wvelZqUTI0cEU1bXRrNXNzVTlzeWlaSjVtaHNUNEt4ZE5ta0paaVdaeVRs?=
 =?utf-8?B?V01jWWNCeWtNcHZlN1JSb0orSlVRQ1EwQ1FxMXdRK2krK2tlT3VoNDRBVVVV?=
 =?utf-8?B?MWlENXFITGJhSy8yWnVPNUMxKytPMmczVlFvd2NPaHJmakFFRXNzbTRlTFpW?=
 =?utf-8?B?bytJNjROaDhMKzVlSkhsT2FYSnZXeGJERkZYNlZXdiswOVFHUk1rZlNGNmpO?=
 =?utf-8?B?aFBRVnlYQW5lZjZsNVNTcUVUQWxqcmUxOW83RnJwMWd2VUp2cktPdmo1Z2FI?=
 =?utf-8?B?bytPUUtYV00wN0xOSVkvZzZBQnc0SkZweFluYkpGdG1mTFlCc3NmYmRia1N6?=
 =?utf-8?B?blFCbHZhWTAyMjFSVk1iQS92V2VnUlhuRVFjY0xVcnhTbFhWYUt5dVlHUnRs?=
 =?utf-8?B?RXI1MlpjbVlZcHErSVFMRDFLMVJETy9xTUJBSGtENkIvK1JLOEhpYjUxV2xF?=
 =?utf-8?B?bVhnS0tYWjNaTVdicTd2Qm5odmpCeTRzekJVSGtOQkNhRDhyWnVJSWM0a1Rk?=
 =?utf-8?B?b3JubnFSdklnRTdFdU5GeHFKRjZLU3FoajI3RmZGWlBuVk5DK2RzNVcrNkcw?=
 =?utf-8?B?ZUE0TlVPQ3p4S0lTZG9BcTlBaGYvbVovWmErem1TdTlkME9tV3oxbDNwamNJ?=
 =?utf-8?B?NFhCb2owVFpuYkdCdGh6Vk1EamNNYVZEWGp2N0NjaTJQVklJTEhhb3U3clZl?=
 =?utf-8?B?Y3l3TzB3a3VmeHJTbjYyaDV1ZWtyQUt2KzBRSFhxN1RBNjZrYmYwUHBCOFZG?=
 =?utf-8?B?SjhlaDVwcFRjak9EUFdIbHRjcDViYUxkMWtneklSUDNXQ3VDRWlVR0l2L1dI?=
 =?utf-8?B?L1BWczJLUzNJck5seVlGSmlFUW9FWmMxT3lDSlhpMFQrWHNhbkdtNndwTm5r?=
 =?utf-8?B?MEFxNlFEMHA1RDlZVGM3bG9nSEZHeEw1U0l3aGZwQlRad1pxOVdNS1dPVVNI?=
 =?utf-8?B?c2NtUFJLVDYxbzZlY0sreDhBUm93amtoQTM1UlU2Y3hsc0Z0MFRyaVE0Skdt?=
 =?utf-8?B?U2V5WVZ5enM3MWY5R1RtNEEvZ2U1RlJxckExRTl1Vm9OV1VkQ3I2TXFXdTlV?=
 =?utf-8?B?SWZoYnA3NHIwVmF6OWhadi9HMTUzVTkwQ28wbnBuRmhhVVM5TmR5WEgxemc0?=
 =?utf-8?B?TCtkMmNNTERXTWpXRnRjdHg5R1NJaVdIZ3JzZWVxTUsrVDBZRWJRVFpMaHRw?=
 =?utf-8?B?czVMTnJEeWY2b2ZxOWdReHpCRGQ1T0srSUhqUHVCRmJjRWdXNWsxanNxWUtk?=
 =?utf-8?B?TUJQaEM2MFNJbVRBNklRMFhNVDFQU0dlTHlYZW5GcDhYbU8yNTVkaDNySGo2?=
 =?utf-8?B?Vm5OakhwRTBVT2ZqbXVXMnBJd2pjMjQzMnpaRXR0R1p2NVc2enk1R01JWTN6?=
 =?utf-8?B?RjZqdUN4S3VCV0c0NGJMZGU0UGIxakw0VjFkSmZkalY1ZWZldDZIbmRKQU5T?=
 =?utf-8?B?alg2VWpaY09EaHA3bUk0M1pYTVB1SGlGMVo0MC9UMzI4QWtlbFR0RUF6ajBz?=
 =?utf-8?B?Y2JKUG5LcFZrSkF6eldZRVZrZWF2MHU4VERWNS82Z3ZSOCsyYlI3WkVvVUdT?=
 =?utf-8?B?OThCcXFCVUZiREhxZzVyOWJ6UkV2OWVtZEFiUEtCaFo1TkxiZ2ZOdnJMNTg3?=
 =?utf-8?B?dUVlbGlFc0tFYjBTUU9vTEFRYWtIK0dkRFFXNTRGb0UzeklMVlhZRkVhVy9C?=
 =?utf-8?Q?aPMqP3EOFS+GMfr8=3D?=
X-Exchange-RoutingPolicyChecked: yXJrmymt9hNSlpIwiZXYV7RzDwAmxHweZ+4CjmFLczerLvoygpRLwjCilesx5UalAOpzTnEi/d338qFBB/gv5dHHdY+dr194SbzEzt3jGZZbEJcxnzYXtDvbNtJ01em3DFSUJGb+ZqkMdC/6xAo8MrwQGKwpUD2ch+ujK8c+3Ov5TJo1oXnkKcMok7fWZzzRgPvPcbJibMi7+hMy9YS5Uv3RZeRFTmZN8VbVIaQM2B9cXzaPx8ksDrckVHTj4FAEYxumO+t226gcTX2EWAs7fSzb+DnTSz0yJCLS12TtJDxmugT9AZ8hgWFDgDnyJ0IURXQEqiEWftj8GHIUMZyZYA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a14adb42-7b52-45ab-2a4c-08df43c65a49
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 09:45:30.8230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7M6uZ0FuEyNUZADfUZ89xqTXQv79vB4OwyplKCDoZsS4EPjYKfUyZ2hQLdBkeBHQMD+kOvcUZHnlSwsKZ69KOOMYc1sCqj/p/QzMVq/HZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PPFED21B01E3
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

This series separates VRAM regions, which own physical resources, from
VRAM pools, which represent allocation domains within those regions.
A region can then be split into hard partitions for different purposes
without requiring each allocation path to manage the physical range
directly.

Each pool is backed by its own buddy allocator. BO creation and
migration resolve the pool for an allocation consistently, and pool
placement narrows caller-provided ranges while rejecting fixed placements
that do not intersect the pool. VRAM usage and CPU-visible memory
accounting are tracked per partition, and the PF reports free memory
from the pool backing VF LMEM.

The series introduces the partition and pool types, routes allocations
through pools, adds region splitting, and includes KUnit coverage for
manager partitioning, accounting, pool setup, splitting, and TTM
placement.

Normal initialization still uses one pool spanning each region’s usable
range, so the new abstraction does not yet change allocation policy.
The series also makes the VRAM manager handle lpfn == 0 according
to TTM’s unbounded-range semantics.

v3 -> v4:
 - Guard the KUnit test includes with IS_BUILTIN() instead of
   IS_ENABLED(), so that the test suites are not built into xe.ko when
   the KUnit tests are built as a module (Sashiko).
 - Rebase on current drm-tip
v2 -> v3:
 - Place fixed placements in the pool covering their address instead of
   the pool serving their purpose, so that e.g. the BIOS framebuffer
   takeover keeps working once a kernel pool is carved out (Sashiko).
 - Assert that a kernel BO with a fixed address does not land outside
   the kernel pool on a PF without LMTT, where VFs could reach it.
 - Add xe_vram_region_addr_to_pool() and KUnit coverage for it.
 - Rebase on current drm-tip
v1 -> v2:
 - Fix NULL pointer dereferences of the tile VRAM pool on integrated
   GPUs in the page fault path, tile asserts and debugfs (Sashiko).

Cc: Matthew Brost <matthew.brost@intel.com>

Piotr Piórkowski (7):
  drm/xe: Define partitioned VRAM manager types
  drm/xe: Define VRAM regions and pools
  drm/xe/vram: Make VRAM pools the allocation handle
  drm/xe/ttm: Back each VRAM pool with its own buddy allocator
  drm/xe/vram: Allow splitting a region into pools
  drm/xe/kunit: Test partitioned VRAM manager
  drm/xe/kunit: Test VRAM pool allocation

 drivers/gpu/drm/xe/display/xe_fb_pin.c        |   2 +-
 drivers/gpu/drm/xe/display/xe_initial_plane.c |   2 +-
 drivers/gpu/drm/xe/display/xe_panic.c         |   4 +-
 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    |   8 +-
 drivers/gpu/drm/xe/tests/xe_ttm_vram_mgr.c    | 147 +++++++
 drivers/gpu/drm/xe/tests/xe_vram.c            | 177 ++++++++
 drivers/gpu/drm/xe/xe_assert.h                |   3 +-
 drivers/gpu/drm/xe/xe_bo.c                    | 102 +++--
 drivers/gpu/drm/xe/xe_bo.h                    |   2 +-
 drivers/gpu/drm/xe/xe_debugfs.c               |   3 +-
 drivers/gpu/drm/xe/xe_device.c                |   2 +-
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   7 +-
 drivers/gpu/drm/xe/xe_migrate.c               |   2 +-
 drivers/gpu/drm/xe/xe_pagefault.c             |   3 +-
 drivers/gpu/drm/xe/xe_query.c                 |  27 +-
 drivers/gpu/drm/xe/xe_res_cursor.h            |  45 +-
 drivers/gpu/drm/xe/xe_svm.c                   |  18 +-
 drivers/gpu/drm/xe/xe_tile.c                  |  22 +-
 drivers/gpu/drm/xe/xe_tile.h                  |   6 +-
 drivers/gpu/drm/xe/xe_tile_debugfs.c          |   4 +-
 drivers/gpu/drm/xe/xe_tile_types.h            |   8 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |   2 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          | 398 ++++++++++++++----
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h          |  54 ++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h    |  48 ++-
 drivers/gpu/drm/xe/xe_vram.c                  | 296 ++++++++++++-
 drivers/gpu/drm/xe/xe_vram.h                  |  16 +-
 drivers/gpu/drm/xe/xe_vram_types.h            | 159 ++++++-
 29 files changed, 1338 insertions(+), 231 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_ttm_vram_mgr.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_vram.c

-- 
2.34.1

