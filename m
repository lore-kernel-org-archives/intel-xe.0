Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513DDC61DC2
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 10:29:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E88910EF90;
	Thu, 27 Aug 2026 10:29:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VB95Q1Zr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28FF10E648
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 10:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787826558; x=1819362558;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=doyPXK+RuAG1DKX51zjxemk1RjUVV1KsYjk10HVEpGQ=;
 b=VB95Q1Zr05m7sp5FEw1n7RNfN+jcAkdprYz/0uXxuGH/IOmEj7oeDMLQ
 zO4CyfkSUFKR9XWun3yOeda+6OulBAlP3qiC+Wj2UDYt1aEJsFr4OcWWq
 ksnlaGyZPnfudvy3xIggO5Z5mdA8OsvN0odX9B/XsHRwx4z7iIqIexZ/w
 J9Ay3EWkENfCfPcF8nuCop4ASDNxrDQHOG9WpBBmx/oLJYfqA+5DRgdEz
 FjD2Rh7KMR82LzRR6N8WRXmrzK4FJQLKY/rrZ7l1UzA2AKXSTUVdQNrln
 n1wu0jwcb52WaL8x7xDjnePazOS5Eb3tI5O/nbHfQ/nCQmfW/KlPGxXbT w==;
X-CSE-ConnectionGUID: y+w+f+g2RKqCrN/jywoKBg==
X-CSE-MsgGUID: oH5J8Yg+SWKZu2qx3hM06g==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="87457308"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="87457308"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 03:29:17 -0700
X-CSE-ConnectionGUID: OXfuiBkgQ7qmwFFBo2ocfA==
X-CSE-MsgGUID: +0LHq+jcSmyd7PWGs0vJ2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="291344348"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 03:29:18 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 03:29:17 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 03:29:17 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.50) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 03:29:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pLuVW5nLaxzFfczGj1G8jQ8JYdYvQgyz/0zLW4VjZku8iSrwBw53037U7bbnejqF9eyaN+SSo5XS6fAvX4Ja3uENPQDJ6cj+YAbdRrnw9gHTZcGvYb0GuYJbT6VV8l6qZfYiMx/JWG9TEhCw21dnjcSIhMZT14eqFJLaAI1QEKoukAalSEi+JKmYCsll6J45XTkK2119lxihcMBrcweK0Y8IGnJrKHqkN1j9lNopssRe7hNtkCAd/2crGIv8zn/kc8+gPmSTWDCClnJEdmVONcjpNKPe/itKG0ETuHp11w8HQoNIczURrnyL0Dy01t2kq6WDmO1idMAGj+AcDx4oiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7lUjTv9KwirXmAqQLuX79cNarwGF3AnN4A4RkuqoNss=;
 b=h3t24hGflCNfuQ05Bt0rZ3FDnnEbW31mGg8Y4RwRzyjCqNlN57vkwpZNggXUUTtPh9yWwMKUd/8UDZzCfJ7RFgUYFRHNs6OhP/XxV+pjZgNWEH9hOxGEIxU5qwcQwHEjp1ulhcg+HHKLwiaG9VkszooJaewAD0Nhhum576y1vZPFL32UeWrYgC3t/ceZICOL4quXrtZqPHX0yUqh1bDW+hmrhEvNHAhX0WzpmS/5Sio5MtxhuG3d8166ALA+QgnZWKwqjZTj3U0WPrA9q/ZuYPweMUvCC3LF9ROmokexrkrBBVrov0xwKtwo8ui682EYl2GzKLcfDG3Ba9V+HBtSQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by MN2PR11MB4536.namprd11.prod.outlook.com (2603:10b6:208:26a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Thu, 27 Aug
 2026 10:29:14 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0360.006; Thu, 27 Aug 2026
 10:29:13 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v3 1/4] drm/xe/guc: Split GuC ID manager into usable and
 shareable pools
