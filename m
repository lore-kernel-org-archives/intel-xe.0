Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397B0CAC5B0
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 21:19:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F069610E4AE;
	Mon, 29 Sep 2025 21:19:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jz/X8vfp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA51E10E4AE
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 21:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759180764; x=1790716764;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=whFV+vC/YdwLNaI9VRdBdKCsnKoLAn7OcIFS2zYWWlY=;
 b=jz/X8vfptObAV20xeP5HhX3Q9ax9p0DE2DVTkqUzwrPBtmuUJu3LewO8
 ZxwzI/SEbz2S1G8SY5o36+uIg5s70SevTGwAmAbuEBf/WCKFgmC1v+oiw
 pyTp7FXy96XkVoFY3uAtzyw8SN2iDglORE60sILaEs/fTxv3KR9GGX/X+
 3jCghRmYkbSdCvWoLibepMRvJPsFmQz5LBNeRsuEVndafLTPY8oLoJUpm
 zAH/3SqVGpXIvsrGLzqhV6OsUUtAR1WTxDHVo+OLRn95quREOpnF1zdDp
 WVPQihm++23o8+PbHulviGVaJsac9qXzJtsciEml4Bo4TJVPDLKkgLY+5 Q==;
X-CSE-ConnectionGUID: jkzKhrT8RciKYNVytiavOw==
X-CSE-MsgGUID: g2w7kWI2QNqVPwxMoj8sjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72533629"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="72533629"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 14:19:24 -0700
X-CSE-ConnectionGUID: TVY/TGVZQFyg7sxEwEh9tQ==
X-CSE-MsgGUID: 2ICd8g2ATGqIof3k+imdKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="178283499"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 14:19:23 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 14:19:22 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 14:19:22 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 14:19:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f8XyLiB2D8wvBZKvwFmIJ2JasMfnmMnmECZZskVP/7/1xTiPvG0a7385Uok8jyo04AwnHAXqA7CKdlfvYYhmsyAASIShZB3utyPAuLi0bU+SF6j7oEjJOWLZSqvUo4O0SvQToyLGxo41uap5YTkzzrkakLeIPOQhshD1udu1gFe+8hb+6fKTRJOyhp1PHRqFZ4Sx8+fs0K9uN/SUGvlsX6vIZySArn4YedU+A71okawlYJax+gwRvCN7lYgzE8kunPXQdhxXW250tFoPajxT8o7JcmIazUBLYxpt2xUSvNLI7ghzwLsB2uNGT38gB1omjHmplRSZBGmkBZluWEaY0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvqYHjJhJezG+o2Ib0MIXxJYp+S0eHTKZQe/M/VcHek=;
 b=Kk1B7iTOwf92KCTTua/1brkzQSgWM9nkJHQXHdNCwQ0QiPY3Wj183DnI9MgvNWs8suOlJU9P4El2KqMbBTlz/yDus/MPFYO4GfGBSklyfnm9qX/FoCAmZ8S6aR8/CrV7HDkFghinfeCKOB2U+g/J6VwoqaXD3XIylGIEZboo1AYNyBYkEfDinuvniqNPjlO71n+gTwnj9uiyrcrO0K2o/hmdjZxi1nirzNKEAFO8V1LH7vvWyCcfr32icPawOL6TlDe+tuTjKGnIwB0NOlpm4IjmpDKeFBWHCRtSxOPYrDeb3gGO3NTlplSRvQOW8/TfzgeCEO6QnLgAfwIKTiKYWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB7453.namprd11.prod.outlook.com (2603:10b6:a03:4cb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 21:19:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 21:19:19 +0000
Date: Mon, 29 Sep 2025 16:19:16 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 2/6] drm/xe/pf: Create separate debugfs tree for
 SR-IOV files
