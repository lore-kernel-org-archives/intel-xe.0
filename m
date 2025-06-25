Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A860C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 15:02:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E25410E756;
	Wed, 25 Jun 2025 15:02:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GOApQsfU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B4BD10E752
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 15:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750863729; x=1782399729;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ovs9MaqHxjAOFWxBhtdgyUR0eVbujd2KxEyn0RrYbF8=;
 b=GOApQsfUxGOwtg7YscgLlW+YJ5+rIuBeUXBP+zpAvgauBRqzROQaJwK1
 70GYltgRO+MHk3Ch8tJJbZQwouFh6bfPKoLjL9PfpkCuWyDrW/dSUAsj0
 s1l4RpoPdiFPyf10BcFFpb3EdG8wq/pDbeTg75Y+Dot/EX+wfaTPIaopR
 Q8Bef5Q1FI2hVS4xmltYA7K3nsAlXCYY9fQ55mGIoxez6iZHZxe+pmYj0
 VLpg5wtPsurPuuD+vuyGonYNQWDBchUSmvgHP8xp1chYXKQXMqfIq+Wa2
 5v+yGD5SwpJ/FK0GNcHkwz1pFfYkKfNuHeBZdeeUdzzwGycnoTI7bjyD3 A==;
X-CSE-ConnectionGUID: lsgjhYC1Squ/26b4rUVLMQ==
X-CSE-MsgGUID: 5KEFPetDSgCPt22J4aLYaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="52366018"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="52366018"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 08:02:09 -0700
X-CSE-ConnectionGUID: c7XYTTWORRKY7jT6MD3Svw==
X-CSE-MsgGUID: SA2qmCj+Qku9fG5RrK8NzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="151858590"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 08:02:09 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 08:02:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 08:02:08 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 08:02:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aw0SAzPIqVDYuBUGONT0Z28E5a9kV0l6drpS4cLBP2n900DA6V2hrCKfmIJAMgSdMXjMFh1WzmWJeBl5L6EiTVjTdOEzZEpG2vBjrZ9M97li86K3mIG1ZJq68o1vCU4uW6nKsDraeMtfPxFjtLJ4vScYOq4ctUGe83L/IdUUpBu0xAR9qrm9NLJBBw3ShhdGHzOP0vIv2iaLYDdOHRGww6vH/hxMNWKlDBKgVSXjA6BF7Q04O22YBFNxkBQZZ15EkgqgtFCw9WiUdfmYNtOjgjHNVLEPmqpSL2WbbXLQjbEaR43CwdZRWxvtHP0c1xGHrhnMYoJc/D47w8+iUK8lRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLeXHQxIDgIm6CVtwSbPjj5A+ftnWpmv2lDohX08zs8=;
 b=k37KSXa4eIouJQSe5/IXhgjL/9p1NNP0Zg4NyUkb7y758gIDkLaJY+1G5Bhbq1+sfyO+WwCwEUZj/wIiNKwB7diu8YGkBrMCdxaPpV16TJSha30r3vT98GKPxzryLg+wzpFd62pZ5knVu6XCkpUxz/QNgd/NMKE057iw1OUYZwGAKo+rbF+xajVhi2WA1buGO+luFu4oWUR9RFl9KOp/moNGRPcJTFh0dJVHqXrokVptsIXDfti4scqSt8hWF1dNMx+sIp+jSBG2ZgHf3xC2a+17GAYpXNKiKn06m3s/p5IakmyufYx0RsazqUvuXRcfI+r93J9UVvsLUJypySAnbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by IA4PR11MB9130.namprd11.prod.outlook.com (2603:10b6:208:56c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Wed, 25 Jun
 2025 15:01:42 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Wed, 25 Jun 2025
 15:01:42 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Jani
 Nikula" <jani.nikula@intel.com>
Subject: [PATCH v5 3/4] drm/xe: Move struct xe_vram_region to a dedicated
 header
Date: Wed, 25 Jun 2025 17:01:15 +0200
Message-ID: <20250625150116.3166615-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625150116.3166615-1-piotr.piorkowski@intel.com>
References: <20250625150116.3166615-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZP191CA0012.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f9::6) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|IA4PR11MB9130:EE_
X-MS-Office365-Filtering-Correlation-Id: c38a3691-328a-4f43-4da6-08ddb3f931c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STQvMXRsYkEzZm9Dc3dEV1ZNZUwycnpjTzJETUR2SEhraTRNc04vYTByUjlN?=
 =?utf-8?B?dUtFOEg5aHd5QzduaTFCRzVzV3l6eWxGMy9GVmNUUE5EN0xnV2t3cFUvbzR0?=
 =?utf-8?B?T0RMMGl4cExlK0lwZTFDVVd3N015Qm9nZ3c4ZVQxazdEQ1ZwT3dkTWg1dUYv?=
 =?utf-8?B?V2pDWE55Ly9idi93UzVlRHQ0aEZTK2dLQmw1WDhuNjBEVDl4Nmd6R094KzlC?=
 =?utf-8?B?Y2FEa2lJem9SRDZzRnY4WHFMSzc3Y2lObVNGRFRLZkJxSlMrUWRscG9sdXVn?=
 =?utf-8?B?bkVPUE5abXJ1TFErR09pd0ZOQWpxTmMzdWpqTFJSY1ZENzIvRm1yTEFMQjhG?=
 =?utf-8?B?cHZZczdsNThCenNzMUt1YXB3S3ZxdVgzOHVmQ3dsRFhjWVR0UmJKY243QWlm?=
 =?utf-8?B?VFdiVTM2Y3ZaMlFmRzFSbVBVdS9xeDV5R0l2aWd1RXo2Rk1uSFliNzdtbGZa?=
 =?utf-8?B?T1UvRG1xSVhVbjVORjFOQ1Z0c0xrTzJmSUhoYXZydEJvemtUeTl5cWFtSWlY?=
 =?utf-8?B?RHpPbjJybVQwYXF5S0trNzRVVmFjR0tPTDJVaUdXV011MTJRc0F6Q0Z1cG9C?=
 =?utf-8?B?ZFF5U25CNGZyUkxKd1dnZ2N1bXVQZmI2Ny9Jbzh4bGF2YzJHd2tUbUZlTVIw?=
 =?utf-8?B?R1pUSTJGTmtQeVNGTkdyZk0xdHl3aWR5dHd6cTVUYSs4UzRGb3BNWDRMdVZF?=
 =?utf-8?B?cUNCNkdUWDVxdi8yWDREa1p3RmpjWmlkYy9tSUZibm44S3dwNUtUaUpBOXNp?=
 =?utf-8?B?b2ZBdDBhTUhweFh6SzlIYzFGMXppNllQb3BIbTBrajc0ZzNYQU5NaVBiMUZ3?=
 =?utf-8?B?Q3RrS2RQOGtYQ1V2bGZLdUw4R0dMbWtRaE91T2tMaS9pYXNUaHlvWVF2VWk1?=
 =?utf-8?B?d3FsdWlTc1g1T1pCSDBpbzhuVVRLTmY3Z2drMFpFNHBMRFJrUXVwOE53SzBy?=
 =?utf-8?B?enBVVzJiME5PUWx5Z1F2SlozdFBhai9WamFKU1RYQm5pMVVPZXVLZExvRS9N?=
 =?utf-8?B?emJ2d0hnYzFWQkNkNXJXcDY0MFk0K3EwUDNqK256NTdMeVZTeWFyNGpuOG5y?=
 =?utf-8?B?WXlnUG94WUNoMll4OXRlaFZGTFh2Q3Bwd3hoN0QyS21XMGI2UkhqYVdrdVRH?=
 =?utf-8?B?SzhNTXR6VFVVVFhzSE8wUmJ2U3BQYkJveHhHQW1aSkxjVTNrNjVoZmRVRy92?=
 =?utf-8?B?ZDEvZlJlUU1PcCtPRGxzZHhtclpsNytQa0NLaklMQVlHS0lrcGlaT2dHVnFi?=
 =?utf-8?B?UmRTT2NLRHM5MVBOK29sU3p1RzlLbkZhR3J4T0RiUmtKa3ZPa1pjM21lb2FR?=
 =?utf-8?B?dkRYR1JDeGJMRW5SbmNpbzR1ei93MWxJWDl3NzdGb3FlU21DUFB2UlB0S1Nv?=
 =?utf-8?B?WHFIcE5mWG9PdmtOMnNxdmJDOUlmMXRMT1M3Q0NuQ05oUUxKWmNRK1k2NGk1?=
 =?utf-8?B?b1hYRVFtVTlnb0czTCtIdFdDdGIrdVIyL3BxWlBZUkc2UktrYTVFQktGMmx4?=
 =?utf-8?B?VE9PZVdzckhkeWxoTzFtMEdYS0lSYlZZUG9LTnRlbXZMT0QvenY4L1NkbFhz?=
 =?utf-8?B?SURQOTBiTFJ1OUp5cEhoeGd2QnY1YWp0UzlPQTRDR2lGWlZ1b3UrVHdqOG1k?=
 =?utf-8?B?eFpXUDlJOHA2R05Rd2M2Q0x1OEIwS0VzWVBRRG9aOE1BSERzZjBmNGtROU1m?=
 =?utf-8?B?SWZIU1JxcmIxeklmT2ljR3BPdm5hNXhER29TNkl6cHBTNGEwV0x2OUpMNUtj?=
 =?utf-8?B?Mkk3VDBxL3JlV1pRdmZJZHdoYUFDZFREWm5ZQmY3SEU1Zkp3L3V4aU5SS2Iv?=
 =?utf-8?B?T3N5eTFDNkh4Y1JaUnV1bmlJQXZxS1ZDQnorUmVZQWhoV1JIOE1WMURTNVh6?=
 =?utf-8?B?MXJURVlzOVFyY2oxRmowbkZFSTRjdExqbEI1TkJWWEVtN1JkcHpuNUV2T3Nj?=
 =?utf-8?Q?kvlyML8P9Zs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elgrTWFvYXk3VGJpRU5iaEdZYm05TFpvc3RsS2JNRHRjSjlkcENsbEZRamhl?=
 =?utf-8?B?a3BzSGx1MHQ3bkxoZ0RBc251alJhdWFGYzZKK2g4Rm13UmpmN0tuQnhKR1Ix?=
 =?utf-8?B?R09oTFBoWTcxdDNybXdidEJHWWFrV1Vxa3UzRVMvUDB2TE55MzV5d0NLQURW?=
 =?utf-8?B?NFlYcTRWOXg0aWNVYU1JRVlGUno5TmROc2VqRitveGdFN3VFMkk4NTF4RGFT?=
 =?utf-8?B?UWMycmxjS2FhWFVWTDJMRGJQMFVxUHppbVFHUFBiNVlSY1Y3V3d3c3lITXhz?=
 =?utf-8?B?YlR5OUl1elBabGhQT2NrQnhqZ280dkhKeGRyaEFEUEI1QVpRRWI2NkphTVdl?=
 =?utf-8?B?U2hPY3JiZWpKTkNhWWV5M0ZJaXpqWEY2Qnc2TkRBSXNPSC9aQ3dMck1MYVY4?=
 =?utf-8?B?RE1BeU02aDBJeWQ2cXE5MnpMZmhKU3JNQTY1NnJJQkZNN24yWkpzNCtNajlj?=
 =?utf-8?B?eFRzVnp5blk4ZER5dGlpRUdmMGtYeHdTODE5V0hXRDFHN3RRQyt5bEhpT0hY?=
 =?utf-8?B?Kzh4SVdNaFp0aXNCSmZZWWpwQitCM05IbDI2Y0Y1d3J5U0c5eFFwWmhRR0tT?=
 =?utf-8?B?QzJ5QlpxSDlxOUJTdmRENm1yY0kyNVJtTEE1NEZwMlBrSmVTWXFzdXlweXJh?=
 =?utf-8?B?TytyM1JJK05pR3UvdmJ0NUEzTmFsTGJWU3Nxc3FGR0c0WjI0V3VlaEVOZ1Fy?=
 =?utf-8?B?K25PVG9pOWdDVngyUjVJdU9COGpSemQ5TjZzY1pkeFhJeHpZTkNmUUsxTXl3?=
 =?utf-8?B?YzJsdWZGZ1dYb2FYOXVDK09GWHZiR1hFdlRYcWhjU3N5Ty85MEs2L3Avd3Vx?=
 =?utf-8?B?aDFCdWk3RlhJNENEejMrMDNNelQrNXJ1NGMyMWFPZE1CTnE1Q243cUN4ZSs0?=
 =?utf-8?B?UkVYZlBva1dOY0lNNll6L0dRQUY0MFpvQXFoQ2xXeEtiT3BockRSTVhCbjcy?=
 =?utf-8?B?eE9CQWpndW1zUEZONnJUNXV5WVlBcXZNZjhRWTNvUXNmbWw3RGNGTStXQUpi?=
 =?utf-8?B?cWprTmhLZTFGUWI0NldMOTNCL3hsVEVTMnlmOFNMVno3RU42cUFCWWtWVzVF?=
 =?utf-8?B?SmFXdldkcnhKVXlubmV3RkJFY0VNNE8wR3ZQVWNVN2duS3JjS09DcEk3bnNu?=
 =?utf-8?B?cXpKcFpwamprOHk1T3NZdWVpNlNIOVBSUFVLWVZOZGkxNVNaV2pCcmxiSXpw?=
 =?utf-8?B?QWllUU1oT2xSWGFWa2lJMkZ0Q3BjZnBLNTJ3OEVxZzRuM0R2OENLZmdMVDZH?=
 =?utf-8?B?bDVGUVJ1b2ZYbjBacTM5aTllVzBxcmUzT2tOQUdEWVMvVEttUGQ1RGRQdjdB?=
 =?utf-8?B?OTZnTnVyTXAyb1hUSzdIazhpaVovU3FJL1BIMG1USU1RK1JOV3hJVld6MW5R?=
 =?utf-8?B?c09yNHYyR01nZ2J3aGFiWUNyZmFiWTF2TmNwc093Tm5UTytUL0ZJWDlSbEdB?=
 =?utf-8?B?U3UrRklzcStqVVpBY1FqdmNZUHJ6RFVGTlJsZWErSldZQlpxcDVwT2I0MzNG?=
 =?utf-8?B?dUliOHhBZlAvakNlN2tWOGRid0hyZUFhemZPZk9ZMWNkTWtQTExxNmlqcXpo?=
 =?utf-8?B?WXdOdnNmZ2VVWXRwME1SNWs0SytEZ0VCc05HYVZqcVRFb3ErWlhWYnVTcWpW?=
 =?utf-8?B?aUlTcld0ek9sSjdTNEo1dTNTQTZ1MkFsTnhzTTJ3UmFZaXlzVWd4UytHYkh1?=
 =?utf-8?B?Rk50TU1xMkx5b09QanlDM0dJeEdZclYvV29rcS95OExCU1FoUWpsZ2R0eklo?=
 =?utf-8?B?djJlbllJSjVxREhSV3hXdnZnai9iS3lwa2NVcUpJbWM4bUJEQ2xXRlZTVXIw?=
 =?utf-8?B?R3RrOWlMM3QvQlorV0hFVGJVSzU1RHBNeVY4WUZZekM2dUx2M2R4a3llNVQw?=
 =?utf-8?B?MFVZSWFPVlJZb29BZkdrTW1OL1R4ejhHR2kwMTkvMklmRmhmOXA5N2ltMnli?=
 =?utf-8?B?dlAvMTMvaXRabXZrR0lsaDFRcWROdGJaZVR3bkdZc2RnbE4zejJVNTQxQlRV?=
 =?utf-8?B?N29BcWdHUFUydFVINkdyY3FuT1o5RkpJSGNrVW55UDMrOUQ5QnBtN0NrZUlo?=
 =?utf-8?B?eEQ1YW1QWm5KVS9LbmNOK0JjdGlHTFBoaGVXcExWQW5BTVRMK1ZCVnZKZmp1?=
 =?utf-8?B?SWRaNVJmeE02MDA3VVhDMUg5cUZpTzh2MkU5T29qcUhEc2ordzMzenl5UVhZ?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c38a3691-328a-4f43-4da6-08ddb3f931c8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 15:01:42.0994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kyFzbpu28ufIECJiBGlKQQZ0OQ1fzryKZPiM6uPol4z7RLcqC0SfhF8E34H6f2wEN0rUZC1dvadgppgIM8cV+iavDp2X2bSYf1DgPMLGTNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9130
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