Date: Thu, 27 Aug 2026 12:28:59 +0200
Message-ID: <20260827102902.1236918-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260827102902.1236918-1-piotr.piorkowski@intel.com>
References: <20260827102902.1236918-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB9PR01CA0008.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::13) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|MN2PR11MB4536:EE_
X-MS-Office365-Filtering-Correlation-Id: 5354ebb9-6ef0-4b0a-901a-08df042609fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|18002099003|22082099003|56012099006|5023799004|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: d4fLcFTPClzG32yzUf8ctNtabpLzIIk4mmZCW53jR5gHaB3lV3gJekrUyAEQPQSBYDq8ah4YIiXL/s1VBBqQ12wWFD7pFbIVAunmgNNgO828eWhkCJ2XSwfFzElrx0+F+JIBYoWLcCxSHEy8qLCqohbGqxUixvmlj+P8ZEAW0mL0mVIA7Q3RFXfzpq4mrmYrvHus1ADIApkm06Q3mY3SNdJ7WWYr7jFOrmEeKIunoFPvA1ARJ+4z67sYtSrP+P1SRRjU3iGhM5d8dPD8F+3DTLNox2D3iRoz4vrfcXr0puGM0fd6pwpXai6os5HaYv6KtBRd1A83/rWDAbqI8FxvDS1rAQQQcsqobRaV2OOiTTDOSK9LGqNMGTGI2fk5hKgjxl0jOujN8XZsq9I8Lx/rWivHRB6GOl6CneT1DL3X/6FpDjRbH15zp7nXNbYvXBr/y1WVu5B1xnaQMB1v/cPRZv2DEC6LXS3Y5w8TiS30bRxEUfWlFvSCscV8fd+sfVZP0+uu3KHqQ8cwwF+NLXG+0Pkufrb6BtViQQIyNwcSuN+k7OS3enFfeUXo9/0QWPTLSSweLtxTvDTwhtQdibM0vUOhsXn4a9jEuQw8tAQ139CRGkejeWjIQuh2DN4GFJ/IdmLEFsLROEqtwqnRe6HE+yMDdKfBKkSG9448ZiG/7fE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(56012099006)(5023799004)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEJrQXhpb3d3SFQ3SkFxd3U0anlGd2N1Z3g4b3ljRDBhbWJTNS9JbDlHZTJE?=
 =?utf-8?B?NXo4MVE3aTNvOHQ1dWc5UTFLZWFJNXRIZ1pZL281QmtNV3puUDJVZkhzcE1q?=
 =?utf-8?B?cktDMm8zbDNrZm96ak82WnJ5NVE1L3YySnRKNHRxN2ZLU1puaTZTZDQ5ajBp?=
 =?utf-8?B?V1lFWlFRQmlEYlpNalhGaGprbFZDOXdqbEVHMzZmOVhRKzdCM1IrelQ5MWJl?=
 =?utf-8?B?azFDNG9NdW5ZWGsrR3F1WHZTbVY2VkFwZ2o4cjhYdEFib2lzaVVCWTdUVnFt?=
 =?utf-8?B?dFUvTWRaSTRvMmVLZWFRZ3FTdUtrcUE1RmlCUUYyNStpSlNoRm9ENzA5YVRr?=
 =?utf-8?B?RHNsVHhQdHVBL2M2NWNrcndWdGNrRXBkdS9Vc3l3VW5MbEl2dS9NcGRDZ0ZW?=
 =?utf-8?B?NGNLUitBUnhFU0VrcmlIZTQ3NlVQQm82ejhQVzhyN3YvdEFzNGUrR2pWUGVD?=
 =?utf-8?B?dmdnbUNuTFZhUWZQcWVaWUlUVEhLNFU3cWJGNTZES0FYZFFLNkdkRWpNOEVH?=
 =?utf-8?B?T2loUXd1S2Q1OHFEYWpOYTRsZVgxSUIrbFZYcGJrVHRRamZ0b2FoZ3JhZUwy?=
 =?utf-8?B?OFNoVGFndjJXNW1adlcyczFiWmNkamVGOFBIWjAybGVWZXFmMWhDMlJCZ09P?=
 =?utf-8?B?OHMzdEQ5TW9hQWorVE42TlVNQ3ZqS1F6NjBkeUVNRjA4SG5OdHIrNFp5dlNZ?=
 =?utf-8?B?Y3YrL2pMbGwyOFo3ZXhyNk9Xb1FaSGo5bytZTGRiNWZ2bmsrZmYzUk11ZjdH?=
 =?utf-8?B?UFQrTkxzYjRjYU9Jbm9xOXBURDYwdSs2c2RIVU1CdFZMSnVmd24rbzkxUUhz?=
 =?utf-8?B?aEwwOGlHczgzTUVHNzlOcXA2N3BWOEhDY0I3Qng3N3I2YkVwZjlnbkwvcEQv?=
 =?utf-8?B?ZTdKUU1nM0NnSVFwbkgyZVdldHlua0h1NUFwU1R5MS9ZOFQ0MkVxS1crMzNq?=
 =?utf-8?B?d1NzTCsrQkdHY1FUd2Jmd3FBemNFdGpLaXpnMkxYWGRuRU5xL2owclNrTW1D?=
 =?utf-8?B?OGE3Q29zb3hMVDhLK0VHRnBSclZod2QwVVNiR3ErcG9TTjRDdDhvNzhZRm0z?=
 =?utf-8?B?aFRKa25NOXl3R0Yray85VE9WRVY0OGlWclJla21QQmxVdWZNL1pKZzJXSFZi?=
 =?utf-8?B?SWVXTG1IOE8rSTJNOXh0OEJRUHlFMS9PR1pyRHVqQUd1MGxsMFJ6bnpCSFhI?=
 =?utf-8?B?am13WUxENEkwR29qNSthczdHOTJCV2NYRmFaUTdubWhzN3ZwNFZPSXV2QzNR?=
 =?utf-8?B?WnRyKy9xLzRJMXhzdGNoMXp2clJ2aHpGamJhM2RpOVRSZGZhbTZEQzVoN1FS?=
 =?utf-8?B?TU9rQkZMdUIreFhLL1VyTmY5NmpISGNxU1IzcXV0NlhYbEw0cU90NXYyVEpZ?=
 =?utf-8?B?UlR0ampGVS94Qlh5R3dzU2JMMWRWbXVZYjZTdGxWNFBic2lqa0R4cTlqZSsr?=
 =?utf-8?B?Rk5qb3dCOEdndjZ5dEhVWTU5YkVVMndYSElSWE9JOUVpRzUzSm9yTGZudTBo?=
 =?utf-8?B?Uk9LRkhITGtOc2xSNzlFS0xSVnc2bW9KV3hRejhkZmJhYnJVbUdWZUROWWg5?=
 =?utf-8?B?bURHU3R3TzRKVmpPL295TnRTQ1d3SWg0azlsRG5vUjZtUjJ5enU1emZpZVdK?=
 =?utf-8?B?akdpU0VGQWtUd3JNQk8rbWFyNDdJR1ZPK0JUODlvVmJWZXliWHZYczRGRkJH?=
 =?utf-8?B?Y0c0RTNsNnAxM3dnbjY5djNlR2hsRlhubVU4S2k0S1NGMndXWHViL21SbGJJ?=
 =?utf-8?B?OHliNVFrcjdHZEFSK2VTYlZ0VUtlellIRGY1TlZQbFJjWmIvYm1Ga0hkMnda?=
 =?utf-8?B?MGw4WjNTY1V6ZzNycVExZmxGT0tLVGZuODcyaWhLMGkwTDRPQWd1OERHWks1?=
 =?utf-8?B?RmdSTnE0a3dFT2JkWS8zcjR3ODcwdlJlcEIybDY4cElBSUptbGc3VlJvWUpz?=
 =?utf-8?B?T0lwMzh2YWo4V2l3cWxzcmR3SHhEZ2loQS9GMzJveTRXZ1FxTFNVNDhpakox?=
 =?utf-8?B?MGlUZWVOSitPZ1Y0UXBNZ3pvcEk2SWREL2kwR05vRDNuclRkQlBLL1U0dXJ0?=
 =?utf-8?B?bS9WSml0cHFQRnRVU09iZUJhcktycHBPOXo4T1RkYVNGSXUzWUFMZUpWU3pi?=
 =?utf-8?B?eENjU1BWOCt4cStYaGpiWEowTTZVdCtzc0VWYmhVeGFZZlpRZnkrU1IyQVV6?=
 =?utf-8?B?bkdzYWRLVnA1TzFGbEdSK0FBeUw0S1BMZGJPSlVLNkRWMFBPc1UrZ3QzOWh3?=
 =?utf-8?B?akZnWVVjS1k1YkJLbmZkSEEwcEdrVmJ2L0FETVl6amprQlJ3NUkzS1phVFlj?=
 =?utf-8?B?bk1GcnlyY0Q1ZWhGSG1aRGlDWVBnK1RBOWFIajBXbzBaUEpnTDJ0U29kaWt2?=
 =?utf-8?Q?8+TH1iv904O1rBd8=3D?=