Message-ID: <bec2f3rm242xki4ntljdzlmwspi2ptam7mxsiiyway56y7nik7@l7qnqz4ynifn>
References: <20250928140029.198847-1-michal.wajdeczko@intel.com>
 <20250928140029.198847-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250928140029.198847-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0171.namprd03.prod.outlook.com
 (2603:10b6:a03:338::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB7453:EE_
X-MS-Office365-Filtering-Correlation-Id: 3809c950-ae2f-4847-da49-08ddff9dda35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDE3NVBvLy9JbmsxNk9VeHJNUXpGdTRtYVVEN2lmUGVTODYxYmZnM2lxOXpH?=
 =?utf-8?B?MjNTeHpuNGVnNzFtUUJmTjdSSHkxc0NtNzhkdlJoZ2wzaThXYnFlcEEwU0Y2?=
 =?utf-8?B?VVVhZlhiY1E5T0RxdGI5WHViZzlUNDdoUDNsR04xZ2w1Ry9UeUdXQlBOaFRo?=
 =?utf-8?B?cVRnVmRIOWlTZlcva3JLUGJ0Rkk3UzgzZmlVRUNyb3EybmJORzFVS2ZmSXdi?=
 =?utf-8?B?clN1RGM3dlhmd0hxSDNYamdCWXNBeHNoQXcyUnVkWDlLaWdIckt0dkJjcEVO?=
 =?utf-8?B?c28vd3hwcVE0RjgrQy84Yng4c2w3azBKWEROZkVkdURGUUF0dE9PVXd4UXNV?=
 =?utf-8?B?eDQ5L09JVm4wb21KT2ZrV2U2cnV2S2x4NHRmQ0hXZUNCM3JuQlBFUDJkVWRw?=
 =?utf-8?B?TFVobS9RUFNQZnVmSXNTUFFHNkdudHgyNlV4eUlJVTlsU1FJYllkV2Z2L2hV?=
 =?utf-8?B?Q0RaZk5aMEpqV2hNMk0rdDFRQ296UU5uclhVV0FJNE14S2ErYktrRVVDdUlK?=
 =?utf-8?B?bGRnNVFycW5jSUJwVkRlZDlqNmZaMFdyNUNVUWtPYXdtUU8rZ1B5NnhmYi9X?=
 =?utf-8?B?ZGJZdktYUFZtbkc0cXl6RWxTUytJTUFURUg1czFWTUxLVjFGOElvU0k1ejA4?=
 =?utf-8?B?emVCRmp2SHFNMnNiUW5XUGFvbE1Ob2VwODZWbFBkMStIcUtFckM0TzF1M0l0?=
 =?utf-8?B?b21ZOVRnd0oyU2JkU2VlVGhFK1cveHA3SVpVWWZSNzI4OXp6OGwvNXlEQVNI?=
 =?utf-8?B?Vk4ybXJOWVhyMDhpRCszZTNRK3M5NjBmZWNCcEtzY0IwMVlPZ09hR2Q4QnRv?=
 =?utf-8?B?WnlTTFRLVHozMS9nRENPbmtIZnlYa0p1bHN2dGpjV3dXcHgxbGtJU2R1dGVu?=
 =?utf-8?B?TENZYXl3NFpEZk5TSVR3TTFiUlNNWVI0MmFDWlZEc3Znc1BsZGQ4RHJreUVF?=
 =?utf-8?B?a0R3ZWxXc1hGdDErbTlqdWFWWjhHU3A1MTNremNsTlRPZTRCU2c1ci9yL2t6?=
 =?utf-8?B?WTZDaXk3bldicGNGMGZWSlYrUCt6QlYzVVI2NTM3aVFQQWtDVjNKUlVJYzE0?=
 =?utf-8?B?OEI3VlhmY05LYUZNMHVkR0s3anlFbXNleXNwQXFkOFhjMVlwRm5DckpoaE0x?=
 =?utf-8?B?UXdwbTBTSk9XdWZLSnBWSlZoSHNhMzN4ZmRMOVVhWVI0L3p2RWpXWWhzS09t?=
 =?utf-8?B?NThmVHBzTXpmVmJkQlJxdlc2NWE1N0xlMzZMSENScjlyS05jNDBRTnRTK2Nu?=
 =?utf-8?B?N0dCS0Z2Sm1Pb3dkUVYvdEp3eDRMc1NRdXlQQmRVaFNEYkRsOTdMVU5nUndm?=
 =?utf-8?B?QkhZQm8xNGxSa2VSNzM4STFLZ1ZBMWpZQ1VJUnlnSjZTRGVoWjdZY3hSR2tW?=
 =?utf-8?B?WVo3alZHdzJockkvd2N3L2JzVGtVcjRrdXIzM2hKR2oyMVhvdHExR0pvNGpP?=
 =?utf-8?B?NjNmenppN05ZVVlqTC96VXVQSDI1N2hKRTFkYlZMMnlubkI5N09NZUJyYjhh?=
 =?utf-8?B?UzRHcFk5OURsZEZVQTl1MmVCci9HQit5cUJMOFErdzRJWHJJVXcrcHFBT00r?=
 =?utf-8?B?d0dVVyt0ZndTUllQTHg5VkJUd1ZscnJ1QXFTRDYwbEdXOWlMTnlKQ0Y2M3Vw?=
 =?utf-8?B?bXVGd3BMVDNQRTBRKytWQ0RBR0s0WWlqWFY1bWIwQy9GclBGUkQwZXFrc1F3?=
 =?utf-8?B?enhYQkllTWhWcUtNaE1MWHdheklPZ3JYczI4Z3Qzcy8wT1dmSGw2d2pqVC8v?=
 =?utf-8?B?UHU0OFgyaEZLYVpxZTJFNUtyRmROcHdpNTFSYWlFZFFWSE11ZGV2VW5uYVJN?=
 =?utf-8?B?UGUzYnZDNkNudmtxN3RvVnFNWlRSWU5HdmVqY1ZvWWxwemsyRVUwYjZoUmcz?=
 =?utf-8?B?b3hhWnhLN2JhV0NYZDhOaEZSN25yRXEwTGRKM2pORHlQRXlZdnAxQ3BHclNz?=
 =?utf-8?Q?q1oTOfmJHKjKvJT5ytO4RCU3fQkYwcAb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXR1Sy9BVW5mQUIxVk13Ti85ZG9rRk1xejVLR3U1R2daUVFBUU41Q0FqOGRV?=
 =?utf-8?B?a1YrRUVvNm9CdEtMOU9OOEZaR1lxc3QzYXpYVjk1M0FjWkVQVktXd0dXbGlx?=
 =?utf-8?B?aHJISUZ6ZDJaVXhGVllDbVR2d0o5UkFEaUx2T2ZKWGpVZXlnSVYzY3hTOXNY?=
 =?utf-8?B?TlVFb3hPdlI0d2NERll4a3p2elJkdmRUTWtzUk1aUHBxTTNqckJjaFZ6TGtU?=
 =?utf-8?B?cndSWnlFckhBYnNFN2N0QnJDWGkvbXBnYldBOGFleWtveHRlQ2ZrZkdjRmRO?=
 =?utf-8?B?cEFXRWtmL1dpTTlTMGhzekZET2VHeit2OXNXbWN6Y3Y0WUF4SUNWeEU1ZnNG?=
 =?utf-8?B?THRwdnlKb1FNUXR3RENQRGt2S1QvTVEwWG5wbnJJN3M4SWpkcWE3UFZZZkh3?=
 =?utf-8?B?cFFQQnlVQUNUOHY4MGtPMnNUdHc5WUFVcE1CYXRWVnhCOGdpMXZQY1QyZjE0?=
 =?utf-8?B?SGNaQyt3aHdncjZlTnI2YzFkbUFTdTdRWHpyNmJOamhMTnRCZnhGZ25lMWJX?=
 =?utf-8?B?RFBYei8veHZXWisyRmdqRkJKc3VJS1B3RWE5NTJwV29FLy9wNVpSWlJVdUd2?=
 =?utf-8?B?VHhDOHpndmtRSXJ5VnVmbkV3ZE52bGYwWVNzMmxqS2c5ZGVHb1VGOVI1dWly?=
 =?utf-8?B?ai9MdHlZbkZrSmFldWlrUkxLbEF4RmFWMHhwUWJ1WXN6aEUrR3lFTzBmRVVF?=
 =?utf-8?B?Umlac2gwU2JUbHc3M2NZUnNDM0p4b0Y5WmROdDZKN25QbVdkRTIzRW1iS0g4?=
 =?utf-8?B?REFuemk0U2dlbjZwOEg5eGtDQkVwT1hRRHFkUEpjWFhWaFM3b2xiWFAvVlJn?=
 =?utf-8?B?bWlQbjU5bThyMTg5UzNtTEJUeHNoL05hUDd1YWc5V1p0TURPaFJXdHJGdjhp?=
 =?utf-8?B?SWhtY0dsZHV6Tmg0ZTFKUjNpWmEvdkt6TGkxT29tR2VXZkpLcWErcHNhWkJw?=
 =?utf-8?B?dzhhZCtuM3F6U2VTemRWVlZTR0pBdTVNaVZnTmJ4YjM2UTRmVWxTK1ZGRDVk?=
 =?utf-8?B?Nkh2eDM4emNJbGlDR25HOEpJWlVYYk5EVWJiSmlsMnlnSDFNcXl1QlNPZnAr?=
 =?utf-8?B?WWo3MTFSTWFPcTYvWW5Ta0grbDhVQmd4MGErT3h2bmppVGdnby9xYi9qOFY0?=
 =?utf-8?B?Z29jZktWU3JxNEVCdlhqWkVqVXU4VVR3Rk9pTkJXRTI4RXRYQjU0RjdzM2t2?=
 =?utf-8?B?WFZpa0doSFFYSzA3THI2aUErOFJtUTlMWmt1eGd1TC9TZW5uU1NEVUJwVUl0?=
 =?utf-8?B?SFlOZkxzWWVNcERQcWlsK1M5SXl1WlJxV001NjVCcFVNN3RydmUyOFdSYXQ4?=
 =?utf-8?B?R2dubStPUlEveVQxdkJ1TXBUMVJ5dFF6bXh0aGttdU1NSHRyOXQralN5b2Nj?=
 =?utf-8?B?cEdxeVN3OUhiMG1BZUdCcGQxeHRTdEQvSGJ3OXkrK29KWTh2SGpRN0RQalZI?=
 =?utf-8?B?ZFcyTnZXNkRzOUNpbjNEcUo5RHNVdERkWjdLWkYrNUdsT01ySDBqdDdIanh4?=
 =?utf-8?B?MDJzNG9sZWFpV1V1YllFV3IrRjRsUzNpU3Z0STBJdmFtQVd5a2g1eXIwR1VD?=
 =?utf-8?B?T2RMMU9HT05BKy9XdjB2RThFaXFqMUN6UU9YQm5ybTVBVmN6Mng1QUQ3bzFS?=
 =?utf-8?B?MHFiZHJHRnYwY2JNNGY3YmNnNGVLcXphekVUa0FrcWJrbkc4bTlPRUxPQ2hz?=
 =?utf-8?B?aWtIZXBpbDRrYVhTRCtyQlpUcXNSWFUrcmJCbzJWc3NIUHNFNXBrWjJROEVQ?=
 =?utf-8?B?TXQrdUNjVnJ0aHlvTzNKOTk0cjNOUnd2Ym11T1JNV1FmbzkxTnNpUmNJaVdq?=
 =?utf-8?B?cm41MEdLS3VUSUUvZlNWRmt6T0UrcS85YmJTZVk3czBKd0VWVHVFOGIvK0kr?=
 =?utf-8?B?YU92d0pXN0dmUER4T0dqZmI0Y1F5d25PNXV0RDRlZTdNcm4xQlZpcWVlTUFE?=
 =?utf-8?B?TWhkUzM1VG5QYXZTSTQ4U1NKbVBUYzFYSE83SVBqRmtOS2tBcFhic2Fhbmll?=
 =?utf-8?B?Y2JPeE93YlU1Nms5NitJRFpSN3FQQ09pcFZRYnByd3FmRElCWVpFdng4d1J6?=
 =?utf-8?B?SXA0dE14eG5BSGFkNGp2UjBKRU1KZVVONVpNQ0U4VllQS2EwME9wZUtMS0Vs?=
 =?utf-8?B?dmVCSVBqdVdhN3l3RjZrenVJUHZBSkVFVXJFWGtxamhFVHdxdDVIZlF2eDk3?=
 =?utf-8?B?WVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3809c950-ae2f-4847-da49-08ddff9dda35
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 21:19:19.4349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4XTUybtk6kjhJvj/deVHUVZ0cuQgyf0UuHOBw4Sz9rN9do6Hbq++9duekhByF4dasei6p370Ohk2EcZy1TlqfHRSda2odPFrf+xNZKW8YuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7453
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

On Sun, Sep 28, 2025 at 04:00:24PM +0200, Michal Wajdeczko wrote:
>Currently we expose debugfs files related to SR-IOV functions
>together with other native files, but that approach will not
>scale well as we plan to add more attributes and also expose
>some of them on the per-tile basis.
>
>Start building separate tree for SR-IOV specific debugfs files
>where we can replicate similar files per every SR-IOV function:
>
>   /sys/kernel/debug/dri/BDF/
>   ├── sriov
>   │   ├── pf
>   │   │   ├── tile0
>   │   │   │   ├── gt0
>   │   │   │   ├── gt1
>   │   │   │   :
>   │   │   ├── tile1
>   │   │   :
>   │   ├── vf1
>   │   │   ├── tile0
>   │   │   │   ├── gt0
>   │   │   │   ├── gt1
>   │   │   │   :
>   │   │   :
>   │   ├── vf2
>   │   ├── ...
>
>We will populate this new tree in upcoming patches.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
>v2: drop VFNAME_MAX and don't print dentry location (Lucas)
>---
> drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c | 58 ++++++++++++++++++++----
> 1 file changed, 49 insertions(+), 9 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
>index 2a1316048439..37cc3a297667 100644
>--- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
>@@ -9,7 +9,9 @@
> #include "xe_device_types.h"
> #include "xe_sriov_pf.h"
> #include "xe_sriov_pf_debugfs.h"
>+#include "xe_sriov_pf_helpers.h"
> #include "xe_sriov_pf_service.h"
>+#include "xe_sriov_printk.h"
>
> static int simple_show(struct seq_file *m, void *data)
> {
>@@ -28,27 +30,65 @@ static const struct drm_info_list debugfs_list[] = {
> 	{ .name = "versions", .show = simple_show, .data = xe_sriov_pf_service_print_versions },
> };
>
>+static void pf_populate_pf(struct xe_device *xe, struct dentry *pfdent)
>+{
>+	struct drm_minor *minor = xe->drm.primary;
>+
>+	drm_debugfs_create_files(debugfs_list, ARRAY_SIZE(debugfs_list), pfdent, minor);
>+}
>+
> /**
>  * xe_sriov_pf_debugfs_register - Register PF debugfs attributes.
>  * @xe: the &xe_device
>  * @root: the root &dentry
>  *
>- * Prepare debugfs attributes exposed by the PF.
>+ * Create separate directory that will contain all SR-IOV related files,
>+ * organized per each SR-IOV function (PF, VF1, VF2, ..., VFn).
>  */
> void xe_sriov_pf_debugfs_register(struct xe_device *xe, struct dentry *root)
> {
>-	struct drm_minor *minor = xe->drm.primary;
>-	struct dentry *parent;
>+	int totalvfs = xe_sriov_pf_get_totalvfs(xe);
>+	struct dentry *pfdent;
>+	struct dentry *vfdent;
>+	struct dentry *dent;
>+	char vfname[16]; /* should be more than enough for "vf%u\0" and VFID(UINT_MAX) */
>+	unsigned int n;
>
> 	/*
>-	 *      /sys/kernel/debug/dri/0/
>-	 *      ├── pf
>+	 *      /sys/kernel/debug/dri/BDF/
>+	 *      ├── sriov		# d_inode->i_private = (xe_device*)
> 	 *      │   ├── ...
> 	 */
>-	parent = debugfs_create_dir("pf", root);
>-	if (IS_ERR(parent))
>+	dent = debugfs_create_dir("sriov", root);
>+	if (IS_ERR(dent))
> 		return;
>-	parent->d_inode->i_private = xe;
>+	dent->d_inode->i_private = xe;
>
>-	drm_debugfs_create_files(debugfs_list, ARRAY_SIZE(debugfs_list), parent, minor);
>+	/*
>+	 *      /sys/kernel/debug/dri/BDF/
>+	 *      ├── sriov		# d_inode->i_private = (xe_device*)
>+	 *      │   ├── pf		# d_inode->i_private = (xe_device*)
>+	 *      │   │   ├── ...
>+	 */
>+	pfdent = debugfs_create_dir("pf", dent);
>+	if (IS_ERR(pfdent))
>+		return;
>+	pfdent->d_inode->i_private = xe;
>+
>+	pf_populate_pf(xe, pfdent);
>+
>+	/*
>+	 *      /sys/kernel/debug/dri/BDF/
>+	 *      ├── sriov		# d_inode->i_private = (xe_device*)
>+	 *      │   ├── vf1		# d_inode->i_private = VFID(1)
>+	 *      │   ├── vf2		# d_inode->i_private = VFID(2)
>+	 *      │   ├── ...
>+	 */
>+	for (n = 1; n <= totalvfs; n++) {
>+		snprintf(vfname, sizeof(vfname), "vf%u", VFID(n));
>+		vfdent = debugfs_create_dir(vfname, dent);
>+		if (IS_ERR(vfdent))
>+			return;
>+		vfdent->d_inode->i_private = (void *)(uintptr_t)VFID(n);
>+	}
> }
>-- 
>2.47.1
>
