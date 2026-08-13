Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DF7C5CFCF
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 17:20:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA98110E522;
	Thu, 13 Aug 2026 17:20:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fXjTvYhO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCBD210E522
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 17:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786641631; x=1818177631;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Qy8A3DD9YsccA+6WiZ3ApW762bqPOCdt3NBqkGHHtQw=;
 b=fXjTvYhO8QnjegkLNOEyH9wIS9MBWEwCMhhmTNNma6NSzMYIMn8saxWm
 Cjl8zkMncaf6jsmpkJbvv4uky4VkIYwYL/ujDjxAOftUnzbmYfqzMJt7t
 r+gTL+/waBkdF+5Z4ta/86T70eTvZ0Ci8qz+A1b1ieQv1I5gipUx/7PKU
 9Ao7zIZmuG6mSzNU9DAIw+RTPxGndQzAxZfmjeOtvyk/SPSFXv9p/mPVO
 Qss/QXuvstXC5G6jUtGbty1j2FBI8Yr0azOoLR4yCvu2Cdl9KwlmKOiAC
 K5sM8owODSxwCQ1a4LTNP/8P7R+nANZd+ub9+CdB0Gsj/EaI+/nJp9qQs Q==;
X-CSE-ConnectionGUID: HrBIa/fdRmuekImEiItUBw==
X-CSE-MsgGUID: UvDMrtcNR5aFIGrq4NdxBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87350069"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="87350069"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 10:20:30 -0700
X-CSE-ConnectionGUID: sNiwRmRITL2+Zxy/6HvckQ==
X-CSE-MsgGUID: If7odl2lSBm9hyKtCmIlvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="262678304"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 10:20:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 10:20:26 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 10:20:26 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.29) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 10:20:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sozrp8M0/zMtScgFdfHUuX577ItWFnAmeLdU55wRw/vcoeZin/xaQG6I99hZ7ZdoZCB5ossKRxEOc7e0h2Mqmr/9iEaLO65AR9BfU49S/uFX5hQSxsJKkwCQB393IFRAcpexNwXLKVd39Zrur/k3WHAVuJtx7kMVqHM1WFUcIw+RhKA4IDeP5Z5oQ7S3nzUSHcOAvBqe4Oph3eymbj2YQa0t8jxws0xYk1ptxOxlh2vR4bc/+htRQBnDdue7W5dQWZFJy2X98qi6RVGSuzBA3QENbP/fHfngNi1WKi8E88CUKmztZ1zlRHqRycdrp/FLYzzCZ0XipOHqxOlKaa0mGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rOXjHOshfELQ/vsg7RjLq5cPeKGhusiyQr2axb6A+7Q=;
 b=kWfNM7bUY+bHwlACxoTJ3oIEPWDy2ZcvsLcpuUoOoRHD2fYexWUFLLSnp8bFRgxARDoLHIKB0KrTtq0WGch7qqo6yacAP0mL9QovrcsmZosYyYx2nbuPeZ8CVA07y41uRWmhARYIn6K8NK651tV6gELouqli0FWUOe78OpHRsA61Su2ZIBQ17DqnkCNOe99+QT9n9dEhmvhGqPtaHCwn4y8PmOxGQoY86tLgcNAFD2Up0g7ylRgENsV4c3bfZuDC6VjfrurNPkfikJ9L4uQatcWCjHdl9P7qEbbuG62fN115oDKXXdo9nkoeHZX/exrTc9QS7/slOZsODMgqVyJUGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by CH3PR11MB7389.namprd11.prod.outlook.com (2603:10b6:610:14d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 17:20:21 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 17:20:21 +0000
Date: Thu, 13 Aug 2026 13:20:17 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>, Raag Jadav <raag.jadav@intel.com>, "Riana
 Tauro" <riana.tauro@intel.com>
Subject: Re: [PATCH v4 03/32] drm/xe/log: Introduce structured
 component/location identifiers
Message-ID: <an380YttikjOTigL@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260812191450.11690-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0057.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::32) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|CH3PR11MB7389:EE_
X-MS-Office365-Filtering-Correlation-Id: 8593fa87-8cc4-43ec-3635-08def95f2747
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|11063799006|56012099006|6133799003|10067099003|18002099003|22082099003|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info: u2lk9TVONCWfTq5bNnHUS4QEtciUacBmoZAZf2/lr5fg5kumGNKwNqkTsOqazKQfr7v1ASNoDzLGiOfsW/UwdYy3SYD6rQ6bqlz6ds5oN9y7+J63fa7GbFjY4D9gex0M5J7YWZjc9uw2pGXUlH2ry0J1pzPO0UPZrO8oqRN9lpxyeCpfnOQORXsi8TA+zCqXo1pnhHexa69B+K+aAwNClchWG0W7GrZFECZpsPrrdvOP+M/hz8j4RipLQvUaYTRSdOA4kZBO8Px9L1LdDTnkJZ8VE4MPe6hV8K5XF9WOGryVwIqJS0Mx5V9anInYj39alfY0tKtfZKoeUPNSWIeQI9v2TqcDQa+ixYhb3cIi8QxrWZfwq9/xWXuwyPIOQkhj7kb99bV8T1TENaqMdMTK+mCIuR/weOw+kPh0V6LbvRe+7u9tcgfXq4jfaLwZqCj5MnaJ7TBgMHh/vSlT8cq1sKb0DAoJYTBIeEVmpREqcGza0NQNUj/8FrpXsZZMkEo8phgllK5P7VspFcnn1FYXVujQXCJb99wVgtsSWbvUGWLzQK8j9xLmVqmSsEngzbP78T4/7TVhrg4C6oQUg7uSmhWKSqlgrXHbyPidyWYNpzp2Ov/oymDdnYRFvYJM64weu0qz5TbemRicaf4Lu7Xugqrfex7ghPkRlzy9nHQ3U4k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(11063799006)(56012099006)(6133799003)(10067099003)(18002099003)(22082099003)(3023799007)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGlub2ROSU5BSkF2Tzg2OFNCZFdMeHN2Z1NIdTdFM0hEUjkxVVplaVBoVXhQ?=
 =?utf-8?B?Z3FCb1R4Rnc5cmpSc090NGlta1dOb0hmSE9YY0ZuL0JtcnBzVjFCWHVPK2N6?=
 =?utf-8?B?OENJWFJhVjBNTGU2eFZPcXFXeWJvN1BGZWc2ZFQvQnRLc0Z4RTdILzRNcFZD?=
 =?utf-8?B?NGJtTFhIeUM2Y1pGK29IWTJ2c0RRS3hZQjV6Wm5kc2k4UmpzZkpvTDhJUHpY?=
 =?utf-8?B?eDFiNXRmL3VQVXB0NnJjcE5zMC90cUdiRnFsY0kvaGJaSnJ4RkxPOW5oNE1q?=
 =?utf-8?B?QmxQWlg4WElBUThRVm00Nms3V2dVRCtRSEhJQTZ0cUdJM2pDNkJ5TGN4ck9l?=
 =?utf-8?B?MmxJUHFibzRnUHRRdStQc2FSME9RUU14ZWxtWUVRZWVqaUNMWUczcWlBb08y?=
 =?utf-8?B?VE85cTVPY05zQXo4ZVJPRThrNWE3Vmx2NVZKRkFJZkppL1RNOGNPTkdydmIy?=
 =?utf-8?B?em0rSnJaVW8ydlc5VmlCNk96VUQwQmlXU0RmRDZNUTcwYWtkeXZGOUZXckcw?=
 =?utf-8?B?eFg0OTNpTUhqeXd5ZnFDdW5QeDB4TFZROHBnTVhsVHFDaVlJeGNMVXpuMTQx?=
 =?utf-8?B?azdNUHdnS1hRZVFrT3JrWWRscUdLZFdnckFDa05WSHFXL0NhZ0ovNWVsQ2E2?=
 =?utf-8?B?YmVHaUVub2dDaUZNenl3TkJmRG93Z2Q2RmhaVi9WZnE2RHovQllQc09jVUJB?=
 =?utf-8?B?cVdnNVQzcDZJWXlvamczMlVSa2dIV25SOHZlK3grR28yMHJIcmtqSDR4SG1Q?=
 =?utf-8?B?bHBlWG1QTkFxekxDMTRuVDErd1k2azhPZjVodHQwejQ5MjNDazVnQTl4TFBN?=
 =?utf-8?B?TGRoNmk5b1BZRlZZNXNPL2txMUEwZHlFdTBQSWpDR3UwaS9Db1JDSzkzTlEr?=
 =?utf-8?B?Q2YwR2t0MksxZVBZWlBGRi9ibTNveU5QVHRrRXo1YnVCb0x0eDZ1UnNydC9j?=
 =?utf-8?B?UFhzaFVDODdzMkdvSjFSMGhyMU54NWJpRy8yZUxkVVVUcjRVZG8xanpkRndl?=
 =?utf-8?B?K29rUjBZd0dEbjNPY042bmVCM2hYNjM4Ylh6NjU1cXNQRVhNKzVHR2JnVHYv?=
 =?utf-8?B?N2ExQ29ZU1IyVHRQTThWNGlyTEV0MjgySXV3dE1mNXNKZ3Y2MFI1MG1qNkpX?=
 =?utf-8?B?eXFWY3BLRWQ4aW1wQW5zWGE3bVZYUEZ1WVZDdU5lbzlIUzUweDlYN2hma0xN?=
 =?utf-8?B?bWk5RGF1RnVwbjZ4WjhzUlR3ZE9lYkVVK0RQSW1zR0RWUElzbFZSQ2RXc245?=
 =?utf-8?B?L1I0Uy96ZCticE9aT2dZYndldTJTU1pkaFljT2t1TUdPL2dHK0I2a3hyRTR2?=
 =?utf-8?B?b3ZrWW5zY2Y3L2Vkd3ZRc1BYaGxQNDJraW5nTElNcVh6VlRqcmtBUW1ubVFp?=
 =?utf-8?B?b0N4Z0F0K3h4cno1dStBSVVxd2VhOFQwVmUwNk1ndTFTQ2t0ZVViZC96RC9h?=
 =?utf-8?B?bE51eHdQanZIQU85MjJaWGZFS0JFenplUkUyWkFZVjhJL2loSVc1cTJScXlx?=
 =?utf-8?B?SzY3OEpuT2RxN0FocU52SEIvaFpoRzBiZGk0QmJQSFBUaDNFZzZEY0JId2FG?=
 =?utf-8?B?TXNQOFZ5a0d3K3ZZSUdCSCtTUTNNQmkxWXlkU0JkUVd0cFdyQVhhRWlMbWFy?=
 =?utf-8?B?VzdMWlB6S2IzTVBMY0ZCcmVXVnFqVHFQS2gwWVc0VUJXWC9tdldyM0JBandD?=
 =?utf-8?B?RU9oMGRtZGR2am9vTkdQeVVyYW1yQ0xNeGxiY1RwdE9vaXBNLytlcGdYaUky?=
 =?utf-8?B?ZFBOcGZ5eVMrekxQSGNBSkV3bFJVZWFxQS8wKzk3WHpEWHVOdHVnQmQ2Nk9O?=
 =?utf-8?B?V01rajJwVjMxeFFFVW9rczNycG0xTUYwditwNWtDRW1IaDlUNFNTNUozcEJC?=
 =?utf-8?B?VWF6MS9IRWY2d0NtTndYTWRib3N2RVRaRm1NSmxOYmRxLzZsOGJnbjE0VFlt?=
 =?utf-8?B?S0NDVUFvclRZSXltY0xwbnhMbzJJK0N6U3dHZzlSNCtndnVBZEtmdmo3UWJW?=
 =?utf-8?B?VXpYQit4cjFGRjJ0TEtHUzRpODdTZ3hiT0VjVmVVdEFYL3grWHpBeWh5ejJS?=
 =?utf-8?B?NUxqcHBNTXp6MUhrdndzOEx2ZTJDQUpZWk5FL1dZUUtMeTNQNTJhNUx2em01?=
 =?utf-8?B?UFFMbS9ndVAySzZrY1NKbWwvaGYzY0c2NHlXUmV4Z0JoT2hrT013c0d3QXJi?=
 =?utf-8?B?T3dQQkpTKzhuSlowZEIrdzZjaVZ0WVJCWDUyTlZjOHMxRjJPUnRjQzhIMzFk?=
 =?utf-8?B?ZTRzMGdKV0NSWlkrbmc2YldwejB2dzNkdFlFNHVCdm5ELzhXbUN3dFdXbDlQ?=
 =?utf-8?B?ME5HYm9BM0JySTh6cy9UclovZGt4RXhRY2R5d0o0d0d0aE4rNUJyZz09?=