X-Exchange-RoutingPolicyChecked: K2BjbMZ62GuMK8uMa6mHInuQEUiar2NhVgGq15KQwlrnDJv0ixqOhkk5vRDeooClPj4et6KTNeV7WzMEVpgo+4L6Ngxp5vnDqj+zp/sOOtPtBNWUH7thTEz7RcjS1FVU223Rqm5IrWodKMncRSYLq5DoIfwO1zUvwM33JLe2HO/8YmGSmDWiB4Ol0yZLXMn/P9MsZA6uDT0Xe+ZEgDOUtkWj9I+wXY9fBUO3RXG4GtByWUvPXNu0FqeEJW1Zko6ViSbx6bkp3CUM/blvCG2t7HJdUSv+ZYQk7/ksFwk4JCplgL1igT/uGvR5PRDtGRWMlRNjZf26eilqJAktTGluyw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5354ebb9-6ef0-4b0a-901a-08df042609fd
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 10:29:13.5139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c6qWrPABHRyXO4W28a2qDGnVR2arYDkxWhUrVDrJgUSMy3Mm9SY4MKSLHcQxpIZZMuuIxrUBAExdtiRBkzRPvieZf+v2ESsd5LiMXzqa60M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4536
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

Modify the GuC identifier manager so that it distinguishes between
usable GuC IDs allocated for GuC submissions, and shareable those that
can be shared with VFs. Both pools are represented as a single bitmap
and may overlap.
Let's Replace the single-pool accounting model with separate usable and
shareable pools, add helpers for pool accounting and limits, and update
debug reporting.

For now, let's keep the current allocation behaviour by mapping both pools
onto the same GuC ID space. This prepares the ID manager for separate
management of submission IDs and VF allocations in following changes.

v2: Do not change how VF IDs are allocated in the legacy path (Sashiko)

v3: Fix shareable spare quota accounting to include
    PF-exclusive usable IDs.

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c |  57 +--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   2 +-
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 445 ++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  20 +-
 drivers/gpu/drm/xe/xe_guc_types.h             |   8 +-
 5 files changed, 410 insertions(+), 122 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
index ee30a1939eb0..78d3de46b757 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
@@ -24,8 +24,8 @@ static void bad_init(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
 
-	KUNIT_EXPECT_EQ(test, -EINVAL, xe_guc_id_mgr_init(idm, 0));
-	KUNIT_EXPECT_EQ(test, -ERANGE, xe_guc_id_mgr_init(idm, GUC_ID_MAX + 1));
+	KUNIT_EXPECT_EQ(test, -EINVAL, idm_init(idm, 0, 0));
+	KUNIT_EXPECT_EQ(test, -ERANGE, idm_init(idm, GUC_ID_MAX + 1, 0));
 }
 
 static void no_init(struct kunit *test)
@@ -43,12 +43,12 @@ static void init_fini(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, -1));
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, 0));
 	KUNIT_EXPECT_NOT_NULL(test, idm->bitmap);
