Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31049C25B10
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 12:12:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAAB310E9B8;
	Fri, 10 May 2024 12:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mcWVN+rw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C7810E846
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 12:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715343136; x=1746879136;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=3iKxCrxmYld2CkqbioqSe6chkkJePyZlqfp7hqdBwvM=;
 b=mcWVN+rwfWk/njtWODT1zE42Lc1fmldCFptIU9GBd1e00Zcdt7bQWJ6g
 hbvMG1QlIJGjO93prO2r2UMHV5yeAfEVXf54VbKqA5v+NMgATHT9ONRCv
 a5p7lqGCDd7KzxZ8aUs+NEZTIQJ0S85yMzbfTQ5qudXsKGxN2GZE3ptRG
 ysjDWvLZjmNrkWevzDKU5GGItKTsg64eaCKJUfaxw4keYQj4y6fxJRdMn
 8QZtw7EMnOufalozJnwrifaa3B4uJkby8eiqAPrmKws5rYSBmsuzhhQ5H
 reNN4D5mqoH0SOrTiFnkp6T1lWdR5lTcUOsXhY2xaUV1uUXlhXeTKXNgu g==;
X-CSE-ConnectionGUID: /BJosiQhTxiViXjxi8ECaw==
X-CSE-MsgGUID: Hs581LwOQziGJbq4aW10LQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="22726514"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="22726514"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 05:12:15 -0700
X-CSE-ConnectionGUID: fCbCalIjTZqQtJJLD4ATzg==
X-CSE-MsgGUID: fmkpULZxQ2mvDRjZreIBCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="67076732"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 May 2024 05:12:14 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 10 May 2024 05:12:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 10 May 2024 05:12:14 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 10 May 2024 05:12:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=buCxlQa2Y7Ma4ohTPImDZb5t7cnnosrDUpmn7SH3LSTCv8TqQLbTvJzB2wfWbLuuE1GCOpxQokfz1VYreMd22E1dvxeb/8Y06nh/l6y/h/iBzHCLZZjxrzbfhz+wyNpbCymjKv70up+7D1sRGXLnCSDPRSO6xg1erZpAVnMJKyu9mitEErA61Iwiyy3FKcP7eIXyi3AA5ZBQ33Wuf1p6YMzQ96cZXzFWnnemj2n4BAh4yoP2mr0Es/Mx0j9ubHf6tCUEkWPAV33L5DoyDrkam3NIpP+pPzO7WUwBbnGmmx4cMqDM9COxRJX2hcR2wmn5GLGQpwGAcIYXxBDpWxpI7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FwNE6moSzYFYS7WWCnTyVTmASdCPIhHKI6tif0R9KA8=;
 b=MccaDwUSvQaRWk462bXQt236LZkxzwRfi1IpKEmW9nj7Syk6wkPTI/1GxNhZMXURD05kVYmqf7yeKuWa+x6X0YI4+AsmECHzaSl6Kx5WPH8aUmFfgkWuZtm+RULvD4etJX9iWfdX74/DmwbVdi2ecsIUyfmoTQUKt5Fr8SzFdp8ALChY22drXQ+EN9L554DfzQvFhOKZ2qY/RCMfQhbtSiT6MXxzqQhNTFHh0l/0FU3sqcVXDfITr/loY/xBAkVdG1jUi8qxoKXvCACRhJpwow3Ht+UX2zWBTtWIh5KBPkA8wII6SX4JNligmtURP3JpnCAEWcFOjOzSKBJ+tvKDEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6323.namprd11.prod.outlook.com (2603:10b6:208:389::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.46; Fri, 10 May
 2024 12:12:10 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.047; Fri, 10 May 2024
 12:12:10 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Francois Dugast
 <francois.dugast@intel.com>
Subject: [PATCH 2/4] tests/intel/xe_pm: Also disable display for mmap_system
 test
Date: Fri, 10 May 2024 08:11:59 -0400
Message-ID: <20240510121201.723602-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240510121201.723602-1-rodrigo.vivi@intel.com>
References: <20240510121201.723602-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW2PR16CA0033.namprd16.prod.outlook.com (2603:10b6:907::46)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6323:EE_
X-MS-Office365-Filtering-Correlation-Id: 14fb21a5-c644-4908-ef44-08dc70ea6b64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5ykBRG1R7ZL/QDafFnL8bH1SopsYNUpVaPqRXHQTzh1KWQ+2zt2ZyNMr8cUm?=
 =?us-ascii?Q?xdwB/UTY1Plv7vnZgt0Zyt/oR7xZQPXnVZc3y8WqPnOcOG3nGrFXqbc6jpAV?=
 =?us-ascii?Q?u/ISCo39nAm2h0q25Rfv91GRi+tv8imcS0FCjnGlD7Lg2OMQu67YkGkJVTkn?=
 =?us-ascii?Q?FpVQXfWMdQ3Sr2z1Yi4blVVQO/cXILlKK+pCVXXtsttHJn8F9lM+qBwwuGQH?=
 =?us-ascii?Q?AtmU6IGCRHiYBr5FufCxOcrg1KEIcP+WgLdl6qSkWFaNFxRTaVLsE8KC/uMK?=
 =?us-ascii?Q?rx7ZCgLTIAYvYxZjTacc06uYphOkruxFAq6K/68hl0PszSoYqAt0BZumcj6T?=
 =?us-ascii?Q?0kpFvY8OabkQ+lfZvlFICL7c5/4IUYnLn04ZqjcUE8A6cY9kP+DPYXFH8I83?=
 =?us-ascii?Q?JxeGs9HE0dBIgtcygbOufXS7gfPiQ4peTCwxrTEd8ogMsGfPDWz01Qd1H5UX?=
 =?us-ascii?Q?K86vIwOt0Q1hAmL1hsp7FTodKq9/eiw0zWH8dKwSY0JaOpNfYFNCQg7tgJLJ?=
 =?us-ascii?Q?wD2Ezh6NbFSky3H+JtmiVmmartebfwLFimMpUVuQCHfrYh1oV2DbwJR5L/xT?=
 =?us-ascii?Q?0a3L2WjzLv0vK/OC9d1TCh2fwErvCwbqdyEszSMB2+n0YPPol0aj9HTr/Xvw?=
 =?us-ascii?Q?EwZM5EwgF72DPtPKT1tlzJzkmW47t+Uk0M5jR3ab6tBg3lKIcVWFydl4A4bY?=
 =?us-ascii?Q?Hzpzg2cWUh/eRfwVcvNZGlYgoNmm+LpTPHJ4UZJYw8hAKtsTLQTGTY0iDr0d?=
 =?us-ascii?Q?ojJHhfJdtRarRHbo84a5vUTCIdTRnO9B50QUkhf/3TzFnSR3RxQWSKhpix3J?=
 =?us-ascii?Q?dnqcQd38vkVxaXVI5F4YRPY4Mcw2dE3hOeX0sndeBF63IjK1mm0E1UYPvQd6?=
 =?us-ascii?Q?T4w4wGSGO5JwAdwP4SJ8d6wQtPDfh3PNZ/YUqcd09nJi81pxYhV86PhkQsXg?=
 =?us-ascii?Q?eEYyK8Z3+EemnbwM0fMNi2waECzkp+Hm95nLzUibJgZ8z0c/xiBC5BHVO7k5?=
 =?us-ascii?Q?QA6d9AHCZVPGzA6jdY255cvXj32X29vVF7pOFEjFuSfI80quUsiVBc9Wwa6i?=
 =?us-ascii?Q?zIe5ziUEtxjcBId7uxkT8tCoNUYCoehYqbyo505O/OMcKEm9yqq+tBvKGaKn?=
 =?us-ascii?Q?3Fz0tnru8m8DBT8utvWP4uK2lddcYTTCObRkdhvnJN4qehCzXkIzWq1Pa3Sb?=
 =?us-ascii?Q?lhO4ohcxy0mICl0cBDSWs8rZh4324Sucyl8JNo+lYWAcMOTjknMlefNnqIWj?=
 =?us-ascii?Q?jqM2oxDw9tANf15NqSvyW9jzHIMrQO5nAXO5AePQVw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h8DohBTKg0cdWk8ETevIj3a9U3OL1UpyVs01IozyTh/bQ1CpLDjZ2XH65TdF?=
 =?us-ascii?Q?favvjNcFIzHT2R/QGe3los64abCSU1kMEvtjdoMfW0RRUXqAov1GoRc96/Rh?=
 =?us-ascii?Q?gE5XpzsnHi/oyaxbirUQztswKw0gsZpA70fDTstH6rE7ukl6FbkiPUXFoT/A?=
 =?us-ascii?Q?wWJvCgK8BILdD+uFYqgiqiloGa1mUo21A50/7CjNTeXnMKJVkMF0P4aB1aco?=
 =?us-ascii?Q?LTQ92o0/zV8yoPyAgoncOZ+EUM185fXTvKdRNGzf0y/7/Uh5viyjpmNbCcyu?=
 =?us-ascii?Q?/bmsLaUPHEv61FCG2HJCXs2uhB8XR8Gmxkpj+OnK1B+BMHX5xjNlDBjYGuue?=
 =?us-ascii?Q?WmVtyrHfmvXF6aUk3R1MRg7Jdbh2Q8kODSnSqN2X6aQlkEEFkHlYoqROOGRR?=
 =?us-ascii?Q?gbmPJ3VmTBcURQ5rn3GzS+MUe1CpaAMwXBzVW1qO5tAIx0467XI1pXzNT3b4?=
 =?us-ascii?Q?JTEgisVcVmbd2HTBiEnTF9IEolSBuIYJZJSjI9aXIKwkRNCf9Mu8T7FuO9rN?=
 =?us-ascii?Q?OwkEoX6if57jTUr/b617dKR05n6jtzgrFbHpx2pH0o6Tgmj1VyWY02O8m60c?=
 =?us-ascii?Q?niMX5bBM7eU5Vp11LBwiPvWT5BJkt3/mrIuqvN7dJD4Zsd6PYm22XtiplZqv?=
 =?us-ascii?Q?MObj43GPOuVHaxIomkThM6uZXOx5jWv4u0L8dlBiNkBF0cv09AH4r685VLh0?=
 =?us-ascii?Q?W1oDqy6ky2QBVcngfcxTS9m4gJfarm2Zv35M+u0sTOlbk2iPdrO03/lBnZAx?=
 =?us-ascii?Q?nUdcrDojMoxuB20bA2Vk33Z/AbWmWmTay3IIrDQ+ptGJ8a7qx808GcEVnoRh?=
 =?us-ascii?Q?SttBqrLNaLvAGKmonnJgdNbpe6pIT4ehc+xHSHSMSqMMeA/e727Ww2GYOgIw?=
 =?us-ascii?Q?rc+sqdi/x5+aVJw53kzwfb98d322Amxdsp8GGb/FVr8wph9cFNJKg9HWBuWq?=
 =?us-ascii?Q?6uzs6p/uN6aM5YmASsCu34LVgm2bXx40cV9FkvILnGYmzT4IccuFgxZtG8UC?=
 =?us-ascii?Q?IvNdEHDabB7/Wt8QSoA4PjegZOy2moj59H1WXPnYMjxNdOakKRSA7AJnbMUM?=
 =?us-ascii?Q?z7+17nlsm0a+hJ7aJeBe/zV6sgFT/+X9929Cprhl8x7moqJ0WUg6H5w/O+Bz?=
 =?us-ascii?Q?X7SnlGE3jdZIN/Op6BMpF2Onzk3kIHPebAHgQAKKuSqwb/BPaQ1jsUqc2mBQ?=
 =?us-ascii?Q?1QHTXYCs5/hA8Zkn11tt2E8X5zDZjhiDv5r82NZkKN+37N4YGyMgeMDAKq/r?=
 =?us-ascii?Q?d+Iv9F4jjMYbTj7ONWqMfOVX3Mat3g/0prU7jBU4zCo2PK32fyMfo5xh7QEV?=
 =?us-ascii?Q?Zdtv+0g8NO8uScHIvwxFBIh84DrBxovq6eTJDGoHzHxtF4ZeKaFZlsGPOmd5?=
 =?us-ascii?Q?shNcpVtXVejVdmzebLPeoOvozNydFntCRopusNuTSQcfVqe2p8r29Qjzw15h?=
 =?us-ascii?Q?krJ1dvbXXp+FEX9jiSGDWlTRFBRCf6rCYuVLwZea2+2aDJ4Jovvc16iFQPQi?=
 =?us-ascii?Q?jW+tSW/6NAWhdmM/OhECzVlUYOblc1V8+NfrsLwaIpCk0uOUUttHM75lGgmw?=
 =?us-ascii?Q?VfRzwR177eZWMhVt3Mq2tLaElVDbP/XRylbZ8De+pVN+SE6ZLhz8UcEsGYb3?=
 =?us-ascii?Q?dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14fb21a5-c644-4908-ef44-08dc70ea6b64
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 12:12:10.8130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DbKjTJanVg3HGUfEnpL5CgjGuq5MMiUhCH6tixlXVOUgq1zTzUT/WIV7UviCnq+qlXOs6Yva40SHujBv5QKlCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6323
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

If display is enabled, the always-on components will always
keeps runtime pm references, unless you put DPMS_OFF.

Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_pm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 3f963bd9b..72d484163 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -780,7 +780,9 @@ igt_main
 		igt_describe("Validate mmap memory mappings with system region,"
 			     "when device along with parent bridge in d3");
 		igt_subtest("d3-mmap-system") {
+			dpms_on_off(device, DRM_MODE_DPMS_OFF);
 			test_mmap(device, system_memory(device.fd_xe), 0);
+			dpms_on_off(device, DRM_MODE_DPMS_ON);
 		}
 
 		igt_describe("Validate mmap memory mappings with vram region,"
-- 
2.44.0