X-Exchange-RoutingPolicyChecked: P49H6C7tXLO5QEKmCoEsBDaW5AhOvs6Q6XRnZp1/YnhX07mBNSeWt9rGBrB/EUHWiZsAW+6KAcw78ACriQ6eHx51jHv4KiBs3ShAakMm2ydzkkP7KXEuGinorLYBWbEVPPFdIv92M7N0BZ4n4TTwBmrIrPVI6YYjxC71qviAYjhpRMamJpVBrrF090f2egzhTZnEfcGsF2XBCNcydMIJ+NT9EqVub6Nw1rNNL2QOE4gQLJh+7teqX1ecYn7duEwB7k7wp41HlhJV64BGBcbYiHNVOBMx8VKyqHJESQ42lqSYI43FahV9TBEzIR+ZCuluLTzhDQC8XsmDnzfuahwWWg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8593fa87-8cc4-43ec-3635-08def95f2747
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 17:20:21.2313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oCSiN4yxxC5ooqOhThCrDeEr0HNR4UODtiPvFmUEJN2W1E4vhR3i16Xm/eJ8sGWoJ70RdVKVkpYUXQQnA/CdKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7389
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

On Wed, Aug 12, 2026 at 09:14:19PM +0200, Michal Wajdeczko wrote:
> Introduce structured identifiers for each component type that
> could emit a SIGID log entry and for their locations. We plan
> to store those IDs in the CPER records for better filtering.
> Define also structured identifiers for the supported locations.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: fix typo, define reserved ids (Michal)
> v3: fix kernel-doc to match code (Sashiko)
> v4: update comment (Michal)
> ---
>  drivers/gpu/drm/xe/abi/xe_log_abi.h | 187 ++++++++++++++++++++++++++++
>  1 file changed, 187 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/abi/xe_log_abi.h
> 
> diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h b/drivers/gpu/drm/xe/abi/xe_log_abi.h
> new file mode 100644
> index 000000000000..92547805326f
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
> @@ -0,0 +1,187 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _ABI_XE_LOG_ABI_H_
> +#define _ABI_XE_LOG_ABI_H_
> +
> +#include <linux/bits.h>
> +#include <linux/bitfield.h>
> +
> +#include "abi/xe_sigid_abi.h"
> +
> +/**
> + * enum xe_log_component_bits - bits for components structure definitions
> + *
> + * Component identifiers are structured based on::
> + *
> + *     COMPONENT = CLASS(8b).TYPE(8b)
> + *
> + * and the structure looks like this::
> + *
> + *     ├── SYSTEM(0)
> + *     │   └── ...
> + *     ├── DRIVER(1)
> + *     │   └── ...
> + *     ├── FEATURE(2)
> + *     │   └── ...
> + *     ├── FIRMWARE(4)
> + *     │   └── ...
> + *     └── HARDWARE(8)
> + *         └── ...
> + *
> + * Examples::
> + *
> + *     COMPONENT(0.type) = SYSTEM.type = system component
> + *     COMPONENT(1.type) = DRIVER.type = driver core component
> + *     COMPONENT(3.type) = DRIVER_FEATURE.type = driver feature
> + *     COMPONENT(5.type) = DRIVER_FIRMWARE.type = firmware driver component
> + *     COMPONENT(9.type) = DRIVER_HARDWARE.type = hardware driver component
> + *
> + */
> +enum xe_log_component_bits {
> +	/* private: */
> +	XE_LOG_COMPONENT_CLASS_MASK = GENMASK_U16(7, 0),
> +	XE_LOG_COMPONENT_TYPE_MASK = GENMASK_U16(15, 8),
> +	/* private: component classes */
> +	XE_LOG_COMPONENT_CLASS_SYSTEM = 0u,
> +	XE_LOG_COMPONENT_CLASS_DRIVER = 1u,
> +	XE_LOG_COMPONENT_CLASS_FEATURE = 2u,
> +	XE_LOG_COMPONENT_CLASS_FIRMWARE = 4u,
> +	XE_LOG_COMPONENT_CLASS_HARDWARE = 8u,
> +	XE_LOG_COMPONENT_CLASS_DRIVER_FEATURE = XE_LOG_COMPONENT_CLASS_DRIVER |
> +						XE_LOG_COMPONENT_CLASS_FEATURE,
> +	XE_LOG_COMPONENT_CLASS_DRIVER_FIRMWARE = XE_LOG_COMPONENT_CLASS_DRIVER |
> +						 XE_LOG_COMPONENT_CLASS_FIRMWARE,
> +	XE_LOG_COMPONENT_CLASS_DRIVER_HARDWARE = XE_LOG_COMPONENT_CLASS_DRIVER |
> +						 XE_LOG_COMPONENT_CLASS_HARDWARE,
> +	/* private: reserved identifiers */
> +	XE_LOG_COMPONENT_NONE = 0u,
> +};
> +
> +#define MAKE_XE_LOG_COMPONENT(_CLASS, type) \
> +	(FIELD_PREP_CONST(XE_LOG_COMPONENT_CLASS_MASK, \
> +			  XE_LOG_COMPONENT_CLASS_##_CLASS) | \
> +	 FIELD_PREP_CONST(XE_LOG_COMPONENT_TYPE_MASK, (type)))
> +
> +/**
> + * enum xe_log_location_bits - bits for location structure definitions
> + *
> + * Location identifiers are structured based on::
> + *
> + *     LOCATION = TYPE(8b).ID(8b)
> + *
> + * and the structure looks like this::
> + *
> + *     ├── DEVICE(0)
> + *     │   └── MBZ(0)
> + *     ├── TILE(1)
> + *     │   ├── Tile0(0)
> + *     │   ├── ...
> + *     │   └── TileN(n)
> + *     ├── GT(1)
> + *     │   ├── GT0(0)
> + *     │   ├── ...
> + *     │   └── GTn(n)
> + *     └── ...
> + *
> + * Examples::
> + *
> + *     LOCATION(0.0) = NONE
> + *     LOCATION(1.0) = DEVICE.0 = "Device"
> + *     LOCATION(2.1) = TILE.1 = "Tile1"
> + *     LOCATION(3.2) = GT.2 = "GT2"
> + *
> + */
> +enum xe_log_location_bits {
> +	/* private: */
> +	XE_LOG_LOCATION_TYPE_MASK = GENMASK_U16(7, 0),
> +	XE_LOG_LOCATION_ID_MASK = GENMASK_U16(15, 8),
> +	/* private: location types */
> +	XE_LOG_LOCATION_TYPE_DEVICE = 1u,
> +	XE_LOG_LOCATION_TYPE_TILE = 2u,
> +	XE_LOG_LOCATION_TYPE_GT = 3u,
> +	/* private: reserved identifiers */
> +	XE_LOG_LOCATION_NONE = 0u,
> +};
> +
> +#define PREP_XE_LOG_LOCATION(type, id) \
> +	(FIELD_PREP(XE_LOG_LOCATION_TYPE_MASK, (type)) | \
> +	 FIELD_PREP(XE_LOG_LOCATION_ID_MASK, (id)))
> +
> +#define MAKE_XE_LOG_LOCATION(_TYPE, id) \
> +	PREP_XE_LOG_LOCATION(XE_LOG_LOCATION_TYPE_##_TYPE, (id))
> +
> +/**
> + * DEFINE_XE_LOG_COMPONENTS() - Define log components.
> + * @define: name of the inner macro to expand.
> + *
> + * Use this super macro to define custom code for the log components.
> + * The following parameters are available for each component::
> + *
> + *     define(CLASS, ID, TAG, SIGID, NAME)
> + *
> + * where:
> + *
> + *     @CLASS is the component class name (without the XE_LOG_COMPONENT_CLASS_ prefix)
> + *     @ID is the unique component identifier within @CLASS
> + *     @TAG is unique component tag (across all components)
> + *     @SIGID is the default xe_sigid for the component (without the XE_SIGID_ prefix)
> + */
> +#define DEFINE_XE_LOG_COMPONENTS(define) \
> +	/* */									\
> +	define(SYSTEM, 1, PCI, SW, "Linux PCI Subsystem")			\

As we discussed offline, based on the review of the last patch of this series
it becomes clear that this PCI bucket should be IO_BUS.

Let's change this and keep my rv-b...

> +	define(SYSTEM, 2, DRM, SW, "DRM")					\
> +	/* */									\
> +	define(DRIVER, 1, XE, SW, "Xe Driver")					\
> +	define(DRIVER, 2, PROBE, PROBE, "Driver Initialization")		\
> +	define(DRIVER, 3, WEDGED, WEDGED, "Device Malfunction")			\
> +	define(DRIVER, 4, RTP, SW, "Register Table Processing")			\
> +	define(DRIVER, 5, WA, SW, "Workarounds")				\
> +	define(DRIVER, 6, PAGEFAULT, MEM_FAULT, "Page Fault")			\
> +	/* */									\
> +	define(DRIVER_HARDWARE, 1, REGS, IO_BUS, "Registers")			\
> +	define(DRIVER_HARDWARE, 2, GGTT, IO_BUS, "Global GTT")			\
> +	define(DRIVER_HARDWARE, 3, GT, GT_TDR, "Graphics Technology")		\
> +	define(DRIVER_HARDWARE, 4, LMTT, IO_BUS, "LMEM Translation Table")	\
> +	define(DRIVER_HARDWARE, 5, MEMIRQ, IO_BUS, "Memory Based IRQ")		\
> +	/* */									\
> +	define(DRIVER_FEATURE, 1, PF, SW, "SR-IOV Physical Function")		\
> +	define(DRIVER_FEATURE, 2, VF, SW, "SR-IOV Virtual Function")		\
> +	define(DRIVER_FEATURE, 3, SURVIVABILITY, SURVIVABILITY, "Survivability") \
> +	define(DRIVER_FEATURE, 4, RAS, SW, "Reliability, Accessibility, Serviceability") \
> +	/* */									\
> +	define(DRIVER_FIRMWARE, 1, GUC, RUNTIME_FW, "GuC")			\
> +	define(DRIVER_FIRMWARE, 2, HUC, RUNTIME_FW, "HuC")			\
> +	define(DRIVER_FIRMWARE, 3, GSC, RUNTIME_FW, "GSC")			\
> +	define(DRIVER_FIRMWARE, 16, PCODE, DEVICE_FW, "PCode")			\
> +	define(DRIVER_FIRMWARE, 17, SYSCTRL, DEVICE_FW, "System Controller")	\
> +	/* eod */
> +
> +/**
> + * enum xe_log_component_tags - TAGs of all supported components
> + */
> +enum xe_log_component_tags {
> +	/* private: */
> +#define MAKE_XE_LOG_COMPONENT_ENUM(_CLASS, _ID, _TAG, _SIG, _NAME) \
> +	XE_LOG_COMPONENT_##_TAG = MAKE_XE_LOG_COMPONENT(_CLASS, (_ID)), \
> +	XE_LOG_COMPONENT_##_CLASS##_##_ID = XE_LOG_COMPONENT_##_TAG, \
> +	/* eod */
> +	DEFINE_XE_LOG_COMPONENTS(MAKE_XE_LOG_COMPONENT_ENUM)
> +#undef MAKE_XE_LOG_COMPONENT_ENUM
> +};
> +
> +/**
> + * enum xe_log_component_sigids - SIGIDs of all supported components
> + */
> +enum xe_log_component_sigids {
> +	/* private: */
> +#define MAKE_XE_LOG_COMPONENT_SIGID(_CLASS, _ID, _TAG, _SIG, _NAME) \
> +	XE_LOG_COMPONENT_##_TAG##_SIGID = XE_SIGID_##_SIG, \
> +	/* eod */
> +	DEFINE_XE_LOG_COMPONENTS(MAKE_XE_LOG_COMPONENT_SIGID)
> +#undef MAKE_XE_LOG_COMPONENT_SIGID
> +};
> +
> +#endif
> -- 
> 2.47.1
> 