-	KUNIT_EXPECT_EQ(test, idm->total, GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), GUC_ID_MAX);
 	__fini_idm(NULL, idm);
 	KUNIT_EXPECT_NULL(test, idm->bitmap);
-	KUNIT_EXPECT_EQ(test, idm->total, 0);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), 0);
 }
 
 static void check_used(struct kunit *test)
@@ -56,19 +56,19 @@ static void check_used(struct kunit *test)
 	struct xe_guc_id_mgr *idm = test->priv;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, 2));
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 2, 0));
 
 	mutex_lock(idm_mutex(idm));
 
-	for (n = 0; n < idm->total; n++) {
+	for (n = 0; n < idm_total(idm); n++) {
 		kunit_info(test, "n=%u", n);
-		KUNIT_EXPECT_EQ(test, idm->used, n);
-		KUNIT_EXPECT_GE(test, idm_reserve_chunk_locked(idm, 1, 0), 0);
-		KUNIT_EXPECT_EQ(test, idm->used, n + 1);
+		KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), n);
+		KUNIT_EXPECT_GE(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), 0);
+		KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), n + 1);
 	}
-	KUNIT_EXPECT_EQ(test, idm->used, idm->total);
-	idm_release_chunk_locked(idm, 0, idm->used);
-	KUNIT_EXPECT_EQ(test, idm->used, 0);
+	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), idm_total(idm));
+	idm_release_chunk_locked(idm, 0, idm_total(idm));
+	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), 0);
 
 	mutex_unlock(idm_mutex(idm));
 }
@@ -76,25 +76,12 @@ static void check_used(struct kunit *test)
 static void check_quota(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
-	unsigned int n;
-
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, 2));
 
-	mutex_lock(idm_mutex(idm));
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 2, 0));
 
-	for (n = 0; n < idm->total - 1; n++) {
-		kunit_info(test, "n=%u", n);
-		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, 1, idm->total), -EDQUOT);
-		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, 1, idm->total - n), -EDQUOT);
-		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, idm->total - n, 1), -EDQUOT);
-		KUNIT_EXPECT_GE(test, idm_reserve_chunk_locked(idm, 1, 1), 0);
-	}
-	KUNIT_EXPECT_LE(test, 0, idm_reserve_chunk_locked(idm, 1, 0));
-	KUNIT_EXPECT_EQ(test, idm->used, idm->total);
-	idm_release_chunk_locked(idm, 0, idm->total);
-	KUNIT_EXPECT_EQ(test, idm->used, 0);
-
-	mutex_unlock(idm_mutex(idm));
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 2), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 1), -ENOSPC);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable(idm, 0, 2), 0);
 }
 
 static void check_all(struct kunit *test)
@@ -102,14 +89,14 @@ static void check_all(struct kunit *test)
 	struct xe_guc_id_mgr *idm = test->priv;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, -1));
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, 0));
 
 	mutex_lock(idm_mutex(idm));
 
-	for (n = 0; n < idm->total; n++)
-		KUNIT_EXPECT_LE(test, 0, idm_reserve_chunk_locked(idm, 1, 0));
-	KUNIT_EXPECT_EQ(test, idm->used, idm->total);
-	for (n = 0; n < idm->total; n++)
+	for (n = 0; n < idm_total(idm); n++)
+		KUNIT_EXPECT_LE(test, 0, xe_guc_id_mgr_reserve_usable_locked(idm, 1));
+	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), idm_total(idm));
+	for (n = 0; n < idm_total(idm); n++)
 		idm_release_chunk_locked(idm, n, 1);
 
 	mutex_unlock(idm_mutex(idm));
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index be0a413ee17c..9445e5f32fe8 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1182,7 +1182,7 @@ static u32 pf_estimate_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
 {
 	struct xe_guc_id_mgr *idm = &gt->uc.guc.submission_state.idm;
 	u32 spare = pf_get_spare_ctxs(gt);
-	u32 fair = (idm->total - spare) / num_vfs;
+	u32 fair = (xe_guc_id_mgr_max_usable(idm) - spare) / num_vfs;
 	int ret;
 
 	for (; fair; --fair) {
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
index e845425d670b..2c181d280552 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
@@ -34,6 +34,34 @@ static struct xe_device *idm_to_xe(struct xe_guc_id_mgr *idm)
 
 static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent);
 
+static unsigned int idm_total(struct xe_guc_id_mgr *idm)
+{
+	if (idm->usable > GUC_ID_MAX - idm->shareable)
+		return GUC_ID_MAX;
+
+	return idm->usable + idm->shareable;
+}
+
+static unsigned int idm_shareable_start(struct xe_guc_id_mgr *idm)
+{
+	return idm_total(idm) - idm->shareable;
+}
+
+static unsigned int idm_used_usable(struct xe_guc_id_mgr *idm)
+{
+	lockdep_assert_held(idm_mutex(idm));
+
+	return bitmap_weight(idm->bitmap, idm->usable);
+}
+
+static unsigned int idm_used_shareable(struct xe_guc_id_mgr *idm)
+{
+	lockdep_assert_held(idm_mutex(idm));
+
+	return bitmap_weight(idm->bitmap, idm_total(idm)) -
+	       bitmap_weight(idm->bitmap, idm_shareable_start(idm));
+}
+
 static void __fini_idm(struct drm_device *drm, void *arg)
 {
 	struct xe_guc_id_mgr *idm = arg;
@@ -41,25 +69,60 @@ static void __fini_idm(struct drm_device *drm, void *arg)
 	mutex_lock(idm_mutex(idm));
 
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
-		unsigned int weight = bitmap_weight(idm->bitmap, idm->total);
+		unsigned int weight = bitmap_weight(idm->bitmap, idm_total(idm));
 
 		if (weight) {
 			struct drm_printer p = xe_gt_info_printer(idm_to_gt(idm));
 
 			xe_gt_err(idm_to_gt(idm), "GUC ID manager unclean (%u/%u)\n",
-				  weight, idm->total);
+				  weight, idm_total(idm));
 			idm_print_locked(idm, &p, 1);
 		}
 	}
 
 	bitmap_free(idm->bitmap);
 	idm->bitmap = NULL;