Let's move the xe_vram_region structure to a new header dedicated to VRAM
to improve modularity and avoid unnecessary dependencies when only
VRAM-related structures are needed.

v2: Fix build if CONFIG_DRM_XE_DEVMEM_MIRROR is enabled

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Suggested-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_assert.h             |  6 +-
 drivers/gpu/drm/xe/xe_bo.c                 |  1 +
 drivers/gpu/drm/xe/xe_device.c             |  1 +
 drivers/gpu/drm/xe/xe_device_types.h       | 60 +-----------------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  1 +
 drivers/gpu/drm/xe/xe_migrate.c            |  1 +
 drivers/gpu/drm/xe/xe_svm.c                |  1 +
 drivers/gpu/drm/xe/xe_tile.c               |  1 +
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c     |  1 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       |  1 +
 drivers/gpu/drm/xe/xe_vram.c               | 12 ++++
 drivers/gpu/drm/xe/xe_vram.h               |  4 ++
 drivers/gpu/drm/xe/xe_vram_types.h         | 74 ++++++++++++++++++++++
 13 files changed, 102 insertions(+), 62 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vram_types.h

diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
index da357dd42546..a818eaa05b7d 100644
--- a/drivers/gpu/drm/xe/xe_assert.h
+++ b/drivers/gpu/drm/xe/xe_assert.h
@@ -12,6 +12,7 @@
 
 #include "xe_gt_types.h"
 #include "xe_step.h"
