Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB3EC4451C
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 09:31:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD6BB10E745;
	Tue, 21 Jul 2026 09:31:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i0sJUGhg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D3910E745
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 09:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784626302; x=1816162302;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ZtEqUDeUmwoNgFHHJBPJ+I4kbV67ox6FNkYXWiAO5z8=;
 b=i0sJUGhgZSdKL1TQsW90Tg2WRbiv2REn1OCkBRupXMfeEBdU4sOMgXKZ
 cJOnLQOcDaiR69erkz1KS890ZELpuUhO9cjW3IPqSpHBUvdSwGmTx1Pxm
 YqsFSb2zfHYdLlVg4EsQAorbl2oXcwEkEEQo9DiRGGfTK8Egjs5K4WMAx
 8JceiczrPdCZH9nigfWs9LU6llZaJ8reKGDwk+Su0Zgso7GVY/Cg6a+LV
 TI6V7p1cCZ8P3rmIZjawH1ZX6C0+xuBxqE/DWtW+dXEL1BINMvyUlcQ5x
 XenHeDDmwW/sBoJsupiKxNMY77xBLN5ygTBVZbZtiCYCjrSTCdfy/8rlZ A==;
X-CSE-ConnectionGUID: YZf0lYzdQOq26JVS8j9Tdw==
X-CSE-MsgGUID: HR7EpTlXSH+wlsAyyMbryw==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="89112739"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="89112739"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 02:31:42 -0700
X-CSE-ConnectionGUID: LXAyR4UuT+6HLqI65CMDww==
X-CSE-MsgGUID: nIPIxI6JRwqCs66FT67tEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="251384412"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 02:31:42 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 02:31:41 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 02:31:41 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.51)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 02:31:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qbgL1W2BIkm/BAZHrqxPIFTLvl73NThO7o+wVfFDggOw8Ix8vu1kJ86XOAhJQbJCZU1IDgVcTpQwT7F7qJmOTz+xEXHMerd998HHfg1LGuptibqDtDMyiBh7LOW0tVKL52qlX+JXBB0yheghUWvAsYEoEvTPuzb6DUlde7PE43ei4DIOT/ExxVSzNqQcvht+Icwvzb1Yzq5JZQCjnRPjKGA3yHO3smaugLi8Wp4iBUNU/KnAanQuxIHDJ2otkeTNcoSFAg2ssBlx5r+0t2jv9Dkeweidpfn/xWebBfExHRXOw/wuJaa+cVzYPFtuhSn7Pf8ohwzGhM+Mz4tUl/zOnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3P21o9bir91xSaXDe4Cu1GMv+94wjyNJFcUhn45XEIo=;
 b=K4Kc8GvB14ogLeGAPZTNAY88o6DqmyVAdig0kUlBV3Jrgv629Gzg7j4hwXKPurOljFiw5L+OnMoknYi34crcssLwu+cwsDQ6gd+v6o9c6TmS+aeelcnTelBrRUfWQwEkE0sF8WvAYv3TAf37IGNXO89Udm0wagifkI0+JyuPAKRD78PY+gBdHlmhxvwIx6dh2mBF/pSK+W8fsWbU6ehM4dH+4EAzzZDi0UcigtInAD+4/l9PyR4kAWYp9zfjh6WiecrCjAoiYEWY/h7YumpyfIocp1/pBBUQo6FZLRK+XeGDQxMLtNc3b4Kgyq2dVmot+wrk/+kxJowdJtNcwC/raw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SJ5PPF9FBA0498D.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::848) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 09:31:39 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 09:31:39 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 1/2] drm/xe: Add dbg_ratelimited printk wrappers
