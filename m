Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B210C61DC2
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 10:29:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A26110E641;
	Thu, 27 Aug 2026 10:29:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bzlyqGcg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D694A10E641
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 10:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787826552; x=1819362552;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=ghA0sYrIn/IdB9+HCft4Rtq1PbHjiecWDwF0Q6zCW00=;
 b=bzlyqGcgmQUmrNfiPmsK7bvWwDD4Zphm81kErs9VtJHhw7lD9kRsqZjG
 VKzITPIfHbPpBCPrSPaiBfb8NWM5F8IQGutpxvBpDY9Tb3BPU2H6xbi5Y
 YpWeqoWzhSSmno3YpuFaGKNLSd52IOENEbmykqlmpnvmVrDmkXLom1vP8
 Krhp2Sqk63nqPuKYeHej3wimx8ApnWfzyzhzLm/gaiKFUtdcljKyjAArk
 VxZlKLcP1yMoGhB3e2ylo8Iytef8oVVe41lCCm70p4hyKTU+EuOAWoe3B
 nmAsj6+LqiRh0SiNc58aC5t4tTKvauYsfms7Ed238bHCzXBHiBc8l2t/+ g==;
X-CSE-ConnectionGUID: 25YvmIqpS0qMBIS5sa2A1w==
X-CSE-MsgGUID: nZlf8GS0SByZiqweb9jvYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="87457302"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="87457302"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 03:29:11 -0700
X-CSE-ConnectionGUID: w8swwpX5Q3C0b2lfm9VgVQ==
X-CSE-MsgGUID: IwxeHnNvSlKd99kEa+Mmgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="291344331"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 03:29:12 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 03:29:11 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 03:29:11 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.69) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 03:29:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aEKA1zZhL3AWKmyM9AdQ27gIDZpkaElYUsj/lH2v9lw7FTUgQKFtTbZqqwHxyDLfoQGKBDm2wsB1QDM0Va/JWV2xTrOoujpYgUxDANQjgnk7l7Mr0JUpMMKuqcDTNQY0qdXkQgNSjJBDpeuVc++Zz4QdAHyNAqtHzzpjzzqCGYD1o9rH1HsayyNoxmOAQX/e7yZi3cYrb4r7kVJDwQD6XXduW8OU91x4X+qehMMCvHKvj40KWRLcsebfMZUE402QTe1BhMfJbvlVZMrAIp7eRnu11XaK/CghNfvowYZzNhfTwmEtYsgJtc2UBfxpmeqhhq20P3XK7NN/WNQaDkwg9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBfvfVmbak2+SWFWBrXb05ulGfkBMN1QTz2YBez37n0=;
 b=YwTGySUbtqVVoHbCEXKTFsswgO1ouBtc7SDAUf9aEP3oWOsCAjQowMrpM7GYVlVLoVZqxo2Tl1/35cRNabcEC0KeXChgHbdVyyfptkdEsVd5iJzTBaKZQNJ1BPcoKgfzzc7SNFeXejPzhSyWrVr8ZTp3uQRBce7iIXneETXJ/abpkpFyHW71ozpFv8N4YG/zf0BCRVG0IQzW1ALe8ADNwxqsvNKlVACGjjp406JuwAXVcMIwdFGnwtcYOB/f8b2iQPiiQLz4KB0NhYdyYhUrg3qY1sm3Qdz++zZkgtHUNtkZo4mqoo/qdu+gF1k2eWgKPREv4E8hgOZgv/zacepamQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by MN2PR11MB4536.namprd11.prod.outlook.com (2603:10b6:208:26a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Thu, 27 Aug
 2026 10:29:09 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0360.006; Thu, 27 Aug 2026
 10:29:09 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 0/4] Split GuC ID space into usable and shareable pools