-	idm->total = 0;
-	idm->used = 0;
+	idm->usable = 0;
+	idm->shareable = 0;
 
 	mutex_unlock(idm_mutex(idm));
 }
 
+static int idm_init(struct xe_guc_id_mgr *idm, unsigned int usable, unsigned int shareable)
+{
+	bool overlap = usable > GUC_ID_MAX - shareable;
+	unsigned int total;
+	int ret;
+
+	if (!usable)
+		return -EINVAL;
+	if (usable > GUC_ID_MAX)
+		return -ERANGE;
+	if (shareable > GUC_ID_MAX)
+		return -ERANGE;
+
+	idm_assert(idm, !idm->bitmap);
+	idm_assert(idm, usable <= GUC_ID_MAX);
+	idm_assert(idm, shareable <= GUC_ID_MAX);
+	idm_assert(idm, !shareable || IS_SRIOV_PF(idm_to_xe(idm)));
+	total = overlap ? GUC_ID_MAX : usable + shareable;
+
+	idm->bitmap = bitmap_zalloc(total, GFP_KERNEL);
+	if (!idm->bitmap)
+		return -ENOMEM;
+
+	idm->usable = usable;
+	idm->shareable = shareable;
+
+	ret = drmm_add_action_or_reset(&idm_to_xe(idm)->drm, __fini_idm, idm);
+	if (ret)
+		return ret;
+
+	xe_gt_dbg(idm_to_gt(idm), "using %u GuC ID%s, %u GuC ID%s shareable with VFs\n",
+		  idm->usable, str_plural(idm->usable), idm->shareable, str_plural(idm->shareable));
+	return 0;
+}
+
 /**
  * xe_guc_id_mgr_init() - Initialize GuC context ID Manager.
  * @idm: the &xe_guc_id_mgr to initialize
@@ -68,19 +131,10 @@ static void __fini_idm(struct drm_device *drm, void *arg)
  * The bare-metal or PF driver can pass ~0 as &limit to indicate that all
  * context IDs supported by the GuC firmware are available for use.
  *
- * Only VF drivers will have to provide explicit number of context IDs
- * that they can use.
- *
  * Return: 0 on success or a negative error code on failure.
  */
 int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
 {
-	int ret;
-
-	idm_assert(idm, !idm->bitmap);
-	idm_assert(idm, !idm->total);
-	idm_assert(idm, !idm->used);
-
 	if (limit == ~0)
 		limit = GUC_ID_MAX;
 	else if (limit > GUC_ID_MAX)
@@ -88,70 +142,149 @@ int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
 	else if (!limit)
 		return -EINVAL;
 
-	idm->bitmap = bitmap_zalloc(limit, GFP_KERNEL);
-	if (!idm->bitmap)
-		return -ENOMEM;
-	idm->total = limit;
+	return idm_init(idm, limit, 0);
+}
 
-	ret = drmm_add_action_or_reset(&idm_to_xe(idm)->drm, __fini_idm, idm);
-	if (ret)
-		return ret;
+/**
+ * xe_guc_id_mgr_max_usable() - Get maximum number of usable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr to query
+ *
+ * Return: maximum number of GuC context IDs that can be used by @idm for GuC submission.
+ */
+unsigned int xe_guc_id_mgr_max_usable(struct xe_guc_id_mgr *idm)
+{
+	return idm->usable;
+}
 
-	xe_gt_dbg(idm_to_gt(idm), "using %u GuC ID%s\n",
-		  idm->total, str_plural(idm->total));
-	return 0;
+/**
+ * xe_guc_id_mgr_max_shareable() - Get maximum number of shareable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr to query
+ *
+ * Return: maximum number of GuC context IDs that can be shared with VFs.
+ */
+unsigned int xe_guc_id_mgr_max_shareable(struct xe_guc_id_mgr *idm)
+{
+	return idm->shareable;
 }
 