Date: Tue, 21 Jul 2026 11:31:15 +0200
Message-ID: <20260721093116.4011940-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260721093116.4011940-1-piotr.piorkowski@intel.com>
References: <20260721093116.4011940-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIUP296CA0087.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35c::9) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SJ5PPF9FBA0498D:EE_
X-MS-Office365-Filtering-Correlation-Id: b767e102-2b94-41e9-b14d-08dee70addac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 0IrmrzolnQ6DR4gkiXciTfBzcm9hb2e1VWJUqxY1Jv7Ps0oRhe5xZV4zsEZbflSIW0DHGSoJp+q/HlZBQJp5RpJDTn1Hgmn1I2sMMIWrH+W1nGipJCvky71Mosu/s070/xd54zcrIp40DqCjtsTt/RiUJHLYVHRNNlBWPjMFlwpkvtxqKJDUrIe4d4+d5lnbSZxdKRlwplB/UWY9vemeTN4TNZxtvd6zybVoK+Ht1VoV1RvA2NBT16xMF98pKKoZMxCnO4iwJ7lcNfKzvhgbGRoquQIR1jg5EN+HXZjCdgxK1pC169jH2cwKaCKZr95Jb2FOpVd2pa8U3Wdv6Ud5S5xKvn/KkQPUo9JFbY/aAlg0e4o5tNIJMKIVNYXnVaMSihglnUh2bBv8a083Qb4eReNhmH8d13QZXcNt+FNBRhW2DPy9KoyG/6DU+Fvl/620XT8+4pOVEcMfVl3qj5x3Y9hkdRiYAjuOk9m5hdKpoD6Pt/BC4yoy1c0xAi75iAMPOOxB30vQgUQRARNp1UlSUWYxgd2GbM7DsJ3QWFaoDpErpMRvRDaibNCbDJxkITlEflJ/NeYhcPybdKxrQEgXi7Gao31tYxXzmwxJxQFu9+g0K4w8wasbx+nzNWTUsr7hXVmDvlOZF6KCkCA87y1gI+Ejb8T3nPcDk/VYRV3IoTI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXkwcHd4d3RDL1RxZ3lvYTk5SHJvWVd5cnF6cWEvS0RWS2lvR2daZkg2OVJr?=
 =?utf-8?B?V1EyQWJvQmE1M1BXc1JGV0hpdzFpNTl2YzM3UzBsZTJzaXhaVElKU2RQUW8w?=
 =?utf-8?B?NUJrajErYnhFMmZXVTJybkJEU2ZJOEhSM3RySFdiUUY1UUcySUNYNW1pVElE?=
 =?utf-8?B?MEpkN2N3NTVnUTJKdms1TFRPUUdyd0ZLRmw3OVhxYkNGeHc0MDZud2d6T3h0?=
 =?utf-8?B?Q2Q1aDZYT1lpaEh4eWluMzFEdzlodjR3SVZIaWQyTXhJaHZKWjFaM2dub01T?=
 =?utf-8?B?WmVIMjF6ejNFUHRjb1I5U0xBQWVtMmlhMXYzMy9zWm4wbmlSb3FxZSs5WEx6?=
 =?utf-8?B?UmJ5TzAxZjBxUDZNdytqeWJ2Y3JpUGFYT0lEVTAvSjJQQjhDVlV4dnhXdG1s?=
 =?utf-8?B?UjJIckt5ZEF4V0lNMlMyMGJKb0QyZUZGQTZqNGZSdUkxQWFxd04xK2JoNkpJ?=
 =?utf-8?B?c3hwUE44OVBpVHc5ODNaY0w1ais2ekJNbUh4bkFRVjU4QitFcW41QlhGZTRw?=
 =?utf-8?B?eVFnK0djaytlM2NwQnE3SHV5d2hFd2prSzRiL3hPYTBiQ3dVK2U3MGVZckFm?=
 =?utf-8?B?NXlKREZRemI2ajlpanBXL1NGU0JqU2U0RnpwdXpETmI2WWNsR3lzN1d5L2xK?=
 =?utf-8?B?dWg3L3NEUVIrVG1OaVVqenIrQklMR2VYZ0EwOC9JODhJRVhKMU94ZHZoY2hx?=
 =?utf-8?B?MWtRL3MyUWRZY1YxTU5lRDFySFhORUFUV0g4bXhMZ0NacVFFbTRTMEJmVHZM?=
 =?utf-8?B?YWF0ZzZtWStHZFhoVkpLcXlTRFN4TWpBRklvN0lleElYYk5mZGFaY0hZT1hz?=
 =?utf-8?B?eFJjWmFsc2QreGw0WlVkYU5sd2hPbzRJNGtpeTlXbWUwSU81eUdFdWZpY2VJ?=
 =?utf-8?B?VEIzZFRZbDBJMXRWNlRNU21rWTIzNXFvM2lSbEk1L1ZMbW95SW5LUUgzNk1O?=
 =?utf-8?B?YVRMUTlMUENwT0JQNzNsUC9QUSt5SzBPM0JxOFZseVJ2TXRINHZJck1hRzFr?=
 =?utf-8?B?NFQ1ZzNVbWo2VEplSENIMzh2SE9sR2lod0ZlRmlOMlVYcFhLeHBqN0hWTVp3?=
 =?utf-8?B?Z3dHSVBzVzcycjNNZTJ6SEFheG1SWGd4d1lNbFdjbE5ZTmRVUExNV3RhdWho?=
 =?utf-8?B?Yy9CbGszb09IV0ZPWWFXNGJ2b2svQTFTRFBHVmJVZkRQa0ZkcCtOL0xvdVhn?=
 =?utf-8?B?L0pRNXFwY1hwTzhvUlBFSkJXMC9GRFZjUE9Sb1UxdWVoUDBpUzduSjZubUdu?=
 =?utf-8?B?S01EdG44L2xXcldrNENSUTNReERhai9JMDJEejNkRUlwTjhQRjVYSXBKNlVR?=
 =?utf-8?B?WGtJNElCZ0hHZHd3Ui9JYTJEVC9kdHMxWnFvbUR0cGdUc2hZZHFORHJqcENo?=
 =?utf-8?B?NlN6QXFCa1dCb1l6S0VJeHBOVGZxZ3RHMzQvS2YzZ3NFVlZEc2oxWi9EbE81?=
 =?utf-8?B?VjJRMzRmTlBDQWxndXUxMkZ2WXB1UWVmU1V5d3JNa1hiVHVkNlRjOWV5aWdF?=
 =?utf-8?B?dE9TTjJ2d2g3MjF4ZUxEa3pFNjdXQW9Obi9UZlE5emNva0dUOXFlSk0xd0da?=
 =?utf-8?B?N3pYNjRjZ3FFUjNGUS9qWFhPOWFZUmt5N2FUZWFPWTVyMXlMNkt2MWxmcTBV?=
 =?utf-8?B?R1VZUmZYUFp6NzVCOGVMR1l1T1ovNE1tODRGVDhkOXA5S2h6Rk5iODVSUktB?=
 =?utf-8?B?VkxWbXhxR2tOQlBVYU1Tejk3aVZDNldoRjgrTEU3bHRhNTJtaXdDMlg1Qkoz?=
 =?utf-8?B?UzdrL29abnh4dzU3ODNiT0t6SnNJNXpVMFVlanpEV0dZTnNYQ3BING1nNGtu?=
 =?utf-8?B?NmRBcTZmWHlUR0pMY1BwcFdPTDRpbDltWFpMcE9MV1Jia3ZxaGsxeEZaS29s?=
 =?utf-8?B?MTBGU3JJaEdDTjR4Z1FGZHJYMWVNT1I2Q3NmQ1h5ekxINGhHU3UwRFlKRmsy?=
 =?utf-8?B?eE96WkRLVHpsbXpBSUJDYllvbk9VYTIvWTRCQXA2djhOamN0MWN3bVV5QURR?=
 =?utf-8?B?TVNyOGdGM2Y2T1NQMjdSRDNERy9ZLzl0M0J5VCtkWkpseHZsRzg1aUdXMFlx?=
 =?utf-8?B?TjNscXhLeWhRVi9iRzdQekxHMDlsUzU0MVUweGFoeUxVVEV0M1gxZ0c2YTR5?=
 =?utf-8?B?UnpROG93K0liU3cwUlFzb1QwMXpzU1kvVisvQjZMb3VKZTM5cXZaRGtMOFZn?=
 =?utf-8?B?NGJqRHpFcUZYWXVuZW44QUtueTkrSGxoL2NQQ1BMMDlaSGI5UzZqZmtuL1l6?=
 =?utf-8?B?N3IySDNxNmlJZFhwK3NaMFQyV1BwRFJ0U2l0bDM4cFNPak9NdlJsWHlxUko1?=
 =?utf-8?B?NUNyTjZXbndsRW5seXh2U2JlMGxUMi8wckpWUGVldnYvZElzamluVFhSR3pU?=
 =?utf-8?Q?2S5J32nHNPuPrt0g=3D?=