Date: Thu, 27 Aug 2026 12:28:58 +0200
Message-ID: <20260827102902.1236918-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7P251CA0028.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:551::12) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|MN2PR11MB4536:EE_
X-MS-Office365-Filtering-Correlation-Id: aa1b5d5b-e667-4821-9e74-08df0426078a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|18002099003|56012099006|6133799003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: LDc3nLI3sRyHl8XFcZSJ4kgeYwkoTVuas2oksPVDuYAWovkMHyQLWyEkt1xiiT56ND0AJ6ycCfqx1dXoodC1e2vHVvtvgkKm13+7KIAqBWTZA/XtQ3rW/P3zDpEVdWJFO8n5HDiJuMmsIFY25xXNS2vu4NlbA5yxN5lmm2Bn9RaLZS/bFqrPozRXrHaGwQXoqOqWLKLjS3wH/Amk0aqqAKNqXcW74XELdN+g+mNRNX9dELoAcEgnLf+fbz9fRAv5OFcX+p1il/Zmo864PeBIOWRTCAqVRvmBvh0ofmYeaFJxPbdeR3bt75NGZK72i2mwMgf/b5syKqib1ikKTHKmJM1jWEP92UB7jYsmBs/1SNcnqfsztdWwRv1N9etuMbtIBsfTHwCIRfeeDpb3KPrCwVTi6N7sThyvbX+6/zOvEUmOW8gl02nwtVY8c7G8FWuEVpPHT9xHHytNfxUmKXDNxNkQRACsPEHsoAhVNQzNzjCRhT5TT0m/konOkzsDZzLs3v6d+zc9GvyYdX2bJ+r1jYprrVRxfFqfvgotjk5VfTitgiNtIyZlRHYrEzofJ3PWiucVkTMW+tmPPyomX7rX78l2I0dr+AzoYgm0rCtHxmvXJ4Yp5iC8KI1CJ2Yf/HsJBd2S2Tv/rHfxR6/jcDR36ZslNCXCqHW/TM33rUh08zM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(56012099006)(6133799003)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODB4M3lGV2VtdDdvdUQ3VlFmTVQxbnhXY1ZKYWhYaWxOcFRZV1Q1a3NBMVB5?=
 =?utf-8?B?aGx5aHZHRjBUQm9NWEJzNW1sV28rQ3Q0dkxEWVZzdmkzLzY2VkpKajc3UmVH?=
 =?utf-8?B?ejJvWlllbmNHbjVsY3gxYnUvY1UxYkFXNFV4UCtqV3VjV1RoMTRGbEJrVmtP?=
 =?utf-8?B?a29CQUw2WC9wdzRNTEZhUU5vcDdISnJOYnNDaXdMeUhacW42cmN2OUhBMllI?=
 =?utf-8?B?bnZjNHR2VFhiOVMzazJoQndQdjRQZUpENGllc0owRGZrejBkb2JoUHl0RldB?=
 =?utf-8?B?blFhSWgvK2RLUytteWoyWmZmbzBDVVpKaUQ0cVBwQUc1Uk8xR1lGWm5lSnc3?=
 =?utf-8?B?OHh6d2MzZDhXVUR5SjNWZVdDNlBYRTZmdUhTV2VhVjQ0WDcrMXVsMnVjOHk4?=
 =?utf-8?B?bGVXWHQrRS9CYm5GUEVubDRmamh3NVpvZkd6Z0hTU0xMNzhFUnZrZ2RiV3c1?=
 =?utf-8?B?ZVhjWncwSnc2b3NRZyt4SmhjZGYyd2FTc08xYkxlR3FrZDk0d0d2b2Vxaytn?=
 =?utf-8?B?WDJHd2VOSzR2UFIxUHo2U2ZUV2lmb2pBeTVWQkkwLzJ6cDY0QW9vTmZ1b2Jt?=
 =?utf-8?B?TlhFc0ovWHM2SFo0eUMvbkk5RzFHSUJDS0FUUEF4cVlkZDhZS204ejhkOUtY?=
 =?utf-8?B?SE8vVEYxd0dNRzgrQ3cvNzI5VnZMR21SRUVIZ0RUTUdLMWJFcldvMUQvWE9B?=
 =?utf-8?B?NDNKRUQ0c0RFWEVQZitVOU9jS3owdEdDeTdENHdOK0RRZVhnem0rYXpTUldE?=
 =?utf-8?B?Q2FGOWdaZnRXUmRIMkUwWVZaMkJVMWJFZm5LNnhzUDl2RDh4cU5hZ3I4dnJY?=
 =?utf-8?B?emF0aW5KS0pOUEVMb1A5bjBHWm9USW55NEF3MGdjRmlRR0V3WDdBU1VicXc2?=
 =?utf-8?B?cDVhWFhZV2crTVdSSkNCdDh0VWRwbm8yY0ZXK3ViVnU0WnIzWGlDK1FWdDJi?=
 =?utf-8?B?MGtWNjhhclc4aVB2NTFKOGpCaGNRVUl5dDNJbjBRRHhQckZ4enVEcndwY09J?=
 =?utf-8?B?ZUFSeXdWY2t3VkNhMTVpRE0yRHFiVHNYYmxDS1JNSmEybW9tVys3TXA2TjJ5?=
 =?utf-8?B?ZmZjTW1JRW4xL0JNWG4yVU9vd2l4YmU2T3lER2hNMnNVbUU4RDRLdjNsVlB1?=
 =?utf-8?B?STR1ZmliRkpmQkd6ejFwM2RUbE5oZmlrb1A3TnVhZjNLTW5lS1c0R2xTQlF5?=
 =?utf-8?B?djFzekdEVHhCUGwvc3ViMEtVNHJobkhlb2hBTnFHRllZMldpQXp0bVIvZ1k5?=
 =?utf-8?B?RDVMNHdYVFdQaEhKVWlLRjBnRk8wR1Jaa1FhZ0FJeDN4VUtSZWZsejBQdE96?=
 =?utf-8?B?dzBsSjdvWGpKVE16dGd4Q2cyeEExb0RmODN2cWpRUkc2YjhQNVA5TkpDVWdO?=
 =?utf-8?B?N213UkxmQngvdDlranlFOVhSaDhqYWlYbzQ5QTFmckxmMGtUTTNGZ2hQWHpp?=
 =?utf-8?B?d1BMM1EyWDcveGE1TVhuR1NDZmF0M1NiTHk3SVJkMGZJUlU4N0RDTTJOb0dW?=
 =?utf-8?B?Z200bC92T2M2cEd5KzlobmhFRDdUMFBPY1NJeXZYOWpFeENLMHRhRlFJblo2?=
 =?utf-8?B?SHBiZVhWYXM2Tm9MT0FKb1ZIMzlmUFRCWGxBYzFNcnEzaTQxODg4RHhVV1JN?=
 =?utf-8?B?S2V1aVEzWUpFTkFleDRyZkxvVHJ2UmU5czZocnNOZVd5Nk40ZVVUMkpPWk0w?=
 =?utf-8?B?d1Z5M1VZTWlsczduSjBQMmgwSlpuQjF6YzhMOFRIeUVBbXNXbzMvR05VUGF4?=
 =?utf-8?B?eVp1Y2ExemRnaE9pY21WUVI1d1Q1ZWdqLzlwNld5TElBOEZCdXVCWjNiMlcz?=
 =?utf-8?B?cWlKcTFGa3NRbU1rc1V1UDZ5RE5xMnFTazk2dDNmTnZ0dUtnakVZZ2dFSE1K?=
 =?utf-8?B?MGRVSWk0dEptT1N2Q0tDaE16MmVwZGphVHZ2dGhidVFreTYzOXN3b2hBWVFT?=
 =?utf-8?B?TC9IbEVXaVJZb2hOcGkvQTZ3S0JMQ0lBUTJmdDF1SnpyNklHb2VVUXZwdmtx?=
 =?utf-8?B?aU16d21iVE5EYXl4ckN5Wll2RkF4alArUWY5RDFYWWZ2SG83WVZWNjFHSHQ3?=
 =?utf-8?B?U1R2Q0xCMTgzdUd6aUZVUFBWQ1RTOGdhVFJFaG1yaWtPWkFUcEtROHQ1eWZq?=
 =?utf-8?B?OWJqczhoaGhZY1BvMDA2aGlrVTUzbURtZXFLSVI1SFcxTVdoMGJMM2xnWkFv?=
 =?utf-8?B?d1F5enRQZUQyQm5ESHNBNzU2NjNzcnppV0RYajJoVzcxbUlKeG5ZVnJQNTAx?=
 =?utf-8?B?bVUrNDdrOGp1aG1aTldEaGZyU1BPbkpVUXdqOEFMNWlPbHpybU5oeEFDUzg3?=
 =?utf-8?B?bG4ydll0RDlVY3gxV205UVNTRnJQcWlpQVVaTFZhbllscVRBMzlST3VUYzZX?=
 =?utf-8?Q?9X3IWm11RfQm7kKM=3D?=
