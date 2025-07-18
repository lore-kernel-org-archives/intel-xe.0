Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492C3C83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 18 Jul 2025 08:18:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0575010E922;
	Fri, 18 Jul 2025 08:18:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hS3VG6tk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8DF10E922
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Jul 2025 08:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752826711; x=1784362711;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ZQ3xO+Y/Uj8qZNnavS30AAhj0ewaAFS40+saO7XkW7w=;
 b=hS3VG6tkQv+LU7PyaU39SASSK5RQ/R36rdG2I3M/OdqTWWsDOxir01Lo
 sc6ZtqnPJkW9mKURuMp9ErOiSBz9vXUBEExf16uxOuTouXo4V9qDDXJXG
 RBA5dKg2H9UDQvuchGpyHIWrnxvDcI9IwwsEl9pCeqvMOb9niilABFyB9
 YrNdntAUpgt079LDs/UYXyIiZEpRxO9Vjc2j/VtaE+o6An+J6i/dZiabl
 Z6SZ9JfwFQkoCb9Vq5Tm0kYZ+1i+dA4UIRmknJE8Cv/mCo7xZm12QBLos
 izVdWCGyzBP1HUdBEMEpv+CbmnNnCqPzWy1EORlc57m7sbSPM45shuwhj g==;
X-CSE-ConnectionGUID: 6aZs66BCRG+EY/kSmzXlUQ==
X-CSE-MsgGUID: zgOqRt9bTu+EIfhGfbq4mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="72567806"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="72567806"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 01:18:30 -0700
X-CSE-ConnectionGUID: f1VcEkjxT7SPDW9by4Cdrw==
X-CSE-MsgGUID: 1aLYl5IvR/y7d8XNzJPuXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="158117585"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 01:18:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 01:18:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 18 Jul 2025 01:18:29 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.44)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 01:18:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BhIeKaZQrm2HgjQbUU2TBw5WNQpu4EiUW1+bZWNozB2BL9iFbfdCUlzVOdPEByjP1UWDF874pJlkywjoBTz58JZXaoB7tgsRjnWJFgZXzsSHeyF2qr64DpFROyozjTe2P8sdHpU3FUNBh0JttPtviHAHLIDplSG727eV0Gp2DMdNO+DGkbFTErfBnET95akvifN7V+bJHrZcI93Nmm+JFU+kskSZjxGUM9+0nqz50Z1AKmi8QrDdrbo/ikw3aE/ccxfMRK71xEnp8D6RSo/Z9XjEB/fzDup4ajFpMKw+xK/vGwv3bTw0JFl+L5nG9s4F5DwRqxRYoGKHp9HDEC1gbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xu1jJqvHAM+VDoaRPTsET+N1rzwLs4m4UOaBtlZGP2U=;
 b=w2eQKcUt2ilypcqcYfXQYv3c3pQTCYiGeKrRXiAj9fUzrOGxcFYFN2/iKT6/C5qw3mXIDYvce0EJrC+Tu3YWTFJXVIEdhpLmUva7Ld8c+kIPykcuo4AVGWZANzrk/GVUwMUcNMLW8zPu9/Ssk9hLwnYrsVFFqedh/GcWxxFi6BPg3mWeTQICdYuqegmnqB1scbyYNkt4mEpX4OvMyVM9FDG4JJ1b5lTC2e2o0SuJcu4PLWzYrlrsC3NmmNLkzIrQzmc/50lQEm1Ao6n+dqH95fliN5AzlDdPjCT1obV0hJXM0HQ9VXTrlFugyWV4WVMg9REstrBuU0B67b81b8br9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH0PR11MB4807.namprd11.prod.outlook.com (2603:10b6:510:3a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 08:18:14 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 08:18:14 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 3/4] drm/xe: Force user context allocations in user VRAM
