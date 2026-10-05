Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E85CA5FFD
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 09:30:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F14F910EC4F;
	Mon,  5 Oct 2026 09:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lCbD5gO4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A14F10EC3B
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 09:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791192640; x=1822728640;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=gQ2Rrr5udW8fX9aBtdnBqT17df73mJT5L4GHpMm90fg=;
 b=lCbD5gO4Idzg3sTJAs3Q849QiLGnH+qsYXIR+I9r0pWIFhMG62ZAFKgi
 Q7FDMLzj8Qpz+NK6QG//jNcaeLgKZDvXKiYejPriib51+bNu3FB1v46l9
 y5JqSBdkD8A+UVucqfTQgm8RDfY4sQP3IM+5OvPIIlJ2f9qzU/DIG0Ca7
 JlPFFqhwmJs1d5i9lZZx4sJ7iWrt5/dDYHnL1rOPrrKz60IlK7VSPUXBZ
 oEDI6vCG9w3A0NPCZoFIp4JZDV4355Rm76lH8G3WW0ayvAOGaPvePybv6
 1WUblRIQzjJb7Wu1F0f5APWYDzqeI868/KBk8WjT6HOwCWSAfhg4J7pE6 w==;
X-CSE-ConnectionGUID: IbFObSKHRAewtlbtbU9YJQ==
X-CSE-MsgGUID: FHRcFtIRT7qR8kSfXCe5eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="90915997"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="90915997"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 02:30:40 -0700
X-CSE-ConnectionGUID: z6orF4HKQoi0gYOJNWiJew==
X-CSE-MsgGUID: EneSLqoTSfSDqhoXXCFH0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="284852506"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 02:30:39 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 02:30:38 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 02:30:38 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.14)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 02:30:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lt0ofGrrIREusinC25Tcdxfs3TOnR1LZo8sl8PhTUOIZf5HyHA401IczyW480MqQAkk2cZpQU29m2wZ70I21K1AOSTqUCv0kCnZ6tY5cjUJZTsjj2UsG6Wm/czALMXvP8eqxbR9VLTAhMJRzldPNK+DWGncz4jLm89d82laakDAqRYxO7j7z6hN+BTTOuKoTJa8KZFgbrOk+7ZbWVC7TR6BuauIU6QPDq8QzQ5V6S+luBdPfLFzU8W9LAG/qVOxuEPo3WZUc05n+DdNdaL+O6NeGBguLZH7YvEpwGeWIUPYQyLsKkb35D97ZJKXENYcMMbA4ivCxabRYZs6zBv29XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LPbf14er5RwvqwVeQoOi105ZGitmsQkfwIaobUnRhtk=;
 b=cOXVXmMaZ2k6JYUvzuZBkzEMdjKXagu/USLXp0CJD+xcodPvoBla7+KYj+1L/5i1n44uOpE3i9VpkqWSCuqGwE28rIXNabFnz+VyBS3bVKnFLIhmZzynN+KJke0ctnVdfeUGQ3D61SPfkiNTxs0jf8pSMuOkRfGrLmCqDXJe5Oz0JdnGddxSY5xKviA6MdqXdUMmLHy7Gvryn7wpY6M8mWpNdf9wCgx5InZdZoU3TJ+Ea9Ugln9abNBWzZ19ja3IdXAFhyY6jwHdcxN4B3ClmuWCnk8gN1pfZndI2x0L7lm7rlqoGSy7VkI62YHzr6s6y+1rQjpPVEsIiutvq/IOzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SA3PR11MB662844.namprd11.prod.outlook.com (2603:10b6:806:538::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 09:30:32 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0451.022; Mon, 5 Oct 2026
 09:30:32 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>
Subject: [PATCH v2 0/7] Introduce purpose-specific VRAM pools
Date: Mon, 5 Oct 2026 11:30:14 +0200
Message-ID: <20261005093021.3741599-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL0P290CA0001.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::15) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SA3PR11MB662844:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f7a87a8-daba-4419-0f51-08df22c34d41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|6133799003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 9BCyoELpy7uGggFHzWANlszwcXueVrnWe8AELfIpKwrBSlhsNNohQursdVNa7O9cmDYTwRGJvAv/80MyAUaN7nSt6/38Q/WRy6dVU81IBct+vlWyrceNG++h46WYVb0RjYnmb8X8gRgPmx8EmOtdrz3OFjVa7l+A/Q/lic80PVWHwPrm+PsucqGA+dLqb6C1VrBpgsRYKJdN3qHuydJwv4/Ntw0uUxC/DyiCE2XP3kxzUI3qQLp/qGJxI9fKpTR4sFwzjWxHjHPtOxg7X+5sbobTolriCuiOZ8+xtzloyfYxruq+MNhwxfoXMsWIfMAVog4jtQREq8x5q4Bfl1Px54/+hYQmaCnN6mI0u6Lr6MzKYy+xgJ4Y5WmArvZJjMDXo4xPrnoOeIPy0gHlZVWj4Oe7ect3/cEbFKt/yJIxpqLTia9wCLqQDbanZCSxxOnZiRUVjgqeMifO/Cv+iGaZWBviSMTLZep3f3QoMC6vEssOMIeNErZP/hOn862gW7Ngm+ZJSIVsnWZDPYNiNmpD53E/QbU/pEr4juKXjNMxOEkqdmAz4eZ7VhGZzWeRdgXJcfxbzHx0HIDKedW83njsnFngzJLedtCUM0XReq/62Qtfsc5svDnI/8ogfJ2oqPgcmAZkL2k0wXrZTIjaeS0ocYMbPELWG9DXRYibKPheAFg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(6133799003)(11063799006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SklRWHIreGZ3enMzVkxIQWZrYmRVdFhMNzYrbmRsSEE2bXlFTlZjRzlBbXcr?=
 =?utf-8?B?dktjMHpBaE5LR1g3ZHYvYVVzMTVmMnloRFBuRGV5WTFxK25yd3ZvVU1XME9t?=
 =?utf-8?B?RE04cnB4S05ocXFBVHBqUXJxankxSFo2TFRCWG5BVVE3YU5yWWFUMklYQlVP?=
 =?utf-8?B?U1B3RHRUN2lBbm8xS1UxRlpCaDBKdnEwRTZETVlTdUhqb0tPdmlwdDFOVUE1?=
 =?utf-8?B?dS9mbCtNOEhpSUQ1OVBNbnF1NWp2OEV3OFY3ZTI1eHVrdkwwbzN3SjBKLy83?=
 =?utf-8?B?ZS9vanUwVGlEWitObEw3eDM4Z21Ibm56ODlDVDZoellqMm9iK3ZuSzg2SzNK?=
 =?utf-8?B?NGx0RmhJTm0ySTNwdkt0d1c5S3AvdWRzcDNCWll0cnhqYjZWeTZOZmNJUG03?=
 =?utf-8?B?azFldHoyWDhxU0FwUnNOVHZ6VFlueURKbS9LRVJqTnhwKzNCaUZIYzFkaGpx?=
 =?utf-8?B?SnBaR2N4aGx0c2VIbk91NWxJVUZ4WGViVnFCaXJZcUZ4bHo3bkJweGJoMDZI?=
 =?utf-8?B?dGtWNVN2c1l4Y2QxZjgvQ3FoQ0R3WVgxZTBqTFVHcG1TSW55cWkxcnBIRHA1?=
 =?utf-8?B?Yi8yVnVyZHJzVlhvR291d2N6YVBtaWtySzc3NC9yajliWm1BUXJ3UXpTanlw?=
 =?utf-8?B?T2ZvenhRaVYxbjRwMXFoZDV2UTdiYkJhY0VOUjFSbFZWMDJIa3VSNnhKSG0z?=
 =?utf-8?B?N3JOOTk0Y1VuQTMxNEtFRytuR2Z0ZDRHWXZSOVgzbVNHZlFKK01HWnpEVWJE?=
 =?utf-8?B?RTdYQ0VOMU1KS0JZTXBpQWRTMWlBUVZEZGdBN0JXUmJFM3cxRCtBV1ppcGkw?=
 =?utf-8?B?a3MyYW9ZL3dmak5ZUWVveS95TUw0MVdRNTI5ZlRYSzY3dk45OUlCekNZaCtt?=
 =?utf-8?B?dXplYnhxajZwQW9PR2krUTRESGVzUXJPNVc0bGJOcGRIQ0xvc3J2YlovNGVo?=
 =?utf-8?B?aTdBQnlBY0cxMGljS3BhbmU2TnY2OWJFdzZpZ1J1TzBpVGVONFFVTGVwQkZv?=
 =?utf-8?B?SjJYVWpIMHNjeGtoUG84ZVVNcG9heW9ORG9iKzVnME5TUC9RZm5NTzhkdUc4?=
 =?utf-8?B?cVBEWTZ4eGU4Y2puMnNiY0ExL05MZStJbE01dGZyUlJmVkdKNm1HdW1taEFG?=
 =?utf-8?B?NGt4a05wQmx1bE81bVUyQ0dIdHg4UERmWkNDZXJwZGowV3hLUnAyL2JqK0RT?=
 =?utf-8?B?Qzd0V3JtTCtDUVlnQk5ud2FLancrMzZINVZ1bE41MVdrUUF4anNrVXNQTHNs?=
 =?utf-8?B?NW1ZZnlEZSt2a2g5WWxKT0RaZTVGMEdReXNUVW0zcHpHbFc1bTQzSm1LZC9L?=
 =?utf-8?B?N292WjFyMHRoNGpaQ0hiMUM3YWdCL09zclhlUzJEUVdBTGJjaVdtYXBZQ0lX?=
 =?utf-8?B?SG5lKzlpcExJcTUyU1hJRVoyTHUxWkprQSt6c29xNTc0VUNWUGZlRklEcmkz?=
 =?utf-8?B?TXkvYXhLMU4yRlk0YzkzS29PekxXblJuWGk3UVdyaHh4SzdNbzdRdi8yVjRN?=
 =?utf-8?B?YTVKb0RCWE9oK3FlaGlqT0FLd3loVFh4WWFRUFlKckwyUWhNek1nM293bmh6?=
 =?utf-8?B?V2xJclhpSkpFSlEvWnJsT2tPa05FM2RMMEsrcmpSVG5NaE91TEdXRXBRQ1Z4?=
 =?utf-8?B?ZmQ0SjlCMHhhTWtqSXUrVXdaSU9lMUliT1ZyTHRMWnpxbEJpQWVtTzlhOG5p?=
 =?utf-8?B?QzJWbEhiVW1tZytWMDRJTUpzVzBMUEdnQXRxcnVsN0RNZi8wN1YzV3Vha0lO?=
 =?utf-8?B?eTN2L3JRUEkvU2JPSldmZmdnUXRSSHpibXdGV3UyZGcxNStCYjREamNiV2Fq?=
 =?utf-8?B?LzdRa2VMRU1STEIrSlFvT1R3SVFZaEYvM0c4MVh0Q0xGekZKdHhsTURPN29i?=
 =?utf-8?B?dUVTSjg0cGV1Ykh4TFFFNld3b0N3ZUt2VVpjOElhWFVBbFlFSG5nTzJubTlC?=
 =?utf-8?B?anlUUVBsQmNLcmRiczR4ZmpQalJhRGJNMVpVOFR6YndNUmU5QVNVdlliS2Zx?=
 =?utf-8?B?SXVveCs4cDNLZ1NPSGFzYXZlZG5IZTZqNFl6eEtodEJlMGdiS2RXeGhsR2tN?=
 =?utf-8?B?ZmxDd1l2OFJMU1BIWXdSeUNhUDd5amp6NzFwWm9sVkZ5L1hMNTZyMU5ibDA4?=
 =?utf-8?B?bFZHRmVtbG4weWYzSjVPNCtKSGxVMUN6R3dqalJFTTZ0Q3pYTHF2dTJRa01K?=
 =?utf-8?B?L081WDQ0QUVmUTdZTkR4UVZrbmlZd2pIV1A1YUJxUHpnTnd4Q3dhVHhyV3dJ?=
 =?utf-8?B?YUZYWERmeTQza3dKTGo3MWwyVExZL2ZTVnlPcitlcW03R2VsZExCZzRzK3ZS?=
 =?utf-8?B?S0FQd2drR0dRcitQdkhTMENuVTRPR3FmOVhoSG5DMVVxYkFnWGVVaTJUQjcx?=
 =?utf-8?Q?hs9SKD2R+vIAnJN4=3D?=
X-Exchange-RoutingPolicyChecked: bjJcaBHmEPNWd+twBcThrGp62UpDbUloMun/Mg52T6cXxbCKwwnpqMhjzr4J8jMNx+AIZ9l/zyyZpSv0MmGcT//OLogESBQ7IuQx81pRT9WYzr3BG4lCK6sPtlAsgpyNOGrPVvK43k86KjkEQEHsGTcNC7O2rzJ4IWxBZePrmn/qFu2f0ued2NXf/OwuGqbGMqTJSI8ZjjaJqpFybOlNh2gSHaxFJx5X95jOHOJNhNrUAKqisgU5smL9otav5hRGPUW8NByJ8bYnzhexEhfHh6JHxxvdzbflraawQy2asWvNvWWc0LgdBmLIWSmfz/YPhqPwCgLmKG5b3nVVC6fXPA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f7a87a8-daba-4419-0f51-08df22c34d41
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 09:30:32.1366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aV9U7T1W8uwzID9eQNXgEEAE1EiJqPn/V/IYjym9U2fWRG6nd6aDs8Z6yQYS+AmwvP0vevENdtU0HMsfxr4j9DRbN4CehuznVT6xksMs5d4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB662844
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
 drivers/gpu/drm/xe/tests/xe_vram.c            | 155 +++++++
 drivers/gpu/drm/xe/xe_assert.h                |   3 +-
 drivers/gpu/drm/xe/xe_bo.c                    |  86 ++--
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
 drivers/gpu/drm/xe/xe_vram.c                  | 271 +++++++++++-
 drivers/gpu/drm/xe/xe_vram.h                  |  15 +-
 drivers/gpu/drm/xe/xe_vram_types.h            | 159 ++++++-
 29 files changed, 1274 insertions(+), 231 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_ttm_vram_mgr.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_vram.c

-- 
2.34.1