X-Exchange-RoutingPolicyChecked: RFDOHDcDgtKAVLqPA9+JgRNpvpJw7L+x34MTOyGW0R4+8X22D4cwrNXjSuCCbIYI7oK1vX7C6MfQ/WOk885qNnPL6CWlz7dgzcTsJIFJSqrChWwvlgvjITA23p9ZV5PpDSTsHf61rrngOhir72w6GOu9YDroj/S25HbCnnH4w7rAyHSS9YIHYOiQOXMLDAm8KbAOOVjBta+XAi8uHyEFG/C97K1s5UurtQ77jhOKD4fSCRVJce1OqktyprCe6s/DtB4syM6twdtzdugYuiAlhqHx8N0B2okPjyERNk9x/PkQSNpbTNVTuGrTQUvugyW1tIo78W16aaOqbNp88hX/YA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b767e102-2b94-41e9-b14d-08dee70addac
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 09:31:38.9413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h69zS1J/WXPVjKzegPcL0JKb6FHJmME+8Bn8/MOTdkJEs78C5cwqBxpB/+bGL0siplIgHHa9rSe3NVGt4r0IINVmgt/nBQcIff1xbjX23TI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF9FBA0498D
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

Add dbg_ratelimited() wrappers for Xe logging helpers.

These wrappers provide a debug logging equivalent of the existing
rate-limited error messages and allow callers to limit repeated debug
prints to reduce log spam and makes debugging easier.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_printk.h         | 3 +++
 drivers/gpu/drm/xe/xe_gt_sriov_printk.h   | 3 +++
 drivers/gpu/drm/xe/xe_printk.h            | 3 +++
 drivers/gpu/drm/xe/xe_sriov_printk.h      | 3 +++
 drivers/gpu/drm/xe/xe_tile_printk.h       | 3 +++
 drivers/gpu/drm/xe/xe_tile_sriov_printk.h | 3 +++
 6 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