-static unsigned int find_last_zero_area(unsigned long *bitmap,
-					unsigned int total,
-					unsigned int count)
+static int idm_reserve_chunk_usable_locked(struct xe_guc_id_mgr *idm, unsigned int count)
+{
+	int id;
+
+	idm_assert(idm, count);
+	lockdep_assert_held(idm_mutex(idm));
+
+	if (!idm->usable)
+		return -ENODATA;
+
+	id = bitmap_find_next_zero_area(idm->bitmap, idm->usable, 0, count, 0);
+	if (id >= idm->usable)
+		return -ENOSPC;
+
+	bitmap_set(idm->bitmap, id, count);
+
+	return id;
+}
+
+static unsigned int idm_find_last_zero_area_in_range(unsigned long *bitmap,
+						     unsigned int range_start,
+						     unsigned int range_end,
+						     unsigned int count)
 {
-	unsigned int found = total;
-	unsigned int rs, re, range;
+	unsigned int found = range_end;
+	unsigned int rs, re;
+
+	for_each_clear_bitrange(rs, re, bitmap, range_end) {
+		unsigned int start = max(rs, range_start);
+		unsigned int end = min(re, range_end);
+		unsigned int range;
 
-	for_each_clear_bitrange(rs, re, bitmap, total) {
-		range = re - rs;
+		if (start >= end)
+			continue;
+
+		range = end - start;
 		if (range < count)
 			continue;
-		found = rs + (range - count);
+
+		found = start + (range - count);
 	}
+
 	return found;
 }
 
-static int idm_reserve_chunk_locked(struct xe_guc_id_mgr *idm,
-				    unsigned int count, unsigned int retain)
+static int idm_reserve_chunk_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int count,
+					      unsigned int spare)
 {
+	unsigned int shareable_start = idm_shareable_start(idm);
+	unsigned int total = idm_total(idm);
 	int id;
 
 	idm_assert(idm, count);
 	lockdep_assert_held(idm_mutex(idm));
 
-	if (!idm->total)
+	if (!idm->shareable)
 		return -ENODATA;
 
-	if (retain) {
+	if (shareable_start < idm->usable) {
 		/*
-		 * For IDs reservations (used on PF for VFs) we want to make
-		 * sure there will be at least 'retain' available for the PF
+		 * Spare is meaningful only for IDs that are shared between usable and
+		 * shareable pools. For non-overlapping pools, shareable reservations do
+		 * not reduce PF usable capacity, so there is nothing to retain.
 		 */
-		if (idm->used + count + retain > idm->total)
+		id = idm_find_last_zero_area_in_range(idm->bitmap, shareable_start, total, count);
+		if (id >= total)
+			return -ENOSPC;
+
+		if (spare) {
+			unsigned int used_usable = bitmap_weight(idm->bitmap, idm->usable);
+			unsigned int overlap_start = max_t(int, id, shareable_start);
+			unsigned int overlap_end = min(id + count, idm->usable);
+			unsigned int need_overlap = overlap_end > overlap_start ?
+						    overlap_end - overlap_start : 0;
+
+			if (used_usable + need_overlap + spare > idm->usable)
+				return -EDQUOT;
+		}
+	} else {
+		id = bitmap_find_next_zero_area(idm->bitmap, total, shareable_start, count, 0);
+		if (id + count > total)
+			return -ENOSPC;
+		if (id < shareable_start)
+			return -ENOSPC;
+	}
+
+	bitmap_set(idm->bitmap, id, count);
+
+	return id;
+}
+
+static int idm_reserve_chunk_locked(struct xe_guc_id_mgr *idm, unsigned int count,
+				    unsigned int retain)
+{
+	unsigned int total = idm_total(idm);
+	int id;
+
+	idm_assert(idm, count);
+	lockdep_assert_held(idm_mutex(idm));
+
+	if (!total)
+		return -ENODATA;
+
+	if (retain) {
+		unsigned int used = bitmap_weight(idm->bitmap, total);
+
+		if (used + count + retain > total)
 			return -EDQUOT;
-		/*
-		 * ... and we want to reserve highest IDs close to the end.
-		 */
-		id = find_last_zero_area(idm->bitmap, idm->total, count);
+
+		id = idm_find_last_zero_area_in_range(idm->bitmap, 0, total, count);
 	} else {
-		/*
-		 * For regular IDs reservations (used by submission code)
-		 * we start searching from the lower range of IDs.
-		 */
-		id = bitmap_find_next_zero_area(idm->bitmap, idm->total, 0, count, 0);
+		id = bitmap_find_next_zero_area(idm->bitmap, total, 0, count, 0);
 	}
-	if (id >= idm->total)
+
+	if (id >= total)
 		return -ENOSPC;
 
 	bitmap_set(idm->bitmap, id, count);
-	idm->used += count;
 
 	return id;
 }
@@ -160,9 +293,8 @@ static void idm_release_chunk_locked(struct xe_guc_id_mgr *idm,
 				     unsigned int start, unsigned int count)
 {
 	idm_assert(idm, count);
-	idm_assert(idm, count <= idm->used);
-	idm_assert(idm, start < idm->total);
-	idm_assert(idm, start + count - 1 < idm->total);
+	idm_assert(idm, start < idm_total(idm));
+	idm_assert(idm, start + count - 1 < idm_total(idm));
 	lockdep_assert_held(idm_mutex(idm));
 
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
@@ -172,22 +304,61 @@ static void idm_release_chunk_locked(struct xe_guc_id_mgr *idm,
 			idm_assert(idm, test_bit(start + n, idm->bitmap));
 	}
 	bitmap_clear(idm->bitmap, start, count);
-	idm->used -= count;
+}
+
+static int idm_release_chunk_in_range_locked(struct xe_guc_id_mgr *idm,
+					     unsigned int start,
+					     unsigned int count,
+					     unsigned int range_start,
+					     unsigned int range_end)
+{
+	lockdep_assert_held(idm_mutex(idm));
+
+	if (!count)
+		return -EINVAL;
+
+	if (start < range_start || start >= range_end)
+		return -ERANGE;
+
+	if (count > range_end - start)
+		return -ERANGE;
+
+	idm_release_chunk_locked(idm, start, count);
+
+	return 0;
 }
 
 /**
- * xe_guc_id_mgr_reserve_locked() - Reserve one or more GuC context IDs.
+ * xe_guc_id_mgr_reserve_usable_locked() - Reserve one or more usable GuC context IDs.
  * @idm: the &xe_guc_id_mgr
- * @count: number of IDs to allocate (can't be 0)
+ * @count: number of usable GuC context IDs to reserve (can't be 0)
  *
- * This function is dedicated for the use by the GuC submission code,
- * where submission lock is already taken.
+ * This function is dedicated for use by the GuC submission code when the
+ * submission lock is already held.
  *
  * Return: ID of allocated GuC context or a negative error code on failure.
  */
-int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count)
+int xe_guc_id_mgr_reserve_usable_locked(struct xe_guc_id_mgr *idm, unsigned int count)
 {
-	return idm_reserve_chunk_locked(idm, count, 0);
+	return idm_reserve_chunk_usable_locked(idm, count);
+}
+
+/**
+ * xe_guc_id_mgr_reserve_shareable_locked() - Reserve one or more shareable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @count: number of shareable GuC context IDs to reserve (can't be 0)
+ * @spare: number of usable IDs to keep available for the PF
+ *
+ * This function is dedicated for use by the PF driver, which expects the
+ * reserved range of IDs to be contiguous. The function expects that the
+ * caller has already taken the lock.
+ *
+ * Return: ID of allocated GuC context or a negative error code on failure.
+ */
+int xe_guc_id_mgr_reserve_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int count,
+					   unsigned int spare)
+{
+	return idm_reserve_chunk_shareable_locked(idm, count, spare);
 }
 
 /**
@@ -206,60 +377,175 @@ void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id,
 }
 
 /**
- * xe_guc_id_mgr_reserve() - Reserve a range of GuC context IDs.
+ * xe_guc_id_mgr_release_usable_locked() - Release one or more usable GuC context IDs.
  * @idm: the &xe_guc_id_mgr
- * @count: number of GuC context IDs to reserve (can't be 0)
- * @retain: number of GuC context IDs to keep available (can't be 0)
+ * @id: the first usable GuC context ID to release
+ * @count: number of usable GuC context IDs to release
+ *
+ * This function is dedicated for use by the GuC submission code when the
+ * submission lock is already held.
  *
- * This function is dedicated for the use by the PF driver which expects that
- * reserved range of IDs will be contiguous and that there will be at least
- * &retain IDs still available for the PF after this reservation.
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_release_usable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
+					unsigned int count)
+{
+	return idm_release_chunk_in_range_locked(idm, id, count, 0, idm->usable);
+}
+
+/**
+ * xe_guc_id_mgr_release_shareable_locked() - Release one or more shareable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @id: the first shareable GuC context ID to release
+ * @count: number of shareable GuC context IDs to release
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_release_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
+					   unsigned int count)
+{
+	return idm_release_chunk_in_range_locked(idm, id, count,
+						 idm_shareable_start(idm), idm_total(idm));
+}
+
+/**
+ * xe_guc_id_mgr_reserve_usable() - Reserve one or more usable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @count: number of usable GuC context IDs to reserve (can't be 0)
+ *
+ * Return: ID of allocated GuC context or a negative error code on failure.
+ */
+int xe_guc_id_mgr_reserve_usable(struct xe_guc_id_mgr *idm, unsigned int count)
+{
+	guard(mutex)(idm_mutex(idm));
+
+	idm_assert(idm, count);
+
+	return idm_reserve_chunk_usable_locked(idm, count);
+}
+
+/**
+ * xe_guc_id_mgr_reserve_shareable() - Reserve one or more shareable GuC context IDs for VFs.
+ * @idm: the &xe_guc_id_mgr
+ * @count: number of shareable GuC context IDs to reserve (can't be 0)
+ * @spare: number of usable IDs to keep available for the PF
+ *
+ * This function is dedicated for use by the PF driver, which expects the
+ * reserved range of IDs to be contiguous.
  *
  * Return: starting ID of the allocated GuC context ID range or
  *         a negative error code on failure.
  */
