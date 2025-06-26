Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444FBC7115B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 06:13:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9A910E26E;
	Thu, 26 Jun 2025 06:13:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BsIJRBpL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB00B10E26E
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 06:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750918428; x=1782454428;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iMbWweyIhBfCV0SBp+m8RN3XUnGpbzLRkM+U3/8+R4s=;
 b=BsIJRBpLOlAJglXHCn3abxPRabe05/yGAnPvvmb/WC8BPg+V5M4+oCTf
 7hfOP9MjpS7E4cX2vvTBcOnxThzmCDuQOSv5Iu+kyoonP3XraAyoOsaqB
 CVpC70C8XHyQ0cILPyUvov1JSU5Vb+L1YE3FWiMQnCdoGHY/zeVM9B8MG
 JlQAi8XVNGGre9SaojL/vock1qxxr4aYFUeGe/Bq1macpbKgK5+G2fXyo
 aLOLlIvkCWp9nZhKyIGa8ma+R20PO/L27RLFMXDQb1j9bupxnWMr0p8CZ
 RzhbbH8x2ImblT1+PsBMO8G2nTSf8wcLDxP41jgdS8+p2NDvako2gbJ7L Q==;
X-CSE-ConnectionGUID: xcS91X2zT0e6qefuECRtMA==
X-CSE-MsgGUID: RAkHf1wvSICDOxnNoCcEFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="63800531"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; d="scan'208";a="63800531"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 23:13:47 -0700
X-CSE-ConnectionGUID: aP+GsxzhQwi3PVmivIW/Eg==
X-CSE-MsgGUID: 4/P6G/2TTgep4XROkDqLNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; d="scan'208";a="152186807"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 23:13:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 23:13:46 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 23:13:46 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.44)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 23:13:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WtAcaEXVkt1th8TB4zT23guXmmBtM4JGAp9rnrkwoPq4sCP+6J2X5q15QyaNOLt7dzTsEp2IzeXu0sVASxDORsRhnc/iRW5iKPQRXXhzwFO7Gs8C8n2Jo2Av4eVNhkwnhG2jYaeuXIX8owEtayd+KgC7lOB8E9DwrEYTuHIR6HZXqt1XWghbmsnPVSnB8exLVlI210af//BFrYhL9KT/pnOYG8rF1kVrErFEOu3ck94kRe9/cohisz6gH2SOshAoq/scPumV3jUoC0iDCUhwbQyHuRZjpCy70Kb1aYuKixjnr4pVeSB5AsiK7J5WbQ8cN8B3+7rvCjsOTUQKBxoiuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RNvGoPeoGkGg46JMIz2LCelZInZv9ghxqHhz5rKY2xA=;
 b=ZhvU0kPi/T4jtr8zG+s7MHfsMqnctBzDpoDiAqB0zT5BHXu8SQcmJi0D3ydbLDVMmHBSYcdIzcIQfGds0/U8YbuVhzU6rTHur5bosYNSkrgH/ZvHFEj69+J39sXp4C7Vwms092Yt58bTGhmk7wmrXMBw2u6rSeEfkbmIKxPYMqyH9d47eW63TB1vdehZRrvO3SkRGqgNPOzszYpVSx1wN7KeRy7YbsnaD35cf1oXeYiNe6+st/WjZ2z6Q1Bu3ygIp2MNV0SJIpGqjldpmxvL6OJV+7mZR10w2Qkwh+mOk2izUkMiqnOqZYUgjEDqnHCX/FGQMBH6HHri68myFcgV6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7993.namprd11.prod.outlook.com (2603:10b6:806:2e5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Thu, 26 Jun
 2025 06:13:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 06:13:44 +0000
Date: Wed, 25 Jun 2025 23:15:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 09/20] drm/xe: Implement madvise ioctl for xe
Message-ID: <aFzlfMdVOAAI+zO4@lstrano-desk.jf.intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
 <20250613125558.2607665-10-himal.prasad.ghimiray@intel.com>
 <DM4PR11MB5456041A620E64B89F40BB9EEA7AA@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM4PR11MB5456041A620E64B89F40BB9EEA7AA@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0184.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7993:EE_