index 1313d32862db..1598098d2987 100644
--- a/drivers/gpu/drm/xe/xe_gt_printk.h
+++ b/drivers/gpu/drm/xe/xe_gt_printk.h
@@ -35,6 +35,9 @@
 #define xe_gt_dbg(_gt, _fmt, ...) \
 	xe_gt_printk((_gt), dbg, _fmt, ##__VA_ARGS__)
 
+#define xe_gt_dbg_ratelimited(_gt, _fmt, ...) \
+	xe_gt_printk((_gt), dbg_ratelimited, _fmt, ##__VA_ARGS__)
+
 #define xe_gt_WARN_type(_gt, _type, _condition, _fmt, ...) \
 	xe_tile_WARN##_type((_gt)->tile, _condition, _fmt, ## __VA_ARGS__)
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_printk.h b/drivers/gpu/drm/xe/xe_gt_sriov_printk.h
index d3457d608db8..ada0ee9f45e5 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_printk.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_printk.h
@@ -27,6 +27,9 @@
 #define xe_gt_sriov_dbg(_gt, _fmt, ...) \
 	__xe_gt_sriov_printk(_gt, dbg, _fmt, ##__VA_ARGS__)
 
+#define xe_gt_sriov_dbg_ratelimited(_gt, _fmt, ...) \
+	__xe_gt_sriov_printk(_gt, dbg_ratelimited, _fmt, ##__VA_ARGS__)
+
 /* for low level noisy debug messages */
 #ifdef CONFIG_DRM_XE_DEBUG_SRIOV
 #define xe_gt_sriov_dbg_verbose(_gt, _fmt, ...) xe_gt_sriov_dbg(_gt, _fmt, ##__VA_ARGS__)
diff --git a/drivers/gpu/drm/xe/xe_printk.h b/drivers/gpu/drm/xe/xe_printk.h
index c5be2385aa95..87f51d7edfa8 100644
--- a/drivers/gpu/drm/xe/xe_printk.h
+++ b/drivers/gpu/drm/xe/xe_printk.h
@@ -36,6 +36,9 @@
 #define xe_dbg(_xe, _fmt, ...) \
 	xe_printk((_xe), dbg, _fmt, ##__VA_ARGS__)
 
+#define xe_dbg_ratelimited(_xe, _fmt, ...) \
+	xe_printk((_xe), dbg_ratelimited, _fmt, ##__VA_ARGS__)
+
 #define xe_WARN_type(_xe, _type, _condition, _fmt, ...) \
 	drm_WARN##_type(&(_xe)->drm, _condition, _fmt, ## __VA_ARGS__)
 
diff --git a/drivers/gpu/drm/xe/xe_sriov_printk.h b/drivers/gpu/drm/xe/xe_sriov_printk.h
index 4c6b5c3d2190..5931c918655f 100644
--- a/drivers/gpu/drm/xe/xe_sriov_printk.h
+++ b/drivers/gpu/drm/xe/xe_sriov_printk.h
@@ -36,6 +36,9 @@
 #define xe_sriov_dbg(xe, fmt, ...) \
 	xe_sriov_printk((xe), dbg, fmt, ##__VA_ARGS__)
 
+#define xe_sriov_dbg_ratelimited(xe, fmt, ...) \
+	xe_sriov_printk((xe), dbg_ratelimited, fmt, ##__VA_ARGS__)
+
 /* for low level noisy debug messages */
 #ifdef CONFIG_DRM_XE_DEBUG_SRIOV
 #define xe_sriov_dbg_verbose(xe, fmt, ...) xe_sriov_dbg(xe, fmt, ##__VA_ARGS__)
diff --git a/drivers/gpu/drm/xe/xe_tile_printk.h b/drivers/gpu/drm/xe/xe_tile_printk.h
index 738433a764bd..c87c07e14fd1 100644
--- a/drivers/gpu/drm/xe/xe_tile_printk.h
+++ b/drivers/gpu/drm/xe/xe_tile_printk.h
@@ -34,6 +34,9 @@
 #define xe_tile_dbg(_tile, _fmt, ...) \
 	xe_tile_printk((_tile), dbg, _fmt, ##__VA_ARGS__)
 
+#define xe_tile_dbg_ratelimited(_tile, _fmt, ...) \
+	xe_tile_printk((_tile), dbg_ratelimited, _fmt, ##__VA_ARGS__)
+
 #define xe_tile_WARN_type(_tile, _type, _condition, _fmt, ...) \
 	xe_WARN##_type((_tile)->xe, _condition, _fmt, ## __VA_ARGS__)
 
diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_printk.h b/drivers/gpu/drm/xe/xe_tile_sriov_printk.h
index 68323512872c..c23e698bc8db 100644
--- a/drivers/gpu/drm/xe/xe_tile_sriov_printk.h
+++ b/drivers/gpu/drm/xe/xe_tile_sriov_printk.h
@@ -27,6 +27,9 @@
 #define xe_tile_sriov_dbg(_tile, _fmt, ...) \
 	xe_tile_sriov_printk(_tile, dbg, _fmt, ##__VA_ARGS__)
 
+#define xe_tile_sriov_dbg_ratelimited(_tile, _fmt, ...) \
+	xe_tile_sriov_printk(_tile, dbg_ratelimited, _fmt, ##__VA_ARGS__)
+
 #define xe_tile_sriov_dbg_verbose(_tile, _fmt, ...) \
 	xe_tile_sriov_printk(_tile, dbg_verbose, _fmt, ##__VA_ARGS__)
 
-- 
2.34.1