Date: Fri, 18 Jul 2025 10:17:51 +0200
Message-ID: <20250718081752.630122-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250718081752.630122-1-piotr.piorkowski@intel.com>
References: <20250718081752.630122-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2P250CA0018.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::23) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH0PR11MB4807:EE_
X-MS-Office365-Filtering-Correlation-Id: c2f505e2-435a-438c-961b-08ddc5d3a42a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWwzYlY1QTlNYitDSlRzZnIyem5MNnhTV2szN0U2bTcyU3RFdnl1blhyV0cy?=
 =?utf-8?B?eCtyOHNYNDBGRUtXWEVrTHVvdHJFL0o1dVJXNGNsQmJSNi8yV2ZXKzBaQWJP?=
 =?utf-8?B?alRJT0piaXIxV1pTM0F2M2VqTUY4YzBnNHEvU0s5MktyWkRRcHR4aXhpU0pP?=
 =?utf-8?B?N2ZtKzBBRUNCN1BIdU44RG1kQW1GWkw2bFB3NGU2UkRvdlhsMGJDMHZwRUlJ?=
 =?utf-8?B?NFlaUXlhdEZubVVjUmhDS2dGa2tDMURoa2RHMUhnRDhJRmxtR2NIQ2RuYXV3?=
 =?utf-8?B?UmZ4NFFsQXhpbGM5dDh2SnN3ZXJPUlRVZUo5STQyRklhRTB0MjlHZmFxbHJX?=
 =?utf-8?B?UmxqcnN4dG5uNjlaSlpiNml3dGo2L0dqcTEvdEs1cWMya2YxMTdNd3E1Z1ly?=
 =?utf-8?B?NzdHQmRuaFVLcEZpcXpCSnN4aHBmS04yNnFaYVNBZnEvVXUxY1NOcExGbnc2?=
 =?utf-8?B?TGE2TU9ENi8zQTZJOVVYQmw5ZnY4bHU2V3RxTVRNRDhJYld3Q0hmblcvN0Mx?=
 =?utf-8?B?VGJuZzVRTVBlZkNEOVJYblh2eTdzNU1oOXBOemdIZUFXU2wwaVZHM0dGdE0v?=
 =?utf-8?B?aStnKzJpWWNlV1doaTBiNHZtQXpoWTlJN3pOckpWZGFxM0hHNHE0YWwrbHA4?=
 =?utf-8?B?KzBtR1lWYnFndExpbUxiSlovQVpFN3NDNjlqQzJNYU5qRTNlaFdwdlczWHkr?=
 =?utf-8?B?QTBIOEFjWWh1SGxCTGZoSXpOQjJPNDZZUC9vU3hLSG1kYStOL2NsZGtvU2lD?=
 =?utf-8?B?Zm90dWhYVXFsTW9kZmRXdHBrUnQ4bE1QYjJDaE9Hd1JCMmZZY1crMFk2T2NQ?=
 =?utf-8?B?SFE3Y25vU0JjN1RpSjFJZWhEV3dIOGZxcEFIR2N2RUJIVlJsTVhTVUc0OWJ2?=
 =?utf-8?B?dHJ5VTMzdlYvNDJlbkErVjZ5N2VCeFVuemxSZ3Rma0tKMWdnaytCMDZtbmNE?=
 =?utf-8?B?b3FOdFVYUWVJbmFmUHd5aVBuVnJiSVdqcCtmZUkyV0pQTm83SFVGNGZONHlv?=
 =?utf-8?B?YkF2bW10QWJ5RmRjT3JOd1dhQ1UzMmtQbnBXNkxrdU53OWVxeUYwc2ExY1Mv?=
 =?utf-8?B?MzlSenlHUHlLM2psNWlsNktnQ3BRZXhVZW9ZN1NLeDdRbXdRSldxZUdjQUJm?=
 =?utf-8?B?VDJFR3NUQ1R2WXIyWGU4c0RKUmYyTlN1SS9LVUJ2dzcwOSt3MWh5R0g0aFV2?=
 =?utf-8?B?Y1c4ZzNib09LR0FrdkRlRzZZaTJQVWlwMUdXOFYreFhGaU83c1I0bFhwait5?=
 =?utf-8?B?NVhkU3EwdGkvZWp0YSt1OTBhekpIQmhuTnY0dXZMczB1MlFtY0pOemZKTVNU?=
 =?utf-8?B?THdQZ00wK3pHQ2xDcTUwd3NnT1FiTnpOdXhDek5yTW02SFFlV1VmS1haQ1hh?=
 =?utf-8?B?VDJ0akdlZXpCUnhNenpZZHpPODIwTDEvWnZCSHYzRmdOeGxRbGxQZDhQekRx?=
 =?utf-8?B?UUN0Rkhqb2NJWHo1Q3pzWmRlck5RRkJKNEdxL3lLY0JYNlFDQk13OVRTRyta?=
 =?utf-8?B?Q2FBTEFaVVF5djFtcWh2RzY1VVNzRTVZLzNwOXBkek5QRFV5SSt4UUJSaTFV?=
 =?utf-8?B?NGU4dWdmRnNlM1p5TFV2S1RZUkprb3VTR0Vrb0h2bmpKQmxCK01zT0MzR2RQ?=
 =?utf-8?B?QjVIRkJKb2U5K29EYVhKQ3pzS2I1LzJXcVRPNnI0RmRkUWpEOGFUc3BpaXoz?=
 =?utf-8?B?SXlIM3dnRSswZGI5TnB3QUxUVEkzRUQzYjNlL0duWkQ4enRFdFNSdUlxUm9D?=
 =?utf-8?B?NkhzS2p6TVBjeTRYVlRPa2tVeHV6STdpMHpvQldrOWpEdkd4RWx6STdzeWRv?=
 =?utf-8?B?N3JPOFlCM3o3czRRVVFkcDhZSWhiaXI5MU85aGt4VkFxUDZUY2lUWHhIU3Jz?=
 =?utf-8?B?b2psRXVHUUNseDZUaDhPV3FyUVdQOWZvQjQ2MUJORUluZEJDRzBVbTU0NVZw?=
 =?utf-8?Q?nMDkFekEDYA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZElDRzdvVmdFMm5la2xTajk1WWFJQUlwV0tFcjBMSUR5TmowRlhCcGpZYVRz?=
 =?utf-8?B?VVdjaENHeGlRRzdUUUlTVm92UmVCNm1SMjM1blQ2NXNKQncyLzF3UnFLSmFj?=
 =?utf-8?B?c1pNN1Fuc3gybzJwRTdVblIzVEcwQlFickFHNWFzM0xTSWF5a2hOMVdNTEVJ?=
 =?utf-8?B?N1VDNFR1Qll2ekFrSGFmNXozWGx0V0NCNVpKSndZMjBQZHNEekR4WTNIVDJQ?=
 =?utf-8?B?K3dYVUd6NHlJN0lLZzlDTmRMRFVJRjBDdUZpNTlLL3hyUXVBamY1aWI1MGhQ?=
 =?utf-8?B?SzRYbDNZb1VnSGpXbmh2TTY5QXR0NzQyTEF2Y00rcWFlaWJpVkhUKzZEY3Fk?=
 =?utf-8?B?aDJ3VXBUSmx0TkZlK0xXWC9vS2sveFpjVTBHckExTXF4b3JodWxMc0U4NnFP?=
 =?utf-8?B?ZDAxRjlRZDhGMVhsYXVlM0JoSFh4aU03QjJlQkIwYm1aaTNBTnRZOTY4MTRR?=
 =?utf-8?B?VkpHWWhUd0E1WWdMWWt0RmtLSFRUTTdzcUc0aFd0V3dRYk9vYXRSMkFuNTNu?=
 =?utf-8?B?bnNmV0Zwa0RWTnNmTzZidWtlRnpZN2dBN0JGcDY3ekVIRnQySjYwVzUyb2VQ?=
 =?utf-8?B?VmRDVFR0ejIyMHJoNm95Y2JGeGVOU2kyYjlMeDlDUUhHaUIzOFJNSWJjd3lJ?=
 =?utf-8?B?Nkg0TWl1VUlteXZKcUpQUFh4UlVwajVFMmYyVDJpRURXbE5UUzRQMWh5a21B?=
 =?utf-8?B?S1dzbmRkUzVzSU5jNUFhQ1B1N3VVcXJpRWVGdzhrUnYxY0lNcHBBNmpzUFVJ?=
 =?utf-8?B?UlhNYzB0SGx1Nm80RjNadnl2ZGV0aXJkVTBEdjFzK0ZlR2FsQmdmdmx2S1hY?=
 =?utf-8?B?ak1FSGhDZFV4ckNZMHcrRjUwcG5PdnBHZmR1cGxZSk05SDZMVFZBOVRZaFU4?=
 =?utf-8?B?REFTMG9RaWxkQWpGWmN2R2dINzBDVkxWN0d6SythZEVXcWlKd3d5dWlFdVI3?=
 =?utf-8?B?eHRTT2hCUGxpcUFCaDFNT2s3bEdJKzZFcC9uTURqQUxkN280N2JyWWpkRUta?=
 =?utf-8?B?aDlsMERwQTlucDZKVThVZE5rbWx5YktleUR6cVdVSElnbTBNNGp5MDQxRlBj?=
 =?utf-8?B?N0hsSzNqQm9CQ0tvdCt1a3RDMjlSNjZRaXc5MGZkbi8vMHFRVzE0VHdHWUU3?=
 =?utf-8?B?bXpScWRkaU5FeHFvSVY2ZDNMdXN4allYc2oyMzM5MjVRcG04Tm5aWWU0TDJx?=
 =?utf-8?B?YUY4ckNNK2FCNThIZEVCTk9KUUFHaHhPdDBYWUxoaTdDbCtJMU5zbHdybDEy?=
 =?utf-8?B?dk5rU3ZKMlV2eUxRMndEYnk4elU5d29OcUZuSVg2SGllL1AxVzd1MFR4KytC?=
 =?utf-8?B?YUtMMXpWVnArUlBWZ2J2RlV5YjlVRUdpU00vekxGMU5HcVJCbEdPbE1JQXc2?=
 =?utf-8?B?T1JQNjRyekozaXRUd1NQRmMyQm9DMEZjVjNlcHpSMEhRTGUvd1lPQUFmczhl?=
 =?utf-8?B?VFhoMzR0L3lEaTU5dGV3TllDNXY1aHZXeEthdlg3akxSOTJmUlZ0U0R0amVm?=
 =?utf-8?B?b2pZNnlsbHVxWTd3Z0NPVi9ZSS95T1REVUZLRGJMY2ExYVlRN2dhWjVqbTQr?=
 =?utf-8?B?L3l2WTAvQXdQaFRhQXhteGtGdGdKdFZwSVlkNXBtdUJURlUvVzVQbjJhaGlM?=
 =?utf-8?B?c0J4U0tjbEVwcnc2U2M1dWorMkVJMGlwL2NJaHNXQ0lPekRUV0ROR0ZRZWsx?=
 =?utf-8?B?NUNmWGhoaHdXK3NEMXBtTHZQREtaRDkrcXZidGFzVkRDdTlIZWtxV2tQbDRz?=
 =?utf-8?B?TnU5Y1FMVU50bXRqRnNqdmxqZXRlV1VDVGR0TFpBNDRUQXZmeDJmN0w4ckhP?=
 =?utf-8?B?TUxHRWhZNTdIa3VvcC91c2N0Um1Ld0gyUU1XZTM2dEVFTDVUVVdXWnVuOWQ1?=
 =?utf-8?B?VEQ3MXdrU2c5NkVkRXdEYmtJdG9iYW96NnFPelovc3c0RkJSVVBCUkVtZkwy?=
 =?utf-8?B?RERudjZCYjZYRU53YU9sQVc2Y1lRTm8zSTFFWnp3d21OVUIrSzBTeHNRSy9D?=
 =?utf-8?B?SGRKUTQ0WUVpdE5zdmpTTmlkUjd4NjVoWWFYYnNmY2Q5ZDdVbUhRUGoxYlI4?=
 =?utf-8?B?Zyt2UUtrMjFHd2Fua2ZZeDN1OUxPNE8yVFpLN3ZBUjRBWW4wNXF0WUlwWmhm?=
 =?utf-8?B?Umt3U0tMRnd1TitHV3lLZDMxeGx3Q1l6amFLZmpPSXdINXNQKzYvUXVQNU5o?=
 =?utf-8?B?V3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2f505e2-435a-438c-961b-08ddc5d3a42a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 08:18:14.0550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Znj/NlXTHuCwxY8DaUMFtF1nzgPF3s78JgiNApYpIyNL+8rEgRr9dUlV1XU9rI7CqnDSTN+p6+s0V0pk/wLkuZ/GWW27KX/fnA6YtzjSgJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4807
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