X-MS-Office365-Filtering-Correlation-Id: 553814f7-1a1e-46a2-de5d-08ddb4789af5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?7QPpd/F0uOjvmahe8b5dFBTMHvpZOAkgMmj6ihmSNvXiYX5uznQaBE+k18?=
 =?iso-8859-1?Q?iXv4cexIu//fp+Rv6rdaYxnMfvvC5MmrcUIhNoXZmJhOjSC+Vay8BIByfG?=
 =?iso-8859-1?Q?ODnuZz4wSvteb6PZJV/coal3IJwL+cll1RsGLZk2Jn5KYS8nLOsAPyYCY5?=
 =?iso-8859-1?Q?nfQ/ILW9DSv9MrnsUf5kg8PF31VvXZl1Y6o9EUwGxWVaQl3rB6hv5t7nK6?=
 =?iso-8859-1?Q?VvGGFPfnT/HQZAGEU9z4uoy9y8dX8IYru+Zd9GPSJ6vX9FRoJgdOkeRbqc?=
 =?iso-8859-1?Q?tMpCh/1MwUA2RUPQgKWJlFaneYaK0TVzeENTJ0OOh24B9p2b/PbxFM/+8i?=
 =?iso-8859-1?Q?YPaOHAbnlwjEcQvzyl1FXk6ejBFTJsdFSLhNC/8U5JwNZEeHc6VX8XHiSH?=
 =?iso-8859-1?Q?zbAp5Arp0Iw0fqv+fpEP2/SXVNdiorb/u4oN36u2xZHL6jdfw9oVilfDAA?=
 =?iso-8859-1?Q?EQvtjZ4IQzUV6e44ye83ACCReLe+/l0KhiOscVTQaw3mkIRFVYEtmtTGhM?=
 =?iso-8859-1?Q?GqvSEugaWUKrIxQVRPeOoHFPuwEN/pb2xNctXfKOGS72rtNaIM3ZXOWVaP?=
 =?iso-8859-1?Q?KKcM61zNp4ZjmJnZFjNaGC1Ni0xJHdQVJErqFIqZQPS5p6N8iBgqDlM1EH?=
 =?iso-8859-1?Q?0LJVEJ7TAHWXAeN9kugnM3Wlx3JrEvMiRAklrkPDGQiHZVtbSS/IgxD8VZ?=
 =?iso-8859-1?Q?5MLW17CAHfFu0DSyhBrWyd7WWS2Ee7VQrZsM6qD4GkQASo9Iruwgsm7vrx?=
 =?iso-8859-1?Q?4JhI5UB3qRkPJT9WhxzFHLU74GEgLKii4C9qwrjJZbr72SlKB6KtQrQsNJ?=
 =?iso-8859-1?Q?nDO/Kg2N/tpL7ICZV78LzV++8F7h9CZUjc4BJ91pZu9rmnz1vnllNx+q4I?=
 =?iso-8859-1?Q?p0AiOPS6uLRiAHJWwTvI0aW35AfyTQQUrAAPgthjhk/iZ1fo/RXUc2jaQn?=
 =?iso-8859-1?Q?xIgQZzKdn0t0Vi1JL6UF+Xueqa4Xhf9bIoVLWenGFJfspQdk2Y7DFBqacw?=
 =?iso-8859-1?Q?8B2ZJaZwPri39EZIaIVsi3afVqfBsPK9HweTSs8yUhtvwn7sZLEEhoCHu5?=
 =?iso-8859-1?Q?j9yhl2m0hfl1BspmaJmt/ijjuRUqUxMkBSHNvKnbPc7aVRCslwHx0x3/V5?=
 =?iso-8859-1?Q?idF+f4MmXzGo+kaAwSTw05r463G4t8efMQlwFOj/PpXr/M2Xbq6NvCCe7G?=
 =?iso-8859-1?Q?QJBTXe9WrTSiU/sKnT4K3OLfAjc3I41HPwfGXfuZzOiqffC8HksESxn0Ky?=
 =?iso-8859-1?Q?Hd38JRRoMo/rfPqJaaIU7jH44n53SNtCOpUaXL/LKSpbtnZMIWBRCVb5JM?=
 =?iso-8859-1?Q?R7kh1rfvMoKfZbwWXNx0zdSiaTp0qmMxfSicXO20J/cUFAKA7rs+uNcujL?=
 =?iso-8859-1?Q?B/TeLoc8KZox0TnfHbuoWX78zyQN8NEVAfSAFUlE5tq+BBp488L9XlcQk2?=
 =?iso-8859-1?Q?Qea835qgocDzfVD4v8HNB2gPisMwiSPfqQ+DPA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?U7FAo/DTyFpinmDawyaxIByKgVZ53Q/Ik1qvbEfksF1QC1eXOOpfFL9ed+?=
 =?iso-8859-1?Q?D1anlwWypl+DJktmI2af6hBC7S00I4jfYA+sAvIWOBIK8Jr54nGSVeAPid?=
 =?iso-8859-1?Q?Q2H0sDV85c3cR4MqdLvMWw9qyDFGx26GzThaM67MqJKqEOJR3f7apMOl/Q?=
 =?iso-8859-1?Q?WO7EtRIpXFCO4+1o3ypK5YlXM0KIyAaO9IqcNoMFFJmrN8P/8ygKQ8UcUE?=
 =?iso-8859-1?Q?Ve/RD0r9ZGcnAA0OWhLqZbLQ+g49qQ2Zgx8lJkoD88nmPoiI2bgOOq/5vW?=
 =?iso-8859-1?Q?eVCKPL4x/UJ0hp3pftJOsm8FBfn8IIHz2VEt0GwOBzzbzvenZEWG3oFhnI?=
 =?iso-8859-1?Q?+zX9ZGdUsdWW8DXcUsCVnSjXvU9Zpw+UAqN55WPlxZOHrK5yVGvBB0a2Rq?=
 =?iso-8859-1?Q?hcoLohBjhdzHJeO/JS0C8G6i1yhHxBr4CiyCh+pXgPwclcOk+Wbbsj4nED?=
 =?iso-8859-1?Q?V6AK5WcYc9Gu6t4YZjhxJ+KJdKooS6rdSBJAvumuI0orkr/cuU/UyrBSJl?=
 =?iso-8859-1?Q?Alv0VlOUNzk2hA3+VpJAU14mNZtIr4AuohVpFxwVTsrBKMYdTewCSHKxdh?=
 =?iso-8859-1?Q?yQ0AQG/AKNQ4LrSQ1EpNM28y0m0MTB5170bMAG8P3euMsXvwl9R113xHzi?=
 =?iso-8859-1?Q?petu/hqMq5uvOv21jr/518QvoGHmNzEuHkVRPZNF7dvnchUNX4J2yV7+pG?=
 =?iso-8859-1?Q?cH9T/MUgaDiDO6yQqV4e7/YobXGdKt5KVebUcaH9h1R04YzP77oyOmzyYS?=
 =?iso-8859-1?Q?d9yrwBNkQnOIZXKIBjLCZDpwn1H+oCQy3hb4Skp9xF9lK+yBZtB2WupznO?=
 =?iso-8859-1?Q?dt4Ato7wN/iGs8U8ykVDQWHI/LvlqV8kugOhnKBNz7zuyTMZBJmYvjsfEt?=
 =?iso-8859-1?Q?NrQq1MUwr52YkAAwe4l8cXK7jUEKBYguEocr6m1Z/snstN5SX9MHNVWBHA?=
 =?iso-8859-1?Q?pIkDqsIF1et0Cu7qSYF4NIF+l2/iFzaEqpqMom6a7W6wxWkTkyTSegwUcC?=
 =?iso-8859-1?Q?l6o7IAQmTtu85kjMhaZ02tGBgMmLdFvawAT8hIYcd/XSl1jL57xX2xULDY?=
 =?iso-8859-1?Q?u3vcvGvau3mnDyGUFfk2Ls0rCX8aPpvju032v+GqafZNlP+THZ+HL0R+c4?=
 =?iso-8859-1?Q?W/plcMw4mcqu8Ybzld+AH7se842Sfp/ci6afDwTzQwftrHFMtAu1tT2xYW?=
 =?iso-8859-1?Q?OKqw1JcwDFHRZPsFxTaYSfS3WNDjSjIdbrQHykZcW5/PBo5MjZDYYScfgw?=
 =?iso-8859-1?Q?/ivuKuOzpiMyWWcx7J193u6HWQzfcIXhb+cPh4uWbeVlrvx+CiLEki6/n3?=
 =?iso-8859-1?Q?8Rd8xJAfkokk4/pJ/RjggrE80/ay6l7InqYrDlKrPDaBvyImeE2vya5n5s?=
 =?iso-8859-1?Q?qIvzkGGfw+n4DcgDG72iOtx4DzqI7eRJKuInxhW1VIapCOTyHkXy/S3/Ed?=
 =?iso-8859-1?Q?4lc2136a1NfWrDCrPtBBLktNgieTQE96UkgBGAI0Tvn8OtAVmCY90AY1lu?=
 =?iso-8859-1?Q?5MM0fzjHEJMpT3IgeLxH73HHyuXhDqQrxl3Gn4+8GqcJMCccizYlxSvo+k?=
 =?iso-8859-1?Q?WZjGcx+EsbRt1dyuTmbaWFCsH0VhdrcUhph8H1PmBN7/U0CW7wGs33ib+8?=
 =?iso-8859-1?Q?NLOk1TU9YxbUEz7I6f6taBeIziX3vYc98U/h8UGiNS8fv2lIYHIKiX1A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 553814f7-1a1e-46a2-de5d-08ddb4789af5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 06:13:44.6805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gkdetbCoanazwLcluwWqoqVOtaCatyp1ladEA5b1x7nVX/5i72ZKrGnbGF9KHPpLjUSTQM+kwg5vkX79vGMikA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7993
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