+#include "xe_vram.h"
 
 /**
  * DOC: Xe Asserts
@@ -145,9 +146,8 @@
 	const struct xe_tile *__tile = (tile);							\
 	char __buf[10] __maybe_unused;								\
 	xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,			\
-		      __tile->id, ({ string_get_size(__tile->mem.vram ?				\
-						     __tile->mem.vram->actual_physical_size :	\
-						     0, 1,					\
+		      __tile->id, ({ string_get_size(						\
+				     xe_vram_region_actual_physical_size(__tile->mem.vram), 1,	\
 				     STRING_UNITS_2, __buf, sizeof(__buf)); __buf; }), ## arg);	\
 })
 
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4e39188a021a..196acffe0180 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -34,6 +34,7 @@
 #include "xe_trace_bo.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
+#include "xe_vram_types.h"
 
 const char *const xe_mem_type_to_name[TTM_NUM_MEM_TYPES]  = {
 	[XE_PL_SYSTEM] = "system",
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 86f8ca6a96e9..126faf560909 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -64,6 +64,7 @@
 #include "xe_ttm_sys_mgr.h"
 #include "xe_vm.h"
 #include "xe_vram.h"
+#include "xe_vram_types.h"
 #include "xe_vsec.h"
 #include "xe_wait_user_fence.h"
 #include "xe_wa.h"
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index a7bcda67d05f..619728bba77a 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -10,7 +10,6 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
-#include <drm/drm_pagemap.h>
 #include <drm/ttm/ttm_device.h>
 
 #include "xe_devcoredump_types.h"
@@ -24,7 +23,6 @@
 #include "xe_sriov_types.h"
 #include "xe_step_types.h"
 #include "xe_survivability_mode_types.h"
-#include "xe_ttm_vram_mgr_types.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 #define TEST_VM_OPS_ERROR
@@ -36,6 +34,7 @@ struct intel_dg_nvm_dev;
 struct xe_ggtt;
 struct xe_pat_ops;
 struct xe_pxp;
+struct xe_vram;
 
 #define XE_BO_INVALID_OFFSET	LONG_MAX
 
@@ -68,63 +67,6 @@ struct xe_pxp;
 		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
 		 struct xe_tile * : (tile__)->xe)
 
-/**
- * struct xe_vram_region - memory region structure
- * This is used to describe a memory region in xe
- * device, such as HBM memory or CXL extension memory.
- */
-struct xe_vram_region {
-	/** @tile: Backpointer to tile */
-	struct xe_tile *tile;
-	/** @io_start: IO start address of this VRAM instance */
-	resource_size_t io_start;
-	/**
-	 * @io_size: IO size of this VRAM instance
-	 *
-	 * This represents how much of this VRAM we can access
-	 * via the CPU through the VRAM BAR. This can be smaller
-	 * than @usable_size, in which case only part of VRAM is CPU
-	 * accessible (typically the first 256M). This
-	 * configuration is known as small-bar.
-	 */
-	resource_size_t io_size;
-	/** @dpa_base: This memory regions's DPA (device physical address) base */
-	resource_size_t dpa_base;
-	/**
-	 * @usable_size: usable size of VRAM
-	 *
-	 * Usable size of VRAM excluding reserved portions
-	 * (e.g stolen mem)
-	 */
-	resource_size_t usable_size;
-	/**
-	 * @actual_physical_size: Actual VRAM size
-	 *
-	 * Actual VRAM size including reserved portions
-	 * (e.g stolen mem)
-	 */
-	resource_size_t actual_physical_size;
-	/** @mapping: pointer to VRAM mappable space */
-	void __iomem *mapping;
-	/** @ttm: VRAM TTM manager */
-	struct xe_ttm_vram_mgr ttm;
-#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
-	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
-	struct dev_pagemap pagemap;
-	/**
-	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
-	 * pages of this tile.
-	 */
-	struct drm_pagemap dpagemap;
-	/**
-	 * @hpa_base: base host physical address
-	 *
-	 * This is generated when remap device memory as ZONE_DEVICE
-	 */
-	resource_size_t hpa_base;
-#endif
-};
-
 /**
  * struct xe_mmio - register mmio structure
  *
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index a33a6f3a6731..140d55ebd476 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -33,6 +33,7 @@
 #include "xe_migrate.h"
 #include "xe_sriov.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_vram_types.h"
 #include "xe_wopcm.h"
 
 #define make_u64_from_u32(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index c0bd23aaaa23..0989c45d3e9f 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -34,6 +34,7 @@
 #include "xe_sync.h"
 #include "xe_trace_bo.h"
 #include "xe_vm.h"
+#include "xe_vram_types.h"
 
 /**
  * struct xe_migrate - migrate context.
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 98d79c118e45..bc557fa07926 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -13,6 +13,7 @@
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vm.h"
 #include "xe_vm_types.h"
+#include "xe_vram_types.h"
 
 static bool xe_svm_range_in_vram(struct xe_svm_range *range)
 {
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index c64a4d1a5bb9..6f50c15d0cfc 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -17,6 +17,7 @@
 #include "xe_tile.h"
 #include "xe_tile_sysfs.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_vram_types.h"
 #include "xe_wa.h"
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 19bfc22b9706..dc94d133310d 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -24,6 +24,7 @@
 #include "xe_sriov.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_vram_types.h"
 #include "xe_wa.h"
 
 struct xe_ttm_stolen_mgr {
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index d9afe0e22071..585bc1232658 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -15,6 +15,7 @@
 #include "xe_gt.h"
 #include "xe_res_cursor.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_vram_types.h"
 
 static inline struct drm_buddy_block *
 xe_ttm_vram_mgr_first_block(struct list_head *list)
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 7e3980bcb4e6..cf92a9aa2435 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -20,6 +20,7 @@
 #include "xe_module.h"
 #include "xe_sriov.h"
 #include "xe_vram.h"
+#include "xe_vram_types.h"
 
 #define BAR_SIZE_SHIFT 20
 
@@ -375,3 +376,14 @@ int xe_vram_probe(struct xe_device *xe)
 
 	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);
 }
+
+/**
+ * xe_vram_region_actual_physical_size() - Get the actual physical size of a VRAM region
+ * @vram: the xe_vram_region struct
+ *
+ * Return: the actual physical size of the VRAM region, or 0 if @vram is NULL
+ */
+resource_size_t xe_vram_region_actual_physical_size(struct xe_vram_region *vram)
+{
+	return vram ? vram->actual_physical_size : 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index e31cc04ec0db..9092ae86df22 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -6,8 +6,12 @@
 #ifndef _XE_VRAM_H_
 #define _XE_VRAM_H_
 
+#include <linux/types.h>
+
 struct xe_device;
+struct xe_vram_region;
 
 int xe_vram_probe(struct xe_device *xe);
+resource_size_t xe_vram_region_actual_physical_size(struct xe_vram_region *vram);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
new file mode 100644
index 000000000000..dee104beb2fd
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_vram_types.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_VRAM_TYPES_H_
+#define _XE_VRAM_TYPES_H_
+
+#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
+#include <drm/drm_pagemap.h>
+#endif
+
+#include "xe_ttm_vram_mgr_types.h"
+
+struct xe_tile;
+
+/**
+ * struct xe_vram_region - memory region structure
+ * This is used to describe a memory region in xe
+ * device, such as HBM memory or CXL extension memory.
+ */
+struct xe_vram_region {
+	/** @tile: Backpointer to tile */
+	struct xe_tile *tile;
+	/** @io_start: IO start address of this VRAM instance */
+	resource_size_t io_start;
+	/**
+	 * @io_size: IO size of this VRAM instance
+	 *
+	 * This represents how much of this VRAM we can access
+	 * via the CPU through the VRAM BAR. This can be smaller
+	 * than @usable_size, in which case only part of VRAM is CPU
+	 * accessible (typically the first 256M). This
+	 * configuration is known as small-bar.
+	 */
+	resource_size_t io_size;
+	/** @dpa_base: This memory regions's DPA (device physical address) base */
+	resource_size_t dpa_base;
+	/**
+	 * @usable_size: usable size of VRAM
+	 *
+	 * Usable size of VRAM excluding reserved portions
+	 * (e.g stolen mem)
+	 */
+	resource_size_t usable_size;
+	/**
+	 * @actual_physical_size: Actual VRAM size
+	 *
+	 * Actual VRAM size including reserved portions
+	 * (e.g stolen mem)
+	 */
+	resource_size_t actual_physical_size;
+	/** @mapping: pointer to VRAM mappable space */
+	void __iomem *mapping;
+	/** @ttm: VRAM TTM manager */
+	struct xe_ttm_vram_mgr ttm;
+#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
+	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
+	struct dev_pagemap pagemap;
+	/**
+	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
+	 * pages of this tile.
+	 */
+	struct drm_pagemap dpagemap;
+	/**
+	 * @hpa_base: base host physical address
+	 *
+	 * This is generated when remap device memory as ZONE_DEVICE
+	 */
+	resource_size_t hpa_base;
+#endif
+};
+
+#endif
-- 
2.34.1