X-Exchange-RoutingPolicyChecked: DVDiO2vHhA0HnQMU3F6UTRs8eK+pCeKad2sKgeSDuBvy1qIi6EIQ6a9WRRlIDOZTg4hIALzvSzSq7YAmL/wEwhIg3pGiIjPbnIff6/1tMYXHBihm2QQd/B+qQhiAs8gibHXUuLQ9TTmd4TLCXfzWU4K5wE/vUFjwFIMbFEm04eKc6xgYVGounU8Vvz87zGG9j147w8yemigSY3hPUKGduqLwM3Qrh0A1rpcdsSPCZdX/mMHr1ujFajWW0jSqTFpod22N+9nhL5BACNsF+zb1Af+N6vgpSNvq8q7gJEFyiL6IJcCI1AQAVj7LnGao6AllBt02KLviw49PAmrBQujS4g==
X-MS-Exchange-CrossTenant-Network-Message-Id: aa1b5d5b-e667-4821-9e74-08df0426078a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 10:29:09.3484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8hXl2WjFY78DcXxQ+bOmtoxNqbA5ZyKjYIs2K4SDG34TRag412BsiGrQMv7Y/aRHb7XgZvapaS0lbjPJq84QGIyZysrK+g4KA7YEObuE6P0=
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

The GuC ID manager currently treats all GuC IDs as a single pool shared
between GuC submission and SR-IOV related allocations.

