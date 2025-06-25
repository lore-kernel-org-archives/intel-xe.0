Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BE0C7EE2A
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 15:02:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF2010E757;
	Wed, 25 Jun 2025 15:02:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UQ6HL4rO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4B710E756
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 15:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750863733; x=1782399733;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zT4rSB5dAWJuucPyP+/tWshWqZVajtrGyu2yQtx51GQ=;
 b=UQ6HL4rOQ6q/kFYQkzngBcsjnQ4OPx+MYVdkBQlUhDlejtc/l3sQ3RnY
 ikTF4bV7cceTRo1lpgkkijuu3G2zz8s2gjQ1E6uQU8yLV1J8nqNJJRYFa
 twV7PRgT4bQZPKt0zc5zBFgqcKUnoWq8s1H4QPJ8OsYYppIdhvHel88Xy
 FbwCKOrPntSbZEemwtmn+6DsjFvdaz1B4t6y95xJbJifDOdpcu5eVPsqN
 hzsUBdb4RUE2rJT4TypJqtSh12jL2CrmUEzXkZHFSzD0YPFCj/PiQukCo
 hbakFU+wnNYX2EVWlLVSyyUrRSTcLfV+LpuAgdVl/jbj1z21qqBxSzfUQ w==;
X-CSE-ConnectionGUID: W6T/O5VGROu439EiNOXDbw==
X-CSE-MsgGUID: PWwyvFOlSt6qigNFTb3Dkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="78566782"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="78566782"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 08:02:06 -0700
X-CSE-ConnectionGUID: /GOePqjQTaeZFSbDm0nFLA==
X-CSE-MsgGUID: E7EnYM3pQEGWplMErjotTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="151670723"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 08:02:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 08:02:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 08:02:05 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 08:02:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CJSEoywXLkdPUcKPuWQOhGoctm0E32REal0mfH1ynUake6HQF8WemYEkKYDn7+Y3ffhL2bJ8eONOAB8Q6BmOXJ38cZix6Vuh4VZ9xMmShL8YYkBcLNP15SCPMBJRLNsOBkfYRxEOZIwqE7EmTMArRUk7k3kT7vHAnYzQU1Cn9Sbe/hcZr4GRJ8IU7dCdSezlUo/OVQrov3PZxsZg5xoJg0XbOAnJI4TQ48OMlttdDQJUwXnw/F6vi5YZREeyphQRVfSA4809pw2aNZoYbVxe90gzk6L+/h6O3OVtVGrY1IzuVl5OCPxWclR+P2fEOM5mTUmL5wIBSA/ePCaA5KgLSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USH+YgURMkjfMbzD5bPWYo5DSNwa9VyZnJy4vbwDTfY=;
 b=l/TS/GLP1V1rKe/aPEpHBAWqhiKqWVimU6xW3TRJhk5MqF6V8+X9UqHasTCfTGIdlkbBFLUiyze63p2LdwkHLnkLqCmuarIaYudd6ULNz4l6W5sFNa+3D458ePWMekhI0pI6OkpeveT//kdZVAA5ITJg2kvYtqZGaBIILJYKp0konjq9ssUziSlblnPdBLEEtfDNGpMn9rytuK3avIDqu529Bh6HTSn1ws2gVUdzhK/QeNfYw8PSSPyGEYAufs5myTfa/dk7vbBlnvZVHe7c1gntd2oqMRyP6hjZQlPiYCOa+dAtpwJA4Ffwkq3cvwpFfqXw/l3KF6LBL8/05Z5mLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by IA4PR11MB9130.namprd11.prod.outlook.com (2603:10b6:208:56c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Wed, 25 Jun
 2025 15:01:35 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Wed, 25 Jun 2025
 15:01:35 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>
Subject: [PATCH v5 1/4] drm/xe: Use devm_ioremap_wc for VRAM mapping and drop
 manual unmap