-int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm,
-			  unsigned int count, unsigned int retain)
+int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int count,
+				    unsigned int spare)
+{
+	guard(mutex)(idm_mutex(idm));
+
+	idm_assert(idm, count);
+
+	return idm_reserve_chunk_shareable_locked(idm, count, spare);
+}
+
+int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count)
+{
+	return idm_reserve_chunk_locked(idm, count, 0);
+}
+
+int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count,
+			  unsigned int retain)
 {
 	int ret;
 
 	idm_assert(idm, count);
 	idm_assert(idm, retain);
 
-	mutex_lock(idm_mutex(idm));
+	guard(mutex)(idm_mutex(idm));
 	ret = idm_reserve_chunk_locked(idm, count, retain);
-	mutex_unlock(idm_mutex(idm));
 
 	return ret;
 }
 
 /**
- * xe_guc_id_mgr_release() - Release a range of GuC context IDs.
+ * xe_guc_id_mgr_release() - Release one or more GuC context IDs.
  * @idm: the &xe_guc_id_mgr
- * @start: the starting ID of GuC context range to release
+ * @start: the first GuC context ID to release
  * @count: number of GuC context IDs to release
  */
 void xe_guc_id_mgr_release(struct xe_guc_id_mgr *idm,
 			   unsigned int start, unsigned int count)
 {
-	mutex_lock(idm_mutex(idm));
+	guard(mutex)(idm_mutex(idm));
+
 	idm_release_chunk_locked(idm, start, count);
-	mutex_unlock(idm_mutex(idm));
 }
 
