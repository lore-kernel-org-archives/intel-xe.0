Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B83E73158
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 11:51:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA93D10E46D;
	Mon,  2 Feb 2026 11:51:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h45qx7zm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DADF210E468
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 11:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770033061; x=1801569061;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=xbVmSTsYHBM7yp8V3JMRlpy7tnNDjkpjtzH5PKMLcxg=;
 b=h45qx7zmNr5AY8qkT2ibIenJjQG7rZ+upLma1vF1qA6XdsbSjgkfnbx3
 kTNQRp09GiZdX9dQLPoROwSkV2e6Ub5/z3346MGmZu+N7dlO1imLVN28v
 7kQPgaFtIxL5aJQAPh7aJ+vQ+L+xNJEE0SfORJhyCVxUKTCavjl1H9nhk
 SFwacHa2BwoJTZriDgHNMzHSnIcqFbQ6ga3Js4XIZMNlcufbgzExUDd5Y
 d4Hjfr7b8ACbE/6T8cAjkCYOnd6QWYrQLnpQtTWL7ctG/o5O0zBpgVXlW
 exh7LymAE95n6vprPat3PRUuC6nf4qzzuVXEF/kt3GTa5P/IMdBZUKxpJ g==;
X-CSE-ConnectionGUID: ihcpbvjfTI2bV2Tz5bg+uA==
X-CSE-MsgGUID: BRhl0qHiTSyHfNYPbPUz6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="88608642"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="88608642"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 03:51:00 -0800
X-CSE-ConnectionGUID: 7c8C/90ORwabPB4PCa/NIA==
X-CSE-MsgGUID: dIhCYsT+RpaSBQYcTWjn+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="213608621"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 03:51:00 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 03:51:00 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 03:51:00 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.65) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 03:50:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHFSHit3NM8F14erTcoEB/KtB1WTtGxQcrmLQMqxccwMkG2MD0c5HawPAyRp4BrpqYfNkKxm7bc02Shz/S9dy55yG+riPgM9RifyZREambFreLcDex+HQOjbuT2jc98WWppGSckwdYVom8i/D6+boXjkku8RYwXY2PXgjr7VglvZQ/S3ZtydQYNjhSG3v5SevLBHjiwYFuRiwBnZ0d1F2aCC2jfgoGPO022ccDEcaCIJsVNv0pf5gX5iOpCeuqiJkNJOcvMU2DTl12bBGhtWq/YZPPnrc6a9Vsph53He4+ddQjxRcw4+C9t6EyeqtwTBbfYOrHnUoLcBAcfP9IXo5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rH70WbASW2nuOZMMQMz9i40lgrREg4jATJzjAuebMxU=;
 b=ia2BBUkM8EceEaufAPjqm2O9TTYFW8VgRKgMycxBe8f7AxCg30GhMl6uV+wyZHtc/0htEH4QPVX+B4VvmidXju2aKslCZ43DaQoB34eWSUjZue7FPT51YcL/JI+U9smwYFjiqvxjmh/Fcx92/z/bAh3QRF5NkpiMfxEYHVoHTmwtS8i3AZfRDCoEdqGtX/va2816YY7RHUl6vqLdWn3XRNj0N7QWi5fM6FWLIjon8vyUNoEcKcM6P1iLnwdb3uzHyMz/a7OD/p+P19Fw1BCuEjVVFeuga7MGVQBKSnA3F4kFltOuKCDPwEOzexxgSClzaiv3X3xrm2N+zCAgsnBBEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DM4PR11MB7325.namprd11.prod.outlook.com (2603:10b6:8:107::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 11:50:58 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 11:50:57 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matt
 Roper" <matthew.d.roper@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH v2] drm/xe/vf: Avoid reading media version when media GT is
 disabled
Date: Mon, 2 Feb 2026 12:50:41 +0100
Message-ID: <20260202115041.2863357-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU6P191CA0047.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53f::12) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DM4PR11MB7325:EE_
X-MS-Office365-Filtering-Correlation-Id: 38212035-cba4-4664-a3ee-08de625153a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUNhMFR5VE94MVVmVVBwOTVacGsxOU8wV0crRUlVbTNTRFFTc2VaM3lueFpT?=
 =?utf-8?B?V0JtN0pMOEM0WEdMci9pRndjTG1SMU05TGFhbWc3VWhGOWdVZkM5UWFHTldG?=
 =?utf-8?B?dUlpSVFzbmZJZDlIYjRrTzN0YnZLSTdDMGJsMUh5WmJpcEIwdnZUWnBDWHlB?=
 =?utf-8?B?ZEhleHBCYkpkVlhjQk9IM1ZRWjA2SnpsWWorS3JjREZmcVl2bmQwSDhFcHdl?=
 =?utf-8?B?UjIwOWhwclBJZWU5SlVkcHc0SHpmaElLU0YxNXZ5ZElNaXhNWWk2cGFuR1Rv?=
 =?utf-8?B?cVgyUVl3QW9vSkIyVEFXd0J6R2hmandPZVlPK0Q5eDMwVFpVdy9Na0pEM290?=
 =?utf-8?B?YXRGVmdHWUdUeFVZOTN3akVqd0I3UlZZU05HeUNBWmVHOUN5akFvOExGNUNz?=
 =?utf-8?B?NnVQejhBWjNSa3oxYzRZL2lPYTFhZnpjcjFRaU5qQzkybEY5NThIU1hSVU5j?=
 =?utf-8?B?UktnMU5MU2pEcWVTU2NQdGNOeWxTTVNIQVBJaFRHSDg3T01pa0s1dnBYWnEx?=
 =?utf-8?B?T1J0TGtTUUJEOUszSGE2YzhwczBWWGVDSXdhUlgvRmZabzJNd2pjWm1rRWd5?=
 =?utf-8?B?V2lCNFNNU1BVZUR4NTYzV1RwOVJZUGk3Y2JoM0h0TkNVV0RrT3pLR25HdlM0?=
 =?utf-8?B?M1BTbDJYcjVUVFlGZnpVZkxXMUllaDJ4dnRhM1pPbmZ3alBuSW1udENnMU5K?=
 =?utf-8?B?L0JEUGpaWTBoWXU1MllUOVExWVFSWUF6M1MwY0dKbi83UzY2Zk1kdkVOaXRK?=
 =?utf-8?B?TUNoY2hMZWdIempQb1BtcEVsalA1Z0dVWmh2bjJ6YnBxSjRGOE9MZlhjVHZV?=
 =?utf-8?B?eXdlOGtuZGp4Mk1selc4cG12NUprcWpIZVFaVER1SW5peHJ0SGxzZTFCM1Ew?=
 =?utf-8?B?VkI2UFVJaWcyN055RVRWSnhiK09ZeFJrNmVUenFORkpkZ1piQ2VOMTBIelVB?=
 =?utf-8?B?eUFiWWhDWWdZSW1jSFExa0FvT3NvSmpmM3pVUjN5WXNjQko2RGhzWUp2ajNN?=
 =?utf-8?B?TGRjTjcxVkhWWThrcFVsTmpueGJWclIxSjBHOUxGeDdLWWk5Yk5IaWwwRFhl?=
 =?utf-8?B?N2FuM1lVR2tjaWIrNUp6eXh1YXRCUG5QWGhFU1JCOXgrT09iMnpxSEJoVVJr?=
 =?utf-8?B?SG9wMG9sdVc2UG5aYTJjR1ZVaXYwVzJwaU9VcXFxU1daclhEK3ExYWhKd3pw?=
 =?utf-8?B?bi9rUHhMQzgzL0QweGdBSE5DVEFrdXN1blErWlZIVDFMNUtUQXRHRWh6SnRB?=
 =?utf-8?B?QUdEVmxNM0liWmN6bEZ0ZXlOUHZtWHRDSk1lbENpMWR6L0ZQbE1qa0ZGbmV4?=
 =?utf-8?B?QTVFTVIwTU5VNmdWNGNpTkRmR0lXNVdqUURyQnBRalJ4eWx1ZEgzRzJidStw?=
 =?utf-8?B?aUM4a2lHRFNZQ3k1eFpkRWVQZHdjQUNNbjZBbkFmR0k1bVBtaXViMjJDKzFT?=
 =?utf-8?B?OUlFTW9iUzhoSm85UUkyRG82NnV2T0ErVnc3ZUdpU09MUWppRnBwb0VnRDRQ?=
 =?utf-8?B?K2VaZnBaWXFqOUlyb0l1ZHFXeXU1UGlyZ0hYOUN6Y0pDZSswSVlJVWtzSTlw?=
 =?utf-8?B?cmkzYmRUL1ZiZmlXcnRoeWpSSmsvWVdvOVRwMVhaTnNjU2lXZ2dveFE3amwz?=
 =?utf-8?B?Q0ZUelc1ZlV2aWNnbmNlUVBmMnI1S1VWTHVTUFhLWGg3RUdQaTJUMkM2bXdD?=
 =?utf-8?B?NGliMTFpK21wTUwwUXFuVXdqMFlkalBzWmxDK2h3VzVTVFpJak0yM0Z0UDdX?=
 =?utf-8?B?elU0SzNnUlh5SVFpclh5clE2UXBLZjZzZFhNKzJqOFl5VG4wdU15Q2hvWTQy?=
 =?utf-8?B?TjFWazRaQml3ZGp0YUFlYUFEcDVaOFVTNmxLMXZMYXNjcWc1US9zTGlnY0Yz?=
 =?utf-8?B?VjI2MmlBVkFIMnE2YWI2QmpHRXRacy9OS2NOZGwxYkhlaVVUZE5wRVZVaVlq?=
 =?utf-8?B?dkwya1ViZzEyaGNQV290MVVFRVlpeGVaanJ5dFFZK0p6NTdRbTJzUE9hS1BP?=
 =?utf-8?B?UWtpRnhMc1N4SmFwZS9DRjVsdzlVdE0zakhJY1dvRml1TEs3MVB1VXNtRzlS?=
 =?utf-8?B?UXYwWmc1bHZzb2RhcDlZeFhVdERDMDlBUDFMWWkrcG1FQXVqNTcwVUpOckQz?=
 =?utf-8?Q?LSQI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFdvbmtLSFhXcy9oSzMxaG1GN24wQUV6Qi93cHJOeWxnYWNOOG5SY0l4Umlq?=
 =?utf-8?B?UW5xRVhBV0FZRjhCRW9HcTlwRGUwejl5dW1CMFZVcVRmR0RxeDBENUpyQ2t4?=
 =?utf-8?B?NjZBRmlVZDFGRkRBcVVqTWZpY2VvcUpPcFpqT2xDKzhhZnBUdTZBcjJDcTha?=
 =?utf-8?B?ekt2aStzQy9QYUlpN1JpTXRNRXlDWmFkTXp4SnZJK1g5TXRZamZuY0dWbHlQ?=
 =?utf-8?B?L25UWlFzaVhZaEVWTkZlSHUyZXlnVTZGclViRzdlQWN6NW13Rm1uWDQyVHRS?=
 =?utf-8?B?UFhtZHFIYW0wSUlqRDVjN1RaMkdLSmpaMHpYaHh5bTBMQ2tRVVY4ZEVnVUpj?=
 =?utf-8?B?aFByMnk3bWdHaE9kQ1BXdDUyVHdBQmlUM3dBTkFmR2l4YzFsVlBwcXZZdHZj?=
 =?utf-8?B?NXlHS2xMNGZFdTJIVHNpcnpxNmtwOXBXd2t0dTFVRHlqSEFxc3hBenYveTJJ?=
 =?utf-8?B?VWpqVnQrNTdpdXFyQ09KTHdvZkJnQnJtUkkvdVBiMytHNCtlemtybk5vRU1q?=
 =?utf-8?B?cWRRRU5SelBtU1E0TWM4UjQvemJBUzM0cGpGQjB5ZVlUQU50bjlhT21LcEE1?=
 =?utf-8?B?WTRzV1liQ3orVXVJeGVpeUFSMkZJWFhXSkV1cjdpdHB4OW5ycjl0OHVtM09N?=
 =?utf-8?B?THc2OTJYOW5RcEYxUFQ0VUJpQVlaOEZ4a1hpTEpkNm80YlVHVlA1cW9EUlkx?=
 =?utf-8?B?bDN2ZEJnNEJYbm5sZFltZklWcjJkMko3Nzc1dVNOS0p0SjZSdThqMjBUYzdT?=
 =?utf-8?B?TWxJSWlPZzZXZ3hFQUl6M2xOWk9kV08wQ3c2YURIUWNHSVFNbVVZSDB5dWYr?=
 =?utf-8?B?UHNpSG9CZEswMllhSnNxaFUwb3prWWtzS1NBak80Y0NrTnpONjlaaGZXQTZZ?=
 =?utf-8?B?QkdmOXdEZ1F0ajA2Vm9hek1hRkZMZnVZd0FERGdrZjVHVDdPMHRkb0dZQ3Nt?=
 =?utf-8?B?dFpldFgrWGVhVkttak9pMllybFpYRWFtbHJPNUptZno5d3FxY1gxd2hLUW9H?=
 =?utf-8?B?ZVdDOVhyTFZvZXVhOEc2Mm5zOEcrNkYxMWRvK1pSWHpNTE9TdnRtbTgrWFU3?=
 =?utf-8?B?MnNTWkU4b1l6bEdVZDBobVQrYW52Q2ZWRzEzVDgyQzdjUnZqQmtPUDRhRjFD?=
 =?utf-8?B?bjE1QjZFL2Y3b3FOQktIbUtXYUhraGtiRXVjUUJQSStJSEg5Z0dBTW1kdEJO?=
 =?utf-8?B?cjYyVzFONzhGdlJrMUpSWnJBUUF4dkNJOENScU9lYmJnaml0OUxMZjlNYmZB?=
 =?utf-8?B?TTF6VGFiOWpjd3JJZkZCbnpxMXc1bm5wRHFpdXEvRFNHdFdwdGw1b2x2aEFG?=
 =?utf-8?B?YmVMMStqdzlqK0RnWGo5UjJXR3Z4dTNBZi9Dc0FXTXpJTnljeXJUY0NRUXZ0?=
 =?utf-8?B?WUF3c1N6SWh4cHBWVmNBUmVqb0xKR2hQSDVLMm5JVkZMeEtQMkRwcm54ZXk0?=
 =?utf-8?B?UG1TazNIZjQ3Q1IxWmYzMy95aDhtRlhoMUlQRGhpR1hWUGNxS2Q4NUltZElt?=
 =?utf-8?B?cFk1ZUNxdUtEWGIzVkJQRUVWNHR1QmNGSmxWZ01USzg1RlFpbkU3c0VJamo0?=
 =?utf-8?B?Tmdqa1FFR25UenIrYXJoN0x1OVpFQ0JSQnlOVTRpOWphRDF4eTFjVU5CVGV4?=
 =?utf-8?B?eUxNcmxpeDViS0VJMWNoQWN1ZXJHTzVjNHBiTStqajF6TExhaFJCN3JidlRz?=
 =?utf-8?B?SVVIL001dzNEZnFKOWNqZlZWeVBJSjNOUzJIcmZFQ1EzUU9DZEhtMXF6bk1u?=
 =?utf-8?B?YXYzUDdCTWhrMmJJbzQwc3pWMEFvY1JEb1c4UFl3cUxaZnlMdUtIL0RxRi9N?=
 =?utf-8?B?L0NTSlhtN3ZFQlVTdHk1dWZjRnlJQm1ZazVIODJJdy9adzQ2MCsxSHRiUElI?=
 =?utf-8?B?b2wxNnp4aExLUmNFeFZjVjRtWkFMbUV5QWZacjQ3L2toeFdBL0tnUWgvQTdH?=
 =?utf-8?B?Z3h6b2FYREpZT2I3b3lCMWo0dXNHcnBJY2tsb01jcHRJRE1mNE80eHhldlY1?=
 =?utf-8?B?VlJ3bHJNMitMRGpFZVkyVG0vNmRTYjR6bTdQampKejVZdGRRcUJUNUhMSDJX?=
 =?utf-8?B?YTBqUzREOEl2Rnc4NTBURXVoYW12UERKNWcvbDBINkUvS3ZHaENMUGRxdUVF?=
 =?utf-8?B?YmtBOWx5Wi9rWWJvZDA4c0d1eUt0aEczOVI3ZW5JSUVXZEJrbHJlcVE0TURU?=
 =?utf-8?B?RmkwYXdoOHZkMTdPMlM5NXZYQytOcG1hYURHbklYMjJLaWVnQmhlMDUrWUVR?=
 =?utf-8?B?TGF2TXUzVDY3endDM0phTTR3K0g3UVUwaEhIUFlJdHRvWFFONEJSU3hucWRI?=
 =?utf-8?B?QmZ0a3poR0U1ZGNLeldrTmR2UFBHWjdseERvbGFOanc5a0VZYkFFTmFzcTJa?=
 =?utf-8?Q?fmqFkFEcH8Rp5UdA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38212035-cba4-4664-a3ee-08de625153a7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 11:50:57.0188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Y6dnAkC0xF72rfB8Jcix50osCS+hf5PaNeFPMSavifKIxYlIA0bZSup58vWZKNKCT07JHnUMnf03vJ1h77GRxkFWUGs6yUejrpwBnkZnBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7325
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