Date: Wed, 25 Jun 2025 17:01:13 +0200
Message-ID: <20250625150116.3166615-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625150116.3166615-1-piotr.piorkowski@intel.com>
References: <20250625150116.3166615-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0452.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::7) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|IA4PR11MB9130:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e444af3-12b9-47e5-1826-08ddb3f92d9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N09FNXZ4NGZaZ3Z1T0JOMG5nWnN1MnVIUUlBOW9idGRaOC9BVVBQZXg5K2E2?=
 =?utf-8?B?My9MT3QxY1JIVVYyUngyUG9qRnhGOERlQ0VJWWsyRjF5c2J3L05rN096d3M2?=
 =?utf-8?B?UVpwQkJUYnJZV0ZSdHk3UHZnS2Z3L0tEbzFkeXppSEZSNHJ5cmErVm9ucjAz?=
 =?utf-8?B?TUdaNU5wd2hKZnc4OXJSQ0ZrZkNJSkVsNUkxK3k3RDdTeWllaUUxRjJxV3Z5?=
 =?utf-8?B?ZFdPc04rTHVmKzNsdWpRNVJZU2dkVEtYajFySEhjaEVVZXNDNjBqNGwxUm9m?=
 =?utf-8?B?Z25yNU9FbkVaQ1FGQ1hydkVKMzFWc1l6Skh0WUt3djF1UUJ6RnpIZ1h0R0h0?=
 =?utf-8?B?QmxWMWFhZS8xT0dZdmdrbWZNaTIzQzRzWnVOOWV4T3RpTGpjeXAxZU5JNDNu?=
 =?utf-8?B?QzRLZkwyWHVQL0paa296eDlneUg2VHhRSjN5alFhM0gvRTBCMVQ0WXVwNFV3?=
 =?utf-8?B?NHZZTmhTemNpM0s4VW5IRmtjNEhQa2VQSmQvZ3o3NTcycG1hYjhsOW9UUyt1?=
 =?utf-8?B?NURxWmY0WFBLZmVUU2ZaZEpXZlByWVhFZnZYSUZrSHJXZ0xUUWMrMFR1Yi9i?=
 =?utf-8?B?M3diR3RkUVdmcDI3b0xkbmxKY3lLTktJQ3VQd3JGcURGcHNRa1o1bkZpcUF2?=
 =?utf-8?B?eEZaVVduR0xIUlRZQW5BWkxESEV1WTkxNFhmQjFPUmgyZ3hWQzg5dCtwa0g4?=
 =?utf-8?B?QUdNUmZDRE9vQnM4YzdkeTRkVVoxeWJtck5MdzdRYVRaa3JWUTljOEFzUDhE?=
 =?utf-8?B?VnJjY0h1bExQOE80Wnp6QVkrNFN3bUFZYkNzc3VzM2pMeEZXUXdxRGVTNmh4?=
 =?utf-8?B?bWxSMloxY3JobDVpdEh0NFNqNWVOOFhudzVhVXo0UmJHdGV2cExLeGUvYVJC?=
 =?utf-8?B?Nll0THliZFF1YlNxSVpNbVhEUENkbjRad0ZSTStXK0xPOTNhRy9mNVF1ZTlm?=
 =?utf-8?B?V0pDaEsybEpJQnN2NnBuWlpDRVpBYklLVFBVN3c3V2hOc2NXcVFPTnVyMVRa?=
 =?utf-8?B?SitNWVpTSnArcDJNYmVZcHdMRVlROG5VTTFKWGVHbCtGblZUUHhnTHpkUThY?=
 =?utf-8?B?SWhEeDlta09PMzlGT3hvNTBrb0JoSzhCUTV0QUVFS1VOMCtrZG1mTHNHWWNs?=
 =?utf-8?B?ZTdoZEZDV1Zwc1hCTjZKMVNOTjgvdWdqOFVlaS9IY2xlUS9EbHFNQXhtWUVv?=
 =?utf-8?B?MFcybitLeDg1ZFNLOGxGdkRLODJ2bHlXR0ZZV2taaC9YcFRGU0RWMkdzZkha?=
 =?utf-8?B?WjFCcWw4WmhINVVPTHlkQXBTODRQODMxR3BIcVRxV09tWFJRWmxScjEwaXJr?=
 =?utf-8?B?dWlXSnFweFJNT2xyTGZwa1lpYjJGZTN0c3R3bmJ5WVB1Q3F0bWtPY2JBRUIz?=
 =?utf-8?B?R0pCWHdkVVlHRkpJWitqL2JSTzZlV2s0Y2s1TEZoTXM2RDdpZVFlbXpPSWJa?=
 =?utf-8?B?NGt1V2ZuZ2trWkpodE9SYTVuUHdUV0hPUzN0MXZiVDFldVhqekNFZXA3OXQz?=
 =?utf-8?B?d3FSSDBYQ3k5MXFaL1k1NUtKTXQzVS9wNEdiMXdHb2FuT2lBWHNmeDlzK0hQ?=
 =?utf-8?B?NFJ1M01DWjRSV3JhZEM1d3FCbUVqd2FXVitYanRGODg0eVl4NkNaNHBDWTFS?=
 =?utf-8?B?dWozSk5WeHpXTHY1cGwzdndpV3M4SzlTbWdMeWZteStzWVB2Qm1hVUtXYU9t?=
 =?utf-8?B?azFsZ2o1YVF5RWFHSml1MzFTMDFOekJkUmY2OU02dTFDUHAxUWtJSEp2RjhQ?=
 =?utf-8?B?ZmdZVldQbDhJWlZVQUY5RXFCT2FLWGRIeExVQUMxdTFiWnhCMmVyeUV6UHN4?=
 =?utf-8?B?Q1plOTI5SEd0VFZOd3hNT1lraXFOaEx2eWtSVWJSeGI0ZUt6Q2FrMkprd094?=
 =?utf-8?B?V1dlcEpsZzZYd3dpWWlRMkh3bSs4Rml6U0RMTkZxYWV5M0wwalF5aEJwbkJI?=
 =?utf-8?Q?ViUpzG8062U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0V4UGx5Z3F2aExYMTZNOEFOSzJzc014QlNVcm5CbENJSjNJRXJBdjd5Z1NP?=
 =?utf-8?B?R0ZqQ2NGenQ4dXYyblBCWllLaXduWHMyYnRicEJ4YTJBQ1k5OEpTSnM5T21I?=
 =?utf-8?B?cEswRUFjL0NKSE5CSmt4TkM0dVFQL1N3djNaZVlmQXpCQU9Fb2puVG9iQ2V3?=
 =?utf-8?B?UytLOFVvQk9LUlBoNldBTGhXZkdEakhONnM5eWNaQXYxb2JjdmhRejJNZ0VV?=
 =?utf-8?B?NG80M0xzV1lDc0JzaTZCdjZDUmc3cTBiTFRWUzdRMGlPLzFMRS9hNTFtaXN4?=
 =?utf-8?B?VzZYcTFCYWpTNE0xQjQzYlAwMEVrcFIzMFNUSEc0YTF3R0kwNlVSZFl5QXJm?=
 =?utf-8?B?cnJ5UE5rZDd3dnQxZlpibHZ5bnpVNkhBMlJ2a3Y0bVRhL1hyTHdCOEw5L1dV?=
 =?utf-8?B?OTZuTWY1UC9nMkplaG01eUp5T29LdmVrUDJFVDVQekVSNGNnaS8yRFY1Mkwy?=
 =?utf-8?B?ZXVvTlFESlhtV1NIWU4zUDdVc3VidXpQS29oTWFkQzFBQ29ISThidFdjcy90?=
 =?utf-8?B?VlNJdHZFTDZ6elcxWkNnN1hkMkV0ZHh1dDVxWWJNOHFoZm9vNHhNWjZwYWpV?=
 =?utf-8?B?Y08rNEFPdGVrbHdVcEpmVHcyWFQ3TnhrZit1L2c2REhxa1p6dXNtSUp4ZnZy?=
 =?utf-8?B?VWFyQUhkNkVsUlA4LzhoUzgyMlpzS1hIeDhhTlcxazJnK3lVbHB6MUtDOVhH?=
 =?utf-8?B?akptbG9TVE9IZE80eWJ5RHZMZ3F0akdKOVpnZjZ4anNtQlltYjRuOHQ4UU1P?=
 =?utf-8?B?ZkJVV1JMODBIUVhzdmdPWExVR29kVHVWa0FwamtLajB4N2hJR3ZtNjU2Mm9z?=
 =?utf-8?B?c1dSR0k2WHFrWUI4bUhIMWM2YUNJVVRsckpXSlQxSEZwb2xML0luSWtCaHMx?=
 =?utf-8?B?MFlXdDNwUlkzMXdRNDZESklteTdCa2RpWlZWc1JNWmFFLy8wTXRybjlud3Bp?=
 =?utf-8?B?ZlUvYWpoc0NxUUVQQ3BPRnB5S2tVd3oxS0lsL2NvQmkvTlNoSzh6ZGdDb1BN?=
 =?utf-8?B?N1BsMWZqNnJiSlNSUkp5YUdKcEMzaUREYmJwYlVub01kYlBZb0hOVnFKbzFq?=
 =?utf-8?B?dGJ3djNpRkpvSll0eEpSbDV0ZkRweHU0MFp6TEZzNlcwaGRSNEdDWXBjSmZy?=
 =?utf-8?B?Rzc0aVNVNEpPQlcvbmx6eC8yZHZOUjBtTmlKMVFTZEN4elErVDZ4QTZmZzZr?=
 =?utf-8?B?ZUFZS1NhT2Q3OHJhTEJCV0wvbllBUzZiQnJTbW5ra1ZHMXlmN1VnNVdQQ1ZZ?=
 =?utf-8?B?TUNhUVpXQi9JZ0REbGx3SXdTa1U2ZE9WWVZXeUNqSlB0ZmNyZkhCb055akhT?=
 =?utf-8?B?WTBpRXVHVTB6Z0NQSXBJZUpUamlPUFh3dFdrbkdMS0R5cWJYMWtVTlRZdGZ0?=
 =?utf-8?B?QTJpSTN3ei9DVG1FZWM2eGRrcFQrTmRkZ2NYWFBCSm0rNXYzNEZwZy9HNWNF?=
 =?utf-8?B?L0MzNkhVYVJzVXVvc3cyc0dnMUlJYXI1Sm14ZFBJemwxTmoybS93OXpKaWVP?=
 =?utf-8?B?L3d6TG5vN3M4blM2KzNaNXVsdjN6OUdDWjN5UmpQb1JNTDg1RG5ML2pxejBV?=
 =?utf-8?B?SXhpU2ZNWkxiOUttSWNkZmpFeExRMW1iUzN0U1hCQUk1cnJWSE9RbjBqek9o?=
 =?utf-8?B?MUhmbGdSczFjdm5qeUpTb1RKMWtBVnQ5dkxCdE4rNTNIbCtOL2g0cndNZ3NL?=
 =?utf-8?B?aEo2em5UU21saHJQSHRuVWYzSkRVSDdrbTJDSUVNVXZ2WVRtZThUK3ZkcnVv?=
 =?utf-8?B?alZQOGE4MENzTGxyajhuUHhhNkFPYXNUaXNmREMvREJFWjJiOWVja05IaWZT?=
 =?utf-8?B?eEducWE1eVhPSnJYSDAvZ1M4TzNjYkJVT1JwbDNHMm5NeVNSQjhsamcvZFlm?=
 =?utf-8?B?MHlVZmtnNDliVmVhWVZ1WUlhMkNDcGkvOFdQYWt3eWpTTC9ST29LZnJpK1lE?=
 =?utf-8?B?VDB1YXVHc1I4aWJyZUJqOFFtLzg4K1UvUmZTa3RzbmsvRXZ2azM1SytwQ1Vi?=
 =?utf-8?B?TTdVbE5Rc2ZPOEt1Rk1ER0orOXJjblBRLzZOVGk0WXZJcS9QNFMxcjNtS2lm?=
 =?utf-8?B?MDJrdFlTU3UwQWxJWll0eWhSREdhUmQ4VE9MWUo3M2xMdS81dkFzZ1NaQmJH?=
 =?utf-8?B?ZVBLczhKSEJsVGl2Ykp2SHZNMFgrclIyQm9tazJ6bTJ4Zkg3dGtpUUVOMFMr?=
 =?utf-8?B?N3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e444af3-12b9-47e5-1826-08ddb3f92d9f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 15:01:35.1620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nntwm+gxs1YJVErhGnWRnvDjTOO6JJuSWmVpQ6F0O7BpmFKIAIpHMqQSaLgHT+2hDMmiQKUOHcnPM5kSTDms+OpqqrfRfy5NJov/OZH9PtU=
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

Let's replace the manual call to ioremap_wc function with devm_ioremap_wc
function, ensuring that VRAM mappings are automatically released when
the driver is detached.
Since devm_ioremap_wc registers the mapping with the device's managed
resources, the explicit iounmap call in vram_fini is no longer needed,
so let's remove it.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_vram.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index e421a74fb87c..3a4c84e9efc6 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -156,7 +156,8 @@ static int determine_lmem_bar_size(struct xe_device *xe)
 	xe->mem.vram.dpa_base = 0;
 
 	/* set up a map to the total memory area. */
-	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
+	xe->mem.vram.mapping = devm_ioremap_wc(&pdev->dev, xe->mem.vram.io_start,
+					       xe->mem.vram.io_size);
 
 	return 0;
 }
@@ -278,9 +279,6 @@ static void vram_fini(void *arg)
 	struct xe_tile *tile;
 	int id;
 
-	if (xe->mem.vram.mapping)
-		iounmap(xe->mem.vram.mapping);
-
 	xe->mem.vram.mapping = NULL;
 
 	for_each_tile(tile, xe, id)
-- 
2.34.1