-static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
+/**
+ * xe_guc_id_mgr_release_usable() - Release one or more usable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @id: the first usable GuC context ID to release
+ * @count: number of usable GuC context IDs to release
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_release_usable(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count)
+{
+	guard(mutex)(idm_mutex(idm));
+
+	return xe_guc_id_mgr_release_usable_locked(idm, id, count);
+}
+
+/**
+ * xe_guc_id_mgr_release_shareable() - Release one or more shareable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @id: the first shareable GuC context ID to release
+ * @count: number of shareable GuC context IDs to release
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_release_shareable(struct xe_guc_id_mgr *idm, unsigned int id,
+				    unsigned int count)
+{
+	guard(mutex)(idm_mutex(idm));
+
+	return xe_guc_id_mgr_release_shareable_locked(idm, id, count);
+}
+
+static void idm_print_range_locked(struct xe_guc_id_mgr *idm,
+				   struct drm_printer *p,
+				   int indent,
+				   const char *name,
+				   unsigned int range_start,
+				   unsigned int range_end,
+				   unsigned int used)
 {
 	unsigned int rs, re;
 
 	lockdep_assert_held(idm_mutex(idm));
 
-	drm_printf_indent(p, indent, "total %u\n", idm->total);
+	drm_printf_indent(p, indent, "%s used %u\n", name, used);
+	for_each_set_bitrange(rs, re, idm->bitmap, range_end) {
+		rs = max(rs, range_start);
+		re = min(re, range_end);
+
+		if (rs < re)
+			drm_printf_indent(p, indent, "%s range %u..%u (%u)\n",
+					  name, rs, re - 1, re - rs);
+	}
+}
+
+static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
+{
+	lockdep_assert_held(idm_mutex(idm));
+
+	drm_printf_indent(p, indent, "total %u\n", idm_total(idm));
 	if (!idm->bitmap)
 		return;
 
-	drm_printf_indent(p, indent, "used %u\n", idm->used);
-	for_each_set_bitrange(rs, re, idm->bitmap, idm->total)
-		drm_printf_indent(p, indent, "range %u..%u (%u)\n", rs, re - 1, re - rs);
+	idm_print_range_locked(idm, p, indent, "usable", 0, idm->usable,
+			       idm_used_usable(idm));
+	idm_print_range_locked(idm, p, indent, "shareable",
+			       idm_shareable_start(idm), idm_total(idm),
+			       idm_used_shareable(idm));
 }
 
 /**
@@ -270,9 +556,8 @@ static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, i
  */
 void xe_guc_id_mgr_print(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
 {
-	mutex_lock(idm_mutex(idm));
+	guard(mutex)(idm_mutex(idm));
 	idm_print_locked(idm, p, indent);
-	mutex_unlock(idm_mutex(idm));
 }
 
 #if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
index 368f8c80e4c7..209f99831f1b 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
@@ -9,13 +9,29 @@
 struct drm_printer;
 struct xe_guc_id_mgr;
 
-int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int count);
+int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit);
 
+unsigned int xe_guc_id_mgr_max_usable(struct xe_guc_id_mgr *idm);
+unsigned int xe_guc_id_mgr_max_shareable(struct xe_guc_id_mgr *idm);
+
+int xe_guc_id_mgr_reserve_usable_locked(struct xe_guc_id_mgr *idm, unsigned int count);
+int xe_guc_id_mgr_reserve_usable(struct xe_guc_id_mgr *idm, unsigned int count);
+int xe_guc_id_mgr_reserve_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int count,
+					   unsigned int spare);
+int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int count,
+				    unsigned int spare);
 int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count);
+int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count, unsigned int retain);
 void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count);
+int xe_guc_id_mgr_release_usable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
+					unsigned int count);
+int xe_guc_id_mgr_release_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
+					   unsigned int count);
 
-int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count, unsigned int retain);
 void xe_guc_id_mgr_release(struct xe_guc_id_mgr *idm, unsigned int start, unsigned int count);
+int xe_guc_id_mgr_release_usable(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count);
+int xe_guc_id_mgr_release_shareable(struct xe_guc_id_mgr *idm, unsigned int id,
+				    unsigned int count);
 
 void xe_guc_id_mgr_print(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index 3dbcb1331690..6da43691e54c 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -42,10 +42,10 @@ struct xe_guc_db_mgr {
 struct xe_guc_id_mgr {
 	/** @bitmap: bitmap to track allocated IDs */
 	unsigned long *bitmap;
-	/** @total: total number of IDs being managed */
-	unsigned int total;
-	/** @used: number of IDs currently in use */
-	unsigned int used;
+	/** @usable: number of IDs being managed for GuC submission */
+	unsigned int usable;
+	/** @shareable: number of IDs that can be shared with VFs */
+	unsigned int shareable;
 };
 
 /**
-- 
2.34.1