In general, kernel structures should be allocated in the kernel-dedicated
VRAM region. However, userspace context data - while used by the kernel -
does not need to reside there.
Let's force the allocation of such data in the general-purpose VRAM region
accessible to userspace.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 7 +++++--
 drivers/gpu/drm/xe/xe_lrc.c        | 3 +++
 drivers/gpu/drm/xe/xe_lrc.h        | 5 +++--
 drivers/gpu/drm/xe/xe_pt.c         | 2 +-
 4 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 8991b4aed440..abd29191186e 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -112,7 +112,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	return q;
 }
 
-static int __xe_exec_queue_init(struct xe_exec_queue *q)
+static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 {
 	int i, err;
 	u32 flags = 0;
@@ -131,6 +131,9 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 			flags |= XE_LRC_CREATE_RUNALONE;
 	}
 
+	if (!(exec_queue_flags & EXEC_QUEUE_FLAG_KERNEL))
+		flags |= XE_LRC_CREATE_USER_CTX;
+
 	for (i = 0; i < q->width; ++i) {
 		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec, flags);
 		if (IS_ERR(q->lrc[i])) {
@@ -167,7 +170,7 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
 	if (IS_ERR(q))
 		return q;
 
-	err = __xe_exec_queue_init(q);
+	err = __xe_exec_queue_init(q, flags);
 	if (err)
 		goto err_post_alloc;
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 6d38411bdeba..ed53f8e2448b 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1203,6 +1203,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	if (vm && vm->xef) /* userspace */
 		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
 
+	if (init_flags & XE_LRC_CREATE_USER_CTX)
+		bo_flags |= XE_BO_FLAG_FORCE_USER_VRAM;
+
 	lrc->bo = xe_bo_create_pin_map(xe, tile, NULL, bo_size,
 				       ttm_bo_type_kernel,
 				       bo_flags);
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index b6c8053c581b..57f661aa9b1c 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -42,8 +42,9 @@ struct xe_lrc_snapshot {
 #define LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR (0x34 * 4)
 #define LRC_PPHWSP_PXP_INVAL_SCRATCH_ADDR (0x40 * 4)
 
-#define XE_LRC_CREATE_RUNALONE 0x1
-#define XE_LRC_CREATE_PXP 0x2
+#define XE_LRC_CREATE_RUNALONE		BIT(0)
+#define XE_LRC_CREATE_PXP		BIT(1)
+#define XE_LRC_CREATE_USER_CTX		BIT(2)
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 			     u32 ring_size, u16 msix_vec, u32 flags);
 void xe_lrc_destroy(struct kref *ref);
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index c8e63bd23300..a6c5f810c815 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -120,7 +120,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
 		   XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE |
 		   XE_BO_FLAG_NO_RESV_EVICT | XE_BO_FLAG_PAGETABLE;
 	if (vm->xef) /* userspace */
-		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
+		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE | XE_BO_FLAG_FORCE_USER_VRAM;
 
 	pt->level = level;
 	bo = xe_bo_create_pin_map(vm->xe, tile, vm, SZ_4K,
-- 
2.34.1