On Thu, Jun 26, 2025 at 12:04:07AM -0600, Lin, Shuicheng wrote:
> On Fri, June 13, 2025 8:56 PM Himal Prasad Ghimiray wrote:
> > This driver-specific ioctl enables UMDs to control the memory attributes for GPU
> > VMAs within a specified input range. If the start or end addresses fall within an
> > existing VMA, the VMA is split accordingly. The attributes of the VMA are
> > modified as provided by the users. The old mappings of the VMAs are invalidated,
> > and TLB invalidation is performed if necessary.
> > 
> > v2(Matthew brost)
> > - xe_vm_in_fault_mode can't be enabled by Mesa, hence allow ioctl in non fault
> > mode too
> > - fix tlb invalidation skip for same ranges in multiple op
> > - use helper for tlb invalidation
> > - use xe_svm_notifier_lock/unlock helper
> > - s/lockdep_assert_held/lockdep_assert_held_write
> > - Add kernel-doc
> > 
> > v3(Matthew Brost)
> > - make vfunc fail safe
> > - Add sanitizing input args before vfunc
> > 
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile        |   1 +
> >  drivers/gpu/drm/xe/xe_device.c     |   2 +
> >  drivers/gpu/drm/xe/xe_vm_madvise.c | 282
> > +++++++++++++++++++++++++++++  drivers/gpu/drm/xe/xe_vm_madvise.h |  15
> > ++
> >  4 files changed, 300 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile index
> > f5f5775acdc0..d375b549c30f 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -117,6 +117,7 @@ xe-y += xe_bb.o \
> >  	xe_uc.o \
> >  	xe_uc_fw.o \
> >  	xe_vm.o \
> > +	xe_vm_madvise.o \
> >  	xe_vram.o \
> >  	xe_vram_freq.o \
> >  	xe_vsec.o \
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 7d9a31868ea9..632d3ab12392 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -61,6 +61,7 @@
> >  #include "xe_ttm_stolen_mgr.h"
> >  #include "xe_ttm_sys_mgr.h"
> >  #include "xe_vm.h"
> > +#include "xe_vm_madvise.h"
> >  #include "xe_vram.h"
> >  #include "xe_vsec.h"
> >  #include "xe_wait_user_fence.h"
> > @@ -197,6 +198,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
> >  	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE,
> > xe_wait_user_fence_ioctl,
> >  			  DRM_RENDER_ALLOW),
> >  	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl,
> > DRM_RENDER_ALLOW),
> > +	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl,
> > DRM_RENDER_ALLOW),
> >  };
> > 
> >  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg) diff
> > --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > new file mode 100644
> > index 000000000000..ff560914ad7e
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > @@ -0,0 +1,282 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#include "xe_vm_madvise.h"
> > +
> > +#include <linux/nospec.h>
> > +#include <drm/ttm/ttm_tt.h>
> > +#include <drm/xe_drm.h>
> > +
> > +#include "xe_bo.h"
> > +#include "xe_gt_tlb_invalidation.h"
> > +#include "xe_pt.h"
> > +#include "xe_svm.h"
> > +
> > +struct xe_vmas_in_madvise_range {
> > +	u64 addr;
> > +	u64 range;
> > +	struct xe_vma **vmas;
> > +	int num_vmas;
> > +	bool has_svm_vmas;
> > +	bool has_bo_vmas;
> > +	bool has_userptr_vmas;
> > +};
> > +
> > +static int get_vmas(struct xe_vm *vm, struct xe_vmas_in_madvise_range
> > +*madvise_range) {
> > +	u64 addr = madvise_range->addr;
> > +	u64 range = madvise_range->range;
> > +
> > +	struct xe_vma  **__vmas;
> > +	struct drm_gpuva *gpuva;
> > +	int max_vmas = 8;
> > +
> > +	lockdep_assert_held(&vm->lock);
> > +
> > +	madvise_range->num_vmas = 0;
> > +	madvise_range->vmas = kmalloc_array(max_vmas,
> > sizeof(*madvise_range->vmas), GFP_KERNEL);
> > +	if (!madvise_range->vmas)
> > +		return -ENOMEM;
> > +
> > +	vm_dbg(&vm->xe->drm, "VMA's in range: start=0x%016llx,
> > end=0x%016llx",
> > +addr, addr + range);
> > +
> > +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, addr, addr +
> > range) {
> > +		struct xe_vma *vma = gpuva_to_vma(gpuva);
> > +
> > +		if (xe_vma_bo(vma))
> > +			madvise_range->has_bo_vmas = true;
> > +		else if (xe_vma_is_cpu_addr_mirror(vma))
> > +			madvise_range->has_svm_vmas = true;
> > +		else if (xe_vma_is_userptr(vma))
> > +			madvise_range->has_userptr_vmas = true;
> > +		else
> > +			XE_WARN_ON("UNEXPECTED VMA");
> > +
> > +		if (madvise_range->num_vmas == max_vmas) {
> > +			max_vmas <<= 1;
> > +			__vmas = krealloc(madvise_range->vmas,
> > +					  max_vmas * sizeof(*madvise_range-
> > >vmas),
> > +					  GFP_KERNEL);
> > +			if (!__vmas) {
> > +				kfree(madvise_range->vmas);
> > +				return -ENOMEM;
> > +			}
> > +			madvise_range->vmas = __vmas;
> > +		}
> > +
> > +		madvise_range->vmas[madvise_range->num_vmas] = vma;
> > +		(madvise_range->num_vmas)++;
> > +	}
> > +
> > +	if (!madvise_range->num_vmas)
> > +		kfree(madvise_range->vmas);
> > +
> > +	vm_dbg(&vm->xe->drm, "madvise_range-num_vmas = %d\n",
> > +madvise_range->num_vmas);
> > +
> > +	return 0;
> > +}
> > +
> > +static void madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm
> > *vm,
> > +				      struct xe_vma **vmas, int num_vmas,
> > +				      struct drm_xe_madvise *op)
> > +{
> > +	/* Implementation pending */
> > +}
> > +
> > +static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
> > +			   struct xe_vma **vmas, int num_vmas,
> > +			   struct drm_xe_madvise *op)
> > +{
> > +	/* Implementation pending */
> > +}
> > +
> > +static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
> > +			      struct xe_vma **vmas, int num_vmas,
> > +			      struct drm_xe_madvise *op)
> > +{
> > +	/* Implementation pending */
> > +}
> > +
> > +typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
> > +			     struct xe_vma **vmas, int num_vmas,
> > +			     struct drm_xe_madvise *op);
> > +
> > +static const madvise_func madvise_funcs[] = {
> > +	[DRM_XE_VMA_ATTR_PREFERRED_LOC] =
> > madvise_preferred_mem_loc,
> > +	[DRM_XE_VMA_ATTR_ATOMIC] = madvise_atomic,
> > +	[DRM_XE_VMA_ATTR_PAT] = madvise_pat_index, };
> > +
> > +static void xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start,
> > +u64 end, u8 *tile_mask) {
> > +	struct drm_gpuva *gpuva;
> > +	struct xe_tile *tile;
> > +	u8 id;
> > +
> > +	lockdep_assert_held_write(&vm->lock);
> > +
> > +	if (dma_resv_wait_timeout(xe_vm_resv(vm),
> > DMA_RESV_USAGE_BOOKKEEP,
> > +				  false, MAX_SCHEDULE_TIMEOUT) <= 0)
> > +		XE_WARN_ON(1);
> > +
> > +	*tile_mask = xe_svm_ranges_zap_ptes_in_range(vm, start, end);
> > +
> > +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
> > +		struct xe_vma *vma = gpuva_to_vma(gpuva);
> > +
> > +		if (xe_vma_is_cpu_addr_mirror(vma))
> > +			continue;
> > +
> > +		if (xe_vma_is_userptr(vma)) {
> > +
> > 	WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_resv(xe_vma_vm(v
> > ma)),
> > +
> > DMA_RESV_USAGE_BOOKKEEP));
> > +		}
> > +
> > +		for_each_tile(tile, vm->xe, id) {
> > +			if (xe_pt_zap_ptes(tile, vma)) {
> > +				*tile_mask |= BIT(id);
> > +				vma->tile_invalidated |= BIT(id);
> > +			}
> > +		}
> > +	}
> > +}
> > +
> > +static int xe_vm_invalidate_madvise_range(struct xe_vm *vm, u64 start,
> > +u64 end) {
> > +	u8 tile_mask = 0;
> > +
> > +	xe_zap_ptes_in_madvise_range(vm, start, end, &tile_mask);
> > +	if (!tile_mask)
> > +		return 0;
> > +
> > +	xe_device_wmb(vm->xe);
> > +
> > +	return xe_vm_range_tilemask_tlb_invalidation(vm, start, end,
> > +tile_mask); }
> > +
> > +static int drm_xe_madvise_args_are_sane(struct xe_device *xe, const
> > +struct drm_xe_madvise *args) {
> > +	if (XE_IOCTL_DBG(xe, !args))
> > +		return -EINVAL;
> > +
> > +	if (XE_IOCTL_DBG(xe, !IS_ALIGNED(args->start, SZ_4K)))
> > +		return -EINVAL;
> > +
> > +	if (XE_IOCTL_DBG(xe, !IS_ALIGNED(args->range, SZ_4K)))
> > +		return -EINVAL;
> > +
> > +	if (XE_IOCTL_DBG(xe, args->range < SZ_4K))
> > +		return -EINVAL;
> > +
> > +	switch (args->type) {
> > +	case DRM_XE_VMA_ATTR_ATOMIC:
> > +		if (XE_IOCTL_DBG(xe, args->atomic.val >
> > DRM_XE_VMA_ATOMIC_CPU))
> > +			return -EINVAL;
> > +		break;
> > +	case DRM_XE_VMA_ATTR_PAT:
> > +		/*TODO: Add valid pat check */
> > +		break;
> > +	case DRM_XE_VMA_ATTR_PREFERRED_LOC:
> > +		if (XE_IOCTL_DBG(xe, args-
> > >preferred_mem_loc.migration_policy >
> > +				     DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES))
> > +			return -EINVAL;
> > +		break;
> > +	default:
> > +		if (XE_IOCTL_DBG(xe, 1))
> > +			return -EINVAL;
> > +	}
> > +
> > +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> > +		return -EINVAL;
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_vm_madvise_ioctl - Handle MADVise ioctl for a VM
> > + * @dev: DRM device pointer
> > + * @data: Pointer to ioctl data (drm_xe_madvise*)
> > + * @file: DRM file pointer
> > + *
> > + * Handles the MADVISE ioctl to provide memory advice for vma's within
> > + * input range.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct
> > +drm_file *file) {
> > +	struct xe_device *xe = to_xe_device(dev);
> > +	struct xe_file *xef = to_xe_file(file);
> > +	struct drm_xe_madvise *args = data;
> > +	struct xe_vm *vm;
> > +	struct xe_bo *bo;
> > +	struct drm_exec exec;
> > +	int err = 0;
> > +	int attr_type;
> > +
> > +	vm = xe_vm_lookup(xef, args->vm_id);
> > +	if (XE_IOCTL_DBG(xe, !vm))
> > +		return -EINVAL;
> > +
> > +	if (drm_xe_madvise_args_are_sane(vm->xe, args))
> > +		return -EINVAL;
> 
> The upper error return will miss the "xe_vm_put(vm)".
> BTW, the function name drm_xe_madvise_args_are_sane is somehow a little misleading. The name looks like a boolean function, while the return value is 0 for success and error code for failure.
> 

Agree with Shuicheng, drm_xe_madvise_args_are_sane should be a bool,
need to avoid a leak of the VM on a failure.

Also will I'm here, avoid drm_* prefix in Xe code. So...

s/drm_xe_madvise_args_are_sane/madvise_args_are_sane

Matt

> Shuicheng 
> 
> > +
> > +	down_write(&vm->lock);
> > +
> > +	if (XE_IOCTL_DBG(xe, xe_vm_is_closed_or_banned(vm))) {
> > +		err = -ENOENT;
> > +		goto unlock_vm;
> > +	}
> > +
> > +	xe_vm_alloc_madvise_vma(vm, args->start, args->range);
> > +
> > +	struct xe_vmas_in_madvise_range madvise_range = {.addr = args->start,
> > +							 .range =  args-
> > >range, };
> > +	err = get_vmas(vm, &madvise_range);
> > +	if (err || !madvise_range.num_vmas)
> > +		goto unlock_vm;
> > +
> > +	if (madvise_range.has_bo_vmas) {
> > +		drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
> > +		drm_exec_until_all_locked(&exec) {
> > +			for (int i = 0; i < madvise_range.num_vmas; i++) {
> > +				bo = xe_vma_bo(madvise_range.vmas[i]);
> > +				if (!bo)
> > +					continue;
> > +				err = drm_exec_lock_obj(&exec, &bo-
> > >ttm.base);
> > +				drm_exec_retry_on_contention(&exec);
> > +				if (err)
> > +					goto err_fini;
> > +			}
> > +		}
> > +	}
> > +
> > +	if (madvise_range.has_userptr_vmas)
> > +		down_read(&vm->userptr.notifier_lock);
> > +
> > +	if (madvise_range.has_svm_vmas)
> > +		xe_svm_notifier_lock(vm);
> > +
> > +	attr_type = array_index_nospec(args->type,
> > ARRAY_SIZE(madvise_funcs));
> > +	madvise_funcs[attr_type](xe, vm, madvise_range.vmas,
> > +madvise_range.num_vmas, args);
> > +
> > +	kfree(madvise_range.vmas);
> > +	madvise_range.vmas = NULL;
> > +
> > +	err = xe_vm_invalidate_madvise_range(vm, args->start, args->start +
> > +args->range);
> > +
> > +	if (madvise_range.has_svm_vmas)
> > +		xe_svm_notifier_unlock(vm);
> > +
> > +	if (madvise_range.has_userptr_vmas)
> > +		up_read(&vm->userptr.notifier_lock);
> > +err_fini:
> > +	if (madvise_range.has_bo_vmas)
> > +		drm_exec_fini(&exec);
> > +unlock_vm:
> > +	up_write(&vm->lock);
> > +	xe_vm_put(vm);
> > +	return err;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h
> > b/drivers/gpu/drm/xe/xe_vm_madvise.h
> > new file mode 100644
> > index 000000000000..b0e1fc445f23
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
> > @@ -0,0 +1,15 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_VM_MADVISE_H_
> > +#define _XE_VM_MADVISE_H_
> > +
> > +struct drm_device;
> > +struct drm_file;
> > +
> > +int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
> > +			struct drm_file *file);
> > +
> > +#endif
> > --
> > 2.34.1
> 
