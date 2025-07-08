Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934A5C71130
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 07:04:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 551E110E097;
	Tue,  8 Jul 2025 07:04:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P5vER2s1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9B310E5A2
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Jul 2025 07:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751958247; x=1783494247;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HK0Nkq9nGR4B2WDiYid3Ark1zJzIjbxaAiqIrTZ3UBc=;
 b=P5vER2s1zIZhi3AGHaHPqZ2DrdvpYzl4GLrklmMUhkbNaJdoZQrSPuyt
 oAfb9cBz7HDx6t9MOM+w9fKNQfXuhKo+xUjW7euUKjP+CVQLRAra4OPyc
 1wDDmFO6M/pU0dnk3a2duFWf/Vg1ys4jkdix8buXTOEKZT+9Fbfqwhk94
 pfCoV9jABfgEpelhbq1f+F4mxlPTb+dSMWuXSU+Q0JGTjOgZhCM0Mtlkf
 xO3UKbyW45WSoG5RMxp1vrriliFTBFsJihGcXhEdVZPlhgABZgEe9N/DY
 0UzVz67XnMniaLjb/gbDHqQxGi4inRvDH0SQ8CoGc+0gdFVwOgbIbceVR Q==;
X-CSE-ConnectionGUID: 8HarQTHkRT2xhhS+wqem4A==
X-CSE-MsgGUID: oUYxmVmRSJ6e3AyCPfMKEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54312936"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="54312936"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 00:03:58 -0700
X-CSE-ConnectionGUID: nUZzFQkISyS5TztPXw3DRA==
X-CSE-MsgGUID: cvR8efzuSt+bbDWxHVQTdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="155545059"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 00:03:58 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 00:03:57 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 00:03:57 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.80)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 00:03:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w5sX1k5ekAlSM+iuIK4jFhGuHPM4ib5NlStwvXNWrVeC42mC8BtidIdqAJuu9rkumWAI0qmATmt8g1WsmiUHYnQTql44ryN3Za/36FAqWyo+TdFUr6eaBH+NkOsO9sh3oz8EMQteNEl5QtzlI8uu9yPlMQM3fHjpvMAjLPQAjrSbHRHQqSRQkqRQU+jsA3tHrprqG8ILUYCoII1Vk8YACEC4Ju9LfhgNArHWHt+ZVSD2rcqZ9mfucdGbtsROTuuzR21VAdX3TiN6rRRypf+IFwwFzvHAzilSH8bznTj4ZYiZ9nuckx6RLGpG4sy0vR3fBBYXS0qrEb9dKtg7AGv7GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQjNpjjaLvyI/+ifWUPYeZhHu2PU4YRMg3ahb65ZmCI=;
 b=g9ulOPj6UNOjxJT8W3ld6syUvZ44wGhS4vyTEaiRFxOA4iBZ8UGf/1RonEr4oJMyoPlTd+M9S3FOuKJhkOf3ieG1N2rOVQEOs75Aqzqk9v2ni20eb0MoOmUmELOHpQGejqiRd+MEzcM5ngPdaT4VQY4MAmItDQaVwJbMu9wVNSqfRN/Ymn2/d6mnl3n0JNMzS1bzPzpwwsFsT0sVApa9E0msw6jii8XWiD+shOntyeHKjFLPR69nUyDOoRWBIrdKsW7uPe8zBf+rUlOaevbpL5F1VGxEjWI49m7G73OMWdVHjJcKJPTusJ7oCj0CAVHazC+oN7imkFYn+ZWaFiP7sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ0PR11MB6720.namprd11.prod.outlook.com (2603:10b6:a03:479::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 8 Jul
 2025 07:03:49 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Tue, 8 Jul 2025
 07:03:49 +0000
Date: Tue, 8 Jul 2025 09:03:46 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jani Nikula <jani.nikula@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: Re: [PATCH v9 3/4] drm/xe: Move struct xe_vram_region to a dedicated
 header
Message-ID: <20250708070346.ldtrj4qb2yxjvs42@intel.com>
References: <20250707145609.3857467-1-piotr.piorkowski@intel.com>
 <20250707145609.3857467-4-piotr.piorkowski@intel.com>
 <aGv390JjsB0tlBn0@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aGv390JjsB0tlBn0@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: FR4P281CA0268.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::13) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ0PR11MB6720:EE_