This series introduces explicit separation between IDs that can be used
for GuC submission and IDs that can be shared with VFs. The ID manager
gains support for independent usable and shareable pools, dedicated
allocation interfaces, pool-specific accounting and validation, and
extended test coverage.

To preserve existing behaviour, both pools continue to map onto the same
GuC ID space where appropriate. GuC submission is updated to explicitly
allocate IDs from the usable pool, while ID manager initialization is
adapted to expose the correct ID ranges for native, PF and VF operating
modes.

v1 -> v2:
 - Fix issues reported by Sashiko (top-down VF ID search, KUNIT_EXPECT in
   locked sections, xe_root_mmio_gt() for the primary GT).
v2 -> v3:
 - Guard failed ID reservations before releasing test allocations.
 - Fix shareable spare quota accounting to include PF-exclusive usable IDs.
 - Skip some tests required PF mode if there is not CONFIG_PCI_IOV
 - Some minor other changes

Piotr Piórkowski (4):
  drm/xe/guc: Split GuC ID manager into usable and shareable pools
  drm/xe/kunit: Extend GuC ID manager split-pool coverage
  drm/xe/guc: Start use explicitly usable GuC IDs for for submission
  drm/xe/pf: Explicitly use shareable GuC IDs for VFs provisioning

 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    |   5 +
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 633 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  22 +-
 drivers/gpu/drm/xe/xe_guc.c                   |   4 +-
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 458 ++++++++++---
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  31 +-
 drivers/gpu/drm/xe/xe_guc_submit.c            |  27 +-
 drivers/gpu/drm/xe/xe_guc_submit.h            |   2 +-
 drivers/gpu/drm/xe/xe_guc_types.h             |   8 +-
 9 files changed, 1034 insertions(+), 156 deletions(-)

-- 
2.34.1