When the media GT is not allowed, a VF must not attempt to read
the media version from the GuC. The GuC may not be loaded, and
any attempt to communicate with it would result in a timeout
and a VF probe failure:

(...)
[ 1912.406046] xe 0000:01:00.1: [drm] *ERROR* Tile0: GT1: GuC mmio request 0x5507: no reply 0x5507
[ 1912.407277] xe 0000:01:00.1: [drm] *ERROR* Tile0: GT1: [GUC COMMUNICATION] MMIO send failed (-ETIMEDOUT)
[ 1912.408689] xe 0000:01:00.1: [drm] *ERROR* VF: Tile0: GT1: Failed to reset GuC state (-ETIMEDOUT)
[ 1912.413986] xe 0000:01:00.1: probe with driver xe failed with error -110

Let's skip reading the media version for VFs when the media GT is not
allowed.

v2: move the condition directly to the VF path

Fixes: 7abd69278bb5 ("drm/xe/configfs: Add attribute to disable GT types")
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index b5e8935fff1d..d1c885bb7645 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -556,6 +556,12 @@ static int read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver, u
 		struct xe_gt *gt __free(kfree) = NULL;
 		int err;
 
+		/* Don't try to read media ver if media GT is not allowed */
+		if (type == GMDID_MEDIA && !xe_configfs_media_gt_allowed(to_pci_dev(xe->drm.dev))) {
+			*ver = *revid = 0;
+			return 0;
+		}
+
 		gt = kzalloc(sizeof(*gt), GFP_KERNEL);
 		if (!gt)
 			return -ENOMEM;
-- 
2.34.1