X-MS-Office365-Filtering-Correlation-Id: 74602cf8-8bb7-4103-936f-08ddbded96d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bHIyYS9CbXg0ZVlJNm5veERqNTdVTHJjMVUxN1ovVlVDNmZndjVKbm4rZnBW?=
 =?utf-8?B?aWJ4Y1E5bFNQQnR0NDA1WVEzR0I3UjZ2VUZOQ1k2WVlHVVNOZUNBN3llVlhC?=
 =?utf-8?B?UUc1amY2L3NXZHE5L2hCcEd3bnArNzJjRWFUK1RjWEZmclNoZm42RFJmRVlS?=
 =?utf-8?B?cWpyUzBPMTdJWmJLMWZyNkNTa2lTWnY0aXU4YzJpVHpXbzJ4R21mNnZBVC9w?=
 =?utf-8?B?MkZYcTlPNUxkZnRnd2FFVzZiSW80S1VhZG9EbjdUTHJkM3ZWaGhDYkMrTjRl?=
 =?utf-8?B?OWNJK2craEhpZGh6YkdpSjMvVFFoNjN6Z3N4NW83MEoxdld2aDBlUzdXakp4?=
 =?utf-8?B?MG5KZmVVcVlNRlU1bTNKTE9NSk0wbmtLUzVHZ0F6L1FYc05ZbHhaSUJzZE9i?=
 =?utf-8?B?bk5oZnlUOWh0MVcrTUFjUlRJa2xVa2h0Q0lQMWMvT1Nzd3dvY2wvd0NZQ3F2?=
 =?utf-8?B?Vkx3TXRKUjI1R08zVmZoZng4cnNYUldBa2dYdHFZUzMyTXgxZktFYnVRUWVy?=
 =?utf-8?B?Zks0YndFUHhTM1J4RkFSTW1UeS90WmkwNGNjVkd4VVFPWEJhZlVWWStDQitn?=
 =?utf-8?B?aGhpL3pXcE5JYzVLTDFpdVh4THpjMmxkVldORXlHaWE0ZDhqSmREMUZKeDZK?=
 =?utf-8?B?TzJtblpuRkhTdVhrUllsOEREMDFkNTRRUVp5ek45dG9HZW94cHdsMUNzT1F0?=
 =?utf-8?B?UEJSY1JHVEx3OFlpcmhac1g4R0ZwUkdXcWVkaFhMVjdzUTVscUk4bkhuZmdu?=
 =?utf-8?B?L1hWZThTdDVkckt5eDFjVUpTY3dlTjdZQUdvVC8xZmIvUnVpZjZzRzQveklZ?=
 =?utf-8?B?dzIwU01pR3J6NjBXQUJ1MjlvVDNqN1VRTSs0S01CdHBCa1lRSG8vZ2QvTHZs?=
 =?utf-8?B?SVVHVm1aVkRPbXNlQW85R0ZIdExkMDVEc1UvYm9WTEZsNnFrb3NzMFNCMzR0?=
 =?utf-8?B?TU5WVlM1NGN3d0E1SGdiQU0yd3ppVTNvdkdweTg1ZXRGYnQvd2FHVGJJb2pZ?=
 =?utf-8?B?YjhzYkRQSXBLbWVsYnByeUF2Wmw5K3B4aTlOdjJMT25HWGVHTjJmMHZtTUlm?=
 =?utf-8?B?cngvWlFYdnhUSTQ4bjA3bXgxNDliaFBPcUpYNkd5RGg0OUNNM0lrVitVY1dq?=
 =?utf-8?B?Um1US21sZDZuczVQaGRkelVsc1o3c21hTUJWN2hTL0twWmNjMlY3MTg4TWhN?=
 =?utf-8?B?bGRycUlERkxkL0J2QUIyM1g5T0tFSWxoQ0tIVzVPdlVXSVU4MlhJSGtoRnhH?=
 =?utf-8?B?SHhXOFlFVGQxWnBoUGlCT0RIV2RCeFV0NVlkNjFuc3VSVFZGVTkvRXVtZExm?=
 =?utf-8?B?S1QzbW1POTN0RnBZVW16Y1JsdmowME5ZU1p1RXovbWE0VmpicWMwRkdITmly?=
 =?utf-8?B?QXlLSlpDOVYwNmZXTDhZUmVhbFpnS0Y1RjVFMkwrU0tHWlpQRUxySWRPMlhW?=
 =?utf-8?B?RXMrRCtza3JsMWlDRzJjVloyOCtSUzRWRXphdmVFbmo4MXhybklXM0p0MjF0?=
 =?utf-8?B?U3VUUjF4Qm1WNWZQay8xNlNhcnQxU3hSLzFjSzYxbGxvTlB1VkNab0ExV2tp?=
 =?utf-8?B?U2gybWlwZGpJQ3dINUVSekpRK3F4dVVCY0FmZXhRSDF5YnNkMnhSdHVVQzgv?=
 =?utf-8?B?aUdoWm1RbEgxS21qY1JvSUp1UUNBcDg3dDMwcjA1YlIrMzc0L3FwSG5VMDhG?=
 =?utf-8?B?NXZaMEY1ek1VRnR5V2UvaXJNbENGSnlReGJvVi9KOWRFMFFlbHRkdFN4aitq?=
 =?utf-8?B?SlpwWk81TjZHM1FaTW9QMUNXUDlpcFpPbE1CMjl3bC91cjZrUy9wNzQ1UTVP?=
 =?utf-8?B?bEVSNk9yMjYrR3pLQTlzbmFRWW9lWk5QVEd0TkgxckIzMVYveFJNcWdLTHNl?=
 =?utf-8?B?VGN1aGNMMkdsUlQyNS8xUWxqOEs1U0VhakFGSVdxTUNKMU9keXhndFowajds?=
 =?utf-8?Q?hYvqTKzi49Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEp5ZG5Xd3lRNkFTcTZxQlpkdzNsMHVSbFdZRjRjRnVHRDV4bTFGcm16Vmx0?=
 =?utf-8?B?djZDbU1hbmN4VkhaWDQzaTVQcmtlZlRBVy9aYXZxdGo5REc1Tkk1NXVhNUpC?=
 =?utf-8?B?U29rT0Mvb0Y3VGJhYUM0b0IwRmh3a2E5UHpnK1hpdzQrSkozZ2VHWk5sMWow?=
 =?utf-8?B?b1I0RzVFQWd5Ri9JemNjcHNtNlRiYzVBY0plTVdhNTdObFBhMlJjb2drZmNE?=
 =?utf-8?B?OStTUGJDWWJ5dDYxYjVOR3lVYW5uN0hUcjhqcFppbERQNHF0V1JDOE44Z29C?=
 =?utf-8?B?MkVFRUEvWmVRbVh5VFRPSGxoOTlWUmxlbC92VW9rVUhhWkVhMVNYZzRFRU4z?=
 =?utf-8?B?ZVZYSW9ZZlMzemRPeUxJS01Jck44R1dCa1M4L2dlVzhZWWIyK3VJeDc4L2p5?=
 =?utf-8?B?Ui8zak5aYk9mSk01QlhLM2IxRDE1V3ArRkwrMTczZ3lLYkgrVTY5aEhza0pE?=
 =?utf-8?B?M0dvVG1ZcGVYRjVuVWo2VW9nOWlHa1o4MEs0ZFFMNFVDN1A2NXFyemRNUFVt?=
 =?utf-8?B?cTVRSjJodStDa0c5STFzTEE3WXZ3R1JTOXJCa3VKVXliUUtoVGhZRHQ0UUF3?=
 =?utf-8?B?KzcwMzlSbGVlc1JuUEdtUEhrMWIwZGkvNkV6WnorUjdHK3BqdHpSWkQxRFkv?=
 =?utf-8?B?dVppOWNrUS9XWGh2dC9IS1lTWm5JQk1relVIVTVwUkRGMW9SaXB4YVQrdUhj?=
 =?utf-8?B?dVZEckVsdGRvSDJjYVpiVDVzUzRnd1RQTjRtSjhPY1N4ZUhMcWk4WnRMY3A2?=
 =?utf-8?B?ZWF5OWJGMURlRFFJVUFydUI2cS9hRzdxZXU4OEpGeXo4SEszbHNjRVluVEhn?=
 =?utf-8?B?eWlRbnZkOEVNMkZVREZIbnVOU0NPRkpqKzNiVzBwNmRXcTI5d1FFVkFRUWNz?=
 =?utf-8?B?ZWdpZDhPRXFPRFdmeUhWd3pGSHB0QU5ROEQ4RVkvNnpqVE0wVFg4empXZ0tQ?=
 =?utf-8?B?SExwR3ZwOU5ZNHRNVDhNL3JFUVRwcS92VTZqZkdiNDd4L2JSVEdvclI1TXBi?=
 =?utf-8?B?S3plT01ueVBZbHNVWGx4ekhjWE1HMklCZ1RCWURFWjN1UnorNktxMW1FNmcx?=
 =?utf-8?B?VkpXOTlzZTBUSm9jVVZiNHRzVFhtRlF1U2NWVElNT0VLYXA0RklDZjdOejcr?=
 =?utf-8?B?dWRidTdBQzE3RkN0SHliRDlHTURGOXU5TzA1VU9vRCtRWDlVa2FxdTN0OVE2?=
 =?utf-8?B?NkdqQWJuY3VBVUYwT0N5MTkxQkZ2Q2ZnWnNDUUNKb1BwYmplZmNackNWTmVL?=
 =?utf-8?B?OFZkM1NNUHNIM3FCajFnNzFjZmpLTzU4MGdiY3BIQWRLQ29QYXp5R01uR09h?=
 =?utf-8?B?Nk9BNjVMMWVqVERRS3doSVU2WFdIa2Z2VVZxc21JbXF5c2FrTzhwTW81RC9D?=
 =?utf-8?B?NGRORnVOc1RJUzlQT1JNd085eTVoZkxDVTdrMld6QWIyUGUxYkZicCtacHUr?=
 =?utf-8?B?VjdXdTcwbG9NS0lXR0VkZEFLdWxNRnFjczZiYnFXUnRtUFg4NDRVc083YTRE?=
 =?utf-8?B?czJ6V01MU2xyd3hiTSt2d0RKUERBSW05bjR0eXo3VEJhUmlLNWUrc1h3bWpX?=
 =?utf-8?B?bFN5OVdDSXA2WFJBY2NCTmlaYjlDTGs0NWVwWjQvRmZPMGMrQ1N0SVBBeVVh?=
 =?utf-8?B?amlWbG9FZGwydFRwZzkvQkJEK0lzSUNqL25wenVYWnBzMTNybWVUUnM4ekNV?=
 =?utf-8?B?Y2pBck1CYjRpVVhTektCcjZkU3ROektzbU16SVg0TnlETWMxTDR0eVMrKzlo?=
 =?utf-8?B?L0xGQVd4aUF2UWxpS0VYRld3Vk9velk3RThUc2IyaEQ3Unh4cTk5cU9YeUM3?=
 =?utf-8?B?VnRrMktFQUFzV3NoS2JuVDF4UitFNmNkcTBlSXVHYUZpRXJEcUJNbEJ0UmVj?=
 =?utf-8?B?VVlNc3lLczRlL054SmJrYjFHci83WjdKMVgweXZQd3h0OXNQUnFzSHdkRVVp?=
 =?utf-8?B?ZVFpSW1pN2VqdzJtbTl5SmFTNDZRb2wrN2tEa0FHRkhyRlNrS1Zhd1lSSEJm?=
 =?utf-8?B?dG1HUFZmV1h6a0x0YlZBMHFvc2tvYk5Xcm5RZVZmVktsOWVQWEdzaVpaWExz?=
 =?utf-8?B?V3NSbHNPdTdyZGsvdG9yS2tKYmRSc2dvZVJBTkMxOFVmOUIrSWFiUUZOWDZk?=
 =?utf-8?B?L0phK2hSd2ZFWXBCamtVQkNWQm5MOUVCWEd1UXo2TE94d3A0WTJhTzFVUVd0?=
 =?utf-8?B?MUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74602cf8-8bb7-4103-936f-08ddbded96d7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 07:03:49.3399 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PB4kABubKWLGxIWBM1XsF2OG/VG2FmHKehs6izIrv8gaWyeHNeqZ9nT1QBrpXMm5IK7Ad6660U3y/VrE7H/B2fsgvL2DU38Sure0Y4s0fm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6720
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

Matthew Brost <matthew.brost@intel.com> wrote on pon [2025-lip-07 09:38:15 -0700]:
> On Mon, Jul 07, 2025 at 04:56:08PM +0200, Piórkowski, Piotr wrote:
> > From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > 
> > Let's move the xe_vram_region structure to a new header dedicated to VRAM
> > to improve modularity and avoid unnecessary dependencies when only
> > VRAM-related structures are needed.
> > 
> > v2: Fix build if CONFIG_DRM_XE_DEVMEM_MIRROR is enabled
> > v3: Fix build if CONFIG_DRM_XE_DISPLAY is enabled
> > 
> > Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > Suggested-by: Jani Nikula <jani.nikula@intel.com>
> > Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > ---
> >  drivers/gpu/drm/xe/display/xe_fb_pin.c        |  1 +
> >  drivers/gpu/drm/xe/display/xe_plane_initial.c |  1 +
> >  drivers/gpu/drm/xe/xe_bo.c                    |  1 +
> >  drivers/gpu/drm/xe/xe_bo_types.h              |  1 +
> >  drivers/gpu/drm/xe/xe_device.c                |  1 +
> >  drivers/gpu/drm/xe/xe_device_types.h          | 60 +--------------
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  1 +
> >  drivers/gpu/drm/xe/xe_svm.c                   |  3 +-
> >  drivers/gpu/drm/xe/xe_tile.c                  |  1 +
> >  drivers/gpu/drm/xe/xe_tile.h                  | 11 ---
> >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  1 +
> >  drivers/gpu/drm/xe/xe_vram.c                  |  1 +
> >  drivers/gpu/drm/xe/xe_vram_types.h            | 74 +++++++++++++++++++
> >  13 files changed, 86 insertions(+), 71 deletions(-)
> >  create mode 100644 drivers/gpu/drm/xe/xe_vram_types.h
> > 
> > diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > index 2187b2de64e1..f2cfba674899 100644
> > --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > @@ -16,6 +16,7 @@
> >  #include "xe_device.h"
> >  #include "xe_ggtt.h"
> >  #include "xe_pm.h"
> > +#include "xe_vram_types.h"
> >  
> >  static void
> >  write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_ofs,
> > diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> > index 873f4e18cb2a..11591c7cdc70 100644
> > --- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
> > +++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> > @@ -21,6 +21,7 @@
> >  #include "intel_plane.h"
> >  #include "intel_plane_initial.h"
> >  #include "xe_bo.h"
> > +#include "xe_vram_types.h"
> >  #include "xe_wa.h"
> >  
> >  #include <generated/xe_wa_oob.h>
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 7f8470b22dc9..a35a9e0dbfae 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -34,6 +34,7 @@
> >  #include "xe_trace_bo.h"
> >  #include "xe_ttm_stolen_mgr.h"
> >  #include "xe_vm.h"
> > +#include "xe_vram_types.h"
> >  
> >  const char *const xe_mem_type_to_name[TTM_NUM_MEM_TYPES]  = {
> >  	[XE_PL_SYSTEM] = "system",
> > diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> > index ff560d82496f..57d34698139e 100644
> > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > @@ -9,6 +9,7 @@
> >  #include <linux/iosys-map.h>
> >  
> >  #include <drm/drm_gpusvm.h>
> > +#include <drm/drm_pagemap.h>
> >  #include <drm/ttm/ttm_bo.h>
> >  #include <drm/ttm/ttm_device.h>
> >  #include <drm/ttm/ttm_placement.h>
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 19019b032c78..4bd0619574ff 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -63,6 +63,7 @@
> >  #include "xe_ttm_sys_mgr.h"
> >  #include "xe_vm.h"
> >  #include "xe_vram.h"
> > +#include "xe_vram_types.h"
> >  #include "xe_vsec.h"
> >  #include "xe_wait_user_fence.h"
> >  #include "xe_wa.h"
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index ece4bfcde477..55b068183f8c 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -10,7 +10,6 @@
> >  
> >  #include <drm/drm_device.h>
> >  #include <drm/drm_file.h>
> > -#include <drm/drm_pagemap.h>
> >  #include <drm/ttm/ttm_device.h>
> >  
> >  #include "xe_devcoredump_types.h"
> > @@ -24,7 +23,6 @@
> >  #include "xe_sriov_types.h"
> >  #include "xe_step_types.h"
> >  #include "xe_survivability_mode_types.h"
> > -#include "xe_ttm_vram_mgr_types.h"
> >  
> >  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> >  #define TEST_VM_OPS_ERROR
> > @@ -36,6 +34,7 @@ struct intel_dg_nvm_dev;
> >  struct xe_ggtt;
> >  struct xe_pat_ops;
> >  struct xe_pxp;
> > +struct xe_vram;
> >  
> >  #define XE_BO_INVALID_OFFSET	LONG_MAX
> >  
> > @@ -68,63 +67,6 @@ struct xe_pxp;
> >  		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
> >  		 struct xe_tile * : (tile__)->xe)
> >  
> > -/**
> > - * struct xe_vram_region - memory region structure
> > - * This is used to describe a memory region in xe
> > - * device, such as HBM memory or CXL extension memory.
> > - */
> > -struct xe_vram_region {
> > -	/** @tile: Back pointer to tile */
> > -	struct xe_tile *tile;
> > -	/** @io_start: IO start address of this VRAM instance */
> > -	resource_size_t io_start;
> > -	/**
> > -	 * @io_size: IO size of this VRAM instance
> > -	 *
> > -	 * This represents how much of this VRAM we can access
> > -	 * via the CPU through the VRAM BAR. This can be smaller
> > -	 * than @usable_size, in which case only part of VRAM is CPU
> > -	 * accessible (typically the first 256M). This
> > -	 * configuration is known as small-bar.
> > -	 */
> > -	resource_size_t io_size;
> > -	/** @dpa_base: This memory regions's DPA (device physical address) base */
> > -	resource_size_t dpa_base;
> > -	/**
> > -	 * @usable_size: usable size of VRAM
> > -	 *
> > -	 * Usable size of VRAM excluding reserved portions
> > -	 * (e.g stolen mem)
> > -	 */
> > -	resource_size_t usable_size;
> > -	/**
> > -	 * @actual_physical_size: Actual VRAM size
> > -	 *
> > -	 * Actual VRAM size including reserved portions
> > -	 * (e.g stolen mem)
> > -	 */
> > -	resource_size_t actual_physical_size;
> > -	/** @mapping: pointer to VRAM mappable space */
> > -	void __iomem *mapping;
> > -	/** @ttm: VRAM TTM manager */
> > -	struct xe_ttm_vram_mgr ttm;
> > -#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> > -	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
> > -	struct dev_pagemap pagemap;
> > -	/**
> > -	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
> > -	 * pages of this tile.
> > -	 */
> > -	struct drm_pagemap dpagemap;
> > -	/**
> > -	 * @hpa_base: base host physical address
> > -	 *
> > -	 * This is generated when remap device memory as ZONE_DEVICE
> > -	 */
> > -	resource_size_t hpa_base;
> > -#endif
> > -};
> > -
> >  /**
> >   * struct xe_mmio - register mmio structure
> >   *
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > index e69a05126dae..275ab5f03291 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > @@ -33,6 +33,7 @@
> >  #include "xe_migrate.h"
> >  #include "xe_sriov.h"
> >  #include "xe_ttm_vram_mgr.h"
> > +#include "xe_vram_types.h"
> >  #include "xe_wopcm.h"
> >  
> >  #define make_u64_from_u32(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > index e6871734ffa9..ee015e3f5d9e 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -17,6 +17,7 @@
> >  #include "xe_ttm_vram_mgr.h"
> >  #include "xe_vm.h"
> >  #include "xe_vm_types.h"
> > +#include "xe_vram_types.h"
> >  
> >  static bool xe_svm_range_in_vram(struct xe_svm_range *range)
> >  {
> > @@ -1006,7 +1007,7 @@ int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
> >  	xe_assert(tile_to_xe(tile), range->base.flags.migrate_devmem);
> >  	range_debug(range, "ALLOCATE VRAM");
> >  
> > -	dpagemap = xe_tile_local_pagemap(tile);
> > +	dpagemap = &tile->mem.vram->dpagemap;
> 
> I'd leave the helper here and move 'tile->mem.vram->dpagemap' to the
> helper.

I removed this helper with full premeditation and after consulting with the author of the code.
I decided that since we only use it in this one place and we can avoid adding include
xe_vram_types.h to xe_tile.h, it should be done.

> 
> >  	return drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
> >  				       xe_svm_range_end(range),
> >  				       range->base.gpusvm->mm,
> > diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> > index 858ce0183aaa..bd2ff91a7d1c 100644
> > --- a/drivers/gpu/drm/xe/xe_tile.c
> > +++ b/drivers/gpu/drm/xe/xe_tile.c
> > @@ -20,6 +20,7 @@
> >  #include "xe_ttm_vram_mgr.h"
> >  #include "xe_wa.h"
> >  #include "xe_vram.h"
> > +#include "xe_vram_types.h"
> >  
> >  /**
> >   * DOC: Multi-tile Design
> > diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
> > index fb0473fa9098..8dd87ccb2aca 100644
> > --- a/drivers/gpu/drm/xe/xe_tile.h
> > +++ b/drivers/gpu/drm/xe/xe_tile.h
> > @@ -18,15 +18,4 @@ int xe_tile_alloc_vram(struct xe_tile *tile);
> >  
> >  void xe_tile_migrate_wait(struct xe_tile *tile);
> >  
> > -#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> > -static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
> > -{
> > -	return &tile->mem.vram->dpagemap;
> > -}
> > -#else
> > -static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
> > -{
> > -	return NULL;
> > -}
> > -#endif
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > index 3de2df47959b..8f9b8a1d2c05 100644
> > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > @@ -15,6 +15,7 @@
> >  #include "xe_gt.h"
> >  #include "xe_res_cursor.h"
> >  #include "xe_ttm_vram_mgr.h"
> > +#include "xe_vram_types.h"
> >  
> >  static inline struct drm_buddy_block *
> >  xe_ttm_vram_mgr_first_block(struct list_head *list)
> > diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> > index 71f463f2c3be..35fd7f5d7cff 100644
> > --- a/drivers/gpu/drm/xe/xe_vram.c
> > +++ b/drivers/gpu/drm/xe/xe_vram.c
> > @@ -20,6 +20,7 @@
> >  #include "xe_module.h"
> >  #include "xe_sriov.h"
> >  #include "xe_vram.h"
> > +#include "xe_vram_types.h"
> >  
> >  #define BAR_SIZE_SHIFT 20
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
> > new file mode 100644
> > index 000000000000..a01838236036
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_vram_types.h
> > @@ -0,0 +1,74 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_VRAM_TYPES_H_
> > +#define _XE_VRAM_TYPES_H_
> > +
> > +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> > +#include <drm/drm_pagemap.h>
> > +#endif
> > +
> > +#include "xe_ttm_vram_mgr_types.h"
> > +
> > +struct xe_tile;
> > +
> > +/**
> > + * struct xe_vram_region - memory region structure
> > + * This is used to describe a memory region in xe
> > + * device, such as HBM memory or CXL extension memory.
> > + */
> > +struct xe_vram_region {
> > +	/** @tile: Back pointer to tile */
> > +	struct xe_tile *tile;
> 
> If the goal is share one xe_vram_region among several tiles, doesn't
> having a back pointer to some extent break this? It would be better to
> only have a 1 way relationship here: tile -> VRAM but VRAM cannot lookup
> the tile. I haven't look through the entire series, but in what cases is
> this backpointer needed?
> 
> Matt

I have mixed feelings about this back pointer.
But let me start from the beginning:
My goal is to make vram_region independent of structures such as xe_device or xe_tile.
In the future, I would like this object to be dynamically assigned to these objects,
creating a many-to-many relationship where one tile can have several vram regions
and one vram region can be shared by many tiles. From a logical point of view,
this back pointer actually breaks the one vram region to many tiles relationship.
Currently, from what I can see, this back pointer is only used in the SVM code:

drivers/gpu/drm/xe/xe_svm.c: In function ‘xe_vram_region_page_to_dpa’:
drivers/gpu/drm/xe/xe_svm.c:314:34: error: ‘struct xe_vram_region’ has no member named ‘tile’
  314 |         struct xe_tile *tile = vr->tile;
      |                                  ^~
drivers/gpu/drm/xe/xe_svm.c: In function ‘xe_svm_copy’:
drivers/gpu/drm/xe/xe_svm.c:369:34: error: ‘struct xe_vram_region’ has no member named ‘tile’
  369 |                         tile = vr->tile;
      |                                  ^~
drivers/gpu/drm/xe/xe_svm.c: In function ‘xe_svm_populate_devmem_pfn’:
drivers/gpu/drm/xe/xe_svm.c:521:42: error: ‘struct xe_vram_region’ has no member named ‘tile’
  521 |                 struct xe_tile *tile = vr->tile;
      |                                          ^~
drivers/gpu/drm/xe/xe_svm.c: In function ‘xe_drm_pagemap_populate_mm’:
drivers/gpu/drm/xe/xe_svm.c:688:34: error: ‘struct xe_vram_region’ has no member named ‘tile’
  688 |         struct xe_tile *tile = vr->tile;
      |                                  ^~

- I think this is your code, so you should know best if we can actually drop of it there.
From what I can see, removing of this back pointer will also cause a problem with getting
the xe pointer, which can sometimes be useful.

Let me know what you think, or if you have any ideas. I'm open to getting rid of it.> 

Thanks,
Piotr

> > +	/** @io_start: IO start address of this VRAM instance */
> > +	resource_size_t io_start;
> > +	/**
> > +	 * @io_size: IO size of this VRAM instance
> > +	 *
> > +	 * This represents how much of this VRAM we can access
> > +	 * via the CPU through the VRAM BAR. This can be smaller
> > +	 * than @usable_size, in which case only part of VRAM is CPU
> > +	 * accessible (typically the first 256M). This
> > +	 * configuration is known as small-bar.
> > +	 */
> > +	resource_size_t io_size;
> > +	/** @dpa_base: This memory regions's DPA (device physical address) base */
> > +	resource_size_t dpa_base;
> > +	/**
> > +	 * @usable_size: usable size of VRAM
> > +	 *
> > +	 * Usable size of VRAM excluding reserved portions
> > +	 * (e.g stolen mem)
> > +	 */
> > +	resource_size_t usable_size;
> > +	/**
> > +	 * @actual_physical_size: Actual VRAM size
> > +	 *
> > +	 * Actual VRAM size including reserved portions
> > +	 * (e.g stolen mem)
> > +	 */
> > +	resource_size_t actual_physical_size;
> > +	/** @mapping: pointer to VRAM mappable space */
> > +	void __iomem *mapping;
> > +	/** @ttm: VRAM TTM manager */
> > +	struct xe_ttm_vram_mgr ttm;
> > +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> > +	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
> > +	struct dev_pagemap pagemap;
> > +	/**
> > +	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
> > +	 * pages of this tile.
> > +	 */
> > +	struct drm_pagemap dpagemap;
> > +	/**
> > +	 * @hpa_base: base host physical address
> > +	 *
> > +	 * This is generated when remap device memory as ZONE_DEVICE
> > +	 */
> > +	resource_size_t hpa_base;
> > +#endif
> > +};
> > +
> > +#endif
> > -- 
> > 2.34.1
> > 

-- 
